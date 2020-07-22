ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 1.
Hexadecimal [24-Bits]



                                      1 ;;
                                      2 ; Copyright Jacques Deschênes 2019,2020 
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
                                     18 ;------------------------------
                                     19 ; This file is for functions 
                                     20 ; interfacing with VT100 terminal
                                     21 ; emulator.
                                     22 ; except for getc and putc which
                                     23 ; are in TinyBasic.asm 
                                     24 ; exported functions:
                                     25 ;   puts 
                                     26 ;   readln 
                                     27 ;   spaces 
                                     28 ;------------------------------
                                     29 
                                     30     .module TERMINAL
                                     31 
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
                                 
                                 
                                 
                                        
                                            .macro _led2_on 
                                        
                                            .macro _led2_off 
                                        
                                            .macro _led2_toggle 
                                             
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
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; SPI_CR1 bit fields 
                                 
                                 
                                 
                                 
                                 
                                 
                                          
                                        ; SPI_CR2 bit fields 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; SPI_SR bit fields 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
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
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; TIM2_CR1 bitfields
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; TIMER2_CCMR bitfields 
                                 
                                 
                                 
                                        
                                        ; TIMER2_CCER1 bitfields
                                 
                                 
                                 
                                 
                                        
                                        ; TIMER2_EGR bitfields
                                 
                                 
                                 
                                 
                                 
                                        
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
                                        ; REF: https://en.wikipedia.org/wiki/ASCII    
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
                                        	.include "tbi_macros.inc" 
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
                                 
                                 
                                                ; keyword types 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                        
                                        ;--------------------------------------
                                        ;   constantes related to Arduino 
                                        ;   API mapping 
                                        ;-------------------------------------
                                 
                                 
                                        
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
                                                ; bit 7   1 for dictionary words else 0 
                                                ; bits 6  always 0 
                                                ; bits 5:4 identify group 
                                                ; bits 3:0 token identifier inside group  
                                 
                                 
                                 
                                 
                                 
                                 
                                                ; token groups 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ;--------------------------------------
                                        ;   error codes 
                                        ;--------------------------------------
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ;--------------------------------------
                                        ;   assembler flags 
                                        ;-------------------------------------
                                 
                                        
                                 
                                        
                                            .macro _usec_dly n 
                                            
                                            ; load X register with 
                                            ; entry point of dictionary
                                            ; before calling 'search_dict'
                                            .macro _ldx_dict dict_name
                                        
                                            ; reset BASIC pointer
                                            ; to beginning of last token
                                            ; extracted except if it was end of line 
                                            .macro _unget_token 
                                        
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
                                        
                                            ; software reset 
                                            .macro _swreset
                                     38     .list 
                                     39 
                                     40 
                                     41     .area CODE 
                                     42 
                                     43 
                                     44 ;-----------------------------
                                     45 ;  constants replacing 
                                     46 ;  ANSI sequence received 
                                     47 ;  from terminal.
                                     48 ;  These are the ANSI sequences
                                     49 ;  accepted by function readln
                                     50 ;------------------------------
                           000080    51     ARROW_LEFT=128
                           000081    52     ARROW_RIGHT=129
                           000082    53     HOME=130
                           000083    54     END=131
                           000084    55     SUP=132 
                                     56 
      00AA0E 43 81 44 80 48 82 46    57 convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',END,'3',SUP,0,0
             83 33 84 00 00
                                     58 
                                     59 ;--------------------------------
                                     60 ; receive ANSI ESC 
                                     61 ; sequence and convert it
                                     62 ; to a single character code 
                                     63 ; in range {128..255}
                                     64 ; This is called after receiving 
                                     65 ; ESC character. 
                                     66 ; ignored sequence return 0 
                                     67 ; output:
                                     68 ;   A    converted character 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



                                     69 ;-------------------------------
      00AA1A                         70 get_escape:
      00AA1A CD 83 CB         [ 4]   71     call getc 
      00AA1D A1 5B            [ 1]   72     cp a,#'[ ; this character is expected after ESC 
      00AA1F 27 02            [ 1]   73     jreq 1$
      00AA21 4F               [ 1]   74     clr a
      00AA22 81               [ 4]   75     ret
      00AA23 CD 83 CB         [ 4]   76 1$: call getc 
      00AA26 AE AA 0E         [ 2]   77     ldw x,#convert_table
      00AA29                         78 2$:
      00AA29 F1               [ 1]   79     cp a,(x)
      00AA2A 27 08            [ 1]   80     jreq 4$
      00AA2C 1C 00 02         [ 2]   81     addw x,#2
      00AA2F 7D               [ 1]   82     tnz (x)
      00AA30 26 F7            [ 1]   83     jrne 2$
      00AA32 4F               [ 1]   84     clr a
      00AA33 81               [ 4]   85     ret 
      00AA34 5C               [ 1]   86 4$: incw x 
      00AA35 F6               [ 1]   87     ld a,(x)
      00AA36 A1 84            [ 1]   88     cp a,#SUP
      00AA38 26 05            [ 1]   89     jrne 5$
      00AA3A 88               [ 1]   90     push a 
      00AA3B CD 83 CB         [ 4]   91     call getc
      00AA3E 84               [ 1]   92     pop a 
      00AA3F                         93 5$:
      00AA3F 81               [ 4]   94     ret 
                                     95 
                                     96 
                                     97 ;-----------------------------
                                     98 ; send an ASCIZ string to UART1 
                                     99 ; input: 
                                    100 ;   x 		char * 
                                    101 ; output:
                                    102 ;   none 
                                    103 ;-------------------------------
      00AA40                        104 puts::
      00AA40 F6               [ 1]  105     ld a,(x)
      00AA41 27 06            [ 1]  106 	jreq 1$
      00AA43 CD 83 AB         [ 4]  107 	call putc 
      00AA46 5C               [ 1]  108 	incw x 
      00AA47 20 F7            [ 2]  109 	jra puts 
      00AA49 81               [ 4]  110 1$:	ret 
                                    111 
                                    112 
                                    113 ;---------------------------
                                    114 ; delete character at left 
                                    115 ; of cursor on terminal 
                                    116 ; input:
                                    117 ;   none 
                                    118 ; output:
                                    119 ;	none 
                                    120 ;---------------------------
      00AA4A                        121 bksp:
      00AA4A A6 08            [ 1]  122 	ld a,#BS 
      00AA4C CD 83 AB         [ 4]  123 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      00AA4F A6 20            [ 1]  124 	ld a,#SPACE 
      00AA51 CD 83 AB         [ 4]  125 	call putc 
      00AA54 A6 08            [ 1]  126 	ld a,#BS 
      00AA56 CD 83 AB         [ 4]  127 	call putc 
      00AA59 81               [ 4]  128 	ret 
                                    129 ;---------------------------
                                    130 ; delete n character left of cursor 
                                    131 ; at terminal.
                                    132 ; input: 
                                    133 ;   A   number of characters to delete.
                                    134 ; output:
                                    135 ;    none 
                                    136 ;--------------------------	
      00AA5A                        137 delete_nchar:
      00AA5A 88               [ 1]  138 	push a 
      00AA5B 0D 01            [ 1]  139 0$:	tnz (1,sp)
      00AA5D 27 07            [ 1]  140 	jreq 1$
      00AA5F CD AA 4A         [ 4]  141 	call bksp 
      00AA62 0A 01            [ 1]  142 	dec (1,sp)
      00AA64 20 F5            [ 2]  143 	jra 0$
      00AA66 84               [ 1]  144 1$:	pop a 
      00AA67 81               [ 4]  145 	ret
                                    146 
                                    147 ;--------------------------
                                    148 ; send ANSI escape sequence
                                    149 ; ANSI: ESC[
                                    150 ; note: ESC is ASCII 27
                                    151 ;       [   is ASCII 91  
                                    152 ;-------------------------- 
      00AA68                        153 send_escape:
      00AA68 A6 1B            [ 1]  154 	ld a,#ESC 
      00AA6A CD 83 AB         [ 4]  155 	call putc 
      00AA6D A6 5B            [ 1]  156 	ld a,#'[
      00AA6F CD 83 AB         [ 4]  157 	call putc 
      00AA72 81               [ 4]  158 	ret 
                                    159 
                                    160 ;---------------------
                                    161 ;send ANSI parameter value
                                    162 ; ANSI parameter values are 
                                    163 ; sent as ASCII charater 
                                    164 ; not as binary number.
                                    165 ; this routine 
                                    166 ; convert binary number to 
                                    167 ; ASCII string and send it.
                                    168 ; expected range {0..99}
                                    169 ; input: 
                                    170 ; 	A {0..99} 
                                    171 ; output:
                                    172 ;   none 
                                    173 ;---------------------
      00AA73                        174 send_parameter:
      00AA73 89               [ 2]  175 	pushw x 
      00AA74 5F               [ 1]  176 	clrw x 
      00AA75 97               [ 1]  177 	ld xl,a 
      00AA76 A6 0A            [ 1]  178 	ld a,#10 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



      00AA78 62               [ 2]  179 	div x,a 
      00AA79 95               [ 1]  180 	ld xh,a 
      00AA7A 9F               [ 1]  181 	ld a,xl
      00AA7B 4D               [ 1]  182     tnz a 
      00AA7C 27 0B            [ 1]  183     jreq 2$
      00AA7E A1 09            [ 1]  184 	cp a,#9 
      00AA80 23 02            [ 2]  185 	jrule 1$
      00AA82 A6 39            [ 1]  186 	ld a,#'9
      00AA84                        187 1$:
      00AA84 AB 30            [ 1]  188 	add a,#'0 
      00AA86 CD 83 AB         [ 4]  189 	call putc
      00AA89 9E               [ 1]  190 2$:	ld a,xh 
      00AA8A AB 30            [ 1]  191 	add a,#'0
      00AA8C CD 83 AB         [ 4]  192 	call putc 
      00AA8F 85               [ 2]  193 	popw x 
      00AA90 81               [ 4]  194 	ret 
                                    195 
                                    196 ;--------------------------
                                    197 ; move cursor left n character
                                    198 ; ANSI: ESC[PnD 
                                    199 ; 'Pn' est a numerical parameter
                                    200 ; specifying number of characters 
                                    201 ; displacement.
                                    202 ; input:
                                    203 ;   A     character count
                                    204 ; output:
                                    205 ;   none
                                    206 ;--------------------------
      00AA91                        207 move_left:
      00AA91 88               [ 1]  208 	push a 
      00AA92 CD AA 68         [ 4]  209 	call send_escape
      00AA95 84               [ 1]  210     pop a
      00AA96 CD AA 73         [ 4]  211 	call send_parameter 
      00AA99 A6 44            [ 1]  212 	ld a,#'D 
      00AA9B CD 83 AB         [ 4]  213 	call putc 
      00AA9E 81               [ 4]  214 	ret	
                                    215 
                                    216 
                                    217 ;--------------------------
                                    218 ; move cursor right n character 
                                    219 ; ANSI: ESC[PnC 
                                    220 ; input:
                                    221 ;   A     character count
                                    222 ; output:
                                    223 ;   none
                                    224 ;--------------------------
      00AA9F                        225 move_right:
      00AA9F 88               [ 1]  226 	push a 
      00AAA0 CD AA 68         [ 4]  227 	call send_escape
      00AAA3 84               [ 1]  228     pop a
      00AAA4 CD AA 73         [ 4]  229 	call send_parameter 
      00AAA7 A6 43            [ 1]  230 	ld a,#'C 
      00AAA9 CD 83 AB         [ 4]  231 	call putc 
      00AAAC 81               [ 4]  232 	ret 
                                    233 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    234 
                                    235 ;--------------------------
                                    236 ; print n spaces on terminal
                                    237 ; input:
                                    238 ;  X 		number of spaces 
                                    239 ; output:
                                    240 ;	none 
                                    241 ;---------------------------
      00AAAD                        242 spaces::
      00AAAD A6 20            [ 1]  243 	ld a,#SPACE 
      00AAAF 5D               [ 2]  244 1$:	tnzw x
      00AAB0 27 06            [ 1]  245 	jreq 9$
      00AAB2 CD 83 AB         [ 4]  246 	call putc 
      00AAB5 5A               [ 2]  247 	decw x
      00AAB6 20 F7            [ 2]  248 	jra 1$
      00AAB8                        249 9$: 
      00AAB8 81               [ 4]  250 	ret 
                                    251 
                                    252 ;--------------------------
                                    253 ; insert character in text 
                                    254 ; line 
                                    255 ; input:
                                    256 ;   A       character to insert 
                                    257 ;   xl      line length
                                    258 ;   xh      insert position 
                                    259 ;   Y       line pointer 
                                    260 ; output:
                                    261 ;   Y       updated Y 
                                    262 ;-------------------------
                           000001   263 	IPOS=1
                           000002   264 	CHAR=2 
                           000003   265     LLEN=3 
                           000003   266 	VSISE=3 
      00AAB9                        267 insert_char: 
      0000AB                        268 	_vars VSIZE 
      00AAB9 52 04            [ 2]    1     sub sp,#VSIZE 
      00AABB 6B 02            [ 1]  269     ld (CHAR,sp),a 
      00AABD 9E               [ 1]  270     ld a,xh 
      00AABE 6B 01            [ 1]  271 	ld (IPOS,sp),a
      00AAC0 9F               [ 1]  272     ld a,xl 
      00AAC1 6B 03            [ 1]  273     ld (LLEN,sp),a  
      00AAC3 93               [ 1]  274     ldw x,y
      00AAC4 5C               [ 1]  275     incw x 
      00AAC5 7B 03            [ 1]  276     ld a,(LLEN,sp)
      00AAC7 10 01            [ 1]  277     sub a,(IPOS,sp)
      00AAC9 4C               [ 1]  278     inc a 
      00AACA C7 00 0E         [ 1]  279     ld acc8,a 
      00AACD 72 5F 00 0D      [ 1]  280     clr acc16
      00AAD1 CD 84 DE         [ 4]  281     call move
      00AAD4 90 AE 16 90      [ 2]  282     ldw y,#tib 
      00AAD8 7B 01            [ 1]  283     ld a,(IPOS,sp)
      00AADA C7 00 0E         [ 1]  284     ld acc8,a 
      00AADD 72 B9 00 0D      [ 2]  285     addw y,acc16 
      00AAE1 7B 02            [ 1]  286     ld a,(CHAR,sp)
      00AAE3 90 F7            [ 1]  287     ld (y),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      00AAE5 90 5C            [ 1]  288     incw y  
      00AAE7 7B 01            [ 1]  289     ld a,(IPOS,sp)
      00AAE9 CD AA 91         [ 4]  290     call move_left
      00AAEC AE 16 90         [ 2]  291     ldw x,#tib 
      00AAEF CD AA 40         [ 4]  292     call puts 
      00AAF2 7B 03            [ 1]  293     ld a,(LLEN,sp)
      00AAF4 10 01            [ 1]  294     sub a,(IPOS,sp) 
      00AAF6 CD AA 91         [ 4]  295     call move_left 
      0000EB                        296 	_drop VSIZE 
      00AAF9 5B 04            [ 2]    1     addw sp,#VSIZE 
      00AAFB 81               [ 4]  297 	ret 
                                    298 
                                    299 
                                    300 ;--------------------------
                                    301 ; delete character under cursor
                                    302 ; input:
                                    303 ;   A       line length   
                                    304 ;   xl      delete position
                                    305 ;   Y       line pointer 
                                    306 ;-------------------------
                           000001   307 	CPOS=1
                           000002   308 	LLEN=2
                           000002   309 	VSIZE=2
      00AAFC                        310 delete_under:
      0000EE                        311 	_vars VSIZE 
      00AAFC 52 02            [ 2]    1     sub sp,#VSIZE 
      00AAFE 6B 02            [ 1]  312     ld (LLEN,sp),a 
      00AB00 9F               [ 1]  313     ld a,xl 
      00AB01 6B 01            [ 1]  314     ld (CPOS,sp),a 
      00AB03 93               [ 1]  315     ldw x,y ; move destination
      00AB04 90 5C            [ 1]  316     incw y  ; move source 
      00AB06 7B 02            [ 1]  317     ld a,(LLEN,sp)
      00AB08 10 01            [ 1]  318     sub a,(CPOS,sp)
      00AB0A 4C               [ 1]  319     inc a ; move including zero at end.
      00AB0B C7 00 0E         [ 1]  320     ld acc8,a 
      00AB0E 72 5F 00 0D      [ 1]  321     clr acc16 
      00AB12 CD 84 DE         [ 4]  322 	call move 
      00AB15 90 AE 16 90      [ 2]  323     ldw y,#tib 
      00AB19 7B 01            [ 1]  324     ld a,(CPOS,sp)
      00AB1B C7 00 0E         [ 1]  325     ld acc8,a 
      00AB1E 72 B9 00 0D      [ 2]  326     addw y,acc16 
      00AB22 93               [ 1]  327     ldw x,y 
      00AB23 CD AA 40         [ 4]  328     call puts 
      00AB26 A6 20            [ 1]  329     ld a,#SPACE  
      00AB28 CD 83 AB         [ 4]  330     call putc
      00AB2B 7B 02            [ 1]  331     ld a,(LLEN,sp)
      00AB2D 10 01            [ 1]  332     sub a,(CPOS,sp)
      00AB2F CD AA 91         [ 4]  333     call move_left 
      00AB32 0A 02            [ 1]  334     dec (LLEN,sp)
      000126                        335 	_drop VSIZE 
      00AB34 5B 02            [ 2]    1     addw sp,#VSIZE 
      00AB36 81               [ 4]  336 	ret 
                                    337 
                                    338 ;-----------------------------
                                    339 ; send ANSI sequence to delete
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    340 ; whole line. Cursor position
                                    341 ; is not updated.
                                    342 ; ANSI: ESC[2K
                                    343 ; input:
                                    344 ;   none
                                    345 ; output:
                                    346 ;   none 
                                    347 ;-----------------------------
      00AB37                        348 delete_line:
      00AB37 CD AA 68         [ 4]  349     call send_escape
      00AB3A A6 32            [ 1]  350 	ld a,#'2
      00AB3C CD 83 AB         [ 4]  351 	call putc 
      00AB3F A6 4B            [ 1]  352 	ld a,#'K 
      00AB41 CD 83 AB         [ 4]  353 	call putc 
      00AB44 81               [ 4]  354 	ret 
                                    355 
                                    356 
                                    357 
                                    358 ;------------------------------------
                                    359 ; read a line of text from terminal
                                    360 ;  touches de contrôle
                                    361 ;    BS   efface caractère à gauche 
                                    362 ;    ln+CTRL_E  edit ligne# 'ln' 
                                    363 ;    CTRL_R  répète dernière ligne saisie
                                    364 ;    CTRL_D  supprime ligne 
                                    365 ;    HOME  va au début de la ligne 
                                    366 ;    END  va à la fin de la ligne 
                                    367 ;    ARROW_LEFT  un caractère vers la gauche 
                                    368 ;    ARROW_RIGHT  un caractère vers la droite 
                                    369 ;    CTRL_O  commute entre insert/overwrite
                                    370 ; input:
                                    371 ;	none
                                    372 ; local variable on stack:
                                    373 ;	LL  line length
                                    374 ;   RXCHAR last received character 
                                    375 ; output:
                                    376 ;   text in tib  buffer
                                    377 ;   count  line length 
                                    378 ;------------------------------------
                                    379 	; local variables
                           000001   380 	LL_HB=1
                           000001   381 	RXCHAR = 1 ; last char received
                           000002   382 	LL = 2  ; accepted line length
                           000003   383 	CPOS=3  ; cursor position 
                           000004   384 	OVRWR=4 ; overwrite flag 
                           000004   385 	VSIZE=4 
      00AB45                        386 readln::
      000137                        387 	_vars VSIZE 
      00AB45 52 04            [ 2]    1     sub sp,#VSIZE 
      00AB47 5F               [ 1]  388 	clrw x 
      00AB48 1F 02            [ 2]  389 	ldw (LL,sp),x 
      00AB4A 1F 03            [ 2]  390 	ldw (CPOS,sp),x 
      00AB4C 03 04            [ 1]  391 	cpl (OVRWR,sp) ; default to overwrite mode 
      00AB4E 90 AE 16 90      [ 2]  392  	ldw y,#tib ; input buffer
      00AB52                        393 readln_loop:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      00AB52 CD 83 CB         [ 4]  394 	call getc
      00AB55 6B 01            [ 1]  395 	ld (RXCHAR,sp),a
      00AB57 A1 1B            [ 1]  396     cp a,#ESC 
      00AB59 26 05            [ 1]  397     jrne 0$
      00AB5B CD AA 1A         [ 4]  398     call get_escape 
      00AB5E 6B 01            [ 1]  399     ld (RXCHAR,sp),a 
      00AB60 A1 0D            [ 1]  400 0$:	cp a,#CR
      00AB62 26 03            [ 1]  401 	jrne 1$
      00AB64 CC AC EE         [ 2]  402 	jp readln_quit
      00AB67 A1 0A            [ 1]  403 1$:	cp a,#LF 
      00AB69 26 03            [ 1]  404 	jrne 2$ 
      00AB6B CC AC EE         [ 2]  405 	jp readln_quit
      00AB6E                        406 2$:
      00AB6E A1 08            [ 1]  407 	cp a,#BS
      00AB70 26 12            [ 1]  408 	jrne 3$
                                    409 ; delete left 
      00AB72 0D 03            [ 1]  410     tnz (CPOS,sp)
      00AB74 27 DC            [ 1]  411     jreq readln_loop 
      00AB76 A6 01            [ 1]  412     ld a,#1 
      00AB78 CD AA 91         [ 4]  413     call move_left
      00AB7B 0A 03            [ 1]  414     dec (CPOS,sp)
      00AB7D 90 5A            [ 2]  415     decw y 
      00AB7F 7B 03            [ 1]  416     ld a,(CPOS,sp) 
      00AB81 CC AC 9A         [ 2]  417     jp 12$
      00AB84                        418 3$:
      00AB84 A1 04            [ 1]  419 	cp a,#CTRL_D
      00AB86 26 1A            [ 1]  420 	jrne 4$
                                    421 ;delete line 
      00AB88 CD AB 37         [ 4]  422 	call delete_line 
      00AB8B 7B 03            [ 1]  423     ld a,(CPOS,sp)
      00AB8D 4C               [ 1]  424     inc a 
      00AB8E CD AA 91         [ 4]  425     call move_left 
      00AB91 A6 3E            [ 1]  426 	ld a,#'> 
      00AB93 CD 83 AB         [ 4]  427 	call putc 
      00AB96 90 AE 16 90      [ 2]  428 	ldw y,#tib
      00AB9A 90 7F            [ 1]  429 	clr (y)
      00AB9C 0F 02            [ 1]  430 	clr (LL,sp)
      00AB9E 0F 03            [ 1]  431 	clr (CPOS,sp)
      00ABA0 20 B0            [ 2]  432 	jra readln_loop
      00ABA2                        433 4$:
      00ABA2 A1 12            [ 1]  434 	cp a,#CTRL_R 
      00ABA4 26 21            [ 1]  435 	jrne 5$
                                    436 ;reprint 
      00ABA6 0D 02            [ 1]  437 	tnz (LL,sp)
      00ABA8 26 A8            [ 1]  438 	jrne readln_loop
      00ABAA AE 16 90         [ 2]  439 	ldw x,#tib 
      00ABAD CD 84 B4         [ 4]  440 	call strlen 
      00ABB0 90 AE 16 90      [ 2]  441 	ldw y,#tib 
      00ABB4 27 9C            [ 1]  442 	jreq readln_loop
      00ABB6 6B 02            [ 1]  443 	ld (LL,sp),a 
      00ABB8 6B 03            [ 1]  444     ld (CPOS,sp),a
      00ABBA AE 16 90         [ 2]  445 	ldw x,#tib 
      00ABBD CD AA 40         [ 4]  446 	call puts
      00ABC0 0F 01            [ 1]  447 	clr (LL_HB,sp)
      00ABC2 72 F9 01         [ 2]  448 	addw y,(LL_HB,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      00ABC5 20 8B            [ 2]  449 	jra readln_loop 
      00ABC7                        450 5$:
      00ABC7 A1 05            [ 1]  451 	cp a,#CTRL_E 
      00ABC9 26 49            [ 1]  452 	jrne 6$
                                    453 ;edit line number 
      00ABCB AE 16 90         [ 2]  454 	ldw x,#tib 
      00ABCE CD 8E E9         [ 4]  455 	call atoi24
      00ABD1 CE 00 0D         [ 2]  456 	ldw x,acc16
      00ABD4 CD 85 20         [ 4]  457 	call search_lineno
      00ABD7 5D               [ 2]  458 	tnzw x 
      00ABD8 26 0B            [ 1]  459 	jrne 51$
      00ABDA 0F 02            [ 1]  460 	clr (LL,sp)
      00ABDC 90 AE 16 90      [ 2]  461 	ldw y,#tib
      00ABE0 90 7F            [ 1]  462     clr (y) 	
      00ABE2 CC AC EE         [ 2]  463 	jp readln_quit  
      00ABE5                        464 51$:
      00ABE5 CF 00 05         [ 2]  465 	ldw basicptr,x
      00ABE8 E6 02            [ 1]  466 	ld a,(2,x)
      00ABEA C7 00 04         [ 1]  467 	ld count,a 
      00ABED 90 AE 16 90      [ 2]  468 	ldw y,#tib 
      00ABF1 CD 94 D8         [ 4]  469 	call decompile 
      00ABF4 0F 01            [ 1]  470 	clr (LL_HB,sp)
      00ABF6 A6 0D            [ 1]  471 	ld a,#CR 
      00ABF8 CD 83 AB         [ 4]  472 	call putc 
      00ABFB A6 3E            [ 1]  473 	ld a,#'>
      00ABFD CD 83 AB         [ 4]  474 	call putc
      00AC00 AE 16 90         [ 2]  475     ldw x,#tib  
      00AC03 CD 84 B4         [ 4]  476 	call strlen 
      00AC06 6B 02            [ 1]  477 	ld (LL,sp),a 
      00AC08 CD AA 40         [ 4]  478 	call puts 
      00AC0B 90 93            [ 1]  479 	ldw y,x
      00AC0D 7B 02            [ 1]  480     ld a,(LL,sp)
      00AC0F 6B 03            [ 1]  481     ld (CPOS,sp),a  
      00AC11 CC AB 52         [ 2]  482 	jp readln_loop
      00AC14                        483 6$:
      00AC14 A1 81            [ 1]  484 	cp a,#ARROW_RIGHT
      00AC16 26 15            [ 1]  485    	jrne 7$ 
                                    486 ; right arrow
      00AC18 7B 03            [ 1]  487 	ld a,(CPOS,sp)
      00AC1A 11 02            [ 1]  488     cp a,(LL,sp)
      00AC1C 2B 03            [ 1]  489     jrmi 61$
      00AC1E CC AB 52         [ 2]  490     jp readln_loop 
      00AC21                        491 61$:
      00AC21 A6 01            [ 1]  492     ld a,#1 
      00AC23 CD AA 9F         [ 4]  493 	call move_right 
      00AC26 0C 03            [ 1]  494 	inc (CPOS,sp)
      00AC28 90 5C            [ 1]  495     incw y 
      00AC2A CC AB 52         [ 2]  496     jp readln_loop 
      00AC2D A1 80            [ 1]  497 7$: cp a,#ARROW_LEFT  
      00AC2F 26 13            [ 1]  498 	jrne 8$
                                    499 ; left arrow 
      00AC31 0D 03            [ 1]  500 	tnz (CPOS,sp)
      00AC33 26 03            [ 1]  501 	jrne 71$
      00AC35 CC AB 52         [ 2]  502 	jp readln_loop
      00AC38                        503 71$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      00AC38 A6 01            [ 1]  504     ld a,#1 
      00AC3A CD AA 91         [ 4]  505 	call move_left 
      00AC3D 0A 03            [ 1]  506 	dec (CPOS,sp)
      00AC3F 90 5A            [ 2]  507     decw y 
      00AC41 CC AB 52         [ 2]  508 	jp readln_loop 
      00AC44 A1 82            [ 1]  509 8$: cp a,#HOME  
      00AC46 26 0E            [ 1]  510 	jrne 9$
                                    511 ; HOME 
      00AC48 7B 03            [ 1]  512     ld a,(CPOS,sp)
      00AC4A CD AA 91         [ 4]  513     call move_left 
      00AC4D 0F 03            [ 1]  514 	clr (CPOS,sp)
      00AC4F 90 AE 16 90      [ 2]  515     ldw y,#tib 
      00AC53 CC AB 52         [ 2]  516 	jp readln_loop  
      00AC56 A1 83            [ 1]  517 9$: cp a,#END  
      00AC58 26 26            [ 1]  518 	jrne 10$
                                    519 ; END 
      00AC5A 7B 03            [ 1]  520 	ld a,(CPOS,sp)
      00AC5C 11 02            [ 1]  521 	cp a,(LL,sp)
      00AC5E 26 03            [ 1]  522 	jrne 91$
      00AC60 CC AB 52         [ 2]  523 	jp readln_loop 
      00AC63                        524 91$:
      00AC63 7B 02            [ 1]  525 	ld a,(LL,sp)
      00AC65 10 03            [ 1]  526 	sub a,(CPOS,sp)
      00AC67 CD AA 9F         [ 4]  527 	call move_right 
      00AC6A 7B 02            [ 1]  528 	ld a,(LL,sp)
      00AC6C 6B 03            [ 1]  529 	ld (CPOS,sp),a
      00AC6E 90 AE 16 90      [ 2]  530     ldw y,#tib
      00AC72 72 5F 00 0D      [ 1]  531     clr acc16 
      00AC76 C7 00 0E         [ 1]  532     ld acc8,a 
      00AC79 72 B9 00 0D      [ 2]  533     addw y,acc16  
      00AC7D CC AB 52         [ 2]  534 	jp readln_loop 
      00AC80 A1 0F            [ 1]  535 10$: cp a,#CTRL_O
      00AC82 26 0C            [ 1]  536 	jrne 11$ 
                                    537 ; toggle between insert/overwrite
      00AC84 03 04            [ 1]  538 	cpl (OVRWR,sp)
      00AC86 90 89            [ 2]  539 	pushw y 
      00AC88 CD 99 A2         [ 4]  540 	call beep_1khz
      00AC8B 90 85            [ 2]  541 	popw y 
      00AC8D CC AB 52         [ 2]  542 	jp readln_loop 
      00AC90 A1 84            [ 1]  543 11$: cp a,#SUP 
      00AC92 26 11            [ 1]  544     jrne final_test 
                                    545 ; del character under cursor 
      00AC94 7B 03            [ 1]  546     ld a,(CPOS,sp)
      00AC96 11 02            [ 1]  547     cp a,(LL,sp)
      00AC98 2A 08            [ 1]  548     jrpl 13$
      00AC9A                        549 12$:
      00AC9A 97               [ 1]  550     ld xl,a    ; cursor position 
      00AC9B 7B 02            [ 1]  551     ld a,(LL,sp)  ; line length
      00AC9D CD AA FC         [ 4]  552     call delete_under
      00ACA0 0A 02            [ 1]  553     dec (LLEN,sp)
      00ACA2                        554 13$:
      00ACA2 CC AB 52         [ 2]  555     jp readln_loop 
      00ACA5                        556 final_test:
      00ACA5 A1 20            [ 1]  557 	cp a,#SPACE
      00ACA7 2A 03            [ 1]  558 	jrpl accept_char
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      00ACA9 CC AB 52         [ 2]  559 	jp readln_loop
      00ACAC                        560 accept_char:
      00ACAC A6 4F            [ 1]  561 	ld a,#TIB_SIZE-1
      00ACAE 11 02            [ 1]  562 	cp a, (LL,sp)
      00ACB0 2A 03            [ 1]  563 	jrpl 1$
      00ACB2 CC AB 52         [ 2]  564 	jp readln_loop
      00ACB5 0D 04            [ 1]  565 1$:	tnz (OVRWR,sp)
      00ACB7 26 18            [ 1]  566 	jrne overwrite
                                    567 ; insert mode 
      00ACB9 7B 03            [ 1]  568     ld a,(CPOS,sp)
      00ACBB 11 02            [ 1]  569     cp a,(LL,sp)
      00ACBD 27 12            [ 1]  570     jreq overwrite
      00ACBF 7B 02            [ 1]  571     ld a,(LL,sp)
      00ACC1 97               [ 1]  572     ld xl,a 
      00ACC2 7B 03            [ 1]  573     ld a,(CPOS,sp)
      00ACC4 95               [ 1]  574     ld xh,a
      00ACC5 7B 01            [ 1]  575     ld a,(RXCHAR,sp)
      00ACC7 CD AA B9         [ 4]  576     call insert_char
      00ACCA 0C 02            [ 1]  577     inc (LLEN,sp)
      00ACCC 0C 03            [ 1]  578     inc (CPOS,sp)
      00ACCE CC AB 52         [ 2]  579     jp readln_loop 
      00ACD1                        580 overwrite:
      00ACD1 7B 01            [ 1]  581 	ld a,(RXCHAR,sp)
      00ACD3 90 F7            [ 1]  582 	ld (y),a
      00ACD5 90 5C            [ 1]  583     incw y
      00ACD7 CD 83 AB         [ 4]  584     call putc 
      00ACDA 7B 03            [ 1]  585 	ld a,(CPOS,sp)
      00ACDC 11 02            [ 1]  586 	cp a,(LL,sp)
      00ACDE 2B 09            [ 1]  587 	jrmi 1$
      00ACE0 90 7F            [ 1]  588 	clr (y)
      00ACE2 0C 02            [ 1]  589 	inc (LL,sp)
      00ACE4 0C 03            [ 1]  590     inc (CPOS,sp)
      00ACE6 CC AB 52         [ 2]  591 	jp readln_loop 
      00ACE9                        592 1$:	
      00ACE9 0C 03            [ 1]  593 	inc (CPOS,sp)
      00ACEB CC AB 52         [ 2]  594 	jp readln_loop 
      00ACEE                        595 readln_quit:
      00ACEE 90 AE 16 90      [ 2]  596 	ldw y,#tib
      00ACF2 0F 01            [ 1]  597     clr (LL_HB,sp) 
      00ACF4 72 F9 01         [ 2]  598     addw y,(LL_HB,sp)
      00ACF7 90 7F            [ 1]  599     clr (y)
      00ACF9 7B 02            [ 1]  600 	ld a,(LL,sp)
      00ACFB C7 00 04         [ 1]  601 	ld count,a 
      00ACFE A6 0D            [ 1]  602 	ld a,#CR
      00AD00 CD 83 AB         [ 4]  603 	call putc
      0002F5                        604 	_drop VSIZE 
      00AD03 5B 04            [ 2]    1     addw sp,#VSIZE 
      00AD05 81               [ 4]  605 	ret
                                    606 
                                    607 ;------------------------------
                                    608 ; print byte  in hexadecimal 
                                    609 ; on console
                                    610 ; input:
                                    611 ;    A		byte to print
                                    612 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      00AD06                        613 print_hex::
      00AD06 88               [ 1]  614 	push a 
      00AD07 4E               [ 1]  615 	swap a 
      00AD08 CD AD 1D         [ 4]  616 	call to_hex_char 
      00AD0B CD 83 AB         [ 4]  617 	call putc 
      00AD0E 7B 01            [ 1]  618     ld a,(1,sp) 
      00AD10 CD AD 1D         [ 4]  619 	call to_hex_char
      00AD13 CD 83 AB         [ 4]  620 	call putc
      00AD16 A6 20            [ 1]  621 	ld a,#SPACE 
      00AD18 CD 83 AB         [ 4]  622 	call putc 
      00AD1B 84               [ 1]  623 	pop a 
      00AD1C 81               [ 4]  624 	ret 
                                    625 
                                    626 ;----------------------------------
                                    627 ; convert to hexadecimal digit 
                                    628 ; input:
                                    629 ;   A       digit to convert 
                                    630 ; output:
                                    631 ;   A       hexdecimal character 
                                    632 ;----------------------------------
      00AD1D                        633 to_hex_char::
      00AD1D A4 0F            [ 1]  634 	and a,#15 
      00AD1F A1 09            [ 1]  635 	cp a,#9 
      00AD21 23 02            [ 2]  636 	jrule 1$ 
      00AD23 AB 07            [ 1]  637 	add a,#7
      00AD25 AB 30            [ 1]  638 1$: add a,#'0 
      00AD27 81               [ 4]  639 	ret 
                                    640 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     ACK     =  000006     |     ADC_CR1 =  005401 
    ADC_CR1_=  000000     |     ADC_CR1_=  000001     |     ADC_CR1_=  000004 
    ADC_CR1_=  000005     |     ADC_CR1_=  000006     |     ADC_CR2 =  005402 
    ADC_CR2_=  000003     |     ADC_CR2_=  000004     |     ADC_CR2_=  000005 
    ADC_CR2_=  000006     |     ADC_CR2_=  000001     |     ADC_CR3 =  005403 
    ADC_CR3_=  000007     |     ADC_CR3_=  000006     |     ADC_CSR =  005400 
    ADC_CSR_=  000006     |     ADC_CSR_=  000004     |     ADC_CSR_=  000000 
    ADC_CSR_=  000001     |     ADC_CSR_=  000002     |     ADC_CSR_=  000003 
    ADC_CSR_=  000007     |     ADC_CSR_=  000005     |     ADC_DRH =  005404 
    ADC_DRL =  005405     |     ADC_TDRH=  005406     |     ADC_TDRL=  005407 
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
    ARROW_LE=  000080     |     ARROW_RI=  000081     |     AWU_APR =  0050F1 
    AWU_CSR =  0050F0     |     AWU_CSR_=  000004     |     AWU_TBR =  0050F2 
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
    BOOT_ROM=  007FFF     |     BS      =  000008     |     CAN     =  000018 
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
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |     CHAR    =  000002 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]

Symbol Table

    CLK_SWR_=  0000B4     |     CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2 
    CMD_END =  000002     |     COMMA   =  00002C     |     CPOS    =  000003 
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |     CR      =  00000D 
    CTRL_A  =  000001     |     CTRL_B  =  000002     |     CTRL_C  =  000003 
    CTRL_D  =  000004     |     CTRL_E  =  000005     |     CTRL_F  =  000006 
    CTRL_G  =  000007     |     CTRL_H  =  000008     |     CTRL_I  =  000009 
    CTRL_J  =  00000A     |     CTRL_K  =  00000B     |     CTRL_L  =  00000C 
    CTRL_M  =  00000D     |     CTRL_N  =  00000E     |     CTRL_O  =  00000F 
    CTRL_P  =  000010     |     CTRL_Q  =  000011     |     CTRL_R  =  000012 
    CTRL_S  =  000013     |     CTRL_T  =  000014     |     CTRL_U  =  000015 
    CTRL_V  =  000016     |     CTRL_W  =  000017     |     CTRL_X  =  000018 
    CTRL_Y  =  000019     |     CTRL_Z  =  00001A     |     DBG_A   =  000005 
    DBG_CC  =  000006     |     DBG_X   =  000003     |     DBG_Y   =  000001 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |     DEBUG   =  000000     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
    DLE     =  000010     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_S=  000800 
    EM      =  000019     |     END     =  000083     |     ENQ     =  000005 
    EOF     =  0000FF     |     EOT     =  000004     |     ERR_BAD_=  00000A 
    ERR_BUF_=  00000F     |     ERR_CMD_=  000007     |     ERR_DIV0=  000004 
    ERR_DUPL=  000008     |     ERR_MATH=  000003     |     ERR_MEM_=  000001 
    ERR_NONE=  000000     |     ERR_NOT_=  000009     |     ERR_NO_A=  00000B 
    ERR_NO_D=  00000C     |     ERR_NO_F=  00000E     |     ERR_NO_L=  000005 
    ERR_NO_P=  00000D     |     ERR_RUN_=  000006     |     ERR_SYNT=  000002 
    ESC     =  00001B     |     ETB     =  000017     |     ETX     =  000003 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |     FF      =  00000C 
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
    FS      =  00001C     |     F_CFUNC =  000080     |     F_CMD   =  000000 
    F_CONST =  0000C0     |     F_IFUNC =  000040     |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]

Symbol Table

    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
    GS      =  00001D     |     HOME    =  000082     |     HSECNT  =  004809 
    I2C_CCRH=  00521C     |     I2C_CCRH=  000080     |     I2C_CCRH=  0000C0 
    I2C_CCRH=  000080     |     I2C_CCRH=  000000     |     I2C_CCRH=  000001 
    I2C_CCRH=  000000     |     I2C_CCRL=  00521B     |     I2C_CCRL=  00001A 
    I2C_CCRL=  000002     |     I2C_CCRL=  00000D     |     I2C_CCRL=  000050 
    I2C_CCRL=  000090     |     I2C_CCRL=  0000A0     |     I2C_CR1 =  005210 
    I2C_CR1_=  000006     |     I2C_CR1_=  000007     |     I2C_CR1_=  000000 
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
    INP     =  000000     |     INPUT_DI=  000000     |     INPUT_EI=  000001 
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
    IPOS    =  000001     |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
    IWDG_KEY=  000055     |     IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LF      =  00000A     |     LL      =  000002     |     LLEN    =  000002 
    LL_HB   =  000001     |     MATH_OVF=  000000     |     NAFR    =  004804 
    NAK     =  000015     |     NCLKOPT =  004808     |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]

Symbol Table

    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
    OUTP    =  000001     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVRWR   =  000004 
    PA      =  000000     |     PAD_SIZE=  000080     |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
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
    PI_ODR  =  005028     |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |     ROP     =  004800     |     RS      =  00001E 
    RST_SR  =  0050B3     |     RXCHAR  =  000001     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |     SI      =  00000F 
    SO      =  00000E     |     SOH     =  000001     |     SPACE   =  000020 
    SPI_CR1 =  005200     |     SPI_CR1_=  000003     |     SPI_CR1_=  000000 
    SPI_CR1_=  000001     |     SPI_CR1_=  000007     |     SPI_CR1_=  000002 
    SPI_CR1_=  000006     |     SPI_CR2 =  005201     |     SPI_CR2_=  000007 
    SPI_CR2_=  000006     |     SPI_CR2_=  000005     |     SPI_CR2_=  000004 
    SPI_CR2_=  000002     |     SPI_CR2_=  000000     |     SPI_CR2_=  000001 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_SR_B=  000007 
    SPI_SR_C=  000004     |     SPI_SR_M=  000005     |     SPI_SR_O=  000006 
    SPI_SR_R=  000000     |     SPI_SR_T=  000001     |     SPI_SR_W=  000003 
    SPI_TXCR=  005207     |     STX     =  000002     |     SUB     =  00001A 
    SUP     =  000084     |     SWIM_CSR=  007F80     |     SYN     =  000016 
    TAB     =  000009     |     TAB_WIDT=  000004     |     TIB_SIZE=  000050 
    TICK    =  000027     |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
    TIM1_BKR=  00526D     |     TIM1_CCE=  00525C     |     TIM1_CCE=  00525D 
    TIM1_CCM=  005258     |     TIM1_CCM=  000000     |     TIM1_CCM=  000001 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000003 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000003 
    TIM1_CCM=  005259     |     TIM1_CCM=  000000     |     TIM1_CCM=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM1_SMC=  000004     |     TIM1_SMC=  000005     |     TIM1_SMC=  000006 
    TIM1_SR1=  005255     |     TIM1_SR1=  000007     |     TIM1_SR1=  000001 
    TIM1_SR1=  000002     |     TIM1_SR1=  000003     |     TIM1_SR1=  000004 
    TIM1_SR1=  000005     |     TIM1_SR1=  000006     |     TIM1_SR1=  000000 
    TIM1_SR2=  005256     |     TIM1_SR2=  000001     |     TIM1_SR2=  000002 
    TIM1_SR2=  000003     |     TIM1_SR2=  000004     |     TIM2_ARR=  00530D 
    TIM2_ARR=  00530E     |     TIM2_CCE=  005308     |     TIM2_CCE=  000000 
    TIM2_CCE=  000001     |     TIM2_CCE=  000004     |     TIM2_CCE=  000005 
    TIM2_CCE=  005309     |     TIM2_CCM=  005305     |     TIM2_CCM=  005306 
    TIM2_CCM=  005307     |     TIM2_CCM=  000000     |     TIM2_CCM=  000004 
    TIM2_CCM=  000003     |     TIM2_CCR=  00530F     |     TIM2_CCR=  005310 
    TIM2_CCR=  005311     |     TIM2_CCR=  005312     |     TIM2_CCR=  005313 
    TIM2_CCR=  005314     |     TIM2_CNT=  00530A     |     TIM2_CNT=  00530B 
    TIM2_CR1=  005300     |     TIM2_CR1=  000007     |     TIM2_CR1=  000000 
    TIM2_CR1=  000003     |     TIM2_CR1=  000001     |     TIM2_CR1=  000002 
    TIM2_EGR=  005304     |     TIM2_EGR=  000001     |     TIM2_EGR=  000002 
    TIM2_EGR=  000003     |     TIM2_EGR=  000006     |     TIM2_EGR=  000000 
    TIM2_IER=  005301     |     TIM2_PSC=  00530C     |     TIM2_SR1=  005302 
    TIM2_SR2=  005303     |     TIM3_ARR=  00532B     |     TIM3_ARR=  00532C 
    TIM3_CCE=  005327     |     TIM3_CCE=  000000     |     TIM3_CCE=  000001 
    TIM3_CCE=  000004     |     TIM3_CCE=  000005     |     TIM3_CCE=  000000 
    TIM3_CCE=  000001     |     TIM3_CCM=  005325     |     TIM3_CCM=  005326 
    TIM3_CCM=  000000     |     TIM3_CCM=  000004     |     TIM3_CCM=  000003 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]

Symbol Table

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
    TK_ARRAY=  000006     |     TK_CFUNC=  000082     |     TK_CHAR =  000003 
    TK_CMD  =  000080     |     TK_COLON=  000001     |     TK_COMMA=  000009 
    TK_CONST=  000083     |     TK_DIV  =  000021     |     TK_EQUAL=  000032 
    TK_GE   =  000033     |     TK_GRP_A=  000010     |     TK_GRP_M=  000030 
    TK_GRP_M=  000000     |     TK_GRP_M=  000020     |     TK_GRP_R=  000030 
    TK_GT   =  000031     |     TK_IFUNC=  000081     |     TK_INTGR=  000084 
    TK_LE   =  000036     |     TK_LPARE=  000007     |     TK_LT   =  000034 
    TK_MINUS=  000011     |     TK_MOD  =  000022     |     TK_MULT =  000020 
    TK_NE   =  000035     |     TK_NONE =  000000     |     TK_PLUS =  000010 
    TK_QSTR =  000002     |     TK_RPARE=  000008     |     TK_SHARP=  00000A 
    TK_VAR  =  000085     |     UART1   =  000000     |     UART1_BA=  005230 
    UART1_BR=  005232     |     UART1_BR=  005233     |     UART1_CR=  005234 
    UART1_CR=  005235     |     UART1_CR=  005236     |     UART1_CR=  005237 
    UART1_CR=  005238     |     UART1_DR=  005231     |     UART1_GT=  005239 
    UART1_PO=  000000     |     UART1_PS=  00523A     |     UART1_RX=  000004 
    UART1_SR=  005230     |     UART1_TX=  000005     |     UART2   =  000001 
    UART3   =  000002     |     UART3_BA=  005240     |     UART3_BR=  005242 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]

Symbol Table

    UART_SR =  000000     |     UART_SR_=  000001     |     UART_SR_=  000004 
    UART_SR_=  000002     |     UART_SR_=  000003     |     UART_SR_=  000000 
    UART_SR_=  000005     |     UART_SR_=  000006     |     UART_SR_=  000007 
    UBC     =  004801     |     US      =  00001F     |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |     VSISE   =  000003 
    VSIZE   =  000004     |     VT      =  00000B     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XOFF    =  000013     |     XON     =  000011     |     acc16      ****** GX
    acc8       ****** GX  |   1 accept_c   00029E R   |     atoi24     ****** GX
    basicptr   ****** GX  |     beep_1kh   ****** GX  |   1 bksp       00003C R
  1 convert_   000000 R   |     count      ****** GX  |     decompil   ****** GX
  1 delete_l   000129 R   |   1 delete_n   00004C R   |   1 delete_u   0000EE R
  1 final_te   000297 R   |   1 get_esca   00000C R   |     getc       ****** GX
  1 insert_c   0000AB R   |     move       ****** GX  |   1 move_lef   000083 R
  1 move_rig   000091 R   |   1 overwrit   0002C3 R   |   1 print_he   0002F8 GR
    putc       ****** GX  |   1 puts       000032 GR  |   1 readln     000137 GR
  1 readln_l   000144 R   |   1 readln_q   0002E0 R   |     search_l   ****** GX
  1 send_esc   00005A R   |   1 send_par   000065 R   |   1 spaces     00009F GR
    strlen     ****** GX  |     tib        ****** GX  |   1 to_hex_c   00030F GR

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 CODE       size    31A   flags    0

