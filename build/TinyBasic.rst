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
                           000007    36         FUPDATE=7 ; update constant flag 
                                     37 
                           004000    38 	AUTORUN_NAME=0x4000 ; address in EEPROM where auto run file name is saved 
                                     39 
                           000006    40         FIRST_DATA_ITEM=6 ; first DATA item offset on line.
                                     41 
                           007FFF    42 	MAX_LINENO=0x7fff; BASIC maximum line number 
                                     43 
                           000008    44 	RX_QUEUE_SIZE=8 
                                     45 
                           00F424    46         TIM2_CLK_FREQ=62500
                                     47 
                           000050    48 	TIB_SIZE=80
                           000080    49         PAD_SIZE=BLOCK_SIZE 
                                     50 
                                     51 ;--------------------------------------
                                     52 ;   constantes related to Arduino 
                                     53 ;   API mapping 
                                     54 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                           000000    55         INP=0
                           000001    56         OUTP=1 
                                     57 
                                     58 ;--------------------------------------
                                     59 ;       token attribute
                                     60 ;--------------------------------------
                                     61         ; bits 4:5 identify token group 
                                     62         ; 0x0n -> miscelinous 
                                     63         ; 0x1n -> +|- operators 
                                     64         ; 0x2n -> *|/|% operators
                                     65         ; 0x3n -> relational operators 
                           000080    66         TK_CMD=128      ; BASIC command   
                           000081    67         TK_IFUNC=129    ; BASIC integer function
                           000082    68         TK_CFUNC=130    ; BASIC character function
                           000083    69         TK_CONST=131    ; BASIC constant 
                           000084    70         TK_INTGR=132
                           000085    71         TK_VAR=133
                           000000    72         TK_NONE=0       ; not a token 
                           000002    73         TK_QSTR=2       ; quoted string  
                           000003    74         TK_LABEL=3      ; used for defined, constants, variables
                           000004    75         TK_CHAR=4       ; ASCII character 
                           000005    76         TK_ARRAY=5     ; array variable '@' 
                           000006    77         TK_LPAREN=6     ; left parenthesis '('
                           000007    78         TK_RPAREN=7     ; right parenthesis ')'
                           000008    79         TK_COMMA=8     ; item separator ',' 
                           000009    80         TK_SHARP=9     ; print colon width '#' 
                           00000A    81         TK_COLON=0xa      ; command separator ':' 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
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
                           000056    68     MULDIV_IDX=LSHIFT_IDX+2
                           000058    69     NEXT_IDX=MULDIV_IDX+2
                           00005A    70     NEW_IDX=NEXT_IDX+2
                           00005C    71     NOT_IDX=NEW_IDX+2
                           00005E    72     ODR_IDX=NOT_IDX+2
                           000060    73     OR_IDX=ODR_IDX+2
                           000062    74     PAD_IDX=OR_IDX+2
                           000064    75     PAUSE_IDX=PAD_IDX+2
                           000066    76     PMODE_IDX=PAUSE_IDX+2
                           000068    77     PEEK_IDX=PMODE_IDX+2
                           00006A    78     PINP_IDX=PEEK_IDX+2
                           00006C    79     POKE_IDX=PINP_IDX+2
                           00006E    80     POUT_IDX=POKE_IDX+2
                           000070    81    	PRT_IDX=POUT_IDX+2 ; PRINT commande index 
                           000072    82     PRTA_IDX=PRT_IDX+2
                           000074    83     PRTB_IDX=PRTA_IDX+2
                           000076    84     PRTC_IDX=PRTB_IDX+2
                           000078    85     PRTD_IDX=PRTC_IDX+2
                           00007A    86     PRTE_IDX=PRTD_IDX+2
                           00007C    87     PRTF_IDX=PRTE_IDX+2
                           00007E    88     PRTG_IDX=PRTF_IDX+2
                           000080    89     PRTH_IDX=PRTG_IDX+2
                           000082    90     PRTI_IDX=PRTH_IDX+2
                           000084    91     QKEY_IDX=PRTI_IDX+2
                           000086    92     READ_IDX=QKEY_IDX+2
                           000088    93     RBT_IDX=READ_IDX+2  ; REBOOT
                           00008A    94 	REM_IDX=RBT_IDX+2 ; REMARK command index 
                           00008C    95     REST_IDX=REM_IDX+2 ; RESTORE
                           00008E    96     RET_IDX=REST_IDX+2  ; RETURN 
                           000090    97     RND_IDX=RET_IDX+2 ; RANDOM 
                           000092    98     RSHIFT_IDX=RND_IDX+2
                           000094    99     RUN_IDX=RSHIFT_IDX+2
                           000096   100     SHOW_IDX=RUN_IDX+2
                           000098   101     FREE_IDX=SHOW_IDX+2
                           00009A   102     SLEEP_IDX=FREE_IDX+2
                           00009C   103     SPIRD_IDX=SLEEP_IDX+2
                           00009E   104     SPIEN_IDX=SPIRD_IDX+2
                           0000A0   105     SPISEL_IDX=SPIEN_IDX+2
                           0000A2   106     SPIWR_IDX=SPISEL_IDX+2
                           0000A4   107     STEP_IDX=SPIWR_IDX+2
                           0000A6   108     STOP_IDX=STEP_IDX+2
                           0000A8   109     TICKS_IDX=STOP_IDX+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                           0000AA   110     TIMER_IDX=TICKS_IDX+2
                           0000AC   111     TMROUT_IDX=TIMER_IDX+2  ; TIMEOUT
                           0000AE   112     TO_IDX=TMROUT_IDX+2
                           0000B0   113     TONE_IDX=TO_IDX+2
                           0000B2   114     UBOUND_IDX=TONE_IDX+2
                           0000B4   115     UFLASH_IDX=UBOUND_IDX+2
                           0000B6   116     UNTIL_IDX=UFLASH_IDX+2
                           0000B8   117     USR_IDX=UNTIL_IDX+2
                           0000BA   118     WAIT_IDX=USR_IDX+2
                           0000BC   119     WORDS_IDX=WAIT_IDX+2
                           0000BE   120     WRITE_IDX=WORDS_IDX+2
                           0000C0   121     XOR_IDX=WRITE_IDX+2
                           0000C2   122     SIZE_IDX=XOR_IDX+2 
                           0000C4   123     ON_IDX=SIZE_IDX+2 
                           0000C6   124     GET_IDX=ON_IDX+2
                           0000C8   125     CONST_IDX=GET_IDX+2
                           0000CA   126     EEFREE_IDX=CONST_IDX+2 
                                    127      
                                    128         
                                    129 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                                     33 	.include "dbg_macros.inc" 
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
                           000000    26     DEBUG=0
                                     27     
                                     28     .macro _dbg 
                                     29     DEBUG=1
                                     30     .endm
                                     31 
                                     32     .macro _nodbg
                                     33     DEBUG=0
                                     34     .endm 
                                     35 
                           000006    36     DBG_CC=6
                           000005    37     DBG_A=5 
                           000003    38     DBG_X=3 
                           000001    39     DBG_Y=1 
                                     40     .macro _dbg_save_regs 
                                     41     .if DEBUG
                                     42     push cc ; (6,sp)
                                     43     push a   ; (5,sp)
                                     44     pushw x  ; (3,sp)
                                     45     pushw y  ; (1,sp)
                                     46     .endif 
                                     47     .endm 
                                     48 
                                     49     .macro _dbg_restore_regs 
                                     50     .if DEBUG 
                                     51     popw y 
                                     52     popw x 
                                     53     pop a 
                                     54     pop cc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                     55     .endif 
                                     56     .endm 
                                     57 
                                     58     .macro _dbg_getc 
                                     59     .if DEBUG 
                                     60     _dbg_save_regs 
                                     61     call getc
                                     62     ld (DBG_A,sp),a 
                                     63     _dbg_restore_regs  
                                     64     .endif
                                     65     .endm 
                                     66 
                                     67     .macro _dbg_putc 
                                     68     .if DEBUG
                                     69     push cc 
                                     70     call putc 
                                     71     pop cc 
                                     72     .endif 
                                     73     .endm 
                                     74 
                                     75     .macro _dbg_puts 
                                     76     .if DEBUG 
                                     77     _dbg_save_regs
                                     78     call puts 
                                     79     _dbg_restore_regs
                                     80     .endif 
                                     81     .endm 
                                     82 
                                     83     .macro _dbg_prti24 
                                     84     .if DEBUG 
                                     85     _dbg_save_regs
                                     86     call prti24 
                                     87     _dbg_restore_regs
                                     88     .endif
                                     89     .endm 
                                     90 
                                     91     .macro _dbg_prt_regs
                                     92     .if DEBUG
                                     93     call prt_regs 
                                     94     .endif 
                                     95     .endm 
                                     96 
                                     97     .macro _dbg_peek addr 
                                     98     .if DEBUG
                                     99     _dbg_save_regs 
                                    100     ldw x,addr 
                                    101     call peek     
                                    102     _dbg_restore_regs
                                    103     .endif 
                                    104     .endm 
                                    105 
                                    106     .macro _dbg_parser_init 
                                    107     .if DEBUG 
                                    108     _dbg_save_regs
                                    109     call parser_init 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                    110     _dbg_restore_regs
                                    111     .endif
                                    112     .endm
                                    113 
                                    114     .macro _dbg_readln
                                    115     .if DEBUG 
                                    116     _dbg_save_regs
                                    117     call readln
                                    118     _dbg_restore_regs
                                    119     .endif
                                    120     .endm
                                    121 
                                    122     .macro _dbg_number
                                    123     .if DEBUG 
                                    124     _dbg_save_regs
                                    125     call number 
                                    126     _dbg_restore_regs
                                    127     .endif
                                    128     .endm  
                                    129 
                                    130     .macro _dbg_nextword
                                    131     .if DEBUG 
                                    132     _dbg_save_regs
                                    133     call get_token   
                                    134     _dbg_restore_regs
                                    135     .endif
                                    136     .endm  
                                    137 
                                    138     .macro _dbg_dots 
                                    139     .if DEBUG 
                                    140     _dbg_save_regs
                                    141     call dots 
                                    142     _dbg_restore_regs
                                    143     .endif 
                                    144     .endm 
                                    145 
                                    146     .macro _dbg_trap
                                    147     .if DEBUG 
                                    148     bset flags,#FTRAP 
                                    149     trap 
                                    150     .endif 
                                    151     .endm 
                                    152 
                                    153     .macro _dbg_mark n  
                                    154     .if DEBUG 
                                    155     push cc
                                    156     push a 
                                    157     ld a,#n 
                                    158     call putc
                                    159     btjf UART1_SR,#UART_SR_TC,. 
                                    160     pop a 
                                    161     pop cc 
                                    162     .endif 
                                    163     .endm 
                                    164     
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                    165     .macro _dbg_prt_var var 
                                    166     .if DEBUG
                                    167     _dbg_save_regs 
                                    168     ldw x,var 
                                    169     ldw acc16,x 
                                    170     clr acc24 
                                    171     clrw x 
                                    172     ld a,#16+128  
                                    173     call prti24
                                    174     ld a,#CR 
                                    175     call putc  
                                    176     _dbg_restore_regs 
                                    177     .endif 
                                    178     .endm 
                                    179 
                                    180     .macro _dbg_show 
                                    181     .if DEBUG 
                                    182     _dbg_save_regs 
                                    183     call show 
                                    184     _dbg_restore_regs
                                    185     .endif
                                    186     .endm 
                                    187 
                                    188 
                                    189 
                                    190 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                     34   
                                     35 
                                     36 ;;-----------------------------------
                                     37     .area SSEG (ABS)
                                     38 ;; working buffers and stack at end of RAM. 	
                                     39 ;;-----------------------------------
      001690                         40     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE 
      001690                         41 tib:: .ds TIB_SIZE             ; transaction input buffer
      0016E0                         42 block_buffer::                 ; use to write FLASH block (alias for pad )
      0016E0                         43 pad:: .ds PAD_SIZE             ; working buffer
      001760                         44 stack_full:: .ds STACK_SIZE   ; control stack 
      001800                         45 stack_unf: ; stack underflow ; control_stack bottom 
                                     46 
                                     47 ;;--------------------------------------
                                     48     .area HOME 
                                     49 ;; interrupt vector table at 0x8000
                                     50 ;;--------------------------------------
      008000 82 00 8F 88             51     int cold_start			; RESET vector 
                           000000    52 .if DEBUG
                                     53 	int TrapHandler 		;TRAP  software interrupt
                           000001    54 .else
      008004 82 00 80 80             55 	int NonHandledInterrupt ;TRAP  software interrupt
                                     56 .endif
      008008 82 00 80 80             57 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 84             58 	int AWUHandler          ;int1 AWU   auto wake up from halt
      008010 82 00 80 80             59 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 80             60 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 80             61 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 80             62 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 80             63 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 A7             64 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
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
      008050 82 00 83 40             75 	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
      008054 82 00 80 80             76 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 80             77 	int NonHandledInterrupt ;int20 UART3 TX completed
      00805C 82 00 80 80             78 	int NonHandledInterrupt ;int21 UART3 RX full
      008060 82 00 80 80             79 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 92             80 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
      008068 82 00 80 80             81 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 80             82 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 80             83 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 80             84 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 80             85 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 80             86 	int NonHandledInterrupt ;int29  not used
                                     87 
                                     88 ;---------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                     89     .area CODE
                                     90 ;---------------------------------------
                                     91 
                                     92 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     93 ; non handled interrupt 
                                     94 ; reset MCU
                                     95 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008080                         96 NonHandledInterrupt:
      000000                         97 	_swreset 
      008080 35 80 50 D1      [ 1]    1     mov WWDG_CR,#0X80
                                     98 
                                     99 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    100 ; auto wakeup from halt
                                    101 ; at iret, program continue 
                                    102 ; after hatl instruction
                                    103 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008084                        104 AWUHandler:
      008084 72 19 50 F0      [ 1]  105 	bres AWU_CSR,#AWU_CSR_AWUEN
      008088 55 00 3F 50 F1   [ 1]  106 	mov AWU_APR,0x3F
      00808D 72 5F 50 F2      [ 1]  107 	clr AWU_TBR 
      008091 80               [11]  108 	iret
                                    109 
                                    110 ;------------------------------------
                                    111 ; software interrupt handler  
                                    112 ;------------------------------------
                           000000   113 .if DEBUG 
                                    114 TrapHandler:
                                    115 	bset flags,#FTRAP 
                                    116 	call print_registers
                                    117 	call cmd_itf
                                    118 	bres flags,#FTRAP 	
                                    119 	iret
                                    120 .endif 
                                    121 
                                    122 ;------------------------------
                                    123 ; TIMER 4 is used to maintain 
                                    124 ; a milliseconds 'ticks' counter
                                    125 ; and decrement 'timer' varaiable
                                    126 ;--------------------------------
      008092                        127 Timer4UpdateHandler:
      008092 72 5F 53 42      [ 1]  128 	clr TIM4_SR 
      008096 CE 00 10         [ 2]  129 	ldw x,ticks
      008099 5C               [ 1]  130 	incw x
      00809A CF 00 10         [ 2]  131 	ldw ticks,x 
      00809D CE 00 12         [ 2]  132 	ldw x,timer
                                    133 ;	tnzw x 
      0080A0 27 04            [ 1]  134 	jreq 1$
      0080A2 5A               [ 2]  135 	decw x 
      0080A3 CF 00 12         [ 2]  136 	ldw timer,x 
      0080A6                        137 1$:	
      0080A6 80               [11]  138 	iret 
                                    139 
                                    140 ;------------------------------------
                                    141 ; Triggered by pressing USER UserButton 
                                    142 ; on NUCLEO card.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                                    143 ; This is used to abort a progam lock 
                                    144 ; in infinite loop. 
                                    145 ;------------------------------------
      0080A7                        146 UserButtonHandler:
                                    147 ; wait button release
      0080A7 5F               [ 1]  148 	clrw x
      0080A8 5A               [ 2]  149 1$: decw x 
      0080A9 26 FD            [ 1]  150 	jrne 1$
      0080AB 72 09 50 15 F8   [ 2]  151 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    152 ; if MCU suspended by SLEEP resume program
      0080B0 72 07 00 22 05   [ 2]  153     btjf flags,#FSLEEP,2$
      0080B5 72 17 00 22      [ 1]  154 	bres flags,#FSLEEP 
      0080B9 80               [11]  155 	iret
      0080BA                        156 2$:	
      0080BA                        157 user_interrupted:
      0080BA 72 00 00 22 02   [ 2]  158     btjt flags,#FRUN,4$
      0080BF 20 0A            [ 2]  159 	jra UBTN_Handler_exit 
      0080C1                        160 4$:	; program interrupted by user 
      0080C1 72 11 00 22      [ 1]  161 	bres flags,#FRUN 
      0080C5 AE 80 DE         [ 2]  162 	ldw x,#USER_ABORT
      0080C8 CD 84 0F         [ 4]  163 	call puts 
      0080CB                        164 UBTN_Handler_exit:
      0080CB AE 17 FF         [ 2]  165     ldw x,#STACK_EMPTY 
      0080CE 94               [ 1]  166     ldw sp,x
      0080CF 9A               [ 1]  167 	rim 
      0080D0 CE 00 1B         [ 2]  168 	ldw x,txtbgn 
      0080D3 A3 AE 80         [ 2]  169 	cpw x,#app_space 
      0080D6 22 03            [ 1]  170 	jrugt 5$
      0080D8 CD 90 7D         [ 4]  171 	call clear_basic 
      0080DB CC 92 99         [ 2]  172 5$:	jp warm_start
                                    173 
      0080DE 0A 50 72 6F 67 72 61   174 USER_ABORT: .asciz "\nProgram aborted by user.\n"
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
      0080F9                        188 clock_init:	
      0080F9 C1 50 C3         [ 1]  189 	cp a,CLK_CMSR 
      0080FC 27 0C            [ 1]  190 	jreq 2$ ; no switching required 
                                    191 ; select clock source 
      0080FE 72 12 50 C5      [ 1]  192 	bset CLK_SWCR,#CLK_SWCR_SWEN
      008102 C7 50 C4         [ 1]  193 	ld CLK_SWR,a
      008105 C1 50 C3         [ 1]  194 1$:	cp a,CLK_CMSR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008108 26 FB            [ 1]  195 	jrne 1$
      00810A                        196 2$: 	
                                    197 ; HSI and cpu clock divisor 
      00810A 9F               [ 1]  198 	ld a,xl 
      00810B C7 50 C6         [ 1]  199 	ld CLK_CKDIVR,a  
      00810E 81               [ 4]  200 	ret
                                    201 
                                    202 ;----------------------------------
                                    203 ; TIMER2 used as audio tone output 
                                    204 ; on port D:5.
                                    205 ; channel 1 configured as PWM mode 1 
                                    206 ;-----------------------------------  
                                    207 
      00810F                        208 timer2_init:
      00810F 72 1A 50 C7      [ 1]  209 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      008113 35 60 53 05      [ 1]  210  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      008117 35 08 53 0C      [ 1]  211 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      00811B 81               [ 4]  212 	ret 
                                    213 
                                    214 ;---------------------------------
                                    215 ; TIM4 is configured to generate an 
                                    216 ; interrupt every millisecond 
                                    217 ;----------------------------------
      00811C                        218 timer4_init:
      00811C 72 18 50 C7      [ 1]  219 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      008120 35 07 53 45      [ 1]  220 	mov TIM4_PSCR,#7 ; prescale 128  
      008124 35 7D 53 46      [ 1]  221 	mov TIM4_ARR,#125 ; set for 1msec.
      008128 35 05 53 40      [ 1]  222 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00812C 72 10 53 41      [ 1]  223 	bset TIM4_IER,#TIM4_IER_UIE
      008130 81               [ 4]  224 	ret
                                    225 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
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
                                     19 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     20 ;;  debugging support code 
                                     21 ;;  assembled only when DEBUG=1
                                     22 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     23 
                                     24 
                           000001    25     DEBUG=1 
                                     26 
                           000001    27     .if DEBUG 
                                     28 
                                     29     .macro _reg_name name  
                                     30     ld a,#name 
                                     31     call putc 
                                     32     ld a,#'=
                                     33     call putc 
                                     34     .endm 
                                     35 
                                     36     .area CODE 
                                     37 
      008131                         38     prt_regs:
      0000B1                         39     _dbg_save_regs 
                           000001     1     .if DEBUG
      008131 8A               [ 1]    2     push cc ; (6,sp)
      008132 88               [ 1]    3     push a   ; (5,sp)
      008133 89               [ 2]    4     pushw x  ; (3,sp)
      008134 90 89            [ 2]    5     pushw y  ; (1,sp)
                                      6     .endif 
      008136 35 10 00 0B      [ 1]   40     mov base,#16
      00813A A6 0D            [ 1]   41     ld a,#CR 
      00813C CD 83 B2         [ 4]   42     call putc 
                                     43 ; print CC 
      0000BF                         44     _reg_name 'C 
      00813F A6 43            [ 1]    1     ld a,#'C 
      008141 CD 83 B2         [ 4]    2     call putc 
      008144 A6 3D            [ 1]    3     ld a,#'=
      008146 CD 83 B2         [ 4]    4     call putc 
      008149 7B 06            [ 1]   45     ld a,(DBG_CC,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      00814B 5F               [ 1]   46     clrw x 
      00814C 97               [ 1]   47     ld xl,a 
      00814D CD 93 58         [ 4]   48     call print_int  
                                     49 ; print A 
      0000D0                         50     _reg_name 'A 
      008150 A6 41            [ 1]    1     ld a,#'A 
      008152 CD 83 B2         [ 4]    2     call putc 
      008155 A6 3D            [ 1]    3     ld a,#'=
      008157 CD 83 B2         [ 4]    4     call putc 
      00815A 7B 05            [ 1]   51     ld a,(DBG_A,SP)
      00815C 5F               [ 1]   52     clrw x 
      00815D 97               [ 1]   53     ld xl,a  
      00815E CD 93 58         [ 4]   54     call print_int
                                     55 ; print Y 
      0000E1                         56     _reg_name 'Y 
      008161 A6 59            [ 1]    1     ld a,#'Y 
      008163 CD 83 B2         [ 4]    2     call putc 
      008166 A6 3D            [ 1]    3     ld a,#'=
      008168 CD 83 B2         [ 4]    4     call putc 
      00816B 1E 01            [ 2]   57     ldw x,(DBG_Y,sp)
      00816D CD 93 58         [ 4]   58     call print_int     
                                     59 ; print X 
      0000F0                         60     _reg_name 'X 
      008170 A6 58            [ 1]    1     ld a,#'X 
      008172 CD 83 B2         [ 4]    2     call putc 
      008175 A6 3D            [ 1]    3     ld a,#'=
      008177 CD 83 B2         [ 4]    4     call putc 
      00817A 1E 03            [ 2]   61     ldw x,(DBG_X,sp)
      00817C CD 93 58         [ 4]   62     call print_int 
      00817F 35 0A 00 0B      [ 1]   63     mov base,#10
      000103                         64     _dbg_restore_regs      
                           000001     1     .if DEBUG 
      008183 90 85            [ 2]    2     popw y 
      008185 85               [ 2]    3     popw x 
      008186 84               [ 1]    4     pop a 
      008187 86               [ 1]    5     pop cc 
                                      6     .endif 
      008188 81               [ 4]   65     ret 
                                     66 
                                     67    .endif ; DEBUG 
                                     68 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                     27     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000000     5 SEPARATE=0 ; set to 1 for 'make separate' 
                                      6 
                                      7 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
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
      008189                         45 unlock_eeprom:
      008189 72 06 50 5F 15   [ 2]   46 	btjt FLASH_IAPSR,#FLASH_IAPSR_DUL,9$
      00818E 35 00 50 5B      [ 1]   47 	mov FLASH_CR2,#0 
      008192 35 FF 50 5C      [ 1]   48 	mov FLASH_NCR2,#0xFF 
      008196 35 AE 50 64      [ 1]   49 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      00819A 35 56 50 64      [ 1]   50     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00819E 72 07 50 5F FB   [ 2]   51 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      0081A3 81               [ 4]   52 9$:	ret
                                     53 
                                     54 ;----------------------------------
                                     55 ; unlock FLASH for writing/erasing
                                     56 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                     57 ; input:
                                     58 ;  none
                                     59 ; output:
                                     60 ;  none
                                     61 ;----------------------------------
      0081A4                         62 unlock_flash:
      0081A4 72 02 50 5F 15   [ 2]   63 	btjt FLASH_IAPSR,#FLASH_IAPSR_PUL,9$
      0081A9 35 00 50 5B      [ 1]   64 	mov FLASH_CR2,#0 
      0081AD 35 FF 50 5C      [ 1]   65 	mov FLASH_NCR2,#0xFF 
      0081B1 35 56 50 62      [ 1]   66 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      0081B5 35 AE 50 62      [ 1]   67 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      0081B9 72 03 50 5F FB   [ 2]   68 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      0081BE 81               [ 4]   69 9$:	ret
                                     70 
                                     71 ;----------------------------
                                     72 ; erase block code must be 
                                     73 ; executed from RAM
                                     74 ; input:
                                     75 ;-----------------------------
      0081BF                         76 row_erase:
      0081BF 88               [ 1]   77 	push a 
      0081C0 90 89            [ 2]   78 	pushw y 
      0081C2 35 20 50 5B      [ 1]   79 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      0081C6 35 DF 50 5C      [ 1]   80 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      0081CA 4F               [ 1]   81 	clr a 
      0081CB 90 5F            [ 1]   82 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      0081CD 91 A7 00 18      [ 1]   83 	ldf ([farptr],y),a
      0081D1 90 5C            [ 1]   84     incw y
      0081D3 91 A7 00 18      [ 1]   85 	ldf ([farptr],y),a
      0081D7 90 5C            [ 1]   86     incw y
      0081D9 91 A7 00 18      [ 1]   87 	ldf ([farptr],y),a
      0081DD 90 5C            [ 1]   88     incw y
      0081DF 91 A7 00 18      [ 1]   89 	ldf ([farptr],y),a
      0081E3 72 05 50 5F FB   [ 2]   90 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      0081E8 90 85            [ 2]   91 	popw y 
      0081EA 84               [ 1]   92 	pop a 
      0081EB 81               [ 4]   93 	ret
      0081EC                         94 row_erase_end:
                                     95 
                                     96 ; copy erase_start in RAM 
      0081EC                         97 move_erase_to_ram:
      0081EC 89               [ 2]   98 	pushw x 
      0081ED 90 89            [ 2]   99 	pushw y 
      0081EF AE 81 EC         [ 2]  100 	ldw x,#row_erase_end 
      0081F2 1D 81 BF         [ 2]  101 	subw x,#row_erase
      0081F5 CF 00 0E         [ 2]  102 	ldw acc16,x 
      0081F8 AE 16 90         [ 2]  103 	ldw x,#tib 
      0081FB 90 AE 81 BF      [ 2]  104 	ldw y,#row_erase 
      0081FF CD 8E EF         [ 4]  105 	call move
      008202 90 85            [ 2]  106 	popw y
      008204 85               [ 2]  107 	popw x
      008205 81               [ 4]  108 	ret 
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
      008206                        123 program_row:
      008206 88               [ 1]  124 	push a 
      008207 90 89            [ 2]  125 	pushw y 
      008209 4B 80            [ 1]  126 	push #BLOCK_SIZE  
                                    127 ;enable block programming 
      00820B 72 10 50 5B      [ 1]  128 	bset FLASH_CR2,#FLASH_CR2_PRG 
      00820F 72 11 50 5C      [ 1]  129 	bres FLASH_NCR2,#FLASH_CR2_PRG
      008213 90 5F            [ 1]  130 	clrw y 
      008215 F6               [ 1]  131 1$:	ld a,(x)
      008216 91 A7 00 18      [ 1]  132 	ldf ([farptr],y),a
      00821A 5C               [ 1]  133 	incw x 
      00821B 90 5C            [ 1]  134 	incw y 
      00821D 0A 01            [ 1]  135 	dec (BCNT,sp)
      00821F 26 F4            [ 1]  136 	jrne 1$
                                    137 ; wait EOP bit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008221 72 05 50 5F FB   [ 2]  138 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      0001A6                        139 	_drop 1 
      008226 5B 01            [ 2]    1     addw sp,#1 
      008228 90 85            [ 2]  140 	popw y 
      00822A 84               [ 1]  141 	pop a 
      00822B 81               [ 4]  142 	ret 
      00822C                        143 program_row_end:
                                    144 
                                    145 ;-------------------------
                                    146 ; move program_row to RAM 
                                    147 ; at txtubound address 
                                    148 ;------------------------
      00822C                        149 move_prg_to_ram:
      00822C 89               [ 2]  150 	pushw x 
      00822D 90 89            [ 2]  151 	pushw y 
      00822F AE 82 2C         [ 2]  152 	ldw x,#program_row_end 
      008232 1D 82 06         [ 2]  153 	subw x,#program_row 
      008235 CF 00 0E         [ 2]  154 	ldw acc16,x ; bytes to move 
      008238 AE 16 90         [ 2]  155 	ldw x,#tib ; destination address 
      00823B 90 AE 82 06      [ 2]  156 	ldw y,#program_row ; source address 
      00823F CD 8E EF         [ 4]  157 	call move
      008242 90 85            [ 2]  158 	popw y 
      008244 85               [ 2]  159 	popw x  
      008245 81               [ 4]  160 	ret 
                                    161 
                                    162 
                                    163 ;-----------------------------
                                    164 ; write a buffer in FLASH/EEPROM 
                                    165 ; input:
                                    166 ;    farptr   destination address 
                                    167 ;    x        buffer address 
                                    168 ;-----------------------------
      008246                        169 write_buffer:
      008246 89               [ 2]  170 	pushw x 
      008247 72 5D 00 18      [ 1]  171 	tnz farptr 
      00824B 26 0D            [ 1]  172 	jrne to_flash 
      00824D CE 00 19         [ 2]  173 	ldw x,farptr+1 
      008250 A3 AE 80         [ 2]  174 	cpw x,#app_space  
      008253 24 05            [ 1]  175 	jruge to_flash 
      008255                        176 to_eeprom:
      008255 CD 81 89         [ 4]  177 	call unlock_eeprom
      008258 20 03            [ 2]  178 	jra do_programming
      00825A                        179 to_flash:
      00825A CD 81 A4         [ 4]  180 	call unlock_flash
      00825D                        181 do_programming:
      00825D 85               [ 2]  182 	popw x 
      00825E CD 16 90         [ 4]  183 	call tib
      008261 72 13 50 5F      [ 1]  184 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      008265 72 17 50 5F      [ 1]  185 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      008269 81               [ 4]  186 	ret 
                                    187 
                                    188 
                                    189 ;-----------------------------------
                                    190 ; erase flash or EEPROM block
                                    191 ; a block is 128 bytes 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                    192 ; input:
                                    193 ;   farptr  address row begin
                                    194 ; output:
                                    195 ;   none
                                    196 ;--------------------------------------
      00826A                        197 block_erase:
      00826A 89               [ 2]  198 	pushw x 
      00826B CE 00 19         [ 2]  199 	ldw x,farptr+1
      00826E A3 AE 80         [ 2]  200 	cpw x,#app_space 
      008271 24 0C            [ 1]  201 	jruge erase_flash 
                                    202 ; erase eeprom block
      008273 CD 81 89         [ 4]  203 	call unlock_eeprom 
      008276 CD 16 90         [ 4]  204 	call tib 
      008279 72 17 50 5F      [ 1]  205 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      00827D 20 0A            [ 2]  206 	jra erase_exit  
                                    207 ; erase flash block:
      00827F                        208 erase_flash:
      00827F CD 81 A4         [ 4]  209 	call unlock_flash 
      008282 CD 16 90         [ 4]  210 	call tib 
      008285 72 13 50 5F      [ 1]  211     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008289                        212 erase_exit: 
      008289 85               [ 2]  213 	popw x 
      00828A 81               [ 4]  214 	ret 
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
      00828B                        230 write_byte:
      00828B 90 89            [ 2]  231 	pushw y
      00020D                        232 	_vars VSIZE
      00828D 52 02            [ 2]    1     sub sp,#VSIZE 
      00828F 6B 01            [ 1]  233 	ld (BTW,sp),a ; byte to write 
      008291 0F 02            [ 1]  234 	clr (OPT,sp)  ; OPTION flag
                                    235 ; put addr[15:0] in Y, for bounds check.
      008293 90 CE 00 19      [ 2]  236 	ldw y,farptr+1   ; Y=addr15:0
                                    237 ; check addr[23:16], if <> 0 then it is extened flash memory
      008297 72 5D 00 18      [ 1]  238 	tnz farptr 
      00829B 26 14            [ 1]  239 	jrne write_flash
      00829D 90 A3 AE 80      [ 2]  240     cpw y,#app_space 	 
      0082A1 24 0E            [ 1]  241     jruge write_flash
      0082A3 90 A3 40 00      [ 2]  242 	cpw y,#EEPROM_BASE  
      0082A7 25 57            [ 1]  243     jrult write_exit
      0082A9 90 A3 48 7F      [ 2]  244 	cpw y,#OPTION_END 
      0082AD 22 51            [ 1]  245 	jrugt write_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      0082AF 20 16            [ 2]  246 	jra write_eeprom 
                                    247 ; write program memory
      0082B1                        248 write_flash:
      0082B1 CD 81 A4         [ 4]  249 	call unlock_flash 
      0082B4 9B               [ 1]  250 1$:	sim 
      0082B5 7B 01            [ 1]  251 	ld a,(BTW,sp)
      0082B7 92 A7 00 18      [ 4]  252 	ldf ([farptr],x),a ; farptr[x]=A
      0082BB 72 05 50 5F FB   [ 2]  253 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0082C0 9A               [ 1]  254     rim 
      0082C1 72 13 50 5F      [ 1]  255     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0082C5 20 39            [ 2]  256     jra write_exit
                                    257 ; write eeprom and option
      0082C7                        258 write_eeprom:
      0082C7 CD 81 89         [ 4]  259 	call unlock_eeprom
                                    260 	; check for data eeprom or option eeprom
      0082CA 90 A3 48 00      [ 2]  261 	cpw y,#OPTION_BASE
      0082CE 2B 08            [ 1]  262 	jrmi 1$
      0082D0 90 A3 48 80      [ 2]  263 	cpw y,#OPTION_END+1
      0082D4 2A 02            [ 1]  264 	jrpl 1$
      0082D6 03 02            [ 1]  265 	cpl (OPT,sp)
      0082D8                        266 1$: 
      0082D8 0D 02            [ 1]  267     tnz (OPT,sp)
      0082DA 27 08            [ 1]  268     jreq 2$
                                    269 	; pour modifier une option il faut modifier ces 2 bits
      0082DC 72 1E 50 5B      [ 1]  270     bset FLASH_CR2,#FLASH_CR2_OPT
      0082E0 72 1F 50 5C      [ 1]  271     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0082E4                        272 2$: 
      0082E4 7B 01            [ 1]  273     ld a,(BTW,sp)
      0082E6 92 A7 00 18      [ 4]  274     ldf ([farptr],x),a
      0082EA 0D 02            [ 1]  275     tnz (OPT,sp)
      0082EC 27 08            [ 1]  276     jreq 3$
      0082EE 5C               [ 1]  277     incw x
      0082EF 7B 01            [ 1]  278     ld a,(BTW,sp)
      0082F1 43               [ 1]  279     cpl a
      0082F2 92 A7 00 18      [ 4]  280     ldf ([farptr],x),a
      0082F6 72 05 50 5F FB   [ 2]  281 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0082FB 72 0D 50 5F FB   [ 2]  282 	btjf FLASH_IAPSR,#FLASH_IAPSR_HVOFF,.
      008300                        283 write_exit:
      000280                        284 	_drop VSIZE 
      008300 5B 02            [ 2]    1     addw sp,#VSIZE 
      008302 90 85            [ 2]  285 	popw y
      008304 81               [ 4]  286     ret
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                    300 ;  farptr   point after block
                                    301 ;---------------------------------------------
      008305                        302 	_argofs 3 
                           000005     1     ARG_OFS=2+3 
      000285                        303 	_arg BSIZE 1  ; block size
                           000006     1     BSIZE=ARG_OFS+1 
                                    304 	; local var 
                           000001   305 	XSAVE=1 
                           000002   306 	VSIZE=2 
      000285                        307 write_block::
      008305 88               [ 1]  308 	push a 
      000286                        309 	_vars VSIZE
      008306 52 02            [ 2]    1     sub sp,#VSIZE 
      008308 1F 01            [ 2]  310 	ldw (XSAVE,sp),x 
      00830A 1E 06            [ 2]  311 	ldw x,(BSIZE,sp) 
      00830C 27 13            [ 1]  312 	jreq 9$
      00830E 1E 01            [ 2]  313 1$:	ldw x,(XSAVE,sp)
      008310 90 F6            [ 1]  314 	ld a,(y)
      008312 CD 82 8B         [ 4]  315 	call write_byte 
      008315 5C               [ 1]  316 	incw x 
      008316 90 5C            [ 1]  317 	incw y 
      008318 1F 01            [ 2]  318 	ldw (XSAVE,sp),x
      00831A 1E 06            [ 2]  319 	ldw x,(BSIZE,sp)
      00831C 5A               [ 2]  320 	decw x
      00831D 1F 06            [ 2]  321 	ldw (BSIZE,sp),x 
      00831F 26 ED            [ 1]  322 	jrne 1$
      008321                        323 9$:
      008321 1E 01            [ 2]  324 	ldw x,(XSAVE,sp)
      008323 CD A2 1C         [ 4]  325 	call incr_farptr
      0002A6                        326 	_drop VSIZE
      008326 5B 02            [ 2]    1     addw sp,#VSIZE 
      008328 84               [ 1]  327 	pop a 
      008329 81               [ 4]  328 	ret 
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
      00832A                        345 write_nbytes:
      00832A 90 89            [ 2]  346 	pushw y
      00832C 88               [ 1]  347 	push a 
      00832D 90 93            [ 1]  348 	ldw y,x
      00832F 5F               [ 1]  349 	clrw x 
      008330                        350 1$:  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008330 90 F6            [ 1]  351 	ld a,(y)
      008332 90 5C            [ 1]  352 	incw y
      008334 CD 82 8B         [ 4]  353 	call write_byte 
      008337 5C               [ 1]  354 	incw x 
      008338 0A 01            [ 1]  355 	dec (1,sp)  
      00833A 26 F4            [ 1]  356 	jrne 1$ 
      00833C 84               [ 1]  357 9$: pop a 
      00833D 90 85            [ 2]  358 	popw y 
      00833F 81               [ 4]  359 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                     32     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000000     5 SEPARATE=0 ; set to 1 for 'make separate' 
                                      6 
                                      7 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
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
      008340                         66 Uart1RxHandler: ; console receive char 
      008340 72 0B 52 30 27   [ 2]   67 	btjf UART1_SR,#UART_SR_RXNE,5$
      008345 C6 52 31         [ 1]   68 	ld a,UART1_DR 
      008348 A1 03            [ 1]   69 	cp a,#CTRL_C 
      00834A 26 06            [ 1]   70 	jrne 2$
      00834C CD 83 B2         [ 4]   71 	call putc 
      00834F CC 80 BA         [ 2]   72 	jp user_interrupted
      008352                         73 2$:
      008352 A1 18            [ 1]   74 	cp a,#CAN ; CTRL_X 
      008354 26 03            [ 1]   75 	jrne 3$
      008356 CC 8F 88         [ 2]   76 	jp cold_start 	
      008359 88               [ 1]   77 3$:	push a 
      00835A A6 26            [ 1]   78 	ld a,#rx1_queue 
      00835C CB 00 2F         [ 1]   79 	add a,rx1_tail 
      00835F 5F               [ 1]   80 	clrw x 
      008360 97               [ 1]   81 	ld xl,a 
      008361 84               [ 1]   82 	pop a 
      008362 F7               [ 1]   83 	ld (x),a 
      008363 C6 00 2F         [ 1]   84 	ld a,rx1_tail 
      008366 4C               [ 1]   85 	inc a 
      008367 A4 07            [ 1]   86 	and a,#RX_QUEUE_SIZE-1
      008369 C7 00 2F         [ 1]   87 	ld rx1_tail,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      00836C 80               [11]   88 5$:	iret 
                                     89 
                                     90 ;---------------------------------------------
                                     91 ; initialize UART1, 115200 8N1
                                     92 ; input:
                                     93 ;	none
                                     94 ; output:
                                     95 ;   none
                                     96 ;---------------------------------------------
      00836D                         97 uart1_init:
      00836D 72 1A 50 02      [ 1]   98     bset PA_DDR,#UART1_TX_PIN
      008371 72 1A 50 03      [ 1]   99     bset PA_CR1,#UART1_TX_PIN 
      008375 72 1A 50 04      [ 1]  100     bset PA_CR2,#UART1_TX_PIN 
                                    101 ; enable UART1 clock
      008379 72 14 50 C7      [ 1]  102 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      00837D                        103 uart1_set_baud: 
      00837D 88               [ 1]  104 	push a 
                                    105 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    106 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      00837E A6 E1            [ 1]  107 	ld a,#CLK_SWR_HSI
      008380 C1 50 C3         [ 1]  108 	cp a,CLK_CMSR 
      008383 27 0A            [ 1]  109 	jreq 2$ 
      008385                        110 1$: ; 8 Mhz 	
      008385 35 05 52 33      [ 1]  111 	mov UART1_BRR2,#0x05 ; must be loaded first
      008389 35 04 52 32      [ 1]  112 	mov UART1_BRR1,#0x4
      00838D 20 08            [ 2]  113 	jra 3$
      00838F                        114 2$: ; 16 Mhz 	
      00838F 35 0B 52 33      [ 1]  115 	mov UART1_BRR2,#0x0b ; must be loaded first
      008393 35 08 52 32      [ 1]  116 	mov UART1_BRR1,#0x08
      008397                        117 3$:
      008397 72 5F 52 31      [ 1]  118     clr UART1_DR
      00839B 35 2C 52 35      [ 1]  119 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      00839F 72 10 52 35      [ 1]  120 	bset UART1_CR2,#UART_CR2_SBK
      0083A3 72 0D 52 30 FB   [ 2]  121     btjf UART1_SR,#UART_SR_TC,.
      0083A8 72 5F 00 2E      [ 1]  122     clr rx1_head 
      0083AC 72 5F 00 2F      [ 1]  123 	clr rx1_tail
      0083B0 84               [ 1]  124 	pop a  
      0083B1 81               [ 4]  125 	ret
                                    126 
                                    127 ;---------------------------------
                                    128 ; uart1_putc
                                    129 ; send a character via UART1
                                    130 ; input:
                                    131 ;    A  	character to send
                                    132 ;---------------------------------
      0083B2                        133 putc:: ; console output always on UART1
      0083B2                        134 uart1_putc:: 
      0083B2 72 0F 52 30 FB   [ 2]  135 	btjf UART1_SR,#UART_SR_TXE,.
      0083B7 C7 52 31         [ 1]  136 	ld UART1_DR,a 
      0083BA 81               [ 4]  137 	ret 
                                    138 
                                    139 
                                    140 ;---------------------------------
                                    141 ; Query for character in rx1_queue
                                    142 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                    143 ;   none 
                                    144 ; output:
                                    145 ;   A     0 no charcter available
                                    146 ;   Z     1 no character available
                                    147 ;---------------------------------
      0083BB                        148 qgetc::
      0083BB                        149 uart1_qgetc::
      0083BB C6 00 2E         [ 1]  150 	ld a,rx1_head 
      0083BE C0 00 2F         [ 1]  151 	sub a,rx1_tail 
      0083C1 81               [ 4]  152 	ret 
                                    153 
                                    154 ;---------------------------------
                                    155 ; wait character from UART1 
                                    156 ; input:
                                    157 ;   none
                                    158 ; output:
                                    159 ;   A 			char  
                                    160 ;--------------------------------	
      0083C2                        161 getc:: ;console input
      0083C2                        162 uart1_getc::
      0083C2 CD 83 BB         [ 4]  163 	call uart1_qgetc
      0083C5 27 FB            [ 1]  164 	jreq uart1_getc 
      0083C7 89               [ 2]  165 	pushw x 
                                    166 ;; rx1_queue must be in page 0 	
      0083C8 A6 26            [ 1]  167 	ld a,#rx1_queue
      0083CA CB 00 2E         [ 1]  168 	add a,rx1_head 
      0083CD 5F               [ 1]  169 	clrw x  
      0083CE 97               [ 1]  170 	ld xl,a 
      0083CF F6               [ 1]  171 	ld a,(x)
      0083D0 88               [ 1]  172 	push a
      0083D1 C6 00 2E         [ 1]  173 	ld a,rx1_head 
      0083D4 4C               [ 1]  174 	inc a 
      0083D5 A4 07            [ 1]  175 	and a,#RX_QUEUE_SIZE-1
      0083D7 C7 00 2E         [ 1]  176 	ld rx1_head,a 
      0083DA 84               [ 1]  177 	pop a  
      0083DB 85               [ 2]  178 	popw x
      0083DC 81               [ 4]  179 	ret 
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
      0083DD 43 81 44 80 48 82 46   194 convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',KEY_END,'3',SUP,0,0
             83 33 84 00 00
                                    195 
                                    196 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
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
      0083E9                        207 get_escape:
      0083E9 CD 83 C2         [ 4]  208     call getc 
      0083EC A1 5B            [ 1]  209     cp a,#'[ ; this character is expected after ESC 
      0083EE 27 02            [ 1]  210     jreq 1$
      0083F0 4F               [ 1]  211     clr a
      0083F1 81               [ 4]  212     ret
      0083F2 CD 83 C2         [ 4]  213 1$: call getc 
      0083F5 AE 83 DD         [ 2]  214     ldw x,#convert_table
      0083F8                        215 2$:
      0083F8 F1               [ 1]  216     cp a,(x)
      0083F9 27 08            [ 1]  217     jreq 4$
      0083FB 1C 00 02         [ 2]  218     addw x,#2
      0083FE 7D               [ 1]  219     tnz (x)
      0083FF 26 F7            [ 1]  220     jrne 2$
      008401 4F               [ 1]  221     clr a
      008402 81               [ 4]  222     ret 
      008403 5C               [ 1]  223 4$: incw x 
      008404 F6               [ 1]  224     ld a,(x)
      008405 A1 84            [ 1]  225     cp a,#SUP
      008407 26 05            [ 1]  226     jrne 5$
      008409 88               [ 1]  227     push a 
      00840A CD 83 C2         [ 4]  228     call getc
      00840D 84               [ 1]  229     pop a 
      00840E                        230 5$:
      00840E 81               [ 4]  231     ret 
                                    232 
                                    233 
                                    234 ;-----------------------------
                                    235 ; send an ASCIZ string to UART1 
                                    236 ; input: 
                                    237 ;   x 		char * 
                                    238 ; output:
                                    239 ;   none 
                                    240 ;-------------------------------
      00840F                        241 puts::
      00840F F6               [ 1]  242     ld a,(x)
      008410 27 06            [ 1]  243 	jreq 1$
      008412 CD 83 B2         [ 4]  244 	call putc 
      008415 5C               [ 1]  245 	incw x 
      008416 20 F7            [ 2]  246 	jra puts 
      008418 81               [ 4]  247 1$:	ret 
                                    248 
                                    249 
                                    250 ;---------------------------
                                    251 ; delete character at left 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                    252 ; of cursor on terminal 
                                    253 ; input:
                                    254 ;   none 
                                    255 ; output:
                                    256 ;	none 
                                    257 ;---------------------------
      008419                        258 bksp:
      008419 A6 08            [ 1]  259 	ld a,#BS 
      00841B CD 83 B2         [ 4]  260 	call putc 
      00841E A6 20            [ 1]  261 	ld a,#SPACE 
      008420 CD 83 B2         [ 4]  262 	call putc 
      008423 A6 08            [ 1]  263 	ld a,#BS 
      008425 CD 83 B2         [ 4]  264 	call putc 
      008428 81               [ 4]  265 	ret 
                                    266 ;---------------------------
                                    267 ; delete n character left of cursor 
                                    268 ; at terminal.
                                    269 ; input: 
                                    270 ;   A   number of characters to delete.
                                    271 ; output:
                                    272 ;    none 
                                    273 ;--------------------------	
      008429                        274 delete_nchar:
      008429 88               [ 1]  275 	push a 
      00842A 0D 01            [ 1]  276 0$:	tnz (1,sp)
      00842C 27 07            [ 1]  277 	jreq 1$
      00842E CD 84 19         [ 4]  278 	call bksp 
      008431 0A 01            [ 1]  279 	dec (1,sp)
      008433 20 F5            [ 2]  280 	jra 0$
      008435 84               [ 1]  281 1$:	pop a 
      008436 81               [ 4]  282 	ret
                                    283 
                                    284 ;--------------------------
                                    285 ; send ANSI escape sequence
                                    286 ; ANSI: ESC[
                                    287 ; note: ESC is ASCII 27
                                    288 ;       [   is ASCII 91  
                                    289 ;-------------------------- 
      008437                        290 send_escape:
      008437 A6 1B            [ 1]  291 	ld a,#ESC 
      008439 CD 83 B2         [ 4]  292 	call putc 
      00843C A6 5B            [ 1]  293 	ld a,#'[
      00843E CD 83 B2         [ 4]  294 	call putc 
      008441 81               [ 4]  295 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                    307 ; 	A {0..99} 
                                    308 ; output:
                                    309 ;   none 
                                    310 ;---------------------
      008442                        311 send_parameter:
      008442 89               [ 2]  312 	pushw x 
      008443 5F               [ 1]  313 	clrw x 
      008444 97               [ 1]  314 	ld xl,a 
      008445 A6 0A            [ 1]  315 	ld a,#10 
      008447 62               [ 2]  316 	div x,a 
      008448 95               [ 1]  317 	ld xh,a 
      008449 9F               [ 1]  318 	ld a,xl
      00844A 4D               [ 1]  319     tnz a 
      00844B 27 0B            [ 1]  320     jreq 2$
      00844D A1 09            [ 1]  321 	cp a,#9 
      00844F 23 02            [ 2]  322 	jrule 1$
      008451 A6 39            [ 1]  323 	ld a,#'9
      008453                        324 1$:
      008453 AB 30            [ 1]  325 	add a,#'0 
      008455 CD 83 B2         [ 4]  326 	call putc
      008458 9E               [ 1]  327 2$:	ld a,xh 
      008459 AB 30            [ 1]  328 	add a,#'0
      00845B CD 83 B2         [ 4]  329 	call putc 
      00845E 85               [ 2]  330 	popw x 
      00845F 81               [ 4]  331 	ret 
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
      008460                        344 move_left:
      008460 88               [ 1]  345 	push a 
      008461 CD 84 37         [ 4]  346 	call send_escape
      008464 84               [ 1]  347     pop a
      008465 CD 84 42         [ 4]  348 	call send_parameter 
      008468 A6 44            [ 1]  349 	ld a,#'D 
      00846A CD 83 B2         [ 4]  350 	call putc 
      00846D 81               [ 4]  351 	ret	
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      00846E                        362 move_right:
      00846E 88               [ 1]  363 	push a 
      00846F CD 84 37         [ 4]  364 	call send_escape
      008472 84               [ 1]  365     pop a
      008473 CD 84 42         [ 4]  366 	call send_parameter 
      008476 A6 43            [ 1]  367 	ld a,#'C 
      008478 CD 83 B2         [ 4]  368 	call putc 
      00847B 81               [ 4]  369 	ret 
                                    370 
                                    371 
                                    372 ;--------------------------
                                    373 ; print n spaces on terminal
                                    374 ; input:
                                    375 ;  X 		number of spaces 
                                    376 ; output:
                                    377 ;	none 
                                    378 ;---------------------------
      00847C                        379 spaces::
      00847C A6 20            [ 1]  380 	ld a,#SPACE 
      00847E 5D               [ 2]  381 1$:	tnzw x
      00847F 27 06            [ 1]  382 	jreq 9$
      008481 CD 83 B2         [ 4]  383 	call putc 
      008484 5A               [ 2]  384 	decw x
      008485 20 F7            [ 2]  385 	jra 1$
      008487                        386 9$: 
      008487 81               [ 4]  387 	ret 
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
      008488                        404 insert_char: 
      000408                        405 	_vars VSIZE 
      008488 52 02            [ 2]    1     sub sp,#VSIZE 
      00848A 6B 02            [ 1]  406     ld (KCHAR,sp),a 
      00848C 9E               [ 1]  407     ld a,xh 
      00848D 6B 01            [ 1]  408 	ld (IPOS,sp),a
      00848F 9F               [ 1]  409     ld a,xl 
      008490 6B 03            [ 1]  410     ld (LLEN,sp),a  
      008492 93               [ 1]  411     ldw x,y
      008493 5C               [ 1]  412     incw x 
      008494 7B 03            [ 1]  413     ld a,(LLEN,sp)
      008496 10 01            [ 1]  414     sub a,(IPOS,sp)
      008498 4C               [ 1]  415     inc a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      008499 C7 00 0F         [ 1]  416     ld acc8,a 
      00849C 72 5F 00 0E      [ 1]  417     clr acc16
      0084A0 CD 8E EF         [ 4]  418     call move
      0084A3 90 AE 16 90      [ 2]  419     ldw y,#tib 
      0084A7 7B 01            [ 1]  420     ld a,(IPOS,sp)
      0084A9 C7 00 0F         [ 1]  421     ld acc8,a 
      0084AC 72 B9 00 0E      [ 2]  422     addw y,acc16 
      0084B0 7B 02            [ 1]  423     ld a,(KCHAR,sp)
      0084B2 90 F7            [ 1]  424     ld (y),a
      0084B4 90 5C            [ 1]  425     incw y  
      0084B6 7B 01            [ 1]  426     ld a,(IPOS,sp)
      0084B8 CD 84 60         [ 4]  427     call move_left
      0084BB AE 16 90         [ 2]  428     ldw x,#tib 
      0084BE CD 84 0F         [ 4]  429     call puts 
      0084C1 7B 03            [ 1]  430     ld a,(LLEN,sp)
      0084C3 10 01            [ 1]  431     sub a,(IPOS,sp) 
      0084C5 CD 84 60         [ 4]  432     call move_left 
      000448                        433 	_drop VSIZE 
      0084C8 5B 02            [ 2]    1     addw sp,#VSIZE 
      0084CA 81               [ 4]  434 	ret 
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
      0084CB                        447 delete_under:
      00044B                        448 	_vars VSIZE 
      0084CB 52 02            [ 2]    1     sub sp,#VSIZE 
      0084CD 6B 02            [ 1]  449     ld (LLEN,sp),a 
      0084CF 9F               [ 1]  450     ld a,xl 
      0084D0 6B 01            [ 1]  451     ld (CPOS,sp),a 
      0084D2 93               [ 1]  452     ldw x,y ; move destination
      0084D3 90 5C            [ 1]  453     incw y  ; move source 
      0084D5 7B 02            [ 1]  454     ld a,(LLEN,sp)
      0084D7 10 01            [ 1]  455     sub a,(CPOS,sp)
      0084D9 4C               [ 1]  456     inc a ; move including zero at end.
      0084DA C7 00 0F         [ 1]  457     ld acc8,a 
      0084DD 72 5F 00 0E      [ 1]  458     clr acc16 
      0084E1 CD 8E EF         [ 4]  459 	call move 
      0084E4 90 AE 16 90      [ 2]  460     ldw y,#tib 
      0084E8 7B 01            [ 1]  461     ld a,(CPOS,sp)
      0084EA C7 00 0F         [ 1]  462     ld acc8,a 
      0084ED 72 B9 00 0E      [ 2]  463     addw y,acc16 
      0084F1 93               [ 1]  464     ldw x,y 
      0084F2 CD 84 0F         [ 4]  465     call puts 
      0084F5 A6 20            [ 1]  466     ld a,#SPACE  
      0084F7 CD 83 B2         [ 4]  467     call putc
      0084FA 7B 02            [ 1]  468     ld a,(LLEN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0084FC 10 01            [ 1]  469     sub a,(CPOS,sp)
      0084FE CD 84 60         [ 4]  470     call move_left 
      008501 0A 02            [ 1]  471     dec (LLEN,sp)
      000483                        472 	_drop VSIZE 
      008503 5B 02            [ 2]    1     addw sp,#VSIZE 
      008505 81               [ 4]  473 	ret 
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
      008506                        485 delete_line:
      008506 CD 84 37         [ 4]  486     call send_escape
      008509 A6 32            [ 1]  487 	ld a,#'2
      00850B CD 83 B2         [ 4]  488 	call putc 
      00850E A6 4B            [ 1]  489 	ld a,#'K 
      008510 CD 83 B2         [ 4]  490 	call putc 
      008513 81               [ 4]  491 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      008514                        523 readln::
      000494                        524 	_vars VSIZE 
      008514 52 04            [ 2]    1     sub sp,#VSIZE 
      008516 5F               [ 1]  525 	clrw x 
      008517 1F 02            [ 2]  526 	ldw (LL,sp),x 
      008519 1F 03            [ 2]  527 	ldw (CPOS,sp),x 
      00851B 03 04            [ 1]  528 	cpl (OVRWR,sp) ; default to overwrite mode 
      00851D 90 AE 16 90      [ 2]  529  	ldw y,#tib ; input buffer
      008521                        530 readln_loop:
      008521 CD 83 C2         [ 4]  531 	call getc
      008524 6B 01            [ 1]  532 	ld (RXCHAR,sp),a
      008526 A1 1B            [ 1]  533     cp a,#ESC 
      008528 26 05            [ 1]  534     jrne 0$
      00852A CD 83 E9         [ 4]  535     call get_escape 
      00852D 6B 01            [ 1]  536     ld (RXCHAR,sp),a 
      00852F A1 0D            [ 1]  537 0$:	cp a,#CR
      008531 26 03            [ 1]  538 	jrne 1$
      008533 CC 86 BD         [ 2]  539 	jp readln_quit
      008536 A1 0A            [ 1]  540 1$:	cp a,#LF 
      008538 26 03            [ 1]  541 	jrne 2$ 
      00853A CC 86 BD         [ 2]  542 	jp readln_quit
      00853D                        543 2$:
      00853D A1 08            [ 1]  544 	cp a,#BS
      00853F 26 12            [ 1]  545 	jrne 3$
                                    546 ; delete left 
      008541 0D 03            [ 1]  547     tnz (CPOS,sp)
      008543 27 DC            [ 1]  548     jreq readln_loop 
      008545 A6 01            [ 1]  549     ld a,#1 
      008547 CD 84 60         [ 4]  550     call move_left
      00854A 0A 03            [ 1]  551     dec (CPOS,sp)
      00854C 90 5A            [ 2]  552     decw y 
      00854E 7B 03            [ 1]  553     ld a,(CPOS,sp) 
      008550 CC 86 69         [ 2]  554     jp 12$
      008553                        555 3$:
      008553 A1 04            [ 1]  556 	cp a,#CTRL_D
      008555 26 1A            [ 1]  557 	jrne 4$
                                    558 ;delete line 
      008557 CD 85 06         [ 4]  559 	call delete_line 
      00855A 7B 03            [ 1]  560     ld a,(CPOS,sp)
      00855C 4C               [ 1]  561     inc a 
      00855D CD 84 60         [ 4]  562     call move_left 
      008560 A6 3E            [ 1]  563 	ld a,#'> 
      008562 CD 83 B2         [ 4]  564 	call putc 
      008565 90 AE 16 90      [ 2]  565 	ldw y,#tib
      008569 90 7F            [ 1]  566 	clr (y)
      00856B 0F 02            [ 1]  567 	clr (LL,sp)
      00856D 0F 03            [ 1]  568 	clr (CPOS,sp)
      00856F 20 B0            [ 2]  569 	jra readln_loop
      008571                        570 4$:
      008571 A1 12            [ 1]  571 	cp a,#CTRL_R 
      008573 26 21            [ 1]  572 	jrne 5$
                                    573 ;reprint 
      008575 0D 02            [ 1]  574 	tnz (LL,sp)
      008577 26 A8            [ 1]  575 	jrne readln_loop
      008579 AE 16 90         [ 2]  576 	ldw x,#tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      00857C CD 8E C3         [ 4]  577 	call strlen 
      00857F 90 AE 16 90      [ 2]  578 	ldw y,#tib 
      008583 27 9C            [ 1]  579 	jreq readln_loop
      008585 6B 02            [ 1]  580 	ld (LL,sp),a 
      008587 6B 03            [ 1]  581     ld (CPOS,sp),a
      008589 AE 16 90         [ 2]  582 	ldw x,#tib 
      00858C CD 84 0F         [ 4]  583 	call puts
      00858F 0F 01            [ 1]  584 	clr (LL_HB,sp)
      008591 72 F9 01         [ 2]  585 	addw y,(LL_HB,sp)
      008594 20 8B            [ 2]  586 	jra readln_loop 
      008596                        587 5$:
      008596 A1 05            [ 1]  588 	cp a,#CTRL_E 
      008598 26 49            [ 1]  589 	jrne 6$
                                    590 ;edit line number 
      00859A AE 16 90         [ 2]  591 	ldw x,#tib 
      00859D CD 94 70         [ 4]  592 	call atoi24
      0085A0 CE 00 0E         [ 2]  593 	ldw x,acc16
      0085A3 CD 86 F7         [ 4]  594 	call search_lineno
      0085A6 5D               [ 2]  595 	tnzw x 
      0085A7 26 0B            [ 1]  596 	jrne 51$
      0085A9 0F 02            [ 1]  597 	clr (LL,sp)
      0085AB 90 AE 16 90      [ 2]  598 	ldw y,#tib
      0085AF 90 7F            [ 1]  599     clr (y) 	
      0085B1 CC 86 BD         [ 2]  600 	jp readln_quit  
      0085B4                        601 51$:
      0085B4 CF 00 05         [ 2]  602 	ldw basicptr,x
      0085B7 E6 02            [ 1]  603 	ld a,(2,x)
      0085B9 C7 00 04         [ 1]  604 	ld count,a 
      0085BC 90 AE 16 90      [ 2]  605 	ldw y,#tib 
      0085C0 CD 8C 52         [ 4]  606 	call decompile 
      0085C3 0F 01            [ 1]  607 	clr (LL_HB,sp)
      0085C5 A6 0D            [ 1]  608 	ld a,#CR 
      0085C7 CD 83 B2         [ 4]  609 	call putc 
      0085CA A6 3E            [ 1]  610 	ld a,#'>
      0085CC CD 83 B2         [ 4]  611 	call putc
      0085CF AE 16 90         [ 2]  612     ldw x,#tib  
      0085D2 CD 8E C3         [ 4]  613 	call strlen 
      0085D5 6B 02            [ 1]  614 	ld (LL,sp),a 
      0085D7 CD 84 0F         [ 4]  615 	call puts 
      0085DA 90 93            [ 1]  616 	ldw y,x
      0085DC 7B 02            [ 1]  617     ld a,(LL,sp)
      0085DE 6B 03            [ 1]  618     ld (CPOS,sp),a  
      0085E0 CC 85 21         [ 2]  619 	jp readln_loop
      0085E3                        620 6$:
      0085E3 A1 81            [ 1]  621 	cp a,#ARROW_RIGHT
      0085E5 26 15            [ 1]  622    	jrne 7$ 
                                    623 ; right arrow
      0085E7 7B 03            [ 1]  624 	ld a,(CPOS,sp)
      0085E9 11 02            [ 1]  625     cp a,(LL,sp)
      0085EB 2B 03            [ 1]  626     jrmi 61$
      0085ED CC 85 21         [ 2]  627     jp readln_loop 
      0085F0                        628 61$:
      0085F0 A6 01            [ 1]  629     ld a,#1 
      0085F2 CD 84 6E         [ 4]  630 	call move_right 
      0085F5 0C 03            [ 1]  631 	inc (CPOS,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0085F7 90 5C            [ 1]  632     incw y 
      0085F9 CC 85 21         [ 2]  633     jp readln_loop 
      0085FC A1 80            [ 1]  634 7$: cp a,#ARROW_LEFT  
      0085FE 26 13            [ 1]  635 	jrne 8$
                                    636 ; left arrow 
      008600 0D 03            [ 1]  637 	tnz (CPOS,sp)
      008602 26 03            [ 1]  638 	jrne 71$
      008604 CC 85 21         [ 2]  639 	jp readln_loop
      008607                        640 71$:
      008607 A6 01            [ 1]  641     ld a,#1 
      008609 CD 84 60         [ 4]  642 	call move_left 
      00860C 0A 03            [ 1]  643 	dec (CPOS,sp)
      00860E 90 5A            [ 2]  644     decw y 
      008610 CC 85 21         [ 2]  645 	jp readln_loop 
      008613 A1 82            [ 1]  646 8$: cp a,#HOME  
      008615 26 0E            [ 1]  647 	jrne 9$
                                    648 ; HOME 
      008617 7B 03            [ 1]  649     ld a,(CPOS,sp)
      008619 CD 84 60         [ 4]  650     call move_left 
      00861C 0F 03            [ 1]  651 	clr (CPOS,sp)
      00861E 90 AE 16 90      [ 2]  652     ldw y,#tib 
      008622 CC 85 21         [ 2]  653 	jp readln_loop  
      008625 A1 83            [ 1]  654 9$: cp a,#KEY_END  
      008627 26 26            [ 1]  655 	jrne 10$
                                    656 ; KEY_END 
      008629 7B 03            [ 1]  657 	ld a,(CPOS,sp)
      00862B 11 02            [ 1]  658 	cp a,(LL,sp)
      00862D 26 03            [ 1]  659 	jrne 91$
      00862F CC 85 21         [ 2]  660 	jp readln_loop 
      008632                        661 91$:
      008632 7B 02            [ 1]  662 	ld a,(LL,sp)
      008634 10 03            [ 1]  663 	sub a,(CPOS,sp)
      008636 CD 84 6E         [ 4]  664 	call move_right 
      008639 7B 02            [ 1]  665 	ld a,(LL,sp)
      00863B 6B 03            [ 1]  666 	ld (CPOS,sp),a
      00863D 90 AE 16 90      [ 2]  667     ldw y,#tib
      008641 72 5F 00 0E      [ 1]  668     clr acc16 
      008645 C7 00 0F         [ 1]  669     ld acc8,a 
      008648 72 B9 00 0E      [ 2]  670     addw y,acc16  
      00864C CC 85 21         [ 2]  671 	jp readln_loop 
      00864F A1 0F            [ 1]  672 10$: cp a,#CTRL_O
      008651 26 0C            [ 1]  673 	jrne 11$ 
                                    674 ; toggle between insert/overwrite
      008653 03 04            [ 1]  675 	cpl (OVRWR,sp)
      008655 90 89            [ 2]  676 	pushw y 
      008657 CD A0 83         [ 4]  677 	call beep_1khz
      00865A 90 85            [ 2]  678 	popw y 
      00865C CC 85 21         [ 2]  679 	jp readln_loop 
      00865F A1 84            [ 1]  680 11$: cp a,#SUP 
      008661 26 11            [ 1]  681     jrne final_test 
                                    682 ; del character under cursor 
      008663 7B 03            [ 1]  683     ld a,(CPOS,sp)
      008665 11 02            [ 1]  684     cp a,(LL,sp)
      008667 2A 08            [ 1]  685     jrpl 13$
      008669                        686 12$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      008669 97               [ 1]  687     ld xl,a    ; cursor position 
      00866A 7B 02            [ 1]  688     ld a,(LL,sp)  ; line length
      00866C CD 84 CB         [ 4]  689     call delete_under
      00866F 0A 02            [ 1]  690     dec (LLEN,sp)
      008671                        691 13$:
      008671 CC 85 21         [ 2]  692     jp readln_loop 
      008674                        693 final_test:
      008674 A1 20            [ 1]  694 	cp a,#SPACE
      008676 2A 03            [ 1]  695 	jrpl accept_char
      008678 CC 85 21         [ 2]  696 	jp readln_loop
      00867B                        697 accept_char:
      00867B A6 4F            [ 1]  698 	ld a,#TIB_SIZE-1
      00867D 11 02            [ 1]  699 	cp a, (LL,sp)
      00867F 2A 03            [ 1]  700 	jrpl 1$
      008681 CC 85 21         [ 2]  701 	jp readln_loop
      008684 0D 04            [ 1]  702 1$:	tnz (OVRWR,sp)
      008686 26 18            [ 1]  703 	jrne overwrite
                                    704 ; insert mode 
      008688 7B 03            [ 1]  705     ld a,(CPOS,sp)
      00868A 11 02            [ 1]  706     cp a,(LL,sp)
      00868C 27 12            [ 1]  707     jreq overwrite
      00868E 7B 02            [ 1]  708     ld a,(LL,sp)
      008690 97               [ 1]  709     ld xl,a 
      008691 7B 03            [ 1]  710     ld a,(CPOS,sp)
      008693 95               [ 1]  711     ld xh,a
      008694 7B 01            [ 1]  712     ld a,(RXCHAR,sp)
      008696 CD 84 88         [ 4]  713     call insert_char
      008699 0C 02            [ 1]  714     inc (LLEN,sp)
      00869B 0C 03            [ 1]  715     inc (CPOS,sp)
      00869D CC 85 21         [ 2]  716     jp readln_loop 
      0086A0                        717 overwrite:
      0086A0 7B 01            [ 1]  718 	ld a,(RXCHAR,sp)
      0086A2 90 F7            [ 1]  719 	ld (y),a
      0086A4 90 5C            [ 1]  720     incw y
      0086A6 CD 83 B2         [ 4]  721     call putc 
      0086A9 7B 03            [ 1]  722 	ld a,(CPOS,sp)
      0086AB 11 02            [ 1]  723 	cp a,(LL,sp)
      0086AD 2B 09            [ 1]  724 	jrmi 1$
      0086AF 90 7F            [ 1]  725 	clr (y)
      0086B1 0C 02            [ 1]  726 	inc (LL,sp)
      0086B3 0C 03            [ 1]  727     inc (CPOS,sp)
      0086B5 CC 85 21         [ 2]  728 	jp readln_loop 
      0086B8                        729 1$:	
      0086B8 0C 03            [ 1]  730 	inc (CPOS,sp)
      0086BA CC 85 21         [ 2]  731 	jp readln_loop 
      0086BD                        732 readln_quit:
      0086BD 90 AE 16 90      [ 2]  733 	ldw y,#tib
      0086C1 0F 01            [ 1]  734     clr (LL_HB,sp) 
      0086C3 72 F9 01         [ 2]  735     addw y,(LL_HB,sp)
      0086C6 90 7F            [ 1]  736     clr (y)
      0086C8 7B 02            [ 1]  737 	ld a,(LL,sp)
      0086CA C7 00 04         [ 1]  738 	ld count,a 
      0086CD A6 0D            [ 1]  739 	ld a,#CR
      0086CF CD 83 B2         [ 4]  740 	call putc
      000652                        741 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0086D2 5B 04            [ 2]    1     addw sp,#VSIZE 
      0086D4 81               [ 4]  742 	ret
                                    743 
                                    744 ;------------------------------
                                    745 ; print byte  in hexadecimal 
                                    746 ; on console
                                    747 ; input:
                                    748 ;    A		byte to print
                                    749 ;------------------------------
      0086D5                        750 print_hex::
      0086D5 88               [ 1]  751 	push a 
      0086D6 4E               [ 1]  752 	swap a 
      0086D7 CD 86 EC         [ 4]  753 	call to_hex_char 
      0086DA CD 83 B2         [ 4]  754 	call putc 
      0086DD 7B 01            [ 1]  755     ld a,(1,sp) 
      0086DF CD 86 EC         [ 4]  756 	call to_hex_char
      0086E2 CD 83 B2         [ 4]  757 	call putc
      0086E5 A6 20            [ 1]  758 	ld a,#SPACE 
      0086E7 CD 83 B2         [ 4]  759 	call putc 
      0086EA 84               [ 1]  760 	pop a 
      0086EB 81               [ 4]  761 	ret 
                                    762 
                                    763 ;----------------------------------
                                    764 ; convert to hexadecimal digit 
                                    765 ; input:
                                    766 ;   A       digit to convert 
                                    767 ; output:
                                    768 ;   A       hexdecimal character 
                                    769 ;----------------------------------
      0086EC                        770 to_hex_char::
      0086EC A4 0F            [ 1]  771 	and a,#15 
      0086EE A1 09            [ 1]  772 	cp a,#9 
      0086F0 23 02            [ 2]  773 	jrule 1$ 
      0086F2 AB 07            [ 1]  774 	add a,#7
      0086F4 AB 30            [ 1]  775 1$: add a,#'0 
      0086F6 81               [ 4]  776 	ret 
                                    777 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                     26     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000000     5 SEPARATE=0 ; set to 1 for 'make separate' 
                                      6 
                                      7 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
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
      0086F7                         51 search_lineno::
      000677                         52 	_vars VSIZE
      0086F7 52 02            [ 2]    1     sub sp,#VSIZE 
      0086F9 0F 01            [ 1]   53 	clr (LL,sp)
      0086FB 90 CE 00 1B      [ 2]   54 	ldw y,txtbgn
      0086FF 4D               [ 1]   55 	tnz a 
      008700 27 04            [ 1]   56 	jreq search_ln_loop
      008702 90 CE 00 05      [ 2]   57 	ldw y,basicptr 
      008706                         58 search_ln_loop:
      008706 90 C3 00 1D      [ 2]   59 	cpw y,txtend 
      00870A 2A 10            [ 1]   60 	jrpl 8$
      00870C 90 F3            [ 1]   61 	cpw x,(y)
      00870E 27 0E            [ 1]   62 	jreq 9$
      008710 2B 0A            [ 1]   63 	jrmi 8$ 
      008712 90 E6 02         [ 1]   64 	ld a,(2,y)
      008715 6B 02            [ 1]   65 	ld (LB,sp),a 
      008717 72 F9 01         [ 2]   66 	addw y,(LL,sp)
      00871A 20 EA            [ 2]   67 	jra search_ln_loop 
      00871C                         68 8$: 
      00871C 5F               [ 1]   69 	clrw x 	
      00871D 51               [ 1]   70 	exgw x,y 
      00069E                         71 9$: _drop VSIZE
      00871E 5B 02            [ 2]    1     addw sp,#VSIZE 
      008720 51               [ 1]   72 	exgw x,y   
      008721 81               [ 4]   73 	ret 
                                     74 
                                     75 ;-------------------------------------
                                     76 ; delete line at addr
                                     77 ; input:
                                     78 ;   X 		addr of line i.e DEST for move 
                                     79 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                           000001    80 	LLEN=1
                           000003    81 	SRC=3
                           000004    82 	VSIZE=4
      008722                         83 del_line: 
      0006A2                         84 	_vars VSIZE 
      008722 52 04            [ 2]    1     sub sp,#VSIZE 
      008724 E6 02            [ 1]   85 	ld a,(2,x) ; line length
      008726 6B 02            [ 1]   86 	ld (LLEN+1,sp),a 
      008728 0F 01            [ 1]   87 	clr (LLEN,sp)
      00872A 90 93            [ 1]   88 	ldw y,x  
      00872C 72 F9 01         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      00872F 17 03            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      008731 90 CE 00 1D      [ 2]   91 	ldw y,txtend 
      008735 72 F2 03         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      008738 90 CF 00 0E      [ 2]   93 	ldw acc16,y 
      00873C 16 03            [ 2]   94 	ldw y,(SRC,sp)    ; source
      00873E CD 8E EF         [ 4]   95 	call move
      008741 90 CE 00 1D      [ 2]   96 	ldw y,txtend 
      008745 72 F2 01         [ 2]   97 	subw y,(LLEN,sp)
      008748 90 CF 00 1D      [ 2]   98 	ldw txtend,y  
      0006CC                         99 	_drop VSIZE     
      00874C 5B 04            [ 2]    1     addw sp,#VSIZE 
      00874E 81               [ 4]  100 	ret 
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
      00874F                        115 create_gap:
      0006CF                        116 	_vars VSIZE
      00874F 52 06            [ 2]    1     sub sp,#VSIZE 
      008751 1F 03            [ 2]  117 	ldw (SRC,sp),x 
      008753 17 05            [ 2]  118 	ldw (LEN,sp),y 
      008755 90 CF 00 0E      [ 2]  119 	ldw acc16,y 
      008759 90 93            [ 1]  120 	ldw y,x ; SRC
      00875B 72 BB 00 0E      [ 2]  121 	addw x,acc16  
      00875F 1F 01            [ 2]  122 	ldw (DEST,sp),x 
                                    123 ;compute size to move 	
      008761 CE 00 1D         [ 2]  124 	ldw x,txtend 
      008764 72 F0 03         [ 2]  125 	subw x,(SRC,sp)
      008767 CF 00 0E         [ 2]  126 	ldw acc16,x ; size to move
      00876A 1E 01            [ 2]  127 	ldw x,(DEST,sp) 
      00876C CD 8E EF         [ 4]  128 	call move
      00876F CE 00 1D         [ 2]  129 	ldw x,txtend
      008772 72 FB 05         [ 2]  130 	addw x,(LEN,sp)
      008775 CF 00 1D         [ 2]  131 	ldw txtend,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0006F8                        132 9$:	_drop VSIZE 
      008778 5B 06            [ 2]    1     addw sp,#VSIZE 
      00877A 81               [ 4]  133 	ret 
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
      00877B                        150 insert_line:
      0006FB                        151 	_vars VSIZE 
      00877B 52 08            [ 2]    1     sub sp,#VSIZE 
      00877D CE 00 1D         [ 2]  152 	ldw x,txtend  
      008780 C3 00 1B         [ 2]  153 	cpw x,txtbgn 
      008783 26 19            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      008785 AE 00 02         [ 2]  156 	ldw x,#2 
      008788 72 D6 00 19      [ 4]  157 	ld a,([ptr16],x)
      00878C A1 03            [ 1]  158 	cp a,#3
      00878E 27 5A            [ 1]  159 	jreq insert_ln_exit
      008790 5F               [ 1]  160 	clrw x 
      008791 97               [ 1]  161 	ld xl,a
      008792 1F 07            [ 2]  162 	ldw (LLEN,sp),x 
      008794 CE 00 1B         [ 2]  163 	ldw x,txtbgn
      008797 1F 01            [ 2]  164 	ldw (DEST,sp),x 
      008799 CE 00 1D         [ 2]  165 	ldw x,txtend 
      00879C 20 38            [ 2]  166 	jra 4$
      00879E 72 CE 00 19      [ 5]  167 0$:	ldw x,[ptr16]
                                    168 ; line number
      0087A2 1F 05            [ 2]  169 	ldw (LINENO,sp),x 
      0087A4 AE 00 02         [ 2]  170 	ldw x,#2 
      0087A7 72 D6 00 19      [ 4]  171 	ld a,([ptr16],x)
      0087AB 97               [ 1]  172 	ld xl,a
                                    173 ; line length
      0087AC 1F 07            [ 2]  174 	ldw (LLEN,sp),x
                                    175 ; check if that line number already exit 	
      0087AE 1E 05            [ 2]  176 	ldw x,(LINENO,sp)
      0087B0 4F               [ 1]  177 	clr a 
      0087B1 CD 86 F7         [ 4]  178 	call search_lineno 
      0087B4 5D               [ 2]  179 	tnzw x 
      0087B5 26 04            [ 1]  180 	jrne 2$
                                    181 ; line doesn't exit
                                    182 ; it will be inserted at this point.  	
      0087B7 17 01            [ 2]  183 	ldw (DEST,sp),y 
      0087B9 20 05            [ 2]  184 	jra 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                    185 ; line exit delete it.
                                    186 ; it will be replaced by new one 	
      0087BB 1F 01            [ 2]  187 2$: ldw (DEST,sp),x 
      0087BD CD 87 22         [ 4]  188 	call del_line
      0087C0                        189 3$: 
                                    190 ; insert new line or leave if LLEN==3
                                    191 ; LLEN==3 means empty line 
      0087C0 A6 03            [ 1]  192 	ld a,#3
      0087C2 11 08            [ 1]  193 	cp a,(LLEN+1,sp)
      0087C4 27 24            [ 1]  194 	jreq insert_ln_exit ; empty line exit.
                                    195 ; if insertion point at txtend 
                                    196 ; move no need to create a gap 
      0087C6 1E 01            [ 2]  197 	ldw x,(DEST,sp)
      0087C8 C3 00 1D         [ 2]  198 	cpw x,txtend 
      0087CB 27 09            [ 1]  199 	jreq 4$ 
                                    200 ; must create a gap
                                    201 ; at insertion point  
      0087CD 1E 01            [ 2]  202 	ldw x,(DEST,sp)
      0087CF 16 07            [ 2]  203 	ldw y,(LLEN,sp)
      0087D1 CD 87 4F         [ 4]  204 	call create_gap
      0087D4 20 06            [ 2]  205 	jra 5$
      0087D6                        206 4$: 
      0087D6 72 FB 07         [ 2]  207 	addw x,(LLEN,sp)
      0087D9 CF 00 1D         [ 2]  208 	ldw txtend,x 	 
                                    209 ; move new line in gap 
      0087DC 1E 07            [ 2]  210 5$:	ldw x,(LLEN,sp)
      0087DE CF 00 0E         [ 2]  211 	ldw acc16,x 
      0087E1 90 AE 16 E0      [ 2]  212 	ldw y,#pad ;SRC 
      0087E5 1E 01            [ 2]  213 	ldw x,(DEST,sp) ; dest address 
      0087E7 CD 8E EF         [ 4]  214 	call move 
      0087EA                        215 insert_ln_exit:	
      00076A                        216 	_drop VSIZE
      0087EA 5B 08            [ 2]    1     addw sp,#VSIZE 
      0087EC 81               [ 4]  217 	ret
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
      0087ED                        233 parse_quote: 
      00076D                        234 	_vars VSIZE 
      0087ED 52 02            [ 2]    1     sub sp,#VSIZE 
      0087EF 4F               [ 1]  235 	clr a
      0087F0 6B 01            [ 1]  236 1$:	ld (PREV,sp),a 
      0087F2                        237 2$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      0087F2 91 D6 01         [ 4]  238 	ld a,([in.w],y)
      0087F5 27 24            [ 1]  239 	jreq 6$
      0087F7 72 5C 00 02      [ 1]  240 	inc in 
      0087FB 6B 02            [ 1]  241 	ld (CURR,sp),a 
      0087FD A6 5C            [ 1]  242 	ld a,#'\
      0087FF 11 01            [ 1]  243 	cp a, (PREV,sp)
      008801 26 0A            [ 1]  244 	jrne 3$
      008803 0F 01            [ 1]  245 	clr (PREV,sp)
      008805 7B 02            [ 1]  246 	ld a,(CURR,sp)
      008807 AD 1C            [ 4]  247 	callr convert_escape
      008809 F7               [ 1]  248 	ld (x),a 
      00880A 5C               [ 1]  249 	incw x 
      00880B 20 E5            [ 2]  250 	jra 2$
      00880D                        251 3$:
      00880D 7B 02            [ 1]  252 	ld a,(CURR,sp)
      00880F A1 5C            [ 1]  253 	cp a,#'\'
      008811 27 DD            [ 1]  254 	jreq 1$
      008813 A1 22            [ 1]  255 	cp a,#'"
      008815 27 04            [ 1]  256 	jreq 6$ 
      008817 F7               [ 1]  257 	ld (x),a 
      008818 5C               [ 1]  258 	incw x 
      008819 20 D7            [ 2]  259 	jra 2$
      00881B                        260 6$:
      00881B 7F               [ 1]  261 	clr (x)
      00881C 5C               [ 1]  262 	incw x 
      00881D 90 93            [ 1]  263 	ldw y,x 
      00881F 5F               [ 1]  264 	clrw x 
      008820 A6 02            [ 1]  265 	ld a,#TK_QSTR  
      0007A2                        266 	_drop VSIZE
      008822 5B 02            [ 2]    1     addw sp,#VSIZE 
      008824 81               [ 4]  267 	ret 
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
      008825                        278 convert_escape:
      008825 89               [ 2]  279 	pushw x 
      008826 AE 88 3A         [ 2]  280 	ldw x,#escaped 
      008829 F1               [ 1]  281 1$:	cp a,(x)
      00882A 27 06            [ 1]  282 	jreq 2$
      00882C 7D               [ 1]  283 	tnz (x)
      00882D 27 09            [ 1]  284 	jreq 3$
      00882F 5C               [ 1]  285 	incw x 
      008830 20 F7            [ 2]  286 	jra 1$
      008832 1D 88 3A         [ 2]  287 2$: subw x,#escaped 
      008835 9F               [ 1]  288 	ld a,xl 
      008836 AB 07            [ 1]  289 	add a,#7
      008838 85               [ 2]  290 3$:	popw x 
      008839 81               [ 4]  291 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                    292 
      00883A 61 62 74 6E 76 66 72   293 escaped:: .asciz "abtnvfr"
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
      008842                        310 parse_integer: ; { -- n }
      008842 89               [ 2]  311 	pushw x 	
      008843 4B 00            [ 1]  312 	push #0 ; TCHAR
      008845 4B 0A            [ 1]  313 	push #10 ; BASE=10
      008847 A1 24            [ 1]  314 	cp a,#'$
      008849 26 04            [ 1]  315 	jrne 2$ 
      0007CB                        316     _drop #1
      00884B 5B 01            [ 2]    1     addw sp,##1 
      00884D 4B 10            [ 1]  317 	push #16  ; BASE=16
      00884F F7               [ 1]  318 2$:	ld (x),a 
      008850 5C               [ 1]  319 	incw x 
      008851 91 D6 01         [ 4]  320 	ld a,([in.w],y)
      008854 72 5C 00 02      [ 1]  321 	inc in 
      008858 CD 94 64         [ 4]  322 	call to_upper 
      00885B 6B 02            [ 1]  323 	ld (TCHAR,sp),a 
      00885D CD 88 DA         [ 4]  324 	call is_digit 
      008860 25 ED            [ 1]  325 	jrc 2$
      008862 A6 10            [ 1]  326 	ld a,#16 
      008864 11 01            [ 1]  327 	cp a,(BASE,sp)
      008866 26 0A            [ 1]  328 	jrne 3$ 
      008868 7B 02            [ 1]  329 	ld a,(TCHAR,sp)
      00886A A1 41            [ 1]  330 	cp a,#'A 
      00886C 2B 04            [ 1]  331 	jrmi 3$ 
      00886E A1 47            [ 1]  332 	cp a,#'G 
      008870 2B DD            [ 1]  333 	jrmi 2$ 
      008872 72 5A 00 02      [ 1]  334 3$: dec in 	
      008876 7F               [ 1]  335     clr (x)
      008877 1E 03            [ 2]  336 	ldw x,(XSAVE,sp)
      008879 CD 94 70         [ 4]  337 	call atoi24
      00887C 90 93            [ 1]  338 	ldw y,x 
      00887E CE 00 0E         [ 2]  339 	ldw x,acc16 
      008881 A6 84            [ 1]  340 	ld a,#TK_INTGR
      008883 90 FF            [ 2]  341 	ldw (y),x 
      008885 72 A9 00 02      [ 2]  342 	addw y,#2
      000809                        343 	_drop VSIZE  
      008889 5B 04            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      00888B 81               [ 4]  344 	ret 	
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
      00888C                        361 parse_binary: ; { -- n }
      00888C 4B 00            [ 1]  362 	push #0
      00888E 4B 00            [ 1]  363 	push #0
      008890 4B 00            [ 1]  364 	push #0
      008892                        365 2$:	
      008892 91 D6 01         [ 4]  366 	ld a,([in.w],y)
      008895 72 5C 00 02      [ 1]  367 	inc in 
      008899 A1 30            [ 1]  368 	cp a,#'0 
      00889B 27 06            [ 1]  369 	jreq 3$
      00889D A1 31            [ 1]  370 	cp a,#'1 
      00889F 27 02            [ 1]  371 	jreq 3$ 
      0088A1 20 0B            [ 2]  372 	jra bin_exit 
      0088A3 A0 30            [ 1]  373 3$: sub a,#'0 
      0088A5 46               [ 1]  374 	rrc a
      0088A6 09 03            [ 1]  375 	rlc (BINARY+2,sp) 
      0088A8 09 02            [ 1]  376 	rlc (BINARY+1,sp)
      0088AA 09 01            [ 1]  377 	rlc (BINARY,sp) 
      0088AC 20 E4            [ 2]  378 	jra 2$  
      0088AE                        379 bin_exit:
      0088AE 72 5A 00 02      [ 1]  380 	dec in 
      0088B2 90 93            [ 1]  381 	ldw y,x
      0088B4 7B 01            [ 1]  382 	ld a,(BINARY,sp)
      0088B6 C7 00 0D         [ 1]  383 	ld acc24,a 
      0088B9 1E 02            [ 2]  384 	ldw x,(BINARY+1,sp)
      0088BB CF 00 0E         [ 2]  385 	ldw acc16,x
      0088BE 90 FF            [ 2]  386 	ldw (y),x 
      0088C0 72 A9 00 02      [ 2]  387 	addw y,#2  
      0088C4 A6 84            [ 1]  388 	ld a,#TK_INTGR 	
      000846                        389 	_drop VSIZE 
      0088C6 5B 03            [ 2]    1     addw sp,#VSIZE 
      0088C8 81               [ 4]  390 	ret
                                    391 
                                    392 ;-------------------------------------
                                    393 ; check if A is a letter 
                                    394 ; input:
                                    395 ;   A 			character to test 
                                    396 ; output:
                                    397 ;   C flag      1 true, 0 false 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                    398 ;-------------------------------------
      0088C9                        399 is_alpha::
      0088C9 A1 41            [ 1]  400 	cp a,#'A 
      0088CB 8C               [ 1]  401 	ccf 
      0088CC 24 0B            [ 1]  402 	jrnc 9$ 
      0088CE A1 5B            [ 1]  403 	cp a,#'Z+1 
      0088D0 25 07            [ 1]  404 	jrc 9$ 
      0088D2 A1 61            [ 1]  405 	cp a,#'a 
      0088D4 8C               [ 1]  406 	ccf 
      0088D5 24 02            [ 1]  407 	jrnc 9$
      0088D7 A1 7B            [ 1]  408 	cp a,#'z+1
      0088D9 81               [ 4]  409 9$: ret 	
                                    410 
                                    411 ;------------------------------------
                                    412 ; check if character in {'0'..'9'}
                                    413 ; input:
                                    414 ;    A  character to test
                                    415 ; output:
                                    416 ;    Carry  0 not digit | 1 digit
                                    417 ;------------------------------------
      0088DA                        418 is_digit::
      0088DA A1 30            [ 1]  419 	cp a,#'0
      0088DC 25 03            [ 1]  420 	jrc 1$
      0088DE A1 3A            [ 1]  421     cp a,#'9+1
      0088E0 8C               [ 1]  422 	ccf 
      0088E1 8C               [ 1]  423 1$:	ccf 
      0088E2 81               [ 4]  424     ret
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
      0088E3                        435 is_alnum::
      0088E3 CD 88 DA         [ 4]  436 	call is_digit
      0088E6 25 03            [ 1]  437 	jrc 1$ 
      0088E8 CD 88 C9         [ 4]  438 	call is_alpha
      0088EB 81               [ 4]  439 1$:	ret 
                                    440 
                                    441 ;-----------------------------
                                    442 ; check if character in A 
                                    443 ; is a valid symbol character 
                                    444 ; valid: Upper case LETTER,DIGIT,'_' 
                                    445 ; input:
                                    446 ;    A   character to validate
                                    447 ; output:
                                    448 ;    Carry   set if valid 
                                    449 ;----------------------------
      0088EC                        450 is_symbol_char: 
      0088EC A1 5F            [ 1]  451 	cp a,#'_ 
      0088EE 26 03            [ 1]  452 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0088F0 99               [ 1]  453 	scf 
      0088F1 20 03            [ 2]  454 	jra 9$ 
      0088F3 CD 88 E3         [ 4]  455 1$:	call is_alnum 
      0088F6 81               [ 4]  456 9$: ret 
                                    457 
                                    458 ;---------------------------
                                    459 ;  when lexical unit begin 
                                    460 ;  with a letter a symbol 
                                    461 ;  is expected.
                                    462 ; input:
                                    463 ;   A   first character of symbol 
                                    464 ;	X   point to output buffer 
                                    465 ;   Y   point to input text 
                                    466 ; output:
                                    467 ;	X   after symbol 
                                    468 ;   Y   point after lexical unit 
                                    469 ;---------------------------
      0088F7                        470 parse_symbol:
      0088F7 5C               [ 1]  471 	incw x ; keep space for TK_ID 
      0088F8                        472 symb_loop: 
                                    473 ; symbol are converted to upper case 
      0088F8 CD 94 64         [ 4]  474 	call to_upper  
      0088FB F7               [ 1]  475 	ld (x), a 
      0088FC 5C               [ 1]  476 	incw x
      0088FD 91 D6 01         [ 4]  477 	ld a,([in.w],y)
      008900 72 5C 00 02      [ 1]  478 	inc in 
      008904 CD 88 EC         [ 4]  479 	call is_symbol_char 
      008907 25 EF            [ 1]  480 	jrc symb_loop 
      008909 7F               [ 1]  481 	clr (x)
      00890A 72 5A 00 02      [ 1]  482 	dec in  
      00890E 81               [ 4]  483 	ret 
                                    484 
                                    485 ;---------------------------
                                    486 ;  token begin with a letter,
                                    487 ;  is keyword or variable. 	
                                    488 ; input:
                                    489 ;   X 		point to pad 
                                    490 ;   Y 		point to text
                                    491 ;   A 	    first letter  
                                    492 ; output:
                                    493 ;   X		exec_addr|var_addr 
                                    494 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC  
                                    495 ;   pad 	keyword|var_name  
                                    496 ;--------------------------  
                           000001   497 	XFIRST=1
                           000002   498 	VSIZE=2
      00890F                        499 parse_keyword: 
      00890F 89               [ 2]  500 	pushw x ; preserve *symbol 
      008910 CD 88 F7         [ 4]  501 	call parse_symbol
      008913 1E 01            [ 2]  502 	ldw x,(XFIRST,sp) 
      008915 E6 02            [ 1]  503 	ld a,(2,x)
      008917 26 14            [ 1]  504 	jrne 2$
                                    505 ; one letter variable name 
      008919 E6 01            [ 1]  506 	ld a,(1,x) 
      00891B A0 41            [ 1]  507 	sub a,#'A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      00891D 48               [ 1]  508 	sll a 
      00891E 88               [ 1]  509 	push a 
      00891F 4B 00            [ 1]  510 	push #0
      008921 AE 00 30         [ 2]  511 	ldw x,#vars 
      008924 72 FB 01         [ 2]  512 	addw x,(1,sp) ; X=var address 
      0008A7                        513 	_drop 2 
      008927 5B 02            [ 2]    1     addw sp,#2 
      008929 A6 85            [ 1]  514 	ld a,#TK_VAR 
      00892B 20 24            [ 2]  515 	jra 4$ 
      00892D                        516 2$: ; check for keyword, otherwise syntax error.
      0008AD                        517 	_ldx_dict kword_dict ; dictionary entry point
      00892D AE AD 7D         [ 2]    1     ldw x,#kword_dict+2
      008930 16 01            [ 2]  518 	ldw y,(XFIRST,sp) ; name to search for
      008932 90 5C            [ 1]  519 	incw y 
      008934 CD 96 57         [ 4]  520 	call search_dict
      008937 4D               [ 1]  521 	tnz a
      008938 26 17            [ 1]  522 	jrne 4$ 
                                    523 ; not in dictionary
                                    524 ; compile it as TK_LABEL
      00893A 16 01            [ 2]  525 	ldw y,(XFIRST,sp)
      00893C A6 03            [ 1]  526 	ld a,#TK_LABEL 
      00893E 90 F7            [ 1]  527 	ld (y),a 
      008940 90 5C            [ 1]  528 	incw y
      008942                        529 24$:	
      008942 90 F6            [ 1]  530     ld a,(y)
      008944 27 04            [ 1]  531 	jreq 3$
      008946 90 5C            [ 1]  532 	incw y 
      008948 20 F8            [ 2]  533 	jra 24$ 
      00894A 90 5C            [ 1]  534 3$: incw y 
      00894C A6 03            [ 1]  535 	ld a,#TK_LABEL 
      00894E 5F               [ 1]  536 	clrw x 	
      00894F 20 11            [ 2]  537 	jra 5$ 
      008951                        538 4$:	
      008951 16 01            [ 2]  539 	ldw y,(XFIRST,sp)
      008953 A3 00 4E         [ 2]  540 	cpw x,#LET_IDX 
      008956 27 0A            [ 1]  541 	jreq 5$  ; don't compile LET command 
      008958 90 F7            [ 1]  542 	ld (y),a 
      00895A 90 5C            [ 1]  543 	incw y 
      00895C 90 FF            [ 2]  544 	ldw (y),x
      00895E 72 A9 00 02      [ 2]  545 	addw y,#2  
      0008E2                        546 5$:	_drop VSIZE 
      008962 5B 02            [ 2]    1     addw sp,#VSIZE 
      008964 81               [ 4]  547 	ret  	
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
      008965                        558 skip:
      008965 88               [ 1]  559 	push a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      008966 91 D6 01         [ 4]  560 1$:	ld a,([in.w],y)
      008969 27 0A            [ 1]  561 	jreq 2$
      00896B 11 01            [ 1]  562 	cp a,(C,sp)
      00896D 26 06            [ 1]  563 	jrne 2$
      00896F 72 5C 00 02      [ 1]  564 	inc in
      008973 20 F1            [ 2]  565 	jra 1$
      0008F5                        566 2$: _drop 1 
      008975 5B 01            [ 2]    1     addw sp,#1 
      008977 81               [ 4]  567 	ret
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
      008978                        592 get_token:: 
      0008F8                        593 	_vars VSIZE
      008978 52 02            [ 2]    1     sub sp,#VSIZE 
                                    594 ;	ld a,in 
                                    595 ;	sub a,count
                                    596 ;   jrmi 0$
                                    597 ;	clr a 
                                    598 ;	ret 
      00897A                        599 0$: 
      00897A 90 AE 16 90      [ 2]  600 	ldw y,#tib    	
      00897E A6 20            [ 1]  601 	ld a,#SPACE
      008980 CD 89 65         [ 4]  602 	call skip
      008983 55 00 02 00 03   [ 1]  603 	mov in.saved,in 
      008988 91 D6 01         [ 4]  604 	ld a,([in.w],y)
      00898B 26 05            [ 1]  605 	jrne 1$
      00898D 90 93            [ 1]  606 	ldw y,x 
      00898F CC 8B 34         [ 2]  607 	jp token_exit ; end of line 
      008992 72 5C 00 02      [ 1]  608 1$:	inc in 
      008996 CD 94 64         [ 4]  609 	call to_upper 
      008999 6B 01            [ 1]  610 	ld (TCHAR,sp),a 
                                    611 ; check for quoted string
      00899B                        612 str_tst:  	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      00091B                        613 	_case '"' nbr_tst
      00899B A6 22            [ 1]    1 	ld a,#'"' 
      00899D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00899F 26 0A            [ 1]    3 	jrne nbr_tst
      0089A1 A6 02            [ 1]  614 	ld a,#TK_QSTR
      0089A3 F7               [ 1]  615 	ld (x),a 
      0089A4 5C               [ 1]  616 	incw x 
      0089A5 CD 87 ED         [ 4]  617 	call parse_quote
      0089A8 CC 8B 34         [ 2]  618 	jp token_exit
      0089AB                        619 nbr_tst:
                                    620 ; check for hexadecimal number 
      0089AB A6 24            [ 1]  621 	ld a,#'$'
      0089AD 11 01            [ 1]  622 	cp a,(TCHAR,sp) 
      0089AF 27 17            [ 1]  623 	jreq 1$
                                    624 ;check for binary number 
      0089B1 A6 26            [ 1]  625 	ld a,#'&
      0089B3 11 01            [ 1]  626 	cp a,(TCHAR,sp)
      0089B5 26 0A            [ 1]  627 	jrne 0$
      0089B7 A6 84            [ 1]  628 	ld a,#TK_INTGR
      0089B9 F7               [ 1]  629 	ld (x),a 
      0089BA 5C               [ 1]  630 	incw x 
      0089BB CD 88 8C         [ 4]  631 	call parse_binary ; expect binary integer 
      0089BE CC 8B 34         [ 2]  632 	jp token_exit 
                                    633 ; check for decimal number 	
      0089C1 7B 01            [ 1]  634 0$:	ld a,(TCHAR,sp)
      0089C3 CD 88 DA         [ 4]  635 	call is_digit
      0089C6 24 0C            [ 1]  636 	jrnc 3$
      0089C8 A6 84            [ 1]  637 1$:	ld a,#TK_INTGR 
      0089CA F7               [ 1]  638 	ld (x),a 
      0089CB 5C               [ 1]  639 	incw x 
      0089CC 7B 01            [ 1]  640 	ld a,(TCHAR,sp)
      0089CE CD 88 42         [ 4]  641 	call parse_integer 
      0089D1 CC 8B 34         [ 2]  642 	jp token_exit 
      0089D4                        643 3$: 
      000954                        644 	_case '(' bkslsh_tst 
      0089D4 A6 28            [ 1]    1 	ld a,#'(' 
      0089D6 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0089D8 26 05            [ 1]    3 	jrne bkslsh_tst
      0089DA A6 06            [ 1]  645 	ld a,#TK_LPAREN
      0089DC CC 8B 30         [ 2]  646 	jp token_char   	
      0089DF                        647 bkslsh_tst: ; character token 
      00095F                        648 	_case '\',rparnt_tst
      0089DF A6 5C            [ 1]    1 	ld a,#'\' 
      0089E1 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0089E3 26 16            [ 1]    3 	jrne rparnt_tst
      0089E5 A6 04            [ 1]  649 	ld a,#TK_CHAR 
      0089E7 F7               [ 1]  650 	ld (x),a 
      0089E8 5C               [ 1]  651 	incw x 
      0089E9 91 D6 01         [ 4]  652 	ld a,([in.w],y)
      0089EC F7               [ 1]  653 	ld (x),a 
      0089ED 5C               [ 1]  654 	incw x
      0089EE 90 93            [ 1]  655 	ldw y,x 	 
      0089F0 72 5C 00 02      [ 1]  656 	inc in  
      0089F4 5F               [ 1]  657 	clrw x 
      0089F5 97               [ 1]  658 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      0089F6 A6 04            [ 1]  659 	ld a,#TK_CHAR 
      0089F8 CC 8B 34         [ 2]  660 	jp token_exit 
      0089FB                        661 rparnt_tst:		
      00097B                        662 	_case ')' colon_tst 
      0089FB A6 29            [ 1]    1 	ld a,#')' 
      0089FD 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0089FF 26 05            [ 1]    3 	jrne colon_tst
      008A01 A6 07            [ 1]  663 	ld a,#TK_RPAREN 
      008A03 CC 8B 30         [ 2]  664 	jp token_char
      008A06                        665 colon_tst:
      000986                        666 	_case ':' comma_tst 
      008A06 A6 3A            [ 1]    1 	ld a,#':' 
      008A08 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A0A 26 05            [ 1]    3 	jrne comma_tst
      008A0C A6 0A            [ 1]  667 	ld a,#TK_COLON 
      008A0E CC 8B 30         [ 2]  668 	jp token_char  
      008A11                        669 comma_tst:
      000991                        670 	_case COMMA sharp_tst 
      008A11 A6 2C            [ 1]    1 	ld a,#COMMA 
      008A13 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A15 26 05            [ 1]    3 	jrne sharp_tst
      008A17 A6 08            [ 1]  671 	ld a,#TK_COMMA
      008A19 CC 8B 30         [ 2]  672 	jp token_char
      008A1C                        673 sharp_tst:
      00099C                        674 	_case SHARP dash_tst 
      008A1C A6 23            [ 1]    1 	ld a,#SHARP 
      008A1E 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A20 26 05            [ 1]    3 	jrne dash_tst
      008A22 A6 09            [ 1]  675 	ld a,#TK_SHARP
      008A24 CC 8B 30         [ 2]  676 	jp token_char  	 	 
      008A27                        677 dash_tst: 	
      0009A7                        678 	_case '-' at_tst 
      008A27 A6 2D            [ 1]    1 	ld a,#'-' 
      008A29 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A2B 26 05            [ 1]    3 	jrne at_tst
      008A2D A6 11            [ 1]  679 	ld a,#TK_MINUS  
      008A2F CC 8B 30         [ 2]  680 	jp token_char 
      008A32                        681 at_tst:
      0009B2                        682 	_case '@' qmark_tst 
      008A32 A6 40            [ 1]    1 	ld a,#'@' 
      008A34 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A36 26 05            [ 1]    3 	jrne qmark_tst
      008A38 A6 05            [ 1]  683 	ld a,#TK_ARRAY 
      008A3A CC 8B 30         [ 2]  684 	jp token_char
      008A3D                        685 qmark_tst:
      0009BD                        686 	_case '?' tick_tst 
      008A3D A6 3F            [ 1]    1 	ld a,#'?' 
      008A3F 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A41 26 12            [ 1]    3 	jrne tick_tst
      008A43 A6 80            [ 1]  687 	ld a,#TK_CMD  
      008A45 F7               [ 1]  688 	ld (x),a 
      008A46 5C               [ 1]  689 	incw x 
      008A47 90 93            [ 1]  690 	ldw y,x 
      008A49 AE 00 70         [ 2]  691 	ldw x,#PRT_IDX 
      008A4C 90 FF            [ 2]  692 	ldw (y),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      008A4E 72 A9 00 02      [ 2]  693 	addw y,#2
      008A52 CC 8B 34         [ 2]  694 	jp token_exit
      008A55                        695 tick_tst: ; comment 
      0009D5                        696 	_case TICK plus_tst 
      008A55 A6 27            [ 1]    1 	ld a,#TICK 
      008A57 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A59 26 35            [ 1]    3 	jrne plus_tst
      008A5B A6 80            [ 1]  697 	ld a,#TK_CMD
      008A5D F7               [ 1]  698 	ld (x),a 
      008A5E 5C               [ 1]  699 	incw x
      008A5F 90 AE 00 8A      [ 2]  700 	ldw y,#REM_IDX
      008A63 FF               [ 2]  701 	ldw (x),y 
      008A64 1C 00 02         [ 2]  702 	addw x,#2  
      008A67                        703 copy_comment:
      008A67 90 AE 16 90      [ 2]  704 	ldw y,#tib 
      008A6B 72 B9 00 01      [ 2]  705 	addw y,in.w
      008A6F 90 89            [ 2]  706 	pushw y
      008A71 CD 8E DF         [ 4]  707 	call strcpy
      008A74 72 F2 01         [ 2]  708     subw y,(1,sp)
      008A77 90 9F            [ 1]  709 	ld a,yl 
      008A79 CB 00 02         [ 1]  710 	add a,in
      008A7C C7 00 02         [ 1]  711 	ld in,a 
      008A7F 1F 01            [ 2]  712 	ldw (1,sp),x
      008A81 72 F9 01         [ 2]  713 	addw y,(1,sp)
      008A84 90 5C            [ 1]  714 	incw y 
      000A06                        715 	_drop 2 
      008A86 5B 02            [ 2]    1     addw sp,#2 
      008A88 AE 00 8A         [ 2]  716 	ldw x,#REM_IDX 
      008A8B A6 80            [ 1]  717 	ld a,#TK_CMD 
      008A8D CC 8B 34         [ 2]  718 	jp token_exit 
      008A90                        719 plus_tst:
      000A10                        720 	_case '+' star_tst 
      008A90 A6 2B            [ 1]    1 	ld a,#'+' 
      008A92 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A94 26 05            [ 1]    3 	jrne star_tst
      008A96 A6 10            [ 1]  721 	ld a,#TK_PLUS  
      008A98 CC 8B 30         [ 2]  722 	jp token_char 
      008A9B                        723 star_tst:
      000A1B                        724 	_case '*' slash_tst 
      008A9B A6 2A            [ 1]    1 	ld a,#'*' 
      008A9D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A9F 26 05            [ 1]    3 	jrne slash_tst
      008AA1 A6 20            [ 1]  725 	ld a,#TK_MULT 
      008AA3 CC 8B 30         [ 2]  726 	jp token_char 
      008AA6                        727 slash_tst: 
      000A26                        728 	_case '/' prcnt_tst 
      008AA6 A6 2F            [ 1]    1 	ld a,#'/' 
      008AA8 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008AAA 26 05            [ 1]    3 	jrne prcnt_tst
      008AAC A6 21            [ 1]  729 	ld a,#TK_DIV 
      008AAE CC 8B 30         [ 2]  730 	jp token_char 
      008AB1                        731 prcnt_tst:
      000A31                        732 	_case '%' eql_tst 
      008AB1 A6 25            [ 1]    1 	ld a,#'%' 
      008AB3 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      008AB5 26 05            [ 1]    3 	jrne eql_tst
      008AB7 A6 22            [ 1]  733 	ld a,#TK_MOD
      008AB9 CC 8B 30         [ 2]  734 	jp token_char  
                                    735 ; 1 or 2 character tokens 	
      008ABC                        736 eql_tst:
      000A3C                        737 	_case '=' gt_tst 		
      008ABC A6 3D            [ 1]    1 	ld a,#'=' 
      008ABE 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008AC0 26 05            [ 1]    3 	jrne gt_tst
      008AC2 A6 32            [ 1]  738 	ld a,#TK_EQUAL
      008AC4 CC 8B 30         [ 2]  739 	jp token_char 
      008AC7                        740 gt_tst:
      000A47                        741 	_case '>' lt_tst 
      008AC7 A6 3E            [ 1]    1 	ld a,#'>' 
      008AC9 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008ACB 26 23            [ 1]    3 	jrne lt_tst
      008ACD A6 31            [ 1]  742 	ld a,#TK_GT 
      008ACF 6B 02            [ 1]  743 	ld (ATTRIB,sp),a 
      008AD1 91 D6 01         [ 4]  744 	ld a,([in.w],y)
      008AD4 72 5C 00 02      [ 1]  745 	inc in 
      008AD8 A1 3D            [ 1]  746 	cp a,#'=
      008ADA 26 04            [ 1]  747 	jrne 1$
      008ADC A6 33            [ 1]  748 	ld a,#TK_GE 
      008ADE 20 50            [ 2]  749 	jra token_char  
      008AE0 A1 3C            [ 1]  750 1$: cp a,#'<
      008AE2 26 04            [ 1]  751 	jrne 2$
      008AE4 A6 35            [ 1]  752 	ld a,#TK_NE 
      008AE6 20 48            [ 2]  753 	jra token_char 
      008AE8 72 5A 00 02      [ 1]  754 2$: dec in
      008AEC 7B 02            [ 1]  755 	ld a,(ATTRIB,sp)
      008AEE 20 40            [ 2]  756 	jra token_char 	 
      008AF0                        757 lt_tst:
      000A70                        758 	_case '<' other
      008AF0 A6 3C            [ 1]    1 	ld a,#'<' 
      008AF2 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008AF4 26 23            [ 1]    3 	jrne other
      008AF6 A6 34            [ 1]  759 	ld a,#TK_LT 
      008AF8 6B 02            [ 1]  760 	ld (ATTRIB,sp),a 
      008AFA 91 D6 01         [ 4]  761 	ld a,([in.w],y)
      008AFD 72 5C 00 02      [ 1]  762 	inc in 
      008B01 A1 3D            [ 1]  763 	cp a,#'=
      008B03 26 04            [ 1]  764 	jrne 1$
      008B05 A6 36            [ 1]  765 	ld a,#TK_LE 
      008B07 20 27            [ 2]  766 	jra token_char 
      008B09 A1 3E            [ 1]  767 1$: cp a,#'>
      008B0B 26 04            [ 1]  768 	jrne 2$
      008B0D A6 35            [ 1]  769 	ld a,#TK_NE 
      008B0F 20 1F            [ 2]  770 	jra token_char 
      008B11 72 5A 00 02      [ 1]  771 2$: dec in 
      008B15 7B 02            [ 1]  772 	ld a,(ATTRIB,sp)
      008B17 20 17            [ 2]  773 	jra token_char 	
      008B19                        774 other: ; not a special character 	 
      008B19 7B 01            [ 1]  775 	ld a,(TCHAR,sp)
      008B1B CD 88 C9         [ 4]  776 	call is_alpha 
      008B1E 25 03            [ 1]  777 	jrc 30$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      008B20 CC 92 15         [ 2]  778 	jp syntax_error 
      008B23                        779 30$: 
      008B23 CD 89 0F         [ 4]  780 	call parse_keyword
      008B26 A3 9D 38         [ 2]  781 	cpw x,#remark 
      008B29 26 09            [ 1]  782 	jrne token_exit 
      008B2B 90 93            [ 1]  783 	ldw y,x 
      008B2D CC 8A 67         [ 2]  784 	jp copy_comment 
      008B30                        785 token_char:
      008B30 F7               [ 1]  786 	ld (x),a 
      008B31 5C               [ 1]  787 	incw x
      008B32 90 93            [ 1]  788 	ldw y,x 
      008B34                        789 token_exit:
      000AB4                        790 	_drop VSIZE 
      008B34 5B 02            [ 2]    1     addw sp,#VSIZE 
      008B36 81               [ 4]  791 	ret
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
      008B37                        811 compile::
      000AB7                        812 	_vars VSIZE 
      008B37 52 02            [ 2]    1     sub sp,#VSIZE 
      008B39 55 00 1B 00 05   [ 1]  813 	mov basicptr,txtbgn
      008B3E 72 1A 00 22      [ 1]  814 	bset flags,#FCOMP 
      008B42 A6 00            [ 1]  815 	ld a,#0
      008B44 AE 00 00         [ 2]  816 	ldw x,#0
      008B47 CF 16 E0         [ 2]  817 	ldw pad,x ; destination buffer 
      008B4A C7 16 E2         [ 1]  818 	ld pad+2,a ; count 
      008B4D AE 16 E3         [ 2]  819 	ldw x,#pad+3
      008B50 72 5F 00 02      [ 1]  820 	clr in 
      008B54 CD 89 78         [ 4]  821 	call get_token
      008B57 A1 84            [ 1]  822 	cp a,#TK_INTGR
      008B59 26 11            [ 1]  823 	jrne 2$
      008B5B A3 00 01         [ 2]  824 	cpw x,#1 
      008B5E 2A 05            [ 1]  825 	jrpl 1$
      008B60 A6 0A            [ 1]  826 	ld a,#ERR_BAD_VALUE
      008B62 CC 92 17         [ 2]  827 	jp tb_error
      008B65 CF 16 E0         [ 2]  828 1$:	ldw pad,x 
      008B68 90 AE 16 E3      [ 2]  829 	ldw y,#pad+3 
      008B6C 90 A3 17 60      [ 2]  830 2$:	cpw y,#stack_full 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      008B70 25 05            [ 1]  831 	jrult 3$
      008B72 A6 0F            [ 1]  832 	ld a,#ERR_BUF_FULL 
      008B74 CC 92 17         [ 2]  833 	jp tb_error 
      008B77                        834 3$:	
      008B77 93               [ 1]  835 	ldw x,y 
      008B78 CD 89 78         [ 4]  836 	call get_token 
      008B7B A1 00            [ 1]  837 	cp a,#TK_NONE 
      008B7D 26 ED            [ 1]  838 	jrne 2$ 
                                    839 ; compilation completed  
      008B7F 72 A2 16 E0      [ 2]  840 	subw y,#pad
      008B83 90 9F            [ 1]  841     ld a,yl
      008B85 AE 16 E0         [ 2]  842 	ldw x,#pad 
      008B88 CF 00 19         [ 2]  843 	ldw ptr16,x 
      008B8B E7 02            [ 1]  844 	ld (2,x),a 
      008B8D FE               [ 2]  845 	ldw x,(x)
      008B8E 27 09            [ 1]  846 	jreq 10$
      008B90 CD 87 7B         [ 4]  847 	call insert_line
      008B93 72 5F 00 04      [ 1]  848 	clr  count 
      008B97 20 0F            [ 2]  849 	jra  11$ 
      008B99                        850 10$: ; line# is zero 
      008B99 CE 00 19         [ 2]  851 	ldw x,ptr16  
      008B9C CF 00 05         [ 2]  852 	ldw basicptr,x 
      008B9F E6 02            [ 1]  853 	ld a,(2,x)
      008BA1 C7 00 04         [ 1]  854 	ld count,a 
      008BA4 35 03 00 02      [ 1]  855 	mov in,#3 
      008BA8                        856 11$:
      000B28                        857 	_drop VSIZE 
      008BA8 5B 02            [ 2]    1     addw sp,#VSIZE 
      008BAA 72 1B 00 22      [ 1]  858 	bres flags,#FCOMP 
      008BAE 81               [ 4]  859 	ret 
                                    860 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                     27     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000000     5 SEPARATE=0 ; set to 1 for 'make separate' 
                                      6 
                                      7 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
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
      008BAF                         48 cpy_cmd_name:
      008BAF F6               [ 1]   49 	ld a,(x)
      008BB0 5C               [ 1]   50 	incw x
      008BB1 A4 0F            [ 1]   51 	and a,#15  
      008BB3 88               [ 1]   52 	push a 
      008BB4 0D 01            [ 1]   53     tnz (1,sp) 
      008BB6 27 0A            [ 1]   54 	jreq 9$
      008BB8 F6               [ 1]   55 1$:	ld a,(x)
      008BB9 90 F7            [ 1]   56 	ld (y),a  
      008BBB 5C               [ 1]   57 	incw x
      008BBC 90 5C            [ 1]   58 	incw y 
      008BBE 0A 01            [ 1]   59 	dec (1,sp)	 
      008BC0 26 F6            [ 1]   60 	jrne 1$
      008BC2 84               [ 1]   61 9$: pop a 
      008BC3 81               [ 4]   62 	ret	
                                     63 
                                     64 ;--------------------------
                                     65 ; add a space after letter or 
                                     66 ; digit.
                                     67 ; input:
                                     68 ;   Y     pointer to buffer 
                                     69 ; output:
                                     70 ;   Y    moved to end 
                                     71 ;--------------------------
      008BC4                         72 add_space:
      008BC4 90 5A            [ 2]   73 	decw y 
      008BC6 90 F6            [ 1]   74 	ld a,(y)
      008BC8 90 5C            [ 1]   75 	incw y
      008BCA CD 88 E3         [ 4]   76 	call is_alnum 
      008BCD 24 06            [ 1]   77 	jrnc 1$
      008BCF A6 20            [ 1]   78 	ld a,#SPACE 
      008BD1 90 F7            [ 1]   79 	ld (y),a 
      008BD3 90 5C            [ 1]   80 	incw y 
      008BD5 81               [ 4]   81 1$: ret 
                                     82 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
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
      008BD6                         93 right_align::
      008BD6 88               [ 1]   94 	push a 
      008BD7 7B 01            [ 1]   95 0$: ld a,(1,sp)
      008BD9 C1 00 23         [ 1]   96 	cp a,tab_width 
      008BDC 2A 08            [ 1]   97 	jrpl 1$
      008BDE A6 20            [ 1]   98 	ld a,#SPACE 
      008BE0 5A               [ 2]   99 	decw x
      008BE1 F7               [ 1]  100 	ld (x),a  
      008BE2 0C 01            [ 1]  101 	inc (1,sp)
      008BE4 20 F1            [ 2]  102 	jra 0$ 
      008BE6 84               [ 1]  103 1$: pop a 	
      008BE7 81               [ 4]  104 	ret 
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
      008BE8                        117 cpy_quote:
      008BE8 A6 22            [ 1]  118 	ld a,#'"
      008BEA 90 F7            [ 1]  119 	ld (y),a 
      008BEC 90 5C            [ 1]  120 	incw y 
      008BEE F6               [ 1]  121 1$:	ld a,(x)
      008BEF 27 30            [ 1]  122 	jreq 9$
      008BF1 5C               [ 1]  123 	incw x 
      008BF2 A1 20            [ 1]  124 	cp a,#SPACE 
      008BF4 25 0E            [ 1]  125 	jrult 3$
      008BF6 90 F7            [ 1]  126 	ld (y),a
      008BF8 90 5C            [ 1]  127 	incw y 
      008BFA A1 5C            [ 1]  128 	cp a,#'\ 
      008BFC 26 F0            [ 1]  129 	jrne 1$ 
      008BFE                        130 2$:
      008BFE 90 F7            [ 1]  131 	ld (y),a
      008C00 90 5C            [ 1]  132 	incw y  
      008C02 20 EA            [ 2]  133 	jra 1$
      008C04 88               [ 1]  134 3$: push a 
      008C05 A6 5C            [ 1]  135 	ld a,#'\
      008C07 90 F7            [ 1]  136 	ld (y),a 
      008C09 90 5C            [ 1]  137 	incw y  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      008C0B 84               [ 1]  138 	pop a 
      008C0C A0 07            [ 1]  139 	sub a,#7
      008C0E C7 00 0F         [ 1]  140 	ld acc8,a 
      008C11 72 5F 00 0E      [ 1]  141 	clr acc16
      008C15 89               [ 2]  142 	pushw x
      008C16 AE 88 3A         [ 2]  143 	ldw x,#escaped 
      008C19 72 BB 00 0E      [ 2]  144 	addw x,acc16 
      008C1D F6               [ 1]  145 	ld a,(x)
      008C1E 85               [ 2]  146 	popw x
      008C1F 20 DD            [ 2]  147 	jra 2$
      008C21 A6 22            [ 1]  148 9$: ld a,#'"
      008C23 90 F7            [ 1]  149 	ld (y),a 
      008C25 90 5C            [ 1]  150 	incw y  
      008C27 5C               [ 1]  151 	incw x 
      008C28 81               [ 4]  152 	ret
                                    153 
                                    154 ;--------------------------
                                    155 ; return variable name 
                                    156 ; from its address.
                                    157 ; input:
                                    158 ;   X    variable address
                                    159 ; output:
                                    160 ;   A     variable letter
                                    161 ;--------------------------
      008C29                        162 var_name::
      008C29 1D 00 30         [ 2]  163 		subw x,#vars 
      008C2C 9F               [ 1]  164 		ld a,xl 
      008C2D 44               [ 1]  165 		srl a 
      008C2E AB 41            [ 1]  166 		add a,#'A 
      008C30 81               [ 4]  167 		ret 
                                    168 
                                    169 ;-----------------------------
                                    170 ; return cmd  idx from its 
                                    171 ; code address 
                                    172 ; input:
                                    173 ;   X      code address 
                                    174 ; output:
                                    175 ;   X      cmd_idx
                                    176 ;-----------------------------
      008C31                        177 get_cmd_idx:
      008C31 90 89            [ 2]  178 	pushw y
      008C33 90 AE AD 83      [ 2]  179 	ldw y,#code_addr 
      008C37 90 CF 00 19      [ 2]  180 	ldw ptr16,y 
      008C3B 90 5F            [ 1]  181 	clrw y 
      008C3D 91 D3 19         [ 5]  182 1$:	cpw x,([ptr16],y)
      008C40 27 0C            [ 1]  183 	jreq 3$ 
      008C42 90 5C            [ 1]  184 	incw y 
      008C44 91 D6 19         [ 4]  185 	ld a,([ptr16],y)
      008C47 90 5C            [ 1]  186 	incw y
      008C49 91 DA 19         [ 4]  187 	or a,([ptr16],y)	
      008C4C 26 EF            [ 1]  188 	jrne 1$
      008C4E 93               [ 1]  189 3$: ldw x,y 
      008C4F 90 85            [ 2]  190 	popw y 
      008C51 81               [ 4]  191 	ret
                                    192 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                    193 
                                    194 ;-------------------------------------
                                    195 ; decompile tokens list 
                                    196 ; to original text line 
                                    197 ; input:
                                    198 ;   [basicptr]  pointer at line 
                                    199 ;   Y           output buffer
                                    200 ; output:
                                    201 ;   A           length 
                                    202 ;   Y           after string  
                                    203 ;------------------------------------
                           000001   204 	BASE_SAV=1
                           000002   205 	WIDTH_SAV=2
                           000003   206 	STR=3
                           000004   207 	VSIZE=4 
      008C52                        208 decompile::
      000BD2                        209 	_vars VSIZE
      008C52 52 04            [ 2]    1     sub sp,#VSIZE 
      008C54 C6 00 0B         [ 1]  210 	ld a,base
      008C57 6B 01            [ 1]  211 	ld (BASE_SAV,sp),a  
      008C59 C6 00 23         [ 1]  212 	ld a,tab_width 
      008C5C 6B 02            [ 1]  213 	ld (WIDTH_SAV,sp),a 
      008C5E 17 03            [ 2]  214 	ldw (STR,sp),y   
      008C60 72 CE 00 05      [ 5]  215 	ldw x,[basicptr] ; line number 
      008C64 35 0A 00 0B      [ 1]  216 	mov base,#10
      008C68 35 05 00 23      [ 1]  217 	mov tab_width,#5
      008C6C 72 5F 00 0D      [ 1]  218 	clr acc24 
      008C70 CF 00 0E         [ 2]  219 	ldw acc16,x
      008C73 CD 93 74         [ 4]  220 	call itoa  
      008C76 CD 8B D6         [ 4]  221 	call right_align 
      008C79 88               [ 1]  222 	push a 
      008C7A 90 93            [ 1]  223 1$:	ldw y,x ; source
      008C7C 1E 04            [ 2]  224 	ldw x,(STR+1,sp) ; destination
      008C7E CD 8E DF         [ 4]  225 	call strcpy 
      008C81 90 5F            [ 1]  226 	clrw y 
      008C83 84               [ 1]  227 	pop a 
      008C84 90 97            [ 1]  228 	ld yl,a 
      008C86 72 F9 03         [ 2]  229 	addw y,(STR,sp)
      008C89 A6 20            [ 1]  230 	ld a,#SPACE 
      008C8B 90 F7            [ 1]  231 	ld (y),a 
      008C8D 90 5C            [ 1]  232 	incw y 
      008C8F 72 5F 00 23      [ 1]  233 	clr tab_width
      008C93 AE 00 03         [ 2]  234 	ldw x,#3
      008C96 CF 00 01         [ 2]  235 	ldw in.w,x 
      008C99                        236 decomp_loop:
      008C99 90 89            [ 2]  237 	pushw y
      008C9B CD 93 08         [ 4]  238 	call next_token 
      008C9E 90 85            [ 2]  239 	popw y 
      008CA0 4D               [ 1]  240 	tnz a  
      008CA1 26 03            [ 1]  241 	jrne 1$
      008CA3 CC 8D A9         [ 2]  242 	jp 20$
      008CA6 2B 03            [ 1]  243 1$:	jrmi 2$
      008CA8 CC 8D 24         [ 2]  244 	jp 6$
      008CAB                        245 2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR
      008CAB A1 85            [ 1]  246 	cp a,#TK_VAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      008CAD 26 0C            [ 1]  247 	jrne 3$
                                    248 ;; TK_VAR 
      008CAF CD 8B C4         [ 4]  249 	call add_space  
      008CB2 CD 8C 29         [ 4]  250 	call var_name
      008CB5 90 F7            [ 1]  251 	ld (y),a 
      008CB7 90 5C            [ 1]  252 	incw y  
      008CB9 20 DE            [ 2]  253 	jra decomp_loop
      008CBB                        254 3$:
      008CBB A1 84            [ 1]  255 	cp a,#TK_INTGR
      008CBD 26 22            [ 1]  256 	jrne 4$
                                    257 ;; TK_INTGR
      008CBF CD 8B C4         [ 4]  258 	call add_space
      008CC2 72 5F 00 0D      [ 1]  259 	clr acc24 
      008CC6 CF 00 0E         [ 2]  260 	ldw acc16,x 
      008CC9 90 89            [ 2]  261 	pushw y 
      008CCB CD 93 74         [ 4]  262 	call itoa  
      008CCE 16 01            [ 2]  263 	ldw y,(1,sp) 
      008CD0 88               [ 1]  264 	push a 
      008CD1 51               [ 1]  265 	exgw x,y 
      008CD2 CD 8E DF         [ 4]  266 	call strcpy 
      008CD5 90 5F            [ 1]  267 	clrw y
      008CD7 84               [ 1]  268 	pop a  
      008CD8 90 97            [ 1]  269 	ld yl,a 
      008CDA 72 F9 01         [ 2]  270 	addw y,(1,sp)
      000C5D                        271 	_drop 2 
      008CDD 5B 02            [ 2]    1     addw sp,#2 
      008CDF 20 B8            [ 2]  272 	jra decomp_loop
      008CE1                        273 4$: ; dictionary keyword 
      008CE1 CD 8C 31         [ 4]  274 	call get_cmd_idx 
      008CE4 A3 00 8A         [ 2]  275 	cpw x,#REM_IDX
      008CE7 26 23            [ 1]  276 	jrne 5$
      008CE9 CE 00 05         [ 2]  277 	ldw x,basicptr 
                                    278 ; copy comment to buffer 
      008CEC CD 8B C4         [ 4]  279 	call add_space
      008CEF A6 27            [ 1]  280 	ld a,#''
      008CF1 90 F7            [ 1]  281 	ld (y),a 
      008CF3 90 5C            [ 1]  282 	incw y 
      008CF5                        283 46$:
      008CF5 72 D6 00 01      [ 4]  284 	ld a,([in.w],x)
      008CF9 72 5C 00 02      [ 1]  285 	inc in  
      008CFD 90 F7            [ 1]  286 	ld (y),a 
      008CFF 90 5C            [ 1]  287 	incw y 
      008D01 C6 00 02         [ 1]  288 	ld a,in 
      008D04 C1 00 04         [ 1]  289 	cp a,count 
      008D07 2B EC            [ 1]  290 	jrmi 46$
      008D09 CC 8D A9         [ 2]  291 	jp 20$  
      008D0C A3 00 4E         [ 2]  292 5$: cpw x,#LET_IDX 
      008D0F 26 03            [ 1]  293 	jrne 51$
      008D11 CC 8C 99         [ 2]  294 	jp decomp_loop ; down display LET 	
      008D14                        295 51$: ; insert command name 
      008D14 CD 8B C4         [ 4]  296 	call add_space  
      008D17 90 89            [ 2]  297 	pushw y
      008D19 CD 8D E4         [ 4]  298 	call cmd_name
      008D1C 90 85            [ 2]  299 	popw y 
      008D1E CD 8B AF         [ 4]  300 	call cpy_cmd_name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      008D21 CC 8C 99         [ 2]  301 	jp decomp_loop 
      008D24                        302 6$:
                                    303 ; label?
      008D24 A1 03            [ 1]  304 	cp a,#TK_LABEL 
      008D26 26 19            [ 1]  305 	jrne 64$
                                    306 ; copy label string to output buffer   	
      008D28 A6 20            [ 1]  307 	ld a,#32 
      008D2A 90 F7            [ 1]  308 	ld (y),a 
      008D2C 90 5C            [ 1]  309 	incw y 
      008D2E                        310 61$:
      008D2E F6               [ 1]  311 	ld a,(x)
      008D2F 27 07            [ 1]  312 	jreq 62$ 
      008D31 5C               [ 1]  313 	incw x  
      008D32 90 F7            [ 1]  314 	ld (y),a 
      008D34 90 5C            [ 1]  315 	incw y 
      008D36 20 F6            [ 2]  316 	jra 61$ 
      008D38                        317 62$: 
      008D38 A6 20            [ 1]  318 	ld a,#32 
      008D3A 90 F7            [ 1]  319 	ld (y),a 
      008D3C 90 5C            [ 1]  320 	incw y 
      008D3E CC 8C 99         [ 2]  321 	jp decomp_loop
      008D41                        322 64$:
      008D41 A1 02            [ 1]  323 	cp a,#TK_QSTR 
      008D43 26 06            [ 1]  324 	jrne 7$
                                    325 ;; TK_QSTR
      008D45 CD 8B E8         [ 4]  326 	call cpy_quote  
      008D48 CC 8C 99         [ 2]  327 	jp decomp_loop
      008D4B                        328 7$:
      008D4B A1 04            [ 1]  329 	cp a,#TK_CHAR 
      008D4D 26 0E            [ 1]  330 	jrne 8$
                                    331 ;; TK_CHAR 
      008D4F A6 5C            [ 1]  332 	ld a,#'\ 
      008D51 90 F7            [ 1]  333 	ld (y),a 
      008D53 90 5C            [ 1]  334 	incw y 
      008D55 9F               [ 1]  335 	ld a,xl 
      008D56 90 F7            [ 1]  336 	ld (y),a 
      008D58 90 5C            [ 1]  337 	incw y 
      008D5A CC 8C 99         [ 2]  338 	jp decomp_loop
      008D5D A1 0A            [ 1]  339 8$: cp a,#TK_COLON 
      008D5F 26 09            [ 1]  340 	jrne 9$
      008D61 A6 3A            [ 1]  341 	ld a,#':
      008D63                        342 81$:
      008D63 90 F7            [ 1]  343 	ld (y),a 
      008D65 90 5C            [ 1]  344 	incw y 
      008D67                        345 82$:
      008D67 CC 8C 99         [ 2]  346 	jp decomp_loop
      008D6A                        347 9$: 
      008D6A A1 09            [ 1]  348 	cp a,#TK_SHARP
      008D6C 22 0A            [ 1]  349 	jrugt 10$ 
      008D6E A0 05            [ 1]  350 	sub a,#TK_ARRAY 
      008D70 5F               [ 1]  351 	clrw x 
      008D71 97               [ 1]  352 	ld xl,a
      008D72 1C 8D BF         [ 2]  353 	addw x,#single_char 
      008D75 F6               [ 1]  354 	ld a,(x)
      008D76 20 EB            [ 2]  355 	jra 81$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      008D78                        356 10$: 
      008D78 A1 11            [ 1]  357 	cp a,#TK_MINUS 
      008D7A 22 0A            [ 1]  358 	jrugt 11$
      008D7C A0 10            [ 1]  359 	sub a,#TK_PLUS 
      008D7E 5F               [ 1]  360 	clrw x 
      008D7F 97               [ 1]  361 	ld xl,a 
      008D80 1C 8D C4         [ 2]  362 	addw x,#add_char 
      008D83 F6               [ 1]  363 	ld a,(x)
      008D84 20 DD            [ 2]  364 	jra 81$
      008D86                        365 11$:
      008D86 A1 22            [ 1]  366     cp a,#TK_MOD 
      008D88 22 0A            [ 1]  367 	jrugt 12$
      008D8A A0 20            [ 1]  368 	sub a,#TK_MULT
      008D8C 5F               [ 1]  369 	clrw x 
      008D8D 97               [ 1]  370 	ld xl,a 
      008D8E 1C 8D C6         [ 2]  371 	addw x,#mul_char
      008D91 F6               [ 1]  372 	ld a,(x)
      008D92 20 CF            [ 2]  373 	jra 81$
      008D94                        374 12$:
      008D94 A0 31            [ 1]  375 	sub a,#TK_GT  
      008D96 48               [ 1]  376 	sll a 
      008D97 5F               [ 1]  377 	clrw x 
      008D98 97               [ 1]  378 	ld xl,a 
      008D99 1C 8D C9         [ 2]  379 	addw x,#relop_str 
      008D9C FE               [ 2]  380 	ldw x,(x)
      008D9D F6               [ 1]  381 	ld a,(x)
      008D9E 5C               [ 1]  382 	incw x 
      008D9F 90 F7            [ 1]  383 	ld (y),a
      008DA1 90 5C            [ 1]  384 	incw y 
      008DA3 F6               [ 1]  385 	ld a,(x)
      008DA4 26 BD            [ 1]  386 	jrne 81$
      008DA6 CC 8C 99         [ 2]  387 	jp decomp_loop 
      008DA9                        388 20$: 
      008DA9 90 7F            [ 1]  389 	clr (y)
      008DAB 1E 03            [ 2]  390 	ldw x,(STR,sp)
      008DAD 7B 01            [ 1]  391 	ld a,(BASE_SAV,sp)
      008DAF C7 00 0B         [ 1]  392 	ld base,a 
      008DB2 7B 02            [ 1]  393 	ld a,(WIDTH_SAV,sp)
      008DB4 C7 00 23         [ 1]  394 	ld tab_width,a
      008DB7 72 F2 03         [ 2]  395 	subw y,(STR,sp) 
      008DBA 90 9F            [ 1]  396 	ld a,yl 
      000D3C                        397 	_drop VSIZE 
      008DBC 5B 04            [ 2]    1     addw sp,#VSIZE 
      008DBE 81               [ 4]  398 	ret 
                                    399 
      008DBF 40 28 29 2C 23         400 single_char: .byte '@','(',')',',','#'
      008DC4 2B 2D                  401 add_char: .byte '+','-'
      008DC6 2A 2F 25               402 mul_char: .byte '*','/','%'
      008DC9 8D D5 8D D7 8D D9 8D   403 relop_str: .word gt,equal,ge,lt,le,ne 
             DC 8D DE 8D E1
      008DD5 3E 00                  404 gt: .asciz ">"
      008DD7 3D 00                  405 equal: .asciz "="
      008DD9 3E 3D 00               406 ge: .asciz ">="
      008DDC 3C 00                  407 lt: .asciz "<"
      008DDE 3C 3D 00               408 le: .asciz "<="
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      008DE1 3C 3E 00               409 ne:  .asciz "<>"
                                    410 
                                    411 ;----------------------------------
                                    412 ; search in kword_dict name
                                    413 ; from its execution address 
                                    414 ; input:
                                    415 ;   X       	cmd_index 
                                    416 ; output:
                                    417 ;   X 			cstr*  | 0 
                                    418 ;--------------------------------
                           000001   419 	CMDX=1 
                           000003   420 	LINK=3 
                           000004   421 	VSIZE=4
      008DE4                        422 cmd_name:
      000D64                        423 	_vars VSIZE 
      008DE4 52 04            [ 2]    1     sub sp,#VSIZE 
      008DE6 72 5F 00 0E      [ 1]  424 	clr acc16 
      008DEA 1F 01            [ 2]  425 	ldw (CMDX,sp),x  
      008DEC AE AD 7B         [ 2]  426 	ldw x,#kword_dict	
      008DEF 1F 03            [ 2]  427 1$:	ldw (LINK,sp),x
      008DF1 E6 02            [ 1]  428 	ld a,(2,x)
      008DF3 A4 0F            [ 1]  429 	and a,#15 
      008DF5 C7 00 0F         [ 1]  430 	ld acc8,a 
      008DF8 1C 00 03         [ 2]  431 	addw x,#3
      008DFB 72 BB 00 0E      [ 2]  432 	addw x,acc16
      008DFF FE               [ 2]  433 	ldw x,(x) ; command index  
      008E00 13 01            [ 2]  434 	cpw x,(CMDX,sp)
      008E02 27 0A            [ 1]  435 	jreq 2$
      008E04 1E 03            [ 2]  436 	ldw x,(LINK,sp)
      008E06 FE               [ 2]  437 	ldw x,(x) 
      008E07 1D 00 02         [ 2]  438 	subw x,#2  
      008E0A 26 E3            [ 1]  439 	jrne 1$
      008E0C 20 05            [ 2]  440 	jra 9$
      008E0E 1E 03            [ 2]  441 2$: ldw x,(LINK,sp)
      008E10 1C 00 02         [ 2]  442 	addw x,#2 	
      000D93                        443 9$:	_drop VSIZE
      008E13 5B 04            [ 2]    1     addw sp,#VSIZE 
      008E15 81               [ 4]  444 	ret
                                    445 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                     29     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000000     5 SEPARATE=0 ; set to 1 for 'make separate' 
                                      6 
                                      7 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
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
      00000C                         52 acc32:  .blkb 1 ; 32 bit accumulator most signicant byte 
      00000D                         53 acc24:: .blkb 1 ; 24 bit accumulator upper-byte 
      00000E                         54 acc16:: .blkb 1 ; 16 bit accumulator, acc24 high-byte
      00000F                         55 acc8::  .blkb 1 ;  8 bit accumulator, acc24 low-byte  
      000010                         56 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
      000012                         57 timer:: .blkw 1 ;  milliseconds count down timer 
      000014                         58 seedx: .blkw 1  ; xorshift 16 seed x  used by RND() function 
      000016                         59 seedy: .blkw 1  ; xorshift 16 seed y  used by RND() funcion
      000018                         60 farptr: .blkb 1 ; 24 bits pointer used by file system, upper-byte
      000019                         61 ptr16::  .blkb 1 ; 16 bits pointer , farptr high-byte 
      00001A                         62 ptr8:   .blkb 1 ; 8 bits pointer, farptr low-byte  
      00001B                         63 txtbgn:: .blkw 1 ; tokenized BASIC text beginning address 
      00001D                         64 txtend:: .blkw 1 ; tokenized BASIC text end address 
      00001F                         65 loop_depth: .blkb 1 ; level of nested loop. Conformity check   
      000020                         66 array_size: .blkw 1 ; array size, free RAM left after BASIC code.  
      000022                         67 flags:: .blkb 1 ; various boolean flags
      000023                         68 tab_width:: .blkb 1 ; print colon width (default 6)
      000024                         69 free_eeprom: .blkw 1 ; start address of free eeprom 
      000026                         70 rx1_queue: .ds RX_QUEUE_SIZE ; UART1 receive circular queue 
      00002E                         71 rx1_head:  .blkb 1 ; rx1_queue head pointer
      00002F                         72 rx1_tail:   .blkb 1 ; rx1_queue tail pointer  
                                     73 
                                     74 
      000030                         75 vars:: .blkw 26 ; BASIC variables A-Z, keep it as but last .
                                     76 	.area BTXT (ABS)
      00007C                         77 	.org 0x7C  
                                     78 ; keep 'free_ram' as last variable 
                                     79 ; basic code compiled here. 
      00007C                         80 rsign: .blkw 1 ; "BC" 
      00007E                         81 rsize: .blkw 1 ; code size 	 
      000080                         82 free_ram: ; from here RAM free for BASIC text 
                                     83 
                                     84 	.area CODE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                     85 
                                     86 ;----------------------
                                     87 ; print token id && value
                                     88 ; input:
                                     89 ;   A     token id 
                                     90 ;   X     token value 
                                     91 ;---------------------
                           000001    92 	BSAVE=1
                           000002    93 	AREG=2
                           000003    94 	XREG=3
                           000004    95 	VSIZE=4
      008E16                         96 prt_tok:
      000D96                         97 	_vars VSIZE 
      008E16 52 04            [ 2]    1     sub sp,#VSIZE 
      008E18 6B 02            [ 1]   98 	ld (AREG,sp),a 
      008E1A 1F 03            [ 2]   99 	ldw (XREG,sp),x 
      008E1C C6 00 0B         [ 1]  100 	ld a, base
      008E1F 6B 01            [ 1]  101 	ld (BSAVE,sp),a 
      008E21 35 10 00 0B      [ 1]  102 	mov base,#16  
      008E25 AE 8E 4D         [ 2]  103 	ldw x,#token_msg
      008E28 CD 84 0F         [ 4]  104 	call puts 
      008E2B 5F               [ 1]  105 	clrw x 
      008E2C 7B 02            [ 1]  106 	ld a,(AREG,sp)
      008E2E 97               [ 1]  107 	ld xl,a 
      008E2F CD 93 58         [ 4]  108 	call print_int 
      008E32 A6 20            [ 1]  109 	ld a,#SPACE
      008E34 CD 83 B2         [ 4]  110 	call putc 
      008E37 1E 03            [ 2]  111 	ldw x,(XREG,sp)
      008E39 CD 93 58         [ 4]  112 	call print_int 
      008E3C A6 0D            [ 1]  113 	ld a,#CR 
      008E3E CD 83 B2         [ 4]  114 	call putc 
      008E41 7B 01            [ 1]  115 	ld a,(BSAVE,sp)
      008E43 C7 00 0B         [ 1]  116 	ld base,a 
      008E46 7B 02            [ 1]  117 	ld a,(AREG,sp)
      008E48 1E 03            [ 2]  118 	ldw x,(XREG,sp)
      000DCA                        119 	_drop VSIZE 
      008E4A 5B 04            [ 2]    1     addw sp,#VSIZE 
      008E4C 81               [ 4]  120 	ret 
      008E4D 74 6F 6B 65 6E 3A 20   121 token_msg: .asciz "token: "
             00
                                    122 
                                    123 
                                    124 ;---------------------
                                    125 ; display n bytes row 
                                    126 ; from memory.
                                    127 ; input:
                                    128 ;   A   bytes to print 
                                    129 ;	X   start address 
                                    130 ; output:
                                    131 ;   X   address after last shown  
                                    132 ;---------------------
                           000001   133 	CNT=1 
                           000002   134 	ADR=2 
                           000003   135 	VSIZE=3 
      008E55                        136 show_row:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      008E55 4D               [ 1]  137 	tnz a 
      008E56 26 01            [ 1]  138 	jrne 1$
      008E58 81               [ 4]  139 	ret 
      008E59                        140 1$:	
      008E59 89               [ 2]  141 	pushw x  
      008E5A 88               [ 1]  142 	push a 
      008E5B 35 04 00 23      [ 1]  143 	mov tab_width,#4 
      008E5F CD 93 58         [ 4]  144 	call print_int 
      008E62 A6 20            [ 1]  145 	ld a,#SPACE  
      008E64 CD 83 B2         [ 4]  146 	call putc
      008E67                        147 row_loop:
      008E67 1E 02            [ 2]  148 	ldw x,(ADR,sp)
      008E69 F6               [ 1]  149 	ld a,(x)
      008E6A 5F               [ 1]  150 	clrw x 
      008E6B 97               [ 1]  151 	ld xl,a 
      008E6C CD 93 58         [ 4]  152 	call print_int 
      008E6F 1E 02            [ 2]  153 	ldw x,(ADR,sp)
      008E71 5C               [ 1]  154 	incw x 
      008E72 1F 02            [ 2]  155 	ldw (ADR,sp),x 
      008E74 0A 01            [ 1]  156 	dec (CNT,sp)
      008E76 26 EF            [ 1]  157 	jrne row_loop
      000DF8                        158 	_drop VSIZE  		
      008E78 5B 03            [ 2]    1     addw sp,#VSIZE 
      008E7A 35 04 00 23      [ 1]  159 	mov tab_width,#4
      008E7E A6 0D            [ 1]  160 	ld a,#CR 
      008E80 CD 83 B2         [ 4]  161 	call putc 
      008E83 81               [ 4]  162 	ret 
                                    163 
                                    164 ;--------------------------
                                    165 ; print memory content 
                                    166 ; in hexadecimal format
                                    167 ;  input:
                                    168 ;    X    start address 
                                    169 ;    Y    count 
                                    170 ;--------------------------
                           000001   171 	BCNT=1
                           000003   172 	BASE=3
                           000004   173 	TABW=4
                           000004   174 	VSIZE=4   
      008E84                        175 hex_dump:
      008E84 88               [ 1]  176 	push a 
      000E05                        177 	_vars VSIZE
      008E85 52 04            [ 2]    1     sub sp,#VSIZE 
      008E87 C6 00 0B         [ 1]  178 	ld a,base
      008E8A 6B 03            [ 1]  179 	ld (BASE,sp),a 
      008E8C 35 10 00 0B      [ 1]  180 	mov base,#16
      008E90 C6 00 23         [ 1]  181 	ld a,tab_width 
      008E93 6B 04            [ 1]  182 	ld (TABW,sp),a
      008E95 A6 0D            [ 1]  183 	ld a,#CR 
      008E97 CD 83 B2         [ 4]  184 	call putc 
      008E9A 17 01            [ 2]  185 1$: ldw (BCNT,sp),y
      008E9C A6 10            [ 1]  186 	ld a,#16
      008E9E 90 A3 00 10      [ 2]  187 	cpw y,#16
      008EA2 2A 02            [ 1]  188 	jrpl 2$
      008EA4 90 9F            [ 1]  189 	ld a,yl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      008EA6                        190 2$: 	
      008EA6 CD 8E 55         [ 4]  191 	call show_row 
      008EA9 16 01            [ 2]  192 	ldw y,(BCNT,sp) 
      008EAB 72 A2 00 10      [ 2]  193 	subw y,#16 
      008EAF 90 A3 00 01      [ 2]  194 	cpw y,#1
      008EB3 2A E5            [ 1]  195 	jrpl 1$
      008EB5 7B 03            [ 1]  196 	ld a,(BASE,sp)
      008EB7 C7 00 0B         [ 1]  197 	ld base,a
      008EBA 7B 04            [ 1]  198 	ld a,(TABW,sp)
      008EBC C7 00 23         [ 1]  199 	ld tab_width,a 
      000E3F                        200 	_drop VSIZE
      008EBF 5B 04            [ 2]    1     addw sp,#VSIZE 
      008EC1 84               [ 1]  201 	pop a 
      008EC2 81               [ 4]  202 	ret 
                                    203 
                                    204 ;-------------------------------------
                                    205 ; retrun string length
                                    206 ; input:
                                    207 ;   X         .asciz  pointer 
                                    208 ; output:
                                    209 ;   X         not affected 
                                    210 ;   A         length 
                                    211 ;-------------------------------------
      008EC3                        212 strlen::
      008EC3 89               [ 2]  213 	pushw x 
      008EC4 4F               [ 1]  214 	clr a
      008EC5 7D               [ 1]  215 1$:	tnz (x) 
      008EC6 27 04            [ 1]  216 	jreq 9$ 
      008EC8 4C               [ 1]  217 	inc a 
      008EC9 5C               [ 1]  218 	incw x 
      008ECA 20 F9            [ 2]  219 	jra 1$ 
      008ECC 85               [ 2]  220 9$:	popw x 
      008ECD 81               [ 4]  221 	ret 
                                    222 
                                    223 ;------------------------------------
                                    224 ; compare 2 strings
                                    225 ; input:
                                    226 ;   X 		char* first string 
                                    227 ;   Y       char* second string 
                                    228 ; output:
                                    229 ;   A 		0 not == |1 ==  
                                    230 ;-------------------------------------
      008ECE                        231 strcmp:
      008ECE F6               [ 1]  232 	ld a,(x)
      008ECF 27 0B            [ 1]  233 	jreq 5$ 
      008ED1 90 F1            [ 1]  234 	cp a,(y) 
      008ED3 26 05            [ 1]  235 	jrne 4$ 
      008ED5 5C               [ 1]  236 	incw x 
      008ED6 90 5C            [ 1]  237 	incw y 
      008ED8 20 F4            [ 2]  238 	jra strcmp 
      008EDA                        239 4$: ; not same  
      008EDA 4F               [ 1]  240 	clr a 
      008EDB 81               [ 4]  241 	ret 
      008EDC                        242 5$: ; same 
      008EDC A6 01            [ 1]  243 	ld a,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      008EDE 81               [ 4]  244 	ret 
                                    245 
                                    246 
                                    247 ;---------------------------------------
                                    248 ;  copy src to dest 
                                    249 ; input:
                                    250 ;   X 		dest 
                                    251 ;   Y 		src 
                                    252 ; output: 
                                    253 ;   X 		dest 
                                    254 ;----------------------------------
      008EDF                        255 strcpy::
      008EDF 88               [ 1]  256 	push a 
      008EE0 89               [ 2]  257 	pushw x 
      008EE1 90 F6            [ 1]  258 1$: ld a,(y)
      008EE3 27 06            [ 1]  259 	jreq 9$ 
      008EE5 F7               [ 1]  260 	ld (x),a 
      008EE6 5C               [ 1]  261 	incw x 
      008EE7 90 5C            [ 1]  262 	incw y 
      008EE9 20 F6            [ 2]  263 	jra 1$ 
      008EEB 7F               [ 1]  264 9$:	clr (x)
      008EEC 85               [ 2]  265 	popw x 
      008EED 84               [ 1]  266 	pop a 
      008EEE 81               [ 4]  267 	ret 
                                    268 
                                    269 ;---------------------------------------
                                    270 ; move memory block 
                                    271 ; input:
                                    272 ;   X 		destination 
                                    273 ;   Y 	    source 
                                    274 ;   acc16	bytes count 
                                    275 ; output:
                                    276 ;   none 
                                    277 ;--------------------------------------
                           000001   278 	INCR=1 ; increament high byte 
                           000002   279 	LB=2 ; increament low byte 
                           000002   280 	VSIZE=2
      008EEF                        281 move::
      008EEF 88               [ 1]  282 	push a 
      000E70                        283 	_vars VSIZE 
      008EF0 52 02            [ 2]    1     sub sp,#VSIZE 
      008EF2 0F 01            [ 1]  284 	clr (INCR,sp)
      008EF4 0F 02            [ 1]  285 	clr (LB,sp)
      008EF6 90 89            [ 2]  286 	pushw y 
      008EF8 13 01            [ 2]  287 	cpw x,(1,sp) ; compare DEST to SRC 
      008EFA 90 85            [ 2]  288 	popw y 
      008EFC 27 31            [ 1]  289 	jreq move_exit ; x==y 
      008EFE 2B 0E            [ 1]  290 	jrmi move_down
      008F00                        291 move_up: ; start from top address with incr=-1
      008F00 72 BB 00 0E      [ 2]  292 	addw x,acc16
      008F04 72 B9 00 0E      [ 2]  293 	addw y,acc16
      008F08 03 01            [ 1]  294 	cpl (INCR,sp)
      008F0A 03 02            [ 1]  295 	cpl (LB,sp)   ; increment = -1 
      008F0C 20 05            [ 2]  296 	jra move_loop  
      008F0E                        297 move_down: ; start from bottom address with incr=1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      008F0E 5A               [ 2]  298     decw x 
      008F0F 90 5A            [ 2]  299 	decw y
      008F11 0C 02            [ 1]  300 	inc (LB,sp) ; incr=1 
      008F13                        301 move_loop:	
      008F13 C6 00 0E         [ 1]  302     ld a, acc16 
      008F16 CA 00 0F         [ 1]  303 	or a, acc8
      008F19 27 14            [ 1]  304 	jreq move_exit 
      008F1B 72 FB 01         [ 2]  305 	addw x,(INCR,sp)
      008F1E 72 F9 01         [ 2]  306 	addw y,(INCR,sp) 
      008F21 90 F6            [ 1]  307 	ld a,(y)
      008F23 F7               [ 1]  308 	ld (x),a 
      008F24 89               [ 2]  309 	pushw x 
      008F25 CE 00 0E         [ 2]  310 	ldw x,acc16 
      008F28 5A               [ 2]  311 	decw x 
      008F29 CF 00 0E         [ 2]  312 	ldw acc16,x 
      008F2C 85               [ 2]  313 	popw x 
      008F2D 20 E4            [ 2]  314 	jra move_loop
      008F2F                        315 move_exit:
      000EAF                        316 	_drop VSIZE
      008F2F 5B 02            [ 2]    1     addw sp,#VSIZE 
      008F31 84               [ 1]  317 	pop a 
      008F32 81               [ 4]  318 	ret 	
                                    319 
                                    320 ;------------------------------------
                                    321 ;  set all variables to zero 
                                    322 ; input:
                                    323 ;   none 
                                    324 ; output:
                                    325 ;	none
                                    326 ;------------------------------------
      008F33                        327 clear_vars:
      008F33 89               [ 2]  328 	pushw x 
      008F34 88               [ 1]  329 	push a  
      008F35 AE 00 30         [ 2]  330 	ldw x,#vars 
      008F38 A6 34            [ 1]  331 	ld a,#2*26 
      008F3A 7F               [ 1]  332 1$:	clr (x)
      008F3B 5C               [ 1]  333 	incw x 
      008F3C 4A               [ 1]  334 	dec a 
      008F3D 26 FB            [ 1]  335 	jrne 1$
      008F3F 84               [ 1]  336 	pop a 
      008F40 85               [ 2]  337 	popw x 
      008F41 81               [ 4]  338 	ret 
                                    339 
                                    340 ;-------------------------------------
                                    341 ;  program initialization entry point 
                                    342 ;-------------------------------------
                           000002   343 	MAJOR=2
                           000000   344 	MINOR=0 
      008F42 0A 0A 54 69 6E 79 20   345 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal  73-Bits]



             73 20 32 30 31 39 2C
             32 30 32 32 0A 76 65
             72 73 69 6F 6E 20 00
      000F08                        346 cold_start:
                                    347 ;set stack 
      008F74 20 32 30         [ 2]  348 	ldw x,#STACK_EMPTY
      008F77 31               [ 1]  349 	ldw sp,x   
                                    350 ; clear all ram 
      008F78 39               [ 1]  351 0$: clr (x)
      008F79 2C               [ 2]  352 	decw x 
      008F7A 32 30            [ 1]  353 	jrne 0$
                                    354 ; activate pull up on all inputs 
      008F7C 32 32            [ 1]  355 	ld a,#255 
      008F7E 0A 76 65         [ 1]  356 	ld PA_CR1,a 
      008F81 72 73 69         [ 1]  357 	ld PB_CR1,a 
      008F84 6F 6E 20         [ 1]  358 	ld PC_CR1,a 
      008F87 00 50 12         [ 1]  359 	ld PD_CR1,a 
      008F88 C7 50 17         [ 1]  360 	ld PE_CR1,a 
      008F88 AE 17 FF         [ 1]  361 	ld PF_CR1,a 
      008F8B 94 7F 5A         [ 1]  362 	ld PG_CR1,a 
      008F8E 26 FC A6         [ 1]  363 	ld PI_CR1,a
                                    364 ; set LD2 pin as output 
      008F91 FF C7 50 03      [ 1]  365     bset PC_CR1,#LED2_BIT
      008F95 C7 50 08 C7      [ 1]  366     bset PC_CR2,#LED2_BIT
      008F99 50 0D C7 50      [ 1]  367     bset PC_DDR,#LED2_BIT
      008F9D 12 C7 50 17      [ 1]  368 	bres PC_ODR,#LED2_BIT 
                                    369 ; disable schmitt triggers on Arduino CN4 analog inputs
      008FA1 C7 50 1C C7 50   [ 1]  370 	mov ADC_TDRL,0x3f
                                    371 ; disable peripherals clocks
                                    372 ;	clr CLK_PCKENR1 
                                    373 ;	clr CLK_PCKENR2
      008FA6 21 C7 50 2B      [ 1]  374 	clr AWU_TBR 
      008FAA 72 1A 50 0D      [ 1]  375 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                    376 ; select internal clock no divisor: 16 Mhz 	
      008FAE 72 1A            [ 1]  377 	ld a,#CLK_SWR_HSI 
      008FB0 50               [ 1]  378 	clrw x  
      008FB1 0E 72 1A         [ 4]  379     call clock_init 
      008FB4 50 0C 72         [ 4]  380 	call timer4_init
      008FB7 1B 50 0A         [ 4]  381 	call timer2_init
                                    382 ; UART1 at 115200 BAUD
      008FBA 55 00 3F         [ 4]  383 	call uart1_init
                                    384 ; activate PE_4 (user button interrupt)
      008FBD 54 07 72 5F      [ 1]  385     bset PE_CR2,#USR_BTN_BIT 
                                    386 ; display system information
      008FC1 50 F2 72         [ 4]  387 	call system_information
      008FC4 14               [ 1]  388 	rim ; enable interrupts 
      008FC5 50 CA A6 E1      [ 1]  389 	inc seedy+1 
      008FC9 5F CD 80 F9      [ 1]  390 	inc seedx+1 
      008FCD CD 81 1C         [ 4]  391 	call clear_basic
      008FD0 CD 81 0F         [ 4]  392 	call func_eefree 
      008FD3 CD 83 6D         [ 4]  393 	call ubound 
      008FD6 72 18 50         [ 4]  394 	call beep_1khz  
      000F72                        395 2$:	
      008FD9 18 CD 90         [ 4]  396 	call warm_init
                                    397 ; check for application in flash memory 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      008FDC 2E 9A 72         [ 2]  398 	ldw x,app_sign 
      008FDF 5C 00 17         [ 2]  399 	cpw x,SIGNATURE 
      008FE2 72 5C            [ 1]  400 	jreq run_app
      008FE4 00 15 CD         [ 2]  401 	jp cmd_line
      000F80                        402 run_app:
                                    403 ; run application in FLASH|EEPROM 
      008FE7 90 7D CD         [ 2]  404 	ldw x,#app 
      008FEA 99 95 CD         [ 2]  405 	ldw txtbgn,x
      008FED 98 F7 CD A0      [ 2]  406 	addw x,app_size 
      008FF1 83 00 1C         [ 2]  407 	ldw txtend,x 
      008FF2 AE 0F 9B         [ 2]  408 	ldw x,#AUTO_RUN 
      008FF2 CD 90 5F         [ 4]  409 	call puts 
      008FF5 CE AE 80         [ 4]  410 	call program_info 
      008FF8 C3 A3 67         [ 2]  411 	jp run_it_02  
      008FFB 27 03            [ 2]  412     jra .  
                                    413 
      008FFD CC 92 9C 74 6F 20 72   414 AUTO_RUN: .asciz " auto run program\n"
             75 6E 20 70 72 6F 67
             72 61 6D 0A 00
                                    415 
                                    416 
                                    417 ;-----------------------
                                    418 ;  display system 
                                    419 ;  information 
                                    420 ;-----------------------
      009000                        421 system_information:
      009000 AE AE 84         [ 2]  422 	ldw x,#software 
      009003 CF 00 1B         [ 4]  423 	call puts 
      009006 72 BB            [ 1]  424 	ld a,#MAJOR 
      009008 AE 82 CF         [ 1]  425 	ld acc8,a 
      00900B 00               [ 1]  426 	clrw x 
      00900C 1D AE 90         [ 2]  427 	ldw acc24,x
      00900F 1B CD 84 0F      [ 1]  428 	clr tab_width  
      009013 CD 9A A9 CC      [ 1]  429 	mov base, #10 
      009017 A0 32 20         [ 4]  430 	call prti24 
      00901A FE 20            [ 1]  431 	ld a,#'.
      00901C 61 75 74         [ 4]  432 	call putc 
      00901F 6F 20            [ 1]  433 	ld a,#MINOR 
      009021 72 75 6E         [ 1]  434 	ld acc8,a 
      009024 20               [ 1]  435 	clrw x 
      009025 70 72 6F         [ 2]  436 	ldw acc24,x 
      009028 67 72 61         [ 4]  437 	call prti24
      00902B 6D 0A            [ 1]  438 	ld a,#CR 
      00902D 00 03 32         [ 4]  439 	call putc
      00902E 81               [ 4]  440 	ret
                                    441 
                                    442 
      000FDF                        443 warm_init:
      00902E AE 8F 42 CD      [ 1]  444 	clr flags 
      009032 84 0F A6 02      [ 1]  445 	clr loop_depth 
      009036 C7 00 0F 5F      [ 1]  446 	mov tab_width,#TAB_WIDTH 
      00903A CF 00 0D 72      [ 1]  447 	mov base,#10 
      00903E 5F 00 23         [ 2]  448 	ldw x,#0 
      009041 35 0A 00         [ 2]  449 	ldw basicptr,x 
      009044 0B CD 93         [ 2]  450 	ldw in.w,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009047 68 A6 2E CD      [ 1]  451 	clr count
      00904B 83               [ 4]  452 	ret 
                                    453 
                                    454 
                                    455 ;---------------------------
                                    456 ; reset BASIC text variables 
                                    457 ; and clear variables 
                                    458 ;---------------------------
      000FFD                        459 clear_basic:
      00904C B2               [ 2]  460 	pushw x 
      00904D A6 00 C7 00      [ 1]  461 	clr count
      009051 0F 5F CF 00      [ 1]  462 	clr in  
      009055 0D CD 93         [ 2]  463 	ldw x,#free_ram 
      009058 68 A6 0D         [ 2]  464 	ldw txtbgn,x 
      00905B CD 83 B2         [ 2]  465 	ldw txtend,x 
      00905E 81 0E B3         [ 4]  466 	call clear_vars 
      00905F 85               [ 2]  467 	popw x
      00905F 72               [ 4]  468 	ret 
                                    469 
                                    470 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    471 ;;   Tiny BASIC error messages     ;;
                                    472 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001014                        473 err_msg:
      009060 5F 00 22 72 5F 00 1F   474 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             35 04 00 23 35
      00906C 0A 00 0B AE 00 00 CF   475 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             00 05 CF
      009076 00 01 72 5F 00 04 81   476 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             42 11 55
                                    477 
      00907D 4D 65 6D 6F 72 79 20   478 err_mem_full: .asciz "Memory full\n" 
             66 75 6C 6C 0A 00
      00907D 89 72 5F 00 04 72 5F   479 err_syntax: .asciz "syntax error\n" 
             00 02 AE 00 80 CF 00
      00908B 1B CF 00 1D CD 8F 33   480 err_math_ovf: .asciz "math operation overflow\n"
             85 81 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      009094 64 69 76 69 73 69 6F   481 err_div0: .asciz "division by 0\n" 
             6E 20 62 79 20 30 0A
             00
      009094 00 00 90 B4 90 C1 90   482 err_no_line: .asciz "invalid line number.\n"
             CF 90 E8 90 F7 91 0D
             91 23 91 3D 91 4E 91
             5F
      0090AA 91 6B 91 9E 91 AE 91   483 err_run_only: .asciz "run time only usage.\n" 
             C2 91 D5 4D 65 6D 6F
             72 79 20 66 75 6C 6C
             0A
      0090C0 00 73 79 6E 74 61 78   484 err_cmd_only: .asciz "command line only usage.\n"
             20 65 72 72 6F 72 0A
             00 6D 61 74 68 20 6F
             70 65 72 61 74
      0090DA 69 6F 6E 20 6F 76 65   485 err_duplicate: .asciz "duplicate name.\n"
             72 66 6C 6F 77 0A 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal  64-Bits]



             2E 0A 00
      0090E9 69 76 69 73 69 6F 6E   486 err_not_file: .asciz "File not found.\n"
             20 62 79 20 30 0A 00
             69 6E 76
      0090FA 61 6C 69 64 20 6C 69   487 err_bad_value: .asciz "bad value.\n"
             6E 65 20 6E 75
      009106 6D 62 65 72 2E 0A 00   488 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             72 75 6E 20 74 69 6D
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00 63 6F 6D 6D 61 6E
             64 20 6C 69 6E 65 20
             6F 6E 6C 79 20 75 73
             61 67
      009139 65 2E 0A 00 64 75 70   489 err_no_data: .asciz "No data found.\n"
             6C 69 63 61 74 65 20
             6E 61
      009149 6D 65 2E 0A 00 46 69   490 err_no_prog: .asciz "No program in RAM!\n"
             6C 65 20 6E 6F 74 20
             66 6F 75 6E 64 2E
      00915D 0A 00 62 61 64 20 76   491 err_no_fspace: .asciz "File system full.\n" 
             61 6C 75 65 2E 0A 00
             46 69 6C 65 20
      009170 69 6E 20 65 78 74 65   492 err_buf_full: .asciz "Buffer full\n"
             6E 64 65 64 20 6D
                                    493 
      00917D 65 6D 6F 72 79 2C 20   494 rt_msg: .asciz "\nrun time error, "
             63 61 6E 27 74 20 62
             65 20 72 75
      00918F 6E 20 66 72 6F 6D 20   495 comp_msg: .asciz "\ncompile error, "
             74 68 65 72 65 2E 0A
             00 4E 6F
      0091A0 20 64 61 74 61 20 66   496 tk_id: .asciz "last token id: "
             6F 75 6E 64 2E 0A 00
             4E 6F
                                    497 
      001195                        498 syntax_error::
      0091B0 20 70            [ 1]  499 	ld a,#ERR_SYNTAX 
                                    500 
      001197                        501 tb_error::
      0091B2 72 6F 67 72 61   [ 2]  502 	btjt flags,#FCOMP,1$
      0091B7 6D               [ 1]  503 	push a 
      0091B8 20 69 6E         [ 2]  504 	ldw x, #rt_msg 
      0091BB 20 52 41         [ 4]  505 	call puts 
      0091BE 4D               [ 1]  506 	pop a 
      0091BF 21 0A 00         [ 2]  507 	ldw x, #err_msg 
      0091C2 46 69 6C 65      [ 1]  508 	clr acc16 
      0091C6 20               [ 1]  509 	sll a
      0091C7 73 79 73 74      [ 1]  510 	rlc acc16  
      0091CB 65 6D 20         [ 1]  511 	ld acc8, a 
      0091CE 66 75 6C 6C      [ 2]  512 	addw x,acc16 
      0091D2 2E               [ 2]  513 	ldw x,(x)
      0091D3 0A 00 42         [ 4]  514 	call puts
      0091D6 75 66 66         [ 2]  515 	ldw x,basicptr
      0091D9 65 72 20         [ 1]  516 	ld a,in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      0091DC 66 75 6C         [ 4]  517 	call prt_basic_line
      0091DF 6C 0A 00         [ 2]  518 	ldw x,#tk_id 
      0091E2 0A 72 75         [ 4]  519 	call puts 
      0091E5 6E 20 74         [ 1]  520 	ld a,in.saved 
      0091E8 69               [ 1]  521 	clrw x 
      0091E9 6D               [ 1]  522 	ld xl,a 
      0091EA 65 20 65 72      [ 2]  523 	addw x,basicptr 
      0091EE 72               [ 1]  524 	ld a,(x)
      0091EF 6F               [ 1]  525 	clrw x 
      0091F0 72               [ 1]  526 	ld xl,a 
      0091F1 2C 20 00         [ 4]  527 	call print_int
      0091F4 0A 63 6F 6D 70   [ 2]  528 	btjf flags,#FAUTORUN ,6$
      0091F9 69 6C            [ 2]  529 	jra 6$
      0011E0                        530 1$:	
      0091FB 65               [ 1]  531 	push a 
      0091FC 20 65 72         [ 2]  532 	ldw x,#comp_msg
      0091FF 72 6F 72         [ 4]  533 	call puts 
      009202 2C               [ 1]  534 	pop a 
      009203 20 00 6C         [ 2]  535 	ldw x, #err_msg 
      009206 61 73 74 20      [ 1]  536 	clr acc16 
      00920A 74               [ 1]  537 	sll a
      00920B 6F 6B 65 6E      [ 1]  538 	rlc acc16  
      00920F 20 69 64         [ 1]  539 	ld acc8, a 
      009212 3A 20 00 0D      [ 2]  540 	addw x,acc16 
      009215 FE               [ 2]  541 	ldw x,(x)
      009215 A6 02 8F         [ 4]  542 	call puts
      009217 AE 16 90         [ 2]  543 	ldw x,#tib
      009217 72 0A 00         [ 4]  544 	call puts 
      00921A 22 44            [ 1]  545 	ld a,#CR 
      00921C 88 AE 91         [ 4]  546 	call putc
      00921F E2 CD 84         [ 2]  547 	ldw x,in.w
      009222 0F 84 AE         [ 4]  548 	call spaces
      009225 90 94            [ 1]  549 	ld a,#'^
      009227 72 5F 00         [ 4]  550 	call putc 
      00922A 0E 48 72         [ 2]  551 6$: ldw x,#STACK_EMPTY 
      00922D 59               [ 1]  552     ldw sp,x
      001219                        553 warm_start:
      00922E 00 0E C7         [ 4]  554 	call warm_init
                                    555 ;----------------------------
                                    556 ;   BASIC interpreter
                                    557 ;----------------------------
      00121C                        558 cmd_line: ; user interface 
      009231 00 0F            [ 1]  559 	ld a,#CR 
      009233 72 BB 00         [ 4]  560 	call putc 
      009236 0E FE            [ 1]  561 	ld a,#'> 
      009238 CD 84 0F         [ 4]  562 	call putc
      00923B CE 00 05         [ 4]  563 	call readln
      00923E C6 00 02 CD      [ 1]  564 	tnz count 
      009242 9C 18            [ 1]  565 	jreq cmd_line
      009244 AE 92 05         [ 4]  566 	call compile
                                    567 ;;; test 
                                    568 ; ldw x,txtbgn 
                                    569 ; ldw y,#16 
                                    570 ; call hex_dump
                                    571 ;;; end test
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



                                    572 
                                    573 ; if text begin with a line number
                                    574 ; the compiler set count to zero    
                                    575 ; so code is not interpreted
      009247 CD 84 0F C6      [ 1]  576 	tnz count 
      00924B 00 03            [ 1]  577 	jreq cmd_line
                                    578 
                                    579 ; if direct command 
                                    580 ; it's ready to interpret 
                                    581 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    582 ;; This is the interpreter loop
                                    583 ;; for each BASIC code line. 
                                    584 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      001238                        585 interpreter: 
      00924D 5F 97 72         [ 1]  586 	ld a,in 
      009250 BB 00 05         [ 1]  587 	cp a,count 
      009253 F6 5F            [ 1]  588 	jrmi interp_loop
      001240                        589 next_line:
      009255 97 CD 93 58 72   [ 2]  590 	btjf flags, #FRUN, cmd_line
      00925A 0D 00 22         [ 2]  591 	ldw x,basicptr
      00925D 37 20 35 00      [ 2]  592 	addw x,in.w 
      009260 C3 00 1C         [ 2]  593 	cpw x,txtend 
      009260 88 AE            [ 1]  594 	jrpl warm_start
      009262 91 F4 CD         [ 2]  595 	ldw basicptr,x ; start of next line  
      009265 84 0F            [ 1]  596 	ld a,(2,x)
      009267 84 AE 90         [ 1]  597 	ld count,a 
      00926A 94 72 5F 00      [ 1]  598 	mov in,#3 ; skip first 3 bytes of line 
      00125D                        599 interp_loop: 
      00926E 0E 48 72         [ 4]  600 	call next_token
      009271 59 00            [ 1]  601 	cp a,#TK_NONE 
      009273 0E C7            [ 1]  602 	jreq next_line 
      009275 00 0F            [ 1]  603 	cp a,#TK_CMD
      009277 72 BB            [ 1]  604 	jrne 1$
      009279 00               [ 4]  605 	call (x) 
      00927A 0E FE            [ 2]  606 	jra interp_loop 
      00126B                        607 1$:	 
      00927C CD 84            [ 1]  608 	cp a,#TK_VAR
      00927E 0F AE            [ 1]  609 	jrne 2$
      009280 16 90 CD         [ 4]  610 	call let_var  
      009283 84 0F            [ 2]  611 	jra interp_loop 
      001274                        612 2$:	
      009285 A6 0D            [ 1]  613 	cp a,#TK_ARRAY 
      009287 CD 83            [ 1]  614 	jrne 3$
      009289 B2 CE 00         [ 4]  615 	call let_array 
      00928C 01 CD            [ 2]  616 	jra interp_loop
      00127D                        617 3$:	
      00928E 84 7C            [ 1]  618 	cp a,#TK_COLON 
      009290 A6 5E            [ 1]  619 	jreq interp_loop
      009292 CD 83            [ 1]  620 4$: cp a,#TK_LABEL 
      009294 B2 AE            [ 1]  621 	jreq interp_loop 
      009296 17 FF 94         [ 2]  622 5$:	jp syntax_error 
                                    623 
                                    624 		
                                    625 ;--------------------------
                                    626 ; extract next token from
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



                                    627 ; token list 
                                    628 ; basicptr -> base address 
                                    629 ; in  -> offset in list array 
                                    630 ; output:
                                    631 ;   A 		token attribute
                                    632 ;   X 		token value if there is one
                                    633 ;----------------------------------------
      009299                        634 next_token::
      009299 CD               [ 1]  635 	clrw x 
      00929A 90 5F 01         [ 1]  636 	ld a,in 
      00929C C7 00 02         [ 1]  637 	ld in.saved,a ; in case "_unget_token" needed 
                                    638 ; don't replace sub by "cp a,count" 
                                    639 ; if end of line must return with A=0   	
      00929C A6 0D CD         [ 1]  640 	sub a,count 
      00929F 83 B2            [ 1]  641 	jreq 9$ ; end of line 
      001294                        642 0$: 
      0092A1 A6 3E CD 83      [ 2]  643 	ldw y,basicptr 
      0092A5 B2 CD 85 14      [ 2]  644 	addw y,in.w 
      0092A9 72 5D            [ 1]  645 	ld a,(y)
      0092AB 00 04            [ 1]  646 	incw y   
      0092AD 27               [ 1]  647 	tnz a 
      0092AE ED CD            [ 1]  648 	jrmi 4$
      0092B0 8B 37            [ 1]  649 	cp a,#TK_ARRAY
      0092B2 72 5D            [ 1]  650 	jrpl 7$  ; no attribute for these
      0012A7                        651 1$: ; 
      0092B4 00 04            [ 1]  652 	cp a,#TK_CHAR
      0092B6 27 E4            [ 1]  653 	jrne 2$
      0092B8 41               [ 1]  654 	exg a,xl
      0092B8 C6 00            [ 1]  655 	ld a,(y)
      0092BA 02               [ 1]  656 	exg a,xl  
      0092BB C1 00            [ 2]  657 	jra 6$ 
      0092BD 04 2B            [ 1]  658 2$:	cp a,#TK_QSTR 
      0092BF 1D 04            [ 1]  659 	jreq 22$
      0092C0 A1 03            [ 1]  660 	cp a,#TK_LABEL 
      0092C0 72 01            [ 1]  661 	jrne 7$ 
      0012B9                        662 22$:
      0092C2 00               [ 1]  663 	ldw x,y 
                                    664 ; move pointer after string 
      0092C3 22 D7            [ 1]  665 3$:	tnz (y)
      0092C5 CE 00            [ 1]  666 	jreq 6$
      0092C7 05 72            [ 1]  667 	incw y 
      0092C9 BB 00            [ 2]  668 	jra 3$
      0012C2                        669 4$: 
      0092CB 01               [ 1]  670 	ldw x,y 
      0092CC C3               [ 2]  671 	ldw x,(x)
      0092CD 00 1D            [ 1]  672 	cp a,#TK_INTGR
      0092CF 2A C8            [ 1]  673 	jrpl 5$
      0092D1 CF 00 05         [ 2]  674 	ldw x,(code_addr,x) 
      0092D4 E6 02            [ 1]  675 5$:	incw y 
      0092D6 C7 00            [ 1]  676 6$:	incw y 
      0092D8 04 35 03 00      [ 2]  677 7$:	subw y,basicptr 
      0092DC 02 CF 00 00      [ 2]  678 	ldw in.w,y 
      0092DD                        679 9$: 
      0092DD CD               [ 4]  680 	ret	
                                    681 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



                                    682 ;-----------------------------------
                                    683 ; print a 16 bit integer 
                                    684 ; using variable 'base' as conversion
                                    685 ; format.
                                    686 ; input:
                                    687 ;   X       integer to print 
                                    688 ;   'base'    conversion base 
                                    689 ; output:
                                    690 ;   none 
                                    691 ;-----------------------------------
      0012D8                        692 print_int:
      0092DE 93 08 A1 00      [ 1]  693 	clr acc24 
      0092E2 27 DC A1         [ 2]  694 	ldw acc16,x 
      0092E5 80 26 03 FD 20   [ 2]  695 	btjf acc16,#7,prti24
      0092EA F2 53 00 0C      [ 1]  696 	cpl acc24 
                                    697 	
                                    698 ;------------------------------------
                                    699 ; print integer in acc24 
                                    700 ; input:
                                    701 ;	acc24 		integer to print 
                                    702 ;	'base' 		numerical base for conversion 
                                    703 ;   'tab_width' field width 
                                    704 ;  output:
                                    705 ;    A          string length
                                    706 ;------------------------------------
      0092EB                        707 prti24:
      0092EB A1 85 26         [ 4]  708     call itoa  ; conversion entier en  .asciz
      0092EE 05 CD 99         [ 4]  709 	call right_align  
      0092F1 12               [ 1]  710 	push a 
      0092F2 20 E9 8F         [ 4]  711 	call puts
      0092F4 84               [ 1]  712 	pop a 
      0092F4 A1               [ 4]  713     ret	
                                    714 
                                    715 ;------------------------------------
                                    716 ; convert integer in acc24 to string
                                    717 ; input:
                                    718 ;   'base'	conversion base 
                                    719 ;	acc24	integer to convert
                                    720 ; output:
                                    721 ;   X  		pointer to first char of string
                                    722 ;   A       string length
                                    723 ;------------------------------------
                           000001   724 	SIGN=1  ; integer sign 
                           000002   725 	LEN=2 
                           000003   726 	PSTR=3
                           000004   727 	VSIZE=4 ;locals size
      0012F4                        728 itoa::
      0012F4                        729 	_vars VSIZE
      0092F5 05 26            [ 2]    1     sub sp,#VSIZE 
      0092F7 05 CD            [ 1]  730 	clr (LEN,sp) ; string length  
      0092F9 99 0F            [ 1]  731 	clr (SIGN,sp)    ; sign
      0092FB 20 E0 0A         [ 1]  732 	ld a,base 
      0092FD A1 0A            [ 1]  733 	cp a,#10
      0092FD A1 0A            [ 1]  734 	jrne 1$
                                    735 	; base 10 string display with negative sign if bit 23==1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      0092FF 27 DC A1 03 27   [ 2]  736 	btjf acc24,#7,1$
      009304 D8 CC            [ 1]  737 	cpl (SIGN,sp)
      009306 92 15 C1         [ 4]  738 	call neg_acc24
      009308                        739 1$:
                                    740 ; initialize string pointer 
      009308 5F C6 00         [ 2]  741 	ldw x,#tib 
      00930B 02 C7 00         [ 2]  742 	addw x,#TIB_SIZE
      00930E 03               [ 2]  743 	decw x 
      00930F C0               [ 1]  744 	clr (x)
      009310 00               [ 2]  745 	decw x 
      009311 04 27            [ 1]  746 	ld a,#32
      009313 43               [ 1]  747 	ld (x),a
      009314 0C 02            [ 1]  748 	inc (LEN,sp)
      001319                        749 itoa_loop:
      009314 90 CE 00         [ 1]  750     ld a,base
      009317 05 72            [ 2]  751 	ldw (PSTR,sp),x 
      009319 B9 00 01         [ 4]  752     call divu24_8 ; acc24/A 
      00931C 90 F6            [ 2]  753 	ldw x,(PSTR,sp)
      00931E 90 5C            [ 1]  754     add a,#'0  ; remainder of division
      009320 4D 2B            [ 1]  755     cp a,#'9+1
      009322 1F A1            [ 1]  756     jrmi 2$
      009324 05 2A            [ 1]  757     add a,#7 
      00132B                        758 2$:	
      009326 28               [ 2]  759 	decw x
      009327 F7               [ 1]  760     ld (x),a
      009327 A1 04            [ 1]  761 	inc (LEN,sp)
                                    762 	; if acc24==0 conversion done
      009329 26 06 41         [ 1]  763 	ld a,acc24
      00932C 90 F6 41         [ 1]  764 	or a,acc16
      00932F 20 1C A1         [ 1]  765 	or a,acc8
      009332 02 27            [ 1]  766     jrne itoa_loop
                                    767 	;conversion done, next add '$' or '-' as required
      009334 04 A1 03         [ 1]  768 	ld a,base 
      009337 26 16            [ 1]  769 	cp a,#16
      009339 27 08            [ 1]  770 	jreq 8$
      009339 93 90            [ 1]  771 	ld a,(SIGN,sp)
      00933B 7D 27            [ 1]  772     jreq 10$
      00933D 0F 90            [ 1]  773     ld a,#'-
      00933F 5C 20            [ 2]  774 	jra 9$ 
                                    775 ; don't print more than 4 digits
                                    776 ; in hexadecimal to avoid '-' sign 
                                    777 ; extend display 	
      009341 F8 02            [ 1]  778 8$: ld a,(LEN,sp) 
      009342 A1 06            [ 1]  779 	cp a,#6 
      009342 93 FE            [ 1]  780 	jrmi 81$
      009344 A1               [ 1]  781 	incw x
      009345 84 2A            [ 1]  782 	dec (LEN,sp)
      009347 03 DE            [ 2]  783 	jra 8$
      001354                        784 81$:	
      009349 AD 83            [ 1]  785 	ld a,#'$ 
      00934B 90               [ 2]  786 9$: decw x
      00934C 5C               [ 1]  787     ld (x),a
      00934D 90 5C            [ 1]  788 	inc (LEN,sp)
      00135A                        789 10$:
      00934F 72 B2            [ 1]  790 	ld a,(LEN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      00135C                        791 	_drop VSIZE
      009351 00 05            [ 2]    1     addw sp,#VSIZE 
      009353 90               [ 4]  792 	ret
                                    793 
                                    794 ;-------------------------------------
                                    795 ; divide uint24_t by uint8_t
                                    796 ; used to convert uint24_t to string
                                    797 ; input:
                                    798 ;	acc24	dividend
                                    799 ;   A 		divisor
                                    800 ; output:
                                    801 ;   acc24	quotient
                                    802 ;   A		remainder
                                    803 ;------------------------------------- 
                                    804 ; offset  on sp of arguments and locals
                           000001   805 	U8   = 1   ; divisor on stack
                           000001   806 	VSIZE =1
      00135F                        807 divu24_8:
      009354 CF               [ 2]  808 	pushw x ; save x
      009355 00               [ 1]  809 	push a 
                                    810 	; ld dividend UU:MM bytes in X
      009356 01 00 0C         [ 1]  811 	ld a, acc24
      009357 95               [ 1]  812 	ld xh,a
      009357 81 00 0D         [ 1]  813 	ld a,acc24+1
      009358 97               [ 1]  814 	ld xl,a
      009358 72 5F            [ 1]  815 	ld a,(U8,SP) ; divisor
      00935A 00               [ 2]  816 	div x,a ; UU:MM/U8
      00935B 0D               [ 1]  817 	push a  ;save remainder
      00935C CF               [ 1]  818 	ld a,xh
      00935D 00 0E 72         [ 1]  819 	ld acc24,a
      009360 0F               [ 1]  820 	ld a,xl
      009361 00 0E 04         [ 1]  821 	ld acc24+1,a
      009364 72               [ 1]  822 	pop a
      009365 53               [ 1]  823 	ld xh,a
      009366 00 0D 0E         [ 1]  824 	ld a,acc24+2
      009368 97               [ 1]  825 	ld xl,a
      009368 CD 93            [ 1]  826 	ld a,(U8,sp) ; divisor
      00936A 74               [ 2]  827 	div x,a  ; R:LL/U8
      00936B CD 8B            [ 1]  828 	ld (U8,sp),a ; save remainder
      00936D D6               [ 1]  829 	ld a,xl
      00936E 88 CD 84         [ 1]  830 	ld acc24+2,a
      009371 0F               [ 1]  831 	pop a
      009372 84               [ 2]  832 	popw x
      009373 81               [ 4]  833 	ret
                                    834 
                                    835 ;--------------------------------------
                                    836 ; unsigned multiply uint24_t by uint8_t
                                    837 ; use to convert numerical string to uint24_t
                                    838 ; input:
                                    839 ;	acc24	uint24_t 
                                    840 ;   A		uint8_t
                                    841 ; output:
                                    842 ;   acc24   A*acc24
                                    843 ;-------------------------------------
                                    844 ; local variables offset  on sp
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



                           000003   845 	U8   = 3   ; A pushed on stack
                           000002   846 	OVFL = 2  ; multiplicaton overflow low byte
                           000001   847 	OVFH = 1  ; multiplication overflow high byte
                           000003   848 	VSIZE = 3
      009374                        849 mulu24_8:
      009374 52               [ 2]  850 	pushw x    ; save X
                                    851 	; local variables
      009375 04               [ 1]  852 	push a     ; U8
      009376 0F               [ 1]  853 	clrw x     ; initialize overflow to 0
      009377 02               [ 2]  854 	pushw x    ; multiplication overflow
                                    855 ; multiply low byte.
      009378 0F 01 C6         [ 1]  856 	ld a,acc24+2
      00937B 00               [ 1]  857 	ld xl,a
      00937C 0B A1            [ 1]  858 	ld a,(U8,sp)
      00937E 0A               [ 4]  859 	mul x,a
      00937F 26               [ 1]  860 	ld a,xl
      009380 0A 72 0F         [ 1]  861 	ld acc24+2,a
      009383 00               [ 1]  862 	ld a, xh
      009384 0D 05            [ 1]  863 	ld (OVFL,sp),a
                                    864 ; multipy middle byte
      009386 03 01 CD         [ 1]  865 	ld a,acc24+1
      009389 94               [ 1]  866 	ld xl,a
      00938A 41 03            [ 1]  867 	ld a, (U8,sp)
      00938B 42               [ 4]  868 	mul x,a
                                    869 ; add overflow to this partial product
      00938B AE 16 90         [ 2]  870 	addw x,(OVFH,sp)
      00938E 1C               [ 1]  871 	ld a,xl
      00938F 00 50 5A         [ 1]  872 	ld acc24+1,a
      009392 7F               [ 1]  873 	clr a
      009393 5A A6            [ 1]  874 	adc a,#0
      009395 20 F7            [ 1]  875 	ld (OVFH,sp),a
      009397 0C               [ 1]  876 	ld a,xh
      009398 02 02            [ 1]  877 	ld (OVFL,sp),a
                                    878 ; multiply most signficant byte	
      009399 C6 00 0C         [ 1]  879 	ld a, acc24
      009399 C6               [ 1]  880 	ld xl, a
      00939A 00 0B            [ 1]  881 	ld a, (U8,sp)
      00939C 1F               [ 4]  882 	mul x,a
      00939D 03 CD 93         [ 2]  883 	addw x, (OVFH,sp)
      0093A0 DF               [ 1]  884 	ld a, xl
      0093A1 1E 03 AB         [ 1]  885 	ld acc24,a
      0093A4 30 A1            [ 2]  886     addw sp,#VSIZE
      0093A6 3A               [ 2]  887 	popw x
      0093A7 2B               [ 4]  888 	ret
                                    889 
                                    890 ;------------------------------------
                                    891 ;  two's complement acc24
                                    892 ;  input:
                                    893 ;		acc24 variable
                                    894 ;  output:
                                    895 ;		acc24 variable
                                    896 ;-------------------------------------
      0013C1                        897 neg_acc24:
      0093A8 02 AB 07 0E      [ 1]  898 	cpl acc24+2
      0093AB 72 53 00 0D      [ 1]  899 	cpl acc24+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      0093AB 5A F7 0C 02      [ 1]  900 	cpl acc24
      0093AF C6 00            [ 1]  901 	ld a,#1
      0093B1 0D CA 00         [ 1]  902 	add a,acc24+2
      0093B4 0E CA 00         [ 1]  903 	ld acc24+2,a
      0093B7 0F               [ 1]  904 	clr a
      0093B8 26 DF C6         [ 1]  905 	adc a,acc24+1
      0093BB 00 0B A1         [ 1]  906 	ld acc24+1,a 
      0093BE 10               [ 1]  907 	clr a 
      0093BF 27 08 7B         [ 1]  908 	adc a,acc24 
      0093C2 01 27 15         [ 1]  909 	ld acc24,a 
      0093C5 A6               [ 4]  910 	ret
                                    911 
                                    912 
                                    913 
                                    914 
                                    915 ;------------------------------------
                                    916 ; convert alpha to uppercase
                                    917 ; input:
                                    918 ;    a  character to convert
                                    919 ; output:
                                    920 ;    a  uppercase character
                                    921 ;------------------------------------
      0013E4                        922 to_upper::
      0093C6 2D 20            [ 1]  923 	cp a,#'a
      0093C8 0D 7B            [ 1]  924 	jrpl 1$
      0093CA 02               [ 4]  925 0$:	ret
      0093CB A1 06            [ 1]  926 1$: cp a,#'z	
      0093CD 2B 05            [ 1]  927 	jrugt 0$
      0093CF 5C 0A            [ 1]  928 	sub a,#32
      0093D1 02               [ 4]  929 	ret
                                    930 	
                                    931 ;------------------------------------
                                    932 ; convert pad content in integer
                                    933 ; input:
                                    934 ;    x		.asciz to convert
                                    935 ; output:
                                    936 ;    acc24      int24_t
                                    937 ;------------------------------------
                                    938 	; local variables
                           000001   939 	SIGN=1 ; 1 byte, 
                           000002   940 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003   941 	TEMP=3 ; 1 byte, temporary storage
                           000003   942 	VSIZE=3 ; 3 bytes reserved for local storage
      0013F0                        943 atoi24::
      0093D2 20               [ 2]  944 	pushw x 
      0013F1                        945 	_vars VSIZE
      0093D3 F5 03            [ 2]    1     sub sp,#VSIZE 
                                    946 	; acc24=0 
      0093D4 72 5F 00 0C      [ 1]  947 	clr acc24    
      0093D4 A6 24 5A F7      [ 1]  948 	clr acc16
      0093D8 0C 02 00 0E      [ 1]  949 	clr acc8 
      0093DA 0F 01            [ 1]  950 	clr (SIGN,sp)
      0093DA 7B 02            [ 1]  951 	ld a,#10
      0093DC 5B 04            [ 1]  952 	ld (BASE,sp),a ; default base decimal
      0093DE 81               [ 1]  953 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      0093DF 27 47            [ 1]  954 	jreq 9$  ; completed if 0
      0093DF 89 88            [ 1]  955 	cp a,#'-
      0093E1 C6 00            [ 1]  956 	jrne 1$
      0093E3 0D 95            [ 1]  957 	cpl (SIGN,sp)
      0093E5 C6 00            [ 2]  958 	jra 2$
      0093E7 0E 97            [ 1]  959 1$: cp a,#'$
      0093E9 7B 01            [ 1]  960 	jrne 3$
      0093EB 62 88            [ 1]  961 	ld a,#16
      0093ED 9E C7            [ 1]  962 	ld (BASE,sp),a
      0093EF 00               [ 1]  963 2$:	incw x
      0093F0 0D               [ 1]  964 	ld a,(x)
      00141A                        965 3$:	
      0093F1 9F C7            [ 1]  966 	cp a,#'a
      0093F3 00 0E            [ 1]  967 	jrmi 4$
      0093F5 84 95            [ 1]  968 	sub a,#32
      0093F7 C6 00            [ 1]  969 4$:	cp a,#'0
      0093F9 0F 97            [ 1]  970 	jrmi 9$
      0093FB 7B 01            [ 1]  971 	sub a,#'0
      0093FD 62 6B            [ 1]  972 	cp a,#10
      0093FF 01 9F            [ 1]  973 	jrmi 5$
      009401 C7 00            [ 1]  974 	sub a,#7
      009403 0F 84            [ 1]  975 	cp a,(BASE,sp)
      009405 85 81            [ 1]  976 	jrpl 9$
      009407 6B 03            [ 1]  977 5$:	ld (TEMP,sp),a
      009407 89 88            [ 1]  978 	ld a,(BASE,sp)
      009409 5F 89 C6         [ 4]  979 	call mulu24_8
      00940C 00 0F            [ 1]  980 	ld a,(TEMP,sp)
      00940E 97 7B 03         [ 1]  981 	add a,acc24+2
      009411 42 9F C7         [ 1]  982 	ld acc24+2,a
      009414 00               [ 1]  983 	clr a
      009415 0F 9E 6B         [ 1]  984 	adc a,acc24+1
      009418 02 C6 00         [ 1]  985 	ld acc24+1,a
      00941B 0E               [ 1]  986 	clr a
      00941C 97 7B 03         [ 1]  987 	adc a,acc24
      00941F 42 72 FB         [ 1]  988 	ld acc24,a
      009422 01 9F            [ 2]  989 	jra 2$
      009424 C7 00            [ 1]  990 9$:	tnz (SIGN,sp)
      009426 0E 4F            [ 1]  991     jreq atoi_exit
      009428 A9 00 6B         [ 4]  992     call neg_acc24
      001456                        993 atoi_exit: 
      001456                        994 	_drop VSIZE
      00942B 01 9E            [ 2]    1     addw sp,#VSIZE 
      00942D 6B               [ 2]  995 	popw x ; restore x
      00942E 02               [ 4]  996 	ret
                                    997 
                                    998 
                                    999 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1000 ;;   TINY BASIC  operators,
                                   1001 ;;   commands and functions 
                                   1002 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1003 
                                   1004 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1005 ;;  Arithmetic operators
                                   1006 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1007 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



                                   1008 ;debug support
                           000001  1009 DEBUG_PRT=1
                           000001  1010 .if DEBUG_PRT 
                           000001  1011 	REGA=1
                           000002  1012 	SAVEB=2
                           000003  1013 	REGX=3
                           000005  1014 	REGY=5
                           000007  1015 	ACC24=7
                           000009  1016 	VSIZE=9 
      00145A                       1017 printxy:
      00145A                       1018 	_vars VSIZE 
      00942F C6 00            [ 2]    1     sub sp,#VSIZE 
      009431 0D 97            [ 1] 1019 	ld (REGA,sp),a 
      009433 7B 03 42         [ 1] 1020 	ld a,base 
      009436 72 FB            [ 1] 1021 	ld (SAVEB,sp),a
      009438 01 9F            [ 2] 1022 	ldw (REGX,sp),x
      00943A C7 00            [ 2] 1023 	ldw (REGY,sp),y
      00943C 0D 5B 03         [ 2] 1024 	ldw x,acc24 
      00943F 85 81 0E         [ 1] 1025 	ld a,acc8 
      009441 1F 07            [ 2] 1026 	ldw (ACC24,sp),x 
      009441 72 53            [ 1] 1027 	ld (ACC24+2,sp),a 
      009443 00 0F 72 53      [ 1] 1028 	mov base,#16 
      009447 00               [ 1] 1029 	clrw x 
      009448 0E 72            [ 1] 1030 	ld a,(REGA,sp)
      00944A 53               [ 1] 1031 	ld xl,a 
      00944B 00 0D A6         [ 4] 1032 	call print_int
      00944E 01 CB            [ 1] 1033 	ld a,#SPACE 
      009450 00 0F C7         [ 4] 1034 	call putc  
      009453 00 0F            [ 2] 1035 	ldw x,(REGX,sp)
      009455 4F C9 00         [ 4] 1036 	call print_int 
      009458 0E C7            [ 1] 1037 	ld a,#SPACE 
      00945A 00 0E 4F         [ 4] 1038 	call putc  
      00945D C9 00            [ 2] 1039 	ldw x,(REGY,sp)
      00945F 0D C7 00         [ 4] 1040 	call print_int 
      009462 0D 81            [ 1] 1041 	ld a,#CR 
      009464 CD 03 32         [ 4] 1042 	call putc 
      009464 A1 61            [ 1] 1043 	ld a,(ACC24+2,sp)
      009466 2A 01            [ 2] 1044 	ldw x,(ACC24,sp)
      009468 81 A1 7A         [ 2] 1045 	ldw acc24,x 
      00946B 22 FB A0         [ 1] 1046 	ld acc8,a
      00946E 20 81            [ 1] 1047 	ld a,(SAVEB,sp)
      009470 C7 00 0A         [ 1] 1048 	ld base,a 
      009470 89 52            [ 1] 1049 	ld a,(REGA,sp)
      009472 03 72            [ 2] 1050 	ldw x,(REGX,sp)
      009474 5F 00            [ 2] 1051 	ldw y,(REGY,sp)
      0014AA                       1052 	_drop VSIZE 
      009476 0D 72            [ 2]    1     addw sp,#VSIZE 
      009478 5F               [ 4] 1053 	ret 
                                   1054 .endif 
                                   1055 
                                   1056 
                                   1057 ;--------------------------------------
                                   1058 ;  multiply 2 uint16_t return uint32_t
                                   1059 ;  input:
                                   1060 ;     x       uint16_t 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



                                   1061 ;     y       uint16_t 
                                   1062 ;  output:
                                   1063 ;     x       product bits 15..0
                                   1064 ;     y       product bits 31..16 
                                   1065 ;---------------------------------------
                           000001  1066 		U1=1  ; uint16_t 
                           000003  1067 		DBL=3 ; uint32_t
                           000006  1068 		VSIZE=6
      0014AD                       1069 umstar:
      0014AD                       1070 	_vars VSIZE 
      009479 00 0E            [ 2]    1     sub sp,#VSIZE 
      00947B 72 5F            [ 2] 1071 	ldw (U1,sp),x 
                                   1072 ;initialize bits 31..16 of 
                                   1073 ;product to zero 
      00947D 00 0F            [ 1] 1074 	clr (DBL,sp)
      00947F 0F 01            [ 1] 1075 	clr (DBL+1,sp)
                                   1076 ; produc U1L*U2L 
      009481 A6 0A            [ 1] 1077 	ld a,yl 
      009483 6B               [ 4] 1078 	mul x,a 
      009484 02 F6            [ 2] 1079 	ldw (DBL+2,sp),x
                                   1080 ; product U1H*U2L 
      009486 27 47            [ 1] 1081 	ld a,(U1,sp) ; xh 
      009488 A1               [ 1] 1082 	ldw x,y
      009489 2D               [ 4] 1083 	mul x,a 
      00948A 26               [ 1] 1084 	clr a 
      00948B 04 03 01         [ 2] 1085 	addw x,(DBL+1,sp) 
      00948E 20               [ 1] 1086 	clr a 
      00948F 08 A1            [ 1] 1087 	adc a,(DBL,sp) 
      009491 24 26            [ 1] 1088 	ld (DBL,sp),a ; bits 23..17 
      009493 06 A6            [ 2] 1089 	ldw (DBL+1,sp),x ; bits 15..0 
                                   1090 ; product U1L*U2H
      009495 10 6B            [ 1] 1091 	swapw y 
      009497 02               [ 1] 1092 	ldw x,y
      009498 5C F6            [ 1] 1093 	ld a,(U1+1,sp)
      00949A 42               [ 4] 1094 	mul x,a
      00949A A1 61 2B         [ 2] 1095 	addw x,(DBL+1,sp)
      00949D 02               [ 1] 1096 	clr a 
      00949E A0 20            [ 1] 1097 	adc a,(DBL,sp)
      0094A0 A1 30            [ 1] 1098 	ld (DBL,sp),a 
      0094A2 2B 2B            [ 2] 1099 	ldw (DBL+1,sp),x 
                                   1100 ; product U1H*U2H 	
      0094A4 A0 30            [ 1] 1101 	ld a,(U1,sp)
      0094A6 A1               [ 1] 1102 	ldw x,y  
      0094A7 0A               [ 4] 1103 	mul x,a 
      0094A8 2B 06 A0         [ 2] 1104 	addw x,(DBL,sp)
      0094AB 07 11            [ 1] 1105 	ldw y,x 
      0094AD 02 2A            [ 2] 1106 	ldw x,(DBL+2,sp)
      0014E4                       1107 	_drop VSIZE 
      0094AF 1F 6B            [ 2]    1     addw sp,#VSIZE 
      0094B1 03               [ 4] 1108 	ret
                                   1109 
                                   1110 
                                   1111 ;-------------------------------------
                                   1112 ; multiply 2 integers
                                   1113 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



                                   1114 ;  	x       n1 
                                   1115 ;   y 		n2 
                                   1116 ; output:
                                   1117 ;	X        N1*N2 bits 15..0
                                   1118 ;   Y        N1*N2 bits 31..16 
                                   1119 ;-------------------------------------
                           000001  1120 	SIGN=1
                           000001  1121 	VSIZE=1
      0014E7                       1122 multiply:
      0014E7                       1123 	_vars VSIZE 
      0094B2 7B 02            [ 2]    1     sub sp,#VSIZE 
      0094B4 CD 94            [ 1] 1124 	clr (SIGN,sp)
      0094B6 07               [ 1] 1125 	ld a,xh 
      0094B7 7B 03            [ 1] 1126 	and a,#0x80
      0094B9 CB 00            [ 1] 1127 	jrpl 1$
      0094BB 0F C7            [ 1] 1128 	cpl (SIGN,sp)
      0094BD 00               [ 2] 1129 	negw x 
      0014F3                       1130 1$:	
      0094BE 0F 4F            [ 1] 1131 	ld a,yh
      0094C0 C9 00            [ 1] 1132 	and a,#0x80  
      0094C2 0E C7            [ 1] 1133 	jrpl 2$ 
      0094C4 00 0E            [ 1] 1134 	cpl (SIGN,sp)
      0094C6 4F C9            [ 2] 1135 	negw y 
      0014FD                       1136 2$:	
      0094C8 00 0D C7         [ 4] 1137 	call umstar
      0094CB 00 0D            [ 1] 1138 	ld a,(SIGN,sp)
      0094CD 20 C9            [ 1] 1139 	jreq 3$
      0094CF 0D 01 27         [ 4] 1140 	call dneg 
      001507                       1141 3$:	
      001507                       1142 	_drop VSIZE 
      0094D2 03 CD            [ 2]    1     addw sp,#VSIZE 
      0094D4 94               [ 4] 1143 	ret
                                   1144 
                                   1145 ;--------------------------------------
                                   1146 ; divide uint32_t/uint16_t
                                   1147 ; return:  quotient and remainder 
                                   1148 ; quotient expected to be uint16_t 
                                   1149 ; input:
                                   1150 ;   DBLDIVDND    on stack 
                                   1151 ;   X            divisor 
                                   1152 ; output:
                                   1153 ;   X            quotient 
                                   1154 ;   Y            remainder 
                                   1155 ;---------------------------------------
                           000003  1156 	VSIZE=3
      00150A                       1157 	_argofs VSIZE 
                           000005     1     ARG_OFS=2+VSIZE 
      00150A                       1158 	_arg DBLDIVDND 1
                           000006     1     DBLDIVDND=ARG_OFS+1 
                                   1159 	; local variables 
                           000001  1160 	DIVISOR=1 
                           000003  1161 	CNTR=3 
      00150A                       1162 udiv32_16:
      00150A                       1163 	_vars VSIZE 
      0094D5 41 03            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      0094D6 1F 01            [ 2] 1164 	ldw (DIVISOR,sp),x	; save divisor 
      0094D6 5B 03            [ 2] 1165 	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
      0094D8 85 81            [ 2] 1166 	ldw y,(DBLDIVDND,sp) ; bits 31..16
      0094DA 90 5D            [ 2] 1167 	tnzw y
      0094DA 52 09            [ 1] 1168 	jrne long_division 
      0094DC 6B 01            [ 2] 1169 	ldw y,(DIVISOR,sp)
      0094DE C6               [ 2] 1170 	divw x,y
      001519                       1171 	_drop VSIZE 
      0094DF 00 0B            [ 2]    1     addw sp,#VSIZE 
      0094E1 6B               [ 4] 1172 	ret
      00151C                       1173 long_division:
      0094E2 02               [ 1] 1174 	exgw x,y ; hi in x, lo in y 
      0094E3 1F 03            [ 1] 1175 	ld a,#17 
      0094E5 17 05            [ 1] 1176 	ld (CNTR,sp),a
      001521                       1177 1$:
      0094E7 CE 00            [ 2] 1178 	cpw x,(DIVISOR,sp)
      0094E9 0D C6            [ 1] 1179 	jrmi 2$
      0094EB 00 0F 1F         [ 2] 1180 	subw x,(DIVISOR,sp)
      0094EE 07               [ 1] 1181 2$:	ccf 
      0094EF 6B 09            [ 2] 1182 	rlcw y 
      0094F1 35               [ 2] 1183 	rlcw x 
      0094F2 10 00            [ 1] 1184 	dec (CNTR,sp)
      0094F4 0B 5F            [ 1] 1185 	jrne 1$
      0094F6 7B               [ 1] 1186 	exgw x,y 
      001531                       1187 	_drop VSIZE 
      0094F7 01 97            [ 2]    1     addw sp,#VSIZE 
      0094F9 CD               [ 4] 1188 	ret
                                   1189 
                                   1190 ;-----------------------------
                                   1191 ; negate double int.
                                   1192 ; input:
                                   1193 ;   x     bits 15..0
                                   1194 ;   y     bits 31..16
                                   1195 ; output: 
                                   1196 ;   x     bits 15..0
                                   1197 ;   y     bits 31..16
                                   1198 ;-----------------------------
      001534                       1199 dneg:
      0094FA 93               [ 2] 1200 	cplw x 
      0094FB 58 A6            [ 2] 1201 	cplw y 
      0094FD 20 CD 83         [ 2] 1202 	addw x,#1 
      009500 B2 1E            [ 1] 1203 	jrnc 1$
      009502 03 CD            [ 1] 1204 	incw y 
      009504 93               [ 4] 1205 1$: ret 
                                   1206 
                                   1207 
                                   1208 ;--------------------------------
                                   1209 ; sign extend single to double
                                   1210 ; input:
                                   1211 ;   x    int16_t
                                   1212 ; output:
                                   1213 ;   x    int32_t bits 15..0
                                   1214 ;   y    int32_t bits 31..16
                                   1215 ;--------------------------------
      00153F                       1216 dbl_sign_extend:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      009505 58 A6            [ 1] 1217 	clrw y
      009507 20               [ 1] 1218 	ld a,xh 
      009508 CD 83            [ 1] 1219 	and a,#0x80 
      00950A B2 1E            [ 1] 1220 	jreq 1$
      00950C 05 CD            [ 2] 1221 	cplw y
      00950E 93               [ 4] 1222 1$: ret 	
                                   1223 
                                   1224 
                                   1225 ;----------------------------------
                                   1226 ;  euclidian divide dbl/n1 
                                   1227 ;  ref: https://en.wikipedia.org/wiki/Euclidean_division
                                   1228 ; input:
                                   1229 ;    dbl    int32_t on stack 
                                   1230 ;    x 		n1   int16_t  disivor  
                                   1231 ; output:
                                   1232 ;    X      dbl/x  int16_t 
                                   1233 ;    Y      remainder int16_t 
                                   1234 ;----------------------------------
                           000008  1235 	VSIZE=8
      001549                       1236 	_argofs VSIZE 
                           00000A     1     ARG_OFS=2+VSIZE 
      001549                       1237 	_arg DIVDNDHI 1 
                           00000B     1     DIVDNDHI=ARG_OFS+1 
      001549                       1238 	_arg DIVDNDLO 3
                           00000D     1     DIVDNDLO=ARG_OFS+3 
                                   1239 	; local variables
                           000001  1240 	DBLHI=1
                           000003  1241 	DBLLO=3 
                           000005  1242 	SDIVSR=5 ; sign divisor
                           000006  1243 	SQUOT=6 ; sign dividend 
                           000007  1244 	DIVISR=7 ; divisor 
      001549                       1245 div32_16:
      001549                       1246 	_vars VSIZE 
      00950F 58 A6            [ 2]    1     sub sp,#VSIZE 
      009511 0D CD            [ 1] 1247 	clr (SDIVSR,sp)
      009513 83 B2            [ 1] 1248 	clr (SQUOT,sp)
                                   1249 ; copy arguments 
      009515 7B 09            [ 2] 1250 	ldw y,(DIVDNDHI,sp)
      009517 1E 07            [ 2] 1251 	ldw (DBLHI,sp),y
      009519 CF 00            [ 2] 1252 	ldw y,(DIVDNDLO,sp)
      00951B 0D C7            [ 2] 1253 	ldw (DBLLO,sp),y 
                                   1254 ; check for 0 divisor
      00951D 00               [ 2] 1255 	tnzw x 
      00951E 0F 7B            [ 1] 1256     jrne 0$
      009520 02 C7            [ 1] 1257 	ld a,#ERR_DIV0 
      009522 00 0B 7B         [ 2] 1258 	jp tb_error 
                                   1259 ; check divisor sign 	
      009525 01               [ 1] 1260 0$:	ld a,xh 
      009526 1E 03            [ 1] 1261 	and a,#0x80 
      009528 16 05            [ 1] 1262 	jreq 1$
      00952A 5B 09            [ 1] 1263 	cpl (SDIVSR,sp)
      00952C 81 06            [ 1] 1264 	cpl (SQUOT,sp)
      00952D 50               [ 2] 1265 	negw x
      00952D 52 06            [ 2] 1266 1$:	ldw (DIVISR,sp),x
                                   1267 ; check dividend sign 	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00952F 1F 01            [ 1] 1268  	ld a,(DBLHI,sp) 
      009531 0F 03            [ 1] 1269 	and a,#0x80 
      009533 0F 04            [ 1] 1270 	jreq 2$ 
      009535 90 9F            [ 1] 1271 	cpl (SQUOT,sp)
      009537 42 1F            [ 2] 1272 	ldw x,(DBLLO,sp)
      009539 05 7B            [ 2] 1273 	ldw y,(DBLHI,sp)
      00953B 01 93 42         [ 4] 1274 	call dneg 
      00953E 4F 72            [ 2] 1275 	ldw (DBLLO,sp),x 
      009540 FB 04            [ 2] 1276 	ldw (DBLHI,sp),y 
      009542 4F 19            [ 2] 1277 2$:	ldw x,(DIVISR,sp)
      009544 03 6B 03         [ 4] 1278 	call udiv32_16
      009547 1F 04            [ 2] 1279 	tnzw y 
      009549 90 5E            [ 1] 1280 	jreq 3$ 
                                   1281 ; x=quotient 
                                   1282 ; y=remainder 
                                   1283 ; if SDIVSR XOR SQUOT increment quotient and remainder.
      00954B 93 7B            [ 1] 1284 	ld a,(SQUOT,sp)
      00954D 02 42            [ 1] 1285 	xor a,(SDIVSR,sp)
      00954F 72 FB            [ 1] 1286 	jreq 3$
      009551 04               [ 1] 1287 	incw x 
      009552 4F 19 03 6B      [ 2] 1288 	ldw acc16,y 
      009556 03 1F            [ 2] 1289 	ldw y,(DIVISR,sp)
      009558 04 7B 01 93      [ 2] 1290 	subw y,acc16
                                   1291 ; sign quotient
      00955C 42 72            [ 1] 1292 3$:	ld a,(SQUOT,sp)
      00955E FB 03            [ 1] 1293 	jreq 4$
      009560 90               [ 2] 1294 	negw x 
      00159D                       1295 4$:	
      00159D                       1296 	_drop VSIZE 
      009561 93 1E            [ 2]    1     addw sp,#VSIZE 
      009563 05               [ 4] 1297 	ret 
                                   1298 
                                   1299 
                                   1300 
                                   1301 ;----------------------------------
                                   1302 ; division x/y 
                                   1303 ; input:
                                   1304 ;    X       dividend
                                   1305 ;    Y       divisor 
                                   1306 ; output:
                                   1307 ;    X       quotient
                                   1308 ;    Y       remainder 
                                   1309 ;-----------------------------------
                           000004  1310 	VSIZE=4 
                                   1311 	; local variables 
                           000001  1312 	DBLHI=1
                           000003  1313 	DBLLO=3
      0015A0                       1314 divide: 
      0015A0                       1315 	_vars VSIZE 
      009564 5B 06            [ 2]    1     sub sp,#VSIZE 
      009566 81 CF 00 0D      [ 2] 1316 	ldw acc16,y
      009567 CD 15 3F         [ 4] 1317 	call dbl_sign_extend
      009567 52 01            [ 2] 1318 	ldw (DBLLO,sp),x 
      009569 0F 01            [ 2] 1319 	ldw (DBLHI,sp),y 
      00956B 9E A4 80         [ 2] 1320 	ldw x,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00956E 2A 03 03         [ 4] 1321 	call div32_16 
      0015B3                       1322 	_drop VSIZE 
      009571 01 50            [ 2]    1     addw sp,#VSIZE 
      009573 81               [ 4] 1323 	ret
                                   1324 
                                   1325 
                                   1326 ;----------------------------------
                                   1327 ;  remainder resulting from euclidian 
                                   1328 ;  division of x/y 
                                   1329 ; input:
                                   1330 ;   x   	dividend int16_t 
                                   1331 ;   y 		divisor int16_t
                                   1332 ; output:
                                   1333 ;   X       n1%n2 
                                   1334 ;----------------------------------
      0015B6                       1335 modulo:
      009573 90 9E A4         [ 4] 1336 	call divide
      009576 80               [ 1] 1337 	ldw x,y 
      009577 2A               [ 4] 1338 	ret 
                                   1339 
                                   1340 ;----------------------------------
                                   1341 ; BASIC: MULDIV(expr1,expr2,expr3)
                                   1342 ; return expr1*expr2/expr3 
                                   1343 ; product result is int32_t and 
                                   1344 ; divisiont is int32_t/int16_t
                                   1345 ;----------------------------------
                           000004  1346 	DBL_SIZE=4 
      0015BB                       1347 muldiv:
      009578 04 03 01         [ 4] 1348 	call func_args 
      00957B 90 50            [ 1] 1349 	cp a,#3 
      00957D 27 03            [ 1] 1350 	jreq 1$
      00957D CD 95 2D         [ 2] 1351 	jp syntax_error
      0015C5                       1352 1$: 
      009580 7B 01            [ 2] 1353 	ldw x,(5,sp) ; expr1
      009582 27 03            [ 2] 1354 	ldw y,(3,sp) ; expr2
      009584 CD 95 B4         [ 4] 1355 	call multiply 
      009587 1F 05            [ 2] 1356 	ldw (5,sp),x  ;int32_t 15..0
      009587 5B 01            [ 2] 1357 	ldw (3,sp),y  ;int32_t 31..16
      009589 81               [ 2] 1358 	popw x        ; expr3 
      00958A CD 15 49         [ 4] 1359 	call div32_16 ; int32_t/expr3 
      0015D4                       1360 	_drop DBL_SIZE
      00958A 52 03            [ 2]    1     addw sp,#DBL_SIZE 
      00958C 1F               [ 4] 1361 	ret 
                                   1362 
                                   1363 
                                   1364 ;---------------------------------
                                   1365 ; dictionary search 
                                   1366 ; input:
                                   1367 ;	X 		dictionary entry point, name field  
                                   1368 ;   y		.asciz name to search 
                                   1369 ; output:
                                   1370 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   1371 ;  X		cmd_index
                                   1372 ;---------------------------------
                           000001  1373 	NLEN=1 ; cmd length 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



                           000002  1374 	XSAVE=2
                           000004  1375 	YSAVE=4
                           000005  1376 	VSIZE=5 
      0015D7                       1377 search_dict::
      0015D7                       1378 	_vars VSIZE 
      00958D 01 1E            [ 2]    1     sub sp,#VSIZE 
                                   1379 
      00958F 08 16            [ 2] 1380 	ldw (YSAVE,sp),y 
      0015DB                       1381 search_next:
      009591 06 90            [ 2] 1382 	ldw (XSAVE,sp),x 
                                   1383 ; get name length in dictionary	
      009593 5D               [ 1] 1384 	ld a,(x)
      009594 26 06            [ 1] 1385 	and a,#0xf 
      009596 16 01            [ 1] 1386 	ld (NLEN,sp),a  
      009598 65 5B            [ 2] 1387 	ldw y,(YSAVE,sp) ; name pointer 
      00959A 03               [ 1] 1388 	incw x 
      0015E5                       1389 cp_loop:
      00959B 81 F6            [ 1] 1390 	ld a,(y)
      00959C 27 1B            [ 1] 1391 	jreq str_match 
      00959C 51 A6            [ 1] 1392 	tnz (NLEN,sp)
      00959E 11 6B            [ 1] 1393 	jreq no_match  
      0095A0 03               [ 1] 1394 	cp a,(x)
      0095A1 26 07            [ 1] 1395 	jrne no_match 
      0095A1 13 01            [ 1] 1396 	incw y 
      0095A3 2B               [ 1] 1397 	incw x
      0095A4 03 72            [ 1] 1398 	dec (NLEN,sp)
      0095A6 F0 01            [ 2] 1399 	jra cp_loop 
      0015F7                       1400 no_match:
      0095A8 8C 90            [ 2] 1401 	ldw x,(XSAVE,sp) 
      0095AA 59 59 0A         [ 2] 1402 	subw x,#2 ; move X to link field
      0095AD 03 26            [ 1] 1403 	push #TK_NONE 
      0095AF F1               [ 2] 1404 	ldw x,(x) ; next word link 
      0095B0 51               [ 1] 1405 	pop a ; TK_NONE 
      0095B1 5B 03            [ 1] 1406 	jreq search_exit  ; not found  
                                   1407 ;try next 
      0095B3 81 D7            [ 2] 1408 	jra search_next
      0095B4                       1409 str_match:
      0095B4 53 90            [ 2] 1410 	ldw x,(XSAVE,sp)
      0095B6 53               [ 1] 1411 	ld a,(X)
      0095B7 1C 00            [ 1] 1412 	ld (NLEN,sp),a ; needed to test keyword type  
      0095B9 01 24            [ 1] 1413 	and a,#0xf 
                                   1414 ; move x to procedure address field 	
      0095BB 02               [ 1] 1415 	inc a 
      0095BC 90 5C 81         [ 1] 1416 	ld acc8,a 
      0095BF 72 5F 00 0D      [ 1] 1417 	clr acc16 
      0095BF 90 5F 9E A4      [ 2] 1418 	addw x,acc16 
      0095C3 80               [ 2] 1419 	ldw x,(x) ; routine index  
                                   1420 ;determine keyword type bits 7:6 
      0095C4 27 02            [ 1] 1421 	ld a,(NLEN,sp)
      0095C6 90               [ 1] 1422 	swap a 
      0095C7 53 81            [ 1] 1423 	and a,#0xc
      0095C9 44               [ 1] 1424 	srl a
      0095C9 52               [ 1] 1425 	srl a 
      0095CA 08 0F            [ 1] 1426 	add a,#128
      001621                       1427 search_exit: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      001621                       1428 	_drop VSIZE 	 
      0095CC 05 0F            [ 2]    1     addw sp,#VSIZE 
      0095CE 06               [ 4] 1429 	ret 
                                   1430 
                                   1431 ;---------------------
                                   1432 ; check if next token
                                   1433 ;  is of expected type 
                                   1434 ; input:
                                   1435 ;   A 		 expected token attribute
                                   1436 ;  ouput:
                                   1437 ;   none     if fail call syntax_error 
                                   1438 ;--------------------
      001624                       1439 expect:
      0095CF 16               [ 1] 1440 	push a 
      0095D0 0B 17 01         [ 4] 1441 	call next_token 
      0095D3 16 0D            [ 1] 1442 	cp a,(1,sp)
      0095D5 17 03            [ 1] 1443 	jreq 1$
      0095D7 5D 26 05         [ 2] 1444 	jp syntax_error
      0095DA A6               [ 1] 1445 1$: pop a 
      0095DB 04               [ 4] 1446 	ret 
                                   1447 
                                   1448 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1449 ; parse arguments list 
                                   1450 ; between ()
                                   1451 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001631                       1452 func_args:
      0095DC CC 92            [ 1] 1453 	ld a,#TK_LPAREN 
      0095DE 17 9E A4         [ 4] 1454 	call expect 
                                   1455 ; expected to continue in arg_list 
                                   1456 ; caller must check for TK_RPAREN 
                                   1457 
                                   1458 ;-------------------------------
                                   1459 ; parse embedded BASIC routines 
                                   1460 ; arguments list.
                                   1461 ; arg_list::=  rel[','rel]*
                                   1462 ; all arguments are of integer type
                                   1463 ; and pushed on stack 
                                   1464 ; input:
                                   1465 ;   none
                                   1466 ; output:
                                   1467 ;   stack{n}   arguments pushed on stack
                                   1468 ;   A 	number of arguments pushed on stack  
                                   1469 ;--------------------------------
      001636                       1470 arg_list:
      0095E1 80 27            [ 1] 1471 	push #0  
      0095E3 05 03 05         [ 4] 1472 1$: call relation
      0095E6 03 06            [ 1] 1473 	cp a,#TK_NONE 
      0095E8 50 1F            [ 1] 1474 	jreq 5$
      0095EA 07 7B            [ 1] 1475 	cp a,#TK_INTGR
      0095EC 01 A4            [ 1] 1476 	jrne 4$
      001643                       1477 3$: 
                                   1478 ; swap return address with argument
      0095EE 80               [ 1] 1479 	pop a ; arg_count
      0095EF 27 0D            [ 2] 1480 	popw y ; return address 
      0095F1 03               [ 2] 1481 	pushw x ; new argument 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      0095F2 06 1E            [ 2] 1482 	pushw y 
      0095F4 03               [ 1] 1483     inc a
      0095F5 16               [ 1] 1484 	push a 
      0095F6 01 CD 95         [ 4] 1485 	call next_token 
      0095F9 B4 1F            [ 1] 1486 	cp a,#TK_COMMA 
      0095FB 03 17            [ 1] 1487 	jreq 1$ 
      0095FD 01 1E            [ 1] 1488 	cp a,#TK_NONE 
      0095FF 07 CD            [ 1] 1489 	jreq 5$ 
      009601 95 8A            [ 1] 1490 4$:	cp a,#TK_RPAREN 
      009603 90 5D            [ 1] 1491 	jreq 5$
      00165A                       1492 	_unget_token 
      009605 27 11 7B 06 18   [ 1]    1      mov in,in.saved  
      00960A 05               [ 1] 1493 5$:	pop a  
      00960B 27               [ 4] 1494 	ret 
                                   1495 
                                   1496 ;--------------------------------
                                   1497 ;   BASIC commnands 
                                   1498 ;--------------------------------
                                   1499 
                                   1500 ;--------------------------------
                                   1501 ;  arithmetic and relational 
                                   1502 ;  routines
                                   1503 ;  operators precedence
                                   1504 ;  highest to lowest
                                   1505 ;  operators on same row have 
                                   1506 ;  same precedence and are executed
                                   1507 ;  from left to right.
                                   1508 ;	'*','/','%'
                                   1509 ;   '-','+'
                                   1510 ;   '=','>','<','>=','<=','<>','><'
                                   1511 ;   '<>' and '><' are equivalent for not equal.
                                   1512 ;--------------------------------
                                   1513 
                                   1514 ;---------------------
                                   1515 ; return array element
                                   1516 ; address from @(expr)
                                   1517 ; input:
                                   1518 ;   A 		TK_ARRAY
                                   1519 ; output:
                                   1520 ;   A 		TK_INTGR
                                   1521 ;	X 		element address 
                                   1522 ;----------------------
      001661                       1523 get_array_element:
      00960C 0B 5C 90         [ 4] 1524 	call func_args 
      00960F CF 00            [ 1] 1525 	cp a,#1
      009611 0E 16            [ 1] 1526 	jreq 1$
      009613 07 72 B2         [ 2] 1527 	jp syntax_error
      009616 00               [ 2] 1528 1$: popw x 
                                   1529 	; check for bounds 
      009617 0E 7B 06         [ 2] 1530 	cpw x,array_size 
      00961A 27 01            [ 2] 1531 	jrule 3$
                                   1532 ; bounds {1..array_size}	
      00961C 50 0A            [ 1] 1533 2$: ld a,#ERR_BAD_VALUE 
      00961D CC 11 97         [ 2] 1534 	jp tb_error 
      00961D 5B               [ 2] 1535 3$: tnzw  x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00961E 08 81            [ 1] 1536 	jreq 2$ 
      009620 58               [ 2] 1537 	sllw x 
      009620 52               [ 2] 1538 	pushw x 
      009621 04 90 CF         [ 2] 1539 	ldw x,#tib
      009624 00 0E CD         [ 2] 1540 	subw x,(1,sp)
      001681                       1541 	_drop 2   
      009627 95 BF            [ 2]    1     addw sp,#2 
      009629 1F 03            [ 1] 1542 	ld a,#TK_INTGR
      00962B 17               [ 4] 1543 	ret 
                                   1544 
                                   1545 
                                   1546 ;***********************************
                                   1547 ;   expression parse,execute 
                                   1548 ;***********************************
                                   1549 ;-----------------------------------
                                   1550 ; factor ::= ['+'|'-'|e]  var | @ |
                                   1551 ;			 integer | function |
                                   1552 ;			 '('relation')' 
                                   1553 ; output:
                                   1554 ;   A    token attribute 
                                   1555 ;   X 	 integer
                                   1556 ; ---------------------------------
                           000001  1557 	NEG=1
                           000001  1558 	VSIZE=1
      001686                       1559 factor:
      001686                       1560 	_vars VSIZE 
      00962C 01 CE            [ 2]    1     sub sp,#VSIZE 
      00962E 00 0E CD         [ 4] 1561 	call next_token
      009631 95 C9            [ 1] 1562 	cp a,#CMD_END  
      009633 5B 04            [ 1] 1563 	jrult 16$
      009635 81 01            [ 1] 1564 1$:	ld (NEG,sp),a 
      009636 A4 30            [ 1] 1565 	and a,#TK_GRP_MASK
      009636 CD 96            [ 1] 1566 	cp a,#TK_GRP_ADD 
      009638 20 93            [ 1] 1567 	jreq 2$
      00963A 81 01            [ 1] 1568 	ld a,(NEG,sp)
      00963B 20 03            [ 2] 1569 	jra 4$  
      00169B                       1570 2$:	
      00963B CD 96 B1         [ 4] 1571 	call next_token 
      00169E                       1572 4$:	
      00963E A1 03            [ 1] 1573 	cp a,#TK_IFUNC 
      009640 27 03            [ 1] 1574 	jrne 5$ 
      009642 CC               [ 4] 1575 	call (x) 
      009643 92 15            [ 2] 1576 	jra 18$ 
      009645                       1577 5$:
      009645 1E 05            [ 1] 1578 	cp a,#TK_INTGR
      009647 16 03            [ 1] 1579 	jrne 6$
      009649 CD 95            [ 2] 1580 	jra 18$
      0016AB                       1581 6$:
      00964B 67 1F            [ 1] 1582 	cp a,#TK_ARRAY
      00964D 05 17            [ 1] 1583 	jrne 7$
      00964F 03 85 CD         [ 4] 1584 	call get_array_element
      009652 95               [ 2] 1585 	ldw x,(x)
      009653 C9 5B            [ 2] 1586 	jra 18$ 
      0016B5                       1587 7$:
      009655 04 81            [ 1] 1588 	cp a,#TK_VAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      009657 26 03            [ 1] 1589 	jrne 8$
      009657 52               [ 2] 1590 	ldw x,(x)
      009658 05 17            [ 2] 1591 	jra 18$
      0016BC                       1592 8$:
      00965A 04 03            [ 1] 1593 	cp a,#TK_LABEL 
      00965B 26 0C            [ 1] 1594 	jrne 12$ 
      00965B 1F 02 F6         [ 4] 1595 	call search_const 
      00965E A4               [ 1] 1596 	clr a 
      00965F 0F               [ 2] 1597 	tnzw x 
      009660 6B 01            [ 1] 1598 	jreq 16$
      009662 16 04 5C         [ 4] 1599 	call get_const_value 
      009665 20 24            [ 2] 1600 	jra 20$ 
      0016CC                       1601 12$:			
      009665 90 F6            [ 1] 1602 	cp a,#TK_LPAREN
      009667 27 1B            [ 1] 1603 	jrne 16$
      009669 0D 01 27         [ 4] 1604 	call relation
      00966C 0A               [ 2] 1605 	pushw x 
      00966D F1 26            [ 1] 1606 	ld a,#TK_RPAREN 
      00966F 07 90 5C         [ 4] 1607 	call expect
      009672 5C               [ 2] 1608 	popw x 
      009673 0A 01            [ 2] 1609 	jra 18$	
      0016DC                       1610 16$:
      009675 20               [ 1] 1611 	tnz a 
      009676 EE 11            [ 1] 1612 	jreq 20$ 
      009677                       1613 	_unget_token
      009677 1E 02 1D 00 02   [ 1]    1      mov in,in.saved  
      00967C 4B               [ 1] 1614 	clr a 
      00967D 00 FE            [ 2] 1615 	jra 20$ 
      0016E7                       1616 18$: 
      00967F 84 27            [ 1] 1617 	ld a,#TK_MINUS 
      009681 1F 20            [ 1] 1618 	cp a,(NEG,sp)
      009683 D7 01            [ 1] 1619 	jrne 19$
      009684 50               [ 2] 1620 	negw x
      0016EE                       1621 19$:
      009684 1E 02            [ 1] 1622 	ld a,#TK_INTGR
      0016F0                       1623 20$:
      0016F0                       1624 	_drop VSIZE
      009686 F6 6B            [ 2]    1     addw sp,#VSIZE 
      009688 01               [ 4] 1625 	ret
                                   1626 
                                   1627 ;-----------------------------------
                                   1628 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   1629 ; output:
                                   1630 ;   A    	token attribute 
                                   1631 ;	X		integer
                                   1632 ;-----------------------------------
                           000001  1633 	N1=1   ; int16_t
                           000003  1634 	MULOP=3
                           000003  1635 	VSIZE=3
      0016F3                       1636 term:
      0016F3                       1637 	_vars VSIZE
      009689 A4 0F            [ 2]    1     sub sp,#VSIZE 
      00968B 4C C7 00         [ 4] 1638 	call factor
      00968E 0F               [ 1] 1639 	tnz a 
      00968F 72 5F            [ 1] 1640 	jreq term_exit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      0016FB                       1641 term01:	 ; check for  operator 
      009691 00 0E            [ 2] 1642 	ldw (N1,sp),x  ; save first factor 
      009693 72 BB 00         [ 4] 1643 	call next_token
      009696 0E FE            [ 1] 1644 	ld (MULOP,sp),a
      009698 7B 01            [ 1] 1645 	cp a,#CMD_END
      00969A 4E A4            [ 1] 1646 	jrult 8$
      00969C 0C 44            [ 1] 1647 	and a,#TK_GRP_MASK
      00969E 44 AB            [ 1] 1648 	cp a,#TK_GRP_MULT
      0096A0 80 02            [ 1] 1649 	jreq 1$
      0096A1 20 27            [ 2] 1650 	jra 8$
      00170E                       1651 1$:	; got *|/|%
      0096A1 5B 05 81         [ 4] 1652 	call factor
      0096A4 A1 84            [ 1] 1653 	cp a,#TK_INTGR
      0096A4 88 CD            [ 1] 1654 	jreq 2$
      0096A6 93 08 11         [ 2] 1655 	jp syntax_error
      0096A9 01 27            [ 1] 1656 2$:	ldw y,x 
      0096AB 03 CC            [ 2] 1657 	ldw x,(N1,sp)
      0096AD 92 15            [ 1] 1658 	ld a,(MULOP,sp) 
      0096AF 84 81            [ 1] 1659 	cp a,#TK_MULT 
      0096B1 26 05            [ 1] 1660 	jrne 3$
      0096B1 A6 06 CD         [ 4] 1661 	call multiply 
      0096B4 96 A4            [ 2] 1662 	jra term01
      0096B6 A1 21            [ 1] 1663 3$: cp a,#TK_DIV 
      0096B6 4B 00            [ 1] 1664 	jrne 4$ 
      0096B8 CD 98 0E         [ 4] 1665 	call divide 
      0096BB A1 00            [ 2] 1666 	jra term01 
      0096BD 27 20 A1         [ 4] 1667 4$: call modulo
      0096C0 84 26            [ 2] 1668 	jra term01 
      0096C2 13 03            [ 1] 1669 8$: ld a,(MULOP,sp)
      0096C3 27 05            [ 1] 1670 	jreq 9$ 
      001739                       1671 	_unget_token
      0096C3 84 90 85 89 90   [ 1]    1      mov in,in.saved  
      0096C8 89 4C            [ 2] 1672 9$: ldw x,(N1,sp)
      0096CA 88 CD            [ 1] 1673 	ld a,#TK_INTGR 	
      001742                       1674 term_exit:
      001742                       1675 	_drop VSIZE 
      0096CC 93 08            [ 2]    1     addw sp,#VSIZE 
      0096CE A1               [ 4] 1676 	ret 
                                   1677 
                                   1678 ;-------------------------------
                                   1679 ;  expr ::= term [['+'|'-'] term]*
                                   1680 ;  result range {-32768..32767}
                                   1681 ;  output:
                                   1682 ;   A    token attribute 
                                   1683 ;   X	 integer   
                                   1684 ;-------------------------------
                           000001  1685 	N1=1
                           000003  1686 	N2=3 
                           000005  1687 	OP=5 
                           000005  1688 	VSIZE=5 
      001745                       1689 expression:
      001745                       1690 	_vars VSIZE 
      0096CF 08 27            [ 2]    1     sub sp,#VSIZE 
      0096D1 E6 A1 00         [ 4] 1691 	call term
      0096D4 27               [ 1] 1692 	tnz a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      0096D5 09 A1            [ 1] 1693 	jreq expr_exit 
      0096D7 07 27            [ 2] 1694 1$:	ldw (N1,sp),x 
      0096D9 05 55 00         [ 4] 1695 	call next_token
      0096DC 03 00            [ 1] 1696 	ld (OP,sp),a 
      0096DE 02 84            [ 1] 1697 	cp a,#CMD_END 
      0096E0 81 26            [ 1] 1698 	jrult 8$ 
      0096E1 A4 30            [ 1] 1699 	and a,#TK_GRP_MASK
      0096E1 CD 96            [ 1] 1700 	cp a,#TK_GRP_ADD 
      0096E3 B1 A1            [ 1] 1701 	jreq 2$ 
      0096E5 01 27            [ 2] 1702 	jra 8$
      001760                       1703 2$: 
      0096E7 03 CC 92         [ 4] 1704 	call term
      0096EA 15 85            [ 1] 1705 	cp a,#TK_INTGR
      0096EC C3 00            [ 1] 1706 	jreq 3$
      0096EE 20 23 05         [ 2] 1707 	jp syntax_error
      0096F1 A6 0A            [ 2] 1708 3$:	ldw (N2,sp),x 
      0096F3 CC 92            [ 2] 1709 	ldw x,(N1,sp)
      0096F5 17 5D            [ 1] 1710 	ld a,(OP,sp)
      0096F7 27 F8            [ 1] 1711 	cp a,#TK_PLUS 
      0096F9 58 89            [ 1] 1712 	jrne 4$
      0096FB AE 16 90         [ 2] 1713 	addw x,(N2,sp)
      0096FE 72 F0            [ 2] 1714 	jra 1$ 
      009700 01 5B 02         [ 2] 1715 4$:	subw x,(N2,sp)
      009703 A6 84            [ 2] 1716 	jra 1$
      009705 81 05            [ 1] 1717 8$: ld a,(OP,sp)
      009706 27 05            [ 1] 1718 	jreq 9$ 
      001782                       1719 	_unget_token	
      009706 52 01 CD 93 08   [ 1]    1      mov in,in.saved  
      00970B A1 02            [ 2] 1720 9$: ldw x,(N1,sp)
      00970D 25 4D            [ 1] 1721 	ld a,#TK_INTGR	
      00178B                       1722 expr_exit:
      00178B                       1723 	_drop VSIZE 
      00970F 6B 01            [ 2]    1     addw sp,#VSIZE 
      009711 A4               [ 4] 1724 	ret 
                                   1725 
                                   1726 ;---------------------------------------------
                                   1727 ; rel ::= expr rel_op expr
                                   1728 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   1729 ;  relation return  integer , zero is false 
                                   1730 ;  output:
                                   1731 ;    A 		token attribute  
                                   1732 ;	 X		integer 
                                   1733 ;---------------------------------------------
                           000001  1734 	N1=1
                           000003  1735 	RELOP=3
                           000003  1736 	VSIZE=3 
      00178E                       1737 relation: 
      00178E                       1738 	_vars VSIZE
      009712 30 A1            [ 2]    1     sub sp,#VSIZE 
      009714 10 27 04         [ 4] 1739 	call expression
      009717 7B               [ 1] 1740 	tnz a 
      009718 01 20            [ 1] 1741 	jreq rel_exit
      00971A 03 01            [ 2] 1742 	ldw (N1,sp),x 
                                   1743 ; expect rel_op or leave 
      00971B CD 12 88         [ 4] 1744 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      00971B CD 93            [ 1] 1745 	ld (RELOP,sp),a 
      00971D 08 30            [ 1] 1746 	and a,#TK_GRP_MASK
      00971E A1 30            [ 1] 1747 	cp a,#TK_GRP_RELOP 
      00971E A1 81            [ 1] 1748 	jrne 8$
      0017A3                       1749 2$:	; expect another expression
      009720 26 03 FD         [ 4] 1750 	call expression
      009723 20 42            [ 1] 1751 	cp a,#TK_INTGR
      009725 27 03            [ 1] 1752 	jreq 3$
      009725 A1 84 26         [ 2] 1753 	jp syntax_error 
      009728 02 20 3C         [ 2] 1754 3$:	ldw acc16,x 
      00972B 1E 01            [ 2] 1755 	ldw x,(N1,sp) 
      00972B A1 05 26 06      [ 2] 1756 	subw x,acc16
      00972F CD 96            [ 1] 1757 	jrne 4$
      009731 E1 FE 20 32      [ 1] 1758 	mov acc8,#2 ; n1==n2
      009735 20 0C            [ 2] 1759 	jra 6$ 
      0017BE                       1760 4$: 
      009735 A1 85            [ 1] 1761 	jrsgt 5$  
      009737 26 03 FE 20      [ 1] 1762 	mov acc8,#4 ; n1<2 
      00973B 2B 04            [ 2] 1763 	jra 6$
      00973C                       1764 5$:
      00973C A1 03 26 0C      [ 1] 1765 	mov acc8,#1 ; n1>n2 
      0017CA                       1766 6$:
      009740 CD               [ 1] 1767 	clrw x 
      009741 99 BF 4F         [ 1] 1768 	ld a, acc8  
      009744 5D 27            [ 1] 1769 	and a,(RELOP,sp)
      009746 15               [ 1] 1770 	tnz a 
      009747 CD 99            [ 1] 1771 	jreq 10$
      009749 2C               [ 1] 1772 	incw x 
      00974A 20 24            [ 2] 1773 	jra 10$  	
      00974C 7B 03            [ 1] 1774 8$: ld a,(RELOP,sp)
      00974C A1 06            [ 1] 1775 	jreq 9$
      0017DA                       1776 	_unget_token
      00974E 26 0C CD 98 0E   [ 1]    1      mov in,in.saved  
      0017DF                       1777 9$: 
      009753 89 A6            [ 2] 1778 	ldw x,(N1,sp)
      0017E1                       1779 10$:
      009755 07 CD            [ 1] 1780 	ld a,#TK_INTGR
      0017E3                       1781 rel_exit:
      0017E3                       1782 	_drop VSIZE
      009757 96 A4            [ 2]    1     addw sp,#VSIZE 
      009759 85               [ 4] 1783 	ret 
                                   1784 
                                   1785 ;--------------------------------
                                   1786 ; BASIC: SHOW 
                                   1787 ; print stack content in hexadecimal bytes 
                                   1788 ; 16 bytes per row 
                                   1789 ;--------------------------------
      0017E6                       1790 show:
      00975A 20 0B 00         [ 2] 1791 	ldw x,#cstk_prompt
      00975C CD 03 8F         [ 4] 1792 	call puts 
      00975C 4D               [ 1] 1793 	ldw x,sp 
      00975D 27 11 55         [ 2] 1794 	addw x,#3 ; ignore return address
      009760 00 03 00 02      [ 2] 1795 	ldw y,#RAM_SIZE  
      009764 4F 20 09         [ 2] 1796 	ldw acc16,x 
      009767 72 B2 00 0D      [ 2] 1797 	subw y,acc16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      009767 A6 11 11         [ 4] 1798 	call hex_dump
      00976A 01               [ 1] 1799 	clr a 
      00976B 26               [ 4] 1800 	ret
                                   1801 
      00976C 01 50 6F 6E 74 65 6E  1802 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             74 20 6F 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   1803 
                                   1804 
                                   1805 ;--------------------------------------------
                                   1806 ; BASIC: HEX 
                                   1807 ; select hexadecimal base for integer print
                                   1808 ;---------------------------------------------
      00976E                       1809 hex_base:
      00976E A6 84 00 0A      [ 1] 1810 	mov base,#16 
      009770 81               [ 4] 1811 	ret 
                                   1812 
                                   1813 ;--------------------------------------------
                                   1814 ; BASIC: DEC 
                                   1815 ; select decimal base for integer print
                                   1816 ;---------------------------------------------
      00182C                       1817 dec_base:
      009770 5B 01 81 0A      [ 1] 1818 	mov base,#10
      009773 81               [ 4] 1819 	ret 
                                   1820 
                                   1821 ;------------------------
                                   1822 ; BASIC: FREE 
                                   1823 ; return free size in RAM 
                                   1824 ; output:
                                   1825 ;   A 		TK_INTGR
                                   1826 ;   X 	    size integer
                                   1827 ;--------------------------
      001831                       1828 free:
      009773 52 03 CD         [ 2] 1829 	ldw x,#tib 
      009776 97 06 4D 27      [ 2] 1830 	ldw y,txtbgn 
      00977A 47 A3 2E 00      [ 2] 1831 	cpw y,#app_space
      00977B 25 05            [ 1] 1832 	jrult 1$
      00977B 1F 01 CD         [ 2] 1833 	subw x,#free_ram 
      00977E 93 08            [ 2] 1834 	jra 2$ 
      001843                       1835 1$:	
      009780 6B 03 A1 02      [ 2] 1836 	subw x,txtend 
      009784 25 2F            [ 1] 1837 2$:	ld a,#TK_INTGR
      009786 A4               [ 4] 1838 	ret 
                                   1839 
                                   1840 ;------------------------------
                                   1841 ; BASIC: SIZE 
                                   1842 ; command that print 
                                   1843 ; program start addres and size 
                                   1844 ;------------------------------
      00184A                       1845 cmd_size:
      009787 30 A1 20         [ 1] 1846 	push base 
      00978A 27 02 20         [ 2] 1847 	ldw x,#PROG_ADDR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      00978D 27 03 8F         [ 4] 1848 	call puts 
      00978E CE 00 1A         [ 2] 1849 	ldw x,txtbgn     
      00978E CD 97 06 A1      [ 1] 1850 	mov base,#16 
      009792 84 27 03         [ 4] 1851 	call print_int
      009795 CC 92 15         [ 1] 1852 	pop base 
      009798 90 93 1E         [ 2] 1853 	ldw x,#PROG_SIZE 
      00979B 01 7B 03         [ 4] 1854 	call puts 
      00979E A1 20 26         [ 2] 1855 	ldw x,txtend 
      0097A1 05 CD 95 67      [ 2] 1856 	subw x,txtbgn 
      0097A5 20 D4 A1         [ 4] 1857 	call print_int
      0097A8 21 26 05         [ 2] 1858 	ldw x,#STR_BYTES 
      0097AB CD 96 20         [ 4] 1859 	call puts  
      0097AE 20               [ 4] 1860 	ret 
                                   1861 
                                   1862 
                                   1863 ;------------------------
                                   1864 ; BASIC: UBOUND  
                                   1865 ; return array variable size 
                                   1866 ; output:
                                   1867 ;   A 		TK_INTGR
                                   1868 ;   X 	    array size 
                                   1869 ;--------------------------
      001877                       1870 ubound:
      0097AF CB CD 96         [ 4] 1871 	call free 
      0097B2 36               [ 2] 1872 	srlw x 
      0097B3 20 C6 7B         [ 2] 1873 	ldw array_size,x
      0097B6 03 27            [ 1] 1874 	ld a,#TK_INTGR
      0097B8 05               [ 4] 1875 	ret 
                                   1876 
                                   1877 ;-----------------------------
                                   1878 ; BASIC: LET var=expr 
                                   1879 ; variable assignement 
                                   1880 ; output:
                                   1881 ;   A 		TK_NONE 
                                   1882 ;-----------------------------
      001881                       1883 let::
      0097B9 55 00 03         [ 4] 1884 	call next_token 
      0097BC 00 02            [ 1] 1885 	cp a,#TK_VAR 
      0097BE 1E 01            [ 1] 1886 	jreq let_var
      0097C0 A6 84            [ 1] 1887 	cp a,#TK_ARRAY 
      0097C2 27 03            [ 1] 1888 	jreq  let_array
      0097C2 5B 03 81         [ 2] 1889 	jp syntax_error
      0097C5                       1890 let_array:
      0097C5 52 05 CD         [ 4] 1891 	call get_array_element
      001892                       1892 let_var:
      0097C8 97               [ 2] 1893 	pushw x  
      0097C9 73 4D 27         [ 4] 1894 	call next_token 
      0097CC 3E 1F            [ 1] 1895 	cp a,#TK_EQUAL
      0097CE 01 CD            [ 1] 1896 	jreq 1$
      0097D0 93 08 6B         [ 2] 1897 	jp syntax_error
      00189D                       1898 1$:	
      0097D3 05 A1 02         [ 4] 1899 	call relation   
      0097D6 25 26            [ 1] 1900 	cp a,#TK_INTGR 
      0097D8 A4 30            [ 1] 1901 	jreq 2$
      0097DA A1 10 27         [ 2] 1902 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      0018A7                       1903 2$:	
      0097DD 02 20            [ 1] 1904 	ldw y,x 
      0097DF 1E               [ 2] 1905 	popw x   
      0097E0 FF               [ 2] 1906 	ldw (x),y   
      0097E0 CD               [ 4] 1907 	ret 
                                   1908 
                                   1909 
                                   1910 ;--------------------------
                                   1911 ; return constant value 
                                   1912 ; from it's record address
                                   1913 ; input:
                                   1914 ;	X	*const record 
                                   1915 ; output:
                                   1916 ;   X    const  value
                                   1917 ;   A    TK_INTGR
                                   1918 ;--------------------------
      0018AC                       1919 get_const_value:
      0097E1 97               [ 1] 1920 	ld a,(x)
      0097E2 73 A1            [ 1] 1921 	sub a,#2 
      0097E4 84               [ 1] 1922 	push a 
      0097E5 27 03            [ 1] 1923 	push #0 
      0097E7 CC 92 15         [ 2] 1924 	addw x,(1,sp)
      0097EA 1F               [ 2] 1925 	ldw x,(x)
      0018B6                       1926 	_drop 2 
      0097EB 03 1E            [ 2]    1     addw sp,#2 
      0097ED 01 7B            [ 1] 1927 	ld a,#TK_INTGR
      0097EF 05               [ 4] 1928 	ret 
                                   1929 
                                   1930 
                                   1931 ;--------------------------
                                   1932 ; list constants in EEPROM 
                                   1933 ; call when using LIST \C 
                                   1934 ;-------------------------
                           000001  1935 	COUNT=1
                           000003  1936 	YTEMP=3
                           000004  1937 	VSIZE=4 
      0018BB                       1938 list_const:
      0018BB                       1939 	_vars 4 
      0097F0 A1 10            [ 2]    1     sub sp,#4 
      0097F2 26               [ 1] 1940 	clrw x 
      0097F3 05 72            [ 2] 1941 	ldw (COUNT,sp),x  
      0097F5 FB 03 20 D4      [ 2] 1942 	ldw Y,#EEPROM_BASE 
      0097F9 72 F0 03 20      [ 2] 1943 1$:	cpw y,free_eeprom 
      0097FD CF 7B            [ 1] 1944 	jruge 9$
      0097FF 05 27            [ 1] 1945 	incw y 
      009801 05               [ 1] 1946 	ldw x,y
      009802 55 00            [ 2] 1947 	ldw (YTEMP,sp),y 
      009804 03 00 02         [ 4] 1948 	call puts 
      009807 1E               [ 1] 1949 	incw x 
      009808 01 A6            [ 2] 1950 	ldw (YTEMP,sp),x 
      00980A 84 3D            [ 1] 1951 	ld a,#'= 
      00980B CD 03 32         [ 4] 1952 	call putc 
      00980B 5B 05            [ 2] 1953 	ldw x,(YTEMP,sp)
      00980D 81               [ 2] 1954 	ldw x,(x)
      00980E CD 12 D8         [ 4] 1955 	call print_int
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      00980E 52 03            [ 1] 1956 	ld a,#CR 
      009810 CD 97 C5         [ 4] 1957 	call putc  
      009813 4D 27            [ 2] 1958 	ldw x, (COUNT,sp)
      009815 4D               [ 1] 1959 	incw x 
      009816 1F 01            [ 2] 1960 	ldw (COUNT,sp),x 
      009818 CD 93            [ 2] 1961 	ldw Y,(YTEMP,sp)
      00981A 08 6B 03 A4      [ 2] 1962 	addw y,#2 
      00981E 30 A1            [ 2] 1963 	jra 1$ 
                                   1964 
      009820 30 26            [ 2] 1965 9$:	ldw x,(COUNT,sp)
      009822 33 12 D8         [ 4] 1966 	call print_int 
      009823 AE 19 00         [ 2] 1967 	ldw x,#CONST_COUNT 
      009823 CD 97 C5         [ 4] 1968 	call puts 
      0018FD                       1969 	_drop VSIZE 
      009826 A1 84            [ 2]    1     addw sp,#VSIZE 
      009828 27               [ 4] 1970 	ret 
                                   1971 
      009829 03 CC 92 15 CF 00 0E  1972 CONST_COUNT: .asciz "constants in EEPROM\n"
             1E 01 72 B0 00 0E 26
             06 35 02 00 0F 20 0C
                                   1973 
                                   1974 
                                   1975 ;--------------------------
                                   1976 ; BASIC: EEFREE 
                                   1977 ; eeprom_free 
                                   1978 ; search end of data  
                                   1979 ; in EEPROM 
                                   1980 ; input:
                                   1981 ;    none 
                                   1982 ; output:
                                   1983 ;    X     address free
                                   1984 ;    A     TK_INTGR  
                                   1985 ;-------------------------
      00983E                       1986 func_eefree:
      00983E 2C 06 35         [ 2] 1987 	ldw x,#EEPROM_BASE 
      009841 04 00 0F 20      [ 1] 1988 1$:	mov acc8,#8 ; count 8 consecutive zeros
      009845 04 47 F8         [ 2] 1989     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      009846 24 17            [ 1] 1990 	jruge 8$ ; no free space 
      009846 35               [ 1] 1991 2$: ld a,(x)
      009847 01 00            [ 1] 1992 	jrne 3$
      009849 0F               [ 1] 1993 	incw x 
      00984A 72 5A 00 0E      [ 1] 1994 	dec acc8 
      00984A 5F C6            [ 1] 1995 	jrne 2$
      00984C 00 0F 14         [ 2] 1996 	subw x,#8 
      00984F 03 4D            [ 2] 1997 	jra 9$  
      009851 27               [ 1] 1998 3$: ld a,(x)
      009852 0E               [ 1] 1999 	incw x
      009853 5C               [ 1] 2000 	tnz a  
      009854 20 0B            [ 1] 2001 	jrne 3$
      009856 7B               [ 2] 2002 	decw x   
      009857 03 27            [ 2] 2003 	jra 1$ 
      009859 05               [ 1] 2004 8$: clrw x ; no free space 
      001939                       2005 9$:
      00985A 55 00 03         [ 2] 2006 	ldw free_eeprom,x ; save in system variable 
      00985D 00 02            [ 1] 2007 	ld a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      00985F 81               [ 4] 2008 	ret 
                                   2009 
                                   2010 ;--------------------------
                                   2011 ; search constant name 
                                   2012 ; format of constant record  
                                   2013 ;   .byte record length 
                                   2014 ;         = strlen(name)+5 
                                   2015 ;   .asciz name (variable length)
                                   2016 ;   .word value (2 bytes )
                                   2017 ; a constant record use 6+ bytes
                                   2018 ; constants are saved in EEPROM  
                                   2019 ; input:
                                   2020 ;    X     *name
                                   2021 ; output:
                                   2022 ;    X     address|0
                                   2023 ; use:
                                   2024 ;   A,Y, acc16 
                                   2025 ;-------------------------
                           000001  2026 	NAMEPTR=1 ; target name pointer 
                           000003  2027 	EEPTR=3   ; walking pointer in EEPROM
                           000005  2028 	RECLEN=5  ; record length of targer 
                           000005  2029 	VSIZE=5
      00193F                       2030 search_const:
      00985F 1E 01            [ 2] 2031 	pushw y 
      009861                       2032 	_vars VSIZE
      009861 A6 84            [ 2]    1     sub sp,#VSIZE 
      009863 72 5F 00 0D      [ 1] 2033 	clr acc16 
      009863 5B 03 81         [ 4] 2034 	call strlen 
      009866 AB 04            [ 1] 2035 	add a,#4 
      009866 AE 98            [ 1] 2036 	ld (RECLEN,sp),a    
      009868 80 CD            [ 2] 2037 	ldw (NAMEPTR,sp),x
      00986A 84 0F 96 1C      [ 2] 2038 	ldw y,#EEPROM_BASE 
      00986E 00 03            [ 2] 2039 1$:	ldw x,(NAMEPTR,sp)
      009870 90 AE            [ 2] 2040 	ldw (EEPTR,sp),y
      009872 18 00 CF 00      [ 2] 2041 	cpw y, free_eeprom 
      009876 0E 72            [ 1] 2042 	jruge 7$ ; no match found 
      009878 B2 00            [ 1] 2043 	ld a,(y)
      00987A 0E CD            [ 1] 2044 	cp a,(RECLEN,sp)
      00987C 8E 84            [ 1] 2045 	jrne 2$ 
      00987E 4F 81            [ 1] 2046 	incw y 
      009880 0A 63 6F         [ 4] 2047 	call strcmp
      009883 6E 74            [ 1] 2048 	jrne 8$ ; match found 
      00196B                       2049 2$: ; skip this one 	
      009885 65 6E            [ 2] 2050 	ldW Y,(EEPTR,sp)
      009887 74 20            [ 1] 2051 	ld a,(y)
      009889 6F 66 20         [ 1] 2052 	ld acc8,a 
      00988C 73 74 61 63      [ 2] 2053 	addw y,acc16 
      009890 6B 20            [ 2] 2054 	jra 1$  
      001978                       2055 7$: ; no match found 
      009892 66 72            [ 1] 2056 	clr (EEPTR,sp)
      009894 6F 6D            [ 1] 2057 	clr (EEPTR+1,sp)
      00197C                       2058 8$: ; match found 
      009896 20 74            [ 2] 2059 	ldw x,(EEPTR,sp) ; record address 
      00197E                       2060 9$:	_DROP VSIZE
      009898 6F 70            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      00989A 20 74            [ 2] 2061 	 popw y 
      00989C 6F               [ 4] 2062 	 ret 
                                   2063 
                                   2064 
                                   2065 ;--------------------------------------------
                                   2066 ; BASIC: CONST name=value [, name=value]*
                                   2067 ; define constant(s) saved in EEPROM
                                   2068 ;--------------------------------------------
                           000001  2069 	CNAME=1 
                           000003  2070 	BUFPTR=3
                           000005  2071 	RECLEN=5
                           000005  2072 	VSIZE=5
      001983                       2073 cmd_const:
      001983                       2074 	_vars VSIZE 
      00989D 20 62            [ 2]    1     sub sp,#VSIZE 
      00989F 6F 74 74 6F      [ 1] 2075 	bres flags,#FUPDATE 
      0098A3 6D 3A 0A         [ 4] 2076 	call next_token 
      0098A6 00 04            [ 1] 2077 	cp a,#TK_CHAR 
      0098A7 26 0E            [ 1] 2078 	jrne 1$
      0098A7 35               [ 1] 2079 	ld a,xl
      0098A8 10 00            [ 1] 2080 	and a,#0xDF 
      0098AA 0B 81            [ 1] 2081 	cp a,#'U 
      0098AC 26 0B            [ 1] 2082 	jrne 2$
      0098AC 35 0A 00 0B      [ 1] 2083 	bset flags,#FUPDATE 
      00199B                       2084 0$:
      0098B0 81 12 88         [ 4] 2085 	call next_token 
      0098B1                       2086 1$:	
      0098B1 AE 16            [ 1] 2087 	cp a,#TK_LABEL 
      0098B3 90 90            [ 1] 2088 	jreq 3$
      0019A2                       2089 2$:	 
      0098B5 CE 00 1B         [ 2] 2090 	jp syntax_error 
      0019A5                       2091 3$: 
      0098B8 90 A3            [ 2] 2092 	ldw (CNAME,sp),x ; *const_name
      0098BA AE 80            [ 2] 2093 	ldw x,(CNAME,sp)
      0098BC 25 05 1D         [ 4] 2094 	call strlen 
      0098BF 00 80            [ 1] 2095 	add a,#4 
      0098C1 20 04            [ 1] 2096 	ld (RECLEN,sp),a 
                                   2097 ; copy name in buffer  
      0098C3 16 01            [ 2] 2098 	ldw y,(CNAME,sp) 
      0098C3 72 B0 00         [ 2] 2099 	ldw x,#tib  
      0098C6 1D A6            [ 1] 2100 	ld a,(RECLEN,sp)
      0098C8 84               [ 1] 2101 	ld (x),a 
      0098C9 81               [ 1] 2102 	incw x  
      0098CA CD 0E 5F         [ 4] 2103 	call strcpy 
      0098CA 3B 00            [ 2] 2104 	ldw (BUFPTR,sp),x
      0098CC 0B AE            [ 1] 2105 	ld a,(RECLEN,sp)
      0098CE 9A E8            [ 1] 2106 	sub a,#3 
      0098D0 CD 84            [ 1] 2107 	add a,(BUFPTR+1,sp)
      0098D2 0F CE            [ 1] 2108 	ld (BUFPTR+1,sp),a 
      0098D4 00 1B            [ 1] 2109 	jrnc 4$
      0098D6 35 10            [ 1] 2110     inc (BUFPTR,sp) 
      0019CA                       2111 4$:
      0098D8 00 0B            [ 1] 2112 	ld a,#TK_EQUAL 
      0098DA CD 93 58         [ 4] 2113 	call expect 
      0098DD 32 00 0B         [ 4] 2114 	call expression 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      0098E0 AE 9A            [ 1] 2115 	cp a,#TK_INTGR 
      0098E2 FA CD            [ 1] 2116 	jreq 5$ 
      0098E4 84 0F CE         [ 2] 2117 	jp syntax_error 
      0098E7 00 1D            [ 1] 2118 5$:	ldw y,x 
      0098E9 72 B0            [ 2] 2119 	ldw x,(BUFPTR,sp)
      0098EB 00 1B            [ 1] 2120 	ld a,yh 
      0098ED CD               [ 1] 2121 	ld (x),a 
      0098EE 93               [ 1] 2122 	incw x 
      0098EF 58 AE            [ 1] 2123 	ld a,yl 
      0098F1 9B               [ 1] 2124 	ld (x),a 
                                   2125 ; record completed in buffer 
                                   2126 ; check if constant already exist 
                                   2127 ; if so update value if different 
      0098F2 0B CD 84 0F      [ 1] 2128 	clr farptr 
      0098F6 81 01            [ 2] 2129 	ldw x,(CNAME,sp)
      0098F7 CD 19 3F         [ 4] 2130 	call search_const 
      0098F7 CD               [ 2] 2131 	tnzw x 
      0098F8 98 B1            [ 1] 2132 	jreq 6$ ; new constant  
      0098FA 54 CF 00 20 A6   [ 2] 2133 	btjf flags,#FUPDATE,8$
      0098FF 84 81            [ 2] 2134 	jra 7$	
      009901                       2135 6$:	
      009901 CD 93 08         [ 2] 2136 	ldw x,free_eeprom  
      0019FA                       2137 7$:	
      009904 A1 85 27         [ 2] 2138 	ldw farptr+1,x 
      009907 0A A1 05         [ 2] 2139 	ldw x,#tib 
      00990A 27 03            [ 1] 2140 	ld a,(RECLEN,sp)
      00990C CC 92 15         [ 4] 2141 	call write_nbytes
                                   2142 ; update free_eeprom 
      00990F 7B 05            [ 1] 2143 	ld a,(RECLEN,sp)
      00990F CD               [ 1] 2144 	ld xl,a 
      009910 96 E1 00 23      [ 2] 2145 	addw x,free_eeprom 
      009912 CF 00 23         [ 2] 2146 	ldw free_eeprom,x
      001A0F                       2147 8$:
      009912 89 CD 93         [ 4] 2148 	call next_token 
      009915 08 A1            [ 1] 2149 	cp a,#TK_COMMA 
      009917 32 27            [ 1] 2150 	jrne 9$
      009919 03 CC 92         [ 2] 2151 	jp 0$ 
      001A19                       2152 9$: 
      001A19                       2153 	_unget_token    
      00991C 15 00 02 00 01   [ 1]    1      mov in,in.saved  
      00991D                       2154 10$: 
      001A1E                       2155 	_drop VSIZE 
      00991D CD 98            [ 2]    1     addw sp,#VSIZE 
      00991F 0E               [ 4] 2156 	ret 
                                   2157 
                                   2158 
                                   2159 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2160 ; return program size 
                                   2161 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A21                       2162 prog_size:
      009920 A1 84 27         [ 2] 2163 	ldw x,txtend 
      009923 03 CC 92 15      [ 2] 2164 	subw x,txtbgn 
      009927 81               [ 4] 2165 	ret 
                                   2166 
                                   2167 ;----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



                                   2168 ; print program information 
                                   2169 ;---------------------------
      001A29                       2170 program_info: 
      009927 90 93 85         [ 2] 2171 	ldw x,#PROG_ADDR 
      00992A FF 81 8F         [ 4] 2172 	call puts 
      00992C CE 00 1A         [ 2] 2173 	ldw x,txtbgn 
      00992C F6 A0 02 88      [ 1] 2174 	mov base,#16 
      009930 4B 00 72         [ 4] 2175 	call print_int
      009933 FB 01 FE 5B      [ 1] 2176 	mov base,#10  
      009937 02 A6 84         [ 2] 2177 	ldw x,#PROG_SIZE
      00993A 81 03 8F         [ 4] 2178 	call puts 
      00993B CD 1A 21         [ 4] 2179 	call prog_size 
      00993B 52 04 5F         [ 4] 2180 	call print_int 
      00993E 1F 01 90         [ 2] 2181 	ldw x,#STR_BYTES 
      009941 AE 40 00         [ 4] 2182 	call puts
      009944 90 C3 00         [ 2] 2183 	ldw x,txtbgn
      009947 24 24 28         [ 2] 2184 	cpw x,#app 
      00994A 90 5C            [ 1] 2185 	jrult 2$
      00994C 93 17 03         [ 2] 2186 	ldw x,#FLASH_MEM 
      00994F CD 84            [ 2] 2187 	jra 3$
      009951 0F 5C 1F         [ 2] 2188 2$: ldw x,#RAM_MEM 	 
      009954 03 A6 3D         [ 4] 2189 3$:	call puts 
      009957 CD 83            [ 1] 2190 	ld a,#CR 
      009959 B2 1E 03         [ 4] 2191 	call putc
      00995C FE               [ 4] 2192 	ret 
                                   2193 
      00995D CD 93 58 A6 0D CD 83  2194 PROG_ADDR: .asciz "program address: "
             B2 1E 01 5C 1F 01 16
             03 72 A9 00
      00996F 02 20 D2 1E 01 CD 93  2195 PROG_SIZE: .asciz ", program size: "
             58 AE 99 80 CD 84 0F
             5B 04 81
      009980 63 6F 6E 73 74 61     2196 STR_BYTES: .asciz "bytes" 
      009986 6E 74 73 20 69 6E 20  2197 FLASH_MEM: .asciz " in FLASH memory" 
             45 45 50 52 4F 4D 0A
             00 79 00
      009995 20 69 6E 20 52 41 4D  2198 RAM_MEM:   .asciz " in RAM memory" 
             20 6D 65 6D 6F 72 79
             00
                                   2199 
                                   2200 
                                   2201 ;----------------------------
                                   2202 ; BASIC: LIST [[start][,end]]
                                   2203 ; list program lines 
                                   2204 ; form start to end 
                                   2205 ; if empty argument list then 
                                   2206 ; list all.
                                   2207 ;----------------------------
                           000001  2208 	FIRST=1
                           000003  2209 	LAST=3 
                           000005  2210 	LN_PTR=5
                           000006  2211 	VSIZE=6 
      001AB1                       2212 list:
      009995 AE 40 00 35 08   [ 2] 2213 	btjf flags,#FRUN,0$
      00999A 00 0F            [ 1] 2214 	ld a,#ERR_CMD_ONLY
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      00999C A3 47 F8         [ 2] 2215 	jp tb_error
      001ABB                       2216 0$:	 
      00999F 24 17 F6         [ 4] 2217 	call next_token 
      0099A2 26 0C            [ 1] 2218 	cp a,#TK_CHAR 
      0099A4 5C 72            [ 1] 2219 	jrne 2$
      0099A6 5A               [ 1] 2220 	ld a,xl 
      0099A7 00 0F            [ 1] 2221 	and a,#0xDF 
      0099A9 26 F6            [ 1] 2222 	cp a,#'C 
      0099AB 1D 00            [ 1] 2223 	jrne 1$
      0099AD 08 20 09         [ 4] 2224 	call list_const
      0099B0 F6               [ 4] 2225 	ret 
      0099B1 5C 4D 26         [ 2] 2226 1$: jp syntax_error 
      001AD0                       2227 2$:	_unget_token 
      0099B4 FB 5A 20 E0 5F   [ 1]    1      mov in,in.saved  
      0099B9 CD 1A 21         [ 4] 2228 	call prog_size 
      0099B9 CF 00            [ 1] 2229 	jrugt 3$
      0099BB 24               [ 4] 2230 	ret 
      001ADB                       2231 3$: _vars VSIZE
      0099BC A6 84            [ 2]    1     sub sp,#VSIZE 
      0099BE 81 00 1A         [ 2] 2232 	ldw x,txtbgn 
      0099BF 1F 05            [ 2] 2233 	ldw (LN_PTR,sp),x 
      0099BF 90               [ 2] 2234 	ldw x,(x) 
      0099C0 89 52            [ 2] 2235 	ldw (FIRST,sp),x ; list from first line 
      0099C2 05 72 5F         [ 2] 2236 	ldw x,#MAX_LINENO ; biggest line number 
      0099C5 00 0E            [ 2] 2237 	ldw (LAST,sp),x 
      0099C7 CD 8E C3         [ 4] 2238 	call arg_list
      0099CA AB               [ 1] 2239 	tnz a
      0099CB 04 6B            [ 1] 2240 	jreq list_loop 
      0099CD 05 1F            [ 1] 2241 	cp a,#2 
      0099CF 01 90            [ 1] 2242 	jreq 4$
      0099D1 AE 40            [ 1] 2243 	cp a,#1 
      0099D3 00 1E            [ 1] 2244 	jreq first_line 
      0099D5 01 17 03         [ 2] 2245 	jp syntax_error 
      0099D8 90               [ 2] 2246 4$:	popw x 
      0099D9 C3 00            [ 2] 2247 	ldw (LAST+2,sp),x 
      001AFE                       2248 first_line:
      0099DB 24               [ 2] 2249 	popw x
      0099DC 24 1A            [ 2] 2250 	ldw (FIRST,sp),x 
      001B01                       2251 lines_skip:
      0099DE 90 F6 11         [ 2] 2252 	ldw x,txtbgn
      0099E1 05 26            [ 2] 2253 2$:	ldw (LN_PTR,sp),x 
      0099E3 07 90 5C         [ 2] 2254 	cpw x,txtend 
      0099E6 CD 8E            [ 1] 2255 	jrpl list_exit 
      0099E8 CE               [ 2] 2256 	ldw x,(x) ;line# 
      0099E9 26 11            [ 2] 2257 	cpw x,(FIRST,sp)
      0099EB 2A 11            [ 1] 2258 	jrpl list_loop 
      0099EB 16 03            [ 2] 2259 	ldw x,(LN_PTR,sp) 
      0099ED 90 F6            [ 1] 2260 	ld a,(2,x)
      0099EF C7 00 0F         [ 1] 2261 	ld acc8,a 
      0099F2 72 B9 00 0E      [ 1] 2262 	clr acc16 
      0099F6 20 DC 00 0D      [ 2] 2263 	addw x,acc16
      0099F8 20 E3            [ 2] 2264 	jra 2$ 
                                   2265 ; print loop
      001B21                       2266 list_loop:
      0099F8 0F 03            [ 2] 2267 	ldw x,(LN_PTR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      0099FA 0F 04            [ 1] 2268 	ld a,(2,x) 
      0099FC CD 1B 98         [ 4] 2269 	call prt_basic_line
      0099FC 1E 03            [ 2] 2270 	ldw x,(LN_PTR,sp)
      0099FE 5B 05            [ 1] 2271 	ld a,(2,x)
      009A00 90 85 81         [ 1] 2272 	ld acc8,a 
      009A03 72 5F 00 0D      [ 1] 2273 	clr acc16 
      009A03 52 05 72 1F      [ 2] 2274 	addw x,acc16
      009A07 00 22 CD         [ 2] 2275 	cpw x,txtend 
      009A0A 93 08            [ 1] 2276 	jrpl list_exit
      009A0C A1 04            [ 2] 2277 	ldw (LN_PTR,sp),x
      009A0E 26               [ 2] 2278 	ldw x,(x)
      009A0F 0E 9F            [ 2] 2279 	cpw x,(LAST,sp)  
      009A11 A4 DF            [ 1] 2280 	jrslt list_loop
      001B43                       2281 list_exit:
      009A13 A1 55 26 0B 72   [ 1] 2282 	mov in,count 
      009A18 1E 00 22         [ 2] 2283 	ldw x,#pad 
      009A1B CF 00 04         [ 2] 2284 	ldw basicptr,x 
      001B4E                       2285 	_drop VSIZE 
      009A1B CD 93            [ 2]    1     addw sp,#VSIZE 
      009A1D 08 1A 29         [ 4] 2286 	call program_info 
      009A1E 81               [ 4] 2287 	ret
                                   2288 
                                   2289 
                                   2290 ;--------------------------
                                   2291 ; BASIC: EDIT \E | \F
                                   2292 ;  copy program in FLASH 
                                   2293 ;  to RAM for edition 
                                   2294 ;-------------------------
      001B54                       2295 edit:
      009A1E A1 03 27         [ 4] 2296 	call qsign 
      009A21 03 07            [ 1] 2297 	jreq 1$ 
      009A22 AE 1B 81         [ 2] 2298 	ldw x,#NOT_SAVED 
      009A22 CC 92 15         [ 4] 2299 	call puts 
      009A25 81               [ 4] 2300 	ret 
      001B60                       2301 1$: 
      009A25 1F 01 1E 01      [ 2] 2302 	ldw y,#app_sign ; source address 
      009A29 CD 8E C3         [ 2] 2303     ldw x,app_size  
      009A2C AB 04 6B         [ 2] 2304 	addw x,#4 
      009A2F 05 16 01         [ 2] 2305 	ldw acc16,x  ; bytes to copy 
      009A32 AE 16 90         [ 2] 2306 	ldw x,#rsign ; destination address 
      009A35 7B 05 F7         [ 4] 2307 	call move  
      009A38 5C CD 8E         [ 2] 2308 	ldw x,#free_ram 
      009A3B DF 1F 03         [ 2] 2309 	ldw txtbgn,x 
      009A3E 7B 05 A0 03      [ 2] 2310 	addw x,rsize  
      009A42 1B 04 6B         [ 2] 2311 	ldw txtend,x 
      009A45 04               [ 4] 2312 	ret 
                                   2313 
      009A46 24 02 0C 03 70 70 6C  2314 NOT_SAVED: .asciz "No application saved.\n"
             69 63 61 74 69 6F 6E
             20 73 61 76 65 64 2E
             0A 00
                                   2315 
                                   2316 ;--------------------------
                                   2317 ; decompile line from token list
                                   2318 ; and print it. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



                                   2319 ; input:
                                   2320 ;   A       stop at this position 
                                   2321 ;   X 		pointer at line
                                   2322 ; output:
                                   2323 ;   none 
                                   2324 ;--------------------------	
      009A4A                       2325 prt_basic_line:
      009A4A A6 32 CD         [ 1] 2326 	ld count,a 
      009A4D 96 A4            [ 1] 2327 	ld a,(2,x)
      009A4F CD 97 C5         [ 1] 2328 	cp a,count 
      009A52 A1 84            [ 1] 2329 	jrpl 1$ 
      009A54 27 03 CC         [ 1] 2330 	ld count,a 
      009A57 92 15 90         [ 2] 2331 1$:	ldw basicptr,x 
      009A5A 93 1E 03 90      [ 2] 2332 	ldw y,#tib  
      009A5E 9E F7 5C         [ 4] 2333 	call decompile 
      009A61 90 9F F7         [ 4] 2334 	call puts 
      009A64 72 5F            [ 1] 2335 	ld a,#CR 
      009A66 00 18 1E         [ 4] 2336 	call putc 
      009A69 01               [ 4] 2337 	ret 
                                   2338 
                                   2339 
                                   2340 
                                   2341 ;---------------------------------
                                   2342 ; BASIC: PRINT|? arg_list 
                                   2343 ; print values from argument list
                                   2344 ;----------------------------------
                           000001  2345 	CCOMMA=1
                           000001  2346 	VSIZE=1
      001BB8                       2347 print:
      001BB8                       2348 	_vars VSIZE 
      009A6A CD 99            [ 2]    1     sub sp,#VSIZE 
      001BBA                       2349 reset_comma:
      009A6C BF 5D            [ 1] 2350 	clr (CCOMMA,sp)
      001BBC                       2351 prt_loop:
      009A6E 27 07 72         [ 4] 2352 	call next_token
      009A71 0F 00            [ 1] 2353 	cp a,#CMD_END 
      009A73 22 1A            [ 1] 2354 	jrult print_exit ; colon or end of line 
      009A75 20 03            [ 1] 2355 	cp a,#TK_QSTR
      009A77 27 12            [ 1] 2356 	jreq 1$
      009A77 CE 00            [ 1] 2357 	cp a,#TK_CHAR 
      009A79 24 13            [ 1] 2358 	jreq 2$ 
      009A7A A1 82            [ 1] 2359 	cp a,#TK_CFUNC 
      009A7A CF 00            [ 1] 2360 	jreq 3$
      009A7C 19 AE            [ 1] 2361 	cp a,#TK_COMMA 
      009A7E 16 90            [ 1] 2362 	jreq 4$
      009A80 7B 05            [ 1] 2363 	cp a,#TK_SHARP 
      009A82 CD 83            [ 1] 2364 	jreq 5$
      009A84 2A 7B            [ 2] 2365 	jra 7$ 
      001BD9                       2366 1$:	; print string 
      009A86 05 97 72         [ 4] 2367 	call puts
      009A89 BB 00            [ 2] 2368 	jra reset_comma
      001BDE                       2369 2$:	; print character 
      009A8B 24               [ 1] 2370 	ld a,xl 
      009A8C CF 00 24         [ 4] 2371 	call putc 
      009A8F 20 D6            [ 2] 2372 	jra reset_comma 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      001BE4                       2373 3$: ; print character function value  	
      009A8F CD               [ 4] 2374 	call (x)
      009A90 93               [ 1] 2375 	ld a,xl 
      009A91 08 A1 08         [ 4] 2376 	call putc
      009A94 26 03            [ 2] 2377 	jra reset_comma 
      001BEB                       2378 4$: ; set comma state 
      009A96 CC 9A            [ 1] 2379 	cpl (CCOMMA,sp)
      009A98 1B CD            [ 2] 2380 	jra prt_loop   
      009A99                       2381 5$: ; # character must be followed by an integer   
      009A99 55 00 03         [ 4] 2382 	call next_token
      009A9C 00 02            [ 1] 2383 	cp a,#TK_INTGR 
      009A9E 27 03            [ 1] 2384 	jreq 6$
      009A9E 5B 05 81         [ 2] 2385 	jp syntax_error 
      009AA1                       2386 6$: ; set tab width
      009AA1 CE               [ 1] 2387 	ld a,xl 
      009AA2 00 1D            [ 1] 2388 	and a,#15 
      009AA4 72 B0 00         [ 1] 2389 	ld tab_width,a 
      009AA7 1B 81            [ 2] 2390 	jra reset_comma 
      009AA9                       2391 7$:	
      001C01                       2392 	_unget_token 
      009AA9 AE 9A E8 CD 84   [ 1]    1      mov in,in.saved  
      009AAE 0F CE 00         [ 4] 2393 	call relation 
      009AB1 1B 35            [ 1] 2394 	cp a,#TK_INTGR 
      009AB3 10 00            [ 1] 2395 	jrne print_exit 
      009AB5 0B CD 93         [ 4] 2396     call print_int 
      009AB8 58 35            [ 2] 2397 	jra reset_comma 
      001C12                       2398 print_exit:
      009ABA 0A 00            [ 1] 2399 	tnz (CCOMMA,sp)
      009ABC 0B AE            [ 1] 2400 	jrne 9$
      009ABE 9A FA            [ 1] 2401 	ld a,#CR 
      009AC0 CD 84 0F         [ 4] 2402     call putc 
      001C1B                       2403 9$:	_drop VSIZE 
      009AC3 CD 9A            [ 2]    1     addw sp,#VSIZE 
      009AC5 A1               [ 4] 2404 	ret 
                                   2405 
                                   2406 ;----------------------
                                   2407 ; 'save_context' and
                                   2408 ; 'rest_context' must be 
                                   2409 ; called at the same 
                                   2410 ; call stack depth 
                                   2411 ; i.e. SP must have the 
                                   2412 ; save value at  
                                   2413 ; entry point of both 
                                   2414 ; routine. 
                                   2415 ;---------------------
                           000004  2416 	CTXT_SIZE=4 ; size of saved data 
                                   2417 ;--------------------
                                   2418 ; save current BASIC
                                   2419 ; interpreter context 
                                   2420 ; on stack 
                                   2421 ;--------------------
      001C1E                       2422 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001C1E                       2423 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      001C1E                       2424 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      001C1E                       2425 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      001C1E                       2426 save_context:
      009AC6 CD 93 58         [ 2] 2427 	ldw x,basicptr 
      009AC9 AE 9B            [ 2] 2428 	ldw (BPTR,sp),x
      009ACB 0B CD 84         [ 1] 2429 	ld a,in 
      009ACE 0F CE            [ 1] 2430 	ld (IN,sp),a
      009AD0 00 1B A3         [ 1] 2431 	ld a,count 
      009AD3 AE 84            [ 1] 2432 	ld (CNT,sp),a  
      009AD5 25               [ 4] 2433 	ret
                                   2434 
                                   2435 ;-----------------------
                                   2436 ; restore previously saved 
                                   2437 ; BASIC interpreter context 
                                   2438 ; from stack 
                                   2439 ;-------------------------
      001C2E                       2440 rest_context:
      009AD6 05 AE            [ 2] 2441 	ldw x,(BPTR,sp)
      009AD8 9B 11 20         [ 2] 2442 	ldw basicptr,x 
      009ADB 03 AE            [ 1] 2443 	ld a,(IN,sp)
      009ADD 9B 22 CD         [ 1] 2444 	ld in,a
      009AE0 84 0F            [ 1] 2445 	ld a,(CNT,sp)
      009AE2 A6 0D CD         [ 1] 2446 	ld count,a  
      009AE5 83               [ 4] 2447 	ret
                                   2448 
                                   2449 
                                   2450 
                                   2451 ;------------------------------------------
                                   2452 ; BASIC: INPUT [string]var[,[string]var]
                                   2453 ; input value in variables 
                                   2454 ; [string] optionally can be used as prompt 
                                   2455 ;-----------------------------------------
                           000001  2456 	CX_BPTR=1
                           000003  2457 	CX_IN=3
                           000004  2458 	CX_CNT=4
                           000005  2459 	SKIP=5
                           000006  2460 	VAR_ADDR=6
                           000007  2461 	VSIZE=7
      001C3E                       2462 input_var:
      001C3E                       2463 	_vars VSIZE 
      009AE6 B2 81            [ 2]    1     sub sp,#VSIZE 
      001C40                       2464 input_loop:
      009AE8 70 72            [ 1] 2465 	clr (SKIP,sp)
      009AEA 6F 67 72         [ 4] 2466 	call next_token 
      009AED 61 6D            [ 1] 2467 	cp a,#TK_QSTR 
      009AEF 20 61            [ 1] 2468 	jrne 1$ 
      009AF1 64 64 72         [ 4] 2469 	call puts 
      009AF4 65 73            [ 1] 2470 	cpl (SKIP,sp)
      009AF6 73 3A 20         [ 4] 2471 	call next_token 
      009AF9 00 2C            [ 1] 2472 1$: cp a,#TK_VAR  
      009AFB 20 70            [ 1] 2473 	jreq 2$ 
      009AFD 72 6F 67         [ 2] 2474 	jp syntax_error
      009B00 72 61            [ 2] 2475 2$:	ldw (VAR_ADDR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      009B02 6D 20            [ 1] 2476 	tnz (SKIP,sp)
      009B04 73 69            [ 1] 2477 	jrne 21$ 
      009B06 7A 65 3A         [ 4] 2478 	call var_name 
      009B09 20 00 62         [ 4] 2479 	call putc   
      001C64                       2480 21$:
      009B0C 79 74            [ 1] 2481 	ld a,#':
      009B0E 65 73 00         [ 4] 2482 	call putc 
      009B11 20 69 6E         [ 4] 2483 	call save_context 
      009B14 20 46 4C 41      [ 1] 2484 	clr count  
      009B18 53 48 20         [ 4] 2485 	call readln 
      009B1B 6D 65 6D         [ 2] 2486 	ldw x,#tib 
      009B1E 6F 72 79         [ 1] 2487 	push count
      009B21 00 20            [ 1] 2488 	push #0 
      009B23 69 6E 20         [ 2] 2489 	addw x,(1,sp)
      009B26 52               [ 1] 2490 	incw x 
      001C7F                       2491 	_drop 2 
      009B27 41 4D            [ 2]    1     addw sp,#2 
      009B29 20 6D 65 6D      [ 1] 2492 	clr in 
      009B2D 6F 72 79         [ 4] 2493 	call get_token
      009B30 00 84            [ 1] 2494 	cp a,#TK_INTGR
      009B31 27 10            [ 1] 2495 	jreq 3$ 
      009B31 72 01            [ 1] 2496 	cp a,#TK_MINUS
      009B33 00 22 05         [ 4] 2497 	call get_token 
      009B36 A6 07            [ 1] 2498 	cp a,#TK_INTGR 
      009B38 CC 92            [ 1] 2499 	jreq 22$
      009B3A 17 1C 2E         [ 4] 2500 	call rest_context 
      009B3B CC 11 95         [ 2] 2501 	jp syntax_error
      001C9B                       2502 22$:
      009B3B CD               [ 2] 2503 	negw x 	
      009B3C 93 08            [ 2] 2504 3$: ldw y,(VAR_ADDR,sp) 
      009B3E A1 04            [ 2] 2505 	ldw (y),x 
      009B40 26 0E 9F         [ 4] 2506 	call rest_context
      009B43 A4 DF A1         [ 4] 2507 	call next_token 
      009B46 43 26            [ 1] 2508 	cp a,#TK_COMMA 
      009B48 04 CD            [ 1] 2509 	jreq input_loop
      009B4A 99 3B            [ 1] 2510 	cp a,#TK_NONE 
      009B4C 81 CC            [ 1] 2511 	jreq input_exit  
      009B4E 92 15            [ 1] 2512 	cp a,#TK_COLON 
      009B50 55 00            [ 1] 2513     jreq input_exit 
      009B52 03 00 02         [ 2] 2514 	jp syntax_error 
      001CB5                       2515 input_exit:
      001CB5                       2516 	_drop VSIZE 
      009B55 CD 9A            [ 2]    1     addw sp,#VSIZE 
      009B57 A1               [ 4] 2517 	ret 
                                   2518 
                                   2519 
                                   2520 ;---------------------
                                   2521 ; BASIC: REMARK | ' 
                                   2522 ; skip comment to end of line 
                                   2523 ;---------------------- 
      001CB8                       2524 remark::
      009B58 22 01 81 52 06   [ 1] 2525 	mov in,count 
      009B5D CE               [ 4] 2526  	ret 
                                   2527 
                                   2528 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



                                   2529 ;---------------------
                                   2530 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2531 ; read in loop 'addr'  
                                   2532 ; apply & 'mask' to value 
                                   2533 ; loop while result==0.  
                                   2534 ; 'xor_mask' is used to 
                                   2535 ; invert the wait logic.
                                   2536 ; i.e. loop while not 0.
                                   2537 ;---------------------
                           000001  2538 	XMASK=1 
                           000002  2539 	MASK=2
                           000003  2540 	ADDR=3
                           000004  2541 	VSIZE=4
      001CBE                       2542 wait: 
      001CBE                       2543 	_vars VSIZE
      009B5E 00 1B            [ 2]    1     sub sp,#VSIZE 
      009B60 1F 05            [ 1] 2544 	clr (XMASK,sp) 
      009B62 FE 1F 01         [ 4] 2545 	call arg_list 
      009B65 AE 7F            [ 1] 2546 	cp a,#2
      009B67 FF 1F            [ 1] 2547 	jruge 0$
      009B69 03 CD 96         [ 2] 2548 	jp syntax_error 
      009B6C B6 4D            [ 1] 2549 0$:	cp a,#3
      009B6E 27 31            [ 1] 2550 	jrult 1$
      009B70 A1               [ 2] 2551 	popw x 
      009B71 02               [ 1] 2552 	ld a,xl
      009B72 27 07            [ 1] 2553 	ld (XMASK,sp),a 
      009B74 A1               [ 2] 2554 1$: popw x ; mask 
      009B75 01               [ 1] 2555 	ld a,xl 
      009B76 27 06            [ 1] 2556 	ld (MASK,sp),a 
      009B78 CC               [ 2] 2557 	popw x ; address 
      009B79 92               [ 1] 2558 2$:	ld a,(x)
      009B7A 15 85            [ 1] 2559 	and a,(MASK,sp)
      009B7C 1F 05            [ 1] 2560 	xor a,(XMASK,sp)
      009B7E 27 F9            [ 1] 2561 	jreq 2$ 
      001CE0                       2562 	_drop VSIZE 
      009B7E 85 1F            [ 2]    1     addw sp,#VSIZE 
      009B80 01               [ 4] 2563 	ret 
                                   2564 
                                   2565 ;---------------------
                                   2566 ; BASIC: BSET addr,mask
                                   2567 ; set bits at 'addr' corresponding 
                                   2568 ; to those of 'mask' that are at 1.
                                   2569 ; arguments:
                                   2570 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2571 ;   mask        mask|addr
                                   2572 ; output:
                                   2573 ;	none 
                                   2574 ;--------------------------
      009B81                       2575 bit_set:
      009B81 CE 00 1B         [ 4] 2576 	call arg_list 
      009B84 1F 05            [ 1] 2577 	cp a,#2	 
      009B86 C3 00            [ 1] 2578 	jreq 1$ 
      009B88 1D 2A 38         [ 2] 2579 	jp syntax_error
      001CED                       2580 1$: 
      009B8B FE               [ 2] 2581 	popw x ; mask 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      009B8C 13               [ 1] 2582 	ld a,xl 
      009B8D 01               [ 2] 2583 	popw x ; addr  
      009B8E 2A               [ 1] 2584 	or a,(x)
      009B8F 11               [ 1] 2585 	ld (x),a
      009B90 1E               [ 4] 2586 	ret 
                                   2587 
                                   2588 ;---------------------
                                   2589 ; BASIC: BRES addr,mask
                                   2590 ; reset bits at 'addr' corresponding 
                                   2591 ; to those of 'mask' that are at 1.
                                   2592 ; arguments:
                                   2593 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2594 ;   mask	    ~mask&*addr  
                                   2595 ; output:
                                   2596 ;	none 
                                   2597 ;--------------------------
      001CF3                       2598 bit_reset:
      009B91 05 E6 02         [ 4] 2599 	call arg_list 
      009B94 C7 00            [ 1] 2600 	cp a,#2  
      009B96 0F 72            [ 1] 2601 	jreq 1$ 
      009B98 5F 00 0E         [ 2] 2602 	jp syntax_error
      001CFD                       2603 1$: 
      009B9B 72               [ 2] 2604 	popw x ; mask 
      009B9C BB               [ 1] 2605 	ld a,xl 
      009B9D 00               [ 1] 2606 	cpl a 
      009B9E 0E               [ 2] 2607 	popw x ; addr  
      009B9F 20               [ 1] 2608 	and a,(x)
      009BA0 E3               [ 1] 2609 	ld (x),a 
      009BA1 81               [ 4] 2610 	ret 
                                   2611 
                                   2612 ;---------------------
                                   2613 ; BASIC: BTOGL addr,mask
                                   2614 ; toggle bits at 'addr' corresponding 
                                   2615 ; to those of 'mask' that are at 1.
                                   2616 ; arguments:
                                   2617 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2618 ;   mask	    mask^*addr  
                                   2619 ; output:
                                   2620 ;	none 
                                   2621 ;--------------------------
      001D04                       2622 bit_toggle:
      009BA1 1E 05 E6         [ 4] 2623 	call arg_list 
      009BA4 02 CD            [ 1] 2624 	cp a,#2 
      009BA6 9C 18            [ 1] 2625 	jreq 1$ 
      009BA8 1E 05 E6         [ 2] 2626 	jp syntax_error
      009BAB 02               [ 2] 2627 1$: popw x ; mask 
      009BAC C7               [ 1] 2628 	ld a,xl 
      009BAD 00               [ 2] 2629 	popw x ; addr  
      009BAE 0F               [ 1] 2630 	xor a,(x)
      009BAF 72               [ 1] 2631 	ld (x),a 
      009BB0 5F               [ 4] 2632 	ret 
                                   2633 
                                   2634 
                                   2635 ;---------------------
                                   2636 ; BASIC: BTEST(addr,bit)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



                                   2637 ; return bit value at 'addr' 
                                   2638 ; bit is in range {0..7}.
                                   2639 ; arguments:
                                   2640 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2641 ;   bit 	    bit position {0..7}  
                                   2642 ; output:
                                   2643 ;	none 
                                   2644 ;--------------------------
      001D14                       2645 bit_test:
      009BB1 00 0E 72         [ 4] 2646 	call func_args 
      009BB4 BB 00            [ 1] 2647 	cp a,#2
      009BB6 0E C3            [ 1] 2648 	jreq 0$
      009BB8 00 1D 2A         [ 2] 2649 	jp syntax_error
      001D1E                       2650 0$:	
      009BBB 07               [ 2] 2651 	popw x 
      009BBC 1F               [ 1] 2652 	ld a,xl 
      009BBD 05 FE            [ 1] 2653 	and a,#7
      009BBF 13               [ 1] 2654 	push a   
      009BC0 03 2F            [ 1] 2655 	ld a,#1 
      009BC2 DE 01            [ 1] 2656 1$: tnz (1,sp)
      009BC3 27 05            [ 1] 2657 	jreq 2$
      009BC3 55               [ 1] 2658 	sll a 
      009BC4 00 04            [ 1] 2659 	dec (1,sp)
      009BC6 00 02            [ 2] 2660 	jra 1$
      001D2E                       2661 2$: _drop 1 
      009BC8 AE 16            [ 2]    1     addw sp,#1 
      009BCA E0               [ 2] 2662 	popw x 
      009BCB CF               [ 1] 2663 	and a,(x)
      009BCC 00 05            [ 1] 2664 	jreq 3$
      009BCE 5B 06            [ 1] 2665 	ld a,#1 
      009BD0 CD               [ 1] 2666 3$:	clrw x 
      009BD1 9A               [ 1] 2667 	ld xl,a 
      009BD2 A9 81            [ 1] 2668 	ld a,#TK_INTGR
      009BD4 81               [ 4] 2669 	ret
                                   2670 
                                   2671 
                                   2672 ;--------------------
                                   2673 ; BASIC: POKE addr,byte
                                   2674 ; put a byte at addr 
                                   2675 ;--------------------
      001D3B                       2676 poke:
      009BD4 CD A2 A7         [ 4] 2677 	call arg_list 
      009BD7 27 07            [ 1] 2678 	cp a,#2
      009BD9 AE 9C            [ 1] 2679 	jreq 1$
      009BDB 01 CD 84         [ 2] 2680 	jp syntax_error
      001D45                       2681 1$:	
      009BDE 0F               [ 2] 2682 	popw x  
      009BDF 81               [ 1] 2683     ld a,xl 
      009BE0 85               [ 2] 2684 	popw x 
      009BE0 90               [ 1] 2685 	ld (x),a 
      009BE1 AE               [ 4] 2686 	ret 
                                   2687 
                                   2688 ;-----------------------
                                   2689 ; BASIC: PEEK(addr)
                                   2690 ; get the byte at addr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



                                   2691 ; input:
                                   2692 ;	none 
                                   2693 ; output:
                                   2694 ;	X 		value 
                                   2695 ;-----------------------
      001D4A                       2696 peek:
      009BE2 AE 80 CE         [ 4] 2697 	call func_args
      009BE5 AE 82            [ 1] 2698 	cp a,#1 
      009BE7 1C 00            [ 1] 2699 	jreq 1$
      009BE9 04 CF 00         [ 2] 2700 	jp syntax_error
      009BEC 0E               [ 2] 2701 1$: popw x 
      009BED AE               [ 1] 2702 	ld a,(x)
      009BEE 00               [ 1] 2703 	clrw x 
      009BEF 7C               [ 1] 2704 	ld xl,a 
      009BF0 CD 8E            [ 1] 2705 	ld a,#TK_INTGR
      009BF2 EF               [ 4] 2706 	ret 
                                   2707 
                                   2708 ;---------------------------
                                   2709 ; BASIC IF expr : instructions
                                   2710 ; evaluate expr and if true 
                                   2711 ; execute instructions on same line. 
                                   2712 ;----------------------------
      001D5B                       2713 if: 
      009BF3 AE 00 80         [ 4] 2714 	call relation 
      009BF6 CF 00            [ 1] 2715 	cp a,#TK_INTGR
      009BF8 1B 72            [ 1] 2716 	jreq 1$ 
      009BFA BB 00 7E         [ 2] 2717 	jp syntax_error
      009BFD CF               [ 1] 2718 1$:	clr a 
      009BFE 00               [ 2] 2719 	tnzw x 
      009BFF 1D 81            [ 1] 2720 	jrne 9$  
                                   2721 ;skip to next line
      009C01 4E 6F 20 61 70   [ 1] 2722 	mov in,count
      009C06 70               [ 4] 2723 9$:	ret 
                                   2724 
                                   2725 ;------------------------
                                   2726 ; BASIC: FOR var=expr 
                                   2727 ; set variable to expression 
                                   2728 ; leave variable address 
                                   2729 ; on stack and set
                                   2730 ; FLOOP bit in 'flags'
                                   2731 ;-----------------
                           000001  2732 	RETL1=1 ; return address  
                           000003  2733 	FSTEP=3  ; variable increment
                           000005  2734 	LIMIT=5 ; loop limit 
                           000007  2735 	CVAR=7   ; control variable 
                           000009  2736 	INW=9   ;  in.w saved
                           00000B  2737 	BPTR=11 ; baseptr saved
                           00000A  2738 	VSIZE=10  
      001D6F                       2739 for: ; { -- var_addr }
      009C07 6C               [ 2] 2740 	popw x ; call return address 
      001D70                       2741 	_vars VSIZE 
      009C08 69 63            [ 2]    1     sub sp,#VSIZE 
      009C0A 61               [ 2] 2742 	pushw x  ; RETL1 
      009C0B 74 69            [ 1] 2743 	ld a,#TK_VAR 
      009C0D 6F 6E 20         [ 4] 2744 	call expect
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      009C10 73 61            [ 2] 2745 	ldw (CVAR,sp),x  ; control variable 
      009C12 76 65 64         [ 4] 2746 	call let_var 
      009C15 2E 0A 00 21      [ 1] 2747 	bset flags,#FLOOP 
                                   2748 ; open space on stack for loop data 
      009C18 5F               [ 1] 2749 	clrw x 
      009C18 C7 00            [ 2] 2750 	ldw (BPTR,sp),x 
      009C1A 04 E6            [ 2] 2751 	ldw (INW,sp),x 
      009C1C 02 C1 00         [ 4] 2752 	call next_token 
      009C1F 04 2A            [ 1] 2753 	cp a,#TK_CMD 
      009C21 03 C7            [ 1] 2754 	jreq 1$
      009C23 00 04 CF         [ 2] 2755 	jp syntax_error
      001D90                       2756 1$:  
      009C26 00 05 90         [ 2] 2757 	cpw x,#to 
      009C29 AE 16            [ 1] 2758 	jreq to
      009C2B 90 CD 8C         [ 2] 2759 	jp syntax_error 
                                   2760 
                                   2761 ;-----------------------------------
                                   2762 ; BASIC: TO expr 
                                   2763 ; second part of FOR loop initilization
                                   2764 ; leave limit on stack and set 
                                   2765 ; FTO bit in 'flags'
                                   2766 ;-----------------------------------
      001D98                       2767 to: ; { var_addr -- var_addr limit step }
      009C2E 52 CD 84 0F A6   [ 2] 2768 	btjt flags,#FLOOP,1$
      009C33 0D CD 83         [ 2] 2769 	jp syntax_error
      009C36 B2 81 8E         [ 4] 2770 1$: call relation  
      009C38 A1 84            [ 1] 2771 	cp a,#TK_INTGR 
      009C38 52 01            [ 1] 2772 	jreq 2$ 
      009C3A CC 11 95         [ 2] 2773 	jp syntax_error
      009C3A 0F 01            [ 2] 2774 2$: ldw (LIMIT,sp),x
                                   2775 ;	ldw x,in.w 
      009C3C CD 12 88         [ 4] 2776 	call next_token
      009C3C CD 93            [ 1] 2777 	cp a,#TK_NONE  
      009C3E 08 A1            [ 1] 2778 	jreq 4$ 
      009C40 02 25            [ 1] 2779 	cp a,#TK_CMD
      009C42 4F A1            [ 1] 2780 	jrne 3$
      009C44 02 27 12         [ 2] 2781 	cpw x,#step 
      009C47 A1 04            [ 1] 2782 	jreq step
      001DBC                       2783 3$:	
      001DBC                       2784 	_unget_token   	 
      009C49 27 13 A1 82 27   [ 1]    1      mov in,in.saved  
      001DC1                       2785 4$:	
      009C4E 15 A1 08         [ 2] 2786 	ldw x,#1   ; default step  
      009C51 27 18            [ 2] 2787 	ldw (FSTEP,sp),x 
      009C53 A1 09            [ 2] 2788 	jra store_loop_addr 
                                   2789 
                                   2790 
                                   2791 ;----------------------------------
                                   2792 ; BASIC: STEP expr 
                                   2793 ; optional third par of FOR loop
                                   2794 ; initialization. 	
                                   2795 ;------------------------------------
      001DC8                       2796 step: ; {var limit -- var limit step}
      009C55 27 18 20 28 03   [ 2] 2797 	btjt flags,#FLOOP,1$
      009C59 CC 11 95         [ 2] 2798 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      009C59 CD 84 0F         [ 4] 2799 1$: call relation
      009C5C 20 DC            [ 1] 2800 	cp a,#TK_INTGR
      009C5E 27 03            [ 1] 2801 	jreq 2$
      009C5E 9F CD 83         [ 2] 2802 	jp syntax_error
      009C61 B2 20            [ 2] 2803 2$:	ldw (FSTEP,sp),x ; step
                                   2804 ; leave loop back entry point on cstack 
                                   2805 ; cstack is 1 call deep from interpreter
      001DDC                       2806 store_loop_addr:
      009C63 D6 00 04         [ 2] 2807 	ldw x,basicptr  
      009C64 1F 0B            [ 2] 2808 	ldw (BPTR,sp),x 
      009C64 FD 9F CD         [ 2] 2809 	ldw x,in.w 
      009C67 83 B2            [ 2] 2810 	ldw (INW,sp),x   
      009C69 20 CF 00 21      [ 1] 2811 	bres flags,#FLOOP 
      009C6B 72 5C 00 1E      [ 1] 2812 	inc loop_depth  
      009C6B 03               [ 4] 2813 	ret 
                                   2814 
                                   2815 ;--------------------------------
                                   2816 ; BASIC: NEXT var 
                                   2817 ; FOR loop control 
                                   2818 ; increment variable with step 
                                   2819 ; and compare with limit 
                                   2820 ; loop if threshold not crossed.
                                   2821 ; else stack. 
                                   2822 ; and decrement 'loop_depth' 
                                   2823 ;--------------------------------
      001DEF                       2824 next: ; {var limit step retl1 -- [var limit step ] }
      009C6C 01 20 CD 1E      [ 1] 2825 	tnz loop_depth 
      009C6F 26 03            [ 1] 2826 	jrne 1$ 
      009C6F CD 93 08         [ 2] 2827 	jp syntax_error 
      001DF8                       2828 1$: 
      009C72 A1 84            [ 1] 2829 	ld a,#TK_VAR 
      009C74 27 03 CC         [ 4] 2830 	call expect
                                   2831 ; check for good variable after NEXT 	 
      009C77 92 15            [ 2] 2832 	cpw x,(CVAR,sp)
      009C79 27 03            [ 1] 2833 	jreq 2$  
      009C79 9F A4 0F         [ 2] 2834 	jp syntax_error ; not the good one 
      001E04                       2835 2$: ; increment variable 
      009C7C C7               [ 2] 2836 	ldw x,(x)  ; get var value 
      009C7D 00 23 20         [ 2] 2837 	addw x,(FSTEP,sp) ; var+step 
      009C80 B9 07            [ 2] 2838 	ldw y,(CVAR,sp)
      009C81 90 FF            [ 2] 2839 	ldw (y),x ; save var new value 
                                   2840 ; check sign of STEP  
      009C81 55 00            [ 1] 2841 	ld a,#0x80
      009C83 03 00            [ 1] 2842 	bcp a,(FSTEP,sp)
      009C85 02 CD            [ 1] 2843 	jrpl 4$
                                   2844 ;negative step 
      009C87 98 0E            [ 2] 2845 	cpw x,(LIMIT,sp)
      009C89 A1 84            [ 1] 2846 	jrslt loop_done
      009C8B 26 05            [ 2] 2847 	jra loop_back 
      001E18                       2848 4$: ; positive step
      009C8D CD 93            [ 2] 2849 	cpw x,(LIMIT,sp)
      009C8F 58 20            [ 1] 2850 	jrsgt loop_done
      001E1C                       2851 loop_back:
      009C91 A8 0B            [ 2] 2852 	ldw x,(BPTR,sp)
      009C92 CF 00 04         [ 2] 2853 	ldw basicptr,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      009C92 0D 01 26 05 A6   [ 2] 2854 	btjf flags,#FRUN,1$ 
      009C97 0D CD            [ 1] 2855 	ld a,(2,x)
      009C99 83 B2 5B         [ 1] 2856 	ld count,a
      009C9C 01 81            [ 2] 2857 1$:	ldw x,(INW,sp)
      009C9E CF 00 00         [ 2] 2858 	ldw in.w,x 
      009C9E CE               [ 4] 2859 	ret 
      001E31                       2860 loop_done:
                                   2861 	; remove loop data from stack  
      009C9F 00               [ 2] 2862 	popw x
      001E32                       2863 	_drop VSIZE 
      009CA0 05 1F            [ 2]    1     addw sp,#VSIZE 
      009CA2 03 C6 00 02      [ 1] 2864 	dec loop_depth 
                                   2865 ;	pushw x 
                                   2866 ;	ret 
      009CA6 6B               [ 2] 2867 	jp (x)
                                   2868 
                                   2869 ;----------------------------
                                   2870 ; called by goto/gosub
                                   2871 ; to get target line number 
                                   2872 ;---------------------------
      001E39                       2873 get_target_line:
      009CA7 05 C6 00         [ 4] 2874 	call next_token  
      009CAA 04 6B            [ 1] 2875 	cp a,#TK_INTGR
      009CAC 06 81            [ 1] 2876 	jreq get_target_line_2 
      009CAE A1 03            [ 1] 2877 	cp a,#TK_LABEL 
      009CAE 1E 03            [ 1] 2878 	jreq look_target_symbol 
      009CB0 CF 00 05         [ 2] 2879 	jp syntax_error
      001E47                       2880 get_target_line_2:
      009CB3 7B               [ 1] 2881 	clr a
      009CB4 05 C7 00 02      [ 2] 2882 	ldw y,basicptr 
      009CB8 7B 06            [ 2] 2883 	ldw y,(y)
      009CBA C7 00            [ 2] 2884 	pushw y 
      009CBC 04 81            [ 2] 2885 	cpw x,(1,sp)
      009CBE 5B 02            [ 2] 2886 	addw sp,#2 
      009CBE 52 07            [ 1] 2887 	jrult 11$
      009CC0 4C               [ 1] 2888 	inc a 
      001E57                       2889 11$:	
      009CC0 0F 05 CD         [ 4] 2890 	call search_lineno  
      009CC3 93               [ 2] 2891 	tnzw x 
      009CC4 08 A1            [ 1] 2892 	jrne 2$ 
      009CC6 02 26            [ 1] 2893 	ld a,#ERR_NO_LINE 
      009CC8 08 CD 84         [ 2] 2894 	jp tb_error 
      009CCB 0F               [ 4] 2895 2$:	ret 
                                   2896 
                                   2897 ; the GOTO|GOSUB target is a symbol.
      001E63                       2898 look_target_symbol:
      009CCC 03               [ 2] 2899 	pushw x 
      009CCD 05 CD 93 08      [ 1] 2900 	clr acc16 
      009CD1 A1 85 27 03      [ 2] 2901 	ldw y,txtbgn 
      009CD5 CC 92 15         [ 1] 2902 1$:	ld a,(3,y) ; first TK_ID on line 
      009CD8 1F 06            [ 1] 2903 	cp a,#TK_LABEL 
      009CDA 0D 05            [ 1] 2904 	jreq 3$ 
      009CDC 26 06 CD         [ 1] 2905 2$:	ld a,(2,y); line length 
      009CDF 8C 29 CD         [ 1] 2906 	ld acc8,a 
      009CE2 83 B2 00 0D      [ 2] 2907 	addw y,acc16 ;point to next line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      009CE4 90 C3 00 1C      [ 2] 2908 	cpw y,txtend 
      009CE4 A6 3A            [ 1] 2909 	jrult 1$
      009CE6 CD 83            [ 1] 2910 	ld a,#ERR_BAD_VALUE
      009CE8 B2 CD 9C         [ 2] 2911 	jp tb_error 
      001E88                       2912 3$: ; found a TK_LABEL 
                                   2913 	; compare with GOTO|GOSUB target 
      009CEB 9E 72            [ 2] 2914 	pushw y 
      009CED 5F 00 04 CD      [ 2] 2915 	addw y,#4 ; label string 
      009CF1 85 14            [ 2] 2916 	ldw x,(3,sp) ; target string 
      009CF3 AE 16 90         [ 4] 2917 	call strcmp
      009CF6 3B 00            [ 1] 2918 	jrne 4$
      009CF8 04 4B            [ 2] 2919 	popw y 
      009CFA 00 72            [ 2] 2920 	jra 2$ 
      001E99                       2921 4$: ; target found 
      009CFC FB               [ 2] 2922 	popw x ;  address line target  
      001E9A                       2923 	_drop 2 ; target string 
      009CFD 01 5C            [ 2]    1     addw sp,#2 
      009CFF 5B               [ 4] 2924 	ret
                                   2925 
                                   2926 
                                   2927 ;--------------------------------
                                   2928 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2929 ; selective goto or gosub 
                                   2930 ;--------------------------------
                           000003  2931 	RET_ADDR=3
                           000005  2932 	RET_INW=5
                           000004  2933 	VSIZE=4  
      001E9D                       2934 cmd_on:
      009D00 02 72 5F 00 02   [ 2] 2935 	btjt flags,#FRUN,0$ 
      009D05 CD 89            [ 1] 2936 	ld a,#ERR_RUN_ONLY
      009D07 78 A1 84         [ 2] 2937 	jp tb_error 
      009D0A 27 10 A1         [ 4] 2938 0$:	call expression 
      009D0D 11 CD            [ 1] 2939 	cp a,#TK_INTGR
      009D0F 89 78            [ 1] 2940 	jreq 1$
      009D11 A1 84 27         [ 2] 2941 	jp syntax_error
      009D14 06 CD 9C         [ 2] 2942 1$: cpw x,#1 
      009D17 AE CC            [ 1] 2943 	jrslt 9$
      009D19 92 15 10         [ 2] 2944 	cpw x,#16 ; no more than 16 arguments 
      009D1B 22 64            [ 1] 2945 	jrugt 9$
      009D1B 50               [ 1] 2946 	ld a,xl 
      009D1C 16               [ 1] 2947 	push a  ; selector  
      009D1D 06 90 FF         [ 4] 2948 	call next_token ; should be GOTO|GOSUB 
      009D20 CD 9C            [ 1] 2949 	cp a,#TK_CMD 
      009D22 AE CD            [ 1] 2950 	jreq 2$ 
      009D24 93 08 A1         [ 2] 2951 	jp syntax_error 
      009D27 08 27 96         [ 2] 2952 2$: cpw x,#goto 
      009D2A A1 00            [ 1] 2953 	jreq 4$
      009D2C 27 07 A1         [ 2] 2954 	cpw x,#gosub 
      009D2F 0A 27            [ 1] 2955 	jreq 4$ 
      009D31 03 CC 92         [ 2] 2956 	jp syntax_error 
      009D34 15               [ 1] 2957 4$: pop a 
      009D35 89               [ 2] 2958 	pushw x ; save routine address 	
      009D35 5B               [ 1] 2959 	push a  ; -- code_addr selector  
      009D36 07 81 88         [ 4] 2960 5$: call next_token 
      009D38 A1 84            [ 1] 2961 	cp a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      009D38 55 00            [ 1] 2962 	jreq 52$
      009D3A 04 00 02         [ 2] 2963 	jp syntax_error 
      001EE1                       2964 52$: ; got a line number 
      009D3D 81 01            [ 1] 2965 	dec (1,sp) ; decrement selector 
      009D3E 27 0B            [ 1] 2966 	jreq 58$ ; this is the selected one 
      009D3E 52 04 0F         [ 4] 2967 	call next_token ; try for the next one 
      009D41 01 CD            [ 1] 2968 	cp a,#TK_COMMA 
      009D43 96 B6            [ 1] 2969 	jreq 5$ 
                                   2970 ; arg list exhausted, selector to big 
                                   2971 ; continue execution on next line 
      001EEC                       2972 	_drop 3 ; drop selector and GOTO|GOSUB address 
      009D45 A1 02            [ 2]    1     addw sp,#3 
      009D47 24 03            [ 2] 2973 	jra 9$
      001EF0                       2974 58$: ;found line# in list 
      001EF0                       2975 	_drop 1 ; discard selector 
      009D49 CC 92            [ 2]    1     addw sp,#1 
      009D4B 15 A1 03 25 04   [ 1] 2976 	mov in,count ; skip to end of this line. 
                                   2977 ; here only the routine address of GOTO|GOSUB is on stack 
                                   2978 ;   X contain target line number 
      009D50 85 9F 6B         [ 4] 2979 8$:	call get_target_line_2
      009D53 01 85            [ 2] 2980 	popw y ; routine address GOTO|GOSUB  
      009D55 9F 6B 02 85      [ 2] 2981 	cpw y,#goto 
      009D59 F6 14            [ 1] 2982 	jreq jp_to_target 
      009D5B 02 18            [ 2] 2983 	popw y 
      001F04                       2984 	_vars VSIZE 
      009D5D 01 27            [ 2]    1     sub sp,#VSIZE 
      009D5F F9 5B            [ 2] 2985 	pushw y 
      009D61 04 81 00 04      [ 2] 2986 	ldw y,basicptr 
      009D63 55 00 03 00 01   [ 1] 2987 	mov in,count 
      009D63 CD 96 B6 A1      [ 2] 2988 	addw y,in.w 
      009D67 02 27            [ 2] 2989 	ldw (RET_ADDR,sp),y 
      009D69 03 CC 92 15      [ 2] 2990 	ldw y,#3 
      009D6D 17 05            [ 2] 2991 	ldw (RET_INW,sp),y
      009D6D 85 9F            [ 2] 2992 	jra jp_to_target
      001F1F                       2993 9$: ; expr out of range skip to next line 
      009D6F 85 FA F7 81 01   [ 1] 2994 	mov in,count
      009D73 4F               [ 1] 2995 	clr a  
      009D73 CD               [ 4] 2996 	ret 
                                   2997 
                                   2998 ;------------------------
                                   2999 ; BASIC: GOTO line# 
                                   3000 ; jump to line# 
                                   3001 ; here cstack is 2 call deep from interpreter 
                                   3002 ;------------------------
      001F26                       3003 goto:
      009D74 96 B6 A1 02 27   [ 2] 3004 	btjt flags,#FRUN,0$ 
      009D79 03 CC            [ 1] 3005 	ld a,#ERR_RUN_ONLY
      009D7B 92 15 97         [ 2] 3006 	jp tb_error 
      009D7D CD 1E 39         [ 4] 3007 0$:	call get_target_line
      001F33                       3008 jp_to_target:
      009D7D 85 9F 43         [ 2] 3009 	ldw basicptr,x 
      009D80 85 F4            [ 1] 3010 	ld a,(2,x)
      009D82 F7 81 03         [ 1] 3011 	ld count,a 
      009D84 35 03 00 01      [ 1] 3012 	mov in,#3 
      009D84 CD               [ 4] 3013 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



                                   3014 
                                   3015 
                                   3016 ;--------------------
                                   3017 ; BASIC: GOSUB line#
                                   3018 ; basic subroutine call
                                   3019 ; actual line# and basicptr 
                                   3020 ; are saved on cstack
                                   3021 ; here cstack is 2 call deep from interpreter 
                                   3022 ;--------------------
                           000003  3023 	RET_ADDR=3
                           000005  3024 	RET_INW=5
                           000004  3025 	VSIZE=4  
      001F40                       3026 gosub:
      009D85 96 B6 A1 02 27   [ 2] 3027 	btjt flags,#FRUN,0$ 
      009D8A 03 CC            [ 1] 3028 	ld a,#ERR_RUN_ONLY
      009D8C 92 15 85         [ 2] 3029 	jp tb_error 
      009D8F 9F               [ 4] 3030 	ret 
      009D90 85               [ 2] 3031 0$:	popw x 
      001F4C                       3032 	_vars VSIZE  
      009D91 F8 F7            [ 2]    1     sub sp,#VSIZE 
      009D93 81               [ 2] 3033 	pushw x 
      009D94 CE 00 04         [ 2] 3034 	ldw x,basicptr
      009D94 CD 96            [ 2] 3035 	ldw (RET_ADDR,sp),x 
      009D96 B1 A1 02         [ 4] 3036 	call get_target_line  
      009D99 27               [ 2] 3037 	pushw x 
      009D9A 03 CC 92         [ 2] 3038 	ldw x,in.w 
      009D9D 15 07            [ 2] 3039 	ldw (RET_INW+2,sp),x
      009D9E 85               [ 2] 3040 	popw x 
      009D9E 85 9F            [ 2] 3041 	jra jp_to_target
                                   3042 
                                   3043 ;------------------------
                                   3044 ; BASIC: RETURN 
                                   3045 ; exit from a subroutine 
                                   3046 ; 
                                   3047 ;------------------------
      001F60                       3048 return:
      009DA0 A4 07 88 A6 01   [ 2] 3049 	btjt flags,#FRUN,0$ 
      009DA5 0D 01            [ 1] 3050 	ld a,#ERR_RUN_ONLY
      009DA7 27 05 48         [ 2] 3051 	jp tb_error 
      001F6A                       3052 0$:	
      009DAA 0A 01            [ 2] 3053 	ldw x,(RET_ADDR,sp) 
      009DAC 20 F7 5B         [ 2] 3054 	ldw basicptr,x
      009DAF 01 85            [ 1] 3055 	ld a,(2,x)
      009DB1 F4 27 02         [ 1] 3056 	ld count,a  
      009DB4 A6 01            [ 2] 3057 	ldw x,(RET_INW,sp)
      009DB6 5F 97 A6         [ 2] 3058 	ldw in.w,x 
      009DB9 84               [ 2] 3059 	popw x 
      001F7A                       3060 	_drop VSIZE 
      009DBA 81 04            [ 2]    1     addw sp,#VSIZE 
      009DBB 89               [ 2] 3061 	pushw x
      009DBB CD               [ 4] 3062 	ret  
                                   3063 
                                   3064 
                                   3065 ;----------------------------------
                                   3066 ; BASIC: RUN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



                                   3067 ; run BASIC program in RAM
                                   3068 ;----------------------------------- 
      001F7E                       3069 run: 
      009DBC 96 B6 A1 02 27   [ 2] 3070 	btjf flags,#FRUN,0$  
      009DC1 03               [ 1] 3071 	clr a 
      009DC2 CC               [ 4] 3072 	ret
      001F85                       3073 0$: 
      009DC3 92 15 00 21 12   [ 2] 3074 	btjf flags,#FBREAK,1$
      009DC5                       3075 	_drop 2 
      009DC5 85 9F            [ 2]    1     addw sp,#2 
      009DC7 85 F7 81         [ 4] 3076 	call rest_context
      009DCA                       3077 	_drop CTXT_SIZE 
      009DCA CD 96            [ 2]    1     addw sp,#CTXT_SIZE 
      009DCC B1 A1 01 27      [ 1] 3078 	bres flags,#FBREAK 
      009DD0 03 CC 92 15      [ 1] 3079 	bset flags,#FRUN 
      009DD4 85 F6 5F         [ 2] 3080 	jp interpreter 
      009DD7 97 A6 84         [ 2] 3081 1$:	ldw x,txtbgn
      009DDA 81 00 1C         [ 2] 3082 	cpw x,txtend 
      009DDB 2B 0C            [ 1] 3083 	jrmi run_it 
      009DDB CD 98 0E         [ 2] 3084 	ldw x,#err_no_prog
      009DDE A1 84 27         [ 4] 3085 	call puts 
      009DE1 03 CC 92 15 4F   [ 1] 3086 	mov in,count
      009DE6 5D               [ 4] 3087 	ret 
      001FB0                       3088 run_it:	 
      001FB0                       3089 	_drop 2 ; drop return address 
      009DE7 26 05            [ 2]    1     addw sp,#2 
      001FB2                       3090 run_it_02: 
      009DE9 55 00 04         [ 4] 3091     call ubound 
      009DEC 00 02 81         [ 4] 3092 	call clear_vars 
                                   3093 ; clear data pointer 
      009DEF 5F               [ 1] 3094 	clrw x 
      009DEF 85 52 0A         [ 2] 3095 	ldw data_ptr,x 
      009DF2 89 A6 85 CD      [ 1] 3096 	clr data_ofs 
      009DF6 96 A4 1F 07      [ 1] 3097 	clr data_len 
                                   3098 ; initialize BASIC pointer 
      009DFA CD 99 12         [ 2] 3099 	ldw x,txtbgn 
      009DFD 72 14 00         [ 2] 3100 	ldw basicptr,x 
      009E00 22 5F            [ 1] 3101 	ld a,(2,x)
      009E02 1F 0B 1F         [ 1] 3102 	ld count,a
      009E05 09 CD 93 08      [ 1] 3103 	mov in,#3	
      009E09 A1 80 27 03      [ 1] 3104 	bset flags,#FRUN 
      009E0D CC 92 15         [ 2] 3105 	jp interpreter 
                                   3106 
                                   3107 
                                   3108 ;----------------------
                                   3109 ; BASIC: END
                                   3110 ; end running program
                                   3111 ;---------------------- 
      009E10                       3112 cmd_end: 
                                   3113 ; clean stack 
      009E10 A3 9E 18         [ 2] 3114 	ldw x,#STACK_EMPTY
      009E13 27               [ 1] 3115 	ldw sp,x 
      009E14 03 CC 92         [ 2] 3116 	jp warm_start
                                   3117 
                                   3118 ;---------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



                                   3119 ; BASIC: GET var 
                                   3120 ; receive a key in variable 
                                   3121 ; don't wait 
                                   3122 ;---------------------------
      001FE1                       3123 cmd_get:
      009E17 15 12 88         [ 4] 3124 	call next_token 
      009E18 A1 85            [ 1] 3125 	cp a,#TK_VAR 
      009E18 72 04            [ 1] 3126 	jreq 0$
      009E1A 00 22 03         [ 2] 3127 	jp syntax_error 
      009E1D CC 92 15         [ 2] 3128 0$: ldw ptr16,x 
      009E20 CD 98 0E         [ 4] 3129 	call qgetc 
      009E23 A1 84            [ 1] 3130 	jreq 2$
      009E25 27 03 CC         [ 4] 3131 	call getc  
      009E28 92 15 1F 05      [ 4] 3132 2$: clr [ptr16]
      009E2C CD 93 08 A1      [ 1] 3133 	inc ptr8 
      009E30 00 27 0E A1      [ 4] 3134 	ld [ptr16],a 
      009E34 80               [ 4] 3135 	ret 
                                   3136 
                                   3137 
                                   3138 ;-----------------
                                   3139 ; 1 Khz beep 
                                   3140 ;-----------------
      002003                       3141 beep_1khz:: 
      009E35 26 05 A3         [ 2] 3142 	ldw x,#100
      009E38 9E 48 27 0C      [ 2] 3143 	ldw y,#1000
      009E3C 20 0D            [ 2] 3144 	jra beep
                                   3145 
                                   3146 ;-----------------------
                                   3147 ; BASIC: TONE expr1,expr2
                                   3148 ; used TIMER2 channel 1
                                   3149 ; to produce a tone 
                                   3150 ; arguments:
                                   3151 ;    expr1   frequency 
                                   3152 ;    expr2   duration msec.
                                   3153 ;---------------------------
      00200C                       3154 tone:
      009E3C 55 00 03         [ 4] 3155 	call arg_list 
      009E3F 00 02            [ 1] 3156 	cp a,#2 
      009E41 27 03            [ 1] 3157 	jreq 1$
      009E41 AE 00 01         [ 2] 3158 	jp syntax_error 
      002016                       3159 1$: 
      009E44 1F               [ 2] 3160 	popw x ; duration
      009E45 03 20            [ 2] 3161 	popw y ; frequency 
      002019                       3162 beep:  
      009E47 14               [ 2] 3163 	pushw x 
      009E48 AE F4 24         [ 2] 3164 	ldw x,#TIM2_CLK_FREQ
      009E48 72               [ 2] 3165 	divw x,y 
                                   3166 ; round to nearest integer 
      009E49 04 00 22 03      [ 2] 3167 	cpw y,#TIM2_CLK_FREQ/2
      009E4D CC 92            [ 1] 3168 	jrmi 2$
      009E4F 15               [ 1] 3169 	incw x 
      002025                       3170 2$:	 
      009E50 CD               [ 1] 3171 	ld a,xh 
      009E51 98 0E A1         [ 1] 3172 	ld TIM2_ARRH,a 
      009E54 84               [ 1] 3173 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      009E55 27 03 CC         [ 1] 3174 	ld TIM2_ARRL,a 
                                   3175 ; 50% duty cycle 
      009E58 92               [ 1] 3176 	ccf 
      009E59 15               [ 2] 3177 	rrcw x 
      009E5A 1F               [ 1] 3178 	ld a,xh 
      009E5B 03 53 0F         [ 1] 3179 	ld TIM2_CCR1H,a 
      009E5C 9F               [ 1] 3180 	ld a,xl
      009E5C CE 00 05         [ 1] 3181 	ld TIM2_CCR1L,a
      009E5F 1F 0B CE 00      [ 1] 3182 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      009E63 01 1F 09 72      [ 1] 3183 	bset TIM2_CR1,#TIM2_CR1_CEN
      009E67 15 00 22 72      [ 1] 3184 	bset TIM2_EGR,#TIM2_EGR_UG
      009E6B 5C               [ 2] 3185 	popw x 
      009E6C 00 1F 81         [ 4] 3186 	call pause02
      009E6F 72 11 53 08      [ 1] 3187 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      009E6F 72 5D 00 1F      [ 1] 3188 	bres TIM2_CR1,#TIM2_CR1_CEN 
      009E73 26               [ 4] 3189 	ret 
                                   3190 
                                   3191 ;-------------------------------
                                   3192 ; BASIC: ADCON 0|1 [,divisor]  
                                   3193 ; disable/enanble ADC 
                                   3194 ;-------------------------------
                           000003  3195 	ONOFF=3 
                           000001  3196 	DIVSOR=1
                           000004  3197 	VSIZE=4 
      002050                       3198 power_adc:
      009E74 03 CC 92         [ 4] 3199 	call arg_list 
      009E77 15 02            [ 1] 3200 	cp a,#2	
      009E78 27 0B            [ 1] 3201 	jreq 1$
      009E78 A6 85            [ 1] 3202 	cp a,#1 
      009E7A CD 96            [ 1] 3203 	jreq 0$ 
      009E7C A4 13 07         [ 2] 3204 	jp syntax_error 
      009E7F 27 03 CC         [ 2] 3205 0$: ldw x,#0
      009E82 92               [ 2] 3206 	pushw x  ; divisor 
      009E83 15 03            [ 2] 3207 1$: ldw x,(ONOFF,sp)
      009E84 5D               [ 2] 3208 	tnzw x 
      009E84 FE 72            [ 1] 3209 	jreq 2$ 
      009E86 FB 03            [ 2] 3210 	ldw x,(DIVSOR,sp) ; divisor 
      009E88 16               [ 1] 3211 	ld a,xl
      009E89 07 90            [ 1] 3212 	and a,#7
      009E8B FF               [ 1] 3213 	swap a 
      009E8C A6 80 15         [ 1] 3214 	ld ADC_CR1,a
      009E8F 03 2A 06 13      [ 1] 3215 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      009E93 05 2F 1B 20      [ 1] 3216 	bset ADC_CR1,#ADC_CR1_ADON 
      002078                       3217 	_usec_dly 7 
      009E97 04 00 1B         [ 2]    1     ldw x,#(16*7-2)/4
      009E98 5A               [ 2]    2     decw x
      009E98 13               [ 1]    3     nop 
      009E99 05 2C            [ 1]    4     jrne .-4
      009E9B 15 08            [ 2] 3218 	jra 3$
      009E9C 72 11 54 01      [ 1] 3219 2$: bres ADC_CR1,#ADC_CR1_ADON
      009E9C 1E 0B CF 00      [ 1] 3220 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      002089                       3221 3$:	_drop VSIZE 
      009EA0 05 72            [ 2]    1     addw sp,#VSIZE 
      009EA2 01               [ 4] 3222 	ret
                                   3223 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



                                   3224 ;-----------------------------
                                   3225 ; BASIC: ADCREAD (channel)
                                   3226 ; read adc channel {0..5}
                                   3227 ; output:
                                   3228 ;   A 		TK_INTGR 
                                   3229 ;   X 		value 
                                   3230 ;-----------------------------
      00208C                       3231 analog_read:
      009EA3 00 22 05         [ 4] 3232 	call func_args 
      009EA6 E6 02            [ 1] 3233 	cp a,#1 
      009EA8 C7 00            [ 1] 3234 	jreq 1$
      009EAA 04 1E 09         [ 2] 3235 	jp syntax_error
      009EAD CF               [ 2] 3236 1$: popw x 
      009EAE 00 01 81         [ 2] 3237 	cpw x,#5 
      009EB1 23 05            [ 2] 3238 	jrule 2$
      009EB1 85 5B            [ 1] 3239 	ld a,#ERR_BAD_VALUE
      009EB3 0A 72 5A         [ 2] 3240 	jp tb_error 
      009EB6 00               [ 1] 3241 2$: ld a,xl
      009EB7 1F FC 0E         [ 1] 3242 	ld acc8,a 
      009EB9 A6 05            [ 1] 3243 	ld a,#5
      009EB9 CD 93 08         [ 1] 3244 	sub a,acc8 
      009EBC A1 84 27         [ 1] 3245 	ld ADC_CSR,a
      009EBF 07 A1 03 27      [ 1] 3246 	bset ADC_CR2,#ADC_CR2_ALIGN
      009EC3 1F CC 92 15      [ 1] 3247 	bset ADC_CR1,#ADC_CR1_ADON
      009EC7 72 0F 54 00 FB   [ 2] 3248 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009EC7 4F 90 CE         [ 2] 3249 	ldw x,ADC_DRH
      009ECA 00 05            [ 1] 3250 	ld a,#TK_INTGR
      009ECC 90               [ 4] 3251 	ret 
                                   3252 
                                   3253 ;-----------------------
                                   3254 ; BASIC: DREAD(pin)
                                   3255 ; Arduino pins 
                                   3256 ; read state of a digital pin 
                                   3257 ; pin# {0..15}
                                   3258 ; output:
                                   3259 ;    A 		TK_INTGR
                                   3260 ;    X      0|1 
                                   3261 ;-------------------------
                           000001  3262 	PINNO=1
                           000001  3263 	VSIZE=1
      0020C0                       3264 digital_read:
      0020C0                       3265 	_vars VSIZE 
      009ECD FE 90            [ 2]    1     sub sp,#VSIZE 
      009ECF 89 13 01         [ 4] 3266 	call func_args
      009ED2 5B 02            [ 1] 3267 	cp a,#1
      009ED4 25 01            [ 1] 3268 	jreq 1$
      009ED6 4C 11 95         [ 2] 3269 	jp syntax_error
      009ED7 85               [ 2] 3270 1$: popw x 
      009ED7 CD 86 F7         [ 2] 3271 	cpw x,#15 
      009EDA 5D 26            [ 2] 3272 	jrule 2$
      009EDC 05 A6            [ 1] 3273 	ld a,#ERR_BAD_VALUE
      009EDE 05 CC 92         [ 2] 3274 	jp tb_error 
      009EE1 17 81 7F         [ 4] 3275 2$:	call select_pin 
      009EE3 6B 01            [ 1] 3276 	ld (PINNO,sp),a
      009EE3 89 72            [ 1] 3277 	ld a,(GPIO_IDR,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      009EE5 5F 00            [ 1] 3278 	tnz (PINNO,sp)
      009EE7 0E 90            [ 1] 3279 	jreq 8$
      009EE9 CE               [ 1] 3280 3$: srl a 
      009EEA 00 1B            [ 1] 3281 	dec (PINNO,sp)
      009EEC 90 E6            [ 1] 3282 	jrne 3$ 
      009EEE 03 A1            [ 1] 3283 8$: and a,#1 
      009EF0 03               [ 1] 3284 	clrw x 
      009EF1 27               [ 1] 3285 	ld xl,a 
      009EF2 15 90            [ 1] 3286 	ld a,#TK_INTGR
      0020ED                       3287 	_drop VSIZE
      009EF4 E6 02            [ 2]    1     addw sp,#VSIZE 
      009EF6 C7               [ 4] 3288 	ret
                                   3289 
                                   3290 
                                   3291 ;-----------------------
                                   3292 ; BASIC: DWRITE pin,0|1
                                   3293 ; Arduino pins 
                                   3294 ; write to a digital pin 
                                   3295 ; pin# {0..15}
                                   3296 ; output:
                                   3297 ;    A 		TK_INTGR
                                   3298 ;    X      0|1 
                                   3299 ;-------------------------
                           000001  3300 	PINNO=1
                           000002  3301 	PINVAL=2
                           000002  3302 	VSIZE=2
      0020F0                       3303 digital_write:
      0020F0                       3304 	_vars VSIZE 
      009EF7 00 0F            [ 2]    1     sub sp,#VSIZE 
      009EF9 72 B9 00         [ 4] 3305 	call arg_list  
      009EFC 0E 90            [ 1] 3306 	cp a,#2 
      009EFE C3 00            [ 1] 3307 	jreq 1$
      009F00 1D 25 E9         [ 2] 3308 	jp syntax_error
      009F03 A6               [ 2] 3309 1$: popw x 
      009F04 0A               [ 1] 3310 	ld a,xl 
      009F05 CC 92            [ 1] 3311 	ld (PINVAL,sp),a
      009F07 17               [ 2] 3312 	popw x 
      009F08 A3 00 0F         [ 2] 3313 	cpw x,#15 
      009F08 90 89            [ 2] 3314 	jrule 2$
      009F0A 72 A9            [ 1] 3315 	ld a,#ERR_BAD_VALUE
      009F0C 00 04 1E         [ 2] 3316 	jp tb_error 
      009F0F 03 CD 8E         [ 4] 3317 2$:	call select_pin 
      009F12 CE 26            [ 1] 3318 	ld (PINNO,sp),a 
      009F14 04 90            [ 1] 3319 	ld a,#1
      009F16 85 20            [ 1] 3320 	tnz (PINNO,sp)
      009F18 DA 05            [ 1] 3321 	jreq 4$
      009F19 48               [ 1] 3322 3$: sll a
      009F19 85 5B            [ 1] 3323 	dec (PINNO,sp)
      009F1B 02 81            [ 1] 3324 	jrne 3$
      009F1D 0D 02            [ 1] 3325 4$: tnz (PINVAL,sp)
      009F1D 72 00            [ 1] 3326 	jrne 5$
      009F1F 00               [ 1] 3327 	cpl a 
      009F20 22 05            [ 1] 3328 	and a,(GPIO_ODR,x)
      009F22 A6 06            [ 2] 3329 	jra 8$
      009F24 CC 92            [ 1] 3330 5$: or a,(GPIO_ODR,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      009F26 17 CD            [ 1] 3331 8$: ld (GPIO_ODR,x),a 
      002128                       3332 	_drop VSIZE 
      009F28 97 C5            [ 2]    1     addw sp,#VSIZE 
      009F2A A1               [ 4] 3333 	ret
                                   3334 
                                   3335 
                                   3336 ;-----------------------
                                   3337 ; BASIC: STOP
                                   3338 ; stop progam execution  
                                   3339 ; without resetting pointers 
                                   3340 ; the program is resumed
                                   3341 ; with RUN 
                                   3342 ;-------------------------
      00212B                       3343 stop:
      009F2B 84 27 03 CC 92   [ 2] 3344 	btjt flags,#FRUN,2$
      009F30 15               [ 1] 3345 	clr a
      009F31 A3               [ 4] 3346 	ret 
      002132                       3347 2$:	 
                                   3348 ; create space on cstack to save context 
      009F32 00 01 2F         [ 2] 3349 	ldw x,#break_point 
      009F35 69 A3 00         [ 4] 3350 	call puts 
      002138                       3351 	_drop 2 ;drop return address 
      009F38 10 22            [ 2]    1     addw sp,#2 
      00213A                       3352 	_vars CTXT_SIZE ; context size 
      009F3A 64 9F            [ 2]    1     sub sp,#CTXT_SIZE 
      009F3C 88 CD 93         [ 4] 3353 	call save_context 
      009F3F 08 A1 80         [ 2] 3354 	ldw x,#tib 
      009F42 27 03 CC         [ 2] 3355 	ldw basicptr,x
      009F45 92               [ 1] 3356 	clr (x)
      009F46 15 A3 9F A6      [ 1] 3357 	clr count  
      009F4A 27               [ 1] 3358 	clrw x 
      009F4B 08 A3 9F         [ 2] 3359 	ldw in.w,x
      009F4E C0 27 03 CC      [ 1] 3360 	bres flags,#FRUN 
      009F52 92 15 84 89      [ 1] 3361 	bset flags,#FBREAK
      009F56 88 CD 93         [ 2] 3362 	jp interpreter 
      009F59 08 A1 84 27 03 CC 92  3363 break_point: .asciz "\nbreak point, RUN to resume.\n"
             15 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   3364 
                                   3365 ;-----------------------
                                   3366 ; BASIC: NEW
                                   3367 ; from command line only 
                                   3368 ; free program memory
                                   3369 ; and clear variables 
                                   3370 ;------------------------
      009F61                       3371 new: 
      009F61 0A 01 27 0B CD   [ 2] 3372 	btjf flags,#FRUN,0$ 
      009F66 93               [ 4] 3373 	ret 
      00217D                       3374 0$:	
      009F67 08 A1 08         [ 4] 3375 	call clear_basic 
      009F6A 27               [ 4] 3376 	ret 
                                   3377 
                                   3378 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



                                   3379 ;;;  flash memory operations
                                   3380 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3381 
                                   3382 ;--------------------------
                                   3383 ; align farptr to BLOCK_SIZE 
                                   3384 ;---------------------------
      002181                       3385 row_align:
      009F6B EB 5B            [ 1] 3386 	ld a,#0x7f 
      009F6D 03 20 2F         [ 1] 3387 	and a,farptr+2 
      009F70 27 13            [ 1] 3388 	jreq 1$ 
      009F70 5B 01 55         [ 2] 3389 	ldw x,farptr+1 
      009F73 00 04 00         [ 2] 3390 	addw x,#BLOCK_SIZE 
      009F76 02 CD            [ 1] 3391 	jrnc 0$
      009F78 9E C7 90 85      [ 1] 3392 	inc farptr 
      009F7C 90               [ 1] 3393 0$: ld a,xl 
      009F7D A3 9F            [ 1] 3394 	and a,#0x80
      009F7F A6               [ 1] 3395 	ld xl,a
      009F80 27 31 90         [ 2] 3396 	ldw farptr+1,x  	
      009F83 85               [ 4] 3397 1$:	ret
                                   3398 
                                   3399 ;--------------------
                                   3400 ; input:
                                   3401 ;   X     increment 
                                   3402 ; output:
                                   3403 ;   farptr  incremented 
                                   3404 ;---------------------
      00219C                       3405 incr_farptr:
      009F84 52 04 90 89      [ 2] 3406 	addw x,farptr+1 
      009F88 90 CE            [ 1] 3407 	jrnc 1$
      009F8A 00 05 55 00      [ 1] 3408 	inc farptr 
      009F8E 04 00 02         [ 2] 3409 1$:	ldw farptr+1,x  
      009F91 72               [ 4] 3410 	ret 
                                   3411 
                                   3412 ;-----------------------------------
                                   3413 ; scan block for non zero byte 
                                   3414 ; block are 128 bytes 
                                   3415 ; input:
                                   3416 ;    farptr     address block  
                                   3417 ; output:
                                   3418 ;     A     0 cleared, other not cleared  
                                   3419 ;-----------------------------------
      0021AA                       3420 scan_block:
      009F92 B9               [ 1] 3421 	clrw x 
      009F93 00 01 17 03      [ 5] 3422 1$: ldf a,([farptr],x) 
      009F97 90 AE            [ 1] 3423 	jrne 2$
      009F99 00               [ 1] 3424 	incw x 
      009F9A 03 17 05         [ 2] 3425 	cpw x,#BLOCK_SIZE 
      009F9D 20 14            [ 1] 3426 	jrult 1$ 
      009F9F 81               [ 4] 3427 2$:	ret 
                                   3428 
                                   3429 
                                   3430 
                                   3431 ;-----------------------------------
                                   3432 ; BASIC: ERASE \E | \F 
                                   3433 ; erase all block in range from 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



                                   3434 ;  'app_space' to FLASH end (0x20000)
                                   3435 ;  or all EEPROM 
                                   3436 ; that contains a non zero byte.  
                                   3437 ;-----------------------------------
                           000001  3438 	LIMIT=1 
                           000003  3439 	VSIZE = 3 
      0021B8                       3440 erase:
      009F9F 55 00 04 00      [ 1] 3441 	clr farptr 
      0021BC                       3442 	_vars VSIZE 
      009FA3 02 4F            [ 2]    1     sub sp,#VSIZE 
      009FA5 81 12 88         [ 4] 3443 	call next_token 
      009FA6 A1 04            [ 1] 3444 	cp a,#TK_CHAR 
      009FA6 72 00            [ 1] 3445 	jreq 0$ 
      009FA8 00 22 05         [ 2] 3446 	jp syntax_error
      009FAB A6               [ 1] 3447 0$: ld a,xl 
      009FAC 06 CC            [ 1] 3448 	and a,#0XDF 
      009FAE 92 17            [ 1] 3449 	cp a,#'E
      009FB0 CD 9E            [ 1] 3450 	jrne 1$
      009FB2 B9 40 00         [ 2] 3451 	ldw x,#EEPROM_BASE 
      009FB3 CF 00 18         [ 2] 3452 	ldw farptr+1,x 
      009FB3 CF 00 05         [ 2] 3453 	ldw x,#EEPROM_END
      009FB6 E6               [ 1] 3454 	clr a 
      009FB7 02 C7            [ 2] 3455 	jra 3$ 
      009FB9 00 04            [ 1] 3456 1$: cp a,#'F 
      009FBB 35 03            [ 1] 3457 	jreq 2$
      009FBD 00 02 81         [ 2] 3458 	ldw x,#err_bad_value
      009FC0 CC 11 97         [ 2] 3459 	jp tb_error
      0021E5                       3460 2$:
      009FC0 72 00 00         [ 2] 3461 	ldw x,#app_sign 
      009FC3 22 06 A6         [ 2] 3462 	ldw farptr+1,x 
      009FC6 06 CC            [ 1] 3463 	ld a,#(FLASH_END>>16)&0XFF 
      009FC8 92 17 81         [ 2] 3464 	ldw x,#FLASH_END&0xffff
      0021F0                       3465 3$:
      009FCB 85 52            [ 1] 3466 	ld (LIMIT,sp),a 
      009FCD 04 89            [ 2] 3467 	ldw (LIMIT+1,sp),x 
                                   3468  ; operation done from RAM
                                   3469  ; copy code to RAM in tib   
      009FCF CE 00 05         [ 4] 3470 	call move_erase_to_ram
      0021F7                       3471 4$:	 
      009FD2 1F 03 CD         [ 4] 3472     call scan_block 
      009FD5 9E B9            [ 1] 3473 	jreq 5$  ; block already erased 
      009FD7 89 CE            [ 1] 3474     ld a,#'E 
      009FD9 00 01 1F         [ 4] 3475     call putc 
      009FDC 07 85 20         [ 4] 3476 	call block_erase   
                                   3477 ; this block is clean, next  
      009FDF D3 00 80         [ 2] 3478 5$:	ldw x,#BLOCK_SIZE
      009FE0 CD 21 9C         [ 4] 3479 	call incr_farptr
                                   3480 ; check limit, 24 bit substraction  	
      009FE0 72 00            [ 1] 3481 	ld a,(LIMIT,sp)
      009FE2 00 22            [ 2] 3482 	ldw x,(LIMIT+1,sp)
      009FE4 05 A6 06 CC      [ 2] 3483 	subw x,farptr+1
      009FE8 92 17 17         [ 1] 3484 	sbc a,farptr 
      009FEA 22 E0            [ 1] 3485 	jrugt 4$ 
      009FEA 1E 03 CF         [ 4] 3486 9$: call clear_basic
      009FED 00 05            [ 2] 3487 	ldw x,(LIMIT+1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      009FEF E6 02 C7         [ 2] 3488 	cpw x,#EEPROM_END
      009FF2 00 04            [ 1] 3489 	jrne 10$
      009FF4 1E 05 CF         [ 4] 3490 	call func_eefree 
      002224                       3491 10$:
      002224                       3492 	_drop VSIZE 
      009FF7 00 01            [ 2]    1     addw sp,#VSIZE 
      009FF9 85               [ 4] 3493 	ret 
                                   3494 	
                                   3495 
                                   3496 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3497 ;  check for application signature 
                                   3498 ; output:
                                   3499 ;   Carry    0 app present 
                                   3500 ;            1 no app installed  
                                   3501 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002227                       3502 qsign: 
      009FFA 5B 04 89         [ 2] 3503 	ldw x,app_sign 
      009FFD 81 22 E7         [ 2] 3504 	cpw x,SIGNATURE ; "BC" 
      009FFE 81               [ 4] 3505 	ret 
                                   3506 
                                   3507 ;--------------------------------------
                                   3508 ;  fill write buffer 
                                   3509 ;  input:
                                   3510 ;    y  point to output buffer 
                                   3511 ;    x  point to source 
                                   3512 ;    a  bytes to write in buffer 
                                   3513 ;  output:
                                   3514 ;    y   += A 
                                   3515 ;    X   += A 
                                   3516 ;    A   0 
                                   3517 ;---------------------------------------
      00222E                       3518 fill_write_buffer:
      009FFE 72               [ 1] 3519 	push a 
      009FFF 01               [ 1] 3520 	tnz a 
      00A000 00 22            [ 1] 3521 	jreq 9$ 
      00A002 02               [ 1] 3522 1$: ld a,(x)
      00A003 4F               [ 1] 3523 	incw x 
      00A004 81 F7            [ 1] 3524 	ld (y),a 
      00A005 90 5C            [ 1] 3525 	incw y 
      00A005 72 09            [ 1] 3526 	dec (1,sp) 
      00A007 00 22            [ 1] 3527 	jrne 1$ 
      00A009 12               [ 1] 3528 9$:	pop a 
      00A00A 5B               [ 4] 3529     ret 	
                                   3530 
                                   3531 ;--------------------------------------
                                   3532 ;  fill pad buffer with zero 
                                   3533 ;  input:
                                   3534 ;	none 
                                   3535 ;  output:
                                   3536 ;    y     buffer address  
                                   3537 ;--------------------------------------
      00223E                       3538 clear_block_buffer:
      00A00B 02               [ 1] 3539 	push a 
      00A00C CD 9C AE 5B      [ 2] 3540 	ldw y,#block_buffer 
      00A010 04 72            [ 2] 3541 	pushw y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      00A012 19 00            [ 1] 3542 	ld a,#BLOCK_SIZE   
      00A014 22 72            [ 1] 3543 1$:	clr (y)
      00A016 10 00            [ 1] 3544 	incw y
      00A018 22               [ 1] 3545 	dec a  
      00A019 CC 92            [ 1] 3546 	jrne 1$ 	
      00A01B B8 CE            [ 2] 3547 9$: popw y 
      00A01D 00               [ 1] 3548 	pop a 			
      00A01E 1B               [ 4] 3549 	ret 
                                   3550 
                                   3551 
                                   3552 ;---------------------------------------
                                   3553 ; BASIC: SAVE
                                   3554 ; write application from RAM to FLASH
                                   3555 ;--------------------------------------
                           000001  3556 	XTEMP=1
                           000003  3557 	COUNT=3  ; last count bytes written 
                           000004  3558 	CNT_LO=4 ; count low byte 
                           000005  3559 	TOWRITE=5 ; how bytes left to write  
                           000006  3560 	VSIZE=6 
      002252                       3561 save_app:
      00A01F C3               [ 2] 3562 	pushw x 
      00A020 00 1D            [ 2] 3563 	pushw y 
      002255                       3564 	_vars VSIZE
      00A022 2B 0C            [ 2]    1     sub sp,#VSIZE 
      00A024 AE 91 AE         [ 4] 3565 	call qsign 
      00A027 CD 84            [ 1] 3566 	jrne 1$
      00A029 0F 55 00         [ 2] 3567 	ldw x,#CANT_DO 
      00A02C 04 00 02         [ 4] 3568 	call puts 
      00A02F 81 22 E1         [ 2] 3569 	jp 9$
      00A030                       3570 1$: 
      00A030 5B 02 1A         [ 2] 3571 	ldw x,txtbgn
      00A032 C3 00 1C         [ 2] 3572 	cpw x,txtend 
      00A032 CD 98            [ 1] 3573 	jrult 2$ 
      00A034 F7 CD 8F         [ 2] 3574 	ldw x,#NO_APP
      00A037 33 5F CF         [ 4] 3575 	call puts 
      00A03A 00 07 72         [ 2] 3576 	jp 9$
      002276                       3577 2$: 
                                   3578 ; block programming flash
                                   3579 ; must be done from RAM
                                   3580 ; moved in tib  
      00A03D 5F 00 09         [ 4] 3581 	call move_prg_to_ram
                                   3582 ; initialize farptr 
                                   3583 ; to app_sign address 
      00A040 72 5F 00 0A      [ 1] 3584 	clr farptr 
      00A044 CE 00 1B         [ 2] 3585 	ldw x,#app_sign 
      00A047 CF 00 05         [ 2] 3586 	ldw farptr+1,x
                                   3587 ; initialize local variables 
      00A04A E6 02 C7         [ 4] 3588 	call prog_size
      00A04D 00 04            [ 2] 3589 	ldw (TOWRITE,sp),x
      00A04F 35 03            [ 1] 3590 	clr (COUNT,sp)
                                   3591 ; first bock 
                                   3592 ; containt signature 2 bytes 
                                   3593 ; and size 	2 bytes 
                                   3594 ; use Y as pointer to block_buffer
      00A051 00 02 72         [ 4] 3595 	call clear_block_buffer ; -- y=*block_buffer	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



                                   3596 ; write signature
      00A054 10 00 22         [ 2] 3597 	ldw x,SIGNATURE ; "BC" 
      00A057 CC 92            [ 2] 3598 	ldw (y),x 
      00A059 B8 A9 00 02      [ 2] 3599 	addw y,#2
      00A05A 1E 05            [ 2] 3600 	ldw x,(TOWRITE,sp)
      00A05A AE 17            [ 2] 3601 	ldw (y),x
      00A05C FF 94 CC 92      [ 2] 3602 	addw y,#2   
      00A060 99 7C            [ 1] 3603 	ld a,#(BLOCK_SIZE-4)
      00A061 6B 04            [ 1] 3604 	ld (CNT_LO,sp),a 
      00A061 CD 93 08         [ 2] 3605 	cpw x,#(BLOCK_SIZE-4) 
      00A064 A1 85            [ 1] 3606 	jrugt 3$
      00A066 27               [ 1] 3607 	ld a,xl 
      00A067 03 CC            [ 1] 3608 3$:	ld (CNT_LO,sp),a   
      00A069 92 15 CF         [ 2] 3609 	ldw x,txtbgn 
      00A06C 00 19            [ 2] 3610 	ldw (XTEMP,sp),x 
      0022AF                       3611 32$: 
      00A06E CD 83            [ 2] 3612 	ldw x,(XTEMP,sp)
      00A070 BB 27            [ 1] 3613 	ld a,(CNT_LO,sp)
      00A072 03 CD 83         [ 4] 3614 	call fill_write_buffer 
      00A075 C2 72            [ 2] 3615 	ldw (XTEMP,sp),x 
      00A077 3F 00 19         [ 2] 3616 	ldw x,#block_buffer
      00A07A 72 5C 00         [ 4] 3617 	call write_buffer
      00A07D 1A 72 C7         [ 2] 3618 	ldw x,#BLOCK_SIZE 
      00A080 00 19 81         [ 4] 3619 	call incr_farptr  
                                   3620 ; following blocks 
      00A083 1E 01            [ 2] 3621 	ldw x,(XTEMP,sp)
      00A083 AE 00 64         [ 2] 3622 	cpw x,txtend 
      00A086 90 AE            [ 1] 3623 	jruge 9$ 
      00A088 03 E8            [ 2] 3624 	ldw x,(TOWRITE,sp)
      00A08A 20 0D 03         [ 2] 3625 	subw x,(COUNT,sp)
      00A08C 1F 05            [ 2] 3626 	ldw (TOWRITE,sp),x 
      00A08C CD 96            [ 1] 3627 	ld a,#BLOCK_SIZE 
      00A08E B6 A1 02         [ 2] 3628 	cpw x,#BLOCK_SIZE 
      00A091 27 03            [ 1] 3629 	jruge 4$ 
      00A093 CC               [ 1] 3630 	ld a,xl 
      00A094 92 15            [ 1] 3631 4$:	ld (CNT_LO,sp),a 
      00A096 CD 22 3E         [ 4] 3632 	call clear_block_buffer 
      00A096 85 90            [ 2] 3633 	jra 32$ 
      0022E1                       3634 9$:	_drop VSIZE 
      00A098 85 06            [ 2]    1     addw sp,#VSIZE 
      00A099 90 85            [ 2] 3635     popw y 
      00A099 89               [ 2] 3636 	popw x 
      00A09A AE               [ 4] 3637 	ret 
                                   3638 
                                   3639 
      00A09B F4 24                 3640 SIGNATURE: .ascii "BC"
      00A09D 65 90 A3 7A 12 2B 01  3641 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE \F before"
             5C 61 73 68 20 61 70
             70 6C 69 63 61 74 69
             6F 6E 2C 20 61 6C 72
             65 61 64 79 20 6F 6E
             65 20 69 6E 20 46 4C
             41 53 48 0A 75 73 65
             20 45 52 41 53 45 20
             5C 46 20 62 65 66 6F
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



             72 65 00
      00A0A5 4E 6F 20 61 70 70 6C  3642 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
             20 69 6E 20 52 41 4D
             00
                                   3643 
                                   3644 ;---------------------
                                   3645 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3646 ; write 1 or more byte to FLASH or EEPROM
                                   3647 ; starting at address  
                                   3648 ; input:
                                   3649 ;   expr1  	is address 
                                   3650 ;   expr2,...,exprn   are bytes to write
                                   3651 ; output:
                                   3652 ;   none 
                                   3653 ;---------------------
                           000001  3654 	ADDR=1
                           000002  3655 	VSIZ=2 
      002341                       3656 write:
      002341                       3657 	_vars VSIZE 
      00A0A5 9E C7            [ 2]    1     sub sp,#VSIZE 
      00A0A7 53 0D 9F C7      [ 1] 3658 	clr farptr ; expect 16 bits address 
      00A0AB 53 0E 8C         [ 4] 3659 	call expression
      00A0AE 56 9E            [ 1] 3660 	cp a,#TK_INTGR 
      00A0B0 C7 53            [ 1] 3661 	jreq 0$
      00A0B2 0F 9F C7         [ 2] 3662 	jp syntax_error
      00A0B5 53 10            [ 2] 3663 0$: ldw (ADDR,sp),x 
      00A0B7 72 10 53         [ 4] 3664 	call next_token 
      00A0BA 08 72            [ 1] 3665 	cp a,#TK_COMMA 
      00A0BC 10 53            [ 1] 3666 	jreq 1$ 
      00A0BE 00 72            [ 2] 3667 	jra 9$ 
      00A0C0 10 53 04         [ 4] 3668 1$:	call expression
      00A0C3 85 CD            [ 1] 3669 	cp a,#TK_INTGR
      00A0C5 A4 C1            [ 1] 3670 	jreq 2$
      00A0C7 72 11 53         [ 2] 3671 	jp syntax_error
      00A0CA 08               [ 1] 3672 2$:	ld a,xl 
      00A0CB 72 11            [ 2] 3673 	ldw x,(ADDR,sp) 
      00A0CD 53 00 81         [ 2] 3674 	ldw farptr+1,x 
      00A0D0 5F               [ 1] 3675 	clrw x 
      00A0D0 CD 96 B6         [ 4] 3676 	call write_byte
      00A0D3 A1 02            [ 2] 3677 	ldw x,(ADDR,sp)
      00A0D5 27               [ 1] 3678 	incw x 
      00A0D6 0B A1            [ 2] 3679 	jra 0$ 
      002375                       3680 9$:
      002375                       3681 	_drop VSIZE
      00A0D8 01 27            [ 2]    1     addw sp,#VSIZE 
      00A0DA 03               [ 4] 3682 	ret 
                                   3683 
                                   3684 
                                   3685 ;---------------------
                                   3686 ;BASIC: CHAR(expr)
                                   3687 ; évaluate expression 
                                   3688 ; and take the 7 least 
                                   3689 ; bits as ASCII character
                                   3690 ; return a TK_CHAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



                                   3691 ;---------------------
      002378                       3692 char:
      00A0DB CC 92 15         [ 4] 3693 	call func_args 
      00A0DE AE 00            [ 1] 3694 	cp a,#1
      00A0E0 00 89            [ 1] 3695 	jreq 1$
      00A0E2 1E 03 5D         [ 2] 3696 	jp syntax_error
      00A0E5 27               [ 2] 3697 1$:	popw x 
      00A0E6 1A               [ 1] 3698 	ld a,xl 
      00A0E7 1E 01            [ 1] 3699 	and a,#0x7f 
      00A0E9 9F               [ 1] 3700 	ld xl,a
      00A0EA A4 07            [ 1] 3701 	ld a,#TK_CHAR
      00A0EC 4E               [ 4] 3702 	ret
                                   3703 
                                   3704 ;---------------------
                                   3705 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3706 ; extract first character 
                                   3707 ; of string argument 
                                   3708 ; return it as TK_INTGR 
                                   3709 ;---------------------
      00238A                       3710 ascii:
      00A0ED C7 54            [ 1] 3711 	ld a,#TK_LPAREN
      00A0EF 01 72 16         [ 4] 3712 	call expect 
      00A0F2 50 CA 72         [ 4] 3713 	call next_token 
      00A0F5 10 54            [ 1] 3714 	cp a,#TK_QSTR 
      00A0F7 01 AE            [ 1] 3715 	jreq 1$
      00A0F9 00 1B            [ 1] 3716 	cp a,#TK_CHAR 
      00A0FB 5A 9D            [ 1] 3717 	jreq 2$ 
      00A0FD 26 FA            [ 1] 3718 	cp a,#TK_CFUNC 
      00A0FF 20 08            [ 1] 3719 	jreq 0$
      00A101 72 11 54         [ 2] 3720 	jp syntax_error
      00A104 01               [ 4] 3721 0$: call (x)
      00A105 72 17            [ 2] 3722 	jra 2$
      0023A4                       3723 1$: 
      00A107 50               [ 1] 3724 	ld a,(x) 
      00A108 CA               [ 1] 3725 	clrw x
      00A109 5B               [ 1] 3726 	ld xl,a 
      0023A7                       3727 2$: 
      00A10A 04               [ 2] 3728 	pushw x 
      00A10B 81 07            [ 1] 3729 	ld a,#TK_RPAREN 
      00A10C CD 16 24         [ 4] 3730 	call expect
      00A10C CD               [ 2] 3731 	popw x 
      00A10D 96 B1            [ 1] 3732 	ld a,#TK_INTGR 
      00A10F A1               [ 4] 3733 	ret 
                                   3734 
                                   3735 ;---------------------
                                   3736 ;BASIC: KEY
                                   3737 ; wait for a character 
                                   3738 ; received from STDIN 
                                   3739 ; input:
                                   3740 ;	none 
                                   3741 ; output:
                                   3742 ;	X 		ASCII character 
                                   3743 ;---------------------
      0023B1                       3744 key:
      00A110 01 27 03         [ 4] 3745 	call getc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      00A113 CC               [ 1] 3746 	clrw x 
      00A114 92               [ 1] 3747 	ld xl,a 
      00A115 15 85            [ 1] 3748 	ld a,#TK_INTGR
      00A117 A3               [ 4] 3749 	ret
                                   3750 
                                   3751 ;----------------------
                                   3752 ; BASIC: QKEY
                                   3753 ; Return true if there 
                                   3754 ; is a character in 
                                   3755 ; waiting in STDIN 
                                   3756 ; input:
                                   3757 ;  none 
                                   3758 ; output:
                                   3759 ;   X 		0|-1 
                                   3760 ;-----------------------
      0023B9                       3761 qkey:: 
      00A118 00               [ 1] 3762 	clrw x 
      00A119 05 23 05         [ 1] 3763 	ld a,rx1_head
      00A11C A6 0A CC         [ 1] 3764 	cp a,rx1_tail 
      00A11F 92 17            [ 1] 3765 	jreq 9$ 
      00A121 9F               [ 2] 3766 	cplw x 
      00A122 C7 00            [ 1] 3767 9$: ld a,#TK_INTGR
      00A124 0F               [ 4] 3768 	ret 
                                   3769 
                                   3770 ;---------------------
                                   3771 ; BASIC: GPIO(expr,reg)
                                   3772 ; return gpio address 
                                   3773 ; expr {0..8}
                                   3774 ; input:
                                   3775 ;   none 
                                   3776 ; output:
                                   3777 ;   X 		gpio register address
                                   3778 ;----------------------------
                           000003  3779 	PORT=3
                           000001  3780 	REG=1 
                           000004  3781 	VSIZE=4 
      0023C6                       3782 gpio:
      00A125 A6 05 C0         [ 4] 3783 	call func_args 
      00A128 00 0F            [ 1] 3784 	cp a,#2
      00A12A C7 54            [ 1] 3785 	jreq 1$
      00A12C 00 72 16         [ 2] 3786 	jp syntax_error  
      0023D0                       3787 1$:	
      00A12F 54 02            [ 2] 3788 	ldw x,(PORT,sp)
      00A131 72 10            [ 1] 3789 	jrmi bad_port
      00A133 54 01 72         [ 2] 3790 	cpw x,#9
      00A136 0F 54            [ 1] 3791 	jrpl bad_port
      00A138 00 FB            [ 1] 3792 	ld a,#5
      00A13A CE               [ 4] 3793 	mul x,a
      00A13B 54 04 A6         [ 2] 3794 	addw x,#GPIO_BASE 
      00A13E 84 81            [ 2] 3795 	ldw (PORT,sp),x  
      00A140 1E 01            [ 2] 3796 	ldw x,(REG,sp) 
      00A140 52 01 CD         [ 2] 3797 	addw x,(PORT,sp)
      00A143 96 B1            [ 1] 3798 	ld a,#TK_INTGR
      0023E8                       3799 	_drop VSIZE 
      00A145 A1 01            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      00A147 27               [ 4] 3800 	ret
      0023EB                       3801 bad_port:
      00A148 03 CC            [ 1] 3802 	ld a,#ERR_BAD_VALUE
      00A14A 92 15 85         [ 2] 3803 	jp tb_error
                                   3804 
                                   3805 
                                   3806 ;-------------------------
                                   3807 ; BASIC: UFLASH 
                                   3808 ; return free flash address
                                   3809 ; input:
                                   3810 ;  none 
                                   3811 ; output:
                                   3812 ;	A		TK_INTGR
                                   3813 ;   X 		free address 
                                   3814 ;---------------------------
      0023F0                       3815 uflash:
      00A14D A3 00 0F         [ 2] 3816 	ldw x,app_sign
      00A150 23 05 A6         [ 2] 3817 	cpw x,#4243 ; signature "BC" 
      00A153 0A CC            [ 1] 3818 	jreq 1$
      00A155 92 17 CD         [ 2] 3819 	ldw x,app_size 
      00A158 A5 FF 6B         [ 2] 3820 	addw x,#app
      00A15B 01 E6            [ 2] 3821 	jra 2$
      00A15D 01 0D 01         [ 2] 3822 1$:	ldw x,#app_space 
      00A160 27 05            [ 1] 3823 2$:	ld a,#TK_INTGR 
      00A162 44               [ 4] 3824 	ret 
                                   3825 
                                   3826 
                                   3827 ;---------------------
                                   3828 ; BASIC: USR(addr[,arg])
                                   3829 ; execute a function written 
                                   3830 ; in binary code.
                                   3831 ; binary fonction should 
                                   3832 ; return token attribute in A 
                                   3833 ; and value in X. 
                                   3834 ; input:
                                   3835 ;   addr	routine address 
                                   3836 ;   arg 	is an optional argument 
                                   3837 ; output:
                                   3838 ;   A 		token attribute 
                                   3839 ;   X       returned value 
                                   3840 ;---------------------
      002406                       3841 usr:
      00A163 0A 01            [ 2] 3842 	pushw y 	
      00A165 26 FB A4         [ 4] 3843 	call func_args 
      00A168 01 5F            [ 1] 3844 	cp a,#1 
      00A16A 97 A6            [ 1] 3845 	jreq 2$
      00A16C 84 5B            [ 1] 3846 	cp a,#2
      00A16E 01 81            [ 1] 3847 	jreq 2$  
      00A170 CC 11 95         [ 2] 3848 	jp syntax_error 
      00A170 52 02            [ 2] 3849 2$: popw y  ; arg|addr 
      00A172 CD 96            [ 1] 3850 	cp a,#1
      00A174 B6 A1            [ 1] 3851 	jreq 3$
      00A176 02               [ 2] 3852 	popw x ; addr
      00A177 27               [ 1] 3853 	exgw x,y 
      00A178 03 CC            [ 4] 3854 3$: call (y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      00A17A 92 15            [ 2] 3855 	popw y 
      00A17C 85               [ 4] 3856 	ret 
                                   3857 
                                   3858 ;------------------------------
                                   3859 ; BASIC: BYE 
                                   3860 ; halt mcu in its lowest power mode 
                                   3861 ; wait for reset or external interrupt
                                   3862 ; do a cold start on wakeup.
                                   3863 ;------------------------------
      002423                       3864 bye:
      00A17D 9F 6B 02 85 A3   [ 2] 3865 	btjf UART1_SR,#UART_SR_TC,.
      00A182 00               [10] 3866 	halt
      00A183 0F 23 05         [ 2] 3867 	jp cold_start  
                                   3868 
                                   3869 ;----------------------------------
                                   3870 ; BASIC: SLEEP 
                                   3871 ; halt mcu until reset or external
                                   3872 ; interrupt.
                                   3873 ; Resume progam after SLEEP command
                                   3874 ;----------------------------------
      00242C                       3875 sleep:
      00A186 A6 0A CC 92 17   [ 2] 3876 	btjf UART1_SR,#UART_SR_TC,.
      00A18B CD A5 FF 6B      [ 1] 3877 	bset flags,#FSLEEP
      00A18F 01               [10] 3878 	halt 
      00A190 A6               [ 4] 3879 	ret 
                                   3880 
                                   3881 ;-------------------------------
                                   3882 ; BASIC: PAUSE expr 
                                   3883 ; suspend execution for n msec.
                                   3884 ; input:
                                   3885 ;	none
                                   3886 ; output:
                                   3887 ;	none 
                                   3888 ;------------------------------
      002437                       3889 pause:
      00A191 01 0D 01         [ 4] 3890 	call expression
      00A194 27 05            [ 1] 3891 	cp a,#TK_INTGR
      00A196 48 0A            [ 1] 3892 	jreq pause02 
      00A198 01 26 FB         [ 2] 3893 	jp syntax_error
      002441                       3894 pause02: 
      00A19B 0D               [ 2] 3895 1$: tnzw x 
      00A19C 02 26            [ 1] 3896 	jreq 2$
      00A19E 05               [10] 3897 	wfi 
      00A19F 43               [ 2] 3898 	decw x 
      00A1A0 E4 00            [ 1] 3899 	jrne 1$
      00A1A2 20               [ 1] 3900 2$:	clr a 
      00A1A3 02               [ 4] 3901 	ret 
                                   3902 
                                   3903 ;------------------------------
                                   3904 ; BASIC: AWU expr
                                   3905 ; halt mcu for 'expr' milliseconds
                                   3906 ; use Auto wakeup peripheral
                                   3907 ; all oscillators stopped except LSI
                                   3908 ; range: 1ms - 511ms
                                   3909 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



                                   3910 ;  none
                                   3911 ; output:
                                   3912 ;  none:
                                   3913 ;------------------------------
      00244A                       3914 awu:
      00A1A4 EA 00 E7         [ 4] 3915   call expression
      00A1A7 00 5B            [ 1] 3916   cp a,#TK_INTGR
      00A1A9 02 81            [ 1] 3917   jreq awu02
      00A1AB CC 11 95         [ 2] 3918   jp syntax_error
      002454                       3919 awu02:
      00A1AB 72 00 00         [ 2] 3920   cpw x,#5120
      00A1AE 22 02            [ 1] 3921   jrmi 1$ 
      00A1B0 4F 81 50 F2      [ 1] 3922   mov AWU_TBR,#15 
      00A1B2 A6 1E            [ 1] 3923   ld a,#30
      00A1B2 AE               [ 2] 3924   div x,a
      00A1B3 A1 D9            [ 1] 3925   ld a,#16
      00A1B5 CD               [ 2] 3926   div x,a 
      00A1B6 84 0F            [ 2] 3927   jra 4$
      002465                       3928 1$: 
      00A1B8 5B 02 52         [ 2] 3929   cpw x,#2048
      00A1BB 04 CD            [ 1] 3930   jrmi 2$ 
      00A1BD 9C 9E AE 16      [ 1] 3931   mov AWU_TBR,#14
      00A1C1 90 CF            [ 1] 3932   ld a,#80
      00A1C3 00               [ 2] 3933   div x,a 
      00A1C4 05 7F            [ 2] 3934   jra 4$   
      002473                       3935 2$:
      00A1C6 72 5F 00 04      [ 1] 3936   mov AWU_TBR,#7
      002477                       3937 3$:  
                                   3938 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A1CA 5F CF 00         [ 2] 3939   cpw x,#64 
      00A1CD 01 72            [ 2] 3940   jrule 4$ 
      00A1CF 11 00 22 72      [ 1] 3941   inc AWU_TBR 
      00A1D3 18               [ 2] 3942   srlw x 
      00A1D4 00 22            [ 2] 3943   jra 3$ 
      002483                       3944 4$:
      00A1D6 CC               [ 1] 3945   ld a, xl
      00A1D7 92               [ 1] 3946   dec a 
      00A1D8 B8 0A            [ 1] 3947   jreq 5$
      00A1DA 62               [ 1] 3948   dec a 	
      002488                       3949 5$: 
      00A1DB 72 65            [ 1] 3950   and a,#0x3e 
      00A1DD 61 6B 20         [ 1] 3951   ld AWU_APR,a 
      00A1E0 70 6F 69 6E      [ 1] 3952   bset AWU_CSR,#AWU_CSR_AWUEN
      00A1E4 74               [10] 3953   halt 
                                   3954 
      00A1E5 2C               [ 4] 3955   ret 
                                   3956 
                                   3957 ;------------------------------
                                   3958 ; BASIC: TICKS
                                   3959 ; return msec ticks counter value 
                                   3960 ; input:
                                   3961 ; 	none 
                                   3962 ; output:
                                   3963 ;	X 		TK_INTGR
                                   3964 ;-------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      002493                       3965 get_ticks:
      00A1E6 20 52 55         [ 2] 3966 	ldw x,ticks 
      00A1E9 4E 20            [ 1] 3967 	ld a,#TK_INTGR
      00A1EB 74               [ 4] 3968 	ret 
                                   3969 
                                   3970 
                                   3971 
                                   3972 ;------------------------------
                                   3973 ; BASIC: ABS(expr)
                                   3974 ; return absolute value of expr.
                                   3975 ; input:
                                   3976 ;   none
                                   3977 ; output:
                                   3978 ;   X     	positive integer
                                   3979 ;-------------------------------
      002499                       3980 abs:
      00A1EC 6F 20 72         [ 4] 3981 	call func_args 
      00A1EF 65 73            [ 1] 3982 	cp a,#1 
      00A1F1 75 6D            [ 1] 3983 	jreq 0$ 
      00A1F3 65 2E 0A         [ 2] 3984 	jp syntax_error
      0024A3                       3985 0$:  
      00A1F6 00               [ 2] 3986     popw x   
      00A1F7 9E               [ 1] 3987 	ld a,xh 
      00A1F7 72 01            [ 1] 3988 	bcp a,#0x80 
      00A1F9 00 22            [ 1] 3989 	jreq 2$ 
      00A1FB 01               [ 2] 3990 	negw x 
      00A1FC 81 84            [ 1] 3991 2$: ld a,#TK_INTGR 
      00A1FD 81               [ 4] 3992 	ret 
                                   3993 
                                   3994 ;------------------------------
                                   3995 ; BASIC: AND(expr1,expr2)
                                   3996 ; Apply bit AND relation between
                                   3997 ; the 2 arguments, i.e expr1 & expr2 
                                   3998 ; output:
                                   3999 ; 	A 		TK_INTGR
                                   4000 ;   X 		result 
                                   4001 ;------------------------------
      0024AD                       4002 bit_and:
      00A1FD CD 90 7D         [ 4] 4003 	call func_args 
      00A200 81 02            [ 1] 4004 	cp a,#2
      00A201 27 03            [ 1] 4005 	jreq 1$
      00A201 A6 7F C4         [ 2] 4006 	jp syntax_error 
      00A204 00               [ 2] 4007 1$:	popw x 
      00A205 1A               [ 1] 4008 	ld a,xh 
      00A206 27 13            [ 1] 4009 	and a,(1,sp)
      00A208 CE               [ 1] 4010 	ld xh,a 
      00A209 00               [ 1] 4011 	ld a,xl
      00A20A 19 1C            [ 1] 4012 	and a,(2,sp)
      00A20C 00               [ 1] 4013 	ld xl,a 
      0024C0                       4014 	_drop 2 
      00A20D 80 24            [ 2]    1     addw sp,#2 
      00A20F 04 72            [ 1] 4015 	ld a,#TK_INTGR
      00A211 5C               [ 4] 4016 	ret
                                   4017 
                                   4018 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



                                   4019 ; BASIC: OR(expr1,expr2)
                                   4020 ; Apply bit OR relation between
                                   4021 ; the 2 arguments, i.e expr1 | expr2 
                                   4022 ; output:
                                   4023 ; 	A 		TK_INTGR
                                   4024 ;   X 		result 
                                   4025 ;------------------------------
      0024C5                       4026 bit_or:
      00A212 00 18 9F         [ 4] 4027 	call func_args 
      00A215 A4 80            [ 1] 4028 	cp a,#2
      00A217 97 CF            [ 1] 4029 	jreq 1$
      00A219 00 19 81         [ 2] 4030 	jp syntax_error 
      00A21C                       4031 1$: 
      00A21C 72               [ 2] 4032 	popw x 
      00A21D BB               [ 1] 4033 	ld a,xh 
      00A21E 00 19            [ 1] 4034 	or a,(1,sp)
      00A220 24               [ 1] 4035 	ld xh,a 
      00A221 04               [ 1] 4036 	ld a,xl 
      00A222 72 5C            [ 1] 4037 	or a,(2,sp)
      00A224 00               [ 1] 4038 	ld xl,a 
      0024D8                       4039 	_drop 2 
      00A225 18 CF            [ 2]    1     addw sp,#2 
      00A227 00 19            [ 1] 4040 	ld a,#TK_INTGR 
      00A229 81               [ 4] 4041 	ret
                                   4042 
                                   4043 ;------------------------------
                                   4044 ; BASIC: XOR(expr1,expr2)
                                   4045 ; Apply bit XOR relation between
                                   4046 ; the 2 arguments, i.e expr1 ^ expr2 
                                   4047 ; output:
                                   4048 ; 	A 		TK_INTGR
                                   4049 ;   X 		result 
                                   4050 ;------------------------------
      00A22A                       4051 bit_xor:
      00A22A 5F 92 AF         [ 4] 4052 	call func_args 
      00A22D 00 18            [ 1] 4053 	cp a,#2
      00A22F 26 06            [ 1] 4054 	jreq 1$
      00A231 5C A3 00         [ 2] 4055 	jp syntax_error 
      0024E7                       4056 1$: 
      00A234 80               [ 2] 4057 	popw x 
      00A235 25               [ 1] 4058 	ld a,xh 
      00A236 F4 81            [ 1] 4059 	xor a,(1,sp)
      00A238 95               [ 1] 4060 	ld xh,a 
      00A238 72               [ 1] 4061 	ld a,xl 
      00A239 5F 00            [ 1] 4062 	xor a,(2,sp)
      00A23B 18               [ 1] 4063 	ld xl,a 
      0024F0                       4064 	_drop 2 
      00A23C 52 03            [ 2]    1     addw sp,#2 
      00A23E CD 93            [ 1] 4065 	ld a,#TK_INTGR 
      00A240 08               [ 4] 4066 	ret 
                                   4067 
                                   4068 ;------------------------------
                                   4069 ; BASIC: LSHIFT(expr1,expr2)
                                   4070 ; logical shift left expr1 by 
                                   4071 ; expr2 bits 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



                                   4072 ; output:
                                   4073 ; 	A 		TK_INTGR
                                   4074 ;   X 		result 
                                   4075 ;------------------------------
      0024F5                       4076 lshift:
      00A241 A1 04 27         [ 4] 4077 	call func_args
      00A244 03 CC            [ 1] 4078 	cp a,#2 
      00A246 92 15            [ 1] 4079 	jreq 1$
      00A248 9F A4 DF         [ 2] 4080 	jp syntax_error
      00A24B A1 45            [ 2] 4081 1$: popw y   
      00A24D 26               [ 2] 4082 	popw x 
      00A24E 0C AE            [ 2] 4083 	tnzw y 
      00A250 40 00            [ 1] 4084 	jreq 4$
      00A252 CF               [ 2] 4085 2$:	sllw x 
      00A253 00 19            [ 2] 4086 	decw y 
      00A255 AE 47            [ 1] 4087 	jrne 2$
      00250B                       4088 4$:  
      00A257 FF 4F            [ 1] 4089 	ld a,#TK_INTGR
      00A259 20               [ 4] 4090 	ret
                                   4091 
                                   4092 ;------------------------------
                                   4093 ; BASIC: RSHIFT(expr1,expr2)
                                   4094 ; logical shift right expr1 by 
                                   4095 ; expr2 bits.
                                   4096 ; output:
                                   4097 ; 	A 		TK_INTGR
                                   4098 ;   X 		result 
                                   4099 ;------------------------------
      00250E                       4100 rshift:
      00A25A 15 A1 46         [ 4] 4101 	call func_args
      00A25D 27 06            [ 1] 4102 	cp a,#2 
      00A25F AE 91            [ 1] 4103 	jreq 1$
      00A261 5F CC 92         [ 2] 4104 	jp syntax_error
      00A264 17 85            [ 2] 4105 1$: popw y  
      00A265 85               [ 2] 4106 	popw x
      00A265 AE AE            [ 2] 4107 	tnzw y 
      00A267 80 CF            [ 1] 4108 	jreq 4$
      00A269 00               [ 2] 4109 2$:	srlw x 
      00A26A 19 A6            [ 2] 4110 	decw y 
      00A26C 02 AE            [ 1] 4111 	jrne 2$
      002524                       4112 4$:  
      00A26E 7F FF            [ 1] 4113 	ld a,#TK_INTGR
      00A270 81               [ 4] 4114 	ret
                                   4115 
                                   4116 ;--------------------------
                                   4117 ; BASIC: FCPU integer
                                   4118 ; set CPU frequency 
                                   4119 ;-------------------------- 
                                   4120 
      002527                       4121 fcpu:
      00A270 6B 01            [ 1] 4122 	ld a,#TK_INTGR
      00A272 1F 02 CD         [ 4] 4123 	call expect 
      00A275 81               [ 1] 4124 	ld a,xl 
      00A276 EC 07            [ 1] 4125 	and a,#7 
      00A277 C7 50 C6         [ 1] 4126 	ld CLK_CKDIVR,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      00A277 CD               [ 4] 4127 	ret 
                                   4128 
                                   4129 ;------------------------------
                                   4130 ; BASIC: PMODE pin#, mode 
                                   4131 ; Arduino pin. 
                                   4132 ; define pin as input or output
                                   4133 ; pin#: {0..15}
                                   4134 ; mode: INPUT|OUTPUT  
                                   4135 ;------------------------------
                           000001  4136 	PINNO=1
                           000001  4137 	VSIZE=1
      002533                       4138 pin_mode:
      002533                       4139 	_vars VSIZE 
      00A278 A2 2A            [ 2]    1     sub sp,#VSIZE 
      00A27A 27 08 A6         [ 4] 4140 	call arg_list 
      00A27D 45 CD            [ 1] 4141 	cp a,#2 
      00A27F 83 B2            [ 1] 4142 	jreq 1$
      00A281 CD 82 6A         [ 2] 4143 	jp syntax_error 
      00A284 AE 00            [ 2] 4144 1$: popw y ; mode 
      00A286 80               [ 2] 4145 	popw x ; Dx pin 
      00A287 CD A2 1C         [ 4] 4146 	call select_pin 
      00A28A 7B 01            [ 1] 4147 	ld (PINNO,sp),a  
      00A28C 1E 02            [ 1] 4148 	ld a,#1 
      00A28E 72 B0            [ 1] 4149 	tnz (PINNO,sp)
      00A290 00 19            [ 1] 4150 	jreq 4$
      00A292 C2               [ 1] 4151 2$:	sll a 
      00A293 00 18            [ 1] 4152 	dec (PINNO,sp)
      00A295 22 E0            [ 1] 4153 	jrne 2$ 
      00A297 CD 90            [ 1] 4154 	ld (PINNO,sp),a
      00A299 7D 1E            [ 1] 4155 	ld a,(PINNO,sp)
      00A29B 02 A3            [ 1] 4156 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A29D 47 FF            [ 1] 4157 	ld (GPIO_CR1,x),a 
      00A29F 26 03 CD 99      [ 2] 4158 4$:	cpw y,#OUTP 
      00A2A3 95 10            [ 1] 4159 	jreq 6$
                                   4160 ; input mode
                                   4161 ; disable external interrupt 
      00A2A4 7B 01            [ 1] 4162 	ld a,(PINNO,sp)
      00A2A4 5B               [ 1] 4163 	cpl a 
      00A2A5 03 81            [ 1] 4164 	and a,(GPIO_CR2,x)
      00A2A7 E7 04            [ 1] 4165 	ld (GPIO_CR2,x),a 
                                   4166 ;clear bit in DDR for input mode 
      00A2A7 CE AE            [ 1] 4167 	ld a,(PINNO,sp)
      00A2A9 80               [ 1] 4168 	cpl a 
      00A2AA C3 A3            [ 1] 4169 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A2AC 67 81            [ 1] 4170 	ld (GPIO_DDR,x),a 
      00A2AE 20 0C            [ 2] 4171 	jra 9$
      002570                       4172 6$: ;output mode  
      00A2AE 88 4D            [ 1] 4173 	ld a,(PINNO,sp)
      00A2B0 27 0A            [ 1] 4174 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A2B2 F6 5C            [ 1] 4175 	ld (GPIO_DDR,x),a 
      00A2B4 90 F7            [ 1] 4176 	ld a,(PINNO,sp)
      00A2B6 90 5C            [ 1] 4177 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A2B8 0A 01            [ 1] 4178 	ld (GPIO_CR2,x),a 
      00257C                       4179 9$:	
      00257C                       4180 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00A2BA 26 F6            [ 2]    1     addw sp,#VSIZE 
      00A2BC 84               [ 4] 4181 	ret
                                   4182 
                                   4183 ;------------------------
                                   4184 ; select Arduino pin 
                                   4185 ; input:
                                   4186 ;   X 	 {0..15} Arduino Dx 
                                   4187 ; output:
                                   4188 ;   A     stm8s208 pin 
                                   4189 ;   X     base address s208 GPIO port 
                                   4190 ;---------------------------
      00257F                       4191 select_pin:
      00A2BD 81               [ 2] 4192 	sllw x 
      00A2BE 1C 25 8F         [ 2] 4193 	addw x,#arduino_to_8s208 
      00A2BE 88               [ 2] 4194 	ldw x,(x)
      00A2BF 90               [ 1] 4195 	ld a,xl 
      00A2C0 AE               [ 1] 4196 	push a 
      00A2C1 16               [ 1] 4197 	swapw x 
      00A2C2 E0 90            [ 1] 4198 	ld a,#5 
      00A2C4 89               [ 4] 4199 	mul x,a 
      00A2C5 A6 80 90         [ 2] 4200 	addw x,#GPIO_BASE 
      00A2C8 7F               [ 1] 4201 	pop a 
      00A2C9 90               [ 4] 4202 	ret 
                                   4203 ; translation from Arduino D0..D15 to stm8s208rb 
      00258F                       4204 arduino_to_8s208:
      00A2CA 5C 4A                 4205 .byte 3,6 ; D0 
      00A2CC 26 F9                 4206 .byte 3,5 ; D1 
      00A2CE 90 85                 4207 .byte 4,0 ; D2 
      00A2D0 84 81                 4208 .byte 2,1 ; D3
      00A2D2 06 00                 4209 .byte 6,0 ; D4
      00A2D2 89 90                 4210 .byte 2,2 ; D5
      00A2D4 89 52                 4211 .byte 2,3 ; D6
      00A2D6 06 CD                 4212 .byte 3,1 ; D7
      00A2D8 A2 A7                 4213 .byte 3,3 ; D8
      00A2DA 26 09                 4214 .byte 2,4 ; D9
      00A2DC AE A3                 4215 .byte 4,5 ; D10
      00A2DE 69 CD                 4216 .byte 2,6 ; D11
      00A2E0 84 0F                 4217 .byte 2,7 ; D12
      00A2E2 CC A3                 4218 .byte 2,5 ; D13
      00A2E4 61 02                 4219 .byte 4,2 ; D14
      00A2E5 04 01                 4220 .byte 4,1 ; D15
                                   4221 
                                   4222 
                                   4223 ;------------------------------
                                   4224 ; BASIC: RND(expr)
                                   4225 ; return random number 
                                   4226 ; between 1 and expr inclusive
                                   4227 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   4228 ; input:
                                   4229 ; 	none 
                                   4230 ; output:
                                   4231 ;	X 		random positive integer 
                                   4232 ;------------------------------
      0025AF                       4233 random:
      00A2E5 CE 00 1B         [ 4] 4234 	call func_args 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00A2E8 C3 00            [ 1] 4235 	cp a,#1
      00A2EA 1D 25            [ 1] 4236 	jreq 1$
      00A2EC 09 AE A3         [ 2] 4237 	jp syntax_error
      0025B9                       4238 1$:  
      00A2EF AB CD            [ 1] 4239 	ld a,#0x80 
      00A2F1 84 0F            [ 1] 4240 	bcp a,(1,sp)
      00A2F3 CC A3            [ 1] 4241 	jreq 2$
      00A2F5 61 0A            [ 1] 4242 	ld a,#ERR_BAD_VALUE
      00A2F6 CC 11 97         [ 2] 4243 	jp tb_error
      0025C4                       4244 2$: 
                                   4245 ; acc16=(x<<5)^x 
      00A2F6 CD 82 2C         [ 2] 4246 	ldw x,seedx 
      00A2F9 72               [ 2] 4247 	sllw x 
      00A2FA 5F               [ 2] 4248 	sllw x 
      00A2FB 00               [ 2] 4249 	sllw x 
      00A2FC 18               [ 2] 4250 	sllw x 
      00A2FD AE               [ 2] 4251 	sllw x 
      00A2FE AE               [ 1] 4252 	ld a,xh 
      00A2FF 80 CF 00         [ 1] 4253 	xor a,seedx 
      00A302 19 CD 9A         [ 1] 4254 	ld acc16,a 
      00A305 A1               [ 1] 4255 	ld a,xl 
      00A306 1F 05 0F         [ 1] 4256 	xor a,seedx+1 
      00A309 03 CD A2         [ 1] 4257 	ld acc8,a 
                                   4258 ; seedx=seedy 
      00A30C BE CE A3         [ 2] 4259 	ldw x,seedy 
      00A30F 67 90 FF         [ 2] 4260 	ldw seedx,x  
                                   4261 ; seedy=seedy^(seedy>>1)
      00A312 72 A9            [ 2] 4262 	srlw y 
      00A314 00 02            [ 1] 4263 	ld a,yh 
      00A316 1E 05 90         [ 1] 4264 	xor a,seedy 
      00A319 FF 72 A9         [ 1] 4265 	ld seedy,a  
      00A31C 00 02            [ 1] 4266 	ld a,yl 
      00A31E A6 7C 6B         [ 1] 4267 	xor a,seedy+1 
      00A321 04 A3 00         [ 1] 4268 	ld seedy+1,a 
                                   4269 ; acc16>>3 
      00A324 7C 22 01         [ 2] 4270 	ldw x,acc16 
      00A327 9F               [ 2] 4271 	srlw x 
      00A328 6B               [ 2] 4272 	srlw x 
      00A329 04               [ 2] 4273 	srlw x 
                                   4274 ; x=acc16^x 
      00A32A CE               [ 1] 4275 	ld a,xh 
      00A32B 00 1B 1F         [ 1] 4276 	xor a,acc16 
      00A32E 01               [ 1] 4277 	ld xh,a 
      00A32F 9F               [ 1] 4278 	ld a,xl 
      00A32F 1E 01 7B         [ 1] 4279 	xor a,acc8 
      00A332 04               [ 1] 4280 	ld xl,a 
                                   4281 ; seedy=x^seedy 
      00A333 CD A2 AE         [ 1] 4282 	xor a,seedy+1
      00A336 1F               [ 1] 4283 	ld xl,a 
      00A337 01               [ 1] 4284 	ld a,xh 
      00A338 AE 16 E0         [ 1] 4285 	xor a,seedy
      00A33B CD               [ 1] 4286 	ld xh,a 
      00A33C 82 46 AE         [ 2] 4287 	ldw seedy,x 
                                   4288 ; return seedy modulo expr + 1 
      00A33F 00 80            [ 2] 4289 	popw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00A341 CD               [ 2] 4290 	divw x,y 
      00A342 A2               [ 1] 4291 	ldw x,y 
      00A343 1C               [ 1] 4292 	incw x 
      002613                       4293 10$:
      00A344 1E 01            [ 1] 4294 	ld a,#TK_INTGR
      00A346 C3               [ 4] 4295 	ret 
                                   4296 
                                   4297 ;---------------------------------
                                   4298 ; BASIC: WORDS 
                                   4299 ; affiche la listes des mots du
                                   4300 ; dictionnaire ainsi que le nombre
                                   4301 ; de mots.
                                   4302 ;---------------------------------
                           000001  4303 	WLEN=1 ; word length
                           000002  4304 	LLEN=2 ; character sent to console
                           000003  4305 	WCNT=3 ; count words printed 
                           000003  4306 	VSIZE=3 
      002616                       4307 words:
      002616                       4308 	_vars VSIZE
      00A347 00 1D            [ 2]    1     sub sp,#VSIZE 
      00A349 24 16            [ 1] 4309 	clr (LLEN,sp)
      00A34B 1E 05            [ 1] 4310 	clr (WCNT,sp)
      00A34D 72 F0 03 1F      [ 2] 4311 	ldw y,#kword_dict+2
      00A351 05               [ 1] 4312 0$:	ldw x,y
      00A352 A6               [ 1] 4313 	ld a,(x)
      00A353 80 A3            [ 1] 4314 	and a,#15 
      00A355 00 80            [ 1] 4315 	ld (WLEN,sp),a 
      00A357 24 01            [ 1] 4316 	inc (WCNT,sp)
      00A359 9F               [ 1] 4317 1$:	incw x 
      00A35A 6B               [ 1] 4318 	ld a,(x)
      00A35B 04 CD A2         [ 4] 4319 	call putc 
      00A35E BE 20            [ 1] 4320 	inc (LLEN,sp)
      00A360 CE 5B            [ 1] 4321 	dec (WLEN,sp)
      00A362 06 90            [ 1] 4322 	jrne 1$
      00A364 85 85            [ 1] 4323 	ld a,#70
      00A366 81 42            [ 1] 4324 	cp a,(LLEN,sp)
      00A368 43 43            [ 1] 4325 	jrmi 2$   
      00A36A 61 6E            [ 1] 4326 	ld a,#SPACE 
      00A36C 27 74 20         [ 4] 4327 	call putc 
      00A36F 66 6C            [ 1] 4328 	inc (LLEN,sp) 
      00A371 61 73            [ 2] 4329 	jra 3$
      00A373 68 20            [ 1] 4330 2$: ld a,#CR 
      00A375 61 70 70         [ 4] 4331 	call putc 
      00A378 6C 69            [ 1] 4332 	clr (LLEN,sp)
      00A37A 63 61 74 69      [ 2] 4333 3$:	subw y,#2 
      00A37E 6F 6E            [ 2] 4334 	ldw y,(y)
      00A380 2C 20            [ 1] 4335 	jrne 0$ 
      00A382 61 6C            [ 1] 4336 	ld a,#CR 
      00A384 72 65 61         [ 4] 4337 	call putc  
      00A387 64               [ 1] 4338 	clrw x 
      00A388 79 20            [ 1] 4339 	ld a,(WCNT,sp)
      00A38A 6F               [ 1] 4340 	ld xl,a 
      00A38B 6E 65 20         [ 4] 4341 	call print_int 
      00A38E 69 6E 20         [ 2] 4342 	ldw x,#words_count_msg
      00A391 46 4C 41         [ 4] 4343 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      002663                       4344 	_drop VSIZE 
      00A394 53 48            [ 2]    1     addw sp,#VSIZE 
      00A396 0A               [ 4] 4345 	ret 
      00A397 75 73 65 20 45 52 41  4346 words_count_msg: .asciz " words in dictionary\n"
             53 45 20 5C 46 20 62
             65 66 6F 72 65 00 4E
             6F
                                   4347 
                                   4348 
                                   4349 ;-----------------------------
                                   4350 ; BASIC: TIMER expr 
                                   4351 ; initialize count down timer 
                                   4352 ;-----------------------------
      00267C                       4353 set_timer:
      00A3AD 20 61 70         [ 4] 4354 	call arg_list
      00A3B0 70 6C            [ 1] 4355 	cp a,#1 
      00A3B2 69 63            [ 1] 4356 	jreq 1$
      00A3B4 61 74 69         [ 2] 4357 	jp syntax_error
      002686                       4358 1$: 
      00A3B7 6F               [ 2] 4359 	popw x 
      00A3B8 6E 20 69         [ 2] 4360 	ldw timer,x 
      00A3BB 6E               [ 4] 4361 	ret 
                                   4362 
                                   4363 ;------------------------------
                                   4364 ; BASIC: TIMEOUT 
                                   4365 ; return state of timer 
                                   4366 ;------------------------------
      00268B                       4367 timeout:
      00A3BC 20 52 41         [ 2] 4368 	ldw x,timer 
      00268E                       4369 logical_complement:
      00A3BF 4D               [ 2] 4370 	cplw x 
      00A3C0 00 FF FF         [ 2] 4371 	cpw x,#-1
      00A3C1 27 01            [ 1] 4372 	jreq 2$
      00A3C1 52               [ 1] 4373 	clrw x 
      00A3C2 06 72            [ 1] 4374 2$:	ld a,#TK_INTGR
      00A3C4 5F               [ 4] 4375 	ret 
                                   4376 
                                   4377 ;--------------------------------
                                   4378 ; BASIC NOT(expr) 
                                   4379 ; return logical complement of expr
                                   4380 ;--------------------------------
      002698                       4381 func_not:
      00A3C5 00 18 CD         [ 4] 4382 	call func_args  
      00A3C8 97 C5            [ 1] 4383 	cp a,#1
      00A3CA A1 84            [ 1] 4384 	jreq 1$
      00A3CC 27 03 CC         [ 2] 4385 	jp syntax_error
      00A3CF 92               [ 2] 4386 1$:	popw x 
      00A3D0 15 1F            [ 2] 4387 	jra logical_complement
                                   4388 
                                   4389 
                                   4390 
                                   4391 ;-----------------------------------
                                   4392 ; BASIC: IWDGEN expr1 
                                   4393 ; enable independant watchdog timer
                                   4394 ; expr1 is delay in multiple of 62.5µsec
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



                                   4395 ; expr1 -> {1..16383}
                                   4396 ;-----------------------------------
      0026A5                       4397 enable_iwdg:
      00A3D2 01 CD 93         [ 4] 4398 	call arg_list
      00A3D5 08 A1            [ 1] 4399 	cp a,#1 
      00A3D7 08 27            [ 1] 4400 	jreq 1$
      00A3D9 02 20 19         [ 2] 4401 	jp syntax_error 
      00A3DC CD               [ 2] 4402 1$: popw x 
      00A3DD 97 C5            [ 1] 4403 	push #0
      00A3DF A1 84 27 03      [ 1] 4404 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A3E3 CC               [ 1] 4405 	ld a,xh 
      00A3E4 92 15            [ 1] 4406 	and a,#0x3f
      00A3E6 9F               [ 1] 4407 	ld xh,a  
      00A3E7 1E 01 CF         [ 2] 4408 2$:	cpw x,#255
      00A3EA 00 19            [ 2] 4409 	jrule 3$
      00A3EC 5F CD            [ 1] 4410 	inc (1,sp)
      00A3EE 82               [ 1] 4411 	rcf 
      00A3EF 8B               [ 2] 4412 	rrcw x 
      00A3F0 1E 01            [ 2] 4413 	jra 2$
      00A3F2 5C 20 DC E0      [ 1] 4414 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A3F5 84               [ 1] 4415 	pop a  
      00A3F5 5B 06 81         [ 1] 4416 	ld IWDG_PR,a 
      00A3F8 9F               [ 1] 4417 	ld a,xl
      00A3F8 CD               [ 1] 4418 	dec a 
      00A3F9 96 B1 A1 01      [ 1] 4419 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A3FD 27 03 CC         [ 1] 4420 	ld IWDG_RLR,a 
      00A400 92 15 85 9F      [ 1] 4421 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A404 A4               [ 4] 4422 	ret 
                                   4423 
                                   4424 
                                   4425 ;-----------------------------------
                                   4426 ; BASIC: IWDGREF  
                                   4427 ; refresh independant watchdog count down 
                                   4428 ; timer before it reset MCU. 
                                   4429 ;-----------------------------------
      0026DB                       4430 refresh_iwdg:
      00A405 7F 97 A6 04      [ 1] 4431 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A409 81               [ 4] 4432 	ret 
                                   4433 
                                   4434 
                                   4435 ;-------------------------------------
                                   4436 ; BASIC: LOG(expr)
                                   4437 ; return logarithm base 2 of expr 
                                   4438 ; this is the position of most significant
                                   4439 ; bit set. 
                                   4440 ; input: 
                                   4441 ; output:
                                   4442 ;   X     log2 
                                   4443 ;   A     TK_INTGR 
                                   4444 ;*********************************
      00A40A                       4445 log2:
      00A40A A6 06 CD         [ 4] 4446 	call func_args 
      00A40D 96 A4            [ 1] 4447 	cp a,#1 
      00A40F CD 93            [ 1] 4448 	jreq 1$
      00A411 08 A1 02         [ 2] 4449 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00A414 27               [ 2] 4450 1$: popw x 
      0026EB                       4451 leading_one:
      00A415 0E               [ 2] 4452 	tnzw x 
      00A416 A1 04            [ 1] 4453 	jreq 4$
      00A418 27 0D            [ 1] 4454 	ld a,#15 
      00A41A A1               [ 2] 4455 2$: rlcw x 
      00A41B 82 27            [ 1] 4456     jrc 3$
      00A41D 03               [ 1] 4457 	dec a 
      00A41E CC 92            [ 2] 4458 	jra 2$
      00A420 15               [ 1] 4459 3$: clrw x 
      00A421 FD               [ 1] 4460     ld xl,a
      00A422 20 03            [ 1] 4461 4$:	ld a,#TK_INTGR
      00A424 81               [ 4] 4462 	ret 
                                   4463 
                                   4464 ;-----------------------------------
                                   4465 ; BASIC: BIT(expr) 
                                   4466 ; expr ->{0..15}
                                   4467 ; return 2^expr 
                                   4468 ; output:
                                   4469 ;    x    2^expr 
                                   4470 ;-----------------------------------
      0026FB                       4471 bitmask:
      00A424 F6 5F 97         [ 4] 4472     call func_args 
      00A427 A1 01            [ 1] 4473 	cp a,#1
      00A427 89 A6            [ 1] 4474 	jreq 1$
      00A429 07 CD 96         [ 2] 4475 	jp syntax_error 
      00A42C A4               [ 2] 4476 1$: popw x 
      00A42D 85               [ 1] 4477 	ld a,xl 
      00A42E A6 84            [ 1] 4478 	and a,#15
      00A430 81               [ 1] 4479 	clrw x 
      00A431 5C               [ 1] 4480 	incw x 
      00A431 CD               [ 1] 4481 2$: tnz a 
      00A432 83 C2            [ 1] 4482 	jreq 3$
      00A434 5F               [ 2] 4483 	slaw x 
      00A435 97               [ 1] 4484 	dec a 
      00A436 A6 84            [ 2] 4485 	jra 2$ 
      00A438 81 84            [ 1] 4486 3$: ld a,#TK_INTGR
      00A439 81               [ 4] 4487 	ret 
                                   4488 
                                   4489 ;------------------------------
                                   4490 ; BASIC: INVERT(expr)
                                   4491 ; 1's complement 
                                   4492 ;--------------------------------
      002715                       4493 invert:
      00A439 5F C6 00         [ 4] 4494 	call func_args
      00A43C 2E C1            [ 1] 4495 	cp a,#1 
      00A43E 00 2F            [ 1] 4496 	jreq 1$
      00A440 27 01 53         [ 2] 4497 	jp syntax_error
      00A443 A6               [ 2] 4498 1$: popw x  
      00A444 84               [ 2] 4499 	cplw x 
      00A445 81 84            [ 1] 4500 	ld a,#TK_INTGR 
      00A446 81               [ 4] 4501 	ret 
                                   4502 
                                   4503 ;------------------------------
                                   4504 ; BASIC: DO 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



                                   4505 ; initiate a DO ... UNTIL loop 
                                   4506 ;------------------------------
                           000003  4507 	DOLP_ADR=3 
                           000005  4508 	DOLP_INW=5
                           000004  4509 	VSIZE=4 
      002724                       4510 do_loop:
      00A446 CD               [ 2] 4511 	popw x 
      002725                       4512 	_vars VSIZE 
      00A447 96 B1            [ 2]    1     sub sp,#VSIZE 
      00A449 A1               [ 2] 4513 	pushw x 
      00A44A 02 27 03 CC      [ 2] 4514 	ldw y,basicptr 
      00A44E 92 15            [ 2] 4515 	ldw (DOLP_ADR,sp),y
      00A450 90 CE 00 00      [ 2] 4516 	ldw y,in.w 
      00A450 1E 03            [ 2] 4517 	ldw (DOLP_INW,sp),y
      00A452 2B 17 A3 00      [ 1] 4518 	inc loop_depth 
      00A456 09               [ 4] 4519 	ret 
                                   4520 
                                   4521 ;--------------------------------
                                   4522 ; BASIC: UNTIL expr 
                                   4523 ; loop if exprssion is false 
                                   4524 ; else terminate loop
                                   4525 ;--------------------------------
      002739                       4526 until: 
      00A457 2A 12 A6 05      [ 1] 4527 	tnz loop_depth 
      00A45B 42 1C            [ 1] 4528 	jrne 1$ 
      00A45D 50 00 1F         [ 2] 4529 	jp syntax_error 
      002742                       4530 1$: 
      00A460 03 1E 01         [ 4] 4531 	call relation 
      00A463 72 FB            [ 1] 4532 	cp a,#TK_INTGR
      00A465 03 A6            [ 1] 4533 	jreq 2$
      00A467 84 5B 04         [ 2] 4534 	jp syntax_error
      00274C                       4535 2$: 
      00A46A 81               [ 2] 4536 	tnzw x 
      00A46B 26 10            [ 1] 4537 	jrne 9$
      00A46B A6 0A            [ 2] 4538 	ldw x,(DOLP_ADR,sp)
      00A46D CC 92 17         [ 2] 4539 	ldw basicptr,x 
      00A470 E6 02            [ 1] 4540 	ld a,(2,x)
      00A470 CE AE 80         [ 1] 4541 	ld count,a 
      00A473 A3 10            [ 2] 4542 	ldw x,(DOLP_INW,sp)
      00A475 93 27 08         [ 2] 4543 	ldw in.w,x 
      00A478 CE               [ 4] 4544 	ret 
      00275F                       4545 9$:	; remove loop data from stack  
      00A479 AE               [ 2] 4546 	popw x
      002760                       4547 	_drop VSIZE
      00A47A 82 1C            [ 2]    1     addw sp,#VSIZE 
      00A47C AE 84 20 03      [ 1] 4548 	dec loop_depth 
      00A480 AE               [ 2] 4549 	jp (x)
                                   4550 
                                   4551 ;--------------------------
                                   4552 ; BASIC: PRTA...PRTI  
                                   4553 ;  return constant value 
                                   4554 ;  PORT  offset in GPIO
                                   4555 ;  array
                                   4556 ;---------------------------
      002767                       4557 const_porta:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



      00A481 AE 80 A6         [ 2] 4558 	ldw x,#0
      00A484 84 81            [ 1] 4559 	ld a,#TK_INTGR 
      00A486 81               [ 4] 4560 	ret 
      00276D                       4561 const_portb:
      00A486 90 89 CD         [ 2] 4562 	ldw x,#1
      00A489 96 B1            [ 1] 4563 	ld a,#TK_INTGR 
      00A48B A1               [ 4] 4564 	ret 
      002773                       4565 const_portc:
      00A48C 01 27 07         [ 2] 4566 	ldw x,#2
      00A48F A1 02            [ 1] 4567 	ld a,#TK_INTGR 
      00A491 27               [ 4] 4568 	ret 
      002779                       4569 const_portd:
      00A492 03 CC 92         [ 2] 4570 	ldw x,#3
      00A495 15 90            [ 1] 4571 	ld a,#TK_INTGR 
      00A497 85               [ 4] 4572 	ret 
      00277F                       4573 const_porte:
      00A498 A1 01 27         [ 2] 4574 	ldw x,#4
      00A49B 02 85            [ 1] 4575 	ld a,#TK_INTGR 
      00A49D 51               [ 4] 4576 	ret 
      002785                       4577 const_portf:
      00A49E 90 FD 90         [ 2] 4578 	ldw x,#5
      00A4A1 85 81            [ 1] 4579 	ld a,#TK_INTGR 
      00A4A3 81               [ 4] 4580 	ret 
      00278B                       4581 const_portg:
      00A4A3 72 0D 52         [ 2] 4582 	ldw x,#6
      00A4A6 30 FB            [ 1] 4583 	ld a,#TK_INTGR 
      00A4A8 8E               [ 4] 4584 	ret 
      002791                       4585 const_porth:
      00A4A9 CC 8F 88         [ 2] 4586 	ldw x,#7
      00A4AC A6 84            [ 1] 4587 	ld a,#TK_INTGR 
      00A4AC 72               [ 4] 4588 	ret 
      002797                       4589 const_porti:
      00A4AD 0D 52 30         [ 2] 4590 	ldw x,#8
      00A4B0 FB 72            [ 1] 4591 	ld a,#TK_INTGR 
      00A4B2 16               [ 4] 4592 	ret 
                                   4593 
                                   4594 ;-------------------------------
                                   4595 ; following return constant 
                                   4596 ; related to GPIO register offset 
                                   4597 ;---------------------------------
      00279D                       4598 const_odr:
      00A4B3 00 22            [ 1] 4599 	ld a,#TK_INTGR 
      00A4B5 8E 81 00         [ 2] 4600 	ldw x,#GPIO_ODR
      00A4B7 81               [ 4] 4601 	ret 
      0027A3                       4602 const_idr:
      00A4B7 CD 97            [ 1] 4603 	ld a,#TK_INTGR 
      00A4B9 C5 A1 84         [ 2] 4604 	ldw x,#GPIO_IDR
      00A4BC 27               [ 4] 4605 	ret 
      0027A9                       4606 const_ddr:
      00A4BD 03 CC            [ 1] 4607 	ld a,#TK_INTGR 
      00A4BF 92 15 02         [ 2] 4608 	ldw x,#GPIO_DDR
      00A4C1 81               [ 4] 4609 	ret 
      0027AF                       4610 const_cr1:
      00A4C1 5D 27            [ 1] 4611 	ld a,#TK_INTGR 
      00A4C3 04 8F 5A         [ 2] 4612 	ldw x,#GPIO_CR1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



      00A4C6 26               [ 4] 4613 	ret 
      0027B5                       4614 const_cr2:
      00A4C7 F9 4F            [ 1] 4615 	ld a,#TK_INTGR 
      00A4C9 81 00 04         [ 2] 4616 	ldw x,#GPIO_CR2
      00A4CA 81               [ 4] 4617 	ret 
                                   4618 ;-------------------------
                                   4619 ; BASIC: POUT 
                                   4620 ;  constant for port mode
                                   4621 ;  used by PMODE 
                                   4622 ;  to set pin as output
                                   4623 ;------------------------
      0027BB                       4624 const_output:
      00A4CA CD 97            [ 1] 4625 	ld a,#TK_INTGR 
      00A4CC C5 A1 84         [ 2] 4626 	ldw x,#OUTP
      00A4CF 27               [ 4] 4627 	ret 
                                   4628 
                                   4629 ;-------------------------
                                   4630 ; BASIC: PINP 
                                   4631 ;  constant for port mode
                                   4632 ;  used by PMODE 
                                   4633 ;  to set pin as input
                                   4634 ;------------------------
      0027C1                       4635 const_input:
      00A4D0 03 CC            [ 1] 4636 	ld a,#TK_INTGR 
      00A4D2 92 15 00         [ 2] 4637 	ldw x,#INP 
      00A4D4 81               [ 4] 4638 	ret 
                                   4639 	
                                   4640 ;-----------------------
                                   4641 ; memory area constants
                                   4642 ;-----------------------
      0027C7                       4643 const_eeprom_base:
      00A4D4 A3 14            [ 1] 4644 	ld a,#TK_INTGR 
      00A4D6 00 2B 0C         [ 2] 4645 	ldw x,#EEPROM_BASE 
      00A4D9 35               [ 4] 4646 	ret 
                                   4647 
                                   4648 ;---------------------------
                                   4649 ; BASIC: DATA 
                                   4650 ; when the interpreter find 
                                   4651 ; a DATA line it skip it.
                                   4652 ;---------------------------
      0027CD                       4653 data:
      00A4DA 0F 50 F2 A6 1E   [ 1] 4654 	mov in,count 
      00A4DF 62               [ 4] 4655 	ret 
                                   4656 
                                   4657 ;------------------------------
                                   4658 ; check if it is a DATA line 
                                   4659 ; input: 
                                   4660 ;    X    line address 
                                   4661 ; output:
                                   4662 ;    Z    set if DATA line 
                                   4663 ;----------------------------
      0027D3                       4664 is_data_line:
      00A4E0 A6 10            [ 2] 4665 	ldw x,(4,x)
      00A4E2 62 20 1E         [ 2] 4666 	ldw x,(code_addr,x)
      00A4E5 A3 27 CD         [ 2] 4667 	cpw x,#data 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



      00A4E5 A3               [ 4] 4668 	ret 
                                   4669 
                                   4670 ;---------------------------
                                   4671 ; set DATA pointer at line# 
                                   4672 ; specified by X 
                                   4673 ;---------------------------
      0027DC                       4674 data_line:
      00A4E6 08               [ 1] 4675     clr a 
      00A4E7 00 2B 09         [ 4] 4676 	call search_lineno
      00A4EA 35               [ 2] 4677 	tnzw x 
      00A4EB 0E 50            [ 1] 4678 	jrne 3$
      00A4ED F2 A6            [ 1] 4679 2$:	ld a,#ERR_NO_LINE 
      00A4EF 50 62 20         [ 2] 4680 	jp tb_error
      0027E8                       4681 3$: ; check if valid data line 
      00A4F2 10 93            [ 1] 4682     ldw y,x 
      00A4F3 CD 27 D3         [ 4] 4683 	call is_data_line 
      00A4F3 35 07            [ 1] 4684 	jrne 2$ 
      0027EF                       4685 set_data_ptr: 	
      00A4F5 50 F2 00 06      [ 2] 4686 	ldw data_ptr,y
      00A4F7 90 E6 02         [ 1] 4687 	ld a,(2,y)
      00A4F7 A3 00 40         [ 1] 4688 	ld data_len,a 
      00A4FA 23 07 72 5C      [ 1] 4689 	mov data_ofs,#FIRST_DATA_ITEM 
      00A4FE 50               [ 4] 4690 	ret
                                   4691 
                                   4692 ;---------------------------------
                                   4693 ; BASIC: RESTORE [line#]
                                   4694 ; set data_ptr to first data line
                                   4695 ; if no DATA found pointer set to
                                   4696 ; zero.
                                   4697 ; if a line# is given as argument 
                                   4698 ; a data line with that number 
                                   4699 ; is searched and the data pointer 
                                   4700 ; is set to it. If there is no 
                                   4701 ; data line with that number 
                                   4702 ; the program is interrupted. 
                                   4703 ;---------------------------------
      0027FE                       4704 restore:
      00A4FF F2 54 20 F4      [ 1] 4705 	clr data_ptr 
      00A503 72 5F 00 07      [ 1] 4706 	clr data_ptr+1
      00A503 9F 4A 27 01      [ 1] 4707 	clr data_ofs 
      00A507 4A 5F 00 09      [ 1] 4708 	clr data_len
      00A508 CD 12 88         [ 4] 4709 	call next_token 
      00A508 A4 3E            [ 1] 4710 	cp a,#TK_INTGR
      00A50A C7 50            [ 1] 4711 	jreq data_line
      002815                       4712 	_unget_token 
      00A50C F1 72 18 50 F0   [ 1]    1      mov in,in.saved  
      00A511 8E 81 1A         [ 2] 4713 	ldw x,txtbgn
                                   4714 ; search first DATA line 
      00A513                       4715 data_search_loop: 	
      00A513 CE 00 10         [ 2] 4716 	cpw x,txtend
      00A516 A6 84            [ 1] 4717 	jruge restore_error 
      00A518 81 93            [ 1] 4718 	ldw y,x 
      00A519 CD 27 D3         [ 4] 4719 	call is_data_line 
      00A519 CD 96            [ 1] 4720 	jreq set_data_ptr
      002829                       4721 try_next_line: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



      00A51B B1               [ 1] 4722 	ldw x,y 
      00A51C A1 01            [ 1] 4723 	ld a,(2,x)
      00A51E 27 03 CC         [ 1] 4724 	ld acc8,a 
      00A521 92 15 00 0D      [ 1] 4725 	clr acc16 
      00A523 72 BB 00 0D      [ 2] 4726 	addw x,acc16 
      00A523 85 9E            [ 2] 4727 	jra data_search_loop
      002839                       4728 restore_error:	
      00A525 A5 80            [ 1] 4729     ld a,#ERR_NO_DATA 
      00A527 27 01 50         [ 2] 4730 	jp tb_error 
                                   4731 
                                   4732 
                                   4733 ;---------------------------------
                                   4734 ; BASIC: READ 
                                   4735 ; return next data item | 0 
                                   4736 ;---------------------------------
                           000001  4737 	CTX_BPTR=1 
                           000003  4738 	CTX_IN=3 
                           000004  4739 	CTX_COUNT=4 
                           000005  4740 	XSAVE=5
                           000006  4741 	VSIZE=6
      00283E                       4742 read:
      00283E                       4743 	_vars  VSIZE 
      00A52A A6 84            [ 2]    1     sub sp,#VSIZE 
      002840                       4744 read01:	
      00A52C 81 00 08         [ 1] 4745 	ld a,data_ofs
      00A52D C1 00 09         [ 1] 4746 	cp a,data_len 
      00A52D CD 96            [ 1] 4747 	jreq 2$ ; end of line  
      00A52F B1 A1 02         [ 4] 4748 	call save_context
      00A532 27 03 CC         [ 2] 4749 	ldw x,data_ptr 
      00A535 92 15 85         [ 2] 4750 	ldw basicptr,x 
      00A538 9E 14 01 95 9F   [ 1] 4751 	mov in,data_ofs 
      00A53D 14 02 97 5B 02   [ 1] 4752 	mov count,data_len  
      00A542 A6 84 81         [ 4] 4753 	call expression 
      00A545 A1 84            [ 1] 4754 	cp a,#TK_INTGR 
      00A545 CD 96            [ 1] 4755 	jreq 1$ 
      00A547 B1 A1 02         [ 2] 4756 	jp syntax_error 
      002865                       4757 1$:
      00A54A 27 03            [ 2] 4758 	ldw (XSAVE,SP),x
      00A54C CC 92 15         [ 4] 4759 	call next_token ; skip comma
      00A54F CE 00 04         [ 2] 4760 	ldw x,basicptr 
      00A54F 85 9E 1A         [ 2] 4761 	ldw data_ptr,x 
      00A552 01 95 9F 1A 02   [ 1] 4762 	mov data_ofs,in 
      00A557 97 5B 02         [ 4] 4763 	call rest_context
      00A55A A6 84            [ 2] 4764 	ldw x,(XSAVE,sp)
      00A55C 81 84            [ 1] 4765 	ld a,#TK_INTGR
      00A55D                       4766 	_drop VSIZE 
      00A55D CD 96            [ 2]    1     addw sp,#VSIZE 
      00A55F B1               [ 4] 4767 	ret 
      00287F                       4768 2$: ; end of line reached 
      00A560 A1 02 27 03      [ 2] 4769 	ldw y, data_ptr 
      00A564 CC 92 15 06      [ 1] 4770 	clr data_ptr
      00A567 72 5F 00 07      [ 1] 4771 	clr data_ptr+1   
      00A567 85 9E 18 01      [ 1] 4772 	clr data_ofs 
      00A56B 95 9F 18 02      [ 1] 4773 	clr data_len 
      00A56F 97 5B 02         [ 4] 4774 	call try_next_line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



      00A572 A6 84            [ 2] 4775 	jra read01
                                   4776 
                                   4777 
                                   4778 ;---------------------------------
                                   4779 ; BASIC: SPIEN clkdiv, 0|1  
                                   4780 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4781 ; if clkdiv==-1 disable SPI
                                   4782 ; 0|1 -> disable|enable  
                                   4783 ;--------------------------------- 
                           000005  4784 SPI_CS_BIT=5
      002898                       4785 spi_enable:
      00A574 81 16 36         [ 4] 4786 	call arg_list 
      00A575 A1 02            [ 1] 4787 	cp a,#2
      00A575 CD 96            [ 1] 4788 	jreq 1$
      00A577 B1 A1 02         [ 2] 4789 	jp syntax_error 
      0028A2                       4790 1$: 
      00A57A 27 03 CC 92      [ 1] 4791 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A57E 15               [ 2] 4792 	popw x  
      00A57F 90               [ 2] 4793 	tnzw x 
      00A580 85 85            [ 1] 4794 	jreq spi_disable 
      00A582 90               [ 2] 4795 	popw x 
      00A583 5D 27            [ 1] 4796 	ld a,#(1<<SPI_CR1_BR)
      00A585 05               [ 4] 4797 	mul x,a 
      00A586 58               [ 1] 4798 	ld a,xl 
      00A587 90 5A 26         [ 1] 4799 	ld SPI_CR1,a 
                                   4800 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A58A FB 1A 50 14      [ 1] 4801 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A58B 72 1A 50 16      [ 1] 4802 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4803 ; configure SPI as master mode 0.	
      00A58B A6 84 81 00      [ 1] 4804 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4805 ; ~CS line controlled by sofware 	
      00A58E 72 12 52 01      [ 1] 4806 	bset SPI_CR2,#SPI_CR2_SSM 
      00A58E CD 96 B1 A1      [ 1] 4807     bset SPI_CR2,#SPI_CR2_SSI 
                                   4808 ; enable SPI
      00A592 02 27 03 CC      [ 1] 4809 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A596 92               [ 4] 4810 	ret 
      0028CB                       4811 spi_disable:
      0028CB                       4812 	_drop #2; throw first argument.
      00A597 15 90            [ 2]    1     addw sp,##2 
                                   4813 ; wait spi idle 
      00A599 85 85            [ 1] 4814 1$:	ld a,#0x82 
      00A59B 90 5D 27         [ 1] 4815 	and a,SPI_SR
      00A59E 05 54            [ 1] 4816 	cp a,#2 
      00A5A0 90 5A            [ 1] 4817 	jrne 1$
      00A5A2 26 FB 52 00      [ 1] 4818 	bres SPI_CR1,#SPI_CR1_SPE
      00A5A4 72 13 50 C7      [ 1] 4819 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A5A4 A6 84 81 16      [ 1] 4820 	bres PE_DDR,#SPI_CS_BIT 
      00A5A7 81               [ 4] 4821 	ret 
                                   4822 
      0028E3                       4823 spi_clear_error:
      00A5A7 A6 84            [ 1] 4824 	ld a,#0x78 
      00A5A9 CD 96 A4         [ 1] 4825 	bcp a,SPI_SR 
      00A5AC 9F A4            [ 1] 4826 	jreq 1$
      00A5AE 07 C7 50 C6      [ 1] 4827 	clr SPI_SR 
      00A5B2 81               [ 4] 4828 1$: ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



                                   4829 
      00A5B3                       4830 spi_send_byte:
      00A5B3 52               [ 1] 4831 	push a 
      00A5B4 01 CD 96         [ 4] 4832 	call spi_clear_error
      00A5B7 B6               [ 1] 4833 	pop a 
      00A5B8 A1 02 27 03 CC   [ 2] 4834 	btjf SPI_SR,#SPI_SR_TXE,.
      00A5BD 92 15 90         [ 1] 4835 	ld SPI_DR,a
      00A5C0 85 85 CD A5 FF   [ 2] 4836 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A5C5 6B 01 A6         [ 1] 4837 	ld a,SPI_DR 
      00A5C8 01               [ 4] 4838 	ret 
                                   4839 
      002905                       4840 spi_rcv_byte:
      00A5C9 0D 01            [ 1] 4841 	ld a,#255
      00A5CB 27 0D 48 0A 01   [ 2] 4842 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A5D0 26 FB 6B         [ 1] 4843 	ld a,SPI_DR 
      00A5D3 01               [ 4] 4844 	ret
                                   4845 
                                   4846 ;------------------------------
                                   4847 ; BASIC: SPIWR byte [,byte]
                                   4848 ; write 1 or more byte
                                   4849 ;------------------------------
      002910                       4850 spi_write:
      00A5D4 7B 01 EA         [ 4] 4851 	call expression
      00A5D7 03 E7            [ 1] 4852 	cp a,#TK_INTGR 
      00A5D9 03 90            [ 1] 4853 	jreq 1$
      00A5DB A3 00 01         [ 2] 4854 	jp syntax_error 
      00291A                       4855 1$:	
      00A5DE 27               [ 1] 4856 	ld a,xl 
      00A5DF 10 7B 01         [ 4] 4857 	call spi_send_byte 
      00A5E2 43 E4 04         [ 4] 4858 	call next_token 
      00A5E5 E7 04            [ 1] 4859 	cp a,#TK_COMMA 
      00A5E7 7B 01            [ 1] 4860 	jrne 2$ 
      00A5E9 43 E4            [ 2] 4861 	jra spi_write 
      00A5EB 02               [ 1] 4862 2$:	tnz a 
      00A5EC E7 02            [ 1] 4863 	jreq 3$
      00292A                       4864 	_unget_token  
      00A5EE 20 0C 02 00 01   [ 1]    1      mov in,in.saved  
      00A5F0 81               [ 4] 4865 3$:	ret 
                                   4866 
                                   4867 
                                   4868 ;-------------------------------
                                   4869 ; BASIC: SPIRD 	
                                   4870 ; read one byte from SPI 
                                   4871 ;-------------------------------
      002930                       4872 spi_read:
      00A5F0 7B 01 EA         [ 4] 4873 	call spi_rcv_byte 
      00A5F3 02               [ 1] 4874 	clrw x 
      00A5F4 E7               [ 1] 4875 	ld xl,a 
      00A5F5 02 7B            [ 1] 4876 	ld a,#TK_INTGR 
      00A5F7 01               [ 4] 4877 	ret 
                                   4878 
                                   4879 ;------------------------------
                                   4880 ; BASIC: SPISEL 0|1 
                                   4881 ; set state of ~CS line
                                   4882 ; 0|1 deselect|select  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



                                   4883 ;------------------------------
      002938                       4884 spi_select:
      00A5F8 EA 04 E7         [ 4] 4885 	call next_token 
      00A5FB 04 84            [ 1] 4886 	cp a,#TK_INTGR 
      00A5FC 27 03            [ 1] 4887 	jreq 1$
      00A5FC 5B 01 81         [ 2] 4888 	jp syntax_error 
      00A5FF 5D               [ 2] 4889 1$: tnzw x  
      00A5FF 58 1C            [ 1] 4890 	jreq cs_high 
      00A601 A6 0F FE 9F      [ 1] 4891 	bres PE_ODR,#SPI_CS_BIT
      00A605 88               [ 4] 4892 	ret 
      00294A                       4893 cs_high: 
      00A606 5E A6 05 42      [ 1] 4894 	bset PE_ODR,#SPI_CS_BIT
      00A60A 1C               [ 4] 4895 	ret 
                                   4896 
                                   4897 ;-------------------------------
                                   4898 ; BASIC: PAD 
                                   4899 ; Return pad buffer address.
                                   4900 ;------------------------------
      00294F                       4901 pad_ref:
      00A60B 50 00 84         [ 2] 4902 	ldw x,#pad 
      00A60E 81 84            [ 1] 4903 	ld a,TK_INTGR
      00A60F 81               [ 4] 4904 	ret 
                                   4905 
                                   4906 
                                   4907 ;------------------------------
                                   4908 ;      dictionary 
                                   4909 ; format:
                                   4910 ;   link:   2 bytes 
                                   4911 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   4912 ;   cmd_name: 16 byte max 
                                   4913 ;   cmd_index: 2 bytes 
                                   4914 ;------------------------------
                                   4915 	.macro _dict_entry len,name,cmd_idx 
                                   4916 	.word LINK 
                                   4917 	LINK=.
                                   4918 name:
                                   4919 	.byte len 	
                                   4920 	.ascii "name"
                                   4921 	.word cmd_idx 
                                   4922 	.endm 
                                   4923 
                           000000  4924 	LINK=0
                                   4925 ; respect alphabetic order for BASIC names from Z-A
                                   4926 ; this sort order is for a cleaner WORDS cmd output. 	
      002955                       4927 kword_end:
      002955                       4928 	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
      00A60F 03 06                    1 	.word LINK 
                           002957     2 	LINK=.
      002957                          3 XOR:
      00A611 03                       4 	.byte 3+F_IFUNC 	
      00A612 05 04 00                 5 	.ascii "XOR"
      00A615 02 01                    6 	.word XOR_IDX 
      00295D                       4929 	_dict_entry,5,WRITE,WRITE_IDX;write  
      00A617 06 00                    1 	.word LINK 
                           00295F     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



      00295F                          3 WRITE:
      00A619 02                       4 	.byte 5 	
      00A61A 02 02 03 03 01           5 	.ascii "WRITE"
      00A61F 03 03                    6 	.word WRITE_IDX 
      002967                       4930 	_dict_entry,5,WORDS,WORDS_IDX;words 
      00A621 02 04                    1 	.word LINK 
                           002969     2 	LINK=.
      002969                          3 WORDS:
      00A623 04                       4 	.byte 5 	
      00A624 05 02 06 02 07           5 	.ascii "WORDS"
      00A629 02 05                    6 	.word WORDS_IDX 
      002971                       4931 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      00A62B 04 02                    1 	.word LINK 
                           002973     2 	LINK=.
      002973                          3 WAIT:
      00A62D 04                       4 	.byte 4 	
      00A62E 01 41 49 54              5 	.ascii "WAIT"
      00A62F 00 BA                    6 	.word WAIT_IDX 
      00297A                       4932 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      00A62F CD 96                    1 	.word LINK 
                           00297C     2 	LINK=.
      00297C                          3 USR:
      00A631 B1                       4 	.byte 3+F_IFUNC 	
      00A632 A1 01 27                 5 	.ascii "USR"
      00A635 03 CC                    6 	.word USR_IDX 
      002982                       4933 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      00A637 92 15                    1 	.word LINK 
                           002984     2 	LINK=.
      00A639                          3 UNTIL:
      00A639 A6                       4 	.byte 5 	
      00A63A 80 15 01 27 05           5 	.ascii "UNTIL"
      00A63F A6 0A                    6 	.word UNTIL_IDX 
      00298C                       4934 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      00A641 CC 92                    1 	.word LINK 
                           00298E     2 	LINK=.
      00298E                          3 UFLASH:
      00A643 17                       4 	.byte 6+F_IFUNC 	
      00A644 55 46 4C 41 53 48        5 	.ascii "UFLASH"
      00A644 CE 00                    6 	.word UFLASH_IDX 
      002997                       4935 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      00A646 14 58                    1 	.word LINK 
                           002999     2 	LINK=.
      002999                          3 UBOUND:
      00A648 58                       4 	.byte 6+F_IFUNC 	
      00A649 58 58 58 9E C8 00        5 	.ascii "UBOUND"
      00A64F 14 C7                    6 	.word UBOUND_IDX 
      0029A2                       4936 	_dict_entry,4,TONE,TONE_IDX;tone  
      00A651 00 0E                    1 	.word LINK 
                           0029A4     2 	LINK=.
      0029A4                          3 TONE:
      00A653 9F                       4 	.byte 4 	
      00A654 C8 00 15 C7              5 	.ascii "TONE"
      00A658 00 0F                    6 	.word TONE_IDX 
      0029AB                       4937 	_dict_entry,2,TO,TO_IDX;to
      00A65A CE 00                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



                           0029AD     2 	LINK=.
      0029AD                          3 TO:
      00A65C 16                       4 	.byte 2 	
      00A65D CF 00                    5 	.ascii "TO"
      00A65F 14 90                    6 	.word TO_IDX 
      0029B2                       4938 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00A661 54 90                    1 	.word LINK 
                           0029B4     2 	LINK=.
      0029B4                          3 TIMER:
      00A663 9E                       4 	.byte 5 	
      00A664 C8 00 16 C7 00           5 	.ascii "TIMER"
      00A669 16 90                    6 	.word TIMER_IDX 
      0029BC                       4939 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00A66B 9F C8                    1 	.word LINK 
                           0029BE     2 	LINK=.
      0029BE                          3 TIMEOUT:
      00A66D 00                       4 	.byte 7+F_IFUNC 	
      00A66E 17 C7 00 17 CE 00 0E     5 	.ascii "TIMEOUT"
      00A675 54 54                    6 	.word TMROUT_IDX 
      0029C8                       4940 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00A677 54 9E                    1 	.word LINK 
                           0029CA     2 	LINK=.
      0029CA                          3 TICKS:
      00A679 C8                       4 	.byte 5+F_IFUNC 	
      00A67A 00 0E 95 9F C8           5 	.ascii "TICKS"
      00A67F 00 0F                    6 	.word TICKS_IDX 
      0029D2                       4941 	_dict_entry,4,STOP,STOP_IDX;stop 
      00A681 97 C8                    1 	.word LINK 
                           0029D4     2 	LINK=.
      0029D4                          3 STOP:
      00A683 00                       4 	.byte 4 	
      00A684 17 97 9E C8              5 	.ascii "STOP"
      00A688 00 16                    6 	.word STOP_IDX 
      0029DB                       4942 	_dict_entry,4,STEP,STEP_IDX;step 
      00A68A 95 CF                    1 	.word LINK 
                           0029DD     2 	LINK=.
      0029DD                          3 STEP:
      00A68C 00                       4 	.byte 4 	
      00A68D 16 90 85 65              5 	.ascii "STEP"
      00A691 93 5C                    6 	.word STEP_IDX 
      00A693                       4943 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      00A693 A6 84                    1 	.word LINK 
                           0029E6     2 	LINK=.
      0029E6                          3 SPIWR:
      00A695 81                       4 	.byte 5 	
      00A696 53 50 49 57 52           5 	.ascii "SPIWR"
      00A696 52 03                    6 	.word SPIWR_IDX 
      0029EE                       4944 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00A698 0F 02                    1 	.word LINK 
                           0029F0     2 	LINK=.
      0029F0                          3 SPISEL:
      00A69A 0F                       4 	.byte 6 	
      00A69B 03 90 AE AD 7D 93        5 	.ascii "SPISEL"
      00A6A1 F6 A4                    6 	.word SPISEL_IDX 
      0029F9                       4945 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



      00A6A3 0F 6B                    1 	.word LINK 
                           0029FB     2 	LINK=.
      0029FB                          3 SPIRD:
      00A6A5 01                       4 	.byte 5+F_IFUNC 	
      00A6A6 0C 03 5C F6 CD           5 	.ascii "SPIRD"
      00A6AB 83 B2                    6 	.word SPIRD_IDX 
      002A03                       4946 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      00A6AD 0C 02                    1 	.word LINK 
                           002A05     2 	LINK=.
      002A05                          3 SPIEN:
      00A6AF 0A                       4 	.byte 5 	
      00A6B0 01 26 F5 A6 46           5 	.ascii "SPIEN"
      00A6B5 11 02                    6 	.word SPIEN_IDX 
      002A0D                       4947 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      00A6B7 2B 09                    1 	.word LINK 
                           002A0F     2 	LINK=.
      002A0F                          3 SLEEP:
      00A6B9 A6                       4 	.byte 5 	
      00A6BA 20 CD 83 B2 0C           5 	.ascii "SLEEP"
      00A6BF 02 20                    6 	.word SLEEP_IDX 
      002A17                       4948     _dict_entry,4,SIZE,SIZE_IDX; cmd_size 
      00A6C1 07 A6                    1 	.word LINK 
                           002A19     2 	LINK=.
      002A19                          3 SIZE:
      00A6C3 0D                       4 	.byte 4 	
      00A6C4 CD 83 B2 0F              5 	.ascii "SIZE"
      00A6C8 02 72                    6 	.word SIZE_IDX 
      002A20                       4949 	_dict_entry,4,SHOW,SHOW_IDX;show 
      00A6CA A2 00                    1 	.word LINK 
                           002A22     2 	LINK=.
      002A22                          3 SHOW:
      00A6CC 02                       4 	.byte 4 	
      00A6CD 90 FE 26 CF              5 	.ascii "SHOW"
      00A6D1 A6 0D                    6 	.word SHOW_IDX 
      002A29                       4950 	_dict_entry,4,SAVE,SAVE_IDX ;save_app 
      00A6D3 CD 83                    1 	.word LINK 
                           002A2B     2 	LINK=.
      002A2B                          3 SAVE:
      00A6D5 B2                       4 	.byte 4 	
      00A6D6 5F 7B 03 97              5 	.ascii "SAVE"
      00A6DA CD 93                    6 	.word SAVE_IDX 
      002A32                       4951 	_dict_entry 3,RUN,RUN_IDX;run
      00A6DC 58 AE                    1 	.word LINK 
                           002A34     2 	LINK=.
      002A34                          3 RUN:
      00A6DE A6                       4 	.byte 3 	
      00A6DF E6 CD 84                 5 	.ascii "RUN"
      00A6E2 0F 5B                    6 	.word RUN_IDX 
      002A3A                       4952 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      00A6E4 03 81                    1 	.word LINK 
                           002A3C     2 	LINK=.
      002A3C                          3 RSHIFT:
      00A6E6 20                       4 	.byte 6+F_IFUNC 	
      00A6E7 77 6F 72 64 73 20        5 	.ascii "RSHIFT"
      00A6ED 69 6E                    6 	.word RSHIFT_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



      002A45                       4953 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      00A6EF 20 64                    1 	.word LINK 
                           002A47     2 	LINK=.
      002A47                          3 RND:
      00A6F1 69                       4 	.byte 3+F_IFUNC 	
      00A6F2 63 74 69                 5 	.ascii "RND"
      00A6F5 6F 6E                    6 	.word RND_IDX 
      002A4D                       4954 	_dict_entry,6,RETURN,RET_IDX;return 
      00A6F7 61 72                    1 	.word LINK 
                           002A4F     2 	LINK=.
      002A4F                          3 RETURN:
      00A6F9 79                       4 	.byte 6 	
      00A6FA 0A 00 54 55 52 4E        5 	.ascii "RETURN"
      00A6FC 00 8E                    6 	.word RET_IDX 
      002A58                       4955 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00A6FC CD 96                    1 	.word LINK 
                           002A5A     2 	LINK=.
      002A5A                          3 RESTORE:
      00A6FE B6                       4 	.byte 7 	
      00A6FF A1 01 27 03 CC 92 15     5 	.ascii "RESTORE"
      00A706 00 8C                    6 	.word REST_IDX 
      002A64                       4956 	_dict_entry 6,REMARK,REM_IDX;remark 
      00A706 85 CF                    1 	.word LINK 
                           002A66     2 	LINK=.
      002A66                          3 REMARK:
      00A708 00                       4 	.byte 6 	
      00A709 12 81 4D 41 52 4B        5 	.ascii "REMARK"
      00A70B 00 8A                    6 	.word REM_IDX 
      002A6F                       4957 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      00A70B CE 00                    1 	.word LINK 
                           002A71     2 	LINK=.
      002A71                          3 REBOOT:
      00A70D 12                       4 	.byte 6 	
      00A70E 52 45 42 4F 4F 54        5 	.ascii "REBOOT"
      00A70E 53 A3                    6 	.word RBT_IDX 
      002A7A                       4958 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      00A710 FF FF                    1 	.word LINK 
                           002A7C     2 	LINK=.
      002A7C                          3 READ:
      00A712 27                       4 	.byte 4+F_IFUNC 	
      00A713 01 5F A6 84              5 	.ascii "READ"
      00A717 81 86                    6 	.word READ_IDX 
      00A718                       4959 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      00A718 CD 96                    1 	.word LINK 
                           002A85     2 	LINK=.
      002A85                          3 QKEY:
      00A71A B1                       4 	.byte 4+F_IFUNC 	
      00A71B A1 01 27 03              5 	.ascii "QKEY"
      00A71F CC 92                    6 	.word QKEY_IDX 
      002A8C                       4960 	_dict_entry,4+F_IFUNC,PRTI,PRTI_IDX;const_porti 
      00A721 15 85                    1 	.word LINK 
                           002A8E     2 	LINK=.
      002A8E                          3 PRTI:
      00A723 20                       4 	.byte 4+F_IFUNC 	
      00A724 E9 52 54 49              5 	.ascii "PRTI"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



      00A725 00 82                    6 	.word PRTI_IDX 
      002A95                       4961 	_dict_entry,4+F_IFUNC,PRTH,PRTH_IDX;const_porth 
      00A725 CD 96                    1 	.word LINK 
                           002A97     2 	LINK=.
      002A97                          3 PRTH:
      00A727 B6                       4 	.byte 4+F_IFUNC 	
      00A728 A1 01 27 03              5 	.ascii "PRTH"
      00A72C CC 92                    6 	.word PRTH_IDX 
      002A9E                       4962 	_dict_entry,4+F_IFUNC,PRTG,PRTG_IDX;const_portg 
      00A72E 15 85                    1 	.word LINK 
                           002AA0     2 	LINK=.
      002AA0                          3 PRTG:
      00A730 4B                       4 	.byte 4+F_IFUNC 	
      00A731 00 35 CC 50              5 	.ascii "PRTG"
      00A735 E0 9E                    6 	.word PRTG_IDX 
      002AA7                       4963 	_dict_entry,4+F_IFUNC,PRTF,PRTF_IDX;const_portf
      00A737 A4 3F                    1 	.word LINK 
                           002AA9     2 	LINK=.
      002AA9                          3 PRTF:
      00A739 95                       4 	.byte 4+F_IFUNC 	
      00A73A A3 00 FF 23              5 	.ascii "PRTF"
      00A73E 06 0C                    6 	.word PRTF_IDX 
      002AB0                       4964 	_dict_entry,4+F_IFUNC,PRTE,PRTE_IDX;const_porte
      00A740 01 98                    1 	.word LINK 
                           002AB2     2 	LINK=.
      002AB2                          3 PRTE:
      00A742 56                       4 	.byte 4+F_IFUNC 	
      00A743 20 F5 35 55              5 	.ascii "PRTE"
      00A747 50 E0                    6 	.word PRTE_IDX 
      002AB9                       4965 	_dict_entry,4+F_IFUNC,PRTD,PRTD_IDX;const_portd
      00A749 84 C7                    1 	.word LINK 
                           002ABB     2 	LINK=.
      002ABB                          3 PRTD:
      00A74B 50                       4 	.byte 4+F_IFUNC 	
      00A74C E1 9F 4A 35              5 	.ascii "PRTD"
      00A750 55 50                    6 	.word PRTD_IDX 
      002AC2                       4966 	_dict_entry,4+F_IFUNC,PRTC,PRTC_IDX;const_portc
      00A752 E0 C7                    1 	.word LINK 
                           002AC4     2 	LINK=.
      002AC4                          3 PRTC:
      00A754 50                       4 	.byte 4+F_IFUNC 	
      00A755 E2 35 AA 50              5 	.ascii "PRTC"
      00A759 E0 81                    6 	.word PRTC_IDX 
      00A75B                       4967 	_dict_entry,4+F_IFUNC,PRTB,PRTB_IDX;const_portb
      00A75B 35 AA                    1 	.word LINK 
                           002ACD     2 	LINK=.
      002ACD                          3 PRTB:
      00A75D 50                       4 	.byte 4+F_IFUNC 	
      00A75E E0 81 54 42              5 	.ascii "PRTB"
      00A760 00 74                    6 	.word PRTB_IDX 
      002AD4                       4968 	_dict_entry,4+F_IFUNC,PRTA,PRTA_IDX;const_porta 
      00A760 CD 96                    1 	.word LINK 
                           002AD6     2 	LINK=.
      002AD6                          3 PRTA:
      00A762 B1                       4 	.byte 4+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



      00A763 A1 01 27 03              5 	.ascii "PRTA"
      00A767 CC 92                    6 	.word PRTA_IDX 
      002ADD                       4969 	_dict_entry 5,PRINT,PRT_IDX;print 
      00A769 15 85                    1 	.word LINK 
                           002ADF     2 	LINK=.
      00A76B                          3 PRINT:
      00A76B 5D                       4 	.byte 5 	
      00A76C 27 0A A6 0F 59           5 	.ascii "PRINT"
      00A771 25 03                    6 	.word PRT_IDX 
      002AE7                       4970 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      00A773 4A 20                    1 	.word LINK 
                           002AE9     2 	LINK=.
      002AE9                          3 POUT:
      00A775 FA                       4 	.byte 4+F_IFUNC 	
      00A776 5F 97 A6 84              5 	.ascii "POUT"
      00A77A 81 6E                    6 	.word POUT_IDX 
      00A77B                       4971 	_dict_entry,4,POKE,POKE_IDX;poke 
      00A77B CD 96                    1 	.word LINK 
                           002AF2     2 	LINK=.
      002AF2                          3 POKE:
      00A77D B1                       4 	.byte 4 	
      00A77E A1 01 27 03              5 	.ascii "POKE"
      00A782 CC 92                    6 	.word POKE_IDX 
      002AF9                       4972 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      00A784 15 85                    1 	.word LINK 
                           002AFB     2 	LINK=.
      002AFB                          3 PMODE:
      00A786 9F                       4 	.byte 5 	
      00A787 A4 0F 5F 5C 4D           5 	.ascii "PMODE"
      00A78C 27 04                    6 	.word PMODE_IDX 
      002B03                       4973 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      00A78E 58 4A                    1 	.word LINK 
                           002B05     2 	LINK=.
      002B05                          3 PINP:
      00A790 20                       4 	.byte 4+F_IFUNC 	
      00A791 F9 A6 84 81              5 	.ascii "PINP"
      00A795 00 6A                    6 	.word PINP_IDX 
      002B0C                       4974 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      00A795 CD 96                    1 	.word LINK 
                           002B0E     2 	LINK=.
      002B0E                          3 PEEK:
      00A797 B1                       4 	.byte 4+F_IFUNC 	
      00A798 A1 01 27 03              5 	.ascii "PEEK"
      00A79C CC 92                    6 	.word PEEK_IDX 
      002B15                       4975 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      00A79E 15 85                    1 	.word LINK 
                           002B17     2 	LINK=.
      002B17                          3 PAUSE:
      00A7A0 53                       4 	.byte 5 	
      00A7A1 A6 84 81 53 45           5 	.ascii "PAUSE"
      00A7A4 00 64                    6 	.word PAUSE_IDX 
      002B1F                       4976 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      00A7A4 85 52                    1 	.word LINK 
                           002B21     2 	LINK=.
      002B21                          3 PAD:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



      00A7A6 04                       4 	.byte 3+F_IFUNC 	
      00A7A7 89 90 CE                 5 	.ascii "PAD"
      00A7AA 00 05                    6 	.word PAD_IDX 
      002B27                       4977 	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
      00A7AC 17 03                    1 	.word LINK 
                           002B29     2 	LINK=.
      002B29                          3 OR:
      00A7AE 90                       4 	.byte 2+F_IFUNC 	
      00A7AF CE 00                    5 	.ascii "OR"
      00A7B1 01 17                    6 	.word OR_IDX 
      002B2E                       4978 	_dict_entry,2,ON,ON_IDX; cmd_on 
      00A7B3 05 72                    1 	.word LINK 
                           002B30     2 	LINK=.
      002B30                          3 ON:
      00A7B5 5C                       4 	.byte 2 	
      00A7B6 00 1F                    5 	.ascii "ON"
      00A7B8 81 C4                    6 	.word ON_IDX 
      00A7B9                       4979 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      00A7B9 72 5D                    1 	.word LINK 
                           002B37     2 	LINK=.
      002B37                          3 ODR:
      00A7BB 00                       4 	.byte 3+F_IFUNC 	
      00A7BC 1F 26 03                 5 	.ascii "ODR"
      00A7BF CC 92                    6 	.word ODR_IDX 
      002B3D                       4980 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      00A7C1 15 37                    1 	.word LINK 
                           002B3F     2 	LINK=.
      00A7C2                          3 NOT:
      00A7C2 CD                       4 	.byte 3+F_IFUNC 	
      00A7C3 98 0E A1                 5 	.ascii "NOT"
      00A7C6 84 27                    6 	.word NOT_IDX 
      002B45                       4981 	_dict_entry,4,NEXT,NEXT_IDX;next 
      00A7C8 03 CC                    1 	.word LINK 
                           002B47     2 	LINK=.
      002B47                          3 NEXT:
      00A7CA 92                       4 	.byte 4 	
      00A7CB 15 45 58 54              5 	.ascii "NEXT"
      00A7CC 00 58                    6 	.word NEXT_IDX 
      002B4E                       4982 	_dict_entry,3,NEW,NEW_IDX;new
      00A7CC 5D 26                    1 	.word LINK 
                           002B50     2 	LINK=.
      002B50                          3 NEW:
      00A7CE 10                       4 	.byte 3 	
      00A7CF 1E 03 CF                 5 	.ascii "NEW"
      00A7D2 00 05                    6 	.word NEW_IDX 
      002B56                       4983 	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
      00A7D4 E6 02                    1 	.word LINK 
                           002B58     2 	LINK=.
      002B58                          3 MULDIV:
      00A7D6 C7                       4 	.byte 6+F_IFUNC 	
      00A7D7 00 04 1E 05 CF 00        5 	.ascii "MULDIV"
      00A7DD 01 81                    6 	.word MULDIV_IDX 
      00A7DF                       4984 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      00A7DF 85 5B                    1 	.word LINK 
                           002B63     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



      002B63                          3 LSHIFT:
      00A7E1 04                       4 	.byte 6+F_IFUNC 	
      00A7E2 72 5A 00 1F FC 54        5 	.ascii "LSHIFT"
      00A7E7 00 54                    6 	.word LSHIFT_IDX 
      002B6C                       4985 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      00A7E7 AE 00                    1 	.word LINK 
                           002B6E     2 	LINK=.
      002B6E                          3 LOG:
      00A7E9 00                       4 	.byte 3+F_IFUNC 	
      00A7EA A6 84 81                 5 	.ascii "LOG"
      00A7ED 00 52                    6 	.word LOG_IDX 
      002B74                       4986 	_dict_entry 4,LIST,LIST_IDX;list
      00A7ED AE 00                    1 	.word LINK 
                           002B76     2 	LINK=.
      002B76                          3 LIST:
      00A7EF 01                       4 	.byte 4 	
      00A7F0 A6 84 81 54              5 	.ascii "LIST"
      00A7F3 00 50                    6 	.word LIST_IDX 
      002B7D                       4987 	_dict_entry 3,LET,LET_IDX;let 
      00A7F3 AE 00                    1 	.word LINK 
                           002B7F     2 	LINK=.
      002B7F                          3 LET:
      00A7F5 02                       4 	.byte 3 	
      00A7F6 A6 84 81                 5 	.ascii "LET"
      00A7F9 00 4E                    6 	.word LET_IDX 
      002B85                       4988 	_dict_entry,3+F_IFUNC,KEY,KEY_IDX;key 
      00A7F9 AE 00                    1 	.word LINK 
                           002B87     2 	LINK=.
      002B87                          3 KEY:
      00A7FB 03                       4 	.byte 3+F_IFUNC 	
      00A7FC A6 84 81                 5 	.ascii "KEY"
      00A7FF 00 4C                    6 	.word KEY_IDX 
      002B8D                       4989 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      00A7FF AE 00                    1 	.word LINK 
                           002B8F     2 	LINK=.
      002B8F                          3 IWDGREF:
      00A801 04                       4 	.byte 7 	
      00A802 A6 84 81 47 52 45 46     5 	.ascii "IWDGREF"
      00A805 00 4A                    6 	.word IWDGREF_IDX 
      002B99                       4990 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      00A805 AE 00                    1 	.word LINK 
                           002B9B     2 	LINK=.
      002B9B                          3 IWDGEN:
      00A807 05                       4 	.byte 6 	
      00A808 A6 84 81 47 45 4E        5 	.ascii "IWDGEN"
      00A80B 00 48                    6 	.word IWDGEN_IDX 
      002BA4                       4991 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      00A80B AE 00                    1 	.word LINK 
                           002BA6     2 	LINK=.
      002BA6                          3 INVERT:
      00A80D 06                       4 	.byte 6+F_IFUNC 	
      00A80E A6 84 81 45 52 54        5 	.ascii "INVERT"
      00A811 00 46                    6 	.word INVERT_IDX 
      002BAF                       4992 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      00A811 AE 00                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



                           002BB1     2 	LINK=.
      002BB1                          3 INPUT:
      00A813 07                       4 	.byte 5 	
      00A814 A6 84 81 55 54           5 	.ascii "INPUT"
      00A817 00 44                    6 	.word INPUT_IDX 
      002BB9                       4993 	_dict_entry,2,IF,IF_IDX;if 
      00A817 AE 00                    1 	.word LINK 
                           002BBB     2 	LINK=.
      002BBB                          3 IF:
      00A819 08                       4 	.byte 2 	
      00A81A A6 84                    5 	.ascii "IF"
      00A81C 81 42                    6 	.word IF_IDX 
      00A81D                       4994 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      00A81D A6 84                    1 	.word LINK 
                           002BC2     2 	LINK=.
      002BC2                          3 IDR:
      00A81F AE                       4 	.byte 3+F_IFUNC 	
      00A820 00 00 81                 5 	.ascii "IDR"
      00A823 00 40                    6 	.word IDR_IDX 
      002BC8                       4995 	_dict_entry,3,HEX,HEX_IDX;hex_base
      00A823 A6 84                    1 	.word LINK 
                           002BCA     2 	LINK=.
      002BCA                          3 HEX:
      00A825 AE                       4 	.byte 3 	
      00A826 00 01 81                 5 	.ascii "HEX"
      00A829 00 3E                    6 	.word HEX_IDX 
      002BD0                       4996 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      00A829 A6 84                    1 	.word LINK 
                           002BD2     2 	LINK=.
      002BD2                          3 GPIO:
      00A82B AE                       4 	.byte 4+F_IFUNC 	
      00A82C 00 02 81 4F              5 	.ascii "GPIO"
      00A82F 00 3C                    6 	.word GPIO_IDX 
      002BD9                       4997 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      00A82F A6 84                    1 	.word LINK 
                           002BDB     2 	LINK=.
      002BDB                          3 GOTO:
      00A831 AE                       4 	.byte 4 	
      00A832 00 03 81 4F              5 	.ascii "GOTO"
      00A835 00 3A                    6 	.word GOTO_IDX 
      002BE2                       4998 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      00A835 A6 84                    1 	.word LINK 
                           002BE4     2 	LINK=.
      002BE4                          3 GOSUB:
      00A837 AE                       4 	.byte 5 	
      00A838 00 04 81 55 42           5 	.ascii "GOSUB"
      00A83B 00 38                    6 	.word GOSUB_IDX 
      002BEC                       4999 	_dict_entry,3,GET,GET_IDX; cmd_get 
      00A83B A6 84                    1 	.word LINK 
                           002BEE     2 	LINK=.
      002BEE                          3 GET:
      00A83D AE                       4 	.byte 3 	
      00A83E 00 01 81                 5 	.ascii "GET"
      00A841 00 C6                    6 	.word GET_IDX 
      002BF4                       5000 	_dict_entry,4+F_IFUNC,FREE,FREE_IDX;free
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



      00A841 A6 84                    1 	.word LINK 
                           002BF6     2 	LINK=.
      002BF6                          3 FREE:
      00A843 AE                       4 	.byte 4+F_IFUNC 	
      00A844 00 00 81 45              5 	.ascii "FREE"
      00A847 00 98                    6 	.word FREE_IDX 
      002BFD                       5001 	_dict_entry,3,FOR,FOR_IDX;for 
      00A847 A6 84                    1 	.word LINK 
                           002BFF     2 	LINK=.
      002BFF                          3 FOR:
      00A849 AE                       4 	.byte 3 	
      00A84A 40 00 81                 5 	.ascii "FOR"
      00A84D 00 36                    6 	.word FOR_IDX 
      002C05                       5002 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      00A84D 55 00                    1 	.word LINK 
                           002C07     2 	LINK=.
      002C07                          3 FCPU:
      00A84F 04                       4 	.byte 4 	
      00A850 00 02 81 55              5 	.ascii "FCPU"
      00A853 00 32                    6 	.word FCPU_IDX 
      002C0E                       5003 	_dict_entry,5,ERASE,ERASE_IDX; erase 
      00A853 EE 04                    1 	.word LINK 
                           002C10     2 	LINK=.
      002C10                          3 ERASE:
      00A855 DE                       4 	.byte 5 	
      00A856 AD 83 A3 A8 4D           5 	.ascii "ERASE"
      00A85B 81 30                    6 	.word ERASE_IDX 
      00A85C                       5004 	_dict_entry,3,END,END_IDX;cmd_end  
      00A85C 4F CD                    1 	.word LINK 
                           002C1A     2 	LINK=.
      002C1A                          3 END:
      00A85E 86                       4 	.byte 3 	
      00A85F F7 5D 26                 5 	.ascii "END"
      00A862 05 A6                    6 	.word END_IDX 
      002C20                       5005 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      00A864 05 CC                    1 	.word LINK 
                           002C22     2 	LINK=.
      002C22                          3 EEPROM:
      00A866 92                       4 	.byte 6+F_IFUNC 	
      00A867 17 45 50 52 4F 4D        5 	.ascii "EEPROM"
      00A868 00 2C                    6 	.word EEPROM_IDX 
      002C2B                       5006 	_dict_entry,6+F_IFUNC,EEFREE,EEFREE_IDX; func_eefree 
      00A868 90 93                    1 	.word LINK 
                           002C2D     2 	LINK=.
      002C2D                          3 EEFREE:
      00A86A CD                       4 	.byte 6+F_IFUNC 	
      00A86B A8 53 26 F4 45 45        5 	.ascii "EEFREE"
      00A86F 00 CA                    6 	.word EEFREE_IDX 
      002C36                       5007 	_dict_entry,4,EDIT,EDIT_IDX ; edit 
      00A86F 90 CF                    1 	.word LINK 
                           002C38     2 	LINK=.
      002C38                          3 EDIT:
      00A871 00                       4 	.byte 4 	
      00A872 07 90 E6 02              5 	.ascii "EDIT"
      00A876 C7 00                    6 	.word EDIT_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



      002C3F                       5008 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      00A878 0A 35                    1 	.word LINK 
                           002C41     2 	LINK=.
      002C41                          3 DWRITE:
      00A87A 06                       4 	.byte 6+F_CMD 	
      00A87B 00 09 81 49 54 45        5 	.ascii "DWRITE"
      00A87E 00 28                    6 	.word DWRITE_IDX 
      002C4A                       5009 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      00A87E 72 5F                    1 	.word LINK 
                           002C4C     2 	LINK=.
      002C4C                          3 DREAD:
      00A880 00                       4 	.byte 5+F_IFUNC 	
      00A881 07 72 5F 00 08           5 	.ascii "DREAD"
      00A886 72 5F                    6 	.word DREAD_IDX 
      002C54                       5010 	_dict_entry,2,DO,DO_IDX;do_loop
      00A888 00 09                    1 	.word LINK 
                           002C56     2 	LINK=.
      002C56                          3 DO:
      00A88A 72                       4 	.byte 2 	
      00A88B 5F 00                    5 	.ascii "DO"
      00A88D 0A CD                    6 	.word DO_IDX 
      002C5B                       5011 	_dict_entry,3,DEC,DEC_IDX;dec_base
      00A88F 93 08                    1 	.word LINK 
                           002C5D     2 	LINK=.
      002C5D                          3 DEC:
      00A891 A1                       4 	.byte 3 	
      00A892 84 27 C7                 5 	.ascii "DEC"
      00A895 55 00                    6 	.word DEC_IDX 
      002C63                       5012 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      00A897 03 00                    1 	.word LINK 
                           002C65     2 	LINK=.
      002C65                          3 DDR:
      00A899 02                       4 	.byte 3+F_IFUNC 	
      00A89A CE 00 1B                 5 	.ascii "DDR"
      00A89D 00 20                    6 	.word DDR_IDX 
      002C6B                       5013 	_dict_entry,4,DATA,DATA_IDX;data  
      00A89D C3 00                    1 	.word LINK 
                           002C6D     2 	LINK=.
      002C6D                          3 DATA:
      00A89F 1D                       4 	.byte 4 	
      00A8A0 24 17 90 93              5 	.ascii "DATA"
      00A8A4 CD A8                    6 	.word DATA_IDX 
      002C74                       5014 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      00A8A6 53 27                    1 	.word LINK 
                           002C76     2 	LINK=.
      002C76                          3 CRL:
      00A8A8 C6                       4 	.byte 3+F_IFUNC 	
      00A8A9 43 52 4C                 5 	.ascii "CRL"
      00A8A9 93 E6                    6 	.word CRL_IDX 
      002C7C                       5015 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      00A8AB 02 C7                    1 	.word LINK 
                           002C7E     2 	LINK=.
      002C7E                          3 CRH:
      00A8AD 00                       4 	.byte 3+F_IFUNC 	
      00A8AE 0F 72 5F                 5 	.ascii "CRH"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



      00A8B1 00 0E                    6 	.word CRH_IDX 
      002C84                       5016 	_dict_entry,5,CONST,CONST_IDX; cmd_const 
      00A8B3 72 BB                    1 	.word LINK 
                           002C86     2 	LINK=.
      002C86                          3 CONST:
      00A8B5 00                       4 	.byte 5 	
      00A8B6 0E 20 E4 53 54           5 	.ascii "CONST"
      00A8B9 00 C8                    6 	.word CONST_IDX 
      002C8E                       5017 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      00A8B9 A6 0C                    1 	.word LINK 
                           002C90     2 	LINK=.
      002C90                          3 CHAR:
      00A8BB CC                       4 	.byte 4+F_CFUNC 	
      00A8BC 92 17 41 52              5 	.ascii "CHAR"
      00A8BE 00 18                    6 	.word CHAR_IDX 
      002C97                       5018 	_dict_entry,3,BYE,BYE_IDX;bye 
      00A8BE 52 06                    1 	.word LINK 
                           002C99     2 	LINK=.
      00A8C0                          3 BYE:
      00A8C0 C6                       4 	.byte 3 	
      00A8C1 00 09 C1                 5 	.ascii "BYE"
      00A8C4 00 0A                    6 	.word BYE_IDX 
      002C9F                       5019 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      00A8C6 27 37                    1 	.word LINK 
                           002CA1     2 	LINK=.
      002CA1                          3 BTOGL:
      00A8C8 CD                       4 	.byte 5 	
      00A8C9 9C 9E CE 00 07           5 	.ascii "BTOGL"
      00A8CE CF 00                    6 	.word BTOGL_IDX 
      002CA9                       5020 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      00A8D0 05 55                    1 	.word LINK 
                           002CAB     2 	LINK=.
      002CAB                          3 BTEST:
      00A8D2 00                       4 	.byte 5+F_IFUNC 	
      00A8D3 09 00 02 55 00           5 	.ascii "BTEST"
      00A8D8 0A 00                    6 	.word BTEST_IDX 
      002CB3                       5021 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      00A8DA 04 CD                    1 	.word LINK 
                           002CB5     2 	LINK=.
      002CB5                          3 BSET:
      00A8DC 97                       4 	.byte 4 	
      00A8DD C5 A1 84 27              5 	.ascii "BSET"
      00A8E1 03 CC                    6 	.word BSET_IDX 
      002CBC                       5022 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      00A8E3 92 15                    1 	.word LINK 
                           002CBE     2 	LINK=.
      00A8E5                          3 BRES:
      00A8E5 1F                       4 	.byte 4 	
      00A8E6 05 CD 93 08              5 	.ascii "BRES"
      00A8EA CE 00                    6 	.word BRES_IDX 
      002CC5                       5023 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      00A8EC 05 CF                    1 	.word LINK 
                           002CC7     2 	LINK=.
      002CC7                          3 BIT:
      00A8EE 00                       4 	.byte 3+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



      00A8EF 07 55 00                 5 	.ascii "BIT"
      00A8F2 02 00                    6 	.word BIT_IDX 
      002CCD                       5024 	_dict_entry,3,AWU,AWU_IDX;awu 
      00A8F4 09 CD                    1 	.word LINK 
                           002CCF     2 	LINK=.
      002CCF                          3 AWU:
      00A8F6 9C                       4 	.byte 3 	
      00A8F7 AE 1E 05                 5 	.ascii "AWU"
      00A8FA A6 84                    6 	.word AWU_IDX 
      002CD5                       5025 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      00A8FC 5B 06                    1 	.word LINK 
                           002CD7     2 	LINK=.
      002CD7                          3 ASC:
      00A8FE 81                       4 	.byte 3+F_IFUNC 	
      00A8FF 41 53 43                 5 	.ascii "ASC"
      00A8FF 90 CE                    6 	.word ASC_IDX 
      002CDD                       5026 	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
      00A901 00 07                    1 	.word LINK 
                           002CDF     2 	LINK=.
      002CDF                          3 AND:
      00A903 72                       4 	.byte 3+F_IFUNC 	
      00A904 5F 00 07                 5 	.ascii "AND"
      00A907 72 5F                    6 	.word AND_IDX 
      002CE5                       5027 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      00A909 00 08                    1 	.word LINK 
                           002CE7     2 	LINK=.
      002CE7                          3 ADCREAD:
      00A90B 72                       4 	.byte 7+F_IFUNC 	
      00A90C 5F 00 09 72 5F 00 0A     5 	.ascii "ADCREAD"
      00A913 CD A8                    6 	.word ADCREAD_IDX 
      002CF1                       5028 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      00A915 A9 20                    1 	.word LINK 
                           002CF3     2 	LINK=.
      002CF3                          3 ADCON:
      00A917 A8                       4 	.byte 5 	
      00A918 41 44 43 4F 4E           5 	.ascii "ADCON"
      00A918 CD 96                    6 	.word ADCON_IDX 
      002CFB                       5029 kword_dict::
      002CFB                       5030 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      00A91A B6 A1                    1 	.word LINK 
                           002CFD     2 	LINK=.
      002CFD                          3 ABS:
      00A91C 02                       4 	.byte 3+F_IFUNC 	
      00A91D 27 03 CC                 5 	.ascii "ABS"
      00A920 92 15                    6 	.word ABS_IDX 
                                   5031 
                                   5032 ;comands and fonctions address table 	
      00A922                       5033 code_addr::
      00A922 72 12 50 C7 85 5D 27  5034 	.word abs,power_adc,analog_read,bit_and,ascii,awu,bitmask ; 0..7
             21 85 A6 08 42 9F C7
      00A930 52 00 72 1A 50 14 72  5035 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             1A 50 16 72 14 52 00
      00A93E 72 12 52 01 72 10 52  5036 	.word const_cr1,data,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
             01 72 1C 52 00 81 F0
      00A94B 1B 54 27 C7 1F DA 21  5037 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto,gpio ; 24..31 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



             B8 25 27 22 52 1D 6F
             1F 40 1F 26 23 C6
      00A94B 5B 02 A6 82 C4 52 03  5038 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             A1 02 26 F7 72 1D 52
             00 72
      00A95B 13 50 C7 72 1B 50 16  5039 	.word let,list,log2,lshift,muldiv,next,new ; 40..47
             81 15 BB 1D EF 21 77
      00A963 26 98 27 9D 24 C5 29  5040 	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             4F 24 37 25 33 1D 4A
             27 C1
      00A963 A6 78 C5 52 03 27 04  5041 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             72 5F 52 03 81 27 79
             27 7F
      00A96F 27 85 27 8B 27 91 27  5042 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             97 23 B9 28 3E 0F 08
             1C B8
      00A96F 88 CD A9 63 84 72 03  5043 	.word restore,return, random,rshift,run,show,free ; 72..79
             52 03 FB C7 52 04 72
      00A97D 01 52 03 FB C6 52 04  5044 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             81 29 10 1D C8 21 2B
             24 93
      00A985 26 7C 26 8B 1D 98 20  5045 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             0C 18 77 23 F0 27 39
             24 06
      00A985 A6 FF 72 01 52 03 E3  5046 	.word wait,words,write,bit_xor,cmd_size,cmd_on,cmd_get,cmd_const ; 96..99
             C6 52 04 81 9D 1F E1
             19 83
      00A990 19 15 00 00           5047 	.word func_eefree,0 
                                   5048 
                                   5049 
                                   5050 
                                   5051 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
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
      002E00                         28 	.bndry 128 ; align on FLASH block.
                                     29 ; space for user application  
      002E00                         30 app_space::
      00A990 CD 97                   31 app_sign: .word 0 ; .ascii "BC"  ; signature 
      00A992 C5 A1                   32 app_size: .word 0 ; 31 
      002E04                         33 app: 
                                     34 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     35 ;;  BASIC code demo 'BLINK.BAS' 
                                     36 ;; 10 do btogl $500a,32 pause 250 until qkey bres $500a,32 end 
                                     37 ;; byte code generated by compiler.
                                     38 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     39 ;.byte 0,10,31,128,0,38,128,0,20,132,80,10,9,132,0,32,128
                                     40 ;.byte 0,100,132,0,250,128,0,182,129,0,132,128,0,46
                                     41 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   4 ABS        002CFD R   |     ABS_IDX =  000000 
    ACC24   =  000007     |     ACK     =  000006     |   4 ADCON      002CF3 R
    ADCON_ID=  000002     |   4 ADCREAD    002CE7 R   |     ADCREAD_=  000004 
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
  4 AND        002CDF R   |     AND_IDX =  000006     |     AREG    =  000002 
    ARG_OFS =  000002     |     ARROW_LE=  000080     |     ARROW_RI=  000081 
  4 ASC        002CD7 R   |     ASC_IDX =  000008     |     ATTRIB  =  000002 
    AUTORUN_=  004000     |   4 AUTO_RUN   000F9B R   |   4 AWU        002CCF R
  4 AWUHandl   000004 R   |     AWU_APR =  0050F1     |     AWU_CSR =  0050F0 
    AWU_CSR_=  000004     |     AWU_IDX =  00000A     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
    BASE    =  000002     |     BASE_SAV=  000001     |     BCNT    =  000001 
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |     BELL    =  000007     |     BINARY  =  000001 
  4 BIT        002CC7 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
    BIT_IDX =  00000C     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  00000B     |   4 BRES       002CBE R
    BRES_IDX=  00000E     |     BS      =  000008     |     BSAVE   =  000001 
  4 BSET       002CB5 R   |     BSET_IDX=  000010     |     BSIZE   =  000006 
  4 BTEST      002CAB R   |     BTEST_ID=  000012     |   4 BTOGL      002CA1 R
    BTOGL_ID=  000014     |     BTW     =  000001     |     BUFPTR  =  000003 
  4 BYE        002C99 R   |     BYE_IDX =  000016     |     C       =  000001 
    CAN     =  000018     |   4 CANT_DO    0022E9 R   |     CAN_DGR =  005426 
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
    CC_Z    =  000001     |     CELL_SIZ=  000002     |     CFG_GCR =  007F60 
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   4 CHAR       002C90 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]

Symbol Table

    CHAR_IDX=  000018     |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
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
    CNT_LO  =  000004     |     COMMA   =  00002C     |   4 CONST      002C86 R
  4 CONST_CO   001900 R   |     CONST_ID=  0000C8     |     COUNT   =  000003 
    CPOS    =  000003     |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
    CR      =  00000D     |   4 CRH        002C7E R   |     CRH_IDX =  00001A 
  4 CRL        002C76 R   |     CRL_IDX =  00001C     |     CTRL_A  =  000001 
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
    CVAR    =  000007     |     CX_BPTR =  000001     |     CX_CNT  =  000004 
    CX_IN   =  000003     |   4 DATA       002C6D R   |     DATA_IDX=  00001E 
    DBG_A   =  000005     |     DBG_CC  =  000006     |     DBG_X   =  000003 
    DBG_Y   =  000001     |     DBL     =  000003     |     DBLDIVDN=  000006 
    DBLHI   =  000001     |     DBLLO   =  000003     |     DBL_SIZE=  000004 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   4 DDR        002C65 R   |     DDR_IDX =  000020 
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
    DEBUG_PR=  000001     |   4 DEC        002C5D R   |     DEC_IDX =  000022 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]

Symbol Table

    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   4 DO         002C56 R
    DOLP_ADR=  000003     |     DOLP_INW=  000005     |     DO_IDX  =  000024 
  4 DREAD      002C4C R   |     DREAD_ID=  000026     |   4 DWRITE     002C41 R
    DWRITE_I=  000028     |   4 EDIT       002C38 R   |     EDIT_IDX=  00002A 
  4 EEFREE     002C2D R   |     EEFREE_I=  0000CA     |   4 EEPROM     002C22 R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_I=  00002C 
    EEPROM_S=  000800     |     EEPTR   =  000003     |     EM      =  000019 
  4 END        002C1A R   |     END_IDX =  00002E     |     ENQ     =  000005 
    EOF     =  0000FF     |     EOT     =  000004     |   4 ERASE      002C10 R
    ERASE_ID=  000030     |     ERR_BAD_=  00000A     |     ERR_BUF_=  00000F 
    ERR_CMD_=  000007     |     ERR_DIV0=  000004     |     ERR_DUPL=  000008 
    ERR_MATH=  000003     |     ERR_MEM_=  000001     |     ERR_NONE=  000000 
    ERR_NOT_=  000009     |     ERR_NO_A=  00000B     |     ERR_NO_D=  00000C 
    ERR_NO_F=  00000E     |     ERR_NO_L=  000005     |     ERR_NO_P=  00000D 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    ETB     =  000017     |     ETX     =  000003     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FAUTORUN=  000006     |     FBREAK  =  000004 
    FCOMP   =  000005     |   4 FCPU       002C07 R   |     FCPU_IDX=  000032 
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
    FLASH_IA=  000000     |   4 FLASH_ME   001A91 R   |     FLASH_NC=  00505C 
    FLASH_NF=  00505E     |     FLASH_NF=  000000     |     FLASH_NF=  000001 
    FLASH_NF=  000002     |     FLASH_NF=  000003     |     FLASH_NF=  000004 
    FLASH_NF=  000005     |     FLASH_PU=  005062     |     FLASH_PU=  000056 
    FLASH_PU=  0000AE     |     FLASH_SI=  020000     |     FLASH_WS=  00480D 
    FLOOP   =  000002     |     FLSI    =  01F400     |   4 FOR        002BFF R
    FOR_IDX =  000036     |   4 FREE       002BF6 R   |     FREE_IDX=  000098 
    FRUN    =  000000     |     FS      =  00001C     |     FSLEEP  =  000003 
    FSTEP   =  000003     |     FTRAP   =  000001     |     FUPDATE =  000007 
    F_CFUNC =  000080     |     F_CMD   =  000000     |     F_CONST =  0000C0 
    F_IFUNC =  000040     |   4 GET        002BEE R   |     GET_IDX =  0000C6 
  4 GOSUB      002BE4 R   |     GOSUB_ID=  000038     |   4 GOTO       002BDB R
    GOTO_IDX=  00003A     |   4 GPIO       002BD2 R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_IDX=  00003C     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |     GS      =  00001D     |   4 HEX        002BCA R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]

Symbol Table

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
  4 IDR        002BC2 R   |     IDR_IDX =  000040     |   4 IF         002BBB R
    IF_IDX  =  000042     |     IN      =  000005     |     INCR    =  000001 
    INP     =  000000     |   4 INPUT      002BB1 R   |     INPUT_DI=  000000 
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
    INT_VECT=  00805C     |     INT_VECT=  008058     |   4 INVERT     002BA6 R
    INVERT_I=  000046     |     INW     =  000009     |     IPOS    =  000001 
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |   4 IWDGEN     002B9B R
    IWDGEN_I=  000048     |   4 IWDGREF    002B8F R   |     IWDGREF_=  00004A 
    IWDG_KEY=  000055     |     IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
    KCHAR   =  000002     |   4 KEY        002B87 R   |     KEY_END =  000083 
    KEY_IDX =  00004C     |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000002     |   4 LET        002B7F R   |     LET_IDX =  00004E 
    LF      =  00000A     |     LIMIT   =  000001     |     LINENO  =  000005 
  4 LINK    =  002CFD R   |   4 LIST       002B76 R   |     LIST_IDX=  000050 
    LL      =  000001     |     LLEN    =  000002     |     LL_HB   =  000001 
    LN_PTR  =  000005     |   4 LOG        002B6E R   |     LOG_IDX =  000052 
  4 LSHIFT     002B63 R   |     LSHIFT_I=  000054     |     MAJOR   =  000002 
    MASK    =  000002     |     MATH_OVF=  000000     |     MAX_LINE=  007FFF 
    MINOR   =  000000     |   4 MULDIV     002B58 R   |     MULDIV_I=  000056 
    MULOP   =  000003     |     N1      =  000001     |     N2      =  000003 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]

Symbol Table

    NAFR    =  004804     |     NAK     =  000015     |     NAMEPTR =  000001 
    NCLKOPT =  004808     |     NEG     =  000001     |   4 NEW        002B50 R
    NEW_IDX =  00005A     |   4 NEXT       002B47 R   |     NEXT_IDX=  000058 
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NLEN    =  000001 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   4 NOT        002B3F R
    NOT_IDX =  00005C     |   4 NOT_SAVE   001B81 R   |   4 NO_APP     00232B R
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  4 NonHandl   000000 R   |   4 ODR        002B37 R   |     ODR_IDX =  00005E 
  4 ON         002B30 R   |     ONOFF   =  000003     |     ON_IDX  =  0000C4 
    OP      =  000005     |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   4 OR         002B29 R
    OR_IDX  =  000060     |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVFH    =  000001     |     OVFL    =  000002     |     OVRWR   =  000004 
    PA      =  000000     |   4 PAD        002B21 R   |     PAD_IDX =  000062 
    PAD_SIZE=  000080     |   4 PAUSE      002B17 R   |     PAUSE_ID=  000064 
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   4 PEEK       002B0E R   |     PEEK_IDX=  000068 
    PE_BASE =  005014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_BASE =  005019     |     PF_CR1  =  00501C 
    PF_CR2  =  00501D     |     PF_DDR  =  00501B     |     PF_IDR  =  00501A 
    PF_ODR  =  005019     |     PG      =  00001E     |     PG_BASE =  00501E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |     PH      =  000023 
    PH_BASE =  005023     |     PH_CR1  =  005026     |     PH_CR2  =  005027 
    PH_DDR  =  005025     |     PH_IDR  =  005024     |     PH_ODR  =  005023 
    PI      =  000028     |     PINNO   =  000001     |   4 PINP       002B05 R
    PINP_IDX=  00006A     |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   4 PMODE      002AFB R
    PMODE_ID=  000066     |   4 POKE       002AF2 R   |     POKE_IDX=  00006C 
    PORT    =  000003     |   4 POUT       002AE9 R   |     POUT_IDX=  00006E 
    PREV    =  000001     |   4 PRINT      002ADF R   |   4 PROG_ADD   001A68 R
  4 PROG_SIZ   001A7A R   |   4 PRTA       002AD6 R   |     PRTA_IDX=  000072 
  4 PRTB       002ACD R   |     PRTB_IDX=  000074     |   4 PRTC       002AC4 R
    PRTC_IDX=  000076     |   4 PRTD       002ABB R   |     PRTD_IDX=  000078 
  4 PRTE       002AB2 R   |     PRTE_IDX=  00007A     |   4 PRTF       002AA9 R
    PRTF_IDX=  00007C     |   4 PRTG       002AA0 R   |     PRTG_IDX=  00007E 
  4 PRTH       002A97 R   |     PRTH_IDX=  000080     |   4 PRTI       002A8E R
    PRTI_IDX=  000082     |     PRT_IDX =  000070     |     PSTR    =  000003 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]

Symbol Table

  4 QKEY       002A85 R   |     QKEY_IDX=  000084     |     RAM_BASE=  000000 
    RAM_END =  0017FF     |   4 RAM_MEM    001AA2 R   |     RAM_SIZE=  001800 
    RBT_IDX =  000088     |   4 READ       002A7C R   |     READ_IDX=  000086 
  4 REBOOT     002A71 R   |     RECLEN  =  000005     |     REG     =  000001 
    REGA    =  000001     |     REGX    =  000003     |     REGY    =  000005 
    RELOP   =  000003     |   4 REMARK     002A66 R   |     REM_IDX =  00008A 
  4 RESTORE    002A5A R   |     REST_IDX=  00008C     |     RETL1   =  000001 
  4 RETURN     002A4F R   |     RET_ADDR=  000003     |     RET_IDX =  00008E 
    RET_INW =  000005     |   4 RND        002A47 R   |     RND_IDX =  000090 
    ROP     =  004800     |     RS      =  00001E     |   4 RSHIFT     002A3C R
    RSHIFT_I=  000092     |     RST_SR  =  0050B3     |   4 RUN        002A34 R
    RUN_IDX =  000094     |     RXCHAR  =  000001     |     RX_QUEUE=  000008 
  4 SAVE       002A2B R   |     SAVEB   =  000002     |     SAVE_IDX=  000034 
    SDIVSR  =  000005     |     SEPARATE=  000000     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |   4 SHOW       002A22 R
    SHOW_IDX=  000096     |     SI      =  00000F     |     SIGN    =  000001 
  4 SIGNATUR   0022E7 R   |   4 SIZE       002A19 R   |     SIZE_IDX=  0000C2 
    SKIP    =  000005     |   4 SLEEP      002A0F R   |     SLEEP_ID=  00009A 
    SO      =  00000E     |     SOH     =  000001     |     SPACE   =  000020 
  4 SPIEN      002A05 R   |     SPIEN_ID=  00009E     |   4 SPIRD      0029FB R
    SPIRD_ID=  00009C     |   4 SPISEL     0029F0 R   |     SPISEL_I=  0000A0 
  4 SPIWR      0029E6 R   |     SPIWR_ID=  0000A2     |     SPI_CR1 =  005200 
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
    STACK_EM=  0017FF     |     STACK_SI=  0000A0     |   4 STEP       0029DD R
    STEP_IDX=  0000A4     |   4 STOP       0029D4 R   |     STOP_IDX=  0000A6 
    STR     =  000003     |   4 STR_BYTE   001A8B R   |     STX     =  000002 
    SUB     =  00001A     |     SUP     =  000084     |     SWIM_CSR=  007F80 
    SYN     =  000016     |     TAB     =  000009     |     TABW    =  000004 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   4 TICKS      0029CA R
    TICKS_ID=  0000A8     |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM2_CCR=  005314     |     TIM2_CLK=  00F424     |     TIM2_CNT=  00530A 
    TIM2_CNT=  00530B     |     TIM2_CR1=  005300     |     TIM2_CR1=  000007 
    TIM2_CR1=  000000     |     TIM2_CR1=  000003     |     TIM2_CR1=  000001 
    TIM2_CR1=  000002     |     TIM2_EGR=  005304     |     TIM2_EGR=  000001 
    TIM2_EGR=  000002     |     TIM2_EGR=  000003     |     TIM2_EGR=  000006 
    TIM2_EGR=  000000     |     TIM2_IER=  005301     |     TIM2_PSC=  00530C 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_CR1=  000001     |     TIM4_CR1=  000002     |     TIM4_EGR=  005343 
    TIM4_EGR=  000000     |     TIM4_IER=  005341     |     TIM4_IER=  000000 
    TIM4_PSC=  005345     |     TIM4_PSC=  000000     |     TIM4_PSC=  000007 
    TIM4_PSC=  000004     |     TIM4_PSC=  000001     |     TIM4_PSC=  000005 
    TIM4_PSC=  000002     |     TIM4_PSC=  000006     |     TIM4_PSC=  000003 
    TIM4_PSC=  000000     |     TIM4_PSC=  000001     |     TIM4_PSC=  000002 
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   4 TIMEOUT    0029BE R
  4 TIMER      0029B4 R   |     TIMER_ID=  0000AA     |     TIM_CR1_=  000007 
    TIM_CR1_=  000000     |     TIM_CR1_=  000006     |     TIM_CR1_=  000005 
    TIM_CR1_=  000004     |     TIM_CR1_=  000003     |     TIM_CR1_=  000001 
    TIM_CR1_=  000002     |     TK_ARRAY=  000005     |     TK_CFUNC=  000082 
    TK_CHAR =  000004     |     TK_CMD  =  000080     |     TK_COLON=  00000A 
    TK_COMMA=  000008     |     TK_CONST=  000083     |     TK_DIV  =  000021 
    TK_EQUAL=  000032     |     TK_GE   =  000033     |     TK_GRP_A=  000010 
    TK_GRP_M=  000030     |     TK_GRP_M=  000000     |     TK_GRP_M=  000020 
    TK_GRP_R=  000030     |     TK_GT   =  000031     |     TK_IFUNC=  000081 
    TK_INTGR=  000084     |     TK_LABEL=  000003     |     TK_LE   =  000036 
    TK_LPARE=  000006     |     TK_LT   =  000034     |     TK_MINUS=  000011 
    TK_MOD  =  000022     |     TK_MULT =  000020     |     TK_NE   =  000035 
    TK_NONE =  000000     |     TK_PLUS =  000010     |     TK_QSTR =  000002 
    TK_RPARE=  000007     |     TK_SHARP=  000009     |     TK_VAR  =  000085 
    TMROUT_I=  0000AC     |   4 TO         0029AD R   |   4 TONE       0029A4 R
    TONE_IDX=  0000B0     |     TOWRITE =  000005     |     TO_IDX  =  0000AE 
  4 Timer4Up   000012 R   |     U1      =  000001     |     U8      =  000003 
    UART1   =  000000     |     UART1_BA=  005230     |     UART1_BR=  005232 
    UART1_BR=  005233     |     UART1_CR=  005234     |     UART1_CR=  005235 
    UART1_CR=  005236     |     UART1_CR=  005237     |     UART1_CR=  005238 
    UART1_DR=  005231     |     UART1_GT=  005239     |     UART1_PO=  000000 
    UART1_PS=  00523A     |     UART1_RX=  000004     |     UART1_SR=  005230 
    UART1_TX=  000005     |     UART2   =  000001     |     UART3   =  000002 
    UART3_BA=  005240     |     UART3_BR=  005242     |     UART3_BR=  005243 
    UART3_CR=  005244     |     UART3_CR=  005245     |     UART3_CR=  005246 
    UART3_CR=  005247     |     UART3_CR=  004249     |     UART3_DR=  005241 
    UART3_PO=  00000F     |     UART3_RX=  000006     |     UART3_SR=  005240 
    UART3_TX=  000005     |     UART_BRR=  000002     |     UART_BRR=  000003 
    UART_CR1=  000004     |     UART_CR1=  000004     |     UART_CR1=  000002 
    UART_CR1=  000000     |     UART_CR1=  000001     |     UART_CR1=  000007 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]

Symbol Table

  4 UBOUND     002999 R   |     UBOUND_I=  0000B2     |   4 UBTN_Han   00004B R
  4 UFLASH     00298E R   |     UFLASH_I=  0000B4     |   4 UNTIL      002984 R
    UNTIL_ID=  0000B6     |     US      =  00001F     |   4 USER_ABO   00005E R
  4 USR        00297C R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     USR_IDX =  0000B8     |   4 Uart1RxH   0002C0 R
  4 UserButt   000027 R   |     VAR_ADDR=  000006     |     VSISE   =  000003 
    VSIZ    =  000002     |     VSIZE   =  000006     |     VT      =  00000B 
  4 WAIT       002973 R   |     WAIT_IDX=  0000BA     |     WCNT    =  000003 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |     WIDTH_SA=  000002 
    WLEN    =  000001     |   4 WORDS      002969 R   |     WORDS_ID=  0000BC 
  4 WRITE      00295F R   |     WRITE_ID=  0000BE     |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XFIRST  =  000001     |     XMASK   =  000001 
    XOFF    =  000013     |     XON     =  000011     |   4 XOR        002957 R
    XOR_IDX =  0000C0     |     XREG    =  000003     |     XSAVE   =  000005 
    XTEMP   =  000001     |     YSAVE   =  000004     |     YTEMP   =  000003 
  4 abs        002499 R   |   5 acc16      00000D GR  |   5 acc24      00000C GR
  5 acc32      00000B R   |   5 acc8       00000E GR  |   4 accept_c   0005FB R
  4 add_char   000D44 R   |   4 add_spac   000B44 R   |   4 analog_r   00208C R
  4 app        002E04 R   |   4 app_sign   002E00 R   |   4 app_size   002E02 R
  4 app_spac   002E00 GR  |   4 arduino_   00258F R   |   4 arg_list   001636 R
  5 array_si   00001F R   |   4 ascii      00238A R   |   4 at_tst     0009B2 R
  4 atoi24     0013F0 GR  |   4 atoi_exi   001456 R   |   4 awu        00244A R
  4 awu02      002454 R   |   4 bad_port   0023EB R   |   5 base       00000A GR
  5 basicptr   000004 GR  |   4 beep       002019 R   |   4 beep_1kh   002003 GR
  4 bin_exit   00082E R   |   4 bit_and    0024AD R   |   4 bit_or     0024C5 R
  4 bit_rese   001CF3 R   |   4 bit_set    001CE3 R   |   4 bit_test   001D14 R
  4 bit_togg   001D04 R   |   4 bit_xor    0024DD R   |   4 bitmask    0026FB R
  4 bkslsh_t   00095F R   |   4 bksp       000399 R   |   2 block_bu   0016E0 GR
  4 block_er   0001EA R   |   4 break_po   002159 R   |   4 bye        002423 R
  4 char       002378 R   |   4 clear_ba   000FFD R   |   4 clear_bl   00223E R
  4 clear_va   000EB3 R   |   4 clock_in   000079 R   |   4 cmd_cons   001983 R
  4 cmd_end    001FDA R   |   4 cmd_get    001FE1 R   |   4 cmd_line   00121C R
  4 cmd_name   000D64 R   |   4 cmd_on     001E9D R   |   4 cmd_size   00184A R
  4 code_add   002D03 GR  |   4 cold_sta   000F08 R   |   4 colon_ts   000986 R
  4 comma_ts   000991 R   |   4 comp_msg   001174 R   |   4 compile    000AB7 GR
  4 const_cr   0027AF R   |   4 const_cr   0027B5 R   |   4 const_dd   0027A9 R
  4 const_ee   0027C7 R   |   4 const_id   0027A3 R   |   4 const_in   0027C1 R
  4 const_od   00279D R   |   4 const_ou   0027BB R   |   4 const_po   002767 R
  4 const_po   00276D R   |   4 const_po   002773 R   |   4 const_po   002779 R
  4 const_po   00277F R   |   4 const_po   002785 R   |   4 const_po   00278B R
  4 const_po   002791 R   |   4 const_po   002797 R   |   4 convert_   0007A5 R
  4 convert_   00035D R   |   4 copy_com   0009E7 R   |   5 count      000003 GR
  4 cp_loop    0015E5 R   |   4 cpy_cmd_   000B2F R   |   4 cpy_quot   000B68 R
  4 create_g   0006CF R   |   4 cs_high    00294A R   |   4 cstk_pro   001800 R
  4 dash_tst   0009A7 R   |   4 data       0027CD R   |   5 data_len   000009 R
  4 data_lin   0027DC R   |   5 data_ofs   000008 R   |   5 data_ptr   000006 R
  4 data_sea   00281D R   |   4 dbl_sign   00153F R   |   4 dec_base   00182C R
  4 decomp_l   000C19 R   |   4 decompil   000BD2 GR  |   4 del_line   0006A2 R
  4 delete_l   000486 R   |   4 delete_n   0003A9 R   |   4 delete_u   00044B R
  4 digital_   0020C0 R   |   4 digital_   0020F0 R   |   4 div32_16   001549 R
  4 divide     0015A0 R   |   4 divu24_8   00135F R   |   4 dneg       001534 R
  4 do_loop    002724 R   |   4 do_progr   0001DD R   |   4 edit       001B54 R
  4 enable_i   0026A5 R   |   4 eql_tst    000A3C R   |   4 equal      000D57 R
  4 erase      0021B8 R   |   4 erase_ex   000209 R   |   4 erase_fl   0001FF R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]

Symbol Table

  4 err_bad_   0010DF R   |   4 err_buf_   001155 R   |   4 err_cmd_   0010A3 R
  4 err_div0   001068 R   |   4 err_dupl   0010BD R   |   4 err_math   00104F R
  4 err_mem_   001034 R   |   4 err_msg    001014 R   |   4 err_no_a   0010EB R
  4 err_no_d   00111E R   |   4 err_no_f   001142 R   |   4 err_no_l   001077 R
  4 err_no_p   00112E R   |   4 err_not_   0010CE R   |   4 err_run_   00108D R
  4 err_synt   001041 R   |   4 escaped    0007BA GR  |   4 expect     001624 R
  4 expr_exi   00178B R   |   4 expressi   001745 R   |   4 factor     001686 R
  5 farptr     000017 R   |   4 fcpu       002527 R   |   4 fill_wri   00222E R
  4 final_te   0005F4 R   |   4 first_li   001AFE R   |   5 flags      000021 GR
  4 for        001D6F R   |   4 free       001831 R   |   5 free_eep   000023 R
  7 free_ram   000080 R   |   4 func_arg   001631 R   |   4 func_eef   001915 R
  4 func_not   002698 R   |   4 ge         000D59 R   |   4 get_arra   001661 R
  4 get_cmd_   000BB1 R   |   4 get_cons   0018AC R   |   4 get_esca   000369 R
  4 get_targ   001E39 R   |   4 get_targ   001E47 R   |   4 get_tick   002493 R
  4 get_toke   0008F8 GR  |   4 getc       000342 GR  |   4 gosub      001F40 R
  4 goto       001F26 R   |   4 gpio       0023C6 R   |   4 gt         000D55 R
  4 gt_tst     000A47 R   |   4 hex_base   001827 R   |   4 hex_dump   000E04 R
  4 if         001D5B R   |   5 in         000001 GR  |   5 in.saved   000002 GR
  5 in.w       000000 GR  |   4 incr_far   00219C R   |   4 input_ex   001CB5 R
  4 input_lo   001C40 R   |   4 input_va   001C3E R   |   4 insert_c   000408 R
  4 insert_l   0006FB R   |   4 insert_l   00076A R   |   4 interp_l   00125D R
  4 interpre   001238 R   |   4 invert     002715 R   |   4 is_alnum   000863 GR
  4 is_alpha   000849 GR  |   4 is_data_   0027D3 R   |   4 is_digit   00085A GR
  4 is_symbo   00086C R   |   4 itoa       0012F4 GR  |   4 itoa_loo   001319 R
  4 jp_to_ta   001F33 R   |   4 key        0023B1 R   |   4 kword_di   002CFB GR
  4 kword_en   002955 R   |   4 le         000D5E R   |   4 leading_   0026EB R
  4 let        001881 GR  |   4 let_arra   00188F R   |   4 let_var    001892 R
  4 lines_sk   001B01 R   |   4 list       001AB1 R   |   4 list_con   0018BB R
  4 list_exi   001B43 R   |   4 list_loo   001B21 R   |   4 log2       0026E0 R
  4 logical_   00268E R   |   4 long_div   00151C R   |   4 look_tar   001E63 R
  4 loop_bac   001E1C R   |   5 loop_dep   00001E R   |   4 loop_don   001E31 R
  4 lshift     0024F5 R   |   4 lt         000D5C R   |   4 lt_tst     000A70 R
  4 modulo     0015B6 R   |   4 move       000E6F GR  |   4 move_dow   000E8E R
  4 move_era   00016C R   |   4 move_exi   000EAF R   |   4 move_lef   0003E0 R
  4 move_loo   000E93 R   |   4 move_prg   0001AC R   |   4 move_rig   0003EE R
  4 move_up    000E80 R   |   4 mul_char   000D46 R   |   4 muldiv     0015BB R
  4 multiply   0014E7 R   |   4 mulu24_8   001387 R   |   4 nbr_tst    00092B R
  4 ne         000D61 R   |   4 neg_acc2   0013C1 R   |   4 new        002177 R
  4 next       001DEF R   |   4 next_lin   001240 R   |   4 next_tok   001288 GR
  4 no_match   0015F7 R   |   4 other      000A99 R   |   4 overwrit   000620 R
  2 pad        0016E0 GR  |   4 pad_ref    00294F R   |   4 parse_bi   00080C R
  4 parse_in   0007C2 R   |   4 parse_ke   00088F R   |   4 parse_qu   00076D R
  4 parse_sy   000877 R   |   4 pause      002437 R   |   4 pause02    002441 R
  4 peek       001D4A R   |   4 pin_mode   002533 R   |   4 plus_tst   000A10 R
  4 poke       001D3B R   |   4 power_ad   002050 R   |   4 prcnt_ts   000A31 R
  4 print      001BB8 R   |   4 print_ex   001C12 R   |   4 print_he   000655 GR
  4 print_in   0012D8 R   |   4 printxy    00145A R   |   4 prog_siz   001A21 R
  4 program_   001A29 R   |   4 program_   000186 R   |   4 program_   0001AC R
  4 prt_basi   001B98 R   |   4 prt_loop   001BBC R   |   4 prt_regs   0000B1 R
  4 prt_tok    000D96 R   |   4 prti24     0012E8 R   |   5 ptr16      000018 GR
  5 ptr8       000019 R   |   4 putc       000332 GR  |   4 puts       00038F GR
  4 qgetc      00033B GR  |   4 qkey       0023B9 GR  |   4 qmark_ts   0009BD R
  4 qsign      002227 R   |   4 random     0025AF R   |   4 read       00283E R
  4 read01     002840 R   |   4 readln     000494 GR  |   4 readln_l   0004A1 R
  4 readln_q   00063D R   |   4 refresh_   0026DB R   |   4 rel_exit   0017E3 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]

Symbol Table

  4 relation   00178E R   |   4 relop_st   000D49 R   |   4 remark     001CB8 GR
  4 reset_co   001BBA R   |   4 rest_con   001C2E R   |   4 restore    0027FE R
  4 restore_   002839 R   |   4 return     001F60 R   |   4 right_al   000B56 GR
  4 row_alig   002181 R   |   4 row_eras   00013F R   |   4 row_eras   00016C R
  4 row_loop   000DE7 R   |   4 rparnt_t   00097B R   |   4 rshift     00250E R
  7 rsign      00007C R   |   7 rsize      00007E R   |   4 rt_msg     001162 R
  4 run        001F7E R   |   4 run_app    000F80 R   |   4 run_it     001FB0 R
  4 run_it_0   001FB2 R   |   5 rx1_head   00002D R   |   5 rx1_queu   000025 R
  5 rx1_tail   00002E R   |   4 save_app   002252 R   |   4 save_con   001C1E R
  4 scan_blo   0021AA R   |   4 search_c   00193F R   |   4 search_d   0015D7 GR
  4 search_e   001621 R   |   4 search_l   000677 GR  |   4 search_l   000686 R
  4 search_n   0015DB R   |   5 seedx      000013 R   |   5 seedy      000015 R
  4 select_p   00257F R   |   4 send_esc   0003B7 R   |   4 send_par   0003C2 R
  4 set_data   0027EF R   |   4 set_time   00267C R   |   4 sharp_ts   00099C R
  4 show       0017E6 R   |   4 show_row   000DD5 R   |   4 single_c   000D3F R
  4 skip       0008E5 R   |   4 slash_ts   000A26 R   |   4 sleep      00242C R
  4 software   000EC2 R   |   4 spaces     0003FC GR  |   4 spi_clea   0028E3 R
  4 spi_disa   0028CB R   |   4 spi_enab   002898 R   |   4 spi_rcv_   002905 R
  4 spi_read   002930 R   |   4 spi_sele   002938 R   |   4 spi_send   0028EF R
  4 spi_writ   002910 R   |   2 stack_fu   001760 GR  |   2 stack_un   001800 R
  4 star_tst   000A1B R   |   4 step       001DC8 R   |   4 stop       00212B R
  4 store_lo   001DDC R   |   4 str_matc   001604 R   |   4 str_tst    00091B R
  4 strcmp     000E4E R   |   4 strcpy     000E5F GR  |   4 strlen     000E43 GR
  4 symb_loo   000878 R   |   4 syntax_e   001195 GR  |   4 system_i   000FAE R
  5 tab_widt   000022 GR  |   4 tb_error   001197 GR  |   4 term       0016F3 R
  4 term01     0016FB R   |   4 term_exi   001742 R   |   2 tib        001690 GR
  4 tick_tst   0009D5 R   |   5 ticks      00000F R   |   4 timeout    00268B R
  5 timer      000011 GR  |   4 timer2_i   00008F R   |   4 timer4_i   00009C R
  4 tk_id      001185 R   |   4 to         001D98 R   |   4 to_eepro   0001D5 R
  4 to_flash   0001DA R   |   4 to_hex_c   00066C GR  |   4 to_upper   0013E4 GR
  4 token_ch   000AB0 R   |   4 token_ex   000AB4 R   |   4 token_ms   000DCD R
  4 tone       00200C R   |   4 try_next   002829 R   |   5 txtbgn     00001A GR
  5 txtend     00001C GR  |   4 uart1_ge   000342 GR  |   4 uart1_in   0002ED R
  4 uart1_pu   000332 GR  |   4 uart1_qg   00033B GR  |   4 uart1_se   0002FD R
  4 ubound     001877 R   |   4 udiv32_1   00150A R   |   4 uflash     0023F0 R
  4 umstar     0014AD R   |   4 unlock_e   000109 R   |   4 unlock_f   000124 R
  4 until      002739 R   |   4 user_int   00003A R   |   4 usr        002406 R
  4 var_name   000BA9 GR  |   5 vars       00002F GR  |   4 wait       001CBE R
  4 warm_ini   000FDF R   |   4 warm_sta   001219 R   |   4 words      002616 R
  4 words_co   002666 R   |   4 write      002341 R   |   4 write_bl   000285 GR
  4 write_bu   0001C6 R   |   4 write_by   00020B R   |   4 write_ee   000247 R
  4 write_ex   000280 R   |   4 write_fl   000231 R   |   4 write_nb   0002AA R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 SSEG       size      0   flags    8
   2 SSEG0      size    170   flags    8
   3 HOME       size     80   flags    0
   4 CODE       size   2E04   flags    0
   5 DATA       size     63   flags    0
   6 BTXT       size      0   flags    8
   7 BTXT1      size      4   flags    8

