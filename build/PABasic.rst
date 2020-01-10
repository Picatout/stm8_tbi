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
      008000 82 00 85 63             95     int cold_start
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
      00808E CD 88 94         [ 4]  149 	call print_registers
      008091 CD 8A BA         [ 4]  150 	call cmd_itf
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
      0080DB CD 89 45         [ 4]  189 	call prti24
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
      008100 CC 87 70         [ 2]  206 	jp warm_start
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
      00826E CD 98 11         [ 4]  448 	call incr_farptr
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
      008300 AE 89 24         [ 2]  616 	ldw x,#REG_EPC 
      008303 CD 88 60         [ 4]  617 	call prt_reg16 
                                    618 ; register CC 
      008306 7B 08            [ 1]  619 	ld a,(R_CC,sp)
      008308 AE 89 39         [ 2]  620 	ldw x,#REG_CC 
      00830B CD 88 38         [ 4]  621 	call prt_reg8 
                                    622 ; register A 
      00830E 7B 07            [ 1]  623 	ld a,(R_A,sp)
      008310 AE 89 34         [ 2]  624 	ldw x,#REG_A 
      008313 CD 88 38         [ 4]  625 	call prt_reg8 
                                    626 ; register X 
      008316 16 05            [ 2]  627 	ldw y,(R_X,sp)
      008318 AE 89 2F         [ 2]  628 	ldw x,#REG_X 
      00831B CD 88 60         [ 4]  629 	call prt_reg16 
                                    630 ; register Y 
      00831E 16 03            [ 2]  631 	ldw y,(R_Y,sp)
      008320 AE 89 2A         [ 2]  632 	ldw x,#REG_Y 
      008323 CD 88 60         [ 4]  633 	call prt_reg16 
                                    634 ; register SP 
      008326 90 96            [ 1]  635 	ldw y,sp
      008328 72 A9 00 08      [ 2]  636 	addw y,#6+ARG_OFS  
      00832C AE 89 3F         [ 2]  637 	ldw x,#REG_SP
      00832F CD 88 60         [ 4]  638 	call prt_reg16
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
      00836D CD 89 45         [ 4]  660 	call prti24 
      008370 A6 3A            [ 1]  661 	ld a,#': 
      008372 CD 82 9E         [ 4]  662 	call putc 
      008375 A6 20            [ 1]  663 	ld a,#SPACE 
      008377 CD 82 9E         [ 4]  664 	call putc 
      00837A 85               [ 2]  665 	popw x 
      00837B F6               [ 1]  666 	ld a,(x)
      00837C C7 00 0B         [ 1]  667 	ld acc8,a 
      00837F 5F               [ 1]  668 	clrw x 
      008380 A6 10            [ 1]  669 	ld a,#16 
      008382 CD 89 45         [ 4]  670 	call prti24
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
      008486 A3 00 00         [ 2]  900 	cpw x,#0  
      008489 22 03            [ 1]  901 	jrugt 0$ 
      00848B CC 87 10         [ 2]  902 	jp syntax_error ; negative line number 
      00848E                        903 0$: 
      00848E 1F 05            [ 2]  904 	ldw (LINENO,sp),x 
      008490 AE 16 C8         [ 2]  905 	ldw x,#tib 
      008493 72 BB 00 01      [ 2]  906 	addw x,in.w 
      008497 1F 03            [ 2]  907 	ldw (SRC,sp),x 
      008499 CD 83 86         [ 4]  908 	call strlen
      00849C 5D               [ 2]  909 	tnzw x 
      00849D 27 01            [ 1]  910 	jreq 1$
      00849F 5C               [ 1]  911 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      0084A0 1F 07            [ 2]  912 1$:	ldw (LLEN,sp),x
      0084A2 1E 05            [ 2]  913 	ldw x,(LINENO,sp)
      0084A4 CD 83 F5         [ 4]  914 	call search_lineno 
      0084A7 5D               [ 2]  915 	tnzw x 
      0084A8 26 04            [ 1]  916 	jrne 2$
                                    917 ; line doesn't exit 	
      0084AA 17 01            [ 2]  918 	ldw (DEST,sp),y 
      0084AC 20 05            [ 2]  919 	jra 3$
                                    920 ; line exit delete it.	
      0084AE 1F 01            [ 2]  921 2$: ldw (DEST,sp),x 
      0084B0 CD 84 24         [ 4]  922 	call del_line
                                    923 ; leave or insert new line if LLEN>0
      0084B3                        924 3$: 
                                    925 ; check for available space 
      0084B3 CD 93 83         [ 4]  926 	call size 
      0084B6 1D 00 03         [ 2]  927 	subw x,#3 
      0084B9 72 F0 07         [ 2]  928     subw x,(LLEN,sp)
      0084BC 2A 05            [ 1]  929 	jrpl 31$
      0084BE A6 01            [ 1]  930 	ld a,#ERR_MEM_FULL
      0084C0 CC 87 12         [ 2]  931 	jp tb_error 
      0084C3                        932 31$:	
      0084C3 0D 08            [ 1]  933 	tnz (LLEN+1,sp)
      0084C5 27 34            [ 1]  934 	jreq insert_ln_exit ; empty line forget it.
      0084C7 1E 01            [ 2]  935 	ldw x,(DEST,sp)
      0084C9 C3 00 1F         [ 2]  936 	cpw x,txtend 
      0084CC 2A 0B            [ 1]  937 	jrpl 4$ 
                                    938 ; must create a gap 
      0084CE 16 07            [ 2]  939 	ldw y,(LLEN,sp)
      0084D0 72 A9 00 03      [ 2]  940 	addw y,#3 ; space for lineno and linelen 
      0084D4 CD 84 53         [ 4]  941 	call create_gap 
      0084D7 20 11            [ 2]  942 	jra 5$ 
      0084D9                        943 4$: ; insert at end. 
      0084D9 90 CE 00 1F      [ 2]  944 	ldw y,txtend
      0084DD 17 01            [ 2]  945 	ldw (DEST,sp),y
      0084DF 72 F9 07         [ 2]  946 	addw y,(LLEN,sp)
      0084E2 72 A9 00 03      [ 2]  947 	addw y,#3 
      0084E6 90 CF 00 1F      [ 2]  948 	ldw txtend,y  
      0084EA                        949 5$:	
      0084EA 1E 01            [ 2]  950 	ldw x,(DEST,sp) ; dest address 
      0084EC 16 05            [ 2]  951 	ldw y,(LINENO,sp) ; line number 
      0084EE FF               [ 2]  952 	ldw (x),y 
      0084EF 1C 00 02         [ 2]  953 	addw x,#2
      0084F2 7B 08            [ 1]  954 	ld a,(LLEN+1,sp)
      0084F4 F7               [ 1]  955 	ld (x),a 
      0084F5 5C               [ 1]  956 	incw x 
      0084F6 16 03            [ 2]  957 	ldw y,(SRC,sp) ; src addr  
      0084F8 CD 83 A4         [ 4]  958 	call strcpy   
      0084FB                        959 insert_ln_exit:	
      00047B                        960 	_drop VSIZE
      0084FB 5B 08            [ 2]    1     addw sp,#VSIZE 
      0084FD 81               [ 4]  961 	ret
                                    962 	
                                    963 ;------------------------------------
                                    964 ;  set all variables to zero 
                                    965 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



                                    966 ;   none 
                                    967 ; output:
                                    968 ;	none
                                    969 ;------------------------------------
      0084FE                        970 clear_vars:
      0084FE AE 00 28         [ 2]  971 	ldw x,#vars 
      008501 90 AE 00 34      [ 2]  972 	ldw y,#2*26 
      008505 7F               [ 1]  973 1$:	clr (x)
      008506 5C               [ 1]  974 	incw x 
      008507 90 5A            [ 2]  975 	decw y 
      008509 26 FA            [ 1]  976 	jrne 1$
      00850B 81               [ 4]  977 	ret 
                                    978 
                                    979 ;-------------------------------------
                                    980 ; check if A is a letter
                                    981 ; input:
                                    982 ;   A 			character to test 
                                    983 ; output:
                                    984 ;   C flag      1 true, 0 false 
                                    985 ;-------------------------------------
      00850C                        986 is_alpha:
      00850C A1 41            [ 1]  987 	cp a,#'A 
      00850E 8C               [ 1]  988 	ccf
      00850F 24 0B            [ 1]  989 	jrnc 9$ 
      008511 A1 5B            [ 1]  990 	cp a,#'Z+1 
      008513 25 07            [ 1]  991 	jrc 9$ 
      008515 A1 61            [ 1]  992 	cp a,#'a 
      008517 8C               [ 1]  993 	ccf 
      008518 24 02            [ 1]  994 	jrnc 9$
      00851A A1 7B            [ 1]  995 	cp a,#'z+1   
      00851C 81               [ 4]  996 9$: ret 	
                                    997 
                                    998 ;-------------------------------------
                                    999 ;  program initialization entry point 
                                   1000 ;-------------------------------------
                           000001  1001 	MAJOR=1
                           000000  1002 	MINOR=0
      00851D 0A 0A 54 69 6E 79 20  1003 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      008563                       1004 cold_start:
                                   1005 ;set stack 
      008563 AE 17 FF         [ 2] 1006 	ldw x,#STACK_EMPTY
      008566 94               [ 1] 1007 	ldw sp,x   
                                   1008 ; clear all ram 
      008567 7F               [ 1] 1009 0$: clr (x)
      008568 5A               [ 2] 1010 	decw x 
      008569 26 FC            [ 1] 1011 	jrne 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



                                   1012 ; activate pull up on all inputs 
      00856B A6 FF            [ 1] 1013 	ld a,#255 
      00856D C7 50 03         [ 1] 1014 	ld PA_CR1,a 
      008570 C7 50 08         [ 1] 1015 	ld PB_CR1,a 
      008573 C7 50 0D         [ 1] 1016 	ld PC_CR1,a 
      008576 C7 50 12         [ 1] 1017 	ld PD_CR1,a 
      008579 C7 50 17         [ 1] 1018 	ld PE_CR1,a 
      00857C C7 50 1C         [ 1] 1019 	ld PF_CR1,a 
      00857F C7 50 21         [ 1] 1020 	ld PG_CR1,a 
      008582 C7 50 2B         [ 1] 1021 	ld PI_CR1,a 
                                   1022 ; select internal clock no divisor: 16 Mhz 	
      008585 A6 E1            [ 1] 1023 	ld a,#CLK_SWR_HSI 
      008587 5F               [ 1] 1024 	clrw x  
      008588 CD 81 1E         [ 4] 1025     call clock_init 
      00858B CD 81 34         [ 4] 1026 	call timer4_init
                                   1027 ; UART3 at 115200 BAUD
      00858E CD 82 74         [ 4] 1028 	call uart3_init
                                   1029 ; activate PE_4 (user button interrupt)
      008591 72 18 50 18      [ 1] 1030     bset PE_CR2,#USR_BTN_BIT 
                                   1031 ; display system information
      008595 AE 85 1D         [ 2] 1032 	ldw x,#software 
      008598 CD 82 B0         [ 4] 1033 	call puts 
      00859B A6 01            [ 1] 1034 	ld a,#MAJOR 
      00859D C7 00 0B         [ 1] 1035 	ld acc8,a 
      0085A0 5F               [ 1] 1036 	clrw x 
      0085A1 CF 00 09         [ 2] 1037 	ldw acc24,x 
      0085A4 A6 0A            [ 1] 1038 	ld a,#10 
      0085A6 CD 89 45         [ 4] 1039 	call prti24 
      0085A9 A6 2E            [ 1] 1040 	ld a,#'.
      0085AB CD 82 9E         [ 4] 1041 	call putc 
      0085AE A6 00            [ 1] 1042 	ld a,#MINOR 
      0085B0 C7 00 0B         [ 1] 1043 	ld acc8,a 
      0085B3 5F               [ 1] 1044 	clrw x 
      0085B4 CF 00 09         [ 2] 1045 	ldw acc24,x 
      0085B7 A6 0A            [ 1] 1046 	ld a,#10 
      0085B9 CD 89 45         [ 4] 1047 	call prti24 
      0085BC A6 0D            [ 1] 1048 	ld a,#CR 
      0085BE CD 82 9E         [ 4] 1049 	call putc 
      0085C1 CD 98 1F         [ 4] 1050 	call seek_fdrive  
                                   1051 ; configure LED2 pin 
      0085C4 72 1A 50 0D      [ 1] 1052     bset PC_CR1,#LED2_BIT
      0085C8 72 1A 50 0E      [ 1] 1053     bset PC_CR2,#LED2_BIT
      0085CC 72 1A 50 0C      [ 1] 1054     bset PC_DDR,#LED2_BIT
      0085D0 9A               [ 1] 1055 	rim 
      0085D1 AE 16 C8         [ 2] 1056 	ldw x,#tib
      0085D4 CF 00 22         [ 2] 1057 	ldw array_addr,x 
      0085D7 72 5C 00 11      [ 1] 1058 	inc seedy+1 
      0085DB 72 5C 00 0F      [ 1] 1059 	inc seedx+1 
      0085DF CD 85 EE         [ 4] 1060 	call clear_basic
      0085E2 CD 93 90         [ 4] 1061 	call ubound 
      0085E5 CD 8F 9B         [ 4] 1062 	call dpop 
      0085E8 CF 00 24         [ 2] 1063 	ldw array_size,x 
      0085EB CC 87 70         [ 2] 1064     jp warm_start 
                                   1065 
      0085EE                       1066 clear_basic:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      0085EE 5F               [ 1] 1067 	clrw x 
      0085EF CF 00 06         [ 2] 1068 	ldw lineno,x
      0085F2 72 5F 00 03      [ 1] 1069 	clr count 
      0085F6 AE 00 5C         [ 2] 1070 	ldw x,#free_ram 
      0085F9 CF 00 1D         [ 2] 1071 	ldw txtbgn,x 
      0085FC CF 00 1F         [ 2] 1072 	ldw txtend,x 
      0085FF CD 84 FE         [ 4] 1073 	call clear_vars 
      008602 81               [ 4] 1074 	ret 
                                   1075 
      008603                       1076 err_msg:
      008603 00 00 86 1B 86 29 86  1077 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             38 86 52 86 62
      00860F 86 79 86 90 86 AB 86  1078 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             BD 86 CF
      008619 86 DC                 1079 	.word err_no_access 
                                   1080 
      00861B 0A 4D 65 6D 6F 72 79  1081 err_mem_full: .asciz "\nMemory full\n" 
             20 66 75 6C 6C 0A 00
      008629 0A 73 79 6E 74 61 78  1082 err_syntax: .asciz "\nsyntax error\n" 
             20 65 72 72 6F 72 0A
             00
      008638 0A 6D 61 74 68 20 6F  1083 err_math_ovf: .asciz "\nmath operation overflow\n"
             70 65 72 61 74 69 6F
             6E 20 6F 76 65 72 66
             6C 6F 77 0A 00
      008652 0A 64 69 76 69 73 69  1084 err_div0: .asciz "\ndivision by 0\n" 
             6F 6E 20 62 79 20 30
             0A 00
      008662 0A 69 6E 76 61 6C 69  1085 err_no_line: .asciz "\ninvalid line number.\n"
             64 20 6C 69 6E 65 20
             6E 75 6D 62 65 72 2E
             0A 00
      008679 0A 72 75 6E 20 74 69  1086 err_run_only: .asciz "\nrun time only usage.\n" 
             6D 65 20 6F 6E 6C 79
             20 75 73 61 67 65 2E
             0A 00
      008690 0A 63 6F 6D 6D 61 6E  1087 err_cmd_only: .asciz "\ncommand line only usage.\n"
             64 20 6C 69 6E 65 20
             6F 6E 6C 79 20 75 73
             61 67 65 2E 0A 00
      0086AB 0A 64 75 70 6C 69 63  1088 err_duplicate: .asciz "\nduplicate name.\n"
             61 74 65 20 6E 61 6D
             65 2E 0A 00
      0086BD 0A 46 69 6C 65 20 6E  1089 err_not_file: .asciz "\nFile not found.\n"
             6F 74 20 66 6F 75 6E
             64 2E 0A 00
      0086CF 0A 62 61 64 20 76 61  1090 err_bad_value: .asciz "\nbad value.\n"
             6C 75 65 2E 0A 00
      0086DC 0A 46 69 6C 65 20 69  1091 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             6E 20 65 78 74 65 6E
             64 65 64 20 6D 65 6D
             6F 72 79 2C 20 63 61
             6E 27 74 20 62 65 20
             72 75 6E 20 66 72 6F
             6D 20 74 68 65 72 65
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal  2E-Bits]



             2E 0A 00
                                   1092 
      000690                       1093 syntax_error:
      00870E 0A 00            [ 1] 1094 	ld a,#ERR_SYNTAX 
                                   1095 
      008710                       1096 tb_error:
      008710 A6 02 83         [ 2] 1097 	ldw x, #err_msg 
      008712 72 5F 00 09      [ 1] 1098 	clr acc16 
      008712 AE               [ 1] 1099 	sll a
      008713 86 03 72 5F      [ 1] 1100 	rlc acc16  
      008717 00 0A 48         [ 1] 1101 	ld acc8, a 
      00871A 72 59 00 0A      [ 2] 1102 	addw x,acc16 
      00871E C7               [ 2] 1103 	ldw x,(x)
      00871F 00 0B 72         [ 4] 1104 	call puts
      008722 BB 00 0A         [ 2] 1105 	ldw x,lineno 
      008725 FE               [ 2] 1106 	tnzw x 
      008726 CD 82            [ 1] 1107 	jreq 2$
      008728 B0 CE 00         [ 2] 1108 	ldw acc16,x 
      00872B 06 5D 27 0F      [ 1] 1109 	clr acc24 
      00872F CF 00 0A         [ 2] 1110 	ldw x,#5 
      008732 72 5F            [ 1] 1111 	ld a,#10 
      008734 00 09 AE         [ 4] 1112 	call prti24
      0006BE                       1113 2$:	 
      008737 00 05 A6         [ 2] 1114 	ldw x,basicptr   
      00873A 0A CD 89         [ 1] 1115 	ld a,lineno 
      00873D 45 00 06         [ 1] 1116 	or a,lineno+1
      00873E 27 03            [ 1] 1117 	jreq 3$
      00873E CE 00 04         [ 2] 1118 	addw x,#3 
      008741 C6 00 06         [ 4] 1119 3$:	call puts 
      008744 CA 00            [ 1] 1120 	ld a,#CR 
      008746 07 27 03         [ 4] 1121 	call putc 
      008749 1C               [ 1] 1122 	clrw x 
      00874A 00 03 CD         [ 1] 1123 	ld a,lineno 
      00874D 82 B0 A6         [ 1] 1124 	or a,lineno+1
      008750 0D CD            [ 1] 1125 	jreq 4$
      008752 82 9E 5F         [ 2] 1126 	ldw x,#5 
      008755 C6 00 06 CA      [ 2] 1127 4$:	addw x,in.w 
      008759 00 07 27         [ 4] 1128 	call spaces
      00875C 03 AE            [ 1] 1129 	ld a,#'^ 
      00875E 00 05 72         [ 4] 1130 	call putc 
      008761 BB 00 01         [ 2] 1131 1$: ldw x,#STACK_EMPTY 
      008764 CD               [ 1] 1132     ldw sp,x
      0006F0                       1133 warm_start:
      008765 82 EC A6 5E      [ 1] 1134 	clr flags 
      008769 CD 82 9E AE      [ 1] 1135 	clr untok
      00876D 17               [ 1] 1136 	clrw x 
      00876E FF 94 12         [ 2] 1137 	ldw tokval,x 
      008770 72 5F 00 20      [ 1] 1138 	clr loop_depth 
      008770 72 5F 00         [ 2] 1139 	ldw x,#dstack_unf 
      008773 26 72 5F         [ 2] 1140 	ldw dstkptr,x 
      008776 00 12 5F CF      [ 1] 1141 	mov tab_width,#TAB_WIDTH 
      00877A 00 13 72 5F      [ 1] 1142 	mov base,#10 
      00877E 00               [ 1] 1143 	clrw x 
      00877F 21 AE 17         [ 2] 1144 	ldw lineno,x 
      008782 80 CF 00         [ 2] 1145 	ldw x,#tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008785 1B 35 04         [ 2] 1146 	ldw basicptr,x 
                                   1147 ;----------------------------
                                   1148 ; tokenizer test
                                   1149 ;----------------------------
                           000000  1150   TOK_TEST=0 
                           000000  1151 .if TOK_TEST 
                                   1152 test_tok:
                                   1153 	clr in.w 
                                   1154 	clr in 
                                   1155 	ld a,#CR 
                                   1156 	call putc 
                                   1157 	ld a,#'> 
                                   1158 	call putc 
                                   1159 	call readln
                                   1160 	ldw x,#tib 
                                   1161 1$:	call get_token	
                                   1162 	tnz a 
                                   1163 	jrne 2$
                                   1164 	jra test_tok 
                                   1165 2$:	push a 
                                   1166 	cp a,#TK_INTGR
                                   1167 	jrne 3$
                                   1168 	ld a,#10 
                                   1169 	clrw x
                                   1170 	call itoa
                                   1171 	ldw y,x 
                                   1172 	ldw x,#pad 
                                   1173 	call strcpy    
                                   1174 3$:	ld a,(1,sp) 
                                   1175 	cp a,#20
                                   1176 	jrmi 34$
                                   1177 	ld a,#'2 
                                   1178 	call putc 
                                   1179 	ld a,(1,sp)
                                   1180 	sub a,#20
                                   1181 	ld (1,sp),a
                                   1182 	jra 36$   
                                   1183 34$: 
                                   1184 	cp a,#10
                                   1185 	jrmi 36$ 
                                   1186 	ld a,#'1 
                                   1187 	call putc
                                   1188 	ld a,(1,sp)
                                   1189 	sub a,#10 
                                   1190 	ld (1,sp),a  
                                   1191 36$:
                                   1192 	pop a 
                                   1193 	add a,#'0 
                                   1194 	call putc 
                                   1195 	ld a,#SPACE 
                                   1196 	call putc 
                                   1197 	ldw x,#pad 
                                   1198 	call puts 
                                   1199 	ld a,#CR 
                                   1200 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



                                   1201 	jra 1$
                                   1202 .endif
                                   1203 ;----------------------------
      000718                       1204 interp:
      008788 00 27 35 0A      [ 1] 1205 	clr in.w
      00878C 00 08 5F CF 00   [ 2] 1206 	btjf flags,#FRUN,4$ 
                                   1207 ; running program
                                   1208 ; goto next basic line 
      008791 06 AE 16         [ 2] 1209 	ldw x,basicptr
      008794 C8 CF            [ 1] 1210 	ld a,(2,x) ; line length 
      008796 00 04 0A         [ 1] 1211 	ld acc8,a 
      008798 72 5F 00 09      [ 1] 1212 	clr acc16 
      008798 72 5F 00         [ 2] 1213 	addw x,#3 
      00879B 01 72 01 00      [ 2] 1214 	addw x,acc16
      00879F 26 2C CE         [ 2] 1215 	cpw x,txtend 
      0087A2 00 04            [ 1] 1216 	jrpl warm_start
      0087A4 E6 02 C7         [ 2] 1217 	ldw basicptr,x ; start of next line  
      0087A7 00 0B            [ 1] 1218 	ld a,(2,x)
      0087A9 72 5F            [ 1] 1219 	add a,#2 ; because 'in' start at 3.
      0087AB 00 0A 1C         [ 1] 1220 	ld count,a 
      0087AE 00               [ 2] 1221 	ldw x,(x) ; line no 
      0087AF 03 72 BB         [ 2] 1222 	ldw lineno,x 
      0087B2 00 0A C3 00      [ 1] 1223 	mov in,#3 ; skip first 3 bytes of line 
      0087B6 1F 2A            [ 2] 1224 	jra interp_loop 
      00074D                       1225 4$: ; commande line mode 	
      0087B8 B7 CF 00 04      [ 1] 1226 	clr in 
      0087BC E6 02            [ 1] 1227 	ld a,#CR 
      0087BE AB 02 C7         [ 4] 1228 	call putc 
      0087C1 00 03            [ 1] 1229 	ld a,#'> 
      0087C3 FE CF 00         [ 4] 1230 	call putc 
      0087C6 06 35 03         [ 4] 1231 	call readln
      00075E                       1232 interp_loop:
      0087C9 00 02 20         [ 1] 1233 	ld a,in 
      0087CC 11 00 02         [ 1] 1234 	cp a,count 
      0087CD 2A B2            [ 1] 1235 	jrpl interp
      0087CD 72 5F 00         [ 4] 1236 	call get_token
      0087D0 02 A6            [ 1] 1237 	cp a,#TK_COLON 
      0087D2 0D CD            [ 1] 1238 	jreq interp_loop 
      0087D4 82 9E            [ 1] 1239 	cp a,#TK_NONE 
      0087D6 A6 3E            [ 1] 1240 	jreq interp 
      000771                       1241 1$:
      0087D8 CD 82            [ 1] 1242 	cp a,#TK_VAR
      0087DA 9E CD            [ 1] 1243 	jrne 2$
      0087DC 8A 2C 2B         [ 4] 1244 	call let02  
      0087DE 20 E4            [ 2] 1245 	jra interp_loop 
      00077A                       1246 2$:	
      0087DE C6 00            [ 1] 1247 	cp a,#TK_ARRAY 
      0087E0 02 C1            [ 1] 1248 	jrne 3$
      0087E2 00 03 2A         [ 4] 1249 	call get_array_element
      0087E5 B2 CD 8C         [ 4] 1250 	call let02 
      0087E8 C8 A1            [ 2] 1251 	jra interp_loop 
      000786                       1252 3$:
      0087EA 01 27            [ 1] 1253 	cp a,#TK_CMD
      0087EC F1 A1            [ 1] 1254 	jrne 4$
      0087EE 00               [ 4] 1255 	call (x) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0087EF 27 A7            [ 2] 1256 	jra interp_loop 
      0087F1                       1257 4$:	
      0087F1 A1 02            [ 1] 1258 	cp a,#TK_INTGR
      0087F3 26 05            [ 1] 1259 	jrne 5$
      0087F5 CD 93 AB         [ 4] 1260 	call insert_line 
      0087F8 20 E4 18         [ 2] 1261 	jp interp
      0087FA                       1262 5$: 
      0087FA A1 03 26         [ 2] 1263 	jp syntax_error 
                                   1264 
                                   1265 ;----------------------------------------
                                   1266 ;   DEBUG support functions
                                   1267 ;----------------------------------------
                           000001  1268 .if DEBUG 
                                   1269 ; turn LED on 
      00079A                       1270 ledon:
      0087FD 08 CD 92 0A      [ 1] 1271     bset PC_ODR,#LED2_BIT
      008801 CD               [ 4] 1272     ret 
                                   1273 
                                   1274 ; turn LED off 
      00079F                       1275 ledoff:
      008802 93 AB 20 D8      [ 1] 1276     bres PC_ODR,#LED2_BIT 
      008806 81               [ 4] 1277     ret 
                                   1278 
                                   1279 ; invert LED status 
      0007A4                       1280 ledtoggle:
      008806 A1 07            [ 1] 1281     ld a,#LED2_MASK
      008808 26 03 FD         [ 1] 1282     xor a,PC_ODR
      00880B 20 D1 0A         [ 1] 1283     ld PC_ODR,a
      00880D 81               [ 4] 1284     ret 
                                   1285 
      0007AD                       1286 left_paren:
      00880D A1 0A            [ 1] 1287 	ld a,#SPACE 
      00880F 26 06 CD         [ 4] 1288 	call putc
      008812 84 84            [ 1] 1289 	ld a,#'( 
      008814 CC 87 98         [ 4] 1290 	call putc 	
      008817 81               [ 4] 1291 	ret 
                                   1292 
                                   1293 ;------------------------------
                                   1294 ; print 8 bit register 
                                   1295 ; input:
                                   1296 ;   X  point to register name 
                                   1297 ;   A  register value to print 
                                   1298 ; output:
                                   1299 ;   none
                                   1300 ;------------------------------- 
      0007B8                       1301 prt_reg8:
      008817 CC               [ 1] 1302 	push a 
      008818 87 10 30         [ 4] 1303 	call puts 
      00881A 7B 01            [ 1] 1304 	ld a,(1,sp) 
      00881A 72 1A 50         [ 1] 1305 	ld acc8,a 
      00881D 0A               [ 1] 1306 	clrw x 
      00881E 81 00 08         [ 2] 1307 	ldw acc24,x 
      00881F A6 10            [ 1] 1308 	ld a,#16 
      00881F 72 1B 50         [ 4] 1309 	call prti24 
      008822 0A 81 AD         [ 4] 1310 	call left_paren 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      008824 84               [ 1] 1311 	pop a 
      008824 A6 20 C8         [ 1] 1312 	ld acc8,a 
      008827 50               [ 1] 1313 	clrw x 
      008828 0A C7 50         [ 2] 1314 	ldw acc24,x 
      00882B 0A 81            [ 1] 1315 	ld a,#10 
      00882D CD 08 C5         [ 4] 1316 	call prti24 
      00882D A6 20            [ 1] 1317 	ld a,#') 
      00882F CD 82 9E         [ 4] 1318 	call putc
      008832 A6               [ 4] 1319 	ret
                                   1320 
                                   1321 ;--------------------------------
                                   1322 ; print 16 bits register 
                                   1323 ; input:
                                   1324 ;   X   point register name 
                                   1325 ;   Y   register value to print 
                                   1326 ; output:
                                   1327 ;  none
                                   1328 ;--------------------------------
      0007E0                       1329 prt_reg16: 
      008833 28 CD            [ 2] 1330 	pushw y 
      008835 82 9E 81         [ 4] 1331 	call puts 
      008838 1E 01            [ 2] 1332 	ldw x,(1,sp) 
      008838 88 CD 82         [ 2] 1333 	ldw acc16,x 
      00883B B0 7B 01 C7      [ 1] 1334 	clr acc24 
      00883F 00               [ 1] 1335 	clrw x 
      008840 0B 5F            [ 1] 1336 	ld a,#16 
      008842 CF 00 09         [ 4] 1337 	call prti24 
      008845 A6 10 CD         [ 4] 1338 	call left_paren 
      008848 89               [ 2] 1339 	popw x 
      008849 45 CD 88         [ 2] 1340 	ldw acc16,x 
      00884C 2D 84 C7 00      [ 1] 1341 	clr acc24
      008850 0B 5F CF 00 09   [ 2] 1342 	btjf acc16,#7,1$
      008855 A6 0A CD 89      [ 1] 1343 	cpl acc24 
      008859 45               [ 1] 1344 1$:	clrw x 
      00885A A6 29            [ 1] 1345 	ld a,#10 
      00885C CD 82 9E         [ 4] 1346 	call prti24 
      00885F 81 29            [ 1] 1347 	ld a,#') 
      008860 CD 02 1E         [ 4] 1348 	call putc
      008860 90               [ 4] 1349 	ret 
                                   1350 
                                   1351 ;------------------------------------
                                   1352 ; print registers contents saved on
                                   1353 ; stack by trap interrupt.
                                   1354 ;------------------------------------
      000814                       1355 print_registers:
      008861 89 CD 82         [ 2] 1356 	ldw x,#STATES
      008864 B0 1E 01         [ 4] 1357 	call puts
                                   1358 ; print EPC 
      008867 CF 00 0A         [ 2] 1359 	ldw x, #REG_EPC
      00886A 72 5F 00         [ 4] 1360 	call puts 
      00886D 09 5F            [ 1] 1361 	ld a, (11,sp)
      00886F A6 10 CD         [ 1] 1362 	ld acc8,a 
      008872 89 45            [ 1] 1363 	ld a, (10,sp) 
      008874 CD 88 2D         [ 1] 1364 	ld acc16,a 
      008877 85 CF            [ 1] 1365 	ld a,(9,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      008879 00 0A 72         [ 1] 1366 	ld acc24,a
      00887C 5F               [ 1] 1367 	clrw x  
      00887D 00 09            [ 1] 1368 	ld a,#16
      00887F 72 0F 00         [ 4] 1369 	call prti24  
                                   1370 ; print X
      008882 0A 04 72         [ 2] 1371 	ldw x,#REG_X
      008885 53 00            [ 2] 1372 	ldw y,(5,sp)
      008887 09 5F A6         [ 4] 1373 	call prt_reg16  
                                   1374 ; print Y 
      00888A 0A CD 89         [ 2] 1375 	ldw x,#REG_Y
      00888D 45 A6            [ 2] 1376 	ldw y, (7,sp)
      00888F 29 CD 82         [ 4] 1377 	call prt_reg16  
                                   1378 ; print A 
      008892 9E 81 B4         [ 2] 1379 	ldw x,#REG_A
      008894 7B 04            [ 1] 1380 	ld a, (4,sp) 
      008894 AE 88 E7         [ 4] 1381 	call prt_reg8
                                   1382 ; print CC 
      008897 CD 82 B0         [ 2] 1383 	ldw x,#REG_CC 
      00889A AE 89            [ 1] 1384 	ld a, (3,sp) 
      00889C 24 CD 82         [ 4] 1385 	call prt_reg8 
                                   1386 ; print SP 
      00889F B0 7B 0B         [ 2] 1387 	ldw x,#REG_SP
      0088A2 C7 00            [ 1] 1388 	ldw y,sp 
      0088A4 0B 7B 0A C7      [ 2] 1389 	addw y,#12
      0088A8 00 0A 7B         [ 4] 1390 	call prt_reg16  
      0088AB 09 C7            [ 1] 1391 	ld a,#'\n' 
      0088AD 00 09 5F         [ 4] 1392 	call putc
      0088B0 A6               [ 4] 1393 	ret
                                   1394 
      0088B1 10 CD 89 45 AE 89 2F  1395 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             16 05 CD 88 60 AE 89
             2A 16 07 CD 88 60 AE
             89 34 7B 04 CD 88 38
             AE 89 39 7B 03 CD 88
             38 AE 89 3F 90 96 72
             A9 00 0C CD 88 60 A6
             0A CD 82 9E 81 0A 52
             65 67 69 73 74
      0088EE 65 72 73 20 73 74     1396 REG_EPC: .asciz "EPC: "
      0088F4 61 74 65 20 61        1397 REG_Y:   .asciz "\nY: " 
      0088F9 74 20 61 62 6F        1398 REG_X:   .asciz "\nX: "
      0088FE 72 74 20 70 6F        1399 REG_A:   .asciz "\nA: " 
      008903 69 6E 74 2E 0A 2D     1400 REG_CC:  .asciz "\nCC: "
      008909 2D 2D 2D 2D 2D 2D     1401 REG_SP:  .asciz "\nSP: "
                                   1402 .endif 
                                   1403 
                                   1404 ;------------------------------------
                                   1405 ; print integer in acc24 
                                   1406 ; input:
                                   1407 ;	acc24 		integer to print 
                                   1408 ;	A 			numerical base for conversion 
                                   1409 ;               if bit 7 is set add a space at print end.
                                   1410 ;   XL 			field width, 0 -> no fill.
                                   1411 ;  output:
                                   1412 ;    none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



                                   1413 ;------------------------------------
                           000001  1414 	WIDTH = 1
                           000002  1415 	BASE = 2
                           000003  1416 	ADD_SPACE=3 ; add a space after number 
                           000003  1417 	VSIZE = 3
      0008C5                       1418 prti24:
      0008C5                       1419 	_vars VSIZE 
      00890F 2D 2D            [ 2]    1     sub sp,#VSIZE 
      008911 2D 2D            [ 1] 1420 	clr (ADD_SPACE,sp)
      008913 2D 2D            [ 1] 1421 	bcp a,#0x80 
      008915 2D 2D            [ 1] 1422 	jreq 0$ 
      008917 2D 2D            [ 1] 1423 	cpl (ADD_SPACE,sp)
      008919 2D 2D            [ 1] 1424 0$:	and a,#31 
      00891B 2D 2D            [ 1] 1425 	ld (BASE,sp),a
      00891D 2D               [ 1] 1426 	ld a,xl
      00891E 2D 2D            [ 1] 1427 	ld (WIDTH,sp),a 
      008920 2D 2D            [ 1] 1428 	ld a, (BASE,sp)  
      008922 0A 00 45         [ 4] 1429     call itoa  ; conversion entier en  .asciz
      008925 50 43            [ 1] 1430 1$: ld a,(WIDTH,sp)
      008927 3A 20            [ 1] 1431 	jreq 4$
      008929 00 0A 59         [ 1] 1432 	ld acc8,a 
      00892C 3A               [ 2] 1433 	pushw x 
      00892D 20 00 0A         [ 4] 1434 	call strlen 
      008930 58               [ 1] 1435 	ld a,xl 
      008931 3A               [ 2] 1436 	popw x 
      008932 20 00 0A         [ 3] 1437 	exg a,acc8 
      008935 41 3A 20         [ 1] 1438 	sub a,acc8 
      008938 00 0A            [ 1] 1439 	jrmi 4$
      00893A 43 43            [ 1] 1440 	ld (WIDTH,sp),a 
      00893C 3A 20            [ 1] 1441 	ld  a,#SPACE
      00893E 00 0A            [ 1] 1442 3$: tnz (WIDTH,sp)
      008940 53 50            [ 1] 1443 	jreq 4$
      008942 3A               [ 2] 1444 	decw x 
      008943 20               [ 1] 1445 	ld (x),a 
      008944 00 01            [ 1] 1446 	dec (WIDTH,sp) 
      008945 20 F6            [ 2] 1447 	jra 3$
      0008FE                       1448 4$: 
      008945 52 03 0F         [ 4] 1449 	call puts 
      008948 03 A5            [ 1] 1450 	tnz (ADD_SPACE,sp)
      00894A 80 27            [ 1] 1451 	jreq 5$
      00894C 02 03            [ 1] 1452     ld a,#SPACE 
      00894E 03 A4 1F         [ 4] 1453 	call putc 
      00090A                       1454 5$: _drop VSIZE 
      008951 6B 02            [ 2]    1     addw sp,#VSIZE 
      008953 9F               [ 4] 1455     ret	
                                   1456 
                                   1457 ;-----------------------------
                                   1458 ; intialize parser ready for
                                   1459 ; for a new line analysis
                                   1460 ; input:
                                   1461 ;   none
                                   1462 ; output:
                                   1463 ;	none 
                                   1464 ;------------------------------
      00090D                       1465 parser_init::
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      008954 6B 01 7B 02      [ 1] 1466 	clr in.w 
      008958 CD 89 9A 7B      [ 1] 1467 	clr in
      00895C 01 27 1F C7      [ 1] 1468 	clr pad  
      008960 00               [ 4] 1469 	ret 
                                   1470 
                                   1471 ;------------------------------------
                                   1472 ; convert integer to string
                                   1473 ; input:
                                   1474 ;   A	  	base
                                   1475 ;	acc24	integer to convert
                                   1476 ; output:
                                   1477 ;   X  		pointer to string
                                   1478 ;------------------------------------
                           000001  1479 	SIGN=1  ; integer sign 
                           000002  1480 	BASE=2  ; numeric base 
                           000002  1481 	VSIZE=2  ;locals size
      00091A                       1482 itoa:
      008961 0B 89            [ 2] 1483 	sub sp,#VSIZE
      008963 CD 83            [ 1] 1484 	ld (BASE,sp), a  ; base
      008965 86 9F            [ 1] 1485 	clr (SIGN,sp)    ; sign
      008967 85 31            [ 1] 1486 	cp a,#10
      008969 00 0B            [ 1] 1487 	jrne 1$
                                   1488 	; base 10 string display with negative sign if bit 23==1
      00896B C0 00 0B 2B 0E   [ 2] 1489 	btjf acc24,#7,1$
      008970 6B 01            [ 1] 1490 	cpl (SIGN,sp)
      008972 A6 20 0D         [ 4] 1491 	call neg_acc24
      00092E                       1492 1$:
                                   1493 ; initialize string pointer 
      008975 01 27 06         [ 2] 1494 	ldw x,#pad+PAD_SIZE-1
      008978 5A               [ 1] 1495 	clr (x)
      000932                       1496 itoa_loop:
      008979 F7 0A            [ 1] 1497     ld a,(BASE,sp)
      00897B 01 20 F6         [ 4] 1498     call divu24_8 ; acc24/A 
      00897E AB 30            [ 1] 1499     add a,#'0  ; remainder of division
      00897E CD 82            [ 1] 1500     cp a,#'9+1
      008980 B0 0D            [ 1] 1501     jrmi 2$
      008982 03 27            [ 1] 1502     add a,#7 
      008984 05               [ 2] 1503 2$: decw x
      008985 A6               [ 1] 1504     ld (x),a
                                   1505 	; if acc24==0 conversion done
      008986 20 CD 82         [ 1] 1506 	ld a,acc24
      008989 9E 5B 03         [ 1] 1507 	or a,acc16
      00898C 81 00 0A         [ 1] 1508 	or a,acc8
      00898D 26 E6            [ 1] 1509     jrne itoa_loop
                                   1510 	;conversion done, next add '$' or '-' as required
      00898D 72 5F            [ 1] 1511 	ld a,(BASE,sp)
      00898F 00 01            [ 1] 1512 	cp a,#16
      008991 72 5F            [ 1] 1513 	jreq 8$
      008993 00 02            [ 1] 1514 	ld a,(SIGN,sp)
      008995 72 5F            [ 1] 1515     jreq 10$
      008997 17 18            [ 1] 1516     ld a,#'-
      008999 81 02            [ 2] 1517 	jra 9$ 
      00899A A6 24            [ 1] 1518 8$: ld a,#'$ 
      00899A 52               [ 2] 1519 9$: decw x
      00899B 02               [ 1] 1520     ld (x),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      00095E                       1521 10$:
      00899C 6B 02            [ 2] 1522 	addw sp,#VSIZE
      00899E 0F               [ 4] 1523 	ret
                                   1524 
                                   1525 ;-------------------------------------
                                   1526 ; divide uint24_t by uint8_t
                                   1527 ; used to convert uint24_t to string
                                   1528 ; input:
                                   1529 ;	acc24	dividend
                                   1530 ;   A 		divisor
                                   1531 ; output:
                                   1532 ;   acc24	quotient
                                   1533 ;   A		remainder
                                   1534 ;------------------------------------- 
                                   1535 ; offset  on sp of arguments and locals
                           000001  1536 	U8   = 1   ; divisor on stack
                           000001  1537 	VSIZE =1
      000961                       1538 divu24_8:
      00899F 01               [ 2] 1539 	pushw x ; save x
      0089A0 A1               [ 1] 1540 	push a 
                                   1541 	; ld dividend UU:MM bytes in X
      0089A1 0A 26 0A         [ 1] 1542 	ld a, acc24
      0089A4 72               [ 1] 1543 	ld xh,a
      0089A5 0F 00 09         [ 1] 1544 	ld a,acc24+1
      0089A8 05               [ 1] 1545 	ld xl,a
      0089A9 03 01            [ 1] 1546 	ld a,(U8,SP) ; divisor
      0089AB CD               [ 2] 1547 	div x,a ; UU:MM/U8
      0089AC 8A               [ 1] 1548 	push a  ;save remainder
      0089AD 09               [ 1] 1549 	ld a,xh
      0089AE C7 00 08         [ 1] 1550 	ld acc24,a
      0089AE AE               [ 1] 1551 	ld a,xl
      0089AF 17 3F 7F         [ 1] 1552 	ld acc24+1,a
      0089B2 84               [ 1] 1553 	pop a
      0089B2 7B               [ 1] 1554 	ld xh,a
      0089B3 02 CD 89         [ 1] 1555 	ld a,acc24+2
      0089B6 E1               [ 1] 1556 	ld xl,a
      0089B7 AB 30            [ 1] 1557 	ld a,(U8,sp) ; divisor
      0089B9 A1               [ 2] 1558 	div x,a  ; R:LL/U8
      0089BA 3A 2B            [ 1] 1559 	ld (U8,sp),a ; save remainder
      0089BC 02               [ 1] 1560 	ld a,xl
      0089BD AB 07 5A         [ 1] 1561 	ld acc24+2,a
      0089C0 F7               [ 1] 1562 	pop a
      0089C1 C6               [ 2] 1563 	popw x
      0089C2 00               [ 4] 1564 	ret
                                   1565 
                                   1566 ;------------------------------------
                                   1567 ;  two's complement acc24
                                   1568 ;  input:
                                   1569 ;		acc24 variable
                                   1570 ;  output:
                                   1571 ;		acc24 variable
                                   1572 ;-------------------------------------
      000989                       1573 neg_acc24:
      0089C3 09 CA 00 0A      [ 1] 1574 	cpl acc24+2
      0089C7 CA 00 0B 26      [ 1] 1575 	cpl acc24+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      0089CB E6 7B 02 A1      [ 1] 1576 	cpl acc24
      0089CF 10 27            [ 1] 1577 	ld a,#1
      0089D1 08 7B 01         [ 1] 1578 	add a,acc24+2
      0089D4 27 08 A6         [ 1] 1579 	ld acc24+2,a
      0089D7 2D               [ 1] 1580 	clr a
      0089D8 20 02 A6         [ 1] 1581 	adc a,acc24+1
      0089DB 24 5A F7         [ 1] 1582 	ld acc24+1,a 
      0089DE 4F               [ 1] 1583 	clr a 
      0089DE 5B 02 81         [ 1] 1584 	adc a,acc24 
      0089E1 C7 00 08         [ 1] 1585 	ld acc24,a 
      0089E1 89               [ 4] 1586 	ret
                                   1587 
                                   1588 
                                   1589 ;------------------------------------
                                   1590 ; read a line of text from terminal
                                   1591 ; input:
                                   1592 ;	none
                                   1593 ; local variable on stack:
                                   1594 ;	LL (1,sp)
                                   1595 ;   RXCHAR (2,sp)
                                   1596 ; output:
                                   1597 ;   text in tib  buffer
                                   1598 ;------------------------------------
                                   1599 	; local variables
                           000001  1600 	LL_HB=1
                           000001  1601 	RXCHAR = 1 ; last char received
                           000002  1602 	LL = 2  ; accepted line length
                           000002  1603 	VSIZE=2 
      0009AC                       1604 readln:
      0089E2 88               [ 1] 1605 	clrw x 
      0089E3 C6               [ 2] 1606 	pushw x 
      0089E4 00 09 95 C6      [ 2] 1607  	ldw y,#tib ; input buffer
      0009B2                       1608 readln_loop:
      0089E8 00 0A 97         [ 4] 1609 	call getc
      0089EB 7B 01            [ 1] 1610 	ld (RXCHAR,sp),a
      0089ED 62 88            [ 1] 1611 	cp a,#CR
      0089EF 9E C7            [ 1] 1612 	jrne 1$
      0089F1 00 09 9F         [ 2] 1613 	jp readln_quit
      0089F4 C7 00            [ 1] 1614 1$:	cp a,#NL
      0089F6 0A 84            [ 1] 1615 	jreq readln_quit
      0089F8 95 C6            [ 1] 1616 	cp a,#BSP
      0089FA 00 0B            [ 1] 1617 	jreq del_back
      0089FC 97 7B            [ 1] 1618 	cp a,#CTRL_D
      0089FE 01 62            [ 1] 1619 	jreq del_ln
      008A00 6B 01            [ 1] 1620 	cp a,#CTRL_R 
      008A02 9F C7            [ 1] 1621 	jreq reprint 
                                   1622 ;	cp a,#'[
                                   1623 ;	jreq ansi_seq
      0009CE                       1624 final_test:
      008A04 00 0B            [ 1] 1625 	cp a,#SPACE
      008A06 84 85            [ 1] 1626 	jrpl accept_char
      008A08 81 DE            [ 2] 1627 	jra readln_loop
      008A09                       1628 ansi_seq:
                                   1629 ;	call getc
                                   1630 ;	cp a,#'C 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                   1631 ;	jreq rigth_arrow
                                   1632 ;	cp a,#'D 
                                   1633 ;	jreq left_arrow 
                                   1634 ;	jra final_test
      0009D4                       1635 right_arrow:
                                   1636 ;	ld a,#BSP 
                                   1637 ;	call putc 
                                   1638 ;	jra realn_loop 
      0009D4                       1639 left_arrow:
                                   1640 
                                   1641 ;	jra readln_loop
      0009D4                       1642 reprint: 
      008A09 72 53 00 0B      [ 1] 1643 	tnz count 
      008A0D 72 53            [ 1] 1644 	jreq readln_loop
      008A0F 00 0A            [ 1] 1645 	tnz (LL,sp)
      008A11 72 53            [ 1] 1646 	jrne readln_loop
      008A13 00 09 A6         [ 2] 1647 	ldw x,#tib 
      008A16 01 CB 00         [ 4] 1648 	call puts
      008A19 0B C7 00 0B      [ 2] 1649 	ldw y,#tib 
      008A1D 4F C9 00         [ 1] 1650 	ld a,count 
      008A20 0A C7            [ 1] 1651 	ld (LL,sp),a
      008A22 00 0A 4F C9      [ 1] 1652 	clr count 
      008A26 00 09            [ 1] 1653 	clr (LL_HB,sp)
      008A28 C7 00 09         [ 2] 1654 	addw y,(LL_HB,sp)
      008A2B 81 BA            [ 2] 1655 	jra readln_loop 
      008A2C                       1656 del_ln:
      008A2C 5F 89            [ 1] 1657 	ld a,(LL,sp)
      008A2E 90 AE 16         [ 4] 1658 	call delete
      008A31 C8 AE 16 C8      [ 2] 1659 	ldw y,#tib
      008A32 90 7F            [ 1] 1660 	clr (y)
      008A32 CD 82            [ 1] 1661 	clr (LL,sp)
      008A34 A7 6B            [ 2] 1662 	jra readln_loop
      000A07                       1663 del_back:
      008A36 01 A1            [ 1] 1664     tnz (LL,sp)
      008A38 0D 26            [ 1] 1665     jreq readln_loop
      008A3A 03 CC            [ 1] 1666     dec (LL,sp)
      008A3C 8A AB            [ 2] 1667     decw y
      008A3E A1 0A            [ 1] 1668     clr  (y)
      008A40 27 69 A1         [ 4] 1669     call bksp 
      008A43 08 27            [ 2] 1670     jra readln_loop	
      000A16                       1671 accept_char:
      008A45 41 A1            [ 1] 1672 	ld a,#TIB_SIZE-1
      008A47 04 27            [ 1] 1673 	cp a, (LL,sp)
      008A49 2E A1            [ 1] 1674 	jreq readln_loop
      008A4B 12 27            [ 1] 1675 	ld a,(RXCHAR,sp)
      008A4D 06 F7            [ 1] 1676 	ld (y),a
      008A4E 0C 02            [ 1] 1677 	inc (LL,sp)
      008A4E A1 20            [ 1] 1678 	incw y
      008A50 2A 44            [ 1] 1679 	clr (y)
      008A52 20 DE 1E         [ 4] 1680 	call putc 
      008A54 20 87            [ 2] 1681 	jra readln_loop
      008A54                       1682 readln_quit:
      008A54 90 7F            [ 1] 1683 	clr (y)
      008A54 7B 02            [ 1] 1684 	ld a,(LL,sp)
      008A54 72 5D 00         [ 1] 1685 	ld count,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      000A32                       1686 	_drop VSIZE 
      008A57 03 27            [ 2]    1     addw sp,#VSIZE 
      008A59 D8 0D            [ 1] 1687 	ld a,#CR
      008A5B 02 26 D4         [ 4] 1688 	call putc
      008A5E AE               [ 4] 1689 	ret
                                   1690 
                           000001  1691 .if DEBUG 	
                                   1692 ;----------------------------
                                   1693 ; command interface
                                   1694 ; only 2 commands:
                                   1695 ;  'q' to resume application
                                   1696 ;  'p [addr]' to print memory values 
                                   1697 ;  's addr' to print string 
                                   1698 ;----------------------------
                                   1699 ;local variable 
                           000001  1700 	PSIZE=1
                           000001  1701 	VSIZE=1 
      000A3A                       1702 cmd_itf:
      008A5F 16 C8            [ 2] 1703 	sub sp,#VSIZE 
      008A61 CD 82 B0 90      [ 1] 1704 	clr farptr 
      008A65 AE 16 C8 C6      [ 1] 1705 	clr farptr+1 
      008A69 00 03 6B 02      [ 1] 1706 	clr farptr+2  
      000A48                       1707 repl:
      008A6D 72 5F            [ 1] 1708 	ld a,#CR 
      008A6F 00 03 0F         [ 4] 1709 	call putc 
      008A72 01 72            [ 1] 1710 	ld a,#'? 
      008A74 F9 01 20         [ 4] 1711 	call putc
      008A77 BA 5F 00 00      [ 1] 1712 	clr in.w 
      008A78 72 5F 00 01      [ 1] 1713 	clr in 
      008A78 7B 02 CD         [ 4] 1714 	call readln
      008A7B 82 DE 90         [ 4] 1715 	call get_token
      008A7E AE 16 C8 90      [ 2] 1716 	ldw y,#pad 
      008A82 7F 0F            [ 1] 1717 	ld a,(y)
      008A84 02 20            [ 1] 1718 	incw y
      008A86 AB 51            [ 1] 1719 	cp a,#'Q 
      008A87 26 0B            [ 1] 1720 	jrne test_p
      000A6C                       1721 repl_exit:
      000A6C                       1722 	_drop #VSIZE 	
      008A87 0D 02            [ 2]    1     addw sp,##VSIZE 
      008A89 27               [ 4] 1723 	ret  
      000A6F                       1724 invalid:
      008A8A A7 0A 02         [ 2] 1725 	ldw x,#invalid_cmd 
      008A8D 90 5A 90         [ 4] 1726 	call puts 
      008A90 7F CD            [ 2] 1727 	jra repl 
      000A77                       1728 test_p:	
      008A92 82 CE            [ 1] 1729     cp a,#'P 
      008A94 20 9C            [ 1] 1730 	jreq mem_peek
      008A96 A1 53            [ 1] 1731     cp a,#'S 
      008A96 A6 4F            [ 1] 1732 	jrne invalid 
      000A7F                       1733 print_string:	
      008A98 11 02 27         [ 4] 1734 	call get_token
      008A9B 96 7B 01         [ 2] 1735 	ldw x,acc16 
      008A9E 90 F7 0C         [ 4] 1736 	call puts
      008AA1 02 90 5C         [ 2] 1737 	jp repl 	
      000A8B                       1738 mem_peek:	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008AA4 90 7F CD         [ 4] 1739 	call get_token
      008AA7 82 9E 20         [ 1] 1740 	ld a, acc24 
      008AAA 87 00 09         [ 1] 1741 	or a,acc16 
      008AAB CA 00 0A         [ 1] 1742 	or a,acc8 
      008AAB 90 7F            [ 1] 1743 	jrne 1$ 
      008AAD 7B 02            [ 2] 1744 	jra peek_byte  
      008AAF C7 00 03         [ 2] 1745 1$:	ldw x,acc24 
      008AB2 5B 02 A6         [ 2] 1746 	ldw farptr,x 
      008AB5 0D CD 82         [ 1] 1747 	ld a,acc8 
      008AB8 9E 81 16         [ 1] 1748 	ld farptr+2,a 
      008ABA                       1749 peek_byte:
      008ABA 52 01 72         [ 4] 1750 	call print_farptr 
      008ABD 5F 00            [ 1] 1751 	ld a,#8 
      008ABF 15 72            [ 1] 1752 	ld (PSIZE,sp),a 
      008AC1 5F               [ 1] 1753 	clrw x 
      008AC2 00 16 72         [ 4] 1754 1$:	call fetchc  
      008AC5 5F               [ 2] 1755 	pushw x 
      008AC6 00 17 0A         [ 1] 1756 	ld acc8,a 
      008AC8 5F               [ 1] 1757 	clrw x 
      008AC8 A6 0D CD         [ 2] 1758 	ldw acc24,x 
      008ACB 82 9E            [ 1] 1759 	ld a,#16+128
      008ACD A6 3F CD         [ 4] 1760 	call prti24
      008AD0 82               [ 2] 1761 	popw x 
      008AD1 9E 72            [ 1] 1762 	dec (PSIZE,sp)
      008AD3 5F 00            [ 1] 1763 	jrne 1$ 
      008AD5 01 72            [ 1] 1764 	ld a,#8 
      008AD7 5F 00 02         [ 1] 1765 	add a,farptr+2 
      008ADA CD 8A 2C         [ 1] 1766 	ld farptr+2,a
      008ADD CD               [ 1] 1767 	clr a 
      008ADE 8C C8 90         [ 1] 1768 	adc a,farptr+1 
      008AE1 AE 17 18         [ 1] 1769 	ld farptr+1,a 
      008AE4 90               [ 1] 1770 	clr a 
      008AE5 F6 90 5C         [ 1] 1771 	adc a,farptr 
      008AE8 A1 51 26         [ 1] 1772 	ld farptr,a 
      008AEB 0B 0A 48         [ 2] 1773 	jp repl  
                                   1774 
                                   1775 
      008AEC 6E 6F 74 20 61 20 63  1776 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                   1777 .endif 
                                   1778 
                                   1779 ;----------------------------
                                   1780 ; display farptr address
                                   1781 ;----------------------------
      000AEC                       1782 print_farptr:
      008AEC 5B 01 81         [ 1] 1783 	ld a ,farptr+2 
      008AEF C7 00 0A         [ 1] 1784 	ld acc8,a 
      008AEF AE 8B 5D         [ 2] 1785 	ldw x,farptr 
      008AF2 CD 82 B0         [ 2] 1786 	ldw acc24,x 
      008AF5 20               [ 1] 1787 	clrw x 
      008AF6 D1 10            [ 1] 1788 	ld a,#16 
      008AF7 CD 08 C5         [ 4] 1789 	call prti24
      008AF7 A1 50            [ 1] 1790 	ld a,#SPACE 
      008AF9 27 10 A1         [ 4] 1791 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008AFC 53 26 F0         [ 4] 1792 	call putc 
      008AFF 81               [ 4] 1793 	ret
                                   1794 
                                   1795 ;------------------------------------
                                   1796 ; get byte at address farptr[X]
                                   1797 ; input:
                                   1798 ;	 farptr   address to peek
                                   1799 ;    X		  farptr index 	
                                   1800 ; output:
                                   1801 ;	 A 		  byte from memory  
                                   1802 ;    x		  incremented by 1
                                   1803 ;------------------------------------
      000B07                       1804 fetchc: ; @C
      008AFF CD 8C C8 CE      [ 5] 1805 	ldf a,([farptr],x)
      008B03 00               [ 1] 1806 	incw x
      008B04 0A               [ 4] 1807 	ret
                                   1808 
                                   1809 
                                   1810 ;------------------------------------
                                   1811 ; expect a number from command line 
                                   1812 ; next argument
                                   1813 ;  input:
                                   1814 ;	  none
                                   1815 ;  output:
                                   1816 ;    acc24   int24_t 
                                   1817 ;------------------------------------
      000B0D                       1818 number::
      008B05 CD 82 B0         [ 4] 1819 	call get_token
      008B08 CC 8A C8         [ 4] 1820 	call atoi
      008B0B 81               [ 4] 1821 	ret
                                   1822 
                                   1823 ;------------------------------------
                                   1824 ; scan tib for charater 'c' starting from 'in'
                                   1825 ; input:
                                   1826 ;	y  point to tib 
                                   1827 ;	a character to skip
                                   1828 ; output:
                                   1829 ;	in point to chacter 'c'
                                   1830 ;------------------------------------
                           000001  1831 	C = 1 ; local var
      000B14                       1832 scan: 
      008B0B CD               [ 1] 1833 	push a
      008B0C 8C C8 C6         [ 4] 1834 1$:	ld a,([in.w],y)
      008B0F 00 09            [ 1] 1835 	jreq 2$
      008B11 CA 00            [ 1] 1836 	cp a,(C,sp)
      008B13 0A CA            [ 1] 1837 	jreq 2$
      008B15 00 0B 26 02      [ 1] 1838 	inc in
      008B19 20 0C            [ 2] 1839 	jra 1$
      008B1B CE               [ 1] 1840 2$: pop a
      008B1C 00               [ 4] 1841 	ret
                                   1842 
                                   1843 ;------------------------------------
                                   1844 ; parse quoted string 
                                   1845 ; input:
                                   1846 ;   Y 	pointer to tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                   1847 ;   X   pointer to pad
                                   1848 ; output:
                                   1849 ;	pad   parsed string
                                   1850 ;   TOS  char* to pad  
                                   1851 ;------------------------------------
                           000001  1852 	PREV = 1
                           000002  1853 	CURR =2 
                           000002  1854 	VSIZE=2 
      000B26                       1855 parse_quote: ; { -- addr }
      000B26                       1856 	_vars VSIZE 
      008B1D 09 CF            [ 2]    1     sub sp,#VSIZE 
      008B1F 00               [ 1] 1857 	clr a
      008B20 15 C6            [ 1] 1858 1$:	ld (PREV,sp),a 
      008B22 00 0B C7 00      [ 1] 1859 2$:	inc in
      008B26 17 D6 00         [ 4] 1860 	ld a,([in.w],y)
      008B27 27 24            [ 1] 1861 	jreq 6$
      008B27 CD 8B            [ 1] 1862 	ld (CURR,sp),a 
      008B29 6C A6            [ 1] 1863 	ld a,#'\
      008B2B 08 6B            [ 1] 1864 	cp a, (PREV,sp)
      008B2D 01 5F            [ 1] 1865 	jrne 3$
      008B2F CD 8B            [ 1] 1866 	clr (PREV,sp)
      008B31 87 89            [ 1] 1867 	ld a,(CURR,sp)
      008B33 C7 00            [ 4] 1868 	callr convert_escape
      008B35 0B               [ 1] 1869 	ld (x),a 
      008B36 5F               [ 1] 1870 	incw x 
      008B37 CF 00            [ 2] 1871 	jra 2$
      000B46                       1872 3$:
      008B39 09 A6            [ 1] 1873 	ld a,(CURR,sp)
      008B3B 90 CD            [ 1] 1874 	cp a,#'\'
      008B3D 89 45            [ 1] 1875 	jreq 1$
      008B3F 85 0A            [ 1] 1876 	cp a,#'"
      008B41 01 26            [ 1] 1877 	jreq 5$ 
      008B43 EB               [ 1] 1878 	ld (x),a 
      008B44 A6               [ 1] 1879 	incw x 
      008B45 08 CB            [ 2] 1880 	jra 2$
      008B47 00 17 C7 00      [ 1] 1881 5$:	inc in 
      008B4B 17               [ 1] 1882 6$: clr (x)
      008B4C 4F C9 00         [ 2] 1883 	ldw x,#pad 
      000B5C                       1884 	_drop VSIZE
      008B4F 16 C7            [ 2]    1     addw sp,#VSIZE 
      008B51 00 16            [ 1] 1885 	ld a,#TK_QSTR  
      008B53 4F               [ 4] 1886 	ret 
                                   1887 
                                   1888 ;---------------------------------------
                                   1889 ; called by parse_quote
                                   1890 ; subtitute escaped character 
                                   1891 ; by their ASCII value .
                                   1892 ; input:
                                   1893 ;   A  character following '\'
                                   1894 ; output:
                                   1895 ;   A  substitued char or same if not valid.
                                   1896 ;---------------------------------------
      000B61                       1897 convert_escape:
      008B54 C9 00            [ 1] 1898 	cp a,#'a'
      008B56 15 C7            [ 1] 1899 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008B58 00 15            [ 1] 1900 	ld a,#7
      008B5A CC               [ 4] 1901 	ret 
      008B5B 8A C8            [ 1] 1902 1$: cp a,#'b'
      008B5D 6E 6F            [ 1] 1903 	jrne 2$
      008B5F 74 20            [ 1] 1904 	ld a,#8
      008B61 61               [ 4] 1905 	ret 
      008B62 20 63            [ 1] 1906 2$: cp a,#'e' 
      008B64 6F 6D            [ 1] 1907     jrne 3$
      008B66 6D 61            [ 1] 1908 	ld a,#'\'
      008B68 6E               [ 4] 1909 	ret  
      008B69 64 0A            [ 1] 1910 3$: cp a,#'\'
      008B6B 00 03            [ 1] 1911 	jrne 4$
      008B6C A6 5C            [ 1] 1912 	ld a,#'\'
      008B6C C6               [ 4] 1913 	ret 
      008B6D 00 17            [ 1] 1914 4$: cp a,#'f' 
      008B6F C7 00            [ 1] 1915 	jrne 5$ 
      008B71 0B CE            [ 1] 1916 	ld a,#FF 
      008B73 00               [ 4] 1917 	ret  
      008B74 15 CF            [ 1] 1918 5$: cp a,#'n' 
      008B76 00 09            [ 1] 1919     jrne 6$ 
      008B78 5F A6            [ 1] 1920 	ld a,#0xa 
      008B7A 10               [ 4] 1921 	ret  
      008B7B CD 89            [ 1] 1922 6$: cp a,#'r' 
      008B7D 45 A6            [ 1] 1923 	jrne 7$
      008B7F 20 CD            [ 1] 1924 	ld a,#0xd 
      008B81 82               [ 4] 1925 	ret  
      008B82 9E CD            [ 1] 1926 7$: cp a,#'t' 
      008B84 82 9E            [ 1] 1927 	jrne 8$ 
      008B86 81 09            [ 1] 1928 	ld a,#9 
      008B87 81               [ 4] 1929 	ret  
      008B87 92 AF            [ 1] 1930 8$: cp a,#'v' 
      008B89 00 15            [ 1] 1931 	jrne 9$  
      008B8B 5C 81            [ 1] 1932 	ld a,#0xb 
      008B8D 81               [ 4] 1933 9$:	ret 
                                   1934 
                                   1935 ;-------------------------
                                   1936 ; integer parser 
                                   1937 ; input:
                                   1938 ;   X 		point to pad 
                                   1939 ;   Y 		point to tib 
                                   1940 ;   A 	    first digit|'$' 
                                   1941 ; output:  
                                   1942 ;   pad     number string 
                                   1943 ;   X 		integer 
                                   1944 ;   A 		TK_INTGR
                                   1945 ;   TOS     integer 
                                   1946 ;-------------------------
                           000001  1947 	BASE=1
                           000002  1948 	TCHAR=2 
                           000002  1949 	VSIZE=2 
      000BA0                       1950 parse_integer: ; { -- n }
      008B8D CD 8C            [ 1] 1951 	push #0 ; TCHAR 
      008B8F C8 CD            [ 1] 1952 	cp a,#'$
      008B91 8E CF            [ 1] 1953 	jreq 1$ 
      008B93 81 0A            [ 1] 1954 	push #10 ; BASE=10 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008B94 20 02            [ 2] 1955 	jra 2$ 
      008B94 88 91            [ 1] 1956 1$: push #16  ; BASE=16
      008B96 D6               [ 1] 1957 2$:	ld (x),a 
      008B97 01               [ 1] 1958 	incw x 
      008B98 27 0A 11 01      [ 1] 1959 	inc in 
      008B9C 27 06 72         [ 4] 1960 	ld a,([in.w],y)
      008B9F 5C 00 02         [ 4] 1961 	call to_upper 
      008BA2 20 F1            [ 1] 1962 	ld (TCHAR,sp),a 
      008BA4 84 81 16         [ 4] 1963 	call is_digit 
      008BA6 25 ED            [ 1] 1964 	jrc 2$
      008BA6 52 02            [ 1] 1965 	ld a,#16 
      008BA8 4F 6B            [ 1] 1966 	cp a,(BASE,sp)
      008BAA 01 72            [ 1] 1967 	jrne 3$ 
      008BAC 5C 00            [ 1] 1968 	ld a,(TCHAR,sp)
      008BAE 02 91            [ 1] 1969 	cp a,#'A 
      008BB0 D6 01            [ 1] 1970 	jrmi 3$ 
      008BB2 27 24            [ 1] 1971 	cp a,#'G 
      008BB4 6B 02            [ 1] 1972 	jrmi 2$ 
      008BB6 A6               [ 1] 1973 3$:	clr (x)
      008BB7 5C 11 01         [ 4] 1974 	call atoi
      008BBA 26 0A 0F         [ 2] 1975 	ldw x,acc16 
      008BBD 01 7B            [ 1] 1976 	ld a,#TK_INTGR
      000BD8                       1977 	_drop VSIZE  
      008BBF 02 AD            [ 2]    1     addw sp,#VSIZE 
      008BC1 1F               [ 4] 1978 	ret 	
                                   1979 
                                   1980 ;-------------------------
                                   1981 ; binary integer parser 
                                   1982 ; input:
                                   1983 ;   X 		point to pad 
                                   1984 ;   Y 		point to tib 
                                   1985 ;   A 	    '%' 
                                   1986 ; output:  
                                   1987 ;   pad     number string 
                                   1988 ;   X 		integer 
                                   1989 ;   A 		TK_INTGR
                                   1990 ;   TOS     integer 
                                   1991 ;-------------------------
                           000001  1992 	BINARY=1
                           000002  1993 	VSIZE=2
      000BDB                       1994 parse_binary: ; { -- n }
      008BC2 F7 5C            [ 1] 1995 	push #0
      008BC4 20 E5            [ 1] 1996 	push #0
      008BC6 F7               [ 1] 1997 1$: ld (x),a 
      008BC6 7B               [ 1] 1998 	incw x 
      008BC7 02 A1 5C 27      [ 1] 1999 	inc in 
      008BCB DD A1 22         [ 4] 2000 	ld a,([in.w],y)
      008BCE 27 04            [ 1] 2001 	cp a,#'0 
      008BD0 F7 5C            [ 1] 2002 	jreq 2$
      008BD2 20 D7            [ 1] 2003 	cp a,#'1 
      008BD4 72 5C            [ 1] 2004 	jreq 2$ 
      008BD6 00 02            [ 2] 2005 	jra bin_exit 
      008BD8 7F AE            [ 1] 2006 2$: sub a,#'0	
      008BDA 17               [ 1] 2007 	rrc a 
      008BDB 18 5B            [ 1] 2008 	rlc (BINARY+1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008BDD 02 A6            [ 1] 2009 	rlc (BINARY,sp)
      008BDF 06 81            [ 2] 2010 	jra 1$  
      008BE1                       2011 bin_exit:
      008BE1 A1               [ 1] 2012 	clr (x)
      008BE2 61 26            [ 2] 2013 	ldw x,(BINARY,sp)
      008BE4 03 A6            [ 1] 2014 	ld a,#TK_INTGR 	
      000C00                       2015 	_drop VSIZE 
      008BE6 07 81            [ 2]    1     addw sp,#VSIZE 
      008BE8 A1               [ 4] 2016 	ret
                                   2017 
                                   2018 ;---------------------------
                                   2019 ;  token begin with a letter,
                                   2020 ;  is keyword or variable. 	
                                   2021 ; input:
                                   2022 ;   X 		point to pad 
                                   2023 ;   Y 		point to text
                                   2024 ;   A 	    first letter  
                                   2025 ; output:
                                   2026 ;   X		exec_addr|var_addr 
                                   2027 ;   A 		TK_CMD 
                                   2028 ;   pad 	keyword|var_name  
                                   2029 ;   TOS     exec_addr|var_addr 
                                   2030 ;--------------------------  
      000C03                       2031 parse_keyword: ; { -- exec_addr|var_addr}
      008BE9 62 26 03         [ 4] 2032 	call to_upper 
      008BEC A6               [ 1] 2033 	ld (x),a 
      008BED 08               [ 1] 2034 	incw x 
      008BEE 81 A1 65 26      [ 1] 2035 	inc in 
      008BF2 03 A6 5C         [ 4] 2036 	ld a,([in.w],y)
      008BF5 81 A1 5C         [ 4] 2037 	call is_alpha 
      008BF8 26 03            [ 1] 2038 	jrc parse_keyword 
      008BFA A6               [ 1] 2039 1$: clr (x)
      008BFB 5C 81 A1 66      [ 1] 2040 	tnz pad+1 
      008BFF 26 03            [ 1] 2041 	jrne 2$
                                   2042 ; one letter variable name 
      008C01 A6 0C 81         [ 1] 2043 	ld a,pad 
      008C04 A1 6E            [ 1] 2044 	sub a,#'A 
      008C06 26               [ 1] 2045 	sll a 
      008C07 03               [ 1] 2046 	push a 
      008C08 A6 0A            [ 1] 2047 	push #0
      008C0A 81 A1 72         [ 2] 2048 	ldw x,#vars 
      008C0D 26 03 A6         [ 2] 2049 	addw x,(1,sp) ; X=var address 
      000C2A                       2050 	_drop 2 
      008C10 0D 81            [ 2]    1     addw sp,#2 
      008C12 A1 74            [ 1] 2051 	ld a,#TK_VAR 
      008C14 26 03            [ 2] 2052 	jra 4$ 
      000C30                       2053 2$: ; check for keyword, otherwise syntax error.
      000C30                       2054 	_ldx_dict kword_dict
      008C16 A6 09 81         [ 2]    1     ldw x,#kword_dict+2
      008C19 A1 76 26         [ 4] 2055 	call search_dict
      008C1C 02               [ 1] 2056 	tnz a
      008C1D A6 0B            [ 1] 2057 	jrne 3$ 
      008C1F 81 06 90         [ 2] 2058 	jp syntax_error
      008C20 A3 15 12         [ 2] 2059 3$: cpw x,#rem  
      008C20 4B 00            [ 1] 2060 	jrne 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008C22 A1 24 27 04 4B   [ 1] 2061 	mov in,count 
      008C27 0A               [ 1] 2062 	clr a 
      008C28 20               [ 4] 2063 4$:	ret  	
                                   2064 
                                   2065 
                                   2066 ;------------------------------------
                                   2067 ; Command line tokenizer
                                   2068 ; scan text for next token
                                   2069 ; move token in 'pad'
                                   2070 ; input: 
      000C48                       2071 	none: 
                                   2072 ; use:
                                   2073 ;	Y   pointer to text
                                   2074 ;   X	pointer to pad 
                                   2075 ;   in.w   index in text buffer
                                   2076 ; output:
                                   2077 ;   A       token attribute 
                                   2078 ;   pad 	token as .asciz
                                   2079 ;   X 		token value   
                                   2080 ;------------------------------------
                                   2081 	; use to check special character 
                                   2082 	.macro _case c t  
                                   2083 	ld a,#c 
                                   2084 	cp a,(TCHAR,sp) 
                                   2085 	jrne t
                                   2086 	.endm 
                                   2087 
                           000001  2088 	TCHAR=1
                           000002  2089 	ATTRIB=2 
                           000002  2090 	VSIZE=2
      000C48                       2091 get_token: ; { -- tokval }
      008C29 02 4B 10 F7      [ 1] 2092 	tnz untok 
      008C2D 5C 72            [ 1] 2093 	jreq 1$
      008C2F 5C 00 02         [ 1] 2094 	ld a,untok
      008C32 91 D6 01 CD      [ 1] 2095 	clr untok 
      008C36 8E AA 6B         [ 2] 2096 	ldw x,tokval
      008C39 02 CD 8E 96      [ 1] 2097 	clr tokval 
      008C3D 25 ED A6 10      [ 1] 2098 	clr tokval+1 
      008C41 11               [ 4] 2099 	ret 
      000C61                       2100 1$:	
      008C42 01 26 0A 7B      [ 2] 2101 	ldw y,basicptr   	
      008C46 02 A1 41         [ 1] 2102 	ld a,in 
      008C49 2B 04 A1         [ 1] 2103 	cp a,count 
      008C4C 47 2B            [ 1] 2104 	jrmi 11$
      008C4E DD 7F            [ 1] 2105 	ld a,#TK_NONE 
      008C50 CD               [ 4] 2106 	ret 
      000C70                       2107 11$:	
      000C70                       2108 	_vars VSIZE
      008C51 8E CF            [ 2]    1     sub sp,#VSIZE 
      008C53 CE 00 0A         [ 2] 2109 	ldw x, #pad
      008C56 A6 0A            [ 1] 2110 	ld a,#SPACE
      008C58 5B 02 81         [ 4] 2111 	call skip
      008C5B 91 D6 00         [ 4] 2112 	ld a,([in.w],y)
      008C5B 4B 00            [ 1] 2113 	jrne str_tst
      008C5D 4B 00 F7 5C      [ 1] 2114 	clr pad 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008C61 72 5C 00         [ 2] 2115 	jp token_exit ; end of line 
                                   2116 
      000C86                       2117 str_tst: ; check for quoted string  	
      008C64 02 91 D6         [ 4] 2118 	call to_upper 
      008C67 01 A1            [ 1] 2119 	ld (TCHAR,sp),a 
      000C8B                       2120 	_case '"' nbr_tst
      008C69 30 27            [ 1]    1 	ld a,#'"' 
      008C6B 06 A1            [ 1]    2 	cp a,(TCHAR,sp) 
      008C6D 31 27            [ 1]    3 	jrne nbr_tst
      008C6F 02 20 09         [ 4] 2121 	call parse_quote
      008C72 A0 30 46         [ 2] 2122 	jp token_exit
      000C97                       2123 nbr_tst: ; check for number 
      008C75 09 02            [ 1] 2124 	ld a,#'$'
      008C77 09 01            [ 1] 2125 	cp a,(TCHAR,sp) 
      008C79 20 E4            [ 1] 2126 	jreq 1$
      008C7B A6 26            [ 1] 2127 	ld a,#'&
      008C7B 7F 1E            [ 1] 2128 	cp a,(TCHAR,sp)
      008C7D 01 A6            [ 1] 2129 	jrne 0$
      008C7F 0A 5B 02         [ 4] 2130 	call parse_binary ; expect binary integer 
      008C82 81 0E 13         [ 2] 2131 	jp token_exit 
      008C83 7B 01            [ 1] 2132 0$:	ld a,(TCHAR,sp)
      008C83 CD 8E AA         [ 4] 2133 	call is_digit
      008C86 F7 5C            [ 1] 2134 	jrnc 3$
      008C88 72 5C 00         [ 4] 2135 1$:	call parse_integer 
      008C8B 02 91 D6         [ 2] 2136 	jp token_exit 
      000CB6                       2137 3$: 
      000CB6                       2138 	_case '(' bkslsh_tst 
      008C8E 01 CD            [ 1]    1 	ld a,#'(' 
      008C90 85 0C            [ 1]    2 	cp a,(TCHAR,sp) 
      008C92 25 EF            [ 1]    3 	jrne bkslsh_tst
      008C94 7F 72            [ 1] 2139 	ld a,#TK_LPAREN
      008C96 5D 17 19         [ 2] 2140 	jp token_char   	
      000CC1                       2141 bkslsh_tst:
      000CC1                       2142 	_case '\',rparnt_tst
      008C99 26 15            [ 1]    1 	ld a,#'\' 
      008C9B C6 17            [ 1]    2 	cp a,(TCHAR,sp) 
      008C9D 18 A0            [ 1]    3 	jrne rparnt_tst
      008C9F 41 48            [ 1] 2143 	ld a,(TCHAR,sp)
      008CA1 88               [ 1] 2144 	ld (x),a 
      008CA2 4B               [ 1] 2145 	incw x 
      008CA3 00 AE 00 28      [ 1] 2146 	inc in 
      008CA7 72 FB 01         [ 4] 2147 	ld a,([in.w],y)
      008CAA 5B               [ 1] 2148 	ld (x),a 
      008CAB 02               [ 1] 2149 	incw x 
      008CAC A6 02 20 17      [ 1] 2150 	inc in  
      008CB0 7F               [ 1] 2151 	clr (x) 
      008CB0 AE               [ 1] 2152 	ld xl,a 
      008CB1 9E 34            [ 1] 2153 	ld a,#TK_CHAR 
      008CB3 CD 91 77         [ 2] 2154 	jp token_exit 
      000CDF                       2155 rparnt_tst:		
      000CDF                       2156 	_case ')' colon_tst 
      008CB6 4D 26            [ 1]    1 	ld a,#')' 
      008CB8 03 CC            [ 1]    2 	cp a,(TCHAR,sp) 
      008CBA 87 10            [ 1]    3 	jrne colon_tst
      008CBC A3 95            [ 1] 2157 	ld a,#TK_RPAREN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008CBE 92 26 06         [ 2] 2158 	jp token_char 
      000CEA                       2159 colon_tst:
      000CEA                       2160 	_case ':' comma_tst 
      008CC1 55 00            [ 1]    1 	ld a,#':' 
      008CC3 03 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008CC5 02 4F            [ 1]    3 	jrne comma_tst
      008CC7 81 01            [ 1] 2161 	ld a,#TK_COLON 
      008CC8 CC 0E 03         [ 2] 2162 	jp token_char 
      008CC8                       2163 comma_tst:
      000CF5                       2164 	_case COMMA sharp_tst 
      008CC8 72 5D            [ 1]    1 	ld a,#COMMA 
      008CCA 00 12            [ 1]    2 	cp a,(TCHAR,sp) 
      008CCC 27 13            [ 1]    3 	jrne sharp_tst
      008CCE C6 00            [ 1] 2165 	ld a,#TK_COMMA
      008CD0 12 72 5F         [ 2] 2166 	jp token_char
      000D00                       2167 sharp_tst:
      000D00                       2168 	_case SHARP dash_tst 
      008CD3 00 12            [ 1]    1 	ld a,#SHARP 
      008CD5 CE 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008CD7 13 72            [ 1]    3 	jrne dash_tst
      008CD9 5F 00            [ 1] 2169 	ld a,#TK_SHARP
      008CDB 13 72 5F         [ 2] 2170 	jp token_char  	 	 
      000D0B                       2171 dash_tst: 	
      000D0B                       2172 	_case '-' at_tst 
      008CDE 00 14            [ 1]    1 	ld a,#'-' 
      008CE0 81 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CE1 26 05            [ 1]    3 	jrne at_tst
      008CE1 90 CE            [ 1] 2173 	ld a,#TK_MINUS  
      008CE3 00 04 C6         [ 2] 2174 	jp token_char 
      000D16                       2175 at_tst:
      000D16                       2176 	_case '@' qmark_tst 
      008CE6 00 02            [ 1]    1 	ld a,#'@' 
      008CE8 C1 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008CEA 03 2B            [ 1]    3 	jrne qmark_tst
      008CEC 03 A6            [ 1] 2177 	ld a,#TK_ARRAY 
      008CEE 00 81 03         [ 2] 2178 	jp token_char
      008CF0                       2179 qmark_tst:
      000D21                       2180 	_case '?' tick_tst 
      008CF0 52 02            [ 1]    1 	ld a,#'?' 
      008CF2 AE 17            [ 1]    2 	cp a,(TCHAR,sp) 
      008CF4 18 A6            [ 1]    3 	jrne tick_tst
      008CF6 20 CD            [ 1] 2181 	ld a,(TCHAR,sp)
      008CF8 8F               [ 1] 2182 	ld (x),a 
      008CF9 7B               [ 1] 2183 	incw x 
      008CFA 91               [ 1] 2184 	clr (x)
      008CFB D6 01 26 07      [ 1] 2185 	inc in 
      008CFF 72 5F            [ 1] 2186 	ld a,#TK_CMD 
      008D01 17 18 CC         [ 2] 2187 	ldw x,#print 
      008D04 8E 93 13         [ 2] 2188 	jp token_exit
      008D06                       2189 tick_tst: ; ignore comment 
      000D38                       2190 	_case TICK plus_tst 
      008D06 CD 8E            [ 1]    1 	ld a,#TICK 
      008D08 AA 6B            [ 1]    2 	cp a,(TCHAR,sp) 
      008D0A 01 A6            [ 1]    3 	jrne plus_tst
      008D0C 22 11            [ 1] 2191 	ld a,(TCHAR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008D0E 01               [ 1] 2192 	ld (x),a 
      008D0F 26               [ 1] 2193 	incw x 
      008D10 06               [ 1] 2194 	clr (x)
      008D11 CD 8B A6 CC 8E   [ 1] 2195 	mov in,count  
      008D16 93               [ 1] 2196 	clr a 
      008D17 CC 0E 13         [ 2] 2197 	jp token_exit 
      000D4C                       2198 plus_tst:
      000D4C                       2199 	_case '+' star_tst 
      008D17 A6 24            [ 1]    1 	ld a,#'+' 
      008D19 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D1B 27 13            [ 1]    3 	jrne star_tst
      008D1D A6 26            [ 1] 2200 	ld a,#TK_PLUS  
      008D1F 11 01 26         [ 2] 2201 	jp token_char 
      000D57                       2202 star_tst:
      000D57                       2203 	_case '*' slash_tst 
      008D22 06 CD            [ 1]    1 	ld a,#'*' 
      008D24 8C 5B            [ 1]    2 	cp a,(TCHAR,sp) 
      008D26 CC 8E            [ 1]    3 	jrne slash_tst
      008D28 93 7B            [ 1] 2204 	ld a,#TK_MULT 
      008D2A 01 CD 8E         [ 2] 2205 	jp token_char 
      000D62                       2206 slash_tst: 
      000D62                       2207 	_case '/' prcnt_tst 
      008D2D 96 24            [ 1]    1 	ld a,#'/' 
      008D2F 06 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008D31 8C 20            [ 1]    3 	jrne prcnt_tst
      008D33 CC 8E            [ 1] 2208 	ld a,#TK_DIV 
      008D35 93 0E 03         [ 2] 2209 	jp token_char 
      008D36                       2210 prcnt_tst:
      000D6D                       2211 	_case '%' eql_tst 
      008D36 A6 28            [ 1]    1 	ld a,#'%' 
      008D38 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D3A 26 05            [ 1]    3 	jrne eql_tst
      008D3C A6 04            [ 1] 2212 	ld a,#TK_MOD
      008D3E CC 8E 83         [ 2] 2213 	jp token_char  
                                   2214 ; 1 or 2 character tokens 	
      008D41                       2215 eql_tst:
      000D78                       2216 	_case '=' gt_tst 		
      008D41 A6 5C            [ 1]    1 	ld a,#'=' 
      008D43 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D45 26 18            [ 1]    3 	jrne gt_tst
      008D47 7B 01            [ 1] 2217 	ld a,#TK_EQUAL
      008D49 F7 5C 72         [ 2] 2218 	jp token_char 
      000D83                       2219 gt_tst:
      000D83                       2220 	_case '>' lt_tst 
      008D4C 5C 00            [ 1]    1 	ld a,#'>' 
      008D4E 02 91            [ 1]    2 	cp a,(TCHAR,sp) 
      008D50 D6 01            [ 1]    3 	jrne lt_tst
      008D52 F7 5C            [ 1] 2221 	ld a,#TK_GT 
      008D54 72 5C            [ 1] 2222 	ld (ATTRIB,sp),a 
      008D56 00 02 7F 97      [ 1] 2223 	inc in 
      008D5A A6 0B CC         [ 4] 2224 	ld a,([in.w],y)
      008D5D 8E 93            [ 1] 2225 	cp a,#'=
      008D5F 26 0C            [ 1] 2226 	jrne 1$
      008D5F A6 29            [ 1] 2227 	ld a,(TCHAR,sp)
      008D61 11               [ 1] 2228 	ld (x),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008D62 01               [ 1] 2229 	incw x 
      008D63 26 05            [ 1] 2230 	ld a,#'=
      008D65 A6 05            [ 1] 2231 	ld (TCHAR,sp),a 
      008D67 CC 8E            [ 1] 2232 	ld a,#TK_GE 
      008D69 83 5F            [ 2] 2233 	jra token_char  
      008D6A A1 3C            [ 1] 2234 1$: cp a,#'<
      008D6A A6 3A            [ 1] 2235 	jrne 2$
      008D6C 11 01            [ 1] 2236 	ld a,(TCHAR,sp)
      008D6E 26               [ 1] 2237 	ld (x),a
      008D6F 05               [ 1] 2238 	incw x 
      008D70 A6 01            [ 1] 2239 	ld a,#'<	
      008D72 CC 8E            [ 1] 2240 	ld (TCHAR,sp),a 
      008D74 83 35            [ 1] 2241 	ld a,#TK_NE 
      008D75 20 4F            [ 2] 2242 	jra token_char 
      008D75 A6 2C 11 01      [ 1] 2243 2$: dec in
      008D79 26 05            [ 1] 2244 	ld a,(ATTRIB,sp)
      008D7B A6 08            [ 2] 2245 	jra token_char 
      000DBC                       2246 lt_tst:
      000DBC                       2247 	_case '<' other
      008D7D CC 8E            [ 1]    1 	ld a,#'<' 
      008D7F 83 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D80 26 32            [ 1]    3 	jrne other
      008D80 A6 23            [ 1] 2248 	ld a,#TK_LT 
      008D82 11 01            [ 1] 2249 	ld (ATTRIB,sp),a 
      008D84 26 05 A6 09      [ 1] 2250 	inc in 
      008D88 CC 8E 83         [ 4] 2251 	ld a,([in.w],y)
      008D8B A1 3D            [ 1] 2252 	cp a,#'=
      008D8B A6 2D            [ 1] 2253 	jrne 1$
      008D8D 11 01            [ 1] 2254 	ld a,(TCHAR,sp)
      008D8F 26               [ 1] 2255 	ld (x),a 
      008D90 05 A6            [ 1] 2256 	ld a,#'=
      008D92 11 CC            [ 1] 2257 	ld (TCHAR,sp),a 
      008D94 8E 83            [ 1] 2258 	ld a,#TK_LE 
      008D96 20 27            [ 2] 2259 	jra token_char 
      008D96 A6 40            [ 1] 2260 1$: cp a,#'>
      008D98 11 01            [ 1] 2261 	jrne 2$
      008D9A 26 05            [ 1] 2262 	ld a,(TCHAR,sp)
      008D9C A6               [ 1] 2263 	ld (x),a 
      008D9D 03               [ 1] 2264 	incw x 
      008D9E CC 8E            [ 1] 2265 	ld a,#'>
      008DA0 83 01            [ 1] 2266 	ld (TCHAR,sp),a 
      008DA1 A6 35            [ 1] 2267 	ld a,#TK_NE 
      008DA1 A6 3F            [ 2] 2268 	jra token_char 
      008DA3 11 01 26 11      [ 1] 2269 2$: dec in 
      008DA7 7B 01            [ 1] 2270 	ld a,(ATTRIB,sp)
      008DA9 F7 5C            [ 2] 2271 	jra token_char 	
      000DF4                       2272 other: ; not a special character 	 
      008DAB 7F 72            [ 1] 2273 	ld a,(TCHAR,sp)
      008DAD 5C 00 02         [ 4] 2274 	call is_alpha 
      008DB0 A6 07            [ 1] 2275 	jrc 30$ 
      008DB2 AE 94 81         [ 2] 2276 	jp syntax_error 
      000DFE                       2277 30$: 
      008DB5 CC 8E 93         [ 4] 2278 	call parse_keyword
      008DB8 20 10            [ 2] 2279 	jra token_exit 
      000E03                       2280 token_char:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008DB8 A6 27            [ 1] 2281 	ld (ATTRIB,sp),a 
      008DBA 11 01            [ 1] 2282 	ld a,(TCHAR,sp)
      008DBC 26               [ 1] 2283 	ld (x),a 
      008DBD 0E               [ 1] 2284 	incw x 
      008DBE 7B               [ 1] 2285 	clr(x)
      008DBF 01 F7 5C 7F      [ 1] 2286 	inc in 
      008DC3 55 00            [ 1] 2287 	ld a,(ATTRIB,sp)
      008DC5 03 00 02         [ 2] 2288 	ldw x,#pad 
      000E13                       2289 token_exit:
      000E13                       2290 	_drop VSIZE 
      008DC8 4F CC            [ 2]    1     addw sp,#VSIZE 
      008DCA 8E               [ 4] 2291 	ret
                                   2292 
                                   2293 
                                   2294 
                                   2295 ;------------------------------------
                                   2296 ; check if character in {'0'..'9'}
                                   2297 ; input:
                                   2298 ;    A  character to test
                                   2299 ; output:
                                   2300 ;    Carry  0 not digit | 1 digit
                                   2301 ;------------------------------------
      000E16                       2302 is_digit:
      008DCB 93 30            [ 1] 2303 	cp a,#'0
      008DCC 25 03            [ 1] 2304 	jrc 1$
      008DCC A6 2B            [ 1] 2305     cp a,#'9+1
      008DCE 11               [ 1] 2306 	ccf 
      008DCF 01               [ 1] 2307 1$:	ccf 
      008DD0 26               [ 4] 2308     ret
                                   2309 
                                   2310 ;----------------------------------
                                   2311 ; convert to lower case
                                   2312 ; input: 
                                   2313 ;   A 		character to convert
                                   2314 ; output:
                                   2315 ;   A		result 
                                   2316 ;----------------------------------
      000E1F                       2317 to_lower::
      008DD1 05 A6            [ 1] 2318 	cp a,#'A
      008DD3 10 CC            [ 1] 2319 	jrult 9$
      008DD5 8E 83            [ 1] 2320 	cp a,#'Z 
      008DD7 22 02            [ 1] 2321 	jrugt 9$
      008DD7 A6 2A            [ 1] 2322 	add a,#32
      008DD9 11               [ 4] 2323 9$: ret
                                   2324 
                                   2325 ;------------------------------------
                                   2326 ; convert alpha to uppercase
                                   2327 ; input:
                                   2328 ;    a  character to convert
                                   2329 ; output:
                                   2330 ;    a  uppercase character
                                   2331 ;------------------------------------
      000E2A                       2332 to_upper::
      008DDA 01 26            [ 1] 2333 	cp a,#'a
      008DDC 05 A6            [ 1] 2334 	jrpl 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008DDE 20               [ 4] 2335 0$:	ret
      008DDF CC 8E            [ 1] 2336 1$: cp a,#'z	
      008DE1 83 FB            [ 1] 2337 	jrugt 0$
      008DE2 A0 20            [ 1] 2338 	sub a,#32
      008DE2 A6               [ 4] 2339 	ret
                                   2340 	
                                   2341 ;------------------------------------
                                   2342 ; uppercase pad content
                                   2343 ; input:
                                   2344 ;	pad      .asciz 
                                   2345 ; output:
                                   2346 ;   pad      uppercase string 
                                   2347 ;------------------------------------
      000E36                       2348 upper:
      008DE3 2F 11 01 26      [ 2] 2349 	ldw y,#pad 
      000E3A                       2350 upper_loop:	
      008DE7 05 A6            [ 1] 2351 	ld a,(y)
      008DE9 21 CC            [ 1] 2352 	jreq 4$
      008DEB 8E 83            [ 1] 2353 	cp a,#'a 
      008DED 2B 0C            [ 1] 2354 	jrmi 4$
      008DED A6 25            [ 1] 2355 	cp a,#'z+1 
      008DEF 11 01            [ 1] 2356 	jrpl 4$ 
      008DF1 26 05            [ 1] 2357 	sub a,#0x20 
      008DF3 A6 22            [ 1] 2358 	ld (y),a 
      008DF5 CC 8E            [ 1] 2359 	incw y 
      008DF7 83 EC            [ 2] 2360 	jra upper_loop
      008DF8 81               [ 4] 2361 4$: ret 
                                   2362 
                                   2363 ;------------------------------------
                                   2364 ; convert pad content in integer
                                   2365 ; input:
                                   2366 ;    pad		.asciz to convert
                                   2367 ; output:
                                   2368 ;    acc24      int24_t
                                   2369 ;------------------------------------
                                   2370 	; local variables
                           000001  2371 	SIGN=1 ; 1 byte, 
                           000002  2372 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2373 	TEMP=3 ; 1 byte, temporary storage
                           000003  2374 	VSIZE=3 ; 3 bytes reserved for local storage
      000E4F                       2375 atoi:
      008DF8 A6               [ 2] 2376 	pushw x ;save x
      008DF9 3D 11            [ 2] 2377 	sub sp,#VSIZE
                                   2378 	; acc24=0 
      008DFB 01 26 05 A6      [ 1] 2379 	clr acc24    
      008DFF 32 CC 8E 83      [ 1] 2380 	clr acc16
      008E03 72 5F 00 0A      [ 1] 2381 	clr acc8 
      008E03 A6 3E 11         [ 1] 2382 	ld a, pad 
      008E06 01 26            [ 1] 2383 	jreq atoi_exit
      008E08 33 A6            [ 1] 2384 	clr (SIGN,sp)
      008E0A 31 6B            [ 1] 2385 	ld a,#10
      008E0C 02 72            [ 1] 2386 	ld (BASE,sp),a ; default base decimal
      008E0E 5C 00 02         [ 2] 2387 	ldw x,#pad ; pointer to string to convert
      008E11 91               [ 1] 2388 	ld a,(x)
      008E12 D6 01            [ 1] 2389 	jreq 9$  ; completed if 0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008E14 A1 3D            [ 1] 2390 	cp a,#'-
      008E16 26 0C            [ 1] 2391 	jrne 1$
      008E18 7B 01            [ 1] 2392 	cpl (SIGN,sp)
      008E1A F7 5C            [ 2] 2393 	jra 2$
      008E1C A6 3D            [ 1] 2394 1$: cp a,#'$
      008E1E 6B 01            [ 1] 2395 	jrne 3$
      008E20 A6 33            [ 1] 2396 	ld a,#16
      008E22 20 5F            [ 1] 2397 	ld (BASE,sp),a
      008E24 A1               [ 1] 2398 2$:	incw x
      008E25 3C               [ 1] 2399 	ld a,(x)
      000E81                       2400 3$:	
      008E26 26 0C            [ 1] 2401 	cp a,#'a
      008E28 7B 01            [ 1] 2402 	jrmi 4$
      008E2A F7 5C            [ 1] 2403 	sub a,#32
      008E2C A6 3C            [ 1] 2404 4$:	cp a,#'0
      008E2E 6B 01            [ 1] 2405 	jrmi 9$
      008E30 A6 35            [ 1] 2406 	sub a,#'0
      008E32 20 4F            [ 1] 2407 	cp a,#10
      008E34 72 5A            [ 1] 2408 	jrmi 5$
      008E36 00 02            [ 1] 2409 	sub a,#7
      008E38 7B 02            [ 1] 2410 	cp a,(BASE,sp)
      008E3A 20 47            [ 1] 2411 	jrpl 9$
      008E3C 6B 03            [ 1] 2412 5$:	ld (TEMP,sp),a
      008E3C A6 3C            [ 1] 2413 	ld a,(BASE,sp)
      008E3E 11 01 26         [ 4] 2414 	call mulu24_8
      008E41 32 A6            [ 1] 2415 	ld a,(TEMP,sp)
      008E43 34 6B 02         [ 1] 2416 	add a,acc24+2
      008E46 72 5C 00         [ 1] 2417 	ld acc24+2,a
      008E49 02               [ 1] 2418 	clr a
      008E4A 91 D6 01         [ 1] 2419 	adc a,acc24+1
      008E4D A1 3D 26         [ 1] 2420 	ld acc24+1,a
      008E50 0B               [ 1] 2421 	clr a
      008E51 7B 01 F7         [ 1] 2422 	adc a,acc24
      008E54 A6 3D 6B         [ 1] 2423 	ld acc24,a
      008E57 01 A6            [ 2] 2424 	jra 2$
      008E59 36 20            [ 1] 2425 9$:	tnz (SIGN,sp)
      008E5B 27 A1            [ 1] 2426     jreq atoi_exit
      008E5D 3E 26 0C         [ 4] 2427     call neg_acc24
      000EBD                       2428 atoi_exit: 
      008E60 7B 01            [ 2] 2429 	addw sp,#VSIZE
      008E62 F7               [ 2] 2430 	popw x ; restore x
      008E63 5C               [ 4] 2431 	ret
                                   2432 
                                   2433 ;--------------------------------------
                                   2434 ; unsigned multiply uint24_t by uint8_t
                                   2435 ; use to convert numerical string to uint24_t
                                   2436 ; input:
                                   2437 ;	acc24	uint24_t 
                                   2438 ;   A		uint8_t
                                   2439 ; output:
                                   2440 ;   acc24   A*acc24
                                   2441 ;-------------------------------------
                                   2442 ; local variables offset  on sp
                           000003  2443 	U8   = 3   ; A pushed on stack
                           000002  2444 	OVFL = 2  ; multiplicaton overflow low byte
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                           000001  2445 	OVFH = 1  ; multiplication overflow high byte
                           000003  2446 	VSIZE = 3
      000EC1                       2447 mulu24_8:
      008E64 A6               [ 2] 2448 	pushw x    ; save X
                                   2449 	; local variables
      008E65 3E               [ 1] 2450 	push a     ; U8
      008E66 6B               [ 1] 2451 	clrw x     ; initialize overflow to 0
      008E67 01               [ 2] 2452 	pushw x    ; multiplication overflow
                                   2453 ; multiply low byte.
      008E68 A6 35 20         [ 1] 2454 	ld a,acc24+2
      008E6B 17               [ 1] 2455 	ld xl,a
      008E6C 72 5A            [ 1] 2456 	ld a,(U8,sp)
      008E6E 00               [ 4] 2457 	mul x,a
      008E6F 02               [ 1] 2458 	ld a,xl
      008E70 7B 02 20         [ 1] 2459 	ld acc24+2,a
      008E73 0F               [ 1] 2460 	ld a, xh
      008E74 6B 02            [ 1] 2461 	ld (OVFL,sp),a
                                   2462 ; multipy middle byte
      008E74 7B 01 CD         [ 1] 2463 	ld a,acc24+1
      008E77 85               [ 1] 2464 	ld xl,a
      008E78 0C 25            [ 1] 2465 	ld a, (U8,sp)
      008E7A 03               [ 4] 2466 	mul x,a
                                   2467 ; add overflow to this partial product
      008E7B CC 87 10         [ 2] 2468 	addw x,(OVFH,sp)
      008E7E 9F               [ 1] 2469 	ld a,xl
      008E7E CD 8C 83         [ 1] 2470 	ld acc24+1,a
      008E81 20               [ 1] 2471 	clr a
      008E82 10 00            [ 1] 2472 	adc a,#0
      008E83 6B 01            [ 1] 2473 	ld (OVFH,sp),a
      008E83 6B               [ 1] 2474 	ld a,xh
      008E84 02 7B            [ 1] 2475 	ld (OVFL,sp),a
                                   2476 ; multiply most signficant byte	
      008E86 01 F7 5C         [ 1] 2477 	ld a, acc24
      008E89 7F               [ 1] 2478 	ld xl, a
      008E8A 72 5C            [ 1] 2479 	ld a, (U8,sp)
      008E8C 00               [ 4] 2480 	mul x,a
      008E8D 02 7B 02         [ 2] 2481 	addw x, (OVFH,sp)
      008E90 AE               [ 1] 2482 	ld a, xl
      008E91 17 18 08         [ 1] 2483 	ld acc24,a
      008E93 5B 03            [ 2] 2484     addw sp,#VSIZE
      008E93 5B               [ 2] 2485 	popw x
      008E94 02               [ 4] 2486 	ret
                                   2487 
                                   2488 ;------------------------------------
                                   2489 ; skip character c in text starting from 'in'
                                   2490 ; input:
                                   2491 ;	 y 		point to text buffer
                                   2492 ;    a 		character to skip
                                   2493 ; output:  
                                   2494 ;	'in' ajusted to new position
                                   2495 ;------------------------------------
                           000001  2496 	C = 1 ; local var
      000EFB                       2497 skip:
      008E95 81               [ 1] 2498 	push a
      008E96 91 D6 00         [ 4] 2499 1$:	ld a,([in.w],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008E96 A1 30            [ 1] 2500 	jreq 2$
      008E98 25 03            [ 1] 2501 	cp a,(C,sp)
      008E9A A1 3A            [ 1] 2502 	jrne 2$
      008E9C 8C 8C 81 01      [ 1] 2503 	inc in
      008E9F 20 F1            [ 2] 2504 	jra 1$
      000F0B                       2505 2$: _drop 1 
      008E9F A1 41            [ 2]    1     addw sp,#1 
      008EA1 25               [ 4] 2506 	ret
                                   2507 
                                   2508 ;******************************
                                   2509 
                                   2510 ;----------------------	
                                   2511 ; push X on data stack 
                                   2512 ; input:
                                   2513 ;	X 
                                   2514 ; output:
                                   2515 ;	none 
                                   2516 ;----------------------	
      000F0E                       2517 dpush:
      000F0E                       2518     _dp_down
      008EA2 06 A1 5A 22      [ 1]    1     dec dstkptr+1 
      008EA6 02 AB 20 81      [ 1]    2     dec dstkptr+1
      008EAA 72 CF 00 1A      [ 5] 2519     ldw [dstkptr],x  
      008EAA A1               [ 4] 2520 	ret 
                                   2521 
                                   2522 
                                   2523 ;----------------------	
                                   2524 ; pop data stack in X 
                                   2525 ; input:
                                   2526 ;	none
                                   2527 ; output:
                                   2528 ;	X   
                                   2529 ;----------------------	
      000F1B                       2530 dpop: 
      008EAB 61 2A 01 81      [ 5] 2531     ldw x, [dstkptr]
      000F1F                       2532 	_dp_up
      008EAF A1 7A 22 FB      [ 1]    1     inc dstkptr+1
      008EB3 A0 20 81 1B      [ 1]    2     inc dstkptr+1
      008EB6 81               [ 4] 2533 	ret 
                                   2534 
                                   2535 ;-----------------------------
                                   2536 ; swap top 2 elements of dstack
                                   2537 ;  {n1 n2 -- n2 n1 }
                                   2538 ;-----------------------------
      000F28                       2539 dswap:
      008EB6 90 AE 17 18      [ 5] 2540 	ldw x,[dstkptr]
      008EBA 89               [ 2] 2541 	pushw x 
      008EBA 90 F6 27         [ 2] 2542 	ldw x,#2 
      008EBD 10 A1 61 2B      [ 5] 2543 	ldw x,([dstkptr],x) 
      008EC1 0C A1 7B 2A      [ 5] 2544 	ldw [dstkptr],x 
      008EC5 08 A0 20         [ 2] 2545 	ldw x,#2
      008EC8 90 F7            [ 2] 2546 	popw y 
      008ECA 90 5C 20 EC      [ 5] 2547 	ldw ([dstkptr],x),y 
      008ECE 81               [ 4] 2548 	ret
                                   2549 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2550 ;-----------------------------
                                   2551 ; drop TOS 
                                   2552 ;-----------------------------
      008ECF                       2553 ddrop: ; { n -- }
      000F42                       2554 	_dp_up 
      008ECF 89 52 03 72      [ 1]    1     inc dstkptr+1
      008ED3 5F 00 09 72      [ 1]    2     inc dstkptr+1
      008ED7 5F               [ 4] 2555 	ret
                                   2556 	
                                   2557 ;-----------------------------
                                   2558 ; duplicate TOS 
                                   2559 ;  dstack: { ix...n -- ix...n n }
                                   2560 ;-----------------------------
      000F4B                       2561 ddup:
      008ED8 00 0A 72 5F      [ 5] 2562 	ldw x,[dstkptr]
      000F4F                       2563 	_dp_down
      008EDC 00 0B C6 17      [ 1]    1     dec dstkptr+1 
      008EE0 18 27 5A 0F      [ 1]    2     dec dstkptr+1
      008EE4 01 A6 0A 6B      [ 5] 2564     ldw [dstkptr],x  
      008EE8 02               [ 4] 2565 	ret 
                                   2566 
                                   2567 
                                   2568 ;----------------------------------
                                   2569 ; pick value n from dstack 
                                   2570 ; put it on TOS
                                   2571 ; dstack: {ix,..,p -- ix,...,np }
                                   2572 ;-----------------------------------
      000F5C                       2573 dpick:
      008EE9 AE 17 18 F6      [ 5] 2574 	ldw x,[dstkptr]
      008EED 27               [ 2] 2575 	sllw x 
      008EEE 47 A1 2D 26      [ 2] 2576 	addw x,dstkptr 
      008EF2 04               [ 2] 2577 	ldw x,(x)
      008EF3 03 01 20 08      [ 5] 2578 	ldw [dstkptr],x 
      008EF7 A1               [ 4] 2579 	ret
                                   2580 
                                   2581 ;---------------------------
                                   2582 ;  fetch variable in X 
                                   2583 ;  dstack:{ addr -- value }
                                   2584 ;---------------------------
      000F6B                       2585 fetch:
      008EF8 24 26 06 A6      [ 5] 2586 	ldw x,[dstkptr]
      008EFC 10               [ 2] 2587 	ldw x,(x)
      008EFD 6B 02 5C F6      [ 5] 2588 	ldw [dstkptr],x
      008F01 81               [ 4] 2589 	ret 
                                   2590 
                                   2591 ;----------------------------
                                   2592 ; store variable 
                                   2593 ; dstack: {addr value -- }
                                   2594 ;----------------------------
      000F75                       2595 store:
      008F01 A1 61 2B         [ 4] 2596 	call dpop 
      008F04 02 A0            [ 1] 2597 	ldw y,x   ; y=value 
      008F06 20 A1 30         [ 4] 2598 	call dpop 
      008F09 2B               [ 2] 2599 	ldw (x),y 
      008F0A 2B               [ 4] 2600 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                                   2601 
                                   2602 ;----------------------------
                                   2603 ; print TOS 
                                   2604 ; dstack: {n -- }
                                   2605 ;----------------------------
      000F7F                       2606 prt_tos:
      008F0B A0 30 A1         [ 4] 2607 	call dpop 
      008F0E 0A 2B 06         [ 2] 2608 	ldw acc16,x
      008F11 A0 07 11 02      [ 1] 2609 	clr acc24 
      008F15 2A 1F 6B 03 7B   [ 2] 2610 	btjf acc16,#7,1$
      008F1A 02 CD 8F 41      [ 1] 2611 	cpl acc24 
      008F1E 7B 03 CB         [ 1] 2612 1$:	ld a,tab_width 
      008F21 00               [ 1] 2613 	clrw x 
      008F22 0B               [ 1] 2614 	ld xl,a 
      008F23 C7 00 0B         [ 1] 2615 	ld a,base 
      008F26 4F C9 00         [ 4] 2616 	call prti24
      008F29 0A               [ 4] 2617 	ret 
                                   2618 
                                   2619 ;------------------------------
                                   2620 ; put A in untok, pop TOS put it in tokval
                                   2621 ; dstack { n -- }
                                   2622 ; input:
                                   2623 ;   A     token_attribute 
                                   2624 ;   TOS   token value 
                                   2625 ; output:
                                   2626 ;   untok    A 
                                   2627 ;   tokval   n 
                                   2628 ;------------------------------
      000F9E                       2629 unget_token:
      008F2A C7 00 0A         [ 2] 2630 	ldw x,#pad
      008F2D 4F C9 00         [ 4] 2631 	call strlen 
      008F30 09               [ 1] 2632 	ld a,xl 
      008F31 C7 00 09         [ 1] 2633 	ld acc8,a
      008F34 20 C9 0D         [ 1] 2634 	ld a,in 
      008F37 01 27 03         [ 1] 2635 	sub a,acc8 
      008F3A CD 8A 09         [ 1] 2636 	ld in,a  
                                   2637 ;	ld untok,a 
                                   2638 ;	ldw tokval,x 
      008F3D 81               [ 4] 2639 	ret 
                                   2640 
                                   2641 
                                   2642 
                           000001  2643 .if DEBUG 
      008F3D 5B 03 85 81 61 63 6B  2644 dstk_prompt: .asciz "\ndstack: " 
             3A 20 00
                                   2645 ;----------------------------
                                   2646 ; print dstack content 
                                   2647 ;---------------------------
                           000001  2648 	XSAVE=1
                           000002  2649 	VSIZE=2
      008F41                       2650 dots:
      000FBC                       2651 	_vars VSIZE 
      008F41 89 88            [ 2]    1     sub sp,#VSIZE 
      008F43 5F 89 C6         [ 2] 2652 	ldw x,#dstk_prompt 
      008F46 00 0B 97         [ 4] 2653 	call puts
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008F49 7B 03 42         [ 2] 2654 	ldw x,#dstack_unf-CELL_SIZE 
      008F4C 9F C7 00         [ 2] 2655 1$:	cpw x,dstkptr 
      008F4F 0B 9E            [ 1] 2656 	jrult 4$ 
      008F51 6B 02            [ 2] 2657 	ldw (XSAVE,sp),x
      008F53 C6               [ 2] 2658 	ldw  x,(x)
      008F54 00 0A 97         [ 2] 2659 	ldw acc16,x 
      008F57 7B 03 42 72      [ 1] 2660 	clr acc24 
      008F5B FB               [ 1] 2661 	clrw x 
      008F5C 01 9F            [ 1] 2662 	ld a,#10+128
      008F5E C7 00 0A         [ 4] 2663 	call prti24 
      008F61 4F A9            [ 2] 2664 	ldw x,(XSAVE,sp)
      008F63 00 6B 01         [ 2] 2665 	subw x,#CELL_SIZE 
      008F66 9E 6B            [ 2] 2666 	jra 1$ 
      008F68 02 C6            [ 1] 2667 4$: ld a,#CR 
      008F6A 00 09 97         [ 4] 2668 	call putc 
      000FE8                       2669 	_drop VSIZE
      008F6D 7B 03            [ 2]    1     addw sp,#VSIZE 
      008F6F 42               [ 1] 2670 	clr a 
      008F70 72               [ 4] 2671 	ret
                                   2672 .endif 
                                   2673 
      008F71 FB 01 9F C7 00 09 5B  2674 cstk_prompt: .asciz "\nctack: "
             03 85
                                   2675 ;--------------------------------
                                   2676 ; print cstack content
                                   2677 ;--------------------------------
      000FF5                       2678 dotr:
      008F7A 81 0F EC         [ 2] 2679 	ldw x,#cstk_prompt
      008F7B CD 02 30         [ 4] 2680 	call puts 
      008F7B 88               [ 1] 2681 	ldw x,sp 
      008F7C 91               [ 1] 2682 	incw x 
      008F7D D6 01 27         [ 4] 2683 	call dpush 
      008F80 0A 11 01         [ 2] 2684 	ldw x,#RAM_SIZE-2
      001003                       2685 dotr_loop:
      008F83 26 06 72         [ 4] 2686 	call dpush  
      008F86 5C               [ 2] 2687 	ldw x,(x)
      008F87 00 02 20         [ 2] 2688 	ldw acc16,x 
      008F8A F1 5B 01 81      [ 1] 2689 	clr acc24 
      008F8E 5F               [ 1] 2690 	clrw x 
      008F8E 72 5A            [ 1] 2691 	ld a,#16+128
      008F90 00 1C 72         [ 4] 2692 	call prti24 
      008F93 5A 00 1C         [ 4] 2693 	call dpop 
      008F96 72 CF 00         [ 2] 2694 	subw x,#CELL_SIZE
      008F99 1B 81 00 1A      [ 4] 2695 	cpw x,[dstkptr]
      008F9B 2A E3            [ 1] 2696 	jrpl dotr_loop 
      008F9B 72 CE 00         [ 2] 2697 	ldw x,#1
      008F9E 1B 72 5C         [ 4] 2698 	call ddrop_n 
      008FA1 00 1C            [ 1] 2699 	ld a,#CR 
      008FA3 72 5C 00         [ 4] 2700 	call putc 
      008FA6 1C               [ 1] 2701 	clr a
      008FA7 81               [ 4] 2702 	ret
                                   2703 
                                   2704 
                                   2705 ;--------------------------------
                                   2706 ; BASIC: SHOW 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2707 ;  show content of dstack,cstack
                                   2708 ;--------------------------------
      008FA8                       2709 show:
      008FA8 72 CE 00         [ 4] 2710 	call dots
      008FAB 1B 89 AE         [ 4] 2711 	call dotr 
      008FAE 00               [ 1] 2712 	clr a 
      008FAF 02               [ 4] 2713 	ret
                                   2714 
                                   2715 
                                   2716 ;--------------------------------
                                   2717 ;  add 2 integers
                                   2718 ;  input:
                                   2719 ;    N1     on cstack 
                                   2720 ;    N2     on cstack 
                                   2721 ;  output:
                                   2722 ;    X 		n2+n1 
                                   2723 ;--------------------------------
                                   2724 	;arugments on cstack 
      001035                       2725 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001035                       2726 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      001035                       2727 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      001035                       2728 add:
      008FB0 72 DE            [ 2] 2729 	ldw x ,(N2,sp)
      008FB2 00 1B 72         [ 2] 2730 	addw x,(N1,sp)
      008FB5 CF 00            [ 2] 2731 	ldw (N1,sp),x 
      008FB7 1B               [ 4] 2732 	ret 
                                   2733 
                                   2734 ;--------------------------------
                                   2735 ;  substract 2 ntegers
                                   2736 ;  input:
                                   2737 ;    N1     on cstack 
                                   2738 ;    N2     on cstack 
                                   2739 ;  output:
                                   2740 ;    X 		n2+n1 
                                   2741 ;--------------------------------
      00103D                       2742 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00103D                       2743 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      00103D                       2744 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      00103D                       2745 substract:
      008FB8 AE 00            [ 2] 2746 	ldw x,(N2,sp)
      008FBA 02 90 85         [ 2] 2747 	subw x,(N1,sp)
      008FBD 72               [ 4] 2748 	ret 
                                   2749 
                                   2750 ;-------------------------------------
                                   2751 ; multiply 2 integers
                                   2752 ; product overflow is ignored unless
                                   2753 ; MATH_OVF assembler flag is set to 1
                                   2754 ; input:
                                   2755 ;  	N1      on cstack
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2756 ;   N2 		on cstack 
                                   2757 ; output:
                                   2758 ;	X        N1*N2 
                                   2759 ;-------------------------------------
                                   2760 	;arguments 
      001043                       2761 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      001043                       2762 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      001043                       2763 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      001043                       2764 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      001043                       2765 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2766    ; local variables 
                           000001  2767 	SIGN=1
                           000002  2768 	PROD=2
                           000003  2769 	VSIZE=3
      001043                       2770 multiply:
      001043                       2771 	_vars VSIZE 
      008FBE DF 00            [ 2]    1     sub sp,#VSIZE 
      008FC0 1B 81            [ 1] 2772 	clr (SIGN,sp)
      008FC2 1E 06            [ 2] 2773 	ldw x,(N1_HB,sp)
      008FC2 72               [ 1] 2774 	ld a,xh  
      008FC3 5C 00            [ 1] 2775 	bcp a,#0x80 
      008FC5 1C 72            [ 1] 2776 	jreq 2$
      008FC7 5C 00            [ 1] 2777 	cpl (SIGN,sp)
      008FC9 1C               [ 2] 2778 	negw x 
      008FCA 81 06            [ 2] 2779 	ldw (N1_HB,sp),x 
      008FCB 1E 08            [ 2] 2780 2$: ldw x,(N2_HB,sp)
      008FCB 72               [ 1] 2781 	ld a,xh  
      008FCC CE 00            [ 1] 2782 	bcp a,#0x80 
      008FCE 1B 72            [ 1] 2783 	jreq 3$
      008FD0 5A 00            [ 1] 2784 	cpl (SIGN,sp)
      008FD2 1C               [ 2] 2785 	negw x 
      008FD3 72 5A            [ 2] 2786 	ldw (N2_HB,sp),x 
                                   2787 ; N1_LB * N2_LB 	
      008FD5 00 1C            [ 1] 2788 3$:	ld a,(N1_LB,sp)
      008FD7 72               [ 1] 2789 	ld xl,a 
      008FD8 CF 00            [ 1] 2790 	ld a,(N2_LB,sp) 
      008FDA 1B               [ 4] 2791 	mul x,a 
                           000000  2792 .if MATH_OVF 	
                                   2793 	ld a,xh 
                                   2794 	bcp a,#0x80 
                                   2795 	jreq 4$ 
                                   2796 	ld a,#ERR_MATH_OVF 
                                   2797 	jp tb_error
                                   2798 .endif 	 
      008FDB 81 02            [ 2] 2799 4$:	ldw (PROD,sp),x
                                   2800 ; N1_LB * N2_HB	 
      008FDC 7B 07            [ 1] 2801 	ld a,(N1_LB,sp) 
      008FDC 72               [ 1] 2802 	ld xl,a 
      008FDD CE 00            [ 1] 2803 	ld a,(N2_HB,sp)
      008FDF 1B               [ 4] 2804 	mul x,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008FE0 58               [ 1] 2805 	ld a,xl 
      008FE1 72 BB            [ 1] 2806 	add a,(PROD,sp)
                           000000  2807 .if MATH_OVF 	
                                   2808 	bcp a,#0x80 
                                   2809 	jreq 5$ 
                                   2810 	ld a,#ERR_MATH_OVF 
                                   2811 	jp tb_error
                                   2812 .endif 	 
      008FE3 00 1B            [ 1] 2813 5$:	ld (PROD,sp),a 
                                   2814 ; N1_HB * N2_LB 
      008FE5 FE 72            [ 1] 2815 	ld a,(N1_HB,sp)
      008FE7 CF               [ 1] 2816 	ld xl,a 
      008FE8 00 1B            [ 1] 2817 	ld a,(N2_LB,sp)
      008FEA 81               [ 4] 2818 	mul x,a 
      008FEB 9F               [ 1] 2819 	ld a,xl 
      008FEB 72 CE            [ 1] 2820 	add a,(PROD,sp)
                           000000  2821 .if MATH_OVF 	
                                   2822 	bcp a,#0x80 
                                   2823 	jreq 6$ 
                                   2824 	ld a,#ERR_MATH_OVF 
                                   2825 	jp tb_error
                                   2826 .endif 	 
      008FED 00 1B            [ 1] 2827 6$:	ld (PROD,sp),a 
                                   2828 ; N1_HB * N2_HB 	
                                   2829 ; it is pointless to multiply N1_HB*N2_HB 
                                   2830 ; as this product is over 65535 or 0 
                                   2831 ;
                                   2832 ; sign adjust product
      008FEF FE 72            [ 1] 2833 	tnz (SIGN,sp)
      008FF1 CF 00            [ 1] 2834 	jreq 7$
      008FF3 1B 81            [ 2] 2835 	ldw x, (PROD,sp)
      008FF5 50               [ 2] 2836 	negw x
      008FF5 CD 8F            [ 2] 2837 	ldw (PROD,sp),x  
      001086                       2838 7$: 
      008FF7 9B 90            [ 2] 2839 	ldw x,(PROD,sp) 
      001088                       2840 	_drop VSIZE 
      008FF9 93 CD            [ 2]    1     addw sp,#VSIZE 
      008FFB 8F               [ 4] 2841 	ret
                                   2842 
                                   2843 ;----------------------------------
                                   2844 ;  euclidian divide n2/n1 
                                   2845 ; input:
                                   2846 ;    N2 	on cstack
                                   2847 ;    N1 	on cstack
                                   2848 ; output:
                                   2849 ;    X      n2/n1 
                                   2850 ;    Y      remainder 
                                   2851 ;----------------------------------
      00108B                       2852 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      00108B                       2853 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      00108B                       2854 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   2855 	; local variables
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                           000001  2856 	SQUOT=1 ; sign quotient
                           000002  2857 	SDIVD=2 ; sign dividend  
                           000002  2858 	VSIZE=2
      00108B                       2859 divide:
      00108B                       2860 	_vars VSIZE 
      008FFC 9B FF            [ 2]    1     sub sp,#VSIZE 
      008FFE 81 01            [ 1] 2861 	clr (SQUOT,sp)
      008FFF 0F 02            [ 1] 2862 	clr (SDIVD,sp)
                                   2863 ; check for 0 divisor
      008FFF CD 8F            [ 2] 2864 	ldw x,(DIVISR,sp)
      009001 9B               [ 2] 2865 	tnzw x 
      009002 CF 00            [ 1] 2866     jrne 0$
      009004 0A 72            [ 1] 2867 	ld a,#ERR_DIV0 
      009006 5F 00 09         [ 2] 2868 	jp tb_error 
                                   2869 ; check divisor sign 	
      009009 72               [ 1] 2870 0$:	ld a,xh 
      00900A 0F 00            [ 1] 2871 	bcp a,#0x80 
      00900C 0A 04            [ 1] 2872 	jreq 1$
      00900E 72 53            [ 1] 2873 	cpl (SQUOT,sp)
      009010 00               [ 2] 2874 	negw x 
      009011 09 C6            [ 2] 2875 1$:	ldw (DIVISR,sp),x
                                   2876 ; check dividend sign 	 
      009013 00 27            [ 2] 2877     ldw x,(DIVIDND,sp)
      009015 5F               [ 1] 2878 	ld a,xh 
      009016 97 C6            [ 1] 2879 	bcp a,#0x80 
      009018 00 08            [ 1] 2880 	jreq 2$ 
      00901A CD 89            [ 1] 2881 	cpl (SQUOT,sp)
      00901C 45 81            [ 1] 2882 	cpl (SDIVD,sp)
      00901E 50               [ 2] 2883 	negw x 
      00901E AE 17            [ 2] 2884 2$:	ldw y,(DIVISR,sp)
      009020 18               [ 2] 2885 	divw x,y
      009021 CD 83 86 9F      [ 2] 2886 	ldw acc16,y 
                                   2887 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      009025 C7 00            [ 1] 2888 	tnz (SDIVD,sp)
      009027 0B C6            [ 1] 2889 	jreq 7$
      009029 00 02            [ 2] 2890 	tnzw y 
      00902B C0 00            [ 1] 2891 	jreq 7$
      00902D 0B               [ 1] 2892 	incw x
      00902E C7 00            [ 2] 2893 	ldw y,(DIVISR,sp)
      009030 02 81 0A 64      [ 2] 2894 	subw y,acc16
      009034 73 74            [ 1] 2895 7$: tnz (SQUOT,sp)
      009036 61 63            [ 1] 2896 	jreq 9$ 	 
      009038 6B               [ 2] 2897 8$:	negw x 
      0010CC                       2898 9$: 
      0010CC                       2899 	_drop VSIZE 
      009039 3A 20            [ 2]    1     addw sp,#VSIZE 
      00903B 00               [ 4] 2900 	ret 
                                   2901 
                                   2902 
                                   2903 ;----------------------------------
                                   2904 ;  remainder resulting from euclidian 
                                   2905 ;  division of n2/n1 
                                   2906 ; input:
                                   2907 ;   N1 		cstack 
                                   2908 ;   N2      cstack
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                   2909 ; output:
                                   2910 ;   X       N2%N1 
                                   2911 ;----------------------------------
                                   2912 	
                           000003  2913 	N1=3
                           000005  2914 	N2=5
                           000004  2915 	VSIZE=4
      00903C                       2916 modulo:
      00903C 52 02            [ 2] 2917 	Ldw x,(N1,sp)
      00903E AE 90            [ 2] 2918 	ldw y,(N2,sp)
      0010D3                       2919 	_vars VSIZE 
      009040 32 CD            [ 2]    1     sub sp,#VSIZE 
      009042 82 B0            [ 2] 2920 	ldw (1,sp),x 
      009044 AE 17            [ 2] 2921 	ldw (3,sp),y 
      009046 7E C3 00         [ 4] 2922 	call divide 
      009049 1B               [ 1] 2923 	ldw x,y
      0010DD                       2924 	_drop VSIZE 
      00904A 25 17            [ 2]    1     addw sp,#VSIZE 
      00904C 1F               [ 4] 2925 	ret 
                                   2926 
                                   2927 ;---------------------------------
                                   2928 ; drop n elements from data stack 
                                   2929 ; input: 
                                   2930 ;   X 		n 
                                   2931 ; output:
                                   2932 ;   none 
                                   2933 ;-------------------------------------
      0010E0                       2934 ddrop_n:
      00904D 01 FE            [ 2] 2935 	pushw y 
      00904F CF 00 0A 72      [ 2] 2936 	ldw y,dstkptr 
      009053 5F               [ 2] 2937 	sllw x 
      009054 00               [ 2] 2938 	pushw x 
      009055 09 5F A6         [ 2] 2939 	addw y,(1,sp)
      009058 8A CD 89 45      [ 2] 2940 	ldw dstkptr,y 
      00905C 1E               [ 2] 2941 	popw x 
      00905D 01 1D            [ 2] 2942 	popw y
      00905F 00               [ 4] 2943 	ret 
                                   2944 
                                   2945 ;---------------------------------
                                   2946 ; execute procedure which address
                                   2947 ; is at TOS 
                                   2948 ; --------------------------------
      0010F3                       2949 execute: ; { addr -- ? }
      009060 02 20 E4         [ 4] 2950 	call dpop
      009063 A6               [ 2] 2951 	jp (x)
                                   2952 
                                   2953 
                                   2954 ;---------------------------------
                                   2955 ; input:
                                   2956 ;	X 		dictionary entry point 
                                   2957 ;  pad		.asciz name to search 
                                   2958 ; output:
                                   2959 ;  A 		TK_CMD|TK_FUNC|TK_NONE 
                                   2960 ;  X		execution address | 0 
                                   2961 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                           000001  2962 	NLEN=1 ; cmd length 
                           000002  2963 	YSAVE=2
                           000003  2964 	VSIZE=3 
      0010F7                       2965 search_dict:
      0010F7                       2966 	_vars VSIZE 
      009064 0D CD            [ 2]    1     sub sp,#VSIZE 
      009066 82 9E            [ 1] 2967 	ldw y,x 
      0010FB                       2968 search_next:	
      009068 5B 02            [ 1] 2969 	ld a,(y)
      00906A 4F 81            [ 1] 2970 	and a,#0x7f 
      00906C 0A 63            [ 1] 2971 	ld (NLEN,sp),a  
      00906E 74 61 63         [ 2] 2972 	ldw x,#pad 
      009071 6B 3A            [ 2] 2973 	ldw (YSAVE,sp),y
      009073 20 00            [ 1] 2974 	incw y  
      009075                       2975 cp_loop:
      009075 AE               [ 1] 2976 	ld a,(x)
      009076 90 6C            [ 1] 2977 	jreq str_match 
      009078 CD 82            [ 1] 2978 	tnz (NLEN,sp)
      00907A B0 96            [ 1] 2979 	jreq no_match  
      00907C 5C CD            [ 1] 2980 	cp a,(y)
      00907E 8F 8E            [ 1] 2981 	jrne no_match 
      009080 AE 17            [ 1] 2982 	incw y 
      009082 FE               [ 1] 2983 	incw x
      009083 0A 01            [ 1] 2984 	dec (NLEN,sp)
      009083 CD 8F            [ 2] 2985 	jra cp_loop 
      00111A                       2986 no_match:
      009085 8E FE            [ 2] 2987 	ldw y,(YSAVE,sp) 
      009087 CF 00 0A 72      [ 2] 2988 	subw y,#2 ; move Y to link field
      00908B 5F 00            [ 1] 2989 	push #TK_NONE 
      00908D 09 5F            [ 2] 2990 	ldw y,(y) ; next word link 
      00908F A6               [ 1] 2991 	pop a ; TK_NONE 
      009090 90 CD            [ 1] 2992 	jreq search_exit  ; not found  
                                   2993 ;try next 
      009092 89 45            [ 2] 2994 	jra search_next
      001129                       2995 str_match:
      009094 CD 8F            [ 2] 2996 	ldw y,(YSAVE,sp)
      009096 9B 1D            [ 1] 2997 	ld a,(y)
      009098 00 02            [ 1] 2998 	ld (NLEN,sp),a ; needed to test bit 7 
      00909A 72 C3            [ 1] 2999 	and a,#0x7f 
                                   3000 ; move y to procedure address field 	
      00909C 00               [ 1] 3001 	inc a 
      00909D 1B 2A E3         [ 1] 3002 	ld acc8,a 
      0090A0 AE 00 01 CD      [ 1] 3003 	clr acc16 
      0090A4 91 60 A6 0D      [ 2] 3004 	addw y,acc16 
      0090A8 CD 82            [ 2] 3005 	ldw y,(y) ; routine entry point 
      0090AA 9E 4F            [ 1] 3006 	ld a,(NLEN,sp)
      0090AC 81 80            [ 1] 3007 	bcp a,#0x80 
      0090AD 27 04            [ 1] 3008 	jreq 1$
      0090AD CD 90            [ 1] 3009 	ld a,#TK_FUNC 
      0090AF 3C CD            [ 2] 3010 	jra search_exit
      0090B1 90 75            [ 1] 3011 1$: ld a,#TK_CMD 
      00114B                       3012 search_exit: 
      0090B3 4F               [ 1] 3013 	ldw x,y ; x=routine address 
      00114C                       3014 	_drop VSIZE 	 
      0090B4 81 03            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0090B5 81               [ 4] 3015 	ret 
                                   3016 
                                   3017 ;---------------------
                                   3018 ; check if next token
                                   3019 ;  is of expected type 
                                   3020 ; input:
                                   3021 ;   A 		 expected token attribute
                                   3022 ;  ouput:
                                   3023 ;   none     if fail call tb_error 
                                   3024 ;--------------------
      00114F                       3025 expect:
      0090B5 1E               [ 1] 3026 	push a 
      0090B6 05 72 FB         [ 4] 3027 	call get_token 
      0090B9 03 1F            [ 1] 3028 	cp a,(1,sp)
      0090BB 03 81            [ 1] 3029 	jreq 1$
      0090BD CC 06 90         [ 2] 3030 	jp syntax_error
      0090BD 1E               [ 1] 3031 1$: pop a 
      0090BE 05               [ 4] 3032 	ret 
                                   3033 
                                   3034 
                                   3035 ;-------------------------------
                                   3036 ; parse embedded BASIC routines 
                                   3037 ; arguments list.
                                   3038 ; arg_list::=  rel[','rel]*
                                   3039 ; all arguments are of integer type
                                   3040 ; input:
                                   3041 ;   none
                                   3042 ; output:
                                   3043 ;   A 			number of arguments pushed on dstack  
                                   3044 ;--------------------------------
                           000001  3045 	ARG_CNT=1 
      00115C                       3046 arg_list:
      0090BF 72 F0            [ 1] 3047 	push #0  
      0090C1 03 81 A2         [ 4] 3048 1$: call relation
      0090C3 A1 00            [ 1] 3049 	cp a,#TK_NONE 
      0090C3 52 03            [ 1] 3050 	jreq 5$
      0090C5 0F 01            [ 1] 3051 	cp a,#TK_INTGR
      0090C7 1E 06            [ 1] 3052 	jrne 4$
      0090C9 9E A5 80         [ 4] 3053 3$: call dpush 
      0090CC 27 05            [ 1] 3054     inc (ARG_CNT,sp)
      0090CE 03 01 50         [ 4] 3055 	call get_token 
      0090D1 1F 06            [ 1] 3056 	cp a,#TK_NONE 
      0090D3 1E 08            [ 1] 3057 	jreq 5$ 
      0090D5 9E A5            [ 1] 3058 	cp a,#TK_COMMA 
      0090D7 80 27            [ 1] 3059 	jrne 4$
      0090D9 05 03            [ 2] 3060 	jra 1$ 
      0090DB 01 50 1F         [ 4] 3061 4$:	call unget_token 
      0090DE 08               [ 1] 3062 5$:	pop a 
      0090DF 7B               [ 4] 3063 	ret 
                                   3064 
                                   3065 
                                   3066 
                                   3067 ;--------------------------------
                                   3068 ;   BASIC commnands 
                                   3069 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                   3070 
                                   3071 ;--------------------------------
                                   3072 ;  arithmetic and relational 
                                   3073 ;  routines
                                   3074 ;  operators precedence
                                   3075 ;  highest to lowest
                                   3076 ;  operators on same row have 
                                   3077 ;  same precedence and are executed
                                   3078 ;  from left to right.
                                   3079 ;	'*','/','%'
                                   3080 ;   '-','+'
                                   3081 ;   '=','>','<','>=','<=','<>','><'
                                   3082 ;   '<>' and '><' are equivalent for not equal.
                                   3083 ;--------------------------------
                                   3084 
                                   3085 ;------------------------------
                                   3086 ; negate value on dstack
                                   3087 ; dstack: {n -- -n}
                                   3088 ;------------------------------
      001180                       3089 negate:	
      0090E0 07 97 7B 09      [ 5] 3090 	ldw x,[dstkptr]
      0090E4 42               [ 2] 3091 	negw x 
      0090E5 1F 02 7B 07      [ 5] 3092 	ldw [dstkptr],x 
      0090E9 97               [ 4] 3093 	ret 
                                   3094 
                                   3095 ;---------------------
                                   3096 ; return array element
                                   3097 ; address from @(expr)
                                   3098 ; input:
                                   3099 ;   A 		TK_ARRAY
                                   3100 ; output:
                                   3101 ;   A 		TK_INTGR
                                   3102 ;	X 		element address 
                                   3103 ;----------------------
      00118A                       3104 get_array_element:
      0090EA 7B 08 42         [ 4] 3105 	call ddrop ; {*pad -- }
      0090ED 9F 1B            [ 1] 3106 	ld a,#TK_LPAREN 
      0090EF 02 6B 02         [ 4] 3107 	call expect
      0090F2 7B 06 97         [ 4] 3108 	call relation 
      0090F5 7B 09            [ 1] 3109 	cp a,#TK_INTGR 
      0090F7 42 9F            [ 1] 3110 	jreq 1$
      0090F9 1B 02 6B         [ 2] 3111 	jp syntax_error
      0090FC 02               [ 2] 3112 1$: pushw x 
      0090FD 0D 01            [ 1] 3113 	ld a,#TK_RPAREN 
      0090FF 27 05 1E         [ 4] 3114 	call expect
                                   3115 	; check for bounds 
      009102 02               [ 2] 3116 	popw x   
      009103 50 1F 02         [ 2] 3117 	cpw x,array_size 
      009106 23 05            [ 2] 3118 	jrule 3$
                                   3119 ; bounds {1..array_size}	
      009106 1E 02            [ 1] 3120 2$: ld a,#ERR_BAD_VALUE 
      009108 5B 03 81         [ 2] 3121 	jp tb_error 
      00910B 5D               [ 2] 3122 3$: tnzw  x
      00910B 52 02            [ 1] 3123 	jreq 2$ 
      00910D 0F               [ 2] 3124 	sllw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      00910E 01               [ 2] 3125 	pushw x 
      00910F 0F 02 1E         [ 2] 3126 	ldw x,array_addr  
      009112 05 5D 26         [ 2] 3127 	subw x,(1,sp)
      0011B8                       3128 	_drop 2   
      009115 05 A6            [ 2]    1     addw sp,#2 
      009117 04 CC            [ 1] 3129 	ld a,#TK_INTGR
      009119 87               [ 4] 3130 	ret 
                                   3131 
                                   3132 ;***********************************
                                   3133 ;   expression parse,execute 
                                   3134 ;***********************************
                                   3135 ;-----------------------------------
                                   3136 ; factor ::= ['+'|'-'|e] var | @ |
                                   3137 ;			 integer | function |
                                   3138 ;			 '('relation')' 
                                   3139 ; output:
                                   3140 ;   A    token attribute 
                                   3141 ;   X 	 integer
                                   3142 ; ---------------------------------
                           000001  3143 	NEG=1
                           000001  3144 	VSIZE=1
      0011BD                       3145 factor:
      0011BD                       3146 	_vars VSIZE 
      00911A 12 9E            [ 2]    1     sub sp,#VSIZE 
      00911C A5 80 27         [ 4] 3147 	call get_token
      00911F 03 03            [ 1] 3148 	cp a,#2 
      009121 01 50            [ 1] 3149 	jrmi 20$
      009123 1F 05            [ 1] 3150 1$:	ld (NEG,sp),a 
      009125 1E 07            [ 1] 3151 	and a,#TK_GRP_ADD  
      009127 9E A5            [ 1] 3152 	jrne 2$
      009129 80 27            [ 1] 3153 	ld a,(NEG,sp)
      00912B 05 03            [ 2] 3154 	jra 4$  
      0011D0                       3155 2$:	
      00912D 01 03 02         [ 4] 3156 	call get_token 
      0011D3                       3157 4$:	
      009130 50 16            [ 1] 3158 	cp a,#TK_FUNC 
      009132 05 65            [ 1] 3159 	jrne 5$ 
      009134 90               [ 4] 3160 	call (x) 
      009135 CF 00            [ 2] 3161 	jra 18$ 
      0011DA                       3162 5$:
      009137 0A 0D            [ 1] 3163 	cp a,#TK_INTGR
      009139 02 27            [ 1] 3164 	jrne 6$
      00913B 0B 90            [ 2] 3165 	jra 18$
      0011E0                       3166 6$:
      00913D 5D 27            [ 1] 3167 	cp a,#TK_ARRAY
      00913F 07 5C            [ 1] 3168 	jrne 10$
      009141 16 05 72         [ 4] 3169 	call get_array_element
      009144 B2               [ 2] 3170 	ldw x,(x)
      009145 00 0A            [ 2] 3171 	jra 18$ 
      0011EA                       3172 10$:
      009147 0D 01            [ 1] 3173 	cp a,#TK_VAR 
      009149 27 01            [ 1] 3174 	jrne 12$
      00914B 50               [ 2] 3175 	ldw x,(x)
      00914C 20 14            [ 2] 3176 	jra 18$
      0011F1                       3177 12$:			
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      00914C 5B 02            [ 1] 3178 	cp a,#TK_LPAREN
      00914E 81 0A            [ 1] 3179 	jrne 16$
      00914F CD 12 A2         [ 4] 3180 	call relation
      00914F 1E 03            [ 1] 3181 	ld a,#TK_RPAREN 
      009151 16 05 52         [ 4] 3182 	call expect
      009154 04 1F            [ 2] 3183 	jra 18$	
      0011FF                       3184 16$:
      009156 01 17 03         [ 4] 3185 	call unget_token
      009159 CD               [ 1] 3186 	clr a 
      00915A 91 0B            [ 2] 3187 	jra 20$ 
      001205                       3188 18$: 
      00915C 93 5B            [ 1] 3189 	ld a,#TK_MINUS 
      00915E 04 81            [ 1] 3190 	cp a,(NEG,sp)
      009160 26 01            [ 1] 3191 	jrne 19$
      009160 90               [ 2] 3192 	negw x
      00120C                       3193 19$:
      009161 89 90            [ 1] 3194 	ld a,#TK_INTGR
      00120E                       3195 20$:
      00120E                       3196 	_drop VSIZE
      009163 CE 00            [ 2]    1     addw sp,#VSIZE 
      009165 1B               [ 4] 3197 	ret
                                   3198 
                                   3199 ;-----------------------------------
                                   3200 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3201 ; output:
                                   3202 ;   A    	token attribute 
                                   3203 ;	X		integer
                                   3204 ;-----------------------------------
                           000001  3205 	N1=1
                           000003  3206 	N2=3
                           000005  3207 	MULOP=5
                           000005  3208 	VSIZE=5
      001211                       3209 term:
      001211                       3210 	_vars VSIZE
      009166 58 89            [ 2]    1     sub sp,#VSIZE 
      009168 72 F9 01         [ 4] 3211 	call factor
      00916B 90 CF            [ 1] 3212 	cp a,#2
      00916D 00 1B            [ 1] 3213 	jrmi term_exit
      00121A                       3214 term01:	 ; check for  operator 
      00916F 85 90            [ 2] 3215 	ldw (N2,sp),x  ; save first factor 
      009171 85 81 48         [ 4] 3216 	call get_token
      009173 A1 02            [ 1] 3217 	cp a,#2
      009173 CD 8F            [ 1] 3218 	jrmi 9$
      009175 9B FC            [ 1] 3219 0$:	ld (MULOP,sp),a
      009177 A4 30            [ 1] 3220 	and a,#TK_GRP_MASK
      009177 52 03            [ 1] 3221 	cp a,#TK_GRP_MULT
      009179 90 93            [ 1] 3222 	jreq 1$
      00917B 7B 05            [ 1] 3223 	ld a,(MULOP,sp) 
      00917B 90 F6 A4         [ 4] 3224 	call unget_token 
      00917E 7F 6B            [ 2] 3225 	jra 9$
      001232                       3226 1$:	; got *|/|%
      009180 01 AE 17         [ 4] 3227 	call factor
      009183 18 17            [ 1] 3228 	cp a,#TK_INTGR
      009185 02 90            [ 1] 3229 	jreq 2$ 
      009187 5C 06 90         [ 2] 3230 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      009188 1F 01            [ 2] 3231 2$:	ldw (N1,sp),x  
      009188 F6 27            [ 1] 3232 	ld a,(MULOP,sp) 
      00918A 1E 0D            [ 1] 3233 	cp a,#TK_MULT 
      00918C 01 27            [ 1] 3234 	jrne 3$
      00918E 0B 90 F1         [ 4] 3235 	call multiply 
      009191 26 07            [ 2] 3236 	jra term01
      009193 90 5C            [ 1] 3237 3$: cp a,#TK_DIV 
      009195 5C 0A            [ 1] 3238 	jrne 4$ 
      009197 01 20 EE         [ 4] 3239 	call divide 
      00919A 20 C8            [ 2] 3240 	jra term01 
      00919A 16 02 72         [ 4] 3241 4$: call modulo
      00919D A2 00            [ 2] 3242 	jra term01 
      00919F 02 4B            [ 2] 3243 9$: ldw x,(N2,sp)  
      0091A1 00 90            [ 1] 3244 	ld a,#TK_INTGR 	
      00125B                       3245 term_exit:
      00125B                       3246 	_drop VSIZE 
      0091A3 FE 84            [ 2]    1     addw sp,#VSIZE 
      0091A5 27               [ 4] 3247 	ret 
                                   3248 
                                   3249 ;-------------------------------
                                   3250 ;  expr ::= term [['+'|'-'] term]*
                                   3251 ;  result range {-32768..32767}
                                   3252 ;  output:
                                   3253 ;   A    token attribute 
                                   3254 ;   X	 integer   
                                   3255 ;-------------------------------
                           000001  3256 	N1=1 
                           000003  3257 	N2=3
                           000005  3258 	OP=5 
                           000005  3259 	VSIZE=5 
      00125E                       3260 expression:
      00125E                       3261 	_vars VSIZE 
      0091A6 24 20            [ 2]    1     sub sp,#VSIZE 
      0091A8 D2 12 11         [ 4] 3262 	call term
      0091A9 A1 02            [ 1] 3263 	cp a,#2 
      0091A9 16 02            [ 1] 3264 	jrmi expr_exit 
      0091AB 90 F6            [ 2] 3265 0$:	ldw (N2,sp),x 
      0091AD 6B 01 A4         [ 4] 3266 	call get_token
      0091B0 7F 4C            [ 1] 3267 	cp a,#2
      0091B2 C7 00            [ 1] 3268 	jrmi 9$ 
      0091B4 0B 72            [ 1] 3269 1$:	ld (OP,sp),a  
      0091B6 5F 00            [ 1] 3270 	and a,#TK_GRP_MASK
      0091B8 0A 72            [ 1] 3271 	cp a,#TK_GRP_ADD 
      0091BA B9 00            [ 1] 3272 	jreq 2$ 
      0091BC 0A 90            [ 1] 3273 	ld a,(OP,sp)
      0091BE FE 7B 01         [ 4] 3274 	call unget_token
      0091C1 A5 80            [ 2] 3275 	jra 9$
      00127F                       3276 2$: 
      0091C3 27 04 A6         [ 4] 3277 	call term
      0091C6 0C 20            [ 1] 3278 	cp a,#TK_INTGR 
      0091C8 02 A6            [ 1] 3279 	jreq 3$
      0091CA 07 06 90         [ 2] 3280 	jp syntax_error
      0091CB 1F 01            [ 2] 3281 3$:	ldw (N1,sp),x 
      0091CB 93 5B            [ 1] 3282 	ld a,(OP,sp)
      0091CD 03 81            [ 1] 3283 	cp a,#TK_PLUS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0091CF 26 05            [ 1] 3284 	jrne 4$
      0091CF 88 CD 8C         [ 4] 3285 	call add 
      0091D2 C8 11            [ 2] 3286 	jra 0$ 
      0091D4 01 27 03         [ 4] 3287 4$:	call substract
      0091D7 CC 87            [ 2] 3288 	jra 0$
      0091D9 10 84            [ 2] 3289 9$: ldw x,(N2,sp)
      0091DB 81 0A            [ 1] 3290 	ld a,#TK_INTGR	
      0091DC                       3291 expr_exit:
      00129F                       3292 	_drop VSIZE 
      0091DC 4B 00            [ 2]    1     addw sp,#VSIZE 
      0091DE CD               [ 4] 3293 	ret 
                                   3294 
                                   3295 ;---------------------------------------------
                                   3296 ; rel ::= expr rel_op expr
                                   3297 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3298 ;  relation return 1 | 0  for true | false 
                                   3299 ;  output:
                                   3300 ;    A 		token attribute  
                                   3301 ;	 X		1|0
                                   3302 ;---------------------------------------------
                           000001  3303 	N1=1
                           000003  3304 	N2=3
                           000005  3305 	RELOP=5
                           000005  3306 	VSIZE=5 
      0012A2                       3307 relation: 
      0012A2                       3308 	_vars VSIZE
      0091DF 93 22            [ 2]    1     sub sp,#VSIZE 
      0091E1 A1 00 27         [ 4] 3309 	call expression
      0091E4 19 A1            [ 1] 3310 	cp a,#2 
      0091E6 0A 26            [ 1] 3311 	jrmi rel_exit 
                                   3312 	; expect rel_op or leave 
      0091E8 12 CD            [ 2] 3313 	ldw (N2,sp),x 
      0091EA 8F 8E 0C         [ 4] 3314 	call get_token 
      0091ED 01 CD            [ 1] 3315 	cp a,#2
      0091EF 8C C8            [ 1] 3316 	jrmi 9$
      0012B4                       3317 1$:	
      0091F1 A1 00            [ 1] 3318 	ld (RELOP,sp),a 
      0091F3 27 09            [ 1] 3319 	and a,#TK_GRP_MASK
      0091F5 A1 08            [ 1] 3320 	cp a,#0x30 
      0091F7 26 02            [ 1] 3321 	jreq 2$
      0091F9 20 E3            [ 1] 3322 	ld a,(RELOP,sp)
      0091FB CD 90 1E         [ 4] 3323 	call unget_token  
      0091FE 84 81            [ 2] 3324 	jra 9$
      009200                       3325 2$:	; expect another expression or error 
      009200 72 CE 00         [ 4] 3326 	call expression
      009203 1B 50            [ 1] 3327 	cp a,#TK_INTGR 
      009205 72 CF            [ 1] 3328 	jreq 3$
      009207 00 1B 81         [ 2] 3329 	jp syntax_error 
      00920A 1F 01            [ 2] 3330 3$:	ldw (N1,sp),x 
      00920A CD 8F C2         [ 4] 3331 	call substract
      00920D A6 04            [ 1] 3332 	jrne 4$
      00920F CD 91 CF CD      [ 1] 3333 	mov acc8,#2 ; n1==n2
      009213 93 22            [ 2] 3334 	jra 6$ 
      0012DA                       3335 4$: 
      009215 A1 0A            [ 1] 3336 	jrsgt 5$  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      009217 27 03 CC 87      [ 1] 3337 	mov acc8,#4 ; n1<2 
      00921B 10 89            [ 2] 3338 	jra 6$
      0012E2                       3339 5$:
      00921D A6 05 CD 91      [ 1] 3340 	mov acc8,#1 ; n1>n2 
      0012E6                       3341 6$:
      009221 CF               [ 1] 3342 	clrw x 
      009222 85 C3 00         [ 1] 3343 	ld a, acc8  
      009225 24 23            [ 1] 3344 	and a,(RELOP,sp)
      009227 05               [ 1] 3345 	tnz a 
      009228 A6 0A            [ 1] 3346 	jreq 10$
      00922A CC               [ 1] 3347 	incw x 
      0012F0                       3348 7$:	 
      00922B 87 12            [ 2] 3349 	jra 10$  	
      00922D 5D 27            [ 2] 3350 9$: ldw x,(N2,sp)
      0012F4                       3351 10$:
      00922F F8 58            [ 1] 3352 	ld a,#TK_INTGR
      0012F6                       3353 rel_exit: 	 
      0012F6                       3354 	_drop VSIZE
      009231 89 CE            [ 2]    1     addw sp,#VSIZE 
      009233 00               [ 4] 3355 	ret 
                                   3356 
                                   3357 
                                   3358 ;--------------------------------------------
                                   3359 ; BASIC: HEX 
                                   3360 ; select hexadecimal base for integer print
                                   3361 ;---------------------------------------------
      0012F9                       3362 hex_base:
      009234 22 72 F0 01      [ 1] 3363 	mov base,#16 
      009238 5B               [ 4] 3364 	ret 
                                   3365 
                                   3366 ;--------------------------------------------
                                   3367 ; BASIC: DEC 
                                   3368 ; select decimal base for integer print
                                   3369 ;---------------------------------------------
      0012FE                       3370 dec_base:
      009239 02 A6 0A 81      [ 1] 3371 	mov base,#10
      00923D 81               [ 4] 3372 	ret 
                                   3373 
                                   3374 ;------------------------
                                   3375 ; BASIC: SIZE 
                                   3376 ; return free size in text area
                                   3377 ; output:
                                   3378 ;   A 		TK_INTGR
                                   3379 ;   X 	    size integer
                                   3380 ;--------------------------
      001303                       3381 size:
      00923D 52 01 CD         [ 2] 3382 	ldw x,#tib 
      009240 8C C8 A1 02      [ 2] 3383 	subw x,txtend 
      009244 2B 48 6B         [ 4] 3384 	call dpush 
      009247 01 A4            [ 1] 3385 	ld a,#TK_INTGR
      009249 10               [ 4] 3386 	ret 
                                   3387 
                                   3388 
                                   3389 ;------------------------
                                   3390 ; BASIC: UBOUND  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



                                   3391 ; return array variable size 
                                   3392 ; output:
                                   3393 ;   A 		TK_INTGR
                                   3394 ;   X 	    array size 
                                   3395 ;--------------------------
      001310                       3396 ubound:
      00924A 26 04 7B         [ 2] 3397 	ldw x,#tib
      00924D 01 20 03 1E      [ 2] 3398 	subw x,txtend 
      009250 54               [ 2] 3399 	srlw x 
      009250 CD 8C C8         [ 2] 3400 	ldw array_size,x
      009253 CD 0F 0E         [ 4] 3401 	call dpush   
      009253 A1 0C            [ 1] 3402 	ld a,#TK_INTGR
      009255 26               [ 4] 3403 	ret 
                                   3404 
      001321                       3405 let:
      009256 03 FD 20         [ 4] 3406 	call get_token 
      009259 2B 02            [ 1] 3407 	cp a,#TK_VAR 
      00925A 27 03            [ 1] 3408 	jreq let02
      00925A A1 0A 26         [ 2] 3409 	jp syntax_error
      00132B                       3410 let02:
      00925D 02 20 25         [ 4] 3411 	call dpush 
      009260 CD 0C 48         [ 4] 3412 	call get_token 
      009260 A1 03            [ 1] 3413 	cp a,#TK_EQUAL
      009262 26 06            [ 1] 3414 	jreq 1$
      009264 CD 92 0A         [ 2] 3415 	jp syntax_error
      001338                       3416 1$:	
      009267 FE 20 1B         [ 4] 3417 	call relation   
      00926A A1 0A            [ 1] 3418 	cp a,#TK_INTGR 
      00926A A1 02            [ 1] 3419 	jreq 2$
      00926C 26 03 FE         [ 2] 3420 	jp syntax_error
      001342                       3421 2$:	
      00926F 20 14            [ 1] 3422 	ldw y,x 
      009271 CD 0F 1B         [ 4] 3423 	call dpop  
      009271 A1               [ 2] 3424 	ldw (x),y   
      009272 04 26            [ 1] 3425 	ld a,#TK_NONE 
      009274 0A               [ 4] 3426 	ret 
                                   3427 
                                   3428 ;----------------------------
                                   3429 ; BASIC: LIST [[start][,end]]
                                   3430 ; list program lines 
                                   3431 ; form start to end 
                                   3432 ; if empty argument list then 
                                   3433 ; list all.
                                   3434 ;----------------------------
                           000001  3435 	FIRST=1
                           000003  3436 	LAST=3 
                           000005  3437 	LN_PTR=5
                           000006  3438 	VSIZE=6 
      00134B                       3439 list:
      00134B                       3440 	_vars VSIZE
      009275 CD 93            [ 2]    1     sub sp,#VSIZE 
      009277 22 A6 05         [ 2] 3441 	ldw x,txtbgn 
      00927A CD 91 CF         [ 2] 3442 	cpw x,txtend 
      00927D 20 06            [ 1] 3443 	jrmi 1$
      00927F CC 13 CE         [ 2] 3444 	jp list_exit ; nothing to list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      00927F CD 90            [ 2] 3445 1$:	ldw (LN_PTR,sp),x 
      009281 1E               [ 2] 3446 	ldw x,(x) 
      009282 4F 20            [ 2] 3447 	ldw (FIRST,sp),x ; list from first line 
      009284 09 7F FF         [ 2] 3448 	ldw x,#0x7fff ; biggest line number 
      009285 1F 03            [ 2] 3449 	ldw (LAST,sp),x 
      009285 A6 11 11         [ 4] 3450 	call arg_list
      009288 01               [ 1] 3451 	tnz a
      009289 26 01            [ 1] 3452 	jreq list_start 
      00928B 50 02            [ 1] 3453 	cp a,#2 
      00928C 27 07            [ 1] 3454 	jreq 4$
      00928C A6 0A            [ 1] 3455 	cp a,#1 
      00928E 27 06            [ 1] 3456 	jreq first_line 
      00928E 5B 01 81         [ 2] 3457 	jp syntax_error 
      009291 CD 0F 28         [ 4] 3458 4$:	call dswap
      001376                       3459 first_line:
      009291 52 05 CD         [ 4] 3460 	call dpop 
      009294 92 3D            [ 2] 3461 	ldw (FIRST,sp),x 
      009296 A1 02            [ 1] 3462 	cp a,#1 
      009298 2B 41            [ 1] 3463 	jreq lines_skip 	
      00929A                       3464 last_line:
      00929A 1F 03 CD         [ 4] 3465 	call dpop 
      00929D 8C C8            [ 2] 3466 	ldw (LAST,sp),x 
      001384                       3467 lines_skip:
      00929F A1 02 2B         [ 2] 3468 	ldw x,txtbgn
      0092A2 34 6B            [ 2] 3469 2$:	ldw (LN_PTR,sp),x 
      0092A4 05 A4 30         [ 2] 3470 	cpw x,txtend 
      0092A7 A1 20            [ 1] 3471 	jrpl list_exit 
      0092A9 27               [ 2] 3472 	ldw x,(x) ;lineno 
      0092AA 07 7B            [ 2] 3473 	cpw x,(FIRST,sp)
      0092AC 05 CD            [ 1] 3474 	jrpl list_start 
      0092AE 90 1E            [ 2] 3475 	ldw x,(LN_PTR,sp) 
      0092B0 20 25 02         [ 2] 3476 	addw x,#2 
      0092B2 F6               [ 1] 3477 	ld a,(x)
      0092B2 CD               [ 1] 3478 	incw x 
      0092B3 92 3D A1         [ 1] 3479 	ld acc8,a 
      0092B6 0A 27 03 CC      [ 1] 3480 	clr acc16 
      0092BA 87 10 1F 01      [ 2] 3481 	addw x,acc16
      0092BE 7B 05            [ 2] 3482 	jra 2$ 
                                   3483 ; print loop
      0013A7                       3484 list_start:
      0092C0 A1 20            [ 2] 3485 	ldw x,(LN_PTR,sp)
      0013A9                       3486 3$:	
      0092C2 26 05 CD         [ 4] 3487 	call prt_basic_line
      0092C5 90 C3            [ 2] 3488 	ldw x,(LN_PTR,sp)
      0092C7 20 D1 A1         [ 2] 3489 	addw x,#2 
      0092CA 21               [ 1] 3490 	ld a,(x)
      0092CB 26               [ 1] 3491 	incw x 
      0092CC 05 CD 91         [ 1] 3492 	ld acc8,a 
      0092CF 0B 20 C8 CD      [ 1] 3493 	clr acc16 
      0092D3 91 4F 20 C3      [ 2] 3494 	addw x,acc16
      0092D7 1E 03 A6         [ 2] 3495 	cpw x,txtend 
      0092DA 0A 0B            [ 1] 3496 	jrpl list_exit
      0092DB 1F 05            [ 2] 3497 	ldw (LN_PTR,sp),x
      0092DB 5B               [ 2] 3498 	ldw x,(x)
      0092DC 05 81            [ 2] 3499 	cpw x,(LAST,sp)  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0092DE 2C 04            [ 1] 3500 	jrsgt list_exit 
      0092DE 52 05            [ 2] 3501 	ldw x,(LN_PTR,sp)
      0092E0 CD 92            [ 2] 3502 	jra 3$
      0013CE                       3503 list_exit:
      0013CE                       3504 	_drop VSIZE 
      0092E2 91 A1            [ 2]    1     addw sp,#VSIZE 
      0092E4 02               [ 1] 3505 	clr a 	
      0092E5 2B               [ 4] 3506 	ret
                                   3507 
      0092E6 38 1F 03 CD 8C C8 A1  3508 empty: .asciz "Nothing to list\n"
             02 2B 2B 6B 05 A4 30
             A1 10 27
                                   3509 
                                   3510 ;--------------------------
                                   3511 ; input:
                                   3512 ;   X 		pointer at line
                                   3513 ; output:
                                   3514 ;   none 
                                   3515 ;--------------------------	
      0013E3                       3516 prt_basic_line:
      0092F7 07               [ 2] 3517 	pushw x 
      0092F8 7B               [ 2] 3518 	ldw x,(x)
      0092F9 05 CD 90         [ 2] 3519 	ldw acc16,x 
      0092FC 1E 20 1C 08      [ 1] 3520 	clr acc24 
      0092FF AE 00 05         [ 2] 3521 	ldw x,#5 
      0092FF CD 92            [ 1] 3522 	ld a,#10 
      009301 91 A1 0A         [ 4] 3523 	call prti24 
      009304 27               [ 2] 3524 	popw x 
      009305 03 CC 87         [ 2] 3525 	addw x,#3
      009308 10 1F 01         [ 4] 3526 	call puts 
      00930B 7B 05            [ 1] 3527 	ld a,#CR 
      00930D A1 10 26         [ 4] 3528 	call putc 
      009310 05               [ 4] 3529 	ret 	
                                   3530 
                                   3531 ;---------------------------------
                                   3532 ; BASIC: PRINT|? arg_list 
                                   3533 ; print values from argument list
                                   3534 ;----------------------------------
                           000001  3535 	COMMA=1
                           000001  3536 	VSIZE=1
      001401                       3537 print:
      009311 CD 90            [ 1] 3538 push #0 ; local variable COMMA 
      001403                       3539 reset_comma:
      009313 B5 20            [ 1] 3540 	clr (COMMA,sp)
      001405                       3541 prt_loop:
      009315 D1 CD 90         [ 4] 3542 	call relation
      009318 BD 20            [ 1] 3543 	cp a,#TK_COLON 
      00931A CC 1E            [ 1] 3544 	jrne z
      00931C 03 A6 0A         [ 2] 3545 	jp print_exit   
      00931F A1 0A            [ 1] 3546 z:	cp a,#TK_INTGR 
      00931F 5B 05            [ 1] 3547 	jrne 0$ 
      009321 81 0F 0E         [ 4] 3548 	call dpush 
      009322 CD 0F 7F         [ 4] 3549 	call prt_tos 
      009322 52 05            [ 2] 3550 	jra reset_comma
      00141B                       3551 0$: 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      009324 CD 92 DE         [ 4] 3552 	call get_token
      009327 A1 02            [ 1] 3553 	cp a,#TK_NONE 
      009329 2B 4B            [ 1] 3554 	jreq print_exit 
      00932B 1F 03            [ 1] 3555 1$:	cp a,#TK_QSTR
      00932D CD 8C            [ 1] 3556 	jrne 2$   
      00932F C8 A1 02         [ 4] 3557 	call puts 
      009332 2B 3E            [ 2] 3558 	jra reset_comma
      009334 A1 0B            [ 1] 3559 2$: cp a,#TK_CHAR 
      009334 6B 05            [ 1] 3560 	jrne 3$
      009336 A4               [ 1] 3561 	ld a,xl 
      009337 30 A1 30         [ 4] 3562 	call putc 
      00933A 27 07            [ 2] 3563 	jra reset_comma 
      001435                       3564 3$: 	
      00933C 7B 05            [ 1] 3565 	cp a,#TK_FUNC 
      00933E CD 90            [ 1] 3566 	jrne 4$ 
      009340 1E               [ 4] 3567 	call (x)
      009341 20 2F 0E         [ 4] 3568 	call dpush 
      009343 CD 0F 7F         [ 4] 3569 	call prt_tos 
      009343 CD 92            [ 2] 3570 	jra reset_comma 
      001442                       3571 4$: 
      009345 DE A1            [ 1] 3572 	cp a,#TK_COMMA 
      009347 0A 27            [ 1] 3573 	jrne 5$
      009349 03 CC            [ 1] 3574 	cpl (COMMA,sp) 
      00934B 87 10 1F         [ 2] 3575 	jp prt_loop   
      00144B                       3576 5$: 
      00934E 01 CD            [ 1] 3577 	cp a,#TK_SHARP
      009350 90 BD            [ 1] 3578 	jrne 7$
      009352 26 06 35         [ 4] 3579 	call get_token
      009355 02 00            [ 1] 3580 	cp a,#TK_INTGR 
      009357 0B 20            [ 1] 3581 	jreq 6$
      009359 0C 06 90         [ 2] 3582 	jp syntax_error 
      00935A                       3583 6$:
      00935A 2C               [ 1] 3584 	ld a,xl 
      00935B 06 35            [ 1] 3585 	and a,#15 
      00935D 04 00 0B         [ 1] 3586 	ld tab_width,a 
      009360 20 04 03         [ 2] 3587 	jp reset_comma 
      009362                       3588 7$:	
      009362 35 01 00         [ 4] 3589 	call unget_token
      001465                       3590 print_exit:
      009365 0B 01            [ 1] 3591 	tnz (COMMA,sp)
      009366 26 05            [ 1] 3592 	jrne 9$
      009366 5F C6            [ 1] 3593 	ld a,#CR 
      009368 00 0B 14         [ 4] 3594     call putc 
      00146E                       3595 9$:	_drop VSIZE 
      00936B 05 4D            [ 2]    1     addw sp,#VSIZE 
      00936D 27               [ 1] 3596 	clr a
      00936E 05               [ 4] 3597 	ret 
                                   3598 
                                   3599 ;----------------------
                                   3600 ; 'save_context' and
                                   3601 ; 'rest_context' must be 
                                   3602 ; called at the same 
                                   3603 ; call stack depth 
                                   3604 ; i.e. SP must have the 
                                   3605 ; save value at  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                                   3606 ; entry point of both 
                                   3607 ; routine. 
                                   3608 ;---------------------
                                   3609 ;--------------------
                                   3610 ; save current BASIC
                                   3611 ; interpreter context 
                                   3612 ; on cstack 
                                   3613 ;--------------------
      001472                       3614 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001472                       3615 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001472                       3616 	_arg LNO 3 
                           000005     1     LNO=ARG_OFS+3 
      001472                       3617 	_arg IN 5
                           000007     1     IN=ARG_OFS+5 
      001472                       3618 	_arg CNT 6
                           000008     1     CNT=ARG_OFS+6 
      001472                       3619 save_context:
      00936F 5C 00 03         [ 2] 3620 	ldw x,basicptr 
      009370 1F 03            [ 2] 3621 	ldw (BPTR,sp),x
      009370 20 02 1E         [ 2] 3622 	ldw x,lineno 
      009373 03 05            [ 2] 3623 	ldw (LNO,sp),x 
      009374 C6 00 01         [ 1] 3624 	ld a,in 
      009374 A6 0A            [ 1] 3625 	ld (IN,sp),a
      009376 C6 00 02         [ 1] 3626 	ld a,count 
      009376 5B 05            [ 1] 3627 	ld (CNT,sp),a  
      009378 81               [ 4] 3628 	ret
                                   3629 
                                   3630 ;-----------------------
                                   3631 ; restore previously saved 
                                   3632 ; BASIC interpreter context 
                                   3633 ; from cstack 
                                   3634 ;-------------------------
      009379                       3635 rest_context:
      009379 35 10            [ 2] 3636 	ldw x,(BPTR,sp)
      00937B 00 08 81         [ 2] 3637 	ldw basicptr,x 
      00937E 1E 05            [ 2] 3638 	ldw x,(LNO,sp)
      00937E 35 0A 00         [ 2] 3639 	ldw lineno,x 
      009381 08 81            [ 1] 3640 	ld a,(IN,sp)
      009383 C7 00 01         [ 1] 3641 	ld in,a
      009383 AE 16            [ 1] 3642 	ld a,(CNT,sp)
      009385 C8 72 B0         [ 1] 3643 	ld count,a  
      009388 00               [ 4] 3644 	ret
                                   3645 
                                   3646 ;------------------------------------------
                                   3647 ; BASIC: INPUT [string],var[,[string],var]
                                   3648 ; input value in variables 
                                   3649 ; [string] optionally can be used as prompt 
                                   3650 ;-----------------------------------------
                           000001  3651 	CX_BPTR=1
                           000003  3652 	CX_LNO=3
                           000004  3653 	CX_IN=4
                           000005  3654 	CX_CNT=5
                           000006  3655 	SKIP=6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                           000007  3656 	VSIZE=7
      00149C                       3657 input_var:
      009389 1F CD 8F 8E A6   [ 2] 3658 	btjt flags,#FRUN,1$ 
      00938E 0A 81            [ 1] 3659 	ld a,#ERR_RUN_ONLY 
      009390 CC 06 92         [ 2] 3660 	jp tb_error 
      0014A6                       3661 1$:	_vars VSIZE 
      009390 AE 16            [ 2]    1     sub sp,#VSIZE 
      0014A8                       3662 input_loop:
      009392 C8 72            [ 1] 3663 	clr (SKIP,sp)
      009394 B0 00 1F         [ 4] 3664 	call get_token 
      009397 54 CF            [ 1] 3665 	cp a,#TK_NONE 
      009399 00 24            [ 1] 3666 	jreq input_exit 
      00939B CD 8F            [ 1] 3667 	cp a,#TK_QSTR 
      00939D 8E A6            [ 1] 3668 	jrne 1$ 
      00939F 0A 81 1B         [ 4] 3669 	call dpop
      0093A1 CD 02 30         [ 4] 3670 	call puts 
      0093A1 CD 8C            [ 1] 3671 	cpl (SKIP,sp)
      0093A3 C8 A1 02         [ 4] 3672 	call get_token 
      0093A6 27 03            [ 1] 3673 1$: cp a,#TK_VAR  
      0093A8 CC 87            [ 1] 3674 	jreq 2$ 
      0093AA 10 06 90         [ 2] 3675 	jp syntax_error
      0093AB                       3676 2$:	
      0093AB CD 8F            [ 1] 3677 	tnz (SKIP,sp)
      0093AD 8E CD            [ 1] 3678 	jrne 21$ 
      0093AF 8C C8            [ 1] 3679 	ld a,#':
      0093B1 A1 32 27         [ 1] 3680 	ld pad+1,a 
      0093B4 03 CC 87 10      [ 1] 3681 	clr pad+2
      0093B8 AE 17 18         [ 2] 3682 	ldw x,#pad 
      0093B8 CD 93 22         [ 4] 3683 	call puts   
      0014DA                       3684 21$:
      0093BB A1 0A 27         [ 4] 3685 	call save_context 
      0093BE 03 CC 87         [ 2] 3686 	ldw x,#tib 
      0093C1 10 00 03         [ 2] 3687 	ldw basicptr,x  
      0093C2 72 5F 00 02      [ 1] 3688 	clr count  
      0093C2 90 93 CD         [ 4] 3689 	call readln 
      0093C5 8F 9B FF A6      [ 1] 3690 	clr in 
      0093C9 00 81 A2         [ 4] 3691 	call relation 
      0093CB A1 0A            [ 1] 3692 	cp a,#TK_INTGR
      0093CB 52 06            [ 1] 3693 	jreq 3$ 
      0093CD CE 00 1D         [ 2] 3694 	jp syntax_error
      0014F8                       3695 3$: 
      0093D0 C3 00 1F         [ 4] 3696 	call store 
      0093D3 2B 03 CC         [ 4] 3697 	call rest_context
      0093D6 94 4E 1F 05      [ 1] 3698 	clr untok 
      0093DA FE 1F 01         [ 4] 3699 	call get_token 
      0093DD AE 7F            [ 1] 3700 	cp a,#TK_COMMA 
      0093DF FF 1F            [ 1] 3701 	jrne 4$
      0093E1 03 CD            [ 2] 3702 	jra input_loop 
      0093E3 91 DC 4D         [ 4] 3703 4$:	call unget_token 
      00150E                       3704 input_exit:
      00150E                       3705 	_drop VSIZE 
      0093E6 27 3F            [ 2]    1     addw sp,#VSIZE 
      0093E8 A1               [ 1] 3706 	clr a 
      0093E9 02               [ 4] 3707 	ret 
                                   3708 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3709 
                                   3710 ;---------------------
                                   3711 ; BASIC: REMARK | ' 
                                   3712 ; begin a comment 
                                   3713 ; comment are ignored 
                                   3714 ; use ' insted of REM 
                                   3715 ; it is faster 
                                   3716 ;---------------------- 
      001512                       3717 rem: 
      0093EA 27               [ 4] 3718 	ret 
                                   3719 
                                   3720 
                                   3721 ;---------------------
                                   3722 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3723 ; read in loop 'addr'  
                                   3724 ; apply & 'mask' to value 
                                   3725 ; loop while result==0.  
                                   3726 ; if 'xor_mask' given 
                                   3727 ; apply ^ in second  
                                   3728 ; loop while result==0 
                                   3729 ;---------------------
                           000001  3730 	XMASK=1 
                           000002  3731 	MASK=2
                           000003  3732 	ADDR=3
                           000004  3733 	VSIZE=4
      001513                       3734 wait: 
      001513                       3735 	_vars VSIZE
      0093EB 07 A1            [ 2]    1     sub sp,#VSIZE 
      0093ED 01 27            [ 1] 3736 	clr (XMASK,sp) 
      0093EF 06 CC 87         [ 4] 3737 	call arg_list 
      0093F2 10 CD            [ 1] 3738 	cp a,#2
      0093F4 8F A8            [ 1] 3739 	jruge 0$
      0093F6 CC 06 90         [ 2] 3740 	jp syntax_error 
      0093F6 CD 8F            [ 1] 3741 0$:	cp a,#3
      0093F8 9B 1F            [ 1] 3742 	jrult 1$
      0093FA 01 A1 01         [ 4] 3743 	call dpop 
      0093FD 27               [ 1] 3744 	ld a,xl
      0093FE 05 01            [ 1] 3745 	ld (XMASK,sp),a 
      0093FF CD 0F 1B         [ 4] 3746 1$: call dpop ; mask 
      0093FF CD               [ 1] 3747 	ld a,xl 
      009400 8F 9B            [ 1] 3748 	ld (MASK,sp),a 
      009402 1F 03 1B         [ 4] 3749 	call dpop ; address 
      009404 F6               [ 1] 3750 2$:	ld a,(x)
      009404 CE 00            [ 1] 3751 	and a,(MASK,sp)
      009406 1D 1F            [ 1] 3752 	xor a,(XMASK,sp)
      009408 05 C3            [ 1] 3753 	jreq 2$ 
      00153B                       3754 	_drop VSIZE 
      00940A 00 1F            [ 2]    1     addw sp,#VSIZE 
      00940C 2A               [ 1] 3755 	clr a 
      00940D 40               [ 4] 3756 	ret 
                                   3757 
                                   3758 ;---------------------
                                   3759 ; BASIC: BSET addr,mask
                                   3760 ; set bits at 'addr' corresponding 
                                   3761 ; to those of 'mask' that are at 1.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                   3762 ; arguments:
                                   3763 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3764 ;   mask        mask|addr
                                   3765 ; output:
                                   3766 ;	none 
                                   3767 ;--------------------------
      00153F                       3768 bit_set:
      00940E FE 13 01         [ 4] 3769 	call arg_list 
      009411 2A 14            [ 1] 3770 	cp a,#2	 
      009413 1E 05            [ 1] 3771 	jreq 1$ 
      009415 1C 00 02         [ 2] 3772 	jp syntax_error
      009418 F6 5C C7         [ 4] 3773 1$: call dpop ; mask 
      00941B 00               [ 1] 3774 	ld a,xl 
      00941C 0B 72 5F         [ 4] 3775 	call dpop ; addr  
      00941F 00               [ 1] 3776 	or a,(x)
      009420 0A               [ 1] 3777 	ld (x),a 
      009421 72               [ 1] 3778 	clr a
      009422 BB               [ 4] 3779 	ret 
                                   3780 
                                   3781 ;---------------------
                                   3782 ; BASIC: BRES addr,mask
                                   3783 ; reset bits at 'addr' corresponding 
                                   3784 ; to those of 'mask' that are at 1.
                                   3785 ; arguments:
                                   3786 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3787 ;   mask	    ~mask&*addr  
                                   3788 ; output:
                                   3789 ;	none 
                                   3790 ;--------------------------
      001554                       3791 bit_reset:
      009423 00 0A 20         [ 4] 3792 	call arg_list 
      009426 E0 02            [ 1] 3793 	cp a,#2  
      009427 27 03            [ 1] 3794 	jreq 1$ 
      009427 1E 05 90         [ 2] 3795 	jp syntax_error
      009429                       3796 1$: 
      009429 CD 94 63         [ 4] 3797 	call dpop ; mask 
      00942C 1E               [ 1] 3798 	ld a,xl 
      00942D 05               [ 1] 3799 	cpl a 
      00942E 1C 00 02         [ 4] 3800 	call dpop ; addr  
      009431 F6               [ 1] 3801 	and a,(x)
      009432 5C               [ 1] 3802 	ld (x),a 
      009433 C7               [ 1] 3803 	clr a 
      009434 00               [ 4] 3804 	ret 
                                   3805 
                                   3806 ;---------------------
                                   3807 ; BASIC: BRES addr,mask
                                   3808 ; toggle bits at 'addr' corresponding 
                                   3809 ; to those of 'mask' that are at 1.
                                   3810 ; arguments:
                                   3811 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3812 ;   mask	    mask^*addr  
                                   3813 ; output:
                                   3814 ;	none 
                                   3815 ;--------------------------
      00156A                       3816 bit_toggle:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      009435 0B 72 5F         [ 4] 3817 	call arg_list 
      009438 00 0A            [ 1] 3818 	cp a,#2 
      00943A 72 BB            [ 1] 3819 	jreq 1$ 
      00943C 00 0A C3         [ 2] 3820 	jp syntax_error
      00943F 00 1F 2A         [ 4] 3821 1$: call dpop ; mask 
      009442 0B               [ 1] 3822 	ld a,xl 
      009443 1F 05 FE         [ 4] 3823 	call dpop ; addr  
      009446 13               [ 1] 3824 	xor a,(x)
      009447 03               [ 1] 3825 	ld (x),a 
      009448 2C               [ 1] 3826 	clr a
      009449 04               [ 4] 3827 	ret 
                                   3828 
                                   3829 
                                   3830 ;--------------------
                                   3831 ; BASIC: POKE addr,byte
                                   3832 ; put a byte at addr 
                                   3833 ;--------------------
      00157F                       3834 poke:
      00944A 1E 05 20         [ 4] 3835 	call arg_list 
      00944D DB 02            [ 1] 3836 	cp a,#2
      00944E 27 03            [ 1] 3837 	jreq 1$
      00944E 5B 06 4F         [ 2] 3838 	jp syntax_error
      001589                       3839 1$:	
      009451 81 4E 6F         [ 4] 3840 	call dpop 
      009454 74               [ 1] 3841     ld a,xl 
      009455 68 69 6E         [ 4] 3842 	call dpop 
      009458 67               [ 1] 3843 	ld (x),a 
      009459 20               [ 1] 3844 	clr a 
      00945A 74               [ 4] 3845 	ret 
                                   3846 
                                   3847 ;-----------------------
                                   3848 ; BASIC: PEEK(addr)
                                   3849 ; get the byte at addr 
                                   3850 ; input:
                                   3851 ;	none 
                                   3852 ; output:
                                   3853 ;	X 		value 
                                   3854 ;-----------------------
      001593                       3855 peek:
      00945B 6F 20            [ 1] 3856 	ld a,#TK_LPAREN 
      00945D 6C 69 73         [ 4] 3857 	call expect 
      009460 74 0A 00         [ 4] 3858 	call arg_list
      009463 A1 01            [ 1] 3859 	cp a,#1 
      009463 89 FE            [ 1] 3860 	jreq 1$
      009465 CF 00 0A         [ 2] 3861 	jp syntax_error
      009468 72 5F            [ 1] 3862 1$:	ld a,#TK_RPAREN 
      00946A 00 09 AE         [ 4] 3863 	call expect 
      00946D 00 05 A6         [ 4] 3864 	call dpop 
      009470 0A               [ 1] 3865 	ld a,(x)
      009471 CD               [ 1] 3866 	clrw x 
      009472 89               [ 1] 3867 	ld xl,a 
      009473 45 85 1C         [ 4] 3868 	call dpush 
      009476 00 03            [ 1] 3869 	ld a,#TK_INTGR
      009478 CD               [ 4] 3870 	ret 
                                   3871 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0015B3                       3872 if: 
      009479 82 B0 A6         [ 4] 3873 	call relation 
      00947C 0D CD            [ 1] 3874 	cp a,#TK_INTGR
      00947E 82 9E            [ 1] 3875 	jreq 1$ 
      009480 81 06 90         [ 2] 3876 	jp syntax_error
      009481 4F               [ 1] 3877 1$:	clr a 
      009481 4B               [ 2] 3878 	tnzw x 
      009482 00 09            [ 1] 3879 	jrne 9$  
                                   3880 ;skip to next line
      009483 55 00 02 00 01   [ 1] 3881 	mov in,count
      009483 0F 01 00 11      [ 1] 3882 	clr untok 
      009485 81               [ 4] 3883 9$:	ret 
                                   3884 
                                   3885 ;------------------------
                                   3886 ; BASIC: FOR var=expr 
                                   3887 ; set variable to expression 
                                   3888 ; leave variable address 
                                   3889 ; on dstack and set
                                   3890 ; FFOR bit in 'flags'
                                   3891 ;-----------------
                           000001  3892 	RETL1=1
                           000003  3893 	INW=3
                           000005  3894 	BPTR=5
      0015CB                       3895 for: ; { -- var_addr }
      009485 CD 93            [ 1] 3896 	ld a,#TK_VAR 
      009487 22 A1 01         [ 4] 3897 	call expect
      00948A 26 03 CC         [ 4] 3898 	call dpush 
      00948D 94 E5 A1         [ 4] 3899 	call let02 
      009490 0A 26 08 CD      [ 1] 3900 	bset flags,#FFOR 
                                   3901 ; open space on cstack for BPTR and INW 
      009494 8F               [ 2] 3902 	popw x ; call return address 
      0015DB                       3903 	_vars 4
      009495 8E CD            [ 2]    1     sub sp,#4 
      009497 8F               [ 2] 3904 	pushw x  ; RETL1 
      009498 FF               [ 1] 3905 	clrw x 
      009499 20 E8            [ 2] 3906 	ldw (BPTR,sp),x 
      00949B 1F 03            [ 2] 3907 	ldw (INW,sp),x 
      00949B CD 8C C8         [ 4] 3908 	call get_token 
      00949E A1 00            [ 1] 3909 	cp a,#TK_CMD 
      0094A0 27 43            [ 1] 3910 	jreq 1$
      0094A2 A1 06 26         [ 2] 3911 	jp syntax_error
      0015ED                       3912 1$:  
      0094A5 05 CD 82         [ 2] 3913 	cpw x,#to 
      0094A8 B0 20            [ 1] 3914 	jreq to
      0094AA D8 A1 0B         [ 2] 3915 	jp syntax_error 
                                   3916 
                                   3917 ;-----------------------------------
                                   3918 ; BASIC: TO expr 
                                   3919 ; second part of FOR loop initilization
                                   3920 ; leave limit on dstack and set 
                                   3921 ; FTO bit in 'flags'
                                   3922 ;-----------------------------------
      0015F5                       3923 to: ; { var_addr -- var_addr limit step }
      0094AD 26 06 9F CD 82   [ 2] 3924 	btjt flags,#FFOR,1$
      0094B2 9E 20 CE         [ 2] 3925 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0094B5 CD 12 A2         [ 4] 3926 1$: call relation  
      0094B5 A1 0C            [ 1] 3927 	cp a,#TK_INTGR 
      0094B7 26 09            [ 1] 3928 	jreq 2$ 
      0094B9 FD CD 8F         [ 2] 3929 	jp syntax_error
      0094BC 8E CD 8F         [ 4] 3930 2$: call dpush ; limit
      0094BF FF 20 C1         [ 2] 3931 	ldw x,in.w 
      0094C2 CD 0C 48         [ 4] 3932 	call get_token
      0094C2 A1 08            [ 1] 3933 	cp a,#TK_NONE  
      0094C4 26 05            [ 1] 3934 	jreq 4$ 
      0094C6 03 01            [ 1] 3935 	cp a,#TK_CMD
      0094C8 CC 94            [ 1] 3936 	jrne 3$
      0094CA 85 16 25         [ 2] 3937 	cpw x,#step 
      0094CB 27 08            [ 1] 3938 	jreq step
      00161D                       3939 3$:	
      0094CB A1 09 26         [ 4] 3940 	call unget_token   	 
      001620                       3941 4$:	
      0094CE 13 CD 8C         [ 2] 3942 	ldw x,#1   ; default step  
      0094D1 C8 A1            [ 2] 3943 	jra store_loop_addr 
                                   3944 
                                   3945 
                                   3946 ;----------------------------------
                                   3947 ; BASIC: STEP expr 
                                   3948 ; optional third par of FOR loop
                                   3949 ; initialization. 	
                                   3950 ;------------------------------------
      001625                       3951 step: ; {var limit -- var limit step}
      0094D3 0A 27 03 CC 87   [ 2] 3952 	btjt flags,#FFOR,1$
      0094D8 10 06 90         [ 2] 3953 	jp syntax_error
      0094D9 CD 12 A2         [ 4] 3954 1$: call relation
      0094D9 9F A4            [ 1] 3955 	cp a,#TK_INTGR
      0094DB 0F C7            [ 1] 3956 	jreq store_loop_addr  
      0094DD 00 27 CC         [ 2] 3957 	jp syntax_error
                                   3958 ; leave loop back entry point on cstack 
                                   3959 ; cstack is 2 call deep from interp_loop
      001637                       3960 store_loop_addr:
      0094E0 94 83 0E         [ 4] 3961 	call dpush 
      0094E2 CE 00 03         [ 2] 3962 	ldw x,basicptr  
      0094E2 CD 90            [ 2] 3963 	ldw (BPTR,sp),x 
      0094E4 1E 00 00         [ 2] 3964 	ldw x,in.w 
      0094E5 1F 03            [ 2] 3965 	ldw (INW,sp),x   
      0094E5 0D 01 26 05      [ 1] 3966 	bres flags,#FFOR 
      0094E9 A6 0D CD 82      [ 1] 3967 	inc loop_depth 
      0094ED 9E               [ 1] 3968 	clr a 
      0094EE 5B               [ 4] 3969 	ret 
                                   3970 
                                   3971 ;--------------------------------
                                   3972 ; BASIC: NEXT var 
                                   3973 ; FOR loop control 
                                   3974 ; increment variable with step 
                                   3975 ; and compare with limit 
                                   3976 ; loop if threshold not crossed.
                                   3977 ; else clean both stacks. 
                                   3978 ; and decrement 'loop_depth' 
                                   3979 ;--------------------------------
      00164E                       3980 next: ; {var limit step -- [var limit step ] }
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0094EF 01 4F 81 20      [ 1] 3981 	tnz loop_depth 
      0094F2 26 03            [ 1] 3982 	jrne 1$ 
      0094F2 CE 00 04         [ 2] 3983 	jp syntax_error 
      001657                       3984 1$: 
      0094F5 1F 03            [ 1] 3985 	ld a,#TK_VAR 
      0094F7 CE 00 06         [ 4] 3986 	call expect
                                   3987 ; check for good variable after NEXT 	 
      0094FA 1F 05            [ 1] 3988 	ldw y,x 
      0094FC C6 00 02         [ 2] 3989 	ldw x,#4  
      0094FF 6B 07 C6 00      [ 4] 3990 	cpw y,([dstkptr],x) ; compare variables address 
      009503 03 6B            [ 1] 3991 	jreq 2$  
      009505 08 81 90         [ 2] 3992 	jp syntax_error ; not the good one 
      009507                       3993 2$: ; increment variable 
      009507 1E               [ 1] 3994 	ldw x,y
      009508 03               [ 2] 3995 	ldw x,(x)  ; get var value 
      009509 CF 00 04         [ 2] 3996 	ldw acc16,x 
      00950C 1E 05 CF 00      [ 5] 3997 	ldw x,[dstkptr] ; step
      009510 06 7B 07 C7      [ 2] 3998 	addw x,acc16 ; var+step 
      009514 00 02            [ 2] 3999 	ldw (y),x ; save var new value 
                                   4000 ; compare with limit 
      009516 7B 08            [ 1] 4001 	ldw y,x 
      009518 C7 00 03 81      [ 5] 4002 	ldw x,[dstkptr] ; step in x 
      00951C 5D               [ 2] 4003 	tnzw x  
      00951C 72 00            [ 1] 4004 	jrpl 4$ ; positive step 
                                   4005 ;negative step 
      00951E 00 26 05         [ 2] 4006 	ldw x,#2
      009521 A6 06 CC 87      [ 4] 4007 	cpw y,([dstkptr],x)
      009525 12 52            [ 1] 4008 	jrslt loop_done
      009527 07 09            [ 2] 4009 	jra loop_back 
      009528                       4010 4$: ; positive step
      009528 0F 06 CD         [ 2] 4011 	ldw x,#2 
      00952B 8C C8 A1 00      [ 4] 4012 	cpw y,([dstkptr],x)
      00952F 27 5D            [ 1] 4013 	jrsgt loop_done
      001696                       4014 loop_back:
      009531 A1 06            [ 2] 4015 	ldw x,(BPTR,sp)
      009533 26 0B CD         [ 2] 4016 	ldw basicptr,x 
      009536 8F 9B CD 82 B0   [ 2] 4017 	btjf flags,#FRUN,1$ 
      00953B 03 06            [ 1] 4018 	ld a,(2,x)
      00953D CD 8C            [ 1] 4019 	add a,#2 
      00953F C8 A1 02         [ 1] 4020 	ld count,a
      009542 27               [ 2] 4021 	ldw x,(x)
      009543 03 CC 87         [ 2] 4022 	ldw lineno,x
      009546 10 03            [ 2] 4023 1$:	ldw x,(INW,sp)
      009547 CF 00 00         [ 2] 4024 	ldw in.w,x 
      009547 0D               [ 1] 4025 	clr a 
      009548 06               [ 4] 4026 	ret 
      0016B2                       4027 loop_done:
                                   4028 	; remove var limit step on dstack 
      009549 26 0F A6         [ 2] 4029 	ldw x,dstkptr 
      00954C 3A C7 17         [ 2] 4030 	addw x,#3*CELL_SIZE
      00954F 19 72 5F         [ 2] 4031 	ldw dstkptr,x 
                                   4032 	; remove 2 return address on cstack 
      009552 17               [ 2] 4033 	popw x
      0016BC                       4034 	_drop 4
      009553 1A AE            [ 2]    1     addw sp,#4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      009555 17               [ 2] 4035 	pushw x 
      009556 18 CD 82 B0      [ 1] 4036 	dec loop_depth 
      00955A 4F               [ 1] 4037 	clr a 
      00955A CD               [ 4] 4038 	ret 
                                   4039 
                                   4040 
                                   4041 ;------------------------
                                   4042 ; BASIC: GOTO lineno 
                                   4043 ; jump to lineno 
                                   4044 ; here cstack is 2 call deep from interp_loop 
                                   4045 ;------------------------
      0016C5                       4046 goto:
      00955B 94 F2 AE 16 C8   [ 2] 4047 	btjt flags,#FRUN,0$ 
      009560 CF 00            [ 1] 4048 	ld a,#ERR_RUN_ONLY
      009562 04 72 5F         [ 2] 4049 	jp tb_error 
      009565 00               [ 4] 4050 	ret 
      009566 03 CD            [ 2] 4051 0$:	jra go_common
                                   4052 
                                   4053 ;--------------------
                                   4054 ; BASIC: GOSUB lineno
                                   4055 ; basic subroutine call
                                   4056 ; actual lineno and basicptr 
                                   4057 ; are saved on cstack
                                   4058 ; here cstack is 2 call deep from interp_loop 
                                   4059 ;--------------------
                           000003  4060 	GOS_RET=3
      0016D2                       4061 gosub:
      009568 8A 2C 72 5F 00   [ 2] 4062 	btjt flags,#FRUN,0$ 
      00956D 02 CD            [ 1] 4063 	ld a,#ERR_RUN_ONLY
      00956F 93 22 A1         [ 2] 4064 	jp tb_error 
      009572 0A               [ 4] 4065 	ret 
      009573 27               [ 2] 4066 0$:	popw x 
      009574 03 CC            [ 2] 4067 	sub sp,#2 
      009576 87               [ 2] 4068 	pushw x 
      009577 10 00 03         [ 2] 4069 	ldw x,basicptr
      009578 E6 02            [ 1] 4070 	ld a,(2,x)
      009578 CD 8F            [ 1] 4071 	add a,#3 
      00957A F5 CD 95         [ 1] 4072 	ld acc8,a 
      00957D 07 72 5F 00      [ 1] 4073 	clr acc16 
      009581 12 CD 8C C8      [ 2] 4074 	addw x,acc16
      009585 A1 08            [ 2] 4075 	ldw (GOS_RET,sp),x 
      0016F5                       4076 go_common: 
      009587 26 02 20         [ 4] 4077 	call relation 
      00958A 9D CD            [ 1] 4078 	cp a,#TK_INTGR
      00958C 90 1E            [ 1] 4079 	jreq 1$ 
      00958E CC 06 90         [ 2] 4080 	jp syntax_error
      0016FF                       4081 1$: 
      00958E 5B 07 4F         [ 4] 4082 	call search_lineno  
      009591 81               [ 2] 4083 	tnzw x 
      009592 26 05            [ 1] 4084 	jrne 2$ 
      009592 81 05            [ 1] 4085 	ld a,#ERR_NO_LINE 
      009593 CC 06 92         [ 2] 4086 	jp tb_error 
      00170A                       4087 2$: 
      009593 52 04 0F         [ 2] 4088 	ldw basicptr,x 
      009596 01 CD            [ 1] 4089 	ld a,(2,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009598 91 DC            [ 1] 4090 	add a,#3 
      00959A A1 02 24         [ 1] 4091 	ld count,a 
      00959D 03               [ 2] 4092 	ldw x,(x)
      00959E CC 87 10         [ 2] 4093 	ldw lineno,x 
      0095A1 A1 03 25 06      [ 1] 4094 	mov in,#3 
      0095A5 CD               [ 4] 4095 	ret 
                                   4096 
                                   4097 ;------------------------
                                   4098 ; BASIC: RETURN 
                                   4099 ; exit from a subroutine 
                                   4100 ; cstack is 2 level deep from interp_loop 
                                   4101 ;------------------------
      00171D                       4102 return:
      0095A6 8F 9B 9F 6B 01   [ 2] 4103 	btjt flags,#FRUN,0$ 
      0095AB CD 8F            [ 1] 4104 	ld a,#ERR_RUN_ONLY
      0095AD 9B 9F 6B         [ 2] 4105 	jp tb_error 
      001727                       4106 0$:	
      0095B0 02 CD            [ 2] 4107 	ldw x,(GOS_RET,sp) 
      0095B2 8F 9B F6         [ 2] 4108 	ldw basicptr,x 
      0095B5 14 02            [ 1] 4109 	ld a,(2,x)
      0095B7 18 01            [ 1] 4110 	add a,#3 
      0095B9 27 F9 5B         [ 1] 4111 	ld count,a 
      0095BC 04 4F 81 01      [ 1] 4112 	mov in,#3
      0095BF FE               [ 2] 4113 	ldw x,(x)
      0095BF CD 91 DC         [ 2] 4114 	ldw lineno,x 
      0095C2 A1               [ 1] 4115 	clr a 
      0095C3 02               [ 2] 4116 	popw x 
      00173D                       4117 	_drop 2
      0095C4 27 03            [ 2]    1     addw sp,#2 
      0095C6 CC               [ 2] 4118 	pushw x
      0095C7 87               [ 4] 4119 	ret  
                                   4120 
                                   4121 
                                   4122 ;----------------------------------
                                   4123 ; BASIC: RUN
                                   4124 ; run BASIC program in RAM
                                   4125 ;----------------------------------- 
      001741                       4126 run: 
      0095C8 10 CD 8F 9B 9F   [ 2] 4127 	btjf flags,#FRUN,0$  
      0095CD CD               [ 1] 4128 	clr a 
      0095CE 8F               [ 4] 4129 	ret
      001748                       4130 0$: 
      0095CF 9B FA F7         [ 2] 4131 	ldw x,txtbgn
      0095D2 4F 81 1E         [ 2] 4132 	cpw x,txtend 
      0095D4 2B 02            [ 1] 4133 	jrmi 1$ 
      0095D4 CD               [ 1] 4134 	clr a 
      0095D5 91               [ 4] 4135 	ret 
      0095D6 DC A1 02         [ 4] 4136 1$: call ubound 
      001755                       4137 	_drop 2 
      0095D9 27 03            [ 2]    1     addw sp,#2 
      0095DB CC 87 10         [ 2] 4138 	ldw x,txtbgn 
      0095DE CF 00 03         [ 2] 4139 	ldw basicptr,x 
      0095DE CD 8F            [ 1] 4140 	ld a,(2,x)
      0095E0 9B 9F            [ 1] 4141 	add a,#2 ; consider that in start at 3  
      0095E2 43 CD 8F         [ 1] 4142 	ld count,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0095E5 9B               [ 2] 4143 	ldw x,(x)
      0095E6 F4 F7 4F         [ 2] 4144 	ldw lineno,x
      0095E9 81 03 00 01      [ 1] 4145 	mov in,#3	
      0095EA 72 10 00 25      [ 1] 4146 	bset flags,#FRUN 
      0095EA CD 91 DC         [ 2] 4147 	jp interp_loop 
                                   4148 
                                   4149 
                                   4150 ;----------------------
                                   4151 ; BASIC: STOP 
                                   4152 ; stop running program
                                   4153 ;---------------------- 
      001773                       4154 stop: 
      0095ED A1 02 27 03 CC   [ 2] 4155 	btjt flags,#FRUN,0$  
      0095F2 87               [ 1] 4156 	clr a 
      0095F3 10               [ 4] 4157 	ret 
                                   4158 ; clean dstack and cstack 
      0095F4 CD 8F 9B         [ 2] 4159 0$: ldw x,#STACK_EMPTY 
      0095F7 9F               [ 1] 4160 	ldw sp,x 
      0095F8 CD 8F 9B F8      [ 1] 4161 	bres flags,#FRUN 
      0095FC F7 4F 81         [ 2] 4162 	jp warm_start
                                   4163 
                                   4164 ;-----------------------
                                   4165 ; BASIC: NEW
                                   4166 ; from command line only 
                                   4167 ; free program memory
                                   4168 ; and clear variables 
                                   4169 ;------------------------
      0095FF                       4170 new: 
      0095FF CD 91 DC A1 02   [ 2] 4171 	btjf flags,#FRUN,0$ 
      009604 27               [ 1] 4172 	clr a 
      009605 03               [ 4] 4173 	ret 
      00178C                       4174 0$:	
      009606 CC 87 10         [ 4] 4175 	call clear_basic 
      009609 4F               [ 1] 4176 	clr a 
      009609 CD               [ 4] 4177 	ret 
                                   4178 	 
                                   4179 ;--------------------
                                   4180 ; input:
                                   4181 ;   X     increment 
                                   4182 ; output:
                                   4183 ;   farptr  incremented 
                                   4184 ;---------------------
      001791                       4185 incr_farptr:
      00960A 8F 9B 9F CD      [ 2] 4186 	addw x,farptr+1 
      00960E 8F 9B            [ 1] 4187 	jrnc 1$
      009610 F7 4F 81 14      [ 1] 4188 	inc farptr 
      009613 CF 00 15         [ 2] 4189 1$:	ldw farptr+1,x  
      009613 A6               [ 4] 4190 	ret 
                                   4191 
                                   4192 ;------------------------------
                                   4193 ; extended flash memory used as FLASH_DRIVE 
                                   4194 ; seek end of used flash drive   
                                   4195 ; starting at 0x10000 address.
                                   4196 ; 4 consecutives 0 bytes signal free space. 
                                   4197 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4198 ;	none
                                   4199 ; output:
                                   4200 ;   ffree     free_addr| 0 if memory full.
                                   4201 ;------------------------------
      00179F                       4202 seek_fdrive:
      009614 04 CD            [ 1] 4203 	ld a,#1
      009616 91 CF CD         [ 1] 4204 	ld farptr,a 
      009619 91               [ 1] 4205 	clrw x 
      00961A DC A1 01         [ 2] 4206 	ldw farptr+1,x 
      0017A8                       4207 1$:
      00961D 27               [ 1] 4208 	clrw x 
      00961E 03 CC 87 10      [ 5] 4209 	ldf a,([farptr],x) 
      009622 A6 05            [ 1] 4210 	jrne 2$
      009624 CD               [ 1] 4211 	incw x 
      009625 91 CF CD 8F      [ 5] 4212 	ldf a,([farptr],x)
      009629 9B F6            [ 1] 4213 	jrne 2$ 
      00962B 5F               [ 1] 4214 	incw x 
      00962C 97 CD 8F 8E      [ 5] 4215 	ldf a,([farptr],x)
      009630 A6 0A            [ 1] 4216 	jrne 2$ 
      009632 81               [ 1] 4217 	incw x 
      009633 92 AF 00 14      [ 5] 4218 	ldf a,([farptr],x)
      009633 CD 93            [ 1] 4219 	jreq 4$ 
      0017C4                       4220 2$: 
      009635 22 A1 0A         [ 2] 4221 	addw x,#1
      009638 27 03 CC         [ 4] 4222 	call incr_farptr
      00963B 87 10 4F         [ 2] 4223 	ldw x,#0x27f 
      00963E 5D 26 09         [ 2] 4224 	cpw x,farptr
      009641 55 00            [ 1] 4225 	jrpl 1$
      009643 03 00 02 72      [ 1] 4226 	clr ffree 
      009647 5F 00 12 81      [ 1] 4227 	clr ffree+1 
      00964B 72 5F 00 19      [ 1] 4228 	clr ffree+2 
      00964B A6 02 CD 91      [ 1] 4229 	clr acc24 
      00964F CF CD 8F 8E      [ 1] 4230 	clr acc16
      009653 CD 93 AB 72      [ 1] 4231 	clr acc8 
      009657 14 00            [ 2] 4232 	jra 5$
      0017EC                       4233 4$: ; copy farptr to ffree	 
      009659 26 85 52         [ 2] 4234 	ldw x,farptr+1 
      00965C 04 89 5F         [ 2] 4235 	cpw x,#fdrive 
      00965F 1F 05            [ 1] 4236 	jreq 41$
                                   4237 	; there is a file, last 0 of that file must be skipped.
      009661 1F 03 CD         [ 2] 4238 	ldw x,#1
      009664 8C C8 A1         [ 4] 4239 	call incr_farptr
      0017FA                       4240 41$: 
      009667 07 27 03         [ 2] 4241 	ldw x,farptr 
      00966A CC 87 10         [ 1] 4242 	ld a,farptr+2 
      00966D CF 00 17         [ 2] 4243 	ldw ffree,x 
      00966D A3 96 75         [ 1] 4244 	ld ffree+2,a  
      009670 27 03 CC         [ 2] 4245 	ldw acc24,x 
      009673 87 10 0A         [ 1] 4246 	ld acc8,a 
      009675 CE 18 1E         [ 2] 4247 5$:	ldw x,ffree_msg 
      009675 72 04 00         [ 4] 4248 	call puts 
      009678 26               [ 1] 4249 	clrw x 
      009679 03 CC            [ 1] 4250 	ld a,#16
      00967B 87 10 CD         [ 4] 4251 	call prti24 
      00967E 93 22            [ 1] 4252 	ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      009680 A1 0A 27         [ 4] 4253 	call putc 
      009683 03               [ 4] 4254 	ret 
      009684 CC 87 10 CD 8F 8E CE  4255 ffree_msg: .asciz "\nfree flash begin at: "
             00 01 CD 8C C8 A1 00
             27 0C A1 07 26 05 A3
             96 A5
                                   4256 
                                   4257 ;-----------------------
                                   4258 ; compare file name 
                                   4259 ; with name pointed by Y  
                                   4260 ; input:
                                   4261 ;   farptr   file name 
                                   4262 ;   Y        target name 
                                   4263 ; output:
                                   4264 ;   farptr 	 at file_name
                                   4265 ;   X 		 farptr[x] point at size field  
                                   4266 ;   Carry    0|1 no match|match  
                                   4267 ;----------------------
      001835                       4268 cmp_name:
      00969B 27               [ 1] 4269 	clrw x
      00969C 08 AF 00 14      [ 5] 4270 1$:	ldf a,([farptr],x)
      00969D 90 F1            [ 1] 4271 	cp a,(y)
      00969D CD 90            [ 1] 4272 	jrne 4$
      00969F 1E               [ 1] 4273 	tnz a 
      0096A0 27 12            [ 1] 4274 	jreq 9$ 
      0096A0 AE               [ 1] 4275     incw x 
      0096A1 00 01            [ 1] 4276 	incw y 
      0096A3 20 12            [ 2] 4277 	jra 1$
      0096A5                       4278 4$: ;no match 
      0096A5 72               [ 1] 4279 	tnz a 
      0096A6 04 00            [ 1] 4280 	jreq 5$
      0096A8 26               [ 1] 4281 	incw x 
      0096A9 03 CC 87 10      [ 5] 4282 	ldf a,([farptr],x)
      0096AD CD 93            [ 2] 4283 	jra 4$  
      0096AF 22               [ 1] 4284 5$:	incw x ; farptr[x] point at 'size' field 
      0096B0 A1               [ 1] 4285 	rcf 
      0096B1 0A               [ 4] 4286 	ret
      001853                       4287 9$: ; match  
      0096B2 27               [ 1] 4288 	incw x  ; farptr[x] at 'size' field 
      0096B3 03               [ 1] 4289 	scf 
      0096B4 CC               [ 4] 4290 	ret 
                                   4291 
                                   4292 ;-----------------------
                                   4293 ; search file in 
                                   4294 ; flash memory 
                                   4295 ; input:
                                   4296 ;   Y       file name  
                                   4297 ; output:
                                   4298 ;   farptr  addr at name|0
                                   4299 ;-----------------------
                           000001  4300 	FSIZE=1
                           000003  4301 	YSAVE=3
                           000004  4302 	VSIZE=4 
      001856                       4303 search_file: 
      001856                       4304 	_vars VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0096B5 87 10            [ 2]    1     sub sp,#VSIZE 
      0096B7 17 03            [ 2] 4305 	ldw (YSAVE,sp),y  
      0096B7 CD               [ 1] 4306 	clrw x 
      0096B8 8F 8E CE         [ 2] 4307 	ldw farptr+1,x 
      0096BB 00 04 1F 05      [ 1] 4308 	mov farptr,#1
      001862                       4309 1$:	
                                   4310 ; check if farptr is after any file 
                                   4311 ; if  0 then so.
      0096BF CE 00 01 1F      [ 5] 4312 	ldf a,[farptr]
      0096C3 03 72            [ 1] 4313 	jreq 6$
      0096C5 15               [ 1] 4314 2$: clrw x 	
      0096C6 00 26            [ 2] 4315 	ldw y,(YSAVE,sp) 
      0096C8 72 5C 00         [ 4] 4316 	call cmp_name
      0096CB 21 4F            [ 1] 4317 	jrc 9$
      0096CD 81 AF 00 14      [ 5] 4318 	ldf a,([farptr],x)
      0096CE 6B 01            [ 1] 4319 	ld (FSIZE,sp),a 
      0096CE 72               [ 1] 4320 	incw x 
      0096CF 5D 00 21 26      [ 5] 4321 	ldf a,([farptr],x)
      0096D3 03 CC            [ 1] 4322 	ld (FSIZE+1,sp),a 
      0096D5 87               [ 1] 4323 	incw x 
      0096D6 10 FB 01         [ 2] 4324 	addw x,(FSIZE,sp) ; count to skip 
      0096D7 CD 17 91         [ 4] 4325 	call incr_farptr ; now at next file 'name_field'
      0096D7 A6 02 CD         [ 2] 4326 	ldw x,#0x280
      0096DA 91 CF 90         [ 2] 4327 	cpw x,farptr 
      0096DD 93 AE            [ 1] 4328 	jrpl 1$
      00188C                       4329 6$: ; file not found 
      0096DF 00 04 72 D3      [ 1] 4330 	clr farptr
      0096E3 00 1B 27 03      [ 1] 4331 	clr farptr+1 
      0096E7 CC 87 10 16      [ 1] 4332 	clr farptr+2 
      0096EA                       4333 	_drop VSIZE 
      0096EA 93 FE            [ 2]    1     addw sp,#VSIZE 
      0096EC CF               [ 1] 4334 	rcf
      0096ED 00               [ 4] 4335 	ret
      00189C                       4336 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      00189C                       4337 	_drop VSIZE 
      0096EE 0A 72            [ 2]    1     addw sp,#VSIZE 
      0096F0 CE               [ 1] 4338 	scf 	
      0096F1 00               [ 4] 4339 	ret
                                   4340 
                                   4341 ;--------------------------------
                                   4342 ; BASIC: SAVE "name" 
                                   4343 ; save text program in 
                                   4344 ; flash memory used as 
                                   4345 ;--------------------------------
      0018A0                       4346 save:
      0096F2 1B 72 BB 00 0A   [ 2] 4347 	btjf flags,#FRUN,0$ 
      0096F7 90 FF            [ 1] 4348 	ld a,#ERR_CMD_ONLY 
      0096F9 90 93 72         [ 2] 4349 	jp tb_error
      0018AA                       4350 0$:	 
      0096FC CE 00 1B         [ 2] 4351 	ldw x,txtend 
      0096FF 5D 2A 0B AE      [ 2] 4352 	subw x,txtbgn
      009703 00 02            [ 1] 4353 	jrne 10$
                                   4354 ; nothing to save 
      009705 72               [ 1] 4355 	clr a 
      009706 D3               [ 4] 4356 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      0018B5                       4357 10$:	
      009707 00 1B 2F         [ 1] 4358 	ld a,ffree 
      00970A 27 20 09         [ 1] 4359 	or a,ffree+1
      00970D CA 00 19         [ 1] 4360 	or a,ffree+2 
      00970D AE 00            [ 1] 4361 	jrne 1$
      00970F 02 72            [ 1] 4362 	ld a,#ERR_MEM_FULL
      009711 D3 00 1B         [ 2] 4363 	jp tb_error 
      009714 2C 1C 48         [ 4] 4364 1$: call get_token	
      009716 A1 06            [ 1] 4365 	cp a,#TK_QSTR
      009716 1E 05            [ 1] 4366 	jreq 2$
      009718 CF 00 04         [ 2] 4367 	jp syntax_error
      0018CF                       4368 2$: ; check for existing file of that name 
      00971B 72 01 00 26      [ 2] 4369 	ldw y,tokval ; file name pointer 
      00971F 0B E6 02         [ 4] 4370 	call search_file 
      009722 AB 02            [ 1] 4371 	jrnc 3$ 
      009724 C7 00            [ 1] 4372 	ld a,#ERR_DUPLICATE 
      009726 03 FE CF         [ 2] 4373 	jp tb_error 
      0018DD                       4374 3$:	;** write file name to flash **
      009729 00 06 1E         [ 2] 4375 	ldw x,ffree 
      00972C 03 CF 00         [ 1] 4376 	ld a,ffree+2 
      00972F 01 4F 81         [ 2] 4377 	ldw farptr,x 
      009732 C7 00 16         [ 1] 4378 	ld farptr+2,a 
      009732 CE 00 1B         [ 2] 4379 	ldw x,tokval 
      009735 1C 00 06         [ 4] 4380 	call strlen 
      009738 CF               [ 1] 4381 	incw  x
      009739 00               [ 2] 4382 	pushw x 
      00973A 1B               [ 1] 4383 	clrw x   
      00973B 85 5B 04 89      [ 2] 4384 	ldw y,tokval 
      00973F 72 5A 00         [ 4] 4385 	call write_block  
      0018F9                       4386 	_drop 2 ; drop pushed X 
      009742 21 4F            [ 2]    1     addw sp,#2 
                                   4387 ;** write file length after name **
      009744 81 00 1E         [ 2] 4388 	ldw x,txtend 
      009745 72 B0 00 1C      [ 2] 4389 	subw x,txtbgn
      009745 72               [ 2] 4390 	pushw x ; file size 
      009746 00               [ 1] 4391 	clrw x 
      009747 00 26            [ 1] 4392 	ld a,(1,sp)
      009749 06 A6 06         [ 4] 4393 	call write_byte 
      00974C CC               [ 1] 4394 	incw x 
      00974D 87 12            [ 1] 4395 	ld a,(2,sp)
      00974F 81 20 23         [ 4] 4396 	call write_byte
      009752 5C               [ 1] 4397 	incw x  
      009752 72 00 00         [ 4] 4398 	call incr_farptr ; move farptr after SIZE field 
                                   4399 ;** write BASIC text **
                                   4400 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      009755 26 06            [ 2] 4401 	ldw x,(1,sp)
      009757 A6               [ 2] 4402 	pushw x 
      009758 06               [ 1] 4403 	clrw x 
      009759 CC 87 12 81      [ 2] 4404 	ldw y,txtbgn  ; BASIC text to save 
      00975D 85 52 02         [ 4] 4405 	call write_block 
      00191E                       4406 	_drop 2 ;  drop BSIZE argument
      009760 89 CE            [ 2]    1     addw sp,#2 
                                   4407 ; save farptr in ffree
      009762 00 04 E6         [ 2] 4408 	ldw x,farptr 
      009765 02 AB 03         [ 1] 4409 	ld a,farptr+2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      009768 C7 00 0B         [ 2] 4410 	ldw ffree,x 
      00976B 72 5F 00         [ 1] 4411 	ld ffree+2,a
                                   4412 ; write 4 zero bytes as a safe gard 
      00976E 0A               [ 1] 4413     clrw x 
      00976F 72               [ 1] 4414 	clr a 
      009770 BB 00 0A         [ 4] 4415 	call write_byte 
      009773 1F               [ 1] 4416 	incw x 
      009774 03               [ 1] 4417 	clr a 
      009775 CD 01 5C         [ 4] 4418 	call write_byte
      009775 CD               [ 1] 4419 	incw x 
      009776 93               [ 1] 4420 	clr a 
      009777 22 A1 0A         [ 4] 4421 	call write_byte
                                   4422 ; display saved size  
      00977A 27               [ 2] 4423 	popw x ; first copy of BSIZE 
      00977B 03 CC            [ 1] 4424 	ld a,#TK_INTGR 
      00977D 87               [ 4] 4425 	ret 
                                   4426 
                                   4427 
                                   4428 ;------------------------
                                   4429 ; BASIC: LOAD "file" 
                                   4430 ; load file to RAM 
                                   4431 ; for execution 
                                   4432 ;------------------------
      00193F                       4433 load:
      00977E 10 01 00 25 07   [ 2] 4434 	btjf flags,#FRUN,0$ 
      00977F 27 05            [ 1] 4435 	jreq 0$ 
      00977F CD 83            [ 1] 4436 	ld a,#ERR_CMD_ONLY 
      009781 F5 5D 26         [ 2] 4437 	jp tb_error 
      00194B                       4438 0$:	
      009784 05 A6 05         [ 4] 4439 	call get_token 
      009787 CC 87            [ 1] 4440 	cp a,#TK_QSTR
      009789 12 03            [ 1] 4441 	jreq 1$
      00978A CC 06 90         [ 2] 4442 	jp syntax_error 
      001955                       4443 1$:	
      00978A CF 00            [ 1] 4444 	ldw y,x 
      00978C 04 E6 02         [ 4] 4445 	call search_file 
      00978F AB 03            [ 1] 4446 	jrc 2$ 
      009791 C7 00            [ 1] 4447 	ld a,#ERR_NOT_FILE
      009793 03 FE CF         [ 2] 4448 	jp tb_error  
      001961                       4449 2$:	
      009796 00 06 35         [ 4] 4450 	call incr_farptr  
      009799 03 00 02         [ 4] 4451 	call clear_basic  
      00979C 81               [ 1] 4452 	clrw x
      00979D 92 AF 00 14      [ 5] 4453 	ldf a,([farptr],x)
      00979D 72 00            [ 1] 4454 	ld yh,a 
      00979F 00               [ 1] 4455 	incw x  
      0097A0 26 05 A6 06      [ 5] 4456 	ldf a,([farptr],x)
      0097A4 CC               [ 1] 4457 	incw x 
      0097A5 87 12            [ 1] 4458 	ld yl,a 
      0097A7 72 B9 00 1C      [ 2] 4459 	addw y,txtbgn
      0097A7 1E 03 CF 00      [ 2] 4460 	ldw txtend,y
      0097AB 04 E6 02 AB      [ 2] 4461 	ldw y,txtbgn
      001982                       4462 3$:	; load BASIC text 	
      0097AF 03 C7 00 03      [ 5] 4463 	ldf a,([farptr],x)
      0097B3 35 03            [ 1] 4464 	ld (y),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      0097B5 00               [ 1] 4465 	incw x 
      0097B6 02 FE            [ 1] 4466 	incw y 
      0097B8 CF 00 06 4F      [ 2] 4467 	cpw y,txtend 
      0097BC 85 5B            [ 1] 4468 	jrmi 3$
                                   4469 ; return loaded size 	 
      0097BE 02 89 81         [ 2] 4470 	ldw x,txtend 
      0097C1 72 B0 00 1C      [ 2] 4471 	subw x,txtbgn
      0097C1 72 01 00         [ 4] 4472 	call dpush 
      0097C4 26 02 4F         [ 4] 4473 	call prt_tos 
      0097C7 81               [ 1] 4474 	clr a  
      0097C8 81               [ 4] 4475 	ret 
                                   4476 
                                   4477 ;-----------------------------------
                                   4478 ; BASIC: FORGET ["file_name"] 
                                   4479 ; erase file_name and all others 
                                   4480 ; after it. 
                                   4481 ; without argument erase all files 
                                   4482 ;-----------------------------------
      0019A0                       4483 forget:
      0097C8 CE 00 1D         [ 4] 4484 	call get_token 
      0097CB C3 00            [ 1] 4485 	cp a,#TK_NONE 
      0097CD 1F 2B            [ 1] 4486 	jreq 3$ 
      0097CF 02 4F            [ 1] 4487 	cp a,#TK_QSTR
      0097D1 81 CD            [ 1] 4488 	jreq 1$
      0097D3 93 90 5B         [ 2] 4489 	jp syntax_error
      0097D6 02 CE 00 1D      [ 2] 4490 1$: ldw y,tokval 
      0097DA CF 00 04         [ 4] 4491 	call search_file
      0097DD E6 02            [ 1] 4492 	jrc 2$
      0097DF AB 02            [ 1] 4493 	ld a,#ERR_NOT_FILE 
      0097E1 C7 00 03         [ 2] 4494 	jp tb_error 
      0019BC                       4495 2$: 
      0097E4 FE CF 00         [ 2] 4496 	ldw x,farptr
      0097E7 06 35 03         [ 1] 4497 	ld a,farptr+2
      0097EA 00 02            [ 2] 4498 	jra 4$ 
      0019C4                       4499 3$: ; forget all files 
      0097EC 72 10 00         [ 2] 4500 	ldw x,#fdrive
      0097EF 26               [ 1] 4501 	clr a 
      0097F0 CC               [ 1] 4502 	rrwa x 
      0097F1 87 DE 14         [ 2] 4503 	ldw farptr,x 
      0097F3 C7 00 16         [ 1] 4504 	ld farptr+2,a 
      0019CF                       4505 4$:
      0097F3 72 00 00         [ 2] 4506 	ldw ffree,x 
      0097F6 26 02 4F         [ 1] 4507 	ld ffree+2,a 
      0097F9 81               [ 1] 4508 5$:	clrw x 
      0097FA AE               [ 1] 4509 	clr a  
      0097FB 17 FF 94         [ 4] 4510 	call write_byte 
      0097FE 72 11 00         [ 2] 4511 	ldw x,#1 
      009801 26 CC 87         [ 4] 4512 	call incr_farptr
      009804 70 00 14         [ 1] 4513 	ld a,farptr
      009805 C1 00 17         [ 1] 4514 	cp a,ffree 
      009805 72 01            [ 1] 4515 	jrmi 5$ 
      009807 00 26 02         [ 2] 4516 	ldw x,farptr+1 
      00980A 4F 81 18         [ 2] 4517 	cpw x,ffree+1
      00980C 2B E5            [ 1] 4518 	jrmi 5$
      00980C CD               [ 4] 4519 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4520 
                                   4521 ;----------------------
                                   4522 ; BASIC: DIR 
                                   4523 ; list saved files 
                                   4524 ;----------------------
                           000001  4525 	COUNT=1 ; files counter 
                           000002  4526 	VSIZE=2 
      0019F1                       4527 directory:
      0019F1                       4528 	_vars VSIZE 
      00980D 85 EE            [ 2]    1     sub sp,#VSIZE 
      00980F 4F               [ 1] 4529 	clrw x 
      009810 81 01            [ 2] 4530 	ldw (COUNT,sp),x 
      009811 CF 00 15         [ 2] 4531 	ldw farptr+1,x 
      009811 72 BB 00 16      [ 1] 4532 	mov farptr,#1 
      0019FD                       4533 dir_loop:
      009815 24               [ 1] 4534 	clrw x 
      009816 04 72 5C 00      [ 5] 4535 	ldf a,([farptr],x)
      00981A 15 CF            [ 1] 4536 	jreq 8$ 
      001A04                       4537 1$: ;name loop 	
      00981C 00 16 81 14      [ 5] 4538 	ldf a,([farptr],x)
      00981F 27 06            [ 1] 4539 	jreq 2$ 
      00981F A6 01 C7         [ 4] 4540 	call putc 
      009822 00               [ 1] 4541 	incw x 
      009823 15 5F            [ 2] 4542 	jra 1$
      009825 CF               [ 1] 4543 2$: incw x ; skip ending 0. 
      009826 00 16            [ 1] 4544 	ld a,#SPACE 
      009828 CD 02 1E         [ 4] 4545 	call putc 
                                   4546 ; get file size 	
      009828 5F 92 AF 00      [ 5] 4547 	ldf a,([farptr],x)
      00982C 15 26            [ 1] 4548 	ld yh,a 
      00982E 15               [ 1] 4549 	incw x 
      00982F 5C 92 AF 00      [ 5] 4550 	ldf a,([farptr],x)
      009833 15               [ 1] 4551 	incw x 
      009834 26 0E            [ 1] 4552 	ld yl,a 
      009836 5C 92            [ 2] 4553 	pushw y 
      009838 AF 00 15         [ 2] 4554 	addw x,(1,sp)
      00983B 26 07 5C         [ 4] 4555 	call incr_farptr 
      00983E 92               [ 2] 4556 	popw x ; file size 
      00983F AF 00 15         [ 4] 4557 	call dpush 
      009842 27 28 7F         [ 4] 4558 	call prt_tos 
      009844 A6 0D            [ 1] 4559 	ld a,#CR 
      009844 1C 00 01         [ 4] 4560 	call putc
      009847 CD 98            [ 2] 4561 	ldw x,(COUNT,sp)
      009849 11               [ 1] 4562 	incw x
      00984A AE 02            [ 2] 4563 	ldw (COUNT,sp),x  
      00984C 7F C3            [ 2] 4564 	jra dir_loop 
      001A3F                       4565 8$:
      00984E 00 15            [ 2] 4566 	ldw x,(COUNT,sp)
      009850 2A D6 72         [ 4] 4567 	call dpush 
      009853 5F 00 18         [ 4] 4568 	call prt_tos
      009856 72 5F 00         [ 2] 4569 	ldw x,#file_count 
      009859 19 72 5F         [ 4] 4570 	call puts  
      001A4D                       4571 	_drop VSIZE 
      00985C 00 1A            [ 2]    1     addw sp,#VSIZE 
      00985E 72               [ 4] 4572 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      00985F 5F 00 09 72 5F 00 0A  4573 file_count: .asciz " files\n"
             72
                                   4574 
                                   4575 ;---------------------
                                   4576 ; BASIC: WRITE expr1,expr2 
                                   4577 ; write byte to FLASH or EEPROM 
                                   4578 ; input:
                                   4579 ;   expr1  	is address 
                                   4580 ;   expr2   is byte to write
                                   4581 ; output:
                                   4582 ;   none 
                                   4583 ;---------------------
      001A58                       4584 write:
      009867 5F 00 0B 20      [ 1] 4585 	clr farptr ; expect 16 bits address 
      00986B 20 11 5C         [ 4] 4586 	call arg_list  
      00986C A1 02            [ 1] 4587 	cp a,#2
      00986C CE 00            [ 1] 4588 	jreq 1$
      00986E 16 A3 00         [ 2] 4589 	jp syntax_error
      001A66                       4590 1$:
      009871 00 27 06         [ 4] 4591 	call dpop 
      009874 AE               [ 1] 4592 	ld a,xl 
      009875 00 01 CD         [ 4] 4593 	call dpop 
      009878 98 11 15         [ 2] 4594 	ldw farptr+1,x 
      00987A 5F               [ 1] 4595 	clrw x 
      00987A CE 00 15         [ 4] 4596 	call write_byte 
      00987D C6               [ 4] 4597 	ret 
                                   4598 
                                   4599 
                                   4600 ;---------------------
                                   4601 ;BASIC: CHAR(expr)
                                   4602 ; évaluate expression 
                                   4603 ; and take the 7 least 
                                   4604 ; bits as ASCII character
                                   4605 ;---------------------
      001A75                       4606 char:
      00987E 00 17            [ 1] 4607 	ld a,#TK_LPAREN 
      009880 CF 00 18         [ 4] 4608 	call expect 
      009883 C7 00 1A         [ 4] 4609 	call relation 
      009886 CF 00            [ 1] 4610 	cp a,#TK_INTGR 
      009888 09 C7            [ 1] 4611 	jreq 1$
      00988A 00 0B CE         [ 2] 4612 	jp syntax_error
      001A84                       4613 1$:	
      00988D 98 9E            [ 1] 4614 	ld a,#TK_RPAREN 
      00988F CD 82 B0         [ 4] 4615 	call expect
      009892 5F A6 10         [ 4] 4616 	call dpop 
      009895 CD               [ 1] 4617 	ld a,xl 
      009896 89 45            [ 1] 4618 	and a,#0x7f 
      009898 A6               [ 1] 4619 	ld xl,a
      009899 0D CD 82         [ 2] 4620 	ldw tokval,x  
      00989C 9E 81            [ 1] 4621 	ld a,#TK_CHAR
      00989E 0A               [ 4] 4622 	ret
                                   4623 
                                   4624 ;---------------------
                                   4625 ; BASIC: ASC(string|char)
                                   4626 ; extract first character 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   4627 ; of string argument 
                                   4628 ; return it as TK_INTGR 
                                   4629 ;---------------------
      001A96                       4630 ascii:
      00989F 66 72            [ 1] 4631 	ld a,#TK_LPAREN
      0098A1 65 65 20         [ 4] 4632 	call expect 
      0098A4 66 6C 61         [ 4] 4633 	call get_token 
      0098A7 73 68            [ 1] 4634 	cp a,#TK_QSTR 
      0098A9 20 62            [ 1] 4635 	jreq 1$
      0098AB 65 67            [ 1] 4636 	cp a,#TK_CHAR 
      0098AD 69 6E            [ 1] 4637 	jreq 2$ 
      0098AF 20 61 74         [ 2] 4638 	jp syntax_error
      0098B2 3A 20 00         [ 2] 4639 1$: ldw x,tokval 
      0098B5 F6               [ 1] 4640 	ld a,(x)
      0098B5 5F 92            [ 2] 4641 	jra 3$
      0098B7 AF 00 15         [ 2] 4642 2$: ldw x,tokval
      0098BA 90               [ 1] 4643 	ld a,xl 
      0098BB F1               [ 1] 4644 3$:	clrw x 
      0098BC 26               [ 1] 4645 	ld xl,a 
      0098BD 08 4D 27         [ 4] 4646 	call dpush 
      0098C0 12 5C            [ 1] 4647 	ld a,#TK_RPAREN 
      0098C2 90 5C 20         [ 4] 4648 	call expect 
      0098C5 F0 0F 1B         [ 4] 4649 	call dpop  
      0098C6 CF 00 12         [ 2] 4650 	ldw tokval,x 
      0098C6 4D 27            [ 1] 4651 	ld a,#TK_INTGR 
      0098C8 07               [ 4] 4652 	ret 
                                   4653 
                                   4654 ;---------------------
                                   4655 ;BASIC: KEY
                                   4656 ; wait for a character 
                                   4657 ; received from STDIN 
                                   4658 ; input:
                                   4659 ;	none 
                                   4660 ; output:
                                   4661 ;	X 		ASCII character 
                                   4662 ;---------------------
      001AC6                       4663 key:
      0098C9 5C 92 AF         [ 4] 4664 	call getc 
      0098CC 00               [ 1] 4665 	clrw x 
      0098CD 15               [ 1] 4666 	ld xl,a 
      0098CE 20 F6 5C         [ 2] 4667 	ldw tokval,x 
      0098D1 98 81            [ 1] 4668 	ld a,#TK_INTGR
      0098D3 81               [ 4] 4669 	ret
                                   4670 
                                   4671 ;----------------------
                                   4672 ; BASIC: QKEY
                                   4673 ; Return true if there 
                                   4674 ; is a character in 
                                   4675 ; waiting in STDIN 
                                   4676 ; input:
                                   4677 ;  none 
                                   4678 ; output:
                                   4679 ;   X 		0|1 
                                   4680 ;-----------------------
      001AD1                       4681 qkey: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      0098D3 5C               [ 1] 4682 	clrw x 
      0098D4 99 81 52 40 01   [ 2] 4683 	btjf UART3_SR,#UART_SR_RXNE,9$ 
      0098D6 5C               [ 1] 4684 	incw x 
      0098D6 52 04            [ 1] 4685 9$: ld a,#TK_INTGR
      0098D8 17               [ 4] 4686 	ret 
                                   4687 
                                   4688 ;---------------------
                                   4689 ; BASIC: GPIO(expr,reg)
                                   4690 ; return gpio address 
                                   4691 ; expr {0..8}
                                   4692 ; input:
                                   4693 ;   none 
                                   4694 ; output:
                                   4695 ;   X 		gpio register address
                                   4696 ;----------------------------
      001ADB                       4697 gpio:
      0098D9 03 5F            [ 1] 4698 	ld a,#TK_LPAREN 
      0098DB CF 00 16         [ 4] 4699 	call expect 
      0098DE 35 01 00         [ 4] 4700 	call arg_list
      0098E1 15 02            [ 1] 4701 	cp a,#2
      0098E2 27 03            [ 1] 4702 	jreq 1$
      0098E2 92 BC 00         [ 2] 4703 	jp syntax_error  
      001AEA                       4704 1$:	
      0098E5 15 27            [ 1] 4705 	ld a,#TK_RPAREN 
      0098E7 24 5F 16         [ 4] 4706 	call expect 
      0098EA 03 CD 98         [ 4] 4707 	call dpop
      0098ED B5               [ 2] 4708 	pushw x 
      0098EE 25 2C 92         [ 4] 4709 	call dpop 
      0098F1 AF               [ 2] 4710 	tnzw x 
      0098F2 00 15            [ 1] 4711 	jrmi bad_port
      0098F4 6B 01 5C         [ 2] 4712 	cpw x,#9
      0098F7 92 AF            [ 1] 4713 	jrpl bad_port
      0098F9 00 15            [ 1] 4714 	ld a,#5
      0098FB 6B               [ 4] 4715 	mul x,a
      0098FC 02 5C 72         [ 2] 4716 	addw x,#GPIO_BASE 
      0098FF FB 01 CD         [ 2] 4717 	addw x,(1,sp)
      001B07                       4718 	_drop 2 
      009902 98 11            [ 2]    1     addw sp,#2 
      009904 AE 02            [ 1] 4719 	ld a,#TK_INTGR
      009906 80               [ 4] 4720 	ret
      001B0C                       4721 bad_port:
      009907 C3 00            [ 1] 4722 	ld a,#ERR_BAD_VALUE
      009909 15 2A D6         [ 2] 4723 	jp tb_error
                                   4724 
                                   4725 ;----------------------
                                   4726 ; BASIC: ODR 
                                   4727 ; return offset of gpio
                                   4728 ; ODR register: 0
                                   4729 ; ---------------------
      00990C                       4730 port_odr:
      00990C 72               [ 1] 4731 	clrw x 
      00990D 5F 00 15         [ 2] 4732 	ldw tokval,x 
      009910 72 5F            [ 1] 4733 	ld a,#TK_INTGR
      009912 00               [ 4] 4734 	ret
                                   4735 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                   4736 ;----------------------
                                   4737 ; BASIC: IDR 
                                   4738 ; return offset of gpio
                                   4739 ; IDR register: 1
                                   4740 ; ---------------------
      001B18                       4741 port_idr:
      009913 16 72 5F         [ 2] 4742 	ldw x,#1
      009916 00 17 5B         [ 2] 4743 	ldw tokval,x 
      009919 04 98            [ 1] 4744 	ld a,#TK_INTGR
      00991B 81               [ 4] 4745 	ret
                                   4746 
                                   4747 ;----------------------
                                   4748 ; BASIC: DDR 
                                   4749 ; return offset of gpio
                                   4750 ; DDR register: 2
                                   4751 ; ---------------------
      00991C                       4752 port_ddr:
      00991C 5B 04 99         [ 2] 4753 	ldw x,#2
      00991F 81 00 12         [ 2] 4754 	ldw tokval,x 
      009920 A6 0A            [ 1] 4755 	ld a,#TK_INTGR
      009920 72               [ 4] 4756 	ret
                                   4757 
                                   4758 ;----------------------
                                   4759 ; BASIC: CRL  
                                   4760 ; return offset of gpio
                                   4761 ; CR1 register: 3
                                   4762 ; ---------------------
      001B2A                       4763 port_cr1:
      009921 01 00 26         [ 2] 4764 	ldw x,#3
      009924 05 A6 07         [ 2] 4765 	ldw tokval,x 
      009927 CC 87            [ 1] 4766 	ld a,#TK_INTGR
      009929 12               [ 4] 4767 	ret
                                   4768 
                                   4769 ;----------------------
                                   4770 ; BASIC: CRH  
                                   4771 ; return offset of gpio
                                   4772 ; CR2 register: 4
                                   4773 ; ---------------------
      00992A                       4774 port_cr2:
      00992A CE 00 1F         [ 2] 4775 	ldw x,#4
      00992D 72 B0 00         [ 2] 4776 	ldw tokval,x 
      009930 1D 26            [ 1] 4777 	ld a,#TK_INTGR
      009932 02               [ 4] 4778 	ret
                                   4779 
                                   4780 
                                   4781 ;---------------------
                                   4782 ;
                                   4783 ;---------------------
      001B3C                       4784 usr:
      009933 4F 81 75         [ 2] 4785 	ldw x,#USR 
      009935 CD 02 3A         [ 4] 4786 	call prt_cstr 
      009935 C6               [ 4] 4787 	ret 
                                   4788 
                                   4789 ;------------------------------
                                   4790 ; BASIC: BYE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                   4791 ; halt mcu in its lowest power mode 
                                   4792 ; wait for reset or external interrupt
                                   4793 ; do a cold start on wakeup.
                                   4794 ;------------------------------
      001B43                       4795 bye:
      009936 00 18 CA 00 19   [ 2] 4796 	btjf UART3_SR,#UART_SR_TC,.
      00993B CA               [10] 4797 	halt
      00993C 00 1A 26         [ 2] 4798 	jp cold_start  
                                   4799 
                                   4800 ;----------------------------------
                                   4801 ; BASIC: SLEEP 
                                   4802 ; halt mcu until reset or external
                                   4803 ; interrupt.
                                   4804 ; Resume progam after SLEEP command
                                   4805 ;----------------------------------
      001B4C                       4806 sleep:
      00993F 05 A6 01 CC 87   [ 2] 4807 	btjf UART3_SR,#UART_SR_TC,.
      009944 12 CD 8C C8      [ 1] 4808 	bset flags,#FSLEEP
      009948 A1               [10] 4809 	halt 
      009949 06               [ 4] 4810 	ret 
                                   4811 
                                   4812 ;-------------------------------
                                   4813 ; BASIC: PAUSE expr 
                                   4814 ; suspend execution for n msec.
                                   4815 ; input:
                                   4816 ;	none
                                   4817 ; output:
                                   4818 ;	none 
                                   4819 ;------------------------------
      001B57                       4820 pause:
      00994A 27 03 CC         [ 4] 4821 	call expression
      00994D 87 10            [ 1] 4822 	cp a,#TK_INTGR
      00994F 27 03            [ 1] 4823 	jreq 0$
      00994F 90 CE 00         [ 2] 4824 	jp syntax_error
      009952 13 CD 98         [ 4] 4825 0$: call dpop 	
      009955 D6               [ 2] 4826 1$: tnzw x 
      009956 24 05            [ 1] 4827 	jreq 2$
      009958 A6               [10] 4828 	wfi 
      009959 08               [ 2] 4829 	decw x 
      00995A CC 87            [ 1] 4830 	jrne 1$
      00995C 12               [ 1] 4831 2$:	clr a 
      00995D 81               [ 4] 4832 	ret 
                                   4833 
                                   4834 ;------------------------------
                                   4835 ; BASIC: TICKS
                                   4836 ; return msec ticks counter value 
                                   4837 ; input:
                                   4838 ; 	none 
                                   4839 ; output:
                                   4840 ;	X 		TK_INTGR
                                   4841 ;-------------------------------
      001B6D                       4842 get_ticks:
      00995D CE 00 18         [ 2] 4843 	ldw x,ticks 
      009960 C6 00            [ 1] 4844 	ld a,#TK_INTGR
      009962 1A               [ 4] 4845 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                   4846 
                                   4847 
                                   4848 
                                   4849 ;------------------------------
                                   4850 ; BASIC: ABS(expr)
                                   4851 ; return absolute value of expr.
                                   4852 ; input:
                                   4853 ;   none
                                   4854 ; output:
                                   4855 ;   X     	positive integer
                                   4856 ;-------------------------------
      001B73                       4857 abs:
      009963 CF 00            [ 1] 4858 	ld a,#TK_LPAREN
      009965 15 C7 00         [ 4] 4859 	call expect 
      009968 17 CE 00         [ 4] 4860 	call arg_list
      00996B 13 CD            [ 1] 4861 	cp a,#1 
      00996D 83 86            [ 1] 4862 	jreq 0$ 
      00996F 5C 89 5F         [ 2] 4863 	jp syntax_error
      009972 90 CE            [ 1] 4864 0$: ld a,#TK_RPAREN 
      009974 00 13 CD         [ 4] 4865 	call expect 
      009977 82 51 5B         [ 4] 4866     call dpop 
      00997A 02               [ 1] 4867 	ld a,xh 
      00997B CE 00            [ 1] 4868 	bcp a,#0x80 
      00997D 1F 72            [ 1] 4869 	jreq 2$ 
      00997F B0               [ 2] 4870 	negw x 
      009980 00 1D            [ 1] 4871 2$: ld a,#TK_INTGR 
      009982 89               [ 4] 4872 	ret 
                                   4873 
                                   4874 ;------------------------------
                                   4875 ; BASIC: RND(expr)
                                   4876 ; return random number 
                                   4877 ; between 1 and expr inclusive
                                   4878 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   4879 ; input:
                                   4880 ; 	none 
                                   4881 ; output:
                                   4882 ;	X 		random positive integer 
                                   4883 ;------------------------------
      001B93                       4884 random:
      009983 5F 7B            [ 1] 4885 	ld a,#TK_LPAREN 
      009985 01 CD 81         [ 4] 4886 	call expect 
      009988 DC 5C 7B         [ 4] 4887 	call arg_list 
      00998B 02 CD            [ 1] 4888 	cp a,#1
      00998D 81 DC            [ 1] 4889 	jreq 1$
      00998F 5C CD 98         [ 2] 4890 	jp syntax_error
      009992 11 1E            [ 1] 4891 1$: ld a,#TK_RPAREN
      009994 01 89 5F         [ 4] 4892 	call expect 
      009997 90 CE 00         [ 4] 4893 	call dpop 
      00999A 1D               [ 2] 4894 	pushw x 
      00999B CD               [ 1] 4895 	ld a,xh 
      00999C 82 51            [ 1] 4896 	bcp a,#0x80 
      00999E 5B 02            [ 1] 4897 	jreq 2$
      0099A0 CE 00            [ 1] 4898 	ld a,#ERR_BAD_VALUE
      0099A2 15 C6 00         [ 2] 4899 	jp tb_error
      001BB5                       4900 2$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                   4901 ; acc16=(x<<5)^x 
      0099A5 17 CF 00         [ 2] 4902 	ldw x,seedx 
      0099A8 18               [ 2] 4903 	sllw x 
      0099A9 C7               [ 2] 4904 	sllw x 
      0099AA 00               [ 2] 4905 	sllw x 
      0099AB 1A               [ 2] 4906 	sllw x 
      0099AC 5F               [ 2] 4907 	sllw x 
      0099AD 4F               [ 1] 4908 	ld a,xh 
      0099AE CD 81 DC         [ 1] 4909 	xor a,seedx 
      0099B1 5C 4F CD         [ 1] 4910 	ld acc16,a 
      0099B4 81               [ 1] 4911 	ld a,xl 
      0099B5 DC 5C 4F         [ 1] 4912 	xor a,seedx+1 
      0099B8 CD 81 DC         [ 1] 4913 	ld acc8,a 
                                   4914 ; seedx=seedy 
      0099BB 85 A6 0A         [ 2] 4915 	ldw x,seedy 
      0099BE 81 00 0D         [ 2] 4916 	ldw seedx,x  
                                   4917 ; seedy=seedy^(seedy>>1)
      0099BF 90 54            [ 2] 4918 	srlw y 
      0099BF 72 01            [ 1] 4919 	ld a,yh 
      0099C1 00 26 07         [ 1] 4920 	xor a,seedy 
      0099C4 27 05 A6         [ 1] 4921 	ld seedy,a  
      0099C7 07 CC            [ 1] 4922 	ld a,yl 
      0099C9 87 12 10         [ 1] 4923 	xor a,seedy+1 
      0099CB C7 00 10         [ 1] 4924 	ld seedy+1,a 
                                   4925 ; acc16>>3 
      0099CB CD 8C C8         [ 2] 4926 	ldw x,acc16 
      0099CE A1               [ 2] 4927 	srlw x 
      0099CF 06               [ 2] 4928 	srlw x 
      0099D0 27               [ 2] 4929 	srlw x 
                                   4930 ; x=acc16^x 
      0099D1 03               [ 1] 4931 	ld a,xh 
      0099D2 CC 87 10         [ 1] 4932 	xor a,acc16 
      0099D5 95               [ 1] 4933 	ld xh,a 
      0099D5 90               [ 1] 4934 	ld a,xl 
      0099D6 93 CD 98         [ 1] 4935 	xor a,acc8 
      0099D9 D6               [ 1] 4936 	ld xl,a 
                                   4937 ; seedy=x^seedy 
      0099DA 25 05 A6         [ 1] 4938 	xor a,seedy+1
      0099DD 09               [ 1] 4939 	ld xl,a 
      0099DE CC               [ 1] 4940 	ld a,xh 
      0099DF 87 12 0F         [ 1] 4941 	xor a,seedy
      0099E1 95               [ 1] 4942 	ld xh,a 
      0099E1 CD 98 11         [ 2] 4943 	ldw seedy,x 
                                   4944 ; return seedy modulo expr + 1 
      0099E4 CD 85            [ 2] 4945 	popw y 
      0099E6 EE               [ 2] 4946 	divw x,y 
      0099E7 5F               [ 1] 4947 	ldw x,y 
      0099E8 92               [ 1] 4948 	incw x 
      0099E9 AF 00            [ 1] 4949 	ld a,#TK_INTGR
      0099EB 15               [ 4] 4950 	ret 
                                   4951 
                                   4952 ;*********************************
                                   4953 
                                   4954 ;------------------------------
                                   4955 ;      dictionary 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                   4956 ; format:
                                   4957 ;   link   2 bytes 
                                   4958 ;   cmd_name 8 byte max 
                                   4959 ;   code_address 2 bytes 
                                   4960 ;------------------------------
                           000080  4961 	FFUNC=128 
                                   4962 	.macro _dict_entry len,name,cmd 
                                   4963 	.word LINK 
                                   4964 	LINK=.
                                   4965 name:
                                   4966 	.byte len 	
                                   4967 	.ascii "name"
                                   4968 	.word cmd 
                                   4969 	.endm 
                                   4970 
                           000000  4971 	LINK=0
      001C07                       4972 kword_end:
      001C07                       4973 	_dict_entry,3,BYE,bye 
      0099EC 90 95                    1 	.word LINK 
                           001C09     2 	LINK=.
      001C09                          3 BYE:
      0099EE 5C                       4 	.byte 3 	
      0099EF 92 AF 00                 5 	.ascii "BYE"
      0099F2 15 5C                    6 	.word bye 
      001C0F                       4974 	_dict_entry,5,SLEEP,sleep 
      0099F4 90 97                    1 	.word LINK 
                           001C11     2 	LINK=.
      001C11                          3 SLEEP:
      0099F6 72                       4 	.byte 5 	
      0099F7 B9 00 1D 90 CF           5 	.ascii "SLEEP"
      0099FC 00 1F                    6 	.word sleep 
      001C19                       4975 	_dict_entry,6,FORGET,forget 
      0099FE 90 CE                    1 	.word LINK 
                           001C1B     2 	LINK=.
      001C1B                          3 FORGET:
      009A00 00                       4 	.byte 6 	
      009A01 1D 4F 52 47 45 54        5 	.ascii "FORGET"
      009A02 19 A0                    6 	.word forget 
      001C24                       4976 	_dict_entry,3,DIR,directory 
      009A02 92 AF                    1 	.word LINK 
                           001C26     2 	LINK=.
      001C26                          3 DIR:
      009A04 00                       4 	.byte 3 	
      009A05 15 90 F7                 5 	.ascii "DIR"
      009A08 5C 90                    6 	.word directory 
      001C2C                       4977 	_dict_entry,4,LOAD,load 
      009A0A 5C 90                    1 	.word LINK 
                           001C2E     2 	LINK=.
      001C2E                          3 LOAD:
      009A0C C3                       4 	.byte 4 	
      009A0D 00 1F 2B F1              5 	.ascii "LOAD"
      009A11 CE 00                    6 	.word load 
      001C35                       4978 	_dict_entry,4,SAVE,save
      009A13 1F 72                    1 	.word LINK 
                           001C37     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      001C37                          3 SAVE:
      009A15 B0                       4 	.byte 4 	
      009A16 00 1D CD 8F              5 	.ascii "SAVE"
      009A1A 8E CD                    6 	.word save 
      001C3E                       4979 	_dict_entry,5,WRITE,write  
      009A1C 8F FF                    1 	.word LINK 
                           001C40     2 	LINK=.
      001C40                          3 WRITE:
      009A1E 4F                       4 	.byte 5 	
      009A1F 81 52 49 54 45           5 	.ascii "WRITE"
      009A20 1A 58                    6 	.word write 
      001C48                       4980 	_dict_entry,3,NEW,new
      009A20 CD 8C                    1 	.word LINK 
                           001C4A     2 	LINK=.
      001C4A                          3 NEW:
      009A22 C8                       4 	.byte 3 	
      009A23 A1 00 27                 5 	.ascii "NEW"
      009A26 1D A1                    6 	.word new 
      001C50                       4981 	_dict_entry,4,STOP,stop 
      009A28 06 27                    1 	.word LINK 
                           001C52     2 	LINK=.
      001C52                          3 STOP:
      009A2A 03                       4 	.byte 4 	
      009A2B CC 87 10 90              5 	.ascii "STOP"
      009A2F CE 00                    6 	.word stop 
      001C59                       4982     _dict_entry,4,SHOW,show 
      009A31 13 CD                    1 	.word LINK 
                           001C5B     2 	LINK=.
      001C5B                          3 SHOW:
      009A33 98                       4 	.byte 4 	
      009A34 D6 25 05 A6              5 	.ascii "SHOW"
      009A38 09 CC                    6 	.word show 
      001C62                       4983 	_dict_entry 3,RUN,run
      009A3A 87 12                    1 	.word LINK 
                           001C64     2 	LINK=.
      009A3C                          3 RUN:
      009A3C CE                       4 	.byte 3 	
      009A3D 00 15 C6                 5 	.ascii "RUN"
      009A40 00 17                    6 	.word run 
      001C6A                       4984 	_dict_entry 4,LIST,list
      009A42 20 0B                    1 	.word LINK 
                           001C6C     2 	LINK=.
      009A44                          3 LIST:
      009A44 AE                       4 	.byte 4 	
      009A45 00 00 4F 01              5 	.ascii "LIST"
      009A49 CF 00                    6 	.word list 
      001C73                       4985 	_dict_entry,3,USR,usr
      009A4B 15 C7                    1 	.word LINK 
                           001C75     2 	LINK=.
      001C75                          3 USR:
      009A4D 00                       4 	.byte 3 	
      009A4E 17 53 52                 5 	.ascii "USR"
      009A4F 1B 3C                    6 	.word usr 
      001C7B                       4986 	_dict_entry,3+FFUNC,ODR,port_odr
      009A4F CF 00                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                           001C7D     2 	LINK=.
      001C7D                          3 ODR:
      009A51 18                       4 	.byte 3+FFUNC 	
      009A52 C7 00 1A                 5 	.ascii "ODR"
      009A55 5F 4F                    6 	.word port_odr 
      001C83                       4987 	_dict_entry,3+FFUNC,IDR,port_idr
      009A57 CD 81                    1 	.word LINK 
                           001C85     2 	LINK=.
      001C85                          3 IDR:
      009A59 DC                       4 	.byte 3+FFUNC 	
      009A5A AE 00 01                 5 	.ascii "IDR"
      009A5D CD 98                    6 	.word port_idr 
      001C8B                       4988 	_dict_entry,3+FFUNC,DDR,port_ddr 
      009A5F 11 C6                    1 	.word LINK 
                           001C8D     2 	LINK=.
      001C8D                          3 DDR:
      009A61 00                       4 	.byte 3+FFUNC 	
      009A62 15 C1 00                 5 	.ascii "DDR"
      009A65 18 2B                    6 	.word port_ddr 
      001C93                       4989 	_dict_entry,3+FFUNC,CRL,port_cr1 
      009A67 ED CE                    1 	.word LINK 
                           001C95     2 	LINK=.
      001C95                          3 CRL:
      009A69 00                       4 	.byte 3+FFUNC 	
      009A6A 16 C3 00                 5 	.ascii "CRL"
      009A6D 19 2B                    6 	.word port_cr1 
      001C9B                       4990 	_dict_entry,3+FFUNC,CRH,port_cr2
      009A6F E5 81                    1 	.word LINK 
                           001C9D     2 	LINK=.
      009A71                          3 CRH:
      009A71 52                       4 	.byte 3+FFUNC 	
      009A72 02 5F 1F                 5 	.ascii "CRH"
      009A75 01 CF                    6 	.word port_cr2 
      001CA3                       4991 	_dict_entry,4+FFUNC,GPIO,gpio 
      009A77 00 16                    1 	.word LINK 
                           001CA5     2 	LINK=.
      001CA5                          3 GPIO:
      009A79 35                       4 	.byte 4+FFUNC 	
      009A7A 01 00 15 4F              5 	.ascii "GPIO"
      009A7D 1A DB                    6 	.word gpio 
      001CAC                       4992 	_dict_entry,3+FFUNC,ASC,ascii  
      009A7D 5F 92                    1 	.word LINK 
                           001CAE     2 	LINK=.
      001CAE                          3 ASC:
      009A7F AF                       4 	.byte 3+FFUNC 	
      009A80 00 15 27                 5 	.ascii "ASC"
      009A83 3B 96                    6 	.word ascii 
      009A84                       4993 	_dict_entry,4+FFUNC,CHAR,char
      009A84 92 AF                    1 	.word LINK 
                           001CB6     2 	LINK=.
      001CB6                          3 CHAR:
      009A86 00                       4 	.byte 4+FFUNC 	
      009A87 15 27 06 CD              5 	.ascii "CHAR"
      009A8B 82 9E                    6 	.word char 
      001CBD                       4994 	_dict_entry,4+FFUNC,QKEY,qkey  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009A8D 5C 20                    1 	.word LINK 
                           001CBF     2 	LINK=.
      001CBF                          3 QKEY:
      009A8F F4                       4 	.byte 4+FFUNC 	
      009A90 5C A6 20 CD              5 	.ascii "QKEY"
      009A94 82 9E                    6 	.word qkey 
      001CC6                       4995 	_dict_entry,3+FFUNC,KEY,key 
      009A96 92 AF                    1 	.word LINK 
                           001CC8     2 	LINK=.
      001CC8                          3 KEY:
      009A98 00                       4 	.byte 3+FFUNC 	
      009A99 15 90 95                 5 	.ascii "KEY"
      009A9C 5C 92                    6 	.word key 
      001CCE                       4996 	_dict_entry,4+FFUNC,SIZE,size
      009A9E AF 00                    1 	.word LINK 
                           001CD0     2 	LINK=.
      001CD0                          3 SIZE:
      009AA0 15                       4 	.byte 4+FFUNC 	
      009AA1 5C 90 97 90              5 	.ascii "SIZE"
      009AA5 89 72                    6 	.word size 
      001CD7                       4997 	_dict_entry,3,HEX,hex_base
      009AA7 FB 01                    1 	.word LINK 
                           001CD9     2 	LINK=.
      001CD9                          3 HEX:
      009AA9 CD                       4 	.byte 3 	
      009AAA 98 11 85                 5 	.ascii "HEX"
      009AAD CD 8F                    6 	.word hex_base 
      001CDF                       4998 	_dict_entry,3,DEC,dec_base
      009AAF 8E CD                    1 	.word LINK 
                           001CE1     2 	LINK=.
      001CE1                          3 DEC:
      009AB1 8F                       4 	.byte 3 	
      009AB2 FF A6 0D                 5 	.ascii "DEC"
      009AB5 CD 82                    6 	.word dec_base 
      001CE7                       4999 	_dict_entry,5+FFUNC,TICKS,get_ticks
      009AB7 9E 1E                    1 	.word LINK 
                           001CE9     2 	LINK=.
      001CE9                          3 TICKS:
      009AB9 01                       4 	.byte 5+FFUNC 	
      009ABA 5C 1F 01 20 BE           5 	.ascii "TICKS"
      009ABF 1B 6D                    6 	.word get_ticks 
      001CF1                       5000 	_dict_entry,3+FFUNC,ABS,abs
      009ABF 1E 01                    1 	.word LINK 
                           001CF3     2 	LINK=.
      001CF3                          3 ABS:
      009AC1 CD                       4 	.byte 3+FFUNC 	
      009AC2 8F 8E CD                 5 	.ascii "ABS"
      009AC5 8F FF                    6 	.word abs 
      001CF9                       5001 	_dict_entry,3+FFUNC,RND,random 
      009AC7 AE 9A                    1 	.word LINK 
                           001CFB     2 	LINK=.
      001CFB                          3 RND:
      009AC9 D0                       4 	.byte 3+FFUNC 	
      009ACA CD 82 B0                 5 	.ascii "RND"
      009ACD 5B 02                    6 	.word random 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      001D01                       5002 	_dict_entry,5,PAUSE,pause 
      009ACF 81 20                    1 	.word LINK 
                           001D03     2 	LINK=.
      001D03                          3 PAUSE:
      009AD1 66                       4 	.byte 5 	
      009AD2 69 6C 65 73 0A           5 	.ascii "PAUSE"
      009AD7 00 57                    6 	.word pause 
      009AD8                       5003 	_dict_entry,4,BSET,bit_set 
      009AD8 72 5F                    1 	.word LINK 
                           001D0D     2 	LINK=.
      001D0D                          3 BSET:
      009ADA 00                       4 	.byte 4 	
      009ADB 15 CD 91 DC              5 	.ascii "BSET"
      009ADF A1 02                    6 	.word bit_set 
      001D14                       5004 	_dict_entry,4,BRES,bit_reset
      009AE1 27 03                    1 	.word LINK 
                           001D16     2 	LINK=.
      001D16                          3 BRES:
      009AE3 CC                       4 	.byte 4 	
      009AE4 87 10 45 53              5 	.ascii "BRES"
      009AE6 15 54                    6 	.word bit_reset 
      001D1D                       5005 	_dict_entry,5,BTOGL,bit_toggle
      009AE6 CD 8F                    1 	.word LINK 
                           001D1F     2 	LINK=.
      001D1F                          3 BTOGL:
      009AE8 9B                       4 	.byte 5 	
      009AE9 9F CD 8F 9B CF           5 	.ascii "BTOGL"
      009AEE 00 16                    6 	.word bit_toggle 
      001D27                       5006 	_dict_entry 4,WAIT,wait 
      009AF0 5F CD                    1 	.word LINK 
                           001D29     2 	LINK=.
      001D29                          3 WAIT:
      009AF2 81                       4 	.byte 4 	
      009AF3 DC 81 49 54              5 	.ascii "WAIT"
      009AF5 15 13                    6 	.word wait 
      001D30                       5007 	_dict_entry 6,REMARK,rem 
      009AF5 A6 04                    1 	.word LINK 
                           001D32     2 	LINK=.
      001D32                          3 REMARK:
      009AF7 CD                       4 	.byte 6 	
      009AF8 91 CF CD 93 22 A1        5 	.ascii "REMARK"
      009AFE 0A 27                    6 	.word rem 
      001D3B                       5008 	_dict_entry 5,PRINT,print 
      009B00 03 CC                    1 	.word LINK 
                           001D3D     2 	LINK=.
      001D3D                          3 PRINT:
      009B02 87                       4 	.byte 5 	
      009B03 10 52 49 4E 54           5 	.ascii "PRINT"
      009B04 14 01                    6 	.word print 
      001D45                       5009 	_dict_entry,2,IF,if 
      009B04 A6 05                    1 	.word LINK 
                           001D47     2 	LINK=.
      001D47                          3 IF:
      009B06 CD                       4 	.byte 2 	
      009B07 91 CF                    5 	.ascii "IF"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009B09 CD 8F                    6 	.word if 
      001D4C                       5010 	_dict_entry,5,GOSUB,gosub 
      009B0B 9B 9F                    1 	.word LINK 
                           001D4E     2 	LINK=.
      001D4E                          3 GOSUB:
      009B0D A4                       4 	.byte 5 	
      009B0E 7F 97 CF 00 13           5 	.ascii "GOSUB"
      009B13 A6 0B                    6 	.word gosub 
      001D56                       5011 	_dict_entry,4,GOTO,goto 
      009B15 81 4E                    1 	.word LINK 
                           001D58     2 	LINK=.
      009B16                          3 GOTO:
      009B16 A6                       4 	.byte 4 	
      009B17 04 CD 91 CF              5 	.ascii "GOTO"
      009B1B CD 8C                    6 	.word goto 
      001D5F                       5012 	_dict_entry,3,FOR,for 
      009B1D C8 A1                    1 	.word LINK 
                           001D61     2 	LINK=.
      001D61                          3 FOR:
      009B1F 06                       4 	.byte 3 	
      009B20 27 07 A1                 5 	.ascii "FOR"
      009B23 0B 27                    6 	.word for 
      001D67                       5013 	_dict_entry,2,TO,to
      009B25 09 CC                    1 	.word LINK 
                           001D69     2 	LINK=.
      001D69                          3 TO:
      009B27 87                       4 	.byte 2 	
      009B28 10 CE                    5 	.ascii "TO"
      009B2A 00 13                    6 	.word to 
      001D6E                       5014 	_dict_entry,4,STEP,step 
      009B2C F6 20                    1 	.word LINK 
                           001D70     2 	LINK=.
      001D70                          3 STEP:
      009B2E 04                       4 	.byte 4 	
      009B2F CE 00 13 9F              5 	.ascii "STEP"
      009B33 5F 97                    6 	.word step 
      001D77                       5015 	_dict_entry,4,NEXT,next 
      009B35 CD 8F                    1 	.word LINK 
                           001D79     2 	LINK=.
      001D79                          3 NEXT:
      009B37 8E                       4 	.byte 4 	
      009B38 A6 05 CD 91              5 	.ascii "NEXT"
      009B3C CF CD                    6 	.word next 
      001D80                       5016 	_dict_entry,6+FFUNC,UBOUND,ubound 
      009B3E 8F 9B                    1 	.word LINK 
                           001D82     2 	LINK=.
      001D82                          3 UBOUND:
      009B40 CF                       4 	.byte 6+FFUNC 	
      009B41 00 13 A6 0A 81 44        5 	.ascii "UBOUND"
      009B46 13 10                    6 	.word ubound 
      001D8B                       5017 	_dict_entry,6,RETURN,return 
      009B46 CD 82                    1 	.word LINK 
                           001D8D     2 	LINK=.
      001D8D                          3 RETURN:
      009B48 A7                       4 	.byte 6 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009B49 5F 97 CF 00 13 A6        5 	.ascii "RETURN"
      009B4F 0A 81                    6 	.word return 
      009B51                       5018 	_dict_entry,4+FFUNC,PEEK,peek 
      009B51 5F 72                    1 	.word LINK 
                           001D98     2 	LINK=.
      001D98                          3 PEEK:
      009B53 0B                       4 	.byte 4+FFUNC 	
      009B54 52 40 01 5C              5 	.ascii "PEEK"
      009B58 A6 0A                    6 	.word peek 
      001D9F                       5019 	_dict_entry,4,POKE,poke 
      009B5A 81 98                    1 	.word LINK 
                           001DA1     2 	LINK=.
      009B5B                          3 POKE:
      009B5B A6                       4 	.byte 4 	
      009B5C 04 CD 91 CF              5 	.ascii "POKE"
      009B60 CD 91                    6 	.word poke 
      001DA8                       5020 	_dict_entry,5,INPUT,input_var  
      009B62 DC A1                    1 	.word LINK 
                           001DAA     2 	LINK=.
      001DAA                          3 INPUT:
      009B64 02                       4 	.byte 5 	
      009B65 27 03 CC 87 10           5 	.ascii "INPUT"
      009B6A 14 9C                    6 	.word input_var 
      001DB2                       5021 kword_dict:
      001DB2                       5022 	_dict_entry 3,LET,let 
      009B6A A6 05                    1 	.word LINK 
                           001DB4     2 	LINK=.
      001DB4                          3 LET:
      009B6C CD                       4 	.byte 3 	
      009B6D 91 CF CD                 5 	.ascii "LET"
      009B70 8F 9B                    6 	.word let 
                                   5023 	
                                   5024 
      001E00                       5025 	.bndry 128 ; align on FLASH block.
                                   5026 ; free space for user application  
      001E00                       5027 user_space:
                                   5028 
                                   5029 	.area FLASH_DRIVE (ABS)
      010000                       5030 	.org 0x10000
      010000                       5031 fdrive:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        001CF3 R   |     ADC_CR1 =  005401 
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
    ARG_OFS =  000002     |   5 ASC        001CAE R   |     ATTRIB  =  000002 
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
    BPTR    =  000005     |   5 BRES       001D16 R   |   5 BSET       001D0D R
    BSIZE   =  000005     |     BSP     =  000008     |   5 BTOGL      001D1F R
    BTW     =  000001     |   5 BYE        001C09 R   |     C       =  000001 
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
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   5 CHAR       001CB6 R
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
  5 CRH        001C9D R   |   5 CRL        001C95 R   |     CTRL_A  =  000001 
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
    DBG_Y   =  000001     |   5 DDR        001C8D R   |     DEBUG   =  000001 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   5 DEC        001CE1 R
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  5 DIR        001C26 R   |     DIVIDND =  000007     |     DIVISR  =  000005 
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
    FLSI    =  01F400     |   5 FOR        001D61 R   |   5 FORGET     001C1B R
    FRUN    =  000000     |     FSIZE   =  000001     |     FSLEEP  =  000003 
    FTRAP   =  000001     |   5 GOSUB      001D4E R   |     GOS_RET =  000003 
  5 GOTO       001D58 R   |   5 GPIO       001CA5 R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  5 HEX        001CD9 R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   5 IDR        001C85 R
  5 IF         001D47 R   |     IN      =  000007     |     INCR    =  000001 
  5 INPUT      001DAA R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
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

  5 KEY        001CC8 R   |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000005     |   5 LET        001DB4 R   |     LINENO  =  000005 
  5 LINK    =  001DB4 R   |   5 LIST       001C6C R   |     LL      =  000002 
    LLEN    =  000007     |     LL_HB   =  000001     |     LNO     =  000005 
    LN_PTR  =  000005     |   5 LOAD       001C2E R   |     MAJOR   =  000001 
    MASK    =  000002     |     MATH_OVF=  000000     |     MINOR   =  000000 
    MULOP   =  000005     |     N1      =  000001     |     N1_HB   =  000006 
    N1_LB   =  000007     |     N2      =  000003     |     N2_HB   =  000008 
    N2_LB   =  000009     |     NAFR    =  004804     |     NCLKOPT =  004808 
    NEG     =  000001     |   5 NEW        001C4A R   |   5 NEXT       001D79 R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NL      =  00000A 
    NLEN    =  000001     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  5 NonHandl   000009 R   |   5 ODR        001C7D R   |     OP      =  000005 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVFH    =  000001 
    OVFL    =  000002     |     PA      =  000000     |     PAD_SIZE=  000028 
  5 PAUSE      001D03 R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |     PD_BASE =  00500F     |     PD_CR1  =  005012 
    PD_CR2  =  005013     |     PD_DDR  =  005011     |     PD_IDR  =  005010 
    PD_ODR  =  00500F     |     PE      =  000014     |   5 PEEK       001D98 R
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
    PI_ODR  =  005028     |   5 POKE       001DA1 R   |     PREV    =  000001 
  5 PRINT      001D3D R   |     PROD    =  000002     |     PSIZE   =  000001 
  5 QKEY       001CBF R   |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |   5 REG_A      0008B4 R   |   5 REG_CC     0008B9 R
  5 REG_EPC    0008A4 R   |   5 REG_SP     0008BF R   |   5 REG_X      0008AF R
  5 REG_Y      0008AA R   |     RELOP   =  000005     |   5 REMARK     001D32 R
    RETL1   =  000001     |   5 RETURN     001D8D R   |   5 RND        001CFB R
    ROP     =  004800     |     RST_SR  =  0050B3     |   5 RUN        001C64 R
    RXCHAR  =  000001     |     R_A     =  000007     |     R_CC    =  000008 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]

Symbol Table

    R_X     =  000005     |     R_Y     =  000003     |   5 SAVE       001C37 R
    SDIVD   =  000002     |     SFR_BASE=  005000     |     SFR_END =  0057FF 
    SHARP   =  000023     |   5 SHOW       001C5B R   |     SIGN    =  000001 
  5 SIZE       001CD0 R   |     SKIP    =  000006     |   5 SLEEP      001C11 R
    SPACE   =  000020     |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SQUOT   =  000001     |     SRC     =  000003     |     STACK_EM=  0017FF 
    STACK_SI=  000080     |   5 STATES     000867 R   |   5 STEP       001D70 R
  5 STOP       001C52 R   |     SWIM_CSR=  007F80     |     TAB     =  000009 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   5 TICKS      001CE9 R
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
    TK_SHARP=  000009     |     TK_VAR  =  000002     |   5 TO         001D69 R
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
  5 UBOUND     001D82 R   |   5 USER_ABO   000083 R   |   5 USR        001C75 R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
  5 UserButt   000025 R   |     VSIZE   =  000002     |     VT      =  00000B 
  5 WAIT       001D29 R   |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH   =  000001     |   5 WRITE      001C40 R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XMASK   =  000001     |     XSAVE   =  000001 
    YSAVE   =  000003     |   5 abs        001B73 R   |   1 acc16      000009 R
  1 acc24      000008 R   |   1 acc8       00000A R   |   5 accept_c   000A16 R
  5 add        001035 R   |   5 ansi_seq   0009D4 R   |   5 arg_list   00115C R
  1 array_ad   000021 R   |   1 array_si   000023 R   |   5 ascii      001A96 R
  5 at_tst     000D16 R   |   5 atoi       000E4F R   |   5 atoi_exi   000EBD R
  5 bad_port   001B0C R   |   1 base       000007 R   |   1 basicptr   000003 R
  5 bin_exit   000BFB R   |   5 bit_rese   001554 R   |   5 bit_set    00153F R
  5 bit_togg   00156A R   |   5 bkslsh_t   000CC1 R   |   5 bksp       00024E R
  5 bye        001B43 R   |   5 char       001A75 R   |   5 clear_ba   00056E R
  5 clear_va   00047E R   |   5 clock_in   00009E R   |   5 cmd_itf    000A3A R
  5 cmp_name   001835 R   |   5 cold_sta   0004E3 R   |   5 colon_ts   000CEA R
  5 comma_ts   000CF5 R   |   5 convert_   000B61 R   |   1 count      000002 R
  5 cp_loop    001108 R   |   5 create_g   0003D3 R   |   5 cstk_pro   000FEC R
  5 dash_tst   000D0B R   |   5 ddrop      000F42 R   |   5 ddrop_n    0010E0 R
  5 ddup       000F4B R   |   5 dec_base   0012FE R   |   5 del_back   000A07 R
  5 del_line   0003A4 R   |   5 del_ln     0009F8 R   |   5 delete     00025E R
  5 dir_loop   0019FD R   |   5 director   0019F1 R   |   5 divide     00108B R
  5 divu24_8   000961 R   |   5 dotr       000FF5 R   |   5 dotr_loo   001003 R
  5 dots       000FBC R   |   5 dpick      000F5C R   |   5 dpop       000F1B R
  5 dpush      000F0E R   |   3 dstack     001740 R   |   3 dstack_u   001780 R
  5 dstk_pro   000FB2 R   |   1 dstkptr    00001A R   |   5 dswap      000F28 R
  5 empty      0013D2 R   |   5 eql_tst    000D78 R   |   5 erase_bl   000120 R
  5 erase_en   00010C R   |   5 erase_fl   000146 R   |   5 erase_st   0000E1 R
  5 err_bad_   00064F R   |   5 err_cmd_   000610 R   |   5 err_div0   0005D2 R
  5 err_dupl   00062B R   |   5 err_math   0005B8 R   |   5 err_mem_   00059B R
  5 err_msg    000583 R   |   5 err_no_a   00065C R   |   5 err_no_l   0005E2 R
  5 err_not_   00063D R   |   5 err_run_   0005F9 R   |   5 err_synt   0005A9 R
  5 execute    0010F3 R   |   5 expect     00114F R   |   5 expr_exi   00129F R
  5 expressi   00125E R   |   5 factor     0011BD R   |   1 farptr     000014 R
  7 fdrive     010000 R   |   5 fetch      000F6B R   |   5 fetchc     000B07 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]

Symbol Table

  1 ffree      000017 R   |   5 ffree_ms   00181E R   |   5 file_cou   001A50 R
  5 final_te   0009CE R   |   5 first_li   001376 R   |   1 flags      000025 R
  5 for        0015CB R   |   5 forget     0019A0 R   |   1 free_ram   00005B R
  5 get_arra   00118A R   |   5 get_tick   001B6D R   |   5 get_toke   000C48 R
  5 getc       000227 R   |   5 go_commo   0016F5 R   |   5 gosub      0016D2 R
  5 goto       0016C5 R   |   5 gpio       001ADB R   |   5 gt_tst     000D83 R
  5 hex_base   0012F9 R   |   5 hse_cloc   000207 R   |   5 hsi_cloc   000211 R
  5 if         0015B3 R   |   1 in         000001 R   |   1 in.w       000000 R
  5 incr_far   001791 R   |   5 input_ex   00150E R   |   5 input_lo   0014A8 R
  5 input_va   00149C R   |   5 insert_l   000404 R   |   5 insert_l   00047B R
  5 interp     000718 R   |   5 interp_l   00075E R   |   5 invalid    000A6F R
  5 invalid_   000ADD R   |   5 is_alpha   00048C R   |   5 is_digit   000E16 R
  5 itoa       00091A R   |   5 itoa_loo   000932 R   |   5 key        001AC6 R
  5 kword_di   001DB2 R   |   5 kword_en   001C07 R   |   5 last_lin   00137F R
  5 ledoff     00079F R   |   5 ledon      00079A R   |   5 ledtoggl   0007A4 R
  5 left_arr   0009D4 R   |   5 left_par   0007AD R   |   5 let        001321 R
  5 let02      00132B R   |   1 lineno     000005 R   |   5 lines_sk   001384 R
  5 list       00134B R   |   5 list_exi   0013CE R   |   5 list_sta   0013A7 R
  5 load       00193F R   |   5 loop_bac   001696 R   |   1 loop_dep   000020 R
  5 loop_don   0016B2 R   |   5 lt_tst     000DBC R   |   5 mem_peek   000A8B R
  5 modulo     0010CF R   |   5 move       000332 R   |   5 move_cod   00010C R
  5 move_dow   000350 R   |   5 move_exi   000372 R   |   5 move_loo   000355 R
  5 move_up    000342 R   |   5 multiply   001043 R   |   5 mulu24_8   000EC1 R
  5 nbr_tst    000C97 R   |   5 neg_acc2   000989 R   |   5 negate     001180 R
  5 new        001785 R   |   5 next       00164E R   |   5 no_match   00111A R
  5 none       000C48 R   |   5 number     000B0D GR  |   5 other      000DF4 R
  3 pad        001718 R   |   5 parse_bi   000BDB R   |   5 parse_in   000BA0 R
  5 parse_ke   000C03 R   |   5 parse_qu   000B26 R   |   5 parser_i   00090D GR
  5 pause      001B57 R   |   5 peek       001593 R   |   5 peek_byt   000AA7 R
  5 plus_tst   000D4C R   |   5 poke       00157F R   |   5 port_cr1   001B2A R
  5 port_cr2   001B33 R   |   5 port_ddr   001B21 R   |   5 port_idr   001B18 R
  5 port_odr   001B11 R   |   5 prcnt_ts   000D6D R   |   5 print      001401 R
  5 print_ex   001465 R   |   5 print_fa   000AEC R   |   5 print_re   000814 R
  5 print_st   000A7F R   |   5 prt_basi   0013E3 R   |   5 prt_cstr   00023A R
  5 prt_loop   001405 R   |   5 prt_peek   0002E2 R   |   5 prt_reg1   0007E0 R
  5 prt_reg8   0007B8 R   |   5 prt_regs   000278 R   |   5 prt_tos    000F7F R
  5 prti24     0008C5 R   |   5 putc       00021E R   |   5 puts       000230 R
  5 qkey       001AD1 R   |   5 qmark_ts   000D21 R   |   5 random     001B93 R
  5 readln     0009AC R   |   5 readln_l   0009B2 R   |   5 readln_q   000A2B R
  5 regs_sta   0002BB R   |   5 rel_exit   0012F6 R   |   5 relation   0012A2 R
  5 rem        001512 R   |   5 repl       000A48 R   |   5 repl_exi   000A6C R
  5 reprint    0009D4 R   |   5 reset_co   001403 R   |   5 rest_con   001487 R
  5 return     00171D R   |   5 right_ar   0009D4 R   |   5 rparnt_t   000CDF R
  5 run        001741 R   |   5 save       0018A0 R   |   5 save_con   001472 R
  5 scan       000B14 R   |   5 search_d   0010F7 R   |   5 search_e   00114B R
  5 search_f   001856 R   |   5 search_l   000375 R   |   5 search_l   000380 R
  5 search_n   0010FB R   |   1 seedx      00000D R   |   1 seedy      00000F R
  5 seek_fdr   00179F R   |   5 sharp_ts   000D00 R   |   5 show       00102D R
  5 size       001303 R   |   5 skip       000EFB R   |   5 slash_ts   000D62 R
  5 sleep      001B4C R   |   5 software   00049D R   |   5 spaces     00026C R
  3 stack_fu   001780 R   |   3 stack_un   001800 R   |   5 star_tst   000D57 R
  5 step       001625 R   |   5 stop       001773 R   |   5 store      000F75 R
  5 store_lo   001637 R   |   5 str_matc   001129 R   |   5 str_tst    000C86 R
  5 strcmp     000313 R   |   5 strcpy     000324 R   |   5 strlen     000306 R
  5 substrac   00103D R   |   5 syntax_e   000690 R   |   1 tab_widt   000026 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]

Symbol Table

  5 tb_error   000692 R   |   5 term       001211 R   |   5 term01     00121A R
  5 term_exi   00125B R   |   5 test_p     000A77 R   |   3 tib        0016C8 R
  5 tick_tst   000D38 R   |   1 ticks      00000B R   |   5 timer4_i   0000B4 R
  5 to         0015F5 R   |   5 to_lower   000E1F GR  |   5 to_upper   000E2A GR
  5 token_ch   000E03 R   |   5 token_ex   000E13 R   |   1 tokval     000012 R
  1 txtbgn     00001C R   |   1 txtend     00001E R   |   5 uart3_in   0001F4 R
  5 uart3_se   000200 R   |   5 uart_ena   000219 R   |   5 ubound     001310 R
  5 unget_to   000F9E R   |   5 unlock_e   0000C5 R   |   5 unlock_f   0000D3 R
  1 untok      000011 R   |   5 upper      000E36 R   |   5 upper_lo   000E3A R
  5 user_spa   001E00 R   |   5 usr        001B3C R   |   1 vars       000027 R
  5 wait       001513 R   |   5 warm_sta   0006F0 R   |   5 write      001A58 R
  5 write_bl   0001D1 R   |   5 write_by   00015C R   |   5 write_ee   000198 R
  5 write_ex   0001CC R   |   5 write_fl   000182 R   |   5 z          00140F R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     5B   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    138   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   1E00   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

