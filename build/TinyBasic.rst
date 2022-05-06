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
                           000000     5 SEPARATE=0 ; set to 1 for 'make separate' 
                                      6 
                                      7 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                                     31 	.include "tbi_macros.inc" 
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
                           0000A0    27 	STACK_SIZE=160
                           0017FF    28 	STACK_EMPTY=RAM_SIZE-1  
                           000000    29 	FRUN=0 ; flags run code in variable flags
                           000001    30 	FTRAP=1 ; inside trap handler 
                           000002    31 	FLOOP=2 ; FOR loop in preparation 
                           000003    32 	FSLEEP=3 ; halt produit par la commande SLEEP 
                           000004    33 	FBREAK=4 ; break point flag 
                           000005    34 	FCOMP=5  ; compiling flags 
                           000006    35 	FAUTORUN=6; auto start program running 
                                     36 
                           004000    37 	AUTORUN_NAME=0x4000 ; address in EEPROM where auto run file name is saved 
                                     38 
                           000006    39         FIRST_DATA_ITEM=6 ; first DATA item offset on line.
                                     40 
                           007FFF    41 	MAX_LINENO=0x7fff; BASIC maximum line number 
                                     42 
                           000008    43 	RX_QUEUE_SIZE=8 
                                     44 
                           00F424    45         TIM2_CLK_FREQ=62500
                                     46 
                           000050    47 	TIB_SIZE=80
                           000080    48         PAD_SIZE=128
                                     49 
                                     50 ;--------------------------------------
                                     51 ;   constantes related to Arduino 
                                     52 ;   API mapping 
                                     53 ;-------------------------------------
                           000000    54         INP=0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                           000001    55         OUTP=1 
                                     56 
                                     57 ;--------------------------------------
                                     58 ;       token attribute
                                     59 ;--------------------------------------
                                     60         ; bits 4:5 identify token group 
                                     61         ; 0x0n -> miscelinous 
                                     62         ; 0x1n -> +|- operators 
                                     63         ; 0x2n -> *|/|% operators
                                     64         ; 0x3n -> relational operators 
                           000080    65         TK_CMD=128      ; BASIC command   
                           000081    66         TK_IFUNC=129    ; BASIC integer function
                           000082    67         TK_CFUNC=130    ; BASIC character function
                           000083    68         TK_CONST=131    ; BASIC constant 
                           000084    69         TK_INTGR=132
                           000085    70         TK_VAR=133
                           000000    71         TK_NONE=0       ; not a token 
                           000001    72         TK_LABEL=1      ; used for defined, constants, variables
                           000002    73         TK_QSTR=2       ; quoted string  
                           000003    74         TK_CHAR=3       ; ASCII character 
                           000004    75         TK_TARGET=4     ; symbolic target for GOSUB|GOTO  
                           000006    76         TK_ARRAY=6     ; array variable '@' 
                           000007    77         TK_LPAREN=7     ; left parenthesis '('
                           000008    78         TK_RPAREN=8     ; right parenthesis ')'
                           000009    79         TK_COMMA=9     ; item separator ',' 
                           00000A    80         TK_SHARP=0xa     ; print colon width '#' 
                           00000B    81         TK_COLON=0xb      ; command separator ':' 
                                     82         
                           000010    83         TK_PLUS=0x10    ; addition operator '+'
                           000011    84         TK_MINUS=0x11   ; subtraction operator '-'
                           000020    85         TK_MULT=0x20    ; multiplication operator '*'
                           000021    86         TK_DIV=0x21     ; division operator '/'
                           000022    87         TK_MOD=0x22     ; modulo operator '%'
                                     88 
                                     89         ; don't change these token values 
                                     90         ; values chosen to be used as a mask.
                                     91         ; bit 7   1 for dictionary words else 0 
                                     92         ; bits 6  always 0 
                                     93         ; bits 5:4 identify group 
                                     94         ; bits 3:0 token identifier inside group  
                           000031    95         TK_GT=0x31      ; relation operator '>'
                           000032    96         TK_EQUAL=0x32   ; assignment or relation operator '='
                           000033    97         TK_GE=0x33      ; relation operator '>='
                           000034    98         TK_LT=0x34      ; relation operator '<'
                           000036    99         TK_LE=0x36      ; relation operator '<='
                           000035   100         TK_NE=0x35      ; relation operator '<>' not equal 
                                    101         ; token groups 
                           000030   102         TK_GRP_MASK=0x30 ; groups bits selector 
                           000000   103         TK_GRP_MISC=0x00 ; miscelinous group 
                           000010   104         TK_GRP_ADD=0x10  ; additive operators
                           000020   105         TK_GRP_MULT=0x20 ; multiplicative operators
                           000030   106         TK_GRP_RELOP=0x30 ;relational operators. 
                           000002   107         CMD_END=2 
                                    108 
                                    109 ;--------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                    110 ;   error codes 
                                    111 ;--------------------------------------
                           000000   112     ERR_NONE=0
                           000001   113     ERR_MEM_FULL=1 
                           000002   114     ERR_SYNTAX=2
                           000003   115     ERR_MATH_OVF=3
                           000004   116     ERR_DIV0=4 
                           000005   117     ERR_NO_LINE=5
                           000006   118     ERR_RUN_ONLY=6
                           000007   119     ERR_CMD_ONLY=7
                           000008   120     ERR_DUPLICATE=8
                           000009   121     ERR_NOT_FILE=9
                           00000A   122     ERR_BAD_VALUE=10
                           00000B   123     ERR_NO_ACCESS=11
                           00000C   124     ERR_NO_DATA=12 
                           00000D   125     ERR_NO_PROG=13
                           00000E   126     ERR_NO_FSPACE=14
                           00000F   127     ERR_BUF_FULL=15
                                    128 
                                    129 ;--------------------------------------
                                    130 ;   assembler flags 
                                    131 ;-------------------------------------
                           000000   132     MATH_OVF=0 ; if 1 the stop on math overflow 
                                    133 
                           000002   134     CELL_SIZE=2 
                                    135 
                                    136     .macro _usec_dly n 
                                    137     ldw x,#(16*n-2)/4
                                    138     decw x
                                    139     nop 
                                    140     jrne .-4
                                    141     .endm 
                                    142     
                                    143     ; load X register with 
                                    144     ; entry point of dictionary
                                    145     ; before calling 'search_dict'
                                    146     .macro _ldx_dict dict_name
                                    147     ldw x,#dict_name+2
                                    148     .endm 
                                    149 
                                    150     ; reset BASIC pointer
                                    151     ; to beginning of last token
                                    152     ; extracted except if it was end of line 
                                    153     .macro _unget_token 
                                    154      mov in,in.saved  
                                    155     .endm
                                    156 
                                    157 ;-------------------------------
                                    158 ;  macros used to help debugging
                                    159 ;-------------------------------
                           000000   160     DEBUG=0
                                    161     .macro _dbg 
                                    162     DEBUG=1
                                    163     .endm
                                    164 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                    165     .macro _nodbg
                                    166     DEBUG=0
                                    167     .endm 
                                    168 
                           000006   169     DBG_CC=6
                           000005   170     DBG_A=5 
                           000003   171     DBG_X=3 
                           000001   172     DBG_Y=1 
                                    173     .macro _dbg_save_regs 
                                    174     .if DEBUG
                                    175     push cc ; (6,sp)
                                    176     push a   ; (5,sp)
                                    177     pushw x  ; (3,sp)
                                    178     pushw y  ; (1,sp)
                                    179     .endif 
                                    180     .endm 
                                    181 
                                    182     .macro _dbg_restore_regs 
                                    183     .if DEBUG 
                                    184     popw y 
                                    185     popw x 
                                    186     pop a 
                                    187     pop cc 
                                    188     .endif 
                                    189     .endm 
                                    190 
                                    191     .macro _dbg_getc 
                                    192     .if DEBUG 
                                    193     _dbg_save_regs 
                                    194     call getc
                                    195     ld (DBG_A,sp),a 
                                    196     _dbg_restore_regs  
                                    197     .endif
                                    198     .endm 
                                    199 
                                    200     .macro _dbg_putc 
                                    201     .if DEBUG
                                    202     push cc 
                                    203     call putc 
                                    204     pop cc 
                                    205     .endif 
                                    206     .endm 
                                    207 
                                    208     .macro _dbg_puts 
                                    209     .if DEBUG 
                                    210     _dbg_save_regs
                                    211     call puts 
                                    212     _dbg_restore_regs
                                    213     .endif 
                                    214     .endm 
                                    215 
                                    216     .macro _dbg_prti24 
                                    217     .if DEBUG 
                                    218     _dbg_save_regs
                                    219     call prti24 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                    220     _dbg_restore_regs
                                    221     .endif
                                    222     .endm 
                                    223 
                                    224     .macro _dbg_prt_regs
                                    225     .if DEBUG
                                    226     _dbg_save_regs
                                    227     call prt_regs 
                                    228     _dbg_restore_regs 
                                    229     .endif 
                                    230     .endm 
                                    231 
                                    232     .macro _dbg_peek addr 
                                    233     .if DEBUG
                                    234     _dbg_save_regs 
                                    235     ldw x,addr 
                                    236     call peek     
                                    237     _dbg_restore_regs
                                    238     .endif 
                                    239     .endm 
                                    240 
                                    241     .macro _dbg_parser_init 
                                    242     .if DEBUG 
                                    243     _dbg_save_regs
                                    244     call parser_init 
                                    245     _dbg_restore_regs
                                    246     .endif
                                    247     .endm
                                    248 
                                    249     .macro _dbg_readln
                                    250     .if DEBUG 
                                    251     _dbg_save_regs
                                    252     call readln
                                    253     _dbg_restore_regs
                                    254     .endif
                                    255     .endm
                                    256 
                                    257     .macro _dbg_number
                                    258     .if DEBUG 
                                    259     _dbg_save_regs
                                    260     call number 
                                    261     _dbg_restore_regs
                                    262     .endif
                                    263     .endm  
                                    264 
                                    265     .macro _dbg_nextword
                                    266     .if DEBUG 
                                    267     _dbg_save_regs
                                    268     call get_token   
                                    269     _dbg_restore_regs
                                    270     .endif
                                    271     .endm  
                                    272 
                                    273     .macro _dbg_dots 
                                    274     .if DEBUG 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                    275     _dbg_save_regs
                                    276     call dots 
                                    277     _dbg_restore_regs
                                    278     .endif 
                                    279     .endm 
                                    280 
                                    281     .macro _dbg_trap
                                    282     .if DEBUG 
                                    283     bset flags,#FTRAP 
                                    284     trap 
                                    285     .endif 
                                    286     .endm 
                                    287 
                                    288     .macro _dbg_mark n  
                                    289     .if DEBUG 
                                    290     push cc
                                    291     push a 
                                    292     ld a,#n 
                                    293     call putc
                                    294     btjf UART3_SR,#UART_SR_TC,. 
                                    295     pop a 
                                    296     pop cc 
                                    297     .endif 
                                    298     .endm 
                                    299     
                                    300     .macro _dbg_prt_var var 
                                    301     .if DEBUG
                                    302     _dbg_save_regs 
                                    303     ldw x,var 
                                    304     ldw acc16,x 
                                    305     clr acc24 
                                    306     clrw x 
                                    307     ld a,#16+128  
                                    308     call prti24
                                    309     ld a,#CR 
                                    310     call putc  
                                    311     _dbg_restore_regs 
                                    312     .endif 
                                    313     .endm 
                                    314 
                                    315     .macro _dbg_show 
                                    316     .if DEBUG 
                                    317     _dbg_save_regs 
                                    318     call show 
                                    319     _dbg_restore_regs
                                    320     .endif
                                    321     .endm 
                                    322 
                                    323     ; software reset 
                                    324     .macro _swreset
                                    325     mov WWDG_CR,#0X80
                                    326     .endm 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                     32 	.include "cmd_index.inc"
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
                           000020    41     DATALN_IDX=DATA_IDX+2
                           000022    42     DDR_IDX=DATALN_IDX+2
                           000024    43     DEC_IDX=DDR_IDX+2
                           000026    44     DO_IDX=DEC_IDX+2
                           000028    45     DREAD_IDX=DO_IDX+2
                           00002A    46     DWRITE_IDX=DREAD_IDX+2
                           00002C    47     EDIT_IDX=DWRITE_IDX+2
                           00002E    48     EEPROM_IDX=EDIT_IDX+2
                           000030    49     END_IDX=EEPROM_IDX+2
                           000032    50     ERASE_IDX=END_IDX+2
                           000034    51     FCPU_IDX=ERASE_IDX+2
                           000036    52     SAVE_IDX=FCPU_IDX+2
                           000038    53     FOR_IDX=SAVE_IDX+2
                           00003A    54     GOSUB_IDX=FOR_IDX+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                           00003C    55     GOTO_IDX=GOSUB_IDX+2
                           00003E    56     GPIO_IDX=GOTO_IDX+2
                           000040    57     HEX_IDX=GPIO_IDX+2
                           000042    58     IDR_IDX=HEX_IDX+2
                           000044    59     IF_IDX=IDR_IDX+2
                           000046    60     INPUT_IDX=IF_IDX+2
                           000048    61     INVERT_IDX=INPUT_IDX+2
                           00004A    62     IWDGEN_IDX=INVERT_IDX+2
                           00004C    63     IWDGREF_IDX=IWDGEN_IDX+2
                           00004E    64     KEY_IDX=IWDGREF_IDX+2
                           000050    65     LET_IDX=KEY_IDX+2
                           000052    66     LIST_IDX=LET_IDX+2
                           000054    67     LOG_IDX=LIST_IDX+2
                           000056    68     LSHIFT_IDX=LOG_IDX+2
                           000058    69     MULDIV_IDX=LSHIFT_IDX+2
                           00005A    70     NEXT_IDX=MULDIV_IDX+2
                           00005C    71     NEW_IDX=NEXT_IDX+2
                           00005E    72     NOT_IDX=NEW_IDX+2
                           000060    73     ODR_IDX=NOT_IDX+2
                           000062    74     OR_IDX=ODR_IDX+2
                           000064    75     PAD_IDX=OR_IDX+2
                           000066    76     PAUSE_IDX=PAD_IDX+2
                           000068    77     PMODE_IDX=PAUSE_IDX+2
                           00006A    78     PEEK_IDX=PMODE_IDX+2
                           00006C    79     PINP_IDX=PEEK_IDX+2
                           00006E    80     POKE_IDX=PINP_IDX+2
                           000070    81     POUT_IDX=POKE_IDX+2
                           000072    82    	PRT_IDX=POUT_IDX+2 ; PRINT commande index 
                           000074    83     PRTA_IDX=PRT_IDX+2
                           000076    84     PRTB_IDX=PRTA_IDX+2
                           000078    85     PRTC_IDX=PRTB_IDX+2
                           00007A    86     PRTD_IDX=PRTC_IDX+2
                           00007C    87     PRTE_IDX=PRTD_IDX+2
                           00007E    88     PRTF_IDX=PRTE_IDX+2
                           000080    89     PRTG_IDX=PRTF_IDX+2
                           000082    90     PRTH_IDX=PRTG_IDX+2
                           000084    91     PRTI_IDX=PRTH_IDX+2
                           000086    92     QKEY_IDX=PRTI_IDX+2
                           000088    93     READ_IDX=QKEY_IDX+2
                           00008A    94     RBT_IDX=READ_IDX+2  ; REBOOT
                           00008C    95 	REM_IDX=RBT_IDX+2 ; REMARK command index 
                           00008E    96     REST_IDX=REM_IDX+2 ; RESTORE
                           000090    97     RET_IDX=REST_IDX+2  ; RETURN 
                           000092    98     RND_IDX=RET_IDX+2 ; RANDOM 
                           000094    99     RSHIFT_IDX=RND_IDX+2
                           000096   100     RUN_IDX=RSHIFT_IDX+2
                           000098   101     SHOW_IDX=RUN_IDX+2
                           00009A   102     FREE_IDX=SHOW_IDX+2
                           00009C   103     SLEEP_IDX=FREE_IDX+2
                           00009E   104     SPIRD_IDX=SLEEP_IDX+2
                           0000A0   105     SPIEN_IDX=SPIRD_IDX+2
                           0000A2   106     SPISEL_IDX=SPIEN_IDX+2
                           0000A4   107     SPIWR_IDX=SPISEL_IDX+2
                           0000A6   108     STEP_IDX=SPIWR_IDX+2
                           0000A8   109     STOP_IDX=STEP_IDX+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                           0000AA   110     TICKS_IDX=STOP_IDX+2
                           0000AC   111     TIMER_IDX=TICKS_IDX+2
                           0000AE   112     TMROUT_IDX=TIMER_IDX+2  ; TIMEOUT
                           0000B0   113     TO_IDX=TMROUT_IDX+2
                           0000B2   114     TONE_IDX=TO_IDX+2
                           0000B4   115     UBOUND_IDX=TONE_IDX+2
                           0000B6   116     UFLASH_IDX=UBOUND_IDX+2
                           0000B8   117     UNTIL_IDX=UFLASH_IDX+2
                           0000BA   118     USR_IDX=UNTIL_IDX+2
                           0000BC   119     WAIT_IDX=USR_IDX+2
                           0000BE   120     WORDS_IDX=WAIT_IDX+2
                           0000C0   121     WRITE_IDX=WORDS_IDX+2
                           0000C2   122     XOR_IDX=WRITE_IDX+2
                           0000C4   123     SIZE_IDX=XOR_IDX+2 
                           0000C6   124     ON_IDX=SIZE_IDX+2 
                                    125         
                                    126 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                     33   
                                     34 
                                     35 ;_dbg 
                                     36 
                                     37 ;;-----------------------------------
                                     38     .area SSEG (ABS)
                                     39 ;; working buffers and stack at end of RAM. 	
                                     40 ;;-----------------------------------
      001690                         41     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE 
      001690                         42 tib:: .ds TIB_SIZE             ; transaction input buffer
      0016E0                         43 pad:: .ds PAD_SIZE             ; working buffer
      001760                         44 stack_full:: .ds STACK_SIZE   ; control stack 
      001800                         45 stack_unf: ; stack underflow ; control_stack bottom 
                                     46 
                                     47 ;;--------------------------------------
                                     48     .area HOME 
                                     49 ;; interrupt vector table at 0x8000
                                     50 ;;--------------------------------------
      008000 82 00 8F 5F             51     int cold_start			; RESET vector 
                           000000    52 .if DEBUG
                                     53 	int TrapHandler 		;TRAP  software interrupt
                           000001    54 .else
      008004 82 00 80 80             55 	int NonHandledInterrupt ;TRAP  software interrupt
                                     56 .endif
      008008 82 00 80 80             57 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 81             58 	int AWUHandler          ;int1 AWU   auto wake up from halt
      008010 82 00 80 80             59 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 80             60 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 80             61 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 80             62 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 80             63 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 A4             64 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 80             65 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 80             66 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 80             67 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 80             68 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 80             69 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 80             70 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 80             71 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 80             72 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 80             73 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 80             74 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 82 FF             75 	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
      008054 82 00 80 80             76 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 80             77 	int NonHandledInterrupt ;int20 UART3 TX completed
      00805C 82 00 80 80             78 	int NonHandledInterrupt ;int21 UART3 RX full
      008060 82 00 80 80             79 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 8F             80 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
      008068 82 00 80 80             81 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 80             82 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 80             83 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 80             84 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 80             85 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 80             86 	int NonHandledInterrupt ;int29  not used
                                     87 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                     88 ;---------------------------------------
                                     89     .area CODE
                                     90 ;---------------------------------------
                           000000    91 .if DEBUG
                                     92 .asciz "STM8_TBI" ; I like to put module name here.
                                     93 .endif 
                                     94 
                                     95 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     96 ; non handled interrupt 
                                     97 ; reset MCU
                                     98 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008080                         99 NonHandledInterrupt:
      008080 71                     100     .byte 0x71  ; invalid opcode reinitialize MCU
                                    101 
                                    102 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    103 ; auto wakeup from halt
                                    104 ; at iret, program continue 
                                    105 ; after hatl instruction
                                    106 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008081                        107 AWUHandler:
      008081 72 19 50 F0      [ 1]  108 	bres AWU_CSR,#AWU_CSR_AWUEN
      008085 55 00 3F 50 F1   [ 1]  109 	mov AWU_APR,0x3F
      00808A 72 5F 50 F2      [ 1]  110 	clr AWU_TBR 
      00808E 80               [11]  111 	iret
                                    112 
                                    113 ;------------------------------------
                                    114 ; software interrupt handler  
                                    115 ;------------------------------------
                           000000   116 .if DEBUG 
                                    117 TrapHandler:
                                    118 	bset flags,#FTRAP 
                                    119 	call print_registers
                                    120 	call cmd_itf
                                    121 	bres flags,#FTRAP 	
                                    122 	iret
                                    123 .endif 
                                    124 
                                    125 ;------------------------------
                                    126 ; TIMER 4 is used to maintain 
                                    127 ; a milliseconds 'ticks' counter
                                    128 ; and decrement 'timer' varaiable
                                    129 ;--------------------------------
      00808F                        130 Timer4UpdateHandler:
      00808F 72 5F 53 42      [ 1]  131 	clr TIM4_SR 
      008093 CE 00 0F         [ 2]  132 	ldw x,ticks
      008096 5C               [ 1]  133 	incw x
      008097 CF 00 0F         [ 2]  134 	ldw ticks,x 
      00809A CE 00 11         [ 2]  135 	ldw x,timer
                                    136 ;	tnzw x 
      00809D 27 04            [ 1]  137 	jreq 1$
      00809F 5A               [ 2]  138 	decw x 
      0080A0 CF 00 11         [ 2]  139 	ldw timer,x 
      0080A3                        140 1$:	
      0080A3 80               [11]  141 	iret 
                                    142 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                    143 ;------------------------------------
                                    144 ; Triggered by pressing USER UserButton 
                                    145 ; on NUCLEO card.
                                    146 ; This is used to abort a progam lock 
                                    147 ; in infinite loop. 
                                    148 ;------------------------------------
      0080A4                        149 UserButtonHandler:
                                    150 ; wait button release
      0080A4 5F               [ 1]  151 	clrw x
      0080A5 5A               [ 2]  152 1$: decw x 
      0080A6 26 FD            [ 1]  153 	jrne 1$
      0080A8 72 09 50 15 F8   [ 2]  154 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    155 ; if MCU suspended by SLEEP resume program
      0080AD 72 07 00 21 05   [ 2]  156     btjf flags,#FSLEEP,2$
      0080B2 72 17 00 21      [ 1]  157 	bres flags,#FSLEEP 
      0080B6 80               [11]  158 	iret
      0080B7                        159 2$:	
      0080B7                        160 user_interrupted:
      0080B7 72 00 00 21 02   [ 2]  161     btjt flags,#FRUN,4$
      0080BC 20 0A            [ 2]  162 	jra UBTN_Handler_exit 
      0080BE                        163 4$:	; program interrupted by user 
      0080BE 72 11 00 21      [ 1]  164 	bres flags,#FRUN 
      0080C2 AE 80 DB         [ 2]  165 	ldw x,#USER_ABORT
      0080C5 CD 83 CE         [ 4]  166 	call puts 
      0080C8                        167 UBTN_Handler_exit:
      0080C8 AE 17 FF         [ 2]  168     ldw x,#STACK_EMPTY 
      0080CB 94               [ 1]  169     ldw sp,x
      0080CC 9A               [ 1]  170 	rim 
      0080CD CE 00 1A         [ 2]  171 	ldw x,txtbgn 
      0080D0 A3 AC 00         [ 2]  172 	cpw x,#app_space 
      0080D3 22 03            [ 1]  173 	jrugt 5$
      0080D5 CD 90 82         [ 4]  174 	call clear_basic 
      0080D8 CC 92 9E         [ 2]  175 5$:	jp warm_start
                                    176 
      0080DB 0A 50 72 6F 67 72 61   177 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    178 
                                    179 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    180 ;    peripherals initialization
                                    181 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    182 
                                    183 ;----------------------------------------
                                    184 ; inialize MCU clock 
                                    185 ; input:
                                    186 ;   A 		source  HSI | 1 HSE 
                                    187 ;   XL      CLK_CKDIVR , clock divisor 
                                    188 ; output:
                                    189 ;   none 
                                    190 ;----------------------------------------
      0080F6                        191 clock_init:	
      0080F6 C1 50 C3         [ 1]  192 	cp a,CLK_CMSR 
      0080F9 27 0C            [ 1]  193 	jreq 2$ ; no switching required 
                                    194 ; select clock source 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      0080FB 72 12 50 C5      [ 1]  195 	bset CLK_SWCR,#CLK_SWCR_SWEN
      0080FF C7 50 C4         [ 1]  196 	ld CLK_SWR,a
      008102 C1 50 C3         [ 1]  197 1$:	cp a,CLK_CMSR
      008105 26 FB            [ 1]  198 	jrne 1$
      008107                        199 2$: 	
                                    200 ; HSI and cpu clock divisor 
      008107 9F               [ 1]  201 	ld a,xl 
      008108 C7 50 C6         [ 1]  202 	ld CLK_CKDIVR,a  
      00810B 81               [ 4]  203 	ret
                                    204 
                                    205 ;----------------------------------
                                    206 ; TIMER2 used as audio tone output 
                                    207 ; on port D:5.
                                    208 ; channel 1 configured as PWM mode 1 
                                    209 ;-----------------------------------  
                                    210 
      00810C                        211 timer2_init:
      00810C 72 1A 50 C7      [ 1]  212 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      008110 35 60 53 05      [ 1]  213  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      008114 35 08 53 0C      [ 1]  214 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      008118 81               [ 4]  215 	ret 
                                    216 
                                    217 ;---------------------------------
                                    218 ; TIM4 is configured to generate an 
                                    219 ; interrupt every millisecond 
                                    220 ;----------------------------------
      008119                        221 timer4_init:
      008119 72 18 50 C7      [ 1]  222 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      00811D 35 07 53 45      [ 1]  223 	mov TIM4_PSCR,#7 ; prescale 128  
      008121 35 7D 53 46      [ 1]  224 	mov TIM4_ARR,#125 ; set for 1msec.
      008125 35 05 53 40      [ 1]  225 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008129 72 10 53 41      [ 1]  226 	bset TIM4_IER,#TIM4_IER_UIE
      00812D 81               [ 4]  227 	ret
                                    228 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



                                     27     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000000     5 SEPARATE=0 ; set to 1 for 'make separate' 
                                      6 
                                      7 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
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
      00812E                         45 unlock_eeprom:
      00812E 72 06 50 5F 15   [ 2]   46 	btjt FLASH_IAPSR,#FLASH_IAPSR_DUL,9$
      008133 35 00 50 5B      [ 1]   47 	mov FLASH_CR2,#0 
      008137 35 FF 50 5C      [ 1]   48 	mov FLASH_NCR2,#0xFF 
      00813B 35 AE 50 64      [ 1]   49 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      00813F 35 56 50 64      [ 1]   50     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      008143 72 07 50 5F FB   [ 2]   51 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008148 81               [ 4]   52 9$:	ret
                                     53 
                                     54 ;----------------------------------
                                     55 ; unlock FLASH for writing/erasing
                                     56 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                     57 ; input:
                                     58 ;  none
                                     59 ; output:
                                     60 ;  none
                                     61 ;----------------------------------
      008149                         62 unlock_flash:
      008149 72 02 50 5F 15   [ 2]   63 	btjt FLASH_IAPSR,#FLASH_IAPSR_PUL,9$
      00814E 35 00 50 5B      [ 1]   64 	mov FLASH_CR2,#0 
      008152 35 FF 50 5C      [ 1]   65 	mov FLASH_NCR2,#0xFF 
      008156 35 56 50 62      [ 1]   66 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      00815A 35 AE 50 62      [ 1]   67 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      00815E 72 03 50 5F FB   [ 2]   68 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      008163 81               [ 4]   69 9$:	ret
                                     70 
                                     71 ;----------------------------
                                     72 ; erase block code must be 
                                     73 ; executed from RAM
                                     74 ; input:
                                     75 ;-----------------------------
      008164                         76 row_erase:
      008164 88               [ 1]   77 	push a 
      008165 90 89            [ 2]   78 	pushw y 
      008167 35 20 50 5B      [ 1]   79 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      00816B 35 DF 50 5C      [ 1]   80 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      00816F 4F               [ 1]   81 	clr a 
      008170 90 5F            [ 1]   82 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008172 91 A7 00 17      [ 1]   83 	ldf ([farptr],y),a
      008176 90 5C            [ 1]   84     incw y
      008178 91 A7 00 17      [ 1]   85 	ldf ([farptr],y),a
      00817C 90 5C            [ 1]   86     incw y
      00817E 91 A7 00 17      [ 1]   87 	ldf ([farptr],y),a
      008182 90 5C            [ 1]   88     incw y
      008184 91 A7 00 17      [ 1]   89 	ldf ([farptr],y),a
      008188 72 05 50 5F FB   [ 2]   90 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      00818D 90 85            [ 2]   91 	popw y 
      00818F 84               [ 1]   92 	pop a 
      008190 81               [ 4]   93 	ret
      008191                         94 row_erase_end:
                                     95 
                                     96 ; copy erase_start in RAM 
      008191                         97 move_erase_to_ram:
      008191 89               [ 2]   98 	pushw x 
      008192 90 89            [ 2]   99 	pushw y 
      008194 AE 81 91         [ 2]  100 	ldw x,#row_erase_end 
      008197 1D 81 64         [ 2]  101 	subw x,#row_erase
      00819A CF 00 0D         [ 2]  102 	ldw acc16,x 
      00819D AE 16 90         [ 2]  103 	ldw x,#tib 
      0081A0 90 AE 81 64      [ 2]  104 	ldw y,#row_erase 
      0081A4 CD 8E C1         [ 4]  105 	call move
      0081A7 90 85            [ 2]  106 	popw y
      0081A9 85               [ 2]  107 	popw x
      0081AA 81               [ 4]  108 	ret 
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
      0081AB                        123 program_row:
      0081AB 88               [ 1]  124 	push a 
      0081AC 90 89            [ 2]  125 	pushw y 
      0081AE 4B 80            [ 1]  126 	push #BLOCK_SIZE  
                                    127 ;enable block programming 
      0081B0 72 10 50 5B      [ 1]  128 	bset FLASH_CR2,#FLASH_CR2_PRG 
      0081B4 72 11 50 5C      [ 1]  129 	bres FLASH_NCR2,#FLASH_CR2_PRG
                                    130 ;	mov FLASH_CR2,#(1<<FLASH_CR2_PRG) 
                                    131 ;	mov FLASH_NCR2,#~(1<<FLASH_CR2_PRG)
      0081B8 90 5F            [ 1]  132 	clrw y 
      0081BA F6               [ 1]  133 1$:	ld a,(x)
      0081BB 91 A7 00 17      [ 1]  134 	ldf ([farptr],y),a
      0081BF 5C               [ 1]  135 	incw x 
      0081C0 90 5C            [ 1]  136 	incw y 
      0081C2 0A 01            [ 1]  137 	dec (BCNT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      0081C4 26 F4            [ 1]  138 	jrne 1$
                                    139 ; wait EOP bit 
      0081C6 72 05 50 5F FB   [ 2]  140 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      00014B                        141 	_drop 1 
      0081CB 5B 01            [ 2]    1     addw sp,#1 
      0081CD 90 85            [ 2]  142 	popw y 
      0081CF 84               [ 1]  143 	pop a 
      0081D0 81               [ 4]  144 	ret 
      0081D1                        145 program_row_end:
                                    146 
                                    147 ;-------------------------
                                    148 ; move program_row to RAM 
                                    149 ; at txtubound address 
                                    150 ;------------------------
      0081D1                        151 move_prg_to_ram:
      0081D1 89               [ 2]  152 	pushw x 
      0081D2 90 89            [ 2]  153 	pushw y 
      0081D4 AE 81 D1         [ 2]  154 	ldw x,#program_row_end 
      0081D7 1D 81 AB         [ 2]  155 	subw x,#program_row 
      0081DA CF 00 0D         [ 2]  156 	ldw acc16,x ; bytes to move 
      0081DD AE 16 90         [ 2]  157 	ldw x,#tib ; destination address 
      0081E0 90 AE 81 AB      [ 2]  158 	ldw y,#program_row ; source address 
      0081E4 CD 8E C1         [ 4]  159 	call move
      0081E7 90 85            [ 2]  160 	popw y 
      0081E9 85               [ 2]  161 	popw x  
      0081EA 81               [ 4]  162 	ret 
                                    163 
                                    164 
                                    165 ;-----------------------------
                                    166 ; write a row in FLASH/EEPROM 
                                    167 ; input:
                                    168 ;    farptr   destination address 
                                    169 ;    x        source address 
                                    170 ;-----------------------------
      0081EB                        171 write_row:
      0081EB 89               [ 2]  172 	pushw x 
      0081EC 72 5D 00 17      [ 1]  173 	tnz farptr 
      0081F0 26 0D            [ 1]  174 	jrne to_flash 
      0081F2 CE 00 18         [ 2]  175 	ldw x,farptr+1 
      0081F5 A3 AC 00         [ 2]  176 	cpw x,#app_space  
      0081F8 24 05            [ 1]  177 	jruge to_flash 
      0081FA                        178 to_eeprom:
      0081FA CD 81 2E         [ 4]  179 	call unlock_eeprom
      0081FD 20 03            [ 2]  180 	jra do_programming
      0081FF                        181 to_flash:
      0081FF CD 81 49         [ 4]  182 	call unlock_flash
      008202                        183 do_programming:
      008202 85               [ 2]  184 	popw x 
      008203 CD 16 90         [ 4]  185 	call tib
      008206 72 13 50 5F      [ 1]  186 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      00820A 72 17 50 5F      [ 1]  187 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      00820E 81               [ 4]  188 	ret 
                                    189 
                                    190 
                                    191 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                    192 ; erase flash or EEPROM block
                                    193 ; a block is 128 bytes 
                                    194 ; input:
                                    195 ;   farptr  address row begin
                                    196 ; output:
                                    197 ;   none
                                    198 ;--------------------------------------
      00820F                        199 block_erase:
      00820F 89               [ 2]  200 	pushw x 
      008210 CE 00 18         [ 2]  201 	ldw x,farptr+1
      008213 A3 AC 00         [ 2]  202 	cpw x,#app_space 
      008216 24 0C            [ 1]  203 	jruge erase_flash 
                                    204 ; erase eeprom block
      008218 CD 81 2E         [ 4]  205 	call unlock_eeprom 
      00821B CD 16 90         [ 4]  206 	call tib 
      00821E 72 17 50 5F      [ 1]  207 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      008222 20 0A            [ 2]  208 	jra erase_exit  
                                    209 ; erase flash block:
      008224                        210 erase_flash:
      008224 CD 81 49         [ 4]  211 	call unlock_flash 
      008227 CD 16 90         [ 4]  212 	call tib 
      00822A 72 13 50 5F      [ 1]  213     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00822E                        214 erase_exit: 
      00822E 85               [ 2]  215 	popw x 
      00822F 81               [ 4]  216 	ret 
                                    217 
                                    218 
                                    219 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    220 ; write a byte to FLASH or EEPROM/OPTION  
                                    221 ; input:
                                    222 ;    a  		byte to write
                                    223 ;    farptr  	address
                                    224 ;    x          farptr[x]
                                    225 ; output:
                                    226 ;    none
                                    227 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    228 	; variables locales
                           000001   229 	BTW = 1   ; byte to write offset on stack
                           000002   230 	OPT = 2   ; OPTION flag offset on stack
                           000002   231 	VSIZE = 2
      008230                        232 write_byte:
      008230 90 89            [ 2]  233 	pushw y
      0001B2                        234 	_vars VSIZE
      008232 52 02            [ 2]    1     sub sp,#VSIZE 
      008234 6B 01            [ 1]  235 	ld (BTW,sp),a ; byte to write 
      008236 0F 02            [ 1]  236 	clr (OPT,sp)  ; OPTION flag
                                    237 ; put addr[15:0] in Y, for bounds check.
      008238 90 CE 00 18      [ 2]  238 	ldw y,farptr+1   ; Y=addr15:0
                                    239 ; check addr[23:16], if <> 0 then it is extened flash memory
      00823C 72 5D 00 17      [ 1]  240 	tnz farptr 
      008240 26 14            [ 1]  241 	jrne write_flash
      008242 90 A3 AC 00      [ 2]  242     cpw y,#app_space 	 
      008246 24 0E            [ 1]  243     jruge write_flash
      008248 90 A3 40 00      [ 2]  244 	cpw y,#EEPROM_BASE  
      00824C 25 57            [ 1]  245     jrult write_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      00824E 90 A3 48 7F      [ 2]  246 	cpw y,#OPTION_END 
      008252 22 51            [ 1]  247 	jrugt write_exit
      008254 20 16            [ 2]  248 	jra write_eeprom 
                                    249 ; write program memory
      008256                        250 write_flash:
      008256 CD 81 49         [ 4]  251 	call unlock_flash 
      008259 9B               [ 1]  252 1$:	sim 
      00825A 7B 01            [ 1]  253 	ld a,(BTW,sp)
      00825C 92 A7 00 17      [ 4]  254 	ldf ([farptr],x),a ; farptr[x]=A
      008260 72 05 50 5F FB   [ 2]  255 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008265 9A               [ 1]  256     rim 
      008266 72 13 50 5F      [ 1]  257     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00826A 20 39            [ 2]  258     jra write_exit
                                    259 ; write eeprom and option
      00826C                        260 write_eeprom:
      00826C CD 81 2E         [ 4]  261 	call unlock_eeprom
                                    262 	; check for data eeprom or option eeprom
      00826F 90 A3 48 00      [ 2]  263 	cpw y,#OPTION_BASE
      008273 2B 08            [ 1]  264 	jrmi 1$
      008275 90 A3 48 80      [ 2]  265 	cpw y,#OPTION_END+1
      008279 2A 02            [ 1]  266 	jrpl 1$
      00827B 03 02            [ 1]  267 	cpl (OPT,sp)
      00827D                        268 1$: 
      00827D 0D 02            [ 1]  269     tnz (OPT,sp)
      00827F 27 08            [ 1]  270     jreq 2$
                                    271 	; pour modifier une option il faut modifier ces 2 bits
      008281 72 1E 50 5B      [ 1]  272     bset FLASH_CR2,#FLASH_CR2_OPT
      008285 72 1F 50 5C      [ 1]  273     bres FLASH_NCR2,#FLASH_CR2_OPT 
      008289                        274 2$: 
      008289 7B 01            [ 1]  275     ld a,(BTW,sp)
      00828B 92 A7 00 17      [ 4]  276     ldf ([farptr],x),a
      00828F 0D 02            [ 1]  277     tnz (OPT,sp)
      008291 27 08            [ 1]  278     jreq 3$
      008293 5C               [ 1]  279     incw x
      008294 7B 01            [ 1]  280     ld a,(BTW,sp)
      008296 43               [ 1]  281     cpl a
      008297 92 A7 00 17      [ 4]  282     ldf ([farptr],x),a
      00829B 72 05 50 5F FB   [ 2]  283 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0082A0 72 0D 50 5F FB   [ 2]  284 	btjf FLASH_IAPSR,#FLASH_IAPSR_HVOFF,.
      0082A5                        285 write_exit:
      000225                        286 	_drop VSIZE 
      0082A5 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082A7 90 85            [ 2]  287 	popw y
      0082A9 81               [ 4]  288     ret
                                    289 
                                    290 ;--------------------------------------------
                                    291 ; write a data block to eeprom or flash 
                                    292 ; input:
                                    293 ;   Y        source address   
                                    294 ;   X        array index  destination  farptr[x]
                                    295 ;   BSIZE    block size bytes 
                                    296 ;   farptr   write address , byte* 
                                    297 ; output:
                                    298 ;	X 		after last byte written 
                                    299 ;   Y 		after last byte read 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                    300 ;  farptr   point after block
                                    301 ;---------------------------------------------
      0082AA                        302 	_argofs 3 
                           000005     1     ARG_OFS=2+3 
      00022A                        303 	_arg BSIZE 1  ; block size
                           000006     1     BSIZE=ARG_OFS+1 
                                    304 	; local var 
                           000001   305 	XSAVE=1 
                           000002   306 	VSIZE=2 
      00022A                        307 write_block::
      0082AA 88               [ 1]  308 	push a 
      00022B                        309 	_vars VSIZE
      0082AB 52 02            [ 2]    1     sub sp,#VSIZE 
      0082AD 1F 01            [ 2]  310 	ldw (XSAVE,sp),x 
      0082AF 1E 06            [ 2]  311 	ldw x,(BSIZE,sp) 
      0082B1 27 13            [ 1]  312 	jreq 9$
      0082B3 1E 01            [ 2]  313 1$:	ldw x,(XSAVE,sp)
      0082B5 90 F6            [ 1]  314 	ld a,(y)
      0082B7 CD 82 30         [ 4]  315 	call write_byte 
      0082BA 5C               [ 1]  316 	incw x 
      0082BB 90 5C            [ 1]  317 	incw y 
      0082BD 1F 01            [ 2]  318 	ldw (XSAVE,sp),x
      0082BF 1E 06            [ 2]  319 	ldw x,(BSIZE,sp)
      0082C1 5A               [ 2]  320 	decw x
      0082C2 1F 06            [ 2]  321 	ldw (BSIZE,sp),x 
      0082C4 26 ED            [ 1]  322 	jrne 1$
      0082C6                        323 9$:
      0082C6 1E 01            [ 2]  324 	ldw x,(XSAVE,sp)
      0082C8 CD 9F D7         [ 4]  325 	call incr_farptr
      00024B                        326 	_drop VSIZE
      0082CB 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082CD 84               [ 1]  327 	pop a 
      0082CE 81               [ 4]  328 	ret 
                                    329 
                                    330 
                                    331 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    332 ;;  scan_free_eeprom
                                    333 ;;  return free address in eeprom 
                                    334 ;;  input:
                                    335 ;;     none
                                    336 ;;  output:
                                    337 ;;     X    address free 
                                    338 ;;          if full return 0
                                    339 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0082CF                        340 scan_free_eeprom::
      0082CF 88               [ 1]  341     push a
      000250                        342     _vars 2  
      0082D0 52 02            [ 2]    1     sub sp,#2 
      0082D2 AE 40 00         [ 2]  343     ldw x,#EEPROM_BASE  
      0082D5                        344 1$: ; expect a string here 
      0082D5 F6               [ 1]  345     ld a,(x)
      0082D6 27 10            [ 1]  346     jreq 8$ ; free address 
      0082D8 1F 01            [ 2]  347     ldw (1,sp),x 
      0082DA 5F               [ 1]  348     clrw x 
      0082DB 97               [ 1]  349     ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      0082DC 72 FB 01         [ 2]  350     addw x,(1,sp) ; skip name 
      0082DF 1C 00 05         [ 2]  351     addw x,#5 ; skip terminal 0 and value
      0082E2 A3 47 FF         [ 2]  352     cpw x,#EEPROM_END 
      0082E5 25 EE            [ 1]  353     jrult 1$
      0082E7 5F               [ 1]  354     clrw x  
      000268                        355 8$: _drop 2  
      0082E8 5B 02            [ 2]    1     addw sp,#2 
      0082EA 84               [ 1]  356     pop a 
      0082EB 81               [ 4]  357     ret 
                                    358 
                                    359 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    360 ;;  eefree 
                                    361 ;;  return free bytes in eeprom 
                                    362 ;;  input:
                                    363 ;;     none 
                                    364 ;;  output:
                                    365 ;;     X     size 
                                    366 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0082EC                        367 eefree:
      0082EC CD 82 CF         [ 4]  368     call scan_free_eeprom 
      0082EF CF 00 2D         [ 2]  369     ldw free_eeprom,x 
      0082F2 5D               [ 2]  370     tnzw x 
      0082F3 27 09            [ 1]  371     jreq 9$ 
      0082F5 89               [ 2]  372     pushw x 
      0082F6 AE 48 00         [ 2]  373     ldw x,#EEPROM_BASE+EEPROM_SIZE 
      0082F9 72 F0 01         [ 2]  374     subw x,(1,sp)
      00027C                        375     _drop 2  
      0082FC 5B 02            [ 2]    1     addw sp,#2 
      0082FE 81               [ 4]  376 9$: ret 
                                    377 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                     32     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000000     5 SEPARATE=0 ; set to 1 for 'make separate' 
                                      6 
                                      7 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
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
      0082FF                         66 Uart1RxHandler: ; console receive char 
      0082FF 72 0B 52 30 27   [ 2]   67 	btjf UART1_SR,#UART_SR_RXNE,5$
      008304 C6 52 31         [ 1]   68 	ld a,UART1_DR 
      008307 A1 03            [ 1]   69 	cp a,#CTRL_C 
      008309 26 06            [ 1]   70 	jrne 2$
      00830B CD 83 71         [ 4]   71 	call putc 
      00830E CC 80 B7         [ 2]   72 	jp user_interrupted
      008311                         73 2$:
      008311 A1 18            [ 1]   74 	cp a,#CAN ; CTRL_X 
      008313 26 03            [ 1]   75 	jrne 3$
      008315 CC 8F 5F         [ 2]   76 	jp cold_start 	
      008318 88               [ 1]   77 3$:	push a 
      008319 A6 23            [ 1]   78 	ld a,#rx1_queue 
      00831B CB 00 2C         [ 1]   79 	add a,rx1_tail 
      00831E 5F               [ 1]   80 	clrw x 
      00831F 97               [ 1]   81 	ld xl,a 
      008320 84               [ 1]   82 	pop a 
      008321 F7               [ 1]   83 	ld (x),a 
      008322 C6 00 2C         [ 1]   84 	ld a,rx1_tail 
      008325 4C               [ 1]   85 	inc a 
      008326 A4 07            [ 1]   86 	and a,#RX_QUEUE_SIZE-1
      008328 C7 00 2C         [ 1]   87 	ld rx1_tail,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      00832B 80               [11]   88 5$:	iret 
                                     89 
                                     90 ;---------------------------------------------
                                     91 ; initialize UART1, 115200 8N1
                                     92 ; input:
                                     93 ;	none
                                     94 ; output:
                                     95 ;   none
                                     96 ;---------------------------------------------
      00832C                         97 uart1_init:
      00832C 72 1A 50 02      [ 1]   98     bset PA_DDR,#UART1_TX_PIN
      008330 72 1A 50 03      [ 1]   99     bset PA_CR1,#UART1_TX_PIN 
      008334 72 1A 50 04      [ 1]  100     bset PA_CR2,#UART1_TX_PIN 
                                    101 ; enable UART1 clock
      008338 72 14 50 C7      [ 1]  102 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      00833C                        103 uart1_set_baud: 
      00833C 88               [ 1]  104 	push a 
                                    105 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    106 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      00833D A6 E1            [ 1]  107 	ld a,#CLK_SWR_HSI
      00833F C1 50 C3         [ 1]  108 	cp a,CLK_CMSR 
      008342 27 0A            [ 1]  109 	jreq 2$ 
      008344                        110 1$: ; 8 Mhz 	
      008344 35 05 52 33      [ 1]  111 	mov UART1_BRR2,#0x05 ; must be loaded first
      008348 35 04 52 32      [ 1]  112 	mov UART1_BRR1,#0x4
      00834C 20 08            [ 2]  113 	jra 3$
      00834E                        114 2$: ; 16 Mhz 	
      00834E 35 0B 52 33      [ 1]  115 	mov UART1_BRR2,#0x0b ; must be loaded first
      008352 35 08 52 32      [ 1]  116 	mov UART1_BRR1,#0x08
      008356                        117 3$:
      008356 72 5F 52 31      [ 1]  118     clr UART1_DR
      00835A 35 2C 52 35      [ 1]  119 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      00835E 72 10 52 35      [ 1]  120 	bset UART1_CR2,#UART_CR2_SBK
      008362 72 0D 52 30 FB   [ 2]  121     btjf UART1_SR,#UART_SR_TC,.
      008367 72 5F 00 2B      [ 1]  122     clr rx1_head 
      00836B 72 5F 00 2C      [ 1]  123 	clr rx1_tail
      00836F 84               [ 1]  124 	pop a  
      008370 81               [ 4]  125 	ret
                                    126 
                                    127 ;---------------------------------
                                    128 ; uart1_putc
                                    129 ; send a character via UART1
                                    130 ; input:
                                    131 ;    A  	character to send
                                    132 ;---------------------------------
      008371                        133 putc:: ; console output always on UART1
      008371                        134 uart1_putc:: 
      008371 72 0F 52 30 FB   [ 2]  135 	btjf UART1_SR,#UART_SR_TXE,.
      008376 C7 52 31         [ 1]  136 	ld UART1_DR,a 
      008379 81               [ 4]  137 	ret 
                                    138 
                                    139 
                                    140 ;---------------------------------
                                    141 ; Query for character in rx1_queue
                                    142 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                    143 ;   none 
                                    144 ; output:
                                    145 ;   A     0 no charcter available
                                    146 ;   Z     1 no character available
                                    147 ;---------------------------------
      00837A                        148 qgetc::
      00837A                        149 uart1_qgetc::
      00837A C6 00 2B         [ 1]  150 	ld a,rx1_head 
      00837D C0 00 2C         [ 1]  151 	sub a,rx1_tail 
      008380 81               [ 4]  152 	ret 
                                    153 
                                    154 ;---------------------------------
                                    155 ; wait character from UART1 
                                    156 ; input:
                                    157 ;   none
                                    158 ; output:
                                    159 ;   A 			char  
                                    160 ;--------------------------------	
      008381                        161 getc:: ;console input
      008381                        162 uart1_getc::
      008381 CD 83 7A         [ 4]  163 	call uart1_qgetc
      008384 27 FB            [ 1]  164 	jreq uart1_getc 
      008386 89               [ 2]  165 	pushw x 
                                    166 ;; rx1_queue must be in page 0 	
      008387 A6 23            [ 1]  167 	ld a,#rx1_queue
      008389 CB 00 2B         [ 1]  168 	add a,rx1_head 
      00838C 5F               [ 1]  169 	clrw x  
      00838D 97               [ 1]  170 	ld xl,a 
      00838E F6               [ 1]  171 	ld a,(x)
      00838F 88               [ 1]  172 	push a
      008390 C6 00 2B         [ 1]  173 	ld a,rx1_head 
      008393 4C               [ 1]  174 	inc a 
      008394 A4 07            [ 1]  175 	and a,#RX_QUEUE_SIZE-1
      008396 C7 00 2B         [ 1]  176 	ld rx1_head,a 
      008399 84               [ 1]  177 	pop a  
      00839A 85               [ 2]  178 	popw x
      00839B 81               [ 4]  179 	ret 
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
      00839C 43 81 44 80 48 82 46   194 convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',KEY_END,'3',SUP,0,0
             83 33 84 00 00
                                    195 
                                    196 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
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
      0083A8                        207 get_escape:
      0083A8 CD 83 81         [ 4]  208     call getc 
      0083AB A1 5B            [ 1]  209     cp a,#'[ ; this character is expected after ESC 
      0083AD 27 02            [ 1]  210     jreq 1$
      0083AF 4F               [ 1]  211     clr a
      0083B0 81               [ 4]  212     ret
      0083B1 CD 83 81         [ 4]  213 1$: call getc 
      0083B4 AE 83 9C         [ 2]  214     ldw x,#convert_table
      0083B7                        215 2$:
      0083B7 F1               [ 1]  216     cp a,(x)
      0083B8 27 08            [ 1]  217     jreq 4$
      0083BA 1C 00 02         [ 2]  218     addw x,#2
      0083BD 7D               [ 1]  219     tnz (x)
      0083BE 26 F7            [ 1]  220     jrne 2$
      0083C0 4F               [ 1]  221     clr a
      0083C1 81               [ 4]  222     ret 
      0083C2 5C               [ 1]  223 4$: incw x 
      0083C3 F6               [ 1]  224     ld a,(x)
      0083C4 A1 84            [ 1]  225     cp a,#SUP
      0083C6 26 05            [ 1]  226     jrne 5$
      0083C8 88               [ 1]  227     push a 
      0083C9 CD 83 81         [ 4]  228     call getc
      0083CC 84               [ 1]  229     pop a 
      0083CD                        230 5$:
      0083CD 81               [ 4]  231     ret 
                                    232 
                                    233 
                                    234 ;-----------------------------
                                    235 ; send an ASCIZ string to UART1 
                                    236 ; input: 
                                    237 ;   x 		char * 
                                    238 ; output:
                                    239 ;   none 
                                    240 ;-------------------------------
      0083CE                        241 puts::
      0083CE F6               [ 1]  242     ld a,(x)
      0083CF 27 06            [ 1]  243 	jreq 1$
      0083D1 CD 83 71         [ 4]  244 	call putc 
      0083D4 5C               [ 1]  245 	incw x 
      0083D5 20 F7            [ 2]  246 	jra puts 
      0083D7 81               [ 4]  247 1$:	ret 
                                    248 
                                    249 
                                    250 ;---------------------------
                                    251 ; delete character at left 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                    252 ; of cursor on terminal 
                                    253 ; input:
                                    254 ;   none 
                                    255 ; output:
                                    256 ;	none 
                                    257 ;---------------------------
      0083D8                        258 bksp:
      0083D8 A6 08            [ 1]  259 	ld a,#BS 
      0083DA CD 83 71         [ 4]  260 	call putc 
      0083DD A6 20            [ 1]  261 	ld a,#SPACE 
      0083DF CD 83 71         [ 4]  262 	call putc 
      0083E2 A6 08            [ 1]  263 	ld a,#BS 
      0083E4 CD 83 71         [ 4]  264 	call putc 
      0083E7 81               [ 4]  265 	ret 
                                    266 ;---------------------------
                                    267 ; delete n character left of cursor 
                                    268 ; at terminal.
                                    269 ; input: 
                                    270 ;   A   number of characters to delete.
                                    271 ; output:
                                    272 ;    none 
                                    273 ;--------------------------	
      0083E8                        274 delete_nchar:
      0083E8 88               [ 1]  275 	push a 
      0083E9 0D 01            [ 1]  276 0$:	tnz (1,sp)
      0083EB 27 07            [ 1]  277 	jreq 1$
      0083ED CD 83 D8         [ 4]  278 	call bksp 
      0083F0 0A 01            [ 1]  279 	dec (1,sp)
      0083F2 20 F5            [ 2]  280 	jra 0$
      0083F4 84               [ 1]  281 1$:	pop a 
      0083F5 81               [ 4]  282 	ret
                                    283 
                                    284 ;--------------------------
                                    285 ; send ANSI escape sequence
                                    286 ; ANSI: ESC[
                                    287 ; note: ESC is ASCII 27
                                    288 ;       [   is ASCII 91  
                                    289 ;-------------------------- 
      0083F6                        290 send_escape:
      0083F6 A6 1B            [ 1]  291 	ld a,#ESC 
      0083F8 CD 83 71         [ 4]  292 	call putc 
      0083FB A6 5B            [ 1]  293 	ld a,#'[
      0083FD CD 83 71         [ 4]  294 	call putc 
      008400 81               [ 4]  295 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                    307 ; 	A {0..99} 
                                    308 ; output:
                                    309 ;   none 
                                    310 ;---------------------
      008401                        311 send_parameter:
      008401 89               [ 2]  312 	pushw x 
      008402 5F               [ 1]  313 	clrw x 
      008403 97               [ 1]  314 	ld xl,a 
      008404 A6 0A            [ 1]  315 	ld a,#10 
      008406 62               [ 2]  316 	div x,a 
      008407 95               [ 1]  317 	ld xh,a 
      008408 9F               [ 1]  318 	ld a,xl
      008409 4D               [ 1]  319     tnz a 
      00840A 27 0B            [ 1]  320     jreq 2$
      00840C A1 09            [ 1]  321 	cp a,#9 
      00840E 23 02            [ 2]  322 	jrule 1$
      008410 A6 39            [ 1]  323 	ld a,#'9
      008412                        324 1$:
      008412 AB 30            [ 1]  325 	add a,#'0 
      008414 CD 83 71         [ 4]  326 	call putc
      008417 9E               [ 1]  327 2$:	ld a,xh 
      008418 AB 30            [ 1]  328 	add a,#'0
      00841A CD 83 71         [ 4]  329 	call putc 
      00841D 85               [ 2]  330 	popw x 
      00841E 81               [ 4]  331 	ret 
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
      00841F                        344 move_left:
      00841F 88               [ 1]  345 	push a 
      008420 CD 83 F6         [ 4]  346 	call send_escape
      008423 84               [ 1]  347     pop a
      008424 CD 84 01         [ 4]  348 	call send_parameter 
      008427 A6 44            [ 1]  349 	ld a,#'D 
      008429 CD 83 71         [ 4]  350 	call putc 
      00842C 81               [ 4]  351 	ret	
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      00842D                        362 move_right:
      00842D 88               [ 1]  363 	push a 
      00842E CD 83 F6         [ 4]  364 	call send_escape
      008431 84               [ 1]  365     pop a
      008432 CD 84 01         [ 4]  366 	call send_parameter 
      008435 A6 43            [ 1]  367 	ld a,#'C 
      008437 CD 83 71         [ 4]  368 	call putc 
      00843A 81               [ 4]  369 	ret 
                                    370 
                                    371 
                                    372 ;--------------------------
                                    373 ; print n spaces on terminal
                                    374 ; input:
                                    375 ;  X 		number of spaces 
                                    376 ; output:
                                    377 ;	none 
                                    378 ;---------------------------
      00843B                        379 spaces::
      00843B A6 20            [ 1]  380 	ld a,#SPACE 
      00843D 5D               [ 2]  381 1$:	tnzw x
      00843E 27 06            [ 1]  382 	jreq 9$
      008440 CD 83 71         [ 4]  383 	call putc 
      008443 5A               [ 2]  384 	decw x
      008444 20 F7            [ 2]  385 	jra 1$
      008446                        386 9$: 
      008446 81               [ 4]  387 	ret 
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
      008447                        404 insert_char: 
      0003C7                        405 	_vars VSIZE 
      008447 52 02            [ 2]    1     sub sp,#VSIZE 
      008449 6B 02            [ 1]  406     ld (KCHAR,sp),a 
      00844B 9E               [ 1]  407     ld a,xh 
      00844C 6B 01            [ 1]  408 	ld (IPOS,sp),a
      00844E 9F               [ 1]  409     ld a,xl 
      00844F 6B 03            [ 1]  410     ld (LLEN,sp),a  
      008451 93               [ 1]  411     ldw x,y
      008452 5C               [ 1]  412     incw x 
      008453 7B 03            [ 1]  413     ld a,(LLEN,sp)
      008455 10 01            [ 1]  414     sub a,(IPOS,sp)
      008457 4C               [ 1]  415     inc a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      008458 C7 00 0E         [ 1]  416     ld acc8,a 
      00845B 72 5F 00 0D      [ 1]  417     clr acc16
      00845F CD 8E C1         [ 4]  418     call move
      008462 90 AE 16 90      [ 2]  419     ldw y,#tib 
      008466 7B 01            [ 1]  420     ld a,(IPOS,sp)
      008468 C7 00 0E         [ 1]  421     ld acc8,a 
      00846B 72 B9 00 0D      [ 2]  422     addw y,acc16 
      00846F 7B 02            [ 1]  423     ld a,(KCHAR,sp)
      008471 90 F7            [ 1]  424     ld (y),a
      008473 90 5C            [ 1]  425     incw y  
      008475 7B 01            [ 1]  426     ld a,(IPOS,sp)
      008477 CD 84 1F         [ 4]  427     call move_left
      00847A AE 16 90         [ 2]  428     ldw x,#tib 
      00847D CD 83 CE         [ 4]  429     call puts 
      008480 7B 03            [ 1]  430     ld a,(LLEN,sp)
      008482 10 01            [ 1]  431     sub a,(IPOS,sp) 
      008484 CD 84 1F         [ 4]  432     call move_left 
      000407                        433 	_drop VSIZE 
      008487 5B 02            [ 2]    1     addw sp,#VSIZE 
      008489 81               [ 4]  434 	ret 
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
      00848A                        447 delete_under:
      00040A                        448 	_vars VSIZE 
      00848A 52 02            [ 2]    1     sub sp,#VSIZE 
      00848C 6B 02            [ 1]  449     ld (LLEN,sp),a 
      00848E 9F               [ 1]  450     ld a,xl 
      00848F 6B 01            [ 1]  451     ld (CPOS,sp),a 
      008491 93               [ 1]  452     ldw x,y ; move destination
      008492 90 5C            [ 1]  453     incw y  ; move source 
      008494 7B 02            [ 1]  454     ld a,(LLEN,sp)
      008496 10 01            [ 1]  455     sub a,(CPOS,sp)
      008498 4C               [ 1]  456     inc a ; move including zero at end.
      008499 C7 00 0E         [ 1]  457     ld acc8,a 
      00849C 72 5F 00 0D      [ 1]  458     clr acc16 
      0084A0 CD 8E C1         [ 4]  459 	call move 
      0084A3 90 AE 16 90      [ 2]  460     ldw y,#tib 
      0084A7 7B 01            [ 1]  461     ld a,(CPOS,sp)
      0084A9 C7 00 0E         [ 1]  462     ld acc8,a 
      0084AC 72 B9 00 0D      [ 2]  463     addw y,acc16 
      0084B0 93               [ 1]  464     ldw x,y 
      0084B1 CD 83 CE         [ 4]  465     call puts 
      0084B4 A6 20            [ 1]  466     ld a,#SPACE  
      0084B6 CD 83 71         [ 4]  467     call putc
      0084B9 7B 02            [ 1]  468     ld a,(LLEN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0084BB 10 01            [ 1]  469     sub a,(CPOS,sp)
      0084BD CD 84 1F         [ 4]  470     call move_left 
      0084C0 0A 02            [ 1]  471     dec (LLEN,sp)
      000442                        472 	_drop VSIZE 
      0084C2 5B 02            [ 2]    1     addw sp,#VSIZE 
      0084C4 81               [ 4]  473 	ret 
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
      0084C5                        485 delete_line:
      0084C5 CD 83 F6         [ 4]  486     call send_escape
      0084C8 A6 32            [ 1]  487 	ld a,#'2
      0084CA CD 83 71         [ 4]  488 	call putc 
      0084CD A6 4B            [ 1]  489 	ld a,#'K 
      0084CF CD 83 71         [ 4]  490 	call putc 
      0084D2 81               [ 4]  491 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      0084D3                        523 readln::
      000453                        524 	_vars VSIZE 
      0084D3 52 04            [ 2]    1     sub sp,#VSIZE 
      0084D5 5F               [ 1]  525 	clrw x 
      0084D6 1F 02            [ 2]  526 	ldw (LL,sp),x 
      0084D8 1F 03            [ 2]  527 	ldw (CPOS,sp),x 
      0084DA 03 04            [ 1]  528 	cpl (OVRWR,sp) ; default to overwrite mode 
      0084DC 90 AE 16 90      [ 2]  529  	ldw y,#tib ; input buffer
      0084E0                        530 readln_loop:
      0084E0 CD 83 81         [ 4]  531 	call getc
      0084E3 6B 01            [ 1]  532 	ld (RXCHAR,sp),a
      0084E5 A1 1B            [ 1]  533     cp a,#ESC 
      0084E7 26 05            [ 1]  534     jrne 0$
      0084E9 CD 83 A8         [ 4]  535     call get_escape 
      0084EC 6B 01            [ 1]  536     ld (RXCHAR,sp),a 
      0084EE A1 0D            [ 1]  537 0$:	cp a,#CR
      0084F0 26 03            [ 1]  538 	jrne 1$
      0084F2 CC 86 7C         [ 2]  539 	jp readln_quit
      0084F5 A1 0A            [ 1]  540 1$:	cp a,#LF 
      0084F7 26 03            [ 1]  541 	jrne 2$ 
      0084F9 CC 86 7C         [ 2]  542 	jp readln_quit
      0084FC                        543 2$:
      0084FC A1 08            [ 1]  544 	cp a,#BS
      0084FE 26 12            [ 1]  545 	jrne 3$
                                    546 ; delete left 
      008500 0D 03            [ 1]  547     tnz (CPOS,sp)
      008502 27 DC            [ 1]  548     jreq readln_loop 
      008504 A6 01            [ 1]  549     ld a,#1 
      008506 CD 84 1F         [ 4]  550     call move_left
      008509 0A 03            [ 1]  551     dec (CPOS,sp)
      00850B 90 5A            [ 2]  552     decw y 
      00850D 7B 03            [ 1]  553     ld a,(CPOS,sp) 
      00850F CC 86 28         [ 2]  554     jp 12$
      008512                        555 3$:
      008512 A1 04            [ 1]  556 	cp a,#CTRL_D
      008514 26 1A            [ 1]  557 	jrne 4$
                                    558 ;delete line 
      008516 CD 84 C5         [ 4]  559 	call delete_line 
      008519 7B 03            [ 1]  560     ld a,(CPOS,sp)
      00851B 4C               [ 1]  561     inc a 
      00851C CD 84 1F         [ 4]  562     call move_left 
      00851F A6 3E            [ 1]  563 	ld a,#'> 
      008521 CD 83 71         [ 4]  564 	call putc 
      008524 90 AE 16 90      [ 2]  565 	ldw y,#tib
      008528 90 7F            [ 1]  566 	clr (y)
      00852A 0F 02            [ 1]  567 	clr (LL,sp)
      00852C 0F 03            [ 1]  568 	clr (CPOS,sp)
      00852E 20 B0            [ 2]  569 	jra readln_loop
      008530                        570 4$:
      008530 A1 12            [ 1]  571 	cp a,#CTRL_R 
      008532 26 21            [ 1]  572 	jrne 5$
                                    573 ;reprint 
      008534 0D 02            [ 1]  574 	tnz (LL,sp)
      008536 26 A8            [ 1]  575 	jrne readln_loop
      008538 AE 16 90         [ 2]  576 	ldw x,#tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      00853B CD 8E 95         [ 4]  577 	call strlen 
      00853E 90 AE 16 90      [ 2]  578 	ldw y,#tib 
      008542 27 9C            [ 1]  579 	jreq readln_loop
      008544 6B 02            [ 1]  580 	ld (LL,sp),a 
      008546 6B 03            [ 1]  581     ld (CPOS,sp),a
      008548 AE 16 90         [ 2]  582 	ldw x,#tib 
      00854B CD 83 CE         [ 4]  583 	call puts
      00854E 0F 01            [ 1]  584 	clr (LL_HB,sp)
      008550 72 F9 01         [ 2]  585 	addw y,(LL_HB,sp)
      008553 20 8B            [ 2]  586 	jra readln_loop 
      008555                        587 5$:
      008555 A1 05            [ 1]  588 	cp a,#CTRL_E 
      008557 26 49            [ 1]  589 	jrne 6$
                                    590 ;edit line number 
      008559 AE 16 90         [ 2]  591 	ldw x,#tib 
      00855C CD 94 81         [ 4]  592 	call atoi24
      00855F CE 00 0D         [ 2]  593 	ldw x,acc16
      008562 CD 86 B6         [ 4]  594 	call search_lineno
      008565 5D               [ 2]  595 	tnzw x 
      008566 26 0B            [ 1]  596 	jrne 51$
      008568 0F 02            [ 1]  597 	clr (LL,sp)
      00856A 90 AE 16 90      [ 2]  598 	ldw y,#tib
      00856E 90 7F            [ 1]  599     clr (y) 	
      008570 CC 86 7C         [ 2]  600 	jp readln_quit  
      008573                        601 51$:
      008573 CF 00 05         [ 2]  602 	ldw basicptr,x
      008576 E6 02            [ 1]  603 	ld a,(2,x)
      008578 C7 00 04         [ 1]  604 	ld count,a 
      00857B 90 AE 16 90      [ 2]  605 	ldw y,#tib 
      00857F CD 8C 48         [ 4]  606 	call decompile 
      008582 0F 01            [ 1]  607 	clr (LL_HB,sp)
      008584 A6 0D            [ 1]  608 	ld a,#CR 
      008586 CD 83 71         [ 4]  609 	call putc 
      008589 A6 3E            [ 1]  610 	ld a,#'>
      00858B CD 83 71         [ 4]  611 	call putc
      00858E AE 16 90         [ 2]  612     ldw x,#tib  
      008591 CD 8E 95         [ 4]  613 	call strlen 
      008594 6B 02            [ 1]  614 	ld (LL,sp),a 
      008596 CD 83 CE         [ 4]  615 	call puts 
      008599 90 93            [ 1]  616 	ldw y,x
      00859B 7B 02            [ 1]  617     ld a,(LL,sp)
      00859D 6B 03            [ 1]  618     ld (CPOS,sp),a  
      00859F CC 84 E0         [ 2]  619 	jp readln_loop
      0085A2                        620 6$:
      0085A2 A1 81            [ 1]  621 	cp a,#ARROW_RIGHT
      0085A4 26 15            [ 1]  622    	jrne 7$ 
                                    623 ; right arrow
      0085A6 7B 03            [ 1]  624 	ld a,(CPOS,sp)
      0085A8 11 02            [ 1]  625     cp a,(LL,sp)
      0085AA 2B 03            [ 1]  626     jrmi 61$
      0085AC CC 84 E0         [ 2]  627     jp readln_loop 
      0085AF                        628 61$:
      0085AF A6 01            [ 1]  629     ld a,#1 
      0085B1 CD 84 2D         [ 4]  630 	call move_right 
      0085B4 0C 03            [ 1]  631 	inc (CPOS,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0085B6 90 5C            [ 1]  632     incw y 
      0085B8 CC 84 E0         [ 2]  633     jp readln_loop 
      0085BB A1 80            [ 1]  634 7$: cp a,#ARROW_LEFT  
      0085BD 26 13            [ 1]  635 	jrne 8$
                                    636 ; left arrow 
      0085BF 0D 03            [ 1]  637 	tnz (CPOS,sp)
      0085C1 26 03            [ 1]  638 	jrne 71$
      0085C3 CC 84 E0         [ 2]  639 	jp readln_loop
      0085C6                        640 71$:
      0085C6 A6 01            [ 1]  641     ld a,#1 
      0085C8 CD 84 1F         [ 4]  642 	call move_left 
      0085CB 0A 03            [ 1]  643 	dec (CPOS,sp)
      0085CD 90 5A            [ 2]  644     decw y 
      0085CF CC 84 E0         [ 2]  645 	jp readln_loop 
      0085D2 A1 82            [ 1]  646 8$: cp a,#HOME  
      0085D4 26 0E            [ 1]  647 	jrne 9$
                                    648 ; HOME 
      0085D6 7B 03            [ 1]  649     ld a,(CPOS,sp)
      0085D8 CD 84 1F         [ 4]  650     call move_left 
      0085DB 0F 03            [ 1]  651 	clr (CPOS,sp)
      0085DD 90 AE 16 90      [ 2]  652     ldw y,#tib 
      0085E1 CC 84 E0         [ 2]  653 	jp readln_loop  
      0085E4 A1 83            [ 1]  654 9$: cp a,#KEY_END  
      0085E6 26 26            [ 1]  655 	jrne 10$
                                    656 ; KEY_END 
      0085E8 7B 03            [ 1]  657 	ld a,(CPOS,sp)
      0085EA 11 02            [ 1]  658 	cp a,(LL,sp)
      0085EC 26 03            [ 1]  659 	jrne 91$
      0085EE CC 84 E0         [ 2]  660 	jp readln_loop 
      0085F1                        661 91$:
      0085F1 7B 02            [ 1]  662 	ld a,(LL,sp)
      0085F3 10 03            [ 1]  663 	sub a,(CPOS,sp)
      0085F5 CD 84 2D         [ 4]  664 	call move_right 
      0085F8 7B 02            [ 1]  665 	ld a,(LL,sp)
      0085FA 6B 03            [ 1]  666 	ld (CPOS,sp),a
      0085FC 90 AE 16 90      [ 2]  667     ldw y,#tib
      008600 72 5F 00 0D      [ 1]  668     clr acc16 
      008604 C7 00 0E         [ 1]  669     ld acc8,a 
      008607 72 B9 00 0D      [ 2]  670     addw y,acc16  
      00860B CC 84 E0         [ 2]  671 	jp readln_loop 
      00860E A1 0F            [ 1]  672 10$: cp a,#CTRL_O
      008610 26 0C            [ 1]  673 	jrne 11$ 
                                    674 ; toggle between insert/overwrite
      008612 03 04            [ 1]  675 	cpl (OVRWR,sp)
      008614 90 89            [ 2]  676 	pushw y 
      008616 CD 9E 3E         [ 4]  677 	call beep_1khz
      008619 90 85            [ 2]  678 	popw y 
      00861B CC 84 E0         [ 2]  679 	jp readln_loop 
      00861E A1 84            [ 1]  680 11$: cp a,#SUP 
      008620 26 11            [ 1]  681     jrne final_test 
                                    682 ; del character under cursor 
      008622 7B 03            [ 1]  683     ld a,(CPOS,sp)
      008624 11 02            [ 1]  684     cp a,(LL,sp)
      008626 2A 08            [ 1]  685     jrpl 13$
      008628                        686 12$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      008628 97               [ 1]  687     ld xl,a    ; cursor position 
      008629 7B 02            [ 1]  688     ld a,(LL,sp)  ; line length
      00862B CD 84 8A         [ 4]  689     call delete_under
      00862E 0A 02            [ 1]  690     dec (LLEN,sp)
      008630                        691 13$:
      008630 CC 84 E0         [ 2]  692     jp readln_loop 
      008633                        693 final_test:
      008633 A1 20            [ 1]  694 	cp a,#SPACE
      008635 2A 03            [ 1]  695 	jrpl accept_char
      008637 CC 84 E0         [ 2]  696 	jp readln_loop
      00863A                        697 accept_char:
      00863A A6 4F            [ 1]  698 	ld a,#TIB_SIZE-1
      00863C 11 02            [ 1]  699 	cp a, (LL,sp)
      00863E 2A 03            [ 1]  700 	jrpl 1$
      008640 CC 84 E0         [ 2]  701 	jp readln_loop
      008643 0D 04            [ 1]  702 1$:	tnz (OVRWR,sp)
      008645 26 18            [ 1]  703 	jrne overwrite
                                    704 ; insert mode 
      008647 7B 03            [ 1]  705     ld a,(CPOS,sp)
      008649 11 02            [ 1]  706     cp a,(LL,sp)
      00864B 27 12            [ 1]  707     jreq overwrite
      00864D 7B 02            [ 1]  708     ld a,(LL,sp)
      00864F 97               [ 1]  709     ld xl,a 
      008650 7B 03            [ 1]  710     ld a,(CPOS,sp)
      008652 95               [ 1]  711     ld xh,a
      008653 7B 01            [ 1]  712     ld a,(RXCHAR,sp)
      008655 CD 84 47         [ 4]  713     call insert_char
      008658 0C 02            [ 1]  714     inc (LLEN,sp)
      00865A 0C 03            [ 1]  715     inc (CPOS,sp)
      00865C CC 84 E0         [ 2]  716     jp readln_loop 
      00865F                        717 overwrite:
      00865F 7B 01            [ 1]  718 	ld a,(RXCHAR,sp)
      008661 90 F7            [ 1]  719 	ld (y),a
      008663 90 5C            [ 1]  720     incw y
      008665 CD 83 71         [ 4]  721     call putc 
      008668 7B 03            [ 1]  722 	ld a,(CPOS,sp)
      00866A 11 02            [ 1]  723 	cp a,(LL,sp)
      00866C 2B 09            [ 1]  724 	jrmi 1$
      00866E 90 7F            [ 1]  725 	clr (y)
      008670 0C 02            [ 1]  726 	inc (LL,sp)
      008672 0C 03            [ 1]  727     inc (CPOS,sp)
      008674 CC 84 E0         [ 2]  728 	jp readln_loop 
      008677                        729 1$:	
      008677 0C 03            [ 1]  730 	inc (CPOS,sp)
      008679 CC 84 E0         [ 2]  731 	jp readln_loop 
      00867C                        732 readln_quit:
      00867C 90 AE 16 90      [ 2]  733 	ldw y,#tib
      008680 0F 01            [ 1]  734     clr (LL_HB,sp) 
      008682 72 F9 01         [ 2]  735     addw y,(LL_HB,sp)
      008685 90 7F            [ 1]  736     clr (y)
      008687 7B 02            [ 1]  737 	ld a,(LL,sp)
      008689 C7 00 04         [ 1]  738 	ld count,a 
      00868C A6 0D            [ 1]  739 	ld a,#CR
      00868E CD 83 71         [ 4]  740 	call putc
      000611                        741 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      008691 5B 04            [ 2]    1     addw sp,#VSIZE 
      008693 81               [ 4]  742 	ret
                                    743 
                                    744 ;------------------------------
                                    745 ; print byte  in hexadecimal 
                                    746 ; on console
                                    747 ; input:
                                    748 ;    A		byte to print
                                    749 ;------------------------------
      008694                        750 print_hex::
      008694 88               [ 1]  751 	push a 
      008695 4E               [ 1]  752 	swap a 
      008696 CD 86 AB         [ 4]  753 	call to_hex_char 
      008699 CD 83 71         [ 4]  754 	call putc 
      00869C 7B 01            [ 1]  755     ld a,(1,sp) 
      00869E CD 86 AB         [ 4]  756 	call to_hex_char
      0086A1 CD 83 71         [ 4]  757 	call putc
      0086A4 A6 20            [ 1]  758 	ld a,#SPACE 
      0086A6 CD 83 71         [ 4]  759 	call putc 
      0086A9 84               [ 1]  760 	pop a 
      0086AA 81               [ 4]  761 	ret 
                                    762 
                                    763 ;----------------------------------
                                    764 ; convert to hexadecimal digit 
                                    765 ; input:
                                    766 ;   A       digit to convert 
                                    767 ; output:
                                    768 ;   A       hexdecimal character 
                                    769 ;----------------------------------
      0086AB                        770 to_hex_char::
      0086AB A4 0F            [ 1]  771 	and a,#15 
      0086AD A1 09            [ 1]  772 	cp a,#9 
      0086AF 23 02            [ 2]  773 	jrule 1$ 
      0086B1 AB 07            [ 1]  774 	add a,#7
      0086B3 AB 30            [ 1]  775 1$: add a,#'0 
      0086B5 81               [ 4]  776 	ret 
                                    777 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                                     26     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000000     5 SEPARATE=0 ; set to 1 for 'make separate' 
                                      6 
                                      7 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
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
      0086B6                         51 search_lineno::
      000636                         52 	_vars VSIZE
      0086B6 52 02            [ 2]    1     sub sp,#VSIZE 
      0086B8 0F 01            [ 1]   53 	clr (LL,sp)
      0086BA 90 CE 00 1A      [ 2]   54 	ldw y,txtbgn
      0086BE 4D               [ 1]   55 	tnz a 
      0086BF 27 04            [ 1]   56 	jreq search_ln_loop
      0086C1 90 CE 00 05      [ 2]   57 	ldw y,basicptr 
      0086C5                         58 search_ln_loop:
      0086C5 90 C3 00 1C      [ 2]   59 	cpw y,txtend 
      0086C9 2A 10            [ 1]   60 	jrpl 8$
      0086CB 90 F3            [ 1]   61 	cpw x,(y)
      0086CD 27 0E            [ 1]   62 	jreq 9$
      0086CF 2B 0A            [ 1]   63 	jrmi 8$ 
      0086D1 90 E6 02         [ 1]   64 	ld a,(2,y)
      0086D4 6B 02            [ 1]   65 	ld (LB,sp),a 
      0086D6 72 F9 01         [ 2]   66 	addw y,(LL,sp)
      0086D9 20 EA            [ 2]   67 	jra search_ln_loop 
      0086DB                         68 8$: 
      0086DB 5F               [ 1]   69 	clrw x 	
      0086DC 51               [ 1]   70 	exgw x,y 
      00065D                         71 9$: _drop VSIZE
      0086DD 5B 02            [ 2]    1     addw sp,#VSIZE 
      0086DF 51               [ 1]   72 	exgw x,y   
      0086E0 81               [ 4]   73 	ret 
                                     74 
                                     75 ;-------------------------------------
                                     76 ; delete line at addr
                                     77 ; input:
                                     78 ;   X 		addr of line i.e DEST for move 
                                     79 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                           000001    80 	LLEN=1
                           000003    81 	SRC=3
                           000004    82 	VSIZE=4
      0086E1                         83 del_line: 
      000661                         84 	_vars VSIZE 
      0086E1 52 04            [ 2]    1     sub sp,#VSIZE 
      0086E3 E6 02            [ 1]   85 	ld a,(2,x) ; line length
      0086E5 6B 02            [ 1]   86 	ld (LLEN+1,sp),a 
      0086E7 0F 01            [ 1]   87 	clr (LLEN,sp)
      0086E9 90 93            [ 1]   88 	ldw y,x  
      0086EB 72 F9 01         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      0086EE 17 03            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      0086F0 90 CE 00 1C      [ 2]   91 	ldw y,txtend 
      0086F4 72 F2 03         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      0086F7 90 CF 00 0D      [ 2]   93 	ldw acc16,y 
      0086FB 16 03            [ 2]   94 	ldw y,(SRC,sp)    ; source
      0086FD CD 8E C1         [ 4]   95 	call move
      008700 90 CE 00 1C      [ 2]   96 	ldw y,txtend 
      008704 72 F2 01         [ 2]   97 	subw y,(LLEN,sp)
      008707 90 CF 00 1C      [ 2]   98 	ldw txtend,y  
      00068B                         99 	_drop VSIZE     
      00870B 5B 04            [ 2]    1     addw sp,#VSIZE 
      00870D 81               [ 4]  100 	ret 
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
      00870E                        115 create_gap:
      00068E                        116 	_vars VSIZE
      00870E 52 06            [ 2]    1     sub sp,#VSIZE 
      008710 1F 03            [ 2]  117 	ldw (SRC,sp),x 
      008712 17 05            [ 2]  118 	ldw (LEN,sp),y 
      008714 90 CF 00 0D      [ 2]  119 	ldw acc16,y 
      008718 90 93            [ 1]  120 	ldw y,x ; SRC
      00871A 72 BB 00 0D      [ 2]  121 	addw x,acc16  
      00871E 1F 01            [ 2]  122 	ldw (DEST,sp),x 
                                    123 ;compute size to move 	
      008720 CE 00 1C         [ 2]  124 	ldw x,txtend 
      008723 72 F0 03         [ 2]  125 	subw x,(SRC,sp)
      008726 CF 00 0D         [ 2]  126 	ldw acc16,x ; size to move
      008729 1E 01            [ 2]  127 	ldw x,(DEST,sp) 
      00872B CD 8E C1         [ 4]  128 	call move
      00872E CE 00 1C         [ 2]  129 	ldw x,txtend
      008731 72 FB 05         [ 2]  130 	addw x,(LEN,sp)
      008734 CF 00 1C         [ 2]  131 	ldw txtend,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0006B7                        132 9$:	_drop VSIZE 
      008737 5B 06            [ 2]    1     addw sp,#VSIZE 
      008739 81               [ 4]  133 	ret 
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
      00873A                        150 insert_line:
      0006BA                        151 	_vars VSIZE 
      00873A 52 08            [ 2]    1     sub sp,#VSIZE 
      00873C CE 00 1C         [ 2]  152 	ldw x,txtend  
      00873F C3 00 1A         [ 2]  153 	cpw x,txtbgn 
      008742 26 19            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      008744 AE 00 02         [ 2]  156 	ldw x,#2 
      008747 72 D6 00 18      [ 4]  157 	ld a,([ptr16],x)
      00874B A1 03            [ 1]  158 	cp a,#3
      00874D 27 5A            [ 1]  159 	jreq insert_ln_exit
      00874F 5F               [ 1]  160 	clrw x 
      008750 97               [ 1]  161 	ld xl,a
      008751 1F 07            [ 2]  162 	ldw (LLEN,sp),x 
      008753 CE 00 1A         [ 2]  163 	ldw x,txtbgn
      008756 1F 01            [ 2]  164 	ldw (DEST,sp),x 
      008758 CE 00 1C         [ 2]  165 	ldw x,txtend 
      00875B 20 38            [ 2]  166 	jra 4$
      00875D 72 CE 00 18      [ 5]  167 0$:	ldw x,[ptr16]
                                    168 ; line number
      008761 1F 05            [ 2]  169 	ldw (LINENO,sp),x 
      008763 AE 00 02         [ 2]  170 	ldw x,#2 
      008766 72 D6 00 18      [ 4]  171 	ld a,([ptr16],x)
      00876A 97               [ 1]  172 	ld xl,a
                                    173 ; line length
      00876B 1F 07            [ 2]  174 	ldw (LLEN,sp),x
                                    175 ; check if that line number already exit 	
      00876D 1E 05            [ 2]  176 	ldw x,(LINENO,sp)
      00876F 4F               [ 1]  177 	clr a 
      008770 CD 86 B6         [ 4]  178 	call search_lineno 
      008773 5D               [ 2]  179 	tnzw x 
      008774 26 04            [ 1]  180 	jrne 2$
                                    181 ; line doesn't exit
                                    182 ; it will be inserted at this point.  	
      008776 17 01            [ 2]  183 	ldw (DEST,sp),y 
      008778 20 05            [ 2]  184 	jra 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                    185 ; line exit delete it.
                                    186 ; it will be replaced by new one 	
      00877A 1F 01            [ 2]  187 2$: ldw (DEST,sp),x 
      00877C CD 86 E1         [ 4]  188 	call del_line
      00877F                        189 3$: 
                                    190 ; insert new line or leave if LLEN==3
                                    191 ; LLEN==3 means empty line 
      00877F A6 03            [ 1]  192 	ld a,#3
      008781 11 08            [ 1]  193 	cp a,(LLEN+1,sp)
      008783 27 24            [ 1]  194 	jreq insert_ln_exit ; empty line exit.
                                    195 ; if insertion point at txtend 
                                    196 ; move no need to create a gap 
      008785 1E 01            [ 2]  197 	ldw x,(DEST,sp)
      008787 C3 00 1C         [ 2]  198 	cpw x,txtend 
      00878A 27 09            [ 1]  199 	jreq 4$ 
                                    200 ; must create a gap
                                    201 ; at insertion point  
      00878C 1E 01            [ 2]  202 	ldw x,(DEST,sp)
      00878E 16 07            [ 2]  203 	ldw y,(LLEN,sp)
      008790 CD 87 0E         [ 4]  204 	call create_gap
      008793 20 06            [ 2]  205 	jra 5$
      008795                        206 4$: 
      008795 72 FB 07         [ 2]  207 	addw x,(LLEN,sp)
      008798 CF 00 1C         [ 2]  208 	ldw txtend,x 	 
                                    209 ; move new line in gap 
      00879B 1E 07            [ 2]  210 5$:	ldw x,(LLEN,sp)
      00879D CF 00 0D         [ 2]  211 	ldw acc16,x 
      0087A0 90 AE 16 E0      [ 2]  212 	ldw y,#pad ;SRC 
      0087A4 1E 01            [ 2]  213 	ldw x,(DEST,sp) ; dest address 
      0087A6 CD 8E C1         [ 4]  214 	call move 
      0087A9                        215 insert_ln_exit:	
      000729                        216 	_drop VSIZE
      0087A9 5B 08            [ 2]    1     addw sp,#VSIZE 
      0087AB 81               [ 4]  217 	ret
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
      0087AC                        233 parse_quote: 
      00072C                        234 	_vars VSIZE 
      0087AC 52 02            [ 2]    1     sub sp,#VSIZE 
      0087AE 4F               [ 1]  235 	clr a
      0087AF 6B 01            [ 1]  236 1$:	ld (PREV,sp),a 
      0087B1                        237 2$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0087B1 91 D6 01         [ 4]  238 	ld a,([in.w],y)
      0087B4 27 24            [ 1]  239 	jreq 6$
      0087B6 72 5C 00 02      [ 1]  240 	inc in 
      0087BA 6B 02            [ 1]  241 	ld (CURR,sp),a 
      0087BC A6 5C            [ 1]  242 	ld a,#'\
      0087BE 11 01            [ 1]  243 	cp a, (PREV,sp)
      0087C0 26 0A            [ 1]  244 	jrne 3$
      0087C2 0F 01            [ 1]  245 	clr (PREV,sp)
      0087C4 7B 02            [ 1]  246 	ld a,(CURR,sp)
      0087C6 AD 1C            [ 4]  247 	callr convert_escape
      0087C8 F7               [ 1]  248 	ld (x),a 
      0087C9 5C               [ 1]  249 	incw x 
      0087CA 20 E5            [ 2]  250 	jra 2$
      0087CC                        251 3$:
      0087CC 7B 02            [ 1]  252 	ld a,(CURR,sp)
      0087CE A1 5C            [ 1]  253 	cp a,#'\'
      0087D0 27 DD            [ 1]  254 	jreq 1$
      0087D2 A1 22            [ 1]  255 	cp a,#'"
      0087D4 27 04            [ 1]  256 	jreq 6$ 
      0087D6 F7               [ 1]  257 	ld (x),a 
      0087D7 5C               [ 1]  258 	incw x 
      0087D8 20 D7            [ 2]  259 	jra 2$
      0087DA                        260 6$:
      0087DA 7F               [ 1]  261 	clr (x)
      0087DB 5C               [ 1]  262 	incw x 
      0087DC 90 93            [ 1]  263 	ldw y,x 
      0087DE 5F               [ 1]  264 	clrw x 
      0087DF A6 02            [ 1]  265 	ld a,#TK_QSTR  
      000761                        266 	_drop VSIZE
      0087E1 5B 02            [ 2]    1     addw sp,#VSIZE 
      0087E3 81               [ 4]  267 	ret 
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
      0087E4                        278 convert_escape:
      0087E4 89               [ 2]  279 	pushw x 
      0087E5 AE 87 F9         [ 2]  280 	ldw x,#escaped 
      0087E8 F1               [ 1]  281 1$:	cp a,(x)
      0087E9 27 06            [ 1]  282 	jreq 2$
      0087EB 7D               [ 1]  283 	tnz (x)
      0087EC 27 09            [ 1]  284 	jreq 3$
      0087EE 5C               [ 1]  285 	incw x 
      0087EF 20 F7            [ 2]  286 	jra 1$
      0087F1 1D 87 F9         [ 2]  287 2$: subw x,#escaped 
      0087F4 9F               [ 1]  288 	ld a,xl 
      0087F5 AB 07            [ 1]  289 	add a,#7
      0087F7 85               [ 2]  290 3$:	popw x 
      0087F8 81               [ 4]  291 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                                    292 
      0087F9 61 62 74 6E 76 66 72   293 escaped:: .asciz "abtnvfr"
             00
                                    294 
                                    295 ;-------------------------
                                    296 ; integer parser 
                                    297 ; input:
                                    298 ;   X 		point to output buffer  
                                    299 ;   Y 		point to tib 
                                    300 ;   A 	    first digit|'$' 
                                    301 ; output:  
                                    302 ;   X 		integer 
                                    303 ;   A 		TK_INTGR
                                    304 ;   acc24   24 bits integer 
                                    305 ;-------------------------
                           000001   306 	BASE=1
                           000002   307 	TCHAR=2 
                           000003   308 	XSAVE=3
                           000004   309 	VSIZE=4 
      008801                        310 parse_integer: ; { -- n }
      008801 89               [ 2]  311 	pushw x 	
      008802 4B 00            [ 1]  312 	push #0 ; TCHAR
      008804 4B 0A            [ 1]  313 	push #10 ; BASE=10
      008806 A1 24            [ 1]  314 	cp a,#'$
      008808 26 04            [ 1]  315 	jrne 2$ 
      00078A                        316     _drop #1
      00880A 5B 01            [ 2]    1     addw sp,##1 
      00880C 4B 10            [ 1]  317 	push #16  ; BASE=16
      00880E F7               [ 1]  318 2$:	ld (x),a 
      00880F 5C               [ 1]  319 	incw x 
      008810 91 D6 01         [ 4]  320 	ld a,([in.w],y)
      008813 72 5C 00 02      [ 1]  321 	inc in 
      008817 CD 94 75         [ 4]  322 	call to_upper 
      00881A 6B 02            [ 1]  323 	ld (TCHAR,sp),a 
      00881C CD 88 99         [ 4]  324 	call is_digit 
      00881F 25 ED            [ 1]  325 	jrc 2$
      008821 A6 10            [ 1]  326 	ld a,#16 
      008823 11 01            [ 1]  327 	cp a,(BASE,sp)
      008825 26 0A            [ 1]  328 	jrne 3$ 
      008827 7B 02            [ 1]  329 	ld a,(TCHAR,sp)
      008829 A1 41            [ 1]  330 	cp a,#'A 
      00882B 2B 04            [ 1]  331 	jrmi 3$ 
      00882D A1 47            [ 1]  332 	cp a,#'G 
      00882F 2B DD            [ 1]  333 	jrmi 2$ 
      008831 72 5A 00 02      [ 1]  334 3$: dec in 	
      008835 7F               [ 1]  335     clr (x)
      008836 1E 03            [ 2]  336 	ldw x,(XSAVE,sp)
      008838 CD 94 81         [ 4]  337 	call atoi24
      00883B 90 93            [ 1]  338 	ldw y,x 
      00883D CE 00 0D         [ 2]  339 	ldw x,acc16 
      008840 A6 84            [ 1]  340 	ld a,#TK_INTGR
      008842 90 FF            [ 2]  341 	ldw (y),x 
      008844 72 A9 00 02      [ 2]  342 	addw y,#2
      0007C8                        343 	_drop VSIZE  
      008848 5B 04            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      00884A 81               [ 4]  344 	ret 	
                                    345 
                                    346 ;-------------------------
                                    347 ; binary integer parser
                                    348 ; build integer in acc24  
                                    349 ; input:
                                    350 ;   X 		point to output buffer  
                                    351 ;   Y 		point to tib 
                                    352 ;   A 	    '&' 
                                    353 ; output:  
                                    354 ;   buffer  TK_INTGR integer  
                                    355 ;   X 		int16 
                                    356 ;   A 		TK_INTGR
                                    357 ;   acc24    int24 
                                    358 ;-------------------------
                           000001   359 	BINARY=1 ; 24 bits integer 
                           000003   360 	VSIZE=3
      00884B                        361 parse_binary: ; { -- n }
      00884B 4B 00            [ 1]  362 	push #0
      00884D 4B 00            [ 1]  363 	push #0
      00884F 4B 00            [ 1]  364 	push #0
      008851                        365 2$:	
      008851 91 D6 01         [ 4]  366 	ld a,([in.w],y)
      008854 72 5C 00 02      [ 1]  367 	inc in 
      008858 A1 30            [ 1]  368 	cp a,#'0 
      00885A 27 06            [ 1]  369 	jreq 3$
      00885C A1 31            [ 1]  370 	cp a,#'1 
      00885E 27 02            [ 1]  371 	jreq 3$ 
      008860 20 0B            [ 2]  372 	jra bin_exit 
      008862 A0 30            [ 1]  373 3$: sub a,#'0 
      008864 46               [ 1]  374 	rrc a
      008865 09 03            [ 1]  375 	rlc (BINARY+2,sp) 
      008867 09 02            [ 1]  376 	rlc (BINARY+1,sp)
      008869 09 01            [ 1]  377 	rlc (BINARY,sp) 
      00886B 20 E4            [ 2]  378 	jra 2$  
      00886D                        379 bin_exit:
      00886D 72 5A 00 02      [ 1]  380 	dec in 
      008871 90 93            [ 1]  381 	ldw y,x
      008873 7B 01            [ 1]  382 	ld a,(BINARY,sp)
      008875 C7 00 0C         [ 1]  383 	ld acc24,a 
      008878 1E 02            [ 2]  384 	ldw x,(BINARY+1,sp)
      00887A CF 00 0D         [ 2]  385 	ldw acc16,x
      00887D 90 FF            [ 2]  386 	ldw (y),x 
      00887F 72 A9 00 02      [ 2]  387 	addw y,#2  
      008883 A6 84            [ 1]  388 	ld a,#TK_INTGR 	
      000805                        389 	_drop VSIZE 
      008885 5B 03            [ 2]    1     addw sp,#VSIZE 
      008887 81               [ 4]  390 	ret
                                    391 
                                    392 ;-------------------------------------
                                    393 ; check if A is a letter 
                                    394 ; input:
                                    395 ;   A 			character to test 
                                    396 ; output:
                                    397 ;   C flag      1 true, 0 false 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                    398 ;-------------------------------------
      008888                        399 is_alpha::
      008888 A1 41            [ 1]  400 	cp a,#'A 
      00888A 8C               [ 1]  401 	ccf 
      00888B 24 0B            [ 1]  402 	jrnc 9$ 
      00888D A1 5B            [ 1]  403 	cp a,#'Z+1 
      00888F 25 07            [ 1]  404 	jrc 9$ 
      008891 A1 61            [ 1]  405 	cp a,#'a 
      008893 8C               [ 1]  406 	ccf 
      008894 24 02            [ 1]  407 	jrnc 9$
      008896 A1 7B            [ 1]  408 	cp a,#'z+1
      008898 81               [ 4]  409 9$: ret 	
                                    410 
                                    411 ;------------------------------------
                                    412 ; check if character in {'0'..'9'}
                                    413 ; input:
                                    414 ;    A  character to test
                                    415 ; output:
                                    416 ;    Carry  0 not digit | 1 digit
                                    417 ;------------------------------------
      008899                        418 is_digit::
      008899 A1 30            [ 1]  419 	cp a,#'0
      00889B 25 03            [ 1]  420 	jrc 1$
      00889D A1 3A            [ 1]  421     cp a,#'9+1
      00889F 8C               [ 1]  422 	ccf 
      0088A0 8C               [ 1]  423 1$:	ccf 
      0088A1 81               [ 4]  424     ret
                                    425 
                                    426 ;-------------------------------------
                                    427 ; return true if character in  A 
                                    428 ; is letter or digit.
                                    429 ; input:
                                    430 ;   A     ASCII character 
                                    431 ; output:
                                    432 ;   A     no change 
                                    433 ;   Carry    0 false| 1 true 
                                    434 ;--------------------------------------
      0088A2                        435 is_alnum::
      0088A2 CD 88 99         [ 4]  436 	call is_digit
      0088A5 25 03            [ 1]  437 	jrc 1$ 
      0088A7 CD 88 88         [ 4]  438 	call is_alpha
      0088AA 81               [ 4]  439 1$:	ret 
                                    440 
                                    441 ;-----------------------------
                                    442 ; check if character in A 
                                    443 ; is a valid symbol character 
                                    444 ; input:
                                    445 ;    A   character to validate
                                    446 ; output:
                                    447 ;    Carry   set if valid 
                                    448 ;----------------------------
      0088AB                        449 is_symbol_char: 
      0088AB A1 5F            [ 1]  450 	cp a,#'_ 
      0088AD 26 03            [ 1]  451 	jrne 1$
      0088AF 99               [ 1]  452 	scf 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      0088B0 20 03            [ 2]  453 	jra 9$ 
      0088B2 CD 88 88         [ 4]  454 1$:	call is_alpha 
      0088B5 81               [ 4]  455 9$: ret 
                                    456 
                                    457 ;---------------------------
                                    458 ;  when lexical unit begin 
                                    459 ;  with a letter a symbol 
                                    460 ;  is expected.
                                    461 ; input:
                                    462 ;   A   first character of symbol 
                                    463 ;	X   point to output buffer 
                                    464 ;   Y   point to input text 
                                    465 ; output:
                                    466 ;	X   after symbol 
                                    467 ;   Y   point after lexical unit 
                                    468 ;---------------------------
      0088B6                        469 parse_symbol:
      0088B6                        470 symb_loop: 
                                    471 ; symbol are converted to upper case 
      0088B6 CD 94 75         [ 4]  472 	call to_upper  
      0088B9 F7               [ 1]  473 	ld (x), a 
      0088BA 5C               [ 1]  474 	incw x
      0088BB 91 D6 01         [ 4]  475 	ld a,([in.w],y)
      0088BE 72 5C 00 02      [ 1]  476 	inc in 
      0088C2 CD 88 AB         [ 4]  477 	call is_symbol_char 
      0088C5 25 EF            [ 1]  478 	jrc symb_loop 
      0088C7 7F               [ 1]  479 	clr (x)
      0088C8 72 5A 00 02      [ 1]  480 	dec in  
      0088CC 81               [ 4]  481 	ret 
                                    482 
                                    483 ;-------------------------------
                                    484 ; compress a 6 letters 
                                    485 ; symbol to uint32 
                                    486 ; input:
                                    487 ;	X   *symbol 
                                    488 ;	SYMB,sp   stack reserved by caller 4 bytes  
                                    489 ; output: 
                                    490 ;   (SYMB,sp)  compressed symbol 
                                    491 ;-------------------------------
      0088CD                        492 	_argofs 0
                           000002     1     ARG_OFS=2+0 
      00084D                        493 	_arg SYMB,1
                           000003     1     SYMB=ARG_OFS+1 
      00084D                        494 compress_symbol:
      0088CD 35 06 00 0D      [ 1]  495 	mov acc16, #6 ; 6 letters maximum  
      0088D1                        496 0$: 
      0088D1 F6               [ 1]  497 	ld a,(x)
      0088D2 27 26            [ 1]  498 	jreq 8$ 
      0088D4 5C               [ 1]  499 	incw x 
      0088D5 B0 41            [ 1]  500 	sub a,'A' 
      0088D7 A1 5A            [ 1]  501 	cp a,#'Z' 
      0088D9 23 02            [ 2]  502 	jrule 1$
      0088DB A0 04            [ 1]  503 	sub a,#4
                                    504 ; SYMB*32+a
      0088DD 35 05 00 0E      [ 1]  505 1$: mov acc8,#5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      0088E1 8C               [ 1]  506 2$:	ccf
      0088E2 09 06            [ 1]  507 	rlc (SYMB+3,sp) 
      0088E4 09 05            [ 1]  508 	rlc (SYMB+2,sp) 
      0088E6 09 04            [ 1]  509 	rlc (SYMB+1,sp)
      0088E8 09 03            [ 1]  510 	rlc (SYMB,sp)
      0088EA 72 5A 00 0E      [ 1]  511 	dec acc8 
      0088EE 26 F1            [ 1]  512 	jrne 2$
      0088F0 1B 06            [ 1]  513 	add a,(SYMB+3,sp)
      0088F2 6B 06            [ 1]  514 	ld (SYMB+3,sp),a 
      0088F4 72 5A 00 0D      [ 1]  515 	dec acc16
      0088F8 26 D7            [ 1]  516 	jrne 0$ 
      0088FA                        517 8$:
      0088FA 81               [ 4]  518 	ret 
                                    519 
                                    520 
                                    521 ;---------------------------
                                    522 ;  token begin with a letter,
                                    523 ;  is keyword or variable. 	
                                    524 ; input:
                                    525 ;   X 		point to pad 
                                    526 ;   Y 		point to text
                                    527 ;   A 	    first letter  
                                    528 ; output:
                                    529 ;   X		exec_addr|var_addr 
                                    530 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC  
                                    531 ;   pad 	keyword|var_name  
                                    532 ;--------------------------  
                           000001   533 	XFIRST=1
                           000002   534 	VSIZE=2
      0088FB                        535 parse_keyword: 
      0088FB 89               [ 2]  536 	pushw x ; preserve *symbol 
      0088FC CD 88 B6         [ 4]  537 	call parse_symbol
      0088FF 1E 01            [ 2]  538 	ldw x,(XFIRST,sp) 
      008901 E6 01            [ 1]  539 	ld a,(1,x)
      008903 26 13            [ 1]  540 	jrne 2$
                                    541 ; one letter variable name 
      008905 F6               [ 1]  542 	ld a,(x) 
      008906 A0 41            [ 1]  543 	sub a,#'A 
      008908 48               [ 1]  544 	sll a 
      008909 88               [ 1]  545 	push a 
      00890A 4B 00            [ 1]  546 	push #0
      00890C AE 00 2F         [ 2]  547 	ldw x,#vars 
      00890F 72 FB 01         [ 2]  548 	addw x,(1,sp) ; X=var address 
      000892                        549 	_drop 2 
      008912 5B 02            [ 2]    1     addw sp,#2 
      008914 A6 85            [ 1]  550 	ld a,#TK_VAR 
      008916 20 2F            [ 2]  551 	jra 4$ 
      008918                        552 2$: ; check for keyword, otherwise syntax error.
      000898                        553 	_ldx_dict kword_dict ; dictionary entry point
      008918 AE AA D3         [ 2]    1     ldw x,#kword_dict+2
      00891B 16 01            [ 2]  554 	ldw y,(XFIRST,sp) ; name to search for
      00891D CD 96 68         [ 4]  555 	call search_dict
      008920 4D               [ 1]  556 	tnz a
      008921 26 24            [ 1]  557 	jrne 4$ 
                                    558 ; not in dictionary
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                    559 ; compile it as TK_LABEL
      008923 1E 01            [ 2]  560     ldw x,(XFIRST,sp)
      008925 90 5F            [ 1]  561 	clrw y 
      008927 90 89            [ 2]  562 	pushw y 
      008929 90 89            [ 2]  563 	pushw y  
      00892B CD 88 CD         [ 4]  564 	call compress_symbol
      00892E 16 05            [ 2]  565 	ldw y,(XFIRST+4,sp)
      008930 A6 01            [ 1]  566 	ld a,#TK_LABEL 
      008932 90 F7            [ 1]  567 	ld (y),a 
      008934 90 5C            [ 1]  568 	incw y
      008936 35 04 00 0E      [ 1]  569 	mov acc8,#4  
      00893A                        570 3$:	
      00893A 84               [ 1]  571 	pop a 
      00893B 90 F7            [ 1]  572 	ld (y),a 
      00893D 90 5C            [ 1]  573 	incw y 
      00893F 72 5A 00 0E      [ 1]  574 	dec acc8 
      008943 26 F5            [ 1]  575 	jrne 3$ 
      008945 20 11            [ 2]  576 	jra 5$ 
      008947                        577 4$:	
      008947 16 01            [ 2]  578 	ldw y,(XFIRST,sp)
      008949 A3 00 50         [ 2]  579 	cpw x,#LET_IDX 
      00894C 27 0A            [ 1]  580 	jreq 5$  ; don't compile LET command 
      00894E 90 F7            [ 1]  581 	ld (y),a 
      008950 90 5C            [ 1]  582 	incw y 
      008952 90 FF            [ 2]  583 	ldw (y),x
      008954 72 A9 00 02      [ 2]  584 	addw y,#2  
      0008D8                        585 5$:	_drop VSIZE 
      008958 5B 02            [ 2]    1     addw sp,#VSIZE 
      00895A 81               [ 4]  586 	ret  	
                                    587 
                                    588 ;------------------------------------
                                    589 ; skip character c in text starting from 'in'
                                    590 ; input:
                                    591 ;	 y 		point to text buffer
                                    592 ;    a 		character to skip
                                    593 ; output:  
                                    594 ;	'in' ajusted to new position
                                    595 ;------------------------------------
                           000001   596 	C = 1 ; local var
      00895B                        597 skip:
      00895B 88               [ 1]  598 	push a
      00895C 91 D6 01         [ 4]  599 1$:	ld a,([in.w],y)
      00895F 27 0A            [ 1]  600 	jreq 2$
      008961 11 01            [ 1]  601 	cp a,(C,sp)
      008963 26 06            [ 1]  602 	jrne 2$
      008965 72 5C 00 02      [ 1]  603 	inc in
      008969 20 F1            [ 2]  604 	jra 1$
      0008EB                        605 2$: _drop 1 
      00896B 5B 01            [ 2]    1     addw sp,#1 
      00896D 81               [ 4]  606 	ret
                                    607 	
                                    608 
                                    609 ;------------------------------------
                                    610 ; scan text for next token
                                    611 ; input: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                    612 ;	X 		pointer to buffer where 
                                    613 ;	        token id and value are copied 
                                    614 ; use:
                                    615 ;	Y   pointer to text in tib 
                                    616 ; output:
                                    617 ;   A       token attribute 
                                    618 ;   X 		token value
                                    619 ;   Y       updated position in output buffer   
                                    620 ;------------------------------------
                                    621 	; use to check special character 
                                    622 	.macro _case c t  
                                    623 	ld a,#c 
                                    624 	cp a,(TCHAR,sp) 
                                    625 	jrne t
                                    626 	.endm 
                                    627 
                           000001   628 	TCHAR=1
                           000002   629 	ATTRIB=2
                           000002   630 	VSIZE=2
      00896E                        631 get_token:: 
      0008EE                        632 	_vars VSIZE
      00896E 52 02            [ 2]    1     sub sp,#VSIZE 
                                    633 ;	ld a,in 
                                    634 ;	sub a,count
                                    635 ;   jrmi 0$
                                    636 ;	clr a 
                                    637 ;	ret 
      008970                        638 0$: 
      008970 90 AE 16 90      [ 2]  639 	ldw y,#tib    	
      008974 A6 20            [ 1]  640 	ld a,#SPACE
      008976 CD 89 5B         [ 4]  641 	call skip
      008979 55 00 02 00 03   [ 1]  642 	mov in.saved,in 
      00897E 91 D6 01         [ 4]  643 	ld a,([in.w],y)
      008981 26 05            [ 1]  644 	jrne 1$
      008983 90 93            [ 1]  645 	ldw y,x 
      008985 CC 8B 2A         [ 2]  646 	jp token_exit ; end of line 
      008988 72 5C 00 02      [ 1]  647 1$:	inc in 
      00898C CD 94 75         [ 4]  648 	call to_upper 
      00898F 6B 01            [ 1]  649 	ld (TCHAR,sp),a 
                                    650 ; check for quoted string
      008991                        651 str_tst:  	
      000911                        652 	_case '"' nbr_tst
      008991 A6 22            [ 1]    1 	ld a,#'"' 
      008993 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008995 26 0A            [ 1]    3 	jrne nbr_tst
      008997 A6 02            [ 1]  653 	ld a,#TK_QSTR
      008999 F7               [ 1]  654 	ld (x),a 
      00899A 5C               [ 1]  655 	incw x 
      00899B CD 87 AC         [ 4]  656 	call parse_quote
      00899E CC 8B 2A         [ 2]  657 	jp token_exit
      0089A1                        658 nbr_tst:
                                    659 ; check for hexadecimal number 
      0089A1 A6 24            [ 1]  660 	ld a,#'$'
      0089A3 11 01            [ 1]  661 	cp a,(TCHAR,sp) 
      0089A5 27 17            [ 1]  662 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                    663 ;check for binary number 
      0089A7 A6 26            [ 1]  664 	ld a,#'&
      0089A9 11 01            [ 1]  665 	cp a,(TCHAR,sp)
      0089AB 26 0A            [ 1]  666 	jrne 0$
      0089AD A6 84            [ 1]  667 	ld a,#TK_INTGR
      0089AF F7               [ 1]  668 	ld (x),a 
      0089B0 5C               [ 1]  669 	incw x 
      0089B1 CD 88 4B         [ 4]  670 	call parse_binary ; expect binary integer 
      0089B4 CC 8B 2A         [ 2]  671 	jp token_exit 
                                    672 ; check for decimal number 	
      0089B7 7B 01            [ 1]  673 0$:	ld a,(TCHAR,sp)
      0089B9 CD 88 99         [ 4]  674 	call is_digit
      0089BC 24 0C            [ 1]  675 	jrnc 3$
      0089BE A6 84            [ 1]  676 1$:	ld a,#TK_INTGR 
      0089C0 F7               [ 1]  677 	ld (x),a 
      0089C1 5C               [ 1]  678 	incw x 
      0089C2 7B 01            [ 1]  679 	ld a,(TCHAR,sp)
      0089C4 CD 88 01         [ 4]  680 	call parse_integer 
      0089C7 CC 8B 2A         [ 2]  681 	jp token_exit 
      0089CA                        682 3$: 
      00094A                        683 	_case '(' bkslsh_tst 
      0089CA A6 28            [ 1]    1 	ld a,#'(' 
      0089CC 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0089CE 26 05            [ 1]    3 	jrne bkslsh_tst
      0089D0 A6 07            [ 1]  684 	ld a,#TK_LPAREN
      0089D2 CC 8B 26         [ 2]  685 	jp token_char   	
      0089D5                        686 bkslsh_tst: ; character token 
      000955                        687 	_case '\',rparnt_tst
      0089D5 A6 5C            [ 1]    1 	ld a,#'\' 
      0089D7 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0089D9 26 16            [ 1]    3 	jrne rparnt_tst
      0089DB A6 03            [ 1]  688 	ld a,#TK_CHAR 
      0089DD F7               [ 1]  689 	ld (x),a 
      0089DE 5C               [ 1]  690 	incw x 
      0089DF 91 D6 01         [ 4]  691 	ld a,([in.w],y)
      0089E2 F7               [ 1]  692 	ld (x),a 
      0089E3 5C               [ 1]  693 	incw x
      0089E4 90 93            [ 1]  694 	ldw y,x 	 
      0089E6 72 5C 00 02      [ 1]  695 	inc in  
      0089EA 5F               [ 1]  696 	clrw x 
      0089EB 97               [ 1]  697 	ld xl,a 
      0089EC A6 03            [ 1]  698 	ld a,#TK_CHAR 
      0089EE CC 8B 2A         [ 2]  699 	jp token_exit 
      0089F1                        700 rparnt_tst:		
      000971                        701 	_case ')' colon_tst 
      0089F1 A6 29            [ 1]    1 	ld a,#')' 
      0089F3 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0089F5 26 05            [ 1]    3 	jrne colon_tst
      0089F7 A6 08            [ 1]  702 	ld a,#TK_RPAREN 
      0089F9 CC 8B 26         [ 2]  703 	jp token_char
      0089FC                        704 colon_tst:
      00097C                        705 	_case ':' comma_tst 
      0089FC A6 3A            [ 1]    1 	ld a,#':' 
      0089FE 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A00 26 05            [ 1]    3 	jrne comma_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      008A02 A6 0B            [ 1]  706 	ld a,#TK_COLON 
      008A04 CC 8B 26         [ 2]  707 	jp token_char  
      008A07                        708 comma_tst:
      000987                        709 	_case COMMA sharp_tst 
      008A07 A6 2C            [ 1]    1 	ld a,#COMMA 
      008A09 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A0B 26 05            [ 1]    3 	jrne sharp_tst
      008A0D A6 09            [ 1]  710 	ld a,#TK_COMMA
      008A0F CC 8B 26         [ 2]  711 	jp token_char
      008A12                        712 sharp_tst:
      000992                        713 	_case SHARP dash_tst 
      008A12 A6 23            [ 1]    1 	ld a,#SHARP 
      008A14 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A16 26 05            [ 1]    3 	jrne dash_tst
      008A18 A6 0A            [ 1]  714 	ld a,#TK_SHARP
      008A1A CC 8B 26         [ 2]  715 	jp token_char  	 	 
      008A1D                        716 dash_tst: 	
      00099D                        717 	_case '-' at_tst 
      008A1D A6 2D            [ 1]    1 	ld a,#'-' 
      008A1F 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A21 26 05            [ 1]    3 	jrne at_tst
      008A23 A6 11            [ 1]  718 	ld a,#TK_MINUS  
      008A25 CC 8B 26         [ 2]  719 	jp token_char 
      008A28                        720 at_tst:
      0009A8                        721 	_case '@' qmark_tst 
      008A28 A6 40            [ 1]    1 	ld a,#'@' 
      008A2A 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A2C 26 05            [ 1]    3 	jrne qmark_tst
      008A2E A6 06            [ 1]  722 	ld a,#TK_ARRAY 
      008A30 CC 8B 26         [ 2]  723 	jp token_char
      008A33                        724 qmark_tst:
      0009B3                        725 	_case '?' tick_tst 
      008A33 A6 3F            [ 1]    1 	ld a,#'?' 
      008A35 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A37 26 12            [ 1]    3 	jrne tick_tst
      008A39 A6 80            [ 1]  726 	ld a,#TK_CMD  
      008A3B F7               [ 1]  727 	ld (x),a 
      008A3C 5C               [ 1]  728 	incw x 
      008A3D 90 93            [ 1]  729 	ldw y,x 
      008A3F AE 00 72         [ 2]  730 	ldw x,#PRT_IDX 
      008A42 90 FF            [ 2]  731 	ldw (y),x 
      008A44 72 A9 00 02      [ 2]  732 	addw y,#2
      008A48 CC 8B 2A         [ 2]  733 	jp token_exit
      008A4B                        734 tick_tst: ; comment 
      0009CB                        735 	_case TICK plus_tst 
      008A4B A6 27            [ 1]    1 	ld a,#TICK 
      008A4D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A4F 26 35            [ 1]    3 	jrne plus_tst
      008A51 A6 80            [ 1]  736 	ld a,#TK_CMD
      008A53 F7               [ 1]  737 	ld (x),a 
      008A54 5C               [ 1]  738 	incw x
      008A55 90 AE 00 8C      [ 2]  739 	ldw y,#REM_IDX
      008A59 FF               [ 2]  740 	ldw (x),y 
      008A5A 1C 00 02         [ 2]  741 	addw x,#2  
      008A5D                        742 copy_comment:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      008A5D 90 AE 16 90      [ 2]  743 	ldw y,#tib 
      008A61 72 B9 00 01      [ 2]  744 	addw y,in.w
      008A65 90 89            [ 2]  745 	pushw y
      008A67 CD 8E B1         [ 4]  746 	call strcpy
      008A6A 72 F2 01         [ 2]  747     subw y,(1,sp)
      008A6D 90 9F            [ 1]  748 	ld a,yl 
      008A6F CB 00 02         [ 1]  749 	add a,in
      008A72 C7 00 02         [ 1]  750 	ld in,a 
      008A75 1F 01            [ 2]  751 	ldw (1,sp),x
      008A77 72 F9 01         [ 2]  752 	addw y,(1,sp)
      008A7A 90 5C            [ 1]  753 	incw y 
      0009FC                        754 	_drop 2 
      008A7C 5B 02            [ 2]    1     addw sp,#2 
      008A7E AE 00 8C         [ 2]  755 	ldw x,#REM_IDX 
      008A81 A6 80            [ 1]  756 	ld a,#TK_CMD 
      008A83 CC 8B 2A         [ 2]  757 	jp token_exit 
      008A86                        758 plus_tst:
      000A06                        759 	_case '+' star_tst 
      008A86 A6 2B            [ 1]    1 	ld a,#'+' 
      008A88 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A8A 26 05            [ 1]    3 	jrne star_tst
      008A8C A6 10            [ 1]  760 	ld a,#TK_PLUS  
      008A8E CC 8B 26         [ 2]  761 	jp token_char 
      008A91                        762 star_tst:
      000A11                        763 	_case '*' slash_tst 
      008A91 A6 2A            [ 1]    1 	ld a,#'*' 
      008A93 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A95 26 05            [ 1]    3 	jrne slash_tst
      008A97 A6 20            [ 1]  764 	ld a,#TK_MULT 
      008A99 CC 8B 26         [ 2]  765 	jp token_char 
      008A9C                        766 slash_tst: 
      000A1C                        767 	_case '/' prcnt_tst 
      008A9C A6 2F            [ 1]    1 	ld a,#'/' 
      008A9E 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008AA0 26 05            [ 1]    3 	jrne prcnt_tst
      008AA2 A6 21            [ 1]  768 	ld a,#TK_DIV 
      008AA4 CC 8B 26         [ 2]  769 	jp token_char 
      008AA7                        770 prcnt_tst:
      000A27                        771 	_case '%' eql_tst 
      008AA7 A6 25            [ 1]    1 	ld a,#'%' 
      008AA9 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008AAB 26 05            [ 1]    3 	jrne eql_tst
      008AAD A6 22            [ 1]  772 	ld a,#TK_MOD
      008AAF CC 8B 26         [ 2]  773 	jp token_char  
                                    774 ; 1 or 2 character tokens 	
      008AB2                        775 eql_tst:
      000A32                        776 	_case '=' gt_tst 		
      008AB2 A6 3D            [ 1]    1 	ld a,#'=' 
      008AB4 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008AB6 26 05            [ 1]    3 	jrne gt_tst
      008AB8 A6 32            [ 1]  777 	ld a,#TK_EQUAL
      008ABA CC 8B 26         [ 2]  778 	jp token_char 
      008ABD                        779 gt_tst:
      000A3D                        780 	_case '>' lt_tst 
      008ABD A6 3E            [ 1]    1 	ld a,#'>' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      008ABF 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008AC1 26 23            [ 1]    3 	jrne lt_tst
      008AC3 A6 31            [ 1]  781 	ld a,#TK_GT 
      008AC5 6B 02            [ 1]  782 	ld (ATTRIB,sp),a 
      008AC7 91 D6 01         [ 4]  783 	ld a,([in.w],y)
      008ACA 72 5C 00 02      [ 1]  784 	inc in 
      008ACE A1 3D            [ 1]  785 	cp a,#'=
      008AD0 26 04            [ 1]  786 	jrne 1$
      008AD2 A6 33            [ 1]  787 	ld a,#TK_GE 
      008AD4 20 50            [ 2]  788 	jra token_char  
      008AD6 A1 3C            [ 1]  789 1$: cp a,#'<
      008AD8 26 04            [ 1]  790 	jrne 2$
      008ADA A6 35            [ 1]  791 	ld a,#TK_NE 
      008ADC 20 48            [ 2]  792 	jra token_char 
      008ADE 72 5A 00 02      [ 1]  793 2$: dec in
      008AE2 7B 02            [ 1]  794 	ld a,(ATTRIB,sp)
      008AE4 20 40            [ 2]  795 	jra token_char 	 
      008AE6                        796 lt_tst:
      000A66                        797 	_case '<' other
      008AE6 A6 3C            [ 1]    1 	ld a,#'<' 
      008AE8 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008AEA 26 23            [ 1]    3 	jrne other
      008AEC A6 34            [ 1]  798 	ld a,#TK_LT 
      008AEE 6B 02            [ 1]  799 	ld (ATTRIB,sp),a 
      008AF0 91 D6 01         [ 4]  800 	ld a,([in.w],y)
      008AF3 72 5C 00 02      [ 1]  801 	inc in 
      008AF7 A1 3D            [ 1]  802 	cp a,#'=
      008AF9 26 04            [ 1]  803 	jrne 1$
      008AFB A6 36            [ 1]  804 	ld a,#TK_LE 
      008AFD 20 27            [ 2]  805 	jra token_char 
      008AFF A1 3E            [ 1]  806 1$: cp a,#'>
      008B01 26 04            [ 1]  807 	jrne 2$
      008B03 A6 35            [ 1]  808 	ld a,#TK_NE 
      008B05 20 1F            [ 2]  809 	jra token_char 
      008B07 72 5A 00 02      [ 1]  810 2$: dec in 
      008B0B 7B 02            [ 1]  811 	ld a,(ATTRIB,sp)
      008B0D 20 17            [ 2]  812 	jra token_char 	
      008B0F                        813 other: ; not a special character 	 
      008B0F 7B 01            [ 1]  814 	ld a,(TCHAR,sp)
      008B11 CD 88 88         [ 4]  815 	call is_alpha 
      008B14 25 03            [ 1]  816 	jrc 30$ 
      008B16 CC 92 1A         [ 2]  817 	jp syntax_error 
      008B19                        818 30$: 
      008B19 CD 88 FB         [ 4]  819 	call parse_keyword
      008B1C A3 9B 56         [ 2]  820 	cpw x,#remark 
      008B1F 26 09            [ 1]  821 	jrne token_exit 
      008B21 90 93            [ 1]  822 	ldw y,x 
      008B23 CC 8A 5D         [ 2]  823 	jp copy_comment 
      008B26                        824 token_char:
      008B26 F7               [ 1]  825 	ld (x),a 
      008B27 5C               [ 1]  826 	incw x
      008B28 90 93            [ 1]  827 	ldw y,x 
      008B2A                        828 token_exit:
      000AAA                        829 	_drop VSIZE 
      008B2A 5B 02            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      008B2C 81               [ 4]  830 	ret
                                    831 
                                    832 
                                    833 ;-----------------------------------
                                    834 ; create token list fromm text line 
                                    835 ; save this list in pad buffer 
                                    836 ;  compiled line format: 
                                    837 ;    line_no  2 bytes {0...32767}
                                    838 ;    count    1 byte  
                                    839 ;    tokens   variable length 
                                    840 ;   
                                    841 ; input:
                                    842 ;   none
                                    843 ; modified variables:
                                    844 ;   basicptr     token list buffer address 
                                    845 ;   in.w  		 3|count, i.e. index in buffer
                                    846 ;   count        length of line | 0  
                                    847 ;-----------------------------------
                           000001   848 	XSAVE=1
                           000002   849 	VSIZE=2
      008B2D                        850 compile::
      000AAD                        851 	_vars VSIZE 
      008B2D 52 02            [ 2]    1     sub sp,#VSIZE 
      008B2F 55 00 1A 00 05   [ 1]  852 	mov basicptr,txtbgn
      008B34 72 1A 00 21      [ 1]  853 	bset flags,#FCOMP 
      008B38 A6 00            [ 1]  854 	ld a,#0
      008B3A AE 00 00         [ 2]  855 	ldw x,#0
      008B3D CF 16 E0         [ 2]  856 	ldw pad,x ; destination buffer 
      008B40 C7 16 E2         [ 1]  857 	ld pad+2,a ; count 
      008B43 AE 16 E3         [ 2]  858 	ldw x,#pad+3
      008B46 72 5F 00 02      [ 1]  859 	clr in 
      008B4A CD 89 6E         [ 4]  860 	call get_token
      008B4D A1 84            [ 1]  861 	cp a,#TK_INTGR
      008B4F 26 11            [ 1]  862 	jrne 2$
      008B51 A3 00 01         [ 2]  863 	cpw x,#1 
      008B54 2A 05            [ 1]  864 	jrpl 1$
      008B56 A6 0A            [ 1]  865 	ld a,#ERR_BAD_VALUE
      008B58 CC 92 1C         [ 2]  866 	jp tb_error
      008B5B CF 16 E0         [ 2]  867 1$:	ldw pad,x 
      008B5E 90 AE 16 E3      [ 2]  868 	ldw y,#pad+3 
      008B62 90 A3 17 60      [ 2]  869 2$:	cpw y,#stack_full 
      008B66 25 05            [ 1]  870 	jrult 3$
      008B68 A6 0F            [ 1]  871 	ld a,#ERR_BUF_FULL 
      008B6A CC 92 1C         [ 2]  872 	jp tb_error 
      008B6D                        873 3$:	
      008B6D 93               [ 1]  874 	ldw x,y 
      008B6E CD 89 6E         [ 4]  875 	call get_token 
      008B71 A1 00            [ 1]  876 	cp a,#TK_NONE 
      008B73 26 ED            [ 1]  877 	jrne 2$ 
                                    878 ; compilation completed  
      008B75 72 A2 16 E0      [ 2]  879 	subw y,#pad
      008B79 90 9F            [ 1]  880     ld a,yl
      008B7B AE 16 E0         [ 2]  881 	ldw x,#pad 
      008B7E CF 00 18         [ 2]  882 	ldw ptr16,x 
      008B81 E7 02            [ 1]  883 	ld (2,x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      008B83 FE               [ 2]  884 	ldw x,(x)
      008B84 27 09            [ 1]  885 	jreq 10$
      008B86 CD 87 3A         [ 4]  886 	call insert_line
      008B89 72 5F 00 04      [ 1]  887 	clr  count 
      008B8D 20 0F            [ 2]  888 	jra  11$ 
      008B8F                        889 10$: ; line# is zero 
      008B8F CE 00 18         [ 2]  890 	ldw x,ptr16  
      008B92 CF 00 05         [ 2]  891 	ldw basicptr,x 
      008B95 E6 02            [ 1]  892 	ld a,(2,x)
      008B97 C7 00 04         [ 1]  893 	ld count,a 
      008B9A 35 03 00 02      [ 1]  894 	mov in,#3 
      008B9E                        895 11$:
      000B1E                        896 	_drop VSIZE 
      008B9E 5B 02            [ 2]    1     addw sp,#VSIZE 
      008BA0 72 1B 00 21      [ 1]  897 	bres flags,#FCOMP 
      008BA4 81               [ 4]  898 	ret 
                                    899 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                     27     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000000     5 SEPARATE=0 ; set to 1 for 'make separate' 
                                      6 
                                      7 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
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
      008BA5                         48 cpy_cmd_name:
      008BA5 F6               [ 1]   49 	ld a,(x)
      008BA6 5C               [ 1]   50 	incw x
      008BA7 A4 0F            [ 1]   51 	and a,#15  
      008BA9 88               [ 1]   52 	push a 
      008BAA 0D 01            [ 1]   53     tnz (1,sp) 
      008BAC 27 0A            [ 1]   54 	jreq 9$
      008BAE F6               [ 1]   55 1$:	ld a,(x)
      008BAF 90 F7            [ 1]   56 	ld (y),a  
      008BB1 5C               [ 1]   57 	incw x
      008BB2 90 5C            [ 1]   58 	incw y 
      008BB4 0A 01            [ 1]   59 	dec (1,sp)	 
      008BB6 26 F6            [ 1]   60 	jrne 1$
      008BB8 84               [ 1]   61 9$: pop a 
      008BB9 81               [ 4]   62 	ret	
                                     63 
                                     64 ;--------------------------
                                     65 ; add a space after letter or 
                                     66 ; digit.
                                     67 ; input:
                                     68 ;   Y     pointer to buffer 
                                     69 ; output:
                                     70 ;   Y    moved to end 
                                     71 ;--------------------------
      008BBA                         72 add_space:
      008BBA 90 5A            [ 2]   73 	decw y 
      008BBC 90 F6            [ 1]   74 	ld a,(y)
      008BBE 90 5C            [ 1]   75 	incw y
      008BC0 CD 88 A2         [ 4]   76 	call is_alnum 
      008BC3 24 06            [ 1]   77 	jrnc 1$
      008BC5 A6 20            [ 1]   78 	ld a,#SPACE 
      008BC7 90 F7            [ 1]   79 	ld (y),a 
      008BC9 90 5C            [ 1]   80 	incw y 
      008BCB 81               [ 4]   81 1$: ret 
                                     82 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                     83 ;--------------------------
                                     84 ;  align text in buffer 
                                     85 ;  to tab_width padding 
                                     86 ;  left with  SPACE 
                                     87 ; input:
                                     88 ;   X      str*
                                     89 ;   A      str_length 
                                     90 ; output:
                                     91 ;   X      ajusted
                                     92 ;--------------------------
      008BCC                         93 right_align::
      008BCC 88               [ 1]   94 	push a 
      008BCD 7B 01            [ 1]   95 0$: ld a,(1,sp)
      008BCF C1 00 22         [ 1]   96 	cp a,tab_width 
      008BD2 2A 08            [ 1]   97 	jrpl 1$
      008BD4 A6 20            [ 1]   98 	ld a,#SPACE 
      008BD6 5A               [ 2]   99 	decw x
      008BD7 F7               [ 1]  100 	ld (x),a  
      008BD8 0C 01            [ 1]  101 	inc (1,sp)
      008BDA 20 F1            [ 2]  102 	jra 0$ 
      008BDC 84               [ 1]  103 1$: pop a 	
      008BDD 81               [ 4]  104 	ret 
                                    105 
                                    106 ;--------------------------
                                    107 ; print TK_QSTR
                                    108 ; converting control character
                                    109 ; to backslash sequence
                                    110 ; input:
                                    111 ;   X        char *
                                    112 ;   Y        dest. buffer 
                                    113 ; output:
                                    114 ;   X        moved forward 
                                    115 ;   Y        moved forward 
                                    116 ;-----------------------------
      008BDE                        117 cpy_quote:
      008BDE A6 22            [ 1]  118 	ld a,#'"
      008BE0 90 F7            [ 1]  119 	ld (y),a 
      008BE2 90 5C            [ 1]  120 	incw y 
      008BE4 F6               [ 1]  121 1$:	ld a,(x)
      008BE5 27 30            [ 1]  122 	jreq 9$
      008BE7 5C               [ 1]  123 	incw x 
      008BE8 A1 20            [ 1]  124 	cp a,#SPACE 
      008BEA 25 0E            [ 1]  125 	jrult 3$
      008BEC 90 F7            [ 1]  126 	ld (y),a
      008BEE 90 5C            [ 1]  127 	incw y 
      008BF0 A1 5C            [ 1]  128 	cp a,#'\ 
      008BF2 26 F0            [ 1]  129 	jrne 1$ 
      008BF4                        130 2$:
      008BF4 90 F7            [ 1]  131 	ld (y),a
      008BF6 90 5C            [ 1]  132 	incw y  
      008BF8 20 EA            [ 2]  133 	jra 1$
      008BFA 88               [ 1]  134 3$: push a 
      008BFB A6 5C            [ 1]  135 	ld a,#'\
      008BFD 90 F7            [ 1]  136 	ld (y),a 
      008BFF 90 5C            [ 1]  137 	incw y  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      008C01 84               [ 1]  138 	pop a 
      008C02 A0 07            [ 1]  139 	sub a,#7
      008C04 C7 00 0E         [ 1]  140 	ld acc8,a 
      008C07 72 5F 00 0D      [ 1]  141 	clr acc16
      008C0B 89               [ 2]  142 	pushw x
      008C0C AE 87 F9         [ 2]  143 	ldw x,#escaped 
      008C0F 72 BB 00 0D      [ 2]  144 	addw x,acc16 
      008C13 F6               [ 1]  145 	ld a,(x)
      008C14 85               [ 2]  146 	popw x
      008C15 20 DD            [ 2]  147 	jra 2$
      008C17 A6 22            [ 1]  148 9$: ld a,#'"
      008C19 90 F7            [ 1]  149 	ld (y),a 
      008C1B 90 5C            [ 1]  150 	incw y  
      008C1D 5C               [ 1]  151 	incw x 
      008C1E 81               [ 4]  152 	ret
                                    153 
                                    154 ;--------------------------
                                    155 ; return variable name 
                                    156 ; from its address.
                                    157 ; input:
                                    158 ;   X    variable address
                                    159 ; output:
                                    160 ;   A     variable letter
                                    161 ;--------------------------
      008C1F                        162 var_name::
      008C1F 1D 00 2F         [ 2]  163 		subw x,#vars 
      008C22 9F               [ 1]  164 		ld a,xl 
      008C23 44               [ 1]  165 		srl a 
      008C24 AB 41            [ 1]  166 		add a,#'A 
      008C26 81               [ 4]  167 		ret 
                                    168 
                                    169 ;-----------------------------
                                    170 ; return cmd  idx from its 
                                    171 ; code address 
                                    172 ; input:
                                    173 ;   X      code address 
                                    174 ; output:
                                    175 ;   X      cmd_idx
                                    176 ;-----------------------------
      008C27                        177 get_cmd_idx:
      008C27 90 89            [ 2]  178 	pushw y
      008C29 90 AE AA D9      [ 2]  179 	ldw y,#code_addr 
      008C2D 90 CF 00 18      [ 2]  180 	ldw ptr16,y 
      008C31 90 5F            [ 1]  181 	clrw y 
      008C33 91 D3 18         [ 5]  182 1$:	cpw x,([ptr16],y)
      008C36 27 0C            [ 1]  183 	jreq 3$ 
      008C38 90 5C            [ 1]  184 	incw y 
      008C3A 91 D6 18         [ 4]  185 	ld a,([ptr16],y)
      008C3D 90 5C            [ 1]  186 	incw y
      008C3F 91 DA 18         [ 4]  187 	or a,([ptr16],y)	
      008C42 26 EF            [ 1]  188 	jrne 1$
      008C44 93               [ 1]  189 3$: ldw x,y 
      008C45 90 85            [ 2]  190 	popw y 
      008C47 81               [ 4]  191 	ret
                                    192 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                    193 ;-------------------------------------
                                    194 ; decompile tokens list 
                                    195 ; to original text line 
                                    196 ; input:
                                    197 ;   [basicptr]  pointer at line 
                                    198 ;   Y           destination buffer
                                    199 ; output:
                                    200 ;   A           length 
                                    201 ;   Y           after string  
                                    202 ;------------------------------------
                           000001   203 	BASE_SAV=1
                           000002   204 	WIDTH_SAV=2
                           000003   205 	STR=3
                           000004   206 	VSIZE=4 
      008C48                        207 decompile::
      000BC8                        208 	_vars VSIZE
      008C48 52 04            [ 2]    1     sub sp,#VSIZE 
      008C4A C6 00 0B         [ 1]  209 	ld a,base
      008C4D 6B 01            [ 1]  210 	ld (BASE_SAV,sp),a  
      008C4F C6 00 22         [ 1]  211 	ld a,tab_width 
      008C52 6B 02            [ 1]  212 	ld (WIDTH_SAV,sp),a 
      008C54 17 03            [ 2]  213 	ldw (STR,sp),y   
      008C56 72 CE 00 05      [ 5]  214 	ldw x,[basicptr] ; line number 
      008C5A 35 0A 00 0B      [ 1]  215 	mov base,#10
      008C5E 35 05 00 22      [ 1]  216 	mov tab_width,#5
      008C62 72 5F 00 0C      [ 1]  217 	clr acc24 
      008C66 CF 00 0D         [ 2]  218 	ldw acc16,x
      008C69 CD 93 85         [ 4]  219 	call itoa  
      008C6C CD 8B CC         [ 4]  220 	call right_align 
      008C6F 88               [ 1]  221 	push a 
      008C70 90 93            [ 1]  222 1$:	ldw y,x ; source
      008C72 1E 04            [ 2]  223 	ldw x,(STR+1,sp) ; destination
      008C74 CD 8E B1         [ 4]  224 	call strcpy 
      008C77 90 5F            [ 1]  225 	clrw y 
      008C79 84               [ 1]  226 	pop a 
      008C7A 90 97            [ 1]  227 	ld yl,a 
      008C7C 72 F9 03         [ 2]  228 	addw y,(STR,sp)
      008C7F A6 20            [ 1]  229 	ld a,#SPACE 
      008C81 90 F7            [ 1]  230 	ld (y),a 
      008C83 90 5C            [ 1]  231 	incw y 
      008C85 72 5F 00 22      [ 1]  232 	clr tab_width
      008C89 AE 00 03         [ 2]  233 	ldw x,#3
      008C8C CF 00 01         [ 2]  234 	ldw in.w,x 
      008C8F                        235 decomp_loop:
      008C8F 90 89            [ 2]  236 	pushw y
      008C91 CD 93 1B         [ 4]  237 	call next_token 
      008C94 90 85            [ 2]  238 	popw y 
      008C96 4D               [ 1]  239 	tnz a  
      008C97 26 03            [ 1]  240 	jrne 1$
      008C99 CC 8D 7B         [ 2]  241 	jp 20$
      008C9C 2A 75            [ 1]  242 1$:	jrpl 6$
                                    243 ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR
      008C9E A1 85            [ 1]  244 	cp a,#TK_VAR 
      008CA0 26 0C            [ 1]  245 	jrne 3$
                                    246 ;; TK_VAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      008CA2 CD 8B BA         [ 4]  247 	call add_space  
      008CA5 CD 8C 1F         [ 4]  248 	call var_name
      008CA8 90 F7            [ 1]  249 	ld (y),a 
      008CAA 90 5C            [ 1]  250 	incw y  
      008CAC 20 E1            [ 2]  251 	jra decomp_loop
      008CAE                        252 3$:
      008CAE A1 84            [ 1]  253 	cp a,#TK_INTGR
      008CB0 26 22            [ 1]  254 	jrne 4$
                                    255 ;; TK_INTGR
      008CB2 CD 8B BA         [ 4]  256 	call add_space
      008CB5 72 5F 00 0C      [ 1]  257 	clr acc24 
      008CB9 CF 00 0D         [ 2]  258 	ldw acc16,x 
      008CBC 90 89            [ 2]  259 	pushw y 
      008CBE CD 93 85         [ 4]  260 	call itoa  
      008CC1 16 01            [ 2]  261 	ldw y,(1,sp) 
      008CC3 88               [ 1]  262 	push a 
      008CC4 51               [ 1]  263 	exgw x,y 
      008CC5 CD 8E B1         [ 4]  264 	call strcpy 
      008CC8 90 5F            [ 1]  265 	clrw y
      008CCA 84               [ 1]  266 	pop a  
      008CCB 90 97            [ 1]  267 	ld yl,a 
      008CCD 72 F9 01         [ 2]  268 	addw y,(1,sp)
      000C50                        269 	_drop 2 
      008CD0 5B 02            [ 2]    1     addw sp,#2 
      008CD2 20 BB            [ 2]  270 	jra decomp_loop
                                    271 ;; dictionary keyword 
      008CD4                        272 4$:	
      008CD4 CD 8C 27         [ 4]  273 	call get_cmd_idx 
      008CD7 A3 00 8C         [ 2]  274 	cpw x,#REM_IDX
      008CDA 26 22            [ 1]  275 	jrne 5$
      008CDC CE 00 05         [ 2]  276 	ldw x,basicptr 
                                    277 ; copy comment to buffer 
      008CDF CD 8B BA         [ 4]  278 	call add_space
      008CE2 A6 27            [ 1]  279 	ld a,#''
      008CE4 90 F7            [ 1]  280 	ld (y),a 
      008CE6 90 5C            [ 1]  281 	incw y 
      008CE8                        282 41$:
      008CE8 72 D6 00 01      [ 4]  283 	ld a,([in.w],x)
      008CEC 72 5C 00 02      [ 1]  284 	inc in  
      008CF0 90 F7            [ 1]  285 	ld (y),a 
      008CF2 90 5C            [ 1]  286 	incw y 
      008CF4 C6 00 02         [ 1]  287 	ld a,in 
      008CF7 C1 00 04         [ 1]  288 	cp a,count 
      008CFA 2B EC            [ 1]  289 	jrmi 41$
      008CFC 20 7D            [ 2]  290 	jra 20$  
      008CFE A3 00 50         [ 2]  291 5$: cpw x,#LET_IDX 
      008D01 27 8C            [ 1]  292 	jreq decomp_loop ; down display LET 	
                                    293 ; insert command name 
      008D03 CD 8B BA         [ 4]  294 	call add_space  
      008D06 90 89            [ 2]  295 	pushw y
      008D08 CD 8D B6         [ 4]  296 	call cmd_name
      008D0B 90 85            [ 2]  297 	popw y 
      008D0D CD 8B A5         [ 4]  298 	call cpy_cmd_name
      008D10 CC 8C 8F         [ 2]  299 	jp decomp_loop 
      008D13                        300 6$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      008D13 A1 02            [ 1]  301 	cp a,#TK_QSTR 
      008D15 26 06            [ 1]  302 	jrne 7$
                                    303 ;; TK_QSTR
      008D17 CD 8B DE         [ 4]  304 	call cpy_quote  
      008D1A CC 8C 8F         [ 2]  305 	jp decomp_loop
      008D1D                        306 7$:
      008D1D A1 03            [ 1]  307 	cp a,#TK_CHAR 
      008D1F 26 0E            [ 1]  308 	jrne 8$
                                    309 ;; TK_CHAR 
      008D21 A6 5C            [ 1]  310 	ld a,#'\ 
      008D23 90 F7            [ 1]  311 	ld (y),a 
      008D25 90 5C            [ 1]  312 	incw y 
      008D27 9F               [ 1]  313 	ld a,xl 
      008D28 90 F7            [ 1]  314 	ld (y),a 
      008D2A 90 5C            [ 1]  315 	incw y 
      008D2C CC 8C 8F         [ 2]  316 	jp decomp_loop
      008D2F A1 0B            [ 1]  317 8$: cp a,#TK_COLON 
      008D31 26 09            [ 1]  318 	jrne 9$
      008D33 A6 3A            [ 1]  319 	ld a,#':
      008D35                        320 81$:
      008D35 90 F7            [ 1]  321 	ld (y),a 
      008D37 90 5C            [ 1]  322 	incw y 
      008D39                        323 82$:
      008D39 CC 8C 8F         [ 2]  324 	jp decomp_loop
      008D3C                        325 9$: 
      008D3C A1 0A            [ 1]  326 	cp a,#TK_SHARP
      008D3E 22 0A            [ 1]  327 	jrugt 10$ 
      008D40 A0 06            [ 1]  328 	sub a,#TK_ARRAY 
      008D42 5F               [ 1]  329 	clrw x 
      008D43 97               [ 1]  330 	ld xl,a
      008D44 1C 8D 91         [ 2]  331 	addw x,#single_char 
      008D47 F6               [ 1]  332 	ld a,(x)
      008D48 20 EB            [ 2]  333 	jra 81$ 
      008D4A                        334 10$: 
      008D4A A1 11            [ 1]  335 	cp a,#TK_MINUS 
      008D4C 22 0A            [ 1]  336 	jrugt 11$
      008D4E A0 10            [ 1]  337 	sub a,#TK_PLUS 
      008D50 5F               [ 1]  338 	clrw x 
      008D51 97               [ 1]  339 	ld xl,a 
      008D52 1C 8D 96         [ 2]  340 	addw x,#add_char 
      008D55 F6               [ 1]  341 	ld a,(x)
      008D56 20 DD            [ 2]  342 	jra 81$
      008D58                        343 11$:
      008D58 A1 22            [ 1]  344     cp a,#TK_MOD 
      008D5A 22 0A            [ 1]  345 	jrugt 12$
      008D5C A0 20            [ 1]  346 	sub a,#TK_MULT
      008D5E 5F               [ 1]  347 	clrw x 
      008D5F 97               [ 1]  348 	ld xl,a 
      008D60 1C 8D 98         [ 2]  349 	addw x,#mul_char
      008D63 F6               [ 1]  350 	ld a,(x)
      008D64 20 CF            [ 2]  351 	jra 81$
      008D66                        352 12$:
      008D66 A0 31            [ 1]  353 	sub a,#TK_GT  
      008D68 48               [ 1]  354 	sll a 
      008D69 5F               [ 1]  355 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      008D6A 97               [ 1]  356 	ld xl,a 
      008D6B 1C 8D 9B         [ 2]  357 	addw x,#relop_str 
      008D6E FE               [ 2]  358 	ldw x,(x)
      008D6F F6               [ 1]  359 	ld a,(x)
      008D70 5C               [ 1]  360 	incw x 
      008D71 90 F7            [ 1]  361 	ld (y),a
      008D73 90 5C            [ 1]  362 	incw y 
      008D75 F6               [ 1]  363 	ld a,(x)
      008D76 26 BD            [ 1]  364 	jrne 81$
      008D78 CC 8C 8F         [ 2]  365 	jp decomp_loop 
      008D7B                        366 20$: 
      008D7B 90 7F            [ 1]  367 	clr (y)
      008D7D 1E 03            [ 2]  368 	ldw x,(STR,sp)
      008D7F 7B 01            [ 1]  369 	ld a,(BASE_SAV,sp)
      008D81 C7 00 0B         [ 1]  370 	ld base,a 
      008D84 7B 02            [ 1]  371 	ld a,(WIDTH_SAV,sp)
      008D86 C7 00 22         [ 1]  372 	ld tab_width,a
      008D89 72 F2 03         [ 2]  373 	subw y,(STR,sp) 
      008D8C 90 9F            [ 1]  374 	ld a,yl 
      000D0E                        375 	_drop VSIZE 
      008D8E 5B 04            [ 2]    1     addw sp,#VSIZE 
      008D90 81               [ 4]  376 	ret 
                                    377 
      008D91 40 28 29 2C 23         378 single_char: .byte '@','(',')',',','#'
      008D96 2B 2D                  379 add_char: .byte '+','-'
      008D98 2A 2F 25               380 mul_char: .byte '*','/','%'
      008D9B 8D A7 8D A9 8D AB 8D   381 relop_str: .word gt,equal,ge,lt,le,ne 
             AE 8D B0 8D B3
      008DA7 3E 00                  382 gt: .asciz ">"
      008DA9 3D 00                  383 equal: .asciz "="
      008DAB 3E 3D 00               384 ge: .asciz ">="
      008DAE 3C 00                  385 lt: .asciz "<"
      008DB0 3C 3D 00               386 le: .asciz "<="
      008DB3 3C 3E 00               387 ne:  .asciz "<>"
                                    388 
                                    389 ;----------------------------------
                                    390 ; search in kword_dict name
                                    391 ; from its execution address 
                                    392 ; input:
                                    393 ;   X       	cmd_index 
                                    394 ; output:
                                    395 ;   X 			cstr*  | 0 
                                    396 ;--------------------------------
                           000001   397 	CMDX=1 
                           000003   398 	LINK=3 
                           000004   399 	VSIZE=4
      008DB6                        400 cmd_name:
      000D36                        401 	_vars VSIZE 
      008DB6 52 04            [ 2]    1     sub sp,#VSIZE 
      008DB8 72 5F 00 0D      [ 1]  402 	clr acc16 
      008DBC 1F 01            [ 2]  403 	ldw (CMDX,sp),x  
      008DBE AE AA D1         [ 2]  404 	ldw x,#kword_dict	
      008DC1 1F 03            [ 2]  405 1$:	ldw (LINK,sp),x
      008DC3 E6 02            [ 1]  406 	ld a,(2,x)
      008DC5 A4 0F            [ 1]  407 	and a,#15 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      008DC7 C7 00 0E         [ 1]  408 	ld acc8,a 
      008DCA 1C 00 03         [ 2]  409 	addw x,#3
      008DCD 72 BB 00 0D      [ 2]  410 	addw x,acc16
      008DD1 FE               [ 2]  411 	ldw x,(x) ; command index  
      008DD2 13 01            [ 2]  412 	cpw x,(CMDX,sp)
      008DD4 27 0A            [ 1]  413 	jreq 2$
      008DD6 1E 03            [ 2]  414 	ldw x,(LINK,sp)
      008DD8 FE               [ 2]  415 	ldw x,(x) 
      008DD9 1D 00 02         [ 2]  416 	subw x,#2  
      008DDC 26 E3            [ 1]  417 	jrne 1$
      008DDE 20 05            [ 2]  418 	jra 9$
      008DE0 1E 03            [ 2]  419 2$: ldw x,(LINK,sp)
      008DE2 1C 00 02         [ 2]  420 	addw x,#2 	
      000D65                        421 9$:	_drop VSIZE
      008DE5 5B 04            [ 2]    1     addw sp,#VSIZE 
      008DE7 81               [ 4]  422 	ret
                                    423 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
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
                                     26 
                                     27     .module STM8_TBI
                                     28 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                     29     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000000     5 SEPARATE=0 ; set to 1 for 'make separate' 
                                      6 
                                      7 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                     30 
                           000000    31 .if SEPARATE
                                     32 	.include "inc/nucleo_8s208.inc"
                                     33 	.include "inc/stm8s208.inc"
                                     34 	.include "inc/ascii.inc"
                                     35 	.include "inc/gen_macros.inc" 
                                     36 	.include "tbi_macros.inc" 
                                     37 .endif 
                                     38 
                                     39 ;--------------------------------------
                                     40     .area DATA 
                                     41 ;--------------------------------------	
                                     42 
      000001                         43 in.w::  .blkb 1 ; parser position in text line high-byte 
      000002                         44 in::    .blkb 1 ; low byte of in.w 
      000003                         45 in.saved:: .blkb 1 ; set by get_token before parsing next token, used by unget_token
      000004                         46 count:: .blkb 1 ; current BASIC line length and tib text length  
      000005                         47 basicptr::  .blkb 2  ; point to current BASIC line address.
      000007                         48 data_ptr:  .blkw 1  ; point to DATA address
      000009                         49 data_ofs:  .blkb 1  ; index to next data item 
      00000A                         50 data_len:  .blkb 1  ; length of data line 
      00000B                         51 base::  .blkb 1 ; nemeric base used to print integer 
      00000C                         52 acc24:: .blkb 1 ; 24 bit accumulator upper-byte 
      00000D                         53 acc16:: .blkb 1 ; 16 bit accumulator, acc24 high-byte
      00000E                         54 acc8::  .blkb 1 ;  8 bit accumulator, acc24 low-byte  
      00000F                         55 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
      000011                         56 timer:: .blkw 1 ;  milliseconds count down timer 
      000013                         57 seedx: .blkw 1  ; xorshift 16 seed x  used by RND() function 
      000015                         58 seedy: .blkw 1  ; xorshift 16 seed y  used by RND() funcion
      000017                         59 farptr: .blkb 1 ; 24 bits pointer used by file system, upper-byte
      000018                         60 ptr16::  .blkb 1 ; 16 bits pointer , farptr high-byte 
      000019                         61 ptr8:   .blkb 1 ; 8 bits pointer, farptr low-byte  
      00001A                         62 txtbgn:: .blkw 1 ; tokenized BASIC text beginning address 
      00001C                         63 txtend:: .blkw 1 ; tokenized BASIC text end address 
      00001E                         64 loop_depth: .blkb 1 ; level of nested loop. Conformity check   
      00001F                         65 array_size: .blkw 1 ; array size, free RAM left after BASIC code.  
      000021                         66 flags:: .blkb 1 ; various boolean flags
      000022                         67 tab_width:: .blkb 1 ; print colon width (default 6)
      000023                         68 rx1_queue: .ds RX_QUEUE_SIZE ; UART1 receive circular queue 
      00002B                         69 rx1_head:  .blkb 1 ; rx1_queue head pointer
      00002C                         70 rx1_tail:   .blkb 1 ; rx1_queue tail pointer  
      00002D                         71 free_eeprom: .blkw 1 ; start address of free eeprom 
                                     72 
                                     73 
      00002F                         74 vars:: .blkw 26 ; BASIC variables A-Z, keep it as but last .
                                     75 	.area BTXT (ABS)
      00007C                         76 	.org 0x7C  
                                     77 ; keep 'free_ram' as last variable 
                                     78 ; basic code compiled here. 
      00007C                         79 rsign: .blkw 1 ; "BC" 
      00007E                         80 rsize: .blkw 1 ; code size 	 
      000080                         81 free_ram: ; from here RAM free for BASIC text 
                                     82 
                                     83 	.area CODE 
                                     84 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                     85 ;----------------------
                                     86 ; print token id && value
                                     87 ; input:
                                     88 ;   A     token id 
                                     89 ;   X     token value 
                                     90 ;---------------------
                           000001    91 	BSAVE=1
                           000002    92 	AREG=2
                           000003    93 	XREG=3
                           000004    94 	VSIZE=4
      008DE8                         95 prt_tok:
      000D68                         96 	_vars VSIZE 
      008DE8 52 04            [ 2]    1     sub sp,#VSIZE 
      008DEA 6B 02            [ 1]   97 	ld (AREG,sp),a 
      008DEC 1F 03            [ 2]   98 	ldw (XREG,sp),x 
      008DEE C6 00 0B         [ 1]   99 	ld a, base
      008DF1 6B 01            [ 1]  100 	ld (BSAVE,sp),a 
      008DF3 35 10 00 0B      [ 1]  101 	mov base,#16  
      008DF7 AE 8E 1F         [ 2]  102 	ldw x,#token_msg
      008DFA CD 83 CE         [ 4]  103 	call puts 
      008DFD 5F               [ 1]  104 	clrw x 
      008DFE 7B 02            [ 1]  105 	ld a,(AREG,sp)
      008E00 97               [ 1]  106 	ld xl,a 
      008E01 CD 93 69         [ 4]  107 	call print_int 
      008E04 A6 20            [ 1]  108 	ld a,#SPACE
      008E06 CD 83 71         [ 4]  109 	call putc 
      008E09 1E 03            [ 2]  110 	ldw x,(XREG,sp)
      008E0B CD 93 69         [ 4]  111 	call print_int 
      008E0E A6 0D            [ 1]  112 	ld a,#CR 
      008E10 CD 83 71         [ 4]  113 	call putc 
      008E13 7B 01            [ 1]  114 	ld a,(BSAVE,sp)
      008E15 C7 00 0B         [ 1]  115 	ld base,a 
      008E18 7B 02            [ 1]  116 	ld a,(AREG,sp)
      008E1A 1E 03            [ 2]  117 	ldw x,(XREG,sp)
      000D9C                        118 	_drop VSIZE 
      008E1C 5B 04            [ 2]    1     addw sp,#VSIZE 
      008E1E 81               [ 4]  119 	ret 
      008E1F 74 6F 6B 65 6E 3A 20   120 token_msg: .asciz "token: "
             00
                                    121 
                                    122 
                                    123 ;---------------------
                                    124 ; display n bytes row 
                                    125 ; from memory.
                                    126 ; input:
                                    127 ;   A   bytes to print 
                                    128 ;	X   start address 
                                    129 ; output:
                                    130 ;   X   address after last shown  
                                    131 ;---------------------
                           000001   132 	CNT=1 
                           000002   133 	ADR=2 
                           000003   134 	VSIZE=3 
      008E27                        135 show_row:
      008E27 4D               [ 1]  136 	tnz a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      008E28 26 01            [ 1]  137 	jrne 1$
      008E2A 81               [ 4]  138 	ret 
      008E2B                        139 1$:	
      008E2B 89               [ 2]  140 	pushw x  
      008E2C 88               [ 1]  141 	push a 
      008E2D 35 04 00 22      [ 1]  142 	mov tab_width,#4 
      008E31 CD 93 69         [ 4]  143 	call print_int 
      008E34 A6 20            [ 1]  144 	ld a,#SPACE  
      008E36 CD 83 71         [ 4]  145 	call putc
      008E39                        146 row_loop:
      008E39 1E 02            [ 2]  147 	ldw x,(ADR,sp)
      008E3B F6               [ 1]  148 	ld a,(x)
      008E3C 5F               [ 1]  149 	clrw x 
      008E3D 97               [ 1]  150 	ld xl,a 
      008E3E CD 93 69         [ 4]  151 	call print_int 
      008E41 1E 02            [ 2]  152 	ldw x,(ADR,sp)
      008E43 5C               [ 1]  153 	incw x 
      008E44 1F 02            [ 2]  154 	ldw (ADR,sp),x 
      008E46 0A 01            [ 1]  155 	dec (CNT,sp)
      008E48 26 EF            [ 1]  156 	jrne row_loop
      000DCA                        157 	_drop VSIZE  		
      008E4A 5B 03            [ 2]    1     addw sp,#VSIZE 
      008E4C 35 04 00 22      [ 1]  158 	mov tab_width,#4
      008E50 A6 0D            [ 1]  159 	ld a,#CR 
      008E52 CD 83 71         [ 4]  160 	call putc 
      008E55 81               [ 4]  161 	ret 
                                    162 
                                    163 ;--------------------------
                                    164 ; print memory content 
                                    165 ; in hexadecimal format
                                    166 ;  input:
                                    167 ;    X    start address 
                                    168 ;    Y    count 
                                    169 ;--------------------------
                           000001   170 	BCNT=1
                           000003   171 	BASE=3
                           000004   172 	TABW=4
                           000004   173 	VSIZE=4   
      008E56                        174 hex_dump:
      008E56 88               [ 1]  175 	push a 
      000DD7                        176 	_vars VSIZE
      008E57 52 04            [ 2]    1     sub sp,#VSIZE 
      008E59 C6 00 0B         [ 1]  177 	ld a,base
      008E5C 6B 03            [ 1]  178 	ld (BASE,sp),a 
      008E5E 35 10 00 0B      [ 1]  179 	mov base,#16
      008E62 C6 00 22         [ 1]  180 	ld a,tab_width 
      008E65 6B 04            [ 1]  181 	ld (TABW,sp),a
      008E67 A6 0D            [ 1]  182 	ld a,#CR 
      008E69 CD 83 71         [ 4]  183 	call putc 
      008E6C 17 01            [ 2]  184 1$: ldw (BCNT,sp),y
      008E6E A6 10            [ 1]  185 	ld a,#16
      008E70 90 A3 00 10      [ 2]  186 	cpw y,#16
      008E74 2A 02            [ 1]  187 	jrpl 2$
      008E76 90 9F            [ 1]  188 	ld a,yl
      008E78                        189 2$: 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      008E78 CD 8E 27         [ 4]  190 	call show_row 
      008E7B 16 01            [ 2]  191 	ldw y,(BCNT,sp) 
      008E7D 72 A2 00 10      [ 2]  192 	subw y,#16 
      008E81 90 A3 00 01      [ 2]  193 	cpw y,#1
      008E85 2A E5            [ 1]  194 	jrpl 1$
      008E87 7B 03            [ 1]  195 	ld a,(BASE,sp)
      008E89 C7 00 0B         [ 1]  196 	ld base,a
      008E8C 7B 04            [ 1]  197 	ld a,(TABW,sp)
      008E8E C7 00 22         [ 1]  198 	ld tab_width,a 
      000E11                        199 	_drop VSIZE
      008E91 5B 04            [ 2]    1     addw sp,#VSIZE 
      008E93 84               [ 1]  200 	pop a 
      008E94 81               [ 4]  201 	ret 
                                    202 
                                    203 ;-------------------------------------
                                    204 ; retrun string length
                                    205 ; input:
                                    206 ;   X         .asciz  pointer 
                                    207 ; output:
                                    208 ;   X         not affected 
                                    209 ;   A         length 
                                    210 ;-------------------------------------
      008E95                        211 strlen::
      008E95 89               [ 2]  212 	pushw x 
      008E96 4F               [ 1]  213 	clr a
      008E97 7D               [ 1]  214 1$:	tnz (x) 
      008E98 27 04            [ 1]  215 	jreq 9$ 
      008E9A 4C               [ 1]  216 	inc a 
      008E9B 5C               [ 1]  217 	incw x 
      008E9C 20 F9            [ 2]  218 	jra 1$ 
      008E9E 85               [ 2]  219 9$:	popw x 
      008E9F 81               [ 4]  220 	ret 
                                    221 
                                    222 ;------------------------------------
                                    223 ; compare 2 strings
                                    224 ; input:
                                    225 ;   X 		char* first string 
                                    226 ;   Y       char* second string 
                                    227 ; output:
                                    228 ;   A 		0|1 
                                    229 ;-------------------------------------
      008EA0                        230 strcmp:
      008EA0 F6               [ 1]  231 	ld a,(x)
      008EA1 27 0B            [ 1]  232 	jreq 5$ 
      008EA3 90 F1            [ 1]  233 	cp a,(y) 
      008EA5 26 05            [ 1]  234 	jrne 4$ 
      008EA7 5C               [ 1]  235 	incw x 
      008EA8 90 5C            [ 1]  236 	incw y 
      008EAA 20 F4            [ 2]  237 	jra strcmp 
      008EAC                        238 4$: ; not same  
      008EAC 4F               [ 1]  239 	clr a 
      008EAD 81               [ 4]  240 	ret 
      008EAE                        241 5$: ; same 
      008EAE A6 01            [ 1]  242 	ld a,#1 
      008EB0 81               [ 4]  243 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                    244 
                                    245 
                                    246 ;---------------------------------------
                                    247 ;  copy src to dest 
                                    248 ; input:
                                    249 ;   X 		dest 
                                    250 ;   Y 		src 
                                    251 ; output: 
                                    252 ;   X 		dest 
                                    253 ;----------------------------------
      008EB1                        254 strcpy::
      008EB1 88               [ 1]  255 	push a 
      008EB2 89               [ 2]  256 	pushw x 
      008EB3 90 F6            [ 1]  257 1$: ld a,(y)
      008EB5 27 06            [ 1]  258 	jreq 9$ 
      008EB7 F7               [ 1]  259 	ld (x),a 
      008EB8 5C               [ 1]  260 	incw x 
      008EB9 90 5C            [ 1]  261 	incw y 
      008EBB 20 F6            [ 2]  262 	jra 1$ 
      008EBD 7F               [ 1]  263 9$:	clr (x)
      008EBE 85               [ 2]  264 	popw x 
      008EBF 84               [ 1]  265 	pop a 
      008EC0 81               [ 4]  266 	ret 
                                    267 
                                    268 ;---------------------------------------
                                    269 ; move memory block 
                                    270 ; input:
                                    271 ;   X 		destination 
                                    272 ;   Y 	    source 
                                    273 ;   acc16	bytes count 
                                    274 ; output:
                                    275 ;   none 
                                    276 ;--------------------------------------
                           000001   277 	INCR=1 ; increament high byte 
                           000002   278 	LB=2 ; increament low byte 
                           000002   279 	VSIZE=2
      008EC1                        280 move::
      008EC1 88               [ 1]  281 	push a 
      000E42                        282 	_vars VSIZE 
      008EC2 52 02            [ 2]    1     sub sp,#VSIZE 
      008EC4 0F 01            [ 1]  283 	clr (INCR,sp)
      008EC6 0F 02            [ 1]  284 	clr (LB,sp)
      008EC8 90 89            [ 2]  285 	pushw y 
      008ECA 13 01            [ 2]  286 	cpw x,(1,sp) ; compare DEST to SRC 
      008ECC 90 85            [ 2]  287 	popw y 
      008ECE 27 31            [ 1]  288 	jreq move_exit ; x==y 
      008ED0 2B 0E            [ 1]  289 	jrmi move_down
      008ED2                        290 move_up: ; start from top address with incr=-1
      008ED2 72 BB 00 0D      [ 2]  291 	addw x,acc16
      008ED6 72 B9 00 0D      [ 2]  292 	addw y,acc16
      008EDA 03 01            [ 1]  293 	cpl (INCR,sp)
      008EDC 03 02            [ 1]  294 	cpl (LB,sp)   ; increment = -1 
      008EDE 20 05            [ 2]  295 	jra move_loop  
      008EE0                        296 move_down: ; start from bottom address with incr=1 
      008EE0 5A               [ 2]  297     decw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      008EE1 90 5A            [ 2]  298 	decw y
      008EE3 0C 02            [ 1]  299 	inc (LB,sp) ; incr=1 
      008EE5                        300 move_loop:	
      008EE5 C6 00 0D         [ 1]  301     ld a, acc16 
      008EE8 CA 00 0E         [ 1]  302 	or a, acc8
      008EEB 27 14            [ 1]  303 	jreq move_exit 
      008EED 72 FB 01         [ 2]  304 	addw x,(INCR,sp)
      008EF0 72 F9 01         [ 2]  305 	addw y,(INCR,sp) 
      008EF3 90 F6            [ 1]  306 	ld a,(y)
      008EF5 F7               [ 1]  307 	ld (x),a 
      008EF6 89               [ 2]  308 	pushw x 
      008EF7 CE 00 0D         [ 2]  309 	ldw x,acc16 
      008EFA 5A               [ 2]  310 	decw x 
      008EFB CF 00 0D         [ 2]  311 	ldw acc16,x 
      008EFE 85               [ 2]  312 	popw x 
      008EFF 20 E4            [ 2]  313 	jra move_loop
      008F01                        314 move_exit:
      000E81                        315 	_drop VSIZE
      008F01 5B 02            [ 2]    1     addw sp,#VSIZE 
      008F03 84               [ 1]  316 	pop a 
      008F04 81               [ 4]  317 	ret 	
                                    318 
                                    319 ;------------------------------------
                                    320 ;  set all variables to zero 
                                    321 ; input:
                                    322 ;   none 
                                    323 ; output:
                                    324 ;	none
                                    325 ;------------------------------------
      008F05                        326 clear_vars:
      008F05 89               [ 2]  327 	pushw x 
      008F06 90 89            [ 2]  328 	pushw y 
      008F08 AE 00 2F         [ 2]  329 	ldw x,#vars 
      008F0B 90 AE 00 34      [ 2]  330 	ldw y,#2*26 
      008F0F 7F               [ 1]  331 1$:	clr (x)
      008F10 5C               [ 1]  332 	incw x 
      008F11 90 5A            [ 2]  333 	decw y 
      008F13 26 FA            [ 1]  334 	jrne 1$
      008F15 90 85            [ 2]  335 	popw y 
      008F17 85               [ 2]  336 	popw x 
      008F18 81               [ 4]  337 	ret 
                                    338 
                                    339 ;-------------------------------------
                                    340 ;  program initialization entry point 
                                    341 ;-------------------------------------
                           000002   342 	MAJOR=2
                           000000   343 	MINOR=0 
      008F19 0A 0A 54 69 6E 79 20   344 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal  32-Bits]



             32 30 32 32 0A 76 65
             72 73 69 6F 6E 20 00
      000EDF                        345 cold_start:
                                    346 ;set stack 
      008F52 30 32 32         [ 2]  347 	ldw x,#STACK_EMPTY
      008F55 0A               [ 1]  348 	ldw sp,x   
                                    349 ; clear all ram 
      008F56 76               [ 1]  350 0$: clr (x)
      008F57 65               [ 2]  351 	decw x 
      008F58 72 73            [ 1]  352 	jrne 0$
                                    353 ; activate pull up on all inputs 
      008F5A 69 6F            [ 1]  354 	ld a,#255 
      008F5C 6E 20 00         [ 1]  355 	ld PA_CR1,a 
      008F5F C7 50 08         [ 1]  356 	ld PB_CR1,a 
      008F5F AE 17 FF         [ 1]  357 	ld PC_CR1,a 
      008F62 94 7F 5A         [ 1]  358 	ld PD_CR1,a 
      008F65 26 FC A6         [ 1]  359 	ld PE_CR1,a 
      008F68 FF C7 50         [ 1]  360 	ld PF_CR1,a 
      008F6B 03 C7 50         [ 1]  361 	ld PG_CR1,a 
      008F6E 08 C7 50         [ 1]  362 	ld PI_CR1,a
                                    363 ; set LD2 pin as output 
      008F71 0D C7 50 12      [ 1]  364     bset PC_CR1,#LED2_BIT
      008F75 C7 50 17 C7      [ 1]  365     bset PC_CR2,#LED2_BIT
      008F79 50 1C C7 50      [ 1]  366     bset PC_DDR,#LED2_BIT
      008F7D 21 C7 50 2B      [ 1]  367 	bres PC_ODR,#LED2_BIT 
                                    368 ; disable schmitt triggers on Arduino CN4 analog inputs
      008F81 72 1A 50 0D 72   [ 1]  369 	mov ADC_TDRL,0x3f
                                    370 ; disable peripherals clocks
                                    371 ;	clr CLK_PCKENR1 
                                    372 ;	clr CLK_PCKENR2
      008F86 1A 50 0E 72      [ 1]  373 	clr AWU_TBR 
      008F8A 1A 50 0C 72      [ 1]  374 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                    375 ; select internal clock no divisor: 16 Mhz 	
      008F8E 1B 50            [ 1]  376 	ld a,#CLK_SWR_HSI 
      008F90 0A               [ 1]  377 	clrw x  
      008F91 55 00 3F         [ 4]  378     call clock_init 
      008F94 54 07 72         [ 4]  379 	call timer4_init
      008F97 5F 50 F2         [ 4]  380 	call timer2_init
                                    381 ; UART1 at 115200 BAUD
      008F9A 72 14 50         [ 4]  382 	call uart1_init
                                    383 ; activate PE_4 (user button interrupt)
      008F9D CA A6 E1 5F      [ 1]  384     bset PE_CR2,#USR_BTN_BIT 
                                    385 ; display system information
      008FA1 CD 80 F6         [ 2]  386 	ldw x,#software 
      008FA4 CD 81 19         [ 4]  387 	call puts 
      008FA7 CD 81            [ 1]  388 	ld a,#MAJOR 
      008FA9 0C CD 83         [ 1]  389 	ld acc8,a 
      008FAC 2C               [ 1]  390 	clrw x 
      008FAD 72 18 50         [ 2]  391 	ldw acc24,x
      008FB0 18 AE 8F 19      [ 1]  392 	clr tab_width  
      008FB4 CD 83 CE A6      [ 1]  393 	mov base, #10 
      008FB8 02 C7 00         [ 4]  394 	call prti24 
      008FBB 0E 5F            [ 1]  395 	ld a,#'.
      008FBD CF 00 0C         [ 4]  396 	call putc 
      008FC0 72 5F            [ 1]  397 	ld a,#MINOR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      008FC2 00 22 35         [ 1]  398 	ld acc8,a 
      008FC5 0A               [ 1]  399 	clrw x 
      008FC6 00 0B CD         [ 2]  400 	ldw acc24,x 
      008FC9 93 79 A6         [ 4]  401 	call prti24
      008FCC 2E CD            [ 1]  402 	ld a,#CR 
      008FCE 83 71 A6         [ 4]  403 	call putc
      008FD1 00               [ 1]  404 	rim 
      008FD2 C7 00 0E 5F      [ 1]  405 	inc seedy+1 
      008FD6 CF 00 0C CD      [ 1]  406 	inc seedx+1 
      008FDA 93 79 A6         [ 4]  407 	call clear_basic
      008FDD 0D CD 83         [ 4]  408 	call ubound 
      008FE0 71 9A 72         [ 4]  409 	call beep_1khz  
      000F73                        410 2$:	
      008FE3 5C 00 16         [ 4]  411 	call warm_init
                                    412 ; check for application in flash memory 
      008FE6 72 5C 00         [ 2]  413 	ldw x,app_sign 
      008FE9 14 CD 90         [ 2]  414 	cpw x,SIGNATURE 
      008FEC 82 CD            [ 1]  415 	jreq run_app
      008FEE 99 20 CD         [ 2]  416 	jp cmd_line
      000F81                        417 run_app:
                                    418 ; run application in FLASH|EEPROM 
      008FF1 9E 3E 82         [ 2]  419 	ldw x,app_size  
      008FF3 89               [ 2]  420 	pushw x 
      008FF3 CD 90 64         [ 2]  421 	ldw x,#app 
      008FF6 CE AC 00         [ 2]  422 	ldw txtbgn,x
      008FF9 C3 A0 C0         [ 2]  423 	ldw basicptr,x 
      008FFC 27 03 CC         [ 2]  424 	addw x,(1,sp) ; x+size 
      000F91                        425 	_drop 2 
      008FFF 92 A1            [ 2]    1     addw sp,#2 
      009001 CF 00 1B         [ 2]  426 	ldw txtend,x 
      009001 CE AC 02         [ 2]  427 	ldw x,#RUNNING 
      009004 89 AE AC         [ 4]  428 	call puts
      009007 04 CF 00         [ 2]  429 	ldw x,basicptr    
      00900A 1A CF 00 05      [ 1]  430 	mov base,#16 
      00900E 72 FB 01         [ 4]  431 	call print_int
      009011 5B 02 CF 00      [ 1]  432 	mov base,#10  
      009015 1C AE 90         [ 2]  433 	ldw x, basicptr 
      009018 42 CD            [ 1]  434 	ld a,(2,x)
      00901A 83 CE CE         [ 1]  435 	ld count,a 
      00901D 00 05 35 10      [ 1]  436 	mov in,#3 
      009021 00 0B CD 93      [ 1]  437 	bset flags,#FRUN
      009025 69 35 0A         [ 4]  438 	call ubound   
      009028 00 0B CE         [ 2]  439 	jp interpreter  
      00902B 00 05            [ 2]  440     jra .  
                                    441 
      00902D E6 02 C7 00 04 35 03   442 RUNNING: .asciz "\nrunning application at address: " 
             00 02 72 10 00 21 CD
             99 20 CC 92 BD 20 FE
             0A 72 75 6E 6E 69 6E
             67 20 61 70 70 6C
                                    443 
      000FE4                        444 warm_init:
      00904F 69 63 61 74      [ 1]  445 	clr flags 
      009053 69 6F 6E 20      [ 1]  446 	clr loop_depth 
      009057 61 74 20 61      [ 1]  447 	mov tab_width,#TAB_WIDTH 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      00905B 64 64 72 65      [ 1]  448 	mov base,#10 
      00905F 73 73 3A         [ 2]  449 	ldw x,#0 
      009062 20 00 04         [ 2]  450 	ldw basicptr,x 
      009064 CF 00 00         [ 2]  451 	ldw in.w,x 
      009064 72 5F 00 21      [ 1]  452 	clr count
      009068 72               [ 4]  453 	ret 
                                    454 
                                    455 
                                    456 ;---------------------------
                                    457 ; reset BASIC text variables 
                                    458 ; and clear variables 
                                    459 ;---------------------------
      001002                        460 clear_basic:
      009069 5F               [ 2]  461 	pushw x 
      00906A 00 1E 35 04      [ 1]  462 	clr count
      00906E 00 22 35 0A      [ 1]  463 	clr in  
      009072 00 0B AE         [ 2]  464 	ldw x,#free_ram 
      009075 00 00 CF         [ 2]  465 	ldw txtbgn,x 
      009078 00 05 CF         [ 2]  466 	ldw txtend,x 
      00907B 00 01 72         [ 4]  467 	call clear_vars 
      00907E 5F               [ 2]  468 	popw x
      00907F 00               [ 4]  469 	ret 
                                    470 
                                    471 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    472 ;;   Tiny BASIC error messages     ;;
                                    473 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001019                        474 err_msg:
      009080 04 81 10 39 10 46 10   475 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             54 10 6D 10 7C
      009082 10 92 10 A8 10 C2 10   476 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             D3 10 E4
      009082 89 72 5F 00 04 72 5F   477 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             00 02 AE
                                    478 
      00908C 00 80 CF 00 1A CF 00   479 err_mem_full: .asciz "Memory full\n" 
             1C CD 8F 05 85 81
      009099 73 79 6E 74 61 78 20   480 err_syntax: .asciz "syntax error\n" 
             65 72 72 6F 72 0A 00
      009099 00 00 90 B9 90 C6 90   481 err_math_ovf: .asciz "math operation overflow\n"
             D4 90 ED 90 FC 91 12
             91 28 91 42 91 53 91
             64 91 70 91
      0090B2 A3 91 B3 91 C7 91 DA   482 err_div0: .asciz "division by 0\n" 
             4D 65 6D 6F 72 79 20
             66
      0090C1 75 6C 6C 0A 00 73 79   483 err_no_line: .asciz "invalid line number.\n"
             6E 74 61 78 20 65 72
             72 6F 72 0A 00 6D 61
             74
      0090D7 68 20 6F 70 65 72 61   484 err_run_only: .asciz "run time only usage.\n" 
             74 69 6F 6E 20 6F 76
             65 72 66 6C 6F 77 0A
             00
      0090ED 64 69 76 69 73 69 6F   485 err_cmd_only: .asciz "command line only usage.\n"
             6E 20 62 79 20 30 0A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal  00-Bits]



             6E 6C 79 20 75 73 61
             67 65 2E 0A 00
      0090FC 69 6E 76 61 6C 69 64   486 err_duplicate: .asciz "duplicate name.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62
      00910D 65 72 2E 0A 00 72 75   487 err_not_file: .asciz "File not found.\n"
             6E 20 74 69 6D 65 20
             6F 6E 6C
      00911E 79 20 75 73 61 67 65   488 err_bad_value: .asciz "bad value.\n"
             2E 0A 00 63 6F
      00912A 6D 6D 61 6E 64 20 6C   489 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             69 6E 65 20 6F 6E 6C
             79 20 75 73 61 67 65
             2E 0A 00 64 75 70 6C
             69 63 61 74 65 20 6E
             61 6D 65 2E 0A 00 46
             69 6C 65 20 6E 6F 74
             20 66
      00915D 6F 75 6E 64 2E 0A 00   490 err_no_data: .asciz "No data found.\n"
             62 61 64 20 76 61 6C
             75 65
      00916D 2E 0A 00 46 69 6C 65   491 err_no_prog: .asciz "No program in RAM!\n"
             20 69 6E 20 65 78 74
             65 6E 64 65 64 20
      009181 6D 65 6D 6F 72 79 2C   492 err_no_fspace: .asciz "File system full.\n" 
             20 63 61 6E 27 74 20
             62 65 20 72 75
      009194 6E 20 66 72 6F 6D 20   493 err_buf_full: .asciz "Buffer full\n"
             74 68 65 72 65 2E
                                    494 
      0091A1 0A 00 4E 6F 20 64 61   495 rt_msg: .asciz "\nrun time error, "
             74 61 20 66 6F 75 6E
             64 2E 0A 00
      0091B3 4E 6F 20 70 72 6F 67   496 comp_msg: .asciz "\ncompile error, "
             72 61 6D 20 69 6E 20
             52 41 4D
      0091C4 21 0A 00 46 69 6C 65   497 tk_id: .asciz "last token id: "
             20 73 79 73 74 65 6D
             20 66
                                    498 
      00119A                        499 syntax_error::
      0091D4 75 6C            [ 1]  500 	ld a,#ERR_SYNTAX 
                                    501 
      00119C                        502 tb_error::
      0091D6 6C 2E 0A 00 42   [ 2]  503 	btjt flags,#FCOMP,1$
      0091DB 75               [ 1]  504 	push a 
      0091DC 66 66 65         [ 2]  505 	ldw x, #rt_msg 
      0091DF 72 20 66         [ 4]  506 	call puts 
      0091E2 75               [ 1]  507 	pop a 
      0091E3 6C 6C 0A         [ 2]  508 	ldw x, #err_msg 
      0091E6 00 0A 72 75      [ 1]  509 	clr acc16 
      0091EA 6E               [ 1]  510 	sll a
      0091EB 20 74 69 6D      [ 1]  511 	rlc acc16  
      0091EF 65 20 65         [ 1]  512 	ld acc8, a 
      0091F2 72 72 6F 72      [ 2]  513 	addw x,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      0091F6 2C               [ 2]  514 	ldw x,(x)
      0091F7 20 00 0A         [ 4]  515 	call puts
      0091FA 63 6F 6D         [ 2]  516 	ldw x,basicptr
      0091FD 70 69 6C         [ 1]  517 	ld a,in 
      009200 65 20 65         [ 4]  518 	call prt_basic_line
      009203 72 72 6F         [ 2]  519 	ldw x,#tk_id 
      009206 72 2C 20         [ 4]  520 	call puts 
      009209 00 6C 61         [ 1]  521 	ld a,in.saved 
      00920C 73               [ 1]  522 	clrw x 
      00920D 74               [ 1]  523 	ld xl,a 
      00920E 20 74 6F 6B      [ 2]  524 	addw x,basicptr 
      009212 65               [ 1]  525 	ld a,(x)
      009213 6E               [ 1]  526 	clrw x 
      009214 20               [ 1]  527 	ld xl,a 
      009215 69 64 3A         [ 4]  528 	call print_int
      009218 20 00 00 20 37   [ 2]  529 	btjf flags,#FAUTORUN ,6$
      00921A 20 35            [ 2]  530 	jra 6$
      0011E5                        531 1$:	
      00921A A6               [ 1]  532 	push a 
      00921B 02 11 79         [ 2]  533 	ldw x,#comp_msg
      00921C CD 03 4E         [ 4]  534 	call puts 
      00921C 72               [ 1]  535 	pop a 
      00921D 0A 00 21         [ 2]  536 	ldw x, #err_msg 
      009220 44 88 AE 91      [ 1]  537 	clr acc16 
      009224 E7               [ 1]  538 	sll a
      009225 CD 83 CE 84      [ 1]  539 	rlc acc16  
      009229 AE 90 99         [ 1]  540 	ld acc8, a 
      00922C 72 5F 00 0D      [ 2]  541 	addw x,acc16 
      009230 48               [ 2]  542 	ldw x,(x)
      009231 72 59 00         [ 4]  543 	call puts
      009234 0D C7 00         [ 2]  544 	ldw x,#tib
      009237 0E 72 BB         [ 4]  545 	call puts 
      00923A 00 0D            [ 1]  546 	ld a,#CR 
      00923C FE CD 83         [ 4]  547 	call putc
      00923F CE CE 00         [ 2]  548 	ldw x,in.w
      009242 05 C6 00         [ 4]  549 	call spaces
      009245 02 CD            [ 1]  550 	ld a,#'^
      009247 9A 36 AE         [ 4]  551 	call putc 
      00924A 92 0A CD         [ 2]  552 6$: ldw x,#STACK_EMPTY 
      00924D 83               [ 1]  553     ldw sp,x
      00121E                        554 warm_start:
      00924E CE C6 00         [ 4]  555 	call warm_init
                                    556 ;----------------------------
                                    557 ;   BASIC interpreter
                                    558 ;----------------------------
      001221                        559 cmd_line: ; user interface 
      009251 03 5F            [ 1]  560 	ld a,#CR 
      009253 97 72 BB         [ 4]  561 	call putc 
      009256 00 05            [ 1]  562 	ld a,#'> 
      009258 F6 5F 97         [ 4]  563 	call putc
      00925B CD 93 69         [ 4]  564 	call readln
      00925E 72 0D 00 21      [ 1]  565 	tnz count 
      009262 37 20            [ 1]  566 	jreq cmd_line
      009264 35 0A AD         [ 4]  567 	call compile
                                    568 ;;; test 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                                    569 ; ldw x,txtbgn 
                                    570 ; ldw y,#16 
                                    571 ; call hex_dump
                                    572 ;;; end test
                                    573 
                                    574 ; if text begin with a line number
                                    575 ; the compiler set count to zero    
                                    576 ; so code is not interpreted
      009265 72 5D 00 03      [ 1]  577 	tnz count 
      009265 88 AE            [ 1]  578 	jreq cmd_line
                                    579 
                                    580 ; if direct command 
                                    581 ; it's ready to interpret 
                                    582 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    583 ;; This is the interpreter loop
                                    584 ;; for each BASIC code line. 
                                    585 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      00123D                        586 interpreter: 
      009267 91 F9 CD         [ 1]  587 	ld a,in 
      00926A 83 CE 84         [ 1]  588 	cp a,count 
      00926D AE 90            [ 1]  589 	jrmi interp_loop
      001245                        590 next_line:
      00926F 99 72 5F 00 0D   [ 2]  591 	btjf flags, #FRUN, cmd_line
      009274 48 72 59         [ 2]  592 	ldw x,basicptr
      009277 00 0D C7 00      [ 2]  593 	addw x,in.w 
      00927B 0E 72 BB         [ 2]  594 	cpw x,txtend 
      00927E 00 0D            [ 1]  595 	jrpl warm_start
      009280 FE CD 83         [ 2]  596 	ldw basicptr,x ; start of next line  
      009283 CE AE            [ 1]  597 	ld a,(2,x)
      009285 16 90 CD         [ 1]  598 	ld count,a 
      009288 83 CE A6 0D      [ 1]  599 	mov in,#3 ; skip first 3 bytes of line 
      001262                        600 interp_loop: 
      00928C CD 83 71         [ 4]  601 	call next_token
      00928F CE 00            [ 1]  602 	cp a,#TK_NONE 
      009291 01 CD            [ 1]  603 	jreq next_line 
      009293 84 3B            [ 1]  604 	cp a,#TK_CMD
      009295 A6 5E            [ 1]  605 	jrne 1$
      009297 CD               [ 4]  606 	call (x) 
      009298 83 71            [ 2]  607 	jra interp_loop 
      001270                        608 1$:	 
      00929A AE 17            [ 1]  609 	cp a,#TK_VAR
      00929C FF 94            [ 1]  610 	jrne 2$
      00929E CD 18 BB         [ 4]  611 	call let_var  
      00929E CD 90            [ 2]  612 	jra interp_loop 
      001279                        613 2$:	
      0092A0 64 06            [ 1]  614 	cp a,#TK_ARRAY 
      0092A1 26 05            [ 1]  615 	jrne 3$
      0092A1 A6 0D CD         [ 4]  616 	call let_array 
      0092A4 83 71            [ 2]  617 	jra interp_loop
      001282                        618 3$:	
      0092A6 A6 3E            [ 1]  619 	cp a,#TK_COLON 
      0092A8 CD 83            [ 1]  620 	jreq interp_loop
      0092AA 71 CD            [ 1]  621 4$: cp a,#TK_LABEL 
      0092AC 84 D3            [ 1]  622 	jrne 5$
      0092AE 72 5D 00         [ 4]  623 	call skip_label
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      0092B1 04 27            [ 2]  624 	jra interp_loop 
      0092B3 ED CD 8B         [ 2]  625 5$:	jp syntax_error 
                                    626 
                                    627 ; skip label at beginning of line 
      001292                        628 skip_label:
      0092B6 2D 72            [ 1]  629 	ld a,#4 
      0092B8 5D 00 04         [ 1]  630 	add a,in 
      0092BB 27 E4 01         [ 1]  631 	ld in,a 
      0092BD 81               [ 4]  632 	ret 
                                    633 		
                                    634 ;--------------------------
                                    635 ; extract next token from
                                    636 ; token list 
                                    637 ; basicptr -> base address 
                                    638 ; in  -> offset in list array 
                                    639 ; output:
                                    640 ;   A 		token attribute
                                    641 ;   X 		token value if there is one
                                    642 ;----------------------------------------
      00129B                        643 next_token::
      0092BD C6               [ 1]  644 	clrw x 
      0092BE 00 02 C1         [ 1]  645 	ld a,in 
                                    646 ; don't replace sub by "cp a,count" 
                                    647 ; if end of line must return with A=0   	
      0092C1 00 04 2B         [ 1]  648 	sub a,count 
      0092C4 1D 44            [ 1]  649 	jreq 9$ ; end of line 
      0092C5                        650 0$: 
      0092C5 72 01 00 21 D7   [ 1]  651 	mov in.saved,in ; in case "_unget_token" needed 
      0092CA CE 00 05 72      [ 2]  652 	ldw y,basicptr 
      0092CE BB 00 01 C3      [ 2]  653 	addw y,in.w 
      0092D2 00 1C            [ 1]  654 	ld a,(y)
      0092D4 2A C8            [ 1]  655 	incw y   
      0092D6 CF               [ 1]  656 	tnz a 
      0092D7 00 05            [ 1]  657 	jrmi 4$
      0092D9 E6 02            [ 1]  658 	cp a,#TK_ARRAY
      0092DB C7 00            [ 1]  659 	jrpl 7$  ; no attribute for these
      0012BC                        660 1$: ; 
      0092DD 04 35            [ 1]  661 	cp a,#TK_CHAR
      0092DF 03 00            [ 1]  662 	jrne 2$
      0092E1 02               [ 1]  663 	exg a,xl
      0092E2 90 F6            [ 1]  664 	ld a,(y)
      0092E2 CD               [ 1]  665 	exg a,xl  
      0092E3 93 1B            [ 2]  666 	jra 6$ 
      0092E5 A1 00            [ 1]  667 2$:	cp a,#TK_QSTR 
      0092E7 27 DC            [ 1]  668 	jrne 7$
      0092E9 A1               [ 1]  669 	ldw x,y 
                                    670 ; move pointer after string 
      0092EA 80 26            [ 1]  671 3$:	tnz (y)
      0092EC 03 FD            [ 1]  672 	jreq 6$
      0092EE 20 F2            [ 1]  673 	incw y 
      0092F0 20 F8            [ 2]  674 	jra 3$
      0012D3                        675 4$: 
      0092F0 A1               [ 1]  676 	ldw x,y 
      0092F1 85               [ 2]  677 	ldw x,(x)
      0092F2 26 05            [ 1]  678 	cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      0092F4 CD 99            [ 1]  679 	jrpl 5$
      0092F6 3B 20 E9         [ 2]  680 	ldw x,(code_addr,x) 
      0092F9 90 5C            [ 1]  681 5$:	incw y 
      0092F9 A1 06            [ 1]  682 6$:	incw y 
      0092FB 26 05 CD 99      [ 2]  683 7$:	subw y,basicptr 
      0092FF 38 20 E0 00      [ 2]  684 	ldw in.w,y 
      009302                        685 9$: 
      009302 A1               [ 4]  686 	ret	
                                    687 
                                    688 ;-----------------------------------
                                    689 ; print a 16 bit integer 
                                    690 ; using variable 'base' as conversion
                                    691 ; format.
                                    692 ; input:
                                    693 ;   X       integer to print 
                                    694 ;   'base'    conversion base 
                                    695 ; output:
                                    696 ;   none 
                                    697 ;-----------------------------------
      0012E9                        698 print_int:
      009303 0B 27 DC A1      [ 1]  699 	clr acc24 
      009307 01 26 05         [ 2]  700 	ldw acc16,x 
      00930A CD 93 12 20 D3   [ 2]  701 	btjf acc16,#7,prti24
      00930F CC 92 1A 0B      [ 1]  702 	cpl acc24 
                                    703 	
                                    704 ;------------------------------------
                                    705 ; print integer in acc24 
                                    706 ; input:
                                    707 ;	acc24 		integer to print 
                                    708 ;	'base' 		numerical base for conversion 
                                    709 ;   'tab_width' field width 
                                    710 ;  output:
                                    711 ;    A          string length
                                    712 ;------------------------------------
      009312                        713 prti24:
      009312 A6 04 CB         [ 4]  714     call itoa  ; conversion entier en  .asciz
      009315 00 02 C7         [ 4]  715 	call right_align  
      009318 00               [ 1]  716 	push a 
      009319 02 81 4E         [ 4]  717 	call puts
      00931B 84               [ 1]  718 	pop a 
      00931B 5F               [ 4]  719     ret	
                                    720 
                                    721 ;------------------------------------
                                    722 ; convert integer in acc24 to string
                                    723 ; input:
                                    724 ;   'base'	conversion base 
                                    725 ;	acc24	integer to convert
                                    726 ; output:
                                    727 ;   X  		pointer to first char of string
                                    728 ;   A       string length
                                    729 ;------------------------------------
                           000001   730 	SIGN=1  ; integer sign 
                           000002   731 	LEN=2 
                           000003   732 	PSTR=3
                           000004   733 	VSIZE=4 ;locals size
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      001305                        734 itoa::
      001305                        735 	_vars VSIZE
      00931C C6 00            [ 2]    1     sub sp,#VSIZE 
      00931E 02 C0            [ 1]  736 	clr (LEN,sp) ; string length  
      009320 00 04            [ 1]  737 	clr (SIGN,sp)    ; sign
      009322 27 44 0A         [ 1]  738 	ld a,base 
      009324 A1 0A            [ 1]  739 	cp a,#10
      009324 55 00            [ 1]  740 	jrne 1$
                                    741 	; base 10 string display with negative sign if bit 23==1
      009326 02 00 03 90 CE   [ 2]  742 	btjf acc24,#7,1$
      00932B 00 05            [ 1]  743 	cpl (SIGN,sp)
      00932D 72 B9 00         [ 4]  744 	call neg_acc24
      00131C                        745 1$:
                                    746 ; initialize string pointer 
      009330 01 90 F6         [ 2]  747 	ldw x,#tib 
      009333 90 5C 4D         [ 2]  748 	addw x,#TIB_SIZE
      009336 2B               [ 2]  749 	decw x 
      009337 1B               [ 1]  750 	clr (x)
      009338 A1               [ 2]  751 	decw x 
      009339 06 2A            [ 1]  752 	ld a,#32
      00933B 24               [ 1]  753 	ld (x),a
      00933C 0C 02            [ 1]  754 	inc (LEN,sp)
      00132A                        755 itoa_loop:
      00933C A1 03 26         [ 1]  756     ld a,base
      00933F 06 41            [ 2]  757 	ldw (PSTR,sp),x 
      009341 90 F6 41         [ 4]  758     call divu24_8 ; acc24/A 
      009344 20 18            [ 2]  759 	ldw x,(PSTR,sp)
      009346 A1 02            [ 1]  760     add a,#'0  ; remainder of division
      009348 26 16            [ 1]  761     cp a,#'9+1
      00934A 93 90            [ 1]  762     jrmi 2$
      00934C 7D 27            [ 1]  763     add a,#7 
      00133C                        764 2$:	
      00934E 0F               [ 2]  765 	decw x
      00934F 90               [ 1]  766     ld (x),a
      009350 5C 20            [ 1]  767 	inc (LEN,sp)
                                    768 	; if acc24==0 conversion done
      009352 F8 00 0B         [ 1]  769 	ld a,acc24
      009353 CA 00 0C         [ 1]  770 	or a,acc16
      009353 93 FE A1         [ 1]  771 	or a,acc8
      009356 84 2A            [ 1]  772     jrne itoa_loop
                                    773 	;conversion done, next add '$' or '-' as required
      009358 03 DE AA         [ 1]  774 	ld a,base 
      00935B D9 90            [ 1]  775 	cp a,#16
      00935D 5C 90            [ 1]  776 	jreq 8$
      00935F 5C 72            [ 1]  777 	ld a,(SIGN,sp)
      009361 B2 00            [ 1]  778     jreq 10$
      009363 05 90            [ 1]  779     ld a,#'-
      009365 CF 00            [ 2]  780 	jra 9$ 
                                    781 ; don't print more than 4 digits
                                    782 ; in hexadecimal to avoid '-' sign 
                                    783 ; extend display 	
      009367 01 02            [ 1]  784 8$: ld a,(LEN,sp) 
      009368 A1 06            [ 1]  785 	cp a,#6 
      009368 81 05            [ 1]  786 	jrmi 81$
      009369 5C               [ 1]  787 	incw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009369 72 5F            [ 1]  788 	dec (LEN,sp)
      00936B 00 0C            [ 2]  789 	jra 8$
      001365                        790 81$:	
      00936D CF 00            [ 1]  791 	ld a,#'$ 
      00936F 0D               [ 2]  792 9$: decw x
      009370 72               [ 1]  793     ld (x),a
      009371 0F 00            [ 1]  794 	inc (LEN,sp)
      00136B                        795 10$:
      009373 0D 04            [ 1]  796 	ld a,(LEN,sp)
      00136D                        797 	_drop VSIZE
      009375 72 53            [ 2]    1     addw sp,#VSIZE 
      009377 00               [ 4]  798 	ret
                                    799 
                                    800 ;-------------------------------------
                                    801 ; divide uint24_t by uint8_t
                                    802 ; used to convert uint24_t to string
                                    803 ; input:
                                    804 ;	acc24	dividend
                                    805 ;   A 		divisor
                                    806 ; output:
                                    807 ;   acc24	quotient
                                    808 ;   A		remainder
                                    809 ;------------------------------------- 
                                    810 ; offset  on sp of arguments and locals
                           000001   811 	U8   = 1   ; divisor on stack
                           000001   812 	VSIZE =1
      001370                        813 divu24_8:
      009378 0C               [ 2]  814 	pushw x ; save x
      009379 88               [ 1]  815 	push a 
                                    816 	; ld dividend UU:MM bytes in X
      009379 CD 93 85         [ 1]  817 	ld a, acc24
      00937C CD               [ 1]  818 	ld xh,a
      00937D 8B CC 88         [ 1]  819 	ld a,acc24+1
      009380 CD               [ 1]  820 	ld xl,a
      009381 83 CE            [ 1]  821 	ld a,(U8,SP) ; divisor
      009383 84               [ 2]  822 	div x,a ; UU:MM/U8
      009384 81               [ 1]  823 	push a  ;save remainder
      009385 9E               [ 1]  824 	ld a,xh
      009385 52 04 0F         [ 1]  825 	ld acc24,a
      009388 02               [ 1]  826 	ld a,xl
      009389 0F 01 C6         [ 1]  827 	ld acc24+1,a
      00938C 00               [ 1]  828 	pop a
      00938D 0B               [ 1]  829 	ld xh,a
      00938E A1 0A 26         [ 1]  830 	ld a,acc24+2
      009391 0A               [ 1]  831 	ld xl,a
      009392 72 0F            [ 1]  832 	ld a,(U8,sp) ; divisor
      009394 00               [ 2]  833 	div x,a  ; R:LL/U8
      009395 0C 05            [ 1]  834 	ld (U8,sp),a ; save remainder
      009397 03               [ 1]  835 	ld a,xl
      009398 01 CD 94         [ 1]  836 	ld acc24+2,a
      00939B 52               [ 1]  837 	pop a
      00939C 85               [ 2]  838 	popw x
      00939C AE               [ 4]  839 	ret
                                    840 
                                    841 ;--------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



                                    842 ; unsigned multiply uint24_t by uint8_t
                                    843 ; use to convert numerical string to uint24_t
                                    844 ; input:
                                    845 ;	acc24	uint24_t 
                                    846 ;   A		uint8_t
                                    847 ; output:
                                    848 ;   acc24   A*acc24
                                    849 ;-------------------------------------
                                    850 ; local variables offset  on sp
                           000003   851 	U8   = 3   ; A pushed on stack
                           000002   852 	OVFL = 2  ; multiplicaton overflow low byte
                           000001   853 	OVFH = 1  ; multiplication overflow high byte
                           000003   854 	VSIZE = 3
      001398                        855 mulu24_8:
      00939D 16               [ 2]  856 	pushw x    ; save X
                                    857 	; local variables
      00939E 90               [ 1]  858 	push a     ; U8
      00939F 1C               [ 1]  859 	clrw x     ; initialize overflow to 0
      0093A0 00               [ 2]  860 	pushw x    ; multiplication overflow
                                    861 ; multiply low byte.
      0093A1 50 5A 7F         [ 1]  862 	ld a,acc24+2
      0093A4 5A               [ 1]  863 	ld xl,a
      0093A5 A6 20            [ 1]  864 	ld a,(U8,sp)
      0093A7 F7               [ 4]  865 	mul x,a
      0093A8 0C               [ 1]  866 	ld a,xl
      0093A9 02 00 0D         [ 1]  867 	ld acc24+2,a
      0093AA 9E               [ 1]  868 	ld a, xh
      0093AA C6 00            [ 1]  869 	ld (OVFL,sp),a
                                    870 ; multipy middle byte
      0093AC 0B 1F 03         [ 1]  871 	ld a,acc24+1
      0093AF CD               [ 1]  872 	ld xl,a
      0093B0 93 F0            [ 1]  873 	ld a, (U8,sp)
      0093B2 1E               [ 4]  874 	mul x,a
                                    875 ; add overflow to this partial product
      0093B3 03 AB 30         [ 2]  876 	addw x,(OVFH,sp)
      0093B6 A1               [ 1]  877 	ld a,xl
      0093B7 3A 2B 02         [ 1]  878 	ld acc24+1,a
      0093BA AB               [ 1]  879 	clr a
      0093BB 07 00            [ 1]  880 	adc a,#0
      0093BC 6B 01            [ 1]  881 	ld (OVFH,sp),a
      0093BC 5A               [ 1]  882 	ld a,xh
      0093BD F7 0C            [ 1]  883 	ld (OVFL,sp),a
                                    884 ; multiply most signficant byte	
      0093BF 02 C6 00         [ 1]  885 	ld a, acc24
      0093C2 0C               [ 1]  886 	ld xl, a
      0093C3 CA 00            [ 1]  887 	ld a, (U8,sp)
      0093C5 0D               [ 4]  888 	mul x,a
      0093C6 CA 00 0E         [ 2]  889 	addw x, (OVFH,sp)
      0093C9 26               [ 1]  890 	ld a, xl
      0093CA DF C6 00         [ 1]  891 	ld acc24,a
      0093CD 0B A1            [ 2]  892     addw sp,#VSIZE
      0093CF 10               [ 2]  893 	popw x
      0093D0 27               [ 4]  894 	ret
                                    895 
                                    896 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



                                    897 ;  two's complement acc24
                                    898 ;  input:
                                    899 ;		acc24 variable
                                    900 ;  output:
                                    901 ;		acc24 variable
                                    902 ;-------------------------------------
      0013D2                        903 neg_acc24:
      0093D1 08 7B 01 27      [ 1]  904 	cpl acc24+2
      0093D5 15 A6 2D 20      [ 1]  905 	cpl acc24+1
      0093D9 0D 7B 02 A1      [ 1]  906 	cpl acc24
      0093DD 06 2B            [ 1]  907 	ld a,#1
      0093DF 05 5C 0A         [ 1]  908 	add a,acc24+2
      0093E2 02 20 F5         [ 1]  909 	ld acc24+2,a
      0093E5 4F               [ 1]  910 	clr a
      0093E5 A6 24 5A         [ 1]  911 	adc a,acc24+1
      0093E8 F7 0C 02         [ 1]  912 	ld acc24+1,a 
      0093EB 4F               [ 1]  913 	clr a 
      0093EB 7B 02 5B         [ 1]  914 	adc a,acc24 
      0093EE 04 81 0B         [ 1]  915 	ld acc24,a 
      0093F0 81               [ 4]  916 	ret
                                    917 
                                    918 
                                    919 
                                    920 
                                    921 ;------------------------------------
                                    922 ; convert alpha to uppercase
                                    923 ; input:
                                    924 ;    a  character to convert
                                    925 ; output:
                                    926 ;    a  uppercase character
                                    927 ;------------------------------------
      0013F5                        928 to_upper::
      0093F0 89 88            [ 1]  929 	cp a,#'a
      0093F2 C6 00            [ 1]  930 	jrpl 1$
      0093F4 0C               [ 4]  931 0$:	ret
      0093F5 95 C6            [ 1]  932 1$: cp a,#'z	
      0093F7 00 0D            [ 1]  933 	jrugt 0$
      0093F9 97 7B            [ 1]  934 	sub a,#32
      0093FB 01               [ 4]  935 	ret
                                    936 	
                                    937 ;------------------------------------
                                    938 ; convert pad content in integer
                                    939 ; input:
                                    940 ;    x		.asciz to convert
                                    941 ; output:
                                    942 ;    acc24      int24_t
                                    943 ;------------------------------------
                                    944 	; local variables
                           000001   945 	SIGN=1 ; 1 byte, 
                           000002   946 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003   947 	TEMP=3 ; 1 byte, temporary storage
                           000003   948 	VSIZE=3 ; 3 bytes reserved for local storage
      001401                        949 atoi24::
      0093FC 62               [ 2]  950 	pushw x 
      001402                        951 	_vars VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      0093FD 88 9E            [ 2]    1     sub sp,#VSIZE 
                                    952 	; acc24=0 
      0093FF C7 00 0C 9F      [ 1]  953 	clr acc24    
      009403 C7 00 0D 84      [ 1]  954 	clr acc16
      009407 95 C6 00 0E      [ 1]  955 	clr acc8 
      00940B 97 7B            [ 1]  956 	clr (SIGN,sp)
      00940D 01 62            [ 1]  957 	ld a,#10
      00940F 6B 01            [ 1]  958 	ld (BASE,sp),a ; default base decimal
      009411 9F               [ 1]  959 	ld a,(x)
      009412 C7 00            [ 1]  960 	jreq 9$  ; completed if 0
      009414 0E 84            [ 1]  961 	cp a,#'-
      009416 85 81            [ 1]  962 	jrne 1$
      009418 03 01            [ 1]  963 	cpl (SIGN,sp)
      009418 89 88            [ 2]  964 	jra 2$
      00941A 5F 89            [ 1]  965 1$: cp a,#'$
      00941C C6 00            [ 1]  966 	jrne 3$
      00941E 0E 97            [ 1]  967 	ld a,#16
      009420 7B 03            [ 1]  968 	ld (BASE,sp),a
      009422 42               [ 1]  969 2$:	incw x
      009423 9F               [ 1]  970 	ld a,(x)
      00142B                        971 3$:	
      009424 C7 00            [ 1]  972 	cp a,#'a
      009426 0E 9E            [ 1]  973 	jrmi 4$
      009428 6B 02            [ 1]  974 	sub a,#32
      00942A C6 00            [ 1]  975 4$:	cp a,#'0
      00942C 0D 97            [ 1]  976 	jrmi 9$
      00942E 7B 03            [ 1]  977 	sub a,#'0
      009430 42 72            [ 1]  978 	cp a,#10
      009432 FB 01            [ 1]  979 	jrmi 5$
      009434 9F C7            [ 1]  980 	sub a,#7
      009436 00 0D            [ 1]  981 	cp a,(BASE,sp)
      009438 4F A9            [ 1]  982 	jrpl 9$
      00943A 00 6B            [ 1]  983 5$:	ld (TEMP,sp),a
      00943C 01 9E            [ 1]  984 	ld a,(BASE,sp)
      00943E 6B 02 C6         [ 4]  985 	call mulu24_8
      009441 00 0C            [ 1]  986 	ld a,(TEMP,sp)
      009443 97 7B 03         [ 1]  987 	add a,acc24+2
      009446 42 72 FB         [ 1]  988 	ld acc24+2,a
      009449 01               [ 1]  989 	clr a
      00944A 9F C7 00         [ 1]  990 	adc a,acc24+1
      00944D 0C 5B 03         [ 1]  991 	ld acc24+1,a
      009450 85               [ 1]  992 	clr a
      009451 81 00 0B         [ 1]  993 	adc a,acc24
      009452 C7 00 0B         [ 1]  994 	ld acc24,a
      009452 72 53            [ 2]  995 	jra 2$
      009454 00 0E            [ 1]  996 9$:	tnz (SIGN,sp)
      009456 72 53            [ 1]  997     jreq atoi_exit
      009458 00 0D 72         [ 4]  998     call neg_acc24
      001467                        999 atoi_exit: 
      001467                       1000 	_drop VSIZE
      00945B 53 00            [ 2]    1     addw sp,#VSIZE 
      00945D 0C               [ 2] 1001 	popw x ; restore x
      00945E A6               [ 4] 1002 	ret
                                   1003 
                                   1004 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



                                   1005 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1006 ;;   TINY BASIC  operators,
                                   1007 ;;   commands and functions 
                                   1008 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1009 
                                   1010 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1011 ;;  Arithmetic operators
                                   1012 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1013 
                                   1014 ;debug support
                           000001  1015 DEBUG_PRT=1
                           000001  1016 .if DEBUG_PRT 
                           000001  1017 	REGA=1
                           000002  1018 	SAVEB=2
                           000003  1019 	REGX=3
                           000005  1020 	REGY=5
                           000007  1021 	ACC24=7
                           000009  1022 	VSIZE=9 
      00146B                       1023 printxy:
      00146B                       1024 	_vars VSIZE 
      00945F 01 CB            [ 2]    1     sub sp,#VSIZE 
      009461 00 0E            [ 1] 1025 	ld (REGA,sp),a 
      009463 C7 00 0E         [ 1] 1026 	ld a,base 
      009466 4F C9            [ 1] 1027 	ld (SAVEB,sp),a
      009468 00 0D            [ 2] 1028 	ldw (REGX,sp),x
      00946A C7 00            [ 2] 1029 	ldw (REGY,sp),y
      00946C 0D 4F C9         [ 2] 1030 	ldw x,acc24 
      00946F 00 0C C7         [ 1] 1031 	ld a,acc8 
      009472 00 0C            [ 2] 1032 	ldw (ACC24,sp),x 
      009474 81 09            [ 1] 1033 	ld (ACC24+2,sp),a 
      009475 35 10 00 0A      [ 1] 1034 	mov base,#16 
      009475 A1               [ 1] 1035 	clrw x 
      009476 61 2A            [ 1] 1036 	ld a,(REGA,sp)
      009478 01               [ 1] 1037 	ld xl,a 
      009479 81 A1 7A         [ 4] 1038 	call print_int
      00947C 22 FB            [ 1] 1039 	ld a,#SPACE 
      00947E A0 20 81         [ 4] 1040 	call putc  
      009481 1E 03            [ 2] 1041 	ldw x,(REGX,sp)
      009481 89 52 03         [ 4] 1042 	call print_int 
      009484 72 5F            [ 1] 1043 	ld a,#SPACE 
      009486 00 0C 72         [ 4] 1044 	call putc  
      009489 5F 00            [ 2] 1045 	ldw x,(REGY,sp)
      00948B 0D 72 5F         [ 4] 1046 	call print_int 
      00948E 00 0E            [ 1] 1047 	ld a,#CR 
      009490 0F 01 A6         [ 4] 1048 	call putc 
      009493 0A 6B            [ 1] 1049 	ld a,(ACC24+2,sp)
      009495 02 F6            [ 2] 1050 	ldw x,(ACC24,sp)
      009497 27 47 A1         [ 2] 1051 	ldw acc24,x 
      00949A 2D 26 04         [ 1] 1052 	ld acc8,a
      00949D 03 01            [ 1] 1053 	ld a,(SAVEB,sp)
      00949F 20 08 A1         [ 1] 1054 	ld base,a 
      0094A2 24 26            [ 1] 1055 	ld a,(REGA,sp)
      0094A4 06 A6            [ 2] 1056 	ldw x,(REGX,sp)
      0094A6 10 6B            [ 2] 1057 	ldw y,(REGY,sp)
      0014BB                       1058 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      0094A8 02 5C            [ 2]    1     addw sp,#VSIZE 
      0094AA F6               [ 4] 1059 	ret 
                                   1060 .endif 
                                   1061 
                                   1062 
                                   1063 ;--------------------------------------
                                   1064 ;  multiply 2 uint16_t return uint32_t
                                   1065 ;  input:
                                   1066 ;     x       uint16_t 
                                   1067 ;     y       uint16_t 
                                   1068 ;  output:
                                   1069 ;     x       product bits 15..0
                                   1070 ;     y       product bits 31..16 
                                   1071 ;---------------------------------------
                           000001  1072 		U1=1  ; uint16_t 
                           000003  1073 		DBL=3 ; uint32_t
                           000006  1074 		VSIZE=6
      0094AB                       1075 umstar:
      0014BE                       1076 	_vars VSIZE 
      0094AB A1 61            [ 2]    1     sub sp,#VSIZE 
      0094AD 2B 02            [ 2] 1077 	ldw (U1,sp),x 
                                   1078 ;initialize bits 31..16 of 
                                   1079 ;product to zero 
      0094AF A0 20            [ 1] 1080 	clr (DBL,sp)
      0094B1 A1 30            [ 1] 1081 	clr (DBL+1,sp)
                                   1082 ; produc U1L*U2L 
      0094B3 2B 2B            [ 1] 1083 	ld a,yl 
      0094B5 A0               [ 4] 1084 	mul x,a 
      0094B6 30 A1            [ 2] 1085 	ldw (DBL+2,sp),x
                                   1086 ; product U1H*U2L 
      0094B8 0A 2B            [ 1] 1087 	ld a,(U1,sp) ; xh 
      0094BA 06               [ 1] 1088 	ldw x,y
      0094BB A0               [ 4] 1089 	mul x,a 
      0094BC 07               [ 1] 1090 	clr a 
      0094BD 11 02 2A         [ 2] 1091 	addw x,(DBL+1,sp) 
      0094C0 1F               [ 1] 1092 	clr a 
      0094C1 6B 03            [ 1] 1093 	adc a,(DBL,sp) 
      0094C3 7B 02            [ 1] 1094 	ld (DBL,sp),a ; bits 23..17 
      0094C5 CD 94            [ 2] 1095 	ldw (DBL+1,sp),x ; bits 15..0 
                                   1096 ; product U1L*U2H
      0094C7 18 7B            [ 1] 1097 	swapw y 
      0094C9 03               [ 1] 1098 	ldw x,y
      0094CA CB 00            [ 1] 1099 	ld a,(U1+1,sp)
      0094CC 0E               [ 4] 1100 	mul x,a
      0094CD C7 00 0E         [ 2] 1101 	addw x,(DBL+1,sp)
      0094D0 4F               [ 1] 1102 	clr a 
      0094D1 C9 00            [ 1] 1103 	adc a,(DBL,sp)
      0094D3 0D C7            [ 1] 1104 	ld (DBL,sp),a 
      0094D5 00 0D            [ 2] 1105 	ldw (DBL+1,sp),x 
                                   1106 ; product U1H*U2H 	
      0094D7 4F C9            [ 1] 1107 	ld a,(U1,sp)
      0094D9 00               [ 1] 1108 	ldw x,y  
      0094DA 0C               [ 4] 1109 	mul x,a 
      0094DB C7 00 0C         [ 2] 1110 	addw x,(DBL,sp)
      0094DE 20 C9            [ 1] 1111 	ldw y,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      0094E0 0D 01            [ 2] 1112 	ldw x,(DBL+2,sp)
      0014F5                       1113 	_drop VSIZE 
      0094E2 27 03            [ 2]    1     addw sp,#VSIZE 
      0094E4 CD               [ 4] 1114 	ret
                                   1115 
                                   1116 
                                   1117 ;-------------------------------------
                                   1118 ; multiply 2 integers
                                   1119 ; input:
                                   1120 ;  	x       n1 
                                   1121 ;   y 		n2 
                                   1122 ; output:
                                   1123 ;	X        N1*N2 bits 15..0
                                   1124 ;   Y        N1*N2 bits 31..16 
                                   1125 ;-------------------------------------
                           000001  1126 	SIGN=1
                           000001  1127 	VSIZE=1
      0014F8                       1128 multiply:
      0014F8                       1129 	_vars VSIZE 
      0094E5 94 52            [ 2]    1     sub sp,#VSIZE 
      0094E7 0F 01            [ 1] 1130 	clr (SIGN,sp)
      0094E7 5B               [ 1] 1131 	ld a,xh 
      0094E8 03 85            [ 1] 1132 	and a,#0x80
      0094EA 81 03            [ 1] 1133 	jrpl 1$
      0094EB 03 01            [ 1] 1134 	cpl (SIGN,sp)
      0094EB 52               [ 2] 1135 	negw x 
      001504                       1136 1$:	
      0094EC 09 6B            [ 1] 1137 	ld a,yh
      0094EE 01 C6            [ 1] 1138 	and a,#0x80  
      0094F0 00 0B            [ 1] 1139 	jrpl 2$ 
      0094F2 6B 02            [ 1] 1140 	cpl (SIGN,sp)
      0094F4 1F 03            [ 2] 1141 	negw y 
      00150E                       1142 2$:	
      0094F6 17 05 CE         [ 4] 1143 	call umstar
      0094F9 00 0C            [ 1] 1144 	ld a,(SIGN,sp)
      0094FB C6 00            [ 1] 1145 	jreq 3$
      0094FD 0E 1F 07         [ 4] 1146 	call dneg 
      001518                       1147 3$:	
      001518                       1148 	_drop VSIZE 
      009500 6B 09            [ 2]    1     addw sp,#VSIZE 
      009502 35               [ 4] 1149 	ret
                                   1150 
                                   1151 ;--------------------------------------
                                   1152 ; divide uint32_t/uint16_t
                                   1153 ; return:  quotient and remainder 
                                   1154 ; quotient expected to be uint16_t 
                                   1155 ; input:
                                   1156 ;   DBLDIVDND    on stack 
                                   1157 ;   X            divisor 
                                   1158 ; output:
                                   1159 ;   X            quotient 
                                   1160 ;   Y            remainder 
                                   1161 ;---------------------------------------
                           000003  1162 	VSIZE=3
      00151B                       1163 	_argofs VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



                           000005     1     ARG_OFS=2+VSIZE 
      00151B                       1164 	_arg DBLDIVDND 1
                           000006     1     DBLDIVDND=ARG_OFS+1 
                                   1165 	; local variables 
                           000001  1166 	DIVISOR=1 
                           000003  1167 	CNTR=3 
      00151B                       1168 udiv32_16:
      00151B                       1169 	_vars VSIZE 
      009503 10 00            [ 2]    1     sub sp,#VSIZE 
      009505 0B 5F            [ 2] 1170 	ldw (DIVISOR,sp),x	; save divisor 
      009507 7B 01            [ 2] 1171 	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
      009509 97 CD            [ 2] 1172 	ldw y,(DBLDIVDND,sp) ; bits 31..16
      00950B 93 69            [ 2] 1173 	tnzw y
      00950D A6 20            [ 1] 1174 	jrne long_division 
      00950F CD 83            [ 2] 1175 	ldw y,(DIVISOR,sp)
      009511 71               [ 2] 1176 	divw x,y
      00152A                       1177 	_drop VSIZE 
      009512 1E 03            [ 2]    1     addw sp,#VSIZE 
      009514 CD               [ 4] 1178 	ret
      00152D                       1179 long_division:
      009515 93               [ 1] 1180 	exgw x,y ; hi in x, lo in y 
      009516 69 A6            [ 1] 1181 	ld a,#17 
      009518 20 CD            [ 1] 1182 	ld (CNTR,sp),a
      001532                       1183 1$:
      00951A 83 71            [ 2] 1184 	cpw x,(DIVISOR,sp)
      00951C 1E 05            [ 1] 1185 	jrmi 2$
      00951E CD 93 69         [ 2] 1186 	subw x,(DIVISOR,sp)
      009521 A6               [ 1] 1187 2$:	ccf 
      009522 0D CD            [ 2] 1188 	rlcw y 
      009524 83               [ 2] 1189 	rlcw x 
      009525 71 7B            [ 1] 1190 	dec (CNTR,sp)
      009527 09 1E            [ 1] 1191 	jrne 1$
      009529 07               [ 1] 1192 	exgw x,y 
      001542                       1193 	_drop VSIZE 
      00952A CF 00            [ 2]    1     addw sp,#VSIZE 
      00952C 0C               [ 4] 1194 	ret
                                   1195 
                                   1196 ;-----------------------------
                                   1197 ; negate double int.
                                   1198 ; input:
                                   1199 ;   x     bits 15..0
                                   1200 ;   y     bits 31..16
                                   1201 ; output: 
                                   1202 ;   x     bits 15..0
                                   1203 ;   y     bits 31..16
                                   1204 ;-----------------------------
      001545                       1205 dneg:
      00952D C7               [ 2] 1206 	cplw x 
      00952E 00 0E            [ 2] 1207 	cplw y 
      009530 7B 02 C7         [ 2] 1208 	addw x,#1 
      009533 00 0B            [ 1] 1209 	jrnc 1$
      009535 7B 01            [ 1] 1210 	incw y 
      009537 1E               [ 4] 1211 1$: ret 
                                   1212 
                                   1213 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



                                   1214 ;--------------------------------
                                   1215 ; sign extend single to double
                                   1216 ; input:
                                   1217 ;   x    int16_t
                                   1218 ; output:
                                   1219 ;   x    int32_t bits 15..0
                                   1220 ;   y    int32_t bits 31..16
                                   1221 ;--------------------------------
      001550                       1222 dbl_sign_extend:
      009538 03 16            [ 1] 1223 	clrw y
      00953A 05               [ 1] 1224 	ld a,xh 
      00953B 5B 09            [ 1] 1225 	and a,#0x80 
      00953D 81 02            [ 1] 1226 	jreq 1$
      00953E 90 53            [ 2] 1227 	cplw y
      00953E 52               [ 4] 1228 1$: ret 	
                                   1229 
                                   1230 
                                   1231 ;----------------------------------
                                   1232 ;  euclidian divide dbl/n1 
                                   1233 ;  ref: https://en.wikipedia.org/wiki/Euclidean_division
                                   1234 ; input:
                                   1235 ;    dbl    int32_t on stack 
                                   1236 ;    x 		n1   int16_t  disivor  
                                   1237 ; output:
                                   1238 ;    X      dbl/x  int16_t 
                                   1239 ;    Y      remainder int16_t 
                                   1240 ;----------------------------------
                           000008  1241 	VSIZE=8
      00155A                       1242 	_argofs VSIZE 
                           00000A     1     ARG_OFS=2+VSIZE 
      00155A                       1243 	_arg DIVDNDHI 1 
                           00000B     1     DIVDNDHI=ARG_OFS+1 
      00155A                       1244 	_arg DIVDNDLO 3
                           00000D     1     DIVDNDLO=ARG_OFS+3 
                                   1245 	; local variables
                           000001  1246 	DBLHI=1
                           000003  1247 	DBLLO=3 
                           000005  1248 	SDIVSR=5 ; sign divisor
                           000006  1249 	SQUOT=6 ; sign dividend 
                           000007  1250 	DIVISR=7 ; divisor 
      00155A                       1251 div32_16:
      00155A                       1252 	_vars VSIZE 
      00953F 06 1F            [ 2]    1     sub sp,#VSIZE 
      009541 01 0F            [ 1] 1253 	clr (SDIVSR,sp)
      009543 03 0F            [ 1] 1254 	clr (SQUOT,sp)
                                   1255 ; copy arguments 
      009545 04 90            [ 2] 1256 	ldw y,(DIVDNDHI,sp)
      009547 9F 42            [ 2] 1257 	ldw (DBLHI,sp),y
      009549 1F 05            [ 2] 1258 	ldw y,(DIVDNDLO,sp)
      00954B 7B 01            [ 2] 1259 	ldw (DBLLO,sp),y 
                                   1260 ; check for 0 divisor
      00954D 93               [ 2] 1261 	tnzw x 
      00954E 42 4F            [ 1] 1262     jrne 0$
      009550 72 FB            [ 1] 1263 	ld a,#ERR_DIV0 
      009552 04 4F 19         [ 2] 1264 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



                                   1265 ; check divisor sign 	
      009555 03               [ 1] 1266 0$:	ld a,xh 
      009556 6B 03            [ 1] 1267 	and a,#0x80 
      009558 1F 04            [ 1] 1268 	jreq 1$
      00955A 90 5E            [ 1] 1269 	cpl (SDIVSR,sp)
      00955C 93 7B            [ 1] 1270 	cpl (SQUOT,sp)
      00955E 02               [ 2] 1271 	negw x
      00955F 42 72            [ 2] 1272 1$:	ldw (DIVISR,sp),x
                                   1273 ; check dividend sign 	 
      009561 FB 04            [ 1] 1274  	ld a,(DBLHI,sp) 
      009563 4F 19            [ 1] 1275 	and a,#0x80 
      009565 03 6B            [ 1] 1276 	jreq 2$ 
      009567 03 1F            [ 1] 1277 	cpl (SQUOT,sp)
      009569 04 7B            [ 2] 1278 	ldw x,(DBLLO,sp)
      00956B 01 93            [ 2] 1279 	ldw y,(DBLHI,sp)
      00956D 42 72 FB         [ 4] 1280 	call dneg 
      009570 03 90            [ 2] 1281 	ldw (DBLLO,sp),x 
      009572 93 1E            [ 2] 1282 	ldw (DBLHI,sp),y 
      009574 05 5B            [ 2] 1283 2$:	ldw x,(DIVISR,sp)
      009576 06 81 1B         [ 4] 1284 	call udiv32_16
      009578 90 5D            [ 2] 1285 	tnzw y 
      009578 52 01            [ 1] 1286 	jreq 3$ 
                                   1287 ; x=quotient 
                                   1288 ; y=remainder 
                                   1289 ; if SDIVSR XOR SQUOT increment quotient and remainder.
      00957A 0F 01            [ 1] 1290 	ld a,(SQUOT,sp)
      00957C 9E A4            [ 1] 1291 	xor a,(SDIVSR,sp)
      00957E 80 2A            [ 1] 1292 	jreq 3$
      009580 03               [ 1] 1293 	incw x 
      009581 03 01 50 0C      [ 2] 1294 	ldw acc16,y 
      009584 16 07            [ 2] 1295 	ldw y,(DIVISR,sp)
      009584 90 9E A4 80      [ 2] 1296 	subw y,acc16
                                   1297 ; sign quotient
      009588 2A 04            [ 1] 1298 3$:	ld a,(SQUOT,sp)
      00958A 03 01            [ 1] 1299 	jreq 4$
      00958C 90               [ 2] 1300 	negw x 
      0015AE                       1301 4$:	
      0015AE                       1302 	_drop VSIZE 
      00958D 50 08            [ 2]    1     addw sp,#VSIZE 
      00958E 81               [ 4] 1303 	ret 
                                   1304 
                                   1305 
                                   1306 
                                   1307 ;----------------------------------
                                   1308 ; division x/y 
                                   1309 ; input:
                                   1310 ;    X       dividend
                                   1311 ;    Y       divisor 
                                   1312 ; output:
                                   1313 ;    X       quotient
                                   1314 ;    Y       remainder 
                                   1315 ;-----------------------------------
                           000004  1316 	VSIZE=4 
                                   1317 	; local variables 
                           000001  1318 	DBLHI=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



                           000003  1319 	DBLLO=3
      0015B1                       1320 divide: 
      0015B1                       1321 	_vars VSIZE 
      00958E CD 95            [ 2]    1     sub sp,#VSIZE 
      009590 3E 7B 01 27      [ 2] 1322 	ldw acc16,y
      009594 03 CD 95         [ 4] 1323 	call dbl_sign_extend
      009597 C5 03            [ 2] 1324 	ldw (DBLLO,sp),x 
      009598 17 01            [ 2] 1325 	ldw (DBLHI,sp),y 
      009598 5B 01 81         [ 2] 1326 	ldw x,acc16 
      00959B CD 15 5A         [ 4] 1327 	call div32_16 
      0015C4                       1328 	_drop VSIZE 
      00959B 52 03            [ 2]    1     addw sp,#VSIZE 
      00959D 1F               [ 4] 1329 	ret
                                   1330 
                                   1331 
                                   1332 ;----------------------------------
                                   1333 ;  remainder resulting from euclidian 
                                   1334 ;  division of x/y 
                                   1335 ; input:
                                   1336 ;   x   	dividend int16_t 
                                   1337 ;   y 		divisor int16_t
                                   1338 ; output:
                                   1339 ;   X       n1%n2 
                                   1340 ;----------------------------------
      0015C7                       1341 modulo:
      00959E 01 1E 08         [ 4] 1342 	call divide
      0095A1 16               [ 1] 1343 	ldw x,y 
      0095A2 06               [ 4] 1344 	ret 
                                   1345 
                                   1346 ;----------------------------------
                                   1347 ; BASIC: MULDIV(expr1,expr2,expr3)
                                   1348 ; return expr1*expr2/expr3 
                                   1349 ; product result is int32_t and 
                                   1350 ; divisiont is int32_t/int16_t
                                   1351 ;----------------------------------
                           000004  1352 	DBL_SIZE=4 
      0015CC                       1353 muldiv:
      0095A3 90 5D 26         [ 4] 1354 	call func_args 
      0095A6 06 16            [ 1] 1355 	cp a,#3 
      0095A8 01 65            [ 1] 1356 	jreq 1$
      0095AA 5B 03 81         [ 2] 1357 	jp syntax_error
      0095AD                       1358 1$: 
      0095AD 51 A6            [ 2] 1359 	ldw x,(5,sp) ; expr1
      0095AF 11 6B            [ 2] 1360 	ldw y,(3,sp) ; expr2
      0095B1 03 14 F8         [ 4] 1361 	call multiply 
      0095B2 1F 05            [ 2] 1362 	ldw (5,sp),x  ;int32_t 15..0
      0095B2 13 01            [ 2] 1363 	ldw (3,sp),y  ;int32_t 31..16
      0095B4 2B               [ 2] 1364 	popw x        ; expr3 
      0095B5 03 72 F0         [ 4] 1365 	call div32_16 ; int32_t/expr3 
      0015E5                       1366 	_drop DBL_SIZE
      0095B8 01 8C            [ 2]    1     addw sp,#DBL_SIZE 
      0095BA 90               [ 4] 1367 	ret 
                                   1368 
                                   1369 
                                   1370 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



                                   1371 ; dictionary search 
                                   1372 ; input:
                                   1373 ;	X 		dictionary entry point, name field  
                                   1374 ;   y		.asciz name to search 
                                   1375 ; output:
                                   1376 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   1377 ;  X		cmd_index
                                   1378 ;---------------------------------
                           000001  1379 	NLEN=1 ; cmd length 
                           000002  1380 	XSAVE=2
                           000004  1381 	YSAVE=4
                           000005  1382 	VSIZE=5 
      0015E8                       1383 search_dict::
      0015E8                       1384 	_vars VSIZE 
      0095BB 59 59            [ 2]    1     sub sp,#VSIZE 
                                   1385 
      0095BD 0A 03            [ 2] 1386 	ldw (YSAVE,sp),y 
      0015EC                       1387 search_next:
      0095BF 26 F1            [ 2] 1388 	ldw (XSAVE,sp),x 
                                   1389 ; get name length in dictionary	
      0095C1 51               [ 1] 1390 	ld a,(x)
      0095C2 5B 03            [ 1] 1391 	and a,#0xf 
      0095C4 81 01            [ 1] 1392 	ld (NLEN,sp),a  
      0095C5 16 04            [ 2] 1393 	ldw y,(YSAVE,sp) ; name pointer 
      0095C5 53               [ 1] 1394 	incw x 
      0015F6                       1395 cp_loop:
      0095C6 90 53            [ 1] 1396 	ld a,(y)
      0095C8 1C 00            [ 1] 1397 	jreq str_match 
      0095CA 01 24            [ 1] 1398 	tnz (NLEN,sp)
      0095CC 02 90            [ 1] 1399 	jreq no_match  
      0095CE 5C               [ 1] 1400 	cp a,(x)
      0095CF 81 07            [ 1] 1401 	jrne no_match 
      0095D0 90 5C            [ 1] 1402 	incw y 
      0095D0 90               [ 1] 1403 	incw x
      0095D1 5F 9E            [ 1] 1404 	dec (NLEN,sp)
      0095D3 A4 80            [ 2] 1405 	jra cp_loop 
      001608                       1406 no_match:
      0095D5 27 02            [ 2] 1407 	ldw x,(XSAVE,sp) 
      0095D7 90 53 81         [ 2] 1408 	subw x,#2 ; move X to link field
      0095DA 4B 00            [ 1] 1409 	push #TK_NONE 
      0095DA 52               [ 2] 1410 	ldw x,(x) ; next word link 
      0095DB 08               [ 1] 1411 	pop a ; TK_NONE 
      0095DC 0F 05            [ 1] 1412 	jreq search_exit  ; not found  
                                   1413 ;try next 
      0095DE 0F 06            [ 2] 1414 	jra search_next
      001615                       1415 str_match:
      0095E0 16 0B            [ 2] 1416 	ldw x,(XSAVE,sp)
      0095E2 17               [ 1] 1417 	ld a,(X)
      0095E3 01 16            [ 1] 1418 	ld (NLEN,sp),a ; needed to test keyword type  
      0095E5 0D 17            [ 1] 1419 	and a,#0xf 
                                   1420 ; move x to procedure address field 	
      0095E7 03               [ 1] 1421 	inc a 
      0095E8 5D 26 05         [ 1] 1422 	ld acc8,a 
      0095EB A6 04 CC 92      [ 1] 1423 	clr acc16 
      0095EF 1C 9E A4 80      [ 2] 1424 	addw x,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      0095F3 27               [ 2] 1425 	ldw x,(x) ; routine index  
                                   1426 ;determine keyword type bits 7:6 
      0095F4 05 03            [ 1] 1427 	ld a,(NLEN,sp)
      0095F6 05               [ 1] 1428 	swap a 
      0095F7 03 06            [ 1] 1429 	and a,#0xc
      0095F9 50               [ 1] 1430 	srl a
      0095FA 1F               [ 1] 1431 	srl a 
      0095FB 07 7B            [ 1] 1432 	add a,#128
      001632                       1433 search_exit: 
      001632                       1434 	_drop VSIZE 	 
      0095FD 01 A4            [ 2]    1     addw sp,#VSIZE 
      0095FF 80               [ 4] 1435 	ret 
                                   1436 
                                   1437 ;---------------------
                                   1438 ; check if next token
                                   1439 ;  is of expected type 
                                   1440 ; input:
                                   1441 ;   A 		 expected token attribute
                                   1442 ;  ouput:
                                   1443 ;   none     if fail call syntax_error 
                                   1444 ;--------------------
      001635                       1445 expect:
      009600 27               [ 1] 1446 	push a 
      009601 0D 03 06         [ 4] 1447 	call next_token 
      009604 1E 03            [ 1] 1448 	cp a,(1,sp)
      009606 16 01            [ 1] 1449 	jreq 1$
      009608 CD 95 C5         [ 2] 1450 	jp syntax_error
      00960B 1F               [ 1] 1451 1$: pop a 
      00960C 03               [ 4] 1452 	ret 
                                   1453 
                                   1454 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1455 ; parse arguments list 
                                   1456 ; between ()
                                   1457 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001642                       1458 func_args:
      00960D 17 01            [ 1] 1459 	ld a,#TK_LPAREN 
      00960F 1E 07 CD         [ 4] 1460 	call expect 
                                   1461 ; expected to continue in arg_list 
                                   1462 ; caller must check for TK_RPAREN 
                                   1463 
                                   1464 ;-------------------------------
                                   1465 ; parse embedded BASIC routines 
                                   1466 ; arguments list.
                                   1467 ; arg_list::=  rel[','rel]*
                                   1468 ; all arguments are of integer type
                                   1469 ; and pushed on stack 
                                   1470 ; input:
                                   1471 ;   none
                                   1472 ; output:
                                   1473 ;   stack{n}   arguments pushed on stack
                                   1474 ;   A 	number of arguments pushed on stack  
                                   1475 ;--------------------------------
      001647                       1476 arg_list:
      009612 95 9B            [ 1] 1477 	push #0  
      009614 90 5D 27         [ 4] 1478 1$: call relation
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      009617 11 7B            [ 1] 1479 	cp a,#TK_NONE 
      009619 06 18            [ 1] 1480 	jreq 5$
      00961B 05 27            [ 1] 1481 	cp a,#TK_INTGR
      00961D 0B 5C            [ 1] 1482 	jrne 4$
      001654                       1483 3$: 
                                   1484 ; swap return address with argument
      00961F 90               [ 1] 1485 	pop a ; arg_count
      009620 CF 00            [ 2] 1486 	popw y ; return address 
      009622 0D               [ 2] 1487 	pushw x ; new argument 
      009623 16 07            [ 2] 1488 	pushw y 
      009625 72               [ 1] 1489     inc a
      009626 B2               [ 1] 1490 	push a 
      009627 00 0D 7B         [ 4] 1491 	call next_token 
      00962A 06 27            [ 1] 1492 	cp a,#TK_COMMA 
      00962C 01 50            [ 1] 1493 	jreq 1$ 
      00962E A1 00            [ 1] 1494 	cp a,#TK_NONE 
      00962E 5B 08            [ 1] 1495 	jreq 5$ 
      009630 81 08            [ 1] 1496 4$:	cp a,#TK_RPAREN 
      009631 27 05            [ 1] 1497 	jreq 5$
      00166B                       1498 	_unget_token 
      009631 52 04 90 CF 00   [ 1]    1      mov in,in.saved  
      009636 0D               [ 1] 1499 5$:	pop a  
      009637 CD               [ 4] 1500 	ret 
                                   1501 
                                   1502 ;--------------------------------
                                   1503 ;   BASIC commnands 
                                   1504 ;--------------------------------
                                   1505 
                                   1506 ;--------------------------------
                                   1507 ;  arithmetic and relational 
                                   1508 ;  routines
                                   1509 ;  operators precedence
                                   1510 ;  highest to lowest
                                   1511 ;  operators on same row have 
                                   1512 ;  same precedence and are executed
                                   1513 ;  from left to right.
                                   1514 ;	'*','/','%'
                                   1515 ;   '-','+'
                                   1516 ;   '=','>','<','>=','<=','<>','><'
                                   1517 ;   '<>' and '><' are equivalent for not equal.
                                   1518 ;--------------------------------
                                   1519 
                                   1520 ;---------------------
                                   1521 ; return array element
                                   1522 ; address from @(expr)
                                   1523 ; input:
                                   1524 ;   A 		TK_ARRAY
                                   1525 ; output:
                                   1526 ;   A 		TK_INTGR
                                   1527 ;	X 		element address 
                                   1528 ;----------------------
      001672                       1529 get_array_element:
      009638 95 D0 1F         [ 4] 1530 	call func_args 
      00963B 03 17            [ 1] 1531 	cp a,#1
      00963D 01 CE            [ 1] 1532 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00963F 00 0D CD         [ 2] 1533 	jp syntax_error
      009642 95               [ 2] 1534 1$: popw x 
                                   1535 	; check for bounds 
      009643 DA 5B 04         [ 2] 1536 	cpw x,array_size 
      009646 81 05            [ 2] 1537 	jrule 3$
                                   1538 ; bounds {1..array_size}	
      009647 A6 0A            [ 1] 1539 2$: ld a,#ERR_BAD_VALUE 
      009647 CD 96 31         [ 2] 1540 	jp tb_error 
      00964A 93               [ 2] 1541 3$: tnzw  x
      00964B 81 F8            [ 1] 1542 	jreq 2$ 
      00964C 58               [ 2] 1543 	sllw x 
      00964C CD               [ 2] 1544 	pushw x 
      00964D 96 C2 A1         [ 2] 1545 	ldw x,#tib
      009650 03 27 03         [ 2] 1546 	subw x,(1,sp)
      001692                       1547 	_drop 2   
      009653 CC 92            [ 2]    1     addw sp,#2 
      009655 1A 84            [ 1] 1548 	ld a,#TK_INTGR
      009656 81               [ 4] 1549 	ret 
                                   1550 
                                   1551 
                                   1552 ;***********************************
                                   1553 ;   expression parse,execute 
                                   1554 ;***********************************
                                   1555 ;-----------------------------------
                                   1556 ; factor ::= ['+'|'-'|e]  var | @ |
                                   1557 ;			 integer | function |
                                   1558 ;			 '('relation')' 
                                   1559 ; output:
                                   1560 ;   A    token attribute 
                                   1561 ;   X 	 integer
                                   1562 ; ---------------------------------
                           000001  1563 	NEG=1
                           000001  1564 	VSIZE=1
      001697                       1565 factor:
      001697                       1566 	_vars VSIZE 
      009656 1E 05            [ 2]    1     sub sp,#VSIZE 
      009658 16 03 CD         [ 4] 1567 	call next_token
      00965B 95 78            [ 1] 1568 	cp a,#CMD_END  
      00965D 1F 05            [ 1] 1569 	jrult 16$
      00965F 17 03            [ 1] 1570 1$:	ld (NEG,sp),a 
      009661 85 CD            [ 1] 1571 	and a,#TK_GRP_MASK
      009663 95 DA            [ 1] 1572 	cp a,#TK_GRP_ADD 
      009665 5B 04            [ 1] 1573 	jreq 2$
      009667 81 01            [ 1] 1574 	ld a,(NEG,sp)
      009668 20 03            [ 2] 1575 	jra 4$  
      0016AC                       1576 2$:	
      009668 52 05 17         [ 4] 1577 	call next_token 
      0016AF                       1578 4$:	
      00966B 04 81            [ 1] 1579 	cp a,#TK_IFUNC 
      00966C 26 03            [ 1] 1580 	jrne 5$ 
      00966C 1F               [ 4] 1581 	call (x) 
      00966D 02 F6            [ 2] 1582 	jra 18$ 
      0016B6                       1583 5$:
      00966F A4 0F            [ 1] 1584 	cp a,#TK_INTGR
      009671 6B 01            [ 1] 1585 	jrne 6$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      009673 16 04            [ 2] 1586 	jra 18$
      0016BC                       1587 6$:
      009675 5C 06            [ 1] 1588 	cp a,#TK_ARRAY
      009676 26 06            [ 1] 1589 	jrne 10$
      009676 90 F6 27         [ 4] 1590 	call get_array_element
      009679 1B               [ 2] 1591 	ldw x,(x)
      00967A 0D 01            [ 2] 1592 	jra 18$ 
      0016C6                       1593 10$:
      00967C 27 0A            [ 1] 1594 	cp a,#TK_VAR 
      00967E F1 26            [ 1] 1595 	jrne 12$
      009680 07               [ 2] 1596 	ldw x,(x)
      009681 90 5C            [ 2] 1597 	jra 18$
      0016CD                       1598 12$:			
      009683 5C 0A            [ 1] 1599 	cp a,#TK_LPAREN
      009685 01 20            [ 1] 1600 	jrne 16$
      009687 EE 17 8F         [ 4] 1601 	call relation
      009688 89               [ 2] 1602 	pushw x 
      009688 1E 02            [ 1] 1603 	ld a,#TK_RPAREN 
      00968A 1D 00 02         [ 4] 1604 	call expect
      00968D 4B               [ 2] 1605 	popw x 
      00968E 00 FE            [ 2] 1606 	jra 18$	
      0016DD                       1607 16$:
      009690 84               [ 1] 1608 	tnz a 
      009691 27 1F            [ 1] 1609 	jreq 20$ 
      0016E0                       1610 	_unget_token
      009693 20 D7 02 00 01   [ 1]    1      mov in,in.saved  
      009695 4F               [ 1] 1611 	clr a 
      009695 1E 02            [ 2] 1612 	jra 20$ 
      0016E8                       1613 18$: 
      009697 F6 6B            [ 1] 1614 	ld a,#TK_MINUS 
      009699 01 A4            [ 1] 1615 	cp a,(NEG,sp)
      00969B 0F 4C            [ 1] 1616 	jrne 19$
      00969D C7               [ 2] 1617 	negw x
      0016EF                       1618 19$:
      00969E 00 0E            [ 1] 1619 	ld a,#TK_INTGR
      0016F1                       1620 20$:
      0016F1                       1621 	_drop VSIZE
      0096A0 72 5F            [ 2]    1     addw sp,#VSIZE 
      0096A2 00               [ 4] 1622 	ret
                                   1623 
                                   1624 ;-----------------------------------
                                   1625 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   1626 ; output:
                                   1627 ;   A    	token attribute 
                                   1628 ;	X		integer
                                   1629 ;-----------------------------------
                           000001  1630 	N1=1   ; int16_t
                           000003  1631 	MULOP=3
                           000003  1632 	VSIZE=3
      0016F4                       1633 term:
      0016F4                       1634 	_vars VSIZE
      0096A3 0D 72            [ 2]    1     sub sp,#VSIZE 
      0096A5 BB 00 0D         [ 4] 1635 	call factor
      0096A8 FE               [ 1] 1636 	tnz a 
      0096A9 7B 01            [ 1] 1637 	jreq term_exit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      0016FC                       1638 term01:	 ; check for  operator 
      0096AB 4E A4            [ 2] 1639 	ldw (N1,sp),x  ; save first factor 
      0096AD 0C 44 44         [ 4] 1640 	call next_token
      0096B0 AB 80            [ 1] 1641 	ld (MULOP,sp),a
      0096B2 A1 02            [ 1] 1642 	cp a,#CMD_END
      0096B2 5B 05            [ 1] 1643 	jrult 8$
      0096B4 81 30            [ 1] 1644 	and a,#TK_GRP_MASK
      0096B5 A1 20            [ 1] 1645 	cp a,#TK_GRP_MULT
      0096B5 88 CD            [ 1] 1646 	jreq 1$
      0096B7 93 1B            [ 2] 1647 	jra 8$
      00170F                       1648 1$:	; got *|/|%
      0096B9 11 01 27         [ 4] 1649 	call factor
      0096BC 03 CC            [ 1] 1650 	cp a,#TK_INTGR
      0096BE 92 1A            [ 1] 1651 	jreq 2$
      0096C0 84 81 9A         [ 2] 1652 	jp syntax_error
      0096C2 90 93            [ 1] 1653 2$:	ldw y,x 
      0096C2 A6 07            [ 2] 1654 	ldw x,(N1,sp)
      0096C4 CD 96            [ 1] 1655 	ld a,(MULOP,sp) 
      0096C6 B5 20            [ 1] 1656 	cp a,#TK_MULT 
      0096C7 26 05            [ 1] 1657 	jrne 3$
      0096C7 4B 00 CD         [ 4] 1658 	call multiply 
      0096CA 98 0F            [ 2] 1659 	jra term01
      0096CC A1 00            [ 1] 1660 3$: cp a,#TK_DIV 
      0096CE 27 20            [ 1] 1661 	jrne 4$ 
      0096D0 A1 84 26         [ 4] 1662 	call divide 
      0096D3 13 CB            [ 2] 1663 	jra term01 
      0096D4 CD 15 C7         [ 4] 1664 4$: call modulo
      0096D4 84 90            [ 2] 1665 	jra term01 
      0096D6 85 89            [ 1] 1666 8$: ld a,(MULOP,sp)
      0096D8 90 89            [ 1] 1667 	jreq 9$ 
      00173A                       1668 	_unget_token
      0096DA 4C 88 CD 93 1B   [ 1]    1      mov in,in.saved  
      0096DF A1 09            [ 2] 1669 9$: ldw x,(N1,sp)
      0096E1 27 E6            [ 1] 1670 	ld a,#TK_INTGR 	
      001743                       1671 term_exit:
      001743                       1672 	_drop VSIZE 
      0096E3 A1 00            [ 2]    1     addw sp,#VSIZE 
      0096E5 27               [ 4] 1673 	ret 
                                   1674 
                                   1675 ;-------------------------------
                                   1676 ;  expr ::= term [['+'|'-'] term]*
                                   1677 ;  result range {-32768..32767}
                                   1678 ;  output:
                                   1679 ;   A    token attribute 
                                   1680 ;   X	 integer   
                                   1681 ;-------------------------------
                           000001  1682 	N1=1
                           000003  1683 	N2=3 
                           000005  1684 	OP=5 
                           000005  1685 	VSIZE=5 
      001746                       1686 expression:
      001746                       1687 	_vars VSIZE 
      0096E6 09 A1            [ 2]    1     sub sp,#VSIZE 
      0096E8 08 27 05         [ 4] 1688 	call term
      0096EB 55               [ 1] 1689 	tnz a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      0096EC 00 03            [ 1] 1690 	jreq expr_exit 
      0096EE 00 02            [ 2] 1691 1$:	ldw (N1,sp),x 
      0096F0 84 81 9B         [ 4] 1692 	call next_token
      0096F2 6B 05            [ 1] 1693 	ld (OP,sp),a 
      0096F2 CD 96            [ 1] 1694 	cp a,#CMD_END 
      0096F4 C2 A1            [ 1] 1695 	jrult 8$ 
      0096F6 01 27            [ 1] 1696 	and a,#TK_GRP_MASK
      0096F8 03 CC            [ 1] 1697 	cp a,#TK_GRP_ADD 
      0096FA 92 1A            [ 1] 1698 	jreq 2$ 
      0096FC 85 C3            [ 2] 1699 	jra 8$
      001761                       1700 2$: 
      0096FE 00 1F 23         [ 4] 1701 	call term
      009701 05 A6            [ 1] 1702 	cp a,#TK_INTGR
      009703 0A CC            [ 1] 1703 	jreq 3$
      009705 92 1C 5D         [ 2] 1704 	jp syntax_error
      009708 27 F8            [ 2] 1705 3$:	ldw (N2,sp),x 
      00970A 58 89            [ 2] 1706 	ldw x,(N1,sp)
      00970C AE 16            [ 1] 1707 	ld a,(OP,sp)
      00970E 90 72            [ 1] 1708 	cp a,#TK_PLUS 
      009710 F0 01            [ 1] 1709 	jrne 4$
      009712 5B 02 A6         [ 2] 1710 	addw x,(N2,sp)
      009715 84 81            [ 2] 1711 	jra 1$ 
      009717 72 F0 03         [ 2] 1712 4$:	subw x,(N2,sp)
      009717 52 01            [ 2] 1713 	jra 1$
      009719 CD 93            [ 1] 1714 8$: ld a,(OP,sp)
      00971B 1B A1            [ 1] 1715 	jreq 9$ 
      001783                       1716 	_unget_token	
      00971D 02 25 3D 6B 01   [ 1]    1      mov in,in.saved  
      009722 A4 30            [ 2] 1717 9$: ldw x,(N1,sp)
      009724 A1 10            [ 1] 1718 	ld a,#TK_INTGR	
      00178C                       1719 expr_exit:
      00178C                       1720 	_drop VSIZE 
      009726 27 04            [ 2]    1     addw sp,#VSIZE 
      009728 7B               [ 4] 1721 	ret 
                                   1722 
                                   1723 ;---------------------------------------------
                                   1724 ; rel ::= expr rel_op expr
                                   1725 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   1726 ;  relation return  integer , zero is false 
                                   1727 ;  output:
                                   1728 ;    A 		token attribute  
                                   1729 ;	 X		integer 
                                   1730 ;---------------------------------------------
                           000001  1731 	N1=1
                           000003  1732 	RELOP=3
                           000003  1733 	VSIZE=3 
      00178F                       1734 relation: 
      00178F                       1735 	_vars VSIZE
      009729 01 20            [ 2]    1     sub sp,#VSIZE 
      00972B 03 17 46         [ 4] 1736 	call expression
      00972C 4D               [ 1] 1737 	tnz a 
      00972C CD 93            [ 1] 1738 	jreq rel_exit
      00972E 1B 01            [ 2] 1739 	ldw (N1,sp),x 
                                   1740 ; expect rel_op or leave 
      00972F CD 12 9B         [ 4] 1741 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00972F A1 81            [ 1] 1742 	ld (RELOP,sp),a 
      009731 26 03            [ 1] 1743 	and a,#TK_GRP_MASK
      009733 FD 20            [ 1] 1744 	cp a,#TK_GRP_RELOP 
      009735 32 33            [ 1] 1745 	jrne 8$
      009736                       1746 2$:	; expect another expression
      009736 A1 84 26         [ 4] 1747 	call expression
      009739 02 20            [ 1] 1748 	cp a,#TK_INTGR
      00973B 2C 03            [ 1] 1749 	jreq 3$
      00973C CC 11 9A         [ 2] 1750 	jp syntax_error 
      00973C A1 06 26         [ 2] 1751 3$:	ldw acc16,x 
      00973F 06 CD            [ 2] 1752 	ldw x,(N1,sp) 
      009741 96 F2 FE 20      [ 2] 1753 	subw x,acc16
      009745 22 06            [ 1] 1754 	jrne 4$
      009746 35 02 00 0D      [ 1] 1755 	mov acc8,#2 ; n1==n2
      009746 A1 85            [ 2] 1756 	jra 6$ 
      0017BF                       1757 4$: 
      009748 26 03            [ 1] 1758 	jrsgt 5$  
      00974A FE 20 1B 0D      [ 1] 1759 	mov acc8,#4 ; n1<2 
      00974D 20 04            [ 2] 1760 	jra 6$
      0017C7                       1761 5$:
      00974D A1 07 26 0C      [ 1] 1762 	mov acc8,#1 ; n1>n2 
      0017CB                       1763 6$:
      009751 CD               [ 1] 1764 	clrw x 
      009752 98 0F 89         [ 1] 1765 	ld a, acc8  
      009755 A6 08            [ 1] 1766 	and a,(RELOP,sp)
      009757 CD               [ 1] 1767 	tnz a 
      009758 96 B5            [ 1] 1768 	jreq 10$
      00975A 85               [ 1] 1769 	incw x 
      00975B 20 0B            [ 2] 1770 	jra 10$  	
      00975D 7B 03            [ 1] 1771 8$: ld a,(RELOP,sp)
      00975D 4D 27            [ 1] 1772 	jreq 9$
      0017DB                       1773 	_unget_token
      00975F 11 55 00 03 00   [ 1]    1      mov in,in.saved  
      0017E0                       1774 9$: 
      009764 02 4F            [ 2] 1775 	ldw x,(N1,sp)
      0017E2                       1776 10$:
      009766 20 09            [ 1] 1777 	ld a,#TK_INTGR
      009768                       1778 rel_exit:
      0017E4                       1779 	_drop VSIZE
      009768 A6 11            [ 2]    1     addw sp,#VSIZE 
      00976A 11               [ 4] 1780 	ret 
                                   1781 
                                   1782 ;--------------------------------
                                   1783 ; BASIC: SHOW 
                                   1784 ; print stack content in hexadecimal bytes 
                                   1785 ; 16 bytes per row 
                                   1786 ;--------------------------------
      0017E7                       1787 show:
      00976B 01 26 01         [ 2] 1788 	ldw x,#cstk_prompt
      00976E 50 03 4E         [ 4] 1789 	call puts 
      00976F 96               [ 1] 1790 	ldw x,sp 
      00976F A6 84 03         [ 2] 1791 	addw x,#3 ; ignore return address
      009771 90 AE 18 00      [ 2] 1792 	ldw y,#RAM_SIZE  
      009771 5B 01 81         [ 2] 1793 	ldw acc16,x 
      009774 72 B2 00 0C      [ 2] 1794 	subw y,acc16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      009774 52 03 CD         [ 4] 1795 	call hex_dump
      009777 97               [ 1] 1796 	clr a 
      009778 17               [ 4] 1797 	ret
                                   1798 
      009779 4D 27 47 6E 74 65 6E  1799 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             74 20 6F 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   1800 
                                   1801 
                                   1802 ;--------------------------------------------
                                   1803 ; BASIC: HEX 
                                   1804 ; select hexadecimal base for integer print
                                   1805 ;---------------------------------------------
      00977C                       1806 hex_base:
      00977C 1F 01 CD 93      [ 1] 1807 	mov base,#16 
      009780 1B               [ 4] 1808 	ret 
                                   1809 
                                   1810 ;--------------------------------------------
                                   1811 ; BASIC: DEC 
                                   1812 ; select decimal base for integer print
                                   1813 ;---------------------------------------------
      00182D                       1814 dec_base:
      009781 6B 03 A1 02      [ 1] 1815 	mov base,#10
      009785 25               [ 4] 1816 	ret 
                                   1817 
                                   1818 ;------------------------
                                   1819 ; BASIC: FREE 
                                   1820 ; return free size in RAM 
                                   1821 ; output:
                                   1822 ;   A 		TK_INTGR
                                   1823 ;   X 	    size integer
                                   1824 ;--------------------------
      001832                       1825 free:
      009786 2F A4 30         [ 2] 1826 	ldw x,#tib 
      009789 A1 20 27 02      [ 2] 1827 	ldw y,txtbgn 
      00978D 20 27 2B 80      [ 2] 1828 	cpw y,#app_space
      00978F 25 05            [ 1] 1829 	jrult 1$
      00978F CD 97 17         [ 2] 1830 	subw x,#free_ram 
      009792 A1 84            [ 2] 1831 	jra 2$ 
      001844                       1832 1$:	
      009794 27 03 CC 92      [ 2] 1833 	subw x,txtend 
      009798 1A 90            [ 1] 1834 2$:	ld a,#TK_INTGR
      00979A 93               [ 4] 1835 	ret 
                                   1836 
                                   1837 ;------------------------------
                                   1838 ; BASIC: SIZE 
                                   1839 ; command that print 
                                   1840 ; program start addres and size 
                                   1841 ;------------------------------
      00184B                       1842 cmd_size:
      00979B 1E 01 7B         [ 1] 1843 	push base 
      00979E 03 A1 20         [ 2] 1844 	ldw x,#PROG_ADDR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      0097A1 26 05 CD         [ 4] 1845 	call puts 
      0097A4 95 78 20         [ 2] 1846 	ldw x,txtbgn     
      0097A7 D4 A1 21 26      [ 1] 1847 	mov base,#16 
      0097AB 05 CD 96         [ 4] 1848 	call print_int
      0097AE 31 20 CB         [ 1] 1849 	pop base 
      0097B1 CD 96 47         [ 2] 1850 	ldw x,#PROG_SIZE 
      0097B4 20 C6 7B         [ 4] 1851 	call puts 
      0097B7 03 27 05         [ 2] 1852 	ldw x,txtend 
      0097BA 55 00 03 00      [ 2] 1853 	subw x,txtbgn 
      0097BE 02 1E 01         [ 4] 1854 	call print_int
      0097C1 A6 84 99         [ 2] 1855 	ldw x,#STR_BYTES 
      0097C3 CD 03 4E         [ 4] 1856 	call puts  
      0097C3 5B               [ 4] 1857 	ret 
                                   1858 
                                   1859 
      0097C4 03 81 6F 67 72 61 6D  1860 PROG_ADDR: .asciz "program address: "
             20 61 64 64 72 65 73
             73 3A 20 00
      0097C6 70 72 6F 67 72 61 6D  1861 PROG_SIZE: .asciz "program size: "
             20 73 69 7A 65 3A 20
             00
      0097C6 52 05 CD 97 74 4D 27  1862 STR_BYTES: .asciz "bytes\n" 
                                   1863 
                                   1864 ;------------------------
                                   1865 ; BASIC: UBOUND  
                                   1866 ; return array variable size 
                                   1867 ; output:
                                   1868 ;   A 		TK_INTGR
                                   1869 ;   X 	    array size 
                                   1870 ;--------------------------
      0018A0                       1871 ubound:
      0097CD 3E 1F 01         [ 4] 1872 	call free 
      0097D0 CD               [ 2] 1873 	srlw x 
      0097D1 93 1B 6B         [ 2] 1874 	ldw array_size,x
      0097D4 05 A1            [ 1] 1875 	ld a,#TK_INTGR
      0097D6 02               [ 4] 1876 	ret 
                                   1877 
                                   1878 ;-----------------------------
                                   1879 ; BASIC: LET var=expr 
                                   1880 ; variable assignement 
                                   1881 ; output:
                                   1882 ;   A 		TK_NONE 
                                   1883 ;-----------------------------
      0018AA                       1884 let::
      0097D7 25 26 A4         [ 4] 1885 	call next_token 
      0097DA 30 A1            [ 1] 1886 	cp a,#TK_VAR 
      0097DC 10 27            [ 1] 1887 	jreq let_var
      0097DE 02 20            [ 1] 1888 	cp a,#TK_ARRAY 
      0097E0 1E 03            [ 1] 1889 	jreq  let_array
      0097E1 CC 11 9A         [ 2] 1890 	jp syntax_error
      0018B8                       1891 let_array:
      0097E1 CD 97 74         [ 4] 1892 	call get_array_element
      0018BB                       1893 let_var:
      0097E4 A1               [ 2] 1894 	pushw x  
      0097E5 84 27 03         [ 4] 1895 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      0097E8 CC 92            [ 1] 1896 	cp a,#TK_EQUAL
      0097EA 1A 1F            [ 1] 1897 	jreq 1$
      0097EC 03 1E 01         [ 2] 1898 	jp syntax_error
      0018C6                       1899 1$:	
      0097EF 7B 05 A1         [ 4] 1900 	call relation   
      0097F2 10 26            [ 1] 1901 	cp a,#TK_INTGR 
      0097F4 05 72            [ 1] 1902 	jreq 2$
      0097F6 FB 03 20         [ 2] 1903 	jp syntax_error
      0018D0                       1904 2$:	
      0097F9 D4 72            [ 1] 1905 	ldw y,x 
      0097FB F0               [ 2] 1906 	popw x   
      0097FC 03               [ 2] 1907 	ldw (x),y   
      0097FD 20               [ 4] 1908 	ret 
                                   1909 
                                   1910 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1911 ; return program size 
                                   1912 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018D5                       1913 prog_size:
      0097FE CF 7B 05         [ 2] 1914 	ldw x,txtend 
      009801 27 05 55 00      [ 2] 1915 	subw x,txtbgn 
      009805 03               [ 4] 1916 	ret 
                                   1917 
                                   1918 ;----------------------------
                                   1919 ; BASIC: LIST [[start][,end]]
                                   1920 ; list program lines 
                                   1921 ; form start to end 
                                   1922 ; if empty argument list then 
                                   1923 ; list all.
                                   1924 ;----------------------------
                           000001  1925 	FIRST=1
                           000003  1926 	LAST=3 
                           000005  1927 	LN_PTR=5
                           000006  1928 	VSIZE=6 
      0018DD                       1929 list:
      009806 00 02 1E         [ 2] 1930 	ldw x,txtbgn 
      009809 01 A6 84         [ 2] 1931 	cpw x,txtend 
      00980C 2B 01            [ 1] 1932 	jrmi 1$
      00980C 5B               [ 4] 1933 	ret 
      0018E6                       1934 1$:	
      00980D 05 81 8A         [ 2] 1935 	ldw x,#PROG_SIZE
      00980F CD 03 4E         [ 4] 1936 	call puts 
      00980F 52 03 CD         [ 2] 1937 	ldw x,txtend 
      009812 97 C6 4D 27      [ 2] 1938 	subw x,txtbgn 
      009816 4D 1F 01         [ 4] 1939 	call print_int 
      009819 CD 93 1B         [ 2] 1940 	ldw x,#STR_BYTES 
      00981C 6B 03 A4         [ 4] 1941 	call puts 
      0018FC                       1942 	_vars VSIZE
      00981F 30 A1            [ 2]    1     sub sp,#VSIZE 
      009821 30 26 33         [ 2] 1943 	ldw x,txtbgn 
      009824 1F 05            [ 2] 1944 	ldw (LN_PTR,sp),x 
      009824 CD               [ 2] 1945 	ldw x,(x) 
      009825 97 C6            [ 2] 1946 	ldw (FIRST,sp),x ; list from first line 
      009827 A1 84 27         [ 2] 1947 	ldw x,#MAX_LINENO ; biggest line number 
      00982A 03 CC            [ 2] 1948 	ldw (LAST,sp),x 
      00982C 92 1A CF         [ 4] 1949 	call arg_list
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      00982F 00               [ 1] 1950 	tnz a
      009830 0D 1E            [ 1] 1951 	jreq list_loop 
      009832 01 72            [ 1] 1952 	cp a,#2 
      009834 B0 00            [ 1] 1953 	jreq 4$
      009836 0D 26            [ 1] 1954 	cp a,#1 
      009838 06 35            [ 1] 1955 	jreq first_line 
      00983A 02 00 0E         [ 2] 1956 	jp syntax_error 
      00983D 20               [ 2] 1957 4$:	popw x 
      00983E 0C 05            [ 2] 1958 	ldw (LAST+2,sp),x 
      00983F                       1959 first_line:
      00983F 2C               [ 2] 1960 	popw x
      009840 06 35            [ 2] 1961 	ldw (FIRST,sp),x 
      001922                       1962 lines_skip:
      009842 04 00 0E         [ 2] 1963 	ldw x,txtbgn
      009845 20 04            [ 2] 1964 2$:	ldw (LN_PTR,sp),x 
      009847 C3 00 1B         [ 2] 1965 	cpw x,txtend 
      009847 35 01            [ 1] 1966 	jrpl list_exit 
      009849 00               [ 2] 1967 	ldw x,(x) ;line# 
      00984A 0E 01            [ 2] 1968 	cpw x,(FIRST,sp)
      00984B 2A 11            [ 1] 1969 	jrpl list_loop 
      00984B 5F C6            [ 2] 1970 	ldw x,(LN_PTR,sp) 
      00984D 00 0E            [ 1] 1971 	ld a,(2,x)
      00984F 14 03 4D         [ 1] 1972 	ld acc8,a 
      009852 27 0E 5C 20      [ 1] 1973 	clr acc16 
      009856 0B 7B 03 27      [ 2] 1974 	addw x,acc16
      00985A 05 55            [ 2] 1975 	jra 2$ 
                                   1976 ; print loop
      001942                       1977 list_loop:
      00985C 00 03            [ 2] 1978 	ldw x,(LN_PTR,sp)
      00985E 00 02            [ 1] 1979 	ld a,(2,x) 
      009860 CD 19 B6         [ 4] 1980 	call prt_basic_line
      009860 1E 01            [ 2] 1981 	ldw x,(LN_PTR,sp)
      009862 E6 02            [ 1] 1982 	ld a,(2,x)
      009862 A6 84 0D         [ 1] 1983 	ld acc8,a 
      009864 72 5F 00 0C      [ 1] 1984 	clr acc16 
      009864 5B 03 81 0C      [ 2] 1985 	addw x,acc16
      009867 C3 00 1B         [ 2] 1986 	cpw x,txtend 
      009867 AE 98            [ 1] 1987 	jrpl list_exit
      009869 81 CD            [ 2] 1988 	ldw (LN_PTR,sp),x
      00986B 83               [ 2] 1989 	ldw x,(x)
      00986C CE 96            [ 2] 1990 	cpw x,(LAST,sp)  
      00986E 1C 00            [ 1] 1991 	jrslt list_loop
      001964                       1992 list_exit:
      009870 03 90 AE 18 00   [ 1] 1993 	mov in,count 
      009875 CF 00 0D         [ 2] 1994 	ldw x,#pad 
      009878 72 B2 00         [ 2] 1995 	ldw basicptr,x 
      00196F                       1996 	_drop VSIZE 
      00987B 0D CD            [ 2]    1     addw sp,#VSIZE 
      00987D 8E               [ 4] 1997 	ret
                                   1998 
                                   1999 
                                   2000 ;--------------------------
                                   2001 ; BASIC: EDIT \E | \F
                                   2002 ;  copy program in FLASH 
                                   2003 ;  to RAM for edition 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



                                   2004 ;-------------------------
      001972                       2005 edit:
      00987E 56 4F 81         [ 4] 2006 	call qsign 
      009881 0A 63            [ 1] 2007 	jreq 1$ 
      009883 6F 6E 74         [ 2] 2008 	ldw x,#NOT_SAVED 
      009886 65 6E 74         [ 4] 2009 	call puts 
      009889 20               [ 4] 2010 	ret 
      00197E                       2011 1$: 
      00988A 6F 66 20 73      [ 2] 2012 	ldw y,#app_sign ; source address 
      00988E 74 61 63         [ 2] 2013     ldw x,app_size  
      009891 6B 20 66         [ 2] 2014 	addw x,#4 
      009894 72 6F 6D         [ 2] 2015 	ldw acc16,x  ; bytes to copy 
      009897 20 74 6F         [ 2] 2016 	ldw x,#rsign ; destination address 
      00989A 70 20 74         [ 4] 2017 	call move  
      00989D 6F 20 62         [ 2] 2018 	ldw x,#free_ram 
      0098A0 6F 74 74         [ 2] 2019 	ldw txtbgn,x 
      0098A3 6F 6D 3A 0A      [ 2] 2020 	addw x,rsize  
      0098A7 00 00 1B         [ 2] 2021 	ldw txtend,x 
      0098A8 81               [ 4] 2022 	ret 
                                   2023 
      0098A8 35 10 00 0B 81 70 6C  2024 NOT_SAVED: .asciz "No application saved.\n"
             69 63 61 74 69 6F 6E
             20 73 61 76 65 64 2E
             0A 00
                                   2025 
                                   2026 ;--------------------------
                                   2027 ; decompile line from token list
                                   2028 ; and print it. 
                                   2029 ; input:
                                   2030 ;   A       stop at this position 
                                   2031 ;   X 		pointer at line
                                   2032 ; output:
                                   2033 ;   none 
                                   2034 ;--------------------------	
      0098AD                       2035 prt_basic_line:
      0098AD 35 0A 00         [ 1] 2036 	ld count,a 
      0098B0 0B 81            [ 1] 2037 	ld a,(2,x)
      0098B2 C1 00 03         [ 1] 2038 	cp a,count 
      0098B2 AE 16            [ 1] 2039 	jrpl 1$ 
      0098B4 90 90 CE         [ 1] 2040 	ld count,a 
      0098B7 00 1A 90         [ 2] 2041 1$:	ldw basicptr,x 
      0098BA A3 AC 00 25      [ 2] 2042 	ldw y,#tib  
      0098BE 05 1D 00         [ 4] 2043 	call decompile 
      0098C1 80 20 04         [ 4] 2044 	call puts 
      0098C4 A6 0D            [ 1] 2045 	ld a,#CR 
      0098C4 72 B0 00         [ 4] 2046 	call putc 
      0098C7 1C               [ 4] 2047 	ret 
                                   2048 
                                   2049 
                                   2050 
                                   2051 ;---------------------------------
                                   2052 ; BASIC: PRINT|? arg_list 
                                   2053 ; print values from argument list
                                   2054 ;----------------------------------
                           000001  2055 	CCOMMA=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



                           000001  2056 	VSIZE=1
      0019D6                       2057 print:
      0019D6                       2058 	_vars VSIZE 
      0098C8 A6 84            [ 2]    1     sub sp,#VSIZE 
      0019D8                       2059 reset_comma:
      0098CA 81 01            [ 1] 2060 	clr (CCOMMA,sp)
      0098CB                       2061 prt_loop:
      0098CB 3B 00 0B         [ 4] 2062 	call next_token
      0098CE AE 98            [ 1] 2063 	cp a,#CMD_END 
      0098D0 F8 CD            [ 1] 2064 	jrult print_exit ; colon or end of line 
      0098D2 83 CE            [ 1] 2065 	cp a,#TK_QSTR
      0098D4 CE 00            [ 1] 2066 	jreq 1$
      0098D6 1A 35            [ 1] 2067 	cp a,#TK_CHAR 
      0098D8 10 00            [ 1] 2068 	jreq 2$ 
      0098DA 0B CD            [ 1] 2069 	cp a,#TK_CFUNC 
      0098DC 93 69            [ 1] 2070 	jreq 3$
      0098DE 32 00            [ 1] 2071 	cp a,#TK_COMMA 
      0098E0 0B AE            [ 1] 2072 	jreq 4$
      0098E2 99 0A            [ 1] 2073 	cp a,#TK_SHARP 
      0098E4 CD 83            [ 1] 2074 	jreq 5$
      0098E6 CE CE            [ 2] 2075 	jra 7$ 
      0019F7                       2076 1$:	; print string 
      0098E8 00 1C 72         [ 4] 2077 	call puts
      0098EB B0 00            [ 2] 2078 	jra reset_comma
      0019FC                       2079 2$:	; print character 
      0098ED 1A               [ 1] 2080 	ld a,xl 
      0098EE CD 93 69         [ 4] 2081 	call putc 
      0098F1 AE 99            [ 2] 2082 	jra reset_comma 
      001A02                       2083 3$: ; print character function value  	
      0098F3 19               [ 4] 2084 	call (x)
      0098F4 CD               [ 1] 2085 	ld a,xl 
      0098F5 83 CE 81         [ 4] 2086 	call putc
      0098F8 70 72            [ 2] 2087 	jra reset_comma 
      001A09                       2088 4$: ; set comma state 
      0098FA 6F 67            [ 1] 2089 	cpl (CCOMMA,sp)
      0098FC 72 61            [ 2] 2090 	jra prt_loop   
      001A0D                       2091 5$: ; # character must be followed by an integer   
      0098FE 6D 20 61         [ 4] 2092 	call next_token
      009901 64 64            [ 1] 2093 	cp a,#TK_INTGR 
      009903 72 65            [ 1] 2094 	jreq 6$
      009905 73 73 3A         [ 2] 2095 	jp syntax_error 
      001A17                       2096 6$: ; set tab width
      009908 20               [ 1] 2097 	ld a,xl 
      009909 00 70            [ 1] 2098 	and a,#15 
      00990B 72 6F 67         [ 1] 2099 	ld tab_width,a 
      00990E 72 61            [ 2] 2100 	jra reset_comma 
      001A1F                       2101 7$:	
      001A1F                       2102 	_unget_token 
      009910 6D 20 73 69 7A   [ 1]    1      mov in,in.saved  
      009915 65 3A 20         [ 4] 2103 	call relation 
      009918 00 62            [ 1] 2104 	cp a,#TK_INTGR 
      00991A 79 74            [ 1] 2105 	jrne print_exit 
      00991C 65 73 0A         [ 4] 2106     call print_int 
      00991F 00 A8            [ 2] 2107 	jra reset_comma 
      009920                       2108 print_exit:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      009920 CD 98            [ 1] 2109 	tnz (CCOMMA,sp)
      009922 B2 54            [ 1] 2110 	jrne 9$
      009924 CF 00            [ 1] 2111 	ld a,#CR 
      009926 1F A6 84         [ 4] 2112     call putc 
      001A39                       2113 9$:	_drop VSIZE 
      009929 81 01            [ 2]    1     addw sp,#VSIZE 
      00992A 81               [ 4] 2114 	ret 
                                   2115 
                                   2116 ;----------------------
                                   2117 ; 'save_context' and
                                   2118 ; 'rest_context' must be 
                                   2119 ; called at the same 
                                   2120 ; call stack depth 
                                   2121 ; i.e. SP must have the 
                                   2122 ; save value at  
                                   2123 ; entry point of both 
                                   2124 ; routine. 
                                   2125 ;---------------------
                           000004  2126 	CTXT_SIZE=4 ; size of saved data 
                                   2127 ;--------------------
                                   2128 ; save current BASIC
                                   2129 ; interpreter context 
                                   2130 ; on stack 
                                   2131 ;--------------------
      001A3C                       2132 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001A3C                       2133 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001A3C                       2134 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      001A3C                       2135 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      001A3C                       2136 save_context:
      00992A CD 93 1B         [ 2] 2137 	ldw x,basicptr 
      00992D A1 85            [ 2] 2138 	ldw (BPTR,sp),x
      00992F 27 0A A1         [ 1] 2139 	ld a,in 
      009932 06 27            [ 1] 2140 	ld (IN,sp),a
      009934 03 CC 92         [ 1] 2141 	ld a,count 
      009937 1A 06            [ 1] 2142 	ld (CNT,sp),a  
      009938 81               [ 4] 2143 	ret
                                   2144 
                                   2145 ;-----------------------
                                   2146 ; restore previously saved 
                                   2147 ; BASIC interpreter context 
                                   2148 ; from stack 
                                   2149 ;-------------------------
      001A4C                       2150 rest_context:
      009938 CD 96            [ 2] 2151 	ldw x,(BPTR,sp)
      00993A F2 00 04         [ 2] 2152 	ldw basicptr,x 
      00993B 7B 05            [ 1] 2153 	ld a,(IN,sp)
      00993B 89 CD 93         [ 1] 2154 	ld in,a
      00993E 1B A1            [ 1] 2155 	ld a,(CNT,sp)
      009940 32 27 03         [ 1] 2156 	ld count,a  
      009943 CC               [ 4] 2157 	ret
                                   2158 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



                                   2159 
                                   2160 
                                   2161 ;------------------------------------------
                                   2162 ; BASIC: INPUT [string]var[,[string]var]
                                   2163 ; input value in variables 
                                   2164 ; [string] optionally can be used as prompt 
                                   2165 ;-----------------------------------------
                           000001  2166 	CX_BPTR=1
                           000003  2167 	CX_IN=3
                           000004  2168 	CX_CNT=4
                           000005  2169 	SKIP=5
                           000006  2170 	VAR_ADDR=6
                           000007  2171 	VSIZE=7
      001A5C                       2172 input_var:
      001A5C                       2173 	_vars VSIZE 
      009944 92 1A            [ 2]    1     sub sp,#VSIZE 
      009946                       2174 input_loop:
      009946 CD 98            [ 1] 2175 	clr (SKIP,sp)
      009948 0F A1 84         [ 4] 2176 	call next_token 
      00994B 27 03            [ 1] 2177 	cp a,#TK_QSTR 
      00994D CC 92            [ 1] 2178 	jrne 1$ 
      00994F 1A 03 4E         [ 4] 2179 	call puts 
      009950 03 05            [ 1] 2180 	cpl (SKIP,sp)
      009950 90 93 85         [ 4] 2181 	call next_token 
      009953 FF 81            [ 1] 2182 1$: cp a,#TK_VAR  
      009955 27 03            [ 1] 2183 	jreq 2$ 
      009955 CE 00 1C         [ 2] 2184 	jp syntax_error
      009958 72 B0            [ 2] 2185 2$:	ldw (VAR_ADDR,sp),x 
      00995A 00 1A            [ 1] 2186 	tnz (SKIP,sp)
      00995C 81 06            [ 1] 2187 	jrne 21$ 
      00995D CD 0B 9F         [ 4] 2188 	call var_name 
      00995D CE 00 1A         [ 4] 2189 	call putc   
      001A82                       2190 21$:
      009960 C3 00            [ 1] 2191 	ld a,#':
      009962 1C 2B 01         [ 4] 2192 	call putc 
      009965 81 1A 3C         [ 4] 2193 	call save_context 
      009966 72 5F 00 03      [ 1] 2194 	clr count  
      009966 AE 99 0A         [ 4] 2195 	call readln 
      009969 CD 83 CE         [ 2] 2196 	ldw x,#tib 
      00996C CE 00 1C         [ 1] 2197 	push count
      00996F 72 B0            [ 1] 2198 	push #0 
      009971 00 1A CD         [ 2] 2199 	addw x,(1,sp)
      009974 93               [ 1] 2200 	incw x 
      001A9D                       2201 	_drop 2 
      009975 69 AE            [ 2]    1     addw sp,#2 
      009977 99 19 CD 83      [ 1] 2202 	clr in 
      00997B CE 52 06         [ 4] 2203 	call get_token
      00997E CE 00            [ 1] 2204 	cp a,#TK_INTGR
      009980 1A 1F            [ 1] 2205 	jreq 3$ 
      009982 05 FE            [ 1] 2206 	cp a,#TK_MINUS
      009984 1F 01 AE         [ 4] 2207 	call get_token 
      009987 7F FF            [ 1] 2208 	cp a,#TK_INTGR 
      009989 1F 03            [ 1] 2209 	jreq 22$
      00998B CD 96 C7         [ 4] 2210 	call rest_context 
      00998E 4D 27 31         [ 2] 2211 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      001AB9                       2212 22$:
      009991 A1               [ 2] 2213 	negw x 	
      009992 02 27            [ 2] 2214 3$: ldw y,(VAR_ADDR,sp) 
      009994 07 A1            [ 2] 2215 	ldw (y),x 
      009996 01 27 06         [ 4] 2216 	call rest_context
      009999 CC 92 1A         [ 4] 2217 	call next_token 
      00999C 85 1F            [ 1] 2218 	cp a,#TK_COMMA 
      00999E 05 96            [ 1] 2219 	jreq input_loop
      00999F A1 00            [ 1] 2220 	cp a,#TK_NONE 
      00999F 85 1F            [ 1] 2221 	jreq input_exit  
      0099A1 01 0B            [ 1] 2222 	cp a,#TK_COLON 
      0099A2 27 03            [ 1] 2223     jreq input_exit 
      0099A2 CE 00 1A         [ 2] 2224 	jp syntax_error 
      001AD3                       2225 input_exit:
      001AD3                       2226 	_drop VSIZE 
      0099A5 1F 05            [ 2]    1     addw sp,#VSIZE 
      0099A7 C3               [ 4] 2227 	ret 
                                   2228 
                                   2229 
                                   2230 ;---------------------
                                   2231 ; BASIC: REMARK | ' 
                                   2232 ; skip comment to end of line 
                                   2233 ;---------------------- 
      001AD6                       2234 remark::
      0099A8 00 1C 2A 38 FE   [ 1] 2235 	mov in,count 
      0099AD 13               [ 4] 2236  	ret 
                                   2237 
                                   2238 
                                   2239 ;---------------------
                                   2240 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2241 ; read in loop 'addr'  
                                   2242 ; apply & 'mask' to value 
                                   2243 ; loop while result==0.  
                                   2244 ; 'xor_mask' is used to 
                                   2245 ; invert the wait logic.
                                   2246 ; i.e. loop while not 0.
                                   2247 ;---------------------
                           000001  2248 	XMASK=1 
                           000002  2249 	MASK=2
                           000003  2250 	ADDR=3
                           000004  2251 	VSIZE=4
      001ADC                       2252 wait: 
      001ADC                       2253 	_vars VSIZE
      0099AE 01 2A            [ 2]    1     sub sp,#VSIZE 
      0099B0 11 1E            [ 1] 2254 	clr (XMASK,sp) 
      0099B2 05 E6 02         [ 4] 2255 	call arg_list 
      0099B5 C7 00            [ 1] 2256 	cp a,#2
      0099B7 0E 72            [ 1] 2257 	jruge 0$
      0099B9 5F 00 0D         [ 2] 2258 	jp syntax_error 
      0099BC 72 BB            [ 1] 2259 0$:	cp a,#3
      0099BE 00 0D            [ 1] 2260 	jrult 1$
      0099C0 20               [ 2] 2261 	popw x 
      0099C1 E3               [ 1] 2262 	ld a,xl
      0099C2 6B 01            [ 1] 2263 	ld (XMASK,sp),a 
      0099C2 1E               [ 2] 2264 1$: popw x ; mask 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      0099C3 05               [ 1] 2265 	ld a,xl 
      0099C4 E6 02            [ 1] 2266 	ld (MASK,sp),a 
      0099C6 CD               [ 2] 2267 	popw x ; address 
      0099C7 9A               [ 1] 2268 2$:	ld a,(x)
      0099C8 36 1E            [ 1] 2269 	and a,(MASK,sp)
      0099CA 05 E6            [ 1] 2270 	xor a,(XMASK,sp)
      0099CC 02 C7            [ 1] 2271 	jreq 2$ 
      001AFE                       2272 	_drop VSIZE 
      0099CE 00 0E            [ 2]    1     addw sp,#VSIZE 
      0099D0 72               [ 4] 2273 	ret 
                                   2274 
                                   2275 ;---------------------
                                   2276 ; BASIC: BSET addr,mask
                                   2277 ; set bits at 'addr' corresponding 
                                   2278 ; to those of 'mask' that are at 1.
                                   2279 ; arguments:
                                   2280 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2281 ;   mask        mask|addr
                                   2282 ; output:
                                   2283 ;	none 
                                   2284 ;--------------------------
      001B01                       2285 bit_set:
      0099D1 5F 00 0D         [ 4] 2286 	call arg_list 
      0099D4 72 BB            [ 1] 2287 	cp a,#2	 
      0099D6 00 0D            [ 1] 2288 	jreq 1$ 
      0099D8 C3 00 1C         [ 2] 2289 	jp syntax_error
      001B0B                       2290 1$: 
      0099DB 2A               [ 2] 2291 	popw x ; mask 
      0099DC 07               [ 1] 2292 	ld a,xl 
      0099DD 1F               [ 2] 2293 	popw x ; addr  
      0099DE 05               [ 1] 2294 	or a,(x)
      0099DF FE               [ 1] 2295 	ld (x),a
      0099E0 13               [ 4] 2296 	ret 
                                   2297 
                                   2298 ;---------------------
                                   2299 ; BASIC: BRES addr,mask
                                   2300 ; reset bits at 'addr' corresponding 
                                   2301 ; to those of 'mask' that are at 1.
                                   2302 ; arguments:
                                   2303 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2304 ;   mask	    ~mask&*addr  
                                   2305 ; output:
                                   2306 ;	none 
                                   2307 ;--------------------------
      001B11                       2308 bit_reset:
      0099E1 03 2F DE         [ 4] 2309 	call arg_list 
      0099E4 A1 02            [ 1] 2310 	cp a,#2  
      0099E4 55 00            [ 1] 2311 	jreq 1$ 
      0099E6 04 00 02         [ 2] 2312 	jp syntax_error
      001B1B                       2313 1$: 
      0099E9 AE               [ 2] 2314 	popw x ; mask 
      0099EA 16               [ 1] 2315 	ld a,xl 
      0099EB E0               [ 1] 2316 	cpl a 
      0099EC CF               [ 2] 2317 	popw x ; addr  
      0099ED 00               [ 1] 2318 	and a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      0099EE 05               [ 1] 2319 	ld (x),a 
      0099EF 5B               [ 4] 2320 	ret 
                                   2321 
                                   2322 ;---------------------
                                   2323 ; BASIC: BTOGL addr,mask
                                   2324 ; toggle bits at 'addr' corresponding 
                                   2325 ; to those of 'mask' that are at 1.
                                   2326 ; arguments:
                                   2327 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2328 ;   mask	    mask^*addr  
                                   2329 ; output:
                                   2330 ;	none 
                                   2331 ;--------------------------
      001B22                       2332 bit_toggle:
      0099F0 06 81 47         [ 4] 2333 	call arg_list 
      0099F2 A1 02            [ 1] 2334 	cp a,#2 
      0099F2 CD A0            [ 1] 2335 	jreq 1$ 
      0099F4 58 27 07         [ 2] 2336 	jp syntax_error
      0099F7 AE               [ 2] 2337 1$: popw x ; mask 
      0099F8 9A               [ 1] 2338 	ld a,xl 
      0099F9 1F               [ 2] 2339 	popw x ; addr  
      0099FA CD               [ 1] 2340 	xor a,(x)
      0099FB 83               [ 1] 2341 	ld (x),a 
      0099FC CE               [ 4] 2342 	ret 
                                   2343 
                                   2344 
                                   2345 ;---------------------
                                   2346 ; BASIC: BTEST(addr,bit)
                                   2347 ; return bit value at 'addr' 
                                   2348 ; bit is in range {0..7}.
                                   2349 ; arguments:
                                   2350 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2351 ;   bit 	    bit position {0..7}  
                                   2352 ; output:
                                   2353 ;	none 
                                   2354 ;--------------------------
      001B32                       2355 bit_test:
      0099FD 81 16 42         [ 4] 2356 	call func_args 
      0099FE A1 02            [ 1] 2357 	cp a,#2
      0099FE 90 AE            [ 1] 2358 	jreq 0$
      009A00 AC 00 CE         [ 2] 2359 	jp syntax_error
      001B3C                       2360 0$:	
      009A03 AC               [ 2] 2361 	popw x 
      009A04 02               [ 1] 2362 	ld a,xl 
      009A05 1C 00            [ 1] 2363 	and a,#7
      009A07 04               [ 1] 2364 	push a   
      009A08 CF 00            [ 1] 2365 	ld a,#1 
      009A0A 0D AE            [ 1] 2366 1$: tnz (1,sp)
      009A0C 00 7C            [ 1] 2367 	jreq 2$
      009A0E CD               [ 1] 2368 	sll a 
      009A0F 8E C1            [ 1] 2369 	dec (1,sp)
      009A11 AE 00            [ 2] 2370 	jra 1$
      001B4C                       2371 2$: _drop 1 
      009A13 80 CF            [ 2]    1     addw sp,#1 
      009A15 00               [ 2] 2372 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      009A16 1A               [ 1] 2373 	and a,(x)
      009A17 72 BB            [ 1] 2374 	jreq 3$
      009A19 00 7E            [ 1] 2375 	ld a,#1 
      009A1B CF               [ 1] 2376 3$:	clrw x 
      009A1C 00               [ 1] 2377 	ld xl,a 
      009A1D 1C 81            [ 1] 2378 	ld a,#TK_INTGR
      009A1F 4E               [ 4] 2379 	ret
                                   2380 
                                   2381 
                                   2382 ;--------------------
                                   2383 ; BASIC: POKE addr,byte
                                   2384 ; put a byte at addr 
                                   2385 ;--------------------
      001B59                       2386 poke:
      009A20 6F 20 61         [ 4] 2387 	call arg_list 
      009A23 70 70            [ 1] 2388 	cp a,#2
      009A25 6C 69            [ 1] 2389 	jreq 1$
      009A27 63 61 74         [ 2] 2390 	jp syntax_error
      001B63                       2391 1$:	
      009A2A 69               [ 2] 2392 	popw x  
      009A2B 6F               [ 1] 2393     ld a,xl 
      009A2C 6E               [ 2] 2394 	popw x 
      009A2D 20               [ 1] 2395 	ld (x),a 
      009A2E 73               [ 4] 2396 	ret 
                                   2397 
                                   2398 ;-----------------------
                                   2399 ; BASIC: PEEK(addr)
                                   2400 ; get the byte at addr 
                                   2401 ; input:
                                   2402 ;	none 
                                   2403 ; output:
                                   2404 ;	X 		value 
                                   2405 ;-----------------------
      001B68                       2406 peek:
      009A2F 61 76 65         [ 4] 2407 	call func_args
      009A32 64 2E            [ 1] 2408 	cp a,#1 
      009A34 0A 00            [ 1] 2409 	jreq 1$
      009A36 CC 11 9A         [ 2] 2410 	jp syntax_error
      009A36 C7               [ 2] 2411 1$: popw x 
      009A37 00               [ 1] 2412 	ld a,(x)
      009A38 04               [ 1] 2413 	clrw x 
      009A39 E6               [ 1] 2414 	ld xl,a 
      009A3A 02 C1            [ 1] 2415 	ld a,#TK_INTGR
      009A3C 00               [ 4] 2416 	ret 
                                   2417 
                                   2418 ;---------------------------
                                   2419 ; BASIC IF expr : instructions
                                   2420 ; evaluate expr and if true 
                                   2421 ; execute instructions on same line. 
                                   2422 ;----------------------------
      001B79                       2423 if: 
      009A3D 04 2A 03         [ 4] 2424 	call relation 
      009A40 C7 00            [ 1] 2425 	cp a,#TK_INTGR
      009A42 04 CF            [ 1] 2426 	jreq 1$ 
      009A44 00 05 90         [ 2] 2427 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      009A47 AE               [ 1] 2428 1$:	clr a 
      009A48 16               [ 2] 2429 	tnzw x 
      009A49 90 CD            [ 1] 2430 	jrne 9$  
                                   2431 ;skip to next line
      009A4B 8C 48 CD 83 CE   [ 1] 2432 	mov in,count
      009A50 A6               [ 4] 2433 9$:	ret 
                                   2434 
                                   2435 ;------------------------
                                   2436 ; BASIC: FOR var=expr 
                                   2437 ; set variable to expression 
                                   2438 ; leave variable address 
                                   2439 ; on stack and set
                                   2440 ; FLOOP bit in 'flags'
                                   2441 ;-----------------
                           000001  2442 	RETL1=1 ; return address  
                           000003  2443 	FSTEP=3  ; variable increment
                           000005  2444 	LIMIT=5 ; loop limit 
                           000007  2445 	CVAR=7   ; control variable 
                           000009  2446 	INW=9   ;  in.w saved
                           00000B  2447 	BPTR=11 ; baseptr saved
                           00000A  2448 	VSIZE=10  
      001B8D                       2449 for: ; { -- var_addr }
      009A51 0D               [ 2] 2450 	popw x ; call return address 
      001B8E                       2451 	_vars VSIZE 
      009A52 CD 83            [ 2]    1     sub sp,#VSIZE 
      009A54 71               [ 2] 2452 	pushw x  ; RETL1 
      009A55 81 85            [ 1] 2453 	ld a,#TK_VAR 
      009A56 CD 16 35         [ 4] 2454 	call expect
      009A56 52 01            [ 2] 2455 	ldw (CVAR,sp),x  ; control variable 
      009A58 CD 18 BB         [ 4] 2456 	call let_var 
      009A58 0F 01 00 20      [ 1] 2457 	bset flags,#FLOOP 
                                   2458 ; open space on stack for loop data 
      009A5A 5F               [ 1] 2459 	clrw x 
      009A5A CD 93            [ 2] 2460 	ldw (BPTR,sp),x 
      009A5C 1B A1            [ 2] 2461 	ldw (INW,sp),x 
      009A5E 02 25 4F         [ 4] 2462 	call next_token 
      009A61 A1 02            [ 1] 2463 	cp a,#TK_CMD 
      009A63 27 12            [ 1] 2464 	jreq 1$
      009A65 A1 03 27         [ 2] 2465 	jp syntax_error
      001BAE                       2466 1$:  
      009A68 13 A1 82         [ 2] 2467 	cpw x,#to 
      009A6B 27 15            [ 1] 2468 	jreq to
      009A6D A1 09 27         [ 2] 2469 	jp syntax_error 
                                   2470 
                                   2471 ;-----------------------------------
                                   2472 ; BASIC: TO expr 
                                   2473 ; second part of FOR loop initilization
                                   2474 ; leave limit on stack and set 
                                   2475 ; FTO bit in 'flags'
                                   2476 ;-----------------------------------
      001BB6                       2477 to: ; { var_addr -- var_addr limit step }
      009A70 18 A1 0A 27 18   [ 2] 2478 	btjt flags,#FLOOP,1$
      009A75 20 28 9A         [ 2] 2479 	jp syntax_error
      009A77 CD 17 8F         [ 4] 2480 1$: call relation  
      009A77 CD 83            [ 1] 2481 	cp a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      009A79 CE 20            [ 1] 2482 	jreq 2$ 
      009A7B DC 11 9A         [ 2] 2483 	jp syntax_error
      009A7C 1F 05            [ 2] 2484 2$: ldw (LIMIT,sp),x
                                   2485 ;	ldw x,in.w 
      009A7C 9F CD 83         [ 4] 2486 	call next_token
      009A7F 71 20            [ 1] 2487 	cp a,#TK_NONE  
      009A81 D6 0E            [ 1] 2488 	jreq 4$ 
      009A82 A1 80            [ 1] 2489 	cp a,#TK_CMD
      009A82 FD 9F            [ 1] 2490 	jrne 3$
      009A84 CD 83 71         [ 2] 2491 	cpw x,#step 
      009A87 20 CF            [ 1] 2492 	jreq step
      009A89                       2493 3$:	
      001BDA                       2494 	_unget_token   	 
      009A89 03 01 20 CD 01   [ 1]    1      mov in,in.saved  
      009A8D                       2495 4$:	
      009A8D CD 93 1B         [ 2] 2496 	ldw x,#1   ; default step  
      009A90 A1 84            [ 2] 2497 	ldw (FSTEP,sp),x 
      009A92 27 03            [ 2] 2498 	jra store_loop_addr 
                                   2499 
                                   2500 
                                   2501 ;----------------------------------
                                   2502 ; BASIC: STEP expr 
                                   2503 ; optional third par of FOR loop
                                   2504 ; initialization. 	
                                   2505 ;------------------------------------
      001BE6                       2506 step: ; {var limit -- var limit step}
      009A94 CC 92 1A 20 03   [ 2] 2507 	btjt flags,#FLOOP,1$
      009A97 CC 11 9A         [ 2] 2508 	jp syntax_error
      009A97 9F A4 0F         [ 4] 2509 1$: call relation
      009A9A C7 00            [ 1] 2510 	cp a,#TK_INTGR
      009A9C 22 20            [ 1] 2511 	jreq 2$
      009A9E B9 11 9A         [ 2] 2512 	jp syntax_error
      009A9F 1F 03            [ 2] 2513 2$:	ldw (FSTEP,sp),x ; step
                                   2514 ; leave loop back entry point on cstack 
                                   2515 ; cstack is 1 call deep from interpreter
      001BFA                       2516 store_loop_addr:
      009A9F 55 00 03         [ 2] 2517 	ldw x,basicptr  
      009AA2 00 02            [ 2] 2518 	ldw (BPTR,sp),x 
      009AA4 CD 98 0F         [ 2] 2519 	ldw x,in.w 
      009AA7 A1 84            [ 2] 2520 	ldw (INW,sp),x   
      009AA9 26 05 CD 93      [ 1] 2521 	bres flags,#FLOOP 
      009AAD 69 20 A8 1D      [ 1] 2522 	inc loop_depth  
      009AB0 81               [ 4] 2523 	ret 
                                   2524 
                                   2525 ;--------------------------------
                                   2526 ; BASIC: NEXT var 
                                   2527 ; FOR loop control 
                                   2528 ; increment variable with step 
                                   2529 ; and compare with limit 
                                   2530 ; loop if threshold not crossed.
                                   2531 ; else stack. 
                                   2532 ; and decrement 'loop_depth' 
                                   2533 ;--------------------------------
      001C0D                       2534 next: ; {var limit step retl1 -- [var limit step ] }
      009AB0 0D 01 26 05      [ 1] 2535 	tnz loop_depth 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      009AB4 A6 0D            [ 1] 2536 	jrne 1$ 
      009AB6 CD 83 71         [ 2] 2537 	jp syntax_error 
      001C16                       2538 1$: 
      009AB9 5B 01            [ 1] 2539 	ld a,#TK_VAR 
      009ABB 81 16 35         [ 4] 2540 	call expect
                                   2541 ; check for good variable after NEXT 	 
      009ABC 13 07            [ 2] 2542 	cpw x,(CVAR,sp)
      009ABC CE 00            [ 1] 2543 	jreq 2$  
      009ABE 05 1F 03         [ 2] 2544 	jp syntax_error ; not the good one 
      001C22                       2545 2$: ; increment variable 
      009AC1 C6               [ 2] 2546 	ldw x,(x)  ; get var value 
      009AC2 00 02 6B         [ 2] 2547 	addw x,(FSTEP,sp) ; var+step 
      009AC5 05 C6            [ 2] 2548 	ldw y,(CVAR,sp)
      009AC7 00 04            [ 2] 2549 	ldw (y),x ; save var new value 
                                   2550 ; check sign of STEP  
      009AC9 6B 06            [ 1] 2551 	ld a,#0x80
      009ACB 81 03            [ 1] 2552 	bcp a,(FSTEP,sp)
      009ACC 2A 06            [ 1] 2553 	jrpl 4$
                                   2554 ;negative step 
      009ACC 1E 03            [ 2] 2555 	cpw x,(LIMIT,sp)
      009ACE CF 00            [ 1] 2556 	jrslt loop_done
      009AD0 05 7B            [ 2] 2557 	jra loop_back 
      001C36                       2558 4$: ; positive step
      009AD2 05 C7            [ 2] 2559 	cpw x,(LIMIT,sp)
      009AD4 00 02            [ 1] 2560 	jrsgt loop_done
      001C3A                       2561 loop_back:
      009AD6 7B 06            [ 2] 2562 	ldw x,(BPTR,sp)
      009AD8 C7 00 04         [ 2] 2563 	ldw basicptr,x 
      009ADB 81 01 00 20 05   [ 2] 2564 	btjf flags,#FRUN,1$ 
      009ADC E6 02            [ 1] 2565 	ld a,(2,x)
      009ADC 52 07 03         [ 1] 2566 	ld count,a
      009ADE 1E 09            [ 2] 2567 1$:	ldw x,(INW,sp)
      009ADE 0F 05 CD         [ 2] 2568 	ldw in.w,x 
      009AE1 93               [ 4] 2569 	ret 
      001C4F                       2570 loop_done:
                                   2571 	; remove loop data from stack  
      009AE2 1B               [ 2] 2572 	popw x
      001C50                       2573 	_drop VSIZE 
      009AE3 A1 02            [ 2]    1     addw sp,#VSIZE 
      009AE5 26 08 CD 83      [ 1] 2574 	dec loop_depth 
                                   2575 ;	pushw x 
                                   2576 ;	ret 
      009AE9 CE               [ 2] 2577 	jp (x)
                                   2578 
                                   2579 ;----------------------------
                                   2580 ; called by goto/gosub
                                   2581 ; to get target line number 
                                   2582 ;---------------------------
      001C57                       2583 get_target_line:
      009AEA 03 05 CD         [ 4] 2584 	call relation 
      009AED 93 1B            [ 1] 2585 	cp a,#TK_INTGR
      009AEF A1 85            [ 1] 2586 	jreq get_target_line_2 
      009AF1 27 03 CC         [ 2] 2587 	jp syntax_error
      001C61                       2588 get_target_line_2:
      009AF4 92               [ 1] 2589 	clr a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      009AF5 1A 1F 06 0D      [ 2] 2590 	ldw y,basicptr 
      009AF9 05 26            [ 2] 2591 	ldw y,(y)
      009AFB 06 CD            [ 2] 2592 	pushw y 
      009AFD 8C 1F            [ 2] 2593 	cpw x,(1,sp)
      009AFF CD 83            [ 2] 2594 	addw sp,#2 
      009B01 71 01            [ 1] 2595 	jrult 11$
      009B02 4C               [ 1] 2596 	inc a 
      001C71                       2597 11$:	
      009B02 A6 3A CD         [ 4] 2598 	call search_lineno  
      009B05 83               [ 2] 2599 	tnzw x 
      009B06 71 CD            [ 1] 2600 	jrne 2$ 
      009B08 9A BC            [ 1] 2601 	ld a,#ERR_NO_LINE 
      009B0A 72 5F 00         [ 2] 2602 	jp tb_error 
      009B0D 04               [ 4] 2603 2$:	ret 
                                   2604 
                                   2605 ;--------------------------------
                                   2606 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2607 ; selective goto or gosub 
                                   2608 ;--------------------------------
                           000003  2609 	RET_ADDR=3
                           000005  2610 	RET_INW=5
                           000004  2611 	VSIZE=4  
      001C7D                       2612 cmd_on:
      009B0E CD 84 D3 AE 16   [ 2] 2613 	btjt flags,#FRUN,0$ 
      009B13 90 3B            [ 1] 2614 	ld a,#ERR_RUN_ONLY
      009B15 00 04 4B         [ 2] 2615 	jp tb_error 
      009B18 00 72 FB         [ 4] 2616 0$:	call expression 
      009B1B 01 5C            [ 1] 2617 	cp a,#TK_INTGR
      009B1D 5B 02            [ 1] 2618 	jreq 1$
      009B1F 72 5F 00         [ 2] 2619 	jp syntax_error
      009B22 02 CD 89         [ 2] 2620 1$: cpw x,#1 
      009B25 6E A1            [ 1] 2621 	jrslt 9$
      009B27 84 27 10         [ 2] 2622 	cpw x,#16 ; no more than 16 arguments 
      009B2A A1 11            [ 1] 2623 	jrugt 9$
      009B2C CD               [ 1] 2624 	ld a,xl 
      009B2D 89               [ 1] 2625 	push a  ; selector  
      009B2E 6E A1 84         [ 4] 2626 	call next_token ; should be GOTO|GOSUB 
      009B31 27 06            [ 1] 2627 	cp a,#TK_CMD 
      009B33 CD 9A            [ 1] 2628 	jreq 2$ 
      009B35 CC CC 92         [ 2] 2629 	jp syntax_error 
      009B38 1A 1D 06         [ 2] 2630 2$: cpw x,#goto 
      009B39 27 08            [ 1] 2631 	jreq 4$
      009B39 50 16 06         [ 2] 2632 	cpw x,#gosub 
      009B3C 90 FF            [ 1] 2633 	jreq 4$ 
      009B3E CD 9A CC         [ 2] 2634 	jp syntax_error 
      009B41 CD               [ 1] 2635 4$: pop a 
      009B42 93               [ 2] 2636 	pushw x ; save routine address 	
      009B43 1B               [ 1] 2637 	push a  ; -- code_addr selector  
      009B44 A1 09 27         [ 4] 2638 5$: call next_token 
      009B47 96 A1            [ 1] 2639 	cp a,#TK_INTGR 
      009B49 00 27            [ 1] 2640 	jreq 52$
      009B4B 07 A1 0B         [ 2] 2641 	jp syntax_error 
      001CC1                       2642 52$: ; got a line number 
      009B4E 27 03            [ 1] 2643 	dec (1,sp) ; decrement selector 
      009B50 CC 92            [ 1] 2644 	jreq 58$ ; this is the selected one 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      009B52 1A 12 9B         [ 4] 2645 	call next_token ; try for the next one 
      009B53 A1 09            [ 1] 2646 	cp a,#TK_COMMA 
      009B53 5B 07            [ 1] 2647 	jreq 5$ 
                                   2648 ; arg list exhausted, selector to big 
                                   2649 ; continue execution on next line 
      001CCC                       2650 	_drop 3 ; drop selector and GOTO|GOSUB address 
      009B55 81 03            [ 2]    1     addw sp,#3 
      009B56 20 2F            [ 2] 2651 	jra 9$
      001CD0                       2652 58$: ;found line# in list 
      001CD0                       2653 	_drop 1 ; discard selector 
      009B56 55 00            [ 2]    1     addw sp,#1 
      009B58 04 00 02 81 01   [ 1] 2654 	mov in,count ; skip to end of this line. 
                                   2655 ; here only the routine address of GOTO|GOSUB is on stack 
                                   2656 ;   X contain target line number 
      009B5C CD 1C 61         [ 4] 2657 8$:	call get_target_line_2
      009B5C 52 04            [ 2] 2658 	popw y ; routine address GOTO|GOSUB  
      009B5E 0F 01 CD 96      [ 2] 2659 	cpw y,#goto 
      009B62 C7 A1            [ 1] 2660 	jreq jp_to_target 
      009B64 02 24            [ 2] 2661 	popw y 
      001CE4                       2662 	_vars VSIZE 
      009B66 03 CC            [ 2]    1     sub sp,#VSIZE 
      009B68 92 1A            [ 2] 2663 	pushw y 
      009B6A A1 03 25 04      [ 2] 2664 	ldw y,basicptr 
      009B6E 85 9F 6B 01 85   [ 1] 2665 	mov in,count 
      009B73 9F 6B 02 85      [ 2] 2666 	addw y,in.w 
      009B77 F6 14            [ 2] 2667 	ldw (RET_ADDR,sp),y 
      009B79 02 18 01 27      [ 2] 2668 	ldw y,#3 
      009B7D F9 5B            [ 2] 2669 	ldw (RET_INW,sp),y
      009B7F 04 81            [ 2] 2670 	jra jp_to_target
      009B81                       2671 9$: ; expr out of range skip to next line 
      009B81 CD 96 C7 A1 02   [ 1] 2672 	mov in,count
      009B86 27               [ 1] 2673 	clr a  
      009B87 03               [ 4] 2674 	ret 
                                   2675 
                                   2676 ;------------------------
                                   2677 ; BASIC: GOTO line# 
                                   2678 ; jump to line# 
                                   2679 ; here cstack is 2 call deep from interpreter 
                                   2680 ;------------------------
      001D06                       2681 goto:
      009B88 CC 92 1A 20 05   [ 2] 2682 	btjt flags,#FRUN,0$ 
      009B8B A6 06            [ 1] 2683 	ld a,#ERR_RUN_ONLY
      009B8B 85 9F 85         [ 2] 2684 	jp tb_error 
      009B8E FA F7 81         [ 4] 2685 0$:	call get_target_line
      009B91                       2686 jp_to_target:
      009B91 CD 96 C7         [ 2] 2687 	ldw basicptr,x 
      009B94 A1 02            [ 1] 2688 	ld a,(2,x)
      009B96 27 03 CC         [ 1] 2689 	ld count,a 
      009B99 92 1A 00 01      [ 1] 2690 	mov in,#3 
      009B9B 81               [ 4] 2691 	ret 
                                   2692 
                                   2693 
                                   2694 ;--------------------
                                   2695 ; BASIC: GOSUB line#
                                   2696 ; basic subroutine call
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



                                   2697 ; actual line# and basicptr 
                                   2698 ; are saved on cstack
                                   2699 ; here cstack is 2 call deep from interpreter 
                                   2700 ;--------------------
                           000003  2701 	RET_ADDR=3
                           000005  2702 	RET_INW=5
                           000004  2703 	VSIZE=4  
      001D20                       2704 gosub:
      009B9B 85 9F 43 85 F4   [ 2] 2705 	btjt flags,#FRUN,0$ 
      009BA0 F7 81            [ 1] 2706 	ld a,#ERR_RUN_ONLY
      009BA2 CC 11 9C         [ 2] 2707 	jp tb_error 
      009BA2 CD               [ 4] 2708 	ret 
      009BA3 96               [ 2] 2709 0$:	popw x 
      001D2C                       2710 	_vars VSIZE  
      009BA4 C7 A1            [ 2]    1     sub sp,#VSIZE 
      009BA6 02               [ 2] 2711 	pushw x 
      009BA7 27 03 CC         [ 2] 2712 	ldw x,basicptr
      009BAA 92 1A            [ 2] 2713 	ldw (RET_ADDR,sp),x 
      009BAC 85 9F 85         [ 4] 2714 	call get_target_line  
      009BAF F8               [ 2] 2715 	pushw x 
      009BB0 F7 81 00         [ 2] 2716 	ldw x,in.w 
      009BB2 1F 07            [ 2] 2717 	ldw (RET_INW+2,sp),x
      009BB2 CD               [ 2] 2718 	popw x 
      009BB3 96 C2            [ 2] 2719 	jra jp_to_target
                                   2720 
                                   2721 ;------------------------
                                   2722 ; BASIC: RETURN 
                                   2723 ; exit from a subroutine 
                                   2724 ; 
                                   2725 ;------------------------
      001D40                       2726 return:
      009BB5 A1 02 27 03 CC   [ 2] 2727 	btjt flags,#FRUN,0$ 
      009BBA 92 1A            [ 1] 2728 	ld a,#ERR_RUN_ONLY
      009BBC CC 11 9C         [ 2] 2729 	jp tb_error 
      001D4A                       2730 0$:	
      009BBC 85 9F            [ 2] 2731 	ldw x,(RET_ADDR,sp) 
      009BBE A4 07 88         [ 2] 2732 	ldw basicptr,x
      009BC1 A6 01            [ 1] 2733 	ld a,(2,x)
      009BC3 0D 01 27         [ 1] 2734 	ld count,a  
      009BC6 05 48            [ 2] 2735 	ldw x,(RET_INW,sp)
      009BC8 0A 01 20         [ 2] 2736 	ldw in.w,x 
      009BCB F7               [ 2] 2737 	popw x 
      001D5A                       2738 	_drop VSIZE 
      009BCC 5B 01            [ 2]    1     addw sp,#VSIZE 
      009BCE 85               [ 2] 2739 	pushw x
      009BCF F4               [ 4] 2740 	ret  
                                   2741 
                                   2742 
                                   2743 ;----------------------------------
                                   2744 ; BASIC: RUN
                                   2745 ; run BASIC program in RAM
                                   2746 ;----------------------------------- 
      001D5E                       2747 run: 
      009BD0 27 02 A6 01 5F   [ 2] 2748 	btjf flags,#FRUN,0$  
      009BD5 97               [ 1] 2749 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      009BD6 A6               [ 4] 2750 	ret
      001D65                       2751 0$: 
      009BD7 84 81 00 20 12   [ 2] 2752 	btjf flags,#FBREAK,1$
      009BD9                       2753 	_drop 2 
      009BD9 CD 96            [ 2]    1     addw sp,#2 
      009BDB C7 A1 02         [ 4] 2754 	call rest_context
      001D6F                       2755 	_drop CTXT_SIZE 
      009BDE 27 03            [ 2]    1     addw sp,#CTXT_SIZE 
      009BE0 CC 92 1A 20      [ 1] 2756 	bres flags,#FBREAK 
      009BE3 72 10 00 20      [ 1] 2757 	bset flags,#FRUN 
      009BE3 85 9F 85         [ 2] 2758 	jp interpreter 
      009BE6 F7 81 19         [ 2] 2759 1$:	ldw x,txtbgn
      009BE8 C3 00 1B         [ 2] 2760 	cpw x,txtend 
      009BE8 CD 96            [ 1] 2761 	jrmi run_it 
      009BEA C2 A1 01         [ 2] 2762 	ldw x,#err_no_prog
      009BED 27 03 CC         [ 4] 2763 	call puts 
      009BF0 92 1A 85 F6 5F   [ 1] 2764 	mov in,count
      009BF5 97               [ 4] 2765 	ret 
      001D90                       2766 run_it:	 
      009BF6 A6 84 81         [ 4] 2767     call ubound 
      009BF9                       2768 	_drop 2 ; drop return address 
      009BF9 CD 98            [ 2]    1     addw sp,#2 
                                   2769 ; clear data pointer 
      009BFB 0F               [ 1] 2770 	clrw x 
      009BFC A1 84 27         [ 2] 2771 	ldw data_ptr,x 
      009BFF 03 CC 92 1A      [ 1] 2772 	clr data_ofs 
      009C03 4F 5D 26 05      [ 1] 2773 	clr data_len 
                                   2774 ; initialize BASIC pointer 
      009C07 55 00 04         [ 2] 2775 	ldw x,txtbgn 
      009C0A 00 02 81         [ 2] 2776 	ldw basicptr,x 
      009C0D E6 02            [ 1] 2777 	ld a,(2,x)
      009C0D 85 52 0A         [ 1] 2778 	ld count,a
      009C10 89 A6 85 CD      [ 1] 2779 	mov in,#3	
      009C14 96 B5 1F 07      [ 1] 2780 	bset flags,#FRUN 
      009C18 CD 99 3B         [ 2] 2781 	jp interpreter 
                                   2782 
                                   2783 
                                   2784 ;----------------------
                                   2785 ; BASIC: END
                                   2786 ; end running program
                                   2787 ;---------------------- 
      001DB7                       2788 cmd_end: 
                                   2789 ; clean stack 
      009C1B 72 14 00         [ 2] 2790 	ldw x,#STACK_EMPTY
      009C1E 21               [ 1] 2791 	ldw sp,x 
      009C1F 5F 1F 0B         [ 2] 2792 	jp warm_start
                                   2793 
                                   2794 ;-----------------
                                   2795 ; 1 Khz beep 
                                   2796 ;-----------------
      001DBE                       2797 beep_1khz:: 
      009C22 1F 09 CD         [ 2] 2798 	ldw x,#100
      009C25 93 1B A1 80      [ 2] 2799 	ldw y,#1000
      009C29 27 03            [ 2] 2800 	jra beep
                                   2801 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



                                   2802 ;-----------------------
                                   2803 ; BASIC: TONE expr1,expr2
                                   2804 ; used TIMER2 channel 1
                                   2805 ; to produce a tone 
                                   2806 ; arguments:
                                   2807 ;    expr1   frequency 
                                   2808 ;    expr2   duration msec.
                                   2809 ;---------------------------
      001DC7                       2810 tone:
      009C2B CC 92 1A         [ 4] 2811 	call arg_list 
      009C2E A1 02            [ 1] 2812 	cp a,#2 
      009C2E A3 9C            [ 1] 2813 	jreq 1$
      009C30 36 27 03         [ 2] 2814 	jp syntax_error 
      001DD1                       2815 1$: 
      009C33 CC               [ 2] 2816 	popw x ; duration
      009C34 92 1A            [ 2] 2817 	popw y ; frequency 
      009C36                       2818 beep:  
      009C36 72               [ 2] 2819 	pushw x 
      009C37 04 00 21         [ 2] 2820 	ldw x,#TIM2_CLK_FREQ
      009C3A 03               [ 2] 2821 	divw x,y 
                                   2822 ; round to nearest integer 
      009C3B CC 92 1A CD      [ 2] 2823 	cpw y,#TIM2_CLK_FREQ/2
      009C3F 98 0F            [ 1] 2824 	jrmi 2$
      009C41 A1               [ 1] 2825 	incw x 
      001DE0                       2826 2$:	 
      009C42 84               [ 1] 2827 	ld a,xh 
      009C43 27 03 CC         [ 1] 2828 	ld TIM2_ARRH,a 
      009C46 92               [ 1] 2829 	ld a,xl 
      009C47 1A 1F 05         [ 1] 2830 	ld TIM2_ARRL,a 
                                   2831 ; 50% duty cycle 
      009C4A CD               [ 1] 2832 	ccf 
      009C4B 93               [ 2] 2833 	rrcw x 
      009C4C 1B               [ 1] 2834 	ld a,xh 
      009C4D A1 00 27         [ 1] 2835 	ld TIM2_CCR1H,a 
      009C50 0E               [ 1] 2836 	ld a,xl
      009C51 A1 80 26         [ 1] 2837 	ld TIM2_CCR1L,a
      009C54 05 A3 9C 66      [ 1] 2838 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      009C58 27 0C 53 00      [ 1] 2839 	bset TIM2_CR1,#TIM2_CR1_CEN
      009C5A 72 10 53 04      [ 1] 2840 	bset TIM2_EGR,#TIM2_EGR_UG
      009C5A 55               [ 2] 2841 	popw x 
      009C5B 00 03 00         [ 4] 2842 	call pause02
      009C5E 02 11 53 08      [ 1] 2843 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      009C5F 72 11 53 00      [ 1] 2844 	bres TIM2_CR1,#TIM2_CR1_CEN 
      009C5F AE               [ 4] 2845 	ret 
                                   2846 
                                   2847 ;-------------------------------
                                   2848 ; BASIC: ADCON 0|1 [,divisor]  
                                   2849 ; disable/enanble ADC 
                                   2850 ;-------------------------------
                           000003  2851 	ONOFF=3 
                           000001  2852 	DIVSOR=1
                           000004  2853 	VSIZE=4 
      001E0B                       2854 power_adc:
      009C60 00 01 1F         [ 4] 2855 	call arg_list 
      009C63 03 20            [ 1] 2856 	cp a,#2	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      009C65 14 0B            [ 1] 2857 	jreq 1$
      009C66 A1 01            [ 1] 2858 	cp a,#1 
      009C66 72 04            [ 1] 2859 	jreq 0$ 
      009C68 00 21 03         [ 2] 2860 	jp syntax_error 
      009C6B CC 92 1A         [ 2] 2861 0$: ldw x,#0
      009C6E CD               [ 2] 2862 	pushw x  ; divisor 
      009C6F 98 0F            [ 2] 2863 1$: ldw x,(ONOFF,sp)
      009C71 A1               [ 2] 2864 	tnzw x 
      009C72 84 27            [ 1] 2865 	jreq 2$ 
      009C74 03 CC            [ 2] 2866 	ldw x,(DIVSOR,sp) ; divisor 
      009C76 92               [ 1] 2867 	ld a,xl
      009C77 1A 1F            [ 1] 2868 	and a,#7
      009C79 03               [ 1] 2869 	swap a 
      009C7A C7 54 01         [ 1] 2870 	ld ADC_CR1,a
      009C7A CE 00 05 1F      [ 1] 2871 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      009C7E 0B CE 00 01      [ 1] 2872 	bset ADC_CR1,#ADC_CR1_ADON 
      001E33                       2873 	_usec_dly 7 
      009C82 1F 09 72         [ 2]    1     ldw x,#(16*7-2)/4
      009C85 15               [ 2]    2     decw x
      009C86 00               [ 1]    3     nop 
      009C87 21 72            [ 1]    4     jrne .-4
      009C89 5C 00            [ 2] 2874 	jra 3$
      009C8B 1E 81 54 01      [ 1] 2875 2$: bres ADC_CR1,#ADC_CR1_ADON
      009C8D 72 17 50 CA      [ 1] 2876 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      001E44                       2877 3$:	_drop VSIZE 
      009C8D 72 5D            [ 2]    1     addw sp,#VSIZE 
      009C8F 00               [ 4] 2878 	ret
                                   2879 
                                   2880 ;-----------------------------
                                   2881 ; BASIC: ADCREAD (channel)
                                   2882 ; read adc channel {0..5}
                                   2883 ; output:
                                   2884 ;   A 		TK_INTGR 
                                   2885 ;   X 		value 
                                   2886 ;-----------------------------
      001E47                       2887 analog_read:
      009C90 1E 26 03         [ 4] 2888 	call func_args 
      009C93 CC 92            [ 1] 2889 	cp a,#1 
      009C95 1A 03            [ 1] 2890 	jreq 1$
      009C96 CC 11 9A         [ 2] 2891 	jp syntax_error
      009C96 A6               [ 2] 2892 1$: popw x 
      009C97 85 CD 96         [ 2] 2893 	cpw x,#5 
      009C9A B5 13            [ 2] 2894 	jrule 2$
      009C9C 07 27            [ 1] 2895 	ld a,#ERR_BAD_VALUE
      009C9E 03 CC 92         [ 2] 2896 	jp tb_error 
      009CA1 1A               [ 1] 2897 2$: ld a,xl
      009CA2 C7 00 0D         [ 1] 2898 	ld acc8,a 
      009CA2 FE 72            [ 1] 2899 	ld a,#5
      009CA4 FB 03 16         [ 1] 2900 	sub a,acc8 
      009CA7 07 90 FF         [ 1] 2901 	ld ADC_CSR,a
      009CAA A6 80 15 03      [ 1] 2902 	bset ADC_CR2,#ADC_CR2_ALIGN
      009CAE 2A 06 13 05      [ 1] 2903 	bset ADC_CR1,#ADC_CR1_ADON
      009CB2 2F 1B 20 04 FB   [ 2] 2904 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009CB6 CE 54 04         [ 2] 2905 	ldw x,ADC_DRH
      009CB6 13 05            [ 1] 2906 	ld a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      009CB8 2C               [ 4] 2907 	ret 
                                   2908 
                                   2909 ;-----------------------
                                   2910 ; BASIC: DREAD(pin)
                                   2911 ; Arduino pins 
                                   2912 ; read state of a digital pin 
                                   2913 ; pin# {0..15}
                                   2914 ; output:
                                   2915 ;    A 		TK_INTGR
                                   2916 ;    X      0|1 
                                   2917 ;-------------------------
                           000001  2918 	PINNO=1
                           000001  2919 	VSIZE=1
      001E7B                       2920 digital_read:
      001E7B                       2921 	_vars VSIZE 
      009CB9 15 01            [ 2]    1     sub sp,#VSIZE 
      009CBA CD 16 42         [ 4] 2922 	call func_args
      009CBA 1E 0B            [ 1] 2923 	cp a,#1
      009CBC CF 00            [ 1] 2924 	jreq 1$
      009CBE 05 72 01         [ 2] 2925 	jp syntax_error
      009CC1 00               [ 2] 2926 1$: popw x 
      009CC2 21 05 E6         [ 2] 2927 	cpw x,#15 
      009CC5 02 C7            [ 2] 2928 	jrule 2$
      009CC7 00 04            [ 1] 2929 	ld a,#ERR_BAD_VALUE
      009CC9 1E 09 CF         [ 2] 2930 	jp tb_error 
      009CCC 00 01 81         [ 4] 2931 2$:	call select_pin 
      009CCF 6B 01            [ 1] 2932 	ld (PINNO,sp),a
      009CCF 85 5B            [ 1] 2933 	ld a,(GPIO_IDR,x)
      009CD1 0A 72            [ 1] 2934 	tnz (PINNO,sp)
      009CD3 5A 00            [ 1] 2935 	jreq 8$
      009CD5 1E               [ 1] 2936 3$: srl a 
      009CD6 FC 01            [ 1] 2937 	dec (PINNO,sp)
      009CD7 26 FB            [ 1] 2938 	jrne 3$ 
      009CD7 CD 98            [ 1] 2939 8$: and a,#1 
      009CD9 0F               [ 1] 2940 	clrw x 
      009CDA A1               [ 1] 2941 	ld xl,a 
      009CDB 84 27            [ 1] 2942 	ld a,#TK_INTGR
      001EA8                       2943 	_drop VSIZE
      009CDD 03 CC            [ 2]    1     addw sp,#VSIZE 
      009CDF 92               [ 4] 2944 	ret
                                   2945 
                                   2946 
                                   2947 ;-----------------------
                                   2948 ; BASIC: DWRITE pin,0|1
                                   2949 ; Arduino pins 
                                   2950 ; write to a digital pin 
                                   2951 ; pin# {0..15}
                                   2952 ; output:
                                   2953 ;    A 		TK_INTGR
                                   2954 ;    X      0|1 
                                   2955 ;-------------------------
                           000001  2956 	PINNO=1
                           000002  2957 	PINVAL=2
                           000002  2958 	VSIZE=2
      001EAB                       2959 digital_write:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      001EAB                       2960 	_vars VSIZE 
      009CE0 1A 02            [ 2]    1     sub sp,#VSIZE 
      009CE1 CD 16 47         [ 4] 2961 	call arg_list  
      009CE1 4F 90            [ 1] 2962 	cp a,#2 
      009CE3 CE 00            [ 1] 2963 	jreq 1$
      009CE5 05 90 FE         [ 2] 2964 	jp syntax_error
      009CE8 90               [ 2] 2965 1$: popw x 
      009CE9 89               [ 1] 2966 	ld a,xl 
      009CEA 13 01            [ 1] 2967 	ld (PINVAL,sp),a
      009CEC 5B               [ 2] 2968 	popw x 
      009CED 02 25 01         [ 2] 2969 	cpw x,#15 
      009CF0 4C 05            [ 2] 2970 	jrule 2$
      009CF1 A6 0A            [ 1] 2971 	ld a,#ERR_BAD_VALUE
      009CF1 CD 86 B6         [ 2] 2972 	jp tb_error 
      009CF4 5D 26 05         [ 4] 2973 2$:	call select_pin 
      009CF7 A6 05            [ 1] 2974 	ld (PINNO,sp),a 
      009CF9 CC 92            [ 1] 2975 	ld a,#1
      009CFB 1C 81            [ 1] 2976 	tnz (PINNO,sp)
      009CFD 27 05            [ 1] 2977 	jreq 4$
      009CFD 72               [ 1] 2978 3$: sll a
      009CFE 00 00            [ 1] 2979 	dec (PINNO,sp)
      009D00 21 05            [ 1] 2980 	jrne 3$
      009D02 A6 06            [ 1] 2981 4$: tnz (PINVAL,sp)
      009D04 CC 92            [ 1] 2982 	jrne 5$
      009D06 1C               [ 1] 2983 	cpl a 
      009D07 CD 97            [ 1] 2984 	and a,(GPIO_ODR,x)
      009D09 C6 A1            [ 2] 2985 	jra 8$
      009D0B 84 27            [ 1] 2986 5$: or a,(GPIO_ODR,x)
      009D0D 03 CC            [ 1] 2987 8$: ld (GPIO_ODR,x),a 
      001EE3                       2988 	_drop VSIZE 
      009D0F 92 1A            [ 2]    1     addw sp,#VSIZE 
      009D11 A3               [ 4] 2989 	ret
                                   2990 
                                   2991 
                                   2992 ;-----------------------
                                   2993 ; BASIC: STOP
                                   2994 ; stop progam execution  
                                   2995 ; without resetting pointers 
                                   2996 ; the program is resumed
                                   2997 ; with RUN 
                                   2998 ;-------------------------
      001EE6                       2999 stop:
      009D12 00 01 2F 69 A3   [ 2] 3000 	btjt flags,#FRUN,2$
      009D17 00               [ 1] 3001 	clr a
      009D18 10               [ 4] 3002 	ret 
      001EED                       3003 2$:	 
                                   3004 ; create space on cstack to save context 
      009D19 22 64 9F         [ 2] 3005 	ldw x,#break_point 
      009D1C 88 CD 93         [ 4] 3006 	call puts 
      001EF3                       3007 	_drop 2 ;drop return address 
      009D1F 1B A1            [ 2]    1     addw sp,#2 
      001EF5                       3008 	_vars CTXT_SIZE ; context size 
      009D21 80 27            [ 2]    1     sub sp,#CTXT_SIZE 
      009D23 03 CC 92         [ 4] 3009 	call save_context 
      009D26 1A A3 9D         [ 2] 3010 	ldw x,#tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      009D29 86 27 08         [ 2] 3011 	ldw basicptr,x
      009D2C A3               [ 1] 3012 	clr (x)
      009D2D 9D A0 27 03      [ 1] 3013 	clr count  
      009D31 CC               [ 1] 3014 	clrw x 
      009D32 92 1A 84         [ 2] 3015 	ldw in.w,x
      009D35 89 88 CD 93      [ 1] 3016 	bres flags,#FRUN 
      009D39 1B A1 84 27      [ 1] 3017 	bset flags,#FBREAK
      009D3D 03 CC 92         [ 2] 3018 	jp interpreter 
      009D40 1A 62 72 65 61 6B 20  3019 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   3020 
                                   3021 ;-----------------------
                                   3022 ; BASIC: NEW
                                   3023 ; from command line only 
                                   3024 ; free program memory
                                   3025 ; and clear variables 
                                   3026 ;------------------------
      009D41                       3027 new: 
      009D41 0A 01 27 0B CD   [ 2] 3028 	btjf flags,#FRUN,0$ 
      009D46 93               [ 4] 3029 	ret 
      001F38                       3030 0$:	
      009D47 1B A1 09         [ 4] 3031 	call clear_basic 
      009D4A 27               [ 4] 3032 	ret 
                                   3033 
                                   3034 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3035 ;;;  flash memory operations
                                   3036 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3037 
                                   3038 ;--------------------------
                                   3039 ; align farptr to BLOCK_SIZE 
                                   3040 ;---------------------------
      001F3C                       3041 row_align:
      009D4B EB 5B            [ 1] 3042 	ld a,#0x7f 
      009D4D 03 20 2F         [ 1] 3043 	and a,farptr+2 
      009D50 27 13            [ 1] 3044 	jreq 1$ 
      009D50 5B 01 55         [ 2] 3045 	ldw x,farptr+1 
      009D53 00 04 00         [ 2] 3046 	addw x,#BLOCK_SIZE 
      009D56 02 CD            [ 1] 3047 	jrnc 0$
      009D58 9C E1 90 85      [ 1] 3048 	inc farptr 
      009D5C 90               [ 1] 3049 0$: ld a,xl 
      009D5D A3 9D            [ 1] 3050 	and a,#0x80
      009D5F 86               [ 1] 3051 	ld xl,a
      009D60 27 31 90         [ 2] 3052 	ldw farptr+1,x  	
      009D63 85               [ 4] 3053 1$:	ret
                                   3054 
                                   3055 ;--------------------
                                   3056 ; input:
                                   3057 ;   X     increment 
                                   3058 ; output:
                                   3059 ;   farptr  incremented 
                                   3060 ;---------------------
      001F57                       3061 incr_farptr:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      009D64 52 04 90 89      [ 2] 3062 	addw x,farptr+1 
      009D68 90 CE            [ 1] 3063 	jrnc 1$
      009D6A 00 05 55 00      [ 1] 3064 	inc farptr 
      009D6E 04 00 02         [ 2] 3065 1$:	ldw farptr+1,x  
      009D71 72               [ 4] 3066 	ret 
                                   3067 
                                   3068 ;-----------------------------------
                                   3069 ; scan block for non zero byte 
                                   3070 ; block are 128 bytes 
                                   3071 ; input:
                                   3072 ;    farptr     address block  
                                   3073 ; output:
                                   3074 ;     A     0 cleared, other not cleared  
                                   3075 ;-----------------------------------
      001F65                       3076 scan_block:
      009D72 B9               [ 1] 3077 	clrw x 
      009D73 00 01 17 03      [ 5] 3078 1$: ldf a,([farptr],x) 
      009D77 90 AE            [ 1] 3079 	jrne 2$
      009D79 00               [ 1] 3080 	incw x 
      009D7A 03 17 05         [ 2] 3081 	cpw x,#BLOCK_SIZE 
      009D7D 20 14            [ 1] 3082 	jrult 1$ 
      009D7F 81               [ 4] 3083 2$:	ret 
                                   3084 
                                   3085 
                                   3086 
                                   3087 ;-----------------------------------
                                   3088 ; BASIC: ERASE \E | \F 
                                   3089 ; erase all block in range from 
                                   3090 ;  'app_space' to FLASH end (0x20000)
                                   3091 ;  or all EEPROM 
                                   3092 ; that contains a non zero byte.  
                                   3093 ;-----------------------------------
                           000001  3094 	LIMIT=1 
                           000003  3095 	VSIZE = 3 
      001F73                       3096 erase:
      009D7F 55 00 04 00      [ 1] 3097 	clr farptr 
      001F77                       3098 	_vars VSIZE 
      009D83 02 4F            [ 2]    1     sub sp,#VSIZE 
      009D85 81 12 9B         [ 4] 3099 	call next_token 
      009D86 A1 03            [ 1] 3100 	cp a,#TK_CHAR 
      009D86 72 00            [ 1] 3101 	jreq 0$ 
      009D88 00 21 05         [ 2] 3102 	jp syntax_error
      009D8B A6               [ 1] 3103 0$: ld a,xl 
      009D8C 06 CC            [ 1] 3104 	and a,#0XDF 
      009D8E 92 1C            [ 1] 3105 	cp a,#'E
      009D90 CD 9C            [ 1] 3106 	jrne 1$
      009D92 D7 40 00         [ 2] 3107 	ldw x,#EEPROM_BASE 
      009D93 CF 00 17         [ 2] 3108 	ldw farptr+1,x 
      009D93 CF 00 05         [ 2] 3109 	ldw x,#EEPROM_END
      009D96 E6               [ 1] 3110 	clr a 
      009D97 02 C7            [ 2] 3111 	jra 3$ 
      009D99 00 04            [ 1] 3112 1$: cp a,#'F 
      009D9B 35 03            [ 1] 3113 	jreq 2$
      009D9D 00 02 81         [ 2] 3114 	ldw x,#err_bad_value
      009DA0 CC 11 9C         [ 2] 3115 	jp tb_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      001FA0                       3116 2$:
      009DA0 72 00 00         [ 2] 3117 	ldw x,#app_sign 
      009DA3 21 06 A6         [ 2] 3118 	ldw farptr+1,x 
      009DA6 06 CC            [ 1] 3119 	ld a,#(FLASH_END>>16)&0XFF 
      009DA8 92 1C 81         [ 2] 3120 	ldw x,#FLASH_END&0xffff
      001FAB                       3121 3$:
      009DAB 85 52            [ 1] 3122 	ld (LIMIT,sp),a 
      009DAD 04 89            [ 2] 3123 	ldw (LIMIT+1,sp),x 
                                   3124  ; operation done from RAM
                                   3125  ; copy code to RAM in tib   
      009DAF CE 00 05         [ 4] 3126 	call move_erase_to_ram
      001FB2                       3127 4$:	 
      009DB2 1F 03 CD         [ 4] 3128     call scan_block 
      009DB5 9C D7            [ 1] 3129 	jreq 5$  ; block already erased 
      009DB7 89 CE            [ 1] 3130     ld a,#'E 
      009DB9 00 01 1F         [ 4] 3131     call putc 
      009DBC 07 85 20         [ 4] 3132 	call block_erase   
                                   3133 ; this block is clean, next  
      009DBF D3 00 80         [ 2] 3134 5$:	ldw x,#BLOCK_SIZE
      009DC0 CD 1F 57         [ 4] 3135 	call incr_farptr
                                   3136 ; check limit, 24 bit substraction  	
      009DC0 72 00            [ 1] 3137 	ld a,(LIMIT,sp)
      009DC2 00 21            [ 2] 3138 	ldw x,(LIMIT+1,sp)
      009DC4 05 A6 06 CC      [ 2] 3139 	subw x,farptr+1
      009DC8 92 1C 16         [ 1] 3140 	sbc a,farptr 
      009DCA 22 E0            [ 1] 3141 	jrugt 4$ 
      009DCA 1E 03 CF         [ 4] 3142 9$: call clear_basic
      001FD5                       3143 	_drop VSIZE 
      009DCD 00 05            [ 2]    1     addw sp,#VSIZE 
      009DCF E6               [ 4] 3144 	ret 
                                   3145 	
                                   3146 
                                   3147 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3148 ;  check for application signature 
                                   3149 ; output:
                                   3150 ;   Carry    0 app present 
                                   3151 ;            1 no app installed  
                                   3152 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001FD8                       3153 qsign: 
      009DD0 02 C7 00         [ 2] 3154 	ldw x,app_sign 
      009DD3 04 1E 05         [ 2] 3155 	cpw x,SIGNATURE ; "BC" 
      009DD6 CF               [ 4] 3156 	ret 
                                   3157 
                                   3158 ;---------------------------------------
                                   3159 ; BASIC: SAVE
                                   3160 ; write application in RAM to FLASH
                                   3161 ;--------------------------------------
      001FDF                       3162 save_app:
      009DD7 00 01 85         [ 4] 3163 	call qsign 
      009DDA 5B 04            [ 1] 3164 	jrne 1$
      009DDC 89 81 42         [ 2] 3165 	ldw x,#CANT_DO 
      009DDE CD 03 4E         [ 4] 3166 	call puts 
      009DDE 72 01 00         [ 2] 3167 	jp 9$
      001FED                       3168 1$: 
      009DE1 21 02 4F         [ 2] 3169 	ldw x,txtbgn
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      009DE4 81 00 1B         [ 2] 3170 	cpw x,txtend 
      009DE5 25 08            [ 1] 3171 	jrult 2$ 
      009DE5 72 09 00         [ 2] 3172 	ldw x,#NO_APP
      009DE8 21 12 5B         [ 4] 3173 	call puts 
      009DEB 02 CD            [ 2] 3174 	jra 9$
      001FFD                       3175 2$: 
                                   3176 ; block programming flash
                                   3177 ; must be done from RAM 
      009DED 9A CC 5B         [ 4] 3178 	call move_prg_to_ram
                                   3179 ; initialize farptr 
      009DF0 04 72 19 00      [ 1] 3180 	clr farptr 
      009DF4 21 72 10         [ 2] 3181 	ldw x,#app_sign 
      009DF7 00 21 CC         [ 2] 3182 	ldw farptr+1,x 
                                   3183 ; write signature
      009DFA 92 BD CE         [ 2] 3184 	ldw x,SIGNATURE ; "BC" 
      009DFD 00 1A C3         [ 2] 3185 	ldw rsign,x 
      009E00 00 1C 2B         [ 2] 3186 	ldw x,txtend 
      009E03 0C AE 91 B3      [ 2] 3187 	subw x,txtbgn 
      009E07 CD 83 CE         [ 2] 3188 	ldw rsize,x   
                                   3189 ;copy block to flash
      009E0A 55 00 04         [ 2] 3190 	ldw x,#rsign  
      009E0D 00 02            [ 2] 3191 	ldw (1,sp),x   
      009E0F 81 01            [ 2] 3192 3$:	ldw x,(1,sp)
      009E10 CD 01 6B         [ 4] 3193 	call write_row 
      009E10 CD 99            [ 1] 3194     ld a,#'. 
      009E12 20 5B 02         [ 4] 3195     call putc 
      009E15 5F CF            [ 2] 3196 	ldw x,(1,sp)
      009E17 00 07 72         [ 2] 3197 	addw x,#BLOCK_SIZE
      009E1A 5F 00            [ 2] 3198 	ldw (1,sp),x  
      009E1C 09 72 5F         [ 2] 3199 	cpw x,txtend 
      009E1F 00 0A            [ 1] 3200 	jruge 8$
      009E21 CE 00 1A         [ 2] 3201 	ldw x,#BLOCK_SIZE 
      009E24 CF 00 05         [ 4] 3202 	call incr_farptr
      009E27 E6 02            [ 2] 3203 	jra 3$ 
      00203D                       3204 8$:	
      00203D                       3205 	_drop 2   
      009E29 C7 00            [ 2]    1     addw sp,#2 
      009E2B 04               [ 4] 3206 9$: ret 
                                   3207 
      009E2C 35 03                 3208 SIGNATURE: .ascii "BC"
      009E2E 00 02 72 10 00 21 CC  3209 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE before"
             92 BD 73 68 20 61 70
             70 6C 69 63 61 74 69
             6F 6E 2C 20 61 6C 72
             65 61 64 79 20 6F 6E
             65 20 69 6E 20 46 4C
             41 53 48 0A 75 73 65
             20 45 52 41 53 45 20
             62 65 66 6F 72 65 00
      009E37 4E 6F 20 61 70 70 6C  3210 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
             20 69 6E 20 52 41 4D
             00
                                   3211 
                                   3212 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



                                   3213 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3214 ; write 1 or more byte to FLASH or EEPROM
                                   3215 ; starting at address  
                                   3216 ; input:
                                   3217 ;   expr1  	is address 
                                   3218 ;   expr2,...,exprn   are bytes to write
                                   3219 ; output:
                                   3220 ;   none 
                                   3221 ;---------------------
                           000001  3222 	ADDR=1
                           000002  3223 	VSIZ=2 
      002097                       3224 write:
      002097                       3225 	_vars VSIZE 
      009E37 AE 17            [ 2]    1     sub sp,#VSIZE 
      009E39 FF 94 CC 92      [ 1] 3226 	clr farptr ; expect 16 bits address 
      009E3D 9E 17 46         [ 4] 3227 	call expression
      009E3E A1 84            [ 1] 3228 	cp a,#TK_INTGR 
      009E3E AE 00            [ 1] 3229 	jreq 0$
      009E40 64 90 AE         [ 2] 3230 	jp syntax_error
      009E43 03 E8            [ 2] 3231 0$: ldw (ADDR,sp),x 
      009E45 20 0D 9B         [ 4] 3232 	call next_token 
      009E47 A1 09            [ 1] 3233 	cp a,#TK_COMMA 
      009E47 CD 96            [ 1] 3234 	jreq 1$ 
      009E49 C7 A1            [ 2] 3235 	jra 9$ 
      009E4B 02 27 03         [ 4] 3236 1$:	call expression
      009E4E CC 92            [ 1] 3237 	cp a,#TK_INTGR
      009E50 1A 03            [ 1] 3238 	jreq 2$
      009E51 CC 11 9A         [ 2] 3239 	jp syntax_error
      009E51 85               [ 1] 3240 2$:	ld a,xl 
      009E52 90 85            [ 2] 3241 	ldw x,(ADDR,sp) 
      009E54 CF 00 17         [ 2] 3242 	ldw farptr+1,x 
      009E54 89               [ 1] 3243 	clrw x 
      009E55 AE F4 24         [ 4] 3244 	call write_byte
      009E58 65 90            [ 2] 3245 	ldw x,(ADDR,sp)
      009E5A A3               [ 1] 3246 	incw x 
      009E5B 7A 12            [ 2] 3247 	jra 0$ 
      0020CB                       3248 9$:
      0020CB                       3249 	_drop VSIZE
      009E5D 2B 01            [ 2]    1     addw sp,#VSIZE 
      009E5F 5C               [ 4] 3250 	ret 
                                   3251 
                                   3252 
                                   3253 ;---------------------
                                   3254 ;BASIC: CHAR(expr)
                                   3255 ; évaluate expression 
                                   3256 ; and take the 7 least 
                                   3257 ; bits as ASCII character
                                   3258 ; return a TK_CHAR 
                                   3259 ;---------------------
      009E60                       3260 char:
      009E60 9E C7 53         [ 4] 3261 	call func_args 
      009E63 0D 9F            [ 1] 3262 	cp a,#1
      009E65 C7 53            [ 1] 3263 	jreq 1$
      009E67 0E 8C 56         [ 2] 3264 	jp syntax_error
      009E6A 9E               [ 2] 3265 1$:	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      009E6B C7               [ 1] 3266 	ld a,xl 
      009E6C 53 0F            [ 1] 3267 	and a,#0x7f 
      009E6E 9F               [ 1] 3268 	ld xl,a
      009E6F C7 53            [ 1] 3269 	ld a,#TK_CHAR
      009E71 10               [ 4] 3270 	ret
                                   3271 
                                   3272 ;---------------------
                                   3273 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3274 ; extract first character 
                                   3275 ; of string argument 
                                   3276 ; return it as TK_INTGR 
                                   3277 ;---------------------
      0020E0                       3278 ascii:
      009E72 72 10            [ 1] 3279 	ld a,#TK_LPAREN
      009E74 53 08 72         [ 4] 3280 	call expect 
      009E77 10 53 00         [ 4] 3281 	call next_token 
      009E7A 72 10            [ 1] 3282 	cp a,#TK_QSTR 
      009E7C 53 04            [ 1] 3283 	jreq 1$
      009E7E 85 CD            [ 1] 3284 	cp a,#TK_CHAR 
      009E80 A2 17            [ 1] 3285 	jreq 2$ 
      009E82 72 11            [ 1] 3286 	cp a,#TK_CFUNC 
      009E84 53 08            [ 1] 3287 	jreq 0$
      009E86 72 11 53         [ 2] 3288 	jp syntax_error
      009E89 00               [ 4] 3289 0$: call (x)
      009E8A 81 03            [ 2] 3290 	jra 2$
      009E8B                       3291 1$: 
      009E8B CD               [ 1] 3292 	ld a,(x) 
      009E8C 96               [ 1] 3293 	clrw x
      009E8D C7               [ 1] 3294 	ld xl,a 
      0020FD                       3295 2$: 
      009E8E A1               [ 2] 3296 	pushw x 
      009E8F 02 27            [ 1] 3297 	ld a,#TK_RPAREN 
      009E91 0B A1 01         [ 4] 3298 	call expect
      009E94 27               [ 2] 3299 	popw x 
      009E95 03 CC            [ 1] 3300 	ld a,#TK_INTGR 
      009E97 92               [ 4] 3301 	ret 
                                   3302 
                                   3303 ;---------------------
                                   3304 ;BASIC: KEY
                                   3305 ; wait for a character 
                                   3306 ; received from STDIN 
                                   3307 ; input:
                                   3308 ;	none 
                                   3309 ; output:
                                   3310 ;	X 		ASCII character 
                                   3311 ;---------------------
      002107                       3312 key:
      009E98 1A AE 00         [ 4] 3313 	call getc 
      009E9B 00               [ 1] 3314 	clrw x 
      009E9C 89               [ 1] 3315 	ld xl,a 
      009E9D 1E 03            [ 1] 3316 	ld a,#TK_INTGR
      009E9F 5D               [ 4] 3317 	ret
                                   3318 
                                   3319 ;----------------------
                                   3320 ; BASIC: QKEY
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



                                   3321 ; Return true if there 
                                   3322 ; is a character in 
                                   3323 ; waiting in STDIN 
                                   3324 ; input:
                                   3325 ;  none 
                                   3326 ; output:
                                   3327 ;   X 		0|-1 
                                   3328 ;-----------------------
      00210F                       3329 qkey:: 
      009EA0 27               [ 1] 3330 	clrw x 
      009EA1 1A 1E 01         [ 1] 3331 	ld a,rx1_head
      009EA4 9F A4 07         [ 1] 3332 	cp a,rx1_tail 
      009EA7 4E C7            [ 1] 3333 	jreq 9$ 
      009EA9 54               [ 2] 3334 	cplw x 
      009EAA 01 72            [ 1] 3335 9$: ld a,#TK_INTGR
      009EAC 16               [ 4] 3336 	ret 
                                   3337 
                                   3338 ;---------------------
                                   3339 ; BASIC: GPIO(expr,reg)
                                   3340 ; return gpio address 
                                   3341 ; expr {0..8}
                                   3342 ; input:
                                   3343 ;   none 
                                   3344 ; output:
                                   3345 ;   X 		gpio register address
                                   3346 ;----------------------------
                           000003  3347 	PORT=3
                           000001  3348 	REG=1 
                           000004  3349 	VSIZE=4 
      00211C                       3350 gpio:
      009EAD 50 CA 72         [ 4] 3351 	call func_args 
      009EB0 10 54            [ 1] 3352 	cp a,#2
      009EB2 01 AE            [ 1] 3353 	jreq 1$
      009EB4 00 1B 5A         [ 2] 3354 	jp syntax_error  
      002126                       3355 1$:	
      009EB7 9D 26            [ 2] 3356 	ldw x,(PORT,sp)
      009EB9 FA 20            [ 1] 3357 	jrmi bad_port
      009EBB 08 72 11         [ 2] 3358 	cpw x,#9
      009EBE 54 01            [ 1] 3359 	jrpl bad_port
      009EC0 72 17            [ 1] 3360 	ld a,#5
      009EC2 50               [ 4] 3361 	mul x,a
      009EC3 CA 5B 04         [ 2] 3362 	addw x,#GPIO_BASE 
      009EC6 81 03            [ 2] 3363 	ldw (PORT,sp),x  
      009EC7 1E 01            [ 2] 3364 	ldw x,(REG,sp) 
      009EC7 CD 96 C2         [ 2] 3365 	addw x,(PORT,sp)
      009ECA A1 01            [ 1] 3366 	ld a,#TK_INTGR
      00213E                       3367 	_drop VSIZE 
      009ECC 27 03            [ 2]    1     addw sp,#VSIZE 
      009ECE CC               [ 4] 3368 	ret
      002141                       3369 bad_port:
      009ECF 92 1A            [ 1] 3370 	ld a,#ERR_BAD_VALUE
      009ED1 85 A3 00         [ 2] 3371 	jp tb_error
                                   3372 
                                   3373 
                                   3374 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



                                   3375 ; BASIC: UFLASH 
                                   3376 ; return free flash address
                                   3377 ; input:
                                   3378 ;  none 
                                   3379 ; output:
                                   3380 ;	A		TK_INTGR
                                   3381 ;   X 		free address 
                                   3382 ;---------------------------
      002146                       3383 uflash:
      009ED4 05 23 05         [ 2] 3384 	ldw x,app_sign
      009ED7 A6 0A CC         [ 2] 3385 	cpw x,#4243 ; signature "BC" 
      009EDA 92 1C            [ 1] 3386 	jreq 1$
      009EDC 9F C7 00         [ 2] 3387 	ldw x,app_size 
      009EDF 0E A6 05         [ 2] 3388 	addw x,#app
      009EE2 C0 00            [ 2] 3389 	jra 2$
      009EE4 0E C7 54         [ 2] 3390 1$:	ldw x,#app_space 
      009EE7 00 72            [ 1] 3391 2$:	ld a,#TK_INTGR 
      009EE9 16               [ 4] 3392 	ret 
                                   3393 
                                   3394 
                                   3395 ;---------------------
                                   3396 ; BASIC: USR(addr[,arg])
                                   3397 ; execute a function written 
                                   3398 ; in binary code.
                                   3399 ; binary fonction should 
                                   3400 ; return token attribute in A 
                                   3401 ; and value in X. 
                                   3402 ; input:
                                   3403 ;   addr	routine address 
                                   3404 ;   arg 	is an optional argument 
                                   3405 ; output:
                                   3406 ;   A 		token attribute 
                                   3407 ;   X       returned value 
                                   3408 ;---------------------
      00215C                       3409 usr:
      009EEA 54 02            [ 2] 3410 	pushw y 	
      009EEC 72 10 54         [ 4] 3411 	call func_args 
      009EEF 01 72            [ 1] 3412 	cp a,#1 
      009EF1 0F 54            [ 1] 3413 	jreq 2$
      009EF3 00 FB            [ 1] 3414 	cp a,#2
      009EF5 CE 54            [ 1] 3415 	jreq 2$  
      009EF7 04 A6 84         [ 2] 3416 	jp syntax_error 
      009EFA 81 85            [ 2] 3417 2$: popw y  ; arg|addr 
      009EFB A1 01            [ 1] 3418 	cp a,#1
      009EFB 52 01            [ 1] 3419 	jreq 3$
      009EFD CD               [ 2] 3420 	popw x ; addr
      009EFE 96               [ 1] 3421 	exgw x,y 
      009EFF C2 A1            [ 4] 3422 3$: call (y)
      009F01 01 27            [ 2] 3423 	popw y 
      009F03 03               [ 4] 3424 	ret 
                                   3425 
                                   3426 ;------------------------------
                                   3427 ; BASIC: BYE 
                                   3428 ; halt mcu in its lowest power mode 
                                   3429 ; wait for reset or external interrupt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



                                   3430 ; do a cold start on wakeup.
                                   3431 ;------------------------------
      002179                       3432 bye:
      009F04 CC 92 1A 85 A3   [ 2] 3433 	btjf UART1_SR,#UART_SR_TC,.
      009F09 00               [10] 3434 	halt
      009F0A 0F 23 05         [ 2] 3435 	jp cold_start  
                                   3436 
                                   3437 ;----------------------------------
                                   3438 ; BASIC: SLEEP 
                                   3439 ; halt mcu until reset or external
                                   3440 ; interrupt.
                                   3441 ; Resume progam after SLEEP command
                                   3442 ;----------------------------------
      002182                       3443 sleep:
      009F0D A6 0A CC 92 1C   [ 2] 3444 	btjf UART1_SR,#UART_SR_TC,.
      009F12 CD A3 55 6B      [ 1] 3445 	bset flags,#FSLEEP
      009F16 01               [10] 3446 	halt 
      009F17 E6               [ 4] 3447 	ret 
                                   3448 
                                   3449 ;-------------------------------
                                   3450 ; BASIC: PAUSE expr 
                                   3451 ; suspend execution for n msec.
                                   3452 ; input:
                                   3453 ;	none
                                   3454 ; output:
                                   3455 ;	none 
                                   3456 ;------------------------------
      00218D                       3457 pause:
      009F18 01 0D 01         [ 4] 3458 	call expression
      009F1B 27 05            [ 1] 3459 	cp a,#TK_INTGR
      009F1D 44 0A            [ 1] 3460 	jreq pause02 
      009F1F 01 26 FB         [ 2] 3461 	jp syntax_error
      002197                       3462 pause02: 
      009F22 A4               [ 2] 3463 1$: tnzw x 
      009F23 01 5F            [ 1] 3464 	jreq 2$
      009F25 97               [10] 3465 	wfi 
      009F26 A6               [ 2] 3466 	decw x 
      009F27 84 5B            [ 1] 3467 	jrne 1$
      009F29 01               [ 1] 3468 2$:	clr a 
      009F2A 81               [ 4] 3469 	ret 
                                   3470 
                                   3471 ;------------------------------
                                   3472 ; BASIC: AWU expr
                                   3473 ; halt mcu for 'expr' milliseconds
                                   3474 ; use Auto wakeup peripheral
                                   3475 ; all oscillators stopped except LSI
                                   3476 ; range: 1ms - 511ms
                                   3477 ; input:
                                   3478 ;  none
                                   3479 ; output:
                                   3480 ;  none:
                                   3481 ;------------------------------
      009F2B                       3482 awu:
      009F2B 52 02 CD         [ 4] 3483   call expression
      009F2E 96 C7            [ 1] 3484   cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      009F30 A1 02            [ 1] 3485   jreq awu02
      009F32 27 03 CC         [ 2] 3486   jp syntax_error
      0021AA                       3487 awu02:
      009F35 92 1A 85         [ 2] 3488   cpw x,#5120
      009F38 9F 6B            [ 1] 3489   jrmi 1$ 
      009F3A 02 85 A3 00      [ 1] 3490   mov AWU_TBR,#15 
      009F3E 0F 23            [ 1] 3491   ld a,#30
      009F40 05               [ 2] 3492   div x,a
      009F41 A6 0A            [ 1] 3493   ld a,#16
      009F43 CC               [ 2] 3494   div x,a 
      009F44 92 1C            [ 2] 3495   jra 4$
      0021BB                       3496 1$: 
      009F46 CD A3 55         [ 2] 3497   cpw x,#2048
      009F49 6B 01            [ 1] 3498   jrmi 2$ 
      009F4B A6 01 0D 01      [ 1] 3499   mov AWU_TBR,#14
      009F4F 27 05            [ 1] 3500   ld a,#80
      009F51 48               [ 2] 3501   div x,a 
      009F52 0A 01            [ 2] 3502   jra 4$   
      0021C9                       3503 2$:
      009F54 26 FB 0D 02      [ 1] 3504   mov AWU_TBR,#7
      0021CD                       3505 3$:  
                                   3506 ; while X > 64  divide by 2 and increment AWU_TBR 
      009F58 26 05 43         [ 2] 3507   cpw x,#64 
      009F5B E4 00            [ 2] 3508   jrule 4$ 
      009F5D 20 02 EA 00      [ 1] 3509   inc AWU_TBR 
      009F61 E7               [ 2] 3510   srlw x 
      009F62 00 5B            [ 2] 3511   jra 3$ 
      0021D9                       3512 4$:
      009F64 02               [ 1] 3513   ld a, xl
      009F65 81               [ 1] 3514   dec a 
      009F66 27 01            [ 1] 3515   jreq 5$
      009F66 72               [ 1] 3516   dec a 	
      0021DE                       3517 5$: 
      009F67 00 00            [ 1] 3518   and a,#0x3e 
      009F69 21 02 4F         [ 1] 3519   ld AWU_APR,a 
      009F6C 81 18 50 F0      [ 1] 3520   bset AWU_CSR,#AWU_CSR_AWUEN
      009F6D 8E               [10] 3521   halt 
                                   3522 
      009F6D AE               [ 4] 3523   ret 
                                   3524 
                                   3525 ;------------------------------
                                   3526 ; BASIC: TICKS
                                   3527 ; return msec ticks counter value 
                                   3528 ; input:
                                   3529 ; 	none 
                                   3530 ; output:
                                   3531 ;	X 		TK_INTGR
                                   3532 ;-------------------------------
      0021E9                       3533 get_ticks:
      009F6E 9F 94 CD         [ 2] 3534 	ldw x,ticks 
      009F71 83 CE            [ 1] 3535 	ld a,#TK_INTGR
      009F73 5B               [ 4] 3536 	ret 
                                   3537 
                                   3538 
                                   3539 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



                                   3540 ;------------------------------
                                   3541 ; BASIC: ABS(expr)
                                   3542 ; return absolute value of expr.
                                   3543 ; input:
                                   3544 ;   none
                                   3545 ; output:
                                   3546 ;   X     	positive integer
                                   3547 ;-------------------------------
      0021EF                       3548 abs:
      009F74 02 52 04         [ 4] 3549 	call func_args 
      009F77 CD 9A            [ 1] 3550 	cp a,#1 
      009F79 BC AE            [ 1] 3551 	jreq 0$ 
      009F7B 16 90 CF         [ 2] 3552 	jp syntax_error
      0021F9                       3553 0$:  
      009F7E 00               [ 2] 3554     popw x   
      009F7F 05               [ 1] 3555 	ld a,xh 
      009F80 7F 72            [ 1] 3556 	bcp a,#0x80 
      009F82 5F 00            [ 1] 3557 	jreq 2$ 
      009F84 04               [ 2] 3558 	negw x 
      009F85 5F CF            [ 1] 3559 2$: ld a,#TK_INTGR 
      009F87 00               [ 4] 3560 	ret 
                                   3561 
                                   3562 ;------------------------------
                                   3563 ; BASIC: AND(expr1,expr2)
                                   3564 ; Apply bit AND relation between
                                   3565 ; the 2 arguments, i.e expr1 & expr2 
                                   3566 ; output:
                                   3567 ; 	A 		TK_INTGR
                                   3568 ;   X 		result 
                                   3569 ;------------------------------
      002203                       3570 bit_and:
      009F88 01 72 11         [ 4] 3571 	call func_args 
      009F8B 00 21            [ 1] 3572 	cp a,#2
      009F8D 72 18            [ 1] 3573 	jreq 1$
      009F8F 00 21 CC         [ 2] 3574 	jp syntax_error 
      009F92 92               [ 2] 3575 1$:	popw x 
      009F93 BD               [ 1] 3576 	ld a,xh 
      009F94 0A 62            [ 1] 3577 	and a,(1,sp)
      009F96 72               [ 1] 3578 	ld xh,a 
      009F97 65               [ 1] 3579 	ld a,xl
      009F98 61 6B            [ 1] 3580 	and a,(2,sp)
      009F9A 20               [ 1] 3581 	ld xl,a 
      002216                       3582 	_drop 2 
      009F9B 70 6F            [ 2]    1     addw sp,#2 
      009F9D 69 6E            [ 1] 3583 	ld a,#TK_INTGR
      009F9F 74               [ 4] 3584 	ret
                                   3585 
                                   3586 ;------------------------------
                                   3587 ; BASIC: OR(expr1,expr2)
                                   3588 ; Apply bit OR relation between
                                   3589 ; the 2 arguments, i.e expr1 | expr2 
                                   3590 ; output:
                                   3591 ; 	A 		TK_INTGR
                                   3592 ;   X 		result 
                                   3593 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      00221B                       3594 bit_or:
      009FA0 2C 20 52         [ 4] 3595 	call func_args 
      009FA3 55 4E            [ 1] 3596 	cp a,#2
      009FA5 20 74            [ 1] 3597 	jreq 1$
      009FA7 6F 20 72         [ 2] 3598 	jp syntax_error 
      002225                       3599 1$: 
      009FAA 65               [ 2] 3600 	popw x 
      009FAB 73               [ 1] 3601 	ld a,xh 
      009FAC 75 6D            [ 1] 3602 	or a,(1,sp)
      009FAE 65               [ 1] 3603 	ld xh,a 
      009FAF 2E               [ 1] 3604 	ld a,xl 
      009FB0 0A 00            [ 1] 3605 	or a,(2,sp)
      009FB2 97               [ 1] 3606 	ld xl,a 
      00222E                       3607 	_drop 2 
      009FB2 72 01            [ 2]    1     addw sp,#2 
      009FB4 00 21            [ 1] 3608 	ld a,#TK_INTGR 
      009FB6 01               [ 4] 3609 	ret
                                   3610 
                                   3611 ;------------------------------
                                   3612 ; BASIC: XOR(expr1,expr2)
                                   3613 ; Apply bit XOR relation between
                                   3614 ; the 2 arguments, i.e expr1 ^ expr2 
                                   3615 ; output:
                                   3616 ; 	A 		TK_INTGR
                                   3617 ;   X 		result 
                                   3618 ;------------------------------
      002233                       3619 bit_xor:
      009FB7 81 16 42         [ 4] 3620 	call func_args 
      009FB8 A1 02            [ 1] 3621 	cp a,#2
      009FB8 CD 90            [ 1] 3622 	jreq 1$
      009FBA 82 81 9A         [ 2] 3623 	jp syntax_error 
      009FBC                       3624 1$: 
      009FBC A6               [ 2] 3625 	popw x 
      009FBD 7F               [ 1] 3626 	ld a,xh 
      009FBE C4 00            [ 1] 3627 	xor a,(1,sp)
      009FC0 19               [ 1] 3628 	ld xh,a 
      009FC1 27               [ 1] 3629 	ld a,xl 
      009FC2 13 CE            [ 1] 3630 	xor a,(2,sp)
      009FC4 00               [ 1] 3631 	ld xl,a 
      002246                       3632 	_drop 2 
      009FC5 18 1C            [ 2]    1     addw sp,#2 
      009FC7 00 80            [ 1] 3633 	ld a,#TK_INTGR 
      009FC9 24               [ 4] 3634 	ret 
                                   3635 
                                   3636 ;------------------------------
                                   3637 ; BASIC: LSHIFT(expr1,expr2)
                                   3638 ; logical shift left expr1 by 
                                   3639 ; expr2 bits 
                                   3640 ; output:
                                   3641 ; 	A 		TK_INTGR
                                   3642 ;   X 		result 
                                   3643 ;------------------------------
      00224B                       3644 lshift:
      009FCA 04 72 5C         [ 4] 3645 	call func_args
      009FCD 00 17            [ 1] 3646 	cp a,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      009FCF 9F A4            [ 1] 3647 	jreq 1$
      009FD1 80 97 CF         [ 2] 3648 	jp syntax_error
      009FD4 00 18            [ 2] 3649 1$: popw y   
      009FD6 81               [ 2] 3650 	popw x 
      009FD7 90 5D            [ 2] 3651 	tnzw y 
      009FD7 72 BB            [ 1] 3652 	jreq 4$
      009FD9 00               [ 2] 3653 2$:	sllw x 
      009FDA 18 24            [ 2] 3654 	decw y 
      009FDC 04 72            [ 1] 3655 	jrne 2$
      002261                       3656 4$:  
      009FDE 5C 00            [ 1] 3657 	ld a,#TK_INTGR
      009FE0 17               [ 4] 3658 	ret
                                   3659 
                                   3660 ;------------------------------
                                   3661 ; BASIC: RSHIFT(expr1,expr2)
                                   3662 ; logical shift right expr1 by 
                                   3663 ; expr2 bits.
                                   3664 ; output:
                                   3665 ; 	A 		TK_INTGR
                                   3666 ;   X 		result 
                                   3667 ;------------------------------
      002264                       3668 rshift:
      009FE1 CF 00 18         [ 4] 3669 	call func_args
      009FE4 81 02            [ 1] 3670 	cp a,#2 
      009FE5 27 03            [ 1] 3671 	jreq 1$
      009FE5 5F 92 AF         [ 2] 3672 	jp syntax_error
      009FE8 00 17            [ 2] 3673 1$: popw y  
      009FEA 26               [ 2] 3674 	popw x
      009FEB 06 5C            [ 2] 3675 	tnzw y 
      009FED A3 00            [ 1] 3676 	jreq 4$
      009FEF 80               [ 2] 3677 2$:	srlw x 
      009FF0 25 F4            [ 2] 3678 	decw y 
      009FF2 81 FB            [ 1] 3679 	jrne 2$
      009FF3                       3680 4$:  
      009FF3 72 5F            [ 1] 3681 	ld a,#TK_INTGR
      009FF5 00               [ 4] 3682 	ret
                                   3683 
                                   3684 ;--------------------------
                                   3685 ; BASIC: FCPU integer
                                   3686 ; set CPU frequency 
                                   3687 ;-------------------------- 
                                   3688 
      00227D                       3689 fcpu:
      009FF6 17 52            [ 1] 3690 	ld a,#TK_INTGR
      009FF8 03 CD 93         [ 4] 3691 	call expect 
      009FFB 1B               [ 1] 3692 	ld a,xl 
      009FFC A1 03            [ 1] 3693 	and a,#7 
      009FFE 27 03 CC         [ 1] 3694 	ld CLK_CKDIVR,a 
      00A001 92               [ 4] 3695 	ret 
                                   3696 
                                   3697 ;------------------------------
                                   3698 ; BASIC: PMODE pin#, mode 
                                   3699 ; Arduino pin. 
                                   3700 ; define pin as input or output
                                   3701 ; pin#: {0..15}
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



                                   3702 ; mode: INPUT|OUTPUT  
                                   3703 ;------------------------------
                           000001  3704 	PINNO=1
                           000001  3705 	VSIZE=1
      002289                       3706 pin_mode:
      002289                       3707 	_vars VSIZE 
      00A002 1A 9F            [ 2]    1     sub sp,#VSIZE 
      00A004 A4 DF A1         [ 4] 3708 	call arg_list 
      00A007 45 26            [ 1] 3709 	cp a,#2 
      00A009 0C AE            [ 1] 3710 	jreq 1$
      00A00B 40 00 CF         [ 2] 3711 	jp syntax_error 
      00A00E 00 18            [ 2] 3712 1$: popw y ; mode 
      00A010 AE               [ 2] 3713 	popw x ; Dx pin 
      00A011 47 FF 4F         [ 4] 3714 	call select_pin 
      00A014 20 15            [ 1] 3715 	ld (PINNO,sp),a  
      00A016 A1 46            [ 1] 3716 	ld a,#1 
      00A018 27 06            [ 1] 3717 	tnz (PINNO,sp)
      00A01A AE 91            [ 1] 3718 	jreq 4$
      00A01C 64               [ 1] 3719 2$:	sll a 
      00A01D CC 92            [ 1] 3720 	dec (PINNO,sp)
      00A01F 1C FB            [ 1] 3721 	jrne 2$ 
      00A020 6B 01            [ 1] 3722 	ld (PINNO,sp),a
      00A020 AE AC            [ 1] 3723 	ld a,(PINNO,sp)
      00A022 00 CF            [ 1] 3724 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A024 00 18            [ 1] 3725 	ld (GPIO_CR1,x),a 
      00A026 A6 02 AE 7F      [ 2] 3726 4$:	cpw y,#OUTP 
      00A02A FF 10            [ 1] 3727 	jreq 6$
                                   3728 ; input mode
                                   3729 ; disable external interrupt 
      00A02B 7B 01            [ 1] 3730 	ld a,(PINNO,sp)
      00A02B 6B               [ 1] 3731 	cpl a 
      00A02C 01 1F            [ 1] 3732 	and a,(GPIO_CR2,x)
      00A02E 02 CD            [ 1] 3733 	ld (GPIO_CR2,x),a 
                                   3734 ;clear bit in DDR for input mode 
      00A030 81 91            [ 1] 3735 	ld a,(PINNO,sp)
      00A032 43               [ 1] 3736 	cpl a 
      00A032 CD 9F            [ 1] 3737 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A034 E5 27            [ 1] 3738 	ld (GPIO_DDR,x),a 
      00A036 08 A6            [ 2] 3739 	jra 9$
      0022C6                       3740 6$: ;output mode  
      00A038 45 CD            [ 1] 3741 	ld a,(PINNO,sp)
      00A03A 83 71            [ 1] 3742 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A03C CD 82            [ 1] 3743 	ld (GPIO_DDR,x),a 
      00A03E 0F AE            [ 1] 3744 	ld a,(PINNO,sp)
      00A040 00 80            [ 1] 3745 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A042 CD 9F            [ 1] 3746 	ld (GPIO_CR2,x),a 
      0022D2                       3747 9$:	
      0022D2                       3748 	_drop VSIZE 
      00A044 D7 7B            [ 2]    1     addw sp,#VSIZE 
      00A046 01               [ 4] 3749 	ret
                                   3750 
                                   3751 ;------------------------
                                   3752 ; select Arduino pin 
                                   3753 ; input:
                                   3754 ;   X 	 {0..15} Arduino Dx 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



                                   3755 ; output:
                                   3756 ;   A     stm8s208 pin 
                                   3757 ;   X     base address s208 GPIO port 
                                   3758 ;---------------------------
      0022D5                       3759 select_pin:
      00A047 1E               [ 2] 3760 	sllw x 
      00A048 02 72 B0         [ 2] 3761 	addw x,#arduino_to_8s208 
      00A04B 00               [ 2] 3762 	ldw x,(x)
      00A04C 18               [ 1] 3763 	ld a,xl 
      00A04D C2               [ 1] 3764 	push a 
      00A04E 00               [ 1] 3765 	swapw x 
      00A04F 17 22            [ 1] 3766 	ld a,#5 
      00A051 E0               [ 4] 3767 	mul x,a 
      00A052 CD 90 82         [ 2] 3768 	addw x,#GPIO_BASE 
      00A055 5B               [ 1] 3769 	pop a 
      00A056 03               [ 4] 3770 	ret 
                                   3771 ; translation from Arduino D0..D15 to stm8s208rb 
      0022E5                       3772 arduino_to_8s208:
      00A057 81 06                 3773 .byte 3,6 ; D0 
      00A058 03 05                 3774 .byte 3,5 ; D1 
      00A058 CE AC                 3775 .byte 4,0 ; D2 
      00A05A 00 C3                 3776 .byte 2,1 ; D3
      00A05C A0 C0                 3777 .byte 6,0 ; D4
      00A05E 81 02                 3778 .byte 2,2 ; D5
      00A05F 02 03                 3779 .byte 2,3 ; D6
      00A05F CD A0                 3780 .byte 3,1 ; D7
      00A061 58 26                 3781 .byte 3,3 ; D8
      00A063 09 AE                 3782 .byte 2,4 ; D9
      00A065 A0 C2                 3783 .byte 4,5 ; D10
      00A067 CD 83                 3784 .byte 2,6 ; D11
      00A069 CE CC                 3785 .byte 2,7 ; D12
      00A06B A0 BF                 3786 .byte 2,5 ; D13
      00A06D 04 02                 3787 .byte 4,2 ; D14
      00A06D CE 00                 3788 .byte 4,1 ; D15
                                   3789 
                                   3790 
                                   3791 ;------------------------------
                                   3792 ; BASIC: RND(expr)
                                   3793 ; return random number 
                                   3794 ; between 1 and expr inclusive
                                   3795 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   3796 ; input:
                                   3797 ; 	none 
                                   3798 ; output:
                                   3799 ;	X 		random positive integer 
                                   3800 ;------------------------------
      002305                       3801 random:
      00A06F 1A C3 00         [ 4] 3802 	call func_args 
      00A072 1C 25            [ 1] 3803 	cp a,#1
      00A074 08 AE            [ 1] 3804 	jreq 1$
      00A076 A1 01 CD         [ 2] 3805 	jp syntax_error
      00230F                       3806 1$:  
      00A079 83 CE            [ 1] 3807 	ld a,#0x80 
      00A07B 20 42            [ 1] 3808 	bcp a,(1,sp)
      00A07D 27 05            [ 1] 3809 	jreq 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      00A07D CD 81            [ 1] 3810 	ld a,#ERR_BAD_VALUE
      00A07F D1 72 5F         [ 2] 3811 	jp tb_error
      00231A                       3812 2$: 
                                   3813 ; acc16=(x<<5)^x 
      00A082 00 17 AE         [ 2] 3814 	ldw x,seedx 
      00A085 AC               [ 2] 3815 	sllw x 
      00A086 00               [ 2] 3816 	sllw x 
      00A087 CF               [ 2] 3817 	sllw x 
      00A088 00               [ 2] 3818 	sllw x 
      00A089 18               [ 2] 3819 	sllw x 
      00A08A CE               [ 1] 3820 	ld a,xh 
      00A08B A0 C0 CF         [ 1] 3821 	xor a,seedx 
      00A08E 00 7C CE         [ 1] 3822 	ld acc16,a 
      00A091 00               [ 1] 3823 	ld a,xl 
      00A092 1C 72 B0         [ 1] 3824 	xor a,seedx+1 
      00A095 00 1A CF         [ 1] 3825 	ld acc8,a 
                                   3826 ; seedx=seedy 
      00A098 00 7E AE         [ 2] 3827 	ldw x,seedy 
      00A09B 00 7C 1F         [ 2] 3828 	ldw seedx,x  
                                   3829 ; seedy=seedy^(seedy>>1)
      00A09E 01 1E            [ 2] 3830 	srlw y 
      00A0A0 01 CD            [ 1] 3831 	ld a,yh 
      00A0A2 81 EB A6         [ 1] 3832 	xor a,seedy 
      00A0A5 2E CD 83         [ 1] 3833 	ld seedy,a  
      00A0A8 71 1E            [ 1] 3834 	ld a,yl 
      00A0AA 01 1C 00         [ 1] 3835 	xor a,seedy+1 
      00A0AD 80 1F 01         [ 1] 3836 	ld seedy+1,a 
                                   3837 ; acc16>>3 
      00A0B0 C3 00 1C         [ 2] 3838 	ldw x,acc16 
      00A0B3 24               [ 2] 3839 	srlw x 
      00A0B4 08               [ 2] 3840 	srlw x 
      00A0B5 AE               [ 2] 3841 	srlw x 
                                   3842 ; x=acc16^x 
      00A0B6 00               [ 1] 3843 	ld a,xh 
      00A0B7 80 CD 9F         [ 1] 3844 	xor a,acc16 
      00A0BA D7               [ 1] 3845 	ld xh,a 
      00A0BB 20               [ 1] 3846 	ld a,xl 
      00A0BC E2 00 0D         [ 1] 3847 	xor a,acc8 
      00A0BD 97               [ 1] 3848 	ld xl,a 
                                   3849 ; seedy=x^seedy 
      00A0BD 5B 02 81         [ 1] 3850 	xor a,seedy+1
      00A0C0 42               [ 1] 3851 	ld xl,a 
      00A0C1 43               [ 1] 3852 	ld a,xh 
      00A0C2 43 61 6E         [ 1] 3853 	xor a,seedy
      00A0C5 27               [ 1] 3854 	ld xh,a 
      00A0C6 74 20 66         [ 2] 3855 	ldw seedy,x 
                                   3856 ; return seedy modulo expr + 1 
      00A0C9 6C 61            [ 2] 3857 	popw y 
      00A0CB 73               [ 2] 3858 	divw x,y 
      00A0CC 68               [ 1] 3859 	ldw x,y 
      00A0CD 20               [ 1] 3860 	incw x 
      002369                       3861 10$:
      00A0CE 61 70            [ 1] 3862 	ld a,#TK_INTGR
      00A0D0 70               [ 4] 3863 	ret 
                                   3864 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



                                   3865 ;---------------------------------
                                   3866 ; BASIC: WORDS 
                                   3867 ; affiche la listes des mots du
                                   3868 ; dictionnaire ainsi que le nombre
                                   3869 ; de mots.
                                   3870 ;---------------------------------
                           000001  3871 	WLEN=1 ; word length
                           000002  3872 	LLEN=2 ; character sent to console
                           000003  3873 	WCNT=3 ; count words printed 
                           000003  3874 	VSIZE=3 
      00236C                       3875 words:
      00236C                       3876 	_vars VSIZE
      00A0D1 6C 69            [ 2]    1     sub sp,#VSIZE 
      00A0D3 63 61            [ 1] 3877 	clr (LLEN,sp)
      00A0D5 74 69            [ 1] 3878 	clr (WCNT,sp)
      00A0D7 6F 6E 2C 20      [ 2] 3879 	ldw y,#kword_dict+2
      00A0DB 61               [ 1] 3880 0$:	ldw x,y
      00A0DC 6C               [ 1] 3881 	ld a,(x)
      00A0DD 72 65            [ 1] 3882 	and a,#15 
      00A0DF 61 64            [ 1] 3883 	ld (WLEN,sp),a 
      00A0E1 79 20            [ 1] 3884 	inc (WCNT,sp)
      00A0E3 6F               [ 1] 3885 1$:	incw x 
      00A0E4 6E               [ 1] 3886 	ld a,(x)
      00A0E5 65 20 69         [ 4] 3887 	call putc 
      00A0E8 6E 20            [ 1] 3888 	inc (LLEN,sp)
      00A0EA 46 4C            [ 1] 3889 	dec (WLEN,sp)
      00A0EC 41 53            [ 1] 3890 	jrne 1$
      00A0EE 48 0A            [ 1] 3891 	ld a,#70
      00A0F0 75 73            [ 1] 3892 	cp a,(LLEN,sp)
      00A0F2 65 20            [ 1] 3893 	jrmi 2$   
      00A0F4 45 52            [ 1] 3894 	ld a,#SPACE 
      00A0F6 41 53 45         [ 4] 3895 	call putc 
      00A0F9 20 62            [ 1] 3896 	inc (LLEN,sp) 
      00A0FB 65 66            [ 2] 3897 	jra 3$
      00A0FD 6F 72            [ 1] 3898 2$: ld a,#CR 
      00A0FF 65 00 4E         [ 4] 3899 	call putc 
      00A102 6F 20            [ 1] 3900 	clr (LLEN,sp)
      00A104 61 70 70 6C      [ 2] 3901 3$:	subw y,#2 
      00A108 69 63            [ 2] 3902 	ldw y,(y)
      00A10A 61 74            [ 1] 3903 	jrne 0$ 
      00A10C 69 6F            [ 1] 3904 	ld a,#CR 
      00A10E 6E 20 69         [ 4] 3905 	call putc  
      00A111 6E               [ 1] 3906 	clrw x 
      00A112 20 52            [ 1] 3907 	ld a,(WCNT,sp)
      00A114 41               [ 1] 3908 	ld xl,a 
      00A115 4D 00 E9         [ 4] 3909 	call print_int 
      00A117 AE 23 BC         [ 2] 3910 	ldw x,#words_count_msg
      00A117 52 03 72         [ 4] 3911 	call puts 
      0023B9                       3912 	_drop VSIZE 
      00A11A 5F 00            [ 2]    1     addw sp,#VSIZE 
      00A11C 17               [ 4] 3913 	ret 
      00A11D CD 97 C6 A1 84 27 03  3914 words_count_msg: .asciz " words in dictionary\n"
             CC 92 1A 1F 01 CD 93
             1B A1 09 27 02 20 19
             CD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



                                   3915 
                                   3916 
                                   3917 ;-----------------------------
                                   3918 ; BASIC: TIMER expr 
                                   3919 ; initialize count down timer 
                                   3920 ;-----------------------------
      0023D2                       3921 set_timer:
      00A133 97 C6 A1         [ 4] 3922 	call arg_list
      00A136 84 27            [ 1] 3923 	cp a,#1 
      00A138 03 CC            [ 1] 3924 	jreq 1$
      00A13A 92 1A 9F         [ 2] 3925 	jp syntax_error
      0023DC                       3926 1$: 
      00A13D 1E               [ 2] 3927 	popw x 
      00A13E 01 CF 00         [ 2] 3928 	ldw timer,x 
      00A141 18               [ 4] 3929 	ret 
                                   3930 
                                   3931 ;------------------------------
                                   3932 ; BASIC: TIMEOUT 
                                   3933 ; return state of timer 
                                   3934 ;------------------------------
      0023E1                       3935 timeout:
      00A142 5F CD 82         [ 2] 3936 	ldw x,timer 
      0023E4                       3937 logical_complement:
      00A145 30               [ 2] 3938 	cplw x 
      00A146 1E 01 5C         [ 2] 3939 	cpw x,#-1
      00A149 20 DC            [ 1] 3940 	jreq 2$
      00A14B 5F               [ 1] 3941 	clrw x 
      00A14B 5B 03            [ 1] 3942 2$:	ld a,#TK_INTGR
      00A14D 81               [ 4] 3943 	ret 
                                   3944 
                                   3945 ;--------------------------------
                                   3946 ; BASIC NOT(expr) 
                                   3947 ; return logical complement of expr
                                   3948 ;--------------------------------
      00A14E                       3949 func_not:
      00A14E CD 96 C2         [ 4] 3950 	call func_args  
      00A151 A1 01            [ 1] 3951 	cp a,#1
      00A153 27 03            [ 1] 3952 	jreq 1$
      00A155 CC 92 1A         [ 2] 3953 	jp syntax_error
      00A158 85               [ 2] 3954 1$:	popw x 
      00A159 9F A4            [ 2] 3955 	jra logical_complement
                                   3956 
                                   3957 
                                   3958 
                                   3959 ;-----------------------------------
                                   3960 ; BASIC: IWDGEN expr1 
                                   3961 ; enable independant watchdog timer
                                   3962 ; expr1 is delay in multiple of 62.5µsec
                                   3963 ; expr1 -> {1..16383}
                                   3964 ;-----------------------------------
      0023FB                       3965 enable_iwdg:
      00A15B 7F 97 A6         [ 4] 3966 	call arg_list
      00A15E 03 81            [ 1] 3967 	cp a,#1 
      00A160 27 03            [ 1] 3968 	jreq 1$
      00A160 A6 07 CD         [ 2] 3969 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      00A163 96               [ 2] 3970 1$: popw x 
      00A164 B5 CD            [ 1] 3971 	push #0
      00A166 93 1B A1 02      [ 1] 3972 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A16A 27               [ 1] 3973 	ld a,xh 
      00A16B 0E A1            [ 1] 3974 	and a,#0x3f
      00A16D 03               [ 1] 3975 	ld xh,a  
      00A16E 27 0D A1         [ 2] 3976 2$:	cpw x,#255
      00A171 82 27            [ 2] 3977 	jrule 3$
      00A173 03 CC            [ 1] 3978 	inc (1,sp)
      00A175 92               [ 1] 3979 	rcf 
      00A176 1A               [ 2] 3980 	rrcw x 
      00A177 FD 20            [ 2] 3981 	jra 2$
      00A179 03 55 50 E0      [ 1] 3982 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A17A 84               [ 1] 3983 	pop a  
      00A17A F6 5F 97         [ 1] 3984 	ld IWDG_PR,a 
      00A17D 9F               [ 1] 3985 	ld a,xl
      00A17D 89               [ 1] 3986 	dec a 
      00A17E A6 08 CD 96      [ 1] 3987 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A182 B5 85 A6         [ 1] 3988 	ld IWDG_RLR,a 
      00A185 84 81 50 E0      [ 1] 3989 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A187 81               [ 4] 3990 	ret 
                                   3991 
                                   3992 
                                   3993 ;-----------------------------------
                                   3994 ; BASIC: IWDGREF  
                                   3995 ; refresh independant watchdog count down 
                                   3996 ; timer before it reset MCU. 
                                   3997 ;-----------------------------------
      002431                       3998 refresh_iwdg:
      00A187 CD 83 81 5F      [ 1] 3999 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A18B 97               [ 4] 4000 	ret 
                                   4001 
                                   4002 
                                   4003 ;-------------------------------------
                                   4004 ; BASIC: LOG(expr)
                                   4005 ; return logarithm base 2 of expr 
                                   4006 ; this is the position of most significant
                                   4007 ; bit set. 
                                   4008 ; input: 
                                   4009 ; output:
                                   4010 ;   X     log2 
                                   4011 ;   A     TK_INTGR 
                                   4012 ;*********************************
      002436                       4013 log2:
      00A18C A6 84 81         [ 4] 4014 	call func_args 
      00A18F A1 01            [ 1] 4015 	cp a,#1 
      00A18F 5F C6            [ 1] 4016 	jreq 1$
      00A191 00 2B C1         [ 2] 4017 	jp syntax_error 
      00A194 00               [ 2] 4018 1$: popw x 
      002441                       4019 leading_one:
      00A195 2C               [ 2] 4020 	tnzw x 
      00A196 27 01            [ 1] 4021 	jreq 4$
      00A198 53 A6            [ 1] 4022 	ld a,#15 
      00A19A 84               [ 2] 4023 2$: rlcw x 
      00A19B 81 03            [ 1] 4024     jrc 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      00A19C 4A               [ 1] 4025 	dec a 
      00A19C CD 96            [ 2] 4026 	jra 2$
      00A19E C2               [ 1] 4027 3$: clrw x 
      00A19F A1               [ 1] 4028     ld xl,a
      00A1A0 02 27            [ 1] 4029 4$:	ld a,#TK_INTGR
      00A1A2 03               [ 4] 4030 	ret 
                                   4031 
                                   4032 ;-----------------------------------
                                   4033 ; BASIC: BIT(expr) 
                                   4034 ; expr ->{0..15}
                                   4035 ; return 2^expr 
                                   4036 ; output:
                                   4037 ;    x    2^expr 
                                   4038 ;-----------------------------------
      002451                       4039 bitmask:
      00A1A3 CC 92 1A         [ 4] 4040     call func_args 
      00A1A6 A1 01            [ 1] 4041 	cp a,#1
      00A1A6 1E 03            [ 1] 4042 	jreq 1$
      00A1A8 2B 17 A3         [ 2] 4043 	jp syntax_error 
      00A1AB 00               [ 2] 4044 1$: popw x 
      00A1AC 09               [ 1] 4045 	ld a,xl 
      00A1AD 2A 12            [ 1] 4046 	and a,#15
      00A1AF A6               [ 1] 4047 	clrw x 
      00A1B0 05               [ 1] 4048 	incw x 
      00A1B1 42               [ 1] 4049 2$: tnz a 
      00A1B2 1C 50            [ 1] 4050 	jreq 3$
      00A1B4 00               [ 2] 4051 	slaw x 
      00A1B5 1F               [ 1] 4052 	dec a 
      00A1B6 03 1E            [ 2] 4053 	jra 2$ 
      00A1B8 01 72            [ 1] 4054 3$: ld a,#TK_INTGR
      00A1BA FB               [ 4] 4055 	ret 
                                   4056 
                                   4057 ;------------------------------
                                   4058 ; BASIC: INVERT(expr)
                                   4059 ; 1's complement 
                                   4060 ;--------------------------------
      00246B                       4061 invert:
      00A1BB 03 A6 84         [ 4] 4062 	call func_args
      00A1BE 5B 04            [ 1] 4063 	cp a,#1 
      00A1C0 81 03            [ 1] 4064 	jreq 1$
      00A1C1 CC 11 9A         [ 2] 4065 	jp syntax_error
      00A1C1 A6               [ 2] 4066 1$: popw x  
      00A1C2 0A               [ 2] 4067 	cplw x 
      00A1C3 CC 92            [ 1] 4068 	ld a,#TK_INTGR 
      00A1C5 1C               [ 4] 4069 	ret 
                                   4070 
                                   4071 ;------------------------------
                                   4072 ; BASIC: DO 
                                   4073 ; initiate a DO ... UNTIL loop 
                                   4074 ;------------------------------
                           000003  4075 	DOLP_ADR=3 
                           000005  4076 	DOLP_INW=5
                           000004  4077 	VSIZE=4 
      00A1C6                       4078 do_loop:
      00A1C6 CE               [ 2] 4079 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      00247B                       4080 	_vars VSIZE 
      00A1C7 AC 00            [ 2]    1     sub sp,#VSIZE 
      00A1C9 A3               [ 2] 4081 	pushw x 
      00A1CA 10 93 27 08      [ 2] 4082 	ldw y,basicptr 
      00A1CE CE AC            [ 2] 4083 	ldw (DOLP_ADR,sp),y
      00A1D0 02 1C AC 04      [ 2] 4084 	ldw y,in.w 
      00A1D4 20 03            [ 2] 4085 	ldw (DOLP_INW,sp),y
      00A1D6 AE AC 00 A6      [ 1] 4086 	inc loop_depth 
      00A1DA 84               [ 4] 4087 	ret 
                                   4088 
                                   4089 ;--------------------------------
                                   4090 ; BASIC: UNTIL expr 
                                   4091 ; loop if exprssion is false 
                                   4092 ; else terminate loop
                                   4093 ;--------------------------------
      00248F                       4094 until: 
      00A1DB 81 5D 00 1D      [ 1] 4095 	tnz loop_depth 
      00A1DC 26 03            [ 1] 4096 	jrne 1$ 
      00A1DC 90 89 CD         [ 2] 4097 	jp syntax_error 
      002498                       4098 1$: 
      00A1DF 96 C2 A1         [ 4] 4099 	call relation 
      00A1E2 01 27            [ 1] 4100 	cp a,#TK_INTGR
      00A1E4 07 A1            [ 1] 4101 	jreq 2$
      00A1E6 02 27 03         [ 2] 4102 	jp syntax_error
      0024A2                       4103 2$: 
      00A1E9 CC               [ 2] 4104 	tnzw x 
      00A1EA 92 1A            [ 1] 4105 	jrne 9$
      00A1EC 90 85            [ 2] 4106 	ldw x,(DOLP_ADR,sp)
      00A1EE A1 01 27         [ 2] 4107 	ldw basicptr,x 
      00A1F1 02 85            [ 1] 4108 	ld a,(2,x)
      00A1F3 51 90 FD         [ 1] 4109 	ld count,a 
      00A1F6 90 85            [ 2] 4110 	ldw x,(DOLP_INW,sp)
      00A1F8 81 00 00         [ 2] 4111 	ldw in.w,x 
      00A1F9 81               [ 4] 4112 	ret 
      0024B5                       4113 9$:	; remove loop data from stack  
      00A1F9 72               [ 2] 4114 	popw x
      0024B6                       4115 	_drop VSIZE
      00A1FA 0D 52            [ 2]    1     addw sp,#VSIZE 
      00A1FC 30 FB 8E CC      [ 1] 4116 	dec loop_depth 
      00A200 8F               [ 2] 4117 	jp (x)
                                   4118 
                                   4119 ;--------------------------
                                   4120 ; BASIC: PRTA...PRTI  
                                   4121 ;  return constant value 
                                   4122 ;  PORT  offset in GPIO
                                   4123 ;  array
                                   4124 ;---------------------------
      0024BD                       4125 const_porta:
      00A201 5F 00 00         [ 2] 4126 	ldw x,#0
      00A202 A6 84            [ 1] 4127 	ld a,#TK_INTGR 
      00A202 72               [ 4] 4128 	ret 
      0024C3                       4129 const_portb:
      00A203 0D 52 30         [ 2] 4130 	ldw x,#1
      00A206 FB 72            [ 1] 4131 	ld a,#TK_INTGR 
      00A208 16               [ 4] 4132 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      0024C9                       4133 const_portc:
      00A209 00 21 8E         [ 2] 4134 	ldw x,#2
      00A20C 81 84            [ 1] 4135 	ld a,#TK_INTGR 
      00A20D 81               [ 4] 4136 	ret 
      0024CF                       4137 const_portd:
      00A20D CD 97 C6         [ 2] 4138 	ldw x,#3
      00A210 A1 84            [ 1] 4139 	ld a,#TK_INTGR 
      00A212 27               [ 4] 4140 	ret 
      0024D5                       4141 const_porte:
      00A213 03 CC 92         [ 2] 4142 	ldw x,#4
      00A216 1A 84            [ 1] 4143 	ld a,#TK_INTGR 
      00A217 81               [ 4] 4144 	ret 
      0024DB                       4145 const_portf:
      00A217 5D 27 04         [ 2] 4146 	ldw x,#5
      00A21A 8F 5A            [ 1] 4147 	ld a,#TK_INTGR 
      00A21C 26               [ 4] 4148 	ret 
      0024E1                       4149 const_portg:
      00A21D F9 4F 81         [ 2] 4150 	ldw x,#6
      00A220 A6 84            [ 1] 4151 	ld a,#TK_INTGR 
      00A220 CD               [ 4] 4152 	ret 
      0024E7                       4153 const_porth:
      00A221 97 C6 A1         [ 2] 4154 	ldw x,#7
      00A224 84 27            [ 1] 4155 	ld a,#TK_INTGR 
      00A226 03               [ 4] 4156 	ret 
      0024ED                       4157 const_porti:
      00A227 CC 92 1A         [ 2] 4158 	ldw x,#8
      00A22A A6 84            [ 1] 4159 	ld a,#TK_INTGR 
      00A22A A3               [ 4] 4160 	ret 
                                   4161 
                                   4162 ;-------------------------------
                                   4163 ; following return constant 
                                   4164 ; related to GPIO register offset 
                                   4165 ;---------------------------------
      0024F3                       4166 const_odr:
      00A22B 14 00            [ 1] 4167 	ld a,#TK_INTGR 
      00A22D 2B 0C 35         [ 2] 4168 	ldw x,#GPIO_ODR
      00A230 0F               [ 4] 4169 	ret 
      0024F9                       4170 const_idr:
      00A231 50 F2            [ 1] 4171 	ld a,#TK_INTGR 
      00A233 A6 1E 62         [ 2] 4172 	ldw x,#GPIO_IDR
      00A236 A6               [ 4] 4173 	ret 
      0024FF                       4174 const_ddr:
      00A237 10 62            [ 1] 4175 	ld a,#TK_INTGR 
      00A239 20 1E 02         [ 2] 4176 	ldw x,#GPIO_DDR
      00A23B 81               [ 4] 4177 	ret 
      002505                       4178 const_cr1:
      00A23B A3 08            [ 1] 4179 	ld a,#TK_INTGR 
      00A23D 00 2B 09         [ 2] 4180 	ldw x,#GPIO_CR1
      00A240 35               [ 4] 4181 	ret 
      00250B                       4182 const_cr2:
      00A241 0E 50            [ 1] 4183 	ld a,#TK_INTGR 
      00A243 F2 A6 50         [ 2] 4184 	ldw x,#GPIO_CR2
      00A246 62               [ 4] 4185 	ret 
                                   4186 ;-------------------------
                                   4187 ; BASIC: POUT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



                                   4188 ;  constant for port mode
                                   4189 ;  used by PMODE 
                                   4190 ;  to set pin as output
                                   4191 ;------------------------
      002511                       4192 const_output:
      00A247 20 10            [ 1] 4193 	ld a,#TK_INTGR 
      00A249 AE 00 01         [ 2] 4194 	ldw x,#OUTP
      00A249 35               [ 4] 4195 	ret 
                                   4196 
                                   4197 ;-------------------------
                                   4198 ; BASIC: PINP 
                                   4199 ;  constant for port mode
                                   4200 ;  used by PMODE 
                                   4201 ;  to set pin as input
                                   4202 ;------------------------
      002517                       4203 const_input:
      00A24A 07 50            [ 1] 4204 	ld a,#TK_INTGR 
      00A24C F2 00 00         [ 2] 4205 	ldw x,#INP 
      00A24D 81               [ 4] 4206 	ret 
                                   4207 	
                                   4208 ;-----------------------
                                   4209 ; memory area constants
                                   4210 ;-----------------------
      00251D                       4211 const_eeprom_base:
      00A24D A3 00            [ 1] 4212 	ld a,#TK_INTGR 
      00A24F 40 23 07         [ 2] 4213 	ldw x,#EEPROM_BASE 
      00A252 72               [ 4] 4214 	ret 
                                   4215 
                                   4216 ;---------------------------
                                   4217 ; BASIC: DATA 
                                   4218 ; when the interpreter find 
                                   4219 ; a DATA line it skip it.
                                   4220 ;---------------------------
      002523                       4221 data:
      00A253 5C 50 F2 54 20   [ 1] 4222 	mov in,count 
      00A258 F4               [ 4] 4223 	ret 
                                   4224 
                                   4225 ;---------------------------
                                   4226 ; BASIC: DATLN  *expr*
                                   4227 ; set DATA pointer at line# 
                                   4228 ; specified by *expr* 
                                   4229 ;---------------------------
      00A259                       4230 data_line:
      00A259 9F 4A 27         [ 4] 4231 	call expression
      00A25C 01 4A            [ 1] 4232 	cp a,#TK_INTGR
      00A25E 27 03            [ 1] 4233 	jreq 1$
      00A25E A4 3E C7         [ 2] 4234 	jp syntax_error  
      00A261 50               [ 1] 4235 1$: clr a 
      00A262 F1 72 18         [ 4] 4236 	call search_lineno
      00A265 50               [ 2] 4237 	tnzw x 
      00A266 F0 8E            [ 1] 4238 	jrne 3$
      00A268 81 05            [ 1] 4239 2$:	ld a,#ERR_NO_LINE 
      00A269 CC 11 9C         [ 2] 4240 	jp tb_error
      00253F                       4241 3$: ; check if valid data line 
      00A269 CE 00            [ 1] 4242     ldw y,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00A26B 0F A6            [ 2] 4243 	ldw x,(4,x)
      00A26D 84 81 23         [ 2] 4244 	cpw x,#data 
      00A26F 26 F2            [ 1] 4245 	jrne 2$ 
      00A26F CD 96 C2 A1      [ 2] 4246 	ldw data_ptr,y
      00A273 01 27 03         [ 1] 4247 	ld a,(2,y)
      00A276 CC 92 1A         [ 1] 4248 	ld data_len,a 
      00A279 35 06 00 08      [ 1] 4249 	mov data_ofs,#FIRST_DATA_ITEM 
      00A279 85               [ 4] 4250 	ret
                                   4251 
                                   4252 ;---------------------------------
                                   4253 ; BASIC: RESTORE 
                                   4254 ; set data_ptr to first data line
                                   4255 ; if not DATA found pointer set to
                                   4256 ; zero 
                                   4257 ;---------------------------------
      002557                       4258 restore:
      00A27A 9E A5 80 27      [ 1] 4259 	clr data_ptr 
      00A27E 01 50 A6 84      [ 1] 4260 	clr data_ptr+1
      00A282 81 5F 00 08      [ 1] 4261 	clr data_ofs 
      00A283 72 5F 00 09      [ 1] 4262 	clr data_len
      00A283 CD 96 C2         [ 2] 4263 	ldw x,txtbgn
      00256A                       4264 data_search_loop: 	
      00A286 A1 02 27         [ 2] 4265 	cpw x,txtend
      00A289 03 CC            [ 1] 4266 	jruge 9$
      00A28B 92 1A            [ 1] 4267 	ldw y,x 
      00A28D 85 9E            [ 2] 4268 	ldw x,(4,x)
      00A28F 14 01 95         [ 2] 4269 	addw x,#code_addr
      00A292 9F               [ 2] 4270 	ldw x,(x)
      00A293 14 02 97         [ 2] 4271 	cpw x,#data 
      00A296 5B 02            [ 1] 4272 	jrne try_next_line 
      00A298 A6 84 81 06      [ 2] 4273 	ldw data_ptr,y 
      00A29B 90 E6 02         [ 1] 4274 	ld a,(2,y)
      00A29B CD 96 C2         [ 1] 4275 	ld data_len,a 
      00A29E A1 02 27 03      [ 1] 4276 	mov data_ofs,#FIRST_DATA_ITEM
      00A2A2 CC 92 1A 09      [ 1] 4277 9$:	tnz data_len 
      00A2A5 26 05            [ 1] 4278     jrne 10$
      00A2A5 85 9E            [ 1] 4279 	ld a,#ERR_NO_DATA 
      00A2A7 1A 01 95         [ 2] 4280 	jp tb_error 
      00A2AA 9F               [ 4] 4281 10$:ret
      002596                       4282 try_next_line:
      00A2AB 1A               [ 1] 4283 	ldw x,y 
      00A2AC 02 97            [ 1] 4284 	ld a,(2,x)
      00A2AE 5B 02 A6         [ 1] 4285 	ld acc8,a 
      00A2B1 84 81 00 0C      [ 1] 4286 	clr acc16 
      00A2B3 72 BB 00 0C      [ 2] 4287 	addw x,acc16 
      00A2B3 CD 96            [ 2] 4288 	jra data_search_loop
                                   4289 
                                   4290 
                                   4291 ;---------------------------------
                                   4292 ; BASIC: READ 
                                   4293 ; return next data item | 0 
                                   4294 ;---------------------------------
                           000001  4295 	CTX_BPTR=1 
                           000003  4296 	CTX_IN=3 
                           000004  4297 	CTX_COUNT=4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



                           000005  4298 	XSAVE=5
                           000006  4299 	VSIZE=6
      0025A6                       4300 read:
      0025A6                       4301 	_vars  VSIZE 
      00A2B5 C2 A1            [ 2]    1     sub sp,#VSIZE 
      0025A8                       4302 read01:	
      00A2B7 02 27 03         [ 1] 4303 	ld a,data_ofs
      00A2BA CC 92 1A         [ 1] 4304 	cp a,data_len 
      00A2BD 27 37            [ 1] 4305 	jreq 2$ ; end of line  
      00A2BD 85 9E 18         [ 4] 4306 	call save_context
      00A2C0 01 95 9F         [ 2] 4307 	ldw x,data_ptr 
      00A2C3 18 02 97         [ 2] 4308 	ldw basicptr,x 
      00A2C6 5B 02 A6 84 81   [ 1] 4309 	mov in,data_ofs 
      00A2CB 55 00 09 00 03   [ 1] 4310 	mov count,data_len  
      00A2CB CD 96 C2         [ 4] 4311 	call expression 
      00A2CE A1 02            [ 1] 4312 	cp a,#TK_INTGR 
      00A2D0 27 03            [ 1] 4313 	jreq 1$ 
      00A2D2 CC 92 1A         [ 2] 4314 	jp syntax_error 
      0025CD                       4315 1$:
      00A2D5 90 85            [ 2] 4316 	ldw (XSAVE,SP),x
      00A2D7 85 90 5D         [ 4] 4317 	call next_token ; skip comma
      00A2DA 27 05 58         [ 2] 4318 	ldw x,basicptr 
      00A2DD 90 5A 26         [ 2] 4319 	ldw data_ptr,x 
      00A2E0 FB 00 01 00 08   [ 1] 4320 	mov data_ofs,in 
      00A2E1 CD 1A 4C         [ 4] 4321 	call rest_context
      00A2E1 A6 84            [ 2] 4322 	ldw x,(XSAVE,sp)
      00A2E3 81 84            [ 1] 4323 	ld a,#TK_INTGR
      00A2E4                       4324 	_drop VSIZE 
      00A2E4 CD 96            [ 2]    1     addw sp,#VSIZE 
      00A2E6 C2               [ 4] 4325 	ret 
      0025E7                       4326 2$: ; end of line reached 
      00A2E7 A1 02 27 03      [ 2] 4327 	ldw y, data_ptr 
      00A2EB CC 92 1A 90      [ 1] 4328 	clr data_ptr
      00A2EF 85 85 90 5D      [ 1] 4329 	clr data_ptr+1   
      00A2F3 27 05 54 90      [ 1] 4330 	clr data_ofs 
      00A2F7 5A 26 FB 09      [ 1] 4331 	clr data_len 
      00A2FA CD 25 96         [ 4] 4332 	call try_next_line 
      00A2FA A6 84            [ 2] 4333 	jra read01
                                   4334 
                                   4335 
                                   4336 ;---------------------------------
                                   4337 ; BASIC: SPIEN clkdiv, 0|1  
                                   4338 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4339 ; if clkdiv==-1 disable SPI
                                   4340 ; 0|1 -> disable|enable  
                                   4341 ;--------------------------------- 
                           000005  4342 SPI_CS_BIT=5
      002600                       4343 spi_enable:
      00A2FC 81 16 47         [ 4] 4344 	call arg_list 
      00A2FD A1 02            [ 1] 4345 	cp a,#2
      00A2FD A6 84            [ 1] 4346 	jreq 1$
      00A2FF CD 96 B5         [ 2] 4347 	jp syntax_error 
      00260A                       4348 1$: 
      00A302 9F A4 07 C7      [ 1] 4349 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A306 50               [ 2] 4350 	popw x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00A307 C6               [ 2] 4351 	tnzw x 
      00A308 81 21            [ 1] 4352 	jreq spi_disable 
      00A309 85               [ 2] 4353 	popw x 
      00A309 52 01            [ 1] 4354 	ld a,#(1<<SPI_CR1_BR)
      00A30B CD               [ 4] 4355 	mul x,a 
      00A30C 96               [ 1] 4356 	ld a,xl 
      00A30D C7 A1 02         [ 1] 4357 	ld SPI_CR1,a 
                                   4358 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A310 27 03 CC 92      [ 1] 4359 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A314 1A 90 85 85      [ 1] 4360 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4361 ; configure SPI as master mode 0.	
      00A318 CD A3 55 6B      [ 1] 4362 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4363 ; ~CS line controlled by sofware 	
      00A31C 01 A6 01 0D      [ 1] 4364 	bset SPI_CR2,#SPI_CR2_SSM 
      00A320 01 27 0D 48      [ 1] 4365     bset SPI_CR2,#SPI_CR2_SSI 
                                   4366 ; enable SPI
      00A324 0A 01 26 FB      [ 1] 4367 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A328 6B               [ 4] 4368 	ret 
      002633                       4369 spi_disable:
      002633                       4370 	_drop #2; throw first argument.
      00A329 01 7B            [ 2]    1     addw sp,##2 
                                   4371 ; wait spi idle 
      00A32B 01 EA            [ 1] 4372 1$:	ld a,#0x82 
      00A32D 03 E7 03         [ 1] 4373 	and a,SPI_SR
      00A330 90 A3            [ 1] 4374 	cp a,#2 
      00A332 00 01            [ 1] 4375 	jrne 1$
      00A334 27 10 7B 01      [ 1] 4376 	bres SPI_CR1,#SPI_CR1_SPE
      00A338 43 E4 04 E7      [ 1] 4377 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A33C 04 7B 01 43      [ 1] 4378 	bres PE_DDR,#SPI_CS_BIT 
      00A340 E4               [ 4] 4379 	ret 
                                   4380 
      00264B                       4381 spi_clear_error:
      00A341 02 E7            [ 1] 4382 	ld a,#0x78 
      00A343 02 20 0C         [ 1] 4383 	bcp a,SPI_SR 
      00A346 27 04            [ 1] 4384 	jreq 1$
      00A346 7B 01 EA 02      [ 1] 4385 	clr SPI_SR 
      00A34A E7               [ 4] 4386 1$: ret 
                                   4387 
      002657                       4388 spi_send_byte:
      00A34B 02               [ 1] 4389 	push a 
      00A34C 7B 01 EA         [ 4] 4390 	call spi_clear_error
      00A34F 04               [ 1] 4391 	pop a 
      00A350 E7 04 52 03 FB   [ 2] 4392 	btjf SPI_SR,#SPI_SR_TXE,.
      00A352 C7 52 04         [ 1] 4393 	ld SPI_DR,a
      00A352 5B 01 81 03 FB   [ 2] 4394 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A355 C6 52 04         [ 1] 4395 	ld a,SPI_DR 
      00A355 58               [ 4] 4396 	ret 
                                   4397 
      00266D                       4398 spi_rcv_byte:
      00A356 1C A3            [ 1] 4399 	ld a,#255
      00A358 65 FE 9F 88 5E   [ 2] 4400 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A35D A6 05 42         [ 1] 4401 	ld a,SPI_DR 
      00A360 1C               [ 4] 4402 	ret
                                   4403 
                                   4404 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



                                   4405 ; BASIC: SPIWR byte [,byte]
                                   4406 ; write 1 or more byte
                                   4407 ;------------------------------
      002678                       4408 spi_write:
      00A361 50 00 84         [ 4] 4409 	call expression
      00A364 81 84            [ 1] 4410 	cp a,#TK_INTGR 
      00A365 27 03            [ 1] 4411 	jreq 1$
      00A365 03 06 03         [ 2] 4412 	jp syntax_error 
      002682                       4413 1$:	
      00A368 05               [ 1] 4414 	ld a,xl 
      00A369 04 00 02         [ 4] 4415 	call spi_send_byte 
      00A36C 01 06 00         [ 4] 4416 	call next_token 
      00A36F 02 02            [ 1] 4417 	cp a,#TK_COMMA 
      00A371 02 03            [ 1] 4418 	jrne 2$ 
      00A373 03 01            [ 2] 4419 	jra spi_write 
      00A375 03               [ 1] 4420 2$:	tnz a 
      00A376 03 02            [ 1] 4421 	jreq 3$
      002692                       4422 	_unget_token  
      00A378 04 04 05 02 06   [ 1]    1      mov in,in.saved  
      00A37D 02               [ 4] 4423 3$:	ret 
                                   4424 
                                   4425 
                                   4426 ;-------------------------------
                                   4427 ; BASIC: SPIRD 	
                                   4428 ; read one byte from SPI 
                                   4429 ;-------------------------------
      002698                       4430 spi_read:
      00A37E 07 02 05         [ 4] 4431 	call spi_rcv_byte 
      00A381 04               [ 1] 4432 	clrw x 
      00A382 02               [ 1] 4433 	ld xl,a 
      00A383 04 01            [ 1] 4434 	ld a,#TK_INTGR 
      00A385 81               [ 4] 4435 	ret 
                                   4436 
                                   4437 ;------------------------------
                                   4438 ; BASIC: SPISEL 0|1 
                                   4439 ; set state of ~CS line
                                   4440 ; 0|1 deselect|select  
                                   4441 ;------------------------------
      0026A0                       4442 spi_select:
      00A385 CD 96 C2         [ 4] 4443 	call next_token 
      00A388 A1 01            [ 1] 4444 	cp a,#TK_INTGR 
      00A38A 27 03            [ 1] 4445 	jreq 1$
      00A38C CC 92 1A         [ 2] 4446 	jp syntax_error 
      00A38F 5D               [ 2] 4447 1$: tnzw x  
      00A38F A6 80            [ 1] 4448 	jreq cs_high 
      00A391 15 01 27 05      [ 1] 4449 	bres PE_ODR,#SPI_CS_BIT
      00A395 A6               [ 4] 4450 	ret 
      0026B2                       4451 cs_high: 
      00A396 0A CC 92 1C      [ 1] 4452 	bset PE_ODR,#SPI_CS_BIT
      00A39A 81               [ 4] 4453 	ret 
                                   4454 
                                   4455 ;-------------------------------
                                   4456 ; BASIC: PAD 
                                   4457 ; Return pad buffer address.
                                   4458 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      0026B7                       4459 pad_ref:
      00A39A CE 00 13         [ 2] 4460 	ldw x,#pad 
      00A39D 58 58            [ 1] 4461 	ld a,TK_INTGR
      00A39F 58               [ 4] 4462 	ret 
                                   4463 
                                   4464 
                                   4465 ;------------------------------
                                   4466 ;      dictionary 
                                   4467 ; format:
                                   4468 ;   link:   2 bytes 
                                   4469 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   4470 ;   cmd_name: 16 byte max 
                                   4471 ;   cmd_index: 2 bytes 
                                   4472 ;------------------------------
                                   4473 	.macro _dict_entry len,name,cmd_idx 
                                   4474 	.word LINK 
                                   4475 	LINK=.
                                   4476 name:
                                   4477 	.byte len 	
                                   4478 	.ascii "name"
                                   4479 	.word cmd_idx 
                                   4480 	.endm 
                                   4481 
                           000000  4482 	LINK=0
                                   4483 ; respect alphabetic order for BASIC names from Z-A
                                   4484 ; this sort order is for a cleaner WORDS cmd output. 	
      0026BD                       4485 kword_end:
      0026BD                       4486 	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
      00A3A0 58 58                    1 	.word LINK 
                           0026BF     2 	LINK=.
      0026BF                          3 XOR:
      00A3A2 9E                       4 	.byte 3+F_IFUNC 	
      00A3A3 C8 00 13                 5 	.ascii "XOR"
      00A3A6 C7 00                    6 	.word XOR_IDX 
      0026C5                       4487 	_dict_entry,5,WRITE,WRITE_IDX;write  
      00A3A8 0D 9F                    1 	.word LINK 
                           0026C7     2 	LINK=.
      0026C7                          3 WRITE:
      00A3AA C8                       4 	.byte 5 	
      00A3AB 00 14 C7 00 0E           5 	.ascii "WRITE"
      00A3B0 CE 00                    6 	.word WRITE_IDX 
      0026CF                       4488 	_dict_entry,5,WORDS,WORDS_IDX;words 
      00A3B2 15 CF                    1 	.word LINK 
                           0026D1     2 	LINK=.
      0026D1                          3 WORDS:
      00A3B4 00                       4 	.byte 5 	
      00A3B5 13 90 54 90 9E           5 	.ascii "WORDS"
      00A3BA C8 00                    6 	.word WORDS_IDX 
      0026D9                       4489 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      00A3BC 15 C7                    1 	.word LINK 
                           0026DB     2 	LINK=.
      0026DB                          3 WAIT:
      00A3BE 00                       4 	.byte 4 	
      00A3BF 15 90 9F C8              5 	.ascii "WAIT"
      00A3C3 00 16                    6 	.word WAIT_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      0026E2                       4490 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      00A3C5 C7 00                    1 	.word LINK 
                           0026E4     2 	LINK=.
      0026E4                          3 USR:
      00A3C7 16                       4 	.byte 3+F_IFUNC 	
      00A3C8 CE 00 0D                 5 	.ascii "USR"
      00A3CB 54 54                    6 	.word USR_IDX 
      0026EA                       4491 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      00A3CD 54 9E                    1 	.word LINK 
                           0026EC     2 	LINK=.
      0026EC                          3 UNTIL:
      00A3CF C8                       4 	.byte 5 	
      00A3D0 00 0D 95 9F C8           5 	.ascii "UNTIL"
      00A3D5 00 0E                    6 	.word UNTIL_IDX 
      0026F4                       4492 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      00A3D7 97 C8                    1 	.word LINK 
                           0026F6     2 	LINK=.
      0026F6                          3 UFLASH:
      00A3D9 00                       4 	.byte 6+F_IFUNC 	
      00A3DA 16 97 9E C8 00 15        5 	.ascii "UFLASH"
      00A3E0 95 CF                    6 	.word UFLASH_IDX 
      0026FF                       4493 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      00A3E2 00 15                    1 	.word LINK 
                           002701     2 	LINK=.
      002701                          3 UBOUND:
      00A3E4 90                       4 	.byte 6+F_IFUNC 	
      00A3E5 85 65 93 5C 4E 44        5 	.ascii "UBOUND"
      00A3E9 00 B4                    6 	.word UBOUND_IDX 
      00270A                       4494 	_dict_entry,4,TONE,TONE_IDX;tone  
      00A3E9 A6 84                    1 	.word LINK 
                           00270C     2 	LINK=.
      00270C                          3 TONE:
      00A3EB 81                       4 	.byte 4 	
      00A3EC 54 4F 4E 45              5 	.ascii "TONE"
      00A3EC 52 03                    6 	.word TONE_IDX 
      002713                       4495 	_dict_entry,2,TO,TO_IDX;to
      00A3EE 0F 02                    1 	.word LINK 
                           002715     2 	LINK=.
      002715                          3 TO:
      00A3F0 0F                       4 	.byte 2 	
      00A3F1 03 90                    5 	.ascii "TO"
      00A3F3 AE AA                    6 	.word TO_IDX 
      00271A                       4496 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00A3F5 D3 93                    1 	.word LINK 
                           00271C     2 	LINK=.
      00271C                          3 TIMER:
      00A3F7 F6                       4 	.byte 5 	
      00A3F8 A4 0F 6B 01 0C           5 	.ascii "TIMER"
      00A3FD 03 5C                    6 	.word TIMER_IDX 
      002724                       4497 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00A3FF F6 CD                    1 	.word LINK 
                           002726     2 	LINK=.
      002726                          3 TIMEOUT:
      00A401 83                       4 	.byte 7+F_IFUNC 	
      00A402 71 0C 02 0A 01 26 F5     5 	.ascii "TIMEOUT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal  A6-Bits]



      00A40A 46 11                    6 	.word TMROUT_IDX 
      002730                       4498 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00A40C 02 2B                    1 	.word LINK 
                           002732     2 	LINK=.
      002732                          3 TICKS:
      00A40E 09                       4 	.byte 5+F_IFUNC 	
      00A40F A6 20 CD 83 71           5 	.ascii "TICKS"
      00A414 0C 02                    6 	.word TICKS_IDX 
      00273A                       4499 	_dict_entry,4,STOP,STOP_IDX;stop 
      00A416 20 07                    1 	.word LINK 
                           00273C     2 	LINK=.
      00273C                          3 STOP:
      00A418 A6                       4 	.byte 4 	
      00A419 0D CD 83 71              5 	.ascii "STOP"
      00A41D 0F 02                    6 	.word STOP_IDX 
      002743                       4500 	_dict_entry,4,STEP,STEP_IDX;step 
      00A41F 72 A2                    1 	.word LINK 
                           002745     2 	LINK=.
      002745                          3 STEP:
      00A421 00                       4 	.byte 4 	
      00A422 02 90 FE 26              5 	.ascii "STEP"
      00A426 CF A6                    6 	.word STEP_IDX 
      00274C                       4501 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      00A428 0D CD                    1 	.word LINK 
                           00274E     2 	LINK=.
      00274E                          3 SPIWR:
      00A42A 83                       4 	.byte 5 	
      00A42B 71 5F 7B 03 97           5 	.ascii "SPIWR"
      00A430 CD 93                    6 	.word SPIWR_IDX 
      002756                       4502 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00A432 69 AE                    1 	.word LINK 
                           002758     2 	LINK=.
      002758                          3 SPISEL:
      00A434 A4                       4 	.byte 6 	
      00A435 3C CD 83 CE 5B 03        5 	.ascii "SPISEL"
      00A43B 81 20                    6 	.word SPISEL_IDX 
      002761                       4503 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      00A43D 77 6F                    1 	.word LINK 
                           002763     2 	LINK=.
      002763                          3 SPIRD:
      00A43F 72                       4 	.byte 5+F_IFUNC 	
      00A440 64 73 20 69 6E           5 	.ascii "SPIRD"
      00A445 20 64                    6 	.word SPIRD_IDX 
      00276B                       4504 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      00A447 69 63                    1 	.word LINK 
                           00276D     2 	LINK=.
      00276D                          3 SPIEN:
      00A449 74                       4 	.byte 5 	
      00A44A 69 6F 6E 61 72           5 	.ascii "SPIEN"
      00A44F 79 0A                    6 	.word SPIEN_IDX 
      002775                       4505 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      00A451 00 6D                    1 	.word LINK 
                           002777     2 	LINK=.
      00A452                          3 SLEEP:
      00A452 CD                       4 	.byte 5 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00A453 96 C7 A1 01 27           5 	.ascii "SLEEP"
      00A458 03 CC                    6 	.word SLEEP_IDX 
      00277F                       4506     _dict_entry,4,SIZE,SIZE_IDX; cmd_size 
      00A45A 92 1A                    1 	.word LINK 
                           002781     2 	LINK=.
      00A45C                          3 SIZE:
      00A45C 85                       4 	.byte 4 	
      00A45D CF 00 11 81              5 	.ascii "SIZE"
      00A461 00 C4                    6 	.word SIZE_IDX 
      002788                       4507 	_dict_entry,4,SHOW,SHOW_IDX;show 
      00A461 CE 00                    1 	.word LINK 
                           00278A     2 	LINK=.
      00278A                          3 SHOW:
      00A463 11                       4 	.byte 4 	
      00A464 53 48 4F 57              5 	.ascii "SHOW"
      00A464 53 A3                    6 	.word SHOW_IDX 
      002791                       4508 	_dict_entry,4,SAVE,SAVE_IDX ;save_app 
      00A466 FF FF                    1 	.word LINK 
                           002793     2 	LINK=.
      002793                          3 SAVE:
      00A468 27                       4 	.byte 4 	
      00A469 01 5F A6 84              5 	.ascii "SAVE"
      00A46D 81 36                    6 	.word SAVE_IDX 
      00A46E                       4509 	_dict_entry 3,RUN,RUN_IDX;run
      00A46E CD 96                    1 	.word LINK 
                           00279C     2 	LINK=.
      00279C                          3 RUN:
      00A470 C2                       4 	.byte 3 	
      00A471 A1 01 27                 5 	.ascii "RUN"
      00A474 03 CC                    6 	.word RUN_IDX 
      0027A2                       4510 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      00A476 92 1A                    1 	.word LINK 
                           0027A4     2 	LINK=.
      0027A4                          3 RSHIFT:
      00A478 85                       4 	.byte 6+F_IFUNC 	
      00A479 20 E9 48 49 46 54        5 	.ascii "RSHIFT"
      00A47B 00 94                    6 	.word RSHIFT_IDX 
      0027AD                       4511 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      00A47B CD 96                    1 	.word LINK 
                           0027AF     2 	LINK=.
      0027AF                          3 RND:
      00A47D C7                       4 	.byte 3+F_IFUNC 	
      00A47E A1 01 27                 5 	.ascii "RND"
      00A481 03 CC                    6 	.word RND_IDX 
      0027B5                       4512 	_dict_entry,6,RETURN,RET_IDX;return 
      00A483 92 1A                    1 	.word LINK 
                           0027B7     2 	LINK=.
      0027B7                          3 RETURN:
      00A485 85                       4 	.byte 6 	
      00A486 4B 00 35 CC 50 E0        5 	.ascii "RETURN"
      00A48C 9E A4                    6 	.word RET_IDX 
      0027C0                       4513 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00A48E 3F 95                    1 	.word LINK 
                           0027C2     2 	LINK=.
      0027C2                          3 RESTORE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00A490 A3                       4 	.byte 7 	
      00A491 00 FF 23 06 0C 01 98     5 	.ascii "RESTORE"
      00A498 56 20                    6 	.word REST_IDX 
      0027CC                       4514 	_dict_entry 6,REMARK,REM_IDX;remark 
      00A49A F5 35                    1 	.word LINK 
                           0027CE     2 	LINK=.
      0027CE                          3 REMARK:
      00A49C 55                       4 	.byte 6 	
      00A49D 50 E0 84 C7 50 E1        5 	.ascii "REMARK"
      00A4A3 9F 4A                    6 	.word REM_IDX 
      0027D7                       4515 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      00A4A5 35 55                    1 	.word LINK 
                           0027D9     2 	LINK=.
      0027D9                          3 REBOOT:
      00A4A7 50                       4 	.byte 6 	
      00A4A8 E0 C7 50 E2 35 AA        5 	.ascii "REBOOT"
      00A4AE 50 E0                    6 	.word RBT_IDX 
      0027E2                       4516 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      00A4B0 81 D9                    1 	.word LINK 
                           0027E4     2 	LINK=.
      00A4B1                          3 READ:
      00A4B1 35                       4 	.byte 4+F_IFUNC 	
      00A4B2 AA 50 E0 81              5 	.ascii "READ"
      00A4B6 00 88                    6 	.word READ_IDX 
      0027EB                       4517 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      00A4B6 CD 96                    1 	.word LINK 
                           0027ED     2 	LINK=.
      0027ED                          3 QKEY:
      00A4B8 C2                       4 	.byte 4+F_IFUNC 	
      00A4B9 A1 01 27 03              5 	.ascii "QKEY"
      00A4BD CC 92                    6 	.word QKEY_IDX 
      0027F4                       4518 	_dict_entry,4+F_IFUNC,PRTI,PRTI_IDX;const_porti 
      00A4BF 1A 85                    1 	.word LINK 
                           0027F6     2 	LINK=.
      00A4C1                          3 PRTI:
      00A4C1 5D                       4 	.byte 4+F_IFUNC 	
      00A4C2 27 0A A6 0F              5 	.ascii "PRTI"
      00A4C6 59 25                    6 	.word PRTI_IDX 
      0027FD                       4519 	_dict_entry,4+F_IFUNC,PRTH,PRTH_IDX;const_porth 
      00A4C8 03 4A                    1 	.word LINK 
                           0027FF     2 	LINK=.
      0027FF                          3 PRTH:
      00A4CA 20                       4 	.byte 4+F_IFUNC 	
      00A4CB FA 5F 97 A6              5 	.ascii "PRTH"
      00A4CF 84 81                    6 	.word PRTH_IDX 
      00A4D1                       4520 	_dict_entry,4+F_IFUNC,PRTG,PRTG_IDX;const_portg 
      00A4D1 CD 96                    1 	.word LINK 
                           002808     2 	LINK=.
      002808                          3 PRTG:
      00A4D3 C2                       4 	.byte 4+F_IFUNC 	
      00A4D4 A1 01 27 03              5 	.ascii "PRTG"
      00A4D8 CC 92                    6 	.word PRTG_IDX 
      00280F                       4521 	_dict_entry,4+F_IFUNC,PRTF,PRTF_IDX;const_portf
      00A4DA 1A 85                    1 	.word LINK 
                           002811     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



      002811                          3 PRTF:
      00A4DC 9F                       4 	.byte 4+F_IFUNC 	
      00A4DD A4 0F 5F 5C              5 	.ascii "PRTF"
      00A4E1 4D 27                    6 	.word PRTF_IDX 
      002818                       4522 	_dict_entry,4+F_IFUNC,PRTE,PRTE_IDX;const_porte
      00A4E3 04 58                    1 	.word LINK 
                           00281A     2 	LINK=.
      00281A                          3 PRTE:
      00A4E5 4A                       4 	.byte 4+F_IFUNC 	
      00A4E6 20 F9 A6 84              5 	.ascii "PRTE"
      00A4EA 81 7C                    6 	.word PRTE_IDX 
      00A4EB                       4523 	_dict_entry,4+F_IFUNC,PRTD,PRTD_IDX;const_portd
      00A4EB CD 96                    1 	.word LINK 
                           002823     2 	LINK=.
      002823                          3 PRTD:
      00A4ED C2                       4 	.byte 4+F_IFUNC 	
      00A4EE A1 01 27 03              5 	.ascii "PRTD"
      00A4F2 CC 92                    6 	.word PRTD_IDX 
      00282A                       4524 	_dict_entry,4+F_IFUNC,PRTC,PRTC_IDX;const_portc
      00A4F4 1A 85                    1 	.word LINK 
                           00282C     2 	LINK=.
      00282C                          3 PRTC:
      00A4F6 53                       4 	.byte 4+F_IFUNC 	
      00A4F7 A6 84 81 43              5 	.ascii "PRTC"
      00A4FA 00 78                    6 	.word PRTC_IDX 
      002833                       4525 	_dict_entry,4+F_IFUNC,PRTB,PRTB_IDX;const_portb
      00A4FA 85 52                    1 	.word LINK 
                           002835     2 	LINK=.
      002835                          3 PRTB:
      00A4FC 04                       4 	.byte 4+F_IFUNC 	
      00A4FD 89 90 CE 00              5 	.ascii "PRTB"
      00A501 05 17                    6 	.word PRTB_IDX 
      00283C                       4526 	_dict_entry,4+F_IFUNC,PRTA,PRTA_IDX;const_porta 
      00A503 03 90                    1 	.word LINK 
                           00283E     2 	LINK=.
      00283E                          3 PRTA:
      00A505 CE                       4 	.byte 4+F_IFUNC 	
      00A506 00 01 17 05              5 	.ascii "PRTA"
      00A50A 72 5C                    6 	.word PRTA_IDX 
      002845                       4527 	_dict_entry 5,PRINT,PRT_IDX;print 
      00A50C 00 1E                    1 	.word LINK 
                           002847     2 	LINK=.
      002847                          3 PRINT:
      00A50E 81                       4 	.byte 5 	
      00A50F 50 52 49 4E 54           5 	.ascii "PRINT"
      00A50F 72 5D                    6 	.word PRT_IDX 
      00284F                       4528 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      00A511 00 1E                    1 	.word LINK 
                           002851     2 	LINK=.
      002851                          3 POUT:
      00A513 26                       4 	.byte 4+F_IFUNC 	
      00A514 03 CC 92 1A              5 	.ascii "POUT"
      00A518 00 70                    6 	.word POUT_IDX 
      002858                       4529 	_dict_entry,4,POKE,POKE_IDX;poke 
      00A518 CD 98                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



                           00285A     2 	LINK=.
      00285A                          3 POKE:
      00A51A 0F                       4 	.byte 4 	
      00A51B A1 84 27 03              5 	.ascii "POKE"
      00A51F CC 92                    6 	.word POKE_IDX 
      002861                       4530 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      00A521 1A 5A                    1 	.word LINK 
                           002863     2 	LINK=.
      00A522                          3 PMODE:
      00A522 5D                       4 	.byte 5 	
      00A523 26 10 1E 03 CF           5 	.ascii "PMODE"
      00A528 00 05                    6 	.word PMODE_IDX 
      00286B                       4531 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      00A52A E6 02                    1 	.word LINK 
                           00286D     2 	LINK=.
      00286D                          3 PINP:
      00A52C C7                       4 	.byte 4+F_IFUNC 	
      00A52D 00 04 1E 05              5 	.ascii "PINP"
      00A531 CF 00                    6 	.word PINP_IDX 
      002874                       4532 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      00A533 01 81                    1 	.word LINK 
                           002876     2 	LINK=.
      00A535                          3 PEEK:
      00A535 85                       4 	.byte 4+F_IFUNC 	
      00A536 5B 04 72 5A              5 	.ascii "PEEK"
      00A53A 00 1E                    6 	.word PEEK_IDX 
      00287D                       4533 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      00A53C FC 76                    1 	.word LINK 
                           00287F     2 	LINK=.
      00A53D                          3 PAUSE:
      00A53D AE                       4 	.byte 5 	
      00A53E 00 00 A6 84 81           5 	.ascii "PAUSE"
      00A543 00 66                    6 	.word PAUSE_IDX 
      002887                       4534 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      00A543 AE 00                    1 	.word LINK 
                           002889     2 	LINK=.
      002889                          3 PAD:
      00A545 01                       4 	.byte 3+F_IFUNC 	
      00A546 A6 84 81                 5 	.ascii "PAD"
      00A549 00 64                    6 	.word PAD_IDX 
      00288F                       4535 	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
      00A549 AE 00                    1 	.word LINK 
                           002891     2 	LINK=.
      002891                          3 OR:
      00A54B 02                       4 	.byte 2+F_IFUNC 	
      00A54C A6 84                    5 	.ascii "OR"
      00A54E 81 62                    6 	.word OR_IDX 
      00A54F                       4536 	_dict_entry,2,ON,ON_IDX; cmd_on 
      00A54F AE 00                    1 	.word LINK 
                           002898     2 	LINK=.
      002898                          3 ON:
      00A551 03                       4 	.byte 2 	
      00A552 A6 84                    5 	.ascii "ON"
      00A554 81 C6                    6 	.word ON_IDX 
      00A555                       4537 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



      00A555 AE 00                    1 	.word LINK 
                           00289F     2 	LINK=.
      00289F                          3 ODR:
      00A557 04                       4 	.byte 3+F_IFUNC 	
      00A558 A6 84 81                 5 	.ascii "ODR"
      00A55B 00 60                    6 	.word ODR_IDX 
      0028A5                       4538 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      00A55B AE 00                    1 	.word LINK 
                           0028A7     2 	LINK=.
      0028A7                          3 NOT:
      00A55D 05                       4 	.byte 3+F_IFUNC 	
      00A55E A6 84 81                 5 	.ascii "NOT"
      00A561 00 5E                    6 	.word NOT_IDX 
      0028AD                       4539 	_dict_entry,4,NEXT,NEXT_IDX;next 
      00A561 AE 00                    1 	.word LINK 
                           0028AF     2 	LINK=.
      0028AF                          3 NEXT:
      00A563 06                       4 	.byte 4 	
      00A564 A6 84 81 54              5 	.ascii "NEXT"
      00A567 00 5A                    6 	.word NEXT_IDX 
      0028B6                       4540 	_dict_entry,3,NEW,NEW_IDX;new
      00A567 AE 00                    1 	.word LINK 
                           0028B8     2 	LINK=.
      0028B8                          3 NEW:
      00A569 07                       4 	.byte 3 	
      00A56A A6 84 81                 5 	.ascii "NEW"
      00A56D 00 5C                    6 	.word NEW_IDX 
      0028BE                       4541 	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
      00A56D AE 00                    1 	.word LINK 
                           0028C0     2 	LINK=.
      0028C0                          3 MULDIV:
      00A56F 08                       4 	.byte 6+F_IFUNC 	
      00A570 A6 84 81 44 49 56        5 	.ascii "MULDIV"
      00A573 00 58                    6 	.word MULDIV_IDX 
      0028C9                       4542 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      00A573 A6 84                    1 	.word LINK 
                           0028CB     2 	LINK=.
      0028CB                          3 LSHIFT:
      00A575 AE                       4 	.byte 6+F_IFUNC 	
      00A576 00 00 81 49 46 54        5 	.ascii "LSHIFT"
      00A579 00 56                    6 	.word LSHIFT_IDX 
      0028D4                       4543 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      00A579 A6 84                    1 	.word LINK 
                           0028D6     2 	LINK=.
      0028D6                          3 LOG:
      00A57B AE                       4 	.byte 3+F_IFUNC 	
      00A57C 00 01 81                 5 	.ascii "LOG"
      00A57F 00 54                    6 	.word LOG_IDX 
      0028DC                       4544 	_dict_entry 4,LIST,LIST_IDX;list
      00A57F A6 84                    1 	.word LINK 
                           0028DE     2 	LINK=.
      0028DE                          3 LIST:
      00A581 AE                       4 	.byte 4 	
      00A582 00 02 81 54              5 	.ascii "LIST"
      00A585 00 52                    6 	.word LIST_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



      0028E5                       4545 	_dict_entry 3,LET,LET_IDX;let 
      00A585 A6 84                    1 	.word LINK 
                           0028E7     2 	LINK=.
      0028E7                          3 LET:
      00A587 AE                       4 	.byte 3 	
      00A588 00 03 81                 5 	.ascii "LET"
      00A58B 00 50                    6 	.word LET_IDX 
      0028ED                       4546 	_dict_entry,3+F_IFUNC,KEY,KEY_IDX;key 
      00A58B A6 84                    1 	.word LINK 
                           0028EF     2 	LINK=.
      0028EF                          3 KEY:
      00A58D AE                       4 	.byte 3+F_IFUNC 	
      00A58E 00 04 81                 5 	.ascii "KEY"
      00A591 00 4E                    6 	.word KEY_IDX 
      0028F5                       4547 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      00A591 A6 84                    1 	.word LINK 
                           0028F7     2 	LINK=.
      0028F7                          3 IWDGREF:
      00A593 AE                       4 	.byte 7 	
      00A594 00 01 81 47 52 45 46     5 	.ascii "IWDGREF"
      00A597 00 4C                    6 	.word IWDGREF_IDX 
      002901                       4548 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      00A597 A6 84                    1 	.word LINK 
                           002903     2 	LINK=.
      002903                          3 IWDGEN:
      00A599 AE                       4 	.byte 6 	
      00A59A 00 00 81 47 45 4E        5 	.ascii "IWDGEN"
      00A59D 00 4A                    6 	.word IWDGEN_IDX 
      00290C                       4549 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      00A59D A6 84                    1 	.word LINK 
                           00290E     2 	LINK=.
      00290E                          3 INVERT:
      00A59F AE                       4 	.byte 6+F_IFUNC 	
      00A5A0 40 00 81 45 52 54        5 	.ascii "INVERT"
      00A5A3 00 48                    6 	.word INVERT_IDX 
      002917                       4550 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      00A5A3 55 00                    1 	.word LINK 
                           002919     2 	LINK=.
      002919                          3 INPUT:
      00A5A5 04                       4 	.byte 5 	
      00A5A6 00 02 81 55 54           5 	.ascii "INPUT"
      00A5A9 00 46                    6 	.word INPUT_IDX 
      002921                       4551 	_dict_entry,2,IF,IF_IDX;if 
      00A5A9 CD 97                    1 	.word LINK 
                           002923     2 	LINK=.
      002923                          3 IF:
      00A5AB C6                       4 	.byte 2 	
      00A5AC A1 84                    5 	.ascii "IF"
      00A5AE 27 03                    6 	.word IF_IDX 
      002928                       4552 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      00A5B0 CC 92                    1 	.word LINK 
                           00292A     2 	LINK=.
      00292A                          3 IDR:
      00A5B2 1A                       4 	.byte 3+F_IFUNC 	
      00A5B3 4F CD 86                 5 	.ascii "IDR"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



      00A5B6 B6 5D                    6 	.word IDR_IDX 
      002930                       4553 	_dict_entry,3,HEX,HEX_IDX;hex_base
      00A5B8 26 05                    1 	.word LINK 
                           002932     2 	LINK=.
      002932                          3 HEX:
      00A5BA A6                       4 	.byte 3 	
      00A5BB 05 CC 92                 5 	.ascii "HEX"
      00A5BE 1C 40                    6 	.word HEX_IDX 
      00A5BF                       4554 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      00A5BF 90 93                    1 	.word LINK 
                           00293A     2 	LINK=.
      00293A                          3 GPIO:
      00A5C1 EE                       4 	.byte 4+F_IFUNC 	
      00A5C2 04 A3 A5 A3              5 	.ascii "GPIO"
      00A5C6 26 F2                    6 	.word GPIO_IDX 
      002941                       4555 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      00A5C8 90 CF                    1 	.word LINK 
                           002943     2 	LINK=.
      002943                          3 GOTO:
      00A5CA 00                       4 	.byte 4 	
      00A5CB 07 90 E6 02              5 	.ascii "GOTO"
      00A5CF C7 00                    6 	.word GOTO_IDX 
      00294A                       4556 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      00A5D1 0A 35                    1 	.word LINK 
                           00294C     2 	LINK=.
      00294C                          3 GOSUB:
      00A5D3 06                       4 	.byte 5 	
      00A5D4 00 09 81 55 42           5 	.ascii "GOSUB"
      00A5D7 00 3A                    6 	.word GOSUB_IDX 
      002954                       4557 	_dict_entry,4+F_IFUNC,FREE,FREE_IDX;free
      00A5D7 72 5F                    1 	.word LINK 
                           002956     2 	LINK=.
      002956                          3 FREE:
      00A5D9 00                       4 	.byte 4+F_IFUNC 	
      00A5DA 07 72 5F 00              5 	.ascii "FREE"
      00A5DE 08 72                    6 	.word FREE_IDX 
      00295D                       4558 	_dict_entry,3,FOR,FOR_IDX;for 
      00A5E0 5F 00                    1 	.word LINK 
                           00295F     2 	LINK=.
      00295F                          3 FOR:
      00A5E2 09                       4 	.byte 3 	
      00A5E3 72 5F 00                 5 	.ascii "FOR"
      00A5E6 0A CE                    6 	.word FOR_IDX 
      002965                       4559 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      00A5E8 00 1A                    1 	.word LINK 
                           002967     2 	LINK=.
      00A5EA                          3 FCPU:
      00A5EA C3                       4 	.byte 4 	
      00A5EB 00 1C 24 1B              5 	.ascii "FCPU"
      00A5EF 90 93                    6 	.word FCPU_IDX 
      00296E                       4560 	_dict_entry,5,ERASE,ERASE_IDX; erase 
      00A5F1 EE 04                    1 	.word LINK 
                           002970     2 	LINK=.
      002970                          3 ERASE:
      00A5F3 1C                       4 	.byte 5 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



      00A5F4 AA D9 FE A3 A5           5 	.ascii "ERASE"
      00A5F9 A3 26                    6 	.word ERASE_IDX 
      002978                       4561 	_dict_entry,3,END,END_IDX;cmd_end  
      00A5FB 1A 90                    1 	.word LINK 
                           00297A     2 	LINK=.
      00297A                          3 END:
      00A5FD CF                       4 	.byte 3 	
      00A5FE 00 07 90                 5 	.ascii "END"
      00A601 E6 02                    6 	.word END_IDX 
      002980                       4562 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      00A603 C7 00                    1 	.word LINK 
                           002982     2 	LINK=.
      002982                          3 EEPROM:
      00A605 0A                       4 	.byte 6+F_IFUNC 	
      00A606 35 06 00 09 72 5D        5 	.ascii "EEPROM"
      00A60C 00 0A                    6 	.word EEPROM_IDX 
      00298B                       4563 	_dict_entry,4,EDIT,EDIT_IDX ; edit 
      00A60E 26 05                    1 	.word LINK 
                           00298D     2 	LINK=.
      00298D                          3 EDIT:
      00A610 A6                       4 	.byte 4 	
      00A611 0C CC 92 1C              5 	.ascii "EDIT"
      00A615 81 2C                    6 	.word EDIT_IDX 
      00A616                       4564 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      00A616 93 E6                    1 	.word LINK 
                           002996     2 	LINK=.
      002996                          3 DWRITE:
      00A618 02                       4 	.byte 6+F_CMD 	
      00A619 C7 00 0E 72 5F 00        5 	.ascii "DWRITE"
      00A61F 0D 72                    6 	.word DWRITE_IDX 
      00299F                       4565 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      00A621 BB 00                    1 	.word LINK 
                           0029A1     2 	LINK=.
      0029A1                          3 DREAD:
      00A623 0D                       4 	.byte 5+F_IFUNC 	
      00A624 20 C4 45 41 44           5 	.ascii "DREAD"
      00A626 00 28                    6 	.word DREAD_IDX 
      0029A9                       4566 	_dict_entry,2,DO,DO_IDX;do_loop
      00A626 52 06                    1 	.word LINK 
                           0029AB     2 	LINK=.
      00A628                          3 DO:
      00A628 C6                       4 	.byte 2 	
      00A629 00 09                    5 	.ascii "DO"
      00A62B C1 00                    6 	.word DO_IDX 
      0029B0                       4567 	_dict_entry,3,DEC,DEC_IDX;dec_base
      00A62D 0A 27                    1 	.word LINK 
                           0029B2     2 	LINK=.
      0029B2                          3 DEC:
      00A62F 37                       4 	.byte 3 	
      00A630 CD 9A BC                 5 	.ascii "DEC"
      00A633 CE 00                    6 	.word DEC_IDX 
      0029B8                       4568 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      00A635 07 CF                    1 	.word LINK 
                           0029BA     2 	LINK=.
      0029BA                          3 DDR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



      00A637 00                       4 	.byte 3+F_IFUNC 	
      00A638 05 55 00                 5 	.ascii "DDR"
      00A63B 09 00                    6 	.word DDR_IDX 
      0029C0                       4569 	_dict_entry,6,DATALN,DATALN_IDX;data_line  
      00A63D 02 55                    1 	.word LINK 
                           0029C2     2 	LINK=.
      0029C2                          3 DATALN:
      00A63F 00                       4 	.byte 6 	
      00A640 0A 00 04 CD 97 C6        5 	.ascii "DATALN"
      00A646 A1 84                    6 	.word DATALN_IDX 
      0029CB                       4570 	_dict_entry,4,DATA,DATA_IDX;data  
      00A648 27 03                    1 	.word LINK 
                           0029CD     2 	LINK=.
      0029CD                          3 DATA:
      00A64A CC                       4 	.byte 4 	
      00A64B 92 1A 54 41              5 	.ascii "DATA"
      00A64D 00 1E                    6 	.word DATA_IDX 
      0029D4                       4571 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      00A64D 1F 05                    1 	.word LINK 
                           0029D6     2 	LINK=.
      0029D6                          3 CRL:
      00A64F CD                       4 	.byte 3+F_IFUNC 	
      00A650 93 1B CE                 5 	.ascii "CRL"
      00A653 00 05                    6 	.word CRL_IDX 
      0029DC                       4572 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      00A655 CF 00                    1 	.word LINK 
                           0029DE     2 	LINK=.
      0029DE                          3 CRH:
      00A657 07                       4 	.byte 3+F_IFUNC 	
      00A658 55 00 02                 5 	.ascii "CRH"
      00A65B 00 09                    6 	.word CRH_IDX 
      0029E4                       4573 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      00A65D CD 9A                    1 	.word LINK 
                           0029E6     2 	LINK=.
      0029E6                          3 CHAR:
      00A65F CC                       4 	.byte 4+F_CFUNC 	
      00A660 1E 05 A6 84              5 	.ascii "CHAR"
      00A664 5B 06                    6 	.word CHAR_IDX 
      0029ED                       4574 	_dict_entry,3,BYE,BYE_IDX;bye 
      00A666 81 E6                    1 	.word LINK 
                           0029EF     2 	LINK=.
      00A667                          3 BYE:
      00A667 90                       4 	.byte 3 	
      00A668 CE 00 07                 5 	.ascii "BYE"
      00A66B 72 5F                    6 	.word BYE_IDX 
      0029F5                       4575 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      00A66D 00 07                    1 	.word LINK 
                           0029F7     2 	LINK=.
      0029F7                          3 BTOGL:
      00A66F 72                       4 	.byte 5 	
      00A670 5F 00 08 72 5F           5 	.ascii "BTOGL"
      00A675 00 09                    6 	.word BTOGL_IDX 
      0029FF                       4576 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      00A677 72 5F                    1 	.word LINK 
                           002A01     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



      002A01                          3 BTEST:
      00A679 00                       4 	.byte 5+F_IFUNC 	
      00A67A 0A CD A6 16 20           5 	.ascii "BTEST"
      00A67F A8 12                    6 	.word BTEST_IDX 
      00A680                       4577 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      00A680 CD 96                    1 	.word LINK 
                           002A0B     2 	LINK=.
      002A0B                          3 BSET:
      00A682 C7                       4 	.byte 4 	
      00A683 A1 02 27 03              5 	.ascii "BSET"
      00A687 CC 92                    6 	.word BSET_IDX 
      002A12                       4578 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      00A689 1A 0B                    1 	.word LINK 
                           002A14     2 	LINK=.
      00A68A                          3 BRES:
      00A68A 72                       4 	.byte 4 	
      00A68B 12 50 C7 85              5 	.ascii "BRES"
      00A68F 5D 27                    6 	.word BRES_IDX 
      002A1B                       4579 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      00A691 21 85                    1 	.word LINK 
                           002A1D     2 	LINK=.
      002A1D                          3 BIT:
      00A693 A6                       4 	.byte 3+F_IFUNC 	
      00A694 08 42 9F                 5 	.ascii "BIT"
      00A697 C7 52                    6 	.word BIT_IDX 
      002A23                       4580 	_dict_entry,3,AWU,AWU_IDX;awu 
      00A699 00 72                    1 	.word LINK 
                           002A25     2 	LINK=.
      002A25                          3 AWU:
      00A69B 1A                       4 	.byte 3 	
      00A69C 50 14 72                 5 	.ascii "AWU"
      00A69F 1A 50                    6 	.word AWU_IDX 
      002A2B                       4581 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      00A6A1 16 72                    1 	.word LINK 
                           002A2D     2 	LINK=.
      002A2D                          3 ASC:
      00A6A3 14                       4 	.byte 3+F_IFUNC 	
      00A6A4 52 00 72                 5 	.ascii "ASC"
      00A6A7 12 52                    6 	.word ASC_IDX 
      002A33                       4582 	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
      00A6A9 01 72                    1 	.word LINK 
                           002A35     2 	LINK=.
      002A35                          3 AND:
      00A6AB 10                       4 	.byte 3+F_IFUNC 	
      00A6AC 52 01 72                 5 	.ascii "AND"
      00A6AF 1C 52                    6 	.word AND_IDX 
      002A3B                       4583 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      00A6B1 00 81                    1 	.word LINK 
                           002A3D     2 	LINK=.
      00A6B3                          3 ADCREAD:
      00A6B3 5B                       4 	.byte 7+F_IFUNC 	
      00A6B4 02 A6 82 C4 52 03 A1     5 	.ascii "ADCREAD"
      00A6BB 02 26                    6 	.word ADCREAD_IDX 
      002A47                       4584 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      00A6BD F7 72                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



                           002A49     2 	LINK=.
      002A49                          3 ADCON:
      00A6BF 1D                       4 	.byte 5 	
      00A6C0 52 00 72 13 50           5 	.ascii "ADCON"
      00A6C5 C7 72                    6 	.word ADCON_IDX 
      002A51                       4585 kword_dict::
      002A51                       4586 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      00A6C7 1B 50                    1 	.word LINK 
                           002A53     2 	LINK=.
      002A53                          3 ABS:
      00A6C9 16                       4 	.byte 3+F_IFUNC 	
      00A6CA 81 42 53                 5 	.ascii "ABS"
      00A6CB 00 00                    6 	.word ABS_IDX 
                                   4587 
                                   4588 ;comands and fonctions address table 	
      002A59                       4589 code_addr::
      00A6CB A6 78 C5 52 03 27 04  4590 	.word abs,power_adc,analog_read,bit_and,ascii,awu,bitmask ; 0..7
             72 5F 52 03 81 24 51
      00A6D7 1B 11 1B 01 1B 32 1B  4591 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             22 21 79 20 CE 25 0B
      00A6D7 88 CD A6 CB 84 72 03  4592 	.word const_cr1,data,data_line,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
             52 03 FB C7 52 04 72
             01 52
      00A6E7 03 FB C6 52 04 81 1F  4593 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto,gpio ; 24..31 
             73 22 7D 1F DF 1B 8D
             1D 20 1D 06 21 1C
      00A6ED 18 28 24 F9 1B 79 1A  4594 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             5C 24 6B 23 FB 24 31
             21 07
      00A6ED A6 FF 72 01 52 03 E3  4595 	.word let,list,log2,lshift,muldiv,next,new ; 40..47
             C6 52 04 81 0D 1F 32
      00A6F8 23 EE 24 F3 22 1B 26  4596 	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             B7 21 8D 22 89 1B 68
             25 17
      00A6F8 CD 97 C6 A1 84 27 03  4597 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             CC 92 1A 24 C9 24 CF
             24 D5
      00A702 24 DB 24 E1 24 E7 24  4598 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             ED 21 0F 25 A6 0E DF
             1A D6
      00A702 9F CD A6 D7 CD 93 1B  4599 	.word restore,return, random,rshift,run,show,free ; 72..79
             A1 09 26 02 20 E9 4D
      00A710 27 05 55 00 03 00 02  4600 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             81 26 78 1B E6 1E E6
             21 E9
      00A718 23 D2 23 E1 1B B6 1D  4601 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             C7 18 A0 21 46 24 8F
             21 5C
      00A718 CD A6 ED 5F 97 A6 84  4602 	.word wait,words,write,bit_xor,cmd_size,cmd_on ; 96..99
             81 18 4B 1C 7D
      00A720 00 00                 4603 	.word 0 
                                   4604 
                                   4605 
                                   4606 
                                   4607 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
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
      002B80                         28 	.bndry 128 ; align on FLASH block.
                                     29 ; space for user application  
      002B80                         30 app_space::
      00A720 CD 93                   31 app_sign: .word 0 ; .ascii "BC"  ; signature 
      00A722 1B A1                   32 app_size: .word 0 ; 31 
      002B84                         33 app: 
                                     34 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     35 ;;  BASIC code demo 'BLINK.BAS' 
                                     36 ;; 10 do btogl $500a,32 pause 250 until qkey bres $500a,32 end 
                                     37 ;; byte code generated by compiler.
                                     38 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     39 ;.byte 0,10,31,128,0,38,128,0,20,132,80,10,9,132,0,32,128
                                     40 ;.byte 0,100,132,0,250,128,0,182,129,0,132,128,0,46
                                     41 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   4 ABS        002A53 R   |     ABS_IDX =  000000 
    ACC24   =  000007     |     ACK     =  000006     |   4 ADCON      002A49 R
    ADCON_ID=  000002     |   4 ADCREAD    002A3D R   |     ADCREAD_=  000004 
    ADC_CR1 =  005401     |     ADC_CR1_=  000000     |     ADC_CR1_=  000001 
    ADC_CR1_=  000004     |     ADC_CR1_=  000005     |     ADC_CR1_=  000006 
    ADC_CR2 =  005402     |     ADC_CR2_=  000003     |     ADC_CR2_=  000004 
    ADC_CR2_=  000005     |     ADC_CR2_=  000006     |     ADC_CR2_=  000001 
    ADC_CR3 =  005403     |     ADC_CR3_=  000007     |     ADC_CR3_=  000006 
    ADC_CSR =  005400     |     ADC_CSR_=  000006     |     ADC_CSR_=  000004 
    ADC_CSR_=  000000     |     ADC_CSR_=  000001     |     ADC_CSR_=  000002 
    ADC_CSR_=  000003     |     ADC_CSR_=  000007     |     ADC_CSR_=  000005 
    ADC_DRH =  005404     |     ADC_DRL =  005405     |     ADC_TDRH=  005406 
    ADC_TDRL=  005407     |     ADDR    =  000001     |     ADR     =  000002 
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
  4 AND        002A35 R   |     AND_IDX =  000006     |     AREG    =  000002 
    ARG_OFS =  000002     |     ARROW_LE=  000080     |     ARROW_RI=  000081 
  4 ASC        002A2D R   |     ASC_IDX =  000008     |     ATTRIB  =  000002 
    AUTORUN_=  004000     |   4 AWU        002A25 R   |   4 AWUHandl   000001 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_CSR_=  000004 
    AWU_IDX =  00000A     |     AWU_TBR =  0050F2     |     B0_MASK =  000001 
    B115200 =  000006     |     B19200  =  000003     |     B1_MASK =  000002 
    B230400 =  000007     |     B2400   =  000000     |     B2_MASK =  000004 
    B38400  =  000004     |     B3_MASK =  000008     |     B460800 =  000008 
    B4800   =  000001     |     B4_MASK =  000010     |     B57600  =  000005 
    B5_MASK =  000020     |     B6_MASK =  000040     |     B7_MASK =  000080 
    B921600 =  000009     |     B9600   =  000002     |     BASE    =  000002 
    BASE_SAV=  000001     |     BCNT    =  000001     |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
    BELL    =  000007     |     BINARY  =  000001     |   4 BIT        002A1D R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000C 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  00000B     |   4 BRES       002A14 R   |     BRES_IDX=  00000E 
    BS      =  000008     |     BSAVE   =  000001     |   4 BSET       002A0B R
    BSET_IDX=  000010     |     BSIZE   =  000006     |   4 BTEST      002A01 R
    BTEST_ID=  000012     |   4 BTOGL      0029F7 R   |     BTOGL_ID=  000014 
    BTW     =  000001     |   4 BYE        0029EF R   |     BYE_IDX =  000016 
    C       =  000001     |     CAN     =  000018     |   4 CANT_DO    002042 R
    CAN_DGR =  005426     |     CAN_FPSR=  005427     |     CAN_IER =  005425 
    CAN_MCR =  005420     |     CAN_MSR =  005421     |     CAN_P0  =  005428 
    CAN_P1  =  005429     |     CAN_P2  =  00542A     |     CAN_P3  =  00542B 
    CAN_P4  =  00542C     |     CAN_P5  =  00542D     |     CAN_P6  =  00542E 
    CAN_P7  =  00542F     |     CAN_P8  =  005430     |     CAN_P9  =  005431 
    CAN_PA  =  005432     |     CAN_PB  =  005433     |     CAN_PC  =  005434 
    CAN_PD  =  005435     |     CAN_PE  =  005436     |     CAN_PF  =  005437 
    CAN_RFR =  005424     |     CAN_TPR =  005423     |     CAN_TSR =  005422 
    CCOMMA  =  000001     |     CC_C    =  000000     |     CC_H    =  000004 
    CC_I0   =  000003     |     CC_I1   =  000005     |     CC_N    =  000002 
    CC_V    =  000007     |     CC_Z    =  000001     |     CELL_SIZ=  000002 
    CFG_GCR =  007F60     |     CFG_GCR_=  000001     |     CFG_GCR_=  000000 
  4 CHAR       0029E6 R   |     CHAR_IDX=  000018     |     CLKOPT  =  004807 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]

Symbol Table

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
    CLK_PCKE=  000004     |     CLK_PCKE=  000002     |     CLK_PCKE=  000003 
    CLK_PCKE=  0050CA     |     CLK_PCKE=  000003     |     CLK_PCKE=  000002 
    CLK_PCKE=  000007     |     CLK_SWCR=  0050C5     |     CLK_SWCR=  000000 
    CLK_SWCR=  000001     |     CLK_SWCR=  000002     |     CLK_SWCR=  000003 
    CLK_SWIM=  0050CD     |     CLK_SWR =  0050C4     |     CLK_SWR_=  0000B4 
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |     CMDX    =  000001 
    CMD_END =  000002     |     CNT     =  000006     |     CNTR    =  000003 
    COMMA   =  00002C     |     CPOS    =  000003     |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |     CR      =  00000D     |   4 CRH        0029DE R
    CRH_IDX =  00001A     |   4 CRL        0029D6 R   |     CRL_IDX =  00001C 
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
    CURR    =  000002     |     CVAR    =  000007     |     CX_BPTR =  000001 
    CX_CNT  =  000004     |     CX_IN   =  000003     |   4 DATA       0029CD R
  4 DATALN     0029C2 R   |     DATALN_I=  000020     |     DATA_IDX=  00001E 
    DBG_A   =  000005     |     DBG_CC  =  000006     |     DBG_X   =  000003 
    DBG_Y   =  000001     |     DBL     =  000003     |     DBLDIVDN=  000006 
    DBLHI   =  000001     |     DBLLO   =  000003     |     DBL_SIZE=  000004 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   4 DDR        0029BA R   |     DDR_IDX =  000022 
    DEBUG   =  000000     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
    DEBUG_PR=  000001     |   4 DEC        0029B2 R   |     DEC_IDX =  000024 
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
    DIVDNDHI=  00000B     |     DIVDNDLO=  00000D     |     DIVISOR =  000001 
    DIVISR  =  000007     |     DIVSOR  =  000001     |     DLE     =  000010 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   4 DO         0029AB R
    DOLP_ADR=  000003     |     DOLP_INW=  000005     |     DO_IDX  =  000026 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]

Symbol Table

  4 DREAD      0029A1 R   |     DREAD_ID=  000028     |   4 DWRITE     002996 R
    DWRITE_I=  00002A     |   4 EDIT       00298D R   |     EDIT_IDX=  00002C 
  4 EEPROM     002982 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_I=  00002E     |     EEPROM_S=  000800     |     EM      =  000019 
  4 END        00297A R   |     END_IDX =  000030     |     ENQ     =  000005 
    EOF     =  0000FF     |     EOT     =  000004     |   4 ERASE      002970 R
    ERASE_ID=  000032     |     ERR_BAD_=  00000A     |     ERR_BUF_=  00000F 
    ERR_CMD_=  000007     |     ERR_DIV0=  000004     |     ERR_DUPL=  000008 
    ERR_MATH=  000003     |     ERR_MEM_=  000001     |     ERR_NONE=  000000 
    ERR_NOT_=  000009     |     ERR_NO_A=  00000B     |     ERR_NO_D=  00000C 
    ERR_NO_F=  00000E     |     ERR_NO_L=  000005     |     ERR_NO_P=  00000D 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    ETB     =  000017     |     ETX     =  000003     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FAUTORUN=  000006     |     FBREAK  =  000004 
    FCOMP   =  000005     |   4 FCPU       002967 R   |     FCPU_IDX=  000034 
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
    FLASH_IA=  000000     |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |     FLOOP   =  000002 
    FLSI    =  01F400     |   4 FOR        00295F R   |     FOR_IDX =  000038 
  4 FREE       002956 R   |     FREE_IDX=  00009A     |     FRUN    =  000000 
    FS      =  00001C     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_CFUNC =  000080     |     F_CMD   =  000000 
    F_CONST =  0000C0     |     F_IFUNC =  000040     |   4 GOSUB      00294C R
    GOSUB_ID=  00003A     |   4 GOTO       002943 R   |     GOTO_IDX=  00003C 
  4 GPIO       00293A R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_IDX=  00003E     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
    GS      =  00001D     |   4 HEX        002932 R   |     HEX_IDX =  000040 
    HOME    =  000082     |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]

Symbol Table

    I2C_READ=  000001     |     I2C_SR1 =  005217     |     I2C_SR1_=  000003 
    I2C_SR1_=  000001     |     I2C_SR1_=  000002     |     I2C_SR1_=  000006 
    I2C_SR1_=  000000     |     I2C_SR1_=  000004     |     I2C_SR1_=  000007 
    I2C_SR2 =  005218     |     I2C_SR2_=  000002     |     I2C_SR2_=  000001 
    I2C_SR2_=  000000     |     I2C_SR2_=  000003     |     I2C_SR2_=  000005 
    I2C_SR3 =  005219     |     I2C_SR3_=  000001     |     I2C_SR3_=  000007 
    I2C_SR3_=  000004     |     I2C_SR3_=  000000     |     I2C_SR3_=  000002 
    I2C_TRIS=  00521D     |     I2C_TRIS=  000005     |     I2C_TRIS=  000005 
    I2C_TRIS=  000005     |     I2C_TRIS=  000011     |     I2C_TRIS=  000011 
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   4 IDR        00292A R
    IDR_IDX =  000042     |   4 IF         002923 R   |     IF_IDX  =  000044 
    IN      =  000005     |     INCR    =  000001     |     INP     =  000000 
  4 INPUT      002919 R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
    INPUT_FL=  000000     |     INPUT_ID=  000046     |     INPUT_PU=  000001 
    INT_ADC2=  000016     |     INT_AUAR=  000012     |     INT_AWU =  000001 
    INT_CAN_=  000008     |     INT_CAN_=  000009     |     INT_CLK =  000002 
    INT_EXTI=  000003     |     INT_EXTI=  000004     |     INT_EXTI=  000005 
    INT_EXTI=  000006     |     INT_EXTI=  000007     |     INT_FLAS=  000018 
    INT_I2C =  000013     |     INT_SPI =  00000A     |     INT_TIM1=  00000C 
    INT_TIM1=  00000B     |     INT_TIM2=  00000E     |     INT_TIM2=  00000D 
    INT_TIM3=  000010     |     INT_TIM3=  00000F     |     INT_TIM4=  000017 
    INT_TLI =  000000     |     INT_UART=  000011     |     INT_UART=  000015 
    INT_UART=  000014     |     INT_VECT=  008060     |     INT_VECT=  00800C 
    INT_VECT=  008028     |     INT_VECT=  00802C     |     INT_VECT=  008010 
    INT_VECT=  008014     |     INT_VECT=  008018     |     INT_VECT=  00801C 
    INT_VECT=  008020     |     INT_VECT=  008024     |     INT_VECT=  008068 
    INT_VECT=  008054     |     INT_VECT=  008000     |     INT_VECT=  008030 
    INT_VECT=  008038     |     INT_VECT=  008034     |     INT_VECT=  008040 
    INT_VECT=  00803C     |     INT_VECT=  008048     |     INT_VECT=  008044 
    INT_VECT=  008064     |     INT_VECT=  008008     |     INT_VECT=  008004 
    INT_VECT=  008050     |     INT_VECT=  00804C     |     INT_VECT=  00805C 
    INT_VECT=  008058     |   4 INVERT     00290E R   |     INVERT_I=  000048 
    INW     =  000009     |     IPOS    =  000001     |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |   4 IWDGEN     002903 R   |     IWDGEN_I=  00004A 
  4 IWDGREF    0028F7 R   |     IWDGREF_=  00004C     |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |     KCHAR   =  000002 
  4 KEY        0028EF R   |     KEY_END =  000083     |     KEY_IDX =  00004E 
    LAST    =  000003     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000002 
  4 LET        0028E7 R   |     LET_IDX =  000050     |     LF      =  00000A 
    LIMIT   =  000001     |     LINENO  =  000005     |   4 LINK    =  002A53 R
  4 LIST       0028DE R   |     LIST_IDX=  000052     |     LL      =  000001 
    LLEN    =  000002     |     LL_HB   =  000001     |     LN_PTR  =  000005 
  4 LOG        0028D6 R   |     LOG_IDX =  000054     |   4 LSHIFT     0028CB R
    LSHIFT_I=  000056     |     MAJOR   =  000002     |     MASK    =  000002 
    MATH_OVF=  000000     |     MAX_LINE=  007FFF     |     MINOR   =  000000 
  4 MULDIV     0028C0 R   |     MULDIV_I=  000058     |     MULOP   =  000003 
    N1      =  000001     |     N2      =  000003     |     NAFR    =  004804 
    NAK     =  000015     |     NCLKOPT =  004808     |     NEG     =  000001 
  4 NEW        0028B8 R   |     NEW_IDX =  00005C     |   4 NEXT       0028AF R
    NEXT_IDX=  00005A     |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NLEN    =  000001     |     NOPT1   =  004802     |     NOPT2   =  004804 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]

Symbol Table

    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  4 NOT        0028A7 R   |     NOT_IDX =  00005E     |   4 NOT_SAVE   00199F R
  4 NO_APP     002081 R   |     NUBC    =  004802     |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   4 NonHandl   000000 R   |   4 ODR        00289F R
    ODR_IDX =  000060     |   4 ON         002898 R   |     ONOFF   =  000003 
    ON_IDX  =  0000C6     |     OP      =  000005     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  4 OR         002891 R   |     OR_IDX  =  000062     |     OUTP    =  000001 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVFH    =  000001     |     OVFL    =  000002 
    OVRWR   =  000004     |     PA      =  000000     |   4 PAD        002889 R
    PAD_IDX =  000064     |     PAD_SIZE=  000080     |   4 PAUSE      00287F R
    PAUSE_ID=  000066     |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |     PD_BASE =  00500F     |     PD_CR1  =  005012 
    PD_CR2  =  005013     |     PD_DDR  =  005011     |     PD_IDR  =  005010 
    PD_ODR  =  00500F     |     PE      =  000014     |   4 PEEK       002876 R
    PEEK_IDX=  00006A     |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |     PINNO   =  000001 
  4 PINP       00286D R   |     PINP_IDX=  00006C     |     PINVAL  =  000002 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  4 PMODE      002863 R   |     PMODE_ID=  000068     |   4 POKE       00285A R
    POKE_IDX=  00006E     |     PORT    =  000003     |   4 POUT       002851 R
    POUT_IDX=  000070     |     PREV    =  000001     |   4 PRINT      002847 R
  4 PROG_ADD   001878 R   |   4 PROG_SIZ   00188A R   |   4 PRTA       00283E R
    PRTA_IDX=  000074     |   4 PRTB       002835 R   |     PRTB_IDX=  000076 
  4 PRTC       00282C R   |     PRTC_IDX=  000078     |   4 PRTD       002823 R
    PRTD_IDX=  00007A     |   4 PRTE       00281A R   |     PRTE_IDX=  00007C 
  4 PRTF       002811 R   |     PRTF_IDX=  00007E     |   4 PRTG       002808 R
    PRTG_IDX=  000080     |   4 PRTH       0027FF R   |     PRTH_IDX=  000082 
  4 PRTI       0027F6 R   |     PRTI_IDX=  000084     |     PRT_IDX =  000072 
    PSTR    =  000003     |   4 QKEY       0027ED R   |     QKEY_IDX=  000086 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
    RBT_IDX =  00008A     |   4 READ       0027E4 R   |     READ_IDX=  000088 
  4 REBOOT     0027D9 R   |     REG     =  000001     |     REGA    =  000001 
    REGX    =  000003     |     REGY    =  000005     |     RELOP   =  000003 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]

Symbol Table

  4 REMARK     0027CE R   |     REM_IDX =  00008C     |   4 RESTORE    0027C2 R
    REST_IDX=  00008E     |     RETL1   =  000001     |   4 RETURN     0027B7 R
    RET_ADDR=  000003     |     RET_IDX =  000090     |     RET_INW =  000005 
  4 RND        0027AF R   |     RND_IDX =  000092     |     ROP     =  004800 
    RS      =  00001E     |   4 RSHIFT     0027A4 R   |     RSHIFT_I=  000094 
    RST_SR  =  0050B3     |   4 RUN        00279C R   |   4 RUNNING    000FC2 R
    RUN_IDX =  000096     |     RXCHAR  =  000001     |     RX_QUEUE=  000008 
  4 SAVE       002793 R   |     SAVEB   =  000002     |     SAVE_IDX=  000036 
    SDIVSR  =  000005     |     SEPARATE=  000000     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |   4 SHOW       00278A R
    SHOW_IDX=  000098     |     SI      =  00000F     |     SIGN    =  000001 
  4 SIGNATUR   002040 R   |   4 SIZE       002781 R   |     SIZE_IDX=  0000C4 
    SKIP    =  000005     |   4 SLEEP      002777 R   |     SLEEP_ID=  00009C 
    SO      =  00000E     |     SOH     =  000001     |     SPACE   =  000020 
  4 SPIEN      00276D R   |     SPIEN_ID=  0000A0     |   4 SPIRD      002763 R
    SPIRD_ID=  00009E     |   4 SPISEL     002758 R   |     SPISEL_I=  0000A2 
  4 SPIWR      00274E R   |     SPIWR_ID=  0000A4     |     SPI_CR1 =  005200 
    SPI_CR1_=  000003     |     SPI_CR1_=  000000     |     SPI_CR1_=  000001 
    SPI_CR1_=  000007     |     SPI_CR1_=  000002     |     SPI_CR1_=  000006 
    SPI_CR2 =  005201     |     SPI_CR2_=  000007     |     SPI_CR2_=  000006 
    SPI_CR2_=  000005     |     SPI_CR2_=  000004     |     SPI_CR2_=  000002 
    SPI_CR2_=  000000     |     SPI_CR2_=  000001     |     SPI_CRCP=  005205 
    SPI_CS_B=  000005     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_SR_B=  000007 
    SPI_SR_C=  000004     |     SPI_SR_M=  000005     |     SPI_SR_O=  000006 
    SPI_SR_R=  000000     |     SPI_SR_T=  000001     |     SPI_SR_W=  000003 
    SPI_TXCR=  005207     |     SQUOT   =  000006     |     SRC     =  000003 
    STACK_EM=  0017FF     |     STACK_SI=  0000A0     |   4 STEP       002745 R
    STEP_IDX=  0000A6     |   4 STOP       00273C R   |     STOP_IDX=  0000A8 
    STR     =  000003     |   4 STR_BYTE   001899 R   |     STX     =  000002 
    SUB     =  00001A     |     SUP     =  000084     |     SWIM_CSR=  007F80 
    SYMB    =  000003     |     SYN     =  000016     |     TAB     =  000009 
    TABW    =  000004     |     TAB_WIDT=  000004     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  4 TICKS      002732 R   |     TICKS_ID=  0000AA     |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_EGR=  005343     |     TIM4_EGR=  000000     |     TIM4_IER=  005341 
    TIM4_IER=  000000     |     TIM4_PSC=  005345     |     TIM4_PSC=  000000 
    TIM4_PSC=  000007     |     TIM4_PSC=  000004     |     TIM4_PSC=  000001 
    TIM4_PSC=  000005     |     TIM4_PSC=  000002     |     TIM4_PSC=  000006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_PSC=  000003     |     TIM4_PSC=  000000     |     TIM4_PSC=  000001 
    TIM4_PSC=  000002     |     TIM4_SR =  005342     |     TIM4_SR_=  000000 
  4 TIMEOUT    002726 R   |   4 TIMER      00271C R   |     TIMER_ID=  0000AC 
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |     TK_ARRAY=  000006 
    TK_CFUNC=  000082     |     TK_CHAR =  000003     |     TK_CMD  =  000080 
    TK_COLON=  00000B     |     TK_COMMA=  000009     |     TK_CONST=  000083 
    TK_DIV  =  000021     |     TK_EQUAL=  000032     |     TK_GE   =  000033 
    TK_GRP_A=  000010     |     TK_GRP_M=  000030     |     TK_GRP_M=  000000 
    TK_GRP_M=  000020     |     TK_GRP_R=  000030     |     TK_GT   =  000031 
    TK_IFUNC=  000081     |     TK_INTGR=  000084     |     TK_LABEL=  000001 
    TK_LE   =  000036     |     TK_LPARE=  000007     |     TK_LT   =  000034 
    TK_MINUS=  000011     |     TK_MOD  =  000022     |     TK_MULT =  000020 
    TK_NE   =  000035     |     TK_NONE =  000000     |     TK_PLUS =  000010 
    TK_QSTR =  000002     |     TK_RPARE=  000008     |     TK_SHARP=  00000A 
    TK_TARGE=  000004     |     TK_VAR  =  000085     |     TMROUT_I=  0000AE 
  4 TO         002715 R   |   4 TONE       00270C R   |     TONE_IDX=  0000B2 
    TO_IDX  =  0000B0     |   4 Timer4Up   00000F R   |     U1      =  000001 
    U8      =  000003     |     UART1   =  000000     |     UART1_BA=  005230 
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
    UART_SR =  000000     |     UART_SR_=  000001     |     UART_SR_=  000004 
    UART_SR_=  000002     |     UART_SR_=  000003     |     UART_SR_=  000000 
    UART_SR_=  000005     |     UART_SR_=  000006     |     UART_SR_=  000007 
    UBC     =  004801     |   4 UBOUND     002701 R   |     UBOUND_I=  0000B4 
  4 UBTN_Han   000048 R   |   4 UFLASH     0026F6 R   |     UFLASH_I=  0000B6 
  4 UNTIL      0026EC R   |     UNTIL_ID=  0000B8     |     US      =  00001F 
  4 USER_ABO   00005B R   |   4 USR        0026E4 R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |     USR_IDX =  0000BA 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]

Symbol Table

  4 Uart1RxH   00027F R   |   4 UserButt   000024 R   |     VAR_ADDR=  000006 
    VSISE   =  000003     |     VSIZ    =  000002     |     VSIZE   =  000006 
    VT      =  00000B     |   4 WAIT       0026DB R   |     WAIT_IDX=  0000BC 
    WCNT    =  000003     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH_SA=  000002     |     WLEN    =  000001     |   4 WORDS      0026D1 R
    WORDS_ID=  0000BE     |   4 WRITE      0026C7 R   |     WRITE_ID=  0000C0 
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XFIRST  =  000001 
    XMASK   =  000001     |     XOFF    =  000013     |     XON     =  000011 
  4 XOR        0026BF R   |     XOR_IDX =  0000C2     |     XREG    =  000003 
    XSAVE   =  000005     |     YSAVE   =  000004     |   4 abs        0021EF R
  5 acc16      00000C GR  |   5 acc24      00000B GR  |   5 acc8       00000D GR
  4 accept_c   0005BA R   |   4 add_char   000D16 R   |   4 add_spac   000B3A R
  4 analog_r   001E47 R   |   4 app        002B84 R   |   4 app_sign   002B80 R
  4 app_size   002B82 R   |   4 app_spac   002B80 GR  |   4 arduino_   0022E5 R
  4 arg_list   001647 R   |   5 array_si   00001E R   |   4 ascii      0020E0 R
  4 at_tst     0009A8 R   |   4 atoi24     001401 GR  |   4 atoi_exi   001467 R
  4 awu        0021A0 R   |   4 awu02      0021AA R   |   4 bad_port   002141 R
  5 base       00000A GR  |   5 basicptr   000004 GR  |   4 beep       001DD4 R
  4 beep_1kh   001DBE GR  |   4 bin_exit   0007ED R   |   4 bit_and    002203 R
  4 bit_or     00221B R   |   4 bit_rese   001B11 R   |   4 bit_set    001B01 R
  4 bit_test   001B32 R   |   4 bit_togg   001B22 R   |   4 bit_xor    002233 R
  4 bitmask    002451 R   |   4 bkslsh_t   000955 R   |   4 bksp       000358 R
  4 block_er   00018F R   |   4 break_po   001F14 R   |   4 bye        002179 R
  4 char       0020CE R   |   4 clear_ba   001002 R   |   4 clear_va   000E85 R
  4 clock_in   000076 R   |   4 cmd_end    001DB7 R   |   4 cmd_line   001221 R
  4 cmd_name   000D36 R   |   4 cmd_on     001C7D R   |   4 cmd_size   00184B R
  4 code_add   002A59 GR  |   4 cold_sta   000EDF R   |   4 colon_ts   00097C R
  4 comma_ts   000987 R   |   4 comp_msg   001179 R   |   4 compile    000AAD GR
  4 compress   00084D R   |   4 const_cr   002505 R   |   4 const_cr   00250B R
  4 const_dd   0024FF R   |   4 const_ee   00251D R   |   4 const_id   0024F9 R
  4 const_in   002517 R   |   4 const_od   0024F3 R   |   4 const_ou   002511 R
  4 const_po   0024BD R   |   4 const_po   0024C3 R   |   4 const_po   0024C9 R
  4 const_po   0024CF R   |   4 const_po   0024D5 R   |   4 const_po   0024DB R
  4 const_po   0024E1 R   |   4 const_po   0024E7 R   |   4 const_po   0024ED R
  4 convert_   000764 R   |   4 convert_   00031C R   |   4 copy_com   0009DD R
  5 count      000003 GR  |   4 cp_loop    0015F6 R   |   4 cpy_cmd_   000B25 R
  4 cpy_quot   000B5E R   |   4 create_g   00068E R   |   4 cs_high    0026B2 R
  4 cstk_pro   001801 R   |   4 dash_tst   00099D R   |   4 data       002523 R
  5 data_len   000009 R   |   4 data_lin   002529 R   |   5 data_ofs   000008 R
  5 data_ptr   000006 R   |   4 data_sea   00256A R   |   4 dbl_sign   001550 R
  4 dec_base   00182D R   |   4 decomp_l   000C0F R   |   4 decompil   000BC8 GR
  4 del_line   000661 R   |   4 delete_l   000445 R   |   4 delete_n   000368 R
  4 delete_u   00040A R   |   4 digital_   001E7B R   |   4 digital_   001EAB R
  4 div32_16   00155A R   |   4 divide     0015B1 R   |   4 divu24_8   001370 R
  4 dneg       001545 R   |   4 do_loop    00247A R   |   4 do_progr   000182 R
  4 edit       001972 R   |   4 eefree     00026C R   |   4 enable_i   0023FB R
  4 eql_tst    000A32 R   |   4 equal      000D29 R   |   4 erase      001F73 R
  4 erase_ex   0001AE R   |   4 erase_fl   0001A4 R   |   4 err_bad_   0010E4 R
  4 err_buf_   00115A R   |   4 err_cmd_   0010A8 R   |   4 err_div0   00106D R
  4 err_dupl   0010C2 R   |   4 err_math   001054 R   |   4 err_mem_   001039 R
  4 err_msg    001019 R   |   4 err_no_a   0010F0 R   |   4 err_no_d   001123 R
  4 err_no_f   001147 R   |   4 err_no_l   00107C R   |   4 err_no_p   001133 R
  4 err_not_   0010D3 R   |   4 err_run_   001092 R   |   4 err_synt   001046 R
  4 escaped    000779 GR  |   4 expect     001635 R   |   4 expr_exi   00178C R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]

Symbol Table

  4 expressi   001746 R   |   4 factor     001697 R   |   5 farptr     000016 R
  4 fcpu       00227D R   |   4 final_te   0005B3 R   |   4 first_li   00191F R
  5 flags      000020 GR  |   4 for        001B8D R   |   4 free       001832 R
  5 free_eep   00002C R   |   7 free_ram   000080 R   |   4 func_arg   001642 R
  4 func_not   0023EE R   |   4 ge         000D2B R   |   4 get_arra   001672 R
  4 get_cmd_   000BA7 R   |   4 get_esca   000328 R   |   4 get_targ   001C57 R
  4 get_targ   001C61 R   |   4 get_tick   0021E9 R   |   4 get_toke   0008EE GR
  4 getc       000301 GR  |   4 gosub      001D20 R   |   4 goto       001D06 R
  4 gpio       00211C R   |   4 gt         000D27 R   |   4 gt_tst     000A3D R
  4 hex_base   001828 R   |   4 hex_dump   000DD6 R   |   4 if         001B79 R
  5 in         000001 GR  |   5 in.saved   000002 GR  |   5 in.w       000000 GR
  4 incr_far   001F57 R   |   4 input_ex   001AD3 R   |   4 input_lo   001A5E R
  4 input_va   001A5C R   |   4 insert_c   0003C7 R   |   4 insert_l   0006BA R
  4 insert_l   000729 R   |   4 interp_l   001262 R   |   4 interpre   00123D R
  4 invert     00246B R   |   4 is_alnum   000822 GR  |   4 is_alpha   000808 GR
  4 is_digit   000819 GR  |   4 is_symbo   00082B R   |   4 itoa       001305 GR
  4 itoa_loo   00132A R   |   4 jp_to_ta   001D13 R   |   4 key        002107 R
  4 kword_di   002A51 GR  |   4 kword_en   0026BD R   |   4 le         000D30 R
  4 leading_   002441 R   |   4 let        0018AA GR  |   4 let_arra   0018B8 R
  4 let_var    0018BB R   |   4 lines_sk   001922 R   |   4 list       0018DD R
  4 list_exi   001964 R   |   4 list_loo   001942 R   |   4 log2       002436 R
  4 logical_   0023E4 R   |   4 long_div   00152D R   |   4 loop_bac   001C3A R
  5 loop_dep   00001D R   |   4 loop_don   001C4F R   |   4 lshift     00224B R
  4 lt         000D2E R   |   4 lt_tst     000A66 R   |   4 modulo     0015C7 R
  4 move       000E41 GR  |   4 move_dow   000E60 R   |   4 move_era   000111 R
  4 move_exi   000E81 R   |   4 move_lef   00039F R   |   4 move_loo   000E65 R
  4 move_prg   000151 R   |   4 move_rig   0003AD R   |   4 move_up    000E52 R
  4 mul_char   000D18 R   |   4 muldiv     0015CC R   |   4 multiply   0014F8 R
  4 mulu24_8   001398 R   |   4 nbr_tst    000921 R   |   4 ne         000D33 R
  4 neg_acc2   0013D2 R   |   4 new        001F32 R   |   4 next       001C0D R
  4 next_lin   001245 R   |   4 next_tok   00129B GR  |   4 no_match   001608 R
  4 other      000A8F R   |   4 overwrit   0005DF R   |   2 pad        0016E0 GR
  4 pad_ref    0026B7 R   |   4 parse_bi   0007CB R   |   4 parse_in   000781 R
  4 parse_ke   00087B R   |   4 parse_qu   00072C R   |   4 parse_sy   000836 R
  4 pause      00218D R   |   4 pause02    002197 R   |   4 peek       001B68 R
  4 pin_mode   002289 R   |   4 plus_tst   000A06 R   |   4 poke       001B59 R
  4 power_ad   001E0B R   |   4 prcnt_ts   000A27 R   |   4 print      0019D6 R
  4 print_ex   001A30 R   |   4 print_he   000614 GR  |   4 print_in   0012E9 R
  4 printxy    00146B R   |   4 prog_siz   0018D5 R   |   4 program_   00012B R
  4 program_   000151 R   |   4 prt_basi   0019B6 R   |   4 prt_loop   0019DA R
  4 prt_tok    000D68 R   |   4 prti24     0012F9 R   |   5 ptr16      000017 GR
  5 ptr8       000018 R   |   4 putc       0002F1 GR  |   4 puts       00034E GR
  4 qgetc      0002FA GR  |   4 qkey       00210F GR  |   4 qmark_ts   0009B3 R
  4 qsign      001FD8 R   |   4 random     002305 R   |   4 read       0025A6 R
  4 read01     0025A8 R   |   4 readln     000453 GR  |   4 readln_l   000460 R
  4 readln_q   0005FC R   |   4 refresh_   002431 R   |   4 rel_exit   0017E4 R
  4 relation   00178F R   |   4 relop_st   000D1B R   |   4 remark     001AD6 GR
  4 reset_co   0019D8 R   |   4 rest_con   001A4C R   |   4 restore    002557 R
  4 return     001D40 R   |   4 right_al   000B4C GR  |   4 row_alig   001F3C R
  4 row_eras   0000E4 R   |   4 row_eras   000111 R   |   4 row_loop   000DB9 R
  4 rparnt_t   000971 R   |   4 rshift     002264 R   |   7 rsign      00007C R
  7 rsize      00007E R   |   4 rt_msg     001167 R   |   4 run        001D5E R
  4 run_app    000F81 R   |   4 run_it     001D90 R   |   5 rx1_head   00002A R
  5 rx1_queu   000022 R   |   5 rx1_tail   00002B R   |   4 save_app   001FDF R
  4 save_con   001A3C R   |   4 scan_blo   001F65 R   |   4 scan_fre   00024F GR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]

Symbol Table

  4 search_d   0015E8 GR  |   4 search_e   001632 R   |   4 search_l   000636 GR
  4 search_l   000645 R   |   4 search_n   0015EC R   |   5 seedx      000012 R
  5 seedy      000014 R   |   4 select_p   0022D5 R   |   4 send_esc   000376 R
  4 send_par   000381 R   |   4 set_time   0023D2 R   |   4 sharp_ts   000992 R
  4 show       0017E7 R   |   4 show_row   000DA7 R   |   4 single_c   000D11 R
  4 skip       0008DB R   |   4 skip_lab   001292 R   |   4 slash_ts   000A1C R
  4 sleep      002182 R   |   4 software   000E99 R   |   4 spaces     0003BB GR
  4 spi_clea   00264B R   |   4 spi_disa   002633 R   |   4 spi_enab   002600 R
  4 spi_rcv_   00266D R   |   4 spi_read   002698 R   |   4 spi_sele   0026A0 R
  4 spi_send   002657 R   |   4 spi_writ   002678 R   |   2 stack_fu   001760 GR
  2 stack_un   001800 R   |   4 star_tst   000A11 R   |   4 step       001BE6 R
  4 stop       001EE6 R   |   4 store_lo   001BFA R   |   4 str_matc   001615 R
  4 str_tst    000911 R   |   4 strcmp     000E20 R   |   4 strcpy     000E31 GR
  4 strlen     000E15 GR  |   4 symb_loo   000836 R   |   4 syntax_e   00119A GR
  5 tab_widt   000021 GR  |   4 tb_error   00119C GR  |   4 term       0016F4 R
  4 term01     0016FC R   |   4 term_exi   001743 R   |   2 tib        001690 GR
  4 tick_tst   0009CB R   |   5 ticks      00000E R   |   4 timeout    0023E1 R
  5 timer      000010 GR  |   4 timer2_i   00008C R   |   4 timer4_i   000099 R
  4 tk_id      00118A R   |   4 to         001BB6 R   |   4 to_eepro   00017A R
  4 to_flash   00017F R   |   4 to_hex_c   00062B GR  |   4 to_upper   0013F5 GR
  4 token_ch   000AA6 R   |   4 token_ex   000AAA R   |   4 token_ms   000D9F R
  4 tone       001DC7 R   |   4 try_next   002596 R   |   5 txtbgn     000019 GR
  5 txtend     00001B GR  |   4 uart1_ge   000301 GR  |   4 uart1_in   0002AC R
  4 uart1_pu   0002F1 GR  |   4 uart1_qg   0002FA GR  |   4 uart1_se   0002BC R
  4 ubound     0018A0 R   |   4 udiv32_1   00151B R   |   4 uflash     002146 R
  4 umstar     0014BE R   |   4 unlock_e   0000AE R   |   4 unlock_f   0000C9 R
  4 until      00248F R   |   4 user_int   000037 R   |   4 usr        00215C R
  4 var_name   000B9F GR  |   5 vars       00002E GR  |   4 wait       001ADC R
  4 warm_ini   000FE4 R   |   4 warm_sta   00121E R   |   4 words      00236C R
  4 words_co   0023BC R   |   4 write      002097 R   |   4 write_bl   00022A GR
  4 write_by   0001B0 R   |   4 write_ee   0001EC R   |   4 write_ex   000225 R
  4 write_fl   0001D6 R   |   4 write_ro   00016B R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 SSEG       size      0   flags    8
   2 SSEG0      size    170   flags    8
   3 HOME       size     80   flags    0
   4 CODE       size   2B84   flags    0
   5 DATA       size     62   flags    0
   6 BTXT       size      0   flags    8
   7 BTXT1      size      4   flags    8

