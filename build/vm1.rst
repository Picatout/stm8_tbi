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
                                     19 ;   Implementation of virtual machine for Tiny BASIC
                                     20 ;   REF: https://en.wikipedia.org/wiki/Li-Chen_Wang#Palo_Alto_Tiny_BASIC
                                     21 ;   Palo Alto BASIC is 4th version of TinyBasic
                                     22 ;   DATE: 2019-12-17
                                     23 ;
                                     24 ;--------------------------------------------------
                                     25 ;  X working register
                                     26 ;  Y VM program counter
                                     27 ;  A working register
                                     28 ;  acc16  temporary 
                                     29 ;  ptr16  pointer 
                                     30 ;--------------------------------------------------
                                     31     .module VM1 
                                     32 
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
                                        ;	.include "pab_macros.inc" 
                                            .include "bytecode.inc"
                                        ;;
                                        ; Copyright Jacques Deschênes 2019 
                                        ; This file is part of PABasic 
                                        ;
                                        ;     PABasic is free software: you can redistribute it and/or modify
                                        ;     it under the terms of the GNU General Public License as published by
                                        ;     the Free Software Foundation, either version 3 of the License, or
                                        ;     (at your option) any later version.
                                        ;
                                        ;     PABasic is distributed in the hope that it will be useful,
                                        ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                        ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                        ;     GNU General Public License for more details.
                                        ;
                                        ;     You should have received a copy of the GNU General Public License
                                        ;     along with PABasic.  If not, see <http://www.gnu.org/licenses/>.
                                        ;;
                                        ;--------------------------------------
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                            
                                     40     .list 
                                     41 
                                     42 ;_dbg 
                                     43 
                                     44 ;--------------------------------------
                                     45     .area DATA 
                                     46 ;--------------------------------------	
                           000001    47     TOS=1 ; offset top of stack 
                           000003    48     N=3 ; offset second element on stack
                           000002    49     CELLL=2 ; cell length  2 bytes 
                                     50 
                           000050    51 	TIB_SIZE=80
                           000028    52     PAD_SIZE=40
                                     53 ;	DSTACK_SIZE=64 
                           000080    54 	STACK_SIZE= 128
                           0017FF    55 	STACK_EMPTY=RAM_SIZE-1  
                           000000    56 	FRUN=0 ; flags run code in variable flags
                           000001    57 	FTRAP=1 ; inside trap handler 
                           000002    58 	FFOR=2 ; FOR loop in preparation 
                           000003    59 	FSLEEP=3 ; halt produit par la commande SLEEP 
                           000004    60 	FBREAK=4 ; break point flag 
                           000005    61 	FCOMP=5  ; compiling flags 
                                     62 
      000001                         63 in.w:  .blkb 1 ; parser position in text line
      000002                         64 in:    .blkb 1 ; low byte of in.w
      000003                         65 count: .blkb 1 ; length of string in text line  
      000004                         66 basicptr:  .blkb 2  ; point to text buffer 
      000006                         67 lineno: .blkb 2  ; BASIC line number 
      000008                         68 base:  .blkb 1 ; nemeric base used to print integer 
      000009                         69 acc24: .blkb 1 ; 24 accumulator
      00000A                         70 acc16: .blkb 1
      00000B                         71 acc8:  .blkb 1
      00000C                         72 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
      00000E                         73 seedx: .blkw 1  ; xorshift 16 seed x 
      000010                         74 seedy: .blkw 1  ; xorshift 16 seed y 
      000012                         75 in.w.saved: .blkw 1 ; set by get_token before parsing next token, used by unget_token
      000014                         76 farptr: .blkb 1 ; far pointer used by file system
      000015                         77 ptr16:  .blkb 1 ; middle byte of farptr
      000016                         78 ptr8:   .blkb 1 ; least byte of farptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



      000017                         79 ffree: .blkb 3 ; flash free address ; file system free space pointer
      00001A                         80 dstkptr: .blkw 1  ; data stack pointer 
      00001C                         81 txtbgn: .ds 2 ; BASIC text beginning address 
      00001E                         82 txtend: .ds 2 ; BASIC text end address 
      000020                         83 loop_depth: .ds 1 ; FOR loop depth, level of nested loop.  
      000021                         84 array_addr: .ds 2 ; address of @ array 
      000023                         85 array_size: .ds 2 ; array size 
      000025                         86 flags: .ds 1 ; boolean flags
      000026                         87 tab_width: .ds 1 ; print colon width (4)
      000027                         88 vars: .ds 2*26 ; BASIC variables A-Z, keep it as but last .
                                     89 ; keep as last variable 
      00005B                         90 free_ram: ; from here RAM free for BASIC text 
                                     91 
                                     92 ;-----------------------------------
                                     93     .area SSEG (ABS)
                                     94 ;-----------------------------------	
      001708                         95     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE ;-DSTACK_SIZE 
      001708                         96 tib: .ds TIB_SIZE             ; transaction input buffer
      001758                         97 pad: .ds PAD_SIZE             ; working buffer
                                     98 ;dstack: .ds DSTACK_SIZE 	  ; data stack used by FOR...NEXT 
                                     99 ;dstack_unf: ; dstack underflow ; data stack bottom 
      001780                        100 stack_full: .ds STACK_SIZE   ; control stack 
      001800                        101 stack_unf: ; stack underflow ; control_stack bottom 
                                    102 
                                    103 
                                    104 ;--------------------------------------
                                    105     .area HOME 
                                    106 ;--------------------------------------
                           000000   107     DEBUG=0
      008000 82 00 84 A3            108     int cold_start
                           000000   109 .if DEBUG
                                    110 	int TrapHandler 		;TRAP  software interrupt
                           000001   111 .else
      008004 82 00 80 80            112 	int NonHandledInterrupt ;TRAP  software interrupt
                                    113 .endif
      008008 82 00 80 80            114 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 80            115 	int NonHandledInterrupt ;int1 AWU   auto wake up from halt
      008010 82 00 80 80            116 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 80            117 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 80            118 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 80            119 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 80            120 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 8D            121 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 80            122 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 80            123 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 80            124 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 80            125 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 80            126 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 80            127 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 80            128 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 80            129 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 80            130 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 80            131 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 80 80            132 	int NonHandledInterrupt ;int18 UART1 RX full
      008054 82 00 80 80            133 	int NonHandledInterrupt ;int19 I2C 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      008058 82 00 80 80            134 	int NonHandledInterrupt ;int20 UART3 TX completed
      00805C 82 00 80 80            135 	int NonHandledInterrupt ;int21 UART3 RX full
      008060 82 00 80 80            136 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 81            137 	int Timer4UpdateHandler	;int23 TIM4 update/overflow used as msec ticks counter
      008068 82 00 80 80            138 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 80            139 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 80            140 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 80            141 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 80            142 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 80            143 	int NonHandledInterrupt ;int29  not used
                                    144 
                                    145 ;---------------------------------------
                                    146     .area CODE
                                    147 ;---------------------------------------
                           000000   148 .if DEBUG
                                    149 .asciz "VM1" ; I like to put module name here.
                                    150 .endif 
                                    151 
      008080                        152 NonHandledInterrupt:
      008080 71                     153     .byte 0x71  ; reinitialize MCU
                                    154 
                                    155 
                                    156 ;------------------------------------
                                    157 ; software interrupt handler  
                                    158 ;------------------------------------
                           000000   159 .if DEBUG 
                                    160 TrapHandler:
                                    161 	bset flags,#FTRAP 
                                    162 	call print_registers
                                    163 	call cmd_itf
                                    164 	bres flags,#FTRAP 	
                                    165 	iret
                                    166 .endif 
                                    167 
      008081                        168 Timer4UpdateHandler:
      008081 72 5F 53 42      [ 1]  169 	clr TIM4_SR 
      008085 CE 00 0C         [ 2]  170 	ldw x,ticks
      008088 5C               [ 1]  171 	incw x
      008089 CF 00 0C         [ 2]  172 	ldw ticks,x 
      00808C 80               [11]  173     iret 
                                    174 
                                    175 
                                    176 ;------------------------------------
                                    177 ; Triggered by pressing USER UserButton 
                                    178 ; on NUCLEO card.
                                    179 ;------------------------------------
      00808D                        180 UserButtonHandler:
                           000000   181 .if DEBUG
                                    182 ; wait button release
                                    183 	clrw x
                                    184 1$: decw x 
                                    185 	jrne 1$
                                    186 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    187 ; if MCU suspended by SLEEP resume program
                                    188     btjf flags,#FSLEEP,2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                                    189 	bres flags,#FSLEEP 
                                    190 	iret
                                    191 2$:	btjt flags,#FRUN,4$
                                    192 	jp 9$ 
                                    193 4$:	; program interrupted by user 
                                    194 	bres flags,#FRUN 
                                    195 	ldw x,#USER_ABORT
                                    196 	call puts 
                                    197 	ldw x,basicptr
                                    198 	ldw x,(x)
                                    199 ; print line number 
                                    200 	mov base,#10 
                                    201 	mov tab_width,#6
                                    202 	call print_int  	
                                    203 	ldw x,basicptr 
                                    204 	addw x,#3  
                                    205 	call puts 
                                    206 	ld a,#CR 
                                    207 	call putc
                                    208 	clrw x  
                                    209 	ld a,in 
                                    210 	add a,#3 ; adjustment for line number display 
                                    211 	ld xl,a 
                                    212 	call spaces 
                                    213 	ld a,#'^
                                    214 	call putc 
                                    215 9$:
                                    216     ldw x,#STACK_EMPTY 
                                    217     ldw sp,x
                                    218 	rim 
                                    219 	jp warm_start
                           000001   220 .else
      00808D 80               [11]  221     iret 
                                    222 .endif 
                                    223 
      00808E 0A 50 72 6F 67 72 61   224 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    225 
                                    226 
                                    227 ;----------------------------------------
                                    228 ; inialize MCU clock 
                                    229 ; input:
                                    230 ;   A 		source  HSI | 1 HSE 
                                    231 ;   XL      CLK_CKDIVR , clock divisor 
                                    232 ; output:
                                    233 ;   none 
                                    234 ;----------------------------------------
      0080A9                        235 clock_init:	
      0080A9 C1 50 C3         [ 1]  236 	cp a,CLK_CMSR 
      0080AC 27 0C            [ 1]  237 	jreq 2$ ; no switching required 
                                    238 ; select clock source 
      0080AE 72 12 50 C5      [ 1]  239 	bset CLK_SWCR,#CLK_SWCR_SWEN
      0080B2 C7 50 C4         [ 1]  240 	ld CLK_SWR,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      0080B5 C1 50 C3         [ 1]  241 1$:	cp a,CLK_CMSR
      0080B8 26 FB            [ 1]  242 	jrne 1$
      0080BA                        243 2$: 	
                                    244 ; HSI and cpu clock divisor 
      0080BA 9F               [ 1]  245 	ld a,xl 
      0080BB C7 50 C6         [ 1]  246 	ld CLK_CKDIVR,a  
      0080BE 81               [ 4]  247 	ret
                                    248 
                                    249 ;---------------------------------
                                    250 ; TIM4 is configured to generate an 
                                    251 ; interrupt every millisecond 
                                    252 ;----------------------------------
      0080BF                        253 timer4_init:
      0080BF 35 07 53 45      [ 1]  254 	mov TIM4_PSCR,#7 ; prescale 128  
      0080C3 35 7D 53 46      [ 1]  255 	mov TIM4_ARR,#125 ; set for 1msec.
      0080C7 35 05 53 40      [ 1]  256 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      0080CB 72 10 53 41      [ 1]  257 	bset TIM4_IER,#TIM4_IER_UIE 
      0080CF 81               [ 4]  258 	ret
                                    259 
                                    260 ;---------------------------------------------
                                    261 ;   UART3 subroutines
                                    262 ;---------------------------------------------
                                    263 
                                    264 ;---------------------------------------------
                                    265 ; initialize UART3, 115200 8N1
                                    266 ; input:
                                    267 ;	none
                                    268 ; output:
                                    269 ;   none
                                    270 ;---------------------------------------------
      0080D0                        271 uart3_init:
                                    272 	; configure tx pin
      0080D0 72 1A 50 11      [ 1]  273 	bset PD_DDR,#BIT5 ; tx pin
      0080D4 72 1A 50 12      [ 1]  274 	bset PD_CR1,#BIT5 ; push-pull output
      0080D8 72 1A 50 13      [ 1]  275 	bset PD_CR2,#BIT5 ; fast output
      0080DC                        276 uart3_set_baud: 
                                    277 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    278 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      0080DC A6 E1            [ 1]  279 	ld a,#CLK_SWR_HSI
      0080DE C1 50 C3         [ 1]  280 	cp a,CLK_CMSR 
      0080E1 27 0A            [ 1]  281 	jreq hsi_clock 
      0080E3                        282 hse_clock: ; 8 Mhz 	
      0080E3 35 05 52 43      [ 1]  283 	mov UART3_BRR2,#0x05 ; must be loaded first
      0080E7 35 04 52 42      [ 1]  284 	mov UART3_BRR1,#0x4
      0080EB 20 08            [ 2]  285 	jra uart_enable
      0080ED                        286 hsi_clock: ; 16 Mhz 	
      0080ED 35 0B 52 43      [ 1]  287 	mov UART3_BRR2,#0x0b ; must be loaded first
      0080F1 35 08 52 42      [ 1]  288 	mov UART3_BRR1,#0x08
      0080F5                        289 uart_enable:
      0080F5 72 5F 52 41      [ 1]  290     clr UART3_DR
      0080F9 35 0C 52 45      [ 1]  291 	mov UART3_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));
      0080FD 72 10 52 45      [ 1]  292 	bset UART3_CR2,#UART_CR2_SBK
      008101 72 0D 52 40 FB   [ 2]  293     btjf UART3_SR,#UART_SR_TC,.
      008106 81               [ 4]  294     ret
                                    295 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    296 ;---------------------------------
                                    297 ; send character to UART3 
                                    298 ; input:
                                    299 ;   A 
                                    300 ; output:
                                    301 ;   none 
                                    302 ;--------------------------------	
      008107                        303 putchar:
      008107 72 0F 52 40 FB   [ 2]  304     btjf UART3_SR,#UART_SR_TXE,.
      00810C C7 52 41         [ 1]  305 	ld UART3_DR,a 
      00810F 81               [ 4]  306 	ret  
                                    307 
                                    308 ;---------------------------------
                                    309 ; send .asciz to uart3
                                    310 ; input:
                                    311 ;   X       pointer to string
                                    312 ; output:
                                    313 ;   none:
                                    314 ;----------------------------------
      008110                        315 puts: 
      008110 F6               [ 1]  316     ld a,(x)
      008111 27 06            [ 1]  317     jreq 9$
      008113 CD 81 07         [ 4]  318     call putchar 
      008116 5C               [ 1]  319     incw x 
      008117 20 F7            [ 2]  320     jra puts
      008119 5C               [ 1]  321 9$: incw x 
      00811A 81               [ 4]  322     ret 
                                    323 
                                    324 
                                    325 ;---------------------------------
                                    326 ; wait character from UART3 
                                    327 ; input:
                                    328 ;   none
                                    329 ; output:
                                    330 ;   A 			char  
                                    331 ;--------------------------------	
      00811B                        332 getchar:
      00811B 72 0B 52 40 FB   [ 2]  333 	btjf UART3_SR,#UART_SR_RXNE,.
      008120 C6 52 41         [ 1]  334 	ld a,UART3_DR 
      008123 81               [ 4]  335     ret 
                                    336 
                                    337 ;---------------------------
                                    338 ; delete character at left 
                                    339 ; of cursor on terminal 
                                    340 ; input:
                                    341 ;   none 
                                    342 ; output:
                                    343 ;	none 
                                    344 ;---------------------------
      008124                        345 bksp:
      008124 A6 08            [ 1]  346 	ld a,#BSP 
      008126 CD 81 07         [ 4]  347 	call putchar 
      008129 A6 20            [ 1]  348 	ld a,#SPACE 
      00812B CD 81 07         [ 4]  349 	call putchar 
      00812E A6 08            [ 1]  350 	ld a,#BSP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      008130 CD 81 07         [ 4]  351 	call putchar 
      008133 81               [ 4]  352 	ret 
                                    353 
                                    354 ;----------------------------
                                    355 ; multiply 2 unsigned 16 bits integer 
                                    356 ; input:
                                    357 ;   U1     on stack 
                                    358 ;   U2     on stack 
                                    359 ; output:  
                                    360 ;   U1   overflow  
                                    361 ;   U2   product
                                    362 ;-----------------------------------
      008134                        363         _argofs 0 
                           000002     1     ARG_OFS=2+0 
      0000B4                        364         _arg U1 1 
                           000003     1     U1=ARG_OFS+1 
      0000B4                        365         _arg U2 3
                           000005     1     U2=ARG_OFS+3 
      0000B4                        366 mul16u:
      008134 72 5F 00 15      [ 1]  367     clr ptr16
      008138 7B 04            [ 1]  368     ld a,(U1+1,sp)
      00813A 1E 05            [ 2]  369     ldw x,(U2,sp)
      00813C 42               [ 4]  370     mul x,a 
      00813D CF 00 0A         [ 2]  371     ldw acc16,x
      008140 1E 05            [ 2]  372     ldw x,(U2,sp)
      008142 5E               [ 1]  373     swapw x 
      008143 42               [ 4]  374     mul x,a 
      008144 4F               [ 1]  375     clr a 
      008145 02               [ 1]  376     rlwa x
      008146 C7 00 16         [ 1]  377     ld ptr8,a 
      008149 72 BB 00 0A      [ 2]  378     addw x,acc16 
      00814D 24 04            [ 1]  379     jrnc 2$
      00814F 72 5C 00 16      [ 1]  380     inc ptr8 
      008153 CF 00 0A         [ 2]  381 2$: ldw acc16,x 
      008156 7B 03            [ 1]  382     ld a,(U1,sp)
      008158 1E 05            [ 2]  383     ldw x,(U2,sp)
      00815A 42               [ 4]  384     mul x,a 
      00815B 02               [ 1]  385     rlwa x 
      00815C CB 00 16         [ 1]  386     add a,ptr8 
      00815F 24 04            [ 1]  387     jrnc 4$
      008161 72 5C 00 15      [ 1]  388     inc ptr16 
      008165 C7 00 16         [ 1]  389 4$: ld ptr8,a 
      008168 72 BB 00 0A      [ 2]  390     addw x,acc16
      00816C 24 0A            [ 1]  391     jrnc 6$
      00816E 72 5C 00 16      [ 1]  392     inc ptr8 
      008172 24 04            [ 1]  393     jrnc 6$
      008174 72 5C 00 15      [ 1]  394     inc ptr16
      008178 7B 03            [ 1]  395 6$: ld a,(U1,sp)
      00817A 1E 05            [ 2]  396     ldw x,(U2,sp)
      00817C 5E               [ 1]  397     swapw x 
      00817D 42               [ 4]  398     mul x,a 
      00817E 72 BB 00 15      [ 2]  399     addw x,ptr16 
      008182 1F 03            [ 2]  400     ldw (U1,sp),x 
      008184 CE 00 0A         [ 2]  401     ldw x,acc16 
      008187 1F 05            [ 2]  402     ldw (U2,sp),x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      008189 81               [ 4]  403     ret 
                                    404 
                                    405 ;-----------------------------------
                                    406 ; print a 16 bit integer 
                                    407 ; using variable 'base' as conversion
                                    408 ; format.
                                    409 ; input:
                                    410 ;   X       integer to print 
                                    411 ;   base    conversion base 
                                    412 ; output:
                                    413 ;   none 
                                    414 ;-----------------------------------
                           000001   415 	SIGN=1
                           000002   416     YSAVE=2
                           000003   417 	VSIZE=3
      00818A                        418 print_int: 
      00010A                        419 	_vars VSIZE
      00818A 52 03            [ 2]    1     sub sp,#VSIZE 
      00818C 17 02            [ 2]  420     ldw (YSAVE,sp),y 
      00818E 0F 01            [ 1]  421 	clr (SIGN,sp)
      008190 90 AE 17 7F      [ 2]  422 	ldw y,#pad+PAD_SIZE-1 
      008194 90 7F            [ 1]  423 	clr (y)
      008196 C6 00 08         [ 1]  424 	ld a,base  
      008199 A1 0A            [ 1]  425 	cp a,#10 
      00819B 26 06            [ 1]  426 	jrne 1$ 
      00819D 5D               [ 2]  427 	tnzw x 
      00819E 2A 03            [ 1]  428 	jrpl 1$ 
      0081A0 03 01            [ 1]  429 	cpl (SIGN,sp)
      0081A2 50               [ 2]  430 	negw x 	 
      0081A3                        431 1$:	
      0081A3 C6 00 08         [ 1]  432 	ld a,base 
      0081A6 62               [ 2]  433 	div x,a 
      0081A7 AB 30            [ 1]  434 	add a,#'0 
      0081A9 A1 3A            [ 1]  435 	cp a,#'9+1 
      0081AB 2B 02            [ 1]  436 	jrmi 2$ 
      0081AD AB 07            [ 1]  437 	add a,#7 
      0081AF 90 5A            [ 2]  438 2$: decw y 
      0081B1 90 F7            [ 1]  439 	ld (y),a 
      0081B3 5D               [ 2]  440 	tnzw x 
      0081B4 26 ED            [ 1]  441 	jrne 1$ 
      0081B6 A6 10            [ 1]  442 	ld a,#16 
      0081B8 C1 00 08         [ 1]  443 	cp a,base 
      0081BB 26 08            [ 1]  444 	jrne 3$
      0081BD A6 24            [ 1]  445 	ld a,#'$
      0081BF 90 5A            [ 2]  446 	decw y  
      0081C1 90 F7            [ 1]  447 	ld (y),a
      0081C3 20 0A            [ 2]  448 	jra 9$ 
      0081C5 0D 01            [ 1]  449 3$: tnz (SIGN,sp)
      0081C7 27 06            [ 1]  450 	jreq 9$ 
      0081C9 A6 2D            [ 1]  451 	ld a,#'-
      0081CB 90 5A            [ 2]  452 	decw y  
      0081CD 90 F7            [ 1]  453 	ld (y),a
      0081CF                        454 9$:	
      0081CF AE 17 7F         [ 2]  455 	ldw x,#pad+PAD_SIZE-1
      0081D2 90 CF 00 0A      [ 2]  456     ldw acc16,y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      0081D6 72 B0 00 0A      [ 2]  457     subw x,acc16 
      0081DA                        458 10$:
      0081DA 90 5A            [ 2]  459 	decw y 
      0081DC A6 20            [ 1]  460 	ld a,#SPACE 
      0081DE 90 F7            [ 1]  461 	ld (y),a
      0081E0 5C               [ 1]  462 	incw x 
      0081E1 9F               [ 1]  463 	ld a,xl 
      0081E2 C1 00 26         [ 1]  464 	cp a,tab_width
      0081E5 2B F3            [ 1]  465 	jrmi 10$ 
      0081E7                        466 12$:
      0081E7 93               [ 1]  467     ldw x,y 
      0081E8 CD 81 10         [ 4]  468 	call puts 
      0081EB 16 02            [ 2]  469     ldw y,(YSAVE,sp) 
      00016D                        470 	_drop VSIZE 
      0081ED 5B 03            [ 2]    1     addw sp,#VSIZE 
      0081EF 81               [ 4]  471 	ret 
                                    472 
                                    473 
                                    474 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    475 ; VM code routine address
                                    476 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0081F0 82 58 82 84 82 94 82   477 bytecode: .word bye,subr,exit,exec,branch,zbranch,emit,key,qkey,dotq,delete
             99 82 A0 82 AC 82 7C
             82 62 82 6B 82 B7 82
             BE
      008206 82 CB 82 DA 82 E1 82   478         .word spaces,prtos,lit,litc,fetch,cfetch,store,cstore,rot,nrot
             EF 82 F9 83 01 83 0B
             83 1A 83 2A 83 3F
      00821A 83 54 83 59 83 5F 83   479         .word drop,dup,swap,over,neg,zlt,plus,minus,slash,mod,staru,star
             AB 83 B1 83 B9 83 70
             83 79 83 85 83 94 83
             A3 83 C6
      008232 83 F8 83 FF 84 06 84   480         .word decim,hexa,fticks,oneminus,oneplus,cellplus,lshift,rshift  
             0D 84 15 84 1D 84 27
             84 3B
      008242 84 4F 84 57 84 68 84   481         .word bit_not,bit_and,bit_or,bit_xor,pick,pause   
             79 84 8A 84 9B
                                    482 
                                    483 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    484 ;  bytecode interpreter 
                                    485 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00824E                        486 next: ; vm instruction fetch 
      00824E 90 F6            [ 1]  487     ld a,(y)
      008250 90 5C            [ 1]  488     incw y
      008252 5F               [ 1]  489     clrw x 
      008253 97               [ 1]  490     ld xl,a
      008254 DE 81 F0         [ 2]  491     ldw x,(bytecode,x) 
      008257 FC               [ 2]  492     jp (x)
                                    493 
                                    494 ; put mcu in lowest power mode 
                                    495 ; until reset 
      008258                        496 bye: ; { -- }
      008258 72 0D 52 40 FB   [ 2]  497     btjf UART3_SR,#UART_SR_TC,.
      00825D 9B               [ 1]  498     sim 
      00825E 8E               [10]  499     halt 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      00825F CC 84 A3         [ 2]  500     jp cold_start 
                                    501 
      008262                        502 key: ;{ -- c}
      008262 CD 81 1B         [ 4]  503     call getchar 
      008265 5F               [ 1]  504     clrw x 
      008266 97               [ 1]  505     ld xl,a 
      008267 89               [ 2]  506     pushw x 
      008268 CC 82 4E         [ 2]  507     jp next 
                                    508 
      00826B                        509 qkey: ; { -- 0| c 1 }
      00826B 5F               [ 1]  510     clrw x 
      00826C 89               [ 2]  511     pushw x 
      00826D 72 0B 52 40 DC   [ 2]  512     btjf UART3_SR,#UART_SR_RXNE,next
      008272 0C 02            [ 1]  513     inc (2,sp) 
      008274 C6 52 41         [ 1]  514     ld a,UART3_DR 
      008277 97               [ 1]  515     ld xl,a 
      008278 89               [ 2]  516     pushw x
      008279 CC 82 4E         [ 2]  517     jp next 
                                    518 
      00827C                        519 emit: ; { c -- }
      00827C 85               [ 2]  520     popw x 
      00827D 9F               [ 1]  521     ld a,xl 
      00827E CD 81 07         [ 4]  522     call putchar
      008281 CC 82 4E         [ 2]  523     jp next 
                                    524 
                                    525 ; vm subroutine call 
      008284                        526 subr: ; { -- }
      008284 90 F6            [ 1]  527     ld a,(y)
      008286 90 5C            [ 1]  528     incw y 
      008288 95               [ 1]  529     ld xh,a 
      008289 90 F6            [ 1]  530     ld a,(y)
      00828B 90 5C            [ 1]  531     incw y 
      00828D 97               [ 1]  532     ld xl,a 
      00828E 90 89            [ 2]  533     pushw y ;save return address 
      008290 51               [ 1]  534     exgw x,y ; x become new vm_pc 
      008291 CC 82 4E         [ 2]  535     jp next 
                                    536 
                                    537 
                                    538 ; return from vm subroutine
      008294                        539 exit: ; { addr -- }
      008294 90 85            [ 2]  540     popw y ; restore vm_pc
      008296 CC 82 4E         [ 2]  541     jp next 
                                    542 
                                    543 ; execute routine from stack 
      008299                        544 exec: ; { addr_sub -- addr_ret }
      008299 85               [ 2]  545     popw x 
      00829A 90 89            [ 2]  546     pushw y 
      00829C 51               [ 1]  547     exgw x,y 
      00829D CC 82 4E         [ 2]  548     jp next 
                                    549 
                                    550 ; unconditional jump 
      0082A0                        551 branch: ; { -- }
      0082A0 90 F6            [ 1]  552     ld a,(y)
      0082A2 90 5C            [ 1]  553     incw y 
      0082A4 95               [ 1]  554     ld xh,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      0082A5 90 F6            [ 1]  555     ld a,(y)
      0082A7 97               [ 1]  556     ld xl,a 
      0082A8 51               [ 1]  557     exgw x,y 
      0082A9 CC 82 4E         [ 2]  558     jp next 
                                    559 
                                    560 ; jump if TOS==0
      0082AC                        561 zbranch: ; { f -- }
      0082AC 85               [ 2]  562     popw x 
      0082AD 5D               [ 2]  563     tnzw x
      0082AE 27 F0            [ 1]  564     jreq branch
      0082B0 72 A9 00 02      [ 2]  565     addw y,#2 
      0082B4 CC 82 4E         [ 2]  566     jp next 
                                    567 
                                    568 
                                    569 ;-----------------------------
                                    570 ; send an ASCIZ string to UART3 
                                    571 ; input: 
                                    572 ;   TOS 		char * 
                                    573 ; output:
                                    574 ;   none 
                                    575 ;-------------------------------
      0082B7                        576 dotq: ; { .asciz -- }
      0082B7 85               [ 2]  577     popw x 
      0082B8 CD 81 10         [ 4]  578     call puts 
      0082BB CC 82 4E         [ 2]  579 	jp next  
                                    580 
                                    581 
                                    582 ;---------------------------
                                    583 ; delete n character left of cursor 
                                    584 ; at terminal.
                                    585 ; input: 
                                    586 ;   TOS   	number of characters to delete.
                                    587 ; output:
                                    588 ;    none 
                                    589 ;--------------------------	
      0082BE                        590 delete: ; { n -- }
      0082BE 85               [ 2]  591     popw x 
      0082BF 5D               [ 2]  592 	tnzw x
      0082C0 27 06            [ 1]  593 	jreq 1$
      0082C2 CD 81 24         [ 4]  594 0$:	call bksp 
      0082C5 5A               [ 2]  595 	decw x
      0082C6 26 FA            [ 1]  596 	jrne 0$
      0082C8 CC 82 4E         [ 2]  597 1$:	jp next 
                                    598 
                                    599 
                                    600 ;--------------------------
                                    601 ; print n spaces on terminal
                                    602 ; input:
                                    603 ;   TOS 	number of spaces 
                                    604 ; output:
                                    605 ;	none 
                                    606 ;---------------------------
      0082CB                        607 spaces: ; { n -- }
      0082CB 85               [ 2]  608     popw x 
      0082CC A6 20            [ 1]  609 	ld a,#SPACE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      0082CE 5D               [ 2]  610 	tnzw x
      0082CF 27 06            [ 1]  611 	jreq 9$
      0082D1 CD 81 07         [ 4]  612 1$:	call putchar  
      0082D4 5A               [ 2]  613 	decw x
      0082D5 26 FA            [ 1]  614 	jrne 1$
      0082D7                        615 9$: 
      0082D7 CC 82 4E         [ 2]  616 	jp next 
                                    617 
                                    618 ; print top of stack
                                    619 ; variables 'base' and 'tab_width'
                                    620 ; are used 
      0082DA                        621 prtos: ; { n -- }
      0082DA 85               [ 2]  622     popw x 
      0082DB CD 81 8A         [ 4]  623     call print_int
      0082DE CC 82 4E         [ 2]  624     jp next 
                                    625 
      0082E1                        626 lit: ; { -- n }
      0082E1 90 F6            [ 1]  627     ld a,(y)
      0082E3 90 5C            [ 1]  628     incw y 
      0082E5 95               [ 1]  629     ld xh,a 
      0082E6 90 F6            [ 1]  630     ld a,(y)
      0082E8 90 5C            [ 1]  631     incw y 
      0082EA 97               [ 1]  632     ld xl,a 
      0082EB 89               [ 2]  633     pushw x  
      0082EC CC 82 4E         [ 2]  634     jp next
                                    635 
      0082EF                        636 litc: ; { -- c }
      0082EF 90 F6            [ 1]  637     ld a,(y)
      0082F1 90 5C            [ 1]  638     incw y 
      0082F3 5F               [ 1]  639     clrw x 
      0082F4 97               [ 1]  640     ld xl,a 
      0082F5 89               [ 2]  641     pushw x 
      0082F6 CC 82 4E         [ 2]  642     jp next 
                                    643 
      0082F9                        644 fetch: ; { addr -- n}
      0082F9 1E 01            [ 2]  645     ldw x,(TOS,sp)
      0082FB FE               [ 2]  646     ldw x,(x)
      0082FC 1F 01            [ 2]  647     ldw (TOS,sp),x 
      0082FE CC 82 4E         [ 2]  648     jp next 
                                    649 
      008301                        650 cfetch: ; { addr -- c }
      008301 1E 01            [ 2]  651     ldw x,(TOS,sp)
      008303 F6               [ 1]  652     ld a,(x)
      008304 5F               [ 1]  653     clrw x 
      008305 97               [ 1]  654     ld xl,a 
      008306 1F 01            [ 2]  655     ldw (TOS,sp),x 
      008308 CC 82 4E         [ 2]  656     jp  next 
                                    657 
      00830B                        658 store: ; { addr n -- }
      00830B 1E 03            [ 2]  659     ldw x,(N,sp)
      00830D CF 00 15         [ 2]  660     ldw ptr16,x 
      008310 85               [ 2]  661     popw x 
      008311 72 CE 00 15      [ 5]  662     ldw x,[ptr16]
      000295                        663     _drop CELLL 
      008315 5B 02            [ 2]    1     addw sp,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      008317 CC 82 4E         [ 2]  664     jp next
                                    665 
      00831A                        666 cstore: ; { addr c -- }
      00831A 1E 03            [ 2]  667     ldw x,(N,sp)
      00831C CF 00 15         [ 2]  668     ldw ptr16,x 
      00831F 85               [ 2]  669     popw x 
      008320 9F               [ 1]  670     ld a,xl 
      008321 72 C7 00 15      [ 4]  671     ld [ptr16],a 
      0002A5                        672     _drop CELLL 
      008325 5B 02            [ 2]    1     addw sp,#CELLL 
      008327 CC 82 4E         [ 2]  673     jp next
                                    674 
      00832A                        675 rot: ;{ n1 n2 n3 -- n3 n1 n2 }
      00832A 1E 01            [ 2]  676     ldw x,(TOS,sp)
      00832C CF 00 0A         [ 2]  677     ldw acc16,x 
      00832F 1E 03            [ 2]  678     ldw x,(N,sp)
      008331 1F 01            [ 2]  679     ldw (TOS,sp),x
      008333 1E 05            [ 2]  680     ldw x,(5,sp)
      008335 1F 03            [ 2]  681     ldw (N,sp),x 
      008337 CE 00 0A         [ 2]  682     ldw x,acc16 
      00833A 1F 05            [ 2]  683     ldw (5,sp),x
      00833C CC 82 4E         [ 2]  684     jp next 
                                    685 
      00833F                        686 nrot: ; {n1 n2 n3 -- n2 n3 n1 }
      00833F 1E 05            [ 2]  687     ldw x,(5,sp)
      008341 CF 00 0A         [ 2]  688     ldw acc16,x 
      008344 1E 03            [ 2]  689     ldw x,(N,sp)
      008346 1F 05            [ 2]  690     ldw (5,sp),x
      008348 1E 01            [ 2]  691     ldw x,(TOS,sp)
      00834A 1F 03            [ 2]  692     ldw (N,sp),x
      00834C CE 00 0A         [ 2]  693     ldw x,acc16 
      00834F 1F 03            [ 2]  694     ldw (N,sp),x  
      008351 CC 82 4E         [ 2]  695     jp next 
                                    696 
      008354                        697 drop: 
      0002D4                        698     _drop CELLL
      008354 5B 02            [ 2]    1     addw sp,#CELLL 
      008356 CC 82 4E         [ 2]  699     jp next 
                                    700     
      008359                        701 dup: ; { n -- n n }
      008359 1E 01            [ 2]  702     ldw x,(TOS,sp)
      00835B 89               [ 2]  703     pushw x 
      00835C CC 82 4E         [ 2]  704     jp next 
                                    705 
      00835F                        706 swap: ; { n1 n2 -- n2 n1 }
      00835F 1E 01            [ 2]  707     ldw x,(TOS,sp)
      008361 CF 00 0A         [ 2]  708     ldw acc16,x 
      008364 1E 03            [ 2]  709     ldw x,(N,sp)
      008366 1F 01            [ 2]  710     ldw (TOS,sp),x
      008368 CE 00 0A         [ 2]  711     ldw x,acc16 
      00836B 1F 03            [ 2]  712     ldw (N,sp),x 
      00836D CC 82 4E         [ 2]  713     jp next 
                                    714 
      008370                        715 plus: ; { n1 n2 -- n1+n2 }
      008370 85               [ 2]  716     popw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      008371 72 FB 01         [ 2]  717     addw x,(TOS,sp)
      008374 1F 01            [ 2]  718     ldw (TOS,sp),x 
      008376 CC 82 4E         [ 2]  719     jp next
                                    720 
      008379                        721 minus: ; {n1 n2 -- n1-n2 }
      008379 1E 03            [ 2]  722     ldw x,(N,sp) 
      00837B 72 F0 01         [ 2]  723     subw x,(TOS,sp) 
      00837E 1F 03            [ 2]  724     ldw (N,sp),x 
      000300                        725     _drop CELLL
      008380 5B 02            [ 2]    1     addw sp,#CELLL 
      008382 CC 82 4E         [ 2]  726     jp next
                                    727 
      008385                        728 slash: ; {n1 n2 -- n1/n2}
      008385 1E 01            [ 2]  729     ldw x,(TOS,sp) ; n2 
      008387 17 01            [ 2]  730     ldw (TOS,sp),y 
      008389 51               [ 1]  731     exgw x,y 
      00838A 1E 03            [ 2]  732     ldw x,(N,sp) ; n1 
      00838C 65               [ 2]  733     divw x,y 
      00838D 1F 03            [ 2]  734     ldw (N,sp),x ; quotient
      00838F 90 85            [ 2]  735     popw y 
      008391 CC 82 4E         [ 2]  736     jp next 
                                    737 
      008394                        738 mod: ; { n1 n2 -- n1%n2}
      008394 1E 01            [ 2]  739     ldw x,(TOS,sp) ; n2 
      008396 17 01            [ 2]  740     ldw (TOS,sp),y 
      008398 51               [ 1]  741     exgw x,y 
      008399 1E 03            [ 2]  742     ldw x,(N,sp) ; n1 
      00839B 65               [ 2]  743     divw x,y 
      00839C 17 03            [ 2]  744     ldw (N,sp),y ; reste
      00839E 90 85            [ 2]  745     popw y 
      0083A0 CC 82 4E         [ 2]  746     jp next 
                                    747 
                                    748 ; unsigned multiply 
                                    749 ; overflow is discarded 
      0083A3                        750 staru: ; {u1 u2 -- u1*u2 }
      0083A3 CD 81 34         [ 4]  751     call mul16u 
      000326                        752     _drop CELLL ; discard overflow 
      0083A6 5B 02            [ 2]    1     addw sp,#CELLL 
      0083A8 CC 82 4E         [ 2]  753     jp next 
                                    754 
      0083AB                        755 over: ; { n1 n2 -- n1 n2 n1 }
      0083AB 1E 03            [ 2]  756     ldw x,(N,sp)
      0083AD 89               [ 2]  757     pushw x 
      0083AE CC 82 4E         [ 2]  758     jp next 
                                    759     
      0083B1                        760 neg: ;{ n -- -n}
      0083B1 1E 01            [ 2]  761     ldw x,(TOS,sp)
      0083B3 50               [ 2]  762     negw x 
      0083B4 1F 01            [ 2]  763     ldw (TOS,sp),x
      0083B6 CC 82 4E         [ 2]  764     jp next 
                                    765 
                                    766 ; n<0? 
      0083B9                        767 zlt: ; {n -- 0|1 }
      0083B9 5F               [ 1]  768     clrw x 
      0083BA 7B 01            [ 1]  769     ld a,(TOS,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      0083BC A5 80            [ 1]  770     bcp a,#0x80
      0083BE 27 01            [ 1]  771     jreq  1$
      0083C0 5C               [ 1]  772     incw x 
      0083C1 1F 01            [ 2]  773 1$: ldw (TOS,sp),x 
      0083C3 CC 82 4E         [ 2]  774     jp next 
                                    775 
                                    776  
      0083C6                        777 star: ; { n1 n2 -- n1*n2 }
      0083C6 1E 01            [ 2]  778     ldw x,(TOS,sp)
      0083C8 CF 00 0A         [ 2]  779     ldw acc16,x
      0083CB 1E 03            [ 2]  780     ldw x,(N,sp)
      0083CD CF 00 15         [ 2]  781     ldw ptr16,x 
      0083D0 5F               [ 1]  782     clrw x
      0083D1 1F 03            [ 2]  783     ldw (N,sp),x 
      0083D3 CE 00 15         [ 2]  784     ldw x,ptr16
      0083D6 2A 03            [ 1]  785     jrpl 1$
      0083D8 03 03            [ 1]  786     cpl (N,sp)
      0083DA 50               [ 2]  787     negw x 
      0083DB 1F 01            [ 2]  788 1$: ldw (TOS,sp),x
      0083DD CE 00 0A         [ 2]  789     ldw x,acc16 
      0083E0 2A 03            [ 1]  790     jrpl 2$
      0083E2 03 03            [ 1]  791     cpl (N,sp)
      0083E4 50               [ 2]  792     negw x 
      0083E5 89               [ 2]  793 2$: pushw x 
      0083E6 CD 81 34         [ 4]  794     call mul16u 
      000369                        795     _drop CELLL ; discard overflow
      0083E9 5B 02            [ 2]    1     addw sp,#CELLL 
      0083EB 85               [ 2]  796     popw x 
      0083EC 7B 01            [ 1]  797     ld a,(TOS,sp)
      0083EE A5 80            [ 1]  798     bcp a,#0x80 
      0083F0 27 01            [ 1]  799     jreq 4$
      0083F2 50               [ 2]  800     negw x 
      0083F3 1F 01            [ 2]  801 4$: ldw (TOS,sp),x 
      0083F5 CC 82 4E         [ 2]  802     jp next     
                                    803 
      0083F8                        804 decim:
      0083F8 35 0A 00 08      [ 1]  805     mov base,#10
      0083FC CC 82 4E         [ 2]  806     jp next 
                                    807 
      0083FF                        808 hexa:
      0083FF 35 10 00 08      [ 1]  809     mov base,#16
      008403 CC 82 4E         [ 2]  810     jp next 
                                    811 
      008406                        812 fticks: ; { -- n }
      008406 CE 00 0C         [ 2]  813     ldw x,ticks 
      008409 89               [ 2]  814     pushw x 
      00840A CC 82 4E         [ 2]  815     jp next 
                                    816 
      00840D                        817 oneminus: ; { n -- n-1 }
      00840D 1E 01            [ 2]  818     ldw x,(TOS,sp)
      00840F 5A               [ 2]  819     decw x 
      008410 1F 01            [ 2]  820     ldw (TOS,sp),x 
      008412 CC 82 4E         [ 2]  821     jp next 
                                    822 
      008415                        823 oneplus: ; { n -- n+1 }
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      008415 1E 01            [ 2]  824     ldw x,(TOS,sp)
      008417 5C               [ 1]  825     incw x 
      008418 1F 01            [ 2]  826     ldw (TOS,sp),x 
      00841A CC 82 4E         [ 2]  827     jp next 
                                    828     
      00841D                        829 cellplus: ; { n -- n+CELLL}
      00841D 1E 01            [ 2]  830     ldw x,(TOS,sp)
      00841F 1C 00 02         [ 2]  831     addw x,#CELLL  
      008422 1F 01            [ 2]  832     ldw (TOS,sp),x 
      008424 CC 82 4E         [ 2]  833     jp next 
                                    834 
      008427                        835 lshift: ; { n1 n2 -- n1<<n2 }
      008427 1E 03            [ 2]  836     ldw x,(3,sp)
      008429 0F 01            [ 1]  837     clr (1,sp) 
      00842B 0D 02            [ 1]  838     tnz (2,sp)
      00842D 27 05            [ 1]  839     jreq 4$
      00842F 58               [ 2]  840 2$: sllw x 
      008430 0A 02            [ 1]  841     dec (2,sp) 
      008432 26 FB            [ 1]  842     jrne 2$
      008434 1F 03            [ 2]  843 4$: ldw (3,sp),x 
      0003B6                        844     _drop 2 
      008436 5B 02            [ 2]    1     addw sp,#2 
      008438 CC 82 4E         [ 2]  845     jp next 
                                    846 
      00843B                        847 rshift: ; { n1 n2 -- n1<<n2 }
      00843B 1E 03            [ 2]  848     ldw x,(3,sp)
      00843D 0F 01            [ 1]  849     clr (1,sp) 
      00843F 0D 02            [ 1]  850     tnz (2,sp)
      008441 27 05            [ 1]  851     jreq 4$
      008443 54               [ 2]  852 2$: srlw x 
      008444 0A 02            [ 1]  853     dec (2,sp) 
      008446 26 FB            [ 1]  854     jrne 2$
      008448 1F 03            [ 2]  855 4$: ldw (3,sp),x 
      0003CA                        856     _drop CELLL
      00844A 5B 02            [ 2]    1     addw sp,#CELLL 
      00844C CC 82 4E         [ 2]  857     jp next 
                                    858 
      00844F                        859 bit_not: ; { n -- ~n }
      00844F 1E 01            [ 2]  860     ldw x,(TOS,sp)
      008451 53               [ 2]  861     cplw x 
      008452 1F 01            [ 2]  862     ldw (TOS,sp),x 
      008454 CC 82 4E         [ 2]  863     jp next 
                                    864 
      008457                        865 bit_and: ; { n1 n2 -- n1&n2 }
      008457 7B 01            [ 1]  866     ld a,(TOS,sp)
      008459 14 03            [ 1]  867     and a,(N,sp)
      00845B 6B 03            [ 1]  868     ld (N,sp),a 
      00845D 7B 02            [ 1]  869     ld a,(TOS+1,sp)
      00845F 14 04            [ 1]  870     and a,(N+1,sp)
      008461 6B 04            [ 1]  871     ld (N+1,sp),a 
      0003E3                        872     _drop CELLL 
      008463 5B 02            [ 2]    1     addw sp,#CELLL 
      008465 CC 82 4E         [ 2]  873     jp next 
                                    874 
      008468                        875 bit_or: ; {n1 n2 -- n1|n2 }
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      008468 7B 01            [ 1]  876     ld a,(TOS,sp)
      00846A 1A 03            [ 1]  877     or a,(N,sp)
      00846C 6B 03            [ 1]  878     ld (N,sp),a 
      00846E 7B 02            [ 1]  879     ld a,(TOS+1,sp)
      008470 1A 04            [ 1]  880     or a,(N+1,sp)
      008472 6B 04            [ 1]  881     ld (N+1,sp),a 
      0003F4                        882     _drop CELLL 
      008474 5B 02            [ 2]    1     addw sp,#CELLL 
      008476 CC 82 4E         [ 2]  883     jp next 
                                    884 
      008479                        885 bit_xor: ; {n1 n2 -- n1^n2 }
      008479 7B 01            [ 1]  886     ld a,(TOS,sp)
      00847B 18 03            [ 1]  887     xor a,(N,sp)
      00847D 6B 03            [ 1]  888     ld (N,sp),a 
      00847F 7B 02            [ 1]  889     ld a,(TOS+1,sp)
      008481 18 04            [ 1]  890     xor a,(N+1,sp)
      008483 6B 04            [ 1]  891     ld (N+1,sp),a 
      000405                        892     _drop CELLL 
      008485 5B 02            [ 2]    1     addw sp,#CELLL 
      008487 CC 82 4E         [ 2]  893     jp next 
                                    894 
                                    895 ; copy on TOS nth element 
      00848A                        896 pick: ; { x*i..N nth -- x*i..N xth }
      00848A 1E 01            [ 2]  897     ldw x,(1,sp) 
      00848C 58               [ 2]  898     sllw x 
      00848D 5C               [ 1]  899     incw x 
      00848E CF 00 0A         [ 2]  900     ldw acc16,x 
      008491 96               [ 1]  901     ldw x,sp 
      008492 72 DE 00 0A      [ 5]  902     ldw x,([acc16],x)  
      008496 1F 01            [ 2]  903     ldw (1,sp),x 
      008498 CC 82 4E         [ 2]  904     jp next 
                                    905 
                                    906 ; suspend execution for n msec
      00849B                        907 pause: ; { n -- }
      00849B 85               [ 2]  908     popw x 
      00849C 8F               [10]  909 1$: wfi 
      00849D 5A               [ 2]  910     decw x 
      00849E 26 FC            [ 1]  911     jrne 1$
      0084A0 CC 82 4E         [ 2]  912     jp next 
                                    913 
                                    914 
                                    915 ;-----------------------------
                                    916 ;  STARTUP CODE
                                    917 ;-----------------------------
                                    918 
      0084A3                        919 cold_start:
      0084A3 AE 17 FF         [ 2]  920     ldw x,#STACK_EMPTY
      0084A6 94               [ 1]  921     ldw sp,x
                                    922 ; clear all ram 
      0084A7 7F               [ 1]  923 0$: clr (x)
      0084A8 5A               [ 2]  924 	decw x 
      0084A9 26 FC            [ 1]  925 	jrne 0$
                                    926 ; activate pull up on all inputs 
      0084AB A6 FF            [ 1]  927 	ld a,#255 
      0084AD C7 50 03         [ 1]  928 	ld PA_CR1,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      0084B0 C7 50 08         [ 1]  929 	ld PB_CR1,a 
      0084B3 C7 50 0D         [ 1]  930 	ld PC_CR1,a 
      0084B6 C7 50 12         [ 1]  931 	ld PD_CR1,a 
      0084B9 C7 50 17         [ 1]  932 	ld PE_CR1,a 
      0084BC C7 50 1C         [ 1]  933 	ld PF_CR1,a 
      0084BF C7 50 21         [ 1]  934 	ld PG_CR1,a 
      0084C2 C7 50 2B         [ 1]  935 	ld PI_CR1,a 
                                    936 ; configure LD2 pin 
      0084C5 72 1A 50 0D      [ 1]  937     bset PC_CR1,#LED2_BIT
      0084C9 72 1A 50 0E      [ 1]  938     bset PC_CR2,#LED2_BIT
      0084CD 72 1A 50 0C      [ 1]  939     bset PC_DDR,#LED2_BIT
      0084D1 72 1A 50 0A      [ 1]  940     bset PC_ODR,#LED2_BIT 
                                    941 ; select internal clock no divisor: 16 Mhz 	
      0084D5 A6 E1            [ 1]  942 	ld a,#CLK_SWR_HSI 
      0084D7 5F               [ 1]  943 	clrw x  
      0084D8 CD 80 A9         [ 4]  944     call clock_init 
      0084DB CD 80 BF         [ 4]  945     call timer4_init 
                                    946 ; UART3 at 115200 BAUD
      0084DE CD 80 D0         [ 4]  947     call uart3_init
      0084E1 9A               [ 1]  948     rim 
      0084E2 35 0A 00 08      [ 1]  949     mov base,#10
      0084E6 35 04 00 26      [ 1]  950     mov tab_width,#4 
      0084EA 72 1B 50 0A      [ 1]  951     bres PC_ODR,#LED2_BIT 
      0084EE 90 AE 85 07      [ 2]  952     ldw y,#test 
      0084F2 CC 82 4E         [ 2]  953     jp next 
      0084F5                        954 warm: 
      0084F5 63 65 63 69 20 65 73   955 .asciz "ceci est un test\n"
             74 20 75 6E 20 74 65
             73 74 0A 00
      008507                        956 test:
      008507 1C 4F 0C 1C 4B 0C 1C   957     .byte LITC,'O',EMIT,LITC,'K',EMIT,LITC,CR,EMIT
             0D 0C
      008510 1A 85 07 1A 84 F5 38   958     .byte LIT,test>>8,test,LIT,warm>>8,warm,MINUS,PRTOS
             18
      008518 1A 00 3F 02 85 35 18   959     .byte LIT,0,0x3f,SUBR,square>>8,square,PRTOS
      00851F 1C 0D 0C 1A 84 F5 12   960     .byte LITC,CR,EMIT,LIT,warm>>8,warm,DOTQ
      008526 1C 09 1C 04 1C 02 1C   961     .byte LITC,9,LITC,4,LITC,2,LITC,2,PICK,LSHIFT,LITC,2,RSHIFT,PRTOS
             02 5A 4E 1C 02 50 18
      008534 00                     962     .byte BYE
                                    963 
      008535                        964 square:
      008535 2E 2C 40 2E 04         965     .byte SWAP,DUP,STAR,SWAP,EXIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
    ADC_CR1_=  000001     |     ADC_CR1_=  000004     |     ADC_CR1_=  000005 
    ADC_CR1_=  000006     |     ADC_CR2 =  005402     |     ADC_CR2_=  000003 
    ADC_CR2_=  000004     |     ADC_CR2_=  000005     |     ADC_CR2_=  000006 
    ADC_CR2_=  000001     |     ADC_CR3 =  005403     |     ADC_CR3_=  000007 
    ADC_CR3_=  000006     |     ADC_CSR =  005400     |     ADC_CSR_=  000006 
    ADC_CSR_=  000004     |     ADC_CSR_=  000000     |     ADC_CSR_=  000001 
    ADC_CSR_=  000002     |     ADC_CSR_=  000003     |     ADC_CSR_=  000007 
    ADC_CSR_=  000005     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |     AFR     =  004803 
    AFR0_ADC=  000000     |     AFR1_TIM=  000001     |     AFR2_CCO=  000002 
    AFR3_TIM=  000003     |     AFR4_TIM=  000004     |     AFR5_TIM=  000005 
    AFR6_I2C=  000006     |     AFR7_BEE=  000007     |     AND     =  000054 
    ARG_OFS =  000002     |     AWU_APR =  0050F1     |     AWU_CSR =  0050F0 
    AWU_TBR =  0050F2     |     B0_MASK =  000001     |     B115200 =  000006 
    B19200  =  000003     |     B1_MASK =  000002     |     B230400 =  000007 
    B2400   =  000000     |     B2_MASK =  000004     |     B38400  =  000004 
    B3_MASK =  000008     |     B460800 =  000008     |     B4800   =  000001 
    B4_MASK =  000010     |     B57600  =  000005     |     B5_MASK =  000020 
    B6_MASK =  000040     |     B7_MASK =  000080     |     B921600 =  000009 
    B9600   =  000002     |     BEEP_BIT=  000004     |     BEEP_CSR=  0050F3 
    BEEP_MAS=  000010     |     BEEP_POR=  00000F     |     BELL    =  000007 
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |     BRANCH  =  000008 
    BSP     =  000008     |     BYE     =  000000     |     CAN_DGR =  005426 
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
    CELLL   =  000002     |     CELLPLUS=  00004C     |     CFETCH  =  000020 
    CFG_GCR =  007F60     |     CFG_GCR_=  000001     |     CFG_GCR_=  000000 
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
    CLK_PCKE=  000003     |     CLK_PCKE=  0050CA     |     CLK_PCKE=  000003 
    CLK_PCKE=  000002     |     CLK_PCKE=  000007     |     CLK_SWCR=  0050C5 
    CLK_SWCR=  000000     |     CLK_SWCR=  000001     |     CLK_SWCR=  000002 
    CLK_SWCR=  000003     |     CLK_SWIM=  0050CD     |     CLK_SWR =  0050C4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]

Symbol Table

    CLK_SWR_=  0000B4     |     CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2 
    COMMA   =  00002C     |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
    CR      =  00000D     |     CSTORE  =  000024     |     CTRL_A  =  000001 
    CTRL_B  =  000002     |     CTRL_C  =  000003     |     CTRL_D  =  000004 
    CTRL_E  =  000005     |     CTRL_F  =  000006     |     CTRL_G  =  000007 
    CTRL_H  =  000008     |     CTRL_I  =  000009     |     CTRL_J  =  00000A 
    CTRL_K  =  00000B     |     CTRL_L  =  00000C     |     CTRL_M  =  00000D 
    CTRL_N  =  00000E     |     CTRL_O  =  00000F     |     CTRL_P  =  000010 
    CTRL_Q  =  000011     |     CTRL_R  =  000012     |     CTRL_S  =  000013 
    CTRL_T  =  000014     |     CTRL_U  =  000015     |     CTRL_V  =  000016 
    CTRL_W  =  000017     |     CTRL_X  =  000018     |     CTRL_Y  =  000019 
    CTRL_Z  =  00001A     |     DEBUG   =  000000     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |     DECIM   =  000042     |     DELETE  =  000014 
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |     DOTQ    =  000012     |     DROP    =  00002A 
    DUP     =  00002C     |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_S=  000800     |     EMIT    =  00000C     |     ESC     =  00001B 
    EXEC    =  000006     |     EXIT    =  000004     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FBREAK  =  000004     |     FCOMP   =  000005 
    FETCH   =  00001E     |     FF      =  00000C     |     FFOR    =  000002 
    FHSE    =  7A1200     |     FHSI    =  F42400     |     FLASH_BA=  008000 
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
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |     FLSI    =  01F400 
    FRUN    =  000000     |     FSLEEP  =  000003     |     FTRAP   =  000001 
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |     HEXA    =  000044     |     HSECNT  =  004809 
    I2C_CCRH=  00521C     |     I2C_CCRH=  000080     |     I2C_CCRH=  0000C0 
    I2C_CCRH=  000080     |     I2C_CCRH=  000000     |     I2C_CCRH=  000001 
    I2C_CCRH=  000000     |     I2C_CCRL=  00521B     |     I2C_CCRL=  00001A 
    I2C_CCRL=  000002     |     I2C_CCRL=  00000D     |     I2C_CCRL=  000050 
    I2C_CCRL=  000090     |     I2C_CCRL=  0000A0     |     I2C_CR1 =  005210 
    I2C_CR1_=  000006     |     I2C_CR1_=  000007     |     I2C_CR1_=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]

Symbol Table

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
    INT_VECT=  00805C     |     INT_VECT=  008058     |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |     KEY     =  00000E     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LIT     =  00001A 
    LITC    =  00001C     |     LSHIFT  =  00004E     |     MINUS   =  000038 
    MOD     =  00003C     |     N       =  000003     |     NAFR    =  004804 
    NCLKOPT =  004808     |     NEG     =  000032     |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NL      =  00000A     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |     NOT     =  000052     |     NROT    =  000028 
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  5 NonHandl   000000 R   |     ONEMINUS=  000048     |     ONEPLUS =  00004A 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]

Symbol Table

    OR      =  000056     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVER    =  000030 
    PA      =  000000     |     PAD_SIZE=  000028     |     PAUSE   =  00005C 
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |     PICK    =  00005A 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
    PLUS    =  000036     |     PRTOS   =  000018     |     QKEY    =  000010 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
    ROP     =  004800     |     ROT     =  000026     |     RSHIFT  =  000050 
    RST_SR  =  0050B3     |     SFR_BASE=  005000     |     SFR_END =  0057FF 
    SHARP   =  000023     |     SIGN    =  000001     |     SLASH   =  00003A 
    SPACE   =  000020     |     SPACES  =  000016     |     SPI_CR1 =  005200 
    SPI_CR2 =  005201     |     SPI_CRCP=  005205     |     SPI_DR  =  005204 
    SPI_ICR =  005202     |     SPI_RXCR=  005206     |     SPI_SR  =  005203 
    SPI_TXCR=  005207     |     STACK_EM=  0017FF     |     STACK_SI=  000080 
    STAR    =  000040     |     STARU   =  00003E     |     STORE   =  000022 
    SUBR    =  000002     |     SWAP    =  00002E     |     SWIM_CSR=  007F80 
    TAB     =  000009     |     TIB_SIZE=  000050     |     TICK    =  000027 
    TICKS   =  000046     |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]

Symbol Table

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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]

Symbol Table

    TIM_CR1_=  000002     |     TOS     =  000001     |   5 Timer4Up   000001 R
    U1      =  000003     |     U2      =  000005     |     UART1   =  000000 
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
    UBC     =  004801     |   5 USER_ABO   00000E R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |   5 UserButt   00000D R
    VSIZE   =  000003     |     VT      =  00000B     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XOR     =  000058     |     YSAVE   =  000002     |     ZBRANCH =  00000A 
    ZLT     =  000034     |   1 acc16      000009 R   |   1 acc24      000008 R
  1 acc8       00000A R   |   1 array_ad   000020 R   |   1 array_si   000022 R
  1 base       000007 R   |   1 basicptr   000003 R   |   5 bit_and    0003D7 R
  5 bit_not    0003CF R   |   5 bit_or     0003E8 R   |   5 bit_xor    0003F9 R
  5 bksp       0000A4 R   |   5 branch     000220 R   |   5 bye        0001D8 R
  5 bytecode   000170 R   |   5 cellplus   00039D R   |   5 cfetch     000281 R
  5 clock_in   000029 R   |   5 cold_sta   000423 R   |   1 count      000002 R
  5 cstore     00029A R   |   5 decim      000378 R   |   5 delete     00023E R
  5 dotq       000237 R   |   5 drop       0002D4 R   |   1 dstkptr    000019 R
  5 dup        0002D9 R   |   5 emit       0001FC R   |   5 exec       000219 R
  5 exit       000214 R   |   1 farptr     000013 R   |   5 fetch      000279 R
  1 ffree      000016 R   |   1 flags      000024 R   |   1 free_ram   00005A R
  5 fticks     000386 R   |   5 getchar    00009B R   |   5 hexa       00037F R
  5 hse_cloc   000063 R   |   5 hsi_cloc   00006D R   |   1 in         000001 R
  1 in.w       000000 R   |   1 in.w.sav   000011 R   |   5 key        0001E2 R
  1 lineno     000005 R   |   5 lit        000261 R   |   5 litc       00026F R
  1 loop_dep   00001F R   |   5 lshift     0003A7 R   |   5 minus      0002F9 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]

Symbol Table

  5 mod        000314 R   |   5 mul16u     0000B4 R   |   5 neg        000331 R
  5 next       0001CE R   |   5 nrot       0002BF R   |   5 oneminus   00038D R
  5 oneplus    000395 R   |   5 over       00032B R   |   3 pad        001758 R
  5 pause      00041B R   |   5 pick       00040A R   |   5 plus       0002F0 R
  5 print_in   00010A R   |   5 prtos      00025A R   |   1 ptr16      000014 R
  1 ptr8       000015 R   |   5 putchar    000087 R   |   5 puts       000090 R
  5 qkey       0001EB R   |   5 rot        0002AA R   |   5 rshift     0003BB R
  1 seedx      00000D R   |   1 seedy      00000F R   |   5 slash      000305 R
  5 spaces     00024B R   |   5 square     0004B5 R   |   3 stack_fu   001780 R
  3 stack_un   001800 R   |   5 star       000346 R   |   5 staru      000323 R
  5 store      00028B R   |   5 subr       000204 R   |   5 swap       0002DF R
  1 tab_widt   000025 R   |   5 test       000487 R   |   3 tib        001708 R
  1 ticks      00000B R   |   5 timer4_i   00003F R   |   1 txtbgn     00001B R
  1 txtend     00001D R   |   5 uart3_in   000050 R   |   5 uart3_se   00005C R
  5 uart_ena   000075 R   |   1 vars       000026 R   |   5 warm       000475 R
  5 zbranch    00022C R   |   5 zlt        000339 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     5A   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size     F8   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size    4BA   flags    0

