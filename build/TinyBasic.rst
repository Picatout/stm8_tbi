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
                           0000C8   125     GET_IDX=ON_IDX+2 
                                    126         
                                    127 
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
      008000 82 00 8F 56             51     int cold_start			; RESET vector 
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
      008093 CE 00 10         [ 2]  132 	ldw x,ticks
      008096 5C               [ 1]  133 	incw x
      008097 CF 00 10         [ 2]  134 	ldw ticks,x 
      00809A CE 00 12         [ 2]  135 	ldw x,timer
                                    136 ;	tnzw x 
      00809D 27 04            [ 1]  137 	jreq 1$
      00809F 5A               [ 2]  138 	decw x 
      0080A0 CF 00 12         [ 2]  139 	ldw timer,x 
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
      0080AD 72 07 00 22 05   [ 2]  156     btjf flags,#FSLEEP,2$
      0080B2 72 17 00 22      [ 1]  157 	bres flags,#FSLEEP 
      0080B6 80               [11]  158 	iret
      0080B7                        159 2$:	
      0080B7                        160 user_interrupted:
      0080B7 72 00 00 22 02   [ 2]  161     btjt flags,#FRUN,4$
      0080BC 20 0A            [ 2]  162 	jra UBTN_Handler_exit 
      0080BE                        163 4$:	; program interrupted by user 
      0080BE 72 11 00 22      [ 1]  164 	bres flags,#FRUN 
      0080C2 AE 80 DB         [ 2]  165 	ldw x,#USER_ABORT
      0080C5 CD 83 CE         [ 4]  166 	call puts 
      0080C8                        167 UBTN_Handler_exit:
      0080C8 AE 17 FF         [ 2]  168     ldw x,#STACK_EMPTY 
      0080CB 94               [ 1]  169     ldw sp,x
      0080CC 9A               [ 1]  170 	rim 
      0080CD CE 00 1B         [ 2]  171 	ldw x,txtbgn 
      0080D0 A3 AC 80         [ 2]  172 	cpw x,#app_space 
      0080D3 22 03            [ 1]  173 	jrugt 5$
      0080D5 CD 90 79         [ 4]  174 	call clear_basic 
      0080D8 CC 92 95         [ 2]  175 5$:	jp warm_start
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



      008172 91 A7 00 18      [ 1]   83 	ldf ([farptr],y),a
      008176 90 5C            [ 1]   84     incw y
      008178 91 A7 00 18      [ 1]   85 	ldf ([farptr],y),a
      00817C 90 5C            [ 1]   86     incw y
      00817E 91 A7 00 18      [ 1]   87 	ldf ([farptr],y),a
      008182 90 5C            [ 1]   88     incw y
      008184 91 A7 00 18      [ 1]   89 	ldf ([farptr],y),a
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
      00819A CF 00 0E         [ 2]  102 	ldw acc16,x 
      00819D AE 16 90         [ 2]  103 	ldw x,#tib 
      0081A0 90 AE 81 64      [ 2]  104 	ldw y,#row_erase 
      0081A4 CD 8E B8         [ 4]  105 	call move
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
      0081BB 91 A7 00 18      [ 1]  134 	ldf ([farptr],y),a
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
      0081DA CF 00 0E         [ 2]  156 	ldw acc16,x ; bytes to move 
      0081DD AE 16 90         [ 2]  157 	ldw x,#tib ; destination address 
      0081E0 90 AE 81 AB      [ 2]  158 	ldw y,#program_row ; source address 
      0081E4 CD 8E B8         [ 4]  159 	call move
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
      0081EC 72 5D 00 18      [ 1]  173 	tnz farptr 
      0081F0 26 0D            [ 1]  174 	jrne to_flash 
      0081F2 CE 00 19         [ 2]  175 	ldw x,farptr+1 
      0081F5 A3 AC 80         [ 2]  176 	cpw x,#app_space  
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
      008210 CE 00 19         [ 2]  201 	ldw x,farptr+1
      008213 A3 AC 80         [ 2]  202 	cpw x,#app_space 
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
      008238 90 CE 00 19      [ 2]  238 	ldw y,farptr+1   ; Y=addr15:0
                                    239 ; check addr[23:16], if <> 0 then it is extened flash memory
      00823C 72 5D 00 18      [ 1]  240 	tnz farptr 
      008240 26 14            [ 1]  241 	jrne write_flash
      008242 90 A3 AC 80      [ 2]  242     cpw y,#app_space 	 
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
      00825C 92 A7 00 18      [ 4]  254 	ldf ([farptr],x),a ; farptr[x]=A
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
      00828B 92 A7 00 18      [ 4]  276     ldf ([farptr],x),a
      00828F 0D 02            [ 1]  277     tnz (OPT,sp)
      008291 27 08            [ 1]  278     jreq 3$
      008293 5C               [ 1]  279     incw x
      008294 7B 01            [ 1]  280     ld a,(BTW,sp)
      008296 43               [ 1]  281     cpl a
      008297 92 A7 00 18      [ 4]  282     ldf ([farptr],x),a
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
      0082C8 CD A0 39         [ 4]  325 	call incr_farptr
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
      0082EF CF 00 2E         [ 2]  369     ldw free_eeprom,x 
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
      008315 CC 8F 56         [ 2]   76 	jp cold_start 	
      008318 88               [ 1]   77 3$:	push a 
      008319 A6 24            [ 1]   78 	ld a,#rx1_queue 
      00831B CB 00 2D         [ 1]   79 	add a,rx1_tail 
      00831E 5F               [ 1]   80 	clrw x 
      00831F 97               [ 1]   81 	ld xl,a 
      008320 84               [ 1]   82 	pop a 
      008321 F7               [ 1]   83 	ld (x),a 
      008322 C6 00 2D         [ 1]   84 	ld a,rx1_tail 
      008325 4C               [ 1]   85 	inc a 
      008326 A4 07            [ 1]   86 	and a,#RX_QUEUE_SIZE-1
      008328 C7 00 2D         [ 1]   87 	ld rx1_tail,a 
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
      008367 72 5F 00 2C      [ 1]  122     clr rx1_head 
      00836B 72 5F 00 2D      [ 1]  123 	clr rx1_tail
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
      00837A C6 00 2C         [ 1]  150 	ld a,rx1_head 
      00837D C0 00 2D         [ 1]  151 	sub a,rx1_tail 
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
      008387 A6 24            [ 1]  167 	ld a,#rx1_queue
      008389 CB 00 2C         [ 1]  168 	add a,rx1_head 
      00838C 5F               [ 1]  169 	clrw x  
      00838D 97               [ 1]  170 	ld xl,a 
      00838E F6               [ 1]  171 	ld a,(x)
      00838F 88               [ 1]  172 	push a
      008390 C6 00 2C         [ 1]  173 	ld a,rx1_head 
      008393 4C               [ 1]  174 	inc a 
      008394 A4 07            [ 1]  175 	and a,#RX_QUEUE_SIZE-1
      008396 C7 00 2C         [ 1]  176 	ld rx1_head,a 
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



      008458 C7 00 0F         [ 1]  416     ld acc8,a 
      00845B 72 5F 00 0E      [ 1]  417     clr acc16
      00845F CD 8E B8         [ 4]  418     call move
      008462 90 AE 16 90      [ 2]  419     ldw y,#tib 
      008466 7B 01            [ 1]  420     ld a,(IPOS,sp)
      008468 C7 00 0F         [ 1]  421     ld acc8,a 
      00846B 72 B9 00 0E      [ 2]  422     addw y,acc16 
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
      008499 C7 00 0F         [ 1]  457     ld acc8,a 
      00849C 72 5F 00 0E      [ 1]  458     clr acc16 
      0084A0 CD 8E B8         [ 4]  459 	call move 
      0084A3 90 AE 16 90      [ 2]  460     ldw y,#tib 
      0084A7 7B 01            [ 1]  461     ld a,(CPOS,sp)
      0084A9 C7 00 0F         [ 1]  462     ld acc8,a 
      0084AC 72 B9 00 0E      [ 2]  463     addw y,acc16 
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



      00853B CD 8E 8C         [ 4]  577 	call strlen 
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
      00855C CD 94 6F         [ 4]  592 	call atoi24
      00855F CE 00 0E         [ 2]  593 	ldw x,acc16
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
      00857F CD 8C 11         [ 4]  606 	call decompile 
      008582 0F 01            [ 1]  607 	clr (LL_HB,sp)
      008584 A6 0D            [ 1]  608 	ld a,#CR 
      008586 CD 83 71         [ 4]  609 	call putc 
      008589 A6 3E            [ 1]  610 	ld a,#'>
      00858B CD 83 71         [ 4]  611 	call putc
      00858E AE 16 90         [ 2]  612     ldw x,#tib  
      008591 CD 8E 8C         [ 4]  613 	call strlen 
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
      008600 72 5F 00 0E      [ 1]  668     clr acc16 
      008604 C7 00 0F         [ 1]  669     ld acc8,a 
      008607 72 B9 00 0E      [ 2]  670     addw y,acc16  
      00860B CC 84 E0         [ 2]  671 	jp readln_loop 
      00860E A1 0F            [ 1]  672 10$: cp a,#CTRL_O
      008610 26 0C            [ 1]  673 	jrne 11$ 
                                    674 ; toggle between insert/overwrite
      008612 03 04            [ 1]  675 	cpl (OVRWR,sp)
      008614 90 89            [ 2]  676 	pushw y 
      008616 CD 9E A0         [ 4]  677 	call beep_1khz
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
      0086BA 90 CE 00 1B      [ 2]   54 	ldw y,txtbgn
      0086BE 4D               [ 1]   55 	tnz a 
      0086BF 27 04            [ 1]   56 	jreq search_ln_loop
      0086C1 90 CE 00 05      [ 2]   57 	ldw y,basicptr 
      0086C5                         58 search_ln_loop:
      0086C5 90 C3 00 1D      [ 2]   59 	cpw y,txtend 
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
      0086F0 90 CE 00 1D      [ 2]   91 	ldw y,txtend 
      0086F4 72 F2 03         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      0086F7 90 CF 00 0E      [ 2]   93 	ldw acc16,y 
      0086FB 16 03            [ 2]   94 	ldw y,(SRC,sp)    ; source
      0086FD CD 8E B8         [ 4]   95 	call move
      008700 90 CE 00 1D      [ 2]   96 	ldw y,txtend 
      008704 72 F2 01         [ 2]   97 	subw y,(LLEN,sp)
      008707 90 CF 00 1D      [ 2]   98 	ldw txtend,y  
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
      008714 90 CF 00 0E      [ 2]  119 	ldw acc16,y 
      008718 90 93            [ 1]  120 	ldw y,x ; SRC
      00871A 72 BB 00 0E      [ 2]  121 	addw x,acc16  
      00871E 1F 01            [ 2]  122 	ldw (DEST,sp),x 
                                    123 ;compute size to move 	
      008720 CE 00 1D         [ 2]  124 	ldw x,txtend 
      008723 72 F0 03         [ 2]  125 	subw x,(SRC,sp)
      008726 CF 00 0E         [ 2]  126 	ldw acc16,x ; size to move
      008729 1E 01            [ 2]  127 	ldw x,(DEST,sp) 
      00872B CD 8E B8         [ 4]  128 	call move
      00872E CE 00 1D         [ 2]  129 	ldw x,txtend
      008731 72 FB 05         [ 2]  130 	addw x,(LEN,sp)
      008734 CF 00 1D         [ 2]  131 	ldw txtend,x
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
      00873C CE 00 1D         [ 2]  152 	ldw x,txtend  
      00873F C3 00 1B         [ 2]  153 	cpw x,txtbgn 
      008742 26 19            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      008744 AE 00 02         [ 2]  156 	ldw x,#2 
      008747 72 D6 00 19      [ 4]  157 	ld a,([ptr16],x)
      00874B A1 03            [ 1]  158 	cp a,#3
      00874D 27 5A            [ 1]  159 	jreq insert_ln_exit
      00874F 5F               [ 1]  160 	clrw x 
      008750 97               [ 1]  161 	ld xl,a
      008751 1F 07            [ 2]  162 	ldw (LLEN,sp),x 
      008753 CE 00 1B         [ 2]  163 	ldw x,txtbgn
      008756 1F 01            [ 2]  164 	ldw (DEST,sp),x 
      008758 CE 00 1D         [ 2]  165 	ldw x,txtend 
      00875B 20 38            [ 2]  166 	jra 4$
      00875D 72 CE 00 19      [ 5]  167 0$:	ldw x,[ptr16]
                                    168 ; line number
      008761 1F 05            [ 2]  169 	ldw (LINENO,sp),x 
      008763 AE 00 02         [ 2]  170 	ldw x,#2 
      008766 72 D6 00 19      [ 4]  171 	ld a,([ptr16],x)
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
      008787 C3 00 1D         [ 2]  198 	cpw x,txtend 
      00878A 27 09            [ 1]  199 	jreq 4$ 
                                    200 ; must create a gap
                                    201 ; at insertion point  
      00878C 1E 01            [ 2]  202 	ldw x,(DEST,sp)
      00878E 16 07            [ 2]  203 	ldw y,(LLEN,sp)
      008790 CD 87 0E         [ 4]  204 	call create_gap
      008793 20 06            [ 2]  205 	jra 5$
      008795                        206 4$: 
      008795 72 FB 07         [ 2]  207 	addw x,(LLEN,sp)
      008798 CF 00 1D         [ 2]  208 	ldw txtend,x 	 
                                    209 ; move new line in gap 
      00879B 1E 07            [ 2]  210 5$:	ldw x,(LLEN,sp)
      00879D CF 00 0E         [ 2]  211 	ldw acc16,x 
      0087A0 90 AE 16 E0      [ 2]  212 	ldw y,#pad ;SRC 
      0087A4 1E 01            [ 2]  213 	ldw x,(DEST,sp) ; dest address 
      0087A6 CD 8E B8         [ 4]  214 	call move 
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
      008817 CD 94 63         [ 4]  322 	call to_upper 
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
      008838 CD 94 6F         [ 4]  337 	call atoi24
      00883B 90 93            [ 1]  338 	ldw y,x 
      00883D CE 00 0E         [ 2]  339 	ldw x,acc16 
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
      008875 C7 00 0D         [ 1]  383 	ld acc24,a 
      008878 1E 02            [ 2]  384 	ldw x,(BINARY+1,sp)
      00887A CF 00 0E         [ 2]  385 	ldw acc16,x
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
                                    444 ; valid: Upper case LETTER,DIGIT,'_' 
                                    445 ; input:
                                    446 ;    A   character to validate
                                    447 ; output:
                                    448 ;    Carry   set if valid 
                                    449 ;----------------------------
      0088AB                        450 is_symbol_char: 
      0088AB A1 5F            [ 1]  451 	cp a,#'_ 
      0088AD 26 03            [ 1]  452 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      0088AF 99               [ 1]  453 	scf 
      0088B0 20 03            [ 2]  454 	jra 9$ 
      0088B2 CD 88 A2         [ 4]  455 1$:	call is_alnum 
      0088B5 81               [ 4]  456 9$: ret 
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
      0088B6                        470 parse_symbol:
      0088B6 5C               [ 1]  471 	incw x ; keep space for TK_ID 
      0088B7                        472 symb_loop: 
                                    473 ; symbol are converted to upper case 
      0088B7 CD 94 63         [ 4]  474 	call to_upper  
      0088BA F7               [ 1]  475 	ld (x), a 
      0088BB 5C               [ 1]  476 	incw x
      0088BC 91 D6 01         [ 4]  477 	ld a,([in.w],y)
      0088BF 72 5C 00 02      [ 1]  478 	inc in 
      0088C3 CD 88 AB         [ 4]  479 	call is_symbol_char 
      0088C6 25 EF            [ 1]  480 	jrc symb_loop 
      0088C8 7F               [ 1]  481 	clr (x)
      0088C9 72 5A 00 02      [ 1]  482 	dec in  
      0088CD 81               [ 4]  483 	ret 
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
      0088CE                        499 parse_keyword: 
      0088CE 89               [ 2]  500 	pushw x ; preserve *symbol 
      0088CF CD 88 B6         [ 4]  501 	call parse_symbol
      0088D2 1E 01            [ 2]  502 	ldw x,(XFIRST,sp) 
      0088D4 E6 02            [ 1]  503 	ld a,(2,x)
      0088D6 26 14            [ 1]  504 	jrne 2$
                                    505 ; one letter variable name 
      0088D8 E6 01            [ 1]  506 	ld a,(1,x) 
      0088DA A0 41            [ 1]  507 	sub a,#'A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      0088DC 48               [ 1]  508 	sll a 
      0088DD 88               [ 1]  509 	push a 
      0088DE 4B 00            [ 1]  510 	push #0
      0088E0 AE 00 30         [ 2]  511 	ldw x,#vars 
      0088E3 72 FB 01         [ 2]  512 	addw x,(1,sp) ; X=var address 
      000866                        513 	_drop 2 
      0088E6 5B 02            [ 2]    1     addw sp,#2 
      0088E8 A6 85            [ 1]  514 	ld a,#TK_VAR 
      0088EA 20 24            [ 2]  515 	jra 4$ 
      0088EC                        516 2$: ; check for keyword, otherwise syntax error.
      00086C                        517 	_ldx_dict kword_dict ; dictionary entry point
      0088EC AE AB 3D         [ 2]    1     ldw x,#kword_dict+2
      0088EF 16 01            [ 2]  518 	ldw y,(XFIRST,sp) ; name to search for
      0088F1 90 5C            [ 1]  519 	incw y 
      0088F3 CD 96 56         [ 4]  520 	call search_dict
      0088F6 4D               [ 1]  521 	tnz a
      0088F7 26 17            [ 1]  522 	jrne 4$ 
                                    523 ; not in dictionary
                                    524 ; compile it as TK_LABEL
      0088F9 16 01            [ 2]  525 	ldw y,(XFIRST,sp)
      0088FB A6 01            [ 1]  526 	ld a,#TK_LABEL 
      0088FD 90 F7            [ 1]  527 	ld (y),a 
      0088FF 90 5C            [ 1]  528 	incw y
      008901                        529 24$:	
      008901 90 F6            [ 1]  530     ld a,(y)
      008903 27 04            [ 1]  531 	jreq 3$
      008905 90 5C            [ 1]  532 	incw y 
      008907 20 F8            [ 2]  533 	jra 24$ 
      008909 90 5C            [ 1]  534 3$: incw y 
      00890B A6 01            [ 1]  535 	ld a,#TK_LABEL 
      00890D 5F               [ 1]  536 	clrw x 	
      00890E 20 11            [ 2]  537 	jra 5$ 
      008910                        538 4$:	
      008910 16 01            [ 2]  539 	ldw y,(XFIRST,sp)
      008912 A3 00 50         [ 2]  540 	cpw x,#LET_IDX 
      008915 27 0A            [ 1]  541 	jreq 5$  ; don't compile LET command 
      008917 90 F7            [ 1]  542 	ld (y),a 
      008919 90 5C            [ 1]  543 	incw y 
      00891B 90 FF            [ 2]  544 	ldw (y),x
      00891D 72 A9 00 02      [ 2]  545 	addw y,#2  
      0008A1                        546 5$:	_drop VSIZE 
      008921 5B 02            [ 2]    1     addw sp,#VSIZE 
      008923 81               [ 4]  547 	ret  	
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
      008924                        558 skip:
      008924 88               [ 1]  559 	push a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      008925 91 D6 01         [ 4]  560 1$:	ld a,([in.w],y)
      008928 27 0A            [ 1]  561 	jreq 2$
      00892A 11 01            [ 1]  562 	cp a,(C,sp)
      00892C 26 06            [ 1]  563 	jrne 2$
      00892E 72 5C 00 02      [ 1]  564 	inc in
      008932 20 F1            [ 2]  565 	jra 1$
      0008B4                        566 2$: _drop 1 
      008934 5B 01            [ 2]    1     addw sp,#1 
      008936 81               [ 4]  567 	ret
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
      008937                        592 get_token:: 
      0008B7                        593 	_vars VSIZE
      008937 52 02            [ 2]    1     sub sp,#VSIZE 
                                    594 ;	ld a,in 
                                    595 ;	sub a,count
                                    596 ;   jrmi 0$
                                    597 ;	clr a 
                                    598 ;	ret 
      008939                        599 0$: 
      008939 90 AE 16 90      [ 2]  600 	ldw y,#tib    	
      00893D A6 20            [ 1]  601 	ld a,#SPACE
      00893F CD 89 24         [ 4]  602 	call skip
      008942 55 00 02 00 03   [ 1]  603 	mov in.saved,in 
      008947 91 D6 01         [ 4]  604 	ld a,([in.w],y)
      00894A 26 05            [ 1]  605 	jrne 1$
      00894C 90 93            [ 1]  606 	ldw y,x 
      00894E CC 8A F3         [ 2]  607 	jp token_exit ; end of line 
      008951 72 5C 00 02      [ 1]  608 1$:	inc in 
      008955 CD 94 63         [ 4]  609 	call to_upper 
      008958 6B 01            [ 1]  610 	ld (TCHAR,sp),a 
                                    611 ; check for quoted string
      00895A                        612 str_tst:  	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      0008DA                        613 	_case '"' nbr_tst
      00895A A6 22            [ 1]    1 	ld a,#'"' 
      00895C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00895E 26 0A            [ 1]    3 	jrne nbr_tst
      008960 A6 02            [ 1]  614 	ld a,#TK_QSTR
      008962 F7               [ 1]  615 	ld (x),a 
      008963 5C               [ 1]  616 	incw x 
      008964 CD 87 AC         [ 4]  617 	call parse_quote
      008967 CC 8A F3         [ 2]  618 	jp token_exit
      00896A                        619 nbr_tst:
                                    620 ; check for hexadecimal number 
      00896A A6 24            [ 1]  621 	ld a,#'$'
      00896C 11 01            [ 1]  622 	cp a,(TCHAR,sp) 
      00896E 27 17            [ 1]  623 	jreq 1$
                                    624 ;check for binary number 
      008970 A6 26            [ 1]  625 	ld a,#'&
      008972 11 01            [ 1]  626 	cp a,(TCHAR,sp)
      008974 26 0A            [ 1]  627 	jrne 0$
      008976 A6 84            [ 1]  628 	ld a,#TK_INTGR
      008978 F7               [ 1]  629 	ld (x),a 
      008979 5C               [ 1]  630 	incw x 
      00897A CD 88 4B         [ 4]  631 	call parse_binary ; expect binary integer 
      00897D CC 8A F3         [ 2]  632 	jp token_exit 
                                    633 ; check for decimal number 	
      008980 7B 01            [ 1]  634 0$:	ld a,(TCHAR,sp)
      008982 CD 88 99         [ 4]  635 	call is_digit
      008985 24 0C            [ 1]  636 	jrnc 3$
      008987 A6 84            [ 1]  637 1$:	ld a,#TK_INTGR 
      008989 F7               [ 1]  638 	ld (x),a 
      00898A 5C               [ 1]  639 	incw x 
      00898B 7B 01            [ 1]  640 	ld a,(TCHAR,sp)
      00898D CD 88 01         [ 4]  641 	call parse_integer 
      008990 CC 8A F3         [ 2]  642 	jp token_exit 
      008993                        643 3$: 
      000913                        644 	_case '(' bkslsh_tst 
      008993 A6 28            [ 1]    1 	ld a,#'(' 
      008995 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008997 26 05            [ 1]    3 	jrne bkslsh_tst
      008999 A6 07            [ 1]  645 	ld a,#TK_LPAREN
      00899B CC 8A EF         [ 2]  646 	jp token_char   	
      00899E                        647 bkslsh_tst: ; character token 
      00091E                        648 	_case '\',rparnt_tst
      00899E A6 5C            [ 1]    1 	ld a,#'\' 
      0089A0 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0089A2 26 16            [ 1]    3 	jrne rparnt_tst
      0089A4 A6 03            [ 1]  649 	ld a,#TK_CHAR 
      0089A6 F7               [ 1]  650 	ld (x),a 
      0089A7 5C               [ 1]  651 	incw x 
      0089A8 91 D6 01         [ 4]  652 	ld a,([in.w],y)
      0089AB F7               [ 1]  653 	ld (x),a 
      0089AC 5C               [ 1]  654 	incw x
      0089AD 90 93            [ 1]  655 	ldw y,x 	 
      0089AF 72 5C 00 02      [ 1]  656 	inc in  
      0089B3 5F               [ 1]  657 	clrw x 
      0089B4 97               [ 1]  658 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0089B5 A6 03            [ 1]  659 	ld a,#TK_CHAR 
      0089B7 CC 8A F3         [ 2]  660 	jp token_exit 
      0089BA                        661 rparnt_tst:		
      00093A                        662 	_case ')' colon_tst 
      0089BA A6 29            [ 1]    1 	ld a,#')' 
      0089BC 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0089BE 26 05            [ 1]    3 	jrne colon_tst
      0089C0 A6 08            [ 1]  663 	ld a,#TK_RPAREN 
      0089C2 CC 8A EF         [ 2]  664 	jp token_char
      0089C5                        665 colon_tst:
      000945                        666 	_case ':' comma_tst 
      0089C5 A6 3A            [ 1]    1 	ld a,#':' 
      0089C7 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0089C9 26 05            [ 1]    3 	jrne comma_tst
      0089CB A6 0B            [ 1]  667 	ld a,#TK_COLON 
      0089CD CC 8A EF         [ 2]  668 	jp token_char  
      0089D0                        669 comma_tst:
      000950                        670 	_case COMMA sharp_tst 
      0089D0 A6 2C            [ 1]    1 	ld a,#COMMA 
      0089D2 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0089D4 26 05            [ 1]    3 	jrne sharp_tst
      0089D6 A6 09            [ 1]  671 	ld a,#TK_COMMA
      0089D8 CC 8A EF         [ 2]  672 	jp token_char
      0089DB                        673 sharp_tst:
      00095B                        674 	_case SHARP dash_tst 
      0089DB A6 23            [ 1]    1 	ld a,#SHARP 
      0089DD 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0089DF 26 05            [ 1]    3 	jrne dash_tst
      0089E1 A6 0A            [ 1]  675 	ld a,#TK_SHARP
      0089E3 CC 8A EF         [ 2]  676 	jp token_char  	 	 
      0089E6                        677 dash_tst: 	
      000966                        678 	_case '-' at_tst 
      0089E6 A6 2D            [ 1]    1 	ld a,#'-' 
      0089E8 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0089EA 26 05            [ 1]    3 	jrne at_tst
      0089EC A6 11            [ 1]  679 	ld a,#TK_MINUS  
      0089EE CC 8A EF         [ 2]  680 	jp token_char 
      0089F1                        681 at_tst:
      000971                        682 	_case '@' qmark_tst 
      0089F1 A6 40            [ 1]    1 	ld a,#'@' 
      0089F3 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0089F5 26 05            [ 1]    3 	jrne qmark_tst
      0089F7 A6 06            [ 1]  683 	ld a,#TK_ARRAY 
      0089F9 CC 8A EF         [ 2]  684 	jp token_char
      0089FC                        685 qmark_tst:
      00097C                        686 	_case '?' tick_tst 
      0089FC A6 3F            [ 1]    1 	ld a,#'?' 
      0089FE 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A00 26 12            [ 1]    3 	jrne tick_tst
      008A02 A6 80            [ 1]  687 	ld a,#TK_CMD  
      008A04 F7               [ 1]  688 	ld (x),a 
      008A05 5C               [ 1]  689 	incw x 
      008A06 90 93            [ 1]  690 	ldw y,x 
      008A08 AE 00 72         [ 2]  691 	ldw x,#PRT_IDX 
      008A0B 90 FF            [ 2]  692 	ldw (y),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      008A0D 72 A9 00 02      [ 2]  693 	addw y,#2
      008A11 CC 8A F3         [ 2]  694 	jp token_exit
      008A14                        695 tick_tst: ; comment 
      000994                        696 	_case TICK plus_tst 
      008A14 A6 27            [ 1]    1 	ld a,#TICK 
      008A16 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A18 26 35            [ 1]    3 	jrne plus_tst
      008A1A A6 80            [ 1]  697 	ld a,#TK_CMD
      008A1C F7               [ 1]  698 	ld (x),a 
      008A1D 5C               [ 1]  699 	incw x
      008A1E 90 AE 00 8C      [ 2]  700 	ldw y,#REM_IDX
      008A22 FF               [ 2]  701 	ldw (x),y 
      008A23 1C 00 02         [ 2]  702 	addw x,#2  
      008A26                        703 copy_comment:
      008A26 90 AE 16 90      [ 2]  704 	ldw y,#tib 
      008A2A 72 B9 00 01      [ 2]  705 	addw y,in.w
      008A2E 90 89            [ 2]  706 	pushw y
      008A30 CD 8E A8         [ 4]  707 	call strcpy
      008A33 72 F2 01         [ 2]  708     subw y,(1,sp)
      008A36 90 9F            [ 1]  709 	ld a,yl 
      008A38 CB 00 02         [ 1]  710 	add a,in
      008A3B C7 00 02         [ 1]  711 	ld in,a 
      008A3E 1F 01            [ 2]  712 	ldw (1,sp),x
      008A40 72 F9 01         [ 2]  713 	addw y,(1,sp)
      008A43 90 5C            [ 1]  714 	incw y 
      0009C5                        715 	_drop 2 
      008A45 5B 02            [ 2]    1     addw sp,#2 
      008A47 AE 00 8C         [ 2]  716 	ldw x,#REM_IDX 
      008A4A A6 80            [ 1]  717 	ld a,#TK_CMD 
      008A4C CC 8A F3         [ 2]  718 	jp token_exit 
      008A4F                        719 plus_tst:
      0009CF                        720 	_case '+' star_tst 
      008A4F A6 2B            [ 1]    1 	ld a,#'+' 
      008A51 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A53 26 05            [ 1]    3 	jrne star_tst
      008A55 A6 10            [ 1]  721 	ld a,#TK_PLUS  
      008A57 CC 8A EF         [ 2]  722 	jp token_char 
      008A5A                        723 star_tst:
      0009DA                        724 	_case '*' slash_tst 
      008A5A A6 2A            [ 1]    1 	ld a,#'*' 
      008A5C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A5E 26 05            [ 1]    3 	jrne slash_tst
      008A60 A6 20            [ 1]  725 	ld a,#TK_MULT 
      008A62 CC 8A EF         [ 2]  726 	jp token_char 
      008A65                        727 slash_tst: 
      0009E5                        728 	_case '/' prcnt_tst 
      008A65 A6 2F            [ 1]    1 	ld a,#'/' 
      008A67 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A69 26 05            [ 1]    3 	jrne prcnt_tst
      008A6B A6 21            [ 1]  729 	ld a,#TK_DIV 
      008A6D CC 8A EF         [ 2]  730 	jp token_char 
      008A70                        731 prcnt_tst:
      0009F0                        732 	_case '%' eql_tst 
      008A70 A6 25            [ 1]    1 	ld a,#'%' 
      008A72 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      008A74 26 05            [ 1]    3 	jrne eql_tst
      008A76 A6 22            [ 1]  733 	ld a,#TK_MOD
      008A78 CC 8A EF         [ 2]  734 	jp token_char  
                                    735 ; 1 or 2 character tokens 	
      008A7B                        736 eql_tst:
      0009FB                        737 	_case '=' gt_tst 		
      008A7B A6 3D            [ 1]    1 	ld a,#'=' 
      008A7D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A7F 26 05            [ 1]    3 	jrne gt_tst
      008A81 A6 32            [ 1]  738 	ld a,#TK_EQUAL
      008A83 CC 8A EF         [ 2]  739 	jp token_char 
      008A86                        740 gt_tst:
      000A06                        741 	_case '>' lt_tst 
      008A86 A6 3E            [ 1]    1 	ld a,#'>' 
      008A88 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A8A 26 23            [ 1]    3 	jrne lt_tst
      008A8C A6 31            [ 1]  742 	ld a,#TK_GT 
      008A8E 6B 02            [ 1]  743 	ld (ATTRIB,sp),a 
      008A90 91 D6 01         [ 4]  744 	ld a,([in.w],y)
      008A93 72 5C 00 02      [ 1]  745 	inc in 
      008A97 A1 3D            [ 1]  746 	cp a,#'=
      008A99 26 04            [ 1]  747 	jrne 1$
      008A9B A6 33            [ 1]  748 	ld a,#TK_GE 
      008A9D 20 50            [ 2]  749 	jra token_char  
      008A9F A1 3C            [ 1]  750 1$: cp a,#'<
      008AA1 26 04            [ 1]  751 	jrne 2$
      008AA3 A6 35            [ 1]  752 	ld a,#TK_NE 
      008AA5 20 48            [ 2]  753 	jra token_char 
      008AA7 72 5A 00 02      [ 1]  754 2$: dec in
      008AAB 7B 02            [ 1]  755 	ld a,(ATTRIB,sp)
      008AAD 20 40            [ 2]  756 	jra token_char 	 
      008AAF                        757 lt_tst:
      000A2F                        758 	_case '<' other
      008AAF A6 3C            [ 1]    1 	ld a,#'<' 
      008AB1 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008AB3 26 23            [ 1]    3 	jrne other
      008AB5 A6 34            [ 1]  759 	ld a,#TK_LT 
      008AB7 6B 02            [ 1]  760 	ld (ATTRIB,sp),a 
      008AB9 91 D6 01         [ 4]  761 	ld a,([in.w],y)
      008ABC 72 5C 00 02      [ 1]  762 	inc in 
      008AC0 A1 3D            [ 1]  763 	cp a,#'=
      008AC2 26 04            [ 1]  764 	jrne 1$
      008AC4 A6 36            [ 1]  765 	ld a,#TK_LE 
      008AC6 20 27            [ 2]  766 	jra token_char 
      008AC8 A1 3E            [ 1]  767 1$: cp a,#'>
      008ACA 26 04            [ 1]  768 	jrne 2$
      008ACC A6 35            [ 1]  769 	ld a,#TK_NE 
      008ACE 20 1F            [ 2]  770 	jra token_char 
      008AD0 72 5A 00 02      [ 1]  771 2$: dec in 
      008AD4 7B 02            [ 1]  772 	ld a,(ATTRIB,sp)
      008AD6 20 17            [ 2]  773 	jra token_char 	
      008AD8                        774 other: ; not a special character 	 
      008AD8 7B 01            [ 1]  775 	ld a,(TCHAR,sp)
      008ADA CD 88 88         [ 4]  776 	call is_alpha 
      008ADD 25 03            [ 1]  777 	jrc 30$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      008ADF CC 92 11         [ 2]  778 	jp syntax_error 
      008AE2                        779 30$: 
      008AE2 CD 88 CE         [ 4]  780 	call parse_keyword
      008AE5 A3 9B 44         [ 2]  781 	cpw x,#remark 
      008AE8 26 09            [ 1]  782 	jrne token_exit 
      008AEA 90 93            [ 1]  783 	ldw y,x 
      008AEC CC 8A 26         [ 2]  784 	jp copy_comment 
      008AEF                        785 token_char:
      008AEF F7               [ 1]  786 	ld (x),a 
      008AF0 5C               [ 1]  787 	incw x
      008AF1 90 93            [ 1]  788 	ldw y,x 
      008AF3                        789 token_exit:
      000A73                        790 	_drop VSIZE 
      008AF3 5B 02            [ 2]    1     addw sp,#VSIZE 
      008AF5 81               [ 4]  791 	ret
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
      008AF6                        811 compile::
      000A76                        812 	_vars VSIZE 
      008AF6 52 02            [ 2]    1     sub sp,#VSIZE 
      008AF8 55 00 1B 00 05   [ 1]  813 	mov basicptr,txtbgn
      008AFD 72 1A 00 22      [ 1]  814 	bset flags,#FCOMP 
      008B01 A6 00            [ 1]  815 	ld a,#0
      008B03 AE 00 00         [ 2]  816 	ldw x,#0
      008B06 CF 16 E0         [ 2]  817 	ldw pad,x ; destination buffer 
      008B09 C7 16 E2         [ 1]  818 	ld pad+2,a ; count 
      008B0C AE 16 E3         [ 2]  819 	ldw x,#pad+3
      008B0F 72 5F 00 02      [ 1]  820 	clr in 
      008B13 CD 89 37         [ 4]  821 	call get_token
      008B16 A1 84            [ 1]  822 	cp a,#TK_INTGR
      008B18 26 11            [ 1]  823 	jrne 2$
      008B1A A3 00 01         [ 2]  824 	cpw x,#1 
      008B1D 2A 05            [ 1]  825 	jrpl 1$
      008B1F A6 0A            [ 1]  826 	ld a,#ERR_BAD_VALUE
      008B21 CC 92 13         [ 2]  827 	jp tb_error
      008B24 CF 16 E0         [ 2]  828 1$:	ldw pad,x 
      008B27 90 AE 16 E3      [ 2]  829 	ldw y,#pad+3 
      008B2B 90 A3 17 60      [ 2]  830 2$:	cpw y,#stack_full 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      008B2F 25 05            [ 1]  831 	jrult 3$
      008B31 A6 0F            [ 1]  832 	ld a,#ERR_BUF_FULL 
      008B33 CC 92 13         [ 2]  833 	jp tb_error 
      008B36                        834 3$:	
      008B36 93               [ 1]  835 	ldw x,y 
      008B37 CD 89 37         [ 4]  836 	call get_token 
      008B3A A1 00            [ 1]  837 	cp a,#TK_NONE 
      008B3C 26 ED            [ 1]  838 	jrne 2$ 
                                    839 ; compilation completed  
      008B3E 72 A2 16 E0      [ 2]  840 	subw y,#pad
      008B42 90 9F            [ 1]  841     ld a,yl
      008B44 AE 16 E0         [ 2]  842 	ldw x,#pad 
      008B47 CF 00 19         [ 2]  843 	ldw ptr16,x 
      008B4A E7 02            [ 1]  844 	ld (2,x),a 
      008B4C FE               [ 2]  845 	ldw x,(x)
      008B4D 27 09            [ 1]  846 	jreq 10$
      008B4F CD 87 3A         [ 4]  847 	call insert_line
      008B52 72 5F 00 04      [ 1]  848 	clr  count 
      008B56 20 0F            [ 2]  849 	jra  11$ 
      008B58                        850 10$: ; line# is zero 
      008B58 CE 00 19         [ 2]  851 	ldw x,ptr16  
      008B5B CF 00 05         [ 2]  852 	ldw basicptr,x 
      008B5E E6 02            [ 1]  853 	ld a,(2,x)
      008B60 C7 00 04         [ 1]  854 	ld count,a 
      008B63 35 03 00 02      [ 1]  855 	mov in,#3 
      008B67                        856 11$:
      000AE7                        857 	_drop VSIZE 
      008B67 5B 02            [ 2]    1     addw sp,#VSIZE 
      008B69 72 1B 00 22      [ 1]  858 	bres flags,#FCOMP 
      008B6D 81               [ 4]  859 	ret 
                                    860 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                     27     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000000     5 SEPARATE=0 ; set to 1 for 'make separate' 
                                      6 
                                      7 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
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
      008B6E                         48 cpy_cmd_name:
      008B6E F6               [ 1]   49 	ld a,(x)
      008B6F 5C               [ 1]   50 	incw x
      008B70 A4 0F            [ 1]   51 	and a,#15  
      008B72 88               [ 1]   52 	push a 
      008B73 0D 01            [ 1]   53     tnz (1,sp) 
      008B75 27 0A            [ 1]   54 	jreq 9$
      008B77 F6               [ 1]   55 1$:	ld a,(x)
      008B78 90 F7            [ 1]   56 	ld (y),a  
      008B7A 5C               [ 1]   57 	incw x
      008B7B 90 5C            [ 1]   58 	incw y 
      008B7D 0A 01            [ 1]   59 	dec (1,sp)	 
      008B7F 26 F6            [ 1]   60 	jrne 1$
      008B81 84               [ 1]   61 9$: pop a 
      008B82 81               [ 4]   62 	ret	
                                     63 
                                     64 ;--------------------------
                                     65 ; add a space after letter or 
                                     66 ; digit.
                                     67 ; input:
                                     68 ;   Y     pointer to buffer 
                                     69 ; output:
                                     70 ;   Y    moved to end 
                                     71 ;--------------------------
      008B83                         72 add_space:
      008B83 90 5A            [ 2]   73 	decw y 
      008B85 90 F6            [ 1]   74 	ld a,(y)
      008B87 90 5C            [ 1]   75 	incw y
      008B89 CD 88 A2         [ 4]   76 	call is_alnum 
      008B8C 24 06            [ 1]   77 	jrnc 1$
      008B8E A6 20            [ 1]   78 	ld a,#SPACE 
      008B90 90 F7            [ 1]   79 	ld (y),a 
      008B92 90 5C            [ 1]   80 	incw y 
      008B94 81               [ 4]   81 1$: ret 
                                     82 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
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
      008B95                         93 right_align::
      008B95 88               [ 1]   94 	push a 
      008B96 7B 01            [ 1]   95 0$: ld a,(1,sp)
      008B98 C1 00 23         [ 1]   96 	cp a,tab_width 
      008B9B 2A 08            [ 1]   97 	jrpl 1$
      008B9D A6 20            [ 1]   98 	ld a,#SPACE 
      008B9F 5A               [ 2]   99 	decw x
      008BA0 F7               [ 1]  100 	ld (x),a  
      008BA1 0C 01            [ 1]  101 	inc (1,sp)
      008BA3 20 F1            [ 2]  102 	jra 0$ 
      008BA5 84               [ 1]  103 1$: pop a 	
      008BA6 81               [ 4]  104 	ret 
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
      008BA7                        117 cpy_quote:
      008BA7 A6 22            [ 1]  118 	ld a,#'"
      008BA9 90 F7            [ 1]  119 	ld (y),a 
      008BAB 90 5C            [ 1]  120 	incw y 
      008BAD F6               [ 1]  121 1$:	ld a,(x)
      008BAE 27 30            [ 1]  122 	jreq 9$
      008BB0 5C               [ 1]  123 	incw x 
      008BB1 A1 20            [ 1]  124 	cp a,#SPACE 
      008BB3 25 0E            [ 1]  125 	jrult 3$
      008BB5 90 F7            [ 1]  126 	ld (y),a
      008BB7 90 5C            [ 1]  127 	incw y 
      008BB9 A1 5C            [ 1]  128 	cp a,#'\ 
      008BBB 26 F0            [ 1]  129 	jrne 1$ 
      008BBD                        130 2$:
      008BBD 90 F7            [ 1]  131 	ld (y),a
      008BBF 90 5C            [ 1]  132 	incw y  
      008BC1 20 EA            [ 2]  133 	jra 1$
      008BC3 88               [ 1]  134 3$: push a 
      008BC4 A6 5C            [ 1]  135 	ld a,#'\
      008BC6 90 F7            [ 1]  136 	ld (y),a 
      008BC8 90 5C            [ 1]  137 	incw y  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      008BCA 84               [ 1]  138 	pop a 
      008BCB A0 07            [ 1]  139 	sub a,#7
      008BCD C7 00 0F         [ 1]  140 	ld acc8,a 
      008BD0 72 5F 00 0E      [ 1]  141 	clr acc16
      008BD4 89               [ 2]  142 	pushw x
      008BD5 AE 87 F9         [ 2]  143 	ldw x,#escaped 
      008BD8 72 BB 00 0E      [ 2]  144 	addw x,acc16 
      008BDC F6               [ 1]  145 	ld a,(x)
      008BDD 85               [ 2]  146 	popw x
      008BDE 20 DD            [ 2]  147 	jra 2$
      008BE0 A6 22            [ 1]  148 9$: ld a,#'"
      008BE2 90 F7            [ 1]  149 	ld (y),a 
      008BE4 90 5C            [ 1]  150 	incw y  
      008BE6 5C               [ 1]  151 	incw x 
      008BE7 81               [ 4]  152 	ret
                                    153 
                                    154 ;--------------------------
                                    155 ; return variable name 
                                    156 ; from its address.
                                    157 ; input:
                                    158 ;   X    variable address
                                    159 ; output:
                                    160 ;   A     variable letter
                                    161 ;--------------------------
      008BE8                        162 var_name::
      008BE8 1D 00 30         [ 2]  163 		subw x,#vars 
      008BEB 9F               [ 1]  164 		ld a,xl 
      008BEC 44               [ 1]  165 		srl a 
      008BED AB 41            [ 1]  166 		add a,#'A 
      008BEF 81               [ 4]  167 		ret 
                                    168 
                                    169 ;-----------------------------
                                    170 ; return cmd  idx from its 
                                    171 ; code address 
                                    172 ; input:
                                    173 ;   X      code address 
                                    174 ; output:
                                    175 ;   X      cmd_idx
                                    176 ;-----------------------------
      008BF0                        177 get_cmd_idx:
      008BF0 90 89            [ 2]  178 	pushw y
      008BF2 90 AE AB 43      [ 2]  179 	ldw y,#code_addr 
      008BF6 90 CF 00 19      [ 2]  180 	ldw ptr16,y 
      008BFA 90 5F            [ 1]  181 	clrw y 
      008BFC 91 D3 19         [ 5]  182 1$:	cpw x,([ptr16],y)
      008BFF 27 0C            [ 1]  183 	jreq 3$ 
      008C01 90 5C            [ 1]  184 	incw y 
      008C03 91 D6 19         [ 4]  185 	ld a,([ptr16],y)
      008C06 90 5C            [ 1]  186 	incw y
      008C08 91 DA 19         [ 4]  187 	or a,([ptr16],y)	
      008C0B 26 EF            [ 1]  188 	jrne 1$
      008C0D 93               [ 1]  189 3$: ldw x,y 
      008C0E 90 85            [ 2]  190 	popw y 
      008C10 81               [ 4]  191 	ret
                                    192 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
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
      008C11                        208 decompile::
      000B91                        209 	_vars VSIZE
      008C11 52 04            [ 2]    1     sub sp,#VSIZE 
      008C13 C6 00 0B         [ 1]  210 	ld a,base
      008C16 6B 01            [ 1]  211 	ld (BASE_SAV,sp),a  
      008C18 C6 00 23         [ 1]  212 	ld a,tab_width 
      008C1B 6B 02            [ 1]  213 	ld (WIDTH_SAV,sp),a 
      008C1D 17 03            [ 2]  214 	ldw (STR,sp),y   
      008C1F 72 CE 00 05      [ 5]  215 	ldw x,[basicptr] ; line number 
      008C23 35 0A 00 0B      [ 1]  216 	mov base,#10
      008C27 35 05 00 23      [ 1]  217 	mov tab_width,#5
      008C2B 72 5F 00 0D      [ 1]  218 	clr acc24 
      008C2F CF 00 0E         [ 2]  219 	ldw acc16,x
      008C32 CD 93 73         [ 4]  220 	call itoa  
      008C35 CD 8B 95         [ 4]  221 	call right_align 
      008C38 88               [ 1]  222 	push a 
      008C39 90 93            [ 1]  223 1$:	ldw y,x ; source
      008C3B 1E 04            [ 2]  224 	ldw x,(STR+1,sp) ; destination
      008C3D CD 8E A8         [ 4]  225 	call strcpy 
      008C40 90 5F            [ 1]  226 	clrw y 
      008C42 84               [ 1]  227 	pop a 
      008C43 90 97            [ 1]  228 	ld yl,a 
      008C45 72 F9 03         [ 2]  229 	addw y,(STR,sp)
      008C48 A6 20            [ 1]  230 	ld a,#SPACE 
      008C4A 90 F7            [ 1]  231 	ld (y),a 
      008C4C 90 5C            [ 1]  232 	incw y 
      008C4E 72 5F 00 23      [ 1]  233 	clr tab_width
      008C52 AE 00 03         [ 2]  234 	ldw x,#3
      008C55 CF 00 01         [ 2]  235 	ldw in.w,x 
      008C58                        236 decomp_loop:
      008C58 90 89            [ 2]  237 	pushw y
      008C5A CD 93 09         [ 4]  238 	call next_token 
      008C5D 90 85            [ 2]  239 	popw y 
      008C5F 4D               [ 1]  240 	tnz a  
      008C60 26 03            [ 1]  241 	jrne 1$
      008C62 CC 8D 72         [ 2]  242 	jp 20$
      008C65 2B 03            [ 1]  243 1$:	jrmi 2$
      008C67 CC 8C E3         [ 2]  244 	jp 6$
      008C6A                        245 2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR
      008C6A A1 85            [ 1]  246 	cp a,#TK_VAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      008C6C 26 0C            [ 1]  247 	jrne 3$
                                    248 ;; TK_VAR 
      008C6E CD 8B 83         [ 4]  249 	call add_space  
      008C71 CD 8B E8         [ 4]  250 	call var_name
      008C74 90 F7            [ 1]  251 	ld (y),a 
      008C76 90 5C            [ 1]  252 	incw y  
      008C78 20 DE            [ 2]  253 	jra decomp_loop
      008C7A                        254 3$:
      008C7A A1 84            [ 1]  255 	cp a,#TK_INTGR
      008C7C 26 22            [ 1]  256 	jrne 4$
                                    257 ;; TK_INTGR
      008C7E CD 8B 83         [ 4]  258 	call add_space
      008C81 72 5F 00 0D      [ 1]  259 	clr acc24 
      008C85 CF 00 0E         [ 2]  260 	ldw acc16,x 
      008C88 90 89            [ 2]  261 	pushw y 
      008C8A CD 93 73         [ 4]  262 	call itoa  
      008C8D 16 01            [ 2]  263 	ldw y,(1,sp) 
      008C8F 88               [ 1]  264 	push a 
      008C90 51               [ 1]  265 	exgw x,y 
      008C91 CD 8E A8         [ 4]  266 	call strcpy 
      008C94 90 5F            [ 1]  267 	clrw y
      008C96 84               [ 1]  268 	pop a  
      008C97 90 97            [ 1]  269 	ld yl,a 
      008C99 72 F9 01         [ 2]  270 	addw y,(1,sp)
      000C1C                        271 	_drop 2 
      008C9C 5B 02            [ 2]    1     addw sp,#2 
      008C9E 20 B8            [ 2]  272 	jra decomp_loop
      008CA0                        273 4$: ; dictionary keyword 
      008CA0 CD 8B F0         [ 4]  274 	call get_cmd_idx 
      008CA3 A3 00 8C         [ 2]  275 	cpw x,#REM_IDX
      008CA6 26 23            [ 1]  276 	jrne 5$
      008CA8 CE 00 05         [ 2]  277 	ldw x,basicptr 
                                    278 ; copy comment to buffer 
      008CAB CD 8B 83         [ 4]  279 	call add_space
      008CAE A6 27            [ 1]  280 	ld a,#''
      008CB0 90 F7            [ 1]  281 	ld (y),a 
      008CB2 90 5C            [ 1]  282 	incw y 
      008CB4                        283 46$:
      008CB4 72 D6 00 01      [ 4]  284 	ld a,([in.w],x)
      008CB8 72 5C 00 02      [ 1]  285 	inc in  
      008CBC 90 F7            [ 1]  286 	ld (y),a 
      008CBE 90 5C            [ 1]  287 	incw y 
      008CC0 C6 00 02         [ 1]  288 	ld a,in 
      008CC3 C1 00 04         [ 1]  289 	cp a,count 
      008CC6 2B EC            [ 1]  290 	jrmi 46$
      008CC8 CC 8D 72         [ 2]  291 	jp 20$  
      008CCB A3 00 50         [ 2]  292 5$: cpw x,#LET_IDX 
      008CCE 26 03            [ 1]  293 	jrne 51$
      008CD0 CC 8C 58         [ 2]  294 	jp decomp_loop ; down display LET 	
      008CD3                        295 51$: ; insert command name 
      008CD3 CD 8B 83         [ 4]  296 	call add_space  
      008CD6 90 89            [ 2]  297 	pushw y
      008CD8 CD 8D AD         [ 4]  298 	call cmd_name
      008CDB 90 85            [ 2]  299 	popw y 
      008CDD CD 8B 6E         [ 4]  300 	call cpy_cmd_name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      008CE0 CC 8C 58         [ 2]  301 	jp decomp_loop 
      008CE3                        302 6$:
                                    303 ; label?
      008CE3 A1 01            [ 1]  304 	cp a,#TK_LABEL 
      008CE5 26 23            [ 1]  305 	jrne 64$
                                    306 ; copy label string to output buffer   	
      008CE7 A6 20            [ 1]  307 	ld a,#32 
      008CE9 90 F7            [ 1]  308 	ld (y),a 
      008CEB 90 5C            [ 1]  309 	incw y 
      008CED CE 00 05         [ 2]  310 	ldw x,basicptr 
      008CF0                        311 61$:
      008CF0 72 D6 00 01      [ 4]  312 	ld a,([in.w],x)
      008CF4 72 5C 00 02      [ 1]  313 	inc in 
      008CF8 4D               [ 1]  314 	tnz a 
      008CF9 27 06            [ 1]  315 	jreq 62$
      008CFB 90 F7            [ 1]  316 	ld (y),a 
      008CFD 90 5C            [ 1]  317 	incw y 
      008CFF 20 EF            [ 2]  318 	jra 61$ 
      008D01                        319 62$: 
      008D01 A6 20            [ 1]  320 	ld a,#32 
      008D03 90 F7            [ 1]  321 	ld (y),a 
      008D05 90 5C            [ 1]  322 	incw y 
      008D07 CC 8C 58         [ 2]  323 	jp decomp_loop
      008D0A                        324 64$:
      008D0A A1 02            [ 1]  325 	cp a,#TK_QSTR 
      008D0C 26 06            [ 1]  326 	jrne 7$
                                    327 ;; TK_QSTR
      008D0E CD 8B A7         [ 4]  328 	call cpy_quote  
      008D11 CC 8C 58         [ 2]  329 	jp decomp_loop
      008D14                        330 7$:
      008D14 A1 03            [ 1]  331 	cp a,#TK_CHAR 
      008D16 26 0E            [ 1]  332 	jrne 8$
                                    333 ;; TK_CHAR 
      008D18 A6 5C            [ 1]  334 	ld a,#'\ 
      008D1A 90 F7            [ 1]  335 	ld (y),a 
      008D1C 90 5C            [ 1]  336 	incw y 
      008D1E 9F               [ 1]  337 	ld a,xl 
      008D1F 90 F7            [ 1]  338 	ld (y),a 
      008D21 90 5C            [ 1]  339 	incw y 
      008D23 CC 8C 58         [ 2]  340 	jp decomp_loop
      008D26 A1 0B            [ 1]  341 8$: cp a,#TK_COLON 
      008D28 26 09            [ 1]  342 	jrne 9$
      008D2A A6 3A            [ 1]  343 	ld a,#':
      008D2C                        344 81$:
      008D2C 90 F7            [ 1]  345 	ld (y),a 
      008D2E 90 5C            [ 1]  346 	incw y 
      008D30                        347 82$:
      008D30 CC 8C 58         [ 2]  348 	jp decomp_loop
      008D33                        349 9$: 
      008D33 A1 0A            [ 1]  350 	cp a,#TK_SHARP
      008D35 22 0A            [ 1]  351 	jrugt 10$ 
      008D37 A0 06            [ 1]  352 	sub a,#TK_ARRAY 
      008D39 5F               [ 1]  353 	clrw x 
      008D3A 97               [ 1]  354 	ld xl,a
      008D3B 1C 8D 88         [ 2]  355 	addw x,#single_char 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      008D3E F6               [ 1]  356 	ld a,(x)
      008D3F 20 EB            [ 2]  357 	jra 81$ 
      008D41                        358 10$: 
      008D41 A1 11            [ 1]  359 	cp a,#TK_MINUS 
      008D43 22 0A            [ 1]  360 	jrugt 11$
      008D45 A0 10            [ 1]  361 	sub a,#TK_PLUS 
      008D47 5F               [ 1]  362 	clrw x 
      008D48 97               [ 1]  363 	ld xl,a 
      008D49 1C 8D 8D         [ 2]  364 	addw x,#add_char 
      008D4C F6               [ 1]  365 	ld a,(x)
      008D4D 20 DD            [ 2]  366 	jra 81$
      008D4F                        367 11$:
      008D4F A1 22            [ 1]  368     cp a,#TK_MOD 
      008D51 22 0A            [ 1]  369 	jrugt 12$
      008D53 A0 20            [ 1]  370 	sub a,#TK_MULT
      008D55 5F               [ 1]  371 	clrw x 
      008D56 97               [ 1]  372 	ld xl,a 
      008D57 1C 8D 8F         [ 2]  373 	addw x,#mul_char
      008D5A F6               [ 1]  374 	ld a,(x)
      008D5B 20 CF            [ 2]  375 	jra 81$
      008D5D                        376 12$:
      008D5D A0 31            [ 1]  377 	sub a,#TK_GT  
      008D5F 48               [ 1]  378 	sll a 
      008D60 5F               [ 1]  379 	clrw x 
      008D61 97               [ 1]  380 	ld xl,a 
      008D62 1C 8D 92         [ 2]  381 	addw x,#relop_str 
      008D65 FE               [ 2]  382 	ldw x,(x)
      008D66 F6               [ 1]  383 	ld a,(x)
      008D67 5C               [ 1]  384 	incw x 
      008D68 90 F7            [ 1]  385 	ld (y),a
      008D6A 90 5C            [ 1]  386 	incw y 
      008D6C F6               [ 1]  387 	ld a,(x)
      008D6D 26 BD            [ 1]  388 	jrne 81$
      008D6F CC 8C 58         [ 2]  389 	jp decomp_loop 
      008D72                        390 20$: 
      008D72 90 7F            [ 1]  391 	clr (y)
      008D74 1E 03            [ 2]  392 	ldw x,(STR,sp)
      008D76 7B 01            [ 1]  393 	ld a,(BASE_SAV,sp)
      008D78 C7 00 0B         [ 1]  394 	ld base,a 
      008D7B 7B 02            [ 1]  395 	ld a,(WIDTH_SAV,sp)
      008D7D C7 00 23         [ 1]  396 	ld tab_width,a
      008D80 72 F2 03         [ 2]  397 	subw y,(STR,sp) 
      008D83 90 9F            [ 1]  398 	ld a,yl 
      000D05                        399 	_drop VSIZE 
      008D85 5B 04            [ 2]    1     addw sp,#VSIZE 
      008D87 81               [ 4]  400 	ret 
                                    401 
      008D88 40 28 29 2C 23         402 single_char: .byte '@','(',')',',','#'
      008D8D 2B 2D                  403 add_char: .byte '+','-'
      008D8F 2A 2F 25               404 mul_char: .byte '*','/','%'
      008D92 8D 9E 8D A0 8D A2 8D   405 relop_str: .word gt,equal,ge,lt,le,ne 
             A5 8D A7 8D AA
      008D9E 3E 00                  406 gt: .asciz ">"
      008DA0 3D 00                  407 equal: .asciz "="
      008DA2 3E 3D 00               408 ge: .asciz ">="
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      008DA5 3C 00                  409 lt: .asciz "<"
      008DA7 3C 3D 00               410 le: .asciz "<="
      008DAA 3C 3E 00               411 ne:  .asciz "<>"
                                    412 
                                    413 ;----------------------------------
                                    414 ; search in kword_dict name
                                    415 ; from its execution address 
                                    416 ; input:
                                    417 ;   X       	cmd_index 
                                    418 ; output:
                                    419 ;   X 			cstr*  | 0 
                                    420 ;--------------------------------
                           000001   421 	CMDX=1 
                           000003   422 	LINK=3 
                           000004   423 	VSIZE=4
      008DAD                        424 cmd_name:
      000D2D                        425 	_vars VSIZE 
      008DAD 52 04            [ 2]    1     sub sp,#VSIZE 
      008DAF 72 5F 00 0E      [ 1]  426 	clr acc16 
      008DB3 1F 01            [ 2]  427 	ldw (CMDX,sp),x  
      008DB5 AE AB 3B         [ 2]  428 	ldw x,#kword_dict	
      008DB8 1F 03            [ 2]  429 1$:	ldw (LINK,sp),x
      008DBA E6 02            [ 1]  430 	ld a,(2,x)
      008DBC A4 0F            [ 1]  431 	and a,#15 
      008DBE C7 00 0F         [ 1]  432 	ld acc8,a 
      008DC1 1C 00 03         [ 2]  433 	addw x,#3
      008DC4 72 BB 00 0E      [ 2]  434 	addw x,acc16
      008DC8 FE               [ 2]  435 	ldw x,(x) ; command index  
      008DC9 13 01            [ 2]  436 	cpw x,(CMDX,sp)
      008DCB 27 0A            [ 1]  437 	jreq 2$
      008DCD 1E 03            [ 2]  438 	ldw x,(LINK,sp)
      008DCF FE               [ 2]  439 	ldw x,(x) 
      008DD0 1D 00 02         [ 2]  440 	subw x,#2  
      008DD3 26 E3            [ 1]  441 	jrne 1$
      008DD5 20 05            [ 2]  442 	jra 9$
      008DD7 1E 03            [ 2]  443 2$: ldw x,(LINK,sp)
      008DD9 1C 00 02         [ 2]  444 	addw x,#2 	
      000D5C                        445 9$:	_drop VSIZE
      008DDC 5B 04            [ 2]    1     addw sp,#VSIZE 
      008DDE 81               [ 4]  446 	ret
                                    447 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                     29     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000000     5 SEPARATE=0 ; set to 1 for 'make separate' 
                                      6 
                                      7 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
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
      000024                         69 rx1_queue: .ds RX_QUEUE_SIZE ; UART1 receive circular queue 
      00002C                         70 rx1_head:  .blkb 1 ; rx1_queue head pointer
      00002D                         71 rx1_tail:   .blkb 1 ; rx1_queue tail pointer  
      00002E                         72 free_eeprom: .blkw 1 ; start address of free eeprom 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
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
      008DDF                         96 prt_tok:
      000D5F                         97 	_vars VSIZE 
      008DDF 52 04            [ 2]    1     sub sp,#VSIZE 
      008DE1 6B 02            [ 1]   98 	ld (AREG,sp),a 
      008DE3 1F 03            [ 2]   99 	ldw (XREG,sp),x 
      008DE5 C6 00 0B         [ 1]  100 	ld a, base
      008DE8 6B 01            [ 1]  101 	ld (BSAVE,sp),a 
      008DEA 35 10 00 0B      [ 1]  102 	mov base,#16  
      008DEE AE 8E 16         [ 2]  103 	ldw x,#token_msg
      008DF1 CD 83 CE         [ 4]  104 	call puts 
      008DF4 5F               [ 1]  105 	clrw x 
      008DF5 7B 02            [ 1]  106 	ld a,(AREG,sp)
      008DF7 97               [ 1]  107 	ld xl,a 
      008DF8 CD 93 57         [ 4]  108 	call print_int 
      008DFB A6 20            [ 1]  109 	ld a,#SPACE
      008DFD CD 83 71         [ 4]  110 	call putc 
      008E00 1E 03            [ 2]  111 	ldw x,(XREG,sp)
      008E02 CD 93 57         [ 4]  112 	call print_int 
      008E05 A6 0D            [ 1]  113 	ld a,#CR 
      008E07 CD 83 71         [ 4]  114 	call putc 
      008E0A 7B 01            [ 1]  115 	ld a,(BSAVE,sp)
      008E0C C7 00 0B         [ 1]  116 	ld base,a 
      008E0F 7B 02            [ 1]  117 	ld a,(AREG,sp)
      008E11 1E 03            [ 2]  118 	ldw x,(XREG,sp)
      000D93                        119 	_drop VSIZE 
      008E13 5B 04            [ 2]    1     addw sp,#VSIZE 
      008E15 81               [ 4]  120 	ret 
      008E16 74 6F 6B 65 6E 3A 20   121 token_msg: .asciz "token: "
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
      008E1E                        136 show_row:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      008E1E 4D               [ 1]  137 	tnz a 
      008E1F 26 01            [ 1]  138 	jrne 1$
      008E21 81               [ 4]  139 	ret 
      008E22                        140 1$:	
      008E22 89               [ 2]  141 	pushw x  
      008E23 88               [ 1]  142 	push a 
      008E24 35 04 00 23      [ 1]  143 	mov tab_width,#4 
      008E28 CD 93 57         [ 4]  144 	call print_int 
      008E2B A6 20            [ 1]  145 	ld a,#SPACE  
      008E2D CD 83 71         [ 4]  146 	call putc
      008E30                        147 row_loop:
      008E30 1E 02            [ 2]  148 	ldw x,(ADR,sp)
      008E32 F6               [ 1]  149 	ld a,(x)
      008E33 5F               [ 1]  150 	clrw x 
      008E34 97               [ 1]  151 	ld xl,a 
      008E35 CD 93 57         [ 4]  152 	call print_int 
      008E38 1E 02            [ 2]  153 	ldw x,(ADR,sp)
      008E3A 5C               [ 1]  154 	incw x 
      008E3B 1F 02            [ 2]  155 	ldw (ADR,sp),x 
      008E3D 0A 01            [ 1]  156 	dec (CNT,sp)
      008E3F 26 EF            [ 1]  157 	jrne row_loop
      000DC1                        158 	_drop VSIZE  		
      008E41 5B 03            [ 2]    1     addw sp,#VSIZE 
      008E43 35 04 00 23      [ 1]  159 	mov tab_width,#4
      008E47 A6 0D            [ 1]  160 	ld a,#CR 
      008E49 CD 83 71         [ 4]  161 	call putc 
      008E4C 81               [ 4]  162 	ret 
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
      008E4D                        175 hex_dump:
      008E4D 88               [ 1]  176 	push a 
      000DCE                        177 	_vars VSIZE
      008E4E 52 04            [ 2]    1     sub sp,#VSIZE 
      008E50 C6 00 0B         [ 1]  178 	ld a,base
      008E53 6B 03            [ 1]  179 	ld (BASE,sp),a 
      008E55 35 10 00 0B      [ 1]  180 	mov base,#16
      008E59 C6 00 23         [ 1]  181 	ld a,tab_width 
      008E5C 6B 04            [ 1]  182 	ld (TABW,sp),a
      008E5E A6 0D            [ 1]  183 	ld a,#CR 
      008E60 CD 83 71         [ 4]  184 	call putc 
      008E63 17 01            [ 2]  185 1$: ldw (BCNT,sp),y
      008E65 A6 10            [ 1]  186 	ld a,#16
      008E67 90 A3 00 10      [ 2]  187 	cpw y,#16
      008E6B 2A 02            [ 1]  188 	jrpl 2$
      008E6D 90 9F            [ 1]  189 	ld a,yl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      008E6F                        190 2$: 	
      008E6F CD 8E 1E         [ 4]  191 	call show_row 
      008E72 16 01            [ 2]  192 	ldw y,(BCNT,sp) 
      008E74 72 A2 00 10      [ 2]  193 	subw y,#16 
      008E78 90 A3 00 01      [ 2]  194 	cpw y,#1
      008E7C 2A E5            [ 1]  195 	jrpl 1$
      008E7E 7B 03            [ 1]  196 	ld a,(BASE,sp)
      008E80 C7 00 0B         [ 1]  197 	ld base,a
      008E83 7B 04            [ 1]  198 	ld a,(TABW,sp)
      008E85 C7 00 23         [ 1]  199 	ld tab_width,a 
      000E08                        200 	_drop VSIZE
      008E88 5B 04            [ 2]    1     addw sp,#VSIZE 
      008E8A 84               [ 1]  201 	pop a 
      008E8B 81               [ 4]  202 	ret 
                                    203 
                                    204 ;-------------------------------------
                                    205 ; retrun string length
                                    206 ; input:
                                    207 ;   X         .asciz  pointer 
                                    208 ; output:
                                    209 ;   X         not affected 
                                    210 ;   A         length 
                                    211 ;-------------------------------------
      008E8C                        212 strlen::
      008E8C 89               [ 2]  213 	pushw x 
      008E8D 4F               [ 1]  214 	clr a
      008E8E 7D               [ 1]  215 1$:	tnz (x) 
      008E8F 27 04            [ 1]  216 	jreq 9$ 
      008E91 4C               [ 1]  217 	inc a 
      008E92 5C               [ 1]  218 	incw x 
      008E93 20 F9            [ 2]  219 	jra 1$ 
      008E95 85               [ 2]  220 9$:	popw x 
      008E96 81               [ 4]  221 	ret 
                                    222 
                                    223 ;------------------------------------
                                    224 ; compare 2 strings
                                    225 ; input:
                                    226 ;   X 		char* first string 
                                    227 ;   Y       char* second string 
                                    228 ; output:
                                    229 ;   A 		0|1 
                                    230 ;-------------------------------------
      008E97                        231 strcmp:
      008E97 F6               [ 1]  232 	ld a,(x)
      008E98 27 0B            [ 1]  233 	jreq 5$ 
      008E9A 90 F1            [ 1]  234 	cp a,(y) 
      008E9C 26 05            [ 1]  235 	jrne 4$ 
      008E9E 5C               [ 1]  236 	incw x 
      008E9F 90 5C            [ 1]  237 	incw y 
      008EA1 20 F4            [ 2]  238 	jra strcmp 
      008EA3                        239 4$: ; not same  
      008EA3 4F               [ 1]  240 	clr a 
      008EA4 81               [ 4]  241 	ret 
      008EA5                        242 5$: ; same 
      008EA5 A6 01            [ 1]  243 	ld a,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      008EA7 81               [ 4]  244 	ret 
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
      008EA8                        255 strcpy::
      008EA8 88               [ 1]  256 	push a 
      008EA9 89               [ 2]  257 	pushw x 
      008EAA 90 F6            [ 1]  258 1$: ld a,(y)
      008EAC 27 06            [ 1]  259 	jreq 9$ 
      008EAE F7               [ 1]  260 	ld (x),a 
      008EAF 5C               [ 1]  261 	incw x 
      008EB0 90 5C            [ 1]  262 	incw y 
      008EB2 20 F6            [ 2]  263 	jra 1$ 
      008EB4 7F               [ 1]  264 9$:	clr (x)
      008EB5 85               [ 2]  265 	popw x 
      008EB6 84               [ 1]  266 	pop a 
      008EB7 81               [ 4]  267 	ret 
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
      008EB8                        281 move::
      008EB8 88               [ 1]  282 	push a 
      000E39                        283 	_vars VSIZE 
      008EB9 52 02            [ 2]    1     sub sp,#VSIZE 
      008EBB 0F 01            [ 1]  284 	clr (INCR,sp)
      008EBD 0F 02            [ 1]  285 	clr (LB,sp)
      008EBF 90 89            [ 2]  286 	pushw y 
      008EC1 13 01            [ 2]  287 	cpw x,(1,sp) ; compare DEST to SRC 
      008EC3 90 85            [ 2]  288 	popw y 
      008EC5 27 31            [ 1]  289 	jreq move_exit ; x==y 
      008EC7 2B 0E            [ 1]  290 	jrmi move_down
      008EC9                        291 move_up: ; start from top address with incr=-1
      008EC9 72 BB 00 0E      [ 2]  292 	addw x,acc16
      008ECD 72 B9 00 0E      [ 2]  293 	addw y,acc16
      008ED1 03 01            [ 1]  294 	cpl (INCR,sp)
      008ED3 03 02            [ 1]  295 	cpl (LB,sp)   ; increment = -1 
      008ED5 20 05            [ 2]  296 	jra move_loop  
      008ED7                        297 move_down: ; start from bottom address with incr=1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      008ED7 5A               [ 2]  298     decw x 
      008ED8 90 5A            [ 2]  299 	decw y
      008EDA 0C 02            [ 1]  300 	inc (LB,sp) ; incr=1 
      008EDC                        301 move_loop:	
      008EDC C6 00 0E         [ 1]  302     ld a, acc16 
      008EDF CA 00 0F         [ 1]  303 	or a, acc8
      008EE2 27 14            [ 1]  304 	jreq move_exit 
      008EE4 72 FB 01         [ 2]  305 	addw x,(INCR,sp)
      008EE7 72 F9 01         [ 2]  306 	addw y,(INCR,sp) 
      008EEA 90 F6            [ 1]  307 	ld a,(y)
      008EEC F7               [ 1]  308 	ld (x),a 
      008EED 89               [ 2]  309 	pushw x 
      008EEE CE 00 0E         [ 2]  310 	ldw x,acc16 
      008EF1 5A               [ 2]  311 	decw x 
      008EF2 CF 00 0E         [ 2]  312 	ldw acc16,x 
      008EF5 85               [ 2]  313 	popw x 
      008EF6 20 E4            [ 2]  314 	jra move_loop
      008EF8                        315 move_exit:
      000E78                        316 	_drop VSIZE
      008EF8 5B 02            [ 2]    1     addw sp,#VSIZE 
      008EFA 84               [ 1]  317 	pop a 
      008EFB 81               [ 4]  318 	ret 	
                                    319 
                                    320 ;------------------------------------
                                    321 ;  set all variables to zero 
                                    322 ; input:
                                    323 ;   none 
                                    324 ; output:
                                    325 ;	none
                                    326 ;------------------------------------
      008EFC                        327 clear_vars:
      008EFC 89               [ 2]  328 	pushw x 
      008EFD 90 89            [ 2]  329 	pushw y 
      008EFF AE 00 30         [ 2]  330 	ldw x,#vars 
      008F02 90 AE 00 34      [ 2]  331 	ldw y,#2*26 
      008F06 7F               [ 1]  332 1$:	clr (x)
      008F07 5C               [ 1]  333 	incw x 
      008F08 90 5A            [ 2]  334 	decw y 
      008F0A 26 FA            [ 1]  335 	jrne 1$
      008F0C 90 85            [ 2]  336 	popw y 
      008F0E 85               [ 2]  337 	popw x 
      008F0F 81               [ 4]  338 	ret 
                                    339 
                                    340 ;-------------------------------------
                                    341 ;  program initialization entry point 
                                    342 ;-------------------------------------
                           000002   343 	MAJOR=2
                           000000   344 	MINOR=0 
      008F10 0A 0A 54 69 6E 79 20   345 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal  73-Bits]



             73 20 32 30 31 39 2C
             32 30 32 32 0A 76 65
             72 73 69 6F 6E 20 00
      000ED6                        346 cold_start:
                                    347 ;set stack 
      008F42 20 32 30         [ 2]  348 	ldw x,#STACK_EMPTY
      008F45 31               [ 1]  349 	ldw sp,x   
                                    350 ; clear all ram 
      008F46 39               [ 1]  351 0$: clr (x)
      008F47 2C               [ 2]  352 	decw x 
      008F48 32 30            [ 1]  353 	jrne 0$
                                    354 ; activate pull up on all inputs 
      008F4A 32 32            [ 1]  355 	ld a,#255 
      008F4C 0A 76 65         [ 1]  356 	ld PA_CR1,a 
      008F4F 72 73 69         [ 1]  357 	ld PB_CR1,a 
      008F52 6F 6E 20         [ 1]  358 	ld PC_CR1,a 
      008F55 00 50 12         [ 1]  359 	ld PD_CR1,a 
      008F56 C7 50 17         [ 1]  360 	ld PE_CR1,a 
      008F56 AE 17 FF         [ 1]  361 	ld PF_CR1,a 
      008F59 94 7F 5A         [ 1]  362 	ld PG_CR1,a 
      008F5C 26 FC A6         [ 1]  363 	ld PI_CR1,a
                                    364 ; set LD2 pin as output 
      008F5F FF C7 50 03      [ 1]  365     bset PC_CR1,#LED2_BIT
      008F63 C7 50 08 C7      [ 1]  366     bset PC_CR2,#LED2_BIT
      008F67 50 0D C7 50      [ 1]  367     bset PC_DDR,#LED2_BIT
      008F6B 12 C7 50 17      [ 1]  368 	bres PC_ODR,#LED2_BIT 
                                    369 ; disable schmitt triggers on Arduino CN4 analog inputs
      008F6F C7 50 1C C7 50   [ 1]  370 	mov ADC_TDRL,0x3f
                                    371 ; disable peripherals clocks
                                    372 ;	clr CLK_PCKENR1 
                                    373 ;	clr CLK_PCKENR2
      008F74 21 C7 50 2B      [ 1]  374 	clr AWU_TBR 
      008F78 72 1A 50 0D      [ 1]  375 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                    376 ; select internal clock no divisor: 16 Mhz 	
      008F7C 72 1A            [ 1]  377 	ld a,#CLK_SWR_HSI 
      008F7E 50               [ 1]  378 	clrw x  
      008F7F 0E 72 1A         [ 4]  379     call clock_init 
      008F82 50 0C 72         [ 4]  380 	call timer4_init
      008F85 1B 50 0A         [ 4]  381 	call timer2_init
                                    382 ; UART1 at 115200 BAUD
      008F88 55 00 3F         [ 4]  383 	call uart1_init
                                    384 ; activate PE_4 (user button interrupt)
      008F8B 54 07 72 5F      [ 1]  385     bset PE_CR2,#USR_BTN_BIT 
                                    386 ; display system information
      008F8F 50 F2 72         [ 2]  387 	ldw x,#software 
      008F92 14 50 CA         [ 4]  388 	call puts 
      008F95 A6 E1            [ 1]  389 	ld a,#MAJOR 
      008F97 5F CD 80         [ 1]  390 	ld acc8,a 
      008F9A F6               [ 1]  391 	clrw x 
      008F9B CD 81 19         [ 2]  392 	ldw acc24,x
      008F9E CD 81 0C CD      [ 1]  393 	clr tab_width  
      008FA2 83 2C 72 18      [ 1]  394 	mov base, #10 
      008FA6 50 18 AE         [ 4]  395 	call prti24 
      008FA9 8F 10            [ 1]  396 	ld a,#'.
      008FAB CD 83 CE         [ 4]  397 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      008FAE A6 02            [ 1]  398 	ld a,#MINOR 
      008FB0 C7 00 0F         [ 1]  399 	ld acc8,a 
      008FB3 5F               [ 1]  400 	clrw x 
      008FB4 CF 00 0D         [ 2]  401 	ldw acc24,x 
      008FB7 72 5F 00         [ 4]  402 	call prti24
      008FBA 23 35            [ 1]  403 	ld a,#CR 
      008FBC 0A 00 0B         [ 4]  404 	call putc
      008FBF CD               [ 1]  405 	rim 
      008FC0 93 67 A6 2E      [ 1]  406 	inc seedy+1 
      008FC4 CD 83 71 A6      [ 1]  407 	inc seedx+1 
      008FC8 00 C7 00         [ 4]  408 	call clear_basic
      008FCB 0F 5F CF         [ 4]  409 	call ubound 
      008FCE 00 0D CD         [ 4]  410 	call beep_1khz  
      000F6A                        411 2$:	
      008FD1 93 67 A6         [ 4]  412 	call warm_init
                                    413 ; check for application in flash memory 
      008FD4 0D CD 83         [ 2]  414 	ldw x,app_sign 
      008FD7 71 9A 72         [ 2]  415 	cpw x,SIGNATURE 
      008FDA 5C 00            [ 1]  416 	jreq run_app
      008FDC 17 72 5C         [ 2]  417 	jp cmd_line
      000F78                        418 run_app:
                                    419 ; run application in FLASH|EEPROM 
      008FDF 00 15 CD         [ 2]  420 	ldw x,app_size  
      008FE2 90               [ 2]  421 	pushw x 
      008FE3 79 CD 99         [ 2]  422 	ldw x,#app 
      008FE6 0E CD 9E         [ 2]  423 	ldw txtbgn,x
      008FE9 A0 00 04         [ 2]  424 	ldw basicptr,x 
      008FEA 72 FB 01         [ 2]  425 	addw x,(1,sp) ; x+size 
      000F88                        426 	_drop 2 
      008FEA CD 90            [ 2]    1     addw sp,#2 
      008FEC 5B CE AC         [ 2]  427 	ldw txtend,x 
      008FEF 80 C3 A1         [ 2]  428 	ldw x,#RUNNING 
      008FF2 22 27 03         [ 4]  429 	call puts
      008FF5 CC 92 98         [ 2]  430 	ldw x,basicptr    
      008FF8 35 10 00 0A      [ 1]  431 	mov base,#16 
      008FF8 CE AC 82         [ 4]  432 	call print_int
      008FFB 89 AE AC 84      [ 1]  433 	mov base,#10  
      008FFF CF 00 1B         [ 2]  434 	ldw x, basicptr 
      009002 CF 00            [ 1]  435 	ld a,(2,x)
      009004 05 72 FB         [ 1]  436 	ld count,a 
      009007 01 5B 02 CF      [ 1]  437 	mov in,#3 
      00900B 00 1D AE 90      [ 1]  438 	bset flags,#FRUN
      00900F 39 CD 83         [ 4]  439 	call ubound   
      009012 CE CE 00         [ 2]  440 	jp interpreter  
      009015 05 35            [ 2]  441     jra .  
                                    442 
      009017 10 00 0B CD 93 57 35   443 RUNNING: .asciz "\nrunning application at address: " 
             0A 00 0B CE 00 05 E6
             02 C7 00 04 35 03 00
             02 72 10 00 22 CD 99
             0E CC 92 B4 20 FE
                                    444 
      000FDB                        445 warm_init:
      009039 0A 72 75 6E      [ 1]  446 	clr flags 
      00903D 6E 69 6E 67      [ 1]  447 	clr loop_depth 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009041 20 61 70 70      [ 1]  448 	mov tab_width,#TAB_WIDTH 
      009045 6C 69 63 61      [ 1]  449 	mov base,#10 
      009049 74 69 6F         [ 2]  450 	ldw x,#0 
      00904C 6E 20 61         [ 2]  451 	ldw basicptr,x 
      00904F 74 20 61         [ 2]  452 	ldw in.w,x 
      009052 64 64 72 65      [ 1]  453 	clr count
      009056 73               [ 4]  454 	ret 
                                    455 
                                    456 
                                    457 ;---------------------------
                                    458 ; reset BASIC text variables 
                                    459 ; and clear variables 
                                    460 ;---------------------------
      000FF9                        461 clear_basic:
      009057 73               [ 2]  462 	pushw x 
      009058 3A 20 00 03      [ 1]  463 	clr count
      00905B 72 5F 00 01      [ 1]  464 	clr in  
      00905B 72 5F 00         [ 2]  465 	ldw x,#free_ram 
      00905E 22 72 5F         [ 2]  466 	ldw txtbgn,x 
      009061 00 1F 35         [ 2]  467 	ldw txtend,x 
      009064 04 00 23         [ 4]  468 	call clear_vars 
      009067 35               [ 2]  469 	popw x
      009068 0A               [ 4]  470 	ret 
                                    471 
                                    472 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    473 ;;   Tiny BASIC error messages     ;;
                                    474 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001010                        475 err_msg:
      009069 00 0B AE 00 00 CF 00   476 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             05 CF 00 01 72
      009075 5F 00 04 81 10 B9 10   477 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             CA 10 DB
      009079 10 E7 11 1A 11 2A 11   478 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             3E 11 51
                                    479 
      009079 89 72 5F 00 04 72 5F   480 err_mem_full: .asciz "Memory full\n" 
             00 02 AE 00 80 CF
      009086 00 1B CF 00 1D CD 8E   481 err_syntax: .asciz "syntax error\n" 
             FC 85 81 6F 72 0A 00
      009090 6D 61 74 68 20 6F 70   482 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      009090 00 00 90 B0 90 BD 90   483 err_div0: .asciz "division by 0\n" 
             CB 90 E4 90 F3 91 09
             91
      00909F 1F 91 39 91 4A 91 5B   484 err_no_line: .asciz "invalid line number.\n"
             91 67 91 9A 91 AA 91
             BE 91 D1 4D 65 6D 6F
             72
      0090B5 79 20 66 75 6C 6C 0A   485 err_run_only: .asciz "run time only usage.\n" 
             00 73 79 6E 74 61 78
             20 65 72 72 6F 72 0A
             00
      0090CB 6D 61 74 68 20 6F 70   486 err_cmd_only: .asciz "command line only usage.\n"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal  65-Bits]



             20 6C 69 6E 65 20 6F
             6E 6C 79 20 75 73 61
             67 65 2E 0A 00
      0090D3 72 61 74 69 6F 6E 20   487 err_duplicate: .asciz "duplicate name.\n"
             6F 76 65 72 66 6C 6F
             77 0A 00
      0090E4 64 69 76 69 73 69 6F   488 err_not_file: .asciz "File not found.\n"
             6E 20 62 79 20 30 0A
             00 69 6E
      0090F5 76 61 6C 69 64 20 6C   489 err_bad_value: .asciz "bad value.\n"
             69 6E 65 20 6E
      009101 75 6D 62 65 72 2E 0A   490 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             00 72 75 6E 20 74 69
             6D 65 20 6F 6E 6C 79
             20 75 73 61 67 65 2E
             0A 00 63 6F 6D 6D 61
             6E 64 20 6C 69 6E 65
             20 6F 6E 6C 79 20 75
             73 61
      009134 67 65 2E 0A 00 64 75   491 err_no_data: .asciz "No data found.\n"
             70 6C 69 63 61 74 65
             20 6E
      009144 61 6D 65 2E 0A 00 46   492 err_no_prog: .asciz "No program in RAM!\n"
             69 6C 65 20 6E 6F 74
             20 66 6F 75 6E 64
      009158 2E 0A 00 62 61 64 20   493 err_no_fspace: .asciz "File system full.\n" 
             76 61 6C 75 65 2E 0A
             00 46 69 6C 65
      00916B 20 69 6E 20 65 78 74   494 err_buf_full: .asciz "Buffer full\n"
             65 6E 64 65 64 20
                                    495 
      009178 6D 65 6D 6F 72 79 2C   496 rt_msg: .asciz "\nrun time error, "
             20 63 61 6E 27 74 20
             62 65 20 72
      00918A 75 6E 20 66 72 6F 6D   497 comp_msg: .asciz "\ncompile error, "
             20 74 68 65 72 65 2E
             0A 00 4E
      00919B 6F 20 64 61 74 61 20   498 tk_id: .asciz "last token id: "
             66 6F 75 6E 64 2E 0A
             00 4E
                                    499 
      001191                        500 syntax_error::
      0091AB 6F 20            [ 1]  501 	ld a,#ERR_SYNTAX 
                                    502 
      001193                        503 tb_error::
      0091AD 70 72 6F 67 72   [ 2]  504 	btjt flags,#FCOMP,1$
      0091B2 61               [ 1]  505 	push a 
      0091B3 6D 20 69         [ 2]  506 	ldw x, #rt_msg 
      0091B6 6E 20 52         [ 4]  507 	call puts 
      0091B9 41               [ 1]  508 	pop a 
      0091BA 4D 21 0A         [ 2]  509 	ldw x, #err_msg 
      0091BD 00 46 69 6C      [ 1]  510 	clr acc16 
      0091C1 65               [ 1]  511 	sll a
      0091C2 20 73 79 73      [ 1]  512 	rlc acc16  
      0091C6 74 65 6D         [ 1]  513 	ld acc8, a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      0091C9 20 66 75 6C      [ 2]  514 	addw x,acc16 
      0091CD 6C               [ 2]  515 	ldw x,(x)
      0091CE 2E 0A 00         [ 4]  516 	call puts
      0091D1 42 75 66         [ 2]  517 	ldw x,basicptr
      0091D4 66 65 72         [ 1]  518 	ld a,in 
      0091D7 20 66 75         [ 4]  519 	call prt_basic_line
      0091DA 6C 6C 0A         [ 2]  520 	ldw x,#tk_id 
      0091DD 00 0A 72         [ 4]  521 	call puts 
      0091E0 75 6E 20         [ 1]  522 	ld a,in.saved 
      0091E3 74               [ 1]  523 	clrw x 
      0091E4 69               [ 1]  524 	ld xl,a 
      0091E5 6D 65 20 65      [ 2]  525 	addw x,basicptr 
      0091E9 72               [ 1]  526 	ld a,(x)
      0091EA 72               [ 1]  527 	clrw x 
      0091EB 6F               [ 1]  528 	ld xl,a 
      0091EC 72 2C 20         [ 4]  529 	call print_int
      0091EF 00 0A 63 6F 6D   [ 2]  530 	btjf flags,#FAUTORUN ,6$
      0091F4 70 69            [ 2]  531 	jra 6$
      0011DC                        532 1$:	
      0091F6 6C               [ 1]  533 	push a 
      0091F7 65 20 65         [ 2]  534 	ldw x,#comp_msg
      0091FA 72 72 6F         [ 4]  535 	call puts 
      0091FD 72               [ 1]  536 	pop a 
      0091FE 2C 20 00         [ 2]  537 	ldw x, #err_msg 
      009201 6C 61 73 74      [ 1]  538 	clr acc16 
      009205 20               [ 1]  539 	sll a
      009206 74 6F 6B 65      [ 1]  540 	rlc acc16  
      00920A 6E 20 69         [ 1]  541 	ld acc8, a 
      00920D 64 3A 20 00      [ 2]  542 	addw x,acc16 
      009211 FE               [ 2]  543 	ldw x,(x)
      009211 A6 02 4E         [ 4]  544 	call puts
      009213 AE 16 90         [ 2]  545 	ldw x,#tib
      009213 72 0A 00         [ 4]  546 	call puts 
      009216 22 44            [ 1]  547 	ld a,#CR 
      009218 88 AE 91         [ 4]  548 	call putc
      00921B DE CD 83         [ 2]  549 	ldw x,in.w
      00921E CE 84 AE         [ 4]  550 	call spaces
      009221 90 90            [ 1]  551 	ld a,#'^
      009223 72 5F 00         [ 4]  552 	call putc 
      009226 0E 48 72         [ 2]  553 6$: ldw x,#STACK_EMPTY 
      009229 59               [ 1]  554     ldw sp,x
      001215                        555 warm_start:
      00922A 00 0E C7         [ 4]  556 	call warm_init
                                    557 ;----------------------------
                                    558 ;   BASIC interpreter
                                    559 ;----------------------------
      001218                        560 cmd_line: ; user interface 
      00922D 00 0F            [ 1]  561 	ld a,#CR 
      00922F 72 BB 00         [ 4]  562 	call putc 
      009232 0E FE            [ 1]  563 	ld a,#'> 
      009234 CD 83 CE         [ 4]  564 	call putc
      009237 CE 00 05         [ 4]  565 	call readln
      00923A C6 00 02 CD      [ 1]  566 	tnz count 
      00923E 9A 24            [ 1]  567 	jreq cmd_line
      009240 AE 92 01         [ 4]  568 	call compile
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



                                    569 ;;; test 
                                    570 ; ldw x,txtbgn 
                                    571 ; ldw y,#16 
                                    572 ; call hex_dump
                                    573 ;;; end test
                                    574 
                                    575 ; if text begin with a line number
                                    576 ; the compiler set count to zero    
                                    577 ; so code is not interpreted
      009243 CD 83 CE C6      [ 1]  578 	tnz count 
      009247 00 03            [ 1]  579 	jreq cmd_line
                                    580 
                                    581 ; if direct command 
                                    582 ; it's ready to interpret 
                                    583 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    584 ;; This is the interpreter loop
                                    585 ;; for each BASIC code line. 
                                    586 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      001234                        587 interpreter: 
      009249 5F 97 72         [ 1]  588 	ld a,in 
      00924C BB 00 05         [ 1]  589 	cp a,count 
      00924F F6 5F            [ 1]  590 	jrmi interp_loop
      00123C                        591 next_line:
      009251 97 CD 93 57 72   [ 2]  592 	btjf flags, #FRUN, cmd_line
      009256 0D 00 22         [ 2]  593 	ldw x,basicptr
      009259 37 20 35 00      [ 2]  594 	addw x,in.w 
      00925C C3 00 1C         [ 2]  595 	cpw x,txtend 
      00925C 88 AE            [ 1]  596 	jrpl warm_start
      00925E 91 F0 CD         [ 2]  597 	ldw basicptr,x ; start of next line  
      009261 83 CE            [ 1]  598 	ld a,(2,x)
      009263 84 AE 90         [ 1]  599 	ld count,a 
      009266 90 72 5F 00      [ 1]  600 	mov in,#3 ; skip first 3 bytes of line 
      001259                        601 interp_loop: 
      00926A 0E 48 72         [ 4]  602 	call next_token
      00926D 59 00            [ 1]  603 	cp a,#TK_NONE 
      00926F 0E C7            [ 1]  604 	jreq next_line 
      009271 00 0F            [ 1]  605 	cp a,#TK_CMD
      009273 72 BB            [ 1]  606 	jrne 1$
      009275 00               [ 4]  607 	call (x) 
      009276 0E FE            [ 2]  608 	jra interp_loop 
      001267                        609 1$:	 
      009278 CD 83            [ 1]  610 	cp a,#TK_VAR
      00927A CE AE            [ 1]  611 	jrne 2$
      00927C 16 90 CD         [ 4]  612 	call let_var  
      00927F 83 CE            [ 2]  613 	jra interp_loop 
      001270                        614 2$:	
      009281 A6 0D            [ 1]  615 	cp a,#TK_ARRAY 
      009283 CD 83            [ 1]  616 	jrne 3$
      009285 71 CE 00         [ 4]  617 	call let_array 
      009288 01 CD            [ 2]  618 	jra interp_loop
      001279                        619 3$:	
      00928A 84 3B            [ 1]  620 	cp a,#TK_COLON 
      00928C A6 5E            [ 1]  621 	jreq interp_loop
      00928E CD 83            [ 1]  622 4$: cp a,#TK_LABEL 
      009290 71 AE            [ 1]  623 	jrne 5$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009292 17 FF 94         [ 4]  624 	call skip_label
      009295 20 D3            [ 2]  625 	jra interp_loop 
      009295 CD 90 5B         [ 2]  626 5$:	jp syntax_error 
                                    627 
                                    628 		
                                    629 ;--------------------------
                                    630 ; extract next token from
                                    631 ; token list 
                                    632 ; basicptr -> base address 
                                    633 ; in  -> offset in list array 
                                    634 ; output:
                                    635 ;   A 		token attribute
                                    636 ;   X 		token value if there is one
                                    637 ;----------------------------------------
      009298                        638 next_token::
      009298 A6               [ 1]  639 	clrw x 
      009299 0D CD 83         [ 1]  640 	ld a,in 
                                    641 ; don't replace sub by "cp a,count" 
                                    642 ; if end of line must return with A=0   	
      00929C 71 A6 3E         [ 1]  643 	sub a,count 
      00929F CD 83            [ 1]  644 	jreq 9$ ; end of line 
      001292                        645 0$: 
      0092A1 71 CD 84 D3 72   [ 1]  646 	mov in.saved,in ; in case "_unget_token" needed 
      0092A6 5D 00 04 27      [ 2]  647 	ldw y,basicptr 
      0092AA ED CD 8A F6      [ 2]  648 	addw y,in.w 
      0092AE 72 5D            [ 1]  649 	ld a,(y)
      0092B0 00 04            [ 1]  650 	incw y   
      0092B2 27               [ 1]  651 	tnz a 
      0092B3 E4 1B            [ 1]  652 	jrmi 4$
      0092B4 A1 06            [ 1]  653 	cp a,#TK_ARRAY
      0092B4 C6 00            [ 1]  654 	jrpl 7$  ; no attribute for these
      0012AA                        655 1$: ; 
      0092B6 02 C1            [ 1]  656 	cp a,#TK_CHAR
      0092B8 00 04            [ 1]  657 	jrne 2$
      0092BA 2B               [ 1]  658 	exg a,xl
      0092BB 1D F6            [ 1]  659 	ld a,(y)
      0092BC 41               [ 1]  660 	exg a,xl  
      0092BC 72 01            [ 2]  661 	jra 6$ 
      0092BE 00 22            [ 1]  662 2$:	cp a,#TK_QSTR 
      0092C0 D7 CE            [ 1]  663 	jrne 7$
      0092C2 00               [ 1]  664 	ldw x,y 
                                    665 ; move pointer after string 
      0092C3 05 72            [ 1]  666 3$:	tnz (y)
      0092C5 BB 00            [ 1]  667 	jreq 6$
      0092C7 01 C3            [ 1]  668 	incw y 
      0092C9 00 1D            [ 2]  669 	jra 3$
      0012C1                        670 4$: 
      0092CB 2A               [ 1]  671 	ldw x,y 
      0092CC C8               [ 2]  672 	ldw x,(x)
      0092CD CF 00            [ 1]  673 	cp a,#TK_INTGR
      0092CF 05 E6            [ 1]  674 	jrpl 5$
      0092D1 02 C7 00         [ 2]  675 	ldw x,(code_addr,x) 
      0092D4 04 35            [ 1]  676 5$:	incw y 
      0092D6 03 00            [ 1]  677 6$:	incw y 
      0092D8 02 B2 00 04      [ 2]  678 7$:	subw y,basicptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      0092D9 90 CF 00 00      [ 2]  679 	ldw in.w,y 
      0012D6                        680 9$: 
      0092D9 CD               [ 4]  681 	ret	
                                    682 
                                    683 ;-----------------------------------
                                    684 ; print a 16 bit integer 
                                    685 ; using variable 'base' as conversion
                                    686 ; format.
                                    687 ; input:
                                    688 ;   X       integer to print 
                                    689 ;   'base'    conversion base 
                                    690 ; output:
                                    691 ;   none 
                                    692 ;-----------------------------------
      0012D7                        693 print_int:
      0092DA 93 09 A1 00      [ 1]  694 	clr acc24 
      0092DE 27 DC A1         [ 2]  695 	ldw acc16,x 
      0092E1 80 26 03 FD 20   [ 2]  696 	btjf acc16,#7,prti24
      0092E6 F2 53 00 0C      [ 1]  697 	cpl acc24 
                                    698 	
                                    699 ;------------------------------------
                                    700 ; print integer in acc24 
                                    701 ; input:
                                    702 ;	acc24 		integer to print 
                                    703 ;	'base' 		numerical base for conversion 
                                    704 ;   'tab_width' field width 
                                    705 ;  output:
                                    706 ;    A          string length
                                    707 ;------------------------------------
      0092E7                        708 prti24:
      0092E7 A1 85 26         [ 4]  709     call itoa  ; conversion entier en  .asciz
      0092EA 05 CD 99         [ 4]  710 	call right_align  
      0092ED 29               [ 1]  711 	push a 
      0092EE 20 E9 4E         [ 4]  712 	call puts
      0092F0 84               [ 1]  713 	pop a 
      0092F0 A1               [ 4]  714     ret	
                                    715 
                                    716 ;------------------------------------
                                    717 ; convert integer in acc24 to string
                                    718 ; input:
                                    719 ;   'base'	conversion base 
                                    720 ;	acc24	integer to convert
                                    721 ; output:
                                    722 ;   X  		pointer to first char of string
                                    723 ;   A       string length
                                    724 ;------------------------------------
                           000001   725 	SIGN=1  ; integer sign 
                           000002   726 	LEN=2 
                           000003   727 	PSTR=3
                           000004   728 	VSIZE=4 ;locals size
      0012F3                        729 itoa::
      0012F3                        730 	_vars VSIZE
      0092F1 06 26            [ 2]    1     sub sp,#VSIZE 
      0092F3 05 CD            [ 1]  731 	clr (LEN,sp) ; string length  
      0092F5 99 26            [ 1]  732 	clr (SIGN,sp)    ; sign
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      0092F7 20 E0 0A         [ 1]  733 	ld a,base 
      0092F9 A1 0A            [ 1]  734 	cp a,#10
      0092F9 A1 0B            [ 1]  735 	jrne 1$
                                    736 	; base 10 string display with negative sign if bit 23==1
      0092FB 27 DC A1 01 26   [ 2]  737 	btjf acc24,#7,1$
      009300 05 CD            [ 1]  738 	cpl (SIGN,sp)
      009302 9D 2E 20         [ 4]  739 	call neg_acc24
      00130A                        740 1$:
                                    741 ; initialize string pointer 
      009305 D3 CC 92         [ 2]  742 	ldw x,#tib 
      009308 11 00 50         [ 2]  743 	addw x,#TIB_SIZE
      009309 5A               [ 2]  744 	decw x 
      009309 5F               [ 1]  745 	clr (x)
      00930A C6               [ 2]  746 	decw x 
      00930B 00 02            [ 1]  747 	ld a,#32
      00930D C0               [ 1]  748 	ld (x),a
      00930E 00 04            [ 1]  749 	inc (LEN,sp)
      001318                        750 itoa_loop:
      009310 27 44 0A         [ 1]  751     ld a,base
      009312 1F 03            [ 2]  752 	ldw (PSTR,sp),x 
      009312 55 00 02         [ 4]  753     call divu24_8 ; acc24/A 
      009315 00 03            [ 2]  754 	ldw x,(PSTR,sp)
      009317 90 CE            [ 1]  755     add a,#'0  ; remainder of division
      009319 00 05            [ 1]  756     cp a,#'9+1
      00931B 72 B9            [ 1]  757     jrmi 2$
      00931D 00 01            [ 1]  758     add a,#7 
      00132A                        759 2$:	
      00931F 90               [ 2]  760 	decw x
      009320 F6               [ 1]  761     ld (x),a
      009321 90 5C            [ 1]  762 	inc (LEN,sp)
                                    763 	; if acc24==0 conversion done
      009323 4D 2B 1B         [ 1]  764 	ld a,acc24
      009326 A1 06 2A         [ 1]  765 	or a,acc16
      009329 24 00 0E         [ 1]  766 	or a,acc8
      00932A 26 DF            [ 1]  767     jrne itoa_loop
                                    768 	;conversion done, next add '$' or '-' as required
      00932A A1 03 26         [ 1]  769 	ld a,base 
      00932D 06 41            [ 1]  770 	cp a,#16
      00932F 90 F6            [ 1]  771 	jreq 8$
      009331 41 20            [ 1]  772 	ld a,(SIGN,sp)
      009333 18 A1            [ 1]  773     jreq 10$
      009335 02 26            [ 1]  774     ld a,#'-
      009337 16 93            [ 2]  775 	jra 9$ 
                                    776 ; don't print more than 4 digits
                                    777 ; in hexadecimal to avoid '-' sign 
                                    778 ; extend display 	
      009339 90 7D            [ 1]  779 8$: ld a,(LEN,sp) 
      00933B 27 0F            [ 1]  780 	cp a,#6 
      00933D 90 5C            [ 1]  781 	jrmi 81$
      00933F 20               [ 1]  782 	incw x
      009340 F8 02            [ 1]  783 	dec (LEN,sp)
      009341 20 F5            [ 2]  784 	jra 8$
      001353                        785 81$:	
      009341 93 FE            [ 1]  786 	ld a,#'$ 
      009343 A1               [ 2]  787 9$: decw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009344 84               [ 1]  788     ld (x),a
      009345 2A 03            [ 1]  789 	inc (LEN,sp)
      001359                        790 10$:
      009347 DE AB            [ 1]  791 	ld a,(LEN,sp)
      00135B                        792 	_drop VSIZE
      009349 43 90            [ 2]    1     addw sp,#VSIZE 
      00934B 5C               [ 4]  793 	ret
                                    794 
                                    795 ;-------------------------------------
                                    796 ; divide uint24_t by uint8_t
                                    797 ; used to convert uint24_t to string
                                    798 ; input:
                                    799 ;	acc24	dividend
                                    800 ;   A 		divisor
                                    801 ; output:
                                    802 ;   acc24	quotient
                                    803 ;   A		remainder
                                    804 ;------------------------------------- 
                                    805 ; offset  on sp of arguments and locals
                           000001   806 	U8   = 1   ; divisor on stack
                           000001   807 	VSIZE =1
      00135E                        808 divu24_8:
      00934C 90               [ 2]  809 	pushw x ; save x
      00934D 5C               [ 1]  810 	push a 
                                    811 	; ld dividend UU:MM bytes in X
      00934E 72 B2 00         [ 1]  812 	ld a, acc24
      009351 05               [ 1]  813 	ld xh,a
      009352 90 CF 00         [ 1]  814 	ld a,acc24+1
      009355 01               [ 1]  815 	ld xl,a
      009356 7B 01            [ 1]  816 	ld a,(U8,SP) ; divisor
      009356 81               [ 2]  817 	div x,a ; UU:MM/U8
      009357 88               [ 1]  818 	push a  ;save remainder
      009357 72               [ 1]  819 	ld a,xh
      009358 5F 00 0D         [ 1]  820 	ld acc24,a
      00935B CF               [ 1]  821 	ld a,xl
      00935C 00 0E 72         [ 1]  822 	ld acc24+1,a
      00935F 0F               [ 1]  823 	pop a
      009360 00               [ 1]  824 	ld xh,a
      009361 0E 04 72         [ 1]  825 	ld a,acc24+2
      009364 53               [ 1]  826 	ld xl,a
      009365 00 0D            [ 1]  827 	ld a,(U8,sp) ; divisor
      009367 62               [ 2]  828 	div x,a  ; R:LL/U8
      009367 CD 93            [ 1]  829 	ld (U8,sp),a ; save remainder
      009369 73               [ 1]  830 	ld a,xl
      00936A CD 8B 95         [ 1]  831 	ld acc24+2,a
      00936D 88               [ 1]  832 	pop a
      00936E CD               [ 2]  833 	popw x
      00936F 83               [ 4]  834 	ret
                                    835 
                                    836 ;--------------------------------------
                                    837 ; unsigned multiply uint24_t by uint8_t
                                    838 ; use to convert numerical string to uint24_t
                                    839 ; input:
                                    840 ;	acc24	uint24_t 
                                    841 ;   A		uint8_t
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



                                    842 ; output:
                                    843 ;   acc24   A*acc24
                                    844 ;-------------------------------------
                                    845 ; local variables offset  on sp
                           000003   846 	U8   = 3   ; A pushed on stack
                           000002   847 	OVFL = 2  ; multiplicaton overflow low byte
                           000001   848 	OVFH = 1  ; multiplication overflow high byte
                           000003   849 	VSIZE = 3
      001386                        850 mulu24_8:
      009370 CE               [ 2]  851 	pushw x    ; save X
                                    852 	; local variables
      009371 84               [ 1]  853 	push a     ; U8
      009372 81               [ 1]  854 	clrw x     ; initialize overflow to 0
      009373 89               [ 2]  855 	pushw x    ; multiplication overflow
                                    856 ; multiply low byte.
      009373 52 04 0F         [ 1]  857 	ld a,acc24+2
      009376 02               [ 1]  858 	ld xl,a
      009377 0F 01            [ 1]  859 	ld a,(U8,sp)
      009379 C6               [ 4]  860 	mul x,a
      00937A 00               [ 1]  861 	ld a,xl
      00937B 0B A1 0A         [ 1]  862 	ld acc24+2,a
      00937E 26               [ 1]  863 	ld a, xh
      00937F 0A 72            [ 1]  864 	ld (OVFL,sp),a
                                    865 ; multipy middle byte
      009381 0F 00 0D         [ 1]  866 	ld a,acc24+1
      009384 05               [ 1]  867 	ld xl,a
      009385 03 01            [ 1]  868 	ld a, (U8,sp)
      009387 CD               [ 4]  869 	mul x,a
                                    870 ; add overflow to this partial product
      009388 94 40 01         [ 2]  871 	addw x,(OVFH,sp)
      00938A 9F               [ 1]  872 	ld a,xl
      00938A AE 16 90         [ 1]  873 	ld acc24+1,a
      00938D 1C               [ 1]  874 	clr a
      00938E 00 50            [ 1]  875 	adc a,#0
      009390 5A 7F            [ 1]  876 	ld (OVFH,sp),a
      009392 5A               [ 1]  877 	ld a,xh
      009393 A6 20            [ 1]  878 	ld (OVFL,sp),a
                                    879 ; multiply most signficant byte	
      009395 F7 0C 02         [ 1]  880 	ld a, acc24
      009398 97               [ 1]  881 	ld xl, a
      009398 C6 00            [ 1]  882 	ld a, (U8,sp)
      00939A 0B               [ 4]  883 	mul x,a
      00939B 1F 03 CD         [ 2]  884 	addw x, (OVFH,sp)
      00939E 93               [ 1]  885 	ld a, xl
      00939F DE 1E 03         [ 1]  886 	ld acc24,a
      0093A2 AB 30            [ 2]  887     addw sp,#VSIZE
      0093A4 A1               [ 2]  888 	popw x
      0093A5 3A               [ 4]  889 	ret
                                    890 
                                    891 ;------------------------------------
                                    892 ;  two's complement acc24
                                    893 ;  input:
                                    894 ;		acc24 variable
                                    895 ;  output:
                                    896 ;		acc24 variable
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



                                    897 ;-------------------------------------
      0013C0                        898 neg_acc24:
      0093A6 2B 02 AB 07      [ 1]  899 	cpl acc24+2
      0093AA 72 53 00 0D      [ 1]  900 	cpl acc24+1
      0093AA 5A F7 0C 02      [ 1]  901 	cpl acc24
      0093AE C6 00            [ 1]  902 	ld a,#1
      0093B0 0D CA 00         [ 1]  903 	add a,acc24+2
      0093B3 0E CA 00         [ 1]  904 	ld acc24+2,a
      0093B6 0F               [ 1]  905 	clr a
      0093B7 26 DF C6         [ 1]  906 	adc a,acc24+1
      0093BA 00 0B A1         [ 1]  907 	ld acc24+1,a 
      0093BD 10               [ 1]  908 	clr a 
      0093BE 27 08 7B         [ 1]  909 	adc a,acc24 
      0093C1 01 27 15         [ 1]  910 	ld acc24,a 
      0093C4 A6               [ 4]  911 	ret
                                    912 
                                    913 
                                    914 
                                    915 
                                    916 ;------------------------------------
                                    917 ; convert alpha to uppercase
                                    918 ; input:
                                    919 ;    a  character to convert
                                    920 ; output:
                                    921 ;    a  uppercase character
                                    922 ;------------------------------------
      0013E3                        923 to_upper::
      0093C5 2D 20            [ 1]  924 	cp a,#'a
      0093C7 0D 7B            [ 1]  925 	jrpl 1$
      0093C9 02               [ 4]  926 0$:	ret
      0093CA A1 06            [ 1]  927 1$: cp a,#'z	
      0093CC 2B 05            [ 1]  928 	jrugt 0$
      0093CE 5C 0A            [ 1]  929 	sub a,#32
      0093D0 02               [ 4]  930 	ret
                                    931 	
                                    932 ;------------------------------------
                                    933 ; convert pad content in integer
                                    934 ; input:
                                    935 ;    x		.asciz to convert
                                    936 ; output:
                                    937 ;    acc24      int24_t
                                    938 ;------------------------------------
                                    939 	; local variables
                           000001   940 	SIGN=1 ; 1 byte, 
                           000002   941 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003   942 	TEMP=3 ; 1 byte, temporary storage
                           000003   943 	VSIZE=3 ; 3 bytes reserved for local storage
      0013EF                        944 atoi24::
      0093D1 20               [ 2]  945 	pushw x 
      0013F0                        946 	_vars VSIZE
      0093D2 F5 03            [ 2]    1     sub sp,#VSIZE 
                                    947 	; acc24=0 
      0093D3 72 5F 00 0C      [ 1]  948 	clr acc24    
      0093D3 A6 24 5A F7      [ 1]  949 	clr acc16
      0093D7 0C 02 00 0E      [ 1]  950 	clr acc8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      0093D9 0F 01            [ 1]  951 	clr (SIGN,sp)
      0093D9 7B 02            [ 1]  952 	ld a,#10
      0093DB 5B 04            [ 1]  953 	ld (BASE,sp),a ; default base decimal
      0093DD 81               [ 1]  954 	ld a,(x)
      0093DE 27 47            [ 1]  955 	jreq 9$  ; completed if 0
      0093DE 89 88            [ 1]  956 	cp a,#'-
      0093E0 C6 00            [ 1]  957 	jrne 1$
      0093E2 0D 95            [ 1]  958 	cpl (SIGN,sp)
      0093E4 C6 00            [ 2]  959 	jra 2$
      0093E6 0E 97            [ 1]  960 1$: cp a,#'$
      0093E8 7B 01            [ 1]  961 	jrne 3$
      0093EA 62 88            [ 1]  962 	ld a,#16
      0093EC 9E C7            [ 1]  963 	ld (BASE,sp),a
      0093EE 00               [ 1]  964 2$:	incw x
      0093EF 0D               [ 1]  965 	ld a,(x)
      001419                        966 3$:	
      0093F0 9F C7            [ 1]  967 	cp a,#'a
      0093F2 00 0E            [ 1]  968 	jrmi 4$
      0093F4 84 95            [ 1]  969 	sub a,#32
      0093F6 C6 00            [ 1]  970 4$:	cp a,#'0
      0093F8 0F 97            [ 1]  971 	jrmi 9$
      0093FA 7B 01            [ 1]  972 	sub a,#'0
      0093FC 62 6B            [ 1]  973 	cp a,#10
      0093FE 01 9F            [ 1]  974 	jrmi 5$
      009400 C7 00            [ 1]  975 	sub a,#7
      009402 0F 84            [ 1]  976 	cp a,(BASE,sp)
      009404 85 81            [ 1]  977 	jrpl 9$
      009406 6B 03            [ 1]  978 5$:	ld (TEMP,sp),a
      009406 89 88            [ 1]  979 	ld a,(BASE,sp)
      009408 5F 89 C6         [ 4]  980 	call mulu24_8
      00940B 00 0F            [ 1]  981 	ld a,(TEMP,sp)
      00940D 97 7B 03         [ 1]  982 	add a,acc24+2
      009410 42 9F C7         [ 1]  983 	ld acc24+2,a
      009413 00               [ 1]  984 	clr a
      009414 0F 9E 6B         [ 1]  985 	adc a,acc24+1
      009417 02 C6 00         [ 1]  986 	ld acc24+1,a
      00941A 0E               [ 1]  987 	clr a
      00941B 97 7B 03         [ 1]  988 	adc a,acc24
      00941E 42 72 FB         [ 1]  989 	ld acc24,a
      009421 01 9F            [ 2]  990 	jra 2$
      009423 C7 00            [ 1]  991 9$:	tnz (SIGN,sp)
      009425 0E 4F            [ 1]  992     jreq atoi_exit
      009427 A9 00 6B         [ 4]  993     call neg_acc24
      001455                        994 atoi_exit: 
      001455                        995 	_drop VSIZE
      00942A 01 9E            [ 2]    1     addw sp,#VSIZE 
      00942C 6B               [ 2]  996 	popw x ; restore x
      00942D 02               [ 4]  997 	ret
                                    998 
                                    999 
                                   1000 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1001 ;;   TINY BASIC  operators,
                                   1002 ;;   commands and functions 
                                   1003 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1004 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



                                   1005 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1006 ;;  Arithmetic operators
                                   1007 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1008 
                                   1009 ;debug support
                           000001  1010 DEBUG_PRT=1
                           000001  1011 .if DEBUG_PRT 
                           000001  1012 	REGA=1
                           000002  1013 	SAVEB=2
                           000003  1014 	REGX=3
                           000005  1015 	REGY=5
                           000007  1016 	ACC24=7
                           000009  1017 	VSIZE=9 
      001459                       1018 printxy:
      001459                       1019 	_vars VSIZE 
      00942E C6 00            [ 2]    1     sub sp,#VSIZE 
      009430 0D 97            [ 1] 1020 	ld (REGA,sp),a 
      009432 7B 03 42         [ 1] 1021 	ld a,base 
      009435 72 FB            [ 1] 1022 	ld (SAVEB,sp),a
      009437 01 9F            [ 2] 1023 	ldw (REGX,sp),x
      009439 C7 00            [ 2] 1024 	ldw (REGY,sp),y
      00943B 0D 5B 03         [ 2] 1025 	ldw x,acc24 
      00943E 85 81 0E         [ 1] 1026 	ld a,acc8 
      009440 1F 07            [ 2] 1027 	ldw (ACC24,sp),x 
      009440 72 53            [ 1] 1028 	ld (ACC24+2,sp),a 
      009442 00 0F 72 53      [ 1] 1029 	mov base,#16 
      009446 00               [ 1] 1030 	clrw x 
      009447 0E 72            [ 1] 1031 	ld a,(REGA,sp)
      009449 53               [ 1] 1032 	ld xl,a 
      00944A 00 0D A6         [ 4] 1033 	call print_int
      00944D 01 CB            [ 1] 1034 	ld a,#SPACE 
      00944F 00 0F C7         [ 4] 1035 	call putc  
      009452 00 0F            [ 2] 1036 	ldw x,(REGX,sp)
      009454 4F C9 00         [ 4] 1037 	call print_int 
      009457 0E C7            [ 1] 1038 	ld a,#SPACE 
      009459 00 0E 4F         [ 4] 1039 	call putc  
      00945C C9 00            [ 2] 1040 	ldw x,(REGY,sp)
      00945E 0D C7 00         [ 4] 1041 	call print_int 
      009461 0D 81            [ 1] 1042 	ld a,#CR 
      009463 CD 02 F1         [ 4] 1043 	call putc 
      009463 A1 61            [ 1] 1044 	ld a,(ACC24+2,sp)
      009465 2A 01            [ 2] 1045 	ldw x,(ACC24,sp)
      009467 81 A1 7A         [ 2] 1046 	ldw acc24,x 
      00946A 22 FB A0         [ 1] 1047 	ld acc8,a
      00946D 20 81            [ 1] 1048 	ld a,(SAVEB,sp)
      00946F C7 00 0A         [ 1] 1049 	ld base,a 
      00946F 89 52            [ 1] 1050 	ld a,(REGA,sp)
      009471 03 72            [ 2] 1051 	ldw x,(REGX,sp)
      009473 5F 00            [ 2] 1052 	ldw y,(REGY,sp)
      0014A9                       1053 	_drop VSIZE 
      009475 0D 72            [ 2]    1     addw sp,#VSIZE 
      009477 5F               [ 4] 1054 	ret 
                                   1055 .endif 
                                   1056 
                                   1057 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



                                   1058 ;--------------------------------------
                                   1059 ;  multiply 2 uint16_t return uint32_t
                                   1060 ;  input:
                                   1061 ;     x       uint16_t 
                                   1062 ;     y       uint16_t 
                                   1063 ;  output:
                                   1064 ;     x       product bits 15..0
                                   1065 ;     y       product bits 31..16 
                                   1066 ;---------------------------------------
                           000001  1067 		U1=1  ; uint16_t 
                           000003  1068 		DBL=3 ; uint32_t
                           000006  1069 		VSIZE=6
      0014AC                       1070 umstar:
      0014AC                       1071 	_vars VSIZE 
      009478 00 0E            [ 2]    1     sub sp,#VSIZE 
      00947A 72 5F            [ 2] 1072 	ldw (U1,sp),x 
                                   1073 ;initialize bits 31..16 of 
                                   1074 ;product to zero 
      00947C 00 0F            [ 1] 1075 	clr (DBL,sp)
      00947E 0F 01            [ 1] 1076 	clr (DBL+1,sp)
                                   1077 ; produc U1L*U2L 
      009480 A6 0A            [ 1] 1078 	ld a,yl 
      009482 6B               [ 4] 1079 	mul x,a 
      009483 02 F6            [ 2] 1080 	ldw (DBL+2,sp),x
                                   1081 ; product U1H*U2L 
      009485 27 47            [ 1] 1082 	ld a,(U1,sp) ; xh 
      009487 A1               [ 1] 1083 	ldw x,y
      009488 2D               [ 4] 1084 	mul x,a 
      009489 26               [ 1] 1085 	clr a 
      00948A 04 03 01         [ 2] 1086 	addw x,(DBL+1,sp) 
      00948D 20               [ 1] 1087 	clr a 
      00948E 08 A1            [ 1] 1088 	adc a,(DBL,sp) 
      009490 24 26            [ 1] 1089 	ld (DBL,sp),a ; bits 23..17 
      009492 06 A6            [ 2] 1090 	ldw (DBL+1,sp),x ; bits 15..0 
                                   1091 ; product U1L*U2H
      009494 10 6B            [ 1] 1092 	swapw y 
      009496 02               [ 1] 1093 	ldw x,y
      009497 5C F6            [ 1] 1094 	ld a,(U1+1,sp)
      009499 42               [ 4] 1095 	mul x,a
      009499 A1 61 2B         [ 2] 1096 	addw x,(DBL+1,sp)
      00949C 02               [ 1] 1097 	clr a 
      00949D A0 20            [ 1] 1098 	adc a,(DBL,sp)
      00949F A1 30            [ 1] 1099 	ld (DBL,sp),a 
      0094A1 2B 2B            [ 2] 1100 	ldw (DBL+1,sp),x 
                                   1101 ; product U1H*U2H 	
      0094A3 A0 30            [ 1] 1102 	ld a,(U1,sp)
      0094A5 A1               [ 1] 1103 	ldw x,y  
      0094A6 0A               [ 4] 1104 	mul x,a 
      0094A7 2B 06 A0         [ 2] 1105 	addw x,(DBL,sp)
      0094AA 07 11            [ 1] 1106 	ldw y,x 
      0094AC 02 2A            [ 2] 1107 	ldw x,(DBL+2,sp)
      0014E3                       1108 	_drop VSIZE 
      0094AE 1F 6B            [ 2]    1     addw sp,#VSIZE 
      0094B0 03               [ 4] 1109 	ret
                                   1110 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



                                   1111 
                                   1112 ;-------------------------------------
                                   1113 ; multiply 2 integers
                                   1114 ; input:
                                   1115 ;  	x       n1 
                                   1116 ;   y 		n2 
                                   1117 ; output:
                                   1118 ;	X        N1*N2 bits 15..0
                                   1119 ;   Y        N1*N2 bits 31..16 
                                   1120 ;-------------------------------------
                           000001  1121 	SIGN=1
                           000001  1122 	VSIZE=1
      0014E6                       1123 multiply:
      0014E6                       1124 	_vars VSIZE 
      0094B1 7B 02            [ 2]    1     sub sp,#VSIZE 
      0094B3 CD 94            [ 1] 1125 	clr (SIGN,sp)
      0094B5 06               [ 1] 1126 	ld a,xh 
      0094B6 7B 03            [ 1] 1127 	and a,#0x80
      0094B8 CB 00            [ 1] 1128 	jrpl 1$
      0094BA 0F C7            [ 1] 1129 	cpl (SIGN,sp)
      0094BC 00               [ 2] 1130 	negw x 
      0014F2                       1131 1$:	
      0094BD 0F 4F            [ 1] 1132 	ld a,yh
      0094BF C9 00            [ 1] 1133 	and a,#0x80  
      0094C1 0E C7            [ 1] 1134 	jrpl 2$ 
      0094C3 00 0E            [ 1] 1135 	cpl (SIGN,sp)
      0094C5 4F C9            [ 2] 1136 	negw y 
      0014FC                       1137 2$:	
      0094C7 00 0D C7         [ 4] 1138 	call umstar
      0094CA 00 0D            [ 1] 1139 	ld a,(SIGN,sp)
      0094CC 20 C9            [ 1] 1140 	jreq 3$
      0094CE 0D 01 27         [ 4] 1141 	call dneg 
      001506                       1142 3$:	
      001506                       1143 	_drop VSIZE 
      0094D1 03 CD            [ 2]    1     addw sp,#VSIZE 
      0094D3 94               [ 4] 1144 	ret
                                   1145 
                                   1146 ;--------------------------------------
                                   1147 ; divide uint32_t/uint16_t
                                   1148 ; return:  quotient and remainder 
                                   1149 ; quotient expected to be uint16_t 
                                   1150 ; input:
                                   1151 ;   DBLDIVDND    on stack 
                                   1152 ;   X            divisor 
                                   1153 ; output:
                                   1154 ;   X            quotient 
                                   1155 ;   Y            remainder 
                                   1156 ;---------------------------------------
                           000003  1157 	VSIZE=3
      001509                       1158 	_argofs VSIZE 
                           000005     1     ARG_OFS=2+VSIZE 
      001509                       1159 	_arg DBLDIVDND 1
                           000006     1     DBLDIVDND=ARG_OFS+1 
                                   1160 	; local variables 
                           000001  1161 	DIVISOR=1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



                           000003  1162 	CNTR=3 
      001509                       1163 udiv32_16:
      001509                       1164 	_vars VSIZE 
      0094D4 40 03            [ 2]    1     sub sp,#VSIZE 
      0094D5 1F 01            [ 2] 1165 	ldw (DIVISOR,sp),x	; save divisor 
      0094D5 5B 03            [ 2] 1166 	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
      0094D7 85 81            [ 2] 1167 	ldw y,(DBLDIVDND,sp) ; bits 31..16
      0094D9 90 5D            [ 2] 1168 	tnzw y
      0094D9 52 09            [ 1] 1169 	jrne long_division 
      0094DB 6B 01            [ 2] 1170 	ldw y,(DIVISOR,sp)
      0094DD C6               [ 2] 1171 	divw x,y
      001518                       1172 	_drop VSIZE 
      0094DE 00 0B            [ 2]    1     addw sp,#VSIZE 
      0094E0 6B               [ 4] 1173 	ret
      00151B                       1174 long_division:
      0094E1 02               [ 1] 1175 	exgw x,y ; hi in x, lo in y 
      0094E2 1F 03            [ 1] 1176 	ld a,#17 
      0094E4 17 05            [ 1] 1177 	ld (CNTR,sp),a
      001520                       1178 1$:
      0094E6 CE 00            [ 2] 1179 	cpw x,(DIVISOR,sp)
      0094E8 0D C6            [ 1] 1180 	jrmi 2$
      0094EA 00 0F 1F         [ 2] 1181 	subw x,(DIVISOR,sp)
      0094ED 07               [ 1] 1182 2$:	ccf 
      0094EE 6B 09            [ 2] 1183 	rlcw y 
      0094F0 35               [ 2] 1184 	rlcw x 
      0094F1 10 00            [ 1] 1185 	dec (CNTR,sp)
      0094F3 0B 5F            [ 1] 1186 	jrne 1$
      0094F5 7B               [ 1] 1187 	exgw x,y 
      001530                       1188 	_drop VSIZE 
      0094F6 01 97            [ 2]    1     addw sp,#VSIZE 
      0094F8 CD               [ 4] 1189 	ret
                                   1190 
                                   1191 ;-----------------------------
                                   1192 ; negate double int.
                                   1193 ; input:
                                   1194 ;   x     bits 15..0
                                   1195 ;   y     bits 31..16
                                   1196 ; output: 
                                   1197 ;   x     bits 15..0
                                   1198 ;   y     bits 31..16
                                   1199 ;-----------------------------
      001533                       1200 dneg:
      0094F9 93               [ 2] 1201 	cplw x 
      0094FA 57 A6            [ 2] 1202 	cplw y 
      0094FC 20 CD 83         [ 2] 1203 	addw x,#1 
      0094FF 71 1E            [ 1] 1204 	jrnc 1$
      009501 03 CD            [ 1] 1205 	incw y 
      009503 93               [ 4] 1206 1$: ret 
                                   1207 
                                   1208 
                                   1209 ;--------------------------------
                                   1210 ; sign extend single to double
                                   1211 ; input:
                                   1212 ;   x    int16_t
                                   1213 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



                                   1214 ;   x    int32_t bits 15..0
                                   1215 ;   y    int32_t bits 31..16
                                   1216 ;--------------------------------
      00153E                       1217 dbl_sign_extend:
      009504 57 A6            [ 1] 1218 	clrw y
      009506 20               [ 1] 1219 	ld a,xh 
      009507 CD 83            [ 1] 1220 	and a,#0x80 
      009509 71 1E            [ 1] 1221 	jreq 1$
      00950B 05 CD            [ 2] 1222 	cplw y
      00950D 93               [ 4] 1223 1$: ret 	
                                   1224 
                                   1225 
                                   1226 ;----------------------------------
                                   1227 ;  euclidian divide dbl/n1 
                                   1228 ;  ref: https://en.wikipedia.org/wiki/Euclidean_division
                                   1229 ; input:
                                   1230 ;    dbl    int32_t on stack 
                                   1231 ;    x 		n1   int16_t  disivor  
                                   1232 ; output:
                                   1233 ;    X      dbl/x  int16_t 
                                   1234 ;    Y      remainder int16_t 
                                   1235 ;----------------------------------
                           000008  1236 	VSIZE=8
      001548                       1237 	_argofs VSIZE 
                           00000A     1     ARG_OFS=2+VSIZE 
      001548                       1238 	_arg DIVDNDHI 1 
                           00000B     1     DIVDNDHI=ARG_OFS+1 
      001548                       1239 	_arg DIVDNDLO 3
                           00000D     1     DIVDNDLO=ARG_OFS+3 
                                   1240 	; local variables
                           000001  1241 	DBLHI=1
                           000003  1242 	DBLLO=3 
                           000005  1243 	SDIVSR=5 ; sign divisor
                           000006  1244 	SQUOT=6 ; sign dividend 
                           000007  1245 	DIVISR=7 ; divisor 
      001548                       1246 div32_16:
      001548                       1247 	_vars VSIZE 
      00950E 57 A6            [ 2]    1     sub sp,#VSIZE 
      009510 0D CD            [ 1] 1248 	clr (SDIVSR,sp)
      009512 83 71            [ 1] 1249 	clr (SQUOT,sp)
                                   1250 ; copy arguments 
      009514 7B 09            [ 2] 1251 	ldw y,(DIVDNDHI,sp)
      009516 1E 07            [ 2] 1252 	ldw (DBLHI,sp),y
      009518 CF 00            [ 2] 1253 	ldw y,(DIVDNDLO,sp)
      00951A 0D C7            [ 2] 1254 	ldw (DBLLO,sp),y 
                                   1255 ; check for 0 divisor
      00951C 00               [ 2] 1256 	tnzw x 
      00951D 0F 7B            [ 1] 1257     jrne 0$
      00951F 02 C7            [ 1] 1258 	ld a,#ERR_DIV0 
      009521 00 0B 7B         [ 2] 1259 	jp tb_error 
                                   1260 ; check divisor sign 	
      009524 01               [ 1] 1261 0$:	ld a,xh 
      009525 1E 03            [ 1] 1262 	and a,#0x80 
      009527 16 05            [ 1] 1263 	jreq 1$
      009529 5B 09            [ 1] 1264 	cpl (SDIVSR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00952B 81 06            [ 1] 1265 	cpl (SQUOT,sp)
      00952C 50               [ 2] 1266 	negw x
      00952C 52 06            [ 2] 1267 1$:	ldw (DIVISR,sp),x
                                   1268 ; check dividend sign 	 
      00952E 1F 01            [ 1] 1269  	ld a,(DBLHI,sp) 
      009530 0F 03            [ 1] 1270 	and a,#0x80 
      009532 0F 04            [ 1] 1271 	jreq 2$ 
      009534 90 9F            [ 1] 1272 	cpl (SQUOT,sp)
      009536 42 1F            [ 2] 1273 	ldw x,(DBLLO,sp)
      009538 05 7B            [ 2] 1274 	ldw y,(DBLHI,sp)
      00953A 01 93 42         [ 4] 1275 	call dneg 
      00953D 4F 72            [ 2] 1276 	ldw (DBLLO,sp),x 
      00953F FB 04            [ 2] 1277 	ldw (DBLHI,sp),y 
      009541 4F 19            [ 2] 1278 2$:	ldw x,(DIVISR,sp)
      009543 03 6B 03         [ 4] 1279 	call udiv32_16
      009546 1F 04            [ 2] 1280 	tnzw y 
      009548 90 5E            [ 1] 1281 	jreq 3$ 
                                   1282 ; x=quotient 
                                   1283 ; y=remainder 
                                   1284 ; if SDIVSR XOR SQUOT increment quotient and remainder.
      00954A 93 7B            [ 1] 1285 	ld a,(SQUOT,sp)
      00954C 02 42            [ 1] 1286 	xor a,(SDIVSR,sp)
      00954E 72 FB            [ 1] 1287 	jreq 3$
      009550 04               [ 1] 1288 	incw x 
      009551 4F 19 03 6B      [ 2] 1289 	ldw acc16,y 
      009555 03 1F            [ 2] 1290 	ldw y,(DIVISR,sp)
      009557 04 7B 01 93      [ 2] 1291 	subw y,acc16
                                   1292 ; sign quotient
      00955B 42 72            [ 1] 1293 3$:	ld a,(SQUOT,sp)
      00955D FB 03            [ 1] 1294 	jreq 4$
      00955F 90               [ 2] 1295 	negw x 
      00159C                       1296 4$:	
      00159C                       1297 	_drop VSIZE 
      009560 93 1E            [ 2]    1     addw sp,#VSIZE 
      009562 05               [ 4] 1298 	ret 
                                   1299 
                                   1300 
                                   1301 
                                   1302 ;----------------------------------
                                   1303 ; division x/y 
                                   1304 ; input:
                                   1305 ;    X       dividend
                                   1306 ;    Y       divisor 
                                   1307 ; output:
                                   1308 ;    X       quotient
                                   1309 ;    Y       remainder 
                                   1310 ;-----------------------------------
                           000004  1311 	VSIZE=4 
                                   1312 	; local variables 
                           000001  1313 	DBLHI=1
                           000003  1314 	DBLLO=3
      00159F                       1315 divide: 
      00159F                       1316 	_vars VSIZE 
      009563 5B 06            [ 2]    1     sub sp,#VSIZE 
      009565 81 CF 00 0D      [ 2] 1317 	ldw acc16,y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      009566 CD 15 3E         [ 4] 1318 	call dbl_sign_extend
      009566 52 01            [ 2] 1319 	ldw (DBLLO,sp),x 
      009568 0F 01            [ 2] 1320 	ldw (DBLHI,sp),y 
      00956A 9E A4 80         [ 2] 1321 	ldw x,acc16 
      00956D 2A 03 03         [ 4] 1322 	call div32_16 
      0015B2                       1323 	_drop VSIZE 
      009570 01 50            [ 2]    1     addw sp,#VSIZE 
      009572 81               [ 4] 1324 	ret
                                   1325 
                                   1326 
                                   1327 ;----------------------------------
                                   1328 ;  remainder resulting from euclidian 
                                   1329 ;  division of x/y 
                                   1330 ; input:
                                   1331 ;   x   	dividend int16_t 
                                   1332 ;   y 		divisor int16_t
                                   1333 ; output:
                                   1334 ;   X       n1%n2 
                                   1335 ;----------------------------------
      0015B5                       1336 modulo:
      009572 90 9E A4         [ 4] 1337 	call divide
      009575 80               [ 1] 1338 	ldw x,y 
      009576 2A               [ 4] 1339 	ret 
                                   1340 
                                   1341 ;----------------------------------
                                   1342 ; BASIC: MULDIV(expr1,expr2,expr3)
                                   1343 ; return expr1*expr2/expr3 
                                   1344 ; product result is int32_t and 
                                   1345 ; divisiont is int32_t/int16_t
                                   1346 ;----------------------------------
                           000004  1347 	DBL_SIZE=4 
      0015BA                       1348 muldiv:
      009577 04 03 01         [ 4] 1349 	call func_args 
      00957A 90 50            [ 1] 1350 	cp a,#3 
      00957C 27 03            [ 1] 1351 	jreq 1$
      00957C CD 95 2C         [ 2] 1352 	jp syntax_error
      0015C4                       1353 1$: 
      00957F 7B 01            [ 2] 1354 	ldw x,(5,sp) ; expr1
      009581 27 03            [ 2] 1355 	ldw y,(3,sp) ; expr2
      009583 CD 95 B3         [ 4] 1356 	call multiply 
      009586 1F 05            [ 2] 1357 	ldw (5,sp),x  ;int32_t 15..0
      009586 5B 01            [ 2] 1358 	ldw (3,sp),y  ;int32_t 31..16
      009588 81               [ 2] 1359 	popw x        ; expr3 
      009589 CD 15 48         [ 4] 1360 	call div32_16 ; int32_t/expr3 
      0015D3                       1361 	_drop DBL_SIZE
      009589 52 03            [ 2]    1     addw sp,#DBL_SIZE 
      00958B 1F               [ 4] 1362 	ret 
                                   1363 
                                   1364 
                                   1365 ;---------------------------------
                                   1366 ; dictionary search 
                                   1367 ; input:
                                   1368 ;	X 		dictionary entry point, name field  
                                   1369 ;   y		.asciz name to search 
                                   1370 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



                                   1371 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   1372 ;  X		cmd_index
                                   1373 ;---------------------------------
                           000001  1374 	NLEN=1 ; cmd length 
                           000002  1375 	XSAVE=2
                           000004  1376 	YSAVE=4
                           000005  1377 	VSIZE=5 
      0015D6                       1378 search_dict::
      0015D6                       1379 	_vars VSIZE 
      00958C 01 1E            [ 2]    1     sub sp,#VSIZE 
                                   1380 
      00958E 08 16            [ 2] 1381 	ldw (YSAVE,sp),y 
      0015DA                       1382 search_next:
      009590 06 90            [ 2] 1383 	ldw (XSAVE,sp),x 
                                   1384 ; get name length in dictionary	
      009592 5D               [ 1] 1385 	ld a,(x)
      009593 26 06            [ 1] 1386 	and a,#0xf 
      009595 16 01            [ 1] 1387 	ld (NLEN,sp),a  
      009597 65 5B            [ 2] 1388 	ldw y,(YSAVE,sp) ; name pointer 
      009599 03               [ 1] 1389 	incw x 
      0015E4                       1390 cp_loop:
      00959A 81 F6            [ 1] 1391 	ld a,(y)
      00959B 27 1B            [ 1] 1392 	jreq str_match 
      00959B 51 A6            [ 1] 1393 	tnz (NLEN,sp)
      00959D 11 6B            [ 1] 1394 	jreq no_match  
      00959F 03               [ 1] 1395 	cp a,(x)
      0095A0 26 07            [ 1] 1396 	jrne no_match 
      0095A0 13 01            [ 1] 1397 	incw y 
      0095A2 2B               [ 1] 1398 	incw x
      0095A3 03 72            [ 1] 1399 	dec (NLEN,sp)
      0095A5 F0 01            [ 2] 1400 	jra cp_loop 
      0015F6                       1401 no_match:
      0095A7 8C 90            [ 2] 1402 	ldw x,(XSAVE,sp) 
      0095A9 59 59 0A         [ 2] 1403 	subw x,#2 ; move X to link field
      0095AC 03 26            [ 1] 1404 	push #TK_NONE 
      0095AE F1               [ 2] 1405 	ldw x,(x) ; next word link 
      0095AF 51               [ 1] 1406 	pop a ; TK_NONE 
      0095B0 5B 03            [ 1] 1407 	jreq search_exit  ; not found  
                                   1408 ;try next 
      0095B2 81 D7            [ 2] 1409 	jra search_next
      0095B3                       1410 str_match:
      0095B3 53 90            [ 2] 1411 	ldw x,(XSAVE,sp)
      0095B5 53               [ 1] 1412 	ld a,(X)
      0095B6 1C 00            [ 1] 1413 	ld (NLEN,sp),a ; needed to test keyword type  
      0095B8 01 24            [ 1] 1414 	and a,#0xf 
                                   1415 ; move x to procedure address field 	
      0095BA 02               [ 1] 1416 	inc a 
      0095BB 90 5C 81         [ 1] 1417 	ld acc8,a 
      0095BE 72 5F 00 0D      [ 1] 1418 	clr acc16 
      0095BE 90 5F 9E A4      [ 2] 1419 	addw x,acc16 
      0095C2 80               [ 2] 1420 	ldw x,(x) ; routine index  
                                   1421 ;determine keyword type bits 7:6 
      0095C3 27 02            [ 1] 1422 	ld a,(NLEN,sp)
      0095C5 90               [ 1] 1423 	swap a 
      0095C6 53 81            [ 1] 1424 	and a,#0xc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      0095C8 44               [ 1] 1425 	srl a
      0095C8 52               [ 1] 1426 	srl a 
      0095C9 08 0F            [ 1] 1427 	add a,#128
      001620                       1428 search_exit: 
      001620                       1429 	_drop VSIZE 	 
      0095CB 05 0F            [ 2]    1     addw sp,#VSIZE 
      0095CD 06               [ 4] 1430 	ret 
                                   1431 
                                   1432 ;---------------------
                                   1433 ; check if next token
                                   1434 ;  is of expected type 
                                   1435 ; input:
                                   1436 ;   A 		 expected token attribute
                                   1437 ;  ouput:
                                   1438 ;   none     if fail call syntax_error 
                                   1439 ;--------------------
      001623                       1440 expect:
      0095CE 16               [ 1] 1441 	push a 
      0095CF 0B 17 01         [ 4] 1442 	call next_token 
      0095D2 16 0D            [ 1] 1443 	cp a,(1,sp)
      0095D4 17 03            [ 1] 1444 	jreq 1$
      0095D6 5D 26 05         [ 2] 1445 	jp syntax_error
      0095D9 A6               [ 1] 1446 1$: pop a 
      0095DA 04               [ 4] 1447 	ret 
                                   1448 
                                   1449 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1450 ; parse arguments list 
                                   1451 ; between ()
                                   1452 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001630                       1453 func_args:
      0095DB CC 92            [ 1] 1454 	ld a,#TK_LPAREN 
      0095DD 13 9E A4         [ 4] 1455 	call expect 
                                   1456 ; expected to continue in arg_list 
                                   1457 ; caller must check for TK_RPAREN 
                                   1458 
                                   1459 ;-------------------------------
                                   1460 ; parse embedded BASIC routines 
                                   1461 ; arguments list.
                                   1462 ; arg_list::=  rel[','rel]*
                                   1463 ; all arguments are of integer type
                                   1464 ; and pushed on stack 
                                   1465 ; input:
                                   1466 ;   none
                                   1467 ; output:
                                   1468 ;   stack{n}   arguments pushed on stack
                                   1469 ;   A 	number of arguments pushed on stack  
                                   1470 ;--------------------------------
      001635                       1471 arg_list:
      0095E0 80 27            [ 1] 1472 	push #0  
      0095E2 05 03 05         [ 4] 1473 1$: call relation
      0095E5 03 06            [ 1] 1474 	cp a,#TK_NONE 
      0095E7 50 1F            [ 1] 1475 	jreq 5$
      0095E9 07 7B            [ 1] 1476 	cp a,#TK_INTGR
      0095EB 01 A4            [ 1] 1477 	jrne 4$
      001642                       1478 3$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



                                   1479 ; swap return address with argument
      0095ED 80               [ 1] 1480 	pop a ; arg_count
      0095EE 27 0D            [ 2] 1481 	popw y ; return address 
      0095F0 03               [ 2] 1482 	pushw x ; new argument 
      0095F1 06 1E            [ 2] 1483 	pushw y 
      0095F3 03               [ 1] 1484     inc a
      0095F4 16               [ 1] 1485 	push a 
      0095F5 01 CD 95         [ 4] 1486 	call next_token 
      0095F8 B3 1F            [ 1] 1487 	cp a,#TK_COMMA 
      0095FA 03 17            [ 1] 1488 	jreq 1$ 
      0095FC 01 1E            [ 1] 1489 	cp a,#TK_NONE 
      0095FE 07 CD            [ 1] 1490 	jreq 5$ 
      009600 95 89            [ 1] 1491 4$:	cp a,#TK_RPAREN 
      009602 90 5D            [ 1] 1492 	jreq 5$
      001659                       1493 	_unget_token 
      009604 27 11 7B 06 18   [ 1]    1      mov in,in.saved  
      009609 05               [ 1] 1494 5$:	pop a  
      00960A 27               [ 4] 1495 	ret 
                                   1496 
                                   1497 ;--------------------------------
                                   1498 ;   BASIC commnands 
                                   1499 ;--------------------------------
                                   1500 
                                   1501 ;--------------------------------
                                   1502 ;  arithmetic and relational 
                                   1503 ;  routines
                                   1504 ;  operators precedence
                                   1505 ;  highest to lowest
                                   1506 ;  operators on same row have 
                                   1507 ;  same precedence and are executed
                                   1508 ;  from left to right.
                                   1509 ;	'*','/','%'
                                   1510 ;   '-','+'
                                   1511 ;   '=','>','<','>=','<=','<>','><'
                                   1512 ;   '<>' and '><' are equivalent for not equal.
                                   1513 ;--------------------------------
                                   1514 
                                   1515 ;---------------------
                                   1516 ; return array element
                                   1517 ; address from @(expr)
                                   1518 ; input:
                                   1519 ;   A 		TK_ARRAY
                                   1520 ; output:
                                   1521 ;   A 		TK_INTGR
                                   1522 ;	X 		element address 
                                   1523 ;----------------------
      001660                       1524 get_array_element:
      00960B 0B 5C 90         [ 4] 1525 	call func_args 
      00960E CF 00            [ 1] 1526 	cp a,#1
      009610 0E 16            [ 1] 1527 	jreq 1$
      009612 07 72 B2         [ 2] 1528 	jp syntax_error
      009615 00               [ 2] 1529 1$: popw x 
                                   1530 	; check for bounds 
      009616 0E 7B 06         [ 2] 1531 	cpw x,array_size 
      009619 27 01            [ 2] 1532 	jrule 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



                                   1533 ; bounds {1..array_size}	
      00961B 50 0A            [ 1] 1534 2$: ld a,#ERR_BAD_VALUE 
      00961C CC 11 93         [ 2] 1535 	jp tb_error 
      00961C 5B               [ 2] 1536 3$: tnzw  x
      00961D 08 81            [ 1] 1537 	jreq 2$ 
      00961F 58               [ 2] 1538 	sllw x 
      00961F 52               [ 2] 1539 	pushw x 
      009620 04 90 CF         [ 2] 1540 	ldw x,#tib
      009623 00 0E CD         [ 2] 1541 	subw x,(1,sp)
      001680                       1542 	_drop 2   
      009626 95 BE            [ 2]    1     addw sp,#2 
      009628 1F 03            [ 1] 1543 	ld a,#TK_INTGR
      00962A 17               [ 4] 1544 	ret 
                                   1545 
                                   1546 
                                   1547 ;***********************************
                                   1548 ;   expression parse,execute 
                                   1549 ;***********************************
                                   1550 ;-----------------------------------
                                   1551 ; factor ::= ['+'|'-'|e]  var | @ |
                                   1552 ;			 integer | function |
                                   1553 ;			 '('relation')' 
                                   1554 ; output:
                                   1555 ;   A    token attribute 
                                   1556 ;   X 	 integer
                                   1557 ; ---------------------------------
                           000001  1558 	NEG=1
                           000001  1559 	VSIZE=1
      001685                       1560 factor:
      001685                       1561 	_vars VSIZE 
      00962B 01 CE            [ 2]    1     sub sp,#VSIZE 
      00962D 00 0E CD         [ 4] 1562 	call next_token
      009630 95 C8            [ 1] 1563 	cp a,#CMD_END  
      009632 5B 04            [ 1] 1564 	jrult 16$
      009634 81 01            [ 1] 1565 1$:	ld (NEG,sp),a 
      009635 A4 30            [ 1] 1566 	and a,#TK_GRP_MASK
      009635 CD 96            [ 1] 1567 	cp a,#TK_GRP_ADD 
      009637 1F 93            [ 1] 1568 	jreq 2$
      009639 81 01            [ 1] 1569 	ld a,(NEG,sp)
      00963A 20 03            [ 2] 1570 	jra 4$  
      00169A                       1571 2$:	
      00963A CD 96 B0         [ 4] 1572 	call next_token 
      00169D                       1573 4$:	
      00963D A1 03            [ 1] 1574 	cp a,#TK_IFUNC 
      00963F 27 03            [ 1] 1575 	jrne 5$ 
      009641 CC               [ 4] 1576 	call (x) 
      009642 92 11            [ 2] 1577 	jra 18$ 
      009644                       1578 5$:
      009644 1E 05            [ 1] 1579 	cp a,#TK_INTGR
      009646 16 03            [ 1] 1580 	jrne 6$
      009648 CD 95            [ 2] 1581 	jra 18$
      0016AA                       1582 6$:
      00964A 66 1F            [ 1] 1583 	cp a,#TK_ARRAY
      00964C 05 17            [ 1] 1584 	jrne 10$
      00964E 03 85 CD         [ 4] 1585 	call get_array_element
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      009651 95               [ 2] 1586 	ldw x,(x)
      009652 C8 5B            [ 2] 1587 	jra 18$ 
      0016B4                       1588 10$:
      009654 04 81            [ 1] 1589 	cp a,#TK_VAR 
      009656 26 03            [ 1] 1590 	jrne 12$
      009656 52               [ 2] 1591 	ldw x,(x)
      009657 05 17            [ 2] 1592 	jra 18$
      0016BB                       1593 12$:			
      009659 04 07            [ 1] 1594 	cp a,#TK_LPAREN
      00965A 26 0C            [ 1] 1595 	jrne 16$
      00965A 1F 02 F6         [ 4] 1596 	call relation
      00965D A4               [ 2] 1597 	pushw x 
      00965E 0F 6B            [ 1] 1598 	ld a,#TK_RPAREN 
      009660 01 16 04         [ 4] 1599 	call expect
      009663 5C               [ 2] 1600 	popw x 
      009664 20 0B            [ 2] 1601 	jra 18$	
      0016CB                       1602 16$:
      009664 90               [ 1] 1603 	tnz a 
      009665 F6 27            [ 1] 1604 	jreq 20$ 
      0016CE                       1605 	_unget_token
      009667 1B 0D 01 27 0A   [ 1]    1      mov in,in.saved  
      00966C F1               [ 1] 1606 	clr a 
      00966D 26 07            [ 2] 1607 	jra 20$ 
      0016D6                       1608 18$: 
      00966F 90 5C            [ 1] 1609 	ld a,#TK_MINUS 
      009671 5C 0A            [ 1] 1610 	cp a,(NEG,sp)
      009673 01 20            [ 1] 1611 	jrne 19$
      009675 EE               [ 2] 1612 	negw x
      009676                       1613 19$:
      009676 1E 02            [ 1] 1614 	ld a,#TK_INTGR
      0016DF                       1615 20$:
      0016DF                       1616 	_drop VSIZE
      009678 1D 00            [ 2]    1     addw sp,#VSIZE 
      00967A 02               [ 4] 1617 	ret
                                   1618 
                                   1619 ;-----------------------------------
                                   1620 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   1621 ; output:
                                   1622 ;   A    	token attribute 
                                   1623 ;	X		integer
                                   1624 ;-----------------------------------
                           000001  1625 	N1=1   ; int16_t
                           000003  1626 	MULOP=3
                           000003  1627 	VSIZE=3
      0016E2                       1628 term:
      0016E2                       1629 	_vars VSIZE
      00967B 4B 00            [ 2]    1     sub sp,#VSIZE 
      00967D FE 84 27         [ 4] 1630 	call factor
      009680 1F               [ 1] 1631 	tnz a 
      009681 20 D7            [ 1] 1632 	jreq term_exit 
      009683                       1633 term01:	 ; check for  operator 
      009683 1E 02            [ 2] 1634 	ldw (N1,sp),x  ; save first factor 
      009685 F6 6B 01         [ 4] 1635 	call next_token
      009688 A4 0F            [ 1] 1636 	ld (MULOP,sp),a
      00968A 4C C7            [ 1] 1637 	cp a,#CMD_END
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00968C 00 0F            [ 1] 1638 	jrult 8$
      00968E 72 5F            [ 1] 1639 	and a,#TK_GRP_MASK
      009690 00 0E            [ 1] 1640 	cp a,#TK_GRP_MULT
      009692 72 BB            [ 1] 1641 	jreq 1$
      009694 00 0E            [ 2] 1642 	jra 8$
      0016FD                       1643 1$:	; got *|/|%
      009696 FE 7B 01         [ 4] 1644 	call factor
      009699 4E A4            [ 1] 1645 	cp a,#TK_INTGR
      00969B 0C 44            [ 1] 1646 	jreq 2$
      00969D 44 AB 80         [ 2] 1647 	jp syntax_error
      0096A0 90 93            [ 1] 1648 2$:	ldw y,x 
      0096A0 5B 05            [ 2] 1649 	ldw x,(N1,sp)
      0096A2 81 03            [ 1] 1650 	ld a,(MULOP,sp) 
      0096A3 A1 20            [ 1] 1651 	cp a,#TK_MULT 
      0096A3 88 CD            [ 1] 1652 	jrne 3$
      0096A5 93 09 11         [ 4] 1653 	call multiply 
      0096A8 01 27            [ 2] 1654 	jra term01
      0096AA 03 CC            [ 1] 1655 3$: cp a,#TK_DIV 
      0096AC 92 11            [ 1] 1656 	jrne 4$ 
      0096AE 84 81 9F         [ 4] 1657 	call divide 
      0096B0 20 CB            [ 2] 1658 	jra term01 
      0096B0 A6 07 CD         [ 4] 1659 4$: call modulo
      0096B3 96 A3            [ 2] 1660 	jra term01 
      0096B5 7B 03            [ 1] 1661 8$: ld a,(MULOP,sp)
      0096B5 4B 00            [ 1] 1662 	jreq 9$ 
      001728                       1663 	_unget_token
      0096B7 CD 97 FD A1 00   [ 1]    1      mov in,in.saved  
      0096BC 27 20            [ 2] 1664 9$: ldw x,(N1,sp)
      0096BE A1 84            [ 1] 1665 	ld a,#TK_INTGR 	
      001731                       1666 term_exit:
      001731                       1667 	_drop VSIZE 
      0096C0 26 13            [ 2]    1     addw sp,#VSIZE 
      0096C2 81               [ 4] 1668 	ret 
                                   1669 
                                   1670 ;-------------------------------
                                   1671 ;  expr ::= term [['+'|'-'] term]*
                                   1672 ;  result range {-32768..32767}
                                   1673 ;  output:
                                   1674 ;   A    token attribute 
                                   1675 ;   X	 integer   
                                   1676 ;-------------------------------
                           000001  1677 	N1=1
                           000003  1678 	N2=3 
                           000005  1679 	OP=5 
                           000005  1680 	VSIZE=5 
      001734                       1681 expression:
      001734                       1682 	_vars VSIZE 
      0096C2 84 90            [ 2]    1     sub sp,#VSIZE 
      0096C4 85 89 90         [ 4] 1683 	call term
      0096C7 89               [ 1] 1684 	tnz a 
      0096C8 4C 88            [ 1] 1685 	jreq expr_exit 
      0096CA CD 93            [ 2] 1686 1$:	ldw (N1,sp),x 
      0096CC 09 A1 09         [ 4] 1687 	call next_token
      0096CF 27 E6            [ 1] 1688 	ld (OP,sp),a 
      0096D1 A1 00            [ 1] 1689 	cp a,#CMD_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      0096D3 27 09            [ 1] 1690 	jrult 8$ 
      0096D5 A1 08            [ 1] 1691 	and a,#TK_GRP_MASK
      0096D7 27 05            [ 1] 1692 	cp a,#TK_GRP_ADD 
      0096D9 55 00            [ 1] 1693 	jreq 2$ 
      0096DB 03 00            [ 2] 1694 	jra 8$
      00174F                       1695 2$: 
      0096DD 02 84 81         [ 4] 1696 	call term
      0096E0 A1 84            [ 1] 1697 	cp a,#TK_INTGR
      0096E0 CD 96            [ 1] 1698 	jreq 3$
      0096E2 B0 A1 01         [ 2] 1699 	jp syntax_error
      0096E5 27 03            [ 2] 1700 3$:	ldw (N2,sp),x 
      0096E7 CC 92            [ 2] 1701 	ldw x,(N1,sp)
      0096E9 11 85            [ 1] 1702 	ld a,(OP,sp)
      0096EB C3 00            [ 1] 1703 	cp a,#TK_PLUS 
      0096ED 20 23            [ 1] 1704 	jrne 4$
      0096EF 05 A6 0A         [ 2] 1705 	addw x,(N2,sp)
      0096F2 CC 92            [ 2] 1706 	jra 1$ 
      0096F4 13 5D 27         [ 2] 1707 4$:	subw x,(N2,sp)
      0096F7 F8 58            [ 2] 1708 	jra 1$
      0096F9 89 AE            [ 1] 1709 8$: ld a,(OP,sp)
      0096FB 16 90            [ 1] 1710 	jreq 9$ 
      001771                       1711 	_unget_token	
      0096FD 72 F0 01 5B 02   [ 1]    1      mov in,in.saved  
      009702 A6 84            [ 2] 1712 9$: ldw x,(N1,sp)
      009704 81 84            [ 1] 1713 	ld a,#TK_INTGR	
      009705                       1714 expr_exit:
      00177A                       1715 	_drop VSIZE 
      009705 52 01            [ 2]    1     addw sp,#VSIZE 
      009707 CD               [ 4] 1716 	ret 
                                   1717 
                                   1718 ;---------------------------------------------
                                   1719 ; rel ::= expr rel_op expr
                                   1720 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   1721 ;  relation return  integer , zero is false 
                                   1722 ;  output:
                                   1723 ;    A 		token attribute  
                                   1724 ;	 X		integer 
                                   1725 ;---------------------------------------------
                           000001  1726 	N1=1
                           000003  1727 	RELOP=3
                           000003  1728 	VSIZE=3 
      00177D                       1729 relation: 
      00177D                       1730 	_vars VSIZE
      009708 93 09            [ 2]    1     sub sp,#VSIZE 
      00970A A1 02 25         [ 4] 1731 	call expression
      00970D 3D               [ 1] 1732 	tnz a 
      00970E 6B 01            [ 1] 1733 	jreq rel_exit
      009710 A4 30            [ 2] 1734 	ldw (N1,sp),x 
                                   1735 ; expect rel_op or leave 
      009712 A1 10 27         [ 4] 1736 	call next_token 
      009715 04 7B            [ 1] 1737 	ld (RELOP,sp),a 
      009717 01 20            [ 1] 1738 	and a,#TK_GRP_MASK
      009719 03 30            [ 1] 1739 	cp a,#TK_GRP_RELOP 
      00971A 26 33            [ 1] 1740 	jrne 8$
      001792                       1741 2$:	; expect another expression
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00971A CD 93 09         [ 4] 1742 	call expression
      00971D A1 84            [ 1] 1743 	cp a,#TK_INTGR
      00971D A1 81            [ 1] 1744 	jreq 3$
      00971F 26 03 FD         [ 2] 1745 	jp syntax_error 
      009722 20 32 0D         [ 2] 1746 3$:	ldw acc16,x 
      009724 1E 01            [ 2] 1747 	ldw x,(N1,sp) 
      009724 A1 84 26 02      [ 2] 1748 	subw x,acc16
      009728 20 2C            [ 1] 1749 	jrne 4$
      00972A 35 02 00 0E      [ 1] 1750 	mov acc8,#2 ; n1==n2
      00972A A1 06            [ 2] 1751 	jra 6$ 
      0017AD                       1752 4$: 
      00972C 26 06            [ 1] 1753 	jrsgt 5$  
      00972E CD 96 E0 FE      [ 1] 1754 	mov acc8,#4 ; n1<2 
      009732 20 22            [ 2] 1755 	jra 6$
      009734                       1756 5$:
      009734 A1 85 26 03      [ 1] 1757 	mov acc8,#1 ; n1>n2 
      0017B9                       1758 6$:
      009738 FE               [ 1] 1759 	clrw x 
      009739 20 1B 0E         [ 1] 1760 	ld a, acc8  
      00973B 14 03            [ 1] 1761 	and a,(RELOP,sp)
      00973B A1               [ 1] 1762 	tnz a 
      00973C 07 26            [ 1] 1763 	jreq 10$
      00973E 0C               [ 1] 1764 	incw x 
      00973F CD 97            [ 2] 1765 	jra 10$  	
      009741 FD 89            [ 1] 1766 8$: ld a,(RELOP,sp)
      009743 A6 08            [ 1] 1767 	jreq 9$
      0017C9                       1768 	_unget_token
      009745 CD 96 A3 85 20   [ 1]    1      mov in,in.saved  
      0017CE                       1769 9$: 
      00974A 0B 01            [ 2] 1770 	ldw x,(N1,sp)
      00974B                       1771 10$:
      00974B 4D 27            [ 1] 1772 	ld a,#TK_INTGR
      0017D2                       1773 rel_exit:
      0017D2                       1774 	_drop VSIZE
      00974D 11 55            [ 2]    1     addw sp,#VSIZE 
      00974F 00               [ 4] 1775 	ret 
                                   1776 
                                   1777 ;--------------------------------
                                   1778 ; BASIC: SHOW 
                                   1779 ; print stack content in hexadecimal bytes 
                                   1780 ; 16 bytes per row 
                                   1781 ;--------------------------------
      0017D5                       1782 show:
      009750 03 00 02         [ 2] 1783 	ldw x,#cstk_prompt
      009753 4F 20 09         [ 4] 1784 	call puts 
      009756 96               [ 1] 1785 	ldw x,sp 
      009756 A6 11 11         [ 2] 1786 	addw x,#3 ; ignore return address
      009759 01 26 01 50      [ 2] 1787 	ldw y,#RAM_SIZE  
      00975D CF 00 0D         [ 2] 1788 	ldw acc16,x 
      00975D A6 84 00 0D      [ 2] 1789 	subw y,acc16
      00975F CD 0D CD         [ 4] 1790 	call hex_dump
      00975F 5B               [ 1] 1791 	clr a 
      009760 01               [ 4] 1792 	ret
                                   1793 
      009761 81 63 6F 6E 74 65 6E  1794 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



             74 20 6F 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   1795 
                                   1796 
                                   1797 ;--------------------------------------------
                                   1798 ; BASIC: HEX 
                                   1799 ; select hexadecimal base for integer print
                                   1800 ;---------------------------------------------
      009762                       1801 hex_base:
      009762 52 03 CD 97      [ 1] 1802 	mov base,#16 
      009766 05               [ 4] 1803 	ret 
                                   1804 
                                   1805 ;--------------------------------------------
                                   1806 ; BASIC: DEC 
                                   1807 ; select decimal base for integer print
                                   1808 ;---------------------------------------------
      00181B                       1809 dec_base:
      009767 4D 27 47 0A      [ 1] 1810 	mov base,#10
      00976A 81               [ 4] 1811 	ret 
                                   1812 
                                   1813 ;------------------------
                                   1814 ; BASIC: FREE 
                                   1815 ; return free size in RAM 
                                   1816 ; output:
                                   1817 ;   A 		TK_INTGR
                                   1818 ;   X 	    size integer
                                   1819 ;--------------------------
      001820                       1820 free:
      00976A 1F 01 CD         [ 2] 1821 	ldw x,#tib 
      00976D 93 09 6B 03      [ 2] 1822 	ldw y,txtbgn 
      009771 A1 02 25 2F      [ 2] 1823 	cpw y,#app_space
      009775 A4 30            [ 1] 1824 	jrult 1$
      009777 A1 20 27         [ 2] 1825 	subw x,#free_ram 
      00977A 02 20            [ 2] 1826 	jra 2$ 
      001832                       1827 1$:	
      00977C 27 B0 00 1C      [ 2] 1828 	subw x,txtend 
      00977D A6 84            [ 1] 1829 2$:	ld a,#TK_INTGR
      00977D CD               [ 4] 1830 	ret 
                                   1831 
                                   1832 ;------------------------------
                                   1833 ; BASIC: SIZE 
                                   1834 ; command that print 
                                   1835 ; program start addres and size 
                                   1836 ;------------------------------
      001839                       1837 cmd_size:
      00977E 97 05 A1         [ 1] 1838 	push base 
      009781 84 27 03         [ 2] 1839 	ldw x,#PROG_ADDR 
      009784 CC 92 11         [ 4] 1840 	call puts 
      009787 90 93 1E         [ 2] 1841 	ldw x,txtbgn     
      00978A 01 7B 03 A1      [ 1] 1842 	mov base,#16 
      00978E 20 26 05         [ 4] 1843 	call print_int
      009791 CD 95 66         [ 1] 1844 	pop base 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      009794 20 D4 A1         [ 2] 1845 	ldw x,#PROG_SIZE 
      009797 21 26 05         [ 4] 1846 	call puts 
      00979A CD 96 1F         [ 2] 1847 	ldw x,txtend 
      00979D 20 CB CD 96      [ 2] 1848 	subw x,txtbgn 
      0097A1 35 20 C6         [ 4] 1849 	call print_int
      0097A4 7B 03 27         [ 2] 1850 	ldw x,#STR_BYTES 
      0097A7 05 55 00         [ 4] 1851 	call puts  
      0097AA 03               [ 4] 1852 	ret 
                                   1853 
                                   1854 
      0097AB 00 02 1E 01 A6 84 6D  1855 PROG_ADDR: .asciz "program address: "
             20 61 64 64 72 65 73
             73 3A 20 00
      0097B1 70 72 6F 67 72 61 6D  1856 PROG_SIZE: .asciz "program size: "
             20 73 69 7A 65 3A 20
             00
      0097B1 5B 03 81 65 73 0A 00  1857 STR_BYTES: .asciz "bytes\n" 
                                   1858 
                                   1859 ;------------------------
                                   1860 ; BASIC: UBOUND  
                                   1861 ; return array variable size 
                                   1862 ; output:
                                   1863 ;   A 		TK_INTGR
                                   1864 ;   X 	    array size 
                                   1865 ;--------------------------
      0097B4                       1866 ubound:
      0097B4 52 05 CD         [ 4] 1867 	call free 
      0097B7 97               [ 2] 1868 	srlw x 
      0097B8 62 4D 27         [ 2] 1869 	ldw array_size,x
      0097BB 3E 1F            [ 1] 1870 	ld a,#TK_INTGR
      0097BD 01               [ 4] 1871 	ret 
                                   1872 
                                   1873 ;-----------------------------
                                   1874 ; BASIC: LET var=expr 
                                   1875 ; variable assignement 
                                   1876 ; output:
                                   1877 ;   A 		TK_NONE 
                                   1878 ;-----------------------------
      001898                       1879 let::
      0097BE CD 93 09         [ 4] 1880 	call next_token 
      0097C1 6B 05            [ 1] 1881 	cp a,#TK_VAR 
      0097C3 A1 02            [ 1] 1882 	jreq let_var
      0097C5 25 26            [ 1] 1883 	cp a,#TK_ARRAY 
      0097C7 A4 30            [ 1] 1884 	jreq  let_array
      0097C9 A1 10 27         [ 2] 1885 	jp syntax_error
      0018A6                       1886 let_array:
      0097CC 02 20 1E         [ 4] 1887 	call get_array_element
      0097CF                       1888 let_var:
      0097CF CD               [ 2] 1889 	pushw x  
      0097D0 97 62 A1         [ 4] 1890 	call next_token 
      0097D3 84 27            [ 1] 1891 	cp a,#TK_EQUAL
      0097D5 03 CC            [ 1] 1892 	jreq 1$
      0097D7 92 11 1F         [ 2] 1893 	jp syntax_error
      0018B4                       1894 1$:	
      0097DA 03 1E 01         [ 4] 1895 	call relation   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      0097DD 7B 05            [ 1] 1896 	cp a,#TK_INTGR 
      0097DF A1 10            [ 1] 1897 	jreq 2$
      0097E1 26 05 72         [ 2] 1898 	jp syntax_error
      0018BE                       1899 2$:	
      0097E4 FB 03            [ 1] 1900 	ldw y,x 
      0097E6 20               [ 2] 1901 	popw x   
      0097E7 D4               [ 2] 1902 	ldw (x),y   
      0097E8 72               [ 4] 1903 	ret 
                                   1904 
                                   1905 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1906 ; return program size 
                                   1907 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018C3                       1908 prog_size:
      0097E9 F0 03 20         [ 2] 1909 	ldw x,txtend 
      0097EC CF 7B 05 27      [ 2] 1910 	subw x,txtbgn 
      0097F0 05               [ 4] 1911 	ret 
                                   1912 
                                   1913 ;----------------------------
                                   1914 ; BASIC: LIST [[start][,end]]
                                   1915 ; list program lines 
                                   1916 ; form start to end 
                                   1917 ; if empty argument list then 
                                   1918 ; list all.
                                   1919 ;----------------------------
                           000001  1920 	FIRST=1
                           000003  1921 	LAST=3 
                           000005  1922 	LN_PTR=5
                           000006  1923 	VSIZE=6 
      0018CB                       1924 list:
      0097F1 55 00 03         [ 2] 1925 	ldw x,txtbgn 
      0097F4 00 02 1E         [ 2] 1926 	cpw x,txtend 
      0097F7 01 A6            [ 1] 1927 	jrmi 1$
      0097F9 84               [ 4] 1928 	ret 
      0097FA                       1929 1$:	
      0097FA 5B 05 81         [ 2] 1930 	ldw x,#PROG_SIZE
      0097FD CD 03 4E         [ 4] 1931 	call puts 
      0097FD 52 03 CD         [ 2] 1932 	ldw x,txtend 
      009800 97 B4 4D 27      [ 2] 1933 	subw x,txtbgn 
      009804 4D 1F 01         [ 4] 1934 	call print_int 
      009807 CD 93 09         [ 2] 1935 	ldw x,#STR_BYTES 
      00980A 6B 03 A4         [ 4] 1936 	call puts 
      0018EA                       1937 	_vars VSIZE
      00980D 30 A1            [ 2]    1     sub sp,#VSIZE 
      00980F 30 26 33         [ 2] 1938 	ldw x,txtbgn 
      009812 1F 05            [ 2] 1939 	ldw (LN_PTR,sp),x 
      009812 CD               [ 2] 1940 	ldw x,(x) 
      009813 97 B4            [ 2] 1941 	ldw (FIRST,sp),x ; list from first line 
      009815 A1 84 27         [ 2] 1942 	ldw x,#MAX_LINENO ; biggest line number 
      009818 03 CC            [ 2] 1943 	ldw (LAST,sp),x 
      00981A 92 11 CF         [ 4] 1944 	call arg_list
      00981D 00               [ 1] 1945 	tnz a
      00981E 0E 1E            [ 1] 1946 	jreq list_loop 
      009820 01 72            [ 1] 1947 	cp a,#2 
      009822 B0 00            [ 1] 1948 	jreq 4$
      009824 0E 26            [ 1] 1949 	cp a,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      009826 06 35            [ 1] 1950 	jreq first_line 
      009828 02 00 0F         [ 2] 1951 	jp syntax_error 
      00982B 20               [ 2] 1952 4$:	popw x 
      00982C 0C 05            [ 2] 1953 	ldw (LAST+2,sp),x 
      00982D                       1954 first_line:
      00982D 2C               [ 2] 1955 	popw x
      00982E 06 35            [ 2] 1956 	ldw (FIRST,sp),x 
      001910                       1957 lines_skip:
      009830 04 00 0F         [ 2] 1958 	ldw x,txtbgn
      009833 20 04            [ 2] 1959 2$:	ldw (LN_PTR,sp),x 
      009835 C3 00 1C         [ 2] 1960 	cpw x,txtend 
      009835 35 01            [ 1] 1961 	jrpl list_exit 
      009837 00               [ 2] 1962 	ldw x,(x) ;line# 
      009838 0F 01            [ 2] 1963 	cpw x,(FIRST,sp)
      009839 2A 11            [ 1] 1964 	jrpl list_loop 
      009839 5F C6            [ 2] 1965 	ldw x,(LN_PTR,sp) 
      00983B 00 0F            [ 1] 1966 	ld a,(2,x)
      00983D 14 03 4D         [ 1] 1967 	ld acc8,a 
      009840 27 0E 5C 20      [ 1] 1968 	clr acc16 
      009844 0B 7B 03 27      [ 2] 1969 	addw x,acc16
      009848 05 55            [ 2] 1970 	jra 2$ 
                                   1971 ; print loop
      001930                       1972 list_loop:
      00984A 00 03            [ 2] 1973 	ldw x,(LN_PTR,sp)
      00984C 00 02            [ 1] 1974 	ld a,(2,x) 
      00984E CD 19 A4         [ 4] 1975 	call prt_basic_line
      00984E 1E 01            [ 2] 1976 	ldw x,(LN_PTR,sp)
      009850 E6 02            [ 1] 1977 	ld a,(2,x)
      009850 A6 84 0E         [ 1] 1978 	ld acc8,a 
      009852 72 5F 00 0D      [ 1] 1979 	clr acc16 
      009852 5B 03 81 0D      [ 2] 1980 	addw x,acc16
      009855 C3 00 1C         [ 2] 1981 	cpw x,txtend 
      009855 AE 98            [ 1] 1982 	jrpl list_exit
      009857 6F CD            [ 2] 1983 	ldw (LN_PTR,sp),x
      009859 83               [ 2] 1984 	ldw x,(x)
      00985A CE 96            [ 2] 1985 	cpw x,(LAST,sp)  
      00985C 1C 00            [ 1] 1986 	jrslt list_loop
      001952                       1987 list_exit:
      00985E 03 90 AE 18 00   [ 1] 1988 	mov in,count 
      009863 CF 00 0E         [ 2] 1989 	ldw x,#pad 
      009866 72 B2 00         [ 2] 1990 	ldw basicptr,x 
      00195D                       1991 	_drop VSIZE 
      009869 0E CD            [ 2]    1     addw sp,#VSIZE 
      00986B 8E               [ 4] 1992 	ret
                                   1993 
                                   1994 
                                   1995 ;--------------------------
                                   1996 ; BASIC: EDIT \E | \F
                                   1997 ;  copy program in FLASH 
                                   1998 ;  to RAM for edition 
                                   1999 ;-------------------------
      001960                       2000 edit:
      00986C 4D 4F 81         [ 4] 2001 	call qsign 
      00986F 0A 63            [ 1] 2002 	jreq 1$ 
      009871 6F 6E 74         [ 2] 2003 	ldw x,#NOT_SAVED 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      009874 65 6E 74         [ 4] 2004 	call puts 
      009877 20               [ 4] 2005 	ret 
      00196C                       2006 1$: 
      009878 6F 66 20 73      [ 2] 2007 	ldw y,#app_sign ; source address 
      00987C 74 61 63         [ 2] 2008     ldw x,app_size  
      00987F 6B 20 66         [ 2] 2009 	addw x,#4 
      009882 72 6F 6D         [ 2] 2010 	ldw acc16,x  ; bytes to copy 
      009885 20 74 6F         [ 2] 2011 	ldw x,#rsign ; destination address 
      009888 70 20 74         [ 4] 2012 	call move  
      00988B 6F 20 62         [ 2] 2013 	ldw x,#free_ram 
      00988E 6F 74 74         [ 2] 2014 	ldw txtbgn,x 
      009891 6F 6D 3A 0A      [ 2] 2015 	addw x,rsize  
      009895 00 00 1C         [ 2] 2016 	ldw txtend,x 
      009896 81               [ 4] 2017 	ret 
                                   2018 
      009896 35 10 00 0B 81 70 6C  2019 NOT_SAVED: .asciz "No application saved.\n"
             69 63 61 74 69 6F 6E
             20 73 61 76 65 64 2E
             0A 00
                                   2020 
                                   2021 ;--------------------------
                                   2022 ; decompile line from token list
                                   2023 ; and print it. 
                                   2024 ; input:
                                   2025 ;   A       stop at this position 
                                   2026 ;   X 		pointer at line
                                   2027 ; output:
                                   2028 ;   none 
                                   2029 ;--------------------------	
      00989B                       2030 prt_basic_line:
      00989B 35 0A 00         [ 1] 2031 	ld count,a 
      00989E 0B 81            [ 1] 2032 	ld a,(2,x)
      0098A0 C1 00 03         [ 1] 2033 	cp a,count 
      0098A0 AE 16            [ 1] 2034 	jrpl 1$ 
      0098A2 90 90 CE         [ 1] 2035 	ld count,a 
      0098A5 00 1B 90         [ 2] 2036 1$:	ldw basicptr,x 
      0098A8 A3 AC 80 25      [ 2] 2037 	ldw y,#tib  
      0098AC 05 1D 00         [ 4] 2038 	call decompile 
      0098AF 80 20 04         [ 4] 2039 	call puts 
      0098B2 A6 0D            [ 1] 2040 	ld a,#CR 
      0098B2 72 B0 00         [ 4] 2041 	call putc 
      0098B5 1D               [ 4] 2042 	ret 
                                   2043 
                                   2044 
                                   2045 
                                   2046 ;---------------------------------
                                   2047 ; BASIC: PRINT|? arg_list 
                                   2048 ; print values from argument list
                                   2049 ;----------------------------------
                           000001  2050 	CCOMMA=1
                           000001  2051 	VSIZE=1
      0019C4                       2052 print:
      0019C4                       2053 	_vars VSIZE 
      0098B6 A6 84            [ 2]    1     sub sp,#VSIZE 
      0019C6                       2054 reset_comma:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      0098B8 81 01            [ 1] 2055 	clr (CCOMMA,sp)
      0098B9                       2056 prt_loop:
      0098B9 3B 00 0B         [ 4] 2057 	call next_token
      0098BC AE 98            [ 1] 2058 	cp a,#CMD_END 
      0098BE E6 CD            [ 1] 2059 	jrult print_exit ; colon or end of line 
      0098C0 83 CE            [ 1] 2060 	cp a,#TK_QSTR
      0098C2 CE 00            [ 1] 2061 	jreq 1$
      0098C4 1B 35            [ 1] 2062 	cp a,#TK_CHAR 
      0098C6 10 00            [ 1] 2063 	jreq 2$ 
      0098C8 0B CD            [ 1] 2064 	cp a,#TK_CFUNC 
      0098CA 93 57            [ 1] 2065 	jreq 3$
      0098CC 32 00            [ 1] 2066 	cp a,#TK_COMMA 
      0098CE 0B AE            [ 1] 2067 	jreq 4$
      0098D0 98 F8            [ 1] 2068 	cp a,#TK_SHARP 
      0098D2 CD 83            [ 1] 2069 	jreq 5$
      0098D4 CE CE            [ 2] 2070 	jra 7$ 
      0019E5                       2071 1$:	; print string 
      0098D6 00 1D 72         [ 4] 2072 	call puts
      0098D9 B0 00            [ 2] 2073 	jra reset_comma
      0019EA                       2074 2$:	; print character 
      0098DB 1B               [ 1] 2075 	ld a,xl 
      0098DC CD 93 57         [ 4] 2076 	call putc 
      0098DF AE 99            [ 2] 2077 	jra reset_comma 
      0019F0                       2078 3$: ; print character function value  	
      0098E1 07               [ 4] 2079 	call (x)
      0098E2 CD               [ 1] 2080 	ld a,xl 
      0098E3 83 CE 81         [ 4] 2081 	call putc
      0098E6 70 72            [ 2] 2082 	jra reset_comma 
      0019F7                       2083 4$: ; set comma state 
      0098E8 6F 67            [ 1] 2084 	cpl (CCOMMA,sp)
      0098EA 72 61            [ 2] 2085 	jra prt_loop   
      0019FB                       2086 5$: ; # character must be followed by an integer   
      0098EC 6D 20 61         [ 4] 2087 	call next_token
      0098EF 64 64            [ 1] 2088 	cp a,#TK_INTGR 
      0098F1 72 65            [ 1] 2089 	jreq 6$
      0098F3 73 73 3A         [ 2] 2090 	jp syntax_error 
      001A05                       2091 6$: ; set tab width
      0098F6 20               [ 1] 2092 	ld a,xl 
      0098F7 00 70            [ 1] 2093 	and a,#15 
      0098F9 72 6F 67         [ 1] 2094 	ld tab_width,a 
      0098FC 72 61            [ 2] 2095 	jra reset_comma 
      001A0D                       2096 7$:	
      001A0D                       2097 	_unget_token 
      0098FE 6D 20 73 69 7A   [ 1]    1      mov in,in.saved  
      009903 65 3A 20         [ 4] 2098 	call relation 
      009906 00 62            [ 1] 2099 	cp a,#TK_INTGR 
      009908 79 74            [ 1] 2100 	jrne print_exit 
      00990A 65 73 0A         [ 4] 2101     call print_int 
      00990D 00 A8            [ 2] 2102 	jra reset_comma 
      00990E                       2103 print_exit:
      00990E CD 98            [ 1] 2104 	tnz (CCOMMA,sp)
      009910 A0 54            [ 1] 2105 	jrne 9$
      009912 CF 00            [ 1] 2106 	ld a,#CR 
      009914 20 A6 84         [ 4] 2107     call putc 
      001A27                       2108 9$:	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      009917 81 01            [ 2]    1     addw sp,#VSIZE 
      009918 81               [ 4] 2109 	ret 
                                   2110 
                                   2111 ;----------------------
                                   2112 ; 'save_context' and
                                   2113 ; 'rest_context' must be 
                                   2114 ; called at the same 
                                   2115 ; call stack depth 
                                   2116 ; i.e. SP must have the 
                                   2117 ; save value at  
                                   2118 ; entry point of both 
                                   2119 ; routine. 
                                   2120 ;---------------------
                           000004  2121 	CTXT_SIZE=4 ; size of saved data 
                                   2122 ;--------------------
                                   2123 ; save current BASIC
                                   2124 ; interpreter context 
                                   2125 ; on stack 
                                   2126 ;--------------------
      001A2A                       2127 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001A2A                       2128 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001A2A                       2129 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      001A2A                       2130 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      001A2A                       2131 save_context:
      009918 CD 93 09         [ 2] 2132 	ldw x,basicptr 
      00991B A1 85            [ 2] 2133 	ldw (BPTR,sp),x
      00991D 27 0A A1         [ 1] 2134 	ld a,in 
      009920 06 27            [ 1] 2135 	ld (IN,sp),a
      009922 03 CC 92         [ 1] 2136 	ld a,count 
      009925 11 06            [ 1] 2137 	ld (CNT,sp),a  
      009926 81               [ 4] 2138 	ret
                                   2139 
                                   2140 ;-----------------------
                                   2141 ; restore previously saved 
                                   2142 ; BASIC interpreter context 
                                   2143 ; from stack 
                                   2144 ;-------------------------
      001A3A                       2145 rest_context:
      009926 CD 96            [ 2] 2146 	ldw x,(BPTR,sp)
      009928 E0 00 04         [ 2] 2147 	ldw basicptr,x 
      009929 7B 05            [ 1] 2148 	ld a,(IN,sp)
      009929 89 CD 93         [ 1] 2149 	ld in,a
      00992C 09 A1            [ 1] 2150 	ld a,(CNT,sp)
      00992E 32 27 03         [ 1] 2151 	ld count,a  
      009931 CC               [ 4] 2152 	ret
                                   2153 
                                   2154 
                                   2155 
                                   2156 ;------------------------------------------
                                   2157 ; BASIC: INPUT [string]var[,[string]var]
                                   2158 ; input value in variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



                                   2159 ; [string] optionally can be used as prompt 
                                   2160 ;-----------------------------------------
                           000001  2161 	CX_BPTR=1
                           000003  2162 	CX_IN=3
                           000004  2163 	CX_CNT=4
                           000005  2164 	SKIP=5
                           000006  2165 	VAR_ADDR=6
                           000007  2166 	VSIZE=7
      001A4A                       2167 input_var:
      001A4A                       2168 	_vars VSIZE 
      009932 92 11            [ 2]    1     sub sp,#VSIZE 
      009934                       2169 input_loop:
      009934 CD 97            [ 1] 2170 	clr (SKIP,sp)
      009936 FD A1 84         [ 4] 2171 	call next_token 
      009939 27 03            [ 1] 2172 	cp a,#TK_QSTR 
      00993B CC 92            [ 1] 2173 	jrne 1$ 
      00993D 11 03 4E         [ 4] 2174 	call puts 
      00993E 03 05            [ 1] 2175 	cpl (SKIP,sp)
      00993E 90 93 85         [ 4] 2176 	call next_token 
      009941 FF 81            [ 1] 2177 1$: cp a,#TK_VAR  
      009943 27 03            [ 1] 2178 	jreq 2$ 
      009943 CE 00 1D         [ 2] 2179 	jp syntax_error
      009946 72 B0            [ 2] 2180 2$:	ldw (VAR_ADDR,sp),x 
      009948 00 1B            [ 1] 2181 	tnz (SKIP,sp)
      00994A 81 06            [ 1] 2182 	jrne 21$ 
      00994B CD 0B 68         [ 4] 2183 	call var_name 
      00994B CE 00 1B         [ 4] 2184 	call putc   
      001A70                       2185 21$:
      00994E C3 00            [ 1] 2186 	ld a,#':
      009950 1D 2B 01         [ 4] 2187 	call putc 
      009953 81 1A 2A         [ 4] 2188 	call save_context 
      009954 72 5F 00 03      [ 1] 2189 	clr count  
      009954 AE 98 F8         [ 4] 2190 	call readln 
      009957 CD 83 CE         [ 2] 2191 	ldw x,#tib 
      00995A CE 00 1D         [ 1] 2192 	push count
      00995D 72 B0            [ 1] 2193 	push #0 
      00995F 00 1B CD         [ 2] 2194 	addw x,(1,sp)
      009962 93               [ 1] 2195 	incw x 
      001A8B                       2196 	_drop 2 
      009963 57 AE            [ 2]    1     addw sp,#2 
      009965 99 07 CD 83      [ 1] 2197 	clr in 
      009969 CE 52 06         [ 4] 2198 	call get_token
      00996C CE 00            [ 1] 2199 	cp a,#TK_INTGR
      00996E 1B 1F            [ 1] 2200 	jreq 3$ 
      009970 05 FE            [ 1] 2201 	cp a,#TK_MINUS
      009972 1F 01 AE         [ 4] 2202 	call get_token 
      009975 7F FF            [ 1] 2203 	cp a,#TK_INTGR 
      009977 1F 03            [ 1] 2204 	jreq 22$
      009979 CD 96 B5         [ 4] 2205 	call rest_context 
      00997C 4D 27 31         [ 2] 2206 	jp syntax_error
      001AA7                       2207 22$:
      00997F A1               [ 2] 2208 	negw x 	
      009980 02 27            [ 2] 2209 3$: ldw y,(VAR_ADDR,sp) 
      009982 07 A1            [ 2] 2210 	ldw (y),x 
      009984 01 27 06         [ 4] 2211 	call rest_context
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      009987 CC 92 11         [ 4] 2212 	call next_token 
      00998A 85 1F            [ 1] 2213 	cp a,#TK_COMMA 
      00998C 05 96            [ 1] 2214 	jreq input_loop
      00998D A1 00            [ 1] 2215 	cp a,#TK_NONE 
      00998D 85 1F            [ 1] 2216 	jreq input_exit  
      00998F 01 0B            [ 1] 2217 	cp a,#TK_COLON 
      009990 27 03            [ 1] 2218     jreq input_exit 
      009990 CE 00 1B         [ 2] 2219 	jp syntax_error 
      001AC1                       2220 input_exit:
      001AC1                       2221 	_drop VSIZE 
      009993 1F 05            [ 2]    1     addw sp,#VSIZE 
      009995 C3               [ 4] 2222 	ret 
                                   2223 
                                   2224 
                                   2225 ;---------------------
                                   2226 ; BASIC: REMARK | ' 
                                   2227 ; skip comment to end of line 
                                   2228 ;---------------------- 
      001AC4                       2229 remark::
      009996 00 1D 2A 38 FE   [ 1] 2230 	mov in,count 
      00999B 13               [ 4] 2231  	ret 
                                   2232 
                                   2233 
                                   2234 ;---------------------
                                   2235 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2236 ; read in loop 'addr'  
                                   2237 ; apply & 'mask' to value 
                                   2238 ; loop while result==0.  
                                   2239 ; 'xor_mask' is used to 
                                   2240 ; invert the wait logic.
                                   2241 ; i.e. loop while not 0.
                                   2242 ;---------------------
                           000001  2243 	XMASK=1 
                           000002  2244 	MASK=2
                           000003  2245 	ADDR=3
                           000004  2246 	VSIZE=4
      001ACA                       2247 wait: 
      001ACA                       2248 	_vars VSIZE
      00999C 01 2A            [ 2]    1     sub sp,#VSIZE 
      00999E 11 1E            [ 1] 2249 	clr (XMASK,sp) 
      0099A0 05 E6 02         [ 4] 2250 	call arg_list 
      0099A3 C7 00            [ 1] 2251 	cp a,#2
      0099A5 0F 72            [ 1] 2252 	jruge 0$
      0099A7 5F 00 0E         [ 2] 2253 	jp syntax_error 
      0099AA 72 BB            [ 1] 2254 0$:	cp a,#3
      0099AC 00 0E            [ 1] 2255 	jrult 1$
      0099AE 20               [ 2] 2256 	popw x 
      0099AF E3               [ 1] 2257 	ld a,xl
      0099B0 6B 01            [ 1] 2258 	ld (XMASK,sp),a 
      0099B0 1E               [ 2] 2259 1$: popw x ; mask 
      0099B1 05               [ 1] 2260 	ld a,xl 
      0099B2 E6 02            [ 1] 2261 	ld (MASK,sp),a 
      0099B4 CD               [ 2] 2262 	popw x ; address 
      0099B5 9A               [ 1] 2263 2$:	ld a,(x)
      0099B6 24 1E            [ 1] 2264 	and a,(MASK,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      0099B8 05 E6            [ 1] 2265 	xor a,(XMASK,sp)
      0099BA 02 C7            [ 1] 2266 	jreq 2$ 
      001AEC                       2267 	_drop VSIZE 
      0099BC 00 0F            [ 2]    1     addw sp,#VSIZE 
      0099BE 72               [ 4] 2268 	ret 
                                   2269 
                                   2270 ;---------------------
                                   2271 ; BASIC: BSET addr,mask
                                   2272 ; set bits at 'addr' corresponding 
                                   2273 ; to those of 'mask' that are at 1.
                                   2274 ; arguments:
                                   2275 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2276 ;   mask        mask|addr
                                   2277 ; output:
                                   2278 ;	none 
                                   2279 ;--------------------------
      001AEF                       2280 bit_set:
      0099BF 5F 00 0E         [ 4] 2281 	call arg_list 
      0099C2 72 BB            [ 1] 2282 	cp a,#2	 
      0099C4 00 0E            [ 1] 2283 	jreq 1$ 
      0099C6 C3 00 1D         [ 2] 2284 	jp syntax_error
      001AF9                       2285 1$: 
      0099C9 2A               [ 2] 2286 	popw x ; mask 
      0099CA 07               [ 1] 2287 	ld a,xl 
      0099CB 1F               [ 2] 2288 	popw x ; addr  
      0099CC 05               [ 1] 2289 	or a,(x)
      0099CD FE               [ 1] 2290 	ld (x),a
      0099CE 13               [ 4] 2291 	ret 
                                   2292 
                                   2293 ;---------------------
                                   2294 ; BASIC: BRES addr,mask
                                   2295 ; reset bits at 'addr' corresponding 
                                   2296 ; to those of 'mask' that are at 1.
                                   2297 ; arguments:
                                   2298 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2299 ;   mask	    ~mask&*addr  
                                   2300 ; output:
                                   2301 ;	none 
                                   2302 ;--------------------------
      001AFF                       2303 bit_reset:
      0099CF 03 2F DE         [ 4] 2304 	call arg_list 
      0099D2 A1 02            [ 1] 2305 	cp a,#2  
      0099D2 55 00            [ 1] 2306 	jreq 1$ 
      0099D4 04 00 02         [ 2] 2307 	jp syntax_error
      001B09                       2308 1$: 
      0099D7 AE               [ 2] 2309 	popw x ; mask 
      0099D8 16               [ 1] 2310 	ld a,xl 
      0099D9 E0               [ 1] 2311 	cpl a 
      0099DA CF               [ 2] 2312 	popw x ; addr  
      0099DB 00               [ 1] 2313 	and a,(x)
      0099DC 05               [ 1] 2314 	ld (x),a 
      0099DD 5B               [ 4] 2315 	ret 
                                   2316 
                                   2317 ;---------------------
                                   2318 ; BASIC: BTOGL addr,mask
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



                                   2319 ; toggle bits at 'addr' corresponding 
                                   2320 ; to those of 'mask' that are at 1.
                                   2321 ; arguments:
                                   2322 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2323 ;   mask	    mask^*addr  
                                   2324 ; output:
                                   2325 ;	none 
                                   2326 ;--------------------------
      001B10                       2327 bit_toggle:
      0099DE 06 81 35         [ 4] 2328 	call arg_list 
      0099E0 A1 02            [ 1] 2329 	cp a,#2 
      0099E0 CD A0            [ 1] 2330 	jreq 1$ 
      0099E2 BA 27 07         [ 2] 2331 	jp syntax_error
      0099E5 AE               [ 2] 2332 1$: popw x ; mask 
      0099E6 9A               [ 1] 2333 	ld a,xl 
      0099E7 0D               [ 2] 2334 	popw x ; addr  
      0099E8 CD               [ 1] 2335 	xor a,(x)
      0099E9 83               [ 1] 2336 	ld (x),a 
      0099EA CE               [ 4] 2337 	ret 
                                   2338 
                                   2339 
                                   2340 ;---------------------
                                   2341 ; BASIC: BTEST(addr,bit)
                                   2342 ; return bit value at 'addr' 
                                   2343 ; bit is in range {0..7}.
                                   2344 ; arguments:
                                   2345 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2346 ;   bit 	    bit position {0..7}  
                                   2347 ; output:
                                   2348 ;	none 
                                   2349 ;--------------------------
      001B20                       2350 bit_test:
      0099EB 81 16 30         [ 4] 2351 	call func_args 
      0099EC A1 02            [ 1] 2352 	cp a,#2
      0099EC 90 AE            [ 1] 2353 	jreq 0$
      0099EE AC 80 CE         [ 2] 2354 	jp syntax_error
      001B2A                       2355 0$:	
      0099F1 AC               [ 2] 2356 	popw x 
      0099F2 82               [ 1] 2357 	ld a,xl 
      0099F3 1C 00            [ 1] 2358 	and a,#7
      0099F5 04               [ 1] 2359 	push a   
      0099F6 CF 00            [ 1] 2360 	ld a,#1 
      0099F8 0E AE            [ 1] 2361 1$: tnz (1,sp)
      0099FA 00 7C            [ 1] 2362 	jreq 2$
      0099FC CD               [ 1] 2363 	sll a 
      0099FD 8E B8            [ 1] 2364 	dec (1,sp)
      0099FF AE 00            [ 2] 2365 	jra 1$
      001B3A                       2366 2$: _drop 1 
      009A01 80 CF            [ 2]    1     addw sp,#1 
      009A03 00               [ 2] 2367 	popw x 
      009A04 1B               [ 1] 2368 	and a,(x)
      009A05 72 BB            [ 1] 2369 	jreq 3$
      009A07 00 7E            [ 1] 2370 	ld a,#1 
      009A09 CF               [ 1] 2371 3$:	clrw x 
      009A0A 00               [ 1] 2372 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      009A0B 1D 81            [ 1] 2373 	ld a,#TK_INTGR
      009A0D 4E               [ 4] 2374 	ret
                                   2375 
                                   2376 
                                   2377 ;--------------------
                                   2378 ; BASIC: POKE addr,byte
                                   2379 ; put a byte at addr 
                                   2380 ;--------------------
      001B47                       2381 poke:
      009A0E 6F 20 61         [ 4] 2382 	call arg_list 
      009A11 70 70            [ 1] 2383 	cp a,#2
      009A13 6C 69            [ 1] 2384 	jreq 1$
      009A15 63 61 74         [ 2] 2385 	jp syntax_error
      001B51                       2386 1$:	
      009A18 69               [ 2] 2387 	popw x  
      009A19 6F               [ 1] 2388     ld a,xl 
      009A1A 6E               [ 2] 2389 	popw x 
      009A1B 20               [ 1] 2390 	ld (x),a 
      009A1C 73               [ 4] 2391 	ret 
                                   2392 
                                   2393 ;-----------------------
                                   2394 ; BASIC: PEEK(addr)
                                   2395 ; get the byte at addr 
                                   2396 ; input:
                                   2397 ;	none 
                                   2398 ; output:
                                   2399 ;	X 		value 
                                   2400 ;-----------------------
      001B56                       2401 peek:
      009A1D 61 76 65         [ 4] 2402 	call func_args
      009A20 64 2E            [ 1] 2403 	cp a,#1 
      009A22 0A 00            [ 1] 2404 	jreq 1$
      009A24 CC 11 91         [ 2] 2405 	jp syntax_error
      009A24 C7               [ 2] 2406 1$: popw x 
      009A25 00               [ 1] 2407 	ld a,(x)
      009A26 04               [ 1] 2408 	clrw x 
      009A27 E6               [ 1] 2409 	ld xl,a 
      009A28 02 C1            [ 1] 2410 	ld a,#TK_INTGR
      009A2A 00               [ 4] 2411 	ret 
                                   2412 
                                   2413 ;---------------------------
                                   2414 ; BASIC IF expr : instructions
                                   2415 ; evaluate expr and if true 
                                   2416 ; execute instructions on same line. 
                                   2417 ;----------------------------
      001B67                       2418 if: 
      009A2B 04 2A 03         [ 4] 2419 	call relation 
      009A2E C7 00            [ 1] 2420 	cp a,#TK_INTGR
      009A30 04 CF            [ 1] 2421 	jreq 1$ 
      009A32 00 05 90         [ 2] 2422 	jp syntax_error
      009A35 AE               [ 1] 2423 1$:	clr a 
      009A36 16               [ 2] 2424 	tnzw x 
      009A37 90 CD            [ 1] 2425 	jrne 9$  
                                   2426 ;skip to next line
      009A39 8C 11 CD 83 CE   [ 1] 2427 	mov in,count
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      009A3E A6               [ 4] 2428 9$:	ret 
                                   2429 
                                   2430 ;------------------------
                                   2431 ; BASIC: FOR var=expr 
                                   2432 ; set variable to expression 
                                   2433 ; leave variable address 
                                   2434 ; on stack and set
                                   2435 ; FLOOP bit in 'flags'
                                   2436 ;-----------------
                           000001  2437 	RETL1=1 ; return address  
                           000003  2438 	FSTEP=3  ; variable increment
                           000005  2439 	LIMIT=5 ; loop limit 
                           000007  2440 	CVAR=7   ; control variable 
                           000009  2441 	INW=9   ;  in.w saved
                           00000B  2442 	BPTR=11 ; baseptr saved
                           00000A  2443 	VSIZE=10  
      001B7B                       2444 for: ; { -- var_addr }
      009A3F 0D               [ 2] 2445 	popw x ; call return address 
      001B7C                       2446 	_vars VSIZE 
      009A40 CD 83            [ 2]    1     sub sp,#VSIZE 
      009A42 71               [ 2] 2447 	pushw x  ; RETL1 
      009A43 81 85            [ 1] 2448 	ld a,#TK_VAR 
      009A44 CD 16 23         [ 4] 2449 	call expect
      009A44 52 01            [ 2] 2450 	ldw (CVAR,sp),x  ; control variable 
      009A46 CD 18 A9         [ 4] 2451 	call let_var 
      009A46 0F 01 00 21      [ 1] 2452 	bset flags,#FLOOP 
                                   2453 ; open space on stack for loop data 
      009A48 5F               [ 1] 2454 	clrw x 
      009A48 CD 93            [ 2] 2455 	ldw (BPTR,sp),x 
      009A4A 09 A1            [ 2] 2456 	ldw (INW,sp),x 
      009A4C 02 25 4F         [ 4] 2457 	call next_token 
      009A4F A1 02            [ 1] 2458 	cp a,#TK_CMD 
      009A51 27 12            [ 1] 2459 	jreq 1$
      009A53 A1 03 27         [ 2] 2460 	jp syntax_error
      001B9C                       2461 1$:  
      009A56 13 A1 82         [ 2] 2462 	cpw x,#to 
      009A59 27 15            [ 1] 2463 	jreq to
      009A5B A1 09 27         [ 2] 2464 	jp syntax_error 
                                   2465 
                                   2466 ;-----------------------------------
                                   2467 ; BASIC: TO expr 
                                   2468 ; second part of FOR loop initilization
                                   2469 ; leave limit on stack and set 
                                   2470 ; FTO bit in 'flags'
                                   2471 ;-----------------------------------
      001BA4                       2472 to: ; { var_addr -- var_addr limit step }
      009A5E 18 A1 0A 27 18   [ 2] 2473 	btjt flags,#FLOOP,1$
      009A63 20 28 91         [ 2] 2474 	jp syntax_error
      009A65 CD 17 7D         [ 4] 2475 1$: call relation  
      009A65 CD 83            [ 1] 2476 	cp a,#TK_INTGR 
      009A67 CE 20            [ 1] 2477 	jreq 2$ 
      009A69 DC 11 91         [ 2] 2478 	jp syntax_error
      009A6A 1F 05            [ 2] 2479 2$: ldw (LIMIT,sp),x
                                   2480 ;	ldw x,in.w 
      009A6A 9F CD 83         [ 4] 2481 	call next_token
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      009A6D 71 20            [ 1] 2482 	cp a,#TK_NONE  
      009A6F D6 0E            [ 1] 2483 	jreq 4$ 
      009A70 A1 80            [ 1] 2484 	cp a,#TK_CMD
      009A70 FD 9F            [ 1] 2485 	jrne 3$
      009A72 CD 83 71         [ 2] 2486 	cpw x,#step 
      009A75 20 CF            [ 1] 2487 	jreq step
      009A77                       2488 3$:	
      001BC8                       2489 	_unget_token   	 
      009A77 03 01 20 CD 01   [ 1]    1      mov in,in.saved  
      009A7B                       2490 4$:	
      009A7B CD 93 09         [ 2] 2491 	ldw x,#1   ; default step  
      009A7E A1 84            [ 2] 2492 	ldw (FSTEP,sp),x 
      009A80 27 03            [ 2] 2493 	jra store_loop_addr 
                                   2494 
                                   2495 
                                   2496 ;----------------------------------
                                   2497 ; BASIC: STEP expr 
                                   2498 ; optional third par of FOR loop
                                   2499 ; initialization. 	
                                   2500 ;------------------------------------
      001BD4                       2501 step: ; {var limit -- var limit step}
      009A82 CC 92 11 21 03   [ 2] 2502 	btjt flags,#FLOOP,1$
      009A85 CC 11 91         [ 2] 2503 	jp syntax_error
      009A85 9F A4 0F         [ 4] 2504 1$: call relation
      009A88 C7 00            [ 1] 2505 	cp a,#TK_INTGR
      009A8A 23 20            [ 1] 2506 	jreq 2$
      009A8C B9 11 91         [ 2] 2507 	jp syntax_error
      009A8D 1F 03            [ 2] 2508 2$:	ldw (FSTEP,sp),x ; step
                                   2509 ; leave loop back entry point on cstack 
                                   2510 ; cstack is 1 call deep from interpreter
      001BE8                       2511 store_loop_addr:
      009A8D 55 00 03         [ 2] 2512 	ldw x,basicptr  
      009A90 00 02            [ 2] 2513 	ldw (BPTR,sp),x 
      009A92 CD 97 FD         [ 2] 2514 	ldw x,in.w 
      009A95 A1 84            [ 2] 2515 	ldw (INW,sp),x   
      009A97 26 05 CD 93      [ 1] 2516 	bres flags,#FLOOP 
      009A9B 57 20 A8 1E      [ 1] 2517 	inc loop_depth  
      009A9E 81               [ 4] 2518 	ret 
                                   2519 
                                   2520 ;--------------------------------
                                   2521 ; BASIC: NEXT var 
                                   2522 ; FOR loop control 
                                   2523 ; increment variable with step 
                                   2524 ; and compare with limit 
                                   2525 ; loop if threshold not crossed.
                                   2526 ; else stack. 
                                   2527 ; and decrement 'loop_depth' 
                                   2528 ;--------------------------------
      001BFB                       2529 next: ; {var limit step retl1 -- [var limit step ] }
      009A9E 0D 01 26 05      [ 1] 2530 	tnz loop_depth 
      009AA2 A6 0D            [ 1] 2531 	jrne 1$ 
      009AA4 CD 83 71         [ 2] 2532 	jp syntax_error 
      001C04                       2533 1$: 
      009AA7 5B 01            [ 1] 2534 	ld a,#TK_VAR 
      009AA9 81 16 23         [ 4] 2535 	call expect
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



                                   2536 ; check for good variable after NEXT 	 
      009AAA 13 07            [ 2] 2537 	cpw x,(CVAR,sp)
      009AAA CE 00            [ 1] 2538 	jreq 2$  
      009AAC 05 1F 03         [ 2] 2539 	jp syntax_error ; not the good one 
      001C10                       2540 2$: ; increment variable 
      009AAF C6               [ 2] 2541 	ldw x,(x)  ; get var value 
      009AB0 00 02 6B         [ 2] 2542 	addw x,(FSTEP,sp) ; var+step 
      009AB3 05 C6            [ 2] 2543 	ldw y,(CVAR,sp)
      009AB5 00 04            [ 2] 2544 	ldw (y),x ; save var new value 
                                   2545 ; check sign of STEP  
      009AB7 6B 06            [ 1] 2546 	ld a,#0x80
      009AB9 81 03            [ 1] 2547 	bcp a,(FSTEP,sp)
      009ABA 2A 06            [ 1] 2548 	jrpl 4$
                                   2549 ;negative step 
      009ABA 1E 03            [ 2] 2550 	cpw x,(LIMIT,sp)
      009ABC CF 00            [ 1] 2551 	jrslt loop_done
      009ABE 05 7B            [ 2] 2552 	jra loop_back 
      001C24                       2553 4$: ; positive step
      009AC0 05 C7            [ 2] 2554 	cpw x,(LIMIT,sp)
      009AC2 00 02            [ 1] 2555 	jrsgt loop_done
      001C28                       2556 loop_back:
      009AC4 7B 06            [ 2] 2557 	ldw x,(BPTR,sp)
      009AC6 C7 00 04         [ 2] 2558 	ldw basicptr,x 
      009AC9 81 01 00 21 05   [ 2] 2559 	btjf flags,#FRUN,1$ 
      009ACA E6 02            [ 1] 2560 	ld a,(2,x)
      009ACA 52 07 03         [ 1] 2561 	ld count,a
      009ACC 1E 09            [ 2] 2562 1$:	ldw x,(INW,sp)
      009ACC 0F 05 CD         [ 2] 2563 	ldw in.w,x 
      009ACF 93               [ 4] 2564 	ret 
      001C3D                       2565 loop_done:
                                   2566 	; remove loop data from stack  
      009AD0 09               [ 2] 2567 	popw x
      001C3E                       2568 	_drop VSIZE 
      009AD1 A1 02            [ 2]    1     addw sp,#VSIZE 
      009AD3 26 08 CD 83      [ 1] 2569 	dec loop_depth 
                                   2570 ;	pushw x 
                                   2571 ;	ret 
      009AD7 CE               [ 2] 2572 	jp (x)
                                   2573 
                                   2574 ;----------------------------
                                   2575 ; called by goto/gosub
                                   2576 ; to get target line number 
                                   2577 ;---------------------------
      001C45                       2578 get_target_line:
      009AD8 03 05 CD         [ 4] 2579 	call next_token  
      009ADB 93 09            [ 1] 2580 	cp a,#TK_INTGR
      009ADD A1 85            [ 1] 2581 	jreq get_target_line_2 
      009ADF 27 03            [ 1] 2582 	cp a,#TK_LABEL 
      009AE1 CC 92            [ 1] 2583 	jreq look_target_symbol 
      009AE3 11 1F 06         [ 2] 2584 	jp syntax_error
      001C53                       2585 get_target_line_2:
      009AE6 0D               [ 1] 2586 	clr a
      009AE7 05 26 06 CD      [ 2] 2587 	ldw y,basicptr 
      009AEB 8B E8            [ 2] 2588 	ldw y,(y)
      009AED CD 83            [ 2] 2589 	pushw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      009AEF 71 01            [ 2] 2590 	cpw x,(1,sp)
      009AF0 5B 02            [ 2] 2591 	addw sp,#2 
      009AF0 A6 3A            [ 1] 2592 	jrult 11$
      009AF2 CD               [ 1] 2593 	inc a 
      001C63                       2594 11$:	
      009AF3 83 71 CD         [ 4] 2595 	call search_lineno  
      009AF6 9A               [ 2] 2596 	tnzw x 
      009AF7 AA 72            [ 1] 2597 	jrne 2$ 
      009AF9 5F 00            [ 1] 2598 	ld a,#ERR_NO_LINE 
      009AFB 04 CD 84         [ 2] 2599 	jp tb_error 
      009AFE D3               [ 4] 2600 2$:	ret 
                                   2601 
                                   2602 ; the GOTO|GOSUB target is a symbol.
      001C6F                       2603 look_target_symbol:
      009AFF AE 16 90 3B      [ 1] 2604 	clr acc16 
      009B03 00 04 4B 00      [ 2] 2605 	ldw y,txtbgn 
      009B07 72 FB 01         [ 1] 2606 1$:	ld a,(3,y) ; first TK_ID on line 
      009B0A 5C 5B            [ 1] 2607 	cp a,#TK_LABEL 
      009B0C 02 72            [ 1] 2608 	jreq 3$ 
      009B0E 5F 00 02         [ 1] 2609 2$:	ld a,(2,y); line length 
      009B11 CD 89 37         [ 1] 2610 	ld acc8,a 
      009B14 A1 84 27 10      [ 2] 2611 	addw y,acc16 ;point to next line 
      009B18 A1 11 CD 89      [ 2] 2612 	cpw y,txtend 
      009B1C 37 A1            [ 1] 2613 	jrult 1$
      009B1E 84 27            [ 1] 2614 	ld a,#ERR_BAD_VALUE
      009B20 06 CD 9A         [ 2] 2615 	jp tb_error 
      001C93                       2616 3$: ; found a TK_LABEL 
                                   2617 	; compare with GOTO|GOSUB target 
      009B23 BA CC            [ 2] 2618 	pushw y 
      009B25 92 11 00 04      [ 2] 2619 	addw y,#4 ; label string 
      009B27 CE 00 04         [ 2] 2620 	ldw x,basicptr 
      009B27 50 16 06 90      [ 2] 2621 	addw x,in.w 
      009B2B FF CD 9A         [ 4] 2622 	call strcmp
      009B2E BA CD            [ 1] 2623 	jrne 4$
      009B30 93 09            [ 2] 2624 	popw y 
      009B32 A1 09            [ 2] 2625 	jra 2$ 
      001CA9                       2626 4$: ; target found 
      009B34 27 96 A1         [ 4] 2627 	call skip_label 
      009B37 00               [ 2] 2628 	popw x 
      009B38 27               [ 4] 2629 	ret
                                   2630 
                                   2631 ;--------------------------------
                                   2632 ;  skip label string in BASIC 
                                   2633 ;  text.
                                   2634 ;-------------------------------
      001CAE                       2635 skip_label:
      009B39 07 A1 0B         [ 2] 2636 	ldw x,basicptr 
      009B3C 27 03 CC 92      [ 4] 2637 1$:	ld a,([in.w],x)
      009B40 11 5C 00 01      [ 1] 2638 	inc in 
      009B41 4D               [ 1] 2639 	tnz a 
      009B41 5B 07            [ 1] 2640 	jrne 1$
      009B43 81               [ 4] 2641 	ret 
                                   2642 
                                   2643 
                                   2644 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



                                   2645 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2646 ; selective goto or gosub 
                                   2647 ;--------------------------------
                           000003  2648 	RET_ADDR=3
                           000005  2649 	RET_INW=5
                           000004  2650 	VSIZE=4  
      009B44                       2651 cmd_on:
      009B44 55 00 04 00 02   [ 2] 2652 	btjt flags,#FRUN,0$ 
      009B49 81 06            [ 1] 2653 	ld a,#ERR_RUN_ONLY
      009B4A CC 11 93         [ 2] 2654 	jp tb_error 
      009B4A 52 04 0F         [ 4] 2655 0$:	call expression 
      009B4D 01 CD            [ 1] 2656 	cp a,#TK_INTGR
      009B4F 96 B5            [ 1] 2657 	jreq 1$
      009B51 A1 02 24         [ 2] 2658 	jp syntax_error
      009B54 03 CC 92         [ 2] 2659 1$: cpw x,#1 
      009B57 11 A1            [ 1] 2660 	jrslt 9$
      009B59 03 25 04         [ 2] 2661 	cpw x,#16 ; no more than 16 arguments 
      009B5C 85 9F            [ 1] 2662 	jrugt 9$
      009B5E 6B               [ 1] 2663 	ld a,xl 
      009B5F 01               [ 1] 2664 	push a  ; selector  
      009B60 85 9F 6B         [ 4] 2665 	call next_token ; should be GOTO|GOSUB 
      009B63 02 85            [ 1] 2666 	cp a,#TK_CMD 
      009B65 F6 14            [ 1] 2667 	jreq 2$ 
      009B67 02 18 01         [ 2] 2668 	jp syntax_error 
      009B6A 27 F9 5B         [ 2] 2669 2$: cpw x,#goto 
      009B6D 04 81            [ 1] 2670 	jreq 4$
      009B6F A3 1D 60         [ 2] 2671 	cpw x,#gosub 
      009B6F CD 96            [ 1] 2672 	jreq 4$ 
      009B71 B5 A1 02         [ 2] 2673 	jp syntax_error 
      009B74 27               [ 1] 2674 4$: pop a 
      009B75 03               [ 2] 2675 	pushw x ; save routine address 	
      009B76 CC               [ 1] 2676 	push a  ; -- code_addr selector  
      009B77 92 11 89         [ 4] 2677 5$: call next_token 
      009B79 A1 84            [ 1] 2678 	cp a,#TK_INTGR 
      009B79 85 9F            [ 1] 2679 	jreq 52$
      009B7B 85 FA F7         [ 2] 2680 	jp syntax_error 
      001D01                       2681 52$: ; got a line number 
      009B7E 81 01            [ 1] 2682 	dec (1,sp) ; decrement selector 
      009B7F 27 0B            [ 1] 2683 	jreq 58$ ; this is the selected one 
      009B7F CD 96 B5         [ 4] 2684 	call next_token ; try for the next one 
      009B82 A1 02            [ 1] 2685 	cp a,#TK_COMMA 
      009B84 27 03            [ 1] 2686 	jreq 5$ 
                                   2687 ; arg list exhausted, selector to big 
                                   2688 ; continue execution on next line 
      001D0C                       2689 	_drop 3 ; drop selector and GOTO|GOSUB address 
      009B86 CC 92            [ 2]    1     addw sp,#3 
      009B88 11 2F            [ 2] 2690 	jra 9$
      009B89                       2691 58$: ;found line# in list 
      001D10                       2692 	_drop 1 ; discard selector 
      009B89 85 9F            [ 2]    1     addw sp,#1 
      009B8B 43 85 F4 F7 81   [ 1] 2693 	mov in,count ; skip to end of this line. 
                                   2694 ; here only the routine address of GOTO|GOSUB is on stack 
                                   2695 ;   X contain target line number 
      009B90 CD 1C 53         [ 4] 2696 8$:	call get_target_line_2
      009B90 CD 96            [ 2] 2697 	popw y ; routine address GOTO|GOSUB  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      009B92 B5 A1 02 27      [ 2] 2698 	cpw y,#goto 
      009B96 03 CC            [ 1] 2699 	jreq jp_to_target 
      009B98 92 11            [ 2] 2700 	popw y 
      001D24                       2701 	_vars VSIZE 
      009B9A 85 9F            [ 2]    1     sub sp,#VSIZE 
      009B9C 85 F8            [ 2] 2702 	pushw y 
      009B9E F7 81 00 04      [ 2] 2703 	ldw y,basicptr 
      009BA0 55 00 03 00 01   [ 1] 2704 	mov in,count 
      009BA0 CD 96 B0 A1      [ 2] 2705 	addw y,in.w 
      009BA4 02 27            [ 2] 2706 	ldw (RET_ADDR,sp),y 
      009BA6 03 CC 92 11      [ 2] 2707 	ldw y,#3 
      009BAA 17 05            [ 2] 2708 	ldw (RET_INW,sp),y
      009BAA 85 9F            [ 2] 2709 	jra jp_to_target
      001D3F                       2710 9$: ; expr out of range skip to next line 
      009BAC A4 07 88 A6 01   [ 1] 2711 	mov in,count
      009BB1 0D               [ 1] 2712 	clr a  
      009BB2 01               [ 4] 2713 	ret 
                                   2714 
                                   2715 ;------------------------
                                   2716 ; BASIC: GOTO line# 
                                   2717 ; jump to line# 
                                   2718 ; here cstack is 2 call deep from interpreter 
                                   2719 ;------------------------
      001D46                       2720 goto:
      009BB3 27 05 48 0A 01   [ 2] 2721 	btjt flags,#FRUN,0$ 
      009BB8 20 F7            [ 1] 2722 	ld a,#ERR_RUN_ONLY
      009BBA 5B 01 85         [ 2] 2723 	jp tb_error 
      009BBD F4 27 02         [ 4] 2724 0$:	call get_target_line
      001D53                       2725 jp_to_target:
      009BC0 A6 01 5F         [ 2] 2726 	ldw basicptr,x 
      009BC3 97 A6            [ 1] 2727 	ld a,(2,x)
      009BC5 84 81 03         [ 1] 2728 	ld count,a 
      009BC7 35 03 00 01      [ 1] 2729 	mov in,#3 
      009BC7 CD               [ 4] 2730 	ret 
                                   2731 
                                   2732 
                                   2733 ;--------------------
                                   2734 ; BASIC: GOSUB line#
                                   2735 ; basic subroutine call
                                   2736 ; actual line# and basicptr 
                                   2737 ; are saved on cstack
                                   2738 ; here cstack is 2 call deep from interpreter 
                                   2739 ;--------------------
                           000003  2740 	RET_ADDR=3
                           000005  2741 	RET_INW=5
                           000004  2742 	VSIZE=4  
      001D60                       2743 gosub:
      009BC8 96 B5 A1 02 27   [ 2] 2744 	btjt flags,#FRUN,0$ 
      009BCD 03 CC            [ 1] 2745 	ld a,#ERR_RUN_ONLY
      009BCF 92 11 93         [ 2] 2746 	jp tb_error 
      009BD1 81               [ 4] 2747 	ret 
      009BD1 85               [ 2] 2748 0$:	popw x 
      001D6C                       2749 	_vars VSIZE  
      009BD2 9F 85            [ 2]    1     sub sp,#VSIZE 
      009BD4 F7               [ 2] 2750 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      009BD5 81 00 04         [ 2] 2751 	ldw x,basicptr
      009BD6 1F 03            [ 2] 2752 	ldw (RET_ADDR,sp),x 
      009BD6 CD 96 B0         [ 4] 2753 	call get_target_line  
      009BD9 A1               [ 2] 2754 	pushw x 
      009BDA 01 27 03         [ 2] 2755 	ldw x,in.w 
      009BDD CC 92            [ 2] 2756 	ldw (RET_INW+2,sp),x
      009BDF 11               [ 2] 2757 	popw x 
      009BE0 85 F6            [ 2] 2758 	jra jp_to_target
                                   2759 
                                   2760 ;------------------------
                                   2761 ; BASIC: RETURN 
                                   2762 ; exit from a subroutine 
                                   2763 ; 
                                   2764 ;------------------------
      001D80                       2765 return:
      009BE2 5F 97 A6 84 81   [ 2] 2766 	btjt flags,#FRUN,0$ 
      009BE7 A6 06            [ 1] 2767 	ld a,#ERR_RUN_ONLY
      009BE7 CD 97 FD         [ 2] 2768 	jp tb_error 
      001D8A                       2769 0$:	
      009BEA A1 84            [ 2] 2770 	ldw x,(RET_ADDR,sp) 
      009BEC 27 03 CC         [ 2] 2771 	ldw basicptr,x
      009BEF 92 11            [ 1] 2772 	ld a,(2,x)
      009BF1 4F 5D 26         [ 1] 2773 	ld count,a  
      009BF4 05 55            [ 2] 2774 	ldw x,(RET_INW,sp)
      009BF6 00 04 00         [ 2] 2775 	ldw in.w,x 
      009BF9 02               [ 2] 2776 	popw x 
      001D9A                       2777 	_drop VSIZE 
      009BFA 81 04            [ 2]    1     addw sp,#VSIZE 
      009BFB 89               [ 2] 2778 	pushw x
      009BFB 85               [ 4] 2779 	ret  
                                   2780 
                                   2781 
                                   2782 ;----------------------------------
                                   2783 ; BASIC: RUN
                                   2784 ; run BASIC program in RAM
                                   2785 ;----------------------------------- 
      001D9E                       2786 run: 
      009BFC 52 0A 89 A6 85   [ 2] 2787 	btjf flags,#FRUN,0$  
      009C01 CD               [ 1] 2788 	clr a 
      009C02 96               [ 4] 2789 	ret
      001DA5                       2790 0$: 
      009C03 A3 1F 07 CD 99   [ 2] 2791 	btjf flags,#FBREAK,1$
      001DAA                       2792 	_drop 2 
      009C08 29 72            [ 2]    1     addw sp,#2 
      009C0A 14 00 22         [ 4] 2793 	call rest_context
      001DAF                       2794 	_drop CTXT_SIZE 
      009C0D 5F 1F            [ 2]    1     addw sp,#CTXT_SIZE 
      009C0F 0B 1F 09 CD      [ 1] 2795 	bres flags,#FBREAK 
      009C13 93 09 A1 80      [ 1] 2796 	bset flags,#FRUN 
      009C17 27 03 CC         [ 2] 2797 	jp interpreter 
      009C1A 92 11 1A         [ 2] 2798 1$:	ldw x,txtbgn
      009C1C C3 00 1C         [ 2] 2799 	cpw x,txtend 
      009C1C A3 9C            [ 1] 2800 	jrmi run_it 
      009C1E 24 27 03         [ 2] 2801 	ldw x,#err_no_prog
      009C21 CC 92 11         [ 4] 2802 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      009C24 55 00 03 00 01   [ 1] 2803 	mov in,count
      009C24 72               [ 4] 2804 	ret 
      001DD0                       2805 run_it:	 
      009C25 04 00 22         [ 4] 2806     call ubound 
      001DD3                       2807 	_drop 2 ; drop return address 
      009C28 03 CC            [ 2]    1     addw sp,#2 
                                   2808 ; clear data pointer 
      009C2A 92               [ 1] 2809 	clrw x 
      009C2B 11 CD 97         [ 2] 2810 	ldw data_ptr,x 
      009C2E FD A1 84 27      [ 1] 2811 	clr data_ofs 
      009C32 03 CC 92 11      [ 1] 2812 	clr data_len 
                                   2813 ; initialize BASIC pointer 
      009C36 1F 05 CD         [ 2] 2814 	ldw x,txtbgn 
      009C39 93 09 A1         [ 2] 2815 	ldw basicptr,x 
      009C3C 00 27            [ 1] 2816 	ld a,(2,x)
      009C3E 0E A1 80         [ 1] 2817 	ld count,a
      009C41 26 05 A3 9C      [ 1] 2818 	mov in,#3	
      009C45 54 27 0C 21      [ 1] 2819 	bset flags,#FRUN 
      009C48 CC 12 34         [ 2] 2820 	jp interpreter 
                                   2821 
                                   2822 
                                   2823 ;----------------------
                                   2824 ; BASIC: END
                                   2825 ; end running program
                                   2826 ;---------------------- 
      001DF7                       2827 cmd_end: 
                                   2828 ; clean stack 
      009C48 55 00 03         [ 2] 2829 	ldw x,#STACK_EMPTY
      009C4B 00               [ 1] 2830 	ldw sp,x 
      009C4C 02 12 15         [ 2] 2831 	jp warm_start
                                   2832 
                                   2833 ;---------------------------
                                   2834 ; BASIC: GET var 
                                   2835 ; receive a key in variable 
                                   2836 ; don't wait 
                                   2837 ;---------------------------
      009C4D                       2838 cmd_get:
      009C4D AE 00 01         [ 4] 2839 	call next_token 
      009C50 1F 03            [ 1] 2840 	cp a,#TK_VAR 
      009C52 20 14            [ 1] 2841 	jreq 0$
      009C54 CC 11 91         [ 2] 2842 	jp syntax_error 
      009C54 72 04 00         [ 2] 2843 0$: ldw ptr16,x 
      009C57 22 03 CC         [ 4] 2844 	call qgetc 
      009C5A 92 11            [ 1] 2845 	jreq 2$
      009C5C CD 97 FD         [ 4] 2846 	call getc  
      009C5F A1 84 27 03      [ 4] 2847 2$: clr [ptr16]
      009C63 CC 92 11 1F      [ 1] 2848 	inc ptr8 
      009C67 03 C7 00 18      [ 4] 2849 	ld [ptr16],a 
      009C68 81               [ 4] 2850 	ret 
                                   2851 
                                   2852 
                                   2853 ;-----------------
                                   2854 ; 1 Khz beep 
                                   2855 ;-----------------
      001E20                       2856 beep_1khz:: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      009C68 CE 00 05         [ 2] 2857 	ldw x,#100
      009C6B 1F 0B CE 00      [ 2] 2858 	ldw y,#1000
      009C6F 01 1F            [ 2] 2859 	jra beep
                                   2860 
                                   2861 ;-----------------------
                                   2862 ; BASIC: TONE expr1,expr2
                                   2863 ; used TIMER2 channel 1
                                   2864 ; to produce a tone 
                                   2865 ; arguments:
                                   2866 ;    expr1   frequency 
                                   2867 ;    expr2   duration msec.
                                   2868 ;---------------------------
      001E29                       2869 tone:
      009C71 09 72 15         [ 4] 2870 	call arg_list 
      009C74 00 22            [ 1] 2871 	cp a,#2 
      009C76 72 5C            [ 1] 2872 	jreq 1$
      009C78 00 1F 81         [ 2] 2873 	jp syntax_error 
      009C7B                       2874 1$: 
      009C7B 72               [ 2] 2875 	popw x ; duration
      009C7C 5D 00            [ 2] 2876 	popw y ; frequency 
      001E36                       2877 beep:  
      009C7E 1F               [ 2] 2878 	pushw x 
      009C7F 26 03 CC         [ 2] 2879 	ldw x,#TIM2_CLK_FREQ
      009C82 92               [ 2] 2880 	divw x,y 
                                   2881 ; round to nearest integer 
      009C83 11 A3 7A 12      [ 2] 2882 	cpw y,#TIM2_CLK_FREQ/2
      009C84 2B 01            [ 1] 2883 	jrmi 2$
      009C84 A6               [ 1] 2884 	incw x 
      001E42                       2885 2$:	 
      009C85 85               [ 1] 2886 	ld a,xh 
      009C86 CD 96 A3         [ 1] 2887 	ld TIM2_ARRH,a 
      009C89 13               [ 1] 2888 	ld a,xl 
      009C8A 07 27 03         [ 1] 2889 	ld TIM2_ARRL,a 
                                   2890 ; 50% duty cycle 
      009C8D CC               [ 1] 2891 	ccf 
      009C8E 92               [ 2] 2892 	rrcw x 
      009C8F 11               [ 1] 2893 	ld a,xh 
      009C90 C7 53 0F         [ 1] 2894 	ld TIM2_CCR1H,a 
      009C90 FE               [ 1] 2895 	ld a,xl
      009C91 72 FB 03         [ 1] 2896 	ld TIM2_CCR1L,a
      009C94 16 07 90 FF      [ 1] 2897 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      009C98 A6 80 15 03      [ 1] 2898 	bset TIM2_CR1,#TIM2_CR1_CEN
      009C9C 2A 06 13 05      [ 1] 2899 	bset TIM2_EGR,#TIM2_EGR_UG
      009CA0 2F               [ 2] 2900 	popw x 
      009CA1 1B 20 04         [ 4] 2901 	call pause02
      009CA4 72 11 53 08      [ 1] 2902 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      009CA4 13 05 2C 15      [ 1] 2903 	bres TIM2_CR1,#TIM2_CR1_CEN 
      009CA8 81               [ 4] 2904 	ret 
                                   2905 
                                   2906 ;-------------------------------
                                   2907 ; BASIC: ADCON 0|1 [,divisor]  
                                   2908 ; disable/enanble ADC 
                                   2909 ;-------------------------------
                           000003  2910 	ONOFF=3 
                           000001  2911 	DIVSOR=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



                           000004  2912 	VSIZE=4 
      001E6D                       2913 power_adc:
      009CA8 1E 0B CF         [ 4] 2914 	call arg_list 
      009CAB 00 05            [ 1] 2915 	cp a,#2	
      009CAD 72 01            [ 1] 2916 	jreq 1$
      009CAF 00 22            [ 1] 2917 	cp a,#1 
      009CB1 05 E6            [ 1] 2918 	jreq 0$ 
      009CB3 02 C7 00         [ 2] 2919 	jp syntax_error 
      009CB6 04 1E 09         [ 2] 2920 0$: ldw x,#0
      009CB9 CF               [ 2] 2921 	pushw x  ; divisor 
      009CBA 00 01            [ 2] 2922 1$: ldw x,(ONOFF,sp)
      009CBC 81               [ 2] 2923 	tnzw x 
      009CBD 27 1A            [ 1] 2924 	jreq 2$ 
      009CBD 85 5B            [ 2] 2925 	ldw x,(DIVSOR,sp) ; divisor 
      009CBF 0A               [ 1] 2926 	ld a,xl
      009CC0 72 5A            [ 1] 2927 	and a,#7
      009CC2 00               [ 1] 2928 	swap a 
      009CC3 1F FC 01         [ 1] 2929 	ld ADC_CR1,a
      009CC5 72 16 50 CA      [ 1] 2930 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      009CC5 CD 93 09 A1      [ 1] 2931 	bset ADC_CR1,#ADC_CR1_ADON 
      001E95                       2932 	_usec_dly 7 
      009CC9 84 27 07         [ 2]    1     ldw x,#(16*7-2)/4
      009CCC A1               [ 2]    2     decw x
      009CCD 01               [ 1]    3     nop 
      009CCE 27 1F            [ 1]    4     jrne .-4
      009CD0 CC 92            [ 2] 2933 	jra 3$
      009CD2 11 11 54 01      [ 1] 2934 2$: bres ADC_CR1,#ADC_CR1_ADON
      009CD3 72 17 50 CA      [ 1] 2935 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      001EA6                       2936 3$:	_drop VSIZE 
      009CD3 4F 90            [ 2]    1     addw sp,#VSIZE 
      009CD5 CE               [ 4] 2937 	ret
                                   2938 
                                   2939 ;-----------------------------
                                   2940 ; BASIC: ADCREAD (channel)
                                   2941 ; read adc channel {0..5}
                                   2942 ; output:
                                   2943 ;   A 		TK_INTGR 
                                   2944 ;   X 		value 
                                   2945 ;-----------------------------
      001EA9                       2946 analog_read:
      009CD6 00 05 90         [ 4] 2947 	call func_args 
      009CD9 FE 90            [ 1] 2948 	cp a,#1 
      009CDB 89 13            [ 1] 2949 	jreq 1$
      009CDD 01 5B 02         [ 2] 2950 	jp syntax_error
      009CE0 25               [ 2] 2951 1$: popw x 
      009CE1 01 4C 05         [ 2] 2952 	cpw x,#5 
      009CE3 23 05            [ 2] 2953 	jrule 2$
      009CE3 CD 86            [ 1] 2954 	ld a,#ERR_BAD_VALUE
      009CE5 B6 5D 26         [ 2] 2955 	jp tb_error 
      009CE8 05               [ 1] 2956 2$: ld a,xl
      009CE9 A6 05 CC         [ 1] 2957 	ld acc8,a 
      009CEC 92 13            [ 1] 2958 	ld a,#5
      009CEE 81 00 0E         [ 1] 2959 	sub a,acc8 
      009CEF C7 54 00         [ 1] 2960 	ld ADC_CSR,a
      009CEF 72 5F 00 0E      [ 1] 2961 	bset ADC_CR2,#ADC_CR2_ALIGN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      009CF3 90 CE 00 1B      [ 1] 2962 	bset ADC_CR1,#ADC_CR1_ADON
      009CF7 90 E6 03 A1 01   [ 2] 2963 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009CFC 27 15 90         [ 2] 2964 	ldw x,ADC_DRH
      009CFF E6 02            [ 1] 2965 	ld a,#TK_INTGR
      009D01 C7               [ 4] 2966 	ret 
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
      001EDD                       2979 digital_read:
      001EDD                       2980 	_vars VSIZE 
      009D02 00 0F            [ 2]    1     sub sp,#VSIZE 
      009D04 72 B9 00         [ 4] 2981 	call func_args
      009D07 0E 90            [ 1] 2982 	cp a,#1
      009D09 C3 00            [ 1] 2983 	jreq 1$
      009D0B 1D 25 E9         [ 2] 2984 	jp syntax_error
      009D0E A6               [ 2] 2985 1$: popw x 
      009D0F 0A CC 92         [ 2] 2986 	cpw x,#15 
      009D12 13 05            [ 2] 2987 	jrule 2$
      009D13 A6 0A            [ 1] 2988 	ld a,#ERR_BAD_VALUE
      009D13 90 89 72         [ 2] 2989 	jp tb_error 
      009D16 A9 00 04         [ 4] 2990 2$:	call select_pin 
      009D19 CE 00            [ 1] 2991 	ld (PINNO,sp),a
      009D1B 05 72            [ 1] 2992 	ld a,(GPIO_IDR,x)
      009D1D BB 00            [ 1] 2993 	tnz (PINNO,sp)
      009D1F 01 CD            [ 1] 2994 	jreq 8$
      009D21 8E               [ 1] 2995 3$: srl a 
      009D22 97 26            [ 1] 2996 	dec (PINNO,sp)
      009D24 04 90            [ 1] 2997 	jrne 3$ 
      009D26 85 20            [ 1] 2998 8$: and a,#1 
      009D28 D5               [ 1] 2999 	clrw x 
      009D29 97               [ 1] 3000 	ld xl,a 
      009D29 CD 9D            [ 1] 3001 	ld a,#TK_INTGR
      001F0A                       3002 	_drop VSIZE
      009D2B 2E 85            [ 2]    1     addw sp,#VSIZE 
      009D2D 81               [ 4] 3003 	ret
                                   3004 
                                   3005 
                                   3006 ;-----------------------
                                   3007 ; BASIC: DWRITE pin,0|1
                                   3008 ; Arduino pins 
                                   3009 ; write to a digital pin 
                                   3010 ; pin# {0..15}
                                   3011 ; output:
                                   3012 ;    A 		TK_INTGR
                                   3013 ;    X      0|1 
                                   3014 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



                           000001  3015 	PINNO=1
                           000002  3016 	PINVAL=2
                           000002  3017 	VSIZE=2
      009D2E                       3018 digital_write:
      001F0D                       3019 	_vars VSIZE 
      009D2E CE 00            [ 2]    1     sub sp,#VSIZE 
      009D30 05 72 D6         [ 4] 3020 	call arg_list  
      009D33 00 01            [ 1] 3021 	cp a,#2 
      009D35 72 5C            [ 1] 3022 	jreq 1$
      009D37 00 02 4D         [ 2] 3023 	jp syntax_error
      009D3A 26               [ 2] 3024 1$: popw x 
      009D3B F5               [ 1] 3025 	ld a,xl 
      009D3C 81 02            [ 1] 3026 	ld (PINVAL,sp),a
      009D3D 85               [ 2] 3027 	popw x 
      009D3D 72 00 00         [ 2] 3028 	cpw x,#15 
      009D40 22 05            [ 2] 3029 	jrule 2$
      009D42 A6 06            [ 1] 3030 	ld a,#ERR_BAD_VALUE
      009D44 CC 92 13         [ 2] 3031 	jp tb_error 
      009D47 CD 97 B4         [ 4] 3032 2$:	call select_pin 
      009D4A A1 84            [ 1] 3033 	ld (PINNO,sp),a 
      009D4C 27 03            [ 1] 3034 	ld a,#1
      009D4E CC 92            [ 1] 3035 	tnz (PINNO,sp)
      009D50 11 A3            [ 1] 3036 	jreq 4$
      009D52 00               [ 1] 3037 3$: sll a
      009D53 01 2F            [ 1] 3038 	dec (PINNO,sp)
      009D55 69 A3            [ 1] 3039 	jrne 3$
      009D57 00 10            [ 1] 3040 4$: tnz (PINVAL,sp)
      009D59 22 64            [ 1] 3041 	jrne 5$
      009D5B 9F               [ 1] 3042 	cpl a 
      009D5C 88 CD            [ 1] 3043 	and a,(GPIO_ODR,x)
      009D5E 93 09            [ 2] 3044 	jra 8$
      009D60 A1 80            [ 1] 3045 5$: or a,(GPIO_ODR,x)
      009D62 27 03            [ 1] 3046 8$: ld (GPIO_ODR,x),a 
      001F45                       3047 	_drop VSIZE 
      009D64 CC 92            [ 2]    1     addw sp,#VSIZE 
      009D66 11               [ 4] 3048 	ret
                                   3049 
                                   3050 
                                   3051 ;-----------------------
                                   3052 ; BASIC: STOP
                                   3053 ; stop progam execution  
                                   3054 ; without resetting pointers 
                                   3055 ; the program is resumed
                                   3056 ; with RUN 
                                   3057 ;-------------------------
      001F48                       3058 stop:
      009D67 A3 9D C6 27 08   [ 2] 3059 	btjt flags,#FRUN,2$
      009D6C A3               [ 1] 3060 	clr a
      009D6D 9D               [ 4] 3061 	ret 
      001F4F                       3062 2$:	 
                                   3063 ; create space on cstack to save context 
      009D6E E0 27 03         [ 2] 3064 	ldw x,#break_point 
      009D71 CC 92 11         [ 4] 3065 	call puts 
      001F55                       3066 	_drop 2 ;drop return address 
      009D74 84 89            [ 2]    1     addw sp,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      001F57                       3067 	_vars CTXT_SIZE ; context size 
      009D76 88 CD            [ 2]    1     sub sp,#CTXT_SIZE 
      009D78 93 09 A1         [ 4] 3068 	call save_context 
      009D7B 84 27 03         [ 2] 3069 	ldw x,#tib 
      009D7E CC 92 11         [ 2] 3070 	ldw basicptr,x
      009D81 7F               [ 1] 3071 	clr (x)
      009D81 0A 01 27 0B      [ 1] 3072 	clr count  
      009D85 CD               [ 1] 3073 	clrw x 
      009D86 93 09 A1         [ 2] 3074 	ldw in.w,x
      009D89 09 27 EB 5B      [ 1] 3075 	bres flags,#FRUN 
      009D8D 03 20 2F 21      [ 1] 3076 	bset flags,#FBREAK
      009D90 CC 12 34         [ 2] 3077 	jp interpreter 
      009D90 5B 01 55 00 04 00 02  3078 break_point: .asciz "\nbreak point, RUN to resume.\n"
             CD 9C D3 90 85 90 A3
             9D C6 27 31 90 85 52
             04 90 89 90 CE 00 05
             55 00
                                   3079 
                                   3080 ;-----------------------
                                   3081 ; BASIC: NEW
                                   3082 ; from command line only 
                                   3083 ; free program memory
                                   3084 ; and clear variables 
                                   3085 ;------------------------
      001F94                       3086 new: 
      009DAE 04 00 02 72 B9   [ 2] 3087 	btjf flags,#FRUN,0$ 
      009DB3 00               [ 4] 3088 	ret 
      001F9A                       3089 0$:	
      009DB4 01 17 03         [ 4] 3090 	call clear_basic 
      009DB7 90               [ 4] 3091 	ret 
                                   3092 
                                   3093 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3094 ;;;  flash memory operations
                                   3095 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3096 
                                   3097 ;--------------------------
                                   3098 ; align farptr to BLOCK_SIZE 
                                   3099 ;---------------------------
      001F9E                       3100 row_align:
      009DB8 AE 00            [ 1] 3101 	ld a,#0x7f 
      009DBA 03 17 05         [ 1] 3102 	and a,farptr+2 
      009DBD 20 14            [ 1] 3103 	jreq 1$ 
      009DBF CE 00 18         [ 2] 3104 	ldw x,farptr+1 
      009DBF 55 00 04         [ 2] 3105 	addw x,#BLOCK_SIZE 
      009DC2 00 02            [ 1] 3106 	jrnc 0$
      009DC4 4F 81 00 17      [ 1] 3107 	inc farptr 
      009DC6 9F               [ 1] 3108 0$: ld a,xl 
      009DC6 72 00            [ 1] 3109 	and a,#0x80
      009DC8 00               [ 1] 3110 	ld xl,a
      009DC9 22 05 A6         [ 2] 3111 	ldw farptr+1,x  	
      009DCC 06               [ 4] 3112 1$:	ret
                                   3113 
                                   3114 ;--------------------
                                   3115 ; input:
                                   3116 ;   X     increment 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



                                   3117 ; output:
                                   3118 ;   farptr  incremented 
                                   3119 ;---------------------
      001FB9                       3120 incr_farptr:
      009DCD CC 92 13 CD      [ 2] 3121 	addw x,farptr+1 
      009DD1 9C C5            [ 1] 3122 	jrnc 1$
      009DD3 72 5C 00 17      [ 1] 3123 	inc farptr 
      009DD3 CF 00 05         [ 2] 3124 1$:	ldw farptr+1,x  
      009DD6 E6               [ 4] 3125 	ret 
                                   3126 
                                   3127 ;-----------------------------------
                                   3128 ; scan block for non zero byte 
                                   3129 ; block are 128 bytes 
                                   3130 ; input:
                                   3131 ;    farptr     address block  
                                   3132 ; output:
                                   3133 ;     A     0 cleared, other not cleared  
                                   3134 ;-----------------------------------
      001FC7                       3135 scan_block:
      009DD7 02               [ 1] 3136 	clrw x 
      009DD8 C7 00 04 35      [ 5] 3137 1$: ldf a,([farptr],x) 
      009DDC 03 00            [ 1] 3138 	jrne 2$
      009DDE 02               [ 1] 3139 	incw x 
      009DDF 81 00 80         [ 2] 3140 	cpw x,#BLOCK_SIZE 
      009DE0 25 F4            [ 1] 3141 	jrult 1$ 
      009DE0 72               [ 4] 3142 2$:	ret 
                                   3143 
                                   3144 
                                   3145 
                                   3146 ;-----------------------------------
                                   3147 ; BASIC: ERASE \E | \F 
                                   3148 ; erase all block in range from 
                                   3149 ;  'app_space' to FLASH end (0x20000)
                                   3150 ;  or all EEPROM 
                                   3151 ; that contains a non zero byte.  
                                   3152 ;-----------------------------------
                           000001  3153 	LIMIT=1 
                           000003  3154 	VSIZE = 3 
      001FD5                       3155 erase:
      009DE1 00 00 22 06      [ 1] 3156 	clr farptr 
      001FD9                       3157 	_vars VSIZE 
      009DE5 A6 06            [ 2]    1     sub sp,#VSIZE 
      009DE7 CC 92 13         [ 4] 3158 	call next_token 
      009DEA 81 85            [ 1] 3159 	cp a,#TK_CHAR 
      009DEC 52 04            [ 1] 3160 	jreq 0$ 
      009DEE 89 CE 00         [ 2] 3161 	jp syntax_error
      009DF1 05               [ 1] 3162 0$: ld a,xl 
      009DF2 1F 03            [ 1] 3163 	and a,#0XDF 
      009DF4 CD 9C            [ 1] 3164 	cp a,#'E
      009DF6 C5 89            [ 1] 3165 	jrne 1$
      009DF8 CE 00 01         [ 2] 3166 	ldw x,#EEPROM_BASE 
      009DFB 1F 07 85         [ 2] 3167 	ldw farptr+1,x 
      009DFE 20 D3 FF         [ 2] 3168 	ldw x,#EEPROM_END
      009E00 4F               [ 1] 3169 	clr a 
      009E00 72 00            [ 2] 3170 	jra 3$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      009E02 00 22            [ 1] 3171 1$: cp a,#'F 
      009E04 05 A6            [ 1] 3172 	jreq 2$
      009E06 06 CC 92         [ 2] 3173 	ldw x,#err_bad_value
      009E09 13 11 93         [ 2] 3174 	jp tb_error
      009E0A                       3175 2$:
      009E0A 1E 03 CF         [ 2] 3176 	ldw x,#app_sign 
      009E0D 00 05 E6         [ 2] 3177 	ldw farptr+1,x 
      009E10 02 C7            [ 1] 3178 	ld a,#(FLASH_END>>16)&0XFF 
      009E12 00 04 1E         [ 2] 3179 	ldw x,#FLASH_END&0xffff
      00200D                       3180 3$:
      009E15 05 CF            [ 1] 3181 	ld (LIMIT,sp),a 
      009E17 00 01            [ 2] 3182 	ldw (LIMIT+1,sp),x 
                                   3183  ; operation done from RAM
                                   3184  ; copy code to RAM in tib   
      009E19 85 5B 04         [ 4] 3185 	call move_erase_to_ram
      002014                       3186 4$:	 
      009E1C 89 81 C7         [ 4] 3187     call scan_block 
      009E1E 27 08            [ 1] 3188 	jreq 5$  ; block already erased 
      009E1E 72 01            [ 1] 3189     ld a,#'E 
      009E20 00 22 02         [ 4] 3190     call putc 
      009E23 4F 81 8F         [ 4] 3191 	call block_erase   
                                   3192 ; this block is clean, next  
      009E25 AE 00 80         [ 2] 3193 5$:	ldw x,#BLOCK_SIZE
      009E25 72 09 00         [ 4] 3194 	call incr_farptr
                                   3195 ; check limit, 24 bit substraction  	
      009E28 22 12            [ 1] 3196 	ld a,(LIMIT,sp)
      009E2A 5B 02            [ 2] 3197 	ldw x,(LIMIT+1,sp)
      009E2C CD 9A BA 5B      [ 2] 3198 	subw x,farptr+1
      009E30 04 72 19         [ 1] 3199 	sbc a,farptr 
      009E33 00 22            [ 1] 3200 	jrugt 4$ 
      009E35 72 10 00         [ 4] 3201 9$: call clear_basic
      002037                       3202 	_drop VSIZE 
      009E38 22 CC            [ 2]    1     addw sp,#VSIZE 
      009E3A 92               [ 4] 3203 	ret 
                                   3204 	
                                   3205 
                                   3206 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3207 ;  check for application signature 
                                   3208 ; output:
                                   3209 ;   Carry    0 app present 
                                   3210 ;            1 no app installed  
                                   3211 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00203A                       3212 qsign: 
      009E3B B4 CE 00         [ 2] 3213 	ldw x,app_sign 
      009E3E 1B C3 00         [ 2] 3214 	cpw x,SIGNATURE ; "BC" 
      009E41 1D               [ 4] 3215 	ret 
                                   3216 
                                   3217 ;---------------------------------------
                                   3218 ; BASIC: SAVE
                                   3219 ; write application in RAM to FLASH
                                   3220 ;--------------------------------------
      002041                       3221 save_app:
      009E42 2B 0C AE         [ 4] 3222 	call qsign 
      009E45 91 AA            [ 1] 3223 	jrne 1$
      009E47 CD 83 CE         [ 2] 3224 	ldw x,#CANT_DO 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      009E4A 55 00 04         [ 4] 3225 	call puts 
      009E4D 00 02 81         [ 2] 3226 	jp 9$
      009E50                       3227 1$: 
      009E50 CD 99 0E         [ 2] 3228 	ldw x,txtbgn
      009E53 5B 02 5F         [ 2] 3229 	cpw x,txtend 
      009E56 CF 00            [ 1] 3230 	jrult 2$ 
      009E58 07 72 5F         [ 2] 3231 	ldw x,#NO_APP
      009E5B 00 09 72         [ 4] 3232 	call puts 
      009E5E 5F 00            [ 2] 3233 	jra 9$
      00205F                       3234 2$: 
                                   3235 ; block programming flash
                                   3236 ; must be done from RAM 
      009E60 0A CE 00         [ 4] 3237 	call move_prg_to_ram
                                   3238 ; initialize farptr 
      009E63 1B CF 00 05      [ 1] 3239 	clr farptr 
      009E67 E6 02 C7         [ 2] 3240 	ldw x,#app_sign 
      009E6A 00 04 35         [ 2] 3241 	ldw farptr+1,x 
                                   3242 ; write signature
      009E6D 03 00 02         [ 2] 3243 	ldw x,SIGNATURE ; "BC" 
      009E70 72 10 00         [ 2] 3244 	ldw rsign,x 
      009E73 22 CC 92         [ 2] 3245 	ldw x,txtend 
      009E76 B4 B0 00 1A      [ 2] 3246 	subw x,txtbgn 
      009E77 CF 00 7E         [ 2] 3247 	ldw rsize,x   
                                   3248 ;copy block to flash
      009E77 AE 17 FF         [ 2] 3249 	ldw x,#rsign  
      009E7A 94 CC            [ 2] 3250 	ldw (1,sp),x   
      009E7C 92 95            [ 2] 3251 3$:	ldw x,(1,sp)
      009E7E CD 01 6B         [ 4] 3252 	call write_row 
      009E7E CD 93            [ 1] 3253     ld a,#'. 
      009E80 09 A1 85         [ 4] 3254     call putc 
      009E83 27 03            [ 2] 3255 	ldw x,(1,sp)
      009E85 CC 92 11         [ 2] 3256 	addw x,#BLOCK_SIZE
      009E88 CF 00            [ 2] 3257 	ldw (1,sp),x  
      009E8A 19 CD 83         [ 2] 3258 	cpw x,txtend 
      009E8D 7A 27            [ 1] 3259 	jruge 8$
      009E8F 03 CD 83         [ 2] 3260 	ldw x,#BLOCK_SIZE 
      009E92 81 72 3F         [ 4] 3261 	call incr_farptr
      009E95 00 19            [ 2] 3262 	jra 3$ 
      00209F                       3263 8$:	
      00209F                       3264 	_drop 2   
      009E97 72 5C            [ 2]    1     addw sp,#2 
      009E99 00               [ 4] 3265 9$: ret 
                                   3266 
      009E9A 1A 72                 3267 SIGNATURE: .ascii "BC"
      009E9C C7 00 19 81 74 20 66  3268 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE before"
             6C 61 73 68 20 61 70
             70 6C 69 63 61 74 69
             6F 6E 2C 20 61 6C 72
             65 61 64 79 20 6F 6E
             65 20 69 6E 20 46 4C
             41 53 48 0A 75 73 65
             20 45 52 41 53 45 20
             62 65 66 6F 72 65 00
      009EA0 4E 6F 20 61 70 70 6C  3269 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



             20 69 6E 20 52 41 4D
             00
                                   3270 
                                   3271 ;---------------------
                                   3272 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3273 ; write 1 or more byte to FLASH or EEPROM
                                   3274 ; starting at address  
                                   3275 ; input:
                                   3276 ;   expr1  	is address 
                                   3277 ;   expr2,...,exprn   are bytes to write
                                   3278 ; output:
                                   3279 ;   none 
                                   3280 ;---------------------
                           000001  3281 	ADDR=1
                           000002  3282 	VSIZ=2 
      0020F9                       3283 write:
      0020F9                       3284 	_vars VSIZE 
      009EA0 AE 00            [ 2]    1     sub sp,#VSIZE 
      009EA2 64 90 AE 03      [ 1] 3285 	clr farptr ; expect 16 bits address 
      009EA6 E8 20 0D         [ 4] 3286 	call expression
      009EA9 A1 84            [ 1] 3287 	cp a,#TK_INTGR 
      009EA9 CD 96            [ 1] 3288 	jreq 0$
      009EAB B5 A1 02         [ 2] 3289 	jp syntax_error
      009EAE 27 03            [ 2] 3290 0$: ldw (ADDR,sp),x 
      009EB0 CC 92 11         [ 4] 3291 	call next_token 
      009EB3 A1 09            [ 1] 3292 	cp a,#TK_COMMA 
      009EB3 85 90            [ 1] 3293 	jreq 1$ 
      009EB5 85 19            [ 2] 3294 	jra 9$ 
      009EB6 CD 17 34         [ 4] 3295 1$:	call expression
      009EB6 89 AE            [ 1] 3296 	cp a,#TK_INTGR
      009EB8 F4 24            [ 1] 3297 	jreq 2$
      009EBA 65 90 A3         [ 2] 3298 	jp syntax_error
      009EBD 7A               [ 1] 3299 2$:	ld a,xl 
      009EBE 12 2B            [ 2] 3300 	ldw x,(ADDR,sp) 
      009EC0 01 5C 18         [ 2] 3301 	ldw farptr+1,x 
      009EC2 5F               [ 1] 3302 	clrw x 
      009EC2 9E C7 53         [ 4] 3303 	call write_byte
      009EC5 0D 9F            [ 2] 3304 	ldw x,(ADDR,sp)
      009EC7 C7               [ 1] 3305 	incw x 
      009EC8 53 0E            [ 2] 3306 	jra 0$ 
      00212D                       3307 9$:
      00212D                       3308 	_drop VSIZE
      009ECA 8C 56            [ 2]    1     addw sp,#VSIZE 
      009ECC 9E               [ 4] 3309 	ret 
                                   3310 
                                   3311 
                                   3312 ;---------------------
                                   3313 ;BASIC: CHAR(expr)
                                   3314 ; évaluate expression 
                                   3315 ; and take the 7 least 
                                   3316 ; bits as ASCII character
                                   3317 ; return a TK_CHAR 
                                   3318 ;---------------------
      002130                       3319 char:
      009ECD C7 53 0F         [ 4] 3320 	call func_args 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      009ED0 9F C7            [ 1] 3321 	cp a,#1
      009ED2 53 10            [ 1] 3322 	jreq 1$
      009ED4 72 10 53         [ 2] 3323 	jp syntax_error
      009ED7 08               [ 2] 3324 1$:	popw x 
      009ED8 72               [ 1] 3325 	ld a,xl 
      009ED9 10 53            [ 1] 3326 	and a,#0x7f 
      009EDB 00               [ 1] 3327 	ld xl,a
      009EDC 72 10            [ 1] 3328 	ld a,#TK_CHAR
      009EDE 53               [ 4] 3329 	ret
                                   3330 
                                   3331 ;---------------------
                                   3332 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3333 ; extract first character 
                                   3334 ; of string argument 
                                   3335 ; return it as TK_INTGR 
                                   3336 ;---------------------
      002142                       3337 ascii:
      009EDF 04 85            [ 1] 3338 	ld a,#TK_LPAREN
      009EE1 CD A2 79         [ 4] 3339 	call expect 
      009EE4 72 11 53         [ 4] 3340 	call next_token 
      009EE7 08 72            [ 1] 3341 	cp a,#TK_QSTR 
      009EE9 11 53            [ 1] 3342 	jreq 1$
      009EEB 00 81            [ 1] 3343 	cp a,#TK_CHAR 
      009EED 27 0D            [ 1] 3344 	jreq 2$ 
      009EED CD 96            [ 1] 3345 	cp a,#TK_CFUNC 
      009EEF B5 A1            [ 1] 3346 	jreq 0$
      009EF1 02 27 0B         [ 2] 3347 	jp syntax_error
      009EF4 A1               [ 4] 3348 0$: call (x)
      009EF5 01 27            [ 2] 3349 	jra 2$
      00215C                       3350 1$: 
      009EF7 03               [ 1] 3351 	ld a,(x) 
      009EF8 CC               [ 1] 3352 	clrw x
      009EF9 92               [ 1] 3353 	ld xl,a 
      00215F                       3354 2$: 
      009EFA 11               [ 2] 3355 	pushw x 
      009EFB AE 00            [ 1] 3356 	ld a,#TK_RPAREN 
      009EFD 00 89 1E         [ 4] 3357 	call expect
      009F00 03               [ 2] 3358 	popw x 
      009F01 5D 27            [ 1] 3359 	ld a,#TK_INTGR 
      009F03 1A               [ 4] 3360 	ret 
                                   3361 
                                   3362 ;---------------------
                                   3363 ;BASIC: KEY
                                   3364 ; wait for a character 
                                   3365 ; received from STDIN 
                                   3366 ; input:
                                   3367 ;	none 
                                   3368 ; output:
                                   3369 ;	X 		ASCII character 
                                   3370 ;---------------------
      002169                       3371 key:
      009F04 1E 01 9F         [ 4] 3372 	call getc 
      009F07 A4               [ 1] 3373 	clrw x 
      009F08 07               [ 1] 3374 	ld xl,a 
      009F09 4E C7            [ 1] 3375 	ld a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      009F0B 54               [ 4] 3376 	ret
                                   3377 
                                   3378 ;----------------------
                                   3379 ; BASIC: QKEY
                                   3380 ; Return true if there 
                                   3381 ; is a character in 
                                   3382 ; waiting in STDIN 
                                   3383 ; input:
                                   3384 ;  none 
                                   3385 ; output:
                                   3386 ;   X 		0|-1 
                                   3387 ;-----------------------
      002171                       3388 qkey:: 
      009F0C 01               [ 1] 3389 	clrw x 
      009F0D 72 16 50         [ 1] 3390 	ld a,rx1_head
      009F10 CA 72 10         [ 1] 3391 	cp a,rx1_tail 
      009F13 54 01            [ 1] 3392 	jreq 9$ 
      009F15 AE               [ 2] 3393 	cplw x 
      009F16 00 1B            [ 1] 3394 9$: ld a,#TK_INTGR
      009F18 5A               [ 4] 3395 	ret 
                                   3396 
                                   3397 ;---------------------
                                   3398 ; BASIC: GPIO(expr,reg)
                                   3399 ; return gpio address 
                                   3400 ; expr {0..8}
                                   3401 ; input:
                                   3402 ;   none 
                                   3403 ; output:
                                   3404 ;   X 		gpio register address
                                   3405 ;----------------------------
                           000003  3406 	PORT=3
                           000001  3407 	REG=1 
                           000004  3408 	VSIZE=4 
      00217E                       3409 gpio:
      009F19 9D 26 FA         [ 4] 3410 	call func_args 
      009F1C 20 08            [ 1] 3411 	cp a,#2
      009F1E 72 11            [ 1] 3412 	jreq 1$
      009F20 54 01 72         [ 2] 3413 	jp syntax_error  
      002188                       3414 1$:	
      009F23 17 50            [ 2] 3415 	ldw x,(PORT,sp)
      009F25 CA 5B            [ 1] 3416 	jrmi bad_port
      009F27 04 81 09         [ 2] 3417 	cpw x,#9
      009F29 2A 12            [ 1] 3418 	jrpl bad_port
      009F29 CD 96            [ 1] 3419 	ld a,#5
      009F2B B0               [ 4] 3420 	mul x,a
      009F2C A1 01 27         [ 2] 3421 	addw x,#GPIO_BASE 
      009F2F 03 CC            [ 2] 3422 	ldw (PORT,sp),x  
      009F31 92 11            [ 2] 3423 	ldw x,(REG,sp) 
      009F33 85 A3 00         [ 2] 3424 	addw x,(PORT,sp)
      009F36 05 23            [ 1] 3425 	ld a,#TK_INTGR
      0021A0                       3426 	_drop VSIZE 
      009F38 05 A6            [ 2]    1     addw sp,#VSIZE 
      009F3A 0A               [ 4] 3427 	ret
      0021A3                       3428 bad_port:
      009F3B CC 92            [ 1] 3429 	ld a,#ERR_BAD_VALUE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      009F3D 13 9F C7         [ 2] 3430 	jp tb_error
                                   3431 
                                   3432 
                                   3433 ;-------------------------
                                   3434 ; BASIC: UFLASH 
                                   3435 ; return free flash address
                                   3436 ; input:
                                   3437 ;  none 
                                   3438 ; output:
                                   3439 ;	A		TK_INTGR
                                   3440 ;   X 		free address 
                                   3441 ;---------------------------
      0021A8                       3442 uflash:
      009F40 00 0F A6         [ 2] 3443 	ldw x,app_sign
      009F43 05 C0 00         [ 2] 3444 	cpw x,#4243 ; signature "BC" 
      009F46 0F C7            [ 1] 3445 	jreq 1$
      009F48 54 00 72         [ 2] 3446 	ldw x,app_size 
      009F4B 16 54 02         [ 2] 3447 	addw x,#app
      009F4E 72 10            [ 2] 3448 	jra 2$
      009F50 54 01 72         [ 2] 3449 1$:	ldw x,#app_space 
      009F53 0F 54            [ 1] 3450 2$:	ld a,#TK_INTGR 
      009F55 00               [ 4] 3451 	ret 
                                   3452 
                                   3453 
                                   3454 ;---------------------
                                   3455 ; BASIC: USR(addr[,arg])
                                   3456 ; execute a function written 
                                   3457 ; in binary code.
                                   3458 ; binary fonction should 
                                   3459 ; return token attribute in A 
                                   3460 ; and value in X. 
                                   3461 ; input:
                                   3462 ;   addr	routine address 
                                   3463 ;   arg 	is an optional argument 
                                   3464 ; output:
                                   3465 ;   A 		token attribute 
                                   3466 ;   X       returned value 
                                   3467 ;---------------------
      0021BE                       3468 usr:
      009F56 FB CE            [ 2] 3469 	pushw y 	
      009F58 54 04 A6         [ 4] 3470 	call func_args 
      009F5B 84 81            [ 1] 3471 	cp a,#1 
      009F5D 27 07            [ 1] 3472 	jreq 2$
      009F5D 52 01            [ 1] 3473 	cp a,#2
      009F5F CD 96            [ 1] 3474 	jreq 2$  
      009F61 B0 A1 01         [ 2] 3475 	jp syntax_error 
      009F64 27 03            [ 2] 3476 2$: popw y  ; arg|addr 
      009F66 CC 92            [ 1] 3477 	cp a,#1
      009F68 11 85            [ 1] 3478 	jreq 3$
      009F6A A3               [ 2] 3479 	popw x ; addr
      009F6B 00               [ 1] 3480 	exgw x,y 
      009F6C 0F 23            [ 4] 3481 3$: call (y)
      009F6E 05 A6            [ 2] 3482 	popw y 
      009F70 0A               [ 4] 3483 	ret 
                                   3484 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



                                   3485 ;------------------------------
                                   3486 ; BASIC: BYE 
                                   3487 ; halt mcu in its lowest power mode 
                                   3488 ; wait for reset or external interrupt
                                   3489 ; do a cold start on wakeup.
                                   3490 ;------------------------------
      0021DB                       3491 bye:
      009F71 CC 92 13 CD A3   [ 2] 3492 	btjf UART1_SR,#UART_SR_TC,.
      009F76 B7               [10] 3493 	halt
      009F77 6B 01 E6         [ 2] 3494 	jp cold_start  
                                   3495 
                                   3496 ;----------------------------------
                                   3497 ; BASIC: SLEEP 
                                   3498 ; halt mcu until reset or external
                                   3499 ; interrupt.
                                   3500 ; Resume progam after SLEEP command
                                   3501 ;----------------------------------
      0021E4                       3502 sleep:
      009F7A 01 0D 01 27 05   [ 2] 3503 	btjf UART1_SR,#UART_SR_TC,.
      009F7F 44 0A 01 26      [ 1] 3504 	bset flags,#FSLEEP
      009F83 FB               [10] 3505 	halt 
      009F84 A4               [ 4] 3506 	ret 
                                   3507 
                                   3508 ;-------------------------------
                                   3509 ; BASIC: PAUSE expr 
                                   3510 ; suspend execution for n msec.
                                   3511 ; input:
                                   3512 ;	none
                                   3513 ; output:
                                   3514 ;	none 
                                   3515 ;------------------------------
      0021EF                       3516 pause:
      009F85 01 5F 97         [ 4] 3517 	call expression
      009F88 A6 84            [ 1] 3518 	cp a,#TK_INTGR
      009F8A 5B 01            [ 1] 3519 	jreq pause02 
      009F8C 81 11 91         [ 2] 3520 	jp syntax_error
      009F8D                       3521 pause02: 
      009F8D 52               [ 2] 3522 1$: tnzw x 
      009F8E 02 CD            [ 1] 3523 	jreq 2$
      009F90 96               [10] 3524 	wfi 
      009F91 B5               [ 2] 3525 	decw x 
      009F92 A1 02            [ 1] 3526 	jrne 1$
      009F94 27               [ 1] 3527 2$:	clr a 
      009F95 03               [ 4] 3528 	ret 
                                   3529 
                                   3530 ;------------------------------
                                   3531 ; BASIC: AWU expr
                                   3532 ; halt mcu for 'expr' milliseconds
                                   3533 ; use Auto wakeup peripheral
                                   3534 ; all oscillators stopped except LSI
                                   3535 ; range: 1ms - 511ms
                                   3536 ; input:
                                   3537 ;  none
                                   3538 ; output:
                                   3539 ;  none:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



                                   3540 ;------------------------------
      002202                       3541 awu:
      009F96 CC 92 11         [ 4] 3542   call expression
      009F99 85 9F            [ 1] 3543   cp a,#TK_INTGR
      009F9B 6B 02            [ 1] 3544   jreq awu02
      009F9D 85 A3 00         [ 2] 3545   jp syntax_error
      00220C                       3546 awu02:
      009FA0 0F 23 05         [ 2] 3547   cpw x,#5120
      009FA3 A6 0A            [ 1] 3548   jrmi 1$ 
      009FA5 CC 92 13 CD      [ 1] 3549   mov AWU_TBR,#15 
      009FA9 A3 B7            [ 1] 3550   ld a,#30
      009FAB 6B               [ 2] 3551   div x,a
      009FAC 01 A6            [ 1] 3552   ld a,#16
      009FAE 01               [ 2] 3553   div x,a 
      009FAF 0D 01            [ 2] 3554   jra 4$
      00221D                       3555 1$: 
      009FB1 27 05 48         [ 2] 3556   cpw x,#2048
      009FB4 0A 01            [ 1] 3557   jrmi 2$ 
      009FB6 26 FB 0D 02      [ 1] 3558   mov AWU_TBR,#14
      009FBA 26 05            [ 1] 3559   ld a,#80
      009FBC 43               [ 2] 3560   div x,a 
      009FBD E4 00            [ 2] 3561   jra 4$   
      00222B                       3562 2$:
      009FBF 20 02 EA 00      [ 1] 3563   mov AWU_TBR,#7
      00222F                       3564 3$:  
                                   3565 ; while X > 64  divide by 2 and increment AWU_TBR 
      009FC3 E7 00 5B         [ 2] 3566   cpw x,#64 
      009FC6 02 81            [ 2] 3567   jrule 4$ 
      009FC8 72 5C 50 F2      [ 1] 3568   inc AWU_TBR 
      009FC8 72               [ 2] 3569   srlw x 
      009FC9 00 00            [ 2] 3570   jra 3$ 
      00223B                       3571 4$:
      009FCB 22               [ 1] 3572   ld a, xl
      009FCC 02               [ 1] 3573   dec a 
      009FCD 4F 81            [ 1] 3574   jreq 5$
      009FCF 4A               [ 1] 3575   dec a 	
      002240                       3576 5$: 
      009FCF AE 9F            [ 1] 3577   and a,#0x3e 
      009FD1 F6 CD 83         [ 1] 3578   ld AWU_APR,a 
      009FD4 CE 5B 02 52      [ 1] 3579   bset AWU_CSR,#AWU_CSR_AWUEN
      009FD8 04               [10] 3580   halt 
                                   3581 
      009FD9 CD               [ 4] 3582   ret 
                                   3583 
                                   3584 ;------------------------------
                                   3585 ; BASIC: TICKS
                                   3586 ; return msec ticks counter value 
                                   3587 ; input:
                                   3588 ; 	none 
                                   3589 ; output:
                                   3590 ;	X 		TK_INTGR
                                   3591 ;-------------------------------
      00224B                       3592 get_ticks:
      009FDA 9A AA AE         [ 2] 3593 	ldw x,ticks 
      009FDD 16 90            [ 1] 3594 	ld a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      009FDF CF               [ 4] 3595 	ret 
                                   3596 
                                   3597 
                                   3598 
                                   3599 ;------------------------------
                                   3600 ; BASIC: ABS(expr)
                                   3601 ; return absolute value of expr.
                                   3602 ; input:
                                   3603 ;   none
                                   3604 ; output:
                                   3605 ;   X     	positive integer
                                   3606 ;-------------------------------
      002251                       3607 abs:
      009FE0 00 05 7F         [ 4] 3608 	call func_args 
      009FE3 72 5F            [ 1] 3609 	cp a,#1 
      009FE5 00 04            [ 1] 3610 	jreq 0$ 
      009FE7 5F CF 00         [ 2] 3611 	jp syntax_error
      00225B                       3612 0$:  
      009FEA 01               [ 2] 3613     popw x   
      009FEB 72               [ 1] 3614 	ld a,xh 
      009FEC 11 00            [ 1] 3615 	bcp a,#0x80 
      009FEE 22 72            [ 1] 3616 	jreq 2$ 
      009FF0 18               [ 2] 3617 	negw x 
      009FF1 00 22            [ 1] 3618 2$: ld a,#TK_INTGR 
      009FF3 CC               [ 4] 3619 	ret 
                                   3620 
                                   3621 ;------------------------------
                                   3622 ; BASIC: AND(expr1,expr2)
                                   3623 ; Apply bit AND relation between
                                   3624 ; the 2 arguments, i.e expr1 & expr2 
                                   3625 ; output:
                                   3626 ; 	A 		TK_INTGR
                                   3627 ;   X 		result 
                                   3628 ;------------------------------
      002265                       3629 bit_and:
      009FF4 92 B4 0A         [ 4] 3630 	call func_args 
      009FF7 62 72            [ 1] 3631 	cp a,#2
      009FF9 65 61            [ 1] 3632 	jreq 1$
      009FFB 6B 20 70         [ 2] 3633 	jp syntax_error 
      009FFE 6F               [ 2] 3634 1$:	popw x 
      009FFF 69               [ 1] 3635 	ld a,xh 
      00A000 6E 74            [ 1] 3636 	and a,(1,sp)
      00A002 2C               [ 1] 3637 	ld xh,a 
      00A003 20               [ 1] 3638 	ld a,xl
      00A004 52 55            [ 1] 3639 	and a,(2,sp)
      00A006 4E               [ 1] 3640 	ld xl,a 
      002278                       3641 	_drop 2 
      00A007 20 74            [ 2]    1     addw sp,#2 
      00A009 6F 20            [ 1] 3642 	ld a,#TK_INTGR
      00A00B 72               [ 4] 3643 	ret
                                   3644 
                                   3645 ;------------------------------
                                   3646 ; BASIC: OR(expr1,expr2)
                                   3647 ; Apply bit OR relation between
                                   3648 ; the 2 arguments, i.e expr1 | expr2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



                                   3649 ; output:
                                   3650 ; 	A 		TK_INTGR
                                   3651 ;   X 		result 
                                   3652 ;------------------------------
      00227D                       3653 bit_or:
      00A00C 65 73 75         [ 4] 3654 	call func_args 
      00A00F 6D 65            [ 1] 3655 	cp a,#2
      00A011 2E 0A            [ 1] 3656 	jreq 1$
      00A013 00 11 91         [ 2] 3657 	jp syntax_error 
      00A014                       3658 1$: 
      00A014 72               [ 2] 3659 	popw x 
      00A015 01               [ 1] 3660 	ld a,xh 
      00A016 00 22            [ 1] 3661 	or a,(1,sp)
      00A018 01               [ 1] 3662 	ld xh,a 
      00A019 81               [ 1] 3663 	ld a,xl 
      00A01A 1A 02            [ 1] 3664 	or a,(2,sp)
      00A01A CD               [ 1] 3665 	ld xl,a 
      002290                       3666 	_drop 2 
      00A01B 90 79            [ 2]    1     addw sp,#2 
      00A01D 81 84            [ 1] 3667 	ld a,#TK_INTGR 
      00A01E 81               [ 4] 3668 	ret
                                   3669 
                                   3670 ;------------------------------
                                   3671 ; BASIC: XOR(expr1,expr2)
                                   3672 ; Apply bit XOR relation between
                                   3673 ; the 2 arguments, i.e expr1 ^ expr2 
                                   3674 ; output:
                                   3675 ; 	A 		TK_INTGR
                                   3676 ;   X 		result 
                                   3677 ;------------------------------
      002295                       3678 bit_xor:
      00A01E A6 7F C4         [ 4] 3679 	call func_args 
      00A021 00 1A            [ 1] 3680 	cp a,#2
      00A023 27 13            [ 1] 3681 	jreq 1$
      00A025 CE 00 19         [ 2] 3682 	jp syntax_error 
      00229F                       3683 1$: 
      00A028 1C               [ 2] 3684 	popw x 
      00A029 00               [ 1] 3685 	ld a,xh 
      00A02A 80 24            [ 1] 3686 	xor a,(1,sp)
      00A02C 04               [ 1] 3687 	ld xh,a 
      00A02D 72               [ 1] 3688 	ld a,xl 
      00A02E 5C 00            [ 1] 3689 	xor a,(2,sp)
      00A030 18               [ 1] 3690 	ld xl,a 
      0022A8                       3691 	_drop 2 
      00A031 9F A4            [ 2]    1     addw sp,#2 
      00A033 80 97            [ 1] 3692 	ld a,#TK_INTGR 
      00A035 CF               [ 4] 3693 	ret 
                                   3694 
                                   3695 ;------------------------------
                                   3696 ; BASIC: LSHIFT(expr1,expr2)
                                   3697 ; logical shift left expr1 by 
                                   3698 ; expr2 bits 
                                   3699 ; output:
                                   3700 ; 	A 		TK_INTGR
                                   3701 ;   X 		result 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



                                   3702 ;------------------------------
      0022AD                       3703 lshift:
      00A036 00 19 81         [ 4] 3704 	call func_args
      00A039 A1 02            [ 1] 3705 	cp a,#2 
      00A039 72 BB            [ 1] 3706 	jreq 1$
      00A03B 00 19 24         [ 2] 3707 	jp syntax_error
      00A03E 04 72            [ 2] 3708 1$: popw y   
      00A040 5C               [ 2] 3709 	popw x 
      00A041 00 18            [ 2] 3710 	tnzw y 
      00A043 CF 00            [ 1] 3711 	jreq 4$
      00A045 19               [ 2] 3712 2$:	sllw x 
      00A046 81 5A            [ 2] 3713 	decw y 
      00A047 26 FB            [ 1] 3714 	jrne 2$
      0022C3                       3715 4$:  
      00A047 5F 92            [ 1] 3716 	ld a,#TK_INTGR
      00A049 AF               [ 4] 3717 	ret
                                   3718 
                                   3719 ;------------------------------
                                   3720 ; BASIC: RSHIFT(expr1,expr2)
                                   3721 ; logical shift right expr1 by 
                                   3722 ; expr2 bits.
                                   3723 ; output:
                                   3724 ; 	A 		TK_INTGR
                                   3725 ;   X 		result 
                                   3726 ;------------------------------
      0022C6                       3727 rshift:
      00A04A 00 18 26         [ 4] 3728 	call func_args
      00A04D 06 5C            [ 1] 3729 	cp a,#2 
      00A04F A3 00            [ 1] 3730 	jreq 1$
      00A051 80 25 F4         [ 2] 3731 	jp syntax_error
      00A054 81 85            [ 2] 3732 1$: popw y  
      00A055 85               [ 2] 3733 	popw x
      00A055 72 5F            [ 2] 3734 	tnzw y 
      00A057 00 18            [ 1] 3735 	jreq 4$
      00A059 52               [ 2] 3736 2$:	srlw x 
      00A05A 03 CD            [ 2] 3737 	decw y 
      00A05C 93 09            [ 1] 3738 	jrne 2$
      0022DC                       3739 4$:  
      00A05E A1 03            [ 1] 3740 	ld a,#TK_INTGR
      00A060 27               [ 4] 3741 	ret
                                   3742 
                                   3743 ;--------------------------
                                   3744 ; BASIC: FCPU integer
                                   3745 ; set CPU frequency 
                                   3746 ;-------------------------- 
                                   3747 
      0022DF                       3748 fcpu:
      00A061 03 CC            [ 1] 3749 	ld a,#TK_INTGR
      00A063 92 11 9F         [ 4] 3750 	call expect 
      00A066 A4               [ 1] 3751 	ld a,xl 
      00A067 DF A1            [ 1] 3752 	and a,#7 
      00A069 45 26 0C         [ 1] 3753 	ld CLK_CKDIVR,a 
      00A06C AE               [ 4] 3754 	ret 
                                   3755 
                                   3756 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



                                   3757 ; BASIC: PMODE pin#, mode 
                                   3758 ; Arduino pin. 
                                   3759 ; define pin as input or output
                                   3760 ; pin#: {0..15}
                                   3761 ; mode: INPUT|OUTPUT  
                                   3762 ;------------------------------
                           000001  3763 	PINNO=1
                           000001  3764 	VSIZE=1
      0022EB                       3765 pin_mode:
      0022EB                       3766 	_vars VSIZE 
      00A06D 40 00            [ 2]    1     sub sp,#VSIZE 
      00A06F CF 00 19         [ 4] 3767 	call arg_list 
      00A072 AE 47            [ 1] 3768 	cp a,#2 
      00A074 FF 4F            [ 1] 3769 	jreq 1$
      00A076 20 15 A1         [ 2] 3770 	jp syntax_error 
      00A079 46 27            [ 2] 3771 1$: popw y ; mode 
      00A07B 06               [ 2] 3772 	popw x ; Dx pin 
      00A07C AE 91 5B         [ 4] 3773 	call select_pin 
      00A07F CC 92            [ 1] 3774 	ld (PINNO,sp),a  
      00A081 13 01            [ 1] 3775 	ld a,#1 
      00A082 0D 01            [ 1] 3776 	tnz (PINNO,sp)
      00A082 AE AC            [ 1] 3777 	jreq 4$
      00A084 80               [ 1] 3778 2$:	sll a 
      00A085 CF 00            [ 1] 3779 	dec (PINNO,sp)
      00A087 19 A6            [ 1] 3780 	jrne 2$ 
      00A089 02 AE            [ 1] 3781 	ld (PINNO,sp),a
      00A08B 7F FF            [ 1] 3782 	ld a,(PINNO,sp)
      00A08D EA 03            [ 1] 3783 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A08D 6B 01            [ 1] 3784 	ld (GPIO_CR1,x),a 
      00A08F 1F 02 CD 81      [ 2] 3785 4$:	cpw y,#OUTP 
      00A093 91 10            [ 1] 3786 	jreq 6$
                                   3787 ; input mode
                                   3788 ; disable external interrupt 
      00A094 7B 01            [ 1] 3789 	ld a,(PINNO,sp)
      00A094 CD               [ 1] 3790 	cpl a 
      00A095 A0 47            [ 1] 3791 	and a,(GPIO_CR2,x)
      00A097 27 08            [ 1] 3792 	ld (GPIO_CR2,x),a 
                                   3793 ;clear bit in DDR for input mode 
      00A099 A6 45            [ 1] 3794 	ld a,(PINNO,sp)
      00A09B CD               [ 1] 3795 	cpl a 
      00A09C 83 71            [ 1] 3796 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A09E CD 82            [ 1] 3797 	ld (GPIO_DDR,x),a 
      00A0A0 0F AE            [ 2] 3798 	jra 9$
      002328                       3799 6$: ;output mode  
      00A0A2 00 80            [ 1] 3800 	ld a,(PINNO,sp)
      00A0A4 CD A0            [ 1] 3801 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A0A6 39 7B            [ 1] 3802 	ld (GPIO_DDR,x),a 
      00A0A8 01 1E            [ 1] 3803 	ld a,(PINNO,sp)
      00A0AA 02 72            [ 1] 3804 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A0AC B0 00            [ 1] 3805 	ld (GPIO_CR2,x),a 
      002334                       3806 9$:	
      002334                       3807 	_drop VSIZE 
      00A0AE 19 C2            [ 2]    1     addw sp,#VSIZE 
      00A0B0 00               [ 4] 3808 	ret
                                   3809 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



                                   3810 ;------------------------
                                   3811 ; select Arduino pin 
                                   3812 ; input:
                                   3813 ;   X 	 {0..15} Arduino Dx 
                                   3814 ; output:
                                   3815 ;   A     stm8s208 pin 
                                   3816 ;   X     base address s208 GPIO port 
                                   3817 ;---------------------------
      002337                       3818 select_pin:
      00A0B1 18               [ 2] 3819 	sllw x 
      00A0B2 22 E0 CD         [ 2] 3820 	addw x,#arduino_to_8s208 
      00A0B5 90               [ 2] 3821 	ldw x,(x)
      00A0B6 79               [ 1] 3822 	ld a,xl 
      00A0B7 5B               [ 1] 3823 	push a 
      00A0B8 03               [ 1] 3824 	swapw x 
      00A0B9 81 05            [ 1] 3825 	ld a,#5 
      00A0BA 42               [ 4] 3826 	mul x,a 
      00A0BA CE AC 80         [ 2] 3827 	addw x,#GPIO_BASE 
      00A0BD C3               [ 1] 3828 	pop a 
      00A0BE A1               [ 4] 3829 	ret 
                                   3830 ; translation from Arduino D0..D15 to stm8s208rb 
      002347                       3831 arduino_to_8s208:
      00A0BF 22 81                 3832 .byte 3,6 ; D0 
      00A0C1 03 05                 3833 .byte 3,5 ; D1 
      00A0C1 CD A0                 3834 .byte 4,0 ; D2 
      00A0C3 BA 26                 3835 .byte 2,1 ; D3
      00A0C5 09 AE                 3836 .byte 6,0 ; D4
      00A0C7 A1 24                 3837 .byte 2,2 ; D5
      00A0C9 CD 83                 3838 .byte 2,3 ; D6
      00A0CB CE CC                 3839 .byte 3,1 ; D7
      00A0CD A1 21                 3840 .byte 3,3 ; D8
      00A0CF 02 04                 3841 .byte 2,4 ; D9
      00A0CF CE 00                 3842 .byte 4,5 ; D10
      00A0D1 1B C3                 3843 .byte 2,6 ; D11
      00A0D3 00 1D                 3844 .byte 2,7 ; D12
      00A0D5 25 08                 3845 .byte 2,5 ; D13
      00A0D7 AE A1                 3846 .byte 4,2 ; D14
      00A0D9 63 CD                 3847 .byte 4,1 ; D15
                                   3848 
                                   3849 
                                   3850 ;------------------------------
                                   3851 ; BASIC: RND(expr)
                                   3852 ; return random number 
                                   3853 ; between 1 and expr inclusive
                                   3854 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   3855 ; input:
                                   3856 ; 	none 
                                   3857 ; output:
                                   3858 ;	X 		random positive integer 
                                   3859 ;------------------------------
      002367                       3860 random:
      00A0DB 83 CE 20         [ 4] 3861 	call func_args 
      00A0DE 42 01            [ 1] 3862 	cp a,#1
      00A0DF 27 03            [ 1] 3863 	jreq 1$
      00A0DF CD 81 D1         [ 2] 3864 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      002371                       3865 1$:  
      00A0E2 72 5F            [ 1] 3866 	ld a,#0x80 
      00A0E4 00 18            [ 1] 3867 	bcp a,(1,sp)
      00A0E6 AE AC            [ 1] 3868 	jreq 2$
      00A0E8 80 CF            [ 1] 3869 	ld a,#ERR_BAD_VALUE
      00A0EA 00 19 CE         [ 2] 3870 	jp tb_error
      00237C                       3871 2$: 
                                   3872 ; acc16=(x<<5)^x 
      00A0ED A1 22 CF         [ 2] 3873 	ldw x,seedx 
      00A0F0 00               [ 2] 3874 	sllw x 
      00A0F1 7C               [ 2] 3875 	sllw x 
      00A0F2 CE               [ 2] 3876 	sllw x 
      00A0F3 00               [ 2] 3877 	sllw x 
      00A0F4 1D               [ 2] 3878 	sllw x 
      00A0F5 72               [ 1] 3879 	ld a,xh 
      00A0F6 B0 00 1B         [ 1] 3880 	xor a,seedx 
      00A0F9 CF 00 7E         [ 1] 3881 	ld acc16,a 
      00A0FC AE               [ 1] 3882 	ld a,xl 
      00A0FD 00 7C 1F         [ 1] 3883 	xor a,seedx+1 
      00A100 01 1E 01         [ 1] 3884 	ld acc8,a 
                                   3885 ; seedx=seedy 
      00A103 CD 81 EB         [ 2] 3886 	ldw x,seedy 
      00A106 A6 2E CD         [ 2] 3887 	ldw seedx,x  
                                   3888 ; seedy=seedy^(seedy>>1)
      00A109 83 71            [ 2] 3889 	srlw y 
      00A10B 1E 01            [ 1] 3890 	ld a,yh 
      00A10D 1C 00 80         [ 1] 3891 	xor a,seedy 
      00A110 1F 01 C3         [ 1] 3892 	ld seedy,a  
      00A113 00 1D            [ 1] 3893 	ld a,yl 
      00A115 24 08 AE         [ 1] 3894 	xor a,seedy+1 
      00A118 00 80 CD         [ 1] 3895 	ld seedy+1,a 
                                   3896 ; acc16>>3 
      00A11B A0 39 20         [ 2] 3897 	ldw x,acc16 
      00A11E E2               [ 2] 3898 	srlw x 
      00A11F 54               [ 2] 3899 	srlw x 
      00A11F 5B               [ 2] 3900 	srlw x 
                                   3901 ; x=acc16^x 
      00A120 02               [ 1] 3902 	ld a,xh 
      00A121 81 42 43         [ 1] 3903 	xor a,acc16 
      00A124 43               [ 1] 3904 	ld xh,a 
      00A125 61               [ 1] 3905 	ld a,xl 
      00A126 6E 27 74         [ 1] 3906 	xor a,acc8 
      00A129 20               [ 1] 3907 	ld xl,a 
                                   3908 ; seedy=x^seedy 
      00A12A 66 6C 61         [ 1] 3909 	xor a,seedy+1
      00A12D 73               [ 1] 3910 	ld xl,a 
      00A12E 68               [ 1] 3911 	ld a,xh 
      00A12F 20 61 70         [ 1] 3912 	xor a,seedy
      00A132 70               [ 1] 3913 	ld xh,a 
      00A133 6C 69 63         [ 2] 3914 	ldw seedy,x 
                                   3915 ; return seedy modulo expr + 1 
      00A136 61 74            [ 2] 3916 	popw y 
      00A138 69               [ 2] 3917 	divw x,y 
      00A139 6F               [ 1] 3918 	ldw x,y 
      00A13A 6E               [ 1] 3919 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      0023CB                       3920 10$:
      00A13B 2C 20            [ 1] 3921 	ld a,#TK_INTGR
      00A13D 61               [ 4] 3922 	ret 
                                   3923 
                                   3924 ;---------------------------------
                                   3925 ; BASIC: WORDS 
                                   3926 ; affiche la listes des mots du
                                   3927 ; dictionnaire ainsi que le nombre
                                   3928 ; de mots.
                                   3929 ;---------------------------------
                           000001  3930 	WLEN=1 ; word length
                           000002  3931 	LLEN=2 ; character sent to console
                           000003  3932 	WCNT=3 ; count words printed 
                           000003  3933 	VSIZE=3 
      0023CE                       3934 words:
      0023CE                       3935 	_vars VSIZE
      00A13E 6C 72            [ 2]    1     sub sp,#VSIZE 
      00A140 65 61            [ 1] 3936 	clr (LLEN,sp)
      00A142 64 79            [ 1] 3937 	clr (WCNT,sp)
      00A144 20 6F 6E 65      [ 2] 3938 	ldw y,#kword_dict+2
      00A148 20               [ 1] 3939 0$:	ldw x,y
      00A149 69               [ 1] 3940 	ld a,(x)
      00A14A 6E 20            [ 1] 3941 	and a,#15 
      00A14C 46 4C            [ 1] 3942 	ld (WLEN,sp),a 
      00A14E 41 53            [ 1] 3943 	inc (WCNT,sp)
      00A150 48               [ 1] 3944 1$:	incw x 
      00A151 0A               [ 1] 3945 	ld a,(x)
      00A152 75 73 65         [ 4] 3946 	call putc 
      00A155 20 45            [ 1] 3947 	inc (LLEN,sp)
      00A157 52 41            [ 1] 3948 	dec (WLEN,sp)
      00A159 53 45            [ 1] 3949 	jrne 1$
      00A15B 20 62            [ 1] 3950 	ld a,#70
      00A15D 65 66            [ 1] 3951 	cp a,(LLEN,sp)
      00A15F 6F 72            [ 1] 3952 	jrmi 2$   
      00A161 65 00            [ 1] 3953 	ld a,#SPACE 
      00A163 4E 6F 20         [ 4] 3954 	call putc 
      00A166 61 70            [ 1] 3955 	inc (LLEN,sp) 
      00A168 70 6C            [ 2] 3956 	jra 3$
      00A16A 69 63            [ 1] 3957 2$: ld a,#CR 
      00A16C 61 74 69         [ 4] 3958 	call putc 
      00A16F 6F 6E            [ 1] 3959 	clr (LLEN,sp)
      00A171 20 69 6E 20      [ 2] 3960 3$:	subw y,#2 
      00A175 52 41            [ 2] 3961 	ldw y,(y)
      00A177 4D 00            [ 1] 3962 	jrne 0$ 
      00A179 A6 0D            [ 1] 3963 	ld a,#CR 
      00A179 52 03 72         [ 4] 3964 	call putc  
      00A17C 5F               [ 1] 3965 	clrw x 
      00A17D 00 18            [ 1] 3966 	ld a,(WCNT,sp)
      00A17F CD               [ 1] 3967 	ld xl,a 
      00A180 97 B4 A1         [ 4] 3968 	call print_int 
      00A183 84 27 03         [ 2] 3969 	ldw x,#words_count_msg
      00A186 CC 92 11         [ 4] 3970 	call puts 
      00241B                       3971 	_drop VSIZE 
      00A189 1F 01            [ 2]    1     addw sp,#VSIZE 
      00A18B CD               [ 4] 3972 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      00A18C 93 09 A1 09 27 02 20  3973 words_count_msg: .asciz " words in dictionary\n"
             19 CD 97 B4 A1 84 27
             03 CC 92 11 9F 1E 01
             CF
                                   3974 
                                   3975 
                                   3976 ;-----------------------------
                                   3977 ; BASIC: TIMER expr 
                                   3978 ; initialize count down timer 
                                   3979 ;-----------------------------
      002434                       3980 set_timer:
      00A1A2 00 19 5F         [ 4] 3981 	call arg_list
      00A1A5 CD 82            [ 1] 3982 	cp a,#1 
      00A1A7 30 1E            [ 1] 3983 	jreq 1$
      00A1A9 01 5C 20         [ 2] 3984 	jp syntax_error
      00243E                       3985 1$: 
      00A1AC DC               [ 2] 3986 	popw x 
      00A1AD CF 00 11         [ 2] 3987 	ldw timer,x 
      00A1AD 5B               [ 4] 3988 	ret 
                                   3989 
                                   3990 ;------------------------------
                                   3991 ; BASIC: TIMEOUT 
                                   3992 ; return state of timer 
                                   3993 ;------------------------------
      002443                       3994 timeout:
      00A1AE 03 81 11         [ 2] 3995 	ldw x,timer 
      00A1B0                       3996 logical_complement:
      00A1B0 CD               [ 2] 3997 	cplw x 
      00A1B1 96 B0 A1         [ 2] 3998 	cpw x,#-1
      00A1B4 01 27            [ 1] 3999 	jreq 2$
      00A1B6 03               [ 1] 4000 	clrw x 
      00A1B7 CC 92            [ 1] 4001 2$:	ld a,#TK_INTGR
      00A1B9 11               [ 4] 4002 	ret 
                                   4003 
                                   4004 ;--------------------------------
                                   4005 ; BASIC NOT(expr) 
                                   4006 ; return logical complement of expr
                                   4007 ;--------------------------------
      002450                       4008 func_not:
      00A1BA 85 9F A4         [ 4] 4009 	call func_args  
      00A1BD 7F 97            [ 1] 4010 	cp a,#1
      00A1BF A6 03            [ 1] 4011 	jreq 1$
      00A1C1 81 11 91         [ 2] 4012 	jp syntax_error
      00A1C2 85               [ 2] 4013 1$:	popw x 
      00A1C2 A6 07            [ 2] 4014 	jra logical_complement
                                   4015 
                                   4016 
                                   4017 
                                   4018 ;-----------------------------------
                                   4019 ; BASIC: IWDGEN expr1 
                                   4020 ; enable independant watchdog timer
                                   4021 ; expr1 is delay in multiple of 62.5µsec
                                   4022 ; expr1 -> {1..16383}
                                   4023 ;-----------------------------------
      00245D                       4024 enable_iwdg:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      00A1C4 CD 96 A3         [ 4] 4025 	call arg_list
      00A1C7 CD 93            [ 1] 4026 	cp a,#1 
      00A1C9 09 A1            [ 1] 4027 	jreq 1$
      00A1CB 02 27 0E         [ 2] 4028 	jp syntax_error 
      00A1CE A1               [ 2] 4029 1$: popw x 
      00A1CF 03 27            [ 1] 4030 	push #0
      00A1D1 0D A1 82 27      [ 1] 4031 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A1D5 03               [ 1] 4032 	ld a,xh 
      00A1D6 CC 92            [ 1] 4033 	and a,#0x3f
      00A1D8 11               [ 1] 4034 	ld xh,a  
      00A1D9 FD 20 03         [ 2] 4035 2$:	cpw x,#255
      00A1DC 23 06            [ 2] 4036 	jrule 3$
      00A1DC F6 5F            [ 1] 4037 	inc (1,sp)
      00A1DE 97               [ 1] 4038 	rcf 
      00A1DF 56               [ 2] 4039 	rrcw x 
      00A1DF 89 A6            [ 2] 4040 	jra 2$
      00A1E1 08 CD 96 A3      [ 1] 4041 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A1E5 85               [ 1] 4042 	pop a  
      00A1E6 A6 84 81         [ 1] 4043 	ld IWDG_PR,a 
      00A1E9 9F               [ 1] 4044 	ld a,xl
      00A1E9 CD               [ 1] 4045 	dec a 
      00A1EA 83 81 5F 97      [ 1] 4046 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A1EE A6 84 81         [ 1] 4047 	ld IWDG_RLR,a 
      00A1F1 35 AA 50 E0      [ 1] 4048 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A1F1 5F               [ 4] 4049 	ret 
                                   4050 
                                   4051 
                                   4052 ;-----------------------------------
                                   4053 ; BASIC: IWDGREF  
                                   4054 ; refresh independant watchdog count down 
                                   4055 ; timer before it reset MCU. 
                                   4056 ;-----------------------------------
      002493                       4057 refresh_iwdg:
      00A1F2 C6 00 2C C1      [ 1] 4058 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A1F6 00               [ 4] 4059 	ret 
                                   4060 
                                   4061 
                                   4062 ;-------------------------------------
                                   4063 ; BASIC: LOG(expr)
                                   4064 ; return logarithm base 2 of expr 
                                   4065 ; this is the position of most significant
                                   4066 ; bit set. 
                                   4067 ; input: 
                                   4068 ; output:
                                   4069 ;   X     log2 
                                   4070 ;   A     TK_INTGR 
                                   4071 ;*********************************
      002498                       4072 log2:
      00A1F7 2D 27 01         [ 4] 4073 	call func_args 
      00A1FA 53 A6            [ 1] 4074 	cp a,#1 
      00A1FC 84 81            [ 1] 4075 	jreq 1$
      00A1FE CC 11 91         [ 2] 4076 	jp syntax_error 
      00A1FE CD               [ 2] 4077 1$: popw x 
      0024A3                       4078 leading_one:
      00A1FF 96               [ 2] 4079 	tnzw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      00A200 B0 A1            [ 1] 4080 	jreq 4$
      00A202 02 27            [ 1] 4081 	ld a,#15 
      00A204 03               [ 2] 4082 2$: rlcw x 
      00A205 CC 92            [ 1] 4083     jrc 3$
      00A207 11               [ 1] 4084 	dec a 
      00A208 20 FA            [ 2] 4085 	jra 2$
      00A208 1E               [ 1] 4086 3$: clrw x 
      00A209 03               [ 1] 4087     ld xl,a
      00A20A 2B 17            [ 1] 4088 4$:	ld a,#TK_INTGR
      00A20C A3               [ 4] 4089 	ret 
                                   4090 
                                   4091 ;-----------------------------------
                                   4092 ; BASIC: BIT(expr) 
                                   4093 ; expr ->{0..15}
                                   4094 ; return 2^expr 
                                   4095 ; output:
                                   4096 ;    x    2^expr 
                                   4097 ;-----------------------------------
      0024B3                       4098 bitmask:
      00A20D 00 09 2A         [ 4] 4099     call func_args 
      00A210 12 A6            [ 1] 4100 	cp a,#1
      00A212 05 42            [ 1] 4101 	jreq 1$
      00A214 1C 50 00         [ 2] 4102 	jp syntax_error 
      00A217 1F               [ 2] 4103 1$: popw x 
      00A218 03               [ 1] 4104 	ld a,xl 
      00A219 1E 01            [ 1] 4105 	and a,#15
      00A21B 72               [ 1] 4106 	clrw x 
      00A21C FB               [ 1] 4107 	incw x 
      00A21D 03               [ 1] 4108 2$: tnz a 
      00A21E A6 84            [ 1] 4109 	jreq 3$
      00A220 5B               [ 2] 4110 	slaw x 
      00A221 04               [ 1] 4111 	dec a 
      00A222 81 F9            [ 2] 4112 	jra 2$ 
      00A223 A6 84            [ 1] 4113 3$: ld a,#TK_INTGR
      00A223 A6               [ 4] 4114 	ret 
                                   4115 
                                   4116 ;------------------------------
                                   4117 ; BASIC: INVERT(expr)
                                   4118 ; 1's complement 
                                   4119 ;--------------------------------
      0024CD                       4120 invert:
      00A224 0A CC 92         [ 4] 4121 	call func_args
      00A227 13 01            [ 1] 4122 	cp a,#1 
      00A228 27 03            [ 1] 4123 	jreq 1$
      00A228 CE AC 80         [ 2] 4124 	jp syntax_error
      00A22B A3               [ 2] 4125 1$: popw x  
      00A22C 10               [ 2] 4126 	cplw x 
      00A22D 93 27            [ 1] 4127 	ld a,#TK_INTGR 
      00A22F 08               [ 4] 4128 	ret 
                                   4129 
                                   4130 ;------------------------------
                                   4131 ; BASIC: DO 
                                   4132 ; initiate a DO ... UNTIL loop 
                                   4133 ;------------------------------
                           000003  4134 	DOLP_ADR=3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



                           000005  4135 	DOLP_INW=5
                           000004  4136 	VSIZE=4 
      0024DC                       4137 do_loop:
      00A230 CE               [ 2] 4138 	popw x 
      0024DD                       4139 	_vars VSIZE 
      00A231 AC 82            [ 2]    1     sub sp,#VSIZE 
      00A233 1C               [ 2] 4140 	pushw x 
      00A234 AC 84 20 03      [ 2] 4141 	ldw y,basicptr 
      00A238 AE AC            [ 2] 4142 	ldw (DOLP_ADR,sp),y
      00A23A 80 A6 84 81      [ 2] 4143 	ldw y,in.w 
      00A23E 17 05            [ 2] 4144 	ldw (DOLP_INW,sp),y
      00A23E 90 89 CD 96      [ 1] 4145 	inc loop_depth 
      00A242 B0               [ 4] 4146 	ret 
                                   4147 
                                   4148 ;--------------------------------
                                   4149 ; BASIC: UNTIL expr 
                                   4150 ; loop if exprssion is false 
                                   4151 ; else terminate loop
                                   4152 ;--------------------------------
      0024F1                       4153 until: 
      00A243 A1 01 27 07      [ 1] 4154 	tnz loop_depth 
      00A247 A1 02            [ 1] 4155 	jrne 1$ 
      00A249 27 03 CC         [ 2] 4156 	jp syntax_error 
      0024FA                       4157 1$: 
      00A24C 92 11 90         [ 4] 4158 	call relation 
      00A24F 85 A1            [ 1] 4159 	cp a,#TK_INTGR
      00A251 01 27            [ 1] 4160 	jreq 2$
      00A253 02 85 51         [ 2] 4161 	jp syntax_error
      002504                       4162 2$: 
      00A256 90               [ 2] 4163 	tnzw x 
      00A257 FD 90            [ 1] 4164 	jrne 9$
      00A259 85 81            [ 2] 4165 	ldw x,(DOLP_ADR,sp)
      00A25B CF 00 04         [ 2] 4166 	ldw basicptr,x 
      00A25B 72 0D            [ 1] 4167 	ld a,(2,x)
      00A25D 52 30 FB         [ 1] 4168 	ld count,a 
      00A260 8E CC            [ 2] 4169 	ldw x,(DOLP_INW,sp)
      00A262 8F 56 00         [ 2] 4170 	ldw in.w,x 
      00A264 81               [ 4] 4171 	ret 
      002517                       4172 9$:	; remove loop data from stack  
      00A264 72               [ 2] 4173 	popw x
      002518                       4174 	_drop VSIZE
      00A265 0D 52            [ 2]    1     addw sp,#VSIZE 
      00A267 30 FB 72 16      [ 1] 4175 	dec loop_depth 
      00A26B 00               [ 2] 4176 	jp (x)
                                   4177 
                                   4178 ;--------------------------
                                   4179 ; BASIC: PRTA...PRTI  
                                   4180 ;  return constant value 
                                   4181 ;  PORT  offset in GPIO
                                   4182 ;  array
                                   4183 ;---------------------------
      00251F                       4184 const_porta:
      00A26C 22 8E 81         [ 2] 4185 	ldw x,#0
      00A26F A6 84            [ 1] 4186 	ld a,#TK_INTGR 
      00A26F CD               [ 4] 4187 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      002525                       4188 const_portb:
      00A270 97 B4 A1         [ 2] 4189 	ldw x,#1
      00A273 84 27            [ 1] 4190 	ld a,#TK_INTGR 
      00A275 03               [ 4] 4191 	ret 
      00252B                       4192 const_portc:
      00A276 CC 92 11         [ 2] 4193 	ldw x,#2
      00A279 A6 84            [ 1] 4194 	ld a,#TK_INTGR 
      00A279 5D               [ 4] 4195 	ret 
      002531                       4196 const_portd:
      00A27A 27 04 8F         [ 2] 4197 	ldw x,#3
      00A27D 5A 26            [ 1] 4198 	ld a,#TK_INTGR 
      00A27F F9               [ 4] 4199 	ret 
      002537                       4200 const_porte:
      00A280 4F 81 04         [ 2] 4201 	ldw x,#4
      00A282 A6 84            [ 1] 4202 	ld a,#TK_INTGR 
      00A282 CD               [ 4] 4203 	ret 
      00253D                       4204 const_portf:
      00A283 97 B4 A1         [ 2] 4205 	ldw x,#5
      00A286 84 27            [ 1] 4206 	ld a,#TK_INTGR 
      00A288 03               [ 4] 4207 	ret 
      002543                       4208 const_portg:
      00A289 CC 92 11         [ 2] 4209 	ldw x,#6
      00A28C A6 84            [ 1] 4210 	ld a,#TK_INTGR 
      00A28C A3               [ 4] 4211 	ret 
      002549                       4212 const_porth:
      00A28D 14 00 2B         [ 2] 4213 	ldw x,#7
      00A290 0C 35            [ 1] 4214 	ld a,#TK_INTGR 
      00A292 0F               [ 4] 4215 	ret 
      00254F                       4216 const_porti:
      00A293 50 F2 A6         [ 2] 4217 	ldw x,#8
      00A296 1E 62            [ 1] 4218 	ld a,#TK_INTGR 
      00A298 A6               [ 4] 4219 	ret 
                                   4220 
                                   4221 ;-------------------------------
                                   4222 ; following return constant 
                                   4223 ; related to GPIO register offset 
                                   4224 ;---------------------------------
      002555                       4225 const_odr:
      00A299 10 62            [ 1] 4226 	ld a,#TK_INTGR 
      00A29B 20 1E 00         [ 2] 4227 	ldw x,#GPIO_ODR
      00A29D 81               [ 4] 4228 	ret 
      00255B                       4229 const_idr:
      00A29D A3 08            [ 1] 4230 	ld a,#TK_INTGR 
      00A29F 00 2B 09         [ 2] 4231 	ldw x,#GPIO_IDR
      00A2A2 35               [ 4] 4232 	ret 
      002561                       4233 const_ddr:
      00A2A3 0E 50            [ 1] 4234 	ld a,#TK_INTGR 
      00A2A5 F2 A6 50         [ 2] 4235 	ldw x,#GPIO_DDR
      00A2A8 62               [ 4] 4236 	ret 
      002567                       4237 const_cr1:
      00A2A9 20 10            [ 1] 4238 	ld a,#TK_INTGR 
      00A2AB AE 00 03         [ 2] 4239 	ldw x,#GPIO_CR1
      00A2AB 35               [ 4] 4240 	ret 
      00256D                       4241 const_cr2:
      00A2AC 07 50            [ 1] 4242 	ld a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      00A2AE F2 00 04         [ 2] 4243 	ldw x,#GPIO_CR2
      00A2AF 81               [ 4] 4244 	ret 
                                   4245 ;-------------------------
                                   4246 ; BASIC: POUT 
                                   4247 ;  constant for port mode
                                   4248 ;  used by PMODE 
                                   4249 ;  to set pin as output
                                   4250 ;------------------------
      002573                       4251 const_output:
      00A2AF A3 00            [ 1] 4252 	ld a,#TK_INTGR 
      00A2B1 40 23 07         [ 2] 4253 	ldw x,#OUTP
      00A2B4 72               [ 4] 4254 	ret 
                                   4255 
                                   4256 ;-------------------------
                                   4257 ; BASIC: PINP 
                                   4258 ;  constant for port mode
                                   4259 ;  used by PMODE 
                                   4260 ;  to set pin as input
                                   4261 ;------------------------
      002579                       4262 const_input:
      00A2B5 5C 50            [ 1] 4263 	ld a,#TK_INTGR 
      00A2B7 F2 54 20         [ 2] 4264 	ldw x,#INP 
      00A2BA F4               [ 4] 4265 	ret 
                                   4266 	
                                   4267 ;-----------------------
                                   4268 ; memory area constants
                                   4269 ;-----------------------
      00A2BB                       4270 const_eeprom_base:
      00A2BB 9F 4A            [ 1] 4271 	ld a,#TK_INTGR 
      00A2BD 27 01 4A         [ 2] 4272 	ldw x,#EEPROM_BASE 
      00A2C0 81               [ 4] 4273 	ret 
                                   4274 
                                   4275 ;---------------------------
                                   4276 ; BASIC: DATA 
                                   4277 ; when the interpreter find 
                                   4278 ; a DATA line it skip it.
                                   4279 ;---------------------------
      002585                       4280 data:
      00A2C0 A4 3E C7 50 F1   [ 1] 4281 	mov in,count 
      00A2C5 72               [ 4] 4282 	ret 
                                   4283 
                                   4284 ;---------------------------
                                   4285 ; BASIC: DATLN  *expr*
                                   4286 ; set DATA pointer at line# 
                                   4287 ; specified by *expr* 
                                   4288 ;---------------------------
      00258B                       4289 data_line:
      00A2C6 18 50 F0         [ 4] 4290 	call expression
      00A2C9 8E 81            [ 1] 4291 	cp a,#TK_INTGR
      00A2CB 27 03            [ 1] 4292 	jreq 1$
      00A2CB CE 00 10         [ 2] 4293 	jp syntax_error  
      00A2CE A6               [ 1] 4294 1$: clr a 
      00A2CF 84 81 36         [ 4] 4295 	call search_lineno
      00A2D1 5D               [ 2] 4296 	tnzw x 
      00A2D1 CD 96            [ 1] 4297 	jrne 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00A2D3 B0 A1            [ 1] 4298 2$:	ld a,#ERR_NO_LINE 
      00A2D5 01 27 03         [ 2] 4299 	jp tb_error
      0025A1                       4300 3$: ; check if valid data line 
      00A2D8 CC 92            [ 1] 4301     ldw y,x 
      00A2DA 11 04            [ 2] 4302 	ldw x,(4,x)
      00A2DB A3 25 85         [ 2] 4303 	cpw x,#data 
      00A2DB 85 9E            [ 1] 4304 	jrne 2$ 
      00A2DD A5 80 27 01      [ 2] 4305 	ldw data_ptr,y
      00A2E1 50 A6 84         [ 1] 4306 	ld a,(2,y)
      00A2E4 81 00 09         [ 1] 4307 	ld data_len,a 
      00A2E5 35 06 00 08      [ 1] 4308 	mov data_ofs,#FIRST_DATA_ITEM 
      00A2E5 CD               [ 4] 4309 	ret
                                   4310 
                                   4311 ;---------------------------------
                                   4312 ; BASIC: RESTORE 
                                   4313 ; set data_ptr to first data line
                                   4314 ; if not DATA found pointer set to
                                   4315 ; zero 
                                   4316 ;---------------------------------
      0025B9                       4317 restore:
      00A2E6 96 B0 A1 02      [ 1] 4318 	clr data_ptr 
      00A2EA 27 03 CC 92      [ 1] 4319 	clr data_ptr+1
      00A2EE 11 85 9E 14      [ 1] 4320 	clr data_ofs 
      00A2F2 01 95 9F 14      [ 1] 4321 	clr data_len
      00A2F6 02 97 5B         [ 2] 4322 	ldw x,txtbgn
      0025CC                       4323 data_search_loop: 	
      00A2F9 02 A6 84         [ 2] 4324 	cpw x,txtend
      00A2FC 81 1B            [ 1] 4325 	jruge 9$
      00A2FD 90 93            [ 1] 4326 	ldw y,x 
      00A2FD CD 96            [ 2] 4327 	ldw x,(4,x)
      00A2FF B0 A1 02         [ 2] 4328 	addw x,#code_addr
      00A302 27               [ 2] 4329 	ldw x,(x)
      00A303 03 CC 92         [ 2] 4330 	cpw x,#data 
      00A306 11 1A            [ 1] 4331 	jrne try_next_line 
      00A307 90 CF 00 06      [ 2] 4332 	ldw data_ptr,y 
      00A307 85 9E 1A         [ 1] 4333 	ld a,(2,y)
      00A30A 01 95 9F         [ 1] 4334 	ld data_len,a 
      00A30D 1A 02 97 5B      [ 1] 4335 	mov data_ofs,#FIRST_DATA_ITEM
      00A311 02 A6 84 81      [ 1] 4336 9$:	tnz data_len 
      00A315 26 05            [ 1] 4337     jrne 10$
      00A315 CD 96            [ 1] 4338 	ld a,#ERR_NO_DATA 
      00A317 B0 A1 02         [ 2] 4339 	jp tb_error 
      00A31A 27               [ 4] 4340 10$:ret
      0025F8                       4341 try_next_line:
      00A31B 03               [ 1] 4342 	ldw x,y 
      00A31C CC 92            [ 1] 4343 	ld a,(2,x)
      00A31E 11 00 0E         [ 1] 4344 	ld acc8,a 
      00A31F 72 5F 00 0D      [ 1] 4345 	clr acc16 
      00A31F 85 9E 18 01      [ 2] 4346 	addw x,acc16 
      00A323 95 9F            [ 2] 4347 	jra data_search_loop
                                   4348 
                                   4349 
                                   4350 ;---------------------------------
                                   4351 ; BASIC: READ 
                                   4352 ; return next data item | 0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



                                   4353 ;---------------------------------
                           000001  4354 	CTX_BPTR=1 
                           000003  4355 	CTX_IN=3 
                           000004  4356 	CTX_COUNT=4 
                           000005  4357 	XSAVE=5
                           000006  4358 	VSIZE=6
      002608                       4359 read:
      002608                       4360 	_vars  VSIZE 
      00A325 18 02            [ 2]    1     sub sp,#VSIZE 
      00260A                       4361 read01:	
      00A327 97 5B 02         [ 1] 4362 	ld a,data_ofs
      00A32A A6 84 81         [ 1] 4363 	cp a,data_len 
      00A32D 27 37            [ 1] 4364 	jreq 2$ ; end of line  
      00A32D CD 96 B0         [ 4] 4365 	call save_context
      00A330 A1 02 27         [ 2] 4366 	ldw x,data_ptr 
      00A333 03 CC 92         [ 2] 4367 	ldw basicptr,x 
      00A336 11 90 85 85 90   [ 1] 4368 	mov in,data_ofs 
      00A33B 5D 27 05 58 90   [ 1] 4369 	mov count,data_len  
      00A340 5A 26 FB         [ 4] 4370 	call expression 
      00A343 A1 84            [ 1] 4371 	cp a,#TK_INTGR 
      00A343 A6 84            [ 1] 4372 	jreq 1$ 
      00A345 81 11 91         [ 2] 4373 	jp syntax_error 
      00A346                       4374 1$:
      00A346 CD 96            [ 2] 4375 	ldw (XSAVE,SP),x
      00A348 B0 A1 02         [ 4] 4376 	call next_token ; skip comma
      00A34B 27 03 CC         [ 2] 4377 	ldw x,basicptr 
      00A34E 92 11 90         [ 2] 4378 	ldw data_ptr,x 
      00A351 85 85 90 5D 27   [ 1] 4379 	mov data_ofs,in 
      00A356 05 54 90         [ 4] 4380 	call rest_context
      00A359 5A 26            [ 2] 4381 	ldw x,(XSAVE,sp)
      00A35B FB 84            [ 1] 4382 	ld a,#TK_INTGR
      00A35C                       4383 	_drop VSIZE 
      00A35C A6 84            [ 2]    1     addw sp,#VSIZE 
      00A35E 81               [ 4] 4384 	ret 
      00A35F                       4385 2$: ; end of line reached 
      00A35F A6 84 CD 96      [ 2] 4386 	ldw y, data_ptr 
      00A363 A3 9F A4 07      [ 1] 4387 	clr data_ptr
      00A367 C7 50 C6 81      [ 1] 4388 	clr data_ptr+1   
      00A36B 72 5F 00 08      [ 1] 4389 	clr data_ofs 
      00A36B 52 01 CD 96      [ 1] 4390 	clr data_len 
      00A36F B5 A1 02         [ 4] 4391 	call try_next_line 
      00A372 27 03            [ 2] 4392 	jra read01
                                   4393 
                                   4394 
                                   4395 ;---------------------------------
                                   4396 ; BASIC: SPIEN clkdiv, 0|1  
                                   4397 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4398 ; if clkdiv==-1 disable SPI
                                   4399 ; 0|1 -> disable|enable  
                                   4400 ;--------------------------------- 
                           000005  4401 SPI_CS_BIT=5
      002662                       4402 spi_enable:
      00A374 CC 92 11         [ 4] 4403 	call arg_list 
      00A377 90 85            [ 1] 4404 	cp a,#2
      00A379 85 CD            [ 1] 4405 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00A37B A3 B7 6B         [ 2] 4406 	jp syntax_error 
      00266C                       4407 1$: 
      00A37E 01 A6 01 0D      [ 1] 4408 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A382 01               [ 2] 4409 	popw x  
      00A383 27               [ 2] 4410 	tnzw x 
      00A384 0D 48            [ 1] 4411 	jreq spi_disable 
      00A386 0A               [ 2] 4412 	popw x 
      00A387 01 26            [ 1] 4413 	ld a,#(1<<SPI_CR1_BR)
      00A389 FB               [ 4] 4414 	mul x,a 
      00A38A 6B               [ 1] 4415 	ld a,xl 
      00A38B 01 7B 01         [ 1] 4416 	ld SPI_CR1,a 
                                   4417 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A38E EA 03 E7 03      [ 1] 4418 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A392 90 A3 00 01      [ 1] 4419 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4420 ; configure SPI as master mode 0.	
      00A396 27 10 7B 01      [ 1] 4421 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4422 ; ~CS line controlled by sofware 	
      00A39A 43 E4 04 E7      [ 1] 4423 	bset SPI_CR2,#SPI_CR2_SSM 
      00A39E 04 7B 01 43      [ 1] 4424     bset SPI_CR2,#SPI_CR2_SSI 
                                   4425 ; enable SPI
      00A3A2 E4 02 E7 02      [ 1] 4426 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A3A6 20               [ 4] 4427 	ret 
      002695                       4428 spi_disable:
      002695                       4429 	_drop #2; throw first argument.
      00A3A7 0C 02            [ 2]    1     addw sp,##2 
                                   4430 ; wait spi idle 
      00A3A8 A6 82            [ 1] 4431 1$:	ld a,#0x82 
      00A3A8 7B 01 EA         [ 1] 4432 	and a,SPI_SR
      00A3AB 02 E7            [ 1] 4433 	cp a,#2 
      00A3AD 02 7B            [ 1] 4434 	jrne 1$
      00A3AF 01 EA 04 E7      [ 1] 4435 	bres SPI_CR1,#SPI_CR1_SPE
      00A3B3 04 13 50 C7      [ 1] 4436 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A3B4 72 1B 50 16      [ 1] 4437 	bres PE_DDR,#SPI_CS_BIT 
      00A3B4 5B               [ 4] 4438 	ret 
                                   4439 
      0026AD                       4440 spi_clear_error:
      00A3B5 01 81            [ 1] 4441 	ld a,#0x78 
      00A3B7 C5 52 03         [ 1] 4442 	bcp a,SPI_SR 
      00A3B7 58 1C            [ 1] 4443 	jreq 1$
      00A3B9 A3 C7 FE 9F      [ 1] 4444 	clr SPI_SR 
      00A3BD 88               [ 4] 4445 1$: ret 
                                   4446 
      0026B9                       4447 spi_send_byte:
      00A3BE 5E               [ 1] 4448 	push a 
      00A3BF A6 05 42         [ 4] 4449 	call spi_clear_error
      00A3C2 1C               [ 1] 4450 	pop a 
      00A3C3 50 00 84 81 FB   [ 2] 4451 	btjf SPI_SR,#SPI_SR_TXE,.
      00A3C7 C7 52 04         [ 1] 4452 	ld SPI_DR,a
      00A3C7 03 06 03 05 04   [ 2] 4453 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A3CC 00 02 01         [ 1] 4454 	ld a,SPI_DR 
      00A3CF 06               [ 4] 4455 	ret 
                                   4456 
      0026CF                       4457 spi_rcv_byte:
      00A3D0 00 02            [ 1] 4458 	ld a,#255
      00A3D2 02 02 03 03 01   [ 2] 4459 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00A3D7 03 03 02         [ 1] 4460 	ld a,SPI_DR 
      00A3DA 04               [ 4] 4461 	ret
                                   4462 
                                   4463 ;------------------------------
                                   4464 ; BASIC: SPIWR byte [,byte]
                                   4465 ; write 1 or more byte
                                   4466 ;------------------------------
      0026DA                       4467 spi_write:
      00A3DB 04 05 02         [ 4] 4468 	call expression
      00A3DE 06 02            [ 1] 4469 	cp a,#TK_INTGR 
      00A3E0 07 02            [ 1] 4470 	jreq 1$
      00A3E2 05 04 02         [ 2] 4471 	jp syntax_error 
      0026E4                       4472 1$:	
      00A3E5 04               [ 1] 4473 	ld a,xl 
      00A3E6 01 26 B9         [ 4] 4474 	call spi_send_byte 
      00A3E7 CD 12 89         [ 4] 4475 	call next_token 
      00A3E7 CD 96            [ 1] 4476 	cp a,#TK_COMMA 
      00A3E9 B0 A1            [ 1] 4477 	jrne 2$ 
      00A3EB 01 27            [ 2] 4478 	jra spi_write 
      00A3ED 03               [ 1] 4479 2$:	tnz a 
      00A3EE CC 92            [ 1] 4480 	jreq 3$
      0026F4                       4481 	_unget_token  
      00A3F0 11 00 02 00 01   [ 1]    1      mov in,in.saved  
      00A3F1 81               [ 4] 4482 3$:	ret 
                                   4483 
                                   4484 
                                   4485 ;-------------------------------
                                   4486 ; BASIC: SPIRD 	
                                   4487 ; read one byte from SPI 
                                   4488 ;-------------------------------
      0026FA                       4489 spi_read:
      00A3F1 A6 80 15         [ 4] 4490 	call spi_rcv_byte 
      00A3F4 01               [ 1] 4491 	clrw x 
      00A3F5 27               [ 1] 4492 	ld xl,a 
      00A3F6 05 A6            [ 1] 4493 	ld a,#TK_INTGR 
      00A3F8 0A               [ 4] 4494 	ret 
                                   4495 
                                   4496 ;------------------------------
                                   4497 ; BASIC: SPISEL 0|1 
                                   4498 ; set state of ~CS line
                                   4499 ; 0|1 deselect|select  
                                   4500 ;------------------------------
      002702                       4501 spi_select:
      00A3F9 CC 92 13         [ 4] 4502 	call next_token 
      00A3FC A1 84            [ 1] 4503 	cp a,#TK_INTGR 
      00A3FC CE 00            [ 1] 4504 	jreq 1$
      00A3FE 14 58 58         [ 2] 4505 	jp syntax_error 
      00A401 58               [ 2] 4506 1$: tnzw x  
      00A402 58 58            [ 1] 4507 	jreq cs_high 
      00A404 9E C8 00 14      [ 1] 4508 	bres PE_ODR,#SPI_CS_BIT
      00A408 C7               [ 4] 4509 	ret 
      002714                       4510 cs_high: 
      00A409 00 0E 9F C8      [ 1] 4511 	bset PE_ODR,#SPI_CS_BIT
      00A40D 00               [ 4] 4512 	ret 
                                   4513 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



                                   4514 ;-------------------------------
                                   4515 ; BASIC: PAD 
                                   4516 ; Return pad buffer address.
                                   4517 ;------------------------------
      002719                       4518 pad_ref:
      00A40E 15 C7 00         [ 2] 4519 	ldw x,#pad 
      00A411 0F CE            [ 1] 4520 	ld a,TK_INTGR
      00A413 00               [ 4] 4521 	ret 
                                   4522 
                                   4523 
                                   4524 ;------------------------------
                                   4525 ;      dictionary 
                                   4526 ; format:
                                   4527 ;   link:   2 bytes 
                                   4528 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   4529 ;   cmd_name: 16 byte max 
                                   4530 ;   cmd_index: 2 bytes 
                                   4531 ;------------------------------
                                   4532 	.macro _dict_entry len,name,cmd_idx 
                                   4533 	.word LINK 
                                   4534 	LINK=.
                                   4535 name:
                                   4536 	.byte len 	
                                   4537 	.ascii "name"
                                   4538 	.word cmd_idx 
                                   4539 	.endm 
                                   4540 
                           000000  4541 	LINK=0
                                   4542 ; respect alphabetic order for BASIC names from Z-A
                                   4543 ; this sort order is for a cleaner WORDS cmd output. 	
      00271F                       4544 kword_end:
      00271F                       4545 	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
      00A414 16 CF                    1 	.word LINK 
                           002721     2 	LINK=.
      002721                          3 XOR:
      00A416 00                       4 	.byte 3+F_IFUNC 	
      00A417 14 90 54                 5 	.ascii "XOR"
      00A41A 90 9E                    6 	.word XOR_IDX 
      002727                       4546 	_dict_entry,5,WRITE,WRITE_IDX;write  
      00A41C C8 00                    1 	.word LINK 
                           002729     2 	LINK=.
      002729                          3 WRITE:
      00A41E 16                       4 	.byte 5 	
      00A41F C7 00 16 90 9F           5 	.ascii "WRITE"
      00A424 C8 00                    6 	.word WRITE_IDX 
      002731                       4547 	_dict_entry,5,WORDS,WORDS_IDX;words 
      00A426 17 C7                    1 	.word LINK 
                           002733     2 	LINK=.
      002733                          3 WORDS:
      00A428 00                       4 	.byte 5 	
      00A429 17 CE 00 0E 54           5 	.ascii "WORDS"
      00A42E 54 54                    6 	.word WORDS_IDX 
      00273B                       4548 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      00A430 9E C8                    1 	.word LINK 
                           00273D     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      00273D                          3 WAIT:
      00A432 00                       4 	.byte 4 	
      00A433 0E 95 9F C8              5 	.ascii "WAIT"
      00A437 00 0F                    6 	.word WAIT_IDX 
      002744                       4549 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      00A439 97 C8                    1 	.word LINK 
                           002746     2 	LINK=.
      002746                          3 USR:
      00A43B 00                       4 	.byte 3+F_IFUNC 	
      00A43C 17 97 9E                 5 	.ascii "USR"
      00A43F C8 00                    6 	.word USR_IDX 
      00274C                       4550 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      00A441 16 95                    1 	.word LINK 
                           00274E     2 	LINK=.
      00274E                          3 UNTIL:
      00A443 CF                       4 	.byte 5 	
      00A444 00 16 90 85 65           5 	.ascii "UNTIL"
      00A449 93 5C                    6 	.word UNTIL_IDX 
      00A44B                       4551 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      00A44B A6 84                    1 	.word LINK 
                           002758     2 	LINK=.
      002758                          3 UFLASH:
      00A44D 81                       4 	.byte 6+F_IFUNC 	
      00A44E 55 46 4C 41 53 48        5 	.ascii "UFLASH"
      00A44E 52 03                    6 	.word UFLASH_IDX 
      002761                       4552 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      00A450 0F 02                    1 	.word LINK 
                           002763     2 	LINK=.
      002763                          3 UBOUND:
      00A452 0F                       4 	.byte 6+F_IFUNC 	
      00A453 03 90 AE AB 3D 93        5 	.ascii "UBOUND"
      00A459 F6 A4                    6 	.word UBOUND_IDX 
      00276C                       4553 	_dict_entry,4,TONE,TONE_IDX;tone  
      00A45B 0F 6B                    1 	.word LINK 
                           00276E     2 	LINK=.
      00276E                          3 TONE:
      00A45D 01                       4 	.byte 4 	
      00A45E 0C 03 5C F6              5 	.ascii "TONE"
      00A462 CD 83                    6 	.word TONE_IDX 
      002775                       4554 	_dict_entry,2,TO,TO_IDX;to
      00A464 71 0C                    1 	.word LINK 
                           002777     2 	LINK=.
      002777                          3 TO:
      00A466 02                       4 	.byte 2 	
      00A467 0A 01                    5 	.ascii "TO"
      00A469 26 F5                    6 	.word TO_IDX 
      00277C                       4555 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00A46B A6 46                    1 	.word LINK 
                           00277E     2 	LINK=.
      00277E                          3 TIMER:
      00A46D 11                       4 	.byte 5 	
      00A46E 02 2B 09 A6 20           5 	.ascii "TIMER"
      00A473 CD 83                    6 	.word TIMER_IDX 
      002786                       4556 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00A475 71 0C                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



                           002788     2 	LINK=.
      002788                          3 TIMEOUT:
      00A477 02                       4 	.byte 7+F_IFUNC 	
      00A478 20 07 A6 0D CD 83 71     5 	.ascii "TIMEOUT"
      00A47F 0F 02                    6 	.word TMROUT_IDX 
      002792                       4557 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00A481 72 A2                    1 	.word LINK 
                           002794     2 	LINK=.
      002794                          3 TICKS:
      00A483 00                       4 	.byte 5+F_IFUNC 	
      00A484 02 90 FE 26 CF           5 	.ascii "TICKS"
      00A489 A6 0D                    6 	.word TICKS_IDX 
      00279C                       4558 	_dict_entry,4,STOP,STOP_IDX;stop 
      00A48B CD 83                    1 	.word LINK 
                           00279E     2 	LINK=.
      00279E                          3 STOP:
      00A48D 71                       4 	.byte 4 	
      00A48E 5F 7B 03 97              5 	.ascii "STOP"
      00A492 CD 93                    6 	.word STOP_IDX 
      0027A5                       4559 	_dict_entry,4,STEP,STEP_IDX;step 
      00A494 57 AE                    1 	.word LINK 
                           0027A7     2 	LINK=.
      0027A7                          3 STEP:
      00A496 A4                       4 	.byte 4 	
      00A497 9E CD 83 CE              5 	.ascii "STEP"
      00A49B 5B 03                    6 	.word STEP_IDX 
      0027AE                       4560 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      00A49D 81 20                    1 	.word LINK 
                           0027B0     2 	LINK=.
      0027B0                          3 SPIWR:
      00A49F 77                       4 	.byte 5 	
      00A4A0 6F 72 64 73 20           5 	.ascii "SPIWR"
      00A4A5 69 6E                    6 	.word SPIWR_IDX 
      0027B8                       4561 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00A4A7 20 64                    1 	.word LINK 
                           0027BA     2 	LINK=.
      0027BA                          3 SPISEL:
      00A4A9 69                       4 	.byte 6 	
      00A4AA 63 74 69 6F 6E 61        5 	.ascii "SPISEL"
      00A4B0 72 79                    6 	.word SPISEL_IDX 
      0027C3                       4562 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      00A4B2 0A 00                    1 	.word LINK 
                           0027C5     2 	LINK=.
      00A4B4                          3 SPIRD:
      00A4B4 CD                       4 	.byte 5+F_IFUNC 	
      00A4B5 96 B5 A1 01 27           5 	.ascii "SPIRD"
      00A4BA 03 CC                    6 	.word SPIRD_IDX 
      0027CD                       4563 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      00A4BC 92 11                    1 	.word LINK 
                           0027CF     2 	LINK=.
      00A4BE                          3 SPIEN:
      00A4BE 85                       4 	.byte 5 	
      00A4BF CF 00 12 81 4E           5 	.ascii "SPIEN"
      00A4C3 00 A0                    6 	.word SPIEN_IDX 
      0027D7                       4564 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00A4C3 CE 00                    1 	.word LINK 
                           0027D9     2 	LINK=.
      0027D9                          3 SLEEP:
      00A4C5 12                       4 	.byte 5 	
      00A4C6 53 4C 45 45 50           5 	.ascii "SLEEP"
      00A4C6 53 A3                    6 	.word SLEEP_IDX 
      0027E1                       4565     _dict_entry,4,SIZE,SIZE_IDX; cmd_size 
      00A4C8 FF FF                    1 	.word LINK 
                           0027E3     2 	LINK=.
      0027E3                          3 SIZE:
      00A4CA 27                       4 	.byte 4 	
      00A4CB 01 5F A6 84              5 	.ascii "SIZE"
      00A4CF 81 C4                    6 	.word SIZE_IDX 
      00A4D0                       4566 	_dict_entry,4,SHOW,SHOW_IDX;show 
      00A4D0 CD 96                    1 	.word LINK 
                           0027EC     2 	LINK=.
      0027EC                          3 SHOW:
      00A4D2 B0                       4 	.byte 4 	
      00A4D3 A1 01 27 03              5 	.ascii "SHOW"
      00A4D7 CC 92                    6 	.word SHOW_IDX 
      0027F3                       4567 	_dict_entry,4,SAVE,SAVE_IDX ;save_app 
      00A4D9 11 85                    1 	.word LINK 
                           0027F5     2 	LINK=.
      0027F5                          3 SAVE:
      00A4DB 20                       4 	.byte 4 	
      00A4DC E9 41 56 45              5 	.ascii "SAVE"
      00A4DD 00 36                    6 	.word SAVE_IDX 
      0027FC                       4568 	_dict_entry 3,RUN,RUN_IDX;run
      00A4DD CD 96                    1 	.word LINK 
                           0027FE     2 	LINK=.
      0027FE                          3 RUN:
      00A4DF B5                       4 	.byte 3 	
      00A4E0 A1 01 27                 5 	.ascii "RUN"
      00A4E3 03 CC                    6 	.word RUN_IDX 
      002804                       4569 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      00A4E5 92 11                    1 	.word LINK 
                           002806     2 	LINK=.
      002806                          3 RSHIFT:
      00A4E7 85                       4 	.byte 6+F_IFUNC 	
      00A4E8 4B 00 35 CC 50 E0        5 	.ascii "RSHIFT"
      00A4EE 9E A4                    6 	.word RSHIFT_IDX 
      00280F                       4570 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      00A4F0 3F 95                    1 	.word LINK 
                           002811     2 	LINK=.
      002811                          3 RND:
      00A4F2 A3                       4 	.byte 3+F_IFUNC 	
      00A4F3 00 FF 23                 5 	.ascii "RND"
      00A4F6 06 0C                    6 	.word RND_IDX 
      002817                       4571 	_dict_entry,6,RETURN,RET_IDX;return 
      00A4F8 01 98                    1 	.word LINK 
                           002819     2 	LINK=.
      002819                          3 RETURN:
      00A4FA 56                       4 	.byte 6 	
      00A4FB 20 F5 35 55 50 E0        5 	.ascii "RETURN"
      00A501 84 C7                    6 	.word RET_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      002822                       4572 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00A503 50 E1                    1 	.word LINK 
                           002824     2 	LINK=.
      002824                          3 RESTORE:
      00A505 9F                       4 	.byte 7 	
      00A506 4A 35 55 50 E0 C7 50     5 	.ascii "RESTORE"
      00A50D E2 35                    6 	.word REST_IDX 
      00282E                       4573 	_dict_entry 6,REMARK,REM_IDX;remark 
      00A50F AA 50                    1 	.word LINK 
                           002830     2 	LINK=.
      002830                          3 REMARK:
      00A511 E0                       4 	.byte 6 	
      00A512 81 45 4D 41 52 4B        5 	.ascii "REMARK"
      00A513 00 8C                    6 	.word REM_IDX 
      002839                       4574 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      00A513 35 AA                    1 	.word LINK 
                           00283B     2 	LINK=.
      00283B                          3 REBOOT:
      00A515 50                       4 	.byte 6 	
      00A516 E0 81 42 4F 4F 54        5 	.ascii "REBOOT"
      00A518 00 8A                    6 	.word RBT_IDX 
      002844                       4575 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      00A518 CD 96                    1 	.word LINK 
                           002846     2 	LINK=.
      002846                          3 READ:
      00A51A B0                       4 	.byte 4+F_IFUNC 	
      00A51B A1 01 27 03              5 	.ascii "READ"
      00A51F CC 92                    6 	.word READ_IDX 
      00284D                       4576 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      00A521 11 85                    1 	.word LINK 
                           00284F     2 	LINK=.
      00A523                          3 QKEY:
      00A523 5D                       4 	.byte 4+F_IFUNC 	
      00A524 27 0A A6 0F              5 	.ascii "QKEY"
      00A528 59 25                    6 	.word QKEY_IDX 
      002856                       4577 	_dict_entry,4+F_IFUNC,PRTI,PRTI_IDX;const_porti 
      00A52A 03 4A                    1 	.word LINK 
                           002858     2 	LINK=.
      002858                          3 PRTI:
      00A52C 20                       4 	.byte 4+F_IFUNC 	
      00A52D FA 5F 97 A6              5 	.ascii "PRTI"
      00A531 84 81                    6 	.word PRTI_IDX 
      00A533                       4578 	_dict_entry,4+F_IFUNC,PRTH,PRTH_IDX;const_porth 
      00A533 CD 96                    1 	.word LINK 
                           002861     2 	LINK=.
      002861                          3 PRTH:
      00A535 B0                       4 	.byte 4+F_IFUNC 	
      00A536 A1 01 27 03              5 	.ascii "PRTH"
      00A53A CC 92                    6 	.word PRTH_IDX 
      002868                       4579 	_dict_entry,4+F_IFUNC,PRTG,PRTG_IDX;const_portg 
      00A53C 11 85                    1 	.word LINK 
                           00286A     2 	LINK=.
      00286A                          3 PRTG:
      00A53E 9F                       4 	.byte 4+F_IFUNC 	
      00A53F A4 0F 5F 5C              5 	.ascii "PRTG"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



      00A543 4D 27                    6 	.word PRTG_IDX 
      002871                       4580 	_dict_entry,4+F_IFUNC,PRTF,PRTF_IDX;const_portf
      00A545 04 58                    1 	.word LINK 
                           002873     2 	LINK=.
      002873                          3 PRTF:
      00A547 4A                       4 	.byte 4+F_IFUNC 	
      00A548 20 F9 A6 84              5 	.ascii "PRTF"
      00A54C 81 7E                    6 	.word PRTF_IDX 
      00A54D                       4581 	_dict_entry,4+F_IFUNC,PRTE,PRTE_IDX;const_porte
      00A54D CD 96                    1 	.word LINK 
                           00287C     2 	LINK=.
      00287C                          3 PRTE:
      00A54F B0                       4 	.byte 4+F_IFUNC 	
      00A550 A1 01 27 03              5 	.ascii "PRTE"
      00A554 CC 92                    6 	.word PRTE_IDX 
      002883                       4582 	_dict_entry,4+F_IFUNC,PRTD,PRTD_IDX;const_portd
      00A556 11 85                    1 	.word LINK 
                           002885     2 	LINK=.
      002885                          3 PRTD:
      00A558 53                       4 	.byte 4+F_IFUNC 	
      00A559 A6 84 81 44              5 	.ascii "PRTD"
      00A55C 00 7A                    6 	.word PRTD_IDX 
      00288C                       4583 	_dict_entry,4+F_IFUNC,PRTC,PRTC_IDX;const_portc
      00A55C 85 52                    1 	.word LINK 
                           00288E     2 	LINK=.
      00288E                          3 PRTC:
      00A55E 04                       4 	.byte 4+F_IFUNC 	
      00A55F 89 90 CE 00              5 	.ascii "PRTC"
      00A563 05 17                    6 	.word PRTC_IDX 
      002895                       4584 	_dict_entry,4+F_IFUNC,PRTB,PRTB_IDX;const_portb
      00A565 03 90                    1 	.word LINK 
                           002897     2 	LINK=.
      002897                          3 PRTB:
      00A567 CE                       4 	.byte 4+F_IFUNC 	
      00A568 00 01 17 05              5 	.ascii "PRTB"
      00A56C 72 5C                    6 	.word PRTB_IDX 
      00289E                       4585 	_dict_entry,4+F_IFUNC,PRTA,PRTA_IDX;const_porta 
      00A56E 00 1F                    1 	.word LINK 
                           0028A0     2 	LINK=.
      0028A0                          3 PRTA:
      00A570 81                       4 	.byte 4+F_IFUNC 	
      00A571 50 52 54 41              5 	.ascii "PRTA"
      00A571 72 5D                    6 	.word PRTA_IDX 
      0028A7                       4586 	_dict_entry 5,PRINT,PRT_IDX;print 
      00A573 00 1F                    1 	.word LINK 
                           0028A9     2 	LINK=.
      0028A9                          3 PRINT:
      00A575 26                       4 	.byte 5 	
      00A576 03 CC 92 11 54           5 	.ascii "PRINT"
      00A57A 00 72                    6 	.word PRT_IDX 
      0028B1                       4587 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      00A57A CD 97                    1 	.word LINK 
                           0028B3     2 	LINK=.
      0028B3                          3 POUT:
      00A57C FD                       4 	.byte 4+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



      00A57D A1 84 27 03              5 	.ascii "POUT"
      00A581 CC 92                    6 	.word POUT_IDX 
      0028BA                       4588 	_dict_entry,4,POKE,POKE_IDX;poke 
      00A583 11 B3                    1 	.word LINK 
                           0028BC     2 	LINK=.
      00A584                          3 POKE:
      00A584 5D                       4 	.byte 4 	
      00A585 26 10 1E 03              5 	.ascii "POKE"
      00A589 CF 00                    6 	.word POKE_IDX 
      0028C3                       4589 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      00A58B 05 E6                    1 	.word LINK 
                           0028C5     2 	LINK=.
      0028C5                          3 PMODE:
      00A58D 02                       4 	.byte 5 	
      00A58E C7 00 04 1E 05           5 	.ascii "PMODE"
      00A593 CF 00                    6 	.word PMODE_IDX 
      0028CD                       4590 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      00A595 01 81                    1 	.word LINK 
                           0028CF     2 	LINK=.
      00A597                          3 PINP:
      00A597 85                       4 	.byte 4+F_IFUNC 	
      00A598 5B 04 72 5A              5 	.ascii "PINP"
      00A59C 00 1F                    6 	.word PINP_IDX 
      0028D6                       4591 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      00A59E FC CF                    1 	.word LINK 
                           0028D8     2 	LINK=.
      00A59F                          3 PEEK:
      00A59F AE                       4 	.byte 4+F_IFUNC 	
      00A5A0 00 00 A6 84              5 	.ascii "PEEK"
      00A5A4 81 6A                    6 	.word PEEK_IDX 
      00A5A5                       4592 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      00A5A5 AE 00                    1 	.word LINK 
                           0028E1     2 	LINK=.
      0028E1                          3 PAUSE:
      00A5A7 01                       4 	.byte 5 	
      00A5A8 A6 84 81 53 45           5 	.ascii "PAUSE"
      00A5AB 00 66                    6 	.word PAUSE_IDX 
      0028E9                       4593 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      00A5AB AE 00                    1 	.word LINK 
                           0028EB     2 	LINK=.
      0028EB                          3 PAD:
      00A5AD 02                       4 	.byte 3+F_IFUNC 	
      00A5AE A6 84 81                 5 	.ascii "PAD"
      00A5B1 00 64                    6 	.word PAD_IDX 
      0028F1                       4594 	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
      00A5B1 AE 00                    1 	.word LINK 
                           0028F3     2 	LINK=.
      0028F3                          3 OR:
      00A5B3 03                       4 	.byte 2+F_IFUNC 	
      00A5B4 A6 84                    5 	.ascii "OR"
      00A5B6 81 62                    6 	.word OR_IDX 
      00A5B7                       4595 	_dict_entry,2,ON,ON_IDX; cmd_on 
      00A5B7 AE 00                    1 	.word LINK 
                           0028FA     2 	LINK=.
      0028FA                          3 ON:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



      00A5B9 04                       4 	.byte 2 	
      00A5BA A6 84                    5 	.ascii "ON"
      00A5BC 81 C6                    6 	.word ON_IDX 
      00A5BD                       4596 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      00A5BD AE 00                    1 	.word LINK 
                           002901     2 	LINK=.
      002901                          3 ODR:
      00A5BF 05                       4 	.byte 3+F_IFUNC 	
      00A5C0 A6 84 81                 5 	.ascii "ODR"
      00A5C3 00 60                    6 	.word ODR_IDX 
      002907                       4597 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      00A5C3 AE 00                    1 	.word LINK 
                           002909     2 	LINK=.
      002909                          3 NOT:
      00A5C5 06                       4 	.byte 3+F_IFUNC 	
      00A5C6 A6 84 81                 5 	.ascii "NOT"
      00A5C9 00 5E                    6 	.word NOT_IDX 
      00290F                       4598 	_dict_entry,4,NEXT,NEXT_IDX;next 
      00A5C9 AE 00                    1 	.word LINK 
                           002911     2 	LINK=.
      002911                          3 NEXT:
      00A5CB 07                       4 	.byte 4 	
      00A5CC A6 84 81 54              5 	.ascii "NEXT"
      00A5CF 00 5A                    6 	.word NEXT_IDX 
      002918                       4599 	_dict_entry,3,NEW,NEW_IDX;new
      00A5CF AE 00                    1 	.word LINK 
                           00291A     2 	LINK=.
      00291A                          3 NEW:
      00A5D1 08                       4 	.byte 3 	
      00A5D2 A6 84 81                 5 	.ascii "NEW"
      00A5D5 00 5C                    6 	.word NEW_IDX 
      002920                       4600 	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
      00A5D5 A6 84                    1 	.word LINK 
                           002922     2 	LINK=.
      002922                          3 MULDIV:
      00A5D7 AE                       4 	.byte 6+F_IFUNC 	
      00A5D8 00 00 81 44 49 56        5 	.ascii "MULDIV"
      00A5DB 00 58                    6 	.word MULDIV_IDX 
      00292B                       4601 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      00A5DB A6 84                    1 	.word LINK 
                           00292D     2 	LINK=.
      00292D                          3 LSHIFT:
      00A5DD AE                       4 	.byte 6+F_IFUNC 	
      00A5DE 00 01 81 49 46 54        5 	.ascii "LSHIFT"
      00A5E1 00 56                    6 	.word LSHIFT_IDX 
      002936                       4602 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      00A5E1 A6 84                    1 	.word LINK 
                           002938     2 	LINK=.
      002938                          3 LOG:
      00A5E3 AE                       4 	.byte 3+F_IFUNC 	
      00A5E4 00 02 81                 5 	.ascii "LOG"
      00A5E7 00 54                    6 	.word LOG_IDX 
      00293E                       4603 	_dict_entry 4,LIST,LIST_IDX;list
      00A5E7 A6 84                    1 	.word LINK 
                           002940     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



      002940                          3 LIST:
      00A5E9 AE                       4 	.byte 4 	
      00A5EA 00 03 81 54              5 	.ascii "LIST"
      00A5ED 00 52                    6 	.word LIST_IDX 
      002947                       4604 	_dict_entry 3,LET,LET_IDX;let 
      00A5ED A6 84                    1 	.word LINK 
                           002949     2 	LINK=.
      002949                          3 LET:
      00A5EF AE                       4 	.byte 3 	
      00A5F0 00 04 81                 5 	.ascii "LET"
      00A5F3 00 50                    6 	.word LET_IDX 
      00294F                       4605 	_dict_entry,3+F_IFUNC,KEY,KEY_IDX;key 
      00A5F3 A6 84                    1 	.word LINK 
                           002951     2 	LINK=.
      002951                          3 KEY:
      00A5F5 AE                       4 	.byte 3+F_IFUNC 	
      00A5F6 00 01 81                 5 	.ascii "KEY"
      00A5F9 00 4E                    6 	.word KEY_IDX 
      002957                       4606 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      00A5F9 A6 84                    1 	.word LINK 
                           002959     2 	LINK=.
      002959                          3 IWDGREF:
      00A5FB AE                       4 	.byte 7 	
      00A5FC 00 00 81 47 52 45 46     5 	.ascii "IWDGREF"
      00A5FF 00 4C                    6 	.word IWDGREF_IDX 
      002963                       4607 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      00A5FF A6 84                    1 	.word LINK 
                           002965     2 	LINK=.
      002965                          3 IWDGEN:
      00A601 AE                       4 	.byte 6 	
      00A602 40 00 81 47 45 4E        5 	.ascii "IWDGEN"
      00A605 00 4A                    6 	.word IWDGEN_IDX 
      00296E                       4608 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      00A605 55 00                    1 	.word LINK 
                           002970     2 	LINK=.
      002970                          3 INVERT:
      00A607 04                       4 	.byte 6+F_IFUNC 	
      00A608 00 02 81 45 52 54        5 	.ascii "INVERT"
      00A60B 00 48                    6 	.word INVERT_IDX 
      002979                       4609 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      00A60B CD 97                    1 	.word LINK 
                           00297B     2 	LINK=.
      00297B                          3 INPUT:
      00A60D B4                       4 	.byte 5 	
      00A60E A1 84 27 03 CC           5 	.ascii "INPUT"
      00A613 92 11                    6 	.word INPUT_IDX 
      002983                       4610 	_dict_entry,2,IF,IF_IDX;if 
      00A615 4F CD                    1 	.word LINK 
                           002985     2 	LINK=.
      002985                          3 IF:
      00A617 86                       4 	.byte 2 	
      00A618 B6 5D                    5 	.ascii "IF"
      00A61A 26 05                    6 	.word IF_IDX 
      00298A                       4611 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      00A61C A6 05                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



                           00298C     2 	LINK=.
      00298C                          3 IDR:
      00A61E CC                       4 	.byte 3+F_IFUNC 	
      00A61F 92 13 52                 5 	.ascii "IDR"
      00A621 00 42                    6 	.word IDR_IDX 
      002992                       4612 	_dict_entry,3,HEX,HEX_IDX;hex_base
      00A621 90 93                    1 	.word LINK 
                           002994     2 	LINK=.
      002994                          3 HEX:
      00A623 EE                       4 	.byte 3 	
      00A624 04 A3 A6                 5 	.ascii "HEX"
      00A627 05 26                    6 	.word HEX_IDX 
      00299A                       4613 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      00A629 F2 90                    1 	.word LINK 
                           00299C     2 	LINK=.
      00299C                          3 GPIO:
      00A62B CF                       4 	.byte 4+F_IFUNC 	
      00A62C 00 07 90 E6              5 	.ascii "GPIO"
      00A630 02 C7                    6 	.word GPIO_IDX 
      0029A3                       4614 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      00A632 00 0A                    1 	.word LINK 
                           0029A5     2 	LINK=.
      0029A5                          3 GOTO:
      00A634 35                       4 	.byte 4 	
      00A635 06 00 09 81              5 	.ascii "GOTO"
      00A639 00 3C                    6 	.word GOTO_IDX 
      0029AC                       4615 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      00A639 72 5F                    1 	.word LINK 
                           0029AE     2 	LINK=.
      0029AE                          3 GOSUB:
      00A63B 00                       4 	.byte 5 	
      00A63C 07 72 5F 00 08           5 	.ascii "GOSUB"
      00A641 72 5F                    6 	.word GOSUB_IDX 
      0029B6                       4616 	_dict_entry,3,GET,GET_IDX; cmd_get 
      00A643 00 09                    1 	.word LINK 
                           0029B8     2 	LINK=.
      0029B8                          3 GET:
      00A645 72                       4 	.byte 3 	
      00A646 5F 00 0A                 5 	.ascii "GET"
      00A649 CE 00                    6 	.word GET_IDX 
      0029BE                       4617 	_dict_entry,4+F_IFUNC,FREE,FREE_IDX;free
      00A64B 1B B8                    1 	.word LINK 
                           0029C0     2 	LINK=.
      00A64C                          3 FREE:
      00A64C C3                       4 	.byte 4+F_IFUNC 	
      00A64D 00 1D 24 1B              5 	.ascii "FREE"
      00A651 90 93                    6 	.word FREE_IDX 
      0029C7                       4618 	_dict_entry,3,FOR,FOR_IDX;for 
      00A653 EE 04                    1 	.word LINK 
                           0029C9     2 	LINK=.
      0029C9                          3 FOR:
      00A655 1C                       4 	.byte 3 	
      00A656 AB 43 FE                 5 	.ascii "FOR"
      00A659 A3 A6                    6 	.word FOR_IDX 
      0029CF                       4619 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



      00A65B 05 26                    1 	.word LINK 
                           0029D1     2 	LINK=.
      0029D1                          3 FCPU:
      00A65D 1A                       4 	.byte 4 	
      00A65E 90 CF 00 07              5 	.ascii "FCPU"
      00A662 90 E6                    6 	.word FCPU_IDX 
      0029D8                       4620 	_dict_entry,5,ERASE,ERASE_IDX; erase 
      00A664 02 C7                    1 	.word LINK 
                           0029DA     2 	LINK=.
      0029DA                          3 ERASE:
      00A666 00                       4 	.byte 5 	
      00A667 0A 35 06 00 09           5 	.ascii "ERASE"
      00A66C 72 5D                    6 	.word ERASE_IDX 
      0029E2                       4621 	_dict_entry,3,END,END_IDX;cmd_end  
      00A66E 00 0A                    1 	.word LINK 
                           0029E4     2 	LINK=.
      0029E4                          3 END:
      00A670 26                       4 	.byte 3 	
      00A671 05 A6 0C                 5 	.ascii "END"
      00A674 CC 92                    6 	.word END_IDX 
      0029EA                       4622 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      00A676 13 81                    1 	.word LINK 
                           0029EC     2 	LINK=.
      00A678                          3 EEPROM:
      00A678 93                       4 	.byte 6+F_IFUNC 	
      00A679 E6 02 C7 00 0F 72        5 	.ascii "EEPROM"
      00A67F 5F 00                    6 	.word EEPROM_IDX 
      0029F5                       4623 	_dict_entry,4,EDIT,EDIT_IDX ; edit 
      00A681 0E 72                    1 	.word LINK 
                           0029F7     2 	LINK=.
      0029F7                          3 EDIT:
      00A683 BB                       4 	.byte 4 	
      00A684 00 0E 20 C4              5 	.ascii "EDIT"
      00A688 00 2C                    6 	.word EDIT_IDX 
      0029FE                       4624 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      00A688 52 06                    1 	.word LINK 
                           002A00     2 	LINK=.
      00A68A                          3 DWRITE:
      00A68A C6                       4 	.byte 6+F_CMD 	
      00A68B 00 09 C1 00 0A 27        5 	.ascii "DWRITE"
      00A691 37 CD                    6 	.word DWRITE_IDX 
      002A09                       4625 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      00A693 9A AA                    1 	.word LINK 
                           002A0B     2 	LINK=.
      002A0B                          3 DREAD:
      00A695 CE                       4 	.byte 5+F_IFUNC 	
      00A696 00 07 CF 00 05           5 	.ascii "DREAD"
      00A69B 55 00                    6 	.word DREAD_IDX 
      002A13                       4626 	_dict_entry,2,DO,DO_IDX;do_loop
      00A69D 09 00                    1 	.word LINK 
                           002A15     2 	LINK=.
      002A15                          3 DO:
      00A69F 02                       4 	.byte 2 	
      00A6A0 55 00                    5 	.ascii "DO"
      00A6A2 0A 00                    6 	.word DO_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



      002A1A                       4627 	_dict_entry,3,DEC,DEC_IDX;dec_base
      00A6A4 04 CD                    1 	.word LINK 
                           002A1C     2 	LINK=.
      002A1C                          3 DEC:
      00A6A6 97                       4 	.byte 3 	
      00A6A7 B4 A1 84                 5 	.ascii "DEC"
      00A6AA 27 03                    6 	.word DEC_IDX 
      002A22                       4628 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      00A6AC CC 92                    1 	.word LINK 
                           002A24     2 	LINK=.
      002A24                          3 DDR:
      00A6AE 11                       4 	.byte 3+F_IFUNC 	
      00A6AF 44 44 52                 5 	.ascii "DDR"
      00A6AF 1F 05                    6 	.word DDR_IDX 
      002A2A                       4629 	_dict_entry,6,DATALN,DATALN_IDX;data_line  
      00A6B1 CD 93                    1 	.word LINK 
                           002A2C     2 	LINK=.
      002A2C                          3 DATALN:
      00A6B3 09                       4 	.byte 6 	
      00A6B4 CE 00 05 CF 00 07        5 	.ascii "DATALN"
      00A6BA 55 00                    6 	.word DATALN_IDX 
      002A35                       4630 	_dict_entry,4,DATA,DATA_IDX;data  
      00A6BC 02 00                    1 	.word LINK 
                           002A37     2 	LINK=.
      002A37                          3 DATA:
      00A6BE 09                       4 	.byte 4 	
      00A6BF CD 9A BA 1E              5 	.ascii "DATA"
      00A6C3 05 A6                    6 	.word DATA_IDX 
      002A3E                       4631 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      00A6C5 84 5B                    1 	.word LINK 
                           002A40     2 	LINK=.
      002A40                          3 CRL:
      00A6C7 06                       4 	.byte 3+F_IFUNC 	
      00A6C8 81 52 4C                 5 	.ascii "CRL"
      00A6C9 00 1C                    6 	.word CRL_IDX 
      002A46                       4632 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      00A6C9 90 CE                    1 	.word LINK 
                           002A48     2 	LINK=.
      002A48                          3 CRH:
      00A6CB 00                       4 	.byte 3+F_IFUNC 	
      00A6CC 07 72 5F                 5 	.ascii "CRH"
      00A6CF 00 07                    6 	.word CRH_IDX 
      002A4E                       4633 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      00A6D1 72 5F                    1 	.word LINK 
                           002A50     2 	LINK=.
      002A50                          3 CHAR:
      00A6D3 00                       4 	.byte 4+F_CFUNC 	
      00A6D4 08 72 5F 00              5 	.ascii "CHAR"
      00A6D8 09 72                    6 	.word CHAR_IDX 
      002A57                       4634 	_dict_entry,3,BYE,BYE_IDX;bye 
      00A6DA 5F 00                    1 	.word LINK 
                           002A59     2 	LINK=.
      002A59                          3 BYE:
      00A6DC 0A                       4 	.byte 3 	
      00A6DD CD A6 78                 5 	.ascii "BYE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



      00A6E0 20 A8                    6 	.word BYE_IDX 
      00A6E2                       4635 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      00A6E2 CD 96                    1 	.word LINK 
                           002A61     2 	LINK=.
      002A61                          3 BTOGL:
      00A6E4 B5                       4 	.byte 5 	
      00A6E5 A1 02 27 03 CC           5 	.ascii "BTOGL"
      00A6EA 92 11                    6 	.word BTOGL_IDX 
      00A6EC                       4636 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      00A6EC 72 12                    1 	.word LINK 
                           002A6B     2 	LINK=.
      002A6B                          3 BTEST:
      00A6EE 50                       4 	.byte 5+F_IFUNC 	
      00A6EF C7 85 5D 27 21           5 	.ascii "BTEST"
      00A6F4 85 A6                    6 	.word BTEST_IDX 
      002A73                       4637 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      00A6F6 08 42                    1 	.word LINK 
                           002A75     2 	LINK=.
      002A75                          3 BSET:
      00A6F8 9F                       4 	.byte 4 	
      00A6F9 C7 52 00 72              5 	.ascii "BSET"
      00A6FD 1A 50                    6 	.word BSET_IDX 
      002A7C                       4638 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      00A6FF 14 72                    1 	.word LINK 
                           002A7E     2 	LINK=.
      002A7E                          3 BRES:
      00A701 1A                       4 	.byte 4 	
      00A702 50 16 72 14              5 	.ascii "BRES"
      00A706 52 00                    6 	.word BRES_IDX 
      002A85                       4639 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      00A708 72 12                    1 	.word LINK 
                           002A87     2 	LINK=.
      002A87                          3 BIT:
      00A70A 52                       4 	.byte 3+F_IFUNC 	
      00A70B 01 72 10                 5 	.ascii "BIT"
      00A70E 52 01                    6 	.word BIT_IDX 
      002A8D                       4640 	_dict_entry,3,AWU,AWU_IDX;awu 
      00A710 72 1C                    1 	.word LINK 
                           002A8F     2 	LINK=.
      002A8F                          3 AWU:
      00A712 52                       4 	.byte 3 	
      00A713 00 81 55                 5 	.ascii "AWU"
      00A715 00 0A                    6 	.word AWU_IDX 
      002A95                       4641 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      00A715 5B 02                    1 	.word LINK 
                           002A97     2 	LINK=.
      002A97                          3 ASC:
      00A717 A6                       4 	.byte 3+F_IFUNC 	
      00A718 82 C4 52                 5 	.ascii "ASC"
      00A71B 03 A1                    6 	.word ASC_IDX 
      002A9D                       4642 	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
      00A71D 02 26                    1 	.word LINK 
                           002A9F     2 	LINK=.
      002A9F                          3 AND:
      00A71F F7                       4 	.byte 3+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



      00A720 72 1D 52                 5 	.ascii "AND"
      00A723 00 72                    6 	.word AND_IDX 
      002AA5                       4643 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      00A725 13 50                    1 	.word LINK 
                           002AA7     2 	LINK=.
      002AA7                          3 ADCREAD:
      00A727 C7                       4 	.byte 7+F_IFUNC 	
      00A728 72 1B 50 16 81 41 44     5 	.ascii "ADCREAD"
      00A72D 00 04                    6 	.word ADCREAD_IDX 
      002AB1                       4644 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      00A72D A6 78                    1 	.word LINK 
                           002AB3     2 	LINK=.
      002AB3                          3 ADCON:
      00A72F C5                       4 	.byte 5 	
      00A730 52 03 27 04 72           5 	.ascii "ADCON"
      00A735 5F 52                    6 	.word ADCON_IDX 
      002ABB                       4645 kword_dict::
      002ABB                       4646 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      00A737 03 81                    1 	.word LINK 
                           002ABD     2 	LINK=.
      00A739                          3 ABS:
      00A739 88                       4 	.byte 3+F_IFUNC 	
      00A73A CD A7 2D                 5 	.ascii "ABS"
      00A73D 84 72                    6 	.word ABS_IDX 
                                   4647 
                                   4648 ;comands and fonctions address table 	
      002AC3                       4649 code_addr::
      00A73F 03 52 03 FB C7 52 04  4650 	.word abs,power_adc,analog_read,bit_and,ascii,awu,bitmask ; 0..7
             72 01 52 03 FB C6 52
      00A74D 04 81 1A EF 1B 20 1B  4651 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             10 21 DB 21 30 25 6D
      00A74F 25 67 25 85 25 8B 25  4652 	.word const_cr1,data,data_line,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
             61 18 1B 24 DC 1E DD
             1F 0D
      00A74F A6 FF 72 01 52 03 E3  4653 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto,gpio ; 24..31 
             C6 52 04 81 41 1B 7B
             1D 60 1D 46 21 7E
      00A75A 18 16 25 5B 1B 67 1A  4654 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             4A 24 CD 24 5D 24 93
             21 69
      00A75A CD 97 B4 A1 84 27 03  4655 	.word let,list,log2,lshift,muldiv,next,new ; 40..47
             CC 92 11 1B FB 1F 94
      00A764 24 50 25 55 22 7D 27  4656 	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             19 21 EF 22 EB 1B 56
             25 79
      00A764 9F CD A7 39 CD 93 09  4657 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             A1 09 26 02 20 E9 4D
             27 05
      00A774 55 00 03 00 02 81 25  4658 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             4F 21 71 26 08 0E D6
             1A C4
      00A77A 25 B9 1D 80 23 67 22  4659 	.word restore,return, random,rshift,run,show,free ; 72..79
             C6 1D 9E 17 D5 18 20
      00A77A CD A7 4F 5F 97 A6 84  4660 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             81 26 DA 1B D4 1F 48
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



             22 4B
      00A782 24 34 24 43 1B A4 1E  4661 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             29 18 8E 21 A8 24 F1
             21 BE
      00A782 CD 93 09 A1 84 27 03  4662 	.word wait,words,write,bit_xor,cmd_size,cmd_on,cmd_get ; 96..99
             CC 92 11 5D 27 05 72
      00A790 1B 50                 4663 	.word 0 
                                   4664 
                                   4665 
                                   4666 
                                   4667 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
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
      002C00                         28 	.bndry 128 ; align on FLASH block.
                                     29 ; space for user application  
      002C00                         30 app_space::
      00A792 14 81                   31 app_sign: .word 0 ; .ascii "BC"  ; signature 
      00A794 00 00                   32 app_size: .word 0 ; 31 
      002C04                         33 app: 
                                     34 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     35 ;;  BASIC code demo 'BLINK.BAS' 
                                     36 ;; 10 do btogl $500a,32 pause 250 until qkey bres $500a,32 end 
                                     37 ;; byte code generated by compiler.
                                     38 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     39 ;.byte 0,10,31,128,0,38,128,0,20,132,80,10,9,132,0,32,128
                                     40 ;.byte 0,100,132,0,250,128,0,182,129,0,132,128,0,46
                                     41 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   4 ABS        002ABD R   |     ABS_IDX =  000000 
    ACC24   =  000007     |     ACK     =  000006     |   4 ADCON      002AB3 R
    ADCON_ID=  000002     |   4 ADCREAD    002AA7 R   |     ADCREAD_=  000004 
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
  4 AND        002A9F R   |     AND_IDX =  000006     |     AREG    =  000002 
    ARG_OFS =  000002     |     ARROW_LE=  000080     |     ARROW_RI=  000081 
  4 ASC        002A97 R   |     ASC_IDX =  000008     |     ATTRIB  =  000002 
    AUTORUN_=  004000     |   4 AWU        002A8F R   |   4 AWUHandl   000001 R
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
    BELL    =  000007     |     BINARY  =  000001     |   4 BIT        002A87 R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000C 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  00000B     |   4 BRES       002A7E R   |     BRES_IDX=  00000E 
    BS      =  000008     |     BSAVE   =  000001     |   4 BSET       002A75 R
    BSET_IDX=  000010     |     BSIZE   =  000006     |   4 BTEST      002A6B R
    BTEST_ID=  000012     |   4 BTOGL      002A61 R   |     BTOGL_ID=  000014 
    BTW     =  000001     |   4 BYE        002A59 R   |     BYE_IDX =  000016 
    C       =  000001     |     CAN     =  000018     |   4 CANT_DO    0020A4 R
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
  4 CHAR       002A50 R   |     CHAR_IDX=  000018     |     CLKOPT  =  004807 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
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
    CPU_YL  =  007F07     |     CR      =  00000D     |   4 CRH        002A48 R
    CRH_IDX =  00001A     |   4 CRL        002A40 R   |     CRL_IDX =  00001C 
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
    CX_CNT  =  000004     |     CX_IN   =  000003     |   4 DATA       002A37 R
  4 DATALN     002A2C R   |     DATALN_I=  000020     |     DATA_IDX=  00001E 
    DBG_A   =  000005     |     DBG_CC  =  000006     |     DBG_X   =  000003 
    DBG_Y   =  000001     |     DBL     =  000003     |     DBLDIVDN=  000006 
    DBLHI   =  000001     |     DBLLO   =  000003     |     DBL_SIZE=  000004 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   4 DDR        002A24 R   |     DDR_IDX =  000022 
    DEBUG   =  000000     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
    DEBUG_PR=  000001     |   4 DEC        002A1C R   |     DEC_IDX =  000024 
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
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   4 DO         002A15 R
    DOLP_ADR=  000003     |     DOLP_INW=  000005     |     DO_IDX  =  000026 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]

Symbol Table

  4 DREAD      002A0B R   |     DREAD_ID=  000028     |   4 DWRITE     002A00 R
    DWRITE_I=  00002A     |   4 EDIT       0029F7 R   |     EDIT_IDX=  00002C 
  4 EEPROM     0029EC R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_I=  00002E     |     EEPROM_S=  000800     |     EM      =  000019 
  4 END        0029E4 R   |     END_IDX =  000030     |     ENQ     =  000005 
    EOF     =  0000FF     |     EOT     =  000004     |   4 ERASE      0029DA R
    ERASE_ID=  000032     |     ERR_BAD_=  00000A     |     ERR_BUF_=  00000F 
    ERR_CMD_=  000007     |     ERR_DIV0=  000004     |     ERR_DUPL=  000008 
    ERR_MATH=  000003     |     ERR_MEM_=  000001     |     ERR_NONE=  000000 
    ERR_NOT_=  000009     |     ERR_NO_A=  00000B     |     ERR_NO_D=  00000C 
    ERR_NO_F=  00000E     |     ERR_NO_L=  000005     |     ERR_NO_P=  00000D 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    ETB     =  000017     |     ETX     =  000003     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FAUTORUN=  000006     |     FBREAK  =  000004 
    FCOMP   =  000005     |   4 FCPU       0029D1 R   |     FCPU_IDX=  000034 
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
    FLSI    =  01F400     |   4 FOR        0029C9 R   |     FOR_IDX =  000038 
  4 FREE       0029C0 R   |     FREE_IDX=  00009A     |     FRUN    =  000000 
    FS      =  00001C     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_CFUNC =  000080     |     F_CMD   =  000000 
    F_CONST =  0000C0     |     F_IFUNC =  000040     |   4 GET        0029B8 R
    GET_IDX =  0000C8     |   4 GOSUB      0029AE R   |     GOSUB_ID=  00003A 
  4 GOTO       0029A5 R   |     GOTO_IDX=  00003C     |   4 GPIO       00299C R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_IDX=  00003E 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |     GS      =  00001D 
  4 HEX        002994 R   |     HEX_IDX =  000040     |     HOME    =  000082 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]

Symbol Table

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
    I2C_WRIT=  000000     |   4 IDR        00298C R   |     IDR_IDX =  000042 
  4 IF         002985 R   |     IF_IDX  =  000044     |     IN      =  000005 
    INCR    =  000001     |     INP     =  000000     |   4 INPUT      00297B R
    INPUT_DI=  000000     |     INPUT_EI=  000001     |     INPUT_FL=  000000 
    INPUT_ID=  000046     |     INPUT_PU=  000001     |     INT_ADC2=  000016 
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
  4 INVERT     002970 R   |     INVERT_I=  000048     |     INW     =  000009 
    IPOS    =  000001     |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
  4 IWDGEN     002965 R   |     IWDGEN_I=  00004A     |   4 IWDGREF    002959 R
    IWDGREF_=  00004C     |     IWDG_KEY=  000055     |     IWDG_KEY=  0000CC 
    IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |     KCHAR   =  000002     |   4 KEY        002951 R
    KEY_END =  000083     |     KEY_IDX =  00004E     |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000002     |   4 LET        002949 R
    LET_IDX =  000050     |     LF      =  00000A     |     LIMIT   =  000001 
    LINENO  =  000005     |   4 LINK    =  002ABD R   |   4 LIST       002940 R
    LIST_IDX=  000052     |     LL      =  000001     |     LLEN    =  000002 
    LL_HB   =  000001     |     LN_PTR  =  000005     |   4 LOG        002938 R
    LOG_IDX =  000054     |   4 LSHIFT     00292D R   |     LSHIFT_I=  000056 
    MAJOR   =  000002     |     MASK    =  000002     |     MATH_OVF=  000000 
    MAX_LINE=  007FFF     |     MINOR   =  000000     |   4 MULDIV     002922 R
    MULDIV_I=  000058     |     MULOP   =  000003     |     N1      =  000001 
    N2      =  000003     |     NAFR    =  004804     |     NAK     =  000015 
    NCLKOPT =  004808     |     NEG     =  000001     |   4 NEW        00291A R
    NEW_IDX =  00005C     |   4 NEXT       002911 R   |     NEXT_IDX=  00005A 
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NLEN    =  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]

Symbol Table

    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   4 NOT        002909 R
    NOT_IDX =  00005E     |   4 NOT_SAVE   00198D R   |   4 NO_APP     0020E3 R
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  4 NonHandl   000000 R   |   4 ODR        002901 R   |     ODR_IDX =  000060 
  4 ON         0028FA R   |     ONOFF   =  000003     |     ON_IDX  =  0000C6 
    OP      =  000005     |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   4 OR         0028F3 R
    OR_IDX  =  000062     |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVFH    =  000001     |     OVFL    =  000002     |     OVRWR   =  000004 
    PA      =  000000     |   4 PAD        0028EB R   |     PAD_IDX =  000064 
    PAD_SIZE=  000080     |   4 PAUSE      0028E1 R   |     PAUSE_ID=  000066 
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   4 PEEK       0028D8 R   |     PEEK_IDX=  00006A 
    PE_BASE =  005014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_BASE =  005019     |     PF_CR1  =  00501C 
    PF_CR2  =  00501D     |     PF_DDR  =  00501B     |     PF_IDR  =  00501A 
    PF_ODR  =  005019     |     PG      =  00001E     |     PG_BASE =  00501E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |     PH      =  000023 
    PH_BASE =  005023     |     PH_CR1  =  005026     |     PH_CR2  =  005027 
    PH_DDR  =  005025     |     PH_IDR  =  005024     |     PH_ODR  =  005023 
    PI      =  000028     |     PINNO   =  000001     |   4 PINP       0028CF R
    PINP_IDX=  00006C     |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   4 PMODE      0028C5 R
    PMODE_ID=  000068     |   4 POKE       0028BC R   |     POKE_IDX=  00006E 
    PORT    =  000003     |   4 POUT       0028B3 R   |     POUT_IDX=  000070 
    PREV    =  000001     |   4 PRINT      0028A9 R   |   4 PROG_ADD   001866 R
  4 PROG_SIZ   001878 R   |   4 PRTA       0028A0 R   |     PRTA_IDX=  000074 
  4 PRTB       002897 R   |     PRTB_IDX=  000076     |   4 PRTC       00288E R
    PRTC_IDX=  000078     |   4 PRTD       002885 R   |     PRTD_IDX=  00007A 
  4 PRTE       00287C R   |     PRTE_IDX=  00007C     |   4 PRTF       002873 R
    PRTF_IDX=  00007E     |   4 PRTG       00286A R   |     PRTG_IDX=  000080 
  4 PRTH       002861 R   |     PRTH_IDX=  000082     |   4 PRTI       002858 R
    PRTI_IDX=  000084     |     PRT_IDX =  000072     |     PSTR    =  000003 
  4 QKEY       00284F R   |     QKEY_IDX=  000086     |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |     RBT_IDX =  00008A 
  4 READ       002846 R   |     READ_IDX=  000088     |   4 REBOOT     00283B R
    REG     =  000001     |     REGA    =  000001     |     REGX    =  000003 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]

Symbol Table

    REGY    =  000005     |     RELOP   =  000003     |   4 REMARK     002830 R
    REM_IDX =  00008C     |   4 RESTORE    002824 R   |     REST_IDX=  00008E 
    RETL1   =  000001     |   4 RETURN     002819 R   |     RET_ADDR=  000003 
    RET_IDX =  000090     |     RET_INW =  000005     |   4 RND        002811 R
    RND_IDX =  000092     |     ROP     =  004800     |     RS      =  00001E 
  4 RSHIFT     002806 R   |     RSHIFT_I=  000094     |     RST_SR  =  0050B3 
  4 RUN        0027FE R   |   4 RUNNING    000FB9 R   |     RUN_IDX =  000096 
    RXCHAR  =  000001     |     RX_QUEUE=  000008     |   4 SAVE       0027F5 R
    SAVEB   =  000002     |     SAVE_IDX=  000036     |     SDIVSR  =  000005 
    SEPARATE=  000000     |     SFR_BASE=  005000     |     SFR_END =  0057FF 
    SHARP   =  000023     |   4 SHOW       0027EC R   |     SHOW_IDX=  000098 
    SI      =  00000F     |     SIGN    =  000001     |   4 SIGNATUR   0020A2 R
  4 SIZE       0027E3 R   |     SIZE_IDX=  0000C4     |     SKIP    =  000005 
  4 SLEEP      0027D9 R   |     SLEEP_ID=  00009C     |     SO      =  00000E 
    SOH     =  000001     |     SPACE   =  000020     |   4 SPIEN      0027CF R
    SPIEN_ID=  0000A0     |   4 SPIRD      0027C5 R   |     SPIRD_ID=  00009E 
  4 SPISEL     0027BA R   |     SPISEL_I=  0000A2     |   4 SPIWR      0027B0 R
    SPIWR_ID=  0000A4     |     SPI_CR1 =  005200     |     SPI_CR1_=  000003 
    SPI_CR1_=  000000     |     SPI_CR1_=  000001     |     SPI_CR1_=  000007 
    SPI_CR1_=  000002     |     SPI_CR1_=  000006     |     SPI_CR2 =  005201 
    SPI_CR2_=  000007     |     SPI_CR2_=  000006     |     SPI_CR2_=  000005 
    SPI_CR2_=  000004     |     SPI_CR2_=  000002     |     SPI_CR2_=  000000 
    SPI_CR2_=  000001     |     SPI_CRCP=  005205     |     SPI_CS_B=  000005 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_SR_B=  000007     |     SPI_SR_C=  000004 
    SPI_SR_M=  000005     |     SPI_SR_O=  000006     |     SPI_SR_R=  000000 
    SPI_SR_T=  000001     |     SPI_SR_W=  000003     |     SPI_TXCR=  005207 
    SQUOT   =  000006     |     SRC     =  000003     |     STACK_EM=  0017FF 
    STACK_SI=  0000A0     |   4 STEP       0027A7 R   |     STEP_IDX=  0000A6 
  4 STOP       00279E R   |     STOP_IDX=  0000A8     |     STR     =  000003 
  4 STR_BYTE   001887 R   |     STX     =  000002     |     SUB     =  00001A 
    SUP     =  000084     |     SWIM_CSR=  007F80     |     SYN     =  000016 
    TAB     =  000009     |     TABW    =  000004     |     TAB_WIDT=  000004 
    TCHAR   =  000001     |     TEMP    =  000003     |     TIB_SIZE=  000050 
    TICK    =  000027     |   4 TICKS      002794 R   |     TICKS_ID=  0000AA 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_PSC=  000006     |     TIM4_PSC=  000003     |     TIM4_PSC=  000000 
    TIM4_PSC=  000001     |     TIM4_PSC=  000002     |     TIM4_SR =  005342 
    TIM4_SR_=  000000     |   4 TIMEOUT    002788 R   |   4 TIMER      00277E R
    TIMER_ID=  0000AC     |     TIM_CR1_=  000007     |     TIM_CR1_=  000000 
    TIM_CR1_=  000006     |     TIM_CR1_=  000005     |     TIM_CR1_=  000004 
    TIM_CR1_=  000003     |     TIM_CR1_=  000001     |     TIM_CR1_=  000002 
    TK_ARRAY=  000006     |     TK_CFUNC=  000082     |     TK_CHAR =  000003 
    TK_CMD  =  000080     |     TK_COLON=  00000B     |     TK_COMMA=  000009 
    TK_CONST=  000083     |     TK_DIV  =  000021     |     TK_EQUAL=  000032 
    TK_GE   =  000033     |     TK_GRP_A=  000010     |     TK_GRP_M=  000030 
    TK_GRP_M=  000000     |     TK_GRP_M=  000020     |     TK_GRP_R=  000030 
    TK_GT   =  000031     |     TK_IFUNC=  000081     |     TK_INTGR=  000084 
    TK_LABEL=  000001     |     TK_LE   =  000036     |     TK_LPARE=  000007 
    TK_LT   =  000034     |     TK_MINUS=  000011     |     TK_MOD  =  000022 
    TK_MULT =  000020     |     TK_NE   =  000035     |     TK_NONE =  000000 
    TK_PLUS =  000010     |     TK_QSTR =  000002     |     TK_RPARE=  000008 
    TK_SHARP=  00000A     |     TK_TARGE=  000004     |     TK_VAR  =  000085 
    TMROUT_I=  0000AE     |   4 TO         002777 R   |   4 TONE       00276E R
    TONE_IDX=  0000B2     |     TO_IDX  =  0000B0     |   4 Timer4Up   00000F R
    U1      =  000001     |     U8      =  000003     |     UART1   =  000000 
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
    UART_SR_=  000007     |     UBC     =  004801     |   4 UBOUND     002763 R
    UBOUND_I=  0000B4     |   4 UBTN_Han   000048 R   |   4 UFLASH     002758 R
    UFLASH_I=  0000B6     |   4 UNTIL      00274E R   |     UNTIL_ID=  0000B8 
    US      =  00001F     |   4 USER_ABO   00005B R   |   4 USR        002746 R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]

Symbol Table

    USR_IDX =  0000BA     |   4 Uart1RxH   00027F R   |   4 UserButt   000024 R
    VAR_ADDR=  000006     |     VSISE   =  000003     |     VSIZ    =  000002 
    VSIZE   =  000006     |     VT      =  00000B     |   4 WAIT       00273D R
    WAIT_IDX=  0000BC     |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  4 WORDS      002733 R   |     WORDS_ID=  0000BE     |   4 WRITE      002729 R
    WRITE_ID=  0000C0     |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XFIRST  =  000001     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   4 XOR        002721 R   |     XOR_IDX =  0000C2 
    XREG    =  000003     |     XSAVE   =  000005     |     YSAVE   =  000004 
  4 abs        002251 R   |   5 acc16      00000D GR  |   5 acc24      00000C GR
  5 acc32      00000B R   |   5 acc8       00000E GR  |   4 accept_c   0005BA R
  4 add_char   000D0D R   |   4 add_spac   000B03 R   |   4 analog_r   001EA9 R
  4 app        002C04 R   |   4 app_sign   002C00 R   |   4 app_size   002C02 R
  4 app_spac   002C00 GR  |   4 arduino_   002347 R   |   4 arg_list   001635 R
  5 array_si   00001F R   |   4 ascii      002142 R   |   4 at_tst     000971 R
  4 atoi24     0013EF GR  |   4 atoi_exi   001455 R   |   4 awu        002202 R
  4 awu02      00220C R   |   4 bad_port   0021A3 R   |   5 base       00000A GR
  5 basicptr   000004 GR  |   4 beep       001E36 R   |   4 beep_1kh   001E20 GR
  4 bin_exit   0007ED R   |   4 bit_and    002265 R   |   4 bit_or     00227D R
  4 bit_rese   001AFF R   |   4 bit_set    001AEF R   |   4 bit_test   001B20 R
  4 bit_togg   001B10 R   |   4 bit_xor    002295 R   |   4 bitmask    0024B3 R
  4 bkslsh_t   00091E R   |   4 bksp       000358 R   |   4 block_er   00018F R
  4 break_po   001F76 R   |   4 bye        0021DB R   |   4 char       002130 R
  4 clear_ba   000FF9 R   |   4 clear_va   000E7C R   |   4 clock_in   000076 R
  4 cmd_end    001DF7 R   |   4 cmd_get    001DFE R   |   4 cmd_line   001218 R
  4 cmd_name   000D2D R   |   4 cmd_on     001CBD R   |   4 cmd_size   001839 R
  4 code_add   002AC3 GR  |   4 cold_sta   000ED6 R   |   4 colon_ts   000945 R
  4 comma_ts   000950 R   |   4 comp_msg   001170 R   |   4 compile    000A76 GR
  4 const_cr   002567 R   |   4 const_cr   00256D R   |   4 const_dd   002561 R
  4 const_ee   00257F R   |   4 const_id   00255B R   |   4 const_in   002579 R
  4 const_od   002555 R   |   4 const_ou   002573 R   |   4 const_po   00251F R
  4 const_po   002525 R   |   4 const_po   00252B R   |   4 const_po   002531 R
  4 const_po   002537 R   |   4 const_po   00253D R   |   4 const_po   002543 R
  4 const_po   002549 R   |   4 const_po   00254F R   |   4 convert_   000764 R
  4 convert_   00031C R   |   4 copy_com   0009A6 R   |   5 count      000003 GR
  4 cp_loop    0015E4 R   |   4 cpy_cmd_   000AEE R   |   4 cpy_quot   000B27 R
  4 create_g   00068E R   |   4 cs_high    002714 R   |   4 cstk_pro   0017EF R
  4 dash_tst   000966 R   |   4 data       002585 R   |   5 data_len   000009 R
  4 data_lin   00258B R   |   5 data_ofs   000008 R   |   5 data_ptr   000006 R
  4 data_sea   0025CC R   |   4 dbl_sign   00153E R   |   4 dec_base   00181B R
  4 decomp_l   000BD8 R   |   4 decompil   000B91 GR  |   4 del_line   000661 R
  4 delete_l   000445 R   |   4 delete_n   000368 R   |   4 delete_u   00040A R
  4 digital_   001EDD R   |   4 digital_   001F0D R   |   4 div32_16   001548 R
  4 divide     00159F R   |   4 divu24_8   00135E R   |   4 dneg       001533 R
  4 do_loop    0024DC R   |   4 do_progr   000182 R   |   4 edit       001960 R
  4 eefree     00026C R   |   4 enable_i   00245D R   |   4 eql_tst    0009FB R
  4 equal      000D20 R   |   4 erase      001FD5 R   |   4 erase_ex   0001AE R
  4 erase_fl   0001A4 R   |   4 err_bad_   0010DB R   |   4 err_buf_   001151 R
  4 err_cmd_   00109F R   |   4 err_div0   001064 R   |   4 err_dupl   0010B9 R
  4 err_math   00104B R   |   4 err_mem_   001030 R   |   4 err_msg    001010 R
  4 err_no_a   0010E7 R   |   4 err_no_d   00111A R   |   4 err_no_f   00113E R
  4 err_no_l   001073 R   |   4 err_no_p   00112A R   |   4 err_not_   0010CA R
  4 err_run_   001089 R   |   4 err_synt   00103D R   |   4 escaped    000779 GR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]

Symbol Table

  4 expect     001623 R   |   4 expr_exi   00177A R   |   4 expressi   001734 R
  4 factor     001685 R   |   5 farptr     000017 R   |   4 fcpu       0022DF R
  4 final_te   0005B3 R   |   4 first_li   00190D R   |   5 flags      000021 GR
  4 for        001B7B R   |   4 free       001820 R   |   5 free_eep   00002D R
  7 free_ram   000080 R   |   4 func_arg   001630 R   |   4 func_not   002450 R
  4 ge         000D22 R   |   4 get_arra   001660 R   |   4 get_cmd_   000B70 R
  4 get_esca   000328 R   |   4 get_targ   001C45 R   |   4 get_targ   001C53 R
  4 get_tick   00224B R   |   4 get_toke   0008B7 GR  |   4 getc       000301 GR
  4 gosub      001D60 R   |   4 goto       001D46 R   |   4 gpio       00217E R
  4 gt         000D1E R   |   4 gt_tst     000A06 R   |   4 hex_base   001816 R
  4 hex_dump   000DCD R   |   4 if         001B67 R   |   5 in         000001 GR
  5 in.saved   000002 GR  |   5 in.w       000000 GR  |   4 incr_far   001FB9 R
  4 input_ex   001AC1 R   |   4 input_lo   001A4C R   |   4 input_va   001A4A R
  4 insert_c   0003C7 R   |   4 insert_l   0006BA R   |   4 insert_l   000729 R
  4 interp_l   001259 R   |   4 interpre   001234 R   |   4 invert     0024CD R
  4 is_alnum   000822 GR  |   4 is_alpha   000808 GR  |   4 is_digit   000819 GR
  4 is_symbo   00082B R   |   4 itoa       0012F3 GR  |   4 itoa_loo   001318 R
  4 jp_to_ta   001D53 R   |   4 key        002169 R   |   4 kword_di   002ABB GR
  4 kword_en   00271F R   |   4 le         000D27 R   |   4 leading_   0024A3 R
  4 let        001898 GR  |   4 let_arra   0018A6 R   |   4 let_var    0018A9 R
  4 lines_sk   001910 R   |   4 list       0018CB R   |   4 list_exi   001952 R
  4 list_loo   001930 R   |   4 log2       002498 R   |   4 logical_   002446 R
  4 long_div   00151B R   |   4 look_tar   001C6F R   |   4 loop_bac   001C28 R
  5 loop_dep   00001E R   |   4 loop_don   001C3D R   |   4 lshift     0022AD R
  4 lt         000D25 R   |   4 lt_tst     000A2F R   |   4 modulo     0015B5 R
  4 move       000E38 GR  |   4 move_dow   000E57 R   |   4 move_era   000111 R
  4 move_exi   000E78 R   |   4 move_lef   00039F R   |   4 move_loo   000E5C R
  4 move_prg   000151 R   |   4 move_rig   0003AD R   |   4 move_up    000E49 R
  4 mul_char   000D0F R   |   4 muldiv     0015BA R   |   4 multiply   0014E6 R
  4 mulu24_8   001386 R   |   4 nbr_tst    0008EA R   |   4 ne         000D2A R
  4 neg_acc2   0013C0 R   |   4 new        001F94 R   |   4 next       001BFB R
  4 next_lin   00123C R   |   4 next_tok   001289 GR  |   4 no_match   0015F6 R
  4 other      000A58 R   |   4 overwrit   0005DF R   |   2 pad        0016E0 GR
  4 pad_ref    002719 R   |   4 parse_bi   0007CB R   |   4 parse_in   000781 R
  4 parse_ke   00084E R   |   4 parse_qu   00072C R   |   4 parse_sy   000836 R
  4 pause      0021EF R   |   4 pause02    0021F9 R   |   4 peek       001B56 R
  4 pin_mode   0022EB R   |   4 plus_tst   0009CF R   |   4 poke       001B47 R
  4 power_ad   001E6D R   |   4 prcnt_ts   0009F0 R   |   4 print      0019C4 R
  4 print_ex   001A1E R   |   4 print_he   000614 GR  |   4 print_in   0012D7 R
  4 printxy    001459 R   |   4 prog_siz   0018C3 R   |   4 program_   00012B R
  4 program_   000151 R   |   4 prt_basi   0019A4 R   |   4 prt_loop   0019C8 R
  4 prt_tok    000D5F R   |   4 prti24     0012E7 R   |   5 ptr16      000018 GR
  5 ptr8       000019 R   |   4 putc       0002F1 GR  |   4 puts       00034E GR
  4 qgetc      0002FA GR  |   4 qkey       002171 GR  |   4 qmark_ts   00097C R
  4 qsign      00203A R   |   4 random     002367 R   |   4 read       002608 R
  4 read01     00260A R   |   4 readln     000453 GR  |   4 readln_l   000460 R
  4 readln_q   0005FC R   |   4 refresh_   002493 R   |   4 rel_exit   0017D2 R
  4 relation   00177D R   |   4 relop_st   000D12 R   |   4 remark     001AC4 GR
  4 reset_co   0019C6 R   |   4 rest_con   001A3A R   |   4 restore    0025B9 R
  4 return     001D80 R   |   4 right_al   000B15 GR  |   4 row_alig   001F9E R
  4 row_eras   0000E4 R   |   4 row_eras   000111 R   |   4 row_loop   000DB0 R
  4 rparnt_t   00093A R   |   4 rshift     0022C6 R   |   7 rsign      00007C R
  7 rsize      00007E R   |   4 rt_msg     00115E R   |   4 run        001D9E R
  4 run_app    000F78 R   |   4 run_it     001DD0 R   |   5 rx1_head   00002B R
  5 rx1_queu   000023 R   |   5 rx1_tail   00002C R   |   4 save_app   002041 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]

Symbol Table

  4 save_con   001A2A R   |   4 scan_blo   001FC7 R   |   4 scan_fre   00024F GR
  4 search_d   0015D6 GR  |   4 search_e   001620 R   |   4 search_l   000636 GR
  4 search_l   000645 R   |   4 search_n   0015DA R   |   5 seedx      000013 R
  5 seedy      000015 R   |   4 select_p   002337 R   |   4 send_esc   000376 R
  4 send_par   000381 R   |   4 set_time   002434 R   |   4 sharp_ts   00095B R
  4 show       0017D5 R   |   4 show_row   000D9E R   |   4 single_c   000D08 R
  4 skip       0008A4 R   |   4 skip_lab   001CAE R   |   4 slash_ts   0009E5 R
  4 sleep      0021E4 R   |   4 software   000E90 R   |   4 spaces     0003BB GR
  4 spi_clea   0026AD R   |   4 spi_disa   002695 R   |   4 spi_enab   002662 R
  4 spi_rcv_   0026CF R   |   4 spi_read   0026FA R   |   4 spi_sele   002702 R
  4 spi_send   0026B9 R   |   4 spi_writ   0026DA R   |   2 stack_fu   001760 GR
  2 stack_un   001800 R   |   4 star_tst   0009DA R   |   4 step       001BD4 R
  4 stop       001F48 R   |   4 store_lo   001BE8 R   |   4 str_matc   001603 R
  4 str_tst    0008DA R   |   4 strcmp     000E17 R   |   4 strcpy     000E28 GR
  4 strlen     000E0C GR  |   4 symb_loo   000837 R   |   4 syntax_e   001191 GR
  5 tab_widt   000022 GR  |   4 tb_error   001193 GR  |   4 term       0016E2 R
  4 term01     0016EA R   |   4 term_exi   001731 R   |   2 tib        001690 GR
  4 tick_tst   000994 R   |   5 ticks      00000F R   |   4 timeout    002443 R
  5 timer      000011 GR  |   4 timer2_i   00008C R   |   4 timer4_i   000099 R
  4 tk_id      001181 R   |   4 to         001BA4 R   |   4 to_eepro   00017A R
  4 to_flash   00017F R   |   4 to_hex_c   00062B GR  |   4 to_upper   0013E3 GR
  4 token_ch   000A6F R   |   4 token_ex   000A73 R   |   4 token_ms   000D96 R
  4 tone       001E29 R   |   4 try_next   0025F8 R   |   5 txtbgn     00001A GR
  5 txtend     00001C GR  |   4 uart1_ge   000301 GR  |   4 uart1_in   0002AC R
  4 uart1_pu   0002F1 GR  |   4 uart1_qg   0002FA GR  |   4 uart1_se   0002BC R
  4 ubound     00188E R   |   4 udiv32_1   001509 R   |   4 uflash     0021A8 R
  4 umstar     0014AC R   |   4 unlock_e   0000AE R   |   4 unlock_f   0000C9 R
  4 until      0024F1 R   |   4 user_int   000037 R   |   4 usr        0021BE R
  4 var_name   000B68 GR  |   5 vars       00002F GR  |   4 wait       001ACA R
  4 warm_ini   000FDB R   |   4 warm_sta   001215 R   |   4 words      0023CE R
  4 words_co   00241E R   |   4 write      0020F9 R   |   4 write_bl   00022A GR
  4 write_by   0001B0 R   |   4 write_ee   0001EC R   |   4 write_ex   000225 R
  4 write_fl   0001D6 R   |   4 write_ro   00016B R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 SSEG       size      0   flags    8
   2 SSEG0      size    170   flags    8
   3 HOME       size     80   flags    0
   4 CODE       size   2C04   flags    0
   5 DATA       size     63   flags    0
   6 BTXT       size      0   flags    8
   7 BTXT1      size      4   flags    8

