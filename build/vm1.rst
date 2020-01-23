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
                           0000C0    54 	STACK_SIZE= 192 ;128
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
      000009                         69 tos: .blkw 1 ; top of stack element 
      00000B                         70 acc24: .blkb 1 ; 24 accumulator
      00000C                         71 acc16: .blkb 1
      00000D                         72 acc8:  .blkb 1
      00000E                         73 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
      000010                         74 seedx: .blkw 1  ; xorshift 16 seed x 
      000012                         75 seedy: .blkw 1  ; xorshift 16 seed y 
      000014                         76 in.w.saved: .blkw 1 ; set by get_token before parsing next token, used by unget_token
      000016                         77 farptr: .blkb 1 ; far pointer used by file system
      000017                         78 ptr16:  .blkb 1 ; middle byte of farptr
      000018                         79 ptr8:   .blkb 1 ; least byte of farptr 
      000019                         80 ffree: .blkb 3 ; flash free address ; file system free space pointer
      00001C                         81 dstkptr: .blkw 1  ; data stack pointer 
      00001E                         82 txtbgn: .ds 2 ; BASIC text beginning address 
      000020                         83 txtend: .ds 2 ; BASIC text end address 
      000022                         84 loop_depth: .ds 1 ; FOR loop depth, level of nested loop.  
      000023                         85 array_addr: .ds 2 ; address of @ array 
      000025                         86 array_size: .ds 2 ; array size 
      000027                         87 flags: .ds 1 ; boolean flags
      000028                         88 tab_width: .ds 1 ; print colon width (4)
      000029                         89 vars: .ds 2*26 ; BASIC variables A-Z, keep it as but last .
                                     90 ; keep as last variable 
      00005D                         91 free_ram: ; from here RAM free for BASIC text 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



                                     92 
                                     93 ;-----------------------------------
                                     94     .area SSEG (ABS)
                                     95 ;-----------------------------------	
      0016C8                         96     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE ;-DSTACK_SIZE 
      0016C8                         97 tib: .ds TIB_SIZE             ; transaction input buffer
      001718                         98 pad: .ds PAD_SIZE             ; working buffer
                                     99 ;dstack: .ds DSTACK_SIZE 	  ; data stack used by FOR...NEXT 
                                    100 ;dstack_unf: ; dstack underflow ; data stack bottom 
      001740                        101 stack_full: .ds STACK_SIZE   ; control stack 
      001800                        102 stack_unf: ; stack underflow ; control_stack bottom 
                                    103 
                                    104 
                                    105 ;--------------------------------------
                                    106     .area HOME 
                                    107 ;--------------------------------------
                           000000   108     DEBUG=0
      008000 82 00 83 EF            109     int cold_start
                           000000   110 .if DEBUG
                                    111 	int TrapHandler 		;TRAP  software interrupt
                           000001   112 .else
      008004 82 00 80 80            113 	int NonHandledInterrupt ;TRAP  software interrupt
                                    114 .endif
      008008 82 00 80 80            115 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 80            116 	int NonHandledInterrupt ;int1 AWU   auto wake up from halt
      008010 82 00 80 80            117 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 80            118 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 80            119 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 80            120 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 80            121 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 8D            122 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 80            123 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 80            124 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 80            125 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 80            126 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 80            127 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 80            128 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 80            129 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 80            130 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 80            131 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 80            132 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 80 80            133 	int NonHandledInterrupt ;int18 UART1 RX full
      008054 82 00 80 80            134 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 80            135 	int NonHandledInterrupt ;int20 UART3 TX completed
      00805C 82 00 80 80            136 	int NonHandledInterrupt ;int21 UART3 RX full
      008060 82 00 80 80            137 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 81            138 	int Timer4UpdateHandler	;int23 TIM4 update/overflow used as msec ticks counter
      008068 82 00 80 80            139 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 80            140 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 80            141 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 80            142 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 80            143 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 80            144 	int NonHandledInterrupt ;int29  not used
                                    145 
                                    146 ;---------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



                                    147     .area CODE
                                    148 ;---------------------------------------
                           000000   149 .if DEBUG
                                    150 .asciz "VM1" ; I like to put module name here.
                                    151 .endif 
                                    152 
      008080                        153 NonHandledInterrupt:
      008080 71                     154     .byte 0x71  ; reinitialize MCU
                                    155 
                                    156 
                                    157 ;------------------------------------
                                    158 ; software interrupt handler  
                                    159 ;------------------------------------
                           000000   160 .if DEBUG 
                                    161 TrapHandler:
                                    162 	bset flags,#FTRAP 
                                    163 	call print_registers
                                    164 	call cmd_itf
                                    165 	bres flags,#FTRAP 	
                                    166 	iret
                                    167 .endif 
                                    168 
      008081                        169 Timer4UpdateHandler:
      008081 72 5F 53 42      [ 1]  170 	clr TIM4_SR 
      008085 CE 00 0E         [ 2]  171 	ldw x,ticks
      008088 5C               [ 1]  172 	incw x
      008089 CF 00 0E         [ 2]  173 	ldw ticks,x 
      00808C 80               [11]  174 	iret 
                                    175 
                                    176 
                                    177 ;------------------------------------
                                    178 ; Triggered by pressing USER UserButton 
                                    179 ; on NUCLEO card.
                                    180 ;------------------------------------
      00808D                        181 UserButtonHandler:
                           000000   182 .if DEBUG
                                    183 ; wait button release
                                    184 	clrw x
                                    185 1$: decw x 
                                    186 	jrne 1$
                                    187 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    188 ; if MCU suspended by SLEEP resume program
                                    189     btjf flags,#FSLEEP,2$
                                    190 	bres flags,#FSLEEP 
                                    191 	iret
                                    192 2$:	btjt flags,#FRUN,4$
                                    193 	jp 9$ 
                                    194 4$:	; program interrupted by user 
                                    195 	bres flags,#FRUN 
                                    196 	ldw x,#USER_ABORT
                                    197 	call puts 
                                    198 	ldw x,basicptr
                                    199 	ldw x,(x)
                                    200 ; print line number 
                                    201 	mov base,#10 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                                    202 	mov tab_width,#6
                                    203 	call print_int  	
                                    204 	ldw x,basicptr 
                                    205 	addw x,#3  
                                    206 	call puts 
                                    207 	ld a,#CR 
                                    208 	call putc
                                    209 	clrw x  
                                    210 	ld a,in 
                                    211 	add a,#3 ; adjustment for line number display 
                                    212 	ld xl,a 
                                    213 	call spaces 
                                    214 	ld a,#'^
                                    215 	call putc 
                                    216 9$:
                                    217     ldw x,#STACK_EMPTY 
                                    218     ldw sp,x
                                    219 	rim 
                                    220 	jp warm_start
                           000001   221 .else
      00808D 80               [11]  222     iret 
                                    223 .endif 
                                    224 
      00808E 0A 50 72 6F 67 72 61   225 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    226 
                                    227 
                                    228 ;----------------------------------------
                                    229 ; inialize MCU clock 
                                    230 ; input:
                                    231 ;   A 		source  HSI | 1 HSE 
                                    232 ;   XL      CLK_CKDIVR , clock divisor 
                                    233 ; output:
                                    234 ;   none 
                                    235 ;----------------------------------------
      0080A9                        236 clock_init:	
      0080A9 C1 50 C3         [ 1]  237 	cp a,CLK_CMSR 
      0080AC 27 0C            [ 1]  238 	jreq 2$ ; no switching required 
                                    239 ; select clock source 
      0080AE 72 12 50 C5      [ 1]  240 	bset CLK_SWCR,#CLK_SWCR_SWEN
      0080B2 C7 50 C4         [ 1]  241 	ld CLK_SWR,a
      0080B5 C1 50 C3         [ 1]  242 1$:	cp a,CLK_CMSR
      0080B8 26 FB            [ 1]  243 	jrne 1$
      0080BA                        244 2$: 	
                                    245 ; HSI and cpu clock divisor 
      0080BA 9F               [ 1]  246 	ld a,xl 
      0080BB C7 50 C6         [ 1]  247 	ld CLK_CKDIVR,a  
      0080BE 81               [ 4]  248 	ret
                                    249 
                                    250 ;---------------------------------
                                    251 ; TIM4 is configured to generate an 
                                    252 ; interrupt every millisecond 
                                    253 ;----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      0080BF                        254 timer4_init:
      0080BF 35 07 53 45      [ 1]  255 	mov TIM4_PSCR,#7 ; prescale 128  
      0080C3 35 7D 53 46      [ 1]  256 	mov TIM4_ARR,#125 ; set for 1msec.
      0080C7 35 05 53 40      [ 1]  257 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      0080CB 72 10 53 41      [ 1]  258 	bset TIM4_IER,#TIM4_IER_UIE 
      0080CF 81               [ 4]  259 	ret
                                    260 
                                    261 ;---------------------------------------------
                                    262 ;   UART3 subroutines
                                    263 ;---------------------------------------------
                                    264 
                                    265 ;---------------------------------------------
                                    266 ; initialize UART3, 115200 8N1
                                    267 ; input:
                                    268 ;	none
                                    269 ; output:
                                    270 ;   none
                                    271 ;---------------------------------------------
      0080D0                        272 uart3_init:
                                    273 	; configure tx pin
      0080D0 72 1A 50 11      [ 1]  274 	bset PD_DDR,#BIT5 ; tx pin
      0080D4 72 1A 50 12      [ 1]  275 	bset PD_CR1,#BIT5 ; push-pull output
      0080D8 72 1A 50 13      [ 1]  276 	bset PD_CR2,#BIT5 ; fast output
      0080DC                        277 uart3_set_baud: 
                                    278 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    279 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      0080DC A6 E1            [ 1]  280 	ld a,#CLK_SWR_HSI
      0080DE C1 50 C3         [ 1]  281 	cp a,CLK_CMSR 
      0080E1 27 0A            [ 1]  282 	jreq hsi_clock 
      0080E3                        283 hse_clock: ; 8 Mhz 	
      0080E3 35 05 52 43      [ 1]  284 	mov UART3_BRR2,#0x05 ; must be loaded first
      0080E7 35 04 52 42      [ 1]  285 	mov UART3_BRR1,#0x4
      0080EB 20 08            [ 2]  286 	jra uart_enable
      0080ED                        287 hsi_clock: ; 16 Mhz 	
      0080ED 35 0B 52 43      [ 1]  288 	mov UART3_BRR2,#0x0b ; must be loaded first
      0080F1 35 08 52 42      [ 1]  289 	mov UART3_BRR1,#0x08
      0080F5                        290 uart_enable:
      0080F5 72 5F 52 41      [ 1]  291     clr UART3_DR
      0080F9 35 0C 52 45      [ 1]  292 	mov UART3_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));
      0080FD 72 10 52 45      [ 1]  293 	bset UART3_CR2,#UART_CR2_SBK
      008101 72 0D 52 40 FB   [ 2]  294     btjf UART3_SR,#UART_SR_TC,.
      008106 81               [ 4]  295     ret
                                    296 	
                                    297 ;---------------------------------
                                    298 ; send character to UART3 
                                    299 ; input:
                                    300 ;   A 
                                    301 ; output:
                                    302 ;   none 
                                    303 ;--------------------------------	
      008107                        304 putchar:
      008107 72 0F 52 40 FB   [ 2]  305     btjf UART3_SR,#UART_SR_TXE,.
      00810C C7 52 41         [ 1]  306 	ld UART3_DR,a 
      00810F 81               [ 4]  307 	ret  
                                    308 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    309 ;---------------------------------
                                    310 ; send .asciz to uart3
                                    311 ; input:
                                    312 ;   X       pointer to string
                                    313 ; output:
                                    314 ;   none:
                                    315 ;----------------------------------
      008110                        316 puts: 
      008110 F6               [ 1]  317     ld a,(x)
      008111 27 06            [ 1]  318     jreq 9$
      008113 CD 81 07         [ 4]  319     call putchar 
      008116 5C               [ 1]  320     incw x 
      008117 20 F7            [ 2]  321     jra puts
      008119 5C               [ 1]  322 9$: incw x 
      00811A 81               [ 4]  323     ret 
                                    324 
                                    325 
                                    326 ;---------------------------------
                                    327 ; wait character from UART3 
                                    328 ; input:
                                    329 ;   none
                                    330 ; output:
                                    331 ;   A 			char  
                                    332 ;--------------------------------	
      00811B                        333 getchar:
      00811B 72 0B 52 40 FB   [ 2]  334 	btjf UART3_SR,#UART_SR_RXNE,.
      008120 C6 52 41         [ 1]  335 	ld a,UART3_DR 
      008123 81               [ 4]  336     ret 
                                    337 
                                    338 ;---------------------------
                                    339 ; delete character at left 
                                    340 ; of cursor on terminal 
                                    341 ; input:
                                    342 ;   none 
                                    343 ; output:
                                    344 ;	none 
                                    345 ;---------------------------
      008124                        346 bksp:
      008124 A6 08            [ 1]  347 	ld a,#BSP 
      008126 CD 81 07         [ 4]  348 	call putchar 
      008129 A6 20            [ 1]  349 	ld a,#SPACE 
      00812B CD 81 07         [ 4]  350 	call putchar 
      00812E A6 08            [ 1]  351 	ld a,#BSP 
      008130 CD 81 07         [ 4]  352 	call putchar 
      008133 81               [ 4]  353 	ret 
                                    354 
                                    355 ;----------------------------
                                    356 ; multiply 2 unsigned 16 bits integer 
                                    357 ; input:
                                    358 ;   U1     on stack 
                                    359 ;   U2     on stack 
                                    360 ; output:  
                                    361 ;   U1   overflow  
                                    362 ;   U2   product
                                    363 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      008134                        364         _argofs 0 
                           000002     1     ARG_OFS=2+0 
      0000B4                        365         _arg U1 1 
                           000003     1     U1=ARG_OFS+1 
      0000B4                        366         _arg U2 3
                           000005     1     U2=ARG_OFS+3 
      0000B4                        367 mul16u:
      008134 72 5F 00 17      [ 1]  368     clr ptr16
      008138 7B 04            [ 1]  369     ld a,(U1+1,sp)
      00813A 1E 05            [ 2]  370     ldw x,(U2,sp)
      00813C 42               [ 4]  371     mul x,a 
      00813D CF 00 0C         [ 2]  372     ldw acc16,x
      008140 1E 05            [ 2]  373     ldw x,(U2,sp)
      008142 5E               [ 1]  374     swapw x 
      008143 42               [ 4]  375     mul x,a 
      008144 4F               [ 1]  376     clr a 
      008145 02               [ 1]  377     rlwa x
      008146 C7 00 18         [ 1]  378     ld ptr8,a 
      008149 72 BB 00 0C      [ 2]  379     addw x,acc16 
      00814D 24 04            [ 1]  380     jrnc 2$
      00814F 72 5C 00 18      [ 1]  381     inc ptr8 
      008153 CF 00 0C         [ 2]  382 2$: ldw acc16,x 
      008156 7B 03            [ 1]  383     ld a,(U1,sp)
      008158 1E 05            [ 2]  384     ldw x,(U2,sp)
      00815A 42               [ 4]  385     mul x,a 
      00815B 02               [ 1]  386     rlwa x 
      00815C CB 00 18         [ 1]  387     add a,ptr8 
      00815F 24 04            [ 1]  388     jrnc 4$
      008161 72 5C 00 17      [ 1]  389     inc ptr16 
      008165 C7 00 18         [ 1]  390 4$: ld ptr8,a 
      008168 72 BB 00 0C      [ 2]  391     addw x,acc16
      00816C 24 0A            [ 1]  392     jrnc 6$
      00816E 72 5C 00 18      [ 1]  393     inc ptr8 
      008172 24 04            [ 1]  394     jrnc 6$
      008174 72 5C 00 17      [ 1]  395     inc ptr16
      008178 7B 03            [ 1]  396 6$: ld a,(U1,sp)
      00817A 1E 05            [ 2]  397     ldw x,(U2,sp)
      00817C 5E               [ 1]  398     swapw x 
      00817D 42               [ 4]  399     mul x,a 
      00817E 72 BB 00 17      [ 2]  400     addw x,ptr16 
      008182 1F 03            [ 2]  401     ldw (U1,sp),x 
      008184 CE 00 0C         [ 2]  402     ldw x,acc16 
      008187 1F 05            [ 2]  403     ldw (U2,sp),x
      008189 81               [ 4]  404     ret 
                                    405 
                                    406 ;-----------------------------------
                                    407 ; print a 16 bit integer 
                                    408 ; using variable 'base' as conversion
                                    409 ; format.
                                    410 ; input:
                                    411 ;   X       integer to print 
                                    412 ;   base    conversion base 
                                    413 ; output:
                                    414 ;   none 
                                    415 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                           000001   416 	SIGN=1
                           000002   417     YSAVE=2
                           000003   418 	VSIZE=3
      00818A                        419 print_int: 
      00010A                        420 	_vars VSIZE
      00818A 52 03            [ 2]    1     sub sp,#VSIZE 
      00818C 17 02            [ 2]  421     ldw (YSAVE,sp),y 
      00818E 0F 01            [ 1]  422 	clr (SIGN,sp)
      008190 90 AE 17 3F      [ 2]  423 	ldw y,#pad+PAD_SIZE-1 
      008194 90 7F            [ 1]  424 	clr (y)
      008196 C6 00 08         [ 1]  425 	ld a,base  
      008199 A1 0A            [ 1]  426 	cp a,#10 
      00819B 26 06            [ 1]  427 	jrne 1$ 
      00819D 5D               [ 2]  428 	tnzw x 
      00819E 2A 03            [ 1]  429 	jrpl 1$ 
      0081A0 03 01            [ 1]  430 	cpl (SIGN,sp)
      0081A2 50               [ 2]  431 	negw x 	 
      0081A3                        432 1$:	
      0081A3 C6 00 08         [ 1]  433 	ld a,base 
      0081A6 62               [ 2]  434 	div x,a 
      0081A7 AB 30            [ 1]  435 	add a,#'0 
      0081A9 A1 3A            [ 1]  436 	cp a,#'9+1 
      0081AB 2B 02            [ 1]  437 	jrmi 2$ 
      0081AD AB 07            [ 1]  438 	add a,#7 
      0081AF 90 5A            [ 2]  439 2$: decw y 
      0081B1 90 F7            [ 1]  440 	ld (y),a 
      0081B3 5D               [ 2]  441 	tnzw x 
      0081B4 26 ED            [ 1]  442 	jrne 1$ 
      0081B6 A6 10            [ 1]  443 	ld a,#16 
      0081B8 C1 00 08         [ 1]  444 	cp a,base 
      0081BB 26 08            [ 1]  445 	jrne 3$
      0081BD A6 24            [ 1]  446 	ld a,#'$
      0081BF 90 5A            [ 2]  447 	decw y  
      0081C1 90 F7            [ 1]  448 	ld (y),a
      0081C3 20 0A            [ 2]  449 	jra 9$ 
      0081C5 0D 01            [ 1]  450 3$: tnz (SIGN,sp)
      0081C7 27 06            [ 1]  451 	jreq 9$ 
      0081C9 A6 2D            [ 1]  452 	ld a,#'-
      0081CB 90 5A            [ 2]  453 	decw y  
      0081CD 90 F7            [ 1]  454 	ld (y),a
      0081CF                        455 9$:	
      0081CF AE 17 3F         [ 2]  456 	ldw x,#pad+PAD_SIZE-1
      0081D2 90 CF 00 0C      [ 2]  457     ldw acc16,y
      0081D6 72 B0 00 0C      [ 2]  458     subw x,acc16 
      0081DA                        459 10$:
      0081DA 90 5A            [ 2]  460 	decw y 
      0081DC A6 20            [ 1]  461 	ld a,#SPACE 
      0081DE 90 F7            [ 1]  462 	ld (y),a
      0081E0 5C               [ 1]  463 	incw x 
      0081E1 9F               [ 1]  464 	ld a,xl 
      0081E2 C1 00 28         [ 1]  465 	cp a,tab_width
      0081E5 2B F3            [ 1]  466 	jrmi 10$ 
      0081E7                        467 12$:
      0081E7 93               [ 1]  468     ldw x,y 
      0081E8 CD 81 10         [ 4]  469 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      0081EB 16 02            [ 2]  470     ldw y,(YSAVE,sp) 
      00016D                        471 	_drop VSIZE 
      0081ED 5B 03            [ 2]    1     addw sp,#VSIZE 
      0081EF 81               [ 4]  472 	ret 
                                    473 
                                    474 
                                    475 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    476 ; VM code routine address
                                    477 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0081F0 82 41 82 6D 82 7D 82   478 bytecode: .word bye,subr,exit,exec,branch,zbranch,emit,key,qkey,dotq,delete
             82 82 89 82 95 82 65
             82 4B 82 54 82 A0 82
             A7
      008206 82 B4 82 C3 82 CA 82   479         .word spaces,prtos,lit,litc,fetch,cfetch,store,cstore,rot,nrot
             D8 82 E2 82 EA 82 F4
             83 03 83 13 83 28
      00821A 83 3D 83 42 83 48 83   480         .word drop,dup,swap,over,neg,zlt,plus,minus,slash,mod,staru,star
             94 83 9A 83 A2 83 59
             83 62 83 6E 83 7D 83
             8C 83 AF
      008232 83 E1 83 E8            481         .word decim,hexa
                                    482 
                                    483 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    484 ;  bytecode interpreter 
                                    485 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008236                        486 next: ; vm instruction fetch 
      008236 90 F6            [ 1]  487     ld a,(y)
      008238 90 5C            [ 1]  488     incw y
      00823A 48               [ 1]  489     sll a 
      00823B 5F               [ 1]  490     clrw x 
      00823C 97               [ 1]  491     ld xl,a
      00823D DE 81 F0         [ 2]  492     ldw x,(bytecode,x) 
      008240 FC               [ 2]  493     jp (x)
                                    494 
                                    495 ; put mcu in lowest power mode 
                                    496 ; until reset 
      008241                        497 bye: ; { -- }
      008241 72 0D 52 40 FB   [ 2]  498     btjf UART3_SR,#UART_SR_TC,.
      008246 9B               [ 1]  499     sim 
      008247 8E               [10]  500     halt 
      008248 CC 83 EF         [ 2]  501     jp cold_start 
                                    502 
      00824B                        503 key: ;{ -- c}
      00824B CD 81 1B         [ 4]  504     call getchar 
      00824E 5F               [ 1]  505     clrw x 
      00824F 97               [ 1]  506     ld xl,a 
      008250 89               [ 2]  507     pushw x 
      008251 CC 82 36         [ 2]  508     jp next 
                                    509 
      008254                        510 qkey: ; { -- 0| c 1 }
      008254 5F               [ 1]  511     clrw x 
      008255 89               [ 2]  512     pushw x 
      008256 72 0B 52 40 DB   [ 2]  513     btjf UART3_SR,#UART_SR_RXNE,next
      00825B 0C 02            [ 1]  514     inc (2,sp) 
      00825D C6 52 41         [ 1]  515     ld a,UART3_DR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      008260 97               [ 1]  516     ld xl,a 
      008261 89               [ 2]  517     pushw x
      008262 CC 82 36         [ 2]  518     jp next 
                                    519 
      008265                        520 emit: ; { c -- }
      008265 85               [ 2]  521     popw x 
      008266 9F               [ 1]  522     ld a,xl 
      008267 CD 81 07         [ 4]  523     call putchar
      00826A CC 82 36         [ 2]  524     jp next 
                                    525 
                                    526 ; vm subroutine call 
      00826D                        527 subr: ; { -- }
      00826D 90 F6            [ 1]  528     ld a,(y)
      00826F 90 5C            [ 1]  529     incw y 
      008271 95               [ 1]  530     ld xh,a 
      008272 90 F6            [ 1]  531     ld a,(y)
      008274 90 5C            [ 1]  532     incw y 
      008276 97               [ 1]  533     ld xl,a 
      008277 90 89            [ 2]  534     pushw y ;save return address 
      008279 51               [ 1]  535     exgw x,y ; x become new vm_pc 
      00827A CC 82 36         [ 2]  536     jp next 
                                    537 
                                    538 
                                    539 ; return from vm subroutine
      00827D                        540 exit: ; { addr -- }
      00827D 90 85            [ 2]  541     popw y ; restore vm_pc
      00827F CC 82 36         [ 2]  542     jp next 
                                    543 
                                    544 ; execute routine from stack 
      008282                        545 exec: ; { addr_sub -- addr_ret }
      008282 85               [ 2]  546     popw x 
      008283 90 89            [ 2]  547     pushw y 
      008285 51               [ 1]  548     exgw x,y 
      008286 CC 82 36         [ 2]  549     jp next 
                                    550 
                                    551 ; unconditional jump 
      008289                        552 branch: ; { -- }
      008289 90 F6            [ 1]  553     ld a,(y)
      00828B 90 5C            [ 1]  554     incw y 
      00828D 95               [ 1]  555     ld xh,a 
      00828E 90 F6            [ 1]  556     ld a,(y)
      008290 97               [ 1]  557     ld xl,a 
      008291 51               [ 1]  558     exgw x,y 
      008292 CC 82 36         [ 2]  559     jp next 
                                    560 
                                    561 ; jump if TOS==0
      008295                        562 zbranch: ; { f -- }
      008295 85               [ 2]  563     popw x 
      008296 5D               [ 2]  564     tnzw x
      008297 27 F0            [ 1]  565     jreq branch
      008299 72 A9 00 02      [ 2]  566     addw y,#2 
      00829D CC 82 36         [ 2]  567     jp next 
                                    568 
                                    569 
                                    570 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                                    571 ; send an ASCIZ string to UART3 
                                    572 ; input: 
                                    573 ;   TOS 		char * 
                                    574 ; output:
                                    575 ;   none 
                                    576 ;-------------------------------
      0082A0                        577 dotq: ; { .asciz -- }
      0082A0 85               [ 2]  578     popw x 
      0082A1 CD 81 10         [ 4]  579     call puts 
      0082A4 CC 82 36         [ 2]  580 	jp next  
                                    581 
                                    582 
                                    583 ;---------------------------
                                    584 ; delete n character left of cursor 
                                    585 ; at terminal.
                                    586 ; input: 
                                    587 ;   TOS   	number of characters to delete.
                                    588 ; output:
                                    589 ;    none 
                                    590 ;--------------------------	
      0082A7                        591 delete: ; { n -- }
      0082A7 85               [ 2]  592     popw x 
      0082A8 5D               [ 2]  593 	tnzw x
      0082A9 27 06            [ 1]  594 	jreq 1$
      0082AB CD 81 24         [ 4]  595 0$:	call bksp 
      0082AE 5A               [ 2]  596 	decw x
      0082AF 26 FA            [ 1]  597 	jrne 0$
      0082B1 CC 82 36         [ 2]  598 1$:	jp next 
                                    599 
                                    600 
                                    601 ;--------------------------
                                    602 ; print n spaces on terminal
                                    603 ; input:
                                    604 ;   TOS 	number of spaces 
                                    605 ; output:
                                    606 ;	none 
                                    607 ;---------------------------
      0082B4                        608 spaces: ; { n -- }
      0082B4 85               [ 2]  609     popw x 
      0082B5 A6 20            [ 1]  610 	ld a,#SPACE 
      0082B7 5D               [ 2]  611 	tnzw x
      0082B8 27 06            [ 1]  612 	jreq 9$
      0082BA CD 81 07         [ 4]  613 1$:	call putchar  
      0082BD 5A               [ 2]  614 	decw x
      0082BE 26 FA            [ 1]  615 	jrne 1$
      0082C0                        616 9$: 
      0082C0 CC 82 36         [ 2]  617 	jp next 
                                    618 
                                    619 ; print top of stack
                                    620 ; variables 'base' and 'tab_width'
                                    621 ; are used 
      0082C3                        622 prtos: ; { n -- }
      0082C3 85               [ 2]  623     popw x 
      0082C4 CD 81 8A         [ 4]  624     call print_int
      0082C7 CC 82 36         [ 2]  625     jp next 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



                                    626 
      0082CA                        627 lit: ; { -- n }
      0082CA 90 F6            [ 1]  628     ld a,(y)
      0082CC 90 5C            [ 1]  629     incw y 
      0082CE 95               [ 1]  630     ld xh,a 
      0082CF 90 F6            [ 1]  631     ld a,(y)
      0082D1 90 5C            [ 1]  632     incw y 
      0082D3 97               [ 1]  633     ld xl,a 
      0082D4 89               [ 2]  634     pushw x  
      0082D5 CC 82 36         [ 2]  635     jp next
                                    636 
      0082D8                        637 litc: ; { -- c }
      0082D8 90 F6            [ 1]  638     ld a,(y)
      0082DA 90 5C            [ 1]  639     incw y 
      0082DC 5F               [ 1]  640     clrw x 
      0082DD 97               [ 1]  641     ld xl,a 
      0082DE 89               [ 2]  642     pushw x 
      0082DF CC 82 36         [ 2]  643     jp next 
                                    644 
      0082E2                        645 fetch: ; { addr -- n}
      0082E2 1E 01            [ 2]  646     ldw x,(TOS,sp)
      0082E4 FE               [ 2]  647     ldw x,(x)
      0082E5 1F 01            [ 2]  648     ldw (TOS,sp),x 
      0082E7 CC 82 36         [ 2]  649     jp next 
                                    650 
      0082EA                        651 cfetch: ; { addr -- c }
      0082EA 1E 01            [ 2]  652     ldw x,(TOS,sp)
      0082EC F6               [ 1]  653     ld a,(x)
      0082ED 5F               [ 1]  654     clrw x 
      0082EE 97               [ 1]  655     ld xl,a 
      0082EF 1F 01            [ 2]  656     ldw (TOS,sp),x 
      0082F1 CC 82 36         [ 2]  657     jp  next 
                                    658 
      0082F4                        659 store: ; { addr n -- }
      0082F4 1E 03            [ 2]  660     ldw x,(N,sp)
      0082F6 CF 00 17         [ 2]  661     ldw ptr16,x 
      0082F9 85               [ 2]  662     popw x 
      0082FA 72 CE 00 17      [ 5]  663     ldw x,[ptr16]
      00027E                        664     _drop CELLL 
      0082FE 5B 02            [ 2]    1     addw sp,#CELLL 
      008300 CC 82 36         [ 2]  665     jp next
                                    666 
      008303                        667 cstore: ; { addr c -- }
      008303 1E 03            [ 2]  668     ldw x,(N,sp)
      008305 CF 00 17         [ 2]  669     ldw ptr16,x 
      008308 85               [ 2]  670     popw x 
      008309 9F               [ 1]  671     ld a,xl 
      00830A 72 C7 00 17      [ 4]  672     ld [ptr16],a 
      00028E                        673     _drop CELLL 
      00830E 5B 02            [ 2]    1     addw sp,#CELLL 
      008310 CC 82 36         [ 2]  674     jp next
                                    675 
      008313                        676 rot: ;{ n1 n2 n3 -- n3 n1 n2 }
      008313 1E 01            [ 2]  677     ldw x,(TOS,sp)
      008315 CF 00 0C         [ 2]  678     ldw acc16,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      008318 1E 03            [ 2]  679     ldw x,(N,sp)
      00831A 1F 01            [ 2]  680     ldw (TOS,sp),x
      00831C 1E 05            [ 2]  681     ldw x,(5,sp)
      00831E 1F 03            [ 2]  682     ldw (N,sp),x 
      008320 CE 00 0C         [ 2]  683     ldw x,acc16 
      008323 1F 05            [ 2]  684     ldw (5,sp),x
      008325 CC 82 36         [ 2]  685     jp next 
                                    686 
      008328                        687 nrot: ; {n1 n2 n3 -- n2 n3 n1 }
      008328 1E 05            [ 2]  688     ldw x,(5,sp)
      00832A CF 00 0C         [ 2]  689     ldw acc16,x 
      00832D 1E 03            [ 2]  690     ldw x,(N,sp)
      00832F 1F 05            [ 2]  691     ldw (5,sp),x
      008331 1E 01            [ 2]  692     ldw x,(TOS,sp)
      008333 1F 03            [ 2]  693     ldw (N,sp),x
      008335 CE 00 0C         [ 2]  694     ldw x,acc16 
      008338 1F 03            [ 2]  695     ldw (N,sp),x  
      00833A CC 82 36         [ 2]  696     jp next 
                                    697 
      00833D                        698 drop: 
      0002BD                        699     _drop CELLL
      00833D 5B 02            [ 2]    1     addw sp,#CELLL 
      00833F CC 82 36         [ 2]  700     jp next 
                                    701     
      008342                        702 dup: ; { n -- n n }
      008342 1E 01            [ 2]  703     ldw x,(TOS,sp)
      008344 89               [ 2]  704     pushw x 
      008345 CC 82 36         [ 2]  705     jp next 
                                    706 
      008348                        707 swap: ; { n1 n2 -- n2 n1 }
      008348 1E 01            [ 2]  708     ldw x,(TOS,sp)
      00834A CF 00 0C         [ 2]  709     ldw acc16,x 
      00834D 1E 03            [ 2]  710     ldw x,(N,sp)
      00834F 1F 01            [ 2]  711     ldw (TOS,sp),x
      008351 CE 00 0C         [ 2]  712     ldw x,acc16 
      008354 1F 03            [ 2]  713     ldw (N,sp),x 
      008356 CC 82 36         [ 2]  714     jp next 
                                    715 
      008359                        716 plus: ; { n1 n2 -- n1+n2 }
      008359 85               [ 2]  717     popw x
      00835A 72 FB 01         [ 2]  718     addw x,(TOS,sp)
      00835D 1F 01            [ 2]  719     ldw (TOS,sp),x 
      00835F CC 82 36         [ 2]  720     jp next
                                    721 
      008362                        722 minus: ; {n1 n2 -- n1-n2 }
      008362 1E 03            [ 2]  723     ldw x,(N,sp) 
      008364 72 F0 01         [ 2]  724     subw x,(TOS,sp) 
      008367 1F 03            [ 2]  725     ldw (N,sp),x 
      0002E9                        726     _drop CELLL
      008369 5B 02            [ 2]    1     addw sp,#CELLL 
      00836B CC 82 36         [ 2]  727     jp next
                                    728 
      00836E                        729 slash: ; {n1 n2 -- n1/n2}
      00836E 1E 01            [ 2]  730     ldw x,(TOS,sp) ; n2 
      008370 17 01            [ 2]  731     ldw (TOS,sp),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      008372 51               [ 1]  732     exgw x,y 
      008373 1E 03            [ 2]  733     ldw x,(N,sp) ; n1 
      008375 65               [ 2]  734     divw x,y 
      008376 1F 03            [ 2]  735     ldw (N,sp),x ; quotient
      008378 90 85            [ 2]  736     popw y 
      00837A CC 82 36         [ 2]  737     jp next 
                                    738 
      00837D                        739 mod: ; { n1 n2 -- n1%n2}
      00837D 1E 01            [ 2]  740     ldw x,(TOS,sp) ; n2 
      00837F 17 01            [ 2]  741     ldw (TOS,sp),y 
      008381 51               [ 1]  742     exgw x,y 
      008382 1E 03            [ 2]  743     ldw x,(N,sp) ; n1 
      008384 65               [ 2]  744     divw x,y 
      008385 17 03            [ 2]  745     ldw (N,sp),y ; reste
      008387 90 85            [ 2]  746     popw y 
      008389 CC 82 36         [ 2]  747     jp next 
                                    748 
                                    749 ; unsigned multiply 
                                    750 ; overflow is discarded 
      00838C                        751 staru: ; {u1 u2 -- u1*u2 }
      00838C CD 81 34         [ 4]  752     call mul16u 
      00030F                        753     _drop CELLL ; discard overflow 
      00838F 5B 02            [ 2]    1     addw sp,#CELLL 
      008391 CC 82 36         [ 2]  754     jp next 
                                    755 
      008394                        756 over: ; { n1 n2 -- n1 n2 n1 }
      008394 1E 03            [ 2]  757     ldw x,(N,sp)
      008396 89               [ 2]  758     pushw x 
      008397 CC 82 36         [ 2]  759     jp next 
                                    760     
      00839A                        761 neg: ;{ n -- -n}
      00839A 1E 01            [ 2]  762     ldw x,(TOS,sp)
      00839C 50               [ 2]  763     negw x 
      00839D 1F 01            [ 2]  764     ldw (TOS,sp),x
      00839F CC 82 36         [ 2]  765     jp next 
                                    766 
                                    767 ; n<0? 
      0083A2                        768 zlt: ; {n -- 0|1 }
      0083A2 5F               [ 1]  769     clrw x 
      0083A3 7B 01            [ 1]  770     ld a,(TOS,sp)
      0083A5 A5 80            [ 1]  771     bcp a,#0x80
      0083A7 27 01            [ 1]  772     jreq  1$
      0083A9 5C               [ 1]  773     incw x 
      0083AA 1F 01            [ 2]  774 1$: ldw (TOS,sp),x 
      0083AC CC 82 36         [ 2]  775     jp next 
                                    776 
                                    777  
      0083AF                        778 star: ; { n1 n2 -- n1*n2 }
      0083AF 1E 01            [ 2]  779     ldw x,(TOS,sp)
      0083B1 CF 00 0C         [ 2]  780     ldw acc16,x
      0083B4 1E 03            [ 2]  781     ldw x,(N,sp)
      0083B6 CF 00 17         [ 2]  782     ldw ptr16,x 
      0083B9 5F               [ 1]  783     clrw x
      0083BA 1F 03            [ 2]  784     ldw (N,sp),x 
      0083BC CE 00 17         [ 2]  785     ldw x,ptr16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      0083BF 2A 03            [ 1]  786     jrpl 1$
      0083C1 03 03            [ 1]  787     cpl (N,sp)
      0083C3 50               [ 2]  788     negw x 
      0083C4 1F 01            [ 2]  789 1$: ldw (TOS,sp),x
      0083C6 CE 00 0C         [ 2]  790     ldw x,acc16 
      0083C9 2A 03            [ 1]  791     jrpl 2$
      0083CB 03 03            [ 1]  792     cpl (N,sp)
      0083CD 50               [ 2]  793     negw x 
      0083CE 89               [ 2]  794 2$: pushw x 
      0083CF CD 81 34         [ 4]  795     call mul16u 
      000352                        796     _drop CELLL ; discard overflow
      0083D2 5B 02            [ 2]    1     addw sp,#CELLL 
      0083D4 85               [ 2]  797     popw x 
      0083D5 7B 01            [ 1]  798     ld a,(TOS,sp)
      0083D7 A5 80            [ 1]  799     bcp a,#0x80 
      0083D9 27 01            [ 1]  800     jreq 4$
      0083DB 50               [ 2]  801     negw x 
      0083DC 1F 01            [ 2]  802 4$: ldw (TOS,sp),x 
      0083DE CC 82 36         [ 2]  803     jp next     
                                    804 
      0083E1                        805 decim:
      0083E1 35 0A 00 08      [ 1]  806     mov base,#10
      0083E5 CC 82 36         [ 2]  807     jp next 
                                    808 
      0083E8                        809 hexa:
      0083E8 35 10 00 08      [ 1]  810     mov base,#16
      0083EC CC 82 36         [ 2]  811     jP next 
                                    812 
                                    813 ;-----------------------------
                                    814 ;  STARTUP CODE
                                    815 ;-----------------------------
                                    816 
      0083EF                        817 cold_start:
      0083EF AE 17 FF         [ 2]  818     ldw x,#STACK_EMPTY
      0083F2 94               [ 1]  819     ldw sp,x
                                    820 ; clear all ram 
      0083F3 7F               [ 1]  821 0$: clr (x)
      0083F4 5A               [ 2]  822 	decw x 
      0083F5 26 FC            [ 1]  823 	jrne 0$
                                    824 ; activate pull up on all inputs 
      0083F7 A6 FF            [ 1]  825 	ld a,#255 
      0083F9 C7 50 03         [ 1]  826 	ld PA_CR1,a 
      0083FC C7 50 08         [ 1]  827 	ld PB_CR1,a 
      0083FF C7 50 0D         [ 1]  828 	ld PC_CR1,a 
      008402 C7 50 12         [ 1]  829 	ld PD_CR1,a 
      008405 C7 50 17         [ 1]  830 	ld PE_CR1,a 
      008408 C7 50 1C         [ 1]  831 	ld PF_CR1,a 
      00840B C7 50 21         [ 1]  832 	ld PG_CR1,a 
      00840E C7 50 2B         [ 1]  833 	ld PI_CR1,a 
                                    834 ; configure LD2 pin 
      008411 72 1A 50 0D      [ 1]  835     bset PC_CR1,#LED2_BIT
      008415 72 1A 50 0E      [ 1]  836     bset PC_CR2,#LED2_BIT
      008419 72 1A 50 0C      [ 1]  837     bset PC_DDR,#LED2_BIT
      00841D 72 1A 50 0A      [ 1]  838     bset PC_ODR,#LED2_BIT 
                                    839 ; select internal clock no divisor: 16 Mhz 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      008421 A6 E1            [ 1]  840 	ld a,#CLK_SWR_HSI 
      008423 5F               [ 1]  841 	clrw x  
      008424 CD 80 A9         [ 4]  842     call clock_init 
                                    843 ;    call timer4_init 
                                    844 ; UART3 at 115200 BAUD
      008427 CD 80 D0         [ 4]  845     call uart3_init
      00842A 9A               [ 1]  846     rim 
      00842B 35 0A 00 08      [ 1]  847     mov base,#10
      00842F 35 04 00 28      [ 1]  848     mov tab_width,#4 
      008433 72 1B 50 0A      [ 1]  849     bres PC_ODR,#LED2_BIT 
      008437 90 AE 84 4D      [ 2]  850     ldw y,#test 
      00843B CC 82 36         [ 2]  851     jp next 
      00843E                        852 warm: 
      00843E 63 65 63 69 20 65 73   853 .asciz "ceci est test\n"
             74 20 74 65 73 74 0A
             00
      00844D                        854 test:
      00844D 0E 4F 06 0E 4B 06 0E   855     .byte LITC,'O',EMIT,LITC,'K',EMIT,LITC,CR,EMIT
             0D 06
      008456 0D 84 4D 0D 84 3E 1C   856     .byte LIT,test>>8,test,LIT,warm>>8,warm,MINUS,PRTOS,BYE
             0C 00
                                    857 
                                    858     
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
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
    AFR6_I2C=  000006     |     AFR7_BEE=  000007     |     ARG_OFS =  000002 
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |     BELL    =  000007     |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BRANCH  =  000004     |     BSP     =  000008 
    BYE     =  000000     |     CAN_DGR =  005426     |     CAN_FPSR=  005427 
    CAN_IER =  005425     |     CAN_MCR =  005420     |     CAN_MSR =  005421 
    CAN_P0  =  005428     |     CAN_P1  =  005429     |     CAN_P2  =  00542A 
    CAN_P3  =  00542B     |     CAN_P4  =  00542C     |     CAN_P5  =  00542D 
    CAN_P6  =  00542E     |     CAN_P7  =  00542F     |     CAN_P8  =  005430 
    CAN_P9  =  005431     |     CAN_PA  =  005432     |     CAN_PB  =  005433 
    CAN_PC  =  005434     |     CAN_PD  =  005435     |     CAN_PE  =  005436 
    CAN_PF  =  005437     |     CAN_RFR =  005424     |     CAN_TPR =  005423 
    CAN_TSR =  005422     |     CC_C    =  000000     |     CC_H    =  000004 
    CC_I0   =  000003     |     CC_I1   =  000005     |     CC_N    =  000002 
    CC_V    =  000007     |     CC_Z    =  000001     |     CELLL   =  000002 
    CFETCH  =  000010     |     CFG_GCR =  007F60     |     CFG_GCR_=  000001 
    CFG_GCR_=  000000     |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
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
    CLK_PCKE=  000002     |     CLK_PCKE=  000003     |     CLK_PCKE=  0050CA 
    CLK_PCKE=  000003     |     CLK_PCKE=  000002     |     CLK_PCKE=  000007 
    CLK_SWCR=  0050C5     |     CLK_SWCR=  000000     |     CLK_SWCR=  000001 
    CLK_SWCR=  000002     |     CLK_SWCR=  000003     |     CLK_SWIM=  0050CD 
    CLK_SWR =  0050C4     |     CLK_SWR_=  0000B4     |     CLK_SWR_=  0000E1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]

Symbol Table

    CLK_SWR_=  0000D2     |     COMMA   =  00002C     |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |     CR      =  00000D     |     CSTORE  =  000012 
    CTRL_A  =  000001     |     CTRL_B  =  000002     |     CTRL_C  =  000003 
    CTRL_D  =  000004     |     CTRL_E  =  000005     |     CTRL_F  =  000006 
    CTRL_G  =  000007     |     CTRL_H  =  000008     |     CTRL_I  =  000009 
    CTRL_J  =  00000A     |     CTRL_K  =  00000B     |     CTRL_L  =  00000C 
    CTRL_M  =  00000D     |     CTRL_N  =  00000E     |     CTRL_O  =  00000F 
    CTRL_P  =  000010     |     CTRL_Q  =  000011     |     CTRL_R  =  000012 
    CTRL_S  =  000013     |     CTRL_T  =  000014     |     CTRL_U  =  000015 
    CTRL_V  =  000016     |     CTRL_W  =  000017     |     CTRL_X  =  000018 
    CTRL_Y  =  000019     |     CTRL_Z  =  00001A     |     DEBUG   =  000000 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |     DECIM   =  000021 
    DELETE  =  00000A     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |     DOTQ    =  000009 
    DROP    =  000015     |     DUP     =  000016     |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_S=  000800     |     EMIT    =  000006 
    ESC     =  00001B     |     EXEC    =  000003     |     EXIT    =  000002 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |     FBREAK  =  000004 
    FCOMP   =  000005     |     FETCH   =  00000F     |     FF      =  00000C 
    FFOR    =  000002     |     FHSE    =  7A1200     |     FHSI    =  F42400 
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
    FLASH_PU=  0000AE     |     FLASH_SI=  020000     |     FLASH_WS=  00480D 
    FLSI    =  01F400     |     FRUN    =  000000     |     FSLEEP  =  000003 
    FTRAP   =  000001     |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |     HEXA    =  000022 
    HSECNT  =  004809     |     I2C_CCRH=  00521C     |     I2C_CCRH=  000080 
    I2C_CCRH=  0000C0     |     I2C_CCRH=  000080     |     I2C_CCRH=  000000 
    I2C_CCRH=  000001     |     I2C_CCRH=  000000     |     I2C_CCRL=  00521B 
    I2C_CCRL=  00001A     |     I2C_CCRL=  000002     |     I2C_CCRL=  00000D 
    I2C_CCRL=  000050     |     I2C_CCRL=  000090     |     I2C_CCRL=  0000A0 
    I2C_CR1 =  005210     |     I2C_CR1_=  000006     |     I2C_CR1_=  000007 
    I2C_CR1_=  000000     |     I2C_CR2 =  005211     |     I2C_CR2_=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]

Symbol Table

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
    I2C_WRIT=  000000     |     INPUT_DI=  000000     |     INPUT_EI=  000001 
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
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |     KEY     =  000007 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LIT     =  00000D     |     LITC    =  00000E     |     MINUS   =  00001C 
    MOD     =  00001E     |     N       =  000003     |     NAFR    =  004804 
    NCLKOPT =  004808     |     NEG     =  000019     |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NL      =  00000A     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |     NROT    =  000014     |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000000 R
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVER    =  000018     |     PA      =  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]

Symbol Table

    PAD_SIZE=  000028     |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |     PD_BASE =  00500F     |     PD_CR1  =  005012 
    PD_CR2  =  005013     |     PD_DDR  =  005011     |     PD_IDR  =  005010 
    PD_ODR  =  00500F     |     PE      =  000014     |     PE_BASE =  005014 
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
    PLUS    =  00001B     |     PRTOS   =  00000C     |     QKEY    =  000008 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
    ROP     =  004800     |     ROT     =  000013     |     RST_SR  =  0050B3 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
    SIGN    =  000001     |     SLASH   =  00001D     |     SPACE   =  000020 
    SPACES  =  00000B     |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    STACK_EM=  0017FF     |     STACK_SI=  0000C0     |     STAR    =  000020 
    STARU   =  00001F     |     STORE   =  000011     |     SUBR    =  000001 
    SWAP    =  000017     |     SWIM_CSR=  007F80     |     TAB     =  000009 
    TIB_SIZE=  000050     |     TICK    =  000027     |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |     TOS     =  000001 
  5 Timer4Up   000001 R   |     U1      =  000003     |     U2      =  000005 
    UART1   =  000000     |     UART1_BA=  005230     |     UART1_BR=  005232 
    UART1_BR=  005233     |     UART1_CR=  005234     |     UART1_CR=  005235 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]

Symbol Table

    UART1_CR=  005236     |     UART1_CR=  005237     |     UART1_CR=  005238 
    UART1_DR=  005231     |     UART1_GT=  005239     |     UART1_PO=  000000 
    UART1_PS=  00523A     |     UART1_RX=  000004     |     UART1_SR=  005230 
    UART1_TX=  000005     |     UART3   =  000001     |     UART3_BA=  005240 
    UART3_BR=  005242     |     UART3_BR=  005243     |     UART3_CR=  005244 
    UART3_CR=  005245     |     UART3_CR=  005246     |     UART3_CR=  005247 
    UART3_CR=  004249     |     UART3_DR=  005241     |     UART3_PO=  00000F 
    UART3_RX=  000006     |     UART3_SR=  005240     |     UART3_TX=  000005 
    UART_BRR=  000002     |     UART_BRR=  000003     |     UART_CR1=  000004 
    UART_CR1=  000004     |     UART_CR1=  000002     |     UART_CR1=  000000 
    UART_CR1=  000001     |     UART_CR1=  000007     |     UART_CR1=  000006 
    UART_CR1=  000005     |     UART_CR1=  000003     |     UART_CR2=  000005 
    UART_CR2=  000004     |     UART_CR2=  000002     |     UART_CR2=  000005 
    UART_CR2=  000001     |     UART_CR2=  000000     |     UART_CR2=  000006 
    UART_CR2=  000003     |     UART_CR2=  000007     |     UART_CR3=  000006 
    UART_CR3=  000003     |     UART_CR3=  000001     |     UART_CR3=  000002 
    UART_CR3=  000000     |     UART_CR3=  000006     |     UART_CR3=  000004 
    UART_CR3=  000005     |     UART_CR4=  000007     |     UART_CR4=  000000 
    UART_CR4=  000001     |     UART_CR4=  000002     |     UART_CR4=  000003 
    UART_CR4=  000004     |     UART_CR4=  000006     |     UART_CR4=  000005 
    UART_CR5=  000008     |     UART_CR5=  000003     |     UART_CR5=  000001 
    UART_CR5=  000002     |     UART_CR5=  000004     |     UART_CR5=  000005 
    UART_CR6=  000009     |     UART_CR6=  000004     |     UART_CR6=  000007 
    UART_CR6=  000001     |     UART_CR6=  000002     |     UART_CR6=  000000 
    UART_CR6=  000005     |     UART_DR =  000001     |     UART_GTR=  000009 
    UART_PSC=  00000A     |     UART_SR =  000000     |     UART_SR_=  000001 
    UART_SR_=  000004     |     UART_SR_=  000002     |     UART_SR_=  000003 
    UART_SR_=  000000     |     UART_SR_=  000005     |     UART_SR_=  000006 
    UART_SR_=  000007     |     UBC     =  004801     |   5 USER_ABO   00000E R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
  5 UserButt   00000D R   |     VSIZE   =  000003     |     VT      =  00000B 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     YSAVE   =  000002     |     ZBRANCH =  000005 
    ZLT     =  00001A     |   1 acc16      00000B R   |   1 acc24      00000A R
  1 acc8       00000C R   |   1 array_ad   000022 R   |   1 array_si   000024 R
  1 base       000007 R   |   1 basicptr   000003 R   |   5 bksp       0000A4 R
  5 branch     000209 R   |   5 bye        0001C1 R   |   5 bytecode   000170 R
  5 cfetch     00026A R   |   5 clock_in   000029 R   |   5 cold_sta   00036F R
  1 count      000002 R   |   5 cstore     000283 R   |   5 decim      000361 R
  5 delete     000227 R   |   5 dotq       000220 R   |   5 drop       0002BD R
  1 dstkptr    00001B R   |   5 dup        0002C2 R   |   5 emit       0001E5 R
  5 exec       000202 R   |   5 exit       0001FD R   |   1 farptr     000015 R
  5 fetch      000262 R   |   1 ffree      000018 R   |   1 flags      000026 R
  1 free_ram   00005C R   |   5 getchar    00009B R   |   5 hexa       000368 R
  5 hse_cloc   000063 R   |   5 hsi_cloc   00006D R   |   1 in         000001 R
  1 in.w       000000 R   |   1 in.w.sav   000013 R   |   5 key        0001CB R
  1 lineno     000005 R   |   5 lit        00024A R   |   5 litc       000258 R
  1 loop_dep   000021 R   |   5 minus      0002E2 R   |   5 mod        0002FD R
  5 mul16u     0000B4 R   |   5 neg        00031A R   |   5 next       0001B6 R
  5 nrot       0002A8 R   |   5 over       000314 R   |   3 pad        001718 R
  5 plus       0002D9 R   |   5 print_in   00010A R   |   5 prtos      000243 R
  1 ptr16      000016 R   |   1 ptr8       000017 R   |   5 putchar    000087 R
  5 puts       000090 R   |   5 qkey       0001D4 R   |   5 rot        000293 R
  1 seedx      00000F R   |   1 seedy      000011 R   |   5 slash      0002EE R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]

Symbol Table

  5 spaces     000234 R   |   3 stack_fu   001740 R   |   3 stack_un   001800 R
  5 star       00032F R   |   5 staru      00030C R   |   5 store      000274 R
  5 subr       0001ED R   |   5 swap       0002C8 R   |   1 tab_widt   000027 R
  5 test       0003CD R   |   3 tib        0016C8 R   |   1 ticks      00000D R
  5 timer4_i   00003F R   |   1 tos        000008 R   |   1 txtbgn     00001D R
  1 txtend     00001F R   |   5 uart3_in   000050 R   |   5 uart3_se   00005C R
  5 uart_ena   000075 R   |   1 vars       000028 R   |   5 warm       0003BE R
  5 zbranch    000215 R   |   5 zlt        000322 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     5C   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    138   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size    3DF   flags    0

