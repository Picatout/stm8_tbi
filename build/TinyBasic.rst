ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 1.
Hexadecimal [24-Bits]



                                      1 ;;
                                      2 ; Copyright Jacques Deschênes 2019,2020,2021,2022  
                                      3 ; This file is part of stm8_tbi 
                                      4 ;
                                      5 ;     stm8_tbi is free software: you can redistribute it and/or modify
                                      6 ;     it under the terms of the GNU General Public License as published by
                                      7 ;     the Free Software Foundation, either version 3 of the License, or
                                      8 ;     (at your option) any later version.
                                      9 ;
                                     10 ;     stm8_tbi is distributed in the hope that it will be useful,
                                     11 ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                     12 ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                     13 ;     GNU General Public License for more details.
                                     14 ;
                                     15 ;     You should have received a copy of the GNU General Public License
                                     16 ;     along with stm8_tbi.  If not, see <http://www.gnu.org/licenses/>.
                                     17 ;;
                                     18 
                                     19 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     20 ;;; hardware initialisation
                                     21 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
                                     22 
                                     23     .module HW_INIT 
                                     24 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



                                     25     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000001     5 DEBUG=1 ; set to 1 to include debugging code 
                                      6 
                           000000     7 SEPARATE=0 ; set to 1 for 'make separate' 
                                      8 
                                      9 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



                                     26 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                                     27   	.include "inc/nucleo_8s208.inc"
                                      1 ;;
                                      2 ; Copyright Jacques Deschênes 2019 
                                      3 ; This file is part of MONA 
                                      4 ;
                                      5 ;     MONA is free software: you can redistribute it and/or modify
                                      6 ;     it under the terms of the GNU General Public License as published by
                                      7 ;     the Free Software Foundation, either version 3 of the License, or
                                      8 ;     (at your option) any later version.
                                      9 ;
                                     10 ;     MONA is distributed in the hope that it will be useful,
                                     11 ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                     12 ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                     13 ;     GNU General Public License for more details.
                                     14 ;
                                     15 ;     You should have received a copy of the GNU General Public License
                                     16 ;     along with MONA.  If not, see <http://www.gnu.org/licenses/>.
                                     17 ;;
                                     18 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     19 ; NUCLEO-8S208RB board specific definitions
                                     20 ; Date: 2019/10/29
                                     21 ; author: Jacques Deschênes, copyright 2018,2019
                                     22 ; licence: GPLv3
                                     23 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     24 
                                     25 ; mcu on board is stm8s208rbt6
                                     26 
                                     27 ; crystal on board is 8Mhz
                           7A1200    28 FHSE = 8000000
                                     29 
                                     30 ; LED2 is user LED
                                     31 ; connected to PC5 via Q2 -> 2N7002 MOSFET
                           00500A    32 LED2_PORT = 0x500a ;port C  ODR
                           000005    33 LED2_BIT = 5
                           000020    34 LED2_MASK = (1<<LED2_BIT) ;bit 5 mask
                                     35 
                                     36     .macro _led2_on 
                                     37     bset LED2_PORT,#LED2_BIT 
                                     38     .endm 
                                     39 
                                     40     .macro _led2_off 
                                     41     bres LED2_PORT,#LED2_BIT 
                                     42     .endm 
                                     43 
                                     44     .macro _led2_toggle 
                                     45     ld a,LED2_PORT 
                                     46     xor a,#LED2_BIT 
                                     47     ld LED2_PORT,a 
                                     48     .endm 
                                     49      
                                     50 ; B1 on schematic is user button
                                     51 ; connected to PE4
                                     52 ; external pullup resistor R6 4k7 and debounce capacitor C5 100nF
                           005015    53 USR_BTN_PORT = 0x5015 ; port E  IDR
                           000004    54 USR_BTN_BIT = 4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                           000010    55 USR_BTN_MASK = (1<<USR_BTN_BIT) ;bit 4 mask
                                     56 
                                     57 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                     28 	.include "inc/stm8s208.inc"
                                      1 ;;
                                      2 ; Copyright Jacques Deschênes 2019 
                                      3 ; This file is part of MONA 
                                      4 ;
                                      5 ;     MONA is free software: you can redistribute it and/or modify
                                      6 ;     it under the terms of the GNU General Public License as published by
                                      7 ;     the Free Software Foundation, either version 3 of the License, or
                                      8 ;     (at your option) any later version.
                                      9 ;
                                     10 ;     MONA is distributed in the hope that it will be useful,
                                     11 ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                     12 ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                     13 ;     GNU General Public License for more details.
                                     14 ;
                                     15 ;     You should have received a copy of the GNU General Public License
                                     16 ;     along with MONA.  If not, see <http://www.gnu.org/licenses/>.
                                     17 ;;
                                     18 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     19 ; 2019/10/18
                                     20 ; STM8S208RB µC registers map
                                     21 ; sdas source file
                                     22 ; author: Jacques Deschênes, copyright 2018,2019
                                     23 ; licence: GPLv3
                                     24 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     25 	.module stm8s208rb
                                     26 
                                     27 ;;;;;;;;;;;;
                                     28 ; bits
                                     29 ;;;;;;;;;;;;
                           000000    30  BIT0 = 0
                           000001    31  BIT1 = 1
                           000002    32  BIT2 = 2
                           000003    33  BIT3 = 3
                           000004    34  BIT4 = 4
                           000005    35  BIT5 = 5
                           000006    36  BIT6 = 6
                           000007    37  BIT7 = 7
                                     38  	
                                     39 ;;;;;;;;;;;;
                                     40 ; bits masks
                                     41 ;;;;;;;;;;;;
                           000001    42  B0_MASK = (1<<0)
                           000002    43  B1_MASK = (1<<1)
                           000004    44  B2_MASK = (1<<2)
                           000008    45  B3_MASK = (1<<3)
                           000010    46  B4_MASK = (1<<4)
                           000020    47  B5_MASK = (1<<5)
                           000040    48  B6_MASK = (1<<6)
                           000080    49  B7_MASK = (1<<7)
                                     50 
                                     51 ; HSI oscillator frequency 16Mhz
                           F42400    52  FHSI = 16000000
                                     53 ; LSI oscillator frequency 128Khz
                           01F400    54  FLSI = 128000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                     55 
                                     56 ; controller memory regions
                           001800    57  RAM_SIZE = (0x1800) ; 6KB 
                           000800    58  EEPROM_SIZE = (0x800) ; 2KB
                                     59 ; STM8S208RB have 128K flash
                           020000    60  FLASH_SIZE = (0x20000)
                                     61 ; erase block size 
                           000080    62 BLOCK_SIZE=128 
                                     63 
                           000000    64  RAM_BASE = (0)
                           0017FF    65  RAM_END = (RAM_BASE+RAM_SIZE-1)
                           004000    66  EEPROM_BASE = (0x4000)
                           0047FF    67  EEPROM_END = (EEPROM_BASE+EEPROM_SIZE-1)
                           005000    68  SFR_BASE = (0x5000)
                           0057FF    69  SFR_END = (0x57FF)
                           006000    70  BOOT_ROM_BASE = (0x6000)
                           007FFF    71  BOOT_ROM_END = (0x7fff)
                           008000    72  FLASH_BASE = (0x8000)
                           027FFF    73  FLASH_END = (FLASH_BASE+FLASH_SIZE-1)
                           004800    74  OPTION_BASE = (0x4800)
                           000080    75  OPTION_SIZE = (0x80)
                           00487F    76  OPTION_END = (OPTION_BASE+OPTION_SIZE-1)
                           0048CD    77  DEVID_BASE = (0x48CD)
                           0048D8    78  DEVID_END = (0x48D8)
                           007F00    79  DEBUG_BASE = (0X7F00)
                           007FFF    80  DEBUG_END = (0X7FFF)
                                     81 
                                     82 ; options bytes
                                     83 ; this one can be programmed only from SWIM  (ICP)
                           004800    84  OPT0  = (0x4800)
                                     85 ; these can be programmed at runtime (IAP)
                           004801    86  OPT1  = (0x4801)
                           004802    87  NOPT1  = (0x4802)
                           004803    88  OPT2  = (0x4803)
                           004804    89  NOPT2  = (0x4804)
                           004805    90  OPT3  = (0x4805)
                           004806    91  NOPT3  = (0x4806)
                           004807    92  OPT4  = (0x4807)
                           004808    93  NOPT4  = (0x4808)
                           004809    94  OPT5  = (0x4809)
                           00480A    95  NOPT5  = (0x480A)
                           00480B    96  OPT6  = (0x480B)
                           00480C    97  NOPT6 = (0x480C)
                           00480D    98  OPT7 = (0x480D)
                           00480E    99  NOPT7 = (0x480E)
                           00487E   100  OPTBL  = (0x487E)
                           00487F   101  NOPTBL  = (0x487F)
                                    102 ; option registers usage
                                    103 ; read out protection, value 0xAA enable ROP
                           004800   104  ROP = OPT0  
                                    105 ; user boot code, {0..0x3e} 512 bytes row
                           004801   106  UBC = OPT1
                           004802   107  NUBC = NOPT1
                                    108 ; alternate function register
                           004803   109  AFR = OPT2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                           004804   110  NAFR = NOPT2
                                    111 ; miscelinous options
                           004805   112  WDGOPT = OPT3
                           004806   113  NWDGOPT = NOPT3
                                    114 ; clock options
                           004807   115  CLKOPT = OPT4
                           004808   116  NCLKOPT = NOPT4
                                    117 ; HSE clock startup delay
                           004809   118  HSECNT = OPT5
                           00480A   119  NHSECNT = NOPT5
                                    120 ; flash wait state
                           00480D   121 FLASH_WS = OPT7
                           00480E   122 NFLASH_WS = NOPT7
                                    123 
                                    124 ; watchdog options bits
                           000003   125   WDGOPT_LSIEN   =  BIT3
                           000002   126   WDGOPT_IWDG_HW =  BIT2
                           000001   127   WDGOPT_WWDG_HW =  BIT1
                           000000   128   WDGOPT_WWDG_HALT = BIT0
                                    129 ; NWDGOPT bits
                           FFFFFFFC   130   NWDGOPT_LSIEN    = ~BIT3
                           FFFFFFFD   131   NWDGOPT_IWDG_HW  = ~BIT2
                           FFFFFFFE   132   NWDGOPT_WWDG_HW  = ~BIT1
                           FFFFFFFF   133   NWDGOPT_WWDG_HALT = ~BIT0
                                    134 
                                    135 ; CLKOPT bits
                           000003   136  CLKOPT_EXT_CLK  = BIT3
                           000002   137  CLKOPT_CKAWUSEL = BIT2
                           000001   138  CLKOPT_PRS_C1   = BIT1
                           000000   139  CLKOPT_PRS_C0   = BIT0
                                    140 
                                    141 ; AFR option, remapable functions
                           000007   142  AFR7_BEEP    = BIT7
                           000006   143  AFR6_I2C     = BIT6
                           000005   144  AFR5_TIM1    = BIT5
                           000004   145  AFR4_TIM1    = BIT4
                           000003   146  AFR3_TIM1    = BIT3
                           000002   147  AFR2_CCO     = BIT2
                           000001   148  AFR1_TIM2    = BIT1
                           000000   149  AFR0_ADC     = BIT0
                                    150 
                                    151 ; device ID = (read only)
                           0048CD   152  DEVID_XL  = (0x48CD)
                           0048CE   153  DEVID_XH  = (0x48CE)
                           0048CF   154  DEVID_YL  = (0x48CF)
                           0048D0   155  DEVID_YH  = (0x48D0)
                           0048D1   156  DEVID_WAF  = (0x48D1)
                           0048D2   157  DEVID_LOT0  = (0x48D2)
                           0048D3   158  DEVID_LOT1  = (0x48D3)
                           0048D4   159  DEVID_LOT2  = (0x48D4)
                           0048D5   160  DEVID_LOT3  = (0x48D5)
                           0048D6   161  DEVID_LOT4  = (0x48D6)
                           0048D7   162  DEVID_LOT5  = (0x48D7)
                           0048D8   163  DEVID_LOT6  = (0x48D8)
                                    164 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



                                    165 
                           005000   166 GPIO_BASE = (0x5000)
                           000005   167 GPIO_SIZE = (5)
                                    168 ; PORTS SFR OFFSET
                           000000   169 PA = 0
                           000005   170 PB = 5
                           00000A   171 PC = 10
                           00000F   172 PD = 15
                           000014   173 PE = 20
                           000019   174 PF = 25
                           00001E   175 PG = 30
                           000023   176 PH = 35 
                           000028   177 PI = 40 
                                    178 
                                    179 ; GPIO
                                    180 ; gpio register offset to base
                           000000   181  GPIO_ODR = 0
                           000001   182  GPIO_IDR = 1
                           000002   183  GPIO_DDR = 2
                           000003   184  GPIO_CR1 = 3
                           000004   185  GPIO_CR2 = 4
                           005000   186  GPIO_BASE=(0X5000)
                                    187  
                                    188 ; port A
                           005000   189  PA_BASE = (0X5000)
                           005000   190  PA_ODR  = (0x5000)
                           005001   191  PA_IDR  = (0x5001)
                           005002   192  PA_DDR  = (0x5002)
                           005003   193  PA_CR1  = (0x5003)
                           005004   194  PA_CR2  = (0x5004)
                                    195 ; port B
                           005005   196  PB_BASE = (0X5005)
                           005005   197  PB_ODR  = (0x5005)
                           005006   198  PB_IDR  = (0x5006)
                           005007   199  PB_DDR  = (0x5007)
                           005008   200  PB_CR1  = (0x5008)
                           005009   201  PB_CR2  = (0x5009)
                                    202 ; port C
                           00500A   203  PC_BASE = (0X500A)
                           00500A   204  PC_ODR  = (0x500A)
                           00500B   205  PC_IDR  = (0x500B)
                           00500C   206  PC_DDR  = (0x500C)
                           00500D   207  PC_CR1  = (0x500D)
                           00500E   208  PC_CR2  = (0x500E)
                                    209 ; port D
                           00500F   210  PD_BASE = (0X500F)
                           00500F   211  PD_ODR  = (0x500F)
                           005010   212  PD_IDR  = (0x5010)
                           005011   213  PD_DDR  = (0x5011)
                           005012   214  PD_CR1  = (0x5012)
                           005013   215  PD_CR2  = (0x5013)
                                    216 ; port E
                           005014   217  PE_BASE = (0X5014)
                           005014   218  PE_ODR  = (0x5014)
                           005015   219  PE_IDR  = (0x5015)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                           005016   220  PE_DDR  = (0x5016)
                           005017   221  PE_CR1  = (0x5017)
                           005018   222  PE_CR2  = (0x5018)
                                    223 ; port F
                           005019   224  PF_BASE = (0X5019)
                           005019   225  PF_ODR  = (0x5019)
                           00501A   226  PF_IDR  = (0x501A)
                           00501B   227  PF_DDR  = (0x501B)
                           00501C   228  PF_CR1  = (0x501C)
                           00501D   229  PF_CR2  = (0x501D)
                                    230 ; port G
                           00501E   231  PG_BASE = (0X501E)
                           00501E   232  PG_ODR  = (0x501E)
                           00501F   233  PG_IDR  = (0x501F)
                           005020   234  PG_DDR  = (0x5020)
                           005021   235  PG_CR1  = (0x5021)
                           005022   236  PG_CR2  = (0x5022)
                                    237 ; port H not present on LQFP48/LQFP64 package
                           005023   238  PH_BASE = (0X5023)
                           005023   239  PH_ODR  = (0x5023)
                           005024   240  PH_IDR  = (0x5024)
                           005025   241  PH_DDR  = (0x5025)
                           005026   242  PH_CR1  = (0x5026)
                           005027   243  PH_CR2  = (0x5027)
                                    244 ; port I ; only bit 0 on LQFP64 package, not present on LQFP48
                           005028   245  PI_BASE = (0X5028)
                           005028   246  PI_ODR  = (0x5028)
                           005029   247  PI_IDR  = (0x5029)
                           00502A   248  PI_DDR  = (0x502a)
                           00502B   249  PI_CR1  = (0x502b)
                           00502C   250  PI_CR2  = (0x502c)
                                    251 
                                    252 ; input modes CR1
                           000000   253  INPUT_FLOAT = (0) ; no pullup resistor
                           000001   254  INPUT_PULLUP = (1)
                                    255 ; output mode CR1
                           000000   256  OUTPUT_OD = (0) ; open drain
                           000001   257  OUTPUT_PP = (1) ; push pull
                                    258 ; input modes CR2
                           000000   259  INPUT_DI = (0)
                           000001   260  INPUT_EI = (1)
                                    261 ; output speed CR2
                           000000   262  OUTPUT_SLOW = (0)
                           000001   263  OUTPUT_FAST = (1)
                                    264 
                                    265 
                                    266 ; Flash memory
                           000080   267  BLOCK_SIZE=128 
                           00505A   268  FLASH_CR1  = (0x505A)
                           00505B   269  FLASH_CR2  = (0x505B)
                           00505C   270  FLASH_NCR2  = (0x505C)
                           00505D   271  FLASH_FPR  = (0x505D)
                           00505E   272  FLASH_NFPR  = (0x505E)
                           00505F   273  FLASH_IAPSR  = (0x505F)
                           005062   274  FLASH_PUKR  = (0x5062)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                           005064   275  FLASH_DUKR  = (0x5064)
                                    276 ; data memory unlock keys
                           0000AE   277  FLASH_DUKR_KEY1 = (0xae)
                           000056   278  FLASH_DUKR_KEY2 = (0x56)
                                    279 ; flash memory unlock keys
                           000056   280  FLASH_PUKR_KEY1 = (0x56)
                           0000AE   281  FLASH_PUKR_KEY2 = (0xae)
                                    282 ; FLASH_CR1 bits
                           000003   283  FLASH_CR1_HALT = BIT3
                           000002   284  FLASH_CR1_AHALT = BIT2
                           000001   285  FLASH_CR1_IE = BIT1
                           000000   286  FLASH_CR1_FIX = BIT0
                                    287 ; FLASH_CR2 bits
                           000007   288  FLASH_CR2_OPT = BIT7
                           000006   289  FLASH_CR2_WPRG = BIT6
                           000005   290  FLASH_CR2_ERASE = BIT5
                           000004   291  FLASH_CR2_FPRG = BIT4
                           000000   292  FLASH_CR2_PRG = BIT0
                                    293 ; FLASH_FPR bits
                           000005   294  FLASH_FPR_WPB5 = BIT5
                           000004   295  FLASH_FPR_WPB4 = BIT4
                           000003   296  FLASH_FPR_WPB3 = BIT3
                           000002   297  FLASH_FPR_WPB2 = BIT2
                           000001   298  FLASH_FPR_WPB1 = BIT1
                           000000   299  FLASH_FPR_WPB0 = BIT0
                                    300 ; FLASH_NFPR bits
                           000005   301  FLASH_NFPR_NWPB5 = BIT5
                           000004   302  FLASH_NFPR_NWPB4 = BIT4
                           000003   303  FLASH_NFPR_NWPB3 = BIT3
                           000002   304  FLASH_NFPR_NWPB2 = BIT2
                           000001   305  FLASH_NFPR_NWPB1 = BIT1
                           000000   306  FLASH_NFPR_NWPB0 = BIT0
                                    307 ; FLASH_IAPSR bits
                           000006   308  FLASH_IAPSR_HVOFF = BIT6
                           000003   309  FLASH_IAPSR_DUL = BIT3
                           000002   310  FLASH_IAPSR_EOP = BIT2
                           000001   311  FLASH_IAPSR_PUL = BIT1
                           000000   312  FLASH_IAPSR_WR_PG_DIS = BIT0
                                    313 
                                    314 ; Interrupt control
                           0050A0   315  EXTI_CR1  = (0x50A0)
                           0050A1   316  EXTI_CR2  = (0x50A1)
                                    317 
                                    318 ; Reset Status
                           0050B3   319  RST_SR  = (0x50B3)
                                    320 
                                    321 ; Clock Registers
                           0050C0   322  CLK_ICKR  = (0x50c0)
                           0050C1   323  CLK_ECKR  = (0x50c1)
                           0050C3   324  CLK_CMSR  = (0x50C3)
                           0050C4   325  CLK_SWR  = (0x50C4)
                           0050C5   326  CLK_SWCR  = (0x50C5)
                           0050C6   327  CLK_CKDIVR  = (0x50C6)
                           0050C7   328  CLK_PCKENR1  = (0x50C7)
                           0050C8   329  CLK_CSSR  = (0x50C8)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



                           0050C9   330  CLK_CCOR  = (0x50C9)
                           0050CA   331  CLK_PCKENR2  = (0x50CA)
                           0050CC   332  CLK_HSITRIMR  = (0x50CC)
                           0050CD   333  CLK_SWIMCCR  = (0x50CD)
                                    334 
                                    335 ; Peripherals clock gating
                                    336 ; CLK_PCKENR1 
                           000007   337  CLK_PCKENR1_TIM1 = (7)
                           000006   338  CLK_PCKENR1_TIM3 = (6)
                           000005   339  CLK_PCKENR1_TIM2 = (5)
                           000004   340  CLK_PCKENR1_TIM4 = (4)
                           000003   341  CLK_PCKENR1_UART3 = (3)
                           000002   342  CLK_PCKENR1_UART1 = (2)
                           000001   343  CLK_PCKENR1_SPI = (1)
                           000000   344  CLK_PCKENR1_I2C = (0)
                                    345 ; CLK_PCKENR2
                           000007   346  CLK_PCKENR2_CAN = (7)
                           000003   347  CLK_PCKENR2_ADC = (3)
                           000002   348  CLK_PCKENR2_AWU = (2)
                                    349 
                                    350 ; Clock bits
                           000005   351  CLK_ICKR_REGAH = (5)
                           000004   352  CLK_ICKR_LSIRDY = (4)
                           000003   353  CLK_ICKR_LSIEN = (3)
                           000002   354  CLK_ICKR_FHW = (2)
                           000001   355  CLK_ICKR_HSIRDY = (1)
                           000000   356  CLK_ICKR_HSIEN = (0)
                                    357 
                           000001   358  CLK_ECKR_HSERDY = (1)
                           000000   359  CLK_ECKR_HSEEN = (0)
                                    360 ; clock source
                           0000E1   361  CLK_SWR_HSI = 0xE1
                           0000D2   362  CLK_SWR_LSI = 0xD2
                           0000B4   363  CLK_SWR_HSE = 0xB4
                                    364 
                           000003   365  CLK_SWCR_SWIF = (3)
                           000002   366  CLK_SWCR_SWIEN = (2)
                           000001   367  CLK_SWCR_SWEN = (1)
                           000000   368  CLK_SWCR_SWBSY = (0)
                                    369 
                           000004   370  CLK_CKDIVR_HSIDIV1 = (4)
                           000003   371  CLK_CKDIVR_HSIDIV0 = (3)
                           000002   372  CLK_CKDIVR_CPUDIV2 = (2)
                           000001   373  CLK_CKDIVR_CPUDIV1 = (1)
                           000000   374  CLK_CKDIVR_CPUDIV0 = (0)
                                    375 
                                    376 ; Watchdog
                           0050D1   377  WWDG_CR  = (0x50D1)
                           0050D2   378  WWDG_WR  = (0x50D2)
                           0050E0   379  IWDG_KR  = (0x50E0)
                           0050E1   380  IWDG_PR  = (0x50E1)
                           0050E2   381  IWDG_RLR  = (0x50E2)
                           0000CC   382  IWDG_KEY_ENABLE = 0xCC  ; enable IWDG key 
                           0000AA   383  IWDG_KEY_REFRESH = 0xAA ; refresh counter key 
                           000055   384  IWDG_KEY_ACCESS = 0x55 ; write register key 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



                                    385  
                           0050F0   386  AWU_CSR  = (0x50F0)
                           0050F1   387  AWU_APR  = (0x50F1)
                           0050F2   388  AWU_TBR  = (0x50F2)
                           000004   389  AWU_CSR_AWUEN = 4
                                    390 
                                    391 
                                    392 
                                    393 ; Beeper
                                    394 ; beeper output is alternate function AFR7 on PD4
                                    395 ; connected to CN9-6
                           0050F3   396  BEEP_CSR  = (0x50F3)
                           00000F   397  BEEP_PORT = PD
                           000004   398  BEEP_BIT = 4
                           000010   399  BEEP_MASK = B4_MASK
                                    400 
                                    401 ; SPI
                           005200   402  SPI_CR1  = (0x5200)
                           005201   403  SPI_CR2  = (0x5201)
                           005202   404  SPI_ICR  = (0x5202)
                           005203   405  SPI_SR  = (0x5203)
                           005204   406  SPI_DR  = (0x5204)
                           005205   407  SPI_CRCPR  = (0x5205)
                           005206   408  SPI_RXCRCR  = (0x5206)
                           005207   409  SPI_TXCRCR  = (0x5207)
                                    410 
                                    411 ; SPI_CR1 bit fields 
                           000000   412   SPI_CR1_CPHA=0
                           000001   413   SPI_CR1_CPOL=1
                           000002   414   SPI_CR1_MSTR=2
                           000003   415   SPI_CR1_BR=3
                           000006   416   SPI_CR1_SPE=6
                           000007   417   SPI_CR1_LSBFIRST=7
                                    418   
                                    419 ; SPI_CR2 bit fields 
                           000000   420   SPI_CR2_SSI=0
                           000001   421   SPI_CR2_SSM=1
                           000002   422   SPI_CR2_RXONLY=2
                           000004   423   SPI_CR2_CRCNEXT=4
                           000005   424   SPI_CR2_CRCEN=5
                           000006   425   SPI_CR2_BDOE=6
                           000007   426   SPI_CR2_BDM=7  
                                    427 
                                    428 ; SPI_SR bit fields 
                           000000   429   SPI_SR_RXNE=0
                           000001   430   SPI_SR_TXE=1
                           000003   431   SPI_SR_WKUP=3
                           000004   432   SPI_SR_CRCERR=4
                           000005   433   SPI_SR_MODF=5
                           000006   434   SPI_SR_OVR=6
                           000007   435   SPI_SR_BSY=7
                                    436 
                                    437 ; I2C
                           005210   438  I2C_CR1  = (0x5210)
                           005211   439  I2C_CR2  = (0x5211)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



                           005212   440  I2C_FREQR  = (0x5212)
                           005213   441  I2C_OARL  = (0x5213)
                           005214   442  I2C_OARH  = (0x5214)
                           005216   443  I2C_DR  = (0x5216)
                           005217   444  I2C_SR1  = (0x5217)
                           005218   445  I2C_SR2  = (0x5218)
                           005219   446  I2C_SR3  = (0x5219)
                           00521A   447  I2C_ITR  = (0x521A)
                           00521B   448  I2C_CCRL  = (0x521B)
                           00521C   449  I2C_CCRH  = (0x521C)
                           00521D   450  I2C_TRISER  = (0x521D)
                           00521E   451  I2C_PECR  = (0x521E)
                                    452 
                           000007   453  I2C_CR1_NOSTRETCH = (7)
                           000006   454  I2C_CR1_ENGC = (6)
                           000000   455  I2C_CR1_PE = (0)
                                    456 
                           000007   457  I2C_CR2_SWRST = (7)
                           000003   458  I2C_CR2_POS = (3)
                           000002   459  I2C_CR2_ACK = (2)
                           000001   460  I2C_CR2_STOP = (1)
                           000000   461  I2C_CR2_START = (0)
                                    462 
                           000000   463  I2C_OARL_ADD0 = (0)
                                    464 
                           000009   465  I2C_OAR_ADDR_7BIT = ((I2C_OARL & 0xFE) >> 1)
                           000813   466  I2C_OAR_ADDR_10BIT = (((I2C_OARH & 0x06) << 9) | (I2C_OARL & 0xFF))
                                    467 
                           000007   468  I2C_OARH_ADDMODE = (7)
                           000006   469  I2C_OARH_ADDCONF = (6)
                           000002   470  I2C_OARH_ADD9 = (2)
                           000001   471  I2C_OARH_ADD8 = (1)
                                    472 
                           000007   473  I2C_SR1_TXE = (7)
                           000006   474  I2C_SR1_RXNE = (6)
                           000004   475  I2C_SR1_STOPF = (4)
                           000003   476  I2C_SR1_ADD10 = (3)
                           000002   477  I2C_SR1_BTF = (2)
                           000001   478  I2C_SR1_ADDR = (1)
                           000000   479  I2C_SR1_SB = (0)
                                    480 
                           000005   481  I2C_SR2_WUFH = (5)
                           000003   482  I2C_SR2_OVR = (3)
                           000002   483  I2C_SR2_AF = (2)
                           000001   484  I2C_SR2_ARLO = (1)
                           000000   485  I2C_SR2_BERR = (0)
                                    486 
                           000007   487  I2C_SR3_DUALF = (7)
                           000004   488  I2C_SR3_GENCALL = (4)
                           000002   489  I2C_SR3_TRA = (2)
                           000001   490  I2C_SR3_BUSY = (1)
                           000000   491  I2C_SR3_MSL = (0)
                                    492 
                           000002   493  I2C_ITR_ITBUFEN = (2)
                           000001   494  I2C_ITR_ITEVTEN = (1)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



                           000000   495  I2C_ITR_ITERREN = (0)
                                    496 
                                    497 ; Precalculated values, all in KHz
                           000080   498  I2C_CCRH_16MHZ_FAST_400 = 0x80
                           00000D   499  I2C_CCRL_16MHZ_FAST_400 = 0x0D
                                    500 ;
                                    501 ; Fast I2C mode max rise time = 300ns
                                    502 ; I2C_FREQR = 16 = (MHz) => tMASTER = 1/16 = 62.5 ns
                                    503 ; TRISER = = (300/62.5) + 1 = floor(4.8) + 1 = 5.
                                    504 
                           000005   505  I2C_TRISER_16MHZ_FAST_400 = 0x05
                                    506 
                           0000C0   507  I2C_CCRH_16MHZ_FAST_320 = 0xC0
                           000002   508  I2C_CCRL_16MHZ_FAST_320 = 0x02
                           000005   509  I2C_TRISER_16MHZ_FAST_320 = 0x05
                                    510 
                           000080   511  I2C_CCRH_16MHZ_FAST_200 = 0x80
                           00001A   512  I2C_CCRL_16MHZ_FAST_200 = 0x1A
                           000005   513  I2C_TRISER_16MHZ_FAST_200 = 0x05
                                    514 
                           000000   515  I2C_CCRH_16MHZ_STD_100 = 0x00
                           000050   516  I2C_CCRL_16MHZ_STD_100 = 0x50
                                    517 ;
                                    518 ; Standard I2C mode max rise time = 1000ns
                                    519 ; I2C_FREQR = 16 = (MHz) => tMASTER = 1/16 = 62.5 ns
                                    520 ; TRISER = = (1000/62.5) + 1 = floor(16) + 1 = 17.
                                    521 
                           000011   522  I2C_TRISER_16MHZ_STD_100 = 0x11
                                    523 
                           000000   524  I2C_CCRH_16MHZ_STD_50 = 0x00
                           0000A0   525  I2C_CCRL_16MHZ_STD_50 = 0xA0
                           000011   526  I2C_TRISER_16MHZ_STD_50 = 0x11
                                    527 
                           000001   528  I2C_CCRH_16MHZ_STD_20 = 0x01
                           000090   529  I2C_CCRL_16MHZ_STD_20 = 0x90
                           000011   530  I2C_TRISER_16MHZ_STD_20 = 0x11;
                                    531 
                           000001   532  I2C_READ = 1
                           000000   533  I2C_WRITE = 0
                                    534 
                                    535 ; baudrate constant for brr_value table access
                                    536 ; to be used by uart_init 
                           000000   537 B2400=0
                           000001   538 B4800=1
                           000002   539 B9600=2
                           000003   540 B19200=3
                           000004   541 B38400=4
                           000005   542 B57600=5
                           000006   543 B115200=6
                           000007   544 B230400=7
                           000008   545 B460800=8
                           000009   546 B921600=9
                                    547 
                                    548 ; UART registers offset from
                                    549 ; base address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                           000000   550 UART_SR=0
                           000001   551 UART_DR=1
                           000002   552 UART_BRR1=2
                           000003   553 UART_BRR2=3
                           000004   554 UART_CR1=4
                           000005   555 UART_CR2=5
                           000006   556 UART_CR3=6
                           000007   557 UART_CR4=7
                           000008   558 UART_CR5=8
                           000009   559 UART_CR6=9
                           000009   560 UART_GTR=9
                           00000A   561 UART_PSCR=10
                                    562 
                                    563 ; uart identifier
                           000000   564  UART1 = 0 
                           000001   565  UART2 = 1
                           000002   566  UART3 = 2
                                    567 
                                    568 ; pins used by uart 
                           000005   569 UART1_TX_PIN=BIT5
                           000004   570 UART1_RX_PIN=BIT4
                           000005   571 UART3_TX_PIN=BIT5
                           000006   572 UART3_RX_PIN=BIT6
                                    573 ; uart port base address 
                           000000   574 UART1_PORT=PA 
                           00000F   575 UART3_PORT=PD
                                    576 
                                    577 ; UART1 
                           005230   578  UART1_BASE  = (0x5230)
                           005230   579  UART1_SR    = (0x5230)
                           005231   580  UART1_DR    = (0x5231)
                           005232   581  UART1_BRR1  = (0x5232)
                           005233   582  UART1_BRR2  = (0x5233)
                           005234   583  UART1_CR1   = (0x5234)
                           005235   584  UART1_CR2   = (0x5235)
                           005236   585  UART1_CR3   = (0x5236)
                           005237   586  UART1_CR4   = (0x5237)
                           005238   587  UART1_CR5   = (0x5238)
                           005239   588  UART1_GTR   = (0x5239)
                           00523A   589  UART1_PSCR  = (0x523A)
                                    590 
                                    591 ; UART3
                           005240   592  UART3_BASE  = (0x5240)
                           005240   593  UART3_SR    = (0x5240)
                           005241   594  UART3_DR    = (0x5241)
                           005242   595  UART3_BRR1  = (0x5242)
                           005243   596  UART3_BRR2  = (0x5243)
                           005244   597  UART3_CR1   = (0x5244)
                           005245   598  UART3_CR2   = (0x5245)
                           005246   599  UART3_CR3   = (0x5246)
                           005247   600  UART3_CR4   = (0x5247)
                           004249   601  UART3_CR6   = (0x4249)
                                    602 
                                    603 ; UART Status Register bits
                           000007   604  UART_SR_TXE = (7)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



                           000006   605  UART_SR_TC = (6)
                           000005   606  UART_SR_RXNE = (5)
                           000004   607  UART_SR_IDLE = (4)
                           000003   608  UART_SR_OR = (3)
                           000002   609  UART_SR_NF = (2)
                           000001   610  UART_SR_FE = (1)
                           000000   611  UART_SR_PE = (0)
                                    612 
                                    613 ; Uart Control Register bits
                           000007   614  UART_CR1_R8 = (7)
                           000006   615  UART_CR1_T8 = (6)
                           000005   616  UART_CR1_UARTD = (5)
                           000004   617  UART_CR1_M = (4)
                           000003   618  UART_CR1_WAKE = (3)
                           000002   619  UART_CR1_PCEN = (2)
                           000001   620  UART_CR1_PS = (1)
                           000000   621  UART_CR1_PIEN = (0)
                                    622 
                           000007   623  UART_CR2_TIEN = (7)
                           000006   624  UART_CR2_TCIEN = (6)
                           000005   625  UART_CR2_RIEN = (5)
                           000004   626  UART_CR2_ILIEN = (4)
                           000003   627  UART_CR2_TEN = (3)
                           000002   628  UART_CR2_REN = (2)
                           000001   629  UART_CR2_RWU = (1)
                           000000   630  UART_CR2_SBK = (0)
                                    631 
                           000006   632  UART_CR3_LINEN = (6)
                           000005   633  UART_CR3_STOP1 = (5)
                           000004   634  UART_CR3_STOP0 = (4)
                           000003   635  UART_CR3_CLKEN = (3)
                           000002   636  UART_CR3_CPOL = (2)
                           000001   637  UART_CR3_CPHA = (1)
                           000000   638  UART_CR3_LBCL = (0)
                                    639 
                           000006   640  UART_CR4_LBDIEN = (6)
                           000005   641  UART_CR4_LBDL = (5)
                           000004   642  UART_CR4_LBDF = (4)
                           000003   643  UART_CR4_ADD3 = (3)
                           000002   644  UART_CR4_ADD2 = (2)
                           000001   645  UART_CR4_ADD1 = (1)
                           000000   646  UART_CR4_ADD0 = (0)
                                    647 
                           000005   648  UART_CR5_SCEN = (5)
                           000004   649  UART_CR5_NACK = (4)
                           000003   650  UART_CR5_HDSEL = (3)
                           000002   651  UART_CR5_IRLP = (2)
                           000001   652  UART_CR5_IREN = (1)
                                    653 ; LIN mode config register
                           000007   654  UART_CR6_LDUM = (7)
                           000005   655  UART_CR6_LSLV = (5)
                           000004   656  UART_CR6_LASE = (4)
                           000002   657  UART_CR6_LHDIEN = (2) 
                           000001   658  UART_CR6_LHDF = (1)
                           000000   659  UART_CR6_LSF = (0)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



                                    660 
                                    661 ; TIMERS
                                    662 ; Timer 1 - 16-bit timer with complementary PWM outputs
                           005250   663  TIM1_CR1  = (0x5250)
                           005251   664  TIM1_CR2  = (0x5251)
                           005252   665  TIM1_SMCR  = (0x5252)
                           005253   666  TIM1_ETR  = (0x5253)
                           005254   667  TIM1_IER  = (0x5254)
                           005255   668  TIM1_SR1  = (0x5255)
                           005256   669  TIM1_SR2  = (0x5256)
                           005257   670  TIM1_EGR  = (0x5257)
                           005258   671  TIM1_CCMR1  = (0x5258)
                           005259   672  TIM1_CCMR2  = (0x5259)
                           00525A   673  TIM1_CCMR3  = (0x525A)
                           00525B   674  TIM1_CCMR4  = (0x525B)
                           00525C   675  TIM1_CCER1  = (0x525C)
                           00525D   676  TIM1_CCER2  = (0x525D)
                           00525E   677  TIM1_CNTRH  = (0x525E)
                           00525F   678  TIM1_CNTRL  = (0x525F)
                           005260   679  TIM1_PSCRH  = (0x5260)
                           005261   680  TIM1_PSCRL  = (0x5261)
                           005262   681  TIM1_ARRH  = (0x5262)
                           005263   682  TIM1_ARRL  = (0x5263)
                           005264   683  TIM1_RCR  = (0x5264)
                           005265   684  TIM1_CCR1H  = (0x5265)
                           005266   685  TIM1_CCR1L  = (0x5266)
                           005267   686  TIM1_CCR2H  = (0x5267)
                           005268   687  TIM1_CCR2L  = (0x5268)
                           005269   688  TIM1_CCR3H  = (0x5269)
                           00526A   689  TIM1_CCR3L  = (0x526A)
                           00526B   690  TIM1_CCR4H  = (0x526B)
                           00526C   691  TIM1_CCR4L  = (0x526C)
                           00526D   692  TIM1_BKR  = (0x526D)
                           00526E   693  TIM1_DTR  = (0x526E)
                           00526F   694  TIM1_OISR  = (0x526F)
                                    695 
                                    696 ; Timer Control Register bits
                           000007   697  TIM_CR1_ARPE = (7)
                           000006   698  TIM_CR1_CMSH = (6)
                           000005   699  TIM_CR1_CMSL = (5)
                           000004   700  TIM_CR1_DIR = (4)
                           000003   701  TIM_CR1_OPM = (3)
                           000002   702  TIM_CR1_URS = (2)
                           000001   703  TIM_CR1_UDIS = (1)
                           000000   704  TIM_CR1_CEN = (0)
                                    705 
                           000006   706  TIM1_CR2_MMS2 = (6)
                           000005   707  TIM1_CR2_MMS1 = (5)
                           000004   708  TIM1_CR2_MMS0 = (4)
                           000002   709  TIM1_CR2_COMS = (2)
                           000000   710  TIM1_CR2_CCPC = (0)
                                    711 
                                    712 ; Timer Slave Mode Control bits
                           000007   713  TIM1_SMCR_MSM = (7)
                           000006   714  TIM1_SMCR_TS2 = (6)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



                           000005   715  TIM1_SMCR_TS1 = (5)
                           000004   716  TIM1_SMCR_TS0 = (4)
                           000002   717  TIM1_SMCR_SMS2 = (2)
                           000001   718  TIM1_SMCR_SMS1 = (1)
                           000000   719  TIM1_SMCR_SMS0 = (0)
                                    720 
                                    721 ; Timer External Trigger Enable bits
                           000007   722  TIM1_ETR_ETP = (7)
                           000006   723  TIM1_ETR_ECE = (6)
                           000005   724  TIM1_ETR_ETPS1 = (5)
                           000004   725  TIM1_ETR_ETPS0 = (4)
                           000003   726  TIM1_ETR_ETF3 = (3)
                           000002   727  TIM1_ETR_ETF2 = (2)
                           000001   728  TIM1_ETR_ETF1 = (1)
                           000000   729  TIM1_ETR_ETF0 = (0)
                                    730 
                                    731 ; Timer Interrupt Enable bits
                           000007   732  TIM1_IER_BIE = (7)
                           000006   733  TIM1_IER_TIE = (6)
                           000005   734  TIM1_IER_COMIE = (5)
                           000004   735  TIM1_IER_CC4IE = (4)
                           000003   736  TIM1_IER_CC3IE = (3)
                           000002   737  TIM1_IER_CC2IE = (2)
                           000001   738  TIM1_IER_CC1IE = (1)
                           000000   739  TIM1_IER_UIE = (0)
                                    740 
                                    741 ; Timer Status Register bits
                           000007   742  TIM1_SR1_BIF = (7)
                           000006   743  TIM1_SR1_TIF = (6)
                           000005   744  TIM1_SR1_COMIF = (5)
                           000004   745  TIM1_SR1_CC4IF = (4)
                           000003   746  TIM1_SR1_CC3IF = (3)
                           000002   747  TIM1_SR1_CC2IF = (2)
                           000001   748  TIM1_SR1_CC1IF = (1)
                           000000   749  TIM1_SR1_UIF = (0)
                                    750 
                           000004   751  TIM1_SR2_CC4OF = (4)
                           000003   752  TIM1_SR2_CC3OF = (3)
                           000002   753  TIM1_SR2_CC2OF = (2)
                           000001   754  TIM1_SR2_CC1OF = (1)
                                    755 
                                    756 ; Timer Event Generation Register bits
                           000007   757  TIM1_EGR_BG = (7)
                           000006   758  TIM1_EGR_TG = (6)
                           000005   759  TIM1_EGR_COMG = (5)
                           000004   760  TIM1_EGR_CC4G = (4)
                           000003   761  TIM1_EGR_CC3G = (3)
                           000002   762  TIM1_EGR_CC2G = (2)
                           000001   763  TIM1_EGR_CC1G = (1)
                           000000   764  TIM1_EGR_UG = (0)
                                    765 
                                    766 ; Capture/Compare Mode Register 1 - channel configured in output
                           000007   767  TIM1_CCMR1_OC1CE = (7)
                           000006   768  TIM1_CCMR1_OC1M2 = (6)
                           000005   769  TIM1_CCMR1_OC1M1 = (5)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



                           000004   770  TIM1_CCMR1_OC1M0 = (4)
                           000003   771  TIM1_CCMR1_OC1PE = (3)
                           000002   772  TIM1_CCMR1_OC1FE = (2)
                           000001   773  TIM1_CCMR1_CC1S1 = (1)
                           000000   774  TIM1_CCMR1_CC1S0 = (0)
                                    775 
                                    776 ; Capture/Compare Mode Register 1 - channel configured in input
                           000007   777  TIM1_CCMR1_IC1F3 = (7)
                           000006   778  TIM1_CCMR1_IC1F2 = (6)
                           000005   779  TIM1_CCMR1_IC1F1 = (5)
                           000004   780  TIM1_CCMR1_IC1F0 = (4)
                           000003   781  TIM1_CCMR1_IC1PSC1 = (3)
                           000002   782  TIM1_CCMR1_IC1PSC0 = (2)
                                    783 ;  TIM1_CCMR1_CC1S1 = (1)
                           000000   784  TIM1_CCMR1_CC1S0 = (0)
                                    785 
                                    786 ; Capture/Compare Mode Register 2 - channel configured in output
                           000007   787  TIM1_CCMR2_OC2CE = (7)
                           000006   788  TIM1_CCMR2_OC2M2 = (6)
                           000005   789  TIM1_CCMR2_OC2M1 = (5)
                           000004   790  TIM1_CCMR2_OC2M0 = (4)
                           000003   791  TIM1_CCMR2_OC2PE = (3)
                           000002   792  TIM1_CCMR2_OC2FE = (2)
                           000001   793  TIM1_CCMR2_CC2S1 = (1)
                           000000   794  TIM1_CCMR2_CC2S0 = (0)
                                    795 
                                    796 ; Capture/Compare Mode Register 2 - channel configured in input
                           000007   797  TIM1_CCMR2_IC2F3 = (7)
                           000006   798  TIM1_CCMR2_IC2F2 = (6)
                           000005   799  TIM1_CCMR2_IC2F1 = (5)
                           000004   800  TIM1_CCMR2_IC2F0 = (4)
                           000003   801  TIM1_CCMR2_IC2PSC1 = (3)
                           000002   802  TIM1_CCMR2_IC2PSC0 = (2)
                                    803 ;  TIM1_CCMR2_CC2S1 = (1)
                           000000   804  TIM1_CCMR2_CC2S0 = (0)
                                    805 
                                    806 ; Capture/Compare Mode Register 3 - channel configured in output
                           000007   807  TIM1_CCMR3_OC3CE = (7)
                           000006   808  TIM1_CCMR3_OC3M2 = (6)
                           000005   809  TIM1_CCMR3_OC3M1 = (5)
                           000004   810  TIM1_CCMR3_OC3M0 = (4)
                           000003   811  TIM1_CCMR3_OC3PE = (3)
                           000002   812  TIM1_CCMR3_OC3FE = (2)
                           000001   813  TIM1_CCMR3_CC3S1 = (1)
                           000000   814  TIM1_CCMR3_CC3S0 = (0)
                                    815 
                                    816 ; Capture/Compare Mode Register 3 - channel configured in input
                           000007   817  TIM1_CCMR3_IC3F3 = (7)
                           000006   818  TIM1_CCMR3_IC3F2 = (6)
                           000005   819  TIM1_CCMR3_IC3F1 = (5)
                           000004   820  TIM1_CCMR3_IC3F0 = (4)
                           000003   821  TIM1_CCMR3_IC3PSC1 = (3)
                           000002   822  TIM1_CCMR3_IC3PSC0 = (2)
                                    823 ;  TIM1_CCMR3_CC3S1 = (1)
                           000000   824  TIM1_CCMR3_CC3S0 = (0)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



                                    825 
                                    826 ; Capture/Compare Mode Register 4 - channel configured in output
                           000007   827  TIM1_CCMR4_OC4CE = (7)
                           000006   828  TIM1_CCMR4_OC4M2 = (6)
                           000005   829  TIM1_CCMR4_OC4M1 = (5)
                           000004   830  TIM1_CCMR4_OC4M0 = (4)
                           000003   831  TIM1_CCMR4_OC4PE = (3)
                           000002   832  TIM1_CCMR4_OC4FE = (2)
                           000001   833  TIM1_CCMR4_CC4S1 = (1)
                           000000   834  TIM1_CCMR4_CC4S0 = (0)
                                    835 
                                    836 ; Capture/Compare Mode Register 4 - channel configured in input
                           000007   837  TIM1_CCMR4_IC4F3 = (7)
                           000006   838  TIM1_CCMR4_IC4F2 = (6)
                           000005   839  TIM1_CCMR4_IC4F1 = (5)
                           000004   840  TIM1_CCMR4_IC4F0 = (4)
                           000003   841  TIM1_CCMR4_IC4PSC1 = (3)
                           000002   842  TIM1_CCMR4_IC4PSC0 = (2)
                                    843 ;  TIM1_CCMR4_CC4S1 = (1)
                           000000   844  TIM1_CCMR4_CC4S0 = (0)
                                    845 
                                    846 ; Timer 2 - 16-bit timer
                           005300   847  TIM2_CR1  = (0x5300)
                           005301   848  TIM2_IER  = (0x5301)
                           005302   849  TIM2_SR1  = (0x5302)
                           005303   850  TIM2_SR2  = (0x5303)
                           005304   851  TIM2_EGR  = (0x5304)
                           005305   852  TIM2_CCMR1  = (0x5305)
                           005306   853  TIM2_CCMR2  = (0x5306)
                           005307   854  TIM2_CCMR3  = (0x5307)
                           005308   855  TIM2_CCER1  = (0x5308)
                           005309   856  TIM2_CCER2  = (0x5309)
                           00530A   857  TIM2_CNTRH  = (0x530A)
                           00530B   858  TIM2_CNTRL  = (0x530B)
                           00530C   859  TIM2_PSCR  = (0x530C)
                           00530D   860  TIM2_ARRH  = (0x530D)
                           00530E   861  TIM2_ARRL  = (0x530E)
                           00530F   862  TIM2_CCR1H  = (0x530F)
                           005310   863  TIM2_CCR1L  = (0x5310)
                           005311   864  TIM2_CCR2H  = (0x5311)
                           005312   865  TIM2_CCR2L  = (0x5312)
                           005313   866  TIM2_CCR3H  = (0x5313)
                           005314   867  TIM2_CCR3L  = (0x5314)
                                    868 
                                    869 ; TIM2_CR1 bitfields
                           000000   870  TIM2_CR1_CEN=(0) ; Counter enable
                           000001   871  TIM2_CR1_UDIS=(1) ; Update disable
                           000002   872  TIM2_CR1_URS=(2) ; Update request source
                           000003   873  TIM2_CR1_OPM=(3) ; One-pulse mode
                           000007   874  TIM2_CR1_ARPE=(7) ; Auto-reload preload enable
                                    875 
                                    876 ; TIMER2_CCMR bitfields 
                           000000   877  TIM2_CCMR_CCS=(0) ; input/output select
                           000003   878  TIM2_CCMR_OCPE=(3) ; preload enable
                           000004   879  TIM2_CCMR_OCM=(4)  ; output compare mode 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                    880 
                                    881 ; TIMER2_CCER1 bitfields
                           000000   882  TIM2_CCER1_CC1E=(0)
                           000001   883  TIM2_CCER1_CC1P=(1)
                           000004   884  TIM2_CCER1_CC2E=(4)
                           000005   885  TIM2_CCER1_CC2P=(5)
                                    886 
                                    887 ; TIMER2_EGR bitfields
                           000000   888  TIM2_EGR_UG=(0) ; update generation
                           000001   889  TIM2_EGR_CC1G=(1) ; Capture/compare 1 generation
                           000002   890  TIM2_EGR_CC2G=(2) ; Capture/compare 2 generation
                           000003   891  TIM2_EGR_CC3G=(3) ; Capture/compare 3 generation
                           000006   892  TIM2_EGR_TG=(6); Trigger generation
                                    893 
                                    894 ; Timer 3
                           005320   895  TIM3_CR1  = (0x5320)
                           005321   896  TIM3_IER  = (0x5321)
                           005322   897  TIM3_SR1  = (0x5322)
                           005323   898  TIM3_SR2  = (0x5323)
                           005324   899  TIM3_EGR  = (0x5324)
                           005325   900  TIM3_CCMR1  = (0x5325)
                           005326   901  TIM3_CCMR2  = (0x5326)
                           005327   902  TIM3_CCER1  = (0x5327)
                           005328   903  TIM3_CNTRH  = (0x5328)
                           005329   904  TIM3_CNTRL  = (0x5329)
                           00532A   905  TIM3_PSCR  = (0x532A)
                           00532B   906  TIM3_ARRH  = (0x532B)
                           00532C   907  TIM3_ARRL  = (0x532C)
                           00532D   908  TIM3_CCR1H  = (0x532D)
                           00532E   909  TIM3_CCR1L  = (0x532E)
                           00532F   910  TIM3_CCR2H  = (0x532F)
                           005330   911  TIM3_CCR2L  = (0x5330)
                                    912 
                                    913 ; TIM3_CR1  fields
                           000000   914  TIM3_CR1_CEN = (0)
                           000001   915  TIM3_CR1_UDIS = (1)
                           000002   916  TIM3_CR1_URS = (2)
                           000003   917  TIM3_CR1_OPM = (3)
                           000007   918  TIM3_CR1_ARPE = (7)
                                    919 ; TIM3_CCR2  fields
                           000000   920  TIM3_CCMR2_CC2S_POS = (0)
                           000003   921  TIM3_CCMR2_OC2PE_POS = (3)
                           000004   922  TIM3_CCMR2_OC2M_POS = (4)  
                                    923 ; TIM3_CCER1 fields
                           000000   924  TIM3_CCER1_CC1E = (0)
                           000001   925  TIM3_CCER1_CC1P = (1)
                           000004   926  TIM3_CCER1_CC2E = (4)
                           000005   927  TIM3_CCER1_CC2P = (5)
                                    928 ; TIM3_CCER2 fields
                           000000   929  TIM3_CCER2_CC3E = (0)
                           000001   930  TIM3_CCER2_CC3P = (1)
                                    931 
                                    932 ; Timer 4
                           005340   933  TIM4_CR1  = (0x5340)
                           005341   934  TIM4_IER  = (0x5341)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



                           005342   935  TIM4_SR  = (0x5342)
                           005343   936  TIM4_EGR  = (0x5343)
                           005344   937  TIM4_CNTR  = (0x5344)
                           005345   938  TIM4_PSCR  = (0x5345)
                           005346   939  TIM4_ARR  = (0x5346)
                                    940 
                                    941 ; Timer 4 bitmasks
                                    942 
                           000007   943  TIM4_CR1_ARPE = (7)
                           000003   944  TIM4_CR1_OPM = (3)
                           000002   945  TIM4_CR1_URS = (2)
                           000001   946  TIM4_CR1_UDIS = (1)
                           000000   947  TIM4_CR1_CEN = (0)
                                    948 
                           000000   949  TIM4_IER_UIE = (0)
                                    950 
                           000000   951  TIM4_SR_UIF = (0)
                                    952 
                           000000   953  TIM4_EGR_UG = (0)
                                    954 
                           000002   955  TIM4_PSCR_PSC2 = (2)
                           000001   956  TIM4_PSCR_PSC1 = (1)
                           000000   957  TIM4_PSCR_PSC0 = (0)
                                    958 
                           000000   959  TIM4_PSCR_1 = 0
                           000001   960  TIM4_PSCR_2 = 1
                           000002   961  TIM4_PSCR_4 = 2
                           000003   962  TIM4_PSCR_8 = 3
                           000004   963  TIM4_PSCR_16 = 4
                           000005   964  TIM4_PSCR_32 = 5
                           000006   965  TIM4_PSCR_64 = 6
                           000007   966  TIM4_PSCR_128 = 7
                                    967 
                                    968 ; ADC2
                           005400   969  ADC_CSR  = (0x5400)
                           005401   970  ADC_CR1  = (0x5401)
                           005402   971  ADC_CR2  = (0x5402)
                           005403   972  ADC_CR3  = (0x5403)
                           005404   973  ADC_DRH  = (0x5404)
                           005405   974  ADC_DRL  = (0x5405)
                           005406   975  ADC_TDRH  = (0x5406)
                           005407   976  ADC_TDRL  = (0x5407)
                                    977  
                                    978 ; ADC bitmasks
                                    979 
                           000007   980  ADC_CSR_EOC = (7)
                           000006   981  ADC_CSR_AWD = (6)
                           000005   982  ADC_CSR_EOCIE = (5)
                           000004   983  ADC_CSR_AWDIE = (4)
                           000003   984  ADC_CSR_CH3 = (3)
                           000002   985  ADC_CSR_CH2 = (2)
                           000001   986  ADC_CSR_CH1 = (1)
                           000000   987  ADC_CSR_CH0 = (0)
                                    988 
                           000006   989  ADC_CR1_SPSEL2 = (6)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



                           000005   990  ADC_CR1_SPSEL1 = (5)
                           000004   991  ADC_CR1_SPSEL0 = (4)
                           000001   992  ADC_CR1_CONT = (1)
                           000000   993  ADC_CR1_ADON = (0)
                                    994 
                           000006   995  ADC_CR2_EXTTRIG = (6)
                           000005   996  ADC_CR2_EXTSEL1 = (5)
                           000004   997  ADC_CR2_EXTSEL0 = (4)
                           000003   998  ADC_CR2_ALIGN = (3)
                           000001   999  ADC_CR2_SCAN = (1)
                                   1000 
                           000007  1001  ADC_CR3_DBUF = (7)
                           000006  1002  ADC_CR3_DRH = (6)
                                   1003 
                                   1004 ; beCAN
                           005420  1005  CAN_MCR = (0x5420)
                           005421  1006  CAN_MSR = (0x5421)
                           005422  1007  CAN_TSR = (0x5422)
                           005423  1008  CAN_TPR = (0x5423)
                           005424  1009  CAN_RFR = (0x5424)
                           005425  1010  CAN_IER = (0x5425)
                           005426  1011  CAN_DGR = (0x5426)
                           005427  1012  CAN_FPSR = (0x5427)
                           005428  1013  CAN_P0 = (0x5428)
                           005429  1014  CAN_P1 = (0x5429)
                           00542A  1015  CAN_P2 = (0x542A)
                           00542B  1016  CAN_P3 = (0x542B)
                           00542C  1017  CAN_P4 = (0x542C)
                           00542D  1018  CAN_P5 = (0x542D)
                           00542E  1019  CAN_P6 = (0x542E)
                           00542F  1020  CAN_P7 = (0x542F)
                           005430  1021  CAN_P8 = (0x5430)
                           005431  1022  CAN_P9 = (0x5431)
                           005432  1023  CAN_PA = (0x5432)
                           005433  1024  CAN_PB = (0x5433)
                           005434  1025  CAN_PC = (0x5434)
                           005435  1026  CAN_PD = (0x5435)
                           005436  1027  CAN_PE = (0x5436)
                           005437  1028  CAN_PF = (0x5437)
                                   1029 
                                   1030 
                                   1031 ; CPU
                           007F00  1032  CPU_A  = (0x7F00)
                           007F01  1033  CPU_PCE  = (0x7F01)
                           007F02  1034  CPU_PCH  = (0x7F02)
                           007F03  1035  CPU_PCL  = (0x7F03)
                           007F04  1036  CPU_XH  = (0x7F04)
                           007F05  1037  CPU_XL  = (0x7F05)
                           007F06  1038  CPU_YH  = (0x7F06)
                           007F07  1039  CPU_YL  = (0x7F07)
                           007F08  1040  CPU_SPH  = (0x7F08)
                           007F09  1041  CPU_SPL   = (0x7F09)
                           007F0A  1042  CPU_CCR   = (0x7F0A)
                                   1043 
                                   1044 ; global configuration register
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



                           007F60  1045  CFG_GCR   = (0x7F60)
                           000001  1046  CFG_GCR_AL = 1
                           000000  1047  CFG_GCR_SWIM = 0
                                   1048 
                                   1049 ; interrupt control registers
                           007F70  1050  ITC_SPR1   = (0x7F70)
                           007F71  1051  ITC_SPR2   = (0x7F71)
                           007F72  1052  ITC_SPR3   = (0x7F72)
                           007F73  1053  ITC_SPR4   = (0x7F73)
                           007F74  1054  ITC_SPR5   = (0x7F74)
                           007F75  1055  ITC_SPR6   = (0x7F75)
                           007F76  1056  ITC_SPR7   = (0x7F76)
                           007F77  1057  ITC_SPR8   = (0x7F77)
                                   1058 
                                   1059 ; SWIM, control and status register
                           007F80  1060  SWIM_CSR   = (0x7F80)
                                   1061 ; debug registers
                           007F90  1062  DM_BK1RE   = (0x7F90)
                           007F91  1063  DM_BK1RH   = (0x7F91)
                           007F92  1064  DM_BK1RL   = (0x7F92)
                           007F93  1065  DM_BK2RE   = (0x7F93)
                           007F94  1066  DM_BK2RH   = (0x7F94)
                           007F95  1067  DM_BK2RL   = (0x7F95)
                           007F96  1068  DM_CR1   = (0x7F96)
                           007F97  1069  DM_CR2   = (0x7F97)
                           007F98  1070  DM_CSR1   = (0x7F98)
                           007F99  1071  DM_CSR2   = (0x7F99)
                           007F9A  1072  DM_ENFCTR   = (0x7F9A)
                                   1073 
                                   1074 ; Interrupt Numbers
                           000000  1075  INT_TLI = 0
                           000001  1076  INT_AWU = 1
                           000002  1077  INT_CLK = 2
                           000003  1078  INT_EXTI0 = 3
                           000004  1079  INT_EXTI1 = 4
                           000005  1080  INT_EXTI2 = 5
                           000006  1081  INT_EXTI3 = 6
                           000007  1082  INT_EXTI4 = 7
                           000008  1083  INT_CAN_RX = 8
                           000009  1084  INT_CAN_TX = 9
                           00000A  1085  INT_SPI = 10
                           00000B  1086  INT_TIM1_OVF = 11
                           00000C  1087  INT_TIM1_CCM = 12
                           00000D  1088  INT_TIM2_OVF = 13
                           00000E  1089  INT_TIM2_CCM = 14
                           00000F  1090  INT_TIM3_OVF = 15
                           000010  1091  INT_TIM3_CCM = 16
                           000011  1092  INT_UART1_TX_COMPLETED = 17
                           000012  1093  INT_AUART1_RX_FULL = 18
                           000013  1094  INT_I2C = 19
                           000014  1095  INT_UART3_TX_COMPLETED = 20
                           000015  1096  INT_UART3_RX_FULL = 21
                           000016  1097  INT_ADC2 = 22
                           000017  1098  INT_TIM4_OVF = 23
                           000018  1099  INT_FLASH = 24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                                   1100 
                                   1101 ; Interrupt Vectors
                           008000  1102  INT_VECTOR_RESET = 0x8000
                           008004  1103  INT_VECTOR_TRAP = 0x8004
                           008008  1104  INT_VECTOR_TLI = 0x8008
                           00800C  1105  INT_VECTOR_AWU = 0x800C
                           008010  1106  INT_VECTOR_CLK = 0x8010
                           008014  1107  INT_VECTOR_EXTI0 = 0x8014
                           008018  1108  INT_VECTOR_EXTI1 = 0x8018
                           00801C  1109  INT_VECTOR_EXTI2 = 0x801C
                           008020  1110  INT_VECTOR_EXTI3 = 0x8020
                           008024  1111  INT_VECTOR_EXTI4 = 0x8024
                           008028  1112  INT_VECTOR_CAN_RX = 0x8028
                           00802C  1113  INT_VECTOR_CAN_TX = 0x802c
                           008030  1114  INT_VECTOR_SPI = 0x8030
                           008034  1115  INT_VECTOR_TIM1_OVF = 0x8034
                           008038  1116  INT_VECTOR_TIM1_CCM = 0x8038
                           00803C  1117  INT_VECTOR_TIM2_OVF = 0x803C
                           008040  1118  INT_VECTOR_TIM2_CCM = 0x8040
                           008044  1119  INT_VECTOR_TIM3_OVF = 0x8044
                           008048  1120  INT_VECTOR_TIM3_CCM = 0x8048
                           00804C  1121  INT_VECTOR_UART1_TX_COMPLETED = 0x804c
                           008050  1122  INT_VECTOR_UART1_RX_FULL = 0x8050
                           008054  1123  INT_VECTOR_I2C = 0x8054
                           008058  1124  INT_VECTOR_UART3_TX_COMPLETED = 0x8058
                           00805C  1125  INT_VECTOR_UART3_RX_FULL = 0x805C
                           008060  1126  INT_VECTOR_ADC2 = 0x8060
                           008064  1127  INT_VECTOR_TIM4_OVF = 0x8064
                           008068  1128  INT_VECTOR_FLASH = 0x8068
                                   1129 
                                   1130 ; Condition code register bits
                           000007  1131 CC_V = 7  ; overflow flag 
                           000005  1132 CC_I1= 5  ; interrupt bit 1
                           000004  1133 CC_H = 4  ; half carry 
                           000003  1134 CC_I0 = 3 ; interrupt bit 0
                           000002  1135 CC_N = 2 ;  negative flag 
                           000001  1136 CC_Z = 1 ;  zero flag  
                           000000  1137 CC_C = 0 ; carry bit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                                     29 	.include "inc/ascii.inc"
                                      1 ;;
                                      2 ; Copyright Jacques Deschênes 2019 
                                      3 ; This file is part of MONA 
                                      4 ;
                                      5 ;     MONA is free software: you can redistribute it and/or modify
                                      6 ;     it under the terms of the GNU General Public License as published by
                                      7 ;     the Free Software Foundation, either version 3 of the License, or
                                      8 ;     (at your option) any later version.
                                      9 ;
                                     10 ;     MONA is distributed in the hope that it will be useful,
                                     11 ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                     12 ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                     13 ;     GNU General Public License for more details.
                                     14 ;
                                     15 ;     You should have received a copy of the GNU General Public License
                                     16 ;     along with MONA.  If not, see <http://www.gnu.org/licenses/>.
                                     17 ;;
                                     18 
                                     19 ;-------------------------------------------------------
                                     20 ;     ASCII control  values
                                     21 ;     CTRL_x   are VT100 keyboard values  
                                     22 ; REF: https://en.wikipedia.org/wiki/ASCII    
                                     23 ;-------------------------------------------------------
                           000001    24 		CTRL_A = 1
                           000001    25 		SOH=CTRL_A  ; start of heading 
                           000002    26 		CTRL_B = 2
                           000002    27 		STX=CTRL_B  ; start of text 
                           000003    28 		CTRL_C = 3
                           000003    29 		ETX=CTRL_C  ; end of text 
                           000004    30 		CTRL_D = 4
                           000004    31 		EOT=CTRL_D  ; end of transmission 
                           000005    32 		CTRL_E = 5
                           000005    33 		ENQ=CTRL_E  ; enquery 
                           000006    34 		CTRL_F = 6
                           000006    35 		ACK=CTRL_F  ; acknowledge
                           000007    36 		CTRL_G = 7
                           000007    37         BELL = 7    ; vt100 terminal generate a sound.
                           000008    38 		CTRL_H = 8  
                           000008    39 		BS = 8     ; back space 
                           000009    40         CTRL_I = 9
                           000009    41     	TAB = 9     ; horizontal tabulation
                           00000A    42         CTRL_J = 10 
                           00000A    43 		LF = 10     ; line feed
                           00000B    44 		CTRL_K = 11
                           00000B    45         VT = 11     ; vertical tabulation 
                           00000C    46 		CTRL_L = 12
                           00000C    47         FF = 12      ; new page
                           00000D    48 		CTRL_M = 13
                           00000D    49 		CR = 13      ; carriage return 
                           00000E    50 		CTRL_N = 14
                           00000E    51 		SO=CTRL_N    ; shift out 
                           00000F    52 		CTRL_O = 15
                           00000F    53 		SI=CTRL_O    ; shift in 
                           000010    54 		CTRL_P = 16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



                           000010    55 		DLE=CTRL_P   ; data link escape 
                           000011    56 		CTRL_Q = 17
                           000011    57 		DC1=CTRL_Q   ; device control 1 
                           000011    58 		XON=DC1 
                           000012    59 		CTRL_R = 18
                           000012    60 		DC2=CTRL_R   ; device control 2 
                           000013    61 		CTRL_S = 19
                           000013    62 		DC3=CTRL_S   ; device control 3
                           000013    63 		XOFF=DC3 
                           000014    64 		CTRL_T = 20
                           000014    65 		DC4=CTRL_T   ; device control 4 
                           000015    66 		CTRL_U = 21
                           000015    67 		NAK=CTRL_U   ; negative acknowledge
                           000016    68 		CTRL_V = 22
                           000016    69 		SYN=CTRL_V   ; synchronous idle 
                           000017    70 		CTRL_W = 23
                           000017    71 		ETB=CTRL_W   ; end of transmission block
                           000018    72 		CTRL_X = 24
                           000018    73 		CAN=CTRL_X   ; cancel 
                           000019    74 		CTRL_Y = 25
                           000019    75 		EM=CTRL_Y    ; end of medium
                           00001A    76 		CTRL_Z = 26
                           00001A    77 		SUB=CTRL_Z   ; substitute 
                           00001A    78 		EOF=SUB      ; end of text file in MSDOS 
                           00001B    79 		ESC = 27     ; escape 
                           00001C    80 		FS=28        ; file separator 
                           00001D    81 		GS=29        ; group separator 
                           00001E    82 		RS=30		 ; record separator 
                           00001F    83 		US=31 		 ; unit separator 
                           000020    84 		SPACE = 32
                           00002C    85 		COMMA = 44 
                           000023    86 		SHARP = 35
                           000027    87 		TICK = 39
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                     30 	.include "inc/gen_macros.inc" 
                                      1 ;;
                                      2 ; Copyright Jacques Deschênes 2019 
                                      3 ; This file is part of STM8_NUCLEO 
                                      4 ;
                                      5 ;     STM8_NUCLEO is free software: you can redistribute it and/or modify
                                      6 ;     it under the terms of the GNU General Public License as published by
                                      7 ;     the Free Software Foundation, either version 3 of the License, or
                                      8 ;     (at your option) any later version.
                                      9 ;
                                     10 ;     STM8_NUCLEO is distributed in the hope that it will be useful,
                                     11 ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                     12 ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                     13 ;     GNU General Public License for more details.
                                     14 ;
                                     15 ;     You should have received a copy of the GNU General Public License
                                     16 ;     along with STM8_NUCLEO.  If not, see <http://www.gnu.org/licenses/>.
                                     17 ;;
                                     18 ;--------------------------------------
                                     19 ;   console Input/Output module
                                     20 ;   DATE: 2019-12-11
                                     21 ;    
                                     22 ;   General usage macros.   
                                     23 ;
                                     24 ;--------------------------------------
                                     25 
                                     26     ; reserve space on stack
                                     27     ; for local variables
                                     28     .macro _vars n 
                                     29     sub sp,#n 
                                     30     .endm 
                                     31     
                                     32     ; free space on stack
                                     33     .macro _drop n 
                                     34     addw sp,#n 
                                     35     .endm
                                     36 
                                     37     ; declare ARG_OFS for arguments 
                                     38     ; displacement on stack. This 
                                     39     ; value depend on local variables 
                                     40     ; size.
                                     41     .macro _argofs n 
                                     42     ARG_OFS=2+n 
                                     43     .endm 
                                     44 
                                     45     ; declare a function argument 
                                     46     ; position relative to stack pointer 
                                     47     ; _argofs must be called before it.
                                     48     .macro _arg name ofs 
                                     49     name=ARG_OFS+ofs 
                                     50     .endm 
                                     51 
                                     52     ; software reset 
                                     53     .macro _swreset
                                     54     mov WWDG_CR,#0X80
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                                     55     .endm 
                                     56 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                     31 	.include "config.inc" 
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000001     5 DEBUG=1 ; set to 1 to include debugging code 
                                      6 
                           000000     7 SEPARATE=0 ; set to 1 for 'make separate' 
                                      8 
                                      9 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                     32 	.include "tbi_macros.inc" 
                                      1 ;;
                                      2 ; Copyright Jacques Deschênes 2019 
                                      3 ; This file is part of STM8_NUCLEO 
                                      4 ;
                                      5 ;     STM8_NUCLEO is free software: you can redistribute it and/or modify
                                      6 ;     it under the terms of the GNU General Public License as published by
                                      7 ;     the Free Software Foundation, either version 3 of the License, or
                                      8 ;     (at your option) any later version.
                                      9 ;
                                     10 ;     STM8_NUCLEO is distributed in the hope that it will be useful,
                                     11 ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                     12 ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                     13 ;     GNU General Public License for more details.
                                     14 ;
                                     15 ;     You should have received a copy of the GNU General Public License
                                     16 ;     along with STM8_NUCLEO.  If not, see <http://www.gnu.org/licenses/>.
                                     17 ;;
                                     18 ;--------------------------------------
                           000004    19         TAB_WIDTH=4 ; default tabulation width 
                           0000FF    20         EOF=0xff ; end of file marker 
                                     21         ; keyword types 
                           000000    22         F_CMD=0     ; command keyword
                           000040    23         F_IFUNC=0x40 ; integer function keyword
                           000080    24         F_CFUNC=0x80 ; character function keyword
                           0000C0    25         F_CONST=0xC0 ; function keyword that return a constant
                                     26 
                           00008C    27 	STACK_SIZE=140
                           0017FF    28 	STACK_EMPTY=RAM_SIZE-1  
                           000003    29         CELL_SIZE=3
                           00003C    30         XSTACK_SIZE=CELL_SIZE*20 ; 20 * int24
                           001773    31         XSTACK_EMPTY=STACK_EMPTY-STACK_SIZE 
                           000000    32 	FRUN=0 ; flags run code in variable flags
                           000001    33 	FTRAP=1 ; inside trap handler 
                           000002    34 	FLOOP=2 ; FOR loop in preparation 
                           000003    35 	FSLEEP=3 ; halt produit par la commande SLEEP 
                           000004    36 	FBREAK=4 ; break point flag 
                           000005    37 	FCOMP=5  ; compiling flags 
                           000006    38 	FAUTORUN=6; auto start program running 
                           000007    39         FUPDATE=7 ; update constant flag 
                                     40 
                                     41 
                           000006    42         FIRST_DATA_ITEM=6 ; first DATA item offset on line.
                                     43 
                           007FFF    44 	MAX_LINENO=0x7fff; BASIC maximum line number 
                                     45 
                           000008    46 	RX_QUEUE_SIZE=8 
                                     47 
                           00F424    48         TIM2_CLK_FREQ=62500
                                     49 
                           000050    50 	TIB_SIZE=80
                           000080    51         PAD_SIZE=BLOCK_SIZE 
                                     52 
                                     53 ;--------------------------------------
                                     54 ;   constantes related to Arduino 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                     55 ;   API mapping 
                                     56 ;-------------------------------------
                           000000    57         INP=0
                           000001    58         OUTP=1 
                                     59 
                                     60 ;--------------------------------------
                                     61 ;       token attribute
                                     62 ;--------------------------------------
                                     63         ; bits 4:5 identify token group 
                                     64         ; 0x0n -> miscelinous 
                                     65         ; 0x1n -> +|- operators 
                                     66         ; 0x2n -> *|/|% operators
                                     67         ; 0x3n -> relational operators 
                           000080    68         TK_CMD=128      ; BASIC command   
                           000081    69         TK_IFUNC=129    ; BASIC integer function
                           000082    70         TK_CFUNC=130    ; BASIC character function
                           000083    71         TK_CONST=131    ; BASIC constant 
                           000084    72         TK_INTGR=132    ; 16 bits integer 
                           000085    73         TK_VAR=133
                           000086    74         TK_FLOAT=134    ; float32 
                           000000    75         TK_NONE=0       ; not a token 
                           000002    76         TK_QSTR=2       ; quoted string  
                           000003    77         TK_LABEL=3      ; used for defined, constants, variables
                           000004    78         TK_CHAR=4       ; ASCII character 
                           000005    79         TK_ARRAY=5     ; array variable '@' 
                           000006    80         TK_LPAREN=6     ; left parenthesis '('
                           000007    81         TK_RPAREN=7     ; right parenthesis ')'
                           000008    82         TK_COMMA=8     ; item separator ',' 
                           000009    83         TK_SHARP=9     ; print colon width '#' 
                           00000A    84         TK_COLON=0xa      ; command separator ':' 
                                     85         
                           000010    86         TK_PLUS=0x10    ; addition operator '+'
                           000011    87         TK_MINUS=0x11   ; subtraction operator '-'
                           000020    88         TK_MULT=0x20    ; multiplication operator '*'
                           000021    89         TK_DIV=0x21     ; division operator '/'
                           000022    90         TK_MOD=0x22     ; modulo operator '%'
                                     91 
                                     92         ; don't change these token values 
                                     93         ; values chosen to be used as a mask.
                                     94         ; bit 7   1 for dictionary words else 0 
                                     95         ; bits 6  always 0 
                                     96         ; bits 5:4 identify group 
                                     97         ; bits 3:0 token identifier inside group  
                           000031    98         TK_GT=0x31      ; relation operator '>'
                           000032    99         TK_EQUAL=0x32   ; assignment or relation operator '='
                           000033   100         TK_GE=0x33      ; relation operator '>='
                           000034   101         TK_LT=0x34      ; relation operator '<'
                           000036   102         TK_LE=0x36      ; relation operator '<='
                           000035   103         TK_NE=0x35      ; relation operator '<>' not equal 
                                    104         ; token groups 
                           000030   105         TK_GRP_MASK=0x30 ; groups bits selector 
                           000000   106         TK_GRP_MISC=0x00 ; miscelinous group 
                           000010   107         TK_GRP_ADD=0x10  ; additive operators
                           000020   108         TK_GRP_MULT=0x20 ; multiplicative operators
                           000030   109         TK_GRP_RELOP=0x30 ;relational operators. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                           000002   110         CMD_END=2 
                                    111 
                                    112 ;--------------------------------------
                                    113 ;   error codes 
                                    114 ;--------------------------------------
                           000000   115     ERR_NONE=0
                           000001   116     ERR_MEM_FULL=1 
                           000002   117     ERR_SYNTAX=2
                           000003   118     ERR_MATH_OVF=3
                           000004   119     ERR_DIV0=4 
                           000005   120     ERR_NO_LINE=5
                           000006   121     ERR_RUN_ONLY=6
                           000007   122     ERR_CMD_ONLY=7
                           000008   123     ERR_DUPLICATE=8
                           000009   124     ERR_NOT_FILE=9
                           00000A   125     ERR_BAD_VALUE=10
                           00000B   126     ERR_NO_ACCESS=11
                           00000C   127     ERR_NO_DATA=12 
                           00000D   128     ERR_NO_PROG=13
                           00000E   129     ERR_NO_FSPACE=14
                           00000F   130     ERR_BUF_FULL=15
                           000010   131     ERR_OVERFLOW=16 
                                    132 
                                    133 ;--------------------------------------
                                    134 ;   assembler flags 
                                    135 ;-------------------------------------
                                    136 ;    MATH_OVF=0 ; if 1 the stop on math overflow 
                                    137 
                                    138      .macro _usec_dly n 
                                    139     ldw x,#(16*n-2)/4
                                    140     decw x
                                    141     nop 
                                    142     jrne .-4
                                    143     .endm 
                                    144     
                                    145     ; load X register with 
                                    146     ; entry point of dictionary
                                    147     ; before calling 'search_dict'
                                    148     .macro _ldx_dict dict_name
                                    149     ldw x,#dict_name+2
                                    150     .endm 
                                    151 
                                    152     ; reset BASIC pointer
                                    153     ; to beginning of last token
                                    154     ; extracted except if it was end of line 
                                    155     .macro _unget_token 
                                    156      mov in,in.saved  
                                    157     .endm
                                    158 
                                    159 
                                    160 ;---------------------------------------
                                    161 ;    xtack manipulation macros 
                                    162 ;    Y is used as xstack pointer  
                                    163 ;----------------------------------------
                                    164     ; pop in A:X from XSTACK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                    165     .macro _xpop 
                                    166     ld a,(y)
                                    167     ldw x,y 
                                    168     ldw x,(1,x)
                                    169     addw y,#CELL_SIZE 
                                    170     .endm 
                                    171 
                                    172     ; push A:X  to XSTACK 
                                    173     .macro _xpush 
                                    174     subw y,#CELL_SIZE
                                    175     ld (y),a 
                                    176     ldw (1,y),x 
                                    177     .endm 
                                    178 
                                    179     ; drop from XSTACK 
                                    180     .macro _xdrop 
                                    181     addw y,#CELL_SIZE 
                                    182     .endm 
                                    183 
                                    184     ; @T fetch top xstack 
                                    185     .macro _at_top
                                    186     ld a,(y)
                                    187     ldw x,y 
                                    188     ldw x,(1,x)
                                    189     .endm 
                                    190 
                                    191     ; @N  fetch next on xstack 
                                    192     .macro _at_next 
                                    193     ld a,(3,y)
                                    194     ldw x,y 
                                    195     ldw x,(4,x)
                                    196     .endm 
                                    197 
                                    198     ; !T put on top of xtack 
                                    199     .macro _store_top 
                                    200     ld (y),a 
                                    201     ldw (1,y),x     
                                    202     .endm 
                                    203 
                                    204     ; !N put next on xstack 
                                    205     .macro _store_next 
                                    206     ld (3,y),a 
                                    207     ldw (4,y),x 
                                    208     .endm 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                     33 	.include "cmd_index.inc"
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
                                     18 ;--------------------------------------
                                     19 
                                     20 ;---------------------------------------
                                     21 ; BASIC command and functions indexes
                                     22 ; for addressing 'code_addr' table
                                     23 ;--------------------------------------
                                     24 
                           000000    25     ABS_IDX=0        ; absolute function
                           000002    26     ADCON_IDX=ABS_IDX+2   ;  adc on 
                           000004    27     ADCREAD_IDX=ADCON_IDX+2
                           000006    28     AND_IDX=ADCREAD_IDX+2     ;
                           000008    29     ASC_IDX=AND_IDX+2     ;
                           00000A    30     AWU_IDX=ASC_IDX+2 
                           00000C    31     BIT_IDX=AWU_IDX+2
                           00000E    32     BRES_IDX=BIT_IDX+2
                           000010    33     BSET_IDX=BRES_IDX+2
                           000012    34     BTEST_IDX=BSET_IDX+2
                           000014    35     BTOGL_IDX=BTEST_IDX+2
                           000016    36     BYE_IDX=BTOGL_IDX+2
                           000018    37     CHAR_IDX=BYE_IDX+2
                           00001A    38     CRH_IDX=CHAR_IDX+2
                           00001C    39     CRL_IDX=CRH_IDX+2
                           00001E    40     DATA_IDX=CRL_IDX+2
                           000020    41     DDR_IDX=DATA_IDX+2
                           000022    42     DEC_IDX=DDR_IDX+2
                           000024    43     DO_IDX=DEC_IDX+2
                           000026    44     DREAD_IDX=DO_IDX+2
                           000028    45     DWRITE_IDX=DREAD_IDX+2
                           00002A    46     EDIT_IDX=DWRITE_IDX+2
                           00002C    47     EEPROM_IDX=EDIT_IDX+2
                           00002E    48     END_IDX=EEPROM_IDX+2
                           000030    49     ERASE_IDX=END_IDX+2
                           000032    50     FCPU_IDX=ERASE_IDX+2
                           000034    51     SAVE_IDX=FCPU_IDX+2
                           000036    52     FOR_IDX=SAVE_IDX+2
                           000038    53     GOSUB_IDX=FOR_IDX+2
                           00003A    54     GOTO_IDX=GOSUB_IDX+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                           00003C    55     GPIO_IDX=GOTO_IDX+2
                           00003E    56     HEX_IDX=GPIO_IDX+2
                           000040    57     IDR_IDX=HEX_IDX+2
                           000042    58     IF_IDX=IDR_IDX+2
                           000044    59     INPUT_IDX=IF_IDX+2
                           000046    60     INVERT_IDX=INPUT_IDX+2
                           000048    61     IWDGEN_IDX=INVERT_IDX+2
                           00004A    62     IWDGREF_IDX=IWDGEN_IDX+2
                           00004C    63     KEY_IDX=IWDGREF_IDX+2
                           00004E    64     LET_IDX=KEY_IDX+2
                           000050    65     LIST_IDX=LET_IDX+2
                           000052    66     LOG_IDX=LIST_IDX+2
                           000054    67     LSHIFT_IDX=LOG_IDX+2
                                     68 ;    MULDIV_IDX=LSHIFT_IDX+2
                           000056    69     NEXT_IDX=LSHIFT_IDX+2
                           000058    70     NEW_IDX=NEXT_IDX+2
                           00005A    71     NOT_IDX=NEW_IDX+2
                           00005C    72     ODR_IDX=NOT_IDX+2
                           00005E    73     OR_IDX=ODR_IDX+2
                           000060    74     PAD_IDX=OR_IDX+2
                           000062    75     PAUSE_IDX=PAD_IDX+2
                           000064    76     PMODE_IDX=PAUSE_IDX+2
                           000066    77     PEEK_IDX=PMODE_IDX+2
                           000068    78     PINP_IDX=PEEK_IDX+2
                           00006A    79     POKE_IDX=PINP_IDX+2
                           00006C    80     POUT_IDX=POKE_IDX+2
                           00006E    81    	PRT_IDX=POUT_IDX+2 ; PRINT commande index 
                           000070    82     PRTA_IDX=PRT_IDX+2
                           000072    83     PRTB_IDX=PRTA_IDX+2
                           000074    84     PRTC_IDX=PRTB_IDX+2
                           000076    85     PRTD_IDX=PRTC_IDX+2
                           000078    86     PRTE_IDX=PRTD_IDX+2
                           00007A    87     PRTF_IDX=PRTE_IDX+2
                           00007C    88     PRTG_IDX=PRTF_IDX+2
                           00007E    89     PRTH_IDX=PRTG_IDX+2
                           000080    90     PRTI_IDX=PRTH_IDX+2
                           000082    91     QKEY_IDX=PRTI_IDX+2
                           000084    92     READ_IDX=QKEY_IDX+2
                           000086    93     RBT_IDX=READ_IDX+2  ; REBOOT
                           000088    94 	REM_IDX=RBT_IDX+2 ; REMARK command index 
                           00008A    95     REST_IDX=REM_IDX+2 ; RESTORE
                           00008C    96     RET_IDX=REST_IDX+2  ; RETURN 
                           00008E    97     RND_IDX=RET_IDX+2 ; RANDOM 
                           000090    98     RSHIFT_IDX=RND_IDX+2
                           000092    99     RUN_IDX=RSHIFT_IDX+2
                           000094   100     SHOW_IDX=RUN_IDX+2
                           000096   101     FREE_IDX=SHOW_IDX+2
                           000098   102     SLEEP_IDX=FREE_IDX+2
                           00009A   103     SPIRD_IDX=SLEEP_IDX+2
                           00009C   104     SPIEN_IDX=SPIRD_IDX+2
                           00009E   105     SPISEL_IDX=SPIEN_IDX+2
                           0000A0   106     SPIWR_IDX=SPISEL_IDX+2
                           0000A2   107     STEP_IDX=SPIWR_IDX+2
                           0000A4   108     STOP_IDX=STEP_IDX+2
                           0000A6   109     TICKS_IDX=STOP_IDX+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                           0000A8   110     TIMER_IDX=TICKS_IDX+2
                           0000AA   111     TMROUT_IDX=TIMER_IDX+2  ; TIMEOUT
                           0000AC   112     TO_IDX=TMROUT_IDX+2
                           0000AE   113     TONE_IDX=TO_IDX+2
                           0000B0   114     UBOUND_IDX=TONE_IDX+2
                           0000B2   115     UFLASH_IDX=UBOUND_IDX+2
                           0000B4   116     UNTIL_IDX=UFLASH_IDX+2
                           0000B6   117     USR_IDX=UNTIL_IDX+2
                           0000B8   118     WAIT_IDX=USR_IDX+2
                           0000BA   119     WORDS_IDX=WAIT_IDX+2
                           0000BC   120     WRITE_IDX=WORDS_IDX+2
                           0000BE   121     XOR_IDX=WRITE_IDX+2
                           0000C0   122     SIZE_IDX=XOR_IDX+2 
                           0000C2   123     ON_IDX=SIZE_IDX+2 
                           0000C4   124     GET_IDX=ON_IDX+2
                           0000C6   125     CONST_IDX=GET_IDX+2
                           0000C8   126     EEFREE_IDX=CONST_IDX+2 
                                    127      
                                    128         
                                    129 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                     34 	.include "dbg_macros.inc" 
                                      1 ;;
                                      2 ; Copyright Jacques Deschênes 2019,2020,2021,2022  
                                      3 ; This file is part of stm8_tbi 
                                      4 ;
                                      5 ;     stm8_tbi is free software: you can redistribute it and/or modify
                                      6 ;     it under the terms of the GNU General Public License as published by
                                      7 ;     the Free Software Foundation, either version 3 of the License, or
                                      8 ;     (at your option) any later version.
                                      9 ;
                                     10 ;     stm8_tbi is distributed in the hope that it will be useful,
                                     11 ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                     12 ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                     13 ;     GNU General Public License for more details.
                                     14 ;
                                     15 ;     You should have received a copy of the GNU General Public License
                                     16 ;     along with stm8_tbi.  If not, see <http://www.gnu.org/licenses/>.
                                     17 ;;
                                     18 
                                     19 
                                     20 ;----------------------------------
                                     21 ;  macros used for debugging
                                     22 ;---------------------------------
                                     23 ;-------------------------------
                                     24 ;  macros used to help debugging
                                     25 ;-------------------------------
                                     26     
                           000009    27     DBG_CC=9
                           000008    28     DBG_A=8 
                           000006    29     DBG_X=6 
                           000004    30     DBG_Y=4 
                                     31     .macro _dbg_save_regs 
                                     32     .if DEBUG 
                                     33     push cc ; (9,sp)
                                     34     push a   ; (8,sp)
                                     35     pushw x  ; (6,sp)
                                     36     pushw y  ; (4,sp)
                                     37     ; save acc24 
                                     38     ld a,acc24 
                                     39     ldw x,acc16 
                                     40     pushw x 
                                     41     push a 
                                     42     .endif 
                                     43     .endm 
                                     44 
                                     45     .macro _dbg_restore_regs 
                                     46     ; restore acc24 
                                     47     .if DEBUG 
                                     48     pop a 
                                     49     popw x 
                                     50     ld acc24,a 
                                     51     ldw acc16,x 
                                     52     popw y 
                                     53     popw x 
                                     54     pop a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                     55     pop cc 
                                     56     .endif 
                                     57     .endm 
                                     58 
                                     59     .macro _dbg_getc
                                     60     .if DEBUG  
                                     61     _dbg_save_regs 
                                     62     call getc
                                     63     ld (DBG_A,sp),a 
                                     64     _dbg_restore_regs
                                     65     .endif   
                                     66     .endm 
                                     67 
                                     68     .macro _dbg_putc
                                     69     .if DEBUG  
                                     70     push cc 
                                     71     call putc 
                                     72     pop cc 
                                     73     .endif 
                                     74     .endm 
                                     75 
                                     76     .macro _dbg_puts
                                     77     .if DEBUG  
                                     78     _dbg_save_regs
                                     79     call puts 
                                     80     _dbg_restore_regs
                                     81     .endif 
                                     82     .endm 
                                     83 
                                     84     .macro _dbg_prti24 
                                     85     .if DEBUG 
                                     86     _dbg_save_regs
                                     87     call prti24 
                                     88     _dbg_restore_regs
                                     89     .endif 
                                     90     .endm 
                                     91 
                                     92     .macro _dbg_prt_regs
                                     93     .if DEBUG 
                                     94     call print_registers
                                     95     .endif  
                                     96     .endm 
                                     97 
                                     98     .macro _dbg_peek addr 
                                     99     .if DEBUG 
                                    100     _dbg_save_regs 
                                    101     ldw x,addr 
                                    102     call peek     
                                    103     _dbg_restore_regs
                                    104     .endif 
                                    105     .endm 
                                    106 
                                    107     .macro _dbg_parser_init 
                                    108     .if DEBUG 
                                    109     _dbg_save_regs
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                    110     call parser_init 
                                    111     _dbg_restore_regs
                                    112     .endif 
                                    113     .endm
                                    114 
                                    115     .macro _dbg_readln
                                    116     .if DEBUG 
                                    117     _dbg_save_regs
                                    118     call readln
                                    119     _dbg_restore_regs
                                    120     .endif 
                                    121     .endm
                                    122 
                                    123     .macro _dbg_number
                                    124     .if DEBUG 
                                    125     _dbg_save_regs
                                    126     call number 
                                    127     _dbg_restore_regs
                                    128     .endif 
                                    129     .endm  
                                    130 
                                    131     .macro _dbg_nextword
                                    132     .if DEBUG 
                                    133     _dbg_save_regs
                                    134     call get_token   
                                    135     _dbg_restore_regs
                                    136     .endif 
                                    137     .endm  
                                    138 
                                    139     .macro _dbg_dots 
                                    140     .if DEBUG 
                                    141     _dbg_save_regs
                                    142     call dots 
                                    143     _dbg_restore_regs
                                    144     .endif 
                                    145     .endm 
                                    146 
                                    147     .macro _dbg_trap
                                    148     bset flags,#FTRAP 
                                    149     trap 
                                    150     .endm 
                                    151 
                                    152     .macro _dbg_mark n  
                                    153     .if DEBUG 
                                    154     push cc
                                    155     push a 
                                    156     ld a,#n 
                                    157     call putc
                                    158     btjf UART1_SR,#UART_SR_TC,. 
                                    159     pop a 
                                    160     pop cc 
                                    161     .endif 
                                    162     .endm 
                                    163     
                                    164     .macro _dbg_prt_var var 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                    165     .if DEBUG 
                                    166     _dbg_save_regs 
                                    167     ldw x,var 
                                    168     ldw acc16,x 
                                    169     clr acc24 
                                    170     clrw x 
                                    171     ld a,#16+128  
                                    172     call prti24
                                    173     ld a,#CR 
                                    174     call putc  
                                    175     _dbg_restore_regs
                                    176     .endif  
                                    177     .endm 
                                    178 
                                    179     .macro _dbg_show
                                    180     .if DEBUG  
                                    181     _dbg_save_regs 
                                    182     call show 
                                    183     _dbg_restore_regs
                                    184     .endif 
                                    185     .endm 
                                    186 
                                    187 
                                    188 
                                    189 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                                     35   
                                     36 
                                     37 ;;-----------------------------------
                                     38     .area SSEG (ABS)
                                     39 ;; working buffers and stack at end of RAM. 	
                                     40 ;;-----------------------------------
      001668                         41     .org RAM_SIZE-STACK_SIZE-XSTACK_SIZE-TIB_SIZE-PAD_SIZE 
      001668                         42 tib:: .ds TIB_SIZE             ; transaction input buffer
      0016B8                         43 block_buffer::                 ; use to write FLASH block (alias for pad )
      0016B8                         44 pad:: .ds PAD_SIZE             ; working buffer
      001738                         45 xstack_full:: .ds XSTACK_SIZE   ; expression stack 
      001774                         46 xstack_unf:: ; xstack underflow 
      001774                         47 stack_full:: .ds STACK_SIZE   ; control stack 
      001800                         48 stack_unf: ; stack underflow ; control_stack bottom 
                                     49 
                                     50 ;;--------------------------------------
                                     51     .area HOME 
                                     52 ;; interrupt vector table at 0x8000
                                     53 ;;--------------------------------------
                                     54 
      008000 82 00 81 32             55     int cold_start			; RESET vector 
                           000001    56 .if DEBUG
      008004 82 00 80 92             57 	int TrapHandler 		;TRAP  software interrupt
                           000000    58 .else
                                     59 	int NonHandledInterrupt ;TRAP  software interrupt
                                     60 .endif
      008008 82 00 80 80             61 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 84             62 	int AWUHandler          ;int1 AWU   auto wake up from halt
      008010 82 00 80 80             63 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 80             64 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 80             65 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 80             66 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 80             67 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 B3             68 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 80             69 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 80             70 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 80             71 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 80             72 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 80             73 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 80             74 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 80             75 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 80             76 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 80             77 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 80             78 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 89 0B             79 	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
      008054 82 00 80 80             80 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 80             81 	int NonHandledInterrupt ;int20 UART3 TX completed
      00805C 82 00 80 80             82 	int NonHandledInterrupt ;int21 UART3 RX full
      008060 82 00 80 80             83 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 9E             84 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
      008068 82 00 80 80             85 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 80             86 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 80             87 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 80             88 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 80             89 	int NonHandledInterrupt ;int28  not used
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      00807C 82 00 80 80             90 	int NonHandledInterrupt ;int29  not used
                                     91 
                                     92 ;---------------------------------------
                                     93     .area CODE
                                     94 ;---------------------------------------
                                     95 
                                     96 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     97 ; non handled interrupt 
                                     98 ; reset MCU
                                     99 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008080                        100 NonHandledInterrupt:
      000000                        101 	_swreset 
      008080 35 80 50 D1      [ 1]    1     mov WWDG_CR,#0X80
                                    102 
                                    103 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    104 ; auto wakeup from halt
                                    105 ; at iret, program continue 
                                    106 ; after hatl instruction
                                    107 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008084                        108 AWUHandler:
      008084 72 19 50 F0      [ 1]  109 	bres AWU_CSR,#AWU_CSR_AWUEN
      008088 55 00 3F 50 F1   [ 1]  110 	mov AWU_APR,0x3F
      00808D 72 5F 50 F2      [ 1]  111 	clr AWU_TBR 
      008091 80               [11]  112 	iret
                                    113 
                                    114 ;------------------------------------
                                    115 ; software interrupt handler  
                                    116 ;------------------------------------
                           000001   117 .if DEBUG 
      008092                        118 TrapHandler:
      008092 72 12 00 22      [ 1]  119 	bset flags,#FTRAP 
      008096 CD 85 03         [ 4]  120 	call print_registers
                                    121 ;	call cmd_itf
      008099 72 13 00 22      [ 1]  122 	bres flags,#FTRAP 	
      00809D 80               [11]  123 	iret
                                    124 .endif 
                                    125 
                                    126 ;------------------------------
                                    127 ; TIMER 4 is used to maintain 
                                    128 ; a milliseconds 'ticks' counter
                                    129 ; and decrement 'timer' varaiable
                                    130 ;--------------------------------
      00809E                        131 Timer4UpdateHandler:
      00809E 72 5F 53 42      [ 1]  132 	clr TIM4_SR 
      0080A2 CE 00 10         [ 2]  133 	ldw x,ticks
      0080A5 5C               [ 1]  134 	incw x
      0080A6 CF 00 10         [ 2]  135 	ldw ticks,x 
      0080A9 CE 00 12         [ 2]  136 	ldw x,timer
                                    137 ;	tnzw x 
      0080AC 27 04            [ 1]  138 	jreq 1$
      0080AE 5A               [ 2]  139 	decw x 
      0080AF CF 00 12         [ 2]  140 	ldw timer,x 
      0080B2                        141 1$:	
      0080B2 80               [11]  142 	iret 
                                    143 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



                                    144 ;------------------------------------
                                    145 ; Triggered by pressing USER UserButton 
                                    146 ; on NUCLEO card.
                                    147 ; This is used to abort a progam lock 
                                    148 ; in infinite loop. 
                                    149 ;------------------------------------
      0080B3                        150 UserButtonHandler:
                                    151 ; wait button release
      0080B3 5F               [ 1]  152 	clrw x
      0080B4 5A               [ 2]  153 1$: decw x 
      0080B5 26 FD            [ 1]  154 	jrne 1$
      0080B7 72 09 50 15 F8   [ 2]  155 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    156 ; if MCU suspended by SLEEP resume program
      0080BC 72 07 00 22 05   [ 2]  157     btjf flags,#FSLEEP,2$
      0080C1 72 17 00 22      [ 1]  158 	bres flags,#FSLEEP 
      0080C5 80               [11]  159 	iret
      0080C6                        160 2$:	
      0080C6                        161 user_interrupted:
      0080C6 72 00 00 22 02   [ 2]  162     btjt flags,#FRUN,4$
      0080CB 20 0A            [ 2]  163 	jra UBTN_Handler_exit 
      0080CD                        164 4$:	; program interrupted by user 
      0080CD 72 11 00 22      [ 1]  165 	bres flags,#FRUN 
      0080D1 AE 80 DF         [ 2]  166 	ldw x,#USER_ABORT
      0080D4 CD 89 DA         [ 4]  167 	call puts 
      0080D7                        168 UBTN_Handler_exit:
      0080D7 AE 17 FF         [ 2]  169     ldw x,#STACK_EMPTY 
      0080DA 94               [ 1]  170     ldw sp,x
      0080DB 9A               [ 1]  171 	rim 
      0080DC CC 97 56         [ 2]  172 5$:	jp warm_start
                                    173 
      0080DF 0A 50 72 6F 67 72 61   174 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    175 
                                    176 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    177 ;    peripherals initialization
                                    178 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    179 
                                    180 ;----------------------------------------
                                    181 ; inialize MCU clock 
                                    182 ; input:
                                    183 ;   A 		source  HSI | 1 HSE 
                                    184 ;   XL      CLK_CKDIVR , clock divisor 
                                    185 ; output:
                                    186 ;   none 
                                    187 ;----------------------------------------
      0080FA                        188 clock_init:	
      0080FA C1 50 C3         [ 1]  189 	cp a,CLK_CMSR 
      0080FD 27 0C            [ 1]  190 	jreq 2$ ; no switching required 
                                    191 ; select clock source 
      0080FF 72 12 50 C5      [ 1]  192 	bset CLK_SWCR,#CLK_SWCR_SWEN
      008103 C7 50 C4         [ 1]  193 	ld CLK_SWR,a
      008106 C1 50 C3         [ 1]  194 1$:	cp a,CLK_CMSR
      008109 26 FB            [ 1]  195 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      00810B                        196 2$: 	
                                    197 ; HSI and cpu clock divisor 
      00810B 9F               [ 1]  198 	ld a,xl 
      00810C C7 50 C6         [ 1]  199 	ld CLK_CKDIVR,a  
      00810F 81               [ 4]  200 	ret
                                    201 
                                    202 ;----------------------------------
                                    203 ; TIMER2 used as audio tone output 
                                    204 ; on port D:5.
                                    205 ; channel 1 configured as PWM mode 1 
                                    206 ;-----------------------------------  
                                    207 
      008110                        208 timer2_init:
      008110 72 1A 50 C7      [ 1]  209 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      008114 35 60 53 05      [ 1]  210  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      008118 35 08 53 0C      [ 1]  211 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      00811C 81               [ 4]  212 	ret 
                                    213 
                                    214 ;---------------------------------
                                    215 ; TIM4 is configured to generate an 
                                    216 ; interrupt every millisecond 
                                    217 ;----------------------------------
      00811D                        218 timer4_init:
      00811D 72 18 50 C7      [ 1]  219 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      008121 35 07 53 45      [ 1]  220 	mov TIM4_PSCR,#7 ; prescale 128  
      008125 35 7D 53 46      [ 1]  221 	mov TIM4_ARR,#125 ; set for 1msec.
      008129 35 05 53 40      [ 1]  222 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00812D 72 10 53 41      [ 1]  223 	bset TIM4_IER,#TIM4_IER_UIE
      008131 81               [ 4]  224 	ret
                                    225 
                                    226 ;-------------------------------------
                                    227 ;  initialization entry point 
                                    228 ;-------------------------------------
      008132                        229 cold_start:
                                    230 ;set stack 
      008132 AE 17 FF         [ 2]  231 	ldw x,#STACK_EMPTY
      008135 94               [ 1]  232 	ldw sp,x
                                    233 ; clear all ram 
      008136 7F               [ 1]  234 0$: clr (x)
      008137 5A               [ 2]  235 	decw x 
      008138 26 FC            [ 1]  236 	jrne 0$
                                    237 ; activate pull up on all inputs 
      00813A A6 FF            [ 1]  238 	ld a,#255 
      00813C C7 50 03         [ 1]  239 	ld PA_CR1,a 
      00813F C7 50 08         [ 1]  240 	ld PB_CR1,a 
      008142 C7 50 0D         [ 1]  241 	ld PC_CR1,a 
      008145 C7 50 12         [ 1]  242 	ld PD_CR1,a 
      008148 C7 50 17         [ 1]  243 	ld PE_CR1,a 
      00814B C7 50 1C         [ 1]  244 	ld PF_CR1,a 
      00814E C7 50 21         [ 1]  245 	ld PG_CR1,a 
      008151 C7 50 2B         [ 1]  246 	ld PI_CR1,a
                                    247 ; set LD2 pin as output 
      008154 72 1A 50 0D      [ 1]  248     bset PC_CR1,#LED2_BIT
      008158 72 1A 50 0E      [ 1]  249     bset PC_CR2,#LED2_BIT
      00815C 72 1A 50 0C      [ 1]  250     bset PC_DDR,#LED2_BIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008160 72 1B 50 0A      [ 1]  251 	bres PC_ODR,#LED2_BIT 
                                    252 ; disable schmitt triggers on Arduino CN4 analog inputs
      008164 55 00 3F 54 07   [ 1]  253 	mov ADC_TDRL,0x3f
                                    254 ; disable peripherals clocks
                                    255 ;	clr CLK_PCKENR1 
                                    256 ;	clr CLK_PCKENR2
      008169 72 5F 50 F2      [ 1]  257 	clr AWU_TBR 
      00816D 72 14 50 CA      [ 1]  258 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                    259 ; select internal clock no divisor: 16 Mhz 	
      008171 A6 E1            [ 1]  260 	ld a,#CLK_SWR_HSI 
      008173 5F               [ 1]  261 	clrw x  
      008174 CD 80 FA         [ 4]  262     call clock_init 
      008177 CD 81 1D         [ 4]  263 	call timer4_init
      00817A CD 81 10         [ 4]  264 	call timer2_init
                                    265 ; UART1 at 115200 BAUD
      00817D CD 89 38         [ 4]  266 	call uart1_init
                                    267 ; activate PE_4 (user button interrupt)
      008180 72 18 50 18      [ 1]  268     bset PE_CR2,#USR_BTN_BIT 
                                    269 ; display system information
      008184 9A               [ 1]  270 	rim ; enable interrupts 
      008185 72 5C 00 17      [ 1]  271 	inc seedy+1 
      008189 72 5C 00 15      [ 1]  272 	inc seedx+1 
      00818D CD 9C E5         [ 4]  273 	call func_eefree 
      008190 CD 9C 22         [ 4]  274 	call ubound 
      008193 CD 95 21         [ 4]  275 	call clear_basic
      008196 CD A4 FD         [ 4]  276 	call beep_1khz  
      008199 CD 94 CE         [ 4]  277 	call system_information
      00819C                        278 2$:	
                                    279 ; check for application in flash memory 
      00819C CE B6 00         [ 2]  280 	ldw x,app_sign 
      00819F C3 A7 F3         [ 2]  281 	cpw x,SIGNATURE 
      0081A2 27 03            [ 1]  282 	jreq run_app
      0081A4 CC 97 56         [ 2]  283 	jp warm_start 
      0081A7                        284 run_app:
                                    285 ; run application in FLASH|EEPROM 
      0081A7 CD 94 FF         [ 4]  286 	call warm_init
      0081AA AE B6 04         [ 2]  287 	ldw x,#app 
      0081AD CF 00 1B         [ 2]  288 	ldw txtbgn,x
      0081B0 72 BB B6 02      [ 2]  289 	addw x,app_size 
      0081B4 CF 00 1D         [ 2]  290 	ldw txtend,x 
      0081B7 AE 81 C5         [ 2]  291 	ldw x,#AUTO_RUN 
      0081BA CD 89 DA         [ 4]  292 	call puts 
      0081BD CD 9E 02         [ 4]  293 	call program_info 
      0081C0 CC A4 A1         [ 2]  294 	jp run_it_02  
      0081C3 20 FE            [ 2]  295     jra .  
                                    296 
      0081C5 20 61 75 74 6F 20 72   297 AUTO_RUN: .asciz " auto run program\n"
             75 6E 20 70 72 6F 67
             72 61 6D 0A 00
                                    298 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                      1 ;;
                                      2 ; Copyright Jacques Deschênes 2019,2020,2021,2022  
                                      3 ; This file is part of stm8_tbi 
                                      4 ;
                                      5 ;     stm8_tbi is free software: you can redistribute it and/or modify
                                      6 ;     it under the terms of the GNU General Public License as published by
                                      7 ;     the Free Software Foundation, either version 3 of the License, or
                                      8 ;     (at your option) any later version.
                                      9 ;
                                     10 ;     stm8_tbi is distributed in the hope that it will be useful,
                                     11 ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                     12 ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                     13 ;     GNU General Public License for more details.
                                     14 ;
                                     15 ;     You should have received a copy of the GNU General Public License
                                     16 ;     along with stm8_tbi.  If not, see <http://www.gnu.org/licenses/>.
                                     17 ;;
                                     18 
                                     19 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     20 ;;    24 bits arithmetic 
                                     21 ;;  format in registers: A:X 
                                     22 ;;      A  bits 23..16 
                                     23 ;;      X  bits 15..0 
                                     24 ;;  acc24 variable used for 
                                     25 ;;  computation 
                                     26 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     27 
                                     28 
                                     29     .area CODE 
                                     30 
                                     31 ;-------------------------------
                                     32 ; add24 A:X+acc24 
                                     33 ; add 24 bits integers 
                                     34 ;------------------------------
      0081D8                         35 add24: ; ( i1 i2 -- i1 + i2 )
      000158                         36     _xpop 
      0081D8 90 F6            [ 1]    1     ld a,(y)
      0081DA 93               [ 1]    2     ldw x,y 
      0081DB EE 01            [ 2]    3     ldw x,(1,x)
      0081DD 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0081E1 89               [ 2]   37     pushw x  
      0081E2 88               [ 1]   38     push a  
      000163                         39     _xpop 
      0081E3 90 F6            [ 1]    1     ld a,(y)
      0081E5 93               [ 1]    2     ldw x,y 
      0081E6 EE 01            [ 2]    3     ldw x,(1,x)
      0081E8 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0081EC 72 FB 02         [ 2]   40     addw x,(2,sp)
      0081EF 19 01            [ 1]   41     adc a, (1,sp)
      000171                         42     _xpush 
      0081F1 72 A2 00 03      [ 2]    1     subw y,#CELL_SIZE
      0081F5 90 F7            [ 1]    2     ld (y),a 
      0081F7 90 EF 01         [ 2]    3     ldw (1,y),x 
      00017A                         43     _drop 3 
      0081FA 5B 03            [ 2]    1     addw sp,#3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      0081FC 81               [ 4]   44     ret 
                                     45 
                                     46 ;-------------------------------
                                     47 ; sub24 A:X-acc24 
                                     48 ; subtract 24 bits integers 
                                     49 ;------------------------------
      0081FD                         50 sub24: ; (i1 i2 -- i1-i2 ) 
      00017D                         51     _xpop 
      0081FD 90 F6            [ 1]    1     ld a,(y)
      0081FF 93               [ 1]    2     ldw x,y 
      008200 EE 01            [ 2]    3     ldw x,(1,x)
      008202 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      008206 89               [ 2]   52     pushw x 
      008207 88               [ 1]   53     push  a
      000188                         54     _at_top  
      008208 90 F6            [ 1]    1     ld a,(y)
      00820A 93               [ 1]    2     ldw x,y 
      00820B EE 01            [ 2]    3     ldw x,(1,x)
      00820D 72 F0 02         [ 2]   55     subw x,(2,sp) 
      008210 12 01            [ 1]   56     sbc a, (1,sp)
      000192                         57     _store_top  
      008212 90 F7            [ 1]    1     ld (y),a 
      008214 90 EF 01         [ 2]    2     ldw (1,y),x     
      000197                         58     _drop 3 
      008217 5B 03            [ 2]    1     addw sp,#3 
      008219 81               [ 4]   59     ret 
                                     60 
                                     61 ;------------------------------
                                     62 ; cp24 
                                     63 ; compare acc24 with A:X 
                                     64 ;-------------------------------
      00821A                         65 cp24:
      00821A C1 00 0D         [ 1]   66     cp a,acc24 
      00821D 26 03            [ 1]   67     jrne 9$ 
      00821F C3 00 0E         [ 2]   68     cpw x,acc16
      008222                         69 9$: 
      008222 81               [ 4]   70     ret 
                                     71 
                                     72 
                                     73 ;-------------------------------
                                     74 ; abs24 
                                     75 ; abolute value of top  
                                     76 ;-------------------------------
      008223                         77 abs24: ; ( i -- u )
      008223 90 F6            [ 1]   78     ld a,(y)
      008225 A1 80            [ 1]   79     cp a,#0x80 
      008227 2A 0E            [ 1]   80     jrpl neg24 ; negative integer
      008229 81               [ 4]   81     ret  
                                     82 
                                     83 ;----------------------------
                                     84 ;  one's compleement 
                                     85 ;----------------------------
      00822A                         86 cpl24:  ; i -- ~i 
      0001AA                         87     _at_top 
      00822A 90 F6            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      00822C 93               [ 1]    2     ldw x,y 
      00822D EE 01            [ 2]    3     ldw x,(1,x)
      00822F 43               [ 1]   88     cpl a 
      008230 53               [ 2]   89     cplw x 
      0001B1                         90     _store_top 
      008231 90 F7            [ 1]    1     ld (y),a 
      008233 90 EF 01         [ 2]    2     ldw (1,y),x     
      008236 81               [ 4]   91     ret 
                                     92 
                                     93 ;----------------------------    
                                     94 ; two'2 complement of top  
                                     95 ;---------------------------
      008237                         96 neg24: ; (i -- -i )
      0001B7                         97     _at_top
      008237 90 F6            [ 1]    1     ld a,(y)
      008239 93               [ 1]    2     ldw x,y 
      00823A EE 01            [ 2]    3     ldw x,(1,x)
      00823C 43               [ 1]   98     cpl  a  
      00823D 53               [ 2]   99     cplw x 
      00823E 1C 00 01         [ 2]  100     addw x,#1
      008241 A9 00            [ 1]  101     adc a,#0
      0001C3                        102     _store_top  
      008243 90 F7            [ 1]    1     ld (y),a 
      008245 90 EF 01         [ 2]    2     ldw (1,y),x     
      008248 81               [ 4]  103 9$: ret 
                                    104 
                                    105 ;-----------------------------
                                    106 ; negate integer in A:X 
                                    107 ;----------------------------
      008249                        108 neg_ax:
      008249 43               [ 1]  109     cpl  a  
      00824A 53               [ 2]  110     cplw x 
      00824B 1C 00 01         [ 2]  111     addw x,#1
      00824E A9 00            [ 1]  112     adc a,#0
      008250 81               [ 4]  113     ret 
                                    114 
                                    115 ;------------------------------------
                                    116 ;  two's complement of acc24 
                                    117 ;-------------------------------------
      008251                        118 neg_acc24: ; 
      008251 72 53 00 0D      [ 1]  119     cpl acc24 
      008255 72 53 00 0E      [ 1]  120     cpl acc16 
      008259 72 53 00 0F      [ 1]  121     cpl acc8
      00825D 72 5C 00 0F      [ 1]  122     inc acc8 
      008261 26 0A            [ 1]  123     jrne 9$
      008263 72 5C 00 0E      [ 1]  124     inc acc16 
      008267 26 04            [ 1]  125     jrne 9$
      008269 72 5C 00 0D      [ 1]  126     inc acc24 
      00826D 81               [ 4]  127 9$: ret 
                                    128 
                                    129 
                                    130 ;--------------------------------------
                                    131 ; unsigned multiply uint24_t by uint8_t
                                    132 ; input:
                                    133 ;	acc24	uint24_t 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                                    134 ;   A		uint8_t
                                    135 ; output:
                                    136 ;   acc24   A*acc24
                                    137 ;      A    overflow, bits 31..24 
                                    138 ;-------------------------------------
                                    139 ; local variables offset  on sp
                           000001   140 	U8   = 1   ; A pushed on stack
                           000001   141 	VSIZE = 1 
      00826E                        142 mulu24_8:
      00826E 89               [ 2]  143 	pushw x    ; save X
                                    144 	; local variable
      00826F 88               [ 1]  145 	push a     ; U8
      008270 72 5F 00 0C      [ 1]  146 	clr acc32 
                                    147 ; multiply bits 7..0 * U8   	
      008274 97               [ 1]  148 	ld xl,a 
      008275 C6 00 0F         [ 1]  149 	ld a,acc8 
      008278 42               [ 4]  150 	mul x,a 
      008279 C6 00 0E         [ 1]  151 	ld a, acc16 
      00827C CF 00 0E         [ 2]  152 	ldw acc16,x
                                    153 ; multiply middle byte, bits 15..8 * U8  	
      00827F 97               [ 1]  154 	ld xl,a 
      008280 7B 01            [ 1]  155 	ld a,(U8,sp)
      008282 42               [ 4]  156 	mul x,a 
      008283 C6 00 0D         [ 1]  157 	ld a,acc24
      008286 72 5F 00 0D      [ 1]  158 	clr acc24  
      00828A 72 BB 00 0D      [ 2]  159 	addw x,acc24
      00828E CF 00 0D         [ 2]  160 	ldw acc24,x 
                                    161 ; multiply  MSB, bits 23..16 * U8 
      008291 97               [ 1]  162 	ld xl,a 
      008292 7B 01            [ 1]  163 	ld a,(U8,sp)
      008294 42               [ 4]  164 	mul x,a
      008295 72 BB 00 0C      [ 2]  165 	addw x,acc32  
      008299 CF 00 0C         [ 2]  166 	ldw acc32,x 
      00829C 9E               [ 1]  167 	ld a,xh 
      00021D                        168 	_drop VSIZE  
      00829D 5B 01            [ 2]    1     addw sp,#VSIZE 
      00829F 85               [ 2]  169 	popw x 
      0082A0 81               [ 4]  170 	ret 
                                    171 
                                    172 
                                    173 ;-------------------------------
                                    174 ; mul24 i1 i2 -- i1*i2  
                                    175 ; multiply 24 bits integers 
                                    176 ;------------------------------
                           000001   177     PROD=1 
                           000004   178     N1=4
                           000007   179     N2=7
                           00000A   180     PROD_SIGN=10
                           00000A   181     VSIZE=10 
      0082A1                        182 mul24:
      000221                        183     _vars VSIZE
      0082A1 52 0A            [ 2]    1     sub sp,#VSIZE 
      0082A3 0F 0A            [ 1]  184     clr (PROD_SIGN,sp)
      000225                        185     _xpop 
      0082A5 90 F6            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      0082A7 93               [ 1]    2     ldw x,y 
      0082A8 EE 01            [ 2]    3     ldw x,(1,x)
      0082AA 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0082AE 4D               [ 1]  186     tnz a 
      0082AF 2A 05            [ 1]  187     jrpl 0$
      0082B1 03 0A            [ 1]  188     cpl (PROD_SIGN,sp)
      0082B3 CD 82 49         [ 4]  189     call neg_ax 
      0082B6                        190 0$:    
      0082B6 6B 04            [ 1]  191     ld (N1,sp),a 
      0082B8 1F 05            [ 2]  192     ldw (N1+1,sp),x
      00023A                        193     _at_top 
      0082BA 90 F6            [ 1]    1     ld a,(y)
      0082BC 93               [ 1]    2     ldw x,y 
      0082BD EE 01            [ 2]    3     ldw x,(1,x)
      0082BF 4D               [ 1]  194     tnz a 
      0082C0 2A 09            [ 1]  195     jrpl 2$ 
      0082C2 03 0A            [ 1]  196     cpl (PROD_SIGN,sp) 
      0082C4 CD 82 49         [ 4]  197     call neg_ax
      0082C7 6B 07            [ 1]  198     ld (N2,sp),a 
      0082C9 1F 08            [ 2]  199     ldw (N2+1,sp),x   
      0082CB                        200 2$: 
      0082CB C7 00 0D         [ 1]  201     ld acc24,a 
      0082CE CF 00 0E         [ 2]  202     ldw acc16,x 
      0082D1 7B 06            [ 1]  203     ld a,(N1+2,sp); least byte     
      0082D3 27 12            [ 1]  204     jreq 4$
      0082D5 CD 82 6E         [ 4]  205     call mulu24_8
      0082D8 4D               [ 1]  206     tnz a 
      0082D9 26 61            [ 1]  207     jrne 8$ ; overflow 
      0082DB CE 00 0E         [ 2]  208     ldw x,acc16  
      0082DE C6 00 0D         [ 1]  209     ld a,acc24
      0082E1 2B 59            [ 1]  210     jrmi 8$ ; overflow  
      0082E3 6B 01            [ 1]  211     ld (PROD,sp),a
      0082E5 1F 02            [ 2]  212     ldw (PROD+1,sp),x 
      0082E7                        213 4$:
      0082E7 7B 07            [ 1]  214     ld a,(N2,sp) 
      0082E9 1E 08            [ 2]  215     ldw x,(N2+1,sp)
      0082EB C7 00 0D         [ 1]  216     ld acc24,a 
      0082EE CF 00 0E         [ 2]  217     ldw acc16,x 
      0082F1 7B 05            [ 1]  218     ld a,(N1+1,sp); middle byte     
      0082F3 27 1F            [ 1]  219     jreq 5$
      0082F5 CD 82 6E         [ 4]  220     call mulu24_8
      0082F8 4D               [ 1]  221     tnz a 
      0082F9 26 41            [ 1]  222     jrne 8$ ; overflow 
      0082FB C6 00 0D         [ 1]  223     ld a,acc24 
      0082FE 26 3C            [ 1]  224     jrne 8$  ; overflow 
      008300 CE 00 0E         [ 2]  225     ldw x,acc16  
      008303 72 FB 01         [ 2]  226     addw x,(PROD,sp)
      008306 29 34            [ 1]  227     jrv 8$ ; overflow
      008308 1F 01            [ 2]  228     ldw (PROD,sp),x 
      00830A 7B 07            [ 1]  229     ld a,(N2,sp)
      00830C 1E 08            [ 2]  230     ldw x,(N2+1,sp)
      00830E C7 00 0D         [ 1]  231     ld acc24,a 
      008311 CF 00 0E         [ 2]  232     ldw acc16,x 
      008314                        233 5$:
      008314 7B 04            [ 1]  234     ld a,(N1,sp) ; high byte 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008316 27 16            [ 1]  235     jreq 6$
      008318 CD 82 6E         [ 4]  236     call mulu24_8
      00831B 4D               [ 1]  237     tnz a 
      00831C 26 1E            [ 1]  238     jrne 8$ ; overflow 
      00831E CE 00 0D         [ 2]  239     ldw x,acc24 
      008321 26 19            [ 1]  240     jrne 8$ ; overflow 
      008323 C6 00 0F         [ 1]  241     ld a,acc8 
      008326 2B 14            [ 1]  242     jrmi 8$ ; overflow 
      008328 1B 01            [ 1]  243     add a,(PROD,sp)
      00832A 6B 01            [ 1]  244     ld (PROD,sp),a 
      00832C 29 0E            [ 1]  245     jrv 8$ ; overflow 
      00832E                        246 6$:
      00832E 7B 01            [ 1]  247     ld a,(PROD,sp)
      008330 1E 02            [ 2]  248     ldw x,(PROD+1,sp)
      008332 0D 0A            [ 1]  249     tnz (PROD_SIGN,sp)
      008334 27 03            [ 1]  250     jreq 7$
      008336 CD 82 49         [ 4]  251     call neg_ax 
      008339                        252 7$:
      008339 98               [ 1]  253     rcf ; C=0 means no overflow 
      00833A 20 03            [ 2]  254     jra 9$
      00833C                        255 8$: ; overflow 
      00833C 4F               [ 1]  256     clr a 
      00833D 5F               [ 1]  257     clrw x 
      00833E 99               [ 1]  258     scf ; C=1 means overflow 
      00833F                        259 9$:    
      0002BF                        260     _store_top 
      00833F 90 F7            [ 1]    1     ld (y),a 
      008341 90 EF 01         [ 2]    2     ldw (1,y),x     
      0002C4                        261     _drop VSIZE 
      008344 5B 0A            [ 2]    1     addw sp,#VSIZE 
      008346 81               [ 4]  262     ret 
                                    263 
                                    264 ;-------------------------------------
                                    265 ; divide uint24_t by uint8_t
                                    266 ; input:
                                    267 ;	acc24	dividend
                                    268 ;   A 		divisor
                                    269 ; output:
                                    270 ;   acc24	quotient
                                    271 ;   A		remainder
                                    272 ;------------------------------------- 
                                    273 ; offset  on sp of arguments and locals
                           000001   274 	U8   = 1   ; divisor on stack
                           000001   275 	VSIZE =1
      008347                        276 divu24_8:
      008347 89               [ 2]  277 	pushw x ; save x
      008348 88               [ 1]  278 	push a 
                                    279 	; ld dividend UU:MM bytes in X
      008349 CE 00 0D         [ 2]  280 	ldw x,acc24
      00834C 7B 01            [ 1]  281 	ld a,(U8,SP) ; divisor
      00834E 62               [ 2]  282 	div x,a ; UU:MM/U8
      00834F 88               [ 1]  283 	push a  ;save remainder
      008350 CF 00 0D         [ 2]  284     ldw acc24,x ; quotient 
      008353 84               [ 1]  285 	pop a
      008354 95               [ 1]  286 	ld xh,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008355 C6 00 0F         [ 1]  287 	ld a,acc8
      008358 97               [ 1]  288 	ld xl,a
      008359 7B 01            [ 1]  289 	ld a,(U8,sp) ; divisor
      00835B 62               [ 2]  290 	div x,a  ; R:LL/U8
      00835C 6B 01            [ 1]  291 	ld (U8,sp),a ; save remainder
      00835E 9F               [ 1]  292 	ld a,xl
      00835F C7 00 0F         [ 1]  293 	ld acc8,a
      008362 84               [ 1]  294 	pop a
      008363 85               [ 2]  295 	popw x
      008364 81               [ 4]  296 	ret
                                    297 
                                    298 
                                    299 ;-------------------------------
                                    300 ; div24 N/T   
                                    301 ; divide 24 bits integers
                                    302 ;  i1 i2 -- i1/i2 
                                    303 ;------------------------------
                           000001   304     DIVISOR=1
                           000004   305     CNTR=4
                           000005   306     QSIGN=5
                           000006   307     RSIGN=6 
                           000006   308     VSIZE=6 
      008365                        309 div24:
      0002E5                        310     _vars VSIZE 
      008365 52 06            [ 2]    1     sub sp,#VSIZE 
      008367 0F 06            [ 1]  311     clr (RSIGN,sp)
      008369 0F 05            [ 1]  312     clr (QSIGN,sp)
      0002EB                        313     _xpop 
      00836B 90 F6            [ 1]    1     ld a,(y)
      00836D 93               [ 1]    2     ldw x,y 
      00836E EE 01            [ 2]    3     ldw x,(1,x)
      008370 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      008374 4D               [ 1]  314     tnz a 
      008375 2A 05            [ 1]  315     jrpl 0$ 
      008377 03 05            [ 1]  316     cpl (QSIGN,sp)
      008379 CD 82 49         [ 4]  317     call neg_ax
      00837C                        318 0$:
      00837C 6B 01            [ 1]  319     ld  (DIVISOR,sp),a
      00837E 1F 02            [ 2]  320     ldw (DIVISOR+1,sp),x
      008380 1A 02            [ 1]  321     or a,(DIVISOR+1,sp)
      008382 1A 03            [ 1]  322     or a,(DIVISOR+2,sp)
      008384 26 05            [ 1]  323     jrne 1$ 
      008386 A6 04            [ 1]  324     ld a,#ERR_DIV0 
      008388 CC 96 C7         [ 2]  325     jp tb_error 
      00838B                        326 1$: 
      00030B                        327     _at_top
      00838B 90 F6            [ 1]    1     ld a,(y)
      00838D 93               [ 1]    2     ldw x,y 
      00838E EE 01            [ 2]    3     ldw x,(1,x)
      008390 4D               [ 1]  328     tnz a 
      008391 2A 07            [ 1]  329     jrpl 2$
      008393 CD 82 49         [ 4]  330     call neg_ax
      008396 03 05            [ 1]  331     cpl (QSIGN,sp)
      008398 03 06            [ 1]  332     cpl (RSIGN,sp)
      00839A                        333 2$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      00839A C7 00 0D         [ 1]  334     ld acc24,a 
      00839D CF 00 0E         [ 2]  335     ldw acc16,x 
      0083A0 A6 18            [ 1]  336     ld a,#24 
      0083A2 6B 04            [ 1]  337     ld (CNTR,sp),a
      0083A4 7B 01            [ 1]  338     ld a,(DIVISOR,sp)
      0083A6 1E 02            [ 2]  339     ldw x,(DIVISOR+1,sp)
      0083A8 CD 82 1A         [ 4]  340     call cp24 ; A:X-acc24 ?
      0083AB 23 14            [ 2]  341     jrule 22$ 
                                    342 ; quotient=0, remainder=divisor      
      0083AD C6 00 0D         [ 1]  343     ld a,acc24 
      0083B0 CE 00 0E         [ 2]  344     ldw x,acc16 
      0083B3 72 5F 00 0D      [ 1]  345     clr acc24 
      0083B7 72 5F 00 0E      [ 1]  346     clr acc16 
      0083BB 72 5F 00 0F      [ 1]  347     clr acc8 
      0083BF 20 2E            [ 2]  348     jra 6$
      0083C1                        349 22$:     
      0083C1 4F               [ 1]  350     clr a 
      0083C2 5F               [ 1]  351     clrw x 
      0083C3 98               [ 1]  352     rcf  
      0083C4                        353 3$: 
      0083C4 72 59 00 0F      [ 1]  354     rlc acc8 
      0083C8 72 59 00 0E      [ 1]  355     rlc acc16
      0083CC 72 59 00 0D      [ 1]  356     rlc acc24 
      0083D0 59               [ 2]  357     rlcw x  
      0083D1 49               [ 1]  358     rlc a
      0083D2 72 F0 02         [ 2]  359 4$: subw x,(DIVISOR+1,sp) 
      0083D5 12 01            [ 1]  360     sbc a,(DIVISOR,sp)
      0083D7 24 05            [ 1]  361     jrnc 5$
      0083D9 72 FB 02         [ 2]  362     addw x,(DIVISOR+1,sp)
      0083DC 19 01            [ 1]  363     adc a,(DIVISOR,sp)
      0083DE                        364 5$: ; shift carry in QUOTIENT 
      0083DE 8C               [ 1]  365     ccf
      0083DF 0A 04            [ 1]  366     dec (CNTR,sp)
      0083E1 26 E1            [ 1]  367     jrne 3$ 
      0083E3 72 59 00 0F      [ 1]  368     rlc acc8 
      0083E7 72 59 00 0E      [ 1]  369     rlc acc16 
      0083EB 72 59 00 0C      [ 1]  370     rlc acc32 
      0083EF                        371 6$:    
      0083EF 6B 01            [ 1]  372     ld (DIVISOR,sp),a 
      0083F1 1F 02            [ 2]  373     ldw (DIVISOR+1,sp),x 
      0083F3 C6 00 0D         [ 1]  374     ld a,acc24 
      0083F6 CE 00 0E         [ 2]  375     ldw x,acc16 
      0083F9 0D 05            [ 1]  376     tnz (QSIGN,sp)
      0083FB 27 03            [ 1]  377     jreq 8$
      0083FD CD 82 49         [ 4]  378     call neg_ax 
      008400                        379 8$: 
      000380                        380     _store_top 
      008400 90 F7            [ 1]    1     ld (y),a 
      008402 90 EF 01         [ 2]    2     ldw (1,y),x     
      008405 7B 01            [ 1]  381     ld a,(DIVISOR,sp)
      008407 1E 02            [ 2]  382     ldw x,(DIVSOR+1,sp)
      008409                        383 81$:
      008409 0D 06            [ 1]  384     tnz (RSIGN,sp)
      00840B 27 03            [ 1]  385     jreq 9$
      00840D CD 82 49         [ 4]  386     call neg_ax       
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      000390                        387 9$: _drop VSIZE 
      008410 5B 06            [ 2]    1     addw sp,#VSIZE 
      008412 81               [ 4]  388     ret 
                                    389 
                                    390 
                                    391 ;-------------------------------
                                    392 ; mod24 A:X % acc24 
                                    393 ; remainder 24 bits integers 
                                    394 ; input:
                                    395 ;    acc24   dividend 
                                    396 ;    A:X     divisor 
                                    397 ; output:
                                    398 ;    acc24   acc24 % A:X 
                                    399 ;------------------------------
      008413                        400 mod24:
      008413 CD 83 65         [ 4]  401     call div24 
      000396                        402     _store_top  ; replace quotient by remainder 
      008416 90 F7            [ 1]    1     ld (y),a 
      008418 90 EF 01         [ 2]    2     ldw (1,y),x     
      00841B 81               [ 4]  403     ret 
                                    404 
                                    405 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
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
                                     18 ;--------------------------------------
                                     19 ;;;;;;;;;;;;;;;;;;;;
                                     20 ;;  debug support
                                     21 ;;;;;;;;;;;;;;;;;;;;
                                     22 
                           000001    23 .if DEBUG 
                                     24 
                                     25     .area CODE
                                     26 
                                     27 ;---------------------------------
                                     28 ;; print actual registers states 
                                     29 ;; as pushed on stack 
                                     30 ;; {Y,X,CC,A}
                                     31 ;---------------------------------
      00841C                         32 	_argofs 0  
                           000002     1     ARG_OFS=2+0 
      00039C                         33 	_arg R_Y 1 
                           000003     1     R_Y=ARG_OFS+1 
      00039C                         34 	_arg R_X 3
                           000005     1     R_X=ARG_OFS+3 
      00039C                         35 	_arg R_A 5
                           000007     1     R_A=ARG_OFS+5 
      00039C                         36 	_arg R_CC 6
                           000008     1     R_CC=ARG_OFS+6 
      00039C                         37 prt_regs::
      00841C AE 84 5F         [ 2]   38 	ldw x,#regs_state 
      00841F CD 89 DA         [ 4]   39 	call puts
                                     40 ; register PC
      008422 16 01            [ 2]   41 	ldw y,(1,sp)
      008424 AE 85 93         [ 2]   42 	ldw x,#REG_EPC 
      008427 CD 84 E4         [ 4]   43 	call prt_reg16 
                                     44 ; register CC 
      00842A 7B 08            [ 1]   45 	ld a,(R_CC,sp)
      00842C AE 85 A4         [ 2]   46 	ldw x,#REG_CC 
      00842F CD 84 C2         [ 4]   47 	call prt_reg8 
                                     48 ; register A 
      008432 7B 07            [ 1]   49 	ld a,(R_A,sp)
      008434 AE 85 A0         [ 2]   50 	ldw x,#REG_A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      008437 CD 84 C2         [ 4]   51 	call prt_reg8 
                                     52 ; register X 
      00843A 16 05            [ 2]   53 	ldw y,(R_X,sp)
      00843C AE 85 9C         [ 2]   54 	ldw x,#REG_X 
      00843F CD 84 E4         [ 4]   55 	call prt_reg16 
                                     56 ; register Y 
      008442 16 03            [ 2]   57 	ldw y,(R_Y,sp)
      008444 AE 85 98         [ 2]   58 	ldw x,#REG_Y 
      008447 CD 84 E4         [ 4]   59 	call prt_reg16 
                                     60 ; register SP 
      00844A 90 96            [ 1]   61 	ldw y,sp
      00844C 72 A9 00 08      [ 2]   62 	addw y,#6+ARG_OFS  
      008450 AE 85 A9         [ 2]   63 	ldw x,#REG_SP
      008453 CD 84 E4         [ 4]   64 	call prt_reg16
      008456 A6 0D            [ 1]   65 	ld a,#CR 
      008458 CD 89 7D         [ 4]   66 	call putc
      00845B CD 89 7D         [ 4]   67 	call putc   
      00845E 81               [ 4]   68 	ret 
                                     69 
                                     70 
      00845F 0A 72 65 67 69 73 74    71 regs_state: .asciz "\nregisters state\n--------------------\n"
             65 72 73 20 73 74 61
             74 65 0A 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 0A 00
                                     72 
                                     73 
                                     74 ;--------------------
                                     75 ; print content at address in hex.
                                     76 ; input:
                                     77 ;   X 	address to peek 
                                     78 ; output:
                                     79 ;	none 
                                     80 ;--------------------	
      008486                         81 prt_peek::
      008486 89               [ 2]   82 	pushw x 
      008487 35 10 00 0B      [ 1]   83 	mov base,#16 
      00848B CD 98 21         [ 4]   84 	call prt_i16  
      00848E A6 3A            [ 1]   85 	ld a,#': 
      008490 CD 89 7D         [ 4]   86 	call putc 
      008493 A6 20            [ 1]   87 	ld a,#SPACE 
      008495 CD 89 7D         [ 4]   88 	call putc 
      008498 85               [ 2]   89 	popw x 
      008499 F6               [ 1]   90 	ld a,(x)
      00849A 5F               [ 1]   91 	clrw x 
      00849B 97               [ 1]   92 	ld xl,a 
      00849C 35 0A 00 0B      [ 1]   93 	mov base,#10 
      0084A0 CD 98 21         [ 4]   94 	call prt_i16 
      0084A3 81               [ 4]   95 	ret 
                                     96 
                                     97 ;----------------------------------------
                                     98 ;   DEBUG support functions
                                     99 ;----------------------------------------
                                    100 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                    101 ; turn LED on 
      0084A4                        102 ledon:
      0084A4 72 1A 50 0A      [ 1]  103     bset PC_ODR,#LED2_BIT
      0084A8 81               [ 4]  104     ret 
                                    105 
                                    106 ; turn LED off 
      0084A9                        107 ledoff:
      0084A9 72 1B 50 0A      [ 1]  108     bres PC_ODR,#LED2_BIT 
      0084AD 81               [ 4]  109     ret 
                                    110 
                                    111 ; invert LED status 
      0084AE                        112 ledtoggle:
      0084AE A6 20            [ 1]  113     ld a,#LED2_MASK
      0084B0 C8 50 0A         [ 1]  114     xor a,PC_ODR
      0084B3 C7 50 0A         [ 1]  115     ld PC_ODR,a
      0084B6 81               [ 4]  116     ret 
                                    117 
      0084B7                        118 left_paren:
      0084B7 A6 20            [ 1]  119 	ld a,#SPACE 
      0084B9 CD 89 7D         [ 4]  120 	call putc
      0084BC A6 28            [ 1]  121 	ld a,#'( 
      0084BE CD 89 7D         [ 4]  122 	call putc 	
      0084C1 81               [ 4]  123 	ret 
                                    124 
                                    125 ;------------------------------
                                    126 ; print 8 bit register 
                                    127 ; input:
                                    128 ;   X  point to register name 
                                    129 ;   A  register value to print 
                                    130 ; output:
                                    131 ;   none
                                    132 ;------------------------------- 
      0084C2                        133 prt_reg8:
      0084C2 88               [ 1]  134 	push a 
      0084C3 CD 89 DA         [ 4]  135 	call puts 
      0084C6 7B 01            [ 1]  136 	ld a,(1,sp) 
      0084C8 5F               [ 1]  137 	clrw x 
      0084C9 97               [ 1]  138 	ld xl,a 
      0084CA 35 10 00 0B      [ 1]  139 	mov base,#16
      0084CE CD 98 21         [ 4]  140 	call prt_i16  
      0084D1 CD 84 B7         [ 4]  141 	call left_paren 
      0084D4 84               [ 1]  142 	pop a 
      0084D5 5F               [ 1]  143 	clrw x 
      0084D6 97               [ 1]  144 	ld xl,a 
      0084D7 35 0A 00 0B      [ 1]  145 	mov base,#10 
      0084DB CD 98 21         [ 4]  146 	call prt_i16  
      0084DE A6 29            [ 1]  147 	ld a,#') 
      0084E0 CD 89 7D         [ 4]  148 	call putc
      0084E3 81               [ 4]  149 	ret
                                    150 
                                    151 ;--------------------------------
                                    152 ; print 16 bits register 
                                    153 ; input:
                                    154 ;   X   point register name 
                                    155 ;   Y   register value to print 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                    156 ; output:
                                    157 ;  none
                                    158 ;--------------------------------
      0084E4                        159 prt_reg16: 
      0084E4 90 89            [ 2]  160 	pushw y 
      0084E6 CD 89 DA         [ 4]  161 	call puts 
      0084E9 1E 01            [ 2]  162 	ldw x,(1,sp) 
      0084EB 35 10 00 0B      [ 1]  163 	mov base,#16 
      0084EF CD 98 21         [ 4]  164 	call prt_i16  
      0084F2 CD 84 B7         [ 4]  165 	call left_paren 
      0084F5 85               [ 2]  166 	popw x 
      0084F6 35 0A 00 0B      [ 1]  167 	mov base,#10 
      0084FA CD 98 21         [ 4]  168 	call prt_i16  
      0084FD A6 29            [ 1]  169 	ld a,#') 
      0084FF CD 89 7D         [ 4]  170 	call putc
      008502 81               [ 4]  171 	ret 
                                    172 
                                    173 ;------------------------------------
                                    174 ; print registers contents saved on
                                    175 ; stack by trap interrupt.
                                    176 ;------------------------------------
      008503                        177 print_registers:
      008503 AE 85 56         [ 2]  178 	ldw x,#STATES
      008506 CD 89 DA         [ 4]  179 	call puts
                                    180 ; print EPC 
      008509 AE 85 93         [ 2]  181 	ldw x, #REG_EPC
      00850C CD 89 DA         [ 4]  182 	call puts 
      00850F 7B 0B            [ 1]  183 	ld a, (11,sp)
      008511 C7 00 0F         [ 1]  184 	ld acc8,a 
      008514 7B 0A            [ 1]  185 	ld a, (10,sp) 
      008516 C7 00 0E         [ 1]  186 	ld acc16,a 
      008519 7B 09            [ 1]  187 	ld a,(9,sp) 
      00851B C7 00 0D         [ 1]  188 	ld acc24,a
      00851E 5F               [ 1]  189 	clrw x  
      00851F A6 10            [ 1]  190 	ld a,#16
      008521 CD 98 31         [ 4]  191 	call prt_acc24  
                                    192 ; print X
      008524 AE 85 9C         [ 2]  193 	ldw x,#REG_X
      008527 16 05            [ 2]  194 	ldw y,(5,sp)
      008529 CD 84 E4         [ 4]  195 	call prt_reg16  
                                    196 ; print Y 
      00852C AE 85 98         [ 2]  197 	ldw x,#REG_Y
      00852F 16 07            [ 2]  198 	ldw y, (7,sp)
      008531 CD 84 E4         [ 4]  199 	call prt_reg16  
                                    200 ; print A 
      008534 AE 85 A0         [ 2]  201 	ldw x,#REG_A
      008537 7B 04            [ 1]  202 	ld a, (4,sp) 
      008539 CD 84 C2         [ 4]  203 	call prt_reg8
                                    204 ; print CC 
      00853C AE 85 A4         [ 2]  205 	ldw x,#REG_CC 
      00853F 7B 03            [ 1]  206 	ld a, (3,sp) 
      008541 CD 84 C2         [ 4]  207 	call prt_reg8 
                                    208 ; print SP 
      008544 AE 85 A9         [ 2]  209 	ldw x,#REG_SP
      008547 90 96            [ 1]  210 	ldw y,sp 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      008549 72 A9 00 0C      [ 2]  211 	addw y,#12
      00854D CD 84 E4         [ 4]  212 	call prt_reg16  
      008550 A6 0A            [ 1]  213 	ld a,#'\n' 
      008552 CD 89 7D         [ 4]  214 	call putc
      008555 81               [ 4]  215 	ret
                                    216 
      008556 0A 52 65 67 69 73 74   217 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             65 72 73 20 73 74 61
             74 65 20 61 74 20 61
             62 6F 72 74 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      008593 45 50 43 3A 00         218 REG_EPC: .asciz "EPC:"
      008598 0A 59 3A 00            219 REG_Y:   .asciz "\nY:" 
      00859C 0A 58 3A 00            220 REG_X:   .asciz "\nX:"
      0085A0 0A 41 3A 00            221 REG_A:   .asciz "\nA:" 
      0085A4 0A 43 43 3A 00         222 REG_CC:  .asciz "\nCC:"
      0085A9 0A 53 50 3A 00         223 REG_SP:  .asciz "\nSP:"
                                    224 
                                    225 ;----------------------------
                                    226 ; command interface
                                    227 ; only 3 commands:
                                    228 ;  'q' to resume application
                                    229 ;  'p [addr]' to print memory values 
                                    230 ;  's addr' to print string 
                                    231 ;----------------------------
                                    232 ;local variable 
                           000001   233 	PSIZE=1
                           000001   234 	VSIZE=1 
      0085AE                        235 cmd_itf:
      0085AE 52 01            [ 2]  236 	sub sp,#VSIZE 
      0085B0 72 5F 00 18      [ 1]  237 	clr farptr 
      0085B4 72 5F 00 19      [ 1]  238 	clr farptr+1 
      0085B8 72 5F 00 1A      [ 1]  239 	clr farptr+2  
      0085BC                        240 repl:
      0085BC A6 0D            [ 1]  241 	ld a,#CR 
      0085BE CD 89 7D         [ 4]  242 	call putc 
      0085C1 A6 3F            [ 1]  243 	ld a,#'? 
      0085C3 CD 89 7D         [ 4]  244 	call putc
      0085C6 72 5F 00 01      [ 1]  245 	clr in.w 
      0085CA 72 5F 00 02      [ 1]  246 	clr in 
      0085CE CD 8A DF         [ 4]  247 	call readln
      0085D1 90 AE 16 68      [ 2]  248 	ldw y,#tib  
      0085D5 90 F6            [ 1]  249 	ld a,(y)
      0085D7 27 E3            [ 1]  250 	jreq repl  
      0085D9 72 5C 00 02      [ 1]  251 	inc in 
      0085DD CD 98 B0         [ 4]  252 	call to_upper 
      0085E0 A1 51            [ 1]  253 	cp a,#'Q 
      0085E2 26 17            [ 1]  254 	jrne test_p
      0085E4                        255 repl_exit:
      0085E4 72 5F 16 68      [ 1]  256 	clr tib 
      0085E8 72 5F 00 04      [ 1]  257 	clr count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0085EC 72 5F 00 02      [ 1]  258 	clr in 
      000570                        259 	_drop #VSIZE 	
      0085F0 5B 01            [ 2]    1     addw sp,##VSIZE 
      0085F2 81               [ 4]  260 	ret  
      0085F3                        261 invalid:
      0085F3 AE 86 74         [ 2]  262 	ldw x,#invalid_cmd 
      0085F6 CD 89 DA         [ 4]  263 	call puts 
      0085F9 20 C1            [ 2]  264 	jra repl 
      0085FB                        265 test_p:	
      0085FB A1 50            [ 1]  266     cp a,#'P 
      0085FD 27 11            [ 1]  267 	jreq mem_peek
      0085FF A1 53            [ 1]  268     cp a,#'S 
      008601 26 F0            [ 1]  269 	jrne invalid 
      008603                        270 print_string:	
      008603 CD 8F 47         [ 4]  271 	call get_token
      008606 A1 84            [ 1]  272 	cp a,#TK_INTGR 
      008608 26 E9            [ 1]  273 	jrne invalid 
      00860A CD 89 DA         [ 4]  274 	call puts
      00860D CC 85 BC         [ 2]  275 	jp repl 	
      008610                        276 mem_peek:
      008610 A6 20            [ 1]  277 	ld a,#SPACE 
      008612 CD 8F 34         [ 4]  278 	call skip  	 
      008615 72 B9 00 01      [ 2]  279 	addw y,in.w 
      008619 AE 16 B8         [ 2]  280 	ldw x,#pad 
      00861C CD 94 25         [ 4]  281 	call strcpy
      00861F AE 16 B8         [ 2]  282 	ldw x,#pad
      008622 CD 98 BC         [ 4]  283 	call atoi24 	
      008625 C6 00 0D         [ 1]  284 	ld a, acc24 
      008628 CA 00 0E         [ 1]  285 	or a,acc16 
      00862B CA 00 0F         [ 1]  286 	or a,acc8 
      00862E 26 02            [ 1]  287 	jrne 1$ 
      008630 20 0C            [ 2]  288 	jra peek_byte  
      008632 CE 00 0D         [ 2]  289 1$:	ldw x,acc24 
      008635 CF 00 18         [ 2]  290 	ldw farptr,x 
      008638 C6 00 0F         [ 1]  291 	ld a,acc8 
      00863B C7 00 1A         [ 1]  292 	ld farptr+2,a 
      00863E                        293 peek_byte:
      00863E CD 86 83         [ 4]  294 	call print_farptr 
      008641 A6 08            [ 1]  295 	ld a,#8 
      008643 6B 01            [ 1]  296 	ld (PSIZE,sp),a 
      008645 5F               [ 1]  297 	clrw x 
      008646 CD 86 9E         [ 4]  298 1$:	call fetchc  
      008649 89               [ 2]  299 	pushw x 
      00864A C7 00 0F         [ 1]  300 	ld acc8,a 
      00864D 5F               [ 1]  301 	clrw x 
      00864E CF 00 0D         [ 2]  302 	ldw acc24,x 
      008651 A6 90            [ 1]  303 	ld a,#16+128
      008653 CD 98 31         [ 4]  304 	call prt_acc24
      008656 85               [ 2]  305 	popw x 
      008657 0A 01            [ 1]  306 	dec (PSIZE,sp)
      008659 26 EB            [ 1]  307 	jrne 1$ 
      00865B A6 08            [ 1]  308 	ld a,#8 
      00865D CB 00 1A         [ 1]  309 	add a,farptr+2 
      008660 C7 00 1A         [ 1]  310 	ld farptr+2,a
      008663 4F               [ 1]  311 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      008664 C9 00 19         [ 1]  312 	adc a,farptr+1 
      008667 C7 00 19         [ 1]  313 	ld farptr+1,a 
      00866A 4F               [ 1]  314 	clr a 
      00866B C9 00 18         [ 1]  315 	adc a,farptr 
      00866E C7 00 18         [ 1]  316 	ld farptr,a 
      008671 CC 85 BC         [ 2]  317 	jp repl  
                                    318 
      008674 6E 6F 74 20 61 20 63   319 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                    320 
                                    321 ;----------------------------
                                    322 ; display farptr address
                                    323 ;----------------------------
      008683                        324 print_farptr:
      008683 C6 00 1A         [ 1]  325 	ld a ,farptr+2 
      008686 C7 00 0F         [ 1]  326 	ld acc8,a 
      008689 CE 00 18         [ 2]  327 	ldw x,farptr 
      00868C CF 00 0D         [ 2]  328 	ldw acc24,x 
      00868F 5F               [ 1]  329 	clrw x 
      008690 A6 10            [ 1]  330 	ld a,#16 
      008692 CD 98 31         [ 4]  331 	call prt_acc24
      008695 A6 20            [ 1]  332 	ld a,#SPACE 
      008697 CD 89 7D         [ 4]  333 	call putc 
      00869A CD 89 7D         [ 4]  334 	call putc 
      00869D 81               [ 4]  335 	ret
                                    336 
                                    337 ;------------------------------------
                                    338 ; get byte at address farptr[X]
                                    339 ; input:
                                    340 ;	 farptr   address to peek
                                    341 ;    X		  farptr index 	
                                    342 ; output:
                                    343 ;	 A 		  byte from memory  
                                    344 ;    x		  incremented by 1
                                    345 ;------------------------------------
      00869E                        346 fetchc: ; @C
      00869E 92 AF 00 18      [ 5]  347 	ldf a,([farptr],x)
      0086A2 5C               [ 1]  348 	incw x
      0086A3 81               [ 4]  349 	ret
                                    350 
                                    351 
                                    352 ;------------------------------------
                                    353 ; expect a number from command line 
                                    354 ; next argument
                                    355 ;  input:
                                    356 ;	  none
                                    357 ;  output:
                                    358 ;    acc24   int24_t 
                                    359 ;------------------------------------
      0086A4                        360 number:
      0086A4 CD 8F 47         [ 4]  361 	call get_token
      0086A7 A1 84            [ 1]  362 	cp a,#TK_INTGR
      0086A9 27 03            [ 1]  363 	jreq 1$
      0086AB CC 96 C5         [ 2]  364 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0086AE 81               [ 4]  365 1$:	ret
                                    366 
                                    367 
                                    368 ;---------------------
                                    369 ; display n bytes row 
                                    370 ; from memory.
                                    371 ; input:
                                    372 ;   A   bytes to print 
                                    373 ;	X   start address 
                                    374 ; output:
                                    375 ;   X   address after last shown  
                                    376 ;---------------------
                           000001   377 	CNT=1 
                           000002   378 	ADR=2 
                           000003   379 	VSIZE=3 
      0086AF                        380 show_row:
      0086AF 4D               [ 1]  381 	tnz a 
      0086B0 26 01            [ 1]  382 	jrne 1$
      0086B2 81               [ 4]  383 	ret 
      0086B3                        384 1$:	
      0086B3 89               [ 2]  385 	pushw x  
      0086B4 88               [ 1]  386 	push a 
      0086B5 35 04 00 23      [ 1]  387 	mov tab_width,#4 
      0086B9 CD 98 21         [ 4]  388 	call prt_i16 
      0086BC A6 20            [ 1]  389 	ld a,#SPACE  
      0086BE CD 89 7D         [ 4]  390 	call putc
      0086C1                        391 row_loop:
      0086C1 1E 02            [ 2]  392 	ldw x,(ADR,sp)
      0086C3 F6               [ 1]  393 	ld a,(x)
      0086C4 5F               [ 1]  394 	clrw x 
      0086C5 97               [ 1]  395 	ld xl,a 
      0086C6 CD 98 21         [ 4]  396 	call prt_i16 
      0086C9 1E 02            [ 2]  397 	ldw x,(ADR,sp)
      0086CB 5C               [ 1]  398 	incw x 
      0086CC 1F 02            [ 2]  399 	ldw (ADR,sp),x 
      0086CE 0A 01            [ 1]  400 	dec (CNT,sp)
      0086D0 26 EF            [ 1]  401 	jrne row_loop
      000652                        402 	_drop VSIZE  		
      0086D2 5B 03            [ 2]    1     addw sp,#VSIZE 
      0086D4 35 04 00 23      [ 1]  403 	mov tab_width,#4
      0086D8 A6 0D            [ 1]  404 	ld a,#CR 
      0086DA CD 89 7D         [ 4]  405 	call putc 
      0086DD 81               [ 4]  406 	ret 
                                    407 
                                    408 ;--------------------------
                                    409 ; print memory content 
                                    410 ; in hexadecimal format
                                    411 ;  input:
                                    412 ;    X    start address 
                                    413 ;    Y    count 
                                    414 ;--------------------------
                           000001   415 	BCNT=1
                           000003   416 	BASE=3
                           000004   417 	TABW=4
                           000004   418 	VSIZE=4   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0086DE                        419 hex_dump:
      0086DE 88               [ 1]  420 	push a 
      00065F                        421 	_vars VSIZE
      0086DF 52 04            [ 2]    1     sub sp,#VSIZE 
      0086E1 C6 00 0B         [ 1]  422 	ld a,base
      0086E4 6B 03            [ 1]  423 	ld (BASE,sp),a 
      0086E6 35 10 00 0B      [ 1]  424 	mov base,#16
      0086EA C6 00 23         [ 1]  425 	ld a,tab_width 
      0086ED 6B 04            [ 1]  426 	ld (TABW,sp),a
      0086EF A6 0D            [ 1]  427 	ld a,#CR 
      0086F1 CD 89 7D         [ 4]  428 	call putc 
      0086F4 17 01            [ 2]  429 1$: ldw (BCNT,sp),y
      0086F6 A6 10            [ 1]  430 	ld a,#16
      0086F8 90 A3 00 10      [ 2]  431 	cpw y,#16
      0086FC 2A 02            [ 1]  432 	jrpl 2$
      0086FE 90 9F            [ 1]  433 	ld a,yl
      008700                        434 2$: 	
      008700 CD 86 AF         [ 4]  435 	call show_row 
      008703 16 01            [ 2]  436 	ldw y,(BCNT,sp) 
      008705 72 A2 00 10      [ 2]  437 	subw y,#16 
      008709 90 A3 00 01      [ 2]  438 	cpw y,#1
      00870D 2A E5            [ 1]  439 	jrpl 1$
      00870F 7B 03            [ 1]  440 	ld a,(BASE,sp)
      008711 C7 00 0B         [ 1]  441 	ld base,a
      008714 7B 04            [ 1]  442 	ld a,(TABW,sp)
      008716 C7 00 23         [ 1]  443 	ld tab_width,a 
      000699                        444 	_drop VSIZE
      008719 5B 04            [ 2]    1     addw sp,#VSIZE 
      00871B 84               [ 1]  445 	pop a 
      00871C 81               [ 4]  446 	ret 
                                    447 
                                    448 .endif ; DEBUG 
                                    449 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



                                      1 ;;
                                      2 ; Copyright Jacques Deschênes 2019,2020,2021,2022  
                                      3 ; This file is part of stm8_tbi 
                                      4 ;
                                      5 ;     stm8_tbi is free software: you can redistribute it and/or modify
                                      6 ;     it under the terms of the GNU General Public License as published by
                                      7 ;     the Free Software Foundation, either version 3 of the License, or
                                      8 ;     (at your option) any later version.
                                      9 ;
                                     10 ;     stm8_tbi is distributed in the hope that it will be useful,
                                     11 ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                     12 ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                     13 ;     GNU General Public License for more details.
                                     14 ;
                                     15 ;     You should have received a copy of the GNU General Public License
                                     16 ;     along with stm8_tbi.  If not, see <http://www.gnu.org/licenses/>.
                                     17 ;;
                                     18 
                                     19 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     20 ;;;  In application Programming of 
                                     21 ;;;  FLASH, EEPROM and OPTION memory 
                                     22 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     23 
                                     24     .module IAP 
                                     25 
                                     26 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                                     27     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000001     5 DEBUG=1 ; set to 1 to include debugging code 
                                      6 
                           000000     7 SEPARATE=0 ; set to 1 for 'make separate' 
                                      8 
                                      9 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                     28 
                           000000    29 .if SEPARATE
                                     30 	.include "inc/nucleo_8s208.inc"
                                     31 	.include "inc/stm8s208.inc"
                                     32 	.include "inc/ascii.inc"
                                     33 	.include "inc/gen_macros.inc" 
                                     34 	.include "tbi_macros.inc" 
                                     35 .endif 
                                     36 
                                     37 ;----------------------------------
                                     38 ; unlock EEPROM/OPT for writing/erasing
                                     39 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                     40 ; input:
                                     41 ;  none
                                     42 ; output:
                                     43 ;  none 
                                     44 ;----------------------------------
      00871D                         45 unlock_eeprom:
      00871D 72 06 50 5F 15   [ 2]   46 	btjt FLASH_IAPSR,#FLASH_IAPSR_DUL,9$
      008722 35 00 50 5B      [ 1]   47 	mov FLASH_CR2,#0 
      008726 35 FF 50 5C      [ 1]   48 	mov FLASH_NCR2,#0xFF 
      00872A 35 AE 50 64      [ 1]   49 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      00872E 35 56 50 64      [ 1]   50     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      008732 72 07 50 5F FB   [ 2]   51 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008737 81               [ 4]   52 9$:	ret
                                     53 
                                     54 ;----------------------------------
                                     55 ; unlock FLASH for writing/erasing
                                     56 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                     57 ; input:
                                     58 ;  none
                                     59 ; output:
                                     60 ;  none
                                     61 ;----------------------------------
      008738                         62 unlock_flash:
      008738 72 02 50 5F 15   [ 2]   63 	btjt FLASH_IAPSR,#FLASH_IAPSR_PUL,9$
      00873D 35 00 50 5B      [ 1]   64 	mov FLASH_CR2,#0 
      008741 35 FF 50 5C      [ 1]   65 	mov FLASH_NCR2,#0xFF 
      008745 35 56 50 62      [ 1]   66 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008749 35 AE 50 62      [ 1]   67 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      00874D 72 03 50 5F FB   [ 2]   68 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      008752 81               [ 4]   69 9$:	ret
                                     70 
                                     71 ;----------------------------
                                     72 ; erase block code must be 
                                     73 ; executed from RAM
                                     74 ; input:
                                     75 ;-----------------------------
      008753                         76 row_erase:
      008753 88               [ 1]   77 	push a 
      008754 90 89            [ 2]   78 	pushw y 
      008756 35 20 50 5B      [ 1]   79 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      00875A 35 DF 50 5C      [ 1]   80 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      00875E 4F               [ 1]   81 	clr a 
      00875F 90 5F            [ 1]   82 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      008761 91 A7 00 18      [ 1]   83 	ldf ([farptr],y),a
      008765 90 5C            [ 1]   84     incw y
      008767 91 A7 00 18      [ 1]   85 	ldf ([farptr],y),a
      00876B 90 5C            [ 1]   86     incw y
      00876D 91 A7 00 18      [ 1]   87 	ldf ([farptr],y),a
      008771 90 5C            [ 1]   88     incw y
      008773 91 A7 00 18      [ 1]   89 	ldf ([farptr],y),a
      008777 72 05 50 5F FB   [ 2]   90 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      00877C 90 85            [ 2]   91 	popw y 
      00877E 84               [ 1]   92 	pop a 
      00877F 81               [ 4]   93 	ret
      008780                         94 row_erase_end:
                                     95 
                                     96 ; copy erase_start in RAM 
      008780                         97 move_erase_to_ram:
      008780 89               [ 2]   98 	pushw x 
      008781 90 89            [ 2]   99 	pushw y 
      008783 AE 87 80         [ 2]  100 	ldw x,#row_erase_end 
      008786 1D 87 53         [ 2]  101 	subw x,#row_erase
      008789 CF 00 0E         [ 2]  102 	ldw acc16,x 
      00878C AE 16 68         [ 2]  103 	ldw x,#tib 
      00878F 90 AE 87 53      [ 2]  104 	ldw y,#row_erase 
      008793 CD 94 35         [ 4]  105 	call move
      008796 90 85            [ 2]  106 	popw y
      008798 85               [ 2]  107 	popw x
      008799 81               [ 4]  108 	ret 
                                    109 
                                    110 ;-----------------------------------
                                    111 ; block programming must be 
                                    112 ; executed from RAM 
                                    113 ; initial contidions: 
                                    114 ; 	memory unlocked
                                    115 ;   bit PRG set in 
                                    116 ; input:
                                    117 ;   x        data source 
                                    118 ;   farptr   row address destination 
                                    119 ; output:
                                    120 ;   none 
                                    121 ;----------------------------------
                           000001   122 	BCNT=1 
      00879A                        123 program_row:
      00879A 88               [ 1]  124 	push a 
      00879B 90 89            [ 2]  125 	pushw y 
      00879D 4B 80            [ 1]  126 	push #BLOCK_SIZE  
                                    127 ;enable block programming 
      00879F 72 10 50 5B      [ 1]  128 	bset FLASH_CR2,#FLASH_CR2_PRG 
      0087A3 72 11 50 5C      [ 1]  129 	bres FLASH_NCR2,#FLASH_CR2_PRG
      0087A7 90 5F            [ 1]  130 	clrw y 
      0087A9 F6               [ 1]  131 1$:	ld a,(x)
      0087AA 91 A7 00 18      [ 1]  132 	ldf ([farptr],y),a
      0087AE 5C               [ 1]  133 	incw x 
      0087AF 90 5C            [ 1]  134 	incw y 
      0087B1 0A 01            [ 1]  135 	dec (BCNT,sp)
      0087B3 26 F4            [ 1]  136 	jrne 1$
                                    137 ; wait EOP bit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0087B5 72 05 50 5F FB   [ 2]  138 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      00073A                        139 	_drop 1 
      0087BA 5B 01            [ 2]    1     addw sp,#1 
      0087BC 90 85            [ 2]  140 	popw y 
      0087BE 84               [ 1]  141 	pop a 
      0087BF 81               [ 4]  142 	ret 
      0087C0                        143 program_row_end:
                                    144 
                                    145 ;-------------------------
                                    146 ; move program_row to RAM 
                                    147 ; at txtubound address 
                                    148 ;------------------------
      0087C0                        149 move_prg_to_ram:
      0087C0 89               [ 2]  150 	pushw x 
      0087C1 90 89            [ 2]  151 	pushw y 
      0087C3 AE 87 C0         [ 2]  152 	ldw x,#program_row_end 
      0087C6 1D 87 9A         [ 2]  153 	subw x,#program_row 
      0087C9 CF 00 0E         [ 2]  154 	ldw acc16,x ; bytes to move 
      0087CC AE 16 68         [ 2]  155 	ldw x,#tib ; destination address 
      0087CF 90 AE 87 9A      [ 2]  156 	ldw y,#program_row ; source address 
      0087D3 CD 94 35         [ 4]  157 	call move
      0087D6 90 85            [ 2]  158 	popw y 
      0087D8 85               [ 2]  159 	popw x  
      0087D9 81               [ 4]  160 	ret 
                                    161 
                                    162 
                                    163 ;-----------------------------
                                    164 ; write a buffer in FLASH/EEPROM 
                                    165 ; input:
                                    166 ;    farptr   destination address 
                                    167 ;    x        buffer address 
                                    168 ;-----------------------------
      0087DA                        169 write_buffer:
      0087DA 89               [ 2]  170 	pushw x 
      0087DB 72 5D 00 18      [ 1]  171 	tnz farptr 
      0087DF 26 0D            [ 1]  172 	jrne to_flash 
      0087E1 CE 00 19         [ 2]  173 	ldw x,farptr+1 
      0087E4 A3 B6 00         [ 2]  174 	cpw x,#app_space  
      0087E7 24 05            [ 1]  175 	jruge to_flash 
      0087E9                        176 to_eeprom:
      0087E9 CD 87 1D         [ 4]  177 	call unlock_eeprom
      0087EC 20 03            [ 2]  178 	jra do_programming
      0087EE                        179 to_flash:
      0087EE CD 87 38         [ 4]  180 	call unlock_flash
      0087F1                        181 do_programming:
      0087F1 85               [ 2]  182 	popw x 
      0087F2 CD 16 68         [ 4]  183 	call tib
      0087F5 72 13 50 5F      [ 1]  184 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      0087F9 72 17 50 5F      [ 1]  185 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      0087FD 81               [ 4]  186 	ret 
                                    187 
                                    188 
                                    189 ;-----------------------------------
                                    190 ; erase flash or EEPROM block
                                    191 ; a block is 128 bytes 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                    192 ; input:
                                    193 ;   farptr  address row begin
                                    194 ; output:
                                    195 ;   none
                                    196 ;--------------------------------------
      0087FE                        197 block_erase:
      0087FE 89               [ 2]  198 	pushw x 
      0087FF CE 00 19         [ 2]  199 	ldw x,farptr+1
      008802 A3 B6 00         [ 2]  200 	cpw x,#app_space 
      008805 24 0C            [ 1]  201 	jruge erase_flash 
                                    202 ; erase eeprom block
      008807 CD 87 1D         [ 4]  203 	call unlock_eeprom 
      00880A CD 16 68         [ 4]  204 	call tib 
      00880D 72 17 50 5F      [ 1]  205 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      008811 20 0A            [ 2]  206 	jra erase_exit  
                                    207 ; erase flash block:
      008813                        208 erase_flash:
      008813 CD 87 38         [ 4]  209 	call unlock_flash 
      008816 CD 16 68         [ 4]  210 	call tib 
      008819 72 13 50 5F      [ 1]  211     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00881D                        212 erase_exit: 
      00881D 85               [ 2]  213 	popw x 
      00881E 81               [ 4]  214 	ret 
                                    215 
                                    216 
                                    217 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    218 ; write a byte to FLASH or EEPROM/OPTION  
                                    219 ; input:
                                    220 ;    a  		byte to write
                                    221 ;    farptr  	address
                                    222 ;    x          farptr[x]
                                    223 ; output:
                                    224 ;    none
                                    225 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    226 	; variables locales
                           000001   227 	BTW = 1   ; byte to write offset on stack
                           000002   228 	OPT = 2   ; OPTION flag offset on stack
                           000002   229 	VSIZE = 2
      00881F                        230 write_byte:
      00881F 90 89            [ 2]  231 	pushw y
      0007A1                        232 	_vars VSIZE
      008821 52 02            [ 2]    1     sub sp,#VSIZE 
      008823 6B 01            [ 1]  233 	ld (BTW,sp),a ; byte to write 
      008825 0F 02            [ 1]  234 	clr (OPT,sp)  ; OPTION flag
                                    235 ; put addr[15:0] in Y, for bounds check.
      008827 90 CE 00 19      [ 2]  236 	ldw y,farptr+1   ; Y=addr15:0
                                    237 ; check addr[23:16], if <> 0 then it is extened flash memory
      00882B 72 5D 00 18      [ 1]  238 	tnz farptr 
      00882F 26 14            [ 1]  239 	jrne write_flash
      008831 90 A3 B6 00      [ 2]  240     cpw y,#app_space 	 
      008835 24 0E            [ 1]  241     jruge write_flash
      008837 90 A3 40 00      [ 2]  242 	cpw y,#EEPROM_BASE  
      00883B 25 57            [ 1]  243     jrult write_exit
      00883D 90 A3 48 7F      [ 2]  244 	cpw y,#OPTION_END 
      008841 22 51            [ 1]  245 	jrugt write_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      008843 20 16            [ 2]  246 	jra write_eeprom 
                                    247 ; write program memory
      008845                        248 write_flash:
      008845 CD 87 38         [ 4]  249 	call unlock_flash 
      008848 9B               [ 1]  250 1$:	sim 
      008849 7B 01            [ 1]  251 	ld a,(BTW,sp)
      00884B 92 A7 00 18      [ 4]  252 	ldf ([farptr],x),a ; farptr[x]=A
      00884F 72 05 50 5F FB   [ 2]  253 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008854 9A               [ 1]  254     rim 
      008855 72 13 50 5F      [ 1]  255     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008859 20 39            [ 2]  256     jra write_exit
                                    257 ; write eeprom and option
      00885B                        258 write_eeprom:
      00885B CD 87 1D         [ 4]  259 	call unlock_eeprom
                                    260 	; check for data eeprom or option eeprom
      00885E 90 A3 48 00      [ 2]  261 	cpw y,#OPTION_BASE
      008862 2B 08            [ 1]  262 	jrmi 1$
      008864 90 A3 48 80      [ 2]  263 	cpw y,#OPTION_END+1
      008868 2A 02            [ 1]  264 	jrpl 1$
      00886A 03 02            [ 1]  265 	cpl (OPT,sp)
      00886C                        266 1$: 
      00886C 0D 02            [ 1]  267     tnz (OPT,sp)
      00886E 27 08            [ 1]  268     jreq 2$
                                    269 	; pour modifier une option il faut modifier ces 2 bits
      008870 72 1E 50 5B      [ 1]  270     bset FLASH_CR2,#FLASH_CR2_OPT
      008874 72 1F 50 5C      [ 1]  271     bres FLASH_NCR2,#FLASH_CR2_OPT 
      008878                        272 2$: 
      008878 7B 01            [ 1]  273     ld a,(BTW,sp)
      00887A 92 A7 00 18      [ 4]  274     ldf ([farptr],x),a
      00887E 0D 02            [ 1]  275     tnz (OPT,sp)
      008880 27 08            [ 1]  276     jreq 3$
      008882 5C               [ 1]  277     incw x
      008883 7B 01            [ 1]  278     ld a,(BTW,sp)
      008885 43               [ 1]  279     cpl a
      008886 92 A7 00 18      [ 4]  280     ldf ([farptr],x),a
      00888A 72 05 50 5F FB   [ 2]  281 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      00888F 72 0D 50 5F FB   [ 2]  282 	btjf FLASH_IAPSR,#FLASH_IAPSR_HVOFF,.
      008894                        283 write_exit:
      000814                        284 	_drop VSIZE 
      008894 5B 02            [ 2]    1     addw sp,#VSIZE 
      008896 90 85            [ 2]  285 	popw y
      008898 81               [ 4]  286     ret
                                    287 
                                    288 ;--------------------------------------------
                                    289 ; write a data block to eeprom or flash 
                                    290 ; the block must be erased before 
                                    291 ; using this routine.
                                    292 ; input:
                                    293 ;   Y        source address   
                                    294 ;   X        array index  destination  farptr[x]
                                    295 ;   BSIZE    block size bytes 
                                    296 ;   farptr   write address , byte* 
                                    297 ; output:
                                    298 ;	X 		after last byte written 
                                    299 ;   Y 		after last byte read 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                    300 ;  farptr   point after block
                                    301 ;---------------------------------------------
      008899                        302 	_argofs 3 
                           000005     1     ARG_OFS=2+3 
      000819                        303 	_arg BSIZE 1  ; block size
                           000006     1     BSIZE=ARG_OFS+1 
                                    304 	; local var 
                           000001   305 	XSAVE=1 
                           000002   306 	VSIZE=2 
      000819                        307 write_block::
      008899 88               [ 1]  308 	push a 
      00081A                        309 	_vars VSIZE
      00889A 52 02            [ 2]    1     sub sp,#VSIZE 
      00889C 1F 01            [ 2]  310 	ldw (XSAVE,sp),x 
      00889E 1E 06            [ 2]  311 	ldw x,(BSIZE,sp) 
      0088A0 27 13            [ 1]  312 	jreq 9$
      0088A2 1E 01            [ 2]  313 1$:	ldw x,(XSAVE,sp)
      0088A4 90 F6            [ 1]  314 	ld a,(y)
      0088A6 CD 88 1F         [ 4]  315 	call write_byte 
      0088A9 5C               [ 1]  316 	incw x 
      0088AA 90 5C            [ 1]  317 	incw y 
      0088AC 1F 01            [ 2]  318 	ldw (XSAVE,sp),x
      0088AE 1E 06            [ 2]  319 	ldw x,(BSIZE,sp)
      0088B0 5A               [ 2]  320 	decw x
      0088B1 1F 06            [ 2]  321 	ldw (BSIZE,sp),x 
      0088B3 26 ED            [ 1]  322 	jrne 1$
      0088B5                        323 9$:
      0088B5 1E 01            [ 2]  324 	ldw x,(XSAVE,sp)
      0088B7 CD 88 EF         [ 4]  325 	call incr_farptr
      00083A                        326 	_drop VSIZE
      0088BA 5B 02            [ 2]    1     addw sp,#VSIZE 
      0088BC 84               [ 1]  327 	pop a 
      0088BD 81               [ 4]  328 	ret 
                                    329 
                                    330 
                                    331 ;------------------------------------
                                    332 ; write n bytes to flash | eeprom 
                                    333 ; if the number of bytes is 
                                    334 ; >=128 it is faster to 
                                    335 ; use write_block
                                    336 ; the bytes are written one by 
                                    337 ; one and auto erased if required. 
                                    338 ; input:
                                    339 ;    farptr    dest address 
                                    340 ;    X         src address 
                                    341 ;    A         count 
                                    342 ; output:
                                    343 ;    none   
                                    344 ;----------------------------------
      0088BE                        345 write_nbytes:
      0088BE 90 89            [ 2]  346 	pushw y
      0088C0 88               [ 1]  347 	push a 
      0088C1 90 93            [ 1]  348 	ldw y,x
      0088C3 5F               [ 1]  349 	clrw x 
      0088C4                        350 1$:  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0088C4 90 F6            [ 1]  351 	ld a,(y)
      0088C6 90 5C            [ 1]  352 	incw y
      0088C8 CD 88 1F         [ 4]  353 	call write_byte 
      0088CB 5C               [ 1]  354 	incw x 
      0088CC 0A 01            [ 1]  355 	dec (1,sp)  
      0088CE 26 F4            [ 1]  356 	jrne 1$ 
      0088D0 84               [ 1]  357 9$: pop a 
      0088D1 90 85            [ 2]  358 	popw y 
      0088D3 81               [ 4]  359 	ret 
                                    360 
                                    361 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    362 ;;;  flash memory operations
                                    363 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    364 
                                    365 ;--------------------------
                                    366 ; align farptr to BLOCK_SIZE 
                                    367 ;---------------------------
      0088D4                        368 row_align:
      0088D4 A6 7F            [ 1]  369 	ld a,#0x7f 
      0088D6 C4 00 1A         [ 1]  370 	and a,farptr+2 
      0088D9 27 13            [ 1]  371 	jreq 1$ 
      0088DB CE 00 19         [ 2]  372 	ldw x,farptr+1 
      0088DE 1C 00 80         [ 2]  373 	addw x,#BLOCK_SIZE 
      0088E1 24 04            [ 1]  374 	jrnc 0$
      0088E3 72 5C 00 18      [ 1]  375 	inc farptr 
      0088E7 9F               [ 1]  376 0$: ld a,xl 
      0088E8 A4 80            [ 1]  377 	and a,#0x80
      0088EA 97               [ 1]  378 	ld xl,a
      0088EB CF 00 19         [ 2]  379 	ldw farptr+1,x  	
      0088EE 81               [ 4]  380 1$:	ret
                                    381 
                                    382 ;--------------------
                                    383 ; input:
                                    384 ;   X     increment 
                                    385 ; output:
                                    386 ;   farptr  incremented 
                                    387 ;---------------------
      0088EF                        388 incr_farptr:
      0088EF 72 BB 00 19      [ 2]  389 	addw x,farptr+1 
      0088F3 24 04            [ 1]  390 	jrnc 1$
      0088F5 72 5C 00 18      [ 1]  391 	inc farptr 
      0088F9 CF 00 19         [ 2]  392 1$:	ldw farptr+1,x  
      0088FC 81               [ 4]  393 	ret 
                                    394 
                                    395 ;-----------------------------------
                                    396 ; scan block for non zero byte 
                                    397 ; block are 128 bytes 
                                    398 ; input:
                                    399 ;    farptr     address block  
                                    400 ; output:
                                    401 ;     A     0 cleared, other not cleared  
                                    402 ;-----------------------------------
      0088FD                        403 scan_block:
      0088FD 5F               [ 1]  404 	clrw x 
      0088FE 92 AF 00 18      [ 5]  405 1$: ldf a,([farptr],x) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      008902 26 06            [ 1]  406 	jrne 2$
      008904 5C               [ 1]  407 	incw x 
      008905 A3 00 80         [ 2]  408 	cpw x,#BLOCK_SIZE 
      008908 25 F4            [ 1]  409 	jrult 1$ 
      00890A 81               [ 4]  410 2$:	ret 
                                    411 
                                    412 
                                    413 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                      1 ;;
                                      2 ; Copyright Jacques Deschênes 2019,2022 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                     32     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000001     5 DEBUG=1 ; set to 1 to include debugging code 
                                      6 
                           000000     7 SEPARATE=0 ; set to 1 for 'make separate' 
                                      8 
                                      9 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                     33 
                           000000    34 .if SEPARATE
                                     35 	.include "inc/nucleo_8s208.inc"
                                     36 	.include "inc/stm8s208.inc"
                                     37 	.include "inc/ascii.inc"
                                     38 	.include "inc/gen_macros.inc" 
                                     39 	.include "tbi_macros.inc" 
                                     40 .endif 
                                     41 
                                     42 ;    .list 
                                     43 
                                     44 
                                     45     .area CODE 
                                     46 
                                     47 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     48 ;;   UART1 subroutines
                                     49 ;;   used for user interface 
                                     50 ;;   communication channel.
                                     51 ;;   settings: 
                                     52 ;;		115200 8N1 no flow control
                                     53 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     54 
                                     55 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     56 ;;; Uart1 intterrupt handler 
                                     57 ;;; on receive 
                                     58 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     59 ;--------------------------
                                     60 ; UART1 receive character
                                     61 ; CTRL+C (ASCII 3)
                                     62 ; cancel program execution
                                     63 ; and fall back to command line
                                     64 ; CTRL+X reboot system 
                                     65 ;--------------------------
      00890B                         66 Uart1RxHandler: ; console receive char 
      00890B 72 0B 52 30 27   [ 2]   67 	btjf UART1_SR,#UART_SR_RXNE,5$
      008910 C6 52 31         [ 1]   68 	ld a,UART1_DR 
      008913 A1 03            [ 1]   69 	cp a,#CTRL_C 
      008915 26 06            [ 1]   70 	jrne 2$
      008917 CD 89 7D         [ 4]   71 	call putc 
      00891A CC 80 C6         [ 2]   72 	jp user_interrupted
      00891D                         73 2$:
      00891D A1 18            [ 1]   74 	cp a,#CAN ; CTRL_X 
      00891F 26 03            [ 1]   75 	jrne 3$
      008921 CC 81 32         [ 2]   76 	jp cold_start 	
      008924 88               [ 1]   77 3$:	push a 
      008925 A6 26            [ 1]   78 	ld a,#rx1_queue 
      008927 CB 00 2F         [ 1]   79 	add a,rx1_tail 
      00892A 5F               [ 1]   80 	clrw x 
      00892B 97               [ 1]   81 	ld xl,a 
      00892C 84               [ 1]   82 	pop a 
      00892D F7               [ 1]   83 	ld (x),a 
      00892E C6 00 2F         [ 1]   84 	ld a,rx1_tail 
      008931 4C               [ 1]   85 	inc a 
      008932 A4 07            [ 1]   86 	and a,#RX_QUEUE_SIZE-1
      008934 C7 00 2F         [ 1]   87 	ld rx1_tail,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      008937 80               [11]   88 5$:	iret 
                                     89 
                                     90 ;---------------------------------------------
                                     91 ; initialize UART1, 115200 8N1
                                     92 ; input:
                                     93 ;	none
                                     94 ; output:
                                     95 ;   none
                                     96 ;---------------------------------------------
      008938                         97 uart1_init:
      008938 72 1A 50 02      [ 1]   98     bset PA_DDR,#UART1_TX_PIN
      00893C 72 1A 50 03      [ 1]   99     bset PA_CR1,#UART1_TX_PIN 
      008940 72 1A 50 04      [ 1]  100     bset PA_CR2,#UART1_TX_PIN 
                                    101 ; enable UART1 clock
      008944 72 14 50 C7      [ 1]  102 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      008948                        103 uart1_set_baud: 
      008948 88               [ 1]  104 	push a 
                                    105 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    106 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008949 A6 E1            [ 1]  107 	ld a,#CLK_SWR_HSI
      00894B C1 50 C3         [ 1]  108 	cp a,CLK_CMSR 
      00894E 27 0A            [ 1]  109 	jreq 2$ 
      008950                        110 1$: ; 8 Mhz 	
      008950 35 05 52 33      [ 1]  111 	mov UART1_BRR2,#0x05 ; must be loaded first
      008954 35 04 52 32      [ 1]  112 	mov UART1_BRR1,#0x4
      008958 20 08            [ 2]  113 	jra 3$
      00895A                        114 2$: ; 16 Mhz 	
      00895A 35 0B 52 33      [ 1]  115 	mov UART1_BRR2,#0x0b ; must be loaded first
      00895E 35 08 52 32      [ 1]  116 	mov UART1_BRR1,#0x08
      008962                        117 3$:
      008962 72 5F 52 31      [ 1]  118     clr UART1_DR
      008966 35 2C 52 35      [ 1]  119 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      00896A 72 10 52 35      [ 1]  120 	bset UART1_CR2,#UART_CR2_SBK
      00896E 72 0D 52 30 FB   [ 2]  121     btjf UART1_SR,#UART_SR_TC,.
      008973 72 5F 00 2E      [ 1]  122     clr rx1_head 
      008977 72 5F 00 2F      [ 1]  123 	clr rx1_tail
      00897B 84               [ 1]  124 	pop a  
      00897C 81               [ 4]  125 	ret
                                    126 
                                    127 ;---------------------------------
                                    128 ; uart1_putc
                                    129 ; send a character via UART1
                                    130 ; input:
                                    131 ;    A  	character to send
                                    132 ;---------------------------------
      00897D                        133 putc:: ; console output always on UART1
      00897D                        134 uart1_putc:: 
      00897D 72 0F 52 30 FB   [ 2]  135 	btjf UART1_SR,#UART_SR_TXE,.
      008982 C7 52 31         [ 1]  136 	ld UART1_DR,a 
      008985 81               [ 4]  137 	ret 
                                    138 
                                    139 
                                    140 ;---------------------------------
                                    141 ; Query for character in rx1_queue
                                    142 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                    143 ;   none 
                                    144 ; output:
                                    145 ;   A     0 no charcter available
                                    146 ;   Z     1 no character available
                                    147 ;---------------------------------
      008986                        148 qgetc::
      008986                        149 uart1_qgetc::
      008986 C6 00 2E         [ 1]  150 	ld a,rx1_head 
      008989 C0 00 2F         [ 1]  151 	sub a,rx1_tail 
      00898C 81               [ 4]  152 	ret 
                                    153 
                                    154 ;---------------------------------
                                    155 ; wait character from UART1 
                                    156 ; input:
                                    157 ;   none
                                    158 ; output:
                                    159 ;   A 			char  
                                    160 ;--------------------------------	
      00898D                        161 getc:: ;console input
      00898D                        162 uart1_getc::
      00898D CD 89 86         [ 4]  163 	call uart1_qgetc
      008990 27 FB            [ 1]  164 	jreq uart1_getc 
      008992 89               [ 2]  165 	pushw x 
                                    166 ;; rx1_queue must be in page 0 	
      008993 A6 26            [ 1]  167 	ld a,#rx1_queue
      008995 CB 00 2E         [ 1]  168 	add a,rx1_head 
      008998 5F               [ 1]  169 	clrw x  
      008999 97               [ 1]  170 	ld xl,a 
      00899A F6               [ 1]  171 	ld a,(x)
      00899B 88               [ 1]  172 	push a
      00899C C6 00 2E         [ 1]  173 	ld a,rx1_head 
      00899F 4C               [ 1]  174 	inc a 
      0089A0 A4 07            [ 1]  175 	and a,#RX_QUEUE_SIZE-1
      0089A2 C7 00 2E         [ 1]  176 	ld rx1_head,a 
      0089A5 84               [ 1]  177 	pop a  
      0089A6 85               [ 2]  178 	popw x
      0089A7 81               [ 4]  179 	ret 
                                    180 
                                    181 ;-----------------------------
                                    182 ;  constants replacing 
                                    183 ;  ANSI sequence received 
                                    184 ;  from terminal.
                                    185 ;  These are the ANSI sequences
                                    186 ;  accepted by function readln
                                    187 ;------------------------------
                           000080   188     ARROW_LEFT=128
                           000081   189     ARROW_RIGHT=129
                           000082   190     HOME=130
                           000083   191     KEY_END=131
                           000084   192     SUP=132 
                                    193 
      0089A8 43 81 44 80 48 82 46   194 convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',KEY_END,'3',SUP,0,0
             83 33 84 00 00
                                    195 
                                    196 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                    197 ; receive ANSI ESC 
                                    198 ; sequence and convert it
                                    199 ; to a single character code 
                                    200 ; in range {128..255}
                                    201 ; This is called after receiving 
                                    202 ; ESC character. 
                                    203 ; ignored sequence return 0 
                                    204 ; output:
                                    205 ;   A    converted character 
                                    206 ;-------------------------------
      0089B4                        207 get_escape:
      0089B4 CD 89 8D         [ 4]  208     call getc 
      0089B7 A1 5B            [ 1]  209     cp a,#'[ ; this character is expected after ESC 
      0089B9 27 02            [ 1]  210     jreq 1$
      0089BB 4F               [ 1]  211     clr a
      0089BC 81               [ 4]  212     ret
      0089BD CD 89 8D         [ 4]  213 1$: call getc 
      0089C0 AE 89 A8         [ 2]  214     ldw x,#convert_table
      0089C3                        215 2$:
      0089C3 F1               [ 1]  216     cp a,(x)
      0089C4 27 08            [ 1]  217     jreq 4$
      0089C6 1C 00 02         [ 2]  218     addw x,#2
      0089C9 7D               [ 1]  219     tnz (x)
      0089CA 26 F7            [ 1]  220     jrne 2$
      0089CC 4F               [ 1]  221     clr a
      0089CD 81               [ 4]  222     ret 
      0089CE 5C               [ 1]  223 4$: incw x 
      0089CF F6               [ 1]  224     ld a,(x)
      0089D0 A1 84            [ 1]  225     cp a,#SUP
      0089D2 26 05            [ 1]  226     jrne 5$
      0089D4 88               [ 1]  227     push a 
      0089D5 CD 89 8D         [ 4]  228     call getc
      0089D8 84               [ 1]  229     pop a 
      0089D9                        230 5$:
      0089D9 81               [ 4]  231     ret 
                                    232 
                                    233 
                                    234 ;-----------------------------
                                    235 ; send an ASCIZ string to UART1 
                                    236 ; input: 
                                    237 ;   x 		char * 
                                    238 ; output:
                                    239 ;   none 
                                    240 ;-------------------------------
      0089DA                        241 puts::
      0089DA F6               [ 1]  242     ld a,(x)
      0089DB 27 06            [ 1]  243 	jreq 1$
      0089DD CD 89 7D         [ 4]  244 	call putc 
      0089E0 5C               [ 1]  245 	incw x 
      0089E1 20 F7            [ 2]  246 	jra puts 
      0089E3 81               [ 4]  247 1$:	ret 
                                    248 
                                    249 
                                    250 ;---------------------------
                                    251 ; delete character at left 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                    252 ; of cursor on terminal 
                                    253 ; input:
                                    254 ;   none 
                                    255 ; output:
                                    256 ;	none 
                                    257 ;---------------------------
      0089E4                        258 bksp:
      0089E4 A6 08            [ 1]  259 	ld a,#BS 
      0089E6 CD 89 7D         [ 4]  260 	call putc 
      0089E9 A6 20            [ 1]  261 	ld a,#SPACE 
      0089EB CD 89 7D         [ 4]  262 	call putc 
      0089EE A6 08            [ 1]  263 	ld a,#BS 
      0089F0 CD 89 7D         [ 4]  264 	call putc 
      0089F3 81               [ 4]  265 	ret 
                                    266 ;---------------------------
                                    267 ; delete n character left of cursor 
                                    268 ; at terminal.
                                    269 ; input: 
                                    270 ;   A   number of characters to delete.
                                    271 ; output:
                                    272 ;    none 
                                    273 ;--------------------------	
      0089F4                        274 delete_nchar:
      0089F4 88               [ 1]  275 	push a 
      0089F5 0D 01            [ 1]  276 0$:	tnz (1,sp)
      0089F7 27 07            [ 1]  277 	jreq 1$
      0089F9 CD 89 E4         [ 4]  278 	call bksp 
      0089FC 0A 01            [ 1]  279 	dec (1,sp)
      0089FE 20 F5            [ 2]  280 	jra 0$
      008A00 84               [ 1]  281 1$:	pop a 
      008A01 81               [ 4]  282 	ret
                                    283 
                                    284 ;--------------------------
                                    285 ; send ANSI escape sequence
                                    286 ; ANSI: ESC[
                                    287 ; note: ESC is ASCII 27
                                    288 ;       [   is ASCII 91  
                                    289 ;-------------------------- 
      008A02                        290 send_escape:
      008A02 A6 1B            [ 1]  291 	ld a,#ESC 
      008A04 CD 89 7D         [ 4]  292 	call putc 
      008A07 A6 5B            [ 1]  293 	ld a,#'[
      008A09 CD 89 7D         [ 4]  294 	call putc 
      008A0C 81               [ 4]  295 	ret 
                                    296 
                                    297 ;---------------------
                                    298 ;send ANSI parameter value
                                    299 ; ANSI parameter values are 
                                    300 ; sent as ASCII charater 
                                    301 ; not as binary number.
                                    302 ; this routine 
                                    303 ; convert binary number to 
                                    304 ; ASCII string and send it.
                                    305 ; expected range {0..99}
                                    306 ; input: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                    307 ; 	A {0..99} 
                                    308 ; output:
                                    309 ;   none 
                                    310 ;---------------------
      008A0D                        311 send_parameter:
      008A0D 89               [ 2]  312 	pushw x 
      008A0E 5F               [ 1]  313 	clrw x 
      008A0F 97               [ 1]  314 	ld xl,a 
      008A10 A6 0A            [ 1]  315 	ld a,#10 
      008A12 62               [ 2]  316 	div x,a 
      008A13 95               [ 1]  317 	ld xh,a 
      008A14 9F               [ 1]  318 	ld a,xl
      008A15 4D               [ 1]  319     tnz a 
      008A16 27 0B            [ 1]  320     jreq 2$
      008A18 A1 09            [ 1]  321 	cp a,#9 
      008A1A 23 02            [ 2]  322 	jrule 1$
      008A1C A6 39            [ 1]  323 	ld a,#'9
      008A1E                        324 1$:
      008A1E AB 30            [ 1]  325 	add a,#'0 
      008A20 CD 89 7D         [ 4]  326 	call putc
      008A23 9E               [ 1]  327 2$:	ld a,xh 
      008A24 AB 30            [ 1]  328 	add a,#'0
      008A26 CD 89 7D         [ 4]  329 	call putc 
      008A29 85               [ 2]  330 	popw x 
      008A2A 81               [ 4]  331 	ret 
                                    332 
                                    333 ;--------------------------
                                    334 ; move cursor left n character
                                    335 ; ANSI: ESC[PnD 
                                    336 ; 'Pn' est a numerical parameter
                                    337 ; specifying number of characters 
                                    338 ; displacement.
                                    339 ; input:
                                    340 ;   A     character count
                                    341 ; output:
                                    342 ;   none
                                    343 ;--------------------------
      008A2B                        344 move_left:
      008A2B 88               [ 1]  345 	push a 
      008A2C CD 8A 02         [ 4]  346 	call send_escape
      008A2F 84               [ 1]  347     pop a
      008A30 CD 8A 0D         [ 4]  348 	call send_parameter 
      008A33 A6 44            [ 1]  349 	ld a,#'D 
      008A35 CD 89 7D         [ 4]  350 	call putc 
      008A38 81               [ 4]  351 	ret	
                                    352 
                                    353 
                                    354 ;--------------------------
                                    355 ; move cursor right n character 
                                    356 ; ANSI: ESC[PnC 
                                    357 ; input:
                                    358 ;   A     character count
                                    359 ; output:
                                    360 ;   none
                                    361 ;--------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      008A39                        362 move_right:
      008A39 88               [ 1]  363 	push a 
      008A3A CD 8A 02         [ 4]  364 	call send_escape
      008A3D 84               [ 1]  365     pop a
      008A3E CD 8A 0D         [ 4]  366 	call send_parameter 
      008A41 A6 43            [ 1]  367 	ld a,#'C 
      008A43 CD 89 7D         [ 4]  368 	call putc 
      008A46 81               [ 4]  369 	ret 
                                    370 
                                    371 
                                    372 ;--------------------------
                                    373 ; print n spaces on terminal
                                    374 ; input:
                                    375 ;  X 		number of spaces 
                                    376 ; output:
                                    377 ;	none 
                                    378 ;---------------------------
      008A47                        379 spaces::
      008A47 A6 20            [ 1]  380 	ld a,#SPACE 
      008A49 5D               [ 2]  381 1$:	tnzw x
      008A4A 27 06            [ 1]  382 	jreq 9$
      008A4C CD 89 7D         [ 4]  383 	call putc 
      008A4F 5A               [ 2]  384 	decw x
      008A50 20 F7            [ 2]  385 	jra 1$
      008A52                        386 9$: 
      008A52 81               [ 4]  387 	ret 
                                    388 
                                    389 ;--------------------------
                                    390 ; insert character in text 
                                    391 ; line 
                                    392 ; input:
                                    393 ;   A       character to insert 
                                    394 ;   xl      line length
                                    395 ;   xh      insert position 
                                    396 ;   Y       line pointer 
                                    397 ; output:
                                    398 ;   Y       updated Y 
                                    399 ;-------------------------
                           000001   400 	IPOS=1
                           000002   401 	KCHAR=2 
                           000003   402     LLEN=3 
                           000003   403 	VSISE=3 
      008A53                        404 insert_char: 
      0009D3                        405 	_vars VSIZE 
      008A53 52 02            [ 2]    1     sub sp,#VSIZE 
      008A55 6B 02            [ 1]  406     ld (KCHAR,sp),a 
      008A57 9E               [ 1]  407     ld a,xh 
      008A58 6B 01            [ 1]  408 	ld (IPOS,sp),a
      008A5A 9F               [ 1]  409     ld a,xl 
      008A5B 6B 03            [ 1]  410     ld (LLEN,sp),a  
      008A5D 93               [ 1]  411     ldw x,y
      008A5E 5C               [ 1]  412     incw x 
      008A5F 7B 03            [ 1]  413     ld a,(LLEN,sp)
      008A61 10 01            [ 1]  414     sub a,(IPOS,sp)
      008A63 4C               [ 1]  415     inc a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      008A64 C7 00 0F         [ 1]  416     ld acc8,a 
      008A67 72 5F 00 0E      [ 1]  417     clr acc16
      008A6B CD 94 35         [ 4]  418     call move
      008A6E 90 AE 16 68      [ 2]  419     ldw y,#tib 
      008A72 7B 01            [ 1]  420     ld a,(IPOS,sp)
      008A74 C7 00 0F         [ 1]  421     ld acc8,a 
      008A77 72 B9 00 0E      [ 2]  422     addw y,acc16 
      008A7B 7B 02            [ 1]  423     ld a,(KCHAR,sp)
      008A7D 90 F7            [ 1]  424     ld (y),a
      008A7F 90 5C            [ 1]  425     incw y  
      008A81 7B 01            [ 1]  426     ld a,(IPOS,sp)
      008A83 CD 8A 2B         [ 4]  427     call move_left
      008A86 AE 16 68         [ 2]  428     ldw x,#tib 
      008A89 CD 89 DA         [ 4]  429     call puts 
      008A8C 7B 03            [ 1]  430     ld a,(LLEN,sp)
      008A8E 10 01            [ 1]  431     sub a,(IPOS,sp) 
      008A90 CD 8A 2B         [ 4]  432     call move_left 
      000A13                        433 	_drop VSIZE 
      008A93 5B 02            [ 2]    1     addw sp,#VSIZE 
      008A95 81               [ 4]  434 	ret 
                                    435 
                                    436 
                                    437 ;--------------------------
                                    438 ; delete character under cursor
                                    439 ; input:
                                    440 ;   A       line length   
                                    441 ;   xl      delete position
                                    442 ;   Y       line pointer 
                                    443 ;-------------------------
                           000001   444 	CPOS=1
                           000002   445 	LLEN=2
                           000002   446 	VSIZE=2
      008A96                        447 delete_under:
      000A16                        448 	_vars VSIZE 
      008A96 52 02            [ 2]    1     sub sp,#VSIZE 
      008A98 6B 02            [ 1]  449     ld (LLEN,sp),a 
      008A9A 9F               [ 1]  450     ld a,xl 
      008A9B 6B 01            [ 1]  451     ld (CPOS,sp),a 
      008A9D 93               [ 1]  452     ldw x,y ; move destination
      008A9E 90 5C            [ 1]  453     incw y  ; move source 
      008AA0 7B 02            [ 1]  454     ld a,(LLEN,sp)
      008AA2 10 01            [ 1]  455     sub a,(CPOS,sp)
      008AA4 4C               [ 1]  456     inc a ; move including zero at end.
      008AA5 C7 00 0F         [ 1]  457     ld acc8,a 
      008AA8 72 5F 00 0E      [ 1]  458     clr acc16 
      008AAC CD 94 35         [ 4]  459 	call move 
      008AAF 90 AE 16 68      [ 2]  460     ldw y,#tib 
      008AB3 7B 01            [ 1]  461     ld a,(CPOS,sp)
      008AB5 C7 00 0F         [ 1]  462     ld acc8,a 
      008AB8 72 B9 00 0E      [ 2]  463     addw y,acc16 
      008ABC 93               [ 1]  464     ldw x,y 
      008ABD CD 89 DA         [ 4]  465     call puts 
      008AC0 A6 20            [ 1]  466     ld a,#SPACE  
      008AC2 CD 89 7D         [ 4]  467     call putc
      008AC5 7B 02            [ 1]  468     ld a,(LLEN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      008AC7 10 01            [ 1]  469     sub a,(CPOS,sp)
      008AC9 CD 8A 2B         [ 4]  470     call move_left 
      008ACC 0A 02            [ 1]  471     dec (LLEN,sp)
      000A4E                        472 	_drop VSIZE 
      008ACE 5B 02            [ 2]    1     addw sp,#VSIZE 
      008AD0 81               [ 4]  473 	ret 
                                    474 
                                    475 ;-----------------------------
                                    476 ; send ANSI sequence to delete
                                    477 ; whole line. Cursor position
                                    478 ; is not updated.
                                    479 ; ANSI: ESC[2K
                                    480 ; input:
                                    481 ;   none
                                    482 ; output:
                                    483 ;   none 
                                    484 ;-----------------------------
      008AD1                        485 delete_line:
      008AD1 CD 8A 02         [ 4]  486     call send_escape
      008AD4 A6 32            [ 1]  487 	ld a,#'2
      008AD6 CD 89 7D         [ 4]  488 	call putc 
      008AD9 A6 4B            [ 1]  489 	ld a,#'K 
      008ADB CD 89 7D         [ 4]  490 	call putc 
      008ADE 81               [ 4]  491 	ret 
                                    492 
                                    493 
                                    494 
                                    495 ;------------------------------------
                                    496 ; read a line of text from terminal
                                    497 ;  touches de contrôle
                                    498 ;    BS   efface caractère à gauche 
                                    499 ;    ln+CTRL_E  edit ligne# 'ln' 
                                    500 ;    CTRL_R  répète dernière ligne saisie
                                    501 ;    CTRL_D  supprime ligne 
                                    502 ;    HOME  va au début de la ligne 
                                    503 ;    KEY_END  va à la fin de la ligne 
                                    504 ;    ARROW_LEFT  un caractère vers la gauche 
                                    505 ;    ARROW_RIGHT  un caractère vers la droite 
                                    506 ;    CTRL_O  commute entre insert/overwrite
                                    507 ; input:
                                    508 ;	none
                                    509 ; local variable on stack:
                                    510 ;	LL  line length
                                    511 ;   RXCHAR last received character 
                                    512 ; output:
                                    513 ;   text in tib  buffer
                                    514 ;   count  line length 
                                    515 ;------------------------------------
                                    516 	; local variables
                           000001   517 	LL_HB=1
                           000001   518 	RXCHAR = 1 ; last char received
                           000002   519 	LL = 2  ; accepted line length
                           000003   520 	CPOS=3  ; cursor position 
                           000004   521 	OVRWR=4 ; overwrite flag 
                           000004   522 	VSIZE=4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      008ADF                        523 readln::
      000A5F                        524 	_vars VSIZE 
      008ADF 52 04            [ 2]    1     sub sp,#VSIZE 
      008AE1 5F               [ 1]  525 	clrw x 
      008AE2 1F 02            [ 2]  526 	ldw (LL,sp),x 
      008AE4 1F 03            [ 2]  527 	ldw (CPOS,sp),x 
      008AE6 03 04            [ 1]  528 	cpl (OVRWR,sp) ; default to overwrite mode 
      008AE8 90 AE 16 68      [ 2]  529  	ldw y,#tib ; input buffer
      008AEC                        530 readln_loop:
      008AEC CD 89 8D         [ 4]  531 	call getc
      008AEF 6B 01            [ 1]  532 	ld (RXCHAR,sp),a
      008AF1 A1 1B            [ 1]  533     cp a,#ESC 
      008AF3 26 05            [ 1]  534     jrne 0$
      008AF5 CD 89 B4         [ 4]  535     call get_escape 
      008AF8 6B 01            [ 1]  536     ld (RXCHAR,sp),a 
      008AFA A1 0D            [ 1]  537 0$:	cp a,#CR
      008AFC 26 03            [ 1]  538 	jrne 1$
      008AFE CC 8C 88         [ 2]  539 	jp readln_quit
      008B01 A1 0A            [ 1]  540 1$:	cp a,#LF 
      008B03 26 03            [ 1]  541 	jrne 2$ 
      008B05 CC 8C 88         [ 2]  542 	jp readln_quit
      008B08                        543 2$:
      008B08 A1 08            [ 1]  544 	cp a,#BS
      008B0A 26 12            [ 1]  545 	jrne 3$
                                    546 ; delete left 
      008B0C 0D 03            [ 1]  547     tnz (CPOS,sp)
      008B0E 27 DC            [ 1]  548     jreq readln_loop 
      008B10 A6 01            [ 1]  549     ld a,#1 
      008B12 CD 8A 2B         [ 4]  550     call move_left
      008B15 0A 03            [ 1]  551     dec (CPOS,sp)
      008B17 90 5A            [ 2]  552     decw y 
      008B19 7B 03            [ 1]  553     ld a,(CPOS,sp) 
      008B1B CC 8C 34         [ 2]  554     jp 12$
      008B1E                        555 3$:
      008B1E A1 04            [ 1]  556 	cp a,#CTRL_D
      008B20 26 1A            [ 1]  557 	jrne 4$
                                    558 ;delete line 
      008B22 CD 8A D1         [ 4]  559 	call delete_line 
      008B25 7B 03            [ 1]  560     ld a,(CPOS,sp)
      008B27 4C               [ 1]  561     inc a 
      008B28 CD 8A 2B         [ 4]  562     call move_left 
      008B2B A6 3E            [ 1]  563 	ld a,#'> 
      008B2D CD 89 7D         [ 4]  564 	call putc 
      008B30 90 AE 16 68      [ 2]  565 	ldw y,#tib
      008B34 90 7F            [ 1]  566 	clr (y)
      008B36 0F 02            [ 1]  567 	clr (LL,sp)
      008B38 0F 03            [ 1]  568 	clr (CPOS,sp)
      008B3A 20 B0            [ 2]  569 	jra readln_loop
      008B3C                        570 4$:
      008B3C A1 12            [ 1]  571 	cp a,#CTRL_R 
      008B3E 26 21            [ 1]  572 	jrne 5$
                                    573 ;reprint 
      008B40 0D 02            [ 1]  574 	tnz (LL,sp)
      008B42 26 A8            [ 1]  575 	jrne readln_loop
      008B44 AE 16 68         [ 2]  576 	ldw x,#tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      008B47 CD 94 09         [ 4]  577 	call strlen 
      008B4A 90 AE 16 68      [ 2]  578 	ldw y,#tib 
      008B4E 27 9C            [ 1]  579 	jreq readln_loop
      008B50 6B 02            [ 1]  580 	ld (LL,sp),a 
      008B52 6B 03            [ 1]  581     ld (CPOS,sp),a
      008B54 AE 16 68         [ 2]  582 	ldw x,#tib 
      008B57 CD 89 DA         [ 4]  583 	call puts
      008B5A 0F 01            [ 1]  584 	clr (LL_HB,sp)
      008B5C 72 F9 01         [ 2]  585 	addw y,(LL_HB,sp)
      008B5F 20 8B            [ 2]  586 	jra readln_loop 
      008B61                        587 5$:
      008B61 A1 05            [ 1]  588 	cp a,#CTRL_E 
      008B63 26 49            [ 1]  589 	jrne 6$
                                    590 ;edit line number 
      008B65 AE 16 68         [ 2]  591 	ldw x,#tib 
      008B68 CD 98 BC         [ 4]  592 	call atoi24
      008B6B CE 00 0E         [ 2]  593 	ldw x,acc16
      008B6E CD 8C C2         [ 4]  594 	call search_lineno
      008B71 5D               [ 2]  595 	tnzw x 
      008B72 26 0B            [ 1]  596 	jrne 51$
      008B74 0F 02            [ 1]  597 	clr (LL,sp)
      008B76 90 AE 16 68      [ 2]  598 	ldw y,#tib
      008B7A 90 7F            [ 1]  599     clr (y) 	
      008B7C CC 8C 88         [ 2]  600 	jp readln_quit  
      008B7F                        601 51$:
      008B7F CF 00 05         [ 2]  602 	ldw basicptr,x
      008B82 E6 02            [ 1]  603 	ld a,(2,x)
      008B84 C7 00 04         [ 1]  604 	ld count,a 
      008B87 90 AE 16 68      [ 2]  605 	ldw y,#tib 
      008B8B CD 92 30         [ 4]  606 	call decompile 
      008B8E 0F 01            [ 1]  607 	clr (LL_HB,sp)
      008B90 A6 0D            [ 1]  608 	ld a,#CR 
      008B92 CD 89 7D         [ 4]  609 	call putc 
      008B95 A6 3E            [ 1]  610 	ld a,#'>
      008B97 CD 89 7D         [ 4]  611 	call putc
      008B9A AE 16 68         [ 2]  612     ldw x,#tib  
      008B9D CD 94 09         [ 4]  613 	call strlen 
      008BA0 6B 02            [ 1]  614 	ld (LL,sp),a 
      008BA2 CD 89 DA         [ 4]  615 	call puts 
      008BA5 90 93            [ 1]  616 	ldw y,x
      008BA7 7B 02            [ 1]  617     ld a,(LL,sp)
      008BA9 6B 03            [ 1]  618     ld (CPOS,sp),a  
      008BAB CC 8A EC         [ 2]  619 	jp readln_loop
      008BAE                        620 6$:
      008BAE A1 81            [ 1]  621 	cp a,#ARROW_RIGHT
      008BB0 26 15            [ 1]  622    	jrne 7$ 
                                    623 ; right arrow
      008BB2 7B 03            [ 1]  624 	ld a,(CPOS,sp)
      008BB4 11 02            [ 1]  625     cp a,(LL,sp)
      008BB6 2B 03            [ 1]  626     jrmi 61$
      008BB8 CC 8A EC         [ 2]  627     jp readln_loop 
      008BBB                        628 61$:
      008BBB A6 01            [ 1]  629     ld a,#1 
      008BBD CD 8A 39         [ 4]  630 	call move_right 
      008BC0 0C 03            [ 1]  631 	inc (CPOS,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      008BC2 90 5C            [ 1]  632     incw y 
      008BC4 CC 8A EC         [ 2]  633     jp readln_loop 
      008BC7 A1 80            [ 1]  634 7$: cp a,#ARROW_LEFT  
      008BC9 26 13            [ 1]  635 	jrne 8$
                                    636 ; left arrow 
      008BCB 0D 03            [ 1]  637 	tnz (CPOS,sp)
      008BCD 26 03            [ 1]  638 	jrne 71$
      008BCF CC 8A EC         [ 2]  639 	jp readln_loop
      008BD2                        640 71$:
      008BD2 A6 01            [ 1]  641     ld a,#1 
      008BD4 CD 8A 2B         [ 4]  642 	call move_left 
      008BD7 0A 03            [ 1]  643 	dec (CPOS,sp)
      008BD9 90 5A            [ 2]  644     decw y 
      008BDB CC 8A EC         [ 2]  645 	jp readln_loop 
      008BDE A1 82            [ 1]  646 8$: cp a,#HOME  
      008BE0 26 0E            [ 1]  647 	jrne 9$
                                    648 ; HOME 
      008BE2 7B 03            [ 1]  649     ld a,(CPOS,sp)
      008BE4 CD 8A 2B         [ 4]  650     call move_left 
      008BE7 0F 03            [ 1]  651 	clr (CPOS,sp)
      008BE9 90 AE 16 68      [ 2]  652     ldw y,#tib 
      008BED CC 8A EC         [ 2]  653 	jp readln_loop  
      008BF0 A1 83            [ 1]  654 9$: cp a,#KEY_END  
      008BF2 26 26            [ 1]  655 	jrne 10$
                                    656 ; KEY_END 
      008BF4 7B 03            [ 1]  657 	ld a,(CPOS,sp)
      008BF6 11 02            [ 1]  658 	cp a,(LL,sp)
      008BF8 26 03            [ 1]  659 	jrne 91$
      008BFA CC 8A EC         [ 2]  660 	jp readln_loop 
      008BFD                        661 91$:
      008BFD 7B 02            [ 1]  662 	ld a,(LL,sp)
      008BFF 10 03            [ 1]  663 	sub a,(CPOS,sp)
      008C01 CD 8A 39         [ 4]  664 	call move_right 
      008C04 7B 02            [ 1]  665 	ld a,(LL,sp)
      008C06 6B 03            [ 1]  666 	ld (CPOS,sp),a
      008C08 90 AE 16 68      [ 2]  667     ldw y,#tib
      008C0C 72 5F 00 0E      [ 1]  668     clr acc16 
      008C10 C7 00 0F         [ 1]  669     ld acc8,a 
      008C13 72 B9 00 0E      [ 2]  670     addw y,acc16  
      008C17 CC 8A EC         [ 2]  671 	jp readln_loop 
      008C1A A1 0F            [ 1]  672 10$: cp a,#CTRL_O
      008C1C 26 0C            [ 1]  673 	jrne 11$ 
                                    674 ; toggle between insert/overwrite
      008C1E 03 04            [ 1]  675 	cpl (OVRWR,sp)
      008C20 90 89            [ 2]  676 	pushw y 
      008C22 CD A4 FD         [ 4]  677 	call beep_1khz
      008C25 90 85            [ 2]  678 	popw y 
      008C27 CC 8A EC         [ 2]  679 	jp readln_loop 
      008C2A A1 84            [ 1]  680 11$: cp a,#SUP 
      008C2C 26 11            [ 1]  681     jrne final_test 
                                    682 ; del character under cursor 
      008C2E 7B 03            [ 1]  683     ld a,(CPOS,sp)
      008C30 11 02            [ 1]  684     cp a,(LL,sp)
      008C32 2A 08            [ 1]  685     jrpl 13$
      008C34                        686 12$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      008C34 97               [ 1]  687     ld xl,a    ; cursor position 
      008C35 7B 02            [ 1]  688     ld a,(LL,sp)  ; line length
      008C37 CD 8A 96         [ 4]  689     call delete_under
      008C3A 0A 02            [ 1]  690     dec (LLEN,sp)
      008C3C                        691 13$:
      008C3C CC 8A EC         [ 2]  692     jp readln_loop 
      008C3F                        693 final_test:
      008C3F A1 20            [ 1]  694 	cp a,#SPACE
      008C41 2A 03            [ 1]  695 	jrpl accept_char
      008C43 CC 8A EC         [ 2]  696 	jp readln_loop
      008C46                        697 accept_char:
      008C46 A6 4F            [ 1]  698 	ld a,#TIB_SIZE-1
      008C48 11 02            [ 1]  699 	cp a, (LL,sp)
      008C4A 2A 03            [ 1]  700 	jrpl 1$
      008C4C CC 8A EC         [ 2]  701 	jp readln_loop
      008C4F 0D 04            [ 1]  702 1$:	tnz (OVRWR,sp)
      008C51 26 18            [ 1]  703 	jrne overwrite
                                    704 ; insert mode 
      008C53 7B 03            [ 1]  705     ld a,(CPOS,sp)
      008C55 11 02            [ 1]  706     cp a,(LL,sp)
      008C57 27 12            [ 1]  707     jreq overwrite
      008C59 7B 02            [ 1]  708     ld a,(LL,sp)
      008C5B 97               [ 1]  709     ld xl,a 
      008C5C 7B 03            [ 1]  710     ld a,(CPOS,sp)
      008C5E 95               [ 1]  711     ld xh,a
      008C5F 7B 01            [ 1]  712     ld a,(RXCHAR,sp)
      008C61 CD 8A 53         [ 4]  713     call insert_char
      008C64 0C 02            [ 1]  714     inc (LLEN,sp)
      008C66 0C 03            [ 1]  715     inc (CPOS,sp)
      008C68 CC 8A EC         [ 2]  716     jp readln_loop 
      008C6B                        717 overwrite:
      008C6B 7B 01            [ 1]  718 	ld a,(RXCHAR,sp)
      008C6D 90 F7            [ 1]  719 	ld (y),a
      008C6F 90 5C            [ 1]  720     incw y
      008C71 CD 89 7D         [ 4]  721     call putc 
      008C74 7B 03            [ 1]  722 	ld a,(CPOS,sp)
      008C76 11 02            [ 1]  723 	cp a,(LL,sp)
      008C78 2B 09            [ 1]  724 	jrmi 1$
      008C7A 90 7F            [ 1]  725 	clr (y)
      008C7C 0C 02            [ 1]  726 	inc (LL,sp)
      008C7E 0C 03            [ 1]  727     inc (CPOS,sp)
      008C80 CC 8A EC         [ 2]  728 	jp readln_loop 
      008C83                        729 1$:	
      008C83 0C 03            [ 1]  730 	inc (CPOS,sp)
      008C85 CC 8A EC         [ 2]  731 	jp readln_loop 
      008C88                        732 readln_quit:
      008C88 90 AE 16 68      [ 2]  733 	ldw y,#tib
      008C8C 0F 01            [ 1]  734     clr (LL_HB,sp) 
      008C8E 72 F9 01         [ 2]  735     addw y,(LL_HB,sp)
      008C91 90 7F            [ 1]  736     clr (y)
      008C93 7B 02            [ 1]  737 	ld a,(LL,sp)
      008C95 C7 00 04         [ 1]  738 	ld count,a 
      008C98 A6 0D            [ 1]  739 	ld a,#CR
      008C9A CD 89 7D         [ 4]  740 	call putc
      000C1D                        741 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      008C9D 5B 04            [ 2]    1     addw sp,#VSIZE 
      008C9F 81               [ 4]  742 	ret
                                    743 
                                    744 ;------------------------------
                                    745 ; print byte  in hexadecimal 
                                    746 ; on console
                                    747 ; input:
                                    748 ;    A		byte to print
                                    749 ;------------------------------
      008CA0                        750 print_hex::
      008CA0 88               [ 1]  751 	push a 
      008CA1 4E               [ 1]  752 	swap a 
      008CA2 CD 8C B7         [ 4]  753 	call to_hex_char 
      008CA5 CD 89 7D         [ 4]  754 	call putc 
      008CA8 7B 01            [ 1]  755     ld a,(1,sp) 
      008CAA CD 8C B7         [ 4]  756 	call to_hex_char
      008CAD CD 89 7D         [ 4]  757 	call putc
      008CB0 A6 20            [ 1]  758 	ld a,#SPACE 
      008CB2 CD 89 7D         [ 4]  759 	call putc 
      008CB5 84               [ 1]  760 	pop a 
      008CB6 81               [ 4]  761 	ret 
                                    762 
                                    763 ;----------------------------------
                                    764 ; convert to hexadecimal digit 
                                    765 ; input:
                                    766 ;   A       digit to convert 
                                    767 ; output:
                                    768 ;   A       hexdecimal character 
                                    769 ;----------------------------------
      008CB7                        770 to_hex_char::
      008CB7 A4 0F            [ 1]  771 	and a,#15 
      008CB9 A1 09            [ 1]  772 	cp a,#9 
      008CBB 23 02            [ 2]  773 	jrule 1$ 
      008CBD AB 07            [ 1]  774 	add a,#7
      008CBF AB 30            [ 1]  775 1$: add a,#'0 
      008CC1 81               [ 4]  776 	ret 
                                    777 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                      1 ;;
                                      2 ; Copyright Jacques Deschênes 2019,2020,2021,2022  
                                      3 ; This file is part of stm8_tbi 
                                      4 ;
                                      5 ;     stm8_tbi is free software: you can redistribute it and/or modify
                                      6 ;     it under the terms of the GNU General Public License as published by
                                      7 ;     the Free Software Foundation, either version 3 of the License, or
                                      8 ;     (at your option) any later version.
                                      9 ;
                                     10 ;     stm8_tbi is distributed in the hope that it will be useful,
                                     11 ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                     12 ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                     13 ;     GNU General Public License for more details.
                                     14 ;
                                     15 ;     You should have received a copy of the GNU General Public License
                                     16 ;     along with stm8_tbi.  If not, see <http://www.gnu.org/licenses/>.
                                     17 ;;
                                     18 
                                     19 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     20 ;;   compile BASIC source code to byte code
                                     21 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     22 
                                     23 
                                     24     .module COMPILER 
                                     25 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                     26     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000001     5 DEBUG=1 ; set to 1 to include debugging code 
                                      6 
                           000000     7 SEPARATE=0 ; set to 1 for 'make separate' 
                                      8 
                                      9 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                     27 
                           000000    28 .if SEPARATE
                                     29 	.include "inc/nucleo_8s208.inc"
                                     30 	.include "inc/stm8s208.inc"
                                     31 	.include "inc/ascii.inc"
                                     32 	.include "inc/gen_macros.inc" 
                                     33 	.include "tbi_macros.inc" 
                                     34 .endif 
                                     35 
                                     36     .area  CODE 
                                     37 
                                     38 ;-------------------------------------
                                     39 ; search text area for a line#
                                     40 ; input:
                                     41 ;   A           0 search from txbgn 
                                     42 ;			    1 search from basicptr 
                                     43 ;	X 			line# 
                                     44 ; output:
                                     45 ;   X 			addr of line | 0 
                                     46 ;   Y           line#|insert address if not found  
                                     47 ;-------------------------------------
                           000001    48 	LL=1 ; line length 
                           000002    49 	LB=2 ; line length low byte 
                           000002    50 	VSIZE=2 
      008CC2                         51 search_lineno::
      000C42                         52 	_vars VSIZE
      008CC2 52 02            [ 2]    1     sub sp,#VSIZE 
      008CC4 0F 01            [ 1]   53 	clr (LL,sp)
      008CC6 90 CE 00 1B      [ 2]   54 	ldw y,txtbgn
      008CCA 4D               [ 1]   55 	tnz a 
      008CCB 27 04            [ 1]   56 	jreq search_ln_loop
      008CCD 90 CE 00 05      [ 2]   57 	ldw y,basicptr 
      008CD1                         58 search_ln_loop:
      008CD1 90 C3 00 1D      [ 2]   59 	cpw y,txtend 
      008CD5 2A 10            [ 1]   60 	jrpl 8$
      008CD7 90 F3            [ 1]   61 	cpw x,(y)
      008CD9 27 0E            [ 1]   62 	jreq 9$
      008CDB 2B 0A            [ 1]   63 	jrmi 8$ 
      008CDD 90 E6 02         [ 1]   64 	ld a,(2,y)
      008CE0 6B 02            [ 1]   65 	ld (LB,sp),a 
      008CE2 72 F9 01         [ 2]   66 	addw y,(LL,sp)
      008CE5 20 EA            [ 2]   67 	jra search_ln_loop 
      008CE7                         68 8$: 
      008CE7 5F               [ 1]   69 	clrw x 	
      008CE8 51               [ 1]   70 	exgw x,y 
      000C69                         71 9$: _drop VSIZE
      008CE9 5B 02            [ 2]    1     addw sp,#VSIZE 
      008CEB 51               [ 1]   72 	exgw x,y   
      008CEC 81               [ 4]   73 	ret 
                                     74 
                                     75 ;-------------------------------------
                                     76 ; delete line at addr
                                     77 ; input:
                                     78 ;   X 		addr of line i.e DEST for move 
                                     79 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                           000001    80 	LLEN=1
                           000003    81 	SRC=3
                           000004    82 	VSIZE=4
      008CED                         83 del_line: 
      000C6D                         84 	_vars VSIZE 
      008CED 52 04            [ 2]    1     sub sp,#VSIZE 
      008CEF E6 02            [ 1]   85 	ld a,(2,x) ; line length
      008CF1 6B 02            [ 1]   86 	ld (LLEN+1,sp),a 
      008CF3 0F 01            [ 1]   87 	clr (LLEN,sp)
      008CF5 90 93            [ 1]   88 	ldw y,x  
      008CF7 72 F9 01         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      008CFA 17 03            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      008CFC 90 CE 00 1D      [ 2]   91 	ldw y,txtend 
      008D00 72 F2 03         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      008D03 90 CF 00 0E      [ 2]   93 	ldw acc16,y 
      008D07 16 03            [ 2]   94 	ldw y,(SRC,sp)    ; source
      008D09 CD 94 35         [ 4]   95 	call move
      008D0C 90 CE 00 1D      [ 2]   96 	ldw y,txtend 
      008D10 72 F2 01         [ 2]   97 	subw y,(LLEN,sp)
      008D13 90 CF 00 1D      [ 2]   98 	ldw txtend,y  
      000C97                         99 	_drop VSIZE     
      008D17 5B 04            [ 2]    1     addw sp,#VSIZE 
      008D19 81               [ 4]  100 	ret 
                                    101 
                                    102 ;---------------------------------------------
                                    103 ; create a gap in text area to 
                                    104 ; move new line in this gap
                                    105 ; input:
                                    106 ;    X 			addr gap start 
                                    107 ;    Y 			gap length 
                                    108 ; output:
                                    109 ;    X 			addr gap start 
                                    110 ;--------------------------------------------
                           000001   111 	DEST=1
                           000003   112 	SRC=3
                           000005   113 	LEN=5
                           000006   114 	VSIZE=6 
      008D1A                        115 create_gap:
      000C9A                        116 	_vars VSIZE
      008D1A 52 06            [ 2]    1     sub sp,#VSIZE 
      008D1C 1F 03            [ 2]  117 	ldw (SRC,sp),x 
      008D1E 17 05            [ 2]  118 	ldw (LEN,sp),y 
      008D20 90 CF 00 0E      [ 2]  119 	ldw acc16,y 
      008D24 90 93            [ 1]  120 	ldw y,x ; SRC
      008D26 72 BB 00 0E      [ 2]  121 	addw x,acc16  
      008D2A 1F 01            [ 2]  122 	ldw (DEST,sp),x 
                                    123 ;compute size to move 	
      008D2C CE 00 1D         [ 2]  124 	ldw x,txtend 
      008D2F 72 F0 03         [ 2]  125 	subw x,(SRC,sp)
      008D32 CF 00 0E         [ 2]  126 	ldw acc16,x ; size to move
      008D35 1E 01            [ 2]  127 	ldw x,(DEST,sp) 
      008D37 CD 94 35         [ 4]  128 	call move
      008D3A CE 00 1D         [ 2]  129 	ldw x,txtend
      008D3D 72 FB 05         [ 2]  130 	addw x,(LEN,sp)
      008D40 CF 00 1D         [ 2]  131 	ldw txtend,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      000CC3                        132 9$:	_drop VSIZE 
      008D43 5B 06            [ 2]    1     addw sp,#VSIZE 
      008D45 81               [ 4]  133 	ret 
                                    134 
                                    135 ;--------------------------------------------
                                    136 ; insert line in pad into text area 
                                    137 ; first search for already existing 
                                    138 ; replace existing 
                                    139 ; if new line empty delete existing one. 
                                    140 ; input:
                                    141 ;   ptr16		pointer to tokenized line  
                                    142 ; output:
                                    143 ;   none
                                    144 ;---------------------------------------------
                           000001   145 	DEST=1  ; text area insertion address 
                           000003   146 	SRC=3   ; str to insert address 
                           000005   147 	LINENO=5 ; line number 
                           000007   148 	LLEN=7 ; line length 
                           000008   149 	VSIZE=8  
      008D46                        150 insert_line:
      000CC6                        151 	_vars VSIZE 
      008D46 52 08            [ 2]    1     sub sp,#VSIZE 
      008D48 CE 00 1D         [ 2]  152 	ldw x,txtend  
      008D4B C3 00 1B         [ 2]  153 	cpw x,txtbgn 
      008D4E 26 19            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      008D50 AE 00 02         [ 2]  156 	ldw x,#2 
      008D53 72 D6 00 19      [ 4]  157 	ld a,([ptr16],x)
      008D57 A1 03            [ 1]  158 	cp a,#3
      008D59 27 5A            [ 1]  159 	jreq insert_ln_exit
      008D5B 5F               [ 1]  160 	clrw x 
      008D5C 97               [ 1]  161 	ld xl,a
      008D5D 1F 07            [ 2]  162 	ldw (LLEN,sp),x 
      008D5F CE 00 1B         [ 2]  163 	ldw x,txtbgn
      008D62 1F 01            [ 2]  164 	ldw (DEST,sp),x 
      008D64 CE 00 1D         [ 2]  165 	ldw x,txtend 
      008D67 20 38            [ 2]  166 	jra 4$
      008D69 72 CE 00 19      [ 5]  167 0$:	ldw x,[ptr16]
                                    168 ; line number
      008D6D 1F 05            [ 2]  169 	ldw (LINENO,sp),x 
      008D6F AE 00 02         [ 2]  170 	ldw x,#2 
      008D72 72 D6 00 19      [ 4]  171 	ld a,([ptr16],x)
      008D76 97               [ 1]  172 	ld xl,a
                                    173 ; line length
      008D77 1F 07            [ 2]  174 	ldw (LLEN,sp),x
                                    175 ; check if that line number already exit 	
      008D79 1E 05            [ 2]  176 	ldw x,(LINENO,sp)
      008D7B 4F               [ 1]  177 	clr a 
      008D7C CD 8C C2         [ 4]  178 	call search_lineno 
      008D7F 5D               [ 2]  179 	tnzw x 
      008D80 26 04            [ 1]  180 	jrne 2$
                                    181 ; line doesn't exit
                                    182 ; it will be inserted at this point.  	
      008D82 17 01            [ 2]  183 	ldw (DEST,sp),y 
      008D84 20 05            [ 2]  184 	jra 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                    185 ; line exit delete it.
                                    186 ; it will be replaced by new one 	
      008D86 1F 01            [ 2]  187 2$: ldw (DEST,sp),x 
      008D88 CD 8C ED         [ 4]  188 	call del_line
      008D8B                        189 3$: 
                                    190 ; insert new line or leave if LLEN==3
                                    191 ; LLEN==3 means empty line 
      008D8B A6 03            [ 1]  192 	ld a,#3
      008D8D 11 08            [ 1]  193 	cp a,(LLEN+1,sp)
      008D8F 27 24            [ 1]  194 	jreq insert_ln_exit ; empty line exit.
                                    195 ; if insertion point at txtend 
                                    196 ; move no need to create a gap 
      008D91 1E 01            [ 2]  197 	ldw x,(DEST,sp)
      008D93 C3 00 1D         [ 2]  198 	cpw x,txtend 
      008D96 27 09            [ 1]  199 	jreq 4$ 
                                    200 ; must create a gap
                                    201 ; at insertion point  
      008D98 1E 01            [ 2]  202 	ldw x,(DEST,sp)
      008D9A 16 07            [ 2]  203 	ldw y,(LLEN,sp)
      008D9C CD 8D 1A         [ 4]  204 	call create_gap
      008D9F 20 06            [ 2]  205 	jra 5$
      008DA1                        206 4$: 
      008DA1 72 FB 07         [ 2]  207 	addw x,(LLEN,sp)
      008DA4 CF 00 1D         [ 2]  208 	ldw txtend,x 	 
                                    209 ; move new line in gap 
      008DA7 1E 07            [ 2]  210 5$:	ldw x,(LLEN,sp)
      008DA9 CF 00 0E         [ 2]  211 	ldw acc16,x 
      008DAC 90 AE 16 B8      [ 2]  212 	ldw y,#pad ;SRC 
      008DB0 1E 01            [ 2]  213 	ldw x,(DEST,sp) ; dest address 
      008DB2 CD 94 35         [ 4]  214 	call move 
      008DB5                        215 insert_ln_exit:	
      000D35                        216 	_drop VSIZE
      008DB5 5B 08            [ 2]    1     addw sp,#VSIZE 
      008DB7 81               [ 4]  217 	ret
                                    218 
                                    219 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    220 ;; compiler routines        ;;
                                    221 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    222 ;------------------------------------
                                    223 ; parse quoted string 
                                    224 ; input:
                                    225 ;   Y 	pointer to tib 
                                    226 ;   X   pointer to output buffer 
                                    227 ; output:
                                    228 ;	buffer   parsed string
                                    229 ;------------------------------------
                           000001   230 	PREV = 1
                           000002   231 	CURR =2
                           000002   232 	VSIZE=2
      008DB8                        233 parse_quote: 
      000D38                        234 	_vars VSIZE 
      008DB8 52 02            [ 2]    1     sub sp,#VSIZE 
      008DBA 4F               [ 1]  235 	clr a
      008DBB 6B 01            [ 1]  236 1$:	ld (PREV,sp),a 
      008DBD                        237 2$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      008DBD 91 D6 01         [ 4]  238 	ld a,([in.w],y)
      008DC0 27 24            [ 1]  239 	jreq 6$
      008DC2 72 5C 00 02      [ 1]  240 	inc in 
      008DC6 6B 02            [ 1]  241 	ld (CURR,sp),a 
      008DC8 A6 5C            [ 1]  242 	ld a,#'\
      008DCA 11 01            [ 1]  243 	cp a, (PREV,sp)
      008DCC 26 0A            [ 1]  244 	jrne 3$
      008DCE 0F 01            [ 1]  245 	clr (PREV,sp)
      008DD0 7B 02            [ 1]  246 	ld a,(CURR,sp)
      008DD2 AD 1C            [ 4]  247 	callr convert_escape
      008DD4 F7               [ 1]  248 	ld (x),a 
      008DD5 5C               [ 1]  249 	incw x 
      008DD6 20 E5            [ 2]  250 	jra 2$
      008DD8                        251 3$:
      008DD8 7B 02            [ 1]  252 	ld a,(CURR,sp)
      008DDA A1 5C            [ 1]  253 	cp a,#'\'
      008DDC 27 DD            [ 1]  254 	jreq 1$
      008DDE A1 22            [ 1]  255 	cp a,#'"
      008DE0 27 04            [ 1]  256 	jreq 6$ 
      008DE2 F7               [ 1]  257 	ld (x),a 
      008DE3 5C               [ 1]  258 	incw x 
      008DE4 20 D7            [ 2]  259 	jra 2$
      008DE6                        260 6$:
      008DE6 7F               [ 1]  261 	clr (x)
      008DE7 5C               [ 1]  262 	incw x 
      008DE8 90 93            [ 1]  263 	ldw y,x 
      008DEA 5F               [ 1]  264 	clrw x 
      008DEB A6 02            [ 1]  265 	ld a,#TK_QSTR  
      000D6D                        266 	_drop VSIZE
      008DED 5B 02            [ 2]    1     addw sp,#VSIZE 
      008DEF 81               [ 4]  267 	ret 
                                    268 
                                    269 ;---------------------------------------
                                    270 ; called by parse_quote
                                    271 ; subtitute escaped character 
                                    272 ; by their ASCII value .
                                    273 ; input:
                                    274 ;   A  character following '\'
                                    275 ; output:
                                    276 ;   A  substitued char or same if not valid.
                                    277 ;---------------------------------------
      008DF0                        278 convert_escape:
      008DF0 89               [ 2]  279 	pushw x 
      008DF1 AE 8E 05         [ 2]  280 	ldw x,#escaped 
      008DF4 F1               [ 1]  281 1$:	cp a,(x)
      008DF5 27 06            [ 1]  282 	jreq 2$
      008DF7 7D               [ 1]  283 	tnz (x)
      008DF8 27 09            [ 1]  284 	jreq 3$
      008DFA 5C               [ 1]  285 	incw x 
      008DFB 20 F7            [ 2]  286 	jra 1$
      008DFD 1D 8E 05         [ 2]  287 2$: subw x,#escaped 
      008E00 9F               [ 1]  288 	ld a,xl 
      008E01 AB 07            [ 1]  289 	add a,#7
      008E03 85               [ 2]  290 3$:	popw x 
      008E04 81               [ 4]  291 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                    292 
      008E05 61 62 74 6E 76 66 72   293 escaped:: .asciz "abtnvfr"
             00
                                    294 
                                    295 ;-------------------------
                                    296 ; integer parser 
                                    297 ; input:
                                    298 ;   X 		point to output buffer  
                                    299 ;   Y 		point to tib 
                                    300 ;   A 	    first digit|'$' 
                                    301 ; output:  
                                    302 ;   X 		integer bits 15..0 
                                    303 ;   A 		TK_INTGR
                                    304 ;   acc24   24 bits integer 
                                    305 ;-------------------------
                           000001   306 	BASE=1
                           000002   307 	TCHAR=2 
                           000003   308 	XSAVE=3
                           000004   309 	VSIZE=4 
      008E0D                        310 parse_integer: ; { -- n }
      008E0D 89               [ 2]  311 	pushw x 	
      008E0E 4B 00            [ 1]  312 	push #0 ; TCHAR
      008E10 4B 0A            [ 1]  313 	push #10 ; BASE=10
      008E12 A1 24            [ 1]  314 	cp a,#'$
      008E14 26 04            [ 1]  315 	jrne 2$ 
      000D96                        316     _drop #1
      008E16 5B 01            [ 2]    1     addw sp,##1 
      008E18 4B 10            [ 1]  317 	push #16  ; BASE=16
      008E1A F7               [ 1]  318 2$:	ld (x),a 
      008E1B 5C               [ 1]  319 	incw x 
      008E1C 91 D6 01         [ 4]  320 	ld a,([in.w],y)
      008E1F 72 5C 00 02      [ 1]  321 	inc in 
      008E23 CD 98 B0         [ 4]  322 	call to_upper 
      008E26 6B 02            [ 1]  323 	ld (TCHAR,sp),a 
      008E28 CD 8E AE         [ 4]  324 	call is_digit 
      008E2B 25 ED            [ 1]  325 	jrc 2$
      008E2D A6 10            [ 1]  326 	ld a,#16 
      008E2F 11 01            [ 1]  327 	cp a,(BASE,sp)
      008E31 26 0A            [ 1]  328 	jrne 3$ 
      008E33 7B 02            [ 1]  329 	ld a,(TCHAR,sp)
      008E35 A1 41            [ 1]  330 	cp a,#'A 
      008E37 2B 04            [ 1]  331 	jrmi 3$ 
      008E39 A1 47            [ 1]  332 	cp a,#'G 
      008E3B 2B DD            [ 1]  333 	jrmi 2$ 
      008E3D 72 5A 00 02      [ 1]  334 3$: dec in 	
      008E41 7F               [ 1]  335     clr (x)
      008E42 1E 03            [ 2]  336 	ldw x,(XSAVE,sp)
      008E44 CD 98 BC         [ 4]  337 	call atoi24
      008E47 90 93            [ 1]  338 	ldw y,x
      008E49 C6 00 0D         [ 1]  339 	ld a,acc24 
      008E4C 90 F7            [ 1]  340 	ld (y),a 
      008E4E 72 A9 00 01      [ 2]  341 	addw y,#1  
      008E52 CE 00 0E         [ 2]  342 	ldw x,acc16 
      008E55 90 FF            [ 2]  343 	ldw (y),x 
      008E57 72 A9 00 02      [ 2]  344 	addw y,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      008E5B A6 84            [ 1]  345 	ld a,#TK_INTGR
      000DDD                        346 	_drop VSIZE  
      008E5D 5B 04            [ 2]    1     addw sp,#VSIZE 
      008E5F 81               [ 4]  347 	ret 	
                                    348 
                                    349 ;-------------------------
                                    350 ; binary integer parser
                                    351 ; build integer in acc24  
                                    352 ; input:
                                    353 ;   X 		point to output buffer  
                                    354 ;   Y 		point to tib 
                                    355 ;   A 	    '&' 
                                    356 ; output:  
                                    357 ;   buffer  TK_INTGR integer  
                                    358 ;   X 		int16 
                                    359 ;   A 		TK_INTGR
                                    360 ;   acc24    int24 
                                    361 ;-------------------------
                           000001   362 	BINARY=1 ; 24 bits integer 
                           000003   363 	VSIZE=3
      008E60                        364 parse_binary: ; { -- n }
      008E60 4B 00            [ 1]  365 	push #0
      008E62 4B 00            [ 1]  366 	push #0
      008E64 4B 00            [ 1]  367 	push #0
      008E66                        368 2$:	
      008E66 91 D6 01         [ 4]  369 	ld a,([in.w],y)
      008E69 72 5C 00 02      [ 1]  370 	inc in 
      008E6D A1 30            [ 1]  371 	cp a,#'0 
      008E6F 27 06            [ 1]  372 	jreq 3$
      008E71 A1 31            [ 1]  373 	cp a,#'1 
      008E73 27 02            [ 1]  374 	jreq 3$ 
      008E75 20 0B            [ 2]  375 	jra bin_exit 
      008E77 A0 30            [ 1]  376 3$: sub a,#'0 
      008E79 46               [ 1]  377 	rrc a
      008E7A 09 03            [ 1]  378 	rlc (BINARY+2,sp) 
      008E7C 09 02            [ 1]  379 	rlc (BINARY+1,sp)
      008E7E 09 01            [ 1]  380 	rlc (BINARY,sp) 
      008E80 20 E4            [ 2]  381 	jra 2$  
      008E82                        382 bin_exit:
      008E82 72 5A 00 02      [ 1]  383 	dec in 
      008E86 90 93            [ 1]  384 	ldw y,x
      008E88 7B 01            [ 1]  385 	ld a,(BINARY,sp)
      008E8A C7 00 0D         [ 1]  386 	ld acc24,a 
      008E8D 1E 02            [ 2]  387 	ldw x,(BINARY+1,sp)
      008E8F CF 00 0E         [ 2]  388 	ldw acc16,x
      008E92 90 FF            [ 2]  389 	ldw (y),x 
      008E94 72 A9 00 02      [ 2]  390 	addw y,#2  
      008E98 A6 84            [ 1]  391 	ld a,#TK_INTGR 	
      000E1A                        392 	_drop VSIZE 
      008E9A 5B 03            [ 2]    1     addw sp,#VSIZE 
      008E9C 81               [ 4]  393 	ret
                                    394 
                                    395 ;-------------------------------------
                                    396 ; check if A is a letter 
                                    397 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                    398 ;   A 			character to test 
                                    399 ; output:
                                    400 ;   C flag      1 true, 0 false 
                                    401 ;-------------------------------------
      008E9D                        402 is_alpha::
      008E9D A1 41            [ 1]  403 	cp a,#'A 
      008E9F 8C               [ 1]  404 	ccf 
      008EA0 24 0B            [ 1]  405 	jrnc 9$ 
      008EA2 A1 5B            [ 1]  406 	cp a,#'Z+1 
      008EA4 25 07            [ 1]  407 	jrc 9$ 
      008EA6 A1 61            [ 1]  408 	cp a,#'a 
      008EA8 8C               [ 1]  409 	ccf 
      008EA9 24 02            [ 1]  410 	jrnc 9$
      008EAB A1 7B            [ 1]  411 	cp a,#'z+1
      008EAD 81               [ 4]  412 9$: ret 	
                                    413 
                                    414 ;------------------------------------
                                    415 ; check if character in {'0'..'9'}
                                    416 ; input:
                                    417 ;    A  character to test
                                    418 ; output:
                                    419 ;    Carry  0 not digit | 1 digit
                                    420 ;------------------------------------
      008EAE                        421 is_digit::
      008EAE A1 30            [ 1]  422 	cp a,#'0
      008EB0 25 03            [ 1]  423 	jrc 1$
      008EB2 A1 3A            [ 1]  424     cp a,#'9+1
      008EB4 8C               [ 1]  425 	ccf 
      008EB5 8C               [ 1]  426 1$:	ccf 
      008EB6 81               [ 4]  427     ret
                                    428 
                                    429 ;-------------------------------------
                                    430 ; return true if character in  A 
                                    431 ; is letter or digit.
                                    432 ; input:
                                    433 ;   A     ASCII character 
                                    434 ; output:
                                    435 ;   A     no change 
                                    436 ;   Carry    0 false| 1 true 
                                    437 ;--------------------------------------
      008EB7                        438 is_alnum::
      008EB7 CD 8E AE         [ 4]  439 	call is_digit
      008EBA 25 03            [ 1]  440 	jrc 1$ 
      008EBC CD 8E 9D         [ 4]  441 	call is_alpha
      008EBF 81               [ 4]  442 1$:	ret 
                                    443 
                                    444 ;-----------------------------
                                    445 ; check if character in A 
                                    446 ; is a valid symbol character 
                                    447 ; valid: Upper case LETTER,DIGIT,'_' 
                                    448 ; input:
                                    449 ;    A   character to validate
                                    450 ; output:
                                    451 ;    Carry   set if valid 
                                    452 ;----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      008EC0                        453 is_symbol_char: 
      008EC0 A1 5F            [ 1]  454 	cp a,#'_ 
      008EC2 26 03            [ 1]  455 	jrne 1$
      008EC4 99               [ 1]  456 	scf 
      008EC5 20 03            [ 2]  457 	jra 9$ 
      008EC7 CD 8E B7         [ 4]  458 1$:	call is_alnum 
      008ECA 81               [ 4]  459 9$: ret 
                                    460 
                                    461 ;---------------------------
                                    462 ;  when lexical unit begin 
                                    463 ;  with a letter a symbol 
                                    464 ;  is expected.
                                    465 ; input:
                                    466 ;   A   first character of symbol 
                                    467 ;	X   point to output buffer 
                                    468 ;   Y   point to input text 
                                    469 ; output:
                                    470 ;	X   after symbol 
                                    471 ;   Y   point after lexical unit 
                                    472 ;---------------------------
      008ECB                        473 parse_symbol:
      008ECB 5C               [ 1]  474 	incw x ; keep space for TK_ID 
      008ECC                        475 symb_loop: 
                                    476 ; symbol are converted to upper case 
      008ECC CD 98 B0         [ 4]  477 	call to_upper  
      008ECF F7               [ 1]  478 	ld (x), a 
      008ED0 5C               [ 1]  479 	incw x
      008ED1 91 D6 01         [ 4]  480 	ld a,([in.w],y)
      008ED4 72 5C 00 02      [ 1]  481 	inc in 
      008ED8 CD 8E C0         [ 4]  482 	call is_symbol_char 
      008EDB 25 EF            [ 1]  483 	jrc symb_loop 
      008EDD 7F               [ 1]  484 	clr (x)
      008EDE 72 5A 00 02      [ 1]  485 	dec in  
      008EE2 81               [ 4]  486 	ret 
                                    487 
                                    488 ;---------------------------
                                    489 ;  token begin with a letter,
                                    490 ;  is keyword or variable. 	
                                    491 ; input:
                                    492 ;   X 		point to pad 
                                    493 ;   Y 		point to text
                                    494 ;   A 	    first letter  
                                    495 ; output:
                                    496 ;   X		exec_addr|var_addr 
                                    497 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC  
                                    498 ;   pad 	keyword|var_name  
                                    499 ;--------------------------  
                           000001   500 	XFIRST=1
                           000002   501 	VSIZE=2
      008EE3                        502 parse_keyword: 
      008EE3 89               [ 2]  503 	pushw x ; preserve *symbol 
      008EE4 CD 8E CB         [ 4]  504 	call parse_symbol
      008EE7 1E 01            [ 2]  505 	ldw x,(XFIRST,sp) 
      008EE9 E6 02            [ 1]  506 	ld a,(2,x)
      008EEB 26 0F            [ 1]  507 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                    508 ; one letter variable name 
      008EED E6 01            [ 1]  509 	ld a,(1,x) 
      008EEF A0 41            [ 1]  510 	sub a,#'A 
      008EF1 AE 00 03         [ 2]  511 	ldw x,#3 
      008EF4 42               [ 4]  512 	mul x,a 
      008EF5 1C 00 30         [ 2]  513 	addw x,#vars 
      008EF8 A6 85            [ 1]  514 	ld a,#TK_VAR 
      008EFA 20 24            [ 2]  515 	jra 4$ 
      008EFC                        516 2$: ; check for keyword, otherwise syntax error.
      000E7C                        517 	_ldx_dict kword_dict ; dictionary entry point
      008EFC AE B3 5E         [ 2]    1     ldw x,#kword_dict+2
      008EFF 16 01            [ 2]  518 	ldw y,(XFIRST,sp) ; name to search for
      008F01 90 5C            [ 1]  519 	incw y 
      008F03 CD 99 26         [ 4]  520 	call search_dict
      008F06 4D               [ 1]  521 	tnz a
      008F07 26 17            [ 1]  522 	jrne 4$ 
                                    523 ; not in dictionary
                                    524 ; compile it as TK_LABEL
      008F09 16 01            [ 2]  525 	ldw y,(XFIRST,sp)
      008F0B A6 03            [ 1]  526 	ld a,#TK_LABEL 
      008F0D 90 F7            [ 1]  527 	ld (y),a 
      008F0F 90 5C            [ 1]  528 	incw y
      008F11                        529 24$:	
      008F11 90 F6            [ 1]  530     ld a,(y)
      008F13 27 04            [ 1]  531 	jreq 3$
      008F15 90 5C            [ 1]  532 	incw y 
      008F17 20 F8            [ 2]  533 	jra 24$ 
      008F19 90 5C            [ 1]  534 3$: incw y 
      008F1B A6 03            [ 1]  535 	ld a,#TK_LABEL 
      008F1D 5F               [ 1]  536 	clrw x 	
      008F1E 20 11            [ 2]  537 	jra 5$ 
      008F20                        538 4$:	
      008F20 16 01            [ 2]  539 	ldw y,(XFIRST,sp)
      008F22 A3 00 4E         [ 2]  540 	cpw x,#LET_IDX 
      008F25 27 0A            [ 1]  541 	jreq 5$  ; don't compile LET command 
      008F27 90 F7            [ 1]  542 	ld (y),a 
      008F29 90 5C            [ 1]  543 	incw y 
      008F2B 90 FF            [ 2]  544 	ldw (y),x
      008F2D 72 A9 00 02      [ 2]  545 	addw y,#2  
      000EB1                        546 5$:	_drop VSIZE 
      008F31 5B 02            [ 2]    1     addw sp,#VSIZE 
      008F33 81               [ 4]  547 	ret  	
                                    548 
                                    549 ;------------------------------------
                                    550 ; skip character c in text starting from 'in'
                                    551 ; input:
                                    552 ;	 y 		point to text buffer
                                    553 ;    a 		character to skip
                                    554 ; output:  
                                    555 ;	'in' ajusted to new position
                                    556 ;------------------------------------
                           000001   557 	C = 1 ; local var
      008F34                        558 skip:
      008F34 88               [ 1]  559 	push a
      008F35 91 D6 01         [ 4]  560 1$:	ld a,([in.w],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      008F38 27 0A            [ 1]  561 	jreq 2$
      008F3A 11 01            [ 1]  562 	cp a,(C,sp)
      008F3C 26 06            [ 1]  563 	jrne 2$
      008F3E 72 5C 00 02      [ 1]  564 	inc in
      008F42 20 F1            [ 2]  565 	jra 1$
      000EC4                        566 2$: _drop 1 
      008F44 5B 01            [ 2]    1     addw sp,#1 
      008F46 81               [ 4]  567 	ret
                                    568 	
                                    569 
                                    570 ;------------------------------------
                                    571 ; scan text for next token
                                    572 ; input: 
                                    573 ;	X 		pointer to buffer where 
                                    574 ;	        token id and value are copied 
                                    575 ; use:
                                    576 ;	Y   pointer to text in tib 
                                    577 ; output:
                                    578 ;   A       token attribute 
                                    579 ;   X 		token value
                                    580 ;   Y       updated position in output buffer   
                                    581 ;------------------------------------
                                    582 	; use to check special character 
                                    583 	.macro _case c t  
                                    584 	ld a,#c 
                                    585 	cp a,(TCHAR,sp) 
                                    586 	jrne t
                                    587 	.endm 
                                    588 
                           000001   589 	TCHAR=1
                           000002   590 	ATTRIB=2
                           000002   591 	VSIZE=2
      008F47                        592 get_token:: 
      000EC7                        593 	_vars VSIZE
      008F47 52 02            [ 2]    1     sub sp,#VSIZE 
                                    594 ;	ld a,in 
                                    595 ;	sub a,count
                                    596 ;   jrmi 0$
                                    597 ;	clr a 
                                    598 ;	ret 
      008F49                        599 0$: 
      008F49 90 AE 16 68      [ 2]  600 	ldw y,#tib    	
      008F4D A6 20            [ 1]  601 	ld a,#SPACE
      008F4F CD 8F 34         [ 4]  602 	call skip
      008F52 55 00 02 00 03   [ 1]  603 	mov in.saved,in 
      008F57 91 D6 01         [ 4]  604 	ld a,([in.w],y)
      008F5A 26 05            [ 1]  605 	jrne 1$
      008F5C 90 93            [ 1]  606 	ldw y,x 
      008F5E CC 91 03         [ 2]  607 	jp token_exit ; end of line 
      008F61 72 5C 00 02      [ 1]  608 1$:	inc in 
      008F65 CD 98 B0         [ 4]  609 	call to_upper 
      008F68 6B 01            [ 1]  610 	ld (TCHAR,sp),a 
                                    611 ; check for quoted string
      008F6A                        612 str_tst:  	
      000EEA                        613 	_case '"' nbr_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      008F6A A6 22            [ 1]    1 	ld a,#'"' 
      008F6C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008F6E 26 0A            [ 1]    3 	jrne nbr_tst
      008F70 A6 02            [ 1]  614 	ld a,#TK_QSTR
      008F72 F7               [ 1]  615 	ld (x),a 
      008F73 5C               [ 1]  616 	incw x 
      008F74 CD 8D B8         [ 4]  617 	call parse_quote
      008F77 CC 91 03         [ 2]  618 	jp token_exit
      008F7A                        619 nbr_tst:
                                    620 ; check for hexadecimal number 
      008F7A A6 24            [ 1]  621 	ld a,#'$'
      008F7C 11 01            [ 1]  622 	cp a,(TCHAR,sp) 
      008F7E 27 17            [ 1]  623 	jreq 1$
                                    624 ;check for binary number 
      008F80 A6 26            [ 1]  625 	ld a,#'&
      008F82 11 01            [ 1]  626 	cp a,(TCHAR,sp)
      008F84 26 0A            [ 1]  627 	jrne 0$
      008F86 A6 84            [ 1]  628 	ld a,#TK_INTGR
      008F88 F7               [ 1]  629 	ld (x),a 
      008F89 5C               [ 1]  630 	incw x 
      008F8A CD 8E 60         [ 4]  631 	call parse_binary ; expect binary integer 
      008F8D CC 91 03         [ 2]  632 	jp token_exit 
                                    633 ; check for decimal number 	
      008F90 7B 01            [ 1]  634 0$:	ld a,(TCHAR,sp)
      008F92 CD 8E AE         [ 4]  635 	call is_digit
      008F95 24 0C            [ 1]  636 	jrnc 3$
      008F97 A6 84            [ 1]  637 1$:	ld a,#TK_INTGR 
      008F99 F7               [ 1]  638 	ld (x),a 
      008F9A 5C               [ 1]  639 	incw x 
      008F9B 7B 01            [ 1]  640 	ld a,(TCHAR,sp)
      008F9D CD 8E 0D         [ 4]  641 	call parse_integer 
      008FA0 CC 91 03         [ 2]  642 	jp token_exit 
      008FA3                        643 3$: 
      000F23                        644 	_case '(' bkslsh_tst 
      008FA3 A6 28            [ 1]    1 	ld a,#'(' 
      008FA5 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FA7 26 05            [ 1]    3 	jrne bkslsh_tst
      008FA9 A6 06            [ 1]  645 	ld a,#TK_LPAREN
      008FAB CC 90 FF         [ 2]  646 	jp token_char   	
      008FAE                        647 bkslsh_tst: ; character token 
      000F2E                        648 	_case '\',rparnt_tst
      008FAE A6 5C            [ 1]    1 	ld a,#'\' 
      008FB0 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FB2 26 16            [ 1]    3 	jrne rparnt_tst
      008FB4 A6 04            [ 1]  649 	ld a,#TK_CHAR 
      008FB6 F7               [ 1]  650 	ld (x),a 
      008FB7 5C               [ 1]  651 	incw x 
      008FB8 91 D6 01         [ 4]  652 	ld a,([in.w],y)
      008FBB F7               [ 1]  653 	ld (x),a 
      008FBC 5C               [ 1]  654 	incw x
      008FBD 90 93            [ 1]  655 	ldw y,x 	 
      008FBF 72 5C 00 02      [ 1]  656 	inc in  
      008FC3 5F               [ 1]  657 	clrw x 
      008FC4 97               [ 1]  658 	ld xl,a 
      008FC5 A6 04            [ 1]  659 	ld a,#TK_CHAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      008FC7 CC 91 03         [ 2]  660 	jp token_exit 
      008FCA                        661 rparnt_tst:		
      000F4A                        662 	_case ')' colon_tst 
      008FCA A6 29            [ 1]    1 	ld a,#')' 
      008FCC 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FCE 26 05            [ 1]    3 	jrne colon_tst
      008FD0 A6 07            [ 1]  663 	ld a,#TK_RPAREN 
      008FD2 CC 90 FF         [ 2]  664 	jp token_char
      008FD5                        665 colon_tst:
      000F55                        666 	_case ':' comma_tst 
      008FD5 A6 3A            [ 1]    1 	ld a,#':' 
      008FD7 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FD9 26 05            [ 1]    3 	jrne comma_tst
      008FDB A6 0A            [ 1]  667 	ld a,#TK_COLON 
      008FDD CC 90 FF         [ 2]  668 	jp token_char  
      008FE0                        669 comma_tst:
      000F60                        670 	_case COMMA sharp_tst 
      008FE0 A6 2C            [ 1]    1 	ld a,#COMMA 
      008FE2 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FE4 26 05            [ 1]    3 	jrne sharp_tst
      008FE6 A6 08            [ 1]  671 	ld a,#TK_COMMA
      008FE8 CC 90 FF         [ 2]  672 	jp token_char
      008FEB                        673 sharp_tst:
      000F6B                        674 	_case SHARP dash_tst 
      008FEB A6 23            [ 1]    1 	ld a,#SHARP 
      008FED 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FEF 26 05            [ 1]    3 	jrne dash_tst
      008FF1 A6 09            [ 1]  675 	ld a,#TK_SHARP
      008FF3 CC 90 FF         [ 2]  676 	jp token_char  	 	 
      008FF6                        677 dash_tst: 	
      000F76                        678 	_case '-' at_tst 
      008FF6 A6 2D            [ 1]    1 	ld a,#'-' 
      008FF8 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FFA 26 05            [ 1]    3 	jrne at_tst
      008FFC A6 11            [ 1]  679 	ld a,#TK_MINUS  
      008FFE CC 90 FF         [ 2]  680 	jp token_char 
      009001                        681 at_tst:
      000F81                        682 	_case '@' qmark_tst 
      009001 A6 40            [ 1]    1 	ld a,#'@' 
      009003 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009005 26 05            [ 1]    3 	jrne qmark_tst
      009007 A6 05            [ 1]  683 	ld a,#TK_ARRAY 
      009009 CC 90 FF         [ 2]  684 	jp token_char
      00900C                        685 qmark_tst:
      000F8C                        686 	_case '?' tick_tst 
      00900C A6 3F            [ 1]    1 	ld a,#'?' 
      00900E 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009010 26 12            [ 1]    3 	jrne tick_tst
      009012 A6 80            [ 1]  687 	ld a,#TK_CMD  
      009014 F7               [ 1]  688 	ld (x),a 
      009015 5C               [ 1]  689 	incw x 
      009016 90 93            [ 1]  690 	ldw y,x 
      009018 AE 00 6E         [ 2]  691 	ldw x,#PRT_IDX 
      00901B 90 FF            [ 2]  692 	ldw (y),x 
      00901D 72 A9 00 02      [ 2]  693 	addw y,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009021 CC 91 03         [ 2]  694 	jp token_exit
      009024                        695 tick_tst: ; comment 
      000FA4                        696 	_case TICK plus_tst 
      009024 A6 27            [ 1]    1 	ld a,#TICK 
      009026 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009028 26 35            [ 1]    3 	jrne plus_tst
      00902A A6 80            [ 1]  697 	ld a,#TK_CMD
      00902C F7               [ 1]  698 	ld (x),a 
      00902D 5C               [ 1]  699 	incw x
      00902E 90 AE 00 88      [ 2]  700 	ldw y,#REM_IDX
      009032 FF               [ 2]  701 	ldw (x),y 
      009033 1C 00 02         [ 2]  702 	addw x,#2  
      009036                        703 copy_comment:
      009036 90 AE 16 68      [ 2]  704 	ldw y,#tib 
      00903A 72 B9 00 01      [ 2]  705 	addw y,in.w
      00903E 90 89            [ 2]  706 	pushw y
      009040 CD 94 25         [ 4]  707 	call strcpy
      009043 72 F2 01         [ 2]  708     subw y,(1,sp)
      009046 90 9F            [ 1]  709 	ld a,yl 
      009048 CB 00 02         [ 1]  710 	add a,in
      00904B C7 00 02         [ 1]  711 	ld in,a 
      00904E 1F 01            [ 2]  712 	ldw (1,sp),x
      009050 72 F9 01         [ 2]  713 	addw y,(1,sp)
      009053 90 5C            [ 1]  714 	incw y 
      000FD5                        715 	_drop 2 
      009055 5B 02            [ 2]    1     addw sp,#2 
      009057 AE 00 88         [ 2]  716 	ldw x,#REM_IDX 
      00905A A6 80            [ 1]  717 	ld a,#TK_CMD 
      00905C CC 91 03         [ 2]  718 	jp token_exit 
      00905F                        719 plus_tst:
      000FDF                        720 	_case '+' star_tst 
      00905F A6 2B            [ 1]    1 	ld a,#'+' 
      009061 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009063 26 05            [ 1]    3 	jrne star_tst
      009065 A6 10            [ 1]  721 	ld a,#TK_PLUS  
      009067 CC 90 FF         [ 2]  722 	jp token_char 
      00906A                        723 star_tst:
      000FEA                        724 	_case '*' slash_tst 
      00906A A6 2A            [ 1]    1 	ld a,#'*' 
      00906C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00906E 26 05            [ 1]    3 	jrne slash_tst
      009070 A6 20            [ 1]  725 	ld a,#TK_MULT 
      009072 CC 90 FF         [ 2]  726 	jp token_char 
      009075                        727 slash_tst: 
      000FF5                        728 	_case '/' prcnt_tst 
      009075 A6 2F            [ 1]    1 	ld a,#'/' 
      009077 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009079 26 05            [ 1]    3 	jrne prcnt_tst
      00907B A6 21            [ 1]  729 	ld a,#TK_DIV 
      00907D CC 90 FF         [ 2]  730 	jp token_char 
      009080                        731 prcnt_tst:
      001000                        732 	_case '%' eql_tst 
      009080 A6 25            [ 1]    1 	ld a,#'%' 
      009082 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009084 26 05            [ 1]    3 	jrne eql_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009086 A6 22            [ 1]  733 	ld a,#TK_MOD
      009088 CC 90 FF         [ 2]  734 	jp token_char  
                                    735 ; 1 or 2 character tokens 	
      00908B                        736 eql_tst:
      00100B                        737 	_case '=' gt_tst 		
      00908B A6 3D            [ 1]    1 	ld a,#'=' 
      00908D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00908F 26 05            [ 1]    3 	jrne gt_tst
      009091 A6 32            [ 1]  738 	ld a,#TK_EQUAL
      009093 CC 90 FF         [ 2]  739 	jp token_char 
      009096                        740 gt_tst:
      001016                        741 	_case '>' lt_tst 
      009096 A6 3E            [ 1]    1 	ld a,#'>' 
      009098 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00909A 26 23            [ 1]    3 	jrne lt_tst
      00909C A6 31            [ 1]  742 	ld a,#TK_GT 
      00909E 6B 02            [ 1]  743 	ld (ATTRIB,sp),a 
      0090A0 91 D6 01         [ 4]  744 	ld a,([in.w],y)
      0090A3 72 5C 00 02      [ 1]  745 	inc in 
      0090A7 A1 3D            [ 1]  746 	cp a,#'=
      0090A9 26 04            [ 1]  747 	jrne 1$
      0090AB A6 33            [ 1]  748 	ld a,#TK_GE 
      0090AD 20 50            [ 2]  749 	jra token_char  
      0090AF A1 3C            [ 1]  750 1$: cp a,#'<
      0090B1 26 04            [ 1]  751 	jrne 2$
      0090B3 A6 35            [ 1]  752 	ld a,#TK_NE 
      0090B5 20 48            [ 2]  753 	jra token_char 
      0090B7 72 5A 00 02      [ 1]  754 2$: dec in
      0090BB 7B 02            [ 1]  755 	ld a,(ATTRIB,sp)
      0090BD 20 40            [ 2]  756 	jra token_char 	 
      0090BF                        757 lt_tst:
      00103F                        758 	_case '<' other
      0090BF A6 3C            [ 1]    1 	ld a,#'<' 
      0090C1 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0090C3 26 23            [ 1]    3 	jrne other
      0090C5 A6 34            [ 1]  759 	ld a,#TK_LT 
      0090C7 6B 02            [ 1]  760 	ld (ATTRIB,sp),a 
      0090C9 91 D6 01         [ 4]  761 	ld a,([in.w],y)
      0090CC 72 5C 00 02      [ 1]  762 	inc in 
      0090D0 A1 3D            [ 1]  763 	cp a,#'=
      0090D2 26 04            [ 1]  764 	jrne 1$
      0090D4 A6 36            [ 1]  765 	ld a,#TK_LE 
      0090D6 20 27            [ 2]  766 	jra token_char 
      0090D8 A1 3E            [ 1]  767 1$: cp a,#'>
      0090DA 26 04            [ 1]  768 	jrne 2$
      0090DC A6 35            [ 1]  769 	ld a,#TK_NE 
      0090DE 20 1F            [ 2]  770 	jra token_char 
      0090E0 72 5A 00 02      [ 1]  771 2$: dec in 
      0090E4 7B 02            [ 1]  772 	ld a,(ATTRIB,sp)
      0090E6 20 17            [ 2]  773 	jra token_char 	
      0090E8                        774 other: ; not a special character 	 
      0090E8 7B 01            [ 1]  775 	ld a,(TCHAR,sp)
      0090EA CD 8E 9D         [ 4]  776 	call is_alpha 
      0090ED 25 03            [ 1]  777 	jrc 30$ 
      0090EF CC 96 C5         [ 2]  778 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      0090F2                        779 30$: 
      0090F2 CD 8E E3         [ 4]  780 	call parse_keyword
      0090F5 A3 A0 CA         [ 2]  781 	cpw x,#remark 
      0090F8 26 09            [ 1]  782 	jrne token_exit 
      0090FA 90 93            [ 1]  783 	ldw y,x 
      0090FC CC 90 36         [ 2]  784 	jp copy_comment 
      0090FF                        785 token_char:
      0090FF F7               [ 1]  786 	ld (x),a 
      009100 5C               [ 1]  787 	incw x
      009101 90 93            [ 1]  788 	ldw y,x 
      009103                        789 token_exit:
      001083                        790 	_drop VSIZE 
      009103 5B 02            [ 2]    1     addw sp,#VSIZE 
      009105 81               [ 4]  791 	ret
                                    792 
                                    793 
                                    794 ;-----------------------------------
                                    795 ; create token list fromm text line 
                                    796 ; save this list in pad buffer 
                                    797 ;  compiled line format: 
                                    798 ;    line_no  2 bytes {0...32767}
                                    799 ;    count    1 byte  
                                    800 ;    tokens   variable length 
                                    801 ;   
                                    802 ; input:
                                    803 ;   none
                                    804 ; modified variables:
                                    805 ;   basicptr     token list buffer address 
                                    806 ;   in.w  		 3|count, i.e. index in buffer
                                    807 ;   count        length of line | 0  
                                    808 ;-----------------------------------
                           000001   809 	XSAVE=1
                           000002   810 	VSIZE=2
      009106                        811 compile::
      009106 90 89            [ 2]  812 	pushw y 
      001088                        813 	_vars VSIZE 
      009108 52 02            [ 2]    1     sub sp,#VSIZE 
      00910A 55 00 1B 00 05   [ 1]  814 	mov basicptr,txtbgn
      00910F 72 1A 00 22      [ 1]  815 	bset flags,#FCOMP 
      009113 A6 00            [ 1]  816 	ld a,#0
      009115 AE 00 00         [ 2]  817 	ldw x,#0
      009118 CF 16 B8         [ 2]  818 	ldw pad,x ; destination buffer 
      00911B C7 16 BA         [ 1]  819 	ld pad+2,a ; count 
      00911E AE 16 BB         [ 2]  820 	ldw x,#pad+3
      009121 72 5F 00 02      [ 1]  821 	clr in 
      009125 CD 8F 47         [ 4]  822 	call get_token
      009128 A1 84            [ 1]  823 	cp a,#TK_INTGR
      00912A 26 11            [ 1]  824 	jrne 2$
      00912C A3 00 01         [ 2]  825 	cpw x,#1 
      00912F 2A 05            [ 1]  826 	jrpl 1$
      009131 A6 0A            [ 1]  827 	ld a,#ERR_BAD_VALUE
      009133 CC 96 C7         [ 2]  828 	jp tb_error
      009136 CF 16 B8         [ 2]  829 1$:	ldw pad,x 
      009139 90 AE 16 BB      [ 2]  830 	ldw y,#pad+3 
      00913D 90 A3 17 74      [ 2]  831 2$:	cpw y,#stack_full 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009141 25 05            [ 1]  832 	jrult 3$
      009143 A6 0F            [ 1]  833 	ld a,#ERR_BUF_FULL 
      009145 CC 96 C7         [ 2]  834 	jp tb_error 
      009148                        835 3$:	
      009148 93               [ 1]  836 	ldw x,y 
      009149 CD 8F 47         [ 4]  837 	call get_token 
      00914C A1 00            [ 1]  838 	cp a,#TK_NONE 
      00914E 26 ED            [ 1]  839 	jrne 2$ 
                                    840 ; compilation completed  
      009150 72 A2 16 B8      [ 2]  841 	subw y,#pad
      009154 90 9F            [ 1]  842     ld a,yl
      009156 AE 16 B8         [ 2]  843 	ldw x,#pad 
      009159 CF 00 19         [ 2]  844 	ldw ptr16,x 
      00915C E7 02            [ 1]  845 	ld (2,x),a 
      00915E FE               [ 2]  846 	ldw x,(x)
      00915F 27 09            [ 1]  847 	jreq 10$
      009161 CD 8D 46         [ 4]  848 	call insert_line
      009164 72 5F 00 04      [ 1]  849 	clr  count 
      009168 20 0F            [ 2]  850 	jra  11$ 
      00916A                        851 10$: ; line# is zero 
      00916A CE 00 19         [ 2]  852 	ldw x,ptr16  
      00916D CF 00 05         [ 2]  853 	ldw basicptr,x 
      009170 E6 02            [ 1]  854 	ld a,(2,x)
      009172 C7 00 04         [ 1]  855 	ld count,a 
      009175 35 03 00 02      [ 1]  856 	mov in,#3 
      009179                        857 11$:
      0010F9                        858 	_drop VSIZE 
      009179 5B 02            [ 2]    1     addw sp,#VSIZE 
      00917B 72 1B 00 22      [ 1]  859 	bres flags,#FCOMP 
      00917F 90 85            [ 2]  860 	popw y 
      009181 81               [ 4]  861 	ret 
                                    862 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                                      1 ;;
                                      2 ; Copyright Jacques Deschênes 2019,2020,2021,2022  
                                      3 ; This file is part of stm8_tbi 
                                      4 ;
                                      5 ;     stm8_tbi is free software: you can redistribute it and/or modify
                                      6 ;     it under the terms of the GNU General Public License as published by
                                      7 ;     the Free Software Foundation, either version 3 of the License, or
                                      8 ;     (at your option) any later version.
                                      9 ;
                                     10 ;     stm8_tbi is distributed in the hope that it will be useful,
                                     11 ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                     12 ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                     13 ;     GNU General Public License for more details.
                                     14 ;
                                     15 ;     You should have received a copy of the GNU General Public License
                                     16 ;     along with stm8_tbi.  If not, see <http://www.gnu.org/licenses/>.
                                     17 ;;
                                     18 
                                     19 ;---------------------------------------
                                     20 ;  decompiler
                                     21 ;  decompile bytecode to text source
                                     22 ;  used by command LIST
                                     23 ;---------------------------------------
                                     24 
                                     25     .module DECOMPILER 
                                     26 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                                     27     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000001     5 DEBUG=1 ; set to 1 to include debugging code 
                                      6 
                           000000     7 SEPARATE=0 ; set to 1 for 'make separate' 
                                      8 
                                      9 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                     28 
                           000000    29 .if SEPARATE
                                     30 	.include "inc/nucleo_8s208.inc"
                                     31 	.include "inc/stm8s208.inc"
                                     32 	.include "inc/ascii.inc"
                                     33 	.include "inc/gen_macros.inc" 
                                     34 	.include "tbi_macros.inc" 
                                     35 .endif 
                                     36 
                                     37 
                                     38     .area  CODE 
                                     39 
                                     40 ;-------------------------
                                     41 ; copy command name to buffer  
                                     42 ; input:
                                     43 ;   X 	name address 
                                     44 ;   Y   destination buffer 
                                     45 ; output:
                                     46 ;   Y   point after name  
                                     47 ;--------------------------
      009182                         48 cpy_cmd_name:
      009182 F6               [ 1]   49 	ld a,(x)
      009183 5C               [ 1]   50 	incw x
      009184 A4 0F            [ 1]   51 	and a,#15  
      009186 88               [ 1]   52 	push a 
      009187 0D 01            [ 1]   53     tnz (1,sp) 
      009189 27 0A            [ 1]   54 	jreq 9$
      00918B F6               [ 1]   55 1$:	ld a,(x)
      00918C 90 F7            [ 1]   56 	ld (y),a  
      00918E 5C               [ 1]   57 	incw x
      00918F 90 5C            [ 1]   58 	incw y 
      009191 0A 01            [ 1]   59 	dec (1,sp)	 
      009193 26 F6            [ 1]   60 	jrne 1$
      009195 84               [ 1]   61 9$: pop a 
      009196 81               [ 4]   62 	ret	
                                     63 
                                     64 ;--------------------------
                                     65 ; add a space after letter or 
                                     66 ; digit.
                                     67 ; input:
                                     68 ;   Y     pointer to buffer 
                                     69 ; output:
                                     70 ;   Y    moved to end 
                                     71 ;--------------------------
      009197                         72 add_space:
      009197 90 5A            [ 2]   73 	decw y 
      009199 90 F6            [ 1]   74 	ld a,(y)
      00919B 90 5C            [ 1]   75 	incw y
      00919D A1 29            [ 1]   76 	cp a,#') 
      00919F 27 05            [ 1]   77 	jreq 0$
      0091A1 CD 8E B7         [ 4]   78 	call is_alnum 
      0091A4 24 06            [ 1]   79 	jrnc 1$
      0091A6                         80 0$: 
      0091A6 A6 20            [ 1]   81 	ld a,#SPACE 
      0091A8 90 F7            [ 1]   82 	ld (y),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      0091AA 90 5C            [ 1]   83 	incw y 
      0091AC 81               [ 4]   84 1$: ret 
                                     85 
                                     86 ;--------------------------
                                     87 ;  align text in buffer 
                                     88 ;  to tab_width padding 
                                     89 ;  left with  SPACE 
                                     90 ; input:
                                     91 ;   X      str*
                                     92 ;   A      str_length 
                                     93 ; output:
                                     94 ;   X      ajusted
                                     95 ;--------------------------
      0091AD                         96 right_align::
      0091AD 88               [ 1]   97 	push a 
      0091AE 7B 01            [ 1]   98 0$: ld a,(1,sp)
      0091B0 C1 00 23         [ 1]   99 	cp a,tab_width 
      0091B3 2A 08            [ 1]  100 	jrpl 1$
      0091B5 A6 20            [ 1]  101 	ld a,#SPACE 
      0091B7 5A               [ 2]  102 	decw x
      0091B8 F7               [ 1]  103 	ld (x),a  
      0091B9 0C 01            [ 1]  104 	inc (1,sp)
      0091BB 20 F1            [ 2]  105 	jra 0$ 
      0091BD 84               [ 1]  106 1$: pop a 	
      0091BE 81               [ 4]  107 	ret 
                                    108 
                                    109 ;--------------------------
                                    110 ; print TK_QSTR
                                    111 ; converting control character
                                    112 ; to backslash sequence
                                    113 ; input:
                                    114 ;   X        char *
                                    115 ;   Y        dest. buffer 
                                    116 ; output:
                                    117 ;   X        moved forward 
                                    118 ;   Y        moved forward 
                                    119 ;-----------------------------
      0091BF                        120 cpy_quote:
      0091BF A6 22            [ 1]  121 	ld a,#'"
      0091C1 90 F7            [ 1]  122 	ld (y),a 
      0091C3 90 5C            [ 1]  123 	incw y 
      0091C5 89               [ 2]  124 	pushw x 
      0091C6 CD 97 F2         [ 4]  125 	call skip_string 
      0091C9 85               [ 2]  126 	popw x 
      0091CA F6               [ 1]  127 1$:	ld a,(x)
      0091CB 27 30            [ 1]  128 	jreq 9$
      0091CD 5C               [ 1]  129 	incw x 
      0091CE A1 20            [ 1]  130 	cp a,#SPACE 
      0091D0 25 0E            [ 1]  131 	jrult 3$
      0091D2 90 F7            [ 1]  132 	ld (y),a
      0091D4 90 5C            [ 1]  133 	incw y 
      0091D6 A1 5C            [ 1]  134 	cp a,#'\ 
      0091D8 26 F0            [ 1]  135 	jrne 1$ 
      0091DA                        136 2$:
      0091DA 90 F7            [ 1]  137 	ld (y),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      0091DC 90 5C            [ 1]  138 	incw y  
      0091DE 20 EA            [ 2]  139 	jra 1$
      0091E0 88               [ 1]  140 3$: push a 
      0091E1 A6 5C            [ 1]  141 	ld a,#'\
      0091E3 90 F7            [ 1]  142 	ld (y),a 
      0091E5 90 5C            [ 1]  143 	incw y  
      0091E7 84               [ 1]  144 	pop a 
      0091E8 A0 07            [ 1]  145 	sub a,#7
      0091EA C7 00 0F         [ 1]  146 	ld acc8,a 
      0091ED 72 5F 00 0E      [ 1]  147 	clr acc16
      0091F1 89               [ 2]  148 	pushw x
      0091F2 AE 8E 05         [ 2]  149 	ldw x,#escaped 
      0091F5 72 BB 00 0E      [ 2]  150 	addw x,acc16 
      0091F9 F6               [ 1]  151 	ld a,(x)
      0091FA 85               [ 2]  152 	popw x
      0091FB 20 DD            [ 2]  153 	jra 2$
      0091FD A6 22            [ 1]  154 9$: ld a,#'"
      0091FF 90 F7            [ 1]  155 	ld (y),a 
      009201 90 5C            [ 1]  156 	incw y  
      009203 5C               [ 1]  157 	incw x 
      009204 81               [ 4]  158 	ret
                                    159 
                                    160 ;--------------------------
                                    161 ; return variable name 
                                    162 ; from its address.
                                    163 ; input:
                                    164 ;   X    variable address
                                    165 ; output:
                                    166 ;   A     variable letter
                                    167 ;--------------------------
      009205                        168 var_name::
      009205 1D 00 30         [ 2]  169 		subw x,#vars 
      009208 A6 03            [ 1]  170 		ld a,#3
      00920A 62               [ 2]  171 		div x,a 
      00920B 9F               [ 1]  172 		ld a,xl 
      00920C AB 41            [ 1]  173 		add a,#'A 
      00920E 81               [ 4]  174 		ret 
                                    175 
                                    176 ;-----------------------------
                                    177 ; return cmd  idx from its 
                                    178 ; code address 
                                    179 ; input:
                                    180 ;   X      code address 
                                    181 ; output:
                                    182 ;   X      cmd_idx
                                    183 ;-----------------------------
      00920F                        184 get_cmd_idx:
      00920F 90 89            [ 2]  185 	pushw y
      009211 90 AE B3 64      [ 2]  186 	ldw y,#code_addr 
      009215 90 CF 00 19      [ 2]  187 	ldw ptr16,y 
      009219 90 5F            [ 1]  188 	clrw y 
      00921B 91 D3 19         [ 5]  189 1$:	cpw x,([ptr16],y)
      00921E 27 0C            [ 1]  190 	jreq 3$ 
      009220 90 5C            [ 1]  191 	incw y 
      009222 91 D6 19         [ 4]  192 	ld a,([ptr16],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009225 90 5C            [ 1]  193 	incw y
      009227 91 DA 19         [ 4]  194 	or a,([ptr16],y)	
      00922A 26 EF            [ 1]  195 	jrne 1$
      00922C 93               [ 1]  196 3$: ldw x,y 
      00922D 90 85            [ 2]  197 	popw y 
      00922F 81               [ 4]  198 	ret
                                    199 
                                    200 
                                    201 ;-------------------------------------
                                    202 ; decompile tokens list 
                                    203 ; to original text line 
                                    204 ; input:
                                    205 ;   [basicptr]  pointer at line 
                                    206 ;   Y           output buffer
                                    207 ; output:
                                    208 ;   A           length 
                                    209 ;   Y           after string  
                                    210 ;------------------------------------
                           000001   211 	BASE_SAV=1
                           000002   212 	WIDTH_SAV=2
                           000003   213 	STR=3
                           000004   214 	VSIZE=4 
      009230                        215 decompile::
      0011B0                        216 	_vars VSIZE
      009230 52 04            [ 2]    1     sub sp,#VSIZE 
      009232 C6 00 0B         [ 1]  217 	ld a,base
      009235 6B 01            [ 1]  218 	ld (BASE_SAV,sp),a  
      009237 C6 00 23         [ 1]  219 	ld a,tab_width 
      00923A 6B 02            [ 1]  220 	ld (WIDTH_SAV,sp),a 
      00923C 17 03            [ 2]  221 	ldw (STR,sp),y   
      00923E 72 CE 00 05      [ 5]  222 	ldw x,[basicptr] ; line number 
      009242 35 0A 00 0B      [ 1]  223 	mov base,#10
      009246 35 05 00 23      [ 1]  224 	mov tab_width,#5
      00924A 72 5F 00 0D      [ 1]  225 	clr acc24 
      00924E CF 00 0E         [ 2]  226 	ldw acc16,x
      009251 4F               [ 1]  227 	clr a ; unsigned conversion 
      009252 CD 98 57         [ 4]  228 	call itoa  
      009255 CD 91 AD         [ 4]  229 	call right_align 
      009258 88               [ 1]  230 	push a 
      009259 90 93            [ 1]  231 1$:	ldw y,x ; source
      00925B 1E 04            [ 2]  232 	ldw x,(STR+1,sp) ; destination
      00925D CD 94 25         [ 4]  233 	call strcpy 
      009260 90 5F            [ 1]  234 	clrw y 
      009262 84               [ 1]  235 	pop a 
      009263 90 97            [ 1]  236 	ld yl,a 
      009265 72 F9 03         [ 2]  237 	addw y,(STR,sp)
      009268 A6 20            [ 1]  238 	ld a,#SPACE 
      00926A 90 F7            [ 1]  239 	ld (y),a 
      00926C 90 5C            [ 1]  240 	incw y 
      00926E 72 5F 00 23      [ 1]  241 	clr tab_width
      009272 AE 00 03         [ 2]  242 	ldw x,#3
      009275 CF 00 01         [ 2]  243 	ldw in.w,x 
      009278                        244 decomp_loop:
      009278 90 89            [ 2]  245 	pushw y
      00927A CD 97 CB         [ 4]  246 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      00927D 90 85            [ 2]  247 	popw y 
      00927F 4D               [ 1]  248 	tnz a  
      009280 26 03            [ 1]  249 	jrne 1$
      009282 CC 93 9C         [ 2]  250 	jp 20$
      009285 2B 03            [ 1]  251 1$:	jrmi 2$
      009287 CC 93 10         [ 2]  252 	jp 6$
      00928A                        253 2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR
      00928A A1 85            [ 1]  254 	cp a,#TK_VAR 
      00928C 26 0F            [ 1]  255 	jrne 3$
                                    256 ;; TK_VAR 
      00928E CD 91 97         [ 4]  257 	call add_space
      009291 CD 98 01         [ 4]  258 	call get_addr   
      009294 CD 92 05         [ 4]  259 	call var_name
      009297 90 F7            [ 1]  260 	ld (y),a 
      009299 90 5C            [ 1]  261 	incw y  
      00929B 20 DB            [ 2]  262 	jra decomp_loop
      00929D                        263 3$:
      00929D A1 84            [ 1]  264 	cp a,#TK_INTGR
      00929F 26 26            [ 1]  265 	jrne 4$
                                    266 ;; TK_INTGR
      0092A1 CD 98 0B         [ 4]  267 	call get_int24 
      0092A4 C7 00 0D         [ 1]  268 	ld acc24,a 
      0092A7 CF 00 0E         [ 2]  269 	ldw acc16,x 
      0092AA CD 91 97         [ 4]  270 	call add_space
      0092AD 90 89            [ 2]  271 	pushw y 
      0092AF A6 FF            [ 1]  272 	ld a,#255 ; signed conversion 
      0092B1 CD 98 57         [ 4]  273 	call itoa  
      0092B4 16 01            [ 2]  274 	ldw y,(1,sp) 
      0092B6 88               [ 1]  275 	push a 
      0092B7 51               [ 1]  276 	exgw x,y 
      0092B8 CD 94 25         [ 4]  277 	call strcpy 
      0092BB 90 5F            [ 1]  278 	clrw y
      0092BD 84               [ 1]  279 	pop a  
      0092BE 90 97            [ 1]  280 	ld yl,a 
      0092C0 72 F9 01         [ 2]  281 	addw y,(1,sp)
      001243                        282 	_drop 2 
      0092C3 5B 02            [ 2]    1     addw sp,#2 
      0092C5 20 B1            [ 2]  283 	jra decomp_loop
      0092C7                        284 4$: ; dictionary keyword 
      0092C7 FE               [ 2]  285 	ldw x,(x)
      0092C8 72 5C 00 02      [ 1]  286 	inc in 
      0092CC 72 5C 00 02      [ 1]  287 	inc in 
      0092D0 A3 00 88         [ 2]  288 	cpw x,#REM_IDX
      0092D3 26 23            [ 1]  289 	jrne 5$
      0092D5 CE 00 05         [ 2]  290 	ldw x,basicptr 
                                    291 ; copy comment to buffer 
      0092D8 CD 91 97         [ 4]  292 	call add_space
      0092DB A6 27            [ 1]  293 	ld a,#''
      0092DD 90 F7            [ 1]  294 	ld (y),a 
      0092DF 90 5C            [ 1]  295 	incw y 
      0092E1                        296 46$:
      0092E1 72 D6 00 01      [ 4]  297 	ld a,([in.w],x)
      0092E5 72 5C 00 02      [ 1]  298 	inc in  
      0092E9 90 F7            [ 1]  299 	ld (y),a 
      0092EB 90 5C            [ 1]  300 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      0092ED C6 00 02         [ 1]  301 	ld a,in 
      0092F0 C1 00 04         [ 1]  302 	cp a,count 
      0092F3 2B EC            [ 1]  303 	jrmi 46$
      0092F5 CC 93 9C         [ 2]  304 	jp 20$  
      0092F8 A3 00 4E         [ 2]  305 5$: cpw x,#LET_IDX 
      0092FB 26 03            [ 1]  306 	jrne 51$
      0092FD CC 92 78         [ 2]  307 	jp decomp_loop ; down display LET 	
      009300                        308 51$: ; insert command name 
      009300 CD 91 97         [ 4]  309 	call add_space  
      009303 90 89            [ 2]  310 	pushw y
      009305 CD 93 D7         [ 4]  311 	call cmd_name
      009308 90 85            [ 2]  312 	popw y 
      00930A CD 91 82         [ 4]  313 	call cpy_cmd_name
      00930D CC 92 78         [ 2]  314 	jp decomp_loop 
      009310                        315 6$:
                                    316 ; label?
      009310 A1 03            [ 1]  317 	cp a,#TK_LABEL 
      009312 26 1E            [ 1]  318 	jrne 64$
                                    319 ; copy label string to output buffer   	
      009314 A6 20            [ 1]  320 	ld a,#32 
      009316 90 F7            [ 1]  321 	ld (y),a 
      009318 90 5C            [ 1]  322 	incw y 
      00931A                        323 61$:
      00931A 89               [ 2]  324 	pushw x 
      00931B CD 97 F2         [ 4]  325 	call skip_string 
      00931E 85               [ 2]  326 	popw x 
      00931F                        327 62$:	
      00931F F6               [ 1]  328 	ld a,(x)
      009320 27 07            [ 1]  329 	jreq 63$ 
      009322 5C               [ 1]  330 	incw x  
      009323 90 F7            [ 1]  331 	ld (y),a 
      009325 90 5C            [ 1]  332 	incw y 
      009327 20 F6            [ 2]  333 	jra 62$ 
      009329                        334 63$: 
      009329 A6 20            [ 1]  335 	ld a,#32 
      00932B 90 F7            [ 1]  336 	ld (y),a 
      00932D 90 5C            [ 1]  337 	incw y 
      00932F CC 92 78         [ 2]  338 	jp decomp_loop
      009332                        339 64$:
      009332 A1 02            [ 1]  340 	cp a,#TK_QSTR 
      009334 26 09            [ 1]  341 	jrne 7$
                                    342 ;; TK_QSTR
      009336 CD 91 97         [ 4]  343 	call add_space
      009339 CD 91 BF         [ 4]  344 	call cpy_quote  
      00933C CC 92 78         [ 2]  345 	jp decomp_loop
      00933F                        346 7$:
      00933F A1 04            [ 1]  347 	cp a,#TK_CHAR 
      009341 26 0D            [ 1]  348 	jrne 8$
                                    349 ;; TK_CHAR 
      009343 A6 5C            [ 1]  350 	ld a,#'\ 
      009345 90 F7            [ 1]  351 	ld (y),a 
      009347 90 5C            [ 1]  352 	incw y
      009349 F6               [ 1]  353 	ld a,(x)
      00934A 72 5C 00 02      [ 1]  354 	inc in  
      00934E 20 06            [ 2]  355 	jra 81$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      009350 A1 0A            [ 1]  356 8$: cp a,#TK_COLON 
      009352 26 09            [ 1]  357 	jrne 9$
      009354 A6 3A            [ 1]  358 	ld a,#':
      009356                        359 81$:
      009356 90 F7            [ 1]  360 	ld (y),a 
      009358 90 5C            [ 1]  361 	incw y 
      00935A                        362 82$:
      00935A CC 92 78         [ 2]  363 	jp decomp_loop
      00935D                        364 9$: 
      00935D A1 09            [ 1]  365 	cp a,#TK_SHARP
      00935F 22 0A            [ 1]  366 	jrugt 10$ 
      009361 A0 05            [ 1]  367 	sub a,#TK_ARRAY 
      009363 5F               [ 1]  368 	clrw x 
      009364 97               [ 1]  369 	ld xl,a
      009365 1C 93 B2         [ 2]  370 	addw x,#single_char 
      009368 F6               [ 1]  371 	ld a,(x)
      009369 20 EB            [ 2]  372 	jra 81$ 
      00936B                        373 10$: 
      00936B A1 11            [ 1]  374 	cp a,#TK_MINUS 
      00936D 22 0A            [ 1]  375 	jrugt 11$
      00936F A0 10            [ 1]  376 	sub a,#TK_PLUS 
      009371 5F               [ 1]  377 	clrw x 
      009372 97               [ 1]  378 	ld xl,a 
      009373 1C 93 B7         [ 2]  379 	addw x,#add_char 
      009376 F6               [ 1]  380 	ld a,(x)
      009377 20 DD            [ 2]  381 	jra 81$
      009379                        382 11$:
      009379 A1 22            [ 1]  383     cp a,#TK_MOD 
      00937B 22 0A            [ 1]  384 	jrugt 12$
      00937D A0 20            [ 1]  385 	sub a,#TK_MULT
      00937F 5F               [ 1]  386 	clrw x 
      009380 97               [ 1]  387 	ld xl,a 
      009381 1C 93 B9         [ 2]  388 	addw x,#mul_char
      009384 F6               [ 1]  389 	ld a,(x)
      009385 20 CF            [ 2]  390 	jra 81$
      009387                        391 12$:
      009387 A0 31            [ 1]  392 	sub a,#TK_GT  
      009389 48               [ 1]  393 	sll a 
      00938A 5F               [ 1]  394 	clrw x 
      00938B 97               [ 1]  395 	ld xl,a 
      00938C 1C 93 BC         [ 2]  396 	addw x,#relop_str 
      00938F FE               [ 2]  397 	ldw x,(x)
      009390 F6               [ 1]  398 	ld a,(x)
      009391 5C               [ 1]  399 	incw x 
      009392 90 F7            [ 1]  400 	ld (y),a
      009394 90 5C            [ 1]  401 	incw y 
      009396 F6               [ 1]  402 	ld a,(x)
      009397 26 BD            [ 1]  403 	jrne 81$
      009399 CC 92 78         [ 2]  404 	jp decomp_loop 
      00939C                        405 20$: 
      00939C 90 7F            [ 1]  406 	clr (y)
      00939E 1E 03            [ 2]  407 	ldw x,(STR,sp)
      0093A0 7B 01            [ 1]  408 	ld a,(BASE_SAV,sp)
      0093A2 C7 00 0B         [ 1]  409 	ld base,a 
      0093A5 7B 02            [ 1]  410 	ld a,(WIDTH_SAV,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      0093A7 C7 00 23         [ 1]  411 	ld tab_width,a
      0093AA 72 F2 03         [ 2]  412 	subw y,(STR,sp) 
      0093AD 90 9F            [ 1]  413 	ld a,yl 
      00132F                        414 	_drop VSIZE 
      0093AF 5B 04            [ 2]    1     addw sp,#VSIZE 
      0093B1 81               [ 4]  415 	ret 
                                    416 
      0093B2 40 28 29 2C 23         417 single_char: .byte '@','(',')',',','#'
      0093B7 2B 2D                  418 add_char: .byte '+','-'
      0093B9 2A 2F 25               419 mul_char: .byte '*','/','%'
      0093BC 93 C8 93 CA 93 CC 93   420 relop_str: .word gt,equal,ge,lt,le,ne 
             CF 93 D1 93 D4
      0093C8 3E 00                  421 gt: .asciz ">"
      0093CA 3D 00                  422 equal: .asciz "="
      0093CC 3E 3D 00               423 ge: .asciz ">="
      0093CF 3C 00                  424 lt: .asciz "<"
      0093D1 3C 3D 00               425 le: .asciz "<="
      0093D4 3C 3E 00               426 ne:  .asciz "<>"
                                    427 
                                    428 ;----------------------------------
                                    429 ; search in kword_dict name
                                    430 ; from its execution address 
                                    431 ; input:
                                    432 ;   X       	cmd_index 
                                    433 ; output:
                                    434 ;   X 			cstr*  | 0 
                                    435 ;--------------------------------
                           000001   436 	CMDX=1 
                           000003   437 	LINK=3 
                           000004   438 	VSIZE=4
      0093D7                        439 cmd_name:
      001357                        440 	_vars VSIZE 
      0093D7 52 04            [ 2]    1     sub sp,#VSIZE 
      0093D9 72 5F 00 0E      [ 1]  441 	clr acc16 
      0093DD 1F 01            [ 2]  442 	ldw (CMDX,sp),x  
      0093DF AE B3 5C         [ 2]  443 	ldw x,#kword_dict	
      0093E2 1F 03            [ 2]  444 1$:	ldw (LINK,sp),x
      0093E4 E6 02            [ 1]  445 	ld a,(2,x)
      0093E6 A4 0F            [ 1]  446 	and a,#15 
      0093E8 C7 00 0F         [ 1]  447 	ld acc8,a 
      0093EB 1C 00 03         [ 2]  448 	addw x,#3
      0093EE 72 BB 00 0E      [ 2]  449 	addw x,acc16
      0093F2 FE               [ 2]  450 	ldw x,(x) ; command index  
      0093F3 13 01            [ 2]  451 	cpw x,(CMDX,sp)
      0093F5 27 0A            [ 1]  452 	jreq 2$
      0093F7 1E 03            [ 2]  453 	ldw x,(LINK,sp)
      0093F9 FE               [ 2]  454 	ldw x,(x) 
      0093FA 1D 00 02         [ 2]  455 	subw x,#2  
      0093FD 26 E3            [ 1]  456 	jrne 1$
      0093FF 20 05            [ 2]  457 	jra 9$
      009401 1E 03            [ 2]  458 2$: ldw x,(LINK,sp)
      009403 1C 00 02         [ 2]  459 	addw x,#2 	
      001386                        460 9$:	_drop VSIZE
      009406 5B 04            [ 2]    1     addw sp,#VSIZE 
      009408 81               [ 4]  461 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



                                    462 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



                                      1 ;;
                                      2 ; Copyright Jacques Deschênes 2019,2020,2021,2022  
                                      3 ; This file is part of stm8_tbi 
                                      4 ;
                                      5 ;     stm8_tbi is free software: you can redistribute it and/or modify
                                      6 ;     it under the terms of the GNU General Public License as published by
                                      7 ;     the Free Software Foundation, either version 3 of the License, or
                                      8 ;     (at your option) any later version.
                                      9 ;
                                     10 ;     stm8_tbi is distributed in the hope that it will be useful,
                                     11 ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                     12 ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                     13 ;     GNU General Public License for more details.
                                     14 ;
                                     15 ;     You should have received a copy of the GNU General Public License
                                     16 ;     along with stm8_tbi.  If not, see <http://www.gnu.org/licenses/>.
                                     17 ;;
                                     18 
                                     19 ;--------------------------------------
                                     20 ;   Implementation of Tiny BASIC
                                     21 ;   REF: https://en.wikipedia.org/wiki/Li-Chen_Wang#Palo_Alto_Tiny_BASIC
                                     22 ;   Palo Alto BASIC is 4th version of TinyBasic
                                     23 ;   DATE: 2019-12-17
                                     24 ;
                                     25 ;--------------------------------------------------
                                     26 ;     implementation information
                                     27 ;
                                     28 ; *  integer are 24 bits in registers they are 
                                     29 ;    kept as A:X   (A being most signifant byte)
                                     30 ; *  an expression stack is used *xstack* 
                                     31 ;    register Y is used as xstack pointer 
                                     32 ; 
                                     33 ;    IMPORTANT: when a routine use Y it must preserve 
                                     34 ;               its content and restore it at exit.
                                     35 ;               This hold only wheb BASIC is running  
                                     36 ;
                                     37 ; *  BASIC function return their value registers 
                                     38 ;    A for character 
                                     39 ;	 X for address 
                                     40 ;	 A:X for integer 
                                     41 ; 
                                     42 ;  * variables return their value in A:X 
                                     43 ;
                                     44 ;  * relation, expression return value on xstack 
                                     45 ;    and A=TK_INTGR or else if no expression.
                                     46 ;--------------------------------------------------- 
                                     47 
                                     48     .module STM8_TBI
                                     49 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



                                     50     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000001     5 DEBUG=1 ; set to 1 to include debugging code 
                                      6 
                           000000     7 SEPARATE=0 ; set to 1 for 'make separate' 
                                      8 
                                      9 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



                                     51 
                           000000    52 .if SEPARATE
                                     53 	.include "inc/nucleo_8s208.inc"
                                     54 	.include "inc/stm8s208.inc"
                                     55 	.include "inc/ascii.inc"
                                     56 	.include "inc/gen_macros.inc" 
                                     57 	.include "tbi_macros.inc" 
                                     58 .endif 
                                     59 
                                     60 ;--------------------------------------
                                     61     .area DATA 
                                     62 ;--------------------------------------	
                                     63 
      000001                         64 in.w::  .blkb 1 ; parser position in text line high-byte 
      000002                         65 in::    .blkb 1 ; low byte of in.w 
      000003                         66 in.saved:: .blkb 1 ; set by get_token before parsing next token, used by unget_token
      000004                         67 count:: .blkb 1 ; current BASIC line length and tib text length  
      000005                         68 basicptr::  .blkb 2  ; point to current BASIC line address.
      000007                         69 data_ptr:  .blkw 1  ; point to DATA address
      000009                         70 data_ofs:  .blkb 1  ; index to next data item 
      00000A                         71 data_len:  .blkb 1  ; length of data line 
      00000B                         72 base::  .blkb 1 ; nemeric base used to print integer 
      00000C                         73 acc32:: .blkb 1 ; 32 bit accumalator upper-byte 
      00000D                         74 acc24:: .blkb 1 ; 24 bits accumulator upper-byte 
      00000E                         75 acc16:: .blkb 1 ; 16 bits accumulator, acc24 high-byte
      00000F                         76 acc8::  .blkb 1 ;  8 bits accumulator, acc24 low-byte  
      000010                         77 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
      000012                         78 timer:: .blkw 1 ;  milliseconds count down timer 
      000014                         79 seedx: .blkw 1  ; xorshift 16 seed x  used by RND() function 
      000016                         80 seedy: .blkw 1  ; xorshift 16 seed y  used by RND() funcion
      000018                         81 farptr: .blkb 1 ; 24 bits pointer used by file system, upper-byte
      000019                         82 ptr16::  .blkb 1 ; 16 bits pointer , farptr high-byte 
      00001A                         83 ptr8:   .blkb 1 ; 8 bits pointer, farptr low-byte  
      00001B                         84 txtbgn:: .blkw 1 ; tokenized BASIC text beginning address 
      00001D                         85 txtend:: .blkw 1 ; tokenized BASIC text end address 
      00001F                         86 loop_depth: .blkb 1 ; level of nested loop. Conformity check   
      000020                         87 array_size: .blkw 1 ; array size, free RAM left after BASIC code.  
      000022                         88 flags:: .blkb 1 ; various boolean flags
      000023                         89 tab_width:: .blkb 1 ; print colon width (default 6)
      000024                         90 free_eeprom: .blkw 1 ; start address of free eeprom 
      000026                         91 rx1_queue: .ds RX_QUEUE_SIZE ; UART1 receive circular queue 
      00002E                         92 rx1_head:  .blkb 1 ; rx1_queue head pointer
      00002F                         93 rx1_tail:   .blkb 1 ; rx1_queue tail pointer  
                                     94 ; 24 bits integer variables 
      000030                         95 vars:: .blkb 3*26 ; BASIC variables A-Z,
                                     96 
                                     97 	.area BTXT (ABS)
      00007C                         98 	.org 0x7C  
                                     99 ; keep 'free_ram' as last variable 
                                    100 ; basic code compiled here. 
      00007C                        101 rsign: .blkw 1 ; "BC" 
      00007E                        102 rsize: .blkw 1 ; code size 	 
      000080                        103 free_ram: ; from here RAM free for BASIC text 
                                    104 
                                    105 	.area CODE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



                                    106 
                                    107 
                                    108 ;-------------------------------------
                                    109 ; retrun string length
                                    110 ; input:
                                    111 ;   X         .asciz  pointer 
                                    112 ; output:
                                    113 ;   X         not affected 
                                    114 ;   A         length 
                                    115 ;-------------------------------------
      009409                        116 strlen::
      009409 89               [ 2]  117 	pushw x 
      00940A 4F               [ 1]  118 	clr a
      00940B 7D               [ 1]  119 1$:	tnz (x) 
      00940C 27 04            [ 1]  120 	jreq 9$ 
      00940E 4C               [ 1]  121 	inc a 
      00940F 5C               [ 1]  122 	incw x 
      009410 20 F9            [ 2]  123 	jra 1$ 
      009412 85               [ 2]  124 9$:	popw x 
      009413 81               [ 4]  125 	ret 
                                    126 
                                    127 ;------------------------------------
                                    128 ; compare 2 strings
                                    129 ; input:
                                    130 ;   X 		char* first string 
                                    131 ;   Y       char* second string 
                                    132 ; output:
                                    133 ;   A 		0 not == |1 ==  
                                    134 ;-------------------------------------
      009414                        135 strcmp:
      009414 F6               [ 1]  136 	ld a,(x)
      009415 27 0B            [ 1]  137 	jreq 5$ 
      009417 90 F1            [ 1]  138 	cp a,(y) 
      009419 26 05            [ 1]  139 	jrne 4$ 
      00941B 5C               [ 1]  140 	incw x 
      00941C 90 5C            [ 1]  141 	incw y 
      00941E 20 F4            [ 2]  142 	jra strcmp 
      009420                        143 4$: ; not same  
      009420 4F               [ 1]  144 	clr a 
      009421 81               [ 4]  145 	ret 
      009422                        146 5$: ; same 
      009422 A6 01            [ 1]  147 	ld a,#1 
      009424 81               [ 4]  148 	ret 
                                    149 
                                    150 
                                    151 ;---------------------------------------
                                    152 ;  copy src to dest 
                                    153 ; input:
                                    154 ;   X 		dest 
                                    155 ;   Y 		src 
                                    156 ; output: 
                                    157 ;   X 		dest 
                                    158 ;----------------------------------
      009425                        159 strcpy::
      009425 88               [ 1]  160 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      009426 89               [ 2]  161 	pushw x 
      009427 90 F6            [ 1]  162 1$: ld a,(y)
      009429 27 06            [ 1]  163 	jreq 9$ 
      00942B F7               [ 1]  164 	ld (x),a 
      00942C 5C               [ 1]  165 	incw x 
      00942D 90 5C            [ 1]  166 	incw y 
      00942F 20 F6            [ 2]  167 	jra 1$ 
      009431 7F               [ 1]  168 9$:	clr (x)
      009432 85               [ 2]  169 	popw x 
      009433 84               [ 1]  170 	pop a 
      009434 81               [ 4]  171 	ret 
                                    172 
                                    173 ;---------------------------------------
                                    174 ; move memory block 
                                    175 ; input:
                                    176 ;   X 		destination 
                                    177 ;   Y 	    source 
                                    178 ;   acc16	bytes count 
                                    179 ; output:
                                    180 ;   none 
                                    181 ;--------------------------------------
                           000001   182 	INCR=1 ; increament high byte 
                           000002   183 	LB=2 ; increament low byte 
                           000002   184 	VSIZE=2
      009435                        185 move::
      009435 88               [ 1]  186 	push a 
      0013B6                        187 	_vars VSIZE 
      009436 52 02            [ 2]    1     sub sp,#VSIZE 
      009438 0F 01            [ 1]  188 	clr (INCR,sp)
      00943A 0F 02            [ 1]  189 	clr (LB,sp)
      00943C 90 89            [ 2]  190 	pushw y 
      00943E 13 01            [ 2]  191 	cpw x,(1,sp) ; compare DEST to SRC 
      009440 90 85            [ 2]  192 	popw y 
      009442 27 31            [ 1]  193 	jreq move_exit ; x==y 
      009444 2B 0E            [ 1]  194 	jrmi move_down
      009446                        195 move_up: ; start from top address with incr=-1
      009446 72 BB 00 0E      [ 2]  196 	addw x,acc16
      00944A 72 B9 00 0E      [ 2]  197 	addw y,acc16
      00944E 03 01            [ 1]  198 	cpl (INCR,sp)
      009450 03 02            [ 1]  199 	cpl (LB,sp)   ; increment = -1 
      009452 20 05            [ 2]  200 	jra move_loop  
      009454                        201 move_down: ; start from bottom address with incr=1 
      009454 5A               [ 2]  202     decw x 
      009455 90 5A            [ 2]  203 	decw y
      009457 0C 02            [ 1]  204 	inc (LB,sp) ; incr=1 
      009459                        205 move_loop:	
      009459 C6 00 0E         [ 1]  206     ld a, acc16 
      00945C CA 00 0F         [ 1]  207 	or a, acc8
      00945F 27 14            [ 1]  208 	jreq move_exit 
      009461 72 FB 01         [ 2]  209 	addw x,(INCR,sp)
      009464 72 F9 01         [ 2]  210 	addw y,(INCR,sp) 
      009467 90 F6            [ 1]  211 	ld a,(y)
      009469 F7               [ 1]  212 	ld (x),a 
      00946A 89               [ 2]  213 	pushw x 
      00946B CE 00 0E         [ 2]  214 	ldw x,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00946E 5A               [ 2]  215 	decw x 
      00946F CF 00 0E         [ 2]  216 	ldw acc16,x 
      009472 85               [ 2]  217 	popw x 
      009473 20 E4            [ 2]  218 	jra move_loop
      009475                        219 move_exit:
      0013F5                        220 	_drop VSIZE
      009475 5B 02            [ 2]    1     addw sp,#VSIZE 
      009477 84               [ 1]  221 	pop a 
      009478 81               [ 4]  222 	ret 	
                                    223 
                                    224 ;------------------------------------
                                    225 ;  set all variables to zero 
                                    226 ; input:
                                    227 ;   none 
                                    228 ; output:
                                    229 ;	none
                                    230 ;------------------------------------
      009479                        231 clear_vars:
      009479 89               [ 2]  232 	pushw x 
      00947A 88               [ 1]  233 	push a  
      00947B AE 00 30         [ 2]  234 	ldw x,#vars 
      00947E A6 4E            [ 1]  235 	ld a,#CELL_SIZE*26 
      009480 7F               [ 1]  236 1$:	clr (x)
      009481 5C               [ 1]  237 	incw x 
      009482 4A               [ 1]  238 	dec a 
      009483 26 FB            [ 1]  239 	jrne 1$
      009485 84               [ 1]  240 	pop a 
      009486 85               [ 2]  241 	popw x 
      009487 81               [ 4]  242 	ret 
                                    243 
                                    244 
                                    245 ;-----------------------
                                    246 ;  display system 
                                    247 ;  information 
                                    248 ;-----------------------
                           000002   249 	MAJOR=2
                           000000   250 	MINOR=0 
      009488 0A 0A 54 69 6E 79 20   251 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 32 0A 76 65
             72 73 69 6F 6E 20 00
                                    252 
      0094CE                        253 system_information:
      0094CE AE 94 88         [ 2]  254 	ldw x,#software 
      0094D1 CD 89 DA         [ 4]  255 	call puts 
      0094D4 A6 02            [ 1]  256 	ld a,#MAJOR 
      0094D6 C7 00 0F         [ 1]  257 	ld acc8,a 
      0094D9 5F               [ 1]  258 	clrw x 
      0094DA CF 00 0D         [ 2]  259 	ldw acc24,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      0094DD 72 5F 00 23      [ 1]  260 	clr tab_width  
      0094E1 35 0A 00 0B      [ 1]  261 	mov base, #10 
      0094E5 CD 98 31         [ 4]  262 	call prt_acc24 
      0094E8 A6 2E            [ 1]  263 	ld a,#'.
      0094EA CD 89 7D         [ 4]  264 	call putc 
      0094ED A6 00            [ 1]  265 	ld a,#MINOR 
      0094EF C7 00 0F         [ 1]  266 	ld acc8,a 
      0094F2 5F               [ 1]  267 	clrw x 
      0094F3 CF 00 0D         [ 2]  268 	ldw acc24,x 
      0094F6 CD 98 31         [ 4]  269 	call prt_acc24
      0094F9 A6 0D            [ 1]  270 	ld a,#CR 
      0094FB CD 89 7D         [ 4]  271 	call putc
                                    272 ;call test 
      0094FE 81               [ 4]  273 	ret
                                    274 
      0094FF                        275 warm_init:
      0094FF 90 AE 17 73      [ 2]  276 	ldw y,#XSTACK_EMPTY  
      009503 72 5F 00 22      [ 1]  277 	clr flags 
      009507 72 5F 00 1F      [ 1]  278 	clr loop_depth 
      00950B 35 04 00 23      [ 1]  279 	mov tab_width,#TAB_WIDTH 
      00950F 35 0A 00 0B      [ 1]  280 	mov base,#10 
      009513 AE 00 00         [ 2]  281 	ldw x,#0 
      009516 CF 00 05         [ 2]  282 	ldw basicptr,x 
      009519 CF 00 01         [ 2]  283 	ldw in.w,x 
      00951C 72 5F 00 04      [ 1]  284 	clr count
      009520 81               [ 4]  285 	ret 
                                    286 
                                    287 ;---------------------------
                                    288 ; reset BASIC text variables 
                                    289 ; and clear variables 
                                    290 ;---------------------------
      009521                        291 clear_basic:
      009521 89               [ 2]  292 	pushw x 
      009522 72 5F 00 04      [ 1]  293 	clr count
      009526 72 5F 00 02      [ 1]  294 	clr in  
      00952A AE 00 80         [ 2]  295 	ldw x,#free_ram 
      00952D CF 00 1B         [ 2]  296 	ldw txtbgn,x 
      009530 CF 00 1D         [ 2]  297 	ldw txtend,x 
      009533 CD 94 79         [ 4]  298 	call clear_vars 
      009536 85               [ 2]  299 	popw x
      009537 81               [ 4]  300 	ret 
                                    301 
                                    302 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    303 ;;   Tiny BASIC error messages     ;;
                                    304 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009538                        305 err_msg:
      009538 00 00 95 5A 95 67 95   306 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             75 95 8E 95 9D
      009544 95 B3 95 C9 95 E3 95   307 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             F4 96 05
      00954E 96 11 96 44 96 54 96   308 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             68 96 7B
      009558 96 88                  309 	.word err_overflow 
                                    310 
      00955A 4D 65 6D 6F 72 79 20   311 err_mem_full: .asciz "Memory full\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal  66-Bits]



             66 75 6C 6C 0A 00
      009562 75 6C 6C 0A 00 73 79   312 err_syntax: .asciz "syntax error\n" 
             6E 74 61 78 20 65 72
      009570 72 6F 72 0A 00 6D 61   313 err_math_ovf: .asciz "math operation overflow\n"
             74 68 20 6F 70 65 72
             61 74 69 6F 6E 20 6F
             76 65 72 66
      009589 6C 6F 77 0A 00 64 69   314 err_div0: .asciz "division by 0\n" 
             76 69 73 69 6F 6E 20
             62
      009598 79 20 30 0A 00 69 6E   315 err_no_line: .asciz "invalid line number.\n"
             76 61 6C 69 64 20 6C
             69 6E 65 20 6E 75 6D
             62
      0095AE 65 72 2E 0A 00 72 75   316 err_run_only: .asciz "run time only usage.\n" 
             6E 20 74 69 6D 65 20
             6F 6E 6C 79 20 75 73
             61
      0095C4 67 65 2E 0A 00 63 6F   317 err_cmd_only: .asciz "command line only usage.\n"
             6D 6D 61 6E 64 20 6C
             69 6E 65 20 6F 6E 6C
             79 20 75 73 61
      0095DE 67 65 2E 0A 00 64 75   318 err_duplicate: .asciz "duplicate name.\n"
             70 6C 69 63 61 74 65
             20 6E 61
      0095EF 6D 65 2E 0A 00 46 69   319 err_not_file: .asciz "File not found.\n"
             6C 65 20 6E 6F 74 20
             66 6F 75
      009600 6E 64 2E 0A 00 62 61   320 err_bad_value: .asciz "bad value.\n"
             64 20 76 61 6C
      00960C 75 65 2E 0A 00 46 69   321 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             6C 65 20 69 6E 20 65
             78 74 65 6E 64 65 64
             20 6D 65 6D 6F 72 79
             2C 20 63 61 6E 27 74
             20 62 65 20 72 75 6E
             20 66 72 6F 6D 20 74
             68 65
      00963F 72 65 2E 0A 00 4E 6F   322 err_no_data: .asciz "No data found.\n"
             20 64 61 74 61 20 66
             6F 75
      00964F 6E 64 2E 0A 00 4E 6F   323 err_no_prog: .asciz "No program in RAM!\n"
             20 70 72 6F 67 72 61
             6D 20 69 6E 20 52
      009663 41 4D 21 0A 00 46 69   324 err_no_fspace: .asciz "File system full.\n" 
             6C 65 20 73 79 73 74
             65 6D 20 66 75
      009676 6C 6C 2E 0A 00 42 75   325 err_buf_full: .asciz "Buffer full\n"
             66 66 65 72 20 66
      009683 75 6C 6C 0A 00 6F 76   326 err_overflow: .asciz "overflow\n" 
             65 72 66
                                    327 
      00968D 6C 6F 77 0A 00 0A 72   328 rt_msg: .asciz "\nrun time error, "
             75 6E 20 74 69 6D 65
             20 65 72 72
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00969F 6F 72 2C 20 00 0A 63   329 comp_msg: .asciz "\ncompile error, "
             6F 6D 70 69 6C 65 20
             65 72 72
      0096B0 6F 72 2C 20 00 6C 61   330 tk_id: .asciz "last token id: "
             73 74 20 74 6F 6B 65
             6E 20
                                    331 
      001645                        332 syntax_error::
      0096C0 69 64            [ 1]  333 	ld a,#ERR_SYNTAX 
                                    334 
      001647                        335 tb_error::
      0096C2 3A 20 00 21 51   [ 2]  336 	btjt flags,#FCOMP,1$
      0096C5 88               [ 1]  337 	push a 
      0096C5 A6 02 12         [ 2]  338 	ldw x, #rt_msg 
      0096C7 CD 09 5A         [ 4]  339 	call puts 
      0096C7 72               [ 1]  340 	pop a 
      0096C8 0A 00 22         [ 2]  341 	ldw x, #err_msg 
      0096CB 51 88 AE 96      [ 1]  342 	clr acc16 
      0096CF 92               [ 1]  343 	sll a
      0096D0 CD 89 DA 84      [ 1]  344 	rlc acc16  
      0096D4 AE 95 38         [ 1]  345 	ld acc8, a 
      0096D7 72 5F 00 0E      [ 2]  346 	addw x,acc16 
      0096DB 48               [ 2]  347 	ldw x,(x)
      0096DC 72 59 00         [ 4]  348 	call puts
      0096DF 0E C7 00         [ 2]  349 	ldw x,basicptr 
      0096E2 0F 72 BB         [ 1]  350 ld a,count 
      0096E5 00 0E            [ 1]  351 clrw y 
      0096E7 FE CD            [ 1]  352 rlwa y  
      0096E9 89 DA CE         [ 4]  353 call hex_dump
      0096EC 00 05 C6         [ 2]  354 	ldw x,basicptr
      0096EF 00 04 90         [ 1]  355 	ld a,in 
      0096F2 5F 90 02         [ 4]  356 	call prt_basic_line
      0096F5 CD 86 DE         [ 2]  357 	ldw x,#tk_id 
      0096F8 CE 00 05         [ 4]  358 	call puts 
      0096FB C6 00 02         [ 1]  359 	ld a,in.saved 
      0096FE CD               [ 1]  360 	clrw x 
      0096FF 9F               [ 1]  361 	ld xl,a 
      009700 74 AE 96 B5      [ 2]  362 	addw x,basicptr 
      009704 CD               [ 1]  363 	ld a,(x)
      009705 89               [ 1]  364 	clrw x 
      009706 DA               [ 1]  365 	ld xl,a 
      009707 C6 00 03         [ 4]  366 	call prt_i16
      00970A 5F 97 72 BB 00   [ 2]  367 	btjf flags,#FAUTORUN ,6$
      00970F 05 F6            [ 2]  368 	jra 6$
      00169D                        369 1$:	
      009711 5F               [ 1]  370 	push a 
      009712 97 CD 98         [ 2]  371 	ldw x,#comp_msg
      009715 21 72 0D         [ 4]  372 	call puts 
      009718 00               [ 1]  373 	pop a 
      009719 22 37 20         [ 2]  374 	ldw x, #err_msg 
      00971C 35 5F 00 0D      [ 1]  375 	clr acc16 
      00971D 48               [ 1]  376 	sll a
      00971D 88 AE 96 A4      [ 1]  377 	rlc acc16  
      009721 CD 89 DA         [ 1]  378 	ld acc8, a 
      009724 84 AE 95 38      [ 2]  379 	addw x,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      009728 72               [ 2]  380 	ldw x,(x)
      009729 5F 00 0E         [ 4]  381 	call puts
      00972C 48 72 59         [ 2]  382 	ldw x,#tib
      00972F 00 0E C7         [ 4]  383 	call puts 
      009732 00 0F            [ 1]  384 	ld a,#CR 
      009734 72 BB 00         [ 4]  385 	call putc
      009737 0E FE CD         [ 2]  386 	ldw x,in.w
      00973A 89 DA AE         [ 4]  387 	call spaces
      00973D 16 68            [ 1]  388 	ld a,#'^
      00973F CD 89 DA         [ 4]  389 	call putc 
      009742 A6 0D CD         [ 2]  390 6$: ldw x,#STACK_EMPTY 
      009745 89               [ 1]  391     ldw sp,x
                                    392 
      0016D6                        393 warm_start:
      009746 7D CE 00         [ 4]  394 	call warm_init
                                    395 ;----------------------------
                                    396 ;   BASIC interpreter
                                    397 ;----------------------------
      0016D9                        398 cmd_line: ; user interface 
      009749 01 CD            [ 1]  399 	ld a,#CR 
      00974B 8A 47 A6         [ 4]  400 	call putc 
      00974E 5E CD            [ 1]  401 	ld a,#'> 
      009750 89 7D AE         [ 4]  402 	call putc
      009753 17 FF 94         [ 4]  403 	call readln
      009756 72 5D 00 03      [ 1]  404 	tnz count 
      009756 CD 94            [ 1]  405 	jreq cmd_line
      009758 FF 10 86         [ 4]  406 	call compile
                                    407 ;pushw y 
                                    408 ;ldw x,txtbgn  
                                    409 ;ldw y,txtend
                                    410 ;ldw acc16,x   
                                    411 ;subw y,acc16 
                                    412 ;call hex_dump
                                    413 ;popw y 
                                    414 ; if text begin with a line number
                                    415 ; the compiler set count to zero    
                                    416 ; so code is not interpreted
      009759 72 5D 00 03      [ 1]  417 	tnz count 
      009759 A6 0D            [ 1]  418 	jreq cmd_line
                                    419 	
                                    420 ; if direct command 
                                    421 ; it's ready to interpret 
                                    422 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    423 ;; This is the interpreter loop
                                    424 ;; for each BASIC code line. 
                                    425 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      0016F5                        426 interpreter: 
      00975B CD 89 7D         [ 1]  427 	ld a,in 
      00975E A6 3E CD         [ 1]  428 	cp a,count 
      009761 89 7D            [ 1]  429 	jrmi interp_loop
      0016FD                        430 next_line:
      009763 CD 8A DF 72 5D   [ 2]  431 	btjf flags, #FRUN, cmd_line
      009768 00 04 27         [ 2]  432 	ldw x,basicptr
      00976B ED CD 91 06      [ 2]  433 	addw x,in.w 
      00976F 72 5D 00         [ 2]  434 	cpw x,txtend 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      009772 04 27            [ 1]  435 	jrpl warm_start
      009774 E4 00 04         [ 2]  436 	ldw basicptr,x ; start of next line  
      009775 E6 02            [ 1]  437 	ld a,(2,x)
      009775 C6 00 02         [ 1]  438 	ld count,a 
      009778 C1 00 04 2B      [ 1]  439 	mov in,#3 ; skip first 3 bytes of line 
      00171A                        440 interp_loop:
      00977C 1D 17 4B         [ 4]  441 	call next_token
      00977D A1 00            [ 1]  442 	cp a,#TK_NONE 
      00977D 72 01            [ 1]  443 	jreq next_line 
      00977F 00 22            [ 1]  444 	cp a,#TK_CMD
      009781 D7 CE            [ 1]  445 	jrne 1$
      009783 00 05 72         [ 4]  446 	call get_code_addr
      009786 BB               [ 4]  447 	call (x) 
      009787 00 01            [ 2]  448 	jra interp_loop 
      00172B                        449 1$:	 
      009789 C3 00            [ 1]  450 	cp a,#TK_VAR
      00978B 1D 2A            [ 1]  451 	jrne 2$
      00978D C8 CF 00         [ 4]  452 	call let_var  
      009790 05 E6            [ 2]  453 	jra interp_loop 
      001734                        454 2$:	
      009792 02 C7            [ 1]  455 	cp a,#TK_ARRAY 
      009794 00 04            [ 1]  456 	jrne 3$
      009796 35 03 00         [ 4]  457 	call let_array 
      009799 02 DD            [ 2]  458 	jra interp_loop
      00979A                        459 3$:	
      00979A CD 97            [ 1]  460 	cp a,#TK_COLON 
      00979C CB A1            [ 1]  461 	jreq interp_loop
      00979E 00 27            [ 1]  462 4$: cp a,#TK_LABEL
      0097A0 DC A1 80         [ 4]  463 	call skip_string 
      0097A3 26 06            [ 2]  464 	jra interp_loop 
      0097A5 CD 97 E5         [ 2]  465 5$:	jp syntax_error 
                                    466 
                                    467 ;--------------------------
                                    468 ; extract next token from
                                    469 ; token list 
                                    470 ; basicptr -> base address 
                                    471 ; in  -> offset in list array 
                                    472 ; output:
                                    473 ;   A 		token attribute
                                    474 ;   X 		*token_value 
                                    475 ;----------------------------------------
      00174B                        476 next_token::
      0097A8 FD               [ 1]  477 	clrw x 
      0097A9 20 EF 01         [ 1]  478 	ld a,in 
      0097AB C7 00 02         [ 1]  479 	ld in.saved,a ; in case "_unget_token" needed 
                                    480 ; don't replace sub by "cp a,count" 
                                    481 ; if end of line must return with A=0   	
      0097AB A1 85 26         [ 1]  482 	sub a,count 
      0097AE 05 CD            [ 1]  483 	jreq 9$ ; end of line 
      001757                        484 0$: 
      0097B0 9C 40 20         [ 2]  485 	ldw x,basicptr 
      0097B3 E6 BB 00 00      [ 2]  486 	addw x,in.w 
      0097B4 F6               [ 1]  487 	ld a,(x)
      0097B4 A1               [ 1]  488 	incw x
      0097B5 05 26 05 CD      [ 1]  489 	inc in   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      0097B9 9C               [ 4]  490 9$: ret 
                                    491 
                                    492 ;------------------------
                                    493 ; get cmd and function 
                                    494 ; code address 
                                    495 ; input:
                                    496 ;    X   * cmd|func index 
                                    497 ;        in code_addr table 
                                    498 ;------------------------
      001765                        499 get_code_addr:
      0097BA 3B               [ 2]  500 	ldw x,(x)
      0097BB 20 DD E4         [ 2]  501 	ldw x,(code_addr,x)
      0097BD                        502 skip_2_bytes:
      0097BD A1 0A 27 D9      [ 1]  503 	inc in 
      0097C1 A1 03 CD 97      [ 1]  504 	inc in 
      0097C5 F2               [ 4]  505 	ret
                                    506 
                                    507 ;-------------------------
                                    508 ;  skip .asciz in BASIC line 
                                    509 ;  name 
                                    510 ;  input:
                                    511 ;     x		* string 
                                    512 ;  output:
                                    513 ;     none 
                                    514 ;-------------------------
      001772                        515 skip_string:
      0097C6 20               [ 1]  516 	ld a,(x)
      0097C7 D2 CC            [ 1]  517 	jreq 1$
      0097C9 96               [ 1]  518 	incw x 
      0097CA C5 FA            [ 2]  519 	jra skip_string 
      0097CB 5C               [ 1]  520 1$: incw x 	
      0097CB 5F C6 00 02      [ 2]  521 	subw x,basicptr 
      0097CF C7 00 03         [ 2]  522 	ldw in.w,x 
      0097D2 C0               [ 4]  523 	ret 
                                    524 
                                    525 ;---------------------
                                    526 ; extract 16 bits  
                                    527 ; address from BASIC
                                    528 ; code 
                                    529 ; input:
                                    530 ;    X    *address
                                    531 ; output:
                                    532 ;    X    address 
                                    533 ;-------------------- 
      001781                        534 get_addr:
      0097D3 00               [ 2]  535 	ldw x,(x)
      0097D4 04 27 0D 01      [ 1]  536 	inc in 
      0097D7 72 5C 00 01      [ 1]  537 	inc in 
      0097D7 CE               [ 4]  538 	ret 
                                    539 
                                    540 ;--------------------
                                    541 ; extract int24_t  
                                    542 ; value from BASIC 
                                    543 ; code 
                                    544 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



                                    545 ;    X   *integer 
                                    546 ; output:
                                    547 ;    A:X   int24  
                                    548 ;--------------------
      00178B                        549 get_int24:
      0097D8 00               [ 1]  550 	ld a,(x)
      0097D9 05 72            [ 2]  551 	ldw x,(1,x)
                                    552 ; skip 3 bytes 
      0097DB BB 00 01 F6      [ 1]  553 	inc in 
      0097DF 5C 72 5C 00      [ 1]  554 	inc in 
      0097E3 02 81 00 01      [ 1]  555 	inc in 
      0097E5 81               [ 4]  556 	ret 
                                    557 
                                    558 ;-------------------------
                                    559 ; get character from 
                                    560 ; BASIC code 
                                    561 ; input:
                                    562 ;    X   *char 
                                    563 ; output:
                                    564 ;    A    char 
                                    565 ;-------------------------
      00179B                        566 get_char:
      0097E5 FE               [ 1]  567 	ld a,(x)
      0097E6 DE B3 64 01      [ 1]  568 	inc in  
      0097E9 81               [ 4]  569     ret 
                                    570 
                                    571 ;-----------------------------------
                                    572 ; print a 16 bit integer 
                                    573 ; using variable 'base' as conversion
                                    574 ; format.
                                    575 ; input:
                                    576 ;    X       integer to print 
                                    577 ;   'base'    conversion base 
                                    578 ; output:
                                    579 ;   terminal  
                                    580 ;-----------------------------------
      0017A1                        581 prt_i16:
      0097E9 72 5C 00 02      [ 1]  582 	clr acc24 
      0097ED 72 5C 00         [ 2]  583 	ldw acc16,x 
      0097F0 02 81 00 0D 04   [ 2]  584 	btjf acc16,#7,prt_acc24
      0097F2 72 53 00 0C      [ 1]  585 	cpl acc24 ; sign extend 
                                    586 	
                                    587 ;------------------------------------
                                    588 ; print integer in acc24 
                                    589 ; input:
                                    590 ;	acc24 		integer to print 
                                    591 ;	'base' 		numerical base for conversion 
                                    592 ;   'tab_width' field width 
                                    593 ;    A 			signed||unsigned conversion
                                    594 ;  output:
                                    595 ;    A          string length
                                    596 ;------------------------------------
      0017B1                        597 prt_acc24:
      0097F2 F6 27            [ 1]  598 	ld a,#255  ; signed conversion  
      0097F4 03 5C 20         [ 4]  599     call itoa  ; conversion entier en  .asciz
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      0097F7 FA 5C 72         [ 4]  600 	call right_align  
      0097FA B0               [ 1]  601 	push a 
      0097FB 00 05 CF         [ 4]  602 	call puts
      0097FE 00               [ 1]  603 	pop a 
      0097FF 01               [ 4]  604     ret	
                                    605 
                                    606 ;---------------------------------------
                                    607 ;  print value at xstack top 
                                    608 ;---------------------------------------
      0017BF                        609 print_top: 
      0017BF                        610 	_xpop 
      009800 81 F6            [ 1]    1     ld a,(y)
      009801 93               [ 1]    2     ldw x,y 
      009801 FE 72            [ 2]    3     ldw x,(1,x)
      009803 5C 00 02 72      [ 2]    4     addw y,#CELL_SIZE 
      009807 5C 00 02         [ 1]  611 	ld acc24,a 
      00980A 81 00 0D         [ 2]  612 	ldw acc16,x 
      00980B CD 17 B1         [ 4]  613 	call prt_acc24 
      00980B F6 EE            [ 1]  614 	ld a,#SPACE
      00980D 01 72 5C         [ 4]  615 	call putc 
      009810 00               [ 4]  616 	ret 
                                    617 
                                    618 ;------------------------------------
                                    619 ; convert integer in acc24 to string
                                    620 ; input:
                                    621 ;   'base'	conversion base 
                                    622 ;	acc24	integer to convert
                                    623 ;   A       0=unsigned, else signed 
                                    624 ; output:
                                    625 ;   X  		pointer to first char of string
                                    626 ;   A       string length
                                    627 ;------------------------------------
                           000001   628 	SIGN=1  ; integer sign 
                           000002   629 	LEN=2 
                           000003   630 	PSTR=3
                           000004   631 	VSIZE=4 ;locals size
      0017D7                        632 itoa::
      0017D7                        633 	_vars VSIZE
      009811 02 72            [ 2]    1     sub sp,#VSIZE 
      009813 5C 00            [ 1]  634 	clr (LEN,sp) ; string length  
      009815 02 72            [ 1]  635 	clr (SIGN,sp)    ; sign
      009817 5C               [ 1]  636 	tnz A
      009818 00 02            [ 1]  637 	jreq 1$ ; unsigned conversion  
      00981A 81 00 0A         [ 1]  638 	ld a,base 
      00981B A1 0A            [ 1]  639 	cp a,#10
      00981B F6 72            [ 1]  640 	jrne 1$
                                    641 	; base 10 string display with negative sign if bit 23==1
      00981D 5C 00 02 81 05   [ 2]  642 	btjf acc24,#7,1$
      009821 03 01            [ 1]  643 	cpl (SIGN,sp)
      009821 72 5F 00         [ 4]  644 	call neg_acc24
      0017F1                        645 1$:
                                    646 ; initialize string pointer 
      009824 0D CF 00         [ 2]  647 	ldw x,#tib 
      009827 0E 72 0F         [ 2]  648 	addw x,#TIB_SIZE
      00982A 00               [ 2]  649 	decw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      00982B 0E               [ 1]  650 	clr (x)
      0017F9                        651 itoa_loop:
      00982C 04 72 53         [ 1]  652     ld a,base
                                    653 ;	ldw (PSTR,sp),x 
      00982F 00 0D C7         [ 4]  654     call divu24_8 ; acc24/A 
                                    655 ;	ldw x,(PSTR,sp)
      009831 AB 30            [ 1]  656     add a,#'0  ; remainder of division
      009831 A6 FF            [ 1]  657     cp a,#'9+1
      009833 CD 98            [ 1]  658     jrmi 2$
      009835 57 CD            [ 1]  659     add a,#7 
      001807                        660 2$:	
      009837 91               [ 2]  661 	decw x
      009838 AD               [ 1]  662     ld (x),a
      009839 88 CD            [ 1]  663 	inc (LEN,sp)
                                    664 	; if acc24==0 conversion done
      00983B 89 DA 84         [ 1]  665 	ld a,acc24
      00983E 81 00 0D         [ 1]  666 	or a,acc16
      00983F CA 00 0E         [ 1]  667 	or a,acc8
      00983F 90 F6            [ 1]  668     jrne itoa_loop
                                    669 	;conversion done, next add '$' or '-' as required
      009841 93 EE 01         [ 1]  670 	ld a,base 
      009844 72 A9            [ 1]  671 	cp a,#16
      009846 00 03            [ 1]  672 	jreq 8$
      009848 C7 00            [ 1]  673 	ld a,(SIGN,sp)
      00984A 0D CF            [ 1]  674     jreq 10$
      00984C 00 0E            [ 1]  675     ld a,#'-
      00984E CD 98            [ 2]  676 	jra 9$ 
      001825                        677 8$:	
      009850 31 A6            [ 1]  678 	ld a,#'$ 
      009852 20               [ 2]  679 9$: decw x
      009853 CD               [ 1]  680     ld (x),a
      009854 89 7D            [ 1]  681 	inc (LEN,sp)
      00182B                        682 10$:
      009856 81 02            [ 1]  683 	ld a,(LEN,sp)
      009857                        684 	_drop VSIZE
      009857 52 04            [ 2]    1     addw sp,#VSIZE 
      009859 0F               [ 4]  685 	ret
                                    686 
                                    687 ;------------------------------------
                                    688 ; convert alpha to uppercase
                                    689 ; input:
                                    690 ;    a  character to convert
                                    691 ; output:
                                    692 ;    a  uppercase character
                                    693 ;------------------------------------
      001830                        694 to_upper::
      00985A 02 0F            [ 1]  695 	cp a,#'a
      00985C 01 4D            [ 1]  696 	jrpl 1$
      00985E 27               [ 4]  697 0$:	ret
      00985F 11 C6            [ 1]  698 1$: cp a,#'z	
      009861 00 0B            [ 1]  699 	jrugt 0$
      009863 A1 0A            [ 1]  700 	sub a,#32
      009865 26               [ 4]  701 	ret
                                    702 	
                                    703 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



                                    704 ; convert pad content in integer
                                    705 ; input:
                                    706 ;    x		* .asciz to convert
                                    707 ; output:
                                    708 ;    acc24      int24_t
                                    709 ;------------------------------------
                                    710 	; local variables
                           000001   711 	SIGN=1 ; 1 byte, 
                           000002   712 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003   713 	TEMP=3 ; 1 byte, temporary storage
                           000003   714 	VSIZE=3 ; 3 bytes reserved for local storage
      00183C                        715 atoi24::
      009866 0A               [ 2]  716 	pushw x 
      00183D                        717 	_vars VSIZE
      009867 72 0F            [ 2]    1     sub sp,#VSIZE 
                                    718 	; acc24=0 
      009869 00 0D 05 03      [ 1]  719 	clr acc24    
      00986D 01 CD 82 51      [ 1]  720 	clr acc16
      009871 72 5F 00 0E      [ 1]  721 	clr acc8 
      009871 AE 16            [ 1]  722 	clr (SIGN,sp)
      009873 68 1C            [ 1]  723 	ld a,#10
      009875 00 50            [ 1]  724 	ld (BASE,sp),a ; default base decimal
      009877 5A               [ 1]  725 	ld a,(x)
      009878 7F 47            [ 1]  726 	jreq 9$  ; completed if 0
      009879 A1 2D            [ 1]  727 	cp a,#'-
      009879 C6 00            [ 1]  728 	jrne 1$
      00987B 0B CD            [ 1]  729 	cpl (SIGN,sp)
      00987D 83 47            [ 2]  730 	jra 2$
      00987F AB 30            [ 1]  731 1$: cp a,#'$
      009881 A1 3A            [ 1]  732 	jrne 3$
      009883 2B 02            [ 1]  733 	ld a,#16
      009885 AB 07            [ 1]  734 	ld (BASE,sp),a
      009887 5C               [ 1]  735 2$:	incw x
      009887 5A               [ 1]  736 	ld a,(x)
      001866                        737 3$:	
      009888 F7 0C            [ 1]  738 	cp a,#'a
      00988A 02 C6            [ 1]  739 	jrmi 4$
      00988C 00 0D            [ 1]  740 	sub a,#32
      00988E CA 00            [ 1]  741 4$:	cp a,#'0
      009890 0E CA            [ 1]  742 	jrmi 9$
      009892 00 0F            [ 1]  743 	sub a,#'0
      009894 26 E3            [ 1]  744 	cp a,#10
      009896 C6 00            [ 1]  745 	jrmi 5$
      009898 0B A1            [ 1]  746 	sub a,#7
      00989A 10 27            [ 1]  747 	cp a,(BASE,sp)
      00989C 08 7B            [ 1]  748 	jrpl 9$
      00989E 01 27            [ 1]  749 5$:	ld (TEMP,sp),a
      0098A0 0A A6            [ 1]  750 	ld a,(BASE,sp)
      0098A2 2D 20 02         [ 4]  751 	call mulu24_8
      0098A5 7B 03            [ 1]  752 	ld a,(TEMP,sp)
      0098A5 A6 24 5A         [ 1]  753 	add a,acc24+2
      0098A8 F7 0C 02         [ 1]  754 	ld acc24+2,a
      0098AB 4F               [ 1]  755 	clr a
      0098AB 7B 02 5B         [ 1]  756 	adc a,acc24+1
      0098AE 04 81 0D         [ 1]  757 	ld acc24+1,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      0098B0 4F               [ 1]  758 	clr a
      0098B0 A1 61 2A         [ 1]  759 	adc a,acc24
      0098B3 01 81 A1         [ 1]  760 	ld acc24,a
      0098B6 7A 22            [ 2]  761 	jra 2$
      0098B8 FB A0            [ 1]  762 9$:	tnz (SIGN,sp)
      0098BA 20 81            [ 1]  763     jreq atoi_exit
      0098BC CD 01 D1         [ 4]  764     call neg_acc24
      0018A2                        765 atoi_exit: 
      0018A2                        766 	_drop VSIZE
      0098BC 89 52            [ 2]    1     addw sp,#VSIZE 
      0098BE 03               [ 2]  767 	popw x ; restore x
      0098BF 72               [ 4]  768 	ret
                                    769 
                                    770 
                                    771 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    772 ;;   TINY BASIC  operators,
                                    773 ;;   commands and functions 
                                    774 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    775 
                                    776 ;---------------------------------
                                    777 ; dictionary search 
                                    778 ; input:
                                    779 ;	X 		dictionary entry point, name field  
                                    780 ;   y		.asciz name to search 
                                    781 ; output:
                                    782 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                    783 ;  X		cmd_index
                                    784 ;---------------------------------
                           000001   785 	NLEN=1 ; cmd length 
                           000002   786 	XSAVE=2
                           000004   787 	YSAVE=4
                           000005   788 	VSIZE=5 
      0018A6                        789 search_dict::
      0018A6                        790 	_vars VSIZE 
      0098C0 5F 00            [ 2]    1     sub sp,#VSIZE 
      0098C2 0D 72            [ 2]  791 	ldw (YSAVE,sp),y 
      0018AA                        792 search_next:
      0098C4 5F 00            [ 2]  793 	ldw (XSAVE,sp),x 
                                    794 ; get name length in dictionary	
      0098C6 0E               [ 1]  795 	ld a,(x)
      0098C7 72 5F            [ 1]  796 	and a,#0xf 
      0098C9 00 0F            [ 1]  797 	ld (NLEN,sp),a  
      0098CB 0F 01            [ 2]  798 	ldw y,(YSAVE,sp) ; name pointer 
      0098CD A6               [ 1]  799 	incw x 
      0018B4                        800 cp_loop:
      0098CE 0A 6B            [ 1]  801 	ld a,(y)
      0098D0 02 F6            [ 1]  802 	jreq str_match 
      0098D2 27 47            [ 1]  803 	tnz (NLEN,sp)
      0098D4 A1 2D            [ 1]  804 	jreq no_match  
      0098D6 26               [ 1]  805 	cp a,(x)
      0098D7 04 03            [ 1]  806 	jrne no_match 
      0098D9 01 20            [ 1]  807 	incw y 
      0098DB 08               [ 1]  808 	incw x
      0098DC A1 24            [ 1]  809 	dec (NLEN,sp)
      0098DE 26 06            [ 2]  810 	jra cp_loop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      0018C6                        811 no_match:
      0098E0 A6 10            [ 2]  812 	ldw x,(XSAVE,sp) 
      0098E2 6B 02 5C         [ 2]  813 	subw x,#2 ; move X to link field
      0098E5 F6 00            [ 1]  814 	push #TK_NONE 
      0098E6 FE               [ 2]  815 	ldw x,(x) ; next word link 
      0098E6 A1               [ 1]  816 	pop a ; TK_NONE 
      0098E7 61 2B            [ 1]  817 	jreq search_exit  ; not found  
                                    818 ;try next 
      0098E9 02 A0            [ 2]  819 	jra search_next
      0018D3                        820 str_match:
      0098EB 20 A1            [ 2]  821 	ldw x,(XSAVE,sp)
      0098ED 30               [ 1]  822 	ld a,(X)
      0098EE 2B 2B            [ 1]  823 	ld (NLEN,sp),a ; needed to test keyword type  
      0098F0 A0 30            [ 1]  824 	and a,#0xf 
                                    825 ; move x to procedure address field 	
      0098F2 A1               [ 1]  826 	inc a 
      0098F3 0A 2B 06         [ 1]  827 	ld acc8,a 
      0098F6 A0 07 11 02      [ 1]  828 	clr acc16 
      0098FA 2A 1F 6B 03      [ 2]  829 	addw x,acc16 
      0098FE 7B               [ 2]  830 	ldw x,(x) ; routine index  
                                    831 ;determine keyword type bits 7:6 
      0098FF 02 CD            [ 1]  832 	ld a,(NLEN,sp)
      009901 82               [ 1]  833 	swap a 
      009902 6E 7B            [ 1]  834 	and a,#0xc
      009904 03               [ 1]  835 	srl a
      009905 CB               [ 1]  836 	srl a 
      009906 00 0F            [ 1]  837 	add a,#128
      0018F0                        838 search_exit: 
      0018F0                        839 	_drop VSIZE 
      009908 C7 00            [ 2]    1     addw sp,#VSIZE 
      00990A 0F               [ 4]  840 	ret 
                                    841 
                                    842 ;---------------------
                                    843 ; check if next token
                                    844 ;  is of expected type 
                                    845 ; input:
                                    846 ;   A 		 expected token attribute
                                    847 ;  ouput:
                                    848 ;   none     if fail call syntax_error 
                                    849 ;--------------------
      0018F3                        850 expect:
      00990B 4F               [ 1]  851 	push a 
      00990C C9 00 0E         [ 4]  852 	call next_token 
      00990F C7 00            [ 1]  853 	cp a,(1,sp)
      009911 0E 4F            [ 1]  854 	jreq 1$
      009913 C9 00 0D         [ 2]  855 	jp syntax_error
      009916 C7               [ 1]  856 1$: pop a 
      009917 00               [ 4]  857 	ret 
                                    858 
                                    859 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    860 ; parse arguments list 
                                    861 ; between ()
                                    862 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001900                        863 func_args:
      009918 0D 20            [ 1]  864 	ld a,#TK_LPAREN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      00991A C9 0D 01         [ 4]  865 	call expect 
                                    866 ; expected to continue in arg_list 
                                    867 ; caller must check for TK_RPAREN 
                                    868 
                                    869 ;-------------------------------
                                    870 ; parse embedded BASIC routines 
                                    871 ; arguments list.
                                    872 ; arg_list::=  expr[','expr]*
                                    873 ; all arguments are of int24_t type
                                    874 ; and pushed on stack 
                                    875 ; input:
                                    876 ;   none
                                    877 ; output:
                                    878 ;   xstack{n}   arguments pushed on xstack
                                    879 ;   A 	number of arguments pushed on xstack  
                                    880 ;--------------------------------
      001905                        881 arg_list:
      00991D 27 03            [ 1]  882 	push #0  
      00991F CD 82 51         [ 4]  883 1$: call expression
      009922 A1 00            [ 1]  884 	cp a,#TK_NONE 
      009922 5B 03            [ 1]  885 	jreq 5$
      009924 85 81            [ 1]  886 	cp a,#TK_INTGR
      009926 26 0D            [ 1]  887 	jrne 4$
      001912                        888 3$: 
      009926 52 05            [ 1]  889 	inc (1,sp)
      009928 17 04 4B         [ 4]  890 	call next_token 
      00992A A1 08            [ 1]  891 	cp a,#TK_COMMA 
      00992A 1F 02            [ 1]  892 	jreq 1$ 
      00992C F6 A4            [ 1]  893 	cp a,#TK_NONE 
      00992E 0F 6B            [ 1]  894 	jreq 5$ 
      009930 01 16            [ 1]  895 4$:	cp a,#TK_RPAREN 
      009932 04 5C            [ 1]  896 	jreq 5$
      009934                        897 	_unget_token 
      009934 90 F6 27 1B 0D   [ 1]    1      mov in,in.saved  
      009939 01               [ 1]  898 5$:	pop a  
      00993A 27               [ 4]  899 	ret 
                                    900 
                                    901 ;--------------------------------
                                    902 ;   BASIC commnands 
                                    903 ;--------------------------------
                                    904 
                                    905 ;--------------------------------
                                    906 ;  arithmetic and relational 
                                    907 ;  routines
                                    908 ;  operators precedence
                                    909 ;  highest to lowest
                                    910 ;  operators on same row have 
                                    911 ;  same precedence and are executed
                                    912 ;  from left to right.
                                    913 ;	'*','/','%'
                                    914 ;   '-','+'
                                    915 ;   '=','>','<','>=','<=','<>','><'
                                    916 ;   '<>' and '><' are equivalent for not equal.
                                    917 ;--------------------------------
                                    918 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



                                    919 ;---------------------
                                    920 ; return array element
                                    921 ; address from @(expr)
                                    922 ; input:
                                    923 ;   A 		TK_ARRAY
                                    924 ; output:
                                    925 ;	X 		element address 
                                    926 ;----------------------
      00192A                        927 get_array_element:
      00993B 0A F1 26         [ 4]  928 	call func_args 
      00993E 07 90            [ 1]  929 	cp a,#1
      009940 5C 5C            [ 1]  930 	jreq 1$
      009942 0A 01 20         [ 2]  931 	jp syntax_error
      001934                        932 1$: _xpop 
      009945 EE F6            [ 1]    1     ld a,(y)
      009946 93               [ 1]    2     ldw x,y 
      009946 1E 02            [ 2]    3     ldw x,(1,x)
      009948 1D 00 02 4B      [ 2]    4     addw y,#CELL_SIZE 
                                    933     ; ignore A, index < 65536 in any case 
                                    934 	; check for bounds 
      00994C 00 FE 84         [ 2]  935 	cpw x,array_size 
      00994F 27 1F            [ 2]  936 	jrule 3$
                                    937 ; bounds {1..array_size}	
      009951 20 D7            [ 1]  938 2$: ld a,#ERR_BAD_VALUE 
      009953 CC 16 47         [ 2]  939 	jp tb_error 
      009953 1E               [ 2]  940 3$: tnzw  x
      009954 02 F6            [ 1]  941 	jreq 2$ 
      009956 6B               [ 2]  942 	pushw x 
      009957 01               [ 2]  943 	sllw x 
      009958 A4 0F 4C         [ 2]  944 	addw x,(1,sp) ; index*size_of(int24)
      00995B C7 00            [ 2]  945 	ldw (1,sp),x  
      00995D 0F 72 5F         [ 2]  946 	ldw x,#tib ; array is below tib 
      009960 00 0E 72         [ 2]  947 	subw x,(1,sp)
      001957                        948 	_drop 2   
      009963 BB 00            [ 2]    1     addw sp,#2 
      009965 0E               [ 4]  949 	ret 
                                    950 
                                    951 
                                    952 ;***********************************
                                    953 ;   expression parse,execute 
                                    954 ;***********************************
                                    955 ;-----------------------------------
                                    956 ; factor ::= ['+'|'-'|e]  var | @ |
                                    957 ;			 integer | function |
                                    958 ;			 '('relation')' 
                                    959 ; output:
                                    960 ;   A       token attribute 
                                    961 ;   xstack  value  
                                    962 ; ---------------------------------
                           000001   963 	NEG=1
                           000001   964 	VSIZE=1
      00195A                        965 factor:
      00195A                        966 	_vars VSIZE 
      009966 FE 7B            [ 2]    1     sub sp,#VSIZE 
      009968 01 4E            [ 1]  967 	clr (NEG,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      00996A A4 0C 44         [ 4]  968 	call next_token
      00996D 44 AB            [ 1]  969 	cp a,#CMD_END  
      00996F 80 68            [ 1]  970 	jrult 16$
      009970 A1 10            [ 1]  971 1$:	cp a,#TK_PLUS 
      009970 5B 05            [ 1]  972 	jreq 2$
      009972 81 11            [ 1]  973 	cp a,#TK_MINUS 
      009973 26 05            [ 1]  974 	jrne 4$ 
      009973 88 CD            [ 1]  975 	cpl (NEG,sp)
      00196F                        976 2$:	
      009975 97 CB 11         [ 4]  977 	call next_token 
      001972                        978 4$:	
      009978 01 27            [ 1]  979 	cp a,#TK_IFUNC 
      00997A 03 CC            [ 1]  980 	jrne 5$ 
      00997C 96 C5 84         [ 4]  981 	call get_code_addr 
      00997F 81               [ 4]  982 	call (x); result in A:X  
      009980 20 5C            [ 2]  983 	jra 18$ 
      00197C                        984 5$:
      009980 A6 06            [ 1]  985 	cp a,#TK_INTGR
      009982 CD 99            [ 1]  986 	jrne 6$
      009984 73 17 8B         [ 4]  987 	call get_int24 
      009985 20 53            [ 2]  988 	jra 18$
      001985                        989 6$:
      009985 4B 00            [ 1]  990 	cp a,#TK_ARRAY
      009987 CD 9A            [ 1]  991 	jrne 7$
      009989 B7 A1 00         [ 4]  992 	call get_array_element
      00998C 27 1A            [ 2]  993     jra 71$
      00198E                        994 7$:
      00998E A1 84            [ 1]  995 	cp a,#TK_VAR 
      009990 26 0D            [ 1]  996 	jrne 8$
      009992 CD 17 81         [ 4]  997 	call get_addr 
      001995                        998 71$:
      009992 0C               [ 1]  999 	ld a,(x)
      009993 01 CD            [ 2] 1000 	ldw x,(1,x)
      009995 97 CB            [ 2] 1001 	jra 18$
      00199A                       1002 8$:
      009997 A1 08            [ 1] 1003 	cp a,#TK_LABEL 
      009999 27 EC            [ 1] 1004 	jrne 9$ 
      00999B A1 00 27         [ 4] 1005 	call search_const 
      00999E 09               [ 1] 1006 	clr a 
      00999F A1               [ 2] 1007 	tnzw x 
      0099A0 07 27            [ 1] 1008 	jreq 16$
      0099A2 05 55 00         [ 4] 1009 	call get_const_value 
      0099A5 03 00            [ 2] 1010 	jra 18$
      0019AA                       1011 9$: 
      0099A7 02 84            [ 1] 1012 	cp a,#TK_CFUNC 
      0099A9 81 08            [ 1] 1013 	jrne 12$
      0099AA CD 17 65         [ 4] 1014 	call get_code_addr 
      0099AA CD               [ 4] 1015 	call(x)
      0099AB 99               [ 1] 1016 	clrw x 
      0099AC 80               [ 1] 1017 	rlwa x 
      0099AD A1 01            [ 2] 1018 	jra 18$ 	 
      0019B6                       1019 12$:			
      0099AF 27 03            [ 1] 1020 	cp a,#TK_LPAREN
      0099B1 CC 96            [ 1] 1021 	jrne 16$
      0099B3 C5 90 F6         [ 4] 1022 	call expression
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      0099B6 93 EE            [ 1] 1023 	ld a,#TK_RPAREN 
      0099B8 01 72 A9         [ 4] 1024 	call expect
      0019C2                       1025 	_xpop 
      0099BB 00 03            [ 1]    1     ld a,(y)
      0099BD C3               [ 1]    2     ldw x,y 
      0099BE 00 20            [ 2]    3     ldw x,(1,x)
      0099C0 23 05 A6 0A      [ 2]    4     addw y,#CELL_SIZE 
      0099C4 CC 96            [ 2] 1026 	jra 18$	
      0019CD                       1027 16$:
      0099C6 C7               [ 1] 1028 	tnz a 
      0099C7 5D 27            [ 1] 1029 	jreq 20$ 
      0019D0                       1030 	_unget_token
      0099C9 F8 89 58 72 FB   [ 1]    1      mov in,in.saved  
      0099CE 01               [ 1] 1031 	clr a 
      0099CF 1F 01            [ 2] 1032 	jra 20$ 
      0019D8                       1033 18$: 
      0099D1 AE 16            [ 1] 1034 	tnz (NEG,sp)
      0099D3 68 72            [ 1] 1035 	jreq 19$
      0099D5 F0 01 5B         [ 4] 1036 	call neg_ax   
      0019DF                       1037 19$: _xpush 
      0099D8 02 81 00 03      [ 2]    1     subw y,#CELL_SIZE
      0099DA 90 F7            [ 1]    2     ld (y),a 
      0099DA 52 01 0F         [ 2]    3     ldw (1,y),x 
      0099DD 01 CD            [ 1] 1038      ld a,#TK_INTGR
      0019EA                       1039 20$:
      0019EA                       1040 	_drop VSIZE
      0099DF 97 CB            [ 2]    1     addw sp,#VSIZE 
      0099E1 A1               [ 4] 1041 	ret
                                   1042 
                                   1043 
                                   1044 ;-----------------------------------
                                   1045 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   1046 ; output:
                                   1047 ;   A    	token attribute 
                                   1048 ;	xstack		value 
                                   1049 ;-----------------------------------
                           000001  1050 	MULOP=1
                           000001  1051 	VSIZE=1
      0019ED                       1052 term:
      0019ED                       1053 	_vars VSIZE
      0099E2 02 25            [ 2]    1     sub sp,#VSIZE 
      0099E4 68 A1 10         [ 4] 1054 	call factor
      0099E7 27               [ 1] 1055 	tnz a 
      0099E8 06 A1            [ 1] 1056 	jreq term_exit 
      0019F5                       1057 term01:	 ; check for  operator 
      0099EA 11 26 05         [ 4] 1058 	call next_token
      0099ED 03 01            [ 1] 1059 	ld (MULOP,sp),a
      0099EF A1 02            [ 1] 1060 	cp a,#CMD_END
      0099EF CD 97            [ 1] 1061 	jrult 8$
      0099F1 CB 30            [ 1] 1062 	and a,#TK_GRP_MASK
      0099F2 A1 20            [ 1] 1063 	cp a,#TK_GRP_MULT
      0099F2 A1 81            [ 1] 1064 	jreq 1$
      0099F4 26 06            [ 2] 1065 	jra 8$
      001A06                       1066 1$:	; got *|/|%
      0099F6 CD 97 E5         [ 4] 1067 	call factor
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      0099F9 FD 20            [ 1] 1068 	cp a,#TK_INTGR
      0099FB 5C 03            [ 1] 1069 	jreq 2$
      0099FC CC 16 45         [ 2] 1070 	jp syntax_error
      001A10                       1071 2$:	
      0099FC A1 84            [ 1] 1072 	ld a,(MULOP,sp) 
      0099FE 26 05            [ 1] 1073 	cp a,#TK_MULT 
      009A00 CD 98            [ 1] 1074 	jrne 3$
      009A02 0B 20 53         [ 4] 1075 	call mul24 
      009A05 20 DA            [ 2] 1076 	jra term01
      009A05 A1 05            [ 1] 1077 3$: cp a,#TK_DIV 
      009A07 26 05            [ 1] 1078 	jrne 4$ 
      009A09 CD 99 AA         [ 4] 1079 	call div24 
      009A0C 20 07            [ 2] 1080 	jra term01 
      009A0E CD 03 93         [ 4] 1081 4$: call mod24
      009A0E A1 85            [ 2] 1082 	jra term01 
      009A10 26 08            [ 1] 1083 8$: ld a,(MULOP,sp)
      009A12 CD 98            [ 1] 1084 	jreq 9$ 
      001A2D                       1085 	_unget_token
      009A14 01 00 02 00 01   [ 1]    1      mov in,in.saved  
      009A15                       1086 9$: 
      009A15 F6 EE            [ 1] 1087 	ld a,#TK_INTGR 	
      001A34                       1088 term_exit:
      001A34                       1089 	_drop VSIZE 
      009A17 01 20            [ 2]    1     addw sp,#VSIZE 
      009A19 3E               [ 4] 1090 	ret 
                                   1091 
                                   1092 ;-------------------------------
                                   1093 ;  expr ::= term [['+'|'-'] term]*
                                   1094 ;  result range {-32768..32767}
                                   1095 ;  output:
                                   1096 ;   A    token attribute 
                                   1097 ;   xstack	 result    
                                   1098 ;-------------------------------
                           000001  1099 	OP=1 
                           000001  1100 	VSIZE=1 
      009A1A                       1101 expression:
      001A37                       1102 	_vars VSIZE 
      009A1A A1 03            [ 2]    1     sub sp,#VSIZE 
      009A1C 26 0C CD         [ 4] 1103 	call term
      009A1F 9D               [ 1] 1104 	tnz a 
      009A20 0E 4F            [ 1] 1105 	jreq expr_exit 
      001A3F                       1106 1$:	
      009A22 5D 27 28         [ 4] 1107 	call next_token
      009A25 CD 9C            [ 1] 1108 	ld (OP,sp),a 
      009A27 70 20            [ 1] 1109 	cp a,#CMD_END 
      009A29 2E 22            [ 1] 1110 	jrult 8$ 
      009A2A A4 30            [ 1] 1111 	and a,#TK_GRP_MASK
      009A2A A1 82            [ 1] 1112 	cp a,#TK_GRP_ADD 
      009A2C 26 08            [ 1] 1113 	jreq 2$ 
      009A2E CD 97            [ 2] 1114 	jra 8$
      001A50                       1115 2$: 
      009A30 E5 FD 5F         [ 4] 1116 	call term
      009A33 02 20            [ 1] 1117 	cp a,#TK_INTGR
      009A35 22 03            [ 1] 1118 	jreq 3$
      009A36 CC 16 45         [ 2] 1119 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      001A5A                       1120 3$:	
      009A36 A1 06            [ 1] 1121 	ld a,(OP,sp)
      009A38 26 13            [ 1] 1122 	cp a,#TK_PLUS 
      009A3A CD 9A            [ 1] 1123 	jrne 4$
      009A3C B7 A6 07         [ 4] 1124 	call add24
      009A3F CD 99            [ 2] 1125 	jra 1$ 
      001A65                       1126 4$:	
      009A41 73 90 F6         [ 4] 1127 	call sub24
      009A44 93 EE            [ 2] 1128 	jra 1$
      009A46 01 72            [ 1] 1129 8$: ld a,(OP,sp)
      009A48 A9 00            [ 1] 1130 	jreq 9$ 
      001A6E                       1131 	_unget_token	
      009A4A 03 20 0B 00 01   [ 1]    1      mov in,in.saved  
      009A4D                       1132 9$: 
      009A4D 4D 27            [ 1] 1133 	ld a,#TK_INTGR	
      001A75                       1134 expr_exit:
      001A75                       1135 	_drop VSIZE 
      009A4F 1A 55            [ 2]    1     addw sp,#VSIZE 
      009A51 00               [ 4] 1136 	ret 
                                   1137 
                                   1138 ;---------------------------------------------
                                   1139 ; rel ::= expr rel_op expr
                                   1140 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   1141 ;  relation return  integer , zero is false 
                                   1142 ;  output:
                                   1143 ;    A 		token attribute  
                                   1144 ;	 xstack		value  
                                   1145 ;---------------------------------------------
                           000001  1146 	RELOP=1
                           000001  1147 	VSIZE=1 
      001A78                       1148 relation: 
      001A78                       1149 	_vars VSIZE
      009A52 03 00            [ 2]    1     sub sp,#VSIZE 
      009A54 02 4F 20         [ 4] 1150 	call expression
      009A57 12               [ 1] 1151 	tnz a 
      009A58 26 03            [ 1] 1152 	jrne 1$
      009A58 0D 01 27         [ 2] 1153 	jp rel_exit
      001A83                       1154 1$:	
                                   1155 ; expect rel_op or leave 
      009A5B 03 CD 82         [ 4] 1156 	call next_token 
      009A5E 49 72            [ 1] 1157 	ld (RELOP,sp),a 
      009A60 A2 00            [ 1] 1158 	and a,#TK_GRP_MASK
      009A62 03 90            [ 1] 1159 	cp a,#TK_GRP_RELOP 
      009A64 F7 90            [ 1] 1160 	jrne 8$
      001A8E                       1161 2$:	; expect another expression
      009A66 EF 01 A6         [ 4] 1162 	call expression
      009A69 84 84            [ 1] 1163 	cp a,#TK_INTGR
      009A6A 27 03            [ 1] 1164 	jreq 3$
      009A6A 5B 01 81         [ 2] 1165 	jp syntax_error 
      009A6D                       1166 3$:	
      009A6D 52 01 CD         [ 4] 1167 	call sub24 
      009A70 99 DA            [ 1] 1168 	jrne 4$
      009A72 4D 27 3F 0E      [ 1] 1169 	mov acc8,#2 ; n1==n2
      009A75 20 0C            [ 2] 1170 	jra 6$ 
      001AA3                       1171 4$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      009A75 CD 97            [ 1] 1172 	jrsgt 5$  
      009A77 CB 6B 01 A1      [ 1] 1173 	mov acc8,#4 ; n1<2 
      009A7B 02 25            [ 2] 1174 	jra 6$
      001AAB                       1175 5$:
      009A7D 2B A4 30 A1      [ 1] 1176 	mov acc8,#1 ; n1>n2 
      001AAF                       1177 6$:
      009A81 20               [ 1] 1178 	clrw x 
      009A82 27 02 20         [ 1] 1179 	ld a, acc8  
      009A85 23 01            [ 1] 1180 	and a,(RELOP,sp)
      009A86 27 01            [ 1] 1181 	jreq 7$
      009A86 CD               [ 1] 1182 	incw x
      001AB8                       1183 7$:	_store_top   
      009A87 99 DA            [ 1]    1     ld (y),a 
      009A89 A1 84 27         [ 2]    2     ldw (1,y),x     
      009A8C 03 CC            [ 2] 1184 	jra 10$  	
      009A8E 96 C5            [ 1] 1185 8$: ld a,(RELOP,sp)
      009A90 27 05            [ 1] 1186 	jreq 10$
      001AC3                       1187 	_unget_token
      009A90 7B 01 A1 20 26   [ 1]    1      mov in,in.saved  
      001AC8                       1188 10$:
      009A95 05 CD            [ 1] 1189 	ld a,#TK_INTGR
      001ACA                       1190 rel_exit:
      001ACA                       1191 	_drop VSIZE
      009A97 82 A1            [ 2]    1     addw sp,#VSIZE 
      009A99 20               [ 4] 1192 	ret 
                                   1193 
                                   1194 ;--------------------------------
                                   1195 ; BASIC: SHOW 
                                   1196 ; print stack content in hexadecimal bytes 
                                   1197 ; 16 bytes per row 
                                   1198 ;--------------------------------
                           000001  1199 	DEPTH=1
                           000002  1200 	CNTR=2
                           000002  1201 	VSIZE=2
      001ACD                       1202 show:
      001ACD                       1203 	_vars VSIZE 
      009A9A DA A1            [ 2]    1     sub sp,#VSIZE 
      009A9C 21 26            [ 1] 1204 	clr (CNTR,sp)
      009A9E 05 CD 83         [ 2] 1205 	ldw x,#cstk_prompt
      009AA1 65 20 D1         [ 4] 1206 	call puts 
      009AA4 CD 84            [ 2] 1207 	pushw y 
      009AA6 13 20 CC         [ 2] 1208 	ldw x,#XSTACK_EMPTY
      009AA9 7B 01 27         [ 2] 1209 	subw x,(1,sp)
      001ADF                       1210 	_drop 2
      009AAC 05 55            [ 2]    1     addw sp,#2 
      009AAE 00 03            [ 1] 1211 	ld a,#CELL_SIZE 
      009AB0 00               [ 2] 1212 	div x,a  
      009AB1 02               [ 1] 1213 	ld a,xl  
      009AB2 6B 01            [ 1] 1214     ld (DEPTH,sp),a 
      009AB2 A6 84 00 18      [ 2] 1215 	ldw ptr16,y 
      009AB4                       1216 1$: 
      009AB4 5B 01 81 18      [ 4] 1217 	ld a,[ptr16]
      009AB7 72 5C 00 19      [ 1] 1218 	inc ptr8 
      009AB7 52 01 CD 9A      [ 5] 1219 	ldw x,[ptr16]
      009ABB 6D 4D 27 36      [ 1] 1220 	inc ptr8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      009ABF 72 5C 00 19      [ 1] 1221 	inc ptr8 
      009ABF CD 97 CB         [ 1] 1222 	ld acc24,a 
      009AC2 6B 01 A1         [ 2] 1223 	ldw acc16,x 
      009AC5 02 25 22         [ 4] 1224 	call prt_acc24
      009AC8 A4 30            [ 1] 1225 	ld a,#SPACE 
      009ACA A1 10 27         [ 4] 1226 	call putc 
      009ACD 02 20            [ 1] 1227 	inc (CNTR,sp)
      009ACF 1A 02            [ 1] 1228 	ld a,(CNTR,sp)
      009AD0 11 01            [ 1] 1229 	cp a,(DEPTH,sp)
      009AD0 CD 9A            [ 1] 1230 	jrmi 1$
      009AD2 6D A1            [ 1] 1231 	ld a,#CR 
      009AD4 84 27 03         [ 4] 1232 	call putc  
      001B1A                       1233 	_drop VSIZE 
      009AD7 CC 96            [ 2]    1     addw sp,#VSIZE 
      009AD9 C5               [ 4] 1234 	ret
                                   1235 
      009ADA 0A 63 6F 6E 74 65 6E  1236 cstk_prompt: .asciz "\ncontent of expression stack from top to bottom:\n"
             74 20 6F 66 20 65 78
             70 72 65 73 73 69 6F
             6E 20 73 74 61 63 6B
             20 66 72 6F 6D 20 74
             6F 70 20 74 6F 20 62
             6F 74 74 6F 6D 3A 0A
             00
                                   1237 
                                   1238 
                                   1239 ;--------------------------------------------
                                   1240 ; BASIC: HEX 
                                   1241 ; select hexadecimal base for integer print
                                   1242 ;---------------------------------------------
      001B4F                       1243 hex_base:
      009ADA 7B 01 A1 10      [ 1] 1244 	mov base,#16 
      009ADE 26               [ 4] 1245 	ret 
                                   1246 
                                   1247 ;--------------------------------------------
                                   1248 ; BASIC: DEC 
                                   1249 ; select decimal base for integer print
                                   1250 ;---------------------------------------------
      001B54                       1251 dec_base:
      009ADF 05 CD 81 D8      [ 1] 1252 	mov base,#10
      009AE3 20               [ 4] 1253 	ret 
                                   1254 
                                   1255 ;------------------------
                                   1256 ; BASIC: FREE 
                                   1257 ; return free size in RAM 
                                   1258 ; output:
                                   1259 ;   A:x		size 
                                   1260 ;--------------------------
      001B59                       1261 free:
      009AE4 DA 89            [ 2] 1262 	pushw y 
      009AE5 4F               [ 1] 1263 	clr a 
      009AE5 CD 81 FD         [ 2] 1264 	ldw x,#tib 
      009AE8 20 D5 7B 01      [ 2] 1265 	ldw y,txtbgn 
      009AEC 27 05 55 00      [ 2] 1266 	cpw y,#app_space
      009AF0 03 00            [ 1] 1267 	jrult 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      009AF2 02 00 80         [ 2] 1268 	subw x,#free_ram 
      009AF3 20 04            [ 2] 1269 	jra 2$ 
      001B6E                       1270 1$:	
      009AF3 A6 84 00 1C      [ 2] 1271 	subw x,txtend
      009AF5 90 85            [ 2] 1272 2$:	popw y 
      009AF5 5B               [ 4] 1273 	ret 
                                   1274 
                                   1275 ;------------------------------
                                   1276 ; BASIC: SIZE 
                                   1277 ; command that print 
                                   1278 ; program start addres and size 
                                   1279 ;------------------------------
      001B75                       1280 cmd_size:
      009AF6 01 81 0A         [ 1] 1281 	push base 
      009AF8 AE 1D C1         [ 2] 1282 	ldw x,#PROG_ADDR 
      009AF8 52 01 CD         [ 4] 1283 	call puts 
      009AFB 9A B7 4D         [ 2] 1284 	ldw x,txtbgn     
      009AFE 26 03 CC 9B      [ 1] 1285 	mov base,#16 
      009B02 4A 17 A1         [ 4] 1286 	call prt_i16
      009B03 32 00 0A         [ 1] 1287 	pop base 
      009B03 CD 97 CB         [ 2] 1288 	ldw x,#PROG_SIZE 
      009B06 6B 01 A4         [ 4] 1289 	call puts 
      009B09 30 A1 30         [ 2] 1290 	ldw x,txtend 
      009B0C 26 31 00 1A      [ 2] 1291 	subw x,txtbgn 
      009B0E CD 17 A1         [ 4] 1292 	call prt_i16
      009B0E CD 9A B7         [ 2] 1293 	ldw x,#STR_BYTES 
      009B11 A1 84 27         [ 4] 1294 	call puts  
      009B14 03               [ 4] 1295 	ret 
                                   1296 
                                   1297 
                                   1298 ;------------------------
                                   1299 ; BASIC: UBOUND  
                                   1300 ; return array variable size 
                                   1301 ; and set 'array_size' variable 
                                   1302 ; output:
                                   1303 ;   A:X 	array_size
                                   1304 ;--------------------------
      001BA2                       1305 ubound:
      009B15 CC 96 C5         [ 4] 1306 	call free 
      009B18 A6 03            [ 1] 1307 	ld a,#CELL_SIZE 
      009B18 CD               [ 4] 1308 	mul x,a 
      009B19 81 FD 26         [ 2] 1309 	ldw array_size,x
      009B1C 06               [ 1] 1310 	clr a 
      009B1D 35               [ 4] 1311 	ret 
                                   1312 
                                   1313 ;-----------------------------
                                   1314 ; BASIC: LET var=expr 
                                   1315 ; variable assignement 
                                   1316 ; output:
                                   1317 ;   A 		TK_NONE 
                                   1318 ;-----------------------------
      001BAD                       1319 let::
      009B1E 02 00 0F         [ 4] 1320 	call next_token 
      009B21 20 0C            [ 1] 1321 	cp a,#TK_VAR 
      009B23 27 0C            [ 1] 1322 	jreq let_var
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      009B23 2C 06            [ 1] 1323 	cp a,#TK_ARRAY 
      009B25 35 04            [ 1] 1324 	jreq  let_array
      009B27 00 0F 20         [ 2] 1325 	jp syntax_error
      001BBB                       1326 let_array:
      009B2A 04 19 2A         [ 4] 1327 	call get_array_element
      009B2B 20 03            [ 2] 1328 	jra let_eval 
      001BC0                       1329 let_var:
      009B2B 35 01 00         [ 4] 1330 	call get_addr
      001BC3                       1331 let_eval:
      009B2E 0F 00 18         [ 2] 1332 	ldw ptr16,x  ; variable address 
      009B2F CD 17 4B         [ 4] 1333 	call next_token 
      009B2F 5F C6            [ 1] 1334 	cp a,#TK_EQUAL
      009B31 00 0F            [ 1] 1335 	jreq 1$
      009B33 14 01 27         [ 2] 1336 	jp syntax_error
      001BD0                       1337 1$:	
      009B36 01 5C 90         [ 4] 1338 	call expression    
      009B39 F7 90            [ 1] 1339 	cp a,#TK_INTGR 
      009B3B EF 01            [ 1] 1340 	jreq 2$
      009B3D 20 09 7B         [ 2] 1341 	jp syntax_error
      001BDA                       1342 2$:	
      001BDA                       1343 	_xpop ; value 
      009B40 01 27            [ 1]    1     ld a,(y)
      009B42 05               [ 1]    2     ldw x,y 
      009B43 55 00            [ 2]    3     ldw x,(1,x)
      009B45 03 00 02 03      [ 2]    4     addw y,#CELL_SIZE 
      009B48                       1344 3$:
      009B48 A6 84 00 18      [ 4] 1345 	ld [ptr16],a
      009B4A 72 5C 00 19      [ 1] 1346 	inc ptr8  
      009B4A 5B 01 81 18      [ 5] 1347 	ldw [ptr16],x 
      009B4D 81               [ 4] 1348 	ret 
                                   1349 
                                   1350 
                                   1351 ;--------------------------
                                   1352 ; return constant value 
                                   1353 ; from it's record address
                                   1354 ; input:
                                   1355 ;	X	*const record 
                                   1356 ; output:
                                   1357 ;   A:X   const  value
                                   1358 ;--------------------------
      001BF0                       1359 get_const_value: ; -- i 
      009B4D 52               [ 1] 1360 	ld a,(x) ; record size 
      009B4E 02 0F            [ 1] 1361 	sub a,#3 ; * value 
      009B50 02               [ 1] 1362 	push a 
      009B51 AE 9B            [ 1] 1363 	push #0 
      009B53 9D CD 89         [ 2] 1364 	addw x,(1,sp)
      009B56 DA               [ 1] 1365 	ld a,(x)
      009B57 90 89            [ 2] 1366 	ldw x,(1,x)
      001BFC                       1367 	_drop 2
      009B59 AE 17            [ 2]    1     addw sp,#2 
      009B5B 73               [ 4] 1368 	ret 
                                   1369 
                                   1370 
                                   1371 ;--------------------------
                                   1372 ; list constants in EEPROM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



                                   1373 ; call when using LIST \C 
                                   1374 ;-------------------------
                           000001  1375 	COUNT=1
                           000003  1376 	YTEMP=3
                           000004  1377 	VSIZE=4 
      001BFF                       1378 list_const:
      009B5C 72 F0            [ 2] 1379 	pushw y 
      001C01                       1380 	_vars 4 
      009B5E 01 5B            [ 2]    1     sub sp,#4 
      009B60 02               [ 1] 1381 	clrw x 
      009B61 A6 03            [ 2] 1382 	ldw (COUNT,sp),x  
      009B63 62 9F 6B 01      [ 2] 1383 	ldw Y,#EEPROM_BASE 
      009B67 90 CF 00 19      [ 2] 1384 1$:	cpw y,free_eeprom 
      009B6B 24 30            [ 1] 1385 	jruge 9$
      009B6B 72 C6            [ 2] 1386     ldw (YTEMP,sp),y 
      009B6D 00               [ 1] 1387 	ldw x,y
      009B6E 19               [ 1] 1388 	incw x 
      009B6F 72 5C 00         [ 4] 1389 	call puts  
      009B72 1A 72            [ 1] 1390 	ld a,#'= 
      009B74 CE 00 19         [ 4] 1391 	call putc 
      009B77 72 5C            [ 2] 1392 	ldw x,(YTEMP,sp)
      009B79 00 1A 72         [ 4] 1393 	call get_const_value 
      009B7C 5C 00 1A         [ 1] 1394 	ld acc24,a 
      009B7F C7 00 0D         [ 2] 1395 	ldw acc16,x 
      009B82 CF 00 0E         [ 4] 1396 	call prt_acc24
      009B85 CD 98            [ 2] 1397 	ldw x,(COUNT,sp)
      009B87 31               [ 1] 1398 	incw x 
      009B88 A6 20            [ 2] 1399 	ldw (COUNT,sp),x 
      009B8A CD 89 7D 0C      [ 1] 1400 	clr acc16 
      009B8E 02 7B            [ 2] 1401 	ldw y,(YTEMP,sp)
      009B90 02 11            [ 1] 1402 	ld a,(y)
      009B92 01 2B D6         [ 1] 1403 	ld acc8,a
      009B95 A6 0D CD 89      [ 2] 1404 	addw y,acc16 
      009B99 7D 5B            [ 2] 1405 	jra 1$ 
      001C40                       1406 9$:	
      009B9B 02 81            [ 2] 1407 	ldw x,(COUNT,sp)
      009B9D 0A 63 6F         [ 4] 1408 	call prt_i16 
      009BA0 6E 74 65         [ 2] 1409 	ldw x,#CONST_COUNT 
      009BA3 6E 74 20         [ 4] 1410 	call puts 
      001C4B                       1411 	_drop VSIZE 
      009BA6 6F 66            [ 2]    1     addw sp,#VSIZE 
      009BA8 20 65            [ 2] 1412 	popw y 
      009BAA 78               [ 4] 1413 	ret 
                                   1414 
      009BAB 70 72 65 73 73 69 6F  1415 CONST_COUNT: .asciz "constants in EEPROM\n"
             6E 20 73 74 61 63 6B
             20 66 72 6F 6D 20 74
                                   1416 
                                   1417 
                                   1418 ;--------------------------
                                   1419 ; BASIC: EEFREE 
                                   1420 ; eeprom_free 
                                   1421 ; search end of data  
                                   1422 ; in EEPROM 
                                   1423 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal  6F-Bits]



                                   1424 ;    none 
                                   1425 ; output:
                                   1426 ;    A:X     address free
                                   1427 ;-------------------------
      001C65                       1428 func_eefree:
      009BC1 70 20 74         [ 2] 1429 	ldw x,#EEPROM_BASE 
      009BC4 6F 20 62 6F      [ 1] 1430 1$:	mov acc8,#8 ; count 8 consecutive zeros
      009BC8 74 74 6F         [ 2] 1431     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      009BCB 6D 3A            [ 1] 1432 	jruge 8$ ; no free space 
      009BCD 0A               [ 1] 1433 2$: ld a,(x)
      009BCE 00 0C            [ 1] 1434 	jrne 3$
      009BCF 5C               [ 1] 1435 	incw x 
      009BCF 35 10 00 0B      [ 1] 1436 	dec acc8 
      009BD3 81 F6            [ 1] 1437 	jrne 2$
      009BD4 1D 00 08         [ 2] 1438 	subw x,#8 
      009BD4 35 0A            [ 2] 1439 	jra 9$  
      009BD6 00               [ 1] 1440 3$: ld a,(x)
      009BD7 0B               [ 1] 1441 	incw x
      009BD8 81               [ 1] 1442 	tnz a  
      009BD9 26 FB            [ 1] 1443 	jrne 3$
      009BD9 90               [ 2] 1444 	decw x   
      009BDA 89 4F            [ 2] 1445 	jra 1$ 
      009BDC AE               [ 1] 1446 8$: clrw x ; no free space 
      009BDD 16               [ 1] 1447 9$: clr a 
      009BDE 68 90 CE         [ 2] 1448 	ldw free_eeprom,x ; save in system variable 
      009BE1 00               [ 4] 1449 	ret 
                                   1450 
                           000005  1451 CONST_REC_MIN_BYTES=5 
                                   1452 ;--------------------------
                                   1453 ; search constant name 
                                   1454 ; format of constant record  
                                   1455 ;   .byte record length 
                                   1456 ;         = strlen(name)+5 
                                   1457 ;   .asciz name (variable length)
                                   1458 ;   .int24 value (3 bytes )
                                   1459 ; a constant record use 7+ bytes
                                   1460 ; constants are saved in EEPROM  
                                   1461 ; input:
                                   1462 ;    X     *name
                                   1463 ; output:
                                   1464 ;    X     address|0
                                   1465 ; use:
                                   1466 ;   A,Y, acc16 
                                   1467 ;-------------------------
                           000001  1468 	NAMEPTR=1 ; target name pointer 
                           000003  1469 	EEPTR=3   ; walking pointer in EEPROM
                           000005  1470 	RECLEN=5  ; record length of target
                           000005  1471 	VSIZE=5
      001C8E                       1472 search_const:
      009BE2 1B 90            [ 2] 1473 	pushw y 
      001C90                       1474 	_vars VSIZE
      009BE4 A3 B6            [ 2]    1     sub sp,#VSIZE 
      009BE6 00 25 05 1D      [ 1] 1475 	clr acc16 
      009BEA 00 80 20         [ 4] 1476 	call strlen 
      009BED 04 05            [ 1] 1477 	add a,#CONST_REC_MIN_BYTES 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      009BEE 6B 05            [ 1] 1478 	ld (RECLEN,sp),a    
      009BEE 72 B0            [ 2] 1479 	ldw (NAMEPTR,sp),x
      009BF0 00 1D 90 85      [ 2] 1480 	ldw y,#EEPROM_BASE 
      009BF4 81 01            [ 2] 1481 1$:	ldw x,(NAMEPTR,sp)
      009BF5 17 03            [ 2] 1482 	ldw (EEPTR,sp),y
      009BF5 3B 00 0B AE      [ 2] 1483 	cpw y, free_eeprom 
      009BF9 9E 41            [ 1] 1484 	jruge 7$ ; no match found 
      009BFB CD 89            [ 1] 1485 	ld a,(y)
      009BFD DA CE            [ 1] 1486 	cp a,(RECLEN,sp)
      009BFF 00 1B            [ 1] 1487 	jrne 2$ 
      009C01 35 10            [ 1] 1488 	incw y 
      009C03 00 0B CD         [ 4] 1489 	call strcmp
      009C06 98 21            [ 1] 1490 	jrne 8$ ; match found 
      001CBA                       1491 2$: ; skip this one 	
      009C08 32 00            [ 2] 1492 	ldW Y,(EEPTR,sp)
      009C0A 0B AE            [ 1] 1493 	ld a,(y)
      009C0C 9E 53 CD         [ 1] 1494 	ld acc8,a 
      009C0F 89 DA CE 00      [ 2] 1495 	addw y,acc16 
      009C13 1D 72            [ 2] 1496 	jra 1$  
      001CC7                       1497 7$: ; no match found 
      009C15 B0 00            [ 1] 1498 	clr (EEPTR,sp)
      009C17 1B CD            [ 1] 1499 	clr (EEPTR+1,sp)
      001CCB                       1500 8$: ; match found 
      009C19 98 21            [ 2] 1501 	ldw x,(EEPTR,sp) ; record address 
      001CCD                       1502 9$:	_DROP VSIZE
      009C1B AE 9E            [ 2]    1     addw sp,#VSIZE 
      009C1D 64 CD            [ 2] 1503 	 popw y 
      009C1F 89               [ 4] 1504 	 ret 
                                   1505 
                                   1506 
                                   1507 ;--------------------------------------------
                                   1508 ; BASIC: CONST name=value [, name=value]*
                                   1509 ; define constant(s) saved in EEPROM
                                   1510 ;--------------------------------------------
                           000001  1511 	CNAME=1 
                           000003  1512 	BUFPTR=3
                           000005  1513 	RECLEN=5
                           000005  1514 	VSIZE=5
      001CD2                       1515 cmd_const:
      009C20 DA 81            [ 2] 1516 	pushw y 
      009C22                       1517 	_vars VSIZE 
      009C22 CD 9B            [ 2]    1     sub sp,#VSIZE 
      009C24 D9 A6 03 42      [ 1] 1518 	bres flags,#FUPDATE 
      009C28 CF 00 20         [ 4] 1519 	call next_token 
      009C2B 4F 81            [ 1] 1520 	cp a,#TK_CHAR 
      009C2D 26 0E            [ 1] 1521 	jrne 1$
      009C2D CD               [ 1] 1522 	ld a,xl
      009C2E 97 CB            [ 1] 1523 	and a,#0xDF 
      009C30 A1 85            [ 1] 1524 	cp a,#'U 
      009C32 27 0C            [ 1] 1525 	jrne 2$
      009C34 A1 05 27 03      [ 1] 1526 	bset flags,#FUPDATE 
      001CEC                       1527 0$:
      009C38 CC 96 C5         [ 4] 1528 	call next_token 
      009C3B                       1529 1$:	
      009C3B CD 99            [ 1] 1530 	cp a,#TK_LABEL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      009C3D AA 20            [ 1] 1531 	jreq 3$
      001CF3                       1532 2$:	 
      009C3F 03 16 45         [ 2] 1533 	jp syntax_error 
      009C40                       1534 3$: 
      009C40 CD 98            [ 2] 1535 	ldw (CNAME,sp),x ; *const_name
      009C42 01 01            [ 2] 1536 	ldw x,(CNAME,sp)
      009C43 CD 13 89         [ 4] 1537 	call strlen 
      009C43 CF 00            [ 1] 1538 	add a,#CONST_REC_MIN_BYTES 
      009C45 19 CD            [ 1] 1539 	ld (RECLEN,sp),a 
                                   1540 ; copy name in buffer  
      009C47 97 CB            [ 2] 1541 	ldw y,(CNAME,sp) 
      009C49 A1 32 27         [ 2] 1542 	ldw x,#tib  
      009C4C 03 CC            [ 1] 1543 	ld a,(RECLEN,sp)
      009C4E 96               [ 1] 1544 	ld (x),a 
      009C4F C5               [ 1] 1545 	incw x  
      009C50 CD 13 A5         [ 4] 1546 	call strcpy 
      009C50 CD 9A            [ 2] 1547 	ldw (BUFPTR,sp),x 
                                   1548 ; x not updated by strcpy 
                                   1549 ; BUFPTR must be incremented 
                                   1550 ; to point after name 
      009C52 B7 A1            [ 1] 1551 	ld a,(RECLEN,sp)
      009C54 84 27            [ 1] 1552 	sub a,#CONST_REC_MIN_BYTES-1
      009C56 03 CC            [ 1] 1553 	add a,(BUFPTR+1,sp) ; 
      009C58 96 C5            [ 1] 1554 	ld (BUFPTR+1,sp),a 
      009C5A 24 02            [ 1] 1555 	jrnc 4$
      009C5A 90 F6            [ 1] 1556     inc (BUFPTR,sp) 
      001D1B                       1557 4$:
      009C5C 93 EE            [ 1] 1558 	ld a,#TK_EQUAL 
      009C5E 01 72 A9         [ 4] 1559 	call expect 
      009C61 00 03 37         [ 4] 1560 	call expression 
      009C63 A1 84            [ 1] 1561 	cp a,#TK_INTGR 
      009C63 72 C7            [ 1] 1562 	jreq 5$ 
      009C65 00 19 72         [ 2] 1563 	jp syntax_error 
      009C68 5C 00            [ 2] 1564 5$:	ldw y,(BUFPTR,sp)
      001D2C                       1565 	_xpop ; get value from xstack 
      009C6A 1A 72            [ 1]    1     ld a,(y)
      009C6C CF               [ 1]    2     ldw x,y 
      009C6D 00 19            [ 2]    3     ldw x,(1,x)
      009C6F 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C70 90 F7            [ 1] 1566 	ld (y),a 
      009C70 F6 A0 03         [ 2] 1567 	ldw (1,y),x 
                                   1568 ; record completed in buffer 
                                   1569 ; check if constant already exist 
                                   1570 ; if so update value if \U option set 
      009C73 88 4B 00 72      [ 1] 1571 	clr farptr 
      009C77 FB 01            [ 2] 1572 	ldw x,(CNAME,sp)
      009C79 F6 EE 01         [ 4] 1573 	call search_const 
      009C7C 5B               [ 2] 1574 	tnzw x 
      009C7D 02 81            [ 1] 1575 	jreq 6$ ; new constant  
      009C7F 72 0F 00 21 1B   [ 2] 1576 	btjf flags,#FUPDATE,8$
      009C7F 90 89            [ 2] 1577 	jra 7$	
      001D4D                       1578 6$:	
      009C81 52 04 5F         [ 2] 1579 	ldw x,free_eeprom  
      001D50                       1580 7$:	
      009C84 1F 01 90         [ 2] 1581 	ldw farptr+1,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      009C87 AE 40 00         [ 2] 1582 	ldw x,#tib 
      009C8A 90 C3            [ 1] 1583 	ld a,(RECLEN,sp)
      009C8C 00 24 24         [ 4] 1584 	call write_nbytes
                                   1585 ; update free_eeprom 
      009C8F 30               [ 1] 1586 	clrw x 
      009C90 17 03            [ 1] 1587 	ld a,(RECLEN,sp)
      009C92 93               [ 1] 1588 	ld xl,a 
      009C93 5C CD 89 DA      [ 2] 1589 	addw x,free_eeprom 
      009C97 A6 3D CD         [ 2] 1590 	ldw free_eeprom,x
      001D66                       1591 8$:
      009C9A 89 7D 1E         [ 4] 1592 	call next_token 
      009C9D 03 CD            [ 1] 1593 	cp a,#TK_COMMA 
      009C9F 9C 70            [ 1] 1594 	jrne 9$
      009CA1 C7 00 0D         [ 2] 1595 	jp 0$ 
      001D70                       1596 9$: 
      001D70                       1597 	_unget_token    
      009CA4 CF 00 0E CD 98   [ 1]    1      mov in,in.saved  
      001D75                       1598 10$: 
      001D75                       1599 	_drop VSIZE 
      009CA9 31 1E            [ 2]    1     addw sp,#VSIZE 
      009CAB 01 5C            [ 2] 1600 	popw y 
      009CAD 1F               [ 4] 1601 	ret 
                                   1602 
                                   1603 
                                   1604 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1605 ; return program size 
                                   1606 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001D7A                       1607 prog_size:
      009CAE 01 72 5F         [ 2] 1608 	ldw x,txtend 
      009CB1 00 0E 16 03      [ 2] 1609 	subw x,txtbgn 
      009CB5 90               [ 4] 1610 	ret 
                                   1611 
                                   1612 ;----------------------------
                                   1613 ; print program information 
                                   1614 ;---------------------------
      001D82                       1615 program_info: 
      009CB6 F6 C7 00         [ 2] 1616 	ldw x,#PROG_ADDR 
      009CB9 0F 72 B9         [ 4] 1617 	call puts 
      009CBC 00 0E 20         [ 2] 1618 	ldw x,txtbgn 
      009CBF CA 10 00 0A      [ 1] 1619 	mov base,#16 
      009CC0 CD 17 A1         [ 4] 1620 	call prt_i16
      009CC0 1E 01 CD 98      [ 1] 1621 	mov base,#10  
      009CC4 21 AE 9C         [ 2] 1622 	ldw x,#PROG_SIZE
      009CC7 D0 CD 89         [ 4] 1623 	call puts 
      009CCA DA 5B 04         [ 4] 1624 	call prog_size 
      009CCD 90 85 81         [ 4] 1625 	call prt_i16 
      009CD0 63 6F 6E         [ 2] 1626 	ldw x,#STR_BYTES 
      009CD3 73 74 61         [ 4] 1627 	call puts
      009CD6 6E 74 73         [ 2] 1628 	ldw x,txtbgn
      009CD9 20 69 6E         [ 2] 1629 	cpw x,#app 
      009CDC 20 45            [ 1] 1630 	jrult 2$
      009CDE 45 50 52         [ 2] 1631 	ldw x,#FLASH_MEM 
      009CE1 4F 4D            [ 2] 1632 	jra 3$
      009CE3 0A 00 FC         [ 2] 1633 2$: ldw x,#RAM_MEM 	 
      009CE5 CD 09 5A         [ 4] 1634 3$:	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      009CE5 AE 40            [ 1] 1635 	ld a,#CR 
      009CE7 00 35 08         [ 4] 1636 	call putc
      009CEA 00               [ 4] 1637 	ret 
                                   1638 
      009CEB 0F A3 47 F8 24 17 F6  1639 PROG_ADDR: .asciz "program address: "
             26 0C 5C 72 5A 00 0F
             26 F6 1D 00
      009CFD 08 20 09 F6 5C 4D 26  1640 PROG_SIZE: .asciz ", program size: "
             FB 5A 20 E0 5F 4F CF
             00 24 81
      009D0E 20 62 79 74 65 73 00  1641 STR_BYTES: .asciz " bytes" 
      009D0E 90 89 52 05 72 5F 00  1642 FLASH_MEM: .asciz " in FLASH memory" 
             0E CD 94 09 AB 05 6B
             05 1F 01
      009D1F 90 AE 40 00 1E 01 17  1643 RAM_MEM:   .asciz " in RAM memory" 
             03 90 C3 00 24 24 1A
             90
                                   1644 
                                   1645 
                                   1646 ;----------------------------
                                   1647 ; BASIC: LIST [[start][,end]]
                                   1648 ; list program lines 
                                   1649 ; form start to end 
                                   1650 ; if empty argument list then 
                                   1651 ; list all.
                                   1652 ;----------------------------
                           000001  1653 	FIRST=1
                           000003  1654 	LAST=3 
                           000005  1655 	LN_PTR=5
                           000006  1656 	VSIZE=6 
      001E0B                       1657 list:
      009D2E F6 11 05 26 07   [ 2] 1658 	btjf flags,#FRUN,0$
      009D33 90 5C            [ 1] 1659 	ld a,#ERR_CMD_ONLY
      009D35 CD 94 14         [ 2] 1660 	jp tb_error
      001E15                       1661 0$:	 
      009D38 26 11 4B         [ 4] 1662 	call next_token 
      009D3A A1 04            [ 1] 1663 	cp a,#TK_CHAR 
      009D3A 16 03            [ 1] 1664 	jrne 2$
      009D3C 90 F6 C7         [ 4] 1665 	call get_char 
      009D3F 00 0F            [ 1] 1666 	and a,#0xDF 
      009D41 72 B9            [ 1] 1667 	cp a,#'C 
      009D43 00 0E            [ 1] 1668 	jrne 1$
      009D45 20 DC FF         [ 4] 1669 	call list_const
      009D47 81               [ 4] 1670 	ret 
      009D47 0F 03 0F         [ 2] 1671 1$: jp syntax_error 
      001E2C                       1672 2$:	_unget_token 
      009D4A 04 00 02 00 01   [ 1]    1      mov in,in.saved  
      009D4B CD 1D 7A         [ 4] 1673 	call prog_size 
      009D4B 1E 03            [ 1] 1674 	jrugt 3$
      009D4D 5B               [ 4] 1675 	ret 
      001E37                       1676 3$: _vars VSIZE
      009D4E 05 90            [ 2]    1     sub sp,#VSIZE 
      009D50 85 81 1A         [ 2] 1677 	ldw x,txtbgn 
      009D52 1F 05            [ 2] 1678 	ldw (LN_PTR,sp),x 
      009D52 90               [ 2] 1679 	ldw x,(x) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      009D53 89 52            [ 2] 1680 	ldw (FIRST,sp),x ; list from first line 
      009D55 05 72 1F         [ 2] 1681 	ldw x,#MAX_LINENO ; biggest line number 
      009D58 00 22            [ 2] 1682 	ldw (LAST,sp),x 
      009D5A CD 97 CB         [ 4] 1683 	call arg_list
      009D5D A1               [ 1] 1684 	tnz a
      009D5E 04 26            [ 1] 1685 	jreq list_loop 
      009D60 0E 9F            [ 1] 1686 	cp a,#2 
      009D62 A4 DF            [ 1] 1687 	jreq 4$
      009D64 A1 55            [ 1] 1688 	cp a,#1 
      009D66 26 0B            [ 1] 1689 	jreq first_line 
      009D68 72 1E 00         [ 2] 1690 	jp syntax_error 
      009D6B 22               [ 2] 1691 4$:	popw x 
      009D6C 1F 05            [ 2] 1692 	ldw (LAST+2,sp),x 
      001E5A                       1693 first_line:
      009D6C CD               [ 2] 1694 	popw x
      009D6D 97 CB            [ 2] 1695 	ldw (FIRST,sp),x 
      009D6F                       1696 lines_skip:
      009D6F A1 03 27         [ 2] 1697 	ldw x,txtbgn
      009D72 03 05            [ 2] 1698 2$:	ldw (LN_PTR,sp),x 
      009D73 C3 00 1C         [ 2] 1699 	cpw x,txtend 
      009D73 CC 96            [ 1] 1700 	jrpl list_exit 
      009D75 C5               [ 2] 1701 	ldw x,(x) ;line# 
      009D76 13 01            [ 2] 1702 	cpw x,(FIRST,sp)
      009D76 1F 01            [ 1] 1703 	jrpl list_loop 
      009D78 1E 01            [ 2] 1704 	ldw x,(LN_PTR,sp) 
      009D7A CD 94            [ 1] 1705 	ld a,(2,x)
      009D7C 09 AB 05         [ 1] 1706 	ld acc8,a 
      009D7F 6B 05 16 01      [ 1] 1707 	clr acc16 
      009D83 AE 16 68 7B      [ 2] 1708 	addw x,acc16
      009D87 05 F7            [ 2] 1709 	jra 2$ 
                                   1710 ; print loop
      001E7D                       1711 list_loop:
      009D89 5C CD            [ 2] 1712 	ldw x,(LN_PTR,sp)
      009D8B 94 25            [ 1] 1713 	ld a,(2,x) 
      009D8D 1F 03 7B         [ 4] 1714 	call prt_basic_line
      009D90 05 A0            [ 2] 1715 	ldw x,(LN_PTR,sp)
      009D92 04 1B            [ 1] 1716 	ld a,(2,x)
      009D94 04 6B 04         [ 1] 1717 	ld acc8,a 
      009D97 24 02 0C 03      [ 1] 1718 	clr acc16 
      009D9B 72 BB 00 0D      [ 2] 1719 	addw x,acc16
      009D9B A6 32 CD         [ 2] 1720 	cpw x,txtend 
      009D9E 99 73            [ 1] 1721 	jrpl list_exit
      009DA0 CD 9A            [ 2] 1722 	ldw (LN_PTR,sp),x
      009DA2 B7               [ 2] 1723 	ldw x,(x)
      009DA3 A1 84            [ 2] 1724 	cpw x,(LAST,sp)  
      009DA5 27 03            [ 1] 1725 	jrslt list_loop
      001E9F                       1726 list_exit:
      009DA7 CC 96 C5 16 03   [ 1] 1727 	mov in,count 
      009DAC 90 F6 93         [ 2] 1728 	ldw x,#pad 
      009DAF EE 01 72         [ 2] 1729 	ldw basicptr,x 
      001EAA                       1730 	_drop VSIZE 
      009DB2 A9 00            [ 2]    1     addw sp,#VSIZE 
      009DB4 03 90 F7         [ 4] 1731 	call program_info 
      009DB7 90               [ 4] 1732 	ret
                                   1733 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



                                   1734 
                                   1735 ;--------------------------
                                   1736 ; BASIC: EDIT 
                                   1737 ;  copy program in FLASH 
                                   1738 ;  to RAM for edition 
                                   1739 ;-------------------------
      001EB0                       1740 edit:
      009DB8 EF 01 72         [ 4] 1741 	call qsign 
      009DBB 5F 00            [ 1] 1742 	jreq 1$ 
      009DBD 18 1E 01         [ 2] 1743 	ldw x,#NOT_SAVED 
      009DC0 CD 9D 0E         [ 4] 1744 	call puts 
      009DC3 5D               [ 4] 1745 	ret 
      001EBC                       1746 1$: 
      009DC4 27 07 72 0F      [ 2] 1747 	ldw y,#app_sign ; source address 
      009DC8 00 22 1B         [ 2] 1748     ldw x,app_size  
      009DCB 20 03 04         [ 2] 1749 	addw x,#4 
      009DCD CF 00 0D         [ 2] 1750 	ldw acc16,x  ; bytes to copy 
      009DCD CE 00 24         [ 2] 1751 	ldw x,#rsign ; destination address 
      009DD0 CD 13 B5         [ 4] 1752 	call move  
      009DD0 CF 00 19         [ 2] 1753 	ldw x,#free_ram 
      009DD3 AE 16 68         [ 2] 1754 	ldw txtbgn,x 
      009DD6 7B 05 CD 88      [ 2] 1755 	addw x,rsize  
      009DDA BE 5F 7B         [ 2] 1756 	ldw txtend,x 
      009DDD 05               [ 4] 1757 	ret 
                                   1758 
      009DDE 97 72 BB 00 24 CF 00  1759 NOT_SAVED: .asciz "No application saved.\n"
             24 63 61 74 69 6F 6E
             20 73 61 76 65 64 2E
             0A 00
                                   1760 
                                   1761 
                                   1762 ;--------------------------
                                   1763 ; decompile line from token list
                                   1764 ; and print it. 
                                   1765 ; input:
                                   1766 ;   A       stop at this position 
                                   1767 ;   X 		pointer at line
                                   1768 ; output:
                                   1769 ;   none 
                                   1770 ;--------------------------	
      009DE6                       1771 prt_basic_line:
      009DE6 CD 97            [ 2] 1772 	pushw y 
      009DE8 CB A1 08         [ 1] 1773 	ld count,a 
      009DEB 26 03            [ 1] 1774 	ld a,(2,x)
      009DED CC 9D 6C         [ 1] 1775 	cp a,count 
      009DF0 2A 03            [ 1] 1776 	jrpl 1$ 
      009DF0 55 00 03         [ 1] 1777 	ld count,a 
      009DF3 00 02 04         [ 2] 1778 1$:	ldw basicptr,x 
      009DF5 90 AE 16 68      [ 2] 1779 	ldw y,#tib  
      009DF5 5B 05 90         [ 4] 1780 	call decompile 
      009DF8 85 81 5A         [ 4] 1781 	call puts 
      009DFA A6 0D            [ 1] 1782 	ld a,#CR 
      009DFA CE 00 1D         [ 4] 1783 	call putc 
      009DFD 72 B0            [ 2] 1784 	popw y 
      009DFF 00               [ 4] 1785 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



                                   1786 
                                   1787 
                                   1788 
                                   1789 ;---------------------------------
                                   1790 ; BASIC: PRINT|? arg_list 
                                   1791 ; print values from argument list
                                   1792 ;----------------------------------
                           000001  1793 	CCOMMA=1
                           000001  1794 	VSIZE=1
      001F18                       1795 print:
      001F18                       1796 	_vars VSIZE 
      009E00 1B 81            [ 2]    1     sub sp,#VSIZE 
      009E02                       1797 reset_comma:
      009E02 AE 9E            [ 1] 1798 	clr (CCOMMA,sp)
      001F1C                       1799 prt_loop:
      009E04 41 CD 89         [ 4] 1800 	call next_token
      009E07 DA CE            [ 1] 1801 	cp a,#CMD_END 
      009E09 00 1B            [ 1] 1802 	jrult print_exit ; colon or end of line 
      009E0B 35 10            [ 1] 1803 	cp a,#TK_QSTR
      009E0D 00 0B            [ 1] 1804 	jreq 1$
      009E0F CD 98            [ 1] 1805 	cp a,#TK_CHAR 
      009E11 21 35            [ 1] 1806 	jreq 2$ 
      009E13 0A 00            [ 1] 1807 	cp a,#TK_CFUNC 
      009E15 0B AE            [ 1] 1808 	jreq 3$
      009E17 9E 53            [ 1] 1809 	cp a,#TK_COMMA 
      009E19 CD 89            [ 1] 1810 	jreq 4$
      009E1B DA CD            [ 1] 1811 	cp a,#TK_SHARP 
      009E1D 9D FA            [ 1] 1812 	jreq 5$
      009E1F CD 98            [ 2] 1813 	jra 7$ 
      001F39                       1814 1$:	; print string 
      009E21 21 AE 9E         [ 4] 1815 	call puts
      009E24 64               [ 1] 1816 	incw x
      009E25 CD 89 DA CE      [ 2] 1817 	subw x,basicptr 
      009E29 00 1B A3         [ 2] 1818 	ldw in.w,x  
      009E2C B6 04            [ 2] 1819 	jra reset_comma
      001F46                       1820 2$:	; print character 
      009E2E 25 05 AE         [ 4] 1821 	call get_char 
      009E31 9E 6B 20         [ 4] 1822 	call putc 
      009E34 03 AE            [ 2] 1823 	jra reset_comma 
      001F4E                       1824 3$: ; print character function value  	
      009E36 9E 7C CD         [ 4] 1825 	call get_code_addr 
      009E39 89               [ 4] 1826 	call (x)
      009E3A DA A6 0D         [ 4] 1827 	call putc
      009E3D CD 89            [ 2] 1828 	jra reset_comma 
      001F57                       1829 4$: ; set comma state 
      009E3F 7D 81            [ 1] 1830 	cpl (CCOMMA,sp)
      009E41 70 72            [ 2] 1831 	jra prt_loop   
      001F5B                       1832 5$: ; # character must be followed by an integer   
      009E43 6F 67 72         [ 4] 1833 	call next_token
      009E46 61 6D            [ 1] 1834 	cp a,#TK_INTGR 
      009E48 20 61            [ 1] 1835 	jreq 6$
      009E4A 64 64 72         [ 2] 1836 	jp syntax_error 
      001F65                       1837 6$: ; set tab width
      009E4D 65 73 73         [ 4] 1838 	call get_int24 
      009E50 3A               [ 1] 1839 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      009E51 20 00            [ 1] 1840 	and a,#15 
      009E53 2C 20 70         [ 1] 1841 	ld tab_width,a 
      009E56 72 6F            [ 2] 1842 	jra reset_comma 
      001F70                       1843 7$:	
      001F70                       1844 	_unget_token 
      009E58 67 72 61 6D 20   [ 1]    1      mov in,in.saved  
      009E5D 73 69 7A         [ 4] 1845 	call expression  
      009E60 65 3A            [ 1] 1846 	cp a,#TK_INTGR 
      009E62 20 00            [ 1] 1847 	jrne print_exit 
      009E64 20 62 79         [ 4] 1848     call print_top
      009E67 74 65            [ 2] 1849 	jra reset_comma 
      001F81                       1850 print_exit:
      009E69 73 00            [ 1] 1851 	tnz (CCOMMA,sp)
      009E6B 20 69            [ 1] 1852 	jrne 9$
      009E6D 6E 20            [ 1] 1853 	ld a,#CR 
      009E6F 46 4C 41         [ 4] 1854     call putc 
      001F8A                       1855 9$:	_drop VSIZE 
      009E72 53 48            [ 2]    1     addw sp,#VSIZE 
      009E74 20               [ 4] 1856 	ret 
                                   1857 
                                   1858 ;----------------------
                                   1859 ; 'save_context' and
                                   1860 ; 'rest_context' must be 
                                   1861 ; called at the same 
                                   1862 ; call stack depth 
                                   1863 ; i.e. SP must have the 
                                   1864 ; save value at  
                                   1865 ; entry point of both 
                                   1866 ; routine. 
                                   1867 ;---------------------
                           000004  1868 	CTXT_SIZE=4 ; size of saved data 
                                   1869 ;--------------------
                                   1870 ; save current BASIC
                                   1871 ; interpreter context 
                                   1872 ; on stack 
                                   1873 ;--------------------
      001F8D                       1874 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001F8D                       1875 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001F8D                       1876 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      001F8D                       1877 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      001F8D                       1878 save_context:
      009E75 6D 65 6D         [ 2] 1879 	ldw x,basicptr 
      009E78 6F 72            [ 2] 1880 	ldw (BPTR,sp),x
      009E7A 79 00 20         [ 1] 1881 	ld a,in 
      009E7D 69 6E            [ 1] 1882 	ld (IN,sp),a
      009E7F 20 52 41         [ 1] 1883 	ld a,count 
      009E82 4D 20            [ 1] 1884 	ld (CNT,sp),a  
      009E84 6D               [ 4] 1885 	ret
                                   1886 
                                   1887 ;-----------------------
                                   1888 ; restore previously saved 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



                                   1889 ; BASIC interpreter context 
                                   1890 ; from stack 
                                   1891 ;-------------------------
      001F9D                       1892 rest_context:
      009E85 65 6D            [ 2] 1893 	ldw x,(BPTR,sp)
      009E87 6F 72 79         [ 2] 1894 	ldw basicptr,x 
      009E8A 00 05            [ 1] 1895 	ld a,(IN,sp)
      009E8B C7 00 01         [ 1] 1896 	ld in,a
      009E8B 72 01            [ 1] 1897 	ld a,(CNT,sp)
      009E8D 00 22 05         [ 1] 1898 	ld count,a  
      009E90 A6               [ 4] 1899 	ret
                                   1900 
                                   1901 
                                   1902 
                                   1903 ;------------------------------------------
                                   1904 ; BASIC: INPUT [string]var[,[string]var]
                                   1905 ; input value in variables 
                                   1906 ; [string] optionally can be used as prompt 
                                   1907 ;-----------------------------------------
                           000001  1908 	CX_BPTR=1
                           000003  1909 	CX_IN=3
                           000004  1910 	CX_CNT=4
                           000005  1911 	SKIP=5
                           000005  1912 	VSIZE=5
      001FAD                       1913 input_var:
      009E91 07 CC            [ 2] 1914 	pushw y 
      001FAF                       1915 	_vars VSIZE 
      009E93 96 C7            [ 2]    1     sub sp,#VSIZE 
      009E95                       1916 input_loop:
      009E95 CD 97            [ 1] 1917 	clr (SKIP,sp)
      009E97 CB A1 04         [ 4] 1918 	call next_token 
      009E9A 26 10            [ 1] 1919 	cp a,#TK_QSTR 
      009E9C CD 98            [ 1] 1920 	jrne 1$ 
      009E9E 1B A4 DF         [ 4] 1921 	call puts 
      009EA1 A1               [ 1] 1922 	incw x 
      009EA2 43 26 04 CD      [ 2] 1923 	subw x,basicptr 
      009EA6 9C 7F 81         [ 2] 1924 	ldw in.w,x 
      009EA9 CC 96            [ 1] 1925 	cpl (SKIP,sp)
      009EAB C5 55 00         [ 4] 1926 	call next_token 
      009EAE 03 00            [ 1] 1927 1$: cp a,#TK_VAR  
      009EB0 02 CD            [ 1] 1928 	jreq 2$ 
      009EB2 9D FA 22         [ 2] 1929 	jp syntax_error
      009EB5 01 81 52         [ 4] 1930 2$:	call get_addr
      009EB8 06 CE 00         [ 2] 1931 	ldw ptr16,x 
      009EBB 1B 1F            [ 1] 1932 	tnz (SKIP,sp)
      009EBD 05 FE            [ 1] 1933 	jrne 21$ 
      009EBF 1F 01 AE         [ 4] 1934 	call var_name 
      009EC2 7F FF 1F         [ 4] 1935 	call putc   
      001FE1                       1936 21$:
      009EC5 03 CD            [ 1] 1937 	ld a,#':
      009EC7 99 85 4D         [ 4] 1938 	call putc 
      009ECA 27 31 A1         [ 4] 1939 	call save_context 
      009ECD 02 27 07 A1      [ 1] 1940 	clr count  
      009ED1 01 27 06         [ 4] 1941 	call readln 
      009ED4 CC 96 C5         [ 2] 1942 	ldw x,#tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      009ED7 85 1F 05         [ 1] 1943 	push count
      009EDA 4B 00            [ 1] 1944 	push #0 
      009EDA 85 1F 01         [ 2] 1945 	addw x,(1,sp)
      009EDD 5C               [ 1] 1946 	incw x 
      001FFC                       1947 	_drop 2 
      009EDD CE 00            [ 2]    1     addw sp,#2 
      009EDF 1B 1F 05 C3      [ 1] 1948 	clr in 
      009EE3 00 1D 2A         [ 4] 1949 	call get_token
      009EE6 38 FE            [ 1] 1950 	cp a,#TK_INTGR
      009EE8 13 01            [ 1] 1951 	jreq 3$ 
      009EEA 2A 11            [ 1] 1952 	cp a,#TK_MINUS
      009EEC 1E 05 E6         [ 4] 1953 	call get_token 
      009EEF 02 C7            [ 1] 1954 	cp a,#TK_INTGR 
      009EF1 00 0F            [ 1] 1955 	jreq 22$
      009EF3 72 5F 00         [ 4] 1956 	call rest_context 
      009EF6 0E 72 BB         [ 2] 1957 	jp syntax_error
      002018                       1958 22$:
      009EF9 00 0E 20         [ 4] 1959 	call neg_acc24	
      00201B                       1960 3$: 
      009EFC E3 00 0C         [ 1] 1961 	ld a,acc24 
      009EFD CE 00 0D         [ 2] 1962 	ldw x,acc16 
      009EFD 1E 05 E6 02      [ 4] 1963 	ld [ptr16],a
      009F01 CD 9F 74 1E      [ 1] 1964 	inc ptr8  
      009F05 05 E6 02 C7      [ 5] 1965 	ldw [ptr16],x 
      009F09 00 0F 72         [ 4] 1966 	call rest_context
      009F0C 5F 00 0E         [ 4] 1967 	call next_token 
      009F0F 72 BB            [ 1] 1968 	cp a,#TK_COMMA
      009F11 00 0E            [ 1] 1969 	jrne 4$ 
      009F13 C3 00 1D         [ 2] 1970 	jp input_loop
      00203A                       1971 4$:
      009F16 2A 07            [ 1] 1972 	cp a,#TK_NONE 
      009F18 1F 05            [ 1] 1973 	jreq input_exit  
      009F1A FE 13            [ 1] 1974 	cp a,#TK_COLON 
      009F1C 03 2F            [ 1] 1975     jreq input_exit 
      009F1E DE 16 45         [ 2] 1976 	jp syntax_error 
      009F1F                       1977 input_exit:
      002045                       1978 	_drop VSIZE 
      009F1F 55 00            [ 2]    1     addw sp,#VSIZE 
      009F21 04 00            [ 2] 1979 	popw y 
      009F23 02               [ 4] 1980 	ret 
                                   1981 
                                   1982 
                                   1983 ;---------------------
                                   1984 ; BASIC: REM | ' 
                                   1985 ; skip comment to end of line 
                                   1986 ;---------------------- 
      00204A                       1987 remark::
      009F24 AE 16 B8 CF 00   [ 1] 1988 	mov in,count 
      009F29 05               [ 4] 1989  	ret 
                                   1990 
                                   1991 
                                   1992 ;---------------------
                                   1993 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   1994 ; read in loop 'addr'  
                                   1995 ; apply & 'mask' to value 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



                                   1996 ; loop while result==0.  
                                   1997 ; 'xor_mask' is used to 
                                   1998 ; invert the wait logic.
                                   1999 ; i.e. loop while not 0.
                                   2000 ;---------------------
                           000001  2001 	XMASK=1 
                           000002  2002 	MASK=2
                           000003  2003 	ADDR=3
                           000004  2004 	VSIZE=4
      002050                       2005 wait: 
      002050                       2006 	_vars VSIZE
      009F2A 5B 06            [ 2]    1     sub sp,#VSIZE 
      009F2C CD 9E            [ 1] 2007 	clr (XMASK,sp) 
      009F2E 02 81 05         [ 4] 2008 	call arg_list 
      009F30 A1 02            [ 1] 2009 	cp a,#2
      009F30 CD A7            [ 1] 2010 	jruge 0$
      009F32 33 27 07         [ 2] 2011 	jp syntax_error 
      009F35 AE 9F            [ 1] 2012 0$:	cp a,#3
      009F37 5D CD            [ 1] 2013 	jrult 1$
      002062                       2014 	_xpop  ; xor mask 
      009F39 89 DA            [ 1]    1     ld a,(y)
      009F3B 81               [ 1]    2     ldw x,y 
      009F3C EE 01            [ 2]    3     ldw x,(1,x)
      009F3C 90 AE B6 00      [ 2]    4     addw y,#CELL_SIZE 
      009F40 CE               [ 1] 2015 	ld a,xl 
      009F41 B6 02            [ 1] 2016 	ld (XMASK,sp),a 
      00206E                       2017 1$: _xpop ; mask
      009F43 1C 00            [ 1]    1     ld a,(y)
      009F45 04               [ 1]    2     ldw x,y 
      009F46 CF 00            [ 2]    3     ldw x,(1,x)
      009F48 0E AE 00 7C      [ 2]    4     addw y,#CELL_SIZE 
      009F4C CD               [ 1] 2018     ld a,xl  
      009F4D 94 35            [ 1] 2019 	ld (MASK,sp),a 
      00207A                       2020 	_xpop ; address 
      009F4F AE 00            [ 1]    1     ld a,(y)
      009F51 80               [ 1]    2     ldw x,y 
      009F52 CF 00            [ 2]    3     ldw x,(1,x)
      009F54 1B 72 BB 00      [ 2]    4     addw y,#CELL_SIZE 
      009F58 7E               [ 1] 2021 2$:	ld a,(x)
      009F59 CF 00            [ 1] 2022 	and a,(MASK,sp)
      009F5B 1D 81            [ 1] 2023 	xor a,(XMASK,sp)
      009F5D 4E 6F            [ 1] 2024 	jreq 2$ 
      00208A                       2025 	_drop VSIZE 
      009F5F 20 61            [ 2]    1     addw sp,#VSIZE 
      009F61 70               [ 4] 2026 	ret 
                                   2027 
                                   2028 ;---------------------
                                   2029 ; BASIC: BSET addr,mask
                                   2030 ; set bits at 'addr' corresponding 
                                   2031 ; to those of 'mask' that are at 1.
                                   2032 ; arguments:
                                   2033 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2034 ;   mask        mask|addr
                                   2035 ; output:
                                   2036 ;	none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



                                   2037 ;--------------------------
      00208D                       2038 bit_set:
      009F62 70 6C 69         [ 4] 2039 	call arg_list 
      009F65 63 61            [ 1] 2040 	cp a,#2	 
      009F67 74 69            [ 1] 2041 	jreq 1$ 
      009F69 6F 6E 20         [ 2] 2042 	jp syntax_error
      002097                       2043 1$: 
      002097                       2044 	_xpop ; mask 
      009F6C 73 61            [ 1]    1     ld a,(y)
      009F6E 76               [ 1]    2     ldw x,y 
      009F6F 65 64            [ 2]    3     ldw x,(1,x)
      009F71 2E 0A 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009F74 9F               [ 1] 2045 	ld a,xl
      009F74 90               [ 1] 2046 	push a  
      0020A2                       2047 	_xpop ; addr  
      009F75 89 C7            [ 1]    1     ld a,(y)
      009F77 00               [ 1]    2     ldw x,y 
      009F78 04 E6            [ 2]    3     ldw x,(1,x)
      009F7A 02 C1 00 04      [ 2]    4     addw y,#CELL_SIZE 
      009F7E 2A               [ 1] 2048 	pop a 
      009F7F 03               [ 1] 2049 	or a,(x)
      009F80 C7               [ 1] 2050 	ld (x),a
      009F81 00               [ 4] 2051 	ret 
                                   2052 
                                   2053 ;---------------------
                                   2054 ; BASIC: BRES addr,mask
                                   2055 ; reset bits at 'addr' corresponding 
                                   2056 ; to those of 'mask' that are at 1.
                                   2057 ; arguments:
                                   2058 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2059 ;   mask	    ~mask&*addr  
                                   2060 ; output:
                                   2061 ;	none 
                                   2062 ;--------------------------
      0020AF                       2063 bit_reset:
      009F82 04 CF 00         [ 4] 2064 	call arg_list 
      009F85 05 90            [ 1] 2065 	cp a,#2  
      009F87 AE 16            [ 1] 2066 	jreq 1$ 
      009F89 68 CD 92         [ 2] 2067 	jp syntax_error
      0020B9                       2068 1$: 
      0020B9                       2069 	_xpop ; mask 
      009F8C 30 CD            [ 1]    1     ld a,(y)
      009F8E 89               [ 1]    2     ldw x,y 
      009F8F DA A6            [ 2]    3     ldw x,(1,x)
      009F91 0D CD 89 7D      [ 2]    4     addw y,#CELL_SIZE 
      009F95 90               [ 1] 2070 	ld a,xl 
      009F96 85               [ 1] 2071 	cpl a
      009F97 81               [ 1] 2072 	push a  
      009F98                       2073 	_xpop ; addr  
      009F98 52 01            [ 1]    1     ld a,(y)
      009F9A 93               [ 1]    2     ldw x,y 
      009F9A 0F 01            [ 2]    3     ldw x,(1,x)
      009F9C 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009F9C CD               [ 1] 2074 	pop a 
      009F9D 97               [ 1] 2075 	and a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      009F9E CB               [ 1] 2076 	ld (x),a 
      009F9F A1               [ 4] 2077 	ret 
                                   2078 
                                   2079 ;---------------------
                                   2080 ; BASIC: BTOGL addr,mask
                                   2081 ; toggle bits at 'addr' corresponding 
                                   2082 ; to those of 'mask' that are at 1.
                                   2083 ; arguments:
                                   2084 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2085 ;   mask	    mask^*addr  
                                   2086 ; output:
                                   2087 ;	none 
                                   2088 ;--------------------------
      0020D2                       2089 bit_toggle:
      009FA0 02 25 5E         [ 4] 2090 	call arg_list 
      009FA3 A1 02            [ 1] 2091 	cp a,#2 
      009FA5 27 12            [ 1] 2092 	jreq 1$ 
      009FA7 A1 04 27         [ 2] 2093 	jp syntax_error
      0020DC                       2094 1$: _xpop ; mask 
      009FAA 1B A1            [ 1]    1     ld a,(y)
      009FAC 82               [ 1]    2     ldw x,y 
      009FAD 27 1F            [ 2]    3     ldw x,(1,x)
      009FAF A1 08 27 24      [ 2]    4     addw y,#CELL_SIZE 
      009FB3 A1               [ 1] 2095 	ld a,xl
      009FB4 09               [ 1] 2096 	push a 
      0020E7                       2097 	_xpop  ; addr  
      009FB5 27 24            [ 1]    1     ld a,(y)
      009FB7 20               [ 1]    2     ldw x,y 
      009FB8 37 01            [ 2]    3     ldw x,(1,x)
      009FB9 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009FB9 CD               [ 1] 2098 	pop a 
      009FBA 89               [ 1] 2099 	xor a,(x)
      009FBB DA               [ 1] 2100 	ld (x),a 
      009FBC 5C               [ 4] 2101 	ret 
                                   2102 
                                   2103 
                                   2104 ;---------------------
                                   2105 ; BASIC: BTEST(addr,bit)
                                   2106 ; return bit value at 'addr' 
                                   2107 ; bit is in range {0..7}.
                                   2108 ; arguments:
                                   2109 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2110 ;   bit 	    bit position {0..7}  
                                   2111 ; output:
                                   2112 ;	A:X       bit value  
                                   2113 ;--------------------------
      0020F4                       2114 bit_test:
      009FBD 72 B0 00         [ 4] 2115 	call func_args 
      009FC0 05 CF            [ 1] 2116 	cp a,#2
      009FC2 00 01            [ 1] 2117 	jreq 0$
      009FC4 20 D4 45         [ 2] 2118 	jp syntax_error
      009FC6                       2119 0$:	
      0020FE                       2120 	_xpop 
      009FC6 CD 98            [ 1]    1     ld a,(y)
      009FC8 1B               [ 1]    2     ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      009FC9 CD 89            [ 2]    3     ldw x,(1,x)
      009FCB 7D 20 CC 03      [ 2]    4     addw y,#CELL_SIZE 
      009FCE 9F               [ 1] 2121 	ld a,xl 
      009FCE CD 97            [ 1] 2122 	and a,#7
      009FD0 E5               [ 1] 2123 	push a   
      009FD1 FD CD            [ 1] 2124 	ld a,#1 
      009FD3 89 7D            [ 1] 2125 1$: tnz (1,sp)
      009FD5 20 C3            [ 1] 2126 	jreq 2$
      009FD7 48               [ 1] 2127 	sll a 
      009FD7 03 01            [ 1] 2128 	dec (1,sp)
      009FD9 20 C1            [ 2] 2129 	jra 1$
      009FDB 6B 01            [ 1] 2130 2$: ld (1,sp),a  
      002118                       2131 	_xpop ; address  
      009FDB CD 97            [ 1]    1     ld a,(y)
      009FDD CB               [ 1]    2     ldw x,y 
      009FDE A1 84            [ 2]    3     ldw x,(1,x)
      009FE0 27 03 CC 96      [ 2]    4     addw y,#CELL_SIZE 
      009FE4 C5               [ 1] 2132 	pop a 
      009FE5 F4               [ 1] 2133 	and a,(x)
      009FE5 CD 98            [ 1] 2134 	jreq 3$
      009FE7 0B 9F            [ 1] 2135 	ld a,#1 
      009FE9 A4               [ 1] 2136 3$:	clrw x 
      009FEA 0F               [ 1] 2137 	ld xl,a
      009FEB C7               [ 1] 2138 	clr a  
      009FEC 00               [ 4] 2139 	ret
                                   2140 
                                   2141 ;--------------------
                                   2142 ; BASIC: POKE addr,byte
                                   2143 ; put a byte at addr 
                                   2144 ;--------------------
      00212B                       2145 poke:
      009FED 23 20 AA         [ 4] 2146 	call arg_list 
      009FF0 A1 02            [ 1] 2147 	cp a,#2
      009FF0 55 00            [ 1] 2148 	jreq 1$
      009FF2 03 00 02         [ 2] 2149 	jp syntax_error
      002135                       2150 1$:	
      002135                       2151 	_xpop ; byte   
      009FF5 CD 9A            [ 1]    1     ld a,(y)
      009FF7 B7               [ 1]    2     ldw x,y 
      009FF8 A1 84            [ 2]    3     ldw x,(1,x)
      009FFA 26 05 CD 98      [ 2]    4     addw y,#CELL_SIZE 
      009FFE 3F               [ 1] 2152     ld a,xl 
      009FFF 20               [ 1] 2153 	push a 
      002140                       2154 	_xpop ; address 
      00A000 99 F6            [ 1]    1     ld a,(y)
      00A001 93               [ 1]    2     ldw x,y 
      00A001 0D 01            [ 2]    3     ldw x,(1,x)
      00A003 26 05 A6 0D      [ 2]    4     addw y,#CELL_SIZE 
      00A007 CD               [ 1] 2155 	pop a 
      00A008 89               [ 1] 2156 	ld (x),a 
      00A009 7D               [ 4] 2157 	ret 
                                   2158 
                                   2159 ;-----------------------
                                   2160 ; BASIC: PEEK(addr)
                                   2161 ; get the byte at addr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



                                   2162 ; input:
                                   2163 ;	none 
                                   2164 ; output:
                                   2165 ;	X 		value 
                                   2166 ;-----------------------
      00214C                       2167 peek:
      00A00A 5B 01 81         [ 4] 2168 	call func_args
      00A00D A1 01            [ 1] 2169 	cp a,#1 
      00A00D CE 00            [ 1] 2170 	jreq 1$
      00A00F 05 1F 03         [ 2] 2171 	jp syntax_error
      002156                       2172 1$: _xpop ; address  
      00A012 C6 00            [ 1]    1     ld a,(y)
      00A014 02               [ 1]    2     ldw x,y 
      00A015 6B 05            [ 2]    3     ldw x,(1,x)
      00A017 C6 00 04 6B      [ 2]    4     addw y,#CELL_SIZE 
      00A01B 06               [ 1] 2173 	ld a,(x)
      00A01C 81               [ 1] 2174 	clrw x 
      00A01D 97               [ 1] 2175 	ld xl,a 
      00A01D 1E               [ 1] 2176 	clr a 
      00A01E 03               [ 4] 2177 	ret 
                                   2178 
                                   2179 ;---------------------------
                                   2180 ; BASIC IF expr : instructions
                                   2181 ; evaluate expr and if true 
                                   2182 ; execute instructions on same line. 
                                   2183 ;----------------------------
      002164                       2184 if: 
      00A01F CF 00 05         [ 4] 2185 	call relation 
      00A022 7B 05            [ 1] 2186 	cp a,#TK_INTGR
      00A024 C7 00            [ 1] 2187 	jreq 1$ 
      00A026 02 7B 06         [ 2] 2188 	jp syntax_error
      00216E                       2189 1$:	_xpop 
      00A029 C7 00            [ 1]    1     ld a,(y)
      00A02B 04               [ 1]    2     ldw x,y 
      00A02C 81 01            [ 2]    3     ldw x,(1,x)
      00A02D 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A02D 90               [ 2] 2190 	tnzw x 
      00A02E 89 52            [ 1] 2191 	jrne 9$ 
                                   2192 ;skip to next line
      00A030 05 00 03 00 01   [ 1] 2193 	mov in,count
      00A031 81               [ 4] 2194 9$:	ret 
                                   2195 
                                   2196 ;------------------------
                                   2197 ; BASIC: FOR var=expr 
                                   2198 ; set variable to expression 
                                   2199 ; leave variable address 
                                   2200 ; on stack and set
                                   2201 ; FLOOP bit in 'flags'
                                   2202 ;-----------------
                           000001  2203 	RETL1=1 ; return address  
                           000003  2204 	FSTEP=3  ; variable increment, int16
                           000005  2205 	LIMIT=5 ; loop limit, int24  
                           000008  2206 	CVAR=8   ; control variable 
                           00000A  2207 	INW=10   ;  in.w saved
                           00000C  2208 	BPTR=12 ; baseptr saved
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



                           00000C  2209 	VSIZE=12  
      002180                       2210 for: ; { -- var_addr }
      00A031 0F               [ 2] 2211 	popw x ; call return address 
      002181                       2212 	_vars VSIZE 
      00A032 05 CD            [ 2]    1     sub sp,#VSIZE 
      00A034 97               [ 2] 2213 	pushw x  ; RETL1 
      00A035 CB A1            [ 1] 2214 	ld a,#TK_VAR 
      00A037 02 26 10         [ 4] 2215 	call expect
      00A03A CD 89 DA         [ 4] 2216 	call get_addr
      00A03D 5C 72            [ 2] 2217 	ldw (CVAR,sp),x  ; control variable 
      00A03F B0 00 05         [ 4] 2218 	call let_eval 
      00A042 CF 00 01 03      [ 1] 2219 	bset flags,#FLOOP 
      00A046 05 CD 97         [ 4] 2220 	call next_token 
      00A049 CB A1            [ 1] 2221 	cp a,#TK_CMD 
      00A04B 85 27            [ 1] 2222 	jreq 1$
      00A04D 03 CC 96         [ 2] 2223 	jp syntax_error
      00219F                       2224 1$:  
      00A050 C5 CD 98         [ 4] 2225 	call get_code_addr
      00A053 01 CF 00         [ 2] 2226 	cpw x,#to   
      00A056 19 0D            [ 1] 2227 	jreq to
      00A058 05 26 06         [ 2] 2228 	jp syntax_error 
                                   2229 
                                   2230 ;-----------------------------------
                                   2231 ; BASIC: TO expr 
                                   2232 ; second part of FOR loop initilization
                                   2233 ; leave limit on stack and set 
                                   2234 ; FTO bit in 'flags'
                                   2235 ;-----------------------------------
      0021AA                       2236 to: ; { var_addr -- var_addr limit step }
      00A05B CD 92 05 CD 89   [ 2] 2237 	btjt flags,#FLOOP,1$
      00A060 7D 16 45         [ 2] 2238 	jp syntax_error
      00A061 CD 1A 37         [ 4] 2239 1$: call expression   
      00A061 A6 3A            [ 1] 2240 	cp a,#TK_INTGR 
      00A063 CD 89            [ 1] 2241 	jreq 2$ 
      00A065 7D CD A0         [ 2] 2242 	jp syntax_error
      0021BC                       2243 2$: _xpop
      00A068 0D 72            [ 1]    1     ld a,(y)
      00A06A 5F               [ 1]    2     ldw x,y 
      00A06B 00 04            [ 2]    3     ldw x,(1,x)
      00A06D CD 8A DF AE      [ 2]    4     addw y,#CELL_SIZE 
      00A071 16 68            [ 1] 2244 	ld (LIMIT,sp),a 
      00A073 3B 00            [ 2] 2245 	ldw (LIMIT+1,sp),x
      00A075 04 4B 00         [ 4] 2246 	call next_token
      00A078 72 FB            [ 1] 2247 	cp a,#TK_NONE  
      00A07A 01 5C            [ 1] 2248 	jreq 4$ 
      00A07C 5B 02            [ 1] 2249 	cp a,#TK_CMD
      00A07E 72 5F            [ 1] 2250 	jrne 3$
      00A080 00 02 CD         [ 4] 2251 	call get_code_addr
      00A083 8F 47 A1         [ 2] 2252 	cpw x,#step 
      00A086 84 27            [ 1] 2253 	jreq step
      0021DC                       2254 3$:	
      0021DC                       2255 	_unget_token   	 
      00A088 12 A1 11 CD 8F   [ 1]    1      mov in,in.saved  
      0021E1                       2256 4$:	
      00A08D 47 A1 84         [ 2] 2257 	ldw x,#1   ; default step  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      00A090 27 06            [ 2] 2258 	ldw (FSTEP,sp),x 
      00A092 CD A0            [ 2] 2259 	jra store_loop_addr 
                                   2260 
                                   2261 
                                   2262 ;----------------------------------
                                   2263 ; BASIC: STEP expr 
                                   2264 ; optional third par of FOR loop
                                   2265 ; initialization. 	
                                   2266 ;------------------------------------
      0021E8                       2267 step: ; {var limit -- var limit step}
      00A094 1D CC 96 C5 03   [ 2] 2268 	btjt flags,#FLOOP,1$
      00A098 CC 16 45         [ 2] 2269 	jp syntax_error
      00A098 CD 82 51         [ 4] 2270 1$: call expression 
      00A09B A1 84            [ 1] 2271 	cp a,#TK_INTGR
      00A09B C6 00            [ 1] 2272 	jreq 2$
      00A09D 0D CE 00         [ 2] 2273 	jp syntax_error
      0021FA                       2274 2$:	
      0021FA                       2275 	_xpop 
      00A0A0 0E 72            [ 1]    1     ld a,(y)
      00A0A2 C7               [ 1]    2     ldw x,y 
      00A0A3 00 19            [ 2]    3     ldw x,(1,x)
      00A0A5 72 5C 00 1A      [ 2]    4     addw y,#CELL_SIZE 
      00A0A9 72 CF            [ 2] 2276 	ldw (FSTEP,sp),x ; step
                                   2277 ; leave loop back entry point on cstack 
                                   2278 ; cstack is 1 call deep from interpreter
      002205                       2279 store_loop_addr:
      00A0AB 00 19 CD         [ 2] 2280 	ldw x,basicptr
      00A0AE A0 1D CD         [ 1] 2281 	ld a,in 
      00A0B1 97 CB A1         [ 1] 2282 	cp a,count 
      00A0B4 08 26            [ 1] 2283 	jrmi 3$
      00A0B6 03 CC A0 31      [ 2] 2284 	addw x,in.w 
      00A0BA 1F 0C            [ 2] 2285 	ldw (BPTR,sp),x 
      00A0BA A1 00 27         [ 2] 2286 	ldw x,#3 
      00A0BD 07 A1            [ 2] 2287 	ldw (INW,sp),x 
      00A0BF 0A               [ 4] 2288 	ret 
      00A0C0 27 03            [ 2] 2289 3$:	ldw (BPTR,sp),x 
      00A0C2 CC 96 C5         [ 2] 2290 	ldw x,in.w 
      00A0C5 1F 0A            [ 2] 2291 	ldw (INW,sp),x   
      00A0C5 5B 05 90 85      [ 1] 2292 	bres flags,#FLOOP 
      00A0C9 81 5C 00 1E      [ 1] 2293 	inc loop_depth  
      00A0CA 81               [ 4] 2294 	ret 
                                   2295 
                                   2296 ;--------------------------------
                                   2297 ; BASIC: NEXT var 
                                   2298 ; FOR loop control 
                                   2299 ; increment variable with step 
                                   2300 ; and compare with limit 
                                   2301 ; loop if threshold not crossed.
                                   2302 ; else stack. 
                                   2303 ; and decrement 'loop_depth' 
                                   2304 ;--------------------------------
      00222C                       2305 next: ; {var limit step retl1 -- [var limit step ] }
      00A0CA 55 00 04 00      [ 1] 2306 	tnz loop_depth 
      00A0CE 02 81            [ 1] 2307 	jrne 1$ 
      00A0D0 CC 16 45         [ 2] 2308 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      002235                       2309 1$: 
      00A0D0 52 04            [ 1] 2310 	ld a,#TK_VAR 
      00A0D2 0F 01 CD         [ 4] 2311 	call expect
      00A0D5 99 85 A1         [ 4] 2312 	call get_addr 
                                   2313 ; check for good variable after NEXT 	 
      00A0D8 02 24            [ 2] 2314 	cpw x,(CVAR,sp)
      00A0DA 03 CC            [ 1] 2315 	jreq 2$  
      00A0DC 96 C5 A1         [ 2] 2316 	jp syntax_error ; not the good one 
      002244                       2317 2$: 
      00A0DF 03 25 0C         [ 2] 2318 	ldw ptr16,x 
                                   2319 	; increment variable 
      00A0E2 90               [ 1] 2320 	ld a,(x)
      00A0E3 F6 93            [ 2] 2321 	ldw x,(1,x)  ; get var value 
      00A0E5 EE 01 72         [ 2] 2322 	addw x,(FSTEP,sp) ; var+step 
      00A0E8 A9 00            [ 1] 2323 	adc a,#0  
      00A0EA 03 9F 6B 01      [ 4] 2324 	ld [ptr16],a
      00A0EE 90 F6 93 EE      [ 1] 2325 	inc ptr8  
      00A0F2 01 72 A9 00      [ 5] 2326 	ldw [ptr16],x 
      00A0F6 03 9F 6B         [ 1] 2327 	ld acc24,a 
      00A0F9 02 90 F6         [ 2] 2328 	ldw acc16,x 
      00A0FC 93 EE            [ 1] 2329 	ld a,(LIMIT,sp)
      00A0FE 01 72            [ 2] 2330 	ldw x,(LIMIT+1,sp)
      00A100 A9 00 03 F6      [ 2] 2331 	subw x,acc16 
      00A104 14 02 18         [ 1] 2332 	sbc a,acc24
      00A107 01               [ 1] 2333 	push cc  
                                   2334 ; check sign of STEP  
      00A108 27 F9            [ 1] 2335 	ld a,#0x80
      00A10A 5B 04            [ 1] 2336 	bcp a,(FSTEP,sp)
      00A10C 81 05            [ 1] 2337 	jrpl 4$
                                   2338 ;negative step
      00A10D 86               [ 1] 2339 	pop cc 
      00A10D CD 99            [ 1] 2340 	jrslt loop_done
      00A10F 85 A1            [ 2] 2341 	jra loop_back 
      002278                       2342 4$: ; positive step
      00A111 02               [ 1] 2343 	pop cc 
      00A112 27 03            [ 1] 2344 	jrsgt loop_done
      00227B                       2345 loop_back:
      00A114 CC 96            [ 2] 2346 	ldw x,(BPTR,sp)
      00A116 C5 00 04         [ 2] 2347 	ldw basicptr,x 
      00A117 72 01 00 21 05   [ 2] 2348 	btjf flags,#FRUN,1$ 
      00A117 90 F6            [ 1] 2349 	ld a,(2,x)
      00A119 93 EE 01         [ 1] 2350 	ld count,a
      00A11C 72 A9            [ 2] 2351 1$:	ldw x,(INW,sp)
      00A11E 00 03 9F         [ 2] 2352 	ldw in.w,x 
      00A121 88               [ 4] 2353 	ret 
      002290                       2354 loop_done:
                                   2355 	; remove loop data from stack  
      00A122 90               [ 2] 2356 	popw x
      002291                       2357 	_drop VSIZE 
      00A123 F6 93            [ 2]    1     addw sp,#VSIZE 
      00A125 EE 01 72 A9      [ 1] 2358 	dec loop_depth 
      00A129 00               [ 2] 2359 	jp (x)
                                   2360 
                                   2361 ;----------------------------
                                   2362 ; called by goto/gosub
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



                                   2363 ; to get target line number 
                                   2364 ; output:
                                   2365 ;    x    line address 
                                   2366 ;---------------------------
      002298                       2367 get_target_line:
      00A12A 03 84 FA         [ 4] 2368 	call next_token  
      00A12D F7 81            [ 1] 2369 	cp a,#TK_INTGR
      00A12F 27 07            [ 1] 2370 	jreq get_target_line_addr 
      00A12F CD 99            [ 1] 2371 	cp a,#TK_LABEL 
      00A131 85 A1            [ 1] 2372 	jreq look_target_symbol 
      00A133 02 27 03         [ 2] 2373 	jp syntax_error
                                   2374 ; the target is a line number 
                                   2375 ; search it. 
      0022A6                       2376 get_target_line_addr:
      00A136 CC 96            [ 2] 2377 	pushw y 
      00A138 C5 17 8B         [ 4] 2378 	call get_int24 ; line # 
      00A139 4F               [ 1] 2379 	clr a
      00A139 90 F6 93 EE      [ 2] 2380 	ldw y,basicptr 
      00A13D 01 72            [ 2] 2381 	ldw y,(y)
      00A13F A9 00            [ 2] 2382 	pushw y 
      00A141 03 9F            [ 2] 2383 	cpw x,(1,sp)
      0022B6                       2384 	_drop 2  
      00A143 43 88            [ 2]    1     addw sp,#2 
      00A145 90 F6            [ 1] 2385 	jrult 11$
      00A147 93               [ 1] 2386 	inc a 
      0022BB                       2387 11$: ; scan program for this line# 	
      00A148 EE 01 72         [ 4] 2388 	call search_lineno  
      00A14B A9               [ 2] 2389 	tnzw x ; 0| line# address 
      00A14C 00 03            [ 1] 2390 	jrne 2$ 
      00A14E 84 F4            [ 1] 2391 	ld a,#ERR_NO_LINE 
      00A150 F7 81 47         [ 2] 2392 	jp tb_error 
      00A152 90 85            [ 2] 2393 2$:	popw y  
      00A152 CD               [ 4] 2394 	ret 
                                   2395 
                                   2396 ; the GOTO|GOSUB target is a symbol.
      0022C9                       2397 look_target_symbol:
      00A153 99 85            [ 2] 2398 	pushw y 
      00A155 A1               [ 2] 2399 	pushw x 
      00A156 02 27 03 CC      [ 1] 2400 	clr acc16 
      00A15A 96 C5 90 F6      [ 2] 2401 	ldw y,txtbgn 
      00A15E 93 EE 01         [ 1] 2402 1$:	ld a,(3,y) ; first TK_ID on line 
      00A161 72 A9            [ 1] 2403 	cp a,#TK_LABEL 
      00A163 00 03            [ 1] 2404 	jreq 3$ 
      00A165 9F 88 90         [ 1] 2405 2$:	ld a,(2,y); line length 
      00A168 F6 93 EE         [ 1] 2406 	ld acc8,a 
      00A16B 01 72 A9 00      [ 2] 2407 	addw y,acc16 ;point to next line 
      00A16F 03 84 F8 F7      [ 2] 2408 	cpw y,txtend 
      00A173 81 E9            [ 1] 2409 	jrult 1$
      00A174 A6 0A            [ 1] 2410 	ld a,#ERR_BAD_VALUE
      00A174 CD 99 80         [ 2] 2411 	jp tb_error 
      0022F0                       2412 3$: ; found a TK_LABEL 
                                   2413 	; compare with GOTO|GOSUB target 
      00A177 A1 02            [ 2] 2414 	pushw y ; line address 
      00A179 27 03 CC 96      [ 2] 2415 	addw y,#4 ; label string 
      00A17D C5 03            [ 2] 2416 	ldw x,(3,sp) ; target string 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      00A17E CD 13 94         [ 4] 2417 	call strcmp
      00A17E 90 F6            [ 1] 2418 	jrne 4$
      00A180 93 EE            [ 2] 2419 	popw y 
      00A182 01 72            [ 2] 2420 	jra 2$ 
      002301                       2421 4$: ; target found 
      00A184 A9               [ 2] 2422 	popw x ;  address line target  
      002302                       2423 	_drop 2 ; target string 
      00A185 00 03            [ 2]    1     addw sp,#2 
      00A187 9F A4            [ 2] 2424 	popw y 
      00A189 07               [ 4] 2425 	ret
                                   2426 
                                   2427 
                                   2428 ;--------------------------------
                                   2429 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2430 ; selective goto or gosub 
                                   2431 ;--------------------------------
      002307                       2432 cmd_on:
      00A18A 88 A6 01 0D 01   [ 2] 2433 	btjt flags,#FRUN,0$ 
      00A18F 27 05            [ 1] 2434 	ld a,#ERR_RUN_ONLY
      00A191 48 0A 01         [ 2] 2435 	jp tb_error 
      00A194 20 F7 6B         [ 4] 2436 0$:	call expression 
      00A197 01 90            [ 1] 2437 	cp a,#TK_INTGR
      00A199 F6 93            [ 1] 2438 	jreq 1$
      00A19B EE 01 72         [ 2] 2439 	jp syntax_error
      00231B                       2440 1$: _xpop
      00A19E A9 00            [ 1]    1     ld a,(y)
      00A1A0 03               [ 1]    2     ldw x,y 
      00A1A1 84 F4            [ 2]    3     ldw x,(1,x)
      00A1A3 27 02 A6 01      [ 2]    4     addw y,#CELL_SIZE 
                                   2441 ; the selector is the element indice 
                                   2442 ; in the list of arguments. {1..#elements} 
      00A1A7 5F               [ 1] 2443 	ld a,xl ; keep only bits 7..0
      00A1A8 97 4F            [ 1] 2444 	jreq 9$ ; element # begin at 1. 
      00A1AA 81               [ 1] 2445 	push a  ; selector  
      00A1AB CD 17 4B         [ 4] 2446 	call next_token
      00A1AB CD 99            [ 1] 2447 	cp a,#TK_CMD 
      00A1AD 85 A1            [ 1] 2448 	jreq 2$ 
      00A1AF 02 27 03         [ 2] 2449 	jp syntax_error 
      00A1B2 CC 96 C5         [ 4] 2450 2$: call get_code_addr
                                   2451 ;; must be a GOTO or GOSUB 
      00A1B5 A3 23 8F         [ 2] 2452 	cpw x,#goto 
      00A1B5 90 F6            [ 1] 2453 	jreq 4$
      00A1B7 93 EE 01         [ 2] 2454 	cpw x,#gosub 
      00A1BA 72 A9            [ 1] 2455 	jreq 4$ 
      00A1BC 00 03 9F         [ 2] 2456 	jp syntax_error 
      002342                       2457 4$: 
      00A1BF 88               [ 1] 2458 	pop a 
      00A1C0 90               [ 2] 2459 	pushw x ; save routine address 	
      00A1C1 F6               [ 1] 2460 	push a  ; selector  
      002345                       2461 5$: ; skip elements in list until selector==0 
      00A1C2 93 EE            [ 1] 2462 	dec (1,sp)
      00A1C4 01 72            [ 1] 2463 	jreq 6$ 
                                   2464 ; can be a line# or a label 
      00A1C6 A9 00 03         [ 4] 2465 	call next_token 
      00A1C9 84 F7            [ 1] 2466 	cp a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      00A1CB 81 07            [ 1] 2467 	jreq 52$
      00A1CC A1 03            [ 1] 2468 	cp a,#TK_LABEL 
      00A1CC CD 99            [ 1] 2469 	jreq 54$
      00A1CE 80 A1 01         [ 2] 2470 	jp syntax_error 
      002357                       2471 52$: ; got a line number 
      00A1D1 27 03 CC         [ 1] 2472 	ld a,in ; skip over int24 value 
      00A1D4 96 C5            [ 1] 2473 	add a,#CELL_SIZE ; integer size  
      00A1D6 90 F6 93         [ 1] 2474 	ld in,a 
      00A1D9 EE 01            [ 2] 2475 	jra 56$
      00A1DB 72 A9 00         [ 4] 2476 54$: call skip_string ; skip over label 	
      002364                       2477 56$: ; if another element comma present 
      00A1DE 03 F6 5F         [ 4] 2478 	call next_token
      00A1E1 97 4F            [ 1] 2479 	cp a,#TK_COMMA 
      00A1E3 81 DA            [ 1] 2480 	jreq 5$ 
                                   2481 ; arg list exhausted, selector to big 
                                   2482 ; continue execution on next line 
      00A1E4                       2483 	_drop 3 ; drop selector and GOTO|GOSUB address 
      00A1E4 CD 9A            [ 2]    1     addw sp,#3 
      00A1E6 F8 A1            [ 2] 2484 	jra 9$
      00236F                       2485 6$: ;at selected position  
      00236F                       2486 	_drop 1 ; discard selector
      00A1E8 84 27            [ 2]    1     addw sp,#1 
                                   2487 ; here only the routine address 
                                   2488 ; of GOTO|GOSUB is on stack 
      00A1EA 03 CC 96         [ 4] 2489     call get_target_line
      00A1ED C5 90 F6         [ 2] 2490 	ldw ptr16,x 	
      00A1F0 93 EE 01 72 A9   [ 1] 2491 	mov in,count ; move to end of line  
      00A1F5 00               [ 2] 2492 	popw x ; cmd address, GOTO||GOSUB 
      00A1F6 03 5D 26         [ 2] 2493 	cpw x,#goto 
      00A1F9 05 55            [ 1] 2494 	jrne 7$ 
      00A1FB 00 04 00         [ 2] 2495 	ldw x,ptr16 
      00A1FE 02 81            [ 2] 2496 	jra jp_to_target
      00A200                       2497 7$: 
      00A200 85 52            [ 2] 2498 	jra gosub_2 ; target in ptr16 
      002389                       2499 9$: ; expr out of range skip to end of line
                                   2500     ; this will force a fall to next line  
      00A202 0C 89 A6 85 CD   [ 1] 2501 	mov in,count
      00A207 99               [ 4] 2502 	ret 
                                   2503 
                                   2504 
                                   2505 ;------------------------
                                   2506 ; BASIC: GOTO line# 
                                   2507 ; jump to line# 
                                   2508 ; here cstack is 2 call deep from interpreter 
                                   2509 ;------------------------
      00238F                       2510 goto:
      00A208 73 CD 98 01 1F   [ 2] 2511 	btjt flags,#FRUN,goto_1  
      00A20D 08 CD            [ 1] 2512 	ld a,#ERR_RUN_ONLY
      00A20F 9C 43 72         [ 2] 2513 	jp tb_error 
      002399                       2514 goto_1:
      00A212 14 00 22         [ 4] 2515 	call get_target_line
      00239C                       2516 jp_to_target:
      00A215 CD 97 CB         [ 2] 2517 	ldw basicptr,x 
      00A218 A1 80            [ 1] 2518 	ld a,(2,x)
      00A21A 27 03 CC         [ 1] 2519 	ld count,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      00A21D 96 C5 00 01      [ 1] 2520 	mov in,#3 
      00A21F 81               [ 4] 2521 	ret 
                                   2522 
                                   2523 
                                   2524 ;--------------------
                                   2525 ; BASIC: GOSUB line#
                                   2526 ; basic subroutine call
                                   2527 ; actual line# and basicptr 
                                   2528 ; are saved on cstack
                                   2529 ; here cstack is 2 call deep from interpreter 
                                   2530 ;--------------------
                           000001  2531 	TARGET=1   ; target address 
                           000003  2532 	RET_ADDR=3 ; subroutine return address 
                           000005  2533 	RET_BPTR=5 ; basicptr return point 
                           000007  2534 	RET_INW=7  ; in.w return point 
                           000004  2535 	VSIZE=4  
      0023A9                       2536 gosub:
      00A21F CD 97 E5 A3 A2   [ 2] 2537 	btjt flags,#FRUN,gosub_1 
      00A224 2A 27            [ 1] 2538 	ld a,#ERR_RUN_ONLY
      00A226 03 CC 96         [ 2] 2539 	jp tb_error 
      00A229 C5               [ 4] 2540 	ret 
      00A22A                       2541 gosub_1:
      00A22A 72 04 00         [ 4] 2542 	call get_target_line 
      00A22D 22 03 CC         [ 2] 2543 	ldw ptr16,x 
      0023BA                       2544 gosub_2: 
      00A230 96               [ 2] 2545 	popw x 
      0023BB                       2546 	_vars VSIZE  
      00A231 C5 CD            [ 2]    1     sub sp,#VSIZE 
      00A233 9A               [ 2] 2547 	pushw x ; RET_ADDR 
      00A234 B7 A1 84         [ 2] 2548 	ldw x,ptr16 
      00A237 27               [ 2] 2549 	pushw x ; TARGET
                                   2550 ; save BASIC subroutine return point.   
      00A238 03 CC 96         [ 2] 2551 	ldw x,basicptr
      00A23B C5 90            [ 2] 2552 	ldw (RET_BPTR,sp),x 
      00A23D F6 93 EE         [ 2] 2553 	ldw x,in.w 
      00A240 01 72            [ 2] 2554 	ldw (RET_INW,sp),x
      00A242 A9               [ 2] 2555 	popw x 
      00A243 00 03            [ 2] 2556 	jra jp_to_target
                                   2557 
                                   2558 ;------------------------
                                   2559 ; BASIC: RETURN 
                                   2560 ; exit from BASIC subroutine 
                                   2561 ;------------------------
                           000003  2562 	RET_BPTR=3 ; basicptr return point 
                           000005  2563 	RET_INW=5  ; in.w return point 
                           000004  2564 	VSIZE=4  
      0023CF                       2565 return:
      00A245 6B 05 1F 06 CD   [ 2] 2566 	btjt flags,#FRUN,0$ 
      00A24A 97 CB            [ 1] 2567 	ld a,#ERR_RUN_ONLY
      00A24C A1 00 27         [ 2] 2568 	jp tb_error 
      0023D9                       2569 0$:	
      00A24F 11 A1            [ 2] 2570 	ldw x,(RET_ADDR,sp) 
      00A251 80 26 08         [ 2] 2571 	ldw basicptr,x
      00A254 CD 97            [ 1] 2572 	ld a,(2,x)
      00A256 E5 A3 A2         [ 1] 2573 	ld count,a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      00A259 68 27            [ 2] 2574 	ldw x,(RET_INW,sp)
      00A25B 0C 00 00         [ 2] 2575 	ldw in.w,x 
      00A25C 85               [ 2] 2576 	popw x 
      0023E9                       2577 	_drop VSIZE 
      00A25C 55 00            [ 2]    1     addw sp,#VSIZE 
      00A25E 03               [ 2] 2578 	pushw x
      00A25F 00               [ 4] 2579 	ret  
                                   2580 
                                   2581 ;----------------------------------
                                   2582 ; BASIC: RUN
                                   2583 ; run BASIC program in RAM
                                   2584 ;----------------------------------- 
      0023ED                       2585 run: 
      00A260 02 01 00 21 02   [ 2] 2586 	btjf flags,#FRUN,0$  
      00A261 4F               [ 1] 2587 	clr a 
      00A261 AE               [ 4] 2588 	ret
      0023F4                       2589 0$: 
      00A262 00 01 1F 03 20   [ 2] 2590 	btjf flags,#FBREAK,1$
      0023F9                       2591 	_drop 2 
      00A267 1D 02            [ 2]    1     addw sp,#2 
      00A268 CD 1F 9D         [ 4] 2592 	call rest_context
      0023FE                       2593 	_drop CTXT_SIZE 
      00A268 72 04            [ 2]    1     addw sp,#CTXT_SIZE 
      00A26A 00 22 03 CC      [ 1] 2594 	bres flags,#FBREAK 
      00A26E 96 C5 CD 9A      [ 1] 2595 	bset flags,#FRUN 
      00A272 B7 A1 84         [ 2] 2596 	jp interpreter 
      00A275 27 03 CC         [ 2] 2597 1$:	ldw x,txtbgn
      00A278 96 C5 1C         [ 2] 2598 	cpw x,txtend 
      00A27A 2B 0C            [ 1] 2599 	jrmi run_it 
      00A27A 90 F6 93         [ 2] 2600 	ldw x,#err_no_prog
      00A27D EE 01 72         [ 4] 2601 	call puts 
      00A280 A9 00 03 1F 03   [ 1] 2602 	mov in,count
      00A285 81               [ 4] 2603 	ret 
      00241F                       2604 run_it:	 
      00241F                       2605 	_drop 2 ; drop return address 
      00A285 CE 00            [ 2]    1     addw sp,#2 
      002421                       2606 run_it_02: 
      00A287 05 C6 00         [ 4] 2607     call ubound 
      00A28A 02 C1 00         [ 4] 2608 	call clear_vars 
                                   2609 ; clear data pointer 
      00A28D 04               [ 1] 2610 	clrw x 
      00A28E 2B 0C 72         [ 2] 2611 	ldw data_ptr,x 
      00A291 BB 00 01 1F      [ 1] 2612 	clr data_ofs 
      00A295 0C AE 00 03      [ 1] 2613 	clr data_len 
                                   2614 ; initialize BASIC pointer 
      00A299 1F 0A 81         [ 2] 2615 	ldw x,txtbgn 
      00A29C 1F 0C CE         [ 2] 2616 	ldw basicptr,x 
      00A29F 00 01            [ 1] 2617 	ld a,(2,x)
      00A2A1 1F 0A 72         [ 1] 2618 	ld count,a
      00A2A4 15 00 22 72      [ 1] 2619 	mov in,#3	
      00A2A8 5C 00 1F 81      [ 1] 2620 	bset flags,#FRUN 
      00A2AC CC 16 F5         [ 2] 2621 	jp interpreter 
                                   2622 
                                   2623 
                                   2624 ;----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



                                   2625 ; BASIC: END
                                   2626 ; end running program
                                   2627 ;---------------------- 
      002449                       2628 cmd_end: 
                                   2629 ; clean stack 
      00A2AC 72 5D 00         [ 2] 2630 	ldw x,#STACK_EMPTY
      00A2AF 1F               [ 1] 2631 	ldw sp,x 
      00A2B0 26 03 CC         [ 2] 2632 	jp warm_start
                                   2633 
                                   2634 ;---------------------------
                                   2635 ; BASIC: GET var 
                                   2636 ; receive a key in variable 
                                   2637 ; don't wait 
                                   2638 ;---------------------------
      002450                       2639 cmd_get:
      00A2B3 96 C5 4B         [ 4] 2640 	call next_token 
      00A2B5 A1 85            [ 1] 2641 	cp a,#TK_VAR 
      00A2B5 A6 85            [ 1] 2642 	jreq 0$
      00A2B7 CD 99 73         [ 2] 2643 	jp syntax_error 
      00A2BA CD 98 01         [ 4] 2644 0$: call get_addr 
      00A2BD 13 08 27         [ 2] 2645 	ldw ptr16,x 
      00A2C0 03 CC 96         [ 4] 2646 	call qgetc 
      00A2C3 C5 03            [ 1] 2647 	jreq 2$
      00A2C4 CD 09 0D         [ 4] 2648 	call getc  
      00A2C4 CF 00 19 F6      [ 4] 2649 2$: clr [ptr16]
      00A2C8 EE 01 72 FB      [ 1] 2650 	inc ptr8 
      00A2CC 03 A9 00 72      [ 4] 2651 	clr [ptr16]
      00A2D0 C7 00 19 72      [ 1] 2652 	inc ptr8 
      00A2D4 5C 00 1A 72      [ 4] 2653 	ld [ptr16],a 
      00A2D8 CF               [ 4] 2654 	ret 
                                   2655 
                                   2656 
                                   2657 ;-----------------
                                   2658 ; 1 Khz beep 
                                   2659 ;-----------------
      00247D                       2660 beep_1khz:: 
      00A2D9 00 19 C7         [ 2] 2661 	ldw x,#100
      00A2DC 00 0D CF 00      [ 2] 2662 	ldw y,#1000
      00A2E0 0E 7B            [ 2] 2663 	jra beep
                                   2664 
                                   2665 ;-----------------------
                                   2666 ; BASIC: TONE expr1,expr2
                                   2667 ; used TIMER2 channel 1
                                   2668 ; to produce a tone 
                                   2669 ; arguments:
                                   2670 ;    expr1   frequency 
                                   2671 ;    expr2   duration msec.
                                   2672 ;---------------------------
      002486                       2673 tone:
      00A2E2 05 1E 06         [ 4] 2674 	call arg_list 
      00A2E5 72 B0            [ 1] 2675 	cp a,#2 
      00A2E7 00 0E            [ 1] 2676 	jreq 1$
      00A2E9 C2 00 0D         [ 2] 2677 	jp syntax_error 
      002490                       2678 1$: 
      002490                       2679 	_xpop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      00A2EC 8A A6            [ 1]    1     ld a,(y)
      00A2EE 80               [ 1]    2     ldw x,y 
      00A2EF 15 03            [ 2]    3     ldw x,(1,x)
      00A2F1 2A 05 86 2F      [ 2]    4     addw y,#CELL_SIZE 
      00A2F5 1A               [ 2] 2680 	pushw x ; duration 
      00249A                       2681 	_xpop ; frequency
      00A2F6 20 03            [ 1]    1     ld a,(y)
      00A2F8 93               [ 1]    2     ldw x,y 
      00A2F8 86 2C            [ 2]    3     ldw x,(1,x)
      00A2FA 15 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A2FB 90 93            [ 1] 2682 	ldw y,x ; frequency 
      00A2FB 1E               [ 2] 2683 	popw x  ; duration 
      0024A6                       2684 beep:  
      00A2FC 0C               [ 2] 2685 	pushw x 
      00A2FD CF 00 05         [ 2] 2686 	ldw x,#TIM2_CLK_FREQ
      00A300 72               [ 2] 2687 	divw x,y ; cntr=Fclk/freq 
                                   2688 ; round to nearest integer 
      00A301 01 00 22 05      [ 2] 2689 	cpw y,#TIM2_CLK_FREQ/2
      00A305 E6 02            [ 1] 2690 	jrmi 2$
      00A307 C7               [ 1] 2691 	incw x 
      0024B2                       2692 2$:	 
      00A308 00               [ 1] 2693 	ld a,xh 
      00A309 04 1E 0A         [ 1] 2694 	ld TIM2_ARRH,a 
      00A30C CF               [ 1] 2695 	ld a,xl 
      00A30D 00 01 81         [ 1] 2696 	ld TIM2_ARRL,a 
                                   2697 ; 50% duty cycle 
      00A310 8C               [ 1] 2698 	ccf 
      00A310 85               [ 2] 2699 	rrcw x 
      00A311 5B               [ 1] 2700 	ld a,xh 
      00A312 0C 72 5A         [ 1] 2701 	ld TIM2_CCR1H,a 
      00A315 00               [ 1] 2702 	ld a,xl
      00A316 1F FC 10         [ 1] 2703 	ld TIM2_CCR1L,a
      00A318 72 10 53 08      [ 1] 2704 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A318 CD 97 CB A1      [ 1] 2705 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A31C 84 27 07 A1      [ 1] 2706 	bset TIM2_EGR,#TIM2_EGR_UG
      00A320 03               [ 2] 2707 	popw x 
      00A321 27 26 CC         [ 4] 2708 	call pause02
      00A324 96 C5 53 08      [ 1] 2709 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A326 72 11 53 00      [ 1] 2710 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A326 90               [ 4] 2711 	ret 
                                   2712 
                                   2713 ;-------------------------------
                                   2714 ; BASIC: ADCON 0|1 [,divisor]  
                                   2715 ; disable/enanble ADC 
                                   2716 ;-------------------------------
                           000003  2717 	ONOFF=3 
                           000001  2718 	DIVSOR=1
                           000004  2719 	VSIZE=4 
      0024DD                       2720 power_adc:
      00A327 89 CD 98         [ 4] 2721 	call arg_list 
      00A32A 0B 4F            [ 1] 2722 	cp a,#2	
      00A32C 90 CE            [ 1] 2723 	jreq 1$
      00A32E 00 05            [ 1] 2724 	cp a,#1 
      00A330 90 FE            [ 1] 2725 	jreq 0$ 
      00A332 90 89 13         [ 2] 2726 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      00A335 01               [ 1] 2727 0$:	clr a 
      00A336 5B               [ 1] 2728 	clrw x
      0024ED                       2729 	_xpush   ; divisor  
      00A337 02 25 01 4C      [ 2]    1     subw y,#CELL_SIZE
      00A33B 90 F7            [ 1]    2     ld (y),a 
      00A33B CD 8C C2         [ 2]    3     ldw (1,y),x 
      0024F6                       2730 1$: _at_next 
      00A33E 5D 26 05         [ 1]    1     ld a,(3,y)
      00A341 A6               [ 1]    2     ldw x,y 
      00A342 05 CC            [ 2]    3     ldw x,(4,x)
      00A344 96               [ 2] 2731 	tnzw x 
      00A345 C7 90            [ 1] 2732 	jreq 2$ 
      0024FF                       2733 	_xpop
      00A347 85 81            [ 1]    1     ld a,(y)
      00A349 93               [ 1]    2     ldw x,y 
      00A349 90 89            [ 2]    3     ldw x,(1,x)
      00A34B 89 72 5F 00      [ 2]    4     addw y,#CELL_SIZE 
      002508                       2734 	_xdrop  
      00A34F 0E 90 CE 00      [ 2]    1     addw y,#CELL_SIZE 
      00A353 1B               [ 1] 2735 	ld a,xl
      00A354 90 E6            [ 1] 2736 	and a,#7
      00A356 03               [ 1] 2737 	swap a 
      00A357 A1 03 27         [ 1] 2738 	ld ADC_CR1,a
      00A35A 15 90 E6 02      [ 1] 2739 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A35E C7 00 0F 72      [ 1] 2740 	bset ADC_CR1,#ADC_CR1_ADON 
      00251B                       2741 	_usec_dly 7 
      00A362 B9 00 0E         [ 2]    1     ldw x,#(16*7-2)/4
      00A365 90               [ 2]    2     decw x
      00A366 C3               [ 1]    3     nop 
      00A367 00 1D            [ 1]    4     jrne .-4
      00A369 25 E9            [ 2] 2742 	jra 3$
      00A36B A6 0A CC 96      [ 1] 2743 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A36F C7 17 50 CA      [ 1] 2744 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A370                       2745 3$:	
      00A370 90               [ 4] 2746 	ret
                                   2747 
                                   2748 ;-----------------------------
                                   2749 ; BASIC: ADCREAD (channel)
                                   2750 ; read adc channel {0..5}
                                   2751 ; output:
                                   2752 ;   A 		TK_INTGR 
                                   2753 ;   X 		value 
                                   2754 ;-----------------------------
      00252D                       2755 analog_read:
      00A371 89 72 A9         [ 4] 2756 	call func_args 
      00A374 00 04            [ 1] 2757 	cp a,#1 
      00A376 1E 03            [ 1] 2758 	jreq 1$
      00A378 CD 94 14         [ 2] 2759 	jp syntax_error
      002537                       2760 1$: _xpop 
      00A37B 26 04            [ 1]    1     ld a,(y)
      00A37D 90               [ 1]    2     ldw x,y 
      00A37E 85 20            [ 2]    3     ldw x,(1,x)
      00A380 DA A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A381 A3 00 05         [ 2] 2761 	cpw x,#5 
      00A381 85 5B            [ 2] 2762 	jrule 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      00A383 02 90            [ 1] 2763 	ld a,#ERR_BAD_VALUE
      00A385 85 81 47         [ 2] 2764 	jp tb_error 
      00A387 9F               [ 1] 2765 2$: ld a,xl
      00A387 72 00 00         [ 1] 2766 	ld acc8,a 
      00A38A 22 05            [ 1] 2767 	ld a,#5
      00A38C A6 06 CC         [ 1] 2768 	sub a,acc8 
      00A38F 96 C7 CD         [ 1] 2769 	ld ADC_CSR,a
      00A392 9A B7 A1 84      [ 1] 2770 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A396 27 03 CC 96      [ 1] 2771 	bset ADC_CR1,#ADC_CR1_ADON
      00A39A C5 90 F6 93 EE   [ 2] 2772 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00A39F 01 72 A9         [ 2] 2773 	ldw x,ADC_DRH
      00A3A2 00 03            [ 1] 2774 	ld a,#TK_INTGR
      00A3A4 9F               [ 4] 2775 	ret 
                                   2776 
                                   2777 ;-----------------------
                                   2778 ; BASIC: DREAD(pin)
                                   2779 ; Arduino pins 
                                   2780 ; read state of a digital pin 
                                   2781 ; pin# {0..15}
                                   2782 ; output:
                                   2783 ;    A 		TK_INTGR
                                   2784 ;    X      0|1 
                                   2785 ;-------------------------
                           000001  2786 	PINNO=1
                           000001  2787 	VSIZE=1
      002569                       2788 digital_read:
      002569                       2789 	_vars VSIZE 
      00A3A5 27 62            [ 2]    1     sub sp,#VSIZE 
      00A3A7 88 CD 97         [ 4] 2790 	call func_args
      00A3AA CB A1            [ 1] 2791 	cp a,#1
      00A3AC 80 27            [ 1] 2792 	jreq 1$
      00A3AE 03 CC 96         [ 2] 2793 	jp syntax_error
      002575                       2794 1$: _xpop 
      00A3B1 C5 CD            [ 1]    1     ld a,(y)
      00A3B3 97               [ 1]    2     ldw x,y 
      00A3B4 E5 A3            [ 2]    3     ldw x,(1,x)
      00A3B6 A4 0F 27 08      [ 2]    4     addw y,#CELL_SIZE 
      00A3BA A3 A4 29         [ 2] 2795 	cpw x,#15 
      00A3BD 27 03            [ 2] 2796 	jrule 2$
      00A3BF CC 96            [ 1] 2797 	ld a,#ERR_BAD_VALUE
      00A3C1 C5 16 47         [ 2] 2798 	jp tb_error 
      00A3C2 CD 2B 04         [ 4] 2799 2$:	call select_pin 
      00A3C2 84 89            [ 1] 2800 	ld (PINNO,sp),a
      00A3C4 88 01            [ 1] 2801 	ld a,(GPIO_IDR,x)
      00A3C5 0D 01            [ 1] 2802 	tnz (PINNO,sp)
      00A3C5 0A 01            [ 1] 2803 	jreq 8$
      00A3C7 27               [ 1] 2804 3$: srl a 
      00A3C8 26 CD            [ 1] 2805 	dec (PINNO,sp)
      00A3CA 97 CB            [ 1] 2806 	jrne 3$ 
      00A3CC A1 84            [ 1] 2807 8$: and a,#1 
      00A3CE 27               [ 1] 2808 	clrw x 
      00A3CF 07               [ 1] 2809 	ld xl,a 
      00A3D0 A1 03            [ 1] 2810 	ld a,#TK_INTGR
      00259E                       2811 	_drop VSIZE
      00A3D2 27 0D            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      00A3D4 CC               [ 4] 2812 	ret
                                   2813 
                                   2814 
                                   2815 ;-----------------------
                                   2816 ; BASIC: DWRITE pin,0|1
                                   2817 ; Arduino pins 
                                   2818 ; write to a digital pin 
                                   2819 ; pin# {0..15}
                                   2820 ; output:
                                   2821 ;    A 		TK_INTGR
                                   2822 ;    X      0|1 
                                   2823 ;-------------------------
                           000001  2824 	PINNO=1
                           000002  2825 	PINVAL=2
                           000002  2826 	VSIZE=2
      0025A1                       2827 digital_write:
      0025A1                       2828 	_vars VSIZE 
      00A3D5 96 C5            [ 2]    1     sub sp,#VSIZE 
      00A3D7 CD 19 05         [ 4] 2829 	call arg_list  
      00A3D7 C6 00            [ 1] 2830 	cp a,#2 
      00A3D9 02 AB            [ 1] 2831 	jreq 1$
      00A3DB 03 C7 00         [ 2] 2832 	jp syntax_error
      0025AD                       2833 1$: _xpop 
      00A3DE 02 20            [ 1]    1     ld a,(y)
      00A3E0 03               [ 1]    2     ldw x,y 
      00A3E1 CD 97            [ 2]    3     ldw x,(1,x)
      00A3E3 F2 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A3E4 9F               [ 1] 2834 	ld a,xl 
      00A3E4 CD 97            [ 1] 2835 	ld (PINVAL,sp),a
      0025B9                       2836 	_xpop 
      00A3E6 CB A1            [ 1]    1     ld a,(y)
      00A3E8 08               [ 1]    2     ldw x,y 
      00A3E9 27 DA            [ 2]    3     ldw x,(1,x)
      00A3EB 5B 03 20 1A      [ 2]    4     addw y,#CELL_SIZE 
      00A3EF A3 00 0F         [ 2] 2837 	cpw x,#15 
      00A3EF 5B 01            [ 2] 2838 	jrule 2$
      00A3F1 CD A3            [ 1] 2839 	ld a,#ERR_BAD_VALUE
      00A3F3 18 CF 00         [ 2] 2840 	jp tb_error 
      00A3F6 19 55 00         [ 4] 2841 2$:	call select_pin 
      00A3F9 04 00            [ 1] 2842 	ld (PINNO,sp),a 
      00A3FB 02 85            [ 1] 2843 	ld a,#1
      00A3FD A3 A4            [ 1] 2844 	tnz (PINNO,sp)
      00A3FF 0F 26            [ 1] 2845 	jreq 4$
      00A401 05               [ 1] 2846 3$: sll a
      00A402 CE 00            [ 1] 2847 	dec (PINNO,sp)
      00A404 19 20            [ 1] 2848 	jrne 3$
      00A406 15 02            [ 1] 2849 4$: tnz (PINVAL,sp)
      00A407 26 05            [ 1] 2850 	jrne 5$
      00A407 20               [ 1] 2851 	cpl a 
      00A408 31 00            [ 1] 2852 	and a,(GPIO_ODR,x)
      00A409 20 02            [ 2] 2853 	jra 8$
      00A409 55 00            [ 1] 2854 5$: or a,(GPIO_ODR,x)
      00A40B 04 00            [ 1] 2855 8$: ld (GPIO_ODR,x),a 
      0025E9                       2856 	_drop VSIZE 
      00A40D 02 81            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00A40F 81               [ 4] 2857 	ret
                                   2858 
                                   2859 
                                   2860 ;-----------------------
                                   2861 ; BASIC: STOP
                                   2862 ; stop progam execution  
                                   2863 ; without resetting pointers 
                                   2864 ; the program is resumed
                                   2865 ; with RUN 
                                   2866 ;-------------------------
      0025EC                       2867 stop:
      00A40F 72 00 00 22 05   [ 2] 2868 	btjt flags,#FRUN,2$
      00A414 A6               [ 1] 2869 	clr a
      00A415 06               [ 4] 2870 	ret 
      0025F3                       2871 2$:	 
                                   2872 ; create space on cstack to save context 
      00A416 CC 96 C7         [ 2] 2873 	ldw x,#break_point 
      00A419 CD 09 5A         [ 4] 2874 	call puts 
      0025F9                       2875 	_drop 2 ;drop return address 
      00A419 CD A3            [ 2]    1     addw sp,#2 
      0025FB                       2876 	_vars CTXT_SIZE ; context size 
      00A41B 18 04            [ 2]    1     sub sp,#CTXT_SIZE 
      00A41C CD 1F 8D         [ 4] 2877 	call save_context 
      00A41C CF 00 05         [ 2] 2878 	ldw x,#tib 
      00A41F E6 02 C7         [ 2] 2879 	ldw basicptr,x
      00A422 00               [ 1] 2880 	clr (x)
      00A423 04 35 03 00      [ 1] 2881 	clr count  
      00A427 02               [ 1] 2882 	clrw x 
      00A428 81 00 00         [ 2] 2883 	ldw in.w,x
      00A429 72 11 00 21      [ 1] 2884 	bres flags,#FRUN 
      00A429 72 00 00 22      [ 1] 2885 	bset flags,#FBREAK
      00A42D 06 A6 06         [ 2] 2886 	jp interpreter 
      00A430 CC 96 C7 81 61 6B 20  2887 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   2888 
                                   2889 ;-----------------------
                                   2890 ; BASIC: NEW
                                   2891 ; from command line only 
                                   2892 ; free program memory
                                   2893 ; and clear variables 
                                   2894 ;------------------------
      00A434                       2895 new: 
      00A434 CD A3 18 CF 00   [ 2] 2896 	btjf flags,#FRUN,0$ 
      00A439 19               [ 4] 2897 	ret 
      00A43A                       2898 0$:	
      00A43A 85 52 04         [ 4] 2899 	call clear_basic 
      00A43D 89               [ 4] 2900 	ret 
                                   2901 
                                   2902 ;-----------------------------------
                                   2903 ; BASIC: ERASE \E | \F 
                                   2904 ; erase all block in range from 
                                   2905 ;  'app_space' to FLASH end (0x20000)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



                                   2906 ;  or all EEPROM 
                                   2907 ; that contains a non zero byte.  
                                   2908 ;-----------------------------------
                           000001  2909 	LIMIT=1 
                           000003  2910 	VSIZE = 3 
      002642                       2911 erase:
      00A43E CE 00 19 89      [ 1] 2912 	clr farptr 
      002646                       2913 	_vars VSIZE 
      00A442 CE 00            [ 2]    1     sub sp,#VSIZE 
      00A444 05 1F 05         [ 4] 2914 	call next_token 
      00A447 CE 00            [ 1] 2915 	cp a,#TK_CHAR 
      00A449 01 1F            [ 1] 2916 	jreq 0$ 
      00A44B 07 85 20         [ 2] 2917 	jp syntax_error
      00A44E CD 17 9B         [ 4] 2918 0$: call get_char 
      00A44F A4 DF            [ 1] 2919 	and a,#0XDF 
      00A44F 72 00            [ 1] 2920 	cp a,#'E
      00A451 00 22            [ 1] 2921 	jrne 1$
      00A453 05 A6 06         [ 2] 2922 	ldw x,#EEPROM_BASE 
      00A456 CC 96 C7         [ 2] 2923 	ldw farptr+1,x 
      00A459 AE 47 FF         [ 2] 2924 	ldw x,#EEPROM_END
      00A459 1E               [ 1] 2925 	clr a 
      00A45A 03 CF            [ 2] 2926 	jra 3$ 
      00A45C 00 05            [ 1] 2927 1$: cp a,#'F 
      00A45E E6 02            [ 1] 2928 	jreq 2$
      00A460 C7 00 04         [ 2] 2929 	ldw x,#err_bad_value
      00A463 1E 05 CF         [ 2] 2930 	jp tb_error
      002671                       2931 2$:
      00A466 00 01 85         [ 2] 2932 	ldw x,#app_sign 
      00A469 5B 04 89         [ 2] 2933 	ldw farptr+1,x 
      00A46C 81 02            [ 1] 2934 	ld a,#(FLASH_END>>16)&0XFF 
      00A46D AE 7F FF         [ 2] 2935 	ldw x,#FLASH_END&0xffff
      00267C                       2936 3$:
      00A46D 72 01            [ 1] 2937 	ld (LIMIT,sp),a 
      00A46F 00 22            [ 2] 2938 	ldw (LIMIT+1,sp),x 
                                   2939  ; operation done from RAM
                                   2940  ; copy code to RAM in tib   
      00A471 02 4F 81         [ 4] 2941 	call move_erase_to_ram
      00A474                       2942 4$:	 
      00A474 72 09 00         [ 4] 2943     call scan_block 
      00A477 22 12            [ 1] 2944 	jreq 5$  ; block already erased 
      00A479 5B 02            [ 1] 2945     ld a,#'E 
      00A47B CD A0 1D         [ 4] 2946     call putc 
      00A47E 5B 04 72         [ 4] 2947 	call block_erase   
                                   2948 ; this block is clean, next  
      00A481 19 00 22         [ 2] 2949 5$:	ldw x,#BLOCK_SIZE
      00A484 72 10 00         [ 4] 2950 	call incr_farptr
                                   2951 ; check limit, 24 bit substraction  	
      00A487 22 CC            [ 1] 2952 	ld a,(LIMIT,sp)
      00A489 97 75            [ 2] 2953 	ldw x,(LIMIT+1,sp)
      00A48B CE 00 1B C3      [ 2] 2954 	subw x,farptr+1
      00A48F 00 1D 2B         [ 1] 2955 	sbc a,farptr 
      00A492 0C AE            [ 1] 2956 	jrugt 4$ 
      00A494 96 54 CD         [ 4] 2957 9$: call clear_basic
      00A497 89 DA            [ 2] 2958 	ldw x,(LIMIT+1,sp)
      00A499 55 00 04         [ 2] 2959 	cpw x,#EEPROM_END
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00A49C 00 02            [ 1] 2960 	jrne 10$
      00A49E 81 1C 65         [ 4] 2961 	call func_eefree 
      00A49F                       2962 10$:
      0026B0                       2963 	_drop VSIZE 
      00A49F 5B 02            [ 2]    1     addw sp,#VSIZE 
      00A4A1 81               [ 4] 2964 	ret 
                                   2965 	
                                   2966 
                                   2967 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2968 ;  check for application signature 
                                   2969 ; output:
                                   2970 ;   Carry    0 app present 
                                   2971 ;            1 no app installed  
                                   2972 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026B3                       2973 qsign: 
      00A4A1 CD 9C 22         [ 2] 2974 	ldw x,app_sign 
      00A4A4 CD 94 79         [ 2] 2975 	cpw x,SIGNATURE ; "BC" 
      00A4A7 5F               [ 4] 2976 	ret 
                                   2977 
                                   2978 ;--------------------------------------
                                   2979 ;  fill write buffer 
                                   2980 ;  input:
                                   2981 ;    y  point to output buffer 
                                   2982 ;    x  point to source 
                                   2983 ;    a  bytes to write in buffer 
                                   2984 ;  output:
                                   2985 ;    y   += A 
                                   2986 ;    X   += A 
                                   2987 ;    A   0 
                                   2988 ;---------------------------------------
      0026BA                       2989 fill_write_buffer:
      00A4A8 CF               [ 1] 2990 	push a 
      00A4A9 00               [ 1] 2991 	tnz a 
      00A4AA 07 72            [ 1] 2992 	jreq 9$ 
      00A4AC 5F               [ 1] 2993 1$: ld a,(x)
      00A4AD 00               [ 1] 2994 	incw x 
      00A4AE 09 72            [ 1] 2995 	ld (y),a 
      00A4B0 5F 00            [ 1] 2996 	incw y 
      00A4B2 0A CE            [ 1] 2997 	dec (1,sp) 
      00A4B4 00 1B            [ 1] 2998 	jrne 1$ 
      00A4B6 CF               [ 1] 2999 9$:	pop a 
      00A4B7 00               [ 4] 3000     ret 	
                                   3001 
                                   3002 ;--------------------------------------
                                   3003 ;  fill pad buffer with zero 
                                   3004 ;  input:
                                   3005 ;	none 
                                   3006 ;  output:
                                   3007 ;    y     buffer address  
                                   3008 ;--------------------------------------
      0026CA                       3009 clear_block_buffer:
      00A4B8 05               [ 1] 3010 	push a 
      00A4B9 E6 02 C7 00      [ 2] 3011 	ldw y,#block_buffer 
      00A4BD 04 35            [ 2] 3012 	pushw y
      00A4BF 03 00            [ 1] 3013 	ld a,#BLOCK_SIZE   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00A4C1 02 72            [ 1] 3014 1$:	clr (y)
      00A4C3 10 00            [ 1] 3015 	incw y
      00A4C5 22               [ 1] 3016 	dec a  
      00A4C6 CC 97            [ 1] 3017 	jrne 1$ 	
      00A4C8 75 85            [ 2] 3018 9$: popw y 
      00A4C9 84               [ 1] 3019 	pop a 			
      00A4C9 AE               [ 4] 3020 	ret 
                                   3021 
                                   3022 
                                   3023 ;---------------------------------------
                                   3024 ; BASIC: SAVE
                                   3025 ; write application from RAM to FLASH
                                   3026 ;--------------------------------------
                           000001  3027 	XTEMP=1
                           000003  3028 	COUNT=3  ; last count bytes written 
                           000004  3029 	CNT_LO=4 ; count low byte 
                           000005  3030 	TOWRITE=5 ; how bytes left to write  
                           000006  3031 	VSIZE=6 
      0026DE                       3032 save_app:
      00A4CA 17               [ 2] 3033 	pushw x 
      00A4CB FF 94            [ 2] 3034 	pushw y 
      0026E1                       3035 	_vars VSIZE
      00A4CD CC 97            [ 2]    1     sub sp,#VSIZE 
      00A4CF 56 26 B3         [ 4] 3036 	call qsign 
      00A4D0 26 09            [ 1] 3037 	jrne 1$
      00A4D0 CD 97 CB         [ 2] 3038 	ldw x,#CANT_DO 
      00A4D3 A1 85 27         [ 4] 3039 	call puts 
      00A4D6 03 CC 96         [ 2] 3040 	jp 9$
      0026F1                       3041 1$: 
      00A4D9 C5 CD 98         [ 2] 3042 	ldw x,txtbgn
      00A4DC 01 CF 00         [ 2] 3043 	cpw x,txtend 
      00A4DF 19 CD            [ 1] 3044 	jrult 2$ 
      00A4E1 89 86 27         [ 2] 3045 	ldw x,#NO_APP
      00A4E4 03 CD 89         [ 4] 3046 	call puts 
      00A4E7 8D 72 3F         [ 2] 3047 	jp 9$
      002702                       3048 2$: 
                                   3049 ; block programming flash
                                   3050 ; must be done from RAM
                                   3051 ; moved in tib  
      00A4EA 00 19 72         [ 4] 3052 	call move_prg_to_ram
                                   3053 ; initialize farptr 
                                   3054 ; to app_sign address 
      00A4ED 5C 00 1A 72      [ 1] 3055 	clr farptr 
      00A4F1 3F 00 19         [ 2] 3056 	ldw x,#app_sign 
      00A4F4 72 5C 00         [ 2] 3057 	ldw farptr+1,x
                                   3058 ; initialize local variables 
      00A4F7 1A 72 C7         [ 4] 3059 	call prog_size
      00A4FA 00 19            [ 2] 3060 	ldw (TOWRITE,sp),x
      00A4FC 81 03            [ 1] 3061 	clr (COUNT,sp)
                                   3062 ; first bock 
                                   3063 ; containt signature 2 bytes 
                                   3064 ; and size 	2 bytes 
                                   3065 ; use Y as pointer to block_buffer
      00A4FD CD 26 CA         [ 4] 3066 	call clear_block_buffer ; -- y=*block_buffer	
                                   3067 ; write signature
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00A4FD AE 00 64         [ 2] 3068 	ldw x,SIGNATURE ; "BC" 
      00A500 90 AE            [ 2] 3069 	ldw (y),x 
      00A502 03 E8 20 20      [ 2] 3070 	addw y,#2
      00A506 1E 05            [ 2] 3071 	ldw x,(TOWRITE,sp)
      00A506 CD 99            [ 2] 3072 	ldw (y),x
      00A508 85 A1 02 27      [ 2] 3073 	addw y,#2   
      00A50C 03 CC            [ 1] 3074 	ld a,#(BLOCK_SIZE-4)
      00A50E 96 C5            [ 1] 3075 	ld (CNT_LO,sp),a 
      00A510 A3 00 7C         [ 2] 3076 	cpw x,#(BLOCK_SIZE-4) 
      00A510 90 F6            [ 1] 3077 	jrugt 3$
      00A512 93               [ 1] 3078 	ld a,xl 
      00A513 EE 01            [ 1] 3079 3$:	ld (CNT_LO,sp),a   
      00A515 72 A9 00         [ 2] 3080 	ldw x,txtbgn 
      00A518 03 89            [ 2] 3081 	ldw (XTEMP,sp),x 
      00273B                       3082 32$: 
      00A51A 90 F6            [ 2] 3083 	ldw x,(XTEMP,sp)
      00A51C 93 EE            [ 1] 3084 	ld a,(CNT_LO,sp)
      00A51E 01 72 A9         [ 4] 3085 	call fill_write_buffer 
      00A521 00 03            [ 2] 3086 	ldw (XTEMP,sp),x 
      00A523 90 93 85         [ 2] 3087 	ldw x,#block_buffer
      00A526 CD 07 5A         [ 4] 3088 	call write_buffer
      00A526 89 AE F4         [ 2] 3089 	ldw x,#BLOCK_SIZE 
      00A529 24 65 90         [ 4] 3090 	call incr_farptr  
                                   3091 ; following blocks 
      00A52C A3 7A            [ 2] 3092 	ldw x,(XTEMP,sp)
      00A52E 12 2B 01         [ 2] 3093 	cpw x,txtend 
      00A531 5C 16            [ 1] 3094 	jruge 9$ 
      00A532 1E 05            [ 2] 3095 	ldw x,(TOWRITE,sp)
      00A532 9E C7 53         [ 2] 3096 	subw x,(COUNT,sp)
      00A535 0D 9F            [ 2] 3097 	ldw (TOWRITE,sp),x 
      00A537 C7 53            [ 1] 3098 	ld a,#BLOCK_SIZE 
      00A539 0E 8C 56         [ 2] 3099 	cpw x,#BLOCK_SIZE 
      00A53C 9E C7            [ 1] 3100 	jruge 4$ 
      00A53E 53               [ 1] 3101 	ld a,xl 
      00A53F 0F 9F            [ 1] 3102 4$:	ld (CNT_LO,sp),a 
      00A541 C7 53 10         [ 4] 3103 	call clear_block_buffer 
      00A544 72 10            [ 2] 3104 	jra 32$ 
      00276D                       3105 9$:	_drop VSIZE 
      00A546 53 08            [ 2]    1     addw sp,#VSIZE 
      00A548 72 10            [ 2] 3106     popw y 
      00A54A 53               [ 2] 3107 	popw x 
      00A54B 00               [ 4] 3108 	ret 
                                   3109 
                                   3110 
      00A54C 72 10                 3111 SIGNATURE: .ascii "BC"
      00A54E 53 04 85 CD A9 AD 72  3112 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE \F before"
             11 53 08 72 11 53 00
             81 6C 69 63 61 74 69
             6F 6E 2C 20 61 6C 72
             65 61 64 79 20 6F 6E
             65 20 69 6E 20 46 4C
             41 53 48 0A 75 73 65
             20 45 52 41 53 45 20
             5C 46 20 62 65 66 6F
             72 65 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      00A55D 4E 6F 20 61 70 70 6C  3113 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
             20 69 6E 20 52 41 4D
             00
                                   3114 
                                   3115 ;---------------------
                                   3116 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3117 ; write 1 or more byte to FLASH or EEPROM
                                   3118 ; starting at address  
                                   3119 ; input:
                                   3120 ;   expr1  	is address 
                                   3121 ;   expr2,...,exprn   are bytes to write
                                   3122 ; output:
                                   3123 ;   none 
                                   3124 ;---------------------
      0027CD                       3125 write:
      00A55D CD 99 85         [ 4] 3126 	call expression
      00A560 A1 02            [ 1] 3127 	cp a,#TK_INTGR 
      00A562 27 12            [ 1] 3128 	jreq 0$
      00A564 A1 01 27         [ 2] 3129 	jp syntax_error
      0027D7                       3130 0$: _xpop 
      00A567 03 CC            [ 1]    1     ld a,(y)
      00A569 96               [ 1]    2     ldw x,y 
      00A56A C5 4F            [ 2]    3     ldw x,(1,x)
      00A56C 5F 72 A2 00      [ 2]    4     addw y,#CELL_SIZE 
      00A570 03 90 F7         [ 1] 3131 	ld farptr,a 
      00A573 90 EF 01         [ 2] 3132 	ldw ptr16,x 
      0027E6                       3133 1$:	
      00A576 90 E6 03         [ 4] 3134 	call next_token 
      00A579 93 EE            [ 1] 3135 	cp a,#TK_COMMA 
      00A57B 04 5D            [ 1] 3136 	jreq 2$ 
      00A57D 27 25            [ 2] 3137 	jra 9$ ; no more data 
      00A57F 90 F6 93         [ 4] 3138 2$:	call expression
      00A582 EE 01            [ 1] 3139 	cp a,#TK_INTGR
      00A584 72 A9            [ 1] 3140 	jreq 3$
      00A586 00 03 72         [ 2] 3141 	jp syntax_error
      0027F9                       3142 3$:	_xpop 
      00A589 A9 00            [ 1]    1     ld a,(y)
      00A58B 03               [ 1]    2     ldw x,y 
      00A58C 9F A4            [ 2]    3     ldw x,(1,x)
      00A58E 07 4E C7 54      [ 2]    4     addw y,#CELL_SIZE 
      00A592 01               [ 1] 3143 	ld a,xl 
      00A593 72               [ 1] 3144 	clrw x 
      00A594 16 50 CA         [ 4] 3145 	call write_byte
      00A597 72 10 54         [ 2] 3146 	ldw x,#1 
      00A59A 01 AE 00         [ 4] 3147 	call incr_farptr 
      00A59D 1B 5A            [ 2] 3148 	jra 1$ 
      00280F                       3149 9$:
      00A59F 9D               [ 4] 3150 	ret 
                                   3151 
                                   3152 
                                   3153 ;---------------------
                                   3154 ;BASIC: CHAR(expr)
                                   3155 ; évaluate expression 
                                   3156 ; and take the 7 least 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



                                   3157 ; bits as ASCII character
                                   3158 ; output: 
                                   3159 ; 	A char 
                                   3160 ;---------------------
      002810                       3161 char:
      00A5A0 26 FA 20         [ 4] 3162 	call func_args 
      00A5A3 08 72            [ 1] 3163 	cp a,#1
      00A5A5 11 54            [ 1] 3164 	jreq 1$
      00A5A7 01 72 17         [ 2] 3165 	jp syntax_error
      00281A                       3166 1$:	_xpop
      00A5AA 50 CA            [ 1]    1     ld a,(y)
      00A5AC 93               [ 1]    2     ldw x,y 
      00A5AC 81 01            [ 2]    3     ldw x,(1,x)
      00A5AD 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A5AD CD               [ 1] 3167 	ld a,xl
      00A5AE 99 80            [ 1] 3168 	and a,#0x7f 
      00A5B0 A1               [ 4] 3169 	ret
                                   3170 
                                   3171 ;---------------------
                                   3172 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3173 ; extract first character 
                                   3174 ; of string argument 
                                   3175 ; output:
                                   3176 ;    A:X    int24 
                                   3177 ;---------------------
      002827                       3178 ascii:
      00A5B1 01 27            [ 1] 3179 	ld a,#TK_LPAREN
      00A5B3 03 CC 96         [ 4] 3180 	call expect 
      00A5B6 C5 90 F6         [ 4] 3181 	call next_token 
      00A5B9 93 EE            [ 1] 3182 	cp a,#TK_QSTR 
      00A5BB 01 72            [ 1] 3183 	jreq 1$
      00A5BD A9 00            [ 1] 3184 	cp a,#TK_CHAR 
      00A5BF 03 A3            [ 1] 3185 	jreq 2$ 
      00A5C1 00 05            [ 1] 3186 	cp a,#TK_CFUNC 
      00A5C3 23 05            [ 1] 3187 	jreq 0$
      00A5C5 A6 0A CC         [ 2] 3188 	jp syntax_error
      00283E                       3189 0$: ; cfunc 
      00A5C8 96               [ 4] 3190 	call (x)
      00A5C9 C7 9F            [ 2] 3191 	jra 3$
      002841                       3192 1$: ; quoted string 
      00A5CB C7               [ 1] 3193 	ld a,(x)
      00A5CC 00               [ 1] 3194 	push a  
      00A5CD 0F A6 05         [ 4] 3195 	call skip_string
      00A5D0 C0               [ 1] 3196 	pop a  	
      00A5D1 00 0F            [ 2] 3197 	jra 3$ 
      002849                       3198 2$: ; character 
      00A5D3 C7 54 00         [ 4] 3199 	call get_char 
      00A5D6 72               [ 1] 3200 3$:	clrw x 
      00A5D7 16               [ 1] 3201 	rlwa x   
      00284E                       3202 4$:	_xpush  
      00A5D8 54 02 72 10      [ 2]    1     subw y,#CELL_SIZE
      00A5DC 54 01            [ 1]    2     ld (y),a 
      00A5DE 72 0F 54         [ 2]    3     ldw (1,y),x 
      00A5E1 00 FB            [ 1] 3203 	ld a,#TK_RPAREN 
      00A5E3 CE 54 04         [ 4] 3204 	call expect
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00285C                       3205 9$:	
      00285C                       3206 	_xpop  
      00A5E6 A6 84            [ 1]    1     ld a,(y)
      00A5E8 81               [ 1]    2     ldw x,y 
      00A5E9 EE 01            [ 2]    3     ldw x,(1,x)
      00A5E9 52 01 CD 99      [ 2]    4     addw y,#CELL_SIZE 
      00A5ED 80               [ 4] 3207 	ret 
                                   3208 
                                   3209 ;---------------------
                                   3210 ;BASIC: KEY
                                   3211 ; wait for a character 
                                   3212 ; received from STDIN 
                                   3213 ; input:
                                   3214 ;	none 
                                   3215 ; output:
                                   3216 ;	a	 character 
                                   3217 ;---------------------
      002866                       3218 key:
      00A5EE A1 01 27         [ 4] 3219 	call getc 
      00A5F1 03               [ 4] 3220 	ret
                                   3221 
                                   3222 ;----------------------
                                   3223 ; BASIC: QKEY
                                   3224 ; Return true if there 
                                   3225 ; is a character in 
                                   3226 ; waiting in STDIN 
                                   3227 ; input:
                                   3228 ;  none 
                                   3229 ; output:
                                   3230 ;   A     0|-1
                                   3231 ;-----------------------
      00286A                       3232 qkey:: 
      00A5F2 CC               [ 1] 3233 	clrw x 
      00A5F3 96 C5 90         [ 1] 3234 	ld a,rx1_head
      00A5F6 F6 93 EE         [ 1] 3235 	sub a,rx1_tail 
      00A5F9 01 72            [ 1] 3236 	jreq 9$ 
      00A5FB A9               [ 2] 3237 	cplw x
      00A5FC 00 03            [ 1] 3238 	ld a,#255    
      002876                       3239 9$: 
      00A5FE A3               [ 4] 3240 	ret 
                                   3241 
                                   3242 ;---------------------
                                   3243 ; BASIC: GPIO(expr,reg)
                                   3244 ; return gpio address 
                                   3245 ; expr {0..8}
                                   3246 ; input:
                                   3247 ;   none 
                                   3248 ; output:
                                   3249 ;   X 		gpio register address
                                   3250 ;----------------------------
                                   3251 ;	N=PORT
                                   3252 ;	T=REG 
      002877                       3253 gpio:
      00A5FF 00 0F 23         [ 4] 3254 	call func_args 
      00A602 05 A6            [ 1] 3255 	cp a,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00A604 0A CC            [ 1] 3256 	jreq 1$
      00A606 96 C7 CD         [ 2] 3257 	jp syntax_error  
      002881                       3258 1$:	_at_next 
      00A609 AB 84 6B         [ 1]    1     ld a,(3,y)
      00A60C 01               [ 1]    2     ldw x,y 
      00A60D E6 01            [ 2]    3     ldw x,(4,x)
      00A60F 0D               [ 2] 3259 	tnzw x 
      00A610 01 27            [ 1] 3260 	jrmi bad_port
      00A612 05 44 0A         [ 2] 3261 	cpw x,#9
      00A615 01 26            [ 1] 3262 	jrpl bad_port
      00A617 FB A4            [ 1] 3263 	ld a,#5
      00A619 01               [ 4] 3264 	mul x,a
      00A61A 5F 97 A6         [ 2] 3265 	addw x,#GPIO_BASE 
      00A61D 84               [ 2] 3266 	pushw x 
      002896                       3267 	_xpop
      00A61E 5B 01            [ 1]    1     ld a,(y)
      00A620 81               [ 1]    2     ldw x,y 
      00A621 EE 01            [ 2]    3     ldw x,(1,x)
      00A621 52 02 CD 99      [ 2]    4     addw y,#CELL_SIZE 
      00A625 85 A1 02         [ 2] 3268 	addw x,(1,sp)
      0028A2                       3269 	_drop 2 
      00A628 27 03            [ 2]    1     addw sp,#2 
      00A62A CC               [ 1] 3270 	clr a 
      0028A5                       3271 	_store_top 	
      00A62B 96 C5            [ 1]    1     ld (y),a 
      00A62D 90 F6 93         [ 2]    2     ldw (1,y),x     
      00A630 EE 01            [ 1] 3272 	ld a,#TK_INTGR
      00A632 72               [ 4] 3273 	ret
      0028AD                       3274 bad_port:
      00A633 A9 00            [ 1] 3275 	ld a,#ERR_BAD_VALUE
      00A635 03 9F 6B         [ 2] 3276 	jp tb_error
                                   3277 
                                   3278 
                                   3279 ;-------------------------
                                   3280 ; BASIC: UFLASH 
                                   3281 ; return free flash address
                                   3282 ; input:
                                   3283 ;  none 
                                   3284 ; output:
                                   3285 ;	A		TK_INTGR
                                   3286 ;   xstack	free address 
                                   3287 ;---------------------------
      0028B2                       3288 uflash:
      00A638 02 90 F6         [ 2] 3289 	ldw x,app_sign
      00A63B 93 EE 01         [ 2] 3290 	cpw x,#4243 ; signature "BC" 
      00A63E 72 A9            [ 1] 3291 	jreq 1$
      00A640 00 03 A3         [ 2] 3292 	ldw x,app_size 
      00A643 00 0F 23         [ 2] 3293 	addw x,#app
      00A646 05 A6            [ 2] 3294 	jra 2$
      00A648 0A CC 96         [ 2] 3295 1$:	ldw x,#app_space 
      00A64B C7               [ 1] 3296 2$:	clr a 
      00A64C CD               [ 4] 3297 	ret 
                                   3298 
                                   3299 
                                   3300 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



                                   3301 ; BASIC: USR(addr[,arg])
                                   3302 ; execute a function written 
                                   3303 ; in binary code.
                                   3304 ; binary fonction should 
                                   3305 ; return token attribute in A 
                                   3306 ; and value in YL:X. 
                                   3307 ; input:
                                   3308 ;   addr	routine address 
                                   3309 ;   arg 	is an optional argument 
                                   3310 ; output:
                                   3311 ;   A 		token attribute 
                                   3312 ;   xstack  returned value 
                                   3313 ;---------------------
      0028C7                       3314 usr:
      00A64D AB               [ 2] 3315 	pushw x 
      00A64E 84 6B            [ 2] 3316 	pushw y 	
      00A650 01 A6 01         [ 4] 3317 	call func_args 
      00A653 0D 01            [ 1] 3318 	cp a,#1 
      00A655 27 05            [ 1] 3319 	jreq 1$
      00A657 48 0A            [ 1] 3320 	cp a,#2
      00A659 01 26            [ 1] 3321 	jreq 1$  
      00A65B FB 0D 02         [ 2] 3322 	jp syntax_error 
      00A65E 26               [ 1] 3323 1$: push a 
      0028D9                       3324 	_xpop 
      00A65F 05 43            [ 1]    1     ld a,(y)
      00A661 E4               [ 1]    2     ldw x,y 
      00A662 00 20            [ 2]    3     ldw x,(1,x)
      00A664 02 EA 00 E7      [ 2]    4     addw y,#CELL_SIZE 
      00A668 00 5B            [ 1] 3325 	ldw y,x  ; arg|addr 
      00A66A 02               [ 1] 3326     pop a 
      00A66B 81 01            [ 1] 3327 	cp a,#1 
      00A66C 27 0A            [ 1] 3328 	jreq 3$
      0028E9                       3329 	_xpop  ; x=code addr  
      00A66C 72 00            [ 1]    1     ld a,(y)
      00A66E 00               [ 1]    2     ldw x,y 
      00A66F 22 02            [ 2]    3     ldw x,(1,x)
      00A671 4F 81 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A673 51               [ 1] 3330 	exgw x,y ; y=code addr, x=arg 
      00A673 AE A6            [ 4] 3331 3$: call (y)
      00A675 9A               [ 1] 3332 	push a 
      00A676 CD 89            [ 1] 3333 	ld a,yl  
      0028F8                       3334 	_xpush 
      00A678 DA 5B 02 52      [ 2]    1     subw y,#CELL_SIZE
      00A67C 04 CD            [ 1]    2     ld (y),a 
      00A67E A0 0D AE         [ 2]    3     ldw (1,y),x 
      00A681 16               [ 1] 3335 	pop a 
      00A682 68 CF            [ 2] 3336 	popw y 
      00A684 00               [ 2] 3337 	popw x 
      00A685 05               [ 4] 3338 	ret 
                                   3339 
                                   3340 
                                   3341 ;------------------------------
                                   3342 ; BASIC: BYE 
                                   3343 ; halt mcu in its lowest power mode 
                                   3344 ; wait for reset or external interrupt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



                                   3345 ; do a cold start on wakeup.
                                   3346 ;------------------------------
      002906                       3347 bye:
      00A686 7F 72 5F 00 04   [ 2] 3348 	btjf UART1_SR,#UART_SR_TC,.
      00A68B 5F               [10] 3349 	halt
      00A68C CF 00 01         [ 2] 3350 	jp cold_start  
                                   3351 
                                   3352 ;----------------------------------
                                   3353 ; BASIC: SLEEP 
                                   3354 ; halt mcu until reset or external
                                   3355 ; interrupt.
                                   3356 ; Resume progam after SLEEP command
                                   3357 ;----------------------------------
      00290F                       3358 sleep:
      00A68F 72 11 00 22 72   [ 2] 3359 	btjf UART1_SR,#UART_SR_TC,.
      00A694 18 00 22 CC      [ 1] 3360 	bset flags,#FSLEEP
      00A698 97               [10] 3361 	halt 
      00A699 75               [ 4] 3362 	ret 
                                   3363 
                                   3364 ;-------------------------------
                                   3365 ; BASIC: PAUSE expr 
                                   3366 ; suspend execution for n msec.
                                   3367 ; input:
                                   3368 ;	none
                                   3369 ; output:
                                   3370 ;	none 
                                   3371 ;------------------------------
      00291A                       3372 pause:
      00A69A 0A 62 72         [ 4] 3373 	call expression
      00A69D 65 61            [ 1] 3374 	cp a,#TK_INTGR
      00A69F 6B 20            [ 1] 3375 	jreq 1$ 
      00A6A1 70 6F 69         [ 2] 3376 	jp syntax_error
      002924                       3377 1$: _xpop 
      00A6A4 6E 74            [ 1]    1     ld a,(y)
      00A6A6 2C               [ 1]    2     ldw x,y 
      00A6A7 20 52            [ 2]    3     ldw x,(1,x)
      00A6A9 55 4E 20 74      [ 2]    4     addw y,#CELL_SIZE 
      00292D                       3378 pause02:
      00A6AD 6F 20 72         [ 2] 3379 	ldw timer,x 
      00A6B0 65 73 75         [ 2] 3380 1$: ldw x,timer 
      00A6B3 6D               [ 2] 3381 	tnzw x 
      00A6B4 65 2E            [ 1] 3382 	jreq 2$
      00A6B6 0A               [10] 3383 	wfi 
      00A6B7 00 F7            [ 1] 3384 	jrne 1$
      00A6B8 4F               [ 1] 3385 2$:	clr a 
      00A6B8 72               [ 4] 3386 	ret 
                                   3387 
                                   3388 ;------------------------------
                                   3389 ; BASIC: AWU expr
                                   3390 ; halt mcu for 'expr' milliseconds
                                   3391 ; use Auto wakeup peripheral
                                   3392 ; all oscillators stopped except LSI
                                   3393 ; range: 1ms - 511ms
                                   3394 ; input:
                                   3395 ;  none
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



                                   3396 ; output:
                                   3397 ;  none:
                                   3398 ;------------------------------
      00293B                       3399 awu:
      00A6B9 01 00 22         [ 4] 3400   call expression
      00A6BC 01 81            [ 1] 3401   cp a,#TK_INTGR
      00A6BE 27 03            [ 1] 3402   jreq 1$
      00A6BE CD 95 21         [ 2] 3403   jp syntax_error
      002945                       3404 1$: _xpop 
      00A6C1 81 F6            [ 1]    1     ld a,(y)
      00A6C2 93               [ 1]    2     ldw x,y 
      00A6C2 72 5F            [ 2]    3     ldw x,(1,x)
      00A6C4 00 18 52 03      [ 2]    4     addw y,#CELL_SIZE 
      00294E                       3405 awu02:
      00A6C8 CD 97 CB         [ 2] 3406   cpw x,#5120
      00A6CB A1 04            [ 1] 3407   jrmi 1$ 
      00A6CD 27 03 CC 96      [ 1] 3408   mov AWU_TBR,#15 
      00A6D1 C5 CD            [ 1] 3409   ld a,#30
      00A6D3 98               [ 2] 3410   div x,a
      00A6D4 1B A4            [ 1] 3411   ld a,#16
      00A6D6 DF               [ 2] 3412   div x,a 
      00A6D7 A1 45            [ 2] 3413   jra 4$
      00295F                       3414 1$: 
      00A6D9 26 0C AE         [ 2] 3415   cpw x,#2048
      00A6DC 40 00            [ 1] 3416   jrmi 2$ 
      00A6DE CF 00 19 AE      [ 1] 3417   mov AWU_TBR,#14
      00A6E2 47 FF            [ 1] 3418   ld a,#80
      00A6E4 4F               [ 2] 3419   div x,a 
      00A6E5 20 15            [ 2] 3420   jra 4$   
      00296D                       3421 2$:
      00A6E7 A1 46 27 06      [ 1] 3422   mov AWU_TBR,#7
      002971                       3423 3$:  
                                   3424 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A6EB AE 96 05         [ 2] 3425   cpw x,#64 
      00A6EE CC 96            [ 2] 3426   jrule 4$ 
      00A6F0 C7 5C 50 F2      [ 1] 3427   inc AWU_TBR 
      00A6F1 54               [ 2] 3428   srlw x 
      00A6F1 AE B6            [ 2] 3429   jra 3$ 
      00297D                       3430 4$:
      00A6F3 00               [ 1] 3431   ld a, xl
      00A6F4 CF               [ 1] 3432   dec a 
      00A6F5 00 19            [ 1] 3433   jreq 5$
      00A6F7 A6               [ 1] 3434   dec a 	
      002982                       3435 5$: 
      00A6F8 02 AE            [ 1] 3436   and a,#0x3e 
      00A6FA 7F FF F1         [ 1] 3437   ld AWU_APR,a 
      00A6FC 72 18 50 F0      [ 1] 3438   bset AWU_CSR,#AWU_CSR_AWUEN
      00A6FC 6B               [10] 3439   halt 
                                   3440 
      00A6FD 01               [ 4] 3441   ret 
                                   3442 
                                   3443 ;------------------------------
                                   3444 ; BASIC: TICKS
                                   3445 ; return msec ticks counter value 
                                   3446 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



                                   3447 ; 	none 
                                   3448 ; output:
                                   3449 ;	X 		TK_INTGR
                                   3450 ;-------------------------------
      00298D                       3451 get_ticks:
      00A6FE 1F 02 CD         [ 2] 3452 	ldw x,ticks 
      00A701 87               [ 1] 3453 	clr a 
      002991                       3454 	_xpush 
      00A702 80 A2 00 03      [ 2]    1     subw y,#CELL_SIZE
      00A703 90 F7            [ 1]    2     ld (y),a 
      00A703 CD 88 FD         [ 2]    3     ldw (1,y),x 
      00A706 27 08            [ 1] 3455 	ld a,#TK_INTGR
      00A708 A6               [ 4] 3456 	ret 
                                   3457 
                                   3458 ;------------------------------
                                   3459 ; BASIC: ABS(expr)
                                   3460 ; return absolute value of expr.
                                   3461 ; input:
                                   3462 ;   none
                                   3463 ; output:
                                   3464 ;   xstack    positive int24 
                                   3465 ;-------------------------------
      00299D                       3466 abs:
      00A709 45 CD 89         [ 4] 3467 	call func_args 
      00A70C 7D CD            [ 1] 3468 	cp a,#1 
      00A70E 87 FE            [ 1] 3469 	jreq 0$ 
      00A710 AE 00 80         [ 2] 3470 	jp syntax_error
      0029A7                       3471 0$:  
      00A713 CD 88 EF         [ 4] 3472 	call abs24 
      00A716 7B 01            [ 1] 3473     ld a,#TK_INTGR 
      00A718 1E               [ 4] 3474 	ret 
                                   3475 
                                   3476 ;------------------------------
                                   3477 ; BASIC: AND(expr1,expr2)
                                   3478 ; Apply bit AND relation between
                                   3479 ; the 2 arguments, i.e expr1 & expr2 
                                   3480 ; output:
                                   3481 ; 	A 		TK_INTGR
                                   3482 ;   X 		result 
                                   3483 ;------------------------------
      0029AD                       3484 bit_and: ; i1 i2 -- i1 & i2 
      00A719 02 72 B0         [ 4] 3485 	call func_args 
      00A71C 00 19            [ 1] 3486 	cp a,#2
      00A71E C2 00            [ 1] 3487 	jreq 1$
      00A720 18 22 E0         [ 2] 3488 	jp syntax_error 
      0029B7                       3489 1$:	_xpop 
      00A723 CD 95            [ 1]    1     ld a,(y)
      00A725 21               [ 1]    2     ldw x,y 
      00A726 1E 02            [ 2]    3     ldw x,(1,x)
      00A728 A3 47 FF 26      [ 2]    4     addw y,#CELL_SIZE 
      00A72C 03               [ 2] 3490     pushw x 
      00A72D CD               [ 1] 3491 	push  a 
      0029C2                       3492 	_at_top 
      00A72E 9C E5            [ 1]    1     ld a,(y)
      00A730 93               [ 1]    2     ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



      00A730 5B 03            [ 2]    3     ldw x,(1,x)
      00A732 81 01            [ 1] 3493 	and a,(1,sp)
      00A733 02               [ 1] 3494 	rlwa x 
      00A733 CE B6            [ 1] 3495 	and a,(2,sp)
      00A735 00               [ 1] 3496 	rlwa x 
      00A736 C3 A7            [ 1] 3497 	and a,(3,sp)
      00A738 F3               [ 1] 3498 	rlwa x 
      0029D0                       3499 	_drop 3 
      00A739 81 03            [ 2]    1     addw sp,#3 
      00A73A                       3500 	_store_top 
      00A73A 88 4D            [ 1]    1     ld (y),a 
      00A73C 27 0A F6         [ 2]    2     ldw (1,y),x     
      00A73F 5C 90            [ 1] 3501 	ld a,#TK_INTGR
      00A741 F7               [ 4] 3502 	ret
                                   3503 
                                   3504 ;------------------------------
                                   3505 ; BASIC: OR(expr1,expr2)
                                   3506 ; Apply bit OR relation between
                                   3507 ; the 2 arguments, i.e expr1 | expr2 
                                   3508 ; output:
                                   3509 ; 	A 		TK_INTGR
                                   3510 ;   X 		result 
                                   3511 ;------------------------------
      0029DA                       3512 bit_or:
      00A742 90 5C 0A         [ 4] 3513 	call func_args 
      00A745 01 26            [ 1] 3514 	cp a,#2
      00A747 F6 84            [ 1] 3515 	jreq 1$
      00A749 81 16 45         [ 2] 3516 	jp syntax_error 
      00A74A                       3517 1$:	_xpop 
      00A74A 88 90            [ 1]    1     ld a,(y)
      00A74C AE               [ 1]    2     ldw x,y 
      00A74D 16 B8            [ 2]    3     ldw x,(1,x)
      00A74F 90 89 A6 80      [ 2]    4     addw y,#CELL_SIZE 
      00A753 90               [ 2] 3518     pushw x 
      00A754 7F               [ 1] 3519 	push  a 
      0029EF                       3520 	_at_top 
      00A755 90 5C            [ 1]    1     ld a,(y)
      00A757 4A               [ 1]    2     ldw x,y 
      00A758 26 F9            [ 2]    3     ldw x,(1,x)
      00A75A 90 85            [ 1] 3521 	or a,(1,sp)
      00A75C 84 81            [ 1] 3522 	ld yl,a 
      00A75E 9E               [ 1] 3523 	ld a,xh 
      00A75E 89 90            [ 1] 3524 	or a,(2,sp)
      00A760 89               [ 1] 3525 	ld xh,a 
      00A761 52               [ 1] 3526 	ld a,xl 
      00A762 06 CD            [ 1] 3527 	or a,(3,sp)
      00A764 A7               [ 1] 3528 	ld xl,a 
      00A765 33 26            [ 1] 3529 	ld a,yl 
      002A02                       3530 	_drop 3 
      00A767 09 AE            [ 2]    1     addw sp,#3 
      002A04                       3531 	_store_top 
      00A769 A7 F5            [ 1]    1     ld (y),a 
      00A76B CD 89 DA         [ 2]    2     ldw (1,y),x     
      00A76E CC A7            [ 1] 3532 	ld a,#TK_INTGR
      00A770 ED               [ 4] 3533 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



                                   3534 
                                   3535 ;------------------------------
                                   3536 ; BASIC: XOR(expr1,expr2)
                                   3537 ; Apply bit XOR relation between
                                   3538 ; the 2 arguments, i.e expr1 ^ expr2 
                                   3539 ; output:
                                   3540 ; 	A 		TK_INTGR
                                   3541 ;   X 		result 
                                   3542 ;------------------------------
      00A771                       3543 bit_xor:
      00A771 CE 00 1B         [ 4] 3544 	call func_args 
      00A774 C3 00            [ 1] 3545 	cp a,#2
      00A776 1D 25            [ 1] 3546 	jreq 1$
      00A778 09 AE A8         [ 2] 3547 	jp syntax_error 
      002A16                       3548 1$:	_xpop 
      00A77B 37 CD            [ 1]    1     ld a,(y)
      00A77D 89               [ 1]    2     ldw x,y 
      00A77E DA CC            [ 2]    3     ldw x,(1,x)
      00A780 A7 ED 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A782 89               [ 2] 3549     pushw x 
      00A782 CD               [ 1] 3550 	push  a 
      002A21                       3551 	_at_top 
      00A783 87 C0            [ 1]    1     ld a,(y)
      00A785 72               [ 1]    2     ldw x,y 
      00A786 5F 00            [ 2]    3     ldw x,(1,x)
      00A788 18 AE            [ 1] 3552 	xor a,(1,sp)
      00A78A B6 00            [ 1] 3553 	ld yl,a 
      00A78C CF               [ 1] 3554 	ld a,xh 
      00A78D 00 19            [ 1] 3555 	xor a,(2,sp)
      00A78F CD               [ 1] 3556 	ld xh,a 
      00A790 9D               [ 1] 3557 	ld a,xl 
      00A791 FA 1F            [ 1] 3558 	xor a,(3,sp)
      00A793 05               [ 1] 3559 	ld xl,a 
      00A794 0F 03            [ 1] 3560 	ld a,yl 
      002A34                       3561 	_drop 3 
      00A796 CD A7            [ 2]    1     addw sp,#3 
      002A36                       3562 	_store_top 
      00A798 4A CE            [ 1]    1     ld (y),a 
      00A79A A7 F3 90         [ 2]    2     ldw (1,y),x     
      00A79D FF 72            [ 1] 3563 	ld a,#TK_INTGR
      00A79F A9               [ 4] 3564 	ret
                                   3565 
                                   3566 ;------------------------------
                                   3567 ; BASIC: LSHIFT(expr1,expr2)
                                   3568 ; logical shift left expr1 by 
                                   3569 ; expr2 bits 
                                   3570 ; output:
                                   3571 ; 	A 		TK_INTGR
                                   3572 ;   X 		result 
                                   3573 ;------------------------------
      002A3E                       3574 lshift:
      00A7A0 00 02 1E         [ 4] 3575 	call func_args
      00A7A3 05 90            [ 1] 3576 	cp a,#2 
      00A7A5 FF 72            [ 1] 3577 	jreq 1$
      00A7A7 A9 00 02         [ 2] 3578 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



      002A48                       3579 1$: _xpop 
      00A7AA A6 7C            [ 1]    1     ld a,(y)
      00A7AC 6B               [ 1]    2     ldw x,y 
      00A7AD 04 A3            [ 2]    3     ldw x,(1,x)
      00A7AF 00 7C 22 01      [ 2]    4     addw y,#CELL_SIZE 
      00A7B3 9F 6B            [ 1] 3580     ldw y,x    
      002A53                       3581 	_at_top  ; T@ 
      00A7B5 04 CE            [ 1]    1     ld a,(y)
      00A7B7 00               [ 1]    2     ldw x,y 
      00A7B8 1B 1F            [ 2]    3     ldw x,(1,x)
      00A7BA 01 5D            [ 2] 3582 	tnzw y 
      00A7BB 27 07            [ 1] 3583 	jreq 4$
      00A7BB 1E               [ 1] 3584 2$:	rcf 
      00A7BC 01               [ 2] 3585 	rlcw x 
      00A7BD 7B               [ 1] 3586 	rlc a 
      00A7BE 04 CD            [ 2] 3587 	decw y 
      00A7C0 A7 3A            [ 1] 3588 	jrne 2$
      002A63                       3589 4$: _store_top  ; T! 
      00A7C2 1F 01            [ 1]    1     ld (y),a 
      00A7C4 AE 16 B8         [ 2]    2     ldw (1,y),x     
      00A7C7 CD 87            [ 1] 3590 	ld a,#TK_INTGR
      00A7C9 DA               [ 4] 3591 	ret
                                   3592 
                                   3593 ;------------------------------
                                   3594 ; BASIC: RSHIFT(expr1,expr2)
                                   3595 ; logical shift right expr1 by 
                                   3596 ; expr2 bits.
                                   3597 ; output:
                                   3598 ; 	A 		TK_INTGR
                                   3599 ;   X 		result 
                                   3600 ;------------------------------
      002A6B                       3601 rshift:
      00A7CA AE 00 80         [ 4] 3602 	call func_args
      00A7CD CD 88            [ 1] 3603 	cp a,#2 
      00A7CF EF 1E            [ 1] 3604 	jreq 1$
      00A7D1 01 C3 00         [ 2] 3605 	jp syntax_error
      002A75                       3606 1$: _xpop 
      00A7D4 1D 24            [ 1]    1     ld a,(y)
      00A7D6 16               [ 1]    2     ldw x,y 
      00A7D7 1E 05            [ 2]    3     ldw x,(1,x)
      00A7D9 72 F0 03 1F      [ 2]    4     addw y,#CELL_SIZE 
      00A7DD 05 A6            [ 1] 3607     ldw y,x   
      002A80                       3608 	_at_top  ; T@  
      00A7DF 80 A3            [ 1]    1     ld a,(y)
      00A7E1 00               [ 1]    2     ldw x,y 
      00A7E2 80 24            [ 2]    3     ldw x,(1,x)
      00A7E4 01 9F            [ 2] 3609 	tnzw y 
      00A7E6 6B 04            [ 1] 3610 	jreq 4$
      00A7E8 CD               [ 1] 3611 2$:	rcf 
      00A7E9 A7               [ 2] 3612 	rrcw x
      00A7EA 4A               [ 1] 3613 	rrc a  
      00A7EB 20 CE            [ 2] 3614 	decw y 
      00A7ED 5B 06            [ 1] 3615 	jrne 2$
      002A90                       3616 4$: _store_top  ; T! 
      00A7EF 90 85            [ 1]    1     ld (y),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



      00A7F1 85 81 42         [ 2]    2     ldw (1,y),x     
      00A7F4 43 43            [ 1] 3617 	ld a,#TK_INTGR
      00A7F6 61               [ 4] 3618 	ret
                                   3619 
                                   3620 ;--------------------------
                                   3621 ; BASIC: FCPU integer
                                   3622 ; set CPU frequency 
                                   3623 ;-------------------------- 
                                   3624 
      002A98                       3625 fcpu:
      00A7F7 6E 27            [ 1] 3626 	ld a,#TK_INTGR
      00A7F9 74 20 66         [ 4] 3627 	call expect 
      00A7FC 6C 61 73         [ 4] 3628 	call get_int24 
      00A7FF 68               [ 1] 3629 	ld a,xl 
      00A800 20 61            [ 1] 3630 	and a,#7 
      00A802 70 70 6C         [ 1] 3631 	ld CLK_CKDIVR,a 
      00A805 69               [ 4] 3632 	ret 
                                   3633 
                                   3634 ;------------------------------
                                   3635 ; BASIC: PMODE pin#, mode 
                                   3636 ; Arduino pin. 
                                   3637 ; define pin as input or output
                                   3638 ; pin#: {0..15}
                                   3639 ; mode: INPUT|OUTPUT  
                                   3640 ;------------------------------
                           000001  3641 	PINNO=1
                           000001  3642 	VSIZE=1
      002AA7                       3643 pin_mode:
      002AA7                       3644 	_vars VSIZE 
      00A806 63 61            [ 2]    1     sub sp,#VSIZE 
      00A808 74 69 6F         [ 4] 3645 	call arg_list 
      00A80B 6E 2C            [ 1] 3646 	cp a,#2 
      00A80D 20 61            [ 1] 3647 	jreq 1$
      00A80F 6C 72 65         [ 2] 3648 	jp syntax_error 
      002AB3                       3649 1$: _xpop 
      00A812 61 64            [ 1]    1     ld a,(y)
      00A814 79               [ 1]    2     ldw x,y 
      00A815 20 6F            [ 2]    3     ldw x,(1,x)
      00A817 6E 65 20 69      [ 2]    4     addw y,#CELL_SIZE 
      00A81B 6E 20            [ 1] 3650 	ldw y,x ; mode 
      002ABE                       3651 	_xpop ; Dx pin 
      00A81D 46 4C            [ 1]    1     ld a,(y)
      00A81F 41               [ 1]    2     ldw x,y 
      00A820 53 48            [ 2]    3     ldw x,(1,x)
      00A822 0A 75 73 65      [ 2]    4     addw y,#CELL_SIZE 
      00A826 20 45 52         [ 4] 3652 	call select_pin 
      00A829 41 53            [ 1] 3653 	ld (PINNO,sp),a  
      00A82B 45 20            [ 1] 3654 	ld a,#1 
      00A82D 5C 46            [ 1] 3655 	tnz (PINNO,sp)
      00A82F 20 62            [ 1] 3656 	jreq 4$
      00A831 65               [ 1] 3657 2$:	sll a 
      00A832 66 6F            [ 1] 3658 	dec (PINNO,sp)
      00A834 72 65            [ 1] 3659 	jrne 2$ 
      00A836 00 4E            [ 1] 3660 	ld (PINNO,sp),a
      00A838 6F 20            [ 1] 3661 	ld a,(PINNO,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



      00A83A 61 70            [ 1] 3662 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A83C 70 6C            [ 1] 3663 	ld (GPIO_CR1,x),a 
      00A83E 69 63 61 74      [ 2] 3664 4$:	cpw y,#OUTP 
      00A842 69 6F            [ 1] 3665 	jreq 6$
                                   3666 ; input mode
                                   3667 ; disable external interrupt 
      00A844 6E 20            [ 1] 3668 	ld a,(PINNO,sp)
      00A846 69               [ 1] 3669 	cpl a 
      00A847 6E 20            [ 1] 3670 	and a,(GPIO_CR2,x)
      00A849 52 41            [ 1] 3671 	ld (GPIO_CR2,x),a 
                                   3672 ;clear bit in DDR for input mode 
      00A84B 4D 00            [ 1] 3673 	ld a,(PINNO,sp)
      00A84D 43               [ 1] 3674 	cpl a 
      00A84D CD 9A            [ 1] 3675 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A84F B7 A1            [ 1] 3676 	ld (GPIO_DDR,x),a 
      00A851 84 27            [ 2] 3677 	jra 9$
      002AF5                       3678 6$: ;output mode  
      00A853 03 CC            [ 1] 3679 	ld a,(PINNO,sp)
      00A855 96 C5            [ 1] 3680 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A857 90 F6            [ 1] 3681 	ld (GPIO_DDR,x),a 
      00A859 93 EE            [ 1] 3682 	ld a,(PINNO,sp)
      00A85B 01 72            [ 1] 3683 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A85D A9 00            [ 1] 3684 	ld (GPIO_CR2,x),a 
      002B01                       3685 9$:	
      002B01                       3686 	_drop VSIZE 
      00A85F 03 C7            [ 2]    1     addw sp,#VSIZE 
      00A861 00               [ 4] 3687 	ret
                                   3688 
                                   3689 ;------------------------
                                   3690 ; select Arduino pin 
                                   3691 ; input:
                                   3692 ;   X 	 {0..15} Arduino Dx 
                                   3693 ; output:
                                   3694 ;   A     stm8s208 pin 
                                   3695 ;   X     base address s208 GPIO port 
                                   3696 ;---------------------------
      002B04                       3697 select_pin:
      00A862 18               [ 2] 3698 	sllw x 
      00A863 CF 00 19         [ 2] 3699 	addw x,#arduino_to_8s208 
      00A866 FE               [ 2] 3700 	ldw x,(x)
      00A866 CD               [ 1] 3701 	ld a,xl 
      00A867 97               [ 1] 3702 	push a 
      00A868 CB               [ 1] 3703 	swapw x 
      00A869 A1 08            [ 1] 3704 	ld a,#5 
      00A86B 27               [ 4] 3705 	mul x,a 
      00A86C 02 20 20         [ 2] 3706 	addw x,#GPIO_BASE 
      00A86F CD               [ 1] 3707 	pop a 
      00A870 9A               [ 4] 3708 	ret 
                                   3709 ; translation from Arduino D0..D15 to stm8s208rb 
      002B14                       3710 arduino_to_8s208:
      00A871 B7 A1                 3711 .byte 3,6 ; D0 
      00A873 84 27                 3712 .byte 3,5 ; D1 
      00A875 03 CC                 3713 .byte 4,0 ; D2 
      00A877 96 C5                 3714 .byte 2,1 ; D3
      00A879 90 F6                 3715 .byte 6,0 ; D4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



      00A87B 93 EE                 3716 .byte 2,2 ; D5
      00A87D 01 72                 3717 .byte 2,3 ; D6
      00A87F A9 00                 3718 .byte 3,1 ; D7
      00A881 03 9F                 3719 .byte 3,3 ; D8
      00A883 5F CD                 3720 .byte 2,4 ; D9
      00A885 88 1F                 3721 .byte 4,5 ; D10
      00A887 AE 00                 3722 .byte 2,6 ; D11
      00A889 01 CD                 3723 .byte 2,7 ; D12
      00A88B 88 EF                 3724 .byte 2,5 ; D13
      00A88D 20 D7                 3725 .byte 4,2 ; D14
      00A88F 04 01                 3726 .byte 4,1 ; D15
                                   3727 
                                   3728 
                                   3729 ;------------------------------
                                   3730 ; BASIC: RND(expr)
                                   3731 ; return random number 
                                   3732 ; between 1 and expr inclusive
                                   3733 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   3734 ; input:
                                   3735 ; 	none 
                                   3736 ; output:
                                   3737 ;	xstack 	random positive integer 
                                   3738 ;------------------------------
      002B34                       3739 random:
      00A88F 81 19 00         [ 4] 3740 	call func_args 
      00A890 A1 01            [ 1] 3741 	cp a,#1
      00A890 CD 99            [ 1] 3742 	jreq 1$
      00A892 80 A1 01         [ 2] 3743 	jp syntax_error
      002B3E                       3744 1$:  
      002B3E                       3745 	_xpop   
      00A895 27 03            [ 1]    1     ld a,(y)
      00A897 CC               [ 1]    2     ldw x,y 
      00A898 96 C5            [ 2]    3     ldw x,(1,x)
      00A89A 90 F6 93 EE      [ 2]    4     addw y,#CELL_SIZE 
      00A89E 01               [ 2] 3746 	pushw x 
      00A89F 72               [ 1] 3747 	push a  
      00A8A0 A9 00            [ 1] 3748 	ld a,#0x80 
      00A8A2 03 9F            [ 1] 3749 	bcp a,(1,sp)
      00A8A4 A4 7F            [ 1] 3750 	jreq 2$
      00A8A6 81 0A            [ 1] 3751 	ld a,#ERR_BAD_VALUE
      00A8A7 CC 16 47         [ 2] 3752 	jp tb_error
      002B54                       3753 2$: 
                                   3754 ; acc16=(x<<5)^x 
      00A8A7 A6 06 CD         [ 2] 3755 	ldw x,seedx 
      00A8AA 99               [ 2] 3756 	sllw x 
      00A8AB 73               [ 2] 3757 	sllw x 
      00A8AC CD               [ 2] 3758 	sllw x 
      00A8AD 97               [ 2] 3759 	sllw x 
      00A8AE CB               [ 2] 3760 	sllw x 
      00A8AF A1               [ 1] 3761 	ld a,xh 
      00A8B0 02 27 0E         [ 1] 3762 	xor a,seedx 
      00A8B3 A1 04 27         [ 1] 3763 	ld acc16,a 
      00A8B6 12               [ 1] 3764 	ld a,xl 
      00A8B7 A1 82 27         [ 1] 3765 	xor a,seedx+1 
      00A8BA 03 CC 96         [ 1] 3766 	ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



                                   3767 ; seedx=seedy 
      00A8BD C5 00 15         [ 2] 3768 	ldw x,seedy 
      00A8BE CF 00 13         [ 2] 3769 	ldw seedx,x  
                                   3770 ; seedy=seedy^(seedy>>1)
      00A8BE FD 20            [ 2] 3771 	srlw y 
      00A8C0 0B 9E            [ 1] 3772 	ld a,yh 
      00A8C1 C8 00 15         [ 1] 3773 	xor a,seedy 
      00A8C1 F6 88 CD         [ 1] 3774 	ld seedy,a  
      00A8C4 97 F2            [ 1] 3775 	ld a,yl 
      00A8C6 84 20 03         [ 1] 3776 	xor a,seedy+1 
      00A8C9 C7 00 16         [ 1] 3777 	ld seedy+1,a 
                                   3778 ; acc16>>3 
      00A8C9 CD 98 1B         [ 2] 3779 	ldw x,acc16 
      00A8CC 5F               [ 2] 3780 	srlw x 
      00A8CD 02               [ 2] 3781 	srlw x 
      00A8CE 72               [ 2] 3782 	srlw x 
                                   3783 ; x=acc16^x 
      00A8CF A2               [ 1] 3784 	ld a,xh 
      00A8D0 00 03 90         [ 1] 3785 	xor a,acc16 
      00A8D3 F7               [ 1] 3786 	ld xh,a 
      00A8D4 90               [ 1] 3787 	ld a,xl 
      00A8D5 EF 01 A6         [ 1] 3788 	xor a,acc8 
      00A8D8 07               [ 1] 3789 	ld xl,a 
                                   3790 ; seedy=x^seedy 
      00A8D9 CD 99 73         [ 1] 3791 	xor a,seedy+1
      00A8DC 97               [ 1] 3792 	ld xl,a 
      00A8DC 90               [ 1] 3793 	ld a,xh 
      00A8DD F6 93 EE         [ 1] 3794 	xor a,seedy
      00A8E0 01               [ 1] 3795 	ld xh,a 
      00A8E1 72 A9 00         [ 2] 3796 	ldw seedy,x 
                                   3797 ; return seedy modulo expr + 1 
      00A8E4 03 81 14         [ 1] 3798 	ld a,seedx+1 
      00A8E6                       3799 	_xpush 
      00A8E6 CD 89 8D 81      [ 2]    1     subw y,#CELL_SIZE
      00A8EA 90 F7            [ 1]    2     ld (y),a 
      00A8EA 5F C6 00         [ 2]    3     ldw (1,y),x 
      00A8ED 2E               [ 1] 3800 	pop a 
      00A8EE C0               [ 2] 3801 	popw x 
      002BAC                       3802 	_xpush 
      00A8EF 00 2F 27 03      [ 2]    1     subw y,#CELL_SIZE
      00A8F3 53 A6            [ 1]    2     ld (y),a 
      00A8F5 FF EF 01         [ 2]    3     ldw (1,y),x 
      00A8F6 CD 02 E5         [ 4] 3803 	call div24 
      002BB8                       3804 10$:
      00A8F6 81 84            [ 1] 3805 	ld a,#TK_INTGR
      00A8F7 81               [ 4] 3806 	ret 
                                   3807 
                                   3808 ;---------------------------------
                                   3809 ; BASIC: WORDS 
                                   3810 ; affiche la listes des mots du
                                   3811 ; dictionnaire ainsi que le nombre
                                   3812 ; de mots.
                                   3813 ;---------------------------------
                           000001  3814 	WLEN=1 ; word length
                           000002  3815 	LLEN=2 ; character sent to console
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



                           000003  3816 	WCNT=3 ; count words printed 
                           000003  3817 	VSIZE=3 
      002BBB                       3818 words:
      002BBB                       3819 	_vars VSIZE
      00A8F7 CD 99            [ 2]    1     sub sp,#VSIZE 
      00A8F9 80 A1            [ 1] 3820 	clr (LLEN,sp)
      00A8FB 02 27            [ 1] 3821 	clr (WCNT,sp)
      00A8FD 03 CC 96 C5      [ 2] 3822 	ldw y,#kword_dict+2
      00A901 90               [ 1] 3823 0$:	ldw x,y
      00A902 E6               [ 1] 3824 	ld a,(x)
      00A903 03 93            [ 1] 3825 	and a,#15 
      00A905 EE 04            [ 1] 3826 	ld (WLEN,sp),a 
      00A907 5D 2B            [ 1] 3827 	inc (WCNT,sp)
      00A909 23               [ 1] 3828 1$:	incw x 
      00A90A A3               [ 1] 3829 	ld a,(x)
      00A90B 00 09 2A         [ 4] 3830 	call putc 
      00A90E 1E A6            [ 1] 3831 	inc (LLEN,sp)
      00A910 05 42            [ 1] 3832 	dec (WLEN,sp)
      00A912 1C 50            [ 1] 3833 	jrne 1$
      00A914 00 89            [ 1] 3834 	ld a,#70
      00A916 90 F6            [ 1] 3835 	cp a,(LLEN,sp)
      00A918 93 EE            [ 1] 3836 	jrmi 2$   
      00A91A 01 72            [ 1] 3837 	ld a,#SPACE 
      00A91C A9 00 03         [ 4] 3838 	call putc 
      00A91F 72 FB            [ 1] 3839 	inc (LLEN,sp) 
      00A921 01 5B            [ 2] 3840 	jra 3$
      00A923 02 4F            [ 1] 3841 2$: ld a,#CR 
      00A925 90 F7 90         [ 4] 3842 	call putc 
      00A928 EF 01            [ 1] 3843 	clr (LLEN,sp)
      00A92A A6 84 81 02      [ 2] 3844 3$:	subw y,#2 
      00A92D 90 FE            [ 2] 3845 	ldw y,(y)
      00A92D A6 0A            [ 1] 3846 	jrne 0$ 
      00A92F CC 96            [ 1] 3847 	ld a,#CR 
      00A931 C7 08 FD         [ 4] 3848 	call putc  
      00A932 5F               [ 1] 3849 	clrw x 
      00A932 CE B6            [ 1] 3850 	ld a,(WCNT,sp)
      00A934 00               [ 1] 3851 	ld xl,a 
      00A935 A3 10 93         [ 4] 3852 	call prt_i16 
      00A938 27 08 CE         [ 2] 3853 	ldw x,#words_count_msg
      00A93B B6 02 1C         [ 4] 3854 	call puts 
      002C08                       3855 	_drop VSIZE 
      00A93E B6 04            [ 2]    1     addw sp,#VSIZE 
      00A940 20               [ 4] 3856 	ret 
      00A941 03 AE B6 00 4F 81 20  3857 words_count_msg: .asciz " words in dictionary\n"
             69 6E 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   3858 
                                   3859 
                                   3860 ;-----------------------------
                                   3861 ; BASIC: TIMER expr 
                                   3862 ; initialize count down timer 
                                   3863 ;-----------------------------
      00A947                       3864 set_timer:
      00A947 89 90 89         [ 4] 3865 	call arg_list
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



      00A94A CD 99            [ 1] 3866 	cp a,#1 
      00A94C 80 A1            [ 1] 3867 	jreq 1$
      00A94E 01 27 07         [ 2] 3868 	jp syntax_error
      002C2B                       3869 1$: 
      002C2B                       3870 	_xpop  
      00A951 A1 02            [ 1]    1     ld a,(y)
      00A953 27               [ 1]    2     ldw x,y 
      00A954 03 CC            [ 2]    3     ldw x,(1,x)
      00A956 96 C5 88 90      [ 2]    4     addw y,#CELL_SIZE 
      00A95A F6 93 EE         [ 2] 3871 	ldw timer,x 
      00A95D 01               [ 4] 3872 	ret 
                                   3873 
                                   3874 ;------------------------------
                                   3875 ; BASIC: TIMEOUT 
                                   3876 ; return state of timer 
                                   3877 ;------------------------------
      002C38                       3878 timeout:
      00A95E 72 A9 00         [ 2] 3879 	ldw x,timer 
      002C3B                       3880 logical_complement:
      00A961 03 90            [ 1] 3881 	ld a,#255 
      00A963 93               [ 2] 3882 	cplw x 
      00A964 84 A1 01         [ 2] 3883 	cpw x,#-1
      00A967 27 0A            [ 1] 3884 	jreq 2$
      00A969 90               [ 1] 3885 	clrw x
      00A96A F6               [ 1] 3886 	clr a 
      002C45                       3887 2$:	_xpush  
      00A96B 93 EE 01 72      [ 2]    1     subw y,#CELL_SIZE
      00A96F A9 00            [ 1]    2     ld (y),a 
      00A971 03 51 90         [ 2]    3     ldw (1,y),x 
      00A974 FD 88            [ 1] 3888 	ld a,#TK_INTGR
      00A976 90               [ 4] 3889 	ret 
                                   3890 
                                   3891 ;--------------------------------
                                   3892 ; BASIC NOT(expr) 
                                   3893 ; return logical complement of expr
                                   3894 ;--------------------------------
      002C51                       3895 func_not:
      00A977 9F 72 A2         [ 4] 3896 	call func_args  
      00A97A 00 03            [ 1] 3897 	cp a,#1
      00A97C 90 F7            [ 1] 3898 	jreq 1$
      00A97E 90 EF 01         [ 2] 3899 	jp syntax_error
      002C5B                       3900 1$:  
      00A981 84 90 85         [ 4] 3901 	call cpl24 
      00A984 85 81            [ 1] 3902 	ld a,#TK_INTGR
      00A986 81               [ 4] 3903 	ret 
                                   3904 
                                   3905 
                                   3906 
                                   3907 ;-----------------------------------
                                   3908 ; BASIC: IWDGEN expr1 
                                   3909 ; enable independant watchdog timer
                                   3910 ; expr1 is delay in multiple of 62.5µsec
                                   3911 ; expr1 -> {1..16383}
                                   3912 ;-----------------------------------
      002C61                       3913 enable_iwdg:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



      00A986 72 0D 52         [ 4] 3914 	call arg_list
      00A989 30 FB            [ 1] 3915 	cp a,#1 
      00A98B 8E CC            [ 1] 3916 	jreq 1$
      00A98D 81 32 45         [ 2] 3917 	jp syntax_error 
      00A98F                       3918 1$: _xpop  
      00A98F 72 0D            [ 1]    1     ld a,(y)
      00A991 52               [ 1]    2     ldw x,y 
      00A992 30 FB            [ 2]    3     ldw x,(1,x)
      00A994 72 16 00 22      [ 2]    4     addw y,#CELL_SIZE 
      00A998 8E 81            [ 1] 3919 	push #0
      00A99A 35 CC 50 E0      [ 1] 3920 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A99A CD               [ 1] 3921 	ld a,xh 
      00A99B 9A B7            [ 1] 3922 	and a,#0x3f
      00A99D A1               [ 1] 3923 	ld xh,a  
      00A99E 84 27 03         [ 2] 3924 2$:	cpw x,#255
      00A9A1 CC 96            [ 2] 3925 	jrule 3$
      00A9A3 C5 90            [ 1] 3926 	inc (1,sp)
      00A9A5 F6               [ 1] 3927 	rcf 
      00A9A6 93               [ 2] 3928 	rrcw x 
      00A9A7 EE 01            [ 2] 3929 	jra 2$
      00A9A9 72 A9 00 03      [ 1] 3930 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A9AD 84               [ 1] 3931 	pop a  
      00A9AD CF 00 12         [ 1] 3932 	ld IWDG_PR,a 
      00A9B0 CE               [ 1] 3933 	ld a,xl
      00A9B1 00               [ 1] 3934 	dec a 
      00A9B2 12 5D 27 03      [ 1] 3935 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A9B6 8F 26 F7         [ 1] 3936 	ld IWDG_RLR,a 
      00A9B9 4F 81 50 E0      [ 1] 3937 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A9BB 81               [ 4] 3938 	ret 
                                   3939 
                                   3940 
                                   3941 ;-----------------------------------
                                   3942 ; BASIC: IWDGREF  
                                   3943 ; refresh independant watchdog count down 
                                   3944 ; timer before it reset MCU. 
                                   3945 ;-----------------------------------
      002C9F                       3946 refresh_iwdg:
      00A9BB CD 9A B7 A1      [ 1] 3947 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A9BF 84               [ 4] 3948 	ret 
                                   3949 
                                   3950 
                                   3951 ;-------------------------------------
                                   3952 ; BASIC: LOG(expr)
                                   3953 ; return logarithm base 2 of expr 
                                   3954 ; this is the position of most significant
                                   3955 ; bit set. 
                                   3956 ; input: 
                                   3957 ; output:
                                   3958 ;   A     TK_INTGR 
                                   3959 ;   xstack log2 
                                   3960 ;*********************************
      002CA4                       3961 log2:
      00A9C0 27 03 CC         [ 4] 3962 	call func_args 
      00A9C3 96 C5            [ 1] 3963 	cp a,#1 
      00A9C5 90 F6            [ 1] 3964 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



      00A9C7 93 EE 01         [ 2] 3965 	jp syntax_error 
      002CAE                       3966 1$: _at_top   
      00A9CA 72 A9            [ 1]    1     ld a,(y)
      00A9CC 00               [ 1]    2     ldw x,y 
      00A9CD 03 01            [ 2]    3     ldw x,(1,x)
      00A9CE                       3967 leading_one:
      00A9CE A3               [ 1] 3968 	tnz a
      00A9CF 14 00            [ 1] 3969 	jrne 2$ 
      00A9D1 2B               [ 2] 3970 	tnzw x 
      00A9D2 0C 35            [ 1] 3971 	jrne 2$
      00A9D4 0F               [ 1] 3972 	inc a  
      00A9D5 50 F2            [ 2] 3973 	jra 9$
      00A9D7 A6 1E            [ 1] 3974 2$:	push #24  
      00A9D9 62               [ 2] 3975 3$: rlcw x 
      00A9DA A6               [ 1] 3976     rlc a 
      00A9DB 10 62            [ 1] 3977 	jrc 4$
      00A9DD 20 1E            [ 1] 3978 	dec (1,sp) 
      00A9DF 26 F8            [ 1] 3979 	jrne 3$
      00A9DF A3               [ 1] 3980 4$: clrw x 
      00A9E0 08               [ 1] 3981     pop a 
      00A9E1 00               [ 1] 3982 	ld xl,a 
      00A9E2 2B               [ 1] 3983 	clr a 
      002CCA                       3984 9$:	_store_top 
      00A9E3 09 35            [ 1]    1     ld (y),a 
      00A9E5 0E 50 F2         [ 2]    2     ldw (1,y),x     
      00A9E8 A6 50            [ 1] 3985 	ld a,#TK_INTGR
      00A9EA 62               [ 4] 3986 	ret 
                                   3987 
                                   3988 ;-----------------------------------
                                   3989 ; BASIC: BIT(expr) 
                                   3990 ; expr ->{0..15}
                                   3991 ; return 2^expr 
                                   3992 ; output:
                                   3993 ;    x    2^expr 
                                   3994 ;-----------------------------------
      002CD2                       3995 bitmask:
      00A9EB 20 10 00         [ 4] 3996     call func_args 
      00A9ED A1 01            [ 1] 3997 	cp a,#1
      00A9ED 35 07            [ 1] 3998 	jreq 1$
      00A9EF 50 F2 45         [ 2] 3999 	jp syntax_error 
      00A9F1                       4000 1$: _xpop 
      00A9F1 A3 00            [ 1]    1     ld a,(y)
      00A9F3 40               [ 1]    2     ldw x,y 
      00A9F4 23 07            [ 2]    3     ldw x,(1,x)
      00A9F6 72 5C 50 F2      [ 2]    4     addw y,#CELL_SIZE 
      00A9FA 54               [ 1] 4001 	ld a,xl 
      00A9FB 20 F4            [ 1] 4002 	and a,#15
      00A9FD 5F               [ 1] 4003 	clrw x 
      00A9FD 9F               [ 1] 4004 	incw x 
      00A9FE 4A               [ 1] 4005 2$: tnz a 
      00A9FF 27 01            [ 1] 4006 	jreq 3$
      00AA01 4A               [ 2] 4007 	slaw x 
      00AA02 4A               [ 1] 4008 	dec a 
      00AA02 A4 3E            [ 1] 4009 	jrne 2$ 
      002CF1                       4010 3$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



      00AA04 C7               [ 4] 4011 	ret 
                                   4012 
                                   4013 ;------------------------------
                                   4014 ; BASIC: INVERT(expr)
                                   4015 ; 1's complement 
                                   4016 ;--------------------------------
      002CF2                       4017 invert:
      00AA05 50 F1 72         [ 4] 4018 	call func_args
      00AA08 18 50            [ 1] 4019 	cp a,#1 
      00AA0A F0 8E            [ 1] 4020 	jreq 1$
      00AA0C 81 16 45         [ 2] 4021 	jp syntax_error
      00AA0D                       4022 1$: _xpop 
      00AA0D CE 00            [ 1]    1     ld a,(y)
      00AA0F 10               [ 1]    2     ldw x,y 
      00AA10 4F 72            [ 2]    3     ldw x,(1,x)
      00AA12 A2 00 03 90      [ 2]    4     addw y,#CELL_SIZE 
      00AA16 F7               [ 1] 4023 	cpl a 
      00AA17 90               [ 2] 4024 	cplw x 
      00AA18 EF               [ 4] 4025 	ret 
                                   4026 
                                   4027 ;------------------------------
                                   4028 ; BASIC: DO 
                                   4029 ; initiate a DO ... UNTIL loop 
                                   4030 ;------------------------------
                           000003  4031 	DOLP_ADR=3 
                           000005  4032 	DOLP_INW=5
                           000004  4033 	VSIZE=4 
      002D08                       4034 do_loop:
      00AA19 01               [ 2] 4035 	popw x 
      002D09                       4036 	_vars VSIZE 
      00AA1A A6 84            [ 2]    1     sub sp,#VSIZE 
      00AA1C 81               [ 2] 4037 	pushw x 
      00AA1D 90 CE 00 04      [ 2] 4038 	ldw y,basicptr 
      00AA1D CD 99            [ 2] 4039 	ldw (DOLP_ADR,sp),y
      00AA1F 80 A1 01         [ 2] 4040 	ldw x,in.w 
      00AA22 27 03            [ 2] 4041 	ldw (DOLP_INW,sp),x
      00AA24 CC 96 C5 1E      [ 1] 4042 	inc loop_depth 
      00AA27 81               [ 4] 4043 	ret 
                                   4044 
                                   4045 ;--------------------------------
                                   4046 ; BASIC: UNTIL expr 
                                   4047 ; loop if exprssion is false 
                                   4048 ; else terminate loop
                                   4049 ;--------------------------------
      002D1C                       4050 until: 
      00AA27 CD 82 23 A6      [ 1] 4051 	tnz loop_depth 
      00AA2B 84 81            [ 1] 4052 	jrne 1$ 
      00AA2D CC 16 45         [ 2] 4053 	jp syntax_error 
      002D25                       4054 1$: 
      00AA2D CD 99 80         [ 4] 4055 	call relation 
      00AA30 A1 02            [ 1] 4056 	cp a,#TK_INTGR
      00AA32 27 03            [ 1] 4057 	jreq 2$
      00AA34 CC 96 C5         [ 2] 4058 	jp syntax_error
      002D2F                       4059 2$: 
      002D2F                       4060 	_xpop
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



      00AA37 90 F6            [ 1]    1     ld a,(y)
      00AA39 93               [ 1]    2     ldw x,y 
      00AA3A EE 01            [ 2]    3     ldw x,(1,x)
      00AA3C 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00AA40 89               [ 1] 4061 	tnz a 
      00AA41 88 90            [ 1] 4062 	jrne 9$ 
      00AA43 F6               [ 2] 4063 	tnzw x   
      00AA44 93 EE            [ 1] 4064 	jrne 9$
      00AA46 01 14            [ 2] 4065 	ldw x,(DOLP_ADR,sp)
      00AA48 01 02 14         [ 2] 4066 	ldw basicptr,x 
      00AA4B 02 02            [ 1] 4067 	ld a,(2,x)
      00AA4D 14 03 02         [ 1] 4068 	ld count,a 
      00AA50 5B 03            [ 2] 4069 	ldw x,(DOLP_INW,sp)
      00AA52 90 F7 90         [ 2] 4070 	ldw in.w,x 
      00AA55 EF               [ 4] 4071 	ret 
      002D4E                       4072 9$:	; remove loop data from stack  
      00AA56 01               [ 2] 4073 	popw x
      002D4F                       4074 	_drop VSIZE
      00AA57 A6 84            [ 2]    1     addw sp,#VSIZE 
      00AA59 81 5A 00 1E      [ 1] 4075 	dec loop_depth 
      00AA5A FC               [ 2] 4076 	jp (x)
                                   4077 
                                   4078 ;--------------------------
                                   4079 ; BASIC: PRTA...PRTI  
                                   4080 ;  return constant value 
                                   4081 ;  PORT  offset in GPIO
                                   4082 ;  array
                                   4083 ;---------------------------
      002D56                       4084 const_porta:
      00AA5A CD 99 80         [ 2] 4085 	ldw x,#0
      00AA5D A1 02            [ 1] 4086 	ld a,#TK_INTGR 
      00AA5F 27               [ 4] 4087 	ret 
      002D5C                       4088 const_portb:
      00AA60 03 CC 96         [ 2] 4089 	ldw x,#1
      00AA63 C5 90            [ 1] 4090 	ld a,#TK_INTGR 
      00AA65 F6               [ 4] 4091 	ret 
      002D62                       4092 const_portc:
      00AA66 93 EE 01         [ 2] 4093 	ldw x,#2
      00AA69 72 A9            [ 1] 4094 	ld a,#TK_INTGR 
      00AA6B 00               [ 4] 4095 	ret 
      002D68                       4096 const_portd:
      00AA6C 03 89 88         [ 2] 4097 	ldw x,#3
      00AA6F 90 F6            [ 1] 4098 	ld a,#TK_INTGR 
      00AA71 93               [ 4] 4099 	ret 
      002D6E                       4100 const_porte:
      00AA72 EE 01 1A         [ 2] 4101 	ldw x,#4
      00AA75 01 90            [ 1] 4102 	ld a,#TK_INTGR 
      00AA77 97               [ 4] 4103 	ret 
      002D74                       4104 const_portf:
      00AA78 9E 1A 02         [ 2] 4105 	ldw x,#5
      00AA7B 95 9F            [ 1] 4106 	ld a,#TK_INTGR 
      00AA7D 1A               [ 4] 4107 	ret 
      002D7A                       4108 const_portg:
      00AA7E 03 97 90         [ 2] 4109 	ldw x,#6
      00AA81 9F 5B            [ 1] 4110 	ld a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



      00AA83 03               [ 4] 4111 	ret 
      002D80                       4112 const_porth:
      00AA84 90 F7 90         [ 2] 4113 	ldw x,#7
      00AA87 EF 01            [ 1] 4114 	ld a,#TK_INTGR 
      00AA89 A6               [ 4] 4115 	ret 
      002D86                       4116 const_porti:
      00AA8A 84 81 08         [ 2] 4117 	ldw x,#8
      00AA8C A6 84            [ 1] 4118 	ld a,#TK_INTGR 
      00AA8C CD               [ 4] 4119 	ret 
                                   4120 
                                   4121 ;-------------------------------
                                   4122 ; following return constant 
                                   4123 ; related to GPIO register offset 
                                   4124 ;---------------------------------
      002D8C                       4125 const_odr:
      00AA8D 99 80            [ 1] 4126 	ld a,#TK_INTGR 
      00AA8F A1 02 27         [ 2] 4127 	ldw x,#GPIO_ODR
      00AA92 03               [ 4] 4128 	ret 
      002D92                       4129 const_idr:
      00AA93 CC 96            [ 1] 4130 	ld a,#TK_INTGR 
      00AA95 C5 90 F6         [ 2] 4131 	ldw x,#GPIO_IDR
      00AA98 93               [ 4] 4132 	ret 
      002D98                       4133 const_ddr:
      00AA99 EE 01            [ 1] 4134 	ld a,#TK_INTGR 
      00AA9B 72 A9 00         [ 2] 4135 	ldw x,#GPIO_DDR
      00AA9E 03               [ 4] 4136 	ret 
      002D9E                       4137 const_cr1:
      00AA9F 89 88            [ 1] 4138 	ld a,#TK_INTGR 
      00AAA1 90 F6 93         [ 2] 4139 	ldw x,#GPIO_CR1
      00AAA4 EE               [ 4] 4140 	ret 
      002DA4                       4141 const_cr2:
      00AAA5 01 18            [ 1] 4142 	ld a,#TK_INTGR 
      00AAA7 01 90 97         [ 2] 4143 	ldw x,#GPIO_CR2
      00AAAA 9E               [ 4] 4144 	ret 
                                   4145 ;-------------------------
                                   4146 ; BASIC: POUT 
                                   4147 ;  constant for port mode
                                   4148 ;  used by PMODE 
                                   4149 ;  to set pin as output
                                   4150 ;------------------------
      002DAA                       4151 const_output:
      00AAAB 18 02            [ 1] 4152 	ld a,#TK_INTGR 
      00AAAD 95 9F 18         [ 2] 4153 	ldw x,#OUTP
      00AAB0 03               [ 4] 4154 	ret 
                                   4155 
                                   4156 ;-------------------------
                                   4157 ; BASIC: PINP 
                                   4158 ;  constant for port mode
                                   4159 ;  used by PMODE 
                                   4160 ;  to set pin as input
                                   4161 ;------------------------
      002DB0                       4162 const_input:
      00AAB1 97 90            [ 1] 4163 	ld a,#TK_INTGR 
      00AAB3 9F 5B 03         [ 2] 4164 	ldw x,#INP 
      00AAB6 90               [ 4] 4165 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



                                   4166 	
                                   4167 ;-----------------------
                                   4168 ; memory area constants
                                   4169 ;-----------------------
      002DB6                       4170 const_eeprom_base:
      00AAB7 F7 90            [ 1] 4171 	ld a,#TK_INTGR 
      00AAB9 EF 01 A6         [ 2] 4172 	ldw x,#EEPROM_BASE 
      00AABC 84               [ 4] 4173 	ret 
                                   4174 
                                   4175 ;---------------------------
                                   4176 ; BASIC: DATA 
                                   4177 ; when the interpreter find 
                                   4178 ; a DATA line it skip it.
                                   4179 ;---------------------------
      002DBC                       4180 data:
      00AABD 81 00 03 00 01   [ 1] 4181 	mov in,count 
      00AABE 81               [ 4] 4182 	ret 
                                   4183 
                                   4184 ;------------------------------
                                   4185 ; check if it is a DATA line 
                                   4186 ; input: 
                                   4187 ;    X    line address 
                                   4188 ; output:
                                   4189 ;    Z    set if DATA line 
                                   4190 ;----------------------------
      002DC2                       4191 is_data_line:
      00AABE CD 99            [ 2] 4192 	ldw x,(4,x)
      00AAC0 80 A1 02         [ 2] 4193 	ldw x,(code_addr,x)
      00AAC3 27 03 CC         [ 2] 4194 	cpw x,#data 
      00AAC6 96               [ 4] 4195 	ret 
                                   4196 
                                   4197 ;---------------------------
                                   4198 ; set DATA pointer at line# 
                                   4199 ; specified by X 
                                   4200 ;---------------------------
      002DCB                       4201 data_line:
      00AAC7 C5               [ 1] 4202     clr a 
      00AAC8 90 F6 93         [ 4] 4203 	call search_lineno
      00AACB EE               [ 2] 4204 	tnzw x 
      00AACC 01 72            [ 1] 4205 	jrne 3$
      00AACE A9 00            [ 1] 4206 2$:	ld a,#ERR_NO_LINE 
      00AAD0 03 90 93         [ 2] 4207 	jp tb_error
      002DD7                       4208 3$: ; check if valid data line 
      00AAD3 90 F6            [ 1] 4209     ldw y,x 
      00AAD5 93 EE 01         [ 4] 4210 	call is_data_line 
      00AAD8 90 5D            [ 1] 4211 	jrne 2$ 
      002DDE                       4212 set_data_ptr: 	
      00AADA 27 07 98 59      [ 2] 4213 	ldw data_ptr,y
      00AADE 49 90 5A         [ 1] 4214 	ld a,(2,y)
      00AAE1 26 F9 90         [ 1] 4215 	ld data_len,a 
      00AAE4 F7 90 EF 01      [ 1] 4216 	mov data_ofs,#FIRST_DATA_ITEM 
      00AAE8 A6               [ 4] 4217 	ret
                                   4218 
                                   4219 ;---------------------------------
                                   4220 ; BASIC: RESTORE [line#]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



                                   4221 ; set data_ptr to first data line
                                   4222 ; if no DATA found pointer set to
                                   4223 ; zero.
                                   4224 ; if a line# is given as argument 
                                   4225 ; a data line with that number 
                                   4226 ; is searched and the data pointer 
                                   4227 ; is set to it. If there is no 
                                   4228 ; data line with that number 
                                   4229 ; the program is interrupted. 
                                   4230 ;---------------------------------
      002DED                       4231 restore:
      00AAE9 84 81 00 06      [ 1] 4232 	clr data_ptr 
      00AAEB 72 5F 00 07      [ 1] 4233 	clr data_ptr+1
      00AAEB CD 99 80 A1      [ 1] 4234 	clr data_ofs 
      00AAEF 02 27 03 CC      [ 1] 4235 	clr data_len
      00AAF3 96 C5 90         [ 4] 4236 	call next_token 
      00AAF6 F6 93            [ 1] 4237 	cp a,#TK_INTGR
      00AAF8 EE 01            [ 1] 4238 	jreq data_line
      002E04                       4239 	_unget_token 
      00AAFA 72 A9 00 03 90   [ 1]    1      mov in,in.saved  
      00AAFF 93 90 F6         [ 2] 4240 	ldw x,txtbgn
                                   4241 ; search first DATA line 
      002E0C                       4242 data_search_loop: 	
      00AB02 93 EE 01         [ 2] 4243 	cpw x,txtend
      00AB05 90 5D            [ 1] 4244 	jruge restore_error 
      00AB07 27 07            [ 1] 4245 	ldw y,x 
      00AB09 98 56 46         [ 4] 4246 	call is_data_line 
      00AB0C 90 5A            [ 1] 4247 	jreq set_data_ptr
      002E18                       4248 try_next_line: 
      00AB0E 26               [ 1] 4249 	ldw x,y 
      00AB0F F9 90            [ 1] 4250 	ld a,(2,x)
      00AB11 F7 90 EF         [ 1] 4251 	ld acc8,a 
      00AB14 01 A6 84 81      [ 1] 4252 	clr acc16 
      00AB18 72 BB 00 0D      [ 2] 4253 	addw x,acc16 
      00AB18 A6 84            [ 2] 4254 	jra data_search_loop
      002E28                       4255 restore_error:	
      00AB1A CD 99            [ 1] 4256     ld a,#ERR_NO_DATA 
      00AB1C 73 CD 98         [ 2] 4257 	jp tb_error 
                                   4258 
                                   4259 
                                   4260 ;---------------------------------
                                   4261 ; BASIC: READ 
                                   4262 ; return next data item | 0 
                                   4263 ;---------------------------------
                           000001  4264 	CTX_BPTR=1 
                           000003  4265 	CTX_IN=3 
                           000004  4266 	CTX_COUNT=4 
                           000005  4267 	XSAVE=5
                           000006  4268 	VSIZE=6
      002E2D                       4269 read:
      002E2D                       4270 	_vars  VSIZE 
      00AB1F 0B 9F            [ 2]    1     sub sp,#VSIZE 
      002E2F                       4271 read01:	
      00AB21 A4 07 C7         [ 1] 4272 	ld a,data_ofs
      00AB24 50 C6 81         [ 1] 4273 	cp a,data_len 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



      00AB27 27 37            [ 1] 4274 	jreq 2$ ; end of line  
      00AB27 52 01 CD         [ 4] 4275 	call save_context
      00AB2A 99 85 A1         [ 2] 4276 	ldw x,data_ptr 
      00AB2D 02 27 03         [ 2] 4277 	ldw basicptr,x 
      00AB30 CC 96 C5 90 F6   [ 1] 4278 	mov in,data_ofs 
      00AB35 93 EE 01 72 A9   [ 1] 4279 	mov count,data_len  
      00AB3A 00 03 90         [ 4] 4280 	call expression 
      00AB3D 93 90            [ 1] 4281 	cp a,#TK_INTGR 
      00AB3F F6 93            [ 1] 4282 	jreq 1$ 
      00AB41 EE 01 72         [ 2] 4283 	jp syntax_error 
      002E54                       4284 1$:
      00AB44 A9 00            [ 2] 4285 	ldw (XSAVE,SP),x
      00AB46 03 CD AB         [ 4] 4286 	call next_token ; skip comma
      00AB49 84 6B 01         [ 2] 4287 	ldw x,basicptr 
      00AB4C A6 01 0D         [ 2] 4288 	ldw data_ptr,x 
      00AB4F 01 27 0D 48 0A   [ 1] 4289 	mov data_ofs,in 
      00AB54 01 26 FB         [ 4] 4290 	call rest_context
      00AB57 6B 01            [ 2] 4291 	ldw x,(XSAVE,sp)
      00AB59 7B 01            [ 1] 4292 	ld a,#TK_INTGR
      002E6B                       4293 	_drop VSIZE 
      00AB5B EA 03            [ 2]    1     addw sp,#VSIZE 
      00AB5D E7               [ 4] 4294 	ret 
      002E6E                       4295 2$: ; end of line reached 
      00AB5E 03 90 A3 00      [ 2] 4296 	ldw y, data_ptr 
      00AB62 01 27 10 7B      [ 1] 4297 	clr data_ptr
      00AB66 01 43 E4 04      [ 1] 4298 	clr data_ptr+1   
      00AB6A E7 04 7B 01      [ 1] 4299 	clr data_ofs 
      00AB6E 43 E4 02 E7      [ 1] 4300 	clr data_len 
      00AB72 02 20 0C         [ 4] 4301 	call try_next_line 
      00AB75 20 A8            [ 2] 4302 	jra read01
                                   4303 
                                   4304 
                                   4305 ;---------------------------------
                                   4306 ; BASIC: SPIEN clkdiv, 0|1  
                                   4307 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4308 ; if clkdiv==-1 disable SPI
                                   4309 ; 0|1 -> disable|enable  
                                   4310 ;--------------------------------- 
                           000005  4311 SPI_CS_BIT=5
      002E87                       4312 spi_enable:
      00AB75 7B 01 EA         [ 4] 4313 	call arg_list 
      00AB78 02 E7            [ 1] 4314 	cp a,#2
      00AB7A 02 7B            [ 1] 4315 	jreq 1$
      00AB7C 01 EA 04         [ 2] 4316 	jp syntax_error 
      002E91                       4317 1$: 
      00AB7F E7 04 50 C7      [ 1] 4318 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00AB81 85               [ 2] 4319 	popw x  
      00AB81 5B               [ 2] 4320 	tnzw x 
      00AB82 01 81            [ 1] 4321 	jreq spi_disable 
      00AB84 85               [ 2] 4322 	popw x 
      00AB84 58 1C            [ 1] 4323 	ld a,#(1<<SPI_CR1_BR)
      00AB86 AB               [ 4] 4324 	mul x,a 
      00AB87 94               [ 1] 4325 	ld a,xl 
      00AB88 FE 9F 88         [ 1] 4326 	ld SPI_CR1,a 
                                   4327 ; configure ~CS on PE5 (D10 on CN8) as output. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



      00AB8B 5E A6 05 42      [ 1] 4328 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00AB8F 1C 50 00 84      [ 1] 4329 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4330 ; configure SPI as master mode 0.	
      00AB93 81 14 52 00      [ 1] 4331 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4332 ; ~CS line controlled by sofware 	
      00AB94 72 12 52 01      [ 1] 4333 	bset SPI_CR2,#SPI_CR2_SSM 
      00AB94 03 06 03 05      [ 1] 4334     bset SPI_CR2,#SPI_CR2_SSI 
                                   4335 ; enable SPI
      00AB98 04 00 02 01      [ 1] 4336 	bset SPI_CR1,#SPI_CR1_SPE 	
      00AB9C 06               [ 4] 4337 	ret 
      002EBA                       4338 spi_disable:
      002EBA                       4339 	_drop #2; throw first argument.
      00AB9D 00 02            [ 2]    1     addw sp,##2 
                                   4340 ; wait spi idle 
      00AB9F 02 02            [ 1] 4341 1$:	ld a,#0x82 
      00ABA1 03 03 01         [ 1] 4342 	and a,SPI_SR
      00ABA4 03 03            [ 1] 4343 	cp a,#2 
      00ABA6 02 04            [ 1] 4344 	jrne 1$
      00ABA8 04 05 02 06      [ 1] 4345 	bres SPI_CR1,#SPI_CR1_SPE
      00ABAC 02 07 02 05      [ 1] 4346 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00ABB0 04 02 04 01      [ 1] 4347 	bres PE_DDR,#SPI_CS_BIT 
      00ABB4 81               [ 4] 4348 	ret 
                                   4349 
      002ED2                       4350 spi_clear_error:
      00ABB4 CD 99            [ 1] 4351 	ld a,#0x78 
      00ABB6 80 A1 01         [ 1] 4352 	bcp a,SPI_SR 
      00ABB9 27 03            [ 1] 4353 	jreq 1$
      00ABBB CC 96 C5 03      [ 1] 4354 	clr SPI_SR 
      00ABBE 81               [ 4] 4355 1$: ret 
                                   4356 
      002EDE                       4357 spi_send_byte:
      00ABBE 90               [ 1] 4358 	push a 
      00ABBF F6 93 EE         [ 4] 4359 	call spi_clear_error
      00ABC2 01               [ 1] 4360 	pop a 
      00ABC3 72 A9 00 03 89   [ 2] 4361 	btjf SPI_SR,#SPI_SR_TXE,.
      00ABC8 88 A6 80         [ 1] 4362 	ld SPI_DR,a
      00ABCB 15 01 27 05 A6   [ 2] 4363 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00ABD0 0A CC 96         [ 1] 4364 	ld a,SPI_DR 
      00ABD3 C7               [ 4] 4365 	ret 
                                   4366 
      00ABD4                       4367 spi_rcv_byte:
      00ABD4 CE 00            [ 1] 4368 	ld a,#255
      00ABD6 14 58 58 58 58   [ 2] 4369 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00ABDB 58 9E C8         [ 1] 4370 	ld a,SPI_DR 
      00ABDE 00               [ 4] 4371 	ret
                                   4372 
                                   4373 ;------------------------------
                                   4374 ; BASIC: SPIWR byte [,byte]
                                   4375 ; write 1 or more byte
                                   4376 ;------------------------------
      002EFF                       4377 spi_write:
      00ABDF 14 C7 00         [ 4] 4378 	call expression
      00ABE2 0E 9F            [ 1] 4379 	cp a,#TK_INTGR 
      00ABE4 C8 00            [ 1] 4380 	jreq 1$
      00ABE6 15 C7 00         [ 2] 4381 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      002F09                       4382 1$:	
      00ABE9 0F               [ 1] 4383 	ld a,xl 
      00ABEA CE 00 16         [ 4] 4384 	call spi_send_byte 
      00ABED CF 00 14         [ 4] 4385 	call next_token 
      00ABF0 90 54            [ 1] 4386 	cp a,#TK_COMMA 
      00ABF2 90 9E            [ 1] 4387 	jrne 2$ 
      00ABF4 C8 00            [ 2] 4388 	jra spi_write 
      00ABF6 16               [ 1] 4389 2$:	tnz a 
      00ABF7 C7 00            [ 1] 4390 	jreq 3$
      002F19                       4391 	_unget_token  
      00ABF9 16 90 9F C8 00   [ 1]    1      mov in,in.saved  
      00ABFE 17               [ 4] 4392 3$:	ret 
                                   4393 
                                   4394 
                                   4395 ;-------------------------------
                                   4396 ; BASIC: SPIRD 	
                                   4397 ; read one byte from SPI 
                                   4398 ;-------------------------------
      002F1F                       4399 spi_read:
      00ABFF C7 00 17         [ 4] 4400 	call spi_rcv_byte 
      00AC02 CE               [ 1] 4401 	clrw x 
      00AC03 00               [ 1] 4402 	ld xl,a 
      00AC04 0E 54            [ 1] 4403 	ld a,#TK_INTGR 
      00AC06 54               [ 4] 4404 	ret 
                                   4405 
                                   4406 ;------------------------------
                                   4407 ; BASIC: SPISEL 0|1 
                                   4408 ; set state of ~CS line
                                   4409 ; 0|1 deselect|select  
                                   4410 ;------------------------------
      002F27                       4411 spi_select:
      00AC07 54 9E C8         [ 4] 4412 	call next_token 
      00AC0A 00 0E            [ 1] 4413 	cp a,#TK_INTGR 
      00AC0C 95 9F            [ 1] 4414 	jreq 1$
      00AC0E C8 00 0F         [ 2] 4415 	jp syntax_error 
      00AC11 97               [ 2] 4416 1$: tnzw x  
      00AC12 C8 00            [ 1] 4417 	jreq cs_high 
      00AC14 17 97 9E C8      [ 1] 4418 	bres PE_ODR,#SPI_CS_BIT
      00AC18 00               [ 4] 4419 	ret 
      002F39                       4420 cs_high: 
      00AC19 16 95 CF 00      [ 1] 4421 	bset PE_ODR,#SPI_CS_BIT
      00AC1D 16               [ 4] 4422 	ret 
                                   4423 
                                   4424 ;-------------------------------
                                   4425 ; BASIC: PAD 
                                   4426 ; Return pad buffer address.
                                   4427 ;------------------------------
      002F3E                       4428 pad_ref:
      00AC1E C6 00 15         [ 2] 4429 	ldw x,#pad 
      00AC21 72 A2            [ 1] 4430 	ld a,TK_INTGR
      00AC23 00               [ 4] 4431 	ret 
                                   4432 
                                   4433 
                                   4434 ;------------------------------
                                   4435 ;      dictionary 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



                                   4436 ; format:
                                   4437 ;   link:   2 bytes 
                                   4438 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   4439 ;   cmd_name: 16 byte max 
                                   4440 ;   cmd_index: 2 bytes 
                                   4441 ;------------------------------
                                   4442 	.macro _dict_entry len,name,cmd_idx 
                                   4443 	.word LINK 
                                   4444 	LINK=.
                                   4445 name:
                                   4446 	.byte len 	
                                   4447 	.ascii "name"
                                   4448 	.word cmd_idx 
                                   4449 	.endm 
                                   4450 
                           000000  4451 	LINK=0
                                   4452 ; respect alphabetic order for BASIC names from Z-A
                                   4453 ; this sort order is for a cleaner WORDS cmd output. 	
      002F44                       4454 kword_end:
      002F44                       4455 	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
      00AC24 03 90                    1 	.word LINK 
                           002F46     2 	LINK=.
      002F46                          3 XOR:
      00AC26 F7                       4 	.byte 3+F_IFUNC 	
      00AC27 90 EF 01                 5 	.ascii "XOR"
      00AC2A 84 85                    6 	.word XOR_IDX 
      002F4C                       4456 	_dict_entry,5,WRITE,WRITE_IDX;write  
      00AC2C 72 A2                    1 	.word LINK 
                           002F4E     2 	LINK=.
      002F4E                          3 WRITE:
      00AC2E 00                       4 	.byte 5 	
      00AC2F 03 90 F7 90 EF           5 	.ascii "WRITE"
      00AC34 01 CD                    6 	.word WRITE_IDX 
      002F56                       4457 	_dict_entry,5,WORDS,WORDS_IDX;words 
      00AC36 83 65                    1 	.word LINK 
                           002F58     2 	LINK=.
      00AC38                          3 WORDS:
      00AC38 A6                       4 	.byte 5 	
      00AC39 84 81 52 44 53           5 	.ascii "WORDS"
      00AC3B 00 BA                    6 	.word WORDS_IDX 
      002F60                       4458 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      00AC3B 52 03                    1 	.word LINK 
                           002F62     2 	LINK=.
      002F62                          3 WAIT:
      00AC3D 0F                       4 	.byte 4 	
      00AC3E 02 0F 03 90              5 	.ascii "WAIT"
      00AC42 AE B3                    6 	.word WAIT_IDX 
      002F69                       4459 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      00AC44 5E 93                    1 	.word LINK 
                           002F6B     2 	LINK=.
      002F6B                          3 USR:
      00AC46 F6                       4 	.byte 3+F_IFUNC 	
      00AC47 A4 0F 6B                 5 	.ascii "USR"
      00AC4A 01 0C                    6 	.word USR_IDX 
      002F71                       4460 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



      00AC4C 03 5C                    1 	.word LINK 
                           002F73     2 	LINK=.
      002F73                          3 UNTIL:
      00AC4E F6                       4 	.byte 5 	
      00AC4F CD 89 7D 0C 02           5 	.ascii "UNTIL"
      00AC54 0A 01                    6 	.word UNTIL_IDX 
      002F7B                       4461 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      00AC56 26 F5                    1 	.word LINK 
                           002F7D     2 	LINK=.
      002F7D                          3 UFLASH:
      00AC58 A6                       4 	.byte 6+F_IFUNC 	
      00AC59 46 11 02 2B 09 A6        5 	.ascii "UFLASH"
      00AC5F 20 CD                    6 	.word UFLASH_IDX 
      002F86                       4462 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      00AC61 89 7D                    1 	.word LINK 
                           002F88     2 	LINK=.
      002F88                          3 UBOUND:
      00AC63 0C                       4 	.byte 6+F_IFUNC 	
      00AC64 02 20 07 A6 0D CD        5 	.ascii "UBOUND"
      00AC6A 89 7D                    6 	.word UBOUND_IDX 
      002F91                       4463 	_dict_entry,4,TONE,TONE_IDX;tone  
      00AC6C 0F 02                    1 	.word LINK 
                           002F93     2 	LINK=.
      002F93                          3 TONE:
      00AC6E 72                       4 	.byte 4 	
      00AC6F A2 00 02 90              5 	.ascii "TONE"
      00AC73 FE 26                    6 	.word TONE_IDX 
      002F9A                       4464 	_dict_entry,2,TO,TO_IDX;to
      00AC75 CF A6                    1 	.word LINK 
                           002F9C     2 	LINK=.
      002F9C                          3 TO:
      00AC77 0D                       4 	.byte 2 	
      00AC78 CD 89                    5 	.ascii "TO"
      00AC7A 7D 5F                    6 	.word TO_IDX 
      002FA1                       4465 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00AC7C 7B 03                    1 	.word LINK 
                           002FA3     2 	LINK=.
      002FA3                          3 TIMER:
      00AC7E 97                       4 	.byte 5 	
      00AC7F CD 98 21 AE AC           5 	.ascii "TIMER"
      00AC84 8B CD                    6 	.word TIMER_IDX 
      002FAB                       4466 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00AC86 89 DA                    1 	.word LINK 
                           002FAD     2 	LINK=.
      002FAD                          3 TIMEOUT:
      00AC88 5B                       4 	.byte 7+F_IFUNC 	
      00AC89 03 81 20 77 6F 72 64     5 	.ascii "TIMEOUT"
      00AC90 73 20                    6 	.word TMROUT_IDX 
      002FB7                       4467 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00AC92 69 6E                    1 	.word LINK 
                           002FB9     2 	LINK=.
      002FB9                          3 TICKS:
      00AC94 20                       4 	.byte 5+F_IFUNC 	
      00AC95 64 69 63 74 69           5 	.ascii "TICKS"
      00AC9A 6F 6E                    6 	.word TICKS_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



      002FC1                       4468 	_dict_entry,4,STOP,STOP_IDX;stop 
      00AC9C 61 72                    1 	.word LINK 
                           002FC3     2 	LINK=.
      002FC3                          3 STOP:
      00AC9E 79                       4 	.byte 4 	
      00AC9F 0A 00 4F 50              5 	.ascii "STOP"
      00ACA1 00 A4                    6 	.word STOP_IDX 
      002FCA                       4469 	_dict_entry,4,STEP,STEP_IDX;step 
      00ACA1 CD 99                    1 	.word LINK 
                           002FCC     2 	LINK=.
      002FCC                          3 STEP:
      00ACA3 85                       4 	.byte 4 	
      00ACA4 A1 01 27 03              5 	.ascii "STEP"
      00ACA8 CC 96                    6 	.word STEP_IDX 
      002FD3                       4470 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      00ACAA C5 CC                    1 	.word LINK 
                           002FD5     2 	LINK=.
      00ACAB                          3 SPIWR:
      00ACAB 90                       4 	.byte 5 	
      00ACAC F6 93 EE 01 72           5 	.ascii "SPIWR"
      00ACB1 A9 00                    6 	.word SPIWR_IDX 
      002FDD                       4471 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00ACB3 03 CF                    1 	.word LINK 
                           002FDF     2 	LINK=.
      002FDF                          3 SPISEL:
      00ACB5 00                       4 	.byte 6 	
      00ACB6 12 81 49 53 45 4C        5 	.ascii "SPISEL"
      00ACB8 00 9E                    6 	.word SPISEL_IDX 
      002FE8                       4472 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      00ACB8 CE 00                    1 	.word LINK 
                           002FEA     2 	LINK=.
      002FEA                          3 SPIRD:
      00ACBA 12                       4 	.byte 5+F_IFUNC 	
      00ACBB 53 50 49 52 44           5 	.ascii "SPIRD"
      00ACBB A6 FF                    6 	.word SPIRD_IDX 
      002FF2                       4473 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      00ACBD 53 A3                    1 	.word LINK 
                           002FF4     2 	LINK=.
      002FF4                          3 SPIEN:
      00ACBF FF                       4 	.byte 5 	
      00ACC0 FF 27 02 5F 4F           5 	.ascii "SPIEN"
      00ACC5 72 A2                    6 	.word SPIEN_IDX 
      002FFC                       4474 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      00ACC7 00 03                    1 	.word LINK 
                           002FFE     2 	LINK=.
      002FFE                          3 SLEEP:
      00ACC9 90                       4 	.byte 5 	
      00ACCA F7 90 EF 01 A6           5 	.ascii "SLEEP"
      00ACCF 84 81                    6 	.word SLEEP_IDX 
      00ACD1                       4475     _dict_entry,4,SIZE,SIZE_IDX; cmd_size 
      00ACD1 CD 99                    1 	.word LINK 
                           003008     2 	LINK=.
      003008                          3 SIZE:
      00ACD3 80                       4 	.byte 4 	
      00ACD4 A1 01 27 03              5 	.ascii "SIZE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



      00ACD8 CC 96                    6 	.word SIZE_IDX 
      00300F                       4476 	_dict_entry,4,SHOW,SHOW_IDX;show 
      00ACDA C5 08                    1 	.word LINK 
                           003011     2 	LINK=.
      00ACDB                          3 SHOW:
      00ACDB CD                       4 	.byte 4 	
      00ACDC 82 2A A6 84              5 	.ascii "SHOW"
      00ACE0 81 94                    6 	.word SHOW_IDX 
      00ACE1                       4477 	_dict_entry,4,SAVE,SAVE_IDX ;save_app 
      00ACE1 CD 99                    1 	.word LINK 
                           00301A     2 	LINK=.
      00301A                          3 SAVE:
      00ACE3 85                       4 	.byte 4 	
      00ACE4 A1 01 27 03              5 	.ascii "SAVE"
      00ACE8 CC 96                    6 	.word SAVE_IDX 
      003021                       4478 	_dict_entry 3,RUN,RUN_IDX;run
      00ACEA C5 90                    1 	.word LINK 
                           003023     2 	LINK=.
      003023                          3 RUN:
      00ACEC F6                       4 	.byte 3 	
      00ACED 93 EE 01                 5 	.ascii "RUN"
      00ACF0 72 A9                    6 	.word RUN_IDX 
      003029                       4479 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      00ACF2 00 03                    1 	.word LINK 
                           00302B     2 	LINK=.
      00302B                          3 RSHIFT:
      00ACF4 4B                       4 	.byte 6+F_IFUNC 	
      00ACF5 00 35 CC 50 E0 9E        5 	.ascii "RSHIFT"
      00ACFB A4 3F                    6 	.word RSHIFT_IDX 
      003034                       4480 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      00ACFD 95 A3                    1 	.word LINK 
                           003036     2 	LINK=.
      003036                          3 RND:
      00ACFF 00                       4 	.byte 3+F_IFUNC 	
      00AD00 FF 23 06                 5 	.ascii "RND"
      00AD03 0C 01                    6 	.word RND_IDX 
      00303C                       4481 	_dict_entry,6,RETURN,RET_IDX;return 
      00AD05 98 56                    1 	.word LINK 
                           00303E     2 	LINK=.
      00303E                          3 RETURN:
      00AD07 20                       4 	.byte 6 	
      00AD08 F5 35 55 50 E0 84        5 	.ascii "RETURN"
      00AD0E C7 50                    6 	.word RET_IDX 
      003047                       4482 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00AD10 E1 9F                    1 	.word LINK 
                           003049     2 	LINK=.
      003049                          3 RESTORE:
      00AD12 4A                       4 	.byte 7 	
      00AD13 35 55 50 E0 C7 50 E2     5 	.ascii "RESTORE"
      00AD1A 35 AA                    6 	.word REST_IDX 
      003053                       4483 	_dict_entry 3,REM,REM_IDX;remark 
      00AD1C 50 E0                    1 	.word LINK 
                           003055     2 	LINK=.
      003055                          3 REM:
      00AD1E 81                       4 	.byte 3 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



      00AD1F 52 45 4D                 5 	.ascii "REM"
      00AD1F 35 AA                    6 	.word REM_IDX 
      00305B                       4484 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      00AD21 50 E0                    1 	.word LINK 
                           00305D     2 	LINK=.
      00305D                          3 REBOOT:
      00AD23 81                       4 	.byte 6 	
      00AD24 52 45 42 4F 4F 54        5 	.ascii "REBOOT"
      00AD24 CD 99                    6 	.word RBT_IDX 
      003066                       4485 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      00AD26 80 A1                    1 	.word LINK 
                           003068     2 	LINK=.
      003068                          3 READ:
      00AD28 01                       4 	.byte 4+F_IFUNC 	
      00AD29 27 03 CC 96              5 	.ascii "READ"
      00AD2D C5 90                    6 	.word READ_IDX 
      00306F                       4486 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      00AD2F F6 93                    1 	.word LINK 
                           003071     2 	LINK=.
      003071                          3 QKEY:
      00AD31 EE                       4 	.byte 4+F_IFUNC 	
      00AD32 01 4B 45 59              5 	.ascii "QKEY"
      00AD33 00 82                    6 	.word QKEY_IDX 
      003078                       4487 	_dict_entry,4+F_IFUNC,PRTI,PRTI_IDX;const_porti 
      00AD33 4D 26                    1 	.word LINK 
                           00307A     2 	LINK=.
      00307A                          3 PRTI:
      00AD35 06                       4 	.byte 4+F_IFUNC 	
      00AD36 5D 26 03 4C              5 	.ascii "PRTI"
      00AD3A 20 0E                    6 	.word PRTI_IDX 
      003081                       4488 	_dict_entry,4+F_IFUNC,PRTH,PRTH_IDX;const_porth 
      00AD3C 4B 18                    1 	.word LINK 
                           003083     2 	LINK=.
      003083                          3 PRTH:
      00AD3E 59                       4 	.byte 4+F_IFUNC 	
      00AD3F 49 25 04 0A              5 	.ascii "PRTH"
      00AD43 01 26                    6 	.word PRTH_IDX 
      00308A                       4489 	_dict_entry,4+F_IFUNC,PRTG,PRTG_IDX;const_portg 
      00AD45 F8 5F                    1 	.word LINK 
                           00308C     2 	LINK=.
      00308C                          3 PRTG:
      00AD47 84                       4 	.byte 4+F_IFUNC 	
      00AD48 97 4F 90 F7              5 	.ascii "PRTG"
      00AD4C 90 EF                    6 	.word PRTG_IDX 
      003093                       4490 	_dict_entry,4+F_IFUNC,PRTF,PRTF_IDX;const_portf
      00AD4E 01 A6                    1 	.word LINK 
                           003095     2 	LINK=.
      003095                          3 PRTF:
      00AD50 84                       4 	.byte 4+F_IFUNC 	
      00AD51 81 52 54 46              5 	.ascii "PRTF"
      00AD52 00 7A                    6 	.word PRTF_IDX 
      00309C                       4491 	_dict_entry,4+F_IFUNC,PRTE,PRTE_IDX;const_porte
      00AD52 CD 99                    1 	.word LINK 
                           00309E     2 	LINK=.
      00309E                          3 PRTE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



      00AD54 80                       4 	.byte 4+F_IFUNC 	
      00AD55 A1 01 27 03              5 	.ascii "PRTE"
      00AD59 CC 96                    6 	.word PRTE_IDX 
      0030A5                       4492 	_dict_entry,4+F_IFUNC,PRTD,PRTD_IDX;const_portd
      00AD5B C5 90                    1 	.word LINK 
                           0030A7     2 	LINK=.
      0030A7                          3 PRTD:
      00AD5D F6                       4 	.byte 4+F_IFUNC 	
      00AD5E 93 EE 01 72              5 	.ascii "PRTD"
      00AD62 A9 00                    6 	.word PRTD_IDX 
      0030AE                       4493 	_dict_entry,4+F_IFUNC,PRTC,PRTC_IDX;const_portc
      00AD64 03 9F                    1 	.word LINK 
                           0030B0     2 	LINK=.
      0030B0                          3 PRTC:
      00AD66 A4                       4 	.byte 4+F_IFUNC 	
      00AD67 0F 5F 5C 4D              5 	.ascii "PRTC"
      00AD6B 27 04                    6 	.word PRTC_IDX 
      0030B7                       4494 	_dict_entry,4+F_IFUNC,PRTB,PRTB_IDX;const_portb
      00AD6D 58 4A                    1 	.word LINK 
                           0030B9     2 	LINK=.
      0030B9                          3 PRTB:
      00AD6F 26                       4 	.byte 4+F_IFUNC 	
      00AD70 F9 52 54 42              5 	.ascii "PRTB"
      00AD71 00 72                    6 	.word PRTB_IDX 
      0030C0                       4495 	_dict_entry,4+F_IFUNC,PRTA,PRTA_IDX;const_porta 
      00AD71 81 B9                    1 	.word LINK 
                           0030C2     2 	LINK=.
      00AD72                          3 PRTA:
      00AD72 CD                       4 	.byte 4+F_IFUNC 	
      00AD73 99 80 A1 01              5 	.ascii "PRTA"
      00AD77 27 03                    6 	.word PRTA_IDX 
      0030C9                       4496 	_dict_entry 5,PRINT,PRT_IDX;print 
      00AD79 CC 96                    1 	.word LINK 
                           0030CB     2 	LINK=.
      0030CB                          3 PRINT:
      00AD7B C5                       4 	.byte 5 	
      00AD7C 90 F6 93 EE 01           5 	.ascii "PRINT"
      00AD81 72 A9                    6 	.word PRT_IDX 
      0030D3                       4497 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      00AD83 00 03                    1 	.word LINK 
                           0030D5     2 	LINK=.
      0030D5                          3 POUT:
      00AD85 43                       4 	.byte 4+F_IFUNC 	
      00AD86 53 81 55 54              5 	.ascii "POUT"
      00AD88 00 6C                    6 	.word POUT_IDX 
      0030DC                       4498 	_dict_entry,4,POKE,POKE_IDX;poke 
      00AD88 85 52                    1 	.word LINK 
                           0030DE     2 	LINK=.
      0030DE                          3 POKE:
      00AD8A 04                       4 	.byte 4 	
      00AD8B 89 90 CE 00              5 	.ascii "POKE"
      00AD8F 05 17                    6 	.word POKE_IDX 
      0030E5                       4499 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      00AD91 03 CE                    1 	.word LINK 
                           0030E7     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



      0030E7                          3 PMODE:
      00AD93 00                       4 	.byte 5 	
      00AD94 01 1F 05 72 5C           5 	.ascii "PMODE"
      00AD99 00 1F                    6 	.word PMODE_IDX 
      0030EF                       4500 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      00AD9B 81 E7                    1 	.word LINK 
                           0030F1     2 	LINK=.
      00AD9C                          3 PINP:
      00AD9C 72                       4 	.byte 4+F_IFUNC 	
      00AD9D 5D 00 1F 26              5 	.ascii "PINP"
      00ADA1 03 CC                    6 	.word PINP_IDX 
      0030F8                       4501 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      00ADA3 96 C5                    1 	.word LINK 
                           0030FA     2 	LINK=.
      00ADA5                          3 PEEK:
      00ADA5 CD                       4 	.byte 4+F_IFUNC 	
      00ADA6 9A F8 A1 84              5 	.ascii "PEEK"
      00ADAA 27 03                    6 	.word PEEK_IDX 
      003101                       4502 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      00ADAC CC 96                    1 	.word LINK 
                           003103     2 	LINK=.
      003103                          3 PAUSE:
      00ADAE C5                       4 	.byte 5 	
      00ADAF 50 41 55 53 45           5 	.ascii "PAUSE"
      00ADAF 90 F6                    6 	.word PAUSE_IDX 
      00310B                       4503 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      00ADB1 93 EE                    1 	.word LINK 
                           00310D     2 	LINK=.
      00310D                          3 PAD:
      00ADB3 01                       4 	.byte 3+F_IFUNC 	
      00ADB4 72 A9 00                 5 	.ascii "PAD"
      00ADB7 03 4D                    6 	.word PAD_IDX 
      003113                       4504 	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
      00ADB9 26 13                    1 	.word LINK 
                           003115     2 	LINK=.
      003115                          3 OR:
      00ADBB 5D                       4 	.byte 2+F_IFUNC 	
      00ADBC 26 10                    5 	.ascii "OR"
      00ADBE 1E 03                    6 	.word OR_IDX 
      00311A                       4505 	_dict_entry,2,ON,ON_IDX; cmd_on 
      00ADC0 CF 00                    1 	.word LINK 
                           00311C     2 	LINK=.
      00311C                          3 ON:
      00ADC2 05                       4 	.byte 2 	
      00ADC3 E6 02                    5 	.ascii "ON"
      00ADC5 C7 00                    6 	.word ON_IDX 
      003121                       4506 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      00ADC7 04 1E                    1 	.word LINK 
                           003123     2 	LINK=.
      003123                          3 ODR:
      00ADC9 05                       4 	.byte 3+F_IFUNC 	
      00ADCA CF 00 01                 5 	.ascii "ODR"
      00ADCD 81 5C                    6 	.word ODR_IDX 
      00ADCE                       4507 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      00ADCE 85 5B                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



                           00312B     2 	LINK=.
      00312B                          3 NOT:
      00ADD0 04                       4 	.byte 3+F_IFUNC 	
      00ADD1 72 5A 00                 5 	.ascii "NOT"
      00ADD4 1F FC                    6 	.word NOT_IDX 
      00ADD6                       4508 	_dict_entry,4,NEXT,NEXT_IDX;next 
      00ADD6 AE 00                    1 	.word LINK 
                           003133     2 	LINK=.
      003133                          3 NEXT:
      00ADD8 00                       4 	.byte 4 	
      00ADD9 A6 84 81 54              5 	.ascii "NEXT"
      00ADDC 00 56                    6 	.word NEXT_IDX 
      00313A                       4509 	_dict_entry,3,NEW,NEW_IDX;new
      00ADDC AE 00                    1 	.word LINK 
                           00313C     2 	LINK=.
      00313C                          3 NEW:
      00ADDE 01                       4 	.byte 3 	
      00ADDF A6 84 81                 5 	.ascii "NEW"
      00ADE2 00 58                    6 	.word NEW_IDX 
                                   4510 ;	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
      003142                       4511 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      00ADE2 AE 00                    1 	.word LINK 
                           003144     2 	LINK=.
      003144                          3 LSHIFT:
      00ADE4 02                       4 	.byte 6+F_IFUNC 	
      00ADE5 A6 84 81 49 46 54        5 	.ascii "LSHIFT"
      00ADE8 00 54                    6 	.word LSHIFT_IDX 
      00314D                       4512 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      00ADE8 AE 00                    1 	.word LINK 
                           00314F     2 	LINK=.
      00314F                          3 LOG:
      00ADEA 03                       4 	.byte 3+F_IFUNC 	
      00ADEB A6 84 81                 5 	.ascii "LOG"
      00ADEE 00 52                    6 	.word LOG_IDX 
      003155                       4513 	_dict_entry 4,LIST,LIST_IDX;list
      00ADEE AE 00                    1 	.word LINK 
                           003157     2 	LINK=.
      003157                          3 LIST:
      00ADF0 04                       4 	.byte 4 	
      00ADF1 A6 84 81 54              5 	.ascii "LIST"
      00ADF4 00 50                    6 	.word LIST_IDX 
      00315E                       4514 	_dict_entry 3,LET,LET_IDX;let 
      00ADF4 AE 00                    1 	.word LINK 
                           003160     2 	LINK=.
      003160                          3 LET:
      00ADF6 05                       4 	.byte 3 	
      00ADF7 A6 84 81                 5 	.ascii "LET"
      00ADFA 00 4E                    6 	.word LET_IDX 
      003166                       4515 	_dict_entry,3+F_CFUNC,KEY,KEY_IDX;key 
      00ADFA AE 00                    1 	.word LINK 
                           003168     2 	LINK=.
      003168                          3 KEY:
      00ADFC 06                       4 	.byte 3+F_CFUNC 	
      00ADFD A6 84 81                 5 	.ascii "KEY"
      00AE00 00 4C                    6 	.word KEY_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



      00316E                       4516 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      00AE00 AE 00                    1 	.word LINK 
                           003170     2 	LINK=.
      003170                          3 IWDGREF:
      00AE02 07                       4 	.byte 7 	
      00AE03 A6 84 81 47 52 45 46     5 	.ascii "IWDGREF"
      00AE06 00 4A                    6 	.word IWDGREF_IDX 
      00317A                       4517 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      00AE06 AE 00                    1 	.word LINK 
                           00317C     2 	LINK=.
      00317C                          3 IWDGEN:
      00AE08 08                       4 	.byte 6 	
      00AE09 A6 84 81 47 45 4E        5 	.ascii "IWDGEN"
      00AE0C 00 48                    6 	.word IWDGEN_IDX 
      003185                       4518 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      00AE0C A6 84                    1 	.word LINK 
                           003187     2 	LINK=.
      003187                          3 INVERT:
      00AE0E AE                       4 	.byte 6+F_IFUNC 	
      00AE0F 00 00 81 45 52 54        5 	.ascii "INVERT"
      00AE12 00 46                    6 	.word INVERT_IDX 
      003190                       4519 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      00AE12 A6 84                    1 	.word LINK 
                           003192     2 	LINK=.
      003192                          3 INPUT:
      00AE14 AE                       4 	.byte 5 	
      00AE15 00 01 81 55 54           5 	.ascii "INPUT"
      00AE18 00 44                    6 	.word INPUT_IDX 
      00319A                       4520 	_dict_entry,2,IF,IF_IDX;if 
      00AE18 A6 84                    1 	.word LINK 
                           00319C     2 	LINK=.
      00319C                          3 IF:
      00AE1A AE                       4 	.byte 2 	
      00AE1B 00 02                    5 	.ascii "IF"
      00AE1D 81 42                    6 	.word IF_IDX 
      00AE1E                       4521 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      00AE1E A6 84                    1 	.word LINK 
                           0031A3     2 	LINK=.
      0031A3                          3 IDR:
      00AE20 AE                       4 	.byte 3+F_IFUNC 	
      00AE21 00 03 81                 5 	.ascii "IDR"
      00AE24 00 40                    6 	.word IDR_IDX 
      0031A9                       4522 	_dict_entry,3,HEX,HEX_IDX;hex_base
      00AE24 A6 84                    1 	.word LINK 
                           0031AB     2 	LINK=.
      0031AB                          3 HEX:
      00AE26 AE                       4 	.byte 3 	
      00AE27 00 04 81                 5 	.ascii "HEX"
      00AE2A 00 3E                    6 	.word HEX_IDX 
      0031B1                       4523 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      00AE2A A6 84                    1 	.word LINK 
                           0031B3     2 	LINK=.
      0031B3                          3 GPIO:
      00AE2C AE                       4 	.byte 4+F_IFUNC 	
      00AE2D 00 01 81 4F              5 	.ascii "GPIO"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



      00AE30 00 3C                    6 	.word GPIO_IDX 
      0031BA                       4524 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      00AE30 A6 84                    1 	.word LINK 
                           0031BC     2 	LINK=.
      0031BC                          3 GOTO:
      00AE32 AE                       4 	.byte 4 	
      00AE33 00 00 81 4F              5 	.ascii "GOTO"
      00AE36 00 3A                    6 	.word GOTO_IDX 
      0031C3                       4525 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      00AE36 A6 84                    1 	.word LINK 
                           0031C5     2 	LINK=.
      0031C5                          3 GOSUB:
      00AE38 AE                       4 	.byte 5 	
      00AE39 40 00 81 55 42           5 	.ascii "GOSUB"
      00AE3C 00 38                    6 	.word GOSUB_IDX 
      0031CD                       4526 	_dict_entry,3,GET,GET_IDX; cmd_get 
      00AE3C 55 00                    1 	.word LINK 
                           0031CF     2 	LINK=.
      0031CF                          3 GET:
      00AE3E 04                       4 	.byte 3 	
      00AE3F 00 02 81                 5 	.ascii "GET"
      00AE42 00 C4                    6 	.word GET_IDX 
      0031D5                       4527 	_dict_entry,4+F_IFUNC,FREE,FREE_IDX;free
      00AE42 EE 04                    1 	.word LINK 
                           0031D7     2 	LINK=.
      0031D7                          3 FREE:
      00AE44 DE                       4 	.byte 4+F_IFUNC 	
      00AE45 B3 64 A3 AE              5 	.ascii "FREE"
      00AE49 3C 81                    6 	.word FREE_IDX 
      00AE4B                       4528 	_dict_entry,3,FOR,FOR_IDX;for 
      00AE4B 4F CD                    1 	.word LINK 
                           0031E0     2 	LINK=.
      0031E0                          3 FOR:
      00AE4D 8C                       4 	.byte 3 	
      00AE4E C2 5D 26                 5 	.ascii "FOR"
      00AE51 05 A6                    6 	.word FOR_IDX 
      0031E6                       4529 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      00AE53 05 CC                    1 	.word LINK 
                           0031E8     2 	LINK=.
      0031E8                          3 FCPU:
      00AE55 96                       4 	.byte 4 	
      00AE56 C7 43 50 55              5 	.ascii "FCPU"
      00AE57 00 32                    6 	.word FCPU_IDX 
      0031EF                       4530 	_dict_entry,5,ERASE,ERASE_IDX; erase 
      00AE57 90 93                    1 	.word LINK 
                           0031F1     2 	LINK=.
      0031F1                          3 ERASE:
      00AE59 CD                       4 	.byte 5 	
      00AE5A AE 42 26 F4 45           5 	.ascii "ERASE"
      00AE5E 00 30                    6 	.word ERASE_IDX 
      0031F9                       4531 	_dict_entry,3,END,END_IDX;cmd_end  
      00AE5E 90 CF                    1 	.word LINK 
                           0031FB     2 	LINK=.
      0031FB                          3 END:
      00AE60 00                       4 	.byte 3 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



      00AE61 07 90 E6                 5 	.ascii "END"
      00AE64 02 C7                    6 	.word END_IDX 
      003201                       4532 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      00AE66 00 0A                    1 	.word LINK 
                           003203     2 	LINK=.
      003203                          3 EEPROM:
      00AE68 35                       4 	.byte 6+F_IFUNC 	
      00AE69 06 00 09 81 4F 4D        5 	.ascii "EEPROM"
      00AE6D 00 2C                    6 	.word EEPROM_IDX 
      00320C                       4533 	_dict_entry,6+F_IFUNC,EEFREE,EEFREE_IDX; func_eefree 
      00AE6D 72 5F                    1 	.word LINK 
                           00320E     2 	LINK=.
      00320E                          3 EEFREE:
      00AE6F 00                       4 	.byte 6+F_IFUNC 	
      00AE70 07 72 5F 00 08 72        5 	.ascii "EEFREE"
      00AE76 5F 00                    6 	.word EEFREE_IDX 
      003217                       4534 	_dict_entry,4,EDIT,EDIT_IDX ; edit 
      00AE78 09 72                    1 	.word LINK 
                           003219     2 	LINK=.
      003219                          3 EDIT:
      00AE7A 5F                       4 	.byte 4 	
      00AE7B 00 0A CD 97              5 	.ascii "EDIT"
      00AE7F CB A1                    6 	.word EDIT_IDX 
      003220                       4535 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      00AE81 84 27                    1 	.word LINK 
                           003222     2 	LINK=.
      003222                          3 DWRITE:
      00AE83 C7                       4 	.byte 6+F_CMD 	
      00AE84 55 00 03 00 02 CE        5 	.ascii "DWRITE"
      00AE8A 00 1B                    6 	.word DWRITE_IDX 
      00AE8C                       4536 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      00AE8C C3 00                    1 	.word LINK 
                           00322D     2 	LINK=.
      00322D                          3 DREAD:
      00AE8E 1D                       4 	.byte 5+F_IFUNC 	
      00AE8F 24 17 90 93 CD           5 	.ascii "DREAD"
      00AE94 AE 42                    6 	.word DREAD_IDX 
      003235                       4537 	_dict_entry,2,DO,DO_IDX;do_loop
      00AE96 27 C6                    1 	.word LINK 
                           003237     2 	LINK=.
      00AE98                          3 DO:
      00AE98 93                       4 	.byte 2 	
      00AE99 E6 02                    5 	.ascii "DO"
      00AE9B C7 00                    6 	.word DO_IDX 
      00323C                       4538 	_dict_entry,3,DEC,DEC_IDX;dec_base
      00AE9D 0F 72                    1 	.word LINK 
                           00323E     2 	LINK=.
      00323E                          3 DEC:
      00AE9F 5F                       4 	.byte 3 	
      00AEA0 00 0E 72                 5 	.ascii "DEC"
      00AEA3 BB 00                    6 	.word DEC_IDX 
      003244                       4539 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      00AEA5 0E 20                    1 	.word LINK 
                           003246     2 	LINK=.
      003246                          3 DDR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



      00AEA7 E4                       4 	.byte 3+F_IFUNC 	
      00AEA8 44 44 52                 5 	.ascii "DDR"
      00AEA8 A6 0C                    6 	.word DDR_IDX 
      00324C                       4540 	_dict_entry,4,DATA,DATA_IDX;data  
      00AEAA CC 96                    1 	.word LINK 
                           00324E     2 	LINK=.
      00324E                          3 DATA:
      00AEAC C7                       4 	.byte 4 	
      00AEAD 44 41 54 41              5 	.ascii "DATA"
      00AEAD 52 06                    6 	.word DATA_IDX 
      00AEAF                       4541 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      00AEAF C6 00                    1 	.word LINK 
                           003257     2 	LINK=.
      003257                          3 CRL:
      00AEB1 09                       4 	.byte 3+F_IFUNC 	
      00AEB2 C1 00 0A                 5 	.ascii "CRL"
      00AEB5 27 37                    6 	.word CRL_IDX 
      00325D                       4542 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      00AEB7 CD A0                    1 	.word LINK 
                           00325F     2 	LINK=.
      00325F                          3 CRH:
      00AEB9 0D                       4 	.byte 3+F_IFUNC 	
      00AEBA CE 00 07                 5 	.ascii "CRH"
      00AEBD CF 00                    6 	.word CRH_IDX 
      003265                       4543 	_dict_entry,5,CONST,CONST_IDX; cmd_const 
      00AEBF 05 55                    1 	.word LINK 
                           003267     2 	LINK=.
      003267                          3 CONST:
      00AEC1 00                       4 	.byte 5 	
      00AEC2 09 00 02 55 00           5 	.ascii "CONST"
      00AEC7 0A 00                    6 	.word CONST_IDX 
      00326F                       4544 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      00AEC9 04 CD                    1 	.word LINK 
                           003271     2 	LINK=.
      003271                          3 CHAR:
      00AECB 9A                       4 	.byte 4+F_CFUNC 	
      00AECC B7 A1 84 27              5 	.ascii "CHAR"
      00AED0 03 CC                    6 	.word CHAR_IDX 
      003278                       4545 	_dict_entry,3,BYE,BYE_IDX;bye 
      00AED2 96 C5                    1 	.word LINK 
                           00327A     2 	LINK=.
      00AED4                          3 BYE:
      00AED4 1F                       4 	.byte 3 	
      00AED5 05 CD 97                 5 	.ascii "BYE"
      00AED8 CB CE                    6 	.word BYE_IDX 
      003280                       4546 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      00AEDA 00 05                    1 	.word LINK 
                           003282     2 	LINK=.
      003282                          3 BTOGL:
      00AEDC CF                       4 	.byte 5 	
      00AEDD 00 07 55 00 02           5 	.ascii "BTOGL"
      00AEE2 00 09                    6 	.word BTOGL_IDX 
      00328A                       4547 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      00AEE4 CD A0                    1 	.word LINK 
                           00328C     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



      00328C                          3 BTEST:
      00AEE6 1D                       4 	.byte 5+F_IFUNC 	
      00AEE7 1E 05 A6 84 5B           5 	.ascii "BTEST"
      00AEEC 06 81                    6 	.word BTEST_IDX 
      00AEEE                       4548 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      00AEEE 90 CE                    1 	.word LINK 
                           003296     2 	LINK=.
      003296                          3 BSET:
      00AEF0 00                       4 	.byte 4 	
      00AEF1 07 72 5F 00              5 	.ascii "BSET"
      00AEF5 07 72                    6 	.word BSET_IDX 
      00329D                       4549 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      00AEF7 5F 00                    1 	.word LINK 
                           00329F     2 	LINK=.
      00329F                          3 BRES:
      00AEF9 08                       4 	.byte 4 	
      00AEFA 72 5F 00 09              5 	.ascii "BRES"
      00AEFE 72 5F                    6 	.word BRES_IDX 
      0032A6                       4550 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      00AF00 00 0A                    1 	.word LINK 
                           0032A8     2 	LINK=.
      0032A8                          3 BIT:
      00AF02 CD                       4 	.byte 3+F_IFUNC 	
      00AF03 AE 98 20                 5 	.ascii "BIT"
      00AF06 A8 0C                    6 	.word BIT_IDX 
      00AF07                       4551 	_dict_entry,3,AWU,AWU_IDX;awu 
      00AF07 CD 99                    1 	.word LINK 
                           0032B0     2 	LINK=.
      0032B0                          3 AWU:
      00AF09 85                       4 	.byte 3 	
      00AF0A A1 02 27                 5 	.ascii "AWU"
      00AF0D 03 CC                    6 	.word AWU_IDX 
      0032B6                       4552 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      00AF0F 96 C5                    1 	.word LINK 
                           0032B8     2 	LINK=.
      00AF11                          3 ASC:
      00AF11 72                       4 	.byte 3+F_IFUNC 	
      00AF12 12 50 C7                 5 	.ascii "ASC"
      00AF15 85 5D                    6 	.word ASC_IDX 
      0032BE                       4553 	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
      00AF17 27 21                    1 	.word LINK 
                           0032C0     2 	LINK=.
      0032C0                          3 AND:
      00AF19 85                       4 	.byte 3+F_IFUNC 	
      00AF1A A6 08 42                 5 	.ascii "AND"
      00AF1D 9F C7                    6 	.word AND_IDX 
      0032C6                       4554 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      00AF1F 52 00                    1 	.word LINK 
                           0032C8     2 	LINK=.
      0032C8                          3 ADCREAD:
      00AF21 72                       4 	.byte 7+F_IFUNC 	
      00AF22 1A 50 14 72 1A 50 16     5 	.ascii "ADCREAD"
      00AF29 72 14                    6 	.word ADCREAD_IDX 
      0032D2                       4555 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      00AF2B 52 00                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



                           0032D4     2 	LINK=.
      0032D4                          3 ADCON:
      00AF2D 72                       4 	.byte 5 	
      00AF2E 12 52 01 72 10           5 	.ascii "ADCON"
      00AF33 52 01                    6 	.word ADCON_IDX 
      0032DC                       4556 kword_dict::
      0032DC                       4557 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      00AF35 72 1C                    1 	.word LINK 
                           0032DE     2 	LINK=.
      0032DE                          3 ABS:
      00AF37 52                       4 	.byte 3+F_IFUNC 	
      00AF38 00 81 53                 5 	.ascii "ABS"
      00AF3A 00 00                    6 	.word ABS_IDX 
                                   4558 
                                   4559 ;comands and fonctions address table 	
      0032E4                       4560 code_addr::
      00AF3A 5B 02 A6 82 C4 52 03  4561 	.word abs,power_adc,analog_read,bit_and,ascii,awu,bitmask ; 0..7
             A1 02 26 F7 72 1D 52
      00AF48 00 72 13 50 C7 72 1B  4562 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             50 16 81 28 10 2D A4
      00AF52 2D 9E 2D BC 2D 98 1B  4563 	.word const_cr1,data,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
             54 2D 08 25 69 25 A1
      00AF52 A6 78 C5 52 03 27 04  4564 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto,gpio ; 24..31 
             72 5F 52 03 81 21 80
             23 A9 23 8F 28 77
      00AF5E 1B 4F 2D 92 21 64 1F  4565 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             AD 2C F2 2C 61 2C 9F
             28 66
      00AF5E 88 CD AF 52 84 72 03  4566 	.word let,list,log2,lshift,next,new ; 40..47
             52 03 FB C7 52
      00AF6A 04 72 01 52 03 FB C6  4567 	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             52 04 81 2A A7 21 4C
             2D B0
      00AF74 21 2B 2D AA 1F 18 2D  4568 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             56 2D 5C 2D 62 2D 68
             2D 6E
      00AF74 A6 FF 72 01 52 03 E3  4569 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             C6 52 04 81 2D 00 B2
             20 4A
      00AF7F 2D ED 23 CF 2B 34 2A  4570 	.word restore,return, random,rshift,run,show,free ; 72..79
             6B 23 ED 1A CD 1B 59
      00AF7F CD 9A B7 A1 84 27 03  4571 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             CC 96 C5 21 E8 25 EC
             29 8D
      00AF89 2C 21 2C 38 21 AA 24  4572 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             86 1B A2 28 B2 2D 1C
             28 C7
      00AF89 9F CD AF 5E CD 97 CB  4573 	.word wait,words,write,bit_xor,cmd_size,cmd_on,cmd_get,cmd_const ; 96..99
             A1 08 26 02 20 E9 4D
             27 05
      00AF99 55 00 03 00           4574 	.word func_eefree,0 
                                   4575 
                                   4576 
                                   4577 
                                   4578 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal [24-Bits]



                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;   24 bits integers arithmetic 
                                      3 ;  format in registers A:X 
                                      4 ;    A   bits 31..24  
                                      5 ;    X   bits 23..0 
                                      6 ;  acc24  24 bits accumulator 
                                      7 ;  used in computation 
                                      8 ;  unless otherwise mentionned 
                                      9 ;  hold result. 
                                     10 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     11 
                                     12     .area CODE 
                                     13 
                           000001    14 .if DEBUG 
                                     15 ;;;;;;;;;;;;;;;;;;;;;;;;
                                     16 ;;;    TEST  CODE   ;;;;
                                     17 ;;;;;;;;;;;;;;;;;;;;;;;;
                                     18 
                           002710    19 LOOP_CNT=10000
                           02FFFF    20 VAL1=0x2ffff ; 196607
                           00002A    21 VAL2=0x2a    ; 42  
                           000003    22 VAL3=3 
                           0005FF    23 VAL4=0X5FF   ; 1535 
                           FFFFFFFD    24 VAL5=-3 
                                     25 ; test code
                           000001    26     T=1    ; .word 
                           000003    27     CNTR=3 ; .word 
                           000005    28     A32=5  ; .blkw 2
                           000008    29     VSIZE= 8 
      0033B0                         30 test:
      0033B0                         31     _vars VSIZE 
      00AF9D 02 81            [ 2]    1     sub sp,#VSIZE 
      00AF9F AE 27 10         [ 2]   32     ldw x,#LOOP_CNT
      00AF9F CD AF            [ 2]   33     ldw (CNTR,sp),x  
      00AFA1 74 5F 97         [ 2]   34     ldw x,ticks 
      00AFA4 A6 84            [ 2]   35     ldw (T,sp),x
      0033BC                         36 1$: ; test add24 
      00AFA6 81 02            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00AFA7 AE FF FF         [ 2]   38     ldw x,#VAL1&0XFFFF
      00AFA7 CD 97 CB         [ 1]   39     ld acc24,a 
      00AFAA A1 84 27         [ 2]   40     ldw acc24+1,x  
      00AFAD 03 CC            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00AFAF 96 C5 5D         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00AFB2 27 05 72         [ 4]   43     call add24 
      00AFB5 1B 50            [ 2]   44     ldw x,(CNTR,sp)
      00AFB7 14 81 01         [ 2]   45     subw x,#1
      00AFB9 1F 03            [ 2]   46     ldw (CNTR,sp),x 
      00AFB9 72 1A            [ 1]   47     jrne 1$
      00AFBB 50 14 81         [ 4]   48     call prt_acc24
      00AFBE A6 20            [ 1]   49     ld a,#SPACE 
      00AFBE AE 16 B8         [ 4]   50     call putc 
      00AFC1 B6 84 81         [ 2]   51     ldw x,ticks 
      00AFC4 72 F0 01         [ 2]   52     subw x,(T,sp)
      00AFC4 00 00 A1         [ 4]   53     call prt_i16  
      00AFC6 A6 0D            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 227.
Hexadecimal [24-Bits]



      00AFC6 43 58 4F         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00AFC9 52 00 BE         [ 2]   58     ldw x,LOOP_CNT
      00AFCC AF C6            [ 2]   59     ldw (CNTR,sp),x 
      00AFCE CE 00 0F         [ 2]   60     ldw x,ticks 
      00AFCE 05 57            [ 2]   61     ldw (T,sp),x 
      0033F8                         62 2$: 
      00AFD0 52 49            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00AFD2 54 45 00         [ 2]   64     ldw x,#VAL1&0XFFFF
      00AFD5 BC AF CE         [ 1]   65     ld acc24,a 
      00AFD8 CF 00 0D         [ 2]   66     ldw acc24+1,x  
      00AFD8 05 57            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00AFDA 4F 52 44         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00AFDD 53 00 BA         [ 4]   69     call mul24 
      00AFE0 AF D8            [ 2]   70     ldw x,(CNTR,sp)
      00AFE2 1D 00 01         [ 2]   71     subw x,#1
      00AFE2 04 57            [ 2]   72     ldw (CNTR,sp),x 
      00AFE4 41 49            [ 1]   73     jrne 2$ 
      00AFE6 54 00 B8         [ 4]   74    call prt_acc24 
      00AFE9 AF E2            [ 1]   75    ld a,#SPACE 
      00AFEB CD 08 FD         [ 4]   76    call putc 
      00AFEB 43 55 53         [ 2]   77     ldw x,ticks 
      00AFEE 52 00 B6         [ 2]   78     subw x,(T,sp)
      00AFF1 AF EB A1         [ 4]   79     call prt_i16 
      00AFF3 A6 0D            [ 1]   80     ld a,#CR 
      00AFF3 05 55 4E         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00AFF6 54 49 4C         [ 2]   83     ldw x,LOOP_CNT
      00AFF9 00 B4            [ 2]   84     ldw (CNTR,sp),x 
      00AFFB AF F3 0F         [ 2]   85     ldw x,ticks 
      00AFFD 1F 01            [ 2]   86     ldw (T,sp),x 
      003434                         87 3$: 
      00AFFD 46 55            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00AFFF 46 4C 41         [ 2]   89     ldw x,#VAL1&0XFFFF
      00B002 53 48 00         [ 1]   90     ld acc24,a 
      00B005 B2 AF FD         [ 2]   91     ldw acc24+1,x  
      00B008 A6 00            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00B008 46 55 42         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00B00B 4F 55 4E         [ 4]   94     call mul24 
      00B00E 44 00            [ 2]   95     ldw x,(CNTR,sp)
      00B010 B0 B0 08         [ 2]   96     subw x,#1
      00B013 1F 03            [ 2]   97     ldw (CNTR,sp),x 
      00B013 04 54            [ 1]   98     jrne 3$ 
      00B015 4F 4E 45         [ 4]   99     call prt_acc24    
      00B018 00 AE            [ 1]  100     ld a,#SPACE 
      00B01A B0 13 FD         [ 4]  101     call putc 
      00B01C CE 00 0F         [ 2]  102     ldw x,ticks 
      00B01C 02 54 4F         [ 2]  103     subw x,(T,sp)
      00B01F 00 AC B0         [ 4]  104     call prt_i16 
      00B022 1C 0D            [ 1]  105     ld a,#CR 
      00B023 CD 08 FD         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00B023 05 54 49         [ 2]  108     ldw x,LOOP_CNT
      00B026 4D 45            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
Hexadecimal [24-Bits]



      00B028 52 00 A8         [ 2]  110     ldw x,ticks 
      00B02B B0 23            [ 2]  111     ldw (T,sp),x 
      00B02D                        112 4$:
      00B02D 47 54            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00B02F 49 4D 45         [ 2]  114     ldw x,#VAL1&0XFFFF
      00B032 4F 55 54         [ 1]  115     ld acc24,a 
      00B035 00 AA B0         [ 2]  116     ldw acc24+1,x  
      00B038 2D FF            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00B039 AE FF FD         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00B039 45 54 49         [ 4]  119     call mul24 
      00B03C 43 4B            [ 2]  120     ldw x,(CNTR,sp)
      00B03E 53 00 A6         [ 2]  121     subw x,#1
      00B041 B0 39            [ 2]  122     ldw (CNTR,sp),x 
      00B043 26 E4            [ 1]  123     jrne 4$ 
      00B043 04 53 54         [ 4]  124     call prt_acc24 
      00B046 4F 50            [ 1]  125     ld a,#SPACE 
      00B048 00 A4 B0         [ 4]  126     call putc 
      00B04B 43 00 0F         [ 2]  127     ldw x,ticks 
      00B04C 72 F0 01         [ 2]  128     subw x,(T,sp)
      00B04C 04 53 54         [ 4]  129     call prt_i16 
      00B04F 45 50            [ 1]  130     ld a,#CR 
      00B051 00 A2 B0         [ 4]  131     call putc 
                                    132 ; test abs24 
      00B054 4C 27 10         [ 2]  133     ldw x,LOOP_CNT
      00B055 1F 03            [ 2]  134     ldw (CNTR,sp),x 
      00B055 05 53 50         [ 2]  135     ldw x,ticks 
      00B058 49 57            [ 2]  136     ldw (T,sp),x 
      0034AC                        137 5$: 
      00B05A 52 00            [ 1]  138     ld a,#0xff
      00B05C A0 B0 55         [ 2]  139     ldw x,#0xffff
      00B05F CD 01 A3         [ 4]  140     call abs24 
      00B05F 06 53 50         [ 1]  141     ld acc24,a 
      00B062 49 53 45         [ 2]  142     ldw acc24+1,x
      00B065 4C 00            [ 2]  143     ldw x,(CNTR,sp)
      00B067 9E B0 5F         [ 2]  144     subw x,#1
      00B06A 1F 03            [ 2]  145     ldw (CNTR,sp),x 
      00B06A 45 53            [ 1]  146     jrne 5$ 
      00B06C 50 49 52         [ 4]  147     call prt_acc24 
      00B06F 44 00            [ 1]  148     ld a,#SPACE 
      00B071 9A B0 6A         [ 4]  149     call putc 
      00B074 CE 00 0F         [ 2]  150     ldw x,ticks 
      00B074 05 53 50         [ 2]  151     subw x,(T,sp)
      00B077 49 45 4E         [ 4]  152     call prt_i16 
      0034D4                        153 6$:
      00B07A 00 9C            [ 1]  154     ld a,#CR 
      00B07C B0 74 FD         [ 4]  155     call putc 
      00B07E CD 35 1F         [ 4]  156     call read_integer 
      00B07E 05 53 4C 45 45   [ 1]  157     mov farptr,acc24 
      00B083 50 00 98 B0 7E   [ 1]  158     mov farptr+1,acc16 
      00B088 55 00 0E 00 19   [ 1]  159     mov farptr+2,acc8 
      00B088 04 53 49         [ 4]  160     call read_integer 
      00B08B 5A 45 00         [ 1]  161     ld a,acc24 
      00B08E C0 B0 88         [ 2]  162     ldw x,acc16 
      00B091 55 00 17 00 0C   [ 1]  163     mov acc24,farptr 
      00B091 04 53 48 4F 57   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



      00B096 00 94 B0 91 0E   [ 1]  165     mov acc8,farptr+2 
      00B09A CD 02 E5         [ 4]  166     call div24 
      00B09A 04               [ 1]  167     push a 
      00B09B 53               [ 2]  168     pushw x 
      00B09C 41 56 45         [ 4]  169     call prt_acc24 
      00B09F 00 34            [ 1]  170     ld a,#SPACE 
      00B0A1 B0 9A FD         [ 4]  171     call putc 
      00B0A3 85               [ 2]  172     popw x
      00B0A3 03 52 55         [ 2]  173     ldw acc16,x  
      00B0A6 4E 00 92         [ 1]  174     pop acc24 
      00B0A9 B0 A3 B1         [ 4]  175     call prt_acc24
      00B0AB 20 B8            [ 2]  176     jra 6$
      00351C                        177     _drop VSIZE 
      00B0AB 46 52            [ 2]    1     addw sp,#VSIZE 
      00B0AD 53               [ 4]  178     ret 
                                    179 
                                    180 
      00351F                        181 read_integer:
      00B0AE 48 49            [ 1]  182     ld a,#'? 
      00B0B0 46 54 00         [ 4]  183     call putc  
      00B0B3 90 B0 AB 03      [ 1]  184 	clr count  
      00B0B6 CD 0A 5F         [ 4]  185 	call readln 
      00B0B6 43 52 4E         [ 2]  186 	ldw x,#tib 
      00B0B9 44 00 8E         [ 1]  187 	push count
      00B0BC B0 B6            [ 1]  188 	push #0 
      00B0BE 72 FB 01         [ 2]  189 	addw x,(1,sp)
      00B0BE 06               [ 1]  190 	incw x 
      003537                        191 	_drop 2 
      00B0BF 52 45            [ 2]    1     addw sp,#2 
      00B0C1 54 55 52 4E      [ 1]  192 	clr in 
      00B0C5 00 8C B0         [ 4]  193 	call get_token
      00B0C8 BE 84            [ 1]  194 	cp a,#TK_INTGR
      00B0C9 27 0F            [ 1]  195 	jreq 3$ 
      00B0C9 07 52            [ 1]  196 	cp a,#TK_MINUS
      00B0CB 45 53 54         [ 4]  197 	call get_token 
      00B0CE 4F 52            [ 1]  198 	cp a,#TK_INTGR 
      00B0D0 45 00            [ 1]  199 	jreq 2$
      00B0D2 8A B0 C9         [ 2]  200 	jp syntax_error
      00B0D5                        201 2$:
      00B0D5 03 52 45         [ 4]  202 	call neg_acc24  	
      003553                        203 3$: 
      00B0D8 4D               [ 4]  204     ret 
                                    205 
                                    206 .endif ; DEBUG  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
Hexadecimal [24-Bits]



                                      1 ;;
                                      2 ; Copyright Jacques Deschênes 2019,2020,2021,2022  
                                      3 ; This file is part of stm8_tbi 
                                      4 ;
                                      5 ;     stm8_tbi is free software: you can redistribute it and/or modify
                                      6 ;     it under the terms of the GNU General Public License as published by
                                      7 ;     the Free Software Foundation, either version 3 of the License, or
                                      8 ;     (at your option) any later version.
                                      9 ;
                                     10 ;     stm8_tbi is distributed in the hope that it will be useful,
                                     11 ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                     12 ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                     13 ;     GNU General Public License for more details.
                                     14 ;
                                     15 ;     You should have received a copy of the GNU General Public License
                                     16 ;     along with stm8_tbi.  If not, see <http://www.gnu.org/licenses/>.
                                     17 ;;
                                     18 
                                     19     .module APP_SPACE
                                     20 
                                     21 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     22 ;;  application space 
                                     23 ;;  *** must be last to be linked ***
                                     24 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     25 
                                     26 
                                     27     .area CODE 
      003580                         28 	.bndry 128 ; align on FLASH block.
                                     29 ; space for user application  
      003580                         30 app_space::
      00B0D9 00 88                   31 app_sign: .word 0 ; .ascii "BC"  ; signature 
      00B0DB B0 D5                   32 app_size: .word 0 ; 31 
      00B0DD                         33 app: 
                                     34 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     35 ;;  BASIC code demo 'BLINK.BAS' 
                                     36 ;; 10 do btogl $500a,32 pause 250 until qkey bres $500a,32 end 
                                     37 ;; byte code generated by compiler.
                                     38 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     39 ;.byte 0,10,31,128,0,38,128,0,20,132,80,10,9,132,0,32,128
                                     40 ;.byte 0,100,132,0,250,128,0,182,129,0,132,128,0,46
                                     41 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 231.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     A32     =  000005     |   4 ABS        0032DE R
    ABS_IDX =  000000     |     ACK     =  000006     |   4 ADCON      0032D4 R
    ADCON_ID=  000002     |   4 ADCREAD    0032C8 R   |     ADCREAD_=  000004 
    ADC_CR1 =  005401     |     ADC_CR1_=  000000     |     ADC_CR1_=  000001 
    ADC_CR1_=  000004     |     ADC_CR1_=  000005     |     ADC_CR1_=  000006 
    ADC_CR2 =  005402     |     ADC_CR2_=  000003     |     ADC_CR2_=  000004 
    ADC_CR2_=  000005     |     ADC_CR2_=  000006     |     ADC_CR2_=  000001 
    ADC_CR3 =  005403     |     ADC_CR3_=  000007     |     ADC_CR3_=  000006 
    ADC_CSR =  005400     |     ADC_CSR_=  000006     |     ADC_CSR_=  000004 
    ADC_CSR_=  000000     |     ADC_CSR_=  000001     |     ADC_CSR_=  000002 
    ADC_CSR_=  000003     |     ADC_CSR_=  000007     |     ADC_CSR_=  000005 
    ADC_DRH =  005404     |     ADC_DRL =  005405     |     ADC_TDRH=  005406 
    ADC_TDRL=  005407     |     ADDR    =  000003     |     ADR     =  000002 
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
  4 AND        0032C0 R   |     AND_IDX =  000006     |     ARG_OFS =  000002 
    ARROW_LE=  000080     |     ARROW_RI=  000081     |   4 ASC        0032B8 R
    ASC_IDX =  000008     |     ATTRIB  =  000002     |   4 AUTO_RUN   000145 R
  4 AWU        0032B0 R   |   4 AWUHandl   000004 R   |     AWU_APR =  0050F1 
    AWU_CSR =  0050F0     |     AWU_CSR_=  000004     |     AWU_IDX =  00000A 
    AWU_TBR =  0050F2     |     B0_MASK =  000001     |     B115200 =  000006 
    B19200  =  000003     |     B1_MASK =  000002     |     B230400 =  000007 
    B2400   =  000000     |     B2_MASK =  000004     |     B38400  =  000004 
    B3_MASK =  000008     |     B460800 =  000008     |     B4800   =  000001 
    B4_MASK =  000010     |     B57600  =  000005     |     B5_MASK =  000020 
    B6_MASK =  000040     |     B7_MASK =  000080     |     B921600 =  000009 
    B9600   =  000002     |     BASE    =  000002     |     BASE_SAV=  000001 
    BCNT    =  000001     |     BEEP_BIT=  000004     |     BEEP_CSR=  0050F3 
    BEEP_MAS=  000010     |     BEEP_POR=  00000F     |     BELL    =  000007 
    BINARY  =  000001     |   4 BIT        0032A8 R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BIT_IDX =  00000C     |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |     BPTR    =  00000C 
  4 BRES       00329F R   |     BRES_IDX=  00000E     |     BS      =  000008 
  4 BSET       003296 R   |     BSET_IDX=  000010     |     BSIZE   =  000006 
  4 BTEST      00328C R   |     BTEST_ID=  000012     |   4 BTOGL      003282 R
    BTOGL_ID=  000014     |     BTW     =  000001     |     BUFPTR  =  000003 
  4 BYE        00327A R   |     BYE_IDX =  000016     |     C       =  000001 
    CAN     =  000018     |   4 CANT_DO    002775 R   |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CCOMMA  =  000001 
    CC_C    =  000000     |     CC_H    =  000004     |     CC_I0   =  000003 
    CC_I1   =  000005     |     CC_N    =  000002     |     CC_V    =  000007 
    CC_Z    =  000001     |     CELL_SIZ=  000003     |     CFG_GCR =  007F60 
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   4 CHAR       003271 R
    CHAR_IDX=  000018     |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
Hexadecimal [24-Bits]

Symbol Table

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
    CLK_SWR_=  0000D2     |     CMDX    =  000001     |     CMD_END =  000002 
    CNAME   =  000001     |     CNT     =  000006     |     CNTR    =  000003 
    CNT_LO  =  000004     |     COMMA   =  00002C     |   4 CONST      003267 R
  4 CONST_CO   001C50 R   |     CONST_ID=  0000C6     |     CONST_RE=  000005 
    COUNT   =  000003     |     CPOS    =  000003     |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |     CR      =  00000D     |   4 CRH        00325F R
    CRH_IDX =  00001A     |   4 CRL        003257 R   |     CRL_IDX =  00001C 
    CTRL_A  =  000001     |     CTRL_B  =  000002     |     CTRL_C  =  000003 
    CTRL_D  =  000004     |     CTRL_E  =  000005     |     CTRL_F  =  000006 
    CTRL_G  =  000007     |     CTRL_H  =  000008     |     CTRL_I  =  000009 
    CTRL_J  =  00000A     |     CTRL_K  =  00000B     |     CTRL_L  =  00000C 
    CTRL_M  =  00000D     |     CTRL_N  =  00000E     |     CTRL_O  =  00000F 
    CTRL_P  =  000010     |     CTRL_Q  =  000011     |     CTRL_R  =  000012 
    CTRL_S  =  000013     |     CTRL_T  =  000014     |     CTRL_U  =  000015 
    CTRL_V  =  000016     |     CTRL_W  =  000017     |     CTRL_X  =  000018 
    CTRL_Y  =  000019     |     CTRL_Z  =  00001A     |     CTXT_SIZ=  000004 
    CTX_BPTR=  000001     |     CTX_COUN=  000004     |     CTX_IN  =  000003 
    CURR    =  000002     |     CVAR    =  000008     |     CX_BPTR =  000001 
    CX_CNT  =  000004     |     CX_IN   =  000003     |   4 DATA       00324E R
    DATA_IDX=  00001E     |     DBG_A   =  000008     |     DBG_CC  =  000009 
    DBG_X   =  000006     |     DBG_Y   =  000004     |     DC1     =  000011 
    DC2     =  000012     |     DC3     =  000013     |     DC4     =  000014 
  4 DDR        003246 R   |     DDR_IDX =  000020     |     DEBUG   =  000001 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   4 DEC        00323E R
    DEC_IDX =  000022     |     DEPTH   =  000001     |     DEST    =  000001 
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |     DIVISOR =  000001 
    DIVSOR  =  000001     |     DLE     =  000010     |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   4 DO         003237 R   |     DOLP_ADR=  000003 
    DOLP_INW=  000005     |     DO_IDX  =  000024     |   4 DREAD      00322D R
    DREAD_ID=  000026     |   4 DWRITE     003222 R   |     DWRITE_I=  000028 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 233.
Hexadecimal [24-Bits]

Symbol Table

  4 EDIT       003219 R   |     EDIT_IDX=  00002A     |   4 EEFREE     00320E R
    EEFREE_I=  0000C8     |   4 EEPROM     003203 R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_I=  00002C     |     EEPROM_S=  000800 
    EEPTR   =  000003     |     EM      =  000019     |   4 END        0031FB R
    END_IDX =  00002E     |     ENQ     =  000005     |     EOF     =  0000FF 
    EOT     =  000004     |   4 ERASE      0031F1 R   |     ERASE_ID=  000030 
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_OVER=  000010 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    ETB     =  000017     |     ETX     =  000003     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FAUTORUN=  000006     |     FBREAK  =  000004 
    FCOMP   =  000005     |   4 FCPU       0031E8 R   |     FCPU_IDX=  000032 
    FF      =  00000C     |     FHSE    =  7A1200     |     FHSI    =  F42400 
    FIRST   =  000001     |     FIRST_DA=  000006     |     FLASH_BA=  008000 
    FLASH_CR=  00505A     |     FLASH_CR=  000002     |     FLASH_CR=  000000 
    FLASH_CR=  000003     |     FLASH_CR=  000001     |     FLASH_CR=  00505B 
    FLASH_CR=  000005     |     FLASH_CR=  000004     |     FLASH_CR=  000007 
    FLASH_CR=  000000     |     FLASH_CR=  000006     |     FLASH_DU=  005064 
    FLASH_DU=  0000AE     |     FLASH_DU=  000056     |     FLASH_EN=  027FFF 
    FLASH_FP=  00505D     |     FLASH_FP=  000000     |     FLASH_FP=  000001 
    FLASH_FP=  000002     |     FLASH_FP=  000003     |     FLASH_FP=  000004 
    FLASH_FP=  000005     |     FLASH_IA=  00505F     |     FLASH_IA=  000003 
    FLASH_IA=  000002     |     FLASH_IA=  000006     |     FLASH_IA=  000001 
    FLASH_IA=  000000     |   4 FLASH_ME   001DEB R   |     FLASH_NC=  00505C 
    FLASH_NF=  00505E     |     FLASH_NF=  000000     |     FLASH_NF=  000001 
    FLASH_NF=  000002     |     FLASH_NF=  000003     |     FLASH_NF=  000004 
    FLASH_NF=  000005     |     FLASH_PU=  005062     |     FLASH_PU=  000056 
    FLASH_PU=  0000AE     |     FLASH_SI=  020000     |     FLASH_WS=  00480D 
    FLOOP   =  000002     |     FLSI    =  01F400     |   4 FOR        0031E0 R
    FOR_IDX =  000036     |   4 FREE       0031D7 R   |     FREE_IDX=  000096 
    FRUN    =  000000     |     FS      =  00001C     |     FSLEEP  =  000003 
    FSTEP   =  000003     |     FTRAP   =  000001     |     FUPDATE =  000007 
    F_CFUNC =  000080     |     F_CMD   =  000000     |     F_CONST =  0000C0 
    F_IFUNC =  000040     |   4 GET        0031CF R   |     GET_IDX =  0000C4 
  4 GOSUB      0031C5 R   |     GOSUB_ID=  000038     |   4 GOTO       0031BC R
    GOTO_IDX=  00003A     |   4 GPIO       0031B3 R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_IDX=  00003C     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |     GS      =  00001D     |   4 HEX        0031AB R
    HEX_IDX =  00003E     |     HOME    =  000082     |     HSECNT  =  004809 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 234.
Hexadecimal [24-Bits]

Symbol Table

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
  4 IDR        0031A3 R   |     IDR_IDX =  000040     |   4 IF         00319C R
    IF_IDX  =  000042     |     IN      =  000005     |     INCR    =  000001 
    INP     =  000000     |   4 INPUT      003192 R   |     INPUT_DI=  000000 
    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_ID=  000044 
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
    INT_VECT=  00805C     |     INT_VECT=  008058     |   4 INVERT     003187 R
    INVERT_I=  000046     |     INW     =  00000A     |     IPOS    =  000001 
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |   4 IWDGEN     00317C R
    IWDGEN_I=  000048     |   4 IWDGREF    003170 R   |     IWDGREF_=  00004A 
    IWDG_KEY=  000055     |     IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
    KCHAR   =  000002     |   4 KEY        003168 R   |     KEY_END =  000083 
    KEY_IDX =  00004C     |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000002     |   4 LET        003160 R   |     LET_IDX =  00004E 
    LF      =  00000A     |     LIMIT   =  000001     |     LINENO  =  000005 
  4 LINK    =  0032DE R   |   4 LIST       003157 R   |     LIST_IDX=  000050 
    LL      =  000001     |     LLEN    =  000002     |     LL_HB   =  000001 
    LN_PTR  =  000005     |   4 LOG        00314F R   |     LOG_IDX =  000052 
    LOOP_CNT=  002710     |   4 LSHIFT     003144 R   |     LSHIFT_I=  000054 
    MAJOR   =  000002     |     MASK    =  000002     |     MAX_LINE=  007FFF 
    MINOR   =  000000     |     MULOP   =  000001     |     N1      =  000004 
    N2      =  000007     |     NAFR    =  004804     |     NAK     =  000015 
    NAMEPTR =  000001     |     NCLKOPT =  004808     |     NEG     =  000001 
  4 NEW        00313C R   |     NEW_IDX =  000058     |   4 NEXT       003133 R
    NEXT_IDX=  000056     |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
Hexadecimal [24-Bits]

Symbol Table

    NLEN    =  000001     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  4 NOT        00312B R   |     NOT_IDX =  00005A     |   4 NOT_SAVE   001EDD R
  4 NO_APP     0027B7 R   |     NUBC    =  004802     |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   4 NonHandl   000000 R   |   4 ODR        003123 R
    ODR_IDX =  00005C     |   4 ON         00311C R   |     ONOFF   =  000003 
    ON_IDX  =  0000C2     |     OP      =  000001     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  4 OR         003115 R   |     OR_IDX  =  00005E     |     OUTP    =  000001 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVRWR   =  000004     |     PA      =  000000 
  4 PAD        00310D R   |     PAD_IDX =  000060     |     PAD_SIZE=  000080 
  4 PAUSE      003103 R   |     PAUSE_ID=  000062     |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  4 PEEK       0030FA R   |     PEEK_IDX=  000066     |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
    PG_ODR  =  00501E     |     PH      =  000023     |     PH_BASE =  005023 
    PH_CR1  =  005026     |     PH_CR2  =  005027     |     PH_DDR  =  005025 
    PH_IDR  =  005024     |     PH_ODR  =  005023     |     PI      =  000028 
    PINNO   =  000001     |   4 PINP       0030F1 R   |     PINP_IDX=  000068 
    PINVAL  =  000002     |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   4 PMODE      0030E7 R   |     PMODE_ID=  000064 
  4 POKE       0030DE R   |     POKE_IDX=  00006A     |   4 POUT       0030D5 R
    POUT_IDX=  00006C     |     PREV    =  000001     |   4 PRINT      0030CB R
    PROD    =  000001     |     PROD_SIG=  00000A     |   4 PROG_ADD   001DC1 R
  4 PROG_SIZ   001DD3 R   |   4 PRTA       0030C2 R   |     PRTA_IDX=  000070 
  4 PRTB       0030B9 R   |     PRTB_IDX=  000072     |   4 PRTC       0030B0 R
    PRTC_IDX=  000074     |   4 PRTD       0030A7 R   |     PRTD_IDX=  000076 
  4 PRTE       00309E R   |     PRTE_IDX=  000078     |   4 PRTF       003095 R
    PRTF_IDX=  00007A     |   4 PRTG       00308C R   |     PRTG_IDX=  00007C 
  4 PRTH       003083 R   |     PRTH_IDX=  00007E     |   4 PRTI       00307A R
    PRTI_IDX=  000080     |     PRT_IDX =  00006E     |     PSIZE   =  000001 
    PSTR    =  000003     |   4 QKEY       003071 R   |     QKEY_IDX=  000082 
    QSIGN   =  000005     |     RAM_BASE=  000000     |     RAM_END =  0017FF 
  4 RAM_MEM    001DFC R   |     RAM_SIZE=  001800     |     RBT_IDX =  000086 
  4 READ       003068 R   |     READ_IDX=  000084     |   4 REBOOT     00305D R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 236.
Hexadecimal [24-Bits]

Symbol Table

    RECLEN  =  000005     |   4 REG_A      000520 R   |   4 REG_CC     000524 R
  4 REG_EPC    000513 R   |   4 REG_SP     000529 R   |   4 REG_X      00051C R
  4 REG_Y      000518 R   |     RELOP   =  000001     |   4 REM        003055 R
    REM_IDX =  000088     |   4 RESTORE    003049 R   |     REST_IDX=  00008A 
    RETL1   =  000001     |   4 RETURN     00303E R   |     RET_ADDR=  000003 
    RET_BPTR=  000003     |     RET_IDX =  00008C     |     RET_INW =  000005 
  4 RND        003036 R   |     RND_IDX =  00008E     |     ROP     =  004800 
    RS      =  00001E     |   4 RSHIFT     00302B R   |     RSHIFT_I=  000090 
    RSIGN   =  000006     |     RST_SR  =  0050B3     |   4 RUN        003023 R
    RUN_IDX =  000092     |     RXCHAR  =  000001     |     RX_QUEUE=  000008 
    R_A     =  000007     |     R_CC    =  000008     |     R_X     =  000005 
    R_Y     =  000003     |   4 SAVE       00301A R   |     SAVE_IDX=  000034 
    SEPARATE=  000000     |     SFR_BASE=  005000     |     SFR_END =  0057FF 
    SHARP   =  000023     |   4 SHOW       003011 R   |     SHOW_IDX=  000094 
    SI      =  00000F     |     SIGN    =  000001     |   4 SIGNATUR   002773 R
  4 SIZE       003008 R   |     SIZE_IDX=  0000C0     |     SKIP    =  000005 
  4 SLEEP      002FFE R   |     SLEEP_ID=  000098     |     SO      =  00000E 
    SOH     =  000001     |     SPACE   =  000020     |   4 SPIEN      002FF4 R
    SPIEN_ID=  00009C     |   4 SPIRD      002FEA R   |     SPIRD_ID=  00009A 
  4 SPISEL     002FDF R   |     SPISEL_I=  00009E     |   4 SPIWR      002FD5 R
    SPIWR_ID=  0000A0     |     SPI_CR1 =  005200     |     SPI_CR1_=  000003 
    SPI_CR1_=  000000     |     SPI_CR1_=  000001     |     SPI_CR1_=  000007 
    SPI_CR1_=  000002     |     SPI_CR1_=  000006     |     SPI_CR2 =  005201 
    SPI_CR2_=  000007     |     SPI_CR2_=  000006     |     SPI_CR2_=  000005 
    SPI_CR2_=  000004     |     SPI_CR2_=  000002     |     SPI_CR2_=  000000 
    SPI_CR2_=  000001     |     SPI_CRCP=  005205     |     SPI_CS_B=  000005 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_SR_B=  000007     |     SPI_SR_C=  000004 
    SPI_SR_M=  000005     |     SPI_SR_O=  000006     |     SPI_SR_R=  000000 
    SPI_SR_T=  000001     |     SPI_SR_W=  000003     |     SPI_TXCR=  005207 
    SRC     =  000003     |     STACK_EM=  0017FF     |     STACK_SI=  00008C 
  4 STATES     0004D6 R   |   4 STEP       002FCC R   |     STEP_IDX=  0000A2 
  4 STOP       002FC3 R   |     STOP_IDX=  0000A4     |     STR     =  000003 
  4 STR_BYTE   001DE4 R   |     STX     =  000002     |     SUB     =  00001A 
    SUP     =  000084     |     SWIM_CSR=  007F80     |     SYN     =  000016 
    T       =  000001     |     TAB     =  000009     |     TABW    =  000004 
    TAB_WIDT=  000004     |     TARGET  =  000001     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  4 TICKS      002FB9 R   |     TICKS_ID=  0000A6     |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM1_SR1=  000001     |     TIM1_SR1=  000002     |     TIM1_SR1=  000003 
    TIM1_SR1=  000004     |     TIM1_SR1=  000005     |     TIM1_SR1=  000006 
    TIM1_SR1=  000000     |     TIM1_SR2=  005256     |     TIM1_SR2=  000001 
    TIM1_SR2=  000002     |     TIM1_SR2=  000003     |     TIM1_SR2=  000004 
    TIM2_ARR=  00530D     |     TIM2_ARR=  00530E     |     TIM2_CCE=  005308 
    TIM2_CCE=  000000     |     TIM2_CCE=  000001     |     TIM2_CCE=  000004 
    TIM2_CCE=  000005     |     TIM2_CCE=  005309     |     TIM2_CCM=  005305 
    TIM2_CCM=  005306     |     TIM2_CCM=  005307     |     TIM2_CCM=  000000 
    TIM2_CCM=  000004     |     TIM2_CCM=  000003     |     TIM2_CCR=  00530F 
    TIM2_CCR=  005310     |     TIM2_CCR=  005311     |     TIM2_CCR=  005312 
    TIM2_CCR=  005313     |     TIM2_CCR=  005314     |     TIM2_CLK=  00F424 
    TIM2_CNT=  00530A     |     TIM2_CNT=  00530B     |     TIM2_CR1=  005300 
    TIM2_CR1=  000007     |     TIM2_CR1=  000000     |     TIM2_CR1=  000003 
    TIM2_CR1=  000001     |     TIM2_CR1=  000002     |     TIM2_EGR=  005304 
    TIM2_EGR=  000001     |     TIM2_EGR=  000002     |     TIM2_EGR=  000003 
    TIM2_EGR=  000006     |     TIM2_EGR=  000000     |     TIM2_IER=  005301 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_EGR=  005343     |     TIM4_EGR=  000000     |     TIM4_IER=  005341 
    TIM4_IER=  000000     |     TIM4_PSC=  005345     |     TIM4_PSC=  000000 
    TIM4_PSC=  000007     |     TIM4_PSC=  000004     |     TIM4_PSC=  000001 
    TIM4_PSC=  000005     |     TIM4_PSC=  000002     |     TIM4_PSC=  000006 
    TIM4_PSC=  000003     |     TIM4_PSC=  000000     |     TIM4_PSC=  000001 
    TIM4_PSC=  000002     |     TIM4_SR =  005342     |     TIM4_SR_=  000000 
  4 TIMEOUT    002FAD R   |   4 TIMER      002FA3 R   |     TIMER_ID=  0000A8 
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |     TK_ARRAY=  000005 
    TK_CFUNC=  000082     |     TK_CHAR =  000004     |     TK_CMD  =  000080 
    TK_COLON=  00000A     |     TK_COMMA=  000008     |     TK_CONST=  000083 
    TK_DIV  =  000021     |     TK_EQUAL=  000032     |     TK_FLOAT=  000086 
    TK_GE   =  000033     |     TK_GRP_A=  000010     |     TK_GRP_M=  000030 
    TK_GRP_M=  000000     |     TK_GRP_M=  000020     |     TK_GRP_R=  000030 
    TK_GT   =  000031     |     TK_IFUNC=  000081     |     TK_INTGR=  000084 
    TK_LABEL=  000003     |     TK_LE   =  000036     |     TK_LPARE=  000006 
    TK_LT   =  000034     |     TK_MINUS=  000011     |     TK_MOD  =  000022 
    TK_MULT =  000020     |     TK_NE   =  000035     |     TK_NONE =  000000 
    TK_PLUS =  000010     |     TK_QSTR =  000002     |     TK_RPARE=  000007 
    TK_SHARP=  000009     |     TK_VAR  =  000085     |     TMROUT_I=  0000AA 
  4 TO         002F9C R   |   4 TONE       002F93 R   |     TONE_IDX=  0000AE 
    TOWRITE =  000005     |     TO_IDX  =  0000AC     |   4 Timer4Up   00001E R
  4 TrapHand   000012 R   |     U8      =  000001     |     UART1   =  000000 
    UART1_BA=  005230     |     UART1_BR=  005232     |     UART1_BR=  005233 
    UART1_CR=  005234     |     UART1_CR=  005235     |     UART1_CR=  005236 
    UART1_CR=  005237     |     UART1_CR=  005238     |     UART1_DR=  005231 
    UART1_GT=  005239     |     UART1_PO=  000000     |     UART1_PS=  00523A 
    UART1_RX=  000004     |     UART1_SR=  005230     |     UART1_TX=  000005 
    UART2   =  000001     |     UART3   =  000002     |     UART3_BA=  005240 
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
    UART_SR_=  000007     |     UBC     =  004801     |   4 UBOUND     002F88 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]

Symbol Table

    UBOUND_I=  0000B0     |   4 UBTN_Han   000057 R   |   4 UFLASH     002F7D R
    UFLASH_I=  0000B2     |   4 UNTIL      002F73 R   |     UNTIL_ID=  0000B4 
    US      =  00001F     |   4 USER_ABO   00005F R   |   4 USR        002F6B R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    USR_IDX =  0000B6     |   4 Uart1RxH   00088B R   |   4 UserButt   000033 R
    VAL1    =  02FFFF     |     VAL2    =  00002A     |     VAL3    =  000003 
    VAL4    =  0005FF     |     VAL5    =  FFFFFFFD     |     VSISE   =  000003 
    VSIZE   =  000008     |     VT      =  00000B     |   4 WAIT       002F62 R
    WAIT_IDX=  0000B8     |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  4 WORDS      002F58 R   |     WORDS_ID=  0000BA     |   4 WRITE      002F4E R
    WRITE_ID=  0000BC     |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XFIRST  =  000001     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   4 XOR        002F46 R   |     XOR_IDX =  0000BE 
    XSAVE   =  000005     |     XSTACK_E=  001773     |     XSTACK_S=  00003C 
    XTEMP   =  000001     |     YSAVE   =  000004     |     YTEMP   =  000003 
  4 abs        00299D R   |   4 abs24      0001A3 R   |   5 acc16      00000D GR
  5 acc24      00000C GR  |   5 acc32      00000B GR  |   5 acc8       00000E GR
  4 accept_c   000BC6 R   |   4 add24      000158 R   |   4 add_char   001337 R
  4 add_spac   001117 R   |   4 analog_r   00252D R   |   4 app        003584 R
  4 app_sign   003580 R   |   4 app_size   003582 R   |   4 app_spac   003580 GR
  4 arduino_   002B14 R   |   4 arg_list   001905 R   |   5 array_si   00001F R
  4 ascii      002827 R   |   4 at_tst     000F81 R   |   4 atoi24     00183C GR
  4 atoi_exi   0018A2 R   |   4 awu        00293B R   |   4 awu02      00294E R
  4 bad_port   0028AD R   |   5 base       00000A GR  |   5 basicptr   000004 GR
  4 beep       0024A6 R   |   4 beep_1kh   00247D GR  |   4 bin_exit   000E02 R
  4 bit_and    0029AD R   |   4 bit_or     0029DA R   |   4 bit_rese   0020AF R
  4 bit_set    00208D R   |   4 bit_test   0020F4 R   |   4 bit_togg   0020D2 R
  4 bit_xor    002A0C R   |   4 bitmask    002CD2 R   |   4 bkslsh_t   000F2E R
  4 bksp       000964 R   |   2 block_bu   0016B8 GR  |   4 block_er   00077E R
  4 break_po   00261A R   |   4 bye        002906 R   |   4 char       002810 R
  4 clear_ba   0014A1 R   |   4 clear_bl   0026CA R   |   4 clear_va   0013F9 R
  4 clock_in   00007A R   |   4 cmd_cons   001CD2 R   |   4 cmd_end    002449 R
  4 cmd_get    002450 R   |   4 cmd_itf    00052E R   |   4 cmd_line   0016D9 R
  4 cmd_name   001357 R   |   4 cmd_on     002307 R   |   4 cmd_size   001B75 R
  4 code_add   0032E4 GR  |   4 cold_sta   0000B2 R   |   4 colon_ts   000F55 R
  4 comma_ts   000F60 R   |   4 comp_msg   001624 R   |   4 compile    001086 GR
  4 const_cr   002D9E R   |   4 const_cr   002DA4 R   |   4 const_dd   002D98 R
  4 const_ee   002DB6 R   |   4 const_id   002D92 R   |   4 const_in   002DB0 R
  4 const_od   002D8C R   |   4 const_ou   002DAA R   |   4 const_po   002D56 R
  4 const_po   002D5C R   |   4 const_po   002D62 R   |   4 const_po   002D68 R
  4 const_po   002D6E R   |   4 const_po   002D74 R   |   4 const_po   002D7A R
  4 const_po   002D80 R   |   4 const_po   002D86 R   |   4 convert_   000D70 R
  4 convert_   000928 R   |   4 copy_com   000FB6 R   |   5 count      000003 GR
  4 cp24       00019A R   |   4 cp_loop    0018B4 R   |   4 cpl24      0001AA R
  4 cpy_cmd_   001102 R   |   4 cpy_quot   00113F R   |   4 create_g   000C9A R
  4 cs_high    002F39 R   |   4 cstk_pro   001B1D R   |   4 dash_tst   000F76 R
  4 data       002DBC R   |   5 data_len   000009 R   |   4 data_lin   002DCB R
  5 data_ofs   000008 R   |   5 data_ptr   000006 R   |   4 data_sea   002E0C R
  4 dec_base   001B54 R   |   4 decomp_l   0011F8 R   |   4 decompil   0011B0 GR
  4 del_line   000C6D R   |   4 delete_l   000A51 R   |   4 delete_n   000974 R
  4 delete_u   000A16 R   |   4 digital_   002569 R   |   4 digital_   0025A1 R
  4 div24      0002E5 R   |   4 divu24_8   0002C7 R   |   4 do_loop    002D08 R
  4 do_progr   000771 R   |   4 edit       001EB0 R   |   4 enable_i   002C61 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 240.
Hexadecimal [24-Bits]

Symbol Table

  4 eql_tst    00100B R   |   4 equal      00134A R   |   4 erase      002642 R
  4 erase_ex   00079D R   |   4 erase_fl   000793 R   |   4 err_bad_   001585 R
  4 err_buf_   0015FB R   |   4 err_cmd_   001549 R   |   4 err_div0   00150E R
  4 err_dupl   001563 R   |   4 err_math   0014F5 R   |   4 err_mem_   0014DA R
  4 err_msg    0014B8 R   |   4 err_no_a   001591 R   |   4 err_no_d   0015C4 R
  4 err_no_f   0015E8 R   |   4 err_no_l   00151D R   |   4 err_no_p   0015D4 R
  4 err_not_   001574 R   |   4 err_over   001608 R   |   4 err_run_   001533 R
  4 err_synt   0014E7 R   |   4 escaped    000D85 GR  |   4 expect     0018F3 R
  4 expr_exi   001A75 R   |   4 expressi   001A37 R   |   4 factor     00195A R
  5 farptr     000017 R   |   4 fcpu       002A98 R   |   4 fetchc     00061E R
  4 fill_wri   0026BA R   |   4 final_te   000BBF R   |   4 first_li   001E5A R
  5 flags      000021 GR  |   4 for        002180 R   |   4 free       001B59 R
  5 free_eep   000023 R   |   7 free_ram   000080 R   |   4 func_arg   001900 R
  4 func_eef   001C65 R   |   4 func_not   002C51 R   |   4 ge         00134C R
  4 get_addr   001781 R   |   4 get_arra   00192A R   |   4 get_char   00179B R
  4 get_cmd_   00118F R   |   4 get_code   001765 R   |   4 get_cons   001BF0 R
  4 get_esca   000934 R   |   4 get_int2   00178B R   |   4 get_targ   002298 R
  4 get_targ   0022A6 R   |   4 get_tick   00298D R   |   4 get_toke   000EC7 GR
  4 getc       00090D GR  |   4 gosub      0023A9 R   |   4 gosub_1    0023B4 R
  4 gosub_2    0023BA R   |   4 goto       00238F R   |   4 goto_1     002399 R
  4 gpio       002877 R   |   4 gt         001348 R   |   4 gt_tst     001016 R
  4 hex_base   001B4F R   |   4 hex_dump   00065E R   |   4 if         002164 R
  5 in         000001 GR  |   5 in.saved   000002 GR  |   5 in.w       000000 GR
  4 incr_far   00086F R   |   4 input_ex   002045 R   |   4 input_lo   001FB1 R
  4 input_va   001FAD R   |   4 insert_c   0009D3 R   |   4 insert_l   000CC6 R
  4 insert_l   000D35 R   |   4 interp_l   00171A R   |   4 interpre   0016F5 R
  4 invalid    000573 R   |   4 invalid_   0005F4 R   |   4 invert     002CF2 R
  4 is_alnum   000E37 GR  |   4 is_alpha   000E1D GR  |   4 is_data_   002DC2 R
  4 is_digit   000E2E GR  |   4 is_symbo   000E40 R   |   4 itoa       0017D7 GR
  4 itoa_loo   0017F9 R   |   4 jp_to_ta   00239C R   |   4 key        002866 R
  4 kword_di   0032DC GR  |   4 kword_en   002F44 R   |   4 le         001351 R
  4 leading_   002CB3 R   |   4 ledoff     000429 R   |   4 ledon      000424 R
  4 ledtoggl   00042E R   |   4 left_par   000437 R   |   4 let        001BAD GR
  4 let_arra   001BBB R   |   4 let_eval   001BC3 R   |   4 let_var    001BC0 R
  4 lines_sk   001E5D R   |   4 list       001E0B R   |   4 list_con   001BFF R
  4 list_exi   001E9F R   |   4 list_loo   001E7D R   |   4 log2       002CA4 R
  4 logical_   002C3B R   |   4 look_tar   0022C9 R   |   4 loop_bac   00227B R
  5 loop_dep   00001E R   |   4 loop_don   002290 R   |   4 lshift     002A3E R
  4 lt         00134F R   |   4 lt_tst     00103F R   |   4 mem_peek   000590 R
  4 mod24      000393 R   |   4 move       0013B5 GR  |   4 move_dow   0013D4 R
  4 move_era   000700 R   |   4 move_exi   0013F5 R   |   4 move_lef   0009AB R
  4 move_loo   0013D9 R   |   4 move_prg   000740 R   |   4 move_rig   0009B9 R
  4 move_up    0013C6 R   |   4 mul24      000221 R   |   4 mul_char   001339 R
  4 mulu24_8   0001EE R   |   4 nbr_tst    000EFA R   |   4 ne         001354 R
  4 neg24      0001B7 R   |   4 neg_acc2   0001D1 R   |   4 neg_ax     0001C9 R
  4 new        002638 R   |   4 next       00222C R   |   4 next_lin   0016FD R
  4 next_tok   00174B GR  |   4 no_match   0018C6 R   |   4 number     000624 R
  4 other      001068 R   |   4 overwrit   000BEB R   |   2 pad        0016B8 GR
  4 pad_ref    002F3E R   |   4 parse_bi   000DE0 R   |   4 parse_in   000D8D R
  4 parse_ke   000E63 R   |   4 parse_qu   000D38 R   |   4 parse_sy   000E4B R
  4 pause      00291A R   |   4 pause02    00292D R   |   4 peek       00214C R
  4 peek_byt   0005BE R   |   4 pin_mode   002AA7 R   |   4 plus_tst   000FDF R
  4 poke       00212B R   |   4 power_ad   0024DD R   |   4 prcnt_ts   001000 R
  4 print      001F18 R   |   4 print_ex   001F81 R   |   4 print_fa   000603 R
  4 print_he   000C20 GR  |   4 print_re   000483 R   |   4 print_st   000583 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
Hexadecimal [24-Bits]

Symbol Table

  4 print_to   0017BF R   |   4 prog_siz   001D7A R   |   4 program_   001D82 R
  4 program_   00071A R   |   4 program_   000740 R   |   4 prt_acc2   0017B1 R
  4 prt_basi   001EF4 R   |   4 prt_i16    0017A1 R   |   4 prt_loop   001F1C R
  4 prt_peek   000406 GR  |   4 prt_reg1   000464 R   |   4 prt_reg8   000442 R
  4 prt_regs   00039C GR  |   5 ptr16      000018 GR  |   5 ptr8       000019 R
  4 putc       0008FD GR  |   4 puts       00095A GR  |   4 qgetc      000906 GR
  4 qkey       00286A GR  |   4 qmark_ts   000F8C R   |   4 qsign      0026B3 R
  4 random     002B34 R   |   4 read       002E2D R   |   4 read01     002E2F R
  4 read_int   00351F R   |   4 readln     000A5F GR  |   4 readln_l   000A6C R
  4 readln_q   000C08 R   |   4 refresh_   002C9F R   |   4 regs_sta   0003DF R
  4 rel_exit   001ACA R   |   4 relation   001A78 R   |   4 relop_st   00133C R
  4 remark     00204A GR  |   4 repl       00053C R   |   4 repl_exi   000564 R
  4 reset_co   001F1A R   |   4 rest_con   001F9D R   |   4 restore    002DED R
  4 restore_   002E28 R   |   4 return     0023CF R   |   4 right_al   00112D GR
  4 row_alig   000854 R   |   4 row_eras   0006D3 R   |   4 row_eras   000700 R
  4 row_loop   000641 R   |   4 rparnt_t   000F4A R   |   4 rshift     002A6B R
  7 rsign      00007C R   |   7 rsize      00007E R   |   4 rt_msg     001612 R
  4 run        0023ED R   |   4 run_app    000127 R   |   4 run_it     00241F R
  4 run_it_0   002421 R   |   5 rx1_head   00002D R   |   5 rx1_queu   000025 R
  5 rx1_tail   00002E R   |   4 save_app   0026DE R   |   4 save_con   001F8D R
  4 scan_blo   00087D R   |   4 search_c   001C8E R   |   4 search_d   0018A6 GR
  4 search_e   0018F0 R   |   4 search_l   000C42 GR  |   4 search_l   000C51 R
  4 search_n   0018AA R   |   5 seedx      000013 R   |   5 seedy      000015 R
  4 select_p   002B04 R   |   4 send_esc   000982 R   |   4 send_par   00098D R
  4 set_data   002DDE R   |   4 set_time   002C21 R   |   4 sharp_ts   000F6B R
  4 show       001ACD R   |   4 show_row   00062F R   |   4 single_c   001332 R
  4 skip       000EB4 R   |   4 skip_2_b   001769 R   |   4 skip_str   001772 R
  4 slash_ts   000FF5 R   |   4 sleep      00290F R   |   4 software   001408 R
  4 spaces     0009C7 GR  |   4 spi_clea   002ED2 R   |   4 spi_disa   002EBA R
  4 spi_enab   002E87 R   |   4 spi_rcv_   002EF4 R   |   4 spi_read   002F1F R
  4 spi_sele   002F27 R   |   4 spi_send   002EDE R   |   4 spi_writ   002EFF R
  2 stack_fu   001774 GR  |   2 stack_un   001800 R   |   4 star_tst   000FEA R
  4 step       0021E8 R   |   4 stop       0025EC R   |   4 store_lo   002205 R
  4 str_matc   0018D3 R   |   4 str_tst    000EEA R   |   4 strcmp     001394 R
  4 strcpy     0013A5 GR  |   4 strlen     001389 GR  |   4 sub24      00017D R
  4 symb_loo   000E4C R   |   4 syntax_e   001645 GR  |   4 system_i   00144E R
  5 tab_widt   000022 GR  |   4 tb_error   001647 GR  |   4 term       0019ED R
  4 term01     0019F5 R   |   4 term_exi   001A34 R   |   4 test       0033B0 R
  4 test_p     00057B R   |   2 tib        001668 GR  |   4 tick_tst   000FA4 R
  5 ticks      00000F R   |   4 timeout    002C38 R   |   5 timer      000011 GR
  4 timer2_i   000090 R   |   4 timer4_i   00009D R   |   4 tk_id      001635 R
  4 to         0021AA R   |   4 to_eepro   000769 R   |   4 to_flash   00076E R
  4 to_hex_c   000C37 GR  |   4 to_upper   001830 GR  |   4 token_ch   00107F R
  4 token_ex   001083 R   |   4 tone       002486 R   |   4 try_next   002E18 R
  5 txtbgn     00001A GR  |   5 txtend     00001C GR  |   4 uart1_ge   00090D GR
  4 uart1_in   0008B8 R   |   4 uart1_pu   0008FD GR  |   4 uart1_qg   000906 GR
  4 uart1_se   0008C8 R   |   4 ubound     001BA2 R   |   4 uflash     0028B2 R
  4 unlock_e   00069D R   |   4 unlock_f   0006B8 R   |   4 until      002D1C R
  4 user_int   000046 R   |   4 usr        0028C7 R   |   4 var_name   001185 GR
  5 vars       00002F GR  |   4 wait       002050 R   |   4 warm_ini   00147F R
  4 warm_sta   0016D6 R   |   4 words      002BBB R   |   4 words_co   002C0B R
  4 write      0027CD R   |   4 write_bl   000819 GR  |   4 write_bu   00075A R
  4 write_by   00079F R   |   4 write_ee   0007DB R   |   4 write_ex   000814 R
  4 write_fl   0007C5 R   |   4 write_nb   00083E R   |   2 xstack_f   001738 GR
  2 xstack_u   001774 GR

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 SSEG       size      0   flags    8
   2 SSEG0      size    198   flags    8
   3 HOME       size     80   flags    0
   4 CODE       size   3584   flags    0
   5 DATA       size     7D   flags    0
   6 BTXT       size      0   flags    8
   7 BTXT1      size      4   flags    8

