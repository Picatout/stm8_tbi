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
                                     59 
                                     60 ;--------------------------------------
                                     61 ;   constantes related to Arduino 
                                     62 ;   API mapping 
                                     63 ;-------------------------------------
                           000000    64         INP=0
                           000001    65         OUTP=1 
                                     66 
                                     67 ;--------------------------------------
                                     68 ;       token attribute
                                     69 ;--------------------------------------
                                     70         ; bits 4:5 identify token group 
                                     71         ; 0x0n -> miscelinous 
                                     72         ; 0x1n -> +|- operators 
                                     73         ; 0x2n -> *|/|% operators
                                     74         ; 0x3n -> relational operators 
                           000080    75         TK_CMD=128      ; BASIC command   
                           000081    76         TK_IFUNC=129    ; BASIC integer function
                           000082    77         TK_CFUNC=130    ; BASIC character function
                           000083    78         TK_CONST=131    ; BASIC constant 
                           000084    79         TK_INTGR=132    ; 16 bits integer 
                           000085    80         TK_VAR=133
                           000086    81         TK_FLOAT=134    ; float32 
                           000087    82         TK_NOT=135
                           000088    83         TK_AND=136      ;
                           000089    84         TK_OR=137       ;
                           00008A    85         TK_XOR=138      ; 
                           000000    86         TK_NONE=0       ; not a token 
                           000002    87         TK_QSTR=2       ; quoted string  
                           000003    88         TK_LABEL=3      ; used for defined, constants, variables
                           000004    89         TK_CHAR=4       ; ASCII character 
                           000005    90         TK_ARRAY=5      ; array variable '@' 
                           000006    91         TK_LPAREN=6     ; left parenthesis '('
                           000007    92         TK_RPAREN=7     ; right parenthesis ')'
                           000008    93         TK_COMMA=8      ; item separator ',' 
                           000009    94         TK_COLON=9      ; command separator ':' 
                           00000A    95         TK_SEMIC=10     ; used in PRINT command.  ';' 
                                     96 
                           000010    97         TK_PLUS=0x10    ; addition operator '+'
                           000011    98         TK_MINUS=0x11   ; subtraction operator '-'
                           000020    99         TK_MULT=0x20    ; multiplication operator '*'
                           000021   100         TK_DIV=0x21     ; division operator '/'
                           000022   101         TK_MOD=0x22     ; modulo operator '%'
                                    102 
                                    103         ; don't change these token values 
                                    104         ; values chosen to be used as a mask.
                                    105         ; bit 7   1 for dictionary words else 0 
                                    106         ; bits 6  always 0 
                                    107         ; bits 5:4 identify group 
                                    108         ; bits 3:0 token identifier inside group  
                           000031   109         TK_GT=0x31      ; relation operator '>'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                           000032   110         TK_EQUAL=0x32   ; assignment or relation operator '='
                           000033   111         TK_GE=0x33      ; relation operator '>='
                           000034   112         TK_LT=0x34      ; relation operator '<'
                           000036   113         TK_LE=0x36      ; relation operator '<='
                           000035   114         TK_NE=0x35      ; relation operator '<>' not equal 
                                    115         ; token groups 
                           000030   116         TK_GRP_MASK=0x30 ; groups bits selector 
                           000000   117         TK_GRP_MISC=0x00 ; miscelinous group 
                           000010   118         TK_GRP_ADD=0x10  ; additive operators
                           000020   119         TK_GRP_MULT=0x20 ; multiplicative operators
                           000030   120         TK_GRP_RELOP=0x30 ;relational operators. 
                           000002   121         CMD_END=2 
                                    122 
                                    123 ;--------------------------------------
                                    124 ;   error codes 
                                    125 ;--------------------------------------
                           000000   126     ERR_NONE=0
                           000001   127     ERR_MEM_FULL=1 
                           000002   128     ERR_SYNTAX=2
                           000003   129     ERR_MATH_OVF=3
                           000004   130     ERR_DIV0=4 
                           000005   131     ERR_NO_LINE=5
                           000006   132     ERR_RUN_ONLY=6
                           000007   133     ERR_CMD_ONLY=7
                           000008   134     ERR_DUPLICATE=8
                           000009   135     ERR_NOT_FILE=9
                           00000A   136     ERR_BAD_VALUE=10
                           00000B   137     ERR_NO_ACCESS=11
                           00000C   138     ERR_NO_DATA=12 
                           00000D   139     ERR_NO_PROG=13
                           00000E   140     ERR_NO_FSPACE=14
                           00000F   141     ERR_BUF_FULL=15
                           000010   142     ERR_OVERFLOW=16 
                           000011   143     ERR_RD_ONLY=17
                           000012   144     ERR_NO_PROGRAM=18
                                    145 
                                    146 ;--------------------------------------
                                    147 ;   assembler flags 
                                    148 ;-------------------------------------
                                    149 ;    MATH_OVF=0 ; if 1 the stop on math overflow 
                                    150 
                                    151      .macro _usec_dly n 
                                    152     ldw x,#(16*n-2)/4
                                    153     decw x
                                    154     nop 
                                    155     jrne .-4
                                    156     .endm 
                                    157     
                                    158     ; load X register with 
                                    159     ; entry point of dictionary
                                    160     ; before calling 'search_dict'
                                    161     .macro _ldx_dict dict_name
                                    162     ldw x,#dict_name+2
                                    163     .endm 
                                    164 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                    165     ; reset BASIC pointer
                                    166     ; to beginning of last token
                                    167     ; extracted except if it was end of line 
                                    168     .macro _unget_token 
                                    169      mov in,in.saved  
                                    170     .endm
                                    171 
                                    172 
                                    173     ; extract code address for 
                                    174     ; TK_CMD|TK_FUNC|TK_IFUNC|TK_CFUNC 
                                    175     .macro _get_code_addr
                                    176         ldw x,(x)
                                    177         inc in 
                                    178         inc in 
                                    179     .endm 
                                    180 
                                    181 
                                    182 
                                    183 ;---------------------------------------
                                    184 ;    xtack manipulation macros 
                                    185 ;    Y is used as xstack pointer  
                                    186 ;----------------------------------------
                                    187     ; pop in A:X from XSTACK 
                                    188     .macro _xpop 
                                    189     ld a,(y)
                                    190     ldw x,y 
                                    191     ldw x,(1,x)
                                    192     addw y,#CELL_SIZE 
                                    193     .endm 
                                    194 
                                    195     ; push A:X  to XSTACK 
                                    196     .macro _xpush 
                                    197     subw y,#CELL_SIZE
                                    198     ld (y),a 
                                    199     ldw (1,y),x 
                                    200     .endm 
                                    201 
                                    202     ; drop from XSTACK 
                                    203     .macro _xdrop 
                                    204     addw y,#CELL_SIZE 
                                    205     .endm 
                                    206 
                                    207     ; @T fetch top xstack 
                                    208     .macro _at_top
                                    209     ld a,(y)
                                    210     ldw x,y 
                                    211     ldw x,(1,x)
                                    212     .endm 
                                    213 
                                    214     ; @N  fetch next on xstack 
                                    215     .macro _at_next 
                                    216     ld a,(3,y)
                                    217     ldw x,y 
                                    218     ldw x,(4,x)
                                    219     .endm 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                    220 
                                    221     ; !T put on top of xtack 
                                    222     .macro _store_top 
                                    223     ld (y),a 
                                    224     ldw (1,y),x     
                                    225     .endm 
                                    226 
                                    227     ; !N put next on xstack 
                                    228     .macro _store_next 
                                    229     ld (3,y),a 
                                    230     ldw (4,y),x 
                                    231     .endm 
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
      0080DF CC 94 B4         [ 2]  168 5$:	jp warm_start
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
      008190 CD 9A D8         [ 4]  272 	call func_eefree ; eeprom free address 
      008193 CD 9A 79         [ 4]  273 	call ubound ; @() size 
      008196 CD 92 41         [ 4]  274 	call clear_basic
      008199 CD A3 95         [ 4]  275 	call beep_1khz  ; 
      00819C CD 91 F6         [ 4]  276 	call system_information ; display system information 
      00819F                        277 2$:	
                                    278 ; check for autorun application
      00819F CE 40 00         [ 2]  279 	ldw x,EEPROM_BASE 
      0081A2 C3 AF 85         [ 2]  280 	cpw x,AR_SIGN 
      0081A5 27 03            [ 1]  281 	jreq run_app
      0081A7 CC 94 B4         [ 2]  282 	jp warm_start 
      0081AA                        283 run_app:
      0081AA 4F               [ 1]  284 	clr a 
      0081AB CE 40 02         [ 2]  285 	ldw x,EEPROM_BASE+2
      0081AE CD A2 9B         [ 4]  286 	call is_program_addr 
      0081B1 27 03            [ 1]  287 	jreq 1$
      0081B3 CC 94 B4         [ 2]  288 	jp warm_start ; no autorun application.
      0081B6                        289 1$:	
                                    290 ; run application in FLASH|EEPROM 
      0081B6 90 CE 17 73      [ 2]  291 	ldw y,XSTACK_EMPTY
      0081BA CD 92 23         [ 4]  292 	call warm_init
      0081BD CE 40 02         [ 2]  293 	ldw x,EEPROM_BASE+2 
      0081C0 CF 00 1C         [ 2]  294 	ldw txtbgn,x
      0081C3 1D 00 02         [ 2]  295 	subw x,#2 
      0081C6 FE               [ 2]  296 	ldw x,(x)
      0081C7 72 BB 00 1C      [ 2]  297 	addw x,txtbgn 
      0081CB CF 00 1E         [ 2]  298 	ldw txtend,x 
      0081CE AE 81 DC         [ 2]  299 	ldw x,#AUTO_RUN 
      0081D1 CD 87 02         [ 4]  300 	call puts 
      0081D4 CD 9B EC         [ 4]  301 	call program_info 
      0081D7 CC A3 0B         [ 2]  302 	jp run_it_02  
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
      0082EF CC 94 37         [ 2]  208     jp tb_error 
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



      008366 CC 94 37         [ 2]  282     jp tb_error 
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
      0083AA CC 94 37         [ 2]  348     jp tb_error 
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
      0084A0 CD 91 5D         [ 4]  105 	call move
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
      0084E0 CD 91 5D         [ 4]  157 	call move
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
      00865C CD A6 8F         [ 4]   99 	call erase_header ; in TinyBasic.asm 
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
      008793 CD 91 5D         [ 4]  432     call move
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
      0087D4 CD 91 5D         [ 4]  473 	call move 
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
      008873 CD 91 31         [ 4]  594 	call strlen
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
      008893 CD 96 76         [ 4]  611 	call atoi24
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
      0088B6 CD 8F 64         [ 4]  626 	call decompile 
      0088B9 0F 01            [ 1]  627 	clr (LL_HB,sp)
      0088BB A6 0D            [ 1]  628 	ld a,#CR 
      0088BD CD 86 A5         [ 4]  629 	call putc 
      0088C0 A6 3E            [ 1]  630 	ld a,#'>
      0088C2 CD 86 A5         [ 4]  631 	call putc
      0088C5 AE 16 68         [ 2]  632     ldw x,#tib  
      0088C8 CD 91 31         [ 4]  633 	call strlen 
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
      00894B CD A3 95         [ 4]  696 	call beep_1khz
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
      008A32 CD 91 5D         [ 4]   95 	call move
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



      008A6D CD 91 5D         [ 4]  132 	call move
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
      008ABA AE 92 88         [ 2]  182 	ldw x,#err_mem_full 
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
      008AD4 CD 91 5D         [ 4]  194 	call move
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
      008B5B CD 96 6A         [ 4]  310 	call to_upper 
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
      008B80 CD 96 76         [ 4]  326 	call atoi24
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
                                    436 ; valid: Upper case LETTER,DIGIT,'_' 
                                    437 ; input:
                                    438 ;    A   character to validate
                                    439 ; output:
                                    440 ;    Carry   set if valid 
                                    441 ;----------------------------
      008BF8                        442 is_symbol_char: 
      008BF8 A1 5F            [ 1]  443 	cp a,#'_ 
      008BFA 26 03            [ 1]  444 	jrne 1$
      008BFC 99               [ 1]  445 	scf 
      008BFD 20 03            [ 2]  446 	jra 9$ 
      008BFF CD 8B EF         [ 4]  447 1$:	call is_alnum 
      008C02 81               [ 4]  448 9$: ret 
                                    449 
                                    450 ;---------------------------
                                    451 ;  when lexical unit begin 
                                    452 ;  with a letter a symbol 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                    453 ;  is expected.
                                    454 ; input:
                                    455 ;   A   first character of symbol 
                                    456 ;	X   point to output buffer 
                                    457 ;   Y   point to input text 
                                    458 ; output:
                                    459 ;	X   after symbol 
                                    460 ;   Y   point after lexical unit 
                                    461 ;---------------------------
      008C03                        462 parse_symbol:
      008C03 5C               [ 1]  463 	incw x ; keep space for TK_ID 
      008C04                        464 symb_loop: 
                                    465 ; symbol are converted to upper case 
      008C04 CD 96 6A         [ 4]  466 	call to_upper  
      008C07 F7               [ 1]  467 	ld (x), a 
      008C08 5C               [ 1]  468 	incw x
      008C09 91 D6 01         [ 4]  469 	ld a,([in.w],y)
      008C0C 72 5C 00 02      [ 1]  470 	inc in 
      008C10 CD 8B F8         [ 4]  471 	call is_symbol_char 
      008C13 25 EF            [ 1]  472 	jrc symb_loop 
      008C15 7F               [ 1]  473 	clr (x)
      008C16 72 5A 00 02      [ 1]  474 	dec in  
      008C1A 81               [ 4]  475 	ret 
                                    476 
                                    477 ;---------------------------
                                    478 ;  token begin with a letter,
                                    479 ;  is keyword or variable. 	
                                    480 ; input:
                                    481 ;   X 		point to pad 
                                    482 ;   Y 		point to text
                                    483 ;   A 	    first letter  
                                    484 ; output:
                                    485 ;   X		exec_addr|var_addr 
                                    486 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC|TK_AND|TK_OR|TK_XOR   
                                    487 ;   pad 	keyword|var_name  
                                    488 ;--------------------------  
                           000001   489 	XFIRST=1
                           000002   490 	VSIZE=2
      008C1B                        491 parse_keyword: 
      008C1B 89               [ 2]  492 	pushw x ; preserve *symbol 
      008C1C CD 8C 03         [ 4]  493 	call parse_symbol
      008C1F 1E 01            [ 2]  494 	ldw x,(XFIRST,sp) 
      008C21 E6 02            [ 1]  495 	ld a,(2,x)
      008C23 26 0F            [ 1]  496 	jrne 2$
                                    497 ; one letter variable name 
      008C25 E6 01            [ 1]  498 	ld a,(1,x) 
      008C27 A0 41            [ 1]  499 	sub a,#'A 
      008C29 AE 00 03         [ 2]  500 	ldw x,#3 
      008C2C 42               [ 4]  501 	mul x,a 
      008C2D 1C 00 35         [ 2]  502 	addw x,#vars 
      008C30 A6 85            [ 1]  503 	ld a,#TK_VAR 
      008C32 20 36            [ 2]  504 	jra 4$ 
      008C34                        505 2$: ; check for keyword, otherwise syntax error.
      000BB4                        506 	_ldx_dict kword_dict ; dictionary entry point
      008C34 AE B4 21         [ 2]    1     ldw x,#kword_dict+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      008C37 16 01            [ 2]  507 	ldw y,(XFIRST,sp) ; name to search for
      008C39 90 5C            [ 1]  508 	incw y 
      008C3B CD 96 F7         [ 4]  509 	call search_dict
      008C3E 4D               [ 1]  510 	tnz a
      008C3F 26 29            [ 1]  511 	jrne 4$
                                    512 ; not in dictionary
                                    513 ; compile it as TK_LABEL
      008C41 16 01            [ 2]  514 	ldw y,(XFIRST,sp)
      008C43 A6 03            [ 1]  515 	ld a,#TK_LABEL 
      008C45 90 F7            [ 1]  516 	ld (y),a 
      008C47 90 5C            [ 1]  517 	incw y
      008C49 93               [ 1]  518 	ldw x,y 
      008C4A CD 91 31         [ 4]  519 	call strlen
      008C4D A1 0F            [ 1]  520 	cp a,#NAME_MAX_LEN 
      008C4F 23 02            [ 2]  521 	jrule 22$ 
      008C51 A6 0F            [ 1]  522 	ld a,#NAME_MAX_LEN 
      008C53                        523 22$:	
      008C53 88               [ 1]  524 	push a 
      008C54                        525 24$:
      008C54 90 F6            [ 1]  526     ld a,(y)
      008C56 27 09            [ 1]  527 	jreq 3$
      008C58 90 5C            [ 1]  528 	incw y
      008C5A 0A 01            [ 1]  529 	dec (1,sp) 
      008C5C 26 F6            [ 1]  530 	jrne 24$
      008C5E 4F               [ 1]  531 	clr a 
      008C5F 90 F7            [ 1]  532 	ld (y),a 
      008C61 90 5C            [ 1]  533 3$: incw y 
      000BE3                        534 	_drop 1 
      008C63 5B 01            [ 2]    1     addw sp,#1 
      008C65 A6 03            [ 1]  535 	ld a,#TK_LABEL 
      008C67 5F               [ 1]  536 	clrw x 
      008C68 20 1B            [ 2]  537 	jra 5$ 
      008C6A                        538 4$:	
      008C6A 16 01            [ 2]  539 	ldw y,(XFIRST,sp)
      008C6C A1 87            [ 1]  540 	cp a,#TK_NOT 
      008C6E 2B 06            [ 1]  541 	jrmi 41$
      008C70 90 F7            [ 1]  542 	ld (y),a 
      008C72 90 5C            [ 1]  543 	incw y 
      008C74 20 0F            [ 2]  544 	jra 5$ 
      008C76                        545 41$:	
      008C76 A3 9A 84         [ 2]  546 	cpw x,#let  
      008C79 27 0A            [ 1]  547 	jreq 5$  ; don't compile LET command 
      008C7B 90 F7            [ 1]  548 	ld (y),a 
      008C7D 90 5C            [ 1]  549 	incw y 
      008C7F 90 FF            [ 2]  550 	ldw (y),x
      008C81 72 A9 00 02      [ 2]  551 	addw y,#2  
      000C05                        552 5$:	_drop VSIZE 
      008C85 5B 02            [ 2]    1     addw sp,#VSIZE 
      008C87 81               [ 4]  553 	ret  	
                                    554 
                                    555 ;------------------------------------
                                    556 ; skip character c in text starting from 'in'
                                    557 ; input:
                                    558 ;	 y 		point to text buffer
                                    559 ;    a 		character to skip
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                    560 ; output:  
                                    561 ;	'in' ajusted to new position
                                    562 ;------------------------------------
                           000001   563 	C = 1 ; local var
      008C88                        564 skip:
      008C88 88               [ 1]  565 	push a
      008C89 91 D6 01         [ 4]  566 1$:	ld a,([in.w],y)
      008C8C 27 0A            [ 1]  567 	jreq 2$
      008C8E 11 01            [ 1]  568 	cp a,(C,sp)
      008C90 26 06            [ 1]  569 	jrne 2$
      008C92 72 5C 00 02      [ 1]  570 	inc in
      008C96 20 F1            [ 2]  571 	jra 1$
      000C18                        572 2$: _drop 1 
      008C98 5B 01            [ 2]    1     addw sp,#1 
      008C9A 81               [ 4]  573 	ret
                                    574 	
                                    575 
                                    576 ;------------------------------------
                                    577 ; scan text for next token
                                    578 ; input: 
                                    579 ;	X 		pointer to buffer where 
                                    580 ;	        token id and value are copied 
                                    581 ; use:
                                    582 ;	Y       pointer to text in tib 
                                    583 ; output:
                                    584 ;   A       token attribute 
                                    585 ;   X 		token value
                                    586 ;   Y       updated position in output buffer   
                                    587 ;------------------------------------
                                    588 	; use to check special character 
                                    589 	.macro _case c t  
                                    590 	ld a,#c 
                                    591 	cp a,(TCHAR,sp) 
                                    592 	jrne t
                                    593 	.endm 
                                    594 
                           000001   595 	TCHAR=1
                           000002   596 	ATTRIB=2
                           000002   597 	VSIZE=2
      008C9B                        598 get_token:: 
      000C1B                        599 	_vars VSIZE
      008C9B 52 02            [ 2]    1     sub sp,#VSIZE 
                                    600 ;	ld a,in 
                                    601 ;	sub a,count
                                    602 ;   jrmi 0$
                                    603 ;	clr a 
                                    604 ;	ret 
      008C9D                        605 0$: 
      008C9D 90 AE 16 68      [ 2]  606 	ldw y,#tib    	
      008CA1 A6 20            [ 1]  607 	ld a,#SPACE
      008CA3 CD 8C 88         [ 4]  608 	call skip
      008CA6 55 00 02 00 04   [ 1]  609 	mov in.saved,in 
      008CAB 91 D6 01         [ 4]  610 	ld a,([in.w],y)
      008CAE 26 05            [ 1]  611 	jrne 1$
      008CB0 90 93            [ 1]  612 	ldw y,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      008CB2 CC 8E 4C         [ 2]  613 	jp token_exit ; end of line 
      008CB5 72 5C 00 02      [ 1]  614 1$:	inc in 
      008CB9 CD 96 6A         [ 4]  615 	call to_upper 
      008CBC 6B 01            [ 1]  616 	ld (TCHAR,sp),a 
                                    617 ; check for quoted string
      008CBE                        618 str_tst:  	
      000C3E                        619 	_case '"' nbr_tst
      008CBE A6 22            [ 1]    1 	ld a,#'"' 
      008CC0 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CC2 26 0A            [ 1]    3 	jrne nbr_tst
      008CC4 A6 02            [ 1]  620 	ld a,#TK_QSTR
      008CC6 F7               [ 1]  621 	ld (x),a 
      008CC7 5C               [ 1]  622 	incw x 
      008CC8 CD 8A F0         [ 4]  623 	call parse_quote
      008CCB CC 8E 4C         [ 2]  624 	jp token_exit
      008CCE                        625 nbr_tst:
                                    626 ; check for hexadecimal number 
      008CCE A6 24            [ 1]  627 	ld a,#'$'
      008CD0 11 01            [ 1]  628 	cp a,(TCHAR,sp) 
      008CD2 27 17            [ 1]  629 	jreq 1$
                                    630 ;check for binary number 
      008CD4 A6 26            [ 1]  631 	ld a,#'&
      008CD6 11 01            [ 1]  632 	cp a,(TCHAR,sp)
      008CD8 26 0A            [ 1]  633 	jrne 0$
      008CDA A6 84            [ 1]  634 	ld a,#TK_INTGR
      008CDC F7               [ 1]  635 	ld (x),a 
      008CDD 5C               [ 1]  636 	incw x 
      008CDE CD 8B 9A         [ 4]  637 	call parse_binary ; expect binary integer 
      008CE1 CC 8E 4C         [ 2]  638 	jp token_exit 
                                    639 ; check for decimal number 	
      008CE4 7B 01            [ 1]  640 0$:	ld a,(TCHAR,sp)
      008CE6 CD 8B E6         [ 4]  641 	call is_digit
      008CE9 24 0C            [ 1]  642 	jrnc 3$
      008CEB A6 84            [ 1]  643 1$:	ld a,#TK_INTGR 
      008CED F7               [ 1]  644 	ld (x),a 
      008CEE 5C               [ 1]  645 	incw x 
      008CEF 7B 01            [ 1]  646 	ld a,(TCHAR,sp)
      008CF1 CD 8B 45         [ 4]  647 	call parse_integer 
      008CF4 CC 8E 4C         [ 2]  648 	jp token_exit 
      008CF7                        649 3$: 
      000C77                        650 	_case '(' bkslsh_tst 
      008CF7 A6 28            [ 1]    1 	ld a,#'(' 
      008CF9 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CFB 26 05            [ 1]    3 	jrne bkslsh_tst
      008CFD A6 06            [ 1]  651 	ld a,#TK_LPAREN
      008CFF CC 8E 48         [ 2]  652 	jp token_char   	
      008D02                        653 bkslsh_tst: ; character token 
      000C82                        654 	_case '\',rparnt_tst
      008D02 A6 5C            [ 1]    1 	ld a,#'\' 
      008D04 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D06 26 16            [ 1]    3 	jrne rparnt_tst
      008D08 A6 04            [ 1]  655 	ld a,#TK_CHAR 
      008D0A F7               [ 1]  656 	ld (x),a 
      008D0B 5C               [ 1]  657 	incw x 
      008D0C 91 D6 01         [ 4]  658 	ld a,([in.w],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      008D0F F7               [ 1]  659 	ld (x),a 
      008D10 5C               [ 1]  660 	incw x
      008D11 90 93            [ 1]  661 	ldw y,x 	 
      008D13 72 5C 00 02      [ 1]  662 	inc in  
      008D17 5F               [ 1]  663 	clrw x 
      008D18 97               [ 1]  664 	ld xl,a 
      008D19 A6 04            [ 1]  665 	ld a,#TK_CHAR 
      008D1B CC 8E 4C         [ 2]  666 	jp token_exit 
      008D1E                        667 rparnt_tst:		
      000C9E                        668 	_case ')' colon_tst 
      008D1E A6 29            [ 1]    1 	ld a,#')' 
      008D20 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D22 26 05            [ 1]    3 	jrne colon_tst
      008D24 A6 07            [ 1]  669 	ld a,#TK_RPAREN 
      008D26 CC 8E 48         [ 2]  670 	jp token_char
      008D29                        671 colon_tst:
      000CA9                        672 	_case ':' comma_tst 
      008D29 A6 3A            [ 1]    1 	ld a,#':' 
      008D2B 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D2D 26 05            [ 1]    3 	jrne comma_tst
      008D2F A6 09            [ 1]  673 	ld a,#TK_COLON 
      008D31 CC 8E 48         [ 2]  674 	jp token_char  
      008D34                        675 comma_tst:
      000CB4                        676 	_case COMMA semic_tst 
      008D34 A6 2C            [ 1]    1 	ld a,#COMMA 
      008D36 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D38 26 05            [ 1]    3 	jrne semic_tst
      008D3A A6 08            [ 1]  677 	ld a,#TK_COMMA
      008D3C CC 8E 48         [ 2]  678 	jp token_char
      008D3F                        679 semic_tst:
      000CBF                        680 	_case SEMIC dash_tst
      008D3F A6 3B            [ 1]    1 	ld a,#SEMIC 
      008D41 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D43 26 05            [ 1]    3 	jrne dash_tst
      008D45 A6 0A            [ 1]  681 	ld a,#TK_SEMIC 
      008D47 CC 8E 48         [ 2]  682 	jp token_char 	
      008D4A                        683 dash_tst: 	
      000CCA                        684 	_case '-' at_tst 
      008D4A A6 2D            [ 1]    1 	ld a,#'-' 
      008D4C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D4E 26 05            [ 1]    3 	jrne at_tst
      008D50 A6 11            [ 1]  685 	ld a,#TK_MINUS  
      008D52 CC 8E 48         [ 2]  686 	jp token_char 
      008D55                        687 at_tst:
      000CD5                        688 	_case '@' qmark_tst 
      008D55 A6 40            [ 1]    1 	ld a,#'@' 
      008D57 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D59 26 05            [ 1]    3 	jrne qmark_tst
      008D5B A6 05            [ 1]  689 	ld a,#TK_ARRAY 
      008D5D CC 8E 48         [ 2]  690 	jp token_char
      008D60                        691 qmark_tst:
      000CE0                        692 	_case '?' tick_tst 
      008D60 A6 3F            [ 1]    1 	ld a,#'?' 
      008D62 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D64 26 12            [ 1]    3 	jrne tick_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      008D66 A6 80            [ 1]  693 	ld a,#TK_CMD  
      008D68 F7               [ 1]  694 	ld (x),a 
      008D69 5C               [ 1]  695 	incw x 
      008D6A 90 93            [ 1]  696 	ldw y,x 
      008D6C AE 9D B1         [ 2]  697 	ldw x,#cmd_print
      008D6F 90 FF            [ 2]  698 	ldw (y),x 
      008D71 72 A9 00 02      [ 2]  699 	addw y,#2
      008D75 CC 8E 4C         [ 2]  700 	jp token_exit
      008D78                        701 tick_tst: ; comment 
      000CF8                        702 	_case TICK plus_tst 
      008D78 A6 27            [ 1]    1 	ld a,#TICK 
      008D7A 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D7C 26 2B            [ 1]    3 	jrne plus_tst
      008D7E A6 80            [ 1]  703 	ld a,#TK_CMD
      008D80 F7               [ 1]  704 	ld (x),a 
      008D81 5C               [ 1]  705 	incw x
      008D82 90 AE 9E EC      [ 2]  706 	ldw y,#remark 
      008D86 FF               [ 2]  707 	ldw (x),y 
      008D87 1C 00 02         [ 2]  708 	addw x,#2  
      008D8A                        709 copy_comment:
      008D8A 90 AE 16 68      [ 2]  710 	ldw y,#tib 
      008D8E 72 B9 00 01      [ 2]  711 	addw y,in.w
      008D92 90 89            [ 2]  712 	pushw y 
      008D94 CD 91 4D         [ 4]  713 	call strcpy
      008D97 72 F2 01         [ 2]  714 	subw y,(1,sp)
      008D9A 90 5C            [ 1]  715 	incw y ; strlen+1 
      008D9C 17 01            [ 2]  716 	ldw (1,sp),y 
      008D9E 72 FB 01         [ 2]  717 	addw x,(1,sp) 
      000D21                        718 	_drop 2 
      008DA1 5B 02            [ 2]    1     addw sp,#2 
      008DA3 4F               [ 1]  719 	clr a 
      008DA4 90 93            [ 1]  720 	ldw y,x 
      008DA6 CC 8E 4C         [ 2]  721 	jp token_exit 
      008DA9                        722 plus_tst:
      000D29                        723 	_case '+' star_tst 
      008DA9 A6 2B            [ 1]    1 	ld a,#'+' 
      008DAB 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DAD 26 05            [ 1]    3 	jrne star_tst
      008DAF A6 10            [ 1]  724 	ld a,#TK_PLUS  
      008DB1 CC 8E 48         [ 2]  725 	jp token_char 
      008DB4                        726 star_tst:
      000D34                        727 	_case '*' slash_tst 
      008DB4 A6 2A            [ 1]    1 	ld a,#'*' 
      008DB6 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DB8 26 05            [ 1]    3 	jrne slash_tst
      008DBA A6 20            [ 1]  728 	ld a,#TK_MULT 
      008DBC CC 8E 48         [ 2]  729 	jp token_char 
      008DBF                        730 slash_tst: 
      000D3F                        731 	_case '/' prcnt_tst 
      008DBF A6 2F            [ 1]    1 	ld a,#'/' 
      008DC1 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DC3 26 05            [ 1]    3 	jrne prcnt_tst
      008DC5 A6 21            [ 1]  732 	ld a,#TK_DIV 
      008DC7 CC 8E 48         [ 2]  733 	jp token_char 
      008DCA                        734 prcnt_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      000D4A                        735 	_case '%' eql_tst 
      008DCA A6 25            [ 1]    1 	ld a,#'%' 
      008DCC 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DCE 26 05            [ 1]    3 	jrne eql_tst
      008DD0 A6 22            [ 1]  736 	ld a,#TK_MOD
      008DD2 CC 8E 48         [ 2]  737 	jp token_char  
                                    738 ; 1 or 2 character tokens 	
      008DD5                        739 eql_tst:
      000D55                        740 	_case '=' gt_tst 		
      008DD5 A6 3D            [ 1]    1 	ld a,#'=' 
      008DD7 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DD9 26 05            [ 1]    3 	jrne gt_tst
      008DDB A6 32            [ 1]  741 	ld a,#TK_EQUAL
      008DDD CC 8E 48         [ 2]  742 	jp token_char 
      008DE0                        743 gt_tst:
      000D60                        744 	_case '>' lt_tst 
      008DE0 A6 3E            [ 1]    1 	ld a,#'>' 
      008DE2 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DE4 26 23            [ 1]    3 	jrne lt_tst
      008DE6 A6 31            [ 1]  745 	ld a,#TK_GT 
      008DE8 6B 02            [ 1]  746 	ld (ATTRIB,sp),a 
      008DEA 91 D6 01         [ 4]  747 	ld a,([in.w],y)
      008DED 72 5C 00 02      [ 1]  748 	inc in 
      008DF1 A1 3D            [ 1]  749 	cp a,#'=
      008DF3 26 04            [ 1]  750 	jrne 1$
      008DF5 A6 33            [ 1]  751 	ld a,#TK_GE 
      008DF7 20 4F            [ 2]  752 	jra token_char  
      008DF9 A1 3C            [ 1]  753 1$: cp a,#'<
      008DFB 26 04            [ 1]  754 	jrne 2$
      008DFD A6 35            [ 1]  755 	ld a,#TK_NE 
      008DFF 20 47            [ 2]  756 	jra token_char 
      008E01 72 5A 00 02      [ 1]  757 2$: dec in
      008E05 7B 02            [ 1]  758 	ld a,(ATTRIB,sp)
      008E07 20 3F            [ 2]  759 	jra token_char 	 
      008E09                        760 lt_tst:
      000D89                        761 	_case '<' other
      008E09 A6 3C            [ 1]    1 	ld a,#'<' 
      008E0B 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E0D 26 23            [ 1]    3 	jrne other
      008E0F A6 34            [ 1]  762 	ld a,#TK_LT 
      008E11 6B 02            [ 1]  763 	ld (ATTRIB,sp),a 
      008E13 91 D6 01         [ 4]  764 	ld a,([in.w],y)
      008E16 72 5C 00 02      [ 1]  765 	inc in 
      008E1A A1 3D            [ 1]  766 	cp a,#'=
      008E1C 26 04            [ 1]  767 	jrne 1$
      008E1E A6 36            [ 1]  768 	ld a,#TK_LE 
      008E20 20 26            [ 2]  769 	jra token_char 
      008E22 A1 3E            [ 1]  770 1$: cp a,#'>
      008E24 26 04            [ 1]  771 	jrne 2$
      008E26 A6 35            [ 1]  772 	ld a,#TK_NE 
      008E28 20 1E            [ 2]  773 	jra token_char 
      008E2A 72 5A 00 02      [ 1]  774 2$: dec in 
      008E2E 7B 02            [ 1]  775 	ld a,(ATTRIB,sp)
      008E30 20 16            [ 2]  776 	jra token_char 	
      008E32                        777 other: ; not a special character 	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      008E32 7B 01            [ 1]  778 	ld a,(TCHAR,sp)
      008E34 CD 8B D5         [ 4]  779 	call is_alpha 
      008E37 25 03            [ 1]  780 	jrc 30$ 
      008E39 CC 94 35         [ 2]  781 	jp syntax_error 
      008E3C                        782 30$: 
      008E3C CD 8C 1B         [ 4]  783 	call parse_keyword
      008E3F A3 9E EC         [ 2]  784 	cpw x,#remark 
      008E42 26 08            [ 1]  785 	jrne token_exit 
      008E44 93               [ 1]  786 	ldw x,y 
      008E45 CC 8D 8A         [ 2]  787 	jp copy_comment 
      008E48                        788 token_char:
      008E48 F7               [ 1]  789 	ld (x),a 
      008E49 5C               [ 1]  790 	incw x
      008E4A 90 93            [ 1]  791 	ldw y,x 
      008E4C                        792 token_exit:
      000DCC                        793 	_drop VSIZE 
      008E4C 5B 02            [ 2]    1     addw sp,#VSIZE 
      008E4E 81               [ 4]  794 	ret
                                    795 
                                    796 
                                    797 ;-----------------------------------
                                    798 ; create token list fromm text line 
                                    799 ; save this list in pad buffer 
                                    800 ;  compiled line format: 
                                    801 ;    line_no  2 bytes {0...32767}
                                    802 ;    line length    1 byte  
                                    803 ;    tokens list  variable length 
                                    804 ;   
                                    805 ; input:
                                    806 ;   none
                                    807 ; modified variables:
                                    808 ;   basicptr     token list buffer address 
                                    809 ;   in.w  		 3|count, i.e. index in buffer
                                    810 ;   count        length of line | 0  
                                    811 ;-----------------------------------
                           000001   812 	XSAVE=1
                           000002   813 	VSIZE=2
      008E4F                        814 compile::
      008E4F 90 89            [ 2]  815 	pushw y ; preserve xstack pointer 
      000DD1                        816 	_vars VSIZE 
      008E51 52 02            [ 2]    1     sub sp,#VSIZE 
      008E53 55 00 1C 00 05   [ 1]  817 	mov basicptr,txtbgn
      008E58 72 1A 00 23      [ 1]  818 	bset flags,#FCOMP 
      008E5C A6 00            [ 1]  819 	ld a,#0
      008E5E AE 00 00         [ 2]  820 	ldw x,#0
      008E61 CF 16 B8         [ 2]  821 	ldw pad,x ; destination buffer 
      008E64 C7 16 BA         [ 1]  822 	ld pad+2,a ; count 
      008E67 AE 16 BB         [ 2]  823 	ldw x,#pad+3
      008E6A 72 5F 00 02      [ 1]  824 	clr in 
      008E6E CD 8C 9B         [ 4]  825 	call get_token
      008E71 A1 84            [ 1]  826 	cp a,#TK_INTGR
      008E73 26 11            [ 1]  827 	jrne 2$
      008E75 A3 00 01         [ 2]  828 	cpw x,#1 
      008E78 2A 05            [ 1]  829 	jrpl 1$
      008E7A A6 0A            [ 1]  830 	ld a,#ERR_BAD_VALUE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      008E7C CC 94 37         [ 2]  831 	jp tb_error
      008E7F CF 16 B8         [ 2]  832 1$:	ldw pad,x ; line# 
      008E82 90 AE 16 BB      [ 2]  833 	ldw y,#pad+3 
      008E86 90 A3 17 38      [ 2]  834 2$:	cpw y,#xstack_full 
      008E8A 25 05            [ 1]  835 	jrult 3$
      008E8C A6 0F            [ 1]  836 	ld a,#ERR_BUF_FULL 
      008E8E CC 94 37         [ 2]  837 	jp tb_error 
      008E91                        838 3$:	
      008E91 93               [ 1]  839 	ldw x,y 
      008E92 CD 8C 9B         [ 4]  840 	call get_token 
      008E95 A1 00            [ 1]  841 	cp a,#TK_NONE 
      008E97 26 ED            [ 1]  842 	jrne 2$ 
                                    843 ; compilation completed  
      008E99 72 A2 16 B8      [ 2]  844 	subw y,#pad ; compiled line length 
      008E9D 90 9F            [ 1]  845     ld a,yl
      008E9F AE 16 B8         [ 2]  846 	ldw x,#pad 
      008EA2 CF 00 1A         [ 2]  847 	ldw ptr16,x 
      008EA5 E7 02            [ 1]  848 	ld (2,x),a 
      008EA7 FE               [ 2]  849 	ldw x,(x)  ; line# 
      008EA8 27 09            [ 1]  850 	jreq 10$
      008EAA CD 8A 82         [ 4]  851 	call insert_line
      008EAD 72 5F 00 03      [ 1]  852 	clr  count 
      008EB1 20 0F            [ 2]  853 	jra  11$ 
      008EB3                        854 10$: ; line# is zero 
      008EB3 CE 00 1A         [ 2]  855 	ldw x,ptr16  
      008EB6 CF 00 05         [ 2]  856 	ldw basicptr,x 
      008EB9 E6 02            [ 1]  857 	ld a,(2,x)
      008EBB C7 00 03         [ 1]  858 	ld count,a 
      008EBE 35 03 00 02      [ 1]  859 	mov in,#3 
      008EC2                        860 11$:
      000E42                        861 	_drop VSIZE 
      008EC2 5B 02            [ 2]    1     addw sp,#VSIZE 
      008EC4 72 1B 00 23      [ 1]  862 	bres flags,#FCOMP 
      008EC8 90 85            [ 2]  863 	popw y 
      008ECA 81               [ 4]  864 	ret 
                                    865 
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
      008ECB                         48 cpy_cmd_name:
      008ECB 5D               [ 2]   49 	tnzw x 
      008ECC 27 14            [ 1]   50 	jreq 10$
      008ECE F6               [ 1]   51 	ld a,(x)
      008ECF 5C               [ 1]   52 	incw x
      008ED0 A4 0F            [ 1]   53 	and a,#15  
      008ED2 88               [ 1]   54 	push a 
      008ED3 0D 01            [ 1]   55     tnz (1,sp) 
      008ED5 27 0A            [ 1]   56 	jreq 9$
      008ED7 F6               [ 1]   57 1$:	ld a,(x)
      008ED8 90 F7            [ 1]   58 	ld (y),a  
      008EDA 5C               [ 1]   59 	incw x
      008EDB 90 5C            [ 1]   60 	incw y 
      008EDD 0A 01            [ 1]   61 	dec (1,sp)	 
      008EDF 26 F6            [ 1]   62 	jrne 1$
      008EE1 84               [ 1]   63 9$: pop a 
      008EE2                         64 10$: 
      008EE2 81               [ 4]   65 	ret	
                                     66 
                                     67 ;--------------------------
                                     68 ; add a space after letter or 
                                     69 ; digit.
                                     70 ; input:
                                     71 ;   Y     pointer to buffer 
                                     72 ; output:
                                     73 ;   Y    moved to end 
                                     74 ;--------------------------
      008EE3                         75 add_space:
      008EE3 90 5A            [ 2]   76 	decw y 
      008EE5 90 F6            [ 1]   77 	ld a,(y)
      008EE7 90 5C            [ 1]   78 	incw y
      008EE9 A1 29            [ 1]   79 	cp a,#') 
      008EEB 27 05            [ 1]   80 	jreq 0$
      008EED CD 8B EF         [ 4]   81 	call is_alnum 
      008EF0 24 06            [ 1]   82 	jrnc 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      008EF2                         83 0$: 
      008EF2 A6 20            [ 1]   84 	ld a,#SPACE 
      008EF4 90 F7            [ 1]   85 	ld (y),a 
      008EF6 90 5C            [ 1]   86 	incw y 
      008EF8 81               [ 4]   87 1$: ret 
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
      008EF9                        103 right_align::
      000E79                        104 	_vars VSIZE 
      008EF9 52 02            [ 2]    1     sub sp,#VSIZE 
      008EFB 6B 01            [ 1]  105 	ld (WIDTH,sp),a 
      008EFD CD 91 31         [ 4]  106 	call strlen 
      008F00 6B 02            [ 1]  107 0$:	ld (SLEN,sp),a  
      008F02 11 01            [ 1]  108 	cp a,(WIDTH,sp) 
      008F04 2A 09            [ 1]  109 	jrpl 1$
      008F06 5A               [ 2]  110 	decw x
      008F07 A6 20            [ 1]  111 	ld a,#SPACE 
      008F09 F7               [ 1]  112 	ld (x),a  
      008F0A 7B 02            [ 1]  113 	ld a,(SLEN,sp)
      008F0C 4C               [ 1]  114 	inc a 
      008F0D 20 F1            [ 2]  115 	jra 0$ 
      008F0F 7B 02            [ 1]  116 1$: ld a,(SLEN,sp)	
      000E91                        117 	_drop VSIZE 
      008F11 5B 02            [ 2]    1     addw sp,#VSIZE 
      008F13 81               [ 4]  118 	ret 
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
      008F14                        131 cpy_quote:
      008F14 A6 22            [ 1]  132 	ld a,#'"
      008F16 90 F7            [ 1]  133 	ld (y),a 
      008F18 90 5C            [ 1]  134 	incw y 
      008F1A 89               [ 2]  135 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      008F1B CD 95 A8         [ 4]  136 	call skip_string 
      008F1E 85               [ 2]  137 	popw x 
      008F1F F6               [ 1]  138 1$:	ld a,(x)
      008F20 27 30            [ 1]  139 	jreq 9$
      008F22 5C               [ 1]  140 	incw x 
      008F23 A1 20            [ 1]  141 	cp a,#SPACE 
      008F25 25 0E            [ 1]  142 	jrult 3$
      008F27 90 F7            [ 1]  143 	ld (y),a
      008F29 90 5C            [ 1]  144 	incw y 
      008F2B A1 5C            [ 1]  145 	cp a,#'\ 
      008F2D 26 F0            [ 1]  146 	jrne 1$ 
      008F2F                        147 2$:
      008F2F 90 F7            [ 1]  148 	ld (y),a
      008F31 90 5C            [ 1]  149 	incw y  
      008F33 20 EA            [ 2]  150 	jra 1$
      008F35 88               [ 1]  151 3$: push a 
      008F36 A6 5C            [ 1]  152 	ld a,#'\
      008F38 90 F7            [ 1]  153 	ld (y),a 
      008F3A 90 5C            [ 1]  154 	incw y  
      008F3C 84               [ 1]  155 	pop a 
      008F3D A0 07            [ 1]  156 	sub a,#7
      008F3F C7 00 0F         [ 1]  157 	ld acc8,a 
      008F42 72 5F 00 0E      [ 1]  158 	clr acc16
      008F46 89               [ 2]  159 	pushw x
      008F47 AE 8B 3D         [ 2]  160 	ldw x,#escaped 
      008F4A 72 BB 00 0E      [ 2]  161 	addw x,acc16 
      008F4E F6               [ 1]  162 	ld a,(x)
      008F4F 85               [ 2]  163 	popw x
      008F50 20 DD            [ 2]  164 	jra 2$
      008F52 A6 22            [ 1]  165 9$: ld a,#'"
      008F54 90 F7            [ 1]  166 	ld (y),a 
      008F56 90 5C            [ 1]  167 	incw y  
      008F58 5C               [ 1]  168 	incw x 
      008F59 81               [ 4]  169 	ret
                                    170 
                                    171 ;--------------------------
                                    172 ; return variable name 
                                    173 ; from its address.
                                    174 ; input:
                                    175 ;   X    variable address
                                    176 ; output:
                                    177 ;   A     variable letter
                                    178 ;--------------------------
      008F5A                        179 var_name::
      008F5A 1D 00 35         [ 2]  180 		subw x,#vars 
      008F5D A6 03            [ 1]  181 		ld a,#3
      008F5F 62               [ 2]  182 		div x,a 
      008F60 9F               [ 1]  183 		ld a,xl 
      008F61 AB 41            [ 1]  184 		add a,#'A 
      008F63 81               [ 4]  185 		ret 
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
      008F64                        202 decompile::
      000EE4                        203 	_vars VSIZE
      008F64 52 03            [ 2]    1     sub sp,#VSIZE 
      008F66 C6 00 0B         [ 1]  204 	ld a,base
      008F69 6B 01            [ 1]  205 	ld (BASE_SAV,sp),a  
      008F6B 17 02            [ 2]  206 	ldw (STR,sp),y   
      008F6D 72 CE 00 05      [ 5]  207 	ldw x,[basicptr] ; line number 
      008F71 35 0A 00 0B      [ 1]  208 	mov base,#10
      008F75 72 5F 00 0D      [ 1]  209 	clr acc24 
      008F79 CF 00 0E         [ 2]  210 	ldw acc16,x
      008F7C 4F               [ 1]  211 	clr a ; unsigned conversion 
      008F7D CD 96 0C         [ 4]  212 	call itoa  
      008F80 A6 05            [ 1]  213 	ld a,#5 
      008F82 CD 8E F9         [ 4]  214 	call right_align 
      008F85 88               [ 1]  215 	push a 
      008F86 90 93            [ 1]  216 1$:	ldw y,x ; source
      008F88 1E 03            [ 2]  217 	ldw x,(STR+1,sp) ; destination
      008F8A CD 91 4D         [ 4]  218 	call strcpy 
      008F8D 90 5F            [ 1]  219 	clrw y 
      008F8F 84               [ 1]  220 	pop a 
      008F90 90 97            [ 1]  221 	ld yl,a 
      008F92 72 F9 02         [ 2]  222 	addw y,(STR,sp)
      008F95 A6 20            [ 1]  223 	ld a,#SPACE 
      008F97 90 F7            [ 1]  224 	ld (y),a 
      008F99 90 5C            [ 1]  225 	incw y 
      008F9B AE 00 03         [ 2]  226 	ldw x,#3
      008F9E CF 00 01         [ 2]  227 	ldw in.w,x 
      008FA1                        228 decomp_loop:
      008FA1 90 89            [ 2]  229 	pushw y
      008FA3 CD 95 8F         [ 4]  230 	call next_token 
      008FA6 90 85            [ 2]  231 	popw y 
      008FA8 4D               [ 1]  232 	tnz a  
      008FA9 26 03            [ 1]  233 	jrne 1$
      008FAB CC 90 C6         [ 2]  234 	jp 20$
      008FAE 2B 03            [ 1]  235 1$:	jrmi 2$
      008FB0 CC 90 3F         [ 2]  236 	jp 6$
      008FB3                        237 2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR|TK_AND|TK_OR|TK_XOR 
      008FB3 A1 85            [ 1]  238 	cp a,#TK_VAR 
      008FB5 26 0F            [ 1]  239 	jrne 3$
                                    240 ;; TK_VAR 
      008FB7 CD 8E E3         [ 4]  241 	call add_space
      008FBA CD 95 B7         [ 4]  242 	call get_addr   
      008FBD CD 8F 5A         [ 4]  243 	call var_name
      008FC0 90 F7            [ 1]  244 	ld (y),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      008FC2 90 5C            [ 1]  245 	incw y  
      008FC4 20 DB            [ 2]  246 	jra decomp_loop
      008FC6                        247 3$:
      008FC6 A1 84            [ 1]  248 	cp a,#TK_INTGR
      008FC8 26 26            [ 1]  249 	jrne 4$
                                    250 ;; TK_INTGR
      008FCA CD 95 C1         [ 4]  251 	call get_int24 
      008FCD C7 00 0D         [ 1]  252 	ld acc24,a 
      008FD0 CF 00 0E         [ 2]  253 	ldw acc16,x 
      008FD3 CD 8E E3         [ 4]  254 	call add_space
      008FD6 90 89            [ 2]  255 	pushw y 
      008FD8 A6 FF            [ 1]  256 	ld a,#255 ; signed conversion 
      008FDA CD 96 0C         [ 4]  257 	call itoa  
      008FDD 16 01            [ 2]  258 	ldw y,(1,sp) 
      008FDF 88               [ 1]  259 	push a 
      008FE0 51               [ 1]  260 	exgw x,y 
      008FE1 CD 91 4D         [ 4]  261 	call strcpy 
      008FE4 90 5F            [ 1]  262 	clrw y
      008FE6 84               [ 1]  263 	pop a  
      008FE7 90 97            [ 1]  264 	ld yl,a 
      008FE9 72 F9 01         [ 2]  265 	addw y,(1,sp)
      000F6C                        266 	_drop 2 
      008FEC 5B 02            [ 2]    1     addw sp,#2 
      008FEE 20 B1            [ 2]  267 	jra decomp_loop
      008FF0                        268 4$: ; dictionary keyword
      008FF0 A1 87            [ 1]  269 	cp a,#TK_NOT 
      008FF2 24 39            [ 1]  270 	jruge 50$ 
      008FF4 FE               [ 2]  271 	ldw x,(x)
      008FF5 72 5C 00 02      [ 1]  272 	inc in 
      008FF9 72 5C 00 02      [ 1]  273 	inc in 
      008FFD A3 9E EC         [ 2]  274 	cpw x,#remark 
      009000 26 23            [ 1]  275 	jrne 5$
      009002 CE 00 05         [ 2]  276 	ldw x,basicptr 
                                    277 ; copy comment to buffer 
      009005 CD 8E E3         [ 4]  278 	call add_space
      009008 A6 27            [ 1]  279 	ld a,#''
      00900A 90 F7            [ 1]  280 	ld (y),a 
      00900C 90 5C            [ 1]  281 	incw y 
      00900E                        282 46$:
      00900E 72 D6 00 01      [ 4]  283 	ld a,([in.w],x)
      009012 72 5C 00 02      [ 1]  284 	inc in  
      009016 90 F7            [ 1]  285 	ld (y),a 
      009018 90 5C            [ 1]  286 	incw y 
      00901A C6 00 02         [ 1]  287 	ld a,in 
      00901D C1 00 03         [ 1]  288 	cp a,count 
      009020 2B EC            [ 1]  289 	jrmi 46$
      009022 CC 90 C6         [ 2]  290 	jp 20$  
      009025 A3 9A 84         [ 2]  291 5$: cpw x,#let  
      009028 26 05            [ 1]  292 	jrne 54$
      00902A CC 8F A1         [ 2]  293 	jp decomp_loop ; down display LET
      00902D                        294 50$:
      00902D 5F               [ 1]  295 	clrw x 
      00902E 97               [ 1]  296 	ld xl,a 
      00902F                        297 54$: ; insert command name 
      00902F CD 8E E3         [ 4]  298 	call add_space  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009032 90 89            [ 2]  299 	pushw y
      009034 CD 90 FD         [ 4]  300 	call cmd_name
      009037 90 85            [ 2]  301 	popw y 
      009039 CD 8E CB         [ 4]  302 	call cpy_cmd_name
      00903C CC 8F A1         [ 2]  303 	jp decomp_loop 
      00903F                        304 6$:
                                    305 ; label?
      00903F A1 03            [ 1]  306 	cp a,#TK_LABEL 
      009041 26 1E            [ 1]  307 	jrne 64$
                                    308 ; copy label string to output buffer   	
      009043 A6 20            [ 1]  309 	ld a,#32 
      009045 90 F7            [ 1]  310 	ld (y),a 
      009047 90 5C            [ 1]  311 	incw y 
      009049                        312 61$:
      009049 89               [ 2]  313 	pushw x 
      00904A CD 95 A8         [ 4]  314 	call skip_string 
      00904D 85               [ 2]  315 	popw x 
      00904E                        316 62$:	
      00904E F6               [ 1]  317 	ld a,(x)
      00904F 27 07            [ 1]  318 	jreq 63$ 
      009051 5C               [ 1]  319 	incw x  
      009052 90 F7            [ 1]  320 	ld (y),a 
      009054 90 5C            [ 1]  321 	incw y 
      009056 20 F6            [ 2]  322 	jra 62$ 
      009058                        323 63$: 
      009058 A6 20            [ 1]  324 	ld a,#32 
      00905A 90 F7            [ 1]  325 	ld (y),a 
      00905C 90 5C            [ 1]  326 	incw y 
      00905E CC 8F A1         [ 2]  327 	jp decomp_loop
      009061                        328 64$:
      009061 A1 02            [ 1]  329 	cp a,#TK_QSTR 
      009063 26 09            [ 1]  330 	jrne 7$
                                    331 ;; TK_QSTR
      009065 CD 8E E3         [ 4]  332 	call add_space
      009068 CD 8F 14         [ 4]  333 	call cpy_quote  
      00906B CC 8F A1         [ 2]  334 	jp decomp_loop
      00906E                        335 7$:
      00906E A1 04            [ 1]  336 	cp a,#TK_CHAR 
      009070 26 15            [ 1]  337 	jrne 9$
                                    338 ;; TK_CHAR
      009072 CD 8E E3         [ 4]  339 	call add_space 
      009075 A6 5C            [ 1]  340 	ld a,#'\ 
      009077 90 F7            [ 1]  341 	ld (y),a 
      009079 90 5C            [ 1]  342 	incw y
      00907B F6               [ 1]  343 	ld a,(x)
      00907C 72 5C 00 02      [ 1]  344 	inc in  
      009080                        345 8$:
      009080 90 F7            [ 1]  346 	ld (y),a 
      009082 90 5C            [ 1]  347 	incw y 
      009084                        348 82$:
      009084 CC 8F A1         [ 2]  349 	jp decomp_loop
      009087                        350 9$: 
      009087 A1 0A            [ 1]  351 	cp a,#TK_SEMIC 
      009089 22 0A            [ 1]  352 	jrugt 10$ 
      00908B A0 05            [ 1]  353 	sub a,#TK_ARRAY 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      00908D 5F               [ 1]  354 	clrw x 
      00908E 97               [ 1]  355 	ld xl,a
      00908F 1C 90 D7         [ 2]  356 	addw x,#single_char 
      009092 F6               [ 1]  357 	ld a,(x)
      009093 20 EB            [ 2]  358 	jra 8$ 
      009095                        359 10$: 
      009095 A1 11            [ 1]  360 	cp a,#TK_MINUS 
      009097 22 0A            [ 1]  361 	jrugt 11$
      009099 A0 10            [ 1]  362 	sub a,#TK_PLUS 
      00909B 5F               [ 1]  363 	clrw x 
      00909C 97               [ 1]  364 	ld xl,a 
      00909D 1C 90 DD         [ 2]  365 	addw x,#add_char 
      0090A0 F6               [ 1]  366 	ld a,(x)
      0090A1 20 DD            [ 2]  367 	jra 8$
      0090A3                        368 11$:
      0090A3 A1 22            [ 1]  369     cp a,#TK_MOD 
      0090A5 22 0A            [ 1]  370 	jrugt 12$
      0090A7 A0 20            [ 1]  371 	sub a,#TK_MULT
      0090A9 5F               [ 1]  372 	clrw x 
      0090AA 97               [ 1]  373 	ld xl,a 
      0090AB 1C 90 DF         [ 2]  374 	addw x,#mul_char
      0090AE F6               [ 1]  375 	ld a,(x)
      0090AF 20 CF            [ 2]  376 	jra 8$
      0090B1                        377 12$:
      0090B1 A0 31            [ 1]  378 	sub a,#TK_GT  
      0090B3 48               [ 1]  379 	sll a 
      0090B4 5F               [ 1]  380 	clrw x 
      0090B5 97               [ 1]  381 	ld xl,a 
      0090B6 1C 90 E2         [ 2]  382 	addw x,#relop_str 
      0090B9 FE               [ 2]  383 	ldw x,(x)
      0090BA F6               [ 1]  384 	ld a,(x)
      0090BB 5C               [ 1]  385 	incw x 
      0090BC 90 F7            [ 1]  386 	ld (y),a
      0090BE 90 5C            [ 1]  387 	incw y 
      0090C0 F6               [ 1]  388 	ld a,(x)
      0090C1 26 BD            [ 1]  389 	jrne 8$
      0090C3 CC 8F A1         [ 2]  390 	jp decomp_loop 
      0090C6                        391 20$: 
      0090C6 90 7F            [ 1]  392 	clr (y)
      0090C8 1E 02            [ 2]  393 	ldw x,(STR,sp)
      0090CA 7B 01            [ 1]  394 	ld a,(BASE_SAV,sp)
      0090CC C7 00 0B         [ 1]  395 	ld base,a 
      0090CF 72 F2 02         [ 2]  396 	subw y,(STR,sp) 
      0090D2 90 9F            [ 1]  397 	ld a,yl 
      001054                        398 	_drop VSIZE 
      0090D4 5B 03            [ 2]    1     addw sp,#VSIZE 
      0090D6 81               [ 4]  399 	ret 
                                    400 
      0090D7 40 28 29 2C 3A 3B      401 single_char: .byte '@','(',')',',',':',';' 
      0090DD 2B 2D                  402 add_char: .byte '+','-'
      0090DF 2A 2F 25               403 mul_char: .byte '*','/','%'
      0090E2 90 EE 90 F0 90 F2 90   404 relop_str: .word gt,equal,ge,lt,ne,le 
             F5 90 FA 90 F7
      0090EE 3E 00                  405 gt: .asciz ">"
      0090F0 3D 00                  406 equal: .asciz "="
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      0090F2 3E 3D 00               407 ge: .asciz ">="
      0090F5 3C 00                  408 lt: .asciz "<"
      0090F7 3C 3D 00               409 le: .asciz "<="
      0090FA 3C 3E 00               410 ne:  .asciz "<>"
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
      0090FD                        423 cmd_name:
      00107D                        424 	_vars VSIZE 
      0090FD 52 04            [ 2]    1     sub sp,#VSIZE 
      0090FF 72 5F 00 0E      [ 1]  425 	clr acc16 
      009103 1F 01            [ 2]  426 	ldw (CODE_ADDR,sp),x  
      009105 AE B4 1F         [ 2]  427 	ldw x,#kword_dict	
      009108 1F 03            [ 2]  428 1$:	ldw (LINK,sp),x
      00910A E6 02            [ 1]  429 	ld a,(2,x)
      00910C A4 0F            [ 1]  430 	and a,#15 
      00910E C7 00 0F         [ 1]  431 	ld acc8,a 
      009111 1C 00 03         [ 2]  432 	addw x,#3
      009114 72 BB 00 0E      [ 2]  433 	addw x,acc16
      009118 FE               [ 2]  434 	ldw x,(x) ; code address   
      009119 13 01            [ 2]  435 	cpw x,(CODE_ADDR,sp)
      00911B 27 0C            [ 1]  436 	jreq 2$
      00911D 1E 03            [ 2]  437 	ldw x,(LINK,sp)
      00911F FE               [ 2]  438 	ldw x,(x) 
      009120 1D 00 02         [ 2]  439 	subw x,#2  
      009123 26 E3            [ 1]  440 	jrne 1$
      009125 4F               [ 1]  441 	clr a 
      009126 5F               [ 1]  442 	clrw x 
      009127 20 05            [ 2]  443 	jra 9$
      009129 1E 03            [ 2]  444 2$: ldw x,(LINK,sp)
      00912B 1C 00 02         [ 2]  445 	addw x,#2 	
      0010AE                        446 9$:	_drop VSIZE
      00912E 5B 04            [ 2]    1     addw sp,#VSIZE 
      009130 81               [ 4]  447 	ret
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
      009131                        119 strlen::
      009131 89               [ 2]  120 	pushw x 
      009132 4F               [ 1]  121 	clr a
      009133 7D               [ 1]  122 1$:	tnz (x) 
      009134 27 04            [ 1]  123 	jreq 9$ 
      009136 4C               [ 1]  124 	inc a 
      009137 5C               [ 1]  125 	incw x 
      009138 20 F9            [ 2]  126 	jra 1$ 
      00913A 85               [ 2]  127 9$:	popw x 
      00913B 81               [ 4]  128 	ret 
                                    129 
                                    130 ;------------------------------------
                                    131 ; compare 2 strings
                                    132 ; input:
                                    133 ;   X 		char* first string 
                                    134 ;   Y       char* second string 
                                    135 ; output:
                                    136 ;   A 		0 not == |1 ==  
                                    137 ;-------------------------------------
      00913C                        138 strcmp:
      00913C F6               [ 1]  139 	ld a,(x)
      00913D 27 0B            [ 1]  140 	jreq 5$ 
      00913F 90 F1            [ 1]  141 	cp a,(y) 
      009141 26 05            [ 1]  142 	jrne 4$ 
      009143 5C               [ 1]  143 	incw x 
      009144 90 5C            [ 1]  144 	incw y 
      009146 20 F4            [ 2]  145 	jra strcmp 
      009148                        146 4$: ; not same  
      009148 4F               [ 1]  147 	clr a 
      009149 81               [ 4]  148 	ret 
      00914A                        149 5$: ; same 
      00914A A6 01            [ 1]  150 	ld a,#1 
      00914C 81               [ 4]  151 	ret 
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
      00914D                        162 strcpy::
      00914D 88               [ 1]  163 	push a 
      00914E 89               [ 2]  164 	pushw x 
      00914F 90 F6            [ 1]  165 1$: ld a,(y)
      009151 27 06            [ 1]  166 	jreq 9$ 
      009153 F7               [ 1]  167 	ld (x),a 
      009154 5C               [ 1]  168 	incw x 
      009155 90 5C            [ 1]  169 	incw y 
      009157 20 F6            [ 2]  170 	jra 1$ 
      009159 7F               [ 1]  171 9$:	clr (x)
      00915A 85               [ 2]  172 	popw x 
      00915B 84               [ 1]  173 	pop a 
      00915C 81               [ 4]  174 	ret 
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
      00915D                        188 move::
      00915D 88               [ 1]  189 	push a 
      0010DE                        190 	_vars VSIZE 
      00915E 52 02            [ 2]    1     sub sp,#VSIZE 
      009160 0F 01            [ 1]  191 	clr (INCR,sp)
      009162 0F 02            [ 1]  192 	clr (LB,sp)
      009164 90 89            [ 2]  193 	pushw y 
      009166 13 01            [ 2]  194 	cpw x,(1,sp) ; compare DEST to SRC 
      009168 90 85            [ 2]  195 	popw y 
      00916A 27 31            [ 1]  196 	jreq move_exit ; x==y 
      00916C 2B 0E            [ 1]  197 	jrmi move_down
      00916E                        198 move_up: ; start from top address with incr=-1
      00916E 72 BB 00 0E      [ 2]  199 	addw x,acc16
      009172 72 B9 00 0E      [ 2]  200 	addw y,acc16
      009176 03 01            [ 1]  201 	cpl (INCR,sp)
      009178 03 02            [ 1]  202 	cpl (LB,sp)   ; increment = -1 
      00917A 20 05            [ 2]  203 	jra move_loop  
      00917C                        204 move_down: ; start from bottom address with incr=1 
      00917C 5A               [ 2]  205     decw x 
      00917D 90 5A            [ 2]  206 	decw y
      00917F 0C 02            [ 1]  207 	inc (LB,sp) ; incr=1 
      009181                        208 move_loop:	
      009181 C6 00 0E         [ 1]  209     ld a, acc16 
      009184 CA 00 0F         [ 1]  210 	or a, acc8
      009187 27 14            [ 1]  211 	jreq move_exit 
      009189 72 FB 01         [ 2]  212 	addw x,(INCR,sp)
      00918C 72 F9 01         [ 2]  213 	addw y,(INCR,sp) 
      00918F 90 F6            [ 1]  214 	ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      009191 F7               [ 1]  215 	ld (x),a 
      009192 89               [ 2]  216 	pushw x 
      009193 CE 00 0E         [ 2]  217 	ldw x,acc16 
      009196 5A               [ 2]  218 	decw x 
      009197 CF 00 0E         [ 2]  219 	ldw acc16,x 
      00919A 85               [ 2]  220 	popw x 
      00919B 20 E4            [ 2]  221 	jra move_loop
      00919D                        222 move_exit:
      00111D                        223 	_drop VSIZE
      00919D 5B 02            [ 2]    1     addw sp,#VSIZE 
      00919F 84               [ 1]  224 	pop a 
      0091A0 81               [ 4]  225 	ret 	
                                    226 
                                    227 ;------------------------------------
                                    228 ;  set all variables to zero 
                                    229 ; input:
                                    230 ;   none 
                                    231 ; output:
                                    232 ;	none
                                    233 ;------------------------------------
      0091A1                        234 clear_vars:
      0091A1 89               [ 2]  235 	pushw x 
      0091A2 88               [ 1]  236 	push a  
      0091A3 AE 00 35         [ 2]  237 	ldw x,#vars 
      0091A6 A6 4E            [ 1]  238 	ld a,#CELL_SIZE*26 
      0091A8 7F               [ 1]  239 1$:	clr (x)
      0091A9 5C               [ 1]  240 	incw x 
      0091AA 4A               [ 1]  241 	dec a 
      0091AB 26 FB            [ 1]  242 	jrne 1$
      0091AD 84               [ 1]  243 	pop a 
      0091AE 85               [ 2]  244 	popw x 
      0091AF 81               [ 4]  245 	ret 
                                    246 
                                    247 
                                    248 ;-----------------------
                                    249 ;  display system 
                                    250 ;  information 
                                    251 ;-----------------------
                           000002   252 	MAJOR=2
                           000000   253 	MINOR=0 
      0091B0 0A 0A 54 69 6E 79 20   254 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
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
      0091F6                        256 system_information:
      0091F6 AE 91 B0         [ 2]  257 	ldw x,#software 
      0091F9 CD 87 02         [ 4]  258 	call puts 
      0091FC A6 02            [ 1]  259 	ld a,#MAJOR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      0091FE C7 00 0F         [ 1]  260 	ld acc8,a 
      009201 5F               [ 1]  261 	clrw x 
      009202 CF 00 0D         [ 2]  262 	ldw acc24,x
      009205 35 0A 00 0B      [ 1]  263 	mov base, #10 
      009209 CD 95 EE         [ 4]  264 	call prt_acc24 
      00920C A6 2E            [ 1]  265 	ld a,#'.
      00920E CD 86 A5         [ 4]  266 	call putc 
      009211 A6 00            [ 1]  267 	ld a,#MINOR 
      009213 C7 00 0F         [ 1]  268 	ld acc8,a 
      009216 5F               [ 1]  269 	clrw x 
      009217 CF 00 0D         [ 2]  270 	ldw acc24,x 
      00921A CD 95 EE         [ 4]  271 	call prt_acc24
      00921D A6 0D            [ 1]  272 	ld a,#CR 
      00921F CD 86 A5         [ 4]  273 	call putc
                                    274 ;call test 
      009222 81               [ 4]  275 	ret
                                    276 
      009223                        277 warm_init:
      009223 90 AE 17 73      [ 2]  278 	ldw y,#XSTACK_EMPTY  
      009227 72 5F 00 23      [ 1]  279 	clr flags 
      00922B 72 5F 00 20      [ 1]  280 	clr loop_depth 
      00922F 35 0A 00 0B      [ 1]  281 	mov base,#10 
      009233 AE 00 00         [ 2]  282 	ldw x,#0 
      009236 CF 00 05         [ 2]  283 	ldw basicptr,x 
      009239 CF 00 01         [ 2]  284 	ldw in.w,x 
      00923C 72 5F 00 03      [ 1]  285 	clr count
      009240 81               [ 4]  286 	ret 
                                    287 
                                    288 ;---------------------------
                                    289 ; reset BASIC text variables 
                                    290 ; and clear variables 
                                    291 ;---------------------------
      009241                        292 clear_basic:
      009241 89               [ 2]  293 	pushw x 
      009242 72 5F 00 03      [ 1]  294 	clr count
      009246 72 5F 00 02      [ 1]  295 	clr in  
      00924A AE 00 90         [ 2]  296 	ldw x,#free_ram 
      00924D CF 00 1C         [ 2]  297 	ldw txtbgn,x 
      009250 CF 00 1E         [ 2]  298 	ldw txtend,x 
      009253 CF 00 30         [ 2]  299 	ldw dvar_bgn,x 
      009256 CF 00 32         [ 2]  300 	ldw dvar_end,x 
      009259 CD 91 A1         [ 4]  301 	call clear_vars 
      00925C 72 5F 00 34      [ 1]  302 	clr chain_level
      009260 85               [ 2]  303 	popw x
      009261 81               [ 4]  304 	ret 
                                    305 
                                    306 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    307 ;;   Tiny BASIC error messages     ;;
                                    308 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009262                        309 err_msg:
      009262 00 00 92 88 92 9F 92   310 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             AD 92 C6 92 D5
      00926E 92 EB 93 01 93 1B 93   311 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             2C 93 3D
      009278 93 49 93 7C 93 8C 93   312 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal  A0-Bits]



             20 13 33
      009280 93 B3 93 C0 93 CA      313 	.word err_overflow,err_read_only,err_not_program  
                                    314 
      009286 93 E6 52 65 6A 65 63   315 err_mem_full: .asciz "Rejected, memory full\n" 
             74 65 64 2C 20 6D 65
             6D 6F 72 79 20 66 75
             6C 6C
      00929D 0A 00 73 79 6E 74 61   316 err_syntax: .asciz "syntax error\n" 
             78 20 65 72 72 6F 72
      0092AB 0A 00 6D 61 74 68 20   317 err_math_ovf: .asciz "math operation overflow\n"
             6F 70 65 72 61 74 69
             6F 6E 20 6F 76 65 72
             66 6C 6F 77
      0092C4 0A 00 64 69 76 69 73   318 err_div0: .asciz "division by 0\n" 
             69 6F 6E 20 62 79 20
             30
      0092D3 0A 00 69 6E 76 61 6C   319 err_no_line: .asciz "invalid line number.\n"
             69 64 20 6C 69 6E 65
             20 6E 75 6D 62 65 72
             2E
      0092E9 0A 00 72 75 6E 20 74   320 err_run_only: .asciz "run time only usage.\n" 
             69 6D 65 20 6F 6E 6C
             79 20 75 73 61 67 65
             2E
      0092FF 0A 00 63 6F 6D 6D 61   321 err_cmd_only: .asciz "command line only usage.\n"
             6E 64 20 6C 69 6E 65
             20 6F 6E 6C 79 20 75
             73 61 67 65 2E
      009319 0A 00 64 75 70 6C 69   322 err_duplicate: .asciz "duplicate name.\n"
             63 61 74 65 20 6E 61
             6D 65 2E
      00932A 0A 00 46 69 6C 65 20   323 err_not_file: .asciz "File not found.\n"
             6E 6F 74 20 66 6F 75
             6E 64 2E
      00933B 0A 00 62 61 64 20 76   324 err_bad_value: .asciz "bad value.\n"
             61 6C 75 65 2E
      009347 0A 00 46 69 6C 65 20   325 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             69 6E 20 65 78 74 65
             6E 64 65 64 20 6D 65
             6D 6F 72 79 2C 20 63
             61 6E 27 74 20 62 65
             20 72 75 6E 20 66 72
             6F 6D 20 74 68 65 72
             65 2E
      00937A 0A 00 4E 6F 20 64 61   326 err_no_data: .asciz "No data found.\n"
             74 61 20 66 6F 75 6E
             64 2E
      00938A 0A 00 4E 6F 20 70 72   327 err_no_prog: .asciz "No program in RAM!\n"
             6F 67 72 61 6D 20 69
             6E 20 52 41 4D 21
      00939E 0A 00 46 69 6C 65 20   328 err_no_fspace: .asciz "File system full.\n" 
             73 79 73 74 65 6D 20
             66 75 6C 6C 2E
      0093B1 0A 00 42 75 66 66 65   329 err_buf_full: .asciz "Buffer full\n"
             72 20 66 75 6C 6C
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      0093BE 0A 00 6F 76 65 72 66   330 err_overflow: .asciz "overflow\n" 
             6C 6F 77
      0093C8 0A 00 63 6F 6E 73 74   331 err_read_only: .asciz "constant can't be modified\n"
             61 6E 74 20 63 61 6E
             27 74 20 62 65 20 6D
             6F 64 69 66 69 65 64
      0093E4 0A 00 6E 6F 20 70 72   332 err_not_program: .asciz "no program at this address\n"
             6F 67 72 61 6D 20 61
             74 20 74 68 69 73 20
             61 64 64 72 65 73 73
                                    333 
                                    334 ;-------------------------------------
      009400 0A 00 0A 72 75 6E 20   335 rt_msg: .asciz "\nrun time error, "
             74 69 6D 65 20 65 72
             72 6F 72 2C
      009412 20 00 0A 63 6F 6D 70   336 comp_msg: .asciz "\ncompile error, "
             69 6C 65 20 65 72 72
             6F 72 2C
      009423 20 00 6C 61 73 74 20   337 tk_id: .asciz "last token id: "
             74 6F 6B 65 6E 20 69
             64 3A
                                    338 
      0013B5                        339 syntax_error::
      009433 20 00            [ 1]  340 	ld a,#ERR_SYNTAX 
                                    341 
      009435                        342 tb_error::
      009435 A6 02 00 22 3F   [ 2]  343 	btjt flags,#FCOMP,1$
      009437 88               [ 1]  344 	push a 
      009437 72 0A 00         [ 2]  345 	ldw x, #rt_msg 
      00943A 23 3F 88         [ 4]  346 	call puts 
      00943D AE               [ 1]  347 	pop a 
      00943E 94 02 CD         [ 2]  348 	ldw x, #err_msg 
      009441 87 02 84 AE      [ 1]  349 	clr acc16 
      009445 92               [ 1]  350 	sll a
      009446 62 72 5F 00      [ 1]  351 	rlc acc16  
      00944A 0E 48 72         [ 1]  352 	ld acc8, a 
      00944D 59 00 0E C7      [ 2]  353 	addw x,acc16 
      009451 00               [ 2]  354 	ldw x,(x)
      009452 0F 72 BB         [ 4]  355 	call puts
      009455 00 0E FE         [ 2]  356 	ldw x,basicptr 
                           000000   357 .if DEBUG 
                                    358 ld a,count 
                                    359 clrw y 
                                    360 rlwa y  
                                    361 call hex_dump
                                    362 ldw x,basicptr
                                    363 .endif 
      009458 CD 87 02         [ 1]  364 	ld a,in 
      00945B CE 00 05         [ 4]  365 	call prt_basic_line
      00945E C6 00 02         [ 2]  366 	ldw x,#tk_id 
      009461 CD 9D 8D         [ 4]  367 	call puts 
      009464 AE 94 25         [ 1]  368 	ld a,in.saved 
      009467 CD               [ 1]  369 	clrw x 
      009468 87               [ 1]  370 	ld xl,a 
      009469 02 C6 00 04      [ 2]  371 	addw x,basicptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00946D 5F               [ 1]  372 	ld a,(x)
      00946E 97               [ 1]  373 	clrw x 
      00946F 72               [ 1]  374 	ld xl,a 
      009470 BB 00 05         [ 4]  375 	call prt_i16
      009473 F6 5F            [ 2]  376 	jra 6$
      0013FB                        377 1$:	
      009475 97               [ 1]  378 	push a 
      009476 CD 95 D7         [ 2]  379 	ldw x,#comp_msg
      009479 20 35 82         [ 4]  380 	call puts 
      00947B 84               [ 1]  381 	pop a 
      00947B 88 AE 94         [ 2]  382 	ldw x, #err_msg 
      00947E 14 CD 87 02      [ 1]  383 	clr acc16 
      009482 84               [ 1]  384 	sll a
      009483 AE 92 62 72      [ 1]  385 	rlc acc16  
      009487 5F 00 0E         [ 1]  386 	ld acc8, a 
      00948A 48 72 59 00      [ 2]  387 	addw x,acc16 
      00948E 0E               [ 2]  388 	ldw x,(x)
      00948F C7 00 0F         [ 4]  389 	call puts
      009492 72 BB 00         [ 2]  390 	ldw x,#tib
      009495 0E FE CD         [ 4]  391 	call puts 
      009498 87 02            [ 1]  392 	ld a,#CR 
      00949A AE 16 68         [ 4]  393 	call putc
      00949D CD 87 02         [ 2]  394 	ldw x,in.w
      0094A0 A6 0D CD         [ 4]  395 	call spaces
      0094A3 86 A5            [ 1]  396 	ld a,#'^
      0094A5 CE 00 01         [ 4]  397 	call putc 
      0094A8 CD 87 6F         [ 2]  398 6$: ldw x,#STACK_EMPTY 
      0094AB A6               [ 1]  399     ldw sp,x
                                    400 
      001434                        401 warm_start:
      0094AC 5E CD 86         [ 4]  402 	call warm_init
                                    403 ;----------------------------
                                    404 ;   BASIC interpreter
                                    405 ;----------------------------
      001437                        406 cmd_line: ; user interface 
      0094AF A5 AE            [ 1]  407 	ld a,#CR 
      0094B1 17 FF 94         [ 4]  408 	call putc 
      0094B4 A6 3E            [ 1]  409 	ld a,#'> 
      0094B4 CD 92 23         [ 4]  410 	call putc
      0094B7 CD 07 87         [ 4]  411 	call readln
      0094B7 A6 0D CD 86      [ 1]  412 	tnz count 
      0094BB A5 A6            [ 1]  413 	jreq cmd_line
      0094BD 3E CD 86         [ 4]  414 	call compile
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
      0094C0 A5 CD 88 07      [ 1]  428 	tnz count 
      0094C4 72 5D            [ 1]  429 	jreq cmd_line
                                    430 	
                                    431 ; if direct command 
                                    432 ; it's ready to interpret 
                                    433 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    434 ;; This is the interpreter loop
                                    435 ;; for each BASIC code line. 
                                    436 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      001453                        437 interpreter: 
      0094C6 00 03 27         [ 1]  438 	ld a,in 
      0094C9 ED CD 8E         [ 1]  439 	cp a,count 
      0094CC 4F 72            [ 1]  440 	jrmi interp_loop
      00145B                        441 next_line:
      0094CE 5D 00 03 27 E4   [ 2]  442 	btjf flags, #FRUN, cmd_line
      0094D3 CE 00 04         [ 2]  443 	ldw x,basicptr
      0094D3 C6 00 02 C1      [ 2]  444 	addw x,in.w 
      0094D7 00 03 2B         [ 2]  445 	cpw x,txtend 
      0094DA 20 03            [ 1]  446 	jrmi 0$
      0094DB CD 22 BC         [ 4]  447 	call cmd_end 
      0094DB 72 01 00         [ 2]  448 0$:	ldw basicptr,x ; start of next line  
      0094DE 23 D7            [ 1]  449 	ld a,(2,x)
      0094E0 CE 00 05         [ 1]  450 	ld count,a 
      0094E3 72 BB 00 01      [ 1]  451 	mov in,#3 ; skip first 3 bytes of line 
      00147B                        452 interp_loop:
      0094E7 C3 00 1E         [ 4]  453 	call next_token
      0094EA 2B 03            [ 1]  454 	cp a,#TK_NONE 
      0094EC CD A3            [ 1]  455 	jreq next_line 
      0094EE 3C CF            [ 1]  456 	cp a,#TK_CMD
      0094F0 00 05            [ 1]  457 	jrne 1$
      001486                        458 	_get_code_addr
      0094F2 E6               [ 2]    1         ldw x,(x)
      0094F3 02 C7 00 03      [ 1]    2         inc in 
      0094F7 35 03 00 02      [ 1]    3         inc in 
      0094FB FD               [ 4]  459 	call(x)
      0094FB CD 95            [ 2]  460 	jra interp_loop 
      001492                        461 1$:	 
      0094FD 8F A1            [ 1]  462 	cp a,#TK_VAR
      0094FF 00 27            [ 1]  463 	jrne 2$
      009501 D9 A1 80         [ 4]  464 	call let_var  
      009504 26 0C            [ 2]  465 	jra interp_loop 
      00149B                        466 2$:	
      009506 FE 72            [ 1]  467 	cp a,#TK_ARRAY 
      009508 5C 00            [ 1]  468 	jrne 3$
      00950A 02 72 5C         [ 4]  469 	call let_array 
      00950D 00 02            [ 2]  470 	jra interp_loop
      0014A4                        471 3$:	
      00950F FD 20            [ 1]  472 	cp a,#TK_LABEL
      009511 E9 05            [ 1]  473 	jrne 4$
      009512 CD 14 B4         [ 4]  474 	call let_dvar  
      009512 A1 85            [ 2]  475 	jra interp_loop 
      0014AD                        476 4$: 
      009514 26 05            [ 1]  477 	cp a,#TK_COLON 
      009516 CD 9A            [ 1]  478 	jreq interp_loop
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      009518 97 20 E0         [ 2]  479 5$:	jp syntax_error 
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
      00951B                        492 let_dvar:
      0014B4                        493 	_vars VSIZE 
      00951B A1 05            [ 2]    1     sub sp,#VSIZE 
      00951D 26 05            [ 2]  494 	ldw (VAR_NAME,sp),x
      00951F CD 9A            [ 1]  495 	clr (REC_LEN,sp) 
      009521 92 20 D7         [ 4]  496 	call skip_string 
      009524 CE 00 04         [ 2]  497 	ldw x,basicptr 
      009524 A1 03 26 05      [ 2]  498 	addw x,in.w 
      009528 CD               [ 1]  499 	ld a,(x)
      009529 95 34            [ 1]  500 	cp a,#TK_EQUAL 
      00952B 20 CE            [ 1]  501 	jrne 9$ 
                                    502 ; dvar assignment 
      00952D 72 5C 00 01      [ 1]  503 	inc in  
      00952D A1 09 27         [ 4]  504 	call condition  
      009530 CA CC            [ 1]  505 	cp a,#TK_INTGR 
      009532 94 35            [ 1]  506 	jreq 1$ 
      009534 CC 13 B5         [ 2]  507 0$:	jp syntax_error 
      0014D7                        508 1$: 
      009534 52 04            [ 2]  509 	ldw x,(VAR_NAME,sp) ; pointer to var name 
      009536 1F 01 0F         [ 4]  510 	call strlen 
      009539 03 CD            [ 1]  511 	add a,#REC_XTRA_BYTES
      00953B 95 A8            [ 1]  512 	ld (REC_LEN+1,sp),a 
      00953D CE 00 05         [ 4]  513 	call search_name 
      009540 72               [ 2]  514 	tnzw x 
      009541 BB 00            [ 1]  515 	jreq 0$ 
      009543 01               [ 1]  516 	ld a,(x)
      009544 F6 A1            [ 1]  517 	jrpl 2$
      009546 32 26            [ 1]  518 	ld a,#ERR_RD_ONLY 
      009548 43 72 5C         [ 2]  519 	jp tb_error 
      0014EE                        520 2$:
      00954B 00 02 CD         [ 2]  521 	addw x,(REC_LEN,sp)
      00954E 99 C5 A1         [ 2]  522 	subw x,#CELL_SIZE 
      009551 84 27 03         [ 2]  523 	ldw ptr16,x
      0014F7                        524 	_xpop 
      009554 CC 94            [ 1]    1     ld a,(y)
      009556 35               [ 1]    2     ldw x,y 
      009557 EE 01            [ 2]    3     ldw x,(1,x)
      009557 1E 01 CD 91      [ 2]    4     addw y,#CELL_SIZE 
      00955B 31 AB 05 6B      [ 4]  525 	ld [ptr16],a 
      00955F 04 CD 9B 01      [ 1]  526 	inc ptr8 
      009563 5D 27 EE F6      [ 5]  527 	ldw [ptr16],x 
      00150C                        528 9$: _drop VSIZE 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      009567 2A 05            [ 2]    1     addw sp,#VSIZE 
      009569 A6               [ 4]  529 	ret 
                                    530 
                                    531 
                                    532 ;--------------------------
                                    533 ; extract next token from
                                    534 ; token list 
                                    535 ; basicptr -> base address 
                                    536 ; in  -> offset in list array 
                                    537 ; output:
                                    538 ;   A 		token attribute
                                    539 ;   X 		*token_value 
                                    540 ;----------------------------------------
      00150F                        541 next_token::
                                    542 ;	clrw x 
      00956A 11 CC 94         [ 1]  543 	ld a,in 
      00956D 37 00 03         [ 1]  544 	ld in.saved,a ; in case "_unget_token" needed 
                                    545 ; don't replace sub by "cp a,count" 
                                    546 ; if end of line must return with A=0   	
      00956E C0 00 02         [ 1]  547 	sub a,count 
      00956E 72 FB            [ 1]  548 	jreq 9$ ; end of line 
      00151A                        549 0$: 
      009570 03 1D 00         [ 2]  550 	ldw x,basicptr 
      009573 03 CF 00 1A      [ 2]  551 	addw x,in.w 
      009577 90               [ 1]  552 	ld a,(x)
      009578 F6               [ 1]  553 	incw x
      009579 93 EE 01 72      [ 1]  554 	inc in   
      00957D A9               [ 4]  555 9$: ret 
                                    556 
                                    557 ;-------------------------
                                    558 ;  skip .asciz in BASIC line 
                                    559 ;  name 
                                    560 ;  input:
                                    561 ;     x		* string 
                                    562 ;  output:
                                    563 ;     none 
                                    564 ;-------------------------
      001528                        565 skip_string:
      00957E 00               [ 1]  566 	ld a,(x)
      00957F 03 72            [ 1]  567 	jreq 1$
      009581 C7               [ 1]  568 	incw x 
      009582 00 1A            [ 2]  569 	jra skip_string 
      009584 72               [ 1]  570 1$: incw x 	
      009585 5C 00 1B 72      [ 2]  571 	subw x,basicptr 
      009589 CF 00 1A         [ 2]  572 	ldw in.w,x 
      00958C 5B               [ 4]  573 	ret 
                                    574 
                                    575 ;---------------------
                                    576 ; extract 16 bits  
                                    577 ; address from BASIC
                                    578 ; code 
                                    579 ; input:
                                    580 ;    X    *address
                                    581 ; output:
                                    582 ;    X    address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



                                    583 ;-------------------- 
      001537                        584 get_addr:
      00958D 04               [ 2]  585 	ldw x,(x)
      00958E 81 5C 00 01      [ 1]  586 	inc in 
      00958F 72 5C 00 01      [ 1]  587 	inc in 
      00958F C6               [ 4]  588 	ret 
                                    589 
                                    590 ;--------------------
                                    591 ; extract int24_t  
                                    592 ; value from BASIC 
                                    593 ; code 
                                    594 ; input:
                                    595 ;    X   *integer 
                                    596 ; output:
                                    597 ;    A:X   int24  
                                    598 ;--------------------
      001541                        599 get_int24:
      009590 00               [ 1]  600 	ld a,(x)
      009591 02 C7            [ 2]  601 	ldw x,(1,x)
                                    602 ; skip 3 bytes 
      009593 00 04 C0 00      [ 1]  603 	inc in 
      009597 03 27 0D 01      [ 1]  604 	inc in 
      00959A 72 5C 00 01      [ 1]  605 	inc in 
      00959A CE               [ 4]  606 	ret 
                                    607 
                                    608 ;-------------------------
                                    609 ; get character from 
                                    610 ; BASIC code 
                                    611 ; input:
                                    612 ;    X   *char 
                                    613 ; output:
                                    614 ;    A    char 
                                    615 ;-------------------------
      001551                        616 get_char:
      00959B 00               [ 1]  617 	ld a,(x)
      00959C 05 72 BB 00      [ 1]  618 	inc in  
      0095A0 01               [ 4]  619     ret 
                                    620 
                                    621 ;-----------------------------------
                                    622 ; print a 16 bit integer 
                                    623 ; using variable 'base' as conversion
                                    624 ; format.
                                    625 ; input:
                                    626 ;    X       integer to print 
                                    627 ;   'base'    conversion base 
                                    628 ; output:
                                    629 ;   terminal  
                                    630 ;-----------------------------------
      001557                        631 prt_i16:
      0095A1 F6 5C 72 5C      [ 1]  632 	clr acc24 
      0095A5 00 02 81         [ 2]  633 	ldw acc16,x 
      0095A8 A6 10            [ 1]  634 	ld a,#16
      0095A8 F6 27 03         [ 1]  635 	cp a,base
      0095AB 5C 20            [ 1]  636 	jreq prt_acc24  
      0095AD FA 5C 72 B0 00   [ 2]  637 	btjf acc16,#7,prt_acc24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      0095B2 05 CF 00 01      [ 1]  638 	cpl acc24 ; sign extend 
                                    639 	
                                    640 ;------------------------------------
                                    641 ; print integer in acc24 
                                    642 ; input:
                                    643 ;	acc24 		integer to print 
                                    644 ;	'base' 		numerical base for conversion 
                                    645 ;    A 			signed||unsigned conversion
                                    646 ;  output:
                                    647 ;    A          string length
                                    648 ;------------------------------------
      00156E                        649 prt_acc24:
      0095B6 81 FF            [ 1]  650 	ld a,#255  ; signed conversion  
      0095B7 CD 15 8C         [ 4]  651     call itoa  ; conversion entier en  .asciz
      0095B7 FE               [ 1]  652 	push a 
      0095B8 72 5C 00         [ 4]  653 	call puts
      0095BB 02               [ 1]  654 	pop a 
      0095BC 72               [ 4]  655     ret	
                                    656 
                                    657 ;---------------------------------------
                                    658 ;  print value at xstack top 
                                    659 ;---------------------------------------
      001579                        660 print_top: 
      001579                        661 	_xpop 
      0095BD 5C 00            [ 1]    1     ld a,(y)
      0095BF 02               [ 1]    2     ldw x,y 
      0095C0 81 01            [ 2]    3     ldw x,(1,x)
      0095C1 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0095C1 F6 EE 01         [ 1]  662 	ld acc24,a 
      0095C4 72 5C 00         [ 2]  663 	ldw acc16,x 
      0095C7 02 72 5C         [ 4]  664 	call prt_acc24 
      0095CA 00               [ 4]  665 	ret 
                                    666 
                                    667 ;------------------------------------
                                    668 ; convert integer in acc24 to string
                                    669 ; input:
                                    670 ;   'base'	conversion base 
                                    671 ;	acc24	integer to convert
                                    672 ;   A       0=unsigned, else signed 
                                    673 ; output:
                                    674 ;   X  		pointer to first char of string
                                    675 ;   A       string length
                                    676 ;------------------------------------
                           000001   677 	SIGN=1  ; integer sign 
                           000002   678 	LEN=2 
                           000003   679 	PSTR=3
                           000004   680 	VSIZE=4 ;locals size
      00158C                        681 itoa::
      00158C                        682 	_vars VSIZE
      0095CB 02 72            [ 2]    1     sub sp,#VSIZE 
      0095CD 5C 00            [ 1]  683 	clr (LEN,sp) ; string length  
      0095CF 02 81            [ 1]  684 	clr (SIGN,sp)    ; sign
      0095D1 4D               [ 1]  685 	tnz A
      0095D1 F6 72            [ 1]  686 	jreq 1$ ; unsigned conversion  
      0095D3 5C 00 02         [ 1]  687 	ld a,base 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      0095D6 81 0A            [ 1]  688 	cp a,#10
      0095D7 26 0A            [ 1]  689 	jrne 1$
                                    690 	; base 10 string display with negative sign if bit 23==1
      0095D7 72 5F 00 0D CF   [ 2]  691 	btjf acc24,#7,1$
      0095DC 00 0E            [ 1]  692 	cpl (SIGN,sp)
      0095DE A6 10 C1         [ 4]  693 	call neg_acc24
      0015A6                        694 1$:
                                    695 ; initialize string pointer 
      0095E1 00 0B 27         [ 2]  696 	ldw x,#tib 
      0095E4 09 72 0F         [ 2]  697 	addw x,#TIB_SIZE
      0095E7 00               [ 2]  698 	decw x 
      0095E8 0E               [ 1]  699 	clr (x)
      0015AE                        700 itoa_loop:
      0095E9 04 72 53         [ 1]  701     ld a,base
      0095EC 00 0D E9         [ 4]  702     call divu24_8 ; acc24/A 
      0095EE AB 30            [ 1]  703     add a,#'0  ; remainder of division
      0095EE A6 FF            [ 1]  704     cp a,#'9+1
      0095F0 CD 96            [ 1]  705     jrmi 2$
      0095F2 0C 88            [ 1]  706     add a,#7 
      0015BC                        707 2$:	
      0095F4 CD               [ 2]  708 	decw x
      0095F5 87               [ 1]  709     ld (x),a
      0095F6 02 84            [ 1]  710 	inc (LEN,sp)
                                    711 	; if acc24==0 conversion done
      0095F8 81 00 0C         [ 1]  712 	ld a,acc24
      0095F9 CA 00 0D         [ 1]  713 	or a,acc16
      0095F9 90 F6 93         [ 1]  714 	or a,acc8
      0095FC EE 01            [ 1]  715     jrne itoa_loop
                                    716 	;conversion done, next add '$' or '-' as required
      0095FE 72 A9 00         [ 1]  717 	ld a,base 
      009601 03 C7            [ 1]  718 	cp a,#16
      009603 00 0D            [ 1]  719 	jreq 8$
      009605 CF 00            [ 1]  720 	ld a,(SIGN,sp)
      009607 0E CD            [ 1]  721     jreq 10$
      009609 95 EE            [ 1]  722     ld a,#'-
      00960B 81 02            [ 2]  723 	jra 9$ 
      00960C                        724 8$:	
      00960C 52 04            [ 1]  725 	ld a,#'$ 
      00960E 0F               [ 2]  726 9$: decw x
      00960F 02               [ 1]  727     ld (x),a
      009610 0F 01            [ 1]  728 	inc (LEN,sp)
      0015E0                        729 10$:
                                    730 ; add a space
      009612 4D               [ 2]  731 	decw x 
      009613 27 11            [ 1]  732 	ld a,#SPACE 
      009615 C6               [ 1]  733 	ld (x),a
      009616 00 0B            [ 1]  734 	ld a,(LEN,sp)
      009618 A1               [ 1]  735 	inc a 
      0015E7                        736 	_drop VSIZE
      009619 0A 26            [ 2]    1     addw sp,#VSIZE 
      00961B 0A               [ 4]  737 	ret
                                    738 
                                    739 ;------------------------------------
                                    740 ; convert alpha to uppercase
                                    741 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



                                    742 ;    a  character to convert
                                    743 ; output:
                                    744 ;    a  uppercase character
                                    745 ;------------------------------------
      0015EA                        746 to_upper::
      00961C 72 0F            [ 1]  747 	cp a,#'a
      00961E 00 0D            [ 1]  748 	jrpl 1$
      009620 05               [ 4]  749 0$:	ret
      009621 03 01            [ 1]  750 1$: cp a,#'z	
      009623 CD 82            [ 1]  751 	jrugt 0$
      009625 9D 20            [ 1]  752 	sub a,#32
      009626 81               [ 4]  753 	ret
                                    754 	
                                    755 ;------------------------------------
                                    756 ; convert pad content in integer
                                    757 ; input:
                                    758 ;    x		* .asciz to convert
                                    759 ; output:
                                    760 ;    A:X        int24_t 
                                    761 ;    acc24      int24_t
                                    762 ;------------------------------------
                                    763 	; local variables
                           000001   764 	SIGN=1 ; 1 byte, 
                           000002   765 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003   766 	TEMP=3 ; 1 byte, temporary storage
                           000004   767 	XTEMP=4 ; 2 bytes, preserve X 
                           000005   768 	VSIZE=5 ; 5 bytes reserved for local storage
      0015F6                        769 atoi24::
      0015F6                        770 	_vars VSIZE
      009626 AE 16            [ 2]    1     sub sp,#VSIZE 
      009628 68 1C            [ 2]  771 	ldw (XTEMP,sp),x 
                                    772 ; conversion made on xstack 
      00962A 00               [ 1]  773 	clr a 
      00962B 50               [ 1]  774 	clrw x 
      0015FC                        775 	_xpush 
      00962C 5A 7F 00 03      [ 2]    1     subw y,#CELL_SIZE
      00962E 90 F7            [ 1]    2     ld (y),a 
      00962E C6 00 0B         [ 2]    3     ldw (1,y),x 
      009631 CD 83            [ 1]  776 	clr (SIGN,sp)
      009633 69 AB            [ 1]  777 	ld a,#10
      009635 30 A1            [ 1]  778 	ld (BASE,sp),a ; default base decimal
      009637 3A 2B            [ 2]  779 	ldw x,(XTEMP,sp)
      009639 02               [ 1]  780 	ld a,(x)
      00963A AB 07            [ 1]  781 	jreq 9$  ; completed if 0
      00963C A1 2D            [ 1]  782 	cp a,#'-
      00963C 5A F7            [ 1]  783 	jrne 1$
      00963E 0C 02            [ 1]  784 	cpl (SIGN,sp)
      009640 C6 00            [ 2]  785 	jra 2$
      009642 0D CA            [ 1]  786 1$: cp a,#'$
      009644 00 0E            [ 1]  787 	jrne 3$
      009646 CA 00            [ 1]  788 	ld a,#16
      009648 0F 26            [ 1]  789 	ld (BASE,sp),a
      00964A E3               [ 1]  790 2$:	incw x
      00964B C6 00            [ 2]  791 	ldw (XTEMP,sp),x 
      00964D 0B               [ 1]  792 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      001624                        793 3$:	; char to digit 
      00964E A1 10            [ 1]  794 	cp a,#'a
      009650 27 08            [ 1]  795 	jrmi 4$
      009652 7B 01            [ 1]  796 	sub a,#32
      009654 27 0A            [ 1]  797 4$:	cp a,#'0
      009656 A6 2D            [ 1]  798 	jrmi 9$
      009658 20 02            [ 1]  799 	sub a,#'0
      00965A A1 0A            [ 1]  800 	cp a,#10
      00965A A6 24            [ 1]  801 	jrmi 5$
      00965C 5A F7            [ 1]  802 	sub a,#7
      00965E 0C 02            [ 1]  803 	cp a,(BASE,sp)
      009660 2A 24            [ 1]  804 	jrpl 9$
      009660 5A A6            [ 1]  805 5$:	ld (TEMP,sp),a
      009662 20 F7            [ 1]  806 	ld a,(BASE,sp)
      009664 7B 02 4C         [ 4]  807 	call mulu24_8
      001641                        808 	_xpush 
      009667 5B 04 81 03      [ 2]    1     subw y,#CELL_SIZE
      00966A 90 F7            [ 1]    2     ld (y),a 
      00966A A1 61 2A         [ 2]    3     ldw (1,y),x 
      00966D 01               [ 1]  809 	clrw x 
      00966E 81 A1            [ 1]  810 	ld a,(TEMP,sp)
      009670 7A               [ 1]  811 	rlwa x 
      00164E                        812 	_xpush 
      009671 22 FB A0 20      [ 2]    1     subw y,#CELL_SIZE
      009675 81 F7            [ 1]    2     ld (y),a 
      009676 90 EF 01         [ 2]    3     ldw (1,y),x 
      009676 52 05 1F         [ 4]  813 	call add24 
      009679 04 4F            [ 2]  814 	ldw x,(XTEMP,sp)
      00967B 5F 72            [ 2]  815 	jra 2$
      00967D A2 00            [ 1]  816 9$:	tnz (SIGN,sp)
      00967F 03 90            [ 1]  817     jreq atoi_exit
      009681 F7 90 EF         [ 4]  818     call neg24
      001665                        819 atoi_exit:
      001665                        820 	_xpop 
      009684 01 0F            [ 1]    1     ld a,(y)
      009686 01               [ 1]    2     ldw x,y 
      009687 A6 0A            [ 2]    3     ldw x,(1,x)
      009689 6B 02 1E 04      [ 2]    4     addw y,#CELL_SIZE 
      00968D F6 27 4E         [ 1]  821 	ld acc24,a 
      009690 A1 2D 26         [ 2]  822 	ldw acc16,x  
      001674                        823 	_drop VSIZE
      009693 04 03            [ 2]    1     addw sp,#VSIZE 
      009695 01               [ 4]  824 	ret
                                    825 
                                    826 
                                    827 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    828 ;;   TINY BASIC  operators,
                                    829 ;;   commands and functions 
                                    830 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    831 
                                    832 ;---------------------------------
                                    833 ; dictionary search 
                                    834 ; input:
                                    835 ;	X 		dictionary entry point, name field  
                                    836 ;   y		.asciz name to search 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



                                    837 ; output:
                                    838 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                    839 ;  X		routine address|TK_OP 
                                    840 ;---------------------------------
                           000001   841 	NLEN=1 ; cmd length 
                           000002   842 	XSAVE=2
                           000004   843 	YSAVE=4
                           000005   844 	VSIZE=5 
      001677                        845 search_dict::
      001677                        846 	_vars VSIZE 
      009696 20 08            [ 2]    1     sub sp,#VSIZE 
      009698 A1 24            [ 2]  847 	ldw (YSAVE,sp),y 
      00167B                        848 search_next:
      00969A 26 08            [ 2]  849 	ldw (XSAVE,sp),x 
                                    850 ; get name length in dictionary	
      00969C A6               [ 1]  851 	ld a,(x)
      00969D 10 6B            [ 1]  852 	and a,#0xf 
      00969F 02 5C            [ 1]  853 	ld (NLEN,sp),a  
      0096A1 1F 04            [ 2]  854 	ldw y,(YSAVE,sp) ; name pointer 
      0096A3 F6               [ 1]  855 	incw x 
      0096A4                        856 cp_loop:
      0096A4 A1 61            [ 1]  857 	ld a,(y)
      0096A6 2B 02            [ 1]  858 	jreq str_match 
      0096A8 A0 20            [ 1]  859 	tnz (NLEN,sp)
      0096AA A1 30            [ 1]  860 	jreq no_match  
      0096AC 2B               [ 1]  861 	cp a,(x)
      0096AD 30 A0            [ 1]  862 	jrne no_match 
      0096AF 30 A1            [ 1]  863 	incw y 
      0096B1 0A               [ 1]  864 	incw x
      0096B2 2B 06            [ 1]  865 	dec (NLEN,sp)
      0096B4 A0 07            [ 2]  866 	jra cp_loop 
      001697                        867 no_match:
      0096B6 11 02            [ 2]  868 	ldw x,(XSAVE,sp) 
      0096B8 2A 24 6B         [ 2]  869 	subw x,#2 ; move X to link field
      0096BB 03 7B            [ 1]  870 	push #TK_NONE 
      0096BD 02               [ 2]  871 	ldw x,(x) ; next word link 
      0096BE CD               [ 1]  872 	pop a ; TK_NONE 
      0096BF 82 BA            [ 1]  873 	jreq search_exit  ; not found  
                                    874 ;try next 
      0096C1 72 A2            [ 2]  875 	jra search_next
      0016A4                        876 str_match:
      0096C3 00 03            [ 2]  877 	ldw x,(XSAVE,sp)
      0096C5 90               [ 1]  878 	ld a,(X)
      0096C6 F7 90            [ 1]  879 	ld (NLEN,sp),a ; needed to test keyword type  
      0096C8 EF 01            [ 1]  880 	and a,#NLEN_MASK 
                                    881 ; move x to procedure address field 	
      0096CA 5F               [ 1]  882 	inc a 
      0096CB 7B 03 02         [ 1]  883 	ld acc8,a 
      0096CE 72 A2 00 03      [ 1]  884 	clr acc16 
      0096D2 90 F7 90 EF      [ 2]  885 	addw x,acc16 
      0096D6 01               [ 2]  886 	ldw x,(x) ; routine address  
                                    887 ;determine keyword type bits 7:4 
      0096D7 CD 81            [ 1]  888 	ld a,(NLEN,sp)
      0096D9 FE 1E            [ 1]  889 	and a,#KW_TYPE_MASK 
      0096DB 04               [ 1]  890 	swap a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      0096DC 20 C2            [ 1]  891 	add a,#128
      0016BF                        892 search_exit: 
      0016BF                        893 	_drop VSIZE 
      0096DE 0D 01            [ 2]    1     addw sp,#VSIZE 
      0096E0 27               [ 4]  894 	ret 
                                    895 
                                    896 ;--------------------------------
                                    897 ;  called by command that should 
                                    898 ;  be invoked only from command 
                                    899 ;  line.
                                    900 ;  Display an error if 
                                    901 ;  invoked from program.
                                    902 ;---------------------------------
      0016C2                        903 cmd_line_only:
      0096E1 03 CD 82 83 05   [ 2]  904 	btjf flags,#FRUN,0$
      0096E5 A6 07            [ 1]  905 	ld a,#ERR_CMD_ONLY
      0096E5 90 F6 93         [ 2]  906 	jp tb_error 
      0096E8 EE               [ 4]  907 0$: ret 
                                    908 
                                    909 ;--------------------------------
                                    910 ; called by command/function that 
                                    911 ; should be invoked only at run time
                                    912 ; Display an error if invoked from 
                                    913 ; command line. 
                                    914 ;---------------------------------
      0016CD                        915 runtime_only:
      0096E9 01 72 A9 00 03   [ 2]  916 	btjt flags,#FRUN,0$ 
      0096EE C7 00            [ 1]  917 	ld a,#ERR_RUN_ONLY
      0096F0 0D CF 00         [ 2]  918 	jp tb_error 
      0096F3 0E               [ 4]  919 0$:	ret 
                                    920 
                                    921 ;---------------------
                                    922 ; check if next token
                                    923 ;  is of expected type 
                                    924 ; input:
                                    925 ;   A 		 expected token attribute
                                    926 ;  ouput:
                                    927 ;   none     if fail call syntax_error 
                                    928 ;--------------------
      0016D8                        929 expect:
      0096F4 5B               [ 1]  930 	push a 
      0096F5 05 81 0F         [ 4]  931 	call next_token 
      0096F7 11 01            [ 1]  932 	cp a,(1,sp)
      0096F7 52 05            [ 1]  933 	jreq 1$
      0096F9 17 04 B5         [ 2]  934 	jp syntax_error
      0096FB 84               [ 1]  935 1$: pop a 
      0096FB 1F               [ 4]  936 	ret 
                                    937 
                                    938 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    939 ; parse arguments list 
                                    940 ; between ()
                                    941 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016E5                        942 func_args:
      0096FC 02 F6            [ 1]  943 	ld a,#TK_LPAREN 
      0096FE A4 0F 6B         [ 4]  944 	call expect 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



                                    945 ; expected to continue in arg_list 
                                    946 ; caller must check for TK_RPAREN 
                                    947 
                                    948 ;-------------------------------
                                    949 ; parse embedded BASIC routines 
                                    950 ; arguments list.
                                    951 ; arg_list::=  expr[','expr]*
                                    952 ; all arguments are of int24_t type
                                    953 ; and pushed on stack 
                                    954 ; input:
                                    955 ;   none
                                    956 ; output:
                                    957 ;   xstack{n}   arguments pushed on xstack
                                    958 ;   A 	number of arguments pushed on xstack  
                                    959 ;--------------------------------
      0016EA                        960 arg_list:
      009701 01 16            [ 1]  961 	push #0
      009703 04 5C 45         [ 4]  962 1$:	call condition 
      009705 4D               [ 1]  963 	tnz a 
      009705 90 F6            [ 1]  964 	jreq 7$  
      009707 27 1B            [ 1]  965 	inc (1,sp)
      009709 0D 01 27         [ 4]  966 	call next_token 
      00970C 0A F1            [ 1]  967 	cp a,#TK_COMMA 
      00970E 26 07            [ 1]  968 	jreq 1$ 
      009710 90 5C            [ 1]  969 	cp a,#TK_RPAREN
      009712 5C 0A            [ 1]  970 	jreq 7$
      0016FF                        971 	_unget_token 
      009714 01 20 EE 00 01   [ 1]    1      mov in,in.saved  
      009717 84               [ 1]  972 7$:	pop a  
      009717 1E               [ 4]  973 	ret 
                                    974 
                                    975 ;--------------------------------
                                    976 ;   BASIC commnands 
                                    977 ;--------------------------------
                                    978 
                                    979 ;--------------------------------
                                    980 ;  arithmetic and relational 
                                    981 ;  routines
                                    982 ;  operators precedence
                                    983 ;  highest to lowest
                                    984 ;  operators on same row have 
                                    985 ;  same precedence and are executed
                                    986 ;  from left to right.
                                    987 ;	'*','/','%'
                                    988 ;   '-','+'
                                    989 ;   '=','>','<','>=','<=','<>','><'
                                    990 ;   '<>' and '><' are equivalent for not equal.
                                    991 ;--------------------------------
                                    992 
                                    993 ;---------------------
                                    994 ; return array element
                                    995 ; address from @(expr)
                                    996 ; input:
                                    997 ;   A 		TK_ARRAY
                                    998 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



                                    999 ;	X 		element address 
                                   1000 ;----------------------
      001706                       1001 get_array_element:
      009718 02 1D 00         [ 4] 1002 	call func_args 
      00971B 02 4B            [ 1] 1003 	cp a,#1
      00971D 00 FE            [ 1] 1004 	jreq 1$
      00971F 84 27 1D         [ 2] 1005 	jp syntax_error
      001710                       1006 1$: _xpop 
      009722 20 D7            [ 1]    1     ld a,(y)
      009724 93               [ 1]    2     ldw x,y 
      009724 1E 02            [ 2]    3     ldw x,(1,x)
      009726 F6 6B 01 A4      [ 2]    4     addw y,#CELL_SIZE 
                                   1007     ; ignore A, index < 65536 in any case 
                                   1008 	; check for bounds 
      00972A 0F 4C C7         [ 2] 1009 	cpw x,array_size 
      00972D 00 0F            [ 2] 1010 	jrule 3$
                                   1011 ; bounds {1..array_size}	
      00972F 72 5F            [ 1] 1012 2$: ld a,#ERR_BAD_VALUE 
      009731 00 0E 72         [ 2] 1013 	jp tb_error 
      009734 BB               [ 2] 1014 3$: tnzw  x
      009735 00 0E            [ 1] 1015 	jreq 2$ 
      009737 FE 7B            [ 1] 1016 	ld a,#CELL_SIZE  
      009739 01               [ 4] 1017 	mul x,a 
      00973A A4 F0 4E         [ 2] 1018 	ldw acc16,x   
      00973D AB 80 68         [ 2] 1019 	ldw x,#tib ; array is below tib 
      00973F 72 B0 00 0D      [ 2] 1020 	subw x,acc16 
      00973F 5B               [ 4] 1021 	ret 
                                   1022 
                                   1023 
                                   1024 ;***********************************
                                   1025 ;   expression parse,execute 
                                   1026 ;***********************************
                                   1027 ;-----------------------------------
                                   1028 ; factor ::= ['+'|'-'|e]  var | @ |
                                   1029 ;			 integer | function |
                                   1030 ;			 '('relation')' 
                                   1031 ; output:
                                   1032 ;   A       token attribute 
                                   1033 ;   xstack  value  
                                   1034 ; ---------------------------------
                           000001  1035 	NEG=1
                           000001  1036 	VSIZE=1
      001734                       1037 factor:
      001734                       1038 	_vars VSIZE 
      009740 05 81            [ 2]    1     sub sp,#VSIZE 
      009742 0F 01            [ 1] 1039 	clr (NEG,sp)
      009742 72 01 00         [ 4] 1040 	call next_token
      009745 23               [ 1] 1041 	tnz a 
      009746 05 A6            [ 1] 1042 	jrne 1$ 
      009748 07 CC 94         [ 2] 1043 	jp 22$ 
      00974B 37 81            [ 1] 1044 1$:	cp a,#TK_PLUS 
      00974D 27 06            [ 1] 1045 	jreq 2$
      00974D 72 00            [ 1] 1046 	cp a,#TK_MINUS 
      00974F 00 23            [ 1] 1047 	jrne 4$ 
      009751 05 A6            [ 1] 1048 	cpl (NEG,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      00174B                       1049 2$:	
      009753 06 CC 94         [ 4] 1050 	call next_token
      00174E                       1051 4$:
      009756 37               [ 1] 1052 	tnz a 
      009757 81 03            [ 1] 1053 	jrne 41$ 
      009758 CC 13 B5         [ 2] 1054 	jp syntax_error  
      001754                       1055 41$:	
      009758 88 CD            [ 1] 1056 	cp a,#TK_IFUNC 
      00975A 95 8F            [ 1] 1057 	jrne 5$ 
      001758                       1058 	_get_code_addr 
      00975C 11               [ 2]    1         ldw x,(x)
      00975D 01 27 03 CC      [ 1]    2         inc in 
      009761 94 35 84 81      [ 1]    3         inc in 
      009765 FD               [ 4] 1059 	call (x); result in A:X  
      009765 A6 06            [ 2] 1060 	jra 18$ 
      001764                       1061 5$:
      009767 CD 97            [ 1] 1062 	cp a,#TK_INTGR
      009769 58 05            [ 1] 1063 	jrne 6$
      00976A CD 15 41         [ 4] 1064 	call get_int24 ; A:X
      00976A 4B 00            [ 2] 1065 	jra 18$
      00176D                       1066 6$:
      00976C CD 99            [ 1] 1067 	cp a,#TK_ARRAY
      00976E C5 4D            [ 1] 1068 	jrne 7$
      009770 27 12 0C         [ 4] 1069 	call get_array_element
      009773 01 CD            [ 2] 1070     jra 71$
      001776                       1071 7$:
      009775 95 8F            [ 1] 1072 	cp a,#TK_VAR 
      009777 A1 08            [ 1] 1073 	jrne 8$
      009779 27 F1 A1         [ 4] 1074 	call get_addr 
      00177D                       1075 71$: ; put value in A:X
      00977C 07               [ 1] 1076 	ld a,(x)
      00977D 27 05            [ 2] 1077 	ldw x,(1,x)
      00977F 55 00            [ 2] 1078 	jra 18$
      001782                       1079 8$:
      009781 04 00            [ 1] 1080 	cp a,#TK_LABEL 
      009783 02 84            [ 1] 1081 	jrne 9$
      009785 81 89            [ 2] 1082 	pushw y  
      009786 89               [ 2] 1083 	pushw x 
      009786 CD 97 65         [ 4] 1084 	call skip_string
      009789 A1               [ 2] 1085 	popw x  
      00978A 01 27 03         [ 4] 1086 	call strlen 
      00978D CC 94            [ 1] 1087 	add a,#REC_XTRA_BYTES
      00978F 35 90 F6         [ 4] 1088 	call search_name
      009792 93               [ 2] 1089 	tnzw x 
      009793 EE 01            [ 1] 1090 	jrne 82$ 
      009795 72 A9            [ 2] 1091 	popw y 
      009797 00 03            [ 2] 1092 	jra 16$
      00179C                       1093 82$:
      009799 C3 00            [ 2] 1094 	popw y   
      00979B 21 23 05         [ 4] 1095 	call get_value ; in A:X 
      00979E A6 0A            [ 2] 1096 	jra 18$
      0017A3                       1097 9$: 
      0097A0 CC 94            [ 1] 1098 	cp a,#TK_CFUNC 
      0097A2 37 5D            [ 1] 1099 	jrne 12$
      0017A7                       1100 	_get_code_addr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      0097A4 27               [ 2]    1         ldw x,(x)
      0097A5 F8 A6 03 42      [ 1]    2         inc in 
      0097A9 CF 00 0E AE      [ 1]    3         inc in 
      0097AD 16               [ 4] 1101 	call(x)
      0097AE 68               [ 1] 1102 	clrw x 
      0097AF 72               [ 1] 1103 	rlwa x  ; char>int24 in A:X 
      0097B0 B0 00            [ 2] 1104 	jra 18$ 	 
      0017B5                       1105 12$:			
      0097B2 0E 81            [ 1] 1106 	cp a,#TK_LPAREN
      0097B4 26 13            [ 1] 1107 	jrne 16$
      0097B4 52 01 0F         [ 4] 1108 	call expression
      0097B7 01 CD            [ 1] 1109 	ld a,#TK_RPAREN 
      0097B9 95 8F 4D         [ 4] 1110 	call expect
      0017C1                       1111 	_xpop 
      0097BC 26 03            [ 1]    1     ld a,(y)
      0097BE CC               [ 1]    2     ldw x,y 
      0097BF 98 66            [ 2]    3     ldw x,(1,x)
      0097C1 A1 10 27 06      [ 2]    4     addw y,#CELL_SIZE 
      0097C5 A1 11            [ 2] 1112 	jra 18$	
      0017CC                       1113 16$:
      0017CC                       1114 	_unget_token 
      0097C7 26 05 03 01 01   [ 1]    1      mov in,in.saved  
      0097CB 4F               [ 1] 1115 	clr a 
      0097CB CD 95            [ 2] 1116 	jra 22$ 
      0017D4                       1117 18$: 
      0097CD 8F 01            [ 1] 1118 	tnz (NEG,sp)
      0097CE 27 03            [ 1] 1119 	jreq 20$
      0097CE 4D 26 03         [ 4] 1120 	call neg_ax   
      0017DB                       1121 20$:
      0017DB                       1122 	_xpush 
      0097D1 CC 94 35 03      [ 2]    1     subw y,#CELL_SIZE
      0097D4 90 F7            [ 1]    2     ld (y),a 
      0097D4 A1 81 26         [ 2]    3     ldw (1,y),x 
      0097D7 0C FE            [ 1] 1123 	ld a,#TK_INTGR
      0017E6                       1124 22$:
      0017E6                       1125 	_drop VSIZE
      0097D9 72 5C            [ 2]    1     addw sp,#VSIZE 
      0097DB 00               [ 4] 1126 	ret
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
      0017E9                       1137 term:
      0017E9                       1138 	_vars VSIZE
      0097DC 02 72            [ 2]    1     sub sp,#VSIZE 
                                   1139 ; first factor 	
      0097DE 5C 00 02         [ 4] 1140 	call factor
      0097E1 FD               [ 1] 1141 	tnz a 
      0097E2 20 70            [ 1] 1142 	jreq term_exit  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      0097E4                       1143 term01:	 ; check for  operator '*'|'/'|'%' 
      0097E4 A1 84 26         [ 4] 1144 	call next_token
      0097E7 05 CD            [ 1] 1145 	ld (MULOP,sp),a
      0097E9 95 C1            [ 1] 1146 	and a,#TK_GRP_MASK
      0097EB 20 67            [ 1] 1147 	cp a,#TK_GRP_MULT
      0097ED 27 09            [ 1] 1148 	jreq 1$
      0097ED A1 05            [ 1] 1149 	ld a,#TK_INTGR
      0017FE                       1150 	_unget_token 
      0097EF 26 05 CD 97 86   [ 1]    1      mov in,in.saved  
      0097F4 20 07            [ 2] 1151 	jra term_exit 
      0097F6                       1152 1$:	; got *|/|%
                                   1153 ;second factor
      0097F6 A1 85 26         [ 4] 1154 	call factor
      0097F9 08               [ 1] 1155 	tnz a 
      0097FA CD 95            [ 1] 1156 	jrne 2$ 
      0097FC B7 13 B5         [ 2] 1157 	jp syntax_error 
      0097FD                       1158 2$: ; select operation 	
      0097FD F6 EE            [ 1] 1159 	ld a,(MULOP,sp) 
      0097FF 01 20            [ 1] 1160 	cp a,#TK_MULT 
      009801 52 05            [ 1] 1161 	jrne 3$
                                   1162 ; '*' operator
      009802 CD 02 79         [ 4] 1163 	call mul24 
      009802 A1 03            [ 2] 1164 	jra term01
      009804 26 1D            [ 1] 1165 3$: cp a,#TK_DIV 
      009806 90 89            [ 1] 1166 	jrne 4$ 
                                   1167 ; '/' operator	
      009808 89 CD 95         [ 4] 1168 	call div24 
      00980B A8 85            [ 2] 1169 	jra term01 
      001822                       1170 4$: ; '%' operator
      00980D CD 91 31         [ 4] 1171 	call mod24
      009810 AB 05            [ 2] 1172 	jra term01 
      001827                       1173 9$: 
      009812 CD 9B            [ 1] 1174 	ld a,#TK_INTGR
      001829                       1175 term_exit:
      001829                       1176 	_drop VSIZE 
      009814 01 5D            [ 2]    1     addw sp,#VSIZE 
      009816 26               [ 4] 1177 	ret 
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
      00182C                       1188 expression:
      00182C                       1189 	_vars VSIZE 
      009817 04 90            [ 2]    1     sub sp,#VSIZE 
                                   1190 ; first term 	
      009819 85 20 30         [ 4] 1191 	call term
      00981C 4D               [ 1] 1192 	tnz a 
      00981C 90 85            [ 1] 1193 	jreq 9$
      001834                       1194 1$:	; operator '+'|'-'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      00981E CD 9A C7         [ 4] 1195 	call next_token
      009821 20 31            [ 1] 1196 	ld (OP,sp),a 
      009823 A4 30            [ 1] 1197 	and a,#TK_GRP_MASK
      009823 A1 82            [ 1] 1198 	cp a,#TK_GRP_ADD 
      009825 26 0E            [ 1] 1199 	jreq 2$ 
      00183F                       1200 	_unget_token 
      009827 FE 72 5C 00 02   [ 1]    1      mov in,in.saved  
      00982C 72 5C            [ 1] 1201 	ld a,#TK_INTGR
      00982E 00 02            [ 2] 1202 	jra 9$ 
      001848                       1203 2$: ; second term 
      009830 FD 5F 02         [ 4] 1204 	call term
      009833 20               [ 1] 1205 	tnz a 
      009834 1F 03            [ 1] 1206 	jrne 3$
      009835 CC 13 B5         [ 2] 1207 	jp syntax_error
      001851                       1208 3$:
      009835 A1 06            [ 1] 1209 	ld a,(OP,sp)
      009837 26 13            [ 1] 1210 	cp a,#TK_PLUS 
      009839 CD 98            [ 1] 1211 	jrne 4$
                                   1212 ; '+' operator	
      00983B AC A6 07         [ 4] 1213 	call add24
      00983E CD 97            [ 2] 1214 	jra 1$ 
      00185C                       1215 4$:	; '-' operator 
      009840 58 90 F6         [ 4] 1216 	call sub24
      009843 93 EE            [ 2] 1217 	jra 1$
      001861                       1218 9$:
      001861                       1219 	_drop VSIZE 
      009845 01 72            [ 2]    1     addw sp,#VSIZE 
      009847 A9               [ 4] 1220 	ret 
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
      001864                       1231 relation: 
      001864                       1232 	_vars VSIZE
      009848 00 03            [ 2]    1     sub sp,#VSIZE 
      00984A 20 08 2C         [ 4] 1233 	call expression
      00984C 4D               [ 1] 1234 	tnz a 
      00984C 55 00            [ 1] 1235 	jreq 9$ 
                                   1236 ; expect rel_op or leave 
      00984E 04 00 02         [ 4] 1237 	call next_token 
      009851 4F 20            [ 1] 1238 	ld (RELOP,sp),a 
      009853 12 30            [ 1] 1239 	and a,#TK_GRP_MASK
      009854 A1 30            [ 1] 1240 	cp a,#TK_GRP_RELOP 
      009854 0D 01            [ 1] 1241 	jreq 2$
      009856 27 03            [ 1] 1242 	ld a,#TK_INTGR 
      001879                       1243 	_unget_token 
      009858 CD 82 95 00 01   [ 1]    1      mov in,in.saved  
      00985B 20 40            [ 2] 1244 	jra 9$ 
      001880                       1245 2$:	; expect another expression
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      00985B 72 A2 00         [ 4] 1246 	call expression
      00985E 03               [ 1] 1247 	tnz a 
      00985F 90 F7            [ 1] 1248 	jrne 3$
      009861 90 EF 01         [ 2] 1249 	jp syntax_error 
      001889                       1250 3$: 
      009864 A6 84 B8         [ 4] 1251 	call cp24 
      009866                       1252 	_xpop  
      009866 5B 01            [ 1]    1     ld a,(y)
      009868 81               [ 1]    2     ldw x,y 
      009869 EE 01            [ 2]    3     ldw x,(1,x)
      009869 52 01 CD 97      [ 2]    4     addw y,#CELL_SIZE 
      00986D B4               [ 1] 1253 	tnz a 
      00986E 4D 27            [ 1] 1254 	jrmi 4$
      009870 38 0C            [ 1] 1255 	jrne 5$
      009871 35 02 00 0E      [ 1] 1256 	mov acc8,#2 ; i1==i2
      009871 CD 95            [ 2] 1257 	jra 6$ 
      0018A0                       1258 4$: ; i1<i2
      009873 8F 6B 01 A4      [ 1] 1259 	mov acc8,#4 
      009877 30 A1            [ 2] 1260 	jra 6$
      0018A6                       1261 5$: ; i1>i2
      009879 20 27 09 A6      [ 1] 1262 	mov acc8,#1  
      0018AA                       1263 6$: ; 0=false, -1=true 
      00987D 84               [ 1] 1264 	clrw x 
      00987E 55 00 04         [ 1] 1265 	ld a, acc8  
      009881 00 02            [ 1] 1266 	and a,(RELOP,sp)
      009883 20 24            [ 1] 1267 	jreq 7$
      009885 53               [ 2] 1268 	cplw x 
      009885 CD 97            [ 1] 1269 	ld a,#255 
      0018B5                       1270 7$:	_xpush 
      009887 B4 4D 26 03      [ 2]    1     subw y,#CELL_SIZE
      00988B CC 94            [ 1]    2     ld (y),a 
      00988D 35 EF 01         [ 2]    3     ldw (1,y),x 
      00988E A6 84            [ 1] 1271 	ld a,#TK_INTGR
      0018C0                       1272 9$: 
      0018C0                       1273 	_drop VSIZE
      00988E 7B 01            [ 2]    1     addw sp,#VSIZE 
      009890 A1               [ 4] 1274 	ret 
                                   1275 
                                   1276 ;-------------------------------------------
                                   1277 ;  AND factor:  [NOT] relation | (condition)
                                   1278 ;  output:
                                   1279 ;     A      TK_INTGR|0
                                   1280 ;-------------------------------------------
                           000001  1281 	NOT_OP=1
      0018C3                       1282 and_factor:
      009891 20 26            [ 1] 1283 	push #0 
      009893 05 CD 82         [ 4] 1284 0$:	call next_token  
      009896 F9               [ 1] 1285 	tnz a 
      009897 20 D8            [ 1] 1286 	jreq 8$ 
      009899 A1 21            [ 1] 1287 	cp a,#TK_NOT 
      00989B 26 05            [ 1] 1288 	jrne 1$ 
      00989D CD 83            [ 1] 1289 	cpl (NOT_OP,sp)
      00989F 87 20            [ 2] 1290 	jra 0$ 
      0018D3                       1291 1$:	
      0098A1 CF 06            [ 1] 1292 	cp a,#TK_LPAREN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      0098A2 26 0A            [ 1] 1293 	jrne 2$
      0098A2 CD 84 21         [ 4] 1294 	call condition
      0098A5 20 CA            [ 1] 1295 	ld a,#TK_RPAREN 
      0098A7 CD 16 D8         [ 4] 1296 	call expect
      0098A7 A6 84            [ 2] 1297 	jra 3$
      0098A9                       1298 2$: _unget_token 
      0098A9 5B 01 81 00 01   [ 1]    1      mov in,in.saved  
      0098AC CD 18 64         [ 4] 1299 	call relation
      0018E9                       1300 3$:
      0098AC 52 01            [ 1] 1301 	tnz (NOT_OP,sp)
      0098AE CD 98            [ 1] 1302 	jreq 8$ 
      0098B0 69 4D 27         [ 4] 1303 	call cpl24
      0018F0                       1304 8$:
      0018F0                       1305 	_drop 1  
      0098B3 2D 01            [ 2]    1     addw sp,#1 
      0098B4 81               [ 4] 1306     ret 
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
      0018F3                       1317 and_cond:
      0098B4 CD 95 8F         [ 4] 1318 	call and_factor
      0098B7 6B               [ 1] 1319 	tnz a 
      0098B8 01 A4            [ 1] 1320 	jreq 9$  
      0098BA 30 A1 10         [ 4] 1321 1$: call next_token 
      0098BD 27               [ 1] 1322 	tnz a 
      0098BE 09 55            [ 1] 1323 	jreq 6$ 
      0098C0 00 04            [ 1] 1324 	cp a,#TK_AND 
      0098C2 00 02            [ 1] 1325 	jreq 3$
      001903                       1326 	_unget_token 
      0098C4 A6 84 20 19 01   [ 1]    1      mov in,in.saved  
      0098C8 20 38            [ 2] 1327 	jra 6$ 
      0098C8 CD 98 69         [ 4] 1328 3$:	call and_factor  
      0098CB 4D               [ 1] 1329 	tnz a 
      0098CC 26 03            [ 1] 1330 	jrne 4$
      0098CE CC 94 35         [ 2] 1331 	jp syntax_error 
      0098D1                       1332 4$:	
      001913                       1333 	_xpop 
      0098D1 7B 01            [ 1]    1     ld a,(y)
      0098D3 A1               [ 1]    2     ldw x,y 
      0098D4 10 26            [ 2]    3     ldw x,(1,x)
      0098D6 05 CD 81 FE      [ 2]    4     addw y,#CELL_SIZE 
      0098DA 20 D8 0C         [ 1] 1334 	ld acc24,a 
      0098DC CF 00 0D         [ 2] 1335 	ldw acc16,x
      001922                       1336 	_xpop 
      0098DC CD 82            [ 1]    1     ld a,(y)
      0098DE 1B               [ 1]    2     ldw x,y 
      0098DF 20 D3            [ 2]    3     ldw x,(1,x)
      0098E1 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      0098E1 5B 01 81         [ 1] 1337 	and a,acc24 
      0098E4 02               [ 1] 1338 	rlwa x 
      0098E4 52 01 CD         [ 1] 1339 	and a,acc16 
      0098E7 98               [ 1] 1340 	rlwa x 
      0098E8 AC 4D 27         [ 1] 1341 	and a,acc8 
      0098EB 54               [ 1] 1342 	rlwa x
      001937                       1343 	_xpush
      0098EC CD 95 8F 6B      [ 2]    1     subw y,#CELL_SIZE
      0098F0 01 A4            [ 1]    2     ld (y),a 
      0098F2 30 A1 30         [ 2]    3     ldw (1,y),x 
      0098F5 27 09            [ 2] 1344 	jra 1$  
      0098F7 A6 84            [ 1] 1345 6$: ld a,#TK_INTGR 
      0098F9 55               [ 4] 1346 9$:	ret 	 
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
      001945                       1360 condition:
      001945                       1361 	_vars VSIZE 
      0098FA 00 04            [ 2]    1     sub sp,#VSIZE 
      0098FC 00 02 20         [ 4] 1362 	call and_cond
      0098FF 40               [ 1] 1363 	tnz a 
      009900 27 69            [ 1] 1364 	jreq 9$ 
      009900 CD 98 AC         [ 4] 1365 1$:	call next_token 
      009903 4D 26            [ 1] 1366 	cp a,#TK_OR 
      009905 03 CC            [ 1] 1367 	jreq 2$
      009907 94 35            [ 1] 1368 	cp a,#TK_XOR
      009909 27 07            [ 1] 1369 	jreq 2$ 
      001958                       1370 	_unget_token 
      009909 CD 82 38 90 F6   [ 1]    1      mov in,in.saved  
      00990E 93 EE            [ 2] 1371 	jra 8$ 
      009910 01 72            [ 1] 1372 2$:	ld (OP,sp),a ; TK_OR|TK_XOR 
      009912 A9 00 03         [ 4] 1373 	call and_cond
      009915 4D 2B            [ 1] 1374 	cp a,#TK_INTGR 
      009917 08 26            [ 1] 1375 	jreq 3$
      009919 0C 35 02         [ 2] 1376 	jp syntax_error 
      00196B                       1377 3$:	 
      00196B                       1378 	_xpop  ; rigth arg 
      00991C 00 0F            [ 1]    1     ld a,(y)
      00991E 20               [ 1]    2     ldw x,y 
      00991F 0A 01            [ 2]    3     ldw x,(1,x)
      009920 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009920 35 04 00         [ 1] 1379 	ld acc24,a 
      009923 0F 20 04         [ 2] 1380 	ldw acc16,x 
      009926                       1381 	_xpop  ; left arg  
      009926 35 01            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      009928 00               [ 1]    2     ldw x,y 
      009929 0F 01            [ 2]    3     ldw x,(1,x)
      00992A 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00992A 5F C6            [ 1] 1382 	ld (ATMP,sp),a 
      00992C 00 0F            [ 1] 1383 	ld a,(OP,sp)
      00992E 14 01            [ 1] 1384 	cp a,#TK_XOR 
      009930 27 03            [ 1] 1385 	jreq 5$ 
      00198B                       1386 4$: ; A:X OR acc24   
      009932 53 A6            [ 1] 1387 	ld a,(ATMP,sp)
      009934 FF 72 A2         [ 1] 1388 	or a,acc24 
      009937 00               [ 1] 1389 	rlwa x 
      009938 03 90 F7         [ 1] 1390 	or a,acc16 
      00993B 90               [ 1] 1391 	rlwa x 
      00993C EF 01 A6         [ 1] 1392 	or a,acc8 
      00993F 84               [ 1] 1393 	rlwa x 
      009940 20 0E            [ 2] 1394 	jra 6$  
      00199B                       1395 5$: ; A:X XOR acc24 
      009940 5B 01            [ 1] 1396 	ld a,(ATMP,sp)
      009942 81 00 0C         [ 1] 1397 	xor a,acc24 
      009943 02               [ 1] 1398 	rlwa x 
      009943 4B 00 CD         [ 1] 1399 	xor a,acc16 
      009946 95               [ 1] 1400 	rlwa x 
      009947 8F 4D 27         [ 1] 1401 	xor a,acc8 
      00994A 25               [ 1] 1402 	rlwa x 
      0019A9                       1403 6$: _xpush
      00994B A1 87 26 04      [ 2]    1     subw y,#CELL_SIZE
      00994F 03 01            [ 1]    2     ld (y),a 
      009951 20 F2 01         [ 2]    3     ldw (1,y),x 
      009953 20 99            [ 2] 1404 	jra 1$ 
      009953 A1 06            [ 1] 1405 8$:	ld a,#TK_INTGR 
      0019B6                       1406 9$:	_drop VSIZE 
      009955 26 0A            [ 2]    1     addw sp,#VSIZE 
      009957 CD               [ 4] 1407 	ret 
                                   1408 
                                   1409 
                                   1410 ;--------------------------------------------
                                   1411 ; BASIC: HEX 
                                   1412 ; select hexadecimal base for integer print
                                   1413 ;---------------------------------------------
      0019B9                       1414 hex_base:
      009958 99 C5 A6 07      [ 1] 1415 	mov base,#16 
      00995C CD               [ 4] 1416 	ret 
                                   1417 
                                   1418 ;--------------------------------------------
                                   1419 ; BASIC: DEC 
                                   1420 ; select decimal base for integer print
                                   1421 ;---------------------------------------------
      0019BE                       1422 dec_base:
      00995D 97 58 20 08      [ 1] 1423 	mov base,#10
      009961 55               [ 4] 1424 	ret 
                                   1425 
                                   1426 ;------------------------
                                   1427 ; BASIC: FREE 
                                   1428 ; return free size in RAM 
                                   1429 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



                                   1430 ;   A:x		size 
                                   1431 ;--------------------------
      0019C3                       1432 free:
      009962 00               [ 1] 1433 	clr a 
      009963 04 00 02         [ 2] 1434 	ldw x,#tib 
      009966 CD 98 E4 31      [ 2] 1435 	subw x,dvar_end 
      009969 81               [ 4] 1436 	ret 
                                   1437 
                                   1438 ;------------------------------
                                   1439 ; BASIC: SIZE 
                                   1440 ; command that print 
                                   1441 ; program start addres and size 
                                   1442 ;------------------------------
      0019CC                       1443 cmd_size:
      009969 0D 01 27         [ 1] 1444 	push base 
      00996C 03 CD 82         [ 2] 1445 	ldw x,#PROG_ADDR 
      00996F 7A 06 82         [ 4] 1446 	call puts 
      009970 CE 00 1B         [ 2] 1447 	ldw x,txtbgn     
      009970 5B 01 81 0A      [ 1] 1448 	mov base,#16 
      009973 CD 15 57         [ 4] 1449 	call prt_i16
      009973 CD 99 43         [ 1] 1450 	pop base 
      009976 4D 27 4B         [ 2] 1451 	ldw x,#PROG_SIZE 
      009979 CD 95 8F         [ 4] 1452 	call puts 
      00997C 4D 27 43         [ 2] 1453 	ldw x,txtend 
      00997F A1 88 27 07      [ 2] 1454 	subw x,txtbgn 
      009983 55 00 04         [ 4] 1455 	call prt_i16
      009986 00 02 20         [ 2] 1456 	ldw x,#STR_BYTES 
      009989 38 CD 99         [ 4] 1457 	call puts  
      00998C 43               [ 4] 1458 	ret 
                                   1459 
                                   1460 
                                   1461 ;------------------------
                                   1462 ; BASIC: UBOUND  
                                   1463 ; return array variable size 
                                   1464 ; and set 'array_size' variable 
                                   1465 ; output:
                                   1466 ;   A:X 	array_size
                                   1467 ;--------------------------
      0019F9                       1468 ubound:
      00998D 4D 26 03         [ 4] 1469 	call free 
      009990 CC 94            [ 1] 1470 	ld a,#CELL_SIZE 
      009992 35               [ 2] 1471 	div x,a 
      009993 CF 00 20         [ 2] 1472 	ldw array_size,x
      009993 90               [ 1] 1473 	clr a 
      009994 F6               [ 4] 1474 	ret 
                                   1475 
                                   1476 ;-----------------------------
                                   1477 ; BASIC: LET var=expr 
                                   1478 ; variable assignement 
                                   1479 ; output:
                                   1480 ;   A 		TK_NONE 
                                   1481 ;-----------------------------
      001A04                       1482 let::
      009995 93 EE 01         [ 4] 1483 	call next_token 
      009998 72 A9            [ 1] 1484 	cp a,#TK_VAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      00999A 00 03            [ 1] 1485 	jreq let_var
      00999C C7 00            [ 1] 1486 	cp a,#TK_ARRAY 
      00999E 0D CF            [ 1] 1487 	jreq  let_array
      0099A0 00 0E 90         [ 2] 1488 	jp syntax_error
      001A12                       1489 let_array:
      0099A3 F6 93 EE         [ 4] 1490 	call get_array_element
      0099A6 01 72            [ 2] 1491 	jra let_eval 
      001A17                       1492 let_var:
      0099A8 A9 00 03         [ 4] 1493 	call get_addr
      001A1A                       1494 let_eval:
      0099AB C4 00 0D         [ 2] 1495 	ldw ptr16,x  ; variable address 
      0099AE 02 C4 00         [ 4] 1496 	call next_token 
      0099B1 0E 02            [ 1] 1497 	cp a,#TK_EQUAL
      0099B3 C4 00            [ 1] 1498 	jreq 1$
      0099B5 0F 02 72         [ 2] 1499 	jp syntax_error
      001A27                       1500 1$:	
      0099B8 A2 00 03         [ 4] 1501 	call condition   
      0099BB 90 F7            [ 1] 1502 	cp a,#TK_INTGR 
      0099BD 90 EF            [ 1] 1503 	jreq 2$
      0099BF 01 20 B7         [ 2] 1504 	jp syntax_error
      001A31                       1505 2$:	
      001A31                       1506 	_xpop ; value 
      0099C2 A6 84            [ 1]    1     ld a,(y)
      0099C4 81               [ 1]    2     ldw x,y 
      0099C5 EE 01            [ 2]    3     ldw x,(1,x)
      0099C5 52 02 CD 99      [ 2]    4     addw y,#CELL_SIZE 
      001A3A                       1507 3$:
      0099C9 73 4D 27 69      [ 4] 1508 	ld [ptr16],a
      0099CD CD 95 8F A1      [ 1] 1509 	inc ptr8  
      0099D1 89 27 0B A1      [ 5] 1510 	ldw [ptr16],x 
      0099D5 8A               [ 4] 1511 	ret 
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
      001A47                       1522 get_value: ; -- i 
      0099D6 27               [ 1] 1523 	ld a,(x) ; record size 
      0099D7 07 55            [ 1] 1524 	and a,#NAME_MAX_LEN
      0099D9 00 04            [ 1] 1525 	sub a,#CELL_SIZE ; * value 
      0099DB 00               [ 1] 1526 	push a 
      0099DC 02 20            [ 1] 1527 	push #0 
      0099DE 55 6B 02         [ 2] 1528 	addw x,(1,sp)
      0099E1 CD               [ 1] 1529 	ld a,(x)
      0099E2 99 73            [ 2] 1530 	ldw x,(1,x)
      001A55                       1531 	_drop 2
      0099E4 A1 84            [ 2]    1     addw sp,#2 
      0099E6 27               [ 4] 1532 	ret 
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
      001A58                       1545 func_eefree:
      0099E7 03 CC 94         [ 2] 1546 	ldw x,#EEPROM_BASE 
      0099EA 35 08 00 0E      [ 1] 1547 1$:	mov acc8,#8 ; count 8 consecutive zeros
      0099EB A3 47 F8         [ 2] 1548     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      0099EB 90 F6            [ 1] 1549 	jruge 8$ ; no free space 
      0099ED 93               [ 1] 1550 2$: ld a,(x)
      0099EE EE 01            [ 1] 1551 	jrne 3$
      0099F0 72               [ 1] 1552 	incw x 
      0099F1 A9 00 03 C7      [ 1] 1553 	dec acc8 
      0099F5 00 0D            [ 1] 1554 	jrne 2$
      0099F7 CF 00 0E         [ 2] 1555 	subw x,#8 
      0099FA 90 F6            [ 2] 1556 	jra 9$  
      0099FC 93               [ 1] 1557 3$: ld a,(x)
      0099FD EE               [ 1] 1558 	incw x
      0099FE 01               [ 1] 1559 	tnz a  
      0099FF 72 A9            [ 1] 1560 	jrne 3$
      009A01 00               [ 2] 1561 	decw x   
      009A02 03 6B            [ 2] 1562 	jra 1$ 
      009A04 01               [ 1] 1563 8$: clrw x ; no free space 
      009A05 7B               [ 1] 1564 9$: clr a 
      009A06 02 A1 8A         [ 2] 1565 	ldw free_eeprom,x ; save in system variable 
      009A09 27               [ 4] 1566 	ret 
                                   1567 
                           000005  1568 REC_XTRA_BYTES=5 
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
                                   1579 ;    A     record_len 
                                   1580 ;    X     *name
                                   1581 ; output:
                                   1582 ;    X     address|0
                                   1583 ; use:
                                   1584 ;   A,Y, acc16 
                                   1585 ;-------------------------
                           000001  1586 	NAMEPTR=1 ; target name pointer 
                           000003  1587 	WLKPTR=3   ; walking pointer in EEPROM||RAM 
                           000005  1588 	RECLEN=5  ; record length of target
                           000007  1589 	LIMIT=7   ; search area limit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



                           000008  1590 	VSIZE=8  
      001A81                       1591 search_name:
      009A0A 10 89            [ 2] 1592 	pushw y 
      009A0B                       1593 	_vars VSIZE
      009A0B 7B 01            [ 2]    1     sub sp,#VSIZE 
      009A0D CA 00 0D 02      [ 1] 1594 	clr acc16 
      009A11 CA 00            [ 1] 1595 	ld (RECLEN,sp),a    
      009A13 0E 02            [ 2] 1596 	ldw (NAMEPTR,sp),x
      009A15 CA 00 0F         [ 2] 1597 	ldw x,dvar_end 
      009A18 02 20            [ 2] 1598 	ldw (LIMIT,sp),x 
      009A1A 0E CE 00 2F      [ 2] 1599 	ldw y,dvar_bgn
      009A1B 17 03            [ 2] 1600 1$:	ldw (WLKPTR,sp),y
      009A1B 7B               [ 1] 1601 	ldw x,y 
      009A1C 01 C8            [ 2] 1602 	cpw x, (LIMIT,sp) 
      009A1E 00 0D            [ 1] 1603 	jruge 7$ ; no match found 
      009A20 02 C8            [ 1] 1604 	ld a,(y)
      009A22 00 0E            [ 1] 1605 	and a,#NAME_MAX_LEN
      009A24 02 C8            [ 1] 1606 	cp a,(RECLEN,sp)
      009A26 00 0F            [ 1] 1607 	jrne 2$ 
      009A28 02 72            [ 1] 1608 	incw y 
      009A2A A2 00            [ 2] 1609 	ldw x,(NAMEPTR,sp)
      009A2C 03 90 F7         [ 4] 1610 	call strcmp
      009A2F 90 EF            [ 1] 1611 	jrne 8$ ; match found 
      001AAE                       1612 2$: ; skip this one 	
      009A31 01 20            [ 2] 1613 	ldW Y,(WLKPTR,sp)
      009A33 99 A6            [ 1] 1614 	ld a,(y)
      009A35 84 5B            [ 1] 1615 	and a,#NAME_MAX_LEN 
      009A37 02 81 0E         [ 1] 1616 	ld acc8,a 
      009A39 72 B9 00 0D      [ 2] 1617 	addw y,acc16 
      009A39 35 10            [ 2] 1618 	jra 1$  
      001ABD                       1619 7$: ; no match found 
      009A3B 00 0B            [ 1] 1620 	clr (WLKPTR,sp)
      009A3D 81 04            [ 1] 1621 	clr (WLKPTR+1,sp)
      009A3E                       1622 8$: ; match found 
      009A3E 35 0A            [ 2] 1623 	ldw x,(WLKPTR,sp) ; record address 
      001AC3                       1624 9$:	_DROP VSIZE
      009A40 00 0B            [ 2]    1     addw sp,#VSIZE 
      009A42 81 85            [ 2] 1625 	popw y 
      009A43 81               [ 4] 1626 	 ret 
                                   1627 
                                   1628 ;--------------------------------------------
                                   1629 ; BASIC: CONST name=value [, name=value]*
                                   1630 ; define constant(s) saved in EEPROM
                                   1631 ; share most of his code with cmd_dim 
                                   1632 ;--------------------------------------------
                           000001  1633 	VAR_NAME=1 
                           000003  1634 	REC_LEN=3
                           000005  1635 	RONLY=5
                           000005  1636 	VSIZE=5
      001AC8                       1637 cmd_const:
      009A43 4F AE 16         [ 4] 1638 	call runtime_only
      001ACB                       1639 	_vars VSIZE 
      009A46 68 72            [ 2]    1     sub sp,#VSIZE 
      009A48 B0 00            [ 1] 1640 	ld a,#128 
      009A4A 32 81            [ 1] 1641 	ld (RONLY,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      009A4C 0F 03            [ 1] 1642 	clr (REC_LEN,sp)
      009A4C 3B 00            [ 2] 1643 	jra cmd_dim2 ; shared code with cmd_dim  
                                   1644 
                                   1645 ;---------------------------------
                                   1646 ; BASIC: DIM var_name [var_name]* 
                                   1647 ; create named variables at end 
                                   1648 ; of BASIC program. 
                                   1649 ; These variables are initialized 
                                   1650 ; to 0. 
                                   1651 ; record format same ast CONST 
                                   1652 ; but r/w because stored in RAM 
                                   1653 ;---------------------------------
      001AD5                       1654 cmd_dim:
      009A4E 0B AE 9C         [ 4] 1655 	call runtime_only
      001AD8                       1656 cmd_dim1:	
      001AD8                       1657 	_vars VSIZE
      009A51 2B CD            [ 2]    1     sub sp,#VSIZE 
      009A53 87 02            [ 1] 1658 	clr (REC_LEN,sp )
      009A55 CE 00            [ 1] 1659 	clr (RONLY,sp)
      001ADE                       1660 cmd_dim2: 
      009A57 1C 35 10         [ 4] 1661 0$:	call next_token 
      009A5A 00 0B            [ 1] 1662 	cp a,#TK_LABEL  
      009A5C CD 95            [ 1] 1663 	jreq 1$ 
      009A5E D7 32 00         [ 2] 1664 	jp syntax_error 
      009A61 0B AE            [ 2] 1665 1$: ldw (VAR_NAME,sp),x ; name pointer 
      009A63 9C 3D CD         [ 4] 1666 	call strlen
      009A66 87 02            [ 1] 1667 	add a,#REC_XTRA_BYTES
      009A68 CE 00            [ 1] 1668 	ld (REC_LEN+1,sp),a
      009A6A 1E 72 B0         [ 4] 1669 	call skip_string 
      009A6D 00 1C            [ 1] 1670 	ld a,(REC_LEN+1,sp)
      009A6F CD 95            [ 2] 1671 	ldw x,(VAR_NAME,sp) 
      009A71 D7 AE 9C         [ 4] 1672 	call search_name  
      009A74 4E               [ 2] 1673 	tnzw x 
      009A75 CD 87            [ 1] 1674 	jreq 2$
      009A77 02 81            [ 1] 1675 	ld a,#ERR_DUPLICATE
      009A79 CC 13 B7         [ 2] 1676 	jp tb_error  
      009A79 CD 9A 43         [ 2] 1677 2$:	ldw x,dvar_end 
      009A7C A6 03            [ 1] 1678 	ld a,(REC_LEN+1,sp)
      009A7E 62 CF            [ 1] 1679 	or a,(RONLY,sp)
      009A80 00               [ 1] 1680 	ld (x),a 
      009A81 21               [ 1] 1681 	incw x 
      009A82 4F 81            [ 2] 1682 	pushw y 
      009A84 16 03            [ 2] 1683 	ldw y,(VAR_NAME+2,sp)
      009A84 CD 95 8F         [ 4] 1684 	call strcpy
      009A87 A1 85            [ 2] 1685 	popw y 
      009A89 27               [ 2] 1686 	decw x
      009A8A 0C A1 05         [ 2] 1687 	addw x,(REC_LEN,sp)
      009A8D 27 03 CC         [ 2] 1688 	ldw dvar_end,x 
      009A90 94 35 03         [ 2] 1689 	subw x,#CELL_SIZE  
      009A92 7F               [ 1] 1690 	clr (x)
      009A92 CD 97            [ 1] 1691 	clr (1,x)  
      009A94 86 20            [ 1] 1692 	clr (2,x)
      009A96 03 15 0F         [ 4] 1693 4$: call next_token 
      009A97 A1 08            [ 1] 1694 	cp a,#TK_COMMA 
      009A97 CD 95            [ 1] 1695 	jreq 0$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      009A99 B7 32            [ 1] 1696 	cp a,#TK_EQUAL 
      009A9A 26 2A            [ 1] 1697 	jrne 8$
                                   1698 ; initialize variable 
      009A9A CF 00 1A         [ 4] 1699 	call condition 
      009A9D CD 95            [ 1] 1700 	cp a,#TK_INTGR
      009A9F 8F A1            [ 1] 1701 	jreq 5$
      009AA1 32 27 03         [ 2] 1702 	jp syntax_error
      009AA4 CC 94 35         [ 2] 1703 5$: ldw x,dvar_end 
      009AA7 1D 00 03         [ 2] 1704 	subw x,#CELL_SIZE 
      009AA7 CD 99 C5         [ 2] 1705 	ldw ptr16,x 
      001B42                       1706 	_xpop 
      009AAA A1 84            [ 1]    1     ld a,(y)
      009AAC 27               [ 1]    2     ldw x,y 
      009AAD 03 CC            [ 2]    3     ldw x,(1,x)
      009AAF 94 35 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009AB1 72 C7 00 19      [ 4] 1707 	ld [ptr16],a 
      009AB1 90 F6 93 EE      [ 1] 1708 	inc ptr8 
      009AB5 01 72 A9 00      [ 5] 1709 	ldw [ptr16],x 
      009AB9 03 CB            [ 2] 1710 	jra 4$ 
      009ABA                       1711 8$:	
      001B59                       1712 	_unget_token 	
      009ABA 72 C7 00 1A 72   [ 1]    1      mov in,in.saved  
      001B5E                       1713 	_drop VSIZE 
      009ABF 5C 00            [ 2]    1     addw sp,#VSIZE 
      009AC1 1B 72 CF         [ 4] 1714 	call ubound 
      009AC4 00               [ 4] 1715 	ret 
                                   1716 
                                   1717 
                                   1718 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1719 ; return program size 
                                   1720 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001B64                       1721 prog_size:
      009AC5 1A 81 1D         [ 2] 1722 	ldw x,txtend 
      009AC7 72 B0 00 1B      [ 2] 1723 	subw x,txtbgn 
      009AC7 F6               [ 4] 1724 	ret 
                                   1725 
                                   1726 ;----------------------------
                                   1727 ; print program information 
                                   1728 ;---------------------------
      001B6C                       1729 program_info: 
      009AC8 A4 0F A0         [ 2] 1730 	ldw x,#PROG_ADDR 
      009ACB 03 88 4B         [ 4] 1731 	call puts 
      009ACE 00 72 FB         [ 2] 1732 	ldw x,txtbgn 
      009AD1 01 F6 EE 01      [ 1] 1733 	mov base,#16 
      009AD5 5B 02 81         [ 4] 1734 	call prt_i16
      009AD8 35 0A 00 0A      [ 1] 1735 	mov base,#10  
      009AD8 AE 40 00         [ 2] 1736 	ldw x,#PROG_SIZE
      009ADB 35 08 00         [ 4] 1737 	call puts 
      009ADE 0F A3 47         [ 4] 1738 	call prog_size 
      009AE1 F8 24 17         [ 4] 1739 	call prt_i16 
      009AE4 F6 26 0C         [ 2] 1740 	ldw x,#STR_BYTES 
      009AE7 5C 72 5A         [ 4] 1741 	call puts
      009AEA 00 0F 26         [ 2] 1742 	ldw x,txtbgn
      009AED F6 1D 00         [ 2] 1743 	cpw x,#app 
      009AF0 08 20            [ 1] 1744 	jrult 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      009AF2 09 F6 5C         [ 2] 1745 	ldw x,#FLASH_MEM 
      009AF5 4D 26            [ 2] 1746 	jra 3$
      009AF7 FB 5A 20         [ 2] 1747 2$: ldw x,#RAM_MEM 	 
      009AFA E0 5F 4F         [ 4] 1748 3$:	call puts 
      009AFD CF 00            [ 1] 1749 	ld a,#CR 
      009AFF 24 81 25         [ 4] 1750 	call putc
      009B01 81               [ 4] 1751 	ret 
                                   1752 
      009B01 90 89 52 08 72 5F 00  1753 PROG_ADDR: .asciz "program address: "
             0E 6B 05 1F 01 CE 00
             32 1F 07 90
      009B13 CE 00 30 17 03 93 13  1754 PROG_SIZE: .asciz ", program size: "
             07 24 20 90 F6 A4 0F
             11 05 26
      009B24 09 90 5C 1E 01 CD 91  1755 STR_BYTES: .asciz " bytes" 
      009B2B 3C 26 13 20 46 4C 41  1756 FLASH_MEM: .asciz " in FLASH memory" 
             53 48 20 6D 65 6D 6F
             72 79 00
      009B2E 20 69 6E 20 52 41 4D  1757 RAM_MEM:   .asciz " in RAM memory" 
             20 6D 65 6D 6F 72 79
             00
                                   1758 
                                   1759 
                                   1760 ;----------------------------
                                   1761 ; BASIC: LIST [[start][-end]]
                                   1762 ; list program lines 
                                   1763 ; form start to end 
                                   1764 ; if empty argument list then 
                                   1765 ; list all.
                                   1766 ;----------------------------
                           000001  1767 	FIRST=1
                           000003  1768 	LAST=3 
                           000005  1769 	LN_PTR=5
                           000006  1770 	VSIZE=6 
      001BF5                       1771 cmd_list:
      009B2E 16 03 90         [ 4] 1772 	call cmd_line_only
      009B31 F6 A4 0F         [ 4] 1773 	call prog_size 
      009B34 C7 00            [ 1] 1774 	jrugt 3$
      009B36 0F               [ 4] 1775 	ret 
      001BFE                       1776 3$: _vars VSIZE
      009B37 72 B9            [ 2]    1     sub sp,#VSIZE 
      009B39 00 0E 20         [ 2] 1777 	ldw x,txtbgn 
      009B3C D9 05            [ 2] 1778 	ldw (LN_PTR,sp),x 
      009B3D FE               [ 2] 1779 	ldw x,(x) 
      009B3D 0F 03            [ 2] 1780 	ldw (FIRST,sp),x ; list from first line 
      009B3F 0F 04 FF         [ 2] 1781 	ldw x,#MAX_LINENO ; biggest line number 
      009B41 1F 03            [ 2] 1782 	ldw (LAST,sp),x 
      009B41 1E 03 5B         [ 4] 1783 	call next_token 
      009B44 08 90            [ 1] 1784 	cp a,#TK_INTGR
      009B46 85 81            [ 1] 1785 	jreq start_from 
      009B48                       1786 is_minus: 	
      009B48 CD 97            [ 1] 1787 	cp a,#TK_MINUS 
      009B4A 4D 52            [ 1] 1788 	jreq end_at_line
      009B4C 05 A6            [ 1] 1789 	cp a,#TK_NONE
      009B4E 80 6B            [ 1] 1790 	jreq list_loop
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      009B50 05 0F            [ 1] 1791 	cp a,#TK_COLON 
      009B52 03 20            [ 1] 1792 	jreq list_loop
      009B54 09 13 B5         [ 2] 1793 	jp syntax_error
      009B55                       1794 start_from:	 
      009B55 CD 97 4D         [ 4] 1795 	call get_int24
      009B58 1F 01            [ 2] 1796 	ldw (FIRST,sp),x	
      001C28                       1797 lines_skip:
      009B58 52 05            [ 2] 1798 	pushw y 
      009B5A 0F               [ 1] 1799 	clr a 
      009B5B 03 0F 05         [ 4] 1800 	call search_lineno 
      009B5E 5D               [ 2] 1801 	tnzw x 
      009B5E CD 95            [ 1] 1802 	jrne 1$
      009B60 8F               [ 1] 1803 	ldw x,y 
      009B61 A1 03            [ 2] 1804 1$:	popw y 
      009B63 27 03            [ 2] 1805 	ldw (LN_PTR,sp),x 
      009B65 CC 94 35         [ 4] 1806 	call next_token 
      009B68 1F 01            [ 1] 1807 	cp a,#TK_MINUS 
      009B6A CD 91            [ 1] 1808 	jreq end_at_line 
      009B6C 31 AB            [ 1] 1809 	cp a,#TK_NONE 
      009B6E 05 6B            [ 1] 1810 	jreq 2$
      009B70 04 CD            [ 1] 1811 	cp a,#TK_COLON 
      009B72 95 A8            [ 1] 1812 	jreq 2$
      009B74 7B 04 1E         [ 2] 1813 	jp syntax_error 
      001C48                       1814 2$:
      009B77 01 CD            [ 2] 1815 	ldw x,(FIRST,sp)
      009B79 9B 01            [ 2] 1816 	ldw (LAST,sp),x 
      009B7B 5D 27            [ 2] 1817 	jra list_loop 
      001C4E                       1818 end_at_line:
                                   1819 ; expect ending line# 
      009B7D 05 A6 08         [ 4] 1820     call next_token 
      009B80 CC 94            [ 1] 1821 	cp a,#TK_INTGR
      009B82 37 CE            [ 1] 1822 	jreq 1$
      009B84 00 32            [ 1] 1823 	cp a,#TK_NONE 
      009B86 7B 04            [ 1] 1824 	jreq list_loop 
      009B88 1A 05            [ 1] 1825 	cp a,#TK_COLON 
      009B8A F7 5C            [ 1] 1826 	jreq list_loop 
      009B8C 90 89 16         [ 2] 1827 	jp syntax_error 
      001C60                       1828 1$:
      009B8F 03 CD 91         [ 4] 1829 	call get_int24 
      009B92 4D 90            [ 2] 1830 	ldw (LAST,sp),x 
                                   1831 ; print loop
      001C65                       1832 list_loop:
      009B94 85 5A            [ 2] 1833 	ldw x,(LN_PTR,sp)
      009B96 72 FB            [ 1] 1834 	ld a,(2,x) 
      009B98 03 CF 00         [ 4] 1835 	call prt_basic_line
      009B9B 32 1D            [ 2] 1836 	ldw x,(LN_PTR,sp)
      009B9D 00 03            [ 1] 1837 	ld a,(2,x)
      009B9F 7F 6F 01         [ 1] 1838 	ld acc8,a 
      009BA2 6F 02 CD 95      [ 1] 1839 	clr acc16 
      009BA6 8F A1 08 27      [ 2] 1840 	addw x,acc16
      009BAA B3 A1 32         [ 2] 1841 	cpw x,txtend 
      009BAD 26 2A            [ 1] 1842 	jrpl list_exit
      009BAF CD 99            [ 2] 1843 	ldw (LN_PTR,sp),x
      009BB1 C5               [ 2] 1844 	ldw x,(x)
      009BB2 A1 84            [ 2] 1845 	cpw x,(LAST,sp)  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      009BB4 27 03            [ 1] 1846 	jrsle list_loop
      001C87                       1847 list_exit:
      009BB6 CC 94 35 CE 00   [ 1] 1848 	mov in,count 
      009BBB 32 1D 00         [ 2] 1849 	ldw x,#pad 
      009BBE 03 CF 00         [ 2] 1850 	ldw basicptr,x 
      001C92                       1851 	_drop VSIZE 
      009BC1 1A 90            [ 2]    1     addw sp,#VSIZE 
      009BC3 F6 93 EE         [ 4] 1852 	call program_info
      009BC6 01 72 A9 00 03   [ 2] 1853 	btjf flags,#FLN_REJECTED,9$
      009BCB 72 C7 00         [ 2] 1854 	ldw x,#LINES_REJECTED
      009BCE 1A 72 5C         [ 4] 1855 	call puts
      001CA2                       1856 9$: 
      009BD1 00               [ 4] 1857 	ret
      009BD2 1B 72 CF 00 1A 20 CB  1858 LINES_REJECTED: .asciz "WARNING: lines missing in this program.\n"
             3A 20 6C 69 6E 65 73
             20 6D 69 73 73 69 6E
             67 20 69 6E 20 74 68
             69 73 20 70 72 6F 67
             72 61 6D 2E 0A 00
                                   1859 
                                   1860 ;--------------------------
                                   1861 ; BASIC: EDIT label 
                                   1862 ;  copy program in FLASH 
                                   1863 ;  to RAM for edition 
                                   1864 ;-------------------------
      009BD9                       1865 cmd_edit:
      009BD9 55 00 04         [ 4] 1866 	call cmd_line_only
      009BDC 00 02            [ 1] 1867 	ld a,#TK_LABEL 
      009BDE 5B 05 CD         [ 4] 1868 	call expect  
      009BE1 9A               [ 2] 1869 	pushw x 
      009BE2 79 81 28         [ 4] 1870 	call skip_string
      009BE4 85               [ 2] 1871 	popw x 
      009BE4 CE 00 1E         [ 4] 1872 	call search_program 
      009BE7 72 B0            [ 1] 1873     jrne 1$ 
      009BE9 00 1C 81         [ 2] 1874 	ldw x,#ERR_NO_PROGRAM
      009BEC CC 13 B7         [ 2] 1875 	jp tb_error 
      009BEC AE 9C            [ 2] 1876 1$: pushw y 
      009BEE 2B CD            [ 1] 1877 	ldw y,x ; source address 
      009BF0 87 02 CE         [ 2] 1878 	subw x,#4
      009BF3 00 1C            [ 2] 1879 	ldw x,(2,x) ; program size 
      009BF5 35 10 00         [ 2] 1880 	addw x,#4 
      009BF8 0B CD 95         [ 2] 1881 	ldw acc16,x  ; bytes to copy 
      009BFB D7 35 0A         [ 2] 1882 	ldw x,#rsign ; destination address 
      009BFE 00 0B AE 9C      [ 2] 1883 	subw y,#4 
      009C02 3D CD 87         [ 4] 1884 	call move  
      009C05 02 CD 9B         [ 2] 1885 	ldw x,#free_ram 
      009C08 E4 CD 95         [ 2] 1886 	ldw txtbgn,x 
      009C0B D7 AE 9C 4E      [ 2] 1887 	addw x,rsize  
      009C0F CD 87 02         [ 2] 1888 	ldw txtend,x
      009C12 CE 00            [ 2] 1889 	popw y  
      009C14 1C               [ 4] 1890 	ret 
                                   1891 
                                   1892 ;--------------------------
                                   1893 ; decompile line from token list
                                   1894 ; and print it. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



                                   1895 ; input:
                                   1896 ;   A       stop at this position 
                                   1897 ;   X 		pointer at line
                                   1898 ; output:
                                   1899 ;   none 
                                   1900 ;--------------------------	
      001D0D                       1901 prt_basic_line:
      009C15 A3 B4            [ 2] 1902 	pushw y 
      009C17 84 25 05         [ 1] 1903 	ld count,a 
      009C1A AE 9C            [ 1] 1904 	ld a,(2,x)
      009C1C 55 20 03         [ 1] 1905 	cp a,count 
      009C1F AE 9C            [ 1] 1906 	jrpl 1$ 
      009C21 66 CD 87         [ 1] 1907 	ld count,a 
      009C24 02 A6 0D         [ 2] 1908 1$:	ldw basicptr,x 
      009C27 CD 86 A5 81      [ 2] 1909 	ldw y,#tib  
      009C2B 70 72 6F         [ 4] 1910 	call decompile 
      009C2E 67 72 61         [ 4] 1911 	call puts 
      009C31 6D 20            [ 1] 1912 	ld a,#CR 
      009C33 61 64 64         [ 4] 1913 	call putc 
      009C36 72 65            [ 2] 1914 	popw y 
      009C38 73               [ 4] 1915 	ret 
                                   1916 
                                   1917 
                                   1918 ;---------------------------------
                                   1919 ; BASIC: PRINT|? arg_list 
                                   1920 ; print values from argument list
                                   1921 ;----------------------------------
                           000001  1922 	SEMICOL=1
                           000001  1923 	VSIZE=1
      001D31                       1924 cmd_print:
      001D31                       1925 	_vars VSIZE 
      009C39 73 3A            [ 2]    1     sub sp,#VSIZE 
      001D33                       1926 reset_semicol:
      009C3B 20 00            [ 1] 1927 	clr (SEMICOL,sp)
      001D35                       1928 prt_loop:
      009C3D 2C 20 70         [ 4] 1929 	call next_token
      009C40 72 6F            [ 1] 1930 	cp a,#CMD_END 
      009C42 67 72            [ 1] 1931 	jrult 0$
      009C44 61 6D            [ 1] 1932 	cp a,#TK_COLON 
      009C46 20 73            [ 1] 1933 	jreq 0$
      009C48 69 7A            [ 1] 1934 	cp a,#TK_CMD
      009C4A 65 3A            [ 1] 1935 	jrne 10$
      001D44                       1936 0$:
      001D44                       1937 	_unget_token 
      009C4C 20 00 20 62 79   [ 1]    1      mov in,in.saved  
      009C51 74 65            [ 2] 1938 	jra 8$ 
      001D4B                       1939 10$:	
      009C53 73 00            [ 1] 1940 	cp a,#TK_QSTR
      009C55 20 69            [ 1] 1941 	jreq 1$
      009C57 6E 20            [ 1] 1942 	cp a,#TK_CHAR 
      009C59 46 4C            [ 1] 1943 	jreq 2$ 
      009C5B 41 53            [ 1] 1944 	cp a,#TK_CFUNC 
      009C5D 48 20            [ 1] 1945 	jreq 3$
      009C5F 6D 65            [ 1] 1946 	cp a,#TK_SEMIC  
      009C61 6D 6F            [ 1] 1947 	jreq 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      009C63 72 79            [ 1] 1948 	cp a,#TK_COMMA
      009C65 00 20            [ 1] 1949 	jreq 5$
      009C67 69 6E            [ 2] 1950 	jra 7$ 
      001D61                       1951 1$:	; print string 
      009C69 20 52 41         [ 4] 1952 	call puts
      009C6C 4D               [ 1] 1953 	incw x
      009C6D 20 6D 65 6D      [ 2] 1954 	subw x,basicptr 
      009C71 6F 72 79         [ 2] 1955 	ldw in.w,x  
      009C74 00 C5            [ 2] 1956 	jra reset_semicol
      009C75                       1957 2$:	; print character 
      009C75 CD 97 42         [ 4] 1958 	call get_char 
      009C78 CD 9B E4         [ 4] 1959 	call putc 
      009C7B 22 01            [ 2] 1960 	jra reset_semicol 
      001D76                       1961 3$: ; print character function value  	
      001D76                       1962 	_get_code_addr 
      009C7D 81               [ 2]    1         ldw x,(x)
      009C7E 52 06 CE 00      [ 1]    2         inc in 
      009C82 1C 1F 05 FE      [ 1]    3         inc in 
      009C86 1F               [ 4] 1963 	call (x)
      009C87 01 AE 7F         [ 4] 1964 	call putc
      009C8A FF 1F            [ 2] 1965 	jra reset_semicol 
      001D85                       1966 4$: ; set semi-colon  state 
      009C8C 03 CD            [ 1] 1967 	cpl (SEMICOL,sp)
      009C8E 95 8F            [ 2] 1968 	jra prt_loop 
      001D89                       1969 5$: ; skip to next terminal tabulation
                                   1970      ; terminal TAB are 8 colons 
      009C90 A1 84            [ 1] 1971      ld a,#9 
      009C92 27 0F 25         [ 4] 1972 	 call putc 
      009C94 20 A3            [ 2] 1973 	 jra reset_semicol	    
      001D90                       1974 7$:	
      001D90                       1975 	_unget_token 
      009C94 A1 11 27 36 A1   [ 1]    1      mov in,in.saved  
      009C99 00 27 49         [ 4] 1976 	call condition
      009C9C A1               [ 1] 1977 	tnz a 
      009C9D 09 27            [ 1] 1978 	jreq 8$    
      009C9F 45 CC 94         [ 4] 1979     call print_top
      009CA2 35 1D 33         [ 2] 1980 	jp reset_semicol 
      009CA3                       1981 8$:
      009CA3 CD 95            [ 1] 1982 	tnz (SEMICOL,sp)
      009CA5 C1 1F            [ 1] 1983 	jrne 9$
      009CA7 01 0D            [ 1] 1984 	ld a,#CR 
      009CA8 CD 06 25         [ 4] 1985     call putc 
      001DAA                       1986 9$:	_drop VSIZE 
      009CA8 90 89            [ 2]    1     addw sp,#VSIZE 
      009CAA 4F               [ 4] 1987 	ret 
                                   1988 
                                   1989 ;----------------------
                                   1990 ; 'save_context' and
                                   1991 ; 'rest_context' must be 
                                   1992 ; called at the same 
                                   1993 ; call stack depth 
                                   1994 ; i.e. SP must have the 
                                   1995 ; save value at  
                                   1996 ; entry point of both 
                                   1997 ; routine. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



                                   1998 ;---------------------
                           000004  1999 	CTXT_SIZE=4 ; size of saved data 
                                   2000 ;--------------------
                                   2001 ; save current BASIC
                                   2002 ; interpreter context 
                                   2003 ; on stack 
                                   2004 ;--------------------
      001DAD                       2005 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001DAD                       2006 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001DAD                       2007 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      001DAD                       2008 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      001DAD                       2009 save_context:
      009CAB CD 89 EB         [ 2] 2010 	ldw x,basicptr 
      009CAE 5D 26            [ 2] 2011 	ldw (BPTR,sp),x
      009CB0 01 93 90         [ 1] 2012 	ld a,in 
      009CB3 85 1F            [ 1] 2013 	ld (IN,sp),a
      009CB5 05 CD 95         [ 1] 2014 	ld a,count 
      009CB8 8F A1            [ 1] 2015 	ld (CNT,sp),a  
      009CBA 11               [ 4] 2016 	ret
                                   2017 
                                   2018 ;-----------------------
                                   2019 ; restore previously saved 
                                   2020 ; BASIC interpreter context 
                                   2021 ; from stack 
                                   2022 ;-------------------------
      001DBD                       2023 rest_context:
      009CBB 27 11            [ 2] 2024 	ldw x,(BPTR,sp)
      009CBD A1 00 27         [ 2] 2025 	ldw basicptr,x 
      009CC0 07 A1            [ 1] 2026 	ld a,(IN,sp)
      009CC2 09 27 03         [ 1] 2027 	ld in,a
      009CC5 CC 94            [ 1] 2028 	ld a,(CNT,sp)
      009CC7 35 00 02         [ 1] 2029 	ld count,a  
      009CC8 81               [ 4] 2030 	ret
                                   2031 
                                   2032 
                                   2033 
                                   2034 ;------------------------------------------
                                   2035 ; BASIC: INPUT [string]var[,[string]var]
                                   2036 ; input value in variables 
                                   2037 ; [string] optionally can be used as prompt 
                                   2038 ;-----------------------------------------
                           000001  2039 	CX_BPTR=1
                           000003  2040 	CX_IN=3
                           000004  2041 	CX_CNT=4
                           000005  2042 	SKIP=5
                           000005  2043 	VSIZE=5
      001DCD                       2044 input_var:
      009CC8 1E 01            [ 2] 2045 	pushw y 
      001DCF                       2046 	_vars VSIZE 
      009CCA 1F 03            [ 2]    1     sub sp,#VSIZE 
      001DD1                       2047 input_loop:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      009CCC 20 17            [ 1] 2048 	clr (SKIP,sp)
      009CCE CD 15 0F         [ 4] 2049 	call next_token 
      009CCE CD 95            [ 1] 2050 	cp a,#TK_QSTR 
      009CD0 8F A1            [ 1] 2051 	jrne 1$ 
      009CD2 84 27 0B         [ 4] 2052 	call puts 
      009CD5 A1               [ 1] 2053 	incw x 
      009CD6 00 27 0C A1      [ 2] 2054 	subw x,basicptr 
      009CDA 09 27 08         [ 2] 2055 	ldw in.w,x 
      009CDD CC 94            [ 1] 2056 	cpl (SKIP,sp)
      009CDF 35 15 0F         [ 4] 2057 	call next_token 
      009CE0 A1 85            [ 1] 2058 1$: cp a,#TK_VAR  
      009CE0 CD 95            [ 1] 2059 	jreq 2$ 
      009CE2 C1 1F 03         [ 2] 2060 	jp syntax_error
      009CE5 CD 15 37         [ 4] 2061 2$:	call get_addr
      009CE5 1E 05 E6         [ 2] 2062 	ldw ptr16,x 
      009CE8 02 CD            [ 1] 2063 	tnz (SKIP,sp)
      009CEA 9D 8D            [ 1] 2064 	jrne 21$ 
      009CEC 1E 05 E6         [ 4] 2065 	call var_name 
      009CEF 02 C7 00         [ 4] 2066 	call putc   
      001E01                       2067 21$:
      009CF2 0F 72            [ 1] 2068 	ld a,#':
      009CF4 5F 00 0E         [ 4] 2069 	call putc 
      009CF7 72 BB 00         [ 4] 2070 	call save_context 
      009CFA 0E C3 00 1E      [ 1] 2071 	clr count  
      009CFE 2A 07 1F         [ 4] 2072 	call readln 
      009D01 05 FE 13         [ 2] 2073 	ldw x,#tib 
      009D04 03 2D DE         [ 1] 2074 	push count
      009D07 4B 00            [ 1] 2075 	push #0 
      009D07 55 00 03         [ 2] 2076 	addw x,(1,sp)
      009D0A 00               [ 1] 2077 	incw x 
      001E1C                       2078 	_drop 2 
      009D0B 02 AE            [ 2]    1     addw sp,#2 
      009D0D 16 B8 CF 00      [ 1] 2079 	clr in 
      009D11 05 5B 06         [ 4] 2080 	call get_token
      009D14 CD 9B            [ 1] 2081 	cp a,#TK_INTGR
      009D16 EC 72            [ 1] 2082 	jreq 3$ 
      009D18 0D 00            [ 1] 2083 	cp a,#TK_MINUS
      009D1A 23 06            [ 1] 2084 	jrne 22$
      009D1C AE 9D 23         [ 4] 2085 	call get_token 
      009D1F CD 87            [ 1] 2086 	cp a,#TK_INTGR 
      009D21 02 06            [ 1] 2087 	jreq 23$
      009D22                       2088 22$:
      009D22 81 57 41         [ 4] 2089 	call rest_context 
      009D25 52 4E 49         [ 2] 2090 	jp syntax_error
      001E3A                       2091 23$:
      009D28 4E 47 3A         [ 4] 2092 	call neg_acc24	
      001E3D                       2093 3$: 
      009D2B 20 6C 69         [ 1] 2094 	ld a,acc24 
      009D2E 6E 65 73         [ 2] 2095 	ldw x,acc16 
      009D31 20 6D 69 73      [ 4] 2096 	ld [ptr16],a
      009D35 73 69 6E 67      [ 1] 2097 	inc ptr8  
      009D39 20 69 6E 20      [ 5] 2098 	ldw [ptr16],x 
      009D3D 74 68 69         [ 4] 2099 	call rest_context
      009D40 73 20 70         [ 4] 2100 	call next_token 
      009D43 72 6F            [ 1] 2101 	cp a,#TK_COMMA
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      009D45 67 72            [ 1] 2102 	jrne 4$ 
      009D47 61 6D 2E         [ 2] 2103 	jp input_loop
      001E5C                       2104 4$:
      009D4A 0A 00            [ 1] 2105 	cp a,#TK_NONE 
      009D4C 27 07            [ 1] 2106 	jreq input_exit  
      009D4C CD 97            [ 1] 2107 	cp a,#TK_COLON 
      009D4E 42 A6            [ 1] 2108     jreq input_exit 
      009D50 03 CD 97         [ 2] 2109 	jp syntax_error 
      001E67                       2110 input_exit:
      001E67                       2111 	_drop VSIZE 
      009D53 58 89            [ 2]    1     addw sp,#VSIZE 
      009D55 CD 95            [ 2] 2112 	popw y 
      009D57 A8               [ 4] 2113 	ret 
                                   2114 
                                   2115 
                                   2116 ;---------------------
                                   2117 ; BASIC: REM | ' 
                                   2118 ; skip comment to end of line 
                                   2119 ;---------------------- 
      001E6C                       2120 remark::
      009D58 85 CD AF 87 26   [ 1] 2121 	mov in,count 
      009D5D 06               [ 4] 2122  	ret 
                                   2123 
                                   2124 
                                   2125 ;---------------------
                                   2126 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2127 ; read in loop 'addr'  
                                   2128 ; apply & 'mask' to value 
                                   2129 ; loop while result==0.  
                                   2130 ; 'xor_mask' is used to 
                                   2131 ; invert the wait logic.
                                   2132 ; i.e. loop while not 0.
                                   2133 ;---------------------
                           000001  2134 	XMASK=1 
                           000002  2135 	MASK=2
                           000003  2136 	ADDR=3
                           000004  2137 	VSIZE=4
      001E72                       2138 wait: 
      001E72                       2139 	_vars VSIZE
      009D5E AE 00            [ 2]    1     sub sp,#VSIZE 
      009D60 12 CC            [ 1] 2140 	clr (XMASK,sp) 
      009D62 94 37 90         [ 4] 2141 	call arg_list 
      009D65 89 90            [ 1] 2142 	cp a,#2
      009D67 93 1D            [ 1] 2143 	jruge 0$
      009D69 00 04 EE         [ 2] 2144 	jp syntax_error 
      009D6C 02 1C            [ 1] 2145 0$:	cp a,#3
      009D6E 00 04            [ 1] 2146 	jrult 1$
      001E84                       2147 	_xpop  ; xor mask 
      009D70 CF 00            [ 1]    1     ld a,(y)
      009D72 0E               [ 1]    2     ldw x,y 
      009D73 AE 00            [ 2]    3     ldw x,(1,x)
      009D75 8C 72 A2 00      [ 2]    4     addw y,#CELL_SIZE 
      009D79 04               [ 1] 2148 	ld a,xl 
      009D7A CD 91            [ 1] 2149 	ld (XMASK,sp),a 
      001E90                       2150 1$: _xpop ; mask
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      009D7C 5D AE            [ 1]    1     ld a,(y)
      009D7E 00               [ 1]    2     ldw x,y 
      009D7F 90 CF            [ 2]    3     ldw x,(1,x)
      009D81 00 1C 72 BB      [ 2]    4     addw y,#CELL_SIZE 
      009D85 00               [ 1] 2151     ld a,xl  
      009D86 8E CF            [ 1] 2152 	ld (MASK,sp),a 
      001E9C                       2153 	_xpop ; address 
      009D88 00 1E            [ 1]    1     ld a,(y)
      009D8A 90               [ 1]    2     ldw x,y 
      009D8B 85 81            [ 2]    3     ldw x,(1,x)
      009D8D 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D8D 90               [ 1] 2154 2$:	ld a,(x)
      009D8E 89 C7            [ 1] 2155 	and a,(MASK,sp)
      009D90 00 03            [ 1] 2156 	xor a,(XMASK,sp)
      009D92 E6 02            [ 1] 2157 	jreq 2$ 
      001EAC                       2158 	_drop VSIZE 
      009D94 C1 00            [ 2]    1     addw sp,#VSIZE 
      009D96 03               [ 4] 2159 	ret 
                                   2160 
                                   2161 ;---------------------
                                   2162 ; BASIC: BSET addr,mask
                                   2163 ; set bits at 'addr' corresponding 
                                   2164 ; to those of 'mask' that are at 1.
                                   2165 ; arguments:
                                   2166 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2167 ;   mask        mask|addr
                                   2168 ; output:
                                   2169 ;	none 
                                   2170 ;--------------------------
      001EAF                       2171 bit_set:
      009D97 2A 03 C7         [ 4] 2172 	call arg_list 
      009D9A 00 03            [ 1] 2173 	cp a,#2	 
      009D9C CF 00            [ 1] 2174 	jreq 1$ 
      009D9E 05 90 AE         [ 2] 2175 	jp syntax_error
      001EB9                       2176 1$: 
      001EB9                       2177 	_xpop ; mask 
      009DA1 16 68            [ 1]    1     ld a,(y)
      009DA3 CD               [ 1]    2     ldw x,y 
      009DA4 8F 64            [ 2]    3     ldw x,(1,x)
      009DA6 CD 87 02 A6      [ 2]    4     addw y,#CELL_SIZE 
      009DAA 0D               [ 1] 2178 	ld a,xl
      009DAB CD               [ 1] 2179 	push a  
      001EC4                       2180 	_xpop ; addr  
      009DAC 86 A5            [ 1]    1     ld a,(y)
      009DAE 90               [ 1]    2     ldw x,y 
      009DAF 85 81            [ 2]    3     ldw x,(1,x)
      009DB1 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009DB1 52               [ 1] 2181 	pop a 
      009DB2 01               [ 1] 2182 	or a,(x)
      009DB3 F7               [ 1] 2183 	ld (x),a
      009DB3 0F               [ 4] 2184 	ret 
                                   2185 
                                   2186 ;---------------------
                                   2187 ; BASIC: BRES addr,mask
                                   2188 ; reset bits at 'addr' corresponding 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



                                   2189 ; to those of 'mask' that are at 1.
                                   2190 ; arguments:
                                   2191 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2192 ;   mask	    ~mask&*addr  
                                   2193 ; output:
                                   2194 ;	none 
                                   2195 ;--------------------------
      001ED1                       2196 bit_reset:
      009DB4 01 16 EA         [ 4] 2197 	call arg_list 
      009DB5 A1 02            [ 1] 2198 	cp a,#2  
      009DB5 CD 95            [ 1] 2199 	jreq 1$ 
      009DB7 8F A1 02         [ 2] 2200 	jp syntax_error
      001EDB                       2201 1$: 
      001EDB                       2202 	_xpop ; mask 
      009DBA 25 08            [ 1]    1     ld a,(y)
      009DBC A1               [ 1]    2     ldw x,y 
      009DBD 09 27            [ 2]    3     ldw x,(1,x)
      009DBF 04 A1 80 26      [ 2]    4     addw y,#CELL_SIZE 
      009DC3 07               [ 1] 2203 	ld a,xl 
      009DC4 43               [ 1] 2204 	cpl a
      009DC4 55               [ 1] 2205 	push a  
      001EE7                       2206 	_xpop ; addr  
      009DC5 00 04            [ 1]    1     ld a,(y)
      009DC7 00               [ 1]    2     ldw x,y 
      009DC8 02 20            [ 2]    3     ldw x,(1,x)
      009DCA 56 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009DCB 84               [ 1] 2207 	pop a 
      009DCB A1               [ 1] 2208 	and a,(x)
      009DCC 02               [ 1] 2209 	ld (x),a 
      009DCD 27               [ 4] 2210 	ret 
                                   2211 
                                   2212 ;---------------------
                                   2213 ; BASIC: BTOGL addr,mask
                                   2214 ; toggle bits at 'addr' corresponding 
                                   2215 ; to those of 'mask' that are at 1.
                                   2216 ; arguments:
                                   2217 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2218 ;   mask	    mask^*addr  
                                   2219 ; output:
                                   2220 ;	none 
                                   2221 ;--------------------------
      001EF4                       2222 bit_toggle:
      009DCE 12 A1 04         [ 4] 2223 	call arg_list 
      009DD1 27 1B            [ 1] 2224 	cp a,#2 
      009DD3 A1 82            [ 1] 2225 	jreq 1$ 
      009DD5 27 1F A1         [ 2] 2226 	jp syntax_error
      001EFE                       2227 1$: _xpop ; mask 
      009DD8 0A 27            [ 1]    1     ld a,(y)
      009DDA 2A               [ 1]    2     ldw x,y 
      009DDB A1 08            [ 2]    3     ldw x,(1,x)
      009DDD 27 2A 20 2F      [ 2]    4     addw y,#CELL_SIZE 
      009DE1 9F               [ 1] 2228 	ld a,xl
      009DE1 CD               [ 1] 2229 	push a 
      001F09                       2230 	_xpop  ; addr  
      009DE2 87 02            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      009DE4 5C               [ 1]    2     ldw x,y 
      009DE5 72 B0            [ 2]    3     ldw x,(1,x)
      009DE7 00 05 CF 00      [ 2]    4     addw y,#CELL_SIZE 
      009DEB 01               [ 1] 2231 	pop a 
      009DEC 20               [ 1] 2232 	xor a,(x)
      009DED C5               [ 1] 2233 	ld (x),a 
      009DEE 81               [ 4] 2234 	ret 
                                   2235 
                                   2236 
                                   2237 ;---------------------
                                   2238 ; BASIC: BTEST(addr,bit)
                                   2239 ; return bit value at 'addr' 
                                   2240 ; bit is in range {0..7}.
                                   2241 ; arguments:
                                   2242 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2243 ;   bit 	    bit position {0..7}  
                                   2244 ; output:
                                   2245 ;	A:X       bit value  
                                   2246 ;--------------------------
      001F16                       2247 bit_test:
      009DEE CD 95 D1         [ 4] 2248 	call func_args 
      009DF1 CD 86            [ 1] 2249 	cp a,#2
      009DF3 A5 20            [ 1] 2250 	jreq 0$
      009DF5 BD 13 B5         [ 2] 2251 	jp syntax_error
      009DF6                       2252 0$:	
      001F20                       2253 	_xpop 
      009DF6 FE 72            [ 1]    1     ld a,(y)
      009DF8 5C               [ 1]    2     ldw x,y 
      009DF9 00 02            [ 2]    3     ldw x,(1,x)
      009DFB 72 5C 00 02      [ 2]    4     addw y,#CELL_SIZE 
      009DFF FD               [ 1] 2254 	ld a,xl 
      009E00 CD 86            [ 1] 2255 	and a,#7
      009E02 A5               [ 1] 2256 	push a   
      009E03 20 AE            [ 1] 2257 	ld a,#1 
      009E05 0D 01            [ 1] 2258 1$: tnz (1,sp)
      009E05 03 01            [ 1] 2259 	jreq 2$
      009E07 20               [ 1] 2260 	sll a 
      009E08 AC 01            [ 1] 2261 	dec (1,sp)
      009E09 20 F7            [ 2] 2262 	jra 1$
      009E09 A6 09            [ 1] 2263 2$: ld (1,sp),a  
      001F3A                       2264 	_xpop ; address  
      009E0B CD 86            [ 1]    1     ld a,(y)
      009E0D A5               [ 1]    2     ldw x,y 
      009E0E 20 A3            [ 2]    3     ldw x,(1,x)
      009E10 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009E10 55               [ 1] 2265 	pop a 
      009E11 00               [ 1] 2266 	and a,(x)
      009E12 04 00            [ 1] 2267 	jreq 3$
      009E14 02 CD            [ 1] 2268 	ld a,#1 
      009E16 99               [ 1] 2269 3$:	clrw x 
      009E17 C5               [ 1] 2270 	ld xl,a
      009E18 4D               [ 1] 2271 	clr a  
      009E19 27               [ 4] 2272 	ret
                                   2273 
                                   2274 ;--------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



                                   2275 ; BASIC: POKE addr,byte
                                   2276 ; put a byte at addr 
                                   2277 ;--------------------
      001F4D                       2278 poke:
      009E1A 06 CD 95         [ 4] 2279 	call arg_list 
      009E1D F9 CC            [ 1] 2280 	cp a,#2
      009E1F 9D B3            [ 1] 2281 	jreq 1$
      009E21 CC 13 B5         [ 2] 2282 	jp syntax_error
      001F57                       2283 1$:	
      001F57                       2284 	_xpop ; byte   
      009E21 0D 01            [ 1]    1     ld a,(y)
      009E23 26               [ 1]    2     ldw x,y 
      009E24 05 A6            [ 2]    3     ldw x,(1,x)
      009E26 0D CD 86 A5      [ 2]    4     addw y,#CELL_SIZE 
      009E2A 5B               [ 1] 2285     ld a,xl 
      009E2B 01               [ 1] 2286 	push a 
      001F62                       2287 	_xpop ; address 
      009E2C 81 F6            [ 1]    1     ld a,(y)
      009E2D 93               [ 1]    2     ldw x,y 
      009E2D CE 00            [ 2]    3     ldw x,(1,x)
      009E2F 05 1F 03 C6      [ 2]    4     addw y,#CELL_SIZE 
      009E33 00               [ 1] 2288 	pop a 
      009E34 02               [ 1] 2289 	ld (x),a 
      009E35 6B               [ 4] 2290 	ret 
                                   2291 
                                   2292 ;-----------------------
                                   2293 ; BASIC: PEEK(addr)
                                   2294 ; get the byte at addr 
                                   2295 ; input:
                                   2296 ;	none 
                                   2297 ; output:
                                   2298 ;	X 		value 
                                   2299 ;-----------------------
      001F6E                       2300 peek:
      009E36 05 C6 00         [ 4] 2301 	call func_args
      009E39 03 6B            [ 1] 2302 	cp a,#1 
      009E3B 06 81            [ 1] 2303 	jreq 1$
      009E3D CC 13 B5         [ 2] 2304 	jp syntax_error
      001F78                       2305 1$: _xpop ; address  
      009E3D 1E 03            [ 1]    1     ld a,(y)
      009E3F CF               [ 1]    2     ldw x,y 
      009E40 00 05            [ 2]    3     ldw x,(1,x)
      009E42 7B 05 C7 00      [ 2]    4     addw y,#CELL_SIZE 
      009E46 02 7B 06         [ 1] 2306 	ld farptr,a 
      009E49 C7 00 03         [ 2] 2307 	ldw ptr16,x 
      009E4C 81 BC 00 18      [ 5] 2308 	ldf a,[farptr]
      009E4D 5F               [ 1] 2309 	clrw x 
      009E4D 90               [ 1] 2310 	ld xl,a 
      009E4E 89               [ 1] 2311 	clr a 
      009E4F 52               [ 4] 2312 	ret 
                                   2313 
                                   2314 ;---------------------------
                                   2315 ; BASIC IF expr : instructions
                                   2316 ; evaluate expr and if true 
                                   2317 ; execute instructions on same line. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



                                   2318 ;----------------------------
      001F8F                       2319 if: 
      009E50 05 19 45         [ 4] 2320 	call condition  
      009E51                       2321 	_xpop 
      009E51 0F 05            [ 1]    1     ld a,(y)
      009E53 CD               [ 1]    2     ldw x,y 
      009E54 95 8F            [ 2]    3     ldw x,(1,x)
      009E56 A1 02 26 10      [ 2]    4     addw y,#CELL_SIZE 
      009E5A CD               [ 1] 2322 	tnz  a  
      009E5B 87 02            [ 1] 2323 	jrne 9$
      009E5D 5C               [ 2] 2324 	tnzw x 
      009E5E 72 B0            [ 1] 2325 	jrne 9$  
                                   2326 ;skip to next line
      009E60 00 05 CF 00 01   [ 1] 2327 	mov in,count
      001FA6                       2328 	_drop 2 
      009E65 03 05            [ 2]    1     addw sp,#2 
      009E67 CD 95 8F         [ 2] 2329 	jp next_line
      009E6A A1               [ 4] 2330 9$:	ret 
                                   2331 
                                   2332 ;------------------------
                                   2333 ; BASIC: FOR var=expr 
                                   2334 ; set variable to expression 
                                   2335 ; leave variable address 
                                   2336 ; on stack and set
                                   2337 ; FLOOP bit in 'flags'
                                   2338 ;-----------------
                           000001  2339 	RETL1=1 ; return address  
                           000003  2340 	FSTEP=3  ; variable increment int24
                           000006  2341 	LIMIT=6 ; loop limit, int24  
                           000009  2342 	CVAR=9   ; control variable 
                           00000B  2343 	INW=11   ;  in.w saved
                           00000D  2344 	BPTR=13 ; baseptr saved
                           00000D  2345 	VSIZE=13  
      001FAC                       2346 for: ; { -- var_addr }
      009E6B 85               [ 2] 2347 	popw x ; call return address 
      001FAD                       2348 	_vars VSIZE 
      009E6C 27 03            [ 2]    1     sub sp,#VSIZE 
      009E6E CC               [ 2] 2349 	pushw x  ; RETL1 
      009E6F 94 35            [ 1] 2350 	ld a,#TK_VAR 
      009E71 CD 95 B7         [ 4] 2351 	call expect
      009E74 CF 00 1A         [ 4] 2352 	call get_addr
      009E77 0D 05            [ 2] 2353 	ldw (CVAR,sp),x  ; control variable 
      009E79 26 06 CD         [ 4] 2354 	call let_eval 
      009E7C 8F 5A CD 86      [ 1] 2355 	bset flags,#FLOOP 
      009E80 A5 15 0F         [ 4] 2356 	call next_token 
      009E81 A1 80            [ 1] 2357 	cp a,#TK_CMD 
      009E81 A6 3A            [ 1] 2358 	jreq 1$
      009E83 CD 86 A5         [ 2] 2359 	jp syntax_error
      001FCB                       2360 1$:  
      001FCB                       2361 	_get_code_addr
      009E86 CD               [ 2]    1         ldw x,(x)
      009E87 9E 2D 72 5F      [ 1]    2         inc in 
      009E8B 00 03 CD 88      [ 1]    3         inc in 
      009E8F 07 AE 16         [ 2] 2362 	cpw x,#to   
      009E92 68 3B            [ 1] 2363 	jreq to
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      009E94 00 03 4B         [ 2] 2364 	jp syntax_error 
                                   2365 
                                   2366 ;-----------------------------------
                                   2367 ; BASIC: TO expr 
                                   2368 ; second part of FOR loop initilization
                                   2369 ; leave limit on stack and set 
                                   2370 ; FTO bit in 'flags'
                                   2371 ;-----------------------------------
      001FDC                       2372 to: ; { var_addr -- var_addr limit step }
      009E97 00 72 FB 01 5C   [ 2] 2373 	btjt flags,#FLOOP,1$
      009E9C 5B 02 72         [ 2] 2374 	jp syntax_error
      009E9F 5F 00 02         [ 4] 2375 1$: call expression   
      009EA2 CD 8C            [ 1] 2376 	cp a,#TK_INTGR 
      009EA4 9B A1            [ 1] 2377 	jreq 2$ 
      009EA6 84 27 14         [ 2] 2378 	jp syntax_error
      001FEE                       2379 2$: _xpop
      009EA9 A1 11            [ 1]    1     ld a,(y)
      009EAB 26               [ 1]    2     ldw x,y 
      009EAC 07 CD            [ 2]    3     ldw x,(1,x)
      009EAE 8C 9B A1 84      [ 2]    4     addw y,#CELL_SIZE 
      009EB2 27 06            [ 1] 2380 	ld (LIMIT,sp),a 
      009EB4 1F 07            [ 2] 2381 	ldw (LIMIT+1,sp),x
      009EB4 CD 9E 3D         [ 4] 2382 	call next_token
      009EB7 CC 94            [ 1] 2383 	cp a,#TK_NONE  
      009EB9 35 17            [ 1] 2384 	jreq 4$ 
      009EBA A1 80            [ 1] 2385 	cp a,#TK_CMD
      009EBA CD 82            [ 1] 2386 	jrne 3$
      002006                       2387 	_get_code_addr
      009EBC 9D               [ 2]    1         ldw x,(x)
      009EBD 72 5C 00 01      [ 1]    2         inc in 
      009EBD C6 00 0D CE      [ 1]    3         inc in 
      009EC1 00 0E 72         [ 2] 2388 	cpw x,#step 
      009EC4 C7 00            [ 1] 2389 	jreq step
      002014                       2390 3$:	
      002014                       2391 	_unget_token   	 
      009EC6 1A 72 5C 00 1B   [ 1]    1      mov in,in.saved  
      002019                       2392 4$:	
      009ECB 72 CF            [ 1] 2393 	clr (FSTEP,sp) 
      009ECD 00 1A CD         [ 2] 2394 	ldw x,#1   ; default step  
      009ED0 9E 3D            [ 2] 2395 	ldw (FSTEP+1,sp),x 
      009ED2 CD 95            [ 2] 2396 	jra store_loop_addr 
                                   2397 
                                   2398 
                                   2399 ;----------------------------------
                                   2400 ; BASIC: STEP expr 
                                   2401 ; optional third par of FOR loop
                                   2402 ; initialization. 	
                                   2403 ;------------------------------------
      002022                       2404 step: ; {var limit -- var limit step}
      009ED4 8F A1 08 26 03   [ 2] 2405 	btjt flags,#FLOOP,1$
      009ED9 CC 9E 51         [ 2] 2406 	jp syntax_error
      009EDC CD 18 2C         [ 4] 2407 1$: call expression 
      009EDC A1 00            [ 1] 2408 	cp a,#TK_INTGR
      009EDE 27 07            [ 1] 2409 	jreq 2$
      009EE0 A1 09 27         [ 2] 2410 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      002034                       2411 2$:	
      002034                       2412 	_xpop 
      009EE3 03 CC            [ 1]    1     ld a,(y)
      009EE5 94               [ 1]    2     ldw x,y 
      009EE6 35 01            [ 2]    3     ldw x,(1,x)
      009EE7 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009EE7 5B 05            [ 1] 2413 	ld (FSTEP,sp),a 
      009EE9 90 85            [ 2] 2414 	ldw (FSTEP+1,sp),x ; step
                                   2415 ; if step < 0 decrement LIMIT 
      009EEB 81               [ 1] 2416 	tnz a
      009EEC 2A 0D            [ 1] 2417 	jrpl store_loop_addr 
      009EEC 55 00            [ 1] 2418 	ld a,(LIMIT,sp)
      009EEE 03 00            [ 2] 2419 	ldw x,(LIMIT+1,sp)
      009EF0 02 81 01         [ 2] 2420 	subw x,#1 
      009EF2 A2 00            [ 1] 2421 	sbc a,#0 
      009EF2 52 04            [ 1] 2422 	ld (LIMIT,sp),a 
      009EF4 0F 01            [ 2] 2423 	ldw (LIMIT+1,sp),x 
                                   2424 ; leave loop back entry point on cstack 
                                   2425 ; cstack is 1 call deep from interpreter
      002051                       2426 store_loop_addr:
      009EF6 CD 97 6A         [ 2] 2427 	ldw x,basicptr
      009EF9 A1 02            [ 2] 2428 	ldw (BPTR,sp),x 
      009EFB 24 03 CC         [ 2] 2429 	ldw x,in.w 
      009EFE 94 35            [ 2] 2430 	ldw (INW,sp),x   
      009F00 A1 03 25 0C      [ 1] 2431 	bres flags,#FLOOP 
      009F04 90 F6 93 EE      [ 1] 2432 	inc loop_depth  
      009F08 01               [ 4] 2433 	ret 
                                   2434 
                                   2435 ;--------------------------------
                                   2436 ; BASIC: NEXT var 
                                   2437 ; FOR loop control 
                                   2438 ; increment variable with step 
                                   2439 ; and compare with limit 
                                   2440 ; loop if threshold not crossed.
                                   2441 ; else stack. 
                                   2442 ; and decrement 'loop_depth' 
                                   2443 ;--------------------------------
      002064                       2444 next: ; {var limit step retl1 -- [var limit step ] }
      009F09 72 A9 00 03      [ 1] 2445 	tnz loop_depth 
      009F0D 9F 6B            [ 1] 2446 	jrne 1$ 
      009F0F 01 90 F6         [ 2] 2447 	jp syntax_error 
      00206D                       2448 1$: 
      009F12 93 EE            [ 1] 2449 	ld a,#TK_VAR 
      009F14 01 72 A9         [ 4] 2450 	call expect
      009F17 00 03 9F         [ 4] 2451 	call get_addr 
                                   2452 ; check for good variable after NEXT 	 
      009F1A 6B 02            [ 2] 2453 	cpw x,(CVAR,sp)
      009F1C 90 F6            [ 1] 2454 	jreq 2$  
      009F1E 93 EE 01         [ 2] 2455 	jp syntax_error ; not the good one 
      00207C                       2456 2$: 
      009F21 72 A9 00         [ 2] 2457 	ldw ptr16,x 
                                   2458 	; increment variable 
      009F24 03               [ 1] 2459 	ld a,(x)
      009F25 F6 14            [ 2] 2460 	ldw x,(1,x)  ; get var value 
      009F27 02 18 01         [ 2] 2461 	addw x,(FSTEP+1,sp) ; var+step 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      009F2A 27 F9            [ 1] 2462 	adc a,(FSTEP,sp)
      009F2C 5B 04 81 19      [ 4] 2463 	ld [ptr16],a
      009F2F 72 5C 00 1A      [ 1] 2464 	inc ptr8  
      009F2F CD 97 6A A1      [ 5] 2465 	ldw [ptr16],x 
      009F33 02 27 03         [ 1] 2466 	ld acc24,a 
      009F36 CC 94 35         [ 2] 2467 	ldw acc16,x 
      009F39 7B 06            [ 1] 2468 	ld a,(LIMIT,sp)
      009F39 90 F6            [ 2] 2469 	ldw x,(LIMIT+1,sp)
      009F3B 93 EE 01 72      [ 2] 2470 	subw x,acc16 
      009F3F A9 00 03         [ 1] 2471 	sbc a,acc24
      009F42 9F 88            [ 1] 2472 	xor a,(FSTEP,sp)
      009F44 90 F6            [ 1] 2473 	xor a,#0x80
      009F46 93 EE            [ 1] 2474 	jrmi loop_back  
      009F48 01 72            [ 2] 2475 	jra loop_done   
                                   2476 ; check sign of STEP  
      009F4A A9 00            [ 1] 2477 	ld a,(FSTEP,sp)
      009F4C 03 84            [ 1] 2478 	jrpl 4$
                                   2479 ;negative step
      009F4E FA F7 81         [ 1] 2480     ld a,acc8 
      009F51 2F 07            [ 1] 2481 	jrslt loop_back   
      009F51 CD 97            [ 2] 2482 	jra loop_done  
      0020B7                       2483 4$: ; positive step
      009F53 6A A1 02 27 03   [ 2] 2484 	btjt acc8,#7,loop_done 
      0020BC                       2485 loop_back:
      009F58 CC 94            [ 2] 2486 	ldw x,(BPTR,sp)
      009F5A 35 00 04         [ 2] 2487 	ldw basicptr,x 
      009F5B 72 01 00 22 05   [ 2] 2488 	btjf flags,#FRUN,1$ 
      009F5B 90 F6            [ 1] 2489 	ld a,(2,x)
      009F5D 93 EE 01         [ 1] 2490 	ld count,a
      009F60 72 A9            [ 2] 2491 1$:	ldw x,(INW,sp)
      009F62 00 03 9F         [ 2] 2492 	ldw in.w,x 
      009F65 43               [ 4] 2493 	ret 
      0020D1                       2494 loop_done:
                                   2495 	; remove loop data from stack  
      009F66 88               [ 2] 2496 	popw x
      0020D2                       2497 	_drop VSIZE 
      009F67 90 F6            [ 2]    1     addw sp,#VSIZE 
      009F69 93 EE 01 72      [ 1] 2498 	dec loop_depth 
      009F6D A9               [ 2] 2499 	jp (x)
                                   2500 
                                   2501 ;----------------------------
                                   2502 ; called by goto/gosub
                                   2503 ; to get target line number 
                                   2504 ; output:
                                   2505 ;    x    line address 
                                   2506 ;---------------------------
      0020D9                       2507 get_target_line:
      009F6E 00 03 84         [ 4] 2508 	call next_token  
      009F71 F4 F7            [ 1] 2509 	cp a,#TK_INTGR
      009F73 81 07            [ 1] 2510 	jreq get_target_line_addr 
      009F74 A1 03            [ 1] 2511 	cp a,#TK_LABEL 
      009F74 CD 97            [ 1] 2512 	jreq look_target_symbol 
      009F76 6A A1 02         [ 2] 2513 	jp syntax_error
                                   2514 ; the target is a line number 
                                   2515 ; search it. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      0020E7                       2516 get_target_line_addr:
      009F79 27 03            [ 2] 2517 	pushw y 
      009F7B CC 94 35         [ 4] 2518 	call get_int24 ; line # 
      009F7E 90               [ 1] 2519 	clr a
      009F7F F6 93 EE 01      [ 2] 2520 	ldw y,basicptr 
      009F83 72 A9            [ 2] 2521 	ldw y,(y)
      009F85 00 03            [ 2] 2522 	pushw y 
      009F87 9F 88            [ 2] 2523 	cpw x,(1,sp)
      0020F7                       2524 	_drop 2  
      009F89 90 F6            [ 2]    1     addw sp,#2 
      009F8B 93 EE            [ 1] 2525 	jrult 11$
      009F8D 01               [ 1] 2526 	inc a 
      0020FC                       2527 11$: ; scan program for this line# 	
      009F8E 72 A9 00         [ 4] 2528 	call search_lineno  
      009F91 03               [ 2] 2529 	tnzw x ; 0| line# address 
      009F92 84 F8            [ 1] 2530 	jrne 2$ 
      009F94 F7 81            [ 1] 2531 	ld a,#ERR_NO_LINE 
      009F96 CC 13 B7         [ 2] 2532 	jp tb_error 
      009F96 CD 97            [ 2] 2533 2$:	popw y  
      009F98 65               [ 4] 2534 	ret 
                                   2535 
                                   2536 ; the GOTO|GOSUB target is a symbol.
                                   2537 ; output:
                                   2538 ;    X    line address|0 
      00210A                       2539 look_target_symbol:
      009F99 A1 02            [ 2] 2540 	pushw y 
      009F9B 27               [ 2] 2541 	pushw x 
      009F9C 03 CC 94         [ 4] 2542 	call skip_string 
      009F9F 35 5F 00 0D      [ 1] 2543 	clr acc16 
      009FA0 90 CE 00 1B      [ 2] 2544 	ldw y,txtbgn 
      009FA0 90 F6 93         [ 1] 2545 1$:	ld a,(3,y) ; first TK_ID on line 
      009FA3 EE 01            [ 1] 2546 	cp a,#TK_LABEL 
      009FA5 72 A9            [ 1] 2547 	jreq 3$ 
      009FA7 00 03 9F         [ 1] 2548 2$:	ld a,(2,y); line length 
      009FAA A4 07 88         [ 1] 2549 	ld acc8,a 
      009FAD A6 01 0D 01      [ 2] 2550 	addw y,acc16 ;point to next line 
      009FB1 27 05 48 0A      [ 2] 2551 	cpw y,txtend 
      009FB5 01 20            [ 1] 2552 	jrult 1$
      009FB7 F7 6B            [ 1] 2553 	ld a,#ERR_BAD_VALUE
      009FB9 01 90 F6         [ 2] 2554 	jp tb_error 
      002134                       2555 3$: ; found a TK_LABEL 
                                   2556 	; compare with GOTO|GOSUB target 
      009FBC 93 EE            [ 2] 2557 	pushw y ; line address 
      009FBE 01 72 A9 00      [ 2] 2558 	addw y,#4 ; label string 
      009FC2 03 84            [ 2] 2559 	ldw x,(3,sp) ; target string 
      009FC4 F4 27 02         [ 4] 2560 	call strcmp
      009FC7 A6 01            [ 1] 2561 	jrne 4$
      009FC9 5F 97            [ 2] 2562 	popw y 
      009FCB 4F 81            [ 2] 2563 	jra 2$ 
      009FCD                       2564 4$: ; target found 
      009FCD CD               [ 2] 2565 	popw x ;  address line target  
      002146                       2566 	_drop 2 ; target string 
      009FCE 97 6A            [ 2]    1     addw sp,#2 
      009FD0 A1 02            [ 2] 2567 	popw y 
      009FD2 27               [ 4] 2568 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



                                   2569 
                                   2570 
                                   2571 ;--------------------------------
                                   2572 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2573 ; selective goto or gosub 
                                   2574 ;--------------------------------
      00214B                       2575 cmd_on:
      009FD3 03 CC 94         [ 4] 2576 	call runtime_only
      009FD6 35 18 2C         [ 4] 2577 0$:	call expression 
      009FD7 A1 84            [ 1] 2578 	cp a,#TK_INTGR
      009FD7 90 F6            [ 1] 2579 	jreq 1$
      009FD9 93 EE 01         [ 2] 2580 	jp syntax_error
      002158                       2581 1$: _xpop
      009FDC 72 A9            [ 1]    1     ld a,(y)
      009FDE 00               [ 1]    2     ldw x,y 
      009FDF 03 9F            [ 2]    3     ldw x,(1,x)
      009FE1 88 90 F6 93      [ 2]    4     addw y,#CELL_SIZE 
                                   2582 ; the selector is the element indice 
                                   2583 ; in the list of arguments. {1..#elements} 
      009FE5 EE               [ 1] 2584 	ld a,xl ; keep only bits 7..0
      009FE6 01 72            [ 1] 2585 	jreq 9$ ; element # begin at 1. 
      009FE8 A9               [ 1] 2586 	push a  ; selector  
      009FE9 00 03 84         [ 4] 2587 	call next_token
      009FEC F7 81            [ 1] 2588 	cp a,#TK_CMD 
      009FEE 27 03            [ 1] 2589 	jreq 2$ 
      009FEE CD 97 65         [ 2] 2590 	jp syntax_error 
      00216F                       2591 2$: _get_code_addr
      009FF1 A1               [ 2]    1         ldw x,(x)
      009FF2 01 27 03 CC      [ 1]    2         inc in 
      009FF6 94 35 90 F6      [ 1]    3         inc in 
                                   2592 ;; must be a GOTO or GOSUB 
      009FFA 93 EE 01         [ 2] 2593 	cpw x,#goto 
      009FFD 72 A9            [ 1] 2594 	jreq 4$
      009FFF 00 03 C7         [ 2] 2595 	cpw x,#gosub 
      00A002 00 19            [ 1] 2596 	jreq 4$ 
      00A004 CF 00 1A         [ 2] 2597 	jp syntax_error 
      002185                       2598 4$: 
      00A007 92               [ 1] 2599 	pop a 
      00A008 BC               [ 2] 2600 	pushw x ; save routine address 	
      00A009 00               [ 1] 2601 	push a  ; selector  
      002188                       2602 5$: ; skip elements in list until selector==0 
      00A00A 19 5F            [ 1] 2603 	dec (1,sp)
      00A00C 97 4F            [ 1] 2604 	jreq 6$ 
                                   2605 ; can be a line# or a label 
      00A00E 81 15 0F         [ 4] 2606 	call next_token 
      00A00F A1 84            [ 1] 2607 	cp a,#TK_INTGR 
      00A00F CD 99            [ 1] 2608 	jreq 52$
      00A011 C5 90            [ 1] 2609 	cp a,#TK_LABEL 
      00A013 F6 93            [ 1] 2610 	jreq 54$
      00A015 EE 01 72         [ 2] 2611 	jp syntax_error 
      00219A                       2612 52$: ; got a line number 
      00A018 A9 00 03         [ 1] 2613 	ld a,in ; skip over int24 value 
      00A01B 4D 26            [ 1] 2614 	add a,#CELL_SIZE ; integer size  
      00A01D 0D 5D 26         [ 1] 2615 	ld in,a 
      00A020 0A 55            [ 2] 2616 	jra 56$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      00A022 00 03 00         [ 4] 2617 54$: call skip_string ; skip over label 	
      0021A7                       2618 56$: ; if another element comma present 
      00A025 02 5B 02         [ 4] 2619 	call next_token
      00A028 CC 94            [ 1] 2620 	cp a,#TK_COMMA 
      00A02A DB 81            [ 1] 2621 	jreq 5$ 
                                   2622 ; arg list exhausted, selector to big 
                                   2623 ; continue execution on next line 
      00A02C                       2624 	_drop 3 ; drop selector and GOTO|GOSUB address 
      00A02C 85 52            [ 2]    1     addw sp,#3 
      00A02E 0D 89            [ 2] 2625 	jra 9$
      0021B2                       2626 6$: ;at selected position  
      0021B2                       2627 	_drop 1 ; discard selector
      00A030 A6 85            [ 2]    1     addw sp,#1 
                                   2628 ; here only the routine address 
                                   2629 ; of GOTO|GOSUB is on stack 
      00A032 CD 97 58         [ 4] 2630     call get_target_line
      00A035 CD 95 B7         [ 2] 2631 	ldw ptr16,x 	
      00A038 1F 09 CD 9A 9A   [ 1] 2632 	mov in,count ; move to end of line  
      00A03D 72               [ 2] 2633 	popw x ; cmd address, GOTO||GOSUB 
      00A03E 14 00 23         [ 2] 2634 	cpw x,#goto 
      00A041 CD 95            [ 1] 2635 	jrne 7$ 
      00A043 8F A1 80         [ 2] 2636 	ldw x,ptr16 
      00A046 27 03            [ 2] 2637 	jra jp_to_target
      0021CA                       2638 7$: 
      00A048 CC 94            [ 2] 2639 	jra gosub_2 ; target in ptr16 
      0021CC                       2640 9$: ; expr out of range skip to end of line
                                   2641     ; this will force a fall to next line  
      00A04A 35 00 02 00 01   [ 1] 2642 	mov in,count
      00A04B                       2643 	_drop 2
      00A04B FE 72            [ 2]    1     addw sp,#2 
      00A04D 5C 00 02         [ 2] 2644 	jp next_line  
                                   2645 
                                   2646 
                                   2647 ;------------------------
                                   2648 ; BASIC: GOTO line# 
                                   2649 ; jump to line# 
                                   2650 ; here cstack is 2 call deep from interpreter 
                                   2651 ;------------------------
      0021D6                       2652 goto:
      00A050 72 5C 00         [ 4] 2653 	call runtime_only
      0021D9                       2654 goto_1:
      00A053 02 A3 A0         [ 4] 2655 	call get_target_line
      0021DC                       2656 jp_to_target:
      00A056 5C 27 03         [ 2] 2657 	ldw basicptr,x 
      00A059 CC 94            [ 1] 2658 	ld a,(2,x)
      00A05B 35 00 02         [ 1] 2659 	ld count,a 
      00A05C 35 03 00 01      [ 1] 2660 	mov in,#3 
      00A05C 72               [ 4] 2661 	ret 
                                   2662 
                                   2663 
                                   2664 ;--------------------
                                   2665 ; BASIC: GOSUB line#
                                   2666 ; basic subroutine call
                                   2667 ; actual line# and basicptr 
                                   2668 ; are saved on cstack
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



                                   2669 ; here cstack is 2 call deep from interpreter 
                                   2670 ;--------------------
                           000001  2671 	RET_ADDR=1 ; subroutine return address 
                           000003  2672 	RET_BPTR=3 ; basicptr return point 
                           000005  2673 	RET_INW=5  ; in.w return point 
                           000004  2674 	VSIZE=4 
      0021E9                       2675 gosub:
      00A05D 04 00 23         [ 4] 2676 	call runtime_only
      0021EC                       2677 gosub_1:
      00A060 03 CC 94         [ 4] 2678 	call get_target_line 
      00A063 35 CD 98         [ 2] 2679 	ldw ptr16,x
      0021F2                       2680 gosub_2: 
      00A066 AC               [ 2] 2681 	popw x 
      0021F3                       2682 	_vars VSIZE  
      00A067 A1 84            [ 2]    1     sub sp,#VSIZE 
      00A069 27               [ 2] 2683 	pushw x ; RET_ADDR 
                                   2684 ; save BASIC subroutine return point.   
      00A06A 03 CC 94         [ 2] 2685 	ldw x,basicptr
      00A06D 35 90            [ 2] 2686 	ldw (RET_BPTR,sp),x 
      00A06F F6 93 EE         [ 2] 2687 	ldw x,in.w 
      00A072 01 72            [ 2] 2688 	ldw (RET_INW,sp),x
      00A074 A9 00 03         [ 2] 2689 	ldw x,ptr16  
      00A077 6B 06            [ 2] 2690 	jra jp_to_target
                                   2691 
                                   2692 ;------------------------
                                   2693 ; BASIC: RETURN 
                                   2694 ; exit from BASIC subroutine 
                                   2695 ;------------------------
      002205                       2696 return:
      00A079 1F 07 CD         [ 4] 2697 	call runtime_only
      00A07C 95 8F            [ 2] 2698 	ldw x,(RET_BPTR,sp) 
      00A07E A1 00 27         [ 2] 2699 	ldw basicptr,x
      00A081 17 A1            [ 1] 2700 	ld a,(2,x)
      00A083 80 26 0E         [ 1] 2701 	ld count,a  
      00A086 FE 72            [ 2] 2702 	ldw x,(RET_INW,sp)
      00A088 5C 00 02         [ 2] 2703 	ldw in.w,x 
      00A08B 72               [ 2] 2704 	popw x 
      002218                       2705 	_drop VSIZE 
      00A08C 5C 00            [ 2]    1     addw sp,#VSIZE 
      00A08E 02               [ 2] 2706 	jp (x)
                                   2707 
                                   2708 ;---------------------------------
                                   2709 ; check if A:X contain the address 
                                   2710 ; of a program in FLASH 
                                   2711 ; output:
                                   2712 ;     Z    set is progam 
                                   2713 ;----------------------------------
      00221B                       2714 is_program_addr:
      00A08F A3               [ 1] 2715 	tnz a 
      00A090 A0 A2            [ 1] 2716 	jrne 9$
      00A092 27 0E 00         [ 2] 2717 	cpw x,#app_space 
      00A094 25 07            [ 1] 2718 	jrult 8$
      00A094 55               [ 2] 2719 	pushw x 
      00A095 00 04 00         [ 4] 2720 	call qsign 
      00A098 02               [ 2] 2721 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      00A099 27 01            [ 1] 2722 	jreq 9$ 
      00A099 0F               [ 1] 2723 8$:	cpl a ; clr Z bit  
      00A09A 03               [ 4] 2724 9$:	ret 
                                   2725 
                                   2726 ;----------------------------------
                                   2727 ; BASIC: RUN [label]
                                   2728 ; run BASIC program in RAM
                                   2729 ;----------------------------------- 
      00222C                       2730 cmd_run: 
      00A09B AE 00 01 1F 04   [ 2] 2731 	btjf flags,#FRUN,0$  
      00A0A0 20               [ 1] 2732 	clr a 
      00A0A1 2F               [ 4] 2733 	ret
      00A0A2                       2734 0$: ; check for STOP condition 
      00A0A2 72 04 00 23 03   [ 2] 2735 	btjf flags,#FBREAK,1$
      002238                       2736 	_drop 2 
      00A0A7 CC 94            [ 2]    1     addw sp,#2 
      00A0A9 35 CD 98         [ 4] 2737 	call rest_context
      00223D                       2738 	_drop CTXT_SIZE 
      00A0AC AC A1            [ 2]    1     addw sp,#CTXT_SIZE 
      00A0AE 84 27 03 CC      [ 1] 2739 	bres flags,#FBREAK 
      00A0B2 94 35 00 22      [ 1] 2740 	bset flags,#FRUN 
      00A0B4 CC 14 53         [ 2] 2741 	jp interpreter 
      00224A                       2742 1$:	; check for label option 
      00A0B4 90 F6 93         [ 4] 2743 	call next_token 
      00A0B7 EE 01            [ 1] 2744 	cp a,#TK_LABEL 
      00A0B9 72 A9            [ 1] 2745 	jrne 3$
      00A0BB 00               [ 2] 2746 	pushw x 
      00A0BC 03 6B 03         [ 4] 2747 	call skip_string 
      00A0BF 1F               [ 2] 2748 	popw x  
      00A0C0 04 4D 2A         [ 4] 2749 	call search_program
      00A0C3 0D 7B            [ 1] 2750 	jrne 2$
      00A0C5 06 1E            [ 1] 2751 	ld a,#ERR_NO_PROGRAM
      00A0C7 07 1D 00         [ 2] 2752 	jp tb_error 
      00A0CA 01 A2 00         [ 2] 2753 2$: ldw txtbgn,x 
      00A0CD 6B 06 1F         [ 2] 2754 	subw x,#2 
      00A0D0 07               [ 2] 2755 	ldw x,(x)
      00A0D1 72 BB 00 1B      [ 2] 2756 	addw x,txtbgn 
      00A0D1 CE 00 05         [ 2] 2757 	ldw txtend,x 
      00A0D4 1F 0D            [ 2] 2758 	jra run_it 	
      002270                       2759 3$:	_unget_token 
      00A0D6 CE 00 01 1F 0B   [ 1]    1      mov in,in.saved  
      00A0DB 72 15 00         [ 2] 2760 	ldw x,txtbgn
      00A0DE 23 72 5C         [ 2] 2761 	cpw x,txtend 
      00A0E1 00 20            [ 1] 2762 	jrmi run_it 
      00A0E3 81 13 0C         [ 2] 2763 	ldw x,#err_no_prog
      00A0E4 CD 06 82         [ 4] 2764 	call puts 
      00A0E4 72 5D 00 20 26   [ 1] 2765 	mov in,count
      00A0E9 03               [ 4] 2766 	ret 
      002289                       2767 run_it:	 
      002289                       2768 	_drop 2 ; drop return address 
      00A0EA CC 94            [ 2]    1     addw sp,#2 
      00228B                       2769 run_it_02: 
      00A0EC 35 19 F9         [ 4] 2770     call ubound 
      00A0ED CD 11 21         [ 4] 2771 	call clear_vars
                                   2772 ; initialize DIM variables pointers 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      00A0ED A6 85 CD         [ 2] 2773 	ldw x,txtend 
      00A0F0 97 58 CD         [ 2] 2774 	ldw dvar_bgn,x 
      00A0F3 95 B7 13         [ 2] 2775 	ldw dvar_end,x 	 
                                   2776 ; clear data pointer 
      00A0F6 09               [ 1] 2777 	clrw x 
      00A0F7 27 03 CC         [ 2] 2778 	ldw data_ptr,x 
      00A0FA 94 35 00 08      [ 1] 2779 	clr data_ofs 
      00A0FC 72 5F 00 09      [ 1] 2780 	clr data_len 
                                   2781 ; initialize BASIC pointer 
      00A0FC CF 00 1A         [ 2] 2782 	ldw x,txtbgn 
      00A0FF F6 EE 01         [ 2] 2783 	ldw basicptr,x 
      00A102 72 FB            [ 1] 2784 	ld a,(2,x)
      00A104 04 19 03         [ 1] 2785 	ld count,a
      00A107 72 C7 00 1A      [ 1] 2786 	mov in,#3	
      00A10B 72 5C 00 1B      [ 1] 2787 	bset flags,#FRUN 
      00A10F 72 CF 00         [ 2] 2788 	jp interpreter 
                                   2789 
                                   2790 
                                   2791 ;----------------------
                                   2792 ; BASIC: END
                                   2793 ; end running program
                                   2794 ;---------------------- 
                           000001  2795 	CHAIN_BP=1 
                           000003  2796 	CHAIN_IN=3
                           000005  2797 	CHAIN_TXTBGN=5
                           000007  2798 	CHAIN_TXTEND=7
                           000008  2799 	CHAIN_CNTX_SIZE=8  
      0022BC                       2800 cmd_end: 
      0022BC                       2801 	_drop 2 ; no need for return address 
      00A112 1A C7            [ 2]    1     addw sp,#2 
                                   2802 ; check for chained program 
      00A114 00 0D CF 00      [ 1] 2803 	tnz chain_level
      00A118 0E 7B            [ 1] 2804 	jreq 8$
                                   2805 ; restore chain context 
      00A11A 06 1E 07 72      [ 1] 2806 	dec chain_level 
      00A11E B0 00            [ 2] 2807 	ldw x,(CHAIN_BP,sp) ; chain saved basicptr 
      00A120 0E C2 00         [ 2] 2808 	ldw basicptr,x 
      00A123 0D 18            [ 2] 2809 	ldw x,(CHAIN_IN,sp) ; chain saved in and count  
      00A125 03 A8 80         [ 2] 2810 	ldw in,x 
      00A128 2B 12            [ 2] 2811 	ldw x,(CHAIN_TXTBGN,sp)
      00A12A 20 25 7B         [ 2] 2812 	ldw txtbgn,x 
      00A12D 03 2A            [ 2] 2813 	ldw x,(CHAIN_TXTEND,sp)
      00A12F 07 C6 00         [ 2] 2814 	ldw txtend,x 
      0022DC                       2815 	_drop CHAIN_CNTX_SIZE ; CHAIN saved data size  
      00A132 0F 2F            [ 2]    1     addw sp,#CHAIN_CNTX_SIZE 
      00A134 07 20 1A         [ 2] 2816 	jp interpreter 
      00A137                       2817 8$: ; clean stack 
      00A137 72 0E 00         [ 2] 2818 	ldw x,#STACK_EMPTY
      00A13A 0F               [ 1] 2819 	ldw sp,x 
      00A13B 15 14 34         [ 2] 2820 	jp warm_start
                                   2821 
                                   2822 ;---------------------------
                                   2823 ; BASIC: GET var 
                                   2824 ; receive a key in variable 
                                   2825 ; don't wait 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



                                   2826 ;---------------------------
      00A13C                       2827 cmd_get:
      00A13C 1E 0D CF         [ 4] 2828 	call next_token 
      00A13F 00 05            [ 1] 2829 	cp a,#TK_VAR 
      00A141 72 01            [ 1] 2830 	jreq 0$
      00A143 00 23 05         [ 2] 2831 	jp syntax_error 
      00A146 E6 02 C7         [ 4] 2832 0$: call get_addr 
      00A149 00 03 1E         [ 2] 2833 	ldw ptr16,x 
      00A14C 0B CF 00         [ 4] 2834 	call qgetc 
      00A14F 01 81            [ 1] 2835 	jreq 2$
      00A151 CD 06 35         [ 4] 2836 	call getc  
      00A151 85 5B 0D 72      [ 4] 2837 2$: clr [ptr16]
      00A155 5A 00 20 FC      [ 1] 2838 	inc ptr8 
      00A159 72 3F 00 19      [ 4] 2839 	clr [ptr16]
      00A159 CD 95 8F A1      [ 1] 2840 	inc ptr8 
      00A15D 84 27 07 A1      [ 4] 2841 	ld [ptr16],a 
      00A161 03               [ 4] 2842 	ret 
                                   2843 
                                   2844 
                                   2845 ;-----------------
                                   2846 ; 1 Khz beep 
                                   2847 ;-----------------
      002315                       2848 beep_1khz:: 
      00A162 27 26            [ 2] 2849 	pushw y 
      00A164 CC 94 35         [ 2] 2850 	ldw x,#100
      00A167 90 AE 03 E8      [ 2] 2851 	ldw y,#1000
      00A167 90 89            [ 2] 2852 	jra beep
                                   2853 
                                   2854 ;-----------------------
                                   2855 ; BASIC: TONE expr1,expr2
                                   2856 ; used TIMER2 channel 1
                                   2857 ; to produce a tone 
                                   2858 ; arguments:
                                   2859 ;    expr1   frequency 
                                   2860 ;    expr2   duration msec.
                                   2861 ;---------------------------
      002320                       2862 tone:
      00A169 CD 95            [ 2] 2863 	pushw y 
      00A16B C1 4F 90         [ 4] 2864 	call arg_list 
      00A16E CE 00            [ 1] 2865 	cp a,#2 
      00A170 05 90            [ 1] 2866 	jreq 1$
      00A172 FE 90 89         [ 2] 2867 	jp syntax_error 
      00232C                       2868 1$: 
      00232C                       2869 	_xpop 
      00A175 13 01            [ 1]    1     ld a,(y)
      00A177 5B               [ 1]    2     ldw x,y 
      00A178 02 25            [ 2]    3     ldw x,(1,x)
      00A17A 01 4C 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A17C 89               [ 2] 2870 	pushw x ; duration 
      002336                       2871 	_xpop ; frequency
      00A17C CD 89            [ 1]    1     ld a,(y)
      00A17E EB               [ 1]    2     ldw x,y 
      00A17F 5D 26            [ 2]    3     ldw x,(1,x)
      00A181 05 A6 05 CC      [ 2]    4     addw y,#CELL_SIZE 
      00A185 94 37            [ 1] 2872 	ldw y,x ; frequency 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      00A187 90               [ 2] 2873 	popw x  ; duration 
      002342                       2874 beep:  
      00A188 85               [ 2] 2875 	pushw x 
      00A189 81 F4 24         [ 2] 2876 	ldw x,#TIM2_CLK_FREQ
      00A18A 65               [ 2] 2877 	divw x,y ; cntr=Fclk/freq 
                                   2878 ; round to nearest integer 
      00A18A 90 89 89 CD      [ 2] 2879 	cpw y,#TIM2_CLK_FREQ/2
      00A18E 95 A8            [ 1] 2880 	jrmi 2$
      00A190 72               [ 1] 2881 	incw x 
      00234E                       2882 2$:	 
      00A191 5F               [ 1] 2883 	ld a,xh 
      00A192 00 0E 90         [ 1] 2884 	ld TIM2_ARRH,a 
      00A195 CE               [ 1] 2885 	ld a,xl 
      00A196 00 1C 90         [ 1] 2886 	ld TIM2_ARRL,a 
                                   2887 ; 50% duty cycle 
      00A199 E6               [ 1] 2888 	ccf 
      00A19A 03               [ 2] 2889 	rrcw x 
      00A19B A1               [ 1] 2890 	ld a,xh 
      00A19C 03 27 15         [ 1] 2891 	ld TIM2_CCR1H,a 
      00A19F 90               [ 1] 2892 	ld a,xl
      00A1A0 E6 02 C7         [ 1] 2893 	ld TIM2_CCR1L,a
      00A1A3 00 0F 72 B9      [ 1] 2894 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A1A7 00 0E 90 C3      [ 1] 2895 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A1AB 00 1E 25 E9      [ 1] 2896 	bset TIM2_EGR,#TIM2_EGR_UG
      00A1AF A6               [ 2] 2897 	popw x 
      00A1B0 0A CC 94         [ 4] 2898 	call pause02
      00A1B3 37 11 53 08      [ 1] 2899 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A1B4 72 11 53 00      [ 1] 2900 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A1B4 90 89            [ 2] 2901 	popw y 
      00A1B6 72               [ 4] 2902 	ret 
                                   2903 
                                   2904 ;-------------------------------
                                   2905 ; BASIC: ADCON 0|1 [,divisor]  
                                   2906 ; disable/enanble ADC 
                                   2907 ;-------------------------------
                           000003  2908 	ONOFF=3 
                           000001  2909 	DIVSOR=1
                           000004  2910 	VSIZE=4 
      00237B                       2911 power_adc:
      00A1B7 A9 00 04         [ 4] 2912 	call arg_list 
      00A1BA 1E 03            [ 1] 2913 	cp a,#2	
      00A1BC CD 91            [ 1] 2914 	jreq 1$
      00A1BE 3C 26            [ 1] 2915 	cp a,#1 
      00A1C0 04 90            [ 1] 2916 	jreq 0$ 
      00A1C2 85 20 DA         [ 2] 2917 	jp syntax_error 
      00A1C5 4F               [ 1] 2918 0$:	clr a 
      00A1C5 85               [ 1] 2919 	clrw x
      00238B                       2920 	_xpush   ; divisor  
      00A1C6 5B 02 90 85      [ 2]    1     subw y,#CELL_SIZE
      00A1CA 81 F7            [ 1]    2     ld (y),a 
      00A1CB 90 EF 01         [ 2]    3     ldw (1,y),x 
      002394                       2921 1$: _at_next 
      00A1CB CD 97 4D         [ 1]    1     ld a,(3,y)
      00A1CE CD               [ 1]    2     ldw x,y 
      00A1CF 98 AC            [ 2]    3     ldw x,(4,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      00A1D1 A1               [ 2] 2922 	tnzw x 
      00A1D2 84 27            [ 1] 2923 	jreq 2$ 
      00239D                       2924 	_xpop
      00A1D4 03 CC            [ 1]    1     ld a,(y)
      00A1D6 94               [ 1]    2     ldw x,y 
      00A1D7 35 90            [ 2]    3     ldw x,(1,x)
      00A1D9 F6 93 EE 01      [ 2]    4     addw y,#CELL_SIZE 
      0023A6                       2925 	_xdrop  
      00A1DD 72 A9 00 03      [ 2]    1     addw y,#CELL_SIZE 
      00A1E1 9F               [ 1] 2926 	ld a,xl
      00A1E2 27 68            [ 1] 2927 	and a,#7
      00A1E4 88               [ 1] 2928 	swap a 
      00A1E5 CD 95 8F         [ 1] 2929 	ld ADC_CR1,a
      00A1E8 A1 80 27 03      [ 1] 2930 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A1EC CC 94 35 FE      [ 1] 2931 	bset ADC_CR1,#ADC_CR1_ADON 
      0023B9                       2932 	_usec_dly 7 
      00A1F0 72 5C 00         [ 2]    1     ldw x,#(16*7-2)/4
      00A1F3 02               [ 2]    2     decw x
      00A1F4 72               [ 1]    3     nop 
      00A1F5 5C 00            [ 1]    4     jrne .-4
      00A1F7 02 A3            [ 2] 2933 	jra 3$
      00A1F9 A2 56 27 08      [ 1] 2934 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A1FD A3 A2 69 27      [ 1] 2935 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      0023CA                       2936 3$:	
      00A201 03               [ 4] 2937 	ret
                                   2938 
                                   2939 ;-----------------------------
                                   2940 ; BASIC: ADCREAD (channel)
                                   2941 ; read adc channel {0..5}
                                   2942 ; output:
                                   2943 ;   A 		TK_INTGR 
                                   2944 ;   X 		value 
                                   2945 ;-----------------------------
      0023CB                       2946 analog_read:
      00A202 CC 94 35         [ 4] 2947 	call func_args 
      00A205 A1 01            [ 1] 2948 	cp a,#1 
      00A205 84 89            [ 1] 2949 	jreq 1$
      00A207 88 13 B5         [ 2] 2950 	jp syntax_error
      00A208                       2951 1$: _xpop 
      00A208 0A 01            [ 1]    1     ld a,(y)
      00A20A 27               [ 1]    2     ldw x,y 
      00A20B 26 CD            [ 2]    3     ldw x,(1,x)
      00A20D 95 8F A1 84      [ 2]    4     addw y,#CELL_SIZE 
      00A211 27 07 A1         [ 2] 2952 	cpw x,#5 
      00A214 03 27            [ 2] 2953 	jrule 2$
      00A216 0D CC            [ 1] 2954 	ld a,#ERR_BAD_VALUE
      00A218 94 35 B7         [ 2] 2955 	jp tb_error 
      00A21A 9F               [ 1] 2956 2$: ld a,xl
      00A21A C6 00 02         [ 1] 2957 	ld acc8,a 
      00A21D AB 03            [ 1] 2958 	ld a,#5
      00A21F C7 00 02         [ 1] 2959 	sub a,acc8 
      00A222 20 03 CD         [ 1] 2960 	ld ADC_CSR,a
      00A225 95 A8 54 02      [ 1] 2961 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A227 72 10 54 01      [ 1] 2962 	bset ADC_CR1,#ADC_CR1_ADON
      00A227 CD 95 8F A1 08   [ 2] 2963 	btjf ADC_CSR,#ADC_CSR_EOC,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      00A22C 27 DA 5B         [ 2] 2964 	ldw x,ADC_DRH
      00A22F 03 20            [ 1] 2965 	ld a,#TK_INTGR
      00A231 1A               [ 4] 2966 	ret 
                                   2967 
                                   2968 ;-----------------------
                                   2969 ; BASIC: DREAD(pin)
                                   2970 ; Arduino pins 
                                   2971 ; read state of a digital pin 
                                   2972 ; pin# {0..15}
                                   2973 ; output:
                                   2974 ;    A 		TK_INTGR
                                   2975 ;    X      0|1 
                                   2976 ;-------------------------
                           000001  2977 	PINNO=1
                           000001  2978 	VSIZE=1
      00A232                       2979 digital_read:
      002407                       2980 	_vars VSIZE 
      00A232 5B 01            [ 2]    1     sub sp,#VSIZE 
      00A234 CD A1 59         [ 4] 2981 	call func_args
      00A237 CF 00            [ 1] 2982 	cp a,#1
      00A239 1A 55            [ 1] 2983 	jreq 1$
      00A23B 00 03 00         [ 2] 2984 	jp syntax_error
      002413                       2985 1$: _xpop 
      00A23E 02 85            [ 1]    1     ld a,(y)
      00A240 A3               [ 1]    2     ldw x,y 
      00A241 A2 56            [ 2]    3     ldw x,(1,x)
      00A243 26 05 CE 00      [ 2]    4     addw y,#CELL_SIZE 
      00A247 1A 20 12         [ 2] 2986 	cpw x,#15 
      00A24A 23 05            [ 2] 2987 	jrule 2$
      00A24A 20 26            [ 1] 2988 	ld a,#ERR_BAD_VALUE
      00A24C CC 13 B7         [ 2] 2989 	jp tb_error 
      00A24C 55 00 03         [ 4] 2990 2$:	call select_pin 
      00A24F 00 02            [ 1] 2991 	ld (PINNO,sp),a
      00A251 5B 02            [ 1] 2992 	ld a,(GPIO_IDR,x)
      00A253 CC 94            [ 1] 2993 	tnz (PINNO,sp)
      00A255 DB 05            [ 1] 2994 	jreq 8$
      00A256 44               [ 1] 2995 3$: srl a 
      00A256 CD 97            [ 1] 2996 	dec (PINNO,sp)
      00A258 4D FB            [ 1] 2997 	jrne 3$ 
      00A259 A4 01            [ 1] 2998 8$: and a,#1 
      00A259 CD               [ 1] 2999 	clrw x 
      00A25A A1               [ 1] 3000 	ld xl,a 
      00A25B 59               [ 1] 3001 	clr a 
      00A25C                       3002 	_drop VSIZE
      00A25C CF 00            [ 2]    1     addw sp,#VSIZE 
      00A25E 05               [ 4] 3003 	ret
                                   3004 
                                   3005 
                                   3006 ;-----------------------
                                   3007 ; BASIC: DWRITE pin,0|1
                                   3008 ; Arduino pins 
                                   3009 ; write to a digital pin 
                                   3010 ; pin# {0..15}
                                   3011 ; output:
                                   3012 ;    A 		TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



                                   3013 ;    X      0|1 
                                   3014 ;-------------------------
                           000001  3015 	PINNO=1
                           000002  3016 	PINVAL=2
                           000002  3017 	VSIZE=2
      00243E                       3018 digital_write:
      00243E                       3019 	_vars VSIZE 
      00A25F E6 02            [ 2]    1     sub sp,#VSIZE 
      00A261 C7 00 03         [ 4] 3020 	call arg_list  
      00A264 35 03            [ 1] 3021 	cp a,#2 
      00A266 00 02            [ 1] 3022 	jreq 1$
      00A268 81 13 B5         [ 2] 3023 	jp syntax_error
      00A269                       3024 1$: _xpop 
      00A269 CD 97            [ 1]    1     ld a,(y)
      00A26B 4D               [ 1]    2     ldw x,y 
      00A26C EE 01            [ 2]    3     ldw x,(1,x)
      00A26C CD A1 59 CF      [ 2]    4     addw y,#CELL_SIZE 
      00A270 00               [ 1] 3025 	ld a,xl 
      00A271 1A 02            [ 1] 3026 	ld (PINVAL,sp),a
      00A272                       3027 	_xpop 
      00A272 85 52            [ 1]    1     ld a,(y)
      00A274 04               [ 1]    2     ldw x,y 
      00A275 89 CE            [ 2]    3     ldw x,(1,x)
      00A277 00 05 1F 03      [ 2]    4     addw y,#CELL_SIZE 
      00A27B CE 00 01         [ 2] 3028 	cpw x,#15 
      00A27E 1F 05            [ 2] 3029 	jrule 2$
      00A280 CE 00            [ 1] 3030 	ld a,#ERR_BAD_VALUE
      00A282 1A 20 D7         [ 2] 3031 	jp tb_error 
      00A285 CD 29 BF         [ 4] 3032 2$:	call select_pin 
      00A285 CD 97            [ 1] 3033 	ld (PINNO,sp),a 
      00A287 4D 1E            [ 1] 3034 	ld a,#1
      00A289 03 CF            [ 1] 3035 	tnz (PINNO,sp)
      00A28B 00 05            [ 1] 3036 	jreq 4$
      00A28D E6               [ 1] 3037 3$: sll a
      00A28E 02 C7            [ 1] 3038 	dec (PINNO,sp)
      00A290 00 03            [ 1] 3039 	jrne 3$
      00A292 1E 05            [ 1] 3040 4$: tnz (PINVAL,sp)
      00A294 CF 00            [ 1] 3041 	jrne 5$
      00A296 01               [ 1] 3042 	cpl a 
      00A297 85 5B            [ 1] 3043 	and a,(GPIO_ODR,x)
      00A299 04 FC            [ 2] 3044 	jra 8$
      00A29B EA 00            [ 1] 3045 5$: or a,(GPIO_ODR,x)
      00A29B 4D 26            [ 1] 3046 8$: ld (GPIO_ODR,x),a 
      002486                       3047 	_drop VSIZE 
      00A29D 0D A3            [ 2]    1     addw sp,#VSIZE 
      00A29F B4               [ 4] 3048 	ret
                                   3049 
                                   3050 
                                   3051 ;-----------------------
                                   3052 ; BASIC: STOP
                                   3053 ; stop progam execution  
                                   3054 ; without resetting pointers 
                                   3055 ; the program is resumed
                                   3056 ; with RUN 
                                   3057 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      002489                       3058 stop:
      00A2A0 80 25 07 89 CD   [ 2] 3059 	btjt flags,#FRUN,2$
      00A2A5 A6               [ 4] 3060 	ret 
      00248F                       3061 2$:	 
                                   3062 ; create space on cstack to save context 
      00A2A6 2C 85 27         [ 2] 3063 	ldw x,#break_point 
      00A2A9 01 43 81         [ 4] 3064 	call puts 
      00A2AC                       3065 	_drop 2 ;drop return address 
      00A2AC 72 01            [ 2]    1     addw sp,#2 
      002497                       3066 	_vars CTXT_SIZE ; context size 
      00A2AE 00 23            [ 2]    1     sub sp,#CTXT_SIZE 
      00A2B0 02 4F 81         [ 4] 3067 	call save_context 
      00A2B3 AE 16 68         [ 2] 3068 	ldw x,#tib 
      00A2B3 72 09 00         [ 2] 3069 	ldw basicptr,x
      00A2B6 23               [ 1] 3070 	clr (x)
      00A2B7 12 5B 02 CD      [ 1] 3071 	clr count  
      00A2BB 9E               [ 1] 3072 	clrw x 
      00A2BC 3D 5B 04         [ 2] 3073 	ldw in.w,x
      00A2BF 72 19 00 23      [ 1] 3074 	bres flags,#FRUN 
      00A2C3 72 10 00 23      [ 1] 3075 	bset flags,#FBREAK
      00A2C7 CC 94 D3         [ 2] 3076 	jp interpreter 
      00A2CA 0A 62 72 65 61 6B 20  3077 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   3078 
                                   3079 ;-----------------------
                                   3080 ; BASIC: NEW
                                   3081 ; from command line only 
                                   3082 ; free program memory
                                   3083 ; and clear variables 
                                   3084 ;------------------------
      0024D4                       3085 new: 
      00A2CA CD 95 8F         [ 4] 3086 	call cmd_line_only
      00A2CD A1 03 26 1F      [ 1] 3087 0$:	clr flags 
      00A2D1 89 CD 95         [ 4] 3088 	call clear_basic 
      00A2D4 A8               [ 4] 3089 	ret 
                                   3090 
                                   3091 ;-----------------------------------
                                   3092 ; erase program at specified address
                                   3093 ; keep signature and size fields. 
                                   3094 ; signature replaced by "XX"
                                   3095 ; input:
                                   3096 ;    X    address 
                                   3097 ;-----------------------------------
                           000001  3098 	ADDR=1    ; program address
                           000003  3099 	PRG_SIZE=3    ; program size 
                           000005  3100 	BLOCKS=5 ; blocks to erase 
                           000006  3101 	VSIZE=6
      0024DF                       3102 erase_program:
      00A2D5 85               [ 2] 3103 	pushw x 
      00A2D6 CD AF 87         [ 4] 3104 	call skip_string 
      00A2D9 26               [ 2] 3105 	popw x 
      00A2DA 05 A6 12         [ 4] 3106 	call search_program 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      00A2DD CC 94            [ 1] 3107 	jreq 9$
      00A2DF 37 CF 00         [ 4] 3108 	call move_erase_to_ram
      00A2E2 1C 1D 00 02      [ 1] 3109 	clr farptr 
      0024F0                       3110 	_vars VSIZE 
      00A2E6 FE 72            [ 2]    1     sub sp,#VSIZE 
      00A2E8 BB 00 1C         [ 2] 3111 1$:	subw x,#4 
      00A2EB CF 00            [ 2] 3112 	ldw (ADDR,sp),x
      00A2ED 1E 20            [ 2] 3113 	ldw x,(2,x)
      00A2EF 19 55            [ 2] 3114 	ldw (PRG_SIZE,sp),x
      00A2F1 00 04            [ 1] 3115 	ld a,#BLOCK_SIZE 
      00A2F3 00               [ 2] 3116 	div x,a 
      00A2F4 02               [ 1] 3117 	tnz a 
      00A2F5 CE 00            [ 1] 3118 	jreq 2$ 
      00A2F7 1C               [ 1] 3119 	incw x 
      00A2F8 C3 00            [ 2] 3120 2$:	ldw (BLOCKS,sp),x 
      00A2FA 1E 2B            [ 2] 3121 	ldw x,(ADDR,sp)
      00A2FC 0C AE 93         [ 2] 3122 	ldw ptr16,x 
      00A2FF 8C CD 87         [ 4] 3123 3$:	call block_erase
      00A302 02 55 00         [ 2] 3124 	ldw x,#BLOCK_SIZE 
      00A305 03 00 02         [ 4] 3125 	call incr_farptr
      00A308 81 05            [ 2] 3126 	ldw x,(BLOCKS,sp)
      00A309 5A               [ 2] 3127 	decw x 
      00A309 5B 02            [ 2] 3128 	ldw (BLOCKS,sp),x 
      00A30B 26 F0            [ 1] 3129 	jrne 3$ 
                                   3130 ; write XX and size at addr 
      00A30B CD 9A            [ 2] 3131 	ldw x,(ADDR,sp)
      00A30D 79 CD 91         [ 2] 3132 	ldw ptr16,x 
      00A310 A1 CE            [ 1] 3133 	ld a,#'X 
      00A312 00               [ 1] 3134 	clrw x 
      00A313 1E CF 00         [ 4] 3135 	call write_byte 
      00A316 30 CF 00         [ 4] 3136 	call write_byte 
      00A319 32 5F            [ 1] 3137 	ld a,(PRG_SIZE,sp)
      00A31B CF 00 07         [ 4] 3138 	call write_byte 
      00A31E 72 5F            [ 1] 3139 	ld a,(PRG_SIZE+1,sp)
      00A320 00 09 72         [ 4] 3140 	call write_byte 
      002531                       3141 	_drop VSIZE 
      00A323 5F 00            [ 2]    1     addw sp,#VSIZE 
      002533                       3142 9$:	
      00A325 0A               [ 4] 3143 	ret 
                                   3144 
                                   3145 ;-----------------------------------
                                   3146 ; BASIC: ERASE \E | \F || address
                                   3147 ; erase all block in range from 
                                   3148 ;  'app_space' to FLASH end (0x27fff)
                                   3149 ;  or all EEPROM 
                                   3150 ; that contains a non zero byte. 
                                   3151 ; if the argument is an address  
                                   3152 ; mark the program at this address 
                                   3153 ; as erased. Erase the blocks 
                                   3154 ; replace signature by 'XX' and 
                                   3155 ; keep size field.  
                                   3156 ;-----------------------------------
                           000001  3157 	LIMIT=1 
                           000003  3158 	VSIZE = 3 
      002534                       3159 cmd_erase:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00A326 CE 00 1C         [ 4] 3160 	call cmd_line_only
      00A329 CF 00 05 E6      [ 1] 3161 	clr farptr 
      00A32D 02 C7 00         [ 4] 3162 	call next_token
      00A330 03 35            [ 1] 3163 	cp a,#TK_LABEL 
      00A332 03 00            [ 1] 3164 	jreq erase_program  
      002542                       3165 	_vars VSIZE 
      00A334 02 72            [ 2]    1     sub sp,#VSIZE 
      00A336 10 00            [ 1] 3166 	cp a,#TK_CHAR 
      00A338 23 CC            [ 1] 3167 	jreq 0$ 
      00A33A 94 D3 B5         [ 2] 3168 	jp syntax_error
      00A33C CD 15 51         [ 4] 3169 0$: call get_char 
      00A33C 5B 02            [ 1] 3170 	and a,#0XDF 
      00A33E 72 5D            [ 1] 3171 	cp a,#'E
      00A340 00 34            [ 1] 3172 	jrne 1$
      00A342 27 1D 72         [ 2] 3173 	ldw x,#EEPROM_BASE 
      00A345 5A 00 34         [ 2] 3174 	ldw farptr+1,x 
      00A348 1E 01 CF         [ 2] 3175 	ldw x,#EEPROM_END
      00A34B 00               [ 1] 3176 	clr a 
      00A34C 05 1E            [ 2] 3177 	jra 3$ 
      00A34E 03 CF            [ 1] 3178 1$: cp a,#'F 
      00A350 00 02            [ 1] 3179 	jreq 2$
      00A352 1E 05 CF         [ 2] 3180 	ldw x,#err_bad_value
      00A355 00 1C 1E         [ 2] 3181 	jp tb_error
      00256A                       3182 2$:
      00A358 07 CF 00         [ 2] 3183 	ldw x,#app_space  
      00A35B 1E 5B 08         [ 2] 3184 	ldw farptr+1,x 
      00A35E CC 94            [ 1] 3185 	ld a,#(FLASH_END>>16)&0XFF 
      00A360 D3 7F FF         [ 2] 3186 	ldw x,#FLASH_END&0xffff
      00A361                       3187 3$:
      00A361 AE 17            [ 1] 3188 	ld (LIMIT,sp),a 
      00A363 FF 94            [ 2] 3189 	ldw (LIMIT+1,sp),x 
                                   3190 ; operation done from RAM
                                   3191 ; copy code to RAM in tib   
      00A365 CC 94 B4         [ 4] 3192 	call move_erase_to_ram
      00A368                       3193 4$:	 
      00A368 CD 95 8F         [ 4] 3194     call scan_block 
      00A36B A1 85            [ 1] 3195 	jreq 5$  ; block already erased 
      00A36D 27 03            [ 1] 3196     ld a,#'E 
      00A36F CC 94 35         [ 4] 3197     call putc 
      00A372 CD 95 B7         [ 4] 3198 	call block_erase   
                                   3199 ; this block is clean, next  
      00A375 CF 00 1A         [ 2] 3200 5$:	ldw x,#BLOCK_SIZE
      00A378 CD 86 AE         [ 4] 3201 	call incr_farptr
                                   3202 ; check limit, 24 bit substraction  	
      00A37B 27 03            [ 1] 3203 	ld a,(LIMIT,sp)
      00A37D CD 86            [ 2] 3204 	ldw x,(LIMIT+1,sp)
      00A37F B5 72 3F 00      [ 2] 3205 	subw x,farptr+1
      00A383 1A 72 5C         [ 1] 3206 	sbc a,farptr 
      00A386 00 1B            [ 1] 3207 	jrugt 4$ 
      00A388 72 3F 00         [ 4] 3208 9$: call clear_basic
      00A38B 1A 72            [ 2] 3209 	ldw x,(LIMIT+1,sp)
      00A38D 5C 00 1B         [ 2] 3210 	cpw x,#EEPROM_END
      00A390 72 C7            [ 1] 3211 	jrne 10$
      00A392 00 1A 81         [ 4] 3212 	call func_eefree 
      00A395                       3213 10$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      0025A9                       3214 	_drop VSIZE 
      00A395 90 89            [ 2]    1     addw sp,#VSIZE 
      00A397 AE               [ 4] 3215 	ret 
                                   3216 	
                                   3217 
                                   3218 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3219 ;  check for application signature 
                                   3220 ; input:
                                   3221 ;	x       address to check 
                                   3222 ; output:
                                   3223 ;   Z      1  signature present 
                                   3224 ;          0 not app signature  
                                   3225 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025AC                       3226 qsign: 
      00A398 00               [ 2] 3227 	pushw x 
                                   3228 ; align to block 
      00A399 64               [ 1] 3229 	ld a,xl 
      00A39A 90 AE            [ 1] 3230 	and a,#BLOCK_SIZE 
      00A39C 03               [ 1] 3231 	ld xl,a 
      00A39D E8               [ 2] 3232 	ldw x,(x)
      00A39E 20 22 C7         [ 2] 3233 	cpw x,SIGNATURE ; "TB" 
      00A3A0 85               [ 2] 3234 	popw x 
      00A3A0 90               [ 4] 3235 	ret 
                                   3236 
                                   3237 ;--------------------------------------
                                   3238 ;  fill write buffer 
                                   3239 ;  input:
                                   3240 ;    y  point to output buffer 
                                   3241 ;    x  point to source 
                                   3242 ;    a  bytes to write in buffer 
                                   3243 ;  output:
                                   3244 ;    y   += A 
                                   3245 ;    X   += A 
                                   3246 ;    A   0 
                                   3247 ;---------------------------------------
      0025B7                       3248 fill_write_buffer:
      00A3A1 89               [ 1] 3249 	push a 
      00A3A2 CD               [ 1] 3250 	tnz a 
      00A3A3 97 6A            [ 1] 3251 	jreq 9$ 
      00A3A5 A1               [ 1] 3252 1$: ld a,(x)
      00A3A6 02               [ 1] 3253 	incw x 
      00A3A7 27 03            [ 1] 3254 	ld (y),a 
      00A3A9 CC 94            [ 1] 3255 	incw y 
      00A3AB 35 01            [ 1] 3256 	dec (1,sp) 
      00A3AC 26 F6            [ 1] 3257 	jrne 1$ 
      00A3AC 90               [ 1] 3258 9$:	pop a 
      00A3AD F6               [ 4] 3259     ret 	
                                   3260 
                                   3261 ;--------------------------------------
                                   3262 ;  fill pad buffer with zero 
                                   3263 ;  input:
                                   3264 ;	none 
                                   3265 ;  output:
                                   3266 ;    y     buffer address  
                                   3267 ;--------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      0025C7                       3268 clear_block_buffer:
      00A3AE 93               [ 1] 3269 	push a 
      00A3AF EE 01 72 A9      [ 2] 3270 	ldw y,#block_buffer 
      00A3B3 00 03            [ 2] 3271 	pushw y
      00A3B5 89 90            [ 1] 3272 	ld a,#BLOCK_SIZE   
      00A3B7 F6 93            [ 1] 3273 1$:	clr (y)
      00A3B9 EE 01            [ 1] 3274 	incw y
      00A3BB 72               [ 1] 3275 	dec a  
      00A3BC A9 00            [ 1] 3276 	jrne 1$ 	
      00A3BE 03 90            [ 2] 3277 9$: popw y 
      00A3C0 93               [ 1] 3278 	pop a 			
      00A3C1 85               [ 4] 3279 	ret 
                                   3280 
                                   3281 
                                   3282 ;----------------------------------
                                   3283 ;  search  a free space space that 
                                   3284 ;  fit program size 
                                   3285 ; input:
                                   3286 ;    X    program size 
                                   3287 ; output:
                                   3288 ;    X    address | 0 
                                   3289 ;------------------------------------
                           000001  3290 	PG_SIZE=1 
                           000002  3291 	VSIZE=2 
      00A3C2                       3292 search_fit:
      00A3C2 89               [ 2] 3293 	pushw x; PG_SIZE 
      00A3C3 AE F4 24         [ 2] 3294 	ldw x,#app_space 
      00A3C6 65 90 A3         [ 4] 3295 1$:	call is_erased 
      00A3C9 7A 12            [ 1] 3296 	jreq 4$
      00A3CB 2B               [ 1] 3297 	ld a,(x)
      00A3CC 01 5C            [ 1] 3298 	or a,(1,x)
      00A3CE 27 23            [ 1] 3299 	jreq 9$ ; free space 
      00A3CE 9E C7 53         [ 4] 3300 2$:	call skip_to_next
      00A3D1 0D               [ 2] 3301 	tnzw x 
      00A3D2 9F C7            [ 1] 3302 	jrne 1$
      00A3D4 53 0E            [ 2] 3303 	jra 9$
      0025F1                       3304 4$: ; erased program 
                                   3305     ; does it fit? 
      00A3D6 8C 56 9E         [ 2] 3306 	ldw acc16,x 
      00A3D9 C7 53            [ 2] 3307 	ldw x,(2,x) ; size erased program
                                   3308 ; top multiple of BLOCK_SIZE 
      00A3DB 0F 9F C7         [ 2] 3309 	addw x,#4 
      00A3DE 53 10 72         [ 2] 3310 	addw x,#BLOCK_SIZE-1 
      00A3E1 10               [ 1] 3311 	ld a,xl 
      00A3E2 53 08            [ 1] 3312 	and a,#BLOCK_SIZE 
      00A3E4 72               [ 1] 3313 	ld xl,a  
      00A3E5 10 53            [ 2] 3314 	cpw x,(1,sp) ; size program to save 
      00A3E7 00 72            [ 1] 3315 	jruge 8$   ; fit 
      00A3E9 10 53 04         [ 2] 3316 	ldw x,acc16 
      00A3EC 85 CD            [ 2] 3317 	jra 2$ 
      00A3EE A8 FC 72         [ 2] 3318 8$: ldw x,acc16 ; fit in this one 	
      00260C                       3319 9$:	_drop VSIZE 
      00A3F1 11 53            [ 2]    1     addw sp,#VSIZE 
      00A3F3 08               [ 4] 3320 	ret  
                                   3321 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



                                   3322 ;-------------------------
                                   3323 ; erase header and 
                                   3324 ; size fields 
                                   3325 ; input: 
                                   3326 ;    X    program address 
                                   3327 ; output:
                                   3328 ;    X    unchanged 
                                   3329 ;-------------------------
                           000001  3330 	COUNT=1 
      00260F                       3331 erase_header:
      00A3F4 72               [ 2] 3332 	pushw x 
      00A3F5 11 53            [ 1] 3333 	push #4 ; COUNT 
      00A3F7 00 90 85 81      [ 1] 3334 	clr farptr 
      00A3FB CF 00 19         [ 2] 3335 	ldw ptr16,x 
      00A3FB CD               [ 1] 3336 	clr a 
      00A3FC 97               [ 1] 3337 	clrw x 
      00A3FD 6A A1 02         [ 4] 3338 1$:	call write_byte 
      00A400 27 12            [ 1] 3339 	dec (COUNT,sp)
      00A402 A1 01            [ 1] 3340 	jrne 1$
      002622                       3341 	_drop 1 
      00A404 27 03            [ 2]    1     addw sp,#1 
      00A406 CC               [ 2] 3342 	popw x 
      00A407 94 35 4F         [ 2] 3343 	ldw ptr16,x 
      00A40A 5F               [ 4] 3344 	ret 
                                   3345 
                                   3346 ;---------------------------------------
                                   3347 ; BASIC: SAVE
                                   3348 ; write application from RAM to FLASH
                                   3349 ; at UFLASH address
                                   3350 ;--------------------------------------
                           000001  3351 	XTEMP=1
                           000003  3352 	COUNT=3  ; last count bytes written 
                           000004  3353 	CNT_LO=4 ; count low byte 
                           000005  3354 	TOWRITE=5 ; how bytes left to write  
                           000006  3355 	VSIZE=6 
      002629                       3356 cmd_save:
      00A40B 72 A2 00         [ 4] 3357 	call cmd_line_only
      00A40E 03               [ 2] 3358 	pushw x 
      00A40F 90 F7            [ 2] 3359 	pushw y 
      00262F                       3360 	_vars VSIZE
      00A411 90 EF            [ 2]    1     sub sp,#VSIZE 
      00A413 01 90 E6         [ 4] 3361 	call prog_size 
      00A416 03 93            [ 1] 3362 	jrne 0$ 
      00A418 EE 04 5D         [ 2] 3363 	jp 9$ ; no program to save 
      00A41B 27 25            [ 2] 3364 0$:	ldw (TOWRITE,sp),x ; program size
      00A41D 90 F6 93 EE      [ 1] 3365 	clr farptr 
      00A421 01 72 A9         [ 4] 3366 	call search_fit
      00A424 00 03 72         [ 2] 3367 	ldw ptr16,x 
      00A427 A9 00 03         [ 2] 3368 	ldw x,#0xFFFF
      00A42A 9F A4 07 4E      [ 2] 3369 	subw x,ptr16 ; free flash 
      00A42E C7 54 01         [ 2] 3370 	subw x,#4 ; signature and size field 
      00A431 72 16            [ 2] 3371 	cpw x,(TOWRITE,sp)
      00A433 50 CA            [ 1] 3372 	jruge 1$
      00A435 72 10            [ 1] 3373 	ld a,#ERR_MEM_FULL
      00A437 54 01 AE         [ 2] 3374 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



      002658                       3375 1$: ; check if header bytes are zero's 
      00A43A 00 1B 5A         [ 2] 3376 	ldw x,ptr16 
      00A43D 9D               [ 1] 3377 	ld a,(x)
      00A43E 26 FA            [ 1] 3378 	or a,(1,x)
      00A440 20 08            [ 1] 3379 	or a,(2,x)
      00A442 72 11            [ 1] 3380 	or a,(3,x)
      00A444 54 01            [ 1] 3381 	jreq 2$
      00A446 72 17 50         [ 4] 3382 	call erase_header ; preserve X and farptr 
      002667                       3383 2$: 
                                   3384 ; block programming flash
                                   3385 ; must be done from RAM
                                   3386 ; moved in tib  
      00A449 CA 04 4D         [ 4] 3387 	call move_prg_to_ram
                                   3388 ; initialize written bytes count  
      00A44A 0F 03            [ 1] 3389 	clr (COUNT,sp)
                                   3390 ; first bock 
                                   3391 ; containt signature 2 bytes 
                                   3392 ; and size 	2 bytes 
                                   3393 ; use Y as pointer to block_buffer
      00A44A 81 25 C7         [ 4] 3394 	call clear_block_buffer ; -- y=*block_buffer	
                                   3395 ; write signature
      00A44B CE 26 C7         [ 2] 3396 	ldw x,SIGNATURE ; "TB" 
      00A44B CD 97            [ 2] 3397 	ldw (y),x 
      00A44D 65 A1 01 27      [ 2] 3398 	addw y,#2
      00A451 03 CC            [ 2] 3399 	ldw x,(TOWRITE,sp)
      00A453 94 35            [ 2] 3400 	ldw (y),x
      00A455 90 F6 93 EE      [ 2] 3401 	addw y,#2   
      00A459 01 72            [ 1] 3402 	ld a,#(BLOCK_SIZE-4)
      00A45B A9 00 03         [ 2] 3403 	cpw x,#(BLOCK_SIZE-4) 
      00A45E A3 00            [ 1] 3404 	jrugt 3$
      00A460 05               [ 1] 3405 	ld a,xl 
      00A461 23 05            [ 1] 3406 3$:	ld (CNT_LO,sp),a   
      00A463 A6 0A CC         [ 2] 3407 	ldw x,txtbgn 
      00A466 94 37            [ 2] 3408 	ldw (XTEMP,sp),x 
      00268F                       3409 32$: 
      00A468 9F C7            [ 2] 3410 	ldw x,(XTEMP,sp)
      00A46A 00 0F            [ 1] 3411 	ld a,(CNT_LO,sp)
      00A46C A6 05 C0         [ 4] 3412 	call fill_write_buffer 
      00A46F 00 0F            [ 2] 3413 	ldw (XTEMP,sp),x 
      00A471 C7 54 00         [ 2] 3414 	ldw x,#block_buffer
      00A474 72 16 54         [ 4] 3415 	call write_buffer
      00A477 02 72 10         [ 2] 3416 	ldw x,#BLOCK_SIZE 
      00A47A 54 01 72         [ 4] 3417 	call incr_farptr  
                                   3418 ; following blocks 
      00A47D 0F 54            [ 2] 3419 	ldw x,(XTEMP,sp)
      00A47F 00 FB CE         [ 2] 3420 	cpw x,txtend 
      00A482 54 04            [ 1] 3421 	jruge 9$ 
      00A484 A6 84            [ 2] 3422 	ldw x,(TOWRITE,sp)
      00A486 81 F0 03         [ 2] 3423 	subw x,(COUNT,sp)
      00A487 1F 05            [ 2] 3424 	ldw (TOWRITE,sp),x 
      00A487 52 01            [ 1] 3425 	ld a,#BLOCK_SIZE 
      00A489 CD 97 65         [ 2] 3426 	cpw x,#BLOCK_SIZE 
      00A48C A1 01            [ 1] 3427 	jruge 4$ 
      00A48E 27               [ 1] 3428 	ld a,xl 
      00A48F 03 CC            [ 1] 3429 4$:	ld (CNT_LO,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00A491 94 35 90         [ 4] 3430 	call clear_block_buffer 
      00A494 F6 93            [ 2] 3431 	jra 32$ 
      0026C1                       3432 9$:	_drop VSIZE 
      00A496 EE 01            [ 2]    1     addw sp,#VSIZE 
      00A498 72 A9            [ 2] 3433     popw y 
      00A49A 00               [ 2] 3434 	popw x 
      00A49B 03               [ 4] 3435 	ret 
                                   3436 
      00A49C A3 00                 3437 SIGNATURE: .ascii "TB"
      00A49E 0F 23                 3438 ERASED: .ascii "XX" 
                                   3439 
                                   3440 ;---------------------
                                   3441 ; check if there is 
                                   3442 ; an erased program 
                                   3443 ; at this address 
                                   3444 ; input:
                                   3445 ;    X    address 
                                   3446 ; output:
                                   3447 ;    Z    Set=erased program 
                                   3448 ;--------------------
      0026CB                       3449 is_erased:
      00A4A0 05               [ 2] 3450 	pushw x 
                                   3451 ; align to BLOCK 
      00A4A1 A6               [ 1] 3452 	ld a,xl 
      00A4A2 0A CC            [ 1] 3453 	and a,#BLOCK_SIZE 
      00A4A4 94               [ 1] 3454 	ld xl,a 
      00A4A5 37               [ 2] 3455 	ldw x,(x)
      00A4A6 CD AA 3F         [ 2] 3456 	cpw x,ERASED 
      00A4A9 6B               [ 2] 3457 	popw x 
      00A4AA 01               [ 4] 3458 	ret 
                                   3459 
                                   3460 ;----------------------------
                                   3461 ;  skip to next program
                                   3462 ;  block 
                                   3463 ; input:
                                   3464 ;    X   actual program addr
                                   3465 ; output:
                                   3466 ;    X   next block 
                                   3467 ;        after program 
                                   3468 ;----------------------------
      0026D6                       3469 skip_to_next:
                                   3470 ; align to block 
      00A4AB E6               [ 1] 3471 	ld a,xl 
      00A4AC 01 0D            [ 1] 3472 	and a,#BLOCK_SIZE 
      00A4AE 01               [ 1] 3473 	ld xl,a 
      00A4AF 27 05 44         [ 2] 3474 	ldw acc16,x 
      00A4B2 0A 01            [ 2] 3475 	ldw x,(2,x)
      00A4B4 26 FB A4 01      [ 2] 3476 	addw x,acc16 ; blk_addr+prg_size 
      00A4B8 5F 97 4F         [ 2] 3477 	addw x,#4 ; +header fields 
                                   3478 ; align to next block 
      00A4BB 5B 01 81         [ 2] 3479 	addw x,#BLOCK_SIZE-1 
      00A4BE 9F               [ 1] 3480 	ld a,xl 
      00A4BE 52 02            [ 1] 3481 	and a,#0x80 
      00A4C0 CD               [ 1] 3482 	ld xl,a  
      00A4C1 97               [ 4] 3483 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



                                   3484 
                                   3485 
                                   3486 ;---------------------
                                   3487 ; BASIC: DIR 
                                   3488 ; list programs saved 
                                   3489 ; in flash 
                                   3490 ;--------------------
                           000001  3491 	XTEMP=1 
      0026EE                       3492 cmd_dir:
      00A4C2 6A A1 02         [ 4] 3493 	call cmd_line_only
      00A4C5 27 03 CC         [ 2] 3494 	ldw x,#app_space 
      00A4C8 94               [ 2] 3495 	pushw x 
      0026F5                       3496 1$: 
      00A4C9 35 90 F6         [ 4] 3497 	call qsign 
      00A4CC 93 EE            [ 1] 3498 	jrne 4$
      00A4CE 01 72 A9         [ 2] 3499 	addw x,#4
      00A4D1 00 03 9F 6B      [ 1] 3500 	mov base,#16
      00A4D5 02 90 F6         [ 4] 3501 	call prt_i16
      00A4D8 93 EE            [ 1] 3502 	ld a,#SPACE 
      00A4DA 01 72 A9         [ 4] 3503 	call putc 
      00A4DD 00 03            [ 2] 3504 	ldw x,(1,sp)
      00A4DF A3 00            [ 2] 3505 	ldw x,(2,x)
      00A4E1 0F 23 05 A6      [ 1] 3506 	mov base,#10  
      00A4E5 0A CC 94         [ 4] 3507 	call prt_i16 
      00A4E8 37 CD AA         [ 2] 3508 	ldw x,#STR_BYTES
      00A4EB 3F 6B 01         [ 4] 3509 	call puts
      00A4EE A6 01            [ 1] 3510 	ld a,#', 
      00A4F0 0D 01 27         [ 4] 3511 	call putc
      00A4F3 05 48            [ 2] 3512 	ldw x,(1,sp)
      00A4F5 0A 01 26         [ 2] 3513 	addw x,#8
      00A4F8 FB 0D 02         [ 4] 3514 	call puts 
      00A4FB 26 05            [ 1] 3515 	ld a,#CR 
      00A4FD 43 E4 00         [ 4] 3516 	call putc
      00A500 20 02            [ 2] 3517 	ldw x,(1,sp)
      00A502 EA 00 E7         [ 4] 3518 3$:	call skip_to_next
      00A505 00 5B            [ 2] 3519 	ldw (1,sp),x 
      00A507 02 81            [ 2] 3520 	jra 1$
      00A509                       3521 4$: ; check if it is an erased program 
      00A509 72 00 00         [ 4] 3522 	call is_erased 
      00A50C 23 01            [ 1] 3523 	jreq 3$ 
      00273A                       3524 8$: ; done 
      00273A                       3525 	_drop 2 
      00A50E 81 02            [ 2]    1     addw sp,#2 
      00A50F 81               [ 4] 3526 	ret 
                                   3527 
                                   3528 ;---------------------
                                   3529 ; BASIC: WRITE expr1,expr2|char|string[,expr|char|string]* 
                                   3530 ; write 1 or more byte to FLASH or EEPROM
                                   3531 ; starting at address  
                                   3532 ; input:
                                   3533 ;   expr1  	is address 
                                   3534 ;   expr2,...,exprn   are bytes to write
                                   3535 ; output:
                                   3536 ;   none 
                                   3537 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



      00273D                       3538 write:
      00A50F AE A5 36         [ 4] 3539 	call expression
      00A512 CD 87            [ 1] 3540 	cp a,#TK_INTGR 
      00A514 02 5B            [ 1] 3541 	jreq 0$
      00A516 02 52 04         [ 2] 3542 	jp syntax_error
      002747                       3543 0$: _xpop 
      00A519 CD 9E            [ 1]    1     ld a,(y)
      00A51B 2D               [ 1]    2     ldw x,y 
      00A51C AE 16            [ 2]    3     ldw x,(1,x)
      00A51E 68 CF 00 05      [ 2]    4     addw y,#CELL_SIZE 
      00A522 7F 72 5F         [ 1] 3544 	ld farptr,a 
      00A525 00 03 5F         [ 2] 3545 	ldw ptr16,x 
      002756                       3546 1$:	
      00A528 CF 00 01         [ 4] 3547 	call next_token 
      00A52B 72 11            [ 1] 3548 	cp a,#TK_COMMA 
      00A52D 00 23            [ 1] 3549 	jreq 2$ 
      00A52F 72 18            [ 2] 3550 	jra 9$ ; no more data 
      00A531 00 23 CC         [ 4] 3551 2$:	call next_token 
      00A534 94 D3            [ 1] 3552 	cp a,#TK_CHAR 
      00A536 0A 62            [ 1] 3553 	jreq 4$ 
      00A538 72 65            [ 1] 3554 	cp a,#TK_QSTR
      00A53A 61 6B            [ 1] 3555 	jreq 6$
      00276A                       3556 	_unget_token 
      00A53C 20 70 6F 69 6E   [ 1]    1      mov in,in.saved  
      00A541 74 2C 20         [ 4] 3557 	call expression
      00A544 52 55            [ 1] 3558 	cp a,#TK_INTGR
      00A546 4E 20            [ 1] 3559 	jreq 3$
      00A548 74 6F 20         [ 2] 3560 	jp syntax_error
      002779                       3561 3$:	_xpop 
      00A54B 72 65            [ 1]    1     ld a,(y)
      00A54D 73               [ 1]    2     ldw x,y 
      00A54E 75 6D            [ 2]    3     ldw x,(1,x)
      00A550 65 2E 0A 00      [ 2]    4     addw y,#CELL_SIZE 
      00A554 9F               [ 1] 3562 	ld a,xl 
      00A554 CD               [ 1] 3563 	clrw x 
      00A555 97 42 72         [ 4] 3564 	call write_byte
      00A558 5F 00            [ 2] 3565 	jra 1$ 
      002789                       3566 4$: ; write character 
      00A55A 23               [ 1] 3567 	ld a,(x)
      00A55B CD 92 41 81      [ 1] 3568 	inc in 
      00A55F 5F               [ 1] 3569 	clrw x 
      00A55F 89 CD 95         [ 4] 3570 	call write_byte 
      00A562 A8 85            [ 2] 3571 	jra 1$ 
      002794                       3572 6$: ; write string 
      00A564 CD               [ 2] 3573 	pushw x 
      00A565 AF               [ 1] 3574 	ld a,(x)
      00A566 87 27 4A CD      [ 1] 3575 	inc in 
      00A56A 84               [ 1] 3576 	clrw x 
      00A56B 8D 72 5F         [ 4] 3577 	call write_byte 
      00A56E 00               [ 2] 3578 	popw x 
      00A56F 19               [ 1] 3579 	ld a,(x)
      00A570 52 06            [ 1] 3580 	jreq 1$
      00A572 1D               [ 1] 3581 	incw x 
      00A573 00 04            [ 2] 3582 	jra 6$ 	
      0027A5                       3583 9$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



      00A575 1F               [ 4] 3584 	ret 
                                   3585 
                                   3586 
                                   3587 ;---------------------
                                   3588 ;BASIC: CHAR(expr)
                                   3589 ; évaluate expression 
                                   3590 ; and take the 7 least 
                                   3591 ; bits as ASCII character
                                   3592 ; output: 
                                   3593 ; 	A char 
                                   3594 ;---------------------
      0027A6                       3595 func_char:
      00A576 01 EE 02         [ 4] 3596 	call func_args 
      00A579 1F 03            [ 1] 3597 	cp a,#1
      00A57B A6 80            [ 1] 3598 	jreq 1$
      00A57D 62 4D 27         [ 2] 3599 	jp syntax_error
      0027B0                       3600 1$:	_xpop
      00A580 01 5C            [ 1]    1     ld a,(y)
      00A582 1F               [ 1]    2     ldw x,y 
      00A583 05 1E            [ 2]    3     ldw x,(1,x)
      00A585 01 CF 00 1A      [ 2]    4     addw y,#CELL_SIZE 
      00A589 CD               [ 1] 3601 	ld a,xl
      00A58A 85 0B            [ 1] 3602 	and a,#0x7f 
      00A58C AE               [ 4] 3603 	ret
                                   3604 
                                   3605 ;---------------------
                                   3606 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3607 ; extract first character 
                                   3608 ; of string argument 
                                   3609 ; output:
                                   3610 ;    A:X    int24 
                                   3611 ;---------------------
      0027BD                       3612 ascii:
      00A58D 00 80            [ 1] 3613 	ld a,#TK_LPAREN
      00A58F CD 86 06         [ 4] 3614 	call expect 
      00A592 1E 05 5A         [ 4] 3615 	call next_token 
      00A595 1F 05            [ 1] 3616 	cp a,#TK_QSTR 
      00A597 26 F0            [ 1] 3617 	jreq 1$
      00A599 1E 01            [ 1] 3618 	cp a,#TK_CHAR 
      00A59B CF 00            [ 1] 3619 	jreq 2$ 
      00A59D 1A A6            [ 1] 3620 	cp a,#TK_CFUNC 
      00A59F 58 5F            [ 1] 3621 	jreq 0$
      00A5A1 CD 85 31         [ 2] 3622 	jp syntax_error
      0027D4                       3623 0$: ; cfunc 
      00A5A4 CD               [ 4] 3624 	call (x)
      00A5A5 85 31            [ 2] 3625 	jra 3$
      0027D7                       3626 1$: ; quoted string 
      00A5A7 7B               [ 1] 3627 	ld a,(x)
      00A5A8 03               [ 1] 3628 	push a  
      00A5A9 CD 85 31         [ 4] 3629 	call skip_string
      00A5AC 7B               [ 1] 3630 	pop a  	
      00A5AD 04 CD            [ 2] 3631 	jra 3$ 
      0027DF                       3632 2$: ; character 
      00A5AF 85 31 5B         [ 4] 3633 	call get_char 
      00A5B2 06               [ 1] 3634 3$:	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



      00A5B3 02               [ 1] 3635 	rlwa x   
      0027E4                       3636 4$:	_xpush  
      00A5B3 81 A2 00 03      [ 2]    1     subw y,#CELL_SIZE
      00A5B4 90 F7            [ 1]    2     ld (y),a 
      00A5B4 CD 97 42         [ 2]    3     ldw (1,y),x 
      00A5B7 72 5F            [ 1] 3637 	ld a,#TK_RPAREN 
      00A5B9 00 19 CD         [ 4] 3638 	call expect
      0027F2                       3639 9$:	
      0027F2                       3640 	_xpop  
      00A5BC 95 8F            [ 1]    1     ld a,(y)
      00A5BE A1               [ 1]    2     ldw x,y 
      00A5BF 03 27            [ 2]    3     ldw x,(1,x)
      00A5C1 9D 52 03 A1      [ 2]    4     addw y,#CELL_SIZE 
      00A5C5 04               [ 4] 3641 	ret 
                                   3642 
                                   3643 ;---------------------
                                   3644 ;BASIC: KEY
                                   3645 ; wait for a character 
                                   3646 ; received from STDIN 
                                   3647 ; input:
                                   3648 ;	none 
                                   3649 ; output:
                                   3650 ;	a	 character 
                                   3651 ;---------------------
      0027FC                       3652 key:
      00A5C6 27 03 CC         [ 4] 3653 	call getc 
      00A5C9 94               [ 4] 3654 	ret
                                   3655 
                                   3656 ;----------------------
                                   3657 ; BASIC: QKEY
                                   3658 ; Return true if there 
                                   3659 ; is a character in 
                                   3660 ; waiting in STDIN 
                                   3661 ; input:
                                   3662 ;  none 
                                   3663 ; output:
                                   3664 ;   A     0|-1
                                   3665 ;-----------------------
      002800                       3666 qkey:: 
      00A5CA 35               [ 1] 3667 	clrw x 
      00A5CB CD 95 D1         [ 1] 3668 	ld a,rx1_head
      00A5CE A4 DF A1         [ 1] 3669 	sub a,rx1_tail 
      00A5D1 45 26            [ 1] 3670 	jreq 9$ 
      00A5D3 0C               [ 2] 3671 	cplw x
      00A5D4 AE 40            [ 1] 3672 	ld a,#255    
      00280C                       3673 9$: 
      00A5D6 00               [ 4] 3674 	ret 
                                   3675 
                                   3676 ;-------------------------
                                   3677 ; BASIC: UFLASH 
                                   3678 ; return free flash address
                                   3679 ; scan all block starting at 
                                   3680 ; app_space and return 
                                   3681 ; address of first free block 
                                   3682 ; below extended memory.  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



                                   3683 ; return 0 if no free block 
                                   3684 ; input:
                                   3685 ;  none 
                                   3686 ; output:
                                   3687 ;	A:X		FLASH free address
                                   3688 ;---------------------------
      00280D                       3689 uflash:
      00A5D7 CF 00 1A AE      [ 1] 3690 	clr farptr 
      00A5DB 47 FF 4F         [ 2] 3691 	ldw x,#app_space 
      00A5DE 20               [ 2] 3692 	pushw x 
      00A5DF 15 A1 46         [ 2] 3693 1$:	ldw ptr16,x 
      00A5E2 27 06 AE         [ 4] 3694 	call scan_block 
      00A5E5 93 3D            [ 1] 3695 	jreq 8$
      00A5E7 CC 94            [ 2] 3696 	ldw x,(1,sp)
      00A5E9 37 00 80         [ 2] 3697 	addw x,#BLOCK_SIZE 
      00A5EA 27 04            [ 1] 3698 	jreq 7$ 
      00A5EA AE B4            [ 2] 3699 	ldw (1,sp),x 
      00A5EC 80 CF            [ 2] 3700 	jra 1$ 
      002828                       3701 7$: ; no free block 
      00A5EE 00 1A            [ 1] 3702 	clr (1,sp) 
      00A5F0 A6 02            [ 1] 3703 	clr (2,sp)
      00A5F2 AE               [ 2] 3704 8$: popw x 
      00A5F3 7F               [ 1] 3705 	clr a 
      00A5F4 FF               [ 4] 3706 	ret 
                                   3707 
                                   3708 
                                   3709 ;---------------------
                                   3710 ; BASIC: USR(addr,arg)
                                   3711 ; execute a function written 
                                   3712 ; in binary code.
                                   3713 ; input:
                                   3714 ;   addr	routine address 
                                   3715 ;   arg 	is an argument
                                   3716 ;           it can be ignore 
                                   3717 ;           by cally. 
                                   3718 ; output:
                                   3719 ;   xstack 	value returned by cally  
                                   3720 ;---------------------
      00A5F5                       3721 usr:
      00A5F5 6B 01 1F         [ 4] 3722 	call func_args 
      00A5F8 02 CD            [ 1] 3723 	cp a,#2
      00A5FA 84 8D            [ 1] 3724 	jreq 1$  
      00A5FC CC 13 B5         [ 2] 3725 	jp syntax_error 
      002839                       3726 1$: 
      002839                       3727 	_at_next ; A:X addr 
      00A5FC CD 86 14         [ 1]    1     ld a,(3,y)
      00A5FF 27               [ 1]    2     ldw x,y 
      00A600 08 A6            [ 2]    3     ldw x,(4,x)
      00A602 45 CD 86         [ 2] 3728 	ldw ptr16,X 
      002842                       3729 	_xpop  ; arg 
      00A605 A5 CD            [ 1]    1     ld a,(y)
      00A607 85               [ 1]    2     ldw x,y 
      00A608 0B AE            [ 2]    3     ldw x,(1,x)
      00A60A 00 80 CD 86      [ 2]    4     addw y,#CELL_SIZE 
      00284B                       3730 	_store_top ; overwrite addr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



      00A60E 06 7B            [ 1]    1     ld (y),a 
      00A610 01 1E 02         [ 2]    2     ldw (1,y),x     
      00A613 72 B0 00 1A      [ 6] 3731     call [ptr16]
      00A617 C2               [ 4] 3732 	ret 
                                   3733 
                                   3734 
                                   3735 ;------------------------------
                                   3736 ; BASIC: BYE 
                                   3737 ; halt mcu in its lowest power mode 
                                   3738 ; wait for reset or external interrupt
                                   3739 ; do a cold start on wakeup.
                                   3740 ;------------------------------
      002855                       3741 bye:
      00A618 00 19 22 E0 CD   [ 2] 3742 	btjf UART1_SR,#UART_SR_TC,.
      00A61D 92               [10] 3743 	halt
      00A61E 41 1E 02         [ 2] 3744 	jp cold_start  
                                   3745 
                                   3746 ;----------------------------------
                                   3747 ; BASIC: SLEEP 
                                   3748 ; halt mcu until reset or external
                                   3749 ; interrupt.
                                   3750 ; Resume progam after SLEEP command
                                   3751 ;----------------------------------
      00285E                       3752 sleep:
      00A621 A3 47 FF 26 03   [ 2] 3753 	btjf UART1_SR,#UART_SR_TC,.
      00A626 CD 9A D8 22      [ 1] 3754 	bset flags,#FSLEEP
      00A629 8E               [10] 3755 	halt 
      00A629 5B               [ 4] 3756 	ret 
                                   3757 
                                   3758 ;-------------------------------
                                   3759 ; BASIC: PAUSE expr 
                                   3760 ; suspend execution for n msec.
                                   3761 ; input:
                                   3762 ;	none
                                   3763 ; output:
                                   3764 ;	none 
                                   3765 ;------------------------------
      002869                       3766 pause:
      00A62A 03 81 2C         [ 4] 3767 	call expression
      00A62C A1 84            [ 1] 3768 	cp a,#TK_INTGR
      00A62C 89 9F            [ 1] 3769 	jreq 1$ 
      00A62E A4 80 97         [ 2] 3770 	jp syntax_error
      002873                       3771 1$: _xpop 
      00A631 FE C3            [ 1]    1     ld a,(y)
      00A633 A7               [ 1]    2     ldw x,y 
      00A634 47 85            [ 2]    3     ldw x,(1,x)
      00A636 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A637                       3772 pause02:
      00A637 88 4D 27         [ 2] 3773 	ldw timer,x 
      00A63A 0A F6 5C         [ 2] 3774 1$: ldw x,timer 
      00A63D 90               [ 2] 3775 	tnzw x 
      00A63E F7 90            [ 1] 3776 	jreq 2$
      00A640 5C               [10] 3777 	wfi 
      00A641 0A 01            [ 1] 3778 	jrne 1$
      002888                       3779 2$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



      00A643 26               [ 4] 3780 	ret 
                                   3781 
                                   3782 ;------------------------------
                                   3783 ; BASIC: AWU expr
                                   3784 ; halt mcu for 'expr' milliseconds
                                   3785 ; use Auto wakeup peripheral
                                   3786 ; all oscillators stopped except LSI
                                   3787 ; range: 1ms - 511ms
                                   3788 ; input:
                                   3789 ;  none
                                   3790 ; output:
                                   3791 ;  none:
                                   3792 ;------------------------------
      002889                       3793 awu:
      00A644 F6 84 81         [ 4] 3794   call expression
      00A647 A1 84            [ 1] 3795   cp a,#TK_INTGR
      00A647 88 90            [ 1] 3796   jreq 1$
      00A649 AE 16 B8         [ 2] 3797   jp syntax_error
      002893                       3798 1$: _xpop 
      00A64C 90 89            [ 1]    1     ld a,(y)
      00A64E A6               [ 1]    2     ldw x,y 
      00A64F 80 90            [ 2]    3     ldw x,(1,x)
      00A651 7F 90 5C 4A      [ 2]    4     addw y,#CELL_SIZE 
      00289C                       3799 awu02:
      00A655 26 F9 90         [ 2] 3800   cpw x,#5120
      00A658 85 84            [ 1] 3801   jrmi 1$ 
      00A65A 81 0F 50 F2      [ 1] 3802   mov AWU_TBR,#15 
      00A65B A6 1E            [ 1] 3803   ld a,#30
      00A65B 89               [ 2] 3804   div x,a
      00A65C AE B4            [ 1] 3805   ld a,#16
      00A65E 80               [ 2] 3806   div x,a 
      00A65F CD A7            [ 2] 3807   jra 4$
      0028AD                       3808 1$: 
      00A661 4B 27 0D         [ 2] 3809   cpw x,#2048
      00A664 F6 EA            [ 1] 3810   jrmi 2$ 
      00A666 01 27 23 CD      [ 1] 3811   mov AWU_TBR,#14
      00A66A A7 56            [ 1] 3812   ld a,#80
      00A66C 5D               [ 2] 3813   div x,a 
      00A66D 26 F0            [ 2] 3814   jra 4$   
      0028BB                       3815 2$:
      00A66F 20 1B 50 F2      [ 1] 3816   mov AWU_TBR,#7
      00A671                       3817 3$:  
                                   3818 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A671 CF 00 0E         [ 2] 3819   cpw x,#64 
      00A674 EE 02            [ 2] 3820   jrule 4$ 
      00A676 1C 00 04 1C      [ 1] 3821   inc AWU_TBR 
      00A67A 00               [ 2] 3822   srlw x 
      00A67B 7F 9F            [ 2] 3823   jra 3$ 
      0028CB                       3824 4$:
      00A67D A4               [ 1] 3825   ld a, xl
      00A67E 80               [ 1] 3826   dec a 
      00A67F 97 13            [ 1] 3827   jreq 5$
      00A681 01               [ 1] 3828   dec a 	
      0028D0                       3829 5$: 
      00A682 24 05            [ 1] 3830   and a,#0x3e 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



      00A684 CE 00 0E         [ 1] 3831   ld AWU_APR,a 
      00A687 20 E0 CE 00      [ 1] 3832   bset AWU_CSR,#AWU_CSR_AWUEN
      00A68B 0E               [10] 3833   halt 
                                   3834 
      00A68C 5B               [ 4] 3835   ret 
                                   3836 
                                   3837 ;------------------------------
                                   3838 ; BASIC: TICKS
                                   3839 ; return msec ticks counter value 
                                   3840 ; input:
                                   3841 ; 	none 
                                   3842 ; output:
                                   3843 ;	X 		TK_INTGR
                                   3844 ;-------------------------------
      0028DB                       3845 get_ticks:
      00A68D 02 81 0F         [ 1] 3846 	ld a,ticks 
      00A68F CE 00 10         [ 2] 3847 	ldw x,ticks+1 
      00A68F 89               [ 4] 3848 	ret 
                                   3849 
                                   3850 ;------------------------------
                                   3851 ; BASIC: ABS(expr)
                                   3852 ; return absolute value of expr.
                                   3853 ; input:
                                   3854 ;   none
                                   3855 ; output:
                                   3856 ;   xstack    positive int24 
                                   3857 ;-------------------------------
      0028E2                       3858 abs:
      00A690 4B 04 72         [ 4] 3859 	call func_args 
      00A693 5F 00            [ 1] 3860 	cp a,#1 
      00A695 19 CF            [ 1] 3861 	jreq 0$ 
      00A697 00 1A 4F         [ 2] 3862 	jp syntax_error
      0028EC                       3863 0$:  
      00A69A 5F CD 85         [ 4] 3864 	call abs24 
      0028EF                       3865 	_xpop 
      00A69D 31 0A            [ 1]    1     ld a,(y)
      00A69F 01               [ 1]    2     ldw x,y 
      00A6A0 26 F9            [ 2]    3     ldw x,(1,x)
      00A6A2 5B 01 85 CF      [ 2]    4     addw y,#CELL_SIZE 
      00A6A6 00               [ 4] 3866 	ret 
                                   3867 
                                   3868 ;------------------------------
                                   3869 ; BASIC: LSHIFT(expr1,expr2)
                                   3870 ; logical shift left expr1 by 
                                   3871 ; expr2 bits 
                                   3872 ; output:
                                   3873 ; 	A:x 	result 
                                   3874 ;------------------------------
      0028F9                       3875 lshift:
      00A6A7 1A 81 E5         [ 4] 3876 	call func_args
      00A6A9 A1 02            [ 1] 3877 	cp a,#2 
      00A6A9 CD 97            [ 1] 3878 	jreq 1$
      00A6AB 42 89 90         [ 2] 3879 	jp syntax_error
      002903                       3880 1$: _xpop 
      00A6AE 89 52            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



      00A6B0 06               [ 1]    2     ldw x,y 
      00A6B1 CD 9B            [ 2]    3     ldw x,(1,x)
      00A6B3 E4 26 03 CC      [ 2]    4     addw y,#CELL_SIZE 
      00A6B7 A7               [ 1] 3881 	ld a,xl 
      00A6B8 41               [ 1] 3882 	push a      
      00290E                       3883 	_xpop  ; T>A:X 
      00A6B9 1F 05            [ 1]    1     ld a,(y)
      00A6BB 72               [ 1]    2     ldw x,y 
      00A6BC 5F 00            [ 2]    3     ldw x,(1,x)
      00A6BE 19 CD A6 5B      [ 2]    4     addw y,#CELL_SIZE 
      00A6C2 CF 00            [ 1] 3884 	tnz (1,sp) 
      00A6C4 1A AE            [ 1] 3885 	jreq 4$
      00A6C6 FF               [ 1] 3886 2$:	rcf 
      00A6C7 FF               [ 2] 3887 	rlcw x 
      00A6C8 72               [ 1] 3888 	rlc a 
      00A6C9 B0 00            [ 1] 3889 	dec (1,sp) 
      00A6CB 1A 1D            [ 1] 3890 	jrne 2$
      002922                       3891 4$: _drop 1 
      00A6CD 00 04            [ 2]    1     addw sp,#1 
      00A6CF 13               [ 4] 3892 	ret
                                   3893 
                                   3894 ;------------------------------
                                   3895 ; BASIC: RSHIFT(expr1,expr2)
                                   3896 ; logical shift right expr1 by 
                                   3897 ; expr2 bits.
                                   3898 ; output:
                                   3899 ; 	A 		TK_INTGR
                                   3900 ;   X 		result 
                                   3901 ;------------------------------
      002925                       3902 rshift:
      00A6D0 05 24 05         [ 4] 3903 	call func_args
      00A6D3 A6 01            [ 1] 3904 	cp a,#2 
      00A6D5 CC 94            [ 1] 3905 	jreq 1$
      00A6D7 37 13 B5         [ 2] 3906 	jp syntax_error
      00A6D8                       3907 1$: _xpop ; T>A:X
      00A6D8 CE 00            [ 1]    1     ld a,(y)
      00A6DA 1A               [ 1]    2     ldw x,y 
      00A6DB F6 EA            [ 2]    3     ldw x,(1,x)
      00A6DD 01 EA 02 EA      [ 2]    4     addw y,#CELL_SIZE 
      00A6E1 03               [ 1] 3908     ld a,xl 
      00A6E2 27               [ 1] 3909 	push a    
      00293A                       3910 	_xpop  
      00A6E3 03 CD            [ 1]    1     ld a,(y)
      00A6E5 A6               [ 1]    2     ldw x,y 
      00A6E6 8F 01            [ 2]    3     ldw x,(1,x)
      00A6E7 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A6E7 CD 84            [ 1] 3911 	tnz (1,sp)
      00A6E9 CD 0F            [ 1] 3912 	jreq 4$
      00A6EB 03               [ 1] 3913 2$:	rcf 
      00A6EC CD               [ 1] 3914 	rrc a 
      00A6ED A6               [ 2] 3915 	rrcw x 
      00A6EE 47 CE            [ 1] 3916 	dec (1,sp) 
      00A6F0 A7 47            [ 1] 3917 	jrne 2$
      00294E                       3918 4$: _drop 1 
      00A6F2 90 FF            [ 2]    1     addw sp,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



      00A6F4 72               [ 4] 3919 	ret
                                   3920 
                                   3921 ;--------------------------
                                   3922 ; BASIC: FCPU integer
                                   3923 ; set CPU frequency 
                                   3924 ;-------------------------- 
                                   3925 
      002951                       3926 fcpu:
      00A6F5 A9 00            [ 1] 3927 	ld a,#TK_INTGR
      00A6F7 02 1E 05         [ 4] 3928 	call expect 
      00A6FA 90 FF 72         [ 4] 3929 	call get_int24 
      00A6FD A9               [ 1] 3930 	ld a,xl 
      00A6FE 00 02            [ 1] 3931 	and a,#7 
      00A700 A6 7C A3         [ 1] 3932 	ld CLK_CKDIVR,a 
      00A703 00               [ 4] 3933 	ret 
                                   3934 
                                   3935 ;------------------------------
                                   3936 ; BASIC: PMODE pin#, mode 
                                   3937 ; Arduino pin. 
                                   3938 ; define pin as input or output
                                   3939 ; pin#: {0..15}
                                   3940 ; mode: INPUT|OUTPUT  
                                   3941 ;------------------------------
                           000001  3942 	PINNO=1
                           000001  3943 	VSIZE=1
      002960                       3944 pin_mode:
      002960                       3945 	_vars VSIZE 
      00A704 7C 22            [ 2]    1     sub sp,#VSIZE 
      00A706 01 9F 6B         [ 4] 3946 	call arg_list 
      00A709 04 CE            [ 1] 3947 	cp a,#2 
      00A70B 00 1C            [ 1] 3948 	jreq 1$
      00A70D 1F 01 B5         [ 2] 3949 	jp syntax_error 
      00A70F                       3950 1$: _xpop 
      00A70F 1E 01            [ 1]    1     ld a,(y)
      00A711 7B               [ 1]    2     ldw x,y 
      00A712 04 CD            [ 2]    3     ldw x,(1,x)
      00A714 A6 37 1F 01      [ 2]    4     addw y,#CELL_SIZE 
      00A718 AE 16 B8         [ 2] 3951 	ldw ptr16,x ; mode 
      002978                       3952 	_xpop ; Dx pin 
      00A71B CD 84            [ 1]    1     ld a,(y)
      00A71D E7               [ 1]    2     ldw x,y 
      00A71E AE 00            [ 2]    3     ldw x,(1,x)
      00A720 80 CD 86 06      [ 2]    4     addw y,#CELL_SIZE 
      00A724 1E 01 C3         [ 4] 3953 	call select_pin 
      00A727 00 1E            [ 1] 3954 	ld (PINNO,sp),a  
      00A729 24 16            [ 1] 3955 	ld a,#1 
      00A72B 1E 05            [ 1] 3956 	tnz (PINNO,sp)
      00A72D 72 F0            [ 1] 3957 	jreq 4$
      00A72F 03               [ 1] 3958 2$:	sll a 
      00A730 1F 05            [ 1] 3959 	dec (PINNO,sp)
      00A732 A6 80            [ 1] 3960 	jrne 2$ 
      00A734 A3 00            [ 1] 3961 	ld (PINNO,sp),a
      00A736 80 24            [ 1] 3962 	ld a,(PINNO,sp)
      00A738 01 9F            [ 1] 3963 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A73A 6B 04            [ 1] 3964 	ld (GPIO_CR1,x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



      00A73C CD A6            [ 1] 3965 4$:	ld a,#OUTP
      00A73E 47 20 CE         [ 1] 3966 	cp a,acc8 
      00A741 5B 06            [ 1] 3967 	jreq 6$
                                   3968 ; input mode
                                   3969 ; disable external interrupt 
      00A743 90 85            [ 1] 3970 	ld a,(PINNO,sp)
      00A745 85               [ 1] 3971 	cpl a 
      00A746 81 54            [ 1] 3972 	and a,(GPIO_CR2,x)
      00A748 42 58            [ 1] 3973 	ld (GPIO_CR2,x),a 
                                   3974 ;clear bit in DDR for input mode 
      00A74A 58 01            [ 1] 3975 	ld a,(PINNO,sp)
      00A74B 43               [ 1] 3976 	cpl a 
      00A74B 89 9F            [ 1] 3977 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A74D A4 80            [ 1] 3978 	ld (GPIO_DDR,x),a 
      00A74F 97 FE            [ 2] 3979 	jra 9$
      0029B0                       3980 6$: ;output mode  
      00A751 C3 A7            [ 1] 3981 	ld a,(PINNO,sp)
      00A753 49 85            [ 1] 3982 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A755 81 02            [ 1] 3983 	ld (GPIO_DDR,x),a 
      00A756 7B 01            [ 1] 3984 	ld a,(PINNO,sp)
      00A756 9F A4            [ 1] 3985 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A758 80 97            [ 1] 3986 	ld (GPIO_CR2,x),a 
      0029BC                       3987 9$:	
      0029BC                       3988 	_drop VSIZE 
      00A75A CF 00            [ 2]    1     addw sp,#VSIZE 
      00A75C 0E               [ 4] 3989 	ret
                                   3990 
                                   3991 ;------------------------
                                   3992 ; select Arduino pin 
                                   3993 ; input:
                                   3994 ;   X 	 {0..15} Arduino Dx 
                                   3995 ; output:
                                   3996 ;   A     stm8s208 pin 
                                   3997 ;   X     base address s208 GPIO port 
                                   3998 ;---------------------------
      0029BF                       3999 select_pin:
      00A75D EE               [ 2] 4000 	sllw x 
      00A75E 02 72 BB         [ 2] 4001 	addw x,#arduino_to_8s208 
      00A761 00               [ 2] 4002 	ldw x,(x)
      00A762 0E               [ 1] 4003 	ld a,xl 
      00A763 1C               [ 1] 4004 	push a 
      00A764 00               [ 1] 4005 	swapw x 
      00A765 04 1C            [ 1] 4006 	ld a,#5 
      00A767 00               [ 4] 4007 	mul x,a 
      00A768 7F 9F A4         [ 2] 4008 	addw x,#GPIO_BASE 
      00A76B 80               [ 1] 4009 	pop a 
      00A76C 97               [ 4] 4010 	ret 
                                   4011 ; translation from Arduino D0..D15 to stm8s208rb 
      0029CF                       4012 arduino_to_8s208:
      00A76D 81 06                 4013 .byte 3,6 ; D0 
      00A76E 03 05                 4014 .byte 3,5 ; D1 
      00A76E CD 97                 4015 .byte 4,0 ; D2 
      00A770 42 AE                 4016 .byte 2,1 ; D3
      00A772 B4 80                 4017 .byte 6,0 ; D4
      00A774 89 02                 4018 .byte 2,2 ; D5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



      00A775 02 03                 4019 .byte 2,3 ; D6
      00A775 CD A6                 4020 .byte 3,1 ; D7
      00A777 2C 26                 4021 .byte 3,3 ; D8
      00A779 3B 1C                 4022 .byte 2,4 ; D9
      00A77B 00 04                 4023 .byte 4,5 ; D10
      00A77D 35 10                 4024 .byte 2,6 ; D11
      00A77F 00 0B                 4025 .byte 2,7 ; D12
      00A781 CD 95                 4026 .byte 2,5 ; D13
      00A783 D7 A6                 4027 .byte 4,2 ; D14
      00A785 20 CD                 4028 .byte 4,1 ; D15
                                   4029 
                                   4030 
                                   4031 ;------------------------------
                                   4032 ; BASIC: RND(expr)
                                   4033 ; return random number 
                                   4034 ; between 1 and expr inclusive
                                   4035 ; xorshift16 
                                   4036 ; ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   4037 ; input:
                                   4038 ; 	none 
                                   4039 ; output:
                                   4040 ;	xstack 	random positive integer 
                                   4041 ;------------------------------
      0029EF                       4042 random:
      00A787 86 A5 1E         [ 4] 4043 	call func_args 
      00A78A 01 EE            [ 1] 4044 	cp a,#1
      00A78C 02 35            [ 1] 4045 	jreq 1$
      00A78E 0A 00 0B         [ 2] 4046 	jp syntax_error
      0029F9                       4047 1$:  
      0029F9                       4048 	_xpop   
      00A791 CD 95            [ 1]    1     ld a,(y)
      00A793 D7               [ 1]    2     ldw x,y 
      00A794 AE 9C            [ 2]    3     ldw x,(1,x)
      00A796 4E CD 87 02      [ 2]    4     addw y,#CELL_SIZE 
      00A79A A6               [ 2] 4049 	pushw x 
      00A79B 2C               [ 1] 4050 	push a  
      00A79C CD 86            [ 1] 4051 	ld a,#0x80 
      00A79E A5 1E            [ 1] 4052 	bcp a,(1,sp)
      00A7A0 01 1C            [ 1] 4053 	jreq 2$
      00A7A2 00 08            [ 1] 4054 	ld a,#ERR_BAD_VALUE
      00A7A4 CD 87 02         [ 2] 4055 	jp tb_error
      002A0F                       4056 2$: 
                                   4057 ; acc16=(x<<5)^x 
      00A7A7 A6 0D CD         [ 2] 4058 	ldw x,seedx 
      00A7AA 86               [ 2] 4059 	sllw x 
      00A7AB A5               [ 2] 4060 	sllw x 
      00A7AC 1E               [ 2] 4061 	sllw x 
      00A7AD 01               [ 2] 4062 	sllw x 
      00A7AE CD               [ 2] 4063 	sllw x 
      00A7AF A7               [ 1] 4064 	ld a,xh 
      00A7B0 56 1F 01         [ 1] 4065 	xor a,seedx 
      00A7B3 20 C0 0D         [ 1] 4066 	ld acc16,a 
      00A7B5 9F               [ 1] 4067 	ld a,xl 
      00A7B5 CD A7 4B         [ 1] 4068 	xor a,seedx+1 
      00A7B8 27 F4 0E         [ 1] 4069 	ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



                                   4070 ; seedx=seedy 
      00A7BA CE 00 16         [ 2] 4071 	ldw x,seedy 
      00A7BA 5B 02 81         [ 2] 4072 	ldw seedx,x  
                                   4073 ; seedy=seedy^(seedy>>1)
      00A7BD CE 00 16         [ 2] 4074 	ldw x,seedy 
      00A7BD CD               [ 2] 4075 	srlw x 
      00A7BE 98               [ 1] 4076 	ld a,xh 
      00A7BF AC A1 84         [ 1] 4077 	xor a,seedy 
      00A7C2 27 03 CC         [ 1] 4078 	ld seedy,a  
      00A7C5 94               [ 1] 4079 	ld a,xl 
      00A7C6 35 90 F6         [ 1] 4080 	xor a,seedy+1 
      00A7C9 93 EE 01         [ 1] 4081 	ld seedy+1,a 
                                   4082 ; acc16>>3 
      00A7CC 72 A9 00         [ 2] 4083 	ldw x,acc16 
      00A7CF 03               [ 2] 4084 	srlw x 
      00A7D0 C7               [ 2] 4085 	srlw x 
      00A7D1 00               [ 2] 4086 	srlw x 
                                   4087 ; x=acc16^x 
      00A7D2 19               [ 1] 4088 	ld a,xh 
      00A7D3 CF 00 1A         [ 1] 4089 	xor a,acc16 
      00A7D6 C7 00 0D         [ 1] 4090 	ld acc16,a 
      00A7D6 CD               [ 1] 4091 	ld a,xl 
      00A7D7 95 8F A1         [ 1] 4092 	xor a,acc8 
      00A7DA 08 27 02         [ 1] 4093 	ld acc8,a 
                                   4094 ; seedy=acc16^seedy 
      00A7DD 20 46 CD         [ 1] 4095 	xor a,seedy+1
      00A7E0 95               [ 1] 4096 	ld xl,a 
      00A7E1 8F A1 04         [ 1] 4097 	ld a,acc16 
      00A7E4 27 23 A1         [ 1] 4098 	xor a,seedy
      00A7E7 02               [ 1] 4099 	ld xh,a 
      00A7E8 27 2A 55         [ 2] 4100 	ldw seedy,x 
                                   4101 ; return seedx_lo&0x7f:seedy modulo expr + 1 
      00A7EB 00 04 00         [ 1] 4102 	ld a,seedx+1
      00A7EE 02 CD            [ 1] 4103 	and a,#127
      002A64                       4104 	_xpush 
      00A7F0 98 AC A1 84      [ 2]    1     subw y,#CELL_SIZE
      00A7F4 27 03            [ 1]    2     ld (y),a 
      00A7F6 CC 94 35         [ 2]    3     ldw (1,y),x 
      00A7F9 90               [ 1] 4105 	pop a 
      00A7FA F6               [ 2] 4106 	popw x 
      002A6F                       4107 	_xpush 
      00A7FB 93 EE 01 72      [ 2]    1     subw y,#CELL_SIZE
      00A7FF A9 00            [ 1]    2     ld (y),a 
      00A801 03 9F 5F         [ 2]    3     ldw (1,y),x 
      00A804 CD 85 31         [ 4] 4108 	call mod24 
      002A7B                       4109 	_xpop
      00A807 20 CD            [ 1]    1     ld a,(y)
      00A809 93               [ 1]    2     ldw x,y 
      00A809 F6 72            [ 2]    3     ldw x,(1,x)
      00A80B 5C 00 02 5F      [ 2]    4     addw y,#CELL_SIZE 
      00A80F CD 85 31         [ 2] 4110 	addw x,#1 
      00A812 20 C2            [ 1] 4111 	adc a,#0  
      00A814 81               [ 4] 4112 	ret 
                                   4113 
                                   4114 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



                                   4115 ; BASIC: WORDS 
                                   4116 ; affiche la listes des mots du
                                   4117 ; dictionnaire ainsi que le nombre
                                   4118 ; de mots.
                                   4119 ;---------------------------------
                           000001  4120 	WLEN=1 ; word length
                           000002  4121 	LLEN=2 ; character sent to console
                           000003  4122 	WCNT=3 ; count words printed 
                           000003  4123 	VSIZE=3 
      002A8A                       4124 words:
      00A814 89 F6 72         [ 4] 4125 	call cmd_line_only
      00A817 5C 00            [ 2] 4126 	pushw y
      002A8F                       4127 	_vars VSIZE
      00A819 02 5F            [ 2]    1     sub sp,#VSIZE 
      00A81B CD 85            [ 1] 4128 	clr (LLEN,sp)
      00A81D 31 85            [ 1] 4129 	clr (WCNT,sp)
      00A81F F6 27 B4 5C      [ 2] 4130 	ldw y,#kword_dict+2
      00A823 20               [ 1] 4131 0$:	ldw x,y
      00A824 EF               [ 1] 4132 	ld a,(x)
      00A825 A4 0F            [ 1] 4133 	and a,#15 
      00A825 81 01            [ 1] 4134 	ld (WLEN,sp),a 
      00A826 0C 03            [ 1] 4135 	inc (WCNT,sp)
      00A826 CD               [ 1] 4136 1$:	incw x 
      00A827 97               [ 1] 4137 	ld a,(x)
      00A828 65 A1 01         [ 4] 4138 	call putc 
      00A82B 27 03            [ 1] 4139 	inc (LLEN,sp)
      00A82D CC 94            [ 1] 4140 	dec (WLEN,sp)
      00A82F 35 90            [ 1] 4141 	jrne 1$
      00A831 F6 93            [ 1] 4142 	ld a,#70
      00A833 EE 01            [ 1] 4143 	cp a,(LLEN,sp)
      00A835 72 A9            [ 1] 4144 	jrmi 2$   
      00A837 00 03            [ 1] 4145 	ld a,#SPACE 
      00A839 9F A4 7F         [ 4] 4146 	call putc 
      00A83C 81 02            [ 1] 4147 	inc (LLEN,sp) 
      00A83D 20 07            [ 2] 4148 	jra 3$
      00A83D A6 06            [ 1] 4149 2$: ld a,#CR 
      00A83F CD 97 58         [ 4] 4150 	call putc 
      00A842 CD 95            [ 1] 4151 	clr (LLEN,sp)
      00A844 8F A1 02 27      [ 2] 4152 3$:	subw y,#2 
      00A848 0E A1            [ 2] 4153 	ldw y,(y)
      00A84A 04 27            [ 1] 4154 	jrne 0$ 
      00A84C 12 A1            [ 1] 4155 	ld a,#CR 
      00A84E 82 27 03         [ 4] 4156 	call putc  
      00A851 CC               [ 1] 4157 	clrw x 
      00A852 94 35            [ 1] 4158 	ld a,(WCNT,sp)
      00A854 97               [ 1] 4159 	ld xl,a 
      00A854 FD 20 0B         [ 4] 4160 	call prt_i16 
      00A857 AE 2A E1         [ 2] 4161 	ldw x,#words_count_msg
      00A857 F6 88 CD         [ 4] 4162 	call puts 
      002ADC                       4163 	_drop VSIZE 
      00A85A 95 A8            [ 2]    1     addw sp,#VSIZE 
      00A85C 84 20            [ 2] 4164 	popw y 
      00A85E 03               [ 4] 4165 	ret 
      00A85F 20 77 6F 72 64 73 20  4166 words_count_msg: .asciz " words in dictionary\n"
             69 6E 20 64 69 63 74
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



             69 6F 6E 61 72 79 0A
             00
                                   4167 
                                   4168 
                                   4169 ;-----------------------------
                                   4170 ; BASIC: TIMER expr 
                                   4171 ; initialize count down timer 
                                   4172 ;-----------------------------
      002AF7                       4173 set_timer:
      00A85F CD 95 D1         [ 4] 4174 	call arg_list
      00A862 5F 02            [ 1] 4175 	cp a,#1 
      00A864 72 A2            [ 1] 4176 	jreq 1$
      00A866 00 03 90         [ 2] 4177 	jp syntax_error
      002B01                       4178 1$: 
      002B01                       4179 	_xpop  
      00A869 F7 90            [ 1]    1     ld a,(y)
      00A86B EF               [ 1]    2     ldw x,y 
      00A86C 01 A6            [ 2]    3     ldw x,(1,x)
      00A86E 07 CD 97 58      [ 2]    4     addw y,#CELL_SIZE 
      00A872 CF 00 12         [ 2] 4180 	ldw timer,x 
      00A872 90               [ 4] 4181 	ret 
                                   4182 
                                   4183 ;------------------------------
                                   4184 ; BASIC: TIMEOUT 
                                   4185 ; return state of timer 
                                   4186 ; output:
                                   4187 ;   A:X     0 not timeout 
                                   4188 ;   A:X     -1 timeout 
                                   4189 ;------------------------------
      002B0E                       4190 timeout:
      00A873 F6               [ 1] 4191 	clr a 
      00A874 93 EE 01         [ 2] 4192 	ldw x,timer 
      00A877 72 A9            [ 1] 4193 	jreq 1$
      00A879 00               [ 1] 4194 	clrw x
      00A87A 03               [ 4] 4195 	ret  
      00A87B 81               [ 1] 4196 1$:	cpl a
      00A87C 53               [ 2] 4197 	cplw x 
      00A87C CD               [ 4] 4198 	ret 
                                   4199  	
                                   4200 
                                   4201 
                                   4202 
                                   4203 ;-----------------------------------
                                   4204 ; BASIC: IWDGEN expr1 
                                   4205 ; enable independant watchdog timer
                                   4206 ; expr1 is delay in multiple of 62.5µsec
                                   4207 ; expr1 -> {1..16383}
                                   4208 ;-----------------------------------
      002B19                       4209 enable_iwdg:
      00A87D 86 B5 81         [ 4] 4210 	call arg_list
      00A880 A1 01            [ 1] 4211 	cp a,#1 
      00A880 5F C6            [ 1] 4212 	jreq 1$
      00A882 00 2E C0         [ 2] 4213 	jp syntax_error 
      002B23                       4214 1$: _xpop  
      00A885 00 2F            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



      00A887 27               [ 1]    2     ldw x,y 
      00A888 03 53            [ 2]    3     ldw x,(1,x)
      00A88A A6 FF 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A88C 4B 00            [ 1] 4215 	push #0
      00A88C 81 CC 50 E0      [ 1] 4216 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A88D 9E               [ 1] 4217 	ld a,xh 
      00A88D 72 5F            [ 1] 4218 	and a,#0x3f
      00A88F 00               [ 1] 4219 	ld xh,a  
      00A890 19 AE B4         [ 2] 4220 2$:	cpw x,#255
      00A893 80 89            [ 2] 4221 	jrule 3$
      00A895 CF 00            [ 1] 4222 	inc (1,sp)
      00A897 1A               [ 1] 4223 	rcf 
      00A898 CD               [ 2] 4224 	rrcw x 
      00A899 86 14            [ 2] 4225 	jra 2$
      00A89B 27 0F 1E 01      [ 1] 4226 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A89F 1C               [ 1] 4227 	pop a  
      00A8A0 00 80 27         [ 1] 4228 	ld IWDG_PR,a 
      00A8A3 04               [ 1] 4229 	ld a,xl
      00A8A4 1F               [ 1] 4230 	dec a 
      00A8A5 01 20 ED E0      [ 1] 4231 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A8A8 C7 50 E2         [ 1] 4232 	ld IWDG_RLR,a 
      00A8A8 0F 01 0F 02      [ 1] 4233 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A8AC 85               [ 4] 4234 	ret 
                                   4235 
                                   4236 
                                   4237 ;-----------------------------------
                                   4238 ; BASIC: IWDGREF  
                                   4239 ; refresh independant watchdog count down 
                                   4240 ; timer before it reset MCU. 
                                   4241 ;-----------------------------------
      002B57                       4242 refresh_iwdg:
      00A8AD 4F 81 50 E0      [ 1] 4243 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A8AF 81               [ 4] 4244 	ret 
                                   4245 
                                   4246 
                                   4247 ;-------------------------------------
                                   4248 ; BASIC: LOG2(expr)
                                   4249 ; return logarithm base 2 of expr 
                                   4250 ; this is the position of most significant
                                   4251 ; bit set. 
                                   4252 ; input: 
                                   4253 ; output:
                                   4254 ;   A     TK_INTGR 
                                   4255 ;   xstack log2 
                                   4256 ;*********************************
      002B5C                       4257 log2:
      00A8AF CD 97 65         [ 4] 4258 	call func_args 
      00A8B2 A1 02            [ 1] 4259 	cp a,#1 
      00A8B4 27 03            [ 1] 4260 	jreq 1$
      00A8B6 CC 94 35         [ 2] 4261 	jp syntax_error 
      00A8B9                       4262 1$: 
      002B66                       4263 	_xpop    
      00A8B9 90 E6            [ 1]    1     ld a,(y)
      00A8BB 03               [ 1]    2     ldw x,y 
      00A8BC 93 EE            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



      00A8BE 04 CF 00 1A      [ 2]    4     addw y,#CELL_SIZE 
      00A8C2 90               [ 1] 4264 	tnz a
      00A8C3 F6 93            [ 1] 4265 	jrne 2$ 
      00A8C5 EE               [ 2] 4266 	tnzw x 
      00A8C6 01 72            [ 1] 4267 	jrne 2$
      00A8C8 A9 00            [ 1] 4268 	ld a,#ERR_BAD_VALUE
      00A8CA 03 90 F7         [ 2] 4269 	jp tb_error 
      00A8CD 90 EF            [ 1] 4270 2$: push #24 
      00A8CF 01               [ 2] 4271 3$: rlcw x 
      00A8D0 72               [ 1] 4272     rlc a 
      00A8D1 CD 00            [ 1] 4273 	jrc 4$
      00A8D3 1A 81            [ 1] 4274 	dec (1,sp) 
      00A8D5 26 F8            [ 1] 4275 	jrne 3$
      00A8D5 72               [ 1] 4276 4$: clrw x 
      00A8D6 0D               [ 1] 4277     pop a 
      00A8D7 52               [ 1] 4278 	dec a
      00A8D8 30               [ 1] 4279 	rlwa x  
      002B88                       4280 9$:	
      00A8D9 FB               [ 4] 4281 	ret 
                                   4282 
                                   4283 ;-----------------------------------
                                   4284 ; BASIC: BIT(expr) 
                                   4285 ; expr ->{0..23}
                                   4286 ; return 2^expr 
                                   4287 ; output:
                                   4288 ;    A:X    2^expr 
                                   4289 ;-----------------------------------
      002B89                       4290 bitmask:
      00A8DA 8E CC 81         [ 4] 4291     call func_args 
      00A8DD 35 01            [ 1] 4292 	cp a,#1
      00A8DE 27 03            [ 1] 4293 	jreq 1$
      00A8DE 72 0D 52         [ 2] 4294 	jp syntax_error 
      002B93                       4295 1$: _xpop 
      00A8E1 30 FB            [ 1]    1     ld a,(y)
      00A8E3 72               [ 1]    2     ldw x,y 
      00A8E4 16 00            [ 2]    3     ldw x,(1,x)
      00A8E6 23 8E 81 03      [ 2]    4     addw y,#CELL_SIZE 
      00A8E9 9F               [ 1] 4296 	ld a,xl 
      00A8E9 CD 98 AC         [ 2] 4297 	ldw x,#1 
      00A8EC A1 84            [ 1] 4298 	and a,#23
      00A8EE 27 03            [ 1] 4299 	jreq 9$
      00A8F0 CC               [ 1] 4300 	push a 
      00A8F1 94               [ 1] 4301 	clr a 
      002BA6                       4302 2$: 
      00A8F2 35               [ 2] 4303 	slaw x 
      00A8F3 90               [ 1] 4304 	rlc a 	
      00A8F4 F6 93            [ 1] 4305 	dec (1,sp)
      00A8F6 EE 01            [ 1] 4306 	jrne 2$ 
      002BAC                       4307 4$:
      002BAC                       4308     _drop 1 
      00A8F8 72 A9            [ 2]    1     addw sp,#1 
      00A8FA 00               [ 4] 4309 9$:	ret 
                                   4310 
                                   4311 ;------------------------------
                                   4312 ; BASIC: DO 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



                                   4313 ; initiate a DO ... UNTIL loop 
                                   4314 ;------------------------------
                           000003  4315 	DOLP_ADR=3 
                           000005  4316 	DOLP_INW=5
                           000004  4317 	VSIZE=4 
      002BAF                       4318 do_loop:
      00A8FB 03               [ 2] 4319 	popw x 
      00A8FC                       4320 	_vars VSIZE 
      00A8FC CF 00            [ 2]    1     sub sp,#VSIZE 
      00A8FE 13               [ 2] 4321 	pushw x 
      00A8FF CE 00 13         [ 2] 4322 	ldw x,basicptr 
      00A902 5D 27            [ 2] 4323 	ldw (DOLP_ADR,sp),x
      00A904 03 8F 26         [ 2] 4324 	ldw x,in.w 
      00A907 F7 05            [ 2] 4325 	ldw (DOLP_INW,sp),x
      00A908 72 5C 00 1F      [ 1] 4326 	inc loop_depth 
      00A908 81               [ 4] 4327 	ret 
                                   4328 
                                   4329 ;--------------------------------
                                   4330 ; BASIC: UNTIL expr 
                                   4331 ; loop if exprssion is false 
                                   4332 ; else terminate loop
                                   4333 ;--------------------------------
      00A909                       4334 until: 
      00A909 CD 98 AC A1      [ 1] 4335 	tnz loop_depth 
      00A90D 84 27            [ 1] 4336 	jrne 1$ 
      00A90F 03 CC 94         [ 2] 4337 	jp syntax_error 
      002BCB                       4338 1$: 
      00A912 35 90 F6         [ 4] 4339 	call condition  
      002BCE                       4340 	_xpop 
      00A915 93 EE            [ 1]    1     ld a,(y)
      00A917 01               [ 1]    2     ldw x,y 
      00A918 72 A9            [ 2]    3     ldw x,(1,x)
      00A91A 00 03 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A91C 4D               [ 1] 4341 	tnz a 
      00A91C A3 14            [ 1] 4342 	jrne 9$ 
      00A91E 00               [ 2] 4343 	tnzw x 
      00A91F 2B 0C            [ 1] 4344 	jrne 9$ 
      00A921 35 0F            [ 2] 4345 	ldw x,(DOLP_ADR,sp)
      00A923 50 F2 A6         [ 2] 4346 	ldw basicptr,x 
      00A926 1E 62            [ 1] 4347 	ld a,(2,x)
      00A928 A6 10 62         [ 1] 4348 	ld count,a 
      00A92B 20 1E            [ 2] 4349 	ldw x,(DOLP_INW,sp)
      00A92D CF 00 00         [ 2] 4350 	ldw in.w,x 
      00A92D A3               [ 4] 4351 	ret 
      002BED                       4352 9$:	; remove loop data from stack  
      00A92E 08               [ 2] 4353 	popw x
      002BEE                       4354 	_drop VSIZE
      00A92F 00 2B            [ 2]    1     addw sp,#VSIZE 
      00A931 09 35 0E 50      [ 1] 4355 	dec loop_depth 
      00A935 F2               [ 2] 4356 	jp (x)
                                   4357 
                                   4358 ;--------------------------
                                   4359 ; BASIC: PORTA...PORTI  
                                   4360 ;  return constant value 
                                   4361 ;  PORT  base address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



                                   4362 ;---------------------------
      002BF5                       4363 const_porta:
      00A936 A6 50 62         [ 2] 4364 	ldw x,#PA_BASE 
      00A939 20               [ 1] 4365 	clr a 
      00A93A 10               [ 4] 4366 	ret 
      00A93B                       4367 const_portb:
      00A93B 35 07 50         [ 2] 4368 	ldw x,#PB_BASE 
      00A93E F2               [ 1] 4369 	clr a 
      00A93F 81               [ 4] 4370 	ret 
      002BFF                       4371 const_portc:
      00A93F A3 00 40         [ 2] 4372 	ldw x,#PC_BASE 
      00A942 23               [ 1] 4373 	clr a 
      00A943 07               [ 4] 4374 	ret 
      002C04                       4375 const_portd:
      00A944 72 5C 50         [ 2] 4376 	ldw x,#PD_BASE 
      00A947 F2               [ 1] 4377 	clr a 
      00A948 54               [ 4] 4378 	ret 
      002C09                       4379 const_porte:
      00A949 20 F4 14         [ 2] 4380 	ldw x,#PE_BASE 
      00A94B 4F               [ 1] 4381 	clr a 
      00A94B 9F               [ 4] 4382 	ret 
      002C0E                       4383 const_portf:
      00A94C 4A 27 01         [ 2] 4384 	ldw x,#PF_BASE 
      00A94F 4A               [ 1] 4385 	clr a 
      00A950 81               [ 4] 4386 	ret 
      002C13                       4387 const_portg:
      00A950 A4 3E C7         [ 2] 4388 	ldw x,#PG_BASE 
      00A953 50               [ 1] 4389 	clr a 
      00A954 F1               [ 4] 4390 	ret 
      002C18                       4391 const_porti:
      00A955 72 18 50         [ 2] 4392 	ldw x,#PI_BASE 
      00A958 F0               [ 1] 4393 	clr a 
      00A959 8E               [ 4] 4394 	ret 
                                   4395 
                                   4396 ;-------------------------------
                                   4397 ; following return constant 
                                   4398 ; related to GPIO register offset 
                                   4399 ;---------------------------------
      002C1D                       4400 const_odr:
      00A95A 81               [ 1] 4401 	clr a 
      00A95B AE 00 00         [ 2] 4402 	ldw x,#GPIO_ODR
      00A95B C6               [ 4] 4403 	ret 
      002C22                       4404 const_idr:
      00A95C 00               [ 1] 4405 	clr a 
      00A95D 10 CE 00         [ 2] 4406 	ldw x,#GPIO_IDR
      00A960 11               [ 4] 4407 	ret 
      002C27                       4408 const_ddr:
      00A961 81               [ 1] 4409 	clr a
      00A962 AE 00 02         [ 2] 4410 	ldw x,#GPIO_DDR
      00A962 CD               [ 4] 4411 	ret 
      002C2C                       4412 const_cr1:
      00A963 97               [ 1] 4413 	clr a 
      00A964 65 A1 01         [ 2] 4414 	ldw x,#GPIO_CR1
      00A967 27               [ 4] 4415 	ret 
      002C31                       4416 const_cr2:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



      00A968 03               [ 1] 4417 	clr a
      00A969 CC 94 35         [ 2] 4418 	ldw x,#GPIO_CR2
      00A96C 81               [ 4] 4419 	ret 
                                   4420 ;-------------------------
                                   4421 ; BASIC: POUT 
                                   4422 ;  constant for port mode
                                   4423 ;  used by PMODE 
                                   4424 ;  to set pin as output
                                   4425 ;------------------------
      002C36                       4426 const_output:
      00A96C CD               [ 1] 4427 	clr a 
      00A96D 82 73 90         [ 2] 4428 	ldw x,#OUTP
      00A970 F6               [ 4] 4429 	ret 
                                   4430 
                                   4431 ;-------------------------
                                   4432 ; BASIC: PINP 
                                   4433 ;  constant for port mode
                                   4434 ;  used by PMODE 
                                   4435 ;  to set pin as input
                                   4436 ;------------------------
      002C3B                       4437 const_input:
      00A971 93               [ 1] 4438 	clr a  
      00A972 EE 01 72         [ 2] 4439 	ldw x,#INP 
      00A975 A9               [ 4] 4440 	ret 
                                   4441 	
                                   4442 ;-----------------------
                                   4443 ; memory area constants
                                   4444 ;-----------------------
      002C40                       4445 const_eeprom_base:
      00A976 00               [ 1] 4446 	clr a  
      00A977 03 81 00         [ 2] 4447 	ldw x,#EEPROM_BASE 
      00A979 81               [ 4] 4448 	ret 
                                   4449 
                                   4450 ;---------------------------
                                   4451 ; BASIC: DATA 
                                   4452 ; when the interpreter find 
                                   4453 ; a DATA line it skip it.
                                   4454 ;---------------------------
      002C45                       4455 data:
      00A979 CD 97 65 A1 02   [ 1] 4456 	mov in,count 
      00A97E 27               [ 4] 4457 	ret 
                                   4458 
                                   4459 ;------------------------------
                                   4460 ; check if it is a DATA line 
                                   4461 ; input: 
                                   4462 ;    X    line address 
                                   4463 ; output:
                                   4464 ;    Z    set if DATA line 
                                   4465 ;----------------------------
      002C4B                       4466 is_data_line:
      00A97F 03               [ 2] 4467 	pushw x 
      00A980 CC 94            [ 1] 4468 	ld a,(3,x)
      00A982 35 90            [ 1] 4469 	cp a,#TK_CMD 
      00A984 F6 93            [ 1] 4470 	jrne 9$
      00A986 EE 01            [ 2] 4471 	ldw x,(4,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



      00A988 72 A9 00         [ 2] 4472 	cpw x,#data  
      00A98B 03               [ 2] 4473 9$: popw x 
      00A98C 9F               [ 4] 4474 	ret 
                                   4475 
                                   4476 ;---------------------------------
                                   4477 ; BASIC: RESTORE [line#]
                                   4478 ; set data_ptr to first data line
                                   4479 ; if no DATA found pointer set to
                                   4480 ; zero.
                                   4481 ; if a line# is given as argument 
                                   4482 ; a data line with that number 
                                   4483 ; is searched and the data pointer 
                                   4484 ; is set to it. If there is no 
                                   4485 ; data line with that number 
                                   4486 ; the program is interrupted. 
                                   4487 ;---------------------------------
      002C59                       4488 restore:
      00A98D 88 90 F6         [ 4] 4489 	call runtime_only
      00A990 93               [ 1] 4490 	clrw x 
      00A991 EE 01 72         [ 2] 4491 	ldw data_ptr,x 
      00A994 A9 00 03         [ 2] 4492 	ldw data_ofs,x 
      00A997 0D 01 27         [ 2] 4493 	ldw x,txtbgn 
      00A99A 07 98 59         [ 4] 4494 	call next_token 
      00A99D 49 0A            [ 1] 4495 	cp a,#TK_INTGR
      00A99F 01 26            [ 1] 4496 	jrne 0$
      00A9A1 F9 5B 01         [ 4] 4497 	call get_int24
      00A9A4 81 89            [ 2] 4498 	pushw y 
      00A9A5 4F               [ 1] 4499 	clr a 
      00A9A5 CD 97 65         [ 4] 4500 	call search_lineno  
      00A9A8 A1 02            [ 2] 4501 	popw y 
      00A9AA 27               [ 2] 4502 	tnzw x 
      00A9AB 03 CC            [ 1] 4503 	jrne set_data_pointer 
      00A9AD 94 35            [ 2] 4504 	jra data_error 
      002C7D                       4505 0$:
      002C7D                       4506 	_unget_token  
      00A9AF 90 F6 93 EE 01   [ 1]    1      mov in,in.saved  
                                   4507 ; search first DATA line 	
      00A9B4 72 A9 00         [ 2] 4508 1$:	cpw x,txtend
      00A9B7 03 9F            [ 1] 4509 	jruge data_error 
      002C87                       4510 2$:	
      00A9B9 88 90 F6         [ 4] 4511 	call is_data_line 
      00A9BC 93 EE            [ 1] 4512 	jrne 4$
      00A9BE 01 72 A9         [ 4] 4513 4$:	call try_next_line 
      00A9C1 00 03            [ 1] 4514 	jrne 4$ 
      00A9C3 0D               [ 4] 4515 	ret 
                                   4516 
                                   4517 ;---------------------
                                   4518 ; set data pointer 
                                   4519 ; variables at new line 
                                   4520 ; input:
                                   4521 ;    X    line address 
                                   4522 ;----------------------
      002C92                       4523 set_data_pointer:
      00A9C4 01 27 07         [ 2] 4524 	ldw data_ptr,x
      00A9C7 98 46            [ 1] 4525 	ld a,(2,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



      00A9C9 56 0A 01         [ 1] 4526 	ld data_len,a 
      00A9CC 26 F9 5B 01      [ 1] 4527 	mov data_ofs,#FIRST_DATA_ITEM
      00A9D0 81               [ 4] 4528 	ret 
                                   4529 
                                   4530 
                                   4531 ;--------------------
                                   4532 ; at end of data line 
                                   4533 ; check if next line 
                                   4534 ; is a data line 
                                   4535 ; input:
                                   4536 ;    X   actual line address 
                                   4537 ;  
                                   4538 ;-------------------
      00A9D1                       4539 try_next_line: 
      00A9D1 A6 84            [ 1] 4540 	ld a,(2,x)
      00A9D3 CD 97 58         [ 1] 4541 	ld acc8,a 
      00A9D6 CD 95 C1 9F      [ 1] 4542 	clr acc16 
      00A9DA A4 07 C7 50      [ 2] 4543 	addw x,acc16 
      00A9DE C6 81 1D         [ 2] 4544 	cpw x,txtend 
      00A9E0 25 02            [ 1] 4545 	jrult 1$
      00A9E0 52 01            [ 2] 4546 	jra data_error 
      002CB3                       4547 1$:	
      00A9E2 CD 97 6A         [ 4] 4548 	call is_data_line 
      00A9E5 A1 02            [ 1] 4549 	jreq 2$
      00A9E7 27 03            [ 1] 4550 	ld a,#1  
      00A9E9 CC 94            [ 2] 4551 	jra 9$
      00A9EB 35 90 F6         [ 4] 4552 2$:	call set_data_pointer
      00A9EE 93               [ 1] 4553 	clr a  
      00A9EF EE               [ 4] 4554 9$:	ret 
      002CC1                       4555 data_error:	
      00A9F0 01 72            [ 1] 4556     ld a,#ERR_NO_DATA 
      00A9F2 A9 00 03         [ 2] 4557 	jp tb_error 
                                   4558 
                                   4559 
                                   4560 ;---------------------------------
                                   4561 ; BASIC: READ 
                                   4562 ; return next data item | 0 
                                   4563 ;---------------------------------
                           000001  4564 	CTX_BPTR=1 
                           000003  4565 	CTX_IN=3 
                           000004  4566 	CTX_COUNT=4 
                           000005  4567 	INT24=5
                           000007  4568 	VSIZE=7 
      002CC6                       4569 read:
      00A9F5 CF 00 1A         [ 4] 4570 	call runtime_only
      002CC9                       4571 	_vars  VSIZE 
      00A9F8 90 F6            [ 2]    1     sub sp,#VSIZE 
      00A9FA 93 EE 01         [ 4] 4572 	call save_context
      002CCE                       4573 read01:	
      00A9FD 72 A9 00         [ 1] 4574 	ld a,data_ofs
      00AA00 03 CD AA         [ 1] 4575 	cp a,data_len 
      00AA03 3F 6B            [ 1] 4576 	jreq 2$ ; end of line  
      002CD6                       4577 0$:
      00AA05 01 A6 01         [ 2] 4578 	ldw x,data_ptr 
      00AA08 0D 01 27         [ 2] 4579 	ldw basicptr,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



      00AA0B 0D 48 0A 01 26   [ 1] 4580 	mov in,data_ofs 
      00AA10 FB 6B 01 7B 01   [ 1] 4581 	mov count,data_len  
      00AA15 EA 03 E7         [ 4] 4582 	call expression 
      00AA18 03 A6            [ 1] 4583 	cp a,#TK_INTGR 
      00AA1A 01 C1            [ 1] 4584 	jreq 1$ 
      00AA1C 00 0F 27         [ 2] 4585 	jp syntax_error 
      002CF0                       4586 1$:
      00AA1F 10 7B 01         [ 4] 4587 	call next_token ; skip comma
      00AA22 43 E4 04         [ 2] 4588 	ldw x,basicptr 
      00AA25 E7 04 7B         [ 2] 4589 	ldw data_ptr,x 
      00AA28 01 43 E4 02 E7   [ 1] 4590 	mov data_ofs,in 
      00AA2D 02 20 0C         [ 4] 4591 	call rest_context
      00AA30                       4592 	_xpop 
      00AA30 7B 01            [ 1]    1     ld a,(y)
      00AA32 EA               [ 1]    2     ldw x,y 
      00AA33 02 E7            [ 2]    3     ldw x,(1,x)
      00AA35 02 7B 01 EA      [ 2]    4     addw y,#CELL_SIZE 
      002D0A                       4593 	_drop VSIZE 
      00AA39 04 E7            [ 2]    1     addw sp,#VSIZE 
      00AA3B 04               [ 4] 4594 	ret 
      00AA3C                       4595 2$: ; end of line reached 
                                   4596 	; try next line 
      00AA3C 5B 01 81         [ 2] 4597 	ldw x,data_ptr  
      00AA3F CD 2C 9F         [ 4] 4598 	call try_next_line
      00AA3F 58 1C            [ 1] 4599 	jreq 0$ 
      00AA41 AA 4F            [ 2] 4600 	jra data_error 
                                   4601 
                                   4602 ;---------------------------------
                                   4603 ; BASIC: SPIEN clkdiv, 0|1  
                                   4604 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4605 ; if clkdiv==-1 disable SPI
                                   4606 ; 0|1 -> disable|enable  
                                   4607 ;--------------------------------- 
                           000005  4608 SPI_CS_BIT=5
      002D17                       4609 spi_enable:
      00AA43 FE 9F 88         [ 4] 4610 	call arg_list 
      00AA46 5E A6            [ 1] 4611 	cp a,#2
      00AA48 05 42            [ 1] 4612 	jreq 1$
      00AA4A 1C 50 00         [ 2] 4613 	jp syntax_error 
      002D21                       4614 1$: 
      00AA4D 84 81 50 C7      [ 1] 4615 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00AA4F 85               [ 2] 4616 	popw x  
      00AA4F 03               [ 2] 4617 	tnzw x 
      00AA50 06 03            [ 1] 4618 	jreq spi_disable 
      00AA52 05               [ 2] 4619 	popw x 
      00AA53 04 00            [ 1] 4620 	ld a,#(1<<SPI_CR1_BR)
      00AA55 02               [ 4] 4621 	mul x,a 
      00AA56 01               [ 1] 4622 	ld a,xl 
      00AA57 06 00 02         [ 1] 4623 	ld SPI_CR1,a 
                                   4624 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00AA5A 02 02 03 03      [ 1] 4625 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00AA5E 01 03 03 02      [ 1] 4626 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4627 ; configure SPI as master mode 0.	
      00AA62 04 04 05 02      [ 1] 4628 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4629 ; ~CS line controlled by sofware 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      00AA66 06 02 07 02      [ 1] 4630 	bset SPI_CR2,#SPI_CR2_SSM 
      00AA6A 05 04 02 04      [ 1] 4631     bset SPI_CR2,#SPI_CR2_SSI 
                                   4632 ; enable SPI
      00AA6E 01 1C 52 00      [ 1] 4633 	bset SPI_CR1,#SPI_CR1_SPE 	
      00AA6F 81               [ 4] 4634 	ret 
      002D4A                       4635 spi_disable:
      002D4A                       4636 	_drop #2; throw first argument.
      00AA6F CD 97            [ 2]    1     addw sp,##2 
                                   4637 ; wait spi idle 
      00AA71 65 A1            [ 1] 4638 1$:	ld a,#0x82 
      00AA73 01 27 03         [ 1] 4639 	and a,SPI_SR
      00AA76 CC 94            [ 1] 4640 	cp a,#2 
      00AA78 35 F7            [ 1] 4641 	jrne 1$
      00AA79 72 1D 52 00      [ 1] 4642 	bres SPI_CR1,#SPI_CR1_SPE
      00AA79 90 F6 93 EE      [ 1] 4643 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00AA7D 01 72 A9 00      [ 1] 4644 	bres PE_DDR,#SPI_CS_BIT 
      00AA81 03               [ 4] 4645 	ret 
                                   4646 
      002D62                       4647 spi_clear_error:
      00AA82 89 88            [ 1] 4648 	ld a,#0x78 
      00AA84 A6 80 15         [ 1] 4649 	bcp a,SPI_SR 
      00AA87 01 27            [ 1] 4650 	jreq 1$
      00AA89 05 A6 0A CC      [ 1] 4651 	clr SPI_SR 
      00AA8D 94               [ 4] 4652 1$: ret 
                                   4653 
      002D6E                       4654 spi_send_byte:
      00AA8E 37               [ 1] 4655 	push a 
      00AA8F CD 2D 62         [ 4] 4656 	call spi_clear_error
      00AA8F CE               [ 1] 4657 	pop a 
      00AA90 00 15 58 58 58   [ 2] 4658 	btjf SPI_SR,#SPI_SR_TXE,.
      00AA95 58 58 9E         [ 1] 4659 	ld SPI_DR,a
      00AA98 C8 00 15 C7 00   [ 2] 4660 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00AA9D 0E 9F C8         [ 1] 4661 	ld a,SPI_DR 
      00AAA0 00               [ 4] 4662 	ret 
                                   4663 
      002D84                       4664 spi_rcv_byte:
      00AAA1 16 C7            [ 1] 4665 	ld a,#255
      00AAA3 00 0F CE 00 17   [ 2] 4666 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00AAA8 CF 00 15         [ 1] 4667 	ld a,SPI_DR 
      00AAAB CE               [ 4] 4668 	ret
                                   4669 
                                   4670 ;------------------------------
                                   4671 ; BASIC: SPIWR byte [,byte]
                                   4672 ; write 1 or more byte
                                   4673 ;------------------------------
      002D8F                       4674 spi_write:
      00AAAC 00 17 54         [ 4] 4675 	call expression
      00AAAF 9E C8            [ 1] 4676 	cp a,#TK_INTGR 
      00AAB1 00 17            [ 1] 4677 	jreq 1$
      00AAB3 C7 00 17         [ 2] 4678 	jp syntax_error 
      002D99                       4679 1$:	
      00AAB6 9F               [ 1] 4680 	ld a,xl 
      00AAB7 C8 00 18         [ 4] 4681 	call spi_send_byte 
      00AABA C7 00 18         [ 4] 4682 	call next_token 
      00AABD CE 00            [ 1] 4683 	cp a,#TK_COMMA 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



      00AABF 0E 54            [ 1] 4684 	jrne 2$ 
      00AAC1 54 54            [ 2] 4685 	jra spi_write 
      00AAC3 9E               [ 1] 4686 2$:	tnz a 
      00AAC4 C8 00            [ 1] 4687 	jreq 3$
      002DA9                       4688 	_unget_token  
      00AAC6 0E C7 00 0E 9F   [ 1]    1      mov in,in.saved  
      00AACB C8               [ 4] 4689 3$:	ret 
                                   4690 
                                   4691 
                                   4692 ;-------------------------------
                                   4693 ; BASIC: SPIRD 	
                                   4694 ; read one byte from SPI 
                                   4695 ;-------------------------------
      002DAF                       4696 spi_read:
      00AACC 00 0F C7         [ 4] 4697 	call spi_rcv_byte 
      00AACF 00               [ 1] 4698 	clrw x 
      00AAD0 0F               [ 1] 4699 	ld xl,a 
      00AAD1 C8               [ 1] 4700 	clr a  
      00AAD2 00               [ 4] 4701 	ret 
                                   4702 
                                   4703 ;------------------------------
                                   4704 ; BASIC: SPISEL 0|1 
                                   4705 ; set state of ~CS line
                                   4706 ; 0|1 deselect|select  
                                   4707 ;------------------------------
      002DB6                       4708 spi_select:
      00AAD3 18 97 C6         [ 4] 4709 	call next_token 
      00AAD6 00 0E            [ 1] 4710 	cp a,#TK_INTGR 
      00AAD8 C8 00            [ 1] 4711 	jreq 1$
      00AADA 17 95 CF         [ 2] 4712 	jp syntax_error 
      00AADD 00               [ 2] 4713 1$: tnzw x  
      00AADE 17 C6            [ 1] 4714 	jreq cs_high 
      00AAE0 00 16 A4 7F      [ 1] 4715 	bres PE_ODR,#SPI_CS_BIT
      00AAE4 72               [ 4] 4716 	ret 
      002DC8                       4717 cs_high: 
      00AAE5 A2 00 03 90      [ 1] 4718 	bset PE_ODR,#SPI_CS_BIT
      00AAE9 F7               [ 4] 4719 	ret 
                                   4720 
                                   4721 ;-------------------------------
                                   4722 ; BASIC: PAD 
                                   4723 ; Return pad buffer address.
                                   4724 ;------------------------------
      002DCD                       4725 pad_ref:
      00AAEA 90 EF 01         [ 2] 4726 	ldw x,#pad 
      00AAED 84               [ 1] 4727 	clr a
      00AAEE 85               [ 4] 4728 	ret 
                                   4729 
                                   4730 ;****************************
                                   4731 ; expression stack 
                                   4732 ; manipulation routines
                                   4733 ;****************************
                                   4734 
                                   4735 ;-----------------------------
                                   4736 ; BASIC: PUSH expr|rel|cond 
                                   4737 ; push the result on xtack
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



                                   4738 ;-----------------------------
      002DD2                       4739 xpush:
      00AAEF 72 A2 00         [ 4] 4740 	call condition 
      00AAF2 03               [ 4] 4741 	ret 
                                   4742 
                                   4743 ;------------------------------
                                   4744 ; BASIC: POP 
                                   4745 ; pop top of xstack 
                                   4746 ;------------------------------
      002DD6                       4747 xpop:
      002DD6                       4748 	_xpop 
      00AAF3 90 F7            [ 1]    1     ld a,(y)
      00AAF5 90               [ 1]    2     ldw x,y 
      00AAF6 EF 01            [ 2]    3     ldw x,(1,x)
      00AAF8 CD 84 21 90      [ 2]    4     addw y,#CELL_SIZE 
      00AAFC F6               [ 4] 4749 	ret 
                                   4750 
                                   4751 
                                   4752 ;------------------------------
                                   4753 ; BASIC: ALLOC expr 
                                   4754 ; allocate expr element on xtack 
                                   4755 ;-------------------------------
      002DE0                       4756 xalloc: 
      00AAFD 93 EE 01         [ 4] 4757 	call expression 
      00AB00 72 A9            [ 1] 4758 	cp a,#TK_INTGR
      00AB02 00 03            [ 1] 4759 	jreq 1$ 
      00AB04 1C 00 01         [ 2] 4760 	jp syntax_error
      002DEA                       4761 1$: _xpop 
      00AB07 A9 00            [ 1]    1     ld a,(y)
      00AB09 81               [ 1]    2     ldw x,y 
      00AB0A EE 01            [ 2]    3     ldw x,(1,x)
      00AB0A CD 97 42 90      [ 2]    4     addw y,#CELL_SIZE 
      00AB0E 89               [ 1] 4762 	tnz a 
      00AB0F 52 03            [ 1] 4763 	jreq 3$ 
      00AB11 0F 02            [ 1] 4764 2$:	ld a,#ERR_BAD_VALUE
      00AB13 0F 03 90         [ 2] 4765 	jp tb_error 
      00AB16 AE B4 21         [ 2] 4766 3$: cpw x,#XSTACK_SIZE 
      00AB19 93 F6            [ 1] 4767 	jrugt 2$
      00AB1B A4 0F            [ 1] 4768 	ld a,#CELL_SIZE 
      00AB1D 6B               [ 4] 4769 	mul x,a 
      00AB1E 01 0C 03         [ 2] 4770 	ldw acc16,x 
      00AB21 5C F6 CD 86      [ 2] 4771 	subw y,acc16 
      00AB25 A5 0C 02 0A      [ 2] 4772 	cpw y,#xstack_full
      00AB29 01 26            [ 1] 4773 	jrugt 9$
      00AB2B F5 A6            [ 1] 4774 	ld a,#ERR_MEM_FULL
      00AB2D 46 11 02         [ 2] 4775 	jp tb_error 
      002E15                       4776 9$:	 
      00AB30 2B               [ 4] 4777 	ret 
                                   4778 
                                   4779 
                                   4780 ;------------------------------
                                   4781 ;  BASIC DROP expr 
                                   4782 ;  expr in range {0..XSTACK_SIZE}
                                   4783 ;  discard n elements from xtack
                                   4784 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



      002E16                       4785 xdrop:
      00AB31 09 A6 20         [ 4] 4786 	call expression 
      00AB34 CD 86            [ 1] 4787 	cp a,#TK_INTGR
      00AB36 A5 0C            [ 1] 4788 	jreq 1$ 
      00AB38 02 20 07         [ 2] 4789 	jp syntax_error 
      002E20                       4790 1$:	_xpop 
      00AB3B A6 0D            [ 1]    1     ld a,(y)
      00AB3D CD               [ 1]    2     ldw x,y 
      00AB3E 86 A5            [ 2]    3     ldw x,(1,x)
      00AB40 0F 02 72 A2      [ 2]    4     addw y,#CELL_SIZE 
      00AB44 00               [ 1] 4791 	ld a,xl 
      00AB45 02 90            [ 1] 4792 	and a,#0x1f 
      00AB47 FE               [ 1] 4793 	clrw x 
      00AB48 26               [ 1] 4794 	ld xl,a 
      00AB49 CF A6            [ 1] 4795 	ld a,#CELL_SIZE 
      00AB4B 0D               [ 4] 4796 	mul x,a 
      00AB4C CD 86 A5         [ 2] 4797 	ldw acc16,x  
      00AB4F 5F 7B 03 97      [ 2] 4798 	addw y,acc16 
      00AB53 CD 95 D7 AE      [ 2] 4799 	cpw y,#XSTACK_EMPTY 
      00AB57 AB 61            [ 2] 4800 	jrule 9$
      00AB59 CD 87 02 5B      [ 2] 4801 	ldw y,#XSTACK_EMPTY 
      00AB5D 03               [ 4] 4802 9$:	ret 
                                   4803 
                                   4804 ;-----------------------
                                   4805 ; check if value in A:X 
                                   4806 ; is inside xstack bound
                                   4807 ; output:
                                   4808 ;    X     slot address  
                                   4809 ;-----------------------
      002E43                       4810 xstack_bound:
      00AB5E 90               [ 1] 4811 	tnz a 
      00AB5F 85 81            [ 1] 4812 	jrne 8$ 
      00AB61 20 77 6F         [ 2] 4813 1$: cpw x,#XSTACK_SIZE 
      00AB64 72 64            [ 1] 4814 	jrugt 8$
      00AB66 73 20            [ 1] 4815 	ld a,#CELL_SIZE 
      00AB68 69               [ 4] 4816 	mul x,a
      00AB69 6E 20 64         [ 2] 4817 	ldw acc16,x 
      00AB6C 69               [ 1] 4818 	ldw x,y 
      00AB6D 63 74 69 6F      [ 2] 4819 	addw x,acc16 
      00AB71 6E 61 72         [ 2] 4820 	cpw x,#XSTACK_EMPTY 
      00AB74 79 0A            [ 1] 4821 	jruge 8$  
      00AB76 00               [ 4] 4822 	ret 
      00AB77 A6 0A            [ 1] 4823 8$: ld a,#ERR_BAD_VALUE
      00AB77 CD 97 6A         [ 2] 4824 	jp tb_error 
                                   4825 
                                   4826 ;-------------------------
                                   4827 ; BASIC: PUT expr, cond 
                                   4828 ; expr -> slot 
                                   4829 ; cond -> valut to put 
                                   4830 ; on xstack 
                                   4831 ;-------------------------
      002E61                       4832 xput:
      00AB7A A1 01 27         [ 4] 4833 	call arg_list 
      00AB7D 03 CC            [ 1] 4834 	cp a,#2 
      00AB7F 94 35            [ 1] 4835 	jreq 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



      00AB81 CC 13 B5         [ 2] 4836 0$:	jp syntax_error
      002E6B                       4837 1$: _xpop   ; value to put 
      00AB81 90 F6            [ 1]    1     ld a,(y)
      00AB83 93               [ 1]    2     ldw x,y 
      00AB84 EE 01            [ 2]    3     ldw x,(1,x)
      00AB86 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00AB8A CF               [ 2] 4838 	pushw x 
      00AB8B 00               [ 1] 4839 	push a 
      002E76                       4840 	_xpop    ; slot 
      00AB8C 13 81            [ 1]    1     ld a,(y)
      00AB8E 93               [ 1]    2     ldw x,y 
      00AB8E 4F CE            [ 2]    3     ldw x,(1,x)
      00AB90 00 13 27 02      [ 2]    4     addw y,#CELL_SIZE 
      00AB94 5F 81 43         [ 4] 4841 	call xstack_bound
      00AB97 53 81 19         [ 2] 4842     ldw ptr16,x 
      00AB99 84               [ 1] 4843 	pop a 
      00AB99 CD               [ 2] 4844 	popw x 
      00AB9A 97 6A A1 01      [ 4] 4845 	ld [ptr16],a 
      00AB9E 27 03 CC 94      [ 1] 4846 	inc ptr8 
      00ABA2 35 90 F6 93      [ 5] 4847 	ldw [ptr16],x 
      00ABA6 EE               [ 4] 4848 	ret 
                                   4849 
                                   4850 ;------------------------
                                   4851 ; BASIC: PICK expr 
                                   4852 ; get nième element on 
                                   4853 ; xtack. 
                                   4854 ;-----------------------
      002E94                       4855 xpick:
      00ABA7 01 72 A9         [ 4] 4856 	call func_args 
      00ABAA 00 03            [ 1] 4857 	cp a,#1 
      00ABAC 4B 00            [ 1] 4858 	jreq 1$
      00ABAE 35 CC 50         [ 2] 4859 	jp syntax_error 
      002E9E                       4860 1$: _xpop 
      00ABB1 E0 9E            [ 1]    1     ld a,(y)
      00ABB3 A4               [ 1]    2     ldw x,y 
      00ABB4 3F 95            [ 2]    3     ldw x,(1,x)
      00ABB6 A3 00 FF 23      [ 2]    4     addw y,#CELL_SIZE 
      00ABBA 06 0C 01         [ 4] 4861 	call xstack_bound
      00ABBD 98               [ 1] 4862     ld a,(x)
      00ABBE 56 20            [ 2] 4863 	ldw x,(1,x)				
      00ABC0 F5               [ 4] 4864 	ret 
                                   4865 
                                   4866 
                                   4867 ;----------------------------
                                   4868 ; BASIC: AUTORUN \C | label  
                                   4869 ;  \C -> cancel autorun 
                                   4870 ;  addr -> register an 
                                   4871 ;    autorun program 
                                   4872 ;    this program execute at 
                                   4873 ;     reset/boot 
                                   4874 ;----------------------------
      002EAE                       4875 cmd_auto_run:
      00ABC1 35 55 50         [ 4] 4876 	call cmd_line_only
      00ABC4 E0 84 C7         [ 4] 4877 	call next_token 
      00ABC7 50 E1            [ 1] 4878 	cp a,#TK_LABEL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



      00ABC9 9F 4A            [ 1] 4879 	jreq 1$ 
      00ABCB 35 55            [ 1] 4880 	cp a,#TK_CHAR 
      00ABCD 50 E0            [ 1] 4881 	jrne 0$ 
      00ABCF C7               [ 1] 4882 	ld a,(x)
      00ABD0 50 E2 35 AA      [ 1] 4883 	inc in 
      00ABD4 50 E0            [ 1] 4884 	and a,#0xDF 
      00ABD6 81 43            [ 1] 4885 	cp a,#'C 
      00ABD7 26 07            [ 1] 4886 	jrne 0$ 
      00ABD7 35 AA 50         [ 2] 4887 	ldw x,#EEPROM_BASE 
      00ABDA E0 81 0F         [ 4] 4888 	call erase_header
      00ABDC 81               [ 4] 4889 	ret 
      00ABDC CD 97 65         [ 2] 4890 0$:	jp syntax_error
      00ABDF A1               [ 2] 4891 1$:	pushw x 
      00ABE0 01 27 03         [ 4] 4892 	call skip_string
      00ABE3 CC               [ 2] 4893 	popw x 
      00ABE4 94 35 07         [ 4] 4894 	call search_program
      00ABE6 26 05            [ 1] 4895 	jrne 2$ 
      00ABE6 90 F6            [ 1] 4896 	ld a,#ERR_BAD_VALUE
      00ABE8 93 EE 01         [ 2] 4897 	jp tb_error 
      00ABEB 72               [ 2] 4898 2$: pushw x 
      00ABEC A9 00 03 4D      [ 1] 4899 	clr farptr 
      00ABF0 26 08 5D         [ 2] 4900 	ldw x,#EEPROM_BASE
      00ABF3 26 05 A6         [ 2] 4901 	ldw ptr16,x 
      00ABF6 0A CC 94         [ 1] 4902 	ld a,AR_SIGN 
      00ABF9 37               [ 1] 4903 	clrw x 	 
      00ABFA 4B 18 59         [ 4] 4904 	call write_byte
      00ABFD 49 25 04         [ 1] 4905 	ld a,AR_SIGN+1
      00AC00 0A 01 26         [ 4] 4906 	call write_byte 
      00AC03 F8 5F            [ 1] 4907 	ld a,(1,sp)
      00AC05 84 4A 02         [ 4] 4908 	call write_byte 
      00AC08 7B 02            [ 1] 4909 	ld a,(2,sp)
      00AC08 81 04 B1         [ 4] 4910 	call write_byte 
      00AC09                       4911 	_drop 2 
      00AC09 CD 97            [ 2]    1     addw sp,#2 
      00AC0B 65               [ 4] 4912 	ret 
                                   4913 
      00AC0C A1 01                 4914 AR_SIGN: .ascii "AR" ; autorun signature 
                                   4915 
                                   4916 ;-------------------------------
                                   4917 ; search a program in flash 
                                   4918 ; memory with a label at first 
                                   4919 ; that correspond to name 
                                   4920 ; pointed by X 
                                   4921 ; input:
                                   4922 ;    x      *name 
                                   4923 ; output: 
                                   4924 ;    X     prog_addr|0
                                   4925 ;-------------------------------
                           000001  4926 	WLKPTR=1 
                           000003  4927 	PNAME=3
                           000005  4928 	LIMIT=5
                           000007  4929 	YSAVE=7
                           000006  4930 	VSIZE=6 
      002F07                       4931 search_program:
      00AC0E 27 03            [ 2] 4932 	pushw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



      002F09                       4933 	_vars VSIZE 
      00AC10 CC 94            [ 2]    1     sub sp,#VSIZE 
      00AC12 35 90            [ 2] 4934 	ldw (PNAME,sp),x 
      00AC14 F6 93 EE         [ 4] 4935 	call uflash 
      00AC17 01 72            [ 2] 4936 	ldw (LIMIT,sp),x 
      00AC19 A9 00 03         [ 2] 4937 	ldw x,#app_space 
      00AC1C 9F AE            [ 2] 4938 1$:	ldw (WLKPTR,sp),x  
      00AC1E 00               [ 1] 4939 	clr a 
      00AC1F 01 A4 17         [ 4] 4940 	call is_program_addr
      00AC22 27 0A            [ 1] 4941 	jrne 4$
      00AC24 88 4F 07         [ 2] 4942 	addw x,#7 
      00AC26 F6               [ 1] 4943 	ld a,(x)
      00AC26 58 49            [ 1] 4944 	cp a,#TK_LABEL 
      00AC28 0A 01            [ 1] 4945 	jrne 4$ 
      00AC2A 26               [ 1] 4946 	incw x 
      00AC2B FA 03            [ 2] 4947 	ldw y,(PNAME,sp)
      00AC2C CD 10 BC         [ 4] 4948 	call strcmp
      00AC2C 5B 01            [ 1] 4949 	jrne 6$
      002F2D                       4950 4$: 
      00AC2E 81 26 D6         [ 4] 4951 	call skip_to_next
      00AC2F 13 05            [ 2] 4952 	cpw x,(LIMIT,sp)
      00AC2F 85 52            [ 1] 4953 	jrult 1$
      00AC31 04               [ 1] 4954 	clrw x 
      00AC32 89 CE            [ 2] 4955 	jra 8$
      002F37                       4956 6$: ; found label 
      00AC34 00 05            [ 2] 4957 	ldw x,(WLKPTR,sp)
      00AC36 1F 03 CE         [ 2] 4958 	addw x,#4 	
      002F3C                       4959 8$:	
      002F3C                       4960 	_drop VSIZE  
      00AC39 00 01            [ 2]    1     addw sp,#VSIZE 
      00AC3B 1F 05            [ 2] 4961 	popw y 
      00AC3D 72               [ 4] 4962 	ret 
                                   4963 
                                   4964 
                                   4965 ;-------------------------------
                                   4966 ; BASIC: CHAIN label [, line#]
                                   4967 ; Execute another program like it 
                                   4968 ; is a sub-routine. When the 
                                   4969 ; called program terminate 
                                   4970 ; execution continue at caller 
                                   4971 ; after CHAIN command. 
                                   4972 ; if a line# is given, the 
                                   4973 ; chained program start execution 
                                   4974 ; at this line#.
                                   4975 ;---------------------------------
                           000003  4976 	CHAIN_LN=3 
                           000005  4977 	CHAIN_ADDR=5 
                           000007  4978 	CHAIN_BP=7
                           000009  4979 	CHAIN_IN=9
                           00000A  4980 	CHAIN_COUNT=10 
                           00000B  4981 	CHAIN_TXTBGN=11 
                           00000D  4982 	CHAIN_TXTEND=13 
                           00000C  4983 	VSIZE=12 
                           000004  4984 	DISCARD=4 
      002F41                       4985 cmd_chain:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



      00AC3E 5C               [ 2] 4986 	popw x 
      002F42                       4987 	_vars VSIZE 
      00AC3F 00 20            [ 2]    1     sub sp,#VSIZE 
      00AC41 81               [ 2] 4988 	pushw x
      00AC42 0F 03            [ 1] 4989 	clr (CHAIN_LN,sp) 
      00AC42 72 5D            [ 1] 4990 	clr (CHAIN_LN+1,sp)  
      00AC44 00 20            [ 1] 4991 	ld a,#TK_LABEL 
      00AC46 26 03 CC         [ 4] 4992 	call expect 
      00AC49 94               [ 2] 4993 	pushw x 
      00AC4A 35 15 28         [ 4] 4994 	call skip_string
      00AC4B 85               [ 2] 4995 	popw x 
      00AC4B CD 99 C5         [ 4] 4996 	call search_program 
      00AC4E 90               [ 2] 4997 	tnzw x  
      00AC4F F6 93            [ 1] 4998 	jrne 1$ 
      00AC51 EE 01            [ 1] 4999 0$:	ld a,#ERR_BAD_VALUE
      00AC53 72 A9 00         [ 2] 5000 	jp tb_error 
      00AC56 03 4D            [ 2] 5001 1$: ldw (CHAIN_ADDR,sp), x ; program addr 
      00AC58 26 13 5D         [ 4] 5002     call next_token 
      00AC5B 26 10            [ 1] 5003 	cp a,#TK_COMMA 
      00AC5D 1E 03            [ 1] 5004 	jrne 4$
      00AC5F CF 00            [ 1] 5005 	ld a,#TK_INTGR
      00AC61 05 E6 02         [ 4] 5006 	call expect 
      00AC64 C7 00 03         [ 4] 5007 	call get_int24 
      00AC67 1E 05            [ 2] 5008 	ldw (CHAIN_LN,sp),x
      00AC69 CF 00            [ 2] 5009 	jra 6$ 
      002F73                       5010 4$: _unget_token 
      00AC6B 01 81 03 00 01   [ 1]    1      mov in,in.saved  
      00AC6D                       5011 6$: ; save chain context 
      00AC6D 85 5B 04         [ 2] 5012 	ldw x,basicptr 
      00AC70 72 5A            [ 2] 5013 	ldw (CHAIN_BP,sp),x 
      00AC72 00 20 FC         [ 2] 5014 	ldw x,in
      00AC75 1F 09            [ 2] 5015 	ldw (CHAIN_IN,sp),x
      00AC75 AE 50 00         [ 2] 5016 	ldw x,txtbgn 
      00AC78 4F 81            [ 2] 5017 	ldw (CHAIN_TXTBGN,sp),x
      00AC7A CE 00 1D         [ 2] 5018 	ldw x,txtend 
      00AC7A AE 50            [ 2] 5019 	ldw (CHAIN_TXTEND,sp),x  
                                   5020 ; set chained program context 	
      00AC7C 05 4F            [ 2] 5021 	ldw x,(CHAIN_ADDR,sp)
      00AC7E 81 00 04         [ 2] 5022 	ldw basicptr,x 
      00AC7F CF 00 1B         [ 2] 5023 	ldw txtbgn,x 
      00AC7F AE 50 0A         [ 2] 5024 	subw x,#2
      00AC82 4F               [ 2] 5025 	ldw x,(x)
      00AC83 81 FB 05         [ 2] 5026 	addw x,(CHAIN_ADDR,sp)
      00AC84 CF 00 1D         [ 2] 5027 	ldw txtend,x  
      00AC84 AE 50            [ 2] 5028 	ldw x,(CHAIN_ADDR,sp)
      00AC86 0F 4F            [ 1] 5029 	ld a,(2,x)
      00AC88 81 00 02         [ 1] 5030 	ld count,a 
      00AC89 35 03 00 01      [ 1] 5031 	mov in,#3 
      00AC89 AE 50            [ 2] 5032 	ldw x,(CHAIN_LN,sp)
      00AC8B 14               [ 2] 5033 	tnzw x 
      00AC8C 4F 81            [ 1] 5034 	jreq 8$ 
      00AC8E 90 89            [ 2] 5035 	pushw y
      00AC8E AE               [ 1] 5036 	clr a  
      00AC8F 50 19 4F         [ 4] 5037 	call search_lineno
      00AC92 81 85            [ 2] 5038 	popw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



      00AC93 5D               [ 2] 5039 	tnzw x 
      00AC93 AE 50            [ 1] 5040 	jreq 0$ 
      00AC95 1E 4F 81         [ 2] 5041 	ldw basicptr,x 
      00AC98 E6 02            [ 1] 5042 	ld a,(2,x)
      00AC98 AE 50 28         [ 1] 5043 	ld count,a 
      00AC9B 4F 81 00 33      [ 1] 5044 8$: inc chain_level
      00AC9D 85               [ 2] 5045 	popw x 
      002FC6                       5046 	_drop DISCARD
      00AC9D 4F AE            [ 2]    1     addw sp,#DISCARD 
      00AC9F 00               [ 2] 5047 	jp (x)
                                   5048 
                                   5049 
                                   5050 ;------------------------------
                                   5051 ;      dictionary 
                                   5052 ; format:
                                   5053 ;   link:   2 bytes 
                                   5054 ;   name_length+flags:  1 byte, bits 0:3 lenght,4:8 kw type   
                                   5055 ;   cmd_name: 16 byte max 
                                   5056 ;   code_addr: 2 bytes 
                                   5057 ;------------------------------
                                   5058 	.macro _dict_entry len,name,code_addr 
                                   5059 	.word LINK 
                                   5060 	LINK=.
                                   5061 name:
                                   5062 	.byte len   	
                                   5063 	.ascii "name"
                                   5064 	.word code_addr  
                                   5065 	.endm 
                                   5066 
                           000000  5067 	LINK=0
                                   5068 ; respect alphabetic order for BASIC names from Z-A
                                   5069 ; this sort order is for a cleaner WORDS cmd output. 	
      002FC9                       5070 kword_end:
      002FC9                       5071 	_dict_entry,3+F_XOR,XOR,TK_XOR ; xor operator
      00ACA0 00 81                    1 	.word LINK 
                           002FCB     2 	LINK=.
      00ACA2                          3 XOR:
      00ACA2 4F                       4 	.byte 3+F_XOR   	
      00ACA3 AE 00 01                 5 	.ascii "XOR"
      00ACA6 81 8A                    6 	.word TK_XOR  
      00ACA7                       5072 	_dict_entry,5,WRITE,write  
      00ACA7 4F AE                    1 	.word LINK 
                           002FD3     2 	LINK=.
      002FD3                          3 WRITE:
      00ACA9 00                       4 	.byte 5   	
      00ACAA 02 81 49 54 45           5 	.ascii "WRITE"
      00ACAC 27 3D                    6 	.word write  
      002FDB                       5073 	_dict_entry,5,WORDS,words 
      00ACAC 4F AE                    1 	.word LINK 
                           002FDD     2 	LINK=.
      002FDD                          3 WORDS:
      00ACAE 00                       4 	.byte 5   	
      00ACAF 03 81 52 44 53           5 	.ascii "WORDS"
      00ACB1 2A 8A                    6 	.word words  
      002FE5                       5074 	_dict_entry 4,WAIT,wait 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



      00ACB1 4F AE                    1 	.word LINK 
                           002FE7     2 	LINK=.
      002FE7                          3 WAIT:
      00ACB3 00                       4 	.byte 4   	
      00ACB4 04 81 49 54              5 	.ascii "WAIT"
      00ACB6 1E 72                    6 	.word wait  
      002FEE                       5075 	_dict_entry,3+F_IFUNC,USR,usr
      00ACB6 4F AE                    1 	.word LINK 
                           002FF0     2 	LINK=.
      002FF0                          3 USR:
      00ACB8 00                       4 	.byte 3+F_IFUNC   	
      00ACB9 01 81 52                 5 	.ascii "USR"
      00ACBB 28 2F                    6 	.word usr  
      002FF6                       5076 	_dict_entry,5,UNTIL,until 
      00ACBB 4F AE                    1 	.word LINK 
                           002FF8     2 	LINK=.
      002FF8                          3 UNTIL:
      00ACBD 00                       4 	.byte 5   	
      00ACBE 00 81 54 49 4C           5 	.ascii "UNTIL"
      00ACC0 2B C2                    6 	.word until  
      003000                       5077 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      00ACC0 4F AE                    1 	.word LINK 
                           003002     2 	LINK=.
      003002                          3 UFLASH:
      00ACC2 40                       4 	.byte 6+F_IFUNC   	
      00ACC3 00 81 4C 41 53 48        5 	.ascii "UFLASH"
      00ACC5 28 0D                    6 	.word uflash  
      00300B                       5078 	_dict_entry,6+F_IFUNC,UBOUND,ubound
      00ACC5 55 00                    1 	.word LINK 
                           00300D     2 	LINK=.
      00300D                          3 UBOUND:
      00ACC7 03                       4 	.byte 6+F_IFUNC   	
      00ACC8 00 02 81 55 4E 44        5 	.ascii "UBOUND"
      00ACCB 19 F9                    6 	.word ubound  
      003016                       5079 	_dict_entry,4,TONE,tone  
      00ACCB 89 E6                    1 	.word LINK 
                           003018     2 	LINK=.
      003018                          3 TONE:
      00ACCD 03                       4 	.byte 4   	
      00ACCE A1 80 26 05              5 	.ascii "TONE"
      00ACD2 EE 04                    6 	.word tone  
      00301F                       5080 	_dict_entry,2,TO,to
      00ACD4 A3 AC                    1 	.word LINK 
                           003021     2 	LINK=.
      003021                          3 TO:
      00ACD6 C5                       4 	.byte 2   	
      00ACD7 85 81                    5 	.ascii "TO"
      00ACD9 1F DC                    6 	.word to  
      003026                       5081 	_dict_entry,5,TIMER,set_timer
      00ACD9 CD 97                    1 	.word LINK 
                           003028     2 	LINK=.
      003028                          3 TIMER:
      00ACDB 4D                       4 	.byte 5   	
      00ACDC 5F CF 00 07 CF           5 	.ascii "TIMER"
      00ACE1 00 09                    6 	.word set_timer  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



      003030                       5082 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00ACE3 CE 00                    1 	.word LINK 
                           003032     2 	LINK=.
      003032                          3 TIMEOUT:
      00ACE5 1C                       4 	.byte 7+F_IFUNC   	
      00ACE6 CD 95 8F A1 84 26 10     5 	.ascii "TIMEOUT"
      00ACED CD 95                    6 	.word timeout  
      00303C                       5083 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00ACEF C1 90                    1 	.word LINK 
                           00303E     2 	LINK=.
      00303E                          3 TICKS:
      00ACF1 89                       4 	.byte 5+F_IFUNC   	
      00ACF2 4F CD 89 EB 90           5 	.ascii "TICKS"
      00ACF7 85 5D                    6 	.word get_ticks  
      003046                       5084 	_dict_entry,4,STOP,stop 
      00ACF9 26 17                    1 	.word LINK 
                           003048     2 	LINK=.
      003048                          3 STOP:
      00ACFB 20                       4 	.byte 4   	
      00ACFC 44 54 4F 50              5 	.ascii "STOP"
      00ACFD 24 89                    6 	.word stop  
      00304F                       5085 	_dict_entry,4,STEP,step 
      00ACFD 55 00                    1 	.word LINK 
                           003051     2 	LINK=.
      003051                          3 STEP:
      00ACFF 04                       4 	.byte 4   	
      00AD00 00 02 C3 00              5 	.ascii "STEP"
      00AD04 1E 24                    6 	.word step  
      003058                       5086 	_dict_entry,5,SPIWR,spi_write
      00AD06 3A 51                    1 	.word LINK 
                           00305A     2 	LINK=.
      00AD07                          3 SPIWR:
      00AD07 CD                       4 	.byte 5   	
      00AD08 AC CB 26 00 CD           5 	.ascii "SPIWR"
      00AD0D AD 1F                    6 	.word spi_write  
      003062                       5087 	_dict_entry,6,SPISEL,spi_select
      00AD0F 26 FB                    1 	.word LINK 
                           003064     2 	LINK=.
      003064                          3 SPISEL:
      00AD11 81                       4 	.byte 6   	
      00AD12 53 50 49 53 45 4C        5 	.ascii "SPISEL"
      00AD12 CF 00                    6 	.word spi_select  
      00306D                       5088 	_dict_entry,5+F_IFUNC,SPIRD,spi_read 
      00AD14 07 E6                    1 	.word LINK 
                           00306F     2 	LINK=.
      00306F                          3 SPIRD:
      00AD16 02                       4 	.byte 5+F_IFUNC   	
      00AD17 C7 00 0A 35 06           5 	.ascii "SPIRD"
      00AD1C 00 09                    6 	.word spi_read  
      003077                       5089 	_dict_entry,5,SPIEN,spi_enable 
      00AD1E 81 6F                    1 	.word LINK 
                           003079     2 	LINK=.
      00AD1F                          3 SPIEN:
      00AD1F E6                       4 	.byte 5   	
      00AD20 02 C7 00 0F 72           5 	.ascii "SPIEN"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



      00AD25 5F 00                    6 	.word spi_enable  
      003081                       5090 	_dict_entry,5,SLEEP,sleep 
      00AD27 0E 72                    1 	.word LINK 
                           003083     2 	LINK=.
      003083                          3 SLEEP:
      00AD29 BB                       4 	.byte 5   	
      00AD2A 00 0E C3 00 1E           5 	.ascii "SLEEP"
      00AD2F 25 02                    6 	.word sleep  
      00308B                       5091     _dict_entry,4,SIZE,cmd_size 
      00AD31 20 0E                    1 	.word LINK 
                           00308D     2 	LINK=.
      00AD33                          3 SIZE:
      00AD33 CD                       4 	.byte 4   	
      00AD34 AC CB 27 04              5 	.ascii "SIZE"
      00AD38 A6 01                    6 	.word cmd_size  
      003094                       5092 	_dict_entry,4,SAVE,cmd_save 
      00AD3A 20 04                    1 	.word LINK 
                           003096     2 	LINK=.
      003096                          3 SAVE:
      00AD3C CD                       4 	.byte 4   	
      00AD3D AD 12 4F 81              5 	.ascii "SAVE"
      00AD41 26 29                    6 	.word cmd_save  
      00309D                       5093 	_dict_entry 3,RUN,cmd_run
      00AD41 A6 0C                    1 	.word LINK 
                           00309F     2 	LINK=.
      00309F                          3 RUN:
      00AD43 CC                       4 	.byte 3   	
      00AD44 94 37 4E                 5 	.ascii "RUN"
      00AD46 22 2C                    6 	.word cmd_run  
      0030A5                       5094 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00AD46 CD 97                    1 	.word LINK 
                           0030A7     2 	LINK=.
      0030A7                          3 RSHIFT:
      00AD48 4D                       4 	.byte 6+F_IFUNC   	
      00AD49 52 07 CD 9E 2D 54        5 	.ascii "RSHIFT"
      00AD4E 29 25                    6 	.word rshift  
      0030B0                       5095 	_dict_entry,3+F_IFUNC,RND,random 
      00AD4E C6 00                    1 	.word LINK 
                           0030B2     2 	LINK=.
      0030B2                          3 RND:
      00AD50 09                       4 	.byte 3+F_IFUNC   	
      00AD51 C1 00 0A                 5 	.ascii "RND"
      00AD54 27 37                    6 	.word random  
      00AD56                       5096 	_dict_entry,6,RETURN,return 
      00AD56 CE 00                    1 	.word LINK 
                           0030BA     2 	LINK=.
      0030BA                          3 RETURN:
      00AD58 07                       4 	.byte 6   	
      00AD59 CF 00 05 55 00 09        5 	.ascii "RETURN"
      00AD5F 00 02                    6 	.word return  
      0030C3                       5097 	_dict_entry,7,RESTORE,restore 
      00AD61 55 00                    1 	.word LINK 
                           0030C5     2 	LINK=.
      0030C5                          3 RESTORE:
      00AD63 0A                       4 	.byte 7   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



      00AD64 00 03 CD 98 AC A1 84     5 	.ascii "RESTORE"
      00AD6B 27 03                    6 	.word restore  
      0030CF                       5098 	_dict_entry 3,REM,remark 
      00AD6D CC 94                    1 	.word LINK 
                           0030D1     2 	LINK=.
      0030D1                          3 REM:
      00AD6F 35                       4 	.byte 3   	
      00AD70 52 45 4D                 5 	.ascii "REM"
      00AD70 CD 95                    6 	.word remark  
      0030D7                       5099 	_dict_entry,6,REBOOT,cold_start
      00AD72 8F CE                    1 	.word LINK 
                           0030D9     2 	LINK=.
      0030D9                          3 REBOOT:
      00AD74 00                       4 	.byte 6   	
      00AD75 05 CF 00 07 55 00        5 	.ascii "REBOOT"
      00AD7B 02 00                    6 	.word cold_start  
      0030E2                       5100 	_dict_entry,4+F_IFUNC,READ,read  
      00AD7D 09 CD                    1 	.word LINK 
                           0030E4     2 	LINK=.
      0030E4                          3 READ:
      00AD7F 9E                       4 	.byte 4+F_IFUNC   	
      00AD80 3D 90 F6 93              5 	.ascii "READ"
      00AD84 EE 01                    6 	.word read  
      0030EB                       5101 	_dict_entry,4+F_IFUNC,QKEY,qkey
      00AD86 72 A9                    1 	.word LINK 
                           0030ED     2 	LINK=.
      0030ED                          3 QKEY:
      00AD88 00                       4 	.byte 4+F_IFUNC   	
      00AD89 03 5B 07 81              5 	.ascii "QKEY"
      00AD8D 28 00                    6 	.word qkey  
      0030F4                       5102 	_dict_entry,3,PUT,xput 
      00AD8D CE 00                    1 	.word LINK 
                           0030F6     2 	LINK=.
      0030F6                          3 PUT:
      00AD8F 07                       4 	.byte 3   	
      00AD90 CD AD 1F                 5 	.ascii "PUT"
      00AD93 27 C1                    6 	.word xput  
      0030FC                       5103 	_dict_entry,4,PUSH,xpush   
      00AD95 20 AA                    1 	.word LINK 
                           0030FE     2 	LINK=.
      00AD97                          3 PUSH:
      00AD97 CD                       4 	.byte 4   	
      00AD98 97 6A A1 02              5 	.ascii "PUSH"
      00AD9C 27 03                    6 	.word xpush  
      003105                       5104 	_dict_entry,5+F_IFUNC,PORTI,const_porti 
      00AD9E CC 94                    1 	.word LINK 
                           003107     2 	LINK=.
      003107                          3 PORTI:
      00ADA0 35                       4 	.byte 5+F_IFUNC   	
      00ADA1 50 4F 52 54 49           5 	.ascii "PORTI"
      00ADA1 72 12                    6 	.word const_porti  
      00310F                       5105 	_dict_entry,5+F_IFUNC,PORTG,const_portg 
      00ADA3 50 C7                    1 	.word LINK 
                           003111     2 	LINK=.
      003111                          3 PORTG:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



      00ADA5 85                       4 	.byte 5+F_IFUNC   	
      00ADA6 5D 27 21 85 A6           5 	.ascii "PORTG"
      00ADAB 08 42                    6 	.word const_portg  
      003119                       5106 	_dict_entry,5+F_IFUNC,PORTF,const_portf
      00ADAD 9F C7                    1 	.word LINK 
                           00311B     2 	LINK=.
      00311B                          3 PORTF:
      00ADAF 52                       4 	.byte 5+F_IFUNC   	
      00ADB0 00 72 1A 50 14           5 	.ascii "PORTF"
      00ADB5 72 1A                    6 	.word const_portf  
      003123                       5107 	_dict_entry,5+F_IFUNC,PORTE,const_porte
      00ADB7 50 16                    1 	.word LINK 
                           003125     2 	LINK=.
      003125                          3 PORTE:
      00ADB9 72                       4 	.byte 5+F_IFUNC   	
      00ADBA 14 52 00 72 12           5 	.ascii "PORTE"
      00ADBF 52 01                    6 	.word const_porte  
      00312D                       5108 	_dict_entry,5+F_IFUNC,PORTD,const_portd
      00ADC1 72 10                    1 	.word LINK 
                           00312F     2 	LINK=.
      00312F                          3 PORTD:
      00ADC3 52                       4 	.byte 5+F_IFUNC   	
      00ADC4 01 72 1C 52 00           5 	.ascii "PORTD"
      00ADC9 81 04                    6 	.word const_portd  
      00ADCA                       5109 	_dict_entry,5+F_IFUNC,PORTC,const_portc
      00ADCA 5B 02                    1 	.word LINK 
                           003139     2 	LINK=.
      003139                          3 PORTC:
      00ADCC A6                       4 	.byte 5+F_IFUNC   	
      00ADCD 82 C4 52 03 A1           5 	.ascii "PORTC"
      00ADD2 02 26                    6 	.word const_portc  
      003141                       5110 	_dict_entry,5+F_IFUNC,PORTB,const_portb
      00ADD4 F7 72                    1 	.word LINK 
                           003143     2 	LINK=.
      003143                          3 PORTB:
      00ADD6 1D                       4 	.byte 5+F_IFUNC   	
      00ADD7 52 00 72 13 50           5 	.ascii "PORTB"
      00ADDC C7 72                    6 	.word const_portb  
      00314B                       5111 	_dict_entry,5+F_IFUNC,PORTA,const_porta 
      00ADDE 1B 50                    1 	.word LINK 
                           00314D     2 	LINK=.
      00314D                          3 PORTA:
      00ADE0 16                       4 	.byte 5+F_IFUNC   	
      00ADE1 81 4F 52 54 41           5 	.ascii "PORTA"
      00ADE2 2B F5                    6 	.word const_porta  
      003155                       5112 	_dict_entry 5,PRINT,cmd_print 
      00ADE2 A6 78                    1 	.word LINK 
                           003157     2 	LINK=.
      003157                          3 PRINT:
      00ADE4 C5                       4 	.byte 5   	
      00ADE5 52 03 27 04 72           5 	.ascii "PRINT"
      00ADEA 5F 52                    6 	.word cmd_print  
      00315F                       5113 	_dict_entry,4+F_IFUNC,POUT,const_output
      00ADEC 03 81                    1 	.word LINK 
                           003161     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



      00ADEE                          3 POUT:
      00ADEE 88                       4 	.byte 4+F_IFUNC   	
      00ADEF CD AD E2 84              5 	.ascii "POUT"
      00ADF3 72 03                    6 	.word const_output  
      003168                       5114 	_dict_entry,3+F_IFUNC,POP,xpop 
      00ADF5 52 03                    1 	.word LINK 
                           00316A     2 	LINK=.
      00316A                          3 POP:
      00ADF7 FB                       4 	.byte 3+F_IFUNC   	
      00ADF8 C7 52 04                 5 	.ascii "POP"
      00ADFB 72 01                    6 	.word xpop  
      003170                       5115 	_dict_entry,4,POKE,poke 
      00ADFD 52 03                    1 	.word LINK 
                           003172     2 	LINK=.
      003172                          3 POKE:
      00ADFF FB                       4 	.byte 4   	
      00AE00 C6 52 04 81              5 	.ascii "POKE"
      00AE04 1F 4D                    6 	.word poke  
      003179                       5116 	_dict_entry,5,PMODE,pin_mode 
      00AE04 A6 FF                    1 	.word LINK 
                           00317B     2 	LINK=.
      00317B                          3 PMODE:
      00AE06 72                       4 	.byte 5   	
      00AE07 01 52 03 E3 C6           5 	.ascii "PMODE"
      00AE0C 52 04                    6 	.word pin_mode  
      003183                       5117 	_dict_entry,4+F_IFUNC,PINP,const_input
      00AE0E 81 7B                    1 	.word LINK 
                           003185     2 	LINK=.
      00AE0F                          3 PINP:
      00AE0F CD                       4 	.byte 4+F_IFUNC   	
      00AE10 98 AC A1 84              5 	.ascii "PINP"
      00AE14 27 03                    6 	.word const_input  
      00318C                       5118 	_dict_entry,4+F_IFUNC,PICK,xpick 
      00AE16 CC 94                    1 	.word LINK 
                           00318E     2 	LINK=.
      00318E                          3 PICK:
      00AE18 35                       4 	.byte 4+F_IFUNC   	
      00AE19 50 49 43 4B              5 	.ascii "PICK"
      00AE19 9F CD                    6 	.word xpick  
      003195                       5119 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00AE1B AD EE                    1 	.word LINK 
                           003197     2 	LINK=.
      003197                          3 PEEK:
      00AE1D CD                       4 	.byte 4+F_IFUNC   	
      00AE1E 95 8F A1 08              5 	.ascii "PEEK"
      00AE22 26 02                    6 	.word peek  
      00319E                       5120 	_dict_entry,5,PAUSE,pause 
      00AE24 20 E9                    1 	.word LINK 
                           0031A0     2 	LINK=.
      0031A0                          3 PAUSE:
      00AE26 4D                       4 	.byte 5   	
      00AE27 27 05 55 00 04           5 	.ascii "PAUSE"
      00AE2C 00 02                    6 	.word pause  
      0031A8                       5121 	_dict_entry,3+F_IFUNC,PAD,pad_ref 
      00AE2E 81 A0                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal [24-Bits]



                           0031AA     2 	LINK=.
      00AE2F                          3 PAD:
      00AE2F CD                       4 	.byte 3+F_IFUNC   	
      00AE30 AE 04 5F                 5 	.ascii "PAD"
      00AE33 97 4F                    6 	.word pad_ref  
      0031B0                       5122 	_dict_entry,2+F_OR,OR,TK_OR ; OR operator 
      00AE35 81 AA                    1 	.word LINK 
                           0031B2     2 	LINK=.
      00AE36                          3 OR:
      00AE36 CD                       4 	.byte 2+F_OR   	
      00AE37 95 8F                    5 	.ascii "OR"
      00AE39 A1 84                    6 	.word TK_OR  
      0031B7                       5123 	_dict_entry,2,ON,cmd_on 
      00AE3B 27 03                    1 	.word LINK 
                           0031B9     2 	LINK=.
      0031B9                          3 ON:
      00AE3D CC                       4 	.byte 2   	
      00AE3E 94 35                    5 	.ascii "ON"
      00AE40 5D 27                    6 	.word cmd_on  
      0031BE                       5124 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00AE42 05 72                    1 	.word LINK 
                           0031C0     2 	LINK=.
      0031C0                          3 ODR:
      00AE44 1B                       4 	.byte 3+F_IFUNC   	
      00AE45 50 14 81                 5 	.ascii "ODR"
      00AE48 2C 1D                    6 	.word const_odr  
      0031C6                       5125 	_dict_entry,3+F_NOT,NOT,TK_NOT;NOT operator
      00AE48 72 1A                    1 	.word LINK 
                           0031C8     2 	LINK=.
      0031C8                          3 NOT:
      00AE4A 50                       4 	.byte 3+F_NOT   	
      00AE4B 14 81 54                 5 	.ascii "NOT"
      00AE4D 00 87                    6 	.word TK_NOT  
      0031CE                       5126 	_dict_entry,4,NEXT,next 
      00AE4D AE 16                    1 	.word LINK 
                           0031D0     2 	LINK=.
      0031D0                          3 NEXT:
      00AE4F B8                       4 	.byte 4   	
      00AE50 4F 81 58 54              5 	.ascii "NEXT"
      00AE52 20 64                    6 	.word next  
      0031D7                       5127 	_dict_entry,3,NEW,new
      00AE52 CD 99                    1 	.word LINK 
                           0031D9     2 	LINK=.
      0031D9                          3 NEW:
      00AE54 C5                       4 	.byte 3   	
      00AE55 81 45 57                 5 	.ascii "NEW"
      00AE56 24 D4                    6 	.word new  
      0031DF                       5128 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00AE56 90 F6                    1 	.word LINK 
                           0031E1     2 	LINK=.
      0031E1                          3 LSHIFT:
      00AE58 93                       4 	.byte 6+F_IFUNC   	
      00AE59 EE 01 72 A9 00 03        5 	.ascii "LSHIFT"
      00AE5F 81 F9                    6 	.word lshift  
      00AE60                       5129 	_dict_entry,4+F_IFUNC,LOG2,log2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 227.
Hexadecimal [24-Bits]



      00AE60 CD 98                    1 	.word LINK 
                           0031EC     2 	LINK=.
      0031EC                          3 LOG2:
      00AE62 AC                       4 	.byte 4+F_IFUNC   	
      00AE63 A1 84 27 03              5 	.ascii "LOG2"
      00AE67 CC 94                    6 	.word log2  
      0031F3                       5130 	_dict_entry 4,LIST,cmd_list
      00AE69 35 90                    1 	.word LINK 
                           0031F5     2 	LINK=.
      0031F5                          3 LIST:
      00AE6B F6                       4 	.byte 4   	
      00AE6C 93 EE 01 72              5 	.ascii "LIST"
      00AE70 A9 00                    6 	.word cmd_list  
      0031FC                       5131 	_dict_entry 3,LET,let 
      00AE72 03 4D                    1 	.word LINK 
                           0031FE     2 	LINK=.
      0031FE                          3 LET:
      00AE74 27                       4 	.byte 3   	
      00AE75 05 A6 0A                 5 	.ascii "LET"
      00AE78 CC 94                    6 	.word let  
      003204                       5132 	_dict_entry,3+F_CFUNC,KEY,key 
      00AE7A 37 A3                    1 	.word LINK 
                           003206     2 	LINK=.
      003206                          3 KEY:
      00AE7C 00                       4 	.byte 3+F_CFUNC   	
      00AE7D 14 22 F6                 5 	.ascii "KEY"
      00AE80 A6 03                    6 	.word key  
      00320C                       5133 	_dict_entry,7,IWDGREF,refresh_iwdg
      00AE82 42 CF                    1 	.word LINK 
                           00320E     2 	LINK=.
      00320E                          3 IWDGREF:
      00AE84 00                       4 	.byte 7   	
      00AE85 0E 72 B2 00 0E 90 A3     5 	.ascii "IWDGREF"
      00AE8C 17 38                    6 	.word refresh_iwdg  
      003218                       5134 	_dict_entry,6,IWDGEN,enable_iwdg
      00AE8E 22 05                    1 	.word LINK 
                           00321A     2 	LINK=.
      00321A                          3 IWDGEN:
      00AE90 A6                       4 	.byte 6   	
      00AE91 01 CC 94 37 45 4E        5 	.ascii "IWDGEN"
      00AE95 2B 19                    6 	.word enable_iwdg  
      003223                       5135 	_dict_entry,5,INPUT,input_var  
      00AE95 81 1A                    1 	.word LINK 
                           003225     2 	LINK=.
      00AE96                          3 INPUT:
      00AE96 CD                       4 	.byte 5   	
      00AE97 98 AC A1 84 27           5 	.ascii "INPUT"
      00AE9C 03 CC                    6 	.word input_var  
      00322D                       5136 	_dict_entry,2,IF,if 
      00AE9E 94 35                    1 	.word LINK 
                           00322F     2 	LINK=.
      00322F                          3 IF:
      00AEA0 90                       4 	.byte 2   	
      00AEA1 F6 93                    5 	.ascii "IF"
      00AEA3 EE 01                    6 	.word if  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
Hexadecimal [24-Bits]



      003234                       5137 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00AEA5 72 A9                    1 	.word LINK 
                           003236     2 	LINK=.
      003236                          3 IDR:
      00AEA7 00                       4 	.byte 3+F_IFUNC   	
      00AEA8 03 9F A4                 5 	.ascii "IDR"
      00AEAB 1F 5F                    6 	.word const_idr  
      00323C                       5138 	_dict_entry,3,HEX,hex_base
      00AEAD 97 A6                    1 	.word LINK 
                           00323E     2 	LINK=.
      00323E                          3 HEX:
      00AEAF 03                       4 	.byte 3   	
      00AEB0 42 CF 00                 5 	.ascii "HEX"
      00AEB3 0E 72                    6 	.word hex_base  
      003244                       5139 	_dict_entry,4,GOTO,goto 
      00AEB5 B9 00                    1 	.word LINK 
                           003246     2 	LINK=.
      003246                          3 GOTO:
      00AEB7 0E                       4 	.byte 4   	
      00AEB8 90 A3 17 73              5 	.ascii "GOTO"
      00AEBC 23 04                    6 	.word goto  
      00324D                       5140 	_dict_entry,5,GOSUB,gosub 
      00AEBE 90 AE                    1 	.word LINK 
                           00324F     2 	LINK=.
      00324F                          3 GOSUB:
      00AEC0 17                       4 	.byte 5   	
      00AEC1 73 81 53 55 42           5 	.ascii "GOSUB"
      00AEC3 21 E9                    6 	.word gosub  
      003257                       5141 	_dict_entry,3,GET,cmd_get 
      00AEC3 4D 26                    1 	.word LINK 
                           003259     2 	LINK=.
      003259                          3 GET:
      00AEC5 16                       4 	.byte 3   	
      00AEC6 A3 00 14                 5 	.ascii "GET"
      00AEC9 22 11                    6 	.word cmd_get  
      00325F                       5142 	_dict_entry,4+F_IFUNC,FREE,free
      00AECB A6 03                    1 	.word LINK 
                           003261     2 	LINK=.
      003261                          3 FREE:
      00AECD 42                       4 	.byte 4+F_IFUNC   	
      00AECE CF 00 0E 93              5 	.ascii "FREE"
      00AED2 72 BB                    6 	.word free  
      003268                       5143 	_dict_entry,3,FOR,for 
      00AED4 00 0E                    1 	.word LINK 
                           00326A     2 	LINK=.
      00326A                          3 FOR:
      00AED6 A3                       4 	.byte 3   	
      00AED7 17 73 24                 5 	.ascii "FOR"
      00AEDA 01 81                    6 	.word for  
      003270                       5144 	_dict_entry,4,FCPU,fcpu 
      00AEDC A6 0A                    1 	.word LINK 
                           003272     2 	LINK=.
      003272                          3 FCPU:
      00AEDE CC                       4 	.byte 4   	
      00AEDF 94 37 50 55              5 	.ascii "FCPU"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



      00AEE1 29 51                    6 	.word fcpu  
      003279                       5145 	_dict_entry,5,ERASE,cmd_erase 
      00AEE1 CD 97                    1 	.word LINK 
                           00327B     2 	LINK=.
      00327B                          3 ERASE:
      00AEE3 6A                       4 	.byte 5   	
      00AEE4 A1 02 27 03 CC           5 	.ascii "ERASE"
      00AEE9 94 35                    6 	.word cmd_erase  
      003283                       5146 	_dict_entry,3,END,cmd_end  
      00AEEB 90 F6                    1 	.word LINK 
                           003285     2 	LINK=.
      003285                          3 END:
      00AEED 93                       4 	.byte 3   	
      00AEEE EE 01 72                 5 	.ascii "END"
      00AEF1 A9 00                    6 	.word cmd_end  
      00328B                       5147 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00AEF3 03 89                    1 	.word LINK 
                           00328D     2 	LINK=.
      00328D                          3 EEPROM:
      00AEF5 88                       4 	.byte 6+F_IFUNC   	
      00AEF6 90 F6 93 EE 01 72        5 	.ascii "EEPROM"
      00AEFC A9 00                    6 	.word const_eeprom_base  
      003296                       5148 	_dict_entry,6+F_IFUNC,EEFREE,func_eefree 
      00AEFE 03 CD                    1 	.word LINK 
                           003298     2 	LINK=.
      003298                          3 EEFREE:
      00AF00 AE                       4 	.byte 6+F_IFUNC   	
      00AF01 C3 CF 00 1A 84 85        5 	.ascii "EEFREE"
      00AF07 72 C7                    6 	.word func_eefree  
      0032A1                       5149 	_dict_entry,4,EDIT,cmd_edit 
      00AF09 00 1A                    1 	.word LINK 
                           0032A3     2 	LINK=.
      0032A3                          3 EDIT:
      00AF0B 72                       4 	.byte 4   	
      00AF0C 5C 00 1B 72              5 	.ascii "EDIT"
      00AF10 CF 00                    6 	.word cmd_edit  
      0032AA                       5150 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00AF12 1A 81                    1 	.word LINK 
                           0032AC     2 	LINK=.
      00AF14                          3 DWRITE:
      00AF14 CD                       4 	.byte 6+F_CMD   	
      00AF15 97 65 A1 01 27 03        5 	.ascii "DWRITE"
      00AF1B CC 94                    6 	.word digital_write  
      0032B5                       5151 	_dict_entry,4,DROP,xdrop ; drop n element from xtack 
      00AF1D 35 90                    1 	.word LINK 
                           0032B7     2 	LINK=.
      0032B7                          3 DROP:
      00AF1F F6                       4 	.byte 4   	
      00AF20 93 EE 01 72              5 	.ascii "DROP"
      00AF24 A9 00                    6 	.word xdrop  
      0032BE                       5152 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00AF26 03 CD                    1 	.word LINK 
                           0032C0     2 	LINK=.
      0032C0                          3 DREAD:
      00AF28 AE                       4 	.byte 5+F_IFUNC   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
Hexadecimal [24-Bits]



      00AF29 C3 F6 EE 01 81           5 	.ascii "DREAD"
      00AF2E 24 07                    6 	.word digital_read  
      0032C8                       5153 	_dict_entry,2,DO,do_loop
      00AF2E CD 97                    1 	.word LINK 
                           0032CA     2 	LINK=.
      0032CA                          3 DO:
      00AF30 42                       4 	.byte 2   	
      00AF31 CD 95                    5 	.ascii "DO"
      00AF33 8F A1                    6 	.word do_loop  
      0032CF                       5154 	_dict_entry,3,DIR,cmd_dir
      00AF35 03 27                    1 	.word LINK 
                           0032D1     2 	LINK=.
      0032D1                          3 DIR:
      00AF37 19                       4 	.byte 3   	
      00AF38 A1 04 26                 5 	.ascii "DIR"
      00AF3B 12 F6                    6 	.word cmd_dir  
      0032D7                       5155 	_dict_entry,3,DIM,cmd_dim 
      00AF3D 72 5C                    1 	.word LINK 
                           0032D9     2 	LINK=.
      0032D9                          3 DIM:
      00AF3F 00                       4 	.byte 3   	
      00AF40 02 A4 DF                 5 	.ascii "DIM"
      00AF43 A1 43                    6 	.word cmd_dim  
      0032DF                       5156 	_dict_entry,3,DEC,dec_base
      00AF45 26 07                    1 	.word LINK 
                           0032E1     2 	LINK=.
      0032E1                          3 DEC:
      00AF47 AE                       4 	.byte 3   	
      00AF48 40 00 CD                 5 	.ascii "DEC"
      00AF4B A6 8F                    6 	.word dec_base  
      0032E7                       5157 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00AF4D 81 CC                    1 	.word LINK 
                           0032E9     2 	LINK=.
      0032E9                          3 DDR:
      00AF4F 94                       4 	.byte 3+F_IFUNC   	
      00AF50 35 89 CD                 5 	.ascii "DDR"
      00AF53 95 A8                    6 	.word const_ddr  
      0032EF                       5158 	_dict_entry,4,DATA,data  
      00AF55 85 CD                    1 	.word LINK 
                           0032F1     2 	LINK=.
      0032F1                          3 DATA:
      00AF57 AF                       4 	.byte 4   	
      00AF58 87 26 05 A6              5 	.ascii "DATA"
      00AF5C 0A CC                    6 	.word data  
      0032F8                       5159 	_dict_entry,3+F_IFUNC,CR2,const_cr2 
      00AF5E 94 37                    1 	.word LINK 
                           0032FA     2 	LINK=.
      0032FA                          3 CR2:
      00AF60 89                       4 	.byte 3+F_IFUNC   	
      00AF61 72 5F 00                 5 	.ascii "CR2"
      00AF64 19 AE                    6 	.word const_cr2  
      003300                       5160 	_dict_entry,3+F_IFUNC,CR1,const_cr1 
      00AF66 40 00                    1 	.word LINK 
                           003302     2 	LINK=.
      003302                          3 CR1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 231.
Hexadecimal [24-Bits]



      00AF68 CF                       4 	.byte 3+F_IFUNC   	
      00AF69 00 1A C6                 5 	.ascii "CR1"
      00AF6C AF 85                    6 	.word const_cr1  
      003308                       5161 	_dict_entry,5,CONST,cmd_const 
      00AF6E 5F CD                    1 	.word LINK 
                           00330A     2 	LINK=.
      00330A                          3 CONST:
      00AF70 85                       4 	.byte 5   	
      00AF71 31 C6 AF 86 CD           5 	.ascii "CONST"
      00AF76 85 31                    6 	.word cmd_const  
      003312                       5162 	_dict_entry,4+F_CFUNC,CHAR,func_char
      00AF78 7B 01                    1 	.word LINK 
                           003314     2 	LINK=.
      003314                          3 CHAR:
      00AF7A CD                       4 	.byte 4+F_CFUNC   	
      00AF7B 85 31 7B 02              5 	.ascii "CHAR"
      00AF7F CD 85                    6 	.word func_char  
      00331B                       5163 	_dict_entry,5,CHAIN,cmd_chain
      00AF81 31 5B                    1 	.word LINK 
                           00331D     2 	LINK=.
      00331D                          3 CHAIN:
      00AF83 02                       4 	.byte 5   	
      00AF84 81 41 52 49 4E           5 	.ascii "CHAIN"
      00AF87 2F 41                    6 	.word cmd_chain  
      003325                       5164 	_dict_entry,3,BYE,bye 
      00AF87 90 89                    1 	.word LINK 
                           003327     2 	LINK=.
      003327                          3 BYE:
      00AF89 52                       4 	.byte 3   	
      00AF8A 06 1F 03                 5 	.ascii "BYE"
      00AF8D CD A8                    6 	.word bye  
      00332D                       5165 	_dict_entry,5,BTOGL,bit_toggle
      00AF8F 8D 1F                    1 	.word LINK 
                           00332F     2 	LINK=.
      00332F                          3 BTOGL:
      00AF91 05                       4 	.byte 5   	
      00AF92 AE B4 80 1F 01           5 	.ascii "BTOGL"
      00AF97 4F CD                    6 	.word bit_toggle  
      003337                       5166 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00AF99 A2 9B                    1 	.word LINK 
                           003339     2 	LINK=.
      003339                          3 BTEST:
      00AF9B 26                       4 	.byte 5+F_IFUNC   	
      00AF9C 10 1C 00 07 F6           5 	.ascii "BTEST"
      00AFA1 A1 03                    6 	.word bit_test  
      003341                       5167 	_dict_entry,4,BSET,bit_set 
      00AFA3 26 08                    1 	.word LINK 
                           003343     2 	LINK=.
      003343                          3 BSET:
      00AFA5 5C                       4 	.byte 4   	
      00AFA6 16 03 CD 91              5 	.ascii "BSET"
      00AFAA 3C 26                    6 	.word bit_set  
      00334A                       5168 	_dict_entry,4,BRES,bit_reset
      00AFAC 0A 43                    1 	.word LINK 
                           00334C     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
Hexadecimal [24-Bits]



      00AFAD                          3 BRES:
      00AFAD CD                       4 	.byte 4   	
      00AFAE A7 56 13 05              5 	.ascii "BRES"
      00AFB2 25 E1                    6 	.word bit_reset  
      003353                       5169 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00AFB4 5F 20                    1 	.word LINK 
                           003355     2 	LINK=.
      003355                          3 BIT:
      00AFB6 05                       4 	.byte 3+F_IFUNC   	
      00AFB7 42 49 54                 5 	.ascii "BIT"
      00AFB7 1E 01                    6 	.word bitmask  
      00335B                       5170 	_dict_entry,3,AWU,awu 
      00AFB9 1C 00                    1 	.word LINK 
                           00335D     2 	LINK=.
      00335D                          3 AWU:
      00AFBB 04                       4 	.byte 3   	
      00AFBC 41 57 55                 5 	.ascii "AWU"
      00AFBC 5B 06                    6 	.word awu  
      003363                       5171 	_dict_entry,7,AUTORUN,cmd_auto_run
      00AFBE 90 85                    1 	.word LINK 
                           003365     2 	LINK=.
      003365                          3 AUTORUN:
      00AFC0 81                       4 	.byte 7   	
      00AFC1 41 55 54 4F 52 55 4E     5 	.ascii "AUTORUN"
      00AFC1 85 52                    6 	.word cmd_auto_run  
      00336F                       5172 	_dict_entry,3+F_IFUNC,ASC,ascii
      00AFC3 0C 89                    1 	.word LINK 
                           003371     2 	LINK=.
      003371                          3 ASC:
      00AFC5 0F                       4 	.byte 3+F_IFUNC   	
      00AFC6 03 0F 04                 5 	.ascii "ASC"
      00AFC9 A6 03                    6 	.word ascii  
      003377                       5173 	_dict_entry,3+F_AND,AND,TK_AND ; AND operator 
      00AFCB CD 97                    1 	.word LINK 
                           003379     2 	LINK=.
      003379                          3 AND:
      00AFCD 58                       4 	.byte 3+F_AND   	
      00AFCE 89 CD 95                 5 	.ascii "AND"
      00AFD1 A8 85                    6 	.word TK_AND  
      00337F                       5174 	_dict_entry,5,ALLOC,xalloc ; allocate space on xtack 
      00AFD3 CD AF                    1 	.word LINK 
                           003381     2 	LINK=.
      003381                          3 ALLOC:
      00AFD5 87                       4 	.byte 5   	
      00AFD6 5D 26 05 A6 0A           5 	.ascii "ALLOC"
      00AFDB CC 94                    6 	.word xalloc  
      003389                       5175 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00AFDD 37 1F                    1 	.word LINK 
                           00338B     2 	LINK=.
      00338B                          3 ADCREAD:
      00AFDF 05                       4 	.byte 7+F_IFUNC   	
      00AFE0 CD 95 8F A1 08 26 0C     5 	.ascii "ADCREAD"
      00AFE7 A6 84                    6 	.word analog_read  
      003395                       5176 	_dict_entry,5,ADCON,power_adc 
      00AFE9 CD 97                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 233.
Hexadecimal [24-Bits]



                           003397     2 	LINK=.
      003397                          3 ADCON:
      00AFEB 58                       4 	.byte 5   	
      00AFEC CD 95 C1 1F 03           5 	.ascii "ADCON"
      00AFF1 20 05                    6 	.word power_adc  
      00339F                       5177 kword_dict::
      00339F                       5178 	_dict_entry,3+F_IFUNC,ABS,abs
      00AFF3 55 00                    1 	.word LINK 
                           0033A1     2 	LINK=.
      0033A1                          3 ABS:
      00AFF5 04                       4 	.byte 3+F_IFUNC   	
      00AFF6 00 02 53                 5 	.ascii "ABS"
      00AFF8 28 E2                    6 	.word abs  
                                   5179 
                                   5180 
                                   5181 
                                   5182 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 234.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 236.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
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
      00AFF8 CE 00                   31 app_sign:  .word 0 ; .ascii "BC"  ; signature 
      00AFFA 05 1F                   32 app_size: .word 0 
      003404                         33 app: 
                                     34 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   4 ABS        0033A1 R   |     ACK     =  000006 
  4 ADCON      003397 R   |   4 ADCREAD    00338B R   |     ADC_CR1 =  005401 
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
    AFR7_BEE=  000007     |   4 ALLOC      003381 R   |   4 AND        003379 R
    ARG_OFS =  000002     |     ARROW_LE=  000080     |     ARROW_RI=  000081 
  4 AR_SIGN    002F05 R   |   4 ASC        003371 R   |     ATMP    =  000001 
    ATTRIB  =  000002     |   4 AUTORUN    003365 R   |   4 AUTO_RUN   00015C R
  4 AWU        00335D R   |   4 AWUHandl   000004 R   |     AWU_APR =  0050F1 
    AWU_CSR =  0050F0     |     AWU_CSR_=  000004     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
    BASE    =  000002     |     BASE_SAV=  000001     |     BCNT    =  000001 
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |     BELL    =  000007     |     BINARY  =  000001 
  4 BIT        003355 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
    BLOCKS  =  000005     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  00000D     |   4 BRES       00334C R
    BS      =  000008     |   4 BSET       003343 R   |     BSIZE   =  000006 
  4 BTEST      003339 R   |   4 BTOGL      00332F R   |     BTW     =  000001 
  4 BYE        003327 R   |     C       =  000001     |     CAN     =  000018 
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
    CC_Z    =  000001     |     CELL_SIZ=  000003     |     CFG_GCR =  007F60 
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   4 CHAIN      00331D R
    CHAIN_AD=  000005     |     CHAIN_BP=  000007     |     CHAIN_CN=  000008 
    CHAIN_CO=  00000A     |     CHAIN_IN=  000009     |     CHAIN_LN=  000003 
    CHAIN_TX=  00000B     |     CHAIN_TX=  00000D     |   4 CHAR       003314 R
    CLKOPT  =  004807     |     CLKOPT_C=  000002     |     CLKOPT_E=  000003 
    CLKOPT_P=  000000     |     CLKOPT_P=  000001     |     CLK_CCOR=  0050C9 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 240.
Hexadecimal [24-Bits]

Symbol Table

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
    CLK_SWR_=  0000B4     |     CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2 
    CMD_END =  000002     |     CNT     =  000006     |     CNTR    =  000004 
    CNT_LO  =  000004     |     CODE_ADD=  000001     |     COLON   =  00003A 
    COMMA   =  00002C     |   4 CONST      00330A R   |     COUNT   =  000003 
    CPOS    =  000003     |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
    CR      =  00000D     |   4 CR1        003302 R   |   4 CR2        0032FA R
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
    CURR    =  000002     |     CVAR    =  000009     |     CX_BPTR =  000001 
    CX_CNT  =  000004     |     CX_IN   =  000003     |   4 DATA       0032F1 R
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   4 DDR        0032E9 R   |     DEBUG   =  000000 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   4 DEC        0032E1 R
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  4 DIM        0032D9 R   |   4 DIR        0032D1 R   |     DISCARD =  000004 
    DIVISOR =  000001     |     DIVSOR  =  000001     |     DLE     =  000010 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   4 DO         0032CA R
    DOLP_ADR=  000003     |     DOLP_INW=  000005     |   4 DREAD      0032C0 R
  4 DROP       0032B7 R   |   4 DWRITE     0032AC R   |   4 EDIT       0032A3 R
  4 EEFREE     003298 R   |   4 EEPROM     00328D R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_S=  000800     |     EM      =  000019 
  4 END        003285 R   |     ENQ     =  000005     |     EOF     =  0000FF 
    EOT     =  000004     |   4 ERASE      00327B R   |   4 ERASED     0026C9 R
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
Hexadecimal [24-Bits]

Symbol Table

    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_NO_P=  000012 
    ERR_OVER=  000010     |     ERR_RD_O=  000011     |     ERR_RUN_=  000006 
    ERR_SYNT=  000002     |     ESC     =  00001B     |     ETB     =  000017 
    ETX     =  000003     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
    FBREAK  =  000004     |     FCOMP   =  000005     |   4 FCPU       003272 R
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
    FLASH_IA=  000000     |   4 FLASH_ME   001BD5 R   |     FLASH_NC=  00505C 
    FLASH_NF=  00505E     |     FLASH_NF=  000000     |     FLASH_NF=  000001 
    FLASH_NF=  000002     |     FLASH_NF=  000003     |     FLASH_NF=  000004 
    FLASH_NF=  000005     |     FLASH_PU=  005062     |     FLASH_PU=  000056 
    FLASH_PU=  0000AE     |     FLASH_SI=  020000     |     FLASH_WS=  00480D 
    FLN_REJE=  000006     |     FLOOP   =  000002     |     FLSI    =  01F400 
  4 FOR        00326A R   |   4 FREE       003261 R   |     FRUN    =  000000 
    FS      =  00001C     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_AND   =  000080     |     F_CFUNC =  000020 
    F_CMD   =  000000     |     F_CONST =  000030     |     F_IFUNC =  000010 
    F_NOT   =  000070     |     F_OR    =  000090     |     F_XOR   =  0000A0 
  4 GET        003259 R   |   4 GOSUB      00324F R   |   4 GOTO       003246 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |     GS      =  00001D     |   4 HEX        00323E R
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
    I2C_READ=  000001     |     I2C_SR1 =  005217     |     I2C_SR1_=  000003 
    I2C_SR1_=  000001     |     I2C_SR1_=  000002     |     I2C_SR1_=  000006 
    I2C_SR1_=  000000     |     I2C_SR1_=  000004     |     I2C_SR1_=  000007 
    I2C_SR2 =  005218     |     I2C_SR2_=  000002     |     I2C_SR2_=  000001 
    I2C_SR2_=  000000     |     I2C_SR2_=  000003     |     I2C_SR2_=  000005 
    I2C_SR3 =  005219     |     I2C_SR3_=  000001     |     I2C_SR3_=  000007 
    I2C_SR3_=  000004     |     I2C_SR3_=  000000     |     I2C_SR3_=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Symbol Table

    I2C_TRIS=  00521D     |     I2C_TRIS=  000005     |     I2C_TRIS=  000005 
    I2C_TRIS=  000005     |     I2C_TRIS=  000011     |     I2C_TRIS=  000011 
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   4 IDR        003236 R
  4 IF         00322F R   |     IN      =  000005     |     INCR    =  000001 
    INP     =  000000     |   4 INPUT      003225 R   |     INPUT_DI=  000000 
    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_PU=  000001 
    INT24   =  000005     |     INT_ADC2=  000016     |     INT_AUAR=  000012 
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
    INT_VECT=  00805C     |     INT_VECT=  008058     |     INW     =  00000B 
    IPOS    =  000001     |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
  4 IWDGEN     00321A R   |   4 IWDGREF    00320E R   |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |     KCHAR   =  000002 
  4 KEY        003206 R   |     KEY_END =  000083     |     KW_TYPE_=  0000F0 
    LAST    =  000003     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000002 
  4 LET        0031FE R   |     LF      =  00000A     |     LIMIT   =  000005 
    LINENO  =  000005     |   4 LINES_RE   001CA3 R   |   4 LINK    =  0033A1 R
  4 LIST       0031F5 R   |     LL      =  000001     |     LLEN    =  000002 
    LL_HB   =  000001     |     LN_PTR  =  000005     |   4 LOG2       0031EC R
  4 LSHIFT     0031E1 R   |     MAJOR   =  000002     |     MASK    =  000002 
    MAX_LINE=  007FFF     |     MINOR   =  000000     |     MULOP   =  000001 
    N1      =  000005     |     NAFR    =  004804     |     NAK     =  000015 
    NAMEPTR =  000001     |     NAME_MAX=  00000F     |     NCLKOPT =  004808 
    NEG     =  000001     |   4 NEW        0031D9 R   |   4 NEXT       0031D0 R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NLEN    =  000001 
    NLEN_MAS=  00000F     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  4 NOT        0031C8 R   |     NOT_OP  =  000001     |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   4 NonHandl   000000 R
  4 ODR        0031C0 R   |   4 ON         0031B9 R   |     ONOFF   =  000003 
    OP      =  000002     |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   4 OR         0031B2 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 243.
Hexadecimal [24-Bits]

Symbol Table

    OUTP    =  000001     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVRWR   =  000004 
    PA      =  000000     |   4 PAD        0031AA R   |     PAD_SIZE=  000080 
  4 PAUSE      0031A0 R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |     PD_BASE =  00500F     |     PD_CR1  =  005012 
    PD_CR2  =  005013     |     PD_DDR  =  005011     |     PD_IDR  =  005010 
    PD_ODR  =  00500F     |     PE      =  000014     |   4 PEEK       003197 R
    PE_BASE =  005014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_BASE =  005019     |     PF_CR1  =  00501C 
    PF_CR2  =  00501D     |     PF_DDR  =  00501B     |     PF_IDR  =  00501A 
    PF_ODR  =  005019     |     PG      =  00001E     |     PG_BASE =  00501E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |     PG_SIZE =  000001 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |   4 PICK       00318E R
    PINNO   =  000001     |   4 PINP       003185 R   |     PINVAL  =  000002 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  4 PMODE      00317B R   |     PNAME   =  000003     |   4 POKE       003172 R
  4 POP        00316A R   |   4 PORTA      00314D R   |   4 PORTB      003143 R
  4 PORTC      003139 R   |   4 PORTD      00312F R   |   4 PORTE      003125 R
  4 PORTF      00311B R   |   4 PORTG      003111 R   |   4 PORTI      003107 R
  4 POUT       003161 R   |     PREV    =  000001     |     PRG_SIZE=  000003 
  4 PRINT      003157 R   |     PROD    =  000001     |     PROD_SIG=  000004 
  4 PROG_ADD   001BAB R   |   4 PROG_SIZ   001BBD R   |     PSTR    =  000003 
  4 PUSH       0030FE R   |   4 PUT        0030F6 R   |   4 QKEY       0030ED R
    QSIGN   =  000005     |     RAM_BASE=  000000     |     RAM_END =  0017FF 
  4 RAM_MEM    001BE6 R   |     RAM_SIZE=  001800     |   4 READ       0030E4 R
  4 REBOOT     0030D9 R   |     RECLEN  =  000005     |     REC_LEN =  000003 
    REC_XTRA=  000005     |     RELOP   =  000001     |   4 REM        0030D1 R
  4 RESTORE    0030C5 R   |     RETL1   =  000001     |   4 RETURN     0030BA R
    RET_ADDR=  000001     |     RET_BPTR=  000003     |     RET_INW =  000005 
  4 RND        0030B2 R   |     RONLY   =  000005     |     ROP     =  004800 
    RS      =  00001E     |   4 RSHIFT     0030A7 R   |     RSIGN   =  000006 
    RST_SR  =  0050B3     |   4 RUN        00309F R   |     RXCHAR  =  000001 
    RX_QUEUE=  000008     |   4 SAVE       003096 R   |     SEMIC   =  00003B 
    SEMICOL =  000001     |     SEPARATE=  000000     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |     SI      =  00000F 
    SIGN    =  000001     |   4 SIGNATUR   0026C7 R   |   4 SIZE       00308D R
    SKIP    =  000005     |   4 SLEEP      003083 R   |     SLEN    =  000002 
    SO      =  00000E     |     SOH     =  000001     |     SPACE   =  000020 
  4 SPIEN      003079 R   |   4 SPIRD      00306F R   |   4 SPISEL     003064 R
  4 SPIWR      00305A R   |     SPI_CR1 =  005200     |     SPI_CR1_=  000003 
    SPI_CR1_=  000000     |     SPI_CR1_=  000001     |     SPI_CR1_=  000007 
    SPI_CR1_=  000002     |     SPI_CR1_=  000006     |     SPI_CR2 =  005201 
    SPI_CR2_=  000007     |     SPI_CR2_=  000006     |     SPI_CR2_=  000005 
    SPI_CR2_=  000004     |     SPI_CR2_=  000002     |     SPI_CR2_=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 244.
Hexadecimal [24-Bits]

Symbol Table

    SPI_CR2_=  000001     |     SPI_CRCP=  005205     |     SPI_CS_B=  000005 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_SR_B=  000007     |     SPI_SR_C=  000004 
    SPI_SR_M=  000005     |     SPI_SR_O=  000006     |     SPI_SR_R=  000000 
    SPI_SR_T=  000001     |     SPI_SR_W=  000003     |     SPI_TXCR=  005207 
    SRC     =  000003     |     STACK_EM=  0017FF     |     STACK_SI=  00008C 
  4 STEP       003051 R   |   4 STOP       003048 R   |     STR     =  000002 
  4 STR_BYTE   001BCE R   |     STX     =  000002     |     SUB     =  00001A 
    SUP     =  000084     |     SWIM_CSR=  007F80     |     SYN     =  000016 
  4 SysCall    000012 R   |     TAB     =  000009     |     TAB_WIDT=  000004 
    TCHAR   =  000001     |     TEMP    =  000003     |     TIB_SIZE=  000050 
    TICK    =  000027     |   4 TICKS      00303E R   |     TIM1_ARR=  005262 
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
    TIM1_SR1=  000001     |     TIM1_SR1=  000002     |     TIM1_SR1=  000003 
    TIM1_SR1=  000004     |     TIM1_SR1=  000005     |     TIM1_SR1=  000006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 245.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_PSC=  000003     |     TIM4_PSC=  000000     |     TIM4_PSC=  000001 
    TIM4_PSC=  000002     |     TIM4_SR =  005342     |     TIM4_SR_=  000000 
  4 TIMEOUT    003032 R   |   4 TIMER      003028 R   |     TIM_CR1_=  000007 
    TIM_CR1_=  000000     |     TIM_CR1_=  000006     |     TIM_CR1_=  000005 
    TIM_CR1_=  000004     |     TIM_CR1_=  000003     |     TIM_CR1_=  000001 
    TIM_CR1_=  000002     |     TK_AND  =  000088     |     TK_ARRAY=  000005 
    TK_CFUNC=  000082     |     TK_CHAR =  000004     |     TK_CMD  =  000080 
    TK_COLON=  000009     |     TK_COMMA=  000008     |     TK_CONST=  000083 
    TK_DIV  =  000021     |     TK_EQUAL=  000032     |     TK_FLOAT=  000086 
    TK_GE   =  000033     |     TK_GRP_A=  000010     |     TK_GRP_M=  000030 
    TK_GRP_M=  000000     |     TK_GRP_M=  000020     |     TK_GRP_R=  000030 
    TK_GT   =  000031     |     TK_IFUNC=  000081     |     TK_INTGR=  000084 
    TK_LABEL=  000003     |     TK_LE   =  000036     |     TK_LPARE=  000006 
    TK_LT   =  000034     |     TK_MINUS=  000011     |     TK_MOD  =  000022 
    TK_MULT =  000020     |     TK_NE   =  000035     |     TK_NONE =  000000 
    TK_NOT  =  000087     |     TK_OR   =  000089     |     TK_PLUS =  000010 
    TK_QSTR =  000002     |     TK_RPARE=  000007     |     TK_SEMIC=  00000A 
    TK_VAR  =  000085     |     TK_XOR  =  00008A     |   4 TO         003021 R
  4 TONE       003018 R   |     TOWRITE =  000005     |   4 Timer4Up   000013 R
    U8      =  000001     |     UART1   =  000000     |     UART1_BA=  005230 
    UART1_BR=  005232     |     UART1_BR=  005233     |     UART1_CR=  005234 
    UART1_CR=  005235     |     UART1_CR=  005236     |     UART1_CR=  005237 
    UART1_CR=  005238     |     UART1_DR=  005231     |     UART1_GT=  005239 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 246.
Hexadecimal [24-Bits]

Symbol Table

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
    UBC     =  004801     |   4 UBOUND     00300D R   |   4 UBTN_Han   00005A R
  4 UFLASH     003002 R   |   4 UNTIL      002FF8 R   |     US      =  00001F 
  4 USER_ABO   000062 R   |   4 USR        002FF0 R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |   4 Uart1RxH   0005A2 R
  4 UserButt   000036 R   |     VAR_NAME=  000001     |     VSIZE   =  00000C 
    VT      =  00000B     |   4 WAIT       002FE7 R   |     WCNT    =  000003 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |     WIDTH   =  000001 
    WLEN    =  000001     |     WLKPTR  =  000001     |   4 WORDS      002FDD R
  4 WRITE      002FD3 R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XFIRST  =  000001     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   4 XOR        002FCB R   |     XSAVE   =  000002 
    XSTACK_E=  001773     |     XSTACK_S=  000014     |     XTEMP   =  000001 
    YSAVE   =  000007     |     YTEMP   =  000005     |   4 abs        0028E2 R
  4 abs24      0001F3 R   |   5 acc16      00000D GR  |   5 acc24      00000C GR
  5 acc32      00000B GR  |   5 acc8       00000E GR  |   4 accept_c   0008ED R
  4 add24      00017E R   |   4 add_char   00105D R   |   4 add_spac   000E63 R
  4 analog_r   0023CB R   |   4 and_cond   0018F3 R   |   4 and_fact   0018C3 R
  4 app        003404 R   |   4 app_sign   003400 R   |   4 app_size   003402 R
  4 app_spac   003400 GR  |   4 arduino_   0029CF R   |   4 arg_list   0016EA R
  5 array_si   000020 R   |   4 ascii      0027BD R   |   4 at_tst     000CD5 R
  4 atoi24     0015F6 GR  |   4 atoi_exi   001665 R   |   4 awu        002889 R
  4 awu02      00289C R   |   5 base       00000A GR  |   5 basicptr   000004 GR
  4 beep       002342 R   |   4 beep_1kh   002315 GR  |   4 bin_exit   000B3C R
  4 bit_rese   001ED1 R   |   4 bit_set    001EAF R   |   4 bit_test   001F16 R
  4 bit_togg   001EF4 R   |   4 bitmask    002B89 R   |   4 bkslsh_t   000C82 R
  4 bksp       00068C R   |   2 block_bu   0016B8 GR  |   4 block_er   00048B R
  4 break_po   0024B6 R   |   4 bye        002855 R   |   5 chain_le   000033 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 247.
Hexadecimal [24-Bits]

Symbol Table

  4 clear_au   0005D9 R   |   4 clear_ba   0011C1 R   |   4 clear_bl   0025C7 R
  4 clear_va   001121 R   |   4 clock_in   00007D R   |   4 cmd_auto   002EAE R
  4 cmd_chai   002F41 R   |   4 cmd_cons   001AC8 R   |   4 cmd_dim    001AD5 R
  4 cmd_dim1   001AD8 R   |   4 cmd_dim2   001ADE R   |   4 cmd_dir    0026EE R
  4 cmd_edit   001CCC R   |   4 cmd_end    0022BC R   |   4 cmd_eras   002534 R
  4 cmd_get    0022E8 R   |   4 cmd_line   001437 R   |   4 cmd_line   0016C2 R
  4 cmd_list   001BF5 R   |   4 cmd_name   00107D R   |   4 cmd_on     00214B R
  4 cmd_prin   001D31 R   |   4 cmd_run    00222C R   |   4 cmd_save   002629 R
  4 cmd_size   0019CC R   |   4 cold_sta   0000B5 R   |   4 colon_ts   000CA9 R
  4 comma_ts   000CB4 R   |   4 comp_msg   001394 R   |   4 compile    000DCF GR
  4 conditio   001945 R   |   4 const_cr   002C2C R   |   4 const_cr   002C31 R
  4 const_dd   002C27 R   |   4 const_ee   002C40 R   |   4 const_id   002C22 R
  4 const_in   002C3B R   |   4 const_od   002C1D R   |   4 const_ou   002C36 R
  4 const_po   002BF5 R   |   4 const_po   002BFA R   |   4 const_po   002BFF R
  4 const_po   002C04 R   |   4 const_po   002C09 R   |   4 const_po   002C0E R
  4 const_po   002C13 R   |   4 const_po   002C18 R   |   4 convert_   000AA8 R
  4 convert_   000650 R   |   4 copy_com   000D0A R   |   5 count      000002 GR
  4 cp24       0001B8 R   |   4 cp24_ax    0001EA R   |   4 cp_loop    001685 R
  4 cpl24      0001FA R   |   4 cpy_cmd_   000E4B R   |   4 cpy_quot   000E94 R
  4 cs_high    002DC8 R   |   4 dash_tst   000CCA R   |   4 data       002C45 R
  4 data_err   002CC1 R   |   5 data_len   000009 R   |   5 data_ofs   000008 R
  5 data_ptr   000006 R   |   4 dec_base   0019BE R   |   4 decomp_l   000F21 R
  4 decompil   000EE4 GR  |   4 del_line   000996 R   |   4 delete_l   000779 R
  4 delete_n   00069C R   |   4 delete_u   00073E R   |   4 digital_   002407 R
  4 digital_   00243E R   |   4 div24      000307 R   |   4 divu24_8   0002E9 R
  4 do_loop    002BAF R   |   4 do_progr   00047E R   |   4 dup24      00016F R
  5 dvar_bgn   00002F GR  |   5 dvar_end   000031 GR  |   4 enable_i   002B19 R
  4 end_at_l   001C4E R   |   4 eql_tst    000D55 R   |   4 equal      001070 R
  4 erase_ex   0004AF R   |   4 erase_fl   0004A5 R   |   4 erase_he   00260F R
  4 erase_pr   0024DF R   |   4 err_bad_   0012BD R   |   4 err_buf_   001333 R
  4 err_cmd_   001281 R   |   4 err_div0   001246 R   |   4 err_dupl   00129B R
  4 err_math   00122D R   |   4 err_mem_   001208 R   |   4 err_msg    0011E2 R
  4 err_no_a   0012C9 R   |   4 err_no_d   0012FC R   |   4 err_no_f   001320 R
  4 err_no_l   001255 R   |   4 err_no_p   00130C R   |   4 err_not_   0012AC R
  4 err_not_   001366 R   |   4 err_over   001340 R   |   4 err_read   00134A R
  4 err_run_   00126B R   |   4 err_synt   00121F R   |   4 escaped    000ABD GR
  4 expect     0016D8 R   |   4 expressi   00182C R   |   4 factor     001734 R
  5 farptr     000018 R   |   4 fcpu       002951 R   |   4 fill_wri   0025B7 R
  4 final_te   0008E6 R   |   5 flags      000022 GR  |   4 for        001FAC R
  4 free       0019C3 R   |   5 free_eep   000023 R   |   7 free_ram   000090 R
  4 func_arg   0016E5 R   |   4 func_cha   0027A6 R   |   4 func_eef   001A58 R
  4 ge         001072 R   |   4 get_addr   001537 R   |   4 get_arra   001706 R
  4 get_char   001551 R   |   4 get_esca   00065C R   |   4 get_int2   001541 R
  4 get_targ   0020D9 R   |   4 get_targ   0020E7 R   |   4 get_tick   0028DB R
  4 get_toke   000C1B GR  |   4 get_valu   001A47 R   |   4 getc       000635 GR
  4 gosub      0021E9 R   |   4 gosub_1    0021EC R   |   4 gosub_2    0021F2 R
  4 goto       0021D6 R   |   4 goto_1     0021D9 R   |   4 gt         00106E R
  4 gt_tst     000D60 R   |   4 hex_base   0019B9 R   |   4 if         001F8F R
  5 in         000001 GR  |   5 in.saved   000003 GR  |   5 in.w       000000 GR
  4 incr_far   000586 R   |   4 input_ex   001E67 R   |   4 input_lo   001DD1 R
  4 input_va   001DCD R   |   4 insert_c   0006FB R   |   4 insert_l   000A02 R
  4 interp_l   00147B R   |   4 interpre   001453 R   |   4 is_alnum   000B6F GR
  4 is_alpha   000B55 GR  |   4 is_data_   002C4B R   |   4 is_digit   000B66 GR
  4 is_erase   0026CB R   |   4 is_minus   001C14 R   |   4 is_progr   00221B R
  4 is_symbo   000B78 R   |   4 itoa       00158C GR  |   4 itoa_loo   0015AE R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 248.
Hexadecimal [24-Bits]

Symbol Table

  4 jp_to_ta   0021DC R   |   4 key        0027FC R   |   4 kword_di   00339F GR
  4 kword_en   002FC9 R   |   4 le         001077 R   |   4 let        001A04 GR
  4 let_arra   001A12 R   |   4 let_dvar   0014B4 R   |   4 let_eval   001A1A R
  4 let_var    001A17 R   |   4 lines_sk   001C28 R   |   4 list_exi   001C87 R
  4 list_loo   001C65 R   |   4 log2       002B5C R   |   4 look_tar   00210A R
  4 loop_bac   0020BC R   |   5 loop_dep   00001F R   |   4 loop_don   0020D1 R
  4 lshift     0028F9 R   |   4 lt         001075 R   |   4 lt_tst     000D89 R
  4 mod24      0003A1 R   |   4 move       0010DD GR  |   4 move_dow   0010FC R
  4 move_era   00040D R   |   4 move_exi   00111D R   |   4 move_lef   0006D3 R
  4 move_loo   001101 R   |   4 move_prg   00044D R   |   4 move_rig   0006E1 R
  4 move_up    0010EE R   |   4 mul24      000279 R   |   4 mul_char   00105F R
  4 mulu24_8   00023A R   |   4 nbr_tst    000C4E R   |   4 ne         00107A R
  4 neg24      000203 R   |   4 neg_acc2   00021D R   |   4 neg_ax     000215 R
  4 new        0024D4 R   |   4 next       002064 R   |   4 next_lin   00145B R
  4 next_tok   00150F GR  |   4 no_match   001697 R   |   4 open_gap   0009CB R
  4 other      000DB2 R   |   4 overwrit   000912 R   |   2 pad        0016B8 GR
  4 pad_ref    002DCD R   |   4 parse_bi   000B1A R   |   4 parse_in   000AC5 R
  4 parse_ke   000B9B R   |   4 parse_qu   000A70 R   |   4 parse_sy   000B83 R
  4 pause      002869 R   |   4 pause02    00287C R   |   4 peek       001F6E R
  4 pin_mode   002960 R   |   4 plus_tst   000D29 R   |   4 poke       001F4D R
  4 power_ad   00237B R   |   4 prcnt_ts   000D4A R   |   4 print_he   000949 GR
  4 print_to   001579 R   |   4 prog_siz   001B64 R   |   4 program_   001B6C R
  4 program_   000427 R   |   4 program_   00044D R   |   4 prt_acc2   00156E R
  4 prt_basi   001D0D R   |   4 prt_i16    001557 R   |   4 prt_loop   001D35 R
  5 ptr16      000019 GR  |   5 ptr8       00001A R   |   4 putc       000625 GR
  4 puts       000682 GR  |   4 qgetc      00062E GR  |   4 qkey       002800 GR
  4 qmark_ts   000CE0 R   |   4 qsign      0025AC R   |   4 random     0029EF R
  4 read       002CC6 R   |   4 read01     002CCE R   |   4 readln     000787 GR
  4 readln_l   000796 R   |   4 readln_q   00092F R   |   4 refresh_   002B57 R
  4 relation   001864 R   |   4 relop_st   001062 R   |   4 remark     001E6C GR
  4 reset_se   001D33 R   |   4 rest_con   001DBD R   |   4 restore    002C59 R
  4 return     002205 R   |   4 right_al   000E79 GR  |   4 row_alig   00056B R
  4 row_eras   0003E0 R   |   4 row_eras   00040D R   |   4 rparnt_t   000C9E R
  4 rshift     002925 R   |   7 rsign      00008C R   |   7 rsize      00008E R
  4 rt_msg     001382 R   |   4 run_app    00012A R   |   4 run_it     002289 R
  4 run_it_0   00228B R   |   4 runtime_   0016CD R   |   5 rx1_head   00002D R
  5 rx1_queu   000025 R   |   5 rx1_tail   00002E R   |   4 save_con   001DAD R
  4 scan_blo   000594 R   |   4 search_d   001677 GR  |   4 search_e   0016BF R
  4 search_f   0025DB R   |   4 search_l   00096B GR  |   4 search_l   00097A R
  4 search_n   001A81 R   |   4 search_n   00167B R   |   4 search_p   002F07 R
  5 seedx      000014 R   |   5 seedy      000016 R   |   4 select_p   0029BF R
  4 semic_ts   000CBF R   |   4 send_esc   0006AA R   |   4 send_par   0006B5 R
  4 set_data   002C92 R   |   4 set_time   002AF7 R   |   4 single_c   001057 R
  4 skip       000C08 R   |   4 skip_str   001528 R   |   4 skip_to_   0026D6 R
  4 slash_ts   000D3F R   |   4 sleep      00285E R   |   4 software   001130 R
  4 spaces     0006EF GR  |   4 spi_clea   002D62 R   |   4 spi_disa   002D4A R
  4 spi_enab   002D17 R   |   4 spi_rcv_   002D84 R   |   4 spi_read   002DAF R
  4 spi_sele   002DB6 R   |   4 spi_send   002D6E R   |   4 spi_writ   002D8F R
  2 stack_fu   001774 GR  |   2 stack_un   001800 R   |   4 star_tst   000D34 R
  4 start_fr   001C23 R   |   4 step       002022 R   |   4 stop       002489 R
  4 store_lo   002051 R   |   4 str_matc   0016A4 R   |   4 str_tst    000C3E R
  4 strcmp     0010BC R   |   4 strcpy     0010CD GR  |   4 strlen     0010B1 GR
  4 sub24      00019B R   |   4 symb_loo   000B84 R   |   4 syntax_e   0013B5 GR
  4 system_i   001176 R   |   4 tb_error   0013B7 GR  |   4 term       0017E9 R
  4 term01     0017F1 R   |   4 term_exi   001829 R   |   2 tib        001668 GR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 249.
Hexadecimal [24-Bits]

Symbol Table

  4 tick_tst   000CF8 R   |   5 ticks      00000F R   |   4 timeout    002B0E R
  5 timer      000012 GR  |   4 timer2_i   000093 R   |   4 timer4_i   0000A0 R
  4 tk_id      0013A5 R   |   4 to         001FDC R   |   4 to_eepro   000476 R
  4 to_flash   00047B R   |   4 to_hex_c   000960 GR  |   4 to_upper   0015EA GR
  4 token_ch   000DC8 R   |   4 token_ex   000DCC R   |   4 tone       002320 R
  4 try_next   002C9F R   |   5 txtbgn     00001B GR  |   5 txtend     00001D GR
  4 uart1_ge   000635 GR  |   4 uart1_in   0005E0 R   |   4 uart1_pu   000625 GR
  4 uart1_qg   00062E GR  |   4 uart1_se   0005F0 R   |   4 ubound     0019F9 R
  4 uflash     00280D R   |   4 unlock_e   0003AA R   |   4 unlock_f   0003C5 R
  4 until      002BC2 R   |   4 user_int   000049 R   |   4 usr        00282F R
  4 var_name   000EDA GR  |   5 vars       000034 GR  |   4 wait       001E72 R
  4 warm_ini   0011A3 R   |   4 warm_sta   001434 R   |   4 words      002A8A R
  4 words_co   002AE1 R   |   4 write      00273D R   |   4 write_bl   000530 GR
  4 write_bu   000467 R   |   4 write_by   0004B1 R   |   4 write_ee   0004ED R
  4 write_ex   000526 R   |   4 write_fl   0004D7 R   |   4 write_nb   000555 R
  4 xalloc     002DE0 R   |   4 xdrop      002E16 R   |   4 xpick      002E94 R
  4 xpop       002DD6 R   |   4 xpush      002DD2 R   |   4 xput       002E61 R
  4 xstack_b   002E43 R   |   2 xstack_f   001738 GR  |   2 xstack_u   001774 GR

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 250.
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

