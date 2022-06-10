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
      008050 82 00 89 44             72 	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
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
      0080D7 CD 8A 24         [ 4]  163 	call puts 
      0080DA                        164 UBTN_Handler_exit:
      0080DA AE 17 FF         [ 2]  165     ldw x,#STACK_EMPTY 
      0080DD 94               [ 1]  166     ldw sp,x
      0080DE 9A               [ 1]  167 	rim 
      0080DF CC 97 E3         [ 2]  168 5$:	jp warm_start
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
      008180 CD 89 82         [ 4]  262 	call uart1_init
                                    263 ; activate PE_4 (user button interrupt)
      008183 72 18 50 18      [ 1]  264     bset PE_CR2,#USR_BTN_BIT 
                                    265 ; display system information
      008187 9A               [ 1]  266 	rim ; enable interrupts 
                                    267 ; RND function seed 
                                    268 ; must be initialized 
                                    269 ; to value other than 0.
      008188 72 5C 00 18      [ 1]  270 	inc seedy+1 
      00818C 72 5C 00 16      [ 1]  271 	inc seedx+1 
      008190 CD 9E 07         [ 4]  272 	call func_eefree ; eeprom free address 
      008193 CD 9D A8         [ 4]  273 	call ubound ; @() size 
      008196 CD 95 63         [ 4]  274 	call clear_basic
      008199 CD A6 B1         [ 4]  275 	call beep_1khz  ; 
      00819C CD 95 18         [ 4]  276 	call system_information ; display system information 
      00819F                        277 2$:	
                                    278 ; check for autorun application
      00819F CE 40 00         [ 2]  279 	ldw x,EEPROM_BASE 
      0081A2 C3 B2 A1         [ 2]  280 	cpw x,AR_SIGN 
      0081A5 27 03            [ 1]  281 	jreq run_app
      0081A7 CC 97 E3         [ 2]  282 	jp warm_start 
      0081AA                        283 run_app:
      0081AA 4F               [ 1]  284 	clr a 
      0081AB CE 40 02         [ 2]  285 	ldw x,EEPROM_BASE+2
      0081AE CD A5 B7         [ 4]  286 	call is_program_addr 
      0081B1 27 03            [ 1]  287 	jreq 1$
      0081B3 CC 97 E3         [ 2]  288 	jp warm_start ; no autorun application.
      0081B6                        289 1$:	
                                    290 ; run application in FLASH|EEPROM 
      0081B6 90 CE 17 73      [ 2]  291 	ldw y,XSTACK_EMPTY
      0081BA CD 95 45         [ 4]  292 	call warm_init
      0081BD CE 40 02         [ 2]  293 	ldw x,EEPROM_BASE+2 
      0081C0 CF 00 1C         [ 2]  294 	ldw txtbgn,x
      0081C3 1D 00 02         [ 2]  295 	subw x,#2 
      0081C6 FE               [ 2]  296 	ldw x,(x)
      0081C7 72 BB 00 1C      [ 2]  297 	addw x,txtbgn 
      0081CB CF 00 1E         [ 2]  298 	ldw txtend,x 
      0081CE AE 81 DC         [ 2]  299 	ldw x,#AUTO_RUN 
      0081D1 CD 8A 24         [ 4]  300 	call puts 
      0081D4 CD 9F 1B         [ 4]  301 	call program_info 
      0081D7 CC A6 27         [ 2]  302 	jp run_it_02  
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
      0082EF CC 97 59         [ 2]  208     jp tb_error 
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



      008366 CC 97 59         [ 2]  282     jp tb_error 
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
      0083AA CC 97 59         [ 2]  348     jp tb_error 
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
                           000001    37 .if DEBUG 
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
      00842A                         48 prt_peek::
      00842A 89               [ 2]   49 	pushw x 
      00842B 35 10 00 0B      [ 1]   50 	mov base,#16 
      00842F CD 99 06         [ 4]   51 	call prt_i16  
      008432 A6 3A            [ 1]   52 	ld a,#': 
      008434 CD 89 C7         [ 4]   53 	call putc 
      008437 A6 20            [ 1]   54 	ld a,#SPACE 
      008439 CD 89 C7         [ 4]   55 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      00843C 85               [ 2]   56 	popw x 
      00843D F6               [ 1]   57 	ld a,(x)
      00843E 5F               [ 1]   58 	clrw x 
      00843F 97               [ 1]   59 	ld xl,a 
      008440 35 0A 00 0B      [ 1]   60 	mov base,#10 
      008444 CD 99 06         [ 4]   61 	call prt_i16 
      008447 81               [ 4]   62 	ret 
                                     63 
                                     64 ;----------------------------------------
                                     65 ;   DEBUG support functions
                                     66 ;----------------------------------------
                                     67 
                                     68 ; turn LED on 
      008448                         69 ledon:
      008448 72 1A 50 0A      [ 1]   70     bset PC_ODR,#LED2_BIT
      00844C 81               [ 4]   71     ret 
                                     72 
                                     73 ; turn LED off 
      00844D                         74 ledoff:
      00844D 72 1B 50 0A      [ 1]   75     bres PC_ODR,#LED2_BIT 
      008451 81               [ 4]   76     ret 
                                     77 
                                     78 ; invert LED status 
      008452                         79 ledtoggle:
      008452 A6 20            [ 1]   80     ld a,#LED2_MASK
      008454 C8 50 0A         [ 1]   81     xor a,PC_ODR
      008457 C7 50 0A         [ 1]   82     ld PC_ODR,a
      00845A 81               [ 4]   83     ret 
                                     84 
      00845B                         85 left_paren:
      00845B A6 20            [ 1]   86 	ld a,#SPACE 
      00845D CD 89 C7         [ 4]   87 	call putc
      008460 A6 28            [ 1]   88 	ld a,#'( 
      008462 CD 89 C7         [ 4]   89 	call putc 	
      008465 81               [ 4]   90 	ret 
                                     91 
                                     92 ;------------------------------
                                     93 ; print 8 bit register 
                                     94 ; input:
                                     95 ;   X  point to register name 
                                     96 ;   A  register value to print 
                                     97 ; output:
                                     98 ;   none
                                     99 ;------------------------------- 
      008466                        100 prt_reg8:
      008466 88               [ 1]  101 	push a 
      008467 CD 8A 24         [ 4]  102 	call puts 
      00846A 7B 01            [ 1]  103 	ld a,(1,sp) 
      00846C 5F               [ 1]  104 	clrw x 
      00846D 97               [ 1]  105 	ld xl,a 
      00846E 35 10 00 0B      [ 1]  106 	mov base,#16
      008472 CD 99 06         [ 4]  107 	call prt_i16  
      008475 CD 84 5B         [ 4]  108 	call left_paren 
      008478 84               [ 1]  109 	pop a 
      008479 5F               [ 1]  110 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      00847A 97               [ 1]  111 	ld xl,a 
      00847B 35 0A 00 0B      [ 1]  112 	mov base,#10 
      00847F CD 99 06         [ 4]  113 	call prt_i16  
      008482 A6 29            [ 1]  114 	ld a,#') 
      008484 CD 89 C7         [ 4]  115 	call putc
      008487 81               [ 4]  116 	ret
                                    117 
                                    118 ;--------------------------------
                                    119 ; print 16 bits register 
                                    120 ; input:
                                    121 ;   X   point register name 
                                    122 ;   Y   register value to print 
                                    123 ; output:
                                    124 ;  none
                                    125 ;--------------------------------
      008488                        126 prt_reg16: 
      008488 90 89            [ 2]  127 	pushw y 
      00848A CD 8A 24         [ 4]  128 	call puts 
      00848D 1E 01            [ 2]  129 	ldw x,(1,sp) 
      00848F 35 10 00 0B      [ 1]  130 	mov base,#16 
      008493 CD 99 06         [ 4]  131 	call prt_i16  
      008496 CD 84 5B         [ 4]  132 	call left_paren 
      008499 85               [ 2]  133 	popw x 
      00849A 35 0A 00 0B      [ 1]  134 	mov base,#10 
      00849E CD 99 06         [ 4]  135 	call prt_i16  
      0084A1 A6 29            [ 1]  136 	ld a,#') 
      0084A3 CD 89 C7         [ 4]  137 	call putc
      0084A6 81               [ 4]  138 	ret 
                                    139 
                                    140 ;------------------------------------
                                    141 ; print registers contents saved on
                                    142 ; stack by trap interrupt.
                                    143 ;------------------------------------
                           00000A   144 	R_PC=10 
                           000009   145 	R_CC=9
                           000008   146 	SAV_ACC24=8
                           000006   147 	SAV_ACC16=6
                           000004   148 	R_Y=4
                           000002   149 	R_X=2
                           000001   150 	R_A=1
                           000008   151 	VSIZE=8 
      0084A7                        152 print_registers:
      0084A7 8A               [ 1]  153 	push cc 
      000428                        154 	_vars VSIZE 
      0084A8 52 08            [ 2]    1     sub sp,#VSIZE 
      0084AA 6B 01            [ 1]  155 	ld (R_A,sp),a 
      0084AC 1F 02            [ 2]  156 	ldw (R_X,sp),x 
      0084AE 17 04            [ 2]  157 	ldw (R_Y,sp),y
      0084B0 C6 00 0D         [ 1]  158 	ld a,acc24 
      0084B3 CE 00 0E         [ 2]  159 	ldw x,acc16 
      0084B6 6B 08            [ 1]  160 	ld (SAV_ACC24,sp),a 
      0084B8 1F 06            [ 2]  161 	ldw (SAV_ACC16,sp),x 
      0084BA AE 85 11         [ 2]  162 	ldw x,#STATES
      0084BD CD 8A 24         [ 4]  163 	call puts
                                    164 ; print PC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      0084C0 AE 85 4E         [ 2]  165 	ldw x, #REG_PC
      0084C3 16 0A            [ 2]  166 	ldw y, (R_PC,sp)
      0084C5 72 A2 00 03      [ 2]  167 	subw y,#3
      0084C9 CD 84 88         [ 4]  168 	call prt_reg16 
                                    169 ; print x
      0084CC AE 85 56         [ 2]  170 	ldw x,#REG_X
      0084CF 16 02            [ 2]  171 	ldw y,(R_X,sp)
      0084D1 CD 84 88         [ 4]  172 	call prt_reg16  
                                    173 ; print Y 
      0084D4 AE 85 52         [ 2]  174 	ldw x,#REG_Y
      0084D7 16 04            [ 2]  175 	ldw y, (R_Y,sp)
      0084D9 CD 84 88         [ 4]  176 	call prt_reg16  
                                    177 ; print A 
      0084DC AE 85 5A         [ 2]  178 	ldw x,#REG_A
      0084DF 7B 01            [ 1]  179 	ld a, (R_A,sp) 
      0084E1 CD 84 66         [ 4]  180 	call prt_reg8
                                    181 ; print CC 
      0084E4 AE 85 5E         [ 2]  182 	ldw x,#REG_CC 
      0084E7 7B 09            [ 1]  183 	ld a, (R_CC,sp) 
      0084E9 CD 84 66         [ 4]  184 	call prt_reg8 
                                    185 ; print SP 
      0084EC AE 85 63         [ 2]  186 	ldw x,#REG_SP
      0084EF 90 96            [ 1]  187 	ldw y,sp 
      0084F1 72 A9 00 0B      [ 2]  188 	addw y,#(VSIZE+3)
      0084F5 CD 84 88         [ 4]  189 	call prt_reg16  
      0084F8 A6 0A            [ 1]  190 	ld a,#'\n' 
      0084FA CD 89 C7         [ 4]  191 	call putc
      0084FD 7B 08            [ 1]  192 	ld a,(SAV_ACC24,sp)
      0084FF 1E 06            [ 2]  193 	ldw x,(SAV_ACC16,sp)
      008501 C7 00 0D         [ 1]  194 	ld acc24,a 
      008504 CF 00 0E         [ 2]  195 	ldw acc16,x 
      008507 7B 01            [ 1]  196 	ld a,(R_A,sp)
      008509 1E 02            [ 2]  197 	ldw x,(R_X,sp)
      00850B 16 04            [ 2]  198 	ldw y,(R_Y,sp)
      00048D                        199 	_drop VSIZE
      00850D 5B 08            [ 2]    1     addw sp,#VSIZE 
      00850F 86               [ 1]  200 	pop cc   	
      008510 81               [ 4]  201 	ret
                                    202 
      008511 0A 52 65 67 69 73 74   203 STATES:  .asciz "\nRegisters state at break point.\n--------------------------\n"
             65 72 73 20 73 74 61
             74 65 20 61 74 20 62
             72 65 61 6B 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      00854E 50 43 3A 00            204 REG_PC: .asciz "PC:"
      008552 0A 59 3A 00            205 REG_Y:   .asciz "\nY:" 
      008556 0A 58 3A 00            206 REG_X:   .asciz "\nX:"
      00855A 0A 41 3A 00            207 REG_A:   .asciz "\nA:" 
      00855E 0A 43 43 3A 00         208 REG_CC:  .asciz "\nCC:"
      008563 0A 53 50 3A 00         209 REG_SP:  .asciz "\nSP:"
                                    210 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                    211 ;----------------------
                                    212 ; input:
                                    213 ;	Y    *input buffer 
                                    214 ; output:
                                    215 ;   acc24  integer 
                                    216 ;----------------------
      008568                        217 parse_addr:
      008568 A6 20            [ 1]  218 	ld a,#SPACE 
      00856A CD 8F AA         [ 4]  219 	call skip  	 
      00856D 72 B9 00 01      [ 2]  220 	addw y,in.w 
      008571 AE 16 B8         [ 2]  221 	ldw x,#pad 
      008574 CD 94 6F         [ 4]  222 	call strcpy
      008577 AE 16 B8         [ 2]  223 	ldw x,#pad
      00857A CD 99 A5         [ 4]  224 	call atoi24 	
      00857D 81               [ 4]  225 	ret 
                                    226 
                                    227 ;----------------------------
                                    228 ; command interface
                                    229 ; only 3 commands:
                                    230 ;  'q' to resume application
                                    231 ;  'p [addr]' to print memory values 
                                    232 ;  's addr' to print string 
                                    233 ;----------------------------
                                    234 ;local variable
                           00000B   235 	PSIZE=11
                           00000A   236 	SAV_COUNT=10
                           000009   237 	SAV_IN=9
                           000008   238 	SAV_ACC24=8
                           000006   239 	SAV_ACC16=6
                           000004   240 	R_Y=4
                           000002   241 	R_X=2
                           000001   242 	R_A=1
                           00000B   243 	VSIZE=11
      00857E                        244 cmd_itf:
      00857E 8A               [ 1]  245 	push cc 
      0004FF                        246 	_vars VSIZE
      00857F 52 0B            [ 2]    1     sub sp,#VSIZE 
      008581 6B 01            [ 1]  247 	ld (R_A,sp),a
      008583 C6 00 03         [ 1]  248 	ld a,count 
      008586 6B 0A            [ 1]  249 	ld (SAV_COUNT,sp),a 
      008588 C6 00 02         [ 1]  250 	ld a,in 
      00858B 6B 09            [ 1]  251 	ld (SAV_IN,sp),a  
      00858D 1F 02            [ 2]  252 	ldw (R_X,sp),x 
      00858F 17 04            [ 2]  253 	ldw (R_Y,sp),y
      008591 C6 00 0D         [ 1]  254 	ld a,acc24 
      008594 CE 00 0E         [ 2]  255 	ldw x,acc16 
      008597 6B 08            [ 1]  256 	ld (SAV_ACC24,sp),a 
      008599 1F 06            [ 2]  257 	ldw (SAV_ACC16,sp),x 
      00859B 72 5F 00 19      [ 1]  258 	clr farptr 
      00859F 72 5F 00 1A      [ 1]  259 	clr farptr+1 
      0085A3 72 5F 00 1B      [ 1]  260 	clr farptr+2  
      0085A7                        261 repl:
      0085A7 A6 0D            [ 1]  262 	ld a,#CR 
      0085A9 CD 89 C7         [ 4]  263 	call putc 
      0085AC A6 3F            [ 1]  264 	ld a,#'? 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      0085AE CD 89 C7         [ 4]  265 	call putc
      0085B1 72 5F 00 01      [ 1]  266 	clr in.w 
      0085B5 72 5F 00 02      [ 1]  267 	clr in 
      0085B9 CD 8B 29         [ 4]  268 	call readln
      0085BC 90 AE 16 68      [ 2]  269 	ldw y,#tib  
      0085C0 90 F6            [ 1]  270 	ld a,(y)
      0085C2 27 E3            [ 1]  271 	jreq repl  
      0085C4 72 5C 00 02      [ 1]  272 	inc in 
      0085C8 CD 99 99         [ 4]  273 	call to_upper 
      0085CB A1 51            [ 1]  274 	cp a,#'Q 
      0085CD 26 26            [ 1]  275 	jrne test_p
      0085CF                        276 repl_exit:
                                    277 ; restore original context 
      0085CF 7B 08            [ 1]  278 	ld a,(SAV_ACC24,sp)
      0085D1 1E 06            [ 2]  279 	ldw x,(SAV_ACC16,sp)
      0085D3 C7 00 0D         [ 1]  280 	ld acc24,a 
      0085D6 CF 00 0E         [ 2]  281 	ldw acc16,x
      0085D9 7B 0A            [ 1]  282 	ld a,(SAV_COUNT,sp)
      0085DB C7 00 03         [ 1]  283 	ld count,a 
      0085DE 7B 09            [ 1]  284 	ld a,(SAV_IN,sp)
      0085E0 C7 00 02         [ 1]  285 	ld in,a 
      0085E3 16 04            [ 2]  286 	ldw y,(R_Y,sp)
      0085E5 1E 02            [ 2]  287 	ldw x,(R_X,sp)
      0085E7 7B 01            [ 1]  288 	ld a,(R_A,sp)
      000569                        289 	_drop VSIZE
      0085E9 5B 0B            [ 2]    1     addw sp,#VSIZE 
      0085EB 86               [ 1]  290 	pop cc 
      0085EC 81               [ 4]  291 	ret  
      0085ED                        292 invalid:
      0085ED AE 86 5B         [ 2]  293 	ldw x,#invalid_cmd 
      0085F0 CD 8A 24         [ 4]  294 	call puts 
      0085F3 20 B2            [ 2]  295 	jra repl 
      0085F5                        296 test_p:	
      0085F5 A1 50            [ 1]  297     cp a,#'P 
      0085F7 27 10            [ 1]  298 	jreq mem_peek
      0085F9 A1 53            [ 1]  299     cp a,#'S 
      0085FB 26 F0            [ 1]  300 	jrne invalid 
      0085FD                        301 print_string:
      0085FD CD 85 68         [ 4]  302 	call parse_addr 	
      008600 CE 00 0E         [ 2]  303 	ldw x,acc16
      008603 CD 8A 24         [ 4]  304 	call puts
      008606 CC 85 A7         [ 2]  305 	jp repl 	
      008609                        306 mem_peek:
      008609 CD 85 68         [ 4]  307 	call parse_addr 
      00860C C6 00 0D         [ 1]  308 	ld a, acc24 
      00860F CA 00 0E         [ 1]  309 	or a,acc16 
      008612 CA 00 0F         [ 1]  310 	or a,acc8 
      008615 26 02            [ 1]  311 	jrne 1$ 
      008617 20 0C            [ 2]  312 	jra peek_byte  
      008619 CE 00 0D         [ 2]  313 1$:	ldw x,acc24 
      00861C CF 00 19         [ 2]  314 	ldw farptr,x 
      00861F C6 00 0F         [ 1]  315 	ld a,acc8 
      008622 C7 00 1B         [ 1]  316 	ld farptr+2,a 
      008625                        317 peek_byte:
      008625 CD 86 6A         [ 4]  318 	call print_farptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      008628 A6 08            [ 1]  319 	ld a,#8 
      00862A 6B 0B            [ 1]  320 	ld (PSIZE,sp),a 
      00862C 5F               [ 1]  321 	clrw x 
      00862D CD 86 85         [ 4]  322 1$:	call fetchc  
      008630 89               [ 2]  323 	pushw x 
      008631 C7 00 0F         [ 1]  324 	ld acc8,a 
      008634 5F               [ 1]  325 	clrw x 
      008635 CF 00 0D         [ 2]  326 	ldw acc24,x 
      008638 A6 90            [ 1]  327 	ld a,#16+128
      00863A CD 99 1D         [ 4]  328 	call prt_acc24
      00863D 85               [ 2]  329 	popw x 
      00863E 0A 0B            [ 1]  330 	dec (PSIZE,sp)
      008640 26 EB            [ 1]  331 	jrne 1$ 
      008642 A6 08            [ 1]  332 	ld a,#8 
      008644 CB 00 1B         [ 1]  333 	add a,farptr+2 
      008647 C7 00 1B         [ 1]  334 	ld farptr+2,a
      00864A 4F               [ 1]  335 	clr a 
      00864B C9 00 1A         [ 1]  336 	adc a,farptr+1 
      00864E C7 00 1A         [ 1]  337 	ld farptr+1,a 
      008651 4F               [ 1]  338 	clr a 
      008652 C9 00 19         [ 1]  339 	adc a,farptr 
      008655 C7 00 19         [ 1]  340 	ld farptr,a 
      008658 CC 85 A7         [ 2]  341 	jp repl  
                                    342 
      00865B 6E 6F 74 20 61 20 63   343 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                    344 
                                    345 ;----------------------------
                                    346 ; display farptr address
                                    347 ;----------------------------
      00866A                        348 print_farptr:
      00866A C6 00 1B         [ 1]  349 	ld a ,farptr+2 
      00866D C7 00 0F         [ 1]  350 	ld acc8,a 
      008670 CE 00 19         [ 2]  351 	ldw x,farptr 
      008673 CF 00 0D         [ 2]  352 	ldw acc24,x 
      008676 5F               [ 1]  353 	clrw x 
      008677 A6 10            [ 1]  354 	ld a,#16 
      008679 CD 99 1D         [ 4]  355 	call prt_acc24
      00867C A6 20            [ 1]  356 	ld a,#SPACE 
      00867E CD 89 C7         [ 4]  357 	call putc 
      008681 CD 89 C7         [ 4]  358 	call putc 
      008684 81               [ 4]  359 	ret
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
      008685                        370 fetchc: ; @C
      008685 92 AF 00 19      [ 5]  371 	ldf a,([farptr],x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      008689 5C               [ 1]  372 	incw x
      00868A 81               [ 4]  373 	ret
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
      00868B                        384 number:
      00868B CD 8F BD         [ 4]  385 	call get_token
      00868E A1 84            [ 1]  386 	cp a,#TK_INTGR
      008690 27 03            [ 1]  387 	jreq 1$
      008692 CC 97 57         [ 2]  388 	jp syntax_error
      008695 81               [ 4]  389 1$:	ret
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
      008696                        400 print_chars:
      008696 88               [ 1]  401 	push a 
      008697 AE 16 B8         [ 2]  402 	ldw x,#pad 
      00869A F6               [ 1]  403 1$:	ld a,(x)
      00869B A1 20            [ 1]  404 	cp a,#SPACE 
      00869D 25 06            [ 1]  405 	jrult 2$
      00869F A1 7F            [ 1]  406 	cp a,#127 
      0086A1 24 02            [ 1]  407 	jruge 2$ 
      0086A3 20 02            [ 2]  408 	jra 3$ 
      0086A5 A6 5F            [ 1]  409 2$: ld a,#'_ 
      0086A7                        410 3$:	
      0086A7 CD 89 C7         [ 4]  411 	call putc 
      0086AA 5C               [ 1]  412 	incw x 
      0086AB 0A 01            [ 1]  413 	dec (1,sp)
      0086AD 26 EB            [ 1]  414 	jrne 1$
      0086AF 84               [ 1]  415 	pop a 
      0086B0 81               [ 4]  416 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                    427 ;---------------------
                           000001   428 	CNT=1
                           000002   429 	CNTDWN=2 
                           000003   430 	BYTE=3
                           000003   431 	VSIZE=3 
      0086B1                        432 show_row:
      0086B1 4D               [ 1]  433 	tnz a 
      0086B2 26 01            [ 1]  434 	jrne 1$
      0086B4 81               [ 4]  435 	ret 
      0086B5                        436 1$:	
      000635                        437 	_vars VSIZE 
      0086B5 52 03            [ 2]    1     sub sp,#VSIZE 
      0086B7 6B 01            [ 1]  438 	ld (CNT,sp),a 
      0086B9 6B 02            [ 1]  439 	ld (CNTDWN,sp),a 
      0086BB C6 00 19         [ 1]  440 	ld a,farptr 
      0086BE CE 00 1A         [ 2]  441 	ldw x,ptr16 
      0086C1 C7 00 0D         [ 1]  442 	ld acc24,a 
      0086C4 CF 00 0E         [ 2]  443 	ldw acc16,x 
      0086C7 CD 99 3B         [ 4]  444 	call itoa 
      0086CA A6 07            [ 1]  445 	ld a,#7 
      0086CC CD 92 1B         [ 4]  446 	call right_align
      0086CF CD 8A 24         [ 4]  447 	call puts 
      0086D2 A6 09            [ 1]  448 	ld a,#9 
      0086D4 CD 89 C7         [ 4]  449 	call putc 
      0086D7                        450 row_loop:
      0086D7 92 BC 00 19      [ 5]  451 	ldf a,[farptr]
      0086DB 6B 03            [ 1]  452 	ld (BYTE,sp),a
      0086DD 7B 01            [ 1]  453 	ld a,(CNT,sp)
      0086DF 10 02            [ 1]  454 	sub a,(CNTDWN,sp)
      0086E1 5F               [ 1]  455 	clrw x 
      0086E2 97               [ 1]  456 	ld xl,a 
      0086E3 1C 16 B8         [ 2]  457 	addw x,#pad 
      0086E6 7B 03            [ 1]  458 	ld a,(BYTE,sp)
      0086E8 F7               [ 1]  459 	ld (x),a 
      0086E9 72 5F 00 0D      [ 1]  460 	clr acc24 
      0086ED 72 5F 00 0E      [ 1]  461 	clr acc16 
      0086F1 C7 00 0F         [ 1]  462 	ld acc8,a 
      0086F4 CD 99 3B         [ 4]  463 	call itoa 
      0086F7 A6 04            [ 1]  464 	ld a,#4
      0086F9 CD 92 1B         [ 4]  465 	call right_align 
      0086FC CD 8A 24         [ 4]  466 	call puts 
      0086FF AE 00 01         [ 2]  467 	ldw x,#1 	
      008702 CD 89 28         [ 4]  468 	call incr_farptr
      008705 0A 02            [ 1]  469 	dec (CNTDWN,sp)
      008707 26 CE            [ 1]  470 	jrne row_loop
      008709 A6 20            [ 1]  471 	ld a,#SPACE 
      00870B CD 89 C7         [ 4]  472 	call putc
      00870E 7B 01            [ 1]  473 	ld a,(CNT,sp) 
      008710 CD 86 96         [ 4]  474 	call print_chars 
      008713 A6 0D            [ 1]  475 	ld a,#CR 
      008715 CD 89 C7         [ 4]  476 	call putc 
      000698                        477 	_drop VSIZE   
      008718 5B 03            [ 2]    1     addw sp,#VSIZE 
      00871A 81               [ 4]  478 	ret 
                                    479 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                    480 ;--------------------------
                                    481 ; print memory content 
                                    482 ; in hexadecimal format
                                    483 ;  input:
                                    484 ;    farptr  start address 
                                    485 ;    X       count bytes to print 
                                    486 ;--------------------------
                           000001   487 	BCNT=1
                           000003   488 	BASE=3
                           000003   489 	VSIZE=3   
      00871B                        490 hex_dump:
      00871B 88               [ 1]  491 	push a 
      00069C                        492 	_vars VSIZE
      00871C 52 03            [ 2]    1     sub sp,#VSIZE 
      00871E C6 00 0B         [ 1]  493 	ld a,base
      008721 6B 03            [ 1]  494 	ld (BASE,sp),a 
      008723 35 10 00 0B      [ 1]  495 	mov base,#16
      008727 A6 0D            [ 1]  496 	ld a,#CR 
      008729 CD 89 C7         [ 4]  497 	call putc 
      00872C 1F 01            [ 2]  498 1$: ldw (BCNT,sp),x
      00872E A6 10            [ 1]  499 	ld a,#16
      008730 A3 00 10         [ 2]  500 	cpw x,#16
      008733 2A 01            [ 1]  501 	jrpl 2$
      008735 9F               [ 1]  502 	ld a,xl
      008736                        503 2$: 	
      008736 CD 86 B1         [ 4]  504 	call show_row 
      008739 1E 01            [ 2]  505 	ldw x,(BCNT,sp) 
      00873B 1D 00 10         [ 2]  506 	subw x,#16 
      00873E A3 00 01         [ 2]  507 	cpw x,#1
      008741 2A E9            [ 1]  508 	jrpl 1$
      008743 7B 03            [ 1]  509 	ld a,(BASE,sp)
      008745 C7 00 0B         [ 1]  510 	ld base,a
      0006C8                        511 	_drop VSIZE
      008748 5B 03            [ 2]    1     addw sp,#VSIZE 
      00874A 84               [ 1]  512 	pop a 
      00874B 81               [ 4]  513 	ret 
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
                           000001     5 DEBUG=1 ; set to 1 to include debugging code 
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
      00874C                         45 unlock_eeprom:
      00874C 72 06 50 5F 15   [ 2]   46 	btjt FLASH_IAPSR,#FLASH_IAPSR_DUL,9$
      008751 35 00 50 5B      [ 1]   47 	mov FLASH_CR2,#0 
      008755 35 FF 50 5C      [ 1]   48 	mov FLASH_NCR2,#0xFF 
      008759 35 AE 50 64      [ 1]   49 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      00875D 35 56 50 64      [ 1]   50     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      008761 72 07 50 5F FB   [ 2]   51 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008766 81               [ 4]   52 9$:	ret
                                     53 
                                     54 ;----------------------------------
                                     55 ; unlock FLASH for writing/erasing
                                     56 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                     57 ; input:
                                     58 ;  none
                                     59 ; output:
                                     60 ;  none
                                     61 ;----------------------------------
      008767                         62 unlock_flash:
      008767 72 02 50 5F 15   [ 2]   63 	btjt FLASH_IAPSR,#FLASH_IAPSR_PUL,9$
      00876C 35 00 50 5B      [ 1]   64 	mov FLASH_CR2,#0 
      008770 35 FF 50 5C      [ 1]   65 	mov FLASH_NCR2,#0xFF 
      008774 35 56 50 62      [ 1]   66 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008778 35 AE 50 62      [ 1]   67 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      00877C 72 03 50 5F FB   [ 2]   68 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      008781 81               [ 4]   69 9$:	ret
                                     70 
                                     71 ;----------------------------
                                     72 ; erase block code must be 
                                     73 ; executed from RAM
                                     74 ; input:
                                     75 ;-----------------------------
      008782                         76 row_erase:
      008782 88               [ 1]   77 	push a 
      008783 90 89            [ 2]   78 	pushw y 
      008785 35 20 50 5B      [ 1]   79 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      008789 35 DF 50 5C      [ 1]   80 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      00878D 4F               [ 1]   81 	clr a 
      00878E 90 5F            [ 1]   82 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      008790 91 A7 00 19      [ 1]   83 	ldf ([farptr],y),a
      008794 90 5C            [ 1]   84     incw y
      008796 91 A7 00 19      [ 1]   85 	ldf ([farptr],y),a
      00879A 90 5C            [ 1]   86     incw y
      00879C 91 A7 00 19      [ 1]   87 	ldf ([farptr],y),a
      0087A0 90 5C            [ 1]   88     incw y
      0087A2 91 A7 00 19      [ 1]   89 	ldf ([farptr],y),a
      0087A6 72 05 50 5F FB   [ 2]   90 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      0087AB 90 85            [ 2]   91 	popw y 
      0087AD 84               [ 1]   92 	pop a 
      0087AE 81               [ 4]   93 	ret
      0087AF                         94 row_erase_end:
                                     95 
                                     96 ; copy erase_start in RAM 
      0087AF                         97 move_erase_to_ram:
      0087AF 89               [ 2]   98 	pushw x 
      0087B0 90 89            [ 2]   99 	pushw y 
      0087B2 AE 87 AF         [ 2]  100 	ldw x,#row_erase_end 
      0087B5 1D 87 82         [ 2]  101 	subw x,#row_erase
      0087B8 CF 00 0E         [ 2]  102 	ldw acc16,x 
      0087BB AE 16 68         [ 2]  103 	ldw x,#tib 
      0087BE 90 AE 87 82      [ 2]  104 	ldw y,#row_erase 
      0087C2 CD 94 7F         [ 4]  105 	call move
      0087C5 90 85            [ 2]  106 	popw y
      0087C7 85               [ 2]  107 	popw x
      0087C8 81               [ 4]  108 	ret 
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
      0087C9                        123 program_row:
      0087C9 88               [ 1]  124 	push a 
      0087CA 90 89            [ 2]  125 	pushw y 
      0087CC 4B 80            [ 1]  126 	push #BLOCK_SIZE  
                                    127 ;enable block programming 
      0087CE 72 10 50 5B      [ 1]  128 	bset FLASH_CR2,#FLASH_CR2_PRG 
      0087D2 72 11 50 5C      [ 1]  129 	bres FLASH_NCR2,#FLASH_CR2_PRG
      0087D6 90 5F            [ 1]  130 	clrw y 
      0087D8 F6               [ 1]  131 1$:	ld a,(x)
      0087D9 91 A7 00 19      [ 1]  132 	ldf ([farptr],y),a
      0087DD 5C               [ 1]  133 	incw x 
      0087DE 90 5C            [ 1]  134 	incw y 
      0087E0 0A 01            [ 1]  135 	dec (BCNT,sp)
      0087E2 26 F4            [ 1]  136 	jrne 1$
                                    137 ; wait EOP bit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0087E4 72 05 50 5F FB   [ 2]  138 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      000769                        139 	_drop 1 
      0087E9 5B 01            [ 2]    1     addw sp,#1 
      0087EB 90 85            [ 2]  140 	popw y 
      0087ED 84               [ 1]  141 	pop a 
      0087EE 81               [ 4]  142 	ret 
      0087EF                        143 program_row_end:
                                    144 
                                    145 ;-------------------------
                                    146 ; move program_row to RAM 
                                    147 ; at txtubound address 
                                    148 ;------------------------
      0087EF                        149 move_prg_to_ram:
      0087EF 89               [ 2]  150 	pushw x 
      0087F0 90 89            [ 2]  151 	pushw y 
      0087F2 AE 87 EF         [ 2]  152 	ldw x,#program_row_end 
      0087F5 1D 87 C9         [ 2]  153 	subw x,#program_row 
      0087F8 CF 00 0E         [ 2]  154 	ldw acc16,x ; bytes to move 
      0087FB AE 16 68         [ 2]  155 	ldw x,#tib ; destination address 
      0087FE 90 AE 87 C9      [ 2]  156 	ldw y,#program_row ; source address 
      008802 CD 94 7F         [ 4]  157 	call move
      008805 90 85            [ 2]  158 	popw y 
      008807 85               [ 2]  159 	popw x  
      008808 81               [ 4]  160 	ret 
                                    161 
                                    162 
                                    163 ;-----------------------------
                                    164 ; write a buffer in FLASH/EEPROM 
                                    165 ; input:
                                    166 ;    farptr   destination address 
                                    167 ;    x        buffer address 
                                    168 ;-----------------------------
      008809                        169 write_buffer:
      008809 89               [ 2]  170 	pushw x 
      00880A 72 5D 00 19      [ 1]  171 	tnz farptr 
      00880E 26 0D            [ 1]  172 	jrne to_flash 
      008810 CE 00 1A         [ 2]  173 	ldw x,farptr+1 
      008813 A3 B9 00         [ 2]  174 	cpw x,#app_space  
      008816 24 05            [ 1]  175 	jruge to_flash 
      008818                        176 to_eeprom:
      008818 CD 87 4C         [ 4]  177 	call unlock_eeprom
      00881B 20 03            [ 2]  178 	jra do_programming
      00881D                        179 to_flash:
      00881D CD 87 67         [ 4]  180 	call unlock_flash
      008820                        181 do_programming:
      008820 85               [ 2]  182 	popw x 
      008821 CD 16 68         [ 4]  183 	call tib
      008824 72 13 50 5F      [ 1]  184 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      008828 72 17 50 5F      [ 1]  185 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      00882C 81               [ 4]  186 	ret 
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
      00882D                        197 block_erase:
      00882D 89               [ 2]  198 	pushw x 
      00882E C6 00 19         [ 1]  199 	ld a,farptr 
      008831 26 14            [ 1]  200 	jrne erase_flash
      008833 CE 00 1A         [ 2]  201 	ldw x,farptr+1
      008836 A3 B9 00         [ 2]  202 	cpw x,#app_space 
      008839 24 0C            [ 1]  203 	jruge erase_flash 
                                    204 ; erase eeprom block
      00883B CD 87 4C         [ 4]  205 	call unlock_eeprom 
      00883E CD 16 68         [ 4]  206 	call tib 
      008841 72 17 50 5F      [ 1]  207 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      008845 20 0A            [ 2]  208 	jra erase_exit  
                                    209 ; erase flash block:
      008847                        210 erase_flash:
      008847 CD 87 67         [ 4]  211 	call unlock_flash 
      00884A CD 16 68         [ 4]  212 	call tib 
      00884D 72 13 50 5F      [ 1]  213     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008851                        214 erase_exit: 
      008851 85               [ 2]  215 	popw x 
      008852 81               [ 4]  216 	ret 
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
      008853                        232 write_byte:
      008853 90 89            [ 2]  233 	pushw y
      0007D5                        234 	_vars VSIZE
      008855 52 02            [ 2]    1     sub sp,#VSIZE 
      008857 6B 01            [ 1]  235 	ld (BTW,sp),a ; byte to write 
      008859 0F 02            [ 1]  236 	clr (OPT,sp)  ; OPTION flag
                                    237 ; put addr[15:0] in Y, for bounds check.
      00885B 90 CE 00 1A      [ 2]  238 	ldw y,farptr+1   ; Y=addr15:0
                                    239 ; check addr[23:16], if <> 0 then it is extened flash memory
      00885F 72 5D 00 19      [ 1]  240 	tnz farptr 
      008863 26 14            [ 1]  241 	jrne write_flash
      008865 90 A3 B9 00      [ 2]  242     cpw y,#app_space 	 
      008869 24 0E            [ 1]  243     jruge write_flash
      00886B 90 A3 40 00      [ 2]  244 	cpw y,#EEPROM_BASE  
      00886F 25 57            [ 1]  245     jrult write_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      008871 90 A3 48 7F      [ 2]  246 	cpw y,#OPTION_END 
      008875 22 51            [ 1]  247 	jrugt write_exit
      008877 20 16            [ 2]  248 	jra write_eeprom 
                                    249 ; write program memory
      008879                        250 write_flash:
      008879 CD 87 67         [ 4]  251 	call unlock_flash 
      00887C 9B               [ 1]  252 1$:	sim 
      00887D 7B 01            [ 1]  253 	ld a,(BTW,sp)
      00887F 92 A7 00 19      [ 4]  254 	ldf ([farptr],x),a ; farptr[x]=A
      008883 72 05 50 5F FB   [ 2]  255 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008888 9A               [ 1]  256     rim 
      008889 72 13 50 5F      [ 1]  257     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00888D 20 39            [ 2]  258     jra write_exit
                                    259 ; write eeprom and option
      00888F                        260 write_eeprom:
      00888F CD 87 4C         [ 4]  261 	call unlock_eeprom
                                    262 	; check for data eeprom or option eeprom
      008892 90 A3 48 00      [ 2]  263 	cpw y,#OPTION_BASE
      008896 2B 08            [ 1]  264 	jrmi 1$
      008898 90 A3 48 80      [ 2]  265 	cpw y,#OPTION_END+1
      00889C 2A 02            [ 1]  266 	jrpl 1$
      00889E 03 02            [ 1]  267 	cpl (OPT,sp)
      0088A0                        268 1$: 
      0088A0 0D 02            [ 1]  269     tnz (OPT,sp)
      0088A2 27 08            [ 1]  270     jreq 2$
                                    271 	; pour modifier une option il faut modifier ces 2 bits
      0088A4 72 1E 50 5B      [ 1]  272     bset FLASH_CR2,#FLASH_CR2_OPT
      0088A8 72 1F 50 5C      [ 1]  273     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0088AC                        274 2$: 
      0088AC 7B 01            [ 1]  275     ld a,(BTW,sp)
      0088AE 92 A7 00 19      [ 4]  276     ldf ([farptr],x),a
      0088B2 0D 02            [ 1]  277     tnz (OPT,sp)
      0088B4 27 08            [ 1]  278     jreq 3$
      0088B6 5C               [ 1]  279     incw x
      0088B7 7B 01            [ 1]  280     ld a,(BTW,sp)
      0088B9 43               [ 1]  281     cpl a
      0088BA 92 A7 00 19      [ 4]  282     ldf ([farptr],x),a
      0088BE 72 05 50 5F FB   [ 2]  283 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0088C3 72 0D 50 5F FB   [ 2]  284 	btjf FLASH_IAPSR,#FLASH_IAPSR_HVOFF,.
      0088C8                        285 write_exit:
      0088C8 5C               [ 1]  286 	incw x 
      0088C9 CD 89 28         [ 4]  287 	call incr_farptr
      0088CC 5F               [ 1]  288 	clrw x 
      00084D                        289 	_drop VSIZE 
      0088CD 5B 02            [ 2]    1     addw sp,#VSIZE 
      0088CF 90 85            [ 2]  290 	popw y
      0088D1 81               [ 4]  291     ret
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
      0088D2                        307 	_argofs 3 
                           000005     1     ARG_OFS=2+3 
      000852                        308 	_arg BSIZE 1  ; block size
                           000006     1     BSIZE=ARG_OFS+1 
                                    309 	; local var 
                           000001   310 	XSAVE=1 
                           000002   311 	VSIZE=2 
      000852                        312 write_block::
      0088D2 88               [ 1]  313 	push a 
      000853                        314 	_vars VSIZE
      0088D3 52 02            [ 2]    1     sub sp,#VSIZE 
      0088D5 1F 01            [ 2]  315 	ldw (XSAVE,sp),x 
      0088D7 1E 06            [ 2]  316 	ldw x,(BSIZE,sp) 
      0088D9 27 13            [ 1]  317 	jreq 9$
      0088DB 1E 01            [ 2]  318 1$:	ldw x,(XSAVE,sp)
      0088DD 90 F6            [ 1]  319 	ld a,(y)
      0088DF CD 88 53         [ 4]  320 	call write_byte 
      0088E2 5C               [ 1]  321 	incw x 
      0088E3 90 5C            [ 1]  322 	incw y 
      0088E5 1F 01            [ 2]  323 	ldw (XSAVE,sp),x
      0088E7 1E 06            [ 2]  324 	ldw x,(BSIZE,sp)
      0088E9 5A               [ 2]  325 	decw x
      0088EA 1F 06            [ 2]  326 	ldw (BSIZE,sp),x 
      0088EC 26 ED            [ 1]  327 	jrne 1$
      0088EE                        328 9$:
      0088EE 1E 01            [ 2]  329 	ldw x,(XSAVE,sp)
      0088F0 CD 89 28         [ 4]  330 	call incr_farptr
      000873                        331 	_drop VSIZE
      0088F3 5B 02            [ 2]    1     addw sp,#VSIZE 
      0088F5 84               [ 1]  332 	pop a 
      0088F6 81               [ 4]  333 	ret 
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
      0088F7                        350 write_nbytes:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0088F7 90 89            [ 2]  351 	pushw y
      0088F9 88               [ 1]  352 	push a 
      0088FA 90 93            [ 1]  353 	ldw y,x
      0088FC 5F               [ 1]  354 	clrw x 
      0088FD                        355 1$:  
      0088FD 90 F6            [ 1]  356 	ld a,(y)
      0088FF 90 5C            [ 1]  357 	incw y
      008901 CD 88 53         [ 4]  358 	call write_byte 
      008904 5C               [ 1]  359 	incw x 
      008905 0A 01            [ 1]  360 	dec (1,sp)  
      008907 26 F4            [ 1]  361 	jrne 1$ 
      008909 84               [ 1]  362 9$: pop a 
      00890A 90 85            [ 2]  363 	popw y 
      00890C 81               [ 4]  364 	ret 
                                    365 
                                    366 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    367 ;;;  flash memory operations
                                    368 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    369 
                                    370 ;--------------------------
                                    371 ; align farptr to BLOCK_SIZE 
                                    372 ;---------------------------
      00890D                        373 row_align:
      00890D A6 7F            [ 1]  374 	ld a,#0x7f 
      00890F C4 00 1B         [ 1]  375 	and a,farptr+2 
      008912 27 13            [ 1]  376 	jreq 1$ 
      008914 CE 00 1A         [ 2]  377 	ldw x,farptr+1 
      008917 1C 00 80         [ 2]  378 	addw x,#BLOCK_SIZE 
      00891A 24 04            [ 1]  379 	jrnc 0$
      00891C 72 5C 00 19      [ 1]  380 	inc farptr 
      008920 9F               [ 1]  381 0$: ld a,xl 
      008921 A4 80            [ 1]  382 	and a,#0x80
      008923 97               [ 1]  383 	ld xl,a
      008924 CF 00 1A         [ 2]  384 	ldw farptr+1,x  	
      008927 81               [ 4]  385 1$:	ret
                                    386 
                                    387 ;--------------------
                                    388 ; input:
                                    389 ;   X     increment 
                                    390 ; output:
                                    391 ;   farptr  incremented 
                                    392 ;---------------------
      008928                        393 incr_farptr:
      008928 72 BB 00 1A      [ 2]  394 	addw x,farptr+1 
      00892C 24 04            [ 1]  395 	jrnc 1$
      00892E 72 5C 00 19      [ 1]  396 	inc farptr 
      008932 CF 00 1A         [ 2]  397 1$:	ldw farptr+1,x  
      008935 81               [ 4]  398 	ret 
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
      008936                        408 scan_block:
      008936 5F               [ 1]  409 	clrw x 
      008937 92 AF 00 19      [ 5]  410 1$: ldf a,([farptr],x) 
      00893B 26 06            [ 1]  411 	jrne 2$
      00893D 5C               [ 1]  412 	incw x 
      00893E A3 00 80         [ 2]  413 	cpw x,#BLOCK_SIZE 
      008941 25 F4            [ 1]  414 	jrult 1$ 
      008943 81               [ 4]  415 2$:	ret 
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
                           000001     5 DEBUG=1 ; set to 1 to include debugging code 
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
      008944                         68 Uart1RxHandler: ; console receive char 
      008944 72 0B 52 30 31   [ 2]   69 	btjf UART1_SR,#UART_SR_RXNE,5$
      008949 C6 52 31         [ 1]   70 	ld a,UART1_DR 
      00894C A1 03            [ 1]   71 	cp a,#CTRL_C 
      00894E 26 06            [ 1]   72 	jrne 2$
      008950 CD 89 C7         [ 4]   73 	call putc 
      008953 CC 80 C9         [ 2]   74 	jp user_interrupted
      008956                         75 2$:
      008956 A1 18            [ 1]   76 	cp a,#CAN ; CTRL_X 
      008958 26 03            [ 1]   77 	jrne 3$
      00895A CC 81 35         [ 2]   78 	jp cold_start 	
      00895D A1 1A            [ 1]   79 3$:	cp a,#CTRL_Z 
      00895F 26 06            [ 1]   80 	jrne 4$
      008961 CD 89 7B         [ 4]   81 	call clear_autorun
      008964 CC 81 35         [ 2]   82 	jp cold_start 
      008967                         83 4$:
      008967 88               [ 1]   84 	push a 
      008968 A6 26            [ 1]   85 	ld a,#rx1_queue 
      00896A CB 00 2F         [ 1]   86 	add a,rx1_tail 
      00896D 5F               [ 1]   87 	clrw x 
      00896E 97               [ 1]   88 	ld xl,a 
      00896F 84               [ 1]   89 	pop a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      008970 F7               [ 1]   90 	ld (x),a 
      008971 C6 00 2F         [ 1]   91 	ld a,rx1_tail 
      008974 4C               [ 1]   92 	inc a 
      008975 A4 07            [ 1]   93 	and a,#RX_QUEUE_SIZE-1
      008977 C7 00 2F         [ 1]   94 	ld rx1_tail,a 
      00897A 80               [11]   95 5$:	iret 
                                     96 
      00897B                         97 clear_autorun:
      00897B AE 40 00         [ 2]   98 	ldw x,#EEPROM_BASE 
      00897E CD A9 AB         [ 4]   99 	call erase_header ; in TinyBasic.asm 
      008981 81               [ 4]  100 	ret 
                                    101 
                                    102 ;---------------------------------------------
                                    103 ; initialize UART1, 115200 8N1
                                    104 ; called from cold_start in hardware_init.asm 
                                    105 ; input:
                                    106 ;	none
                                    107 ; output:
                                    108 ;   none
                                    109 ;---------------------------------------------
      008982                        110 uart1_init:
      008982 72 1A 50 02      [ 1]  111     bset PA_DDR,#UART1_TX_PIN
      008986 72 1A 50 03      [ 1]  112     bset PA_CR1,#UART1_TX_PIN 
      00898A 72 1A 50 04      [ 1]  113     bset PA_CR2,#UART1_TX_PIN 
                                    114 ; enable UART1 clock
      00898E 72 14 50 C7      [ 1]  115 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      008992                        116 uart1_set_baud: 
      008992 88               [ 1]  117 	push a 
                                    118 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    119 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008993 A6 E1            [ 1]  120 	ld a,#CLK_SWR_HSI
      008995 C1 50 C3         [ 1]  121 	cp a,CLK_CMSR 
      008998 27 0A            [ 1]  122 	jreq 2$ 
      00899A                        123 1$: ; 8 Mhz 	
      00899A 35 05 52 33      [ 1]  124 	mov UART1_BRR2,#0x05 ; must be loaded first
      00899E 35 04 52 32      [ 1]  125 	mov UART1_BRR1,#0x4
      0089A2 20 08            [ 2]  126 	jra 3$
      0089A4                        127 2$: ; 16 Mhz 	
      0089A4 35 0B 52 33      [ 1]  128 	mov UART1_BRR2,#0x0b ; must be loaded first
      0089A8 35 08 52 32      [ 1]  129 	mov UART1_BRR1,#0x08
      0089AC                        130 3$:
      0089AC 72 5F 52 31      [ 1]  131     clr UART1_DR
      0089B0 35 2C 52 35      [ 1]  132 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      0089B4 72 10 52 35      [ 1]  133 	bset UART1_CR2,#UART_CR2_SBK
      0089B8 72 0D 52 30 FB   [ 2]  134     btjf UART1_SR,#UART_SR_TC,.
      0089BD 72 5F 00 2E      [ 1]  135     clr rx1_head 
      0089C1 72 5F 00 2F      [ 1]  136 	clr rx1_tail
      0089C5 84               [ 1]  137 	pop a  
      0089C6 81               [ 4]  138 	ret
                                    139 
                                    140 ;---------------------------------
                                    141 ; uart1_putc
                                    142 ; send a character via UART1
                                    143 ; input:
                                    144 ;    A  	character to send
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                    145 ;---------------------------------
      0089C7                        146 putc:: ; console output always on UART1
      0089C7                        147 uart1_putc:: 
      0089C7 72 0F 52 30 FB   [ 2]  148 	btjf UART1_SR,#UART_SR_TXE,.
      0089CC C7 52 31         [ 1]  149 	ld UART1_DR,a 
      0089CF 81               [ 4]  150 	ret 
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
      0089D0                        161 qgetc::
      0089D0                        162 uart1_qgetc::
      0089D0 C6 00 2E         [ 1]  163 	ld a,rx1_head 
      0089D3 C0 00 2F         [ 1]  164 	sub a,rx1_tail 
      0089D6 81               [ 4]  165 	ret 
                                    166 
                                    167 ;---------------------------------
                                    168 ; wait character from UART1 
                                    169 ; input:
                                    170 ;   none
                                    171 ; output:
                                    172 ;   A 			char  
                                    173 ;--------------------------------	
      0089D7                        174 getc:: ;console input
      0089D7                        175 uart1_getc::
      0089D7 CD 89 D0         [ 4]  176 	call uart1_qgetc
      0089DA 27 FB            [ 1]  177 	jreq uart1_getc 
      0089DC 89               [ 2]  178 	pushw x 
                                    179 ;; rx1_queue must be in page 0 	
      0089DD A6 26            [ 1]  180 	ld a,#rx1_queue
      0089DF CB 00 2E         [ 1]  181 	add a,rx1_head 
      0089E2 5F               [ 1]  182 	clrw x  
      0089E3 97               [ 1]  183 	ld xl,a 
      0089E4 F6               [ 1]  184 	ld a,(x)
      0089E5 88               [ 1]  185 	push a
      0089E6 C6 00 2E         [ 1]  186 	ld a,rx1_head 
      0089E9 4C               [ 1]  187 	inc a 
      0089EA A4 07            [ 1]  188 	and a,#RX_QUEUE_SIZE-1
      0089EC C7 00 2E         [ 1]  189 	ld rx1_head,a 
      0089EF 84               [ 1]  190 	pop a  
      0089F0 85               [ 2]  191 	popw x
      0089F1 81               [ 4]  192 	ret 
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
      0089F2 43 81 44 80 48 82 46   207 convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',KEY_END,'3',SUP,0,0
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
      0089FE                        220 get_escape:
      0089FE CD 89 D7         [ 4]  221     call getc 
      008A01 A1 5B            [ 1]  222     cp a,#'[ ; this character is expected after ESC 
      008A03 27 02            [ 1]  223     jreq 1$
      008A05 4F               [ 1]  224     clr a
      008A06 81               [ 4]  225     ret
      008A07 CD 89 D7         [ 4]  226 1$: call getc 
      008A0A AE 89 F2         [ 2]  227     ldw x,#convert_table
      008A0D                        228 2$:
      008A0D F1               [ 1]  229     cp a,(x)
      008A0E 27 08            [ 1]  230     jreq 4$
      008A10 1C 00 02         [ 2]  231     addw x,#2
      008A13 7D               [ 1]  232     tnz (x)
      008A14 26 F7            [ 1]  233     jrne 2$
      008A16 4F               [ 1]  234     clr a
      008A17 81               [ 4]  235     ret 
      008A18 5C               [ 1]  236 4$: incw x 
      008A19 F6               [ 1]  237     ld a,(x)
      008A1A A1 84            [ 1]  238     cp a,#SUP
      008A1C 26 05            [ 1]  239     jrne 5$
      008A1E 88               [ 1]  240     push a 
      008A1F CD 89 D7         [ 4]  241     call getc
      008A22 84               [ 1]  242     pop a 
      008A23                        243 5$:
      008A23 81               [ 4]  244     ret 
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



      008A24                        254 puts::
      008A24 F6               [ 1]  255     ld a,(x)
      008A25 27 06            [ 1]  256 	jreq 1$
      008A27 CD 89 C7         [ 4]  257 	call putc 
      008A2A 5C               [ 1]  258 	incw x 
      008A2B 20 F7            [ 2]  259 	jra puts 
      008A2D 81               [ 4]  260 1$:	ret 
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
      008A2E                        271 bksp:
      008A2E A6 08            [ 1]  272 	ld a,#BS 
      008A30 CD 89 C7         [ 4]  273 	call putc 
      008A33 A6 20            [ 1]  274 	ld a,#SPACE 
      008A35 CD 89 C7         [ 4]  275 	call putc 
      008A38 A6 08            [ 1]  276 	ld a,#BS 
      008A3A CD 89 C7         [ 4]  277 	call putc 
      008A3D 81               [ 4]  278 	ret 
                                    279 ;---------------------------
                                    280 ; delete n character left of cursor 
                                    281 ; at terminal.
                                    282 ; input: 
                                    283 ;   A   number of characters to delete.
                                    284 ; output:
                                    285 ;    none 
                                    286 ;--------------------------	
      008A3E                        287 delete_nchar:
      008A3E 88               [ 1]  288 	push a 
      008A3F 0D 01            [ 1]  289 0$:	tnz (1,sp)
      008A41 27 07            [ 1]  290 	jreq 1$
      008A43 CD 8A 2E         [ 4]  291 	call bksp 
      008A46 0A 01            [ 1]  292 	dec (1,sp)
      008A48 20 F5            [ 2]  293 	jra 0$
      008A4A 84               [ 1]  294 1$:	pop a 
      008A4B 81               [ 4]  295 	ret
                                    296 
                                    297 ;--------------------------
                                    298 ; send ANSI escape sequence
                                    299 ; ANSI: ESC[
                                    300 ; note: ESC is ASCII 27
                                    301 ;       [   is ASCII 91  
                                    302 ;-------------------------- 
      008A4C                        303 send_escape:
      008A4C A6 1B            [ 1]  304 	ld a,#ESC 
      008A4E CD 89 C7         [ 4]  305 	call putc 
      008A51 A6 5B            [ 1]  306 	ld a,#'[
      008A53 CD 89 C7         [ 4]  307 	call putc 
      008A56 81               [ 4]  308 	ret 
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
      008A57                        324 send_parameter:
      008A57 89               [ 2]  325 	pushw x 
      008A58 5F               [ 1]  326 	clrw x 
      008A59 97               [ 1]  327 	ld xl,a 
      008A5A A6 0A            [ 1]  328 	ld a,#10 
      008A5C 62               [ 2]  329 	div x,a 
      008A5D 95               [ 1]  330 	ld xh,a 
      008A5E 9F               [ 1]  331 	ld a,xl
      008A5F 4D               [ 1]  332     tnz a 
      008A60 27 0B            [ 1]  333     jreq 2$
      008A62 A1 09            [ 1]  334 	cp a,#9 
      008A64 23 02            [ 2]  335 	jrule 1$
      008A66 A6 09            [ 1]  336 	ld a,#9
      008A68                        337 1$:
      008A68 AB 30            [ 1]  338 	add a,#'0 
      008A6A CD 89 C7         [ 4]  339 	call putc
      008A6D 9E               [ 1]  340 2$:	ld a,xh 
      008A6E AB 30            [ 1]  341 	add a,#'0
      008A70 CD 89 C7         [ 4]  342 	call putc 
      008A73 85               [ 2]  343 	popw x 
      008A74 81               [ 4]  344 	ret 
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
      008A75                        357 move_left:
      008A75 88               [ 1]  358 	push a 
      008A76 CD 8A 4C         [ 4]  359 	call send_escape
      008A79 84               [ 1]  360     pop a
      008A7A CD 8A 57         [ 4]  361 	call send_parameter 
      008A7D A6 44            [ 1]  362 	ld a,#'D 
      008A7F CD 89 C7         [ 4]  363 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      008A82 81               [ 4]  364 	ret	
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
      008A83                        375 move_right:
      008A83 88               [ 1]  376 	push a 
      008A84 CD 8A 4C         [ 4]  377 	call send_escape
      008A87 84               [ 1]  378     pop a
      008A88 CD 8A 57         [ 4]  379 	call send_parameter 
      008A8B A6 43            [ 1]  380 	ld a,#'C 
      008A8D CD 89 C7         [ 4]  381 	call putc 
      008A90 81               [ 4]  382 	ret 
                                    383 
                                    384 
                                    385 ;--------------------------
                                    386 ; print n spaces on terminal
                                    387 ; input:
                                    388 ;  X 		number of spaces 
                                    389 ; output:
                                    390 ;	none 
                                    391 ;---------------------------
      008A91                        392 spaces::
      008A91 A6 20            [ 1]  393 	ld a,#SPACE 
      008A93 5D               [ 2]  394 1$:	tnzw x
      008A94 27 06            [ 1]  395 	jreq 9$
      008A96 CD 89 C7         [ 4]  396 	call putc 
      008A99 5A               [ 2]  397 	decw x
      008A9A 20 F7            [ 2]  398 	jra 1$
      008A9C                        399 9$: 
      008A9C 81               [ 4]  400 	ret 
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
      008A9D                        418 insert_char: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      000A1D                        419 	_vars VSIZE 
      008A9D 52 03            [ 2]    1     sub sp,#VSIZE 
      008A9F 6B 02            [ 1]  420     ld (KCHAR,sp),a 
      008AA1 9E               [ 1]  421     ld a,xh 
      008AA2 6B 01            [ 1]  422 	ld (IPOS,sp),a
      008AA4 9F               [ 1]  423     ld a,xl 
      008AA5 6B 03            [ 1]  424     ld (LLEN,sp),a  
      008AA7 93               [ 1]  425     ldw x,y
      008AA8 5C               [ 1]  426     incw x 
      008AA9 7B 03            [ 1]  427     ld a,(LLEN,sp)
      008AAB 10 01            [ 1]  428     sub a,(IPOS,sp)
      008AAD 4C               [ 1]  429     inc a 
      008AAE C7 00 0F         [ 1]  430     ld acc8,a 
      008AB1 72 5F 00 0E      [ 1]  431     clr acc16
      008AB5 CD 94 7F         [ 4]  432     call move
      008AB8 90 AE 16 68      [ 2]  433     ldw y,#tib 
      008ABC 7B 01            [ 1]  434     ld a,(IPOS,sp)
      008ABE C7 00 0F         [ 1]  435     ld acc8,a 
      008AC1 72 B9 00 0E      [ 2]  436     addw y,acc16 
      008AC5 7B 02            [ 1]  437     ld a,(KCHAR,sp)
      008AC7 90 F7            [ 1]  438     ld (y),a
      008AC9 90 5C            [ 1]  439     incw y  
      008ACB 7B 01            [ 1]  440     ld a,(IPOS,sp)
      008ACD CD 8A 75         [ 4]  441     call move_left
      008AD0 AE 16 68         [ 2]  442     ldw x,#tib 
      008AD3 CD 8A 24         [ 4]  443     call puts 
      008AD6 7B 03            [ 1]  444     ld a,(LLEN,sp)
      008AD8 10 01            [ 1]  445     sub a,(IPOS,sp) 
      008ADA CD 8A 75         [ 4]  446     call move_left 
      000A5D                        447 	_drop VSIZE 
      008ADD 5B 03            [ 2]    1     addw sp,#VSIZE 
      008ADF 81               [ 4]  448 	ret 
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
      008AE0                        461 delete_under:
      000A60                        462 	_vars VSIZE 
      008AE0 52 02            [ 2]    1     sub sp,#VSIZE 
      008AE2 6B 02            [ 1]  463     ld (LLEN,sp),a 
      008AE4 9F               [ 1]  464     ld a,xl 
      008AE5 6B 01            [ 1]  465     ld (CPOS,sp),a 
      008AE7 93               [ 1]  466     ldw x,y ; move destination
      008AE8 90 5C            [ 1]  467     incw y  ; move source 
      008AEA 7B 02            [ 1]  468     ld a,(LLEN,sp)
      008AEC 10 01            [ 1]  469     sub a,(CPOS,sp)
      008AEE 4C               [ 1]  470     inc a ; move including zero at end.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      008AEF C7 00 0F         [ 1]  471     ld acc8,a 
      008AF2 72 5F 00 0E      [ 1]  472     clr acc16 
      008AF6 CD 94 7F         [ 4]  473 	call move 
      008AF9 90 AE 16 68      [ 2]  474     ldw y,#tib 
      008AFD 7B 01            [ 1]  475     ld a,(CPOS,sp)
      008AFF C7 00 0F         [ 1]  476     ld acc8,a 
      008B02 72 B9 00 0E      [ 2]  477     addw y,acc16 
      008B06 93               [ 1]  478     ldw x,y 
      008B07 CD 8A 24         [ 4]  479     call puts 
      008B0A A6 20            [ 1]  480     ld a,#SPACE  
      008B0C CD 89 C7         [ 4]  481     call putc
      008B0F 7B 02            [ 1]  482     ld a,(LLEN,sp)
      008B11 10 01            [ 1]  483     sub a,(CPOS,sp)
      008B13 CD 8A 75         [ 4]  484     call move_left 
      008B16 0A 02            [ 1]  485     dec (LLEN,sp)
      000A98                        486 	_drop VSIZE 
      008B18 5B 02            [ 2]    1     addw sp,#VSIZE 
      008B1A 81               [ 4]  487 	ret 
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
      008B1B                        499 delete_line:
      008B1B CD 8A 4C         [ 4]  500     call send_escape
      008B1E A6 32            [ 1]  501 	ld a,#'2
      008B20 CD 89 C7         [ 4]  502 	call putc 
      008B23 A6 4B            [ 1]  503 	ld a,#'K 
      008B25 CD 89 C7         [ 4]  504 	call putc 
      008B28 81               [ 4]  505 	ret 
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
      008B29                        538 readln::
      008B29 90 89            [ 2]  539 	pushw y 
      000AAB                        540 	_vars VSIZE 
      008B2B 52 06            [ 2]    1     sub sp,#VSIZE 
      008B2D 5F               [ 1]  541 	clrw x 
      008B2E 1F 02            [ 2]  542 	ldw (LL,sp),x 
      008B30 1F 03            [ 2]  543 	ldw (CPOS,sp),x 
      008B32 03 04            [ 1]  544 	cpl (OVRWR,sp) ; default to overwrite mode 
      008B34 90 AE 16 68      [ 2]  545  	ldw y,#tib ; terminal input buffer
      008B38                        546 readln_loop:
      008B38 CD 89 D7         [ 4]  547 	call getc
      008B3B 6B 01            [ 1]  548 	ld (RXCHAR,sp),a
      008B3D A1 1B            [ 1]  549     cp a,#ESC 
      008B3F 26 05            [ 1]  550     jrne 0$
      008B41 CD 89 FE         [ 4]  551     call get_escape 
      008B44 6B 01            [ 1]  552     ld (RXCHAR,sp),a 
      008B46 A1 0D            [ 1]  553 0$:	cp a,#CR
      008B48 26 03            [ 1]  554 	jrne 1$
      008B4A CC 8C D1         [ 2]  555 	jp readln_quit
      008B4D A1 0A            [ 1]  556 1$:	cp a,#LF 
      008B4F 26 03            [ 1]  557 	jrne 2$ 
      008B51 CC 8C D1         [ 2]  558 	jp readln_quit
      008B54                        559 2$:
      008B54 A1 08            [ 1]  560 	cp a,#BS
      008B56 26 12            [ 1]  561 	jrne 3$
                                    562 ; delete left 
      008B58 0D 03            [ 1]  563     tnz (CPOS,sp)
      008B5A 27 DC            [ 1]  564     jreq readln_loop 
      008B5C A6 01            [ 1]  565     ld a,#1 
      008B5E CD 8A 75         [ 4]  566     call move_left
      008B61 0A 03            [ 1]  567     dec (CPOS,sp)
      008B63 90 5A            [ 2]  568     decw y 
      008B65 7B 03            [ 1]  569     ld a,(CPOS,sp) 
      008B67 CC 8C 7D         [ 2]  570     jp 12$
      008B6A                        571 3$:
      008B6A A1 04            [ 1]  572 	cp a,#CTRL_D
      008B6C 26 1A            [ 1]  573 	jrne 4$
                                    574 ;delete line 
      008B6E CD 8B 1B         [ 4]  575 	call delete_line 
      008B71 7B 03            [ 1]  576     ld a,(CPOS,sp)
      008B73 4C               [ 1]  577     inc a 
      008B74 CD 8A 75         [ 4]  578     call move_left 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      008B77 A6 3E            [ 1]  579 	ld a,#'> 
      008B79 CD 89 C7         [ 4]  580 	call putc 
      008B7C 90 AE 16 68      [ 2]  581 	ldw y,#tib
      008B80 90 7F            [ 1]  582 	clr (y)
      008B82 0F 02            [ 1]  583 	clr (LL,sp)
      008B84 0F 03            [ 1]  584 	clr (CPOS,sp)
      008B86 20 B0            [ 2]  585 	jra readln_loop
      008B88                        586 4$:
      008B88 A1 12            [ 1]  587 	cp a,#CTRL_R 
      008B8A 26 1E            [ 1]  588 	jrne 5$
                                    589 ;repeat line 
      008B8C 0D 02            [ 1]  590 	tnz (LL,sp)
      008B8E 26 A8            [ 1]  591 	jrne readln_loop
      008B90 90 AE 16 68      [ 2]  592 	ldw y,#tib 
      008B94 93               [ 1]  593 	ldw x,y
      008B95 CD 94 53         [ 4]  594 	call strlen
      008B98 4D               [ 1]  595 	tnz a  
      008B99 27 9D            [ 1]  596 	jreq readln_loop
      008B9B 6B 02            [ 1]  597 	ld (LL,sp),a 
      008B9D 6B 03            [ 1]  598     ld (CPOS,sp),a
      008B9F 93               [ 1]  599 	ldw x,y  
      008BA0 CD 8A 24         [ 4]  600 	call puts
      008BA3 0F 01            [ 1]  601 	clr (LL_HB,sp)
      008BA5 72 F9 01         [ 2]  602 	addw y,(LL_HB,sp)
      008BA8 20 8E            [ 2]  603 	jra readln_loop 
      008BAA                        604 5$:
      008BAA A1 05            [ 1]  605 	cp a,#CTRL_E 
      008BAC 26 4D            [ 1]  606 	jrne 6$
                                    607 ;edit line number 
      008BAE AE 16 68         [ 2]  608 	ldw x,#tib 
      008BB1 17 05            [ 2]  609 	ldw (YTEMP,sp),y  
      008BB3 16 07            [ 2]  610 	ldw y,(VSIZE+1,sp) ; restore xstack pointer 
      008BB5 CD 99 A5         [ 4]  611 	call atoi24
      008BB8 16 05            [ 2]  612 	ldw y,(YTEMP,sp) ; restore tib pointer 
      008BBA 4F               [ 1]  613 	clr a
      008BBB CD 8D 0D         [ 4]  614 	call search_lineno
      008BBE 5D               [ 2]  615 	tnzw x 
      008BBF 26 0B            [ 1]  616 	jrne 51$
      008BC1 0F 02            [ 1]  617 	clr (LL,sp)
      008BC3 90 AE 16 68      [ 2]  618 	ldw y,#tib
      008BC7 90 7F            [ 1]  619     clr (y) 	
      008BC9 CC 8C D1         [ 2]  620 	jp readln_quit  
      008BCC                        621 51$:
      008BCC CF 00 05         [ 2]  622 	ldw basicptr,x
      008BCF E6 02            [ 1]  623 	ld a,(2,x)
      008BD1 C7 00 03         [ 1]  624 	ld count,a 
      008BD4 90 AE 16 68      [ 2]  625 	ldw y,#tib 
      008BD8 CD 92 86         [ 4]  626 	call decompile 
      008BDB 0F 01            [ 1]  627 	clr (LL_HB,sp)
      008BDD A6 0D            [ 1]  628 	ld a,#CR 
      008BDF CD 89 C7         [ 4]  629 	call putc 
      008BE2 A6 3E            [ 1]  630 	ld a,#'>
      008BE4 CD 89 C7         [ 4]  631 	call putc
      008BE7 AE 16 68         [ 2]  632     ldw x,#tib  
      008BEA CD 94 53         [ 4]  633 	call strlen 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      008BED 6B 02            [ 1]  634 	ld (LL,sp),a 
      008BEF CD 8A 24         [ 4]  635 	call puts 
      008BF2 90 93            [ 1]  636 	ldw y,x
      008BF4 7B 02            [ 1]  637     ld a,(LL,sp)
      008BF6 6B 03            [ 1]  638     ld (CPOS,sp),a  
      008BF8 CC 8B 38         [ 2]  639 	jp readln_loop
      008BFB                        640 6$:
      008BFB A1 81            [ 1]  641 	cp a,#ARROW_RIGHT
      008BFD 26 15            [ 1]  642    	jrne 7$ 
                                    643 ; right arrow
      008BFF 7B 03            [ 1]  644 	ld a,(CPOS,sp)
      008C01 11 02            [ 1]  645     cp a,(LL,sp)
      008C03 2B 03            [ 1]  646     jrmi 61$
      008C05 CC 8B 38         [ 2]  647     jp readln_loop 
      008C08                        648 61$:
      008C08 A6 01            [ 1]  649     ld a,#1 
      008C0A CD 8A 83         [ 4]  650 	call move_right 
      008C0D 0C 03            [ 1]  651 	inc (CPOS,sp)
      008C0F 90 5C            [ 1]  652     incw y 
      008C11 CC 8B 38         [ 2]  653     jp readln_loop 
      008C14 A1 80            [ 1]  654 7$: cp a,#ARROW_LEFT  
      008C16 26 13            [ 1]  655 	jrne 8$
                                    656 ; left arrow 
      008C18 0D 03            [ 1]  657 	tnz (CPOS,sp)
      008C1A 26 03            [ 1]  658 	jrne 71$
      008C1C CC 8B 38         [ 2]  659 	jp readln_loop
      008C1F                        660 71$:
      008C1F A6 01            [ 1]  661     ld a,#1 
      008C21 CD 8A 75         [ 4]  662 	call move_left 
      008C24 0A 03            [ 1]  663 	dec (CPOS,sp)
      008C26 90 5A            [ 2]  664     decw y 
      008C28 CC 8B 38         [ 2]  665 	jp readln_loop 
      008C2B A1 82            [ 1]  666 8$: cp a,#HOME  
      008C2D 26 0E            [ 1]  667 	jrne 9$
                                    668 ; HOME 
      008C2F 7B 03            [ 1]  669     ld a,(CPOS,sp)
      008C31 CD 8A 75         [ 4]  670     call move_left 
      008C34 0F 03            [ 1]  671 	clr (CPOS,sp)
      008C36 90 AE 16 68      [ 2]  672     ldw y,#tib 
      008C3A CC 8B 38         [ 2]  673 	jp readln_loop  
      008C3D A1 83            [ 1]  674 9$: cp a,#KEY_END  
      008C3F 26 26            [ 1]  675 	jrne 10$
                                    676 ; KEY_END 
      008C41 7B 03            [ 1]  677 	ld a,(CPOS,sp)
      008C43 11 02            [ 1]  678 	cp a,(LL,sp)
      008C45 26 03            [ 1]  679 	jrne 91$
      008C47 CC 8B 38         [ 2]  680 	jp readln_loop 
      008C4A                        681 91$:
      008C4A 7B 02            [ 1]  682 	ld a,(LL,sp)
      008C4C 10 03            [ 1]  683 	sub a,(CPOS,sp)
      008C4E CD 8A 83         [ 4]  684 	call move_right 
      008C51 7B 02            [ 1]  685 	ld a,(LL,sp)
      008C53 6B 03            [ 1]  686 	ld (CPOS,sp),a
      008C55 90 AE 16 68      [ 2]  687     ldw y,#tib
      008C59 72 5F 00 0E      [ 1]  688     clr acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      008C5D C7 00 0F         [ 1]  689     ld acc8,a 
      008C60 72 B9 00 0E      [ 2]  690     addw y,acc16  
      008C64 CC 8B 38         [ 2]  691 	jp readln_loop 
      008C67 A1 0F            [ 1]  692 10$: cp a,#CTRL_O
      008C69 26 08            [ 1]  693 	jrne 11$ 
                                    694 ; toggle between insert/overwrite
      008C6B 03 04            [ 1]  695 	cpl (OVRWR,sp)
      008C6D CD A6 B1         [ 4]  696 	call beep_1khz
      008C70 CC 8B 38         [ 2]  697 	jp readln_loop 
      008C73 A1 84            [ 1]  698 11$: cp a,#SUP 
      008C75 26 11            [ 1]  699     jrne final_test 
                                    700 ; del character under cursor 
      008C77 7B 03            [ 1]  701     ld a,(CPOS,sp)
      008C79 11 02            [ 1]  702     cp a,(LL,sp)
      008C7B 2A 08            [ 1]  703     jrpl 13$
      008C7D                        704 12$:
      008C7D 97               [ 1]  705     ld xl,a    ; cursor position 
      008C7E 7B 02            [ 1]  706     ld a,(LL,sp)  ; line length
      008C80 CD 8A E0         [ 4]  707     call delete_under
      008C83 0A 02            [ 1]  708     dec (LLEN,sp)
      008C85                        709 13$:
      008C85 CC 8B 38         [ 2]  710     jp readln_loop 
      008C88                        711 final_test:
      008C88 A1 20            [ 1]  712 	cp a,#SPACE
      008C8A 2A 03            [ 1]  713 	jrpl accept_char
      008C8C CC 8B 38         [ 2]  714 	jp readln_loop
      008C8F                        715 accept_char:
      008C8F A6 4F            [ 1]  716 	ld a,#TIB_SIZE-1
      008C91 11 02            [ 1]  717 	cp a, (LL,sp)
      008C93 2A 03            [ 1]  718 	jrpl 1$
      008C95 CC 8B 38         [ 2]  719 	jp readln_loop
      008C98 0D 04            [ 1]  720 1$:	tnz (OVRWR,sp)
      008C9A 26 18            [ 1]  721 	jrne overwrite
                                    722 ; insert mode 
      008C9C 7B 03            [ 1]  723     ld a,(CPOS,sp)
      008C9E 11 02            [ 1]  724     cp a,(LL,sp)
      008CA0 27 12            [ 1]  725     jreq overwrite
      008CA2 7B 02            [ 1]  726     ld a,(LL,sp)
      008CA4 97               [ 1]  727     ld xl,a 
      008CA5 7B 03            [ 1]  728     ld a,(CPOS,sp)
      008CA7 95               [ 1]  729     ld xh,a
      008CA8 7B 01            [ 1]  730     ld a,(RXCHAR,sp)
      008CAA CD 8A 9D         [ 4]  731     call insert_char
      008CAD 0C 02            [ 1]  732     inc (LLEN,sp)
      008CAF 0C 03            [ 1]  733     inc (CPOS,sp)	
      008CB1 CC 8B 38         [ 2]  734     jp readln_loop 
      008CB4                        735 overwrite:
      008CB4 7B 01            [ 1]  736 	ld a,(RXCHAR,sp)
      008CB6 90 F7            [ 1]  737 	ld (y),a
      008CB8 90 5C            [ 1]  738     incw y
      008CBA CD 89 C7         [ 4]  739     call putc 
      008CBD 7B 03            [ 1]  740 	ld a,(CPOS,sp)
      008CBF 11 02            [ 1]  741 	cp a,(LL,sp)
      008CC1 2B 09            [ 1]  742 	jrmi 1$
      008CC3 90 7F            [ 1]  743 	clr (y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      008CC5 0C 02            [ 1]  744 	inc (LL,sp)
      008CC7 0C 03            [ 1]  745     inc (CPOS,sp)
      008CC9 CC 8B 38         [ 2]  746 	jp readln_loop 
      008CCC                        747 1$:	
      008CCC 0C 03            [ 1]  748 	inc (CPOS,sp)
      008CCE CC 8B 38         [ 2]  749 	jp readln_loop 
      008CD1                        750 readln_quit:
      008CD1 90 AE 16 68      [ 2]  751 	ldw y,#tib
      008CD5 0F 01            [ 1]  752     clr (LL_HB,sp) 
      008CD7 72 F9 01         [ 2]  753     addw y,(LL_HB,sp)
      008CDA 90 7F            [ 1]  754     clr (y)
      008CDC 7B 02            [ 1]  755 	ld a,(LL,sp)
      008CDE C7 00 03         [ 1]  756 	ld count,a 
      008CE1 A6 0D            [ 1]  757 	ld a,#CR
      008CE3 CD 89 C7         [ 4]  758 	call putc
      000C66                        759 	_drop VSIZE 
      008CE6 5B 06            [ 2]    1     addw sp,#VSIZE 
      008CE8 90 85            [ 2]  760 	popw y 
      008CEA 81               [ 4]  761 	ret
                                    762 
                                    763 ;------------------------------
                                    764 ; print byte  in hexadecimal 
                                    765 ; on console
                                    766 ; input:
                                    767 ;    A		byte to print
                                    768 ;------------------------------
      008CEB                        769 print_hex::
      008CEB 88               [ 1]  770 	push a 
      008CEC 4E               [ 1]  771 	swap a 
      008CED CD 8D 02         [ 4]  772 	call to_hex_char 
      008CF0 CD 89 C7         [ 4]  773 	call putc 
      008CF3 7B 01            [ 1]  774     ld a,(1,sp) 
      008CF5 CD 8D 02         [ 4]  775 	call to_hex_char
      008CF8 CD 89 C7         [ 4]  776 	call putc
      008CFB A6 20            [ 1]  777 	ld a,#SPACE 
      008CFD CD 89 C7         [ 4]  778 	call putc 
      008D00 84               [ 1]  779 	pop a 
      008D01 81               [ 4]  780 	ret 
                                    781 
                                    782 ;----------------------------------
                                    783 ; convert to hexadecimal digit 
                                    784 ; input:
                                    785 ;   A       digit to convert 
                                    786 ; output:
                                    787 ;   A       hexdecimal character 
                                    788 ;----------------------------------
      008D02                        789 to_hex_char::
      008D02 A4 0F            [ 1]  790 	and a,#15 
      008D04 A1 09            [ 1]  791 	cp a,#9 
      008D06 23 02            [ 2]  792 	jrule 1$ 
      008D08 AB 07            [ 1]  793 	add a,#7
      008D0A AB 30            [ 1]  794 1$: add a,#'0 
      008D0C 81               [ 4]  795 	ret 
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
                           000001     5 DEBUG=1 ; set to 1 to include debugging code 
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
      008D0D                         51 search_lineno::
      000C8D                         52 	_vars VSIZE
      008D0D 52 02            [ 2]    1     sub sp,#VSIZE 
      008D0F 0F 01            [ 1]   53 	clr (LL,sp)
      008D11 90 CE 00 1C      [ 2]   54 	ldw y,txtbgn
      008D15 4D               [ 1]   55 	tnz a 
      008D16 27 04            [ 1]   56 	jreq search_ln_loop
      008D18 90 CE 00 05      [ 2]   57 	ldw y,basicptr 
      008D1C                         58 search_ln_loop:
      008D1C 90 C3 00 1E      [ 2]   59 	cpw y,txtend 
      008D20 2A 10            [ 1]   60 	jrpl 8$
      008D22 90 F3            [ 1]   61 	cpw x,(y)
      008D24 27 0E            [ 1]   62 	jreq 9$
      008D26 2B 0A            [ 1]   63 	jrmi 8$ 
      008D28 90 E6 02         [ 1]   64 	ld a,(2,y)
      008D2B 6B 02            [ 1]   65 	ld (LB,sp),a 
      008D2D 72 F9 01         [ 2]   66 	addw y,(LL,sp)
      008D30 20 EA            [ 2]   67 	jra search_ln_loop 
      008D32                         68 8$: 
      008D32 5F               [ 1]   69 	clrw x 	
      008D33 51               [ 1]   70 	exgw x,y 
      000CB4                         71 9$: _drop VSIZE
      008D34 5B 02            [ 2]    1     addw sp,#VSIZE 
      008D36 51               [ 1]   72 	exgw x,y   
      008D37 81               [ 4]   73 	ret 
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
      008D38                         83 del_line: 
      000CB8                         84 	_vars VSIZE 
      008D38 52 04            [ 2]    1     sub sp,#VSIZE 
      008D3A E6 02            [ 1]   85 	ld a,(2,x) ; line length
      008D3C 6B 02            [ 1]   86 	ld (LLEN+1,sp),a 
      008D3E 0F 01            [ 1]   87 	clr (LLEN,sp)
      008D40 90 93            [ 1]   88 	ldw y,x  
      008D42 72 F9 01         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      008D45 17 03            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      008D47 90 CE 00 1E      [ 2]   91 	ldw y,txtend 
      008D4B 72 F2 03         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      008D4E 90 CF 00 0E      [ 2]   93 	ldw acc16,y 
      008D52 16 03            [ 2]   94 	ldw y,(SRC,sp)    ; source
      008D54 CD 94 7F         [ 4]   95 	call move
      008D57 90 CE 00 1E      [ 2]   96 	ldw y,txtend 
      008D5B 72 F2 01         [ 2]   97 	subw y,(LLEN,sp)
      008D5E 90 CF 00 1E      [ 2]   98 	ldw txtend,y
      008D62 90 CF 00 30      [ 2]   99 	ldw dvar_bgn,y 
      008D66 90 CF 00 32      [ 2]  100 	ldw dvar_end,y   
      000CEA                        101 	_drop VSIZE     
      008D6A 5B 04            [ 2]    1     addw sp,#VSIZE 
      008D6C 81               [ 4]  102 	ret 
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
      008D6D                        117 open_gap:
      008D6D C3 00 1E         [ 2]  118 	cpw x,txtend 
      008D70 24 31            [ 1]  119 	jruge 9$
      000CF2                        120 	_vars VSIZE
      008D72 52 06            [ 2]    1     sub sp,#VSIZE 
      008D74 1F 03            [ 2]  121 	ldw (SRC,sp),x 
      008D76 17 05            [ 2]  122 	ldw (LEN,sp),y 
      008D78 90 CF 00 0E      [ 2]  123 	ldw acc16,y 
      008D7C 90 93            [ 1]  124 	ldw y,x ; SRC
      008D7E 72 BB 00 0E      [ 2]  125 	addw x,acc16  
      008D82 1F 01            [ 2]  126 	ldw (DEST,sp),x 
                                    127 ;compute size to move 	
      008D84 CE 00 1E         [ 2]  128 	ldw x,txtend 
      008D87 72 F0 03         [ 2]  129 	subw x,(SRC,sp)
      008D8A CF 00 0E         [ 2]  130 	ldw acc16,x ; size to move
      008D8D 1E 01            [ 2]  131 	ldw x,(DEST,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      008D8F CD 94 7F         [ 4]  132 	call move
      008D92 CE 00 1E         [ 2]  133 	ldw x,txtend
      008D95 72 FB 05         [ 2]  134 	addw x,(LEN,sp)
      008D98 CF 00 1E         [ 2]  135 	ldw txtend,x
      008D9B CF 00 30         [ 2]  136 	ldw dvar_bgn,x 
      008D9E CF 00 32         [ 2]  137 	ldw dvar_end,x 
      000D21                        138 	_drop VSIZE 
      008DA1 5B 06            [ 2]    1     addw sp,#VSIZE 
      008DA3 81               [ 4]  139 9$:	ret 
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
      008DA4                        156 insert_line:
      000D24                        157 	_vars VSIZE 
      008DA4 52 08            [ 2]    1     sub sp,#VSIZE 
      008DA6 72 CE 00 1A      [ 5]  158 	ldw x,[ptr16]
      008DAA 1F 05            [ 2]  159 	ldw (LINENO,sp),x 
      008DAC 0F 07            [ 1]  160 	clr (LLEN,sp)
      008DAE CE 00 1A         [ 2]  161 	ldw x,ptr16 
      008DB1 E6 02            [ 1]  162 	ld a,(2,x)
      008DB3 6B 08            [ 1]  163 	ld (LLEN+1,sp),a 
      008DB5 4F               [ 1]  164 	clr a 
      008DB6 1E 05            [ 2]  165 	ldw x,(LINENO,sp)
      008DB8 CD 8D 0D         [ 4]  166 	call search_lineno
      008DBB 5D               [ 2]  167 	tnzw x 
      008DBC 27 07            [ 1]  168 	jreq 0$ 
      008DBE 1F 01            [ 2]  169 	ldw (DEST,sp),x 
      008DC0 CD 8D 38         [ 4]  170 	call del_line 
      008DC3 20 02            [ 2]  171 	jra 1$
      008DC5 17 01            [ 2]  172 0$: ldw (DEST,sp),y
      008DC7 A6 03            [ 1]  173 1$: ld a,#3 
      008DC9 11 08            [ 1]  174 	cp a,(LLEN+1,sp)
      008DCB 27 42            [ 1]  175 	jreq 9$
                                    176 ; check for space 
      008DCD CE 00 1E         [ 2]  177 	ldw x,txtend 
      008DD0 72 FB 07         [ 2]  178 	addw x,(LLEN,sp)
      008DD3 A3 16 4A         [ 2]  179 	cpw x,#tib-10*CELL_SIZE ; keep 10 slots space for @() array.  
      008DD6 25 0C            [ 1]  180 	jrult 3$
      008DD8 72 1C 00 23      [ 1]  181 	bset flags,#FLN_REJECTED
      008DDC AE 95 AA         [ 2]  182 	ldw x,#err_mem_full 
      008DDF CD 8A 24         [ 4]  183 	call puts 
      008DE2 20 2B            [ 2]  184 	jra 9$  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      008DE4                        185 3$: ; create gap to insert line 
      008DE4 1E 01            [ 2]  186 	ldw x,(DEST,sp) 
      008DE6 16 07            [ 2]  187 	ldw y,(LLEN,sp)
      008DE8 CD 8D 6D         [ 4]  188 	call open_gap 
                                    189 ; move new line in gap 
      008DEB 1E 07            [ 2]  190 	ldw x,(LLEN,sp)
      008DED CF 00 0E         [ 2]  191 	ldw acc16,x 
      008DF0 90 AE 16 B8      [ 2]  192 	ldw y,#pad ;SRC 
      008DF4 1E 01            [ 2]  193 	ldw x,(DEST,sp) ; dest address 
      008DF6 CD 94 7F         [ 4]  194 	call move
      008DF9 1E 01            [ 2]  195 	ldw x,(DEST,sp)
      008DFB C3 00 1E         [ 2]  196 	cpw x,txtend 
      008DFE 25 0F            [ 1]  197 	jrult 9$ 
      008E00 1E 07            [ 2]  198 	ldw x,(LLEN,sp)
      008E02 72 BB 00 1E      [ 2]  199 	addw x,txtend 
      008E06 CF 00 1E         [ 2]  200 	ldw txtend,x 
      008E09 CF 00 30         [ 2]  201 	ldw dvar_bgn,x 
      008E0C CF 00 32         [ 2]  202 	ldw dvar_end,x 
      008E0F                        203 9$:	
      000D8F                        204 	_drop VSIZE
      008E0F 5B 08            [ 2]    1     addw sp,#VSIZE 
      008E11 81               [ 4]  205 	ret
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
      008E12                        221 parse_quote: 
      000D92                        222 	_vars VSIZE 
      008E12 52 02            [ 2]    1     sub sp,#VSIZE 
      008E14 4F               [ 1]  223 	clr a
      008E15 6B 01            [ 1]  224 1$:	ld (PREV,sp),a 
      008E17                        225 2$:	
      008E17 91 D6 01         [ 4]  226 	ld a,([in.w],y)
      008E1A 27 24            [ 1]  227 	jreq 6$
      008E1C 72 5C 00 02      [ 1]  228 	inc in 
      008E20 6B 02            [ 1]  229 	ld (CURR,sp),a 
      008E22 A6 5C            [ 1]  230 	ld a,#'\
      008E24 11 01            [ 1]  231 	cp a, (PREV,sp)
      008E26 26 0A            [ 1]  232 	jrne 3$
      008E28 0F 01            [ 1]  233 	clr (PREV,sp)
      008E2A 7B 02            [ 1]  234 	ld a,(CURR,sp)
      008E2C AD 1C            [ 4]  235 	callr convert_escape
      008E2E F7               [ 1]  236 	ld (x),a 
      008E2F 5C               [ 1]  237 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      008E30 20 E5            [ 2]  238 	jra 2$
      008E32                        239 3$:
      008E32 7B 02            [ 1]  240 	ld a,(CURR,sp)
      008E34 A1 5C            [ 1]  241 	cp a,#'\'
      008E36 27 DD            [ 1]  242 	jreq 1$
      008E38 A1 22            [ 1]  243 	cp a,#'"
      008E3A 27 04            [ 1]  244 	jreq 6$ 
      008E3C F7               [ 1]  245 	ld (x),a 
      008E3D 5C               [ 1]  246 	incw x 
      008E3E 20 D7            [ 2]  247 	jra 2$
      008E40                        248 6$:
      008E40 7F               [ 1]  249 	clr (x)
      008E41 5C               [ 1]  250 	incw x 
      008E42 90 93            [ 1]  251 	ldw y,x 
      008E44 5F               [ 1]  252 	clrw x 
      008E45 A6 02            [ 1]  253 	ld a,#TK_QSTR  
      000DC7                        254 	_drop VSIZE
      008E47 5B 02            [ 2]    1     addw sp,#VSIZE 
      008E49 81               [ 4]  255 	ret 
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
      008E4A                        266 convert_escape:
      008E4A 89               [ 2]  267 	pushw x 
      008E4B AE 8E 5F         [ 2]  268 	ldw x,#escaped 
      008E4E F1               [ 1]  269 1$:	cp a,(x)
      008E4F 27 06            [ 1]  270 	jreq 2$
      008E51 7D               [ 1]  271 	tnz (x)
      008E52 27 09            [ 1]  272 	jreq 3$
      008E54 5C               [ 1]  273 	incw x 
      008E55 20 F7            [ 2]  274 	jra 1$
      008E57 1D 8E 5F         [ 2]  275 2$: subw x,#escaped 
      008E5A 9F               [ 1]  276 	ld a,xl 
      008E5B AB 07            [ 1]  277 	add a,#7
      008E5D 85               [ 2]  278 3$:	popw x 
      008E5E 81               [ 4]  279 	ret 
                                    280 
      008E5F 61 62 74 6E 76 66 72   281 escaped:: .asciz "abtnvfr"
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
      008E67                        298 parse_integer: ; { -- n }
      008E67 89               [ 2]  299 	pushw x 	
      008E68 4B 00            [ 1]  300 	push #0 ; TCHAR
      008E6A 4B 0A            [ 1]  301 	push #10 ; BASE=10
      008E6C A1 24            [ 1]  302 	cp a,#'$
      008E6E 26 04            [ 1]  303 	jrne 2$ 
      000DF0                        304     _drop #1
      008E70 5B 01            [ 2]    1     addw sp,##1 
      008E72 4B 10            [ 1]  305 	push #16  ; BASE=16
      008E74 F7               [ 1]  306 2$:	ld (x),a 
      008E75 5C               [ 1]  307 	incw x 
      008E76 91 D6 01         [ 4]  308 	ld a,([in.w],y)
      008E79 72 5C 00 02      [ 1]  309 	inc in 
      008E7D CD 99 99         [ 4]  310 	call to_upper 
      008E80 6B 02            [ 1]  311 	ld (TCHAR,sp),a 
      008E82 CD 8F 08         [ 4]  312 	call is_digit 
      008E85 25 ED            [ 1]  313 	jrc 2$
      008E87 A6 10            [ 1]  314 	ld a,#16 
      008E89 11 01            [ 1]  315 	cp a,(BASE,sp)
      008E8B 26 0A            [ 1]  316 	jrne 3$ 
      008E8D 7B 02            [ 1]  317 	ld a,(TCHAR,sp)
      008E8F A1 41            [ 1]  318 	cp a,#'A 
      008E91 2B 04            [ 1]  319 	jrmi 3$ 
      008E93 A1 47            [ 1]  320 	cp a,#'G 
      008E95 2B DD            [ 1]  321 	jrmi 2$ 
      008E97 72 5A 00 02      [ 1]  322 3$: dec in 	
      008E9B 7F               [ 1]  323     clr (x)
      008E9C 1E 03            [ 2]  324 	ldw x,(XSAVE,sp)
      008E9E 90 AE 17 73      [ 2]  325 	ldw y,#XSTACK_EMPTY 
      008EA2 CD 99 A5         [ 4]  326 	call atoi24
      008EA5 16 03            [ 2]  327 	ldw y,(XSAVE,sp)
      008EA7 C6 00 0D         [ 1]  328 	ld a,acc24 
      008EAA 90 F7            [ 1]  329 	ld (y),a 
      008EAC 90 5C            [ 1]  330 	incw y  
      008EAE CE 00 0E         [ 2]  331 	ldw x,acc16 
      008EB1 90 FF            [ 2]  332 	ldw (y),x 
      008EB3 72 A9 00 02      [ 2]  333 	addw y,#2
      008EB7 A6 84            [ 1]  334 	ld a,#TK_INTGR
      000E39                        335 	_drop VSIZE  
      008EB9 5B 04            [ 2]    1     addw sp,#VSIZE 
      008EBB 81               [ 4]  336 	ret 	
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
      008EBC                        353 parse_binary: ; { -- n }
      008EBC 4B 00            [ 1]  354 	push #0
      008EBE 4B 00            [ 1]  355 	push #0
      008EC0 4B 00            [ 1]  356 	push #0
      008EC2                        357 2$:	
      008EC2 91 D6 01         [ 4]  358 	ld a,([in.w],y)
      008EC5 72 5C 00 02      [ 1]  359 	inc in 
      008EC9 A1 30            [ 1]  360 	cp a,#'0 
      008ECB 27 06            [ 1]  361 	jreq 3$
      008ECD A1 31            [ 1]  362 	cp a,#'1 
      008ECF 27 02            [ 1]  363 	jreq 3$ 
      008ED1 20 0B            [ 2]  364 	jra bin_exit 
      008ED3 A0 30            [ 1]  365 3$: sub a,#'0 
      008ED5 46               [ 1]  366 	rrc a
      008ED6 09 03            [ 1]  367 	rlc (BINARY+2,sp) 
      008ED8 09 02            [ 1]  368 	rlc (BINARY+1,sp)
      008EDA 09 01            [ 1]  369 	rlc (BINARY,sp) 
      008EDC 20 E4            [ 2]  370 	jra 2$  
      008EDE                        371 bin_exit:
      008EDE 72 5A 00 02      [ 1]  372 	dec in 
      008EE2 90 93            [ 1]  373 	ldw y,x
      008EE4 7B 01            [ 1]  374 	ld a,(BINARY,sp)
      008EE6 90 F7            [ 1]  375 	ld (y),a 
      008EE8 90 5C            [ 1]  376 	incw y 
      008EEA 1E 02            [ 2]  377 	ldw x,(BINARY+1,sp)
      008EEC 90 FF            [ 2]  378 	ldw (y),x 
      008EEE 72 A9 00 02      [ 2]  379 	addw y,#2  
      008EF2 A6 84            [ 1]  380 	ld a,#TK_INTGR 	
      000E74                        381 	_drop VSIZE 
      008EF4 5B 03            [ 2]    1     addw sp,#VSIZE 
      008EF6 81               [ 4]  382 	ret
                                    383 
                                    384 ;-------------------------------------
                                    385 ; check if A is a letter 
                                    386 ; input:
                                    387 ;   A 			character to test 
                                    388 ; output:
                                    389 ;   C flag      1 true, 0 false 
                                    390 ;-------------------------------------
      008EF7                        391 is_alpha::
      008EF7 A1 41            [ 1]  392 	cp a,#'A 
      008EF9 8C               [ 1]  393 	ccf 
      008EFA 24 0B            [ 1]  394 	jrnc 9$ 
      008EFC A1 5B            [ 1]  395 	cp a,#'Z+1 
      008EFE 25 07            [ 1]  396 	jrc 9$ 
      008F00 A1 61            [ 1]  397 	cp a,#'a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      008F02 8C               [ 1]  398 	ccf 
      008F03 24 02            [ 1]  399 	jrnc 9$
      008F05 A1 7B            [ 1]  400 	cp a,#'z+1
      008F07 81               [ 4]  401 9$: ret 	
                                    402 
                                    403 ;------------------------------------
                                    404 ; check if character in {'0'..'9'}
                                    405 ; input:
                                    406 ;    A  character to test
                                    407 ; output:
                                    408 ;    Carry  0 not digit | 1 digit
                                    409 ;------------------------------------
      008F08                        410 is_digit::
      008F08 A1 30            [ 1]  411 	cp a,#'0
      008F0A 25 03            [ 1]  412 	jrc 1$
      008F0C A1 3A            [ 1]  413     cp a,#'9+1
      008F0E 8C               [ 1]  414 	ccf 
      008F0F 8C               [ 1]  415 1$:	ccf 
      008F10 81               [ 4]  416     ret
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
      008F11                        427 is_alnum::
      008F11 CD 8F 08         [ 4]  428 	call is_digit
      008F14 25 03            [ 1]  429 	jrc 1$ 
      008F16 CD 8E F7         [ 4]  430 	call is_alpha
      008F19 81               [ 4]  431 1$:	ret 
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
      008F1A                        442 is_symbol_char: 
      008F1A A1 5F            [ 1]  443 	cp a,#'_ 
      008F1C 26 03            [ 1]  444 	jrne 1$
      008F1E 99               [ 1]  445 	scf 
      008F1F 20 03            [ 2]  446 	jra 9$ 
      008F21 CD 8F 11         [ 4]  447 1$:	call is_alnum 
      008F24 81               [ 4]  448 9$: ret 
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
      008F25                        462 parse_symbol:
      008F25 5C               [ 1]  463 	incw x ; keep space for TK_ID 
      008F26                        464 symb_loop: 
                                    465 ; symbol are converted to upper case 
      008F26 CD 99 99         [ 4]  466 	call to_upper  
      008F29 F7               [ 1]  467 	ld (x), a 
      008F2A 5C               [ 1]  468 	incw x
      008F2B 91 D6 01         [ 4]  469 	ld a,([in.w],y)
      008F2E 72 5C 00 02      [ 1]  470 	inc in 
      008F32 CD 8F 1A         [ 4]  471 	call is_symbol_char 
      008F35 25 EF            [ 1]  472 	jrc symb_loop 
      008F37 7F               [ 1]  473 	clr (x)
      008F38 72 5A 00 02      [ 1]  474 	dec in  
      008F3C 81               [ 4]  475 	ret 
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
      008F3D                        491 parse_keyword: 
      008F3D 89               [ 2]  492 	pushw x ; preserve *symbol 
      008F3E CD 8F 25         [ 4]  493 	call parse_symbol
      008F41 1E 01            [ 2]  494 	ldw x,(XFIRST,sp) 
      008F43 E6 02            [ 1]  495 	ld a,(2,x)
      008F45 26 0F            [ 1]  496 	jrne 2$
                                    497 ; one letter variable name 
      008F47 E6 01            [ 1]  498 	ld a,(1,x) 
      008F49 A0 41            [ 1]  499 	sub a,#'A 
      008F4B AE 00 03         [ 2]  500 	ldw x,#3 
      008F4E 42               [ 4]  501 	mul x,a 
      008F4F 1C 00 35         [ 2]  502 	addw x,#vars 
      008F52 A6 85            [ 1]  503 	ld a,#TK_VAR 
      008F54 20 36            [ 2]  504 	jra 4$ 
      008F56                        505 2$: ; check for keyword, otherwise syntax error.
      000ED6                        506 	_ldx_dict kword_dict ; dictionary entry point
      008F56 AE B7 3D         [ 2]    1     ldw x,#kword_dict+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      008F59 16 01            [ 2]  507 	ldw y,(XFIRST,sp) ; name to search for
      008F5B 90 5C            [ 1]  508 	incw y 
      008F5D CD 9A 26         [ 4]  509 	call search_dict
      008F60 4D               [ 1]  510 	tnz a
      008F61 26 29            [ 1]  511 	jrne 4$
                                    512 ; not in dictionary
                                    513 ; compile it as TK_LABEL
      008F63 16 01            [ 2]  514 	ldw y,(XFIRST,sp)
      008F65 A6 03            [ 1]  515 	ld a,#TK_LABEL 
      008F67 90 F7            [ 1]  516 	ld (y),a 
      008F69 90 5C            [ 1]  517 	incw y
      008F6B 93               [ 1]  518 	ldw x,y 
      008F6C CD 94 53         [ 4]  519 	call strlen
      008F6F A1 0F            [ 1]  520 	cp a,#NAME_MAX_LEN 
      008F71 23 02            [ 2]  521 	jrule 22$ 
      008F73 A6 0F            [ 1]  522 	ld a,#NAME_MAX_LEN 
      008F75                        523 22$:	
      008F75 88               [ 1]  524 	push a 
      008F76                        525 24$:
      008F76 90 F6            [ 1]  526     ld a,(y)
      008F78 27 09            [ 1]  527 	jreq 3$
      008F7A 90 5C            [ 1]  528 	incw y
      008F7C 0A 01            [ 1]  529 	dec (1,sp) 
      008F7E 26 F6            [ 1]  530 	jrne 24$
      008F80 4F               [ 1]  531 	clr a 
      008F81 90 F7            [ 1]  532 	ld (y),a 
      008F83 90 5C            [ 1]  533 3$: incw y 
      000F05                        534 	_drop 1 
      008F85 5B 01            [ 2]    1     addw sp,#1 
      008F87 A6 03            [ 1]  535 	ld a,#TK_LABEL 
      008F89 5F               [ 1]  536 	clrw x 
      008F8A 20 1B            [ 2]  537 	jra 5$ 
      008F8C                        538 4$:	
      008F8C 16 01            [ 2]  539 	ldw y,(XFIRST,sp)
      008F8E A1 87            [ 1]  540 	cp a,#TK_NOT 
      008F90 2B 06            [ 1]  541 	jrmi 41$
      008F92 90 F7            [ 1]  542 	ld (y),a 
      008F94 90 5C            [ 1]  543 	incw y 
      008F96 20 0F            [ 2]  544 	jra 5$ 
      008F98                        545 41$:	
      008F98 A3 9D B3         [ 2]  546 	cpw x,#let  
      008F9B 27 0A            [ 1]  547 	jreq 5$  ; don't compile LET command 
      008F9D 90 F7            [ 1]  548 	ld (y),a 
      008F9F 90 5C            [ 1]  549 	incw y 
      008FA1 90 FF            [ 2]  550 	ldw (y),x
      008FA3 72 A9 00 02      [ 2]  551 	addw y,#2  
      000F27                        552 5$:	_drop VSIZE 
      008FA7 5B 02            [ 2]    1     addw sp,#VSIZE 
      008FA9 81               [ 4]  553 	ret  	
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
      008FAA                        564 skip:
      008FAA 88               [ 1]  565 	push a
      008FAB 91 D6 01         [ 4]  566 1$:	ld a,([in.w],y)
      008FAE 27 0A            [ 1]  567 	jreq 2$
      008FB0 11 01            [ 1]  568 	cp a,(C,sp)
      008FB2 26 06            [ 1]  569 	jrne 2$
      008FB4 72 5C 00 02      [ 1]  570 	inc in
      008FB8 20 F1            [ 2]  571 	jra 1$
      000F3A                        572 2$: _drop 1 
      008FBA 5B 01            [ 2]    1     addw sp,#1 
      008FBC 81               [ 4]  573 	ret
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
      008FBD                        598 get_token:: 
      000F3D                        599 	_vars VSIZE
      008FBD 52 02            [ 2]    1     sub sp,#VSIZE 
                                    600 ;	ld a,in 
                                    601 ;	sub a,count
                                    602 ;   jrmi 0$
                                    603 ;	clr a 
                                    604 ;	ret 
      008FBF                        605 0$: 
      008FBF 90 AE 16 68      [ 2]  606 	ldw y,#tib    	
      008FC3 A6 20            [ 1]  607 	ld a,#SPACE
      008FC5 CD 8F AA         [ 4]  608 	call skip
      008FC8 55 00 02 00 04   [ 1]  609 	mov in.saved,in 
      008FCD 91 D6 01         [ 4]  610 	ld a,([in.w],y)
      008FD0 26 05            [ 1]  611 	jrne 1$
      008FD2 90 93            [ 1]  612 	ldw y,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      008FD4 CC 91 6E         [ 2]  613 	jp token_exit ; end of line 
      008FD7 72 5C 00 02      [ 1]  614 1$:	inc in 
      008FDB CD 99 99         [ 4]  615 	call to_upper 
      008FDE 6B 01            [ 1]  616 	ld (TCHAR,sp),a 
                                    617 ; check for quoted string
      008FE0                        618 str_tst:  	
      000F60                        619 	_case '"' nbr_tst
      008FE0 A6 22            [ 1]    1 	ld a,#'"' 
      008FE2 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FE4 26 0A            [ 1]    3 	jrne nbr_tst
      008FE6 A6 02            [ 1]  620 	ld a,#TK_QSTR
      008FE8 F7               [ 1]  621 	ld (x),a 
      008FE9 5C               [ 1]  622 	incw x 
      008FEA CD 8E 12         [ 4]  623 	call parse_quote
      008FED CC 91 6E         [ 2]  624 	jp token_exit
      008FF0                        625 nbr_tst:
                                    626 ; check for hexadecimal number 
      008FF0 A6 24            [ 1]  627 	ld a,#'$'
      008FF2 11 01            [ 1]  628 	cp a,(TCHAR,sp) 
      008FF4 27 17            [ 1]  629 	jreq 1$
                                    630 ;check for binary number 
      008FF6 A6 26            [ 1]  631 	ld a,#'&
      008FF8 11 01            [ 1]  632 	cp a,(TCHAR,sp)
      008FFA 26 0A            [ 1]  633 	jrne 0$
      008FFC A6 84            [ 1]  634 	ld a,#TK_INTGR
      008FFE F7               [ 1]  635 	ld (x),a 
      008FFF 5C               [ 1]  636 	incw x 
      009000 CD 8E BC         [ 4]  637 	call parse_binary ; expect binary integer 
      009003 CC 91 6E         [ 2]  638 	jp token_exit 
                                    639 ; check for decimal number 	
      009006 7B 01            [ 1]  640 0$:	ld a,(TCHAR,sp)
      009008 CD 8F 08         [ 4]  641 	call is_digit
      00900B 24 0C            [ 1]  642 	jrnc 3$
      00900D A6 84            [ 1]  643 1$:	ld a,#TK_INTGR 
      00900F F7               [ 1]  644 	ld (x),a 
      009010 5C               [ 1]  645 	incw x 
      009011 7B 01            [ 1]  646 	ld a,(TCHAR,sp)
      009013 CD 8E 67         [ 4]  647 	call parse_integer 
      009016 CC 91 6E         [ 2]  648 	jp token_exit 
      009019                        649 3$: 
      000F99                        650 	_case '(' bkslsh_tst 
      009019 A6 28            [ 1]    1 	ld a,#'(' 
      00901B 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00901D 26 05            [ 1]    3 	jrne bkslsh_tst
      00901F A6 06            [ 1]  651 	ld a,#TK_LPAREN
      009021 CC 91 6A         [ 2]  652 	jp token_char   	
      009024                        653 bkslsh_tst: ; character token 
      000FA4                        654 	_case '\',rparnt_tst
      009024 A6 5C            [ 1]    1 	ld a,#'\' 
      009026 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009028 26 16            [ 1]    3 	jrne rparnt_tst
      00902A A6 04            [ 1]  655 	ld a,#TK_CHAR 
      00902C F7               [ 1]  656 	ld (x),a 
      00902D 5C               [ 1]  657 	incw x 
      00902E 91 D6 01         [ 4]  658 	ld a,([in.w],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009031 F7               [ 1]  659 	ld (x),a 
      009032 5C               [ 1]  660 	incw x
      009033 90 93            [ 1]  661 	ldw y,x 	 
      009035 72 5C 00 02      [ 1]  662 	inc in  
      009039 5F               [ 1]  663 	clrw x 
      00903A 97               [ 1]  664 	ld xl,a 
      00903B A6 04            [ 1]  665 	ld a,#TK_CHAR 
      00903D CC 91 6E         [ 2]  666 	jp token_exit 
      009040                        667 rparnt_tst:		
      000FC0                        668 	_case ')' colon_tst 
      009040 A6 29            [ 1]    1 	ld a,#')' 
      009042 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009044 26 05            [ 1]    3 	jrne colon_tst
      009046 A6 07            [ 1]  669 	ld a,#TK_RPAREN 
      009048 CC 91 6A         [ 2]  670 	jp token_char
      00904B                        671 colon_tst:
      000FCB                        672 	_case ':' comma_tst 
      00904B A6 3A            [ 1]    1 	ld a,#':' 
      00904D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00904F 26 05            [ 1]    3 	jrne comma_tst
      009051 A6 09            [ 1]  673 	ld a,#TK_COLON 
      009053 CC 91 6A         [ 2]  674 	jp token_char  
      009056                        675 comma_tst:
      000FD6                        676 	_case COMMA semic_tst 
      009056 A6 2C            [ 1]    1 	ld a,#COMMA 
      009058 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00905A 26 05            [ 1]    3 	jrne semic_tst
      00905C A6 08            [ 1]  677 	ld a,#TK_COMMA
      00905E CC 91 6A         [ 2]  678 	jp token_char
      009061                        679 semic_tst:
      000FE1                        680 	_case SEMIC dash_tst
      009061 A6 3B            [ 1]    1 	ld a,#SEMIC 
      009063 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009065 26 05            [ 1]    3 	jrne dash_tst
      009067 A6 0A            [ 1]  681 	ld a,#TK_SEMIC 
      009069 CC 91 6A         [ 2]  682 	jp token_char 	
      00906C                        683 dash_tst: 	
      000FEC                        684 	_case '-' at_tst 
      00906C A6 2D            [ 1]    1 	ld a,#'-' 
      00906E 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009070 26 05            [ 1]    3 	jrne at_tst
      009072 A6 11            [ 1]  685 	ld a,#TK_MINUS  
      009074 CC 91 6A         [ 2]  686 	jp token_char 
      009077                        687 at_tst:
      000FF7                        688 	_case '@' qmark_tst 
      009077 A6 40            [ 1]    1 	ld a,#'@' 
      009079 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00907B 26 05            [ 1]    3 	jrne qmark_tst
      00907D A6 05            [ 1]  689 	ld a,#TK_ARRAY 
      00907F CC 91 6A         [ 2]  690 	jp token_char
      009082                        691 qmark_tst:
      001002                        692 	_case '?' tick_tst 
      009082 A6 3F            [ 1]    1 	ld a,#'?' 
      009084 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009086 26 12            [ 1]    3 	jrne tick_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009088 A6 80            [ 1]  693 	ld a,#TK_CMD  
      00908A F7               [ 1]  694 	ld (x),a 
      00908B 5C               [ 1]  695 	incw x 
      00908C 90 93            [ 1]  696 	ldw y,x 
      00908E AE A0 CD         [ 2]  697 	ldw x,#print
      009091 90 FF            [ 2]  698 	ldw (y),x 
      009093 72 A9 00 02      [ 2]  699 	addw y,#2
      009097 CC 91 6E         [ 2]  700 	jp token_exit
      00909A                        701 tick_tst: ; comment 
      00101A                        702 	_case TICK plus_tst 
      00909A A6 27            [ 1]    1 	ld a,#TICK 
      00909C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00909E 26 2B            [ 1]    3 	jrne plus_tst
      0090A0 A6 80            [ 1]  703 	ld a,#TK_CMD
      0090A2 F7               [ 1]  704 	ld (x),a 
      0090A3 5C               [ 1]  705 	incw x
      0090A4 90 AE A2 08      [ 2]  706 	ldw y,#remark 
      0090A8 FF               [ 2]  707 	ldw (x),y 
      0090A9 1C 00 02         [ 2]  708 	addw x,#2  
      0090AC                        709 copy_comment:
      0090AC 90 AE 16 68      [ 2]  710 	ldw y,#tib 
      0090B0 72 B9 00 01      [ 2]  711 	addw y,in.w
      0090B4 90 89            [ 2]  712 	pushw y 
      0090B6 CD 94 6F         [ 4]  713 	call strcpy
      0090B9 72 F2 01         [ 2]  714 	subw y,(1,sp)
      0090BC 90 5C            [ 1]  715 	incw y ; strlen+1 
      0090BE 17 01            [ 2]  716 	ldw (1,sp),y 
      0090C0 72 FB 01         [ 2]  717 	addw x,(1,sp) 
      001043                        718 	_drop 2 
      0090C3 5B 02            [ 2]    1     addw sp,#2 
      0090C5 4F               [ 1]  719 	clr a 
      0090C6 90 93            [ 1]  720 	ldw y,x 
      0090C8 CC 91 6E         [ 2]  721 	jp token_exit 
      0090CB                        722 plus_tst:
      00104B                        723 	_case '+' star_tst 
      0090CB A6 2B            [ 1]    1 	ld a,#'+' 
      0090CD 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0090CF 26 05            [ 1]    3 	jrne star_tst
      0090D1 A6 10            [ 1]  724 	ld a,#TK_PLUS  
      0090D3 CC 91 6A         [ 2]  725 	jp token_char 
      0090D6                        726 star_tst:
      001056                        727 	_case '*' slash_tst 
      0090D6 A6 2A            [ 1]    1 	ld a,#'*' 
      0090D8 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0090DA 26 05            [ 1]    3 	jrne slash_tst
      0090DC A6 20            [ 1]  728 	ld a,#TK_MULT 
      0090DE CC 91 6A         [ 2]  729 	jp token_char 
      0090E1                        730 slash_tst: 
      001061                        731 	_case '/' prcnt_tst 
      0090E1 A6 2F            [ 1]    1 	ld a,#'/' 
      0090E3 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0090E5 26 05            [ 1]    3 	jrne prcnt_tst
      0090E7 A6 21            [ 1]  732 	ld a,#TK_DIV 
      0090E9 CC 91 6A         [ 2]  733 	jp token_char 
      0090EC                        734 prcnt_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      00106C                        735 	_case '%' eql_tst 
      0090EC A6 25            [ 1]    1 	ld a,#'%' 
      0090EE 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0090F0 26 05            [ 1]    3 	jrne eql_tst
      0090F2 A6 22            [ 1]  736 	ld a,#TK_MOD
      0090F4 CC 91 6A         [ 2]  737 	jp token_char  
                                    738 ; 1 or 2 character tokens 	
      0090F7                        739 eql_tst:
      001077                        740 	_case '=' gt_tst 		
      0090F7 A6 3D            [ 1]    1 	ld a,#'=' 
      0090F9 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0090FB 26 05            [ 1]    3 	jrne gt_tst
      0090FD A6 32            [ 1]  741 	ld a,#TK_EQUAL
      0090FF CC 91 6A         [ 2]  742 	jp token_char 
      009102                        743 gt_tst:
      001082                        744 	_case '>' lt_tst 
      009102 A6 3E            [ 1]    1 	ld a,#'>' 
      009104 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009106 26 23            [ 1]    3 	jrne lt_tst
      009108 A6 31            [ 1]  745 	ld a,#TK_GT 
      00910A 6B 02            [ 1]  746 	ld (ATTRIB,sp),a 
      00910C 91 D6 01         [ 4]  747 	ld a,([in.w],y)
      00910F 72 5C 00 02      [ 1]  748 	inc in 
      009113 A1 3D            [ 1]  749 	cp a,#'=
      009115 26 04            [ 1]  750 	jrne 1$
      009117 A6 33            [ 1]  751 	ld a,#TK_GE 
      009119 20 4F            [ 2]  752 	jra token_char  
      00911B A1 3C            [ 1]  753 1$: cp a,#'<
      00911D 26 04            [ 1]  754 	jrne 2$
      00911F A6 35            [ 1]  755 	ld a,#TK_NE 
      009121 20 47            [ 2]  756 	jra token_char 
      009123 72 5A 00 02      [ 1]  757 2$: dec in
      009127 7B 02            [ 1]  758 	ld a,(ATTRIB,sp)
      009129 20 3F            [ 2]  759 	jra token_char 	 
      00912B                        760 lt_tst:
      0010AB                        761 	_case '<' other
      00912B A6 3C            [ 1]    1 	ld a,#'<' 
      00912D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00912F 26 23            [ 1]    3 	jrne other
      009131 A6 34            [ 1]  762 	ld a,#TK_LT 
      009133 6B 02            [ 1]  763 	ld (ATTRIB,sp),a 
      009135 91 D6 01         [ 4]  764 	ld a,([in.w],y)
      009138 72 5C 00 02      [ 1]  765 	inc in 
      00913C A1 3D            [ 1]  766 	cp a,#'=
      00913E 26 04            [ 1]  767 	jrne 1$
      009140 A6 36            [ 1]  768 	ld a,#TK_LE 
      009142 20 26            [ 2]  769 	jra token_char 
      009144 A1 3E            [ 1]  770 1$: cp a,#'>
      009146 26 04            [ 1]  771 	jrne 2$
      009148 A6 35            [ 1]  772 	ld a,#TK_NE 
      00914A 20 1E            [ 2]  773 	jra token_char 
      00914C 72 5A 00 02      [ 1]  774 2$: dec in 
      009150 7B 02            [ 1]  775 	ld a,(ATTRIB,sp)
      009152 20 16            [ 2]  776 	jra token_char 	
      009154                        777 other: ; not a special character 	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009154 7B 01            [ 1]  778 	ld a,(TCHAR,sp)
      009156 CD 8E F7         [ 4]  779 	call is_alpha 
      009159 25 03            [ 1]  780 	jrc 30$ 
      00915B CC 97 57         [ 2]  781 	jp syntax_error 
      00915E                        782 30$: 
      00915E CD 8F 3D         [ 4]  783 	call parse_keyword
      009161 A3 A2 08         [ 2]  784 	cpw x,#remark 
      009164 26 08            [ 1]  785 	jrne token_exit 
      009166 93               [ 1]  786 	ldw x,y 
      009167 CC 90 AC         [ 2]  787 	jp copy_comment 
      00916A                        788 token_char:
      00916A F7               [ 1]  789 	ld (x),a 
      00916B 5C               [ 1]  790 	incw x
      00916C 90 93            [ 1]  791 	ldw y,x 
      00916E                        792 token_exit:
      0010EE                        793 	_drop VSIZE 
      00916E 5B 02            [ 2]    1     addw sp,#VSIZE 
      009170 81               [ 4]  794 	ret
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
      009171                        814 compile::
      009171 90 89            [ 2]  815 	pushw y ; preserve xstack pointer 
      0010F3                        816 	_vars VSIZE 
      009173 52 02            [ 2]    1     sub sp,#VSIZE 
      009175 55 00 1C 00 05   [ 1]  817 	mov basicptr,txtbgn
      00917A 72 1A 00 23      [ 1]  818 	bset flags,#FCOMP 
      00917E A6 00            [ 1]  819 	ld a,#0
      009180 AE 00 00         [ 2]  820 	ldw x,#0
      009183 CF 16 B8         [ 2]  821 	ldw pad,x ; destination buffer 
      009186 C7 16 BA         [ 1]  822 	ld pad+2,a ; count 
      009189 AE 16 BB         [ 2]  823 	ldw x,#pad+3
      00918C 72 5F 00 02      [ 1]  824 	clr in 
      009190 CD 8F BD         [ 4]  825 	call get_token
      009193 A1 84            [ 1]  826 	cp a,#TK_INTGR
      009195 26 11            [ 1]  827 	jrne 2$
      009197 A3 00 01         [ 2]  828 	cpw x,#1 
      00919A 2A 05            [ 1]  829 	jrpl 1$
      00919C A6 0A            [ 1]  830 	ld a,#ERR_BAD_VALUE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      00919E CC 97 59         [ 2]  831 	jp tb_error
      0091A1 CF 16 B8         [ 2]  832 1$:	ldw pad,x ; line# 
      0091A4 90 AE 16 BB      [ 2]  833 	ldw y,#pad+3 
      0091A8 90 A3 17 38      [ 2]  834 2$:	cpw y,#xstack_full 
      0091AC 25 05            [ 1]  835 	jrult 3$
      0091AE A6 0F            [ 1]  836 	ld a,#ERR_BUF_FULL 
      0091B0 CC 97 59         [ 2]  837 	jp tb_error 
      0091B3                        838 3$:	
      0091B3 93               [ 1]  839 	ldw x,y 
      0091B4 CD 8F BD         [ 4]  840 	call get_token 
      0091B7 A1 00            [ 1]  841 	cp a,#TK_NONE 
      0091B9 26 ED            [ 1]  842 	jrne 2$ 
                                    843 ; compilation completed  
      0091BB 72 A2 16 B8      [ 2]  844 	subw y,#pad ; compiled line length 
      0091BF 90 9F            [ 1]  845     ld a,yl
      0091C1 AE 16 B8         [ 2]  846 	ldw x,#pad 
      0091C4 CF 00 1A         [ 2]  847 	ldw ptr16,x 
      0091C7 E7 02            [ 1]  848 	ld (2,x),a 
      0091C9 FE               [ 2]  849 	ldw x,(x)  ; line# 
      0091CA 27 09            [ 1]  850 	jreq 10$
      0091CC CD 8D A4         [ 4]  851 	call insert_line
      0091CF 72 5F 00 03      [ 1]  852 	clr  count 
      0091D3 20 0F            [ 2]  853 	jra  11$ 
      0091D5                        854 10$: ; line# is zero 
      0091D5 CE 00 1A         [ 2]  855 	ldw x,ptr16  
      0091D8 CF 00 05         [ 2]  856 	ldw basicptr,x 
      0091DB E6 02            [ 1]  857 	ld a,(2,x)
      0091DD C7 00 03         [ 1]  858 	ld count,a 
      0091E0 35 03 00 02      [ 1]  859 	mov in,#3 
      0091E4                        860 11$:
      001164                        861 	_drop VSIZE 
      0091E4 5B 02            [ 2]    1     addw sp,#VSIZE 
      0091E6 72 1B 00 23      [ 1]  862 	bres flags,#FCOMP 
      0091EA 90 85            [ 2]  863 	popw y 
      0091EC 81               [ 4]  864 	ret 
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
                           000001     5 DEBUG=1 ; set to 1 to include debugging code 
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
      0091ED                         48 cpy_cmd_name:
      0091ED 5D               [ 2]   49 	tnzw x 
      0091EE 27 14            [ 1]   50 	jreq 10$
      0091F0 F6               [ 1]   51 	ld a,(x)
      0091F1 5C               [ 1]   52 	incw x
      0091F2 A4 0F            [ 1]   53 	and a,#15  
      0091F4 88               [ 1]   54 	push a 
      0091F5 0D 01            [ 1]   55     tnz (1,sp) 
      0091F7 27 0A            [ 1]   56 	jreq 9$
      0091F9 F6               [ 1]   57 1$:	ld a,(x)
      0091FA 90 F7            [ 1]   58 	ld (y),a  
      0091FC 5C               [ 1]   59 	incw x
      0091FD 90 5C            [ 1]   60 	incw y 
      0091FF 0A 01            [ 1]   61 	dec (1,sp)	 
      009201 26 F6            [ 1]   62 	jrne 1$
      009203 84               [ 1]   63 9$: pop a 
      009204                         64 10$: 
      009204 81               [ 4]   65 	ret	
                                     66 
                                     67 ;--------------------------
                                     68 ; add a space after letter or 
                                     69 ; digit.
                                     70 ; input:
                                     71 ;   Y     pointer to buffer 
                                     72 ; output:
                                     73 ;   Y    moved to end 
                                     74 ;--------------------------
      009205                         75 add_space:
      009205 90 5A            [ 2]   76 	decw y 
      009207 90 F6            [ 1]   77 	ld a,(y)
      009209 90 5C            [ 1]   78 	incw y
      00920B A1 29            [ 1]   79 	cp a,#') 
      00920D 27 05            [ 1]   80 	jreq 0$
      00920F CD 8F 11         [ 4]   81 	call is_alnum 
      009212 24 06            [ 1]   82 	jrnc 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009214                         83 0$: 
      009214 A6 20            [ 1]   84 	ld a,#SPACE 
      009216 90 F7            [ 1]   85 	ld (y),a 
      009218 90 5C            [ 1]   86 	incw y 
      00921A 81               [ 4]   87 1$: ret 
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
      00921B                        103 right_align::
      00119B                        104 	_vars VSIZE 
      00921B 52 02            [ 2]    1     sub sp,#VSIZE 
      00921D 6B 01            [ 1]  105 	ld (WIDTH,sp),a 
      00921F CD 94 53         [ 4]  106 	call strlen 
      009222 6B 02            [ 1]  107 0$:	ld (SLEN,sp),a  
      009224 11 01            [ 1]  108 	cp a,(WIDTH,sp) 
      009226 2A 09            [ 1]  109 	jrpl 1$
      009228 5A               [ 2]  110 	decw x
      009229 A6 20            [ 1]  111 	ld a,#SPACE 
      00922B F7               [ 1]  112 	ld (x),a  
      00922C 7B 02            [ 1]  113 	ld a,(SLEN,sp)
      00922E 4C               [ 1]  114 	inc a 
      00922F 20 F1            [ 2]  115 	jra 0$ 
      009231 7B 02            [ 1]  116 1$: ld a,(SLEN,sp)	
      0011B3                        117 	_drop VSIZE 
      009233 5B 02            [ 2]    1     addw sp,#VSIZE 
      009235 81               [ 4]  118 	ret 
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
      009236                        131 cpy_quote:
      009236 A6 22            [ 1]  132 	ld a,#'"
      009238 90 F7            [ 1]  133 	ld (y),a 
      00923A 90 5C            [ 1]  134 	incw y 
      00923C 89               [ 2]  135 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      00923D CD 98 D7         [ 4]  136 	call skip_string 
      009240 85               [ 2]  137 	popw x 
      009241 F6               [ 1]  138 1$:	ld a,(x)
      009242 27 30            [ 1]  139 	jreq 9$
      009244 5C               [ 1]  140 	incw x 
      009245 A1 20            [ 1]  141 	cp a,#SPACE 
      009247 25 0E            [ 1]  142 	jrult 3$
      009249 90 F7            [ 1]  143 	ld (y),a
      00924B 90 5C            [ 1]  144 	incw y 
      00924D A1 5C            [ 1]  145 	cp a,#'\ 
      00924F 26 F0            [ 1]  146 	jrne 1$ 
      009251                        147 2$:
      009251 90 F7            [ 1]  148 	ld (y),a
      009253 90 5C            [ 1]  149 	incw y  
      009255 20 EA            [ 2]  150 	jra 1$
      009257 88               [ 1]  151 3$: push a 
      009258 A6 5C            [ 1]  152 	ld a,#'\
      00925A 90 F7            [ 1]  153 	ld (y),a 
      00925C 90 5C            [ 1]  154 	incw y  
      00925E 84               [ 1]  155 	pop a 
      00925F A0 07            [ 1]  156 	sub a,#7
      009261 C7 00 0F         [ 1]  157 	ld acc8,a 
      009264 72 5F 00 0E      [ 1]  158 	clr acc16
      009268 89               [ 2]  159 	pushw x
      009269 AE 8E 5F         [ 2]  160 	ldw x,#escaped 
      00926C 72 BB 00 0E      [ 2]  161 	addw x,acc16 
      009270 F6               [ 1]  162 	ld a,(x)
      009271 85               [ 2]  163 	popw x
      009272 20 DD            [ 2]  164 	jra 2$
      009274 A6 22            [ 1]  165 9$: ld a,#'"
      009276 90 F7            [ 1]  166 	ld (y),a 
      009278 90 5C            [ 1]  167 	incw y  
      00927A 5C               [ 1]  168 	incw x 
      00927B 81               [ 4]  169 	ret
                                    170 
                                    171 ;--------------------------
                                    172 ; return variable name 
                                    173 ; from its address.
                                    174 ; input:
                                    175 ;   X    variable address
                                    176 ; output:
                                    177 ;   A     variable letter
                                    178 ;--------------------------
      00927C                        179 var_name::
      00927C 1D 00 35         [ 2]  180 		subw x,#vars 
      00927F A6 03            [ 1]  181 		ld a,#3
      009281 62               [ 2]  182 		div x,a 
      009282 9F               [ 1]  183 		ld a,xl 
      009283 AB 41            [ 1]  184 		add a,#'A 
      009285 81               [ 4]  185 		ret 
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
      009286                        202 decompile::
      001206                        203 	_vars VSIZE
      009286 52 03            [ 2]    1     sub sp,#VSIZE 
      009288 C6 00 0B         [ 1]  204 	ld a,base
      00928B 6B 01            [ 1]  205 	ld (BASE_SAV,sp),a  
      00928D 17 02            [ 2]  206 	ldw (STR,sp),y   
      00928F 72 CE 00 05      [ 5]  207 	ldw x,[basicptr] ; line number 
      009293 35 0A 00 0B      [ 1]  208 	mov base,#10
      009297 72 5F 00 0D      [ 1]  209 	clr acc24 
      00929B CF 00 0E         [ 2]  210 	ldw acc16,x
      00929E 4F               [ 1]  211 	clr a ; unsigned conversion 
      00929F CD 99 3B         [ 4]  212 	call itoa  
      0092A2 A6 05            [ 1]  213 	ld a,#5 
      0092A4 CD 92 1B         [ 4]  214 	call right_align 
      0092A7 88               [ 1]  215 	push a 
      0092A8 90 93            [ 1]  216 1$:	ldw y,x ; source
      0092AA 1E 03            [ 2]  217 	ldw x,(STR+1,sp) ; destination
      0092AC CD 94 6F         [ 4]  218 	call strcpy 
      0092AF 90 5F            [ 1]  219 	clrw y 
      0092B1 84               [ 1]  220 	pop a 
      0092B2 90 97            [ 1]  221 	ld yl,a 
      0092B4 72 F9 02         [ 2]  222 	addw y,(STR,sp)
      0092B7 A6 20            [ 1]  223 	ld a,#SPACE 
      0092B9 90 F7            [ 1]  224 	ld (y),a 
      0092BB 90 5C            [ 1]  225 	incw y 
      0092BD AE 00 03         [ 2]  226 	ldw x,#3
      0092C0 CF 00 01         [ 2]  227 	ldw in.w,x 
      0092C3                        228 decomp_loop:
      0092C3 90 89            [ 2]  229 	pushw y
      0092C5 CD 98 BE         [ 4]  230 	call next_token 
      0092C8 90 85            [ 2]  231 	popw y 
      0092CA 4D               [ 1]  232 	tnz a  
      0092CB 26 03            [ 1]  233 	jrne 1$
      0092CD CC 93 E8         [ 2]  234 	jp 20$
      0092D0 2B 03            [ 1]  235 1$:	jrmi 2$
      0092D2 CC 93 61         [ 2]  236 	jp 6$
      0092D5                        237 2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR|TK_AND|TK_OR|TK_XOR 
      0092D5 A1 85            [ 1]  238 	cp a,#TK_VAR 
      0092D7 26 0F            [ 1]  239 	jrne 3$
                                    240 ;; TK_VAR 
      0092D9 CD 92 05         [ 4]  241 	call add_space
      0092DC CD 98 E6         [ 4]  242 	call get_addr   
      0092DF CD 92 7C         [ 4]  243 	call var_name
      0092E2 90 F7            [ 1]  244 	ld (y),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      0092E4 90 5C            [ 1]  245 	incw y  
      0092E6 20 DB            [ 2]  246 	jra decomp_loop
      0092E8                        247 3$:
      0092E8 A1 84            [ 1]  248 	cp a,#TK_INTGR
      0092EA 26 26            [ 1]  249 	jrne 4$
                                    250 ;; TK_INTGR
      0092EC CD 98 F0         [ 4]  251 	call get_int24 
      0092EF C7 00 0D         [ 1]  252 	ld acc24,a 
      0092F2 CF 00 0E         [ 2]  253 	ldw acc16,x 
      0092F5 CD 92 05         [ 4]  254 	call add_space
      0092F8 90 89            [ 2]  255 	pushw y 
      0092FA A6 FF            [ 1]  256 	ld a,#255 ; signed conversion 
      0092FC CD 99 3B         [ 4]  257 	call itoa  
      0092FF 16 01            [ 2]  258 	ldw y,(1,sp) 
      009301 88               [ 1]  259 	push a 
      009302 51               [ 1]  260 	exgw x,y 
      009303 CD 94 6F         [ 4]  261 	call strcpy 
      009306 90 5F            [ 1]  262 	clrw y
      009308 84               [ 1]  263 	pop a  
      009309 90 97            [ 1]  264 	ld yl,a 
      00930B 72 F9 01         [ 2]  265 	addw y,(1,sp)
      00128E                        266 	_drop 2 
      00930E 5B 02            [ 2]    1     addw sp,#2 
      009310 20 B1            [ 2]  267 	jra decomp_loop
      009312                        268 4$: ; dictionary keyword
      009312 A1 87            [ 1]  269 	cp a,#TK_NOT 
      009314 24 39            [ 1]  270 	jruge 50$ 
      009316 FE               [ 2]  271 	ldw x,(x)
      009317 72 5C 00 02      [ 1]  272 	inc in 
      00931B 72 5C 00 02      [ 1]  273 	inc in 
      00931F A3 A2 08         [ 2]  274 	cpw x,#remark 
      009322 26 23            [ 1]  275 	jrne 5$
      009324 CE 00 05         [ 2]  276 	ldw x,basicptr 
                                    277 ; copy comment to buffer 
      009327 CD 92 05         [ 4]  278 	call add_space
      00932A A6 27            [ 1]  279 	ld a,#''
      00932C 90 F7            [ 1]  280 	ld (y),a 
      00932E 90 5C            [ 1]  281 	incw y 
      009330                        282 46$:
      009330 72 D6 00 01      [ 4]  283 	ld a,([in.w],x)
      009334 72 5C 00 02      [ 1]  284 	inc in  
      009338 90 F7            [ 1]  285 	ld (y),a 
      00933A 90 5C            [ 1]  286 	incw y 
      00933C C6 00 02         [ 1]  287 	ld a,in 
      00933F C1 00 03         [ 1]  288 	cp a,count 
      009342 2B EC            [ 1]  289 	jrmi 46$
      009344 CC 93 E8         [ 2]  290 	jp 20$  
      009347 A3 9D B3         [ 2]  291 5$: cpw x,#let  
      00934A 26 05            [ 1]  292 	jrne 54$
      00934C CC 92 C3         [ 2]  293 	jp decomp_loop ; down display LET
      00934F                        294 50$:
      00934F 5F               [ 1]  295 	clrw x 
      009350 97               [ 1]  296 	ld xl,a 
      009351                        297 54$: ; insert command name 
      009351 CD 92 05         [ 4]  298 	call add_space  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009354 90 89            [ 2]  299 	pushw y
      009356 CD 94 1F         [ 4]  300 	call cmd_name
      009359 90 85            [ 2]  301 	popw y 
      00935B CD 91 ED         [ 4]  302 	call cpy_cmd_name
      00935E CC 92 C3         [ 2]  303 	jp decomp_loop 
      009361                        304 6$:
                                    305 ; label?
      009361 A1 03            [ 1]  306 	cp a,#TK_LABEL 
      009363 26 1E            [ 1]  307 	jrne 64$
                                    308 ; copy label string to output buffer   	
      009365 A6 20            [ 1]  309 	ld a,#32 
      009367 90 F7            [ 1]  310 	ld (y),a 
      009369 90 5C            [ 1]  311 	incw y 
      00936B                        312 61$:
      00936B 89               [ 2]  313 	pushw x 
      00936C CD 98 D7         [ 4]  314 	call skip_string 
      00936F 85               [ 2]  315 	popw x 
      009370                        316 62$:	
      009370 F6               [ 1]  317 	ld a,(x)
      009371 27 07            [ 1]  318 	jreq 63$ 
      009373 5C               [ 1]  319 	incw x  
      009374 90 F7            [ 1]  320 	ld (y),a 
      009376 90 5C            [ 1]  321 	incw y 
      009378 20 F6            [ 2]  322 	jra 62$ 
      00937A                        323 63$: 
      00937A A6 20            [ 1]  324 	ld a,#32 
      00937C 90 F7            [ 1]  325 	ld (y),a 
      00937E 90 5C            [ 1]  326 	incw y 
      009380 CC 92 C3         [ 2]  327 	jp decomp_loop
      009383                        328 64$:
      009383 A1 02            [ 1]  329 	cp a,#TK_QSTR 
      009385 26 09            [ 1]  330 	jrne 7$
                                    331 ;; TK_QSTR
      009387 CD 92 05         [ 4]  332 	call add_space
      00938A CD 92 36         [ 4]  333 	call cpy_quote  
      00938D CC 92 C3         [ 2]  334 	jp decomp_loop
      009390                        335 7$:
      009390 A1 04            [ 1]  336 	cp a,#TK_CHAR 
      009392 26 15            [ 1]  337 	jrne 9$
                                    338 ;; TK_CHAR
      009394 CD 92 05         [ 4]  339 	call add_space 
      009397 A6 5C            [ 1]  340 	ld a,#'\ 
      009399 90 F7            [ 1]  341 	ld (y),a 
      00939B 90 5C            [ 1]  342 	incw y
      00939D F6               [ 1]  343 	ld a,(x)
      00939E 72 5C 00 02      [ 1]  344 	inc in  
      0093A2                        345 8$:
      0093A2 90 F7            [ 1]  346 	ld (y),a 
      0093A4 90 5C            [ 1]  347 	incw y 
      0093A6                        348 82$:
      0093A6 CC 92 C3         [ 2]  349 	jp decomp_loop
      0093A9                        350 9$: 
      0093A9 A1 0A            [ 1]  351 	cp a,#TK_SEMIC 
      0093AB 22 0A            [ 1]  352 	jrugt 10$ 
      0093AD A0 05            [ 1]  353 	sub a,#TK_ARRAY 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      0093AF 5F               [ 1]  354 	clrw x 
      0093B0 97               [ 1]  355 	ld xl,a
      0093B1 1C 93 F9         [ 2]  356 	addw x,#single_char 
      0093B4 F6               [ 1]  357 	ld a,(x)
      0093B5 20 EB            [ 2]  358 	jra 8$ 
      0093B7                        359 10$: 
      0093B7 A1 11            [ 1]  360 	cp a,#TK_MINUS 
      0093B9 22 0A            [ 1]  361 	jrugt 11$
      0093BB A0 10            [ 1]  362 	sub a,#TK_PLUS 
      0093BD 5F               [ 1]  363 	clrw x 
      0093BE 97               [ 1]  364 	ld xl,a 
      0093BF 1C 93 FF         [ 2]  365 	addw x,#add_char 
      0093C2 F6               [ 1]  366 	ld a,(x)
      0093C3 20 DD            [ 2]  367 	jra 8$
      0093C5                        368 11$:
      0093C5 A1 22            [ 1]  369     cp a,#TK_MOD 
      0093C7 22 0A            [ 1]  370 	jrugt 12$
      0093C9 A0 20            [ 1]  371 	sub a,#TK_MULT
      0093CB 5F               [ 1]  372 	clrw x 
      0093CC 97               [ 1]  373 	ld xl,a 
      0093CD 1C 94 01         [ 2]  374 	addw x,#mul_char
      0093D0 F6               [ 1]  375 	ld a,(x)
      0093D1 20 CF            [ 2]  376 	jra 8$
      0093D3                        377 12$:
      0093D3 A0 31            [ 1]  378 	sub a,#TK_GT  
      0093D5 48               [ 1]  379 	sll a 
      0093D6 5F               [ 1]  380 	clrw x 
      0093D7 97               [ 1]  381 	ld xl,a 
      0093D8 1C 94 04         [ 2]  382 	addw x,#relop_str 
      0093DB FE               [ 2]  383 	ldw x,(x)
      0093DC F6               [ 1]  384 	ld a,(x)
      0093DD 5C               [ 1]  385 	incw x 
      0093DE 90 F7            [ 1]  386 	ld (y),a
      0093E0 90 5C            [ 1]  387 	incw y 
      0093E2 F6               [ 1]  388 	ld a,(x)
      0093E3 26 BD            [ 1]  389 	jrne 8$
      0093E5 CC 92 C3         [ 2]  390 	jp decomp_loop 
      0093E8                        391 20$: 
      0093E8 90 7F            [ 1]  392 	clr (y)
      0093EA 1E 02            [ 2]  393 	ldw x,(STR,sp)
      0093EC 7B 01            [ 1]  394 	ld a,(BASE_SAV,sp)
      0093EE C7 00 0B         [ 1]  395 	ld base,a 
      0093F1 72 F2 02         [ 2]  396 	subw y,(STR,sp) 
      0093F4 90 9F            [ 1]  397 	ld a,yl 
      001376                        398 	_drop VSIZE 
      0093F6 5B 03            [ 2]    1     addw sp,#VSIZE 
      0093F8 81               [ 4]  399 	ret 
                                    400 
      0093F9 40 28 29 2C 3A 3B      401 single_char: .byte '@','(',')',',',':',';' 
      0093FF 2B 2D                  402 add_char: .byte '+','-'
      009401 2A 2F 25               403 mul_char: .byte '*','/','%'
      009404 94 10 94 12 94 14 94   404 relop_str: .word gt,equal,ge,lt,ne,le 
             17 94 1C 94 19
      009410 3E 00                  405 gt: .asciz ">"
      009412 3D 00                  406 equal: .asciz "="
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009414 3E 3D 00               407 ge: .asciz ">="
      009417 3C 00                  408 lt: .asciz "<"
      009419 3C 3D 00               409 le: .asciz "<="
      00941C 3C 3E 00               410 ne:  .asciz "<>"
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
      00941F                        423 cmd_name:
      00139F                        424 	_vars VSIZE 
      00941F 52 04            [ 2]    1     sub sp,#VSIZE 
      009421 72 5F 00 0E      [ 1]  425 	clr acc16 
      009425 1F 01            [ 2]  426 	ldw (CODE_ADDR,sp),x  
      009427 AE B7 3B         [ 2]  427 	ldw x,#kword_dict	
      00942A 1F 03            [ 2]  428 1$:	ldw (LINK,sp),x
      00942C E6 02            [ 1]  429 	ld a,(2,x)
      00942E A4 0F            [ 1]  430 	and a,#15 
      009430 C7 00 0F         [ 1]  431 	ld acc8,a 
      009433 1C 00 03         [ 2]  432 	addw x,#3
      009436 72 BB 00 0E      [ 2]  433 	addw x,acc16
      00943A FE               [ 2]  434 	ldw x,(x) ; code address   
      00943B 13 01            [ 2]  435 	cpw x,(CODE_ADDR,sp)
      00943D 27 0C            [ 1]  436 	jreq 2$
      00943F 1E 03            [ 2]  437 	ldw x,(LINK,sp)
      009441 FE               [ 2]  438 	ldw x,(x) 
      009442 1D 00 02         [ 2]  439 	subw x,#2  
      009445 26 E3            [ 1]  440 	jrne 1$
      009447 4F               [ 1]  441 	clr a 
      009448 5F               [ 1]  442 	clrw x 
      009449 20 05            [ 2]  443 	jra 9$
      00944B 1E 03            [ 2]  444 2$: ldw x,(LINK,sp)
      00944D 1C 00 02         [ 2]  445 	addw x,#2 	
      0013D0                        446 9$:	_drop VSIZE
      009450 5B 04            [ 2]    1     addw sp,#VSIZE 
      009452 81               [ 4]  447 	ret
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
                           000001     5 DEBUG=1 ; set to 1 to include debugging code 
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
      009453                        119 strlen::
      009453 89               [ 2]  120 	pushw x 
      009454 4F               [ 1]  121 	clr a
      009455 7D               [ 1]  122 1$:	tnz (x) 
      009456 27 04            [ 1]  123 	jreq 9$ 
      009458 4C               [ 1]  124 	inc a 
      009459 5C               [ 1]  125 	incw x 
      00945A 20 F9            [ 2]  126 	jra 1$ 
      00945C 85               [ 2]  127 9$:	popw x 
      00945D 81               [ 4]  128 	ret 
                                    129 
                                    130 ;------------------------------------
                                    131 ; compare 2 strings
                                    132 ; input:
                                    133 ;   X 		char* first string 
                                    134 ;   Y       char* second string 
                                    135 ; output:
                                    136 ;   A 		0 not == |1 ==  
                                    137 ;-------------------------------------
      00945E                        138 strcmp:
      00945E F6               [ 1]  139 	ld a,(x)
      00945F 27 0B            [ 1]  140 	jreq 5$ 
      009461 90 F1            [ 1]  141 	cp a,(y) 
      009463 26 05            [ 1]  142 	jrne 4$ 
      009465 5C               [ 1]  143 	incw x 
      009466 90 5C            [ 1]  144 	incw y 
      009468 20 F4            [ 2]  145 	jra strcmp 
      00946A                        146 4$: ; not same  
      00946A 4F               [ 1]  147 	clr a 
      00946B 81               [ 4]  148 	ret 
      00946C                        149 5$: ; same 
      00946C A6 01            [ 1]  150 	ld a,#1 
      00946E 81               [ 4]  151 	ret 
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
      00946F                        162 strcpy::
      00946F 88               [ 1]  163 	push a 
      009470 89               [ 2]  164 	pushw x 
      009471 90 F6            [ 1]  165 1$: ld a,(y)
      009473 27 06            [ 1]  166 	jreq 9$ 
      009475 F7               [ 1]  167 	ld (x),a 
      009476 5C               [ 1]  168 	incw x 
      009477 90 5C            [ 1]  169 	incw y 
      009479 20 F6            [ 2]  170 	jra 1$ 
      00947B 7F               [ 1]  171 9$:	clr (x)
      00947C 85               [ 2]  172 	popw x 
      00947D 84               [ 1]  173 	pop a 
      00947E 81               [ 4]  174 	ret 
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
      00947F                        188 move::
      00947F 88               [ 1]  189 	push a 
      001400                        190 	_vars VSIZE 
      009480 52 02            [ 2]    1     sub sp,#VSIZE 
      009482 0F 01            [ 1]  191 	clr (INCR,sp)
      009484 0F 02            [ 1]  192 	clr (LB,sp)
      009486 90 89            [ 2]  193 	pushw y 
      009488 13 01            [ 2]  194 	cpw x,(1,sp) ; compare DEST to SRC 
      00948A 90 85            [ 2]  195 	popw y 
      00948C 27 31            [ 1]  196 	jreq move_exit ; x==y 
      00948E 2B 0E            [ 1]  197 	jrmi move_down
      009490                        198 move_up: ; start from top address with incr=-1
      009490 72 BB 00 0E      [ 2]  199 	addw x,acc16
      009494 72 B9 00 0E      [ 2]  200 	addw y,acc16
      009498 03 01            [ 1]  201 	cpl (INCR,sp)
      00949A 03 02            [ 1]  202 	cpl (LB,sp)   ; increment = -1 
      00949C 20 05            [ 2]  203 	jra move_loop  
      00949E                        204 move_down: ; start from bottom address with incr=1 
      00949E 5A               [ 2]  205     decw x 
      00949F 90 5A            [ 2]  206 	decw y
      0094A1 0C 02            [ 1]  207 	inc (LB,sp) ; incr=1 
      0094A3                        208 move_loop:	
      0094A3 C6 00 0E         [ 1]  209     ld a, acc16 
      0094A6 CA 00 0F         [ 1]  210 	or a, acc8
      0094A9 27 14            [ 1]  211 	jreq move_exit 
      0094AB 72 FB 01         [ 2]  212 	addw x,(INCR,sp)
      0094AE 72 F9 01         [ 2]  213 	addw y,(INCR,sp) 
      0094B1 90 F6            [ 1]  214 	ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      0094B3 F7               [ 1]  215 	ld (x),a 
      0094B4 89               [ 2]  216 	pushw x 
      0094B5 CE 00 0E         [ 2]  217 	ldw x,acc16 
      0094B8 5A               [ 2]  218 	decw x 
      0094B9 CF 00 0E         [ 2]  219 	ldw acc16,x 
      0094BC 85               [ 2]  220 	popw x 
      0094BD 20 E4            [ 2]  221 	jra move_loop
      0094BF                        222 move_exit:
      00143F                        223 	_drop VSIZE
      0094BF 5B 02            [ 2]    1     addw sp,#VSIZE 
      0094C1 84               [ 1]  224 	pop a 
      0094C2 81               [ 4]  225 	ret 	
                                    226 
                                    227 ;------------------------------------
                                    228 ;  set all variables to zero 
                                    229 ; input:
                                    230 ;   none 
                                    231 ; output:
                                    232 ;	none
                                    233 ;------------------------------------
      0094C3                        234 clear_vars:
      0094C3 89               [ 2]  235 	pushw x 
      0094C4 88               [ 1]  236 	push a  
      0094C5 AE 00 35         [ 2]  237 	ldw x,#vars 
      0094C8 A6 4E            [ 1]  238 	ld a,#CELL_SIZE*26 
      0094CA 7F               [ 1]  239 1$:	clr (x)
      0094CB 5C               [ 1]  240 	incw x 
      0094CC 4A               [ 1]  241 	dec a 
      0094CD 26 FB            [ 1]  242 	jrne 1$
      0094CF 84               [ 1]  243 	pop a 
      0094D0 85               [ 2]  244 	popw x 
      0094D1 81               [ 4]  245 	ret 
                                    246 
                                    247 
                                    248 ;-----------------------
                                    249 ;  display system 
                                    250 ;  information 
                                    251 ;-----------------------
                           000002   252 	MAJOR=2
                           000000   253 	MINOR=0 
      0094D2 0A 0A 54 69 6E 79 20   254 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
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
      009518                        256 system_information:
      009518 AE 94 D2         [ 2]  257 	ldw x,#software 
      00951B CD 8A 24         [ 4]  258 	call puts 
      00951E A6 02            [ 1]  259 	ld a,#MAJOR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      009520 C7 00 0F         [ 1]  260 	ld acc8,a 
      009523 5F               [ 1]  261 	clrw x 
      009524 CF 00 0D         [ 2]  262 	ldw acc24,x
      009527 35 0A 00 0B      [ 1]  263 	mov base, #10 
      00952B CD 99 1D         [ 4]  264 	call prt_acc24 
      00952E A6 2E            [ 1]  265 	ld a,#'.
      009530 CD 89 C7         [ 4]  266 	call putc 
      009533 A6 00            [ 1]  267 	ld a,#MINOR 
      009535 C7 00 0F         [ 1]  268 	ld acc8,a 
      009538 5F               [ 1]  269 	clrw x 
      009539 CF 00 0D         [ 2]  270 	ldw acc24,x 
      00953C CD 99 1D         [ 4]  271 	call prt_acc24
      00953F A6 0D            [ 1]  272 	ld a,#CR 
      009541 CD 89 C7         [ 4]  273 	call putc
                                    274 ;call test 
      009544 81               [ 4]  275 	ret
                                    276 
      009545                        277 warm_init:
      009545 90 AE 17 73      [ 2]  278 	ldw y,#XSTACK_EMPTY  
      009549 72 5F 00 23      [ 1]  279 	clr flags 
      00954D 72 5F 00 20      [ 1]  280 	clr loop_depth 
      009551 35 0A 00 0B      [ 1]  281 	mov base,#10 
      009555 AE 00 00         [ 2]  282 	ldw x,#0 
      009558 CF 00 05         [ 2]  283 	ldw basicptr,x 
      00955B CF 00 01         [ 2]  284 	ldw in.w,x 
      00955E 72 5F 00 03      [ 1]  285 	clr count
      009562 81               [ 4]  286 	ret 
                                    287 
                                    288 ;---------------------------
                                    289 ; reset BASIC text variables 
                                    290 ; and clear variables 
                                    291 ;---------------------------
      009563                        292 clear_basic:
      009563 89               [ 2]  293 	pushw x 
      009564 72 5F 00 03      [ 1]  294 	clr count
      009568 72 5F 00 02      [ 1]  295 	clr in  
      00956C AE 00 90         [ 2]  296 	ldw x,#free_ram 
      00956F CF 00 1C         [ 2]  297 	ldw txtbgn,x 
      009572 CF 00 1E         [ 2]  298 	ldw txtend,x 
      009575 CF 00 30         [ 2]  299 	ldw dvar_bgn,x 
      009578 CF 00 32         [ 2]  300 	ldw dvar_end,x 
      00957B CD 94 C3         [ 4]  301 	call clear_vars 
      00957E 72 5F 00 34      [ 1]  302 	clr chain_level
      009582 85               [ 2]  303 	popw x
      009583 81               [ 4]  304 	ret 
                                    305 
                                    306 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    307 ;;   Tiny BASIC error messages     ;;
                                    308 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009584                        309 err_msg:
      009584 00 00 95 AA 95 C1 95   310 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             CF 95 E8 95 F7
      009590 96 0D 96 23 96 3D 96   311 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             4E 96 5F
      00959A 96 6B 96 9E 96 AE 96   312 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal  C2-Bits]



             42 16 55
      0095A2 96 D5 96 E2 96 EC      313 	.word err_overflow,err_read_only,err_not_program  
                                    314 
      0095A8 97 08 52 65 6A 65 63   315 err_mem_full: .asciz "Rejected, memory full\n" 
             74 65 64 2C 20 6D 65
             6D 6F 72 79 20 66 75
             6C 6C
      0095BF 0A 00 73 79 6E 74 61   316 err_syntax: .asciz "syntax error\n" 
             78 20 65 72 72 6F 72
      0095CD 0A 00 6D 61 74 68 20   317 err_math_ovf: .asciz "math operation overflow\n"
             6F 70 65 72 61 74 69
             6F 6E 20 6F 76 65 72
             66 6C 6F 77
      0095E6 0A 00 64 69 76 69 73   318 err_div0: .asciz "division by 0\n" 
             69 6F 6E 20 62 79 20
             30
      0095F5 0A 00 69 6E 76 61 6C   319 err_no_line: .asciz "invalid line number.\n"
             69 64 20 6C 69 6E 65
             20 6E 75 6D 62 65 72
             2E
      00960B 0A 00 72 75 6E 20 74   320 err_run_only: .asciz "run time only usage.\n" 
             69 6D 65 20 6F 6E 6C
             79 20 75 73 61 67 65
             2E
      009621 0A 00 63 6F 6D 6D 61   321 err_cmd_only: .asciz "command line only usage.\n"
             6E 64 20 6C 69 6E 65
             20 6F 6E 6C 79 20 75
             73 61 67 65 2E
      00963B 0A 00 64 75 70 6C 69   322 err_duplicate: .asciz "duplicate name.\n"
             63 61 74 65 20 6E 61
             6D 65 2E
      00964C 0A 00 46 69 6C 65 20   323 err_not_file: .asciz "File not found.\n"
             6E 6F 74 20 66 6F 75
             6E 64 2E
      00965D 0A 00 62 61 64 20 76   324 err_bad_value: .asciz "bad value.\n"
             61 6C 75 65 2E
      009669 0A 00 46 69 6C 65 20   325 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             69 6E 20 65 78 74 65
             6E 64 65 64 20 6D 65
             6D 6F 72 79 2C 20 63
             61 6E 27 74 20 62 65
             20 72 75 6E 20 66 72
             6F 6D 20 74 68 65 72
             65 2E
      00969C 0A 00 4E 6F 20 64 61   326 err_no_data: .asciz "No data found.\n"
             74 61 20 66 6F 75 6E
             64 2E
      0096AC 0A 00 4E 6F 20 70 72   327 err_no_prog: .asciz "No program in RAM!\n"
             6F 67 72 61 6D 20 69
             6E 20 52 41 4D 21
      0096C0 0A 00 46 69 6C 65 20   328 err_no_fspace: .asciz "File system full.\n" 
             73 79 73 74 65 6D 20
             66 75 6C 6C 2E
      0096D3 0A 00 42 75 66 66 65   329 err_buf_full: .asciz "Buffer full\n"
             72 20 66 75 6C 6C
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      0096E0 0A 00 6F 76 65 72 66   330 err_overflow: .asciz "overflow\n" 
             6C 6F 77
      0096EA 0A 00 63 6F 6E 73 74   331 err_read_only: .asciz "constant can't be modified\n"
             61 6E 74 20 63 61 6E
             27 74 20 62 65 20 6D
             6F 64 69 66 69 65 64
      009706 0A 00 6E 6F 20 70 72   332 err_not_program: .asciz "no program at this address\n"
             6F 67 72 61 6D 20 61
             74 20 74 68 69 73 20
             61 64 64 72 65 73 73
                                    333 
                                    334 ;-------------------------------------
      009722 0A 00 0A 72 75 6E 20   335 rt_msg: .asciz "\nrun time error, "
             74 69 6D 65 20 65 72
             72 6F 72 2C
      009734 20 00 0A 63 6F 6D 70   336 comp_msg: .asciz "\ncompile error, "
             69 6C 65 20 65 72 72
             6F 72 2C
      009745 20 00 6C 61 73 74 20   337 tk_id: .asciz "last token id: "
             74 6F 6B 65 6E 20 69
             64 3A
                                    338 
      0016D7                        339 syntax_error::
      009755 20 00            [ 1]  340 	ld a,#ERR_SYNTAX 
                                    341 
      009757                        342 tb_error::
      009757 A6 02 00 22 4C   [ 2]  343 	btjt flags,#FCOMP,1$
      009759 88               [ 1]  344 	push a 
      009759 72 0A 00         [ 2]  345 	ldw x, #rt_msg 
      00975C 23 4C 88         [ 4]  346 	call puts 
      00975F AE               [ 1]  347 	pop a 
      009760 97 24 CD         [ 2]  348 	ldw x, #err_msg 
      009763 8A 24 84 AE      [ 1]  349 	clr acc16 
      009767 95               [ 1]  350 	sll a
      009768 84 72 5F 00      [ 1]  351 	rlc acc16  
      00976C 0E 48 72         [ 1]  352 	ld acc8, a 
      00976F 59 00 0E C7      [ 2]  353 	addw x,acc16 
      009773 00               [ 2]  354 	ldw x,(x)
      009774 0F 72 BB         [ 4]  355 	call puts
      009777 00 0E FE         [ 2]  356 	ldw x,basicptr 
                           000001   357 .if DEBUG 
      00977A CD 8A 24         [ 1]  358 ld a,count 
      00977D CE 00            [ 1]  359 clrw y 
      00977F 05 C6            [ 1]  360 rlwa y  
      009781 00 03 90         [ 4]  361 call hex_dump
      009784 5F 90 02         [ 2]  362 ldw x,basicptr
                                    363 .endif 
      009787 CD 87 1B         [ 1]  364 	ld a,in 
      00978A CE 00 05         [ 4]  365 	call prt_basic_line
      00978D C6 00 02         [ 2]  366 	ldw x,#tk_id 
      009790 CD A0 A9         [ 4]  367 	call puts 
      009793 AE 97 47         [ 1]  368 	ld a,in.saved 
      009796 CD               [ 1]  369 	clrw x 
      009797 8A               [ 1]  370 	ld xl,a 
      009798 24 C6 00 04      [ 2]  371 	addw x,basicptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00979C 5F               [ 1]  372 	ld a,(x)
      00979D 97               [ 1]  373 	clrw x 
      00979E 72               [ 1]  374 	ld xl,a 
      00979F BB 00 05         [ 4]  375 	call prt_i16
      0097A2 F6 5F            [ 2]  376 	jra 6$
      00172A                        377 1$:	
      0097A4 97               [ 1]  378 	push a 
      0097A5 CD 99 06         [ 2]  379 	ldw x,#comp_msg
      0097A8 20 35 A4         [ 4]  380 	call puts 
      0097AA 84               [ 1]  381 	pop a 
      0097AA 88 AE 97         [ 2]  382 	ldw x, #err_msg 
      0097AD 36 CD 8A 24      [ 1]  383 	clr acc16 
      0097B1 84               [ 1]  384 	sll a
      0097B2 AE 95 84 72      [ 1]  385 	rlc acc16  
      0097B6 5F 00 0E         [ 1]  386 	ld acc8, a 
      0097B9 48 72 59 00      [ 2]  387 	addw x,acc16 
      0097BD 0E               [ 2]  388 	ldw x,(x)
      0097BE C7 00 0F         [ 4]  389 	call puts
      0097C1 72 BB 00         [ 2]  390 	ldw x,#tib
      0097C4 0E FE CD         [ 4]  391 	call puts 
      0097C7 8A 24            [ 1]  392 	ld a,#CR 
      0097C9 AE 16 68         [ 4]  393 	call putc
      0097CC CD 8A 24         [ 2]  394 	ldw x,in.w
      0097CF A6 0D CD         [ 4]  395 	call spaces
      0097D2 89 C7            [ 1]  396 	ld a,#'^
      0097D4 CE 00 01         [ 4]  397 	call putc 
      0097D7 CD 8A 91         [ 2]  398 6$: ldw x,#STACK_EMPTY 
      0097DA A6               [ 1]  399     ldw sp,x
                                    400 
      001763                        401 warm_start:
      0097DB 5E CD 89         [ 4]  402 	call warm_init
                                    403 ;----------------------------
                                    404 ;   BASIC interpreter
                                    405 ;----------------------------
      001766                        406 cmd_line: ; user interface 
      0097DE C7 AE            [ 1]  407 	ld a,#CR 
      0097E0 17 FF 94         [ 4]  408 	call putc 
      0097E3 A6 3E            [ 1]  409 	ld a,#'> 
      0097E3 CD 95 45         [ 4]  410 	call putc
      0097E6 CD 0A A9         [ 4]  411 	call readln
      0097E6 A6 0D CD 89      [ 1]  412 	tnz count 
      0097EA C7 A6            [ 1]  413 	jreq cmd_line
      0097EC 3E CD 89         [ 4]  414 	call compile
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
      0097EF C7 CD 8B 29      [ 1]  428 	tnz count 
      0097F3 72 5D            [ 1]  429 	jreq cmd_line
                                    430 	
                                    431 ; if direct command 
                                    432 ; it's ready to interpret 
                                    433 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    434 ;; This is the interpreter loop
                                    435 ;; for each BASIC code line. 
                                    436 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      001782                        437 interpreter: 
      0097F5 00 03 27         [ 1]  438 	ld a,in 
      0097F8 ED CD 91         [ 1]  439 	cp a,count 
      0097FB 71 72            [ 1]  440 	jrmi interp_loop
      00178A                        441 next_line:
      0097FD 5D 00 03 27 E4   [ 2]  442 	btjf flags, #FRUN, cmd_line
      009802 CE 00 04         [ 2]  443 	ldw x,basicptr
      009802 C6 00 02 C1      [ 2]  444 	addw x,in.w 
      009806 00 03 2B         [ 2]  445 	cpw x,txtend 
      009809 20 03            [ 1]  446 	jrmi 0$
      00980A CD 25 D8         [ 4]  447 	call cmd_end 
      00980A 72 01 00         [ 2]  448 0$:	ldw basicptr,x ; start of next line  
      00980D 23 D7            [ 1]  449 	ld a,(2,x)
      00980F CE 00 05         [ 1]  450 	ld count,a 
      009812 72 BB 00 01      [ 1]  451 	mov in,#3 ; skip first 3 bytes of line 
      0017AA                        452 interp_loop:
      009816 C3 00 1E         [ 4]  453 	call next_token
      009819 2B 03            [ 1]  454 	cp a,#TK_NONE 
      00981B CD A6            [ 1]  455 	jreq next_line 
      00981D 58 CF            [ 1]  456 	cp a,#TK_CMD
      00981F 00 05            [ 1]  457 	jrne 1$
      0017B5                        458 	_get_code_addr
      009821 E6               [ 2]    1         ldw x,(x)
      009822 02 C7 00 03      [ 1]    2         inc in 
      009826 35 03 00 02      [ 1]    3         inc in 
      00982A FD               [ 4]  459 	call(x)
      00982A CD 98            [ 2]  460 	jra interp_loop 
      0017C1                        461 1$:	 
      00982C BE A1            [ 1]  462 	cp a,#TK_VAR
      00982E 00 27            [ 1]  463 	jrne 2$
      009830 D9 A1 80         [ 4]  464 	call let_var  
      009833 26 0C            [ 2]  465 	jra interp_loop 
      0017CA                        466 2$:	
      009835 FE 72            [ 1]  467 	cp a,#TK_ARRAY 
      009837 5C 00            [ 1]  468 	jrne 3$
      009839 02 72 5C         [ 4]  469 	call let_array 
      00983C 00 02            [ 2]  470 	jra interp_loop
      0017D3                        471 3$:	
      00983E FD 20            [ 1]  472 	cp a,#TK_LABEL
      009840 E9 05            [ 1]  473 	jrne 4$
      009841 CD 17 E3         [ 4]  474 	call let_dvar  
      009841 A1 85            [ 2]  475 	jra interp_loop 
      0017DC                        476 4$: 
      009843 26 05            [ 1]  477 	cp a,#TK_COLON 
      009845 CD 9D            [ 1]  478 	jreq interp_loop
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      009847 C6 20 E0         [ 2]  479 5$:	jp syntax_error 
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
      00984A                        492 let_dvar:
      0017E3                        493 	_vars VSIZE 
      00984A A1 05            [ 2]    1     sub sp,#VSIZE 
      00984C 26 05            [ 2]  494 	ldw (VAR_NAME,sp),x
      00984E CD 9D            [ 1]  495 	clr (REC_LEN,sp) 
      009850 C1 20 D7         [ 4]  496 	call skip_string 
      009853 CE 00 04         [ 2]  497 	ldw x,basicptr 
      009853 A1 03 26 05      [ 2]  498 	addw x,in.w 
      009857 CD               [ 1]  499 	ld a,(x)
      009858 98 63            [ 1]  500 	cp a,#TK_EQUAL 
      00985A 20 CE            [ 1]  501 	jrne 9$ 
                                    502 ; dvar assignment 
      00985C 72 5C 00 01      [ 1]  503 	inc in  
      00985C A1 09 27         [ 4]  504 	call condition  
      00985F CA CC            [ 1]  505 	cp a,#TK_INTGR 
      009861 97 57            [ 1]  506 	jreq 1$ 
      009863 CC 16 D7         [ 2]  507 0$:	jp syntax_error 
      001806                        508 1$: 
      009863 52 04            [ 2]  509 	ldw x,(VAR_NAME,sp) ; pointer to var name 
      009865 1F 01 0F         [ 4]  510 	call strlen 
      009868 03 CD            [ 1]  511 	add a,#REC_XTRA_BYTES
      00986A 98 D7            [ 1]  512 	ld (REC_LEN+1,sp),a 
      00986C CE 00 05         [ 4]  513 	call search_name 
      00986F 72               [ 2]  514 	tnzw x 
      009870 BB 00            [ 1]  515 	jreq 0$ 
      009872 01               [ 1]  516 	ld a,(x)
      009873 F6 A1            [ 1]  517 	jrpl 2$
      009875 32 26            [ 1]  518 	ld a,#ERR_RD_ONLY 
      009877 43 72 5C         [ 2]  519 	jp tb_error 
      00181D                        520 2$:
      00987A 00 02 CD         [ 2]  521 	addw x,(REC_LEN,sp)
      00987D 9C F4 A1         [ 2]  522 	subw x,#CELL_SIZE 
      009880 84 27 03         [ 2]  523 	ldw ptr16,x
      001826                        524 	_xpop 
      009883 CC 97            [ 1]    1     ld a,(y)
      009885 57               [ 1]    2     ldw x,y 
      009886 EE 01            [ 2]    3     ldw x,(1,x)
      009886 1E 01 CD 94      [ 2]    4     addw y,#CELL_SIZE 
      00988A 53 AB 05 6B      [ 4]  525 	ld [ptr16],a 
      00988E 04 CD 9E 30      [ 1]  526 	inc ptr8 
      009892 5D 27 EE F6      [ 5]  527 	ldw [ptr16],x 
      00183B                        528 9$: _drop VSIZE 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      009896 2A 05            [ 2]    1     addw sp,#VSIZE 
      009898 A6               [ 4]  529 	ret 
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
      00183E                        541 next_token::
                                    542 ;	clrw x 
      009899 11 CC 97         [ 1]  543 	ld a,in 
      00989C 59 00 03         [ 1]  544 	ld in.saved,a ; in case "_unget_token" needed 
                                    545 ; don't replace sub by "cp a,count" 
                                    546 ; if end of line must return with A=0   	
      00989D C0 00 02         [ 1]  547 	sub a,count 
      00989D 72 FB            [ 1]  548 	jreq 9$ ; end of line 
      001849                        549 0$: 
      00989F 03 1D 00         [ 2]  550 	ldw x,basicptr 
      0098A2 03 CF 00 1A      [ 2]  551 	addw x,in.w 
      0098A6 90               [ 1]  552 	ld a,(x)
      0098A7 F6               [ 1]  553 	incw x
      0098A8 93 EE 01 72      [ 1]  554 	inc in   
      0098AC A9               [ 4]  555 9$: ret 
                                    556 
                                    557 ;-------------------------
                                    558 ;  skip .asciz in BASIC line 
                                    559 ;  name 
                                    560 ;  input:
                                    561 ;     x		* string 
                                    562 ;  output:
                                    563 ;     none 
                                    564 ;-------------------------
      001857                        565 skip_string:
      0098AD 00               [ 1]  566 	ld a,(x)
      0098AE 03 72            [ 1]  567 	jreq 1$
      0098B0 C7               [ 1]  568 	incw x 
      0098B1 00 1A            [ 2]  569 	jra skip_string 
      0098B3 72               [ 1]  570 1$: incw x 	
      0098B4 5C 00 1B 72      [ 2]  571 	subw x,basicptr 
      0098B8 CF 00 1A         [ 2]  572 	ldw in.w,x 
      0098BB 5B               [ 4]  573 	ret 
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
      001866                        584 get_addr:
      0098BC 04               [ 2]  585 	ldw x,(x)
      0098BD 81 5C 00 01      [ 1]  586 	inc in 
      0098BE 72 5C 00 01      [ 1]  587 	inc in 
      0098BE C6               [ 4]  588 	ret 
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
      001870                        599 get_int24:
      0098BF 00               [ 1]  600 	ld a,(x)
      0098C0 02 C7            [ 2]  601 	ldw x,(1,x)
                                    602 ; skip 3 bytes 
      0098C2 00 04 C0 00      [ 1]  603 	inc in 
      0098C6 03 27 0D 01      [ 1]  604 	inc in 
      0098C9 72 5C 00 01      [ 1]  605 	inc in 
      0098C9 CE               [ 4]  606 	ret 
                                    607 
                                    608 ;-------------------------
                                    609 ; get character from 
                                    610 ; BASIC code 
                                    611 ; input:
                                    612 ;    X   *char 
                                    613 ; output:
                                    614 ;    A    char 
                                    615 ;-------------------------
      001880                        616 get_char:
      0098CA 00               [ 1]  617 	ld a,(x)
      0098CB 05 72 BB 00      [ 1]  618 	inc in  
      0098CF 01               [ 4]  619     ret 
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
      001886                        631 prt_i16:
      0098D0 F6 5C 72 5C      [ 1]  632 	clr acc24 
      0098D4 00 02 81         [ 2]  633 	ldw acc16,x 
      0098D7 A6 10            [ 1]  634 	ld a,#16
      0098D7 F6 27 03         [ 1]  635 	cp a,base
      0098DA 5C 20            [ 1]  636 	jreq prt_acc24  
      0098DC FA 5C 72 B0 00   [ 2]  637 	btjf acc16,#7,prt_acc24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      0098E1 05 CF 00 01      [ 1]  638 	cpl acc24 ; sign extend 
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
      00189D                        649 prt_acc24:
      0098E5 81 FF            [ 1]  650 	ld a,#255  ; signed conversion  
      0098E6 CD 18 BB         [ 4]  651     call itoa  ; conversion entier en  .asciz
      0098E6 FE               [ 1]  652 	push a 
      0098E7 72 5C 00         [ 4]  653 	call puts
      0098EA 02               [ 1]  654 	pop a 
      0098EB 72               [ 4]  655     ret	
                                    656 
                                    657 ;---------------------------------------
                                    658 ;  print value at xstack top 
                                    659 ;---------------------------------------
      0018A8                        660 print_top: 
      0018A8                        661 	_xpop 
      0098EC 5C 00            [ 1]    1     ld a,(y)
      0098EE 02               [ 1]    2     ldw x,y 
      0098EF 81 01            [ 2]    3     ldw x,(1,x)
      0098F0 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0098F0 F6 EE 01         [ 1]  662 	ld acc24,a 
      0098F3 72 5C 00         [ 2]  663 	ldw acc16,x 
      0098F6 02 72 5C         [ 4]  664 	call prt_acc24 
      0098F9 00               [ 4]  665 	ret 
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
      0018BB                        681 itoa::
      0018BB                        682 	_vars VSIZE
      0098FA 02 72            [ 2]    1     sub sp,#VSIZE 
      0098FC 5C 00            [ 1]  683 	clr (LEN,sp) ; string length  
      0098FE 02 81            [ 1]  684 	clr (SIGN,sp)    ; sign
      009900 4D               [ 1]  685 	tnz A
      009900 F6 72            [ 1]  686 	jreq 1$ ; unsigned conversion  
      009902 5C 00 02         [ 1]  687 	ld a,base 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      009905 81 0A            [ 1]  688 	cp a,#10
      009906 26 0A            [ 1]  689 	jrne 1$
                                    690 	; base 10 string display with negative sign if bit 23==1
      009906 72 5F 00 0D CF   [ 2]  691 	btjf acc24,#7,1$
      00990B 00 0E            [ 1]  692 	cpl (SIGN,sp)
      00990D A6 10 C1         [ 4]  693 	call neg_acc24
      0018D5                        694 1$:
                                    695 ; initialize string pointer 
      009910 00 0B 27         [ 2]  696 	ldw x,#tib 
      009913 09 72 0F         [ 2]  697 	addw x,#TIB_SIZE
      009916 00               [ 2]  698 	decw x 
      009917 0E               [ 1]  699 	clr (x)
      0018DD                        700 itoa_loop:
      009918 04 72 53         [ 1]  701     ld a,base
      00991B 00 0D E9         [ 4]  702     call divu24_8 ; acc24/A 
      00991D AB 30            [ 1]  703     add a,#'0  ; remainder of division
      00991D A6 FF            [ 1]  704     cp a,#'9+1
      00991F CD 99            [ 1]  705     jrmi 2$
      009921 3B 88            [ 1]  706     add a,#7 
      0018EB                        707 2$:	
      009923 CD               [ 2]  708 	decw x
      009924 8A               [ 1]  709     ld (x),a
      009925 24 84            [ 1]  710 	inc (LEN,sp)
                                    711 	; if acc24==0 conversion done
      009927 81 00 0C         [ 1]  712 	ld a,acc24
      009928 CA 00 0D         [ 1]  713 	or a,acc16
      009928 90 F6 93         [ 1]  714 	or a,acc8
      00992B EE 01            [ 1]  715     jrne itoa_loop
                                    716 	;conversion done, next add '$' or '-' as required
      00992D 72 A9 00         [ 1]  717 	ld a,base 
      009930 03 C7            [ 1]  718 	cp a,#16
      009932 00 0D            [ 1]  719 	jreq 8$
      009934 CF 00            [ 1]  720 	ld a,(SIGN,sp)
      009936 0E CD            [ 1]  721     jreq 10$
      009938 99 1D            [ 1]  722     ld a,#'-
      00993A 81 02            [ 2]  723 	jra 9$ 
      00993B                        724 8$:	
      00993B 52 04            [ 1]  725 	ld a,#'$ 
      00993D 0F               [ 2]  726 9$: decw x
      00993E 02               [ 1]  727     ld (x),a
      00993F 0F 01            [ 1]  728 	inc (LEN,sp)
      00190F                        729 10$:
                                    730 ; add a space
      009941 4D               [ 2]  731 	decw x 
      009942 27 11            [ 1]  732 	ld a,#SPACE 
      009944 C6               [ 1]  733 	ld (x),a
      009945 00 0B            [ 1]  734 	ld a,(LEN,sp)
      009947 A1               [ 1]  735 	inc a 
      001916                        736 	_drop VSIZE
      009948 0A 26            [ 2]    1     addw sp,#VSIZE 
      00994A 0A               [ 4]  737 	ret
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
      001919                        746 to_upper::
      00994B 72 0F            [ 1]  747 	cp a,#'a
      00994D 00 0D            [ 1]  748 	jrpl 1$
      00994F 05               [ 4]  749 0$:	ret
      009950 03 01            [ 1]  750 1$: cp a,#'z	
      009952 CD 82            [ 1]  751 	jrugt 0$
      009954 9D 20            [ 1]  752 	sub a,#32
      009955 81               [ 4]  753 	ret
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
      001925                        769 atoi24::
      001925                        770 	_vars VSIZE
      009955 AE 16            [ 2]    1     sub sp,#VSIZE 
      009957 68 1C            [ 2]  771 	ldw (XTEMP,sp),x 
                                    772 ; conversion made on xstack 
      009959 00               [ 1]  773 	clr a 
      00995A 50               [ 1]  774 	clrw x 
      00192B                        775 	_xpush 
      00995B 5A 7F 00 03      [ 2]    1     subw y,#CELL_SIZE
      00995D 90 F7            [ 1]    2     ld (y),a 
      00995D C6 00 0B         [ 2]    3     ldw (1,y),x 
      009960 CD 83            [ 1]  776 	clr (SIGN,sp)
      009962 69 AB            [ 1]  777 	ld a,#10
      009964 30 A1            [ 1]  778 	ld (BASE,sp),a ; default base decimal
      009966 3A 2B            [ 2]  779 	ldw x,(XTEMP,sp)
      009968 02               [ 1]  780 	ld a,(x)
      009969 AB 07            [ 1]  781 	jreq 9$  ; completed if 0
      00996B A1 2D            [ 1]  782 	cp a,#'-
      00996B 5A F7            [ 1]  783 	jrne 1$
      00996D 0C 02            [ 1]  784 	cpl (SIGN,sp)
      00996F C6 00            [ 2]  785 	jra 2$
      009971 0D CA            [ 1]  786 1$: cp a,#'$
      009973 00 0E            [ 1]  787 	jrne 3$
      009975 CA 00            [ 1]  788 	ld a,#16
      009977 0F 26            [ 1]  789 	ld (BASE,sp),a
      009979 E3               [ 1]  790 2$:	incw x
      00997A C6 00            [ 2]  791 	ldw (XTEMP,sp),x 
      00997C 0B               [ 1]  792 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      001953                        793 3$:	; char to digit 
      00997D A1 10            [ 1]  794 	cp a,#'a
      00997F 27 08            [ 1]  795 	jrmi 4$
      009981 7B 01            [ 1]  796 	sub a,#32
      009983 27 0A            [ 1]  797 4$:	cp a,#'0
      009985 A6 2D            [ 1]  798 	jrmi 9$
      009987 20 02            [ 1]  799 	sub a,#'0
      009989 A1 0A            [ 1]  800 	cp a,#10
      009989 A6 24            [ 1]  801 	jrmi 5$
      00998B 5A F7            [ 1]  802 	sub a,#7
      00998D 0C 02            [ 1]  803 	cp a,(BASE,sp)
      00998F 2A 24            [ 1]  804 	jrpl 9$
      00998F 5A A6            [ 1]  805 5$:	ld (TEMP,sp),a
      009991 20 F7            [ 1]  806 	ld a,(BASE,sp)
      009993 7B 02 4C         [ 4]  807 	call mulu24_8
      001970                        808 	_xpush 
      009996 5B 04 81 03      [ 2]    1     subw y,#CELL_SIZE
      009999 90 F7            [ 1]    2     ld (y),a 
      009999 A1 61 2A         [ 2]    3     ldw (1,y),x 
      00999C 01               [ 1]  809 	clrw x 
      00999D 81 A1            [ 1]  810 	ld a,(TEMP,sp)
      00999F 7A               [ 1]  811 	rlwa x 
      00197D                        812 	_xpush 
      0099A0 22 FB A0 20      [ 2]    1     subw y,#CELL_SIZE
      0099A4 81 F7            [ 1]    2     ld (y),a 
      0099A5 90 EF 01         [ 2]    3     ldw (1,y),x 
      0099A5 52 05 1F         [ 4]  813 	call add24 
      0099A8 04 4F            [ 2]  814 	ldw x,(XTEMP,sp)
      0099AA 5F 72            [ 2]  815 	jra 2$
      0099AC A2 00            [ 1]  816 9$:	tnz (SIGN,sp)
      0099AE 03 90            [ 1]  817     jreq atoi_exit
      0099B0 F7 90 EF         [ 4]  818     call neg24
      001994                        819 atoi_exit:
      001994                        820 	_xpop 
      0099B3 01 0F            [ 1]    1     ld a,(y)
      0099B5 01               [ 1]    2     ldw x,y 
      0099B6 A6 0A            [ 2]    3     ldw x,(1,x)
      0099B8 6B 02 1E 04      [ 2]    4     addw y,#CELL_SIZE 
      0099BC F6 27 4E         [ 1]  821 	ld acc24,a 
      0099BF A1 2D 26         [ 2]  822 	ldw acc16,x  
      0019A3                        823 	_drop VSIZE
      0099C2 04 03            [ 2]    1     addw sp,#VSIZE 
      0099C4 01               [ 4]  824 	ret
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
      0019A6                        845 search_dict::
      0019A6                        846 	_vars VSIZE 
      0099C5 20 08            [ 2]    1     sub sp,#VSIZE 
      0099C7 A1 24            [ 2]  847 	ldw (YSAVE,sp),y 
      0019AA                        848 search_next:
      0099C9 26 08            [ 2]  849 	ldw (XSAVE,sp),x 
                                    850 ; get name length in dictionary	
      0099CB A6               [ 1]  851 	ld a,(x)
      0099CC 10 6B            [ 1]  852 	and a,#0xf 
      0099CE 02 5C            [ 1]  853 	ld (NLEN,sp),a  
      0099D0 1F 04            [ 2]  854 	ldw y,(YSAVE,sp) ; name pointer 
      0099D2 F6               [ 1]  855 	incw x 
      0099D3                        856 cp_loop:
      0099D3 A1 61            [ 1]  857 	ld a,(y)
      0099D5 2B 02            [ 1]  858 	jreq str_match 
      0099D7 A0 20            [ 1]  859 	tnz (NLEN,sp)
      0099D9 A1 30            [ 1]  860 	jreq no_match  
      0099DB 2B               [ 1]  861 	cp a,(x)
      0099DC 30 A0            [ 1]  862 	jrne no_match 
      0099DE 30 A1            [ 1]  863 	incw y 
      0099E0 0A               [ 1]  864 	incw x
      0099E1 2B 06            [ 1]  865 	dec (NLEN,sp)
      0099E3 A0 07            [ 2]  866 	jra cp_loop 
      0019C6                        867 no_match:
      0099E5 11 02            [ 2]  868 	ldw x,(XSAVE,sp) 
      0099E7 2A 24 6B         [ 2]  869 	subw x,#2 ; move X to link field
      0099EA 03 7B            [ 1]  870 	push #TK_NONE 
      0099EC 02               [ 2]  871 	ldw x,(x) ; next word link 
      0099ED CD               [ 1]  872 	pop a ; TK_NONE 
      0099EE 82 BA            [ 1]  873 	jreq search_exit  ; not found  
                                    874 ;try next 
      0099F0 72 A2            [ 2]  875 	jra search_next
      0019D3                        876 str_match:
      0099F2 00 03            [ 2]  877 	ldw x,(XSAVE,sp)
      0099F4 90               [ 1]  878 	ld a,(X)
      0099F5 F7 90            [ 1]  879 	ld (NLEN,sp),a ; needed to test keyword type  
      0099F7 EF 01            [ 1]  880 	and a,#NLEN_MASK 
                                    881 ; move x to procedure address field 	
      0099F9 5F               [ 1]  882 	inc a 
      0099FA 7B 03 02         [ 1]  883 	ld acc8,a 
      0099FD 72 A2 00 03      [ 1]  884 	clr acc16 
      009A01 90 F7 90 EF      [ 2]  885 	addw x,acc16 
      009A05 01               [ 2]  886 	ldw x,(x) ; routine address  
                                    887 ;determine keyword type bits 7:4 
      009A06 CD 81            [ 1]  888 	ld a,(NLEN,sp)
      009A08 FE 1E            [ 1]  889 	and a,#KW_TYPE_MASK 
      009A0A 04               [ 1]  890 	swap a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      009A0B 20 C2            [ 1]  891 	add a,#128
      0019EE                        892 search_exit: 
      0019EE                        893 	_drop VSIZE 
      009A0D 0D 01            [ 2]    1     addw sp,#VSIZE 
      009A0F 27               [ 4]  894 	ret 
                                    895 
                                    896 ;--------------------------------
                                    897 ;  called by command that should 
                                    898 ;  be invoked only from command 
                                    899 ;  line.
                                    900 ;  Display an error if 
                                    901 ;  invoked from program.
                                    902 ;---------------------------------
      0019F1                        903 cmd_line_only:
      009A10 03 CD 82 83 05   [ 2]  904 	btjf flags,#FRUN,0$
      009A14 A6 07            [ 1]  905 	ld a,#ERR_CMD_ONLY
      009A14 90 F6 93         [ 2]  906 	jp tb_error 
      009A17 EE               [ 4]  907 0$: ret 
                                    908 
                                    909 ;--------------------------------
                                    910 ; called by command/function that 
                                    911 ; should be invoked only at run time
                                    912 ; Display an error if invoked from 
                                    913 ; command line. 
                                    914 ;---------------------------------
      0019FC                        915 runtime_only:
      009A18 01 72 A9 00 03   [ 2]  916 	btjt flags,#FRUN,0$ 
      009A1D C7 00            [ 1]  917 	ld a,#ERR_RUN_ONLY
      009A1F 0D CF 00         [ 2]  918 	jp tb_error 
      009A22 0E               [ 4]  919 0$:	ret 
                                    920 
                                    921 ;---------------------
                                    922 ; check if next token
                                    923 ;  is of expected type 
                                    924 ; input:
                                    925 ;   A 		 expected token attribute
                                    926 ;  ouput:
                                    927 ;   none     if fail call syntax_error 
                                    928 ;--------------------
      001A07                        929 expect:
      009A23 5B               [ 1]  930 	push a 
      009A24 05 81 3E         [ 4]  931 	call next_token 
      009A26 11 01            [ 1]  932 	cp a,(1,sp)
      009A26 52 05            [ 1]  933 	jreq 1$
      009A28 17 04 D7         [ 2]  934 	jp syntax_error
      009A2A 84               [ 1]  935 1$: pop a 
      009A2A 1F               [ 4]  936 	ret 
                                    937 
                                    938 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    939 ; parse arguments list 
                                    940 ; between ()
                                    941 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A14                        942 func_args:
      009A2B 02 F6            [ 1]  943 	ld a,#TK_LPAREN 
      009A2D A4 0F 6B         [ 4]  944 	call expect 
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
      001A19                        960 arg_list:
      009A30 01 16            [ 1]  961 	push #0
      009A32 04 5C 74         [ 4]  962 1$:	call condition 
      009A34 4D               [ 1]  963 	tnz a 
      009A34 90 F6            [ 1]  964 	jreq 7$  
      009A36 27 1B            [ 1]  965 	inc (1,sp)
      009A38 0D 01 27         [ 4]  966 	call next_token 
      009A3B 0A F1            [ 1]  967 	cp a,#TK_COMMA 
      009A3D 26 07            [ 1]  968 	jreq 1$ 
      009A3F 90 5C            [ 1]  969 	cp a,#TK_RPAREN
      009A41 5C 0A            [ 1]  970 	jreq 7$
      001A2E                        971 	_unget_token 
      009A43 01 20 EE 00 01   [ 1]    1      mov in,in.saved  
      009A46 84               [ 1]  972 7$:	pop a  
      009A46 1E               [ 4]  973 	ret 
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
      001A35                       1001 get_array_element:
      009A47 02 1D 00         [ 4] 1002 	call func_args 
      009A4A 02 4B            [ 1] 1003 	cp a,#1
      009A4C 00 FE            [ 1] 1004 	jreq 1$
      009A4E 84 27 1D         [ 2] 1005 	jp syntax_error
      001A3F                       1006 1$: _xpop 
      009A51 20 D7            [ 1]    1     ld a,(y)
      009A53 93               [ 1]    2     ldw x,y 
      009A53 1E 02            [ 2]    3     ldw x,(1,x)
      009A55 F6 6B 01 A4      [ 2]    4     addw y,#CELL_SIZE 
                                   1007     ; ignore A, index < 65536 in any case 
                                   1008 	; check for bounds 
      009A59 0F 4C C7         [ 2] 1009 	cpw x,array_size 
      009A5C 00 0F            [ 2] 1010 	jrule 3$
                                   1011 ; bounds {1..array_size}	
      009A5E 72 5F            [ 1] 1012 2$: ld a,#ERR_BAD_VALUE 
      009A60 00 0E 72         [ 2] 1013 	jp tb_error 
      009A63 BB               [ 2] 1014 3$: tnzw  x
      009A64 00 0E            [ 1] 1015 	jreq 2$ 
      009A66 FE 7B            [ 1] 1016 	ld a,#CELL_SIZE  
      009A68 01               [ 4] 1017 	mul x,a 
      009A69 A4 F0 4E         [ 2] 1018 	ldw acc16,x   
      009A6C AB 80 68         [ 2] 1019 	ldw x,#tib ; array is below tib 
      009A6E 72 B0 00 0D      [ 2] 1020 	subw x,acc16 
      009A6E 5B               [ 4] 1021 	ret 
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
      001A63                       1037 factor:
      001A63                       1038 	_vars VSIZE 
      009A6F 05 81            [ 2]    1     sub sp,#VSIZE 
      009A71 0F 01            [ 1] 1039 	clr (NEG,sp)
      009A71 72 01 00         [ 4] 1040 	call next_token
      009A74 23               [ 1] 1041 	tnz a 
      009A75 05 A6            [ 1] 1042 	jrne 1$ 
      009A77 07 CC 97         [ 2] 1043 	jp 22$ 
      009A7A 59 81            [ 1] 1044 1$:	cp a,#TK_PLUS 
      009A7C 27 06            [ 1] 1045 	jreq 2$
      009A7C 72 00            [ 1] 1046 	cp a,#TK_MINUS 
      009A7E 00 23            [ 1] 1047 	jrne 4$ 
      009A80 05 A6            [ 1] 1048 	cpl (NEG,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      001A7A                       1049 2$:	
      009A82 06 CC 97         [ 4] 1050 	call next_token
      001A7D                       1051 4$:
      009A85 59               [ 1] 1052 	tnz a 
      009A86 81 03            [ 1] 1053 	jrne 41$ 
      009A87 CC 16 D7         [ 2] 1054 	jp syntax_error  
      001A83                       1055 41$:	
      009A87 88 CD            [ 1] 1056 	cp a,#TK_IFUNC 
      009A89 98 BE            [ 1] 1057 	jrne 5$ 
      001A87                       1058 	_get_code_addr 
      009A8B 11               [ 2]    1         ldw x,(x)
      009A8C 01 27 03 CC      [ 1]    2         inc in 
      009A90 97 57 84 81      [ 1]    3         inc in 
      009A94 FD               [ 4] 1059 	call (x); result in A:X  
      009A94 A6 06            [ 2] 1060 	jra 18$ 
      001A93                       1061 5$:
      009A96 CD 9A            [ 1] 1062 	cp a,#TK_INTGR
      009A98 87 05            [ 1] 1063 	jrne 6$
      009A99 CD 18 70         [ 4] 1064 	call get_int24 ; A:X
      009A99 4B 00            [ 2] 1065 	jra 18$
      001A9C                       1066 6$:
      009A9B CD 9C            [ 1] 1067 	cp a,#TK_ARRAY
      009A9D F4 4D            [ 1] 1068 	jrne 7$
      009A9F 27 12 0C         [ 4] 1069 	call get_array_element
      009AA2 01 CD            [ 2] 1070     jra 71$
      001AA5                       1071 7$:
      009AA4 98 BE            [ 1] 1072 	cp a,#TK_VAR 
      009AA6 A1 08            [ 1] 1073 	jrne 8$
      009AA8 27 F1 A1         [ 4] 1074 	call get_addr 
      001AAC                       1075 71$: ; put value in A:X
      009AAB 07               [ 1] 1076 	ld a,(x)
      009AAC 27 05            [ 2] 1077 	ldw x,(1,x)
      009AAE 55 00            [ 2] 1078 	jra 18$
      001AB1                       1079 8$:
      009AB0 04 00            [ 1] 1080 	cp a,#TK_LABEL 
      009AB2 02 84            [ 1] 1081 	jrne 9$
      009AB4 81 89            [ 2] 1082 	pushw y  
      009AB5 89               [ 2] 1083 	pushw x 
      009AB5 CD 9A 94         [ 4] 1084 	call skip_string
      009AB8 A1               [ 2] 1085 	popw x  
      009AB9 01 27 03         [ 4] 1086 	call strlen 
      009ABC CC 97            [ 1] 1087 	add a,#REC_XTRA_BYTES
      009ABE 57 90 F6         [ 4] 1088 	call search_name
      009AC1 93               [ 2] 1089 	tnzw x 
      009AC2 EE 01            [ 1] 1090 	jrne 82$ 
      009AC4 72 A9            [ 2] 1091 	popw y 
      009AC6 00 03            [ 2] 1092 	jra 16$
      001ACB                       1093 82$:
      009AC8 C3 00            [ 2] 1094 	popw y   
      009ACA 21 23 05         [ 4] 1095 	call get_value ; in A:X 
      009ACD A6 0A            [ 2] 1096 	jra 18$
      001AD2                       1097 9$: 
      009ACF CC 97            [ 1] 1098 	cp a,#TK_CFUNC 
      009AD1 59 5D            [ 1] 1099 	jrne 12$
      001AD6                       1100 	_get_code_addr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      009AD3 27               [ 2]    1         ldw x,(x)
      009AD4 F8 A6 03 42      [ 1]    2         inc in 
      009AD8 CF 00 0E AE      [ 1]    3         inc in 
      009ADC 16               [ 4] 1101 	call(x)
      009ADD 68               [ 1] 1102 	clrw x 
      009ADE 72               [ 1] 1103 	rlwa x  ; char>int24 in A:X 
      009ADF B0 00            [ 2] 1104 	jra 18$ 	 
      001AE4                       1105 12$:			
      009AE1 0E 81            [ 1] 1106 	cp a,#TK_LPAREN
      009AE3 26 13            [ 1] 1107 	jrne 16$
      009AE3 52 01 0F         [ 4] 1108 	call expression
      009AE6 01 CD            [ 1] 1109 	ld a,#TK_RPAREN 
      009AE8 98 BE 4D         [ 4] 1110 	call expect
      001AF0                       1111 	_xpop 
      009AEB 26 03            [ 1]    1     ld a,(y)
      009AED CC               [ 1]    2     ldw x,y 
      009AEE 9B 95            [ 2]    3     ldw x,(1,x)
      009AF0 A1 10 27 06      [ 2]    4     addw y,#CELL_SIZE 
      009AF4 A1 11            [ 2] 1112 	jra 18$	
      001AFB                       1113 16$:
      001AFB                       1114 	_unget_token 
      009AF6 26 05 03 01 01   [ 1]    1      mov in,in.saved  
      009AFA 4F               [ 1] 1115 	clr a 
      009AFA CD 98            [ 2] 1116 	jra 22$ 
      001B03                       1117 18$: 
      009AFC BE 01            [ 1] 1118 	tnz (NEG,sp)
      009AFD 27 03            [ 1] 1119 	jreq 20$
      009AFD 4D 26 03         [ 4] 1120 	call neg_ax   
      001B0A                       1121 20$:
      001B0A                       1122 	_xpush 
      009B00 CC 97 57 03      [ 2]    1     subw y,#CELL_SIZE
      009B03 90 F7            [ 1]    2     ld (y),a 
      009B03 A1 81 26         [ 2]    3     ldw (1,y),x 
      009B06 0C FE            [ 1] 1123 	ld a,#TK_INTGR
      001B15                       1124 22$:
      001B15                       1125 	_drop VSIZE
      009B08 72 5C            [ 2]    1     addw sp,#VSIZE 
      009B0A 00               [ 4] 1126 	ret
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
      001B18                       1137 term:
      001B18                       1138 	_vars VSIZE
      009B0B 02 72            [ 2]    1     sub sp,#VSIZE 
                                   1139 ; first factor 	
      009B0D 5C 00 02         [ 4] 1140 	call factor
      009B10 FD               [ 1] 1141 	tnz a 
      009B11 20 70            [ 1] 1142 	jreq term_exit  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      009B13                       1143 term01:	 ; check for  operator '*'|'/'|'%' 
      009B13 A1 84 26         [ 4] 1144 	call next_token
      009B16 05 CD            [ 1] 1145 	ld (MULOP,sp),a
      009B18 98 F0            [ 1] 1146 	and a,#TK_GRP_MASK
      009B1A 20 67            [ 1] 1147 	cp a,#TK_GRP_MULT
      009B1C 27 09            [ 1] 1148 	jreq 1$
      009B1C A1 05            [ 1] 1149 	ld a,#TK_INTGR
      001B2D                       1150 	_unget_token 
      009B1E 26 05 CD 9A B5   [ 1]    1      mov in,in.saved  
      009B23 20 07            [ 2] 1151 	jra term_exit 
      009B25                       1152 1$:	; got *|/|%
                                   1153 ;second factor
      009B25 A1 85 26         [ 4] 1154 	call factor
      009B28 08               [ 1] 1155 	tnz a 
      009B29 CD 98            [ 1] 1156 	jrne 2$ 
      009B2B E6 16 D7         [ 2] 1157 	jp syntax_error 
      009B2C                       1158 2$: ; select operation 	
      009B2C F6 EE            [ 1] 1159 	ld a,(MULOP,sp) 
      009B2E 01 20            [ 1] 1160 	cp a,#TK_MULT 
      009B30 52 05            [ 1] 1161 	jrne 3$
                                   1162 ; '*' operator
      009B31 CD 02 79         [ 4] 1163 	call mul24 
      009B31 A1 03            [ 2] 1164 	jra term01
      009B33 26 1D            [ 1] 1165 3$: cp a,#TK_DIV 
      009B35 90 89            [ 1] 1166 	jrne 4$ 
                                   1167 ; '/' operator	
      009B37 89 CD 98         [ 4] 1168 	call div24 
      009B3A D7 85            [ 2] 1169 	jra term01 
      001B51                       1170 4$: ; '%' operator
      009B3C CD 94 53         [ 4] 1171 	call mod24
      009B3F AB 05            [ 2] 1172 	jra term01 
      001B56                       1173 9$: 
      009B41 CD 9E            [ 1] 1174 	ld a,#TK_INTGR
      001B58                       1175 term_exit:
      001B58                       1176 	_drop VSIZE 
      009B43 30 5D            [ 2]    1     addw sp,#VSIZE 
      009B45 26               [ 4] 1177 	ret 
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
      001B5B                       1188 expression:
      001B5B                       1189 	_vars VSIZE 
      009B46 04 90            [ 2]    1     sub sp,#VSIZE 
                                   1190 ; first term 	
      009B48 85 20 30         [ 4] 1191 	call term
      009B4B 4D               [ 1] 1192 	tnz a 
      009B4B 90 85            [ 1] 1193 	jreq 9$
      001B63                       1194 1$:	; operator '+'|'-'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      009B4D CD 9D F6         [ 4] 1195 	call next_token
      009B50 20 31            [ 1] 1196 	ld (OP,sp),a 
      009B52 A4 30            [ 1] 1197 	and a,#TK_GRP_MASK
      009B52 A1 82            [ 1] 1198 	cp a,#TK_GRP_ADD 
      009B54 26 0E            [ 1] 1199 	jreq 2$ 
      001B6E                       1200 	_unget_token 
      009B56 FE 72 5C 00 02   [ 1]    1      mov in,in.saved  
      009B5B 72 5C            [ 1] 1201 	ld a,#TK_INTGR
      009B5D 00 02            [ 2] 1202 	jra 9$ 
      001B77                       1203 2$: ; second term 
      009B5F FD 5F 02         [ 4] 1204 	call term
      009B62 20               [ 1] 1205 	tnz a 
      009B63 1F 03            [ 1] 1206 	jrne 3$
      009B64 CC 16 D7         [ 2] 1207 	jp syntax_error
      001B80                       1208 3$:
      009B64 A1 06            [ 1] 1209 	ld a,(OP,sp)
      009B66 26 13            [ 1] 1210 	cp a,#TK_PLUS 
      009B68 CD 9B            [ 1] 1211 	jrne 4$
                                   1212 ; '+' operator	
      009B6A DB A6 07         [ 4] 1213 	call add24
      009B6D CD 9A            [ 2] 1214 	jra 1$ 
      001B8B                       1215 4$:	; '-' operator 
      009B6F 87 90 F6         [ 4] 1216 	call sub24
      009B72 93 EE            [ 2] 1217 	jra 1$
      001B90                       1218 9$:
      001B90                       1219 	_drop VSIZE 
      009B74 01 72            [ 2]    1     addw sp,#VSIZE 
      009B76 A9               [ 4] 1220 	ret 
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
      001B93                       1231 relation: 
      001B93                       1232 	_vars VSIZE
      009B77 00 03            [ 2]    1     sub sp,#VSIZE 
      009B79 20 08 5B         [ 4] 1233 	call expression
      009B7B 4D               [ 1] 1234 	tnz a 
      009B7B 55 00            [ 1] 1235 	jreq 9$ 
                                   1236 ; expect rel_op or leave 
      009B7D 04 00 02         [ 4] 1237 	call next_token 
      009B80 4F 20            [ 1] 1238 	ld (RELOP,sp),a 
      009B82 12 30            [ 1] 1239 	and a,#TK_GRP_MASK
      009B83 A1 30            [ 1] 1240 	cp a,#TK_GRP_RELOP 
      009B83 0D 01            [ 1] 1241 	jreq 2$
      009B85 27 03            [ 1] 1242 	ld a,#TK_INTGR 
      001BA8                       1243 	_unget_token 
      009B87 CD 82 95 00 01   [ 1]    1      mov in,in.saved  
      009B8A 20 40            [ 2] 1244 	jra 9$ 
      001BAF                       1245 2$:	; expect another expression
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      009B8A 72 A2 00         [ 4] 1246 	call expression
      009B8D 03               [ 1] 1247 	tnz a 
      009B8E 90 F7            [ 1] 1248 	jrne 3$
      009B90 90 EF 01         [ 2] 1249 	jp syntax_error 
      001BB8                       1250 3$: 
      009B93 A6 84 B8         [ 4] 1251 	call cp24 
      009B95                       1252 	_xpop  
      009B95 5B 01            [ 1]    1     ld a,(y)
      009B97 81               [ 1]    2     ldw x,y 
      009B98 EE 01            [ 2]    3     ldw x,(1,x)
      009B98 52 01 CD 9A      [ 2]    4     addw y,#CELL_SIZE 
      009B9C E3               [ 1] 1253 	tnz a 
      009B9D 4D 27            [ 1] 1254 	jrmi 4$
      009B9F 38 0C            [ 1] 1255 	jrne 5$
      009BA0 35 02 00 0E      [ 1] 1256 	mov acc8,#2 ; i1==i2
      009BA0 CD 98            [ 2] 1257 	jra 6$ 
      001BCF                       1258 4$: ; i1<i2
      009BA2 BE 6B 01 A4      [ 1] 1259 	mov acc8,#4 
      009BA6 30 A1            [ 2] 1260 	jra 6$
      001BD5                       1261 5$: ; i1>i2
      009BA8 20 27 09 A6      [ 1] 1262 	mov acc8,#1  
      001BD9                       1263 6$: ; 0=false, -1=true 
      009BAC 84               [ 1] 1264 	clrw x 
      009BAD 55 00 04         [ 1] 1265 	ld a, acc8  
      009BB0 00 02            [ 1] 1266 	and a,(RELOP,sp)
      009BB2 20 24            [ 1] 1267 	jreq 7$
      009BB4 53               [ 2] 1268 	cplw x 
      009BB4 CD 9A            [ 1] 1269 	ld a,#255 
      001BE4                       1270 7$:	_xpush 
      009BB6 E3 4D 26 03      [ 2]    1     subw y,#CELL_SIZE
      009BBA CC 97            [ 1]    2     ld (y),a 
      009BBC 57 EF 01         [ 2]    3     ldw (1,y),x 
      009BBD A6 84            [ 1] 1271 	ld a,#TK_INTGR
      001BEF                       1272 9$: 
      001BEF                       1273 	_drop VSIZE
      009BBD 7B 01            [ 2]    1     addw sp,#VSIZE 
      009BBF A1               [ 4] 1274 	ret 
                                   1275 
                                   1276 ;-------------------------------------------
                                   1277 ;  AND factor:  [NOT] relation | (condition)
                                   1278 ;  output:
                                   1279 ;     A      TK_INTGR|0
                                   1280 ;-------------------------------------------
                           000001  1281 	NOT_OP=1
      001BF2                       1282 and_factor:
      009BC0 20 26            [ 1] 1283 	push #0 
      009BC2 05 CD 82         [ 4] 1284 0$:	call next_token  
      009BC5 F9               [ 1] 1285 	tnz a 
      009BC6 20 D8            [ 1] 1286 	jreq 8$ 
      009BC8 A1 21            [ 1] 1287 	cp a,#TK_NOT 
      009BCA 26 05            [ 1] 1288 	jrne 1$ 
      009BCC CD 83            [ 1] 1289 	cpl (NOT_OP,sp)
      009BCE 87 20            [ 2] 1290 	jra 0$ 
      001C02                       1291 1$:	
      009BD0 CF 06            [ 1] 1292 	cp a,#TK_LPAREN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      009BD1 26 0A            [ 1] 1293 	jrne 2$
      009BD1 CD 84 21         [ 4] 1294 	call condition
      009BD4 20 CA            [ 1] 1295 	ld a,#TK_RPAREN 
      009BD6 CD 1A 07         [ 4] 1296 	call expect
      009BD6 A6 84            [ 2] 1297 	jra 3$
      009BD8                       1298 2$: _unget_token 
      009BD8 5B 01 81 00 01   [ 1]    1      mov in,in.saved  
      009BDB CD 1B 93         [ 4] 1299 	call relation
      001C18                       1300 3$:
      009BDB 52 01            [ 1] 1301 	tnz (NOT_OP,sp)
      009BDD CD 9B            [ 1] 1302 	jreq 8$ 
      009BDF 98 4D 27         [ 4] 1303 	call cpl24
      001C1F                       1304 8$:
      001C1F                       1305 	_drop 1  
      009BE2 2D 01            [ 2]    1     addw sp,#1 
      009BE3 81               [ 4] 1306     ret 
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
      001C22                       1317 and_cond:
      009BE3 CD 98 BE         [ 4] 1318 	call and_factor
      009BE6 6B               [ 1] 1319 	tnz a 
      009BE7 01 A4            [ 1] 1320 	jreq 9$  
      009BE9 30 A1 10         [ 4] 1321 1$: call next_token 
      009BEC 27               [ 1] 1322 	tnz a 
      009BED 09 55            [ 1] 1323 	jreq 6$ 
      009BEF 00 04            [ 1] 1324 	cp a,#TK_AND 
      009BF1 00 02            [ 1] 1325 	jreq 3$
      001C32                       1326 	_unget_token 
      009BF3 A6 84 20 19 01   [ 1]    1      mov in,in.saved  
      009BF7 20 38            [ 2] 1327 	jra 6$ 
      009BF7 CD 9B 98         [ 4] 1328 3$:	call and_factor  
      009BFA 4D               [ 1] 1329 	tnz a 
      009BFB 26 03            [ 1] 1330 	jrne 4$
      009BFD CC 97 57         [ 2] 1331 	jp syntax_error 
      009C00                       1332 4$:	
      001C42                       1333 	_xpop 
      009C00 7B 01            [ 1]    1     ld a,(y)
      009C02 A1               [ 1]    2     ldw x,y 
      009C03 10 26            [ 2]    3     ldw x,(1,x)
      009C05 05 CD 81 FE      [ 2]    4     addw y,#CELL_SIZE 
      009C09 20 D8 0C         [ 1] 1334 	ld acc24,a 
      009C0B CF 00 0D         [ 2] 1335 	ldw acc16,x
      001C51                       1336 	_xpop 
      009C0B CD 82            [ 1]    1     ld a,(y)
      009C0D 1B               [ 1]    2     ldw x,y 
      009C0E 20 D3            [ 2]    3     ldw x,(1,x)
      009C10 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      009C10 5B 01 81         [ 1] 1337 	and a,acc24 
      009C13 02               [ 1] 1338 	rlwa x 
      009C13 52 01 CD         [ 1] 1339 	and a,acc16 
      009C16 9B               [ 1] 1340 	rlwa x 
      009C17 DB 4D 27         [ 1] 1341 	and a,acc8 
      009C1A 54               [ 1] 1342 	rlwa x
      001C66                       1343 	_xpush
      009C1B CD 98 BE 6B      [ 2]    1     subw y,#CELL_SIZE
      009C1F 01 A4            [ 1]    2     ld (y),a 
      009C21 30 A1 30         [ 2]    3     ldw (1,y),x 
      009C24 27 09            [ 2] 1344 	jra 1$  
      009C26 A6 84            [ 1] 1345 6$: ld a,#TK_INTGR 
      009C28 55               [ 4] 1346 9$:	ret 	 
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
      001C74                       1360 condition:
      001C74                       1361 	_vars VSIZE 
      009C29 00 04            [ 2]    1     sub sp,#VSIZE 
      009C2B 00 02 20         [ 4] 1362 	call and_cond
      009C2E 40               [ 1] 1363 	tnz a 
      009C2F 27 69            [ 1] 1364 	jreq 9$ 
      009C2F CD 9B DB         [ 4] 1365 1$:	call next_token 
      009C32 4D 26            [ 1] 1366 	cp a,#TK_OR 
      009C34 03 CC            [ 1] 1367 	jreq 2$
      009C36 97 57            [ 1] 1368 	cp a,#TK_XOR
      009C38 27 07            [ 1] 1369 	jreq 2$ 
      001C87                       1370 	_unget_token 
      009C38 CD 82 38 90 F6   [ 1]    1      mov in,in.saved  
      009C3D 93 EE            [ 2] 1371 	jra 8$ 
      009C3F 01 72            [ 1] 1372 2$:	ld (OP,sp),a ; TK_OR|TK_XOR 
      009C41 A9 00 03         [ 4] 1373 	call and_cond
      009C44 4D 2B            [ 1] 1374 	cp a,#TK_INTGR 
      009C46 08 26            [ 1] 1375 	jreq 3$
      009C48 0C 35 02         [ 2] 1376 	jp syntax_error 
      001C9A                       1377 3$:	 
      001C9A                       1378 	_xpop  ; rigth arg 
      009C4B 00 0F            [ 1]    1     ld a,(y)
      009C4D 20               [ 1]    2     ldw x,y 
      009C4E 0A 01            [ 2]    3     ldw x,(1,x)
      009C4F 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C4F 35 04 00         [ 1] 1379 	ld acc24,a 
      009C52 0F 20 04         [ 2] 1380 	ldw acc16,x 
      009C55                       1381 	_xpop  ; left arg  
      009C55 35 01            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      009C57 00               [ 1]    2     ldw x,y 
      009C58 0F 01            [ 2]    3     ldw x,(1,x)
      009C59 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C59 5F C6            [ 1] 1382 	ld (ATMP,sp),a 
      009C5B 00 0F            [ 1] 1383 	ld a,(OP,sp)
      009C5D 14 01            [ 1] 1384 	cp a,#TK_XOR 
      009C5F 27 03            [ 1] 1385 	jreq 5$ 
      001CBA                       1386 4$: ; A:X OR acc24   
      009C61 53 A6            [ 1] 1387 	ld a,(ATMP,sp)
      009C63 FF 72 A2         [ 1] 1388 	or a,acc24 
      009C66 00               [ 1] 1389 	rlwa x 
      009C67 03 90 F7         [ 1] 1390 	or a,acc16 
      009C6A 90               [ 1] 1391 	rlwa x 
      009C6B EF 01 A6         [ 1] 1392 	or a,acc8 
      009C6E 84               [ 1] 1393 	rlwa x 
      009C6F 20 0E            [ 2] 1394 	jra 6$  
      001CCA                       1395 5$: ; A:X XOR acc24 
      009C6F 5B 01            [ 1] 1396 	ld a,(ATMP,sp)
      009C71 81 00 0C         [ 1] 1397 	xor a,acc24 
      009C72 02               [ 1] 1398 	rlwa x 
      009C72 4B 00 CD         [ 1] 1399 	xor a,acc16 
      009C75 98               [ 1] 1400 	rlwa x 
      009C76 BE 4D 27         [ 1] 1401 	xor a,acc8 
      009C79 25               [ 1] 1402 	rlwa x 
      001CD8                       1403 6$: _xpush
      009C7A A1 87 26 04      [ 2]    1     subw y,#CELL_SIZE
      009C7E 03 01            [ 1]    2     ld (y),a 
      009C80 20 F2 01         [ 2]    3     ldw (1,y),x 
      009C82 20 99            [ 2] 1404 	jra 1$ 
      009C82 A1 06            [ 1] 1405 8$:	ld a,#TK_INTGR 
      001CE5                       1406 9$:	_drop VSIZE 
      009C84 26 0A            [ 2]    1     addw sp,#VSIZE 
      009C86 CD               [ 4] 1407 	ret 
                                   1408 
                                   1409 
                                   1410 ;--------------------------------------------
                                   1411 ; BASIC: HEX 
                                   1412 ; select hexadecimal base for integer print
                                   1413 ;---------------------------------------------
      001CE8                       1414 hex_base:
      009C87 9C F4 A6 07      [ 1] 1415 	mov base,#16 
      009C8B CD               [ 4] 1416 	ret 
                                   1417 
                                   1418 ;--------------------------------------------
                                   1419 ; BASIC: DEC 
                                   1420 ; select decimal base for integer print
                                   1421 ;---------------------------------------------
      001CED                       1422 dec_base:
      009C8C 9A 87 20 08      [ 1] 1423 	mov base,#10
      009C90 55               [ 4] 1424 	ret 
                                   1425 
                                   1426 ;------------------------
                                   1427 ; BASIC: FREE 
                                   1428 ; return free size in RAM 
                                   1429 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



                                   1430 ;   A:x		size 
                                   1431 ;--------------------------
      001CF2                       1432 free:
      009C91 00               [ 1] 1433 	clr a 
      009C92 04 00 02         [ 2] 1434 	ldw x,#tib 
      009C95 CD 9C 13 31      [ 2] 1435 	subw x,dvar_end 
      009C98 81               [ 4] 1436 	ret 
                                   1437 
                                   1438 ;------------------------------
                                   1439 ; BASIC: SIZE 
                                   1440 ; command that print 
                                   1441 ; program start addres and size 
                                   1442 ;------------------------------
      001CFB                       1443 cmd_size:
      009C98 0D 01 27         [ 1] 1444 	push base 
      009C9B 03 CD 82         [ 2] 1445 	ldw x,#PROG_ADDR 
      009C9E 7A 09 A4         [ 4] 1446 	call puts 
      009C9F CE 00 1B         [ 2] 1447 	ldw x,txtbgn     
      009C9F 5B 01 81 0A      [ 1] 1448 	mov base,#16 
      009CA2 CD 18 86         [ 4] 1449 	call prt_i16
      009CA2 CD 9C 72         [ 1] 1450 	pop base 
      009CA5 4D 27 4B         [ 2] 1451 	ldw x,#PROG_SIZE 
      009CA8 CD 98 BE         [ 4] 1452 	call puts 
      009CAB 4D 27 43         [ 2] 1453 	ldw x,txtend 
      009CAE A1 88 27 07      [ 2] 1454 	subw x,txtbgn 
      009CB2 55 00 04         [ 4] 1455 	call prt_i16
      009CB5 00 02 20         [ 2] 1456 	ldw x,#STR_BYTES 
      009CB8 38 CD 9C         [ 4] 1457 	call puts  
      009CBB 72               [ 4] 1458 	ret 
                                   1459 
                                   1460 
                                   1461 ;------------------------
                                   1462 ; BASIC: UBOUND  
                                   1463 ; return array variable size 
                                   1464 ; and set 'array_size' variable 
                                   1465 ; output:
                                   1466 ;   A:X 	array_size
                                   1467 ;--------------------------
      001D28                       1468 ubound:
      009CBC 4D 26 03         [ 4] 1469 	call free 
      009CBF CC 97            [ 1] 1470 	ld a,#CELL_SIZE 
      009CC1 57               [ 2] 1471 	div x,a 
      009CC2 CF 00 20         [ 2] 1472 	ldw array_size,x
      009CC2 90               [ 1] 1473 	clr a 
      009CC3 F6               [ 4] 1474 	ret 
                                   1475 
                                   1476 ;-----------------------------
                                   1477 ; BASIC: LET var=expr 
                                   1478 ; variable assignement 
                                   1479 ; output:
                                   1480 ;   A 		TK_NONE 
                                   1481 ;-----------------------------
      001D33                       1482 let::
      009CC4 93 EE 01         [ 4] 1483 	call next_token 
      009CC7 72 A9            [ 1] 1484 	cp a,#TK_VAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      009CC9 00 03            [ 1] 1485 	jreq let_var
      009CCB C7 00            [ 1] 1486 	cp a,#TK_ARRAY 
      009CCD 0D CF            [ 1] 1487 	jreq  let_array
      009CCF 00 0E 90         [ 2] 1488 	jp syntax_error
      001D41                       1489 let_array:
      009CD2 F6 93 EE         [ 4] 1490 	call get_array_element
      009CD5 01 72            [ 2] 1491 	jra let_eval 
      001D46                       1492 let_var:
      009CD7 A9 00 03         [ 4] 1493 	call get_addr
      001D49                       1494 let_eval:
      009CDA C4 00 0D         [ 2] 1495 	ldw ptr16,x  ; variable address 
      009CDD 02 C4 00         [ 4] 1496 	call next_token 
      009CE0 0E 02            [ 1] 1497 	cp a,#TK_EQUAL
      009CE2 C4 00            [ 1] 1498 	jreq 1$
      009CE4 0F 02 72         [ 2] 1499 	jp syntax_error
      001D56                       1500 1$:	
      009CE7 A2 00 03         [ 4] 1501 	call condition   
      009CEA 90 F7            [ 1] 1502 	cp a,#TK_INTGR 
      009CEC 90 EF            [ 1] 1503 	jreq 2$
      009CEE 01 20 B7         [ 2] 1504 	jp syntax_error
      001D60                       1505 2$:	
      001D60                       1506 	_xpop ; value 
      009CF1 A6 84            [ 1]    1     ld a,(y)
      009CF3 81               [ 1]    2     ldw x,y 
      009CF4 EE 01            [ 2]    3     ldw x,(1,x)
      009CF4 52 02 CD 9C      [ 2]    4     addw y,#CELL_SIZE 
      001D69                       1507 3$:
      009CF8 A2 4D 27 69      [ 4] 1508 	ld [ptr16],a
      009CFC CD 98 BE A1      [ 1] 1509 	inc ptr8  
      009D00 89 27 0B A1      [ 5] 1510 	ldw [ptr16],x 
      009D04 8A               [ 4] 1511 	ret 
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
      001D76                       1522 get_value: ; -- i 
      009D05 27               [ 1] 1523 	ld a,(x) ; record size 
      009D06 07 55            [ 1] 1524 	and a,#NAME_MAX_LEN
      009D08 00 04            [ 1] 1525 	sub a,#CELL_SIZE ; * value 
      009D0A 00               [ 1] 1526 	push a 
      009D0B 02 20            [ 1] 1527 	push #0 
      009D0D 55 6B 02         [ 2] 1528 	addw x,(1,sp)
      009D10 CD               [ 1] 1529 	ld a,(x)
      009D11 9C A2            [ 2] 1530 	ldw x,(1,x)
      001D84                       1531 	_drop 2
      009D13 A1 84            [ 2]    1     addw sp,#2 
      009D15 27               [ 4] 1532 	ret 
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
      001D87                       1545 func_eefree:
      009D16 03 CC 97         [ 2] 1546 	ldw x,#EEPROM_BASE 
      009D19 57 08 00 0E      [ 1] 1547 1$:	mov acc8,#8 ; count 8 consecutive zeros
      009D1A A3 47 F8         [ 2] 1548     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      009D1A 90 F6            [ 1] 1549 	jruge 8$ ; no free space 
      009D1C 93               [ 1] 1550 2$: ld a,(x)
      009D1D EE 01            [ 1] 1551 	jrne 3$
      009D1F 72               [ 1] 1552 	incw x 
      009D20 A9 00 03 C7      [ 1] 1553 	dec acc8 
      009D24 00 0D            [ 1] 1554 	jrne 2$
      009D26 CF 00 0E         [ 2] 1555 	subw x,#8 
      009D29 90 F6            [ 2] 1556 	jra 9$  
      009D2B 93               [ 1] 1557 3$: ld a,(x)
      009D2C EE               [ 1] 1558 	incw x
      009D2D 01               [ 1] 1559 	tnz a  
      009D2E 72 A9            [ 1] 1560 	jrne 3$
      009D30 00               [ 2] 1561 	decw x   
      009D31 03 6B            [ 2] 1562 	jra 1$ 
      009D33 01               [ 1] 1563 8$: clrw x ; no free space 
      009D34 7B               [ 1] 1564 9$: clr a 
      009D35 02 A1 8A         [ 2] 1565 	ldw free_eeprom,x ; save in system variable 
      009D38 27               [ 4] 1566 	ret 
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
      001DB0                       1591 search_name:
      009D39 10 89            [ 2] 1592 	pushw y 
      009D3A                       1593 	_vars VSIZE
      009D3A 7B 01            [ 2]    1     sub sp,#VSIZE 
      009D3C CA 00 0D 02      [ 1] 1594 	clr acc16 
      009D40 CA 00            [ 1] 1595 	ld (RECLEN,sp),a    
      009D42 0E 02            [ 2] 1596 	ldw (NAMEPTR,sp),x
      009D44 CA 00 0F         [ 2] 1597 	ldw x,dvar_end 
      009D47 02 20            [ 2] 1598 	ldw (LIMIT,sp),x 
      009D49 0E CE 00 2F      [ 2] 1599 	ldw y,dvar_bgn
      009D4A 17 03            [ 2] 1600 1$:	ldw (WLKPTR,sp),y
      009D4A 7B               [ 1] 1601 	ldw x,y 
      009D4B 01 C8            [ 2] 1602 	cpw x, (LIMIT,sp) 
      009D4D 00 0D            [ 1] 1603 	jruge 7$ ; no match found 
      009D4F 02 C8            [ 1] 1604 	ld a,(y)
      009D51 00 0E            [ 1] 1605 	and a,#NAME_MAX_LEN
      009D53 02 C8            [ 1] 1606 	cp a,(RECLEN,sp)
      009D55 00 0F            [ 1] 1607 	jrne 2$ 
      009D57 02 72            [ 1] 1608 	incw y 
      009D59 A2 00            [ 2] 1609 	ldw x,(NAMEPTR,sp)
      009D5B 03 90 F7         [ 4] 1610 	call strcmp
      009D5E 90 EF            [ 1] 1611 	jrne 8$ ; match found 
      001DDD                       1612 2$: ; skip this one 	
      009D60 01 20            [ 2] 1613 	ldW Y,(WLKPTR,sp)
      009D62 99 A6            [ 1] 1614 	ld a,(y)
      009D64 84 5B            [ 1] 1615 	and a,#NAME_MAX_LEN 
      009D66 02 81 0E         [ 1] 1616 	ld acc8,a 
      009D68 72 B9 00 0D      [ 2] 1617 	addw y,acc16 
      009D68 35 10            [ 2] 1618 	jra 1$  
      001DEC                       1619 7$: ; no match found 
      009D6A 00 0B            [ 1] 1620 	clr (WLKPTR,sp)
      009D6C 81 04            [ 1] 1621 	clr (WLKPTR+1,sp)
      009D6D                       1622 8$: ; match found 
      009D6D 35 0A            [ 2] 1623 	ldw x,(WLKPTR,sp) ; record address 
      001DF2                       1624 9$:	_DROP VSIZE
      009D6F 00 0B            [ 2]    1     addw sp,#VSIZE 
      009D71 81 85            [ 2] 1625 	popw y 
      009D72 81               [ 4] 1626 	 ret 
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
      001DF7                       1637 cmd_const:
      009D72 4F AE 16         [ 4] 1638 	call runtime_only
      001DFA                       1639 	_vars VSIZE 
      009D75 68 72            [ 2]    1     sub sp,#VSIZE 
      009D77 B0 00            [ 1] 1640 	ld a,#128 
      009D79 32 81            [ 1] 1641 	ld (RONLY,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      009D7B 0F 03            [ 1] 1642 	clr (REC_LEN,sp)
      009D7B 3B 00            [ 2] 1643 	jra cmd_dim2 ; shared code with cmd_dim  
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
      001E04                       1654 cmd_dim:
      009D7D 0B AE 9F         [ 4] 1655 	call runtime_only
      001E07                       1656 cmd_dim1:	
      001E07                       1657 	_vars VSIZE
      009D80 5A CD            [ 2]    1     sub sp,#VSIZE 
      009D82 8A 24            [ 1] 1658 	clr (REC_LEN,sp )
      009D84 CE 00            [ 1] 1659 	clr (RONLY,sp)
      001E0D                       1660 cmd_dim2: 
      009D86 1C 35 10         [ 4] 1661 0$:	call next_token 
      009D89 00 0B            [ 1] 1662 	cp a,#TK_LABEL  
      009D8B CD 99            [ 1] 1663 	jreq 1$ 
      009D8D 06 32 00         [ 2] 1664 	jp syntax_error 
      009D90 0B AE            [ 2] 1665 1$: ldw (VAR_NAME,sp),x ; name pointer 
      009D92 9F 6C CD         [ 4] 1666 	call strlen
      009D95 8A 24            [ 1] 1667 	add a,#REC_XTRA_BYTES
      009D97 CE 00            [ 1] 1668 	ld (REC_LEN+1,sp),a
      009D99 1E 72 B0         [ 4] 1669 	call skip_string 
      009D9C 00 1C            [ 1] 1670 	ld a,(REC_LEN+1,sp)
      009D9E CD 99            [ 2] 1671 	ldw x,(VAR_NAME,sp) 
      009DA0 06 AE 9F         [ 4] 1672 	call search_name  
      009DA3 7D               [ 2] 1673 	tnzw x 
      009DA4 CD 8A            [ 1] 1674 	jreq 2$
      009DA6 24 81            [ 1] 1675 	ld a,#ERR_DUPLICATE
      009DA8 CC 16 D9         [ 2] 1676 	jp tb_error  
      009DA8 CD 9D 72         [ 2] 1677 2$:	ldw x,dvar_end 
      009DAB A6 03            [ 1] 1678 	ld a,(REC_LEN+1,sp)
      009DAD 62 CF            [ 1] 1679 	or a,(RONLY,sp)
      009DAF 00               [ 1] 1680 	ld (x),a 
      009DB0 21               [ 1] 1681 	incw x 
      009DB1 4F 81            [ 2] 1682 	pushw y 
      009DB3 16 03            [ 2] 1683 	ldw y,(VAR_NAME+2,sp)
      009DB3 CD 98 BE         [ 4] 1684 	call strcpy
      009DB6 A1 85            [ 2] 1685 	popw y 
      009DB8 27               [ 2] 1686 	decw x
      009DB9 0C A1 05         [ 2] 1687 	addw x,(REC_LEN,sp)
      009DBC 27 03 CC         [ 2] 1688 	ldw dvar_end,x 
      009DBF 97 57 03         [ 2] 1689 	subw x,#CELL_SIZE  
      009DC1 7F               [ 1] 1690 	clr (x)
      009DC1 CD 9A            [ 1] 1691 	clr (1,x)  
      009DC3 B5 20            [ 1] 1692 	clr (2,x)
      009DC5 03 18 3E         [ 4] 1693 4$: call next_token 
      009DC6 A1 08            [ 1] 1694 	cp a,#TK_COMMA 
      009DC6 CD 98            [ 1] 1695 	jreq 0$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      009DC8 E6 32            [ 1] 1696 	cp a,#TK_EQUAL 
      009DC9 26 2A            [ 1] 1697 	jrne 8$
                                   1698 ; initialize variable 
      009DC9 CF 00 1A         [ 4] 1699 	call condition 
      009DCC CD 98            [ 1] 1700 	cp a,#TK_INTGR
      009DCE BE A1            [ 1] 1701 	jreq 5$
      009DD0 32 27 03         [ 2] 1702 	jp syntax_error
      009DD3 CC 97 57         [ 2] 1703 5$: ldw x,dvar_end 
      009DD6 1D 00 03         [ 2] 1704 	subw x,#CELL_SIZE 
      009DD6 CD 9C F4         [ 2] 1705 	ldw ptr16,x 
      001E71                       1706 	_xpop 
      009DD9 A1 84            [ 1]    1     ld a,(y)
      009DDB 27               [ 1]    2     ldw x,y 
      009DDC 03 CC            [ 2]    3     ldw x,(1,x)
      009DDE 97 57 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009DE0 72 C7 00 19      [ 4] 1707 	ld [ptr16],a 
      009DE0 90 F6 93 EE      [ 1] 1708 	inc ptr8 
      009DE4 01 72 A9 00      [ 5] 1709 	ldw [ptr16],x 
      009DE8 03 CB            [ 2] 1710 	jra 4$ 
      009DE9                       1711 8$:	
      001E88                       1712 	_unget_token 	
      009DE9 72 C7 00 1A 72   [ 1]    1      mov in,in.saved  
      001E8D                       1713 	_drop VSIZE 
      009DEE 5C 00            [ 2]    1     addw sp,#VSIZE 
      009DF0 1B 72 CF         [ 4] 1714 	call ubound 
      009DF3 00               [ 4] 1715 	ret 
                                   1716 
                                   1717 
                                   1718 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1719 ; return program size 
                                   1720 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001E93                       1721 prog_size:
      009DF4 1A 81 1D         [ 2] 1722 	ldw x,txtend 
      009DF6 72 B0 00 1B      [ 2] 1723 	subw x,txtbgn 
      009DF6 F6               [ 4] 1724 	ret 
                                   1725 
                                   1726 ;----------------------------
                                   1727 ; print program information 
                                   1728 ;---------------------------
      001E9B                       1729 program_info: 
      009DF7 A4 0F A0         [ 2] 1730 	ldw x,#PROG_ADDR 
      009DFA 03 88 4B         [ 4] 1731 	call puts 
      009DFD 00 72 FB         [ 2] 1732 	ldw x,txtbgn 
      009E00 01 F6 EE 01      [ 1] 1733 	mov base,#16 
      009E04 5B 02 81         [ 4] 1734 	call prt_i16
      009E07 35 0A 00 0A      [ 1] 1735 	mov base,#10  
      009E07 AE 40 00         [ 2] 1736 	ldw x,#PROG_SIZE
      009E0A 35 08 00         [ 4] 1737 	call puts 
      009E0D 0F A3 47         [ 4] 1738 	call prog_size 
      009E10 F8 24 17         [ 4] 1739 	call prt_i16 
      009E13 F6 26 0C         [ 2] 1740 	ldw x,#STR_BYTES 
      009E16 5C 72 5A         [ 4] 1741 	call puts
      009E19 00 0F 26         [ 2] 1742 	ldw x,txtbgn
      009E1C F6 1D 00         [ 2] 1743 	cpw x,#app 
      009E1F 08 20            [ 1] 1744 	jrult 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      009E21 09 F6 5C         [ 2] 1745 	ldw x,#FLASH_MEM 
      009E24 4D 26            [ 2] 1746 	jra 3$
      009E26 FB 5A 20         [ 2] 1747 2$: ldw x,#RAM_MEM 	 
      009E29 E0 5F 4F         [ 4] 1748 3$:	call puts 
      009E2C CF 00            [ 1] 1749 	ld a,#CR 
      009E2E 24 81 47         [ 4] 1750 	call putc
      009E30 81               [ 4] 1751 	ret 
                                   1752 
      009E30 90 89 52 08 72 5F 00  1753 PROG_ADDR: .asciz "program address: "
             0E 6B 05 1F 01 CE 00
             32 1F 07 90
      009E42 CE 00 30 17 03 93 13  1754 PROG_SIZE: .asciz ", program size: "
             07 24 20 90 F6 A4 0F
             11 05 26
      009E53 09 90 5C 1E 01 CD 94  1755 STR_BYTES: .asciz " bytes" 
      009E5A 5E 26 13 20 46 4C 41  1756 FLASH_MEM: .asciz " in FLASH memory" 
             53 48 20 6D 65 6D 6F
             72 79 00
      009E5D 20 69 6E 20 52 41 4D  1757 RAM_MEM:   .asciz " in RAM memory" 
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
      001F24                       1771 cmd_list:
      009E5D 16 03 90         [ 4] 1772 	call cmd_line_only
      009E60 F6 A4 0F         [ 4] 1773 	call prog_size 
      009E63 C7 00            [ 1] 1774 	jrugt 3$
      009E65 0F               [ 4] 1775 	ret 
      001F2D                       1776 3$: _vars VSIZE
      009E66 72 B9            [ 2]    1     sub sp,#VSIZE 
      009E68 00 0E 20         [ 2] 1777 	ldw x,txtbgn 
      009E6B D9 05            [ 2] 1778 	ldw (LN_PTR,sp),x 
      009E6C FE               [ 2] 1779 	ldw x,(x) 
      009E6C 0F 03            [ 2] 1780 	ldw (FIRST,sp),x ; list from first line 
      009E6E 0F 04 FF         [ 2] 1781 	ldw x,#MAX_LINENO ; biggest line number 
      009E70 1F 03            [ 2] 1782 	ldw (LAST,sp),x 
      009E70 1E 03 5B         [ 4] 1783 	call next_token 
      009E73 08 90            [ 1] 1784 	cp a,#TK_INTGR
      009E75 85 81            [ 1] 1785 	jreq start_from 
      009E77                       1786 is_minus: 	
      009E77 CD 9A            [ 1] 1787 	cp a,#TK_MINUS 
      009E79 7C 52            [ 1] 1788 	jreq end_at_line
      001F47                       1789 	_unget_token 
      009E7B 05 A6 80 6B 05   [ 1]    1      mov in,in.saved  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      009E80 0F 03            [ 2] 1790 	jra list_loop 
      001F4E                       1791 start_from:	 
      009E82 20 09 70         [ 4] 1792 	call get_int24
      009E84 1F 01            [ 2] 1793 	ldw (FIRST,sp),x	
      001F53                       1794 lines_skip:
      009E84 CD 9A            [ 2] 1795 	pushw y 
      009E86 7C               [ 1] 1796 	clr a 
      009E87 CD 0C 8D         [ 4] 1797 	call search_lineno 
      009E87 52               [ 2] 1798 	tnzw x 
      009E88 05 0F            [ 1] 1799 	jrne 1$
      009E8A 03               [ 1] 1800 	ldw x,y 
      009E8B 0F 05            [ 2] 1801 1$:	popw y 
      009E8D 1F 05            [ 2] 1802 	ldw (LN_PTR,sp),x 
      009E8D CD 98 BE         [ 4] 1803 	call next_token 
      009E90 A1 03            [ 1] 1804 	cp a,#TK_MINUS 
      009E92 27 03            [ 1] 1805 	jreq end_at_line 
      009E94 CC 97            [ 2] 1806 	ldw x,(FIRST,sp)
      009E96 57 1F            [ 2] 1807 	ldw (LAST,sp),x 
      009E98 01 CD            [ 2] 1808 	jra list_loop 
      001F6E                       1809 end_at_line:
                                   1810 ; expect ending line# 
      009E9A 94 53 AB         [ 4] 1811     call next_token 
      009E9D 05 6B            [ 1] 1812 	cp a,#TK_INTGR
      009E9F 04 CD            [ 1] 1813 	jreq 1$
      001F75                       1814 	_unget_token 
      009EA1 98 D7 7B 04 1E   [ 1]    1      mov in,in.saved  
      009EA6 01 CD            [ 2] 1815 	jra list_loop
      001F7C                       1816 1$:
      009EA8 9E 30 5D         [ 4] 1817 	call get_int24 
      009EAB 27 05            [ 2] 1818 	ldw (LAST,sp),x 
                                   1819 ; print loop
      001F81                       1820 list_loop:
      009EAD A6 08            [ 2] 1821 	ldw x,(LN_PTR,sp)
      009EAF CC 97            [ 1] 1822 	ld a,(2,x) 
      009EB1 59 CE 00         [ 4] 1823 	call prt_basic_line
      009EB4 32 7B            [ 2] 1824 	ldw x,(LN_PTR,sp)
      009EB6 04 1A            [ 1] 1825 	ld a,(2,x)
      009EB8 05 F7 5C         [ 1] 1826 	ld acc8,a 
      009EBB 90 89 16 03      [ 1] 1827 	clr acc16 
      009EBF CD 94 6F 90      [ 2] 1828 	addw x,acc16
      009EC3 85 5A 72         [ 2] 1829 	cpw x,txtend 
      009EC6 FB 03            [ 1] 1830 	jrpl list_exit
      009EC8 CF 00            [ 2] 1831 	ldw (LN_PTR,sp),x
      009ECA 32               [ 2] 1832 	ldw x,(x)
      009ECB 1D 00            [ 2] 1833 	cpw x,(LAST,sp)  
      009ECD 03 7F            [ 1] 1834 	jrsle list_loop
      001FA3                       1835 list_exit:
      009ECF 6F 01 6F 02 CD   [ 1] 1836 	mov in,count 
      009ED4 98 BE A1         [ 2] 1837 	ldw x,#pad 
      009ED7 08 27 B3         [ 2] 1838 	ldw basicptr,x 
      001FAE                       1839 	_drop VSIZE 
      009EDA A1 32            [ 2]    1     addw sp,#VSIZE 
      009EDC 26 2A CD         [ 4] 1840 	call program_info
      009EDF 9C F4 A1 84 27   [ 2] 1841 	btjf flags,#FLN_REJECTED,9$
      009EE4 03 CC 97         [ 2] 1842 	ldw x,#LINES_REJECTED
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      009EE7 57 CE 00         [ 4] 1843 	call puts
      001FBE                       1844 9$: 
      009EEA 32               [ 4] 1845 	ret
      009EEB 1D 00 03 CF 00 1A 90  1846 LINES_REJECTED: .asciz "WARNING: lines missing in this program.\n"
             F6 93 EE 01 72 A9 00
             03 72 C7 00 1A 72 5C
             00 1B 72 CF 00 1A 20
             CB 73 20 70 72 6F 67
             72 61 6D 2E 0A 00
                                   1847 
                                   1848 ;--------------------------
                                   1849 ; BASIC: EDIT label 
                                   1850 ;  copy program in FLASH 
                                   1851 ;  to RAM for edition 
                                   1852 ;-------------------------
      009F08                       1853 cmd_edit:
      009F08 55 00 04         [ 4] 1854 	call cmd_line_only
      009F0B 00 02            [ 1] 1855 	ld a,#TK_LABEL 
      009F0D 5B 05 CD         [ 4] 1856 	call expect  
      009F10 9D               [ 2] 1857 	pushw x 
      009F11 A8 81 57         [ 4] 1858 	call skip_string
      009F13 85               [ 2] 1859 	popw x 
      009F13 CE 00 1E         [ 4] 1860 	call search_program 
      009F16 72 B0            [ 1] 1861     jrne 1$ 
      009F18 00 1C 81         [ 2] 1862 	ldw x,#ERR_NO_PROGRAM
      009F1B CC 16 D9         [ 2] 1863 	jp tb_error 
      009F1B AE 9F            [ 2] 1864 1$: pushw y 
      009F1D 5A CD            [ 1] 1865 	ldw y,x ; source address 
      009F1F 8A 24 CE         [ 2] 1866 	subw x,#4
      009F22 00 1C            [ 2] 1867 	ldw x,(2,x) ; program size 
      009F24 35 10 00         [ 2] 1868 	addw x,#4 
      009F27 0B CD 99         [ 2] 1869 	ldw acc16,x  ; bytes to copy 
      009F2A 06 35 0A         [ 2] 1870 	ldw x,#rsign ; destination address 
      009F2D 00 0B AE 9F      [ 2] 1871 	subw y,#4 
      009F31 6C CD 8A         [ 4] 1872 	call move  
      009F34 24 CD 9F         [ 2] 1873 	ldw x,#free_ram 
      009F37 13 CD 99         [ 2] 1874 	ldw txtbgn,x 
      009F3A 06 AE 9F 7D      [ 2] 1875 	addw x,rsize  
      009F3E CD 8A 24         [ 2] 1876 	ldw txtend,x
      009F41 CE 00            [ 2] 1877 	popw y  
      009F43 1C               [ 4] 1878 	ret 
                                   1879 
                                   1880 ;--------------------------
                                   1881 ; decompile line from token list
                                   1882 ; and print it. 
                                   1883 ; input:
                                   1884 ;   A       stop at this position 
                                   1885 ;   X 		pointer at line
                                   1886 ; output:
                                   1887 ;   none 
                                   1888 ;--------------------------	
      002029                       1889 prt_basic_line:
      009F44 A3 B9            [ 2] 1890 	pushw y 
      009F46 04 25 05         [ 1] 1891 	ld count,a 
      009F49 AE 9F            [ 1] 1892 	ld a,(2,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      009F4B 84 20 03         [ 1] 1893 	cp a,count 
      009F4E AE 9F            [ 1] 1894 	jrpl 1$ 
      009F50 95 CD 8A         [ 1] 1895 	ld count,a 
      009F53 24 A6 0D         [ 2] 1896 1$:	ldw basicptr,x 
      009F56 CD 89 C7 81      [ 2] 1897 	ldw y,#tib  
      009F5A 70 72 6F         [ 4] 1898 	call decompile 
      009F5D 67 72 61         [ 4] 1899 	call puts 
      009F60 6D 20            [ 1] 1900 	ld a,#CR 
      009F62 61 64 64         [ 4] 1901 	call putc 
      009F65 72 65            [ 2] 1902 	popw y 
      009F67 73               [ 4] 1903 	ret 
                                   1904 
                                   1905 
                                   1906 ;---------------------------------
                                   1907 ; BASIC: PRINT|? arg_list 
                                   1908 ; print values from argument list
                                   1909 ;----------------------------------
                           000001  1910 	SEMICOL=1
                           000001  1911 	VSIZE=1
      00204D                       1912 print:
      00204D                       1913 	_vars VSIZE 
      009F68 73 3A            [ 2]    1     sub sp,#VSIZE 
      00204F                       1914 reset_semicol:
      009F6A 20 00            [ 1] 1915 	clr (SEMICOL,sp)
      002051                       1916 prt_loop:
      009F6C 2C 20 70         [ 4] 1917 	call next_token
      009F6F 72 6F            [ 1] 1918 	cp a,#CMD_END 
      009F71 67 72            [ 1] 1919 	jrult 0$
      009F73 61 6D            [ 1] 1920 	cp a,#TK_COLON 
      009F75 20 73            [ 1] 1921 	jreq 0$
      009F77 69 7A            [ 1] 1922 	cp a,#TK_CMD
      009F79 65 3A            [ 1] 1923 	jrne 10$
      002060                       1924 0$:
      002060                       1925 	_unget_token 
      009F7B 20 00 20 62 79   [ 1]    1      mov in,in.saved  
      009F80 74 65            [ 2] 1926 	jra 8$ 
      002067                       1927 10$:	
      009F82 73 00            [ 1] 1928 	cp a,#TK_QSTR
      009F84 20 69            [ 1] 1929 	jreq 1$
      009F86 6E 20            [ 1] 1930 	cp a,#TK_CHAR 
      009F88 46 4C            [ 1] 1931 	jreq 2$ 
      009F8A 41 53            [ 1] 1932 	cp a,#TK_CFUNC 
      009F8C 48 20            [ 1] 1933 	jreq 3$
      009F8E 6D 65            [ 1] 1934 	cp a,#TK_SEMIC  
      009F90 6D 6F            [ 1] 1935 	jreq 4$
      009F92 72 79            [ 1] 1936 	cp a,#TK_COMMA
      009F94 00 20            [ 1] 1937 	jreq 5$
      009F96 69 6E            [ 2] 1938 	jra 7$ 
      00207D                       1939 1$:	; print string 
      009F98 20 52 41         [ 4] 1940 	call puts
      009F9B 4D               [ 1] 1941 	incw x
      009F9C 20 6D 65 6D      [ 2] 1942 	subw x,basicptr 
      009FA0 6F 72 79         [ 2] 1943 	ldw in.w,x  
      009FA3 00 C5            [ 2] 1944 	jra reset_semicol
      009FA4                       1945 2$:	; print character 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      009FA4 CD 9A 71         [ 4] 1946 	call get_char 
      009FA7 CD 9F 13         [ 4] 1947 	call putc 
      009FAA 22 01            [ 2] 1948 	jra reset_semicol 
      002092                       1949 3$: ; print character function value  	
      002092                       1950 	_get_code_addr 
      009FAC 81               [ 2]    1         ldw x,(x)
      009FAD 52 06 CE 00      [ 1]    2         inc in 
      009FB1 1C 1F 05 FE      [ 1]    3         inc in 
      009FB5 1F               [ 4] 1951 	call (x)
      009FB6 01 AE 7F         [ 4] 1952 	call putc
      009FB9 FF 1F            [ 2] 1953 	jra reset_semicol 
      0020A1                       1954 4$: ; set semi-colon  state 
      009FBB 03 CD            [ 1] 1955 	cpl (SEMICOL,sp)
      009FBD 98 BE            [ 2] 1956 	jra prt_loop 
      0020A5                       1957 5$: ; skip to next terminal tabulation
                                   1958      ; terminal TAB are 8 colons 
      009FBF A1 84            [ 1] 1959      ld a,#9 
      009FC1 27 0B 47         [ 4] 1960 	 call putc 
      009FC3 20 A3            [ 2] 1961 	 jra reset_semicol	    
      0020AC                       1962 7$:	
      0020AC                       1963 	_unget_token 
      009FC3 A1 11 27 27 55   [ 1]    1      mov in,in.saved  
      009FC8 00 04 00         [ 4] 1964 	call condition
      009FCB 02               [ 1] 1965 	tnz a 
      009FCC 20 33            [ 1] 1966 	jreq 8$    
      009FCE CD 18 A8         [ 4] 1967     call print_top
      009FCE CD 98 F0         [ 2] 1968 	jp reset_semicol 
      0020BD                       1969 8$:
      009FD1 1F 01            [ 1] 1970 	tnz (SEMICOL,sp)
      009FD3 26 05            [ 1] 1971 	jrne 9$
      009FD3 90 89            [ 1] 1972 	ld a,#CR 
      009FD5 4F CD 8D         [ 4] 1973     call putc 
      0020C6                       1974 9$:	_drop VSIZE 
      009FD8 0D 5D            [ 2]    1     addw sp,#VSIZE 
      009FDA 26               [ 4] 1975 	ret 
                                   1976 
                                   1977 ;----------------------
                                   1978 ; 'save_context' and
                                   1979 ; 'rest_context' must be 
                                   1980 ; called at the same 
                                   1981 ; call stack depth 
                                   1982 ; i.e. SP must have the 
                                   1983 ; save value at  
                                   1984 ; entry point of both 
                                   1985 ; routine. 
                                   1986 ;---------------------
                           000004  1987 	CTXT_SIZE=4 ; size of saved data 
                                   1988 ;--------------------
                                   1989 ; save current BASIC
                                   1990 ; interpreter context 
                                   1991 ; on stack 
                                   1992 ;--------------------
      0020C9                       1993 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      0020C9                       1994 	_arg BPTR 1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



                           000003     1     BPTR=ARG_OFS+1 
      0020C9                       1995 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      0020C9                       1996 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      0020C9                       1997 save_context:
      009FDB 01 93 90         [ 2] 1998 	ldw x,basicptr 
      009FDE 85 1F            [ 2] 1999 	ldw (BPTR,sp),x
      009FE0 05 CD 98         [ 1] 2000 	ld a,in 
      009FE3 BE A1            [ 1] 2001 	ld (IN,sp),a
      009FE5 11 27 06         [ 1] 2002 	ld a,count 
      009FE8 1E 01            [ 1] 2003 	ld (CNT,sp),a  
      009FEA 1F               [ 4] 2004 	ret
                                   2005 
                                   2006 ;-----------------------
                                   2007 ; restore previously saved 
                                   2008 ; BASIC interpreter context 
                                   2009 ; from stack 
                                   2010 ;-------------------------
      0020D9                       2011 rest_context:
      009FEB 03 20            [ 2] 2012 	ldw x,(BPTR,sp)
      009FED 13 00 04         [ 2] 2013 	ldw basicptr,x 
      009FEE 7B 05            [ 1] 2014 	ld a,(IN,sp)
      009FEE CD 98 BE         [ 1] 2015 	ld in,a
      009FF1 A1 84            [ 1] 2016 	ld a,(CNT,sp)
      009FF3 27 07 55         [ 1] 2017 	ld count,a  
      009FF6 00               [ 4] 2018 	ret
                                   2019 
                                   2020 
                                   2021 
                                   2022 ;------------------------------------------
                                   2023 ; BASIC: INPUT [string]var[,[string]var]
                                   2024 ; input value in variables 
                                   2025 ; [string] optionally can be used as prompt 
                                   2026 ;-----------------------------------------
                           000001  2027 	CX_BPTR=1
                           000003  2028 	CX_IN=3
                           000004  2029 	CX_CNT=4
                           000005  2030 	SKIP=5
                           000005  2031 	VSIZE=5
      0020E9                       2032 input_var:
      009FF7 04 00            [ 2] 2033 	pushw y 
      0020EB                       2034 	_vars VSIZE 
      009FF9 02 20            [ 2]    1     sub sp,#VSIZE 
      0020ED                       2035 input_loop:
      009FFB 05 05            [ 1] 2036 	clr (SKIP,sp)
      009FFC CD 18 3E         [ 4] 2037 	call next_token 
      009FFC CD 98            [ 1] 2038 	cp a,#TK_QSTR 
      009FFE F0 1F            [ 1] 2039 	jrne 1$ 
      00A000 03 09 A4         [ 4] 2040 	call puts 
      00A001 5C               [ 1] 2041 	incw x 
      00A001 1E 05 E6 02      [ 2] 2042 	subw x,basicptr 
      00A005 CD A0 A9         [ 2] 2043 	ldw in.w,x 
      00A008 1E 05            [ 1] 2044 	cpl (SKIP,sp)
      00A00A E6 02 C7         [ 4] 2045 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      00A00D 00 0F            [ 1] 2046 1$: cp a,#TK_VAR  
      00A00F 72 5F            [ 1] 2047 	jreq 2$ 
      00A011 00 0E 72         [ 2] 2048 	jp syntax_error
      00A014 BB 00 0E         [ 4] 2049 2$:	call get_addr
      00A017 C3 00 1E         [ 2] 2050 	ldw ptr16,x 
      00A01A 2A 07            [ 1] 2051 	tnz (SKIP,sp)
      00A01C 1F 05            [ 1] 2052 	jrne 21$ 
      00A01E FE 13 03         [ 4] 2053 	call var_name 
      00A021 2D DE 47         [ 4] 2054 	call putc   
      00A023                       2055 21$:
      00A023 55 00            [ 1] 2056 	ld a,#':
      00A025 03 00 02         [ 4] 2057 	call putc 
      00A028 AE 16 B8         [ 4] 2058 	call save_context 
      00A02B CF 00 05 5B      [ 1] 2059 	clr count  
      00A02F 06 CD 9F         [ 4] 2060 	call readln 
      00A032 1B 72 0D         [ 2] 2061 	ldw x,#tib 
      00A035 00 23 06         [ 1] 2062 	push count
      00A038 AE A0            [ 1] 2063 	push #0 
      00A03A 3F CD 8A         [ 2] 2064 	addw x,(1,sp)
      00A03D 24               [ 1] 2065 	incw x 
      00A03E                       2066 	_drop 2 
      00A03E 81 57            [ 2]    1     addw sp,#2 
      00A040 41 52 4E 49      [ 1] 2067 	clr in 
      00A044 4E 47 3A         [ 4] 2068 	call get_token
      00A047 20 6C            [ 1] 2069 	cp a,#TK_INTGR
      00A049 69 6E            [ 1] 2070 	jreq 3$ 
      00A04B 65 73            [ 1] 2071 	cp a,#TK_MINUS
      00A04D 20 6D            [ 1] 2072 	jrne 22$
      00A04F 69 73 73         [ 4] 2073 	call get_token 
      00A052 69 6E            [ 1] 2074 	cp a,#TK_INTGR 
      00A054 67 20            [ 1] 2075 	jreq 23$
      002150                       2076 22$:
      00A056 69 6E 20         [ 4] 2077 	call rest_context 
      00A059 74 68 69         [ 2] 2078 	jp syntax_error
      002156                       2079 23$:
      00A05C 73 20 70         [ 4] 2080 	call neg_acc24	
      002159                       2081 3$: 
      00A05F 72 6F 67         [ 1] 2082 	ld a,acc24 
      00A062 72 61 6D         [ 2] 2083 	ldw x,acc16 
      00A065 2E 0A 00 19      [ 4] 2084 	ld [ptr16],a
      00A068 72 5C 00 1A      [ 1] 2085 	inc ptr8  
      00A068 CD 9A 71 A6      [ 5] 2086 	ldw [ptr16],x 
      00A06C 03 CD 9A         [ 4] 2087 	call rest_context
      00A06F 87 89 CD         [ 4] 2088 	call next_token 
      00A072 98 D7            [ 1] 2089 	cp a,#TK_COMMA
      00A074 85 CD            [ 1] 2090 	jrne 4$ 
      00A076 B2 A3 26         [ 2] 2091 	jp input_loop
      002178                       2092 4$:
      00A079 06 AE            [ 1] 2093 	cp a,#TK_NONE 
      00A07B 00 12            [ 1] 2094 	jreq input_exit  
      00A07D CC 97            [ 1] 2095 	cp a,#TK_COLON 
      00A07F 59 90            [ 1] 2096     jreq input_exit 
      00A081 89 90 93         [ 2] 2097 	jp syntax_error 
      002183                       2098 input_exit:
      002183                       2099 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      00A084 1D 00            [ 2]    1     addw sp,#VSIZE 
      00A086 04 EE            [ 2] 2100 	popw y 
      00A088 02               [ 4] 2101 	ret 
                                   2102 
                                   2103 
                                   2104 ;---------------------
                                   2105 ; BASIC: REM | ' 
                                   2106 ; skip comment to end of line 
                                   2107 ;---------------------- 
      002188                       2108 remark::
      00A089 1C 00 04 CF 00   [ 1] 2109 	mov in,count 
      00A08E 0E               [ 4] 2110  	ret 
                                   2111 
                                   2112 
                                   2113 ;---------------------
                                   2114 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2115 ; read in loop 'addr'  
                                   2116 ; apply & 'mask' to value 
                                   2117 ; loop while result==0.  
                                   2118 ; 'xor_mask' is used to 
                                   2119 ; invert the wait logic.
                                   2120 ; i.e. loop while not 0.
                                   2121 ;---------------------
                           000001  2122 	XMASK=1 
                           000002  2123 	MASK=2
                           000003  2124 	ADDR=3
                           000004  2125 	VSIZE=4
      00218E                       2126 wait: 
      00218E                       2127 	_vars VSIZE
      00A08F AE 00            [ 2]    1     sub sp,#VSIZE 
      00A091 8C 72            [ 1] 2128 	clr (XMASK,sp) 
      00A093 A2 00 04         [ 4] 2129 	call arg_list 
      00A096 CD 94            [ 1] 2130 	cp a,#2
      00A098 7F AE            [ 1] 2131 	jruge 0$
      00A09A 00 90 CF         [ 2] 2132 	jp syntax_error 
      00A09D 00 1C            [ 1] 2133 0$:	cp a,#3
      00A09F 72 BB            [ 1] 2134 	jrult 1$
      0021A0                       2135 	_xpop  ; xor mask 
      00A0A1 00 8E            [ 1]    1     ld a,(y)
      00A0A3 CF               [ 1]    2     ldw x,y 
      00A0A4 00 1E            [ 2]    3     ldw x,(1,x)
      00A0A6 90 85 81 03      [ 2]    4     addw y,#CELL_SIZE 
      00A0A9 9F               [ 1] 2136 	ld a,xl 
      00A0A9 90 89            [ 1] 2137 	ld (XMASK,sp),a 
      0021AC                       2138 1$: _xpop ; mask
      00A0AB C7 00            [ 1]    1     ld a,(y)
      00A0AD 03               [ 1]    2     ldw x,y 
      00A0AE E6 02            [ 2]    3     ldw x,(1,x)
      00A0B0 C1 00 03 2A      [ 2]    4     addw y,#CELL_SIZE 
      00A0B4 03               [ 1] 2139     ld a,xl  
      00A0B5 C7 00            [ 1] 2140 	ld (MASK,sp),a 
      0021B8                       2141 	_xpop ; address 
      00A0B7 03 CF            [ 1]    1     ld a,(y)
      00A0B9 00               [ 1]    2     ldw x,y 
      00A0BA 05 90            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      00A0BC AE 16 68 CD      [ 2]    4     addw y,#CELL_SIZE 
      00A0C0 92               [ 1] 2142 2$:	ld a,(x)
      00A0C1 86 CD            [ 1] 2143 	and a,(MASK,sp)
      00A0C3 8A 24            [ 1] 2144 	xor a,(XMASK,sp)
      00A0C5 A6 0D            [ 1] 2145 	jreq 2$ 
      0021C8                       2146 	_drop VSIZE 
      00A0C7 CD 89            [ 2]    1     addw sp,#VSIZE 
      00A0C9 C7               [ 4] 2147 	ret 
                                   2148 
                                   2149 ;---------------------
                                   2150 ; BASIC: BSET addr,mask
                                   2151 ; set bits at 'addr' corresponding 
                                   2152 ; to those of 'mask' that are at 1.
                                   2153 ; arguments:
                                   2154 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2155 ;   mask        mask|addr
                                   2156 ; output:
                                   2157 ;	none 
                                   2158 ;--------------------------
      0021CB                       2159 bit_set:
      00A0CA 90 85 81         [ 4] 2160 	call arg_list 
      00A0CD A1 02            [ 1] 2161 	cp a,#2	 
      00A0CD 52 01            [ 1] 2162 	jreq 1$ 
      00A0CF CC 16 D7         [ 2] 2163 	jp syntax_error
      0021D5                       2164 1$: 
      0021D5                       2165 	_xpop ; mask 
      00A0CF 0F 01            [ 1]    1     ld a,(y)
      00A0D1 93               [ 1]    2     ldw x,y 
      00A0D1 CD 98            [ 2]    3     ldw x,(1,x)
      00A0D3 BE A1 02 25      [ 2]    4     addw y,#CELL_SIZE 
      00A0D7 08               [ 1] 2166 	ld a,xl
      00A0D8 A1               [ 1] 2167 	push a  
      0021E0                       2168 	_xpop ; addr  
      00A0D9 09 27            [ 1]    1     ld a,(y)
      00A0DB 04               [ 1]    2     ldw x,y 
      00A0DC A1 80            [ 2]    3     ldw x,(1,x)
      00A0DE 26 07 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A0E0 84               [ 1] 2169 	pop a 
      00A0E0 55               [ 1] 2170 	or a,(x)
      00A0E1 00               [ 1] 2171 	ld (x),a
      00A0E2 04               [ 4] 2172 	ret 
                                   2173 
                                   2174 ;---------------------
                                   2175 ; BASIC: BRES addr,mask
                                   2176 ; reset bits at 'addr' corresponding 
                                   2177 ; to those of 'mask' that are at 1.
                                   2178 ; arguments:
                                   2179 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2180 ;   mask	    ~mask&*addr  
                                   2181 ; output:
                                   2182 ;	none 
                                   2183 ;--------------------------
      0021ED                       2184 bit_reset:
      00A0E3 00 02 20         [ 4] 2185 	call arg_list 
      00A0E6 56 02            [ 1] 2186 	cp a,#2  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      00A0E7 27 03            [ 1] 2187 	jreq 1$ 
      00A0E7 A1 02 27         [ 2] 2188 	jp syntax_error
      0021F7                       2189 1$: 
      0021F7                       2190 	_xpop ; mask 
      00A0EA 12 A1            [ 1]    1     ld a,(y)
      00A0EC 04               [ 1]    2     ldw x,y 
      00A0ED 27 1B            [ 2]    3     ldw x,(1,x)
      00A0EF A1 82 27 1F      [ 2]    4     addw y,#CELL_SIZE 
      00A0F3 A1               [ 1] 2191 	ld a,xl 
      00A0F4 0A               [ 1] 2192 	cpl a
      00A0F5 27               [ 1] 2193 	push a  
      002203                       2194 	_xpop ; addr  
      00A0F6 2A A1            [ 1]    1     ld a,(y)
      00A0F8 08               [ 1]    2     ldw x,y 
      00A0F9 27 2A            [ 2]    3     ldw x,(1,x)
      00A0FB 20 2F 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A0FD 84               [ 1] 2195 	pop a 
      00A0FD CD               [ 1] 2196 	and a,(x)
      00A0FE 8A               [ 1] 2197 	ld (x),a 
      00A0FF 24               [ 4] 2198 	ret 
                                   2199 
                                   2200 ;---------------------
                                   2201 ; BASIC: BTOGL addr,mask
                                   2202 ; toggle bits at 'addr' corresponding 
                                   2203 ; to those of 'mask' that are at 1.
                                   2204 ; arguments:
                                   2205 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2206 ;   mask	    mask^*addr  
                                   2207 ; output:
                                   2208 ;	none 
                                   2209 ;--------------------------
      002210                       2210 bit_toggle:
      00A100 5C 72 B0         [ 4] 2211 	call arg_list 
      00A103 00 05            [ 1] 2212 	cp a,#2 
      00A105 CF 00            [ 1] 2213 	jreq 1$ 
      00A107 01 20 C5         [ 2] 2214 	jp syntax_error
      00A10A                       2215 1$: _xpop ; mask 
      00A10A CD 99            [ 1]    1     ld a,(y)
      00A10C 00               [ 1]    2     ldw x,y 
      00A10D CD 89            [ 2]    3     ldw x,(1,x)
      00A10F C7 20 BD 03      [ 2]    4     addw y,#CELL_SIZE 
      00A112 9F               [ 1] 2216 	ld a,xl
      00A112 FE               [ 1] 2217 	push a 
      002225                       2218 	_xpop  ; addr  
      00A113 72 5C            [ 1]    1     ld a,(y)
      00A115 00               [ 1]    2     ldw x,y 
      00A116 02 72            [ 2]    3     ldw x,(1,x)
      00A118 5C 00 02 FD      [ 2]    4     addw y,#CELL_SIZE 
      00A11C CD               [ 1] 2219 	pop a 
      00A11D 89               [ 1] 2220 	xor a,(x)
      00A11E C7               [ 1] 2221 	ld (x),a 
      00A11F 20               [ 4] 2222 	ret 
                                   2223 
                                   2224 
                                   2225 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



                                   2226 ; BASIC: BTEST(addr,bit)
                                   2227 ; return bit value at 'addr' 
                                   2228 ; bit is in range {0..7}.
                                   2229 ; arguments:
                                   2230 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2231 ;   bit 	    bit position {0..7}  
                                   2232 ; output:
                                   2233 ;	A:X       bit value  
                                   2234 ;--------------------------
      002232                       2235 bit_test:
      00A120 AE 1A 14         [ 4] 2236 	call func_args 
      00A121 A1 02            [ 1] 2237 	cp a,#2
      00A121 03 01            [ 1] 2238 	jreq 0$
      00A123 20 AC D7         [ 2] 2239 	jp syntax_error
      00A125                       2240 0$:	
      00223C                       2241 	_xpop 
      00A125 A6 09            [ 1]    1     ld a,(y)
      00A127 CD               [ 1]    2     ldw x,y 
      00A128 89 C7            [ 2]    3     ldw x,(1,x)
      00A12A 20 A3 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A12C 9F               [ 1] 2242 	ld a,xl 
      00A12C 55 00            [ 1] 2243 	and a,#7
      00A12E 04               [ 1] 2244 	push a   
      00A12F 00 02            [ 1] 2245 	ld a,#1 
      00A131 CD 9C            [ 1] 2246 1$: tnz (1,sp)
      00A133 F4 4D            [ 1] 2247 	jreq 2$
      00A135 27               [ 1] 2248 	sll a 
      00A136 06 CD            [ 1] 2249 	dec (1,sp)
      00A138 99 28            [ 2] 2250 	jra 1$
      00A13A CC A0            [ 1] 2251 2$: ld (1,sp),a  
      002256                       2252 	_xpop ; address  
      00A13C CF F6            [ 1]    1     ld a,(y)
      00A13D 93               [ 1]    2     ldw x,y 
      00A13D 0D 01            [ 2]    3     ldw x,(1,x)
      00A13F 26 05 A6 0D      [ 2]    4     addw y,#CELL_SIZE 
      00A143 CD               [ 1] 2253 	pop a 
      00A144 89               [ 1] 2254 	and a,(x)
      00A145 C7 5B            [ 1] 2255 	jreq 3$
      00A147 01 81            [ 1] 2256 	ld a,#1 
      00A149 5F               [ 1] 2257 3$:	clrw x 
      00A149 CE               [ 1] 2258 	ld xl,a
      00A14A 00               [ 1] 2259 	clr a  
      00A14B 05               [ 4] 2260 	ret
                                   2261 
                                   2262 ;--------------------
                                   2263 ; BASIC: POKE addr,byte
                                   2264 ; put a byte at addr 
                                   2265 ;--------------------
      002269                       2266 poke:
      00A14C 1F 03 C6         [ 4] 2267 	call arg_list 
      00A14F 00 02            [ 1] 2268 	cp a,#2
      00A151 6B 05            [ 1] 2269 	jreq 1$
      00A153 C6 00 03         [ 2] 2270 	jp syntax_error
      002273                       2271 1$:	
      002273                       2272 	_xpop ; byte   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      00A156 6B 06            [ 1]    1     ld a,(y)
      00A158 81               [ 1]    2     ldw x,y 
      00A159 EE 01            [ 2]    3     ldw x,(1,x)
      00A159 1E 03 CF 00      [ 2]    4     addw y,#CELL_SIZE 
      00A15D 05               [ 1] 2273     ld a,xl 
      00A15E 7B               [ 1] 2274 	push a 
      00227E                       2275 	_xpop ; address 
      00A15F 05 C7            [ 1]    1     ld a,(y)
      00A161 00               [ 1]    2     ldw x,y 
      00A162 02 7B            [ 2]    3     ldw x,(1,x)
      00A164 06 C7 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A168 81               [ 1] 2276 	pop a 
      00A169 F7               [ 1] 2277 	ld (x),a 
      00A169 90               [ 4] 2278 	ret 
                                   2279 
                                   2280 ;-----------------------
                                   2281 ; BASIC: PEEK(addr)
                                   2282 ; get the byte at addr 
                                   2283 ; input:
                                   2284 ;	none 
                                   2285 ; output:
                                   2286 ;	X 		value 
                                   2287 ;-----------------------
      00228A                       2288 peek:
      00A16A 89 52 05         [ 4] 2289 	call func_args
      00A16D A1 01            [ 1] 2290 	cp a,#1 
      00A16D 0F 05            [ 1] 2291 	jreq 1$
      00A16F CD 98 BE         [ 2] 2292 	jp syntax_error
      002294                       2293 1$: _xpop ; address  
      00A172 A1 02            [ 1]    1     ld a,(y)
      00A174 26               [ 1]    2     ldw x,y 
      00A175 10 CD            [ 2]    3     ldw x,(1,x)
      00A177 8A 24 5C 72      [ 2]    4     addw y,#CELL_SIZE 
      00A17B B0 00 05         [ 1] 2294 	ld farptr,a 
      00A17E CF 00 01         [ 2] 2295 	ldw ptr16,x 
      00A181 03 05 CD 98      [ 5] 2296 	ldf a,[farptr]
      00A185 BE               [ 1] 2297 	clrw x 
      00A186 A1               [ 1] 2298 	ld xl,a 
      00A187 85               [ 1] 2299 	clr a 
      00A188 27               [ 4] 2300 	ret 
                                   2301 
                                   2302 ;---------------------------
                                   2303 ; BASIC IF expr : instructions
                                   2304 ; evaluate expr and if true 
                                   2305 ; execute instructions on same line. 
                                   2306 ;----------------------------
      0022AB                       2307 if: 
      00A189 03 CC 97         [ 4] 2308 	call condition  
      0022AE                       2309 	_xpop 
      00A18C 57 CD            [ 1]    1     ld a,(y)
      00A18E 98               [ 1]    2     ldw x,y 
      00A18F E6 CF            [ 2]    3     ldw x,(1,x)
      00A191 00 1A 0D 05      [ 2]    4     addw y,#CELL_SIZE 
      00A195 26               [ 1] 2310 	tnz  a  
      00A196 06 CD            [ 1] 2311 	jrne 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      00A198 92               [ 2] 2312 	tnzw x 
      00A199 7C CD            [ 1] 2313 	jrne 9$  
                                   2314 ;skip to next line
      00A19B 89 C7 02 00 01   [ 1] 2315 	mov in,count
      00A19D                       2316 	_drop 2 
      00A19D A6 3A            [ 2]    1     addw sp,#2 
      00A19F CD 89 C7         [ 2] 2317 	jp next_line
      00A1A2 CD               [ 4] 2318 9$:	ret 
                                   2319 
                                   2320 ;------------------------
                                   2321 ; BASIC: FOR var=expr 
                                   2322 ; set variable to expression 
                                   2323 ; leave variable address 
                                   2324 ; on stack and set
                                   2325 ; FLOOP bit in 'flags'
                                   2326 ;-----------------
                           000001  2327 	RETL1=1 ; return address  
                           000003  2328 	FSTEP=3  ; variable increment int24
                           000006  2329 	LIMIT=6 ; loop limit, int24  
                           000009  2330 	CVAR=9   ; control variable 
                           00000B  2331 	INW=11   ;  in.w saved
                           00000D  2332 	BPTR=13 ; baseptr saved
                           00000D  2333 	VSIZE=13  
      0022C8                       2334 for: ; { -- var_addr }
      00A1A3 A1               [ 2] 2335 	popw x ; call return address 
      0022C9                       2336 	_vars VSIZE 
      00A1A4 49 72            [ 2]    1     sub sp,#VSIZE 
      00A1A6 5F               [ 2] 2337 	pushw x  ; RETL1 
      00A1A7 00 03            [ 1] 2338 	ld a,#TK_VAR 
      00A1A9 CD 8B 29         [ 4] 2339 	call expect
      00A1AC AE 16 68         [ 4] 2340 	call get_addr
      00A1AF 3B 00            [ 2] 2341 	ldw (CVAR,sp),x  ; control variable 
      00A1B1 03 4B 00         [ 4] 2342 	call let_eval 
      00A1B4 72 FB 01 5C      [ 1] 2343 	bset flags,#FLOOP 
      00A1B8 5B 02 72         [ 4] 2344 	call next_token 
      00A1BB 5F 00            [ 1] 2345 	cp a,#TK_CMD 
      00A1BD 02 CD            [ 1] 2346 	jreq 1$
      00A1BF 8F BD A1         [ 2] 2347 	jp syntax_error
      0022E7                       2348 1$:  
      0022E7                       2349 	_get_code_addr
      00A1C2 84               [ 2]    1         ldw x,(x)
      00A1C3 27 14 A1 11      [ 1]    2         inc in 
      00A1C7 26 07 CD 8F      [ 1]    3         inc in 
      00A1CB BD A1 84         [ 2] 2350 	cpw x,#to   
      00A1CE 27 06            [ 1] 2351 	jreq to
      00A1D0 CC 16 D7         [ 2] 2352 	jp syntax_error 
                                   2353 
                                   2354 ;-----------------------------------
                                   2355 ; BASIC: TO expr 
                                   2356 ; second part of FOR loop initilization
                                   2357 ; leave limit on stack and set 
                                   2358 ; FTO bit in 'flags'
                                   2359 ;-----------------------------------
      0022F8                       2360 to: ; { var_addr -- var_addr limit step }
      00A1D0 CD A1 59 CC 97   [ 2] 2361 	btjt flags,#FLOOP,1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      00A1D5 57 16 D7         [ 2] 2362 	jp syntax_error
      00A1D6 CD 1B 5B         [ 4] 2363 1$: call expression   
      00A1D6 CD 82            [ 1] 2364 	cp a,#TK_INTGR 
      00A1D8 9D 03            [ 1] 2365 	jreq 2$ 
      00A1D9 CC 16 D7         [ 2] 2366 	jp syntax_error
      00230A                       2367 2$: _xpop
      00A1D9 C6 00            [ 1]    1     ld a,(y)
      00A1DB 0D               [ 1]    2     ldw x,y 
      00A1DC CE 00            [ 2]    3     ldw x,(1,x)
      00A1DE 0E 72 C7 00      [ 2]    4     addw y,#CELL_SIZE 
      00A1E2 1A 72            [ 1] 2368 	ld (LIMIT,sp),a 
      00A1E4 5C 00            [ 2] 2369 	ldw (LIMIT+1,sp),x
      00A1E6 1B 72 CF         [ 4] 2370 	call next_token
      00A1E9 00 1A            [ 1] 2371 	cp a,#TK_NONE  
      00A1EB CD A1            [ 1] 2372 	jreq 4$ 
      00A1ED 59 CD            [ 1] 2373 	cp a,#TK_CMD
      00A1EF 98 BE            [ 1] 2374 	jrne 3$
      002322                       2375 	_get_code_addr
      00A1F1 A1               [ 2]    1         ldw x,(x)
      00A1F2 08 26 03 CC      [ 1]    2         inc in 
      00A1F6 A1 6D 00 01      [ 1]    3         inc in 
      00A1F8 A3 23 3E         [ 2] 2376 	cpw x,#step 
      00A1F8 A1 00            [ 1] 2377 	jreq step
      002330                       2378 3$:	
      002330                       2379 	_unget_token   	 
      00A1FA 27 07 A1 09 27   [ 1]    1      mov in,in.saved  
      002335                       2380 4$:	
      00A1FF 03 CC            [ 1] 2381 	clr (FSTEP,sp) 
      00A201 97 57 01         [ 2] 2382 	ldw x,#1   ; default step  
      00A203 1F 04            [ 2] 2383 	ldw (FSTEP+1,sp),x 
      00A203 5B 05            [ 2] 2384 	jra store_loop_addr 
                                   2385 
                                   2386 
                                   2387 ;----------------------------------
                                   2388 ; BASIC: STEP expr 
                                   2389 ; optional third par of FOR loop
                                   2390 ; initialization. 	
                                   2391 ;------------------------------------
      00233E                       2392 step: ; {var limit -- var limit step}
      00A205 90 85 81 22 03   [ 2] 2393 	btjt flags,#FLOOP,1$
      00A208 CC 16 D7         [ 2] 2394 	jp syntax_error
      00A208 55 00 03         [ 4] 2395 1$: call expression 
      00A20B 00 02            [ 1] 2396 	cp a,#TK_INTGR
      00A20D 81 03            [ 1] 2397 	jreq 2$
      00A20E CC 16 D7         [ 2] 2398 	jp syntax_error
      002350                       2399 2$:	
      002350                       2400 	_xpop 
      00A20E 52 04            [ 1]    1     ld a,(y)
      00A210 0F               [ 1]    2     ldw x,y 
      00A211 01 CD            [ 2]    3     ldw x,(1,x)
      00A213 9A 99 A1 02      [ 2]    4     addw y,#CELL_SIZE 
      00A217 24 03            [ 1] 2401 	ld (FSTEP,sp),a 
      00A219 CC 97            [ 2] 2402 	ldw (FSTEP+1,sp),x ; step
                                   2403 ; if step < 0 decrement LIMIT 
      00A21B 57               [ 1] 2404 	tnz a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      00A21C A1 03            [ 1] 2405 	jrpl store_loop_addr 
      00A21E 25 0C            [ 1] 2406 	ld a,(LIMIT,sp)
      00A220 90 F6            [ 2] 2407 	ldw x,(LIMIT+1,sp)
      00A222 93 EE 01         [ 2] 2408 	subw x,#1 
      00A225 72 A9            [ 1] 2409 	sbc a,#0 
      00A227 00 03            [ 1] 2410 	ld (LIMIT,sp),a 
      00A229 9F 6B            [ 2] 2411 	ldw (LIMIT+1,sp),x 
                                   2412 ; leave loop back entry point on cstack 
                                   2413 ; cstack is 1 call deep from interpreter
      00236D                       2414 store_loop_addr:
      00A22B 01 90 F6         [ 2] 2415 	ldw x,basicptr
      00A22E 93 EE            [ 2] 2416 	ldw (BPTR,sp),x 
      00A230 01 72 A9         [ 2] 2417 	ldw x,in.w 
      00A233 00 03            [ 2] 2418 	ldw (INW,sp),x   
      00A235 9F 6B 02 90      [ 1] 2419 	bres flags,#FLOOP 
      00A239 F6 93 EE 01      [ 1] 2420 	inc loop_depth  
      00A23D 72               [ 4] 2421 	ret 
                                   2422 
                                   2423 ;--------------------------------
                                   2424 ; BASIC: NEXT var 
                                   2425 ; FOR loop control 
                                   2426 ; increment variable with step 
                                   2427 ; and compare with limit 
                                   2428 ; loop if threshold not crossed.
                                   2429 ; else stack. 
                                   2430 ; and decrement 'loop_depth' 
                                   2431 ;--------------------------------
      002380                       2432 next: ; {var limit step retl1 -- [var limit step ] }
      00A23E A9 00 03 F6      [ 1] 2433 	tnz loop_depth 
      00A242 14 02            [ 1] 2434 	jrne 1$ 
      00A244 18 01 27         [ 2] 2435 	jp syntax_error 
      002389                       2436 1$: 
      00A247 F9 5B            [ 1] 2437 	ld a,#TK_VAR 
      00A249 04 81 07         [ 4] 2438 	call expect
      00A24B CD 18 66         [ 4] 2439 	call get_addr 
                                   2440 ; check for good variable after NEXT 	 
      00A24B CD 9A            [ 2] 2441 	cpw x,(CVAR,sp)
      00A24D 99 A1            [ 1] 2442 	jreq 2$  
      00A24F 02 27 03         [ 2] 2443 	jp syntax_error ; not the good one 
      002398                       2444 2$: 
      00A252 CC 97 57         [ 2] 2445 	ldw ptr16,x 
                                   2446 	; increment variable 
      00A255 F6               [ 1] 2447 	ld a,(x)
      00A255 90 F6            [ 2] 2448 	ldw x,(1,x)  ; get var value 
      00A257 93 EE 01         [ 2] 2449 	addw x,(FSTEP+1,sp) ; var+step 
      00A25A 72 A9            [ 1] 2450 	adc a,(FSTEP,sp)
      00A25C 00 03 9F 88      [ 4] 2451 	ld [ptr16],a
      00A260 90 F6 93 EE      [ 1] 2452 	inc ptr8  
      00A264 01 72 A9 00      [ 5] 2453 	ldw [ptr16],x 
      00A268 03 84 FA         [ 1] 2454 	ld acc24,a 
      00A26B F7 81 0D         [ 2] 2455 	ldw acc16,x 
      00A26D 7B 06            [ 1] 2456 	ld a,(LIMIT,sp)
      00A26D CD 9A            [ 2] 2457 	ldw x,(LIMIT+1,sp)
      00A26F 99 A1 02 27      [ 2] 2458 	subw x,acc16 
      00A273 03 CC 97         [ 1] 2459 	sbc a,acc24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      00A276 57 03            [ 1] 2460 	xor a,(FSTEP,sp)
      00A277 A8 80            [ 1] 2461 	xor a,#0x80
      00A277 90 F6            [ 1] 2462 	jrmi loop_back  
      00A279 93 EE            [ 2] 2463 	jra loop_done   
                                   2464 ; check sign of STEP  
      00A27B 01 72            [ 1] 2465 	ld a,(FSTEP,sp)
      00A27D A9 00            [ 1] 2466 	jrpl 4$
                                   2467 ;negative step
      00A27F 03 9F 43         [ 1] 2468     ld a,acc8 
      00A282 88 90            [ 1] 2469 	jrslt loop_back   
      00A284 F6 93            [ 2] 2470 	jra loop_done  
      0023D3                       2471 4$: ; positive step
      00A286 EE 01 72 A9 00   [ 2] 2472 	btjt acc8,#7,loop_done 
      0023D8                       2473 loop_back:
      00A28B 03 84            [ 2] 2474 	ldw x,(BPTR,sp)
      00A28D F4 F7 81         [ 2] 2475 	ldw basicptr,x 
      00A290 72 01 00 22 05   [ 2] 2476 	btjf flags,#FRUN,1$ 
      00A290 CD 9A            [ 1] 2477 	ld a,(2,x)
      00A292 99 A1 02         [ 1] 2478 	ld count,a
      00A295 27 03            [ 2] 2479 1$:	ldw x,(INW,sp)
      00A297 CC 97 57         [ 2] 2480 	ldw in.w,x 
      00A29A 90               [ 4] 2481 	ret 
      0023ED                       2482 loop_done:
                                   2483 	; remove loop data from stack  
      00A29B F6               [ 2] 2484 	popw x
      0023EE                       2485 	_drop VSIZE 
      00A29C 93 EE            [ 2]    1     addw sp,#VSIZE 
      00A29E 01 72 A9 00      [ 1] 2486 	dec loop_depth 
      00A2A2 03               [ 2] 2487 	jp (x)
                                   2488 
                                   2489 ;----------------------------
                                   2490 ; called by goto/gosub
                                   2491 ; to get target line number 
                                   2492 ; output:
                                   2493 ;    x    line address 
                                   2494 ;---------------------------
      0023F5                       2495 get_target_line:
      00A2A3 9F 88 90         [ 4] 2496 	call next_token  
      00A2A6 F6 93            [ 1] 2497 	cp a,#TK_INTGR
      00A2A8 EE 01            [ 1] 2498 	jreq get_target_line_addr 
      00A2AA 72 A9            [ 1] 2499 	cp a,#TK_LABEL 
      00A2AC 00 03            [ 1] 2500 	jreq look_target_symbol 
      00A2AE 84 F8 F7         [ 2] 2501 	jp syntax_error
                                   2502 ; the target is a line number 
                                   2503 ; search it. 
      002403                       2504 get_target_line_addr:
      00A2B1 81 89            [ 2] 2505 	pushw y 
      00A2B2 CD 18 70         [ 4] 2506 	call get_int24 ; line # 
      00A2B2 CD               [ 1] 2507 	clr a
      00A2B3 9A 94 A1 02      [ 2] 2508 	ldw y,basicptr 
      00A2B7 27 03            [ 2] 2509 	ldw y,(y)
      00A2B9 CC 97            [ 2] 2510 	pushw y 
      00A2BB 57 01            [ 2] 2511 	cpw x,(1,sp)
      00A2BC                       2512 	_drop 2  
      00A2BC 90 F6            [ 2]    1     addw sp,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      00A2BE 93 EE            [ 1] 2513 	jrult 11$
      00A2C0 01               [ 1] 2514 	inc a 
      002418                       2515 11$: ; scan program for this line# 	
      00A2C1 72 A9 00         [ 4] 2516 	call search_lineno  
      00A2C4 03               [ 2] 2517 	tnzw x ; 0| line# address 
      00A2C5 9F A4            [ 1] 2518 	jrne 2$ 
      00A2C7 07 88            [ 1] 2519 	ld a,#ERR_NO_LINE 
      00A2C9 A6 01 0D         [ 2] 2520 	jp tb_error 
      00A2CC 01 27            [ 2] 2521 2$:	popw y  
      00A2CE 05               [ 4] 2522 	ret 
                                   2523 
                                   2524 ; the GOTO|GOSUB target is a symbol.
                                   2525 ; output:
                                   2526 ;    X    line address|0 
      002426                       2527 look_target_symbol:
      00A2CF 48 0A            [ 2] 2528 	pushw y 
      00A2D1 01               [ 2] 2529 	pushw x 
      00A2D2 20 F7 6B         [ 4] 2530 	call skip_string 
      00A2D5 01 90 F6 93      [ 1] 2531 	clr acc16 
      00A2D9 EE 01 72 A9      [ 2] 2532 	ldw y,txtbgn 
      00A2DD 00 03 84         [ 1] 2533 1$:	ld a,(3,y) ; first TK_ID on line 
      00A2E0 F4 27            [ 1] 2534 	cp a,#TK_LABEL 
      00A2E2 02 A6            [ 1] 2535 	jreq 3$ 
      00A2E4 01 5F 97         [ 1] 2536 2$:	ld a,(2,y); line length 
      00A2E7 4F 81 0E         [ 1] 2537 	ld acc8,a 
      00A2E9 72 B9 00 0D      [ 2] 2538 	addw y,acc16 ;point to next line 
      00A2E9 CD 9A 99 A1      [ 2] 2539 	cpw y,txtend 
      00A2ED 02 27            [ 1] 2540 	jrult 1$
      00A2EF 03 CC            [ 1] 2541 	ld a,#ERR_BAD_VALUE
      00A2F1 97 57 D9         [ 2] 2542 	jp tb_error 
      00A2F3                       2543 3$: ; found a TK_LABEL 
                                   2544 	; compare with GOTO|GOSUB target 
      00A2F3 90 F6            [ 2] 2545 	pushw y ; line address 
      00A2F5 93 EE 01 72      [ 2] 2546 	addw y,#4 ; label string 
      00A2F9 A9 00            [ 2] 2547 	ldw x,(3,sp) ; target string 
      00A2FB 03 9F 88         [ 4] 2548 	call strcmp
      00A2FE 90 F6            [ 1] 2549 	jrne 4$
      00A300 93 EE            [ 2] 2550 	popw y 
      00A302 01 72            [ 2] 2551 	jra 2$ 
      002461                       2552 4$: ; target found 
      00A304 A9               [ 2] 2553 	popw x ;  address line target  
      002462                       2554 	_drop 2 ; target string 
      00A305 00 03            [ 2]    1     addw sp,#2 
      00A307 84 F7            [ 2] 2555 	popw y 
      00A309 81               [ 4] 2556 	ret
                                   2557 
                                   2558 
                                   2559 ;--------------------------------
                                   2560 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2561 ; selective goto or gosub 
                                   2562 ;--------------------------------
      00A30A                       2563 cmd_on:
      00A30A CD 9A 94         [ 4] 2564 	call runtime_only
      00A30D A1 01 27         [ 4] 2565 0$:	call expression 
      00A310 03 CC            [ 1] 2566 	cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      00A312 97 57            [ 1] 2567 	jreq 1$
      00A314 90 F6 93         [ 2] 2568 	jp syntax_error
      002474                       2569 1$: _xpop
      00A317 EE 01            [ 1]    1     ld a,(y)
      00A319 72               [ 1]    2     ldw x,y 
      00A31A A9 00            [ 2]    3     ldw x,(1,x)
      00A31C 03 C7 00 19      [ 2]    4     addw y,#CELL_SIZE 
                                   2570 ; the selector is the element indice 
                                   2571 ; in the list of arguments. {1..#elements} 
      00A320 CF               [ 1] 2572 	ld a,xl ; keep only bits 7..0
      00A321 00 1A            [ 1] 2573 	jreq 9$ ; element # begin at 1. 
      00A323 92               [ 1] 2574 	push a  ; selector  
      00A324 BC 00 19         [ 4] 2575 	call next_token
      00A327 5F 97            [ 1] 2576 	cp a,#TK_CMD 
      00A329 4F 81            [ 1] 2577 	jreq 2$ 
      00A32B CC 16 D7         [ 2] 2578 	jp syntax_error 
      00248B                       2579 2$: _get_code_addr
      00A32B CD               [ 2]    1         ldw x,(x)
      00A32C 9C F4 90 F6      [ 1]    2         inc in 
      00A330 93 EE 01 72      [ 1]    3         inc in 
                                   2580 ;; must be a GOTO or GOSUB 
      00A334 A9 00 03         [ 2] 2581 	cpw x,#goto 
      00A337 4D 26            [ 1] 2582 	jreq 4$
      00A339 0D 5D 26         [ 2] 2583 	cpw x,#gosub 
      00A33C 0A 55            [ 1] 2584 	jreq 4$ 
      00A33E 00 03 00         [ 2] 2585 	jp syntax_error 
      0024A1                       2586 4$: 
      00A341 02               [ 1] 2587 	pop a 
      00A342 5B               [ 2] 2588 	pushw x ; save routine address 	
      00A343 02               [ 1] 2589 	push a  ; selector  
      0024A4                       2590 5$: ; skip elements in list until selector==0 
      00A344 CC 98            [ 1] 2591 	dec (1,sp)
      00A346 0A 81            [ 1] 2592 	jreq 6$ 
                                   2593 ; can be a line# or a label 
      00A348 CD 18 3E         [ 4] 2594 	call next_token 
      00A348 85 52            [ 1] 2595 	cp a,#TK_INTGR 
      00A34A 0D 89            [ 1] 2596 	jreq 52$
      00A34C A6 85            [ 1] 2597 	cp a,#TK_LABEL 
      00A34E CD 9A            [ 1] 2598 	jreq 54$
      00A350 87 CD 98         [ 2] 2599 	jp syntax_error 
      0024B6                       2600 52$: ; got a line number 
      00A353 E6 1F 09         [ 1] 2601 	ld a,in ; skip over int24 value 
      00A356 CD 9D            [ 1] 2602 	add a,#CELL_SIZE ; integer size  
      00A358 C9 72 14         [ 1] 2603 	ld in,a 
      00A35B 00 23            [ 2] 2604 	jra 56$
      00A35D CD 98 BE         [ 4] 2605 54$: call skip_string ; skip over label 	
      0024C3                       2606 56$: ; if another element comma present 
      00A360 A1 80 27         [ 4] 2607 	call next_token
      00A363 03 CC            [ 1] 2608 	cp a,#TK_COMMA 
      00A365 97 57            [ 1] 2609 	jreq 5$ 
                                   2610 ; arg list exhausted, selector to big 
                                   2611 ; continue execution on next line 
      00A367                       2612 	_drop 3 ; drop selector and GOTO|GOSUB address 
      00A367 FE 72            [ 2]    1     addw sp,#3 
      00A369 5C 00            [ 2] 2613 	jra 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      0024CE                       2614 6$: ;at selected position  
      0024CE                       2615 	_drop 1 ; discard selector
      00A36B 02 72            [ 2]    1     addw sp,#1 
                                   2616 ; here only the routine address 
                                   2617 ; of GOTO|GOSUB is on stack 
      00A36D 5C 00 02         [ 4] 2618     call get_target_line
      00A370 A3 A3 78         [ 2] 2619 	ldw ptr16,x 	
      00A373 27 03 CC 97 57   [ 1] 2620 	mov in,count ; move to end of line  
      00A378 85               [ 2] 2621 	popw x ; cmd address, GOTO||GOSUB 
      00A378 72 04 00         [ 2] 2622 	cpw x,#goto 
      00A37B 23 03            [ 1] 2623 	jrne 7$ 
      00A37D CC 97 57         [ 2] 2624 	ldw x,ptr16 
      00A380 CD 9B            [ 2] 2625 	jra jp_to_target
      0024E6                       2626 7$: 
      00A382 DB A1            [ 2] 2627 	jra gosub_2 ; target in ptr16 
      0024E8                       2628 9$: ; expr out of range skip to end of line
                                   2629     ; this will force a fall to next line  
      00A384 84 27 03 CC 97   [ 1] 2630 	mov in,count
      0024ED                       2631 	_drop 2
      00A389 57 90            [ 2]    1     addw sp,#2 
      00A38B F6 93 EE         [ 2] 2632 	jp next_line  
                                   2633 
                                   2634 
                                   2635 ;------------------------
                                   2636 ; BASIC: GOTO line# 
                                   2637 ; jump to line# 
                                   2638 ; here cstack is 2 call deep from interpreter 
                                   2639 ;------------------------
      0024F2                       2640 goto:
      00A38E 01 72 A9         [ 4] 2641 	call runtime_only
      0024F5                       2642 goto_1:
      00A391 00 03 6B         [ 4] 2643 	call get_target_line
      0024F8                       2644 jp_to_target:
      00A394 06 1F 07         [ 2] 2645 	ldw basicptr,x 
      00A397 CD 98            [ 1] 2646 	ld a,(2,x)
      00A399 BE A1 00         [ 1] 2647 	ld count,a 
      00A39C 27 17 A1 80      [ 1] 2648 	mov in,#3 
      00A3A0 26               [ 4] 2649 	ret 
                                   2650 
                                   2651 
                                   2652 ;--------------------
                                   2653 ; BASIC: GOSUB line#
                                   2654 ; basic subroutine call
                                   2655 ; actual line# and basicptr 
                                   2656 ; are saved on cstack
                                   2657 ; here cstack is 2 call deep from interpreter 
                                   2658 ;--------------------
                           000001  2659 	RET_ADDR=1 ; subroutine return address 
                           000003  2660 	RET_BPTR=3 ; basicptr return point 
                           000005  2661 	RET_INW=5  ; in.w return point 
                           000004  2662 	VSIZE=4 
      002505                       2663 gosub:
      00A3A1 0E FE 72         [ 4] 2664 	call runtime_only
      002508                       2665 gosub_1:
      00A3A4 5C 00 02         [ 4] 2666 	call get_target_line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      00A3A7 72 5C 00         [ 2] 2667 	ldw ptr16,x
      00250E                       2668 gosub_2: 
      00A3AA 02               [ 2] 2669 	popw x 
      00250F                       2670 	_vars VSIZE  
      00A3AB A3 A3            [ 2]    1     sub sp,#VSIZE 
      00A3AD BE               [ 2] 2671 	pushw x ; RET_ADDR 
                                   2672 ; save BASIC subroutine return point.   
      00A3AE 27 0E 04         [ 2] 2673 	ldw x,basicptr
      00A3B0 1F 03            [ 2] 2674 	ldw (RET_BPTR,sp),x 
      00A3B0 55 00 04         [ 2] 2675 	ldw x,in.w 
      00A3B3 00 02            [ 2] 2676 	ldw (RET_INW,sp),x
      00A3B5 CE 00 19         [ 2] 2677 	ldw x,ptr16  
      00A3B5 0F 03            [ 2] 2678 	jra jp_to_target
                                   2679 
                                   2680 ;------------------------
                                   2681 ; BASIC: RETURN 
                                   2682 ; exit from BASIC subroutine 
                                   2683 ;------------------------
      002521                       2684 return:
      00A3B7 AE 00 01         [ 4] 2685 	call runtime_only
      00A3BA 1F 04            [ 2] 2686 	ldw x,(RET_BPTR,sp) 
      00A3BC 20 2F 04         [ 2] 2687 	ldw basicptr,x
      00A3BE E6 02            [ 1] 2688 	ld a,(2,x)
      00A3BE 72 04 00         [ 1] 2689 	ld count,a  
      00A3C1 23 03            [ 2] 2690 	ldw x,(RET_INW,sp)
      00A3C3 CC 97 57         [ 2] 2691 	ldw in.w,x 
      00A3C6 CD               [ 2] 2692 	popw x 
      002534                       2693 	_drop VSIZE 
      00A3C7 9B DB            [ 2]    1     addw sp,#VSIZE 
      00A3C9 A1               [ 2] 2694 	jp (x)
                                   2695 
                                   2696 ;---------------------------------
                                   2697 ; check if A:X contain the address 
                                   2698 ; of a program in FLASH 
                                   2699 ; output:
                                   2700 ;     Z    set is progam 
                                   2701 ;----------------------------------
      002537                       2702 is_program_addr:
      00A3CA 84               [ 1] 2703 	tnz a 
      00A3CB 27 03            [ 1] 2704 	jrne 9$
      00A3CD CC 97 57         [ 2] 2705 	cpw x,#app_space 
      00A3D0 25 07            [ 1] 2706 	jrult 8$
      00A3D0 90               [ 2] 2707 	pushw x 
      00A3D1 F6 93 EE         [ 4] 2708 	call qsign 
      00A3D4 01               [ 2] 2709 	popw x 
      00A3D5 72 A9            [ 1] 2710 	jreq 9$ 
      00A3D7 00               [ 1] 2711 8$:	cpl a ; clr Z bit  
      00A3D8 03               [ 4] 2712 9$:	ret 
                                   2713 
                                   2714 ;----------------------------------
                                   2715 ; BASIC: RUN [label]
                                   2716 ; run BASIC program in RAM
                                   2717 ;----------------------------------- 
      002548                       2718 cmd_run: 
      00A3D9 6B 03 1F 04 4D   [ 2] 2719 	btjf flags,#FRUN,0$  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      00A3DE 2A               [ 1] 2720 	clr a 
      00A3DF 0D               [ 4] 2721 	ret
      00254F                       2722 0$: ; check for STOP condition 
      00A3E0 7B 06 1E 07 1D   [ 2] 2723 	btjf flags,#FBREAK,1$
      002554                       2724 	_drop 2 
      00A3E5 00 01            [ 2]    1     addw sp,#2 
      00A3E7 A2 00 6B         [ 4] 2725 	call rest_context
      002559                       2726 	_drop CTXT_SIZE 
      00A3EA 06 1F            [ 2]    1     addw sp,#CTXT_SIZE 
      00A3EC 07 19 00 22      [ 1] 2727 	bres flags,#FBREAK 
      00A3ED 72 10 00 22      [ 1] 2728 	bset flags,#FRUN 
      00A3ED CE 00 05         [ 2] 2729 	jp interpreter 
      002566                       2730 1$:	; check for label option 
      00A3F0 1F 0D CE         [ 4] 2731 	call next_token 
      00A3F3 00 01            [ 1] 2732 	cp a,#TK_LABEL 
      00A3F5 1F 0B            [ 1] 2733 	jrne 3$
      00A3F7 72               [ 2] 2734 	pushw x 
      00A3F8 15 00 23         [ 4] 2735 	call skip_string 
      00A3FB 72               [ 2] 2736 	popw x  
      00A3FC 5C 00 20         [ 4] 2737 	call search_program
      00A3FF 81 05            [ 1] 2738 	jrne 2$
      00A400 A6 12            [ 1] 2739 	ld a,#ERR_NO_PROGRAM
      00A400 72 5D 00         [ 2] 2740 	jp tb_error 
      00A403 20 26 03         [ 2] 2741 2$: ldw txtbgn,x 
      00A406 CC 97 57         [ 2] 2742 	subw x,#2 
      00A409 FE               [ 2] 2743 	ldw x,(x)
      00A409 A6 85 CD 9A      [ 2] 2744 	addw x,txtbgn 
      00A40D 87 CD 98         [ 2] 2745 	ldw txtend,x 
      00A410 E6 13            [ 2] 2746 	jra run_it 	
      00258C                       2747 3$:	_unget_token 
      00A412 09 27 03 CC 97   [ 1]    1      mov in,in.saved  
      00A417 57 00 1B         [ 2] 2748 	ldw x,txtbgn
      00A418 C3 00 1D         [ 2] 2749 	cpw x,txtend 
      00A418 CF 00            [ 1] 2750 	jrmi run_it 
      00A41A 1A F6 EE         [ 2] 2751 	ldw x,#err_no_prog
      00A41D 01 72 FB         [ 4] 2752 	call puts 
      00A420 04 19 03 72 C7   [ 1] 2753 	mov in,count
      00A425 00               [ 4] 2754 	ret 
      0025A5                       2755 run_it:	 
      0025A5                       2756 	_drop 2 ; drop return address 
      00A426 1A 72            [ 2]    1     addw sp,#2 
      0025A7                       2757 run_it_02: 
      00A428 5C 00 1B         [ 4] 2758     call ubound 
      00A42B 72 CF 00         [ 4] 2759 	call clear_vars
                                   2760 ; initialize DIM variables pointers 
      00A42E 1A C7 00         [ 2] 2761 	ldw x,txtend 
      00A431 0D CF 00         [ 2] 2762 	ldw dvar_bgn,x 
      00A434 0E 7B 06         [ 2] 2763 	ldw dvar_end,x 	 
                                   2764 ; clear data pointer 
      00A437 1E               [ 1] 2765 	clrw x 
      00A438 07 72 B0         [ 2] 2766 	ldw data_ptr,x 
      00A43B 00 0E C2 00      [ 1] 2767 	clr data_ofs 
      00A43F 0D 18 03 A8      [ 1] 2768 	clr data_len 
                                   2769 ; initialize BASIC pointer 
      00A443 80 2B 12         [ 2] 2770 	ldw x,txtbgn 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      00A446 20 25 7B         [ 2] 2771 	ldw basicptr,x 
      00A449 03 2A            [ 1] 2772 	ld a,(2,x)
      00A44B 07 C6 00         [ 1] 2773 	ld count,a
      00A44E 0F 2F 07 20      [ 1] 2774 	mov in,#3	
      00A452 1A 10 00 22      [ 1] 2775 	bset flags,#FRUN 
      00A453 CC 17 82         [ 2] 2776 	jp interpreter 
                                   2777 
                                   2778 
                                   2779 ;----------------------
                                   2780 ; BASIC: END
                                   2781 ; end running program
                                   2782 ;---------------------- 
                           000001  2783 	CHAIN_BP=1 
                           000003  2784 	CHAIN_IN=3
                           000005  2785 	CHAIN_TXTBGN=5
                           000007  2786 	CHAIN_TXTEND=7
                           000008  2787 	CHAIN_CNTX_SIZE=8  
      0025D8                       2788 cmd_end: 
      0025D8                       2789 	_drop 2 ; no need for return address 
      00A453 72 0E            [ 2]    1     addw sp,#2 
                                   2790 ; check for chained program 
      00A455 00 0F 15 33      [ 1] 2791 	tnz chain_level
      00A458 27 1D            [ 1] 2792 	jreq 8$
                                   2793 ; restore chain context 
      00A458 1E 0D CF 00      [ 1] 2794 	dec chain_level 
      00A45C 05 72            [ 2] 2795 	ldw x,(CHAIN_BP,sp) ; chain saved basicptr 
      00A45E 01 00 23         [ 2] 2796 	ldw basicptr,x 
      00A461 05 E6            [ 2] 2797 	ldw x,(CHAIN_IN,sp) ; chain saved in and count  
      00A463 02 C7 00         [ 2] 2798 	ldw in,x 
      00A466 03 1E            [ 2] 2799 	ldw x,(CHAIN_TXTBGN,sp)
      00A468 0B CF 00         [ 2] 2800 	ldw txtbgn,x 
      00A46B 01 81            [ 2] 2801 	ldw x,(CHAIN_TXTEND,sp)
      00A46D CF 00 1D         [ 2] 2802 	ldw txtend,x 
      0025F8                       2803 	_drop CHAIN_CNTX_SIZE ; CHAIN saved data size  
      00A46D 85 5B            [ 2]    1     addw sp,#CHAIN_CNTX_SIZE 
      00A46F 0D 72 5A         [ 2] 2804 	jp interpreter 
      0025FD                       2805 8$: ; clean stack 
      00A472 00 20 FC         [ 2] 2806 	ldw x,#STACK_EMPTY
      00A475 94               [ 1] 2807 	ldw sp,x 
      00A475 CD 98 BE         [ 2] 2808 	jp warm_start
                                   2809 
                                   2810 ;---------------------------
                                   2811 ; BASIC: GET var 
                                   2812 ; receive a key in variable 
                                   2813 ; don't wait 
                                   2814 ;---------------------------
      002604                       2815 cmd_get:
      00A478 A1 84 27         [ 4] 2816 	call next_token 
      00A47B 07 A1            [ 1] 2817 	cp a,#TK_VAR 
      00A47D 03 27            [ 1] 2818 	jreq 0$
      00A47F 26 CC 97         [ 2] 2819 	jp syntax_error 
      00A482 57 18 66         [ 4] 2820 0$: call get_addr 
      00A483 CF 00 19         [ 2] 2821 	ldw ptr16,x 
      00A483 90 89 CD         [ 4] 2822 	call qgetc 
      00A486 98 F0            [ 1] 2823 	jreq 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      00A488 4F 90 CE         [ 4] 2824 	call getc  
      00A48B 00 05 90 FE      [ 4] 2825 2$: clr [ptr16]
      00A48F 90 89 13 01      [ 1] 2826 	inc ptr8 
      00A493 5B 02 25 01      [ 4] 2827 	clr [ptr16]
      00A497 4C 5C 00 1A      [ 1] 2828 	inc ptr8 
      00A498 72 C7 00 19      [ 4] 2829 	ld [ptr16],a 
      00A498 CD               [ 4] 2830 	ret 
                                   2831 
                                   2832 
                                   2833 ;-----------------
                                   2834 ; 1 Khz beep 
                                   2835 ;-----------------
      002631                       2836 beep_1khz:: 
      00A499 8D 0D            [ 2] 2837 	pushw y 
      00A49B 5D 26 05         [ 2] 2838 	ldw x,#100
      00A49E A6 05 CC 97      [ 2] 2839 	ldw y,#1000
      00A4A2 59 90            [ 2] 2840 	jra beep
                                   2841 
                                   2842 ;-----------------------
                                   2843 ; BASIC: TONE expr1,expr2
                                   2844 ; used TIMER2 channel 1
                                   2845 ; to produce a tone 
                                   2846 ; arguments:
                                   2847 ;    expr1   frequency 
                                   2848 ;    expr2   duration msec.
                                   2849 ;---------------------------
      00263C                       2850 tone:
      00A4A4 85 81            [ 2] 2851 	pushw y 
      00A4A6 CD 1A 19         [ 4] 2852 	call arg_list 
      00A4A6 90 89            [ 1] 2853 	cp a,#2 
      00A4A8 89 CD            [ 1] 2854 	jreq 1$
      00A4AA 98 D7 72         [ 2] 2855 	jp syntax_error 
      002648                       2856 1$: 
      002648                       2857 	_xpop 
      00A4AD 5F 00            [ 1]    1     ld a,(y)
      00A4AF 0E               [ 1]    2     ldw x,y 
      00A4B0 90 CE            [ 2]    3     ldw x,(1,x)
      00A4B2 00 1C 90 E6      [ 2]    4     addw y,#CELL_SIZE 
      00A4B6 03               [ 2] 2858 	pushw x ; duration 
      002652                       2859 	_xpop ; frequency
      00A4B7 A1 03            [ 1]    1     ld a,(y)
      00A4B9 27               [ 1]    2     ldw x,y 
      00A4BA 15 90            [ 2]    3     ldw x,(1,x)
      00A4BC E6 02 C7 00      [ 2]    4     addw y,#CELL_SIZE 
      00A4C0 0F 72            [ 1] 2860 	ldw y,x ; frequency 
      00A4C2 B9               [ 2] 2861 	popw x  ; duration 
      00265E                       2862 beep:  
      00A4C3 00               [ 2] 2863 	pushw x 
      00A4C4 0E 90 C3         [ 2] 2864 	ldw x,#TIM2_CLK_FREQ
      00A4C7 00               [ 2] 2865 	divw x,y ; cntr=Fclk/freq 
                                   2866 ; round to nearest integer 
      00A4C8 1E 25 E9 A6      [ 2] 2867 	cpw y,#TIM2_CLK_FREQ/2
      00A4CC 0A CC            [ 1] 2868 	jrmi 2$
      00A4CE 97               [ 1] 2869 	incw x 
      00266A                       2870 2$:	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      00A4CF 59               [ 1] 2871 	ld a,xh 
      00A4D0 C7 53 0D         [ 1] 2872 	ld TIM2_ARRH,a 
      00A4D0 90               [ 1] 2873 	ld a,xl 
      00A4D1 89 72 A9         [ 1] 2874 	ld TIM2_ARRL,a 
                                   2875 ; 50% duty cycle 
      00A4D4 00               [ 1] 2876 	ccf 
      00A4D5 04               [ 2] 2877 	rrcw x 
      00A4D6 1E               [ 1] 2878 	ld a,xh 
      00A4D7 03 CD 94         [ 1] 2879 	ld TIM2_CCR1H,a 
      00A4DA 5E               [ 1] 2880 	ld a,xl
      00A4DB 26 04 90         [ 1] 2881 	ld TIM2_CCR1L,a
      00A4DE 85 20 DA 08      [ 1] 2882 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A4E1 72 10 53 00      [ 1] 2883 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A4E1 85 5B 02 90      [ 1] 2884 	bset TIM2_EGR,#TIM2_EGR_UG
      00A4E5 85               [ 2] 2885 	popw x 
      00A4E6 81 2B 98         [ 4] 2886 	call pause02
      00A4E7 72 11 53 08      [ 1] 2887 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A4E7 CD 9A 7C CD      [ 1] 2888 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A4EB 9B DB            [ 2] 2889 	popw y 
      00A4ED A1               [ 4] 2890 	ret 
                                   2891 
                                   2892 ;-------------------------------
                                   2893 ; BASIC: ADCON 0|1 [,divisor]  
                                   2894 ; disable/enanble ADC 
                                   2895 ;-------------------------------
                           000003  2896 	ONOFF=3 
                           000001  2897 	DIVSOR=1
                           000004  2898 	VSIZE=4 
      002697                       2899 power_adc:
      00A4EE 84 27 03         [ 4] 2900 	call arg_list 
      00A4F1 CC 97            [ 1] 2901 	cp a,#2	
      00A4F3 57 90            [ 1] 2902 	jreq 1$
      00A4F5 F6 93            [ 1] 2903 	cp a,#1 
      00A4F7 EE 01            [ 1] 2904 	jreq 0$ 
      00A4F9 72 A9 00         [ 2] 2905 	jp syntax_error 
      00A4FC 03               [ 1] 2906 0$:	clr a 
      00A4FD 9F               [ 1] 2907 	clrw x
      0026A7                       2908 	_xpush   ; divisor  
      00A4FE 27 68 88 CD      [ 2]    1     subw y,#CELL_SIZE
      00A502 98 BE            [ 1]    2     ld (y),a 
      00A504 A1 80 27         [ 2]    3     ldw (1,y),x 
      0026B0                       2909 1$: _at_next 
      00A507 03 CC 97         [ 1]    1     ld a,(3,y)
      00A50A 57               [ 1]    2     ldw x,y 
      00A50B FE 72            [ 2]    3     ldw x,(4,x)
      00A50D 5C               [ 2] 2910 	tnzw x 
      00A50E 00 02            [ 1] 2911 	jreq 2$ 
      0026B9                       2912 	_xpop
      00A510 72 5C            [ 1]    1     ld a,(y)
      00A512 00               [ 1]    2     ldw x,y 
      00A513 02 A3            [ 2]    3     ldw x,(1,x)
      00A515 A5 72 27 08      [ 2]    4     addw y,#CELL_SIZE 
      0026C2                       2913 	_xdrop  
      00A519 A3 A5 85 27      [ 2]    1     addw y,#CELL_SIZE 
      00A51D 03               [ 1] 2914 	ld a,xl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      00A51E CC 97            [ 1] 2915 	and a,#7
      00A520 57               [ 1] 2916 	swap a 
      00A521 C7 54 01         [ 1] 2917 	ld ADC_CR1,a
      00A521 84 89 88 CA      [ 1] 2918 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A524 72 10 54 01      [ 1] 2919 	bset ADC_CR1,#ADC_CR1_ADON 
      0026D5                       2920 	_usec_dly 7 
      00A524 0A 01 27         [ 2]    1     ldw x,#(16*7-2)/4
      00A527 26               [ 2]    2     decw x
      00A528 CD               [ 1]    3     nop 
      00A529 98 BE            [ 1]    4     jrne .-4
      00A52B A1 84            [ 2] 2921 	jra 3$
      00A52D 27 07 A1 03      [ 1] 2922 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A531 27 0D CC 97      [ 1] 2923 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      0026E6                       2924 3$:	
      00A535 57               [ 4] 2925 	ret
                                   2926 
                                   2927 ;-----------------------------
                                   2928 ; BASIC: ADCREAD (channel)
                                   2929 ; read adc channel {0..5}
                                   2930 ; output:
                                   2931 ;   A 		TK_INTGR 
                                   2932 ;   X 		value 
                                   2933 ;-----------------------------
      00A536                       2934 analog_read:
      00A536 C6 00 02         [ 4] 2935 	call func_args 
      00A539 AB 03            [ 1] 2936 	cp a,#1 
      00A53B C7 00            [ 1] 2937 	jreq 1$
      00A53D 02 20 03         [ 2] 2938 	jp syntax_error
      0026F1                       2939 1$: _xpop 
      00A540 CD 98            [ 1]    1     ld a,(y)
      00A542 D7               [ 1]    2     ldw x,y 
      00A543 EE 01            [ 2]    3     ldw x,(1,x)
      00A543 CD 98 BE A1      [ 2]    4     addw y,#CELL_SIZE 
      00A547 08 27 DA         [ 2] 2940 	cpw x,#5 
      00A54A 5B 03            [ 2] 2941 	jrule 2$
      00A54C 20 1A            [ 1] 2942 	ld a,#ERR_BAD_VALUE
      00A54E CC 16 D9         [ 2] 2943 	jp tb_error 
      00A54E 5B               [ 1] 2944 2$: ld a,xl
      00A54F 01 CD A4         [ 1] 2945 	ld acc8,a 
      00A552 75 CF            [ 1] 2946 	ld a,#5
      00A554 00 1A 55         [ 1] 2947 	sub a,acc8 
      00A557 00 03 00         [ 1] 2948 	ld ADC_CSR,a
      00A55A 02 85 A3 A5      [ 1] 2949 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A55E 72 26 05 CE      [ 1] 2950 	bset ADC_CR1,#ADC_CR1_ADON
      00A562 00 1A 20 12 FB   [ 2] 2951 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00A566 CE 54 04         [ 2] 2952 	ldw x,ADC_DRH
      00A566 20 26            [ 1] 2953 	ld a,#TK_INTGR
      00A568 81               [ 4] 2954 	ret 
                                   2955 
                                   2956 ;-----------------------
                                   2957 ; BASIC: DREAD(pin)
                                   2958 ; Arduino pins 
                                   2959 ; read state of a digital pin 
                                   2960 ; pin# {0..15}
                                   2961 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



                                   2962 ;    A 		TK_INTGR
                                   2963 ;    X      0|1 
                                   2964 ;-------------------------
                           000001  2965 	PINNO=1
                           000001  2966 	VSIZE=1
      002723                       2967 digital_read:
      002723                       2968 	_vars VSIZE 
      00A568 55 00            [ 2]    1     sub sp,#VSIZE 
      00A56A 03 00 02         [ 4] 2969 	call func_args
      00A56D 5B 02            [ 1] 2970 	cp a,#1
      00A56F CC 98            [ 1] 2971 	jreq 1$
      00A571 0A 16 D7         [ 2] 2972 	jp syntax_error
      00A572                       2973 1$: _xpop 
      00A572 CD 9A            [ 1]    1     ld a,(y)
      00A574 7C               [ 1]    2     ldw x,y 
      00A575 EE 01            [ 2]    3     ldw x,(1,x)
      00A575 CD A4 75 03      [ 2]    4     addw y,#CELL_SIZE 
      00A578 A3 00 0F         [ 2] 2974 	cpw x,#15 
      00A578 CF 00            [ 2] 2975 	jrule 2$
      00A57A 05 E6            [ 1] 2976 	ld a,#ERR_BAD_VALUE
      00A57C 02 C7 00         [ 2] 2977 	jp tb_error 
      00A57F 03 35 03         [ 4] 2978 2$:	call select_pin 
      00A582 00 02            [ 1] 2979 	ld (PINNO,sp),a
      00A584 81 01            [ 1] 2980 	ld a,(GPIO_IDR,x)
      00A585 0D 01            [ 1] 2981 	tnz (PINNO,sp)
      00A585 CD 9A            [ 1] 2982 	jreq 8$
      00A587 7C               [ 1] 2983 3$: srl a 
      00A588 0A 01            [ 1] 2984 	dec (PINNO,sp)
      00A588 CD A4            [ 1] 2985 	jrne 3$ 
      00A58A 75 CF            [ 1] 2986 8$: and a,#1 
      00A58C 00               [ 1] 2987 	clrw x 
      00A58D 1A               [ 1] 2988 	ld xl,a 
      00A58E 4F               [ 1] 2989 	clr a 
      002757                       2990 	_drop VSIZE
      00A58E 85 52            [ 2]    1     addw sp,#VSIZE 
      00A590 04               [ 4] 2991 	ret
                                   2992 
                                   2993 
                                   2994 ;-----------------------
                                   2995 ; BASIC: DWRITE pin,0|1
                                   2996 ; Arduino pins 
                                   2997 ; write to a digital pin 
                                   2998 ; pin# {0..15}
                                   2999 ; output:
                                   3000 ;    A 		TK_INTGR
                                   3001 ;    X      0|1 
                                   3002 ;-------------------------
                           000001  3003 	PINNO=1
                           000002  3004 	PINVAL=2
                           000002  3005 	VSIZE=2
      00275A                       3006 digital_write:
      00275A                       3007 	_vars VSIZE 
      00A591 89 CE            [ 2]    1     sub sp,#VSIZE 
      00A593 00 05 1F         [ 4] 3008 	call arg_list  
      00A596 03 CE            [ 1] 3009 	cp a,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      00A598 00 01            [ 1] 3010 	jreq 1$
      00A59A 1F 05 CE         [ 2] 3011 	jp syntax_error
      002766                       3012 1$: _xpop 
      00A59D 00 1A            [ 1]    1     ld a,(y)
      00A59F 20               [ 1]    2     ldw x,y 
      00A5A0 D7 01            [ 2]    3     ldw x,(1,x)
      00A5A1 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A5A1 CD               [ 1] 3013 	ld a,xl 
      00A5A2 9A 7C            [ 1] 3014 	ld (PINVAL,sp),a
      002772                       3015 	_xpop 
      00A5A4 1E 03            [ 1]    1     ld a,(y)
      00A5A6 CF               [ 1]    2     ldw x,y 
      00A5A7 00 05            [ 2]    3     ldw x,(1,x)
      00A5A9 E6 02 C7 00      [ 2]    4     addw y,#CELL_SIZE 
      00A5AD 03 1E 05         [ 2] 3016 	cpw x,#15 
      00A5B0 CF 00            [ 2] 3017 	jrule 2$
      00A5B2 01 85            [ 1] 3018 	ld a,#ERR_BAD_VALUE
      00A5B4 5B 04 FC         [ 2] 3019 	jp tb_error 
      00A5B7 CD 2C DB         [ 4] 3020 2$:	call select_pin 
      00A5B7 4D 26            [ 1] 3021 	ld (PINNO,sp),a 
      00A5B9 0D A3            [ 1] 3022 	ld a,#1
      00A5BB B9 00            [ 1] 3023 	tnz (PINNO,sp)
      00A5BD 25 07            [ 1] 3024 	jreq 4$
      00A5BF 89               [ 1] 3025 3$: sll a
      00A5C0 CD A9            [ 1] 3026 	dec (PINNO,sp)
      00A5C2 48 85            [ 1] 3027 	jrne 3$
      00A5C4 27 01            [ 1] 3028 4$: tnz (PINVAL,sp)
      00A5C6 43 81            [ 1] 3029 	jrne 5$
      00A5C8 43               [ 1] 3030 	cpl a 
      00A5C8 72 01            [ 1] 3031 	and a,(GPIO_ODR,x)
      00A5CA 00 23            [ 2] 3032 	jra 8$
      00A5CC 02 4F            [ 1] 3033 5$: or a,(GPIO_ODR,x)
      00A5CE 81 00            [ 1] 3034 8$: ld (GPIO_ODR,x),a 
      00A5CF                       3035 	_drop VSIZE 
      00A5CF 72 09            [ 2]    1     addw sp,#VSIZE 
      00A5D1 00               [ 4] 3036 	ret
                                   3037 
                                   3038 
                                   3039 ;-----------------------
                                   3040 ; BASIC: STOP
                                   3041 ; stop progam execution  
                                   3042 ; without resetting pointers 
                                   3043 ; the program is resumed
                                   3044 ; with RUN 
                                   3045 ;-------------------------
      0027A5                       3046 stop:
      00A5D2 23 12 5B 02 CD   [ 2] 3047 	btjt flags,#FRUN,2$
      00A5D7 A1               [ 4] 3048 	ret 
      0027AB                       3049 2$:	 
                                   3050 ; create space on cstack to save context 
      00A5D8 59 5B 04         [ 2] 3051 	ldw x,#break_point 
      00A5DB 72 19 00         [ 4] 3052 	call puts 
      0027B1                       3053 	_drop 2 ;drop return address 
      00A5DE 23 72            [ 2]    1     addw sp,#2 
      0027B3                       3054 	_vars CTXT_SIZE ; context size 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00A5E0 10 00            [ 2]    1     sub sp,#CTXT_SIZE 
      00A5E2 23 CC 98         [ 4] 3055 	call save_context 
      00A5E5 02 16 68         [ 2] 3056 	ldw x,#tib 
      00A5E6 CF 00 04         [ 2] 3057 	ldw basicptr,x
      00A5E6 CD               [ 1] 3058 	clr (x)
      00A5E7 98 BE A1 03      [ 1] 3059 	clr count  
      00A5EB 26               [ 1] 3060 	clrw x 
      00A5EC 1F 89 CD         [ 2] 3061 	ldw in.w,x
      00A5EF 98 D7 85 CD      [ 1] 3062 	bres flags,#FRUN 
      00A5F3 B2 A3 26 05      [ 1] 3063 	bset flags,#FBREAK
      00A5F7 A6 12 CC         [ 2] 3064 	jp interpreter 
      00A5FA 97 59 CF 00 1C 1D 00  3065 break_point: .asciz "\nbreak point, RUN to resume.\n"
             02 FE 72 BB 00 1C CF
             00 1E 20 19 55 00 04
             00 02 CE 00 1C C3 00
             1E 2B
                                   3066 
                                   3067 ;-----------------------
                                   3068 ; BASIC: NEW
                                   3069 ; from command line only 
                                   3070 ; free program memory
                                   3071 ; and clear variables 
                                   3072 ;------------------------
      0027F0                       3073 new: 
      00A618 0C AE 96         [ 4] 3074 	call cmd_line_only
      00A61B AE CD 8A 24      [ 1] 3075 0$:	clr flags 
      00A61F 55 00 03         [ 4] 3076 	call clear_basic 
      00A622 00               [ 4] 3077 	ret 
                                   3078 
                                   3079 ;-----------------------------------
                                   3080 ; erase program at specified address
                                   3081 ; keep signature and size fields. 
                                   3082 ; signature replaced by "XX"
                                   3083 ; input:
                                   3084 ;    X    address 
                                   3085 ;-----------------------------------
                           000001  3086 	ADDR=1    ; program address
                           000003  3087 	PRG_SIZE=3    ; program size 
                           000005  3088 	BLOCKS=5 ; blocks to erase 
                           000006  3089 	VSIZE=6
      0027FB                       3090 erase_program:
      00A623 02               [ 2] 3091 	pushw x 
      00A624 81 18 57         [ 4] 3092 	call skip_string 
      00A625 85               [ 2] 3093 	popw x 
      00A625 5B 02 23         [ 4] 3094 	call search_program 
      00A627 27 4A            [ 1] 3095 	jreq 9$
      00A627 CD 9D A8         [ 4] 3096 	call move_erase_to_ram
      00A62A CD 94 C3 CE      [ 1] 3097 	clr farptr 
      00280C                       3098 	_vars VSIZE 
      00A62E 00 1E            [ 2]    1     sub sp,#VSIZE 
      00A630 CF 00 30         [ 2] 3099 1$:	subw x,#4 
      00A633 CF 00            [ 2] 3100 	ldw (ADDR,sp),x
      00A635 32 5F            [ 2] 3101 	ldw x,(2,x)
      00A637 CF 00            [ 2] 3102 	ldw (PRG_SIZE,sp),x
      00A639 07 72            [ 1] 3103 	ld a,#BLOCK_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      00A63B 5F               [ 2] 3104 	div x,a 
      00A63C 00               [ 1] 3105 	tnz a 
      00A63D 09 72            [ 1] 3106 	jreq 2$ 
      00A63F 5F               [ 1] 3107 	incw x 
      00A640 00 0A            [ 2] 3108 2$:	ldw (BLOCKS,sp),x 
      00A642 CE 00            [ 2] 3109 	ldw x,(ADDR,sp)
      00A644 1C CF 00         [ 2] 3110 	ldw ptr16,x 
      00A647 05 E6 02         [ 4] 3111 3$:	call block_erase
      00A64A C7 00 03         [ 2] 3112 	ldw x,#BLOCK_SIZE 
      00A64D 35 03 00         [ 4] 3113 	call incr_farptr
      00A650 02 72            [ 2] 3114 	ldw x,(BLOCKS,sp)
      00A652 10               [ 2] 3115 	decw x 
      00A653 00 23            [ 2] 3116 	ldw (BLOCKS,sp),x 
      00A655 CC 98            [ 1] 3117 	jrne 3$ 
                                   3118 ; write XX and size at addr 
      00A657 02 01            [ 2] 3119 	ldw x,(ADDR,sp)
      00A658 CF 00 19         [ 2] 3120 	ldw ptr16,x 
      00A658 5B 02            [ 1] 3121 	ld a,#'X 
      00A65A 72               [ 1] 3122 	clrw x 
      00A65B 5D 00 34         [ 4] 3123 	call write_byte 
      00A65E 27 1D 72         [ 4] 3124 	call write_byte 
      00A661 5A 00            [ 1] 3125 	ld a,(PRG_SIZE,sp)
      00A663 34 1E 01         [ 4] 3126 	call write_byte 
      00A666 CF 00            [ 1] 3127 	ld a,(PRG_SIZE+1,sp)
      00A668 05 1E 03         [ 4] 3128 	call write_byte 
      00284D                       3129 	_drop VSIZE 
      00A66B CF 00            [ 2]    1     addw sp,#VSIZE 
      00284F                       3130 9$:	
      00A66D 02               [ 4] 3131 	ret 
                                   3132 
                                   3133 ;-----------------------------------
                                   3134 ; BASIC: ERASE \E | \F || address
                                   3135 ; erase all block in range from 
                                   3136 ;  'app_space' to FLASH end (0x27fff)
                                   3137 ;  or all EEPROM 
                                   3138 ; that contains a non zero byte. 
                                   3139 ; if the argument is an address  
                                   3140 ; mark the program at this address 
                                   3141 ; as erased. Erase the blocks 
                                   3142 ; replace signature by 'XX' and 
                                   3143 ; keep size field.  
                                   3144 ;-----------------------------------
                           000001  3145 	LIMIT=1 
                           000003  3146 	VSIZE = 3 
      002850                       3147 cmd_erase:
      00A66E 1E 05 CF         [ 4] 3148 	call cmd_line_only
      00A671 00 1C 1E 07      [ 1] 3149 	clr farptr 
      00A675 CF 00 1E         [ 4] 3150 	call next_token
      00A678 5B 08            [ 1] 3151 	cp a,#TK_LABEL 
      00A67A CC 98            [ 1] 3152 	jreq erase_program  
      00285E                       3153 	_vars VSIZE 
      00A67C 02 03            [ 2]    1     sub sp,#VSIZE 
      00A67D A1 04            [ 1] 3154 	cp a,#TK_CHAR 
      00A67D AE 17            [ 1] 3155 	jreq 0$ 
      00A67F FF 94 CC         [ 2] 3156 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00A682 97 E3 80         [ 4] 3157 0$: call get_char 
      00A684 A4 DF            [ 1] 3158 	and a,#0XDF 
      00A684 CD 98            [ 1] 3159 	cp a,#'E
      00A686 BE A1            [ 1] 3160 	jrne 1$
      00A688 85 27 03         [ 2] 3161 	ldw x,#EEPROM_BASE 
      00A68B CC 97 57         [ 2] 3162 	ldw farptr+1,x 
      00A68E CD 98 E6         [ 2] 3163 	ldw x,#EEPROM_END
      00A691 CF               [ 1] 3164 	clr a 
      00A692 00 1A            [ 2] 3165 	jra 3$ 
      00A694 CD 89            [ 1] 3166 1$: cp a,#'F 
      00A696 D0 27            [ 1] 3167 	jreq 2$
      00A698 03 CD 89         [ 2] 3168 	ldw x,#err_bad_value
      00A69B D7 72 3F         [ 2] 3169 	jp tb_error
      002886                       3170 2$:
      00A69E 00 1A 72         [ 2] 3171 	ldw x,#app_space  
      00A6A1 5C 00 1B         [ 2] 3172 	ldw farptr+1,x 
      00A6A4 72 3F            [ 1] 3173 	ld a,#(FLASH_END>>16)&0XFF 
      00A6A6 00 1A 72         [ 2] 3174 	ldw x,#FLASH_END&0xffff
      002891                       3175 3$:
      00A6A9 5C 00            [ 1] 3176 	ld (LIMIT,sp),a 
      00A6AB 1B 72            [ 2] 3177 	ldw (LIMIT+1,sp),x 
                                   3178 ; operation done from RAM
                                   3179 ; copy code to RAM in tib   
      00A6AD C7 00 1A         [ 4] 3180 	call move_erase_to_ram
      002898                       3181 4$:	 
      00A6B0 81 08 B6         [ 4] 3182     call scan_block 
      00A6B1 27 08            [ 1] 3183 	jreq 5$  ; block already erased 
      00A6B1 90 89            [ 1] 3184     ld a,#'E 
      00A6B3 AE 00 64         [ 4] 3185     call putc 
      00A6B6 90 AE 03         [ 4] 3186 	call block_erase   
                                   3187 ; this block is clean, next  
      00A6B9 E8 20 22         [ 2] 3188 5$:	ldw x,#BLOCK_SIZE
      00A6BC CD 08 A8         [ 4] 3189 	call incr_farptr
                                   3190 ; check limit, 24 bit substraction  	
      00A6BC 90 89            [ 1] 3191 	ld a,(LIMIT,sp)
      00A6BE CD 9A            [ 2] 3192 	ldw x,(LIMIT+1,sp)
      00A6C0 99 A1 02 27      [ 2] 3193 	subw x,farptr+1
      00A6C4 03 CC 97         [ 1] 3194 	sbc a,farptr 
      00A6C7 57 E0            [ 1] 3195 	jrugt 4$ 
      00A6C8 CD 14 E3         [ 4] 3196 9$: call clear_basic
      00A6C8 90 F6            [ 2] 3197 	ldw x,(LIMIT+1,sp)
      00A6CA 93 EE 01         [ 2] 3198 	cpw x,#EEPROM_END
      00A6CD 72 A9            [ 1] 3199 	jrne 10$
      00A6CF 00 03 89         [ 4] 3200 	call func_eefree 
      0028C5                       3201 10$:
      0028C5                       3202 	_drop VSIZE 
      00A6D2 90 F6            [ 2]    1     addw sp,#VSIZE 
      00A6D4 93               [ 4] 3203 	ret 
                                   3204 	
                                   3205 
                                   3206 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3207 ;  check for application signature 
                                   3208 ; input:
                                   3209 ;	x       address to check 
                                   3210 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



                                   3211 ;   Z      1  signature present 
                                   3212 ;          0 not app signature  
                                   3213 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028C8                       3214 qsign: 
      00A6D5 EE               [ 2] 3215 	pushw x 
                                   3216 ; align to block 
      00A6D6 01               [ 1] 3217 	ld a,xl 
      00A6D7 72 A9            [ 1] 3218 	and a,#BLOCK_SIZE 
      00A6D9 00               [ 1] 3219 	ld xl,a 
      00A6DA 03               [ 2] 3220 	ldw x,(x)
      00A6DB 90 93 85         [ 2] 3221 	cpw x,SIGNATURE ; "TB" 
      00A6DE 85               [ 2] 3222 	popw x 
      00A6DE 89               [ 4] 3223 	ret 
                                   3224 
                                   3225 ;--------------------------------------
                                   3226 ;  fill write buffer 
                                   3227 ;  input:
                                   3228 ;    y  point to output buffer 
                                   3229 ;    x  point to source 
                                   3230 ;    a  bytes to write in buffer 
                                   3231 ;  output:
                                   3232 ;    y   += A 
                                   3233 ;    X   += A 
                                   3234 ;    A   0 
                                   3235 ;---------------------------------------
      0028D3                       3236 fill_write_buffer:
      00A6DF AE               [ 1] 3237 	push a 
      00A6E0 F4               [ 1] 3238 	tnz a 
      00A6E1 24 65            [ 1] 3239 	jreq 9$ 
      00A6E3 90               [ 1] 3240 1$: ld a,(x)
      00A6E4 A3               [ 1] 3241 	incw x 
      00A6E5 7A 12            [ 1] 3242 	ld (y),a 
      00A6E7 2B 01            [ 1] 3243 	incw y 
      00A6E9 5C 01            [ 1] 3244 	dec (1,sp) 
      00A6EA 26 F6            [ 1] 3245 	jrne 1$ 
      00A6EA 9E               [ 1] 3246 9$:	pop a 
      00A6EB C7               [ 4] 3247     ret 	
                                   3248 
                                   3249 ;--------------------------------------
                                   3250 ;  fill pad buffer with zero 
                                   3251 ;  input:
                                   3252 ;	none 
                                   3253 ;  output:
                                   3254 ;    y     buffer address  
                                   3255 ;--------------------------------------
      0028E3                       3256 clear_block_buffer:
      00A6EC 53               [ 1] 3257 	push a 
      00A6ED 0D 9F C7 53      [ 2] 3258 	ldw y,#block_buffer 
      00A6F1 0E 8C            [ 2] 3259 	pushw y
      00A6F3 56 9E            [ 1] 3260 	ld a,#BLOCK_SIZE   
      00A6F5 C7 53            [ 1] 3261 1$:	clr (y)
      00A6F7 0F 9F            [ 1] 3262 	incw y
      00A6F9 C7               [ 1] 3263 	dec a  
      00A6FA 53 10            [ 1] 3264 	jrne 1$ 	
      00A6FC 72 10            [ 2] 3265 9$: popw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00A6FE 53               [ 1] 3266 	pop a 			
      00A6FF 08               [ 4] 3267 	ret 
                                   3268 
                                   3269 
                                   3270 ;----------------------------------
                                   3271 ;  search  a free space space that 
                                   3272 ;  fit program size 
                                   3273 ; input:
                                   3274 ;    X    program size 
                                   3275 ; output:
                                   3276 ;    X    address | 0 
                                   3277 ;------------------------------------
                           000001  3278 	PG_SIZE=1 
                           000002  3279 	VSIZE=2 
      0028F7                       3280 search_fit:
      00A700 72               [ 2] 3281 	pushw x; PG_SIZE 
      00A701 10 53 00         [ 2] 3282 	ldw x,#app_space 
      00A704 72 10 53         [ 4] 3283 1$:	call is_erased 
      00A707 04 85            [ 1] 3284 	jreq 4$
      00A709 CD               [ 1] 3285 	ld a,(x)
      00A70A AC 18            [ 1] 3286 	or a,(1,x)
      00A70C 72 11            [ 1] 3287 	jreq 9$ ; free space 
      00A70E 53 08 72         [ 4] 3288 2$:	call skip_to_next
      00A711 11               [ 2] 3289 	tnzw x 
      00A712 53 00            [ 1] 3290 	jrne 1$
      00A714 90 85            [ 2] 3291 	jra 9$
      00290D                       3292 4$: ; erased program 
                                   3293     ; does it fit? 
      00A716 81 00 0D         [ 2] 3294 	ldw acc16,x 
      00A717 EE 02            [ 2] 3295 	ldw x,(2,x) ; size erased program
                                   3296 ; top multiple of BLOCK_SIZE 
      00A717 CD 9A 99         [ 2] 3297 	addw x,#4 
      00A71A A1 02 27         [ 2] 3298 	addw x,#BLOCK_SIZE-1 
      00A71D 12               [ 1] 3299 	ld a,xl 
      00A71E A1 01            [ 1] 3300 	and a,#BLOCK_SIZE 
      00A720 27               [ 1] 3301 	ld xl,a  
      00A721 03 CC            [ 2] 3302 	cpw x,(1,sp) ; size program to save 
      00A723 97 57            [ 1] 3303 	jruge 8$   ; fit 
      00A725 4F 5F 72         [ 2] 3304 	ldw x,acc16 
      00A728 A2 00            [ 2] 3305 	jra 2$ 
      00A72A 03 90 F7         [ 2] 3306 8$: ldw x,acc16 ; fit in this one 	
      002928                       3307 9$:	_drop VSIZE 
      00A72D 90 EF            [ 2]    1     addw sp,#VSIZE 
      00A72F 01               [ 4] 3308 	ret  
                                   3309 
                                   3310 ;-------------------------
                                   3311 ; erase header and 
                                   3312 ; size fields 
                                   3313 ; input: 
                                   3314 ;    X    program address 
                                   3315 ; output:
                                   3316 ;    X    unchanged 
                                   3317 ;-------------------------
                           000001  3318 	COUNT=1 
      00292B                       3319 erase_header:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      00A730 90               [ 2] 3320 	pushw x 
      00A731 E6 03            [ 1] 3321 	push #4 ; COUNT 
      00A733 93 EE 04 5D      [ 1] 3322 	clr farptr 
      00A737 27 25 90         [ 2] 3323 	ldw ptr16,x 
      00A73A F6               [ 1] 3324 	clr a 
      00A73B 93               [ 1] 3325 	clrw x 
      00A73C EE 01 72         [ 4] 3326 1$:	call write_byte 
      00A73F A9 00            [ 1] 3327 	dec (COUNT,sp)
      00A741 03 72            [ 1] 3328 	jrne 1$
      00293E                       3329 	_drop 1 
      00A743 A9 00            [ 2]    1     addw sp,#1 
      00A745 03               [ 2] 3330 	popw x 
      00A746 9F A4 07         [ 2] 3331 	ldw ptr16,x 
      00A749 4E               [ 4] 3332 	ret 
                                   3333 
                                   3334 ;---------------------------------------
                                   3335 ; BASIC: SAVE
                                   3336 ; write application from RAM to FLASH
                                   3337 ; at UFLASH address
                                   3338 ;--------------------------------------
                           000001  3339 	XTEMP=1
                           000003  3340 	COUNT=3  ; last count bytes written 
                           000004  3341 	CNT_LO=4 ; count low byte 
                           000005  3342 	TOWRITE=5 ; how bytes left to write  
                           000006  3343 	VSIZE=6 
      002945                       3344 cmd_save:
      00A74A C7 54 01         [ 4] 3345 	call cmd_line_only
      00A74D 72               [ 2] 3346 	pushw x 
      00A74E 16 50            [ 2] 3347 	pushw y 
      00294B                       3348 	_vars VSIZE
      00A750 CA 72            [ 2]    1     sub sp,#VSIZE 
      00A752 10 54 01         [ 4] 3349 	call prog_size 
      00A755 AE 00            [ 1] 3350 	jrne 0$ 
      00A757 1B 5A 9D         [ 2] 3351 	jp 9$ ; no program to save 
      00A75A 26 FA            [ 2] 3352 0$:	ldw (TOWRITE,sp),x ; program size
      00A75C 20 08 72 11      [ 1] 3353 	clr farptr 
      00A760 54 01 72         [ 4] 3354 	call search_fit
      00A763 17 50 CA         [ 2] 3355 	ldw ptr16,x 
      00A766 AE FF FF         [ 2] 3356 	ldw x,#0xFFFF
      00A766 81 B0 00 19      [ 2] 3357 	subw x,ptr16 ; free flash 
      00A767 1D 00 04         [ 2] 3358 	subw x,#4 ; signature and size field 
      00A767 CD 9A            [ 2] 3359 	cpw x,(TOWRITE,sp)
      00A769 94 A1            [ 1] 3360 	jruge 1$
      00A76B 01 27            [ 1] 3361 	ld a,#ERR_MEM_FULL
      00A76D 03 CC 97         [ 2] 3362 	jp tb_error 
      002974                       3363 1$: ; check if header bytes are zero's 
      00A770 57 90 F6         [ 2] 3364 	ldw x,ptr16 
      00A773 93               [ 1] 3365 	ld a,(x)
      00A774 EE 01            [ 1] 3366 	or a,(1,x)
      00A776 72 A9            [ 1] 3367 	or a,(2,x)
      00A778 00 03            [ 1] 3368 	or a,(3,x)
      00A77A A3 00            [ 1] 3369 	jreq 2$
      00A77C 05 23 05         [ 4] 3370 	call erase_header ; preserve X and farptr 
      002983                       3371 2$: 
                                   3372 ; block programming flash
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



                                   3373 ; must be done from RAM
                                   3374 ; moved in tib  
      00A77F A6 0A CC         [ 4] 3375 	call move_prg_to_ram
                                   3376 ; initialize written bytes count  
      00A782 97 59            [ 1] 3377 	clr (COUNT,sp)
                                   3378 ; first bock 
                                   3379 ; containt signature 2 bytes 
                                   3380 ; and size 	2 bytes 
                                   3381 ; use Y as pointer to block_buffer
      00A784 9F C7 00         [ 4] 3382 	call clear_block_buffer ; -- y=*block_buffer	
                                   3383 ; write signature
      00A787 0F A6 05         [ 2] 3384 	ldw x,SIGNATURE ; "TB" 
      00A78A C0 00            [ 2] 3385 	ldw (y),x 
      00A78C 0F C7 54 00      [ 2] 3386 	addw y,#2
      00A790 72 16            [ 2] 3387 	ldw x,(TOWRITE,sp)
      00A792 54 02            [ 2] 3388 	ldw (y),x
      00A794 72 10 54 01      [ 2] 3389 	addw y,#2   
      00A798 72 0F            [ 1] 3390 	ld a,#(BLOCK_SIZE-4)
      00A79A 54 00 FB         [ 2] 3391 	cpw x,#(BLOCK_SIZE-4) 
      00A79D CE 54            [ 1] 3392 	jrugt 3$
      00A79F 04               [ 1] 3393 	ld a,xl 
      00A7A0 A6 84            [ 1] 3394 3$:	ld (CNT_LO,sp),a   
      00A7A2 81 00 1B         [ 2] 3395 	ldw x,txtbgn 
      00A7A3 1F 01            [ 2] 3396 	ldw (XTEMP,sp),x 
      0029AB                       3397 32$: 
      00A7A3 52 01            [ 2] 3398 	ldw x,(XTEMP,sp)
      00A7A5 CD 9A            [ 1] 3399 	ld a,(CNT_LO,sp)
      00A7A7 94 A1 01         [ 4] 3400 	call fill_write_buffer 
      00A7AA 27 03            [ 2] 3401 	ldw (XTEMP,sp),x 
      00A7AC CC 97 57         [ 2] 3402 	ldw x,#block_buffer
      00A7AF 90 F6 93         [ 4] 3403 	call write_buffer
      00A7B2 EE 01 72         [ 2] 3404 	ldw x,#BLOCK_SIZE 
      00A7B5 A9 00 03         [ 4] 3405 	call incr_farptr  
                                   3406 ; following blocks 
      00A7B8 A3 00            [ 2] 3407 	ldw x,(XTEMP,sp)
      00A7BA 0F 23 05         [ 2] 3408 	cpw x,txtend 
      00A7BD A6 0A            [ 1] 3409 	jruge 9$ 
      00A7BF CC 97            [ 2] 3410 	ldw x,(TOWRITE,sp)
      00A7C1 59 CD AD         [ 2] 3411 	subw x,(COUNT,sp)
      00A7C4 5B 6B            [ 2] 3412 	ldw (TOWRITE,sp),x 
      00A7C6 01 E6            [ 1] 3413 	ld a,#BLOCK_SIZE 
      00A7C8 01 0D 01         [ 2] 3414 	cpw x,#BLOCK_SIZE 
      00A7CB 27 05            [ 1] 3415 	jruge 4$ 
      00A7CD 44               [ 1] 3416 	ld a,xl 
      00A7CE 0A 01            [ 1] 3417 4$:	ld (CNT_LO,sp),a 
      00A7D0 26 FB A4         [ 4] 3418 	call clear_block_buffer 
      00A7D3 01 5F            [ 2] 3419 	jra 32$ 
      0029DD                       3420 9$:	_drop VSIZE 
      00A7D5 97 4F            [ 2]    1     addw sp,#VSIZE 
      00A7D7 5B 01            [ 2] 3421     popw y 
      00A7D9 81               [ 2] 3422 	popw x 
      00A7DA 81               [ 4] 3423 	ret 
                                   3424 
      00A7DA 52 02                 3425 SIGNATURE: .ascii "TB"
      00A7DC CD 9A                 3426 ERASED: .ascii "XX" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



                                   3427 
                                   3428 ;---------------------
                                   3429 ; check if there is 
                                   3430 ; an erased program 
                                   3431 ; at this address 
                                   3432 ; input:
                                   3433 ;    X    address 
                                   3434 ; output:
                                   3435 ;    Z    Set=erased program 
                                   3436 ;--------------------
      0029E7                       3437 is_erased:
      00A7DE 99               [ 2] 3438 	pushw x 
                                   3439 ; align to BLOCK 
      00A7DF A1               [ 1] 3440 	ld a,xl 
      00A7E0 02 27            [ 1] 3441 	and a,#BLOCK_SIZE 
      00A7E2 03               [ 1] 3442 	ld xl,a 
      00A7E3 CC               [ 2] 3443 	ldw x,(x)
      00A7E4 97 57 90         [ 2] 3444 	cpw x,ERASED 
      00A7E7 F6               [ 2] 3445 	popw x 
      00A7E8 93               [ 4] 3446 	ret 
                                   3447 
                                   3448 ;----------------------------
                                   3449 ;  skip to next program
                                   3450 ;  block 
                                   3451 ; input:
                                   3452 ;    X   actual program addr
                                   3453 ; output:
                                   3454 ;    X   next block 
                                   3455 ;        after program 
                                   3456 ;----------------------------
      0029F2                       3457 skip_to_next:
                                   3458 ; align to block 
      00A7E9 EE               [ 1] 3459 	ld a,xl 
      00A7EA 01 72            [ 1] 3460 	and a,#BLOCK_SIZE 
      00A7EC A9               [ 1] 3461 	ld xl,a 
      00A7ED 00 03 9F         [ 2] 3462 	ldw acc16,x 
      00A7F0 6B 02            [ 2] 3463 	ldw x,(2,x)
      00A7F2 90 F6 93 EE      [ 2] 3464 	addw x,acc16 ; blk_addr+prg_size 
      00A7F6 01 72 A9         [ 2] 3465 	addw x,#4 ; +header fields 
                                   3466 ; align to next block 
      00A7F9 00 03 A3         [ 2] 3467 	addw x,#BLOCK_SIZE-1 
      00A7FC 00               [ 1] 3468 	ld a,xl 
      00A7FD 0F 23            [ 1] 3469 	and a,#0x80 
      00A7FF 05               [ 1] 3470 	ld xl,a  
      00A800 A6               [ 4] 3471 	ret 
                                   3472 
                                   3473 
                                   3474 ;---------------------
                                   3475 ; BASIC: DIR 
                                   3476 ; list programs saved 
                                   3477 ; in flash 
                                   3478 ;--------------------
                           000001  3479 	XTEMP=1 
      002A0A                       3480 cmd_dir:
      00A801 0A CC 97         [ 4] 3481 	call cmd_line_only
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00A804 59 CD AD         [ 2] 3482 	ldw x,#app_space 
      00A807 5B               [ 2] 3483 	pushw x 
      002A11                       3484 1$: 
      00A808 6B 01 A6         [ 4] 3485 	call qsign 
      00A80B 01 0D            [ 1] 3486 	jrne 4$
      00A80D 01 27 05         [ 2] 3487 	addw x,#4
      00A810 48 0A 01 26      [ 1] 3488 	mov base,#16
      00A814 FB 0D 02         [ 4] 3489 	call prt_i16
      00A817 26 05            [ 1] 3490 	ld a,#SPACE 
      00A819 43 E4 00         [ 4] 3491 	call putc 
      00A81C 20 02            [ 2] 3492 	ldw x,(1,sp)
      00A81E EA 00            [ 2] 3493 	ldw x,(2,x)
      00A820 E7 00 5B 02      [ 1] 3494 	mov base,#10  
      00A824 81 18 86         [ 4] 3495 	call prt_i16 
      00A825 AE 1E FD         [ 2] 3496 	ldw x,#STR_BYTES
      00A825 72 00 00         [ 4] 3497 	call puts
      00A828 23 01            [ 1] 3498 	ld a,#', 
      00A82A 81 09 47         [ 4] 3499 	call putc
      00A82B 1E 01            [ 2] 3500 	ldw x,(1,sp)
      00A82B AE A8 52         [ 2] 3501 	addw x,#8
      00A82E CD 8A 24         [ 4] 3502 	call puts 
      00A831 5B 02            [ 1] 3503 	ld a,#CR 
      00A833 52 04 CD         [ 4] 3504 	call putc
      00A836 A1 49            [ 2] 3505 	ldw x,(1,sp)
      00A838 AE 16 68         [ 4] 3506 3$:	call skip_to_next
      00A83B CF 00            [ 2] 3507 	ldw (1,sp),x 
      00A83D 05 7F            [ 2] 3508 	jra 1$
      002A51                       3509 4$: ; check if it is an erased program 
      00A83F 72 5F 00         [ 4] 3510 	call is_erased 
      00A842 03 5F            [ 1] 3511 	jreq 3$ 
      002A56                       3512 8$: ; done 
      002A56                       3513 	_drop 2 
      00A844 CF 00            [ 2]    1     addw sp,#2 
      00A846 01               [ 4] 3514 	ret 
                                   3515 
                                   3516 ;---------------------
                                   3517 ; BASIC: WRITE expr1,expr2|char|string[,expr|char|string]* 
                                   3518 ; write 1 or more byte to FLASH or EEPROM
                                   3519 ; starting at address  
                                   3520 ; input:
                                   3521 ;   expr1  	is address 
                                   3522 ;   expr2,...,exprn   are bytes to write
                                   3523 ; output:
                                   3524 ;   none 
                                   3525 ;---------------------
      002A59                       3526 write:
      00A847 72 11 00         [ 4] 3527 	call expression
      00A84A 23 72            [ 1] 3528 	cp a,#TK_INTGR 
      00A84C 18 00            [ 1] 3529 	jreq 0$
      00A84E 23 CC 98         [ 2] 3530 	jp syntax_error
      002A63                       3531 0$: _xpop 
      00A851 02 0A            [ 1]    1     ld a,(y)
      00A853 62               [ 1]    2     ldw x,y 
      00A854 72 65            [ 2]    3     ldw x,(1,x)
      00A856 61 6B 20 70      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



      00A85A 6F 69 6E         [ 1] 3532 	ld farptr,a 
      00A85D 74 2C 20         [ 2] 3533 	ldw ptr16,x 
      002A72                       3534 1$:	
      00A860 52 55 4E         [ 4] 3535 	call next_token 
      00A863 20 74            [ 1] 3536 	cp a,#TK_COMMA 
      00A865 6F 20            [ 1] 3537 	jreq 2$ 
      00A867 72 65            [ 2] 3538 	jra 9$ ; no more data 
      00A869 73 75 6D         [ 4] 3539 2$:	call next_token 
      00A86C 65 2E            [ 1] 3540 	cp a,#TK_CHAR 
      00A86E 0A 00            [ 1] 3541 	jreq 4$ 
      00A870 A1 02            [ 1] 3542 	cp a,#TK_QSTR
      00A870 CD 9A            [ 1] 3543 	jreq 6$
      002A86                       3544 	_unget_token 
      00A872 71 72 5F 00 23   [ 1]    1      mov in,in.saved  
      00A877 CD 95 63         [ 4] 3545 	call expression
      00A87A 81 84            [ 1] 3546 	cp a,#TK_INTGR
      00A87B 27 03            [ 1] 3547 	jreq 3$
      00A87B 89 CD 98         [ 2] 3548 	jp syntax_error
      002A95                       3549 3$:	_xpop 
      00A87E D7 85            [ 1]    1     ld a,(y)
      00A880 CD               [ 1]    2     ldw x,y 
      00A881 B2 A3            [ 2]    3     ldw x,(1,x)
      00A883 27 4A CD 87      [ 2]    4     addw y,#CELL_SIZE 
      00A887 AF               [ 1] 3550 	ld a,xl 
      00A888 72               [ 1] 3551 	clrw x 
      00A889 5F 00 19         [ 4] 3552 	call write_byte
      00A88C 52 06            [ 2] 3553 	jra 1$ 
      002AA5                       3554 4$: ; write character 
      00A88E 1D               [ 1] 3555 	ld a,(x)
      00A88F 00 04 1F 01      [ 1] 3556 	inc in 
      00A893 EE               [ 1] 3557 	clrw x 
      00A894 02 1F 03         [ 4] 3558 	call write_byte 
      00A897 A6 80            [ 2] 3559 	jra 1$ 
      002AB0                       3560 6$: ; write string 
      00A899 62               [ 2] 3561 	pushw x 
      00A89A 4D               [ 1] 3562 	ld a,(x)
      00A89B 27 01 5C 1F      [ 1] 3563 	inc in 
      00A89F 05               [ 1] 3564 	clrw x 
      00A8A0 1E 01 CF         [ 4] 3565 	call write_byte 
      00A8A3 00               [ 2] 3566 	popw x 
      00A8A4 1A               [ 1] 3567 	ld a,(x)
      00A8A5 CD 88            [ 1] 3568 	jreq 1$
      00A8A7 2D               [ 1] 3569 	incw x 
      00A8A8 AE 00            [ 2] 3570 	jra 6$ 	
      002AC1                       3571 9$:
      00A8AA 80               [ 4] 3572 	ret 
                                   3573 
                                   3574 
                                   3575 ;---------------------
                                   3576 ;BASIC: CHAR(expr)
                                   3577 ; évaluate expression 
                                   3578 ; and take the 7 least 
                                   3579 ; bits as ASCII character
                                   3580 ; output: 
                                   3581 ; 	A char 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



                                   3582 ;---------------------
      002AC2                       3583 func_char:
      00A8AB CD 89 28         [ 4] 3584 	call func_args 
      00A8AE 1E 05            [ 1] 3585 	cp a,#1
      00A8B0 5A 1F            [ 1] 3586 	jreq 1$
      00A8B2 05 26 F0         [ 2] 3587 	jp syntax_error
      002ACC                       3588 1$:	_xpop
      00A8B5 1E 01            [ 1]    1     ld a,(y)
      00A8B7 CF               [ 1]    2     ldw x,y 
      00A8B8 00 1A            [ 2]    3     ldw x,(1,x)
      00A8BA A6 58 5F CD      [ 2]    4     addw y,#CELL_SIZE 
      00A8BE 88               [ 1] 3589 	ld a,xl
      00A8BF 53 CD            [ 1] 3590 	and a,#0x7f 
      00A8C1 88               [ 4] 3591 	ret
                                   3592 
                                   3593 ;---------------------
                                   3594 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3595 ; extract first character 
                                   3596 ; of string argument 
                                   3597 ; output:
                                   3598 ;    A:X    int24 
                                   3599 ;---------------------
      002AD9                       3600 ascii:
      00A8C2 53 7B            [ 1] 3601 	ld a,#TK_LPAREN
      00A8C4 03 CD 88         [ 4] 3602 	call expect 
      00A8C7 53 7B 04         [ 4] 3603 	call next_token 
      00A8CA CD 88            [ 1] 3604 	cp a,#TK_QSTR 
      00A8CC 53 5B            [ 1] 3605 	jreq 1$
      00A8CE 06 04            [ 1] 3606 	cp a,#TK_CHAR 
      00A8CF 27 12            [ 1] 3607 	jreq 2$ 
      00A8CF 81 82            [ 1] 3608 	cp a,#TK_CFUNC 
      00A8D0 27 03            [ 1] 3609 	jreq 0$
      00A8D0 CD 9A 71         [ 2] 3610 	jp syntax_error
      002AF0                       3611 0$: ; cfunc 
      00A8D3 72               [ 4] 3612 	call (x)
      00A8D4 5F 00            [ 2] 3613 	jra 3$
      002AF3                       3614 1$: ; quoted string 
      00A8D6 19               [ 1] 3615 	ld a,(x)
      00A8D7 CD               [ 1] 3616 	push a  
      00A8D8 98 BE A1         [ 4] 3617 	call skip_string
      00A8DB 03               [ 1] 3618 	pop a  	
      00A8DC 27 9D            [ 2] 3619 	jra 3$ 
      002AFB                       3620 2$: ; character 
      00A8DE 52 03 A1         [ 4] 3621 	call get_char 
      00A8E1 04               [ 1] 3622 3$:	clrw x 
      00A8E2 27               [ 1] 3623 	rlwa x   
      002B00                       3624 4$:	_xpush  
      00A8E3 03 CC 97 57      [ 2]    1     subw y,#CELL_SIZE
      00A8E7 CD 99            [ 1]    2     ld (y),a 
      00A8E9 00 A4 DF         [ 2]    3     ldw (1,y),x 
      00A8EC A1 45            [ 1] 3625 	ld a,#TK_RPAREN 
      00A8EE 26 0C AE         [ 4] 3626 	call expect
      002B0E                       3627 9$:	
      002B0E                       3628 	_xpop  
      00A8F1 40 00            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



      00A8F3 CF               [ 1]    2     ldw x,y 
      00A8F4 00 1A            [ 2]    3     ldw x,(1,x)
      00A8F6 AE 47 FF 4F      [ 2]    4     addw y,#CELL_SIZE 
      00A8FA 20               [ 4] 3629 	ret 
                                   3630 
                                   3631 ;---------------------
                                   3632 ;BASIC: KEY
                                   3633 ; wait for a character 
                                   3634 ; received from STDIN 
                                   3635 ; input:
                                   3636 ;	none 
                                   3637 ; output:
                                   3638 ;	a	 character 
                                   3639 ;---------------------
      002B18                       3640 key:
      00A8FB 15 A1 46         [ 4] 3641 	call getc 
      00A8FE 27               [ 4] 3642 	ret
                                   3643 
                                   3644 ;----------------------
                                   3645 ; BASIC: QKEY
                                   3646 ; Return true if there 
                                   3647 ; is a character in 
                                   3648 ; waiting in STDIN 
                                   3649 ; input:
                                   3650 ;  none 
                                   3651 ; output:
                                   3652 ;   A     0|-1
                                   3653 ;-----------------------
      002B1C                       3654 qkey:: 
      00A8FF 06               [ 1] 3655 	clrw x 
      00A900 AE 96 5F         [ 1] 3656 	ld a,rx1_head
      00A903 CC 97 59         [ 1] 3657 	sub a,rx1_tail 
      00A906 27 03            [ 1] 3658 	jreq 9$ 
      00A906 AE               [ 2] 3659 	cplw x
      00A907 B9 00            [ 1] 3660 	ld a,#255    
      002B28                       3661 9$: 
      00A909 CF               [ 4] 3662 	ret 
                                   3663 
                                   3664 ;-------------------------
                                   3665 ; BASIC: UFLASH 
                                   3666 ; return free flash address
                                   3667 ; scan all block starting at 
                                   3668 ; app_space and return 
                                   3669 ; address of first free block 
                                   3670 ; below extended memory.  
                                   3671 ; return 0 if no free block 
                                   3672 ; input:
                                   3673 ;  none 
                                   3674 ; output:
                                   3675 ;	A:X		FLASH free address
                                   3676 ;---------------------------
      002B29                       3677 uflash:
      00A90A 00 1A A6 02      [ 1] 3678 	clr farptr 
      00A90E AE 7F FF         [ 2] 3679 	ldw x,#app_space 
      00A911 89               [ 2] 3680 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



      00A911 6B 01 1F         [ 2] 3681 1$:	ldw ptr16,x 
      00A914 02 CD 87         [ 4] 3682 	call scan_block 
      00A917 AF 0F            [ 1] 3683 	jreq 8$
      00A918 1E 01            [ 2] 3684 	ldw x,(1,sp)
      00A918 CD 89 36         [ 2] 3685 	addw x,#BLOCK_SIZE 
      00A91B 27 08            [ 1] 3686 	jreq 7$ 
      00A91D A6 45            [ 2] 3687 	ldw (1,sp),x 
      00A91F CD 89            [ 2] 3688 	jra 1$ 
      002B44                       3689 7$: ; no free block 
      00A921 C7 CD            [ 1] 3690 	clr (1,sp) 
      00A923 88 2D            [ 1] 3691 	clr (2,sp)
      00A925 AE               [ 2] 3692 8$: popw x 
      00A926 00               [ 1] 3693 	clr a 
      00A927 80               [ 4] 3694 	ret 
                                   3695 
                                   3696 
                                   3697 ;---------------------
                                   3698 ; BASIC: USR(addr,arg)
                                   3699 ; execute a function written 
                                   3700 ; in binary code.
                                   3701 ; input:
                                   3702 ;   addr	routine address 
                                   3703 ;   arg 	is an argument
                                   3704 ;           it can be ignore 
                                   3705 ;           by cally. 
                                   3706 ; output:
                                   3707 ;   xstack 	value returned by cally  
                                   3708 ;---------------------
      002B4B                       3709 usr:
      00A928 CD 89 28         [ 4] 3710 	call func_args 
      00A92B 7B 01            [ 1] 3711 	cp a,#2
      00A92D 1E 02            [ 1] 3712 	jreq 1$  
      00A92F 72 B0 00         [ 2] 3713 	jp syntax_error 
      002B55                       3714 1$: 
      002B55                       3715 	_at_next ; A:X addr 
      00A932 1A C2 00         [ 1]    1     ld a,(3,y)
      00A935 19               [ 1]    2     ldw x,y 
      00A936 22 E0            [ 2]    3     ldw x,(4,x)
      00A938 CD 95 63         [ 2] 3716 	ldw ptr16,X 
      002B5E                       3717 	_xpop  ; arg 
      00A93B 1E 02            [ 1]    1     ld a,(y)
      00A93D A3               [ 1]    2     ldw x,y 
      00A93E 47 FF            [ 2]    3     ldw x,(1,x)
      00A940 26 03 CD 9E      [ 2]    4     addw y,#CELL_SIZE 
      002B67                       3718 	_store_top ; overwrite addr 
      00A944 07 F7            [ 1]    1     ld (y),a 
      00A945 90 EF 01         [ 2]    2     ldw (1,y),x     
      00A945 5B 03 81 19      [ 6] 3719     call [ptr16]
      00A948 81               [ 4] 3720 	ret 
                                   3721 
                                   3722 
                                   3723 ;------------------------------
                                   3724 ; BASIC: BYE 
                                   3725 ; halt mcu in its lowest power mode 
                                   3726 ; wait for reset or external interrupt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



                                   3727 ; do a cold start on wakeup.
                                   3728 ;------------------------------
      002B71                       3729 bye:
      00A948 89 9F A4 80 97   [ 2] 3730 	btjf UART1_SR,#UART_SR_TC,.
      00A94D FE               [10] 3731 	halt
      00A94E C3 AA 63         [ 2] 3732 	jp cold_start  
                                   3733 
                                   3734 ;----------------------------------
                                   3735 ; BASIC: SLEEP 
                                   3736 ; halt mcu until reset or external
                                   3737 ; interrupt.
                                   3738 ; Resume progam after SLEEP command
                                   3739 ;----------------------------------
      002B7A                       3740 sleep:
      00A951 85 81 52 30 FB   [ 2] 3741 	btjf UART1_SR,#UART_SR_TC,.
      00A953 72 16 00 22      [ 1] 3742 	bset flags,#FSLEEP
      00A953 88               [10] 3743 	halt 
      00A954 4D               [ 4] 3744 	ret 
                                   3745 
                                   3746 ;-------------------------------
                                   3747 ; BASIC: PAUSE expr 
                                   3748 ; suspend execution for n msec.
                                   3749 ; input:
                                   3750 ;	none
                                   3751 ; output:
                                   3752 ;	none 
                                   3753 ;------------------------------
      002B85                       3754 pause:
      00A955 27 0A F6         [ 4] 3755 	call expression
      00A958 5C 90            [ 1] 3756 	cp a,#TK_INTGR
      00A95A F7 90            [ 1] 3757 	jreq 1$ 
      00A95C 5C 0A 01         [ 2] 3758 	jp syntax_error
      002B8F                       3759 1$: _xpop 
      00A95F 26 F6            [ 1]    1     ld a,(y)
      00A961 84               [ 1]    2     ldw x,y 
      00A962 81 01            [ 2]    3     ldw x,(1,x)
      00A963 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      002B98                       3760 pause02:
      00A963 88 90 AE         [ 2] 3761 	ldw timer,x 
      00A966 16 B8 90         [ 2] 3762 1$: ldw x,timer 
      00A969 89               [ 2] 3763 	tnzw x 
      00A96A A6 80            [ 1] 3764 	jreq 2$
      00A96C 90               [10] 3765 	wfi 
      00A96D 7F 90            [ 1] 3766 	jrne 1$
      002BA4                       3767 2$:	
      00A96F 5C               [ 4] 3768 	ret 
                                   3769 
                                   3770 ;------------------------------
                                   3771 ; BASIC: AWU expr
                                   3772 ; halt mcu for 'expr' milliseconds
                                   3773 ; use Auto wakeup peripheral
                                   3774 ; all oscillators stopped except LSI
                                   3775 ; range: 1ms - 511ms
                                   3776 ; input:
                                   3777 ;  none
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



                                   3778 ; output:
                                   3779 ;  none:
                                   3780 ;------------------------------
      002BA5                       3781 awu:
      00A970 4A 26 F9         [ 4] 3782   call expression
      00A973 90 85            [ 1] 3783   cp a,#TK_INTGR
      00A975 84 81            [ 1] 3784   jreq 1$
      00A977 CC 16 D7         [ 2] 3785   jp syntax_error
      002BAF                       3786 1$: _xpop 
      00A977 89 AE            [ 1]    1     ld a,(y)
      00A979 B9               [ 1]    2     ldw x,y 
      00A97A 00 CD            [ 2]    3     ldw x,(1,x)
      00A97C AA 67 27 0D      [ 2]    4     addw y,#CELL_SIZE 
      002BB8                       3787 awu02:
      00A980 F6 EA 01         [ 2] 3788   cpw x,#5120
      00A983 27 23            [ 1] 3789   jrmi 1$ 
      00A985 CD AA 72 5D      [ 1] 3790   mov AWU_TBR,#15 
      00A989 26 F0            [ 1] 3791   ld a,#30
      00A98B 20               [ 2] 3792   div x,a
      00A98C 1B 10            [ 1] 3793   ld a,#16
      00A98D 62               [ 2] 3794   div x,a 
      00A98D CF 00            [ 2] 3795   jra 4$
      002BC9                       3796 1$: 
      00A98F 0E EE 02         [ 2] 3797   cpw x,#2048
      00A992 1C 00            [ 1] 3798   jrmi 2$ 
      00A994 04 1C 00 7F      [ 1] 3799   mov AWU_TBR,#14
      00A998 9F A4            [ 1] 3800   ld a,#80
      00A99A 80               [ 2] 3801   div x,a 
      00A99B 97 13            [ 2] 3802   jra 4$   
      002BD7                       3803 2$:
      00A99D 01 24 05 CE      [ 1] 3804   mov AWU_TBR,#7
      002BDB                       3805 3$:  
                                   3806 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A9A1 00 0E 20         [ 2] 3807   cpw x,#64 
      00A9A4 E0 CE            [ 2] 3808   jrule 4$ 
      00A9A6 00 0E 5B 02      [ 1] 3809   inc AWU_TBR 
      00A9AA 81               [ 2] 3810   srlw x 
      00A9AB 20 F4            [ 2] 3811   jra 3$ 
      002BE7                       3812 4$:
      00A9AB 89               [ 1] 3813   ld a, xl
      00A9AC 4B               [ 1] 3814   dec a 
      00A9AD 04 72            [ 1] 3815   jreq 5$
      00A9AF 5F               [ 1] 3816   dec a 	
      002BEC                       3817 5$: 
      00A9B0 00 19            [ 1] 3818   and a,#0x3e 
      00A9B2 CF 00 1A         [ 1] 3819   ld AWU_APR,a 
      00A9B5 4F 5F CD 88      [ 1] 3820   bset AWU_CSR,#AWU_CSR_AWUEN
      00A9B9 53               [10] 3821   halt 
                                   3822 
      00A9BA 0A               [ 4] 3823   ret 
                                   3824 
                                   3825 ;------------------------------
                                   3826 ; BASIC: TICKS
                                   3827 ; return msec ticks counter value 
                                   3828 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



                                   3829 ; 	none 
                                   3830 ; output:
                                   3831 ;	X 		TK_INTGR
                                   3832 ;-------------------------------
      002BF7                       3833 get_ticks:
      00A9BB 01 26 F9         [ 1] 3834 	ld a,ticks 
      00A9BE 5B 01 85         [ 2] 3835 	ldw x,ticks+1 
      00A9C1 CF               [ 4] 3836 	ret 
                                   3837 
                                   3838 ;------------------------------
                                   3839 ; BASIC: ABS(expr)
                                   3840 ; return absolute value of expr.
                                   3841 ; input:
                                   3842 ;   none
                                   3843 ; output:
                                   3844 ;   xstack    positive int24 
                                   3845 ;-------------------------------
      002BFE                       3846 abs:
      00A9C2 00 1A 81         [ 4] 3847 	call func_args 
      00A9C5 A1 01            [ 1] 3848 	cp a,#1 
      00A9C5 CD 9A            [ 1] 3849 	jreq 0$ 
      00A9C7 71 89 90         [ 2] 3850 	jp syntax_error
      002C08                       3851 0$:  
      00A9CA 89 52 06         [ 4] 3852 	call abs24 
      002C0B                       3853 	_xpop 
      00A9CD CD 9F            [ 1]    1     ld a,(y)
      00A9CF 13               [ 1]    2     ldw x,y 
      00A9D0 26 03            [ 2]    3     ldw x,(1,x)
      00A9D2 CC AA 5D 1F      [ 2]    4     addw y,#CELL_SIZE 
      00A9D6 05               [ 4] 3854 	ret 
                                   3855 
                                   3856 ;------------------------------
                                   3857 ; BASIC: LSHIFT(expr1,expr2)
                                   3858 ; logical shift left expr1 by 
                                   3859 ; expr2 bits 
                                   3860 ; output:
                                   3861 ; 	A:x 	result 
                                   3862 ;------------------------------
      002C15                       3863 lshift:
      00A9D7 72 5F 00         [ 4] 3864 	call func_args
      00A9DA 19 CD            [ 1] 3865 	cp a,#2 
      00A9DC A9 77            [ 1] 3866 	jreq 1$
      00A9DE CF 00 1A         [ 2] 3867 	jp syntax_error
      002C1F                       3868 1$: _xpop 
      00A9E1 AE FF            [ 1]    1     ld a,(y)
      00A9E3 FF               [ 1]    2     ldw x,y 
      00A9E4 72 B0            [ 2]    3     ldw x,(1,x)
      00A9E6 00 1A 1D 00      [ 2]    4     addw y,#CELL_SIZE 
      00A9EA 04               [ 1] 3869 	ld a,xl 
      00A9EB 13               [ 1] 3870 	push a      
      002C2A                       3871 	_xpop  ; T>A:X 
      00A9EC 05 24            [ 1]    1     ld a,(y)
      00A9EE 05               [ 1]    2     ldw x,y 
      00A9EF A6 01            [ 2]    3     ldw x,(1,x)
      00A9F1 CC 97 59 03      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



      00A9F4 0D 01            [ 1] 3872 	tnz (1,sp) 
      00A9F4 CE 00            [ 1] 3873 	jreq 4$
      00A9F6 1A               [ 1] 3874 2$:	rcf 
      00A9F7 F6               [ 2] 3875 	rlcw x 
      00A9F8 EA               [ 1] 3876 	rlc a 
      00A9F9 01 EA            [ 1] 3877 	dec (1,sp) 
      00A9FB 02 EA            [ 1] 3878 	jrne 2$
      002C3E                       3879 4$: _drop 1 
      00A9FD 03 27            [ 2]    1     addw sp,#1 
      00A9FF 03               [ 4] 3880 	ret
                                   3881 
                                   3882 ;------------------------------
                                   3883 ; BASIC: RSHIFT(expr1,expr2)
                                   3884 ; logical shift right expr1 by 
                                   3885 ; expr2 bits.
                                   3886 ; output:
                                   3887 ; 	A 		TK_INTGR
                                   3888 ;   X 		result 
                                   3889 ;------------------------------
      002C41                       3890 rshift:
      00AA00 CD A9 AB         [ 4] 3891 	call func_args
      00AA03 A1 02            [ 1] 3892 	cp a,#2 
      00AA03 CD 87            [ 1] 3893 	jreq 1$
      00AA05 EF 0F 03         [ 2] 3894 	jp syntax_error
      002C4B                       3895 1$: _xpop ; T>A:X
      00AA08 CD A9            [ 1]    1     ld a,(y)
      00AA0A 63               [ 1]    2     ldw x,y 
      00AA0B CE AA            [ 2]    3     ldw x,(1,x)
      00AA0D 63 90 FF 72      [ 2]    4     addw y,#CELL_SIZE 
      00AA11 A9               [ 1] 3896     ld a,xl 
      00AA12 00               [ 1] 3897 	push a    
      002C56                       3898 	_xpop  
      00AA13 02 1E            [ 1]    1     ld a,(y)
      00AA15 05               [ 1]    2     ldw x,y 
      00AA16 90 FF            [ 2]    3     ldw x,(1,x)
      00AA18 72 A9 00 02      [ 2]    4     addw y,#CELL_SIZE 
      00AA1C A6 7C            [ 1] 3899 	tnz (1,sp)
      00AA1E A3 00            [ 1] 3900 	jreq 4$
      00AA20 7C               [ 1] 3901 2$:	rcf 
      00AA21 22               [ 1] 3902 	rrc a 
      00AA22 01               [ 2] 3903 	rrcw x 
      00AA23 9F 6B            [ 1] 3904 	dec (1,sp) 
      00AA25 04 CE            [ 1] 3905 	jrne 2$
      002C6A                       3906 4$: _drop 1 
      00AA27 00 1C            [ 2]    1     addw sp,#1 
      00AA29 1F               [ 4] 3907 	ret
                                   3908 
                                   3909 ;--------------------------
                                   3910 ; BASIC: FCPU integer
                                   3911 ; set CPU frequency 
                                   3912 ;-------------------------- 
                                   3913 
      002C6D                       3914 fcpu:
      00AA2A 01 84            [ 1] 3915 	ld a,#TK_INTGR
      00AA2B CD 1A 07         [ 4] 3916 	call expect 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



      00AA2B 1E 01 7B         [ 4] 3917 	call get_int24 
      00AA2E 04               [ 1] 3918 	ld a,xl 
      00AA2F CD A9            [ 1] 3919 	and a,#7 
      00AA31 53 1F 01         [ 1] 3920 	ld CLK_CKDIVR,a 
      00AA34 AE               [ 4] 3921 	ret 
                                   3922 
                                   3923 ;------------------------------
                                   3924 ; BASIC: PMODE pin#, mode 
                                   3925 ; Arduino pin. 
                                   3926 ; define pin as input or output
                                   3927 ; pin#: {0..15}
                                   3928 ; mode: INPUT|OUTPUT  
                                   3929 ;------------------------------
                           000001  3930 	PINNO=1
                           000001  3931 	VSIZE=1
      002C7C                       3932 pin_mode:
      002C7C                       3933 	_vars VSIZE 
      00AA35 16 B8            [ 2]    1     sub sp,#VSIZE 
      00AA37 CD 88 09         [ 4] 3934 	call arg_list 
      00AA3A AE 00            [ 1] 3935 	cp a,#2 
      00AA3C 80 CD            [ 1] 3936 	jreq 1$
      00AA3E 89 28 1E         [ 2] 3937 	jp syntax_error 
      002C88                       3938 1$: _xpop 
      00AA41 01 C3            [ 1]    1     ld a,(y)
      00AA43 00               [ 1]    2     ldw x,y 
      00AA44 1E 24            [ 2]    3     ldw x,(1,x)
      00AA46 16 1E 05 72      [ 2]    4     addw y,#CELL_SIZE 
      00AA4A F0 03 1F         [ 2] 3939 	ldw ptr16,x ; mode 
      002C94                       3940 	_xpop ; Dx pin 
      00AA4D 05 A6            [ 1]    1     ld a,(y)
      00AA4F 80               [ 1]    2     ldw x,y 
      00AA50 A3 00            [ 2]    3     ldw x,(1,x)
      00AA52 80 24 01 9F      [ 2]    4     addw y,#CELL_SIZE 
      00AA56 6B 04 CD         [ 4] 3941 	call select_pin 
      00AA59 A9 63            [ 1] 3942 	ld (PINNO,sp),a  
      00AA5B 20 CE            [ 1] 3943 	ld a,#1 
      00AA5D 5B 06            [ 1] 3944 	tnz (PINNO,sp)
      00AA5F 90 85            [ 1] 3945 	jreq 4$
      00AA61 85               [ 1] 3946 2$:	sll a 
      00AA62 81 54            [ 1] 3947 	dec (PINNO,sp)
      00AA64 42 58            [ 1] 3948 	jrne 2$ 
      00AA66 58 01            [ 1] 3949 	ld (PINNO,sp),a
      00AA67 7B 01            [ 1] 3950 	ld a,(PINNO,sp)
      00AA67 89 9F            [ 1] 3951 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00AA69 A4 80            [ 1] 3952 	ld (GPIO_CR1,x),a 
      00AA6B 97 FE            [ 1] 3953 4$:	ld a,#OUTP
      00AA6D C3 AA 65         [ 1] 3954 	cp a,acc8 
      00AA70 85 81            [ 1] 3955 	jreq 6$
                                   3956 ; input mode
                                   3957 ; disable external interrupt 
      00AA72 7B 01            [ 1] 3958 	ld a,(PINNO,sp)
      00AA72 9F               [ 1] 3959 	cpl a 
      00AA73 A4 80            [ 1] 3960 	and a,(GPIO_CR2,x)
      00AA75 97 CF            [ 1] 3961 	ld (GPIO_CR2,x),a 
                                   3962 ;clear bit in DDR for input mode 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



      00AA77 00 0E            [ 1] 3963 	ld a,(PINNO,sp)
      00AA79 EE               [ 1] 3964 	cpl a 
      00AA7A 02 72            [ 1] 3965 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00AA7C BB 00            [ 1] 3966 	ld (GPIO_DDR,x),a 
      00AA7E 0E 1C            [ 2] 3967 	jra 9$
      002CCC                       3968 6$: ;output mode  
      00AA80 00 04            [ 1] 3969 	ld a,(PINNO,sp)
      00AA82 1C 00            [ 1] 3970 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00AA84 7F 9F            [ 1] 3971 	ld (GPIO_DDR,x),a 
      00AA86 A4 80            [ 1] 3972 	ld a,(PINNO,sp)
      00AA88 97 81            [ 1] 3973 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00AA8A E7 04            [ 1] 3974 	ld (GPIO_CR2,x),a 
      002CD8                       3975 9$:	
      002CD8                       3976 	_drop VSIZE 
      00AA8A CD 9A            [ 2]    1     addw sp,#VSIZE 
      00AA8C 71               [ 4] 3977 	ret
                                   3978 
                                   3979 ;------------------------
                                   3980 ; select Arduino pin 
                                   3981 ; input:
                                   3982 ;   X 	 {0..15} Arduino Dx 
                                   3983 ; output:
                                   3984 ;   A     stm8s208 pin 
                                   3985 ;   X     base address s208 GPIO port 
                                   3986 ;---------------------------
      002CDB                       3987 select_pin:
      00AA8D AE               [ 2] 3988 	sllw x 
      00AA8E B9 00 89         [ 2] 3989 	addw x,#arduino_to_8s208 
      00AA91 FE               [ 2] 3990 	ldw x,(x)
      00AA91 CD               [ 1] 3991 	ld a,xl 
      00AA92 A9               [ 1] 3992 	push a 
      00AA93 48               [ 1] 3993 	swapw x 
      00AA94 26 3B            [ 1] 3994 	ld a,#5 
      00AA96 1C               [ 4] 3995 	mul x,a 
      00AA97 00 04 35         [ 2] 3996 	addw x,#GPIO_BASE 
      00AA9A 10               [ 1] 3997 	pop a 
      00AA9B 00               [ 4] 3998 	ret 
                                   3999 ; translation from Arduino D0..D15 to stm8s208rb 
      002CEB                       4000 arduino_to_8s208:
      00AA9C 0B CD                 4001 .byte 3,6 ; D0 
      00AA9E 99 06                 4002 .byte 3,5 ; D1 
      00AAA0 A6 20                 4003 .byte 4,0 ; D2 
      00AAA2 CD 89                 4004 .byte 2,1 ; D3
      00AAA4 C7 1E                 4005 .byte 6,0 ; D4
      00AAA6 01 EE                 4006 .byte 2,2 ; D5
      00AAA8 02 35                 4007 .byte 2,3 ; D6
      00AAAA 0A 00                 4008 .byte 3,1 ; D7
      00AAAC 0B CD                 4009 .byte 3,3 ; D8
      00AAAE 99 06                 4010 .byte 2,4 ; D9
      00AAB0 AE 9F                 4011 .byte 4,5 ; D10
      00AAB2 7D CD                 4012 .byte 2,6 ; D11
      00AAB4 8A 24                 4013 .byte 2,7 ; D12
      00AAB6 A6 2C                 4014 .byte 2,5 ; D13
      00AAB8 CD 89                 4015 .byte 4,2 ; D14
      00AABA C7 1E                 4016 .byte 4,1 ; D15
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



                                   4017 
                                   4018 
                                   4019 ;------------------------------
                                   4020 ; BASIC: RND(expr)
                                   4021 ; return random number 
                                   4022 ; between 1 and expr inclusive
                                   4023 ; xorshift16 
                                   4024 ; ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   4025 ; input:
                                   4026 ; 	none 
                                   4027 ; output:
                                   4028 ;	xstack 	random positive integer 
                                   4029 ;------------------------------
      002D0B                       4030 random:
      00AABC 01 1C 00         [ 4] 4031 	call func_args 
      00AABF 08 CD            [ 1] 4032 	cp a,#1
      00AAC1 8A 24            [ 1] 4033 	jreq 1$
      00AAC3 A6 0D CD         [ 2] 4034 	jp syntax_error
      002D15                       4035 1$:  
      002D15                       4036 	_xpop   
      00AAC6 89 C7            [ 1]    1     ld a,(y)
      00AAC8 1E               [ 1]    2     ldw x,y 
      00AAC9 01 CD            [ 2]    3     ldw x,(1,x)
      00AACB AA 72 1F 01      [ 2]    4     addw y,#CELL_SIZE 
      00AACF 20               [ 2] 4037 	pushw x 
      00AAD0 C0               [ 1] 4038 	push a  
      00AAD1 A6 80            [ 1] 4039 	ld a,#0x80 
      00AAD1 CD AA            [ 1] 4040 	bcp a,(1,sp)
      00AAD3 67 27            [ 1] 4041 	jreq 2$
      00AAD5 F4 0A            [ 1] 4042 	ld a,#ERR_BAD_VALUE
      00AAD6 CC 16 D9         [ 2] 4043 	jp tb_error
      002D2B                       4044 2$: 
                                   4045 ; acc16=(x<<5)^x 
      00AAD6 5B 02 81         [ 2] 4046 	ldw x,seedx 
      00AAD9 58               [ 2] 4047 	sllw x 
      00AAD9 CD               [ 2] 4048 	sllw x 
      00AADA 9B               [ 2] 4049 	sllw x 
      00AADB DB               [ 2] 4050 	sllw x 
      00AADC A1               [ 2] 4051 	sllw x 
      00AADD 84               [ 1] 4052 	ld a,xh 
      00AADE 27 03 CC         [ 1] 4053 	xor a,seedx 
      00AAE1 97 57 90         [ 1] 4054 	ld acc16,a 
      00AAE4 F6               [ 1] 4055 	ld a,xl 
      00AAE5 93 EE 01         [ 1] 4056 	xor a,seedx+1 
      00AAE8 72 A9 00         [ 1] 4057 	ld acc8,a 
                                   4058 ; seedx=seedy 
      00AAEB 03 C7 00         [ 2] 4059 	ldw x,seedy 
      00AAEE 19 CF 00         [ 2] 4060 	ldw seedx,x  
                                   4061 ; seedy=seedy^(seedy>>1)
      00AAF1 1A 00 16         [ 2] 4062 	ldw x,seedy 
      00AAF2 54               [ 2] 4063 	srlw x 
      00AAF2 CD               [ 1] 4064 	ld a,xh 
      00AAF3 98 BE A1         [ 1] 4065 	xor a,seedy 
      00AAF6 08 27 02         [ 1] 4066 	ld seedy,a  
      00AAF9 20               [ 1] 4067 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



      00AAFA 46 CD 98         [ 1] 4068 	xor a,seedy+1 
      00AAFD BE A1 04         [ 1] 4069 	ld seedy+1,a 
                                   4070 ; acc16>>3 
      00AB00 27 23 A1         [ 2] 4071 	ldw x,acc16 
      00AB03 02               [ 2] 4072 	srlw x 
      00AB04 27               [ 2] 4073 	srlw x 
      00AB05 2A               [ 2] 4074 	srlw x 
                                   4075 ; x=acc16^x 
      00AB06 55               [ 1] 4076 	ld a,xh 
      00AB07 00 04 00         [ 1] 4077 	xor a,acc16 
      00AB0A 02 CD 9B         [ 1] 4078 	ld acc16,a 
      00AB0D DB               [ 1] 4079 	ld a,xl 
      00AB0E A1 84 27         [ 1] 4080 	xor a,acc8 
      00AB11 03 CC 97         [ 1] 4081 	ld acc8,a 
                                   4082 ; seedy=acc16^seedy 
      00AB14 57 90 F6         [ 1] 4083 	xor a,seedy+1
      00AB17 93               [ 1] 4084 	ld xl,a 
      00AB18 EE 01 72         [ 1] 4085 	ld a,acc16 
      00AB1B A9 00 03         [ 1] 4086 	xor a,seedy
      00AB1E 9F               [ 1] 4087 	ld xh,a 
      00AB1F 5F CD 88         [ 2] 4088 	ldw seedy,x 
                                   4089 ; return seedx_lo&0x7f:seedy modulo expr + 1 
      00AB22 53 20 CD         [ 1] 4090 	ld a,seedx+1
      00AB25 A4 7F            [ 1] 4091 	and a,#127
      002D80                       4092 	_xpush 
      00AB25 F6 72 5C 00      [ 2]    1     subw y,#CELL_SIZE
      00AB29 02 5F            [ 1]    2     ld (y),a 
      00AB2B CD 88 53         [ 2]    3     ldw (1,y),x 
      00AB2E 20               [ 1] 4093 	pop a 
      00AB2F C2               [ 2] 4094 	popw x 
      00AB30                       4095 	_xpush 
      00AB30 89 F6 72 5C      [ 2]    1     subw y,#CELL_SIZE
      00AB34 00 02            [ 1]    2     ld (y),a 
      00AB36 5F CD 88         [ 2]    3     ldw (1,y),x 
      00AB39 53 85 F6         [ 4] 4096 	call mod24 
      002D97                       4097 	_xpop
      00AB3C 27 B4            [ 1]    1     ld a,(y)
      00AB3E 5C               [ 1]    2     ldw x,y 
      00AB3F 20 EF            [ 2]    3     ldw x,(1,x)
      00AB41 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00AB41 81 00 01         [ 2] 4098 	addw x,#1 
      00AB42 A9 00            [ 1] 4099 	adc a,#0  
      00AB42 CD               [ 4] 4100 	ret 
                                   4101 
                                   4102 ;---------------------------------
                                   4103 ; BASIC: WORDS 
                                   4104 ; affiche la listes des mots du
                                   4105 ; dictionnaire ainsi que le nombre
                                   4106 ; de mots.
                                   4107 ;---------------------------------
                           000001  4108 	WLEN=1 ; word length
                           000002  4109 	LLEN=2 ; character sent to console
                           000003  4110 	WCNT=3 ; count words printed 
                           000003  4111 	VSIZE=3 
      002DA6                       4112 words:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



      00AB43 9A 94 A1         [ 4] 4113 	call cmd_line_only
      00AB46 01 27            [ 2] 4114 	pushw y
      002DAB                       4115 	_vars VSIZE
      00AB48 03 CC            [ 2]    1     sub sp,#VSIZE 
      00AB4A 97 57            [ 1] 4116 	clr (LLEN,sp)
      00AB4C 90 F6            [ 1] 4117 	clr (WCNT,sp)
      00AB4E 93 EE 01 72      [ 2] 4118 	ldw y,#kword_dict+2
      00AB52 A9               [ 1] 4119 0$:	ldw x,y
      00AB53 00               [ 1] 4120 	ld a,(x)
      00AB54 03 9F            [ 1] 4121 	and a,#15 
      00AB56 A4 7F            [ 1] 4122 	ld (WLEN,sp),a 
      00AB58 81 03            [ 1] 4123 	inc (WCNT,sp)
      00AB59 5C               [ 1] 4124 1$:	incw x 
      00AB59 A6               [ 1] 4125 	ld a,(x)
      00AB5A 06 CD 9A         [ 4] 4126 	call putc 
      00AB5D 87 CD            [ 1] 4127 	inc (LLEN,sp)
      00AB5F 98 BE            [ 1] 4128 	dec (WLEN,sp)
      00AB61 A1 02            [ 1] 4129 	jrne 1$
      00AB63 27 0E            [ 1] 4130 	ld a,#70
      00AB65 A1 04            [ 1] 4131 	cp a,(LLEN,sp)
      00AB67 27 12            [ 1] 4132 	jrmi 2$   
      00AB69 A1 82            [ 1] 4133 	ld a,#SPACE 
      00AB6B 27 03 CC         [ 4] 4134 	call putc 
      00AB6E 97 57            [ 1] 4135 	inc (LLEN,sp) 
      00AB70 20 07            [ 2] 4136 	jra 3$
      00AB70 FD 20            [ 1] 4137 2$: ld a,#CR 
      00AB72 0B 09 47         [ 4] 4138 	call putc 
      00AB73 0F 02            [ 1] 4139 	clr (LLEN,sp)
      00AB73 F6 88 CD 98      [ 2] 4140 3$:	subw y,#2 
      00AB77 D7 84            [ 2] 4141 	ldw y,(y)
      00AB79 20 03            [ 1] 4142 	jrne 0$ 
      00AB7B A6 0D            [ 1] 4143 	ld a,#CR 
      00AB7B CD 99 00         [ 4] 4144 	call putc  
      00AB7E 5F               [ 1] 4145 	clrw x 
      00AB7F 02 72            [ 1] 4146 	ld a,(WCNT,sp)
      00AB81 A2               [ 1] 4147 	ld xl,a 
      00AB82 00 03 90         [ 4] 4148 	call prt_i16 
      00AB85 F7 90 EF         [ 2] 4149 	ldw x,#words_count_msg
      00AB88 01 A6 07         [ 4] 4150 	call puts 
      002DF8                       4151 	_drop VSIZE 
      00AB8B CD 9A            [ 2]    1     addw sp,#VSIZE 
      00AB8D 87 85            [ 2] 4152 	popw y 
      00AB8E 81               [ 4] 4153 	ret 
      00AB8E 90 F6 93 EE 01 72 A9  4154 words_count_msg: .asciz " words in dictionary\n"
             00 03 81 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   4155 
                                   4156 
                                   4157 ;-----------------------------
                                   4158 ; BASIC: TIMER expr 
                                   4159 ; initialize count down timer 
                                   4160 ;-----------------------------
      00AB98                       4161 set_timer:
      00AB98 CD 89 D7         [ 4] 4162 	call arg_list
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



      00AB9B 81 01            [ 1] 4163 	cp a,#1 
      00AB9C 27 03            [ 1] 4164 	jreq 1$
      00AB9C 5F C6 00         [ 2] 4165 	jp syntax_error
      002E1D                       4166 1$: 
      002E1D                       4167 	_xpop  
      00AB9F 2E C0            [ 1]    1     ld a,(y)
      00ABA1 00               [ 1]    2     ldw x,y 
      00ABA2 2F 27            [ 2]    3     ldw x,(1,x)
      00ABA4 03 53 A6 FF      [ 2]    4     addw y,#CELL_SIZE 
      00ABA8 CF 00 12         [ 2] 4168 	ldw timer,x 
      00ABA8 81               [ 4] 4169 	ret 
                                   4170 
                                   4171 ;------------------------------
                                   4172 ; BASIC: TIMEOUT 
                                   4173 ; return state of timer 
                                   4174 ; output:
                                   4175 ;   A:X     0 not timeout 
                                   4176 ;   A:X     -1 timeout 
                                   4177 ;------------------------------
      00ABA9                       4178 timeout:
      00ABA9 72               [ 1] 4179 	clr a 
      00ABAA 5F 00 19         [ 2] 4180 	ldw x,timer 
      00ABAD AE B9            [ 1] 4181 	jreq 1$
      00ABAF 00               [ 1] 4182 	clrw x
      00ABB0 89               [ 4] 4183 	ret  
      00ABB1 CF               [ 1] 4184 1$:	cpl a
      00ABB2 00               [ 2] 4185 	cplw x 
      00ABB3 1A               [ 4] 4186 	ret 
                                   4187  	
                                   4188 
                                   4189 
                                   4190 
                                   4191 ;-----------------------------------
                                   4192 ; BASIC: IWDGEN expr1 
                                   4193 ; enable independant watchdog timer
                                   4194 ; expr1 is delay in multiple of 62.5µsec
                                   4195 ; expr1 -> {1..16383}
                                   4196 ;-----------------------------------
      002E35                       4197 enable_iwdg:
      00ABB4 CD 89 36         [ 4] 4198 	call arg_list
      00ABB7 27 0F            [ 1] 4199 	cp a,#1 
      00ABB9 1E 01            [ 1] 4200 	jreq 1$
      00ABBB 1C 00 80         [ 2] 4201 	jp syntax_error 
      002E3F                       4202 1$: _xpop  
      00ABBE 27 04            [ 1]    1     ld a,(y)
      00ABC0 1F               [ 1]    2     ldw x,y 
      00ABC1 01 20            [ 2]    3     ldw x,(1,x)
      00ABC3 ED A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00ABC4 4B 00            [ 1] 4203 	push #0
      00ABC4 0F 01 0F 02      [ 1] 4204 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00ABC8 85               [ 1] 4205 	ld a,xh 
      00ABC9 4F 81            [ 1] 4206 	and a,#0x3f
      00ABCB 95               [ 1] 4207 	ld xh,a  
      00ABCB CD 9A 94         [ 2] 4208 2$:	cpw x,#255
      00ABCE A1 02            [ 2] 4209 	jrule 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



      00ABD0 27 03            [ 1] 4210 	inc (1,sp)
      00ABD2 CC               [ 1] 4211 	rcf 
      00ABD3 97               [ 2] 4212 	rrcw x 
      00ABD4 57 F5            [ 2] 4213 	jra 2$
      00ABD5 35 55 50 E0      [ 1] 4214 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00ABD5 90               [ 1] 4215 	pop a  
      00ABD6 E6 03 93         [ 1] 4216 	ld IWDG_PR,a 
      00ABD9 EE               [ 1] 4217 	ld a,xl
      00ABDA 04               [ 1] 4218 	dec a 
      00ABDB CF 00 1A 90      [ 1] 4219 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00ABDF F6 93 EE         [ 1] 4220 	ld IWDG_RLR,a 
      00ABE2 01 72 A9 00      [ 1] 4221 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00ABE6 03               [ 4] 4222 	ret 
                                   4223 
                                   4224 
                                   4225 ;-----------------------------------
                                   4226 ; BASIC: IWDGREF  
                                   4227 ; refresh independant watchdog count down 
                                   4228 ; timer before it reset MCU. 
                                   4229 ;-----------------------------------
      002E73                       4230 refresh_iwdg:
      00ABE7 90 F7 90 EF      [ 1] 4231 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00ABEB 01               [ 4] 4232 	ret 
                                   4233 
                                   4234 
                                   4235 ;-------------------------------------
                                   4236 ; BASIC: LOG2(expr)
                                   4237 ; return logarithm base 2 of expr 
                                   4238 ; this is the position of most significant
                                   4239 ; bit set. 
                                   4240 ; input: 
                                   4241 ; output:
                                   4242 ;   A     TK_INTGR 
                                   4243 ;   xstack log2 
                                   4244 ;*********************************
      002E78                       4245 log2:
      00ABEC 72 CD 00         [ 4] 4246 	call func_args 
      00ABEF 1A 81            [ 1] 4247 	cp a,#1 
      00ABF1 27 03            [ 1] 4248 	jreq 1$
      00ABF1 72 0D 52         [ 2] 4249 	jp syntax_error 
      002E82                       4250 1$: 
      002E82                       4251 	_xpop    
      00ABF4 30 FB            [ 1]    1     ld a,(y)
      00ABF6 8E               [ 1]    2     ldw x,y 
      00ABF7 CC 81            [ 2]    3     ldw x,(1,x)
      00ABF9 35 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00ABFA 4D               [ 1] 4252 	tnz a
      00ABFA 72 0D            [ 1] 4253 	jrne 2$ 
      00ABFC 52               [ 2] 4254 	tnzw x 
      00ABFD 30 FB            [ 1] 4255 	jrne 2$
      00ABFF 72 16            [ 1] 4256 	ld a,#ERR_BAD_VALUE
      00AC01 00 23 8E         [ 2] 4257 	jp tb_error 
      00AC04 81 18            [ 1] 4258 2$: push #24 
      00AC05 59               [ 2] 4259 3$: rlcw x 
      00AC05 CD               [ 1] 4260     rlc a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



      00AC06 9B DB            [ 1] 4261 	jrc 4$
      00AC08 A1 84            [ 1] 4262 	dec (1,sp) 
      00AC0A 27 03            [ 1] 4263 	jrne 3$
      00AC0C CC               [ 1] 4264 4$: clrw x 
      00AC0D 97               [ 1] 4265     pop a 
      00AC0E 57               [ 1] 4266 	dec a
      00AC0F 90               [ 1] 4267 	rlwa x  
      002EA4                       4268 9$:	
      00AC10 F6               [ 4] 4269 	ret 
                                   4270 
                                   4271 ;-----------------------------------
                                   4272 ; BASIC: BIT(expr) 
                                   4273 ; expr ->{0..23}
                                   4274 ; return 2^expr 
                                   4275 ; output:
                                   4276 ;    A:X    2^expr 
                                   4277 ;-----------------------------------
      002EA5                       4278 bitmask:
      00AC11 93 EE 01         [ 4] 4279     call func_args 
      00AC14 72 A9            [ 1] 4280 	cp a,#1
      00AC16 00 03            [ 1] 4281 	jreq 1$
      00AC18 CC 16 D7         [ 2] 4282 	jp syntax_error 
      002EAF                       4283 1$: _xpop 
      00AC18 CF 00            [ 1]    1     ld a,(y)
      00AC1A 13               [ 1]    2     ldw x,y 
      00AC1B CE 00            [ 2]    3     ldw x,(1,x)
      00AC1D 13 5D 27 03      [ 2]    4     addw y,#CELL_SIZE 
      00AC21 8F               [ 1] 4284 	ld a,xl 
      00AC22 26 F7 01         [ 2] 4285 	ldw x,#1 
      00AC24 A4 17            [ 1] 4286 	and a,#23
      00AC24 81 0A            [ 1] 4287 	jreq 9$
      00AC25 88               [ 1] 4288 	push a 
      00AC25 CD               [ 1] 4289 	clr a 
      002EC2                       4290 2$: 
      00AC26 9B               [ 2] 4291 	slaw x 
      00AC27 DB               [ 1] 4292 	rlc a 	
      00AC28 A1 84            [ 1] 4293 	dec (1,sp)
      00AC2A 27 03            [ 1] 4294 	jrne 2$ 
      002EC8                       4295 4$:
      002EC8                       4296     _drop 1 
      00AC2C CC 97            [ 2]    1     addw sp,#1 
      00AC2E 57               [ 4] 4297 9$:	ret 
                                   4298 
                                   4299 ;------------------------------
                                   4300 ; BASIC: DO 
                                   4301 ; initiate a DO ... UNTIL loop 
                                   4302 ;------------------------------
                           000003  4303 	DOLP_ADR=3 
                           000005  4304 	DOLP_INW=5
                           000004  4305 	VSIZE=4 
      002ECB                       4306 do_loop:
      00AC2F 90               [ 2] 4307 	popw x 
      002ECC                       4308 	_vars VSIZE 
      00AC30 F6 93            [ 2]    1     sub sp,#VSIZE 
      00AC32 EE               [ 2] 4309 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



      00AC33 01 72 A9         [ 2] 4310 	ldw x,basicptr 
      00AC36 00 03            [ 2] 4311 	ldw (DOLP_ADR,sp),x
      00AC38 CE 00 00         [ 2] 4312 	ldw x,in.w 
      00AC38 A3 14            [ 2] 4313 	ldw (DOLP_INW,sp),x
      00AC3A 00 2B 0C 35      [ 1] 4314 	inc loop_depth 
      00AC3E 0F               [ 4] 4315 	ret 
                                   4316 
                                   4317 ;--------------------------------
                                   4318 ; BASIC: UNTIL expr 
                                   4319 ; loop if exprssion is false 
                                   4320 ; else terminate loop
                                   4321 ;--------------------------------
      002EDE                       4322 until: 
      00AC3F 50 F2 A6 1E      [ 1] 4323 	tnz loop_depth 
      00AC43 62 A6            [ 1] 4324 	jrne 1$ 
      00AC45 10 62 20         [ 2] 4325 	jp syntax_error 
      002EE7                       4326 1$: 
      00AC48 1E 1C 74         [ 4] 4327 	call condition  
      00AC49                       4328 	_xpop 
      00AC49 A3 08            [ 1]    1     ld a,(y)
      00AC4B 00               [ 1]    2     ldw x,y 
      00AC4C 2B 09            [ 2]    3     ldw x,(1,x)
      00AC4E 35 0E 50 F2      [ 2]    4     addw y,#CELL_SIZE 
      00AC52 A6               [ 1] 4329 	tnz a 
      00AC53 50 62            [ 1] 4330 	jrne 9$ 
      00AC55 20               [ 2] 4331 	tnzw x 
      00AC56 10 10            [ 1] 4332 	jrne 9$ 
      00AC57 1E 03            [ 2] 4333 	ldw x,(DOLP_ADR,sp)
      00AC57 35 07 50         [ 2] 4334 	ldw basicptr,x 
      00AC5A F2 02            [ 1] 4335 	ld a,(2,x)
      00AC5B C7 00 02         [ 1] 4336 	ld count,a 
      00AC5B A3 00            [ 2] 4337 	ldw x,(DOLP_INW,sp)
      00AC5D 40 23 07         [ 2] 4338 	ldw in.w,x 
      00AC60 72               [ 4] 4339 	ret 
      002F09                       4340 9$:	; remove loop data from stack  
      00AC61 5C               [ 2] 4341 	popw x
      002F0A                       4342 	_drop VSIZE
      00AC62 50 F2            [ 2]    1     addw sp,#VSIZE 
      00AC64 54 20 F4 1F      [ 1] 4343 	dec loop_depth 
      00AC67 FC               [ 2] 4344 	jp (x)
                                   4345 
                                   4346 ;--------------------------
                                   4347 ; BASIC: PORTA...PORTI  
                                   4348 ;  return constant value 
                                   4349 ;  PORT  base address 
                                   4350 ;---------------------------
      002F11                       4351 const_porta:
      00AC67 9F 4A 27         [ 2] 4352 	ldw x,#PA_BASE 
      00AC6A 01               [ 1] 4353 	clr a 
      00AC6B 4A               [ 4] 4354 	ret 
      00AC6C                       4355 const_portb:
      00AC6C A4 3E C7         [ 2] 4356 	ldw x,#PB_BASE 
      00AC6F 50               [ 1] 4357 	clr a 
      00AC70 F1               [ 4] 4358 	ret 
      002F1B                       4359 const_portc:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



      00AC71 72 18 50         [ 2] 4360 	ldw x,#PC_BASE 
      00AC74 F0               [ 1] 4361 	clr a 
      00AC75 8E               [ 4] 4362 	ret 
      002F20                       4363 const_portd:
      00AC76 81 50 0F         [ 2] 4364 	ldw x,#PD_BASE 
      00AC77 4F               [ 1] 4365 	clr a 
      00AC77 C6               [ 4] 4366 	ret 
      002F25                       4367 const_porte:
      00AC78 00 10 CE         [ 2] 4368 	ldw x,#PE_BASE 
      00AC7B 00               [ 1] 4369 	clr a 
      00AC7C 11               [ 4] 4370 	ret 
      002F2A                       4371 const_portf:
      00AC7D 81 50 19         [ 2] 4372 	ldw x,#PF_BASE 
      00AC7E 4F               [ 1] 4373 	clr a 
      00AC7E CD               [ 4] 4374 	ret 
      002F2F                       4375 const_portg:
      00AC7F 9A 94 A1         [ 2] 4376 	ldw x,#PG_BASE 
      00AC82 01               [ 1] 4377 	clr a 
      00AC83 27               [ 4] 4378 	ret 
      002F34                       4379 const_porti:
      00AC84 03 CC 97         [ 2] 4380 	ldw x,#PI_BASE 
      00AC87 57               [ 1] 4381 	clr a 
      00AC88 81               [ 4] 4382 	ret 
                                   4383 
                                   4384 ;-------------------------------
                                   4385 ; following return constant 
                                   4386 ; related to GPIO register offset 
                                   4387 ;---------------------------------
      002F39                       4388 const_odr:
      00AC88 CD               [ 1] 4389 	clr a 
      00AC89 82 73 90         [ 2] 4390 	ldw x,#GPIO_ODR
      00AC8C F6               [ 4] 4391 	ret 
      002F3E                       4392 const_idr:
      00AC8D 93               [ 1] 4393 	clr a 
      00AC8E EE 01 72         [ 2] 4394 	ldw x,#GPIO_IDR
      00AC91 A9               [ 4] 4395 	ret 
      002F43                       4396 const_ddr:
      00AC92 00               [ 1] 4397 	clr a
      00AC93 03 81 02         [ 2] 4398 	ldw x,#GPIO_DDR
      00AC95 81               [ 4] 4399 	ret 
      002F48                       4400 const_cr1:
      00AC95 CD               [ 1] 4401 	clr a 
      00AC96 9A 94 A1         [ 2] 4402 	ldw x,#GPIO_CR1
      00AC99 02               [ 4] 4403 	ret 
      002F4D                       4404 const_cr2:
      00AC9A 27               [ 1] 4405 	clr a
      00AC9B 03 CC 97         [ 2] 4406 	ldw x,#GPIO_CR2
      00AC9E 57               [ 4] 4407 	ret 
                                   4408 ;-------------------------
                                   4409 ; BASIC: POUT 
                                   4410 ;  constant for port mode
                                   4411 ;  used by PMODE 
                                   4412 ;  to set pin as output
                                   4413 ;------------------------
      002F52                       4414 const_output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



      00AC9F 90               [ 1] 4415 	clr a 
      00ACA0 F6 93 EE         [ 2] 4416 	ldw x,#OUTP
      00ACA3 01               [ 4] 4417 	ret 
                                   4418 
                                   4419 ;-------------------------
                                   4420 ; BASIC: PINP 
                                   4421 ;  constant for port mode
                                   4422 ;  used by PMODE 
                                   4423 ;  to set pin as input
                                   4424 ;------------------------
      002F57                       4425 const_input:
      00ACA4 72               [ 1] 4426 	clr a  
      00ACA5 A9 00 03         [ 2] 4427 	ldw x,#INP 
      00ACA8 9F               [ 4] 4428 	ret 
                                   4429 	
                                   4430 ;-----------------------
                                   4431 ; memory area constants
                                   4432 ;-----------------------
      002F5C                       4433 const_eeprom_base:
      00ACA9 88               [ 1] 4434 	clr a  
      00ACAA 90 F6 93         [ 2] 4435 	ldw x,#EEPROM_BASE 
      00ACAD EE               [ 4] 4436 	ret 
                                   4437 
                                   4438 ;---------------------------
                                   4439 ; BASIC: DATA 
                                   4440 ; when the interpreter find 
                                   4441 ; a DATA line it skip it.
                                   4442 ;---------------------------
      002F61                       4443 data:
      00ACAE 01 72 A9 00 03   [ 1] 4444 	mov in,count 
      00ACB3 0D               [ 4] 4445 	ret 
                                   4446 
                                   4447 ;------------------------------
                                   4448 ; check if it is a DATA line 
                                   4449 ; input: 
                                   4450 ;    X    line address 
                                   4451 ; output:
                                   4452 ;    Z    set if DATA line 
                                   4453 ;----------------------------
      002F67                       4454 is_data_line:
      00ACB4 01               [ 2] 4455 	pushw x 
      00ACB5 27 07            [ 1] 4456 	ld a,(3,x)
      00ACB7 98 59            [ 1] 4457 	cp a,#TK_CMD 
      00ACB9 49 0A            [ 1] 4458 	jrne 9$
      00ACBB 01 26            [ 2] 4459 	ldw x,(4,x)
      00ACBD F9 5B 01         [ 2] 4460 	cpw x,#data  
      00ACC0 81               [ 2] 4461 9$: popw x 
      00ACC1 81               [ 4] 4462 	ret 
                                   4463 
                                   4464 ;---------------------------------
                                   4465 ; BASIC: RESTORE [line#]
                                   4466 ; set data_ptr to first data line
                                   4467 ; if no DATA found pointer set to
                                   4468 ; zero.
                                   4469 ; if a line# is given as argument 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



                                   4470 ; a data line with that number 
                                   4471 ; is searched and the data pointer 
                                   4472 ; is set to it. If there is no 
                                   4473 ; data line with that number 
                                   4474 ; the program is interrupted. 
                                   4475 ;---------------------------------
      002F75                       4476 restore:
      00ACC1 CD 9A 94         [ 4] 4477 	call runtime_only
      00ACC4 A1               [ 1] 4478 	clrw x 
      00ACC5 02 27 03         [ 2] 4479 	ldw data_ptr,x 
      00ACC8 CC 97 57         [ 2] 4480 	ldw data_ofs,x 
      00ACCB 90 F6 93         [ 2] 4481 	ldw x,txtbgn 
      00ACCE EE 01 72         [ 4] 4482 	call next_token 
      00ACD1 A9 00            [ 1] 4483 	cp a,#TK_INTGR
      00ACD3 03 9F            [ 1] 4484 	jrne 0$
      00ACD5 88 90 F6         [ 4] 4485 	call get_int24
      00ACD8 93 EE            [ 2] 4486 	pushw y 
      00ACDA 01               [ 1] 4487 	clr a 
      00ACDB 72 A9 00         [ 4] 4488 	call search_lineno  
      00ACDE 03 0D            [ 2] 4489 	popw y 
      00ACE0 01               [ 2] 4490 	tnzw x 
      00ACE1 27 07            [ 1] 4491 	jrne set_data_pointer 
      00ACE3 98 46            [ 2] 4492 	jra data_error 
      002F99                       4493 0$:
      002F99                       4494 	_unget_token  
      00ACE5 56 0A 01 26 F9   [ 1]    1      mov in,in.saved  
                                   4495 ; search first DATA line 	
      00ACEA 5B 01 81         [ 2] 4496 1$:	cpw x,txtend
      00ACED 24 3A            [ 1] 4497 	jruge data_error 
      002FA3                       4498 2$:	
      00ACED A6 84 CD         [ 4] 4499 	call is_data_line 
      00ACF0 9A 87            [ 1] 4500 	jrne 4$
      00ACF2 CD 98 F0         [ 4] 4501 4$:	call try_next_line 
      00ACF5 9F A4            [ 1] 4502 	jrne 4$ 
      00ACF7 07               [ 4] 4503 	ret 
                                   4504 
                                   4505 ;---------------------
                                   4506 ; set data pointer 
                                   4507 ; variables at new line 
                                   4508 ; input:
                                   4509 ;    X    line address 
                                   4510 ;----------------------
      002FAE                       4511 set_data_pointer:
      00ACF8 C7 50 C6         [ 2] 4512 	ldw data_ptr,x
      00ACFB 81 02            [ 1] 4513 	ld a,(2,x)
      00ACFC C7 00 09         [ 1] 4514 	ld data_len,a 
      00ACFC 52 01 CD 9A      [ 1] 4515 	mov data_ofs,#FIRST_DATA_ITEM
      00AD00 99               [ 4] 4516 	ret 
                                   4517 
                                   4518 
                                   4519 ;--------------------
                                   4520 ; at end of data line 
                                   4521 ; check if next line 
                                   4522 ; is a data line 
                                   4523 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



                                   4524 ;    X   actual line address 
                                   4525 ;  
                                   4526 ;-------------------
      002FBB                       4527 try_next_line: 
      00AD01 A1 02            [ 1] 4528 	ld a,(2,x)
      00AD03 27 03 CC         [ 1] 4529 	ld acc8,a 
      00AD06 97 57 90 F6      [ 1] 4530 	clr acc16 
      00AD0A 93 EE 01 72      [ 2] 4531 	addw x,acc16 
      00AD0E A9 00 03         [ 2] 4532 	cpw x,txtend 
      00AD11 CF 00            [ 1] 4533 	jrult 1$
      00AD13 1A 90            [ 2] 4534 	jra data_error 
      002FCF                       4535 1$:	
      00AD15 F6 93 EE         [ 4] 4536 	call is_data_line 
      00AD18 01 72            [ 1] 4537 	jreq 2$
      00AD1A A9 00            [ 1] 4538 	ld a,#1  
      00AD1C 03 CD            [ 2] 4539 	jra 9$
      00AD1E AD 5B 6B         [ 4] 4540 2$:	call set_data_pointer
      00AD21 01               [ 1] 4541 	clr a  
      00AD22 A6               [ 4] 4542 9$:	ret 
      002FDD                       4543 data_error:	
      00AD23 01 0D            [ 1] 4544     ld a,#ERR_NO_DATA 
      00AD25 01 27 0D         [ 2] 4545 	jp tb_error 
                                   4546 
                                   4547 
                                   4548 ;---------------------------------
                                   4549 ; BASIC: READ 
                                   4550 ; return next data item | 0 
                                   4551 ;---------------------------------
                           000001  4552 	CTX_BPTR=1 
                           000003  4553 	CTX_IN=3 
                           000004  4554 	CTX_COUNT=4 
                           000005  4555 	INT24=5
                           000007  4556 	VSIZE=7 
      002FE2                       4557 read:
      00AD28 48 0A 01         [ 4] 4558 	call runtime_only
      002FE5                       4559 	_vars  VSIZE 
      00AD2B 26 FB            [ 2]    1     sub sp,#VSIZE 
      00AD2D 6B 01 7B         [ 4] 4560 	call save_context
      002FEA                       4561 read01:	
      00AD30 01 EA 03         [ 1] 4562 	ld a,data_ofs
      00AD33 E7 03 A6         [ 1] 4563 	cp a,data_len 
      00AD36 01 C1            [ 1] 4564 	jreq 2$ ; end of line  
      002FF2                       4565 0$:
      00AD38 00 0F 27         [ 2] 4566 	ldw x,data_ptr 
      00AD3B 10 7B 01         [ 2] 4567 	ldw basicptr,x 
      00AD3E 43 E4 04 E7 04   [ 1] 4568 	mov in,data_ofs 
      00AD43 7B 01 43 E4 02   [ 1] 4569 	mov count,data_len  
      00AD48 E7 02 20         [ 4] 4570 	call expression 
      00AD4B 0C 84            [ 1] 4571 	cp a,#TK_INTGR 
      00AD4C 27 03            [ 1] 4572 	jreq 1$ 
      00AD4C 7B 01 EA         [ 2] 4573 	jp syntax_error 
      00300C                       4574 1$:
      00AD4F 02 E7 02         [ 4] 4575 	call next_token ; skip comma
      00AD52 7B 01 EA         [ 2] 4576 	ldw x,basicptr 
      00AD55 04 E7 04         [ 2] 4577 	ldw data_ptr,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



      00AD58 55 00 01 00 08   [ 1] 4578 	mov data_ofs,in 
      00AD58 5B 01 81         [ 4] 4579 	call rest_context
      00AD5B                       4580 	_xpop 
      00AD5B 58 1C            [ 1]    1     ld a,(y)
      00AD5D AD               [ 1]    2     ldw x,y 
      00AD5E 6B FE            [ 2]    3     ldw x,(1,x)
      00AD60 9F 88 5E A6      [ 2]    4     addw y,#CELL_SIZE 
      003026                       4581 	_drop VSIZE 
      00AD64 05 42            [ 2]    1     addw sp,#VSIZE 
      00AD66 1C               [ 4] 4582 	ret 
      003029                       4583 2$: ; end of line reached 
                                   4584 	; try next line 
      00AD67 50 00 84         [ 2] 4585 	ldw x,data_ptr  
      00AD6A 81 2F BB         [ 4] 4586 	call try_next_line
      00AD6B 27 C1            [ 1] 4587 	jreq 0$ 
      00AD6B 03 06            [ 2] 4588 	jra data_error 
                                   4589 
                                   4590 ;---------------------------------
                                   4591 ; BASIC: SPIEN clkdiv, 0|1  
                                   4592 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4593 ; if clkdiv==-1 disable SPI
                                   4594 ; 0|1 -> disable|enable  
                                   4595 ;--------------------------------- 
                           000005  4596 SPI_CS_BIT=5
      003033                       4597 spi_enable:
      00AD6D 03 05 04         [ 4] 4598 	call arg_list 
      00AD70 00 02            [ 1] 4599 	cp a,#2
      00AD72 01 06            [ 1] 4600 	jreq 1$
      00AD74 00 02 02         [ 2] 4601 	jp syntax_error 
      00303D                       4602 1$: 
      00AD77 02 03 03 01      [ 1] 4603 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00AD7B 03               [ 2] 4604 	popw x  
      00AD7C 03               [ 2] 4605 	tnzw x 
      00AD7D 02 04            [ 1] 4606 	jreq spi_disable 
      00AD7F 04               [ 2] 4607 	popw x 
      00AD80 05 02            [ 1] 4608 	ld a,#(1<<SPI_CR1_BR)
      00AD82 06               [ 4] 4609 	mul x,a 
      00AD83 02               [ 1] 4610 	ld a,xl 
      00AD84 07 02 05         [ 1] 4611 	ld SPI_CR1,a 
                                   4612 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00AD87 04 02 04 01      [ 1] 4613 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00AD8B 72 1A 50 16      [ 1] 4614 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4615 ; configure SPI as master mode 0.	
      00AD8B CD 9A 94 A1      [ 1] 4616 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4617 ; ~CS line controlled by sofware 	
      00AD8F 01 27 03 CC      [ 1] 4618 	bset SPI_CR2,#SPI_CR2_SSM 
      00AD93 97 57 52 01      [ 1] 4619     bset SPI_CR2,#SPI_CR2_SSI 
                                   4620 ; enable SPI
      00AD95 72 1C 52 00      [ 1] 4621 	bset SPI_CR1,#SPI_CR1_SPE 	
      00AD95 90               [ 4] 4622 	ret 
      003066                       4623 spi_disable:
      003066                       4624 	_drop #2; throw first argument.
      00AD96 F6 93            [ 2]    1     addw sp,##2 
                                   4625 ; wait spi idle 
      00AD98 EE 01            [ 1] 4626 1$:	ld a,#0x82 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      00AD9A 72 A9 00         [ 1] 4627 	and a,SPI_SR
      00AD9D 03 89            [ 1] 4628 	cp a,#2 
      00AD9F 88 A6            [ 1] 4629 	jrne 1$
      00ADA1 80 15 01 27      [ 1] 4630 	bres SPI_CR1,#SPI_CR1_SPE
      00ADA5 05 A6 0A CC      [ 1] 4631 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00ADA9 97 59 50 16      [ 1] 4632 	bres PE_DDR,#SPI_CS_BIT 
      00ADAB 81               [ 4] 4633 	ret 
                                   4634 
      00307E                       4635 spi_clear_error:
      00ADAB CE 00            [ 1] 4636 	ld a,#0x78 
      00ADAD 15 58 58         [ 1] 4637 	bcp a,SPI_SR 
      00ADB0 58 58            [ 1] 4638 	jreq 1$
      00ADB2 58 9E C8 00      [ 1] 4639 	clr SPI_SR 
      00ADB6 15               [ 4] 4640 1$: ret 
                                   4641 
      00308A                       4642 spi_send_byte:
      00ADB7 C7               [ 1] 4643 	push a 
      00ADB8 00 0E 9F         [ 4] 4644 	call spi_clear_error
      00ADBB C8               [ 1] 4645 	pop a 
      00ADBC 00 16 C7 00 0F   [ 2] 4646 	btjf SPI_SR,#SPI_SR_TXE,.
      00ADC1 CE 00 17         [ 1] 4647 	ld SPI_DR,a
      00ADC4 CF 00 15 CE 00   [ 2] 4648 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00ADC9 17 54 9E         [ 1] 4649 	ld a,SPI_DR 
      00ADCC C8               [ 4] 4650 	ret 
                                   4651 
      0030A0                       4652 spi_rcv_byte:
      00ADCD 00 17            [ 1] 4653 	ld a,#255
      00ADCF C7 00 17 9F C8   [ 2] 4654 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00ADD4 00 18 C7         [ 1] 4655 	ld a,SPI_DR 
      00ADD7 00               [ 4] 4656 	ret
                                   4657 
                                   4658 ;------------------------------
                                   4659 ; BASIC: SPIWR byte [,byte]
                                   4660 ; write 1 or more byte
                                   4661 ;------------------------------
      0030AB                       4662 spi_write:
      00ADD8 18 CE 00         [ 4] 4663 	call expression
      00ADDB 0E 54            [ 1] 4664 	cp a,#TK_INTGR 
      00ADDD 54 54            [ 1] 4665 	jreq 1$
      00ADDF 9E C8 00         [ 2] 4666 	jp syntax_error 
      0030B5                       4667 1$:	
      00ADE2 0E               [ 1] 4668 	ld a,xl 
      00ADE3 C7 00 0E         [ 4] 4669 	call spi_send_byte 
      00ADE6 9F C8 00         [ 4] 4670 	call next_token 
      00ADE9 0F C7            [ 1] 4671 	cp a,#TK_COMMA 
      00ADEB 00 0F            [ 1] 4672 	jrne 2$ 
      00ADED C8 00            [ 2] 4673 	jra spi_write 
      00ADEF 18               [ 1] 4674 2$:	tnz a 
      00ADF0 97 C6            [ 1] 4675 	jreq 3$
      0030C5                       4676 	_unget_token  
      00ADF2 00 0E C8 00 17   [ 1]    1      mov in,in.saved  
      00ADF7 95               [ 4] 4677 3$:	ret 
                                   4678 
                                   4679 
                                   4680 ;-------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



                                   4681 ; BASIC: SPIRD 	
                                   4682 ; read one byte from SPI 
                                   4683 ;-------------------------------
      0030CB                       4684 spi_read:
      00ADF8 CF 00 17         [ 4] 4685 	call spi_rcv_byte 
      00ADFB C6               [ 1] 4686 	clrw x 
      00ADFC 00               [ 1] 4687 	ld xl,a 
      00ADFD 16               [ 1] 4688 	clr a  
      00ADFE A4               [ 4] 4689 	ret 
                                   4690 
                                   4691 ;------------------------------
                                   4692 ; BASIC: SPISEL 0|1 
                                   4693 ; set state of ~CS line
                                   4694 ; 0|1 deselect|select  
                                   4695 ;------------------------------
      0030D2                       4696 spi_select:
      00ADFF 7F 72 A2         [ 4] 4697 	call next_token 
      00AE02 00 03            [ 1] 4698 	cp a,#TK_INTGR 
      00AE04 90 F7            [ 1] 4699 	jreq 1$
      00AE06 90 EF 01         [ 2] 4700 	jp syntax_error 
      00AE09 84               [ 2] 4701 1$: tnzw x  
      00AE0A 85 72            [ 1] 4702 	jreq cs_high 
      00AE0C A2 00 03 90      [ 1] 4703 	bres PE_ODR,#SPI_CS_BIT
      00AE10 F7               [ 4] 4704 	ret 
      0030E4                       4705 cs_high: 
      00AE11 90 EF 01 CD      [ 1] 4706 	bset PE_ODR,#SPI_CS_BIT
      00AE15 84               [ 4] 4707 	ret 
                                   4708 
                                   4709 ;-------------------------------
                                   4710 ; BASIC: PAD 
                                   4711 ; Return pad buffer address.
                                   4712 ;------------------------------
      0030E9                       4713 pad_ref:
      00AE16 21 90 F6         [ 2] 4714 	ldw x,#pad 
      00AE19 93               [ 1] 4715 	clr a
      00AE1A EE               [ 4] 4716 	ret 
                                   4717 
                                   4718 ;****************************
                                   4719 ; expression stack 
                                   4720 ; manipulation routines
                                   4721 ;****************************
                                   4722 
                                   4723 ;-----------------------------
                                   4724 ; BASIC: PUSH expr|rel|cond 
                                   4725 ; push the result on xtack
                                   4726 ;-----------------------------
      0030EE                       4727 xpush:
      00AE1B 01 72 A9         [ 4] 4728 	call condition 
      00AE1E 00               [ 4] 4729 	ret 
                                   4730 
                                   4731 ;------------------------------
                                   4732 ; BASIC: POP 
                                   4733 ; pop top of xstack 
                                   4734 ;------------------------------
      0030F2                       4735 xpop:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



      0030F2                       4736 	_xpop 
      00AE1F 03 1C            [ 1]    1     ld a,(y)
      00AE21 00               [ 1]    2     ldw x,y 
      00AE22 01 A9            [ 2]    3     ldw x,(1,x)
      00AE24 00 81 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00AE26 81               [ 4] 4737 	ret 
                                   4738 
                                   4739 
                                   4740 ;------------------------------
                                   4741 ; BASIC: ALLOC expr 
                                   4742 ; allocate expr element on xtack 
                                   4743 ;-------------------------------
      0030FC                       4744 xalloc: 
      00AE26 CD 9A 71         [ 4] 4745 	call expression 
      00AE29 90 89            [ 1] 4746 	cp a,#TK_INTGR
      00AE2B 52 03            [ 1] 4747 	jreq 1$ 
      00AE2D 0F 02 0F         [ 2] 4748 	jp syntax_error
      003106                       4749 1$: _xpop 
      00AE30 03 90            [ 1]    1     ld a,(y)
      00AE32 AE               [ 1]    2     ldw x,y 
      00AE33 B7 3D            [ 2]    3     ldw x,(1,x)
      00AE35 93 F6 A4 0F      [ 2]    4     addw y,#CELL_SIZE 
      00AE39 6B               [ 1] 4750 	tnz a 
      00AE3A 01 0C            [ 1] 4751 	jreq 3$ 
      00AE3C 03 5C            [ 1] 4752 2$:	ld a,#ERR_BAD_VALUE
      00AE3E F6 CD 89         [ 2] 4753 	jp tb_error 
      00AE41 C7 0C 02         [ 2] 4754 3$: cpw x,#XSTACK_SIZE 
      00AE44 0A 01            [ 1] 4755 	jrugt 2$
      00AE46 26 F5            [ 1] 4756 	ld a,#CELL_SIZE 
      00AE48 A6               [ 4] 4757 	mul x,a 
      00AE49 46 11 02         [ 2] 4758 	ldw acc16,x 
      00AE4C 2B 09 A6 20      [ 2] 4759 	subw y,acc16 
      00AE50 CD 89 C7 0C      [ 2] 4760 	cpw y,#xstack_full
      00AE54 02 20            [ 1] 4761 	jrugt 9$
      00AE56 07 A6            [ 1] 4762 	ld a,#ERR_MEM_FULL
      00AE58 0D CD 89         [ 2] 4763 	jp tb_error 
      003131                       4764 9$:	 
      00AE5B C7               [ 4] 4765 	ret 
                                   4766 
                                   4767 
                                   4768 ;------------------------------
                                   4769 ;  BASIC DROP expr 
                                   4770 ;  expr in range {0..XSTACK_SIZE}
                                   4771 ;  discard n elements from xtack
                                   4772 ;------------------------------
      003132                       4773 xdrop:
      00AE5C 0F 02 72         [ 4] 4774 	call expression 
      00AE5F A2 00            [ 1] 4775 	cp a,#TK_INTGR
      00AE61 02 90            [ 1] 4776 	jreq 1$ 
      00AE63 FE 26 CF         [ 2] 4777 	jp syntax_error 
      00313C                       4778 1$:	_xpop 
      00AE66 A6 0D            [ 1]    1     ld a,(y)
      00AE68 CD               [ 1]    2     ldw x,y 
      00AE69 89 C7            [ 2]    3     ldw x,(1,x)
      00AE6B 5F 7B 03 97      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



      00AE6F CD               [ 1] 4779 	ld a,xl 
      00AE70 99 06            [ 1] 4780 	and a,#0x1f 
      00AE72 AE               [ 1] 4781 	clrw x 
      00AE73 AE               [ 1] 4782 	ld xl,a 
      00AE74 7D CD            [ 1] 4783 	ld a,#CELL_SIZE 
      00AE76 8A               [ 4] 4784 	mul x,a 
      00AE77 24 5B 03         [ 2] 4785 	ldw acc16,x  
      00AE7A 90 85 81 20      [ 2] 4786 	addw y,acc16 
      00AE7E 77 6F 72 64      [ 2] 4787 	cpw y,#XSTACK_EMPTY 
      00AE82 73 20            [ 2] 4788 	jrule 9$
      00AE84 69 6E 20 64      [ 2] 4789 	ldw y,#XSTACK_EMPTY 
      00AE88 69               [ 4] 4790 9$:	ret 
                                   4791 
                                   4792 ;-----------------------
                                   4793 ; check if value in A:X 
                                   4794 ; is inside xstack bound
                                   4795 ; output:
                                   4796 ;    X     slot address  
                                   4797 ;-----------------------
      00315F                       4798 xstack_bound:
      00AE89 63               [ 1] 4799 	tnz a 
      00AE8A 74 69            [ 1] 4800 	jrne 8$ 
      00AE8C 6F 6E 61         [ 2] 4801 1$: cpw x,#XSTACK_SIZE 
      00AE8F 72 79            [ 1] 4802 	jrugt 8$
      00AE91 0A 00            [ 1] 4803 	ld a,#CELL_SIZE 
      00AE93 42               [ 4] 4804 	mul x,a
      00AE93 CD 9A 99         [ 2] 4805 	ldw acc16,x 
      00AE96 A1               [ 1] 4806 	ldw x,y 
      00AE97 01 27 03 CC      [ 2] 4807 	addw x,acc16 
      00AE9B 97 57 73         [ 2] 4808 	cpw x,#XSTACK_EMPTY 
      00AE9D 24 01            [ 1] 4809 	jruge 8$  
      00AE9D 90               [ 4] 4810 	ret 
      00AE9E F6 93            [ 1] 4811 8$: ld a,#ERR_BAD_VALUE
      00AEA0 EE 01 72         [ 2] 4812 	jp tb_error 
                                   4813 
                                   4814 ;-------------------------
                                   4815 ; BASIC: PUT expr, cond 
                                   4816 ; expr -> slot 
                                   4817 ; cond -> valut to put 
                                   4818 ; on xstack 
                                   4819 ;-------------------------
      00317D                       4820 xput:
      00AEA3 A9 00 03         [ 4] 4821 	call arg_list 
      00AEA6 CF 00            [ 1] 4822 	cp a,#2 
      00AEA8 13 81            [ 1] 4823 	jreq 1$ 
      00AEAA CC 16 D7         [ 2] 4824 0$:	jp syntax_error
      003187                       4825 1$: _xpop   ; value to put 
      00AEAA 4F CE            [ 1]    1     ld a,(y)
      00AEAC 00               [ 1]    2     ldw x,y 
      00AEAD 13 27            [ 2]    3     ldw x,(1,x)
      00AEAF 02 5F 81 43      [ 2]    4     addw y,#CELL_SIZE 
      00AEB3 53               [ 2] 4826 	pushw x 
      00AEB4 81               [ 1] 4827 	push a 
      00AEB5                       4828 	_xpop    ; slot 
      00AEB5 CD 9A            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



      00AEB7 99               [ 1]    2     ldw x,y 
      00AEB8 A1 01            [ 2]    3     ldw x,(1,x)
      00AEBA 27 03 CC 97      [ 2]    4     addw y,#CELL_SIZE 
      00AEBE 57 90 F6         [ 4] 4829 	call xstack_bound
      00AEC1 93 EE 01         [ 2] 4830     ldw ptr16,x 
      00AEC4 72               [ 1] 4831 	pop a 
      00AEC5 A9               [ 2] 4832 	popw x 
      00AEC6 00 03 4B 00      [ 4] 4833 	ld [ptr16],a 
      00AECA 35 CC 50 E0      [ 1] 4834 	inc ptr8 
      00AECE 9E A4 3F 95      [ 5] 4835 	ldw [ptr16],x 
      00AED2 A3               [ 4] 4836 	ret 
                                   4837 
                                   4838 ;------------------------
                                   4839 ; BASIC: PICK expr 
                                   4840 ; get nième element on 
                                   4841 ; xtack. 
                                   4842 ;-----------------------
      0031B0                       4843 xpick:
      00AED3 00 FF 23         [ 4] 4844 	call func_args 
      00AED6 06 0C            [ 1] 4845 	cp a,#1 
      00AED8 01 98            [ 1] 4846 	jreq 1$
      00AEDA 56 20 F5         [ 2] 4847 	jp syntax_error 
      0031BA                       4848 1$: _xpop 
      00AEDD 35 55            [ 1]    1     ld a,(y)
      00AEDF 50               [ 1]    2     ldw x,y 
      00AEE0 E0 84            [ 2]    3     ldw x,(1,x)
      00AEE2 C7 50 E1 9F      [ 2]    4     addw y,#CELL_SIZE 
      00AEE6 4A 35 55         [ 4] 4849 	call xstack_bound
      00AEE9 50               [ 1] 4850     ld a,(x)
      00AEEA E0 C7            [ 2] 4851 	ldw x,(1,x)				
      00AEEC 50               [ 4] 4852 	ret 
                                   4853 
                                   4854 
                                   4855 ;----------------------------
                                   4856 ; BASIC: AUTORUN \C | label  
                                   4857 ;  \C -> cancel autorun 
                                   4858 ;  addr -> register an 
                                   4859 ;    autorun program 
                                   4860 ;    this program execute at 
                                   4861 ;     reset/boot 
                                   4862 ;----------------------------
      0031CA                       4863 cmd_auto_run:
      00AEED E2 35 AA         [ 4] 4864 	call cmd_line_only
      00AEF0 50 E0 81         [ 4] 4865 	call next_token 
      00AEF3 A1 03            [ 1] 4866 	cp a,#TK_LABEL 
      00AEF3 35 AA            [ 1] 4867 	jreq 1$ 
      00AEF5 50 E0            [ 1] 4868 	cp a,#TK_CHAR 
      00AEF7 81 12            [ 1] 4869 	jrne 0$ 
      00AEF8 F6               [ 1] 4870 	ld a,(x)
      00AEF8 CD 9A 94 A1      [ 1] 4871 	inc in 
      00AEFC 01 27            [ 1] 4872 	and a,#0xDF 
      00AEFE 03 CC            [ 1] 4873 	cp a,#'C 
      00AF00 97 57            [ 1] 4874 	jrne 0$ 
      00AF02 AE 40 00         [ 2] 4875 	ldw x,#EEPROM_BASE 
      00AF02 90 F6 93         [ 4] 4876 	call erase_header
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



      00AF05 EE               [ 4] 4877 	ret 
      00AF06 01 72 A9         [ 2] 4878 0$:	jp syntax_error
      00AF09 00               [ 2] 4879 1$:	pushw x 
      00AF0A 03 4D 26         [ 4] 4880 	call skip_string
      00AF0D 08               [ 2] 4881 	popw x 
      00AF0E 5D 26 05         [ 4] 4882 	call search_program
      00AF11 A6 0A            [ 1] 4883 	jrne 2$ 
      00AF13 CC 97            [ 1] 4884 	ld a,#ERR_BAD_VALUE
      00AF15 59 4B 18         [ 2] 4885 	jp tb_error 
      00AF18 59               [ 2] 4886 2$: pushw x 
      00AF19 49 25 04 0A      [ 1] 4887 	clr farptr 
      00AF1D 01 26 F8         [ 2] 4888 	ldw x,#EEPROM_BASE
      00AF20 5F 84 4A         [ 2] 4889 	ldw ptr16,x 
      00AF23 02 32 21         [ 1] 4890 	ld a,AR_SIGN 
      00AF24 5F               [ 1] 4891 	clrw x 	 
      00AF24 81 07 D3         [ 4] 4892 	call write_byte
      00AF25 C6 32 22         [ 1] 4893 	ld a,AR_SIGN+1
      00AF25 CD 9A 94         [ 4] 4894 	call write_byte 
      00AF28 A1 01            [ 1] 4895 	ld a,(1,sp)
      00AF2A 27 03 CC         [ 4] 4896 	call write_byte 
      00AF2D 97 57            [ 1] 4897 	ld a,(2,sp)
      00AF2F 90 F6 93         [ 4] 4898 	call write_byte 
      00321E                       4899 	_drop 2 
      00AF32 EE 01            [ 2]    1     addw sp,#2 
      00AF34 72               [ 4] 4900 	ret 
                                   4901 
      00AF35 A9 00                 4902 AR_SIGN: .ascii "AR" ; autorun signature 
                                   4903 
                                   4904 ;-------------------------------
                                   4905 ; search a program in flash 
                                   4906 ; memory with a label at first 
                                   4907 ; that correspond to name 
                                   4908 ; pointed by X 
                                   4909 ; input:
                                   4910 ;    x      *name 
                                   4911 ; output: 
                                   4912 ;    X     prog_addr|0
                                   4913 ;-------------------------------
                           000001  4914 	WLKPTR=1 
                           000003  4915 	PNAME=3
                           000005  4916 	LIMIT=5
                           000007  4917 	YSAVE=7
                           000006  4918 	VSIZE=6 
      003223                       4919 search_program:
      00AF37 03 9F            [ 2] 4920 	pushw y 
      003225                       4921 	_vars VSIZE 
      00AF39 AE 00            [ 2]    1     sub sp,#VSIZE 
      00AF3B 01 A4            [ 2] 4922 	ldw (PNAME,sp),x 
      00AF3D 17 27 0A         [ 4] 4923 	call uflash 
      00AF40 88 4F            [ 2] 4924 	ldw (LIMIT,sp),x 
      00AF42 AE 38 80         [ 2] 4925 	ldw x,#app_space 
      00AF42 58 49            [ 2] 4926 1$:	ldw (WLKPTR,sp),x  
      00AF44 0A               [ 1] 4927 	clr a 
      00AF45 01 26 FA         [ 4] 4928 	call is_program_addr
      00AF48 26 10            [ 1] 4929 	jrne 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



      00AF48 5B 01 81         [ 2] 4930 	addw x,#7 
      00AF4B F6               [ 1] 4931 	ld a,(x)
      00AF4B 85 52            [ 1] 4932 	cp a,#TK_LABEL 
      00AF4D 04 89            [ 1] 4933 	jrne 4$ 
      00AF4F CE               [ 1] 4934 	incw x 
      00AF50 00 05            [ 2] 4935 	ldw y,(PNAME,sp)
      00AF52 1F 03 CE         [ 4] 4936 	call strcmp
      00AF55 00 01            [ 1] 4937 	jrne 6$
      003249                       4938 4$: 
      00AF57 1F 05 72         [ 4] 4939 	call skip_to_next
      00AF5A 5C 00            [ 2] 4940 	cpw x,(LIMIT,sp)
      00AF5C 20 81            [ 1] 4941 	jrult 1$
      00AF5E 5F               [ 1] 4942 	clrw x 
      00AF5E 72 5D            [ 2] 4943 	jra 8$
      003253                       4944 6$: ; found label 
      00AF60 00 20            [ 2] 4945 	ldw x,(WLKPTR,sp)
      00AF62 26 03 CC         [ 2] 4946 	addw x,#4 	
      003258                       4947 8$:	
      003258                       4948 	_drop VSIZE  
      00AF65 97 57            [ 2]    1     addw sp,#VSIZE 
      00AF67 90 85            [ 2] 4949 	popw y 
      00AF67 CD               [ 4] 4950 	ret 
                                   4951 
                                   4952 
                                   4953 ;-------------------------------
                                   4954 ; BASIC: CHAIN label [, line#]
                                   4955 ; Execute another program like it 
                                   4956 ; is a sub-routine. When the 
                                   4957 ; called program terminate 
                                   4958 ; execution continue at caller 
                                   4959 ; after CHAIN command. 
                                   4960 ; if a line# is given, the 
                                   4961 ; chained program start execution 
                                   4962 ; at this line#.
                                   4963 ;---------------------------------
                           000003  4964 	CHAIN_LN=3 
                           000005  4965 	CHAIN_ADDR=5 
                           000007  4966 	CHAIN_BP=7
                           000009  4967 	CHAIN_IN=9
                           00000A  4968 	CHAIN_COUNT=10 
                           00000B  4969 	CHAIN_TXTBGN=11 
                           00000D  4970 	CHAIN_TXTEND=13 
                           00000C  4971 	VSIZE=12 
                           000004  4972 	DISCARD=4 
      00325D                       4973 cmd_chain:
      00AF68 9C               [ 2] 4974 	popw x 
      00325E                       4975 	_vars VSIZE 
      00AF69 F4 90            [ 2]    1     sub sp,#VSIZE 
      00AF6B F6               [ 2] 4976 	pushw x
      00AF6C 93 EE            [ 1] 4977 	clr (CHAIN_LN,sp) 
      00AF6E 01 72            [ 1] 4978 	clr (CHAIN_LN+1,sp)  
      00AF70 A9 00            [ 1] 4979 	ld a,#TK_LABEL 
      00AF72 03 4D 26         [ 4] 4980 	call expect 
      00AF75 13               [ 2] 4981 	pushw x 
      00AF76 5D 26 10         [ 4] 4982 	call skip_string
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



      00AF79 1E               [ 2] 4983 	popw x 
      00AF7A 03 CF 00         [ 4] 4984 	call search_program 
      00AF7D 05               [ 2] 4985 	tnzw x  
      00AF7E E6 02            [ 1] 4986 	jrne 1$ 
      00AF80 C7 00            [ 1] 4987 0$:	ld a,#ERR_BAD_VALUE
      00AF82 03 1E 05         [ 2] 4988 	jp tb_error 
      00AF85 CF 00            [ 2] 4989 1$: ldw (CHAIN_ADDR,sp), x ; program addr 
      00AF87 01 81 3E         [ 4] 4990     call next_token 
      00AF89 A1 08            [ 1] 4991 	cp a,#TK_COMMA 
      00AF89 85 5B            [ 1] 4992 	jrne 4$
      00AF8B 04 72            [ 1] 4993 	ld a,#TK_INTGR
      00AF8D 5A 00 20         [ 4] 4994 	call expect 
      00AF90 FC 18 70         [ 4] 4995 	call get_int24 
      00AF91 1F 03            [ 2] 4996 	ldw (CHAIN_LN,sp),x
      00AF91 AE 50            [ 2] 4997 	jra 6$ 
      00328F                       4998 4$: _unget_token 
      00AF93 00 4F 81 00 01   [ 1]    1      mov in,in.saved  
      00AF96                       4999 6$: ; save chain context 
      00AF96 AE 50 05         [ 2] 5000 	ldw x,basicptr 
      00AF99 4F 81            [ 2] 5001 	ldw (CHAIN_BP,sp),x 
      00AF9B CE 00 01         [ 2] 5002 	ldw x,in
      00AF9B AE 50            [ 2] 5003 	ldw (CHAIN_IN,sp),x
      00AF9D 0A 4F 81         [ 2] 5004 	ldw x,txtbgn 
      00AFA0 1F 0B            [ 2] 5005 	ldw (CHAIN_TXTBGN,sp),x
      00AFA0 AE 50 0F         [ 2] 5006 	ldw x,txtend 
      00AFA3 4F 81            [ 2] 5007 	ldw (CHAIN_TXTEND,sp),x  
                                   5008 ; set chained program context 	
      00AFA5 1E 05            [ 2] 5009 	ldw x,(CHAIN_ADDR,sp)
      00AFA5 AE 50 14         [ 2] 5010 	ldw basicptr,x 
      00AFA8 4F 81 1B         [ 2] 5011 	ldw txtbgn,x 
      00AFAA 1D 00 02         [ 2] 5012 	subw x,#2
      00AFAA AE               [ 2] 5013 	ldw x,(x)
      00AFAB 50 19 4F         [ 2] 5014 	addw x,(CHAIN_ADDR,sp)
      00AFAE 81 00 1D         [ 2] 5015 	ldw txtend,x  
      00AFAF 1E 05            [ 2] 5016 	ldw x,(CHAIN_ADDR,sp)
      00AFAF AE 50            [ 1] 5017 	ld a,(2,x)
      00AFB1 1E 4F 81         [ 1] 5018 	ld count,a 
      00AFB4 35 03 00 01      [ 1] 5019 	mov in,#3 
      00AFB4 AE 50            [ 2] 5020 	ldw x,(CHAIN_LN,sp)
      00AFB6 28               [ 2] 5021 	tnzw x 
      00AFB7 4F 81            [ 1] 5022 	jreq 8$ 
      00AFB9 90 89            [ 2] 5023 	pushw y
      00AFB9 4F               [ 1] 5024 	clr a  
      00AFBA AE 00 00         [ 4] 5025 	call search_lineno
      00AFBD 81 85            [ 2] 5026 	popw y 
      00AFBE 5D               [ 2] 5027 	tnzw x 
      00AFBE 4F AE            [ 1] 5028 	jreq 0$ 
      00AFC0 00 01 81         [ 2] 5029 	ldw basicptr,x 
      00AFC3 E6 02            [ 1] 5030 	ld a,(2,x)
      00AFC3 4F AE 00         [ 1] 5031 	ld count,a 
      00AFC6 02 81 00 33      [ 1] 5032 8$: inc chain_level
      00AFC8 85               [ 2] 5033 	popw x 
      0032E2                       5034 	_drop DISCARD
      00AFC8 4F AE            [ 2]    1     addw sp,#DISCARD 
      00AFCA 00               [ 2] 5035 	jp (x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



                                   5036 
                                   5037 
                                   5038 ;------------------------------
                                   5039 ;      dictionary 
                                   5040 ; format:
                                   5041 ;   link:   2 bytes 
                                   5042 ;   name_length+flags:  1 byte, bits 0:3 lenght,4:8 kw type   
                                   5043 ;   cmd_name: 16 byte max 
                                   5044 ;   code_addr: 2 bytes 
                                   5045 ;------------------------------
                                   5046 	.macro _dict_entry len,name,code_addr 
                                   5047 	.word LINK 
                                   5048 	LINK=.
                                   5049 name:
                                   5050 	.byte len   	
                                   5051 	.ascii "name"
                                   5052 	.word code_addr  
                                   5053 	.endm 
                                   5054 
                           000000  5055 	LINK=0
                                   5056 ; respect alphabetic order for BASIC names from Z-A
                                   5057 ; this sort order is for a cleaner WORDS cmd output. 	
      0032E5                       5058 kword_end:
      0032E5                       5059 	_dict_entry,3+F_XOR,XOR,TK_XOR ; xor operator
      00AFCB 03 81                    1 	.word LINK 
                           0032E7     2 	LINK=.
      00AFCD                          3 XOR:
      00AFCD 4F                       4 	.byte 3+F_XOR   	
      00AFCE AE 00 04                 5 	.ascii "XOR"
      00AFD1 81 8A                    6 	.word TK_XOR  
      00AFD2                       5060 	_dict_entry,5,WRITE,write  
      00AFD2 4F AE                    1 	.word LINK 
                           0032EF     2 	LINK=.
      0032EF                          3 WRITE:
      00AFD4 00                       4 	.byte 5   	
      00AFD5 01 81 49 54 45           5 	.ascii "WRITE"
      00AFD7 2A 59                    6 	.word write  
      0032F7                       5061 	_dict_entry,5,WORDS,words 
      00AFD7 4F AE                    1 	.word LINK 
                           0032F9     2 	LINK=.
      0032F9                          3 WORDS:
      00AFD9 00                       4 	.byte 5   	
      00AFDA 00 81 52 44 53           5 	.ascii "WORDS"
      00AFDC 2D A6                    6 	.word words  
      003301                       5062 	_dict_entry 4,WAIT,wait 
      00AFDC 4F AE                    1 	.word LINK 
                           003303     2 	LINK=.
      003303                          3 WAIT:
      00AFDE 40                       4 	.byte 4   	
      00AFDF 00 81 49 54              5 	.ascii "WAIT"
      00AFE1 21 8E                    6 	.word wait  
      00330A                       5063 	_dict_entry,3+F_IFUNC,USR,usr
      00AFE1 55 00                    1 	.word LINK 
                           00330C     2 	LINK=.
      00330C                          3 USR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



      00AFE3 03                       4 	.byte 3+F_IFUNC   	
      00AFE4 00 02 81                 5 	.ascii "USR"
      00AFE7 2B 4B                    6 	.word usr  
      003312                       5064 	_dict_entry,5,UNTIL,until 
      00AFE7 89 E6                    1 	.word LINK 
                           003314     2 	LINK=.
      003314                          3 UNTIL:
      00AFE9 03                       4 	.byte 5   	
      00AFEA A1 80 26 05 EE           5 	.ascii "UNTIL"
      00AFEF 04 A3                    6 	.word until  
      00331C                       5065 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      00AFF1 AF E1                    1 	.word LINK 
                           00331E     2 	LINK=.
      00331E                          3 UFLASH:
      00AFF3 85                       4 	.byte 6+F_IFUNC   	
      00AFF4 81 46 4C 41 53 48        5 	.ascii "UFLASH"
      00AFF5 2B 29                    6 	.word uflash  
      003327                       5066 	_dict_entry,6+F_IFUNC,UBOUND,ubound
      00AFF5 CD 9A                    1 	.word LINK 
                           003329     2 	LINK=.
      003329                          3 UBOUND:
      00AFF7 7C                       4 	.byte 6+F_IFUNC   	
      00AFF8 5F CF 00 07 CF 00        5 	.ascii "UBOUND"
      00AFFE 09 CE                    6 	.word ubound  
      003332                       5067 	_dict_entry,4,TONE,tone  
      00B000 00 1C                    1 	.word LINK 
                           003334     2 	LINK=.
      003334                          3 TONE:
      00B002 CD                       4 	.byte 4   	
      00B003 98 BE A1 84              5 	.ascii "TONE"
      00B007 26 10                    6 	.word tone  
      00333B                       5068 	_dict_entry,2,TO,to
      00B009 CD 98                    1 	.word LINK 
                           00333D     2 	LINK=.
      00333D                          3 TO:
      00B00B F0                       4 	.byte 2   	
      00B00C 90 89                    5 	.ascii "TO"
      00B00E 4F CD                    6 	.word to  
      003342                       5069 	_dict_entry,5,TIMER,set_timer
      00B010 8D 0D                    1 	.word LINK 
                           003344     2 	LINK=.
      003344                          3 TIMER:
      00B012 90                       4 	.byte 5   	
      00B013 85 5D 26 17 20           5 	.ascii "TIMER"
      00B018 44 13                    6 	.word set_timer  
      00B019                       5070 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00B019 55 00                    1 	.word LINK 
                           00334E     2 	LINK=.
      00334E                          3 TIMEOUT:
      00B01B 04                       4 	.byte 7+F_IFUNC   	
      00B01C 00 02 C3 00 1E 24 3A     5 	.ascii "TIMEOUT"
      00B023 2E 2A                    6 	.word timeout  
      003358                       5071 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00B023 CD AF                    1 	.word LINK 
                           00335A     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



      00335A                          3 TICKS:
      00B025 E7                       4 	.byte 5+F_IFUNC   	
      00B026 26 00 CD B0 3B           5 	.ascii "TICKS"
      00B02B 26 FB                    6 	.word get_ticks  
      003362                       5072 	_dict_entry,4,STOP,stop 
      00B02D 81 5A                    1 	.word LINK 
                           003364     2 	LINK=.
      00B02E                          3 STOP:
      00B02E CF                       4 	.byte 4   	
      00B02F 00 07 E6 02              5 	.ascii "STOP"
      00B033 C7 00                    6 	.word stop  
      00336B                       5073 	_dict_entry,4,STEP,step 
      00B035 0A 35                    1 	.word LINK 
                           00336D     2 	LINK=.
      00336D                          3 STEP:
      00B037 06                       4 	.byte 4   	
      00B038 00 09 81 50              5 	.ascii "STEP"
      00B03B 23 3E                    6 	.word step  
      003374                       5074 	_dict_entry,5,SPIWR,spi_write
      00B03B E6 02                    1 	.word LINK 
                           003376     2 	LINK=.
      003376                          3 SPIWR:
      00B03D C7                       4 	.byte 5   	
      00B03E 00 0F 72 5F 00           5 	.ascii "SPIWR"
      00B043 0E 72                    6 	.word spi_write  
      00337E                       5075 	_dict_entry,6,SPISEL,spi_select
      00B045 BB 00                    1 	.word LINK 
                           003380     2 	LINK=.
      003380                          3 SPISEL:
      00B047 0E                       4 	.byte 6   	
      00B048 C3 00 1E 25 02 20        5 	.ascii "SPISEL"
      00B04E 0E D2                    6 	.word spi_select  
      00B04F                       5076 	_dict_entry,5+F_IFUNC,SPIRD,spi_read 
      00B04F CD AF                    1 	.word LINK 
                           00338B     2 	LINK=.
      00338B                          3 SPIRD:
      00B051 E7                       4 	.byte 5+F_IFUNC   	
      00B052 27 04 A6 01 20           5 	.ascii "SPIRD"
      00B057 04 CD                    6 	.word spi_read  
      003393                       5077 	_dict_entry,5,SPIEN,spi_enable 
      00B059 B0 2E                    1 	.word LINK 
                           003395     2 	LINK=.
      003395                          3 SPIEN:
      00B05B 4F                       4 	.byte 5   	
      00B05C 81 50 49 45 4E           5 	.ascii "SPIEN"
      00B05D 30 33                    6 	.word spi_enable  
      00339D                       5078 	_dict_entry,5,SLEEP,sleep 
      00B05D A6 0C                    1 	.word LINK 
                           00339F     2 	LINK=.
      00339F                          3 SLEEP:
      00B05F CC                       4 	.byte 5   	
      00B060 97 59 45 45 50           5 	.ascii "SLEEP"
      00B062 2B 7A                    6 	.word sleep  
      0033A7                       5079     _dict_entry,4,SIZE,cmd_size 
      00B062 CD 9A                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



                           0033A9     2 	LINK=.
      0033A9                          3 SIZE:
      00B064 7C                       4 	.byte 4   	
      00B065 52 07 CD A1              5 	.ascii "SIZE"
      00B069 49 FB                    6 	.word cmd_size  
      00B06A                       5080 	_dict_entry,4,SAVE,cmd_save 
      00B06A C6 00                    1 	.word LINK 
                           0033B2     2 	LINK=.
      0033B2                          3 SAVE:
      00B06C 09                       4 	.byte 4   	
      00B06D C1 00 0A 27              5 	.ascii "SAVE"
      00B071 37 45                    6 	.word cmd_save  
      00B072                       5081 	_dict_entry 3,RUN,cmd_run
      00B072 CE 00                    1 	.word LINK 
                           0033BB     2 	LINK=.
      0033BB                          3 RUN:
      00B074 07                       4 	.byte 3   	
      00B075 CF 00 05                 5 	.ascii "RUN"
      00B078 55 00                    6 	.word cmd_run  
      0033C1                       5082 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00B07A 09 00                    1 	.word LINK 
                           0033C3     2 	LINK=.
      0033C3                          3 RSHIFT:
      00B07C 02                       4 	.byte 6+F_IFUNC   	
      00B07D 55 00 0A 00 03 CD        5 	.ascii "RSHIFT"
      00B083 9B DB                    6 	.word rshift  
      0033CC                       5083 	_dict_entry,3+F_IFUNC,RND,random 
      00B085 A1 84                    1 	.word LINK 
                           0033CE     2 	LINK=.
      0033CE                          3 RND:
      00B087 27                       4 	.byte 3+F_IFUNC   	
      00B088 03 CC 97                 5 	.ascii "RND"
      00B08B 57 0B                    6 	.word random  
      00B08C                       5084 	_dict_entry,6,RETURN,return 
      00B08C CD 98                    1 	.word LINK 
                           0033D6     2 	LINK=.
      0033D6                          3 RETURN:
      00B08E BE                       4 	.byte 6   	
      00B08F CE 00 05 CF 00 07        5 	.ascii "RETURN"
      00B095 55 00                    6 	.word return  
      0033DF                       5085 	_dict_entry,7,RESTORE,restore 
      00B097 02 00                    1 	.word LINK 
                           0033E1     2 	LINK=.
      0033E1                          3 RESTORE:
      00B099 09                       4 	.byte 7   	
      00B09A CD A1 59 90 F6 93 EE     5 	.ascii "RESTORE"
      00B0A1 01 72                    6 	.word restore  
      0033EB                       5086 	_dict_entry 3,REM,remark 
      00B0A3 A9 00                    1 	.word LINK 
                           0033ED     2 	LINK=.
      0033ED                          3 REM:
      00B0A5 03                       4 	.byte 3   	
      00B0A6 5B 07 81                 5 	.ascii "REM"
      00B0A9 21 88                    6 	.word remark  
      0033F3                       5087 	_dict_entry,6,REBOOT,cold_start
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



      00B0A9 CE 00                    1 	.word LINK 
                           0033F5     2 	LINK=.
      0033F5                          3 REBOOT:
      00B0AB 07                       4 	.byte 6   	
      00B0AC CD B0 3B 27 C1 20        5 	.ascii "REBOOT"
      00B0B2 AA B5                    6 	.word cold_start  
      00B0B3                       5088 	_dict_entry,4+F_IFUNC,READ,read  
      00B0B3 CD 9A                    1 	.word LINK 
                           003400     2 	LINK=.
      003400                          3 READ:
      00B0B5 99                       4 	.byte 4+F_IFUNC   	
      00B0B6 A1 02 27 03              5 	.ascii "READ"
      00B0BA CC 97                    6 	.word read  
      003407                       5089 	_dict_entry,4+F_IFUNC,QKEY,qkey
      00B0BC 57 00                    1 	.word LINK 
                           003409     2 	LINK=.
      00B0BD                          3 QKEY:
      00B0BD 72                       4 	.byte 4+F_IFUNC   	
      00B0BE 12 50 C7 85              5 	.ascii "QKEY"
      00B0C2 5D 27                    6 	.word qkey  
      003410                       5090 	_dict_entry,3,PUT,xput 
      00B0C4 21 85                    1 	.word LINK 
                           003412     2 	LINK=.
      003412                          3 PUT:
      00B0C6 A6                       4 	.byte 3   	
      00B0C7 08 42 9F                 5 	.ascii "PUT"
      00B0CA C7 52                    6 	.word xput  
      003418                       5091 	_dict_entry,4,PUSH,xpush   
      00B0CC 00 72                    1 	.word LINK 
                           00341A     2 	LINK=.
      00341A                          3 PUSH:
      00B0CE 1A                       4 	.byte 4   	
      00B0CF 50 14 72 1A              5 	.ascii "PUSH"
      00B0D3 50 16                    6 	.word xpush  
      003421                       5092 	_dict_entry,5+F_IFUNC,PORTI,const_porti 
      00B0D5 72 14                    1 	.word LINK 
                           003423     2 	LINK=.
      003423                          3 PORTI:
      00B0D7 52                       4 	.byte 5+F_IFUNC   	
      00B0D8 00 72 12 52 01           5 	.ascii "PORTI"
      00B0DD 72 10                    6 	.word const_porti  
      00342B                       5093 	_dict_entry,5+F_IFUNC,PORTG,const_portg 
      00B0DF 52 01                    1 	.word LINK 
                           00342D     2 	LINK=.
      00342D                          3 PORTG:
      00B0E1 72                       4 	.byte 5+F_IFUNC   	
      00B0E2 1C 52 00 81 47           5 	.ascii "PORTG"
      00B0E6 2F 2F                    6 	.word const_portg  
      003435                       5094 	_dict_entry,5+F_IFUNC,PORTF,const_portf
      00B0E6 5B 02                    1 	.word LINK 
                           003437     2 	LINK=.
      003437                          3 PORTF:
      00B0E8 A6                       4 	.byte 5+F_IFUNC   	
      00B0E9 82 C4 52 03 A1           5 	.ascii "PORTF"
      00B0EE 02 26                    6 	.word const_portf  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



      00343F                       5095 	_dict_entry,5+F_IFUNC,PORTE,const_porte
      00B0F0 F7 72                    1 	.word LINK 
                           003441     2 	LINK=.
      003441                          3 PORTE:
      00B0F2 1D                       4 	.byte 5+F_IFUNC   	
      00B0F3 52 00 72 13 50           5 	.ascii "PORTE"
      00B0F8 C7 72                    6 	.word const_porte  
      003449                       5096 	_dict_entry,5+F_IFUNC,PORTD,const_portd
      00B0FA 1B 50                    1 	.word LINK 
                           00344B     2 	LINK=.
      00344B                          3 PORTD:
      00B0FC 16                       4 	.byte 5+F_IFUNC   	
      00B0FD 81 4F 52 54 44           5 	.ascii "PORTD"
      00B0FE 2F 20                    6 	.word const_portd  
      003453                       5097 	_dict_entry,5+F_IFUNC,PORTC,const_portc
      00B0FE A6 78                    1 	.word LINK 
                           003455     2 	LINK=.
      003455                          3 PORTC:
      00B100 C5                       4 	.byte 5+F_IFUNC   	
      00B101 52 03 27 04 72           5 	.ascii "PORTC"
      00B106 5F 52                    6 	.word const_portc  
      00345D                       5098 	_dict_entry,5+F_IFUNC,PORTB,const_portb
      00B108 03 81                    1 	.word LINK 
                           00345F     2 	LINK=.
      00B10A                          3 PORTB:
      00B10A 88                       4 	.byte 5+F_IFUNC   	
      00B10B CD B0 FE 84 72           5 	.ascii "PORTB"
      00B110 03 52                    6 	.word const_portb  
      003467                       5099 	_dict_entry,5+F_IFUNC,PORTA,const_porta 
      00B112 03 FB                    1 	.word LINK 
                           003469     2 	LINK=.
      003469                          3 PORTA:
      00B114 C7                       4 	.byte 5+F_IFUNC   	
      00B115 52 04 72 01 52           5 	.ascii "PORTA"
      00B11A 03 FB                    6 	.word const_porta  
      003471                       5100 	_dict_entry 5,PRINT,print 
      00B11C C6 52                    1 	.word LINK 
                           003473     2 	LINK=.
      003473                          3 PRINT:
      00B11E 04                       4 	.byte 5   	
      00B11F 81 52 49 4E 54           5 	.ascii "PRINT"
      00B120 20 4D                    6 	.word print  
      00347B                       5101 	_dict_entry,4+F_IFUNC,POUT,const_output
      00B120 A6 FF                    1 	.word LINK 
                           00347D     2 	LINK=.
      00347D                          3 POUT:
      00B122 72                       4 	.byte 4+F_IFUNC   	
      00B123 01 52 03 E3              5 	.ascii "POUT"
      00B127 C6 52                    6 	.word const_output  
      003484                       5102 	_dict_entry,3+F_IFUNC,POP,xpop 
      00B129 04 81                    1 	.word LINK 
                           003486     2 	LINK=.
      00B12B                          3 POP:
      00B12B CD                       4 	.byte 3+F_IFUNC   	
      00B12C 9B DB A1                 5 	.ascii "POP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



      00B12F 84 27                    6 	.word xpop  
      00348C                       5103 	_dict_entry,4,POKE,poke 
      00B131 03 CC                    1 	.word LINK 
                           00348E     2 	LINK=.
      00348E                          3 POKE:
      00B133 97                       4 	.byte 4   	
      00B134 57 4F 4B 45              5 	.ascii "POKE"
      00B135 22 69                    6 	.word poke  
      003495                       5104 	_dict_entry,5,PMODE,pin_mode 
      00B135 9F CD                    1 	.word LINK 
                           003497     2 	LINK=.
      003497                          3 PMODE:
      00B137 B1                       4 	.byte 5   	
      00B138 0A CD 98 BE A1           5 	.ascii "PMODE"
      00B13D 08 26                    6 	.word pin_mode  
      00349F                       5105 	_dict_entry,4+F_IFUNC,PINP,const_input
      00B13F 02 20                    1 	.word LINK 
                           0034A1     2 	LINK=.
      0034A1                          3 PINP:
      00B141 E9                       4 	.byte 4+F_IFUNC   	
      00B142 4D 27 05 55              5 	.ascii "PINP"
      00B146 00 04                    6 	.word const_input  
      0034A8                       5106 	_dict_entry,4+F_IFUNC,PICK,xpick 
      00B148 00 02                    1 	.word LINK 
                           0034AA     2 	LINK=.
      0034AA                          3 PICK:
      00B14A 81                       4 	.byte 4+F_IFUNC   	
      00B14B 50 49 43 4B              5 	.ascii "PICK"
      00B14B CD B1                    6 	.word xpick  
      0034B1                       5107 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00B14D 20 5F                    1 	.word LINK 
                           0034B3     2 	LINK=.
      0034B3                          3 PEEK:
      00B14F 97                       4 	.byte 4+F_IFUNC   	
      00B150 4F 81 45 4B              5 	.ascii "PEEK"
      00B152 22 8A                    6 	.word peek  
      0034BA                       5108 	_dict_entry,5,PAUSE,pause 
      00B152 CD 98                    1 	.word LINK 
                           0034BC     2 	LINK=.
      0034BC                          3 PAUSE:
      00B154 BE                       4 	.byte 5   	
      00B155 A1 84 27 03 CC           5 	.ascii "PAUSE"
      00B15A 97 57                    6 	.word pause  
      0034C4                       5109 	_dict_entry,3+F_IFUNC,PAD,pad_ref 
      00B15C 5D 27                    1 	.word LINK 
                           0034C6     2 	LINK=.
      0034C6                          3 PAD:
      00B15E 05                       4 	.byte 3+F_IFUNC   	
      00B15F 72 1B 50                 5 	.ascii "PAD"
      00B162 14 81                    6 	.word pad_ref  
      00B164                       5110 	_dict_entry,2+F_OR,OR,TK_OR ; OR operator 
      00B164 72 1A                    1 	.word LINK 
                           0034CE     2 	LINK=.
      0034CE                          3 OR:
      00B166 50                       4 	.byte 2+F_OR   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal [24-Bits]



      00B167 14 81                    5 	.ascii "OR"
      00B169 00 89                    6 	.word TK_OR  
      0034D3                       5111 	_dict_entry,2,ON,cmd_on 
      00B169 AE 16                    1 	.word LINK 
                           0034D5     2 	LINK=.
      0034D5                          3 ON:
      00B16B B8                       4 	.byte 2   	
      00B16C 4F 81                    5 	.ascii "ON"
      00B16E 24 67                    6 	.word cmd_on  
      0034DA                       5112 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00B16E CD 9C                    1 	.word LINK 
                           0034DC     2 	LINK=.
      0034DC                          3 ODR:
      00B170 F4                       4 	.byte 3+F_IFUNC   	
      00B171 81 44 52                 5 	.ascii "ODR"
      00B172 2F 39                    6 	.word const_odr  
      0034E2                       5113 	_dict_entry,3+F_NOT,NOT,TK_NOT;NOT operator
      00B172 90 F6                    1 	.word LINK 
                           0034E4     2 	LINK=.
      0034E4                          3 NOT:
      00B174 93                       4 	.byte 3+F_NOT   	
      00B175 EE 01 72                 5 	.ascii "NOT"
      00B178 A9 00                    6 	.word TK_NOT  
      0034EA                       5114 	_dict_entry,4,NEXT,next 
      00B17A 03 81                    1 	.word LINK 
                           0034EC     2 	LINK=.
      00B17C                          3 NEXT:
      00B17C CD                       4 	.byte 4   	
      00B17D 9B DB A1 84              5 	.ascii "NEXT"
      00B181 27 03                    6 	.word next  
      0034F3                       5115 	_dict_entry,3,NEW,new
      00B183 CC 97                    1 	.word LINK 
                           0034F5     2 	LINK=.
      0034F5                          3 NEW:
      00B185 57                       4 	.byte 3   	
      00B186 90 F6 93                 5 	.ascii "NEW"
      00B189 EE 01                    6 	.word new  
      0034FB                       5116 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00B18B 72 A9                    1 	.word LINK 
                           0034FD     2 	LINK=.
      0034FD                          3 LSHIFT:
      00B18D 00                       4 	.byte 6+F_IFUNC   	
      00B18E 03 4D 27 05 A6 0A        5 	.ascii "LSHIFT"
      00B194 CC 97                    6 	.word lshift  
      003506                       5117 	_dict_entry,4+F_IFUNC,LOG2,log2 
      00B196 59 A3                    1 	.word LINK 
                           003508     2 	LINK=.
      003508                          3 LOG2:
      00B198 00                       4 	.byte 4+F_IFUNC   	
      00B199 14 22 F6 A6              5 	.ascii "LOG2"
      00B19D 03 42                    6 	.word log2  
      00350F                       5118 	_dict_entry 4,LIST,cmd_list
      00B19F CF 00                    1 	.word LINK 
                           003511     2 	LINK=.
      003511                          3 LIST:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 227.
Hexadecimal [24-Bits]



      00B1A1 0E                       4 	.byte 4   	
      00B1A2 72 B2 00 0E              5 	.ascii "LIST"
      00B1A6 90 A3                    6 	.word cmd_list  
      003518                       5119 	_dict_entry 3,LET,let 
      00B1A8 17 38                    1 	.word LINK 
                           00351A     2 	LINK=.
      00351A                          3 LET:
      00B1AA 22                       4 	.byte 3   	
      00B1AB 05 A6 01                 5 	.ascii "LET"
      00B1AE CC 97                    6 	.word let  
      003520                       5120 	_dict_entry,3+F_CFUNC,KEY,key 
      00B1B0 59 1A                    1 	.word LINK 
                           003522     2 	LINK=.
      00B1B1                          3 KEY:
      00B1B1 81                       4 	.byte 3+F_CFUNC   	
      00B1B2 4B 45 59                 5 	.ascii "KEY"
      00B1B2 CD 9B                    6 	.word key  
      003528                       5121 	_dict_entry,7,IWDGREF,refresh_iwdg
      00B1B4 DB A1                    1 	.word LINK 
                           00352A     2 	LINK=.
      00352A                          3 IWDGREF:
      00B1B6 84                       4 	.byte 7   	
      00B1B7 27 03 CC 97 57 90 F6     5 	.ascii "IWDGREF"
      00B1BE 93 EE                    6 	.word refresh_iwdg  
      003534                       5122 	_dict_entry,6,IWDGEN,enable_iwdg
      00B1C0 01 72                    1 	.word LINK 
                           003536     2 	LINK=.
      003536                          3 IWDGEN:
      00B1C2 A9                       4 	.byte 6   	
      00B1C3 00 03 9F A4 1F 5F        5 	.ascii "IWDGEN"
      00B1C9 97 A6                    6 	.word enable_iwdg  
      00353F                       5123 	_dict_entry,5,INPUT,input_var  
      00B1CB 03 42                    1 	.word LINK 
                           003541     2 	LINK=.
      003541                          3 INPUT:
      00B1CD CF                       4 	.byte 5   	
      00B1CE 00 0E 72 B9 00           5 	.ascii "INPUT"
      00B1D3 0E 90                    6 	.word input_var  
      003549                       5124 	_dict_entry,2,IF,if 
      00B1D5 A3 17                    1 	.word LINK 
                           00354B     2 	LINK=.
      00354B                          3 IF:
      00B1D7 73                       4 	.byte 2   	
      00B1D8 23 04                    5 	.ascii "IF"
      00B1DA 90 AE                    6 	.word if  
      003550                       5125 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00B1DC 17 73                    1 	.word LINK 
                           003552     2 	LINK=.
      003552                          3 IDR:
      00B1DE 81                       4 	.byte 3+F_IFUNC   	
      00B1DF 49 44 52                 5 	.ascii "IDR"
      00B1DF 4D 26                    6 	.word const_idr  
      003558                       5126 	_dict_entry,3,HEX,hex_base
      00B1E1 16 A3                    1 	.word LINK 
                           00355A     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
Hexadecimal [24-Bits]



      00355A                          3 HEX:
      00B1E3 00                       4 	.byte 3   	
      00B1E4 14 22 11                 5 	.ascii "HEX"
      00B1E7 A6 03                    6 	.word hex_base  
      003560                       5127 	_dict_entry,4,GOTO,goto 
      00B1E9 42 CF                    1 	.word LINK 
                           003562     2 	LINK=.
      003562                          3 GOTO:
      00B1EB 00                       4 	.byte 4   	
      00B1EC 0E 93 72 BB              5 	.ascii "GOTO"
      00B1F0 00 0E                    6 	.word goto  
      003569                       5128 	_dict_entry,5,GOSUB,gosub 
      00B1F2 A3 17                    1 	.word LINK 
                           00356B     2 	LINK=.
      00356B                          3 GOSUB:
      00B1F4 73                       4 	.byte 5   	
      00B1F5 24 01 81 A6 0A           5 	.ascii "GOSUB"
      00B1FA CC 97                    6 	.word gosub  
      003573                       5129 	_dict_entry,3,GET,cmd_get 
      00B1FC 59 6B                    1 	.word LINK 
                           003575     2 	LINK=.
      00B1FD                          3 GET:
      00B1FD CD                       4 	.byte 3   	
      00B1FE 9A 99 A1                 5 	.ascii "GET"
      00B201 02 27                    6 	.word cmd_get  
      00357B                       5130 	_dict_entry,4+F_IFUNC,FREE,free
      00B203 03 CC                    1 	.word LINK 
                           00357D     2 	LINK=.
      00357D                          3 FREE:
      00B205 97                       4 	.byte 4+F_IFUNC   	
      00B206 57 90 F6 93              5 	.ascii "FREE"
      00B20A EE 01                    6 	.word free  
      003584                       5131 	_dict_entry,3,FOR,for 
      00B20C 72 A9                    1 	.word LINK 
                           003586     2 	LINK=.
      003586                          3 FOR:
      00B20E 00                       4 	.byte 3   	
      00B20F 03 89 88                 5 	.ascii "FOR"
      00B212 90 F6                    6 	.word for  
      00358C                       5132 	_dict_entry,4,FCPU,fcpu 
      00B214 93 EE                    1 	.word LINK 
                           00358E     2 	LINK=.
      00358E                          3 FCPU:
      00B216 01                       4 	.byte 4   	
      00B217 72 A9 00 03              5 	.ascii "FCPU"
      00B21B CD B1                    6 	.word fcpu  
      003595                       5133 	_dict_entry,5,ERASE,cmd_erase 
      00B21D DF CF                    1 	.word LINK 
                           003597     2 	LINK=.
      003597                          3 ERASE:
      00B21F 00                       4 	.byte 5   	
      00B220 1A 84 85 72 C7           5 	.ascii "ERASE"
      00B225 00 1A                    6 	.word cmd_erase  
      00359F                       5134 	_dict_entry,3,END,cmd_end  
      00B227 72 5C                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



                           0035A1     2 	LINK=.
      0035A1                          3 END:
      00B229 00                       4 	.byte 3   	
      00B22A 1B 72 CF                 5 	.ascii "END"
      00B22D 00 1A                    6 	.word cmd_end  
      0035A7                       5135 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00B22F 81 A1                    1 	.word LINK 
                           0035A9     2 	LINK=.
      00B230                          3 EEPROM:
      00B230 CD                       4 	.byte 6+F_IFUNC   	
      00B231 9A 94 A1 01 27 03        5 	.ascii "EEPROM"
      00B237 CC 97                    6 	.word const_eeprom_base  
      0035B2                       5136 	_dict_entry,6+F_IFUNC,EEFREE,func_eefree 
      00B239 57 90                    1 	.word LINK 
                           0035B4     2 	LINK=.
      0035B4                          3 EEFREE:
      00B23B F6                       4 	.byte 6+F_IFUNC   	
      00B23C 93 EE 01 72 A9 00        5 	.ascii "EEFREE"
      00B242 03 CD                    6 	.word func_eefree  
      0035BD                       5137 	_dict_entry,4,EDIT,cmd_edit 
      00B244 B1 DF                    1 	.word LINK 
                           0035BF     2 	LINK=.
      0035BF                          3 EDIT:
      00B246 F6                       4 	.byte 4   	
      00B247 EE 01 81 54              5 	.ascii "EDIT"
      00B24A 1F E8                    6 	.word cmd_edit  
      0035C6                       5138 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00B24A CD 9A                    1 	.word LINK 
                           0035C8     2 	LINK=.
      0035C8                          3 DWRITE:
      00B24C 71                       4 	.byte 6+F_CMD   	
      00B24D CD 98 BE A1 03 27        5 	.ascii "DWRITE"
      00B253 19 A1                    6 	.word digital_write  
      0035D1                       5139 	_dict_entry,4,DROP,xdrop ; drop n element from xtack 
      00B255 04 26                    1 	.word LINK 
                           0035D3     2 	LINK=.
      0035D3                          3 DROP:
      00B257 12                       4 	.byte 4   	
      00B258 F6 72 5C 00              5 	.ascii "DROP"
      00B25C 02 A4                    6 	.word xdrop  
      0035DA                       5140 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00B25E DF A1                    1 	.word LINK 
                           0035DC     2 	LINK=.
      0035DC                          3 DREAD:
      00B260 43                       4 	.byte 5+F_IFUNC   	
      00B261 26 07 AE 40 00           5 	.ascii "DREAD"
      00B266 CD A9                    6 	.word digital_read  
      0035E4                       5141 	_dict_entry,2,DO,do_loop
      00B268 AB 81                    1 	.word LINK 
                           0035E6     2 	LINK=.
      0035E6                          3 DO:
      00B26A CC                       4 	.byte 2   	
      00B26B 97 57                    5 	.ascii "DO"
      00B26D 89 CD                    6 	.word do_loop  
      0035EB                       5142 	_dict_entry,3,DIR,cmd_dir
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
Hexadecimal [24-Bits]



      00B26F 98 D7                    1 	.word LINK 
                           0035ED     2 	LINK=.
      0035ED                          3 DIR:
      00B271 85                       4 	.byte 3   	
      00B272 CD B2 A3                 5 	.ascii "DIR"
      00B275 26 05                    6 	.word cmd_dir  
      0035F3                       5143 	_dict_entry,3,DIM,cmd_dim 
      00B277 A6 0A                    1 	.word LINK 
                           0035F5     2 	LINK=.
      0035F5                          3 DIM:
      00B279 CC                       4 	.byte 3   	
      00B27A 97 59 89                 5 	.ascii "DIM"
      00B27D 72 5F                    6 	.word cmd_dim  
      0035FB                       5144 	_dict_entry,3,DEC,dec_base
      00B27F 00 19                    1 	.word LINK 
                           0035FD     2 	LINK=.
      0035FD                          3 DEC:
      00B281 AE                       4 	.byte 3   	
      00B282 40 00 CF                 5 	.ascii "DEC"
      00B285 00 1A                    6 	.word dec_base  
      003603                       5145 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00B287 C6 B2                    1 	.word LINK 
                           003605     2 	LINK=.
      003605                          3 DDR:
      00B289 A1                       4 	.byte 3+F_IFUNC   	
      00B28A 5F CD 88                 5 	.ascii "DDR"
      00B28D 53 C6                    6 	.word const_ddr  
      00360B                       5146 	_dict_entry,4,DATA,data  
      00B28F B2 A2                    1 	.word LINK 
                           00360D     2 	LINK=.
      00360D                          3 DATA:
      00B291 CD                       4 	.byte 4   	
      00B292 88 53 7B 01              5 	.ascii "DATA"
      00B296 CD 88                    6 	.word data  
      003614                       5147 	_dict_entry,3+F_IFUNC,CR2,const_cr2 
      00B298 53 7B                    1 	.word LINK 
                           003616     2 	LINK=.
      003616                          3 CR2:
      00B29A 02                       4 	.byte 3+F_IFUNC   	
      00B29B CD 88 53                 5 	.ascii "CR2"
      00B29E 5B 02                    6 	.word const_cr2  
      00361C                       5148 	_dict_entry,3+F_IFUNC,CR1,const_cr1 
      00B2A0 81 41                    1 	.word LINK 
                           00361E     2 	LINK=.
      00361E                          3 CR1:
      00B2A2 52                       4 	.byte 3+F_IFUNC   	
      00B2A3 43 52 31                 5 	.ascii "CR1"
      00B2A3 90 89                    6 	.word const_cr1  
      003624                       5149 	_dict_entry,5,CONST,cmd_const 
      00B2A5 52 06                    1 	.word LINK 
                           003626     2 	LINK=.
      003626                          3 CONST:
      00B2A7 1F                       4 	.byte 5   	
      00B2A8 03 CD AB A9 1F           5 	.ascii "CONST"
      00B2AD 05 AE                    6 	.word cmd_const  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 231.
Hexadecimal [24-Bits]



      00362E                       5150 	_dict_entry,4+F_CFUNC,CHAR,func_char
      00B2AF B9 00                    1 	.word LINK 
                           003630     2 	LINK=.
      003630                          3 CHAR:
      00B2B1 1F                       4 	.byte 4+F_CFUNC   	
      00B2B2 01 4F CD A5              5 	.ascii "CHAR"
      00B2B6 B7 26                    6 	.word func_char  
      003637                       5151 	_dict_entry,5,CHAIN,cmd_chain
      00B2B8 10 1C                    1 	.word LINK 
                           003639     2 	LINK=.
      003639                          3 CHAIN:
      00B2BA 00                       4 	.byte 5   	
      00B2BB 07 F6 A1 03 26           5 	.ascii "CHAIN"
      00B2C0 08 5C                    6 	.word cmd_chain  
      003641                       5152 	_dict_entry,3,BYE,bye 
      00B2C2 16 03                    1 	.word LINK 
                           003643     2 	LINK=.
      003643                          3 BYE:
      00B2C4 CD                       4 	.byte 3   	
      00B2C5 94 5E 26                 5 	.ascii "BYE"
      00B2C8 0A 71                    6 	.word bye  
      00B2C9                       5153 	_dict_entry,5,BTOGL,bit_toggle
      00B2C9 CD AA                    1 	.word LINK 
                           00364B     2 	LINK=.
      00364B                          3 BTOGL:
      00B2CB 72                       4 	.byte 5   	
      00B2CC 13 05 25 E1 5F           5 	.ascii "BTOGL"
      00B2D1 20 05                    6 	.word bit_toggle  
      00B2D3                       5154 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00B2D3 1E 01                    1 	.word LINK 
                           003655     2 	LINK=.
      003655                          3 BTEST:
      00B2D5 1C                       4 	.byte 5+F_IFUNC   	
      00B2D6 00 04 45 53 54           5 	.ascii "BTEST"
      00B2D8 22 32                    6 	.word bit_test  
      00365D                       5155 	_dict_entry,4,BSET,bit_set 
      00B2D8 5B 06                    1 	.word LINK 
                           00365F     2 	LINK=.
      00365F                          3 BSET:
      00B2DA 90                       4 	.byte 4   	
      00B2DB 85 81 45 54              5 	.ascii "BSET"
      00B2DD 21 CB                    6 	.word bit_set  
      003666                       5156 	_dict_entry,4,BRES,bit_reset
      00B2DD 85 52                    1 	.word LINK 
                           003668     2 	LINK=.
      003668                          3 BRES:
      00B2DF 0C                       4 	.byte 4   	
      00B2E0 89 0F 03 0F              5 	.ascii "BRES"
      00B2E4 04 A6                    6 	.word bit_reset  
      00366F                       5157 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00B2E6 03 CD                    1 	.word LINK 
                           003671     2 	LINK=.
      003671                          3 BIT:
      00B2E8 9A                       4 	.byte 3+F_IFUNC   	
      00B2E9 87 89 CD                 5 	.ascii "BIT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
Hexadecimal [24-Bits]



      00B2EC 98 D7                    6 	.word bitmask  
      003677                       5158 	_dict_entry,3,AWU,awu 
      00B2EE 85 CD                    1 	.word LINK 
                           003679     2 	LINK=.
      003679                          3 AWU:
      00B2F0 B2                       4 	.byte 3   	
      00B2F1 A3 5D 26                 5 	.ascii "AWU"
      00B2F4 05 A6                    6 	.word awu  
      00367F                       5159 	_dict_entry,7,AUTORUN,cmd_auto_run
      00B2F6 0A CC                    1 	.word LINK 
                           003681     2 	LINK=.
      003681                          3 AUTORUN:
      00B2F8 97                       4 	.byte 7   	
      00B2F9 59 1F 05 CD 98 BE A1     5 	.ascii "AUTORUN"
      00B300 08 26                    6 	.word cmd_auto_run  
      00368B                       5160 	_dict_entry,3+F_IFUNC,ASC,ascii
      00B302 0C A6                    1 	.word LINK 
                           00368D     2 	LINK=.
      00368D                          3 ASC:
      00B304 84                       4 	.byte 3+F_IFUNC   	
      00B305 CD 9A 87                 5 	.ascii "ASC"
      00B308 CD 98                    6 	.word ascii  
      003693                       5161 	_dict_entry,3+F_AND,AND,TK_AND ; AND operator 
      00B30A F0 1F                    1 	.word LINK 
                           003695     2 	LINK=.
      003695                          3 AND:
      00B30C 03                       4 	.byte 3+F_AND   	
      00B30D 20 05 55                 5 	.ascii "AND"
      00B310 00 04                    6 	.word TK_AND  
      00369B                       5162 	_dict_entry,5,ALLOC,xalloc ; allocate space on xtack 
      00B312 00 02                    1 	.word LINK 
                           00369D     2 	LINK=.
      00B314                          3 ALLOC:
      00B314 CE                       4 	.byte 5   	
      00B315 00 05 1F 07 CE           5 	.ascii "ALLOC"
      00B31A 00 02                    6 	.word xalloc  
      0036A5                       5163 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00B31C 1F 09                    1 	.word LINK 
                           0036A7     2 	LINK=.
      0036A7                          3 ADCREAD:
      00B31E CE                       4 	.byte 7+F_IFUNC   	
      00B31F 00 1C 1F 0B CE 00 1E     5 	.ascii "ADCREAD"
      00B326 1F 0D                    6 	.word analog_read  
      0036B1                       5164 	_dict_entry,5,ADCON,power_adc 
      00B328 1E 05                    1 	.word LINK 
                           0036B3     2 	LINK=.
      0036B3                          3 ADCON:
      00B32A CF                       4 	.byte 5   	
      00B32B 00 05 CF 00 1C           5 	.ascii "ADCON"
      00B330 1D 00                    6 	.word power_adc  
      0036BB                       5165 kword_dict::
      0036BB                       5166 	_dict_entry,3+F_IFUNC,ABS,abs
      00B332 02 FE                    1 	.word LINK 
                           0036BD     2 	LINK=.
      0036BD                          3 ABS:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 233.
Hexadecimal [24-Bits]



      00B334 72                       4 	.byte 3+F_IFUNC   	
      00B335 FB 05 CF                 5 	.ascii "ABS"
      00B338 00 1E                    6 	.word abs  
                                   5167 
                                   5168 
                                   5169 
                                   5170 
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
      0036C3                         30 test:
      0036C3                         31     _vars VSIZE 
      00B33A 1E 05            [ 2]    1     sub sp,#VSIZE 
      00B33C E6 02 C7         [ 2]   32     ldw x,#LOOP_CNT
      00B33F 00 03            [ 2]   33     ldw (CNTR,sp),x  
      00B341 35 03 00         [ 2]   34     ldw x,ticks 
      00B344 02 1E            [ 2]   35     ldw (T,sp),x
      0036CF                         36 1$: ; test add24 
      00B346 03 5D            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00B348 27 13 90         [ 2]   38     ldw x,#VAL1&0XFFFF
      00B34B 89 4F CD         [ 1]   39     ld acc24,a 
      00B34E 8D 0D 90         [ 2]   40     ldw acc24+1,x  
      00B351 85 5D            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00B353 27 A0 CF         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00B356 00 05 E6         [ 4]   43     call add24 
      00B359 02 C7            [ 2]   44     ldw x,(CNTR,sp)
      00B35B 00 03 72         [ 2]   45     subw x,#1
      00B35E 5C 00            [ 2]   46     ldw (CNTR,sp),x 
      00B360 34 85            [ 1]   47     jrne 1$
      00B362 5B 04 FC         [ 4]   48     call prt_acc24
      00B365 A6 20            [ 1]   49     ld a,#SPACE 
      00B365 00 00 47         [ 4]   50     call putc 
      00B367 CE 00 0F         [ 2]   51     ldw x,ticks 
      00B367 A3 58 4F         [ 2]   52     subw x,(T,sp)
      00B36A 52 00 8A         [ 4]   53     call prt_i16  
      00B36D B3 67            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
Hexadecimal [24-Bits]



      00B36F CD 09 47         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00B36F 05 57 52         [ 2]   58     ldw x,LOOP_CNT
      00B372 49 54            [ 2]   59     ldw (CNTR,sp),x 
      00B374 45 AA D9         [ 2]   60     ldw x,ticks 
      00B377 B3 6F            [ 2]   61     ldw (T,sp),x 
      00B379                         62 2$: 
      00B379 05 57            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00B37B 4F 52 44         [ 2]   64     ldw x,#VAL1&0XFFFF
      00B37E 53 AE 26         [ 1]   65     ld acc24,a 
      00B381 B3 79 0D         [ 2]   66     ldw acc24+1,x  
      00B383 A6 00            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00B383 04 57 41         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00B386 49 54 A2         [ 4]   69     call mul24 
      00B389 0E B3            [ 2]   70     ldw x,(CNTR,sp)
      00B38B 83 00 01         [ 2]   71     subw x,#1
      00B38C 1F 03            [ 2]   72     ldw (CNTR,sp),x 
      00B38C 13 55            [ 1]   73     jrne 2$ 
      00B38E 53 52 AB         [ 4]   74    call prt_acc24 
      00B391 CB B3            [ 1]   75    ld a,#SPACE 
      00B393 8C 09 47         [ 4]   76    call putc 
      00B394 CE 00 0F         [ 2]   77     ldw x,ticks 
      00B394 05 55 4E         [ 2]   78     subw x,(T,sp)
      00B397 54 49 4C         [ 4]   79     call prt_i16 
      00B39A AF 5E            [ 1]   80     ld a,#CR 
      00B39C B3 94 47         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00B39E CE 27 10         [ 2]   83     ldw x,LOOP_CNT
      00B39E 16 55            [ 2]   84     ldw (CNTR,sp),x 
      00B3A0 46 4C 41         [ 2]   85     ldw x,ticks 
      00B3A3 53 48            [ 2]   86     ldw (T,sp),x 
      003747                         87 3$: 
      00B3A5 AB A9            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00B3A7 B3 9E FF         [ 2]   89     ldw x,#VAL1&0XFFFF
      00B3A9 C7 00 0C         [ 1]   90     ld acc24,a 
      00B3A9 16 55 42         [ 2]   91     ldw acc24+1,x  
      00B3AC 4F 55            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00B3AE 4E 44 9D         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00B3B1 A8 B3 A9         [ 4]   94     call mul24 
      00B3B4 1E 03            [ 2]   95     ldw x,(CNTR,sp)
      00B3B4 04 54 4F         [ 2]   96     subw x,#1
      00B3B7 4E 45            [ 2]   97     ldw (CNTR,sp),x 
      00B3B9 A6 BC            [ 1]   98     jrne 3$ 
      00B3BB B3 B4 9D         [ 4]   99     call prt_acc24    
      00B3BD A6 20            [ 1]  100     ld a,#SPACE 
      00B3BD 02 54 4F         [ 4]  101     call putc 
      00B3C0 A3 78 B3         [ 2]  102     ldw x,ticks 
      00B3C3 BD F0 01         [ 2]  103     subw x,(T,sp)
      00B3C4 CD 18 86         [ 4]  104     call prt_i16 
      00B3C4 05 54            [ 1]  105     ld a,#CR 
      00B3C6 49 4D 45         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00B3C9 52 AE 93         [ 2]  108     ldw x,LOOP_CNT
      00B3CC B3 C4            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 236.
Hexadecimal [24-Bits]



      00B3CE CE 00 0F         [ 2]  110     ldw x,ticks 
      00B3CE 17 54            [ 2]  111     ldw (T,sp),x 
      003783                        112 4$:
      00B3D0 49 4D            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00B3D2 45 4F 55         [ 2]  114     ldw x,#VAL1&0XFFFF
      00B3D5 54 AE AA         [ 1]  115     ld acc24,a 
      00B3D8 B3 CE 0D         [ 2]  116     ldw acc24+1,x  
      00B3DA A6 FF            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00B3DA 15 54 49         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00B3DD 43 4B 53         [ 4]  119     call mul24 
      00B3E0 AC 77            [ 2]  120     ldw x,(CNTR,sp)
      00B3E2 B3 DA 01         [ 2]  121     subw x,#1
      00B3E4 1F 03            [ 2]  122     ldw (CNTR,sp),x 
      00B3E4 04 53            [ 1]  123     jrne 4$ 
      00B3E6 54 4F 50         [ 4]  124     call prt_acc24 
      00B3E9 A8 25            [ 1]  125     ld a,#SPACE 
      00B3EB B3 E4 47         [ 4]  126     call putc 
      00B3ED CE 00 0F         [ 2]  127     ldw x,ticks 
      00B3ED 04 53 54         [ 2]  128     subw x,(T,sp)
      00B3F0 45 50 A3         [ 4]  129     call prt_i16 
      00B3F3 BE B3            [ 1]  130     ld a,#CR 
      00B3F5 ED 09 47         [ 4]  131     call putc 
                                    132 ; test abs24 
      00B3F6 CE 27 10         [ 2]  133     ldw x,LOOP_CNT
      00B3F6 05 53            [ 2]  134     ldw (CNTR,sp),x 
      00B3F8 50 49 57         [ 2]  135     ldw x,ticks 
      00B3FB 52 B1            [ 2]  136     ldw (T,sp),x 
      0037BF                        137 5$: 
      00B3FD 2B B3            [ 1]  138     ld a,#0xff
      00B3FF F6 FF FF         [ 2]  139     ldw x,#0xffff
      00B400 CD 01 F3         [ 4]  140     call abs24 
      00B400 06 53 50         [ 1]  141     ld acc24,a 
      00B403 49 53 45         [ 2]  142     ldw acc24+1,x
      00B406 4C B1            [ 2]  143     ldw x,(CNTR,sp)
      00B408 52 B4 00         [ 2]  144     subw x,#1
      00B40B 1F 03            [ 2]  145     ldw (CNTR,sp),x 
      00B40B 15 53            [ 1]  146     jrne 5$ 
      00B40D 50 49 52         [ 4]  147     call prt_acc24 
      00B410 44 B1            [ 1]  148     ld a,#SPACE 
      00B412 4B B4 0B         [ 4]  149     call putc 
      00B415 CE 00 0F         [ 2]  150     ldw x,ticks 
      00B415 05 53 50         [ 2]  151     subw x,(T,sp)
      00B418 49 45 4E         [ 4]  152     call prt_i16 
      0037E7                        153 6$:
      00B41B B0 B3            [ 1]  154     ld a,#CR 
      00B41D B4 15 47         [ 4]  155     call putc 
      00B41F CD 38 32         [ 4]  156     call read_integer 
      00B41F 05 53 4C 45 45   [ 1]  157     mov farptr,acc24 
      00B424 50 AB FA B4 1F   [ 1]  158     mov farptr+1,acc16 
      00B429 55 00 0E 00 1A   [ 1]  159     mov farptr+2,acc8 
      00B429 04 53 49         [ 4]  160     call read_integer 
      00B42C 5A 45 9D         [ 1]  161     ld a,acc24 
      00B42F 7B B4 29         [ 2]  162     ldw x,acc16 
      00B432 55 00 18 00 0C   [ 1]  163     mov acc24,farptr 
      00B432 04 53 41 56 45   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
Hexadecimal [24-Bits]



      00B437 A9 C5 B4 32 0E   [ 1]  165     mov acc8,farptr+2 
      00B43B CD 03 07         [ 4]  166     call div24 
      00B43B 03               [ 1]  167     push a 
      00B43C 52               [ 2]  168     pushw x 
      00B43D 55 4E A5         [ 4]  169     call prt_acc24 
      00B440 C8 B4            [ 1]  170     ld a,#SPACE 
      00B442 3B 09 47         [ 4]  171     call putc 
      00B443 85               [ 2]  172     popw x
      00B443 16 52 53         [ 2]  173     ldw acc16,x  
      00B446 48 49 46         [ 1]  174     pop acc24 
      00B449 54 AC C1         [ 4]  175     call prt_acc24
      00B44C B4 43            [ 2]  176     jra 6$
      00B44E                        177     _drop VSIZE 
      00B44E 13 52            [ 2]    1     addw sp,#VSIZE 
      00B450 4E               [ 4]  178     ret 
                                    179 
                                    180 
      003832                        181 read_integer:
      00B451 44 AD            [ 1]  182     ld a,#'? 
      00B453 8B B4 4E         [ 4]  183     call putc  
      00B456 72 5F 00 02      [ 1]  184 	clr count  
      00B456 06 52 45         [ 4]  185 	call readln 
      00B459 54 55 52         [ 2]  186 	ldw x,#tib 
      00B45C 4E A5 A1         [ 1]  187 	push count
      00B45F B4 56            [ 1]  188 	push #0 
      00B461 72 FB 01         [ 2]  189 	addw x,(1,sp)
      00B461 07               [ 1]  190 	incw x 
      00384A                        191 	_drop 2 
      00B462 52 45            [ 2]    1     addw sp,#2 
      00B464 53 54 4F 52      [ 1]  192 	clr in 
      00B468 45 AF F5         [ 4]  193 	call get_token
      00B46B B4 61            [ 1]  194 	cp a,#TK_INTGR
      00B46D 27 0F            [ 1]  195 	jreq 3$ 
      00B46D 03 52            [ 1]  196 	cp a,#TK_MINUS
      00B46F 45 4D A2         [ 4]  197 	call get_token 
      00B472 08 B4            [ 1]  198 	cp a,#TK_INTGR 
      00B474 6D 03            [ 1]  199 	jreq 2$
      00B475 CC 16 D7         [ 2]  200 	jp syntax_error
      003863                        201 2$:
      00B475 06 52 45         [ 4]  202 	call neg_acc24  	
      003866                        203 3$: 
      00B478 42               [ 4]  204     ret 
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
      003880                         28 	.bndry 128 ; align on FLASH block.
                                     29 ; space for user application  
      003880                         30 app_space::
      00B479 4F 4F                   31 app_sign:  .word 0 ; .ascii "BC"  ; signature 
      00B47B 54 81                   32 app_size: .word 0 
      003884                         33 app: 
                                     34 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     A32     =  000005     |   4 ABS        0036BD R
    ACK     =  000006     |   4 ADCON      0036B3 R   |   4 ADCREAD    0036A7 R
    ADC_CR1 =  005401     |     ADC_CR1_=  000000     |     ADC_CR1_=  000001 
    ADC_CR1_=  000004     |     ADC_CR1_=  000005     |     ADC_CR1_=  000006 
    ADC_CR2 =  005402     |     ADC_CR2_=  000003     |     ADC_CR2_=  000004 
    ADC_CR2_=  000005     |     ADC_CR2_=  000006     |     ADC_CR2_=  000001 
    ADC_CR3 =  005403     |     ADC_CR3_=  000007     |     ADC_CR3_=  000006 
    ADC_CSR =  005400     |     ADC_CSR_=  000006     |     ADC_CSR_=  000004 
    ADC_CSR_=  000000     |     ADC_CSR_=  000001     |     ADC_CSR_=  000002 
    ADC_CSR_=  000003     |     ADC_CSR_=  000007     |     ADC_CSR_=  000005 
    ADC_DRH =  005404     |     ADC_DRL =  005405     |     ADC_TDRH=  005406 
    ADC_TDRL=  005407     |     ADDR    =  000001     |     AFR     =  004803 
    AFR0_ADC=  000000     |     AFR1_TIM=  000001     |     AFR2_CCO=  000002 
    AFR3_TIM=  000003     |     AFR4_TIM=  000004     |     AFR5_TIM=  000005 
    AFR6_I2C=  000006     |     AFR7_BEE=  000007     |   4 ALLOC      00369D R
  4 AND        003695 R   |     ARG_OFS =  000002     |     ARROW_LE=  000080 
    ARROW_RI=  000081     |   4 AR_SIGN    003221 R   |   4 ASC        00368D R
    ATMP    =  000001     |     ATTRIB  =  000002     |   4 AUTORUN    003681 R
  4 AUTO_RUN   00015C R   |   4 AWU        003679 R   |   4 AWUHandl   000004 R
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
    BINARY  =  000001     |   4 BIT        003671 R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BLOCKS  =  000005     |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |     BPTR    =  00000D 
  4 BRES       003668 R   |     BS      =  000008     |   4 BSET       00365F R
    BSIZE   =  000006     |   4 BTEST      003655 R   |   4 BTOGL      00364B R
    BTW     =  000001     |   4 BYE        003643 R   |     BYTE    =  000003 
    C       =  000001     |     CAN     =  000018     |     CAN_DGR =  005426 
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
    CELL_SIZ=  000003     |     CFG_GCR =  007F60     |     CFG_GCR_=  000001 
    CFG_GCR_=  000000     |   4 CHAIN      003639 R   |     CHAIN_AD=  000005 
    CHAIN_BP=  000007     |     CHAIN_CN=  000008     |     CHAIN_CO=  00000A 
    CHAIN_IN=  000009     |     CHAIN_LN=  000003     |     CHAIN_TX=  00000B 
    CHAIN_TX=  00000D     |   4 CHAR       003630 R   |     CLKOPT  =  004807 
    CLKOPT_C=  000002     |     CLKOPT_E=  000003     |     CLKOPT_P=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 240.
Hexadecimal [24-Bits]

Symbol Table

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
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |     CMD_END =  000002 
    CNT     =  000006     |     CNTDWN  =  000002     |     CNTR    =  000003 
    CNT_LO  =  000004     |     CODE_ADD=  000001     |     COLON   =  00003A 
    COMMA   =  00002C     |   4 CONST      003626 R   |     COUNT   =  000003 
    CPOS    =  000003     |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
    CR      =  00000D     |   4 CR1        00361E R   |   4 CR2        003616 R
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
    CX_CNT  =  000004     |     CX_IN   =  000003     |   4 DATA       00360D R
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   4 DDR        003605 R   |     DEBUG   =  000001 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   4 DEC        0035FD R
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  4 DIM        0035F5 R   |   4 DIR        0035ED R   |     DISCARD =  000004 
    DIVISOR =  000001     |     DIVSOR  =  000001     |     DLE     =  000010 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   4 DO         0035E6 R
    DOLP_ADR=  000003     |     DOLP_INW=  000005     |   4 DREAD      0035DC R
  4 DROP       0035D3 R   |   4 DWRITE     0035C8 R   |   4 EDIT       0035BF R
  4 EEFREE     0035B4 R   |   4 EEPROM     0035A9 R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_S=  000800     |     EM      =  000019 
  4 END        0035A1 R   |     ENQ     =  000005     |     EOF     =  0000FF 
    EOT     =  000004     |   4 ERASE      003597 R   |   4 ERASED     0029E5 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
Hexadecimal [24-Bits]

Symbol Table

    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_NO_P=  000012 
    ERR_OVER=  000010     |     ERR_RD_O=  000011     |     ERR_RUN_=  000006 
    ERR_SYNT=  000002     |     ESC     =  00001B     |     ETB     =  000017 
    ETX     =  000003     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
    FBREAK  =  000004     |     FCOMP   =  000005     |   4 FCPU       00358E R
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
    FLASH_IA=  000000     |   4 FLASH_ME   001F04 R   |     FLASH_NC=  00505C 
    FLASH_NF=  00505E     |     FLASH_NF=  000000     |     FLASH_NF=  000001 
    FLASH_NF=  000002     |     FLASH_NF=  000003     |     FLASH_NF=  000004 
    FLASH_NF=  000005     |     FLASH_PU=  005062     |     FLASH_PU=  000056 
    FLASH_PU=  0000AE     |     FLASH_SI=  020000     |     FLASH_WS=  00480D 
    FLN_REJE=  000006     |     FLOOP   =  000002     |     FLSI    =  01F400 
  4 FOR        003586 R   |   4 FREE       00357D R   |     FRUN    =  000000 
    FS      =  00001C     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_AND   =  000080     |     F_CFUNC =  000020 
    F_CMD   =  000000     |     F_CONST =  000030     |     F_IFUNC =  000010 
    F_NOT   =  000070     |     F_OR    =  000090     |     F_XOR   =  0000A0 
  4 GET        003575 R   |   4 GOSUB      00356B R   |   4 GOTO       003562 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |     GS      =  00001D     |   4 HEX        00355A R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Symbol Table

    I2C_SR3_=  000004     |     I2C_SR3_=  000000     |     I2C_SR3_=  000002 
    I2C_TRIS=  00521D     |     I2C_TRIS=  000005     |     I2C_TRIS=  000005 
    I2C_TRIS=  000005     |     I2C_TRIS=  000011     |     I2C_TRIS=  000011 
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   4 IDR        003552 R
  4 IF         00354B R   |     IN      =  000005     |     INCR    =  000001 
    INP     =  000000     |   4 INPUT      003541 R   |     INPUT_DI=  000000 
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
  4 IWDGEN     003536 R   |   4 IWDGREF    00352A R   |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |     KCHAR   =  000002 
  4 KEY        003522 R   |     KEY_END =  000083     |     KW_TYPE_=  0000F0 
    LAST    =  000003     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000002 
  4 LET        00351A R   |     LF      =  00000A     |     LIMIT   =  000005 
    LINENO  =  000005     |   4 LINES_RE   001FBF R   |   4 LINK    =  0036BD R
  4 LIST       003511 R   |     LL      =  000001     |     LLEN    =  000002 
    LL_HB   =  000001     |     LN_PTR  =  000005     |   4 LOG2       003508 R
    LOOP_CNT=  002710     |   4 LSHIFT     0034FD R   |     MAJOR   =  000002 
    MASK    =  000002     |     MAX_LINE=  007FFF     |     MINOR   =  000000 
    MULOP   =  000001     |     N1      =  000005     |     NAFR    =  004804 
    NAK     =  000015     |     NAMEPTR =  000001     |     NAME_MAX=  00000F 
    NCLKOPT =  004808     |     NEG     =  000001     |   4 NEW        0034F5 R
  4 NEXT       0034EC R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NLEN    =  000001     |     NLEN_MAS=  00000F     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   4 NOT        0034E4 R   |     NOT_OP  =  000001 
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  4 NonHandl   000000 R   |   4 ODR        0034DC R   |   4 ON         0034D5 R
    ONOFF   =  000003     |     OP      =  000002     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 243.
Hexadecimal [24-Bits]

Symbol Table

    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  4 OR         0034CE R   |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVRWR   =  000004     |     PA      =  000000     |   4 PAD        0034C6 R
    PAD_SIZE=  000080     |   4 PAUSE      0034BC R   |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  4 PEEK       0034B3 R   |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PG_SIZE =  000001     |     PH      =  000023     |     PH_BASE =  005023 
    PH_CR1  =  005026     |     PH_CR2  =  005027     |     PH_DDR  =  005025 
    PH_IDR  =  005024     |     PH_ODR  =  005023     |     PI      =  000028 
  4 PICK       0034AA R   |     PINNO   =  000001     |   4 PINP       0034A1 R
    PINVAL  =  000002     |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   4 PMODE      003497 R   |     PNAME   =  000003 
  4 POKE       00348E R   |   4 POP        003486 R   |   4 PORTA      003469 R
  4 PORTB      00345F R   |   4 PORTC      003455 R   |   4 PORTD      00344B R
  4 PORTE      003441 R   |   4 PORTF      003437 R   |   4 PORTG      00342D R
  4 PORTI      003423 R   |   4 POUT       00347D R   |     PREV    =  000001 
    PRG_SIZE=  000003     |   4 PRINT      003473 R   |     PROD    =  000001 
    PROD_SIG=  000004     |   4 PROG_ADD   001EDA R   |   4 PROG_SIZ   001EEC R
    PSIZE   =  00000B     |     PSTR    =  000003     |   4 PUSH       00341A R
  4 PUT        003412 R   |   4 QKEY       003409 R   |     QSIGN   =  000005 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |   4 RAM_MEM    001F15 R
    RAM_SIZE=  001800     |   4 READ       003400 R   |   4 REBOOT     0033F5 R
    RECLEN  =  000005     |     REC_LEN =  000003     |     REC_XTRA=  000005 
  4 REG_A      0004DA R   |   4 REG_CC     0004DE R   |   4 REG_PC     0004CE R
  4 REG_SP     0004E3 R   |   4 REG_X      0004D6 R   |   4 REG_Y      0004D2 R
    RELOP   =  000001     |   4 REM        0033ED R   |   4 RESTORE    0033E1 R
    RETL1   =  000001     |   4 RETURN     0033D6 R   |     RET_ADDR=  000001 
    RET_BPTR=  000003     |     RET_INW =  000005     |   4 RND        0033CE R
    RONLY   =  000005     |     ROP     =  004800     |     RS      =  00001E 
  4 RSHIFT     0033C3 R   |     RSIGN   =  000006     |     RST_SR  =  0050B3 
  4 RUN        0033BB R   |     RXCHAR  =  000001     |     RX_QUEUE=  000008 
    R_A     =  000001     |     R_CC    =  000009     |     R_PC    =  00000A 
    R_X     =  000002     |     R_Y     =  000004     |   4 SAVE       0033B2 R
    SAV_ACC1=  000006     |     SAV_ACC2=  000008     |     SAV_COUN=  00000A 
    SAV_IN  =  000009     |     SEMIC   =  00003B     |     SEMICOL =  000001 
    SEPARATE=  000000     |     SFR_BASE=  005000     |     SFR_END =  0057FF 
    SHARP   =  000023     |     SI      =  00000F     |     SIGN    =  000001 
  4 SIGNATUR   0029E3 R   |   4 SIZE       0033A9 R   |     SKIP    =  000005 
  4 SLEEP      00339F R   |     SLEN    =  000002     |     SO      =  00000E 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 244.
Hexadecimal [24-Bits]

Symbol Table

    SOH     =  000001     |     SPACE   =  000020     |   4 SPIEN      003395 R
  4 SPIRD      00338B R   |   4 SPISEL     003380 R   |   4 SPIWR      003376 R
    SPI_CR1 =  005200     |     SPI_CR1_=  000003     |     SPI_CR1_=  000000 
    SPI_CR1_=  000001     |     SPI_CR1_=  000007     |     SPI_CR1_=  000002 
    SPI_CR1_=  000006     |     SPI_CR2 =  005201     |     SPI_CR2_=  000007 
    SPI_CR2_=  000006     |     SPI_CR2_=  000005     |     SPI_CR2_=  000004 
    SPI_CR2_=  000002     |     SPI_CR2_=  000000     |     SPI_CR2_=  000001 
    SPI_CRCP=  005205     |     SPI_CS_B=  000005     |     SPI_DR  =  005204 
    SPI_ICR =  005202     |     SPI_RXCR=  005206     |     SPI_SR  =  005203 
    SPI_SR_B=  000007     |     SPI_SR_C=  000004     |     SPI_SR_M=  000005 
    SPI_SR_O=  000006     |     SPI_SR_R=  000000     |     SPI_SR_T=  000001 
    SPI_SR_W=  000003     |     SPI_TXCR=  005207     |     SRC     =  000003 
    STACK_EM=  0017FF     |     STACK_SI=  00008C     |   4 STATES     000491 R
  4 STEP       00336D R   |   4 STOP       003364 R   |     STR     =  000002 
  4 STR_BYTE   001EFD R   |     STX     =  000002     |     SUB     =  00001A 
    SUP     =  000084     |     SWIM_CSR=  007F80     |     SYN     =  000016 
  4 SysCall    000012 R   |     T       =  000001     |     TAB     =  000009 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   4 TICKS      00335A R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 245.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_PSC=  000006     |     TIM4_PSC=  000003     |     TIM4_PSC=  000000 
    TIM4_PSC=  000001     |     TIM4_PSC=  000002     |     TIM4_SR =  005342 
    TIM4_SR_=  000000     |   4 TIMEOUT    00334E R   |   4 TIMER      003344 R
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |     TK_AND  =  000088 
    TK_ARRAY=  000005     |     TK_CFUNC=  000082     |     TK_CHAR =  000004 
    TK_CMD  =  000080     |     TK_COLON=  000009     |     TK_COMMA=  000008 
    TK_CONST=  000083     |     TK_DIV  =  000021     |     TK_EQUAL=  000032 
    TK_FLOAT=  000086     |     TK_GE   =  000033     |     TK_GRP_A=  000010 
    TK_GRP_M=  000030     |     TK_GRP_M=  000000     |     TK_GRP_M=  000020 
    TK_GRP_R=  000030     |     TK_GT   =  000031     |     TK_IFUNC=  000081 
    TK_INTGR=  000084     |     TK_LABEL=  000003     |     TK_LE   =  000036 
    TK_LPARE=  000006     |     TK_LT   =  000034     |     TK_MINUS=  000011 
    TK_MOD  =  000022     |     TK_MULT =  000020     |     TK_NE   =  000035 
    TK_NONE =  000000     |     TK_NOT  =  000087     |     TK_OR   =  000089 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 246.
Hexadecimal [24-Bits]

Symbol Table

    TK_PLUS =  000010     |     TK_QSTR =  000002     |     TK_RPARE=  000007 
    TK_SEMIC=  00000A     |     TK_VAR  =  000085     |     TK_XOR  =  00008A 
  4 TO         00333D R   |   4 TONE       003334 R   |     TOWRITE =  000005 
  4 Timer4Up   000013 R   |     U8      =  000001     |     UART1   =  000000 
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
    UART_SR_=  000007     |     UBC     =  004801     |   4 UBOUND     003329 R
  4 UBTN_Han   00005A R   |   4 UFLASH     00331E R   |   4 UNTIL      003314 R
    US      =  00001F     |   4 USER_ABO   000062 R   |   4 USR        00330C R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
  4 Uart1RxH   0008C4 R   |   4 UserButt   000036 R   |     VAL1    =  02FFFF 
    VAL2    =  00002A     |     VAL3    =  000003     |     VAL4    =  0005FF 
    VAL5    =  FFFFFFFD     |     VAR_NAME=  000001     |     VSIZE   =  000008 
    VT      =  00000B     |   4 WAIT       003303 R   |     WCNT    =  000003 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |     WIDTH   =  000001 
    WLEN    =  000001     |     WLKPTR  =  000001     |   4 WORDS      0032F9 R
  4 WRITE      0032EF R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XFIRST  =  000001     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   4 XOR        0032E7 R   |     XSAVE   =  000002 
    XSTACK_E=  001773     |     XSTACK_S=  000014     |     XTEMP   =  000001 
    YSAVE   =  000007     |     YTEMP   =  000005     |   4 abs        002BFE R
  4 abs24      0001F3 R   |   5 acc16      00000D GR  |   5 acc24      00000C GR
  5 acc32      00000B GR  |   5 acc8       00000E GR  |   4 accept_c   000C0F R
  4 add24      00017E R   |   4 add_char   00137F R   |   4 add_spac   001185 R
  4 analog_r   0026E7 R   |   4 and_cond   001C22 R   |   4 and_fact   001BF2 R
  4 app        003884 R   |   4 app_sign   003880 R   |   4 app_size   003882 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 247.
Hexadecimal [24-Bits]

Symbol Table

  4 app_spac   003880 GR  |   4 arduino_   002CEB R   |   4 arg_list   001A19 R
  5 array_si   000020 R   |   4 ascii      002AD9 R   |   4 at_tst     000FF7 R
  4 atoi24     001925 GR  |   4 atoi_exi   001994 R   |   4 awu        002BA5 R
  4 awu02      002BB8 R   |   5 base       00000A GR  |   5 basicptr   000004 GR
  4 beep       00265E R   |   4 beep_1kh   002631 GR  |   4 bin_exit   000E5E R
  4 bit_rese   0021ED R   |   4 bit_set    0021CB R   |   4 bit_test   002232 R
  4 bit_togg   002210 R   |   4 bitmask    002EA5 R   |   4 bkslsh_t   000FA4 R
  4 bksp       0009AE R   |   2 block_bu   0016B8 GR  |   4 block_er   0007AD R
  4 break_po   0027D2 R   |   4 bye        002B71 R   |   5 chain_le   000033 R
  4 clear_au   0008FB R   |   4 clear_ba   0014E3 R   |   4 clear_bl   0028E3 R
  4 clear_va   001443 R   |   4 clock_in   00007D R   |   4 cmd_auto   0031CA R
  4 cmd_chai   00325D R   |   4 cmd_cons   001DF7 R   |   4 cmd_dim    001E04 R
  4 cmd_dim1   001E07 R   |   4 cmd_dim2   001E0D R   |   4 cmd_dir    002A0A R
  4 cmd_edit   001FE8 R   |   4 cmd_end    0025D8 R   |   4 cmd_eras   002850 R
  4 cmd_get    002604 R   |   4 cmd_itf    0004FE R   |   4 cmd_line   001766 R
  4 cmd_line   0019F1 R   |   4 cmd_list   001F24 R   |   4 cmd_name   00139F R
  4 cmd_on     002467 R   |   4 cmd_run    002548 R   |   4 cmd_save   002945 R
  4 cmd_size   001CFB R   |   4 cold_sta   0000B5 R   |   4 colon_ts   000FCB R
  4 comma_ts   000FD6 R   |   4 comp_msg   0016B6 R   |   4 compile    0010F1 GR
  4 conditio   001C74 R   |   4 const_cr   002F48 R   |   4 const_cr   002F4D R
  4 const_dd   002F43 R   |   4 const_ee   002F5C R   |   4 const_id   002F3E R
  4 const_in   002F57 R   |   4 const_od   002F39 R   |   4 const_ou   002F52 R
  4 const_po   002F11 R   |   4 const_po   002F16 R   |   4 const_po   002F1B R
  4 const_po   002F20 R   |   4 const_po   002F25 R   |   4 const_po   002F2A R
  4 const_po   002F2F R   |   4 const_po   002F34 R   |   4 convert_   000DCA R
  4 convert_   000972 R   |   4 copy_com   00102C R   |   5 count      000002 GR
  4 cp24       0001B8 R   |   4 cp24_ax    0001EA R   |   4 cp_loop    0019B4 R
  4 cpl24      0001FA R   |   4 cpy_cmd_   00116D R   |   4 cpy_quot   0011B6 R
  4 cs_high    0030E4 R   |   4 dash_tst   000FEC R   |   4 data       002F61 R
  4 data_err   002FDD R   |   5 data_len   000009 R   |   5 data_ofs   000008 R
  5 data_ptr   000006 R   |   4 dec_base   001CED R   |   4 decomp_l   001243 R
  4 decompil   001206 GR  |   4 del_line   000CB8 R   |   4 delete_l   000A9B R
  4 delete_n   0009BE R   |   4 delete_u   000A60 R   |   4 digital_   002723 R
  4 digital_   00275A R   |   4 div24      000307 R   |   4 divu24_8   0002E9 R
  4 do_loop    002ECB R   |   4 do_progr   0007A0 R   |   4 dup24      00016F R
  5 dvar_bgn   00002F GR  |   5 dvar_end   000031 GR  |   4 enable_i   002E35 R
  4 end_at_l   001F6E R   |   4 eql_tst    001077 R   |   4 equal      001392 R
  4 erase_ex   0007D1 R   |   4 erase_fl   0007C7 R   |   4 erase_he   00292B R
  4 erase_pr   0027FB R   |   4 err_bad_   0015DF R   |   4 err_buf_   001655 R
  4 err_cmd_   0015A3 R   |   4 err_div0   001568 R   |   4 err_dupl   0015BD R
  4 err_math   00154F R   |   4 err_mem_   00152A R   |   4 err_msg    001504 R
  4 err_no_a   0015EB R   |   4 err_no_d   00161E R   |   4 err_no_f   001642 R
  4 err_no_l   001577 R   |   4 err_no_p   00162E R   |   4 err_not_   0015CE R
  4 err_not_   001688 R   |   4 err_over   001662 R   |   4 err_read   00166C R
  4 err_run_   00158D R   |   4 err_synt   001541 R   |   4 escaped    000DDF GR
  4 expect     001A07 R   |   4 expressi   001B5B R   |   4 factor     001A63 R
  5 farptr     000018 R   |   4 fcpu       002C6D R   |   4 fetchc     000605 R
  4 fill_wri   0028D3 R   |   4 final_te   000C08 R   |   5 flags      000022 GR
  4 for        0022C8 R   |   4 free       001CF2 R   |   5 free_eep   000023 R
  7 free_ram   000090 R   |   4 func_arg   001A14 R   |   4 func_cha   002AC2 R
  4 func_eef   001D87 R   |   4 ge         001394 R   |   4 get_addr   001866 R
  4 get_arra   001A35 R   |   4 get_char   001880 R   |   4 get_esca   00097E R
  4 get_int2   001870 R   |   4 get_targ   0023F5 R   |   4 get_targ   002403 R
  4 get_tick   002BF7 R   |   4 get_toke   000F3D GR  |   4 get_valu   001D76 R
  4 getc       000957 GR  |   4 gosub      002505 R   |   4 gosub_1    002508 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 248.
Hexadecimal [24-Bits]

Symbol Table

  4 gosub_2    00250E R   |   4 goto       0024F2 R   |   4 goto_1     0024F5 R
  4 gt         001390 R   |   4 gt_tst     001082 R   |   4 hex_base   001CE8 R
  4 hex_dump   00069B R   |   4 if         0022AB R   |   5 in         000001 GR
  5 in.saved   000003 GR  |   5 in.w       000000 GR  |   4 incr_far   0008A8 R
  4 input_ex   002183 R   |   4 input_lo   0020ED R   |   4 input_va   0020E9 R
  4 insert_c   000A1D R   |   4 insert_l   000D24 R   |   4 interp_l   0017AA R
  4 interpre   001782 R   |   4 invalid    00056D R   |   4 invalid_   0005DB R
  4 is_alnum   000E91 GR  |   4 is_alpha   000E77 GR  |   4 is_data_   002F67 R
  4 is_digit   000E88 GR  |   4 is_erase   0029E7 R   |   4 is_minus   001F43 R
  4 is_progr   002537 R   |   4 is_symbo   000E9A R   |   4 itoa       0018BB GR
  4 itoa_loo   0018DD R   |   4 jp_to_ta   0024F8 R   |   4 key        002B18 R
  4 kword_di   0036BB GR  |   4 kword_en   0032E5 R   |   4 le         001399 R
  4 ledoff     0003CD R   |   4 ledon      0003C8 R   |   4 ledtoggl   0003D2 R
  4 left_par   0003DB R   |   4 let        001D33 GR  |   4 let_arra   001D41 R
  4 let_dvar   0017E3 R   |   4 let_eval   001D49 R   |   4 let_var    001D46 R
  4 lines_sk   001F53 R   |   4 list_exi   001FA3 R   |   4 list_loo   001F81 R
  4 log2       002E78 R   |   4 look_tar   002426 R   |   4 loop_bac   0023D8 R
  5 loop_dep   00001F R   |   4 loop_don   0023ED R   |   4 lshift     002C15 R
  4 lt         001397 R   |   4 lt_tst     0010AB R   |   4 mem_peek   000589 R
  4 mod24      0003A1 R   |   4 move       0013FF GR  |   4 move_dow   00141E R
  4 move_era   00072F R   |   4 move_exi   00143F R   |   4 move_lef   0009F5 R
  4 move_loo   001423 R   |   4 move_prg   00076F R   |   4 move_rig   000A03 R
  4 move_up    001410 R   |   4 mul24      000279 R   |   4 mul_char   001381 R
  4 mulu24_8   00023A R   |   4 nbr_tst    000F70 R   |   4 ne         00139C R
  4 neg24      000203 R   |   4 neg_acc2   00021D R   |   4 neg_ax     000215 R
  4 new        0027F0 R   |   4 next       002380 R   |   4 next_lin   00178A R
  4 next_tok   00183E GR  |   4 no_match   0019C6 R   |   4 number     00060B R
  4 open_gap   000CED R   |   4 other      0010D4 R   |   4 overwrit   000C34 R
  2 pad        0016B8 GR  |   4 pad_ref    0030E9 R   |   4 parse_ad   0004E8 R
  4 parse_bi   000E3C R   |   4 parse_in   000DE7 R   |   4 parse_ke   000EBD R
  4 parse_qu   000D92 R   |   4 parse_sy   000EA5 R   |   4 pause      002B85 R
  4 pause02    002B98 R   |   4 peek       00228A R   |   4 peek_byt   0005A5 R
  4 pin_mode   002C7C R   |   4 plus_tst   00104B R   |   4 poke       002269 R
  4 power_ad   002697 R   |   4 prcnt_ts   00106C R   |   4 print      00204D R
  4 print_ch   000616 R   |   4 print_fa   0005EA R   |   4 print_he   000C6B GR
  4 print_re   000427 R   |   4 print_st   00057D R   |   4 print_to   0018A8 R
  4 prog_siz   001E93 R   |   4 program_   001E9B R   |   4 program_   000749 R
  4 program_   00076F R   |   4 prt_acc2   00189D R   |   4 prt_basi   002029 R
  4 prt_i16    001886 R   |   4 prt_loop   002051 R   |   4 prt_peek   0003AA GR
  4 prt_reg1   000408 R   |   4 prt_reg8   0003E6 R   |   5 ptr16      000019 GR
  5 ptr8       00001A R   |   4 putc       000947 GR  |   4 puts       0009A4 GR
  4 qgetc      000950 GR  |   4 qkey       002B1C GR  |   4 qmark_ts   001002 R
  4 qsign      0028C8 R   |   4 random     002D0B R   |   4 read       002FE2 R
  4 read01     002FEA R   |   4 read_int   003832 R   |   4 readln     000AA9 GR
  4 readln_l   000AB8 R   |   4 readln_q   000C51 R   |   4 refresh_   002E73 R
  4 relation   001B93 R   |   4 relop_st   001384 R   |   4 remark     002188 GR
  4 repl       000527 R   |   4 repl_exi   00054F R   |   4 reset_se   00204F R
  4 rest_con   0020D9 R   |   4 restore    002F75 R   |   4 return     002521 R
  4 right_al   00119B GR  |   4 row_alig   00088D R   |   4 row_eras   000702 R
  4 row_eras   00072F R   |   4 row_loop   000657 R   |   4 rparnt_t   000FC0 R
  4 rshift     002C41 R   |   7 rsign      00008C R   |   7 rsize      00008E R
  4 rt_msg     0016A4 R   |   4 run_app    00012A R   |   4 run_it     0025A5 R
  4 run_it_0   0025A7 R   |   4 runtime_   0019FC R   |   5 rx1_head   00002D R
  5 rx1_queu   000025 R   |   5 rx1_tail   00002E R   |   4 save_con   0020C9 R
  4 scan_blo   0008B6 R   |   4 search_d   0019A6 GR  |   4 search_e   0019EE R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 249.
Hexadecimal [24-Bits]

Symbol Table

  4 search_f   0028F7 R   |   4 search_l   000C8D GR  |   4 search_l   000C9C R
  4 search_n   001DB0 R   |   4 search_n   0019AA R   |   4 search_p   003223 R
  5 seedx      000014 R   |   5 seedy      000016 R   |   4 select_p   002CDB R
  4 semic_ts   000FE1 R   |   4 send_esc   0009CC R   |   4 send_par   0009D7 R
  4 set_data   002FAE R   |   4 set_time   002E13 R   |   4 show_row   000631 R
  4 single_c   001379 R   |   4 skip       000F2A R   |   4 skip_str   001857 R
  4 skip_to_   0029F2 R   |   4 slash_ts   001061 R   |   4 sleep      002B7A R
  4 software   001452 R   |   4 spaces     000A11 GR  |   4 spi_clea   00307E R
  4 spi_disa   003066 R   |   4 spi_enab   003033 R   |   4 spi_rcv_   0030A0 R
  4 spi_read   0030CB R   |   4 spi_sele   0030D2 R   |   4 spi_send   00308A R
  4 spi_writ   0030AB R   |   2 stack_fu   001774 GR  |   2 stack_un   001800 R
  4 star_tst   001056 R   |   4 start_fr   001F4E R   |   4 step       00233E R
  4 stop       0027A5 R   |   4 store_lo   00236D R   |   4 str_matc   0019D3 R
  4 str_tst    000F60 R   |   4 strcmp     0013DE R   |   4 strcpy     0013EF GR
  4 strlen     0013D3 GR  |   4 sub24      00019B R   |   4 symb_loo   000EA6 R
  4 syntax_e   0016D7 GR  |   4 system_i   001498 R   |   4 tb_error   0016D9 GR
  4 term       001B18 R   |   4 term01     001B20 R   |   4 term_exi   001B58 R
  4 test       0036C3 R   |   4 test_p     000575 R   |   2 tib        001668 GR
  4 tick_tst   00101A R   |   5 ticks      00000F R   |   4 timeout    002E2A R
  5 timer      000012 GR  |   4 timer2_i   000093 R   |   4 timer4_i   0000A0 R
  4 tk_id      0016C7 R   |   4 to         0022F8 R   |   4 to_eepro   000798 R
  4 to_flash   00079D R   |   4 to_hex_c   000C82 GR  |   4 to_upper   001919 GR
  4 token_ch   0010EA R   |   4 token_ex   0010EE R   |   4 tone       00263C R
  4 try_next   002FBB R   |   5 txtbgn     00001B GR  |   5 txtend     00001D GR
  4 uart1_ge   000957 GR  |   4 uart1_in   000902 R   |   4 uart1_pu   000947 GR
  4 uart1_qg   000950 GR  |   4 uart1_se   000912 R   |   4 ubound     001D28 R
  4 uflash     002B29 R   |   4 unlock_e   0006CC R   |   4 unlock_f   0006E7 R
  4 until      002EDE R   |   4 user_int   000049 R   |   4 usr        002B4B R
  4 var_name   0011FC GR  |   5 vars       000034 GR  |   4 wait       00218E R
  4 warm_ini   0014C5 R   |   4 warm_sta   001763 R   |   4 words      002DA6 R
  4 words_co   002DFD R   |   4 write      002A59 R   |   4 write_bl   000852 GR
  4 write_bu   000789 R   |   4 write_by   0007D3 R   |   4 write_ee   00080F R
  4 write_ex   000848 R   |   4 write_fl   0007F9 R   |   4 write_nb   000877 R
  4 xalloc     0030FC R   |   4 xdrop      003132 R   |   4 xpick      0031B0 R
  4 xpop       0030F2 R   |   4 xpush      0030EE R   |   4 xput       00317D R
  4 xstack_b   00315F R   |   2 xstack_f   001738 GR  |   2 xstack_u   001774 GR

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 250.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 SSEG       size      0   flags    8
   2 SSEG0      size    198   flags    8
   3 HOME       size     80   flags    0
   4 CODE       size   3884   flags    0
   5 DATA       size     82   flags    0
   6 BTXT       size      0   flags    8
   7 BTXT1      size      4   flags    8

