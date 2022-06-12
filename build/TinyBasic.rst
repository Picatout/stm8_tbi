ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 1.
Hexadecimal [24-Bits]



                                      1 ;;
                                      2 ; Copyright Jacques Deschênes 2019,2022  
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
                           000000     5 DEBUG=0 ; set to 1 to include debugging code 
                                      6 
                           000000     7 SEPARATE=0 ; set to 1 for 'make separate' 
                                      8 
                                      9 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



                                     26 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                                     27 	.include "inc/stm8s208.inc"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



                                     28   	.include "inc/nucleo_8s208.inc"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                           000010    55 USR_BTN_MASK = (1<<USR_BTN_BIT) ;bit 4 mask
                                     56 
                                     57 
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
                           00003A    86 		COLON = 58 
                           00003B    87 		SEMIC = 59  
                           000023    88 		SHARP = 35
                           000027    89 		TICK = 39
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
                           000000     5 DEBUG=0 ; set to 1 to include debugging code 
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
                           000010    23         F_IFUNC=(1<<4) ; integer function keyword
                           000020    24         F_CFUNC=(2<<4) ; character function keyword
                           000030    25         F_CONST=(3<<4) ; function keyword that return a constant
                           000070    26         F_NOT=(7<<4)   ; TK_NOT 
                           000080    27         F_AND=(8<<4)   ; TK_AND
                           000090    28         F_OR=(9<<4)    ; TK_OR
                           0000A0    29         F_XOR=(10<<4)   ; TK_XOR   
                           00000F    30         NLEN_MASK=0xf  ; mask to extract name len 
                           0000F0    31         KW_TYPE_MASK=0xf0 ; mask to extract keyword type 
                                     32 
                                     33 
                           00008C    34 	STACK_SIZE=140
                           0017FF    35 	STACK_EMPTY=RAM_SIZE-1  
                           000003    36         CELL_SIZE=3
                           000014    37         XSTACK_SIZE=20 ; 20 * int24
                           001773    38         XSTACK_EMPTY=STACK_EMPTY-STACK_SIZE 
                           000000    39 	FRUN=0 ; flags run code in variable flags
                           000001    40 	FTRAP=1 ; inside trap handler 
                           000002    41 	FLOOP=2 ; FOR loop in preparation 
                           000003    42 	FSLEEP=3 ; halt produit par la commande SLEEP 
                           000004    43 	FBREAK=4 ; break point flag 
                           000005    44 	FCOMP=5  ; compiling flags 
                           000006    45         FLN_REJECTED=6 ; a memory full error occured while in *insert_line*. 
                                     46 
                           000006    47         FIRST_DATA_ITEM=6 ; first DATA item offset on line.
                                     48 
                           007FFF    49 	MAX_LINENO=0x7fff; BASIC maximum line number 
                                     50 
                           000008    51 	RX_QUEUE_SIZE=8 
                                     52 
                           00F424    53         TIM2_CLK_FREQ=62500
                                     54 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                           000050    55 	TIB_SIZE=80
                           000080    56         PAD_SIZE=BLOCK_SIZE 
                                     57 
                           00000F    58         NAME_MAX_LEN=15  ; CONST and DIM variables maximum length 
                           000005    59         REC_XTRA_BYTES=5 
                           00001F    60         REC_LEN_MASK=31
                                     61 ;--------------------------------------
                                     62 ;   constantes related to Arduino 
                                     63 ;   API mapping 
                                     64 ;-------------------------------------
                           000000    65         INP=0
                           000001    66         OUTP=1 
                                     67 
                                     68 ;--------------------------------------
                                     69 ;       token attribute
                                     70 ;--------------------------------------
                                     71         ; bits 4:5 identify token group 
                                     72         ; 0x0n -> miscelinous 
                                     73         ; 0x1n -> +|- operators 
                                     74         ; 0x2n -> *|/|% operators
                                     75         ; 0x3n -> relational operators 
                           000080    76         TK_CMD=128      ; BASIC command   
                           000081    77         TK_IFUNC=129    ; BASIC integer function
                           000082    78         TK_CFUNC=130    ; BASIC character function
                           000083    79         TK_CONST=131    ; BASIC constant 
                           000084    80         TK_INTGR=132    ; 16 bits integer 
                           000085    81         TK_VAR=133
                           000086    82         TK_FLOAT=134    ; float32 
                           000087    83         TK_NOT=135
                           000088    84         TK_AND=136      ;
                           000089    85         TK_OR=137       ;
                           00008A    86         TK_XOR=138      ; 
                           000000    87         TK_NONE=0       ; not a token 
                           000002    88         TK_QSTR=2       ; quoted string  
                           000003    89         TK_LABEL=3      ; used for defined, constants, variables
                           000004    90         TK_CHAR=4       ; ASCII character 
                           000005    91         TK_ARRAY=5      ; array variable '@' 
                           000006    92         TK_LPAREN=6     ; left parenthesis '('
                           000007    93         TK_RPAREN=7     ; right parenthesis ')'
                           000008    94         TK_COMMA=8      ; item separator ',' 
                           000009    95         TK_COLON=9      ; command separator ':' 
                           00000A    96         TK_SEMIC=10     ; used in PRINT command.  ';' 
                                     97 
                           000010    98         TK_PLUS=0x10    ; addition operator '+'
                           000011    99         TK_MINUS=0x11   ; subtraction operator '-'
                           000020   100         TK_MULT=0x20    ; multiplication operator '*'
                           000021   101         TK_DIV=0x21     ; division operator '/'
                           000022   102         TK_MOD=0x22     ; modulo operator '%'
                                    103 
                                    104         ; don't change these token values 
                                    105         ; values chosen to be used as a mask.
                                    106         ; bit 7   1 for dictionary words else 0 
                                    107         ; bits 6  always 0 
                                    108         ; bits 5:4 identify group 
                                    109         ; bits 3:0 token identifier inside group  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                           000031   110         TK_GT=0x31      ; relation operator '>'
                           000032   111         TK_EQUAL=0x32   ; assignment or relation operator '='
                           000033   112         TK_GE=0x33      ; relation operator '>='
                           000034   113         TK_LT=0x34      ; relation operator '<'
                           000036   114         TK_LE=0x36      ; relation operator '<='
                           000035   115         TK_NE=0x35      ; relation operator '<>' not equal 
                                    116         ; token groups 
                           000030   117         TK_GRP_MASK=0x30 ; groups bits selector 
                           000000   118         TK_GRP_MISC=0x00 ; miscelinous group 
                           000010   119         TK_GRP_ADD=0x10  ; additive operators
                           000020   120         TK_GRP_MULT=0x20 ; multiplicative operators
                           000030   121         TK_GRP_RELOP=0x30 ;relational operators. 
                           000002   122         CMD_END=2 
                                    123 
                                    124 ;--------------------------------------
                                    125 ;   error codes 
                                    126 ;--------------------------------------
                           000000   127     ERR_NONE=0
                           000001   128     ERR_MEM_FULL=1 
                           000002   129     ERR_SYNTAX=2
                           000003   130     ERR_MATH_OVF=3
                           000004   131     ERR_DIV0=4 
                           000005   132     ERR_NO_LINE=5
                           000006   133     ERR_RUN_ONLY=6
                           000007   134     ERR_CMD_ONLY=7
                           000008   135     ERR_DUPLICATE=8
                           000009   136     ERR_NOT_FILE=9
                           00000A   137     ERR_BAD_VALUE=10
                           00000B   138     ERR_NO_ACCESS=11
                           00000C   139     ERR_NO_DATA=12 
                           00000D   140     ERR_NO_PROG=13
                           00000E   141     ERR_NO_FSPACE=14
                           00000F   142     ERR_BUF_FULL=15
                           000010   143     ERR_OVERFLOW=16 
                           000011   144     ERR_RD_ONLY=17
                           000012   145     ERR_NO_PROGRAM=18
                                    146 
                                    147 ;--------------------------------------
                                    148 ;   assembler flags 
                                    149 ;-------------------------------------
                                    150 ;    MATH_OVF=0 ; if 1 the stop on math overflow 
                                    151 
                                    152      .macro _usec_dly n 
                                    153     ldw x,#(16*n-2)/4
                                    154     decw x
                                    155     nop 
                                    156     jrne .-4
                                    157     .endm 
                                    158     
                                    159     ; load X register with 
                                    160     ; entry point of dictionary
                                    161     ; before calling 'search_dict'
                                    162     .macro _ldx_dict dict_name
                                    163     ldw x,#dict_name+2
                                    164     .endm 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                    165 
                                    166     ; reset BASIC pointer
                                    167     ; to beginning of last token
                                    168     ; extracted except if it was end of line 
                                    169     .macro _unget_token 
                                    170      mov in,in.saved  
                                    171     .endm
                                    172 
                                    173 
                                    174     ; extract code address for 
                                    175     ; TK_CMD|TK_FUNC|TK_IFUNC|TK_CFUNC 
                                    176     .macro _get_code_addr
                                    177         ldw x,(x)
                                    178         inc in 
                                    179         inc in 
                                    180     .endm 
                                    181 
                                    182 
                                    183 
                                    184 ;---------------------------------------
                                    185 ;    xtack manipulation macros 
                                    186 ;    Y is used as xstack pointer  
                                    187 ;----------------------------------------
                                    188     ; pop in A:X from XSTACK 
                                    189     .macro _xpop 
                                    190     ld a,(y)
                                    191     ldw x,y 
                                    192     ldw x,(1,x)
                                    193     addw y,#CELL_SIZE 
                                    194     .endm 
                                    195 
                                    196     ; push A:X  to XSTACK 
                                    197     .macro _xpush 
                                    198     subw y,#CELL_SIZE
                                    199     ld (y),a 
                                    200     ldw (1,y),x 
                                    201     .endm 
                                    202 
                                    203     ; drop from XSTACK 
                                    204     .macro _xdrop 
                                    205     addw y,#CELL_SIZE 
                                    206     .endm 
                                    207 
                                    208     ; @T fetch top xstack 
                                    209     .macro _at_top
                                    210     ld a,(y)
                                    211     ldw x,y 
                                    212     ldw x,(1,x)
                                    213     .endm 
                                    214 
                                    215     ; @N  fetch next on xstack 
                                    216     .macro _at_next 
                                    217     ld a,(3,y)
                                    218     ldw x,y 
                                    219     ldw x,(4,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                    220     .endm 
                                    221 
                                    222     ; !T put on top of xtack 
                                    223     .macro _store_top 
                                    224     ld (y),a 
                                    225     ldw (1,y),x     
                                    226     .endm 
                                    227 
                                    228     ; !N put next on xstack 
                                    229     .macro _store_next 
                                    230     ld (3,y),a 
                                    231     ldw (4,y),x 
                                    232     .endm 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                                     33   
                                     34 ;;-----------------------------------
                                     35     .area SSEG (ABS)
                                     36 ;; working buffers and stack at end of RAM. 	
                                     37 ;;-----------------------------------
      001668                         38     .org RAM_SIZE-STACK_SIZE-XSTACK_SIZE*CELL_SIZE-TIB_SIZE-PAD_SIZE 
      001668                         39 tib:: .ds TIB_SIZE             ; terminal input buffer
      0016B8                         40 block_buffer::                 ; use to write FLASH block (alias for pad )
      0016B8                         41 pad:: .ds PAD_SIZE             ; working buffer
      001738                         42 xstack_full:: .ds XSTACK_SIZE*CELL_SIZE   ; expression stack 
      001774                         43 xstack_unf:: ; xstack underflow 
      001774                         44 stack_full:: .ds STACK_SIZE   ; control stack 
      001800                         45 stack_unf: ; stack underflow ; control_stack bottom 
                                     46 
                                     47 ;;--------------------------------------
                                     48     .area HOME 
                                     49 ;; interrupt vector table at 0x8000
                                     50 ;;--------------------------------------
                                     51 
      008000 82 00 81 35             52     int cold_start			; RESET vector 
      008004 82 00 80 92             53 	int SysCall ; TRAP  BASIC sys() calls 
      008008 82 00 80 80             54 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 84             55 	int AWUHandler          ;int1 AWU   auto wake up from halt
      008010 82 00 80 80             56 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 80             57 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 80             58 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 80             59 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 80             60 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 B6             61 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 80             62 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 80             63 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 80             64 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 80             65 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 80             66 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 80             67 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 80             68 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 80             69 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 80             70 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 80             71 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 86 22             72 	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
      008054 82 00 80 80             73 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 80             74 	int NonHandledInterrupt ;int20 UART3 TX completed
      00805C 82 00 80 80             75 	int NonHandledInterrupt ;int21 UART3 RX full
      008060 82 00 80 80             76 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 93             77 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
      008068 82 00 80 80             78 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 80             79 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 80             80 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 80             81 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 80             82 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 80             83 	int NonHandledInterrupt ;int29  not used
                                     84 
                                     85 ;---------------------------------------
                                     86     .area CODE
                                     87 ;---------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                     88 
                                     89 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     90 ; non handled interrupt 
                                     91 ; reset MCU
                                     92 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008080                         93 NonHandledInterrupt:
      000000                         94 	_swreset ; see "inc/gen_macros.inc"
      008080 35 80 50 D1      [ 1]    1     mov WWDG_CR,#0X80
                                     95 
                                     96 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     97 ; auto wakeup from halt
                                     98 ; at iret, program continue 
                                     99 ; after halt instruction
                                    100 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008084                        101 AWUHandler:
      008084 72 19 50 F0      [ 1]  102 	bres AWU_CSR,#AWU_CSR_AWUEN
      008088 55 00 3F 50 F1   [ 1]  103 	mov AWU_APR,0x3F
      00808D 72 5F 50 F2      [ 1]  104 	clr AWU_TBR 
      008091 80               [11]  105 	iret
                                    106 
                                    107 ;------------------------------------
                                    108 ; system call handler  
                                    109 ;------------------------------------
      008092                        110 SysCall:
                                    111 
      008092 80               [11]  112 	iret 
                                    113 
                                    114 ;------------------------------
                                    115 ; TIMER 4 is used to maintain 
                                    116 ; a milliseconds 'ticks' counter
                                    117 ; and decrement 'timer' varaiable
                                    118 ; ticks range {0..2^23-1}
                                    119 ; timer range {0..65535}
                                    120 ;--------------------------------
      008093                        121 Timer4UpdateHandler:
      008093 72 5F 53 42      [ 1]  122 	clr TIM4_SR 
      008097 C6 00 10         [ 1]  123 	ld a,ticks 
      00809A CE 00 11         [ 2]  124 	ldw x,ticks+1
      00809D 1C 00 01         [ 2]  125 	addw x,#1 
      0080A0 A9 00            [ 1]  126 	adc a,#0 
      0080A2 2A 02            [ 1]  127 	jrpl 0$
                                    128 ; reset to 0 when negatif 
      0080A4 4F               [ 1]  129 	clr a 
      0080A5 5F               [ 1]  130 	clrw x 
      0080A6 C7 00 10         [ 1]  131 0$:	ld ticks,a 
      0080A9 CF 00 11         [ 2]  132 	ldw ticks+1,x 
      0080AC CE 00 13         [ 2]  133 	ldw x,timer
      0080AF 27 04            [ 1]  134 	jreq 1$
      0080B1 5A               [ 2]  135 	decw x 
      0080B2 CF 00 13         [ 2]  136 	ldw timer,x 
      0080B5                        137 1$:	
      0080B5 80               [11]  138 	iret 
                                    139 
                                    140 ;------------------------------------
                                    141 ; Triggered by pressing USER UserButton 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                    142 ; on NUCLEO card.
                                    143 ; This is used to abort a progam lock 
                                    144 ; in infinite loop. 
                                    145 ;------------------------------------
      0080B6                        146 UserButtonHandler:
                                    147 ; wait button release
      0080B6 5F               [ 1]  148 	clrw x
      0080B7 5A               [ 2]  149 1$: decw x 
      0080B8 26 FD            [ 1]  150 	jrne 1$
      0080BA 72 09 50 15 F8   [ 2]  151 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    152 ; if MCU suspended by SLEEP resume program
      0080BF 72 07 00 23 05   [ 2]  153     btjf flags,#FSLEEP,2$
      0080C4 72 17 00 23      [ 1]  154 	bres flags,#FSLEEP 
      0080C8 80               [11]  155 	iret
      0080C9                        156 2$:	
      0080C9                        157 user_interrupted:
      0080C9 72 00 00 23 02   [ 2]  158     btjt flags,#FRUN,4$
      0080CE 20 0A            [ 2]  159 	jra UBTN_Handler_exit 
      0080D0                        160 4$:	; program interrupted by user 
      0080D0 72 11 00 23      [ 1]  161 	bres flags,#FRUN 
      0080D4 AE 80 E2         [ 2]  162 	ldw x,#USER_ABORT
      0080D7 CD 87 02         [ 4]  163 	call puts 
      0080DA                        164 UBTN_Handler_exit:
      0080DA AE 17 FF         [ 2]  165     ldw x,#STACK_EMPTY 
      0080DD 94               [ 1]  166     ldw sp,x
      0080DE 9A               [ 1]  167 	rim 
      0080DF CC 94 BC         [ 2]  168 5$:	jp warm_start
                                    169 
      0080E2 0A 50 72 6F 67 72 61   170 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    171 
                                    172 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    173 ;    peripherals initialization
                                    174 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    175 
                                    176 ;----------------------------------------
                                    177 ; inialize MCU clock 
                                    178 ; input:
                                    179 ;   A 		source  HSI | 1 HSE 
                                    180 ;   XL      CLK_CKDIVR , clock divisor 
                                    181 ; output:
                                    182 ;   none 
                                    183 ;----------------------------------------
      0080FD                        184 clock_init:	
      0080FD C1 50 C3         [ 1]  185 	cp a,CLK_CMSR 
      008100 27 0C            [ 1]  186 	jreq 2$ ; no switching required 
                                    187 ; select clock source 
      008102 72 12 50 C5      [ 1]  188 	bset CLK_SWCR,#CLK_SWCR_SWEN
      008106 C7 50 C4         [ 1]  189 	ld CLK_SWR,a
      008109 C1 50 C3         [ 1]  190 1$:	cp a,CLK_CMSR
      00810C 26 FB            [ 1]  191 	jrne 1$
      00810E                        192 2$: 	
                                    193 ; HSI and cpu clock divisor 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      00810E 9F               [ 1]  194 	ld a,xl 
      00810F C7 50 C6         [ 1]  195 	ld CLK_CKDIVR,a  
      008112 81               [ 4]  196 	ret
                                    197 
                                    198 ;----------------------------------
                                    199 ; TIMER2 used as audio tone output 
                                    200 ; on port D:5. CN9-6
                                    201 ; channel 1 configured as PWM mode 1 
                                    202 ;-----------------------------------  
                                    203 
      008113                        204 timer2_init:
      008113 72 1A 50 C7      [ 1]  205 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      008117 35 60 53 05      [ 1]  206  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      00811B 35 08 53 0C      [ 1]  207 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      00811F 81               [ 4]  208 	ret 
                                    209 
                                    210 ;---------------------------------
                                    211 ; TIM4 is configured to generate an 
                                    212 ; interrupt every millisecond 
                                    213 ;----------------------------------
      008120                        214 timer4_init:
      008120 72 18 50 C7      [ 1]  215 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      008124 35 07 53 45      [ 1]  216 	mov TIM4_PSCR,#7 ; prescale 128  
      008128 35 7D 53 46      [ 1]  217 	mov TIM4_ARR,#125 ; set for 1msec.
      00812C 35 05 53 40      [ 1]  218 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008130 72 10 53 41      [ 1]  219 	bset TIM4_IER,#TIM4_IER_UIE
      008134 81               [ 4]  220 	ret
                                    221 
                                    222 ;-------------------------------------
                                    223 ;  initialization entry point 
                                    224 ;-------------------------------------
      008135                        225 cold_start:
                                    226 ;set stack 
      008135 AE 17 FF         [ 2]  227 	ldw x,#STACK_EMPTY
      008138 94               [ 1]  228 	ldw sp,x
                                    229 ; clear all ram 
      008139 7F               [ 1]  230 0$: clr (x)
      00813A 5A               [ 2]  231 	decw x 
      00813B 26 FC            [ 1]  232 	jrne 0$
                                    233 ; activate pull up on all inputs 
      00813D A6 FF            [ 1]  234 	ld a,#255 
      00813F C7 50 03         [ 1]  235 	ld PA_CR1,a 
      008142 C7 50 08         [ 1]  236 	ld PB_CR1,a 
      008145 C7 50 0D         [ 1]  237 	ld PC_CR1,a 
      008148 C7 50 12         [ 1]  238 	ld PD_CR1,a 
      00814B C7 50 17         [ 1]  239 	ld PE_CR1,a 
      00814E C7 50 1C         [ 1]  240 	ld PF_CR1,a 
      008151 C7 50 21         [ 1]  241 	ld PG_CR1,a 
      008154 C7 50 2B         [ 1]  242 	ld PI_CR1,a
                                    243 ; set LD2 pin as output 
      008157 72 1A 50 0D      [ 1]  244     bset PC_CR1,#LED2_BIT
      00815B 72 1A 50 0E      [ 1]  245     bset PC_CR2,#LED2_BIT
      00815F 72 1A 50 0C      [ 1]  246     bset PC_DDR,#LED2_BIT
      008163 72 1B 50 0A      [ 1]  247 	bres PC_ODR,#LED2_BIT ; turn off LD2 
                                    248 ; disable schmitt triggers on Arduino CN4 analog inputs
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008167 55 00 3F 54 07   [ 1]  249 	mov ADC_TDRL,0x3f
                                    250 ; initialize auto wakeup with LSI clock
      00816C 72 5F 50 F2      [ 1]  251 	clr AWU_TBR 
      008170 72 14 50 CA      [ 1]  252 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                    253 ; select internal clock no divisor: 16 Mhz 	
      008174 A6 E1            [ 1]  254 	ld a,#CLK_SWR_HSI 
      008176 5F               [ 1]  255 	clrw x  
      008177 CD 80 FD         [ 4]  256     call clock_init 
      00817A CD 81 20         [ 4]  257 	call timer4_init
      00817D CD 81 13         [ 4]  258 	call timer2_init	
                                    259 ; UART1 at 115200 BAUD
                                    260 ; used for user interface 
                                    261 ; via USB emulation through STLINK programmer.
      008180 CD 86 60         [ 4]  262 	call uart1_init
                                    263 ; activate PE_4 (user button interrupt)
      008183 72 18 50 18      [ 1]  264     bset PE_CR2,#USR_BTN_BIT 
                                    265 ; display system information
      008187 9A               [ 1]  266 	rim ; enable interrupts 
                                    267 ; RND function seed 
                                    268 ; must be initialized 
                                    269 ; to value other than 0.
      008188 72 5C 00 18      [ 1]  270 	inc seedy+1 
      00818C 72 5C 00 16      [ 1]  271 	inc seedx+1 
      008190 CD 9A E0         [ 4]  272 	call func_eefree ; eeprom free address 
      008193 CD 9A 81         [ 4]  273 	call ubound ; @() size 
      008196 CD 92 49         [ 4]  274 	call clear_basic
      008199 CD A3 A1         [ 4]  275 	call beep_1khz  ; 
      00819C CD 91 FE         [ 4]  276 	call system_information ; display system information 
      00819F                        277 2$:	
                                    278 ; check for autorun application
      00819F CE 40 00         [ 2]  279 	ldw x,EEPROM_BASE 
      0081A2 C3 AF 91         [ 2]  280 	cpw x,AR_SIGN 
      0081A5 27 03            [ 1]  281 	jreq run_app
      0081A7 CC 94 BC         [ 2]  282 	jp warm_start 
      0081AA                        283 run_app:
      0081AA 4F               [ 1]  284 	clr a 
      0081AB CE 40 02         [ 2]  285 	ldw x,EEPROM_BASE+2
      0081AE CD A2 A7         [ 4]  286 	call is_program_addr 
      0081B1 27 03            [ 1]  287 	jreq 1$
      0081B3 CC 94 BC         [ 2]  288 	jp warm_start ; no autorun application.
      0081B6                        289 1$:	
                                    290 ; run application in FLASH|EEPROM 
      0081B6 90 CE 17 73      [ 2]  291 	ldw y,XSTACK_EMPTY
      0081BA CD 92 2B         [ 4]  292 	call warm_init
      0081BD CE 40 02         [ 2]  293 	ldw x,EEPROM_BASE+2 
      0081C0 CF 00 1C         [ 2]  294 	ldw txtbgn,x
      0081C3 1D 00 02         [ 2]  295 	subw x,#2 
      0081C6 FE               [ 2]  296 	ldw x,(x)
      0081C7 72 BB 00 1C      [ 2]  297 	addw x,txtbgn 
      0081CB CF 00 1E         [ 2]  298 	ldw txtend,x 
      0081CE AE 81 DC         [ 2]  299 	ldw x,#AUTO_RUN 
      0081D1 CD 87 02         [ 4]  300 	call puts 
      0081D4 CD 9B F8         [ 4]  301 	call program_info 
      0081D7 CC A3 17         [ 2]  302 	jp run_it_02  
      0081DA 20 FE            [ 2]  303     jra .  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                    304 
      0081DC 20 61 75 74 6F 20 72   305 AUTO_RUN: .asciz " auto run program\n"
             75 6E 20 70 72 6F 67
             72 61 6D 0A 00
                                    306 
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
                                     19 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     20 ;;    24 bits arithmetic
                                     21 ;;  arguments are on xtack  
                                     22 ;;  format in registers: A:X 
                                     23 ;;      A  bits 23..16 
                                     24 ;;      X  bits 15..0 
                                     25 ;;  acc24 variable used for 
                                     26 ;;  computation 
                                     27 ;;   T   Top element on xstack 
                                     28 ;;   N   Next element on xtack 
                                     29 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     30 
                                     31 
                                     32     .area CODE 
                                     33 
                                     34 ;-------------------------------
                                     35 ;  duplacte T 
                                     36 ;------------------------------
      0081EF                         37 dup24:
      00016F                         38     _at_top 
      0081EF 90 F6            [ 1]    1     ld a,(y)
      0081F1 93               [ 1]    2     ldw x,y 
      0081F2 EE 01            [ 2]    3     ldw x,(1,x)
      000174                         39     _xpush 
      0081F4 72 A2 00 03      [ 2]    1     subw y,#CELL_SIZE
      0081F8 90 F7            [ 1]    2     ld (y),a 
      0081FA 90 EF 01         [ 2]    3     ldw (1,y),x 
      0081FD 81               [ 4]   40     ret 
                                     41 
                                     42 
                                     43 
                                     44 ;-------------------------------
                                     45 ; add24 
                                     46 ; add 24 bits integers 
                                     47 ;------------------------------
      0081FE                         48 add24: ; ( N T -- N+T )
      00017E                         49     _xpop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      0081FE 90 F6            [ 1]    1     ld a,(y)
      008200 93               [ 1]    2     ldw x,y 
      008201 EE 01            [ 2]    3     ldw x,(1,x)
      008203 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      008207 89               [ 2]   50     pushw x  
      008208 88               [ 1]   51     push a  
      000189                         52     _at_top  
      008209 90 F6            [ 1]    1     ld a,(y)
      00820B 93               [ 1]    2     ldw x,y 
      00820C EE 01            [ 2]    3     ldw x,(1,x)
      00820E 72 FB 02         [ 2]   53     addw x,(2,sp)
      008211 19 01            [ 1]   54     adc a, (1,sp)
      000193                         55     _store_top 
      008213 90 F7            [ 1]    1     ld (y),a 
      008215 90 EF 01         [ 2]    2     ldw (1,y),x     
      000198                         56     _drop 3 
      008218 5B 03            [ 2]    1     addw sp,#3 
      00821A 81               [ 4]   57     ret 
                                     58 
                                     59 ;-------------------------------
                                     60 ; sub24 
                                     61 ; subtract 24 bits integers 
                                     62 ;------------------------------
      00821B                         63 sub24: ; ( N T -- N-T ) 
      00019B                         64     _xpop 
      00821B 90 F6            [ 1]    1     ld a,(y)
      00821D 93               [ 1]    2     ldw x,y 
      00821E EE 01            [ 2]    3     ldw x,(1,x)
      008220 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      008224 89               [ 2]   65     pushw x 
      008225 88               [ 1]   66     push  a
      0001A6                         67     _at_top  
      008226 90 F6            [ 1]    1     ld a,(y)
      008228 93               [ 1]    2     ldw x,y 
      008229 EE 01            [ 2]    3     ldw x,(1,x)
      00822B 72 F0 02         [ 2]   68     subw x,(2,sp) 
      00822E 12 01            [ 1]   69     sbc a, (1,sp)
      0001B0                         70     _store_top  
      008230 90 F7            [ 1]    1     ld (y),a 
      008232 90 EF 01         [ 2]    2     ldw (1,y),x     
      0001B5                         71     _drop 3 
      008235 5B 03            [ 2]    1     addw sp,#3 
      008237 81               [ 4]   72     ret 
                                     73 
                                     74 ;------------------------------
                                     75 ; cp24  N T -- 0x800000|0|0x010000
                                     76 ;------------------------------
      008238                         77 cp24:
      0001B8                         78     _xpop 
      008238 90 F6            [ 1]    1     ld a,(y)
      00823A 93               [ 1]    2     ldw x,y 
      00823B EE 01            [ 2]    3     ldw x,(1,x)
      00823D 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      008241 C7 00 0D         [ 1]   79     ld acc24,a 
      008244 CF 00 0E         [ 2]   80     ldw acc16,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      0001C7                         81     _at_top 
      008247 90 F6            [ 1]    1     ld a,(y)
      008249 93               [ 1]    2     ldw x,y 
      00824A EE 01            [ 2]    3     ldw x,(1,x)
      00824C 72 B0 00 0E      [ 2]   82     subw x,acc16
      008250 C2 00 0D         [ 1]   83     sbc a,acc24
      008253 2F 08            [ 1]   84     jrslt 1$
      008255 26 0A            [ 1]   85     jrne 2$
      008257 5D               [ 2]   86     tnzw x 
      008258 26 07            [ 1]   87     jrne 2$
      00825A 4F               [ 1]   88     clr a 
      00825B 20 06            [ 2]   89     jra 9$ 
      00825D                         90 1$: ; i1 < i2 
      00825D A6 FF            [ 1]   91     ld a,#255
      00825F 20 02            [ 2]   92     jra 9$ 
      008261                         93 2$: ; i1 > i2 
      008261 A6 01            [ 1]   94     ld a,#1 
      008263 5F               [ 1]   95 9$: clrw x
      0001E4                         96      _store_top 
      008264 90 F7            [ 1]    1     ld (y),a 
      008266 90 EF 01         [ 2]    2     ldw (1,y),x     
      008269 81               [ 4]   97     ret 
                                     98 
                                     99 ;-------------------------------
                                    100 ; cp24_ax 
                                    101 ; compare acc24 with A:X 
                                    102 ;-------------------------------
      00826A                        103 cp24_ax:
      00826A 88               [ 1]  104     push a 
      00826B C3 00 0E         [ 2]  105     cpw x,acc16 
      00826E C2 00 0D         [ 1]  106     sbc a,acc24
      008271 84               [ 1]  107     pop a 
      008272 81               [ 4]  108     ret 
                                    109 
                                    110 
                                    111 ;-------------------------------
                                    112 ; abs24 
                                    113 ; abolute value of top  
                                    114 ;-------------------------------
      008273                        115 abs24: ; ( i -- u )
      008273 90 F6            [ 1]  116     ld a,(y)
      008275 A1 80            [ 1]  117     cp a,#0x80 
      008277 2A 0A            [ 1]  118     jrpl neg24 ; negative integer
      008279 81               [ 4]  119     ret  
                                    120 
                                    121 ;----------------------------
                                    122 ;  one's compleement 
                                    123 ;----------------------------
      00827A                        124 cpl24:  ; i -- ~i 
      00827A 90 73            [ 1]  125     cpl (y) 
      00827C 90 63 01         [ 1]  126     cpl (1,y)
      00827F 90 63 02         [ 1]  127     cpl (2,y)
      008282 81               [ 4]  128     ret 
                                    129 
                                    130 ;----------------------------    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                                    131 ; two'2 complement of top  
                                    132 ;---------------------------
      008283                        133 neg24: ; (i -- -i )
      000203                        134     _at_top
      008283 90 F6            [ 1]    1     ld a,(y)
      008285 93               [ 1]    2     ldw x,y 
      008286 EE 01            [ 2]    3     ldw x,(1,x)
      008288 43               [ 1]  135     cpl  a  
      008289 53               [ 2]  136     cplw x 
      00828A 1C 00 01         [ 2]  137     addw x,#1
      00828D A9 00            [ 1]  138     adc a,#0
      00020F                        139     _store_top  
      00828F 90 F7            [ 1]    1     ld (y),a 
      008291 90 EF 01         [ 2]    2     ldw (1,y),x     
      008294 81               [ 4]  140 9$: ret 
                                    141 
                                    142 ;-----------------------------
                                    143 ; negate integer in A:X 
                                    144 ;----------------------------
      008295                        145 neg_ax:
      008295 43               [ 1]  146     cpl  a  
      008296 53               [ 2]  147     cplw x 
      008297 1C 00 01         [ 2]  148     addw x,#1
      00829A A9 00            [ 1]  149     adc a,#0
      00829C 81               [ 4]  150     ret 
                                    151 
                                    152 ;------------------------------------
                                    153 ;  two's complement of acc24 
                                    154 ;-------------------------------------
      00829D                        155 neg_acc24: ; 
      00829D 72 53 00 0D      [ 1]  156     cpl acc24 
      0082A1 72 53 00 0E      [ 1]  157     cpl acc16 
      0082A5 72 53 00 0F      [ 1]  158     cpl acc8
      0082A9 72 5C 00 0F      [ 1]  159     inc acc8 
      0082AD 26 0A            [ 1]  160     jrne 9$
      0082AF 72 5C 00 0E      [ 1]  161     inc acc16 
      0082B3 26 04            [ 1]  162     jrne 9$
      0082B5 72 5C 00 0D      [ 1]  163     inc acc24 
      0082B9 81               [ 4]  164 9$: ret 
                                    165 
                                    166 
                                    167 ;--------------------------------------
                                    168 ; unsigned multiply uint24_t by uint8_t
                                    169 ; input:
                                    170 ;	xstack	    uint24_t 
                                    171 ;   a	        uint8_t
                                    172 ; output:
                                    173 ;   xstack   not modified 
                                    174 ;   A:X     product 
                                    175 ;   acc32   overflow, bits 31..24 
                                    176 ;-------------------------------------
                                    177 ; local variables offset  on sp
                           000001   178 	U8   = 1 
                           000001   179     VSIZE=1 
      0082BA                        180 mulu24_8:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      0082BA 88               [ 1]  181     push a 
      0082BB 72 5F 00 0C      [ 1]  182 	clr acc32
      0082BF 72 5F 00 0D      [ 1]  183     clr acc24  
                                    184 ; multiply top bits 7..0 * U8   	
      0082C3 90 E6 02         [ 1]  185     ld a,(2,Y) ; top least byte  
      0082C6 97               [ 1]  186     ld xl,a 
      0082C7 7B 01            [ 1]  187     ld a,(U8,sp)
      0082C9 42               [ 4]  188     mul x,a 
      0082CA CF 00 0E         [ 2]  189     ldw acc16,x 
                                    190 ; multiply top bits 15..8 * U8     
      0082CD 90 E6 01         [ 1]  191     ld a,(1,Y) ; top middle byte 
      0082D0 97               [ 1]  192     ld xl,a 
      0082D1 7B 01            [ 1]  193     ld a,(U8,sp) 
      0082D3 42               [ 4]  194     mul x,a 
      0082D4 72 BB 00 0D      [ 2]  195     addw x,acc24
      0082D8 72 59 00 0C      [ 1]  196     rlc acc32 
      0082DC CF 00 0D         [ 2]  197     ldw acc24,x 
                                    198 ; multiply top bits 23..16 * 8 
      0082DF 90 F6            [ 1]  199     ld a,(Y)
      0082E1 97               [ 1]  200     ld xl,a 
      0082E2 7B 01            [ 1]  201     ld a,(U8,sp)
      0082E4 42               [ 4]  202     mul x,a 
      0082E5 72 BB 00 0C      [ 2]  203     addw x,acc32
      0082E9 02               [ 1]  204     rlwa x 
      0082EA 4D               [ 1]  205     tnz a 
      0082EB 27 05            [ 1]  206     jreq 1$
      0082ED A6 10            [ 1]  207     ld a,#ERR_OVERFLOW
      0082EF CC 94 3F         [ 2]  208     jp tb_error 
      0082F2                        209 1$:
      0082F2 9E               [ 1]  210     ld a,xh  
      0082F3 CE 00 0E         [ 2]  211     ldw x,acc16   
      000276                        212     _drop VSIZE 
      0082F6 5B 01            [ 2]    1     addw sp,#VSIZE 
      0082F8 81               [ 4]  213     ret
                                    214 
                                    215 
                                    216 ;-------------------------------
                                    217 ; mul24 i1 i2 -- i1*i2  
                                    218 ; multiply 24 bits integers 
                                    219 ;------------------------------
                           000001   220     PROD=1 
                           000004   221     PROD_SIGN=4
                           000005   222     N1=5
                           000007   223     VSIZE=7  
      0082F9                        224 mul24:
      000279                        225     _vars VSIZE
      0082F9 52 07            [ 2]    1     sub sp,#VSIZE 
      0082FB 5F               [ 1]  226     clrw x 
      0082FC 1F 01            [ 2]  227     ldw (PROD,sp),x 
      0082FE 1F 03            [ 2]  228     ldw (PROD+2,sp),x
      000280                        229     _xpop 
      008300 90 F6            [ 1]    1     ld a,(y)
      008302 93               [ 1]    2     ldw x,y 
      008303 EE 01            [ 2]    3     ldw x,(1,x)
      008305 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008309 4D               [ 1]  230     tnz a 
      00830A 2A 05            [ 1]  231     jrpl 0$
      00830C 03 04            [ 1]  232     cpl (PROD_SIGN,sp)
      00830E CD 82 95         [ 4]  233     call neg_ax 
      008311                        234 0$:    
      008311 6B 05            [ 1]  235     ld (N1,sp),a 
      008313 1F 06            [ 2]  236     ldw (N1+1,sp),x
      008315 90 7D            [ 1]  237     tnz (Y)
      008317 2A 05            [ 1]  238     jrpl 2$ 
      008319 03 04            [ 1]  239     cpl (PROD_SIGN,sp) 
      00831B CD 82 83         [ 4]  240     call neg24
      00831E                        241 2$: 
      00831E 7B 07            [ 1]  242     ld a,(N1+2,sp); least byte     
      008320 27 0A            [ 1]  243     jreq 4$
      008322 CD 82 BA         [ 4]  244     call mulu24_8
      008325 4D               [ 1]  245     tnz a 
      008326 2B 3C            [ 1]  246     jrmi 8$ ; overflow  
      008328 6B 01            [ 1]  247     ld (PROD,sp),a
      00832A 1F 02            [ 2]  248     ldw (PROD+1,sp),x 
      00832C                        249 4$:
      00832C 7B 06            [ 1]  250     ld a,(N1+1,sp); middle byte     
      00832E 27 0D            [ 1]  251     jreq 5$
      008330 CD 82 BA         [ 4]  252     call mulu24_8
      008333 4D               [ 1]  253     tnz a 
      008334 26 2E            [ 1]  254     jrne 8$  ; overflow 
      008336 72 FB 01         [ 2]  255     addw x,(PROD,sp)
      008339 29 29            [ 1]  256     jrv 8$ ; overflow
      00833B 1F 01            [ 2]  257     ldw (PROD,sp),x 
      00833D                        258 5$:
      00833D 7B 05            [ 1]  259     ld a,(N1,sp) ; high byte 
      00833F 27 10            [ 1]  260     jreq 6$
      008341 CD 82 BA         [ 4]  261     call mulu24_8
      008344 01               [ 1]  262     rrwa x 
      008345 5D               [ 2]  263     tnzw x 
      008346 26 1C            [ 1]  264     jrne 8$ ; overflow 
      008348 4D               [ 1]  265     tnz a 
      008349 2B 19            [ 1]  266     jrmi 8$ ; overflow 
      00834B 1B 01            [ 1]  267     add a,(PROD,sp)
      00834D 6B 01            [ 1]  268     ld (PROD,sp),a 
      00834F 29 13            [ 1]  269     jrv 8$ ; overflow 
      008351                        270 6$:
      008351 7B 01            [ 1]  271     ld a,(PROD,sp)
      008353 1E 02            [ 2]  272     ldw x,(PROD+1,sp)
      008355 0D 04            [ 1]  273     tnz (PROD_SIGN,sp)
      008357 27 03            [ 1]  274     jreq 9$
      008359 CD 82 95         [ 4]  275     call neg_ax 
      00835C                        276 9$:
      0002DC                        277     _store_top 
      00835C 90 F7            [ 1]    1     ld (y),a 
      00835E 90 EF 01         [ 2]    2     ldw (1,y),x     
      0002E1                        278     _drop VSIZE 
      008361 5B 07            [ 2]    1     addw sp,#VSIZE 
      008363 81               [ 4]  279     ret 
      008364                        280 8$: ; overflow
      008364 A6 10            [ 1]  281     ld a,#ERR_OVERFLOW
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008366 CC 94 3F         [ 2]  282     jp tb_error 
                                    283 
                                    284 ;-------------------------------------
                                    285 ; divide uint24_t by uint8_t
                                    286 ; input:
                                    287 ;	acc24	dividend
                                    288 ;   A 		divisor
                                    289 ; output:
                                    290 ;   acc24	quotient
                                    291 ;   A		remainder
                                    292 ;------------------------------------- 
                                    293 ; offset  on sp of arguments and locals
                           000001   294 	U8   = 1   ; divisor on stack
                           000001   295 	VSIZE =1
      008369                        296 divu24_8:
      008369 89               [ 2]  297 	pushw x ; save x
      00836A 88               [ 1]  298 	push a 
                                    299 	; ld dividend UU:MM bytes in X
      00836B CE 00 0D         [ 2]  300 	ldw x,acc24
      00836E 7B 01            [ 1]  301 	ld a,(U8,SP) ; divisor
      008370 62               [ 2]  302 	div x,a ; UU:MM/U8
      008371 88               [ 1]  303 	push a  ;save remainder
      008372 CF 00 0D         [ 2]  304     ldw acc24,x ; quotient 
      008375 84               [ 1]  305 	pop a
      008376 95               [ 1]  306 	ld xh,a
      008377 C6 00 0F         [ 1]  307 	ld a,acc8
      00837A 97               [ 1]  308 	ld xl,a
      00837B 7B 01            [ 1]  309 	ld a,(U8,sp) ; divisor
      00837D 62               [ 2]  310 	div x,a  ; R:LL/U8
      00837E 6B 01            [ 1]  311 	ld (U8,sp),a ; save remainder
      008380 9F               [ 1]  312 	ld a,xl
      008381 C7 00 0F         [ 1]  313 	ld acc8,a
      008384 84               [ 1]  314 	pop a
      008385 85               [ 2]  315 	popw x
      008386 81               [ 4]  316 	ret
                                    317 
                                    318 
                                    319 ;-------------------------------
                                    320 ; div24 N/T   
                                    321 ; divide 24 bits integers
                                    322 ;  i1 i2 -- i1/i2 
                                    323 ;  output:
                                    324 ;    T     quotient 
                                    325 ;    A:X   remainder 
                                    326 ;------------------------------
                           000001   327     DIVISOR=1
                           000004   328     CNTR=4
                           000005   329     QSIGN=5
                           000006   330     RSIGN=6 
                           000006   331     VSIZE=6 
      008387                        332 div24:
      000307                        333     _vars VSIZE 
      008387 52 06            [ 2]    1     sub sp,#VSIZE 
      008389 0F 06            [ 1]  334     clr (RSIGN,sp)
      00838B 0F 05            [ 1]  335     clr (QSIGN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      00030D                        336     _xpop 
      00838D 90 F6            [ 1]    1     ld a,(y)
      00838F 93               [ 1]    2     ldw x,y 
      008390 EE 01            [ 2]    3     ldw x,(1,x)
      008392 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      008396 4D               [ 1]  337     tnz a 
      008397 2A 05            [ 1]  338     jrpl 0$ 
      008399 03 05            [ 1]  339     cpl (QSIGN,sp)
      00839B CD 82 95         [ 4]  340     call neg_ax
      00839E                        341 0$:
      00839E 6B 01            [ 1]  342     ld  (DIVISOR,sp),a
      0083A0 1F 02            [ 2]  343     ldw (DIVISOR+1,sp),x
      0083A2 1A 02            [ 1]  344     or a,(DIVISOR+1,sp)
      0083A4 1A 03            [ 1]  345     or a,(DIVISOR+2,sp)
      0083A6 26 05            [ 1]  346     jrne 1$ 
      0083A8 A6 04            [ 1]  347     ld a,#ERR_DIV0 
      0083AA CC 94 3F         [ 2]  348     jp tb_error 
      0083AD                        349 1$: ; dividend  
      00032D                        350     _at_top
      0083AD 90 F6            [ 1]    1     ld a,(y)
      0083AF 93               [ 1]    2     ldw x,y 
      0083B0 EE 01            [ 2]    3     ldw x,(1,x)
      0083B2 4D               [ 1]  351     tnz a 
      0083B3 2A 07            [ 1]  352     jrpl 2$
      0083B5 CD 82 95         [ 4]  353     call neg_ax
      0083B8 03 05            [ 1]  354     cpl (QSIGN,sp)
      0083BA 03 06            [ 1]  355     cpl (RSIGN,sp)
      0083BC                        356 2$: 
                                    357 ;    ld acc24,a 
                                    358 ;    ldw acc16,x 
      00033C                        359     _store_top 
      0083BC 90 F7            [ 1]    1     ld (y),a 
      0083BE 90 EF 01         [ 2]    2     ldw (1,y),x     
      0083C1 A6 18            [ 1]  360     ld a,#24 
      0083C3 6B 04            [ 1]  361     ld (CNTR,sp),a
      0083C5 7B 01            [ 1]  362     ld a,(DIVISOR,sp)
      0083C7 1E 02            [ 2]  363     ldw x,(DIVISOR+1,sp)
                                    364 ; dividend >= divisor ? 
      0083C9 CD 82 6A         [ 4]  365     call cp24_ax ; A:X-acc24 ?
      0083CC 23 14            [ 2]  366     jrule 22$ 
                                    367 ; quotient=0, remainder=divisor      
      0083CE C6 00 0D         [ 1]  368     ld a,acc24 
      0083D1 CE 00 0E         [ 2]  369     ldw x,acc16 
      0083D4 72 5F 00 0D      [ 1]  370     clr acc24 
      0083D8 72 5F 00 0E      [ 1]  371     clr acc16 
      0083DC 72 5F 00 0F      [ 1]  372     clr acc8 
      0083E0 20 26            [ 2]  373     jra 6$
      0083E2                        374 22$:     
      0083E2 4F               [ 1]  375     clr a 
      0083E3 5F               [ 1]  376     clrw x 
      0083E4 98               [ 1]  377     rcf  
      0083E5                        378 3$: ; shift carry in acc24 bit 0 
      0083E5 90 69 02         [ 1]  379     rlc (2,y) 
      0083E8 90 69 01         [ 1]  380     rlc (1,y)
      0083EB 90 79            [ 1]  381     rlc (Y) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      0083ED 59               [ 2]  382     rlcw x  
      0083EE 49               [ 1]  383     rlc a
      0083EF 72 F0 02         [ 2]  384 4$: subw x,(DIVISOR+1,sp) 
      0083F2 12 01            [ 1]  385     sbc a,(DIVISOR,sp)
      0083F4 24 05            [ 1]  386     jrnc 5$
      0083F6 72 FB 02         [ 2]  387     addw x,(DIVISOR+1,sp)
      0083F9 19 01            [ 1]  388     adc a,(DIVISOR,sp)
      0083FB                        389 5$: ; shift carry in QUOTIENT 
      0083FB 8C               [ 1]  390     ccf
      0083FC 0A 04            [ 1]  391     dec (CNTR,sp)
      0083FE 26 E5            [ 1]  392     jrne 3$ 
                                    393 ; shift quotient last bit     
      008400 90 69 02         [ 1]  394     rlc (2,y)
      008403 90 69 01         [ 1]  395     rlc (1,y) 
      008406 90 79            [ 1]  396     rlc (y) 
      008408                        397 6$:    
      008408 6B 01            [ 1]  398     ld (DIVISOR,sp),a 
      00840A 1F 02            [ 2]  399     ldw (DIVISOR+1,sp),x 
      00840C 0D 05            [ 1]  400     tnz (QSIGN,sp)
      00840E 27 03            [ 1]  401     jreq 8$
      008410 CD 82 83         [ 4]  402     call neg24
      008413                        403 8$: 
      008413 7B 01            [ 1]  404     ld a,(DIVISOR,sp)
      008415 1E 02            [ 2]  405     ldw x,(DIVSOR+1,sp)
      008417                        406 81$:
      008417 0D 06            [ 1]  407     tnz (RSIGN,sp)
      008419 27 03            [ 1]  408     jreq 9$
      00841B CD 82 95         [ 4]  409     call neg_ax       
      00039E                        410 9$: _drop VSIZE 
      00841E 5B 06            [ 2]    1     addw sp,#VSIZE 
      008420 81               [ 4]  411     ret 
                                    412 
                                    413 
                                    414 ;-------------------------------
                                    415 ; mod24 A:X % acc24 
                                    416 ; remainder 24 bits integers 
                                    417 ; input:
                                    418 ;    acc24   dividend 
                                    419 ;    A:X     divisor 
                                    420 ; output:
                                    421 ;    acc24   acc24 % A:X 
                                    422 ;------------------------------
      008421                        423 mod24:
      008421 CD 83 87         [ 4]  424     call div24 
      0003A4                        425     _store_top  ; replace quotient by remainder 
      008424 90 F7            [ 1]    1     ld (y),a 
      008426 90 EF 01         [ 2]    2     ldw (1,y),x     
      008429 81               [ 4]  426     ret 
                                    427 
                                    428 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
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
                                     19 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     20 ;;  debug support
                                     21 ;;  set DEBUG=1 in config.inc 
                                     22 ;;  to enable it.
                                     23 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     24 
                                     25 	.macro _dbg_prt_regs
                                     26 	.if DEBUG 
                                     27 		call print_registers  
                                     28 	.endif 
                                     29 	.endm 
                                     30 
                                     31 	.macro _dbg_cmd_itf 
                                     32 	.if DEBUG 
                                     33 		call cmd_itf 
                                     34 	.endif 
                                     35 	.endm 
                                     36 
                           000000    37 .if DEBUG 
                                     38 
                                     39     .area CODE
                                     40 
                                     41 ;--------------------
                                     42 ; print content at address in hex.
                                     43 ; input:
                                     44 ;   X 	address to peek 
                                     45 ; output:
                                     46 ;	none 
                                     47 ;--------------------	
                                     48 prt_peek::
                                     49 	pushw x 
                                     50 	mov base,#16 
                                     51 	call prt_i16  
                                     52 	ld a,#': 
                                     53 	call putc 
                                     54 	ld a,#SPACE 
                                     55 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                     56 	popw x 
                                     57 	ld a,(x)
                                     58 	clrw x 
                                     59 	ld xl,a 
                                     60 	mov base,#10 
                                     61 	call prt_i16 
                                     62 	ret 
                                     63 
                                     64 ;----------------------------------------
                                     65 ;   DEBUG support functions
                                     66 ;----------------------------------------
                                     67 
                                     68 ; turn LED on 
                                     69 ledon:
                                     70     bset PC_ODR,#LED2_BIT
                                     71     ret 
                                     72 
                                     73 ; turn LED off 
                                     74 ledoff:
                                     75     bres PC_ODR,#LED2_BIT 
                                     76     ret 
                                     77 
                                     78 ; invert LED status 
                                     79 ledtoggle:
                                     80     ld a,#LED2_MASK
                                     81     xor a,PC_ODR
                                     82     ld PC_ODR,a
                                     83     ret 
                                     84 
                                     85 left_paren:
                                     86 	ld a,#SPACE 
                                     87 	call putc
                                     88 	ld a,#'( 
                                     89 	call putc 	
                                     90 	ret 
                                     91 
                                     92 ;------------------------------
                                     93 ; print 8 bit register 
                                     94 ; input:
                                     95 ;   X  point to register name 
                                     96 ;   A  register value to print 
                                     97 ; output:
                                     98 ;   none
                                     99 ;------------------------------- 
                                    100 prt_reg8:
                                    101 	push a 
                                    102 	call puts 
                                    103 	ld a,(1,sp) 
                                    104 	clrw x 
                                    105 	ld xl,a 
                                    106 	mov base,#16
                                    107 	call prt_i16  
                                    108 	call left_paren 
                                    109 	pop a 
                                    110 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                    111 	ld xl,a 
                                    112 	mov base,#10 
                                    113 	call prt_i16  
                                    114 	ld a,#') 
                                    115 	call putc
                                    116 	ret
                                    117 
                                    118 ;--------------------------------
                                    119 ; print 16 bits register 
                                    120 ; input:
                                    121 ;   X   point register name 
                                    122 ;   Y   register value to print 
                                    123 ; output:
                                    124 ;  none
                                    125 ;--------------------------------
                                    126 prt_reg16: 
                                    127 	pushw y 
                                    128 	call puts 
                                    129 	ldw x,(1,sp) 
                                    130 	mov base,#16 
                                    131 	call prt_i16  
                                    132 	call left_paren 
                                    133 	popw x 
                                    134 	mov base,#10 
                                    135 	call prt_i16  
                                    136 	ld a,#') 
                                    137 	call putc
                                    138 	ret 
                                    139 
                                    140 ;------------------------------------
                                    141 ; print registers contents saved on
                                    142 ; stack by trap interrupt.
                                    143 ;------------------------------------
                                    144 	R_PC=10 
                                    145 	R_CC=9
                                    146 	SAV_ACC24=8
                                    147 	SAV_ACC16=6
                                    148 	R_Y=4
                                    149 	R_X=2
                                    150 	R_A=1
                                    151 	VSIZE=8 
                                    152 print_registers:
                                    153 	push cc 
                                    154 	_vars VSIZE 
                                    155 	ld (R_A,sp),a 
                                    156 	ldw (R_X,sp),x 
                                    157 	ldw (R_Y,sp),y
                                    158 	ld a,acc24 
                                    159 	ldw x,acc16 
                                    160 	ld (SAV_ACC24,sp),a 
                                    161 	ldw (SAV_ACC16,sp),x 
                                    162 	ldw x,#STATES
                                    163 	call puts
                                    164 ; print PC 
                                    165 	ldw x, #REG_PC
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                    166 	ldw y, (R_PC,sp)
                                    167 	subw y,#3
                                    168 	call prt_reg16 
                                    169 ; print x
                                    170 	ldw x,#REG_X
                                    171 	ldw y,(R_X,sp)
                                    172 	call prt_reg16  
                                    173 ; print Y 
                                    174 	ldw x,#REG_Y
                                    175 	ldw y, (R_Y,sp)
                                    176 	call prt_reg16  
                                    177 ; print A 
                                    178 	ldw x,#REG_A
                                    179 	ld a, (R_A,sp) 
                                    180 	call prt_reg8
                                    181 ; print CC 
                                    182 	ldw x,#REG_CC 
                                    183 	ld a, (R_CC,sp) 
                                    184 	call prt_reg8 
                                    185 ; print SP 
                                    186 	ldw x,#REG_SP
                                    187 	ldw y,sp 
                                    188 	addw y,#(VSIZE+3)
                                    189 	call prt_reg16  
                                    190 	ld a,#'\n' 
                                    191 	call putc
                                    192 	ld a,(SAV_ACC24,sp)
                                    193 	ldw x,(SAV_ACC16,sp)
                                    194 	ld acc24,a 
                                    195 	ldw acc16,x 
                                    196 	ld a,(R_A,sp)
                                    197 	ldw x,(R_X,sp)
                                    198 	ldw y,(R_Y,sp)
                                    199 	_drop VSIZE
                                    200 	pop cc   	
                                    201 	ret
                                    202 
                                    203 STATES:  .asciz "\nRegisters state at break point.\n--------------------------\n"
                                    204 REG_PC: .asciz "PC:"
                                    205 REG_Y:   .asciz "\nY:" 
                                    206 REG_X:   .asciz "\nX:"
                                    207 REG_A:   .asciz "\nA:" 
                                    208 REG_CC:  .asciz "\nCC:"
                                    209 REG_SP:  .asciz "\nSP:"
                                    210 
                                    211 ;----------------------
                                    212 ; input:
                                    213 ;	Y    *input buffer 
                                    214 ; output:
                                    215 ;   acc24  integer 
                                    216 ;----------------------
                                    217 parse_addr:
                                    218 	ld a,#SPACE 
                                    219 	call skip  	 
                                    220 	addw y,in.w 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                    221 	ldw x,#pad 
                                    222 	call strcpy
                                    223 	ldw x,#pad
                                    224 	call atoi24 	
                                    225 	ret 
                                    226 
                                    227 ;----------------------------
                                    228 ; command interface
                                    229 ; only 3 commands:
                                    230 ;  'q' to resume application
                                    231 ;  'p [addr]' to print memory values 
                                    232 ;  's addr' to print string 
                                    233 ;----------------------------
                                    234 ;local variable
                                    235 	PSIZE=11
                                    236 	SAV_COUNT=10
                                    237 	SAV_IN=9
                                    238 	SAV_ACC24=8
                                    239 	SAV_ACC16=6
                                    240 	R_Y=4
                                    241 	R_X=2
                                    242 	R_A=1
                                    243 	VSIZE=11
                                    244 cmd_itf:
                                    245 	push cc 
                                    246 	_vars VSIZE
                                    247 	ld (R_A,sp),a
                                    248 	ld a,count 
                                    249 	ld (SAV_COUNT,sp),a 
                                    250 	ld a,in 
                                    251 	ld (SAV_IN,sp),a  
                                    252 	ldw (R_X,sp),x 
                                    253 	ldw (R_Y,sp),y
                                    254 	ld a,acc24 
                                    255 	ldw x,acc16 
                                    256 	ld (SAV_ACC24,sp),a 
                                    257 	ldw (SAV_ACC16,sp),x 
                                    258 	clr farptr 
                                    259 	clr farptr+1 
                                    260 	clr farptr+2  
                                    261 repl:
                                    262 	ld a,#CR 
                                    263 	call putc 
                                    264 	ld a,#'? 
                                    265 	call putc
                                    266 	clr in.w 
                                    267 	clr in 
                                    268 	call readln
                                    269 	ldw y,#tib  
                                    270 	ld a,(y)
                                    271 	jreq repl  
                                    272 	inc in 
                                    273 	call to_upper 
                                    274 	cp a,#'Q 
                                    275 	jrne test_p
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                    276 repl_exit:
                                    277 ; restore original context 
                                    278 	ld a,(SAV_ACC24,sp)
                                    279 	ldw x,(SAV_ACC16,sp)
                                    280 	ld acc24,a 
                                    281 	ldw acc16,x
                                    282 	ld a,(SAV_COUNT,sp)
                                    283 	ld count,a 
                                    284 	ld a,(SAV_IN,sp)
                                    285 	ld in,a 
                                    286 	ldw y,(R_Y,sp)
                                    287 	ldw x,(R_X,sp)
                                    288 	ld a,(R_A,sp)
                                    289 	_drop VSIZE
                                    290 	pop cc 
                                    291 	ret  
                                    292 invalid:
                                    293 	ldw x,#invalid_cmd 
                                    294 	call puts 
                                    295 	jra repl 
                                    296 test_p:	
                                    297     cp a,#'P 
                                    298 	jreq mem_peek
                                    299     cp a,#'S 
                                    300 	jrne invalid 
                                    301 print_string:
                                    302 	call parse_addr 	
                                    303 	ldw x,acc16
                                    304 	call puts
                                    305 	jp repl 	
                                    306 mem_peek:
                                    307 	call parse_addr 
                                    308 	ld a, acc24 
                                    309 	or a,acc16 
                                    310 	or a,acc8 
                                    311 	jrne 1$ 
                                    312 	jra peek_byte  
                                    313 1$:	ldw x,acc24 
                                    314 	ldw farptr,x 
                                    315 	ld a,acc8 
                                    316 	ld farptr+2,a 
                                    317 peek_byte:
                                    318 	call print_farptr 
                                    319 	ld a,#8 
                                    320 	ld (PSIZE,sp),a 
                                    321 	clrw x 
                                    322 1$:	call fetchc  
                                    323 	pushw x 
                                    324 	ld acc8,a 
                                    325 	clrw x 
                                    326 	ldw acc24,x 
                                    327 	ld a,#16+128
                                    328 	call prt_acc24
                                    329 	popw x 
                                    330 	dec (PSIZE,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                    331 	jrne 1$ 
                                    332 	ld a,#8 
                                    333 	add a,farptr+2 
                                    334 	ld farptr+2,a
                                    335 	clr a 
                                    336 	adc a,farptr+1 
                                    337 	ld farptr+1,a 
                                    338 	clr a 
                                    339 	adc a,farptr 
                                    340 	ld farptr,a 
                                    341 	jp repl  
                                    342 
                                    343 invalid_cmd: .asciz "not a command\n" 
                                    344 
                                    345 ;----------------------------
                                    346 ; display farptr address
                                    347 ;----------------------------
                                    348 print_farptr:
                                    349 	ld a ,farptr+2 
                                    350 	ld acc8,a 
                                    351 	ldw x,farptr 
                                    352 	ldw acc24,x 
                                    353 	clrw x 
                                    354 	ld a,#16 
                                    355 	call prt_acc24
                                    356 	ld a,#SPACE 
                                    357 	call putc 
                                    358 	call putc 
                                    359 	ret
                                    360 
                                    361 ;------------------------------------
                                    362 ; get byte at address farptr[X]
                                    363 ; input:
                                    364 ;	 farptr   address to peek
                                    365 ;    X		  farptr index 	
                                    366 ; output:
                                    367 ;	 A 		  byte from memory  
                                    368 ;    x		  incremented by 1
                                    369 ;------------------------------------
                                    370 fetchc: ; @C
                                    371 	ldf a,([farptr],x)
                                    372 	incw x
                                    373 	ret
                                    374 
                                    375 
                                    376 ;------------------------------------
                                    377 ; expect a number from command line 
                                    378 ; next argument
                                    379 ;  input:
                                    380 ;	  none
                                    381 ;  output:
                                    382 ;    acc24   int24_t 
                                    383 ;------------------------------------
                                    384 number:
                                    385 	call get_token
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                    386 	cp a,#TK_INTGR
                                    387 	jreq 1$
                                    388 	jp syntax_error
                                    389 1$:	ret
                                    390 
                                    391 ;----------------------
                                    392 ; called by show_row 
                                    393 ; print character 
                                    394 ; corresponding to hex 
                                    395 ; in row
                                    396 ; characters stored in pad 
                                    397 ; input:
                                    398 ;    A count  
                                    399 ;------------------------
                                    400 print_chars:
                                    401 	push a 
                                    402 	ldw x,#pad 
                                    403 1$:	ld a,(x)
                                    404 	cp a,#SPACE 
                                    405 	jrult 2$
                                    406 	cp a,#127 
                                    407 	jruge 2$ 
                                    408 	jra 3$ 
                                    409 2$: ld a,#'_ 
                                    410 3$:	
                                    411 	call putc 
                                    412 	incw x 
                                    413 	dec (1,sp)
                                    414 	jrne 1$
                                    415 	pop a 
                                    416 	ret 
                                    417 
                                    418 
                                    419 ;---------------------
                                    420 ; display n bytes row 
                                    421 ; from memory.
                                    422 ; input:
                                    423 ;   A        bytes to print 
                                    424 ;	farptr   address 
                                    425 ; output:
                                    426 ;   farptr  address after last shown  
                                    427 ;---------------------
                                    428 	CNT=1
                                    429 	CNTDWN=2 
                                    430 	BYTE=3
                                    431 	VSIZE=3 
                                    432 show_row:
                                    433 	tnz a 
                                    434 	jrne 1$
                                    435 	ret 
                                    436 1$:	
                                    437 	_vars VSIZE 
                                    438 	ld (CNT,sp),a 
                                    439 	ld (CNTDWN,sp),a 
                                    440 	ld a,farptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                    441 	ldw x,ptr16 
                                    442 	ld acc24,a 
                                    443 	ldw acc16,x 
                                    444 	call itoa 
                                    445 	ld a,#7 
                                    446 	call right_align
                                    447 	call puts 
                                    448 	ld a,#9 
                                    449 	call putc 
                                    450 row_loop:
                                    451 	ldf a,[farptr]
                                    452 	ld (BYTE,sp),a
                                    453 	ld a,(CNT,sp)
                                    454 	sub a,(CNTDWN,sp)
                                    455 	clrw x 
                                    456 	ld xl,a 
                                    457 	addw x,#pad 
                                    458 	ld a,(BYTE,sp)
                                    459 	ld (x),a 
                                    460 	clr acc24 
                                    461 	clr acc16 
                                    462 	ld acc8,a 
                                    463 	call itoa 
                                    464 	ld a,#4
                                    465 	call right_align 
                                    466 	call puts 
                                    467 	ldw x,#1 	
                                    468 	call incr_farptr
                                    469 	dec (CNTDWN,sp)
                                    470 	jrne row_loop
                                    471 	ld a,#SPACE 
                                    472 	call putc
                                    473 	ld a,(CNT,sp) 
                                    474 	call print_chars 
                                    475 	ld a,#CR 
                                    476 	call putc 
                                    477 	_drop VSIZE   
                                    478 	ret 
                                    479 
                                    480 ;--------------------------
                                    481 ; print memory content 
                                    482 ; in hexadecimal format
                                    483 ;  input:
                                    484 ;    farptr  start address 
                                    485 ;    X       count bytes to print 
                                    486 ;--------------------------
                                    487 	BCNT=1
                                    488 	BASE=3
                                    489 	VSIZE=3   
                                    490 hex_dump:
                                    491 	push a 
                                    492 	_vars VSIZE
                                    493 	ld a,base
                                    494 	ld (BASE,sp),a 
                                    495 	mov base,#16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                    496 	ld a,#CR 
                                    497 	call putc 
                                    498 1$: ldw (BCNT,sp),x
                                    499 	ld a,#16
                                    500 	cpw x,#16
                                    501 	jrpl 2$
                                    502 	ld a,xl
                                    503 2$: 	
                                    504 	call show_row 
                                    505 	ldw x,(BCNT,sp) 
                                    506 	subw x,#16 
                                    507 	cpw x,#1
                                    508 	jrpl 1$
                                    509 	ld a,(BASE,sp)
                                    510 	ld base,a
                                    511 	_drop VSIZE
                                    512 	pop a 
                                    513 	ret 
                                    514 
                                    515 .endif ; DEBUG 
                                    516 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                     27     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000000     5 DEBUG=0 ; set to 1 to include debugging code 
                                      6 
                           000000     7 SEPARATE=0 ; set to 1 for 'make separate' 
                                      8 
                                      9 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
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
      00842A                         45 unlock_eeprom:
      00842A 72 06 50 5F 15   [ 2]   46 	btjt FLASH_IAPSR,#FLASH_IAPSR_DUL,9$
      00842F 35 00 50 5B      [ 1]   47 	mov FLASH_CR2,#0 
      008433 35 FF 50 5C      [ 1]   48 	mov FLASH_NCR2,#0xFF 
      008437 35 AE 50 64      [ 1]   49 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      00843B 35 56 50 64      [ 1]   50     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00843F 72 07 50 5F FB   [ 2]   51 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008444 81               [ 4]   52 9$:	ret
                                     53 
                                     54 ;----------------------------------
                                     55 ; unlock FLASH for writing/erasing
                                     56 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                     57 ; input:
                                     58 ;  none
                                     59 ; output:
                                     60 ;  none
                                     61 ;----------------------------------
      008445                         62 unlock_flash:
      008445 72 02 50 5F 15   [ 2]   63 	btjt FLASH_IAPSR,#FLASH_IAPSR_PUL,9$
      00844A 35 00 50 5B      [ 1]   64 	mov FLASH_CR2,#0 
      00844E 35 FF 50 5C      [ 1]   65 	mov FLASH_NCR2,#0xFF 
      008452 35 56 50 62      [ 1]   66 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008456 35 AE 50 62      [ 1]   67 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      00845A 72 03 50 5F FB   [ 2]   68 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      00845F 81               [ 4]   69 9$:	ret
                                     70 
                                     71 ;----------------------------
                                     72 ; erase block code must be 
                                     73 ; executed from RAM
                                     74 ; input:
                                     75 ;-----------------------------
      008460                         76 row_erase:
      008460 88               [ 1]   77 	push a 
      008461 90 89            [ 2]   78 	pushw y 
      008463 35 20 50 5B      [ 1]   79 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      008467 35 DF 50 5C      [ 1]   80 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      00846B 4F               [ 1]   81 	clr a 
      00846C 90 5F            [ 1]   82 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      00846E 91 A7 00 19      [ 1]   83 	ldf ([farptr],y),a
      008472 90 5C            [ 1]   84     incw y
      008474 91 A7 00 19      [ 1]   85 	ldf ([farptr],y),a
      008478 90 5C            [ 1]   86     incw y
      00847A 91 A7 00 19      [ 1]   87 	ldf ([farptr],y),a
      00847E 90 5C            [ 1]   88     incw y
      008480 91 A7 00 19      [ 1]   89 	ldf ([farptr],y),a
      008484 72 05 50 5F FB   [ 2]   90 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      008489 90 85            [ 2]   91 	popw y 
      00848B 84               [ 1]   92 	pop a 
      00848C 81               [ 4]   93 	ret
      00848D                         94 row_erase_end:
                                     95 
                                     96 ; copy erase_start in RAM 
      00848D                         97 move_erase_to_ram:
      00848D 89               [ 2]   98 	pushw x 
      00848E 90 89            [ 2]   99 	pushw y 
      008490 AE 84 8D         [ 2]  100 	ldw x,#row_erase_end 
      008493 1D 84 60         [ 2]  101 	subw x,#row_erase
      008496 CF 00 0E         [ 2]  102 	ldw acc16,x 
      008499 AE 16 68         [ 2]  103 	ldw x,#tib 
      00849C 90 AE 84 60      [ 2]  104 	ldw y,#row_erase 
      0084A0 CD 91 65         [ 4]  105 	call move
      0084A3 90 85            [ 2]  106 	popw y
      0084A5 85               [ 2]  107 	popw x
      0084A6 81               [ 4]  108 	ret 
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
      0084A7                        123 program_row:
      0084A7 88               [ 1]  124 	push a 
      0084A8 90 89            [ 2]  125 	pushw y 
      0084AA 4B 80            [ 1]  126 	push #BLOCK_SIZE  
                                    127 ;enable block programming 
      0084AC 72 10 50 5B      [ 1]  128 	bset FLASH_CR2,#FLASH_CR2_PRG 
      0084B0 72 11 50 5C      [ 1]  129 	bres FLASH_NCR2,#FLASH_CR2_PRG
      0084B4 90 5F            [ 1]  130 	clrw y 
      0084B6 F6               [ 1]  131 1$:	ld a,(x)
      0084B7 91 A7 00 19      [ 1]  132 	ldf ([farptr],y),a
      0084BB 5C               [ 1]  133 	incw x 
      0084BC 90 5C            [ 1]  134 	incw y 
      0084BE 0A 01            [ 1]  135 	dec (BCNT,sp)
      0084C0 26 F4            [ 1]  136 	jrne 1$
                                    137 ; wait EOP bit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0084C2 72 05 50 5F FB   [ 2]  138 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      000447                        139 	_drop 1 
      0084C7 5B 01            [ 2]    1     addw sp,#1 
      0084C9 90 85            [ 2]  140 	popw y 
      0084CB 84               [ 1]  141 	pop a 
      0084CC 81               [ 4]  142 	ret 
      0084CD                        143 program_row_end:
                                    144 
                                    145 ;-------------------------
                                    146 ; move program_row to RAM 
                                    147 ; at txtubound address 
                                    148 ;------------------------
      0084CD                        149 move_prg_to_ram:
      0084CD 89               [ 2]  150 	pushw x 
      0084CE 90 89            [ 2]  151 	pushw y 
      0084D0 AE 84 CD         [ 2]  152 	ldw x,#program_row_end 
      0084D3 1D 84 A7         [ 2]  153 	subw x,#program_row 
      0084D6 CF 00 0E         [ 2]  154 	ldw acc16,x ; bytes to move 
      0084D9 AE 16 68         [ 2]  155 	ldw x,#tib ; destination address 
      0084DC 90 AE 84 A7      [ 2]  156 	ldw y,#program_row ; source address 
      0084E0 CD 91 65         [ 4]  157 	call move
      0084E3 90 85            [ 2]  158 	popw y 
      0084E5 85               [ 2]  159 	popw x  
      0084E6 81               [ 4]  160 	ret 
                                    161 
                                    162 
                                    163 ;-----------------------------
                                    164 ; write a buffer in FLASH/EEPROM 
                                    165 ; input:
                                    166 ;    farptr   destination address 
                                    167 ;    x        buffer address 
                                    168 ;-----------------------------
      0084E7                        169 write_buffer:
      0084E7 89               [ 2]  170 	pushw x 
      0084E8 72 5D 00 19      [ 1]  171 	tnz farptr 
      0084EC 26 0D            [ 1]  172 	jrne to_flash 
      0084EE CE 00 1A         [ 2]  173 	ldw x,farptr+1 
      0084F1 A3 B4 80         [ 2]  174 	cpw x,#app_space  
      0084F4 24 05            [ 1]  175 	jruge to_flash 
      0084F6                        176 to_eeprom:
      0084F6 CD 84 2A         [ 4]  177 	call unlock_eeprom
      0084F9 20 03            [ 2]  178 	jra do_programming
      0084FB                        179 to_flash:
      0084FB CD 84 45         [ 4]  180 	call unlock_flash
      0084FE                        181 do_programming:
      0084FE 85               [ 2]  182 	popw x 
      0084FF CD 16 68         [ 4]  183 	call tib
      008502 72 13 50 5F      [ 1]  184 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      008506 72 17 50 5F      [ 1]  185 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      00850A 81               [ 4]  186 	ret 
                                    187 
                                    188 
                                    189 ;-----------------------------------
                                    190 ; erase flash or EEPROM block
                                    191 ; a block is 128 bytes 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                                    192 ; input:
                                    193 ;   farptr  address row begin
                                    194 ; output:
                                    195 ;   none
                                    196 ;--------------------------------------
      00850B                        197 block_erase:
      00850B 89               [ 2]  198 	pushw x 
      00850C C6 00 19         [ 1]  199 	ld a,farptr 
      00850F 26 14            [ 1]  200 	jrne erase_flash
      008511 CE 00 1A         [ 2]  201 	ldw x,farptr+1
      008514 A3 B4 80         [ 2]  202 	cpw x,#app_space 
      008517 24 0C            [ 1]  203 	jruge erase_flash 
                                    204 ; erase eeprom block
      008519 CD 84 2A         [ 4]  205 	call unlock_eeprom 
      00851C CD 16 68         [ 4]  206 	call tib 
      00851F 72 17 50 5F      [ 1]  207 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      008523 20 0A            [ 2]  208 	jra erase_exit  
                                    209 ; erase flash block:
      008525                        210 erase_flash:
      008525 CD 84 45         [ 4]  211 	call unlock_flash 
      008528 CD 16 68         [ 4]  212 	call tib 
      00852B 72 13 50 5F      [ 1]  213     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00852F                        214 erase_exit: 
      00852F 85               [ 2]  215 	popw x 
      008530 81               [ 4]  216 	ret 
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
      008531                        232 write_byte:
      008531 90 89            [ 2]  233 	pushw y
      0004B3                        234 	_vars VSIZE
      008533 52 02            [ 2]    1     sub sp,#VSIZE 
      008535 6B 01            [ 1]  235 	ld (BTW,sp),a ; byte to write 
      008537 0F 02            [ 1]  236 	clr (OPT,sp)  ; OPTION flag
                                    237 ; put addr[15:0] in Y, for bounds check.
      008539 90 CE 00 1A      [ 2]  238 	ldw y,farptr+1   ; Y=addr15:0
                                    239 ; check addr[23:16], if <> 0 then it is extened flash memory
      00853D 72 5D 00 19      [ 1]  240 	tnz farptr 
      008541 26 14            [ 1]  241 	jrne write_flash
      008543 90 A3 B4 80      [ 2]  242     cpw y,#app_space 	 
      008547 24 0E            [ 1]  243     jruge write_flash
      008549 90 A3 40 00      [ 2]  244 	cpw y,#EEPROM_BASE  
      00854D 25 57            [ 1]  245     jrult write_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      00854F 90 A3 48 7F      [ 2]  246 	cpw y,#OPTION_END 
      008553 22 51            [ 1]  247 	jrugt write_exit
      008555 20 16            [ 2]  248 	jra write_eeprom 
                                    249 ; write program memory
      008557                        250 write_flash:
      008557 CD 84 45         [ 4]  251 	call unlock_flash 
      00855A 9B               [ 1]  252 1$:	sim 
      00855B 7B 01            [ 1]  253 	ld a,(BTW,sp)
      00855D 92 A7 00 19      [ 4]  254 	ldf ([farptr],x),a ; farptr[x]=A
      008561 72 05 50 5F FB   [ 2]  255 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008566 9A               [ 1]  256     rim 
      008567 72 13 50 5F      [ 1]  257     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00856B 20 39            [ 2]  258     jra write_exit
                                    259 ; write eeprom and option
      00856D                        260 write_eeprom:
      00856D CD 84 2A         [ 4]  261 	call unlock_eeprom
                                    262 	; check for data eeprom or option eeprom
      008570 90 A3 48 00      [ 2]  263 	cpw y,#OPTION_BASE
      008574 2B 08            [ 1]  264 	jrmi 1$
      008576 90 A3 48 80      [ 2]  265 	cpw y,#OPTION_END+1
      00857A 2A 02            [ 1]  266 	jrpl 1$
      00857C 03 02            [ 1]  267 	cpl (OPT,sp)
      00857E                        268 1$: 
      00857E 0D 02            [ 1]  269     tnz (OPT,sp)
      008580 27 08            [ 1]  270     jreq 2$
                                    271 	; pour modifier une option il faut modifier ces 2 bits
      008582 72 1E 50 5B      [ 1]  272     bset FLASH_CR2,#FLASH_CR2_OPT
      008586 72 1F 50 5C      [ 1]  273     bres FLASH_NCR2,#FLASH_CR2_OPT 
      00858A                        274 2$: 
      00858A 7B 01            [ 1]  275     ld a,(BTW,sp)
      00858C 92 A7 00 19      [ 4]  276     ldf ([farptr],x),a
      008590 0D 02            [ 1]  277     tnz (OPT,sp)
      008592 27 08            [ 1]  278     jreq 3$
      008594 5C               [ 1]  279     incw x
      008595 7B 01            [ 1]  280     ld a,(BTW,sp)
      008597 43               [ 1]  281     cpl a
      008598 92 A7 00 19      [ 4]  282     ldf ([farptr],x),a
      00859C 72 05 50 5F FB   [ 2]  283 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0085A1 72 0D 50 5F FB   [ 2]  284 	btjf FLASH_IAPSR,#FLASH_IAPSR_HVOFF,.
      0085A6                        285 write_exit:
      0085A6 5C               [ 1]  286 	incw x 
      0085A7 CD 86 06         [ 4]  287 	call incr_farptr
      0085AA 5F               [ 1]  288 	clrw x 
      00052B                        289 	_drop VSIZE 
      0085AB 5B 02            [ 2]    1     addw sp,#VSIZE 
      0085AD 90 85            [ 2]  290 	popw y
      0085AF 81               [ 4]  291     ret
                                    292 
                                    293 ;--------------------------------------------
                                    294 ; write a data block to eeprom or flash 
                                    295 ; the block must be erased before 
                                    296 ; using this routine.
                                    297 ; input:
                                    298 ;   Y        source address   
                                    299 ;   X        array index  destination  farptr[x]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                                    300 ;   BSIZE    block size bytes 
                                    301 ;   farptr   write address , byte* 
                                    302 ; output:
                                    303 ;	X 		after last byte written 
                                    304 ;   Y 		after last byte read 
                                    305 ;  farptr   point after block
                                    306 ;---------------------------------------------
      0085B0                        307 	_argofs 3 
                           000005     1     ARG_OFS=2+3 
      000530                        308 	_arg BSIZE 1  ; block size
                           000006     1     BSIZE=ARG_OFS+1 
                                    309 	; local var 
                           000001   310 	XSAVE=1 
                           000002   311 	VSIZE=2 
      000530                        312 write_block::
      0085B0 88               [ 1]  313 	push a 
      000531                        314 	_vars VSIZE
      0085B1 52 02            [ 2]    1     sub sp,#VSIZE 
      0085B3 1F 01            [ 2]  315 	ldw (XSAVE,sp),x 
      0085B5 1E 06            [ 2]  316 	ldw x,(BSIZE,sp) 
      0085B7 27 13            [ 1]  317 	jreq 9$
      0085B9 1E 01            [ 2]  318 1$:	ldw x,(XSAVE,sp)
      0085BB 90 F6            [ 1]  319 	ld a,(y)
      0085BD CD 85 31         [ 4]  320 	call write_byte 
      0085C0 5C               [ 1]  321 	incw x 
      0085C1 90 5C            [ 1]  322 	incw y 
      0085C3 1F 01            [ 2]  323 	ldw (XSAVE,sp),x
      0085C5 1E 06            [ 2]  324 	ldw x,(BSIZE,sp)
      0085C7 5A               [ 2]  325 	decw x
      0085C8 1F 06            [ 2]  326 	ldw (BSIZE,sp),x 
      0085CA 26 ED            [ 1]  327 	jrne 1$
      0085CC                        328 9$:
      0085CC 1E 01            [ 2]  329 	ldw x,(XSAVE,sp)
      0085CE CD 86 06         [ 4]  330 	call incr_farptr
      000551                        331 	_drop VSIZE
      0085D1 5B 02            [ 2]    1     addw sp,#VSIZE 
      0085D3 84               [ 1]  332 	pop a 
      0085D4 81               [ 4]  333 	ret 
                                    334 
                                    335 
                                    336 ;------------------------------------
                                    337 ; write n bytes to flash | eeprom 
                                    338 ; if the number of bytes is 
                                    339 ; >=128 it is faster to 
                                    340 ; use write_block
                                    341 ; the bytes are written one by 
                                    342 ; one and auto erased if required. 
                                    343 ; input:
                                    344 ;    farptr    dest address 
                                    345 ;    X         src address 
                                    346 ;    A         count 
                                    347 ; output:
                                    348 ;    none   
                                    349 ;----------------------------------
      0085D5                        350 write_nbytes:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0085D5 90 89            [ 2]  351 	pushw y
      0085D7 88               [ 1]  352 	push a 
      0085D8 90 93            [ 1]  353 	ldw y,x
      0085DA 5F               [ 1]  354 	clrw x 
      0085DB                        355 1$:  
      0085DB 90 F6            [ 1]  356 	ld a,(y)
      0085DD 90 5C            [ 1]  357 	incw y
      0085DF CD 85 31         [ 4]  358 	call write_byte 
      0085E2 5C               [ 1]  359 	incw x 
      0085E3 0A 01            [ 1]  360 	dec (1,sp)  
      0085E5 26 F4            [ 1]  361 	jrne 1$ 
      0085E7 84               [ 1]  362 9$: pop a 
      0085E8 90 85            [ 2]  363 	popw y 
      0085EA 81               [ 4]  364 	ret 
                                    365 
                                    366 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    367 ;;;  flash memory operations
                                    368 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    369 
                                    370 ;--------------------------
                                    371 ; align farptr to BLOCK_SIZE 
                                    372 ;---------------------------
      0085EB                        373 row_align:
      0085EB A6 7F            [ 1]  374 	ld a,#0x7f 
      0085ED C4 00 1B         [ 1]  375 	and a,farptr+2 
      0085F0 27 13            [ 1]  376 	jreq 1$ 
      0085F2 CE 00 1A         [ 2]  377 	ldw x,farptr+1 
      0085F5 1C 00 80         [ 2]  378 	addw x,#BLOCK_SIZE 
      0085F8 24 04            [ 1]  379 	jrnc 0$
      0085FA 72 5C 00 19      [ 1]  380 	inc farptr 
      0085FE 9F               [ 1]  381 0$: ld a,xl 
      0085FF A4 80            [ 1]  382 	and a,#0x80
      008601 97               [ 1]  383 	ld xl,a
      008602 CF 00 1A         [ 2]  384 	ldw farptr+1,x  	
      008605 81               [ 4]  385 1$:	ret
                                    386 
                                    387 ;--------------------
                                    388 ; input:
                                    389 ;   X     increment 
                                    390 ; output:
                                    391 ;   farptr  incremented 
                                    392 ;---------------------
      008606                        393 incr_farptr:
      008606 72 BB 00 1A      [ 2]  394 	addw x,farptr+1 
      00860A 24 04            [ 1]  395 	jrnc 1$
      00860C 72 5C 00 19      [ 1]  396 	inc farptr 
      008610 CF 00 1A         [ 2]  397 1$:	ldw farptr+1,x  
      008613 81               [ 4]  398 	ret 
                                    399 
                                    400 ;-----------------------------------
                                    401 ; scan block for non zero byte 
                                    402 ; block are 128 bytes 
                                    403 ; input:
                                    404 ;    farptr     address block  
                                    405 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                    406 ;     A     0 cleared, other not cleared  
                                    407 ;-----------------------------------
      008614                        408 scan_block:
      008614 5F               [ 1]  409 	clrw x 
      008615 92 AF 00 19      [ 5]  410 1$: ldf a,([farptr],x) 
      008619 26 06            [ 1]  411 	jrne 2$
      00861B 5C               [ 1]  412 	incw x 
      00861C A3 00 80         [ 2]  413 	cpw x,#BLOCK_SIZE 
      00861F 25 F4            [ 1]  414 	jrult 1$ 
      008621 81               [ 4]  415 2$:	ret 
                                    416 
                                    417 
                                    418 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
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
                                     22 ; defined functions:
                                     23 ;   getc   wait for a character 
                                     24 ;   qgetc  check if char available 
                                     25 ;   putc   send a char to terminal
                                     26 ;   puts   print a string to terminal
                                     27 ;   readln  read text line from terminal 
                                     28 ;   spaces  print n spaces on terminal 
                                     29 ;   print_hex  print hex value from A 
                                     30 ;------------------------------
                                     31 
                                     32     .module TERMINAL
                                     33 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                     34     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000000     5 DEBUG=0 ; set to 1 to include debugging code 
                                      6 
                           000000     7 SEPARATE=0 ; set to 1 for 'make separate' 
                                      8 
                                      9 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                                     35 
                           000000    36 .if SEPARATE
                                     37 	.include "inc/nucleo_8s208.inc"
                                     38 	.include "inc/stm8s208.inc"
                                     39 	.include "inc/ascii.inc"
                                     40 	.include "inc/gen_macros.inc" 
                                     41 	.include "tbi_macros.inc" 
                                     42 .endif 
                                     43 
                                     44     .area CODE 
                                     45 
                                     46 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     47 ;;   UART1 subroutines
                                     48 ;;   used for user interface 
                                     49 ;;   communication channel.
                                     50 ;;   settings: 
                                     51 ;;		115200 8N1 no flow control
                                     52 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     53 
                                     54 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     55 ;;; Uart1 intterrupt handler 
                                     56 ;;; on receive character 
                                     57 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     58 ;--------------------------
                                     59 ; UART1 receive character
                                     60 ; in a FIFO buffer 
                                     61 ; CTRL+C (ASCII 3)
                                     62 ; cancel program execution
                                     63 ; and fall back to command line
                                     64 ; CTRL+X reboot system 
                                     65 ; CTLR+Z erase EEPROM autorun 
                                     66 ;        information and reboot
                                     67 ;--------------------------
      008622                         68 Uart1RxHandler: ; console receive char 
      008622 72 0B 52 30 31   [ 2]   69 	btjf UART1_SR,#UART_SR_RXNE,5$
      008627 C6 52 31         [ 1]   70 	ld a,UART1_DR 
      00862A A1 03            [ 1]   71 	cp a,#CTRL_C 
      00862C 26 06            [ 1]   72 	jrne 2$
      00862E CD 86 A5         [ 4]   73 	call putc 
      008631 CC 80 C9         [ 2]   74 	jp user_interrupted
      008634                         75 2$:
      008634 A1 18            [ 1]   76 	cp a,#CAN ; CTRL_X 
      008636 26 03            [ 1]   77 	jrne 3$
      008638 CC 81 35         [ 2]   78 	jp cold_start 	
      00863B A1 1A            [ 1]   79 3$:	cp a,#CTRL_Z 
      00863D 26 06            [ 1]   80 	jrne 4$
      00863F CD 86 59         [ 4]   81 	call clear_autorun
      008642 CC 81 35         [ 2]   82 	jp cold_start 
      008645                         83 4$:
      008645 88               [ 1]   84 	push a 
      008646 A6 26            [ 1]   85 	ld a,#rx1_queue 
      008648 CB 00 2F         [ 1]   86 	add a,rx1_tail 
      00864B 5F               [ 1]   87 	clrw x 
      00864C 97               [ 1]   88 	ld xl,a 
      00864D 84               [ 1]   89 	pop a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      00864E F7               [ 1]   90 	ld (x),a 
      00864F C6 00 2F         [ 1]   91 	ld a,rx1_tail 
      008652 4C               [ 1]   92 	inc a 
      008653 A4 07            [ 1]   93 	and a,#RX_QUEUE_SIZE-1
      008655 C7 00 2F         [ 1]   94 	ld rx1_tail,a 
      008658 80               [11]   95 5$:	iret 
                                     96 
      008659                         97 clear_autorun:
      008659 AE 40 00         [ 2]   98 	ldw x,#EEPROM_BASE 
      00865C CD A6 9B         [ 4]   99 	call erase_header ; in TinyBasic.asm 
      00865F 81               [ 4]  100 	ret 
                                    101 
                                    102 ;---------------------------------------------
                                    103 ; initialize UART1, 115200 8N1
                                    104 ; called from cold_start in hardware_init.asm 
                                    105 ; input:
                                    106 ;	none
                                    107 ; output:
                                    108 ;   none
                                    109 ;---------------------------------------------
      008660                        110 uart1_init:
      008660 72 1A 50 02      [ 1]  111     bset PA_DDR,#UART1_TX_PIN
      008664 72 1A 50 03      [ 1]  112     bset PA_CR1,#UART1_TX_PIN 
      008668 72 1A 50 04      [ 1]  113     bset PA_CR2,#UART1_TX_PIN 
                                    114 ; enable UART1 clock
      00866C 72 14 50 C7      [ 1]  115 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      008670                        116 uart1_set_baud: 
      008670 88               [ 1]  117 	push a 
                                    118 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    119 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008671 A6 E1            [ 1]  120 	ld a,#CLK_SWR_HSI
      008673 C1 50 C3         [ 1]  121 	cp a,CLK_CMSR 
      008676 27 0A            [ 1]  122 	jreq 2$ 
      008678                        123 1$: ; 8 Mhz 	
      008678 35 05 52 33      [ 1]  124 	mov UART1_BRR2,#0x05 ; must be loaded first
      00867C 35 04 52 32      [ 1]  125 	mov UART1_BRR1,#0x4
      008680 20 08            [ 2]  126 	jra 3$
      008682                        127 2$: ; 16 Mhz 	
      008682 35 0B 52 33      [ 1]  128 	mov UART1_BRR2,#0x0b ; must be loaded first
      008686 35 08 52 32      [ 1]  129 	mov UART1_BRR1,#0x08
      00868A                        130 3$:
      00868A 72 5F 52 31      [ 1]  131     clr UART1_DR
      00868E 35 2C 52 35      [ 1]  132 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008692 72 10 52 35      [ 1]  133 	bset UART1_CR2,#UART_CR2_SBK
      008696 72 0D 52 30 FB   [ 2]  134     btjf UART1_SR,#UART_SR_TC,.
      00869B 72 5F 00 2E      [ 1]  135     clr rx1_head 
      00869F 72 5F 00 2F      [ 1]  136 	clr rx1_tail
      0086A3 84               [ 1]  137 	pop a  
      0086A4 81               [ 4]  138 	ret
                                    139 
                                    140 ;---------------------------------
                                    141 ; uart1_putc
                                    142 ; send a character via UART1
                                    143 ; input:
                                    144 ;    A  	character to send
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                    145 ;---------------------------------
      0086A5                        146 putc:: ; console output always on UART1
      0086A5                        147 uart1_putc:: 
      0086A5 72 0F 52 30 FB   [ 2]  148 	btjf UART1_SR,#UART_SR_TXE,.
      0086AA C7 52 31         [ 1]  149 	ld UART1_DR,a 
      0086AD 81               [ 4]  150 	ret 
                                    151 
                                    152 
                                    153 ;---------------------------------
                                    154 ; Query for character in rx1_queue
                                    155 ; input:
                                    156 ;   none 
                                    157 ; output:
                                    158 ;   A     0 no charcter available
                                    159 ;   Z     1 no character available
                                    160 ;---------------------------------
      0086AE                        161 qgetc::
      0086AE                        162 uart1_qgetc::
      0086AE C6 00 2E         [ 1]  163 	ld a,rx1_head 
      0086B1 C0 00 2F         [ 1]  164 	sub a,rx1_tail 
      0086B4 81               [ 4]  165 	ret 
                                    166 
                                    167 ;---------------------------------
                                    168 ; wait character from UART1 
                                    169 ; input:
                                    170 ;   none
                                    171 ; output:
                                    172 ;   A 			char  
                                    173 ;--------------------------------	
      0086B5                        174 getc:: ;console input
      0086B5                        175 uart1_getc::
      0086B5 CD 86 AE         [ 4]  176 	call uart1_qgetc
      0086B8 27 FB            [ 1]  177 	jreq uart1_getc 
      0086BA 89               [ 2]  178 	pushw x 
                                    179 ;; rx1_queue must be in page 0 	
      0086BB A6 26            [ 1]  180 	ld a,#rx1_queue
      0086BD CB 00 2E         [ 1]  181 	add a,rx1_head 
      0086C0 5F               [ 1]  182 	clrw x  
      0086C1 97               [ 1]  183 	ld xl,a 
      0086C2 F6               [ 1]  184 	ld a,(x)
      0086C3 88               [ 1]  185 	push a
      0086C4 C6 00 2E         [ 1]  186 	ld a,rx1_head 
      0086C7 4C               [ 1]  187 	inc a 
      0086C8 A4 07            [ 1]  188 	and a,#RX_QUEUE_SIZE-1
      0086CA C7 00 2E         [ 1]  189 	ld rx1_head,a 
      0086CD 84               [ 1]  190 	pop a  
      0086CE 85               [ 2]  191 	popw x
      0086CF 81               [ 4]  192 	ret 
                                    193 
                                    194 ;-----------------------------
                                    195 ;  constants replacing 
                                    196 ;  ANSI sequence received 
                                    197 ;  from terminal.
                                    198 ;  These are the ANSI sequences
                                    199 ;  accepted by readln function
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                    200 ;------------------------------
                           000080   201     ARROW_LEFT=128
                           000081   202     ARROW_RIGHT=129
                           000082   203     HOME=130
                           000083   204     KEY_END=131
                           000084   205     SUP=132 
                                    206 
      0086D0 43 81 44 80 48 82 46   207 convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',KEY_END,'3',SUP,0,0
             83 33 84 00 00
                                    208 
                                    209 ;--------------------------------
                                    210 ; receive ANSI ESC 
                                    211 ; sequence and convert it
                                    212 ; to a single character code 
                                    213 ; in range {128..255}
                                    214 ; This is called after receiving 
                                    215 ; ESC character. 
                                    216 ; ignored sequence return 0 
                                    217 ; output:
                                    218 ;   A    converted character 
                                    219 ;-------------------------------
      0086DC                        220 get_escape:
      0086DC CD 86 B5         [ 4]  221     call getc 
      0086DF A1 5B            [ 1]  222     cp a,#'[ ; this character is expected after ESC 
      0086E1 27 02            [ 1]  223     jreq 1$
      0086E3 4F               [ 1]  224     clr a
      0086E4 81               [ 4]  225     ret
      0086E5 CD 86 B5         [ 4]  226 1$: call getc 
      0086E8 AE 86 D0         [ 2]  227     ldw x,#convert_table
      0086EB                        228 2$:
      0086EB F1               [ 1]  229     cp a,(x)
      0086EC 27 08            [ 1]  230     jreq 4$
      0086EE 1C 00 02         [ 2]  231     addw x,#2
      0086F1 7D               [ 1]  232     tnz (x)
      0086F2 26 F7            [ 1]  233     jrne 2$
      0086F4 4F               [ 1]  234     clr a
      0086F5 81               [ 4]  235     ret 
      0086F6 5C               [ 1]  236 4$: incw x 
      0086F7 F6               [ 1]  237     ld a,(x)
      0086F8 A1 84            [ 1]  238     cp a,#SUP
      0086FA 26 05            [ 1]  239     jrne 5$
      0086FC 88               [ 1]  240     push a 
      0086FD CD 86 B5         [ 4]  241     call getc
      008700 84               [ 1]  242     pop a 
      008701                        243 5$:
      008701 81               [ 4]  244     ret 
                                    245 
                                    246 
                                    247 ;-----------------------------
                                    248 ; send an ASCIZ string to UART1 
                                    249 ; input: 
                                    250 ;   x 		char * 
                                    251 ; output:
                                    252 ;   none 
                                    253 ;-------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      008702                        254 puts::
      008702 F6               [ 1]  255     ld a,(x)
      008703 27 06            [ 1]  256 	jreq 1$
      008705 CD 86 A5         [ 4]  257 	call putc 
      008708 5C               [ 1]  258 	incw x 
      008709 20 F7            [ 2]  259 	jra puts 
      00870B 81               [ 4]  260 1$:	ret 
                                    261 
                                    262 
                                    263 ;---------------------------
                                    264 ; delete character at left 
                                    265 ; of cursor on terminal 
                                    266 ; input:
                                    267 ;   none 
                                    268 ; output:
                                    269 ;	none 
                                    270 ;---------------------------
      00870C                        271 bksp:
      00870C A6 08            [ 1]  272 	ld a,#BS 
      00870E CD 86 A5         [ 4]  273 	call putc 
      008711 A6 20            [ 1]  274 	ld a,#SPACE 
      008713 CD 86 A5         [ 4]  275 	call putc 
      008716 A6 08            [ 1]  276 	ld a,#BS 
      008718 CD 86 A5         [ 4]  277 	call putc 
      00871B 81               [ 4]  278 	ret 
                                    279 ;---------------------------
                                    280 ; delete n character left of cursor 
                                    281 ; at terminal.
                                    282 ; input: 
                                    283 ;   A   number of characters to delete.
                                    284 ; output:
                                    285 ;    none 
                                    286 ;--------------------------	
      00871C                        287 delete_nchar:
      00871C 88               [ 1]  288 	push a 
      00871D 0D 01            [ 1]  289 0$:	tnz (1,sp)
      00871F 27 07            [ 1]  290 	jreq 1$
      008721 CD 87 0C         [ 4]  291 	call bksp 
      008724 0A 01            [ 1]  292 	dec (1,sp)
      008726 20 F5            [ 2]  293 	jra 0$
      008728 84               [ 1]  294 1$:	pop a 
      008729 81               [ 4]  295 	ret
                                    296 
                                    297 ;--------------------------
                                    298 ; send ANSI escape sequence
                                    299 ; ANSI: ESC[
                                    300 ; note: ESC is ASCII 27
                                    301 ;       [   is ASCII 91  
                                    302 ;-------------------------- 
      00872A                        303 send_escape:
      00872A A6 1B            [ 1]  304 	ld a,#ESC 
      00872C CD 86 A5         [ 4]  305 	call putc 
      00872F A6 5B            [ 1]  306 	ld a,#'[
      008731 CD 86 A5         [ 4]  307 	call putc 
      008734 81               [ 4]  308 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                    309 
                                    310 ;---------------------
                                    311 ;send ANSI parameter value
                                    312 ; ANSI parameter values are 
                                    313 ; sent as ASCII charater 
                                    314 ; not as binary number.
                                    315 ; this routine 
                                    316 ; convert binary number to 
                                    317 ; ASCII string and send it.
                                    318 ; expected range {0..99}
                                    319 ; input: 
                                    320 ; 	A {0..99} 
                                    321 ; output:
                                    322 ;   none 
                                    323 ;---------------------
      008735                        324 send_parameter:
      008735 89               [ 2]  325 	pushw x 
      008736 5F               [ 1]  326 	clrw x 
      008737 97               [ 1]  327 	ld xl,a 
      008738 A6 0A            [ 1]  328 	ld a,#10 
      00873A 62               [ 2]  329 	div x,a 
      00873B 95               [ 1]  330 	ld xh,a 
      00873C 9F               [ 1]  331 	ld a,xl
      00873D 4D               [ 1]  332     tnz a 
      00873E 27 0B            [ 1]  333     jreq 2$
      008740 A1 09            [ 1]  334 	cp a,#9 
      008742 23 02            [ 2]  335 	jrule 1$
      008744 A6 09            [ 1]  336 	ld a,#9
      008746                        337 1$:
      008746 AB 30            [ 1]  338 	add a,#'0 
      008748 CD 86 A5         [ 4]  339 	call putc
      00874B 9E               [ 1]  340 2$:	ld a,xh 
      00874C AB 30            [ 1]  341 	add a,#'0
      00874E CD 86 A5         [ 4]  342 	call putc 
      008751 85               [ 2]  343 	popw x 
      008752 81               [ 4]  344 	ret 
                                    345 
                                    346 ;--------------------------
                                    347 ; move cursor left n character
                                    348 ; ANSI: ESC[PnD 
                                    349 ; 'Pn' est a numerical parameter
                                    350 ; specifying number of characters 
                                    351 ; displacement.
                                    352 ; input:
                                    353 ;   A     character count
                                    354 ; output:
                                    355 ;   none
                                    356 ;--------------------------
      008753                        357 move_left:
      008753 88               [ 1]  358 	push a 
      008754 CD 87 2A         [ 4]  359 	call send_escape
      008757 84               [ 1]  360     pop a
      008758 CD 87 35         [ 4]  361 	call send_parameter 
      00875B A6 44            [ 1]  362 	ld a,#'D 
      00875D CD 86 A5         [ 4]  363 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      008760 81               [ 4]  364 	ret	
                                    365 
                                    366 
                                    367 ;--------------------------
                                    368 ; move cursor right n character 
                                    369 ; ANSI: ESC[PnC 
                                    370 ; input:
                                    371 ;   A     character count
                                    372 ; output:
                                    373 ;   none
                                    374 ;--------------------------
      008761                        375 move_right:
      008761 88               [ 1]  376 	push a 
      008762 CD 87 2A         [ 4]  377 	call send_escape
      008765 84               [ 1]  378     pop a
      008766 CD 87 35         [ 4]  379 	call send_parameter 
      008769 A6 43            [ 1]  380 	ld a,#'C 
      00876B CD 86 A5         [ 4]  381 	call putc 
      00876E 81               [ 4]  382 	ret 
                                    383 
                                    384 
                                    385 ;--------------------------
                                    386 ; print n spaces on terminal
                                    387 ; input:
                                    388 ;  X 		number of spaces 
                                    389 ; output:
                                    390 ;	none 
                                    391 ;---------------------------
      00876F                        392 spaces::
      00876F A6 20            [ 1]  393 	ld a,#SPACE 
      008771 5D               [ 2]  394 1$:	tnzw x
      008772 27 06            [ 1]  395 	jreq 9$
      008774 CD 86 A5         [ 4]  396 	call putc 
      008777 5A               [ 2]  397 	decw x
      008778 20 F7            [ 2]  398 	jra 1$
      00877A                        399 9$: 
      00877A 81               [ 4]  400 	ret 
                                    401 
                                    402 ;--------------------------
                                    403 ; insert character in text 
                                    404 ; line 
                                    405 ; input:
                                    406 ;   A       character to insert 
                                    407 ;   xl      line length
                                    408 ;   xh      insert position 
                                    409 ;   Y       line pointer 
                                    410 ; output:
                                    411 ;   tib     updated 
                                    412 ;   Y       updated  
                                    413 ;-------------------------
                           000001   414 	IPOS=1
                           000002   415 	KCHAR=2 
                           000003   416     LLEN=3 
                           000003   417 	VSIZE=3 
      00877B                        418 insert_char: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      0006FB                        419 	_vars VSIZE 
      00877B 52 03            [ 2]    1     sub sp,#VSIZE 
      00877D 6B 02            [ 1]  420     ld (KCHAR,sp),a 
      00877F 9E               [ 1]  421     ld a,xh 
      008780 6B 01            [ 1]  422 	ld (IPOS,sp),a
      008782 9F               [ 1]  423     ld a,xl 
      008783 6B 03            [ 1]  424     ld (LLEN,sp),a  
      008785 93               [ 1]  425     ldw x,y
      008786 5C               [ 1]  426     incw x 
      008787 7B 03            [ 1]  427     ld a,(LLEN,sp)
      008789 10 01            [ 1]  428     sub a,(IPOS,sp)
      00878B 4C               [ 1]  429     inc a 
      00878C C7 00 0F         [ 1]  430     ld acc8,a 
      00878F 72 5F 00 0E      [ 1]  431     clr acc16
      008793 CD 91 65         [ 4]  432     call move
      008796 90 AE 16 68      [ 2]  433     ldw y,#tib 
      00879A 7B 01            [ 1]  434     ld a,(IPOS,sp)
      00879C C7 00 0F         [ 1]  435     ld acc8,a 
      00879F 72 B9 00 0E      [ 2]  436     addw y,acc16 
      0087A3 7B 02            [ 1]  437     ld a,(KCHAR,sp)
      0087A5 90 F7            [ 1]  438     ld (y),a
      0087A7 90 5C            [ 1]  439     incw y  
      0087A9 7B 01            [ 1]  440     ld a,(IPOS,sp)
      0087AB CD 87 53         [ 4]  441     call move_left
      0087AE AE 16 68         [ 2]  442     ldw x,#tib 
      0087B1 CD 87 02         [ 4]  443     call puts 
      0087B4 7B 03            [ 1]  444     ld a,(LLEN,sp)
      0087B6 10 01            [ 1]  445     sub a,(IPOS,sp) 
      0087B8 CD 87 53         [ 4]  446     call move_left 
      00073B                        447 	_drop VSIZE 
      0087BB 5B 03            [ 2]    1     addw sp,#VSIZE 
      0087BD 81               [ 4]  448 	ret 
                                    449 
                                    450 
                                    451 ;--------------------------
                                    452 ; delete character under cursor
                                    453 ; input:
                                    454 ;   A       line length   
                                    455 ;   xl      delete position
                                    456 ;   Y       line pointer 
                                    457 ;-------------------------
                           000001   458 	CPOS=1
                           000002   459 	LLEN=2
                           000002   460 	VSIZE=2
      0087BE                        461 delete_under:
      00073E                        462 	_vars VSIZE 
      0087BE 52 02            [ 2]    1     sub sp,#VSIZE 
      0087C0 6B 02            [ 1]  463     ld (LLEN,sp),a 
      0087C2 9F               [ 1]  464     ld a,xl 
      0087C3 6B 01            [ 1]  465     ld (CPOS,sp),a 
      0087C5 93               [ 1]  466     ldw x,y ; move destination
      0087C6 90 5C            [ 1]  467     incw y  ; move source 
      0087C8 7B 02            [ 1]  468     ld a,(LLEN,sp)
      0087CA 10 01            [ 1]  469     sub a,(CPOS,sp)
      0087CC 4C               [ 1]  470     inc a ; move including zero at end.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0087CD C7 00 0F         [ 1]  471     ld acc8,a 
      0087D0 72 5F 00 0E      [ 1]  472     clr acc16 
      0087D4 CD 91 65         [ 4]  473 	call move 
      0087D7 90 AE 16 68      [ 2]  474     ldw y,#tib 
      0087DB 7B 01            [ 1]  475     ld a,(CPOS,sp)
      0087DD C7 00 0F         [ 1]  476     ld acc8,a 
      0087E0 72 B9 00 0E      [ 2]  477     addw y,acc16 
      0087E4 93               [ 1]  478     ldw x,y 
      0087E5 CD 87 02         [ 4]  479     call puts 
      0087E8 A6 20            [ 1]  480     ld a,#SPACE  
      0087EA CD 86 A5         [ 4]  481     call putc
      0087ED 7B 02            [ 1]  482     ld a,(LLEN,sp)
      0087EF 10 01            [ 1]  483     sub a,(CPOS,sp)
      0087F1 CD 87 53         [ 4]  484     call move_left 
      0087F4 0A 02            [ 1]  485     dec (LLEN,sp)
      000776                        486 	_drop VSIZE 
      0087F6 5B 02            [ 2]    1     addw sp,#VSIZE 
      0087F8 81               [ 4]  487 	ret 
                                    488 
                                    489 ;-----------------------------
                                    490 ; send ANSI sequence to delete
                                    491 ; whole line. Cursor position
                                    492 ; is not updated.
                                    493 ; ANSI: ESC[2K
                                    494 ; input:
                                    495 ;   none
                                    496 ; output:
                                    497 ;   none 
                                    498 ;-----------------------------
      0087F9                        499 delete_line:
      0087F9 CD 87 2A         [ 4]  500     call send_escape
      0087FC A6 32            [ 1]  501 	ld a,#'2
      0087FE CD 86 A5         [ 4]  502 	call putc 
      008801 A6 4B            [ 1]  503 	ld a,#'K 
      008803 CD 86 A5         [ 4]  504 	call putc 
      008806 81               [ 4]  505 	ret 
                                    506 
                                    507 
                                    508 
                                    509 ;------------------------------------
                                    510 ; read a line of text from terminal
                                    511 ;  control keys: 
                                    512 ;    BS   efface caractère à gauche 
                                    513 ;    ln+CTRL_E  edit ligne# 'ln' line # 
                                    514 ;    CTRL_R  edit previous line.
                                    515 ;    CTRL_D  delete line  
                                    516 ;    HOME  go to start of line  
                                    517 ;    KEY_END  go to end of line 
                                    518 ;    ARROW_LEFT  move cursor left 
                                    519 ;    ARROW_RIGHT  move cursor right 
                                    520 ;    CTRL_O  toggle between insert/overwrite
                                    521 ; input:
                                    522 ;	none
                                    523 ; local variable on stack:
                                    524 ;	LL  line length
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                    525 ;   RXCHAR last received character 
                                    526 ; output:
                                    527 ;   text in tib  buffer
                                    528 ;   count  line length 
                                    529 ;------------------------------------
                                    530 	; local variables
                           000001   531 	LL_HB=1  ; line length high byte 
                           000001   532 	RXCHAR = 1 ; last char received
                           000002   533 	LL = 2  ; accepted line length
                           000003   534 	CPOS=3  ; cursor position 
                           000004   535 	OVRWR=4 ; overwrite flag 
                           000005   536 	YTEMP=5 ; 
                           000006   537 	VSIZE=6 
      008807                        538 readln::
      008807 90 89            [ 2]  539 	pushw y 
      000789                        540 	_vars VSIZE 
      008809 52 06            [ 2]    1     sub sp,#VSIZE 
      00880B 5F               [ 1]  541 	clrw x 
      00880C 1F 02            [ 2]  542 	ldw (LL,sp),x 
      00880E 1F 03            [ 2]  543 	ldw (CPOS,sp),x 
      008810 03 04            [ 1]  544 	cpl (OVRWR,sp) ; default to overwrite mode 
      008812 90 AE 16 68      [ 2]  545  	ldw y,#tib ; terminal input buffer
      008816                        546 readln_loop:
      008816 CD 86 B5         [ 4]  547 	call getc
      008819 6B 01            [ 1]  548 	ld (RXCHAR,sp),a
      00881B A1 1B            [ 1]  549     cp a,#ESC 
      00881D 26 05            [ 1]  550     jrne 0$
      00881F CD 86 DC         [ 4]  551     call get_escape 
      008822 6B 01            [ 1]  552     ld (RXCHAR,sp),a 
      008824 A1 0D            [ 1]  553 0$:	cp a,#CR
      008826 26 03            [ 1]  554 	jrne 1$
      008828 CC 89 AF         [ 2]  555 	jp readln_quit
      00882B A1 0A            [ 1]  556 1$:	cp a,#LF 
      00882D 26 03            [ 1]  557 	jrne 2$ 
      00882F CC 89 AF         [ 2]  558 	jp readln_quit
      008832                        559 2$:
      008832 A1 08            [ 1]  560 	cp a,#BS
      008834 26 12            [ 1]  561 	jrne 3$
                                    562 ; delete left 
      008836 0D 03            [ 1]  563     tnz (CPOS,sp)
      008838 27 DC            [ 1]  564     jreq readln_loop 
      00883A A6 01            [ 1]  565     ld a,#1 
      00883C CD 87 53         [ 4]  566     call move_left
      00883F 0A 03            [ 1]  567     dec (CPOS,sp)
      008841 90 5A            [ 2]  568     decw y 
      008843 7B 03            [ 1]  569     ld a,(CPOS,sp) 
      008845 CC 89 5B         [ 2]  570     jp 12$
      008848                        571 3$:
      008848 A1 04            [ 1]  572 	cp a,#CTRL_D
      00884A 26 1A            [ 1]  573 	jrne 4$
                                    574 ;delete line 
      00884C CD 87 F9         [ 4]  575 	call delete_line 
      00884F 7B 03            [ 1]  576     ld a,(CPOS,sp)
      008851 4C               [ 1]  577     inc a 
      008852 CD 87 53         [ 4]  578     call move_left 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      008855 A6 3E            [ 1]  579 	ld a,#'> 
      008857 CD 86 A5         [ 4]  580 	call putc 
      00885A 90 AE 16 68      [ 2]  581 	ldw y,#tib
      00885E 90 7F            [ 1]  582 	clr (y)
      008860 0F 02            [ 1]  583 	clr (LL,sp)
      008862 0F 03            [ 1]  584 	clr (CPOS,sp)
      008864 20 B0            [ 2]  585 	jra readln_loop
      008866                        586 4$:
      008866 A1 12            [ 1]  587 	cp a,#CTRL_R 
      008868 26 1E            [ 1]  588 	jrne 5$
                                    589 ;repeat line 
      00886A 0D 02            [ 1]  590 	tnz (LL,sp)
      00886C 26 A8            [ 1]  591 	jrne readln_loop
      00886E 90 AE 16 68      [ 2]  592 	ldw y,#tib 
      008872 93               [ 1]  593 	ldw x,y
      008873 CD 91 39         [ 4]  594 	call strlen
      008876 4D               [ 1]  595 	tnz a  
      008877 27 9D            [ 1]  596 	jreq readln_loop
      008879 6B 02            [ 1]  597 	ld (LL,sp),a 
      00887B 6B 03            [ 1]  598     ld (CPOS,sp),a
      00887D 93               [ 1]  599 	ldw x,y  
      00887E CD 87 02         [ 4]  600 	call puts
      008881 0F 01            [ 1]  601 	clr (LL_HB,sp)
      008883 72 F9 01         [ 2]  602 	addw y,(LL_HB,sp)
      008886 20 8E            [ 2]  603 	jra readln_loop 
      008888                        604 5$:
      008888 A1 05            [ 1]  605 	cp a,#CTRL_E 
      00888A 26 4D            [ 1]  606 	jrne 6$
                                    607 ;edit line number 
      00888C AE 16 68         [ 2]  608 	ldw x,#tib 
      00888F 17 05            [ 2]  609 	ldw (YTEMP,sp),y  
      008891 16 07            [ 2]  610 	ldw y,(VSIZE+1,sp) ; restore xstack pointer 
      008893 CD 96 80         [ 4]  611 	call atoi24
      008896 16 05            [ 2]  612 	ldw y,(YTEMP,sp) ; restore tib pointer 
      008898 4F               [ 1]  613 	clr a
      008899 CD 89 EB         [ 4]  614 	call search_lineno
      00889C 5D               [ 2]  615 	tnzw x 
      00889D 26 0B            [ 1]  616 	jrne 51$
      00889F 0F 02            [ 1]  617 	clr (LL,sp)
      0088A1 90 AE 16 68      [ 2]  618 	ldw y,#tib
      0088A5 90 7F            [ 1]  619     clr (y) 	
      0088A7 CC 89 AF         [ 2]  620 	jp readln_quit  
      0088AA                        621 51$:
      0088AA CF 00 05         [ 2]  622 	ldw basicptr,x
      0088AD E6 02            [ 1]  623 	ld a,(2,x)
      0088AF C7 00 03         [ 1]  624 	ld count,a 
      0088B2 90 AE 16 68      [ 2]  625 	ldw y,#tib 
      0088B6 CD 8F 6C         [ 4]  626 	call decompile 
      0088B9 0F 01            [ 1]  627 	clr (LL_HB,sp)
      0088BB A6 0D            [ 1]  628 	ld a,#CR 
      0088BD CD 86 A5         [ 4]  629 	call putc 
      0088C0 A6 3E            [ 1]  630 	ld a,#'>
      0088C2 CD 86 A5         [ 4]  631 	call putc
      0088C5 AE 16 68         [ 2]  632     ldw x,#tib  
      0088C8 CD 91 39         [ 4]  633 	call strlen 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      0088CB 6B 02            [ 1]  634 	ld (LL,sp),a 
      0088CD CD 87 02         [ 4]  635 	call puts 
      0088D0 90 93            [ 1]  636 	ldw y,x
      0088D2 7B 02            [ 1]  637     ld a,(LL,sp)
      0088D4 6B 03            [ 1]  638     ld (CPOS,sp),a  
      0088D6 CC 88 16         [ 2]  639 	jp readln_loop
      0088D9                        640 6$:
      0088D9 A1 81            [ 1]  641 	cp a,#ARROW_RIGHT
      0088DB 26 15            [ 1]  642    	jrne 7$ 
                                    643 ; right arrow
      0088DD 7B 03            [ 1]  644 	ld a,(CPOS,sp)
      0088DF 11 02            [ 1]  645     cp a,(LL,sp)
      0088E1 2B 03            [ 1]  646     jrmi 61$
      0088E3 CC 88 16         [ 2]  647     jp readln_loop 
      0088E6                        648 61$:
      0088E6 A6 01            [ 1]  649     ld a,#1 
      0088E8 CD 87 61         [ 4]  650 	call move_right 
      0088EB 0C 03            [ 1]  651 	inc (CPOS,sp)
      0088ED 90 5C            [ 1]  652     incw y 
      0088EF CC 88 16         [ 2]  653     jp readln_loop 
      0088F2 A1 80            [ 1]  654 7$: cp a,#ARROW_LEFT  
      0088F4 26 13            [ 1]  655 	jrne 8$
                                    656 ; left arrow 
      0088F6 0D 03            [ 1]  657 	tnz (CPOS,sp)
      0088F8 26 03            [ 1]  658 	jrne 71$
      0088FA CC 88 16         [ 2]  659 	jp readln_loop
      0088FD                        660 71$:
      0088FD A6 01            [ 1]  661     ld a,#1 
      0088FF CD 87 53         [ 4]  662 	call move_left 
      008902 0A 03            [ 1]  663 	dec (CPOS,sp)
      008904 90 5A            [ 2]  664     decw y 
      008906 CC 88 16         [ 2]  665 	jp readln_loop 
      008909 A1 82            [ 1]  666 8$: cp a,#HOME  
      00890B 26 0E            [ 1]  667 	jrne 9$
                                    668 ; HOME 
      00890D 7B 03            [ 1]  669     ld a,(CPOS,sp)
      00890F CD 87 53         [ 4]  670     call move_left 
      008912 0F 03            [ 1]  671 	clr (CPOS,sp)
      008914 90 AE 16 68      [ 2]  672     ldw y,#tib 
      008918 CC 88 16         [ 2]  673 	jp readln_loop  
      00891B A1 83            [ 1]  674 9$: cp a,#KEY_END  
      00891D 26 26            [ 1]  675 	jrne 10$
                                    676 ; KEY_END 
      00891F 7B 03            [ 1]  677 	ld a,(CPOS,sp)
      008921 11 02            [ 1]  678 	cp a,(LL,sp)
      008923 26 03            [ 1]  679 	jrne 91$
      008925 CC 88 16         [ 2]  680 	jp readln_loop 
      008928                        681 91$:
      008928 7B 02            [ 1]  682 	ld a,(LL,sp)
      00892A 10 03            [ 1]  683 	sub a,(CPOS,sp)
      00892C CD 87 61         [ 4]  684 	call move_right 
      00892F 7B 02            [ 1]  685 	ld a,(LL,sp)
      008931 6B 03            [ 1]  686 	ld (CPOS,sp),a
      008933 90 AE 16 68      [ 2]  687     ldw y,#tib
      008937 72 5F 00 0E      [ 1]  688     clr acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      00893B C7 00 0F         [ 1]  689     ld acc8,a 
      00893E 72 B9 00 0E      [ 2]  690     addw y,acc16  
      008942 CC 88 16         [ 2]  691 	jp readln_loop 
      008945 A1 0F            [ 1]  692 10$: cp a,#CTRL_O
      008947 26 08            [ 1]  693 	jrne 11$ 
                                    694 ; toggle between insert/overwrite
      008949 03 04            [ 1]  695 	cpl (OVRWR,sp)
      00894B CD A3 A1         [ 4]  696 	call beep_1khz
      00894E CC 88 16         [ 2]  697 	jp readln_loop 
      008951 A1 84            [ 1]  698 11$: cp a,#SUP 
      008953 26 11            [ 1]  699     jrne final_test 
                                    700 ; del character under cursor 
      008955 7B 03            [ 1]  701     ld a,(CPOS,sp)
      008957 11 02            [ 1]  702     cp a,(LL,sp)
      008959 2A 08            [ 1]  703     jrpl 13$
      00895B                        704 12$:
      00895B 97               [ 1]  705     ld xl,a    ; cursor position 
      00895C 7B 02            [ 1]  706     ld a,(LL,sp)  ; line length
      00895E CD 87 BE         [ 4]  707     call delete_under
      008961 0A 02            [ 1]  708     dec (LLEN,sp)
      008963                        709 13$:
      008963 CC 88 16         [ 2]  710     jp readln_loop 
      008966                        711 final_test:
      008966 A1 20            [ 1]  712 	cp a,#SPACE
      008968 2A 03            [ 1]  713 	jrpl accept_char
      00896A CC 88 16         [ 2]  714 	jp readln_loop
      00896D                        715 accept_char:
      00896D A6 4F            [ 1]  716 	ld a,#TIB_SIZE-1
      00896F 11 02            [ 1]  717 	cp a, (LL,sp)
      008971 2A 03            [ 1]  718 	jrpl 1$
      008973 CC 88 16         [ 2]  719 	jp readln_loop
      008976 0D 04            [ 1]  720 1$:	tnz (OVRWR,sp)
      008978 26 18            [ 1]  721 	jrne overwrite
                                    722 ; insert mode 
      00897A 7B 03            [ 1]  723     ld a,(CPOS,sp)
      00897C 11 02            [ 1]  724     cp a,(LL,sp)
      00897E 27 12            [ 1]  725     jreq overwrite
      008980 7B 02            [ 1]  726     ld a,(LL,sp)
      008982 97               [ 1]  727     ld xl,a 
      008983 7B 03            [ 1]  728     ld a,(CPOS,sp)
      008985 95               [ 1]  729     ld xh,a
      008986 7B 01            [ 1]  730     ld a,(RXCHAR,sp)
      008988 CD 87 7B         [ 4]  731     call insert_char
      00898B 0C 02            [ 1]  732     inc (LLEN,sp)
      00898D 0C 03            [ 1]  733     inc (CPOS,sp)	
      00898F CC 88 16         [ 2]  734     jp readln_loop 
      008992                        735 overwrite:
      008992 7B 01            [ 1]  736 	ld a,(RXCHAR,sp)
      008994 90 F7            [ 1]  737 	ld (y),a
      008996 90 5C            [ 1]  738     incw y
      008998 CD 86 A5         [ 4]  739     call putc 
      00899B 7B 03            [ 1]  740 	ld a,(CPOS,sp)
      00899D 11 02            [ 1]  741 	cp a,(LL,sp)
      00899F 2B 09            [ 1]  742 	jrmi 1$
      0089A1 90 7F            [ 1]  743 	clr (y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      0089A3 0C 02            [ 1]  744 	inc (LL,sp)
      0089A5 0C 03            [ 1]  745     inc (CPOS,sp)
      0089A7 CC 88 16         [ 2]  746 	jp readln_loop 
      0089AA                        747 1$:	
      0089AA 0C 03            [ 1]  748 	inc (CPOS,sp)
      0089AC CC 88 16         [ 2]  749 	jp readln_loop 
      0089AF                        750 readln_quit:
      0089AF 90 AE 16 68      [ 2]  751 	ldw y,#tib
      0089B3 0F 01            [ 1]  752     clr (LL_HB,sp) 
      0089B5 72 F9 01         [ 2]  753     addw y,(LL_HB,sp)
      0089B8 90 7F            [ 1]  754     clr (y)
      0089BA 7B 02            [ 1]  755 	ld a,(LL,sp)
      0089BC C7 00 03         [ 1]  756 	ld count,a 
      0089BF A6 0D            [ 1]  757 	ld a,#CR
      0089C1 CD 86 A5         [ 4]  758 	call putc
      000944                        759 	_drop VSIZE 
      0089C4 5B 06            [ 2]    1     addw sp,#VSIZE 
      0089C6 90 85            [ 2]  760 	popw y 
      0089C8 81               [ 4]  761 	ret
                                    762 
                                    763 ;------------------------------
                                    764 ; print byte  in hexadecimal 
                                    765 ; on console
                                    766 ; input:
                                    767 ;    A		byte to print
                                    768 ;------------------------------
      0089C9                        769 print_hex::
      0089C9 88               [ 1]  770 	push a 
      0089CA 4E               [ 1]  771 	swap a 
      0089CB CD 89 E0         [ 4]  772 	call to_hex_char 
      0089CE CD 86 A5         [ 4]  773 	call putc 
      0089D1 7B 01            [ 1]  774     ld a,(1,sp) 
      0089D3 CD 89 E0         [ 4]  775 	call to_hex_char
      0089D6 CD 86 A5         [ 4]  776 	call putc
      0089D9 A6 20            [ 1]  777 	ld a,#SPACE 
      0089DB CD 86 A5         [ 4]  778 	call putc 
      0089DE 84               [ 1]  779 	pop a 
      0089DF 81               [ 4]  780 	ret 
                                    781 
                                    782 ;----------------------------------
                                    783 ; convert to hexadecimal digit 
                                    784 ; input:
                                    785 ;   A       digit to convert 
                                    786 ; output:
                                    787 ;   A       hexdecimal character 
                                    788 ;----------------------------------
      0089E0                        789 to_hex_char::
      0089E0 A4 0F            [ 1]  790 	and a,#15 
      0089E2 A1 09            [ 1]  791 	cp a,#9 
      0089E4 23 02            [ 2]  792 	jrule 1$ 
      0089E6 AB 07            [ 1]  793 	add a,#7
      0089E8 AB 30            [ 1]  794 1$: add a,#'0 
      0089EA 81               [ 4]  795 	ret 
                                    796 
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
                                     19 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     20 ;;   compile BASIC source code to byte code
                                     21 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     22 
                                     23 
                                     24     .module COMPILER 
                                     25 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                     26     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000000     5 DEBUG=0 ; set to 1 to include debugging code 
                                      6 
                           000000     7 SEPARATE=0 ; set to 1 for 'make separate' 
                                      8 
                                      9 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
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
      0089EB                         51 search_lineno::
      00096B                         52 	_vars VSIZE
      0089EB 52 02            [ 2]    1     sub sp,#VSIZE 
      0089ED 0F 01            [ 1]   53 	clr (LL,sp)
      0089EF 90 CE 00 1C      [ 2]   54 	ldw y,txtbgn
      0089F3 4D               [ 1]   55 	tnz a 
      0089F4 27 04            [ 1]   56 	jreq search_ln_loop
      0089F6 90 CE 00 05      [ 2]   57 	ldw y,basicptr 
      0089FA                         58 search_ln_loop:
      0089FA 90 C3 00 1E      [ 2]   59 	cpw y,txtend 
      0089FE 2A 10            [ 1]   60 	jrpl 8$
      008A00 90 F3            [ 1]   61 	cpw x,(y)
      008A02 27 0E            [ 1]   62 	jreq 9$
      008A04 2B 0A            [ 1]   63 	jrmi 8$ 
      008A06 90 E6 02         [ 1]   64 	ld a,(2,y)
      008A09 6B 02            [ 1]   65 	ld (LB,sp),a 
      008A0B 72 F9 01         [ 2]   66 	addw y,(LL,sp)
      008A0E 20 EA            [ 2]   67 	jra search_ln_loop 
      008A10                         68 8$: 
      008A10 5F               [ 1]   69 	clrw x 	
      008A11 51               [ 1]   70 	exgw x,y 
      000992                         71 9$: _drop VSIZE
      008A12 5B 02            [ 2]    1     addw sp,#VSIZE 
      008A14 51               [ 1]   72 	exgw x,y   
      008A15 81               [ 4]   73 	ret 
                                     74 
                                     75 ;-------------------------------------
                                     76 ; delete line at addr
                                     77 ; input:
                                     78 ;   X 		addr of line i.e DEST for move 
                                     79 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                           000001    80 	LLEN=1
                           000003    81 	SRC=3
                           000004    82 	VSIZE=4
      008A16                         83 del_line: 
      000996                         84 	_vars VSIZE 
      008A16 52 04            [ 2]    1     sub sp,#VSIZE 
      008A18 E6 02            [ 1]   85 	ld a,(2,x) ; line length
      008A1A 6B 02            [ 1]   86 	ld (LLEN+1,sp),a 
      008A1C 0F 01            [ 1]   87 	clr (LLEN,sp)
      008A1E 90 93            [ 1]   88 	ldw y,x  
      008A20 72 F9 01         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      008A23 17 03            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      008A25 90 CE 00 1E      [ 2]   91 	ldw y,txtend 
      008A29 72 F2 03         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      008A2C 90 CF 00 0E      [ 2]   93 	ldw acc16,y 
      008A30 16 03            [ 2]   94 	ldw y,(SRC,sp)    ; source
      008A32 CD 91 65         [ 4]   95 	call move
      008A35 90 CE 00 1E      [ 2]   96 	ldw y,txtend 
      008A39 72 F2 01         [ 2]   97 	subw y,(LLEN,sp)
      008A3C 90 CF 00 1E      [ 2]   98 	ldw txtend,y
      008A40 90 CF 00 30      [ 2]   99 	ldw dvar_bgn,y 
      008A44 90 CF 00 32      [ 2]  100 	ldw dvar_end,y   
      0009C8                        101 	_drop VSIZE     
      008A48 5B 04            [ 2]    1     addw sp,#VSIZE 
      008A4A 81               [ 4]  102 	ret 
                                    103 
                                    104 ;---------------------------------------------
                                    105 ; open a gap in text area to 
                                    106 ; move new line in this gap
                                    107 ; input:
                                    108 ;    X 			addr gap start 
                                    109 ;    Y 			gap length 
                                    110 ; output:
                                    111 ;    X 			addr gap start 
                                    112 ;--------------------------------------------
                           000001   113 	DEST=1
                           000003   114 	SRC=3
                           000005   115 	LEN=5
                           000006   116 	VSIZE=6 
      008A4B                        117 open_gap:
      008A4B C3 00 1E         [ 2]  118 	cpw x,txtend 
      008A4E 24 31            [ 1]  119 	jruge 9$
      0009D0                        120 	_vars VSIZE
      008A50 52 06            [ 2]    1     sub sp,#VSIZE 
      008A52 1F 03            [ 2]  121 	ldw (SRC,sp),x 
      008A54 17 05            [ 2]  122 	ldw (LEN,sp),y 
      008A56 90 CF 00 0E      [ 2]  123 	ldw acc16,y 
      008A5A 90 93            [ 1]  124 	ldw y,x ; SRC
      008A5C 72 BB 00 0E      [ 2]  125 	addw x,acc16  
      008A60 1F 01            [ 2]  126 	ldw (DEST,sp),x 
                                    127 ;compute size to move 	
      008A62 CE 00 1E         [ 2]  128 	ldw x,txtend 
      008A65 72 F0 03         [ 2]  129 	subw x,(SRC,sp)
      008A68 CF 00 0E         [ 2]  130 	ldw acc16,x ; size to move
      008A6B 1E 01            [ 2]  131 	ldw x,(DEST,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      008A6D CD 91 65         [ 4]  132 	call move
      008A70 CE 00 1E         [ 2]  133 	ldw x,txtend
      008A73 72 FB 05         [ 2]  134 	addw x,(LEN,sp)
      008A76 CF 00 1E         [ 2]  135 	ldw txtend,x
      008A79 CF 00 30         [ 2]  136 	ldw dvar_bgn,x 
      008A7C CF 00 32         [ 2]  137 	ldw dvar_end,x 
      0009FF                        138 	_drop VSIZE 
      008A7F 5B 06            [ 2]    1     addw sp,#VSIZE 
      008A81 81               [ 4]  139 9$:	ret 
                                    140 
                                    141 ;--------------------------------------------
                                    142 ; insert line in pad into text area 
                                    143 ; first search for already existing 
                                    144 ; replace existing 
                                    145 ; if new line empty delete existing one. 
                                    146 ; input:
                                    147 ;   ptr16		pointer to tokenized line  
                                    148 ; output:
                                    149 ;   none
                                    150 ;---------------------------------------------
                           000001   151 	DEST=1  ; text area insertion address 
                           000003   152 	SRC=3   ; str to insert address 
                           000005   153 	LINENO=5 ; line number 
                           000007   154 	LLEN=7 ; line length 
                           000008   155 	VSIZE=8  
      008A82                        156 insert_line:
      000A02                        157 	_vars VSIZE 
      008A82 52 08            [ 2]    1     sub sp,#VSIZE 
      008A84 72 CE 00 1A      [ 5]  158 	ldw x,[ptr16]
      008A88 1F 05            [ 2]  159 	ldw (LINENO,sp),x 
      008A8A 0F 07            [ 1]  160 	clr (LLEN,sp)
      008A8C CE 00 1A         [ 2]  161 	ldw x,ptr16 
      008A8F E6 02            [ 1]  162 	ld a,(2,x)
      008A91 6B 08            [ 1]  163 	ld (LLEN+1,sp),a 
      008A93 4F               [ 1]  164 	clr a 
      008A94 1E 05            [ 2]  165 	ldw x,(LINENO,sp)
      008A96 CD 89 EB         [ 4]  166 	call search_lineno
      008A99 5D               [ 2]  167 	tnzw x 
      008A9A 27 07            [ 1]  168 	jreq 0$ 
      008A9C 1F 01            [ 2]  169 	ldw (DEST,sp),x 
      008A9E CD 8A 16         [ 4]  170 	call del_line 
      008AA1 20 02            [ 2]  171 	jra 1$
      008AA3 17 01            [ 2]  172 0$: ldw (DEST,sp),y
      008AA5 A6 03            [ 1]  173 1$: ld a,#3 
      008AA7 11 08            [ 1]  174 	cp a,(LLEN+1,sp)
      008AA9 27 42            [ 1]  175 	jreq 9$
                                    176 ; check for space 
      008AAB CE 00 1E         [ 2]  177 	ldw x,txtend 
      008AAE 72 FB 07         [ 2]  178 	addw x,(LLEN,sp)
      008AB1 A3 16 4A         [ 2]  179 	cpw x,#tib-10*CELL_SIZE ; keep 10 slots space for @() array.  
      008AB4 25 0C            [ 1]  180 	jrult 3$
      008AB6 72 1C 00 23      [ 1]  181 	bset flags,#FLN_REJECTED
      008ABA AE 92 90         [ 2]  182 	ldw x,#err_mem_full 
      008ABD CD 87 02         [ 4]  183 	call puts 
      008AC0 20 2B            [ 2]  184 	jra 9$  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      008AC2                        185 3$: ; create gap to insert line 
      008AC2 1E 01            [ 2]  186 	ldw x,(DEST,sp) 
      008AC4 16 07            [ 2]  187 	ldw y,(LLEN,sp)
      008AC6 CD 8A 4B         [ 4]  188 	call open_gap 
                                    189 ; move new line in gap 
      008AC9 1E 07            [ 2]  190 	ldw x,(LLEN,sp)
      008ACB CF 00 0E         [ 2]  191 	ldw acc16,x 
      008ACE 90 AE 16 B8      [ 2]  192 	ldw y,#pad ;SRC 
      008AD2 1E 01            [ 2]  193 	ldw x,(DEST,sp) ; dest address 
      008AD4 CD 91 65         [ 4]  194 	call move
      008AD7 1E 01            [ 2]  195 	ldw x,(DEST,sp)
      008AD9 C3 00 1E         [ 2]  196 	cpw x,txtend 
      008ADC 25 0F            [ 1]  197 	jrult 9$ 
      008ADE 1E 07            [ 2]  198 	ldw x,(LLEN,sp)
      008AE0 72 BB 00 1E      [ 2]  199 	addw x,txtend 
      008AE4 CF 00 1E         [ 2]  200 	ldw txtend,x 
      008AE7 CF 00 30         [ 2]  201 	ldw dvar_bgn,x 
      008AEA CF 00 32         [ 2]  202 	ldw dvar_end,x 
      008AED                        203 9$:	
      000A6D                        204 	_drop VSIZE
      008AED 5B 08            [ 2]    1     addw sp,#VSIZE 
      008AEF 81               [ 4]  205 	ret
                                    206 
                                    207 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    208 ;; compiler routines        ;;
                                    209 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    210 ;------------------------------------
                                    211 ; parse quoted string 
                                    212 ; input:
                                    213 ;   Y 	pointer to tib 
                                    214 ;   X   pointer to output buffer 
                                    215 ; output:
                                    216 ;	buffer   parsed string
                                    217 ;------------------------------------
                           000001   218 	PREV = 1
                           000002   219 	CURR =2
                           000002   220 	VSIZE=2
      008AF0                        221 parse_quote: 
      000A70                        222 	_vars VSIZE 
      008AF0 52 02            [ 2]    1     sub sp,#VSIZE 
      008AF2 4F               [ 1]  223 	clr a
      008AF3 6B 01            [ 1]  224 1$:	ld (PREV,sp),a 
      008AF5                        225 2$:	
      008AF5 91 D6 01         [ 4]  226 	ld a,([in.w],y)
      008AF8 27 24            [ 1]  227 	jreq 6$
      008AFA 72 5C 00 02      [ 1]  228 	inc in 
      008AFE 6B 02            [ 1]  229 	ld (CURR,sp),a 
      008B00 A6 5C            [ 1]  230 	ld a,#'\
      008B02 11 01            [ 1]  231 	cp a, (PREV,sp)
      008B04 26 0A            [ 1]  232 	jrne 3$
      008B06 0F 01            [ 1]  233 	clr (PREV,sp)
      008B08 7B 02            [ 1]  234 	ld a,(CURR,sp)
      008B0A AD 1C            [ 4]  235 	callr convert_escape
      008B0C F7               [ 1]  236 	ld (x),a 
      008B0D 5C               [ 1]  237 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      008B0E 20 E5            [ 2]  238 	jra 2$
      008B10                        239 3$:
      008B10 7B 02            [ 1]  240 	ld a,(CURR,sp)
      008B12 A1 5C            [ 1]  241 	cp a,#'\'
      008B14 27 DD            [ 1]  242 	jreq 1$
      008B16 A1 22            [ 1]  243 	cp a,#'"
      008B18 27 04            [ 1]  244 	jreq 6$ 
      008B1A F7               [ 1]  245 	ld (x),a 
      008B1B 5C               [ 1]  246 	incw x 
      008B1C 20 D7            [ 2]  247 	jra 2$
      008B1E                        248 6$:
      008B1E 7F               [ 1]  249 	clr (x)
      008B1F 5C               [ 1]  250 	incw x 
      008B20 90 93            [ 1]  251 	ldw y,x 
      008B22 5F               [ 1]  252 	clrw x 
      008B23 A6 02            [ 1]  253 	ld a,#TK_QSTR  
      000AA5                        254 	_drop VSIZE
      008B25 5B 02            [ 2]    1     addw sp,#VSIZE 
      008B27 81               [ 4]  255 	ret 
                                    256 
                                    257 ;---------------------------------------
                                    258 ; called by parse_quote
                                    259 ; subtitute escaped character 
                                    260 ; by their ASCII value .
                                    261 ; input:
                                    262 ;   A  character following '\'
                                    263 ; output:
                                    264 ;   A  substitued char or same if not valid.
                                    265 ;---------------------------------------
      008B28                        266 convert_escape:
      008B28 89               [ 2]  267 	pushw x 
      008B29 AE 8B 3D         [ 2]  268 	ldw x,#escaped 
      008B2C F1               [ 1]  269 1$:	cp a,(x)
      008B2D 27 06            [ 1]  270 	jreq 2$
      008B2F 7D               [ 1]  271 	tnz (x)
      008B30 27 09            [ 1]  272 	jreq 3$
      008B32 5C               [ 1]  273 	incw x 
      008B33 20 F7            [ 2]  274 	jra 1$
      008B35 1D 8B 3D         [ 2]  275 2$: subw x,#escaped 
      008B38 9F               [ 1]  276 	ld a,xl 
      008B39 AB 07            [ 1]  277 	add a,#7
      008B3B 85               [ 2]  278 3$:	popw x 
      008B3C 81               [ 4]  279 	ret 
                                    280 
      008B3D 61 62 74 6E 76 66 72   281 escaped:: .asciz "abtnvfr"
             00
                                    282 
                                    283 ;-------------------------
                                    284 ; integer parser 
                                    285 ; input:
                                    286 ;   X 		point to output buffer  
                                    287 ;   Y 		point to tib 
                                    288 ;   A 	    first digit|'$' 
                                    289 ; output:  
                                    290 ;   X 		integer bits 15..0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                    291 ;   A 		TK_INTGR
                                    292 ;   acc24   24 bits integer 
                                    293 ;-------------------------
                           000001   294 	BASE=1
                           000002   295 	TCHAR=2 
                           000003   296 	XSAVE=3
                           000004   297 	VSIZE=4 
      008B45                        298 parse_integer: ; { -- n }
      008B45 89               [ 2]  299 	pushw x 	
      008B46 4B 00            [ 1]  300 	push #0 ; TCHAR
      008B48 4B 0A            [ 1]  301 	push #10 ; BASE=10
      008B4A A1 24            [ 1]  302 	cp a,#'$
      008B4C 26 04            [ 1]  303 	jrne 2$ 
      000ACE                        304     _drop #1
      008B4E 5B 01            [ 2]    1     addw sp,##1 
      008B50 4B 10            [ 1]  305 	push #16  ; BASE=16
      008B52 F7               [ 1]  306 2$:	ld (x),a 
      008B53 5C               [ 1]  307 	incw x 
      008B54 91 D6 01         [ 4]  308 	ld a,([in.w],y)
      008B57 72 5C 00 02      [ 1]  309 	inc in 
      008B5B CD 96 74         [ 4]  310 	call to_upper 
      008B5E 6B 02            [ 1]  311 	ld (TCHAR,sp),a 
      008B60 CD 8B E6         [ 4]  312 	call is_digit 
      008B63 25 ED            [ 1]  313 	jrc 2$
      008B65 A6 10            [ 1]  314 	ld a,#16 
      008B67 11 01            [ 1]  315 	cp a,(BASE,sp)
      008B69 26 0A            [ 1]  316 	jrne 3$ 
      008B6B 7B 02            [ 1]  317 	ld a,(TCHAR,sp)
      008B6D A1 41            [ 1]  318 	cp a,#'A 
      008B6F 2B 04            [ 1]  319 	jrmi 3$ 
      008B71 A1 47            [ 1]  320 	cp a,#'G 
      008B73 2B DD            [ 1]  321 	jrmi 2$ 
      008B75 72 5A 00 02      [ 1]  322 3$: dec in 	
      008B79 7F               [ 1]  323     clr (x)
      008B7A 1E 03            [ 2]  324 	ldw x,(XSAVE,sp)
      008B7C 90 AE 17 73      [ 2]  325 	ldw y,#XSTACK_EMPTY 
      008B80 CD 96 80         [ 4]  326 	call atoi24
      008B83 16 03            [ 2]  327 	ldw y,(XSAVE,sp)
      008B85 C6 00 0D         [ 1]  328 	ld a,acc24 
      008B88 90 F7            [ 1]  329 	ld (y),a 
      008B8A 90 5C            [ 1]  330 	incw y  
      008B8C CE 00 0E         [ 2]  331 	ldw x,acc16 
      008B8F 90 FF            [ 2]  332 	ldw (y),x 
      008B91 72 A9 00 02      [ 2]  333 	addw y,#2
      008B95 A6 84            [ 1]  334 	ld a,#TK_INTGR
      000B17                        335 	_drop VSIZE  
      008B97 5B 04            [ 2]    1     addw sp,#VSIZE 
      008B99 81               [ 4]  336 	ret 	
                                    337 
                                    338 ;-------------------------
                                    339 ; binary integer parser
                                    340 ; build integer in acc24  
                                    341 ; input:
                                    342 ;   X 		point to output buffer  
                                    343 ;   Y 		point to tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                    344 ;   A 	    '&' 
                                    345 ; output:  
                                    346 ;   buffer  TK_INTGR integer  
                                    347 ;   X 		int16 
                                    348 ;   A 		TK_INTGR
                                    349 ;   acc24    int24 
                                    350 ;-------------------------
                           000001   351 	BINARY=1 ; 24 bits integer 
                           000003   352 	VSIZE=3
      008B9A                        353 parse_binary: ; { -- n }
      008B9A 4B 00            [ 1]  354 	push #0
      008B9C 4B 00            [ 1]  355 	push #0
      008B9E 4B 00            [ 1]  356 	push #0
      008BA0                        357 2$:	
      008BA0 91 D6 01         [ 4]  358 	ld a,([in.w],y)
      008BA3 72 5C 00 02      [ 1]  359 	inc in 
      008BA7 A1 30            [ 1]  360 	cp a,#'0 
      008BA9 27 06            [ 1]  361 	jreq 3$
      008BAB A1 31            [ 1]  362 	cp a,#'1 
      008BAD 27 02            [ 1]  363 	jreq 3$ 
      008BAF 20 0B            [ 2]  364 	jra bin_exit 
      008BB1 A0 30            [ 1]  365 3$: sub a,#'0 
      008BB3 46               [ 1]  366 	rrc a
      008BB4 09 03            [ 1]  367 	rlc (BINARY+2,sp) 
      008BB6 09 02            [ 1]  368 	rlc (BINARY+1,sp)
      008BB8 09 01            [ 1]  369 	rlc (BINARY,sp) 
      008BBA 20 E4            [ 2]  370 	jra 2$  
      008BBC                        371 bin_exit:
      008BBC 72 5A 00 02      [ 1]  372 	dec in 
      008BC0 90 93            [ 1]  373 	ldw y,x
      008BC2 7B 01            [ 1]  374 	ld a,(BINARY,sp)
      008BC4 90 F7            [ 1]  375 	ld (y),a 
      008BC6 90 5C            [ 1]  376 	incw y 
      008BC8 1E 02            [ 2]  377 	ldw x,(BINARY+1,sp)
      008BCA 90 FF            [ 2]  378 	ldw (y),x 
      008BCC 72 A9 00 02      [ 2]  379 	addw y,#2  
      008BD0 A6 84            [ 1]  380 	ld a,#TK_INTGR 	
      000B52                        381 	_drop VSIZE 
      008BD2 5B 03            [ 2]    1     addw sp,#VSIZE 
      008BD4 81               [ 4]  382 	ret
                                    383 
                                    384 ;-------------------------------------
                                    385 ; check if A is a letter 
                                    386 ; input:
                                    387 ;   A 			character to test 
                                    388 ; output:
                                    389 ;   C flag      1 true, 0 false 
                                    390 ;-------------------------------------
      008BD5                        391 is_alpha::
      008BD5 A1 41            [ 1]  392 	cp a,#'A 
      008BD7 8C               [ 1]  393 	ccf 
      008BD8 24 0B            [ 1]  394 	jrnc 9$ 
      008BDA A1 5B            [ 1]  395 	cp a,#'Z+1 
      008BDC 25 07            [ 1]  396 	jrc 9$ 
      008BDE A1 61            [ 1]  397 	cp a,#'a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      008BE0 8C               [ 1]  398 	ccf 
      008BE1 24 02            [ 1]  399 	jrnc 9$
      008BE3 A1 7B            [ 1]  400 	cp a,#'z+1
      008BE5 81               [ 4]  401 9$: ret 	
                                    402 
                                    403 ;------------------------------------
                                    404 ; check if character in {'0'..'9'}
                                    405 ; input:
                                    406 ;    A  character to test
                                    407 ; output:
                                    408 ;    Carry  0 not digit | 1 digit
                                    409 ;------------------------------------
      008BE6                        410 is_digit::
      008BE6 A1 30            [ 1]  411 	cp a,#'0
      008BE8 25 03            [ 1]  412 	jrc 1$
      008BEA A1 3A            [ 1]  413     cp a,#'9+1
      008BEC 8C               [ 1]  414 	ccf 
      008BED 8C               [ 1]  415 1$:	ccf 
      008BEE 81               [ 4]  416     ret
                                    417 
                                    418 ;-------------------------------------
                                    419 ; return true if character in  A 
                                    420 ; is letter or digit.
                                    421 ; input:
                                    422 ;   A     ASCII character 
                                    423 ; output:
                                    424 ;   A     no change 
                                    425 ;   Carry    0 false| 1 true 
                                    426 ;--------------------------------------
      008BEF                        427 is_alnum::
      008BEF CD 8B E6         [ 4]  428 	call is_digit
      008BF2 25 03            [ 1]  429 	jrc 1$ 
      008BF4 CD 8B D5         [ 4]  430 	call is_alpha
      008BF7 81               [ 4]  431 1$:	ret 
                                    432 
                                    433 ;-----------------------------
                                    434 ; check if character in A 
                                    435 ; is a valid symbol character 
                                    436 ; valid: Upper case LETTER,DIGIT,'_','.','?' 
                                    437 ; input:
                                    438 ;    A   character to validate
                                    439 ; output:
                                    440 ;    Carry   set if valid 
                                    441 ;----------------------------
      008BF8                        442 is_symbol_char: 
      008BF8 A1 5F            [ 1]  443 	cp a,#'_ 
      008BFA 26 03            [ 1]  444 	jrne 1$
      008BFC 99               [ 1]  445 0$:	scf 
      008BFD 20 0B            [ 2]  446 	jra 9$ 
      008BFF A1 2E            [ 1]  447 1$:	cp a,#'.
      008C01 27 F9            [ 1]  448 	jreq 0$
      008C03 A1 3F            [ 1]  449 	cp a,#'? 
      008C05 27 F5            [ 1]  450 	jreq 0$ 
      008C07 CD 8B EF         [ 4]  451 	call is_alnum 
      008C0A 81               [ 4]  452 9$: ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                    453 
                                    454 ;---------------------------
                                    455 ;  when lexical unit begin 
                                    456 ;  with a letter a symbol 
                                    457 ;  is expected.
                                    458 ; input:
                                    459 ;   A   first character of symbol 
                                    460 ;	X   point to output buffer 
                                    461 ;   Y   point to input text 
                                    462 ; output:
                                    463 ;	X   after symbol 
                                    464 ;   Y   point after lexical unit 
                                    465 ;---------------------------
      008C0B                        466 parse_symbol:
      008C0B 5C               [ 1]  467 	incw x ; keep space for TK_ID 
      008C0C                        468 symb_loop: 
                                    469 ; symbol are converted to upper case 
      008C0C CD 96 74         [ 4]  470 	call to_upper  
      008C0F F7               [ 1]  471 	ld (x), a 
      008C10 5C               [ 1]  472 	incw x
      008C11 91 D6 01         [ 4]  473 	ld a,([in.w],y)
      008C14 72 5C 00 02      [ 1]  474 	inc in 
      008C18 CD 8B F8         [ 4]  475 	call is_symbol_char 
      008C1B 25 EF            [ 1]  476 	jrc symb_loop 
      008C1D 7F               [ 1]  477 	clr (x)
      008C1E 72 5A 00 02      [ 1]  478 	dec in  
      008C22 81               [ 4]  479 	ret 
                                    480 
                                    481 ;---------------------------
                                    482 ;  token begin with a letter,
                                    483 ;  is keyword or variable. 	
                                    484 ; input:
                                    485 ;   X 		point to pad 
                                    486 ;   Y 		point to text
                                    487 ;   A 	    first letter  
                                    488 ; output:
                                    489 ;   X		exec_addr|var_addr 
                                    490 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC|TK_AND|TK_OR|TK_XOR   
                                    491 ;   pad 	keyword|var_name  
                                    492 ;--------------------------  
                           000001   493 	XFIRST=1
                           000002   494 	VSIZE=2
      008C23                        495 parse_keyword: 
      008C23 89               [ 2]  496 	pushw x ; preserve *symbol 
      008C24 CD 8C 0B         [ 4]  497 	call parse_symbol
      008C27 1E 01            [ 2]  498 	ldw x,(XFIRST,sp) 
      008C29 E6 02            [ 1]  499 	ld a,(2,x)
      008C2B 26 0F            [ 1]  500 	jrne 2$
                                    501 ; one letter variable name 
      008C2D E6 01            [ 1]  502 	ld a,(1,x) 
      008C2F A0 41            [ 1]  503 	sub a,#'A 
      008C31 AE 00 03         [ 2]  504 	ldw x,#3 
      008C34 42               [ 4]  505 	mul x,a 
      008C35 1C 00 35         [ 2]  506 	addw x,#vars 
      008C38 A6 85            [ 1]  507 	ld a,#TK_VAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      008C3A 20 36            [ 2]  508 	jra 4$ 
      008C3C                        509 2$: ; check for keyword, otherwise syntax error.
      000BBC                        510 	_ldx_dict kword_dict ; dictionary entry point
      008C3C AE B4 2D         [ 2]    1     ldw x,#kword_dict+2
      008C3F 16 01            [ 2]  511 	ldw y,(XFIRST,sp) ; name to search for
      008C41 90 5C            [ 1]  512 	incw y 
      008C43 CD 97 01         [ 4]  513 	call search_dict
      008C46 4D               [ 1]  514 	tnz a
      008C47 26 29            [ 1]  515 	jrne 4$
                                    516 ; not in dictionary
                                    517 ; compile it as TK_LABEL
      008C49 16 01            [ 2]  518 	ldw y,(XFIRST,sp)
      008C4B A6 03            [ 1]  519 	ld a,#TK_LABEL 
      008C4D 90 F7            [ 1]  520 	ld (y),a 
      008C4F 90 5C            [ 1]  521 	incw y
      008C51 93               [ 1]  522 	ldw x,y 
      008C52 CD 91 39         [ 4]  523 	call strlen
      008C55 A1 0F            [ 1]  524 	cp a,#NAME_MAX_LEN 
      008C57 23 02            [ 2]  525 	jrule 22$ 
      008C59 A6 0F            [ 1]  526 	ld a,#NAME_MAX_LEN 
      008C5B                        527 22$:	
      008C5B 88               [ 1]  528 	push a 
      008C5C                        529 24$:
      008C5C 90 F6            [ 1]  530     ld a,(y)
      008C5E 27 09            [ 1]  531 	jreq 3$
      008C60 90 5C            [ 1]  532 	incw y
      008C62 0A 01            [ 1]  533 	dec (1,sp) 
      008C64 26 F6            [ 1]  534 	jrne 24$
      008C66 4F               [ 1]  535 	clr a 
      008C67 90 F7            [ 1]  536 	ld (y),a 
      008C69 90 5C            [ 1]  537 3$: incw y 
      000BEB                        538 	_drop 1 
      008C6B 5B 01            [ 2]    1     addw sp,#1 
      008C6D A6 03            [ 1]  539 	ld a,#TK_LABEL 
      008C6F 5F               [ 1]  540 	clrw x 
      008C70 20 1B            [ 2]  541 	jra 5$ 
      008C72                        542 4$:	
      008C72 16 01            [ 2]  543 	ldw y,(XFIRST,sp)
      008C74 A1 87            [ 1]  544 	cp a,#TK_NOT 
      008C76 2B 06            [ 1]  545 	jrmi 41$
      008C78 90 F7            [ 1]  546 	ld (y),a 
      008C7A 90 5C            [ 1]  547 	incw y 
      008C7C 20 0F            [ 2]  548 	jra 5$ 
      008C7E                        549 41$:	
      008C7E A3 9A 8C         [ 2]  550 	cpw x,#let  
      008C81 27 0A            [ 1]  551 	jreq 5$  ; don't compile LET command 
      008C83 90 F7            [ 1]  552 	ld (y),a 
      008C85 90 5C            [ 1]  553 	incw y 
      008C87 90 FF            [ 2]  554 	ldw (y),x
      008C89 72 A9 00 02      [ 2]  555 	addw y,#2  
      000C0D                        556 5$:	_drop VSIZE 
      008C8D 5B 02            [ 2]    1     addw sp,#VSIZE 
      008C8F 81               [ 4]  557 	ret  	
                                    558 
                                    559 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                    560 ; skip character c in text starting from 'in'
                                    561 ; input:
                                    562 ;	 y 		point to text buffer
                                    563 ;    a 		character to skip
                                    564 ; output:  
                                    565 ;	'in' ajusted to new position
                                    566 ;------------------------------------
                           000001   567 	C = 1 ; local var
      008C90                        568 skip:
      008C90 88               [ 1]  569 	push a
      008C91 91 D6 01         [ 4]  570 1$:	ld a,([in.w],y)
      008C94 27 0A            [ 1]  571 	jreq 2$
      008C96 11 01            [ 1]  572 	cp a,(C,sp)
      008C98 26 06            [ 1]  573 	jrne 2$
      008C9A 72 5C 00 02      [ 1]  574 	inc in
      008C9E 20 F1            [ 2]  575 	jra 1$
      000C20                        576 2$: _drop 1 
      008CA0 5B 01            [ 2]    1     addw sp,#1 
      008CA2 81               [ 4]  577 	ret
                                    578 	
                                    579 
                                    580 ;------------------------------------
                                    581 ; scan text for next token
                                    582 ; input: 
                                    583 ;	X 		pointer to buffer where 
                                    584 ;	        token id and value are copied 
                                    585 ; use:
                                    586 ;	Y       pointer to text in tib 
                                    587 ; output:
                                    588 ;   A       token attribute 
                                    589 ;   X 		token value
                                    590 ;   Y       updated position in output buffer   
                                    591 ;------------------------------------
                                    592 	; use to check special character 
                                    593 	.macro _case c t  
                                    594 	ld a,#c 
                                    595 	cp a,(TCHAR,sp) 
                                    596 	jrne t
                                    597 	.endm 
                                    598 
                           000001   599 	TCHAR=1
                           000002   600 	ATTRIB=2
                           000002   601 	VSIZE=2
      008CA3                        602 get_token:: 
      000C23                        603 	_vars VSIZE
      008CA3 52 02            [ 2]    1     sub sp,#VSIZE 
                                    604 ;	ld a,in 
                                    605 ;	sub a,count
                                    606 ;   jrmi 0$
                                    607 ;	clr a 
                                    608 ;	ret 
      008CA5                        609 0$: 
      008CA5 90 AE 16 68      [ 2]  610 	ldw y,#tib    	
      008CA9 A6 20            [ 1]  611 	ld a,#SPACE
      008CAB CD 8C 90         [ 4]  612 	call skip
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      008CAE 55 00 02 00 04   [ 1]  613 	mov in.saved,in 
      008CB3 91 D6 01         [ 4]  614 	ld a,([in.w],y)
      008CB6 26 05            [ 1]  615 	jrne 1$
      008CB8 90 93            [ 1]  616 	ldw y,x 
      008CBA CC 8E 54         [ 2]  617 	jp token_exit ; end of line 
      008CBD 72 5C 00 02      [ 1]  618 1$:	inc in 
      008CC1 CD 96 74         [ 4]  619 	call to_upper 
      008CC4 6B 01            [ 1]  620 	ld (TCHAR,sp),a 
                                    621 ; check for quoted string
      008CC6                        622 str_tst:  	
      000C46                        623 	_case '"' nbr_tst
      008CC6 A6 22            [ 1]    1 	ld a,#'"' 
      008CC8 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CCA 26 0A            [ 1]    3 	jrne nbr_tst
      008CCC A6 02            [ 1]  624 	ld a,#TK_QSTR
      008CCE F7               [ 1]  625 	ld (x),a 
      008CCF 5C               [ 1]  626 	incw x 
      008CD0 CD 8A F0         [ 4]  627 	call parse_quote
      008CD3 CC 8E 54         [ 2]  628 	jp token_exit
      008CD6                        629 nbr_tst:
                                    630 ; check for hexadecimal number 
      008CD6 A6 24            [ 1]  631 	ld a,#'$'
      008CD8 11 01            [ 1]  632 	cp a,(TCHAR,sp) 
      008CDA 27 17            [ 1]  633 	jreq 1$
                                    634 ;check for binary number 
      008CDC A6 26            [ 1]  635 	ld a,#'&
      008CDE 11 01            [ 1]  636 	cp a,(TCHAR,sp)
      008CE0 26 0A            [ 1]  637 	jrne 0$
      008CE2 A6 84            [ 1]  638 	ld a,#TK_INTGR
      008CE4 F7               [ 1]  639 	ld (x),a 
      008CE5 5C               [ 1]  640 	incw x 
      008CE6 CD 8B 9A         [ 4]  641 	call parse_binary ; expect binary integer 
      008CE9 CC 8E 54         [ 2]  642 	jp token_exit 
                                    643 ; check for decimal number 	
      008CEC 7B 01            [ 1]  644 0$:	ld a,(TCHAR,sp)
      008CEE CD 8B E6         [ 4]  645 	call is_digit
      008CF1 24 0C            [ 1]  646 	jrnc 3$
      008CF3 A6 84            [ 1]  647 1$:	ld a,#TK_INTGR 
      008CF5 F7               [ 1]  648 	ld (x),a 
      008CF6 5C               [ 1]  649 	incw x 
      008CF7 7B 01            [ 1]  650 	ld a,(TCHAR,sp)
      008CF9 CD 8B 45         [ 4]  651 	call parse_integer 
      008CFC CC 8E 54         [ 2]  652 	jp token_exit 
      008CFF                        653 3$: 
      000C7F                        654 	_case '(' bkslsh_tst 
      008CFF A6 28            [ 1]    1 	ld a,#'(' 
      008D01 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D03 26 05            [ 1]    3 	jrne bkslsh_tst
      008D05 A6 06            [ 1]  655 	ld a,#TK_LPAREN
      008D07 CC 8E 50         [ 2]  656 	jp token_char   	
      008D0A                        657 bkslsh_tst: ; character token 
      000C8A                        658 	_case '\',rparnt_tst
      008D0A A6 5C            [ 1]    1 	ld a,#'\' 
      008D0C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D0E 26 16            [ 1]    3 	jrne rparnt_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      008D10 A6 04            [ 1]  659 	ld a,#TK_CHAR 
      008D12 F7               [ 1]  660 	ld (x),a 
      008D13 5C               [ 1]  661 	incw x 
      008D14 91 D6 01         [ 4]  662 	ld a,([in.w],y)
      008D17 F7               [ 1]  663 	ld (x),a 
      008D18 5C               [ 1]  664 	incw x
      008D19 90 93            [ 1]  665 	ldw y,x 	 
      008D1B 72 5C 00 02      [ 1]  666 	inc in  
      008D1F 5F               [ 1]  667 	clrw x 
      008D20 97               [ 1]  668 	ld xl,a 
      008D21 A6 04            [ 1]  669 	ld a,#TK_CHAR 
      008D23 CC 8E 54         [ 2]  670 	jp token_exit 
      008D26                        671 rparnt_tst:		
      000CA6                        672 	_case ')' colon_tst 
      008D26 A6 29            [ 1]    1 	ld a,#')' 
      008D28 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D2A 26 05            [ 1]    3 	jrne colon_tst
      008D2C A6 07            [ 1]  673 	ld a,#TK_RPAREN 
      008D2E CC 8E 50         [ 2]  674 	jp token_char
      008D31                        675 colon_tst:
      000CB1                        676 	_case ':' comma_tst 
      008D31 A6 3A            [ 1]    1 	ld a,#':' 
      008D33 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D35 26 05            [ 1]    3 	jrne comma_tst
      008D37 A6 09            [ 1]  677 	ld a,#TK_COLON 
      008D39 CC 8E 50         [ 2]  678 	jp token_char  
      008D3C                        679 comma_tst:
      000CBC                        680 	_case COMMA semic_tst 
      008D3C A6 2C            [ 1]    1 	ld a,#COMMA 
      008D3E 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D40 26 05            [ 1]    3 	jrne semic_tst
      008D42 A6 08            [ 1]  681 	ld a,#TK_COMMA
      008D44 CC 8E 50         [ 2]  682 	jp token_char
      008D47                        683 semic_tst:
      000CC7                        684 	_case SEMIC dash_tst
      008D47 A6 3B            [ 1]    1 	ld a,#SEMIC 
      008D49 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D4B 26 05            [ 1]    3 	jrne dash_tst
      008D4D A6 0A            [ 1]  685 	ld a,#TK_SEMIC 
      008D4F CC 8E 50         [ 2]  686 	jp token_char 	
      008D52                        687 dash_tst: 	
      000CD2                        688 	_case '-' at_tst 
      008D52 A6 2D            [ 1]    1 	ld a,#'-' 
      008D54 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D56 26 05            [ 1]    3 	jrne at_tst
      008D58 A6 11            [ 1]  689 	ld a,#TK_MINUS  
      008D5A CC 8E 50         [ 2]  690 	jp token_char 
      008D5D                        691 at_tst:
      000CDD                        692 	_case '@' qmark_tst 
      008D5D A6 40            [ 1]    1 	ld a,#'@' 
      008D5F 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D61 26 05            [ 1]    3 	jrne qmark_tst
      008D63 A6 05            [ 1]  693 	ld a,#TK_ARRAY 
      008D65 CC 8E 50         [ 2]  694 	jp token_char
      008D68                        695 qmark_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      000CE8                        696 	_case '?' tick_tst 
      008D68 A6 3F            [ 1]    1 	ld a,#'?' 
      008D6A 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D6C 26 12            [ 1]    3 	jrne tick_tst
      008D6E A6 80            [ 1]  697 	ld a,#TK_CMD  
      008D70 F7               [ 1]  698 	ld (x),a 
      008D71 5C               [ 1]  699 	incw x 
      008D72 90 93            [ 1]  700 	ldw y,x 
      008D74 AE 9D BD         [ 2]  701 	ldw x,#cmd_print
      008D77 90 FF            [ 2]  702 	ldw (y),x 
      008D79 72 A9 00 02      [ 2]  703 	addw y,#2
      008D7D CC 8E 54         [ 2]  704 	jp token_exit
      008D80                        705 tick_tst: ; comment 
      000D00                        706 	_case TICK plus_tst 
      008D80 A6 27            [ 1]    1 	ld a,#TICK 
      008D82 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D84 26 2B            [ 1]    3 	jrne plus_tst
      008D86 A6 80            [ 1]  707 	ld a,#TK_CMD
      008D88 F7               [ 1]  708 	ld (x),a 
      008D89 5C               [ 1]  709 	incw x
      008D8A 90 AE 9E F8      [ 2]  710 	ldw y,#remark 
      008D8E FF               [ 2]  711 	ldw (x),y 
      008D8F 1C 00 02         [ 2]  712 	addw x,#2  
      008D92                        713 copy_comment:
      008D92 90 AE 16 68      [ 2]  714 	ldw y,#tib 
      008D96 72 B9 00 01      [ 2]  715 	addw y,in.w
      008D9A 90 89            [ 2]  716 	pushw y 
      008D9C CD 91 55         [ 4]  717 	call strcpy
      008D9F 72 F2 01         [ 2]  718 	subw y,(1,sp)
      008DA2 90 5C            [ 1]  719 	incw y ; strlen+1 
      008DA4 17 01            [ 2]  720 	ldw (1,sp),y 
      008DA6 72 FB 01         [ 2]  721 	addw x,(1,sp) 
      000D29                        722 	_drop 2 
      008DA9 5B 02            [ 2]    1     addw sp,#2 
      008DAB 4F               [ 1]  723 	clr a 
      008DAC 90 93            [ 1]  724 	ldw y,x 
      008DAE CC 8E 54         [ 2]  725 	jp token_exit 
      008DB1                        726 plus_tst:
      000D31                        727 	_case '+' star_tst 
      008DB1 A6 2B            [ 1]    1 	ld a,#'+' 
      008DB3 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DB5 26 05            [ 1]    3 	jrne star_tst
      008DB7 A6 10            [ 1]  728 	ld a,#TK_PLUS  
      008DB9 CC 8E 50         [ 2]  729 	jp token_char 
      008DBC                        730 star_tst:
      000D3C                        731 	_case '*' slash_tst 
      008DBC A6 2A            [ 1]    1 	ld a,#'*' 
      008DBE 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DC0 26 05            [ 1]    3 	jrne slash_tst
      008DC2 A6 20            [ 1]  732 	ld a,#TK_MULT 
      008DC4 CC 8E 50         [ 2]  733 	jp token_char 
      008DC7                        734 slash_tst: 
      000D47                        735 	_case '/' prcnt_tst 
      008DC7 A6 2F            [ 1]    1 	ld a,#'/' 
      008DC9 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      008DCB 26 05            [ 1]    3 	jrne prcnt_tst
      008DCD A6 21            [ 1]  736 	ld a,#TK_DIV 
      008DCF CC 8E 50         [ 2]  737 	jp token_char 
      008DD2                        738 prcnt_tst:
      000D52                        739 	_case '%' eql_tst 
      008DD2 A6 25            [ 1]    1 	ld a,#'%' 
      008DD4 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DD6 26 05            [ 1]    3 	jrne eql_tst
      008DD8 A6 22            [ 1]  740 	ld a,#TK_MOD
      008DDA CC 8E 50         [ 2]  741 	jp token_char  
                                    742 ; 1 or 2 character tokens 	
      008DDD                        743 eql_tst:
      000D5D                        744 	_case '=' gt_tst 		
      008DDD A6 3D            [ 1]    1 	ld a,#'=' 
      008DDF 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DE1 26 05            [ 1]    3 	jrne gt_tst
      008DE3 A6 32            [ 1]  745 	ld a,#TK_EQUAL
      008DE5 CC 8E 50         [ 2]  746 	jp token_char 
      008DE8                        747 gt_tst:
      000D68                        748 	_case '>' lt_tst 
      008DE8 A6 3E            [ 1]    1 	ld a,#'>' 
      008DEA 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DEC 26 23            [ 1]    3 	jrne lt_tst
      008DEE A6 31            [ 1]  749 	ld a,#TK_GT 
      008DF0 6B 02            [ 1]  750 	ld (ATTRIB,sp),a 
      008DF2 91 D6 01         [ 4]  751 	ld a,([in.w],y)
      008DF5 72 5C 00 02      [ 1]  752 	inc in 
      008DF9 A1 3D            [ 1]  753 	cp a,#'=
      008DFB 26 04            [ 1]  754 	jrne 1$
      008DFD A6 33            [ 1]  755 	ld a,#TK_GE 
      008DFF 20 4F            [ 2]  756 	jra token_char  
      008E01 A1 3C            [ 1]  757 1$: cp a,#'<
      008E03 26 04            [ 1]  758 	jrne 2$
      008E05 A6 35            [ 1]  759 	ld a,#TK_NE 
      008E07 20 47            [ 2]  760 	jra token_char 
      008E09 72 5A 00 02      [ 1]  761 2$: dec in
      008E0D 7B 02            [ 1]  762 	ld a,(ATTRIB,sp)
      008E0F 20 3F            [ 2]  763 	jra token_char 	 
      008E11                        764 lt_tst:
      000D91                        765 	_case '<' other
      008E11 A6 3C            [ 1]    1 	ld a,#'<' 
      008E13 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E15 26 23            [ 1]    3 	jrne other
      008E17 A6 34            [ 1]  766 	ld a,#TK_LT 
      008E19 6B 02            [ 1]  767 	ld (ATTRIB,sp),a 
      008E1B 91 D6 01         [ 4]  768 	ld a,([in.w],y)
      008E1E 72 5C 00 02      [ 1]  769 	inc in 
      008E22 A1 3D            [ 1]  770 	cp a,#'=
      008E24 26 04            [ 1]  771 	jrne 1$
      008E26 A6 36            [ 1]  772 	ld a,#TK_LE 
      008E28 20 26            [ 2]  773 	jra token_char 
      008E2A A1 3E            [ 1]  774 1$: cp a,#'>
      008E2C 26 04            [ 1]  775 	jrne 2$
      008E2E A6 35            [ 1]  776 	ld a,#TK_NE 
      008E30 20 1E            [ 2]  777 	jra token_char 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      008E32 72 5A 00 02      [ 1]  778 2$: dec in 
      008E36 7B 02            [ 1]  779 	ld a,(ATTRIB,sp)
      008E38 20 16            [ 2]  780 	jra token_char 	
      008E3A                        781 other: ; not a special character 	 
      008E3A 7B 01            [ 1]  782 	ld a,(TCHAR,sp)
      008E3C CD 8B D5         [ 4]  783 	call is_alpha 
      008E3F 25 03            [ 1]  784 	jrc 30$ 
      008E41 CC 94 3D         [ 2]  785 	jp syntax_error 
      008E44                        786 30$: 
      008E44 CD 8C 23         [ 4]  787 	call parse_keyword
      008E47 A3 9E F8         [ 2]  788 	cpw x,#remark 
      008E4A 26 08            [ 1]  789 	jrne token_exit 
      008E4C 93               [ 1]  790 	ldw x,y 
      008E4D CC 8D 92         [ 2]  791 	jp copy_comment 
      008E50                        792 token_char:
      008E50 F7               [ 1]  793 	ld (x),a 
      008E51 5C               [ 1]  794 	incw x
      008E52 90 93            [ 1]  795 	ldw y,x 
      008E54                        796 token_exit:
      000DD4                        797 	_drop VSIZE 
      008E54 5B 02            [ 2]    1     addw sp,#VSIZE 
      008E56 81               [ 4]  798 	ret
                                    799 
                                    800 
                                    801 ;-----------------------------------
                                    802 ; create token list fromm text line 
                                    803 ; save this list in pad buffer 
                                    804 ;  compiled line format: 
                                    805 ;    line_no  2 bytes {0...32767}
                                    806 ;    line length    1 byte  
                                    807 ;    tokens list  variable length 
                                    808 ;   
                                    809 ; input:
                                    810 ;   none
                                    811 ; modified variables:
                                    812 ;   basicptr     token list buffer address 
                                    813 ;   in.w  		 3|count, i.e. index in buffer
                                    814 ;   count        length of line | 0  
                                    815 ;-----------------------------------
                           000001   816 	XSAVE=1
                           000002   817 	VSIZE=2
      008E57                        818 compile::
      008E57 90 89            [ 2]  819 	pushw y ; preserve xstack pointer 
      000DD9                        820 	_vars VSIZE 
      008E59 52 02            [ 2]    1     sub sp,#VSIZE 
      008E5B 55 00 1C 00 05   [ 1]  821 	mov basicptr,txtbgn
      008E60 72 1A 00 23      [ 1]  822 	bset flags,#FCOMP 
      008E64 A6 00            [ 1]  823 	ld a,#0
      008E66 AE 00 00         [ 2]  824 	ldw x,#0
      008E69 CF 16 B8         [ 2]  825 	ldw pad,x ; destination buffer 
      008E6C C7 16 BA         [ 1]  826 	ld pad+2,a ; count 
      008E6F AE 16 BB         [ 2]  827 	ldw x,#pad+3
      008E72 72 5F 00 02      [ 1]  828 	clr in 
      008E76 CD 8C A3         [ 4]  829 	call get_token
      008E79 A1 84            [ 1]  830 	cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      008E7B 26 11            [ 1]  831 	jrne 2$
      008E7D A3 00 01         [ 2]  832 	cpw x,#1 
      008E80 2A 05            [ 1]  833 	jrpl 1$
      008E82 A6 0A            [ 1]  834 	ld a,#ERR_BAD_VALUE
      008E84 CC 94 3F         [ 2]  835 	jp tb_error
      008E87 CF 16 B8         [ 2]  836 1$:	ldw pad,x ; line# 
      008E8A 90 AE 16 BB      [ 2]  837 	ldw y,#pad+3 
      008E8E 90 A3 17 38      [ 2]  838 2$:	cpw y,#xstack_full 
      008E92 25 05            [ 1]  839 	jrult 3$
      008E94 A6 0F            [ 1]  840 	ld a,#ERR_BUF_FULL 
      008E96 CC 94 3F         [ 2]  841 	jp tb_error 
      008E99                        842 3$:	
      008E99 93               [ 1]  843 	ldw x,y 
      008E9A CD 8C A3         [ 4]  844 	call get_token 
      008E9D A1 00            [ 1]  845 	cp a,#TK_NONE 
      008E9F 26 ED            [ 1]  846 	jrne 2$ 
                                    847 ; compilation completed  
      008EA1 72 A2 16 B8      [ 2]  848 	subw y,#pad ; compiled line length 
      008EA5 90 9F            [ 1]  849     ld a,yl
      008EA7 AE 16 B8         [ 2]  850 	ldw x,#pad 
      008EAA CF 00 1A         [ 2]  851 	ldw ptr16,x 
      008EAD E7 02            [ 1]  852 	ld (2,x),a 
      008EAF FE               [ 2]  853 	ldw x,(x)  ; line# 
      008EB0 27 09            [ 1]  854 	jreq 10$
      008EB2 CD 8A 82         [ 4]  855 	call insert_line
      008EB5 72 5F 00 03      [ 1]  856 	clr  count 
      008EB9 20 0F            [ 2]  857 	jra  11$ 
      008EBB                        858 10$: ; line# is zero 
      008EBB CE 00 1A         [ 2]  859 	ldw x,ptr16  
      008EBE CF 00 05         [ 2]  860 	ldw basicptr,x 
      008EC1 E6 02            [ 1]  861 	ld a,(2,x)
      008EC3 C7 00 03         [ 1]  862 	ld count,a 
      008EC6 35 03 00 02      [ 1]  863 	mov in,#3 
      008ECA                        864 11$:
      000E4A                        865 	_drop VSIZE 
      008ECA 5B 02            [ 2]    1     addw sp,#VSIZE 
      008ECC 72 1B 00 23      [ 1]  866 	bres flags,#FCOMP 
      008ED0 90 85            [ 2]  867 	popw y 
      008ED2 81               [ 4]  868 	ret 
                                    869 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                                     27     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000000     5 DEBUG=0 ; set to 1 to include debugging code 
                                      6 
                           000000     7 SEPARATE=0 ; set to 1 for 'make separate' 
                                      8 
                                      9 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
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
      008ED3                         48 cpy_cmd_name:
      008ED3 5D               [ 2]   49 	tnzw x 
      008ED4 27 14            [ 1]   50 	jreq 10$
      008ED6 F6               [ 1]   51 	ld a,(x)
      008ED7 5C               [ 1]   52 	incw x
      008ED8 A4 0F            [ 1]   53 	and a,#15  
      008EDA 88               [ 1]   54 	push a 
      008EDB 0D 01            [ 1]   55     tnz (1,sp) 
      008EDD 27 0A            [ 1]   56 	jreq 9$
      008EDF F6               [ 1]   57 1$:	ld a,(x)
      008EE0 90 F7            [ 1]   58 	ld (y),a  
      008EE2 5C               [ 1]   59 	incw x
      008EE3 90 5C            [ 1]   60 	incw y 
      008EE5 0A 01            [ 1]   61 	dec (1,sp)	 
      008EE7 26 F6            [ 1]   62 	jrne 1$
      008EE9 84               [ 1]   63 9$: pop a 
      008EEA                         64 10$: 
      008EEA 81               [ 4]   65 	ret	
                                     66 
                                     67 ;--------------------------
                                     68 ; add a space after letter or 
                                     69 ; digit.
                                     70 ; input:
                                     71 ;   Y     pointer to buffer 
                                     72 ; output:
                                     73 ;   Y    moved to end 
                                     74 ;--------------------------
      008EEB                         75 add_space:
      008EEB 90 5A            [ 2]   76 	decw y 
      008EED 90 F6            [ 1]   77 	ld a,(y)
      008EEF 90 5C            [ 1]   78 	incw y
      008EF1 A1 29            [ 1]   79 	cp a,#') 
      008EF3 27 05            [ 1]   80 	jreq 0$
      008EF5 CD 8B F8         [ 4]   81 	call is_symbol_char
      008EF8 24 06            [ 1]   82 	jrnc 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      008EFA                         83 0$: 
      008EFA A6 20            [ 1]   84 	ld a,#SPACE 
      008EFC 90 F7            [ 1]   85 	ld (y),a 
      008EFE 90 5C            [ 1]   86 	incw y 
      008F00 81               [ 4]   87 1$: ret 
                                     88 
                                     89 ;--------------------------
                                     90 ;  align text in buffer 
                                     91 ;  by  padding left  
                                     92 ;  with  SPACE 
                                     93 ; input:
                                     94 ;   X      str*
                                     95 ;   A      width  
                                     96 ; output:
                                     97 ;   A      strlen
                                     98 ;   X      ajusted
                                     99 ;--------------------------
                           000001   100 	WIDTH=1 ; column width 
                           000002   101 	SLEN=2  ; string length 
                           000002   102 	VSIZE=2 
      008F01                        103 right_align::
      000E81                        104 	_vars VSIZE 
      008F01 52 02            [ 2]    1     sub sp,#VSIZE 
      008F03 6B 01            [ 1]  105 	ld (WIDTH,sp),a 
      008F05 CD 91 39         [ 4]  106 	call strlen 
      008F08 6B 02            [ 1]  107 0$:	ld (SLEN,sp),a  
      008F0A 11 01            [ 1]  108 	cp a,(WIDTH,sp) 
      008F0C 2A 09            [ 1]  109 	jrpl 1$
      008F0E 5A               [ 2]  110 	decw x
      008F0F A6 20            [ 1]  111 	ld a,#SPACE 
      008F11 F7               [ 1]  112 	ld (x),a  
      008F12 7B 02            [ 1]  113 	ld a,(SLEN,sp)
      008F14 4C               [ 1]  114 	inc a 
      008F15 20 F1            [ 2]  115 	jra 0$ 
      008F17 7B 02            [ 1]  116 1$: ld a,(SLEN,sp)	
      000E99                        117 	_drop VSIZE 
      008F19 5B 02            [ 2]    1     addw sp,#VSIZE 
      008F1B 81               [ 4]  118 	ret 
                                    119 
                                    120 ;--------------------------
                                    121 ; print TK_QSTR
                                    122 ; converting control character
                                    123 ; to backslash sequence
                                    124 ; input:
                                    125 ;   X        char *
                                    126 ;   Y        dest. buffer 
                                    127 ; output:
                                    128 ;   X        moved forward 
                                    129 ;   Y        moved forward 
                                    130 ;-----------------------------
      008F1C                        131 cpy_quote:
      008F1C A6 22            [ 1]  132 	ld a,#'"
      008F1E 90 F7            [ 1]  133 	ld (y),a 
      008F20 90 5C            [ 1]  134 	incw y 
      008F22 89               [ 2]  135 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      008F23 CD 95 B2         [ 4]  136 	call skip_string 
      008F26 85               [ 2]  137 	popw x 
      008F27 F6               [ 1]  138 1$:	ld a,(x)
      008F28 27 30            [ 1]  139 	jreq 9$
      008F2A 5C               [ 1]  140 	incw x 
      008F2B A1 20            [ 1]  141 	cp a,#SPACE 
      008F2D 25 0E            [ 1]  142 	jrult 3$
      008F2F 90 F7            [ 1]  143 	ld (y),a
      008F31 90 5C            [ 1]  144 	incw y 
      008F33 A1 5C            [ 1]  145 	cp a,#'\ 
      008F35 26 F0            [ 1]  146 	jrne 1$ 
      008F37                        147 2$:
      008F37 90 F7            [ 1]  148 	ld (y),a
      008F39 90 5C            [ 1]  149 	incw y  
      008F3B 20 EA            [ 2]  150 	jra 1$
      008F3D 88               [ 1]  151 3$: push a 
      008F3E A6 5C            [ 1]  152 	ld a,#'\
      008F40 90 F7            [ 1]  153 	ld (y),a 
      008F42 90 5C            [ 1]  154 	incw y  
      008F44 84               [ 1]  155 	pop a 
      008F45 A0 07            [ 1]  156 	sub a,#7
      008F47 C7 00 0F         [ 1]  157 	ld acc8,a 
      008F4A 72 5F 00 0E      [ 1]  158 	clr acc16
      008F4E 89               [ 2]  159 	pushw x
      008F4F AE 8B 3D         [ 2]  160 	ldw x,#escaped 
      008F52 72 BB 00 0E      [ 2]  161 	addw x,acc16 
      008F56 F6               [ 1]  162 	ld a,(x)
      008F57 85               [ 2]  163 	popw x
      008F58 20 DD            [ 2]  164 	jra 2$
      008F5A A6 22            [ 1]  165 9$: ld a,#'"
      008F5C 90 F7            [ 1]  166 	ld (y),a 
      008F5E 90 5C            [ 1]  167 	incw y  
      008F60 5C               [ 1]  168 	incw x 
      008F61 81               [ 4]  169 	ret
                                    170 
                                    171 ;--------------------------
                                    172 ; return variable name 
                                    173 ; from its address.
                                    174 ; input:
                                    175 ;   X    variable address
                                    176 ; output:
                                    177 ;   A     variable letter
                                    178 ;--------------------------
      008F62                        179 var_name::
      008F62 1D 00 35         [ 2]  180 		subw x,#vars 
      008F65 A6 03            [ 1]  181 		ld a,#3
      008F67 62               [ 2]  182 		div x,a 
      008F68 9F               [ 1]  183 		ld a,xl 
      008F69 AB 41            [ 1]  184 		add a,#'A 
      008F6B 81               [ 4]  185 		ret 
                                    186 
                                    187 
                                    188 
                                    189 ;-------------------------------------
                                    190 ; decompile tokens list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                                    191 ; to original text line 
                                    192 ; input:
                                    193 ;   [basicptr]  pointer at line 
                                    194 ;   Y           output buffer
                                    195 ; output:
                                    196 ;   A           length 
                                    197 ;   Y           after string  
                                    198 ;------------------------------------
                           000001   199 	BASE_SAV=1
                           000002   200 	STR=2
                           000003   201 	VSIZE=3 
      008F6C                        202 decompile::
      000EEC                        203 	_vars VSIZE
      008F6C 52 03            [ 2]    1     sub sp,#VSIZE 
      008F6E C6 00 0B         [ 1]  204 	ld a,base
      008F71 6B 01            [ 1]  205 	ld (BASE_SAV,sp),a  
      008F73 17 02            [ 2]  206 	ldw (STR,sp),y   
      008F75 72 CE 00 05      [ 5]  207 	ldw x,[basicptr] ; line number 
      008F79 35 0A 00 0B      [ 1]  208 	mov base,#10
      008F7D 72 5F 00 0D      [ 1]  209 	clr acc24 
      008F81 CF 00 0E         [ 2]  210 	ldw acc16,x
      008F84 4F               [ 1]  211 	clr a ; unsigned conversion 
      008F85 CD 96 16         [ 4]  212 	call itoa  
      008F88 A6 05            [ 1]  213 	ld a,#5 
      008F8A CD 8F 01         [ 4]  214 	call right_align 
      008F8D 88               [ 1]  215 	push a 
      008F8E 90 93            [ 1]  216 1$:	ldw y,x ; source
      008F90 1E 03            [ 2]  217 	ldw x,(STR+1,sp) ; destination
      008F92 CD 91 55         [ 4]  218 	call strcpy 
      008F95 90 5F            [ 1]  219 	clrw y 
      008F97 84               [ 1]  220 	pop a 
      008F98 90 97            [ 1]  221 	ld yl,a 
      008F9A 72 F9 02         [ 2]  222 	addw y,(STR,sp)
      008F9D A6 20            [ 1]  223 	ld a,#SPACE 
      008F9F 90 F7            [ 1]  224 	ld (y),a 
      008FA1 90 5C            [ 1]  225 	incw y 
      008FA3 AE 00 03         [ 2]  226 	ldw x,#3
      008FA6 CF 00 01         [ 2]  227 	ldw in.w,x 
      008FA9                        228 decomp_loop:
      008FA9 90 89            [ 2]  229 	pushw y
      008FAB CD 95 99         [ 4]  230 	call next_token 
      008FAE 90 85            [ 2]  231 	popw y 
      008FB0 4D               [ 1]  232 	tnz a  
      008FB1 26 03            [ 1]  233 	jrne 1$
      008FB3 CC 90 CE         [ 2]  234 	jp 20$
      008FB6 2B 03            [ 1]  235 1$:	jrmi 2$
      008FB8 CC 90 47         [ 2]  236 	jp 6$
      008FBB                        237 2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR|TK_AND|TK_OR|TK_XOR 
      008FBB A1 85            [ 1]  238 	cp a,#TK_VAR 
      008FBD 26 0F            [ 1]  239 	jrne 3$
                                    240 ;; TK_VAR 
      008FBF CD 8E EB         [ 4]  241 	call add_space
      008FC2 CD 95 C1         [ 4]  242 	call get_addr   
      008FC5 CD 8F 62         [ 4]  243 	call var_name
      008FC8 90 F7            [ 1]  244 	ld (y),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      008FCA 90 5C            [ 1]  245 	incw y  
      008FCC 20 DB            [ 2]  246 	jra decomp_loop
      008FCE                        247 3$:
      008FCE A1 84            [ 1]  248 	cp a,#TK_INTGR
      008FD0 26 26            [ 1]  249 	jrne 4$
                                    250 ;; TK_INTGR
      008FD2 CD 95 CB         [ 4]  251 	call get_int24 
      008FD5 C7 00 0D         [ 1]  252 	ld acc24,a 
      008FD8 CF 00 0E         [ 2]  253 	ldw acc16,x 
      008FDB CD 8E EB         [ 4]  254 	call add_space
      008FDE 90 89            [ 2]  255 	pushw y 
      008FE0 A6 FF            [ 1]  256 	ld a,#255 ; signed conversion 
      008FE2 CD 96 16         [ 4]  257 	call itoa  
      008FE5 16 01            [ 2]  258 	ldw y,(1,sp) 
      008FE7 88               [ 1]  259 	push a 
      008FE8 51               [ 1]  260 	exgw x,y 
      008FE9 CD 91 55         [ 4]  261 	call strcpy 
      008FEC 90 5F            [ 1]  262 	clrw y
      008FEE 84               [ 1]  263 	pop a  
      008FEF 90 97            [ 1]  264 	ld yl,a 
      008FF1 72 F9 01         [ 2]  265 	addw y,(1,sp)
      000F74                        266 	_drop 2 
      008FF4 5B 02            [ 2]    1     addw sp,#2 
      008FF6 20 B1            [ 2]  267 	jra decomp_loop
      008FF8                        268 4$: ; dictionary keyword
      008FF8 A1 87            [ 1]  269 	cp a,#TK_NOT 
      008FFA 24 39            [ 1]  270 	jruge 50$ 
      008FFC FE               [ 2]  271 	ldw x,(x)
      008FFD 72 5C 00 02      [ 1]  272 	inc in 
      009001 72 5C 00 02      [ 1]  273 	inc in 
      009005 A3 9E F8         [ 2]  274 	cpw x,#remark 
      009008 26 23            [ 1]  275 	jrne 5$
      00900A CE 00 05         [ 2]  276 	ldw x,basicptr 
                                    277 ; copy comment to buffer 
      00900D CD 8E EB         [ 4]  278 	call add_space
      009010 A6 27            [ 1]  279 	ld a,#''
      009012 90 F7            [ 1]  280 	ld (y),a 
      009014 90 5C            [ 1]  281 	incw y 
      009016                        282 46$:
      009016 72 D6 00 01      [ 4]  283 	ld a,([in.w],x)
      00901A 72 5C 00 02      [ 1]  284 	inc in  
      00901E 90 F7            [ 1]  285 	ld (y),a 
      009020 90 5C            [ 1]  286 	incw y 
      009022 C6 00 02         [ 1]  287 	ld a,in 
      009025 C1 00 03         [ 1]  288 	cp a,count 
      009028 2B EC            [ 1]  289 	jrmi 46$
      00902A CC 90 CE         [ 2]  290 	jp 20$  
      00902D A3 9A 8C         [ 2]  291 5$: cpw x,#let  
      009030 26 05            [ 1]  292 	jrne 54$
      009032 CC 8F A9         [ 2]  293 	jp decomp_loop ; down display LET
      009035                        294 50$:
      009035 5F               [ 1]  295 	clrw x 
      009036 97               [ 1]  296 	ld xl,a 
      009037                        297 54$: ; insert command name 
      009037 CD 8E EB         [ 4]  298 	call add_space  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      00903A 90 89            [ 2]  299 	pushw y
      00903C CD 91 05         [ 4]  300 	call cmd_name
      00903F 90 85            [ 2]  301 	popw y 
      009041 CD 8E D3         [ 4]  302 	call cpy_cmd_name
      009044 CC 8F A9         [ 2]  303 	jp decomp_loop 
      009047                        304 6$:
                                    305 ; label?
      009047 A1 03            [ 1]  306 	cp a,#TK_LABEL 
      009049 26 1E            [ 1]  307 	jrne 64$
                                    308 ; copy label string to output buffer   	
      00904B A6 20            [ 1]  309 	ld a,#32 
      00904D 90 F7            [ 1]  310 	ld (y),a 
      00904F 90 5C            [ 1]  311 	incw y 
      009051                        312 61$:
      009051 89               [ 2]  313 	pushw x 
      009052 CD 95 B2         [ 4]  314 	call skip_string 
      009055 85               [ 2]  315 	popw x 
      009056                        316 62$:	
      009056 F6               [ 1]  317 	ld a,(x)
      009057 27 07            [ 1]  318 	jreq 63$ 
      009059 5C               [ 1]  319 	incw x  
      00905A 90 F7            [ 1]  320 	ld (y),a 
      00905C 90 5C            [ 1]  321 	incw y 
      00905E 20 F6            [ 2]  322 	jra 62$ 
      009060                        323 63$: 
      009060 A6 20            [ 1]  324 	ld a,#32 
      009062 90 F7            [ 1]  325 	ld (y),a 
      009064 90 5C            [ 1]  326 	incw y 
      009066 CC 8F A9         [ 2]  327 	jp decomp_loop
      009069                        328 64$:
      009069 A1 02            [ 1]  329 	cp a,#TK_QSTR 
      00906B 26 09            [ 1]  330 	jrne 7$
                                    331 ;; TK_QSTR
      00906D CD 8E EB         [ 4]  332 	call add_space
      009070 CD 8F 1C         [ 4]  333 	call cpy_quote  
      009073 CC 8F A9         [ 2]  334 	jp decomp_loop
      009076                        335 7$:
      009076 A1 04            [ 1]  336 	cp a,#TK_CHAR 
      009078 26 15            [ 1]  337 	jrne 9$
                                    338 ;; TK_CHAR
      00907A CD 8E EB         [ 4]  339 	call add_space 
      00907D A6 5C            [ 1]  340 	ld a,#'\ 
      00907F 90 F7            [ 1]  341 	ld (y),a 
      009081 90 5C            [ 1]  342 	incw y
      009083 F6               [ 1]  343 	ld a,(x)
      009084 72 5C 00 02      [ 1]  344 	inc in  
      009088                        345 8$:
      009088 90 F7            [ 1]  346 	ld (y),a 
      00908A 90 5C            [ 1]  347 	incw y 
      00908C                        348 82$:
      00908C CC 8F A9         [ 2]  349 	jp decomp_loop
      00908F                        350 9$: 
      00908F A1 0A            [ 1]  351 	cp a,#TK_SEMIC 
      009091 22 0A            [ 1]  352 	jrugt 10$ 
      009093 A0 05            [ 1]  353 	sub a,#TK_ARRAY 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009095 5F               [ 1]  354 	clrw x 
      009096 97               [ 1]  355 	ld xl,a
      009097 1C 90 DF         [ 2]  356 	addw x,#single_char 
      00909A F6               [ 1]  357 	ld a,(x)
      00909B 20 EB            [ 2]  358 	jra 8$ 
      00909D                        359 10$: 
      00909D A1 11            [ 1]  360 	cp a,#TK_MINUS 
      00909F 22 0A            [ 1]  361 	jrugt 11$
      0090A1 A0 10            [ 1]  362 	sub a,#TK_PLUS 
      0090A3 5F               [ 1]  363 	clrw x 
      0090A4 97               [ 1]  364 	ld xl,a 
      0090A5 1C 90 E5         [ 2]  365 	addw x,#add_char 
      0090A8 F6               [ 1]  366 	ld a,(x)
      0090A9 20 DD            [ 2]  367 	jra 8$
      0090AB                        368 11$:
      0090AB A1 22            [ 1]  369     cp a,#TK_MOD 
      0090AD 22 0A            [ 1]  370 	jrugt 12$
      0090AF A0 20            [ 1]  371 	sub a,#TK_MULT
      0090B1 5F               [ 1]  372 	clrw x 
      0090B2 97               [ 1]  373 	ld xl,a 
      0090B3 1C 90 E7         [ 2]  374 	addw x,#mul_char
      0090B6 F6               [ 1]  375 	ld a,(x)
      0090B7 20 CF            [ 2]  376 	jra 8$
      0090B9                        377 12$:
      0090B9 A0 31            [ 1]  378 	sub a,#TK_GT  
      0090BB 48               [ 1]  379 	sll a 
      0090BC 5F               [ 1]  380 	clrw x 
      0090BD 97               [ 1]  381 	ld xl,a 
      0090BE 1C 90 EA         [ 2]  382 	addw x,#relop_str 
      0090C1 FE               [ 2]  383 	ldw x,(x)
      0090C2 F6               [ 1]  384 	ld a,(x)
      0090C3 5C               [ 1]  385 	incw x 
      0090C4 90 F7            [ 1]  386 	ld (y),a
      0090C6 90 5C            [ 1]  387 	incw y 
      0090C8 F6               [ 1]  388 	ld a,(x)
      0090C9 26 BD            [ 1]  389 	jrne 8$
      0090CB CC 8F A9         [ 2]  390 	jp decomp_loop 
      0090CE                        391 20$: 
      0090CE 90 7F            [ 1]  392 	clr (y)
      0090D0 1E 02            [ 2]  393 	ldw x,(STR,sp)
      0090D2 7B 01            [ 1]  394 	ld a,(BASE_SAV,sp)
      0090D4 C7 00 0B         [ 1]  395 	ld base,a 
      0090D7 72 F2 02         [ 2]  396 	subw y,(STR,sp) 
      0090DA 90 9F            [ 1]  397 	ld a,yl 
      00105C                        398 	_drop VSIZE 
      0090DC 5B 03            [ 2]    1     addw sp,#VSIZE 
      0090DE 81               [ 4]  399 	ret 
                                    400 
      0090DF 40 28 29 2C 3A 3B      401 single_char: .byte '@','(',')',',',':',';' 
      0090E5 2B 2D                  402 add_char: .byte '+','-'
      0090E7 2A 2F 25               403 mul_char: .byte '*','/','%'
      0090EA 90 F6 90 F8 90 FA 90   404 relop_str: .word gt,equal,ge,lt,ne,le 
             FD 91 02 90 FF
      0090F6 3E 00                  405 gt: .asciz ">"
      0090F8 3D 00                  406 equal: .asciz "="
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      0090FA 3E 3D 00               407 ge: .asciz ">="
      0090FD 3C 00                  408 lt: .asciz "<"
      0090FF 3C 3D 00               409 le: .asciz "<="
      009102 3C 3E 00               410 ne:  .asciz "<>"
                                    411 
                                    412 ;----------------------------------
                                    413 ; search in kword_dict name
                                    414 ; from its execution address 
                                    415 ; input:
                                    416 ;   X       	routine_address  
                                    417 ; output:
                                    418 ;   X 			cstr*  | 0 
                                    419 ;--------------------------------
                           000001   420 	CODE_ADDR=1 
                           000003   421 	LINK=3 
                           000004   422 	VSIZE=4
      009105                        423 cmd_name:
      001085                        424 	_vars VSIZE 
      009105 52 04            [ 2]    1     sub sp,#VSIZE 
      009107 72 5F 00 0E      [ 1]  425 	clr acc16 
      00910B 1F 01            [ 2]  426 	ldw (CODE_ADDR,sp),x  
      00910D AE B4 2B         [ 2]  427 	ldw x,#kword_dict	
      009110 1F 03            [ 2]  428 1$:	ldw (LINK,sp),x
      009112 E6 02            [ 1]  429 	ld a,(2,x)
      009114 A4 0F            [ 1]  430 	and a,#15 
      009116 C7 00 0F         [ 1]  431 	ld acc8,a 
      009119 1C 00 03         [ 2]  432 	addw x,#3
      00911C 72 BB 00 0E      [ 2]  433 	addw x,acc16
      009120 FE               [ 2]  434 	ldw x,(x) ; code address   
      009121 13 01            [ 2]  435 	cpw x,(CODE_ADDR,sp)
      009123 27 0C            [ 1]  436 	jreq 2$
      009125 1E 03            [ 2]  437 	ldw x,(LINK,sp)
      009127 FE               [ 2]  438 	ldw x,(x) 
      009128 1D 00 02         [ 2]  439 	subw x,#2  
      00912B 26 E3            [ 1]  440 	jrne 1$
      00912D 4F               [ 1]  441 	clr a 
      00912E 5F               [ 1]  442 	clrw x 
      00912F 20 05            [ 2]  443 	jra 9$
      009131 1E 03            [ 2]  444 2$: ldw x,(LINK,sp)
      009133 1C 00 02         [ 2]  445 	addw x,#2 	
      0010B6                        446 9$:	_drop VSIZE
      009136 5B 04            [ 2]    1     addw sp,#VSIZE 
      009138 81               [ 4]  447 	ret
                                    448 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



                                      1 ;;
                                      2 ; Copyright Jacques Deschênes 2019,2022  
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



                                     50     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000000     5 DEBUG=0 ; set to 1 to include debugging code 
                                      6 
                           000000     7 SEPARATE=0 ; set to 1 for 'make separate' 
                                      8 
                                      9 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
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
                                     64 ; keep the following 3 variables in this order 
      000001                         65 in.w::  .blkb 1 ; parser position in text line high-byte 
      000002                         66 in::    .blkb 1 ; low byte of in.w 
      000003                         67 count:: .blkb 1 ; current BASIC line length and tib text length  
      000004                         68 in.saved:: .blkb 1 ; set by get_token before parsing next token, used by unget_token
      000005                         69 basicptr::  .blkb 2  ; point to current BASIC line address.
      000007                         70 data_ptr:  .blkw 1  ; point to DATA address
      000009                         71 data_ofs:  .blkb 1  ; index to next data item 
      00000A                         72 data_len:  .blkb 1  ; length of data line 
      00000B                         73 base::  .blkb 1 ; nemeric base used to print integer 
      00000C                         74 acc32:: .blkb 1 ; 32 bit accumalator upper-byte 
      00000D                         75 acc24:: .blkb 1 ; 24 bits accumulator upper-byte 
      00000E                         76 acc16:: .blkb 1 ; 16 bits accumulator, acc24 high-byte
      00000F                         77 acc8::  .blkb 1 ;  8 bits accumulator, acc24 low-byte  
      000010                         78 ticks: .blkb 3 ; milliseconds ticks counter (see Timer4UpdateHandler)
      000013                         79 timer:: .blkw 1 ;  milliseconds count down timer 
      000015                         80 seedx: .blkw 1  ; xorshift 16 seed x  used by RND() function 
      000017                         81 seedy: .blkw 1  ; xorshift 16 seed y  used by RND() funcion
      000019                         82 farptr: .blkb 1 ; 24 bits pointer used by file system, upper-byte
      00001A                         83 ptr16::  .blkb 1 ; 16 bits pointer , farptr high-byte 
      00001B                         84 ptr8:   .blkb 1 ; 8 bits pointer, farptr low-byte  
      00001C                         85 txtbgn:: .blkw 1 ; tokenized BASIC text beginning address 
      00001E                         86 txtend:: .blkw 1 ; tokenized BASIC text end address 
      000020                         87 loop_depth: .blkb 1 ; level of nested loop. Conformity check   
      000021                         88 array_size: .blkw 1 ; array size, free RAM left after BASIC code.  
      000023                         89 flags:: .blkb 1 ; various boolean flags
      000024                         90 free_eeprom: .blkw 1 ; start address of free eeprom 
      000026                         91 rx1_queue: .ds RX_QUEUE_SIZE ; UART1 receive circular queue 
      00002E                         92 rx1_head:  .blkb 1 ; rx1_queue head pointer
      00002F                         93 rx1_tail:   .blkb 1 ; rx1_queue tail pointer  
      000030                         94 dvar_bgn:: .blkw 1 ; DIM variables start address 
      000032                         95 dvar_end:: .blkw 1 ; DIM variables end address 
      000034                         96 chain_level: .blkb 1 ; increment for each CHAIN command 
                                     97 ; 24 bits integer variables 
      000035                         98 vars:: .blkb 3*26 ; BASIC variables A-Z,
                                     99 
                                    100 	.area BTXT (ABS)
      00008C                        101 	.org 0x8C  
                                    102 ; keep 'free_ram' as last variable 
                                    103 ; basic code compiled here. 
      00008C                        104 rsign: .blkw 1 ; "TB" 
      00008E                        105 rsize: .blkw 1 ; code size 	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      000090                        106 free_ram: ; from here RAM free for BASIC text 
                                    107 
                                    108 	.area CODE 
                                    109 
                                    110 
                                    111 ;-------------------------------------
                                    112 ; retrun string length
                                    113 ; input:
                                    114 ;   X         .asciz  pointer 
                                    115 ; output:
                                    116 ;   X         not affected 
                                    117 ;   A         length 
                                    118 ;-------------------------------------
      009139                        119 strlen::
      009139 89               [ 2]  120 	pushw x 
      00913A 4F               [ 1]  121 	clr a
      00913B 7D               [ 1]  122 1$:	tnz (x) 
      00913C 27 04            [ 1]  123 	jreq 9$ 
      00913E 4C               [ 1]  124 	inc a 
      00913F 5C               [ 1]  125 	incw x 
      009140 20 F9            [ 2]  126 	jra 1$ 
      009142 85               [ 2]  127 9$:	popw x 
      009143 81               [ 4]  128 	ret 
                                    129 
                                    130 ;------------------------------------
                                    131 ; compare 2 strings
                                    132 ; input:
                                    133 ;   X 		char* first string 
                                    134 ;   Y       char* second string 
                                    135 ; output:
                                    136 ;   A 		0 not == |1 ==  
                                    137 ;-------------------------------------
      009144                        138 strcmp:
      009144 F6               [ 1]  139 	ld a,(x)
      009145 27 0B            [ 1]  140 	jreq 5$ 
      009147 90 F1            [ 1]  141 	cp a,(y) 
      009149 26 05            [ 1]  142 	jrne 4$ 
      00914B 5C               [ 1]  143 	incw x 
      00914C 90 5C            [ 1]  144 	incw y 
      00914E 20 F4            [ 2]  145 	jra strcmp 
      009150                        146 4$: ; not same  
      009150 4F               [ 1]  147 	clr a 
      009151 81               [ 4]  148 	ret 
      009152                        149 5$: ; same 
      009152 A6 01            [ 1]  150 	ld a,#1 
      009154 81               [ 4]  151 	ret 
                                    152 
                                    153 
                                    154 ;---------------------------------------
                                    155 ;  copy src to dest 
                                    156 ; input:
                                    157 ;   X 		dest 
                                    158 ;   Y 		src 
                                    159 ; output: 
                                    160 ;   X 		dest 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



                                    161 ;----------------------------------
      009155                        162 strcpy::
      009155 88               [ 1]  163 	push a 
      009156 89               [ 2]  164 	pushw x 
      009157 90 F6            [ 1]  165 1$: ld a,(y)
      009159 27 06            [ 1]  166 	jreq 9$ 
      00915B F7               [ 1]  167 	ld (x),a 
      00915C 5C               [ 1]  168 	incw x 
      00915D 90 5C            [ 1]  169 	incw y 
      00915F 20 F6            [ 2]  170 	jra 1$ 
      009161 7F               [ 1]  171 9$:	clr (x)
      009162 85               [ 2]  172 	popw x 
      009163 84               [ 1]  173 	pop a 
      009164 81               [ 4]  174 	ret 
                                    175 
                                    176 ;---------------------------------------
                                    177 ; move memory block 
                                    178 ; input:
                                    179 ;   X 		destination 
                                    180 ;   Y 	    source 
                                    181 ;   acc16	bytes count 
                                    182 ; output:
                                    183 ;   none 
                                    184 ;--------------------------------------
                           000001   185 	INCR=1 ; incrament high byte 
                           000002   186 	LB=2 ; increment low byte 
                           000002   187 	VSIZE=2
      009165                        188 move::
      009165 88               [ 1]  189 	push a 
      0010E6                        190 	_vars VSIZE 
      009166 52 02            [ 2]    1     sub sp,#VSIZE 
      009168 0F 01            [ 1]  191 	clr (INCR,sp)
      00916A 0F 02            [ 1]  192 	clr (LB,sp)
      00916C 90 89            [ 2]  193 	pushw y 
      00916E 13 01            [ 2]  194 	cpw x,(1,sp) ; compare DEST to SRC 
      009170 90 85            [ 2]  195 	popw y 
      009172 27 31            [ 1]  196 	jreq move_exit ; x==y 
      009174 2B 0E            [ 1]  197 	jrmi move_down
      009176                        198 move_up: ; start from top address with incr=-1
      009176 72 BB 00 0E      [ 2]  199 	addw x,acc16
      00917A 72 B9 00 0E      [ 2]  200 	addw y,acc16
      00917E 03 01            [ 1]  201 	cpl (INCR,sp)
      009180 03 02            [ 1]  202 	cpl (LB,sp)   ; increment = -1 
      009182 20 05            [ 2]  203 	jra move_loop  
      009184                        204 move_down: ; start from bottom address with incr=1 
      009184 5A               [ 2]  205     decw x 
      009185 90 5A            [ 2]  206 	decw y
      009187 0C 02            [ 1]  207 	inc (LB,sp) ; incr=1 
      009189                        208 move_loop:	
      009189 C6 00 0E         [ 1]  209     ld a, acc16 
      00918C CA 00 0F         [ 1]  210 	or a, acc8
      00918F 27 14            [ 1]  211 	jreq move_exit 
      009191 72 FB 01         [ 2]  212 	addw x,(INCR,sp)
      009194 72 F9 01         [ 2]  213 	addw y,(INCR,sp) 
      009197 90 F6            [ 1]  214 	ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      009199 F7               [ 1]  215 	ld (x),a 
      00919A 89               [ 2]  216 	pushw x 
      00919B CE 00 0E         [ 2]  217 	ldw x,acc16 
      00919E 5A               [ 2]  218 	decw x 
      00919F CF 00 0E         [ 2]  219 	ldw acc16,x 
      0091A2 85               [ 2]  220 	popw x 
      0091A3 20 E4            [ 2]  221 	jra move_loop
      0091A5                        222 move_exit:
      001125                        223 	_drop VSIZE
      0091A5 5B 02            [ 2]    1     addw sp,#VSIZE 
      0091A7 84               [ 1]  224 	pop a 
      0091A8 81               [ 4]  225 	ret 	
                                    226 
                                    227 ;------------------------------------
                                    228 ;  set all variables to zero 
                                    229 ; input:
                                    230 ;   none 
                                    231 ; output:
                                    232 ;	none
                                    233 ;------------------------------------
      0091A9                        234 clear_vars:
      0091A9 89               [ 2]  235 	pushw x 
      0091AA 88               [ 1]  236 	push a  
      0091AB AE 00 35         [ 2]  237 	ldw x,#vars 
      0091AE A6 4E            [ 1]  238 	ld a,#CELL_SIZE*26 
      0091B0 7F               [ 1]  239 1$:	clr (x)
      0091B1 5C               [ 1]  240 	incw x 
      0091B2 4A               [ 1]  241 	dec a 
      0091B3 26 FB            [ 1]  242 	jrne 1$
      0091B5 84               [ 1]  243 	pop a 
      0091B6 85               [ 2]  244 	popw x 
      0091B7 81               [ 4]  245 	ret 
                                    246 
                                    247 
                                    248 ;-----------------------
                                    249 ;  display system 
                                    250 ;  information 
                                    251 ;-----------------------
                           000002   252 	MAJOR=2
                           000000   253 	MINOR=0 
      0091B8 0A 0A 54 69 6E 79 20   254 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 32 0A 76 65
             72 73 69 6F 6E 20 00
                                    255 
      0091FE                        256 system_information:
      0091FE AE 91 B8         [ 2]  257 	ldw x,#software 
      009201 CD 87 02         [ 4]  258 	call puts 
      009204 A6 02            [ 1]  259 	ld a,#MAJOR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      009206 C7 00 0F         [ 1]  260 	ld acc8,a 
      009209 5F               [ 1]  261 	clrw x 
      00920A CF 00 0D         [ 2]  262 	ldw acc24,x
      00920D 35 0A 00 0B      [ 1]  263 	mov base, #10 
      009211 CD 95 F8         [ 4]  264 	call prt_acc24 
      009214 A6 2E            [ 1]  265 	ld a,#'.
      009216 CD 86 A5         [ 4]  266 	call putc 
      009219 A6 00            [ 1]  267 	ld a,#MINOR 
      00921B C7 00 0F         [ 1]  268 	ld acc8,a 
      00921E 5F               [ 1]  269 	clrw x 
      00921F CF 00 0D         [ 2]  270 	ldw acc24,x 
      009222 CD 95 F8         [ 4]  271 	call prt_acc24
      009225 A6 0D            [ 1]  272 	ld a,#CR 
      009227 CD 86 A5         [ 4]  273 	call putc
                                    274 ;call test 
      00922A 81               [ 4]  275 	ret
                                    276 
      00922B                        277 warm_init:
      00922B 90 AE 17 73      [ 2]  278 	ldw y,#XSTACK_EMPTY  
      00922F 72 5F 00 23      [ 1]  279 	clr flags 
      009233 72 5F 00 20      [ 1]  280 	clr loop_depth 
      009237 35 0A 00 0B      [ 1]  281 	mov base,#10 
      00923B AE 00 00         [ 2]  282 	ldw x,#0 
      00923E CF 00 05         [ 2]  283 	ldw basicptr,x 
      009241 CF 00 01         [ 2]  284 	ldw in.w,x 
      009244 72 5F 00 03      [ 1]  285 	clr count
      009248 81               [ 4]  286 	ret 
                                    287 
                                    288 ;---------------------------
                                    289 ; reset BASIC text variables 
                                    290 ; and clear variables 
                                    291 ;---------------------------
      009249                        292 clear_basic:
      009249 89               [ 2]  293 	pushw x 
      00924A 72 5F 00 03      [ 1]  294 	clr count
      00924E 72 5F 00 02      [ 1]  295 	clr in  
      009252 AE 00 90         [ 2]  296 	ldw x,#free_ram 
      009255 CF 00 1C         [ 2]  297 	ldw txtbgn,x 
      009258 CF 00 1E         [ 2]  298 	ldw txtend,x 
      00925B CF 00 30         [ 2]  299 	ldw dvar_bgn,x 
      00925E CF 00 32         [ 2]  300 	ldw dvar_end,x 
      009261 CD 91 A9         [ 4]  301 	call clear_vars 
      009264 72 5F 00 34      [ 1]  302 	clr chain_level
      009268 85               [ 2]  303 	popw x
      009269 81               [ 4]  304 	ret 
                                    305 
                                    306 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    307 ;;   Tiny BASIC error messages     ;;
                                    308 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00926A                        309 err_msg:
      00926A 00 00 92 90 92 A7 92   310 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             B5 92 CE 92 DD
      009276 92 F3 93 09 93 23 93   311 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             34 93 45
      009280 93 51 93 84 93 94 93   312 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal  A8-Bits]



             28 13 3B
      009288 93 BB 93 C8 93 D2      313 	.word err_overflow,err_read_only,err_not_program  
                                    314 
      00928E 93 EE 52 65 6A 65 63   315 err_mem_full: .asciz "Rejected, memory full\n" 
             74 65 64 2C 20 6D 65
             6D 6F 72 79 20 66 75
             6C 6C
      0092A5 0A 00 73 79 6E 74 61   316 err_syntax: .asciz "syntax error\n" 
             78 20 65 72 72 6F 72
      0092B3 0A 00 6D 61 74 68 20   317 err_math_ovf: .asciz "math operation overflow\n"
             6F 70 65 72 61 74 69
             6F 6E 20 6F 76 65 72
             66 6C 6F 77
      0092CC 0A 00 64 69 76 69 73   318 err_div0: .asciz "division by 0\n" 
             69 6F 6E 20 62 79 20
             30
      0092DB 0A 00 69 6E 76 61 6C   319 err_no_line: .asciz "invalid line number.\n"
             69 64 20 6C 69 6E 65
             20 6E 75 6D 62 65 72
             2E
      0092F1 0A 00 72 75 6E 20 74   320 err_run_only: .asciz "run time only usage.\n" 
             69 6D 65 20 6F 6E 6C
             79 20 75 73 61 67 65
             2E
      009307 0A 00 63 6F 6D 6D 61   321 err_cmd_only: .asciz "command line only usage.\n"
             6E 64 20 6C 69 6E 65
             20 6F 6E 6C 79 20 75
             73 61 67 65 2E
      009321 0A 00 64 75 70 6C 69   322 err_duplicate: .asciz "duplicate name.\n"
             63 61 74 65 20 6E 61
             6D 65 2E
      009332 0A 00 46 69 6C 65 20   323 err_not_file: .asciz "File not found.\n"
             6E 6F 74 20 66 6F 75
             6E 64 2E
      009343 0A 00 62 61 64 20 76   324 err_bad_value: .asciz "bad value.\n"
             61 6C 75 65 2E
      00934F 0A 00 46 69 6C 65 20   325 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             69 6E 20 65 78 74 65
             6E 64 65 64 20 6D 65
             6D 6F 72 79 2C 20 63
             61 6E 27 74 20 62 65
             20 72 75 6E 20 66 72
             6F 6D 20 74 68 65 72
             65 2E
      009382 0A 00 4E 6F 20 64 61   326 err_no_data: .asciz "No data found.\n"
             74 61 20 66 6F 75 6E
             64 2E
      009392 0A 00 4E 6F 20 70 72   327 err_no_prog: .asciz "No program in RAM!\n"
             6F 67 72 61 6D 20 69
             6E 20 52 41 4D 21
      0093A6 0A 00 46 69 6C 65 20   328 err_no_fspace: .asciz "File system full.\n" 
             73 79 73 74 65 6D 20
             66 75 6C 6C 2E
      0093B9 0A 00 42 75 66 66 65   329 err_buf_full: .asciz "Buffer full\n"
             72 20 66 75 6C 6C
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      0093C6 0A 00 6F 76 65 72 66   330 err_overflow: .asciz "overflow\n" 
             6C 6F 77
      0093D0 0A 00 63 6F 6E 73 74   331 err_read_only: .asciz "constant can't be modified\n"
             61 6E 74 20 63 61 6E
             27 74 20 62 65 20 6D
             6F 64 69 66 69 65 64
      0093EC 0A 00 6E 6F 20 70 72   332 err_not_program: .asciz "no program at this address\n"
             6F 67 72 61 6D 20 61
             74 20 74 68 69 73 20
             61 64 64 72 65 73 73
                                    333 
                                    334 ;-------------------------------------
      009408 0A 00 0A 72 75 6E 20   335 rt_msg: .asciz "\nrun time error, "
             74 69 6D 65 20 65 72
             72 6F 72 2C
      00941A 20 00 0A 63 6F 6D 70   336 comp_msg: .asciz "\ncompile error, "
             69 6C 65 20 65 72 72
             6F 72 2C
      00942B 20 00 6C 61 73 74 20   337 tk_id: .asciz "last token id: "
             74 6F 6B 65 6E 20 69
             64 3A
                                    338 
      0013BD                        339 syntax_error::
      00943B 20 00            [ 1]  340 	ld a,#ERR_SYNTAX 
                                    341 
      00943D                        342 tb_error::
      00943D A6 02 00 22 3F   [ 2]  343 	btjt flags,#FCOMP,1$
      00943F 88               [ 1]  344 	push a 
      00943F 72 0A 00         [ 2]  345 	ldw x, #rt_msg 
      009442 23 3F 88         [ 4]  346 	call puts 
      009445 AE               [ 1]  347 	pop a 
      009446 94 0A CD         [ 2]  348 	ldw x, #err_msg 
      009449 87 02 84 AE      [ 1]  349 	clr acc16 
      00944D 92               [ 1]  350 	sll a
      00944E 6A 72 5F 00      [ 1]  351 	rlc acc16  
      009452 0E 48 72         [ 1]  352 	ld acc8, a 
      009455 59 00 0E C7      [ 2]  353 	addw x,acc16 
      009459 00               [ 2]  354 	ldw x,(x)
      00945A 0F 72 BB         [ 4]  355 	call puts
      00945D 00 0E FE         [ 2]  356 	ldw x,basicptr 
                           000000   357 .if DEBUG 
                                    358 ld a,count 
                                    359 clrw y 
                                    360 rlwa y  
                                    361 call hex_dump
                                    362 ldw x,basicptr
                                    363 .endif 
      009460 CD 87 02         [ 1]  364 	ld a,in 
      009463 CE 00 05         [ 4]  365 	call prt_basic_line
      009466 C6 00 02         [ 2]  366 	ldw x,#tk_id 
      009469 CD 9D 99         [ 4]  367 	call puts 
      00946C AE 94 2D         [ 1]  368 	ld a,in.saved 
      00946F CD               [ 1]  369 	clrw x 
      009470 87               [ 1]  370 	ld xl,a 
      009471 02 C6 00 04      [ 2]  371 	addw x,basicptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      009475 5F               [ 1]  372 	ld a,(x)
      009476 97               [ 1]  373 	clrw x 
      009477 72               [ 1]  374 	ld xl,a 
      009478 BB 00 05         [ 4]  375 	call prt_i16
      00947B F6 5F            [ 2]  376 	jra 6$
      001403                        377 1$:	
      00947D 97               [ 1]  378 	push a 
      00947E CD 95 E1         [ 2]  379 	ldw x,#comp_msg
      009481 20 35 82         [ 4]  380 	call puts 
      009483 84               [ 1]  381 	pop a 
      009483 88 AE 94         [ 2]  382 	ldw x, #err_msg 
      009486 1C CD 87 02      [ 1]  383 	clr acc16 
      00948A 84               [ 1]  384 	sll a
      00948B AE 92 6A 72      [ 1]  385 	rlc acc16  
      00948F 5F 00 0E         [ 1]  386 	ld acc8, a 
      009492 48 72 59 00      [ 2]  387 	addw x,acc16 
      009496 0E               [ 2]  388 	ldw x,(x)
      009497 C7 00 0F         [ 4]  389 	call puts
      00949A 72 BB 00         [ 2]  390 	ldw x,#tib
      00949D 0E FE CD         [ 4]  391 	call puts 
      0094A0 87 02            [ 1]  392 	ld a,#CR 
      0094A2 AE 16 68         [ 4]  393 	call putc
      0094A5 CD 87 02         [ 2]  394 	ldw x,in.w
      0094A8 A6 0D CD         [ 4]  395 	call spaces
      0094AB 86 A5            [ 1]  396 	ld a,#'^
      0094AD CE 00 01         [ 4]  397 	call putc 
      0094B0 CD 87 6F         [ 2]  398 6$: ldw x,#STACK_EMPTY 
      0094B3 A6               [ 1]  399     ldw sp,x
                                    400 
      00143C                        401 warm_start:
      0094B4 5E CD 86         [ 4]  402 	call warm_init
                                    403 ;----------------------------
                                    404 ;   BASIC interpreter
                                    405 ;----------------------------
      00143F                        406 cmd_line: ; user interface 
      0094B7 A5 AE            [ 1]  407 	ld a,#CR 
      0094B9 17 FF 94         [ 4]  408 	call putc 
      0094BC A6 3E            [ 1]  409 	ld a,#'> 
      0094BC CD 92 2B         [ 4]  410 	call putc
      0094BF CD 07 87         [ 4]  411 	call readln
      0094BF A6 0D CD 86      [ 1]  412 	tnz count 
      0094C3 A5 A6            [ 1]  413 	jreq cmd_line
      0094C5 3E CD 86         [ 4]  414 	call compile
                                    415 ;;;;;;;;;;;;;;;;;;;;;;	
                                    416 ;pushw y 
                                    417 ;ldw x,txtbgn  
                                    418 ;ldw y,txtend
                                    419 ;ldw acc16,x   
                                    420 ;subw y,acc16 
                                    421 ;call hex_dump
                                    422 ;popw y 
                                    423 ;;;;;;;;;;;;;;;;;;;;;;
                                    424 
                                    425 ; if text begin with a line number
                                    426 ; the compiler set count to zero    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



                                    427 ; so code is not interpreted
      0094C8 A5 CD 88 07      [ 1]  428 	tnz count 
      0094CC 72 5D            [ 1]  429 	jreq cmd_line
                                    430 	
                                    431 ; if direct command 
                                    432 ; it's ready to interpret 
                                    433 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    434 ;; This is the interpreter loop
                                    435 ;; for each BASIC code line. 
                                    436 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      00145B                        437 interpreter: 
      0094CE 00 03 27         [ 1]  438 	ld a,in 
      0094D1 ED CD 8E         [ 1]  439 	cp a,count 
      0094D4 57 72            [ 1]  440 	jrmi interp_loop
      001463                        441 next_line:
      0094D6 5D 00 03 27 E4   [ 2]  442 	btjf flags, #FRUN, cmd_line
      0094DB CE 00 04         [ 2]  443 	ldw x,basicptr
      0094DB C6 00 02 C1      [ 2]  444 	addw x,in.w 
      0094DF 00 03 2B         [ 2]  445 	cpw x,txtend 
      0094E2 20 03            [ 1]  446 	jrmi 0$
      0094E3 CD 22 C8         [ 4]  447 	call cmd_end ; end program 
      0094E3 72 01 00         [ 2]  448 0$:	ldw basicptr,x ; start of next line  
      0094E6 23 D7            [ 1]  449 	ld a,(2,x)
      0094E8 CE 00 05         [ 1]  450 	ld count,a 
      0094EB 72 BB 00 01      [ 1]  451 	mov in,#3 ; skip first 3 bytes of line 
      001483                        452 interp_loop:
      0094EF C3 00 1E         [ 4]  453 	call next_token
      0094F2 2B 03            [ 1]  454 	cp a,#TK_NONE 
      0094F4 CD A3            [ 1]  455 	jreq next_line 
      0094F6 48 CF            [ 1]  456 	cp a,#TK_CMD
      0094F8 00 05            [ 1]  457 	jrne 1$
      00148E                        458 	_get_code_addr
      0094FA E6               [ 2]    1         ldw x,(x)
      0094FB 02 C7 00 03      [ 1]    2         inc in 
      0094FF 35 03 00 02      [ 1]    3         inc in 
      009503 FD               [ 4]  459 	call(x)
      009503 CD 95            [ 2]  460 	jra interp_loop 
      00149A                        461 1$:	 
      009505 99 A1            [ 1]  462 	cp a,#TK_VAR
      009507 00 27            [ 1]  463 	jrne 2$
      009509 D9 A1 80         [ 4]  464 	call let_var  
      00950C 26 0C            [ 2]  465 	jra interp_loop 
      0014A3                        466 2$:	
      00950E FE 72            [ 1]  467 	cp a,#TK_ARRAY 
      009510 5C 00            [ 1]  468 	jrne 3$
      009512 02 72 5C         [ 4]  469 	call let_array 
      009515 00 02            [ 2]  470 	jra interp_loop
      0014AC                        471 3$:	
      009517 FD 20            [ 1]  472 	cp a,#TK_LABEL
      009519 E9 05            [ 1]  473 	jrne 4$
      00951A CD 14 BC         [ 4]  474 	call let_dvar  
      00951A A1 85            [ 2]  475 	jra interp_loop 
      0014B5                        476 4$: 
      00951C 26 05            [ 1]  477 	cp a,#TK_COLON 
      00951E CD 9A            [ 1]  478 	jreq interp_loop
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      009520 9F 20 E0         [ 2]  479 5$:	jp syntax_error 
                                    480 
                                    481 
                                    482 ;----------------------
                                    483 ; when a label is met 
                                    484 ; at interp_loop
                                    485 ; it may be a variable 
                                    486 ; assignement to DIM 
                                    487 ; variable 
                                    488 ;----------------------
                           000001   489 	VAR_NAME=1 
                           000003   490 	REC_LEN=3
                           000004   491 	VSIZE=4 
      009523                        492 let_dvar:
      0014BC                        493 	_vars VSIZE 
      009523 A1 05            [ 2]    1     sub sp,#VSIZE 
      009525 26 05            [ 2]  494 	ldw (VAR_NAME,sp),x
      009527 CD 9A            [ 1]  495 	clr (REC_LEN,sp) 
      009529 9A 20 D7         [ 4]  496 	call skip_string 
      00952C CE 00 04         [ 2]  497 	ldw x,basicptr 
      00952C A1 03 26 05      [ 2]  498 	addw x,in.w 
      009530 CD               [ 1]  499 	ld a,(x)
      009531 95 3C            [ 1]  500 	cp a,#TK_EQUAL 
      009533 20 CE            [ 1]  501 	jrne 9$ 
                                    502 ; dvar assignment 
      009535 72 5C 00 01      [ 1]  503 	inc in  
      009535 A1 09 27         [ 4]  504 	call condition  
      009538 CA CC            [ 1]  505 	cp a,#TK_INTGR 
      00953A 94 3D            [ 1]  506 	jreq 1$ 
      00953C CC 13 BD         [ 2]  507 0$:	jp syntax_error 
      0014DF                        508 1$: 
      00953C 52 04            [ 2]  509 	ldw x,(VAR_NAME,sp) ; pointer to var name 
      00953E 1F 01 0F         [ 4]  510 	call strlen 
      009541 03 CD            [ 1]  511 	add a,#REC_XTRA_BYTES
      009543 95 B2            [ 1]  512 	ld (REC_LEN+1,sp),a 
      009545 CE 00            [ 1]  513 	sub a,#REC_XTRA_BYTES
      009547 05 72 BB         [ 4]  514 	call search_name 
      00954A 00               [ 2]  515 	tnzw x 
      00954B 01 F6            [ 1]  516 	jreq 0$ 
      00954D A1               [ 1]  517 	ld a,(x)
      00954E 32 26            [ 1]  518 	jrpl 2$
      009550 45 72            [ 1]  519 	ld a,#ERR_RD_ONLY 
      009552 5C 00 02         [ 2]  520 	jp tb_error 
      0014F8                        521 2$:
      009555 CD 99 CD         [ 2]  522 	addw x,(REC_LEN,sp)
      009558 A1 84 27         [ 2]  523 	subw x,#CELL_SIZE 
      00955B 03 CC 94         [ 2]  524 	ldw ptr16,x
      001501                        525 	_xpop 
      00955E 3D F6            [ 1]    1     ld a,(y)
      00955F 93               [ 1]    2     ldw x,y 
      00955F 1E 01            [ 2]    3     ldw x,(1,x)
      009561 CD 91 39 AB      [ 2]    4     addw y,#CELL_SIZE 
      009565 05 6B 04 A0      [ 4]  526 	ld [ptr16],a 
      009569 05 CD 9B 09      [ 1]  527 	inc ptr8 
      00956D 5D 27 EC F6      [ 5]  528 	ldw [ptr16],x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      001516                        529 9$: _drop VSIZE 	
      009571 2A 05            [ 2]    1     addw sp,#VSIZE 
      009573 A6               [ 4]  530 	ret 
                                    531 
                                    532 
                                    533 ;--------------------------
                                    534 ; extract next token from
                                    535 ; token list 
                                    536 ; basicptr -> base address 
                                    537 ; in  -> offset in list array 
                                    538 ; output:
                                    539 ;   A 		token attribute
                                    540 ;   X 		*token_value 
                                    541 ;----------------------------------------
      001519                        542 next_token::
                                    543 ;	clrw x 
      009574 11 CC 94         [ 1]  544 	ld a,in 
      009577 3F 00 03         [ 1]  545 	ld in.saved,a ; in case "_unget_token" needed 
                                    546 ; don't replace sub by "cp a,count" 
                                    547 ; if end of line must return with A=0   	
      009578 C0 00 02         [ 1]  548 	sub a,count 
      009578 72 FB            [ 1]  549 	jreq 9$ ; end of line 
      001524                        550 0$: 
      00957A 03 1D 00         [ 2]  551 	ldw x,basicptr 
      00957D 03 CF 00 1A      [ 2]  552 	addw x,in.w 
      009581 90               [ 1]  553 	ld a,(x)
      009582 F6               [ 1]  554 	incw x
      009583 93 EE 01 72      [ 1]  555 	inc in   
      009587 A9               [ 4]  556 9$: ret 
                                    557 
                                    558 ;-------------------------
                                    559 ;  skip .asciz in BASIC line 
                                    560 ;  name 
                                    561 ;  input:
                                    562 ;     x		* string 
                                    563 ;  output:
                                    564 ;     none 
                                    565 ;-------------------------
      001532                        566 skip_string:
      009588 00               [ 1]  567 	ld a,(x)
      009589 03 72            [ 1]  568 	jreq 1$
      00958B C7               [ 1]  569 	incw x 
      00958C 00 1A            [ 2]  570 	jra skip_string 
      00958E 72               [ 1]  571 1$: incw x 	
      00958F 5C 00 1B 72      [ 2]  572 	subw x,basicptr 
      009593 CF 00 1A         [ 2]  573 	ldw in.w,x 
      009596 5B               [ 4]  574 	ret 
                                    575 
                                    576 ;---------------------
                                    577 ; extract 16 bits  
                                    578 ; address from BASIC
                                    579 ; code 
                                    580 ; input:
                                    581 ;    X    *address
                                    582 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



                                    583 ;    X    address 
                                    584 ;-------------------- 
      001541                        585 get_addr:
      009597 04               [ 2]  586 	ldw x,(x)
      009598 81 5C 00 01      [ 1]  587 	inc in 
      009599 72 5C 00 01      [ 1]  588 	inc in 
      009599 C6               [ 4]  589 	ret 
                                    590 
                                    591 ;--------------------
                                    592 ; extract int24_t  
                                    593 ; value from BASIC 
                                    594 ; code 
                                    595 ; input:
                                    596 ;    X   *integer 
                                    597 ; output:
                                    598 ;    A:X   int24  
                                    599 ;--------------------
      00154B                        600 get_int24:
      00959A 00               [ 1]  601 	ld a,(x)
      00959B 02 C7            [ 2]  602 	ldw x,(1,x)
                                    603 ; skip 3 bytes 
      00959D 00 04 C0 00      [ 1]  604 	inc in 
      0095A1 03 27 0D 01      [ 1]  605 	inc in 
      0095A4 72 5C 00 01      [ 1]  606 	inc in 
      0095A4 CE               [ 4]  607 	ret 
                                    608 
                                    609 ;-------------------------
                                    610 ; get character from 
                                    611 ; BASIC code 
                                    612 ; input:
                                    613 ;    X   *char 
                                    614 ; output:
                                    615 ;    A    char 
                                    616 ;-------------------------
      00155B                        617 get_char:
      0095A5 00               [ 1]  618 	ld a,(x)
      0095A6 05 72 BB 00      [ 1]  619 	inc in  
      0095AA 01               [ 4]  620     ret 
                                    621 
                                    622 ;-----------------------------------
                                    623 ; print a 16 bit integer 
                                    624 ; using variable 'base' as conversion
                                    625 ; format.
                                    626 ; input:
                                    627 ;    X       integer to print 
                                    628 ;   'base'    conversion base 
                                    629 ; output:
                                    630 ;   terminal  
                                    631 ;-----------------------------------
      001561                        632 prt_i16:
      0095AB F6 5C 72 5C      [ 1]  633 	clr acc24 
      0095AF 00 02 81         [ 2]  634 	ldw acc16,x 
      0095B2 A6 10            [ 1]  635 	ld a,#16
      0095B2 F6 27 03         [ 1]  636 	cp a,base
      0095B5 5C 20            [ 1]  637 	jreq prt_acc24  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      0095B7 FA 5C 72 B0 00   [ 2]  638 	btjf acc16,#7,prt_acc24
      0095BC 05 CF 00 01      [ 1]  639 	cpl acc24 ; sign extend 
                                    640 	
                                    641 ;------------------------------------
                                    642 ; print integer in acc24 
                                    643 ; input:
                                    644 ;	acc24 		integer to print 
                                    645 ;	'base' 		numerical base for conversion 
                                    646 ;    A 			signed||unsigned conversion
                                    647 ;  output:
                                    648 ;    A          string length
                                    649 ;------------------------------------
      001578                        650 prt_acc24:
      0095C0 81 FF            [ 1]  651 	ld a,#255  ; signed conversion  
      0095C1 CD 15 96         [ 4]  652     call itoa  ; conversion entier en  .asciz
      0095C1 FE               [ 1]  653 	push a 
      0095C2 72 5C 00         [ 4]  654 	call puts
      0095C5 02               [ 1]  655 	pop a 
      0095C6 72               [ 4]  656     ret	
                                    657 
                                    658 ;---------------------------------------
                                    659 ;  print value at xstack top 
                                    660 ;---------------------------------------
      001583                        661 print_top: 
      001583                        662 	_xpop 
      0095C7 5C 00            [ 1]    1     ld a,(y)
      0095C9 02               [ 1]    2     ldw x,y 
      0095CA 81 01            [ 2]    3     ldw x,(1,x)
      0095CB 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0095CB F6 EE 01         [ 1]  663 	ld acc24,a 
      0095CE 72 5C 00         [ 2]  664 	ldw acc16,x 
      0095D1 02 72 5C         [ 4]  665 	call prt_acc24 
      0095D4 00               [ 4]  666 	ret 
                                    667 
                                    668 ;------------------------------------
                                    669 ; convert integer in acc24 to string
                                    670 ; input:
                                    671 ;   'base'	conversion base 
                                    672 ;	acc24	integer to convert
                                    673 ;   A       0=unsigned, else signed 
                                    674 ; output:
                                    675 ;   X  		pointer to first char of string
                                    676 ;   A       string length
                                    677 ;------------------------------------
                           000001   678 	SIGN=1  ; integer sign 
                           000002   679 	LEN=2 
                           000003   680 	PSTR=3
                           000004   681 	VSIZE=4 ;locals size
      001596                        682 itoa::
      001596                        683 	_vars VSIZE
      0095D5 02 72            [ 2]    1     sub sp,#VSIZE 
      0095D7 5C 00            [ 1]  684 	clr (LEN,sp) ; string length  
      0095D9 02 81            [ 1]  685 	clr (SIGN,sp)    ; sign
      0095DB 4D               [ 1]  686 	tnz A
      0095DB F6 72            [ 1]  687 	jreq 1$ ; unsigned conversion  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      0095DD 5C 00 02         [ 1]  688 	ld a,base 
      0095E0 81 0A            [ 1]  689 	cp a,#10
      0095E1 26 0A            [ 1]  690 	jrne 1$
                                    691 	; base 10 string display with negative sign if bit 23==1
      0095E1 72 5F 00 0D CF   [ 2]  692 	btjf acc24,#7,1$
      0095E6 00 0E            [ 1]  693 	cpl (SIGN,sp)
      0095E8 A6 10 C1         [ 4]  694 	call neg_acc24
      0015B0                        695 1$:
                                    696 ; initialize string pointer 
      0095EB 00 0B 27         [ 2]  697 	ldw x,#tib 
      0095EE 09 72 0F         [ 2]  698 	addw x,#TIB_SIZE
      0095F1 00               [ 2]  699 	decw x 
      0095F2 0E               [ 1]  700 	clr (x)
      0015B8                        701 itoa_loop:
      0095F3 04 72 53         [ 1]  702     ld a,base
      0095F6 00 0D E9         [ 4]  703     call divu24_8 ; acc24/A 
      0095F8 AB 30            [ 1]  704     add a,#'0  ; remainder of division
      0095F8 A6 FF            [ 1]  705     cp a,#'9+1
      0095FA CD 96            [ 1]  706     jrmi 2$
      0095FC 16 88            [ 1]  707     add a,#7 
      0015C6                        708 2$:	
      0095FE CD               [ 2]  709 	decw x
      0095FF 87               [ 1]  710     ld (x),a
      009600 02 84            [ 1]  711 	inc (LEN,sp)
                                    712 	; if acc24==0 conversion done
      009602 81 00 0C         [ 1]  713 	ld a,acc24
      009603 CA 00 0D         [ 1]  714 	or a,acc16
      009603 90 F6 93         [ 1]  715 	or a,acc8
      009606 EE 01            [ 1]  716     jrne itoa_loop
                                    717 	;conversion done, next add '$' or '-' as required
      009608 72 A9 00         [ 1]  718 	ld a,base 
      00960B 03 C7            [ 1]  719 	cp a,#16
      00960D 00 0D            [ 1]  720 	jreq 8$
      00960F CF 00            [ 1]  721 	ld a,(SIGN,sp)
      009611 0E CD            [ 1]  722     jreq 10$
      009613 95 F8            [ 1]  723     ld a,#'-
      009615 81 02            [ 2]  724 	jra 9$ 
      009616                        725 8$:	
      009616 52 04            [ 1]  726 	ld a,#'$ 
      009618 0F               [ 2]  727 9$: decw x
      009619 02               [ 1]  728     ld (x),a
      00961A 0F 01            [ 1]  729 	inc (LEN,sp)
      0015EA                        730 10$:
                                    731 ; add a space
      00961C 4D               [ 2]  732 	decw x 
      00961D 27 11            [ 1]  733 	ld a,#SPACE 
      00961F C6               [ 1]  734 	ld (x),a
      009620 00 0B            [ 1]  735 	ld a,(LEN,sp)
      009622 A1               [ 1]  736 	inc a 
      0015F1                        737 	_drop VSIZE
      009623 0A 26            [ 2]    1     addw sp,#VSIZE 
      009625 0A               [ 4]  738 	ret
                                    739 
                                    740 ;------------------------------------
                                    741 ; convert alpha to uppercase
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



                                    742 ; input:
                                    743 ;    a  character to convert
                                    744 ; output:
                                    745 ;    a  uppercase character
                                    746 ;------------------------------------
      0015F4                        747 to_upper::
      009626 72 0F            [ 1]  748 	cp a,#'a
      009628 00 0D            [ 1]  749 	jrpl 1$
      00962A 05               [ 4]  750 0$:	ret
      00962B 03 01            [ 1]  751 1$: cp a,#'z	
      00962D CD 82            [ 1]  752 	jrugt 0$
      00962F 9D 20            [ 1]  753 	sub a,#32
      009630 81               [ 4]  754 	ret
                                    755 	
                                    756 ;------------------------------------
                                    757 ; convert pad content in integer
                                    758 ; input:
                                    759 ;    x		* .asciz to convert
                                    760 ; output:
                                    761 ;    A:X        int24_t 
                                    762 ;    acc24      int24_t
                                    763 ;------------------------------------
                                    764 	; local variables
                           000001   765 	SIGN=1 ; 1 byte, 
                           000002   766 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003   767 	TEMP=3 ; 1 byte, temporary storage
                           000004   768 	XTEMP=4 ; 2 bytes, preserve X 
                           000005   769 	VSIZE=5 ; 5 bytes reserved for local storage
      001600                        770 atoi24::
      001600                        771 	_vars VSIZE
      009630 AE 16            [ 2]    1     sub sp,#VSIZE 
      009632 68 1C            [ 2]  772 	ldw (XTEMP,sp),x 
                                    773 ; conversion made on xstack 
      009634 00               [ 1]  774 	clr a 
      009635 50               [ 1]  775 	clrw x 
      001606                        776 	_xpush 
      009636 5A 7F 00 03      [ 2]    1     subw y,#CELL_SIZE
      009638 90 F7            [ 1]    2     ld (y),a 
      009638 C6 00 0B         [ 2]    3     ldw (1,y),x 
      00963B CD 83            [ 1]  777 	clr (SIGN,sp)
      00963D 69 AB            [ 1]  778 	ld a,#10
      00963F 30 A1            [ 1]  779 	ld (BASE,sp),a ; default base decimal
      009641 3A 2B            [ 2]  780 	ldw x,(XTEMP,sp)
      009643 02               [ 1]  781 	ld a,(x)
      009644 AB 07            [ 1]  782 	jreq 9$  ; completed if 0
      009646 A1 2D            [ 1]  783 	cp a,#'-
      009646 5A F7            [ 1]  784 	jrne 1$
      009648 0C 02            [ 1]  785 	cpl (SIGN,sp)
      00964A C6 00            [ 2]  786 	jra 2$
      00964C 0D CA            [ 1]  787 1$: cp a,#'$
      00964E 00 0E            [ 1]  788 	jrne 3$
      009650 CA 00            [ 1]  789 	ld a,#16
      009652 0F 26            [ 1]  790 	ld (BASE,sp),a
      009654 E3               [ 1]  791 2$:	incw x
      009655 C6 00            [ 2]  792 	ldw (XTEMP,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      009657 0B               [ 1]  793 	ld a,(x)
      00162E                        794 3$:	; char to digit 
      009658 A1 10            [ 1]  795 	cp a,#'a
      00965A 27 08            [ 1]  796 	jrmi 4$
      00965C 7B 01            [ 1]  797 	sub a,#32
      00965E 27 0A            [ 1]  798 4$:	cp a,#'0
      009660 A6 2D            [ 1]  799 	jrmi 9$
      009662 20 02            [ 1]  800 	sub a,#'0
      009664 A1 0A            [ 1]  801 	cp a,#10
      009664 A6 24            [ 1]  802 	jrmi 5$
      009666 5A F7            [ 1]  803 	sub a,#7
      009668 0C 02            [ 1]  804 	cp a,(BASE,sp)
      00966A 2A 24            [ 1]  805 	jrpl 9$
      00966A 5A A6            [ 1]  806 5$:	ld (TEMP,sp),a
      00966C 20 F7            [ 1]  807 	ld a,(BASE,sp)
      00966E 7B 02 4C         [ 4]  808 	call mulu24_8
      00164B                        809 	_xpush 
      009671 5B 04 81 03      [ 2]    1     subw y,#CELL_SIZE
      009674 90 F7            [ 1]    2     ld (y),a 
      009674 A1 61 2A         [ 2]    3     ldw (1,y),x 
      009677 01               [ 1]  810 	clrw x 
      009678 81 A1            [ 1]  811 	ld a,(TEMP,sp)
      00967A 7A               [ 1]  812 	rlwa x 
      001658                        813 	_xpush 
      00967B 22 FB A0 20      [ 2]    1     subw y,#CELL_SIZE
      00967F 81 F7            [ 1]    2     ld (y),a 
      009680 90 EF 01         [ 2]    3     ldw (1,y),x 
      009680 52 05 1F         [ 4]  814 	call add24 
      009683 04 4F            [ 2]  815 	ldw x,(XTEMP,sp)
      009685 5F 72            [ 2]  816 	jra 2$
      009687 A2 00            [ 1]  817 9$:	tnz (SIGN,sp)
      009689 03 90            [ 1]  818     jreq atoi_exit
      00968B F7 90 EF         [ 4]  819     call neg24
      00166F                        820 atoi_exit:
      00166F                        821 	_xpop 
      00968E 01 0F            [ 1]    1     ld a,(y)
      009690 01               [ 1]    2     ldw x,y 
      009691 A6 0A            [ 2]    3     ldw x,(1,x)
      009693 6B 02 1E 04      [ 2]    4     addw y,#CELL_SIZE 
      009697 F6 27 4E         [ 1]  822 	ld acc24,a 
      00969A A1 2D 26         [ 2]  823 	ldw acc16,x  
      00167E                        824 	_drop VSIZE
      00969D 04 03            [ 2]    1     addw sp,#VSIZE 
      00969F 01               [ 4]  825 	ret
                                    826 
                                    827 
                                    828 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    829 ;;   TINY BASIC  operators,
                                    830 ;;   commands and functions 
                                    831 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    832 
                                    833 ;---------------------------------
                                    834 ; dictionary search 
                                    835 ; input:
                                    836 ;	X 		dictionary entry point, name field  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



                                    837 ;   y		.asciz name to search 
                                    838 ; output:
                                    839 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                    840 ;  X		routine address|TK_OP 
                                    841 ;---------------------------------
                           000001   842 	NLEN=1 ; cmd length 
                           000002   843 	XSAVE=2
                           000004   844 	YSAVE=4
                           000005   845 	VSIZE=5 
      001681                        846 search_dict::
      001681                        847 	_vars VSIZE 
      0096A0 20 08            [ 2]    1     sub sp,#VSIZE 
      0096A2 A1 24            [ 2]  848 	ldw (YSAVE,sp),y 
      001685                        849 search_next:
      0096A4 26 08            [ 2]  850 	ldw (XSAVE,sp),x 
                                    851 ; get name length in dictionary	
      0096A6 A6               [ 1]  852 	ld a,(x)
      0096A7 10 6B            [ 1]  853 	and a,#0xf 
      0096A9 02 5C            [ 1]  854 	ld (NLEN,sp),a  
      0096AB 1F 04            [ 2]  855 	ldw y,(YSAVE,sp) ; name pointer 
      0096AD F6               [ 1]  856 	incw x 
      0096AE                        857 cp_loop:
      0096AE A1 61            [ 1]  858 	ld a,(y)
      0096B0 2B 02            [ 1]  859 	jreq str_match 
      0096B2 A0 20            [ 1]  860 	tnz (NLEN,sp)
      0096B4 A1 30            [ 1]  861 	jreq no_match  
      0096B6 2B               [ 1]  862 	cp a,(x)
      0096B7 30 A0            [ 1]  863 	jrne no_match 
      0096B9 30 A1            [ 1]  864 	incw y 
      0096BB 0A               [ 1]  865 	incw x
      0096BC 2B 06            [ 1]  866 	dec (NLEN,sp)
      0096BE A0 07            [ 2]  867 	jra cp_loop 
      0016A1                        868 no_match:
      0096C0 11 02            [ 2]  869 	ldw x,(XSAVE,sp) 
      0096C2 2A 24 6B         [ 2]  870 	subw x,#2 ; move X to link field
      0096C5 03 7B            [ 1]  871 	push #TK_NONE 
      0096C7 02               [ 2]  872 	ldw x,(x) ; next word link 
      0096C8 CD               [ 1]  873 	pop a ; TK_NONE 
      0096C9 82 BA            [ 1]  874 	jreq search_exit  ; not found  
                                    875 ;try next 
      0096CB 72 A2            [ 2]  876 	jra search_next
      0016AE                        877 str_match:
      0096CD 00 03            [ 2]  878 	ldw x,(XSAVE,sp)
      0096CF 90               [ 1]  879 	ld a,(X)
      0096D0 F7 90            [ 1]  880 	ld (NLEN,sp),a ; needed to test keyword type  
      0096D2 EF 01            [ 1]  881 	and a,#NLEN_MASK 
                                    882 ; move x to procedure address field 	
      0096D4 5F               [ 1]  883 	inc a 
      0096D5 7B 03 02         [ 1]  884 	ld acc8,a 
      0096D8 72 A2 00 03      [ 1]  885 	clr acc16 
      0096DC 90 F7 90 EF      [ 2]  886 	addw x,acc16 
      0096E0 01               [ 2]  887 	ldw x,(x) ; routine address  
                                    888 ;determine keyword type bits 7:4 
      0096E1 CD 81            [ 1]  889 	ld a,(NLEN,sp)
      0096E3 FE 1E            [ 1]  890 	and a,#KW_TYPE_MASK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      0096E5 04               [ 1]  891 	swap a 
      0096E6 20 C2            [ 1]  892 	add a,#128
      0016C9                        893 search_exit: 
      0016C9                        894 	_drop VSIZE 
      0096E8 0D 01            [ 2]    1     addw sp,#VSIZE 
      0096EA 27               [ 4]  895 	ret 
                                    896 
                                    897 ;--------------------------------
                                    898 ;  called by command that should 
                                    899 ;  be invoked only from command 
                                    900 ;  line.
                                    901 ;  Display an error if 
                                    902 ;  invoked from program.
                                    903 ;---------------------------------
      0016CC                        904 cmd_line_only:
      0096EB 03 CD 82 83 05   [ 2]  905 	btjf flags,#FRUN,0$
      0096EF A6 07            [ 1]  906 	ld a,#ERR_CMD_ONLY
      0096EF 90 F6 93         [ 2]  907 	jp tb_error 
      0096F2 EE               [ 4]  908 0$: ret 
                                    909 
                                    910 ;--------------------------------
                                    911 ; called by command/function that 
                                    912 ; should be invoked only at run time
                                    913 ; Display an error if invoked from 
                                    914 ; command line. 
                                    915 ;---------------------------------
      0016D7                        916 runtime_only:
      0096F3 01 72 A9 00 03   [ 2]  917 	btjt flags,#FRUN,0$ 
      0096F8 C7 00            [ 1]  918 	ld a,#ERR_RUN_ONLY
      0096FA 0D CF 00         [ 2]  919 	jp tb_error 
      0096FD 0E               [ 4]  920 0$:	ret 
                                    921 
                                    922 ;---------------------
                                    923 ; check if next token
                                    924 ;  is of expected type 
                                    925 ; input:
                                    926 ;   A 		 expected token attribute
                                    927 ;  ouput:
                                    928 ;   none     if fail call syntax_error 
                                    929 ;--------------------
      0016E2                        930 expect:
      0096FE 5B               [ 1]  931 	push a 
      0096FF 05 81 19         [ 4]  932 	call next_token 
      009701 11 01            [ 1]  933 	cp a,(1,sp)
      009701 52 05            [ 1]  934 	jreq 1$
      009703 17 04 BD         [ 2]  935 	jp syntax_error
      009705 84               [ 1]  936 1$: pop a 
      009705 1F               [ 4]  937 	ret 
                                    938 
                                    939 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    940 ; parse arguments list 
                                    941 ; between ()
                                    942 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016EF                        943 func_args:
      009706 02 F6            [ 1]  944 	ld a,#TK_LPAREN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      009708 A4 0F 6B         [ 4]  945 	call expect 
                                    946 ; expected to continue in arg_list 
                                    947 ; caller must check for TK_RPAREN 
                                    948 
                                    949 ;-------------------------------
                                    950 ; parse embedded BASIC routines 
                                    951 ; arguments list.
                                    952 ; arg_list::=  expr[','expr]*
                                    953 ; all arguments are of int24_t type
                                    954 ; and pushed on stack 
                                    955 ; input:
                                    956 ;   none
                                    957 ; output:
                                    958 ;   xstack{n}   arguments pushed on xstack
                                    959 ;   A 	number of arguments pushed on xstack  
                                    960 ;--------------------------------
      0016F4                        961 arg_list:
      00970B 01 16            [ 1]  962 	push #0
      00970D 04 5C 4D         [ 4]  963 1$:	call condition 
      00970F 4D               [ 1]  964 	tnz a 
      00970F 90 F6            [ 1]  965 	jreq 7$  
      009711 27 1B            [ 1]  966 	inc (1,sp)
      009713 0D 01 27         [ 4]  967 	call next_token 
      009716 0A F1            [ 1]  968 	cp a,#TK_COMMA 
      009718 26 07            [ 1]  969 	jreq 1$ 
      00971A 90 5C            [ 1]  970 	cp a,#TK_RPAREN
      00971C 5C 0A            [ 1]  971 	jreq 7$
      001709                        972 	_unget_token 
      00971E 01 20 EE 00 01   [ 1]    1      mov in,in.saved  
      009721 84               [ 1]  973 7$:	pop a  
      009721 1E               [ 4]  974 	ret 
                                    975 
                                    976 ;--------------------------------
                                    977 ;   BASIC commnands 
                                    978 ;--------------------------------
                                    979 
                                    980 ;--------------------------------
                                    981 ;  arithmetic and relational 
                                    982 ;  routines
                                    983 ;  operators precedence
                                    984 ;  highest to lowest
                                    985 ;  operators on same row have 
                                    986 ;  same precedence and are executed
                                    987 ;  from left to right.
                                    988 ;	'*','/','%'
                                    989 ;   '-','+'
                                    990 ;   '=','>','<','>=','<=','<>','><'
                                    991 ;   '<>' and '><' are equivalent for not equal.
                                    992 ;--------------------------------
                                    993 
                                    994 ;---------------------
                                    995 ; return array element
                                    996 ; address from @(expr)
                                    997 ; input:
                                    998 ;   A 		TK_ARRAY
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



                                    999 ; output:
                                   1000 ;	X 		element address 
                                   1001 ;----------------------
      001710                       1002 get_array_element:
      009722 02 1D 00         [ 4] 1003 	call func_args 
      009725 02 4B            [ 1] 1004 	cp a,#1
      009727 00 FE            [ 1] 1005 	jreq 1$
      009729 84 27 1D         [ 2] 1006 	jp syntax_error
      00171A                       1007 1$: _xpop 
      00972C 20 D7            [ 1]    1     ld a,(y)
      00972E 93               [ 1]    2     ldw x,y 
      00972E 1E 02            [ 2]    3     ldw x,(1,x)
      009730 F6 6B 01 A4      [ 2]    4     addw y,#CELL_SIZE 
                                   1008     ; ignore A, index < 65536 in any case 
                                   1009 	; check for bounds 
      009734 0F 4C C7         [ 2] 1010 	cpw x,array_size 
      009737 00 0F            [ 2] 1011 	jrule 3$
                                   1012 ; bounds {1..array_size}	
      009739 72 5F            [ 1] 1013 2$: ld a,#ERR_BAD_VALUE 
      00973B 00 0E 72         [ 2] 1014 	jp tb_error 
      00973E BB               [ 2] 1015 3$: tnzw  x
      00973F 00 0E            [ 1] 1016 	jreq 2$ 
      009741 FE 7B            [ 1] 1017 	ld a,#CELL_SIZE  
      009743 01               [ 4] 1018 	mul x,a 
      009744 A4 F0 4E         [ 2] 1019 	ldw acc16,x   
      009747 AB 80 68         [ 2] 1020 	ldw x,#tib ; array is below tib 
      009749 72 B0 00 0D      [ 2] 1021 	subw x,acc16 
      009749 5B               [ 4] 1022 	ret 
                                   1023 
                                   1024 
                                   1025 ;***********************************
                                   1026 ;   expression parse,execute 
                                   1027 ;***********************************
                                   1028 ;-----------------------------------
                                   1029 ; factor ::= ['+'|'-'|e]  var | @ |
                                   1030 ;			 integer | function |
                                   1031 ;			 '('relation')' 
                                   1032 ; output:
                                   1033 ;   A       token attribute 
                                   1034 ;   xstack  value  
                                   1035 ; ---------------------------------
                           000001  1036 	NEG=1
                           000001  1037 	VSIZE=1
      00173E                       1038 factor:
      00173E                       1039 	_vars VSIZE 
      00974A 05 81            [ 2]    1     sub sp,#VSIZE 
      00974C 0F 01            [ 1] 1040 	clr (NEG,sp)
      00974C 72 01 00         [ 4] 1041 	call next_token
      00974F 23               [ 1] 1042 	tnz a 
      009750 05 A6            [ 1] 1043 	jrne 1$ 
      009752 07 CC 94         [ 2] 1044 	jp 22$ 
      009755 3F 81            [ 1] 1045 1$:	cp a,#TK_PLUS 
      009757 27 06            [ 1] 1046 	jreq 2$
      009757 72 00            [ 1] 1047 	cp a,#TK_MINUS 
      009759 00 23            [ 1] 1048 	jrne 4$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      00975B 05 A6            [ 1] 1049 	cpl (NEG,sp)
      001755                       1050 2$:	
      00975D 06 CC 94         [ 4] 1051 	call next_token
      001758                       1052 4$:
      009760 3F               [ 1] 1053 	tnz a 
      009761 81 03            [ 1] 1054 	jrne 41$ 
      009762 CC 13 BD         [ 2] 1055 	jp syntax_error  
      00175E                       1056 41$:	
      009762 88 CD            [ 1] 1057 	cp a,#TK_IFUNC 
      009764 95 99            [ 1] 1058 	jrne 5$ 
      001762                       1059 	_get_code_addr 
      009766 11               [ 2]    1         ldw x,(x)
      009767 01 27 03 CC      [ 1]    2         inc in 
      00976B 94 3D 84 81      [ 1]    3         inc in 
      00976F FD               [ 4] 1060 	call (x); result in A:X  
      00976F A6 06            [ 2] 1061 	jra 18$ 
      00176E                       1062 5$:
      009771 CD 97            [ 1] 1063 	cp a,#TK_INTGR
      009773 62 05            [ 1] 1064 	jrne 6$
      009774 CD 15 4B         [ 4] 1065 	call get_int24 ; A:X
      009774 4B 00            [ 2] 1066 	jra 18$
      001777                       1067 6$:
      009776 CD 99            [ 1] 1068 	cp a,#TK_ARRAY
      009778 CD 4D            [ 1] 1069 	jrne 7$
      00977A 27 12 0C         [ 4] 1070 	call get_array_element
      00977D 01 CD            [ 2] 1071     jra 71$
      001780                       1072 7$:
      00977F 95 99            [ 1] 1073 	cp a,#TK_VAR 
      009781 A1 08            [ 1] 1074 	jrne 8$
      009783 27 F1 A1         [ 4] 1075 	call get_addr 
      001787                       1076 71$: ; put value in A:X
      009786 07               [ 1] 1077 	ld a,(x)
      009787 27 05            [ 2] 1078 	ldw x,(1,x)
      009789 55 00            [ 2] 1079 	jra 18$
      00178C                       1080 8$:
      00978B 04 00            [ 1] 1081 	cp a,#TK_LABEL 
      00978D 02 84            [ 1] 1082 	jrne 9$
      00978F 81 89            [ 2] 1083 	pushw y  
      009790 89               [ 2] 1084 	pushw x 
      009790 CD 97 6F         [ 4] 1085 	call skip_string
      009793 A1               [ 2] 1086 	popw x  
      009794 01 27 03         [ 4] 1087 	call strlen 
      009797 CC 94 3D         [ 4] 1088 	call search_name
      00979A 90               [ 2] 1089 	tnzw x 
      00979B F6 93            [ 1] 1090 	jrne 82$ 
      00979D EE 01            [ 2] 1091 	popw y 
      00979F 72 A9            [ 2] 1092 	jra 16$
      0017A4                       1093 82$:
      0097A1 00 03            [ 2] 1094 	popw y   
      0097A3 C3 00 21         [ 4] 1095 	call get_value ; in A:X 
      0097A6 23 05            [ 2] 1096 	jra 18$
      0017AB                       1097 9$: 
      0097A8 A6 0A            [ 1] 1098 	cp a,#TK_CFUNC 
      0097AA CC 94            [ 1] 1099 	jrne 12$
      0017AF                       1100 	_get_code_addr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      0097AC 3F               [ 2]    1         ldw x,(x)
      0097AD 5D 27 F8 A6      [ 1]    2         inc in 
      0097B1 03 42 CF 00      [ 1]    3         inc in 
      0097B5 0E               [ 4] 1101 	call(x)
      0097B6 AE               [ 1] 1102 	clrw x 
      0097B7 16               [ 1] 1103 	rlwa x  ; char>int24 in A:X 
      0097B8 68 72            [ 2] 1104 	jra 18$ 	 
      0017BD                       1105 12$:			
      0097BA B0 00            [ 1] 1106 	cp a,#TK_LPAREN
      0097BC 0E 81            [ 1] 1107 	jrne 16$
      0097BE CD 18 34         [ 4] 1108 	call expression
      0097BE 52 01            [ 1] 1109 	ld a,#TK_RPAREN 
      0097C0 0F 01 CD         [ 4] 1110 	call expect
      0017C9                       1111 	_xpop 
      0097C3 95 99            [ 1]    1     ld a,(y)
      0097C5 4D               [ 1]    2     ldw x,y 
      0097C6 26 03            [ 2]    3     ldw x,(1,x)
      0097C8 CC 98 6E A1      [ 2]    4     addw y,#CELL_SIZE 
      0097CC 10 27            [ 2] 1112 	jra 18$	
      0017D4                       1113 16$:
      0017D4                       1114 	_unget_token 
      0097CE 06 A1 11 26 05   [ 1]    1      mov in,in.saved  
      0097D3 03               [ 1] 1115 	clr a 
      0097D4 01 12            [ 2] 1116 	jra 22$ 
      0097D5                       1117 18$: 
      0097D5 CD 95            [ 1] 1118 	tnz (NEG,sp)
      0097D7 99 03            [ 1] 1119 	jreq 20$
      0097D8 CD 02 15         [ 4] 1120 	call neg_ax   
      0017E3                       1121 20$:
      0017E3                       1122 	_xpush 
      0097D8 4D 26 03 CC      [ 2]    1     subw y,#CELL_SIZE
      0097DC 94 3D            [ 1]    2     ld (y),a 
      0097DE 90 EF 01         [ 2]    3     ldw (1,y),x 
      0097DE A1 81            [ 1] 1123 	ld a,#TK_INTGR
      0017EE                       1124 22$:
      0017EE                       1125 	_drop VSIZE
      0097E0 26 0C            [ 2]    1     addw sp,#VSIZE 
      0097E2 FE               [ 4] 1126 	ret
                                   1127 
                                   1128 
                                   1129 ;-----------------------------------
                                   1130 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   1131 ; output:
                                   1132 ;   A    	token attribute 
                                   1133 ;	xstack		value 
                                   1134 ;-----------------------------------
                           000001  1135 	MULOP=1
                           000001  1136 	VSIZE=1
      0017F1                       1137 term:
      0017F1                       1138 	_vars VSIZE
      0097E3 72 5C            [ 2]    1     sub sp,#VSIZE 
                                   1139 ; first factor 	
      0097E5 00 02 72         [ 4] 1140 	call factor
      0097E8 5C               [ 1] 1141 	tnz a 
      0097E9 00 02            [ 1] 1142 	jreq term_exit  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      0017F9                       1143 term01:	 ; check for  operator '*'|'/'|'%' 
      0097EB FD 20 6E         [ 4] 1144 	call next_token
      0097EE 6B 01            [ 1] 1145 	ld (MULOP,sp),a
      0097EE A1 84            [ 1] 1146 	and a,#TK_GRP_MASK
      0097F0 26 05            [ 1] 1147 	cp a,#TK_GRP_MULT
      0097F2 CD 95            [ 1] 1148 	jreq 1$
      0097F4 CB 20            [ 1] 1149 	ld a,#TK_INTGR
      001806                       1150 	_unget_token 
      0097F6 65 00 03 00 01   [ 1]    1      mov in,in.saved  
      0097F7 20 24            [ 2] 1151 	jra term_exit 
      00180D                       1152 1$:	; got *|/|%
                                   1153 ;second factor
      0097F7 A1 05 26         [ 4] 1154 	call factor
      0097FA 05               [ 1] 1155 	tnz a 
      0097FB CD 97            [ 1] 1156 	jrne 2$ 
      0097FD 90 20 07         [ 2] 1157 	jp syntax_error 
      009800                       1158 2$: ; select operation 	
      009800 A1 85            [ 1] 1159 	ld a,(MULOP,sp) 
      009802 26 08            [ 1] 1160 	cp a,#TK_MULT 
      009804 CD 95            [ 1] 1161 	jrne 3$
                                   1162 ; '*' operator
      009806 C1 02 79         [ 4] 1163 	call mul24 
      009807 20 D8            [ 2] 1164 	jra term01
      009807 F6 EE            [ 1] 1165 3$: cp a,#TK_DIV 
      009809 01 20            [ 1] 1166 	jrne 4$ 
                                   1167 ; '/' operator	
      00980B 50 03 07         [ 4] 1168 	call div24 
      00980C 20 CF            [ 2] 1169 	jra term01 
      00182A                       1170 4$: ; '%' operator
      00980C A1 03 26         [ 4] 1171 	call mod24
      00980F 1B 90            [ 2] 1172 	jra term01 
      00182F                       1173 9$: 
      009811 89 89            [ 1] 1174 	ld a,#TK_INTGR
      001831                       1175 term_exit:
      001831                       1176 	_drop VSIZE 
      009813 CD 95            [ 2]    1     addw sp,#VSIZE 
      009815 B2               [ 4] 1177 	ret 
                                   1178 
                                   1179 ;-------------------------------
                                   1180 ;  expr ::= term [['+'|'-'] term]*
                                   1181 ;  result range {-32768..32767}
                                   1182 ;  output:
                                   1183 ;   A    token attribute 
                                   1184 ;   xstack	 result    
                                   1185 ;-------------------------------
                           000001  1186 	OP=1 
                           000001  1187 	VSIZE=1 
      001834                       1188 expression:
      001834                       1189 	_vars VSIZE 
      009816 85 CD            [ 2]    1     sub sp,#VSIZE 
                                   1190 ; first term 	
      009818 91 39 CD         [ 4] 1191 	call term
      00981B 9B               [ 1] 1192 	tnz a 
      00981C 09 5D            [ 1] 1193 	jreq 9$
      00183C                       1194 1$:	; operator '+'|'-'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      00981E 26 04 90         [ 4] 1195 	call next_token
      009821 85 20            [ 1] 1196 	ld (OP,sp),a 
      009823 30 30            [ 1] 1197 	and a,#TK_GRP_MASK
      009824 A1 10            [ 1] 1198 	cp a,#TK_GRP_ADD 
      009824 90 85            [ 1] 1199 	jreq 2$ 
      001847                       1200 	_unget_token 
      009826 CD 9A CF 20 31   [ 1]    1      mov in,in.saved  
      00982B A6 84            [ 1] 1201 	ld a,#TK_INTGR
      00982B A1 82            [ 2] 1202 	jra 9$ 
      001850                       1203 2$: ; second term 
      00982D 26 0E FE         [ 4] 1204 	call term
      009830 72               [ 1] 1205 	tnz a 
      009831 5C 00            [ 1] 1206 	jrne 3$
      009833 02 72 5C         [ 2] 1207 	jp syntax_error
      001859                       1208 3$:
      009836 00 02            [ 1] 1209 	ld a,(OP,sp)
      009838 FD 5F            [ 1] 1210 	cp a,#TK_PLUS 
      00983A 02 20            [ 1] 1211 	jrne 4$
                                   1212 ; '+' operator	
      00983C 1F 01 7E         [ 4] 1213 	call add24
      00983D 20 D8            [ 2] 1214 	jra 1$ 
      001864                       1215 4$:	; '-' operator 
      00983D A1 06 26         [ 4] 1216 	call sub24
      009840 13 CD            [ 2] 1217 	jra 1$
      001869                       1218 9$:
      001869                       1219 	_drop VSIZE 
      009842 98 B4            [ 2]    1     addw sp,#VSIZE 
      009844 A6               [ 4] 1220 	ret 
                                   1221 
                                   1222 ;---------------------------------------------
                                   1223 ; rel ::= expr rel_op expr
                                   1224 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   1225 ;  relation return  integer , zero is false 
                                   1226 ;  output:
                                   1227 ;	 xstack		value  
                                   1228 ;---------------------------------------------
                           000001  1229 	RELOP=1
                           000001  1230 	VSIZE=1 
      00186C                       1231 relation: 
      00186C                       1232 	_vars VSIZE
      009845 07 CD            [ 2]    1     sub sp,#VSIZE 
      009847 97 62 90         [ 4] 1233 	call expression
      00984A F6               [ 1] 1234 	tnz a 
      00984B 93 EE            [ 1] 1235 	jreq 9$ 
                                   1236 ; expect rel_op or leave 
      00984D 01 72 A9         [ 4] 1237 	call next_token 
      009850 00 03            [ 1] 1238 	ld (RELOP,sp),a 
      009852 20 08            [ 1] 1239 	and a,#TK_GRP_MASK
      009854 A1 30            [ 1] 1240 	cp a,#TK_GRP_RELOP 
      009854 55 00            [ 1] 1241 	jreq 2$
      009856 04 00            [ 1] 1242 	ld a,#TK_INTGR 
      001881                       1243 	_unget_token 
      009858 02 4F 20 12 01   [ 1]    1      mov in,in.saved  
      00985C 20 40            [ 2] 1244 	jra 9$ 
      001888                       1245 2$:	; expect another expression
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      00985C 0D 01 27         [ 4] 1246 	call expression
      00985F 03               [ 1] 1247 	tnz a 
      009860 CD 82            [ 1] 1248 	jrne 3$
      009862 95 13 BD         [ 2] 1249 	jp syntax_error 
      009863                       1250 3$: 
      009863 72 A2 00         [ 4] 1251 	call cp24 
      001894                       1252 	_xpop  
      009866 03 90            [ 1]    1     ld a,(y)
      009868 F7               [ 1]    2     ldw x,y 
      009869 90 EF            [ 2]    3     ldw x,(1,x)
      00986B 01 A6 84 03      [ 2]    4     addw y,#CELL_SIZE 
      00986E 4D               [ 1] 1253 	tnz a 
      00986E 5B 01            [ 1] 1254 	jrmi 4$
      009870 81 0C            [ 1] 1255 	jrne 5$
      009871 35 02 00 0E      [ 1] 1256 	mov acc8,#2 ; i1==i2
      009871 52 01            [ 2] 1257 	jra 6$ 
      0018A8                       1258 4$: ; i1<i2
      009873 CD 97 BE 4D      [ 1] 1259 	mov acc8,#4 
      009877 27 38            [ 2] 1260 	jra 6$
      009879                       1261 5$: ; i1>i2
      009879 CD 95 99 6B      [ 1] 1262 	mov acc8,#1  
      0018B2                       1263 6$: ; 0=false, -1=true 
      00987D 01               [ 1] 1264 	clrw x 
      00987E A4 30 A1         [ 1] 1265 	ld a, acc8  
      009881 20 27            [ 1] 1266 	and a,(RELOP,sp)
      009883 09 A6            [ 1] 1267 	jreq 7$
      009885 84               [ 2] 1268 	cplw x 
      009886 55 00            [ 1] 1269 	ld a,#255 
      0018BD                       1270 7$:	_xpush 
      009888 04 00 02 20      [ 2]    1     subw y,#CELL_SIZE
      00988C 24 F7            [ 1]    2     ld (y),a 
      00988D 90 EF 01         [ 2]    3     ldw (1,y),x 
      00988D CD 97            [ 1] 1271 	ld a,#TK_INTGR
      0018C8                       1272 9$: 
      0018C8                       1273 	_drop VSIZE
      00988F BE 4D            [ 2]    1     addw sp,#VSIZE 
      009891 26               [ 4] 1274 	ret 
                                   1275 
                                   1276 ;-------------------------------------------
                                   1277 ;  AND factor:  [NOT] relation | (condition)
                                   1278 ;  output:
                                   1279 ;     A      TK_INTGR|0
                                   1280 ;-------------------------------------------
                           000001  1281 	NOT_OP=1
      0018CB                       1282 and_factor:
      009892 03 CC            [ 1] 1283 	push #0 
      009894 94 3D 19         [ 4] 1284 0$:	call next_token  
      009896 4D               [ 1] 1285 	tnz a 
      009896 7B 01            [ 1] 1286 	jreq 8$ 
      009898 A1 20            [ 1] 1287 	cp a,#TK_NOT 
      00989A 26 05            [ 1] 1288 	jrne 1$ 
      00989C CD 82            [ 1] 1289 	cpl (NOT_OP,sp)
      00989E F9 20            [ 2] 1290 	jra 0$ 
      0018DB                       1291 1$:	
      0098A0 D8 A1            [ 1] 1292 	cp a,#TK_LPAREN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      0098A2 21 26            [ 1] 1293 	jrne 2$
      0098A4 05 CD 83         [ 4] 1294 	call condition
      0098A7 87 20            [ 1] 1295 	ld a,#TK_RPAREN 
      0098A9 CF 16 E2         [ 4] 1296 	call expect
      0098AA 20 08            [ 2] 1297 	jra 3$
      0018E9                       1298 2$: _unget_token 
      0098AA CD 84 21 20 CA   [ 1]    1      mov in,in.saved  
      0098AF CD 18 6C         [ 4] 1299 	call relation
      0018F1                       1300 3$:
      0098AF A6 84            [ 1] 1301 	tnz (NOT_OP,sp)
      0098B1 27 03            [ 1] 1302 	jreq 8$ 
      0098B1 5B 01 81         [ 4] 1303 	call cpl24
      0098B4                       1304 8$:
      0018F8                       1305 	_drop 1  
      0098B4 52 01            [ 2]    1     addw sp,#1 
      0098B6 CD               [ 4] 1306     ret 
                                   1307 
                                   1308 
                                   1309 ;--------------------------------------------
                                   1310 ;  AND operator as priority over OR||XOR 
                                   1311 ;  format: relation | (condition) [AND relation|(condition)]*
                                   1312 ;          
                                   1313 ;  output:
                                   1314 ;     A     TK_INTGR|0
                                   1315 ;    xtack   value 
                                   1316 ;--------------------------------------------
      0018FB                       1317 and_cond:
      0098B7 98 71 4D         [ 4] 1318 	call and_factor
      0098BA 27               [ 1] 1319 	tnz a 
      0098BB 2D 4B            [ 1] 1320 	jreq 9$  
      0098BC CD 15 19         [ 4] 1321 1$: call next_token 
      0098BC CD               [ 1] 1322 	tnz a 
      0098BD 95 99            [ 1] 1323 	jreq 6$ 
      0098BF 6B 01            [ 1] 1324 	cp a,#TK_AND 
      0098C1 A4 30            [ 1] 1325 	jreq 3$
      00190B                       1326 	_unget_token 
      0098C3 A1 10 27 09 55   [ 1]    1      mov in,in.saved  
      0098C8 00 04            [ 2] 1327 	jra 6$ 
      0098CA 00 02 A6         [ 4] 1328 3$:	call and_factor  
      0098CD 84               [ 1] 1329 	tnz a 
      0098CE 20 19            [ 1] 1330 	jrne 4$
      0098D0 CC 13 BD         [ 2] 1331 	jp syntax_error 
      00191B                       1332 4$:	
      00191B                       1333 	_xpop 
      0098D0 CD 98            [ 1]    1     ld a,(y)
      0098D2 71               [ 1]    2     ldw x,y 
      0098D3 4D 26            [ 2]    3     ldw x,(1,x)
      0098D5 03 CC 94 3D      [ 2]    4     addw y,#CELL_SIZE 
      0098D9 C7 00 0C         [ 1] 1334 	ld acc24,a 
      0098D9 7B 01 A1         [ 2] 1335 	ldw acc16,x
      00192A                       1336 	_xpop 
      0098DC 10 26            [ 1]    1     ld a,(y)
      0098DE 05               [ 1]    2     ldw x,y 
      0098DF CD 81            [ 2]    3     ldw x,(1,x)
      0098E1 FE 20 D8 03      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      0098E4 C4 00 0C         [ 1] 1337 	and a,acc24 
      0098E4 CD               [ 1] 1338 	rlwa x 
      0098E5 82 1B 20         [ 1] 1339 	and a,acc16 
      0098E8 D3               [ 1] 1340 	rlwa x 
      0098E9 C4 00 0E         [ 1] 1341 	and a,acc8 
      0098E9 5B               [ 1] 1342 	rlwa x
      00193F                       1343 	_xpush
      0098EA 01 81 00 03      [ 2]    1     subw y,#CELL_SIZE
      0098EC 90 F7            [ 1]    2     ld (y),a 
      0098EC 52 01 CD         [ 2]    3     ldw (1,y),x 
      0098EF 98 B4            [ 2] 1344 	jra 1$  
      0098F1 4D 27            [ 1] 1345 6$: ld a,#TK_INTGR 
      0098F3 54               [ 4] 1346 9$:	ret 	 
                                   1347 
                                   1348 
                                   1349 ;--------------------------------------------
                                   1350 ; condition for IF and UNTIL 
                                   1351 ; operators: OR,XOR 
                                   1352 ; format:  and_cond [ OP and_cond ]* 
                                   1353 ; output:
                                   1354 ;    A        INTGR|0 
                                   1355 ;    xstack   value 
                                   1356 ;--------------------------------------------
                           000001  1357 	ATMP=1
                           000002  1358 	OP=2
                           000002  1359 	VSIZE=2 
      00194D                       1360 condition:
      00194D                       1361 	_vars VSIZE 
      0098F4 CD 95            [ 2]    1     sub sp,#VSIZE 
      0098F6 99 6B 01         [ 4] 1362 	call and_cond
      0098F9 A4               [ 1] 1363 	tnz a 
      0098FA 30 A1            [ 1] 1364 	jreq 9$ 
      0098FC 30 27 09         [ 4] 1365 1$:	call next_token 
      0098FF A6 84            [ 1] 1366 	cp a,#TK_OR 
      009901 55 00            [ 1] 1367 	jreq 2$
      009903 04 00            [ 1] 1368 	cp a,#TK_XOR
      009905 02 20            [ 1] 1369 	jreq 2$ 
      001960                       1370 	_unget_token 
      009907 40 00 03 00 01   [ 1]    1      mov in,in.saved  
      009908 20 55            [ 2] 1371 	jra 8$ 
      009908 CD 98            [ 1] 1372 2$:	ld (OP,sp),a ; TK_OR|TK_XOR 
      00990A B4 4D 26         [ 4] 1373 	call and_cond
      00990D 03 CC            [ 1] 1374 	cp a,#TK_INTGR 
      00990F 94 3D            [ 1] 1375 	jreq 3$
      009911 CC 13 BD         [ 2] 1376 	jp syntax_error 
      001973                       1377 3$:	 
      001973                       1378 	_xpop  ; rigth arg 
      009911 CD 82            [ 1]    1     ld a,(y)
      009913 38               [ 1]    2     ldw x,y 
      009914 90 F6            [ 2]    3     ldw x,(1,x)
      009916 93 EE 01 72      [ 2]    4     addw y,#CELL_SIZE 
      00991A A9 00 03         [ 1] 1379 	ld acc24,a 
      00991D 4D 2B 08         [ 2] 1380 	ldw acc16,x 
      001982                       1381 	_xpop  ; left arg  
      009920 26 0C            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      009922 35               [ 1]    2     ldw x,y 
      009923 02 00            [ 2]    3     ldw x,(1,x)
      009925 0F 20 0A 03      [ 2]    4     addw y,#CELL_SIZE 
      009928 6B 01            [ 1] 1382 	ld (ATMP,sp),a 
      009928 35 04            [ 1] 1383 	ld a,(OP,sp)
      00992A 00 0F            [ 1] 1384 	cp a,#TK_XOR 
      00992C 20 04            [ 1] 1385 	jreq 5$ 
      00992E                       1386 4$: ; A:X OR acc24   
      00992E 35 01            [ 1] 1387 	ld a,(ATMP,sp)
      009930 00 0F 0C         [ 1] 1388 	or a,acc24 
      009932 02               [ 1] 1389 	rlwa x 
      009932 5F C6 00         [ 1] 1390 	or a,acc16 
      009935 0F               [ 1] 1391 	rlwa x 
      009936 14 01 27         [ 1] 1392 	or a,acc8 
      009939 03               [ 1] 1393 	rlwa x 
      00993A 53 A6            [ 2] 1394 	jra 6$  
      0019A3                       1395 5$: ; A:X XOR acc24 
      00993C FF 72            [ 1] 1396 	ld a,(ATMP,sp)
      00993E A2 00 03         [ 1] 1397 	xor a,acc24 
      009941 90               [ 1] 1398 	rlwa x 
      009942 F7 90 EF         [ 1] 1399 	xor a,acc16 
      009945 01               [ 1] 1400 	rlwa x 
      009946 A6 84 0E         [ 1] 1401 	xor a,acc8 
      009948 02               [ 1] 1402 	rlwa x 
      0019B1                       1403 6$: _xpush
      009948 5B 01 81 03      [ 2]    1     subw y,#CELL_SIZE
      00994B 90 F7            [ 1]    2     ld (y),a 
      00994B 4B 00 CD         [ 2]    3     ldw (1,y),x 
      00994E 95 99            [ 2] 1404 	jra 1$ 
      009950 4D 27            [ 1] 1405 8$:	ld a,#TK_INTGR 
      0019BE                       1406 9$:	_drop VSIZE 
      009952 25 A1            [ 2]    1     addw sp,#VSIZE 
      009954 87               [ 4] 1407 	ret 
                                   1408 
                                   1409 
                                   1410 ;--------------------------------------------
                                   1411 ; BASIC: HEX 
                                   1412 ; select hexadecimal base for integer print
                                   1413 ;---------------------------------------------
      0019C1                       1414 hex_base:
      009955 26 04 03 01      [ 1] 1415 	mov base,#16 
      009959 20               [ 4] 1416 	ret 
                                   1417 
                                   1418 ;--------------------------------------------
                                   1419 ; BASIC: DEC 
                                   1420 ; select decimal base for integer print
                                   1421 ;---------------------------------------------
      0019C6                       1422 dec_base:
      00995A F2 0A 00 0A      [ 1] 1423 	mov base,#10
      00995B 81               [ 4] 1424 	ret 
                                   1425 
                                   1426 ;------------------------
                                   1427 ; BASIC: FREE 
                                   1428 ; return free size in RAM 
                                   1429 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



                                   1430 ;   A:x		size 
                                   1431 ;--------------------------
      0019CB                       1432 free:
      00995B A1               [ 1] 1433 	clr a 
      00995C 06 26 0A         [ 2] 1434 	ldw x,#tib 
      00995F CD 99 CD A6      [ 2] 1435 	subw x,dvar_end 
      009963 07               [ 4] 1436 	ret 
                                   1437 
                                   1438 ;------------------------------
                                   1439 ; BASIC: SIZE 
                                   1440 ; command that print 
                                   1441 ; program start addres and size 
                                   1442 ;------------------------------
      0019D4                       1443 cmd_size:
      009964 CD 97 62         [ 1] 1444 	push base 
      009967 20 08 55         [ 2] 1445 	ldw x,#PROG_ADDR 
      00996A 00 04 00         [ 4] 1446 	call puts 
      00996D 02 CD 98         [ 2] 1447 	ldw x,txtbgn     
      009970 EC 10 00 0A      [ 1] 1448 	mov base,#16 
      009971 CD 15 61         [ 4] 1449 	call prt_i16
      009971 0D 01 27         [ 1] 1450 	pop base 
      009974 03 CD 82         [ 2] 1451 	ldw x,#PROG_SIZE 
      009977 7A 06 82         [ 4] 1452 	call puts 
      009978 CE 00 1D         [ 2] 1453 	ldw x,txtend 
      009978 5B 01 81 1B      [ 2] 1454 	subw x,txtbgn 
      00997B CD 15 61         [ 4] 1455 	call prt_i16
      00997B CD 99 4B         [ 2] 1456 	ldw x,#STR_BYTES 
      00997E 4D 27 4B         [ 4] 1457 	call puts  
      009981 CD               [ 4] 1458 	ret 
                                   1459 
                                   1460 
                                   1461 ;------------------------
                                   1462 ; BASIC: UBOUND  
                                   1463 ; return array variable size 
                                   1464 ; and set 'array_size' variable 
                                   1465 ; output:
                                   1466 ;   A:X 	array_size
                                   1467 ;--------------------------
      001A01                       1468 ubound:
      009982 95 99 4D         [ 4] 1469 	call free 
      009985 27 43            [ 1] 1470 	ld a,#CELL_SIZE 
      009987 A1               [ 2] 1471 	div x,a 
      009988 88 27 07         [ 2] 1472 	ldw array_size,x
      00998B 55               [ 1] 1473 	clr a 
      00998C 00               [ 4] 1474 	ret 
                                   1475 
                                   1476 ;-----------------------------
                                   1477 ; BASIC: LET var=expr 
                                   1478 ; variable assignement 
                                   1479 ; output:
                                   1480 ;   A 		TK_NONE 
                                   1481 ;-----------------------------
      001A0C                       1482 let::
      00998D 04 00 02         [ 4] 1483 	call next_token 
      009990 20 38            [ 1] 1484 	cp a,#TK_VAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      009992 CD 99            [ 1] 1485 	jreq let_var
      009994 4B 4D            [ 1] 1486 	cp a,#TK_ARRAY 
      009996 26 03            [ 1] 1487 	jreq  let_array
      009998 CC 94 3D         [ 2] 1488 	jp syntax_error
      00999B                       1489 let_array:
      00999B 90 F6 93         [ 4] 1490 	call get_array_element
      00999E EE 01            [ 2] 1491 	jra let_eval 
      001A1F                       1492 let_var:
      0099A0 72 A9 00         [ 4] 1493 	call get_addr
      001A22                       1494 let_eval:
      0099A3 03 C7 00         [ 2] 1495 	ldw ptr16,x  ; variable address 
      0099A6 0D CF 00         [ 4] 1496 	call next_token 
      0099A9 0E 90            [ 1] 1497 	cp a,#TK_EQUAL
      0099AB F6 93            [ 1] 1498 	jreq 1$
      0099AD EE 01 72         [ 2] 1499 	jp syntax_error
      001A2F                       1500 1$:	
      0099B0 A9 00 03         [ 4] 1501 	call condition   
      0099B3 C4 00            [ 1] 1502 	cp a,#TK_INTGR 
      0099B5 0D 02            [ 1] 1503 	jreq 2$
      0099B7 C4 00 0E         [ 2] 1504 	jp syntax_error
      001A39                       1505 2$:	
      001A39                       1506 	_xpop ; value 
      0099BA 02 C4            [ 1]    1     ld a,(y)
      0099BC 00               [ 1]    2     ldw x,y 
      0099BD 0F 02            [ 2]    3     ldw x,(1,x)
      0099BF 72 A2 00 03      [ 2]    4     addw y,#CELL_SIZE 
      001A42                       1507 3$:
      0099C3 90 F7 90 EF      [ 4] 1508 	ld [ptr16],a
      0099C7 01 20 B7 A6      [ 1] 1509 	inc ptr8  
      0099CB 84 81 00 19      [ 5] 1510 	ldw [ptr16],x 
      0099CD 81               [ 4] 1511 	ret 
                                   1512 
                                   1513 
                                   1514 ;--------------------------
                                   1515 ; return constant/dvar value 
                                   1516 ; from it's record address
                                   1517 ; input:
                                   1518 ;	X	*const record 
                                   1519 ; output:
                                   1520 ;   A:X   const  value
                                   1521 ;--------------------------
      001A4F                       1522 get_value: ; -- i 
      0099CD 52               [ 1] 1523 	ld a,(x) ; record size 
      0099CE 02 CD            [ 1] 1524 	and a,#REC_LEN_MASK 
      0099D0 99 7B            [ 1] 1525 	sub a,#CELL_SIZE ; * value 
      0099D2 4D               [ 1] 1526 	push a 
      0099D3 27 69            [ 1] 1527 	push #0 
      0099D5 CD 95 99         [ 2] 1528 	addw x,(1,sp)
      0099D8 A1               [ 1] 1529 	ld a,(x)
      0099D9 89 27            [ 2] 1530 	ldw x,(1,x)
      001A5D                       1531 	_drop 2
      0099DB 0B A1            [ 2]    1     addw sp,#2 
      0099DD 8A               [ 4] 1532 	ret 
                                   1533 
                                   1534 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



                                   1535 ;--------------------------
                                   1536 ; BASIC: EEFREE 
                                   1537 ; eeprom_free 
                                   1538 ; search end of data  
                                   1539 ; in EEPROM 
                                   1540 ; input:
                                   1541 ;    none 
                                   1542 ; output:
                                   1543 ;    A:X     address free
                                   1544 ;-------------------------
      001A60                       1545 func_eefree:
      0099DE 27 07 55         [ 2] 1546 	ldw x,#EEPROM_BASE 
      0099E1 00 04 00 02      [ 1] 1547 1$:	mov acc8,#8 ; count 8 consecutive zeros
      0099E5 20 55 6B         [ 2] 1548     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      0099E8 02 CD            [ 1] 1549 	jruge 8$ ; no free space 
      0099EA 99               [ 1] 1550 2$: ld a,(x)
      0099EB 7B A1            [ 1] 1551 	jrne 3$
      0099ED 84               [ 1] 1552 	incw x 
      0099EE 27 03 CC 94      [ 1] 1553 	dec acc8 
      0099F2 3D F6            [ 1] 1554 	jrne 2$
      0099F3 1D 00 08         [ 2] 1555 	subw x,#8 
      0099F3 90 F6            [ 2] 1556 	jra 9$  
      0099F5 93               [ 1] 1557 3$: ld a,(x)
      0099F6 EE               [ 1] 1558 	incw x
      0099F7 01               [ 1] 1559 	tnz a  
      0099F8 72 A9            [ 1] 1560 	jrne 3$
      0099FA 00               [ 2] 1561 	decw x   
      0099FB 03 C7            [ 2] 1562 	jra 1$ 
      0099FD 00               [ 1] 1563 8$: clrw x ; no free space 
      0099FE 0D               [ 1] 1564 9$: clr a 
      0099FF CF 00 0E         [ 2] 1565 	ldw free_eeprom,x ; save in system variable 
      009A02 90               [ 4] 1566 	ret 
                                   1567 
                                   1568  
                                   1569 ;--------------------------
                                   1570 ; search constant/dim_var name 
                                   1571 ; format of record  
                                   1572 ;   .byte record length 
                                   1573 ;         = strlen(name)+5 
                                   1574 ;   .asciz name (variable length)
                                   1575 ;   .int24 value (3 bytes )
                                   1576 ; a constant record use 7+ bytes
                                   1577 ; constants are saved in EEPROM  
                                   1578 ; input:
                                   1579 ;    A     name_len 
                                   1580 ;    X     *name
                                   1581 ; output:
                                   1582 ;    X     address|0
                                   1583 ; use:
                                   1584 ;   A,Y, acc16 
                                   1585 ;-------------------------
                           000001  1586 	NAMEPTR=1 ; target name pointer 
                           000003  1587 	WLKPTR=3   ; walking pointer in EEPROM||RAM 
                           000005  1588 	NLEN=5  ;  length of target name 
                           000007  1589 	LIMIT=7   ; search area limit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



                           000008  1590 	VSIZE=8  
      001A89                       1591 search_name:
      009A03 F6 93            [ 2] 1592 	pushw y 
      001A8B                       1593 	_vars VSIZE
      009A05 EE 01            [ 2]    1     sub sp,#VSIZE 
      009A07 72 A9 00 03      [ 1] 1594 	clr acc16 
      009A0B 6B 01            [ 1] 1595 	ld (NLEN,sp),a    
      009A0D 7B 02            [ 2] 1596 	ldw (NAMEPTR,sp),x
      009A0F A1 8A 27         [ 2] 1597 	ldw x,dvar_end 
      009A12 10 07            [ 2] 1598 	ldw (LIMIT,sp),x 
      009A13 90 CE 00 2F      [ 2] 1599 	ldw y,dvar_bgn
      009A13 7B 01            [ 2] 1600 1$:	ldw (WLKPTR,sp),y
      009A15 CA               [ 1] 1601 	ldw x,y 
      009A16 00 0D            [ 2] 1602 	cpw x, (LIMIT,sp) 
      009A18 02 CA            [ 1] 1603 	jruge 7$ ; no match found 
      009A1A 00 0E            [ 1] 1604 	ld a,(y)
      009A1C 02 CA            [ 1] 1605 	sub a,#REC_XTRA_BYTES
      009A1E 00 0F            [ 1] 1606 	and a,#NAME_MAX_LEN
      009A20 02 20            [ 1] 1607 	cp a,(NLEN,sp)
      009A22 0E 09            [ 1] 1608 	jrne 2$ 
      009A23 90 5C            [ 1] 1609 	incw y 
      009A23 7B 01            [ 2] 1610 	ldw x,(NAMEPTR,sp)
      009A25 C8 00 0D         [ 4] 1611 	call strcmp
      009A28 02 C8            [ 1] 1612 	jrne 8$ ; match found 
      001AB8                       1613 2$: ; skip this one 	
      009A2A 00 0E            [ 2] 1614 	ldW Y,(WLKPTR,sp)
      009A2C 02 C8            [ 1] 1615 	ld a,(y)
      009A2E 00 0F            [ 1] 1616 	and a,#REC_LEN_MASK  
      009A30 02 72 A2         [ 1] 1617 	ld acc8,a 
      009A33 00 03 90 F7      [ 2] 1618 	addw y,acc16 
      009A37 90 EF            [ 2] 1619 	jra 1$  
      001AC7                       1620 7$: ; no match found 
      009A39 01 20            [ 1] 1621 	clr (WLKPTR,sp)
      009A3B 99 A6            [ 1] 1622 	clr (WLKPTR+1,sp)
      001ACB                       1623 8$: ; match found 
      009A3D 84 5B            [ 2] 1624 	ldw x,(WLKPTR,sp) ; record address 
      001ACD                       1625 9$:	_DROP VSIZE
      009A3F 02 81            [ 2]    1     addw sp,#VSIZE 
      009A41 90 85            [ 2] 1626 	popw y 
      009A41 35               [ 4] 1627 	 ret 
                                   1628 
                                   1629 ;--------------------------------------------
                                   1630 ; BASIC: CONST name=value [, name=value]*
                                   1631 ; define constant(s) saved in EEPROM
                                   1632 ; share most of his code with cmd_dim 
                                   1633 ;--------------------------------------------
                           000001  1634 	VAR_NAME=1 
                           000003  1635 	REC_LEN=3
                           000005  1636 	RONLY=5
                           000005  1637 	VSIZE=5
      001AD2                       1638 cmd_const:
      009A42 10 00 0B         [ 4] 1639 	call runtime_only
      001AD5                       1640 	_vars VSIZE 
      009A45 81 05            [ 2]    1     sub sp,#VSIZE 
      009A46 A6 80            [ 1] 1641 	ld a,#128 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      009A46 35 0A            [ 1] 1642 	ld (RONLY,sp),a 
      009A48 00 0B            [ 1] 1643 	clr (REC_LEN,sp)
      009A4A 81 09            [ 2] 1644 	jra cmd_dim2 ; shared code with cmd_dim  
                                   1645 
                                   1646 ;---------------------------------
                                   1647 ; BASIC: DIM var_name [var_name]* 
                                   1648 ; create named variables at end 
                                   1649 ; of BASIC program. 
                                   1650 ; These variables are initialized 
                                   1651 ; to 0. 
                                   1652 ; record format same ast CONST 
                                   1653 ; but r/w because stored in RAM 
                                   1654 ;---------------------------------
      009A4B                       1655 cmd_dim:
      009A4B 4F AE 16         [ 4] 1656 	call runtime_only
      001AE2                       1657 cmd_dim1:	
      001AE2                       1658 	_vars VSIZE
      009A4E 68 72            [ 2]    1     sub sp,#VSIZE 
      009A50 B0 00            [ 1] 1659 	clr (REC_LEN,sp )
      009A52 32 81            [ 1] 1660 	clr (RONLY,sp)
      009A54                       1661 cmd_dim2: 
      009A54 3B 00 0B         [ 4] 1662 0$:	call next_token 
      009A57 AE 9C            [ 1] 1663 	cp a,#TK_LABEL  
      009A59 37 CD            [ 1] 1664 	jreq 1$ 
      009A5B 87 02 CE         [ 2] 1665 	jp syntax_error 
      009A5E 00 1C            [ 2] 1666 1$: ldw (VAR_NAME,sp),x ; name pointer 
      009A60 35 10 00         [ 4] 1667 	call strlen
      009A63 0B CD            [ 1] 1668 	add a,#REC_XTRA_BYTES
      009A65 95 E1            [ 1] 1669 	ld (REC_LEN+1,sp),a
      009A67 32 00 0B         [ 4] 1670 	call skip_string 
      009A6A AE 9C            [ 1] 1671 	ld a,(REC_LEN+1,sp)
      009A6C 49 CD            [ 1] 1672 	sub a,#REC_XTRA_BYTES
      009A6E 87 02            [ 2] 1673 	ldw x,(VAR_NAME,sp) 
      009A70 CE 00 1E         [ 4] 1674 	call search_name  
      009A73 72               [ 2] 1675 	tnzw x 
      009A74 B0 00            [ 1] 1676 	jreq 2$
      009A76 1C CD            [ 1] 1677 	ld a,#ERR_DUPLICATE
      009A78 95 E1 AE         [ 2] 1678 	jp tb_error  
      009A7B 9C 5A CD         [ 2] 1679 2$:	ldw x,dvar_end 
      009A7E 87 02            [ 1] 1680 	ld a,(REC_LEN+1,sp)
      009A80 81 05            [ 1] 1681 	or a,(RONLY,sp)
      009A81 F7               [ 1] 1682 	ld (x),a 
      009A81 CD               [ 1] 1683 	incw x 
      009A82 9A 4B            [ 2] 1684 	pushw y 
      009A84 A6 03            [ 2] 1685 	ldw y,(VAR_NAME+2,sp)
      009A86 62 CF 00         [ 4] 1686 	call strcpy
      009A89 21 4F            [ 2] 1687 	popw y 
      009A8B 81               [ 2] 1688 	decw x
      009A8C 72 FB 03         [ 2] 1689 	addw x,(REC_LEN,sp)
      009A8C CD 95 99         [ 2] 1690 	ldw dvar_end,x 
      009A8F A1 85 27         [ 2] 1691 	subw x,#CELL_SIZE  
      009A92 0C               [ 1] 1692 	clr (x)
      009A93 A1 05            [ 1] 1693 	clr (1,x)  
      009A95 27 03            [ 1] 1694 	clr (2,x)
      009A97 CC 94 3D         [ 4] 1695 4$: call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      009A9A A1 08            [ 1] 1696 	cp a,#TK_COMMA 
      009A9A CD 97            [ 1] 1697 	jreq 0$ 
      009A9C 90 20            [ 1] 1698 	cp a,#TK_EQUAL 
      009A9E 03 2A            [ 1] 1699 	jrne 8$
                                   1700 ; initialize variable 
      009A9F CD 19 4D         [ 4] 1701 	call condition 
      009A9F CD 95            [ 1] 1702 	cp a,#TK_INTGR
      009AA1 C1 03            [ 1] 1703 	jreq 5$
      009AA2 CC 13 BD         [ 2] 1704 	jp syntax_error
      009AA2 CF 00 1A         [ 2] 1705 5$: ldw x,dvar_end 
      009AA5 CD 95 99         [ 2] 1706 	subw x,#CELL_SIZE 
      009AA8 A1 32 27         [ 2] 1707 	ldw ptr16,x 
      001B4E                       1708 	_xpop 
      009AAB 03 CC            [ 1]    1     ld a,(y)
      009AAD 94               [ 1]    2     ldw x,y 
      009AAE 3D 01            [ 2]    3     ldw x,(1,x)
      009AAF 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009AAF CD 99 CD A1      [ 4] 1709 	ld [ptr16],a 
      009AB3 84 27 03 CC      [ 1] 1710 	inc ptr8 
      009AB7 94 3D 00 19      [ 5] 1711 	ldw [ptr16],x 
      009AB9 20 CB            [ 2] 1712 	jra 4$ 
      001B65                       1713 8$:	
      001B65                       1714 	_unget_token 	
      009AB9 90 F6 93 EE 01   [ 1]    1      mov in,in.saved  
      001B6A                       1715 	_drop VSIZE 
      009ABE 72 A9            [ 2]    1     addw sp,#VSIZE 
      009AC0 00 03 01         [ 4] 1716 	call ubound 
      009AC2 81               [ 4] 1717 	ret 
                                   1718 
                                   1719 
                                   1720 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1721 ; return program size 
                                   1722 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001B70                       1723 prog_size:
      009AC2 72 C7 00         [ 2] 1724 	ldw x,txtend 
      009AC5 1A 72 5C 00      [ 2] 1725 	subw x,txtbgn 
      009AC9 1B               [ 4] 1726 	ret 
                                   1727 
                                   1728 ;----------------------------
                                   1729 ; print program information 
                                   1730 ;---------------------------
      001B78                       1731 program_info: 
      009ACA 72 CF 00         [ 2] 1732 	ldw x,#PROG_ADDR 
      009ACD 1A 81 82         [ 4] 1733 	call puts 
      009ACF CE 00 1B         [ 2] 1734 	ldw x,txtbgn 
      009ACF F6 A4 1F A0      [ 1] 1735 	mov base,#16 
      009AD3 03 88 4B         [ 4] 1736 	call prt_i16
      009AD6 00 72 FB 01      [ 1] 1737 	mov base,#10  
      009ADA F6 EE 01         [ 2] 1738 	ldw x,#PROG_SIZE
      009ADD 5B 02 81         [ 4] 1739 	call puts 
      009AE0 CD 1B 70         [ 4] 1740 	call prog_size 
      009AE0 AE 40 00         [ 4] 1741 	call prt_i16 
      009AE3 35 08 00         [ 2] 1742 	ldw x,#STR_BYTES 
      009AE6 0F A3 47         [ 4] 1743 	call puts
      009AE9 F8 24 17         [ 2] 1744 	ldw x,txtbgn
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      009AEC F6 26 0C         [ 2] 1745 	cpw x,#app 
      009AEF 5C 72            [ 1] 1746 	jrult 2$
      009AF1 5A 00 0F         [ 2] 1747 	ldw x,#FLASH_MEM 
      009AF4 26 F6            [ 2] 1748 	jra 3$
      009AF6 1D 00 08         [ 2] 1749 2$: ldw x,#RAM_MEM 	 
      009AF9 20 09 F6         [ 4] 1750 3$:	call puts 
      009AFC 5C 4D            [ 1] 1751 	ld a,#CR 
      009AFE 26 FB 5A         [ 4] 1752 	call putc
      009B01 20               [ 4] 1753 	ret 
                                   1754 
      009B02 E0 5F 4F CF 00 24 81  1755 PROG_ADDR: .asciz "program address: "
             20 61 64 64 72 65 73
             73 3A 20 00
      009B09 2C 20 70 72 6F 67 72  1756 PROG_SIZE: .asciz ", program size: "
             61 6D 20 73 69 7A 65
             3A 20 00
      009B09 90 89 52 08 72 5F 00  1757 STR_BYTES: .asciz " bytes" 
      009B10 0E 6B 05 1F 01 CE 00  1758 FLASH_MEM: .asciz " in FLASH memory" 
             32 1F 07 90 CE 00 30
             17 03 93
      009B21 13 07 24 22 90 F6 A0  1759 RAM_MEM:   .asciz " in RAM memory" 
             05 A4 0F 11 05 26 09
             90
                                   1760 
                                   1761 
                                   1762 ;----------------------------
                                   1763 ; BASIC: LIST [[start][-end]]
                                   1764 ; list program lines 
                                   1765 ; form start to end 
                                   1766 ; if empty argument list then 
                                   1767 ; list all.
                                   1768 ;----------------------------
                           000001  1769 	FIRST=1
                           000003  1770 	LAST=3 
                           000005  1771 	LN_PTR=5
                           000006  1772 	VSIZE=6 
      001C01                       1773 cmd_list:
      009B30 5C 1E 01         [ 4] 1774 	call cmd_line_only
      009B33 CD 91 44         [ 4] 1775 	call prog_size 
      009B36 26 13            [ 1] 1776 	jrugt 3$
      009B38 81               [ 4] 1777 	ret 
      001C0A                       1778 3$: _vars VSIZE
      009B38 16 03            [ 2]    1     sub sp,#VSIZE 
      009B3A 90 F6 A4         [ 2] 1779 	ldw x,txtbgn 
      009B3D 1F C7            [ 2] 1780 	ldw (LN_PTR,sp),x 
      009B3F 00               [ 2] 1781 	ldw x,(x) 
      009B40 0F 72            [ 2] 1782 	ldw (FIRST,sp),x ; list from first line 
      009B42 B9 00 0E         [ 2] 1783 	ldw x,#MAX_LINENO ; biggest line number 
      009B45 20 D7            [ 2] 1784 	ldw (LAST,sp),x 
      009B47 CD 15 19         [ 4] 1785 	call next_token 
      009B47 0F 03            [ 1] 1786 	cp a,#TK_INTGR
      009B49 0F 04            [ 1] 1787 	jreq start_from 
      009B4B                       1788 is_minus: 	
      009B4B 1E 03            [ 1] 1789 	cp a,#TK_MINUS 
      009B4D 5B 08            [ 1] 1790 	jreq end_at_line
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      009B4F 90 85            [ 1] 1791 	cp a,#TK_NONE
      009B51 81 49            [ 1] 1792 	jreq list_loop
      009B52 A1 09            [ 1] 1793 	cp a,#TK_COLON 
      009B52 CD 97            [ 1] 1794 	jreq list_loop
      009B54 57 52 05         [ 2] 1795 	jp syntax_error
      001C2F                       1796 start_from:	 
      009B57 A6 80 6B         [ 4] 1797 	call get_int24
      009B5A 05 0F            [ 2] 1798 	ldw (FIRST,sp),x	
      001C34                       1799 lines_skip:
      009B5C 03 20            [ 2] 1800 	pushw y 
      009B5E 09               [ 1] 1801 	clr a 
      009B5F CD 09 6B         [ 4] 1802 	call search_lineno 
      009B5F CD               [ 2] 1803 	tnzw x 
      009B60 97 57            [ 1] 1804 	jrne 1$
      009B62 93               [ 1] 1805 	ldw x,y 
      009B62 52 05            [ 2] 1806 1$:	popw y 
      009B64 0F 03            [ 2] 1807 	ldw (LN_PTR,sp),x 
      009B66 0F 05 19         [ 4] 1808 	call next_token 
      009B68 A1 11            [ 1] 1809 	cp a,#TK_MINUS 
      009B68 CD 95            [ 1] 1810 	jreq end_at_line 
      009B6A 99 A1            [ 1] 1811 	cp a,#TK_NONE 
      009B6C 03 27            [ 1] 1812 	jreq 2$
      009B6E 03 CC            [ 1] 1813 	cp a,#TK_COLON 
      009B70 94 3D            [ 1] 1814 	jreq 2$
      009B72 1F 01 CD         [ 2] 1815 	jp syntax_error 
      001C54                       1816 2$:
      009B75 91 39            [ 2] 1817 	ldw x,(FIRST,sp)
      009B77 AB 05            [ 2] 1818 	ldw (LAST,sp),x 
      009B79 6B 04            [ 2] 1819 	jra list_loop 
      001C5A                       1820 end_at_line:
                                   1821 ; expect ending line# 
      009B7B CD 95 B2         [ 4] 1822     call next_token 
      009B7E 7B 04            [ 1] 1823 	cp a,#TK_INTGR
      009B80 A0 05            [ 1] 1824 	jreq 1$
      009B82 1E 01            [ 1] 1825 	cp a,#TK_NONE 
      009B84 CD 9B            [ 1] 1826 	jreq list_loop 
      009B86 09 5D            [ 1] 1827 	cp a,#TK_COLON 
      009B88 27 05            [ 1] 1828 	jreq list_loop 
      009B8A A6 08 CC         [ 2] 1829 	jp syntax_error 
      001C6C                       1830 1$:
      009B8D 94 3F CE         [ 4] 1831 	call get_int24 
      009B90 00 32            [ 2] 1832 	ldw (LAST,sp),x 
                                   1833 ; print loop
      001C71                       1834 list_loop:
      009B92 7B 04            [ 2] 1835 	ldw x,(LN_PTR,sp)
      009B94 1A 05            [ 1] 1836 	ld a,(2,x) 
      009B96 F7 5C 90         [ 4] 1837 	call prt_basic_line
      009B99 89 16            [ 2] 1838 	ldw x,(LN_PTR,sp)
      009B9B 03 CD            [ 1] 1839 	ld a,(2,x)
      009B9D 91 55 90         [ 1] 1840 	ld acc8,a 
      009BA0 85 5A 72 FB      [ 1] 1841 	clr acc16 
      009BA4 03 CF 00 32      [ 2] 1842 	addw x,acc16
      009BA8 1D 00 03         [ 2] 1843 	cpw x,txtend 
      009BAB 7F 6F            [ 1] 1844 	jrpl list_exit
      009BAD 01 6F            [ 2] 1845 	ldw (LN_PTR,sp),x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      009BAF 02               [ 2] 1846 	ldw x,(x)
      009BB0 CD 95            [ 2] 1847 	cpw x,(LAST,sp)  
      009BB2 99 A1            [ 1] 1848 	jrsle list_loop
      001C93                       1849 list_exit:
      009BB4 08 27 B1 A1 32   [ 1] 1850 	mov in,count 
      009BB9 26 2A CD         [ 2] 1851 	ldw x,#pad 
      009BBC 99 CD A1         [ 2] 1852 	ldw basicptr,x 
      001C9E                       1853 	_drop VSIZE 
      009BBF 84 27            [ 2]    1     addw sp,#VSIZE 
      009BC1 03 CC 94         [ 4] 1854 	call program_info
      009BC4 3D CE 00 32 1D   [ 2] 1855 	btjf flags,#FLN_REJECTED,9$
      009BC9 00 03 CF         [ 2] 1856 	ldw x,#LINES_REJECTED
      009BCC 00 1A 90         [ 4] 1857 	call puts
      001CAE                       1858 9$: 
      009BCF F6               [ 4] 1859 	ret
      009BD0 93 EE 01 72 A9 00 03  1860 LINES_REJECTED: .asciz "WARNING: lines missing in this program.\n"
             72 C7 00 1A 72 5C 00
             1B 72 CF 00 1A 20 CB
             67 20 69 6E 20 74 68
             69 73 20 70 72 6F 67
             72 61 6D 2E 0A 00
                                   1861 
                                   1862 ;--------------------------
                                   1863 ; BASIC: EDIT label 
                                   1864 ;  copy program in FLASH 
                                   1865 ;  to RAM for edition 
                                   1866 ;-------------------------
      009BE5                       1867 cmd_edit:
      009BE5 55 00 04         [ 4] 1868 	call cmd_line_only
      009BE8 00 02            [ 1] 1869 	ld a,#TK_LABEL 
      009BEA 5B 05 CD         [ 4] 1870 	call expect  
      009BED 9A               [ 2] 1871 	pushw x 
      009BEE 81 81 32         [ 4] 1872 	call skip_string
      009BF0 85               [ 2] 1873 	popw x 
      009BF0 CE 00 1E         [ 4] 1874 	call search_program 
      009BF3 72 B0            [ 1] 1875     jrne 1$ 
      009BF5 00 1C 81         [ 2] 1876 	ldw x,#ERR_NO_PROGRAM
      009BF8 CC 13 BF         [ 2] 1877 	jp tb_error 
      009BF8 AE 9C            [ 2] 1878 1$: pushw y 
      009BFA 37 CD            [ 1] 1879 	ldw y,x ; source address 
      009BFC 87 02 CE         [ 2] 1880 	subw x,#4
      009BFF 00 1C            [ 2] 1881 	ldw x,(2,x) ; program size 
      009C01 35 10 00         [ 2] 1882 	addw x,#4 
      009C04 0B CD 95         [ 2] 1883 	ldw acc16,x  ; bytes to copy 
      009C07 E1 35 0A         [ 2] 1884 	ldw x,#rsign ; destination address 
      009C0A 00 0B AE 9C      [ 2] 1885 	subw y,#4 
      009C0E 49 CD 87         [ 4] 1886 	call move  
      009C11 02 CD 9B         [ 2] 1887 	ldw x,#free_ram 
      009C14 F0 CD 95         [ 2] 1888 	ldw txtbgn,x 
      009C17 E1 AE 9C 5A      [ 2] 1889 	addw x,rsize  
      009C1B CD 87 02         [ 2] 1890 	ldw txtend,x
      009C1E CE 00            [ 2] 1891 	popw y  
      009C20 1C               [ 4] 1892 	ret 
                                   1893 
                                   1894 ;--------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



                                   1895 ; decompile line from token list
                                   1896 ; and print it. 
                                   1897 ; input:
                                   1898 ;   A       stop at this position 
                                   1899 ;   X 		pointer at line
                                   1900 ; output:
                                   1901 ;   none 
                                   1902 ;--------------------------	
      001D19                       1903 prt_basic_line:
      009C21 A3 B4            [ 2] 1904 	pushw y 
      009C23 84 25 05         [ 1] 1905 	ld count,a 
      009C26 AE 9C            [ 1] 1906 	ld a,(2,x)
      009C28 61 20 03         [ 1] 1907 	cp a,count 
      009C2B AE 9C            [ 1] 1908 	jrpl 1$ 
      009C2D 72 CD 87         [ 1] 1909 	ld count,a 
      009C30 02 A6 0D         [ 2] 1910 1$:	ldw basicptr,x 
      009C33 CD 86 A5 81      [ 2] 1911 	ldw y,#tib  
      009C37 70 72 6F         [ 4] 1912 	call decompile 
      009C3A 67 72 61         [ 4] 1913 	call puts 
      009C3D 6D 20            [ 1] 1914 	ld a,#CR 
      009C3F 61 64 64         [ 4] 1915 	call putc 
      009C42 72 65            [ 2] 1916 	popw y 
      009C44 73               [ 4] 1917 	ret 
                                   1918 
                                   1919 
                                   1920 ;---------------------------------
                                   1921 ; BASIC: PRINT|? arg_list 
                                   1922 ; print values from argument list
                                   1923 ;----------------------------------
                           000001  1924 	SEMICOL=1
                           000001  1925 	VSIZE=1
      001D3D                       1926 cmd_print:
      001D3D                       1927 	_vars VSIZE 
      009C45 73 3A            [ 2]    1     sub sp,#VSIZE 
      001D3F                       1928 reset_semicol:
      009C47 20 00            [ 1] 1929 	clr (SEMICOL,sp)
      001D41                       1930 prt_loop:
      009C49 2C 20 70         [ 4] 1931 	call next_token
      009C4C 72 6F            [ 1] 1932 	cp a,#CMD_END 
      009C4E 67 72            [ 1] 1933 	jrult 0$
      009C50 61 6D            [ 1] 1934 	cp a,#TK_COLON 
      009C52 20 73            [ 1] 1935 	jreq 0$
      009C54 69 7A            [ 1] 1936 	cp a,#TK_CMD
      009C56 65 3A            [ 1] 1937 	jrne 10$
      001D50                       1938 0$:
      001D50                       1939 	_unget_token 
      009C58 20 00 20 62 79   [ 1]    1      mov in,in.saved  
      009C5D 74 65            [ 2] 1940 	jra 8$ 
      001D57                       1941 10$:	
      009C5F 73 00            [ 1] 1942 	cp a,#TK_QSTR
      009C61 20 69            [ 1] 1943 	jreq 1$
      009C63 6E 20            [ 1] 1944 	cp a,#TK_CHAR 
      009C65 46 4C            [ 1] 1945 	jreq 2$ 
      009C67 41 53            [ 1] 1946 	cp a,#TK_CFUNC 
      009C69 48 20            [ 1] 1947 	jreq 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      009C6B 6D 65            [ 1] 1948 	cp a,#TK_SEMIC  
      009C6D 6D 6F            [ 1] 1949 	jreq 4$
      009C6F 72 79            [ 1] 1950 	cp a,#TK_COMMA
      009C71 00 20            [ 1] 1951 	jreq 5$
      009C73 69 6E            [ 2] 1952 	jra 7$ 
      001D6D                       1953 1$:	; print string 
      009C75 20 52 41         [ 4] 1954 	call puts
      009C78 4D               [ 1] 1955 	incw x
      009C79 20 6D 65 6D      [ 2] 1956 	subw x,basicptr 
      009C7D 6F 72 79         [ 2] 1957 	ldw in.w,x  
      009C80 00 C5            [ 2] 1958 	jra reset_semicol
      009C81                       1959 2$:	; print character 
      009C81 CD 97 4C         [ 4] 1960 	call get_char 
      009C84 CD 9B F0         [ 4] 1961 	call putc 
      009C87 22 01            [ 2] 1962 	jra reset_semicol 
      001D82                       1963 3$: ; print character function value  	
      001D82                       1964 	_get_code_addr 
      009C89 81               [ 2]    1         ldw x,(x)
      009C8A 52 06 CE 00      [ 1]    2         inc in 
      009C8E 1C 1F 05 FE      [ 1]    3         inc in 
      009C92 1F               [ 4] 1965 	call (x)
      009C93 01 AE 7F         [ 4] 1966 	call putc
      009C96 FF 1F            [ 2] 1967 	jra reset_semicol 
      001D91                       1968 4$: ; set semi-colon  state 
      009C98 03 CD            [ 1] 1969 	cpl (SEMICOL,sp)
      009C9A 95 99            [ 2] 1970 	jra prt_loop 
      001D95                       1971 5$: ; skip to next terminal tabulation
                                   1972      ; terminal TAB are 8 colons 
      009C9C A1 84            [ 1] 1973      ld a,#9 
      009C9E 27 0F 25         [ 4] 1974 	 call putc 
      009CA0 20 A3            [ 2] 1975 	 jra reset_semicol	    
      001D9C                       1976 7$:	
      001D9C                       1977 	_unget_token 
      009CA0 A1 11 27 36 A1   [ 1]    1      mov in,in.saved  
      009CA5 00 27 49         [ 4] 1978 	call condition
      009CA8 A1               [ 1] 1979 	tnz a 
      009CA9 09 27            [ 1] 1980 	jreq 8$    
      009CAB 45 CC 94         [ 4] 1981     call print_top
      009CAE 3D 1D 3F         [ 2] 1982 	jp reset_semicol 
      009CAF                       1983 8$:
      009CAF CD 95            [ 1] 1984 	tnz (SEMICOL,sp)
      009CB1 CB 1F            [ 1] 1985 	jrne 9$
      009CB3 01 0D            [ 1] 1986 	ld a,#CR 
      009CB4 CD 06 25         [ 4] 1987     call putc 
      001DB6                       1988 9$:	_drop VSIZE 
      009CB4 90 89            [ 2]    1     addw sp,#VSIZE 
      009CB6 4F               [ 4] 1989 	ret 
                                   1990 
                                   1991 ;----------------------
                                   1992 ; 'save_context' and
                                   1993 ; 'rest_context' must be 
                                   1994 ; called at the same 
                                   1995 ; call stack depth 
                                   1996 ; i.e. SP must have the 
                                   1997 ; save value at  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



                                   1998 ; entry point of both 
                                   1999 ; routine. 
                                   2000 ;---------------------
                           000004  2001 	CTXT_SIZE=4 ; size of saved data 
                                   2002 ;--------------------
                                   2003 ; save current BASIC
                                   2004 ; interpreter context 
                                   2005 ; on stack 
                                   2006 ;--------------------
      001DB9                       2007 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001DB9                       2008 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001DB9                       2009 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      001DB9                       2010 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      001DB9                       2011 save_context:
      009CB7 CD 89 EB         [ 2] 2012 	ldw x,basicptr 
      009CBA 5D 26            [ 2] 2013 	ldw (BPTR,sp),x
      009CBC 01 93 90         [ 1] 2014 	ld a,in 
      009CBF 85 1F            [ 1] 2015 	ld (IN,sp),a
      009CC1 05 CD 95         [ 1] 2016 	ld a,count 
      009CC4 99 A1            [ 1] 2017 	ld (CNT,sp),a  
      009CC6 11               [ 4] 2018 	ret
                                   2019 
                                   2020 ;-----------------------
                                   2021 ; restore previously saved 
                                   2022 ; BASIC interpreter context 
                                   2023 ; from stack 
                                   2024 ;-------------------------
      001DC9                       2025 rest_context:
      009CC7 27 11            [ 2] 2026 	ldw x,(BPTR,sp)
      009CC9 A1 00 27         [ 2] 2027 	ldw basicptr,x 
      009CCC 07 A1            [ 1] 2028 	ld a,(IN,sp)
      009CCE 09 27 03         [ 1] 2029 	ld in,a
      009CD1 CC 94            [ 1] 2030 	ld a,(CNT,sp)
      009CD3 3D 00 02         [ 1] 2031 	ld count,a  
      009CD4 81               [ 4] 2032 	ret
                                   2033 
                                   2034 
                                   2035 
                                   2036 ;------------------------------------------
                                   2037 ; BASIC: INPUT [string]var[,[string]var]
                                   2038 ; input value in variables 
                                   2039 ; [string] optionally can be used as prompt 
                                   2040 ;-----------------------------------------
                           000001  2041 	CX_BPTR=1
                           000003  2042 	CX_IN=3
                           000004  2043 	CX_CNT=4
                           000005  2044 	SKIP=5
                           000005  2045 	VSIZE=5
      001DD9                       2046 input_var:
      009CD4 1E 01            [ 2] 2047 	pushw y 
      001DDB                       2048 	_vars VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      009CD6 1F 03            [ 2]    1     sub sp,#VSIZE 
      001DDD                       2049 input_loop:
      009CD8 20 17            [ 1] 2050 	clr (SKIP,sp)
      009CDA CD 15 19         [ 4] 2051 	call next_token 
      009CDA CD 95            [ 1] 2052 	cp a,#TK_QSTR 
      009CDC 99 A1            [ 1] 2053 	jrne 1$ 
      009CDE 84 27 0B         [ 4] 2054 	call puts 
      009CE1 A1               [ 1] 2055 	incw x 
      009CE2 00 27 0C A1      [ 2] 2056 	subw x,basicptr 
      009CE6 09 27 08         [ 2] 2057 	ldw in.w,x 
      009CE9 CC 94            [ 1] 2058 	cpl (SKIP,sp)
      009CEB 3D 15 19         [ 4] 2059 	call next_token 
      009CEC A1 85            [ 1] 2060 1$: cp a,#TK_VAR  
      009CEC CD 95            [ 1] 2061 	jreq 2$ 
      009CEE CB 1F 03         [ 2] 2062 	jp syntax_error
      009CF1 CD 15 41         [ 4] 2063 2$:	call get_addr
      009CF1 1E 05 E6         [ 2] 2064 	ldw ptr16,x 
      009CF4 02 CD            [ 1] 2065 	tnz (SKIP,sp)
      009CF6 9D 99            [ 1] 2066 	jrne 21$ 
      009CF8 1E 05 E6         [ 4] 2067 	call var_name 
      009CFB 02 C7 00         [ 4] 2068 	call putc   
      001E0D                       2069 21$:
      009CFE 0F 72            [ 1] 2070 	ld a,#':
      009D00 5F 00 0E         [ 4] 2071 	call putc 
      009D03 72 BB 00         [ 4] 2072 	call save_context 
      009D06 0E C3 00 1E      [ 1] 2073 	clr count  
      009D0A 2A 07 1F         [ 4] 2074 	call readln 
      009D0D 05 FE 13         [ 2] 2075 	ldw x,#tib 
      009D10 03 2D DE         [ 1] 2076 	push count
      009D13 4B 00            [ 1] 2077 	push #0 
      009D13 55 00 03         [ 2] 2078 	addw x,(1,sp)
      009D16 00               [ 1] 2079 	incw x 
      001E28                       2080 	_drop 2 
      009D17 02 AE            [ 2]    1     addw sp,#2 
      009D19 16 B8 CF 00      [ 1] 2081 	clr in 
      009D1D 05 5B 06         [ 4] 2082 	call get_token
      009D20 CD 9B            [ 1] 2083 	cp a,#TK_INTGR
      009D22 F8 72            [ 1] 2084 	jreq 3$ 
      009D24 0D 00            [ 1] 2085 	cp a,#TK_MINUS
      009D26 23 06            [ 1] 2086 	jrne 22$
      009D28 AE 9D 2F         [ 4] 2087 	call get_token 
      009D2B CD 87            [ 1] 2088 	cp a,#TK_INTGR 
      009D2D 02 06            [ 1] 2089 	jreq 23$
      009D2E                       2090 22$:
      009D2E 81 57 41         [ 4] 2091 	call rest_context 
      009D31 52 4E 49         [ 2] 2092 	jp syntax_error
      001E46                       2093 23$:
      009D34 4E 47 3A         [ 4] 2094 	call neg_acc24	
      001E49                       2095 3$: 
      009D37 20 6C 69         [ 1] 2096 	ld a,acc24 
      009D3A 6E 65 73         [ 2] 2097 	ldw x,acc16 
      009D3D 20 6D 69 73      [ 4] 2098 	ld [ptr16],a
      009D41 73 69 6E 67      [ 1] 2099 	inc ptr8  
      009D45 20 69 6E 20      [ 5] 2100 	ldw [ptr16],x 
      009D49 74 68 69         [ 4] 2101 	call rest_context
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      009D4C 73 20 70         [ 4] 2102 	call next_token 
      009D4F 72 6F            [ 1] 2103 	cp a,#TK_COMMA
      009D51 67 72            [ 1] 2104 	jrne 4$ 
      009D53 61 6D 2E         [ 2] 2105 	jp input_loop
      001E68                       2106 4$:
      009D56 0A 00            [ 1] 2107 	cp a,#TK_NONE 
      009D58 27 07            [ 1] 2108 	jreq input_exit  
      009D58 CD 97            [ 1] 2109 	cp a,#TK_COLON 
      009D5A 4C A6            [ 1] 2110     jreq input_exit 
      009D5C 03 CD 97         [ 2] 2111 	jp syntax_error 
      001E73                       2112 input_exit:
      001E73                       2113 	_drop VSIZE 
      009D5F 62 89            [ 2]    1     addw sp,#VSIZE 
      009D61 CD 95            [ 2] 2114 	popw y 
      009D63 B2               [ 4] 2115 	ret 
                                   2116 
                                   2117 
                                   2118 ;---------------------
                                   2119 ; BASIC: REM | ' 
                                   2120 ; skip comment to end of line 
                                   2121 ;---------------------- 
      001E78                       2122 remark::
      009D64 85 CD AF 93 26   [ 1] 2123 	mov in,count 
      009D69 06               [ 4] 2124  	ret 
                                   2125 
                                   2126 
                                   2127 ;---------------------
                                   2128 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2129 ; read in loop 'addr'  
                                   2130 ; apply & 'mask' to value 
                                   2131 ; loop while result==0.  
                                   2132 ; 'xor_mask' is used to 
                                   2133 ; invert the wait logic.
                                   2134 ; i.e. loop while not 0.
                                   2135 ;---------------------
                           000001  2136 	XMASK=1 
                           000002  2137 	MASK=2
                           000003  2138 	ADDR=3
                           000004  2139 	VSIZE=4
      001E7E                       2140 wait: 
      001E7E                       2141 	_vars VSIZE
      009D6A AE 00            [ 2]    1     sub sp,#VSIZE 
      009D6C 12 CC            [ 1] 2142 	clr (XMASK,sp) 
      009D6E 94 3F 90         [ 4] 2143 	call arg_list 
      009D71 89 90            [ 1] 2144 	cp a,#2
      009D73 93 1D            [ 1] 2145 	jruge 0$
      009D75 00 04 EE         [ 2] 2146 	jp syntax_error 
      009D78 02 1C            [ 1] 2147 0$:	cp a,#3
      009D7A 00 04            [ 1] 2148 	jrult 1$
      001E90                       2149 	_xpop  ; xor mask 
      009D7C CF 00            [ 1]    1     ld a,(y)
      009D7E 0E               [ 1]    2     ldw x,y 
      009D7F AE 00            [ 2]    3     ldw x,(1,x)
      009D81 8C 72 A2 00      [ 2]    4     addw y,#CELL_SIZE 
      009D85 04               [ 1] 2150 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      009D86 CD 91            [ 1] 2151 	ld (XMASK,sp),a 
      001E9C                       2152 1$: _xpop ; mask
      009D88 65 AE            [ 1]    1     ld a,(y)
      009D8A 00               [ 1]    2     ldw x,y 
      009D8B 90 CF            [ 2]    3     ldw x,(1,x)
      009D8D 00 1C 72 BB      [ 2]    4     addw y,#CELL_SIZE 
      009D91 00               [ 1] 2153     ld a,xl  
      009D92 8E CF            [ 1] 2154 	ld (MASK,sp),a 
      001EA8                       2155 	_xpop ; address 
      009D94 00 1E            [ 1]    1     ld a,(y)
      009D96 90               [ 1]    2     ldw x,y 
      009D97 85 81            [ 2]    3     ldw x,(1,x)
      009D99 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D99 90               [ 1] 2156 2$:	ld a,(x)
      009D9A 89 C7            [ 1] 2157 	and a,(MASK,sp)
      009D9C 00 03            [ 1] 2158 	xor a,(XMASK,sp)
      009D9E E6 02            [ 1] 2159 	jreq 2$ 
      001EB8                       2160 	_drop VSIZE 
      009DA0 C1 00            [ 2]    1     addw sp,#VSIZE 
      009DA2 03               [ 4] 2161 	ret 
                                   2162 
                                   2163 ;---------------------
                                   2164 ; BASIC: BSET addr,mask
                                   2165 ; set bits at 'addr' corresponding 
                                   2166 ; to those of 'mask' that are at 1.
                                   2167 ; arguments:
                                   2168 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2169 ;   mask        mask|addr
                                   2170 ; output:
                                   2171 ;	none 
                                   2172 ;--------------------------
      001EBB                       2173 bit_set:
      009DA3 2A 03 C7         [ 4] 2174 	call arg_list 
      009DA6 00 03            [ 1] 2175 	cp a,#2	 
      009DA8 CF 00            [ 1] 2176 	jreq 1$ 
      009DAA 05 90 AE         [ 2] 2177 	jp syntax_error
      001EC5                       2178 1$: 
      001EC5                       2179 	_xpop ; mask 
      009DAD 16 68            [ 1]    1     ld a,(y)
      009DAF CD               [ 1]    2     ldw x,y 
      009DB0 8F 6C            [ 2]    3     ldw x,(1,x)
      009DB2 CD 87 02 A6      [ 2]    4     addw y,#CELL_SIZE 
      009DB6 0D               [ 1] 2180 	ld a,xl
      009DB7 CD               [ 1] 2181 	push a  
      001ED0                       2182 	_xpop ; addr  
      009DB8 86 A5            [ 1]    1     ld a,(y)
      009DBA 90               [ 1]    2     ldw x,y 
      009DBB 85 81            [ 2]    3     ldw x,(1,x)
      009DBD 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009DBD 52               [ 1] 2183 	pop a 
      009DBE 01               [ 1] 2184 	or a,(x)
      009DBF F7               [ 1] 2185 	ld (x),a
      009DBF 0F               [ 4] 2186 	ret 
                                   2187 
                                   2188 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



                                   2189 ; BASIC: BRES addr,mask
                                   2190 ; reset bits at 'addr' corresponding 
                                   2191 ; to those of 'mask' that are at 1.
                                   2192 ; arguments:
                                   2193 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2194 ;   mask	    ~mask&*addr  
                                   2195 ; output:
                                   2196 ;	none 
                                   2197 ;--------------------------
      001EDD                       2198 bit_reset:
      009DC0 01 16 F4         [ 4] 2199 	call arg_list 
      009DC1 A1 02            [ 1] 2200 	cp a,#2  
      009DC1 CD 95            [ 1] 2201 	jreq 1$ 
      009DC3 99 A1 02         [ 2] 2202 	jp syntax_error
      001EE7                       2203 1$: 
      001EE7                       2204 	_xpop ; mask 
      009DC6 25 08            [ 1]    1     ld a,(y)
      009DC8 A1               [ 1]    2     ldw x,y 
      009DC9 09 27            [ 2]    3     ldw x,(1,x)
      009DCB 04 A1 80 26      [ 2]    4     addw y,#CELL_SIZE 
      009DCF 07               [ 1] 2205 	ld a,xl 
      009DD0 43               [ 1] 2206 	cpl a
      009DD0 55               [ 1] 2207 	push a  
      001EF3                       2208 	_xpop ; addr  
      009DD1 00 04            [ 1]    1     ld a,(y)
      009DD3 00               [ 1]    2     ldw x,y 
      009DD4 02 20            [ 2]    3     ldw x,(1,x)
      009DD6 56 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009DD7 84               [ 1] 2209 	pop a 
      009DD7 A1               [ 1] 2210 	and a,(x)
      009DD8 02               [ 1] 2211 	ld (x),a 
      009DD9 27               [ 4] 2212 	ret 
                                   2213 
                                   2214 ;---------------------
                                   2215 ; BASIC: BTOGL addr,mask
                                   2216 ; toggle bits at 'addr' corresponding 
                                   2217 ; to those of 'mask' that are at 1.
                                   2218 ; arguments:
                                   2219 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2220 ;   mask	    mask^*addr  
                                   2221 ; output:
                                   2222 ;	none 
                                   2223 ;--------------------------
      001F00                       2224 bit_toggle:
      009DDA 12 A1 04         [ 4] 2225 	call arg_list 
      009DDD 27 1B            [ 1] 2226 	cp a,#2 
      009DDF A1 82            [ 1] 2227 	jreq 1$ 
      009DE1 27 1F A1         [ 2] 2228 	jp syntax_error
      001F0A                       2229 1$: _xpop ; mask 
      009DE4 0A 27            [ 1]    1     ld a,(y)
      009DE6 2A               [ 1]    2     ldw x,y 
      009DE7 A1 08            [ 2]    3     ldw x,(1,x)
      009DE9 27 2A 20 2F      [ 2]    4     addw y,#CELL_SIZE 
      009DED 9F               [ 1] 2230 	ld a,xl
      009DED CD               [ 1] 2231 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      001F15                       2232 	_xpop  ; addr  
      009DEE 87 02            [ 1]    1     ld a,(y)
      009DF0 5C               [ 1]    2     ldw x,y 
      009DF1 72 B0            [ 2]    3     ldw x,(1,x)
      009DF3 00 05 CF 00      [ 2]    4     addw y,#CELL_SIZE 
      009DF7 01               [ 1] 2233 	pop a 
      009DF8 20               [ 1] 2234 	xor a,(x)
      009DF9 C5               [ 1] 2235 	ld (x),a 
      009DFA 81               [ 4] 2236 	ret 
                                   2237 
                                   2238 
                                   2239 ;---------------------
                                   2240 ; BASIC: BTEST(addr,bit)
                                   2241 ; return bit value at 'addr' 
                                   2242 ; bit is in range {0..7}.
                                   2243 ; arguments:
                                   2244 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2245 ;   bit 	    bit position {0..7}  
                                   2246 ; output:
                                   2247 ;	A:X       bit value  
                                   2248 ;--------------------------
      001F22                       2249 bit_test:
      009DFA CD 95 DB         [ 4] 2250 	call func_args 
      009DFD CD 86            [ 1] 2251 	cp a,#2
      009DFF A5 20            [ 1] 2252 	jreq 0$
      009E01 BD 13 BD         [ 2] 2253 	jp syntax_error
      009E02                       2254 0$:	
      001F2C                       2255 	_xpop 
      009E02 FE 72            [ 1]    1     ld a,(y)
      009E04 5C               [ 1]    2     ldw x,y 
      009E05 00 02            [ 2]    3     ldw x,(1,x)
      009E07 72 5C 00 02      [ 2]    4     addw y,#CELL_SIZE 
      009E0B FD               [ 1] 2256 	ld a,xl 
      009E0C CD 86            [ 1] 2257 	and a,#7
      009E0E A5               [ 1] 2258 	push a   
      009E0F 20 AE            [ 1] 2259 	ld a,#1 
      009E11 0D 01            [ 1] 2260 1$: tnz (1,sp)
      009E11 03 01            [ 1] 2261 	jreq 2$
      009E13 20               [ 1] 2262 	sll a 
      009E14 AC 01            [ 1] 2263 	dec (1,sp)
      009E15 20 F7            [ 2] 2264 	jra 1$
      009E15 A6 09            [ 1] 2265 2$: ld (1,sp),a  
      001F46                       2266 	_xpop ; address  
      009E17 CD 86            [ 1]    1     ld a,(y)
      009E19 A5               [ 1]    2     ldw x,y 
      009E1A 20 A3            [ 2]    3     ldw x,(1,x)
      009E1C 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009E1C 55               [ 1] 2267 	pop a 
      009E1D 00               [ 1] 2268 	and a,(x)
      009E1E 04 00            [ 1] 2269 	jreq 3$
      009E20 02 CD            [ 1] 2270 	ld a,#1 
      009E22 99               [ 1] 2271 3$:	clrw x 
      009E23 CD               [ 1] 2272 	ld xl,a
      009E24 4D               [ 1] 2273 	clr a  
      009E25 27               [ 4] 2274 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



                                   2275 
                                   2276 ;--------------------
                                   2277 ; BASIC: POKE addr,byte
                                   2278 ; put a byte at addr 
                                   2279 ;--------------------
      001F59                       2280 poke:
      009E26 06 CD 96         [ 4] 2281 	call arg_list 
      009E29 03 CC            [ 1] 2282 	cp a,#2
      009E2B 9D BF            [ 1] 2283 	jreq 1$
      009E2D CC 13 BD         [ 2] 2284 	jp syntax_error
      001F63                       2285 1$:	
      001F63                       2286 	_xpop ; byte   
      009E2D 0D 01            [ 1]    1     ld a,(y)
      009E2F 26               [ 1]    2     ldw x,y 
      009E30 05 A6            [ 2]    3     ldw x,(1,x)
      009E32 0D CD 86 A5      [ 2]    4     addw y,#CELL_SIZE 
      009E36 5B               [ 1] 2287     ld a,xl 
      009E37 01               [ 1] 2288 	push a 
      001F6E                       2289 	_xpop ; address 
      009E38 81 F6            [ 1]    1     ld a,(y)
      009E39 93               [ 1]    2     ldw x,y 
      009E39 CE 00            [ 2]    3     ldw x,(1,x)
      009E3B 05 1F 03 C6      [ 2]    4     addw y,#CELL_SIZE 
      009E3F 00               [ 1] 2290 	pop a 
      009E40 02               [ 1] 2291 	ld (x),a 
      009E41 6B               [ 4] 2292 	ret 
                                   2293 
                                   2294 ;-----------------------
                                   2295 ; BASIC: PEEK(addr)
                                   2296 ; get the byte at addr 
                                   2297 ; input:
                                   2298 ;	none 
                                   2299 ; output:
                                   2300 ;	X 		value 
                                   2301 ;-----------------------
      001F7A                       2302 peek:
      009E42 05 C6 00         [ 4] 2303 	call func_args
      009E45 03 6B            [ 1] 2304 	cp a,#1 
      009E47 06 81            [ 1] 2305 	jreq 1$
      009E49 CC 13 BD         [ 2] 2306 	jp syntax_error
      001F84                       2307 1$: _xpop ; address  
      009E49 1E 03            [ 1]    1     ld a,(y)
      009E4B CF               [ 1]    2     ldw x,y 
      009E4C 00 05            [ 2]    3     ldw x,(1,x)
      009E4E 7B 05 C7 00      [ 2]    4     addw y,#CELL_SIZE 
      009E52 02 7B 06         [ 1] 2308 	ld farptr,a 
      009E55 C7 00 03         [ 2] 2309 	ldw ptr16,x 
      009E58 81 BC 00 18      [ 5] 2310 	ldf a,[farptr]
      009E59 5F               [ 1] 2311 	clrw x 
      009E59 90               [ 1] 2312 	ld xl,a 
      009E5A 89               [ 1] 2313 	clr a 
      009E5B 52               [ 4] 2314 	ret 
                                   2315 
                                   2316 ;---------------------------
                                   2317 ; BASIC IF expr : instructions
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



                                   2318 ; evaluate expr and if true 
                                   2319 ; execute instructions on same line. 
                                   2320 ;----------------------------
      001F9B                       2321 if: 
      009E5C 05 19 4D         [ 4] 2322 	call condition  
      009E5D                       2323 	_xpop 
      009E5D 0F 05            [ 1]    1     ld a,(y)
      009E5F CD               [ 1]    2     ldw x,y 
      009E60 95 99            [ 2]    3     ldw x,(1,x)
      009E62 A1 02 26 10      [ 2]    4     addw y,#CELL_SIZE 
      009E66 CD               [ 1] 2324 	tnz  a  
      009E67 87 02            [ 1] 2325 	jrne 9$
      009E69 5C               [ 2] 2326 	tnzw x 
      009E6A 72 B0            [ 1] 2327 	jrne 9$  
                                   2328 ;skip to next line
      009E6C 00 05 CF 00 01   [ 1] 2329 	mov in,count
      001FB2                       2330 	_drop 2 
      009E71 03 05            [ 2]    1     addw sp,#2 
      009E73 CD 95 99         [ 2] 2331 	jp next_line
      009E76 A1               [ 4] 2332 9$:	ret 
                                   2333 
                                   2334 ;------------------------
                                   2335 ; BASIC: FOR var=expr 
                                   2336 ; set variable to expression 
                                   2337 ; leave variable address 
                                   2338 ; on stack and set
                                   2339 ; FLOOP bit in 'flags'
                                   2340 ;-----------------
                           000001  2341 	RETL1=1 ; return address  
                           000003  2342 	FSTEP=3  ; variable increment int24
                           000006  2343 	LIMIT=6 ; loop limit, int24  
                           000009  2344 	CVAR=9   ; control variable 
                           00000B  2345 	INW=11   ;  in.w saved
                           00000D  2346 	BPTR=13 ; baseptr saved
                           00000D  2347 	VSIZE=13  
      001FB8                       2348 for: ; { -- var_addr }
      009E77 85               [ 2] 2349 	popw x ; call return address 
      001FB9                       2350 	_vars VSIZE 
      009E78 27 03            [ 2]    1     sub sp,#VSIZE 
      009E7A CC               [ 2] 2351 	pushw x  ; RETL1 
      009E7B 94 3D            [ 1] 2352 	ld a,#TK_VAR 
      009E7D CD 95 C1         [ 4] 2353 	call expect
      009E80 CF 00 1A         [ 4] 2354 	call get_addr
      009E83 0D 05            [ 2] 2355 	ldw (CVAR,sp),x  ; control variable 
      009E85 26 06 CD         [ 4] 2356 	call let_eval 
      009E88 8F 62 CD 86      [ 1] 2357 	bset flags,#FLOOP 
      009E8C A5 15 19         [ 4] 2358 	call next_token 
      009E8D A1 80            [ 1] 2359 	cp a,#TK_CMD 
      009E8D A6 3A            [ 1] 2360 	jreq 1$
      009E8F CD 86 A5         [ 2] 2361 	jp syntax_error
      001FD7                       2362 1$:  
      001FD7                       2363 	_get_code_addr
      009E92 CD               [ 2]    1         ldw x,(x)
      009E93 9E 39 72 5F      [ 1]    2         inc in 
      009E97 00 03 CD 88      [ 1]    3         inc in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      009E9B 07 AE 16         [ 2] 2364 	cpw x,#to   
      009E9E 68 3B            [ 1] 2365 	jreq to
      009EA0 00 03 4B         [ 2] 2366 	jp syntax_error 
                                   2367 
                                   2368 ;-----------------------------------
                                   2369 ; BASIC: TO expr 
                                   2370 ; second part of FOR loop initilization
                                   2371 ; leave limit on stack and set 
                                   2372 ; FTO bit in 'flags'
                                   2373 ;-----------------------------------
      001FE8                       2374 to: ; { var_addr -- var_addr limit step }
      009EA3 00 72 FB 01 5C   [ 2] 2375 	btjt flags,#FLOOP,1$
      009EA8 5B 02 72         [ 2] 2376 	jp syntax_error
      009EAB 5F 00 02         [ 4] 2377 1$: call expression   
      009EAE CD 8C            [ 1] 2378 	cp a,#TK_INTGR 
      009EB0 A3 A1            [ 1] 2379 	jreq 2$ 
      009EB2 84 27 14         [ 2] 2380 	jp syntax_error
      001FFA                       2381 2$: _xpop
      009EB5 A1 11            [ 1]    1     ld a,(y)
      009EB7 26               [ 1]    2     ldw x,y 
      009EB8 07 CD            [ 2]    3     ldw x,(1,x)
      009EBA 8C A3 A1 84      [ 2]    4     addw y,#CELL_SIZE 
      009EBE 27 06            [ 1] 2382 	ld (LIMIT,sp),a 
      009EC0 1F 07            [ 2] 2383 	ldw (LIMIT+1,sp),x
      009EC0 CD 9E 49         [ 4] 2384 	call next_token
      009EC3 CC 94            [ 1] 2385 	cp a,#TK_NONE  
      009EC5 3D 17            [ 1] 2386 	jreq 4$ 
      009EC6 A1 80            [ 1] 2387 	cp a,#TK_CMD
      009EC6 CD 82            [ 1] 2388 	jrne 3$
      002012                       2389 	_get_code_addr
      009EC8 9D               [ 2]    1         ldw x,(x)
      009EC9 72 5C 00 01      [ 1]    2         inc in 
      009EC9 C6 00 0D CE      [ 1]    3         inc in 
      009ECD 00 0E 72         [ 2] 2390 	cpw x,#step 
      009ED0 C7 00            [ 1] 2391 	jreq step
      002020                       2392 3$:	
      002020                       2393 	_unget_token   	 
      009ED2 1A 72 5C 00 1B   [ 1]    1      mov in,in.saved  
      002025                       2394 4$:	
      009ED7 72 CF            [ 1] 2395 	clr (FSTEP,sp) 
      009ED9 00 1A CD         [ 2] 2396 	ldw x,#1   ; default step  
      009EDC 9E 49            [ 2] 2397 	ldw (FSTEP+1,sp),x 
      009EDE CD 95            [ 2] 2398 	jra store_loop_addr 
                                   2399 
                                   2400 
                                   2401 ;----------------------------------
                                   2402 ; BASIC: STEP expr 
                                   2403 ; optional third par of FOR loop
                                   2404 ; initialization. 	
                                   2405 ;------------------------------------
      00202E                       2406 step: ; {var limit -- var limit step}
      009EE0 99 A1 08 26 03   [ 2] 2407 	btjt flags,#FLOOP,1$
      009EE5 CC 9E 5D         [ 2] 2408 	jp syntax_error
      009EE8 CD 18 34         [ 4] 2409 1$: call expression 
      009EE8 A1 00            [ 1] 2410 	cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      009EEA 27 07            [ 1] 2411 	jreq 2$
      009EEC A1 09 27         [ 2] 2412 	jp syntax_error
      002040                       2413 2$:	
      002040                       2414 	_xpop 
      009EEF 03 CC            [ 1]    1     ld a,(y)
      009EF1 94               [ 1]    2     ldw x,y 
      009EF2 3D 01            [ 2]    3     ldw x,(1,x)
      009EF3 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009EF3 5B 05            [ 1] 2415 	ld (FSTEP,sp),a 
      009EF5 90 85            [ 2] 2416 	ldw (FSTEP+1,sp),x ; step
                                   2417 ; if step < 0 decrement LIMIT 
      009EF7 81               [ 1] 2418 	tnz a
      009EF8 2A 0D            [ 1] 2419 	jrpl store_loop_addr 
      009EF8 55 00            [ 1] 2420 	ld a,(LIMIT,sp)
      009EFA 03 00            [ 2] 2421 	ldw x,(LIMIT+1,sp)
      009EFC 02 81 01         [ 2] 2422 	subw x,#1 
      009EFE A2 00            [ 1] 2423 	sbc a,#0 
      009EFE 52 04            [ 1] 2424 	ld (LIMIT,sp),a 
      009F00 0F 01            [ 2] 2425 	ldw (LIMIT+1,sp),x 
                                   2426 ; leave loop back entry point on cstack 
                                   2427 ; cstack is 1 call deep from interpreter
      00205D                       2428 store_loop_addr:
      009F02 CD 97 74         [ 2] 2429 	ldw x,basicptr
      009F05 A1 02            [ 2] 2430 	ldw (BPTR,sp),x 
      009F07 24 03 CC         [ 2] 2431 	ldw x,in.w 
      009F0A 94 3D            [ 2] 2432 	ldw (INW,sp),x   
      009F0C A1 03 25 0C      [ 1] 2433 	bres flags,#FLOOP 
      009F10 90 F6 93 EE      [ 1] 2434 	inc loop_depth  
      009F14 01               [ 4] 2435 	ret 
                                   2436 
                                   2437 ;--------------------------------
                                   2438 ; BASIC: NEXT var 
                                   2439 ; FOR loop control 
                                   2440 ; increment variable with step 
                                   2441 ; and compare with limit 
                                   2442 ; loop if threshold not crossed.
                                   2443 ; else stack. 
                                   2444 ; and decrement 'loop_depth' 
                                   2445 ;--------------------------------
      002070                       2446 next: ; {var limit step retl1 -- [var limit step ] }
      009F15 72 A9 00 03      [ 1] 2447 	tnz loop_depth 
      009F19 9F 6B            [ 1] 2448 	jrne 1$ 
      009F1B 01 90 F6         [ 2] 2449 	jp syntax_error 
      002079                       2450 1$: 
      009F1E 93 EE            [ 1] 2451 	ld a,#TK_VAR 
      009F20 01 72 A9         [ 4] 2452 	call expect
      009F23 00 03 9F         [ 4] 2453 	call get_addr 
                                   2454 ; check for good variable after NEXT 	 
      009F26 6B 02            [ 2] 2455 	cpw x,(CVAR,sp)
      009F28 90 F6            [ 1] 2456 	jreq 2$  
      009F2A 93 EE 01         [ 2] 2457 	jp syntax_error ; not the good one 
      002088                       2458 2$: 
      009F2D 72 A9 00         [ 2] 2459 	ldw ptr16,x 
                                   2460 	; increment variable 
      009F30 03               [ 1] 2461 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      009F31 F6 14            [ 2] 2462 	ldw x,(1,x)  ; get var value 
      009F33 02 18 01         [ 2] 2463 	addw x,(FSTEP+1,sp) ; var+step 
      009F36 27 F9            [ 1] 2464 	adc a,(FSTEP,sp)
      009F38 5B 04 81 19      [ 4] 2465 	ld [ptr16],a
      009F3B 72 5C 00 1A      [ 1] 2466 	inc ptr8  
      009F3B CD 97 74 A1      [ 5] 2467 	ldw [ptr16],x 
      009F3F 02 27 03         [ 1] 2468 	ld acc24,a 
      009F42 CC 94 3D         [ 2] 2469 	ldw acc16,x 
      009F45 7B 06            [ 1] 2470 	ld a,(LIMIT,sp)
      009F45 90 F6            [ 2] 2471 	ldw x,(LIMIT+1,sp)
      009F47 93 EE 01 72      [ 2] 2472 	subw x,acc16 
      009F4B A9 00 03         [ 1] 2473 	sbc a,acc24
      009F4E 9F 88            [ 1] 2474 	xor a,(FSTEP,sp)
      009F50 90 F6            [ 1] 2475 	xor a,#0x80
      009F52 93 EE            [ 1] 2476 	jrmi loop_back  
      009F54 01 72            [ 2] 2477 	jra loop_done   
                                   2478 ; check sign of STEP  
      009F56 A9 00            [ 1] 2479 	ld a,(FSTEP,sp)
      009F58 03 84            [ 1] 2480 	jrpl 4$
                                   2481 ;negative step
      009F5A FA F7 81         [ 1] 2482     ld a,acc8 
      009F5D 2F 07            [ 1] 2483 	jrslt loop_back   
      009F5D CD 97            [ 2] 2484 	jra loop_done  
      0020C3                       2485 4$: ; positive step
      009F5F 74 A1 02 27 03   [ 2] 2486 	btjt acc8,#7,loop_done 
      0020C8                       2487 loop_back:
      009F64 CC 94            [ 2] 2488 	ldw x,(BPTR,sp)
      009F66 3D 00 04         [ 2] 2489 	ldw basicptr,x 
      009F67 72 01 00 22 05   [ 2] 2490 	btjf flags,#FRUN,1$ 
      009F67 90 F6            [ 1] 2491 	ld a,(2,x)
      009F69 93 EE 01         [ 1] 2492 	ld count,a
      009F6C 72 A9            [ 2] 2493 1$:	ldw x,(INW,sp)
      009F6E 00 03 9F         [ 2] 2494 	ldw in.w,x 
      009F71 43               [ 4] 2495 	ret 
      0020DD                       2496 loop_done:
                                   2497 	; remove loop data from stack  
      009F72 88               [ 2] 2498 	popw x
      0020DE                       2499 	_drop VSIZE 
      009F73 90 F6            [ 2]    1     addw sp,#VSIZE 
      009F75 93 EE 01 72      [ 1] 2500 	dec loop_depth 
      009F79 A9               [ 2] 2501 	jp (x)
                                   2502 
                                   2503 ;----------------------------
                                   2504 ; called by goto/gosub
                                   2505 ; to get target line number 
                                   2506 ; output:
                                   2507 ;    x    line address 
                                   2508 ;---------------------------
      0020E5                       2509 get_target_line:
      009F7A 00 03 84         [ 4] 2510 	call next_token  
      009F7D F4 F7            [ 1] 2511 	cp a,#TK_INTGR
      009F7F 81 07            [ 1] 2512 	jreq get_target_line_addr 
      009F80 A1 03            [ 1] 2513 	cp a,#TK_LABEL 
      009F80 CD 97            [ 1] 2514 	jreq look_target_symbol 
      009F82 74 A1 02         [ 2] 2515 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



                                   2516 ; the target is a line number 
                                   2517 ; search it. 
      0020F3                       2518 get_target_line_addr:
      009F85 27 03            [ 2] 2519 	pushw y 
      009F87 CC 94 3D         [ 4] 2520 	call get_int24 ; line # 
      009F8A 90               [ 1] 2521 	clr a
      009F8B F6 93 EE 01      [ 2] 2522 	ldw y,basicptr 
      009F8F 72 A9            [ 2] 2523 	ldw y,(y)
      009F91 00 03            [ 2] 2524 	pushw y 
      009F93 9F 88            [ 2] 2525 	cpw x,(1,sp)
      002103                       2526 	_drop 2  
      009F95 90 F6            [ 2]    1     addw sp,#2 
      009F97 93 EE            [ 1] 2527 	jrult 11$
      009F99 01               [ 1] 2528 	inc a 
      002108                       2529 11$: ; scan program for this line# 	
      009F9A 72 A9 00         [ 4] 2530 	call search_lineno  
      009F9D 03               [ 2] 2531 	tnzw x ; 0| line# address 
      009F9E 84 F8            [ 1] 2532 	jrne 2$ 
      009FA0 F7 81            [ 1] 2533 	ld a,#ERR_NO_LINE 
      009FA2 CC 13 BF         [ 2] 2534 	jp tb_error 
      009FA2 CD 97            [ 2] 2535 2$:	popw y  
      009FA4 6F               [ 4] 2536 	ret 
                                   2537 
                                   2538 ; the GOTO|GOSUB target is a symbol.
                                   2539 ; output:
                                   2540 ;    X    line address|0 
      002116                       2541 look_target_symbol:
      009FA5 A1 02            [ 2] 2542 	pushw y 
      009FA7 27               [ 2] 2543 	pushw x 
      009FA8 03 CC 94         [ 4] 2544 	call skip_string 
      009FAB 3D 5F 00 0D      [ 1] 2545 	clr acc16 
      009FAC 90 CE 00 1B      [ 2] 2546 	ldw y,txtbgn 
      009FAC 90 F6 93         [ 1] 2547 1$:	ld a,(3,y) ; first TK_ID on line 
      009FAF EE 01            [ 1] 2548 	cp a,#TK_LABEL 
      009FB1 72 A9            [ 1] 2549 	jreq 3$ 
      009FB3 00 03 9F         [ 1] 2550 2$:	ld a,(2,y); line length 
      009FB6 A4 07 88         [ 1] 2551 	ld acc8,a 
      009FB9 A6 01 0D 01      [ 2] 2552 	addw y,acc16 ;point to next line 
      009FBD 27 05 48 0A      [ 2] 2553 	cpw y,txtend 
      009FC1 01 20            [ 1] 2554 	jrult 1$
      009FC3 F7 6B            [ 1] 2555 	ld a,#ERR_BAD_VALUE
      009FC5 01 90 F6         [ 2] 2556 	jp tb_error 
      002140                       2557 3$: ; found a TK_LABEL 
                                   2558 	; compare with GOTO|GOSUB target 
      009FC8 93 EE            [ 2] 2559 	pushw y ; line address 
      009FCA 01 72 A9 00      [ 2] 2560 	addw y,#4 ; label string 
      009FCE 03 84            [ 2] 2561 	ldw x,(3,sp) ; target string 
      009FD0 F4 27 02         [ 4] 2562 	call strcmp
      009FD3 A6 01            [ 1] 2563 	jrne 4$
      009FD5 5F 97            [ 2] 2564 	popw y 
      009FD7 4F 81            [ 2] 2565 	jra 2$ 
      009FD9                       2566 4$: ; target found 
      009FD9 CD               [ 2] 2567 	popw x ;  address line target  
      002152                       2568 	_drop 2 ; target string 
      009FDA 97 74            [ 2]    1     addw sp,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      009FDC A1 02            [ 2] 2569 	popw y 
      009FDE 27               [ 4] 2570 	ret
                                   2571 
                                   2572 
                                   2573 ;--------------------------------
                                   2574 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2575 ; selective goto or gosub 
                                   2576 ;--------------------------------
      002157                       2577 cmd_on:
      009FDF 03 CC 94         [ 4] 2578 	call runtime_only
      009FE2 3D 18 34         [ 4] 2579 0$:	call expression 
      009FE3 A1 84            [ 1] 2580 	cp a,#TK_INTGR
      009FE3 90 F6            [ 1] 2581 	jreq 1$
      009FE5 93 EE 01         [ 2] 2582 	jp syntax_error
      002164                       2583 1$: _xpop
      009FE8 72 A9            [ 1]    1     ld a,(y)
      009FEA 00               [ 1]    2     ldw x,y 
      009FEB 03 9F            [ 2]    3     ldw x,(1,x)
      009FED 88 90 F6 93      [ 2]    4     addw y,#CELL_SIZE 
                                   2584 ; the selector is the element indice 
                                   2585 ; in the list of arguments. {1..#elements} 
      009FF1 EE               [ 1] 2586 	ld a,xl ; keep only bits 7..0
      009FF2 01 72            [ 1] 2587 	jreq 9$ ; element # begin at 1. 
      009FF4 A9               [ 1] 2588 	push a  ; selector  
      009FF5 00 03 84         [ 4] 2589 	call next_token
      009FF8 F7 81            [ 1] 2590 	cp a,#TK_CMD 
      009FFA 27 03            [ 1] 2591 	jreq 2$ 
      009FFA CD 97 6F         [ 2] 2592 	jp syntax_error 
      00217B                       2593 2$: _get_code_addr
      009FFD A1               [ 2]    1         ldw x,(x)
      009FFE 01 27 03 CC      [ 1]    2         inc in 
      00A002 94 3D 90 F6      [ 1]    3         inc in 
                                   2594 ;; must be a GOTO or GOSUB 
      00A006 93 EE 01         [ 2] 2595 	cpw x,#goto 
      00A009 72 A9            [ 1] 2596 	jreq 4$
      00A00B 00 03 C7         [ 2] 2597 	cpw x,#gosub 
      00A00E 00 19            [ 1] 2598 	jreq 4$ 
      00A010 CF 00 1A         [ 2] 2599 	jp syntax_error 
      002191                       2600 4$: 
      00A013 92               [ 1] 2601 	pop a 
      00A014 BC               [ 2] 2602 	pushw x ; save routine address 	
      00A015 00               [ 1] 2603 	push a  ; selector  
      002194                       2604 5$: ; skip elements in list until selector==0 
      00A016 19 5F            [ 1] 2605 	dec (1,sp)
      00A018 97 4F            [ 1] 2606 	jreq 6$ 
                                   2607 ; can be a line# or a label 
      00A01A 81 15 19         [ 4] 2608 	call next_token 
      00A01B A1 84            [ 1] 2609 	cp a,#TK_INTGR 
      00A01B CD 99            [ 1] 2610 	jreq 52$
      00A01D CD 90            [ 1] 2611 	cp a,#TK_LABEL 
      00A01F F6 93            [ 1] 2612 	jreq 54$
      00A021 EE 01 72         [ 2] 2613 	jp syntax_error 
      0021A6                       2614 52$: ; got a line number 
      00A024 A9 00 03         [ 1] 2615 	ld a,in ; skip over int24 value 
      00A027 4D 26            [ 1] 2616 	add a,#CELL_SIZE ; integer size  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      00A029 0D 5D 26         [ 1] 2617 	ld in,a 
      00A02C 0A 55            [ 2] 2618 	jra 56$
      00A02E 00 03 00         [ 4] 2619 54$: call skip_string ; skip over label 	
      0021B3                       2620 56$: ; if another element comma present 
      00A031 02 5B 02         [ 4] 2621 	call next_token
      00A034 CC 94            [ 1] 2622 	cp a,#TK_COMMA 
      00A036 E3 81            [ 1] 2623 	jreq 5$ 
                                   2624 ; arg list exhausted, selector to big 
                                   2625 ; continue execution on next line 
      00A038                       2626 	_drop 3 ; drop selector and GOTO|GOSUB address 
      00A038 85 52            [ 2]    1     addw sp,#3 
      00A03A 0D 89            [ 2] 2627 	jra 9$
      0021BE                       2628 6$: ;at selected position  
      0021BE                       2629 	_drop 1 ; discard selector
      00A03C A6 85            [ 2]    1     addw sp,#1 
                                   2630 ; here only the routine address 
                                   2631 ; of GOTO|GOSUB is on stack 
      00A03E CD 97 62         [ 4] 2632     call get_target_line
      00A041 CD 95 C1         [ 2] 2633 	ldw ptr16,x 	
      00A044 1F 09 CD 9A A2   [ 1] 2634 	mov in,count ; move to end of line  
      00A049 72               [ 2] 2635 	popw x ; cmd address, GOTO||GOSUB 
      00A04A 14 00 23         [ 2] 2636 	cpw x,#goto 
      00A04D CD 95            [ 1] 2637 	jrne 7$ 
      00A04F 99 A1 80         [ 2] 2638 	ldw x,ptr16 
      00A052 27 03            [ 2] 2639 	jra jp_to_target
      0021D6                       2640 7$: 
      00A054 CC 94            [ 2] 2641 	jra gosub_2 ; target in ptr16 
      0021D8                       2642 9$: ; expr out of range skip to end of line
                                   2643     ; this will force a fall to next line  
      00A056 3D 00 02 00 01   [ 1] 2644 	mov in,count
      00A057                       2645 	_drop 2
      00A057 FE 72            [ 2]    1     addw sp,#2 
      00A059 5C 00 02         [ 2] 2646 	jp next_line  
                                   2647 
                                   2648 
                                   2649 ;------------------------
                                   2650 ; BASIC: GOTO line# 
                                   2651 ; jump to line# 
                                   2652 ; here cstack is 2 call deep from interpreter 
                                   2653 ;------------------------
      0021E2                       2654 goto:
      00A05C 72 5C 00         [ 4] 2655 	call runtime_only
      0021E5                       2656 goto_1:
      00A05F 02 A3 A0         [ 4] 2657 	call get_target_line
      0021E8                       2658 jp_to_target:
      00A062 68 27 03         [ 2] 2659 	ldw basicptr,x 
      00A065 CC 94            [ 1] 2660 	ld a,(2,x)
      00A067 3D 00 02         [ 1] 2661 	ld count,a 
      00A068 35 03 00 01      [ 1] 2662 	mov in,#3 
      00A068 72               [ 4] 2663 	ret 
                                   2664 
                                   2665 
                                   2666 ;--------------------
                                   2667 ; BASIC: GOSUB line#
                                   2668 ; basic subroutine call
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



                                   2669 ; actual line# and basicptr 
                                   2670 ; are saved on cstack
                                   2671 ; here cstack is 2 call deep from interpreter 
                                   2672 ;--------------------
                           000001  2673 	RET_ADDR=1 ; subroutine return address 
                           000003  2674 	RET_BPTR=3 ; basicptr return point 
                           000005  2675 	RET_INW=5  ; in.w return point 
                           000004  2676 	VSIZE=4 
      0021F5                       2677 gosub:
      00A069 04 00 23         [ 4] 2678 	call runtime_only
      0021F8                       2679 gosub_1:
      00A06C 03 CC 94         [ 4] 2680 	call get_target_line 
      00A06F 3D CD 98         [ 2] 2681 	ldw ptr16,x
      0021FE                       2682 gosub_2: 
      00A072 B4               [ 2] 2683 	popw x 
      0021FF                       2684 	_vars VSIZE  
      00A073 A1 84            [ 2]    1     sub sp,#VSIZE 
      00A075 27               [ 2] 2685 	pushw x ; RET_ADDR 
                                   2686 ; save BASIC subroutine return point.   
      00A076 03 CC 94         [ 2] 2687 	ldw x,basicptr
      00A079 3D 90            [ 2] 2688 	ldw (RET_BPTR,sp),x 
      00A07B F6 93 EE         [ 2] 2689 	ldw x,in.w 
      00A07E 01 72            [ 2] 2690 	ldw (RET_INW,sp),x
      00A080 A9 00 03         [ 2] 2691 	ldw x,ptr16  
      00A083 6B 06            [ 2] 2692 	jra jp_to_target
                                   2693 
                                   2694 ;------------------------
                                   2695 ; BASIC: RETURN 
                                   2696 ; exit from BASIC subroutine 
                                   2697 ;------------------------
      002211                       2698 return:
      00A085 1F 07 CD         [ 4] 2699 	call runtime_only
      00A088 95 99            [ 2] 2700 	ldw x,(RET_BPTR,sp) 
      00A08A A1 00 27         [ 2] 2701 	ldw basicptr,x
      00A08D 17 A1            [ 1] 2702 	ld a,(2,x)
      00A08F 80 26 0E         [ 1] 2703 	ld count,a  
      00A092 FE 72            [ 2] 2704 	ldw x,(RET_INW,sp)
      00A094 5C 00 02         [ 2] 2705 	ldw in.w,x 
      00A097 72               [ 2] 2706 	popw x 
      002224                       2707 	_drop VSIZE 
      00A098 5C 00            [ 2]    1     addw sp,#VSIZE 
      00A09A 02               [ 2] 2708 	jp (x)
                                   2709 
                                   2710 ;---------------------------------
                                   2711 ; check if A:X contain the address 
                                   2712 ; of a program in FLASH 
                                   2713 ; output:
                                   2714 ;     Z    set is progam 
                                   2715 ;----------------------------------
      002227                       2716 is_program_addr:
      00A09B A3               [ 1] 2717 	tnz a 
      00A09C A0 AE            [ 1] 2718 	jrne 9$
      00A09E 27 0E 00         [ 2] 2719 	cpw x,#app_space 
      00A0A0 25 07            [ 1] 2720 	jrult 8$
      00A0A0 55               [ 2] 2721 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      00A0A1 00 04 00         [ 4] 2722 	call qsign 
      00A0A4 02               [ 2] 2723 	popw x 
      00A0A5 27 01            [ 1] 2724 	jreq 9$ 
      00A0A5 0F               [ 1] 2725 8$:	cpl a ; clr Z bit  
      00A0A6 03               [ 4] 2726 9$:	ret 
                                   2727 
                                   2728 ;----------------------------------
                                   2729 ; BASIC: RUN [label]
                                   2730 ; run BASIC program in RAM
                                   2731 ;----------------------------------- 
      002238                       2732 cmd_run: 
      00A0A7 AE 00 01 1F 04   [ 2] 2733 	btjf flags,#FRUN,0$  
      00A0AC 20               [ 1] 2734 	clr a 
      00A0AD 2F               [ 4] 2735 	ret
      00A0AE                       2736 0$: ; check for STOP condition 
      00A0AE 72 04 00 23 03   [ 2] 2737 	btjf flags,#FBREAK,1$
      002244                       2738 	_drop 2 
      00A0B3 CC 94            [ 2]    1     addw sp,#2 
      00A0B5 3D CD 98         [ 4] 2739 	call rest_context
      002249                       2740 	_drop CTXT_SIZE 
      00A0B8 B4 A1            [ 2]    1     addw sp,#CTXT_SIZE 
      00A0BA 84 27 03 CC      [ 1] 2741 	bres flags,#FBREAK 
      00A0BE 94 3D 00 22      [ 1] 2742 	bset flags,#FRUN 
      00A0C0 CC 14 5B         [ 2] 2743 	jp interpreter 
      002256                       2744 1$:	; check for label option 
      00A0C0 90 F6 93         [ 4] 2745 	call next_token 
      00A0C3 EE 01            [ 1] 2746 	cp a,#TK_LABEL 
      00A0C5 72 A9            [ 1] 2747 	jrne 3$
      00A0C7 00               [ 2] 2748 	pushw x 
      00A0C8 03 6B 03         [ 4] 2749 	call skip_string 
      00A0CB 1F               [ 2] 2750 	popw x  
      00A0CC 04 4D 2A         [ 4] 2751 	call search_program
      00A0CF 0D 7B            [ 1] 2752 	jrne 2$
      00A0D1 06 1E            [ 1] 2753 	ld a,#ERR_NO_PROGRAM
      00A0D3 07 1D 00         [ 2] 2754 	jp tb_error 
      00A0D6 01 A2 00         [ 2] 2755 2$: ldw txtbgn,x 
      00A0D9 6B 06 1F         [ 2] 2756 	subw x,#2 
      00A0DC 07               [ 2] 2757 	ldw x,(x)
      00A0DD 72 BB 00 1B      [ 2] 2758 	addw x,txtbgn 
      00A0DD CE 00 05         [ 2] 2759 	ldw txtend,x 
      00A0E0 1F 0D            [ 2] 2760 	jra run_it 	
      00227C                       2761 3$:	_unget_token 
      00A0E2 CE 00 01 1F 0B   [ 1]    1      mov in,in.saved  
      00A0E7 72 15 00         [ 2] 2762 	ldw x,txtbgn
      00A0EA 23 72 5C         [ 2] 2763 	cpw x,txtend 
      00A0ED 00 20            [ 1] 2764 	jrmi run_it 
      00A0EF 81 13 14         [ 2] 2765 	ldw x,#err_no_prog
      00A0F0 CD 06 82         [ 4] 2766 	call puts 
      00A0F0 72 5D 00 20 26   [ 1] 2767 	mov in,count
      00A0F5 03               [ 4] 2768 	ret 
      002295                       2769 run_it:	 
      002295                       2770 	_drop 2 ; drop return address 
      00A0F6 CC 94            [ 2]    1     addw sp,#2 
      002297                       2771 run_it_02: 
      00A0F8 3D 1A 01         [ 4] 2772     call ubound 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      00A0F9 CD 11 29         [ 4] 2773 	call clear_vars
                                   2774 ; initialize DIM variables pointers 
      00A0F9 A6 85 CD         [ 2] 2775 	ldw x,txtend 
      00A0FC 97 62 CD         [ 2] 2776 	ldw dvar_bgn,x 
      00A0FF 95 C1 13         [ 2] 2777 	ldw dvar_end,x 	 
                                   2778 ; clear data pointer 
      00A102 09               [ 1] 2779 	clrw x 
      00A103 27 03 CC         [ 2] 2780 	ldw data_ptr,x 
      00A106 94 3D 00 08      [ 1] 2781 	clr data_ofs 
      00A108 72 5F 00 09      [ 1] 2782 	clr data_len 
                                   2783 ; initialize BASIC pointer 
      00A108 CF 00 1A         [ 2] 2784 	ldw x,txtbgn 
      00A10B F6 EE 01         [ 2] 2785 	ldw basicptr,x 
      00A10E 72 FB            [ 1] 2786 	ld a,(2,x)
      00A110 04 19 03         [ 1] 2787 	ld count,a
      00A113 72 C7 00 1A      [ 1] 2788 	mov in,#3	
      00A117 72 5C 00 1B      [ 1] 2789 	bset flags,#FRUN 
      00A11B 72 CF 00         [ 2] 2790 	jp interpreter 
                                   2791 
                                   2792 
                                   2793 ;----------------------
                                   2794 ; BASIC: END
                                   2795 ; end running program
                                   2796 ;---------------------- 
                           000001  2797 	CHAIN_BP=1 
                           000003  2798 	CHAIN_IN=3
                           000005  2799 	CHAIN_TXTBGN=5
                           000007  2800 	CHAIN_TXTEND=7
                           000008  2801 	CHAIN_CNTX_SIZE=8  
      0022C8                       2802 cmd_end: 
      0022C8                       2803 	_drop 2 ; no need for return address 
      00A11E 1A C7            [ 2]    1     addw sp,#2 
                                   2804 ; check for chained program 
      00A120 00 0D CF 00      [ 1] 2805 	tnz chain_level
      00A124 0E 7B            [ 1] 2806 	jreq 8$
                                   2807 ; restore chain context 
      00A126 06 1E 07 72      [ 1] 2808 	dec chain_level 
      00A12A B0 00            [ 2] 2809 	ldw x,(CHAIN_BP,sp) ; chain saved basicptr 
      00A12C 0E C2 00         [ 2] 2810 	ldw basicptr,x 
      00A12F 0D 18            [ 2] 2811 	ldw x,(CHAIN_IN,sp) ; chain saved in and count  
      00A131 03 A8 80         [ 2] 2812 	ldw in,x 
      00A134 2B 12            [ 2] 2813 	ldw x,(CHAIN_TXTBGN,sp)
      00A136 20 25 7B         [ 2] 2814 	ldw txtbgn,x 
      00A139 03 2A            [ 2] 2815 	ldw x,(CHAIN_TXTEND,sp)
      00A13B 07 C6 00         [ 2] 2816 	ldw txtend,x 
      0022E8                       2817 	_drop CHAIN_CNTX_SIZE ; CHAIN saved data size  
      00A13E 0F 2F            [ 2]    1     addw sp,#CHAIN_CNTX_SIZE 
      00A140 07 20 1A         [ 2] 2818 	jp interpreter 
      00A143                       2819 8$: ; clean stack 
      00A143 72 0E 00         [ 2] 2820 	ldw x,#STACK_EMPTY
      00A146 0F               [ 1] 2821 	ldw sp,x 
      00A147 15 14 3C         [ 2] 2822 	jp warm_start
                                   2823 
                                   2824 ;---------------------------
                                   2825 ; BASIC: GET var 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



                                   2826 ; receive a key in variable 
                                   2827 ; don't wait 
                                   2828 ;---------------------------
      00A148                       2829 cmd_get:
      00A148 1E 0D CF         [ 4] 2830 	call next_token 
      00A14B 00 05            [ 1] 2831 	cp a,#TK_VAR 
      00A14D 72 01            [ 1] 2832 	jreq 0$
      00A14F 00 23 05         [ 2] 2833 	jp syntax_error 
      00A152 E6 02 C7         [ 4] 2834 0$: call get_addr 
      00A155 00 03 1E         [ 2] 2835 	ldw ptr16,x 
      00A158 0B CF 00         [ 4] 2836 	call qgetc 
      00A15B 01 81            [ 1] 2837 	jreq 2$
      00A15D CD 06 35         [ 4] 2838 	call getc  
      00A15D 85 5B 0D 72      [ 4] 2839 2$: clr [ptr16]
      00A161 5A 00 20 FC      [ 1] 2840 	inc ptr8 
      00A165 72 3F 00 19      [ 4] 2841 	clr [ptr16]
      00A165 CD 95 99 A1      [ 1] 2842 	inc ptr8 
      00A169 84 27 07 A1      [ 4] 2843 	ld [ptr16],a 
      00A16D 03               [ 4] 2844 	ret 
                                   2845 
                                   2846 
                                   2847 ;-----------------
                                   2848 ; 1 Khz beep 
                                   2849 ;-----------------
      002321                       2850 beep_1khz:: 
      00A16E 27 26            [ 2] 2851 	pushw y 
      00A170 CC 94 3D         [ 2] 2852 	ldw x,#100
      00A173 90 AE 03 E8      [ 2] 2853 	ldw y,#1000
      00A173 90 89            [ 2] 2854 	jra beep
                                   2855 
                                   2856 ;-----------------------
                                   2857 ; BASIC: TONE expr1,expr2
                                   2858 ; used TIMER2 channel 1
                                   2859 ; to produce a tone 
                                   2860 ; arguments:
                                   2861 ;    expr1   frequency 
                                   2862 ;    expr2   duration msec.
                                   2863 ;---------------------------
      00232C                       2864 tone:
      00A175 CD 95            [ 2] 2865 	pushw y 
      00A177 CB 4F 90         [ 4] 2866 	call arg_list 
      00A17A CE 00            [ 1] 2867 	cp a,#2 
      00A17C 05 90            [ 1] 2868 	jreq 1$
      00A17E FE 90 89         [ 2] 2869 	jp syntax_error 
      002338                       2870 1$: 
      002338                       2871 	_xpop 
      00A181 13 01            [ 1]    1     ld a,(y)
      00A183 5B               [ 1]    2     ldw x,y 
      00A184 02 25            [ 2]    3     ldw x,(1,x)
      00A186 01 4C 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A188 89               [ 2] 2872 	pushw x ; duration 
      002342                       2873 	_xpop ; frequency
      00A188 CD 89            [ 1]    1     ld a,(y)
      00A18A EB               [ 1]    2     ldw x,y 
      00A18B 5D 26            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      00A18D 05 A6 05 CC      [ 2]    4     addw y,#CELL_SIZE 
      00A191 94 3F            [ 1] 2874 	ldw y,x ; frequency 
      00A193 90               [ 2] 2875 	popw x  ; duration 
      00234E                       2876 beep:  
      00A194 85               [ 2] 2877 	pushw x 
      00A195 81 F4 24         [ 2] 2878 	ldw x,#TIM2_CLK_FREQ
      00A196 65               [ 2] 2879 	divw x,y ; cntr=Fclk/freq 
                                   2880 ; round to nearest integer 
      00A196 90 89 89 CD      [ 2] 2881 	cpw y,#TIM2_CLK_FREQ/2
      00A19A 95 B2            [ 1] 2882 	jrmi 2$
      00A19C 72               [ 1] 2883 	incw x 
      00235A                       2884 2$:	 
      00A19D 5F               [ 1] 2885 	ld a,xh 
      00A19E 00 0E 90         [ 1] 2886 	ld TIM2_ARRH,a 
      00A1A1 CE               [ 1] 2887 	ld a,xl 
      00A1A2 00 1C 90         [ 1] 2888 	ld TIM2_ARRL,a 
                                   2889 ; 50% duty cycle 
      00A1A5 E6               [ 1] 2890 	ccf 
      00A1A6 03               [ 2] 2891 	rrcw x 
      00A1A7 A1               [ 1] 2892 	ld a,xh 
      00A1A8 03 27 15         [ 1] 2893 	ld TIM2_CCR1H,a 
      00A1AB 90               [ 1] 2894 	ld a,xl
      00A1AC E6 02 C7         [ 1] 2895 	ld TIM2_CCR1L,a
      00A1AF 00 0F 72 B9      [ 1] 2896 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A1B3 00 0E 90 C3      [ 1] 2897 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A1B7 00 1E 25 E9      [ 1] 2898 	bset TIM2_EGR,#TIM2_EGR_UG
      00A1BB A6               [ 2] 2899 	popw x 
      00A1BC 0A CC 94         [ 4] 2900 	call pause02
      00A1BF 3F 11 53 08      [ 1] 2901 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A1C0 72 11 53 00      [ 1] 2902 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A1C0 90 89            [ 2] 2903 	popw y 
      00A1C2 72               [ 4] 2904 	ret 
                                   2905 
                                   2906 ;-------------------------------
                                   2907 ; BASIC: ADCON 0|1 [,divisor]  
                                   2908 ; disable/enanble ADC 
                                   2909 ;-------------------------------
                           000003  2910 	ONOFF=3 
                           000001  2911 	DIVSOR=1
                           000004  2912 	VSIZE=4 
      002387                       2913 power_adc:
      00A1C3 A9 00 04         [ 4] 2914 	call arg_list 
      00A1C6 1E 03            [ 1] 2915 	cp a,#2	
      00A1C8 CD 91            [ 1] 2916 	jreq 1$
      00A1CA 44 26            [ 1] 2917 	cp a,#1 
      00A1CC 04 90            [ 1] 2918 	jreq 0$ 
      00A1CE 85 20 DA         [ 2] 2919 	jp syntax_error 
      00A1D1 4F               [ 1] 2920 0$:	clr a 
      00A1D1 85               [ 1] 2921 	clrw x
      002397                       2922 	_xpush   ; divisor  
      00A1D2 5B 02 90 85      [ 2]    1     subw y,#CELL_SIZE
      00A1D6 81 F7            [ 1]    2     ld (y),a 
      00A1D7 90 EF 01         [ 2]    3     ldw (1,y),x 
      0023A0                       2923 1$: _at_next 
      00A1D7 CD 97 57         [ 1]    1     ld a,(3,y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      00A1DA CD               [ 1]    2     ldw x,y 
      00A1DB 98 B4            [ 2]    3     ldw x,(4,x)
      00A1DD A1               [ 2] 2924 	tnzw x 
      00A1DE 84 27            [ 1] 2925 	jreq 2$ 
      0023A9                       2926 	_xpop
      00A1E0 03 CC            [ 1]    1     ld a,(y)
      00A1E2 94               [ 1]    2     ldw x,y 
      00A1E3 3D 90            [ 2]    3     ldw x,(1,x)
      00A1E5 F6 93 EE 01      [ 2]    4     addw y,#CELL_SIZE 
      0023B2                       2927 	_xdrop  
      00A1E9 72 A9 00 03      [ 2]    1     addw y,#CELL_SIZE 
      00A1ED 9F               [ 1] 2928 	ld a,xl
      00A1EE 27 68            [ 1] 2929 	and a,#7
      00A1F0 88               [ 1] 2930 	swap a 
      00A1F1 CD 95 99         [ 1] 2931 	ld ADC_CR1,a
      00A1F4 A1 80 27 03      [ 1] 2932 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A1F8 CC 94 3D FE      [ 1] 2933 	bset ADC_CR1,#ADC_CR1_ADON 
      0023C5                       2934 	_usec_dly 7 
      00A1FC 72 5C 00         [ 2]    1     ldw x,#(16*7-2)/4
      00A1FF 02               [ 2]    2     decw x
      00A200 72               [ 1]    3     nop 
      00A201 5C 00            [ 1]    4     jrne .-4
      00A203 02 A3            [ 2] 2935 	jra 3$
      00A205 A2 62 27 08      [ 1] 2936 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A209 A3 A2 75 27      [ 1] 2937 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      0023D6                       2938 3$:	
      00A20D 03               [ 4] 2939 	ret
                                   2940 
                                   2941 ;-----------------------------
                                   2942 ; BASIC: ADCREAD (channel)
                                   2943 ; read adc channel {0..5}
                                   2944 ; output:
                                   2945 ;   A 		TK_INTGR 
                                   2946 ;   X 		value 
                                   2947 ;-----------------------------
      0023D7                       2948 analog_read:
      00A20E CC 94 3D         [ 4] 2949 	call func_args 
      00A211 A1 01            [ 1] 2950 	cp a,#1 
      00A211 84 89            [ 1] 2951 	jreq 1$
      00A213 88 13 BD         [ 2] 2952 	jp syntax_error
      00A214                       2953 1$: _xpop 
      00A214 0A 01            [ 1]    1     ld a,(y)
      00A216 27               [ 1]    2     ldw x,y 
      00A217 26 CD            [ 2]    3     ldw x,(1,x)
      00A219 95 99 A1 84      [ 2]    4     addw y,#CELL_SIZE 
      00A21D 27 07 A1         [ 2] 2954 	cpw x,#5 
      00A220 03 27            [ 2] 2955 	jrule 2$
      00A222 0D CC            [ 1] 2956 	ld a,#ERR_BAD_VALUE
      00A224 94 3D BF         [ 2] 2957 	jp tb_error 
      00A226 9F               [ 1] 2958 2$: ld a,xl
      00A226 C6 00 02         [ 1] 2959 	ld acc8,a 
      00A229 AB 03            [ 1] 2960 	ld a,#5
      00A22B C7 00 02         [ 1] 2961 	sub a,acc8 
      00A22E 20 03 CD         [ 1] 2962 	ld ADC_CSR,a
      00A231 95 B2 54 02      [ 1] 2963 	bset ADC_CR2,#ADC_CR2_ALIGN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      00A233 72 10 54 01      [ 1] 2964 	bset ADC_CR1,#ADC_CR1_ADON
      00A233 CD 95 99 A1 08   [ 2] 2965 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00A238 27 DA 5B         [ 2] 2966 	ldw x,ADC_DRH
      00A23B 03 20            [ 1] 2967 	ld a,#TK_INTGR
      00A23D 1A               [ 4] 2968 	ret 
                                   2969 
                                   2970 ;-----------------------
                                   2971 ; BASIC: DREAD(pin)
                                   2972 ; Arduino pins 
                                   2973 ; read state of a digital pin 
                                   2974 ; pin# {0..15}
                                   2975 ; output:
                                   2976 ;    A 		TK_INTGR
                                   2977 ;    X      0|1 
                                   2978 ;-------------------------
                           000001  2979 	PINNO=1
                           000001  2980 	VSIZE=1
      00A23E                       2981 digital_read:
      002413                       2982 	_vars VSIZE 
      00A23E 5B 01            [ 2]    1     sub sp,#VSIZE 
      00A240 CD A1 65         [ 4] 2983 	call func_args
      00A243 CF 00            [ 1] 2984 	cp a,#1
      00A245 1A 55            [ 1] 2985 	jreq 1$
      00A247 00 03 00         [ 2] 2986 	jp syntax_error
      00241F                       2987 1$: _xpop 
      00A24A 02 85            [ 1]    1     ld a,(y)
      00A24C A3               [ 1]    2     ldw x,y 
      00A24D A2 62            [ 2]    3     ldw x,(1,x)
      00A24F 26 05 CE 00      [ 2]    4     addw y,#CELL_SIZE 
      00A253 1A 20 12         [ 2] 2988 	cpw x,#15 
      00A256 23 05            [ 2] 2989 	jrule 2$
      00A256 20 26            [ 1] 2990 	ld a,#ERR_BAD_VALUE
      00A258 CC 13 BF         [ 2] 2991 	jp tb_error 
      00A258 55 00 03         [ 4] 2992 2$:	call select_pin 
      00A25B 00 02            [ 1] 2993 	ld (PINNO,sp),a
      00A25D 5B 02            [ 1] 2994 	ld a,(GPIO_IDR,x)
      00A25F CC 94            [ 1] 2995 	tnz (PINNO,sp)
      00A261 E3 05            [ 1] 2996 	jreq 8$
      00A262 44               [ 1] 2997 3$: srl a 
      00A262 CD 97            [ 1] 2998 	dec (PINNO,sp)
      00A264 57 FB            [ 1] 2999 	jrne 3$ 
      00A265 A4 01            [ 1] 3000 8$: and a,#1 
      00A265 CD               [ 1] 3001 	clrw x 
      00A266 A1               [ 1] 3002 	ld xl,a 
      00A267 65               [ 1] 3003 	clr a 
      00A268                       3004 	_drop VSIZE
      00A268 CF 00            [ 2]    1     addw sp,#VSIZE 
      00A26A 05               [ 4] 3005 	ret
                                   3006 
                                   3007 
                                   3008 ;-----------------------
                                   3009 ; BASIC: DWRITE pin,0|1
                                   3010 ; Arduino pins 
                                   3011 ; write to a digital pin 
                                   3012 ; pin# {0..15}
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



                                   3013 ; output:
                                   3014 ;    A 		TK_INTGR
                                   3015 ;    X      0|1 
                                   3016 ;-------------------------
                           000001  3017 	PINNO=1
                           000002  3018 	PINVAL=2
                           000002  3019 	VSIZE=2
      00244A                       3020 digital_write:
      00244A                       3021 	_vars VSIZE 
      00A26B E6 02            [ 2]    1     sub sp,#VSIZE 
      00A26D C7 00 03         [ 4] 3022 	call arg_list  
      00A270 35 03            [ 1] 3023 	cp a,#2 
      00A272 00 02            [ 1] 3024 	jreq 1$
      00A274 81 13 BD         [ 2] 3025 	jp syntax_error
      00A275                       3026 1$: _xpop 
      00A275 CD 97            [ 1]    1     ld a,(y)
      00A277 57               [ 1]    2     ldw x,y 
      00A278 EE 01            [ 2]    3     ldw x,(1,x)
      00A278 CD A1 65 CF      [ 2]    4     addw y,#CELL_SIZE 
      00A27C 00               [ 1] 3027 	ld a,xl 
      00A27D 1A 02            [ 1] 3028 	ld (PINVAL,sp),a
      00A27E                       3029 	_xpop 
      00A27E 85 52            [ 1]    1     ld a,(y)
      00A280 04               [ 1]    2     ldw x,y 
      00A281 89 CE            [ 2]    3     ldw x,(1,x)
      00A283 00 05 1F 03      [ 2]    4     addw y,#CELL_SIZE 
      00A287 CE 00 01         [ 2] 3030 	cpw x,#15 
      00A28A 1F 05            [ 2] 3031 	jrule 2$
      00A28C CE 00            [ 1] 3032 	ld a,#ERR_BAD_VALUE
      00A28E 1A 20 D7         [ 2] 3033 	jp tb_error 
      00A291 CD 29 CB         [ 4] 3034 2$:	call select_pin 
      00A291 CD 97            [ 1] 3035 	ld (PINNO,sp),a 
      00A293 57 1E            [ 1] 3036 	ld a,#1
      00A295 03 CF            [ 1] 3037 	tnz (PINNO,sp)
      00A297 00 05            [ 1] 3038 	jreq 4$
      00A299 E6               [ 1] 3039 3$: sll a
      00A29A 02 C7            [ 1] 3040 	dec (PINNO,sp)
      00A29C 00 03            [ 1] 3041 	jrne 3$
      00A29E 1E 05            [ 1] 3042 4$: tnz (PINVAL,sp)
      00A2A0 CF 00            [ 1] 3043 	jrne 5$
      00A2A2 01               [ 1] 3044 	cpl a 
      00A2A3 85 5B            [ 1] 3045 	and a,(GPIO_ODR,x)
      00A2A5 04 FC            [ 2] 3046 	jra 8$
      00A2A7 EA 00            [ 1] 3047 5$: or a,(GPIO_ODR,x)
      00A2A7 4D 26            [ 1] 3048 8$: ld (GPIO_ODR,x),a 
      002492                       3049 	_drop VSIZE 
      00A2A9 0D A3            [ 2]    1     addw sp,#VSIZE 
      00A2AB B4               [ 4] 3050 	ret
                                   3051 
                                   3052 
                                   3053 ;-----------------------
                                   3054 ; BASIC: STOP
                                   3055 ; stop progam execution  
                                   3056 ; without resetting pointers 
                                   3057 ; the program is resumed
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



                                   3058 ; with RUN 
                                   3059 ;-------------------------
      002495                       3060 stop:
      00A2AC 80 25 07 89 CD   [ 2] 3061 	btjt flags,#FRUN,2$
      00A2B1 A6               [ 4] 3062 	ret 
      00249B                       3063 2$:	 
                                   3064 ; create space on cstack to save context 
      00A2B2 38 85 27         [ 2] 3065 	ldw x,#break_point 
      00A2B5 01 43 81         [ 4] 3066 	call puts 
      00A2B8                       3067 	_drop 2 ;drop return address 
      00A2B8 72 01            [ 2]    1     addw sp,#2 
      0024A3                       3068 	_vars CTXT_SIZE ; context size 
      00A2BA 00 23            [ 2]    1     sub sp,#CTXT_SIZE 
      00A2BC 02 4F 81         [ 4] 3069 	call save_context 
      00A2BF AE 16 68         [ 2] 3070 	ldw x,#tib 
      00A2BF 72 09 00         [ 2] 3071 	ldw basicptr,x
      00A2C2 23               [ 1] 3072 	clr (x)
      00A2C3 12 5B 02 CD      [ 1] 3073 	clr count  
      00A2C7 9E               [ 1] 3074 	clrw x 
      00A2C8 49 5B 04         [ 2] 3075 	ldw in.w,x
      00A2CB 72 19 00 23      [ 1] 3076 	bres flags,#FRUN 
      00A2CF 72 10 00 23      [ 1] 3077 	bset flags,#FBREAK
      00A2D3 CC 94 DB         [ 2] 3078 	jp interpreter 
      00A2D6 0A 62 72 65 61 6B 20  3079 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   3080 
                                   3081 ;-----------------------
                                   3082 ; BASIC: NEW
                                   3083 ; from command line only 
                                   3084 ; free program memory
                                   3085 ; and clear variables 
                                   3086 ;------------------------
      0024E0                       3087 new: 
      00A2D6 CD 95 99         [ 4] 3088 	call cmd_line_only
      00A2D9 A1 03 26 1F      [ 1] 3089 0$:	clr flags 
      00A2DD 89 CD 95         [ 4] 3090 	call clear_basic 
      00A2E0 B2               [ 4] 3091 	ret 
                                   3092 
                                   3093 ;-----------------------------------
                                   3094 ; erase program at specified address
                                   3095 ; keep signature and size fields. 
                                   3096 ; signature replaced by "XX"
                                   3097 ; input:
                                   3098 ;    X    address 
                                   3099 ;-----------------------------------
                           000001  3100 	ADDR=1    ; program address
                           000003  3101 	PRG_SIZE=3    ; program size 
                           000005  3102 	BLOCKS=5 ; blocks to erase 
                           000006  3103 	VSIZE=6
      0024EB                       3104 erase_program:
      00A2E1 85               [ 2] 3105 	pushw x 
      00A2E2 CD AF 93         [ 4] 3106 	call skip_string 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      00A2E5 26               [ 2] 3107 	popw x 
      00A2E6 05 A6 12         [ 4] 3108 	call search_program 
      00A2E9 CC 94            [ 1] 3109 	jreq 9$
      00A2EB 3F CF 00         [ 4] 3110 	call move_erase_to_ram
      00A2EE 1C 1D 00 02      [ 1] 3111 	clr farptr 
      0024FC                       3112 	_vars VSIZE 
      00A2F2 FE 72            [ 2]    1     sub sp,#VSIZE 
      00A2F4 BB 00 1C         [ 2] 3113 1$:	subw x,#4 
      00A2F7 CF 00            [ 2] 3114 	ldw (ADDR,sp),x
      00A2F9 1E 20            [ 2] 3115 	ldw x,(2,x)
      00A2FB 19 55            [ 2] 3116 	ldw (PRG_SIZE,sp),x
      00A2FD 00 04            [ 1] 3117 	ld a,#BLOCK_SIZE 
      00A2FF 00               [ 2] 3118 	div x,a 
      00A300 02               [ 1] 3119 	tnz a 
      00A301 CE 00            [ 1] 3120 	jreq 2$ 
      00A303 1C               [ 1] 3121 	incw x 
      00A304 C3 00            [ 2] 3122 2$:	ldw (BLOCKS,sp),x 
      00A306 1E 2B            [ 2] 3123 	ldw x,(ADDR,sp)
      00A308 0C AE 93         [ 2] 3124 	ldw ptr16,x 
      00A30B 94 CD 87         [ 4] 3125 3$:	call block_erase
      00A30E 02 55 00         [ 2] 3126 	ldw x,#BLOCK_SIZE 
      00A311 03 00 02         [ 4] 3127 	call incr_farptr
      00A314 81 05            [ 2] 3128 	ldw x,(BLOCKS,sp)
      00A315 5A               [ 2] 3129 	decw x 
      00A315 5B 02            [ 2] 3130 	ldw (BLOCKS,sp),x 
      00A317 26 F0            [ 1] 3131 	jrne 3$ 
                                   3132 ; write XX and size at addr 
      00A317 CD 9A            [ 2] 3133 	ldw x,(ADDR,sp)
      00A319 81 CD 91         [ 2] 3134 	ldw ptr16,x 
      00A31C A9 CE            [ 1] 3135 	ld a,#'X 
      00A31E 00               [ 1] 3136 	clrw x 
      00A31F 1E CF 00         [ 4] 3137 	call write_byte 
      00A322 30 CF 00         [ 4] 3138 	call write_byte 
      00A325 32 5F            [ 1] 3139 	ld a,(PRG_SIZE,sp)
      00A327 CF 00 07         [ 4] 3140 	call write_byte 
      00A32A 72 5F            [ 1] 3141 	ld a,(PRG_SIZE+1,sp)
      00A32C 00 09 72         [ 4] 3142 	call write_byte 
      00253D                       3143 	_drop VSIZE 
      00A32F 5F 00            [ 2]    1     addw sp,#VSIZE 
      00253F                       3144 9$:	
      00A331 0A               [ 4] 3145 	ret 
                                   3146 
                                   3147 ;-----------------------------------
                                   3148 ; BASIC: ERASE \E | \F || address
                                   3149 ; erase all block in range from 
                                   3150 ;  'app_space' to FLASH end (0x27fff)
                                   3151 ;  or all EEPROM 
                                   3152 ; that contains a non zero byte. 
                                   3153 ; if the argument is an address  
                                   3154 ; mark the program at this address 
                                   3155 ; as erased. Erase the blocks 
                                   3156 ; replace signature by 'XX' and 
                                   3157 ; keep size field.  
                                   3158 ;-----------------------------------
                           000001  3159 	LIMIT=1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



                           000003  3160 	VSIZE = 3 
      002540                       3161 cmd_erase:
      00A332 CE 00 1C         [ 4] 3162 	call cmd_line_only
      00A335 CF 00 05 E6      [ 1] 3163 	clr farptr 
      00A339 02 C7 00         [ 4] 3164 	call next_token
      00A33C 03 35            [ 1] 3165 	cp a,#TK_LABEL 
      00A33E 03 00            [ 1] 3166 	jreq erase_program  
      00254E                       3167 	_vars VSIZE 
      00A340 02 72            [ 2]    1     sub sp,#VSIZE 
      00A342 10 00            [ 1] 3168 	cp a,#TK_CHAR 
      00A344 23 CC            [ 1] 3169 	jreq 0$ 
      00A346 94 DB BD         [ 2] 3170 	jp syntax_error
      00A348 CD 15 5B         [ 4] 3171 0$: call get_char 
      00A348 5B 02            [ 1] 3172 	and a,#0XDF 
      00A34A 72 5D            [ 1] 3173 	cp a,#'E
      00A34C 00 34            [ 1] 3174 	jrne 1$
      00A34E 27 1D 72         [ 2] 3175 	ldw x,#EEPROM_BASE 
      00A351 5A 00 34         [ 2] 3176 	ldw farptr+1,x 
      00A354 1E 01 CF         [ 2] 3177 	ldw x,#EEPROM_END
      00A357 00               [ 1] 3178 	clr a 
      00A358 05 1E            [ 2] 3179 	jra 3$ 
      00A35A 03 CF            [ 1] 3180 1$: cp a,#'F 
      00A35C 00 02            [ 1] 3181 	jreq 2$
      00A35E 1E 05 CF         [ 2] 3182 	ldw x,#err_bad_value
      00A361 00 1C 1E         [ 2] 3183 	jp tb_error
      002576                       3184 2$:
      00A364 07 CF 00         [ 2] 3185 	ldw x,#app_space  
      00A367 1E 5B 08         [ 2] 3186 	ldw farptr+1,x 
      00A36A CC 94            [ 1] 3187 	ld a,#(FLASH_END>>16)&0XFF 
      00A36C DB 7F FF         [ 2] 3188 	ldw x,#FLASH_END&0xffff
      00A36D                       3189 3$:
      00A36D AE 17            [ 1] 3190 	ld (LIMIT,sp),a 
      00A36F FF 94            [ 2] 3191 	ldw (LIMIT+1,sp),x 
                                   3192 ; operation done from RAM
                                   3193 ; copy code to RAM in tib   
      00A371 CC 94 BC         [ 4] 3194 	call move_erase_to_ram
      00A374                       3195 4$:	 
      00A374 CD 95 99         [ 4] 3196     call scan_block 
      00A377 A1 85            [ 1] 3197 	jreq 5$  ; block already erased 
      00A379 27 03            [ 1] 3198     ld a,#'E 
      00A37B CC 94 3D         [ 4] 3199     call putc 
      00A37E CD 95 C1         [ 4] 3200 	call block_erase   
                                   3201 ; this block is clean, next  
      00A381 CF 00 1A         [ 2] 3202 5$:	ldw x,#BLOCK_SIZE
      00A384 CD 86 AE         [ 4] 3203 	call incr_farptr
                                   3204 ; check limit, 24 bit substraction  	
      00A387 27 03            [ 1] 3205 	ld a,(LIMIT,sp)
      00A389 CD 86            [ 2] 3206 	ldw x,(LIMIT+1,sp)
      00A38B B5 72 3F 00      [ 2] 3207 	subw x,farptr+1
      00A38F 1A 72 5C         [ 1] 3208 	sbc a,farptr 
      00A392 00 1B            [ 1] 3209 	jrugt 4$ 
      00A394 72 3F 00         [ 4] 3210 9$: call clear_basic
      00A397 1A 72            [ 2] 3211 	ldw x,(LIMIT+1,sp)
      00A399 5C 00 1B         [ 2] 3212 	cpw x,#EEPROM_END
      00A39C 72 C7            [ 1] 3213 	jrne 10$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00A39E 00 1A 81         [ 4] 3214 	call func_eefree 
      00A3A1                       3215 10$:
      0025B5                       3216 	_drop VSIZE 
      00A3A1 90 89            [ 2]    1     addw sp,#VSIZE 
      00A3A3 AE               [ 4] 3217 	ret 
                                   3218 	
                                   3219 
                                   3220 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3221 ;  check for application signature 
                                   3222 ; input:
                                   3223 ;	x       address to check 
                                   3224 ; output:
                                   3225 ;   Z      1  signature present 
                                   3226 ;          0 not app signature  
                                   3227 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025B8                       3228 qsign: 
      00A3A4 00               [ 2] 3229 	pushw x 
                                   3230 ; align to block 
      00A3A5 64               [ 1] 3231 	ld a,xl 
      00A3A6 90 AE            [ 1] 3232 	and a,#BLOCK_SIZE 
      00A3A8 03               [ 1] 3233 	ld xl,a 
      00A3A9 E8               [ 2] 3234 	ldw x,(x)
      00A3AA 20 22 D3         [ 2] 3235 	cpw x,SIGNATURE ; "TB" 
      00A3AC 85               [ 2] 3236 	popw x 
      00A3AC 90               [ 4] 3237 	ret 
                                   3238 
                                   3239 ;--------------------------------------
                                   3240 ;  fill write buffer 
                                   3241 ;  input:
                                   3242 ;    y  point to output buffer 
                                   3243 ;    x  point to source 
                                   3244 ;    a  bytes to write in buffer 
                                   3245 ;  output:
                                   3246 ;    y   += A 
                                   3247 ;    X   += A 
                                   3248 ;    A   0 
                                   3249 ;---------------------------------------
      0025C3                       3250 fill_write_buffer:
      00A3AD 89               [ 1] 3251 	push a 
      00A3AE CD               [ 1] 3252 	tnz a 
      00A3AF 97 74            [ 1] 3253 	jreq 9$ 
      00A3B1 A1               [ 1] 3254 1$: ld a,(x)
      00A3B2 02               [ 1] 3255 	incw x 
      00A3B3 27 03            [ 1] 3256 	ld (y),a 
      00A3B5 CC 94            [ 1] 3257 	incw y 
      00A3B7 3D 01            [ 1] 3258 	dec (1,sp) 
      00A3B8 26 F6            [ 1] 3259 	jrne 1$ 
      00A3B8 90               [ 1] 3260 9$:	pop a 
      00A3B9 F6               [ 4] 3261     ret 	
                                   3262 
                                   3263 ;--------------------------------------
                                   3264 ;  fill pad buffer with zero 
                                   3265 ;  input:
                                   3266 ;	none 
                                   3267 ;  output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



                                   3268 ;    y     buffer address  
                                   3269 ;--------------------------------------
      0025D3                       3270 clear_block_buffer:
      00A3BA 93               [ 1] 3271 	push a 
      00A3BB EE 01 72 A9      [ 2] 3272 	ldw y,#block_buffer 
      00A3BF 00 03            [ 2] 3273 	pushw y
      00A3C1 89 90            [ 1] 3274 	ld a,#BLOCK_SIZE   
      00A3C3 F6 93            [ 1] 3275 1$:	clr (y)
      00A3C5 EE 01            [ 1] 3276 	incw y
      00A3C7 72               [ 1] 3277 	dec a  
      00A3C8 A9 00            [ 1] 3278 	jrne 1$ 	
      00A3CA 03 90            [ 2] 3279 9$: popw y 
      00A3CC 93               [ 1] 3280 	pop a 			
      00A3CD 85               [ 4] 3281 	ret 
                                   3282 
                                   3283 
                                   3284 ;----------------------------------
                                   3285 ;  search  a free space space that 
                                   3286 ;  fit program size 
                                   3287 ; input:
                                   3288 ;    X    program size 
                                   3289 ; output:
                                   3290 ;    X    address | 0 
                                   3291 ;------------------------------------
                           000001  3292 	PG_SIZE=1 
                           000002  3293 	VSIZE=2 
      00A3CE                       3294 search_fit:
      00A3CE 89               [ 2] 3295 	pushw x; PG_SIZE 
      00A3CF AE F4 24         [ 2] 3296 	ldw x,#app_space 
      00A3D2 65 90 A3         [ 4] 3297 1$:	call is_erased 
      00A3D5 7A 12            [ 1] 3298 	jreq 4$
      00A3D7 2B               [ 1] 3299 	ld a,(x)
      00A3D8 01 5C            [ 1] 3300 	or a,(1,x)
      00A3DA 27 23            [ 1] 3301 	jreq 9$ ; free space 
      00A3DA 9E C7 53         [ 4] 3302 2$:	call skip_to_next
      00A3DD 0D               [ 2] 3303 	tnzw x 
      00A3DE 9F C7            [ 1] 3304 	jrne 1$
      00A3E0 53 0E            [ 2] 3305 	jra 9$
      0025FD                       3306 4$: ; erased program 
                                   3307     ; does it fit? 
      00A3E2 8C 56 9E         [ 2] 3308 	ldw acc16,x 
      00A3E5 C7 53            [ 2] 3309 	ldw x,(2,x) ; size erased program
                                   3310 ; top multiple of BLOCK_SIZE 
      00A3E7 0F 9F C7         [ 2] 3311 	addw x,#4 
      00A3EA 53 10 72         [ 2] 3312 	addw x,#BLOCK_SIZE-1 
      00A3ED 10               [ 1] 3313 	ld a,xl 
      00A3EE 53 08            [ 1] 3314 	and a,#BLOCK_SIZE 
      00A3F0 72               [ 1] 3315 	ld xl,a  
      00A3F1 10 53            [ 2] 3316 	cpw x,(1,sp) ; size program to save 
      00A3F3 00 72            [ 1] 3317 	jruge 8$   ; fit 
      00A3F5 10 53 04         [ 2] 3318 	ldw x,acc16 
      00A3F8 85 CD            [ 2] 3319 	jra 2$ 
      00A3FA A9 08 72         [ 2] 3320 8$: ldw x,acc16 ; fit in this one 	
      002618                       3321 9$:	_drop VSIZE 
      00A3FD 11 53            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      00A3FF 08               [ 4] 3322 	ret  
                                   3323 
                                   3324 ;-------------------------
                                   3325 ; erase header and 
                                   3326 ; size fields 
                                   3327 ; input: 
                                   3328 ;    X    program address 
                                   3329 ; output:
                                   3330 ;    X    unchanged 
                                   3331 ;-------------------------
                           000001  3332 	COUNT=1 
      00261B                       3333 erase_header:
      00A400 72               [ 2] 3334 	pushw x 
      00A401 11 53            [ 1] 3335 	push #4 ; COUNT 
      00A403 00 90 85 81      [ 1] 3336 	clr farptr 
      00A407 CF 00 19         [ 2] 3337 	ldw ptr16,x 
      00A407 CD               [ 1] 3338 	clr a 
      00A408 97               [ 1] 3339 	clrw x 
      00A409 74 A1 02         [ 4] 3340 1$:	call write_byte 
      00A40C 27 12            [ 1] 3341 	dec (COUNT,sp)
      00A40E A1 01            [ 1] 3342 	jrne 1$
      00262E                       3343 	_drop 1 
      00A410 27 03            [ 2]    1     addw sp,#1 
      00A412 CC               [ 2] 3344 	popw x 
      00A413 94 3D 4F         [ 2] 3345 	ldw ptr16,x 
      00A416 5F               [ 4] 3346 	ret 
                                   3347 
                                   3348 ;---------------------------------------
                                   3349 ; BASIC: SAVE
                                   3350 ; write application from RAM to FLASH
                                   3351 ; at UFLASH address
                                   3352 ;--------------------------------------
                           000001  3353 	XTEMP=1
                           000003  3354 	COUNT=3  ; last count bytes written 
                           000004  3355 	CNT_LO=4 ; count low byte 
                           000005  3356 	TOWRITE=5 ; how bytes left to write  
                           000006  3357 	VSIZE=6 
      002635                       3358 cmd_save:
      00A417 72 A2 00         [ 4] 3359 	call cmd_line_only
      00A41A 03               [ 2] 3360 	pushw x 
      00A41B 90 F7            [ 2] 3361 	pushw y 
      00263B                       3362 	_vars VSIZE
      00A41D 90 EF            [ 2]    1     sub sp,#VSIZE 
      00A41F 01 90 E6         [ 4] 3363 	call prog_size 
      00A422 03 93            [ 1] 3364 	jrne 0$ 
      00A424 EE 04 5D         [ 2] 3365 	jp 9$ ; no program to save 
      00A427 27 25            [ 2] 3366 0$:	ldw (TOWRITE,sp),x ; program size
      00A429 90 F6 93 EE      [ 1] 3367 	clr farptr 
      00A42D 01 72 A9         [ 4] 3368 	call search_fit
      00A430 00 03 72         [ 2] 3369 	ldw ptr16,x 
      00A433 A9 00 03         [ 2] 3370 	ldw x,#0xFFFF
      00A436 9F A4 07 4E      [ 2] 3371 	subw x,ptr16 ; free flash 
      00A43A C7 54 01         [ 2] 3372 	subw x,#4 ; signature and size field 
      00A43D 72 16            [ 2] 3373 	cpw x,(TOWRITE,sp)
      00A43F 50 CA            [ 1] 3374 	jruge 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



      00A441 72 10            [ 1] 3375 	ld a,#ERR_MEM_FULL
      00A443 54 01 AE         [ 2] 3376 	jp tb_error 
      002664                       3377 1$: ; check if header bytes are zero's 
      00A446 00 1B 5A         [ 2] 3378 	ldw x,ptr16 
      00A449 9D               [ 1] 3379 	ld a,(x)
      00A44A 26 FA            [ 1] 3380 	or a,(1,x)
      00A44C 20 08            [ 1] 3381 	or a,(2,x)
      00A44E 72 11            [ 1] 3382 	or a,(3,x)
      00A450 54 01            [ 1] 3383 	jreq 2$
      00A452 72 17 50         [ 4] 3384 	call erase_header ; preserve X and farptr 
      002673                       3385 2$: 
                                   3386 ; block programming flash
                                   3387 ; must be done from RAM
                                   3388 ; moved in tib  
      00A455 CA 04 4D         [ 4] 3389 	call move_prg_to_ram
                                   3390 ; initialize written bytes count  
      00A456 0F 03            [ 1] 3391 	clr (COUNT,sp)
                                   3392 ; first bock 
                                   3393 ; containt signature 2 bytes 
                                   3394 ; and size 	2 bytes 
                                   3395 ; use Y as pointer to block_buffer
      00A456 81 25 D3         [ 4] 3396 	call clear_block_buffer ; -- y=*block_buffer	
                                   3397 ; write signature
      00A457 CE 26 D3         [ 2] 3398 	ldw x,SIGNATURE ; "TB" 
      00A457 CD 97            [ 2] 3399 	ldw (y),x 
      00A459 6F A1 01 27      [ 2] 3400 	addw y,#2
      00A45D 03 CC            [ 2] 3401 	ldw x,(TOWRITE,sp)
      00A45F 94 3D            [ 2] 3402 	ldw (y),x
      00A461 90 F6 93 EE      [ 2] 3403 	addw y,#2   
      00A465 01 72            [ 1] 3404 	ld a,#(BLOCK_SIZE-4)
      00A467 A9 00 03         [ 2] 3405 	cpw x,#(BLOCK_SIZE-4) 
      00A46A A3 00            [ 1] 3406 	jrugt 3$
      00A46C 05               [ 1] 3407 	ld a,xl 
      00A46D 23 05            [ 1] 3408 3$:	ld (CNT_LO,sp),a   
      00A46F A6 0A CC         [ 2] 3409 	ldw x,txtbgn 
      00A472 94 3F            [ 2] 3410 	ldw (XTEMP,sp),x 
      00269B                       3411 32$: 
      00A474 9F C7            [ 2] 3412 	ldw x,(XTEMP,sp)
      00A476 00 0F            [ 1] 3413 	ld a,(CNT_LO,sp)
      00A478 A6 05 C0         [ 4] 3414 	call fill_write_buffer 
      00A47B 00 0F            [ 2] 3415 	ldw (XTEMP,sp),x 
      00A47D C7 54 00         [ 2] 3416 	ldw x,#block_buffer
      00A480 72 16 54         [ 4] 3417 	call write_buffer
      00A483 02 72 10         [ 2] 3418 	ldw x,#BLOCK_SIZE 
      00A486 54 01 72         [ 4] 3419 	call incr_farptr  
                                   3420 ; following blocks 
      00A489 0F 54            [ 2] 3421 	ldw x,(XTEMP,sp)
      00A48B 00 FB CE         [ 2] 3422 	cpw x,txtend 
      00A48E 54 04            [ 1] 3423 	jruge 9$ 
      00A490 A6 84            [ 2] 3424 	ldw x,(TOWRITE,sp)
      00A492 81 F0 03         [ 2] 3425 	subw x,(COUNT,sp)
      00A493 1F 05            [ 2] 3426 	ldw (TOWRITE,sp),x 
      00A493 52 01            [ 1] 3427 	ld a,#BLOCK_SIZE 
      00A495 CD 97 6F         [ 2] 3428 	cpw x,#BLOCK_SIZE 
      00A498 A1 01            [ 1] 3429 	jruge 4$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00A49A 27               [ 1] 3430 	ld a,xl 
      00A49B 03 CC            [ 1] 3431 4$:	ld (CNT_LO,sp),a 
      00A49D 94 3D 90         [ 4] 3432 	call clear_block_buffer 
      00A4A0 F6 93            [ 2] 3433 	jra 32$ 
      0026CD                       3434 9$:	_drop VSIZE 
      00A4A2 EE 01            [ 2]    1     addw sp,#VSIZE 
      00A4A4 72 A9            [ 2] 3435     popw y 
      00A4A6 00               [ 2] 3436 	popw x 
      00A4A7 03               [ 4] 3437 	ret 
                                   3438 
      00A4A8 A3 00                 3439 SIGNATURE: .ascii "TB"
      00A4AA 0F 23                 3440 ERASED: .ascii "XX" 
                                   3441 
                                   3442 ;---------------------
                                   3443 ; check if there is 
                                   3444 ; an erased program 
                                   3445 ; at this address 
                                   3446 ; input:
                                   3447 ;    X    address 
                                   3448 ; output:
                                   3449 ;    Z    Set=erased program 
                                   3450 ;--------------------
      0026D7                       3451 is_erased:
      00A4AC 05               [ 2] 3452 	pushw x 
                                   3453 ; align to BLOCK 
      00A4AD A6               [ 1] 3454 	ld a,xl 
      00A4AE 0A CC            [ 1] 3455 	and a,#BLOCK_SIZE 
      00A4B0 94               [ 1] 3456 	ld xl,a 
      00A4B1 3F               [ 2] 3457 	ldw x,(x)
      00A4B2 CD AA 4B         [ 2] 3458 	cpw x,ERASED 
      00A4B5 6B               [ 2] 3459 	popw x 
      00A4B6 01               [ 4] 3460 	ret 
                                   3461 
                                   3462 ;----------------------------
                                   3463 ;  skip to next program
                                   3464 ;  block 
                                   3465 ; input:
                                   3466 ;    X   actual program addr
                                   3467 ; output:
                                   3468 ;    X   next block 
                                   3469 ;        after program 
                                   3470 ;----------------------------
      0026E2                       3471 skip_to_next:
                                   3472 ; align to block 
      00A4B7 E6               [ 1] 3473 	ld a,xl 
      00A4B8 01 0D            [ 1] 3474 	and a,#BLOCK_SIZE 
      00A4BA 01               [ 1] 3475 	ld xl,a 
      00A4BB 27 05 44         [ 2] 3476 	ldw acc16,x 
      00A4BE 0A 01            [ 2] 3477 	ldw x,(2,x)
      00A4C0 26 FB A4 01      [ 2] 3478 	addw x,acc16 ; blk_addr+prg_size 
      00A4C4 5F 97 4F         [ 2] 3479 	addw x,#4 ; +header fields 
                                   3480 ; align to next block 
      00A4C7 5B 01 81         [ 2] 3481 	addw x,#BLOCK_SIZE-1 
      00A4CA 9F               [ 1] 3482 	ld a,xl 
      00A4CA 52 02            [ 1] 3483 	and a,#0x80 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00A4CC CD               [ 1] 3484 	ld xl,a  
      00A4CD 97               [ 4] 3485 	ret 
                                   3486 
                                   3487 
                                   3488 ;---------------------
                                   3489 ; BASIC: DIR 
                                   3490 ; list programs saved 
                                   3491 ; in flash 
                                   3492 ;--------------------
                           000001  3493 	XTEMP=1 
      0026FA                       3494 cmd_dir:
      00A4CE 74 A1 02         [ 4] 3495 	call cmd_line_only
      00A4D1 27 03 CC         [ 2] 3496 	ldw x,#app_space 
      00A4D4 94               [ 2] 3497 	pushw x 
      002701                       3498 1$: 
      00A4D5 3D 90 F6         [ 4] 3499 	call qsign 
      00A4D8 93 EE            [ 1] 3500 	jrne 4$
      00A4DA 01 72 A9         [ 2] 3501 	addw x,#4
      00A4DD 00 03 9F 6B      [ 1] 3502 	mov base,#16
      00A4E1 02 90 F6         [ 4] 3503 	call prt_i16
      00A4E4 93 EE            [ 1] 3504 	ld a,#SPACE 
      00A4E6 01 72 A9         [ 4] 3505 	call putc 
      00A4E9 00 03            [ 2] 3506 	ldw x,(1,sp)
      00A4EB A3 00            [ 2] 3507 	ldw x,(2,x)
      00A4ED 0F 23 05 A6      [ 1] 3508 	mov base,#10  
      00A4F1 0A CC 94         [ 4] 3509 	call prt_i16 
      00A4F4 3F CD AA         [ 2] 3510 	ldw x,#STR_BYTES
      00A4F7 4B 6B 01         [ 4] 3511 	call puts
      00A4FA A6 01            [ 1] 3512 	ld a,#', 
      00A4FC 0D 01 27         [ 4] 3513 	call putc
      00A4FF 05 48            [ 2] 3514 	ldw x,(1,sp)
      00A501 0A 01 26         [ 2] 3515 	addw x,#8
      00A504 FB 0D 02         [ 4] 3516 	call puts 
      00A507 26 05            [ 1] 3517 	ld a,#CR 
      00A509 43 E4 00         [ 4] 3518 	call putc
      00A50C 20 02            [ 2] 3519 	ldw x,(1,sp)
      00A50E EA 00 E7         [ 4] 3520 3$:	call skip_to_next
      00A511 00 5B            [ 2] 3521 	ldw (1,sp),x 
      00A513 02 81            [ 2] 3522 	jra 1$
      00A515                       3523 4$: ; check if it is an erased program 
      00A515 72 00 00         [ 4] 3524 	call is_erased 
      00A518 23 01            [ 1] 3525 	jreq 3$ 
      002746                       3526 8$: ; done 
      002746                       3527 	_drop 2 
      00A51A 81 02            [ 2]    1     addw sp,#2 
      00A51B 81               [ 4] 3528 	ret 
                                   3529 
                                   3530 ;---------------------
                                   3531 ; BASIC: WRITE expr1,expr2|char|string[,expr|char|string]* 
                                   3532 ; write 1 or more byte to FLASH or EEPROM
                                   3533 ; starting at address  
                                   3534 ; input:
                                   3535 ;   expr1  	is address 
                                   3536 ;   expr2,...,exprn   are bytes to write
                                   3537 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



                                   3538 ;   none 
                                   3539 ;---------------------
      002749                       3540 write:
      00A51B AE A5 42         [ 4] 3541 	call expression
      00A51E CD 87            [ 1] 3542 	cp a,#TK_INTGR 
      00A520 02 5B            [ 1] 3543 	jreq 0$
      00A522 02 52 04         [ 2] 3544 	jp syntax_error
      002753                       3545 0$: _xpop 
      00A525 CD 9E            [ 1]    1     ld a,(y)
      00A527 39               [ 1]    2     ldw x,y 
      00A528 AE 16            [ 2]    3     ldw x,(1,x)
      00A52A 68 CF 00 05      [ 2]    4     addw y,#CELL_SIZE 
      00A52E 7F 72 5F         [ 1] 3546 	ld farptr,a 
      00A531 00 03 5F         [ 2] 3547 	ldw ptr16,x 
      002762                       3548 1$:	
      00A534 CF 00 01         [ 4] 3549 	call next_token 
      00A537 72 11            [ 1] 3550 	cp a,#TK_COMMA 
      00A539 00 23            [ 1] 3551 	jreq 2$ 
      00A53B 72 18            [ 2] 3552 	jra 9$ ; no more data 
      00A53D 00 23 CC         [ 4] 3553 2$:	call next_token 
      00A540 94 DB            [ 1] 3554 	cp a,#TK_CHAR 
      00A542 0A 62            [ 1] 3555 	jreq 4$ 
      00A544 72 65            [ 1] 3556 	cp a,#TK_QSTR
      00A546 61 6B            [ 1] 3557 	jreq 6$
      002776                       3558 	_unget_token 
      00A548 20 70 6F 69 6E   [ 1]    1      mov in,in.saved  
      00A54D 74 2C 20         [ 4] 3559 	call expression
      00A550 52 55            [ 1] 3560 	cp a,#TK_INTGR
      00A552 4E 20            [ 1] 3561 	jreq 3$
      00A554 74 6F 20         [ 2] 3562 	jp syntax_error
      002785                       3563 3$:	_xpop 
      00A557 72 65            [ 1]    1     ld a,(y)
      00A559 73               [ 1]    2     ldw x,y 
      00A55A 75 6D            [ 2]    3     ldw x,(1,x)
      00A55C 65 2E 0A 00      [ 2]    4     addw y,#CELL_SIZE 
      00A560 9F               [ 1] 3564 	ld a,xl 
      00A560 CD               [ 1] 3565 	clrw x 
      00A561 97 4C 72         [ 4] 3566 	call write_byte
      00A564 5F 00            [ 2] 3567 	jra 1$ 
      002795                       3568 4$: ; write character 
      00A566 23               [ 1] 3569 	ld a,(x)
      00A567 CD 92 49 81      [ 1] 3570 	inc in 
      00A56B 5F               [ 1] 3571 	clrw x 
      00A56B 89 CD 95         [ 4] 3572 	call write_byte 
      00A56E B2 85            [ 2] 3573 	jra 1$ 
      0027A0                       3574 6$: ; write string 
      00A570 CD               [ 2] 3575 	pushw x 
      00A571 AF               [ 1] 3576 	ld a,(x)
      00A572 93 27 4A CD      [ 1] 3577 	inc in 
      00A576 84               [ 1] 3578 	clrw x 
      00A577 8D 72 5F         [ 4] 3579 	call write_byte 
      00A57A 00               [ 2] 3580 	popw x 
      00A57B 19               [ 1] 3581 	ld a,(x)
      00A57C 52 06            [ 1] 3582 	jreq 1$
      00A57E 1D               [ 1] 3583 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



      00A57F 00 04            [ 2] 3584 	jra 6$ 	
      0027B1                       3585 9$:
      00A581 1F               [ 4] 3586 	ret 
                                   3587 
                                   3588 
                                   3589 ;---------------------
                                   3590 ;BASIC: CHAR(expr)
                                   3591 ; évaluate expression 
                                   3592 ; and take the 7 least 
                                   3593 ; bits as ASCII character
                                   3594 ; output: 
                                   3595 ; 	A char 
                                   3596 ;---------------------
      0027B2                       3597 func_char:
      00A582 01 EE 02         [ 4] 3598 	call func_args 
      00A585 1F 03            [ 1] 3599 	cp a,#1
      00A587 A6 80            [ 1] 3600 	jreq 1$
      00A589 62 4D 27         [ 2] 3601 	jp syntax_error
      0027BC                       3602 1$:	_xpop
      00A58C 01 5C            [ 1]    1     ld a,(y)
      00A58E 1F               [ 1]    2     ldw x,y 
      00A58F 05 1E            [ 2]    3     ldw x,(1,x)
      00A591 01 CF 00 1A      [ 2]    4     addw y,#CELL_SIZE 
      00A595 CD               [ 1] 3603 	ld a,xl
      00A596 85 0B            [ 1] 3604 	and a,#0x7f 
      00A598 AE               [ 4] 3605 	ret
                                   3606 
                                   3607 ;---------------------
                                   3608 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3609 ; extract first character 
                                   3610 ; of string argument 
                                   3611 ; output:
                                   3612 ;    A:X    int24 
                                   3613 ;---------------------
      0027C9                       3614 ascii:
      00A599 00 80            [ 1] 3615 	ld a,#TK_LPAREN
      00A59B CD 86 06         [ 4] 3616 	call expect 
      00A59E 1E 05 5A         [ 4] 3617 	call next_token 
      00A5A1 1F 05            [ 1] 3618 	cp a,#TK_QSTR 
      00A5A3 26 F0            [ 1] 3619 	jreq 1$
      00A5A5 1E 01            [ 1] 3620 	cp a,#TK_CHAR 
      00A5A7 CF 00            [ 1] 3621 	jreq 2$ 
      00A5A9 1A A6            [ 1] 3622 	cp a,#TK_CFUNC 
      00A5AB 58 5F            [ 1] 3623 	jreq 0$
      00A5AD CD 85 31         [ 2] 3624 	jp syntax_error
      0027E0                       3625 0$: ; cfunc 
      00A5B0 CD               [ 4] 3626 	call (x)
      00A5B1 85 31            [ 2] 3627 	jra 3$
      0027E3                       3628 1$: ; quoted string 
      00A5B3 7B               [ 1] 3629 	ld a,(x)
      00A5B4 03               [ 1] 3630 	push a  
      00A5B5 CD 85 31         [ 4] 3631 	call skip_string
      00A5B8 7B               [ 1] 3632 	pop a  	
      00A5B9 04 CD            [ 2] 3633 	jra 3$ 
      0027EB                       3634 2$: ; character 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



      00A5BB 85 31 5B         [ 4] 3635 	call get_char 
      00A5BE 06               [ 1] 3636 3$:	clrw x 
      00A5BF 02               [ 1] 3637 	rlwa x   
      0027F0                       3638 4$:	_xpush  
      00A5BF 81 A2 00 03      [ 2]    1     subw y,#CELL_SIZE
      00A5C0 90 F7            [ 1]    2     ld (y),a 
      00A5C0 CD 97 4C         [ 2]    3     ldw (1,y),x 
      00A5C3 72 5F            [ 1] 3639 	ld a,#TK_RPAREN 
      00A5C5 00 19 CD         [ 4] 3640 	call expect
      0027FE                       3641 9$:	
      0027FE                       3642 	_xpop  
      00A5C8 95 99            [ 1]    1     ld a,(y)
      00A5CA A1               [ 1]    2     ldw x,y 
      00A5CB 03 27            [ 2]    3     ldw x,(1,x)
      00A5CD 9D 52 03 A1      [ 2]    4     addw y,#CELL_SIZE 
      00A5D1 04               [ 4] 3643 	ret 
                                   3644 
                                   3645 ;---------------------
                                   3646 ;BASIC: KEY
                                   3647 ; wait for a character 
                                   3648 ; received from STDIN 
                                   3649 ; input:
                                   3650 ;	none 
                                   3651 ; output:
                                   3652 ;	a	 character 
                                   3653 ;---------------------
      002808                       3654 key:
      00A5D2 27 03 CC         [ 4] 3655 	call getc 
      00A5D5 94               [ 4] 3656 	ret
                                   3657 
                                   3658 ;----------------------
                                   3659 ; BASIC: QKEY
                                   3660 ; Return true if there 
                                   3661 ; is a character in 
                                   3662 ; waiting in STDIN 
                                   3663 ; input:
                                   3664 ;  none 
                                   3665 ; output:
                                   3666 ;   A     0|-1
                                   3667 ;-----------------------
      00280C                       3668 qkey:: 
      00A5D6 3D               [ 1] 3669 	clrw x 
      00A5D7 CD 95 DB         [ 1] 3670 	ld a,rx1_head
      00A5DA A4 DF A1         [ 1] 3671 	sub a,rx1_tail 
      00A5DD 45 26            [ 1] 3672 	jreq 9$ 
      00A5DF 0C               [ 2] 3673 	cplw x
      00A5E0 AE 40            [ 1] 3674 	ld a,#255    
      002818                       3675 9$: 
      00A5E2 00               [ 4] 3676 	ret 
                                   3677 
                                   3678 ;-------------------------
                                   3679 ; BASIC: UFLASH 
                                   3680 ; return free flash address
                                   3681 ; scan all block starting at 
                                   3682 ; app_space and return 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



                                   3683 ; address of first free block 
                                   3684 ; below extended memory.  
                                   3685 ; return 0 if no free block 
                                   3686 ; input:
                                   3687 ;  none 
                                   3688 ; output:
                                   3689 ;	A:X		FLASH free address
                                   3690 ;---------------------------
      002819                       3691 uflash:
      00A5E3 CF 00 1A AE      [ 1] 3692 	clr farptr 
      00A5E7 47 FF 4F         [ 2] 3693 	ldw x,#app_space 
      00A5EA 20               [ 2] 3694 	pushw x 
      00A5EB 15 A1 46         [ 2] 3695 1$:	ldw ptr16,x 
      00A5EE 27 06 AE         [ 4] 3696 	call scan_block 
      00A5F1 93 45            [ 1] 3697 	jreq 8$
      00A5F3 CC 94            [ 2] 3698 	ldw x,(1,sp)
      00A5F5 3F 00 80         [ 2] 3699 	addw x,#BLOCK_SIZE 
      00A5F6 27 04            [ 1] 3700 	jreq 7$ 
      00A5F6 AE B4            [ 2] 3701 	ldw (1,sp),x 
      00A5F8 80 CF            [ 2] 3702 	jra 1$ 
      002834                       3703 7$: ; no free block 
      00A5FA 00 1A            [ 1] 3704 	clr (1,sp) 
      00A5FC A6 02            [ 1] 3705 	clr (2,sp)
      00A5FE AE               [ 2] 3706 8$: popw x 
      00A5FF 7F               [ 1] 3707 	clr a 
      00A600 FF               [ 4] 3708 	ret 
                                   3709 
                                   3710 
                                   3711 ;---------------------
                                   3712 ; BASIC: USR(addr,arg)
                                   3713 ; execute a function written 
                                   3714 ; in binary code.
                                   3715 ; input:
                                   3716 ;   addr	routine address 
                                   3717 ;   arg 	is an argument
                                   3718 ;           it can be ignore 
                                   3719 ;           by cally. 
                                   3720 ; output:
                                   3721 ;   xstack 	value returned by cally  
                                   3722 ;---------------------
      00A601                       3723 usr:
      00A601 6B 01 1F         [ 4] 3724 	call func_args 
      00A604 02 CD            [ 1] 3725 	cp a,#2
      00A606 84 8D            [ 1] 3726 	jreq 1$  
      00A608 CC 13 BD         [ 2] 3727 	jp syntax_error 
      002845                       3728 1$: 
      002845                       3729 	_at_next ; A:X addr 
      00A608 CD 86 14         [ 1]    1     ld a,(3,y)
      00A60B 27               [ 1]    2     ldw x,y 
      00A60C 08 A6            [ 2]    3     ldw x,(4,x)
      00A60E 45 CD 86         [ 2] 3730 	ldw ptr16,X 
      00284E                       3731 	_xpop  ; arg 
      00A611 A5 CD            [ 1]    1     ld a,(y)
      00A613 85               [ 1]    2     ldw x,y 
      00A614 0B AE            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



      00A616 00 80 CD 86      [ 2]    4     addw y,#CELL_SIZE 
      002857                       3732 	_store_top ; overwrite addr 
      00A61A 06 7B            [ 1]    1     ld (y),a 
      00A61C 01 1E 02         [ 2]    2     ldw (1,y),x     
      00A61F 72 B0 00 1A      [ 6] 3733     call [ptr16]
      00A623 C2               [ 4] 3734 	ret 
                                   3735 
                                   3736 
                                   3737 ;------------------------------
                                   3738 ; BASIC: BYE 
                                   3739 ; halt mcu in its lowest power mode 
                                   3740 ; wait for reset or external interrupt
                                   3741 ; do a cold start on wakeup.
                                   3742 ;------------------------------
      002861                       3743 bye:
      00A624 00 19 22 E0 CD   [ 2] 3744 	btjf UART1_SR,#UART_SR_TC,.
      00A629 92               [10] 3745 	halt
      00A62A 49 1E 02         [ 2] 3746 	jp cold_start  
                                   3747 
                                   3748 ;----------------------------------
                                   3749 ; BASIC: SLEEP 
                                   3750 ; halt mcu until reset or external
                                   3751 ; interrupt.
                                   3752 ; Resume progam after SLEEP command
                                   3753 ;----------------------------------
      00286A                       3754 sleep:
      00A62D A3 47 FF 26 03   [ 2] 3755 	btjf UART1_SR,#UART_SR_TC,.
      00A632 CD 9A E0 22      [ 1] 3756 	bset flags,#FSLEEP
      00A635 8E               [10] 3757 	halt 
      00A635 5B               [ 4] 3758 	ret 
                                   3759 
                                   3760 ;-------------------------------
                                   3761 ; BASIC: PAUSE expr 
                                   3762 ; suspend execution for n msec.
                                   3763 ; input:
                                   3764 ;	none
                                   3765 ; output:
                                   3766 ;	none 
                                   3767 ;------------------------------
      002875                       3768 pause:
      00A636 03 81 34         [ 4] 3769 	call expression
      00A638 A1 84            [ 1] 3770 	cp a,#TK_INTGR
      00A638 89 9F            [ 1] 3771 	jreq 1$ 
      00A63A A4 80 97         [ 2] 3772 	jp syntax_error
      00287F                       3773 1$: _xpop 
      00A63D FE C3            [ 1]    1     ld a,(y)
      00A63F A7               [ 1]    2     ldw x,y 
      00A640 53 85            [ 2]    3     ldw x,(1,x)
      00A642 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A643                       3774 pause02:
      00A643 88 4D 27         [ 2] 3775 	ldw timer,x 
      00A646 0A F6 5C         [ 2] 3776 1$: ldw x,timer 
      00A649 90               [ 2] 3777 	tnzw x 
      00A64A F7 90            [ 1] 3778 	jreq 2$
      00A64C 5C               [10] 3779 	wfi 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



      00A64D 0A 01            [ 1] 3780 	jrne 1$
      002894                       3781 2$:	
      00A64F 26               [ 4] 3782 	ret 
                                   3783 
                                   3784 ;------------------------------
                                   3785 ; BASIC: AWU expr
                                   3786 ; halt mcu for 'expr' milliseconds
                                   3787 ; use Auto wakeup peripheral
                                   3788 ; all oscillators stopped except LSI
                                   3789 ; range: 1ms - 511ms
                                   3790 ; input:
                                   3791 ;  none
                                   3792 ; output:
                                   3793 ;  none:
                                   3794 ;------------------------------
      002895                       3795 awu:
      00A650 F6 84 81         [ 4] 3796   call expression
      00A653 A1 84            [ 1] 3797   cp a,#TK_INTGR
      00A653 88 90            [ 1] 3798   jreq 1$
      00A655 AE 16 B8         [ 2] 3799   jp syntax_error
      00289F                       3800 1$: _xpop 
      00A658 90 89            [ 1]    1     ld a,(y)
      00A65A A6               [ 1]    2     ldw x,y 
      00A65B 80 90            [ 2]    3     ldw x,(1,x)
      00A65D 7F 90 5C 4A      [ 2]    4     addw y,#CELL_SIZE 
      0028A8                       3801 awu02:
      00A661 26 F9 90         [ 2] 3802   cpw x,#5120
      00A664 85 84            [ 1] 3803   jrmi 1$ 
      00A666 81 0F 50 F2      [ 1] 3804   mov AWU_TBR,#15 
      00A667 A6 1E            [ 1] 3805   ld a,#30
      00A667 89               [ 2] 3806   div x,a
      00A668 AE B4            [ 1] 3807   ld a,#16
      00A66A 80               [ 2] 3808   div x,a 
      00A66B CD A7            [ 2] 3809   jra 4$
      0028B9                       3810 1$: 
      00A66D 57 27 0D         [ 2] 3811   cpw x,#2048
      00A670 F6 EA            [ 1] 3812   jrmi 2$ 
      00A672 01 27 23 CD      [ 1] 3813   mov AWU_TBR,#14
      00A676 A7 62            [ 1] 3814   ld a,#80
      00A678 5D               [ 2] 3815   div x,a 
      00A679 26 F0            [ 2] 3816   jra 4$   
      0028C7                       3817 2$:
      00A67B 20 1B 50 F2      [ 1] 3818   mov AWU_TBR,#7
      00A67D                       3819 3$:  
                                   3820 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A67D CF 00 0E         [ 2] 3821   cpw x,#64 
      00A680 EE 02            [ 2] 3822   jrule 4$ 
      00A682 1C 00 04 1C      [ 1] 3823   inc AWU_TBR 
      00A686 00               [ 2] 3824   srlw x 
      00A687 7F 9F            [ 2] 3825   jra 3$ 
      0028D7                       3826 4$:
      00A689 A4               [ 1] 3827   ld a, xl
      00A68A 80               [ 1] 3828   dec a 
      00A68B 97 13            [ 1] 3829   jreq 5$
      00A68D 01               [ 1] 3830   dec a 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



      0028DC                       3831 5$: 
      00A68E 24 05            [ 1] 3832   and a,#0x3e 
      00A690 CE 00 0E         [ 1] 3833   ld AWU_APR,a 
      00A693 20 E0 CE 00      [ 1] 3834   bset AWU_CSR,#AWU_CSR_AWUEN
      00A697 0E               [10] 3835   halt 
                                   3836 
      00A698 5B               [ 4] 3837   ret 
                                   3838 
                                   3839 ;------------------------------
                                   3840 ; BASIC: TICKS
                                   3841 ; return msec ticks counter value 
                                   3842 ; input:
                                   3843 ; 	none 
                                   3844 ; output:
                                   3845 ;	X 		TK_INTGR
                                   3846 ;-------------------------------
      0028E7                       3847 get_ticks:
      00A699 02 81 0F         [ 1] 3848 	ld a,ticks 
      00A69B CE 00 10         [ 2] 3849 	ldw x,ticks+1 
      00A69B 89               [ 4] 3850 	ret 
                                   3851 
                                   3852 ;------------------------------
                                   3853 ; BASIC: ABS(expr)
                                   3854 ; return absolute value of expr.
                                   3855 ; input:
                                   3856 ;   none
                                   3857 ; output:
                                   3858 ;   xstack    positive int24 
                                   3859 ;-------------------------------
      0028EE                       3860 abs:
      00A69C 4B 04 72         [ 4] 3861 	call func_args 
      00A69F 5F 00            [ 1] 3862 	cp a,#1 
      00A6A1 19 CF            [ 1] 3863 	jreq 0$ 
      00A6A3 00 1A 4F         [ 2] 3864 	jp syntax_error
      0028F8                       3865 0$:  
      00A6A6 5F CD 85         [ 4] 3866 	call abs24 
      0028FB                       3867 	_xpop 
      00A6A9 31 0A            [ 1]    1     ld a,(y)
      00A6AB 01               [ 1]    2     ldw x,y 
      00A6AC 26 F9            [ 2]    3     ldw x,(1,x)
      00A6AE 5B 01 85 CF      [ 2]    4     addw y,#CELL_SIZE 
      00A6B2 00               [ 4] 3868 	ret 
                                   3869 
                                   3870 ;------------------------------
                                   3871 ; BASIC: LSHIFT(expr1,expr2)
                                   3872 ; logical shift left expr1 by 
                                   3873 ; expr2 bits 
                                   3874 ; output:
                                   3875 ; 	A:x 	result 
                                   3876 ;------------------------------
      002905                       3877 lshift:
      00A6B3 1A 81 EF         [ 4] 3878 	call func_args
      00A6B5 A1 02            [ 1] 3879 	cp a,#2 
      00A6B5 CD 97            [ 1] 3880 	jreq 1$
      00A6B7 4C 89 90         [ 2] 3881 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



      00290F                       3882 1$: _xpop 
      00A6BA 89 52            [ 1]    1     ld a,(y)
      00A6BC 06               [ 1]    2     ldw x,y 
      00A6BD CD 9B            [ 2]    3     ldw x,(1,x)
      00A6BF F0 26 03 CC      [ 2]    4     addw y,#CELL_SIZE 
      00A6C3 A7               [ 1] 3883 	ld a,xl 
      00A6C4 4D               [ 1] 3884 	push a      
      00291A                       3885 	_xpop  ; T>A:X 
      00A6C5 1F 05            [ 1]    1     ld a,(y)
      00A6C7 72               [ 1]    2     ldw x,y 
      00A6C8 5F 00            [ 2]    3     ldw x,(1,x)
      00A6CA 19 CD A6 67      [ 2]    4     addw y,#CELL_SIZE 
      00A6CE CF 00            [ 1] 3886 	tnz (1,sp) 
      00A6D0 1A AE            [ 1] 3887 	jreq 4$
      00A6D2 FF               [ 1] 3888 2$:	rcf 
      00A6D3 FF               [ 2] 3889 	rlcw x 
      00A6D4 72               [ 1] 3890 	rlc a 
      00A6D5 B0 00            [ 1] 3891 	dec (1,sp) 
      00A6D7 1A 1D            [ 1] 3892 	jrne 2$
      00292E                       3893 4$: _drop 1 
      00A6D9 00 04            [ 2]    1     addw sp,#1 
      00A6DB 13               [ 4] 3894 	ret
                                   3895 
                                   3896 ;------------------------------
                                   3897 ; BASIC: RSHIFT(expr1,expr2)
                                   3898 ; logical shift right expr1 by 
                                   3899 ; expr2 bits.
                                   3900 ; output:
                                   3901 ; 	A 		TK_INTGR
                                   3902 ;   X 		result 
                                   3903 ;------------------------------
      002931                       3904 rshift:
      00A6DC 05 24 05         [ 4] 3905 	call func_args
      00A6DF A6 01            [ 1] 3906 	cp a,#2 
      00A6E1 CC 94            [ 1] 3907 	jreq 1$
      00A6E3 3F 13 BD         [ 2] 3908 	jp syntax_error
      00A6E4                       3909 1$: _xpop ; T>A:X
      00A6E4 CE 00            [ 1]    1     ld a,(y)
      00A6E6 1A               [ 1]    2     ldw x,y 
      00A6E7 F6 EA            [ 2]    3     ldw x,(1,x)
      00A6E9 01 EA 02 EA      [ 2]    4     addw y,#CELL_SIZE 
      00A6ED 03               [ 1] 3910     ld a,xl 
      00A6EE 27               [ 1] 3911 	push a    
      002946                       3912 	_xpop  
      00A6EF 03 CD            [ 1]    1     ld a,(y)
      00A6F1 A6               [ 1]    2     ldw x,y 
      00A6F2 9B 01            [ 2]    3     ldw x,(1,x)
      00A6F3 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A6F3 CD 84            [ 1] 3913 	tnz (1,sp)
      00A6F5 CD 0F            [ 1] 3914 	jreq 4$
      00A6F7 03               [ 1] 3915 2$:	rcf 
      00A6F8 CD               [ 1] 3916 	rrc a 
      00A6F9 A6               [ 2] 3917 	rrcw x 
      00A6FA 53 CE            [ 1] 3918 	dec (1,sp) 
      00A6FC A7 53            [ 1] 3919 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



      00295A                       3920 4$: _drop 1 
      00A6FE 90 FF            [ 2]    1     addw sp,#1 
      00A700 72               [ 4] 3921 	ret
                                   3922 
                                   3923 ;--------------------------
                                   3924 ; BASIC: FCPU integer
                                   3925 ; set CPU frequency 
                                   3926 ;-------------------------- 
                                   3927 
      00295D                       3928 fcpu:
      00A701 A9 00            [ 1] 3929 	ld a,#TK_INTGR
      00A703 02 1E 05         [ 4] 3930 	call expect 
      00A706 90 FF 72         [ 4] 3931 	call get_int24 
      00A709 A9               [ 1] 3932 	ld a,xl 
      00A70A 00 02            [ 1] 3933 	and a,#7 
      00A70C A6 7C A3         [ 1] 3934 	ld CLK_CKDIVR,a 
      00A70F 00               [ 4] 3935 	ret 
                                   3936 
                                   3937 ;------------------------------
                                   3938 ; BASIC: PMODE pin#, mode 
                                   3939 ; Arduino pin. 
                                   3940 ; define pin as input or output
                                   3941 ; pin#: {0..15}
                                   3942 ; mode: INPUT|OUTPUT  
                                   3943 ;------------------------------
                           000001  3944 	PINNO=1
                           000001  3945 	VSIZE=1
      00296C                       3946 pin_mode:
      00296C                       3947 	_vars VSIZE 
      00A710 7C 22            [ 2]    1     sub sp,#VSIZE 
      00A712 01 9F 6B         [ 4] 3948 	call arg_list 
      00A715 04 CE            [ 1] 3949 	cp a,#2 
      00A717 00 1C            [ 1] 3950 	jreq 1$
      00A719 1F 01 BD         [ 2] 3951 	jp syntax_error 
      00A71B                       3952 1$: _xpop 
      00A71B 1E 01            [ 1]    1     ld a,(y)
      00A71D 7B               [ 1]    2     ldw x,y 
      00A71E 04 CD            [ 2]    3     ldw x,(1,x)
      00A720 A6 43 1F 01      [ 2]    4     addw y,#CELL_SIZE 
      00A724 AE 16 B8         [ 2] 3953 	ldw ptr16,x ; mode 
      002984                       3954 	_xpop ; Dx pin 
      00A727 CD 84            [ 1]    1     ld a,(y)
      00A729 E7               [ 1]    2     ldw x,y 
      00A72A AE 00            [ 2]    3     ldw x,(1,x)
      00A72C 80 CD 86 06      [ 2]    4     addw y,#CELL_SIZE 
      00A730 1E 01 C3         [ 4] 3955 	call select_pin 
      00A733 00 1E            [ 1] 3956 	ld (PINNO,sp),a  
      00A735 24 16            [ 1] 3957 	ld a,#1 
      00A737 1E 05            [ 1] 3958 	tnz (PINNO,sp)
      00A739 72 F0            [ 1] 3959 	jreq 4$
      00A73B 03               [ 1] 3960 2$:	sll a 
      00A73C 1F 05            [ 1] 3961 	dec (PINNO,sp)
      00A73E A6 80            [ 1] 3962 	jrne 2$ 
      00A740 A3 00            [ 1] 3963 	ld (PINNO,sp),a
      00A742 80 24            [ 1] 3964 	ld a,(PINNO,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



      00A744 01 9F            [ 1] 3965 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A746 6B 04            [ 1] 3966 	ld (GPIO_CR1,x),a 
      00A748 CD A6            [ 1] 3967 4$:	ld a,#OUTP
      00A74A 53 20 CE         [ 1] 3968 	cp a,acc8 
      00A74D 5B 06            [ 1] 3969 	jreq 6$
                                   3970 ; input mode
                                   3971 ; disable external interrupt 
      00A74F 90 85            [ 1] 3972 	ld a,(PINNO,sp)
      00A751 85               [ 1] 3973 	cpl a 
      00A752 81 54            [ 1] 3974 	and a,(GPIO_CR2,x)
      00A754 42 58            [ 1] 3975 	ld (GPIO_CR2,x),a 
                                   3976 ;clear bit in DDR for input mode 
      00A756 58 01            [ 1] 3977 	ld a,(PINNO,sp)
      00A757 43               [ 1] 3978 	cpl a 
      00A757 89 9F            [ 1] 3979 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A759 A4 80            [ 1] 3980 	ld (GPIO_DDR,x),a 
      00A75B 97 FE            [ 2] 3981 	jra 9$
      0029BC                       3982 6$: ;output mode  
      00A75D C3 A7            [ 1] 3983 	ld a,(PINNO,sp)
      00A75F 55 85            [ 1] 3984 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A761 81 02            [ 1] 3985 	ld (GPIO_DDR,x),a 
      00A762 7B 01            [ 1] 3986 	ld a,(PINNO,sp)
      00A762 9F A4            [ 1] 3987 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A764 80 97            [ 1] 3988 	ld (GPIO_CR2,x),a 
      0029C8                       3989 9$:	
      0029C8                       3990 	_drop VSIZE 
      00A766 CF 00            [ 2]    1     addw sp,#VSIZE 
      00A768 0E               [ 4] 3991 	ret
                                   3992 
                                   3993 ;------------------------
                                   3994 ; select Arduino pin 
                                   3995 ; input:
                                   3996 ;   X 	 {0..15} Arduino Dx 
                                   3997 ; output:
                                   3998 ;   A     stm8s208 pin 
                                   3999 ;   X     base address s208 GPIO port 
                                   4000 ;---------------------------
      0029CB                       4001 select_pin:
      00A769 EE               [ 2] 4002 	sllw x 
      00A76A 02 72 BB         [ 2] 4003 	addw x,#arduino_to_8s208 
      00A76D 00               [ 2] 4004 	ldw x,(x)
      00A76E 0E               [ 1] 4005 	ld a,xl 
      00A76F 1C               [ 1] 4006 	push a 
      00A770 00               [ 1] 4007 	swapw x 
      00A771 04 1C            [ 1] 4008 	ld a,#5 
      00A773 00               [ 4] 4009 	mul x,a 
      00A774 7F 9F A4         [ 2] 4010 	addw x,#GPIO_BASE 
      00A777 80               [ 1] 4011 	pop a 
      00A778 97               [ 4] 4012 	ret 
                                   4013 ; translation from Arduino D0..D15 to stm8s208rb 
      0029DB                       4014 arduino_to_8s208:
      00A779 81 06                 4015 .byte 3,6 ; D0 
      00A77A 03 05                 4016 .byte 3,5 ; D1 
      00A77A CD 97                 4017 .byte 4,0 ; D2 
      00A77C 4C AE                 4018 .byte 2,1 ; D3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



      00A77E B4 80                 4019 .byte 6,0 ; D4
      00A780 89 02                 4020 .byte 2,2 ; D5
      00A781 02 03                 4021 .byte 2,3 ; D6
      00A781 CD A6                 4022 .byte 3,1 ; D7
      00A783 38 26                 4023 .byte 3,3 ; D8
      00A785 3B 1C                 4024 .byte 2,4 ; D9
      00A787 00 04                 4025 .byte 4,5 ; D10
      00A789 35 10                 4026 .byte 2,6 ; D11
      00A78B 00 0B                 4027 .byte 2,7 ; D12
      00A78D CD 95                 4028 .byte 2,5 ; D13
      00A78F E1 A6                 4029 .byte 4,2 ; D14
      00A791 20 CD                 4030 .byte 4,1 ; D15
                                   4031 
                                   4032 
                                   4033 ;------------------------------
                                   4034 ; BASIC: RND(expr)
                                   4035 ; return random number 
                                   4036 ; between 1 and expr inclusive
                                   4037 ; xorshift16 
                                   4038 ; ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   4039 ; input:
                                   4040 ; 	none 
                                   4041 ; output:
                                   4042 ;	xstack 	random positive integer 
                                   4043 ;------------------------------
      0029FB                       4044 random:
      00A793 86 A5 1E         [ 4] 4045 	call func_args 
      00A796 01 EE            [ 1] 4046 	cp a,#1
      00A798 02 35            [ 1] 4047 	jreq 1$
      00A79A 0A 00 0B         [ 2] 4048 	jp syntax_error
      002A05                       4049 1$:  
      002A05                       4050 	_xpop   
      00A79D CD 95            [ 1]    1     ld a,(y)
      00A79F E1               [ 1]    2     ldw x,y 
      00A7A0 AE 9C            [ 2]    3     ldw x,(1,x)
      00A7A2 5A CD 87 02      [ 2]    4     addw y,#CELL_SIZE 
      00A7A6 A6               [ 2] 4051 	pushw x 
      00A7A7 2C               [ 1] 4052 	push a  
      00A7A8 CD 86            [ 1] 4053 	ld a,#0x80 
      00A7AA A5 1E            [ 1] 4054 	bcp a,(1,sp)
      00A7AC 01 1C            [ 1] 4055 	jreq 2$
      00A7AE 00 08            [ 1] 4056 	ld a,#ERR_BAD_VALUE
      00A7B0 CD 87 02         [ 2] 4057 	jp tb_error
      002A1B                       4058 2$: 
                                   4059 ; acc16=(x<<5)^x 
      00A7B3 A6 0D CD         [ 2] 4060 	ldw x,seedx 
      00A7B6 86               [ 2] 4061 	sllw x 
      00A7B7 A5               [ 2] 4062 	sllw x 
      00A7B8 1E               [ 2] 4063 	sllw x 
      00A7B9 01               [ 2] 4064 	sllw x 
      00A7BA CD               [ 2] 4065 	sllw x 
      00A7BB A7               [ 1] 4066 	ld a,xh 
      00A7BC 62 1F 01         [ 1] 4067 	xor a,seedx 
      00A7BF 20 C0 0D         [ 1] 4068 	ld acc16,a 
      00A7C1 9F               [ 1] 4069 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



      00A7C1 CD A7 57         [ 1] 4070 	xor a,seedx+1 
      00A7C4 27 F4 0E         [ 1] 4071 	ld acc8,a 
                                   4072 ; seedx=seedy 
      00A7C6 CE 00 16         [ 2] 4073 	ldw x,seedy 
      00A7C6 5B 02 81         [ 2] 4074 	ldw seedx,x  
                                   4075 ; seedy=seedy^(seedy>>1)
      00A7C9 CE 00 16         [ 2] 4076 	ldw x,seedy 
      00A7C9 CD               [ 2] 4077 	srlw x 
      00A7CA 98               [ 1] 4078 	ld a,xh 
      00A7CB B4 A1 84         [ 1] 4079 	xor a,seedy 
      00A7CE 27 03 CC         [ 1] 4080 	ld seedy,a  
      00A7D1 94               [ 1] 4081 	ld a,xl 
      00A7D2 3D 90 F6         [ 1] 4082 	xor a,seedy+1 
      00A7D5 93 EE 01         [ 1] 4083 	ld seedy+1,a 
                                   4084 ; acc16>>3 
      00A7D8 72 A9 00         [ 2] 4085 	ldw x,acc16 
      00A7DB 03               [ 2] 4086 	srlw x 
      00A7DC C7               [ 2] 4087 	srlw x 
      00A7DD 00               [ 2] 4088 	srlw x 
                                   4089 ; x=acc16^x 
      00A7DE 19               [ 1] 4090 	ld a,xh 
      00A7DF CF 00 1A         [ 1] 4091 	xor a,acc16 
      00A7E2 C7 00 0D         [ 1] 4092 	ld acc16,a 
      00A7E2 CD               [ 1] 4093 	ld a,xl 
      00A7E3 95 99 A1         [ 1] 4094 	xor a,acc8 
      00A7E6 08 27 02         [ 1] 4095 	ld acc8,a 
                                   4096 ; seedy=acc16^seedy 
      00A7E9 20 46 CD         [ 1] 4097 	xor a,seedy+1
      00A7EC 95               [ 1] 4098 	ld xl,a 
      00A7ED 99 A1 04         [ 1] 4099 	ld a,acc16 
      00A7F0 27 23 A1         [ 1] 4100 	xor a,seedy
      00A7F3 02               [ 1] 4101 	ld xh,a 
      00A7F4 27 2A 55         [ 2] 4102 	ldw seedy,x 
                                   4103 ; return seedx_lo&0x7f:seedy modulo expr + 1 
      00A7F7 00 04 00         [ 1] 4104 	ld a,seedx+1
      00A7FA 02 CD            [ 1] 4105 	and a,#127
      002A70                       4106 	_xpush 
      00A7FC 98 B4 A1 84      [ 2]    1     subw y,#CELL_SIZE
      00A800 27 03            [ 1]    2     ld (y),a 
      00A802 CC 94 3D         [ 2]    3     ldw (1,y),x 
      00A805 90               [ 1] 4107 	pop a 
      00A806 F6               [ 2] 4108 	popw x 
      002A7B                       4109 	_xpush 
      00A807 93 EE 01 72      [ 2]    1     subw y,#CELL_SIZE
      00A80B A9 00            [ 1]    2     ld (y),a 
      00A80D 03 9F 5F         [ 2]    3     ldw (1,y),x 
      00A810 CD 85 31         [ 4] 4110 	call mod24 
      002A87                       4111 	_xpop
      00A813 20 CD            [ 1]    1     ld a,(y)
      00A815 93               [ 1]    2     ldw x,y 
      00A815 F6 72            [ 2]    3     ldw x,(1,x)
      00A817 5C 00 02 5F      [ 2]    4     addw y,#CELL_SIZE 
      00A81B CD 85 31         [ 2] 4112 	addw x,#1 
      00A81E 20 C2            [ 1] 4113 	adc a,#0  
      00A820 81               [ 4] 4114 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



                                   4115 
                                   4116 ;---------------------------------
                                   4117 ; BASIC: WORDS 
                                   4118 ; affiche la listes des mots du
                                   4119 ; dictionnaire ainsi que le nombre
                                   4120 ; de mots.
                                   4121 ;---------------------------------
                           000001  4122 	WLEN=1 ; word length
                           000002  4123 	LLEN=2 ; character sent to console
                           000003  4124 	WCNT=3 ; count words printed 
                           000003  4125 	VSIZE=3 
      002A96                       4126 words:
      00A820 89 F6 72         [ 4] 4127 	call cmd_line_only
      00A823 5C 00            [ 2] 4128 	pushw y
      002A9B                       4129 	_vars VSIZE
      00A825 02 5F            [ 2]    1     sub sp,#VSIZE 
      00A827 CD 85            [ 1] 4130 	clr (LLEN,sp)
      00A829 31 85            [ 1] 4131 	clr (WCNT,sp)
      00A82B F6 27 B4 5C      [ 2] 4132 	ldw y,#kword_dict+2
      00A82F 20               [ 1] 4133 0$:	ldw x,y
      00A830 EF               [ 1] 4134 	ld a,(x)
      00A831 A4 0F            [ 1] 4135 	and a,#15 
      00A831 81 01            [ 1] 4136 	ld (WLEN,sp),a 
      00A832 0C 03            [ 1] 4137 	inc (WCNT,sp)
      00A832 CD               [ 1] 4138 1$:	incw x 
      00A833 97               [ 1] 4139 	ld a,(x)
      00A834 6F A1 01         [ 4] 4140 	call putc 
      00A837 27 03            [ 1] 4141 	inc (LLEN,sp)
      00A839 CC 94            [ 1] 4142 	dec (WLEN,sp)
      00A83B 3D 90            [ 1] 4143 	jrne 1$
      00A83D F6 93            [ 1] 4144 	ld a,#70
      00A83F EE 01            [ 1] 4145 	cp a,(LLEN,sp)
      00A841 72 A9            [ 1] 4146 	jrmi 2$   
      00A843 00 03            [ 1] 4147 	ld a,#SPACE 
      00A845 9F A4 7F         [ 4] 4148 	call putc 
      00A848 81 02            [ 1] 4149 	inc (LLEN,sp) 
      00A849 20 07            [ 2] 4150 	jra 3$
      00A849 A6 06            [ 1] 4151 2$: ld a,#CR 
      00A84B CD 97 62         [ 4] 4152 	call putc 
      00A84E CD 95            [ 1] 4153 	clr (LLEN,sp)
      00A850 99 A1 02 27      [ 2] 4154 3$:	subw y,#2 
      00A854 0E A1            [ 2] 4155 	ldw y,(y)
      00A856 04 27            [ 1] 4156 	jrne 0$ 
      00A858 12 A1            [ 1] 4157 	ld a,#CR 
      00A85A 82 27 03         [ 4] 4158 	call putc  
      00A85D CC               [ 1] 4159 	clrw x 
      00A85E 94 3D            [ 1] 4160 	ld a,(WCNT,sp)
      00A860 97               [ 1] 4161 	ld xl,a 
      00A860 FD 20 0B         [ 4] 4162 	call prt_i16 
      00A863 AE 2A ED         [ 2] 4163 	ldw x,#words_count_msg
      00A863 F6 88 CD         [ 4] 4164 	call puts 
      002AE8                       4165 	_drop VSIZE 
      00A866 95 B2            [ 2]    1     addw sp,#VSIZE 
      00A868 84 20            [ 2] 4166 	popw y 
      00A86A 03               [ 4] 4167 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



      00A86B 20 77 6F 72 64 73 20  4168 words_count_msg: .asciz " words in dictionary\n"
             69 6E 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   4169 
                                   4170 
                                   4171 ;-----------------------------
                                   4172 ; BASIC: TIMER expr 
                                   4173 ; initialize count down timer 
                                   4174 ;-----------------------------
      002B03                       4175 set_timer:
      00A86B CD 95 DB         [ 4] 4176 	call arg_list
      00A86E 5F 02            [ 1] 4177 	cp a,#1 
      00A870 72 A2            [ 1] 4178 	jreq 1$
      00A872 00 03 90         [ 2] 4179 	jp syntax_error
      002B0D                       4180 1$: 
      002B0D                       4181 	_xpop  
      00A875 F7 90            [ 1]    1     ld a,(y)
      00A877 EF               [ 1]    2     ldw x,y 
      00A878 01 A6            [ 2]    3     ldw x,(1,x)
      00A87A 07 CD 97 62      [ 2]    4     addw y,#CELL_SIZE 
      00A87E CF 00 12         [ 2] 4182 	ldw timer,x 
      00A87E 90               [ 4] 4183 	ret 
                                   4184 
                                   4185 ;------------------------------
                                   4186 ; BASIC: TIMEOUT 
                                   4187 ; return state of timer 
                                   4188 ; output:
                                   4189 ;   A:X     0 not timeout 
                                   4190 ;   A:X     -1 timeout 
                                   4191 ;------------------------------
      002B1A                       4192 timeout:
      00A87F F6               [ 1] 4193 	clr a 
      00A880 93 EE 01         [ 2] 4194 	ldw x,timer 
      00A883 72 A9            [ 1] 4195 	jreq 1$
      00A885 00               [ 1] 4196 	clrw x
      00A886 03               [ 4] 4197 	ret  
      00A887 81               [ 1] 4198 1$:	cpl a
      00A888 53               [ 2] 4199 	cplw x 
      00A888 CD               [ 4] 4200 	ret 
                                   4201  	
                                   4202 
                                   4203 
                                   4204 
                                   4205 ;-----------------------------------
                                   4206 ; BASIC: IWDGEN expr1 
                                   4207 ; enable independant watchdog timer
                                   4208 ; expr1 is delay in multiple of 62.5µsec
                                   4209 ; expr1 -> {1..16383}
                                   4210 ;-----------------------------------
      002B25                       4211 enable_iwdg:
      00A889 86 B5 81         [ 4] 4212 	call arg_list
      00A88C A1 01            [ 1] 4213 	cp a,#1 
      00A88C 5F C6            [ 1] 4214 	jreq 1$
      00A88E 00 2E C0         [ 2] 4215 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



      002B2F                       4216 1$: _xpop  
      00A891 00 2F            [ 1]    1     ld a,(y)
      00A893 27               [ 1]    2     ldw x,y 
      00A894 03 53            [ 2]    3     ldw x,(1,x)
      00A896 A6 FF 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A898 4B 00            [ 1] 4217 	push #0
      00A898 81 CC 50 E0      [ 1] 4218 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A899 9E               [ 1] 4219 	ld a,xh 
      00A899 72 5F            [ 1] 4220 	and a,#0x3f
      00A89B 00               [ 1] 4221 	ld xh,a  
      00A89C 19 AE B4         [ 2] 4222 2$:	cpw x,#255
      00A89F 80 89            [ 2] 4223 	jrule 3$
      00A8A1 CF 00            [ 1] 4224 	inc (1,sp)
      00A8A3 1A               [ 1] 4225 	rcf 
      00A8A4 CD               [ 2] 4226 	rrcw x 
      00A8A5 86 14            [ 2] 4227 	jra 2$
      00A8A7 27 0F 1E 01      [ 1] 4228 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A8AB 1C               [ 1] 4229 	pop a  
      00A8AC 00 80 27         [ 1] 4230 	ld IWDG_PR,a 
      00A8AF 04               [ 1] 4231 	ld a,xl
      00A8B0 1F               [ 1] 4232 	dec a 
      00A8B1 01 20 ED E0      [ 1] 4233 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A8B4 C7 50 E2         [ 1] 4234 	ld IWDG_RLR,a 
      00A8B4 0F 01 0F 02      [ 1] 4235 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A8B8 85               [ 4] 4236 	ret 
                                   4237 
                                   4238 
                                   4239 ;-----------------------------------
                                   4240 ; BASIC: IWDGREF  
                                   4241 ; refresh independant watchdog count down 
                                   4242 ; timer before it reset MCU. 
                                   4243 ;-----------------------------------
      002B63                       4244 refresh_iwdg:
      00A8B9 4F 81 50 E0      [ 1] 4245 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A8BB 81               [ 4] 4246 	ret 
                                   4247 
                                   4248 
                                   4249 ;-------------------------------------
                                   4250 ; BASIC: LOG2(expr)
                                   4251 ; return logarithm base 2 of expr 
                                   4252 ; this is the position of most significant
                                   4253 ; bit set. 
                                   4254 ; input: 
                                   4255 ; output:
                                   4256 ;   A     TK_INTGR 
                                   4257 ;   xstack log2 
                                   4258 ;*********************************
      002B68                       4259 log2:
      00A8BB CD 97 6F         [ 4] 4260 	call func_args 
      00A8BE A1 02            [ 1] 4261 	cp a,#1 
      00A8C0 27 03            [ 1] 4262 	jreq 1$
      00A8C2 CC 94 3D         [ 2] 4263 	jp syntax_error 
      00A8C5                       4264 1$: 
      002B72                       4265 	_xpop    
      00A8C5 90 E6            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



      00A8C7 03               [ 1]    2     ldw x,y 
      00A8C8 93 EE            [ 2]    3     ldw x,(1,x)
      00A8CA 04 CF 00 1A      [ 2]    4     addw y,#CELL_SIZE 
      00A8CE 90               [ 1] 4266 	tnz a
      00A8CF F6 93            [ 1] 4267 	jrne 2$ 
      00A8D1 EE               [ 2] 4268 	tnzw x 
      00A8D2 01 72            [ 1] 4269 	jrne 2$
      00A8D4 A9 00            [ 1] 4270 	ld a,#ERR_BAD_VALUE
      00A8D6 03 90 F7         [ 2] 4271 	jp tb_error 
      00A8D9 90 EF            [ 1] 4272 2$: push #24 
      00A8DB 01               [ 2] 4273 3$: rlcw x 
      00A8DC 72               [ 1] 4274     rlc a 
      00A8DD CD 00            [ 1] 4275 	jrc 4$
      00A8DF 1A 81            [ 1] 4276 	dec (1,sp) 
      00A8E1 26 F8            [ 1] 4277 	jrne 3$
      00A8E1 72               [ 1] 4278 4$: clrw x 
      00A8E2 0D               [ 1] 4279     pop a 
      00A8E3 52               [ 1] 4280 	dec a
      00A8E4 30               [ 1] 4281 	rlwa x  
      002B94                       4282 9$:	
      00A8E5 FB               [ 4] 4283 	ret 
                                   4284 
                                   4285 ;-----------------------------------
                                   4286 ; BASIC: BIT(expr) 
                                   4287 ; expr ->{0..23}
                                   4288 ; return 2^expr 
                                   4289 ; output:
                                   4290 ;    A:X    2^expr 
                                   4291 ;-----------------------------------
      002B95                       4292 bitmask:
      00A8E6 8E CC 81         [ 4] 4293     call func_args 
      00A8E9 35 01            [ 1] 4294 	cp a,#1
      00A8EA 27 03            [ 1] 4295 	jreq 1$
      00A8EA 72 0D 52         [ 2] 4296 	jp syntax_error 
      002B9F                       4297 1$: _xpop 
      00A8ED 30 FB            [ 1]    1     ld a,(y)
      00A8EF 72               [ 1]    2     ldw x,y 
      00A8F0 16 00            [ 2]    3     ldw x,(1,x)
      00A8F2 23 8E 81 03      [ 2]    4     addw y,#CELL_SIZE 
      00A8F5 9F               [ 1] 4298 	ld a,xl 
      00A8F5 CD 98 B4         [ 2] 4299 	ldw x,#1 
      00A8F8 A1 84            [ 1] 4300 	and a,#23
      00A8FA 27 03            [ 1] 4301 	jreq 9$
      00A8FC CC               [ 1] 4302 	push a 
      00A8FD 94               [ 1] 4303 	clr a 
      002BB2                       4304 2$: 
      00A8FE 3D               [ 2] 4305 	slaw x 
      00A8FF 90               [ 1] 4306 	rlc a 	
      00A900 F6 93            [ 1] 4307 	dec (1,sp)
      00A902 EE 01            [ 1] 4308 	jrne 2$ 
      002BB8                       4309 4$:
      002BB8                       4310     _drop 1 
      00A904 72 A9            [ 2]    1     addw sp,#1 
      00A906 00               [ 4] 4311 9$:	ret 
                                   4312 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



                                   4313 ;------------------------------
                                   4314 ; BASIC: DO 
                                   4315 ; initiate a DO ... UNTIL loop 
                                   4316 ;------------------------------
                           000003  4317 	DOLP_ADR=3 
                           000005  4318 	DOLP_INW=5
                           000004  4319 	VSIZE=4 
      002BBB                       4320 do_loop:
      00A907 03               [ 2] 4321 	popw x 
      00A908                       4322 	_vars VSIZE 
      00A908 CF 00            [ 2]    1     sub sp,#VSIZE 
      00A90A 13               [ 2] 4323 	pushw x 
      00A90B CE 00 13         [ 2] 4324 	ldw x,basicptr 
      00A90E 5D 27            [ 2] 4325 	ldw (DOLP_ADR,sp),x
      00A910 03 8F 26         [ 2] 4326 	ldw x,in.w 
      00A913 F7 05            [ 2] 4327 	ldw (DOLP_INW,sp),x
      00A914 72 5C 00 1F      [ 1] 4328 	inc loop_depth 
      00A914 81               [ 4] 4329 	ret 
                                   4330 
                                   4331 ;--------------------------------
                                   4332 ; BASIC: UNTIL expr 
                                   4333 ; loop if exprssion is false 
                                   4334 ; else terminate loop
                                   4335 ;--------------------------------
      00A915                       4336 until: 
      00A915 CD 98 B4 A1      [ 1] 4337 	tnz loop_depth 
      00A919 84 27            [ 1] 4338 	jrne 1$ 
      00A91B 03 CC 94         [ 2] 4339 	jp syntax_error 
      002BD7                       4340 1$: 
      00A91E 3D 90 F6         [ 4] 4341 	call condition  
      002BDA                       4342 	_xpop 
      00A921 93 EE            [ 1]    1     ld a,(y)
      00A923 01               [ 1]    2     ldw x,y 
      00A924 72 A9            [ 2]    3     ldw x,(1,x)
      00A926 00 03 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A928 4D               [ 1] 4343 	tnz a 
      00A928 A3 14            [ 1] 4344 	jrne 9$ 
      00A92A 00               [ 2] 4345 	tnzw x 
      00A92B 2B 0C            [ 1] 4346 	jrne 9$ 
      00A92D 35 0F            [ 2] 4347 	ldw x,(DOLP_ADR,sp)
      00A92F 50 F2 A6         [ 2] 4348 	ldw basicptr,x 
      00A932 1E 62            [ 1] 4349 	ld a,(2,x)
      00A934 A6 10 62         [ 1] 4350 	ld count,a 
      00A937 20 1E            [ 2] 4351 	ldw x,(DOLP_INW,sp)
      00A939 CF 00 00         [ 2] 4352 	ldw in.w,x 
      00A939 A3               [ 4] 4353 	ret 
      002BF9                       4354 9$:	; remove loop data from stack  
      00A93A 08               [ 2] 4355 	popw x
      002BFA                       4356 	_drop VSIZE
      00A93B 00 2B            [ 2]    1     addw sp,#VSIZE 
      00A93D 09 35 0E 50      [ 1] 4357 	dec loop_depth 
      00A941 F2               [ 2] 4358 	jp (x)
                                   4359 
                                   4360 ;--------------------------
                                   4361 ; BASIC: PORTA...PORTI  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



                                   4362 ;  return constant value 
                                   4363 ;  PORT  base address 
                                   4364 ;---------------------------
      002C01                       4365 const_porta:
      00A942 A6 50 62         [ 2] 4366 	ldw x,#PA_BASE 
      00A945 20               [ 1] 4367 	clr a 
      00A946 10               [ 4] 4368 	ret 
      00A947                       4369 const_portb:
      00A947 35 07 50         [ 2] 4370 	ldw x,#PB_BASE 
      00A94A F2               [ 1] 4371 	clr a 
      00A94B 81               [ 4] 4372 	ret 
      002C0B                       4373 const_portc:
      00A94B A3 00 40         [ 2] 4374 	ldw x,#PC_BASE 
      00A94E 23               [ 1] 4375 	clr a 
      00A94F 07               [ 4] 4376 	ret 
      002C10                       4377 const_portd:
      00A950 72 5C 50         [ 2] 4378 	ldw x,#PD_BASE 
      00A953 F2               [ 1] 4379 	clr a 
      00A954 54               [ 4] 4380 	ret 
      002C15                       4381 const_porte:
      00A955 20 F4 14         [ 2] 4382 	ldw x,#PE_BASE 
      00A957 4F               [ 1] 4383 	clr a 
      00A957 9F               [ 4] 4384 	ret 
      002C1A                       4385 const_portf:
      00A958 4A 27 01         [ 2] 4386 	ldw x,#PF_BASE 
      00A95B 4A               [ 1] 4387 	clr a 
      00A95C 81               [ 4] 4388 	ret 
      002C1F                       4389 const_portg:
      00A95C A4 3E C7         [ 2] 4390 	ldw x,#PG_BASE 
      00A95F 50               [ 1] 4391 	clr a 
      00A960 F1               [ 4] 4392 	ret 
      002C24                       4393 const_porti:
      00A961 72 18 50         [ 2] 4394 	ldw x,#PI_BASE 
      00A964 F0               [ 1] 4395 	clr a 
      00A965 8E               [ 4] 4396 	ret 
                                   4397 
                                   4398 ;-------------------------------
                                   4399 ; following return constant 
                                   4400 ; related to GPIO register offset 
                                   4401 ;---------------------------------
      002C29                       4402 const_odr:
      00A966 81               [ 1] 4403 	clr a 
      00A967 AE 00 00         [ 2] 4404 	ldw x,#GPIO_ODR
      00A967 C6               [ 4] 4405 	ret 
      002C2E                       4406 const_idr:
      00A968 00               [ 1] 4407 	clr a 
      00A969 10 CE 00         [ 2] 4408 	ldw x,#GPIO_IDR
      00A96C 11               [ 4] 4409 	ret 
      002C33                       4410 const_ddr:
      00A96D 81               [ 1] 4411 	clr a
      00A96E AE 00 02         [ 2] 4412 	ldw x,#GPIO_DDR
      00A96E CD               [ 4] 4413 	ret 
      002C38                       4414 const_cr1:
      00A96F 97               [ 1] 4415 	clr a 
      00A970 6F A1 01         [ 2] 4416 	ldw x,#GPIO_CR1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



      00A973 27               [ 4] 4417 	ret 
      002C3D                       4418 const_cr2:
      00A974 03               [ 1] 4419 	clr a
      00A975 CC 94 3D         [ 2] 4420 	ldw x,#GPIO_CR2
      00A978 81               [ 4] 4421 	ret 
                                   4422 ;-------------------------
                                   4423 ; BASIC: POUT 
                                   4424 ;  constant for port mode
                                   4425 ;  used by PMODE 
                                   4426 ;  to set pin as output
                                   4427 ;------------------------
      002C42                       4428 const_output:
      00A978 CD               [ 1] 4429 	clr a 
      00A979 82 73 90         [ 2] 4430 	ldw x,#OUTP
      00A97C F6               [ 4] 4431 	ret 
                                   4432 
                                   4433 ;-------------------------
                                   4434 ; BASIC: PINP 
                                   4435 ;  constant for port mode
                                   4436 ;  used by PMODE 
                                   4437 ;  to set pin as input
                                   4438 ;------------------------
      002C47                       4439 const_input:
      00A97D 93               [ 1] 4440 	clr a  
      00A97E EE 01 72         [ 2] 4441 	ldw x,#INP 
      00A981 A9               [ 4] 4442 	ret 
                                   4443 	
                                   4444 ;-----------------------
                                   4445 ; memory area constants
                                   4446 ;-----------------------
      002C4C                       4447 const_eeprom_base:
      00A982 00               [ 1] 4448 	clr a  
      00A983 03 81 00         [ 2] 4449 	ldw x,#EEPROM_BASE 
      00A985 81               [ 4] 4450 	ret 
                                   4451 
                                   4452 ;---------------------------
                                   4453 ; BASIC: DATA 
                                   4454 ; when the interpreter find 
                                   4455 ; a DATA line it skip it.
                                   4456 ;---------------------------
      002C51                       4457 data:
      00A985 CD 97 6F A1 02   [ 1] 4458 	mov in,count 
      00A98A 27               [ 4] 4459 	ret 
                                   4460 
                                   4461 ;------------------------------
                                   4462 ; check if it is a DATA line 
                                   4463 ; input: 
                                   4464 ;    X    line address 
                                   4465 ; output:
                                   4466 ;    Z    set if DATA line 
                                   4467 ;----------------------------
      002C57                       4468 is_data_line:
      00A98B 03               [ 2] 4469 	pushw x 
      00A98C CC 94            [ 1] 4470 	ld a,(3,x)
      00A98E 3D 90            [ 1] 4471 	cp a,#TK_CMD 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



      00A990 F6 93            [ 1] 4472 	jrne 9$
      00A992 EE 01            [ 2] 4473 	ldw x,(4,x)
      00A994 72 A9 00         [ 2] 4474 	cpw x,#data  
      00A997 03               [ 2] 4475 9$: popw x 
      00A998 9F               [ 4] 4476 	ret 
                                   4477 
                                   4478 ;---------------------------------
                                   4479 ; BASIC: RESTORE [line#]
                                   4480 ; set data_ptr to first data line
                                   4481 ; if no DATA found pointer set to
                                   4482 ; zero.
                                   4483 ; if a line# is given as argument 
                                   4484 ; a data line with that number 
                                   4485 ; is searched and the data pointer 
                                   4486 ; is set to it. If there is no 
                                   4487 ; data line with that number 
                                   4488 ; the program is interrupted. 
                                   4489 ;---------------------------------
      002C65                       4490 restore:
      00A999 88 90 F6         [ 4] 4491 	call runtime_only
      00A99C 93               [ 1] 4492 	clrw x 
      00A99D EE 01 72         [ 2] 4493 	ldw data_ptr,x 
      00A9A0 A9 00 03         [ 2] 4494 	ldw data_ofs,x 
      00A9A3 0D 01 27         [ 2] 4495 	ldw x,txtbgn 
      00A9A6 07 98 59         [ 4] 4496 	call next_token 
      00A9A9 49 0A            [ 1] 4497 	cp a,#TK_INTGR
      00A9AB 01 26            [ 1] 4498 	jrne 0$
      00A9AD F9 5B 01         [ 4] 4499 	call get_int24
      00A9B0 81 89            [ 2] 4500 	pushw y 
      00A9B1 4F               [ 1] 4501 	clr a 
      00A9B1 CD 97 6F         [ 4] 4502 	call search_lineno  
      00A9B4 A1 02            [ 2] 4503 	popw y 
      00A9B6 27               [ 2] 4504 	tnzw x 
      00A9B7 03 CC            [ 1] 4505 	jrne set_data_pointer 
      00A9B9 94 3D            [ 2] 4506 	jra data_error 
      002C89                       4507 0$:
      002C89                       4508 	_unget_token  
      00A9BB 90 F6 93 EE 01   [ 1]    1      mov in,in.saved  
                                   4509 ; search first DATA line 	
      00A9C0 72 A9 00         [ 2] 4510 1$:	cpw x,txtend
      00A9C3 03 9F            [ 1] 4511 	jruge data_error 
      002C93                       4512 2$:	
      00A9C5 88 90 F6         [ 4] 4513 	call is_data_line 
      00A9C8 93 EE            [ 1] 4514 	jrne 4$
      00A9CA 01 72 A9         [ 4] 4515 4$:	call try_next_line 
      00A9CD 00 03            [ 1] 4516 	jrne 4$ 
      00A9CF 0D               [ 4] 4517 	ret 
                                   4518 
                                   4519 ;---------------------
                                   4520 ; set data pointer 
                                   4521 ; variables at new line 
                                   4522 ; input:
                                   4523 ;    X    line address 
                                   4524 ;----------------------
      002C9E                       4525 set_data_pointer:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



      00A9D0 01 27 07         [ 2] 4526 	ldw data_ptr,x
      00A9D3 98 46            [ 1] 4527 	ld a,(2,x)
      00A9D5 56 0A 01         [ 1] 4528 	ld data_len,a 
      00A9D8 26 F9 5B 01      [ 1] 4529 	mov data_ofs,#FIRST_DATA_ITEM
      00A9DC 81               [ 4] 4530 	ret 
                                   4531 
                                   4532 
                                   4533 ;--------------------
                                   4534 ; at end of data line 
                                   4535 ; check if next line 
                                   4536 ; is a data line 
                                   4537 ; input:
                                   4538 ;    X   actual line address 
                                   4539 ;  
                                   4540 ;-------------------
      00A9DD                       4541 try_next_line: 
      00A9DD A6 84            [ 1] 4542 	ld a,(2,x)
      00A9DF CD 97 62         [ 1] 4543 	ld acc8,a 
      00A9E2 CD 95 CB 9F      [ 1] 4544 	clr acc16 
      00A9E6 A4 07 C7 50      [ 2] 4545 	addw x,acc16 
      00A9EA C6 81 1D         [ 2] 4546 	cpw x,txtend 
      00A9EC 25 02            [ 1] 4547 	jrult 1$
      00A9EC 52 01            [ 2] 4548 	jra data_error 
      002CBF                       4549 1$:	
      00A9EE CD 97 74         [ 4] 4550 	call is_data_line 
      00A9F1 A1 02            [ 1] 4551 	jreq 2$
      00A9F3 27 03            [ 1] 4552 	ld a,#1  
      00A9F5 CC 94            [ 2] 4553 	jra 9$
      00A9F7 3D 90 F6         [ 4] 4554 2$:	call set_data_pointer
      00A9FA 93               [ 1] 4555 	clr a  
      00A9FB EE               [ 4] 4556 9$:	ret 
      002CCD                       4557 data_error:	
      00A9FC 01 72            [ 1] 4558     ld a,#ERR_NO_DATA 
      00A9FE A9 00 03         [ 2] 4559 	jp tb_error 
                                   4560 
                                   4561 
                                   4562 ;---------------------------------
                                   4563 ; BASIC: READ 
                                   4564 ; return next data item | 0 
                                   4565 ;---------------------------------
                           000001  4566 	CTX_BPTR=1 
                           000003  4567 	CTX_IN=3 
                           000004  4568 	CTX_COUNT=4 
                           000005  4569 	INT24=5
                           000007  4570 	VSIZE=7 
      002CD2                       4571 read:
      00AA01 CF 00 1A         [ 4] 4572 	call runtime_only
      002CD5                       4573 	_vars  VSIZE 
      00AA04 90 F6            [ 2]    1     sub sp,#VSIZE 
      00AA06 93 EE 01         [ 4] 4574 	call save_context
      002CDA                       4575 read01:	
      00AA09 72 A9 00         [ 1] 4576 	ld a,data_ofs
      00AA0C 03 CD AA         [ 1] 4577 	cp a,data_len 
      00AA0F 4B 6B            [ 1] 4578 	jreq 2$ ; end of line  
      002CE2                       4579 0$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



      00AA11 01 A6 01         [ 2] 4580 	ldw x,data_ptr 
      00AA14 0D 01 27         [ 2] 4581 	ldw basicptr,x 
      00AA17 0D 48 0A 01 26   [ 1] 4582 	mov in,data_ofs 
      00AA1C FB 6B 01 7B 01   [ 1] 4583 	mov count,data_len  
      00AA21 EA 03 E7         [ 4] 4584 	call expression 
      00AA24 03 A6            [ 1] 4585 	cp a,#TK_INTGR 
      00AA26 01 C1            [ 1] 4586 	jreq 1$ 
      00AA28 00 0F 27         [ 2] 4587 	jp syntax_error 
      002CFC                       4588 1$:
      00AA2B 10 7B 01         [ 4] 4589 	call next_token ; skip comma
      00AA2E 43 E4 04         [ 2] 4590 	ldw x,basicptr 
      00AA31 E7 04 7B         [ 2] 4591 	ldw data_ptr,x 
      00AA34 01 43 E4 02 E7   [ 1] 4592 	mov data_ofs,in 
      00AA39 02 20 0C         [ 4] 4593 	call rest_context
      00AA3C                       4594 	_xpop 
      00AA3C 7B 01            [ 1]    1     ld a,(y)
      00AA3E EA               [ 1]    2     ldw x,y 
      00AA3F 02 E7            [ 2]    3     ldw x,(1,x)
      00AA41 02 7B 01 EA      [ 2]    4     addw y,#CELL_SIZE 
      002D16                       4595 	_drop VSIZE 
      00AA45 04 E7            [ 2]    1     addw sp,#VSIZE 
      00AA47 04               [ 4] 4596 	ret 
      00AA48                       4597 2$: ; end of line reached 
                                   4598 	; try next line 
      00AA48 5B 01 81         [ 2] 4599 	ldw x,data_ptr  
      00AA4B CD 2C AB         [ 4] 4600 	call try_next_line
      00AA4B 58 1C            [ 1] 4601 	jreq 0$ 
      00AA4D AA 5B            [ 2] 4602 	jra data_error 
                                   4603 
                                   4604 ;---------------------------------
                                   4605 ; BASIC: SPIEN clkdiv, 0|1  
                                   4606 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4607 ; if clkdiv==-1 disable SPI
                                   4608 ; 0|1 -> disable|enable  
                                   4609 ;--------------------------------- 
                           000005  4610 SPI_CS_BIT=5
      002D23                       4611 spi_enable:
      00AA4F FE 9F 88         [ 4] 4612 	call arg_list 
      00AA52 5E A6            [ 1] 4613 	cp a,#2
      00AA54 05 42            [ 1] 4614 	jreq 1$
      00AA56 1C 50 00         [ 2] 4615 	jp syntax_error 
      002D2D                       4616 1$: 
      00AA59 84 81 50 C7      [ 1] 4617 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00AA5B 85               [ 2] 4618 	popw x  
      00AA5B 03               [ 2] 4619 	tnzw x 
      00AA5C 06 03            [ 1] 4620 	jreq spi_disable 
      00AA5E 05               [ 2] 4621 	popw x 
      00AA5F 04 00            [ 1] 4622 	ld a,#(1<<SPI_CR1_BR)
      00AA61 02               [ 4] 4623 	mul x,a 
      00AA62 01               [ 1] 4624 	ld a,xl 
      00AA63 06 00 02         [ 1] 4625 	ld SPI_CR1,a 
                                   4626 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00AA66 02 02 03 03      [ 1] 4627 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00AA6A 01 03 03 02      [ 1] 4628 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4629 ; configure SPI as master mode 0.	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      00AA6E 04 04 05 02      [ 1] 4630 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4631 ; ~CS line controlled by sofware 	
      00AA72 06 02 07 02      [ 1] 4632 	bset SPI_CR2,#SPI_CR2_SSM 
      00AA76 05 04 02 04      [ 1] 4633     bset SPI_CR2,#SPI_CR2_SSI 
                                   4634 ; enable SPI
      00AA7A 01 1C 52 00      [ 1] 4635 	bset SPI_CR1,#SPI_CR1_SPE 	
      00AA7B 81               [ 4] 4636 	ret 
      002D56                       4637 spi_disable:
      002D56                       4638 	_drop #2; throw first argument.
      00AA7B CD 97            [ 2]    1     addw sp,##2 
                                   4639 ; wait spi idle 
      00AA7D 6F A1            [ 1] 4640 1$:	ld a,#0x82 
      00AA7F 01 27 03         [ 1] 4641 	and a,SPI_SR
      00AA82 CC 94            [ 1] 4642 	cp a,#2 
      00AA84 3D F7            [ 1] 4643 	jrne 1$
      00AA85 72 1D 52 00      [ 1] 4644 	bres SPI_CR1,#SPI_CR1_SPE
      00AA85 90 F6 93 EE      [ 1] 4645 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00AA89 01 72 A9 00      [ 1] 4646 	bres PE_DDR,#SPI_CS_BIT 
      00AA8D 03               [ 4] 4647 	ret 
                                   4648 
      002D6E                       4649 spi_clear_error:
      00AA8E 89 88            [ 1] 4650 	ld a,#0x78 
      00AA90 A6 80 15         [ 1] 4651 	bcp a,SPI_SR 
      00AA93 01 27            [ 1] 4652 	jreq 1$
      00AA95 05 A6 0A CC      [ 1] 4653 	clr SPI_SR 
      00AA99 94               [ 4] 4654 1$: ret 
                                   4655 
      002D7A                       4656 spi_send_byte:
      00AA9A 3F               [ 1] 4657 	push a 
      00AA9B CD 2D 6E         [ 4] 4658 	call spi_clear_error
      00AA9B CE               [ 1] 4659 	pop a 
      00AA9C 00 15 58 58 58   [ 2] 4660 	btjf SPI_SR,#SPI_SR_TXE,.
      00AAA1 58 58 9E         [ 1] 4661 	ld SPI_DR,a
      00AAA4 C8 00 15 C7 00   [ 2] 4662 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00AAA9 0E 9F C8         [ 1] 4663 	ld a,SPI_DR 
      00AAAC 00               [ 4] 4664 	ret 
                                   4665 
      002D90                       4666 spi_rcv_byte:
      00AAAD 16 C7            [ 1] 4667 	ld a,#255
      00AAAF 00 0F CE 00 17   [ 2] 4668 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00AAB4 CF 00 15         [ 1] 4669 	ld a,SPI_DR 
      00AAB7 CE               [ 4] 4670 	ret
                                   4671 
                                   4672 ;------------------------------
                                   4673 ; BASIC: SPIWR byte [,byte]
                                   4674 ; write 1 or more byte
                                   4675 ;------------------------------
      002D9B                       4676 spi_write:
      00AAB8 00 17 54         [ 4] 4677 	call expression
      00AABB 9E C8            [ 1] 4678 	cp a,#TK_INTGR 
      00AABD 00 17            [ 1] 4679 	jreq 1$
      00AABF C7 00 17         [ 2] 4680 	jp syntax_error 
      002DA5                       4681 1$:	
      00AAC2 9F               [ 1] 4682 	ld a,xl 
      00AAC3 C8 00 18         [ 4] 4683 	call spi_send_byte 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



      00AAC6 C7 00 18         [ 4] 4684 	call next_token 
      00AAC9 CE 00            [ 1] 4685 	cp a,#TK_COMMA 
      00AACB 0E 54            [ 1] 4686 	jrne 2$ 
      00AACD 54 54            [ 2] 4687 	jra spi_write 
      00AACF 9E               [ 1] 4688 2$:	tnz a 
      00AAD0 C8 00            [ 1] 4689 	jreq 3$
      002DB5                       4690 	_unget_token  
      00AAD2 0E C7 00 0E 9F   [ 1]    1      mov in,in.saved  
      00AAD7 C8               [ 4] 4691 3$:	ret 
                                   4692 
                                   4693 
                                   4694 ;-------------------------------
                                   4695 ; BASIC: SPIRD 	
                                   4696 ; read one byte from SPI 
                                   4697 ;-------------------------------
      002DBB                       4698 spi_read:
      00AAD8 00 0F C7         [ 4] 4699 	call spi_rcv_byte 
      00AADB 00               [ 1] 4700 	clrw x 
      00AADC 0F               [ 1] 4701 	ld xl,a 
      00AADD C8               [ 1] 4702 	clr a  
      00AADE 00               [ 4] 4703 	ret 
                                   4704 
                                   4705 ;------------------------------
                                   4706 ; BASIC: SPISEL 0|1 
                                   4707 ; set state of ~CS line
                                   4708 ; 0|1 deselect|select  
                                   4709 ;------------------------------
      002DC2                       4710 spi_select:
      00AADF 18 97 C6         [ 4] 4711 	call next_token 
      00AAE2 00 0E            [ 1] 4712 	cp a,#TK_INTGR 
      00AAE4 C8 00            [ 1] 4713 	jreq 1$
      00AAE6 17 95 CF         [ 2] 4714 	jp syntax_error 
      00AAE9 00               [ 2] 4715 1$: tnzw x  
      00AAEA 17 C6            [ 1] 4716 	jreq cs_high 
      00AAEC 00 16 A4 7F      [ 1] 4717 	bres PE_ODR,#SPI_CS_BIT
      00AAF0 72               [ 4] 4718 	ret 
      002DD4                       4719 cs_high: 
      00AAF1 A2 00 03 90      [ 1] 4720 	bset PE_ODR,#SPI_CS_BIT
      00AAF5 F7               [ 4] 4721 	ret 
                                   4722 
                                   4723 ;-------------------------------
                                   4724 ; BASIC: PAD 
                                   4725 ; Return pad buffer address.
                                   4726 ;------------------------------
      002DD9                       4727 pad_ref:
      00AAF6 90 EF 01         [ 2] 4728 	ldw x,#pad 
      00AAF9 84               [ 1] 4729 	clr a
      00AAFA 85               [ 4] 4730 	ret 
                                   4731 
                                   4732 ;****************************
                                   4733 ; expression stack 
                                   4734 ; manipulation routines
                                   4735 ;****************************
                                   4736 
                                   4737 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



                                   4738 ; BASIC: PUSH expr|rel|cond 
                                   4739 ; push the result on xtack
                                   4740 ;-----------------------------
      002DDE                       4741 xpush:
      00AAFB 72 A2 00         [ 4] 4742 	call condition 
      00AAFE 03               [ 4] 4743 	ret 
                                   4744 
                                   4745 ;------------------------------
                                   4746 ; BASIC: POP 
                                   4747 ; pop top of xstack 
                                   4748 ;------------------------------
      002DE2                       4749 xpop:
      002DE2                       4750 	_xpop 
      00AAFF 90 F7            [ 1]    1     ld a,(y)
      00AB01 90               [ 1]    2     ldw x,y 
      00AB02 EF 01            [ 2]    3     ldw x,(1,x)
      00AB04 CD 84 21 90      [ 2]    4     addw y,#CELL_SIZE 
      00AB08 F6               [ 4] 4751 	ret 
                                   4752 
                                   4753 
                                   4754 ;------------------------------
                                   4755 ; BASIC: ALLOC expr 
                                   4756 ; allocate expr element on xtack 
                                   4757 ;-------------------------------
      002DEC                       4758 xalloc: 
      00AB09 93 EE 01         [ 4] 4759 	call expression 
      00AB0C 72 A9            [ 1] 4760 	cp a,#TK_INTGR
      00AB0E 00 03            [ 1] 4761 	jreq 1$ 
      00AB10 1C 00 01         [ 2] 4762 	jp syntax_error
      002DF6                       4763 1$: _xpop 
      00AB13 A9 00            [ 1]    1     ld a,(y)
      00AB15 81               [ 1]    2     ldw x,y 
      00AB16 EE 01            [ 2]    3     ldw x,(1,x)
      00AB16 CD 97 4C 90      [ 2]    4     addw y,#CELL_SIZE 
      00AB1A 89               [ 1] 4764 	tnz a 
      00AB1B 52 03            [ 1] 4765 	jreq 3$ 
      00AB1D 0F 02            [ 1] 4766 2$:	ld a,#ERR_BAD_VALUE
      00AB1F 0F 03 90         [ 2] 4767 	jp tb_error 
      00AB22 AE B4 2D         [ 2] 4768 3$: cpw x,#XSTACK_SIZE 
      00AB25 93 F6            [ 1] 4769 	jrugt 2$
      00AB27 A4 0F            [ 1] 4770 	ld a,#CELL_SIZE 
      00AB29 6B               [ 4] 4771 	mul x,a 
      00AB2A 01 0C 03         [ 2] 4772 	ldw acc16,x 
      00AB2D 5C F6 CD 86      [ 2] 4773 	subw y,acc16 
      00AB31 A5 0C 02 0A      [ 2] 4774 	cpw y,#xstack_full
      00AB35 01 26            [ 1] 4775 	jrugt 9$
      00AB37 F5 A6            [ 1] 4776 	ld a,#ERR_MEM_FULL
      00AB39 46 11 02         [ 2] 4777 	jp tb_error 
      002E21                       4778 9$:	 
      00AB3C 2B               [ 4] 4779 	ret 
                                   4780 
                                   4781 
                                   4782 ;------------------------------
                                   4783 ;  BASIC DROP expr 
                                   4784 ;  expr in range {0..XSTACK_SIZE}
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



                                   4785 ;  discard n elements from xtack
                                   4786 ;------------------------------
      002E22                       4787 xdrop:
      00AB3D 09 A6 20         [ 4] 4788 	call expression 
      00AB40 CD 86            [ 1] 4789 	cp a,#TK_INTGR
      00AB42 A5 0C            [ 1] 4790 	jreq 1$ 
      00AB44 02 20 07         [ 2] 4791 	jp syntax_error 
      002E2C                       4792 1$:	_xpop 
      00AB47 A6 0D            [ 1]    1     ld a,(y)
      00AB49 CD               [ 1]    2     ldw x,y 
      00AB4A 86 A5            [ 2]    3     ldw x,(1,x)
      00AB4C 0F 02 72 A2      [ 2]    4     addw y,#CELL_SIZE 
      00AB50 00               [ 1] 4793 	ld a,xl 
      00AB51 02 90            [ 1] 4794 	and a,#0x1f 
      00AB53 FE               [ 1] 4795 	clrw x 
      00AB54 26               [ 1] 4796 	ld xl,a 
      00AB55 CF A6            [ 1] 4797 	ld a,#CELL_SIZE 
      00AB57 0D               [ 4] 4798 	mul x,a 
      00AB58 CD 86 A5         [ 2] 4799 	ldw acc16,x  
      00AB5B 5F 7B 03 97      [ 2] 4800 	addw y,acc16 
      00AB5F CD 95 E1 AE      [ 2] 4801 	cpw y,#XSTACK_EMPTY 
      00AB63 AB 6D            [ 2] 4802 	jrule 9$
      00AB65 CD 87 02 5B      [ 2] 4803 	ldw y,#XSTACK_EMPTY 
      00AB69 03               [ 4] 4804 9$:	ret 
                                   4805 
                                   4806 ;-----------------------
                                   4807 ; check if value in A:X 
                                   4808 ; is inside xstack bound
                                   4809 ; output:
                                   4810 ;    X     slot address  
                                   4811 ;-----------------------
      002E4F                       4812 xstack_bound:
      00AB6A 90               [ 1] 4813 	tnz a 
      00AB6B 85 81            [ 1] 4814 	jrne 8$ 
      00AB6D 20 77 6F         [ 2] 4815 1$: cpw x,#XSTACK_SIZE 
      00AB70 72 64            [ 1] 4816 	jrugt 8$
      00AB72 73 20            [ 1] 4817 	ld a,#CELL_SIZE 
      00AB74 69               [ 4] 4818 	mul x,a
      00AB75 6E 20 64         [ 2] 4819 	ldw acc16,x 
      00AB78 69               [ 1] 4820 	ldw x,y 
      00AB79 63 74 69 6F      [ 2] 4821 	addw x,acc16 
      00AB7D 6E 61 72         [ 2] 4822 	cpw x,#XSTACK_EMPTY 
      00AB80 79 0A            [ 1] 4823 	jruge 8$  
      00AB82 00               [ 4] 4824 	ret 
      00AB83 A6 0A            [ 1] 4825 8$: ld a,#ERR_BAD_VALUE
      00AB83 CD 97 74         [ 2] 4826 	jp tb_error 
                                   4827 
                                   4828 ;-------------------------
                                   4829 ; BASIC: PUT expr, cond 
                                   4830 ; expr -> slot 
                                   4831 ; cond -> valut to put 
                                   4832 ; on xstack 
                                   4833 ;-------------------------
      002E6D                       4834 xput:
      00AB86 A1 01 27         [ 4] 4835 	call arg_list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



      00AB89 03 CC            [ 1] 4836 	cp a,#2 
      00AB8B 94 3D            [ 1] 4837 	jreq 1$ 
      00AB8D CC 13 BD         [ 2] 4838 0$:	jp syntax_error
      002E77                       4839 1$: _xpop   ; value to put 
      00AB8D 90 F6            [ 1]    1     ld a,(y)
      00AB8F 93               [ 1]    2     ldw x,y 
      00AB90 EE 01            [ 2]    3     ldw x,(1,x)
      00AB92 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00AB96 CF               [ 2] 4840 	pushw x 
      00AB97 00               [ 1] 4841 	push a 
      002E82                       4842 	_xpop    ; slot 
      00AB98 13 81            [ 1]    1     ld a,(y)
      00AB9A 93               [ 1]    2     ldw x,y 
      00AB9A 4F CE            [ 2]    3     ldw x,(1,x)
      00AB9C 00 13 27 02      [ 2]    4     addw y,#CELL_SIZE 
      00ABA0 5F 81 43         [ 4] 4843 	call xstack_bound
      00ABA3 53 81 19         [ 2] 4844     ldw ptr16,x 
      00ABA5 84               [ 1] 4845 	pop a 
      00ABA5 CD               [ 2] 4846 	popw x 
      00ABA6 97 74 A1 01      [ 4] 4847 	ld [ptr16],a 
      00ABAA 27 03 CC 94      [ 1] 4848 	inc ptr8 
      00ABAE 3D 90 F6 93      [ 5] 4849 	ldw [ptr16],x 
      00ABB2 EE               [ 4] 4850 	ret 
                                   4851 
                                   4852 ;------------------------
                                   4853 ; BASIC: PICK expr 
                                   4854 ; get nième element on 
                                   4855 ; xtack. 
                                   4856 ;-----------------------
      002EA0                       4857 xpick:
      00ABB3 01 72 A9         [ 4] 4858 	call func_args 
      00ABB6 00 03            [ 1] 4859 	cp a,#1 
      00ABB8 4B 00            [ 1] 4860 	jreq 1$
      00ABBA 35 CC 50         [ 2] 4861 	jp syntax_error 
      002EAA                       4862 1$: _xpop 
      00ABBD E0 9E            [ 1]    1     ld a,(y)
      00ABBF A4               [ 1]    2     ldw x,y 
      00ABC0 3F 95            [ 2]    3     ldw x,(1,x)
      00ABC2 A3 00 FF 23      [ 2]    4     addw y,#CELL_SIZE 
      00ABC6 06 0C 01         [ 4] 4863 	call xstack_bound
      00ABC9 98               [ 1] 4864     ld a,(x)
      00ABCA 56 20            [ 2] 4865 	ldw x,(1,x)				
      00ABCC F5               [ 4] 4866 	ret 
                                   4867 
                                   4868 
                                   4869 ;----------------------------
                                   4870 ; BASIC: AUTORUN \C | label  
                                   4871 ;  \C -> cancel autorun 
                                   4872 ;  addr -> register an 
                                   4873 ;    autorun program 
                                   4874 ;    this program execute at 
                                   4875 ;     reset/boot 
                                   4876 ;----------------------------
      002EBA                       4877 cmd_auto_run:
      00ABCD 35 55 50         [ 4] 4878 	call cmd_line_only
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



      00ABD0 E0 84 C7         [ 4] 4879 	call next_token 
      00ABD3 50 E1            [ 1] 4880 	cp a,#TK_LABEL 
      00ABD5 9F 4A            [ 1] 4881 	jreq 1$ 
      00ABD7 35 55            [ 1] 4882 	cp a,#TK_CHAR 
      00ABD9 50 E0            [ 1] 4883 	jrne 0$ 
      00ABDB C7               [ 1] 4884 	ld a,(x)
      00ABDC 50 E2 35 AA      [ 1] 4885 	inc in 
      00ABE0 50 E0            [ 1] 4886 	and a,#0xDF 
      00ABE2 81 43            [ 1] 4887 	cp a,#'C 
      00ABE3 26 07            [ 1] 4888 	jrne 0$ 
      00ABE3 35 AA 50         [ 2] 4889 	ldw x,#EEPROM_BASE 
      00ABE6 E0 81 1B         [ 4] 4890 	call erase_header
      00ABE8 81               [ 4] 4891 	ret 
      00ABE8 CD 97 6F         [ 2] 4892 0$:	jp syntax_error
      00ABEB A1               [ 2] 4893 1$:	pushw x 
      00ABEC 01 27 03         [ 4] 4894 	call skip_string
      00ABEF CC               [ 2] 4895 	popw x 
      00ABF0 94 3D 13         [ 4] 4896 	call search_program
      00ABF2 26 05            [ 1] 4897 	jrne 2$ 
      00ABF2 90 F6            [ 1] 4898 	ld a,#ERR_BAD_VALUE
      00ABF4 93 EE 01         [ 2] 4899 	jp tb_error 
      00ABF7 72               [ 2] 4900 2$: pushw x 
      00ABF8 A9 00 03 4D      [ 1] 4901 	clr farptr 
      00ABFC 26 08 5D         [ 2] 4902 	ldw x,#EEPROM_BASE
      00ABFF 26 05 A6         [ 2] 4903 	ldw ptr16,x 
      00AC02 0A CC 94         [ 1] 4904 	ld a,AR_SIGN 
      00AC05 3F               [ 1] 4905 	clrw x 	 
      00AC06 4B 18 59         [ 4] 4906 	call write_byte
      00AC09 49 25 04         [ 1] 4907 	ld a,AR_SIGN+1
      00AC0C 0A 01 26         [ 4] 4908 	call write_byte 
      00AC0F F8 5F            [ 1] 4909 	ld a,(1,sp)
      00AC11 84 4A 02         [ 4] 4910 	call write_byte 
      00AC14 7B 02            [ 1] 4911 	ld a,(2,sp)
      00AC14 81 04 B1         [ 4] 4912 	call write_byte 
      00AC15                       4913 	_drop 2 
      00AC15 CD 97            [ 2]    1     addw sp,#2 
      00AC17 6F               [ 4] 4914 	ret 
                                   4915 
      00AC18 A1 01                 4916 AR_SIGN: .ascii "AR" ; autorun signature 
                                   4917 
                                   4918 ;-------------------------------
                                   4919 ; search a program in flash 
                                   4920 ; memory with a label at first 
                                   4921 ; that correspond to name 
                                   4922 ; pointed by X 
                                   4923 ; input:
                                   4924 ;    x      *name 
                                   4925 ; output: 
                                   4926 ;    X     prog_addr|0
                                   4927 ;-------------------------------
                           000001  4928 	WLKPTR=1 
                           000003  4929 	PNAME=3
                           000005  4930 	LIMIT=5
                           000007  4931 	YSAVE=7
                           000006  4932 	VSIZE=6 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



      002F13                       4933 search_program:
      00AC1A 27 03            [ 2] 4934 	pushw y 
      002F15                       4935 	_vars VSIZE 
      00AC1C CC 94            [ 2]    1     sub sp,#VSIZE 
      00AC1E 3D 90            [ 2] 4936 	ldw (PNAME,sp),x 
      00AC20 F6 93 EE         [ 4] 4937 	call uflash 
      00AC23 01 72            [ 2] 4938 	ldw (LIMIT,sp),x 
      00AC25 A9 00 03         [ 2] 4939 	ldw x,#app_space 
      00AC28 9F AE            [ 2] 4940 1$:	ldw (WLKPTR,sp),x  
      00AC2A 00               [ 1] 4941 	clr a 
      00AC2B 01 A4 17         [ 4] 4942 	call is_program_addr
      00AC2E 27 0A            [ 1] 4943 	jrne 4$
      00AC30 88 4F 07         [ 2] 4944 	addw x,#7 
      00AC32 F6               [ 1] 4945 	ld a,(x)
      00AC32 58 49            [ 1] 4946 	cp a,#TK_LABEL 
      00AC34 0A 01            [ 1] 4947 	jrne 4$ 
      00AC36 26               [ 1] 4948 	incw x 
      00AC37 FA 03            [ 2] 4949 	ldw y,(PNAME,sp)
      00AC38 CD 10 C4         [ 4] 4950 	call strcmp
      00AC38 5B 01            [ 1] 4951 	jrne 6$
      002F39                       4952 4$: 
      00AC3A 81 26 E2         [ 4] 4953 	call skip_to_next
      00AC3B 13 05            [ 2] 4954 	cpw x,(LIMIT,sp)
      00AC3B 85 52            [ 1] 4955 	jrult 1$
      00AC3D 04               [ 1] 4956 	clrw x 
      00AC3E 89 CE            [ 2] 4957 	jra 8$
      002F43                       4958 6$: ; found label 
      00AC40 00 05            [ 2] 4959 	ldw x,(WLKPTR,sp)
      00AC42 1F 03 CE         [ 2] 4960 	addw x,#4 	
      002F48                       4961 8$:	
      002F48                       4962 	_drop VSIZE  
      00AC45 00 01            [ 2]    1     addw sp,#VSIZE 
      00AC47 1F 05            [ 2] 4963 	popw y 
      00AC49 72               [ 4] 4964 	ret 
                                   4965 
                                   4966 
                                   4967 ;-------------------------------
                                   4968 ; BASIC: CHAIN label [, line#]
                                   4969 ; Execute another program like it 
                                   4970 ; is a sub-routine. When the 
                                   4971 ; called program terminate 
                                   4972 ; execution continue at caller 
                                   4973 ; after CHAIN command. 
                                   4974 ; if a line# is given, the 
                                   4975 ; chained program start execution 
                                   4976 ; at this line#.
                                   4977 ;---------------------------------
                           000003  4978 	CHAIN_LN=3 
                           000005  4979 	CHAIN_ADDR=5 
                           000007  4980 	CHAIN_BP=7
                           000009  4981 	CHAIN_IN=9
                           00000A  4982 	CHAIN_COUNT=10 
                           00000B  4983 	CHAIN_TXTBGN=11 
                           00000D  4984 	CHAIN_TXTEND=13 
                           00000C  4985 	VSIZE=12 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



                           000004  4986 	DISCARD=4 
      002F4D                       4987 cmd_chain:
      00AC4A 5C               [ 2] 4988 	popw x 
      002F4E                       4989 	_vars VSIZE 
      00AC4B 00 20            [ 2]    1     sub sp,#VSIZE 
      00AC4D 81               [ 2] 4990 	pushw x
      00AC4E 0F 03            [ 1] 4991 	clr (CHAIN_LN,sp) 
      00AC4E 72 5D            [ 1] 4992 	clr (CHAIN_LN+1,sp)  
      00AC50 00 20            [ 1] 4993 	ld a,#TK_LABEL 
      00AC52 26 03 CC         [ 4] 4994 	call expect 
      00AC55 94               [ 2] 4995 	pushw x 
      00AC56 3D 15 32         [ 4] 4996 	call skip_string
      00AC57 85               [ 2] 4997 	popw x 
      00AC57 CD 99 CD         [ 4] 4998 	call search_program 
      00AC5A 90               [ 2] 4999 	tnzw x  
      00AC5B F6 93            [ 1] 5000 	jrne 1$ 
      00AC5D EE 01            [ 1] 5001 0$:	ld a,#ERR_BAD_VALUE
      00AC5F 72 A9 00         [ 2] 5002 	jp tb_error 
      00AC62 03 4D            [ 2] 5003 1$: ldw (CHAIN_ADDR,sp), x ; program addr 
      00AC64 26 13 5D         [ 4] 5004     call next_token 
      00AC67 26 10            [ 1] 5005 	cp a,#TK_COMMA 
      00AC69 1E 03            [ 1] 5006 	jrne 4$
      00AC6B CF 00            [ 1] 5007 	ld a,#TK_INTGR
      00AC6D 05 E6 02         [ 4] 5008 	call expect 
      00AC70 C7 00 03         [ 4] 5009 	call get_int24 
      00AC73 1E 05            [ 2] 5010 	ldw (CHAIN_LN,sp),x
      00AC75 CF 00            [ 2] 5011 	jra 6$ 
      002F7F                       5012 4$: _unget_token 
      00AC77 01 81 03 00 01   [ 1]    1      mov in,in.saved  
      00AC79                       5013 6$: ; save chain context 
      00AC79 85 5B 04         [ 2] 5014 	ldw x,basicptr 
      00AC7C 72 5A            [ 2] 5015 	ldw (CHAIN_BP,sp),x 
      00AC7E 00 20 FC         [ 2] 5016 	ldw x,in
      00AC81 1F 09            [ 2] 5017 	ldw (CHAIN_IN,sp),x
      00AC81 AE 50 00         [ 2] 5018 	ldw x,txtbgn 
      00AC84 4F 81            [ 2] 5019 	ldw (CHAIN_TXTBGN,sp),x
      00AC86 CE 00 1D         [ 2] 5020 	ldw x,txtend 
      00AC86 AE 50            [ 2] 5021 	ldw (CHAIN_TXTEND,sp),x  
                                   5022 ; set chained program context 	
      00AC88 05 4F            [ 2] 5023 	ldw x,(CHAIN_ADDR,sp)
      00AC8A 81 00 04         [ 2] 5024 	ldw basicptr,x 
      00AC8B CF 00 1B         [ 2] 5025 	ldw txtbgn,x 
      00AC8B AE 50 0A         [ 2] 5026 	subw x,#2
      00AC8E 4F               [ 2] 5027 	ldw x,(x)
      00AC8F 81 FB 05         [ 2] 5028 	addw x,(CHAIN_ADDR,sp)
      00AC90 CF 00 1D         [ 2] 5029 	ldw txtend,x  
      00AC90 AE 50            [ 2] 5030 	ldw x,(CHAIN_ADDR,sp)
      00AC92 0F 4F            [ 1] 5031 	ld a,(2,x)
      00AC94 81 00 02         [ 1] 5032 	ld count,a 
      00AC95 35 03 00 01      [ 1] 5033 	mov in,#3 
      00AC95 AE 50            [ 2] 5034 	ldw x,(CHAIN_LN,sp)
      00AC97 14               [ 2] 5035 	tnzw x 
      00AC98 4F 81            [ 1] 5036 	jreq 8$ 
      00AC9A 90 89            [ 2] 5037 	pushw y
      00AC9A AE               [ 1] 5038 	clr a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



      00AC9B 50 19 4F         [ 4] 5039 	call search_lineno
      00AC9E 81 85            [ 2] 5040 	popw y 
      00AC9F 5D               [ 2] 5041 	tnzw x 
      00AC9F AE 50            [ 1] 5042 	jreq 0$ 
      00ACA1 1E 4F 81         [ 2] 5043 	ldw basicptr,x 
      00ACA4 E6 02            [ 1] 5044 	ld a,(2,x)
      00ACA4 AE 50 28         [ 1] 5045 	ld count,a 
      00ACA7 4F 81 00 33      [ 1] 5046 8$: inc chain_level
      00ACA9 85               [ 2] 5047 	popw x 
      002FD2                       5048 	_drop DISCARD
      00ACA9 4F AE            [ 2]    1     addw sp,#DISCARD 
      00ACAB 00               [ 2] 5049 	jp (x)
                                   5050 
                                   5051 
                                   5052 ;------------------------------
                                   5053 ;      dictionary 
                                   5054 ; format:
                                   5055 ;   link:   2 bytes 
                                   5056 ;   name_length+flags:  1 byte, bits 0:3 lenght,4:8 kw type   
                                   5057 ;   cmd_name: 16 byte max 
                                   5058 ;   code_addr: 2 bytes 
                                   5059 ;------------------------------
                                   5060 	.macro _dict_entry len,name,code_addr 
                                   5061 	.word LINK 
                                   5062 	LINK=.
                                   5063 	.byte len   	
                                   5064 	.ascii "name"
                                   5065 	.word code_addr  
                                   5066 	.endm 
                                   5067 
                           000000  5068 	LINK=0
                                   5069 ; respect alphabetic order for BASIC names from Z-A
                                   5070 ; this sort order is for a cleaner WORDS cmd output. 	
      002FD5                       5071 kword_end:
      002FD5                       5072 	_dict_entry,3+F_XOR,XOR,TK_XOR ; xor operator
      00ACAC 00 81                    1 	.word LINK 
                           002FD7     2 	LINK=.
      00ACAE A3                       3 	.byte 3+F_XOR   	
      00ACAE 4F AE 00                 4 	.ascii "XOR"
      00ACB1 01 81                    5 	.word TK_XOR  
      00ACB3                       5073 	_dict_entry,5,WRITE,write  
      00ACB3 4F AE                    1 	.word LINK 
                           002FDF     2 	LINK=.
      00ACB5 00                       3 	.byte 5   	
      00ACB6 02 81 49 54 45           4 	.ascii "WRITE"
      00ACB8 27 49                    5 	.word write  
      002FE7                       5074 	_dict_entry,5,WORDS,words 
      00ACB8 4F AE                    1 	.word LINK 
                           002FE9     2 	LINK=.
      00ACBA 00                       3 	.byte 5   	
      00ACBB 03 81 52 44 53           4 	.ascii "WORDS"
      00ACBD 2A 96                    5 	.word words  
      002FF1                       5075 	_dict_entry 4,WAIT,wait 
      00ACBD 4F AE                    1 	.word LINK 
                           002FF3     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



      00ACBF 00                       3 	.byte 4   	
      00ACC0 04 81 49 54              4 	.ascii "WAIT"
      00ACC2 1E 7E                    5 	.word wait  
      002FFA                       5076 	_dict_entry,3+F_IFUNC,USR,usr
      00ACC2 4F AE                    1 	.word LINK 
                           002FFC     2 	LINK=.
      00ACC4 00                       3 	.byte 3+F_IFUNC   	
      00ACC5 01 81 52                 4 	.ascii "USR"
      00ACC7 28 3B                    5 	.word usr  
      003002                       5077 	_dict_entry,5,UNTIL,until 
      00ACC7 4F AE                    1 	.word LINK 
                           003004     2 	LINK=.
      00ACC9 00                       3 	.byte 5   	
      00ACCA 00 81 54 49 4C           4 	.ascii "UNTIL"
      00ACCC 2B CE                    5 	.word until  
      00300C                       5078 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      00ACCC 4F AE                    1 	.word LINK 
                           00300E     2 	LINK=.
      00ACCE 40                       3 	.byte 6+F_IFUNC   	
      00ACCF 00 81 4C 41 53 48        4 	.ascii "UFLASH"
      00ACD1 28 19                    5 	.word uflash  
      003017                       5079 	_dict_entry,6+F_IFUNC,UBOUND,ubound
      00ACD1 55 00                    1 	.word LINK 
                           003019     2 	LINK=.
      00ACD3 03                       3 	.byte 6+F_IFUNC   	
      00ACD4 00 02 81 55 4E 44        4 	.ascii "UBOUND"
      00ACD7 1A 01                    5 	.word ubound  
      003022                       5080 	_dict_entry,4,TONE,tone  
      00ACD7 89 E6                    1 	.word LINK 
                           003024     2 	LINK=.
      00ACD9 03                       3 	.byte 4   	
      00ACDA A1 80 26 05              4 	.ascii "TONE"
      00ACDE EE 04                    5 	.word tone  
      00302B                       5081 	_dict_entry,2,TO,to
      00ACE0 A3 AC                    1 	.word LINK 
                           00302D     2 	LINK=.
      00ACE2 D1                       3 	.byte 2   	
      00ACE3 85 81                    4 	.ascii "TO"
      00ACE5 1F E8                    5 	.word to  
      003032                       5082 	_dict_entry,5,TIMER,set_timer
      00ACE5 CD 97                    1 	.word LINK 
                           003034     2 	LINK=.
      00ACE7 57                       3 	.byte 5   	
      00ACE8 5F CF 00 07 CF           4 	.ascii "TIMER"
      00ACED 00 09                    5 	.word set_timer  
      00303C                       5083 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00ACEF CE 00                    1 	.word LINK 
                           00303E     2 	LINK=.
      00ACF1 1C                       3 	.byte 7+F_IFUNC   	
      00ACF2 CD 95 99 A1 84 26 10     4 	.ascii "TIMEOUT"
      00ACF9 CD 95                    5 	.word timeout  
      003048                       5084 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00ACFB CB 90                    1 	.word LINK 
                           00304A     2 	LINK=.
      00ACFD 89                       3 	.byte 5+F_IFUNC   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



      00ACFE 4F CD 89 EB 90           4 	.ascii "TICKS"
      00AD03 85 5D                    5 	.word get_ticks  
      003052                       5085 	_dict_entry,4,STOP,stop 
      00AD05 26 17                    1 	.word LINK 
                           003054     2 	LINK=.
      00AD07 20                       3 	.byte 4   	
      00AD08 44 54 4F 50              4 	.ascii "STOP"
      00AD09 24 95                    5 	.word stop  
      00305B                       5086 	_dict_entry,4,STEP,step 
      00AD09 55 00                    1 	.word LINK 
                           00305D     2 	LINK=.
      00AD0B 04                       3 	.byte 4   	
      00AD0C 00 02 C3 00              4 	.ascii "STEP"
      00AD10 1E 24                    5 	.word step  
      003064                       5087 	_dict_entry,5,SPIWR,spi_write
      00AD12 3A 5D                    1 	.word LINK 
                           003066     2 	LINK=.
      00AD13 05                       3 	.byte 5   	
      00AD13 CD AC D7 26 00           4 	.ascii "SPIWR"
      00AD18 CD AD                    5 	.word spi_write  
      00306E                       5088 	_dict_entry,6,SPISEL,spi_select
      00AD1A 2B 26                    1 	.word LINK 
                           003070     2 	LINK=.
      00AD1C FB                       3 	.byte 6   	
      00AD1D 81 50 49 53 45 4C        4 	.ascii "SPISEL"
      00AD1E 2D C2                    5 	.word spi_select  
      003079                       5089 	_dict_entry,5+F_IFUNC,SPIRD,spi_read 
      00AD1E CF 00                    1 	.word LINK 
                           00307B     2 	LINK=.
      00AD20 07                       3 	.byte 5+F_IFUNC   	
      00AD21 E6 02 C7 00 0A           4 	.ascii "SPIRD"
      00AD26 35 06                    5 	.word spi_read  
      003083                       5090 	_dict_entry,5,SPIEN,spi_enable 
      00AD28 00 09                    1 	.word LINK 
                           003085     2 	LINK=.
      00AD2A 81                       3 	.byte 5   	
      00AD2B 53 50 49 45 4E           4 	.ascii "SPIEN"
      00AD2B E6 02                    5 	.word spi_enable  
      00308D                       5091 	_dict_entry,5,SLEEP,sleep 
      00AD2D C7 00                    1 	.word LINK 
                           00308F     2 	LINK=.
      00AD2F 0F                       3 	.byte 5   	
      00AD30 72 5F 00 0E 72           4 	.ascii "SLEEP"
      00AD35 BB 00                    5 	.word sleep  
      003097                       5092     _dict_entry,4,SIZE,cmd_size 
      00AD37 0E C3                    1 	.word LINK 
                           003099     2 	LINK=.
      00AD39 00                       3 	.byte 4   	
      00AD3A 1E 25 02 20              4 	.ascii "SIZE"
      00AD3E 0E D4                    5 	.word cmd_size  
      00AD3F                       5093 	_dict_entry,4,SAVE,cmd_save 
      00AD3F CD AC                    1 	.word LINK 
                           0030A2     2 	LINK=.
      00AD41 D7                       3 	.byte 4   	
      00AD42 27 04 A6 01              4 	.ascii "SAVE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



      00AD46 20 04                    5 	.word cmd_save  
      0030A9                       5094 	_dict_entry 3,RUN,cmd_run
      00AD48 CD AD                    1 	.word LINK 
                           0030AB     2 	LINK=.
      00AD4A 1E                       3 	.byte 3   	
      00AD4B 4F 81 4E                 4 	.ascii "RUN"
      00AD4D 22 38                    5 	.word cmd_run  
      0030B1                       5095 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00AD4D A6 0C                    1 	.word LINK 
                           0030B3     2 	LINK=.
      00AD4F CC                       3 	.byte 6+F_IFUNC   	
      00AD50 94 3F 48 49 46 54        4 	.ascii "RSHIFT"
      00AD52 29 31                    5 	.word rshift  
      0030BC                       5096 	_dict_entry,3+F_IFUNC,RND,random 
      00AD52 CD 97                    1 	.word LINK 
                           0030BE     2 	LINK=.
      00AD54 57                       3 	.byte 3+F_IFUNC   	
      00AD55 52 07 CD                 4 	.ascii "RND"
      00AD58 9E 39                    5 	.word random  
      00AD5A                       5097 	_dict_entry,6,RETURN,return 
      00AD5A C6 00                    1 	.word LINK 
                           0030C6     2 	LINK=.
      00AD5C 09                       3 	.byte 6   	
      00AD5D C1 00 0A 27 37 4E        4 	.ascii "RETURN"
      00AD62 22 11                    5 	.word return  
      0030CF                       5098 	_dict_entry,7,RESTORE,restore 
      00AD62 CE 00                    1 	.word LINK 
                           0030D1     2 	LINK=.
      00AD64 07                       3 	.byte 7   	
      00AD65 CF 00 05 55 00 09 00     4 	.ascii "RESTORE"
      00AD6C 02 55                    5 	.word restore  
      0030DB                       5099 	_dict_entry 3,REM,remark 
      00AD6E 00 0A                    1 	.word LINK 
                           0030DD     2 	LINK=.
      00AD70 00                       3 	.byte 3   	
      00AD71 03 CD 98                 4 	.ascii "REM"
      00AD74 B4 A1                    5 	.word remark  
      0030E3                       5100 	_dict_entry,6,REBOOT,cold_start
      00AD76 84 27                    1 	.word LINK 
                           0030E5     2 	LINK=.
      00AD78 03                       3 	.byte 6   	
      00AD79 CC 94 3D 4F 4F 54        4 	.ascii "REBOOT"
      00AD7C 00 B5                    5 	.word cold_start  
      0030EE                       5101 	_dict_entry,4+F_IFUNC,READ,read  
      00AD7C CD 95                    1 	.word LINK 
                           0030F0     2 	LINK=.
      00AD7E 99                       3 	.byte 4+F_IFUNC   	
      00AD7F CE 00 05 CF              4 	.ascii "READ"
      00AD83 00 07                    5 	.word read  
      0030F7                       5102 	_dict_entry,3,PUT,xput 
      00AD85 55 00                    1 	.word LINK 
                           0030F9     2 	LINK=.
      00AD87 02                       3 	.byte 3   	
      00AD88 00 09 CD                 4 	.ascii "PUT"
      00AD8B 9E 49                    5 	.word xput  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



      0030FF                       5103 	_dict_entry,4,PUSH,xpush   
      00AD8D 90 F6                    1 	.word LINK 
                           003101     2 	LINK=.
      00AD8F 93                       3 	.byte 4   	
      00AD90 EE 01 72 A9              4 	.ascii "PUSH"
      00AD94 00 03                    5 	.word xpush  
      003108                       5104 	_dict_entry,5+F_IFUNC,PORTI,const_porti 
      00AD96 5B 07                    1 	.word LINK 
                           00310A     2 	LINK=.
      00AD98 81                       3 	.byte 5+F_IFUNC   	
      00AD99 50 4F 52 54 49           4 	.ascii "PORTI"
      00AD99 CE 00                    5 	.word const_porti  
      003112                       5105 	_dict_entry,5+F_IFUNC,PORTG,const_portg 
      00AD9B 07 CD                    1 	.word LINK 
                           003114     2 	LINK=.
      00AD9D AD                       3 	.byte 5+F_IFUNC   	
      00AD9E 2B 27 C1 20 AA           4 	.ascii "PORTG"
      00ADA3 2C 1F                    5 	.word const_portg  
      00311C                       5106 	_dict_entry,5+F_IFUNC,PORTF,const_portf
      00ADA3 CD 97                    1 	.word LINK 
                           00311E     2 	LINK=.
      00ADA5 74                       3 	.byte 5+F_IFUNC   	
      00ADA6 A1 02 27 03 CC           4 	.ascii "PORTF"
      00ADAB 94 3D                    5 	.word const_portf  
      00ADAD                       5107 	_dict_entry,5+F_IFUNC,PORTE,const_porte
      00ADAD 72 12                    1 	.word LINK 
                           003128     2 	LINK=.
      00ADAF 50                       3 	.byte 5+F_IFUNC   	
      00ADB0 C7 85 5D 27 21           4 	.ascii "PORTE"
      00ADB5 85 A6                    5 	.word const_porte  
      003130                       5108 	_dict_entry,5+F_IFUNC,PORTD,const_portd
      00ADB7 08 42                    1 	.word LINK 
                           003132     2 	LINK=.
      00ADB9 9F                       3 	.byte 5+F_IFUNC   	
      00ADBA C7 52 00 72 1A           4 	.ascii "PORTD"
      00ADBF 50 14                    5 	.word const_portd  
      00313A                       5109 	_dict_entry,5+F_IFUNC,PORTC,const_portc
      00ADC1 72 1A                    1 	.word LINK 
                           00313C     2 	LINK=.
      00ADC3 50                       3 	.byte 5+F_IFUNC   	
      00ADC4 16 72 14 52 00           4 	.ascii "PORTC"
      00ADC9 72 12                    5 	.word const_portc  
      003144                       5110 	_dict_entry,5+F_IFUNC,PORTB,const_portb
      00ADCB 52 01                    1 	.word LINK 
                           003146     2 	LINK=.
      00ADCD 72                       3 	.byte 5+F_IFUNC   	
      00ADCE 10 52 01 72 1C           4 	.ascii "PORTB"
      00ADD3 52 00                    5 	.word const_portb  
      00314E                       5111 	_dict_entry,5+F_IFUNC,PORTA,const_porta 
      00ADD5 81 46                    1 	.word LINK 
                           003150     2 	LINK=.
      00ADD6 15                       3 	.byte 5+F_IFUNC   	
      00ADD6 5B 02 A6 82 C4           4 	.ascii "PORTA"
      00ADDB 52 03                    5 	.word const_porta  
      003158                       5112 	_dict_entry 5,PRINT,cmd_print 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



      00ADDD A1 02                    1 	.word LINK 
                           00315A     2 	LINK=.
      00ADDF 26                       3 	.byte 5   	
      00ADE0 F7 72 1D 52 00           4 	.ascii "PRINT"
      00ADE5 72 13                    5 	.word cmd_print  
      003162                       5113 	_dict_entry,4+F_IFUNC,POUT,const_output
      00ADE7 50 C7                    1 	.word LINK 
                           003164     2 	LINK=.
      00ADE9 72                       3 	.byte 4+F_IFUNC   	
      00ADEA 1B 50 16 81              4 	.ascii "POUT"
      00ADEE 2C 42                    5 	.word const_output  
      00316B                       5114 	_dict_entry,3+F_IFUNC,POP,xpop 
      00ADEE A6 78                    1 	.word LINK 
                           00316D     2 	LINK=.
      00ADF0 C5                       3 	.byte 3+F_IFUNC   	
      00ADF1 52 03 27                 4 	.ascii "POP"
      00ADF4 04 72                    5 	.word xpop  
      003173                       5115 	_dict_entry,4,POKE,poke 
      00ADF6 5F 52                    1 	.word LINK 
                           003175     2 	LINK=.
      00ADF8 03                       3 	.byte 4   	
      00ADF9 81 4F 4B 45              4 	.ascii "POKE"
      00ADFA 1F 59                    5 	.word poke  
      00317C                       5116 	_dict_entry,5,PMODE,pin_mode 
      00ADFA 88 CD                    1 	.word LINK 
                           00317E     2 	LINK=.
      00ADFC AD                       3 	.byte 5   	
      00ADFD EE 84 72 03 52           4 	.ascii "PMODE"
      00AE02 03 FB                    5 	.word pin_mode  
      003186                       5117 	_dict_entry,4+F_IFUNC,PINP,const_input
      00AE04 C7 52                    1 	.word LINK 
                           003188     2 	LINK=.
      00AE06 04                       3 	.byte 4+F_IFUNC   	
      00AE07 72 01 52 03              4 	.ascii "PINP"
      00AE0B FB C6                    5 	.word const_input  
      00318F                       5118 	_dict_entry,4+F_IFUNC,PICK,xpick 
      00AE0D 52 04                    1 	.word LINK 
                           003191     2 	LINK=.
      00AE0F 81                       3 	.byte 4+F_IFUNC   	
      00AE10 50 49 43 4B              4 	.ascii "PICK"
      00AE10 A6 FF                    5 	.word xpick  
      003198                       5119 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00AE12 72 01                    1 	.word LINK 
                           00319A     2 	LINK=.
      00AE14 52                       3 	.byte 4+F_IFUNC   	
      00AE15 03 E3 C6 52              4 	.ascii "PEEK"
      00AE19 04 81                    5 	.word peek  
      00AE1B                       5120 	_dict_entry,5,PAUSE,pause 
      00AE1B CD 98                    1 	.word LINK 
                           0031A3     2 	LINK=.
      00AE1D B4                       3 	.byte 5   	
      00AE1E A1 84 27 03 CC           4 	.ascii "PAUSE"
      00AE23 94 3D                    5 	.word pause  
      00AE25                       5121 	_dict_entry,3+F_IFUNC,PAD,pad_ref 
      00AE25 9F CD                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



                           0031AD     2 	LINK=.
      00AE27 AD                       3 	.byte 3+F_IFUNC   	
      00AE28 FA CD 95                 4 	.ascii "PAD"
      00AE2B 99 A1                    5 	.word pad_ref  
      0031B3                       5122 	_dict_entry,2+F_OR,OR,TK_OR ; OR operator 
      00AE2D 08 26                    1 	.word LINK 
                           0031B5     2 	LINK=.
      00AE2F 02                       3 	.byte 2+F_OR   	
      00AE30 20 E9                    4 	.ascii "OR"
      00AE32 4D 27                    5 	.word TK_OR  
      0031BA                       5123 	_dict_entry,2,ON,cmd_on 
      00AE34 05 55                    1 	.word LINK 
                           0031BC     2 	LINK=.
      00AE36 00                       3 	.byte 2   	
      00AE37 04 00                    4 	.ascii "ON"
      00AE39 02 81                    5 	.word cmd_on  
      00AE3B                       5124 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00AE3B CD AE                    1 	.word LINK 
                           0031C3     2 	LINK=.
      00AE3D 10                       3 	.byte 3+F_IFUNC   	
      00AE3E 5F 97 4F                 4 	.ascii "ODR"
      00AE41 81 29                    5 	.word const_odr  
      00AE42                       5125 	_dict_entry,3+F_NOT,NOT,TK_NOT;NOT operator
      00AE42 CD 95                    1 	.word LINK 
                           0031CB     2 	LINK=.
      00AE44 99                       3 	.byte 3+F_NOT   	
      00AE45 A1 84 27                 4 	.ascii "NOT"
      00AE48 03 CC                    5 	.word TK_NOT  
      0031D1                       5126 	_dict_entry,4,NEXT,next 
      00AE4A 94 3D                    1 	.word LINK 
                           0031D3     2 	LINK=.
      00AE4C 5D                       3 	.byte 4   	
      00AE4D 27 05 72 1B              4 	.ascii "NEXT"
      00AE51 50 14                    5 	.word next  
      0031DA                       5127 	_dict_entry,3,NEW,new
      00AE53 81 D3                    1 	.word LINK 
                           0031DC     2 	LINK=.
      00AE54 03                       3 	.byte 3   	
      00AE54 72 1A 50                 4 	.ascii "NEW"
      00AE57 14 81                    5 	.word new  
      00AE59                       5128 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00AE59 AE 16                    1 	.word LINK 
                           0031E4     2 	LINK=.
      00AE5B B8                       3 	.byte 6+F_IFUNC   	
      00AE5C 4F 81 48 49 46 54        4 	.ascii "LSHIFT"
      00AE5E 29 05                    5 	.word lshift  
      0031ED                       5129 	_dict_entry,4+F_IFUNC,LOG2,log2 
      00AE5E CD 99                    1 	.word LINK 
                           0031EF     2 	LINK=.
      00AE60 CD                       3 	.byte 4+F_IFUNC   	
      00AE61 81 4F 47 32              4 	.ascii "LOG2"
      00AE62 2B 68                    5 	.word log2  
      0031F6                       5130 	_dict_entry 4,LIST,cmd_list
      00AE62 90 F6                    1 	.word LINK 
                           0031F8     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal [24-Bits]



      00AE64 93                       3 	.byte 4   	
      00AE65 EE 01 72 A9              4 	.ascii "LIST"
      00AE69 00 03                    5 	.word cmd_list  
      0031FF                       5131 	_dict_entry 3,LET,let 
      00AE6B 81 F8                    1 	.word LINK 
                           003201     2 	LINK=.
      00AE6C 03                       3 	.byte 3   	
      00AE6C CD 98 B4                 4 	.ascii "LET"
      00AE6F A1 84                    5 	.word let  
      003207                       5132 	_dict_entry,4+F_IFUNC,KEY?,qkey
      00AE71 27 03                    1 	.word LINK 
                           003209     2 	LINK=.
      00AE73 CC                       3 	.byte 4+F_IFUNC   	
      00AE74 94 3D 90 F6              4 	.ascii "KEY?"
      00AE78 93 EE                    5 	.word qkey  
      003210                       5133 	_dict_entry,3+F_CFUNC,KEY,key 
      00AE7A 01 72                    1 	.word LINK 
                           003212     2 	LINK=.
      00AE7C A9                       3 	.byte 3+F_CFUNC   	
      00AE7D 00 03 4D                 4 	.ascii "KEY"
      00AE80 27 05                    5 	.word key  
      003218                       5134 	_dict_entry,7,IWDGREF,refresh_iwdg
      00AE82 A6 0A                    1 	.word LINK 
                           00321A     2 	LINK=.
      00AE84 CC                       3 	.byte 7   	
      00AE85 94 3F A3 00 14 22 F6     4 	.ascii "IWDGREF"
      00AE8C A6 03                    5 	.word refresh_iwdg  
      003224                       5135 	_dict_entry,6,IWDGEN,enable_iwdg
      00AE8E 42 CF                    1 	.word LINK 
                           003226     2 	LINK=.
      00AE90 00                       3 	.byte 6   	
      00AE91 0E 72 B2 00 0E 90        4 	.ascii "IWDGEN"
      00AE97 A3 17                    5 	.word enable_iwdg  
      00322F                       5136 	_dict_entry,5,INPUT,input_var  
      00AE99 38 22                    1 	.word LINK 
                           003231     2 	LINK=.
      00AE9B 05                       3 	.byte 5   	
      00AE9C A6 01 CC 94 3F           4 	.ascii "INPUT"
      00AEA1 1D D9                    5 	.word input_var  
      003239                       5137 	_dict_entry,2,IF,if 
      00AEA1 81 31                    1 	.word LINK 
                           00323B     2 	LINK=.
      00AEA2 02                       3 	.byte 2   	
      00AEA2 CD 98                    4 	.ascii "IF"
      00AEA4 B4 A1                    5 	.word if  
      003240                       5138 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00AEA6 84 27                    1 	.word LINK 
                           003242     2 	LINK=.
      00AEA8 03                       3 	.byte 3+F_IFUNC   	
      00AEA9 CC 94 3D                 4 	.ascii "IDR"
      00AEAC 90 F6                    5 	.word const_idr  
      003248                       5139 	_dict_entry,3,HEX,hex_base
      00AEAE 93 EE                    1 	.word LINK 
                           00324A     2 	LINK=.
      00AEB0 01                       3 	.byte 3   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 227.
Hexadecimal [24-Bits]



      00AEB1 72 A9 00                 4 	.ascii "HEX"
      00AEB4 03 9F                    5 	.word hex_base  
      003250                       5140 	_dict_entry,4,GOTO,goto 
      00AEB6 A4 1F                    1 	.word LINK 
                           003252     2 	LINK=.
      00AEB8 5F                       3 	.byte 4   	
      00AEB9 97 A6 03 42              4 	.ascii "GOTO"
      00AEBD CF 00                    5 	.word goto  
      003259                       5141 	_dict_entry,5,GOSUB,gosub 
      00AEBF 0E 72                    1 	.word LINK 
                           00325B     2 	LINK=.
      00AEC1 B9                       3 	.byte 5   	
      00AEC2 00 0E 90 A3 17           4 	.ascii "GOSUB"
      00AEC7 73 23                    5 	.word gosub  
      003263                       5142 	_dict_entry,3,GET,cmd_get 
      00AEC9 04 90                    1 	.word LINK 
                           003265     2 	LINK=.
      00AECB AE                       3 	.byte 3   	
      00AECC 17 73 81                 4 	.ascii "GET"
      00AECF 22 F4                    5 	.word cmd_get  
      00326B                       5143 	_dict_entry,4+F_IFUNC,FREE,free
      00AECF 4D 26                    1 	.word LINK 
                           00326D     2 	LINK=.
      00AED1 16                       3 	.byte 4+F_IFUNC   	
      00AED2 A3 00 14 22              4 	.ascii "FREE"
      00AED6 11 A6                    5 	.word free  
      003274                       5144 	_dict_entry,3,FOR,for 
      00AED8 03 42                    1 	.word LINK 
                           003276     2 	LINK=.
      00AEDA CF                       3 	.byte 3   	
      00AEDB 00 0E 93                 4 	.ascii "FOR"
      00AEDE 72 BB                    5 	.word for  
      00327C                       5145 	_dict_entry,4,FCPU,fcpu 
      00AEE0 00 0E                    1 	.word LINK 
                           00327E     2 	LINK=.
      00AEE2 A3                       3 	.byte 4   	
      00AEE3 17 73 24 01              4 	.ascii "FCPU"
      00AEE7 81 A6                    5 	.word fcpu  
      003285                       5146 	_dict_entry,5,ERASE,cmd_erase 
      00AEE9 0A CC                    1 	.word LINK 
                           003287     2 	LINK=.
      00AEEB 94                       3 	.byte 5   	
      00AEEC 3F 52 41 53 45           4 	.ascii "ERASE"
      00AEED 25 40                    5 	.word cmd_erase  
      00328F                       5147 	_dict_entry,3,END,cmd_end  
      00AEED CD 97                    1 	.word LINK 
                           003291     2 	LINK=.
      00AEEF 74                       3 	.byte 3   	
      00AEF0 A1 02 27                 4 	.ascii "END"
      00AEF3 03 CC                    5 	.word cmd_end  
      003297                       5148 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00AEF5 94 3D                    1 	.word LINK 
                           003299     2 	LINK=.
      00AEF7 90                       3 	.byte 6+F_IFUNC   	
      00AEF8 F6 93 EE 01 72 A9        4 	.ascii "EEPROM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
Hexadecimal [24-Bits]



      00AEFE 00 03                    5 	.word const_eeprom_base  
      0032A2                       5149 	_dict_entry,6+F_IFUNC,EEFREE,func_eefree 
      00AF00 89 88                    1 	.word LINK 
                           0032A4     2 	LINK=.
      00AF02 90                       3 	.byte 6+F_IFUNC   	
      00AF03 F6 93 EE 01 72 A9        4 	.ascii "EEFREE"
      00AF09 00 03                    5 	.word func_eefree  
      0032AD                       5150 	_dict_entry,4,EDIT,cmd_edit 
      00AF0B CD AE                    1 	.word LINK 
                           0032AF     2 	LINK=.
      00AF0D CF                       3 	.byte 4   	
      00AF0E CF 00 1A 84              4 	.ascii "EDIT"
      00AF12 85 72                    5 	.word cmd_edit  
      0032B6                       5151 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00AF14 C7 00                    1 	.word LINK 
                           0032B8     2 	LINK=.
      00AF16 1A                       3 	.byte 6+F_CMD   	
      00AF17 72 5C 00 1B 72 CF        4 	.ascii "DWRITE"
      00AF1D 00 1A                    5 	.word digital_write  
      0032C1                       5152 	_dict_entry,4,DROP,xdrop ; drop n element from xtack 
      00AF1F 81 B8                    1 	.word LINK 
                           0032C3     2 	LINK=.
      00AF20 04                       3 	.byte 4   	
      00AF20 CD 97 6F A1              4 	.ascii "DROP"
      00AF24 01 27                    5 	.word xdrop  
      0032CA                       5153 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00AF26 03 CC                    1 	.word LINK 
                           0032CC     2 	LINK=.
      00AF28 94                       3 	.byte 5+F_IFUNC   	
      00AF29 3D 90 F6 93 EE           4 	.ascii "DREAD"
      00AF2E 01 72                    5 	.word digital_read  
      0032D4                       5154 	_dict_entry,2,DO,do_loop
      00AF30 A9 00                    1 	.word LINK 
                           0032D6     2 	LINK=.
      00AF32 03                       3 	.byte 2   	
      00AF33 CD AE                    4 	.ascii "DO"
      00AF35 CF F6                    5 	.word do_loop  
      0032DB                       5155 	_dict_entry,3,DIR,cmd_dir
      00AF37 EE 01                    1 	.word LINK 
                           0032DD     2 	LINK=.
      00AF39 81                       3 	.byte 3   	
      00AF3A 44 49 52                 4 	.ascii "DIR"
      00AF3A CD 97                    5 	.word cmd_dir  
      0032E3                       5156 	_dict_entry,3,DIM,cmd_dim 
      00AF3C 4C CD                    1 	.word LINK 
                           0032E5     2 	LINK=.
      00AF3E 95                       3 	.byte 3   	
      00AF3F 99 A1 03                 4 	.ascii "DIM"
      00AF42 27 19                    5 	.word cmd_dim  
      0032EB                       5157 	_dict_entry,3,DEC,dec_base
      00AF44 A1 04                    1 	.word LINK 
                           0032ED     2 	LINK=.
      00AF46 26                       3 	.byte 3   	
      00AF47 12 F6 72                 4 	.ascii "DEC"
      00AF4A 5C 00                    5 	.word dec_base  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



      0032F3                       5158 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00AF4C 02 A4                    1 	.word LINK 
                           0032F5     2 	LINK=.
      00AF4E DF                       3 	.byte 3+F_IFUNC   	
      00AF4F A1 43 26                 4 	.ascii "DDR"
      00AF52 07 AE                    5 	.word const_ddr  
      0032FB                       5159 	_dict_entry,4,DATA,data  
      00AF54 40 00                    1 	.word LINK 
                           0032FD     2 	LINK=.
      00AF56 CD                       3 	.byte 4   	
      00AF57 A6 9B 81 CC              4 	.ascii "DATA"
      00AF5B 94 3D                    5 	.word data  
      003304                       5160 	_dict_entry,3+F_IFUNC,CR2,const_cr2 
      00AF5D 89 CD                    1 	.word LINK 
                           003306     2 	LINK=.
      00AF5F 95                       3 	.byte 3+F_IFUNC   	
      00AF60 B2 85 CD                 4 	.ascii "CR2"
      00AF63 AF 93                    5 	.word const_cr2  
      00330C                       5161 	_dict_entry,3+F_IFUNC,CR1,const_cr1 
      00AF65 26 05                    1 	.word LINK 
                           00330E     2 	LINK=.
      00AF67 A6                       3 	.byte 3+F_IFUNC   	
      00AF68 0A CC 94                 4 	.ascii "CR1"
      00AF6B 3F 89                    5 	.word const_cr1  
      003314                       5162 	_dict_entry,5,CONST,cmd_const 
      00AF6D 72 5F                    1 	.word LINK 
                           003316     2 	LINK=.
      00AF6F 00                       3 	.byte 5   	
      00AF70 19 AE 40 00 CF           4 	.ascii "CONST"
      00AF75 00 1A                    5 	.word cmd_const  
      00331E                       5163 	_dict_entry,4+F_CFUNC,CHAR,func_char
      00AF77 C6 AF                    1 	.word LINK 
                           003320     2 	LINK=.
      00AF79 91                       3 	.byte 4+F_CFUNC   	
      00AF7A 5F CD 85 31              4 	.ascii "CHAR"
      00AF7E C6 AF                    5 	.word func_char  
      003327                       5164 	_dict_entry,5,CHAIN,cmd_chain
      00AF80 92 CD                    1 	.word LINK 
                           003329     2 	LINK=.
      00AF82 85                       3 	.byte 5   	
      00AF83 31 7B 01 CD 85           4 	.ascii "CHAIN"
      00AF88 31 7B                    5 	.word cmd_chain  
      003331                       5165 	_dict_entry,3,BYE,bye 
      00AF8A 02 CD                    1 	.word LINK 
                           003333     2 	LINK=.
      00AF8C 85                       3 	.byte 3   	
      00AF8D 31 5B 02                 4 	.ascii "BYE"
      00AF90 81 41                    5 	.word bye  
      003339                       5166 	_dict_entry,5,BTOGL,bit_toggle
      00AF92 52 33                    1 	.word LINK 
                           00333B     2 	LINK=.
      00AF93 05                       3 	.byte 5   	
      00AF93 90 89 52 06 1F           4 	.ascii "BTOGL"
      00AF98 03 CD                    5 	.word bit_toggle  
      003343                       5167 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
Hexadecimal [24-Bits]



      00AF9A A8 99                    1 	.word LINK 
                           003345     2 	LINK=.
      00AF9C 1F                       3 	.byte 5+F_IFUNC   	
      00AF9D 05 AE B4 80 1F           4 	.ascii "BTEST"
      00AFA2 01 4F                    5 	.word bit_test  
      00334D                       5168 	_dict_entry,4,BSET,bit_set 
      00AFA4 CD A2                    1 	.word LINK 
                           00334F     2 	LINK=.
      00AFA6 A7                       3 	.byte 4   	
      00AFA7 26 10 1C 00              4 	.ascii "BSET"
      00AFAB 07 F6                    5 	.word bit_set  
      003356                       5169 	_dict_entry,4,BRES,bit_reset
      00AFAD A1 03                    1 	.word LINK 
                           003358     2 	LINK=.
      00AFAF 26                       3 	.byte 4   	
      00AFB0 08 5C 16 03              4 	.ascii "BRES"
      00AFB4 CD 91                    5 	.word bit_reset  
      00335F                       5170 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00AFB6 44 26                    1 	.word LINK 
                           003361     2 	LINK=.
      00AFB8 0A                       3 	.byte 3+F_IFUNC   	
      00AFB9 42 49 54                 4 	.ascii "BIT"
      00AFB9 CD A7                    5 	.word bitmask  
      003367                       5171 	_dict_entry,3,AWU,awu 
      00AFBB 62 13                    1 	.word LINK 
                           003369     2 	LINK=.
      00AFBD 05                       3 	.byte 3   	
      00AFBE 25 E1 5F                 4 	.ascii "AWU"
      00AFC1 20 05                    5 	.word awu  
      00AFC3                       5172 	_dict_entry,7,AUTORUN,cmd_auto_run
      00AFC3 1E 01                    1 	.word LINK 
                           003371     2 	LINK=.
      00AFC5 1C                       3 	.byte 7   	
      00AFC6 00 04 54 4F 52 55 4E     4 	.ascii "AUTORUN"
      00AFC8 2E BA                    5 	.word cmd_auto_run  
      00337B                       5173 	_dict_entry,3+F_IFUNC,ASC,ascii
      00AFC8 5B 06                    1 	.word LINK 
                           00337D     2 	LINK=.
      00AFCA 90                       3 	.byte 3+F_IFUNC   	
      00AFCB 85 81 43                 4 	.ascii "ASC"
      00AFCD 27 C9                    5 	.word ascii  
      003383                       5174 	_dict_entry,3+F_AND,AND,TK_AND ; AND operator 
      00AFCD 85 52                    1 	.word LINK 
                           003385     2 	LINK=.
      00AFCF 0C                       3 	.byte 3+F_AND   	
      00AFD0 89 0F 03                 4 	.ascii "AND"
      00AFD3 0F 04                    5 	.word TK_AND  
      00338B                       5175 	_dict_entry,5,ALLOC,xalloc ; allocate space on xtack 
      00AFD5 A6 03                    1 	.word LINK 
                           00338D     2 	LINK=.
      00AFD7 CD                       3 	.byte 5   	
      00AFD8 97 62 89 CD 95           4 	.ascii "ALLOC"
      00AFDD B2 85                    5 	.word xalloc  
      003395                       5176 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00AFDF CD AF                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 231.
Hexadecimal [24-Bits]



                           003397     2 	LINK=.
      00AFE1 93                       3 	.byte 7+F_IFUNC   	
      00AFE2 5D 26 05 A6 0A CC 94     4 	.ascii "ADCREAD"
      00AFE9 3F 1F                    5 	.word analog_read  
      0033A1                       5177 	_dict_entry,5,ADCON,power_adc 
      00AFEB 05 CD                    1 	.word LINK 
                           0033A3     2 	LINK=.
      00AFED 95                       3 	.byte 5   	
      00AFEE 99 A1 08 26 0C           4 	.ascii "ADCON"
      00AFF3 A6 84                    5 	.word power_adc  
      0033AB                       5178 kword_dict::
      0033AB                       5179 	_dict_entry,3+F_IFUNC,ABS,abs
      00AFF5 CD 97                    1 	.word LINK 
                           0033AD     2 	LINK=.
      00AFF7 62                       3 	.byte 3+F_IFUNC   	
      00AFF8 CD 95 CB                 4 	.ascii "ABS"
      00AFFB 1F 03                    5 	.word abs  
                                   5180 
                                   5181 
                                   5182 
                                   5183 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
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
                           000000    14 .if DEBUG 
                                     15 ;;;;;;;;;;;;;;;;;;;;;;;;
                                     16 ;;;    TEST  CODE   ;;;;
                                     17 ;;;;;;;;;;;;;;;;;;;;;;;;
                                     18 
                                     19 LOOP_CNT=10000
                                     20 VAL1=0x2ffff ; 196607
                                     21 VAL2=0x2a    ; 42  
                                     22 VAL3=3 
                                     23 VAL4=0X5FF   ; 1535 
                                     24 VAL5=-3 
                                     25 ; test code
                                     26     T=1    ; .word 
                                     27     CNTR=3 ; .word 
                                     28     A32=5  ; .blkw 2
                                     29     VSIZE= 8 
                                     30 test:
                                     31     _vars VSIZE 
                                     32     ldw x,#LOOP_CNT
                                     33     ldw (CNTR,sp),x  
                                     34     ldw x,ticks 
                                     35     ldw (T,sp),x
                                     36 1$: ; test add24 
                                     37     ld a,#(VAL1>>16)&0XFF
                                     38     ldw x,#VAL1&0XFFFF
                                     39     ld acc24,a 
                                     40     ldw acc24+1,x  
                                     41     ld a,#(VAL4>>16)&0XFF
                                     42     ldw x,#(VAL4&0XFFFF)
                                     43     call add24 
                                     44     ldw x,(CNTR,sp)
                                     45     subw x,#1
                                     46     ldw (CNTR,sp),x 
                                     47     jrne 1$
                                     48     call prt_acc24
                                     49     ld a,#SPACE 
                                     50     call putc 
                                     51     ldw x,ticks 
                                     52     subw x,(T,sp)
                                     53     call prt_i16  
                                     54     ld a,#CR 
                                     55     call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 233.
Hexadecimal [24-Bits]



                                     56 
                                     57 ; test mul24     
                                     58     ldw x,LOOP_CNT
                                     59     ldw (CNTR,sp),x 
                                     60     ldw x,ticks 
                                     61     ldw (T,sp),x 
                                     62 2$: 
                                     63     ld a,#(VAL1>>16)&0XFF
                                     64     ldw x,#VAL1&0XFFFF
                                     65     ld acc24,a 
                                     66     ldw acc24+1,x  
                                     67     ld a,#(VAL2>>16)&0XFF
                                     68     ldw x,#(VAL2&0XFFFF)
                                     69     call mul24 
                                     70     ldw x,(CNTR,sp)
                                     71     subw x,#1
                                     72     ldw (CNTR,sp),x 
                                     73     jrne 2$ 
                                     74    call prt_acc24 
                                     75    ld a,#SPACE 
                                     76    call putc 
                                     77     ldw x,ticks 
                                     78     subw x,(T,sp)
                                     79     call prt_i16 
                                     80     ld a,#CR 
                                     81     call putc 
                                     82 ; test mul24 with overflow     
                                     83     ldw x,LOOP_CNT
                                     84     ldw (CNTR,sp),x 
                                     85     ldw x,ticks 
                                     86     ldw (T,sp),x 
                                     87 3$: 
                                     88     ld a,#(VAL1>>16)&0XFF
                                     89     ldw x,#VAL1&0XFFFF
                                     90     ld acc24,a 
                                     91     ldw acc24+1,x  
                                     92     ld a,#(VAL4>>16)&0XFF
                                     93     ldw x,#(VAL4&0XFFFF)
                                     94     call mul24 
                                     95     ldw x,(CNTR,sp)
                                     96     subw x,#1
                                     97     ldw (CNTR,sp),x 
                                     98     jrne 3$ 
                                     99     call prt_acc24    
                                    100     ld a,#SPACE 
                                    101     call putc 
                                    102     ldw x,ticks 
                                    103     subw x,(T,sp)
                                    104     call prt_i16 
                                    105     ld a,#CR 
                                    106     call putc 
                                    107 ; test mul24  with negative result   
                                    108     ldw x,LOOP_CNT
                                    109     ldw (CNTR,sp),x 
                                    110     ldw x,ticks 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 234.
Hexadecimal [24-Bits]



                                    111     ldw (T,sp),x 
                                    112 4$:
                                    113     ld a,#(VAL1>>16)&0XFF
                                    114     ldw x,#VAL1&0XFFFF
                                    115     ld acc24,a 
                                    116     ldw acc24+1,x  
                                    117     ld a,#(VAL5>>16)&0XFF
                                    118     ldw x,#(VAL5&0XFFFF)
                                    119     call mul24 
                                    120     ldw x,(CNTR,sp)
                                    121     subw x,#1
                                    122     ldw (CNTR,sp),x 
                                    123     jrne 4$ 
                                    124     call prt_acc24 
                                    125     ld a,#SPACE 
                                    126     call putc 
                                    127     ldw x,ticks 
                                    128     subw x,(T,sp)
                                    129     call prt_i16 
                                    130     ld a,#CR 
                                    131     call putc 
                                    132 ; test abs24 
                                    133     ldw x,LOOP_CNT
                                    134     ldw (CNTR,sp),x 
                                    135     ldw x,ticks 
                                    136     ldw (T,sp),x 
                                    137 5$: 
                                    138     ld a,#0xff
                                    139     ldw x,#0xffff
                                    140     call abs24 
                                    141     ld acc24,a 
                                    142     ldw acc24+1,x
                                    143     ldw x,(CNTR,sp)
                                    144     subw x,#1
                                    145     ldw (CNTR,sp),x 
                                    146     jrne 5$ 
                                    147     call prt_acc24 
                                    148     ld a,#SPACE 
                                    149     call putc 
                                    150     ldw x,ticks 
                                    151     subw x,(T,sp)
                                    152     call prt_i16 
                                    153 6$:
                                    154     ld a,#CR 
                                    155     call putc 
                                    156     call read_integer 
                                    157     mov farptr,acc24 
                                    158     mov farptr+1,acc16 
                                    159     mov farptr+2,acc8 
                                    160     call read_integer 
                                    161     ld a,acc24 
                                    162     ldw x,acc16 
                                    163     mov acc24,farptr 
                                    164     mov acc16,farptr+1
                                    165     mov acc8,farptr+2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
Hexadecimal [24-Bits]



                                    166     call div24 
                                    167     push a 
                                    168     pushw x 
                                    169     call prt_acc24 
                                    170     ld a,#SPACE 
                                    171     call putc 
                                    172     popw x
                                    173     ldw acc16,x  
                                    174     pop acc24 
                                    175     call prt_acc24
                                    176     jra 6$
                                    177     _drop VSIZE 
                                    178     ret 
                                    179 
                                    180 
                                    181 read_integer:
                                    182     ld a,#'? 
                                    183     call putc  
                                    184 	clr count  
                                    185 	call readln 
                                    186 	ldw x,#tib 
                                    187 	push count
                                    188 	push #0 
                                    189 	addw x,(1,sp)
                                    190 	incw x 
                                    191 	_drop 2 
                                    192 	clr in 
                                    193 	call get_token
                                    194 	cp a,#TK_INTGR
                                    195 	jreq 3$ 
                                    196 	cp a,#TK_MINUS
                                    197 	call get_token 
                                    198 	cp a,#TK_INTGR 
                                    199 	jreq 2$
                                    200 	jp syntax_error
                                    201 2$:
                                    202 	call neg_acc24  	
                                    203 3$: 
                                    204     ret 
                                    205 
                                    206 .endif ; DEBUG  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 236.
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
      003400                         28 	.bndry 128 ; align on FLASH block.
                                     29 ; space for user application  
      003400                         30 app_space::
      00AFFD 20 05                   31 app_sign:  .word 0 ; .ascii "BC"  ; signature 
      00AFFF 55 00                   32 app_size: .word 0 
      003404                         33 app: 
                                     34 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
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
    ADDR    =  000001     |     AFR     =  004803     |     AFR0_ADC=  000000 
    AFR1_TIM=  000001     |     AFR2_CCO=  000002     |     AFR3_TIM=  000003 
    AFR4_TIM=  000004     |     AFR5_TIM=  000005     |     AFR6_I2C=  000006 
    AFR7_BEE=  000007     |     ARG_OFS =  000002     |     ARROW_LE=  000080 
    ARROW_RI=  000081     |   4 AR_SIGN    002F11 R   |     ATMP    =  000001 
    ATTRIB  =  000002     |   4 AUTO_RUN   00015C R   |   4 AWUHandl   000004 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_CSR_=  000004 
    AWU_TBR =  0050F2     |     B0_MASK =  000001     |     B115200 =  000006 
    B19200  =  000003     |     B1_MASK =  000002     |     B230400 =  000007 
    B2400   =  000000     |     B2_MASK =  000004     |     B38400  =  000004 
    B3_MASK =  000008     |     B460800 =  000008     |     B4800   =  000001 
    B4_MASK =  000010     |     B57600  =  000005     |     B5_MASK =  000020 
    B6_MASK =  000040     |     B7_MASK =  000080     |     B921600 =  000009 
    B9600   =  000002     |     BASE    =  000002     |     BASE_SAV=  000001 
    BCNT    =  000001     |     BEEP_BIT=  000004     |     BEEP_CSR=  0050F3 
    BEEP_MAS=  000010     |     BEEP_POR=  00000F     |     BELL    =  000007 
    BINARY  =  000001     |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
    BLOCKS  =  000005     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  00000D     |     BS      =  000008 
    BSIZE   =  000006     |     BTW     =  000001     |     C       =  000001 
    CAN     =  000018     |     CAN_DGR =  005426     |     CAN_FPSR=  005427 
    CAN_IER =  005425     |     CAN_MCR =  005420     |     CAN_MSR =  005421 
    CAN_P0  =  005428     |     CAN_P1  =  005429     |     CAN_P2  =  00542A 
    CAN_P3  =  00542B     |     CAN_P4  =  00542C     |     CAN_P5  =  00542D 
    CAN_P6  =  00542E     |     CAN_P7  =  00542F     |     CAN_P8  =  005430 
    CAN_P9  =  005431     |     CAN_PA  =  005432     |     CAN_PB  =  005433 
    CAN_PC  =  005434     |     CAN_PD  =  005435     |     CAN_PE  =  005436 
    CAN_PF  =  005437     |     CAN_RFR =  005424     |     CAN_TPR =  005423 
    CAN_TSR =  005422     |     CC_C    =  000000     |     CC_H    =  000004 
    CC_I0   =  000003     |     CC_I1   =  000005     |     CC_N    =  000002 
    CC_V    =  000007     |     CC_Z    =  000001     |     CELL_SIZ=  000003 
    CFG_GCR =  007F60     |     CFG_GCR_=  000001     |     CFG_GCR_=  000000 
    CHAIN_AD=  000005     |     CHAIN_BP=  000007     |     CHAIN_CN=  000008 
    CHAIN_CO=  00000A     |     CHAIN_IN=  000009     |     CHAIN_LN=  000003 
    CHAIN_TX=  00000B     |     CHAIN_TX=  00000D     |     CLKOPT  =  004807 
    CLKOPT_C=  000002     |     CLKOPT_E=  000003     |     CLKOPT_P=  000000 
    CLKOPT_P=  000001     |     CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6 
    CLK_CKDI=  000000     |     CLK_CKDI=  000001     |     CLK_CKDI=  000002 
    CLK_CKDI=  000003     |     CLK_CKDI=  000004     |     CLK_CMSR=  0050C3 
    CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1     |     CLK_ECKR=  000000 
    CLK_ECKR=  000001     |     CLK_HSIT=  0050CC     |     CLK_ICKR=  0050C0 
    CLK_ICKR=  000002     |     CLK_ICKR=  000000     |     CLK_ICKR=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
Hexadecimal [24-Bits]

Symbol Table

    CLK_ICKR=  000003     |     CLK_ICKR=  000004     |     CLK_ICKR=  000005 
    CLK_PCKE=  0050C7     |     CLK_PCKE=  000000     |     CLK_PCKE=  000001 
    CLK_PCKE=  000007     |     CLK_PCKE=  000005     |     CLK_PCKE=  000006 
    CLK_PCKE=  000004     |     CLK_PCKE=  000002     |     CLK_PCKE=  000003 
    CLK_PCKE=  0050CA     |     CLK_PCKE=  000003     |     CLK_PCKE=  000002 
    CLK_PCKE=  000007     |     CLK_SWCR=  0050C5     |     CLK_SWCR=  000000 
    CLK_SWCR=  000001     |     CLK_SWCR=  000002     |     CLK_SWCR=  000003 
    CLK_SWIM=  0050CD     |     CLK_SWR =  0050C4     |     CLK_SWR_=  0000B4 
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |     CMD_END =  000002 
    CNT     =  000006     |     CNTR    =  000004     |     CNT_LO  =  000004 
    CODE_ADD=  000001     |     COLON   =  00003A     |     COMMA   =  00002C 
    COUNT   =  000003     |     CPOS    =  000003     |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |     CR      =  00000D     |     CTRL_A  =  000001 
    CTRL_B  =  000002     |     CTRL_C  =  000003     |     CTRL_D  =  000004 
    CTRL_E  =  000005     |     CTRL_F  =  000006     |     CTRL_G  =  000007 
    CTRL_H  =  000008     |     CTRL_I  =  000009     |     CTRL_J  =  00000A 
    CTRL_K  =  00000B     |     CTRL_L  =  00000C     |     CTRL_M  =  00000D 
    CTRL_N  =  00000E     |     CTRL_O  =  00000F     |     CTRL_P  =  000010 
    CTRL_Q  =  000011     |     CTRL_R  =  000012     |     CTRL_S  =  000013 
    CTRL_T  =  000014     |     CTRL_U  =  000015     |     CTRL_V  =  000016 
    CTRL_W  =  000017     |     CTRL_X  =  000018     |     CTRL_Y  =  000019 
    CTRL_Z  =  00001A     |     CTXT_SIZ=  000004     |     CTX_BPTR=  000001 
    CTX_COUN=  000004     |     CTX_IN  =  000003     |     CURR    =  000002 
    CVAR    =  000009     |     CX_BPTR =  000001     |     CX_CNT  =  000004 
    CX_IN   =  000003     |     DC1     =  000011     |     DC2     =  000012 
    DC3     =  000013     |     DC4     =  000014     |     DEBUG   =  000000 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |     DEST    =  000001 
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |     DISCARD =  000004 
    DIVISOR =  000001     |     DIVSOR  =  000001     |     DLE     =  000010 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |     DOLP_ADR=  000003 
    DOLP_INW=  000005     |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_S=  000800     |     EM      =  000019     |     ENQ     =  000005 
    EOF     =  0000FF     |     EOT     =  000004     |   4 ERASED     0026D5 R
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_NO_P=  000012 
    ERR_OVER=  000010     |     ERR_RD_O=  000011     |     ERR_RUN_=  000006 
    ERR_SYNT=  000002     |     ESC     =  00001B     |     ETB     =  000017 
    ETX     =  000003     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
    FBREAK  =  000004     |     FCOMP   =  000005     |     FF      =  00000C 
    FHSE    =  7A1200     |     FHSI    =  F42400     |     FIRST   =  000001 
    FIRST_DA=  000006     |     FLASH_BA=  008000     |     FLASH_CR=  00505A 
    FLASH_CR=  000002     |     FLASH_CR=  000000     |     FLASH_CR=  000003 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_CR=  000001     |     FLASH_CR=  00505B     |     FLASH_CR=  000005 
    FLASH_CR=  000004     |     FLASH_CR=  000007     |     FLASH_CR=  000000 
    FLASH_CR=  000006     |     FLASH_DU=  005064     |     FLASH_DU=  0000AE 
    FLASH_DU=  000056     |     FLASH_EN=  027FFF     |     FLASH_FP=  00505D 
    FLASH_FP=  000000     |     FLASH_FP=  000001     |     FLASH_FP=  000002 
    FLASH_FP=  000003     |     FLASH_FP=  000004     |     FLASH_FP=  000005 
    FLASH_IA=  00505F     |     FLASH_IA=  000003     |     FLASH_IA=  000002 
    FLASH_IA=  000006     |     FLASH_IA=  000001     |     FLASH_IA=  000000 
  4 FLASH_ME   001BE1 R   |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |     FLN_REJE=  000006 
    FLOOP   =  000002     |     FLSI    =  01F400     |     FRUN    =  000000 
    FS      =  00001C     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_AND   =  000080     |     F_CFUNC =  000020 
    F_CMD   =  000000     |     F_CONST =  000030     |     F_IFUNC =  000010 
    F_NOT   =  000070     |     F_OR    =  000090     |     F_XOR   =  0000A0 
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |     GS      =  00001D     |     HOME    =  000082 
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
    I2C_WRIT=  000000     |     IN      =  000005     |     INCR    =  000001 
    INP     =  000000     |     INPUT_DI=  000000     |     INPUT_EI=  000001 
    INPUT_FL=  000000     |     INPUT_PU=  000001     |     INT24   =  000005 
    INT_ADC2=  000016     |     INT_AUAR=  000012     |     INT_AWU =  000001 
    INT_CAN_=  000008     |     INT_CAN_=  000009     |     INT_CLK =  000002 
    INT_EXTI=  000003     |     INT_EXTI=  000004     |     INT_EXTI=  000005 
    INT_EXTI=  000006     |     INT_EXTI=  000007     |     INT_FLAS=  000018 
    INT_I2C =  000013     |     INT_SPI =  00000A     |     INT_TIM1=  00000C 
    INT_TIM1=  00000B     |     INT_TIM2=  00000E     |     INT_TIM2=  00000D 
    INT_TIM3=  000010     |     INT_TIM3=  00000F     |     INT_TIM4=  000017 
    INT_TLI =  000000     |     INT_UART=  000011     |     INT_UART=  000015 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 240.
Hexadecimal [24-Bits]

Symbol Table

    INT_UART=  000014     |     INT_VECT=  008060     |     INT_VECT=  00800C 
    INT_VECT=  008028     |     INT_VECT=  00802C     |     INT_VECT=  008010 
    INT_VECT=  008014     |     INT_VECT=  008018     |     INT_VECT=  00801C 
    INT_VECT=  008020     |     INT_VECT=  008024     |     INT_VECT=  008068 
    INT_VECT=  008054     |     INT_VECT=  008000     |     INT_VECT=  008030 
    INT_VECT=  008038     |     INT_VECT=  008034     |     INT_VECT=  008040 
    INT_VECT=  00803C     |     INT_VECT=  008048     |     INT_VECT=  008044 
    INT_VECT=  008064     |     INT_VECT=  008008     |     INT_VECT=  008004 
    INT_VECT=  008050     |     INT_VECT=  00804C     |     INT_VECT=  00805C 
    INT_VECT=  008058     |     INW     =  00000B     |     IPOS    =  000001 
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |     KCHAR   =  000002 
    KEY_END =  000083     |     KW_TYPE_=  0000F0     |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000002     |     LF      =  00000A 
    LIMIT   =  000005     |     LINENO  =  000005     |   4 LINES_RE   001CAF R
  4 LINK    =  0033AD R   |     LL      =  000001     |     LLEN    =  000002 
    LL_HB   =  000001     |     LN_PTR  =  000005     |     MAJOR   =  000002 
    MASK    =  000002     |     MAX_LINE=  007FFF     |     MINOR   =  000000 
    MULOP   =  000001     |     N1      =  000005     |     NAFR    =  004804 
    NAK     =  000015     |     NAMEPTR =  000001     |     NAME_MAX=  00000F 
    NCLKOPT =  004808     |     NEG     =  000001     |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NLEN    =  000005     |     NLEN_MAS=  00000F 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |     NOT_OP  =  000001 
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  4 NonHandl   000000 R   |     ONOFF   =  000003     |     OP      =  000002 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVRWR   =  000004     |     PA      =  000000     |     PAD_SIZE=  000080 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
Hexadecimal [24-Bits]

Symbol Table

    PG_SIZE =  000001     |     PH      =  000023     |     PH_BASE =  005023 
    PH_CR1  =  005026     |     PH_CR2  =  005027     |     PH_DDR  =  005025 
    PH_IDR  =  005024     |     PH_ODR  =  005023     |     PI      =  000028 
    PINNO   =  000001     |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |     PNAME   =  000003 
    PREV    =  000001     |     PRG_SIZE=  000003     |     PROD    =  000001 
    PROD_SIG=  000004     |   4 PROG_ADD   001BB7 R   |   4 PROG_SIZ   001BC9 R
    PSTR    =  000003     |     QSIGN   =  000005     |     RAM_BASE=  000000 
    RAM_END =  0017FF     |   4 RAM_MEM    001BF2 R   |     RAM_SIZE=  001800 
    REC_LEN =  000003     |     REC_LEN_=  00001F     |     REC_XTRA=  000005 
    RELOP   =  000001     |     RETL1   =  000001     |     RET_ADDR=  000001 
    RET_BPTR=  000003     |     RET_INW =  000005     |     RONLY   =  000005 
    ROP     =  004800     |     RS      =  00001E     |     RSIGN   =  000006 
    RST_SR  =  0050B3     |     RXCHAR  =  000001     |     RX_QUEUE=  000008 
    SEMIC   =  00003B     |     SEMICOL =  000001     |     SEPARATE=  000000 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
    SI      =  00000F     |     SIGN    =  000001     |   4 SIGNATUR   0026D3 R
    SKIP    =  000005     |     SLEN    =  000002     |     SO      =  00000E 
    SOH     =  000001     |     SPACE   =  000020     |     SPI_CR1 =  005200 
    SPI_CR1_=  000003     |     SPI_CR1_=  000000     |     SPI_CR1_=  000001 
    SPI_CR1_=  000007     |     SPI_CR1_=  000002     |     SPI_CR1_=  000006 
    SPI_CR2 =  005201     |     SPI_CR2_=  000007     |     SPI_CR2_=  000006 
    SPI_CR2_=  000005     |     SPI_CR2_=  000004     |     SPI_CR2_=  000002 
    SPI_CR2_=  000000     |     SPI_CR2_=  000001     |     SPI_CRCP=  005205 
    SPI_CS_B=  000005     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_SR_B=  000007 
    SPI_SR_C=  000004     |     SPI_SR_M=  000005     |     SPI_SR_O=  000006 
    SPI_SR_R=  000000     |     SPI_SR_T=  000001     |     SPI_SR_W=  000003 
    SPI_TXCR=  005207     |     SRC     =  000003     |     STACK_EM=  0017FF 
    STACK_SI=  00008C     |     STR     =  000002     |   4 STR_BYTE   001BDA R
    STX     =  000002     |     SUB     =  00001A     |     SUP     =  000084 
    SWIM_CSR=  007F80     |     SYN     =  000016     |   4 SysCall    000012 R
    TAB     =  000009     |     TAB_WIDT=  000004     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM1_SR1=  000006     |     TIM1_SR1=  000000     |     TIM1_SR2=  005256 
    TIM1_SR2=  000001     |     TIM1_SR2=  000002     |     TIM1_SR2=  000003 
    TIM1_SR2=  000004     |     TIM2_ARR=  00530D     |     TIM2_ARR=  00530E 
    TIM2_CCE=  005308     |     TIM2_CCE=  000000     |     TIM2_CCE=  000001 
    TIM2_CCE=  000004     |     TIM2_CCE=  000005     |     TIM2_CCE=  005309 
    TIM2_CCM=  005305     |     TIM2_CCM=  005306     |     TIM2_CCM=  005307 
    TIM2_CCM=  000000     |     TIM2_CCM=  000004     |     TIM2_CCM=  000003 
    TIM2_CCR=  00530F     |     TIM2_CCR=  005310     |     TIM2_CCR=  005311 
    TIM2_CCR=  005312     |     TIM2_CCR=  005313     |     TIM2_CCR=  005314 
    TIM2_CLK=  00F424     |     TIM2_CNT=  00530A     |     TIM2_CNT=  00530B 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 243.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_PSC=  000006     |     TIM4_PSC=  000003     |     TIM4_PSC=  000000 
    TIM4_PSC=  000001     |     TIM4_PSC=  000002     |     TIM4_SR =  005342 
    TIM4_SR_=  000000     |     TIM_CR1_=  000007     |     TIM_CR1_=  000000 
    TIM_CR1_=  000006     |     TIM_CR1_=  000005     |     TIM_CR1_=  000004 
    TIM_CR1_=  000003     |     TIM_CR1_=  000001     |     TIM_CR1_=  000002 
    TK_AND  =  000088     |     TK_ARRAY=  000005     |     TK_CFUNC=  000082 
    TK_CHAR =  000004     |     TK_CMD  =  000080     |     TK_COLON=  000009 
    TK_COMMA=  000008     |     TK_CONST=  000083     |     TK_DIV  =  000021 
    TK_EQUAL=  000032     |     TK_FLOAT=  000086     |     TK_GE   =  000033 
    TK_GRP_A=  000010     |     TK_GRP_M=  000030     |     TK_GRP_M=  000000 
    TK_GRP_M=  000020     |     TK_GRP_R=  000030     |     TK_GT   =  000031 
    TK_IFUNC=  000081     |     TK_INTGR=  000084     |     TK_LABEL=  000003 
    TK_LE   =  000036     |     TK_LPARE=  000006     |     TK_LT   =  000034 
    TK_MINUS=  000011     |     TK_MOD  =  000022     |     TK_MULT =  000020 
    TK_NE   =  000035     |     TK_NONE =  000000     |     TK_NOT  =  000087 
    TK_OR   =  000089     |     TK_PLUS =  000010     |     TK_QSTR =  000002 
    TK_RPARE=  000007     |     TK_SEMIC=  00000A     |     TK_VAR  =  000085 
    TK_XOR  =  00008A     |     TOWRITE =  000005     |   4 Timer4Up   000013 R
    U8      =  000001     |     UART1   =  000000     |     UART1_BA=  005230 
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
    UBC     =  004801     |   4 UBTN_Han   00005A R   |     US      =  00001F 
  4 USER_ABO   000062 R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |   4 Uart1RxH   0005A2 R   |   4 UserButt   000036 R
    VAR_NAME=  000001     |     VSIZE   =  00000C     |     VT      =  00000B 
    WCNT    =  000003     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 244.
Hexadecimal [24-Bits]

Symbol Table

    WIDTH   =  000001     |     WLEN    =  000001     |     WLKPTR  =  000001 
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XFIRST  =  000001 
    XMASK   =  000001     |     XOFF    =  000013     |     XON     =  000011 
    XSAVE   =  000002     |     XSTACK_E=  001773     |     XSTACK_S=  000014 
    XTEMP   =  000001     |     YSAVE   =  000007     |     YTEMP   =  000005 
  4 abs        0028EE R   |   4 abs24      0001F3 R   |   5 acc16      00000D GR
  5 acc24      00000C GR  |   5 acc32      00000B GR  |   5 acc8       00000E GR
  4 accept_c   0008ED R   |   4 add24      00017E R   |   4 add_char   001065 R
  4 add_spac   000E6B R   |   4 analog_r   0023D7 R   |   4 and_cond   0018FB R
  4 and_fact   0018CB R   |   4 app        003404 R   |   4 app_sign   003400 R
  4 app_size   003402 R   |   4 app_spac   003400 GR  |   4 arduino_   0029DB R
  4 arg_list   0016F4 R   |   5 array_si   000020 R   |   4 ascii      0027C9 R
  4 at_tst     000CDD R   |   4 atoi24     001600 GR  |   4 atoi_exi   00166F R
  4 awu        002895 R   |   4 awu02      0028A8 R   |   5 base       00000A GR
  5 basicptr   000004 GR  |   4 beep       00234E R   |   4 beep_1kh   002321 GR
  4 bin_exit   000B3C R   |   4 bit_rese   001EDD R   |   4 bit_set    001EBB R
  4 bit_test   001F22 R   |   4 bit_togg   001F00 R   |   4 bitmask    002B95 R
  4 bkslsh_t   000C8A R   |   4 bksp       00068C R   |   2 block_bu   0016B8 GR
  4 block_er   00048B R   |   4 break_po   0024C2 R   |   4 bye        002861 R
  5 chain_le   000033 R   |   4 clear_au   0005D9 R   |   4 clear_ba   0011C9 R
  4 clear_bl   0025D3 R   |   4 clear_va   001129 R   |   4 clock_in   00007D R
  4 cmd_auto   002EBA R   |   4 cmd_chai   002F4D R   |   4 cmd_cons   001AD2 R
  4 cmd_dim    001ADF R   |   4 cmd_dim1   001AE2 R   |   4 cmd_dim2   001AE8 R
  4 cmd_dir    0026FA R   |   4 cmd_edit   001CD8 R   |   4 cmd_end    0022C8 R
  4 cmd_eras   002540 R   |   4 cmd_get    0022F4 R   |   4 cmd_line   00143F R
  4 cmd_line   0016CC R   |   4 cmd_list   001C01 R   |   4 cmd_name   001085 R
  4 cmd_on     002157 R   |   4 cmd_prin   001D3D R   |   4 cmd_run    002238 R
  4 cmd_save   002635 R   |   4 cmd_size   0019D4 R   |   4 cold_sta   0000B5 R
  4 colon_ts   000CB1 R   |   4 comma_ts   000CBC R   |   4 comp_msg   00139C R
  4 compile    000DD7 GR  |   4 conditio   00194D R   |   4 const_cr   002C38 R
  4 const_cr   002C3D R   |   4 const_dd   002C33 R   |   4 const_ee   002C4C R
  4 const_id   002C2E R   |   4 const_in   002C47 R   |   4 const_od   002C29 R
  4 const_ou   002C42 R   |   4 const_po   002C01 R   |   4 const_po   002C06 R
  4 const_po   002C0B R   |   4 const_po   002C10 R   |   4 const_po   002C15 R
  4 const_po   002C1A R   |   4 const_po   002C1F R   |   4 const_po   002C24 R
  4 convert_   000AA8 R   |   4 convert_   000650 R   |   4 copy_com   000D12 R
  5 count      000002 GR  |   4 cp24       0001B8 R   |   4 cp24_ax    0001EA R
  4 cp_loop    00168F R   |   4 cpl24      0001FA R   |   4 cpy_cmd_   000E53 R
  4 cpy_quot   000E9C R   |   4 cs_high    002DD4 R   |   4 dash_tst   000CD2 R
  4 data       002C51 R   |   4 data_err   002CCD R   |   5 data_len   000009 R
  5 data_ofs   000008 R   |   5 data_ptr   000006 R   |   4 dec_base   0019C6 R
  4 decomp_l   000F29 R   |   4 decompil   000EEC GR  |   4 del_line   000996 R
  4 delete_l   000779 R   |   4 delete_n   00069C R   |   4 delete_u   00073E R
  4 digital_   002413 R   |   4 digital_   00244A R   |   4 div24      000307 R
  4 divu24_8   0002E9 R   |   4 do_loop    002BBB R   |   4 do_progr   00047E R
  4 dup24      00016F R   |   5 dvar_bgn   00002F GR  |   5 dvar_end   000031 GR
  4 enable_i   002B25 R   |   4 end_at_l   001C5A R   |   4 eql_tst    000D5D R
  4 equal      001078 R   |   4 erase_ex   0004AF R   |   4 erase_fl   0004A5 R
  4 erase_he   00261B R   |   4 erase_pr   0024EB R   |   4 err_bad_   0012C5 R
  4 err_buf_   00133B R   |   4 err_cmd_   001289 R   |   4 err_div0   00124E R
  4 err_dupl   0012A3 R   |   4 err_math   001235 R   |   4 err_mem_   001210 R
  4 err_msg    0011EA R   |   4 err_no_a   0012D1 R   |   4 err_no_d   001304 R
  4 err_no_f   001328 R   |   4 err_no_l   00125D R   |   4 err_no_p   001314 R
  4 err_not_   0012B4 R   |   4 err_not_   00136E R   |   4 err_over   001348 R
  4 err_read   001352 R   |   4 err_run_   001273 R   |   4 err_synt   001227 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 245.
Hexadecimal [24-Bits]

Symbol Table

  4 escaped    000ABD GR  |   4 expect     0016E2 R   |   4 expressi   001834 R
  4 factor     00173E R   |   5 farptr     000018 R   |   4 fcpu       00295D R
  4 fill_wri   0025C3 R   |   4 final_te   0008E6 R   |   5 flags      000022 GR
  4 for        001FB8 R   |   4 free       0019CB R   |   5 free_eep   000023 R
  7 free_ram   000090 R   |   4 func_arg   0016EF R   |   4 func_cha   0027B2 R
  4 func_eef   001A60 R   |   4 ge         00107A R   |   4 get_addr   001541 R
  4 get_arra   001710 R   |   4 get_char   00155B R   |   4 get_esca   00065C R
  4 get_int2   00154B R   |   4 get_targ   0020E5 R   |   4 get_targ   0020F3 R
  4 get_tick   0028E7 R   |   4 get_toke   000C23 GR  |   4 get_valu   001A4F R
  4 getc       000635 GR  |   4 gosub      0021F5 R   |   4 gosub_1    0021F8 R
  4 gosub_2    0021FE R   |   4 goto       0021E2 R   |   4 goto_1     0021E5 R
  4 gt         001076 R   |   4 gt_tst     000D68 R   |   4 hex_base   0019C1 R
  4 if         001F9B R   |   5 in         000001 GR  |   5 in.saved   000003 GR
  5 in.w       000000 GR  |   4 incr_far   000586 R   |   4 input_ex   001E73 R
  4 input_lo   001DDD R   |   4 input_va   001DD9 R   |   4 insert_c   0006FB R
  4 insert_l   000A02 R   |   4 interp_l   001483 R   |   4 interpre   00145B R
  4 is_alnum   000B6F GR  |   4 is_alpha   000B55 GR  |   4 is_data_   002C57 R
  4 is_digit   000B66 GR  |   4 is_erase   0026D7 R   |   4 is_minus   001C20 R
  4 is_progr   002227 R   |   4 is_symbo   000B78 R   |   4 itoa       001596 GR
  4 itoa_loo   0015B8 R   |   4 jp_to_ta   0021E8 R   |   4 key        002808 R
  4 kword_di   0033AB GR  |   4 kword_en   002FD5 R   |   4 le         00107F R
  4 let        001A0C GR  |   4 let_arra   001A1A R   |   4 let_dvar   0014BC R
  4 let_eval   001A22 R   |   4 let_var    001A1F R   |   4 lines_sk   001C34 R
  4 list_exi   001C93 R   |   4 list_loo   001C71 R   |   4 log2       002B68 R
  4 look_tar   002116 R   |   4 loop_bac   0020C8 R   |   5 loop_dep   00001F R
  4 loop_don   0020DD R   |   4 lshift     002905 R   |   4 lt         00107D R
  4 lt_tst     000D91 R   |   4 mod24      0003A1 R   |   4 move       0010E5 GR
  4 move_dow   001104 R   |   4 move_era   00040D R   |   4 move_exi   001125 R
  4 move_lef   0006D3 R   |   4 move_loo   001109 R   |   4 move_prg   00044D R
  4 move_rig   0006E1 R   |   4 move_up    0010F6 R   |   4 mul24      000279 R
  4 mul_char   001067 R   |   4 mulu24_8   00023A R   |   4 nbr_tst    000C56 R
  4 ne         001082 R   |   4 neg24      000203 R   |   4 neg_acc2   00021D R
  4 neg_ax     000215 R   |   4 new        0024E0 R   |   4 next       002070 R
  4 next_lin   001463 R   |   4 next_tok   001519 GR  |   4 no_match   0016A1 R
  4 open_gap   0009CB R   |   4 other      000DBA R   |   4 overwrit   000912 R
  2 pad        0016B8 GR  |   4 pad_ref    002DD9 R   |   4 parse_bi   000B1A R
  4 parse_in   000AC5 R   |   4 parse_ke   000BA3 R   |   4 parse_qu   000A70 R
  4 parse_sy   000B8B R   |   4 pause      002875 R   |   4 pause02    002888 R
  4 peek       001F7A R   |   4 pin_mode   00296C R   |   4 plus_tst   000D31 R
  4 poke       001F59 R   |   4 power_ad   002387 R   |   4 prcnt_ts   000D52 R
  4 print_he   000949 GR  |   4 print_to   001583 R   |   4 prog_siz   001B70 R
  4 program_   001B78 R   |   4 program_   000427 R   |   4 program_   00044D R
  4 prt_acc2   001578 R   |   4 prt_basi   001D19 R   |   4 prt_i16    001561 R
  4 prt_loop   001D41 R   |   5 ptr16      000019 GR  |   5 ptr8       00001A R
  4 putc       000625 GR  |   4 puts       000682 GR  |   4 qgetc      00062E GR
  4 qkey       00280C GR  |   4 qmark_ts   000CE8 R   |   4 qsign      0025B8 R
  4 random     0029FB R   |   4 read       002CD2 R   |   4 read01     002CDA R
  4 readln     000787 GR  |   4 readln_l   000796 R   |   4 readln_q   00092F R
  4 refresh_   002B63 R   |   4 relation   00186C R   |   4 relop_st   00106A R
  4 remark     001E78 GR  |   4 reset_se   001D3F R   |   4 rest_con   001DC9 R
  4 restore    002C65 R   |   4 return     002211 R   |   4 right_al   000E81 GR
  4 row_alig   00056B R   |   4 row_eras   0003E0 R   |   4 row_eras   00040D R
  4 rparnt_t   000CA6 R   |   4 rshift     002931 R   |   7 rsign      00008C R
  7 rsize      00008E R   |   4 rt_msg     00138A R   |   4 run_app    00012A R
  4 run_it     002295 R   |   4 run_it_0   002297 R   |   4 runtime_   0016D7 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 246.
Hexadecimal [24-Bits]

Symbol Table

  5 rx1_head   00002D R   |   5 rx1_queu   000025 R   |   5 rx1_tail   00002E R
  4 save_con   001DB9 R   |   4 scan_blo   000594 R   |   4 search_d   001681 GR
  4 search_e   0016C9 R   |   4 search_f   0025E7 R   |   4 search_l   00096B GR
  4 search_l   00097A R   |   4 search_n   001A89 R   |   4 search_n   001685 R
  4 search_p   002F13 R   |   5 seedx      000014 R   |   5 seedy      000016 R
  4 select_p   0029CB R   |   4 semic_ts   000CC7 R   |   4 send_esc   0006AA R
  4 send_par   0006B5 R   |   4 set_data   002C9E R   |   4 set_time   002B03 R
  4 single_c   00105F R   |   4 skip       000C10 R   |   4 skip_str   001532 R
  4 skip_to_   0026E2 R   |   4 slash_ts   000D47 R   |   4 sleep      00286A R
  4 software   001138 R   |   4 spaces     0006EF GR  |   4 spi_clea   002D6E R
  4 spi_disa   002D56 R   |   4 spi_enab   002D23 R   |   4 spi_rcv_   002D90 R
  4 spi_read   002DBB R   |   4 spi_sele   002DC2 R   |   4 spi_send   002D7A R
  4 spi_writ   002D9B R   |   2 stack_fu   001774 GR  |   2 stack_un   001800 R
  4 star_tst   000D3C R   |   4 start_fr   001C2F R   |   4 step       00202E R
  4 stop       002495 R   |   4 store_lo   00205D R   |   4 str_matc   0016AE R
  4 str_tst    000C46 R   |   4 strcmp     0010C4 R   |   4 strcpy     0010D5 GR
  4 strlen     0010B9 GR  |   4 sub24      00019B R   |   4 symb_loo   000B8C R
  4 syntax_e   0013BD GR  |   4 system_i   00117E R   |   4 tb_error   0013BF GR
  4 term       0017F1 R   |   4 term01     0017F9 R   |   4 term_exi   001831 R
  2 tib        001668 GR  |   4 tick_tst   000D00 R   |   5 ticks      00000F R
  4 timeout    002B1A R   |   5 timer      000012 GR  |   4 timer2_i   000093 R
  4 timer4_i   0000A0 R   |   4 tk_id      0013AD R   |   4 to         001FE8 R
  4 to_eepro   000476 R   |   4 to_flash   00047B R   |   4 to_hex_c   000960 GR
  4 to_upper   0015F4 GR  |   4 token_ch   000DD0 R   |   4 token_ex   000DD4 R
  4 tone       00232C R   |   4 try_next   002CAB R   |   5 txtbgn     00001B GR
  5 txtend     00001D GR  |   4 uart1_ge   000635 GR  |   4 uart1_in   0005E0 R
  4 uart1_pu   000625 GR  |   4 uart1_qg   00062E GR  |   4 uart1_se   0005F0 R
  4 ubound     001A01 R   |   4 uflash     002819 R   |   4 unlock_e   0003AA R
  4 unlock_f   0003C5 R   |   4 until      002BCE R   |   4 user_int   000049 R
  4 usr        00283B R   |   4 var_name   000EE2 GR  |   5 vars       000034 GR
  4 wait       001E7E R   |   4 warm_ini   0011AB R   |   4 warm_sta   00143C R
  4 words      002A96 R   |   4 words_co   002AED R   |   4 write      002749 R
  4 write_bl   000530 GR  |   4 write_bu   000467 R   |   4 write_by   0004B1 R
  4 write_ee   0004ED R   |   4 write_ex   000526 R   |   4 write_fl   0004D7 R
  4 write_nb   000555 R   |   4 xalloc     002DEC R   |   4 xdrop      002E22 R
  4 xpick      002EA0 R   |   4 xpop       002DE2 R   |   4 xpush      002DDE R
  4 xput       002E6D R   |   4 xstack_b   002E4F R   |   2 xstack_f   001738 GR
  2 xstack_u   001774 GR

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 247.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 SSEG       size      0   flags    8
   2 SSEG0      size    198   flags    8
   3 HOME       size     80   flags    0
   4 CODE       size   3404   flags    0
   5 DATA       size     82   flags    0
   6 BTXT       size      0   flags    8
   7 BTXT1      size      4   flags    8

