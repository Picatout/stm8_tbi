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
                                     27     ; for local variabls
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
                           000002    72         TK_QSTR=2     ; quoted string  
                           000003    73         TK_CHAR=3       ; ASCII character 
                           000006    74         TK_ARRAY=6     ; array variable '@' 
                           000007    75         TK_LPAREN=7     ; left parenthesis '('
                           000008    76         TK_RPAREN=8     ; right parenthesis ')'
                           000009    77         TK_COMMA=9     ; item separator ',' 
                           00000A    78         TK_SHARP=0xa     ; print colon width '#' 
                           00000B    79         TK_COLON=0xb      ; command separator ':' 
                                     80         
                           000010    81         TK_PLUS=0x10    ; addition operator '+'
                           000011    82         TK_MINUS=0x11   ; subtraction operator '-'
                           000020    83         TK_MULT=0x20    ; multiplication operator '*'
                           000021    84         TK_DIV=0x21     ; division operator '/'
                           000022    85         TK_MOD=0x22     ; modulo operator '%'
                                     86 
                                     87         ; don't change these token values 
                                     88         ; values chosen to be used as a mask.
                                     89         ; bit 7   1 for dictionary words else 0 
                                     90         ; bits 6  always 0 
                                     91         ; bits 5:4 identify group 
                                     92         ; bits 3:0 token identifier inside group  
                           000031    93         TK_GT=0x31      ; relation operator '>'
                           000032    94         TK_EQUAL=0x32   ; assignment or relation operator '='
                           000033    95         TK_GE=0x33      ; relation operator '>='
                           000034    96         TK_LT=0x34      ; relation operator '<'
                           000036    97         TK_LE=0x36      ; relation operator '<='
                           000035    98         TK_NE=0x35      ; relation operator '<>' not equal 
                                     99         ; token groups 
                           000030   100         TK_GRP_MASK=0x30 ; groups bits selector 
                           000000   101         TK_GRP_MISC=0x00 ; miscelinous group 
                           000010   102         TK_GRP_ADD=0x10  ; additive operators
                           000020   103         TK_GRP_MULT=0x20 ; multiplicative operators
                           000030   104         TK_GRP_RELOP=0x30 ;relational operators. 
                           000002   105         CMD_END=2 
                                    106 
                                    107 ;--------------------------------------
                                    108 ;   error codes 
                                    109 ;--------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                           000000   110     ERR_NONE=0
                           000001   111     ERR_MEM_FULL=1 
                           000002   112     ERR_SYNTAX=2
                           000003   113     ERR_MATH_OVF=3
                           000004   114     ERR_DIV0=4 
                           000005   115     ERR_NO_LINE=5
                           000006   116     ERR_RUN_ONLY=6
                           000007   117     ERR_CMD_ONLY=7
                           000008   118     ERR_DUPLICATE=8
                           000009   119     ERR_NOT_FILE=9
                           00000A   120     ERR_BAD_VALUE=10
                           00000B   121     ERR_NO_ACCESS=11
                           00000C   122     ERR_NO_DATA=12 
                           00000D   123     ERR_NO_PROG=13
                           00000E   124     ERR_NO_FSPACE=14
                           00000F   125     ERR_BUF_FULL=15
                                    126 
                                    127 ;--------------------------------------
                                    128 ;   assembler flags 
                                    129 ;-------------------------------------
                           000000   130     MATH_OVF=0 ; if 1 the stop on math overflow 
                                    131 
                           000002   132     CELL_SIZE=2 
                                    133 
                                    134     .macro _usec_dly n 
                                    135     ldw x,#(16*n-2)/4
                                    136     decw x
                                    137     nop 
                                    138     jrne .-4
                                    139     .endm 
                                    140     
                                    141     ; load X register with 
                                    142     ; entry point of dictionary
                                    143     ; before calling 'search_dict'
                                    144     .macro _ldx_dict dict_name
                                    145     ldw x,#dict_name+2
                                    146     .endm 
                                    147 
                                    148     ; reset BASIC pointer
                                    149     ; to beginning of last token
                                    150     ; extracted except if it was end of line 
                                    151     .macro _unget_token 
                                    152      mov in,in.saved  
                                    153     .endm
                                    154 
                                    155 ;-------------------------------
                                    156 ;  macros used to help debugging
                                    157 ;-------------------------------
                           000000   158     DEBUG=0
                                    159     .macro _dbg 
                                    160     DEBUG=1
                                    161     .endm
                                    162 
                                    163     .macro _nodbg
                                    164     DEBUG=0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                    165     .endm 
                                    166 
                           000006   167     DBG_CC=6
                           000005   168     DBG_A=5 
                           000003   169     DBG_X=3 
                           000001   170     DBG_Y=1 
                                    171     .macro _dbg_save_regs 
                                    172     .if DEBUG
                                    173     push cc ; (6,sp)
                                    174     push a   ; (5,sp)
                                    175     pushw x  ; (3,sp)
                                    176     pushw y  ; (1,sp)
                                    177     .endif 
                                    178     .endm 
                                    179 
                                    180     .macro _dbg_restore_regs 
                                    181     .if DEBUG 
                                    182     popw y 
                                    183     popw x 
                                    184     pop a 
                                    185     pop cc 
                                    186     .endif 
                                    187     .endm 
                                    188 
                                    189     .macro _dbg_getc 
                                    190     .if DEBUG 
                                    191     _dbg_save_regs 
                                    192     call getc
                                    193     ld (DBG_A,sp),a 
                                    194     _dbg_restore_regs  
                                    195     .endif
                                    196     .endm 
                                    197 
                                    198     .macro _dbg_putc 
                                    199     .if DEBUG
                                    200     push cc 
                                    201     call putc 
                                    202     pop cc 
                                    203     .endif 
                                    204     .endm 
                                    205 
                                    206     .macro _dbg_puts 
                                    207     .if DEBUG 
                                    208     _dbg_save_regs
                                    209     call puts 
                                    210     _dbg_restore_regs
                                    211     .endif 
                                    212     .endm 
                                    213 
                                    214     .macro _dbg_prti24 
                                    215     .if DEBUG 
                                    216     _dbg_save_regs
                                    217     call prti24 
                                    218     _dbg_restore_regs
                                    219     .endif
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                    220     .endm 
                                    221 
                                    222     .macro _dbg_prt_regs
                                    223     .if DEBUG
                                    224     _dbg_save_regs
                                    225     call prt_regs 
                                    226     _dbg_restore_regs 
                                    227     .endif 
                                    228     .endm 
                                    229 
                                    230     .macro _dbg_peek addr 
                                    231     .if DEBUG
                                    232     _dbg_save_regs 
                                    233     ldw x,addr 
                                    234     call peek     
                                    235     _dbg_restore_regs
                                    236     .endif 
                                    237     .endm 
                                    238 
                                    239     .macro _dbg_parser_init 
                                    240     .if DEBUG 
                                    241     _dbg_save_regs
                                    242     call parser_init 
                                    243     _dbg_restore_regs
                                    244     .endif
                                    245     .endm
                                    246 
                                    247     .macro _dbg_readln
                                    248     .if DEBUG 
                                    249     _dbg_save_regs
                                    250     call readln
                                    251     _dbg_restore_regs
                                    252     .endif
                                    253     .endm
                                    254 
                                    255     .macro _dbg_number
                                    256     .if DEBUG 
                                    257     _dbg_save_regs
                                    258     call number 
                                    259     _dbg_restore_regs
                                    260     .endif
                                    261     .endm  
                                    262 
                                    263     .macro _dbg_nextword
                                    264     .if DEBUG 
                                    265     _dbg_save_regs
                                    266     call get_token   
                                    267     _dbg_restore_regs
                                    268     .endif
                                    269     .endm  
                                    270 
                                    271     .macro _dbg_dots 
                                    272     .if DEBUG 
                                    273     _dbg_save_regs
                                    274     call dots 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                    275     _dbg_restore_regs
                                    276     .endif 
                                    277     .endm 
                                    278 
                                    279     .macro _dbg_trap
                                    280     .if DEBUG 
                                    281     bset flags,#FTRAP 
                                    282     trap 
                                    283     .endif 
                                    284     .endm 
                                    285 
                                    286     .macro _dbg_mark n  
                                    287     .if DEBUG 
                                    288     push cc
                                    289     push a 
                                    290     ld a,#n 
                                    291     call putc
                                    292     btjf UART3_SR,#UART_SR_TC,. 
                                    293     pop a 
                                    294     pop cc 
                                    295     .endif 
                                    296     .endm 
                                    297     
                                    298     .macro _dbg_prt_var var 
                                    299     .if DEBUG
                                    300     _dbg_save_regs 
                                    301     ldw x,var 
                                    302     ldw acc16,x 
                                    303     clr acc24 
                                    304     clrw x 
                                    305     ld a,#16+128  
                                    306     call prti24
                                    307     ld a,#CR 
                                    308     call putc  
                                    309     _dbg_restore_regs 
                                    310     .endif 
                                    311     .endm 
                                    312 
                                    313     .macro _dbg_show 
                                    314     .if DEBUG 
                                    315     _dbg_save_regs 
                                    316     call show 
                                    317     _dbg_restore_regs
                                    318     .endif
                                    319     .endm 
                                    320 
                                    321     ; software reset 
                                    322     .macro _swreset
                                    323     mov WWDG_CR,#0X80
                                    324     .endm 
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
                                    124     
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
      008000 82 00 8E D1             51     int cold_start			; RESET vector 
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
      008050 82 00 82 CF             75 	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
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
      0080C5 CD 83 9E         [ 4]  166 	call puts 
      0080C8                        167 UBTN_Handler_exit:
      0080C8 AE 17 FF         [ 2]  168     ldw x,#STACK_EMPTY 
      0080CB 94               [ 1]  169     ldw sp,x
      0080CC 9A               [ 1]  170 	rim 
      0080CD CE 00 1A         [ 2]  171 	ldw x,txtbgn 
      0080D0 A3 AA 80         [ 2]  172 	cpw x,#app_space 
      0080D3 22 03            [ 1]  173 	jrugt 5$
      0080D5 CD 8F F4         [ 4]  174 	call clear_basic 
      0080D8 CC 92 10         [ 2]  175 5$:	jp warm_start
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
      0081A4 CD 8E 10         [ 4]  105 	call move
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
      0081E4 CD 8E 10         [ 4]  159 	call move
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
      0081F5 A3 AA 80         [ 2]  176 	cpw x,#app_space  
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
      008213 A3 AA 80         [ 2]  202 	cpw x,#app_space 
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
      008242 90 A3 AA 80      [ 2]  242     cpw y,#app_space 	 
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
      00022A                        307 write_block:
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
      0082C8 CD 9E A5         [ 4]  325 	call incr_farptr
      00024B                        326 	_drop VSIZE
      0082CB 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082CD 84               [ 1]  327 	pop a 
      0082CE 81               [ 4]  328 	ret 
                                    329 
                                    330 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                     32     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000000     5 SEPARATE=0 ; set to 1 for 'make separate' 
                                      6 
                                      7 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
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
      0082CF                         66 Uart1RxHandler: ; console receive char 
      0082CF 72 0B 52 30 27   [ 2]   67 	btjf UART1_SR,#UART_SR_RXNE,5$
      0082D4 C6 52 31         [ 1]   68 	ld a,UART1_DR 
      0082D7 A1 03            [ 1]   69 	cp a,#CTRL_C 
      0082D9 26 06            [ 1]   70 	jrne 2$
      0082DB CD 83 41         [ 4]   71 	call putc 
      0082DE CC 80 B7         [ 2]   72 	jp user_interrupted
      0082E1                         73 2$:
      0082E1 A1 18            [ 1]   74 	cp a,#CAN ; CTRL_X 
      0082E3 26 03            [ 1]   75 	jrne 3$
      0082E5 CC 8E D1         [ 2]   76 	jp cold_start 	
      0082E8 88               [ 1]   77 3$:	push a 
      0082E9 A6 23            [ 1]   78 	ld a,#rx1_queue 
      0082EB CB 00 2C         [ 1]   79 	add a,rx1_tail 
      0082EE 5F               [ 1]   80 	clrw x 
      0082EF 97               [ 1]   81 	ld xl,a 
      0082F0 84               [ 1]   82 	pop a 
      0082F1 F7               [ 1]   83 	ld (x),a 
      0082F2 C6 00 2C         [ 1]   84 	ld a,rx1_tail 
      0082F5 4C               [ 1]   85 	inc a 
      0082F6 A4 07            [ 1]   86 	and a,#RX_QUEUE_SIZE-1
      0082F8 C7 00 2C         [ 1]   87 	ld rx1_tail,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      0082FB 80               [11]   88 5$:	iret 
                                     89 
                                     90 ;---------------------------------------------
                                     91 ; initialize UART1, 115200 8N1
                                     92 ; input:
                                     93 ;	none
                                     94 ; output:
                                     95 ;   none
                                     96 ;---------------------------------------------
      0082FC                         97 uart1_init:
      0082FC 72 1A 50 02      [ 1]   98     bset PA_DDR,#UART1_TX_PIN
      008300 72 1A 50 03      [ 1]   99     bset PA_CR1,#UART1_TX_PIN 
      008304 72 1A 50 04      [ 1]  100     bset PA_CR2,#UART1_TX_PIN 
                                    101 ; enable UART1 clock
      008308 72 14 50 C7      [ 1]  102 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      00830C                        103 uart1_set_baud: 
      00830C 88               [ 1]  104 	push a 
                                    105 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    106 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      00830D A6 E1            [ 1]  107 	ld a,#CLK_SWR_HSI
      00830F C1 50 C3         [ 1]  108 	cp a,CLK_CMSR 
      008312 27 0A            [ 1]  109 	jreq 2$ 
      008314                        110 1$: ; 8 Mhz 	
      008314 35 05 52 33      [ 1]  111 	mov UART1_BRR2,#0x05 ; must be loaded first
      008318 35 04 52 32      [ 1]  112 	mov UART1_BRR1,#0x4
      00831C 20 08            [ 2]  113 	jra 3$
      00831E                        114 2$: ; 16 Mhz 	
      00831E 35 0B 52 33      [ 1]  115 	mov UART1_BRR2,#0x0b ; must be loaded first
      008322 35 08 52 32      [ 1]  116 	mov UART1_BRR1,#0x08
      008326                        117 3$:
      008326 72 5F 52 31      [ 1]  118     clr UART1_DR
      00832A 35 2C 52 35      [ 1]  119 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      00832E 72 10 52 35      [ 1]  120 	bset UART1_CR2,#UART_CR2_SBK
      008332 72 0D 52 30 FB   [ 2]  121     btjf UART1_SR,#UART_SR_TC,.
      008337 72 5F 00 2B      [ 1]  122     clr rx1_head 
      00833B 72 5F 00 2C      [ 1]  123 	clr rx1_tail
      00833F 84               [ 1]  124 	pop a  
      008340 81               [ 4]  125 	ret
                                    126 
                                    127 ;---------------------------------
                                    128 ; uart1_putc
                                    129 ; send a character via UART1
                                    130 ; input:
                                    131 ;    A  	character to send
                                    132 ;---------------------------------
      008341                        133 putc:: ; console output always on UART1
      008341                        134 uart1_putc:: 
      008341 72 0F 52 30 FB   [ 2]  135 	btjf UART1_SR,#UART_SR_TXE,.
      008346 C7 52 31         [ 1]  136 	ld UART1_DR,a 
      008349 81               [ 4]  137 	ret 
                                    138 
                                    139 
                                    140 ;---------------------------------
                                    141 ; Query for character in rx1_queue
                                    142 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                    143 ;   none 
                                    144 ; output:
                                    145 ;   A     0 no charcter available
                                    146 ;   Z     1 no character available
                                    147 ;---------------------------------
      00834A                        148 qgetc::
      00834A                        149 uart1_qgetc::
      00834A C6 00 2B         [ 1]  150 	ld a,rx1_head 
      00834D C0 00 2C         [ 1]  151 	sub a,rx1_tail 
      008350 81               [ 4]  152 	ret 
                                    153 
                                    154 ;---------------------------------
                                    155 ; wait character from UART1 
                                    156 ; input:
                                    157 ;   none
                                    158 ; output:
                                    159 ;   A 			char  
                                    160 ;--------------------------------	
      008351                        161 getc:: ;console input
      008351                        162 uart1_getc::
      008351 CD 83 4A         [ 4]  163 	call uart1_qgetc
      008354 27 FB            [ 1]  164 	jreq uart1_getc 
      008356 89               [ 2]  165 	pushw x 
                                    166 ;; rx1_queue must be in page 0 	
      008357 A6 23            [ 1]  167 	ld a,#rx1_queue
      008359 CB 00 2B         [ 1]  168 	add a,rx1_head 
      00835C 5F               [ 1]  169 	clrw x  
      00835D 97               [ 1]  170 	ld xl,a 
      00835E F6               [ 1]  171 	ld a,(x)
      00835F 88               [ 1]  172 	push a
      008360 C6 00 2B         [ 1]  173 	ld a,rx1_head 
      008363 4C               [ 1]  174 	inc a 
      008364 A4 07            [ 1]  175 	and a,#RX_QUEUE_SIZE-1
      008366 C7 00 2B         [ 1]  176 	ld rx1_head,a 
      008369 84               [ 1]  177 	pop a  
      00836A 85               [ 2]  178 	popw x
      00836B 81               [ 4]  179 	ret 
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
      00836C 43 81 44 80 48 82 46   194 convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',KEY_END,'3',SUP,0,0
             83 33 84 00 00
                                    195 
                                    196 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
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
      008378                        207 get_escape:
      008378 CD 83 51         [ 4]  208     call getc 
      00837B A1 5B            [ 1]  209     cp a,#'[ ; this character is expected after ESC 
      00837D 27 02            [ 1]  210     jreq 1$
      00837F 4F               [ 1]  211     clr a
      008380 81               [ 4]  212     ret
      008381 CD 83 51         [ 4]  213 1$: call getc 
      008384 AE 83 6C         [ 2]  214     ldw x,#convert_table
      008387                        215 2$:
      008387 F1               [ 1]  216     cp a,(x)
      008388 27 08            [ 1]  217     jreq 4$
      00838A 1C 00 02         [ 2]  218     addw x,#2
      00838D 7D               [ 1]  219     tnz (x)
      00838E 26 F7            [ 1]  220     jrne 2$
      008390 4F               [ 1]  221     clr a
      008391 81               [ 4]  222     ret 
      008392 5C               [ 1]  223 4$: incw x 
      008393 F6               [ 1]  224     ld a,(x)
      008394 A1 84            [ 1]  225     cp a,#SUP
      008396 26 05            [ 1]  226     jrne 5$
      008398 88               [ 1]  227     push a 
      008399 CD 83 51         [ 4]  228     call getc
      00839C 84               [ 1]  229     pop a 
      00839D                        230 5$:
      00839D 81               [ 4]  231     ret 
                                    232 
                                    233 
                                    234 ;-----------------------------
                                    235 ; send an ASCIZ string to UART1 
                                    236 ; input: 
                                    237 ;   x 		char * 
                                    238 ; output:
                                    239 ;   none 
                                    240 ;-------------------------------
      00839E                        241 puts::
      00839E F6               [ 1]  242     ld a,(x)
      00839F 27 06            [ 1]  243 	jreq 1$
      0083A1 CD 83 41         [ 4]  244 	call putc 
      0083A4 5C               [ 1]  245 	incw x 
      0083A5 20 F7            [ 2]  246 	jra puts 
      0083A7 81               [ 4]  247 1$:	ret 
                                    248 
                                    249 
                                    250 ;---------------------------
                                    251 ; delete character at left 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                    252 ; of cursor on terminal 
                                    253 ; input:
                                    254 ;   none 
                                    255 ; output:
                                    256 ;	none 
                                    257 ;---------------------------
      0083A8                        258 bksp:
      0083A8 A6 08            [ 1]  259 	ld a,#BS 
      0083AA CD 83 41         [ 4]  260 	call putc 
      0083AD A6 20            [ 1]  261 	ld a,#SPACE 
      0083AF CD 83 41         [ 4]  262 	call putc 
      0083B2 A6 08            [ 1]  263 	ld a,#BS 
      0083B4 CD 83 41         [ 4]  264 	call putc 
      0083B7 81               [ 4]  265 	ret 
                                    266 ;---------------------------
                                    267 ; delete n character left of cursor 
                                    268 ; at terminal.
                                    269 ; input: 
                                    270 ;   A   number of characters to delete.
                                    271 ; output:
                                    272 ;    none 
                                    273 ;--------------------------	
      0083B8                        274 delete_nchar:
      0083B8 88               [ 1]  275 	push a 
      0083B9 0D 01            [ 1]  276 0$:	tnz (1,sp)
      0083BB 27 07            [ 1]  277 	jreq 1$
      0083BD CD 83 A8         [ 4]  278 	call bksp 
      0083C0 0A 01            [ 1]  279 	dec (1,sp)
      0083C2 20 F5            [ 2]  280 	jra 0$
      0083C4 84               [ 1]  281 1$:	pop a 
      0083C5 81               [ 4]  282 	ret
                                    283 
                                    284 ;--------------------------
                                    285 ; send ANSI escape sequence
                                    286 ; ANSI: ESC[
                                    287 ; note: ESC is ASCII 27
                                    288 ;       [   is ASCII 91  
                                    289 ;-------------------------- 
      0083C6                        290 send_escape:
      0083C6 A6 1B            [ 1]  291 	ld a,#ESC 
      0083C8 CD 83 41         [ 4]  292 	call putc 
      0083CB A6 5B            [ 1]  293 	ld a,#'[
      0083CD CD 83 41         [ 4]  294 	call putc 
      0083D0 81               [ 4]  295 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                    307 ; 	A {0..99} 
                                    308 ; output:
                                    309 ;   none 
                                    310 ;---------------------
      0083D1                        311 send_parameter:
      0083D1 89               [ 2]  312 	pushw x 
      0083D2 5F               [ 1]  313 	clrw x 
      0083D3 97               [ 1]  314 	ld xl,a 
      0083D4 A6 0A            [ 1]  315 	ld a,#10 
      0083D6 62               [ 2]  316 	div x,a 
      0083D7 95               [ 1]  317 	ld xh,a 
      0083D8 9F               [ 1]  318 	ld a,xl
      0083D9 4D               [ 1]  319     tnz a 
      0083DA 27 0B            [ 1]  320     jreq 2$
      0083DC A1 09            [ 1]  321 	cp a,#9 
      0083DE 23 02            [ 2]  322 	jrule 1$
      0083E0 A6 39            [ 1]  323 	ld a,#'9
      0083E2                        324 1$:
      0083E2 AB 30            [ 1]  325 	add a,#'0 
      0083E4 CD 83 41         [ 4]  326 	call putc
      0083E7 9E               [ 1]  327 2$:	ld a,xh 
      0083E8 AB 30            [ 1]  328 	add a,#'0
      0083EA CD 83 41         [ 4]  329 	call putc 
      0083ED 85               [ 2]  330 	popw x 
      0083EE 81               [ 4]  331 	ret 
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
      0083EF                        344 move_left:
      0083EF 88               [ 1]  345 	push a 
      0083F0 CD 83 C6         [ 4]  346 	call send_escape
      0083F3 84               [ 1]  347     pop a
      0083F4 CD 83 D1         [ 4]  348 	call send_parameter 
      0083F7 A6 44            [ 1]  349 	ld a,#'D 
      0083F9 CD 83 41         [ 4]  350 	call putc 
      0083FC 81               [ 4]  351 	ret	
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0083FD                        362 move_right:
      0083FD 88               [ 1]  363 	push a 
      0083FE CD 83 C6         [ 4]  364 	call send_escape
      008401 84               [ 1]  365     pop a
      008402 CD 83 D1         [ 4]  366 	call send_parameter 
      008405 A6 43            [ 1]  367 	ld a,#'C 
      008407 CD 83 41         [ 4]  368 	call putc 
      00840A 81               [ 4]  369 	ret 
                                    370 
                                    371 
                                    372 ;--------------------------
                                    373 ; print n spaces on terminal
                                    374 ; input:
                                    375 ;  X 		number of spaces 
                                    376 ; output:
                                    377 ;	none 
                                    378 ;---------------------------
      00840B                        379 spaces::
      00840B A6 20            [ 1]  380 	ld a,#SPACE 
      00840D 5D               [ 2]  381 1$:	tnzw x
      00840E 27 06            [ 1]  382 	jreq 9$
      008410 CD 83 41         [ 4]  383 	call putc 
      008413 5A               [ 2]  384 	decw x
      008414 20 F7            [ 2]  385 	jra 1$
      008416                        386 9$: 
      008416 81               [ 4]  387 	ret 
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
      008417                        404 insert_char: 
      000397                        405 	_vars VSIZE 
      008417 52 02            [ 2]    1     sub sp,#VSIZE 
      008419 6B 02            [ 1]  406     ld (KCHAR,sp),a 
      00841B 9E               [ 1]  407     ld a,xh 
      00841C 6B 01            [ 1]  408 	ld (IPOS,sp),a
      00841E 9F               [ 1]  409     ld a,xl 
      00841F 6B 03            [ 1]  410     ld (LLEN,sp),a  
      008421 93               [ 1]  411     ldw x,y
      008422 5C               [ 1]  412     incw x 
      008423 7B 03            [ 1]  413     ld a,(LLEN,sp)
      008425 10 01            [ 1]  414     sub a,(IPOS,sp)
      008427 4C               [ 1]  415     inc a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      008428 C7 00 0E         [ 1]  416     ld acc8,a 
      00842B 72 5F 00 0D      [ 1]  417     clr acc16
      00842F CD 8E 10         [ 4]  418     call move
      008432 90 AE 16 90      [ 2]  419     ldw y,#tib 
      008436 7B 01            [ 1]  420     ld a,(IPOS,sp)
      008438 C7 00 0E         [ 1]  421     ld acc8,a 
      00843B 72 B9 00 0D      [ 2]  422     addw y,acc16 
      00843F 7B 02            [ 1]  423     ld a,(KCHAR,sp)
      008441 90 F7            [ 1]  424     ld (y),a
      008443 90 5C            [ 1]  425     incw y  
      008445 7B 01            [ 1]  426     ld a,(IPOS,sp)
      008447 CD 83 EF         [ 4]  427     call move_left
      00844A AE 16 90         [ 2]  428     ldw x,#tib 
      00844D CD 83 9E         [ 4]  429     call puts 
      008450 7B 03            [ 1]  430     ld a,(LLEN,sp)
      008452 10 01            [ 1]  431     sub a,(IPOS,sp) 
      008454 CD 83 EF         [ 4]  432     call move_left 
      0003D7                        433 	_drop VSIZE 
      008457 5B 02            [ 2]    1     addw sp,#VSIZE 
      008459 81               [ 4]  434 	ret 
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
      00845A                        447 delete_under:
      0003DA                        448 	_vars VSIZE 
      00845A 52 02            [ 2]    1     sub sp,#VSIZE 
      00845C 6B 02            [ 1]  449     ld (LLEN,sp),a 
      00845E 9F               [ 1]  450     ld a,xl 
      00845F 6B 01            [ 1]  451     ld (CPOS,sp),a 
      008461 93               [ 1]  452     ldw x,y ; move destination
      008462 90 5C            [ 1]  453     incw y  ; move source 
      008464 7B 02            [ 1]  454     ld a,(LLEN,sp)
      008466 10 01            [ 1]  455     sub a,(CPOS,sp)
      008468 4C               [ 1]  456     inc a ; move including zero at end.
      008469 C7 00 0E         [ 1]  457     ld acc8,a 
      00846C 72 5F 00 0D      [ 1]  458     clr acc16 
      008470 CD 8E 10         [ 4]  459 	call move 
      008473 90 AE 16 90      [ 2]  460     ldw y,#tib 
      008477 7B 01            [ 1]  461     ld a,(CPOS,sp)
      008479 C7 00 0E         [ 1]  462     ld acc8,a 
      00847C 72 B9 00 0D      [ 2]  463     addw y,acc16 
      008480 93               [ 1]  464     ldw x,y 
      008481 CD 83 9E         [ 4]  465     call puts 
      008484 A6 20            [ 1]  466     ld a,#SPACE  
      008486 CD 83 41         [ 4]  467     call putc
      008489 7B 02            [ 1]  468     ld a,(LLEN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      00848B 10 01            [ 1]  469     sub a,(CPOS,sp)
      00848D CD 83 EF         [ 4]  470     call move_left 
      008490 0A 02            [ 1]  471     dec (LLEN,sp)
      000412                        472 	_drop VSIZE 
      008492 5B 02            [ 2]    1     addw sp,#VSIZE 
      008494 81               [ 4]  473 	ret 
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
      008495                        485 delete_line:
      008495 CD 83 C6         [ 4]  486     call send_escape
      008498 A6 32            [ 1]  487 	ld a,#'2
      00849A CD 83 41         [ 4]  488 	call putc 
      00849D A6 4B            [ 1]  489 	ld a,#'K 
      00849F CD 83 41         [ 4]  490 	call putc 
      0084A2 81               [ 4]  491 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0084A3                        523 readln::
      000423                        524 	_vars VSIZE 
      0084A3 52 04            [ 2]    1     sub sp,#VSIZE 
      0084A5 5F               [ 1]  525 	clrw x 
      0084A6 1F 02            [ 2]  526 	ldw (LL,sp),x 
      0084A8 1F 03            [ 2]  527 	ldw (CPOS,sp),x 
      0084AA 03 04            [ 1]  528 	cpl (OVRWR,sp) ; default to overwrite mode 
      0084AC 90 AE 16 90      [ 2]  529  	ldw y,#tib ; input buffer
      0084B0                        530 readln_loop:
      0084B0 CD 83 51         [ 4]  531 	call getc
      0084B3 6B 01            [ 1]  532 	ld (RXCHAR,sp),a
      0084B5 A1 1B            [ 1]  533     cp a,#ESC 
      0084B7 26 05            [ 1]  534     jrne 0$
      0084B9 CD 83 78         [ 4]  535     call get_escape 
      0084BC 6B 01            [ 1]  536     ld (RXCHAR,sp),a 
      0084BE A1 0D            [ 1]  537 0$:	cp a,#CR
      0084C0 26 03            [ 1]  538 	jrne 1$
      0084C2 CC 86 4C         [ 2]  539 	jp readln_quit
      0084C5 A1 0A            [ 1]  540 1$:	cp a,#LF 
      0084C7 26 03            [ 1]  541 	jrne 2$ 
      0084C9 CC 86 4C         [ 2]  542 	jp readln_quit
      0084CC                        543 2$:
      0084CC A1 08            [ 1]  544 	cp a,#BS
      0084CE 26 12            [ 1]  545 	jrne 3$
                                    546 ; delete left 
      0084D0 0D 03            [ 1]  547     tnz (CPOS,sp)
      0084D2 27 DC            [ 1]  548     jreq readln_loop 
      0084D4 A6 01            [ 1]  549     ld a,#1 
      0084D6 CD 83 EF         [ 4]  550     call move_left
      0084D9 0A 03            [ 1]  551     dec (CPOS,sp)
      0084DB 90 5A            [ 2]  552     decw y 
      0084DD 7B 03            [ 1]  553     ld a,(CPOS,sp) 
      0084DF CC 85 F8         [ 2]  554     jp 12$
      0084E2                        555 3$:
      0084E2 A1 04            [ 1]  556 	cp a,#CTRL_D
      0084E4 26 1A            [ 1]  557 	jrne 4$
                                    558 ;delete line 
      0084E6 CD 84 95         [ 4]  559 	call delete_line 
      0084E9 7B 03            [ 1]  560     ld a,(CPOS,sp)
      0084EB 4C               [ 1]  561     inc a 
      0084EC CD 83 EF         [ 4]  562     call move_left 
      0084EF A6 3E            [ 1]  563 	ld a,#'> 
      0084F1 CD 83 41         [ 4]  564 	call putc 
      0084F4 90 AE 16 90      [ 2]  565 	ldw y,#tib
      0084F8 90 7F            [ 1]  566 	clr (y)
      0084FA 0F 02            [ 1]  567 	clr (LL,sp)
      0084FC 0F 03            [ 1]  568 	clr (CPOS,sp)
      0084FE 20 B0            [ 2]  569 	jra readln_loop
      008500                        570 4$:
      008500 A1 12            [ 1]  571 	cp a,#CTRL_R 
      008502 26 21            [ 1]  572 	jrne 5$
                                    573 ;reprint 
      008504 0D 02            [ 1]  574 	tnz (LL,sp)
      008506 26 A8            [ 1]  575 	jrne readln_loop
      008508 AE 16 90         [ 2]  576 	ldw x,#tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      00850B CD 8D E4         [ 4]  577 	call strlen 
      00850E 90 AE 16 90      [ 2]  578 	ldw y,#tib 
      008512 27 9C            [ 1]  579 	jreq readln_loop
      008514 6B 02            [ 1]  580 	ld (LL,sp),a 
      008516 6B 03            [ 1]  581     ld (CPOS,sp),a
      008518 AE 16 90         [ 2]  582 	ldw x,#tib 
      00851B CD 83 9E         [ 4]  583 	call puts
      00851E 0F 01            [ 1]  584 	clr (LL_HB,sp)
      008520 72 F9 01         [ 2]  585 	addw y,(LL_HB,sp)
      008523 20 8B            [ 2]  586 	jra readln_loop 
      008525                        587 5$:
      008525 A1 05            [ 1]  588 	cp a,#CTRL_E 
      008527 26 49            [ 1]  589 	jrne 6$
                                    590 ;edit line number 
      008529 AE 16 90         [ 2]  591 	ldw x,#tib 
      00852C CD 93 E1         [ 4]  592 	call atoi24
      00852F CE 00 0D         [ 2]  593 	ldw x,acc16
      008532 CD 86 86         [ 4]  594 	call search_lineno
      008535 5D               [ 2]  595 	tnzw x 
      008536 26 0B            [ 1]  596 	jrne 51$
      008538 0F 02            [ 1]  597 	clr (LL,sp)
      00853A 90 AE 16 90      [ 2]  598 	ldw y,#tib
      00853E 90 7F            [ 1]  599     clr (y) 	
      008540 CC 86 4C         [ 2]  600 	jp readln_quit  
      008543                        601 51$:
      008543 CF 00 05         [ 2]  602 	ldw basicptr,x
      008546 E6 02            [ 1]  603 	ld a,(2,x)
      008548 C7 00 04         [ 1]  604 	ld count,a 
      00854B 90 AE 16 90      [ 2]  605 	ldw y,#tib 
      00854F CD 8B 97         [ 4]  606 	call decompile 
      008552 0F 01            [ 1]  607 	clr (LL_HB,sp)
      008554 A6 0D            [ 1]  608 	ld a,#CR 
      008556 CD 83 41         [ 4]  609 	call putc 
      008559 A6 3E            [ 1]  610 	ld a,#'>
      00855B CD 83 41         [ 4]  611 	call putc
      00855E AE 16 90         [ 2]  612     ldw x,#tib  
      008561 CD 8D E4         [ 4]  613 	call strlen 
      008564 6B 02            [ 1]  614 	ld (LL,sp),a 
      008566 CD 83 9E         [ 4]  615 	call puts 
      008569 90 93            [ 1]  616 	ldw y,x
      00856B 7B 02            [ 1]  617     ld a,(LL,sp)
      00856D 6B 03            [ 1]  618     ld (CPOS,sp),a  
      00856F CC 84 B0         [ 2]  619 	jp readln_loop
      008572                        620 6$:
      008572 A1 81            [ 1]  621 	cp a,#ARROW_RIGHT
      008574 26 15            [ 1]  622    	jrne 7$ 
                                    623 ; right arrow
      008576 7B 03            [ 1]  624 	ld a,(CPOS,sp)
      008578 11 02            [ 1]  625     cp a,(LL,sp)
      00857A 2B 03            [ 1]  626     jrmi 61$
      00857C CC 84 B0         [ 2]  627     jp readln_loop 
      00857F                        628 61$:
      00857F A6 01            [ 1]  629     ld a,#1 
      008581 CD 83 FD         [ 4]  630 	call move_right 
      008584 0C 03            [ 1]  631 	inc (CPOS,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      008586 90 5C            [ 1]  632     incw y 
      008588 CC 84 B0         [ 2]  633     jp readln_loop 
      00858B A1 80            [ 1]  634 7$: cp a,#ARROW_LEFT  
      00858D 26 13            [ 1]  635 	jrne 8$
                                    636 ; left arrow 
      00858F 0D 03            [ 1]  637 	tnz (CPOS,sp)
      008591 26 03            [ 1]  638 	jrne 71$
      008593 CC 84 B0         [ 2]  639 	jp readln_loop
      008596                        640 71$:
      008596 A6 01            [ 1]  641     ld a,#1 
      008598 CD 83 EF         [ 4]  642 	call move_left 
      00859B 0A 03            [ 1]  643 	dec (CPOS,sp)
      00859D 90 5A            [ 2]  644     decw y 
      00859F CC 84 B0         [ 2]  645 	jp readln_loop 
      0085A2 A1 82            [ 1]  646 8$: cp a,#HOME  
      0085A4 26 0E            [ 1]  647 	jrne 9$
                                    648 ; HOME 
      0085A6 7B 03            [ 1]  649     ld a,(CPOS,sp)
      0085A8 CD 83 EF         [ 4]  650     call move_left 
      0085AB 0F 03            [ 1]  651 	clr (CPOS,sp)
      0085AD 90 AE 16 90      [ 2]  652     ldw y,#tib 
      0085B1 CC 84 B0         [ 2]  653 	jp readln_loop  
      0085B4 A1 83            [ 1]  654 9$: cp a,#KEY_END  
      0085B6 26 26            [ 1]  655 	jrne 10$
                                    656 ; KEY_END 
      0085B8 7B 03            [ 1]  657 	ld a,(CPOS,sp)
      0085BA 11 02            [ 1]  658 	cp a,(LL,sp)
      0085BC 26 03            [ 1]  659 	jrne 91$
      0085BE CC 84 B0         [ 2]  660 	jp readln_loop 
      0085C1                        661 91$:
      0085C1 7B 02            [ 1]  662 	ld a,(LL,sp)
      0085C3 10 03            [ 1]  663 	sub a,(CPOS,sp)
      0085C5 CD 83 FD         [ 4]  664 	call move_right 
      0085C8 7B 02            [ 1]  665 	ld a,(LL,sp)
      0085CA 6B 03            [ 1]  666 	ld (CPOS,sp),a
      0085CC 90 AE 16 90      [ 2]  667     ldw y,#tib
      0085D0 72 5F 00 0D      [ 1]  668     clr acc16 
      0085D4 C7 00 0E         [ 1]  669     ld acc8,a 
      0085D7 72 B9 00 0D      [ 2]  670     addw y,acc16  
      0085DB CC 84 B0         [ 2]  671 	jp readln_loop 
      0085DE A1 0F            [ 1]  672 10$: cp a,#CTRL_O
      0085E0 26 0C            [ 1]  673 	jrne 11$ 
                                    674 ; toggle between insert/overwrite
      0085E2 03 04            [ 1]  675 	cpl (OVRWR,sp)
      0085E4 90 89            [ 2]  676 	pushw y 
      0085E6 CD 9D 0C         [ 4]  677 	call beep_1khz
      0085E9 90 85            [ 2]  678 	popw y 
      0085EB CC 84 B0         [ 2]  679 	jp readln_loop 
      0085EE A1 84            [ 1]  680 11$: cp a,#SUP 
      0085F0 26 11            [ 1]  681     jrne final_test 
                                    682 ; del character under cursor 
      0085F2 7B 03            [ 1]  683     ld a,(CPOS,sp)
      0085F4 11 02            [ 1]  684     cp a,(LL,sp)
      0085F6 2A 08            [ 1]  685     jrpl 13$
      0085F8                        686 12$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0085F8 97               [ 1]  687     ld xl,a    ; cursor position 
      0085F9 7B 02            [ 1]  688     ld a,(LL,sp)  ; line length
      0085FB CD 84 5A         [ 4]  689     call delete_under
      0085FE 0A 02            [ 1]  690     dec (LLEN,sp)
      008600                        691 13$:
      008600 CC 84 B0         [ 2]  692     jp readln_loop 
      008603                        693 final_test:
      008603 A1 20            [ 1]  694 	cp a,#SPACE
      008605 2A 03            [ 1]  695 	jrpl accept_char
      008607 CC 84 B0         [ 2]  696 	jp readln_loop
      00860A                        697 accept_char:
      00860A A6 4F            [ 1]  698 	ld a,#TIB_SIZE-1
      00860C 11 02            [ 1]  699 	cp a, (LL,sp)
      00860E 2A 03            [ 1]  700 	jrpl 1$
      008610 CC 84 B0         [ 2]  701 	jp readln_loop
      008613 0D 04            [ 1]  702 1$:	tnz (OVRWR,sp)
      008615 26 18            [ 1]  703 	jrne overwrite
                                    704 ; insert mode 
      008617 7B 03            [ 1]  705     ld a,(CPOS,sp)
      008619 11 02            [ 1]  706     cp a,(LL,sp)
      00861B 27 12            [ 1]  707     jreq overwrite
      00861D 7B 02            [ 1]  708     ld a,(LL,sp)
      00861F 97               [ 1]  709     ld xl,a 
      008620 7B 03            [ 1]  710     ld a,(CPOS,sp)
      008622 95               [ 1]  711     ld xh,a
      008623 7B 01            [ 1]  712     ld a,(RXCHAR,sp)
      008625 CD 84 17         [ 4]  713     call insert_char
      008628 0C 02            [ 1]  714     inc (LLEN,sp)
      00862A 0C 03            [ 1]  715     inc (CPOS,sp)
      00862C CC 84 B0         [ 2]  716     jp readln_loop 
      00862F                        717 overwrite:
      00862F 7B 01            [ 1]  718 	ld a,(RXCHAR,sp)
      008631 90 F7            [ 1]  719 	ld (y),a
      008633 90 5C            [ 1]  720     incw y
      008635 CD 83 41         [ 4]  721     call putc 
      008638 7B 03            [ 1]  722 	ld a,(CPOS,sp)
      00863A 11 02            [ 1]  723 	cp a,(LL,sp)
      00863C 2B 09            [ 1]  724 	jrmi 1$
      00863E 90 7F            [ 1]  725 	clr (y)
      008640 0C 02            [ 1]  726 	inc (LL,sp)
      008642 0C 03            [ 1]  727     inc (CPOS,sp)
      008644 CC 84 B0         [ 2]  728 	jp readln_loop 
      008647                        729 1$:	
      008647 0C 03            [ 1]  730 	inc (CPOS,sp)
      008649 CC 84 B0         [ 2]  731 	jp readln_loop 
      00864C                        732 readln_quit:
      00864C 90 AE 16 90      [ 2]  733 	ldw y,#tib
      008650 0F 01            [ 1]  734     clr (LL_HB,sp) 
      008652 72 F9 01         [ 2]  735     addw y,(LL_HB,sp)
      008655 90 7F            [ 1]  736     clr (y)
      008657 7B 02            [ 1]  737 	ld a,(LL,sp)
      008659 C7 00 04         [ 1]  738 	ld count,a 
      00865C A6 0D            [ 1]  739 	ld a,#CR
      00865E CD 83 41         [ 4]  740 	call putc
      0005E1                        741 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      008661 5B 04            [ 2]    1     addw sp,#VSIZE 
      008663 81               [ 4]  742 	ret
                                    743 
                                    744 ;------------------------------
                                    745 ; print byte  in hexadecimal 
                                    746 ; on console
                                    747 ; input:
                                    748 ;    A		byte to print
                                    749 ;------------------------------
      008664                        750 print_hex::
      008664 88               [ 1]  751 	push a 
      008665 4E               [ 1]  752 	swap a 
      008666 CD 86 7B         [ 4]  753 	call to_hex_char 
      008669 CD 83 41         [ 4]  754 	call putc 
      00866C 7B 01            [ 1]  755     ld a,(1,sp) 
      00866E CD 86 7B         [ 4]  756 	call to_hex_char
      008671 CD 83 41         [ 4]  757 	call putc
      008674 A6 20            [ 1]  758 	ld a,#SPACE 
      008676 CD 83 41         [ 4]  759 	call putc 
      008679 84               [ 1]  760 	pop a 
      00867A 81               [ 4]  761 	ret 
                                    762 
                                    763 ;----------------------------------
                                    764 ; convert to hexadecimal digit 
                                    765 ; input:
                                    766 ;   A       digit to convert 
                                    767 ; output:
                                    768 ;   A       hexdecimal character 
                                    769 ;----------------------------------
      00867B                        770 to_hex_char::
      00867B A4 0F            [ 1]  771 	and a,#15 
      00867D A1 09            [ 1]  772 	cp a,#9 
      00867F 23 02            [ 2]  773 	jrule 1$ 
      008681 AB 07            [ 1]  774 	add a,#7
      008683 AB 30            [ 1]  775 1$: add a,#'0 
      008685 81               [ 4]  776 	ret 
                                    777 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                     26     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000000     5 SEPARATE=0 ; set to 1 for 'make separate' 
                                      6 
                                      7 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
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
      008686                         51 search_lineno::
      000606                         52 	_vars VSIZE
      008686 52 02            [ 2]    1     sub sp,#VSIZE 
      008688 0F 01            [ 1]   53 	clr (LL,sp)
      00868A 90 CE 00 1A      [ 2]   54 	ldw y,txtbgn
      00868E 4D               [ 1]   55 	tnz a 
      00868F 27 04            [ 1]   56 	jreq search_ln_loop
      008691 90 CE 00 05      [ 2]   57 	ldw y,basicptr 
      008695                         58 search_ln_loop:
      008695 90 C3 00 1C      [ 2]   59 	cpw y,txtend 
      008699 2A 10            [ 1]   60 	jrpl 8$
      00869B 90 F3            [ 1]   61 	cpw x,(y)
      00869D 27 0E            [ 1]   62 	jreq 9$
      00869F 2B 0A            [ 1]   63 	jrmi 8$ 
      0086A1 90 E6 02         [ 1]   64 	ld a,(2,y)
      0086A4 6B 02            [ 1]   65 	ld (LB,sp),a 
      0086A6 72 F9 01         [ 2]   66 	addw y,(LL,sp)
      0086A9 20 EA            [ 2]   67 	jra search_ln_loop 
      0086AB                         68 8$: 
      0086AB 5F               [ 1]   69 	clrw x 	
      0086AC 51               [ 1]   70 	exgw x,y 
      00062D                         71 9$: _drop VSIZE
      0086AD 5B 02            [ 2]    1     addw sp,#VSIZE 
      0086AF 51               [ 1]   72 	exgw x,y   
      0086B0 81               [ 4]   73 	ret 
                                     74 
                                     75 ;-------------------------------------
                                     76 ; delete line at addr
                                     77 ; input:
                                     78 ;   X 		addr of line i.e DEST for move 
                                     79 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                           000001    80 	LLEN=1
                           000003    81 	SRC=3
                           000004    82 	VSIZE=4
      0086B1                         83 del_line: 
      000631                         84 	_vars VSIZE 
      0086B1 52 04            [ 2]    1     sub sp,#VSIZE 
      0086B3 E6 02            [ 1]   85 	ld a,(2,x) ; line length
      0086B5 6B 02            [ 1]   86 	ld (LLEN+1,sp),a 
      0086B7 0F 01            [ 1]   87 	clr (LLEN,sp)
      0086B9 90 93            [ 1]   88 	ldw y,x  
      0086BB 72 F9 01         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      0086BE 17 03            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      0086C0 90 CE 00 1C      [ 2]   91 	ldw y,txtend 
      0086C4 72 F2 03         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      0086C7 90 CF 00 0D      [ 2]   93 	ldw acc16,y 
      0086CB 16 03            [ 2]   94 	ldw y,(SRC,sp)    ; source
      0086CD CD 8E 10         [ 4]   95 	call move
      0086D0 90 CE 00 1C      [ 2]   96 	ldw y,txtend 
      0086D4 72 F2 01         [ 2]   97 	subw y,(LLEN,sp)
      0086D7 90 CF 00 1C      [ 2]   98 	ldw txtend,y  
      00065B                         99 	_drop VSIZE     
      0086DB 5B 04            [ 2]    1     addw sp,#VSIZE 
      0086DD 81               [ 4]  100 	ret 
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
      0086DE                        115 create_gap:
      00065E                        116 	_vars VSIZE
      0086DE 52 06            [ 2]    1     sub sp,#VSIZE 
      0086E0 1F 03            [ 2]  117 	ldw (SRC,sp),x 
      0086E2 17 05            [ 2]  118 	ldw (LEN,sp),y 
      0086E4 90 CF 00 0D      [ 2]  119 	ldw acc16,y 
      0086E8 90 93            [ 1]  120 	ldw y,x ; SRC
      0086EA 72 BB 00 0D      [ 2]  121 	addw x,acc16  
      0086EE 1F 01            [ 2]  122 	ldw (DEST,sp),x 
                                    123 ;compute size to move 	
      0086F0 CE 00 1C         [ 2]  124 	ldw x,txtend 
      0086F3 72 F0 03         [ 2]  125 	subw x,(SRC,sp)
      0086F6 CF 00 0D         [ 2]  126 	ldw acc16,x ; size to move
      0086F9 1E 01            [ 2]  127 	ldw x,(DEST,sp) 
      0086FB CD 8E 10         [ 4]  128 	call move
      0086FE CE 00 1C         [ 2]  129 	ldw x,txtend
      008701 72 FB 05         [ 2]  130 	addw x,(LEN,sp)
      008704 CF 00 1C         [ 2]  131 	ldw txtend,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      000687                        132 9$:	_drop VSIZE 
      008707 5B 06            [ 2]    1     addw sp,#VSIZE 
      008709 81               [ 4]  133 	ret 
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
      00870A                        150 insert_line:
      00068A                        151 	_vars VSIZE 
      00870A 52 08            [ 2]    1     sub sp,#VSIZE 
      00870C CE 00 1C         [ 2]  152 	ldw x,txtend  
      00870F C3 00 1A         [ 2]  153 	cpw x,txtbgn 
      008712 26 19            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      008714 AE 00 02         [ 2]  156 	ldw x,#2 
      008717 72 D6 00 18      [ 4]  157 	ld a,([ptr16],x)
      00871B A1 03            [ 1]  158 	cp a,#3
      00871D 27 5A            [ 1]  159 	jreq insert_ln_exit
      00871F 5F               [ 1]  160 	clrw x 
      008720 97               [ 1]  161 	ld xl,a
      008721 1F 07            [ 2]  162 	ldw (LLEN,sp),x 
      008723 CE 00 1A         [ 2]  163 	ldw x,txtbgn
      008726 1F 01            [ 2]  164 	ldw (DEST,sp),x 
      008728 CE 00 1C         [ 2]  165 	ldw x,txtend 
      00872B 20 38            [ 2]  166 	jra 4$
      00872D 72 CE 00 18      [ 5]  167 0$:	ldw x,[ptr16]
                                    168 ; line number
      008731 1F 05            [ 2]  169 	ldw (LINENO,sp),x 
      008733 AE 00 02         [ 2]  170 	ldw x,#2 
      008736 72 D6 00 18      [ 4]  171 	ld a,([ptr16],x)
      00873A 97               [ 1]  172 	ld xl,a
                                    173 ; line length
      00873B 1F 07            [ 2]  174 	ldw (LLEN,sp),x
                                    175 ; check if that line number already exit 	
      00873D 1E 05            [ 2]  176 	ldw x,(LINENO,sp)
      00873F 4F               [ 1]  177 	clr a 
      008740 CD 86 86         [ 4]  178 	call search_lineno 
      008743 5D               [ 2]  179 	tnzw x 
      008744 26 04            [ 1]  180 	jrne 2$
                                    181 ; line doesn't exit
                                    182 ; it will be inserted at this point.  	
      008746 17 01            [ 2]  183 	ldw (DEST,sp),y 
      008748 20 05            [ 2]  184 	jra 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                    185 ; line exit delete it.
                                    186 ; it will be replaced by new one 	
      00874A 1F 01            [ 2]  187 2$: ldw (DEST,sp),x 
      00874C CD 86 B1         [ 4]  188 	call del_line
      00874F                        189 3$: 
                                    190 ; insert new line or leave if LLEN==3
                                    191 ; LLEN==3 means empty line 
      00874F A6 03            [ 1]  192 	ld a,#3
      008751 11 08            [ 1]  193 	cp a,(LLEN+1,sp)
      008753 27 24            [ 1]  194 	jreq insert_ln_exit ; empty line exit.
                                    195 ; if insertion point at txtend 
                                    196 ; move no need to create a gap 
      008755 1E 01            [ 2]  197 	ldw x,(DEST,sp)
      008757 C3 00 1C         [ 2]  198 	cpw x,txtend 
      00875A 27 09            [ 1]  199 	jreq 4$ 
                                    200 ; must create a gap
                                    201 ; at insertion point  
      00875C 1E 01            [ 2]  202 	ldw x,(DEST,sp)
      00875E 16 07            [ 2]  203 	ldw y,(LLEN,sp)
      008760 CD 86 DE         [ 4]  204 	call create_gap
      008763 20 06            [ 2]  205 	jra 5$
      008765                        206 4$: 
      008765 72 FB 07         [ 2]  207 	addw x,(LLEN,sp)
      008768 CF 00 1C         [ 2]  208 	ldw txtend,x 	 
                                    209 ; move new line in gap 
      00876B 1E 07            [ 2]  210 5$:	ldw x,(LLEN,sp)
      00876D CF 00 0D         [ 2]  211 	ldw acc16,x 
      008770 90 AE 16 E0      [ 2]  212 	ldw y,#pad ;SRC 
      008774 1E 01            [ 2]  213 	ldw x,(DEST,sp) ; dest address 
      008776 CD 8E 10         [ 4]  214 	call move 
      008779                        215 insert_ln_exit:	
      0006F9                        216 	_drop VSIZE
      008779 5B 08            [ 2]    1     addw sp,#VSIZE 
      00877B 81               [ 4]  217 	ret
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
      00877C                        233 parse_quote: 
      0006FC                        234 	_vars VSIZE 
      00877C 52 02            [ 2]    1     sub sp,#VSIZE 
      00877E 4F               [ 1]  235 	clr a
      00877F 6B 01            [ 1]  236 1$:	ld (PREV,sp),a 
      008781                        237 2$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      008781 91 D6 01         [ 4]  238 	ld a,([in.w],y)
      008784 27 24            [ 1]  239 	jreq 6$
      008786 72 5C 00 02      [ 1]  240 	inc in 
      00878A 6B 02            [ 1]  241 	ld (CURR,sp),a 
      00878C A6 5C            [ 1]  242 	ld a,#'\
      00878E 11 01            [ 1]  243 	cp a, (PREV,sp)
      008790 26 0A            [ 1]  244 	jrne 3$
      008792 0F 01            [ 1]  245 	clr (PREV,sp)
      008794 7B 02            [ 1]  246 	ld a,(CURR,sp)
      008796 AD 1C            [ 4]  247 	callr convert_escape
      008798 F7               [ 1]  248 	ld (x),a 
      008799 5C               [ 1]  249 	incw x 
      00879A 20 E5            [ 2]  250 	jra 2$
      00879C                        251 3$:
      00879C 7B 02            [ 1]  252 	ld a,(CURR,sp)
      00879E A1 5C            [ 1]  253 	cp a,#'\'
      0087A0 27 DD            [ 1]  254 	jreq 1$
      0087A2 A1 22            [ 1]  255 	cp a,#'"
      0087A4 27 04            [ 1]  256 	jreq 6$ 
      0087A6 F7               [ 1]  257 	ld (x),a 
      0087A7 5C               [ 1]  258 	incw x 
      0087A8 20 D7            [ 2]  259 	jra 2$
      0087AA                        260 6$:
      0087AA 7F               [ 1]  261 	clr (x)
      0087AB 5C               [ 1]  262 	incw x 
      0087AC 90 93            [ 1]  263 	ldw y,x 
      0087AE 5F               [ 1]  264 	clrw x 
      0087AF A6 02            [ 1]  265 	ld a,#TK_QSTR  
      000731                        266 	_drop VSIZE
      0087B1 5B 02            [ 2]    1     addw sp,#VSIZE 
      0087B3 81               [ 4]  267 	ret 
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
      0087B4                        278 convert_escape:
      0087B4 89               [ 2]  279 	pushw x 
      0087B5 AE 87 C9         [ 2]  280 	ldw x,#escaped 
      0087B8 F1               [ 1]  281 1$:	cp a,(x)
      0087B9 27 06            [ 1]  282 	jreq 2$
      0087BB 7D               [ 1]  283 	tnz (x)
      0087BC 27 09            [ 1]  284 	jreq 3$
      0087BE 5C               [ 1]  285 	incw x 
      0087BF 20 F7            [ 2]  286 	jra 1$
      0087C1 1D 87 C9         [ 2]  287 2$: subw x,#escaped 
      0087C4 9F               [ 1]  288 	ld a,xl 
      0087C5 AB 07            [ 1]  289 	add a,#7
      0087C7 85               [ 2]  290 3$:	popw x 
      0087C8 81               [ 4]  291 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                                    292 
      0087C9 61 62 74 6E 76 66 72   293 escaped:: .asciz "abtnvfr"
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
      0087D1                        310 parse_integer: ; { -- n }
      0087D1 89               [ 2]  311 	pushw x 	
      0087D2 4B 00            [ 1]  312 	push #0 ; TCHAR
      0087D4 4B 0A            [ 1]  313 	push #10 ; BASE=10
      0087D6 A1 24            [ 1]  314 	cp a,#'$
      0087D8 26 04            [ 1]  315 	jrne 2$ 
      00075A                        316     _drop #1
      0087DA 5B 01            [ 2]    1     addw sp,##1 
      0087DC 4B 10            [ 1]  317 	push #16  ; BASE=16
      0087DE F7               [ 1]  318 2$:	ld (x),a 
      0087DF 5C               [ 1]  319 	incw x 
      0087E0 91 D6 01         [ 4]  320 	ld a,([in.w],y)
      0087E3 72 5C 00 02      [ 1]  321 	inc in 
      0087E7 CD 93 D5         [ 4]  322 	call to_upper 
      0087EA 6B 02            [ 1]  323 	ld (TCHAR,sp),a 
      0087EC CD 8E 79         [ 4]  324 	call is_digit 
      0087EF 25 ED            [ 1]  325 	jrc 2$
      0087F1 A6 10            [ 1]  326 	ld a,#16 
      0087F3 11 01            [ 1]  327 	cp a,(BASE,sp)
      0087F5 26 0A            [ 1]  328 	jrne 3$ 
      0087F7 7B 02            [ 1]  329 	ld a,(TCHAR,sp)
      0087F9 A1 41            [ 1]  330 	cp a,#'A 
      0087FB 2B 04            [ 1]  331 	jrmi 3$ 
      0087FD A1 47            [ 1]  332 	cp a,#'G 
      0087FF 2B DD            [ 1]  333 	jrmi 2$ 
      008801 72 5A 00 02      [ 1]  334 3$: dec in 	
      008805 7F               [ 1]  335     clr (x)
      008806 1E 03            [ 2]  336 	ldw x,(XSAVE,sp)
      008808 CD 93 E1         [ 4]  337 	call atoi24
      00880B 90 93            [ 1]  338 	ldw y,x 
      00880D CE 00 0D         [ 2]  339 	ldw x,acc16 
      008810 A6 84            [ 1]  340 	ld a,#TK_INTGR
      008812 90 FF            [ 2]  341 	ldw (y),x 
      008814 72 A9 00 02      [ 2]  342 	addw y,#2
      000798                        343 	_drop VSIZE  
      008818 5B 04            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      00881A 81               [ 4]  344 	ret 	
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
      00881B                        361 parse_binary: ; { -- n }
      00881B 4B 00            [ 1]  362 	push #0
      00881D 4B 00            [ 1]  363 	push #0
      00881F 4B 00            [ 1]  364 	push #0
      008821                        365 2$:	
      008821 91 D6 01         [ 4]  366 	ld a,([in.w],y)
      008824 72 5C 00 02      [ 1]  367 	inc in 
      008828 A1 30            [ 1]  368 	cp a,#'0 
      00882A 27 06            [ 1]  369 	jreq 3$
      00882C A1 31            [ 1]  370 	cp a,#'1 
      00882E 27 02            [ 1]  371 	jreq 3$ 
      008830 20 0B            [ 2]  372 	jra bin_exit 
      008832 A0 30            [ 1]  373 3$: sub a,#'0 
      008834 46               [ 1]  374 	rrc a
      008835 09 03            [ 1]  375 	rlc (BINARY+2,sp) 
      008837 09 02            [ 1]  376 	rlc (BINARY+1,sp)
      008839 09 01            [ 1]  377 	rlc (BINARY,sp) 
      00883B 20 E4            [ 2]  378 	jra 2$  
      00883D                        379 bin_exit:
      00883D 72 5A 00 02      [ 1]  380 	dec in 
      008841 90 93            [ 1]  381 	ldw y,x
      008843 7B 01            [ 1]  382 	ld a,(BINARY,sp)
      008845 C7 00 0C         [ 1]  383 	ld acc24,a 
      008848 1E 02            [ 2]  384 	ldw x,(BINARY+1,sp)
      00884A CF 00 0D         [ 2]  385 	ldw acc16,x
      00884D 90 FF            [ 2]  386 	ldw (y),x 
      00884F 72 A9 00 02      [ 2]  387 	addw y,#2  
      008853 A6 84            [ 1]  388 	ld a,#TK_INTGR 	
      0007D5                        389 	_drop VSIZE 
      008855 5B 03            [ 2]    1     addw sp,#VSIZE 
      008857 81               [ 4]  390 	ret
                                    391 
                                    392 ;---------------------------
                                    393 ;  token begin with a letter,
                                    394 ;  is keyword or variable. 	
                                    395 ; input:
                                    396 ;   X 		point to pad 
                                    397 ;   Y 		point to text
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                    398 ;   A 	    first letter  
                                    399 ; output:
                                    400 ;   X		exec_addr|var_addr 
                                    401 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC  
                                    402 ;   pad 	keyword|var_name  
                                    403 ;--------------------------  
                           000001   404 	XFIRST=1
                           000002   405 	VSIZE=2
      008858                        406 parse_keyword: 
      008858 89               [ 2]  407 	pushw x 
      008859                        408 kw_loop:	
      008859 CD 93 D5         [ 4]  409 	call to_upper 
      00885C F7               [ 1]  410 	ld (x),a 
      00885D 5C               [ 1]  411 	incw x 
      00885E 91 D6 01         [ 4]  412 	ld a,([in.w],y)
      008861 72 5C 00 02      [ 1]  413 	inc in 
      008865 CD 8E 68         [ 4]  414 	call is_alpha 
      008868 25 EF            [ 1]  415 	jrc kw_loop
      00886A 72 5A 00 02      [ 1]  416 	dec in   
      00886E 7F               [ 1]  417 1$: clr (x)
      00886F 1E 01            [ 2]  418 	ldw x,(XFIRST,sp) 
      008871 E6 01            [ 1]  419 	ld a,(1,x)
      008873 26 13            [ 1]  420 	jrne 2$
                                    421 ; one letter variable name 
      008875 F6               [ 1]  422 	ld a,(x) 
      008876 A0 41            [ 1]  423 	sub a,#'A 
      008878 48               [ 1]  424 	sll a 
      008879 88               [ 1]  425 	push a 
      00887A 4B 00            [ 1]  426 	push #0
      00887C AE 00 2D         [ 2]  427 	ldw x,#vars 
      00887F 72 FB 01         [ 2]  428 	addw x,(1,sp) ; X=var address 
      000802                        429 	_drop 2 
      008882 5B 02            [ 2]    1     addw sp,#2 
      008884 A6 85            [ 1]  430 	ld a,#TK_VAR 
      008886 20 0E            [ 2]  431 	jra 4$ 
      008888                        432 2$: ; check for keyword, otherwise syntax error.
      000808                        433 	_ldx_dict kword_dict ; dictionary entry point
      008888 AE A9 9A         [ 2]    1     ldw x,#kword_dict+2
      00888B 16 01            [ 2]  434 	ldw y,(XFIRST,sp) ; name to search for
      00888D CD 95 C8         [ 4]  435 	call search_dict
      008890 4D               [ 1]  436 	tnz a
      008891 26 03            [ 1]  437 	jrne 4$ 
      008893 CC 91 8C         [ 2]  438 	jp syntax_error
      008896                        439 4$:	
      008896 16 01            [ 2]  440 	ldw y,(XFIRST,sp)
      008898 A3 00 50         [ 2]  441 	cpw x,#LET_IDX 
      00889B 27 0A            [ 1]  442 	jreq 5$  ; don't compile LET command 
      00889D 90 F7            [ 1]  443 	ld (y),a 
      00889F 90 5C            [ 1]  444 	incw y 
      0088A1 90 FF            [ 2]  445 	ldw (y),x
      0088A3 72 A9 00 02      [ 2]  446 	addw y,#2  
      000827                        447 5$:	_drop VSIZE 
      0088A7 5B 02            [ 2]    1     addw sp,#VSIZE 
      0088A9 81               [ 4]  448 	ret  	
                                    449 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                    450 ;------------------------------------
                                    451 ; skip character c in text starting from 'in'
                                    452 ; input:
                                    453 ;	 y 		point to text buffer
                                    454 ;    a 		character to skip
                                    455 ; output:  
                                    456 ;	'in' ajusted to new position
                                    457 ;------------------------------------
                           000001   458 	C = 1 ; local var
      0088AA                        459 skip:
      0088AA 88               [ 1]  460 	push a
      0088AB 91 D6 01         [ 4]  461 1$:	ld a,([in.w],y)
      0088AE 27 0A            [ 1]  462 	jreq 2$
      0088B0 11 01            [ 1]  463 	cp a,(C,sp)
      0088B2 26 06            [ 1]  464 	jrne 2$
      0088B4 72 5C 00 02      [ 1]  465 	inc in
      0088B8 20 F1            [ 2]  466 	jra 1$
      00083A                        467 2$: _drop 1 
      0088BA 5B 01            [ 2]    1     addw sp,#1 
      0088BC 81               [ 4]  468 	ret
                                    469 	
                                    470 
                                    471 ;------------------------------------
                                    472 ; scan text for next token
                                    473 ; input: 
                                    474 ;	X 		pointer to buffer where 
                                    475 ;	        token id and value are copied 
                                    476 ; use:
                                    477 ;	Y   pointer to text in tib 
                                    478 ; output:
                                    479 ;   A       token attribute 
                                    480 ;   X 		token value
                                    481 ;   Y       updated position in output buffer   
                                    482 ;------------------------------------
                                    483 	; use to check special character 
                                    484 	.macro _case c t  
                                    485 	ld a,#c 
                                    486 	cp a,(TCHAR,sp) 
                                    487 	jrne t
                                    488 	.endm 
                                    489 
                           000001   490 	TCHAR=1
                           000002   491 	ATTRIB=2
                           000002   492 	VSIZE=2
      0088BD                        493 get_token:: 
      00083D                        494 	_vars VSIZE
      0088BD 52 02            [ 2]    1     sub sp,#VSIZE 
                                    495 ;	ld a,in 
                                    496 ;	sub a,count
                                    497 ;   jrmi 0$
                                    498 ;	clr a 
                                    499 ;	ret 
      0088BF                        500 0$: 
      0088BF 90 AE 16 90      [ 2]  501 	ldw y,#tib    	
      0088C3 A6 20            [ 1]  502 	ld a,#SPACE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      0088C5 CD 88 AA         [ 4]  503 	call skip
      0088C8 55 00 02 00 03   [ 1]  504 	mov in.saved,in 
      0088CD 91 D6 01         [ 4]  505 	ld a,([in.w],y)
      0088D0 26 05            [ 1]  506 	jrne 1$
      0088D2 90 93            [ 1]  507 	ldw y,x 
      0088D4 CC 8A 79         [ 2]  508 	jp token_exit ; end of line 
      0088D7 72 5C 00 02      [ 1]  509 1$:	inc in 
      0088DB CD 93 D5         [ 4]  510 	call to_upper 
      0088DE 6B 01            [ 1]  511 	ld (TCHAR,sp),a 
                                    512 ; check for quoted string
      0088E0                        513 str_tst:  	
      000860                        514 	_case '"' nbr_tst
      0088E0 A6 22            [ 1]    1 	ld a,#'"' 
      0088E2 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0088E4 26 0A            [ 1]    3 	jrne nbr_tst
      0088E6 A6 02            [ 1]  515 	ld a,#TK_QSTR
      0088E8 F7               [ 1]  516 	ld (x),a 
      0088E9 5C               [ 1]  517 	incw x 
      0088EA CD 87 7C         [ 4]  518 	call parse_quote
      0088ED CC 8A 79         [ 2]  519 	jp token_exit
      0088F0                        520 nbr_tst:
                                    521 ; check for hexadecimal number 
      0088F0 A6 24            [ 1]  522 	ld a,#'$'
      0088F2 11 01            [ 1]  523 	cp a,(TCHAR,sp) 
      0088F4 27 17            [ 1]  524 	jreq 1$
                                    525 ;check for binary number 
      0088F6 A6 26            [ 1]  526 	ld a,#'&
      0088F8 11 01            [ 1]  527 	cp a,(TCHAR,sp)
      0088FA 26 0A            [ 1]  528 	jrne 0$
      0088FC A6 84            [ 1]  529 	ld a,#TK_INTGR
      0088FE F7               [ 1]  530 	ld (x),a 
      0088FF 5C               [ 1]  531 	incw x 
      008900 CD 88 1B         [ 4]  532 	call parse_binary ; expect binary integer 
      008903 CC 8A 79         [ 2]  533 	jp token_exit 
                                    534 ; check for decimal number 	
      008906 7B 01            [ 1]  535 0$:	ld a,(TCHAR,sp)
      008908 CD 8E 79         [ 4]  536 	call is_digit
      00890B 24 0C            [ 1]  537 	jrnc 3$
      00890D A6 84            [ 1]  538 1$:	ld a,#TK_INTGR 
      00890F F7               [ 1]  539 	ld (x),a 
      008910 5C               [ 1]  540 	incw x 
      008911 7B 01            [ 1]  541 	ld a,(TCHAR,sp)
      008913 CD 87 D1         [ 4]  542 	call parse_integer 
      008916 CC 8A 79         [ 2]  543 	jp token_exit 
      008919                        544 3$: 
      000899                        545 	_case '(' bkslsh_tst 
      008919 A6 28            [ 1]    1 	ld a,#'(' 
      00891B 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00891D 26 05            [ 1]    3 	jrne bkslsh_tst
      00891F A6 07            [ 1]  546 	ld a,#TK_LPAREN
      008921 CC 8A 75         [ 2]  547 	jp token_char   	
      008924                        548 bkslsh_tst: ; character token 
      0008A4                        549 	_case '\',rparnt_tst
      008924 A6 5C            [ 1]    1 	ld a,#'\' 
      008926 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      008928 26 16            [ 1]    3 	jrne rparnt_tst
      00892A A6 03            [ 1]  550 	ld a,#TK_CHAR 
      00892C F7               [ 1]  551 	ld (x),a 
      00892D 5C               [ 1]  552 	incw x 
      00892E 91 D6 01         [ 4]  553 	ld a,([in.w],y)
      008931 F7               [ 1]  554 	ld (x),a 
      008932 5C               [ 1]  555 	incw x
      008933 90 93            [ 1]  556 	ldw y,x 	 
      008935 72 5C 00 02      [ 1]  557 	inc in  
      008939 5F               [ 1]  558 	clrw x 
      00893A 97               [ 1]  559 	ld xl,a 
      00893B A6 03            [ 1]  560 	ld a,#TK_CHAR 
      00893D CC 8A 79         [ 2]  561 	jp token_exit 
      008940                        562 rparnt_tst:		
      0008C0                        563 	_case ')' colon_tst 
      008940 A6 29            [ 1]    1 	ld a,#')' 
      008942 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008944 26 05            [ 1]    3 	jrne colon_tst
      008946 A6 08            [ 1]  564 	ld a,#TK_RPAREN 
      008948 CC 8A 75         [ 2]  565 	jp token_char
      00894B                        566 colon_tst:
      0008CB                        567 	_case ':' comma_tst 
      00894B A6 3A            [ 1]    1 	ld a,#':' 
      00894D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00894F 26 05            [ 1]    3 	jrne comma_tst
      008951 A6 0B            [ 1]  568 	ld a,#TK_COLON 
      008953 CC 8A 75         [ 2]  569 	jp token_char  
      008956                        570 comma_tst:
      0008D6                        571 	_case COMMA sharp_tst 
      008956 A6 2C            [ 1]    1 	ld a,#COMMA 
      008958 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00895A 26 05            [ 1]    3 	jrne sharp_tst
      00895C A6 09            [ 1]  572 	ld a,#TK_COMMA
      00895E CC 8A 75         [ 2]  573 	jp token_char
      008961                        574 sharp_tst:
      0008E1                        575 	_case SHARP dash_tst 
      008961 A6 23            [ 1]    1 	ld a,#SHARP 
      008963 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008965 26 05            [ 1]    3 	jrne dash_tst
      008967 A6 0A            [ 1]  576 	ld a,#TK_SHARP
      008969 CC 8A 75         [ 2]  577 	jp token_char  	 	 
      00896C                        578 dash_tst: 	
      0008EC                        579 	_case '-' at_tst 
      00896C A6 2D            [ 1]    1 	ld a,#'-' 
      00896E 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008970 26 05            [ 1]    3 	jrne at_tst
      008972 A6 11            [ 1]  580 	ld a,#TK_MINUS  
      008974 CC 8A 75         [ 2]  581 	jp token_char 
      008977                        582 at_tst:
      0008F7                        583 	_case '@' qmark_tst 
      008977 A6 40            [ 1]    1 	ld a,#'@' 
      008979 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00897B 26 05            [ 1]    3 	jrne qmark_tst
      00897D A6 06            [ 1]  584 	ld a,#TK_ARRAY 
      00897F CC 8A 75         [ 2]  585 	jp token_char
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      008982                        586 qmark_tst:
      000902                        587 	_case '?' tick_tst 
      008982 A6 3F            [ 1]    1 	ld a,#'?' 
      008984 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008986 26 12            [ 1]    3 	jrne tick_tst
      008988 A6 80            [ 1]  588 	ld a,#TK_CMD  
      00898A F7               [ 1]  589 	ld (x),a 
      00898B 5C               [ 1]  590 	incw x 
      00898C 90 93            [ 1]  591 	ldw y,x 
      00898E AE 00 72         [ 2]  592 	ldw x,#PRT_IDX 
      008991 90 FF            [ 2]  593 	ldw (y),x 
      008993 72 A9 00 02      [ 2]  594 	addw y,#2
      008997 CC 8A 79         [ 2]  595 	jp token_exit
      00899A                        596 tick_tst: ; comment 
      00091A                        597 	_case TICK plus_tst 
      00899A A6 27            [ 1]    1 	ld a,#TICK 
      00899C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00899E 26 35            [ 1]    3 	jrne plus_tst
      0089A0 A6 80            [ 1]  598 	ld a,#TK_CMD
      0089A2 F7               [ 1]  599 	ld (x),a 
      0089A3 5C               [ 1]  600 	incw x
      0089A4 90 AE 00 8C      [ 2]  601 	ldw y,#REM_IDX
      0089A8 FF               [ 2]  602 	ldw (x),y 
      0089A9 1C 00 02         [ 2]  603 	addw x,#2  
      0089AC                        604 copy_comment:
      0089AC 90 AE 16 90      [ 2]  605 	ldw y,#tib 
      0089B0 72 B9 00 01      [ 2]  606 	addw y,in.w
      0089B4 90 89            [ 2]  607 	pushw y
      0089B6 CD 8E 00         [ 4]  608 	call strcpy
      0089B9 72 F2 01         [ 2]  609     subw y,(1,sp)
      0089BC 90 9F            [ 1]  610 	ld a,yl 
      0089BE CB 00 02         [ 1]  611 	add a,in
      0089C1 C7 00 02         [ 1]  612 	ld in,a 
      0089C4 1F 01            [ 2]  613 	ldw (1,sp),x
      0089C6 72 F9 01         [ 2]  614 	addw y,(1,sp)
      0089C9 90 5C            [ 1]  615 	incw y 
      00094B                        616 	_drop 2 
      0089CB 5B 02            [ 2]    1     addw sp,#2 
      0089CD AE 00 8C         [ 2]  617 	ldw x,#REM_IDX 
      0089D0 A6 80            [ 1]  618 	ld a,#TK_CMD 
      0089D2 CC 8A 79         [ 2]  619 	jp token_exit 
      0089D5                        620 plus_tst:
      000955                        621 	_case '+' star_tst 
      0089D5 A6 2B            [ 1]    1 	ld a,#'+' 
      0089D7 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0089D9 26 05            [ 1]    3 	jrne star_tst
      0089DB A6 10            [ 1]  622 	ld a,#TK_PLUS  
      0089DD CC 8A 75         [ 2]  623 	jp token_char 
      0089E0                        624 star_tst:
      000960                        625 	_case '*' slash_tst 
      0089E0 A6 2A            [ 1]    1 	ld a,#'*' 
      0089E2 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0089E4 26 05            [ 1]    3 	jrne slash_tst
      0089E6 A6 20            [ 1]  626 	ld a,#TK_MULT 
      0089E8 CC 8A 75         [ 2]  627 	jp token_char 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      0089EB                        628 slash_tst: 
      00096B                        629 	_case '/' prcnt_tst 
      0089EB A6 2F            [ 1]    1 	ld a,#'/' 
      0089ED 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0089EF 26 05            [ 1]    3 	jrne prcnt_tst
      0089F1 A6 21            [ 1]  630 	ld a,#TK_DIV 
      0089F3 CC 8A 75         [ 2]  631 	jp token_char 
      0089F6                        632 prcnt_tst:
      000976                        633 	_case '%' eql_tst 
      0089F6 A6 25            [ 1]    1 	ld a,#'%' 
      0089F8 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0089FA 26 05            [ 1]    3 	jrne eql_tst
      0089FC A6 22            [ 1]  634 	ld a,#TK_MOD
      0089FE CC 8A 75         [ 2]  635 	jp token_char  
                                    636 ; 1 or 2 character tokens 	
      008A01                        637 eql_tst:
      000981                        638 	_case '=' gt_tst 		
      008A01 A6 3D            [ 1]    1 	ld a,#'=' 
      008A03 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A05 26 05            [ 1]    3 	jrne gt_tst
      008A07 A6 32            [ 1]  639 	ld a,#TK_EQUAL
      008A09 CC 8A 75         [ 2]  640 	jp token_char 
      008A0C                        641 gt_tst:
      00098C                        642 	_case '>' lt_tst 
      008A0C A6 3E            [ 1]    1 	ld a,#'>' 
      008A0E 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A10 26 23            [ 1]    3 	jrne lt_tst
      008A12 A6 31            [ 1]  643 	ld a,#TK_GT 
      008A14 6B 02            [ 1]  644 	ld (ATTRIB,sp),a 
      008A16 91 D6 01         [ 4]  645 	ld a,([in.w],y)
      008A19 72 5C 00 02      [ 1]  646 	inc in 
      008A1D A1 3D            [ 1]  647 	cp a,#'=
      008A1F 26 04            [ 1]  648 	jrne 1$
      008A21 A6 33            [ 1]  649 	ld a,#TK_GE 
      008A23 20 50            [ 2]  650 	jra token_char  
      008A25 A1 3C            [ 1]  651 1$: cp a,#'<
      008A27 26 04            [ 1]  652 	jrne 2$
      008A29 A6 35            [ 1]  653 	ld a,#TK_NE 
      008A2B 20 48            [ 2]  654 	jra token_char 
      008A2D 72 5A 00 02      [ 1]  655 2$: dec in
      008A31 7B 02            [ 1]  656 	ld a,(ATTRIB,sp)
      008A33 20 40            [ 2]  657 	jra token_char 	 
      008A35                        658 lt_tst:
      0009B5                        659 	_case '<' other
      008A35 A6 3C            [ 1]    1 	ld a,#'<' 
      008A37 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008A39 26 23            [ 1]    3 	jrne other
      008A3B A6 34            [ 1]  660 	ld a,#TK_LT 
      008A3D 6B 02            [ 1]  661 	ld (ATTRIB,sp),a 
      008A3F 91 D6 01         [ 4]  662 	ld a,([in.w],y)
      008A42 72 5C 00 02      [ 1]  663 	inc in 
      008A46 A1 3D            [ 1]  664 	cp a,#'=
      008A48 26 04            [ 1]  665 	jrne 1$
      008A4A A6 36            [ 1]  666 	ld a,#TK_LE 
      008A4C 20 27            [ 2]  667 	jra token_char 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      008A4E A1 3E            [ 1]  668 1$: cp a,#'>
      008A50 26 04            [ 1]  669 	jrne 2$
      008A52 A6 35            [ 1]  670 	ld a,#TK_NE 
      008A54 20 1F            [ 2]  671 	jra token_char 
      008A56 72 5A 00 02      [ 1]  672 2$: dec in 
      008A5A 7B 02            [ 1]  673 	ld a,(ATTRIB,sp)
      008A5C 20 17            [ 2]  674 	jra token_char 	
      008A5E                        675 other: ; not a special character 	 
      008A5E 7B 01            [ 1]  676 	ld a,(TCHAR,sp)
      008A60 CD 8E 68         [ 4]  677 	call is_alpha 
      008A63 25 03            [ 1]  678 	jrc 30$ 
      008A65 CC 91 8C         [ 2]  679 	jp syntax_error 
      008A68                        680 30$: 
      008A68 CD 88 58         [ 4]  681 	call parse_keyword
      008A6B A3 9A AC         [ 2]  682 	cpw x,#remark 
      008A6E 26 09            [ 1]  683 	jrne token_exit 
      008A70 90 93            [ 1]  684 	ldw y,x 
      008A72 CC 89 AC         [ 2]  685 	jp copy_comment 
      008A75                        686 token_char:
      008A75 F7               [ 1]  687 	ld (x),a 
      008A76 5C               [ 1]  688 	incw x
      008A77 90 93            [ 1]  689 	ldw y,x 
      008A79                        690 token_exit:
      0009F9                        691 	_drop VSIZE 
      008A79 5B 02            [ 2]    1     addw sp,#VSIZE 
      008A7B 81               [ 4]  692 	ret
                                    693 
                                    694 
                                    695 ;-----------------------------------
                                    696 ; create token list fromm text line 
                                    697 ; save this list in pad buffer 
                                    698 ;  compiled line format: 
                                    699 ;    line_no  2 bytes {0...32767}
                                    700 ;    count    1 byte  
                                    701 ;    tokens   variable length 
                                    702 ;   
                                    703 ; input:
                                    704 ;   none
                                    705 ; modified variables:
                                    706 ;   basicptr     token list buffer address 
                                    707 ;   in.w  		 3|count, i.e. index in buffer
                                    708 ;   count        length of line | 0  
                                    709 ;-----------------------------------
                           000001   710 	XSAVE=1
                           000002   711 	VSIZE=2
      008A7C                        712 compile::
      0009FC                        713 	_vars VSIZE 
      008A7C 52 02            [ 2]    1     sub sp,#VSIZE 
      008A7E 55 00 1A 00 05   [ 1]  714 	mov basicptr,txtbgn
      008A83 72 1A 00 21      [ 1]  715 	bset flags,#FCOMP 
      008A87 A6 00            [ 1]  716 	ld a,#0
      008A89 AE 00 00         [ 2]  717 	ldw x,#0
      008A8C CF 16 E0         [ 2]  718 	ldw pad,x ; destination buffer 
      008A8F C7 16 E2         [ 1]  719 	ld pad+2,a ; count 
      008A92 AE 16 E3         [ 2]  720 	ldw x,#pad+3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      008A95 72 5F 00 02      [ 1]  721 	clr in 
      008A99 CD 88 BD         [ 4]  722 	call get_token
      008A9C A1 84            [ 1]  723 	cp a,#TK_INTGR
      008A9E 26 11            [ 1]  724 	jrne 2$
      008AA0 A3 00 01         [ 2]  725 	cpw x,#1 
      008AA3 2A 05            [ 1]  726 	jrpl 1$
      008AA5 A6 0A            [ 1]  727 	ld a,#ERR_BAD_VALUE
      008AA7 CC 91 8E         [ 2]  728 	jp tb_error
      008AAA CF 16 E0         [ 2]  729 1$:	ldw pad,x 
      008AAD 90 AE 16 E3      [ 2]  730 	ldw y,#pad+3 
      008AB1 90 A3 17 60      [ 2]  731 2$:	cpw y,#stack_full 
      008AB5 25 05            [ 1]  732 	jrult 3$
      008AB7 A6 0F            [ 1]  733 	ld a,#ERR_BUF_FULL 
      008AB9 CC 91 8E         [ 2]  734 	jp tb_error 
      008ABC                        735 3$:	
      008ABC 93               [ 1]  736 	ldw x,y 
      008ABD CD 88 BD         [ 4]  737 	call get_token 
      008AC0 A1 00            [ 1]  738 	cp a,#TK_NONE 
      008AC2 26 ED            [ 1]  739 	jrne 2$ 
                                    740 ; compilation completed  
      008AC4 72 A2 16 E0      [ 2]  741 	subw y,#pad
      008AC8 90 9F            [ 1]  742     ld a,yl
      008ACA AE 16 E0         [ 2]  743 	ldw x,#pad 
      008ACD CF 00 18         [ 2]  744 	ldw ptr16,x 
      008AD0 E7 02            [ 1]  745 	ld (2,x),a 
      008AD2 FE               [ 2]  746 	ldw x,(x)
      008AD3 27 09            [ 1]  747 	jreq 10$
      008AD5 CD 87 0A         [ 4]  748 	call insert_line
      008AD8 72 5F 00 04      [ 1]  749 	clr  count 
      008ADC 20 0F            [ 2]  750 	jra  11$ 
      008ADE                        751 10$: ; line# is zero 
      008ADE CE 00 18         [ 2]  752 	ldw x,ptr16  
      008AE1 CF 00 05         [ 2]  753 	ldw basicptr,x 
      008AE4 E6 02            [ 1]  754 	ld a,(2,x)
      008AE6 C7 00 04         [ 1]  755 	ld count,a 
      008AE9 35 03 00 02      [ 1]  756 	mov in,#3 
      008AED                        757 11$:
      000A6D                        758 	_drop VSIZE 
      008AED 5B 02            [ 2]    1     addw sp,#VSIZE 
      008AEF 72 1B 00 21      [ 1]  759 	bres flags,#FCOMP 
      008AF3 81               [ 4]  760 	ret 
                                    761 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                     27     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000000     5 SEPARATE=0 ; set to 1 for 'make separate' 
                                      6 
                                      7 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
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
      008AF4                         48 cpy_cmd_name:
      008AF4 F6               [ 1]   49 	ld a,(x)
      008AF5 5C               [ 1]   50 	incw x
      008AF6 A4 0F            [ 1]   51 	and a,#15  
      008AF8 88               [ 1]   52 	push a 
      008AF9 0D 01            [ 1]   53     tnz (1,sp) 
      008AFB 27 0A            [ 1]   54 	jreq 9$
      008AFD F6               [ 1]   55 1$:	ld a,(x)
      008AFE 90 F7            [ 1]   56 	ld (y),a  
      008B00 5C               [ 1]   57 	incw x
      008B01 90 5C            [ 1]   58 	incw y 
      008B03 0A 01            [ 1]   59 	dec (1,sp)	 
      008B05 26 F6            [ 1]   60 	jrne 1$
      008B07 84               [ 1]   61 9$: pop a 
      008B08 81               [ 4]   62 	ret	
                                     63 
                                     64 ;--------------------------
                                     65 ; add a space after letter or 
                                     66 ; digit.
                                     67 ; input:
                                     68 ;   Y     pointer to buffer 
                                     69 ; output:
                                     70 ;   Y    moved to end 
                                     71 ;--------------------------
      008B09                         72 add_space:
      008B09 90 5A            [ 2]   73 	decw y 
      008B0B 90 F6            [ 1]   74 	ld a,(y)
      008B0D 90 5C            [ 1]   75 	incw y
      008B0F CD 8E 82         [ 4]   76 	call is_alnum 
      008B12 24 06            [ 1]   77 	jrnc 1$
      008B14 A6 20            [ 1]   78 	ld a,#SPACE 
      008B16 90 F7            [ 1]   79 	ld (y),a 
      008B18 90 5C            [ 1]   80 	incw y 
      008B1A 81               [ 4]   81 1$: ret 
                                     82 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
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
      008B1B                         93 right_align::
      008B1B 88               [ 1]   94 	push a 
      008B1C 7B 01            [ 1]   95 0$: ld a,(1,sp)
      008B1E C1 00 22         [ 1]   96 	cp a,tab_width 
      008B21 2A 08            [ 1]   97 	jrpl 1$
      008B23 A6 20            [ 1]   98 	ld a,#SPACE 
      008B25 5A               [ 2]   99 	decw x
      008B26 F7               [ 1]  100 	ld (x),a  
      008B27 0C 01            [ 1]  101 	inc (1,sp)
      008B29 20 F1            [ 2]  102 	jra 0$ 
      008B2B 84               [ 1]  103 1$: pop a 	
      008B2C 81               [ 4]  104 	ret 
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
      008B2D                        117 cpy_quote:
      008B2D A6 22            [ 1]  118 	ld a,#'"
      008B2F 90 F7            [ 1]  119 	ld (y),a 
      008B31 90 5C            [ 1]  120 	incw y 
      008B33 F6               [ 1]  121 1$:	ld a,(x)
      008B34 27 30            [ 1]  122 	jreq 9$
      008B36 5C               [ 1]  123 	incw x 
      008B37 A1 20            [ 1]  124 	cp a,#SPACE 
      008B39 25 0E            [ 1]  125 	jrult 3$
      008B3B 90 F7            [ 1]  126 	ld (y),a
      008B3D 90 5C            [ 1]  127 	incw y 
      008B3F A1 5C            [ 1]  128 	cp a,#'\ 
      008B41 26 F0            [ 1]  129 	jrne 1$ 
      008B43                        130 2$:
      008B43 90 F7            [ 1]  131 	ld (y),a
      008B45 90 5C            [ 1]  132 	incw y  
      008B47 20 EA            [ 2]  133 	jra 1$
      008B49 88               [ 1]  134 3$: push a 
      008B4A A6 5C            [ 1]  135 	ld a,#'\
      008B4C 90 F7            [ 1]  136 	ld (y),a 
      008B4E 90 5C            [ 1]  137 	incw y  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      008B50 84               [ 1]  138 	pop a 
      008B51 A0 07            [ 1]  139 	sub a,#7
      008B53 C7 00 0E         [ 1]  140 	ld acc8,a 
      008B56 72 5F 00 0D      [ 1]  141 	clr acc16
      008B5A 89               [ 2]  142 	pushw x
      008B5B AE 87 C9         [ 2]  143 	ldw x,#escaped 
      008B5E 72 BB 00 0D      [ 2]  144 	addw x,acc16 
      008B62 F6               [ 1]  145 	ld a,(x)
      008B63 85               [ 2]  146 	popw x
      008B64 20 DD            [ 2]  147 	jra 2$
      008B66 A6 22            [ 1]  148 9$: ld a,#'"
      008B68 90 F7            [ 1]  149 	ld (y),a 
      008B6A 90 5C            [ 1]  150 	incw y  
      008B6C 5C               [ 1]  151 	incw x 
      008B6D 81               [ 4]  152 	ret
                                    153 
                                    154 ;--------------------------
                                    155 ; return variable name 
                                    156 ; from its address.
                                    157 ; input:
                                    158 ;   X    variable address
                                    159 ; output:
                                    160 ;   A     variable letter
                                    161 ;--------------------------
      008B6E                        162 var_name::
      008B6E 1D 00 2D         [ 2]  163 		subw x,#vars 
      008B71 9F               [ 1]  164 		ld a,xl 
      008B72 44               [ 1]  165 		srl a 
      008B73 AB 41            [ 1]  166 		add a,#'A 
      008B75 81               [ 4]  167 		ret 
                                    168 
                                    169 ;-----------------------------
                                    170 ; return cmd  idx from its 
                                    171 ; code address 
                                    172 ; input:
                                    173 ;   X      code address 
                                    174 ; output:
                                    175 ;   X      cmd_idx
                                    176 ;-----------------------------
      008B76                        177 get_cmd_idx:
      008B76 90 89            [ 2]  178 	pushw y
      008B78 90 AE A9 A0      [ 2]  179 	ldw y,#code_addr 
      008B7C 90 CF 00 18      [ 2]  180 	ldw ptr16,y 
      008B80 90 5F            [ 1]  181 	clrw y 
      008B82 91 D3 18         [ 5]  182 1$:	cpw x,([ptr16],y)
      008B85 27 0C            [ 1]  183 	jreq 3$ 
      008B87 90 5C            [ 1]  184 	incw y 
      008B89 91 D6 18         [ 4]  185 	ld a,([ptr16],y)
      008B8C 90 5C            [ 1]  186 	incw y
      008B8E 91 DA 18         [ 4]  187 	or a,([ptr16],y)	
      008B91 26 EF            [ 1]  188 	jrne 1$
      008B93 93               [ 1]  189 3$: ldw x,y 
      008B94 90 85            [ 2]  190 	popw y 
      008B96 81               [ 4]  191 	ret
                                    192 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
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
      008B97                        207 decompile::
      000B17                        208 	_vars VSIZE
      008B97 52 04            [ 2]    1     sub sp,#VSIZE 
      008B99 C6 00 0B         [ 1]  209 	ld a,base
      008B9C 6B 01            [ 1]  210 	ld (BASE_SAV,sp),a  
      008B9E C6 00 22         [ 1]  211 	ld a,tab_width 
      008BA1 6B 02            [ 1]  212 	ld (WIDTH_SAV,sp),a 
      008BA3 17 03            [ 2]  213 	ldw (STR,sp),y   
      008BA5 72 CE 00 05      [ 5]  214 	ldw x,[basicptr] ; line number 
      008BA9 35 0A 00 0B      [ 1]  215 	mov base,#10
      008BAD 35 05 00 22      [ 1]  216 	mov tab_width,#5
      008BB1 72 5F 00 0C      [ 1]  217 	clr acc24 
      008BB5 CF 00 0D         [ 2]  218 	ldw acc16,x
      008BB8 CD 92 E5         [ 4]  219 	call itoa  
      008BBB CD 8B 1B         [ 4]  220 	call right_align 
      008BBE 88               [ 1]  221 	push a 
      008BBF 90 93            [ 1]  222 1$:	ldw y,x ; source
      008BC1 1E 04            [ 2]  223 	ldw x,(STR+1,sp) ; destination
      008BC3 CD 8E 00         [ 4]  224 	call strcpy 
      008BC6 90 5F            [ 1]  225 	clrw y 
      008BC8 84               [ 1]  226 	pop a 
      008BC9 90 97            [ 1]  227 	ld yl,a 
      008BCB 72 F9 03         [ 2]  228 	addw y,(STR,sp)
      008BCE A6 20            [ 1]  229 	ld a,#SPACE 
      008BD0 90 F7            [ 1]  230 	ld (y),a 
      008BD2 90 5C            [ 1]  231 	incw y 
      008BD4 72 5F 00 22      [ 1]  232 	clr tab_width
      008BD8 AE 00 03         [ 2]  233 	ldw x,#3
      008BDB CF 00 01         [ 2]  234 	ldw in.w,x 
      008BDE                        235 decomp_loop:
      008BDE 90 89            [ 2]  236 	pushw y
      008BE0 CD 92 7B         [ 4]  237 	call next_token 
      008BE3 90 85            [ 2]  238 	popw y 
      008BE5 4D               [ 1]  239 	tnz a  
      008BE6 26 03            [ 1]  240 	jrne 1$
      008BE8 CC 8C CA         [ 2]  241 	jp 20$
      008BEB 2A 75            [ 1]  242 1$:	jrpl 6$
                                    243 ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR
      008BED A1 85            [ 1]  244 	cp a,#TK_VAR 
      008BEF 26 0C            [ 1]  245 	jrne 3$
                                    246 ;; TK_VAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      008BF1 CD 8B 09         [ 4]  247 	call add_space  
      008BF4 CD 8B 6E         [ 4]  248 	call var_name
      008BF7 90 F7            [ 1]  249 	ld (y),a 
      008BF9 90 5C            [ 1]  250 	incw y  
      008BFB 20 E1            [ 2]  251 	jra decomp_loop
      008BFD                        252 3$:
      008BFD A1 84            [ 1]  253 	cp a,#TK_INTGR
      008BFF 26 22            [ 1]  254 	jrne 4$
                                    255 ;; TK_INTGR
      008C01 CD 8B 09         [ 4]  256 	call add_space
      008C04 72 5F 00 0C      [ 1]  257 	clr acc24 
      008C08 CF 00 0D         [ 2]  258 	ldw acc16,x 
      008C0B 90 89            [ 2]  259 	pushw y 
      008C0D CD 92 E5         [ 4]  260 	call itoa  
      008C10 16 01            [ 2]  261 	ldw y,(1,sp) 
      008C12 88               [ 1]  262 	push a 
      008C13 51               [ 1]  263 	exgw x,y 
      008C14 CD 8E 00         [ 4]  264 	call strcpy 
      008C17 90 5F            [ 1]  265 	clrw y
      008C19 84               [ 1]  266 	pop a  
      008C1A 90 97            [ 1]  267 	ld yl,a 
      008C1C 72 F9 01         [ 2]  268 	addw y,(1,sp)
      000B9F                        269 	_drop 2 
      008C1F 5B 02            [ 2]    1     addw sp,#2 
      008C21 20 BB            [ 2]  270 	jra decomp_loop
                                    271 ;; dictionary keyword 
      008C23                        272 4$:	
      008C23 CD 8B 76         [ 4]  273 	call get_cmd_idx 
      008C26 A3 00 8C         [ 2]  274 	cpw x,#REM_IDX
      008C29 26 22            [ 1]  275 	jrne 5$
      008C2B CE 00 05         [ 2]  276 	ldw x,basicptr 
                                    277 ; copy comment to buffer 
      008C2E CD 8B 09         [ 4]  278 	call add_space
      008C31 A6 27            [ 1]  279 	ld a,#''
      008C33 90 F7            [ 1]  280 	ld (y),a 
      008C35 90 5C            [ 1]  281 	incw y 
      008C37                        282 41$:
      008C37 72 D6 00 01      [ 4]  283 	ld a,([in.w],x)
      008C3B 72 5C 00 02      [ 1]  284 	inc in  
      008C3F 90 F7            [ 1]  285 	ld (y),a 
      008C41 90 5C            [ 1]  286 	incw y 
      008C43 C6 00 02         [ 1]  287 	ld a,in 
      008C46 C1 00 04         [ 1]  288 	cp a,count 
      008C49 2B EC            [ 1]  289 	jrmi 41$
      008C4B 20 7D            [ 2]  290 	jra 20$  
      008C4D A3 00 50         [ 2]  291 5$: cpw x,#LET_IDX 
      008C50 27 8C            [ 1]  292 	jreq decomp_loop ; down display LET 	
                                    293 ; insert command name 
      008C52 CD 8B 09         [ 4]  294 	call add_space  
      008C55 90 89            [ 2]  295 	pushw y
      008C57 CD 8D 05         [ 4]  296 	call cmd_name
      008C5A 90 85            [ 2]  297 	popw y 
      008C5C CD 8A F4         [ 4]  298 	call cpy_cmd_name
      008C5F CC 8B DE         [ 2]  299 	jp decomp_loop 
      008C62                        300 6$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      008C62 A1 02            [ 1]  301 	cp a,#TK_QSTR 
      008C64 26 06            [ 1]  302 	jrne 7$
                                    303 ;; TK_QSTR
      008C66 CD 8B 2D         [ 4]  304 	call cpy_quote  
      008C69 CC 8B DE         [ 2]  305 	jp decomp_loop
      008C6C                        306 7$:
      008C6C A1 03            [ 1]  307 	cp a,#TK_CHAR 
      008C6E 26 0E            [ 1]  308 	jrne 8$
                                    309 ;; TK_CHAR 
      008C70 A6 5C            [ 1]  310 	ld a,#'\ 
      008C72 90 F7            [ 1]  311 	ld (y),a 
      008C74 90 5C            [ 1]  312 	incw y 
      008C76 9F               [ 1]  313 	ld a,xl 
      008C77 90 F7            [ 1]  314 	ld (y),a 
      008C79 90 5C            [ 1]  315 	incw y 
      008C7B CC 8B DE         [ 2]  316 	jp decomp_loop
      008C7E A1 0B            [ 1]  317 8$: cp a,#TK_COLON 
      008C80 26 09            [ 1]  318 	jrne 9$
      008C82 A6 3A            [ 1]  319 	ld a,#':
      008C84                        320 81$:
      008C84 90 F7            [ 1]  321 	ld (y),a 
      008C86 90 5C            [ 1]  322 	incw y 
      008C88                        323 82$:
      008C88 CC 8B DE         [ 2]  324 	jp decomp_loop
      008C8B                        325 9$: 
      008C8B A1 0A            [ 1]  326 	cp a,#TK_SHARP
      008C8D 22 0A            [ 1]  327 	jrugt 10$ 
      008C8F A0 06            [ 1]  328 	sub a,#TK_ARRAY 
      008C91 5F               [ 1]  329 	clrw x 
      008C92 97               [ 1]  330 	ld xl,a
      008C93 1C 8C E0         [ 2]  331 	addw x,#single_char 
      008C96 F6               [ 1]  332 	ld a,(x)
      008C97 20 EB            [ 2]  333 	jra 81$ 
      008C99                        334 10$: 
      008C99 A1 11            [ 1]  335 	cp a,#TK_MINUS 
      008C9B 22 0A            [ 1]  336 	jrugt 11$
      008C9D A0 10            [ 1]  337 	sub a,#TK_PLUS 
      008C9F 5F               [ 1]  338 	clrw x 
      008CA0 97               [ 1]  339 	ld xl,a 
      008CA1 1C 8C E5         [ 2]  340 	addw x,#add_char 
      008CA4 F6               [ 1]  341 	ld a,(x)
      008CA5 20 DD            [ 2]  342 	jra 81$
      008CA7                        343 11$:
      008CA7 A1 22            [ 1]  344     cp a,#TK_MOD 
      008CA9 22 0A            [ 1]  345 	jrugt 12$
      008CAB A0 20            [ 1]  346 	sub a,#TK_MULT
      008CAD 5F               [ 1]  347 	clrw x 
      008CAE 97               [ 1]  348 	ld xl,a 
      008CAF 1C 8C E7         [ 2]  349 	addw x,#mul_char
      008CB2 F6               [ 1]  350 	ld a,(x)
      008CB3 20 CF            [ 2]  351 	jra 81$
      008CB5                        352 12$:
      008CB5 A0 31            [ 1]  353 	sub a,#TK_GT  
      008CB7 48               [ 1]  354 	sll a 
      008CB8 5F               [ 1]  355 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      008CB9 97               [ 1]  356 	ld xl,a 
      008CBA 1C 8C EA         [ 2]  357 	addw x,#relop_str 
      008CBD FE               [ 2]  358 	ldw x,(x)
      008CBE F6               [ 1]  359 	ld a,(x)
      008CBF 5C               [ 1]  360 	incw x 
      008CC0 90 F7            [ 1]  361 	ld (y),a
      008CC2 90 5C            [ 1]  362 	incw y 
      008CC4 F6               [ 1]  363 	ld a,(x)
      008CC5 26 BD            [ 1]  364 	jrne 81$
      008CC7 CC 8B DE         [ 2]  365 	jp decomp_loop 
      008CCA                        366 20$: 
      008CCA 90 7F            [ 1]  367 	clr (y)
      008CCC 1E 03            [ 2]  368 	ldw x,(STR,sp)
      008CCE 7B 01            [ 1]  369 	ld a,(BASE_SAV,sp)
      008CD0 C7 00 0B         [ 1]  370 	ld base,a 
      008CD3 7B 02            [ 1]  371 	ld a,(WIDTH_SAV,sp)
      008CD5 C7 00 22         [ 1]  372 	ld tab_width,a
      008CD8 72 F2 03         [ 2]  373 	subw y,(STR,sp) 
      008CDB 90 9F            [ 1]  374 	ld a,yl 
      000C5D                        375 	_drop VSIZE 
      008CDD 5B 04            [ 2]    1     addw sp,#VSIZE 
      008CDF 81               [ 4]  376 	ret 
                                    377 
      008CE0 40 28 29 2C 23         378 single_char: .byte '@','(',')',',','#'
      008CE5 2B 2D                  379 add_char: .byte '+','-'
      008CE7 2A 2F 25               380 mul_char: .byte '*','/','%'
      008CEA 8C F6 8C F8 8C FA 8C   381 relop_str: .word gt,equal,ge,lt,le,ne 
             FD 8C FF 8D 02
      008CF6 3E 00                  382 gt: .asciz ">"
      008CF8 3D 00                  383 equal: .asciz "="
      008CFA 3E 3D 00               384 ge: .asciz ">="
      008CFD 3C 00                  385 lt: .asciz "<"
      008CFF 3C 3D 00               386 le: .asciz "<="
      008D02 3C 3E 00               387 ne:  .asciz "<>"
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
      008D05                        400 cmd_name:
      000C85                        401 	_vars VSIZE 
      008D05 52 04            [ 2]    1     sub sp,#VSIZE 
      008D07 72 5F 00 0D      [ 1]  402 	clr acc16 
      008D0B 1F 01            [ 2]  403 	ldw (CMDX,sp),x  
      008D0D AE A9 98         [ 2]  404 	ldw x,#kword_dict	
      008D10 1F 03            [ 2]  405 1$:	ldw (LINK,sp),x
      008D12 E6 02            [ 1]  406 	ld a,(2,x)
      008D14 A4 0F            [ 1]  407 	and a,#15 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      008D16 C7 00 0E         [ 1]  408 	ld acc8,a 
      008D19 1C 00 03         [ 2]  409 	addw x,#3
      008D1C 72 BB 00 0D      [ 2]  410 	addw x,acc16
      008D20 FE               [ 2]  411 	ldw x,(x) ; command index  
      008D21 13 01            [ 2]  412 	cpw x,(CMDX,sp)
      008D23 27 0A            [ 1]  413 	jreq 2$
      008D25 1E 03            [ 2]  414 	ldw x,(LINK,sp)
      008D27 FE               [ 2]  415 	ldw x,(x) 
      008D28 1D 00 02         [ 2]  416 	subw x,#2  
      008D2B 26 E3            [ 1]  417 	jrne 1$
      008D2D 20 05            [ 2]  418 	jra 9$
      008D2F 1E 03            [ 2]  419 2$: ldw x,(LINK,sp)
      008D31 1C 00 02         [ 2]  420 	addw x,#2 	
      000CB4                        421 9$:	_drop VSIZE
      008D34 5B 04            [ 2]    1     addw sp,#VSIZE 
      008D36 81               [ 4]  422 	ret
                                    423 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                     29     .include "config.inc"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;;  configuration paramters 
                                      3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      4 
                           000000     5 SEPARATE=0 ; set to 1 for 'make separate' 
                                      6 
                                      7 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
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
                                     71 
      00002D                         72 vars:: .blkw 26 ; BASIC variables A-Z, keep it as but last .
                                     73 	.area BTXT (ABS)
      00007C                         74 	.org 0x7C  
                                     75 ; keep 'free_ram' as last variable 
                                     76 ; basic code compiled here. 
      00007C                         77 rsign: .blkw 1 ; "BC" 
      00007E                         78 rsize: .blkw 1 ; code size 	 
      000080                         79 free_ram: ; from here RAM free for BASIC text 
                                     80 
                                     81 	.area CODE 
                                     82 
                                     83 ;----------------------
                                     84 ; print token id && value
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                     85 ; input:
                                     86 ;   A     token id 
                                     87 ;   X     token value 
                                     88 ;---------------------
                           000001    89 	BSAVE=1
                           000002    90 	AREG=2
                           000003    91 	XREG=3
                           000004    92 	VSIZE=4
      008D37                         93 prt_tok:
      000CB7                         94 	_vars VSIZE 
      008D37 52 04            [ 2]    1     sub sp,#VSIZE 
      008D39 6B 02            [ 1]   95 	ld (AREG,sp),a 
      008D3B 1F 03            [ 2]   96 	ldw (XREG,sp),x 
      008D3D C6 00 0B         [ 1]   97 	ld a, base
      008D40 6B 01            [ 1]   98 	ld (BSAVE,sp),a 
      008D42 35 10 00 0B      [ 1]   99 	mov base,#16  
      008D46 AE 8D 6E         [ 2]  100 	ldw x,#token_msg
      008D49 CD 83 9E         [ 4]  101 	call puts 
      008D4C 5F               [ 1]  102 	clrw x 
      008D4D 7B 02            [ 1]  103 	ld a,(AREG,sp)
      008D4F 97               [ 1]  104 	ld xl,a 
      008D50 CD 92 C9         [ 4]  105 	call print_int 
      008D53 A6 20            [ 1]  106 	ld a,#SPACE
      008D55 CD 83 41         [ 4]  107 	call putc 
      008D58 1E 03            [ 2]  108 	ldw x,(XREG,sp)
      008D5A CD 92 C9         [ 4]  109 	call print_int 
      008D5D A6 0D            [ 1]  110 	ld a,#CR 
      008D5F CD 83 41         [ 4]  111 	call putc 
      008D62 7B 01            [ 1]  112 	ld a,(BSAVE,sp)
      008D64 C7 00 0B         [ 1]  113 	ld base,a 
      008D67 7B 02            [ 1]  114 	ld a,(AREG,sp)
      008D69 1E 03            [ 2]  115 	ldw x,(XREG,sp)
      000CEB                        116 	_drop VSIZE 
      008D6B 5B 04            [ 2]    1     addw sp,#VSIZE 
      008D6D 81               [ 4]  117 	ret 
      008D6E 74 6F 6B 65 6E 3A 20   118 token_msg: .asciz "token: "
             00
                                    119 
                                    120 
                                    121 ;---------------------
                                    122 ; display n bytes row 
                                    123 ; from memory.
                                    124 ; input:
                                    125 ;   A   bytes to print 
                                    126 ;	X   start address 
                                    127 ; output:
                                    128 ;   X   address after last shown  
                                    129 ;---------------------
                           000001   130 	CNT=1 
                           000002   131 	ADR=2 
                           000003   132 	VSIZE=3 
      008D76                        133 show_row:
      008D76 4D               [ 1]  134 	tnz a 
      008D77 26 01            [ 1]  135 	jrne 1$
      008D79 81               [ 4]  136 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      008D7A                        137 1$:	
      008D7A 89               [ 2]  138 	pushw x  
      008D7B 88               [ 1]  139 	push a 
      008D7C 35 04 00 22      [ 1]  140 	mov tab_width,#4 
      008D80 CD 92 C9         [ 4]  141 	call print_int 
      008D83 A6 20            [ 1]  142 	ld a,#SPACE  
      008D85 CD 83 41         [ 4]  143 	call putc
      008D88                        144 row_loop:
      008D88 1E 02            [ 2]  145 	ldw x,(ADR,sp)
      008D8A F6               [ 1]  146 	ld a,(x)
      008D8B 5F               [ 1]  147 	clrw x 
      008D8C 97               [ 1]  148 	ld xl,a 
      008D8D CD 92 C9         [ 4]  149 	call print_int 
      008D90 1E 02            [ 2]  150 	ldw x,(ADR,sp)
      008D92 5C               [ 1]  151 	incw x 
      008D93 1F 02            [ 2]  152 	ldw (ADR,sp),x 
      008D95 0A 01            [ 1]  153 	dec (CNT,sp)
      008D97 26 EF            [ 1]  154 	jrne row_loop
      000D19                        155 	_drop VSIZE  		
      008D99 5B 03            [ 2]    1     addw sp,#VSIZE 
      008D9B 35 04 00 22      [ 1]  156 	mov tab_width,#4
      008D9F A6 0D            [ 1]  157 	ld a,#CR 
      008DA1 CD 83 41         [ 4]  158 	call putc 
      008DA4 81               [ 4]  159 	ret 
                                    160 
                                    161 ;--------------------------
                                    162 ; print memory content 
                                    163 ; in hexadecimal format
                                    164 ;  input:
                                    165 ;    X    start address 
                                    166 ;    Y    count 
                                    167 ;--------------------------
                           000001   168 	BCNT=1
                           000003   169 	BASE=3
                           000004   170 	TABW=4
                           000004   171 	VSIZE=4   
      008DA5                        172 hex_dump:
      008DA5 88               [ 1]  173 	push a 
      000D26                        174 	_vars VSIZE
      008DA6 52 04            [ 2]    1     sub sp,#VSIZE 
      008DA8 C6 00 0B         [ 1]  175 	ld a,base
      008DAB 6B 03            [ 1]  176 	ld (BASE,sp),a 
      008DAD 35 10 00 0B      [ 1]  177 	mov base,#16
      008DB1 C6 00 22         [ 1]  178 	ld a,tab_width 
      008DB4 6B 04            [ 1]  179 	ld (TABW,sp),a
      008DB6 A6 0D            [ 1]  180 	ld a,#CR 
      008DB8 CD 83 41         [ 4]  181 	call putc 
      008DBB 17 01            [ 2]  182 1$: ldw (BCNT,sp),y
      008DBD A6 10            [ 1]  183 	ld a,#16
      008DBF 90 A3 00 10      [ 2]  184 	cpw y,#16
      008DC3 2A 02            [ 1]  185 	jrpl 2$
      008DC5 90 9F            [ 1]  186 	ld a,yl
      008DC7                        187 2$: 	
      008DC7 CD 8D 76         [ 4]  188 	call show_row 
      008DCA 16 01            [ 2]  189 	ldw y,(BCNT,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      008DCC 72 A2 00 10      [ 2]  190 	subw y,#16 
      008DD0 90 A3 00 01      [ 2]  191 	cpw y,#1
      008DD4 2A E5            [ 1]  192 	jrpl 1$
      008DD6 7B 03            [ 1]  193 	ld a,(BASE,sp)
      008DD8 C7 00 0B         [ 1]  194 	ld base,a
      008DDB 7B 04            [ 1]  195 	ld a,(TABW,sp)
      008DDD C7 00 22         [ 1]  196 	ld tab_width,a 
      000D60                        197 	_drop VSIZE
      008DE0 5B 04            [ 2]    1     addw sp,#VSIZE 
      008DE2 84               [ 1]  198 	pop a 
      008DE3 81               [ 4]  199 	ret 
                                    200 
                                    201 ;-------------------------------------
                                    202 ; retrun string length
                                    203 ; input:
                                    204 ;   X         .asciz  pointer 
                                    205 ; output:
                                    206 ;   X         not affected 
                                    207 ;   A         length 
                                    208 ;-------------------------------------
      008DE4                        209 strlen::
      008DE4 89               [ 2]  210 	pushw x 
      008DE5 4F               [ 1]  211 	clr a
      008DE6 7D               [ 1]  212 1$:	tnz (x) 
      008DE7 27 04            [ 1]  213 	jreq 9$ 
      008DE9 4C               [ 1]  214 	inc a 
      008DEA 5C               [ 1]  215 	incw x 
      008DEB 20 F9            [ 2]  216 	jra 1$ 
      008DED 85               [ 2]  217 9$:	popw x 
      008DEE 81               [ 4]  218 	ret 
                                    219 
                                    220 ;------------------------------------
                                    221 ; compare 2 strings
                                    222 ; input:
                                    223 ;   X 		char* first string 
                                    224 ;   Y       char* second string 
                                    225 ; output:
                                    226 ;   A 		0|1 
                                    227 ;-------------------------------------
      008DEF                        228 strcmp:
      008DEF F6               [ 1]  229 	ld a,(x)
      008DF0 27 0B            [ 1]  230 	jreq 5$ 
      008DF2 90 F1            [ 1]  231 	cp a,(y) 
      008DF4 26 05            [ 1]  232 	jrne 4$ 
      008DF6 5C               [ 1]  233 	incw x 
      008DF7 90 5C            [ 1]  234 	incw y 
      008DF9 20 F4            [ 2]  235 	jra strcmp 
      008DFB                        236 4$: ; not same  
      008DFB 4F               [ 1]  237 	clr a 
      008DFC 81               [ 4]  238 	ret 
      008DFD                        239 5$: ; same 
      008DFD A6 01            [ 1]  240 	ld a,#1 
      008DFF 81               [ 4]  241 	ret 
                                    242 
                                    243 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                    244 ;---------------------------------------
                                    245 ;  copy src to dest 
                                    246 ; input:
                                    247 ;   X 		dest 
                                    248 ;   Y 		src 
                                    249 ; output: 
                                    250 ;   X 		dest 
                                    251 ;----------------------------------
      008E00                        252 strcpy::
      008E00 88               [ 1]  253 	push a 
      008E01 89               [ 2]  254 	pushw x 
      008E02 90 F6            [ 1]  255 1$: ld a,(y)
      008E04 27 06            [ 1]  256 	jreq 9$ 
      008E06 F7               [ 1]  257 	ld (x),a 
      008E07 5C               [ 1]  258 	incw x 
      008E08 90 5C            [ 1]  259 	incw y 
      008E0A 20 F6            [ 2]  260 	jra 1$ 
      008E0C 7F               [ 1]  261 9$:	clr (x)
      008E0D 85               [ 2]  262 	popw x 
      008E0E 84               [ 1]  263 	pop a 
      008E0F 81               [ 4]  264 	ret 
                                    265 
                                    266 ;---------------------------------------
                                    267 ; move memory block 
                                    268 ; input:
                                    269 ;   X 		destination 
                                    270 ;   Y 	    source 
                                    271 ;   acc16	bytes count 
                                    272 ; output:
                                    273 ;   none 
                                    274 ;--------------------------------------
                           000001   275 	INCR=1 ; increament high byte 
                           000002   276 	LB=2 ; increament low byte 
                           000002   277 	VSIZE=2
      008E10                        278 move::
      008E10 88               [ 1]  279 	push a 
      000D91                        280 	_vars VSIZE 
      008E11 52 02            [ 2]    1     sub sp,#VSIZE 
      008E13 0F 01            [ 1]  281 	clr (INCR,sp)
      008E15 0F 02            [ 1]  282 	clr (LB,sp)
      008E17 90 89            [ 2]  283 	pushw y 
      008E19 13 01            [ 2]  284 	cpw x,(1,sp) ; compare DEST to SRC 
      008E1B 90 85            [ 2]  285 	popw y 
      008E1D 27 31            [ 1]  286 	jreq move_exit ; x==y 
      008E1F 2B 0E            [ 1]  287 	jrmi move_down
      008E21                        288 move_up: ; start from top address with incr=-1
      008E21 72 BB 00 0D      [ 2]  289 	addw x,acc16
      008E25 72 B9 00 0D      [ 2]  290 	addw y,acc16
      008E29 03 01            [ 1]  291 	cpl (INCR,sp)
      008E2B 03 02            [ 1]  292 	cpl (LB,sp)   ; increment = -1 
      008E2D 20 05            [ 2]  293 	jra move_loop  
      008E2F                        294 move_down: ; start from bottom address with incr=1 
      008E2F 5A               [ 2]  295     decw x 
      008E30 90 5A            [ 2]  296 	decw y
      008E32 0C 02            [ 1]  297 	inc (LB,sp) ; incr=1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      008E34                        298 move_loop:	
      008E34 C6 00 0D         [ 1]  299     ld a, acc16 
      008E37 CA 00 0E         [ 1]  300 	or a, acc8
      008E3A 27 14            [ 1]  301 	jreq move_exit 
      008E3C 72 FB 01         [ 2]  302 	addw x,(INCR,sp)
      008E3F 72 F9 01         [ 2]  303 	addw y,(INCR,sp) 
      008E42 90 F6            [ 1]  304 	ld a,(y)
      008E44 F7               [ 1]  305 	ld (x),a 
      008E45 89               [ 2]  306 	pushw x 
      008E46 CE 00 0D         [ 2]  307 	ldw x,acc16 
      008E49 5A               [ 2]  308 	decw x 
      008E4A CF 00 0D         [ 2]  309 	ldw acc16,x 
      008E4D 85               [ 2]  310 	popw x 
      008E4E 20 E4            [ 2]  311 	jra move_loop
      008E50                        312 move_exit:
      000DD0                        313 	_drop VSIZE
      008E50 5B 02            [ 2]    1     addw sp,#VSIZE 
      008E52 84               [ 1]  314 	pop a 
      008E53 81               [ 4]  315 	ret 	
                                    316 
                                    317 ;------------------------------------
                                    318 ;  set all variables to zero 
                                    319 ; input:
                                    320 ;   none 
                                    321 ; output:
                                    322 ;	none
                                    323 ;------------------------------------
      008E54                        324 clear_vars:
      008E54 89               [ 2]  325 	pushw x 
      008E55 90 89            [ 2]  326 	pushw y 
      008E57 AE 00 2D         [ 2]  327 	ldw x,#vars 
      008E5A 90 AE 00 34      [ 2]  328 	ldw y,#2*26 
      008E5E 7F               [ 1]  329 1$:	clr (x)
      008E5F 5C               [ 1]  330 	incw x 
      008E60 90 5A            [ 2]  331 	decw y 
      008E62 26 FA            [ 1]  332 	jrne 1$
      008E64 90 85            [ 2]  333 	popw y 
      008E66 85               [ 2]  334 	popw x 
      008E67 81               [ 4]  335 	ret 
                                    336 
                                    337 ;-------------------------------------
                                    338 ; check if A is a letter 
                                    339 ; input:
                                    340 ;   A 			character to test 
                                    341 ; output:
                                    342 ;   C flag      1 true, 0 false 
                                    343 ;-------------------------------------
      008E68                        344 is_alpha::
      008E68 A1 41            [ 1]  345 	cp a,#'A 
      008E6A 8C               [ 1]  346 	ccf 
      008E6B 24 0B            [ 1]  347 	jrnc 9$ 
      008E6D A1 5B            [ 1]  348 	cp a,#'Z+1 
      008E6F 25 07            [ 1]  349 	jrc 9$ 
      008E71 A1 61            [ 1]  350 	cp a,#'a 
      008E73 8C               [ 1]  351 	ccf 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      008E74 24 02            [ 1]  352 	jrnc 9$
      008E76 A1 7B            [ 1]  353 	cp a,#'z+1
      008E78 81               [ 4]  354 9$: ret 	
                                    355 
                                    356 ;------------------------------------
                                    357 ; check if character in {'0'..'9'}
                                    358 ; input:
                                    359 ;    A  character to test
                                    360 ; output:
                                    361 ;    Carry  0 not digit | 1 digit
                                    362 ;------------------------------------
      008E79                        363 is_digit::
      008E79 A1 30            [ 1]  364 	cp a,#'0
      008E7B 25 03            [ 1]  365 	jrc 1$
      008E7D A1 3A            [ 1]  366     cp a,#'9+1
      008E7F 8C               [ 1]  367 	ccf 
      008E80 8C               [ 1]  368 1$:	ccf 
      008E81 81               [ 4]  369     ret
                                    370 
                                    371 ;-------------------------------------
                                    372 ; return true if character in  A 
                                    373 ; is letter or digit.
                                    374 ; input:
                                    375 ;   A     ASCII character 
                                    376 ; output:
                                    377 ;   A     no change 
                                    378 ;   Carry    0 false| 1 true 
                                    379 ;--------------------------------------
      008E82                        380 is_alnum::
      008E82 CD 8E 79         [ 4]  381 	call is_digit
      008E85 25 03            [ 1]  382 	jrc 1$ 
      008E87 CD 8E 68         [ 4]  383 	call is_alpha
      008E8A 81               [ 4]  384 1$:	ret 
                                    385 
                                    386 
                                    387 ;-------------------------------------
                                    388 ;  program initialization entry point 
                                    389 ;-------------------------------------
                           000002   390 	MAJOR=2
                           000000   391 	MINOR=0 
      008E8B 0A 0A 54 69 6E 79 20   392 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 32 0A 76 65
             72 73 69 6F 6E 20 00
      008ED1                        393 cold_start:
                                    394 ;set stack 
      008ED1 AE 17 FF         [ 2]  395 	ldw x,#STACK_EMPTY
      008ED4 94               [ 1]  396 	ldw sp,x   
                                    397 ; clear all ram 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      008ED5 7F               [ 1]  398 0$: clr (x)
      008ED6 5A               [ 2]  399 	decw x 
      008ED7 26 FC            [ 1]  400 	jrne 0$
                                    401 ; activate pull up on all inputs 
      008ED9 A6 FF            [ 1]  402 	ld a,#255 
      008EDB C7 50 03         [ 1]  403 	ld PA_CR1,a 
      008EDE C7 50 08         [ 1]  404 	ld PB_CR1,a 
      008EE1 C7 50 0D         [ 1]  405 	ld PC_CR1,a 
      008EE4 C7 50 12         [ 1]  406 	ld PD_CR1,a 
      008EE7 C7 50 17         [ 1]  407 	ld PE_CR1,a 
      008EEA C7 50 1C         [ 1]  408 	ld PF_CR1,a 
      008EED C7 50 21         [ 1]  409 	ld PG_CR1,a 
      008EF0 C7 50 2B         [ 1]  410 	ld PI_CR1,a
                                    411 ; set LD2 pin as output 
      008EF3 72 1A 50 0D      [ 1]  412     bset PC_CR1,#LED2_BIT
      008EF7 72 1A 50 0E      [ 1]  413     bset PC_CR2,#LED2_BIT
      008EFB 72 1A 50 0C      [ 1]  414     bset PC_DDR,#LED2_BIT
      008EFF 72 1B 50 0A      [ 1]  415 	bres PC_ODR,#LED2_BIT 
                                    416 ; disable schmitt triggers on Arduino CN4 analog inputs
      008F03 55 00 3F 54 07   [ 1]  417 	mov ADC_TDRL,0x3f
                                    418 ; disable peripherals clocks
                                    419 ;	clr CLK_PCKENR1 
                                    420 ;	clr CLK_PCKENR2
      008F08 72 5F 50 F2      [ 1]  421 	clr AWU_TBR 
      008F0C 72 14 50 CA      [ 1]  422 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                    423 ; select internal clock no divisor: 16 Mhz 	
      008F10 A6 E1            [ 1]  424 	ld a,#CLK_SWR_HSI 
      008F12 5F               [ 1]  425 	clrw x  
      008F13 CD 80 F6         [ 4]  426     call clock_init 
      008F16 CD 81 19         [ 4]  427 	call timer4_init
      008F19 CD 81 0C         [ 4]  428 	call timer2_init
                                    429 ; UART1 at 115200 BAUD
      008F1C CD 82 FC         [ 4]  430 	call uart1_init
                                    431 ; activate PE_4 (user button interrupt)
      008F1F 72 18 50 18      [ 1]  432     bset PE_CR2,#USR_BTN_BIT 
                                    433 ; display system information
      008F23 AE 8E 8B         [ 2]  434 	ldw x,#software 
      008F26 CD 83 9E         [ 4]  435 	call puts 
      008F29 A6 02            [ 1]  436 	ld a,#MAJOR 
      008F2B C7 00 0E         [ 1]  437 	ld acc8,a 
      008F2E 5F               [ 1]  438 	clrw x 
      008F2F CF 00 0C         [ 2]  439 	ldw acc24,x
      008F32 72 5F 00 22      [ 1]  440 	clr tab_width  
      008F36 35 0A 00 0B      [ 1]  441 	mov base, #10 
      008F3A CD 92 D9         [ 4]  442 	call prti24 
      008F3D A6 2E            [ 1]  443 	ld a,#'.
      008F3F CD 83 41         [ 4]  444 	call putc 
      008F42 A6 00            [ 1]  445 	ld a,#MINOR 
      008F44 C7 00 0E         [ 1]  446 	ld acc8,a 
      008F47 5F               [ 1]  447 	clrw x 
      008F48 CF 00 0C         [ 2]  448 	ldw acc24,x 
      008F4B CD 92 D9         [ 4]  449 	call prti24
      008F4E A6 0D            [ 1]  450 	ld a,#CR 
      008F50 CD 83 41         [ 4]  451 	call putc
      008F53 9A               [ 1]  452 	rim 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      008F54 72 5C 00 16      [ 1]  453 	inc seedy+1 
      008F58 72 5C 00 14      [ 1]  454 	inc seedx+1 
      008F5C CD 8F F4         [ 4]  455 	call clear_basic
      008F5F CD 98 80         [ 4]  456 	call ubound 
      008F62 CD 9D 0C         [ 4]  457 	call beep_1khz  
      008F65                        458 2$:	
      008F65 CD 8F D6         [ 4]  459 	call warm_init
                                    460 ; check for application in flash memory 
      008F68 CE AA 80         [ 2]  461 	ldw x,app_sign 
      008F6B C3 9F 8E         [ 2]  462 	cpw x,SIGNATURE 
      008F6E 27 03            [ 1]  463 	jreq run_app
      008F70 CC 92 13         [ 2]  464 	jp cmd_line
      008F73                        465 run_app:
                                    466 ; run application in FLASH|EEPROM 
      008F73 CE AA 82         [ 2]  467 	ldw x,app_size  
      008F76 89               [ 2]  468 	pushw x 
      008F77 AE AA 84         [ 2]  469 	ldw x,#app 
      008F7A CF 00 1A         [ 2]  470 	ldw txtbgn,x
      008F7D CF 00 05         [ 2]  471 	ldw basicptr,x 
      008F80 72 FB 01         [ 2]  472 	addw x,(1,sp) ; x+size 
      000F03                        473 	_drop 2 
      008F83 5B 02            [ 2]    1     addw sp,#2 
      008F85 CF 00 1C         [ 2]  474 	ldw txtend,x 
      008F88 AE 8F B4         [ 2]  475 	ldw x,#RUNNING 
      008F8B CD 83 9E         [ 4]  476 	call puts
      008F8E CE 00 05         [ 2]  477 	ldw x,basicptr    
      008F91 35 10 00 0B      [ 1]  478 	mov base,#16 
      008F95 CD 92 C9         [ 4]  479 	call print_int
      008F98 35 0A 00 0B      [ 1]  480 	mov base,#10  
      008F9C CE 00 05         [ 2]  481 	ldw x, basicptr 
      008F9F E6 02            [ 1]  482 	ld a,(2,x)
      008FA1 C7 00 04         [ 1]  483 	ld count,a 
      008FA4 35 03 00 02      [ 1]  484 	mov in,#3 
      008FA8 72 10 00 21      [ 1]  485 	bset flags,#FRUN
      008FAC CD 98 80         [ 4]  486 	call ubound   
      008FAF CC 92 2F         [ 2]  487 	jp interpreter  
      008FB2 20 FE            [ 2]  488     jra .  
                                    489 
      008FB4 0A 72 75 6E 6E 69 6E   490 RUNNING: .asciz "\nrunning application at address: " 
             67 20 61 70 70 6C 69
             63 61 74 69 6F 6E 20
             61 74 20 61 64 64 72
             65 73 73 3A 20 00
                                    491 
      008FD6                        492 warm_init:
      008FD6 72 5F 00 21      [ 1]  493 	clr flags 
      008FDA 72 5F 00 1E      [ 1]  494 	clr loop_depth 
      008FDE 35 04 00 22      [ 1]  495 	mov tab_width,#TAB_WIDTH 
      008FE2 35 0A 00 0B      [ 1]  496 	mov base,#10 
      008FE6 AE 00 00         [ 2]  497 	ldw x,#0 
      008FE9 CF 00 05         [ 2]  498 	ldw basicptr,x 
      008FEC CF 00 01         [ 2]  499 	ldw in.w,x 
      008FEF 72 5F 00 04      [ 1]  500 	clr count
      008FF3 81               [ 4]  501 	ret 
                                    502 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



                                    503 
                                    504 ;---------------------------
                                    505 ; reset BASIC text variables 
                                    506 ; and clear variables 
                                    507 ;---------------------------
      008FF4                        508 clear_basic:
      008FF4 89               [ 2]  509 	pushw x 
      008FF5 72 5F 00 04      [ 1]  510 	clr count
      008FF9 72 5F 00 02      [ 1]  511 	clr in  
      008FFD AE 00 80         [ 2]  512 	ldw x,#free_ram 
      009000 CF 00 1A         [ 2]  513 	ldw txtbgn,x 
      009003 CF 00 1C         [ 2]  514 	ldw txtend,x 
      009006 CD 8E 54         [ 4]  515 	call clear_vars 
      009009 85               [ 2]  516 	popw x
      00900A 81               [ 4]  517 	ret 
                                    518 
                                    519 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    520 ;;   Tiny BASIC error messages     ;;
                                    521 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00900B                        522 err_msg:
      00900B 00 00 90 2B 90 38 90   523 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             46 90 5F 90 6E
      009017 90 84 90 9A 90 B4 90   524 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             C5 90 D6
      009021 90 E2 91 15 91 25 91   525 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             39 91 4C
                                    526 
      00902B 4D 65 6D 6F 72 79 20   527 err_mem_full: .asciz "Memory full\n" 
             66 75 6C 6C 0A 00
      009038 73 79 6E 74 61 78 20   528 err_syntax: .asciz "syntax error\n" 
             65 72 72 6F 72 0A 00
      009046 6D 61 74 68 20 6F 70   529 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      00905F 64 69 76 69 73 69 6F   530 err_div0: .asciz "division by 0\n" 
             6E 20 62 79 20 30 0A
             00
      00906E 69 6E 76 61 6C 69 64   531 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      009084 72 75 6E 20 74 69 6D   532 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      00909A 63 6F 6D 6D 61 6E 64   533 err_cmd_only: .asciz "command line only usage.\n"
             20 6C 69 6E 65 20 6F
             6E 6C 79 20 75 73 61
             67 65 2E 0A 00
      0090B4 64 75 70 6C 69 63 61   534 err_duplicate: .asciz "duplicate name.\n"
             74 65 20 6E 61 6D 65
             2E 0A 00
      0090C5 46 69 6C 65 20 6E 6F   535 err_not_file: .asciz "File not found.\n"
             74 20 66 6F 75 6E 64
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal  2E-Bits]



             2E 0A 00
      0090D4 0A 00 62 61 64 20 76   536 err_bad_value: .asciz "bad value.\n"
             61 6C 75 65 2E
      0090E0 0A 00 46 69 6C 65 20   537 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             69 6E 20 65 78 74 65
             6E 64 65 64 20 6D 65
             6D 6F 72 79 2C 20 63
             61 6E 27 74 20 62 65
             20 72 75 6E 20 66 72
             6F 6D 20 74 68 65 72
             65 2E
      009113 0A 00 4E 6F 20 64 61   538 err_no_data: .asciz "No data found.\n"
             74 61 20 66 6F 75 6E
             64 2E
      009123 0A 00 4E 6F 20 70 72   539 err_no_prog: .asciz "No program in RAM!\n"
             6F 67 72 61 6D 20 69
             6E 20 52 41 4D 21
      009137 0A 00 46 69 6C 65 20   540 err_no_fspace: .asciz "File system full.\n" 
             73 79 73 74 65 6D 20
             66 75 6C 6C 2E
      00914A 0A 00 42 75 66 66 65   541 err_buf_full: .asciz "Buffer full\n"
             72 20 66 75 6C 6C
                                    542 
      009157 0A 00 0A 72 75 6E 20   543 rt_msg: .asciz "\nrun time error, "
             74 69 6D 65 20 65 72
             72 6F 72 2C
      009169 20 00 0A 63 6F 6D 70   544 comp_msg: .asciz "\ncompile error, "
             69 6C 65 20 65 72 72
             6F 72 2C
      00917A 20 00 6C 61 73 74 20   545 tk_id: .asciz "last token id: "
             74 6F 6B 65 6E 20 69
             64 3A
                                    546 
      00110C                        547 syntax_error::
      00918A 20 00            [ 1]  548 	ld a,#ERR_SYNTAX 
                                    549 
      00918C                        550 tb_error::
      00918C A6 02 00 20 44   [ 2]  551 	btjt flags,#FCOMP,1$
      00918E 88               [ 1]  552 	push a 
      00918E 72 0A 00         [ 2]  553 	ldw x, #rt_msg 
      009191 21 44 88         [ 4]  554 	call puts 
      009194 AE               [ 1]  555 	pop a 
      009195 91 59 CD         [ 2]  556 	ldw x, #err_msg 
      009198 83 9E 84 AE      [ 1]  557 	clr acc16 
      00919C 90               [ 1]  558 	sll a
      00919D 0B 72 5F 00      [ 1]  559 	rlc acc16  
      0091A1 0D 48 72         [ 1]  560 	ld acc8, a 
      0091A4 59 00 0D C7      [ 2]  561 	addw x,acc16 
      0091A8 00               [ 2]  562 	ldw x,(x)
      0091A9 0E 72 BB         [ 4]  563 	call puts
      0091AC 00 0D FE         [ 2]  564 	ldw x,basicptr
      0091AF CD 83 9E         [ 1]  565 	ld a,in 
      0091B2 CE 00 05         [ 4]  566 	call prt_basic_line
      0091B5 C6 00 02         [ 2]  567 	ldw x,#tk_id 
      0091B8 CD 99 96         [ 4]  568 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      0091BB AE 91 7C         [ 1]  569 	ld a,in.saved 
      0091BE CD               [ 1]  570 	clrw x 
      0091BF 83               [ 1]  571 	ld xl,a 
      0091C0 9E C6 00 03      [ 2]  572 	addw x,basicptr 
      0091C4 5F               [ 1]  573 	ld a,(x)
      0091C5 97               [ 1]  574 	clrw x 
      0091C6 72               [ 1]  575 	ld xl,a 
      0091C7 BB 00 05         [ 4]  576 	call print_int
      0091CA F6 5F 97 CD 92   [ 2]  577 	btjf flags,#FAUTORUN ,6$
      0091CF C9 72            [ 2]  578 	jra 6$
      001157                        579 1$:	
      0091D1 0D               [ 1]  580 	push a 
      0091D2 00 21 37         [ 2]  581 	ldw x,#comp_msg
      0091D5 20 35 1E         [ 4]  582 	call puts 
      0091D7 84               [ 1]  583 	pop a 
      0091D7 88 AE 91         [ 2]  584 	ldw x, #err_msg 
      0091DA 6B CD 83 9E      [ 1]  585 	clr acc16 
      0091DE 84               [ 1]  586 	sll a
      0091DF AE 90 0B 72      [ 1]  587 	rlc acc16  
      0091E3 5F 00 0D         [ 1]  588 	ld acc8, a 
      0091E6 48 72 59 00      [ 2]  589 	addw x,acc16 
      0091EA 0D               [ 2]  590 	ldw x,(x)
      0091EB C7 00 0E         [ 4]  591 	call puts
      0091EE 72 BB 00         [ 2]  592 	ldw x,#tib
      0091F1 0D FE CD         [ 4]  593 	call puts 
      0091F4 83 9E            [ 1]  594 	ld a,#CR 
      0091F6 AE 16 90         [ 4]  595 	call putc
      0091F9 CD 83 9E         [ 2]  596 	ldw x,in.w
      0091FC A6 0D CD         [ 4]  597 	call spaces
      0091FF 83 41            [ 1]  598 	ld a,#'^
      009201 CE 00 01         [ 4]  599 	call putc 
      009204 CD 84 0B         [ 2]  600 6$: ldw x,#STACK_EMPTY 
      009207 A6               [ 1]  601     ldw sp,x
      001190                        602 warm_start:
      009208 5E CD 83         [ 4]  603 	call warm_init
                                    604 ;----------------------------
                                    605 ;   BASIC interpreter
                                    606 ;----------------------------
      001193                        607 cmd_line: ; user interface 
      00920B 41 AE            [ 1]  608 	ld a,#CR 
      00920D 17 FF 94         [ 4]  609 	call putc 
      009210 A6 3E            [ 1]  610 	ld a,#'> 
      009210 CD 8F D6         [ 4]  611 	call putc
      009213 CD 04 23         [ 4]  612 	call readln
      009213 A6 0D CD 83      [ 1]  613 	tnz count 
      009217 41 A6            [ 1]  614 	jreq cmd_line
      009219 3E CD 83         [ 4]  615 	call compile
                                    616 ; if text begin with a line number
                                    617 ; the compiler set count to zero    
                                    618 ; so code is not interpreted
      00921C 41 CD 84 A3      [ 1]  619 	tnz count 
      009220 72 5D            [ 1]  620 	jreq cmd_line
                                    621 
                                    622 ; if direct command 
                                    623 ; it's ready to interpret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                                    624 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    625 ;; This is the interpreter loop
                                    626 ;; for each BASIC code line. 
                                    627 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      0011AF                        628 interpreter: 
      009222 00 04 27         [ 1]  629 	ld a,in 
      009225 ED CD 8A         [ 1]  630 	cp a,count 
      009228 7C 72            [ 1]  631 	jrmi interp_loop
      0011B7                        632 next_line:
      00922A 5D 00 04 27 E4   [ 2]  633 	btjf flags, #FRUN, cmd_line
      00922F CE 00 04         [ 2]  634 	ldw x,basicptr
      00922F C6 00 02 C1      [ 2]  635 	addw x,in.w 
      009233 00 04 2B         [ 2]  636 	cpw x,txtend 
      009236 1D C8            [ 1]  637 	jrpl warm_start
      009237 CF 00 04         [ 2]  638 	ldw basicptr,x ; start of next line  
      009237 72 01            [ 1]  639 	ld a,(2,x)
      009239 00 21 D7         [ 1]  640 	ld count,a 
      00923C CE 00 05 72      [ 1]  641 	mov in,#3 ; skip first 3 bytes of line 
      0011D4                        642 interp_loop: 
      009240 BB 00 01         [ 4]  643 	call next_token
      009243 C3 00            [ 1]  644 	cp a,#TK_NONE 
      009245 1C 2A            [ 1]  645 	jreq next_line 
      009247 C8 CF            [ 1]  646 	cp a,#TK_CMD
      009249 00 05            [ 1]  647 	jrne 1$
      00924B E6               [ 4]  648 	call (x) 
      00924C 02 C7            [ 2]  649 	jra interp_loop 
      0011E2                        650 1$:	 
      00924E 00 04            [ 1]  651 	cp a,#TK_VAR
      009250 35 03            [ 1]  652 	jrne 2$
      009252 00 02 1B         [ 4]  653 	call let_var  
      009254 20 E9            [ 2]  654 	jra interp_loop 
      0011EB                        655 2$:	
      009254 CD 92            [ 1]  656 	cp a,#TK_ARRAY 
      009256 7B A1            [ 1]  657 	jrne 3$
      009258 00 27 DC         [ 4]  658 	call let_array 
      00925B A1 80            [ 2]  659 	jra interp_loop
      0011F4                        660 3$:	
      00925D 26 03            [ 1]  661 	cp a,#TK_COLON 
      00925F FD 20            [ 1]  662 	jreq interp_loop 
      009261 F2 11 0C         [ 2]  663 	jp syntax_error 
                                    664 
                                    665 		
                                    666 ;--------------------------
                                    667 ; extract next token from
                                    668 ; token list 
                                    669 ; basicptr -> base address 
                                    670 ; in  -> offset in list array 
                                    671 ; output:
                                    672 ;   A 		token attribute
                                    673 ;   X 		token value if there is one
                                    674 ;----------------------------------------
      009262                        675 next_token::
      009262 A1               [ 1]  676 	clrw x 
      009263 85 26 05         [ 1]  677 	ld a,in 
                                    678 ; don't replace sub by "cp a,count" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



                                    679 ; if end of line must return with A=0   	
      009266 CD 98 9B         [ 1]  680 	sub a,count 
      009269 20 E9            [ 1]  681 	jreq 9$ ; end of line 
      00926B                        682 0$: 
      00926B A1 06 26 05 CD   [ 1]  683 	mov in.saved,in ; in case "_unget_token" needed 
      009270 98 98 20 E0      [ 2]  684 	ldw y,basicptr 
      009274 72 B9 00 00      [ 2]  685 	addw y,in.w 
      009274 A1 0B            [ 1]  686 	ld a,(y)
      009276 27 DC            [ 1]  687 	incw y   
      009278 CC               [ 1]  688 	tnz a 
      009279 91 8C            [ 1]  689 	jrmi 4$
      00927B A1 06            [ 1]  690 	cp a,#TK_ARRAY
      00927B 5F C6            [ 1]  691 	jrpl 7$  ; no attribute for these
      00121C                        692 1$: ; 
      00927D 00 02            [ 1]  693 	cp a,#TK_CHAR
      00927F C0 00            [ 1]  694 	jrne 2$
      009281 04               [ 1]  695 	exg a,xl
      009282 27 44            [ 1]  696 	ld a,(y)
      009284 41               [ 1]  697 	exg a,xl  
      009284 55 00            [ 2]  698 	jra 6$ 
      009286 02 00            [ 1]  699 2$:	cp a,#TK_QSTR 
      009288 03 90            [ 1]  700 	jrne 7$
      00928A CE               [ 1]  701 	ldw x,y 
                                    702 ; move pointer after string 
      00928B 00 05            [ 1]  703 3$:	tnz (y)
      00928D 72 B9            [ 1]  704 	jreq 6$
      00928F 00 01            [ 1]  705 	incw y 
      009291 90 F6            [ 2]  706 	jra 3$
      001233                        707 4$: 
      009293 90               [ 1]  708 	ldw x,y 
      009294 5C               [ 2]  709 	ldw x,(x)
      009295 4D 2B            [ 1]  710 	cp a,#TK_INTGR
      009297 1B A1            [ 1]  711 	jrpl 5$
      009299 06 2A 24         [ 2]  712 	ldw x,(code_addr,x) 
      00929C 90 5C            [ 1]  713 5$:	incw y 
      00929C A1 03            [ 1]  714 6$:	incw y 
      00929E 26 06 41 90      [ 2]  715 7$:	subw y,basicptr 
      0092A2 F6 41 20 18      [ 2]  716 	ldw in.w,y 
      001248                        717 9$: 
      0092A6 A1               [ 4]  718 	ret	
                                    719 
                                    720 ;-----------------------------------
                                    721 ; print a 16 bit integer 
                                    722 ; using variable 'base' as conversion
                                    723 ; format.
                                    724 ; input:
                                    725 ;   X       integer to print 
                                    726 ;   'base'    conversion base 
                                    727 ; output:
                                    728 ;   none 
                                    729 ;-----------------------------------
      001249                        730 print_int:
      0092A7 02 26 16 93      [ 1]  731 	clr acc24 
      0092AB 90 7D 27         [ 2]  732 	ldw acc16,x 
      0092AE 0F 90 5C 20 F8   [ 2]  733 	btjf acc16,#7,prti24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      0092B3 72 53 00 0B      [ 1]  734 	cpl acc24 
                                    735 	
                                    736 ;------------------------------------
                                    737 ; print integer in acc24 
                                    738 ; input:
                                    739 ;	acc24 		integer to print 
                                    740 ;	'base' 		numerical base for conversion 
                                    741 ;   'tab_width' field width 
                                    742 ;  output:
                                    743 ;    A          string length
                                    744 ;------------------------------------
      001259                        745 prti24:
      0092B3 93 FE A1         [ 4]  746     call itoa  ; conversion entier en  .asciz
      0092B6 84 2A 03         [ 4]  747 	call right_align  
      0092B9 DE               [ 1]  748 	push a 
      0092BA A9 A0 90         [ 4]  749 	call puts
      0092BD 5C               [ 1]  750 	pop a 
      0092BE 90               [ 4]  751     ret	
                                    752 
                                    753 ;------------------------------------
                                    754 ; convert integer in acc24 to string
                                    755 ; input:
                                    756 ;   'base'	conversion base 
                                    757 ;	acc24	integer to convert
                                    758 ; output:
                                    759 ;   X  		pointer to first char of string
                                    760 ;   A       string length
                                    761 ;------------------------------------
                           000001   762 	SIGN=1  ; integer sign 
                           000002   763 	LEN=2 
                           000003   764 	PSTR=3
                           000004   765 	VSIZE=4 ;locals size
      001265                        766 itoa::
      001265                        767 	_vars VSIZE
      0092BF 5C 72            [ 2]    1     sub sp,#VSIZE 
      0092C1 B2 00            [ 1]  768 	clr (LEN,sp) ; string length  
      0092C3 05 90            [ 1]  769 	clr (SIGN,sp)    ; sign
      0092C5 CF 00 01         [ 1]  770 	ld a,base 
      0092C8 A1 0A            [ 1]  771 	cp a,#10
      0092C8 81 0A            [ 1]  772 	jrne 1$
                                    773 	; base 10 string display with negative sign if bit 23==1
      0092C9 72 0F 00 0B 05   [ 2]  774 	btjf acc24,#7,1$
      0092C9 72 5F            [ 1]  775 	cpl (SIGN,sp)
      0092CB 00 0C CF         [ 4]  776 	call neg_acc24
      00127C                        777 1$:
                                    778 ; initialize string pointer 
      0092CE 00 0D 72         [ 2]  779 	ldw x,#tib 
      0092D1 0F 00 0D         [ 2]  780 	addw x,#TIB_SIZE
      0092D4 04               [ 2]  781 	decw x 
      0092D5 72               [ 1]  782 	clr (x)
      0092D6 53               [ 2]  783 	decw x 
      0092D7 00 0C            [ 1]  784 	ld a,#32
      0092D9 F7               [ 1]  785 	ld (x),a
      0092D9 CD 92            [ 1]  786 	inc (LEN,sp)
      00128A                        787 itoa_loop:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      0092DB E5 CD 8B         [ 1]  788     ld a,base
      0092DE 1B 88            [ 2]  789 	ldw (PSTR,sp),x 
      0092E0 CD 83 9E         [ 4]  790     call divu24_8 ; acc24/A 
      0092E3 84 81            [ 2]  791 	ldw x,(PSTR,sp)
      0092E5 AB 30            [ 1]  792     add a,#'0  ; remainder of division
      0092E5 52 04            [ 1]  793     cp a,#'9+1
      0092E7 0F 02            [ 1]  794     jrmi 2$
      0092E9 0F 01            [ 1]  795     add a,#7 
      00129C                        796 2$:	
      0092EB C6               [ 2]  797 	decw x
      0092EC 00               [ 1]  798     ld (x),a
      0092ED 0B A1            [ 1]  799 	inc (LEN,sp)
                                    800 	; if acc24==0 conversion done
      0092EF 0A 26 0A         [ 1]  801 	ld a,acc24
      0092F2 72 0F 00         [ 1]  802 	or a,acc16
      0092F5 0C 05 03         [ 1]  803 	or a,acc8
      0092F8 01 CD            [ 1]  804     jrne itoa_loop
                                    805 	;conversion done, next add '$' or '-' as required
      0092FA 93 B2 0A         [ 1]  806 	ld a,base 
      0092FC A1 10            [ 1]  807 	cp a,#16
      0092FC AE 16            [ 1]  808 	jreq 8$
      0092FE 90 1C            [ 1]  809 	ld a,(SIGN,sp)
      009300 00 50            [ 1]  810     jreq 10$
      009302 5A 7F            [ 1]  811     ld a,#'-
      009304 5A A6            [ 2]  812 	jra 9$ 
                                    813 ; don't print more than 4 digits
                                    814 ; in hexadecimal to avoid '-' sign 
                                    815 ; extend display 	
      009306 20 F7            [ 1]  816 8$: ld a,(LEN,sp) 
      009308 0C 02            [ 1]  817 	cp a,#6 
      00930A 2B 05            [ 1]  818 	jrmi 81$
      00930A C6               [ 1]  819 	incw x
      00930B 00 0B            [ 1]  820 	dec (LEN,sp)
      00930D 1F 03            [ 2]  821 	jra 8$
      0012C5                        822 81$:	
      00930F CD 93            [ 1]  823 	ld a,#'$ 
      009311 50               [ 2]  824 9$: decw x
      009312 1E               [ 1]  825     ld (x),a
      009313 03 AB            [ 1]  826 	inc (LEN,sp)
      0012CB                        827 10$:
      009315 30 A1            [ 1]  828 	ld a,(LEN,sp)
      0012CD                        829 	_drop VSIZE
      009317 3A 2B            [ 2]    1     addw sp,#VSIZE 
      009319 02               [ 4]  830 	ret
                                    831 
                                    832 ;-------------------------------------
                                    833 ; divide uint24_t by uint8_t
                                    834 ; used to convert uint24_t to string
                                    835 ; input:
                                    836 ;	acc24	dividend
                                    837 ;   A 		divisor
                                    838 ; output:
                                    839 ;   acc24	quotient
                                    840 ;   A		remainder
                                    841 ;------------------------------------- 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                                    842 ; offset  on sp of arguments and locals
                           000001   843 	U8   = 1   ; divisor on stack
                           000001   844 	VSIZE =1
      0012D0                        845 divu24_8:
      00931A AB               [ 2]  846 	pushw x ; save x
      00931B 07               [ 1]  847 	push a 
                                    848 	; ld dividend UU:MM bytes in X
      00931C C6 00 0B         [ 1]  849 	ld a, acc24
      00931C 5A               [ 1]  850 	ld xh,a
      00931D F7 0C 02         [ 1]  851 	ld a,acc24+1
      009320 C6               [ 1]  852 	ld xl,a
      009321 00 0C            [ 1]  853 	ld a,(U8,SP) ; divisor
      009323 CA               [ 2]  854 	div x,a ; UU:MM/U8
      009324 00               [ 1]  855 	push a  ;save remainder
      009325 0D               [ 1]  856 	ld a,xh
      009326 CA 00 0E         [ 1]  857 	ld acc24,a
      009329 26               [ 1]  858 	ld a,xl
      00932A DF C6 00         [ 1]  859 	ld acc24+1,a
      00932D 0B               [ 1]  860 	pop a
      00932E A1               [ 1]  861 	ld xh,a
      00932F 10 27 08         [ 1]  862 	ld a,acc24+2
      009332 7B               [ 1]  863 	ld xl,a
      009333 01 27            [ 1]  864 	ld a,(U8,sp) ; divisor
      009335 15               [ 2]  865 	div x,a  ; R:LL/U8
      009336 A6 2D            [ 1]  866 	ld (U8,sp),a ; save remainder
      009338 20               [ 1]  867 	ld a,xl
      009339 0D 7B 02         [ 1]  868 	ld acc24+2,a
      00933C A1               [ 1]  869 	pop a
      00933D 06               [ 2]  870 	popw x
      00933E 2B               [ 4]  871 	ret
                                    872 
                                    873 ;--------------------------------------
                                    874 ; unsigned multiply uint24_t by uint8_t
                                    875 ; use to convert numerical string to uint24_t
                                    876 ; input:
                                    877 ;	acc24	uint24_t 
                                    878 ;   A		uint8_t
                                    879 ; output:
                                    880 ;   acc24   A*acc24
                                    881 ;-------------------------------------
                                    882 ; local variables offset  on sp
                           000003   883 	U8   = 3   ; A pushed on stack
                           000002   884 	OVFL = 2  ; multiplicaton overflow low byte
                           000001   885 	OVFH = 1  ; multiplication overflow high byte
                           000003   886 	VSIZE = 3
      0012F8                        887 mulu24_8:
      00933F 05               [ 2]  888 	pushw x    ; save X
                                    889 	; local variables
      009340 5C               [ 1]  890 	push a     ; U8
      009341 0A               [ 1]  891 	clrw x     ; initialize overflow to 0
      009342 02               [ 2]  892 	pushw x    ; multiplication overflow
                                    893 ; multiply low byte.
      009343 20 F5 0D         [ 1]  894 	ld a,acc24+2
      009345 97               [ 1]  895 	ld xl,a
      009345 A6 24            [ 1]  896 	ld a,(U8,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      009347 5A               [ 4]  897 	mul x,a
      009348 F7               [ 1]  898 	ld a,xl
      009349 0C 02 0D         [ 1]  899 	ld acc24+2,a
      00934B 9E               [ 1]  900 	ld a, xh
      00934B 7B 02            [ 1]  901 	ld (OVFL,sp),a
                                    902 ; multipy middle byte
      00934D 5B 04 81         [ 1]  903 	ld a,acc24+1
      009350 97               [ 1]  904 	ld xl,a
      009350 89 88            [ 1]  905 	ld a, (U8,sp)
      009352 C6               [ 4]  906 	mul x,a
                                    907 ; add overflow to this partial product
      009353 00 0C 95         [ 2]  908 	addw x,(OVFH,sp)
      009356 C6               [ 1]  909 	ld a,xl
      009357 00 0D 97         [ 1]  910 	ld acc24+1,a
      00935A 7B               [ 1]  911 	clr a
      00935B 01 62            [ 1]  912 	adc a,#0
      00935D 88 9E            [ 1]  913 	ld (OVFH,sp),a
      00935F C7               [ 1]  914 	ld a,xh
      009360 00 0C            [ 1]  915 	ld (OVFL,sp),a
                                    916 ; multiply most signficant byte	
      009362 9F C7 00         [ 1]  917 	ld a, acc24
      009365 0D               [ 1]  918 	ld xl, a
      009366 84 95            [ 1]  919 	ld a, (U8,sp)
      009368 C6               [ 4]  920 	mul x,a
      009369 00 0E 97         [ 2]  921 	addw x, (OVFH,sp)
      00936C 7B               [ 1]  922 	ld a, xl
      00936D 01 62 6B         [ 1]  923 	ld acc24,a
      009370 01 9F            [ 2]  924     addw sp,#VSIZE
      009372 C7               [ 2]  925 	popw x
      009373 00               [ 4]  926 	ret
                                    927 
                                    928 ;------------------------------------
                                    929 ;  two's complement acc24
                                    930 ;  input:
                                    931 ;		acc24 variable
                                    932 ;  output:
                                    933 ;		acc24 variable
                                    934 ;-------------------------------------
      001332                        935 neg_acc24:
      009374 0E 84 85 81      [ 1]  936 	cpl acc24+2
      009378 72 53 00 0C      [ 1]  937 	cpl acc24+1
      009378 89 88 5F 89      [ 1]  938 	cpl acc24
      00937C C6 00            [ 1]  939 	ld a,#1
      00937E 0E 97 7B         [ 1]  940 	add a,acc24+2
      009381 03 42 9F         [ 1]  941 	ld acc24+2,a
      009384 C7               [ 1]  942 	clr a
      009385 00 0E 9E         [ 1]  943 	adc a,acc24+1
      009388 6B 02 C6         [ 1]  944 	ld acc24+1,a 
      00938B 00               [ 1]  945 	clr a 
      00938C 0D 97 7B         [ 1]  946 	adc a,acc24 
      00938F 03 42 72         [ 1]  947 	ld acc24,a 
      009392 FB               [ 4]  948 	ret
                                    949 
                                    950 
                                    951 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



                                    952 
                                    953 ;------------------------------------
                                    954 ; convert alpha to uppercase
                                    955 ; input:
                                    956 ;    a  character to convert
                                    957 ; output:
                                    958 ;    a  uppercase character
                                    959 ;------------------------------------
      001355                        960 to_upper::
      009393 01 9F            [ 1]  961 	cp a,#'a
      009395 C7 00            [ 1]  962 	jrpl 1$
      009397 0D               [ 4]  963 0$:	ret
      009398 4F A9            [ 1]  964 1$: cp a,#'z	
      00939A 00 6B            [ 1]  965 	jrugt 0$
      00939C 01 9E            [ 1]  966 	sub a,#32
      00939E 6B               [ 4]  967 	ret
                                    968 	
                                    969 ;------------------------------------
                                    970 ; convert pad content in integer
                                    971 ; input:
                                    972 ;    x		.asciz to convert
                                    973 ; output:
                                    974 ;    acc24      int24_t
                                    975 ;------------------------------------
                                    976 	; local variables
                           000001   977 	SIGN=1 ; 1 byte, 
                           000002   978 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003   979 	TEMP=3 ; 1 byte, temporary storage
                           000003   980 	VSIZE=3 ; 3 bytes reserved for local storage
      001361                        981 atoi24::
      00939F 02               [ 2]  982 	pushw x 
      001362                        983 	_vars VSIZE
      0093A0 C6 00            [ 2]    1     sub sp,#VSIZE 
                                    984 	; acc24=0 
      0093A2 0C 97 7B 03      [ 1]  985 	clr acc24    
      0093A6 42 72 FB 01      [ 1]  986 	clr acc16
      0093AA 9F C7 00 0C      [ 1]  987 	clr acc8 
      0093AE 5B 03            [ 1]  988 	clr (SIGN,sp)
      0093B0 85 81            [ 1]  989 	ld a,#10
      0093B2 6B 02            [ 1]  990 	ld (BASE,sp),a ; default base decimal
      0093B2 72               [ 1]  991 	ld a,(x)
      0093B3 53 00            [ 1]  992 	jreq 9$  ; completed if 0
      0093B5 0E 72            [ 1]  993 	cp a,#'-
      0093B7 53 00            [ 1]  994 	jrne 1$
      0093B9 0D 72            [ 1]  995 	cpl (SIGN,sp)
      0093BB 53 00            [ 2]  996 	jra 2$
      0093BD 0C A6            [ 1]  997 1$: cp a,#'$
      0093BF 01 CB            [ 1]  998 	jrne 3$
      0093C1 00 0E            [ 1]  999 	ld a,#16
      0093C3 C7 00            [ 1] 1000 	ld (BASE,sp),a
      0093C5 0E               [ 1] 1001 2$:	incw x
      0093C6 4F               [ 1] 1002 	ld a,(x)
      00138B                       1003 3$:	
      0093C7 C9 00            [ 1] 1004 	cp a,#'a
      0093C9 0D C7            [ 1] 1005 	jrmi 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      0093CB 00 0D            [ 1] 1006 	sub a,#32
      0093CD 4F C9            [ 1] 1007 4$:	cp a,#'0
      0093CF 00 0C            [ 1] 1008 	jrmi 9$
      0093D1 C7 00            [ 1] 1009 	sub a,#'0
      0093D3 0C 81            [ 1] 1010 	cp a,#10
      0093D5 2B 06            [ 1] 1011 	jrmi 5$
      0093D5 A1 61            [ 1] 1012 	sub a,#7
      0093D7 2A 01            [ 1] 1013 	cp a,(BASE,sp)
      0093D9 81 A1            [ 1] 1014 	jrpl 9$
      0093DB 7A 22            [ 1] 1015 5$:	ld (TEMP,sp),a
      0093DD FB A0            [ 1] 1016 	ld a,(BASE,sp)
      0093DF 20 81 F8         [ 4] 1017 	call mulu24_8
      0093E1 7B 03            [ 1] 1018 	ld a,(TEMP,sp)
      0093E1 89 52 03         [ 1] 1019 	add a,acc24+2
      0093E4 72 5F 00         [ 1] 1020 	ld acc24+2,a
      0093E7 0C               [ 1] 1021 	clr a
      0093E8 72 5F 00         [ 1] 1022 	adc a,acc24+1
      0093EB 0D 72 5F         [ 1] 1023 	ld acc24+1,a
      0093EE 00               [ 1] 1024 	clr a
      0093EF 0E 0F 01         [ 1] 1025 	adc a,acc24
      0093F2 A6 0A 6B         [ 1] 1026 	ld acc24,a
      0093F5 02 F6            [ 2] 1027 	jra 2$
      0093F7 27 47            [ 1] 1028 9$:	tnz (SIGN,sp)
      0093F9 A1 2D            [ 1] 1029     jreq atoi_exit
      0093FB 26 04 03         [ 4] 1030     call neg_acc24
      0013C7                       1031 atoi_exit: 
      0013C7                       1032 	_drop VSIZE
      0093FE 01 20            [ 2]    1     addw sp,#VSIZE 
      009400 08               [ 2] 1033 	popw x ; restore x
      009401 A1               [ 4] 1034 	ret
                                   1035 
                                   1036 
                                   1037 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1038 ;;   TINY BASIC  operators,
                                   1039 ;;   commands and functions 
                                   1040 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1041 
                                   1042 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1043 ;;  Arithmetic operators
                                   1044 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1045 
                                   1046 ;debug support
                           000001  1047 DEBUG_PRT=1
                           000001  1048 .if DEBUG_PRT 
                           000001  1049 	REGA=1
                           000002  1050 	SAVEB=2
                           000003  1051 	REGX=3
                           000005  1052 	REGY=5
                           000007  1053 	ACC24=7
                           000009  1054 	VSIZE=9 
      0013CB                       1055 printxy:
      0013CB                       1056 	_vars VSIZE 
      009402 24 26            [ 2]    1     sub sp,#VSIZE 
      009404 06 A6            [ 1] 1057 	ld (REGA,sp),a 
      009406 10 6B 02         [ 1] 1058 	ld a,base 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009409 5C F6            [ 1] 1059 	ld (SAVEB,sp),a
      00940B 1F 03            [ 2] 1060 	ldw (REGX,sp),x
      00940B A1 61            [ 2] 1061 	ldw (REGY,sp),y
      00940D 2B 02 A0         [ 2] 1062 	ldw x,acc24 
      009410 20 A1 30         [ 1] 1063 	ld a,acc8 
      009413 2B 2B            [ 2] 1064 	ldw (ACC24,sp),x 
      009415 A0 30            [ 1] 1065 	ld (ACC24+2,sp),a 
      009417 A1 0A 2B 06      [ 1] 1066 	mov base,#16 
      00941B A0               [ 1] 1067 	clrw x 
      00941C 07 11            [ 1] 1068 	ld a,(REGA,sp)
      00941E 02               [ 1] 1069 	ld xl,a 
      00941F 2A 1F 6B         [ 4] 1070 	call print_int
      009422 03 7B            [ 1] 1071 	ld a,#SPACE 
      009424 02 CD 93         [ 4] 1072 	call putc  
      009427 78 7B            [ 2] 1073 	ldw x,(REGX,sp)
      009429 03 CB 00         [ 4] 1074 	call print_int 
      00942C 0E C7            [ 1] 1075 	ld a,#SPACE 
      00942E 00 0E 4F         [ 4] 1076 	call putc  
      009431 C9 00            [ 2] 1077 	ldw x,(REGY,sp)
      009433 0D C7 00         [ 4] 1078 	call print_int 
      009436 0D 4F            [ 1] 1079 	ld a,#CR 
      009438 C9 00 0C         [ 4] 1080 	call putc 
      00943B C7 00            [ 1] 1081 	ld a,(ACC24+2,sp)
      00943D 0C 20            [ 2] 1082 	ldw x,(ACC24,sp)
      00943F C9 0D 01         [ 2] 1083 	ldw acc24,x 
      009442 27 03 CD         [ 1] 1084 	ld acc8,a
      009445 93 B2            [ 1] 1085 	ld a,(SAVEB,sp)
      009447 C7 00 0A         [ 1] 1086 	ld base,a 
      009447 5B 03            [ 1] 1087 	ld a,(REGA,sp)
      009449 85 81            [ 2] 1088 	ldw x,(REGX,sp)
      00944B 16 05            [ 2] 1089 	ldw y,(REGY,sp)
      00141B                       1090 	_drop VSIZE 
      00944B 52 09            [ 2]    1     addw sp,#VSIZE 
      00944D 6B               [ 4] 1091 	ret 
                                   1092 .endif 
                                   1093 
                                   1094 
                                   1095 ;--------------------------------------
                                   1096 ;  multiply 2 uint16_t return uint32_t
                                   1097 ;  input:
                                   1098 ;     x       uint16_t 
                                   1099 ;     y       uint16_t 
                                   1100 ;  output:
                                   1101 ;     x       product bits 15..0
                                   1102 ;     y       product bits 31..16 
                                   1103 ;---------------------------------------
                           000001  1104 		U1=1  ; uint16_t 
                           000003  1105 		DBL=3 ; uint32_t
                           000006  1106 		VSIZE=6
      00141E                       1107 umstar:
      00141E                       1108 	_vars VSIZE 
      00944E 01 C6            [ 2]    1     sub sp,#VSIZE 
      009450 00 0B            [ 2] 1109 	ldw (U1,sp),x 
                                   1110 ;initialize bits 31..16 of 
                                   1111 ;product to zero 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009452 6B 02            [ 1] 1112 	clr (DBL,sp)
      009454 1F 03            [ 1] 1113 	clr (DBL+1,sp)
                                   1114 ; produc U1L*U2L 
      009456 17 05            [ 1] 1115 	ld a,yl 
      009458 CE               [ 4] 1116 	mul x,a 
      009459 00 0C            [ 2] 1117 	ldw (DBL+2,sp),x
                                   1118 ; product U1H*U2L 
      00945B C6 00            [ 1] 1119 	ld a,(U1,sp) ; xh 
      00945D 0E               [ 1] 1120 	ldw x,y
      00945E 1F               [ 4] 1121 	mul x,a 
      00945F 07               [ 1] 1122 	clr a 
      009460 6B 09 35         [ 2] 1123 	addw x,(DBL+1,sp) 
      009463 10               [ 1] 1124 	clr a 
      009464 00 0B            [ 1] 1125 	adc a,(DBL,sp) 
      009466 5F 7B            [ 1] 1126 	ld (DBL,sp),a ; bits 23..17 
      009468 01 97            [ 2] 1127 	ldw (DBL+1,sp),x ; bits 15..0 
                                   1128 ; product U1L*U2H
      00946A CD 92            [ 1] 1129 	swapw y 
      00946C C9               [ 1] 1130 	ldw x,y
      00946D A6 20            [ 1] 1131 	ld a,(U1+1,sp)
      00946F CD               [ 4] 1132 	mul x,a
      009470 83 41 1E         [ 2] 1133 	addw x,(DBL+1,sp)
      009473 03               [ 1] 1134 	clr a 
      009474 CD 92            [ 1] 1135 	adc a,(DBL,sp)
      009476 C9 A6            [ 1] 1136 	ld (DBL,sp),a 
      009478 20 CD            [ 2] 1137 	ldw (DBL+1,sp),x 
                                   1138 ; product U1H*U2H 	
      00947A 83 41            [ 1] 1139 	ld a,(U1,sp)
      00947C 1E               [ 1] 1140 	ldw x,y  
      00947D 05               [ 4] 1141 	mul x,a 
      00947E CD 92 C9         [ 2] 1142 	addw x,(DBL,sp)
      009481 A6 0D            [ 1] 1143 	ldw y,x 
      009483 CD 83            [ 2] 1144 	ldw x,(DBL+2,sp)
      001455                       1145 	_drop VSIZE 
      009485 41 7B            [ 2]    1     addw sp,#VSIZE 
      009487 09               [ 4] 1146 	ret
                                   1147 
                                   1148 
                                   1149 ;-------------------------------------
                                   1150 ; multiply 2 integers
                                   1151 ; input:
                                   1152 ;  	x       n1 
                                   1153 ;   y 		n2 
                                   1154 ; output:
                                   1155 ;	X        N1*N2 bits 15..0
                                   1156 ;   Y        N1*N2 bits 31..16 
                                   1157 ;-------------------------------------
                           000001  1158 	SIGN=1
                           000001  1159 	VSIZE=1
      001458                       1160 multiply:
      001458                       1161 	_vars VSIZE 
      009488 1E 07            [ 2]    1     sub sp,#VSIZE 
      00948A CF 00            [ 1] 1162 	clr (SIGN,sp)
      00948C 0C               [ 1] 1163 	ld a,xh 
      00948D C7 00            [ 1] 1164 	and a,#0x80
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      00948F 0E 7B            [ 1] 1165 	jrpl 1$
      009491 02 C7            [ 1] 1166 	cpl (SIGN,sp)
      009493 00               [ 2] 1167 	negw x 
      001464                       1168 1$:	
      009494 0B 7B            [ 1] 1169 	ld a,yh
      009496 01 1E            [ 1] 1170 	and a,#0x80  
      009498 03 16            [ 1] 1171 	jrpl 2$ 
      00949A 05 5B            [ 1] 1172 	cpl (SIGN,sp)
      00949C 09 81            [ 2] 1173 	negw y 
      00949E                       1174 2$:	
      00949E 52 06 1F         [ 4] 1175 	call umstar
      0094A1 01 0F            [ 1] 1176 	ld a,(SIGN,sp)
      0094A3 03 0F            [ 1] 1177 	jreq 3$
      0094A5 04 90 9F         [ 4] 1178 	call dneg 
      001478                       1179 3$:	
      001478                       1180 	_drop VSIZE 
      0094A8 42 1F            [ 2]    1     addw sp,#VSIZE 
      0094AA 05               [ 4] 1181 	ret
                                   1182 
                                   1183 ;--------------------------------------
                                   1184 ; divide uint32_t/uint16_t
                                   1185 ; return:  quotient and remainder 
                                   1186 ; quotient expected to be uint16_t 
                                   1187 ; input:
                                   1188 ;   DBLDIVDND    on stack 
                                   1189 ;   X            divisor 
                                   1190 ; output:
                                   1191 ;   X            quotient 
                                   1192 ;   Y            remainder 
                                   1193 ;---------------------------------------
                           000003  1194 	VSIZE=3
      00147B                       1195 	_argofs VSIZE 
                           000005     1     ARG_OFS=2+VSIZE 
      00147B                       1196 	_arg DBLDIVDND 1
                           000006     1     DBLDIVDND=ARG_OFS+1 
                                   1197 	; local variables 
                           000001  1198 	DIVISOR=1 
                           000003  1199 	CNTR=3 
      00147B                       1200 udiv32_16:
      00147B                       1201 	_vars VSIZE 
      0094AB 7B 01            [ 2]    1     sub sp,#VSIZE 
      0094AD 93 42            [ 2] 1202 	ldw (DIVISOR,sp),x	; save divisor 
      0094AF 4F 72            [ 2] 1203 	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
      0094B1 FB 04            [ 2] 1204 	ldw y,(DBLDIVDND,sp) ; bits 31..16
      0094B3 4F 19            [ 2] 1205 	tnzw y
      0094B5 03 6B            [ 1] 1206 	jrne long_division 
      0094B7 03 1F            [ 2] 1207 	ldw y,(DIVISOR,sp)
      0094B9 04               [ 2] 1208 	divw x,y
      00148A                       1209 	_drop VSIZE 
      0094BA 90 5E            [ 2]    1     addw sp,#VSIZE 
      0094BC 93               [ 4] 1210 	ret
      00148D                       1211 long_division:
      0094BD 7B               [ 1] 1212 	exgw x,y ; hi in x, lo in y 
      0094BE 02 42            [ 1] 1213 	ld a,#17 
      0094C0 72 FB            [ 1] 1214 	ld (CNTR,sp),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      001492                       1215 1$:
      0094C2 04 4F            [ 2] 1216 	cpw x,(DIVISOR,sp)
      0094C4 19 03            [ 1] 1217 	jrmi 2$
      0094C6 6B 03 1F         [ 2] 1218 	subw x,(DIVISOR,sp)
      0094C9 04               [ 1] 1219 2$:	ccf 
      0094CA 7B 01            [ 2] 1220 	rlcw y 
      0094CC 93               [ 2] 1221 	rlcw x 
      0094CD 42 72            [ 1] 1222 	dec (CNTR,sp)
      0094CF FB 03            [ 1] 1223 	jrne 1$
      0094D1 90               [ 1] 1224 	exgw x,y 
      0014A2                       1225 	_drop VSIZE 
      0094D2 93 1E            [ 2]    1     addw sp,#VSIZE 
      0094D4 05               [ 4] 1226 	ret
                                   1227 
                                   1228 ;-----------------------------
                                   1229 ; negate double int.
                                   1230 ; input:
                                   1231 ;   x     bits 15..0
                                   1232 ;   y     bits 31..16
                                   1233 ; output: 
                                   1234 ;   x     bits 15..0
                                   1235 ;   y     bits 31..16
                                   1236 ;-----------------------------
      0014A5                       1237 dneg:
      0094D5 5B               [ 2] 1238 	cplw x 
      0094D6 06 81            [ 2] 1239 	cplw y 
      0094D8 1C 00 01         [ 2] 1240 	addw x,#1 
      0094D8 52 01            [ 1] 1241 	jrnc 1$
      0094DA 0F 01            [ 1] 1242 	incw y 
      0094DC 9E               [ 4] 1243 1$: ret 
                                   1244 
                                   1245 
                                   1246 ;--------------------------------
                                   1247 ; sign extend single to double
                                   1248 ; input:
                                   1249 ;   x    int16_t
                                   1250 ; output:
                                   1251 ;   x    int32_t bits 15..0
                                   1252 ;   y    int32_t bits 31..16
                                   1253 ;--------------------------------
      0014B0                       1254 dbl_sign_extend:
      0094DD A4 80            [ 1] 1255 	clrw y
      0094DF 2A               [ 1] 1256 	ld a,xh 
      0094E0 03 03            [ 1] 1257 	and a,#0x80 
      0094E2 01 50            [ 1] 1258 	jreq 1$
      0094E4 90 53            [ 2] 1259 	cplw y
      0094E4 90               [ 4] 1260 1$: ret 	
                                   1261 
                                   1262 
                                   1263 ;----------------------------------
                                   1264 ;  euclidian divide dbl/n1 
                                   1265 ;  ref: https://en.wikipedia.org/wiki/Euclidean_division
                                   1266 ; input:
                                   1267 ;    dbl    int32_t on stack 
                                   1268 ;    x 		n1   int16_t  disivor  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



                                   1269 ; output:
                                   1270 ;    X      dbl/x  int16_t 
                                   1271 ;    Y      remainder int16_t 
                                   1272 ;----------------------------------
                           000008  1273 	VSIZE=8
      0014BA                       1274 	_argofs VSIZE 
                           00000A     1     ARG_OFS=2+VSIZE 
      0014BA                       1275 	_arg DIVDNDHI 1 
                           00000B     1     DIVDNDHI=ARG_OFS+1 
      0014BA                       1276 	_arg DIVDNDLO 3
                           00000D     1     DIVDNDLO=ARG_OFS+3 
                                   1277 	; local variables
                           000001  1278 	DBLHI=1
                           000003  1279 	DBLLO=3 
                           000005  1280 	SDIVSR=5 ; sign divisor
                           000006  1281 	SQUOT=6 ; sign dividend 
                           000007  1282 	DIVISR=7 ; divisor 
      0014BA                       1283 div32_16:
      0014BA                       1284 	_vars VSIZE 
      0094E5 9E A4            [ 2]    1     sub sp,#VSIZE 
      0094E7 80 2A            [ 1] 1285 	clr (SDIVSR,sp)
      0094E9 04 03            [ 1] 1286 	clr (SQUOT,sp)
                                   1287 ; copy arguments 
      0094EB 01 90            [ 2] 1288 	ldw y,(DIVDNDHI,sp)
      0094ED 50 01            [ 2] 1289 	ldw (DBLHI,sp),y
      0094EE 16 0D            [ 2] 1290 	ldw y,(DIVDNDLO,sp)
      0094EE CD 94            [ 2] 1291 	ldw (DBLLO,sp),y 
                                   1292 ; check for 0 divisor
      0094F0 9E               [ 2] 1293 	tnzw x 
      0094F1 7B 01            [ 1] 1294     jrne 0$
      0094F3 27 03            [ 1] 1295 	ld a,#ERR_DIV0 
      0094F5 CD 95 25         [ 2] 1296 	jp tb_error 
                                   1297 ; check divisor sign 	
      0094F8 9E               [ 1] 1298 0$:	ld a,xh 
      0094F8 5B 01            [ 1] 1299 	and a,#0x80 
      0094FA 81 05            [ 1] 1300 	jreq 1$
      0094FB 03 05            [ 1] 1301 	cpl (SDIVSR,sp)
      0094FB 52 03            [ 1] 1302 	cpl (SQUOT,sp)
      0094FD 1F               [ 2] 1303 	negw x
      0094FE 01 1E            [ 2] 1304 1$:	ldw (DIVISR,sp),x
                                   1305 ; check dividend sign 	 
      009500 08 16            [ 1] 1306  	ld a,(DBLHI,sp) 
      009502 06 90            [ 1] 1307 	and a,#0x80 
      009504 5D 26            [ 1] 1308 	jreq 2$ 
      009506 06 16            [ 1] 1309 	cpl (SQUOT,sp)
      009508 01 65            [ 2] 1310 	ldw x,(DBLLO,sp)
      00950A 5B 03            [ 2] 1311 	ldw y,(DBLHI,sp)
      00950C 81 14 A5         [ 4] 1312 	call dneg 
      00950D 1F 03            [ 2] 1313 	ldw (DBLLO,sp),x 
      00950D 51 A6            [ 2] 1314 	ldw (DBLHI,sp),y 
      00950F 11 6B            [ 2] 1315 2$:	ldw x,(DIVISR,sp)
      009511 03 14 7B         [ 4] 1316 	call udiv32_16
      009512 90 5D            [ 2] 1317 	tnzw y 
      009512 13 01            [ 1] 1318 	jreq 3$ 
                                   1319 ; x=quotient 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



                                   1320 ; y=remainder 
                                   1321 ; if SDIVSR XOR SQUOT increment quotient and remainder.
      009514 2B 03            [ 1] 1322 	ld a,(SQUOT,sp)
      009516 72 F0            [ 1] 1323 	xor a,(SDIVSR,sp)
      009518 01 8C            [ 1] 1324 	jreq 3$
      00951A 90               [ 1] 1325 	incw x 
      00951B 59 59 0A 03      [ 2] 1326 	ldw acc16,y 
      00951F 26 F1            [ 2] 1327 	ldw y,(DIVISR,sp)
      009521 51 5B 03 81      [ 2] 1328 	subw y,acc16
                                   1329 ; sign quotient
      009525 7B 06            [ 1] 1330 3$:	ld a,(SQUOT,sp)
      009525 53 90            [ 1] 1331 	jreq 4$
      009527 53               [ 2] 1332 	negw x 
      00150E                       1333 4$:	
      00150E                       1334 	_drop VSIZE 
      009528 1C 00            [ 2]    1     addw sp,#VSIZE 
      00952A 01               [ 4] 1335 	ret 
                                   1336 
                                   1337 
                                   1338 
                                   1339 ;----------------------------------
                                   1340 ; division x/y 
                                   1341 ; input:
                                   1342 ;    X       dividend
                                   1343 ;    Y       divisor 
                                   1344 ; output:
                                   1345 ;    X       quotient
                                   1346 ;    Y       remainder 
                                   1347 ;-----------------------------------
                           000004  1348 	VSIZE=4 
                                   1349 	; local variables 
                           000001  1350 	DBLHI=1
                           000003  1351 	DBLLO=3
      001511                       1352 divide: 
      001511                       1353 	_vars VSIZE 
      00952B 24 02            [ 2]    1     sub sp,#VSIZE 
      00952D 90 5C 81 0C      [ 2] 1354 	ldw acc16,y
      009530 CD 14 B0         [ 4] 1355 	call dbl_sign_extend
      009530 90 5F            [ 2] 1356 	ldw (DBLLO,sp),x 
      009532 9E A4            [ 2] 1357 	ldw (DBLHI,sp),y 
      009534 80 27 02         [ 2] 1358 	ldw x,acc16 
      009537 90 53 81         [ 4] 1359 	call div32_16 
      00953A                       1360 	_drop VSIZE 
      00953A 52 08            [ 2]    1     addw sp,#VSIZE 
      00953C 0F               [ 4] 1361 	ret
                                   1362 
                                   1363 
                                   1364 ;----------------------------------
                                   1365 ;  remainder resulting from euclidian 
                                   1366 ;  division of x/y 
                                   1367 ; input:
                                   1368 ;   x   	dividend int16_t 
                                   1369 ;   y 		divisor int16_t
                                   1370 ; output:
                                   1371 ;   X       n1%n2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



                                   1372 ;----------------------------------
      001527                       1373 modulo:
      00953D 05 0F 06         [ 4] 1374 	call divide
      009540 16               [ 1] 1375 	ldw x,y 
      009541 0B               [ 4] 1376 	ret 
                                   1377 
                                   1378 ;----------------------------------
                                   1379 ; BASIC: MULDIV(expr1,expr2,expr3)
                                   1380 ; return expr1*expr2/expr3 
                                   1381 ; product result is int32_t and 
                                   1382 ; divisiont is int32_t/int16_t
                                   1383 ;----------------------------------
                           000004  1384 	DBL_SIZE=4 
      00152C                       1385 muldiv:
      009542 17 01 16         [ 4] 1386 	call func_args 
      009545 0D 17            [ 1] 1387 	cp a,#3 
      009547 03 5D            [ 1] 1388 	jreq 1$
      009549 26 05 A6         [ 2] 1389 	jp syntax_error
      001536                       1390 1$: 
      00954C 04 CC            [ 2] 1391 	ldw x,(5,sp) ; expr1
      00954E 91 8E            [ 2] 1392 	ldw y,(3,sp) ; expr2
      009550 9E A4 80         [ 4] 1393 	call multiply 
      009553 27 05            [ 2] 1394 	ldw (5,sp),x  ;int32_t 15..0
      009555 03 05            [ 2] 1395 	ldw (3,sp),y  ;int32_t 31..16
      009557 03               [ 2] 1396 	popw x        ; expr3 
      009558 06 50 1F         [ 4] 1397 	call div32_16 ; int32_t/expr3 
      001545                       1398 	_drop DBL_SIZE
      00955B 07 7B            [ 2]    1     addw sp,#DBL_SIZE 
      00955D 01               [ 4] 1399 	ret 
                                   1400 
                                   1401 
                                   1402 ;---------------------------------
                                   1403 ; dictionary search 
                                   1404 ; input:
                                   1405 ;	X 		dictionary entry point, name field  
                                   1406 ;   y		.asciz name to search 
                                   1407 ; output:
                                   1408 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   1409 ;  X		cmd_index
                                   1410 ;---------------------------------
                           000001  1411 	NLEN=1 ; cmd length 
                           000002  1412 	XSAVE=2
                           000004  1413 	YSAVE=4
                           000005  1414 	VSIZE=5 
      001548                       1415 search_dict::
      001548                       1416 	_vars VSIZE 
      00955E A4 80            [ 2]    1     sub sp,#VSIZE 
                                   1417 
      009560 27 0D            [ 2] 1418 	ldw (YSAVE,sp),y 
      00154C                       1419 search_next:
      009562 03 06            [ 2] 1420 	ldw (XSAVE,sp),x 
                                   1421 ; get name length in dictionary	
      009564 1E               [ 1] 1422 	ld a,(x)
      009565 03 16            [ 1] 1423 	and a,#0xf 
      009567 01 CD            [ 1] 1424 	ld (NLEN,sp),a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      009569 95 25            [ 2] 1425 	ldw y,(YSAVE,sp) ; name pointer 
      00956B 1F               [ 1] 1426 	incw x 
      001556                       1427 cp_loop:
      00956C 03 17            [ 1] 1428 	ld a,(y)
      00956E 01 1E            [ 1] 1429 	jreq str_match 
      009570 07 CD            [ 1] 1430 	tnz (NLEN,sp)
      009572 94 FB            [ 1] 1431 	jreq no_match  
      009574 90               [ 1] 1432 	cp a,(x)
      009575 5D 27            [ 1] 1433 	jrne no_match 
      009577 11 7B            [ 1] 1434 	incw y 
      009579 06               [ 1] 1435 	incw x
      00957A 18 05            [ 1] 1436 	dec (NLEN,sp)
      00957C 27 0B            [ 2] 1437 	jra cp_loop 
      001568                       1438 no_match:
      00957E 5C 90            [ 2] 1439 	ldw x,(XSAVE,sp) 
      009580 CF 00 0D         [ 2] 1440 	subw x,#2 ; move X to link field
      009583 16 07            [ 1] 1441 	push #TK_NONE 
      009585 72               [ 2] 1442 	ldw x,(x) ; next word link 
      009586 B2               [ 1] 1443 	pop a ; TK_NONE 
      009587 00 0D            [ 1] 1444 	jreq search_exit  ; not found  
                                   1445 ;try next 
      009589 7B 06            [ 2] 1446 	jra search_next
      001575                       1447 str_match:
      00958B 27 01            [ 2] 1448 	ldw x,(XSAVE,sp)
      00958D 50               [ 1] 1449 	ld a,(X)
      00958E 6B 01            [ 1] 1450 	ld (NLEN,sp),a ; needed to test keyword type  
      00958E 5B 08            [ 1] 1451 	and a,#0xf 
                                   1452 ; move x to procedure address field 	
      009590 81               [ 1] 1453 	inc a 
      009591 C7 00 0D         [ 1] 1454 	ld acc8,a 
      009591 52 04 90 CF      [ 1] 1455 	clr acc16 
      009595 00 0D CD 95      [ 2] 1456 	addw x,acc16 
      009599 30               [ 2] 1457 	ldw x,(x) ; routine index  
                                   1458 ;determine keyword type bits 7:6 
      00959A 1F 03            [ 1] 1459 	ld a,(NLEN,sp)
      00959C 17               [ 1] 1460 	swap a 
      00959D 01 CE            [ 1] 1461 	and a,#0xc
      00959F 00               [ 1] 1462 	srl a
      0095A0 0D               [ 1] 1463 	srl a 
      0095A1 CD 95            [ 1] 1464 	add a,#128
      001592                       1465 search_exit: 
      001592                       1466 	_drop VSIZE 	 
      0095A3 3A 5B            [ 2]    1     addw sp,#VSIZE 
      0095A5 04               [ 4] 1467 	ret 
                                   1468 
                                   1469 ;---------------------
                                   1470 ; check if next token
                                   1471 ;  is of expected type 
                                   1472 ; input:
                                   1473 ;   A 		 expected token attribute
                                   1474 ;  ouput:
                                   1475 ;   none     if fail call syntax_error 
                                   1476 ;--------------------
      001595                       1477 expect:
      0095A6 81               [ 1] 1478 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      0095A7 CD 11 FB         [ 4] 1479 	call next_token 
      0095A7 CD 95            [ 1] 1480 	cp a,(1,sp)
      0095A9 91 93            [ 1] 1481 	jreq 1$
      0095AB 81 11 0C         [ 2] 1482 	jp syntax_error
      0095AC 84               [ 1] 1483 1$: pop a 
      0095AC CD               [ 4] 1484 	ret 
                                   1485 
                                   1486 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1487 ; parse arguments list 
                                   1488 ; between ()
                                   1489 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015A2                       1490 func_args:
      0095AD 96 22            [ 1] 1491 	ld a,#TK_LPAREN 
      0095AF A1 03 27         [ 4] 1492 	call expect 
                                   1493 ; expected to continue in arg_list 
                                   1494 ; caller must check for TK_RPAREN 
                                   1495 
                                   1496 ;-------------------------------
                                   1497 ; parse embedded BASIC routines 
                                   1498 ; arguments list.
                                   1499 ; arg_list::=  rel[','rel]*
                                   1500 ; all arguments are of integer type
                                   1501 ; and pushed on stack 
                                   1502 ; input:
                                   1503 ;   none
                                   1504 ; output:
                                   1505 ;   stack{n}   arguments pushed on stack
                                   1506 ;   A 	number of arguments pushed on stack  
                                   1507 ;--------------------------------
      0015A7                       1508 arg_list:
      0095B2 03 CC            [ 1] 1509 	push #0  
      0095B4 91 8C EF         [ 4] 1510 1$: call relation
      0095B6 A1 00            [ 1] 1511 	cp a,#TK_NONE 
      0095B6 1E 05            [ 1] 1512 	jreq 5$
      0095B8 16 03            [ 1] 1513 	cp a,#TK_INTGR
      0095BA CD 94            [ 1] 1514 	jrne 4$
      0015B4                       1515 3$: 
                                   1516 ; swap return address with argument
      0095BC D8               [ 1] 1517 	pop a ; arg_count
      0095BD 1F 05            [ 2] 1518 	popw y ; return address 
      0095BF 17               [ 2] 1519 	pushw x ; new argument 
      0095C0 03 85            [ 2] 1520 	pushw y 
      0095C2 CD               [ 1] 1521     inc a
      0095C3 95               [ 1] 1522 	push a 
      0095C4 3A 5B 04         [ 4] 1523 	call next_token 
      0095C7 81 09            [ 1] 1524 	cp a,#TK_COMMA 
      0095C8 27 E6            [ 1] 1525 	jreq 1$ 
      0095C8 52 05            [ 1] 1526 	cp a,#TK_NONE 
      0095CA 17 04            [ 1] 1527 	jreq 5$ 
      0095CC A1 08            [ 1] 1528 4$:	cp a,#TK_RPAREN 
      0095CC 1F 02            [ 1] 1529 	jreq 5$
      0015CB                       1530 	_unget_token 
      0095CE F6 A4 0F 6B 01   [ 1]    1      mov in,in.saved  
      0095D3 16               [ 1] 1531 5$:	pop a  
      0095D4 04               [ 4] 1532 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



                                   1533 
                                   1534 ;--------------------------------
                                   1535 ;   BASIC commnands 
                                   1536 ;--------------------------------
                                   1537 
                                   1538 ;--------------------------------
                                   1539 ;  arithmetic and relational 
                                   1540 ;  routines
                                   1541 ;  operators precedence
                                   1542 ;  highest to lowest
                                   1543 ;  operators on same row have 
                                   1544 ;  same precedence and are executed
                                   1545 ;  from left to right.
                                   1546 ;	'*','/','%'
                                   1547 ;   '-','+'
                                   1548 ;   '=','>','<','>=','<=','<>','><'
                                   1549 ;   '<>' and '><' are equivalent for not equal.
                                   1550 ;--------------------------------
                                   1551 
                                   1552 ;---------------------
                                   1553 ; return array element
                                   1554 ; address from @(expr)
                                   1555 ; input:
                                   1556 ;   A 		TK_ARRAY
                                   1557 ; output:
                                   1558 ;   A 		TK_INTGR
                                   1559 ;	X 		element address 
                                   1560 ;----------------------
      0015D2                       1561 get_array_element:
      0095D5 5C 15 A2         [ 4] 1562 	call func_args 
      0095D6 A1 01            [ 1] 1563 	cp a,#1
      0095D6 90 F6            [ 1] 1564 	jreq 1$
      0095D8 27 1B 0D         [ 2] 1565 	jp syntax_error
      0095DB 01               [ 2] 1566 1$: popw x 
                                   1567 	; check for bounds 
      0095DC 27 0A F1         [ 2] 1568 	cpw x,array_size 
      0095DF 26 07            [ 2] 1569 	jrule 3$
                                   1570 ; bounds {1..array_size}	
      0095E1 90 5C            [ 1] 1571 2$: ld a,#ERR_BAD_VALUE 
      0095E3 5C 0A 01         [ 2] 1572 	jp tb_error 
      0095E6 20               [ 2] 1573 3$: tnzw  x
      0095E7 EE F8            [ 1] 1574 	jreq 2$ 
      0095E8 58               [ 2] 1575 	sllw x 
      0095E8 1E               [ 2] 1576 	pushw x 
      0095E9 02 1D 00         [ 2] 1577 	ldw x,#tib
      0095EC 02 4B 00         [ 2] 1578 	subw x,(1,sp)
      0015F2                       1579 	_drop 2   
      0095EF FE 84            [ 2]    1     addw sp,#2 
      0095F1 27 1F            [ 1] 1580 	ld a,#TK_INTGR
      0095F3 20               [ 4] 1581 	ret 
                                   1582 
                                   1583 
                                   1584 ;***********************************
                                   1585 ;   expression parse,execute 
                                   1586 ;***********************************
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



                                   1587 ;-----------------------------------
                                   1588 ; factor ::= ['+'|'-'|e]  var | @ |
                                   1589 ;			 integer | function |
                                   1590 ;			 '('relation')' 
                                   1591 ; output:
                                   1592 ;   A    token attribute 
                                   1593 ;   X 	 integer
                                   1594 ; ---------------------------------
                           000001  1595 	NEG=1
                           000001  1596 	VSIZE=1
      0015F7                       1597 factor:
      0015F7                       1598 	_vars VSIZE 
      0095F4 D7 01            [ 2]    1     sub sp,#VSIZE 
      0095F5 CD 11 FB         [ 4] 1599 	call next_token
      0095F5 1E 02            [ 1] 1600 	cp a,#CMD_END  
      0095F7 F6 6B            [ 1] 1601 	jrult 16$
      0095F9 01 A4            [ 1] 1602 1$:	ld (NEG,sp),a 
      0095FB 0F 4C            [ 1] 1603 	and a,#TK_GRP_MASK
      0095FD C7 00            [ 1] 1604 	cp a,#TK_GRP_ADD 
      0095FF 0E 72            [ 1] 1605 	jreq 2$
      009601 5F 00            [ 1] 1606 	ld a,(NEG,sp)
      009603 0D 72            [ 2] 1607 	jra 4$  
      00160C                       1608 2$:	
      009605 BB 00 0D         [ 4] 1609 	call next_token 
      00160F                       1610 4$:	
      009608 FE 7B            [ 1] 1611 	cp a,#TK_IFUNC 
      00960A 01 4E            [ 1] 1612 	jrne 5$ 
      00960C A4               [ 4] 1613 	call (x) 
      00960D 0C 44            [ 2] 1614 	jra 18$ 
      001616                       1615 5$:
      00960F 44 AB            [ 1] 1616 	cp a,#TK_INTGR
      009611 80 02            [ 1] 1617 	jrne 6$
      009612 20 2C            [ 2] 1618 	jra 18$
      00161C                       1619 6$:
      009612 5B 05            [ 1] 1620 	cp a,#TK_ARRAY
      009614 81 06            [ 1] 1621 	jrne 10$
      009615 CD 15 D2         [ 4] 1622 	call get_array_element
      009615 88               [ 2] 1623 	ldw x,(x)
      009616 CD 92            [ 2] 1624 	jra 18$ 
      001626                       1625 10$:
      009618 7B 11            [ 1] 1626 	cp a,#TK_VAR 
      00961A 01 27            [ 1] 1627 	jrne 12$
      00961C 03               [ 2] 1628 	ldw x,(x)
      00961D CC 91            [ 2] 1629 	jra 18$
      00162D                       1630 12$:			
      00961F 8C 84            [ 1] 1631 	cp a,#TK_LPAREN
      009621 81 0C            [ 1] 1632 	jrne 16$
      009622 CD 16 EF         [ 4] 1633 	call relation
      009622 A6               [ 2] 1634 	pushw x 
      009623 07 CD            [ 1] 1635 	ld a,#TK_RPAREN 
      009625 96 15 95         [ 4] 1636 	call expect
      009627 85               [ 2] 1637 	popw x 
      009627 4B 00            [ 2] 1638 	jra 18$	
      00163D                       1639 16$:
      009629 CD               [ 1] 1640 	tnz a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00962A 97 6F            [ 1] 1641 	jreq 20$ 
      001640                       1642 	_unget_token
      00962C A1 00 27 20 A1   [ 1]    1      mov in,in.saved  
      009631 84               [ 1] 1643 	clr a 
      009632 26 13            [ 2] 1644 	jra 20$ 
      009634                       1645 18$: 
      009634 84 90            [ 1] 1646 	ld a,#TK_MINUS 
      009636 85 89            [ 1] 1647 	cp a,(NEG,sp)
      009638 90 89            [ 1] 1648 	jrne 19$
      00963A 4C               [ 2] 1649 	negw x
      00164F                       1650 19$:
      00963B 88 CD            [ 1] 1651 	ld a,#TK_INTGR
      001651                       1652 20$:
      001651                       1653 	_drop VSIZE
      00963D 92 7B            [ 2]    1     addw sp,#VSIZE 
      00963F A1               [ 4] 1654 	ret
                                   1655 
                                   1656 ;-----------------------------------
                                   1657 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   1658 ; output:
                                   1659 ;   A    	token attribute 
                                   1660 ;	X		integer
                                   1661 ;-----------------------------------
                           000001  1662 	N1=1   ; int16_t
                           000003  1663 	MULOP=3
                           000003  1664 	VSIZE=3
      001654                       1665 term:
      001654                       1666 	_vars VSIZE
      009640 09 27            [ 2]    1     sub sp,#VSIZE 
      009642 E6 A1 00         [ 4] 1667 	call factor
      009645 27               [ 1] 1668 	tnz a 
      009646 09 A1            [ 1] 1669 	jreq term_exit 
      00165C                       1670 term01:	 ; check for  operator 
      009648 08 27            [ 2] 1671 	ldw (N1,sp),x  ; save first factor 
      00964A 05 55 00         [ 4] 1672 	call next_token
      00964D 03 00            [ 1] 1673 	ld (MULOP,sp),a
      00964F 02 84            [ 1] 1674 	cp a,#CMD_END
      009651 81 2F            [ 1] 1675 	jrult 8$
      009652 A4 30            [ 1] 1676 	and a,#TK_GRP_MASK
      009652 CD 96            [ 1] 1677 	cp a,#TK_GRP_MULT
      009654 22 A1            [ 1] 1678 	jreq 1$
      009656 01 27            [ 2] 1679 	jra 8$
      00166F                       1680 1$:	; got *|/|%
      009658 03 CC 91         [ 4] 1681 	call factor
      00965B 8C 85            [ 1] 1682 	cp a,#TK_INTGR
      00965D C3 00            [ 1] 1683 	jreq 2$
      00965F 1F 23 05         [ 2] 1684 	jp syntax_error
      009662 A6 0A            [ 1] 1685 2$:	ldw y,x 
      009664 CC 91            [ 2] 1686 	ldw x,(N1,sp)
      009666 8E 5D            [ 1] 1687 	ld a,(MULOP,sp) 
      009668 27 F8            [ 1] 1688 	cp a,#TK_MULT 
      00966A 58 89            [ 1] 1689 	jrne 3$
      00966C AE 16 90         [ 4] 1690 	call multiply 
      00966F 72 F0            [ 2] 1691 	jra term01
      009671 01 5B            [ 1] 1692 3$: cp a,#TK_DIV 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      009673 02 A6            [ 1] 1693 	jrne 4$ 
      009675 84 81 11         [ 4] 1694 	call divide 
      009677 20 CB            [ 2] 1695 	jra term01 
      009677 52 01 CD         [ 4] 1696 4$: call modulo
      00967A 92 7B            [ 2] 1697 	jra term01 
      00967C A1 02            [ 1] 1698 8$: ld a,(MULOP,sp)
      00967E 25 3D            [ 1] 1699 	jreq 9$ 
      00169A                       1700 	_unget_token
      009680 6B 01 A4 30 A1   [ 1]    1      mov in,in.saved  
      009685 10 27            [ 2] 1701 9$: ldw x,(N1,sp)
      009687 04 7B            [ 1] 1702 	ld a,#TK_INTGR 	
      0016A3                       1703 term_exit:
      0016A3                       1704 	_drop VSIZE 
      009689 01 20            [ 2]    1     addw sp,#VSIZE 
      00968B 03               [ 4] 1705 	ret 
                                   1706 
                                   1707 ;-------------------------------
                                   1708 ;  expr ::= term [['+'|'-'] term]*
                                   1709 ;  result range {-32768..32767}
                                   1710 ;  output:
                                   1711 ;   A    token attribute 
                                   1712 ;   X	 integer   
                                   1713 ;-------------------------------
                           000001  1714 	N1=1
                           000003  1715 	N2=3 
                           000005  1716 	OP=5 
                           000005  1717 	VSIZE=5 
      00968C                       1718 expression:
      0016A6                       1719 	_vars VSIZE 
      00968C CD 92            [ 2]    1     sub sp,#VSIZE 
      00968E 7B 16 54         [ 4] 1720 	call term
      00968F 4D               [ 1] 1721 	tnz a 
      00968F A1 81            [ 1] 1722 	jreq expr_exit 
      009691 26 03            [ 2] 1723 1$:	ldw (N1,sp),x 
      009693 FD 20 32         [ 4] 1724 	call next_token
      009696 6B 05            [ 1] 1725 	ld (OP,sp),a 
      009696 A1 84            [ 1] 1726 	cp a,#CMD_END 
      009698 26 02            [ 1] 1727 	jrult 8$ 
      00969A 20 2C            [ 1] 1728 	and a,#TK_GRP_MASK
      00969C A1 10            [ 1] 1729 	cp a,#TK_GRP_ADD 
      00969C A1 06            [ 1] 1730 	jreq 2$ 
      00969E 26 06            [ 2] 1731 	jra 8$
      0016C1                       1732 2$: 
      0096A0 CD 96 52         [ 4] 1733 	call term
      0096A3 FE 20            [ 1] 1734 	cp a,#TK_INTGR
      0096A5 22 03            [ 1] 1735 	jreq 3$
      0096A6 CC 11 0C         [ 2] 1736 	jp syntax_error
      0096A6 A1 85            [ 2] 1737 3$:	ldw (N2,sp),x 
      0096A8 26 03            [ 2] 1738 	ldw x,(N1,sp)
      0096AA FE 20            [ 1] 1739 	ld a,(OP,sp)
      0096AC 1B 10            [ 1] 1740 	cp a,#TK_PLUS 
      0096AD 26 05            [ 1] 1741 	jrne 4$
      0096AD A1 07 26         [ 2] 1742 	addw x,(N2,sp)
      0096B0 0C CD            [ 2] 1743 	jra 1$ 
      0096B2 97 6F 89         [ 2] 1744 4$:	subw x,(N2,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      0096B5 A6 08            [ 2] 1745 	jra 1$
      0096B7 CD 96            [ 1] 1746 8$: ld a,(OP,sp)
      0096B9 15 85            [ 1] 1747 	jreq 9$ 
      0016E3                       1748 	_unget_token	
      0096BB 20 0B 02 00 01   [ 1]    1      mov in,in.saved  
      0096BD 1E 01            [ 2] 1749 9$: ldw x,(N1,sp)
      0096BD 4D 27            [ 1] 1750 	ld a,#TK_INTGR	
      0016EC                       1751 expr_exit:
      0016EC                       1752 	_drop VSIZE 
      0096BF 11 55            [ 2]    1     addw sp,#VSIZE 
      0096C1 00               [ 4] 1753 	ret 
                                   1754 
                                   1755 ;---------------------------------------------
                                   1756 ; rel ::= expr rel_op expr
                                   1757 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   1758 ;  relation return  integer , zero is false 
                                   1759 ;  output:
                                   1760 ;    A 		token attribute  
                                   1761 ;	 X		integer 
                                   1762 ;---------------------------------------------
                           000001  1763 	N1=1
                           000003  1764 	RELOP=3
                           000003  1765 	VSIZE=3 
      0016EF                       1766 relation: 
      0016EF                       1767 	_vars VSIZE
      0096C2 03 00            [ 2]    1     sub sp,#VSIZE 
      0096C4 02 4F 20         [ 4] 1768 	call expression
      0096C7 09               [ 1] 1769 	tnz a 
      0096C8 27 4D            [ 1] 1770 	jreq rel_exit
      0096C8 A6 11            [ 2] 1771 	ldw (N1,sp),x 
                                   1772 ; expect rel_op or leave 
      0096CA 11 01 26         [ 4] 1773 	call next_token 
      0096CD 01 50            [ 1] 1774 	ld (RELOP,sp),a 
      0096CF A4 30            [ 1] 1775 	and a,#TK_GRP_MASK
      0096CF A6 84            [ 1] 1776 	cp a,#TK_GRP_RELOP 
      0096D1 26 33            [ 1] 1777 	jrne 8$
      001704                       1778 2$:	; expect another expression
      0096D1 5B 01 81         [ 4] 1779 	call expression
      0096D4 A1 84            [ 1] 1780 	cp a,#TK_INTGR
      0096D4 52 03            [ 1] 1781 	jreq 3$
      0096D6 CD 96 77         [ 2] 1782 	jp syntax_error 
      0096D9 4D 27 47         [ 2] 1783 3$:	ldw acc16,x 
      0096DC 1E 01            [ 2] 1784 	ldw x,(N1,sp) 
      0096DC 1F 01 CD 92      [ 2] 1785 	subw x,acc16
      0096E0 7B 6B            [ 1] 1786 	jrne 4$
      0096E2 03 A1 02 25      [ 1] 1787 	mov acc8,#2 ; n1==n2
      0096E6 2F A4            [ 2] 1788 	jra 6$ 
      00171F                       1789 4$: 
      0096E8 30 A1            [ 1] 1790 	jrsgt 5$  
      0096EA 20 27 02 20      [ 1] 1791 	mov acc8,#4 ; n1<2 
      0096EE 27 04            [ 2] 1792 	jra 6$
      0096EF                       1793 5$:
      0096EF CD 96 77 A1      [ 1] 1794 	mov acc8,#1 ; n1>n2 
      00172B                       1795 6$:
      0096F3 84               [ 1] 1796 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      0096F4 27 03 CC         [ 1] 1797 	ld a, acc8  
      0096F7 91 8C            [ 1] 1798 	and a,(RELOP,sp)
      0096F9 90               [ 1] 1799 	tnz a 
      0096FA 93 1E            [ 1] 1800 	jreq 10$
      0096FC 01               [ 1] 1801 	incw x 
      0096FD 7B 03            [ 2] 1802 	jra 10$  	
      0096FF A1 20            [ 1] 1803 8$: ld a,(RELOP,sp)
      009701 26 05            [ 1] 1804 	jreq 9$
      00173B                       1805 	_unget_token
      009703 CD 94 D8 20 D4   [ 1]    1      mov in,in.saved  
      001740                       1806 9$: 
      009708 A1 21            [ 2] 1807 	ldw x,(N1,sp)
      001742                       1808 10$:
      00970A 26 05            [ 1] 1809 	ld a,#TK_INTGR
      001744                       1810 rel_exit:
      001744                       1811 	_drop VSIZE
      00970C CD 95            [ 2]    1     addw sp,#VSIZE 
      00970E 91               [ 4] 1812 	ret 
                                   1813 
                                   1814 ;--------------------------------
                                   1815 ; BASIC: SHOW 
                                   1816 ; print stack content in hexadecimal bytes 
                                   1817 ; 16 bytes per row 
                                   1818 ;--------------------------------
      001747                       1819 show:
      00970F 20 CB CD         [ 2] 1820 	ldw x,#cstk_prompt
      009712 95 A7 20         [ 4] 1821 	call puts 
      009715 C6               [ 1] 1822 	ldw x,sp 
      009716 7B 03 27         [ 2] 1823 	addw x,#3 ; ignore return address
      009719 05 55 00 03      [ 2] 1824 	ldw y,#RAM_SIZE  
      00971D 00 02 1E         [ 2] 1825 	ldw acc16,x 
      009720 01 A6 84 0C      [ 2] 1826 	subw y,acc16
      009723 CD 0D 25         [ 4] 1827 	call hex_dump
      009723 5B               [ 1] 1828 	clr a 
      009724 03               [ 4] 1829 	ret
                                   1830 
      009725 81 63 6F 6E 74 65 6E  1831 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             74 20 6F 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   1832 
                                   1833 
                                   1834 ;--------------------------------------------
                                   1835 ; BASIC: HEX 
                                   1836 ; select hexadecimal base for integer print
                                   1837 ;---------------------------------------------
      009726                       1838 hex_base:
      009726 52 05 CD 96      [ 1] 1839 	mov base,#16 
      00972A D4               [ 4] 1840 	ret 
                                   1841 
                                   1842 ;--------------------------------------------
                                   1843 ; BASIC: DEC 
                                   1844 ; select decimal base for integer print
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



                                   1845 ;---------------------------------------------
      00178D                       1846 dec_base:
      00972B 4D 27 3E 1F      [ 1] 1847 	mov base,#10
      00972F 01               [ 4] 1848 	ret 
                                   1849 
                                   1850 ;------------------------
                                   1851 ; BASIC: FREE 
                                   1852 ; return free size in RAM 
                                   1853 ; output:
                                   1854 ;   A 		TK_INTGR
                                   1855 ;   X 	    size integer
                                   1856 ;--------------------------
      001792                       1857 free:
      009730 CD 92 7B         [ 2] 1858 	ldw x,#tib 
      009733 6B 05 A1 02      [ 2] 1859 	ldw y,txtbgn 
      009737 25 26 A4 30      [ 2] 1860 	cpw y,#app_space
      00973B A1 10            [ 1] 1861 	jrult 1$
      00973D 27 02 20         [ 2] 1862 	subw x,#free_ram 
      009740 1E 04            [ 2] 1863 	jra 2$ 
      009741                       1864 1$:	
      009741 CD 96 D4 A1      [ 2] 1865 	subw x,txtend 
      009745 84 27            [ 1] 1866 2$:	ld a,#TK_INTGR
      009747 03               [ 4] 1867 	ret 
                                   1868 
                                   1869 ;------------------------------
                                   1870 ; BASIC: SIZE 
                                   1871 ; command that print 
                                   1872 ; program start addres and size 
                                   1873 ;------------------------------
      0017AB                       1874 cmd_size:
      009748 CC 91 8C         [ 1] 1875 	push base 
      00974B 1F 03 1E         [ 2] 1876 	ldw x,#PROG_ADDR 
      00974E 01 7B 05         [ 4] 1877 	call puts 
      009751 A1 10 26         [ 2] 1878 	ldw x,txtbgn     
      009754 05 72 FB 03      [ 1] 1879 	mov base,#16 
      009758 20 D4 72         [ 4] 1880 	call print_int
      00975B F0 03 20         [ 1] 1881 	pop base 
      00975E CF 7B 05         [ 2] 1882 	ldw x,#PROG_SIZE 
      009761 27 05 55         [ 4] 1883 	call puts 
      009764 00 03 00         [ 2] 1884 	ldw x,txtend 
      009767 02 1E 01 A6      [ 2] 1885 	subw x,txtbgn 
      00976B 84 12 49         [ 4] 1886 	call print_int
      00976C AE 17 F9         [ 2] 1887 	ldw x,#STR_BYTES 
      00976C 5B 05 81         [ 4] 1888 	call puts  
      00976F 81               [ 4] 1889 	ret 
                                   1890 
      00976F 52 03 CD 97 26 4D 27  1891 PROG_ADDR: .asciz "program address: "
             4D 1F 01 CD 92 7B 6B
             03 A4 30 A1
      009781 30 26 33 67 72 61 6D  1892 PROG_SIZE: .asciz "program size: "
             20 73 69 7A 65 3A 20
             00
      009784 62 79 74 65 73 0A 00  1893 STR_BYTES: .asciz "bytes\n" 
                                   1894 
                                   1895 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



                                   1896 ; BASIC: UBOUND  
                                   1897 ; return array variable size 
                                   1898 ; output:
                                   1899 ;   A 		TK_INTGR
                                   1900 ;   X 	    array size 
                                   1901 ;--------------------------
      001800                       1902 ubound:
      009784 CD 97 26         [ 4] 1903 	call free 
      009787 A1               [ 2] 1904 	srlw x 
      009788 84 27 03         [ 2] 1905 	ldw array_size,x
      00978B CC 91            [ 1] 1906 	ld a,#TK_INTGR
      00978D 8C               [ 4] 1907 	ret 
                                   1908 
                                   1909 ;-----------------------------
                                   1910 ; BASIC: LET var=expr 
                                   1911 ; variable assignement 
                                   1912 ; output:
                                   1913 ;   A 		TK_NONE 
                                   1914 ;-----------------------------
      00180A                       1915 let::
      00978E CF 00 0D         [ 4] 1916 	call next_token 
      009791 1E 01            [ 1] 1917 	cp a,#TK_VAR 
      009793 72 B0            [ 1] 1918 	jreq let_var
      009795 00 0D            [ 1] 1919 	cp a,#TK_ARRAY 
      009797 26 06            [ 1] 1920 	jreq  let_array
      009799 35 02 00         [ 2] 1921 	jp syntax_error
      001818                       1922 let_array:
      00979C 0E 20 0C         [ 4] 1923 	call get_array_element
      00979F                       1924 let_var:
      00979F 2C               [ 2] 1925 	pushw x  
      0097A0 06 35 04         [ 4] 1926 	call next_token 
      0097A3 00 0E            [ 1] 1927 	cp a,#TK_EQUAL
      0097A5 20 04            [ 1] 1928 	jreq 1$
      0097A7 CC 11 0C         [ 2] 1929 	jp syntax_error
      001826                       1930 1$:	
      0097A7 35 01 00         [ 4] 1931 	call relation   
      0097AA 0E 84            [ 1] 1932 	cp a,#TK_INTGR 
      0097AB 27 03            [ 1] 1933 	jreq 2$
      0097AB 5F C6 00         [ 2] 1934 	jp syntax_error
      001830                       1935 2$:	
      0097AE 0E 14            [ 1] 1936 	ldw y,x 
      0097B0 03               [ 2] 1937 	popw x   
      0097B1 4D               [ 2] 1938 	ldw (x),y   
      0097B2 27               [ 4] 1939 	ret 
                                   1940 
                                   1941 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1942 ; return program size 
                                   1943 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001835                       1944 prog_size:
      0097B3 0E 5C 20         [ 2] 1945 	ldw x,txtend 
      0097B6 0B 7B 03 27      [ 2] 1946 	subw x,txtbgn 
      0097BA 05               [ 4] 1947 	ret 
                                   1948 
                                   1949 ;----------------------------
                                   1950 ; BASIC: LIST [[start][,end]]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



                                   1951 ; list program lines 
                                   1952 ; form start to end 
                                   1953 ; if empty argument list then 
                                   1954 ; list all.
                                   1955 ;----------------------------
                           000001  1956 	FIRST=1
                           000003  1957 	LAST=3 
                           000005  1958 	LN_PTR=5
                           000006  1959 	VSIZE=6 
      00183D                       1960 list:
      0097BB 55 00 03         [ 2] 1961 	ldw x,txtbgn 
      0097BE 00 02 1B         [ 2] 1962 	cpw x,txtend 
      0097C0 2B 01            [ 1] 1963 	jrmi 1$
      0097C0 1E               [ 4] 1964 	ret 
      001846                       1965 1$:	
      0097C1 01 17 EA         [ 2] 1966 	ldw x,#PROG_SIZE
      0097C2 CD 03 1E         [ 4] 1967 	call puts 
      0097C2 A6 84 1B         [ 2] 1968 	ldw x,txtend 
      0097C4 72 B0 00 19      [ 2] 1969 	subw x,txtbgn 
      0097C4 5B 03 81         [ 4] 1970 	call print_int 
      0097C7 AE 17 F9         [ 2] 1971 	ldw x,#STR_BYTES 
      0097C7 AE 97 E1         [ 4] 1972 	call puts 
      00185C                       1973 	_vars VSIZE
      0097CA CD 83            [ 2]    1     sub sp,#VSIZE 
      0097CC 9E 96 1C         [ 2] 1974 	ldw x,txtbgn 
      0097CF 00 03            [ 2] 1975 	ldw (LN_PTR,sp),x 
      0097D1 90               [ 2] 1976 	ldw x,(x) 
      0097D2 AE 18            [ 2] 1977 	ldw (FIRST,sp),x ; list from first line 
      0097D4 00 CF 00         [ 2] 1978 	ldw x,#MAX_LINENO ; biggest line number 
      0097D7 0D 72            [ 2] 1979 	ldw (LAST,sp),x 
      0097D9 B2 00 0D         [ 4] 1980 	call arg_list
      0097DC CD               [ 1] 1981 	tnz a
      0097DD 8D A5            [ 1] 1982 	jreq list_loop 
      0097DF 4F 81            [ 1] 1983 	cp a,#2 
      0097E1 0A 63            [ 1] 1984 	jreq 4$
      0097E3 6F 6E            [ 1] 1985 	cp a,#1 
      0097E5 74 65            [ 1] 1986 	jreq first_line 
      0097E7 6E 74 20         [ 2] 1987 	jp syntax_error 
      0097EA 6F               [ 2] 1988 4$:	popw x 
      0097EB 66 20            [ 2] 1989 	ldw (LAST+2,sp),x 
      00187F                       1990 first_line:
      0097ED 73               [ 2] 1991 	popw x
      0097EE 74 61            [ 2] 1992 	ldw (FIRST,sp),x 
      001882                       1993 lines_skip:
      0097F0 63 6B 20         [ 2] 1994 	ldw x,txtbgn
      0097F3 66 72            [ 2] 1995 2$:	ldw (LN_PTR,sp),x 
      0097F5 6F 6D 20         [ 2] 1996 	cpw x,txtend 
      0097F8 74 6F            [ 1] 1997 	jrpl list_exit 
      0097FA 70               [ 2] 1998 	ldw x,(x) ;line# 
      0097FB 20 74            [ 2] 1999 	cpw x,(FIRST,sp)
      0097FD 6F 20            [ 1] 2000 	jrpl list_loop 
      0097FF 62 6F            [ 2] 2001 	ldw x,(LN_PTR,sp) 
      009801 74 74            [ 1] 2002 	ld a,(2,x)
      009803 6F 6D 3A         [ 1] 2003 	ld acc8,a 
      009806 0A 00 00 0C      [ 1] 2004 	clr acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      009808 72 BB 00 0C      [ 2] 2005 	addw x,acc16
      009808 35 10            [ 2] 2006 	jra 2$ 
                                   2007 ; print loop
      0018A2                       2008 list_loop:
      00980A 00 0B            [ 2] 2009 	ldw x,(LN_PTR,sp)
      00980C 81 02            [ 1] 2010 	ld a,(2,x) 
      00980D CD 19 16         [ 4] 2011 	call prt_basic_line
      00980D 35 0A            [ 2] 2012 	ldw x,(LN_PTR,sp)
      00980F 00 0B            [ 1] 2013 	ld a,(2,x)
      009811 81 00 0D         [ 1] 2014 	ld acc8,a 
      009812 72 5F 00 0C      [ 1] 2015 	clr acc16 
      009812 AE 16 90 90      [ 2] 2016 	addw x,acc16
      009816 CE 00 1A         [ 2] 2017 	cpw x,txtend 
      009819 90 A3            [ 1] 2018 	jrpl list_exit
      00981B AA 80            [ 2] 2019 	ldw (LN_PTR,sp),x
      00981D 25               [ 2] 2020 	ldw x,(x)
      00981E 05 1D            [ 2] 2021 	cpw x,(LAST,sp)  
      009820 00 80            [ 1] 2022 	jrslt list_loop
      0018C4                       2023 list_exit:
      009822 20 04 03 00 01   [ 1] 2024 	mov in,count 
      009824 AE 16 E0         [ 2] 2025 	ldw x,#pad 
      009824 72 B0 00         [ 2] 2026 	ldw basicptr,x 
      0018CF                       2027 	_drop VSIZE 
      009827 1C A6            [ 2]    1     addw sp,#VSIZE 
      009829 84               [ 4] 2028 	ret
                                   2029 
                                   2030 
                                   2031 ;--------------------------
                                   2032 ; BASIC: EDIT \E | \F
                                   2033 ;  copy program in FLASH 
                                   2034 ;  to RAM for edition 
                                   2035 ;-------------------------
      0018D2                       2036 edit:
      00982A 81 1E A6         [ 4] 2037 	call qsign 
      00982B 27 07            [ 1] 2038 	jreq 1$ 
      00982B 3B 00 0B         [ 2] 2039 	ldw x,#NOT_SAVED 
      00982E AE 98 58         [ 4] 2040 	call puts 
      009831 CD               [ 4] 2041 	ret 
      0018DE                       2042 1$: 
      009832 83 9E CE 00      [ 2] 2043 	ldw y,#app_sign ; source address 
      009836 1A 35 10         [ 2] 2044     ldw x,app_size  
      009839 00 0B CD         [ 2] 2045 	addw x,#4 
      00983C 92 C9 32         [ 2] 2046 	ldw acc16,x  ; bytes to copy 
      00983F 00 0B AE         [ 2] 2047 	ldw x,#rsign ; destination address 
      009842 98 6A CD         [ 4] 2048 	call move  
      009845 83 9E CE         [ 2] 2049 	ldw x,#free_ram 
      009848 00 1C 72         [ 2] 2050 	ldw txtbgn,x 
      00984B B0 00 1A CD      [ 2] 2051 	addw x,rsize  
      00984F 92 C9 AE         [ 2] 2052 	ldw txtend,x 
      009852 98               [ 4] 2053 	ret 
                                   2054 
      009853 79 CD 83 9E 81 70 72  2055 NOT_SAVED: .asciz "No application saved.\n"
             6F 67 72 61 6D 20 61
             64 64 72 65 73 73 3A
             20 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



                                   2056 
                                   2057 ;--------------------------
                                   2058 ; decompile line from token list
                                   2059 ; and print it. 
                                   2060 ; input:
                                   2061 ;   A       stop at this position 
                                   2062 ;   X 		pointer at line
                                   2063 ; output:
                                   2064 ;   none 
                                   2065 ;--------------------------	
      001916                       2066 prt_basic_line:
      00986A 70 72 6F         [ 1] 2067 	ld count,a 
      00986D 67 72            [ 1] 2068 	ld a,(2,x)
      00986F 61 6D 20         [ 1] 2069 	cp a,count 
      009872 73 69            [ 1] 2070 	jrpl 1$ 
      009874 7A 65 3A         [ 1] 2071 	ld count,a 
      009877 20 00 62         [ 2] 2072 1$:	ldw basicptr,x 
      00987A 79 74 65 73      [ 2] 2073 	ldw y,#tib  
      00987E 0A 00 17         [ 4] 2074 	call decompile 
      009880 CD 03 1E         [ 4] 2075 	call puts 
      009880 CD 98            [ 1] 2076 	ld a,#CR 
      009882 12 54 CF         [ 4] 2077 	call putc 
      009885 00               [ 4] 2078 	ret 
                                   2079 
                                   2080 
                                   2081 
                                   2082 ;---------------------------------
                                   2083 ; BASIC: PRINT|? arg_list 
                                   2084 ; print values from argument list
                                   2085 ;----------------------------------
                           000001  2086 	CCOMMA=1
                           000001  2087 	VSIZE=1
      001936                       2088 print:
      001936                       2089 	_vars VSIZE 
      009886 1F A6            [ 2]    1     sub sp,#VSIZE 
      001938                       2090 reset_comma:
      009888 84 81            [ 1] 2091 	clr (CCOMMA,sp)
      00988A                       2092 prt_loop:
      00988A CD 92 7B         [ 4] 2093 	call next_token
      00988D A1 85            [ 1] 2094 	cp a,#CMD_END 
      00988F 27 0A            [ 1] 2095 	jrult print_exit ; colon or end of line 
      009891 A1 06            [ 1] 2096 	cp a,#TK_QSTR
      009893 27 03            [ 1] 2097 	jreq 1$
      009895 CC 91            [ 1] 2098 	cp a,#TK_CHAR 
      009897 8C 13            [ 1] 2099 	jreq 2$ 
      009898 A1 82            [ 1] 2100 	cp a,#TK_CFUNC 
      009898 CD 96            [ 1] 2101 	jreq 3$
      00989A 52 09            [ 1] 2102 	cp a,#TK_COMMA 
      00989B 27 18            [ 1] 2103 	jreq 4$
      00989B 89 CD            [ 1] 2104 	cp a,#TK_SHARP 
      00989D 92 7B            [ 1] 2105 	jreq 5$
      00989F A1 32            [ 2] 2106 	jra 7$ 
      001957                       2107 1$:	; print string 
      0098A1 27 03 CC         [ 4] 2108 	call puts
      0098A4 91 8C            [ 2] 2109 	jra reset_comma
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      0098A6                       2110 2$:	; print character 
      0098A6 CD               [ 1] 2111 	ld a,xl 
      0098A7 97 6F A1         [ 4] 2112 	call putc 
      0098AA 84 27            [ 2] 2113 	jra reset_comma 
      001962                       2114 3$: ; print character function value  	
      0098AC 03               [ 4] 2115 	call (x)
      0098AD CC               [ 1] 2116 	ld a,xl 
      0098AE 91 8C C1         [ 4] 2117 	call putc
      0098B0 20 CF            [ 2] 2118 	jra reset_comma 
      001969                       2119 4$: ; set comma state 
      0098B0 90 93            [ 1] 2120 	cpl (CCOMMA,sp)
      0098B2 85 FF            [ 2] 2121 	jra prt_loop   
      00196D                       2122 5$: ; # character must be followed by an integer   
      0098B4 81 11 FB         [ 4] 2123 	call next_token
      0098B5 A1 84            [ 1] 2124 	cp a,#TK_INTGR 
      0098B5 CE 00            [ 1] 2125 	jreq 6$
      0098B7 1C 72 B0         [ 2] 2126 	jp syntax_error 
      001977                       2127 6$: ; set tab width
      0098BA 00               [ 1] 2128 	ld a,xl 
      0098BB 1A 81            [ 1] 2129 	and a,#15 
      0098BD C7 00 21         [ 1] 2130 	ld tab_width,a 
      0098BD CE 00            [ 2] 2131 	jra reset_comma 
      00197F                       2132 7$:	
      00197F                       2133 	_unget_token 
      0098BF 1A C3 00 1C 2B   [ 1]    1      mov in,in.saved  
      0098C4 01 81 EF         [ 4] 2134 	call relation 
      0098C6 A1 84            [ 1] 2135 	cp a,#TK_INTGR 
      0098C6 AE 98            [ 1] 2136 	jrne print_exit 
      0098C8 6A CD 83         [ 4] 2137     call print_int 
      0098CB 9E CE            [ 2] 2138 	jra reset_comma 
      001990                       2139 print_exit:
      0098CD 00 1C            [ 1] 2140 	tnz (CCOMMA,sp)
      0098CF 72 B0            [ 1] 2141 	jrne 9$
      0098D1 00 1A            [ 1] 2142 	ld a,#CR 
      0098D3 CD 92 C9         [ 4] 2143     call putc 
      001999                       2144 9$:	_drop VSIZE 
      0098D6 AE 98            [ 2]    1     addw sp,#VSIZE 
      0098D8 79               [ 4] 2145 	ret 
                                   2146 
                                   2147 ;----------------------
                                   2148 ; 'save_context' and
                                   2149 ; 'rest_context' must be 
                                   2150 ; called at the same 
                                   2151 ; call stack depth 
                                   2152 ; i.e. SP must have the 
                                   2153 ; save value at  
                                   2154 ; entry point of both 
                                   2155 ; routine. 
                                   2156 ;---------------------
                           000004  2157 	CTXT_SIZE=4 ; size of saved data 
                                   2158 ;--------------------
                                   2159 ; save current BASIC
                                   2160 ; interpreter context 
                                   2161 ; on stack 
                                   2162 ;--------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      00199C                       2163 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00199C                       2164 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      00199C                       2165 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      00199C                       2166 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      00199C                       2167 save_context:
      0098D9 CD 83 9E         [ 2] 2168 	ldw x,basicptr 
      0098DC 52 06            [ 2] 2169 	ldw (BPTR,sp),x
      0098DE CE 00 1A         [ 1] 2170 	ld a,in 
      0098E1 1F 05            [ 1] 2171 	ld (IN,sp),a
      0098E3 FE 1F 01         [ 1] 2172 	ld a,count 
      0098E6 AE 7F            [ 1] 2173 	ld (CNT,sp),a  
      0098E8 FF               [ 4] 2174 	ret
                                   2175 
                                   2176 ;-----------------------
                                   2177 ; restore previously saved 
                                   2178 ; BASIC interpreter context 
                                   2179 ; from stack 
                                   2180 ;-------------------------
      0019AC                       2181 rest_context:
      0098E9 1F 03            [ 2] 2182 	ldw x,(BPTR,sp)
      0098EB CD 96 27         [ 2] 2183 	ldw basicptr,x 
      0098EE 4D 27            [ 1] 2184 	ld a,(IN,sp)
      0098F0 31 A1 02         [ 1] 2185 	ld in,a
      0098F3 27 07            [ 1] 2186 	ld a,(CNT,sp)
      0098F5 A1 01 27         [ 1] 2187 	ld count,a  
      0098F8 06               [ 4] 2188 	ret
                                   2189 
                                   2190 
                                   2191 
                                   2192 ;------------------------------------------
                                   2193 ; BASIC: INPUT [string]var[,[string]var]
                                   2194 ; input value in variables 
                                   2195 ; [string] optionally can be used as prompt 
                                   2196 ;-----------------------------------------
                           000001  2197 	CX_BPTR=1
                           000003  2198 	CX_IN=3
                           000004  2199 	CX_CNT=4
                           000005  2200 	SKIP=5
                           000006  2201 	VAR_ADDR=6
                           000007  2202 	VSIZE=7
      0019BC                       2203 input_var:
      0019BC                       2204 	_vars VSIZE 
      0098F9 CC 91            [ 2]    1     sub sp,#VSIZE 
      0019BE                       2205 input_loop:
      0098FB 8C 85            [ 1] 2206 	clr (SKIP,sp)
      0098FD 1F 05 FB         [ 4] 2207 	call next_token 
      0098FF A1 02            [ 1] 2208 	cp a,#TK_QSTR 
      0098FF 85 1F            [ 1] 2209 	jrne 1$ 
      009901 01 03 1E         [ 4] 2210 	call puts 
      009902 03 05            [ 1] 2211 	cpl (SKIP,sp)
      009902 CE 00 1A         [ 4] 2212 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      009905 1F 05            [ 1] 2213 1$: cp a,#TK_VAR  
      009907 C3 00            [ 1] 2214 	jreq 2$ 
      009909 1C 2A 38         [ 2] 2215 	jp syntax_error
      00990C FE 13            [ 2] 2216 2$:	ldw (VAR_ADDR,sp),x 
      00990E 01 2A            [ 1] 2217 	tnz (SKIP,sp)
      009910 11 1E            [ 1] 2218 	jrne 21$ 
      009912 05 E6 02         [ 4] 2219 	call var_name 
      009915 C7 00 0E         [ 4] 2220 	call putc   
      0019E2                       2221 21$:
      009918 72 5F            [ 1] 2222 	ld a,#':
      00991A 00 0D 72         [ 4] 2223 	call putc 
      00991D BB 00 0D         [ 4] 2224 	call save_context 
      009920 20 E3 00 03      [ 1] 2225 	clr count  
      009922 CD 04 23         [ 4] 2226 	call readln 
      009922 1E 05 E6         [ 2] 2227 	ldw x,#tib 
      009925 02 CD 99         [ 1] 2228 	push count
      009928 96 1E            [ 1] 2229 	push #0 
      00992A 05 E6 02         [ 2] 2230 	addw x,(1,sp)
      00992D C7               [ 1] 2231 	incw x 
      0019FD                       2232 	_drop 2 
      00992E 00 0E            [ 2]    1     addw sp,#2 
      009930 72 5F 00 0D      [ 1] 2233 	clr in 
      009934 72 BB 00         [ 4] 2234 	call get_token
      009937 0D C3            [ 1] 2235 	cp a,#TK_INTGR
      009939 00 1C            [ 1] 2236 	jreq 3$ 
      00993B 2A 07 1F         [ 4] 2237 	call rest_context 
      00993E 05 FE 13         [ 2] 2238 	jp syntax_error
      009941 03 2F            [ 2] 2239 3$: ldw y,(VAR_ADDR,sp) 
      009943 DE FF            [ 2] 2240 	ldw (y),x 
      009944 CD 19 AC         [ 4] 2241 	call rest_context
      009944 55 00 04         [ 4] 2242 	call next_token 
      009947 00 02            [ 1] 2243 	cp a,#TK_COMMA 
      009949 AE 16            [ 1] 2244 	jreq input_loop
      00994B E0 CF            [ 1] 2245 	cp a,#TK_NONE 
      00994D 00 05            [ 1] 2246 	jreq input_exit  
      00994F 5B 06            [ 1] 2247 	cp a,#TK_COLON 
      009951 81 03            [ 1] 2248     jreq input_exit 
      009952 CC 11 0C         [ 2] 2249 	jp syntax_error 
      001A29                       2250 input_exit:
      001A29                       2251 	_drop VSIZE 
      009952 CD 9F            [ 2]    1     addw sp,#VSIZE 
      009954 26               [ 4] 2252 	ret 
                                   2253 
                                   2254 
                                   2255 ;---------------------
                                   2256 ; BASIC: REMARK | ' 
                                   2257 ; skip comment to end of line 
                                   2258 ;---------------------- 
      001A2C                       2259 remark::
      009955 27 07 AE 99 7F   [ 1] 2260 	mov in,count 
      00995A CD               [ 4] 2261  	ret 
                                   2262 
                                   2263 
                                   2264 ;---------------------
                                   2265 ; BASIC: WAIT addr,mask[,xor_mask] 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



                                   2266 ; read in loop 'addr'  
                                   2267 ; apply & 'mask' to value 
                                   2268 ; loop while result==0.  
                                   2269 ; 'xor_mask' is used to 
                                   2270 ; invert the wait logic.
                                   2271 ; i.e. loop while not 0.
                                   2272 ;---------------------
                           000001  2273 	XMASK=1 
                           000002  2274 	MASK=2
                           000003  2275 	ADDR=3
                           000004  2276 	VSIZE=4
      001A32                       2277 wait: 
      001A32                       2278 	_vars VSIZE
      00995B 83 9E            [ 2]    1     sub sp,#VSIZE 
      00995D 81 01            [ 1] 2279 	clr (XMASK,sp) 
      00995E CD 15 A7         [ 4] 2280 	call arg_list 
      00995E 90 AE            [ 1] 2281 	cp a,#2
      009960 AA 80            [ 1] 2282 	jruge 0$
      009962 CE AA 82         [ 2] 2283 	jp syntax_error 
      009965 1C 00            [ 1] 2284 0$:	cp a,#3
      009967 04 CF            [ 1] 2285 	jrult 1$
      009969 00               [ 2] 2286 	popw x 
      00996A 0D               [ 1] 2287 	ld a,xl
      00996B AE 00            [ 1] 2288 	ld (XMASK,sp),a 
      00996D 7C               [ 2] 2289 1$: popw x ; mask 
      00996E CD               [ 1] 2290 	ld a,xl 
      00996F 8E 10            [ 1] 2291 	ld (MASK,sp),a 
      009971 AE               [ 2] 2292 	popw x ; address 
      009972 00               [ 1] 2293 2$:	ld a,(x)
      009973 80 CF            [ 1] 2294 	and a,(MASK,sp)
      009975 00 1A            [ 1] 2295 	xor a,(XMASK,sp)
      009977 72 BB            [ 1] 2296 	jreq 2$ 
      001A54                       2297 	_drop VSIZE 
      009979 00 7E            [ 2]    1     addw sp,#VSIZE 
      00997B CF               [ 4] 2298 	ret 
                                   2299 
                                   2300 ;---------------------
                                   2301 ; BASIC: BSET addr,mask
                                   2302 ; set bits at 'addr' corresponding 
                                   2303 ; to those of 'mask' that are at 1.
                                   2304 ; arguments:
                                   2305 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2306 ;   mask        mask|addr
                                   2307 ; output:
                                   2308 ;	none 
                                   2309 ;--------------------------
      001A57                       2310 bit_set:
      00997C 00 1C 81         [ 4] 2311 	call arg_list 
      00997F 4E 6F            [ 1] 2312 	cp a,#2	 
      009981 20 61            [ 1] 2313 	jreq 1$ 
      009983 70 70 6C         [ 2] 2314 	jp syntax_error
      001A61                       2315 1$: 
      009986 69               [ 2] 2316 	popw x ; mask 
      009987 63               [ 1] 2317 	ld a,xl 
      009988 61               [ 2] 2318 	popw x ; addr  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      009989 74               [ 1] 2319 	or a,(x)
      00998A 69               [ 1] 2320 	ld (x),a
      00998B 6F               [ 4] 2321 	ret 
                                   2322 
                                   2323 ;---------------------
                                   2324 ; BASIC: BRES addr,mask
                                   2325 ; reset bits at 'addr' corresponding 
                                   2326 ; to those of 'mask' that are at 1.
                                   2327 ; arguments:
                                   2328 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2329 ;   mask	    ~mask&*addr  
                                   2330 ; output:
                                   2331 ;	none 
                                   2332 ;--------------------------
      001A67                       2333 bit_reset:
      00998C 6E 20 73         [ 4] 2334 	call arg_list 
      00998F 61 76            [ 1] 2335 	cp a,#2  
      009991 65 64            [ 1] 2336 	jreq 1$ 
      009993 2E 0A 00         [ 2] 2337 	jp syntax_error
      009996                       2338 1$: 
      009996 C7               [ 2] 2339 	popw x ; mask 
      009997 00               [ 1] 2340 	ld a,xl 
      009998 04               [ 1] 2341 	cpl a 
      009999 E6               [ 2] 2342 	popw x ; addr  
      00999A 02               [ 1] 2343 	and a,(x)
      00999B C1               [ 1] 2344 	ld (x),a 
      00999C 00               [ 4] 2345 	ret 
                                   2346 
                                   2347 ;---------------------
                                   2348 ; BASIC: BTOGL addr,mask
                                   2349 ; toggle bits at 'addr' corresponding 
                                   2350 ; to those of 'mask' that are at 1.
                                   2351 ; arguments:
                                   2352 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2353 ;   mask	    mask^*addr  
                                   2354 ; output:
                                   2355 ;	none 
                                   2356 ;--------------------------
      001A78                       2357 bit_toggle:
      00999D 04 2A 03         [ 4] 2358 	call arg_list 
      0099A0 C7 00            [ 1] 2359 	cp a,#2 
      0099A2 04 CF            [ 1] 2360 	jreq 1$ 
      0099A4 00 05 90         [ 2] 2361 	jp syntax_error
      0099A7 AE               [ 2] 2362 1$: popw x ; mask 
      0099A8 16               [ 1] 2363 	ld a,xl 
      0099A9 90               [ 2] 2364 	popw x ; addr  
      0099AA CD               [ 1] 2365 	xor a,(x)
      0099AB 8B               [ 1] 2366 	ld (x),a 
      0099AC 97               [ 4] 2367 	ret 
                                   2368 
                                   2369 
                                   2370 ;---------------------
                                   2371 ; BASIC: BTEST(addr,bit)
                                   2372 ; return bit value at 'addr' 
                                   2373 ; bit is in range {0..7}.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



                                   2374 ; arguments:
                                   2375 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2376 ;   bit 	    bit position {0..7}  
                                   2377 ; output:
                                   2378 ;	none 
                                   2379 ;--------------------------
      001A88                       2380 bit_test:
      0099AD CD 83 9E         [ 4] 2381 	call func_args 
      0099B0 A6 0D            [ 1] 2382 	cp a,#2
      0099B2 CD 83            [ 1] 2383 	jreq 0$
      0099B4 41 81 0C         [ 2] 2384 	jp syntax_error
      0099B6                       2385 0$:	
      0099B6 52               [ 2] 2386 	popw x 
      0099B7 01               [ 1] 2387 	ld a,xl 
      0099B8 A4 07            [ 1] 2388 	and a,#7
      0099B8 0F               [ 1] 2389 	push a   
      0099B9 01 01            [ 1] 2390 	ld a,#1 
      0099BA 0D 01            [ 1] 2391 1$: tnz (1,sp)
      0099BA CD 92            [ 1] 2392 	jreq 2$
      0099BC 7B               [ 1] 2393 	sll a 
      0099BD A1 02            [ 1] 2394 	dec (1,sp)
      0099BF 25 4F            [ 2] 2395 	jra 1$
      001AA2                       2396 2$: _drop 1 
      0099C1 A1 02            [ 2]    1     addw sp,#1 
      0099C3 27               [ 2] 2397 	popw x 
      0099C4 12               [ 1] 2398 	and a,(x)
      0099C5 A1 03            [ 1] 2399 	jreq 3$
      0099C7 27 13            [ 1] 2400 	ld a,#1 
      0099C9 A1               [ 1] 2401 3$:	clrw x 
      0099CA 82               [ 1] 2402 	ld xl,a 
      0099CB 27 15            [ 1] 2403 	ld a,#TK_INTGR
      0099CD A1               [ 4] 2404 	ret
                                   2405 
                                   2406 
                                   2407 ;--------------------
                                   2408 ; BASIC: POKE addr,byte
                                   2409 ; put a byte at addr 
                                   2410 ;--------------------
      001AAF                       2411 poke:
      0099CE 09 27 18         [ 4] 2412 	call arg_list 
      0099D1 A1 0A            [ 1] 2413 	cp a,#2
      0099D3 27 18            [ 1] 2414 	jreq 1$
      0099D5 20 28 0C         [ 2] 2415 	jp syntax_error
      0099D7                       2416 1$:	
      0099D7 CD               [ 2] 2417 	popw x  
      0099D8 83               [ 1] 2418     ld a,xl 
      0099D9 9E               [ 2] 2419 	popw x 
      0099DA 20               [ 1] 2420 	ld (x),a 
      0099DB DC               [ 4] 2421 	ret 
                                   2422 
                                   2423 ;-----------------------
                                   2424 ; BASIC: PEEK(addr)
                                   2425 ; get the byte at addr 
                                   2426 ; input:
                                   2427 ;	none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



                                   2428 ; output:
                                   2429 ;	X 		value 
                                   2430 ;-----------------------
      0099DC                       2431 peek:
      0099DC 9F CD 83         [ 4] 2432 	call func_args
      0099DF 41 20            [ 1] 2433 	cp a,#1 
      0099E1 D6 03            [ 1] 2434 	jreq 1$
      0099E2 CC 11 0C         [ 2] 2435 	jp syntax_error
      0099E2 FD               [ 2] 2436 1$: popw x 
      0099E3 9F               [ 1] 2437 	ld a,(x)
      0099E4 CD               [ 1] 2438 	clrw x 
      0099E5 83               [ 1] 2439 	ld xl,a 
      0099E6 41 20            [ 1] 2440 	ld a,#TK_INTGR
      0099E8 CF               [ 4] 2441 	ret 
                                   2442 
                                   2443 ;---------------------------
                                   2444 ; BASIC IF expr : instructions
                                   2445 ; evaluate expr and if true 
                                   2446 ; execute instructions on same line. 
                                   2447 ;----------------------------
      0099E9                       2448 if: 
      0099E9 03 01 20         [ 4] 2449 	call relation 
      0099EC CD 84            [ 1] 2450 	cp a,#TK_INTGR
      0099ED 27 03            [ 1] 2451 	jreq 1$ 
      0099ED CD 92 7B         [ 2] 2452 	jp syntax_error
      0099F0 A1               [ 1] 2453 1$:	clr a 
      0099F1 84               [ 2] 2454 	tnzw x 
      0099F2 27 03            [ 1] 2455 	jrne 9$  
                                   2456 ;skip to next line
      0099F4 CC 91 8C 00 01   [ 1] 2457 	mov in,count
      0099F7 81               [ 4] 2458 9$:	ret 
                                   2459 
                                   2460 ;------------------------
                                   2461 ; BASIC: FOR var=expr 
                                   2462 ; set variable to expression 
                                   2463 ; leave variable address 
                                   2464 ; on stack and set
                                   2465 ; FLOOP bit in 'flags'
                                   2466 ;-----------------
                           000001  2467 	RETL1=1 ; return address  
                           000003  2468 	FSTEP=3  ; variable increment
                           000005  2469 	LIMIT=5 ; loop limit 
                           000007  2470 	CVAR=7   ; control variable 
                           000009  2471 	INW=9   ;  in.w saved
                           00000B  2472 	BPTR=11 ; baseptr saved
                           00000A  2473 	VSIZE=10  
      001AE3                       2474 for: ; { -- var_addr }
      0099F7 9F               [ 2] 2475 	popw x ; call return address 
      001AE4                       2476 	_vars VSIZE 
      0099F8 A4 0F            [ 2]    1     sub sp,#VSIZE 
      0099FA C7               [ 2] 2477 	pushw x  ; RETL1 
      0099FB 00 22            [ 1] 2478 	ld a,#TK_VAR 
      0099FD 20 B9 95         [ 4] 2479 	call expect
      0099FF 1F 07            [ 2] 2480 	ldw (CVAR,sp),x  ; control variable 
      0099FF 55 00 03         [ 4] 2481 	call let_var 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      009A02 00 02 CD 97      [ 1] 2482 	bset flags,#FLOOP 
                                   2483 ; open space on stack for loop data 
      009A06 6F               [ 1] 2484 	clrw x 
      009A07 A1 84            [ 2] 2485 	ldw (BPTR,sp),x 
      009A09 26 05            [ 2] 2486 	ldw (INW,sp),x 
      009A0B CD 92 C9         [ 4] 2487 	call next_token 
      009A0E 20 A8            [ 1] 2488 	cp a,#TK_CMD 
      009A10 27 03            [ 1] 2489 	jreq 1$
      009A10 0D 01 26         [ 2] 2490 	jp syntax_error
      001B04                       2491 1$:  
      009A13 05 A6 0D         [ 2] 2492 	cpw x,#to 
      009A16 CD 83            [ 1] 2493 	jreq to
      009A18 41 5B 01         [ 2] 2494 	jp syntax_error 
                                   2495 
                                   2496 ;-----------------------------------
                                   2497 ; BASIC: TO expr 
                                   2498 ; second part of FOR loop initilization
                                   2499 ; leave limit on stack and set 
                                   2500 ; FTO bit in 'flags'
                                   2501 ;-----------------------------------
      001B0C                       2502 to: ; { var_addr -- var_addr limit step }
      009A1B 81 04 00 20 03   [ 2] 2503 	btjt flags,#FLOOP,1$
      009A1C CC 11 0C         [ 2] 2504 	jp syntax_error
      009A1C CE 00 05         [ 4] 2505 1$: call relation  
      009A1F 1F 03            [ 1] 2506 	cp a,#TK_INTGR 
      009A21 C6 00            [ 1] 2507 	jreq 2$ 
      009A23 02 6B 05         [ 2] 2508 	jp syntax_error
      009A26 C6 00            [ 2] 2509 2$: ldw (LIMIT,sp),x
                                   2510 ;	ldw x,in.w 
      009A28 04 6B 06         [ 4] 2511 	call next_token
      009A2B 81 00            [ 1] 2512 	cp a,#TK_NONE  
      009A2C 27 0E            [ 1] 2513 	jreq 4$ 
      009A2C 1E 03            [ 1] 2514 	cp a,#TK_CMD
      009A2E CF 00            [ 1] 2515 	jrne 3$
      009A30 05 7B 05         [ 2] 2516 	cpw x,#step 
      009A33 C7 00            [ 1] 2517 	jreq step
      001B30                       2518 3$:	
      001B30                       2519 	_unget_token   	 
      009A35 02 7B 06 C7 00   [ 1]    1      mov in,in.saved  
      001B35                       2520 4$:	
      009A3A 04 81 01         [ 2] 2521 	ldw x,#1   ; default step  
      009A3C 1F 03            [ 2] 2522 	ldw (FSTEP,sp),x 
      009A3C 52 07            [ 2] 2523 	jra store_loop_addr 
                                   2524 
                                   2525 
                                   2526 ;----------------------------------
                                   2527 ; BASIC: STEP expr 
                                   2528 ; optional third par of FOR loop
                                   2529 ; initialization. 	
                                   2530 ;------------------------------------
      009A3E                       2531 step: ; {var limit -- var limit step}
      009A3E 0F 05 CD 92 7B   [ 2] 2532 	btjt flags,#FLOOP,1$
      009A43 A1 02 26         [ 2] 2533 	jp syntax_error
      009A46 08 CD 83         [ 4] 2534 1$: call relation
      009A49 9E 03            [ 1] 2535 	cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      009A4B 05 CD            [ 1] 2536 	jreq 2$
      009A4D 92 7B A1         [ 2] 2537 	jp syntax_error
      009A50 85 27            [ 2] 2538 2$:	ldw (FSTEP,sp),x ; step
                                   2539 ; leave loop back entry point on cstack 
                                   2540 ; cstack is 1 call deep from interpreter
      001B50                       2541 store_loop_addr:
      009A52 03 CC 91         [ 2] 2542 	ldw x,basicptr  
      009A55 8C 1F            [ 2] 2543 	ldw (BPTR,sp),x 
      009A57 06 0D 05         [ 2] 2544 	ldw x,in.w 
      009A5A 26 06            [ 2] 2545 	ldw (INW,sp),x   
      009A5C CD 8B 6E CD      [ 1] 2546 	bres flags,#FLOOP 
      009A60 83 41 00 1D      [ 1] 2547 	inc loop_depth  
      009A62 81               [ 4] 2548 	ret 
                                   2549 
                                   2550 ;--------------------------------
                                   2551 ; BASIC: NEXT var 
                                   2552 ; FOR loop control 
                                   2553 ; increment variable with step 
                                   2554 ; and compare with limit 
                                   2555 ; loop if threshold not crossed.
                                   2556 ; else stack. 
                                   2557 ; and decrement 'loop_depth' 
                                   2558 ;--------------------------------
      001B63                       2559 next: ; {var limit step retl1 -- [var limit step ] }
      009A62 A6 3A CD 83      [ 1] 2560 	tnz loop_depth 
      009A66 41 CD            [ 1] 2561 	jrne 1$ 
      009A68 9A 1C 72         [ 2] 2562 	jp syntax_error 
      001B6C                       2563 1$: 
      009A6B 5F 00            [ 1] 2564 	ld a,#TK_VAR 
      009A6D 04 CD 84         [ 4] 2565 	call expect
                                   2566 ; check for good variable after NEXT 	 
      009A70 A3 AE            [ 2] 2567 	cpw x,(CVAR,sp)
      009A72 16 90            [ 1] 2568 	jreq 2$  
      009A74 3B 00 04         [ 2] 2569 	jp syntax_error ; not the good one 
      001B78                       2570 2$: ; increment variable 
      009A77 4B               [ 2] 2571 	ldw x,(x)  ; get var value 
      009A78 00 72 FB         [ 2] 2572 	addw x,(FSTEP,sp) ; var+step 
      009A7B 01 5C            [ 2] 2573 	ldw y,(CVAR,sp)
      009A7D 5B 02            [ 2] 2574 	ldw (y),x ; save var new value 
                                   2575 ; check sign of STEP  
      009A7F 72 5F            [ 1] 2576 	ld a,#0x80
      009A81 00 02            [ 1] 2577 	bcp a,(FSTEP,sp)
      009A83 CD 88            [ 1] 2578 	jrpl 4$
                                   2579 ;negative step 
      009A85 BD A1            [ 2] 2580 	cpw x,(LIMIT,sp)
      009A87 84 27            [ 1] 2581 	jrslt loop_done
      009A89 06 CD            [ 2] 2582 	jra loop_back 
      001B8C                       2583 4$: ; positive step
      009A8B 9A 2C            [ 2] 2584 	cpw x,(LIMIT,sp)
      009A8D CC 91            [ 1] 2585 	jrsgt loop_done
      001B90                       2586 loop_back:
      009A8F 8C 16            [ 2] 2587 	ldw x,(BPTR,sp)
      009A91 06 90 FF         [ 2] 2588 	ldw basicptr,x 
      009A94 CD 9A 2C CD 92   [ 2] 2589 	btjf flags,#FRUN,1$ 
      009A99 7B A1            [ 1] 2590 	ld a,(2,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      009A9B 09 27 A0         [ 1] 2591 	ld count,a
      009A9E A1 00            [ 2] 2592 1$:	ldw x,(INW,sp)
      009AA0 27 07 A1         [ 2] 2593 	ldw in.w,x 
      009AA3 0B               [ 4] 2594 	ret 
      001BA5                       2595 loop_done:
                                   2596 	; remove loop data from stack  
      009AA4 27               [ 2] 2597 	popw x
      001BA6                       2598 	_drop VSIZE 
      009AA5 03 CC            [ 2]    1     addw sp,#VSIZE 
      009AA7 91 8C 00 1D      [ 1] 2599 	dec loop_depth 
                                   2600 ;	pushw x 
                                   2601 ;	ret 
      009AA9 FC               [ 2] 2602 	jp (x)
                                   2603 
                                   2604 ;----------------------------
                                   2605 ; called by goto/gosub
                                   2606 ; to get target line number 
                                   2607 ;---------------------------
      001BAD                       2608 get_target_line:
      009AA9 5B 07 81         [ 4] 2609 	call relation 
      009AAC A1 84            [ 1] 2610 	cp a,#TK_INTGR
      009AAC 55 00            [ 1] 2611 	jreq 1$
      009AAE 04 00 02         [ 2] 2612 	jp syntax_error
      009AB1 81               [ 1] 2613 1$:	clr a
      009AB2 90 CE 00 04      [ 2] 2614 	ldw y,basicptr 
      009AB2 52 04            [ 2] 2615 	ldw y,(y)
      009AB4 0F 01            [ 2] 2616 	pushw y 
      009AB6 CD 96            [ 2] 2617 	cpw x,(1,sp)
      009AB8 27 A1            [ 2] 2618 	addw sp,#2 
      009ABA 02 24            [ 1] 2619 	jrult 11$
      009ABC 03               [ 1] 2620 	inc a 
      001BC7                       2621 11$:	
      009ABD CC 91 8C         [ 4] 2622 	call search_lineno  
      009AC0 A1               [ 2] 2623 	tnzw x 
      009AC1 03 25            [ 1] 2624 	jrne 2$ 
      009AC3 04 85            [ 1] 2625 	ld a,#ERR_NO_LINE 
      009AC5 9F 6B 01         [ 2] 2626 	jp tb_error 
      009AC8 85               [ 4] 2627 2$:	ret 
                                   2628 
                                   2629 ;------------------------
                                   2630 ; BASIC: GOTO line# 
                                   2631 ; jump to line# 
                                   2632 ; here cstack is 2 call deep from interpreter 
                                   2633 ;------------------------
      001BD3                       2634 goto:
      009AC9 9F 6B 02 85 F6   [ 2] 2635 	btjt flags,#FRUN,0$ 
      009ACE 14 02            [ 1] 2636 	ld a,#ERR_RUN_ONLY
      009AD0 18 01 27         [ 2] 2637 	jp tb_error 
      009AD3 F9               [ 4] 2638 	ret 
      009AD4 5B 04 81         [ 4] 2639 0$:	call get_target_line
      009AD7                       2640 jp_to_target:
      009AD7 CD 96 27         [ 2] 2641 	ldw basicptr,x 
      009ADA A1 02            [ 1] 2642 	ld a,(2,x)
      009ADC 27 03 CC         [ 1] 2643 	ld count,a 
      009ADF 91 8C 00 01      [ 1] 2644 	mov in,#3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      009AE1 81               [ 4] 2645 	ret 
                                   2646 
                                   2647 
                                   2648 ;--------------------
                                   2649 ; BASIC: GOSUB line#
                                   2650 ; basic subroutine call
                                   2651 ; actual line# and basicptr 
                                   2652 ; are saved on cstack
                                   2653 ; here cstack is 2 call deep from interpreter 
                                   2654 ;--------------------
                           000003  2655 	RET_ADDR=3
                           000005  2656 	RET_INW=5
                           000004  2657 	VSIZE=4  
      001BEE                       2658 gosub:
      009AE1 85 9F 85 FA F7   [ 2] 2659 	btjt flags,#FRUN,0$ 
      009AE6 81 06            [ 1] 2660 	ld a,#ERR_RUN_ONLY
      009AE7 CC 11 0E         [ 2] 2661 	jp tb_error 
      009AE7 CD               [ 4] 2662 	ret 
      009AE8 96               [ 2] 2663 0$:	popw x 
      001BFA                       2664 	_vars VSIZE  
      009AE9 27 A1            [ 2]    1     sub sp,#VSIZE 
      009AEB 02               [ 2] 2665 	pushw x 
      009AEC 27 03 CC         [ 2] 2666 	ldw x,basicptr
      009AEF 91 8C            [ 2] 2667 	ldw (RET_ADDR,sp),x 
      009AF1 CD 1B AD         [ 4] 2668 	call get_target_line  
      009AF1 85               [ 2] 2669 	pushw x 
      009AF2 9F 43 85         [ 2] 2670 	ldw x,in.w 
      009AF5 F4 F7            [ 2] 2671 	ldw (RET_INW+2,sp),x
      009AF7 81               [ 2] 2672 	popw x 
      009AF8 20 D3            [ 2] 2673 	jra jp_to_target
                                   2674 
                                   2675 ;------------------------
                                   2676 ; BASIC: RETURN 
                                   2677 ; exit from a subroutine 
                                   2678 ; 
                                   2679 ;------------------------
      001C0E                       2680 return:
      009AF8 CD 96 27 A1 02   [ 2] 2681 	btjt flags,#FRUN,0$ 
      009AFD 27 03            [ 1] 2682 	ld a,#ERR_RUN_ONLY
      009AFF CC 91 8C         [ 2] 2683 	jp tb_error 
      001C18                       2684 0$:	
      009B02 85 9F            [ 2] 2685 	ldw x,(RET_ADDR,sp) 
      009B04 85 F8 F7         [ 2] 2686 	ldw basicptr,x
      009B07 81 02            [ 1] 2687 	ld a,(2,x)
      009B08 C7 00 03         [ 1] 2688 	ld count,a  
      009B08 CD 96            [ 2] 2689 	ldw x,(RET_INW,sp)
      009B0A 22 A1 02         [ 2] 2690 	ldw in.w,x 
      009B0D 27               [ 2] 2691 	popw x 
      001C28                       2692 	_drop VSIZE 
      009B0E 03 CC            [ 2]    1     addw sp,#VSIZE 
      009B10 91               [ 2] 2693 	pushw x
      009B11 8C               [ 4] 2694 	ret  
                                   2695 
                                   2696 
                                   2697 ;----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



                                   2698 ; BASIC: RUN
                                   2699 ; run BASIC program in RAM
                                   2700 ;----------------------------------- 
      009B12                       2701 run: 
      009B12 85 9F A4 07 88   [ 2] 2702 	btjf flags,#FRUN,0$  
      009B17 A6               [ 1] 2703 	clr a 
      009B18 01               [ 4] 2704 	ret
      001C33                       2705 0$: 
      009B19 0D 01 27 05 48   [ 2] 2706 	btjf flags,#FBREAK,1$
      001C38                       2707 	_drop 2 
      009B1E 0A 01            [ 2]    1     addw sp,#2 
      009B20 20 F7 5B         [ 4] 2708 	call rest_context
      001C3D                       2709 	_drop CTXT_SIZE 
      009B23 01 85            [ 2]    1     addw sp,#CTXT_SIZE 
      009B25 F4 27 02 A6      [ 1] 2710 	bres flags,#FBREAK 
      009B29 01 5F 97 A6      [ 1] 2711 	bset flags,#FRUN 
      009B2D 84 81 AF         [ 2] 2712 	jp interpreter 
      009B2F CE 00 19         [ 2] 2713 1$:	ldw x,txtbgn
      009B2F CD 96 27         [ 2] 2714 	cpw x,txtend 
      009B32 A1 02            [ 1] 2715 	jrmi run_it 
      009B34 27 03 CC         [ 2] 2716 	ldw x,#err_no_prog
      009B37 91 8C 1E         [ 4] 2717 	call puts 
      009B39 55 00 03 00 01   [ 1] 2718 	mov in,count
      009B39 85               [ 4] 2719 	ret 
      001C5E                       2720 run_it:	 
      009B3A 9F 85 F7         [ 4] 2721     call ubound 
      001C61                       2722 	_drop 2 ; drop return address 
      009B3D 81 02            [ 2]    1     addw sp,#2 
                                   2723 ; clear data pointer 
      009B3E 5F               [ 1] 2724 	clrw x 
      009B3E CD 96 22         [ 2] 2725 	ldw data_ptr,x 
      009B41 A1 01 27 03      [ 1] 2726 	clr data_ofs 
      009B45 CC 91 8C 85      [ 1] 2727 	clr data_len 
                                   2728 ; initialize BASIC pointer 
      009B49 F6 5F 97         [ 2] 2729 	ldw x,txtbgn 
      009B4C A6 84 81         [ 2] 2730 	ldw basicptr,x 
      009B4F E6 02            [ 1] 2731 	ld a,(2,x)
      009B4F CD 97 6F         [ 1] 2732 	ld count,a
      009B52 A1 84 27 03      [ 1] 2733 	mov in,#3	
      009B56 CC 91 8C 4F      [ 1] 2734 	bset flags,#FRUN 
      009B5A 5D 26 05         [ 2] 2735 	jp interpreter 
                                   2736 
                                   2737 
                                   2738 ;----------------------
                                   2739 ; BASIC: END
                                   2740 ; end running program
                                   2741 ;---------------------- 
      001C85                       2742 cmd_end: 
                                   2743 ; clean stack 
      009B5D 55 00 04         [ 2] 2744 	ldw x,#STACK_EMPTY
      009B60 00               [ 1] 2745 	ldw sp,x 
      009B61 02 81 90         [ 2] 2746 	jp warm_start
                                   2747 
                                   2748 ;-----------------
                                   2749 ; 1 Khz beep 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



                                   2750 ;-----------------
      009B63                       2751 beep_1khz:: 
      009B63 85 52 0A         [ 2] 2752 	ldw x,#100
      009B66 89 A6 85 CD      [ 2] 2753 	ldw y,#1000
      009B6A 96 15            [ 2] 2754 	jra beep
                                   2755 
                                   2756 ;-----------------------
                                   2757 ; BASIC: TONE expr1,expr2
                                   2758 ; used TIMER2 channel 1
                                   2759 ; to produce a tone 
                                   2760 ; arguments:
                                   2761 ;    expr1   frequency 
                                   2762 ;    expr2   duration msec.
                                   2763 ;---------------------------
      001C95                       2764 tone:
      009B6C 1F 07 CD         [ 4] 2765 	call arg_list 
      009B6F 98 9B            [ 1] 2766 	cp a,#2 
      009B71 72 14            [ 1] 2767 	jreq 1$
      009B73 00 21 5F         [ 2] 2768 	jp syntax_error 
      001C9F                       2769 1$: 
      009B76 1F               [ 2] 2770 	popw x ; duration
      009B77 0B 1F            [ 2] 2771 	popw y ; frequency 
      001CA2                       2772 beep:  
      009B79 09               [ 2] 2773 	pushw x 
      009B7A CD 92 7B         [ 2] 2774 	ldw x,#TIM2_CLK_FREQ
      009B7D A1               [ 2] 2775 	divw x,y 
                                   2776 ; round to nearest integer 
      009B7E 80 27 03 CC      [ 2] 2777 	cpw y,#TIM2_CLK_FREQ/2
      009B82 91 8C            [ 1] 2778 	jrmi 2$
      009B84 5C               [ 1] 2779 	incw x 
      001CAE                       2780 2$:	 
      009B84 A3               [ 1] 2781 	ld a,xh 
      009B85 9B 8C 27         [ 1] 2782 	ld TIM2_ARRH,a 
      009B88 03               [ 1] 2783 	ld a,xl 
      009B89 CC 91 8C         [ 1] 2784 	ld TIM2_ARRL,a 
                                   2785 ; 50% duty cycle 
      009B8C 8C               [ 1] 2786 	ccf 
      009B8C 72               [ 2] 2787 	rrcw x 
      009B8D 04               [ 1] 2788 	ld a,xh 
      009B8E 00 21 03         [ 1] 2789 	ld TIM2_CCR1H,a 
      009B91 CC               [ 1] 2790 	ld a,xl
      009B92 91 8C CD         [ 1] 2791 	ld TIM2_CCR1L,a
      009B95 97 6F A1 84      [ 1] 2792 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      009B99 27 03 CC 91      [ 1] 2793 	bset TIM2_CR1,#TIM2_CR1_CEN
      009B9D 8C 1F 05 CD      [ 1] 2794 	bset TIM2_EGR,#TIM2_EGR_UG
      009BA1 92               [ 2] 2795 	popw x 
      009BA2 7B A1 00         [ 4] 2796 	call pause02
      009BA5 27 0E A1 80      [ 1] 2797 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      009BA9 26 05 A3 9B      [ 1] 2798 	bres TIM2_CR1,#TIM2_CR1_CEN 
      009BAD BC               [ 4] 2799 	ret 
                                   2800 
                                   2801 ;-------------------------------
                                   2802 ; BASIC: ADCON 0|1 [,divisor]  
                                   2803 ; disable/enanble ADC 
                                   2804 ;-------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



                           000003  2805 	ONOFF=3 
                           000001  2806 	DIVSOR=1
                           000004  2807 	VSIZE=4 
      001CD9                       2808 power_adc:
      009BAE 27 0C A7         [ 4] 2809 	call arg_list 
      009BB0 A1 02            [ 1] 2810 	cp a,#2	
      009BB0 55 00            [ 1] 2811 	jreq 1$
      009BB2 03 00            [ 1] 2812 	cp a,#1 
      009BB4 02 03            [ 1] 2813 	jreq 0$ 
      009BB5 CC 11 0C         [ 2] 2814 	jp syntax_error 
      009BB5 AE 00 01         [ 2] 2815 0$: ldw x,#0
      009BB8 1F               [ 2] 2816 	pushw x  ; divisor 
      009BB9 03 20            [ 2] 2817 1$: ldw x,(ONOFF,sp)
      009BBB 14               [ 2] 2818 	tnzw x 
      009BBC 27 1A            [ 1] 2819 	jreq 2$ 
      009BBC 72 04            [ 2] 2820 	ldw x,(DIVSOR,sp) ; divisor 
      009BBE 00               [ 1] 2821 	ld a,xl
      009BBF 21 03            [ 1] 2822 	and a,#7
      009BC1 CC               [ 1] 2823 	swap a 
      009BC2 91 8C CD         [ 1] 2824 	ld ADC_CR1,a
      009BC5 97 6F A1 84      [ 1] 2825 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      009BC9 27 03 CC 91      [ 1] 2826 	bset ADC_CR1,#ADC_CR1_ADON 
      001D01                       2827 	_usec_dly 7 
      009BCD 8C 1F 03         [ 2]    1     ldw x,#(16*7-2)/4
      009BD0 5A               [ 2]    2     decw x
      009BD0 CE               [ 1]    3     nop 
      009BD1 00 05            [ 1]    4     jrne .-4
      009BD3 1F 0B            [ 2] 2828 	jra 3$
      009BD5 CE 00 01 1F      [ 1] 2829 2$: bres ADC_CR1,#ADC_CR1_ADON
      009BD9 09 72 15 00      [ 1] 2830 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      001D12                       2831 3$:	_drop VSIZE 
      009BDD 21 72            [ 2]    1     addw sp,#VSIZE 
      009BDF 5C               [ 4] 2832 	ret
                                   2833 
                                   2834 ;-----------------------------
                                   2835 ; BASIC: ADCREAD (channel)
                                   2836 ; read adc channel {0..5}
                                   2837 ; output:
                                   2838 ;   A 		TK_INTGR 
                                   2839 ;   X 		value 
                                   2840 ;-----------------------------
      001D15                       2841 analog_read:
      009BE0 00 1E 81         [ 4] 2842 	call func_args 
      009BE3 A1 01            [ 1] 2843 	cp a,#1 
      009BE3 72 5D            [ 1] 2844 	jreq 1$
      009BE5 00 1E 26         [ 2] 2845 	jp syntax_error
      009BE8 03               [ 2] 2846 1$: popw x 
      009BE9 CC 91 8C         [ 2] 2847 	cpw x,#5 
      009BEC 23 05            [ 2] 2848 	jrule 2$
      009BEC A6 85            [ 1] 2849 	ld a,#ERR_BAD_VALUE
      009BEE CD 96 15         [ 2] 2850 	jp tb_error 
      009BF1 13               [ 1] 2851 2$: ld a,xl
      009BF2 07 27 03         [ 1] 2852 	ld acc8,a 
      009BF5 CC 91            [ 1] 2853 	ld a,#5
      009BF7 8C 00 0D         [ 1] 2854 	sub a,acc8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      009BF8 C7 54 00         [ 1] 2855 	ld ADC_CSR,a
      009BF8 FE 72 FB 03      [ 1] 2856 	bset ADC_CR2,#ADC_CR2_ALIGN
      009BFC 16 07 90 FF      [ 1] 2857 	bset ADC_CR1,#ADC_CR1_ADON
      009C00 A6 80 15 03 2A   [ 2] 2858 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009C05 06 13 05         [ 2] 2859 	ldw x,ADC_DRH
      009C08 2F 1B            [ 1] 2860 	ld a,#TK_INTGR
      009C0A 20               [ 4] 2861 	ret 
                                   2862 
                                   2863 ;-----------------------
                                   2864 ; BASIC: DREAD(pin)
                                   2865 ; Arduino pins 
                                   2866 ; read state of a digital pin 
                                   2867 ; pin# {0..15}
                                   2868 ; output:
                                   2869 ;    A 		TK_INTGR
                                   2870 ;    X      0|1 
                                   2871 ;-------------------------
                           000001  2872 	PINNO=1
                           000001  2873 	VSIZE=1
      001D49                       2874 digital_read:
      001D49                       2875 	_vars VSIZE 
      009C0B 04 01            [ 2]    1     sub sp,#VSIZE 
      009C0C CD 15 A2         [ 4] 2876 	call func_args
      009C0C 13 05            [ 1] 2877 	cp a,#1
      009C0E 2C 15            [ 1] 2878 	jreq 1$
      009C10 CC 11 0C         [ 2] 2879 	jp syntax_error
      009C10 1E               [ 2] 2880 1$: popw x 
      009C11 0B CF 00         [ 2] 2881 	cpw x,#15 
      009C14 05 72            [ 2] 2882 	jrule 2$
      009C16 01 00            [ 1] 2883 	ld a,#ERR_BAD_VALUE
      009C18 21 05 E6         [ 2] 2884 	jp tb_error 
      009C1B 02 C7 00         [ 4] 2885 2$:	call select_pin 
      009C1E 04 1E            [ 1] 2886 	ld (PINNO,sp),a
      009C20 09 CF            [ 1] 2887 	ld a,(GPIO_IDR,x)
      009C22 00 01            [ 1] 2888 	tnz (PINNO,sp)
      009C24 81 05            [ 1] 2889 	jreq 8$
      009C25 44               [ 1] 2890 3$: srl a 
      009C25 85 5B            [ 1] 2891 	dec (PINNO,sp)
      009C27 0A 72            [ 1] 2892 	jrne 3$ 
      009C29 5A 00            [ 1] 2893 8$: and a,#1 
      009C2B 1E               [ 1] 2894 	clrw x 
      009C2C FC               [ 1] 2895 	ld xl,a 
      009C2D A6 84            [ 1] 2896 	ld a,#TK_INTGR
      001D76                       2897 	_drop VSIZE
      009C2D CD 97            [ 2]    1     addw sp,#VSIZE 
      009C2F 6F               [ 4] 2898 	ret
                                   2899 
                                   2900 
                                   2901 ;-----------------------
                                   2902 ; BASIC: DWRITE pin,0|1
                                   2903 ; Arduino pins 
                                   2904 ; write to a digital pin 
                                   2905 ; pin# {0..15}
                                   2906 ; output:
                                   2907 ;    A 		TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



                                   2908 ;    X      0|1 
                                   2909 ;-------------------------
                           000001  2910 	PINNO=1
                           000002  2911 	PINVAL=2
                           000002  2912 	VSIZE=2
      001D79                       2913 digital_write:
      001D79                       2914 	_vars VSIZE 
      009C30 A1 84            [ 2]    1     sub sp,#VSIZE 
      009C32 27 03 CC         [ 4] 2915 	call arg_list  
      009C35 91 8C            [ 1] 2916 	cp a,#2 
      009C37 4F 90            [ 1] 2917 	jreq 1$
      009C39 CE 00 05         [ 2] 2918 	jp syntax_error
      009C3C 90               [ 2] 2919 1$: popw x 
      009C3D FE               [ 1] 2920 	ld a,xl 
      009C3E 90 89            [ 1] 2921 	ld (PINVAL,sp),a
      009C40 13               [ 2] 2922 	popw x 
      009C41 01 5B 02         [ 2] 2923 	cpw x,#15 
      009C44 25 01            [ 2] 2924 	jrule 2$
      009C46 4C 0A            [ 1] 2925 	ld a,#ERR_BAD_VALUE
      009C47 CC 11 0E         [ 2] 2926 	jp tb_error 
      009C47 CD 86 86         [ 4] 2927 2$:	call select_pin 
      009C4A 5D 26            [ 1] 2928 	ld (PINNO,sp),a 
      009C4C 05 A6            [ 1] 2929 	ld a,#1
      009C4E 05 CC            [ 1] 2930 	tnz (PINNO,sp)
      009C50 91 8E            [ 1] 2931 	jreq 4$
      009C52 81               [ 1] 2932 3$: sll a
      009C53 0A 01            [ 1] 2933 	dec (PINNO,sp)
      009C53 72 00            [ 1] 2934 	jrne 3$
      009C55 00 21            [ 1] 2935 4$: tnz (PINVAL,sp)
      009C57 06 A6            [ 1] 2936 	jrne 5$
      009C59 06               [ 1] 2937 	cpl a 
      009C5A CC 91            [ 1] 2938 	and a,(GPIO_ODR,x)
      009C5C 8E 81            [ 2] 2939 	jra 8$
      009C5E CD 9C            [ 1] 2940 5$: or a,(GPIO_ODR,x)
      009C60 2D 00            [ 1] 2941 8$: ld (GPIO_ODR,x),a 
      009C61                       2942 	_drop VSIZE 
      009C61 CF 00            [ 2]    1     addw sp,#VSIZE 
      009C63 05               [ 4] 2943 	ret
                                   2944 
                                   2945 
                                   2946 ;-----------------------
                                   2947 ; BASIC: STOP
                                   2948 ; stop progam execution  
                                   2949 ; without resetting pointers 
                                   2950 ; the program is resumed
                                   2951 ; with RUN 
                                   2952 ;-------------------------
      001DB4                       2953 stop:
      009C64 E6 02 C7 00 04   [ 2] 2954 	btjt flags,#FRUN,2$
      009C69 35               [ 1] 2955 	clr a
      009C6A 03               [ 4] 2956 	ret 
      001DBB                       2957 2$:	 
                                   2958 ; create space on cstack to save context 
      009C6B 00 02 81         [ 2] 2959 	ldw x,#break_point 
      009C6E CD 03 1E         [ 4] 2960 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      001DC1                       2961 	_drop 2 ;drop return address 
      009C6E 72 00            [ 2]    1     addw sp,#2 
      001DC3                       2962 	_vars CTXT_SIZE ; context size 
      009C70 00 21            [ 2]    1     sub sp,#CTXT_SIZE 
      009C72 06 A6 06         [ 4] 2963 	call save_context 
      009C75 CC 91 8E         [ 2] 2964 	ldw x,#tib 
      009C78 81 85 52         [ 2] 2965 	ldw basicptr,x
      009C7B 04               [ 1] 2966 	clr (x)
      009C7C 89 CE 00 05      [ 1] 2967 	clr count  
      009C80 1F               [ 1] 2968 	clrw x 
      009C81 03 CD 9C         [ 2] 2969 	ldw in.w,x
      009C84 2D 89 CE 00      [ 1] 2970 	bres flags,#FRUN 
      009C88 01 1F 07 85      [ 1] 2971 	bset flags,#FBREAK
      009C8C 20 D3 AF         [ 2] 2972 	jp interpreter 
      009C8E 0A 62 72 65 61 6B 20  2973 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   2974 
                                   2975 ;-----------------------
                                   2976 ; BASIC: NEW
                                   2977 ; from command line only 
                                   2978 ; free program memory
                                   2979 ; and clear variables 
                                   2980 ;------------------------
      001E00                       2981 new: 
      009C8E 72 00 00 21 05   [ 2] 2982 	btjf flags,#FRUN,0$ 
      009C93 A6               [ 4] 2983 	ret 
      001E06                       2984 0$:	
      009C94 06 CC 91         [ 4] 2985 	call clear_basic 
      009C97 8E               [ 4] 2986 	ret 
                                   2987 
                                   2988 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2989 ;;;  flash memory operations
                                   2990 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2991 
                                   2992 ;--------------------------
                                   2993 ; align farptr to BLOCK_SIZE 
                                   2994 ;---------------------------
      009C98                       2995 row_align:
      009C98 1E 03            [ 1] 2996 	ld a,#0x7f 
      009C9A CF 00 05         [ 1] 2997 	and a,farptr+2 
      009C9D E6 02            [ 1] 2998 	jreq 1$ 
      009C9F C7 00 04         [ 2] 2999 	ldw x,farptr+1 
      009CA2 1E 05 CF         [ 2] 3000 	addw x,#BLOCK_SIZE 
      009CA5 00 01            [ 1] 3001 	jrnc 0$
      009CA7 85 5B 04 89      [ 1] 3002 	inc farptr 
      009CAB 81               [ 1] 3003 0$: ld a,xl 
      009CAC A4 80            [ 1] 3004 	and a,#0x80
      009CAC 72               [ 1] 3005 	ld xl,a
      009CAD 01 00 21         [ 2] 3006 	ldw farptr+1,x  	
      009CB0 02               [ 4] 3007 1$:	ret
                                   3008 
                                   3009 ;--------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



                                   3010 ; input:
                                   3011 ;   X     increment 
                                   3012 ; output:
                                   3013 ;   farptr  incremented 
                                   3014 ;---------------------
      001E25                       3015 incr_farptr:
      009CB1 4F 81 00 17      [ 2] 3016 	addw x,farptr+1 
      009CB3 24 04            [ 1] 3017 	jrnc 1$
      009CB3 72 09 00 21      [ 1] 3018 	inc farptr 
      009CB7 12 5B 02         [ 2] 3019 1$:	ldw farptr+1,x  
      009CBA CD               [ 4] 3020 	ret 
                                   3021 
                                   3022 ;-----------------------------------
                                   3023 ; scan block for non zero byte 
                                   3024 ; block are 128 bytes 
                                   3025 ; input:
                                   3026 ;    farptr     address block  
                                   3027 ; output:
                                   3028 ;     A     0 cleared, other not cleared  
                                   3029 ;-----------------------------------
      001E33                       3030 scan_block:
      009CBB 9A               [ 1] 3031 	clrw x 
      009CBC 2C 5B 04 72      [ 5] 3032 1$: ldf a,([farptr],x) 
      009CC0 19 00            [ 1] 3033 	jrne 2$
      009CC2 21               [ 1] 3034 	incw x 
      009CC3 72 10 00         [ 2] 3035 	cpw x,#BLOCK_SIZE 
      009CC6 21 CC            [ 1] 3036 	jrult 1$ 
      009CC8 92               [ 4] 3037 2$:	ret 
                                   3038 
                                   3039 
                                   3040 
                                   3041 ;-----------------------------------
                                   3042 ; BASIC: ERASE \E | \F 
                                   3043 ; erase all block in range from 
                                   3044 ;  'app_space' to FLASH end (0x20000)
                                   3045 ;  or all EEPROM 
                                   3046 ; that contains a non zero byte.  
                                   3047 ;-----------------------------------
                           000001  3048 	LIMIT=1 
                           000003  3049 	VSIZE = 3 
      001E41                       3050 erase:
      009CC9 2F CE 00 1A      [ 1] 3051 	clr farptr 
      001E45                       3052 	_vars VSIZE 
      009CCD C3 00            [ 2]    1     sub sp,#VSIZE 
      009CCF 1C 2B 0C         [ 4] 3053 	call next_token 
      009CD2 AE 91            [ 1] 3054 	cp a,#TK_CHAR 
      009CD4 25 CD            [ 1] 3055 	jreq 0$ 
      009CD6 83 9E 55         [ 2] 3056 	jp syntax_error
      009CD9 00               [ 1] 3057 0$: ld a,xl 
      009CDA 04 00            [ 1] 3058 	and a,#0XDF 
      009CDC 02 81            [ 1] 3059 	cp a,#'E
      009CDE 26 0C            [ 1] 3060 	jrne 1$
      009CDE CD 98 80         [ 2] 3061 	ldw x,#EEPROM_BASE 
      009CE1 5B 02 5F         [ 2] 3062 	ldw farptr+1,x 
      009CE4 CF 00 07         [ 2] 3063 	ldw x,#EEPROM_END
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      009CE7 72               [ 1] 3064 	clr a 
      009CE8 5F 00            [ 2] 3065 	jra 3$ 
      009CEA 09 72            [ 1] 3066 1$: cp a,#'F 
      009CEC 5F 00            [ 1] 3067 	jreq 2$
      009CEE 0A CE 00         [ 2] 3068 	ldw x,#err_bad_value
      009CF1 1A CF 00         [ 2] 3069 	jp tb_error
      001E6E                       3070 2$:
      009CF4 05 E6 02         [ 2] 3071 	ldw x,#app_sign 
      009CF7 C7 00 04         [ 2] 3072 	ldw farptr+1,x 
      009CFA 35 03            [ 1] 3073 	ld a,#(FLASH_END>>16)&0XFF 
      009CFC 00 02 72         [ 2] 3074 	ldw x,#FLASH_END&0xffff
      001E79                       3075 3$:
      009CFF 10 00            [ 1] 3076 	ld (LIMIT,sp),a 
      009D01 21 CC            [ 2] 3077 	ldw (LIMIT+1,sp),x 
                                   3078  ; operation done from RAM
                                   3079  ; copy code to RAM in tib   
      009D03 92 2F 11         [ 4] 3080 	call move_erase_to_ram
      009D05                       3081 4$:	 
      009D05 AE 17 FF         [ 4] 3082     call scan_block 
      009D08 94 CC            [ 1] 3083 	jreq 5$  ; block already erased 
      009D0A 92 10            [ 1] 3084     ld a,#'E 
      009D0C CD 02 C1         [ 4] 3085     call putc 
      009D0C AE 00 64         [ 4] 3086 	call block_erase   
                                   3087 ; this block is clean, next  
      009D0F 90 AE 03         [ 2] 3088 5$:	ldw x,#BLOCK_SIZE
      009D12 E8 20 0D         [ 4] 3089 	call incr_farptr
                                   3090 ; check limit, 24 bit substraction  	
      009D15 7B 01            [ 1] 3091 	ld a,(LIMIT,sp)
      009D15 CD 96            [ 2] 3092 	ldw x,(LIMIT+1,sp)
      009D17 27 A1 02 27      [ 2] 3093 	subw x,farptr+1
      009D1B 03 CC 91         [ 1] 3094 	sbc a,farptr 
      009D1E 8C E0            [ 1] 3095 	jrugt 4$ 
      009D1F CD 0F 74         [ 4] 3096 9$: call clear_basic
      001EA3                       3097 	_drop VSIZE 
      009D1F 85 90            [ 2]    1     addw sp,#VSIZE 
      009D21 85               [ 4] 3098 	ret 
                                   3099 	
                                   3100 
                                   3101 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3102 ;  check for application signature 
                                   3103 ; output:
                                   3104 ;   Carry    0 app present 
                                   3105 ;            1 no app installed  
                                   3106 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009D22                       3107 qsign: 
      009D22 89 AE F4         [ 2] 3108 	ldw x,app_sign 
      009D25 24 65 90         [ 2] 3109 	cpw x,SIGNATURE ; "BC" 
      009D28 A3               [ 4] 3110 	ret 
                                   3111 
                                   3112 ;---------------------------------------
                                   3113 ; BASIC: SAVE
                                   3114 ; write application in RAM to FLASH
                                   3115 ;--------------------------------------
      001EAD                       3116 save_app:
      009D29 7A 12 2B         [ 4] 3117 	call qsign 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      009D2C 01 5C            [ 1] 3118 	jrne 1$
      009D2E AE 1F 10         [ 2] 3119 	ldw x,#CANT_DO 
      009D2E 9E C7 53         [ 4] 3120 	call puts 
      009D31 0D 9F C7         [ 2] 3121 	jp 9$
      001EBB                       3122 1$: 
      009D34 53 0E 8C         [ 2] 3123 	ldw x,txtbgn
      009D37 56 9E C7         [ 2] 3124 	cpw x,txtend 
      009D3A 53 0F            [ 1] 3125 	jrult 2$ 
      009D3C 9F C7 53         [ 2] 3126 	ldw x,#NO_APP
      009D3F 10 72 10         [ 4] 3127 	call puts 
      009D42 53 08            [ 2] 3128 	jra 9$
      001ECB                       3129 2$: 
                                   3130 ; block programming flash
                                   3131 ; must be done from RAM 
      009D44 72 10 53         [ 4] 3132 	call move_prg_to_ram
                                   3133 ; initialize farptr 
      009D47 00 72 10 53      [ 1] 3134 	clr farptr 
      009D4B 04 85 CD         [ 2] 3135 	ldw x,#app_sign 
      009D4E A0 E5 72         [ 2] 3136 	ldw farptr+1,x 
                                   3137 ; write signature
      009D51 11 53 08         [ 2] 3138 	ldw x,SIGNATURE ; "BC" 
      009D54 72 11 53         [ 2] 3139 	ldw rsign,x 
      009D57 00 81 1B         [ 2] 3140 	ldw x,txtend 
      009D59 72 B0 00 19      [ 2] 3141 	subw x,txtbgn 
      009D59 CD 96 27         [ 2] 3142 	ldw rsize,x   
                                   3143 ;copy block to flash
      009D5C A1 02 27         [ 2] 3144 	ldw x,#rsign  
      009D5F 0B A1            [ 2] 3145 	ldw (1,sp),x   
      009D61 01 27            [ 2] 3146 3$:	ldw x,(1,sp)
      009D63 03 CC 91         [ 4] 3147 	call write_row 
      009D66 8C AE            [ 1] 3148     ld a,#'. 
      009D68 00 00 89         [ 4] 3149     call putc 
      009D6B 1E 03            [ 2] 3150 	ldw x,(1,sp)
      009D6D 5D 27 1A         [ 2] 3151 	addw x,#BLOCK_SIZE
      009D70 1E 01            [ 2] 3152 	ldw (1,sp),x  
      009D72 9F A4 07         [ 2] 3153 	cpw x,txtend 
      009D75 4E C7            [ 1] 3154 	jruge 8$
      009D77 54 01 72         [ 2] 3155 	ldw x,#BLOCK_SIZE 
      009D7A 16 50 CA         [ 4] 3156 	call incr_farptr
      009D7D 72 10            [ 2] 3157 	jra 3$ 
      001F0B                       3158 8$:	
      001F0B                       3159 	_drop 2   
      009D7F 54 01            [ 2]    1     addw sp,#2 
      009D81 AE               [ 4] 3160 9$: ret 
                                   3161 
      009D82 00 1B                 3162 SIGNATURE: .ascii "BC"
      009D84 5A 9D 26 FA 20 08 72  3163 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE before"
             11 54 01 72 17 50 CA
             5B 04 81 63 61 74 69
             6F 6E 2C 20 61 6C 72
             65 61 64 79 20 6F 6E
             65 20 69 6E 20 46 4C
             41 53 48 0A 75 73 65
             20 45 52 41 53 45 20
             62 65 66 6F 72 65 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      009D95 4E 6F 20 61 70 70 6C  3164 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
             20 69 6E 20 52 41 4D
             00
                                   3165 
                                   3166 ;---------------------
                                   3167 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3168 ; write 1 or more byte to FLASH or EEPROM
                                   3169 ; starting at address  
                                   3170 ; input:
                                   3171 ;   expr1  	is address 
                                   3172 ;   expr2,...,exprn   are bytes to write
                                   3173 ; output:
                                   3174 ;   none 
                                   3175 ;---------------------
                           000001  3176 	ADDR=1
                           000002  3177 	VSIZ=2 
      001F65                       3178 write:
      001F65                       3179 	_vars VSIZE 
      009D95 CD 96            [ 2]    1     sub sp,#VSIZE 
      009D97 22 A1 01 27      [ 1] 3180 	clr farptr ; expect 16 bits address 
      009D9B 03 CC 91         [ 4] 3181 	call expression
      009D9E 8C 85            [ 1] 3182 	cp a,#TK_INTGR 
      009DA0 A3 00            [ 1] 3183 	jreq 0$
      009DA2 05 23 05         [ 2] 3184 	jp syntax_error
      009DA5 A6 0A            [ 2] 3185 0$: ldw (ADDR,sp),x 
      009DA7 CC 91 8E         [ 4] 3186 	call next_token 
      009DAA 9F C7            [ 1] 3187 	cp a,#TK_COMMA 
      009DAC 00 0E            [ 1] 3188 	jreq 1$ 
      009DAE A6 05            [ 2] 3189 	jra 9$ 
      009DB0 C0 00 0E         [ 4] 3190 1$:	call expression
      009DB3 C7 54            [ 1] 3191 	cp a,#TK_INTGR
      009DB5 00 72            [ 1] 3192 	jreq 2$
      009DB7 16 54 02         [ 2] 3193 	jp syntax_error
      009DBA 72               [ 1] 3194 2$:	ld a,xl 
      009DBB 10 54            [ 2] 3195 	ldw x,(ADDR,sp) 
      009DBD 01 72 0F         [ 2] 3196 	ldw farptr+1,x 
      009DC0 54               [ 1] 3197 	clrw x 
      009DC1 00 FB CE         [ 4] 3198 	call write_byte
      009DC4 54 04            [ 2] 3199 	ldw x,(ADDR,sp)
      009DC6 A6               [ 1] 3200 	incw x 
      009DC7 84 81            [ 2] 3201 	jra 0$ 
      009DC9                       3202 9$:
      001F99                       3203 	_drop VSIZE
      009DC9 52 01            [ 2]    1     addw sp,#VSIZE 
      009DCB CD               [ 4] 3204 	ret 
                                   3205 
                                   3206 
                                   3207 ;---------------------
                                   3208 ;BASIC: CHAR(expr)
                                   3209 ; évaluate expression 
                                   3210 ; and take the 7 least 
                                   3211 ; bits as ASCII character
                                   3212 ; return a TK_CHAR 
                                   3213 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      001F9C                       3214 char:
      009DCC 96 22 A1         [ 4] 3215 	call func_args 
      009DCF 01 27            [ 1] 3216 	cp a,#1
      009DD1 03 CC            [ 1] 3217 	jreq 1$
      009DD3 91 8C 85         [ 2] 3218 	jp syntax_error
      009DD6 A3               [ 2] 3219 1$:	popw x 
      009DD7 00               [ 1] 3220 	ld a,xl 
      009DD8 0F 23            [ 1] 3221 	and a,#0x7f 
      009DDA 05               [ 1] 3222 	ld xl,a
      009DDB A6 0A            [ 1] 3223 	ld a,#TK_CHAR
      009DDD CC               [ 4] 3224 	ret
                                   3225 
                                   3226 ;---------------------
                                   3227 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3228 ; extract first character 
                                   3229 ; of string argument 
                                   3230 ; return it as TK_INTGR 
                                   3231 ;---------------------
      001FAE                       3232 ascii:
      009DDE 91 8E            [ 1] 3233 	ld a,#TK_LPAREN
      009DE0 CD A2 23         [ 4] 3234 	call expect 
      009DE3 6B 01 E6         [ 4] 3235 	call next_token 
      009DE6 01 0D            [ 1] 3236 	cp a,#TK_QSTR 
      009DE8 01 27            [ 1] 3237 	jreq 1$
      009DEA 05 44            [ 1] 3238 	cp a,#TK_CHAR 
      009DEC 0A 01            [ 1] 3239 	jreq 2$ 
      009DEE 26 FB            [ 1] 3240 	cp a,#TK_CFUNC 
      009DF0 A4 01            [ 1] 3241 	jreq 0$
      009DF2 5F 97 A6         [ 2] 3242 	jp syntax_error
      009DF5 84               [ 4] 3243 0$: call (x)
      009DF6 5B 01            [ 2] 3244 	jra 2$
      001FC8                       3245 1$: 
      009DF8 81               [ 1] 3246 	ld a,(x) 
      009DF9 5F               [ 1] 3247 	clrw x
      009DF9 52               [ 1] 3248 	ld xl,a 
      001FCB                       3249 2$: 
      009DFA 02               [ 2] 3250 	pushw x 
      009DFB CD 96            [ 1] 3251 	ld a,#TK_RPAREN 
      009DFD 27 A1 02         [ 4] 3252 	call expect
      009E00 27               [ 2] 3253 	popw x 
      009E01 03 CC            [ 1] 3254 	ld a,#TK_INTGR 
      009E03 91               [ 4] 3255 	ret 
                                   3256 
                                   3257 ;---------------------
                                   3258 ;BASIC: KEY
                                   3259 ; wait for a character 
                                   3260 ; received from STDIN 
                                   3261 ; input:
                                   3262 ;	none 
                                   3263 ; output:
                                   3264 ;	X 		ASCII character 
                                   3265 ;---------------------
      001FD5                       3266 key:
      009E04 8C 85 9F         [ 4] 3267 	call getc 
      009E07 6B               [ 1] 3268 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      009E08 02               [ 1] 3269 	ld xl,a 
      009E09 85 A3            [ 1] 3270 	ld a,#TK_INTGR
      009E0B 00               [ 4] 3271 	ret
                                   3272 
                                   3273 ;----------------------
                                   3274 ; BASIC: QKEY
                                   3275 ; Return true if there 
                                   3276 ; is a character in 
                                   3277 ; waiting in STDIN 
                                   3278 ; input:
                                   3279 ;  none 
                                   3280 ; output:
                                   3281 ;   X 		0|-1 
                                   3282 ;-----------------------
      001FDD                       3283 qkey:: 
      009E0C 0F               [ 1] 3284 	clrw x 
      009E0D 23 05 A6         [ 1] 3285 	ld a,rx1_head
      009E10 0A CC 91         [ 1] 3286 	cp a,rx1_tail 
      009E13 8E CD            [ 1] 3287 	jreq 9$ 
      009E15 A2               [ 2] 3288 	cplw x 
      009E16 23 6B            [ 1] 3289 9$: ld a,#TK_INTGR
      009E18 01               [ 4] 3290 	ret 
                                   3291 
                                   3292 ;---------------------
                                   3293 ; BASIC: GPIO(expr,reg)
                                   3294 ; return gpio address 
                                   3295 ; expr {0..8}
                                   3296 ; input:
                                   3297 ;   none 
                                   3298 ; output:
                                   3299 ;   X 		gpio register address
                                   3300 ;----------------------------
                           000003  3301 	PORT=3
                           000001  3302 	REG=1 
                           000004  3303 	VSIZE=4 
      001FEA                       3304 gpio:
      009E19 A6 01 0D         [ 4] 3305 	call func_args 
      009E1C 01 27            [ 1] 3306 	cp a,#2
      009E1E 05 48            [ 1] 3307 	jreq 1$
      009E20 0A 01 26         [ 2] 3308 	jp syntax_error  
      001FF4                       3309 1$:	
      009E23 FB 0D            [ 2] 3310 	ldw x,(PORT,sp)
      009E25 02 26            [ 1] 3311 	jrmi bad_port
      009E27 05 43 E4         [ 2] 3312 	cpw x,#9
      009E2A 00 20            [ 1] 3313 	jrpl bad_port
      009E2C 02 EA            [ 1] 3314 	ld a,#5
      009E2E 00               [ 4] 3315 	mul x,a
      009E2F E7 00 5B         [ 2] 3316 	addw x,#GPIO_BASE 
      009E32 02 81            [ 2] 3317 	ldw (PORT,sp),x  
      009E34 1E 01            [ 2] 3318 	ldw x,(REG,sp) 
      009E34 72 00 00         [ 2] 3319 	addw x,(PORT,sp)
      009E37 21 02            [ 1] 3320 	ld a,#TK_INTGR
      00200C                       3321 	_drop VSIZE 
      009E39 4F 81            [ 2]    1     addw sp,#VSIZE 
      009E3B 81               [ 4] 3322 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      00200F                       3323 bad_port:
      009E3B AE 9E            [ 1] 3324 	ld a,#ERR_BAD_VALUE
      009E3D 62 CD 83         [ 2] 3325 	jp tb_error
                                   3326 
                                   3327 
                                   3328 ;-------------------------
                                   3329 ; BASIC: UFLASH 
                                   3330 ; return free flash address
                                   3331 ; input:
                                   3332 ;  none 
                                   3333 ; output:
                                   3334 ;	A		TK_INTGR
                                   3335 ;   X 		free address 
                                   3336 ;---------------------------
      002014                       3337 uflash:
      009E40 9E 5B 02         [ 2] 3338 	ldw x,app_sign
      009E43 52 04 CD         [ 2] 3339 	cpw x,#4243 ; signature "BC" 
      009E46 9A 1C            [ 1] 3340 	jreq 1$
      009E48 AE 16 90         [ 2] 3341 	ldw x,app_size 
      009E4B CF 00 05         [ 2] 3342 	addw x,#app
      009E4E 7F 72            [ 2] 3343 	jra 2$
      009E50 5F 00 04         [ 2] 3344 1$:	ldw x,#app_space 
      009E53 5F CF            [ 1] 3345 2$:	ld a,#TK_INTGR 
      009E55 00               [ 4] 3346 	ret 
                                   3347 
                                   3348 
                                   3349 ;---------------------
                                   3350 ; BASIC: USR(addr[,arg])
                                   3351 ; execute a function written 
                                   3352 ; in binary code.
                                   3353 ; binary fonction should 
                                   3354 ; return token attribute in A 
                                   3355 ; and value in X. 
                                   3356 ; input:
                                   3357 ;   addr	routine address 
                                   3358 ;   arg 	is an optional argument 
                                   3359 ; output:
                                   3360 ;   A 		token attribute 
                                   3361 ;   X       returned value 
                                   3362 ;---------------------
      00202A                       3363 usr:
      009E56 01 72            [ 2] 3364 	pushw y 	
      009E58 11 00 21         [ 4] 3365 	call func_args 
      009E5B 72 18            [ 1] 3366 	cp a,#1 
      009E5D 00 21            [ 1] 3367 	jreq 2$
      009E5F CC 92            [ 1] 3368 	cp a,#2
      009E61 2F 0A            [ 1] 3369 	jreq 2$  
      009E63 62 72 65         [ 2] 3370 	jp syntax_error 
      009E66 61 6B            [ 2] 3371 2$: popw y  ; arg|addr 
      009E68 20 70            [ 1] 3372 	cp a,#1
      009E6A 6F 69            [ 1] 3373 	jreq 3$
      009E6C 6E               [ 2] 3374 	popw x ; addr
      009E6D 74               [ 1] 3375 	exgw x,y 
      009E6E 2C 20            [ 4] 3376 3$: call (y)
      009E70 52 55            [ 2] 3377 	popw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      009E72 4E               [ 4] 3378 	ret 
                                   3379 
                                   3380 ;------------------------------
                                   3381 ; BASIC: BYE 
                                   3382 ; halt mcu in its lowest power mode 
                                   3383 ; wait for reset or external interrupt
                                   3384 ; do a cold start on wakeup.
                                   3385 ;------------------------------
      002047                       3386 bye:
      009E73 20 74 6F 20 72   [ 2] 3387 	btjf UART1_SR,#UART_SR_TC,.
      009E78 65               [10] 3388 	halt
      009E79 73 75 6D         [ 2] 3389 	jp cold_start  
                                   3390 
                                   3391 ;----------------------------------
                                   3392 ; BASIC: SLEEP 
                                   3393 ; halt mcu until reset or external
                                   3394 ; interrupt.
                                   3395 ; Resume progam after SLEEP command
                                   3396 ;----------------------------------
      002050                       3397 sleep:
      009E7C 65 2E 0A 00 FB   [ 2] 3398 	btjf UART1_SR,#UART_SR_TC,.
      009E80 72 16 00 20      [ 1] 3399 	bset flags,#FSLEEP
      009E80 72               [10] 3400 	halt 
      009E81 01               [ 4] 3401 	ret 
                                   3402 
                                   3403 ;-------------------------------
                                   3404 ; BASIC: PAUSE expr 
                                   3405 ; suspend execution for n msec.
                                   3406 ; input:
                                   3407 ;	none
                                   3408 ; output:
                                   3409 ;	none 
                                   3410 ;------------------------------
      00205B                       3411 pause:
      009E82 00 21 01         [ 4] 3412 	call expression
      009E85 81 84            [ 1] 3413 	cp a,#TK_INTGR
      009E86 27 03            [ 1] 3414 	jreq pause02 
      009E86 CD 8F F4         [ 2] 3415 	jp syntax_error
      002065                       3416 pause02: 
      009E89 81               [ 2] 3417 1$: tnzw x 
      009E8A 27 04            [ 1] 3418 	jreq 2$
      009E8A A6               [10] 3419 	wfi 
      009E8B 7F               [ 2] 3420 	decw x 
      009E8C C4 00            [ 1] 3421 	jrne 1$
      009E8E 19               [ 1] 3422 2$:	clr a 
      009E8F 27               [ 4] 3423 	ret 
                                   3424 
                                   3425 ;------------------------------
                                   3426 ; BASIC: AWU expr
                                   3427 ; halt mcu for 'expr' milliseconds
                                   3428 ; use Auto wakeup peripheral
                                   3429 ; all oscillators stopped except LSI
                                   3430 ; range: 1ms - 511ms
                                   3431 ; input:
                                   3432 ;  none
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



                                   3433 ; output:
                                   3434 ;  none:
                                   3435 ;------------------------------
      00206E                       3436 awu:
      009E90 13 CE 00         [ 4] 3437   call expression
      009E93 18 1C            [ 1] 3438   cp a,#TK_INTGR
      009E95 00 80            [ 1] 3439   jreq awu02
      009E97 24 04 72         [ 2] 3440   jp syntax_error
      002078                       3441 awu02:
      009E9A 5C 00 17         [ 2] 3442   cpw x,#5120
      009E9D 9F A4            [ 1] 3443   jrmi 1$ 
      009E9F 80 97 CF 00      [ 1] 3444   mov AWU_TBR,#15 
      009EA3 18 81            [ 1] 3445   ld a,#30
      009EA5 62               [ 2] 3446   div x,a
      009EA5 72 BB            [ 1] 3447   ld a,#16
      009EA7 00               [ 2] 3448   div x,a 
      009EA8 18 24            [ 2] 3449   jra 4$
      002089                       3450 1$: 
      009EAA 04 72 5C         [ 2] 3451   cpw x,#2048
      009EAD 00 17            [ 1] 3452   jrmi 2$ 
      009EAF CF 00 18 81      [ 1] 3453   mov AWU_TBR,#14
      009EB3 A6 50            [ 1] 3454   ld a,#80
      009EB3 5F               [ 2] 3455   div x,a 
      009EB4 92 AF            [ 2] 3456   jra 4$   
      002097                       3457 2$:
      009EB6 00 17 26 06      [ 1] 3458   mov AWU_TBR,#7
      00209B                       3459 3$:  
                                   3460 ; while X > 64  divide by 2 and increment AWU_TBR 
      009EBA 5C A3 00         [ 2] 3461   cpw x,#64 
      009EBD 80 25            [ 2] 3462   jrule 4$ 
      009EBF F4 81 50 F2      [ 1] 3463   inc AWU_TBR 
      009EC1 54               [ 2] 3464   srlw x 
      009EC1 72 5F            [ 2] 3465   jra 3$ 
      0020A7                       3466 4$:
      009EC3 00               [ 1] 3467   ld a, xl
      009EC4 17               [ 1] 3468   dec a 
      009EC5 52 03            [ 1] 3469   jreq 5$
      009EC7 CD               [ 1] 3470   dec a 	
      0020AC                       3471 5$: 
      009EC8 92 7B            [ 1] 3472   and a,#0x3e 
      009ECA A1 03 27         [ 1] 3473   ld AWU_APR,a 
      009ECD 03 CC 91 8C      [ 1] 3474   bset AWU_CSR,#AWU_CSR_AWUEN
      009ED1 9F               [10] 3475   halt 
                                   3476 
      009ED2 A4               [ 4] 3477   ret 
                                   3478 
                                   3479 ;------------------------------
                                   3480 ; BASIC: TICKS
                                   3481 ; return msec ticks counter value 
                                   3482 ; input:
                                   3483 ; 	none 
                                   3484 ; output:
                                   3485 ;	X 		TK_INTGR
                                   3486 ;-------------------------------
      0020B7                       3487 get_ticks:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      009ED3 DF A1 45         [ 2] 3488 	ldw x,ticks 
      009ED6 26 0C            [ 1] 3489 	ld a,#TK_INTGR
      009ED8 AE               [ 4] 3490 	ret 
                                   3491 
                                   3492 
                                   3493 
                                   3494 ;------------------------------
                                   3495 ; BASIC: ABS(expr)
                                   3496 ; return absolute value of expr.
                                   3497 ; input:
                                   3498 ;   none
                                   3499 ; output:
                                   3500 ;   X     	positive integer
                                   3501 ;-------------------------------
      0020BD                       3502 abs:
      009ED9 40 00 CF         [ 4] 3503 	call func_args 
      009EDC 00 18            [ 1] 3504 	cp a,#1 
      009EDE AE 47            [ 1] 3505 	jreq 0$ 
      009EE0 FF 4F 20         [ 2] 3506 	jp syntax_error
      0020C7                       3507 0$:  
      009EE3 15               [ 2] 3508     popw x   
      009EE4 A1               [ 1] 3509 	ld a,xh 
      009EE5 46 27            [ 1] 3510 	bcp a,#0x80 
      009EE7 06 AE            [ 1] 3511 	jreq 2$ 
      009EE9 90               [ 2] 3512 	negw x 
      009EEA D6 CC            [ 1] 3513 2$: ld a,#TK_INTGR 
      009EEC 91               [ 4] 3514 	ret 
                                   3515 
                                   3516 ;------------------------------
                                   3517 ; BASIC: AND(expr1,expr2)
                                   3518 ; Apply bit AND relation between
                                   3519 ; the 2 arguments, i.e expr1 & expr2 
                                   3520 ; output:
                                   3521 ; 	A 		TK_INTGR
                                   3522 ;   X 		result 
                                   3523 ;------------------------------
      0020D1                       3524 bit_and:
      009EED 8E 15 A2         [ 4] 3525 	call func_args 
      009EEE A1 02            [ 1] 3526 	cp a,#2
      009EEE AE AA            [ 1] 3527 	jreq 1$
      009EF0 80 CF 00         [ 2] 3528 	jp syntax_error 
      009EF3 18               [ 2] 3529 1$:	popw x 
      009EF4 A6               [ 1] 3530 	ld a,xh 
      009EF5 02 AE            [ 1] 3531 	and a,(1,sp)
      009EF7 7F               [ 1] 3532 	ld xh,a 
      009EF8 FF               [ 1] 3533 	ld a,xl
      009EF9 14 02            [ 1] 3534 	and a,(2,sp)
      009EF9 6B               [ 1] 3535 	ld xl,a 
      0020E4                       3536 	_drop 2 
      009EFA 01 1F            [ 2]    1     addw sp,#2 
      009EFC 02 CD            [ 1] 3537 	ld a,#TK_INTGR
      009EFE 81               [ 4] 3538 	ret
                                   3539 
                                   3540 ;------------------------------
                                   3541 ; BASIC: OR(expr1,expr2)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



                                   3542 ; Apply bit OR relation between
                                   3543 ; the 2 arguments, i.e expr1 | expr2 
                                   3544 ; output:
                                   3545 ; 	A 		TK_INTGR
                                   3546 ;   X 		result 
                                   3547 ;------------------------------
      0020E9                       3548 bit_or:
      009EFF 91 15 A2         [ 4] 3549 	call func_args 
      009F00 A1 02            [ 1] 3550 	cp a,#2
      009F00 CD 9E            [ 1] 3551 	jreq 1$
      009F02 B3 27 08         [ 2] 3552 	jp syntax_error 
      0020F3                       3553 1$: 
      009F05 A6               [ 2] 3554 	popw x 
      009F06 45               [ 1] 3555 	ld a,xh 
      009F07 CD 83            [ 1] 3556 	or a,(1,sp)
      009F09 41               [ 1] 3557 	ld xh,a 
      009F0A CD               [ 1] 3558 	ld a,xl 
      009F0B 82 0F            [ 1] 3559 	or a,(2,sp)
      009F0D AE               [ 1] 3560 	ld xl,a 
      0020FC                       3561 	_drop 2 
      009F0E 00 80            [ 2]    1     addw sp,#2 
      009F10 CD 9E            [ 1] 3562 	ld a,#TK_INTGR 
      009F12 A5               [ 4] 3563 	ret
                                   3564 
                                   3565 ;------------------------------
                                   3566 ; BASIC: XOR(expr1,expr2)
                                   3567 ; Apply bit XOR relation between
                                   3568 ; the 2 arguments, i.e expr1 ^ expr2 
                                   3569 ; output:
                                   3570 ; 	A 		TK_INTGR
                                   3571 ;   X 		result 
                                   3572 ;------------------------------
      002101                       3573 bit_xor:
      009F13 7B 01 1E         [ 4] 3574 	call func_args 
      009F16 02 72            [ 1] 3575 	cp a,#2
      009F18 B0 00            [ 1] 3576 	jreq 1$
      009F1A 18 C2 00         [ 2] 3577 	jp syntax_error 
      00210B                       3578 1$: 
      009F1D 17               [ 2] 3579 	popw x 
      009F1E 22               [ 1] 3580 	ld a,xh 
      009F1F E0 CD            [ 1] 3581 	xor a,(1,sp)
      009F21 8F               [ 1] 3582 	ld xh,a 
      009F22 F4               [ 1] 3583 	ld a,xl 
      009F23 5B 03            [ 1] 3584 	xor a,(2,sp)
      009F25 81               [ 1] 3585 	ld xl,a 
      009F26                       3586 	_drop 2 
      009F26 CE AA            [ 2]    1     addw sp,#2 
      009F28 80 C3            [ 1] 3587 	ld a,#TK_INTGR 
      009F2A 9F               [ 4] 3588 	ret 
                                   3589 
                                   3590 ;------------------------------
                                   3591 ; BASIC: LSHIFT(expr1,expr2)
                                   3592 ; logical shift left expr1 by 
                                   3593 ; expr2 bits 
                                   3594 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



                                   3595 ; 	A 		TK_INTGR
                                   3596 ;   X 		result 
                                   3597 ;------------------------------
      002119                       3598 lshift:
      009F2B 8E 81 A2         [ 4] 3599 	call func_args
      009F2D A1 02            [ 1] 3600 	cp a,#2 
      009F2D CD 9F            [ 1] 3601 	jreq 1$
      009F2F 26 26 09         [ 2] 3602 	jp syntax_error
      009F32 AE 9F            [ 2] 3603 1$: popw y   
      009F34 90               [ 2] 3604 	popw x 
      009F35 CD 83            [ 2] 3605 	tnzw y 
      009F37 9E CC            [ 1] 3606 	jreq 4$
      009F39 9F               [ 2] 3607 2$:	sllw x 
      009F3A 8D 5A            [ 2] 3608 	decw y 
      009F3B 26 FB            [ 1] 3609 	jrne 2$
      00212F                       3610 4$:  
      009F3B CE 00            [ 1] 3611 	ld a,#TK_INTGR
      009F3D 1A               [ 4] 3612 	ret
                                   3613 
                                   3614 ;------------------------------
                                   3615 ; BASIC: RSHIFT(expr1,expr2)
                                   3616 ; logical shift right expr1 by 
                                   3617 ; expr2 bits.
                                   3618 ; output:
                                   3619 ; 	A 		TK_INTGR
                                   3620 ;   X 		result 
                                   3621 ;------------------------------
      002132                       3622 rshift:
      009F3E C3 00 1C         [ 4] 3623 	call func_args
      009F41 25 08            [ 1] 3624 	cp a,#2 
      009F43 AE 9F            [ 1] 3625 	jreq 1$
      009F45 CF CD 83         [ 2] 3626 	jp syntax_error
      009F48 9E 20            [ 2] 3627 1$: popw y  
      009F4A 42               [ 2] 3628 	popw x
      009F4B 90 5D            [ 2] 3629 	tnzw y 
      009F4B CD 81            [ 1] 3630 	jreq 4$
      009F4D D1               [ 2] 3631 2$:	srlw x 
      009F4E 72 5F            [ 2] 3632 	decw y 
      009F50 00 17            [ 1] 3633 	jrne 2$
      002148                       3634 4$:  
      009F52 AE AA            [ 1] 3635 	ld a,#TK_INTGR
      009F54 80               [ 4] 3636 	ret
                                   3637 
                                   3638 ;--------------------------
                                   3639 ; BASIC: FCPU integer
                                   3640 ; set CPU frequency 
                                   3641 ;-------------------------- 
                                   3642 
      00214B                       3643 fcpu:
      009F55 CF 00            [ 1] 3644 	ld a,#TK_INTGR
      009F57 18 CE 9F         [ 4] 3645 	call expect 
      009F5A 8E               [ 1] 3646 	ld a,xl 
      009F5B CF 00            [ 1] 3647 	and a,#7 
      009F5D 7C CE 00         [ 1] 3648 	ld CLK_CKDIVR,a 
      009F60 1C               [ 4] 3649 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



                                   3650 
                                   3651 ;------------------------------
                                   3652 ; BASIC: PMODE pin#, mode 
                                   3653 ; Arduino pin. 
                                   3654 ; define pin as input or output
                                   3655 ; pin#: {0..15}
                                   3656 ; mode: INPUT|OUTPUT  
                                   3657 ;------------------------------
                           000001  3658 	PINNO=1
                           000001  3659 	VSIZE=1
      002157                       3660 pin_mode:
      002157                       3661 	_vars VSIZE 
      009F61 72 B0            [ 2]    1     sub sp,#VSIZE 
      009F63 00 1A CF         [ 4] 3662 	call arg_list 
      009F66 00 7E            [ 1] 3663 	cp a,#2 
      009F68 AE 00            [ 1] 3664 	jreq 1$
      009F6A 7C 1F 01         [ 2] 3665 	jp syntax_error 
      009F6D 1E 01            [ 2] 3666 1$: popw y ; mode 
      009F6F CD               [ 2] 3667 	popw x ; Dx pin 
      009F70 81 EB A6         [ 4] 3668 	call select_pin 
      009F73 2E CD            [ 1] 3669 	ld (PINNO,sp),a  
      009F75 83 41            [ 1] 3670 	ld a,#1 
      009F77 1E 01            [ 1] 3671 	tnz (PINNO,sp)
      009F79 1C 00            [ 1] 3672 	jreq 4$
      009F7B 80               [ 1] 3673 2$:	sll a 
      009F7C 1F 01            [ 1] 3674 	dec (PINNO,sp)
      009F7E C3 00            [ 1] 3675 	jrne 2$ 
      009F80 1C 24            [ 1] 3676 	ld (PINNO,sp),a
      009F82 08 AE            [ 1] 3677 	ld a,(PINNO,sp)
      009F84 00 80            [ 1] 3678 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009F86 CD 9E            [ 1] 3679 	ld (GPIO_CR1,x),a 
      009F88 A5 20 E2 01      [ 2] 3680 4$:	cpw y,#OUTP 
      009F8B 27 10            [ 1] 3681 	jreq 6$
                                   3682 ; input mode
                                   3683 ; disable external interrupt 
      009F8B 5B 02            [ 1] 3684 	ld a,(PINNO,sp)
      009F8D 81               [ 1] 3685 	cpl a 
      009F8E 42 43            [ 1] 3686 	and a,(GPIO_CR2,x)
      009F90 43 61            [ 1] 3687 	ld (GPIO_CR2,x),a 
                                   3688 ;clear bit in DDR for input mode 
      009F92 6E 27            [ 1] 3689 	ld a,(PINNO,sp)
      009F94 74               [ 1] 3690 	cpl a 
      009F95 20 66            [ 1] 3691 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009F97 6C 61            [ 1] 3692 	ld (GPIO_DDR,x),a 
      009F99 73 68            [ 2] 3693 	jra 9$
      002194                       3694 6$: ;output mode  
      009F9B 20 61            [ 1] 3695 	ld a,(PINNO,sp)
      009F9D 70 70            [ 1] 3696 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009F9F 6C 69            [ 1] 3697 	ld (GPIO_DDR,x),a 
      009FA1 63 61            [ 1] 3698 	ld a,(PINNO,sp)
      009FA3 74 69            [ 1] 3699 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009FA5 6F 6E            [ 1] 3700 	ld (GPIO_CR2,x),a 
      0021A0                       3701 9$:	
      0021A0                       3702 	_drop VSIZE 
      009FA7 2C 20            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      009FA9 61               [ 4] 3703 	ret
                                   3704 
                                   3705 ;------------------------
                                   3706 ; select Arduino pin 
                                   3707 ; input:
                                   3708 ;   X 	 {0..15} Arduino Dx 
                                   3709 ; output:
                                   3710 ;   A     stm8s208 pin 
                                   3711 ;   X     base address s208 GPIO port 
                                   3712 ;---------------------------
      0021A3                       3713 select_pin:
      009FAA 6C               [ 2] 3714 	sllw x 
      009FAB 72 65 61         [ 2] 3715 	addw x,#arduino_to_8s208 
      009FAE 64               [ 2] 3716 	ldw x,(x)
      009FAF 79               [ 1] 3717 	ld a,xl 
      009FB0 20               [ 1] 3718 	push a 
      009FB1 6F               [ 1] 3719 	swapw x 
      009FB2 6E 65            [ 1] 3720 	ld a,#5 
      009FB4 20               [ 4] 3721 	mul x,a 
      009FB5 69 6E 20         [ 2] 3722 	addw x,#GPIO_BASE 
      009FB8 46               [ 1] 3723 	pop a 
      009FB9 4C               [ 4] 3724 	ret 
                                   3725 ; translation from Arduino D0..D15 to stm8s208rb 
      0021B3                       3726 arduino_to_8s208:
      009FBA 41 53                 3727 .byte 3,6 ; D0 
      009FBC 48 0A                 3728 .byte 3,5 ; D1 
      009FBE 75 73                 3729 .byte 4,0 ; D2 
      009FC0 65 20                 3730 .byte 2,1 ; D3
      009FC2 45 52                 3731 .byte 6,0 ; D4
      009FC4 41 53                 3732 .byte 2,2 ; D5
      009FC6 45 20                 3733 .byte 2,3 ; D6
      009FC8 62 65                 3734 .byte 3,1 ; D7
      009FCA 66 6F                 3735 .byte 3,3 ; D8
      009FCC 72 65                 3736 .byte 2,4 ; D9
      009FCE 00 4E                 3737 .byte 4,5 ; D10
      009FD0 6F 20                 3738 .byte 2,6 ; D11
      009FD2 61 70                 3739 .byte 2,7 ; D12
      009FD4 70 6C                 3740 .byte 2,5 ; D13
      009FD6 69 63                 3741 .byte 4,2 ; D14
      009FD8 61 74                 3742 .byte 4,1 ; D15
                                   3743 
                                   3744 
                                   3745 ;------------------------------
                                   3746 ; BASIC: RND(expr)
                                   3747 ; return random number 
                                   3748 ; between 1 and expr inclusive
                                   3749 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   3750 ; input:
                                   3751 ; 	none 
                                   3752 ; output:
                                   3753 ;	X 		random positive integer 
                                   3754 ;------------------------------
      0021D3                       3755 random:
      009FDA 69 6F 6E         [ 4] 3756 	call func_args 
      009FDD 20 69            [ 1] 3757 	cp a,#1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      009FDF 6E 20            [ 1] 3758 	jreq 1$
      009FE1 52 41 4D         [ 2] 3759 	jp syntax_error
      0021DD                       3760 1$:  
      009FE4 00 80            [ 1] 3761 	ld a,#0x80 
      009FE5 15 01            [ 1] 3762 	bcp a,(1,sp)
      009FE5 52 03            [ 1] 3763 	jreq 2$
      009FE7 72 5F            [ 1] 3764 	ld a,#ERR_BAD_VALUE
      009FE9 00 17 CD         [ 2] 3765 	jp tb_error
      0021E8                       3766 2$: 
                                   3767 ; acc16=(x<<5)^x 
      009FEC 97 26 A1         [ 2] 3768 	ldw x,seedx 
      009FEF 84               [ 2] 3769 	sllw x 
      009FF0 27               [ 2] 3770 	sllw x 
      009FF1 03               [ 2] 3771 	sllw x 
      009FF2 CC               [ 2] 3772 	sllw x 
      009FF3 91               [ 2] 3773 	sllw x 
      009FF4 8C               [ 1] 3774 	ld a,xh 
      009FF5 1F 01 CD         [ 1] 3775 	xor a,seedx 
      009FF8 92 7B A1         [ 1] 3776 	ld acc16,a 
      009FFB 09               [ 1] 3777 	ld a,xl 
      009FFC 27 02 20         [ 1] 3778 	xor a,seedx+1 
      009FFF 19 CD 97         [ 1] 3779 	ld acc8,a 
                                   3780 ; seedx=seedy 
      00A002 26 A1 84         [ 2] 3781 	ldw x,seedy 
      00A005 27 03 CC         [ 2] 3782 	ldw seedx,x  
                                   3783 ; seedy=seedy^(seedy>>1)
      00A008 91 8C            [ 2] 3784 	srlw y 
      00A00A 9F 1E            [ 1] 3785 	ld a,yh 
      00A00C 01 CF 00         [ 1] 3786 	xor a,seedy 
      00A00F 18 5F CD         [ 1] 3787 	ld seedy,a  
      00A012 82 30            [ 1] 3788 	ld a,yl 
      00A014 1E 01 5C         [ 1] 3789 	xor a,seedy+1 
      00A017 20 DC 15         [ 1] 3790 	ld seedy+1,a 
                                   3791 ; acc16>>3 
      00A019 CE 00 0C         [ 2] 3792 	ldw x,acc16 
      00A019 5B               [ 2] 3793 	srlw x 
      00A01A 03               [ 2] 3794 	srlw x 
      00A01B 81               [ 2] 3795 	srlw x 
                                   3796 ; x=acc16^x 
      00A01C 9E               [ 1] 3797 	ld a,xh 
      00A01C CD 96 22         [ 1] 3798 	xor a,acc16 
      00A01F A1               [ 1] 3799 	ld xh,a 
      00A020 01               [ 1] 3800 	ld a,xl 
      00A021 27 03 CC         [ 1] 3801 	xor a,acc8 
      00A024 91               [ 1] 3802 	ld xl,a 
                                   3803 ; seedy=x^seedy 
      00A025 8C 85 9F         [ 1] 3804 	xor a,seedy+1
      00A028 A4               [ 1] 3805 	ld xl,a 
      00A029 7F               [ 1] 3806 	ld a,xh 
      00A02A 97 A6 03         [ 1] 3807 	xor a,seedy
      00A02D 81               [ 1] 3808 	ld xh,a 
      00A02E CF 00 14         [ 2] 3809 	ldw seedy,x 
                                   3810 ; return seedy modulo expr + 1 
      00A02E A6 07            [ 2] 3811 	popw y 
      00A030 CD               [ 2] 3812 	divw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      00A031 96               [ 1] 3813 	ldw x,y 
      00A032 15               [ 1] 3814 	incw x 
      002237                       3815 10$:
      00A033 CD 92            [ 1] 3816 	ld a,#TK_INTGR
      00A035 7B               [ 4] 3817 	ret 
                                   3818 
                                   3819 ;---------------------------------
                                   3820 ; BASIC: WORDS 
                                   3821 ; affiche la listes des mots du
                                   3822 ; dictionnaire ainsi que le nombre
                                   3823 ; de mots.
                                   3824 ;---------------------------------
                           000001  3825 	WLEN=1 ; word length
                           000002  3826 	LLEN=2 ; character sent to console
                           000003  3827 	WCNT=3 ; count words printed 
                           000003  3828 	VSIZE=3 
      00223A                       3829 words:
      00223A                       3830 	_vars VSIZE
      00A036 A1 02            [ 2]    1     sub sp,#VSIZE 
      00A038 27 0E            [ 1] 3831 	clr (LLEN,sp)
      00A03A A1 03            [ 1] 3832 	clr (WCNT,sp)
      00A03C 27 0D A1 82      [ 2] 3833 	ldw y,#kword_dict+2
      00A040 27               [ 1] 3834 0$:	ldw x,y
      00A041 03               [ 1] 3835 	ld a,(x)
      00A042 CC 91            [ 1] 3836 	and a,#15 
      00A044 8C FD            [ 1] 3837 	ld (WLEN,sp),a 
      00A046 20 03            [ 1] 3838 	inc (WCNT,sp)
      00A048 5C               [ 1] 3839 1$:	incw x 
      00A048 F6               [ 1] 3840 	ld a,(x)
      00A049 5F 97 C1         [ 4] 3841 	call putc 
      00A04B 0C 02            [ 1] 3842 	inc (LLEN,sp)
      00A04B 89 A6            [ 1] 3843 	dec (WLEN,sp)
      00A04D 08 CD            [ 1] 3844 	jrne 1$
      00A04F 96 15            [ 1] 3845 	ld a,#70
      00A051 85 A6            [ 1] 3846 	cp a,(LLEN,sp)
      00A053 84 81            [ 1] 3847 	jrmi 2$   
      00A055 A6 20            [ 1] 3848 	ld a,#SPACE 
      00A055 CD 83 51         [ 4] 3849 	call putc 
      00A058 5F 97            [ 1] 3850 	inc (LLEN,sp) 
      00A05A A6 84            [ 2] 3851 	jra 3$
      00A05C 81 0D            [ 1] 3852 2$: ld a,#CR 
      00A05D CD 02 C1         [ 4] 3853 	call putc 
      00A05D 5F C6            [ 1] 3854 	clr (LLEN,sp)
      00A05F 00 2B C1 00      [ 2] 3855 3$:	subw y,#2 
      00A063 2C 27            [ 2] 3856 	ldw y,(y)
      00A065 01 53            [ 1] 3857 	jrne 0$ 
      00A067 A6 84            [ 1] 3858 	ld a,#CR 
      00A069 81 02 C1         [ 4] 3859 	call putc  
      00A06A 5F               [ 1] 3860 	clrw x 
      00A06A CD 96            [ 1] 3861 	ld a,(WCNT,sp)
      00A06C 22               [ 1] 3862 	ld xl,a 
      00A06D A1 02 27         [ 4] 3863 	call print_int 
      00A070 03 CC 91         [ 2] 3864 	ldw x,#words_count_msg
      00A073 8C 03 1E         [ 4] 3865 	call puts 
      00A074                       3866 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      00A074 1E 03            [ 2]    1     addw sp,#VSIZE 
      00A076 2B               [ 4] 3867 	ret 
      00A077 17 A3 00 09 2A 12 A6  3868 words_count_msg: .asciz " words in dictionary\n"
             05 42 1C 50 00 1F 03
             1E 01 72 FB 03 A6 84
             5B
                                   3869 
                                   3870 
                                   3871 ;-----------------------------
                                   3872 ; BASIC: TIMER expr 
                                   3873 ; initialize count down timer 
                                   3874 ;-----------------------------
      0022A0                       3875 set_timer:
      00A08D 04 81 A7         [ 4] 3876 	call arg_list
      00A08F A1 01            [ 1] 3877 	cp a,#1 
      00A08F A6 0A            [ 1] 3878 	jreq 1$
      00A091 CC 91 8E         [ 2] 3879 	jp syntax_error
      00A094                       3880 1$: 
      00A094 CE               [ 2] 3881 	popw x 
      00A095 AA 80 A3         [ 2] 3882 	ldw timer,x 
      00A098 10               [ 4] 3883 	ret 
                                   3884 
                                   3885 ;------------------------------
                                   3886 ; BASIC: TIMEOUT 
                                   3887 ; return state of timer 
                                   3888 ;------------------------------
      0022AF                       3889 timeout:
      00A099 93 27 08         [ 2] 3890 	ldw x,timer 
      0022B2                       3891 logical_complement:
      00A09C CE               [ 2] 3892 	cplw x 
      00A09D AA 82 1C         [ 2] 3893 	cpw x,#-1
      00A0A0 AA 84            [ 1] 3894 	jreq 2$
      00A0A2 20               [ 1] 3895 	clrw x 
      00A0A3 03 AE            [ 1] 3896 2$:	ld a,#TK_INTGR
      00A0A5 AA               [ 4] 3897 	ret 
                                   3898 
                                   3899 ;--------------------------------
                                   3900 ; BASIC NOT(expr) 
                                   3901 ; return logical complement of expr
                                   3902 ;--------------------------------
      0022BC                       3903 func_not:
      00A0A6 80 A6 84         [ 4] 3904 	call func_args  
      00A0A9 81 01            [ 1] 3905 	cp a,#1
      00A0AA 27 03            [ 1] 3906 	jreq 1$
      00A0AA 90 89 CD         [ 2] 3907 	jp syntax_error
      00A0AD 96               [ 2] 3908 1$:	popw x 
      00A0AE 22 A1            [ 2] 3909 	jra logical_complement
                                   3910 
                                   3911 
                                   3912 
                                   3913 ;-----------------------------------
                                   3914 ; BASIC: IWDGEN expr1 
                                   3915 ; enable independant watchdog timer
                                   3916 ; expr1 is delay in multiple of 62.5µsec
                                   3917 ; expr1 -> {1..16383}
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



                                   3918 ;-----------------------------------
      0022C9                       3919 enable_iwdg:
      00A0B0 01 27 07         [ 4] 3920 	call arg_list
      00A0B3 A1 02            [ 1] 3921 	cp a,#1 
      00A0B5 27 03            [ 1] 3922 	jreq 1$
      00A0B7 CC 91 8C         [ 2] 3923 	jp syntax_error 
      00A0BA 90               [ 2] 3924 1$: popw x 
      00A0BB 85 A1            [ 1] 3925 	push #0
      00A0BD 01 27 02 85      [ 1] 3926 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A0C1 51               [ 1] 3927 	ld a,xh 
      00A0C2 90 FD            [ 1] 3928 	and a,#0x3f
      00A0C4 90               [ 1] 3929 	ld xh,a  
      00A0C5 85 81 FF         [ 2] 3930 2$:	cpw x,#255
      00A0C7 23 06            [ 2] 3931 	jrule 3$
      00A0C7 72 0D            [ 1] 3932 	inc (1,sp)
      00A0C9 52               [ 1] 3933 	rcf 
      00A0CA 30               [ 2] 3934 	rrcw x 
      00A0CB FB 8E            [ 2] 3935 	jra 2$
      00A0CD CC 8E D1 E0      [ 1] 3936 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A0D0 84               [ 1] 3937 	pop a  
      00A0D0 72 0D 52         [ 1] 3938 	ld IWDG_PR,a 
      00A0D3 30               [ 1] 3939 	ld a,xl
      00A0D4 FB               [ 1] 3940 	dec a 
      00A0D5 72 16 00 21      [ 1] 3941 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A0D9 8E 81 E2         [ 1] 3942 	ld IWDG_RLR,a 
      00A0DB 35 AA 50 E0      [ 1] 3943 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A0DB CD               [ 4] 3944 	ret 
                                   3945 
                                   3946 
                                   3947 ;-----------------------------------
                                   3948 ; BASIC: IWDGREF  
                                   3949 ; refresh independant watchdog count down 
                                   3950 ; timer before it reset MCU. 
                                   3951 ;-----------------------------------
      0022FF                       3952 refresh_iwdg:
      00A0DC 97 26 A1 84      [ 1] 3953 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A0E0 27               [ 4] 3954 	ret 
                                   3955 
                                   3956 
                                   3957 ;-------------------------------------
                                   3958 ; BASIC: LOG(expr)
                                   3959 ; return logarithm base 2 of expr 
                                   3960 ; this is the position of most significant
                                   3961 ; bit set. 
                                   3962 ; input: 
                                   3963 ; output:
                                   3964 ;   X     log2 
                                   3965 ;   A     TK_INTGR 
                                   3966 ;*********************************
      002304                       3967 log2:
      00A0E1 03 CC 91         [ 4] 3968 	call func_args 
      00A0E4 8C 01            [ 1] 3969 	cp a,#1 
      00A0E5 27 03            [ 1] 3970 	jreq 1$
      00A0E5 5D 27 04         [ 2] 3971 	jp syntax_error 
      00A0E8 8F               [ 2] 3972 1$: popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      00230F                       3973 leading_one:
      00A0E9 5A               [ 2] 3974 	tnzw x 
      00A0EA 26 F9            [ 1] 3975 	jreq 4$
      00A0EC 4F 81            [ 1] 3976 	ld a,#15 
      00A0EE 59               [ 2] 3977 2$: rlcw x 
      00A0EE CD 97            [ 1] 3978     jrc 3$
      00A0F0 26               [ 1] 3979 	dec a 
      00A0F1 A1 84            [ 2] 3980 	jra 2$
      00A0F3 27               [ 1] 3981 3$: clrw x 
      00A0F4 03               [ 1] 3982     ld xl,a
      00A0F5 CC 91            [ 1] 3983 4$:	ld a,#TK_INTGR
      00A0F7 8C               [ 4] 3984 	ret 
                                   3985 
                                   3986 ;-----------------------------------
                                   3987 ; BASIC: BIT(expr) 
                                   3988 ; expr ->{0..15}
                                   3989 ; return 2^expr 
                                   3990 ; output:
                                   3991 ;    x    2^expr 
                                   3992 ;-----------------------------------
      00A0F8                       3993 bitmask:
      00A0F8 A3 14 00         [ 4] 3994     call func_args 
      00A0FB 2B 0C            [ 1] 3995 	cp a,#1
      00A0FD 35 0F            [ 1] 3996 	jreq 1$
      00A0FF 50 F2 A6         [ 2] 3997 	jp syntax_error 
      00A102 1E               [ 2] 3998 1$: popw x 
      00A103 62               [ 1] 3999 	ld a,xl 
      00A104 A6 10            [ 1] 4000 	and a,#15
      00A106 62               [ 1] 4001 	clrw x 
      00A107 20               [ 1] 4002 	incw x 
      00A108 1E               [ 1] 4003 2$: tnz a 
      00A109 27 04            [ 1] 4004 	jreq 3$
      00A109 A3               [ 2] 4005 	slaw x 
      00A10A 08               [ 1] 4006 	dec a 
      00A10B 00 2B            [ 2] 4007 	jra 2$ 
      00A10D 09 35            [ 1] 4008 3$: ld a,#TK_INTGR
      00A10F 0E               [ 4] 4009 	ret 
                                   4010 
                                   4011 ;------------------------------
                                   4012 ; BASIC: INVERT(expr)
                                   4013 ; 1's complement 
                                   4014 ;--------------------------------
      002339                       4015 invert:
      00A110 50 F2 A6         [ 4] 4016 	call func_args
      00A113 50 62            [ 1] 4017 	cp a,#1 
      00A115 20 10            [ 1] 4018 	jreq 1$
      00A117 CC 11 0C         [ 2] 4019 	jp syntax_error
      00A117 35               [ 2] 4020 1$: popw x  
      00A118 07               [ 2] 4021 	cplw x 
      00A119 50 F2            [ 1] 4022 	ld a,#TK_INTGR 
      00A11B 81               [ 4] 4023 	ret 
                                   4024 
                                   4025 ;------------------------------
                                   4026 ; BASIC: DO 
                                   4027 ; initiate a DO ... UNTIL loop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



                                   4028 ;------------------------------
                           000003  4029 	DOLP_ADR=3 
                           000005  4030 	DOLP_INW=5
                           000004  4031 	VSIZE=4 
      002348                       4032 do_loop:
      00A11B A3               [ 2] 4033 	popw x 
      002349                       4034 	_vars VSIZE 
      00A11C 00 40            [ 2]    1     sub sp,#VSIZE 
      00A11E 23               [ 2] 4035 	pushw x 
      00A11F 07 72 5C 50      [ 2] 4036 	ldw y,basicptr 
      00A123 F2 54            [ 2] 4037 	ldw (DOLP_ADR,sp),y
      00A125 20 F4 00 00      [ 2] 4038 	ldw y,in.w 
      00A127 17 05            [ 2] 4039 	ldw (DOLP_INW,sp),y
      00A127 9F 4A 27 01      [ 1] 4040 	inc loop_depth 
      00A12B 4A               [ 4] 4041 	ret 
                                   4042 
                                   4043 ;--------------------------------
                                   4044 ; BASIC: UNTIL expr 
                                   4045 ; loop if exprssion is false 
                                   4046 ; else terminate loop
                                   4047 ;--------------------------------
      00A12C                       4048 until: 
      00A12C A4 3E C7 50      [ 1] 4049 	tnz loop_depth 
      00A130 F1 72            [ 1] 4050 	jrne 1$ 
      00A132 18 50 F0         [ 2] 4051 	jp syntax_error 
      002366                       4052 1$: 
      00A135 8E 81 EF         [ 4] 4053 	call relation 
      00A137 A1 84            [ 1] 4054 	cp a,#TK_INTGR
      00A137 CE 00            [ 1] 4055 	jreq 2$
      00A139 0F A6 84         [ 2] 4056 	jp syntax_error
      002370                       4057 2$: 
      00A13C 81               [ 2] 4058 	tnzw x 
      00A13D 26 10            [ 1] 4059 	jrne 9$
      00A13D CD 96            [ 2] 4060 	ldw x,(DOLP_ADR,sp)
      00A13F 22 A1 01         [ 2] 4061 	ldw basicptr,x 
      00A142 27 03            [ 1] 4062 	ld a,(2,x)
      00A144 CC 91 8C         [ 1] 4063 	ld count,a 
      00A147 1E 05            [ 2] 4064 	ldw x,(DOLP_INW,sp)
      00A147 85 9E A5         [ 2] 4065 	ldw in.w,x 
      00A14A 80               [ 4] 4066 	ret 
      002383                       4067 9$:	; remove loop data from stack  
      00A14B 27               [ 2] 4068 	popw x
      002384                       4069 	_drop VSIZE
      00A14C 01 50            [ 2]    1     addw sp,#VSIZE 
      00A14E A6 84 81 1D      [ 1] 4070 	dec loop_depth 
      00A151 FC               [ 2] 4071 	jp (x)
                                   4072 
                                   4073 ;--------------------------
                                   4074 ; BASIC: PRTA...PRTI  
                                   4075 ;  return constant value 
                                   4076 ;  PORT  offset in GPIO
                                   4077 ;  array
                                   4078 ;---------------------------
      00238B                       4079 const_porta:
      00A151 CD 96 22         [ 2] 4080 	ldw x,#0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      00A154 A1 02            [ 1] 4081 	ld a,#TK_INTGR 
      00A156 27               [ 4] 4082 	ret 
      002391                       4083 const_portb:
      00A157 03 CC 91         [ 2] 4084 	ldw x,#1
      00A15A 8C 85            [ 1] 4085 	ld a,#TK_INTGR 
      00A15C 9E               [ 4] 4086 	ret 
      002397                       4087 const_portc:
      00A15D 14 01 95         [ 2] 4088 	ldw x,#2
      00A160 9F 14            [ 1] 4089 	ld a,#TK_INTGR 
      00A162 02               [ 4] 4090 	ret 
      00239D                       4091 const_portd:
      00A163 97 5B 02         [ 2] 4092 	ldw x,#3
      00A166 A6 84            [ 1] 4093 	ld a,#TK_INTGR 
      00A168 81               [ 4] 4094 	ret 
      00A169                       4095 const_porte:
      00A169 CD 96 22         [ 2] 4096 	ldw x,#4
      00A16C A1 02            [ 1] 4097 	ld a,#TK_INTGR 
      00A16E 27               [ 4] 4098 	ret 
      0023A9                       4099 const_portf:
      00A16F 03 CC 91         [ 2] 4100 	ldw x,#5
      00A172 8C 84            [ 1] 4101 	ld a,#TK_INTGR 
      00A173 81               [ 4] 4102 	ret 
      0023AF                       4103 const_portg:
      00A173 85 9E 1A         [ 2] 4104 	ldw x,#6
      00A176 01 95            [ 1] 4105 	ld a,#TK_INTGR 
      00A178 9F               [ 4] 4106 	ret 
      0023B5                       4107 const_porth:
      00A179 1A 02 97         [ 2] 4108 	ldw x,#7
      00A17C 5B 02            [ 1] 4109 	ld a,#TK_INTGR 
      00A17E A6               [ 4] 4110 	ret 
      0023BB                       4111 const_porti:
      00A17F 84 81 08         [ 2] 4112 	ldw x,#8
      00A181 A6 84            [ 1] 4113 	ld a,#TK_INTGR 
      00A181 CD               [ 4] 4114 	ret 
                                   4115 
                                   4116 ;-------------------------------
                                   4117 ; following return constant 
                                   4118 ; related to GPIO register offset 
                                   4119 ;---------------------------------
      0023C1                       4120 const_odr:
      00A182 96 22            [ 1] 4121 	ld a,#TK_INTGR 
      00A184 A1 02 27         [ 2] 4122 	ldw x,#GPIO_ODR
      00A187 03               [ 4] 4123 	ret 
      0023C7                       4124 const_idr:
      00A188 CC 91            [ 1] 4125 	ld a,#TK_INTGR 
      00A18A 8C 00 01         [ 2] 4126 	ldw x,#GPIO_IDR
      00A18B 81               [ 4] 4127 	ret 
      0023CD                       4128 const_ddr:
      00A18B 85 9E            [ 1] 4129 	ld a,#TK_INTGR 
      00A18D 18 01 95         [ 2] 4130 	ldw x,#GPIO_DDR
      00A190 9F               [ 4] 4131 	ret 
      0023D3                       4132 const_cr1:
      00A191 18 02            [ 1] 4133 	ld a,#TK_INTGR 
      00A193 97 5B 02         [ 2] 4134 	ldw x,#GPIO_CR1
      00A196 A6               [ 4] 4135 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      0023D9                       4136 const_cr2:
      00A197 84 81            [ 1] 4137 	ld a,#TK_INTGR 
      00A199 AE 00 04         [ 2] 4138 	ldw x,#GPIO_CR2
      00A199 CD               [ 4] 4139 	ret 
                                   4140 ;-------------------------
                                   4141 ; BASIC: POUT 
                                   4142 ;  constant for port mode
                                   4143 ;  used by PMODE 
                                   4144 ;  to set pin as output
                                   4145 ;------------------------
      0023DF                       4146 const_output:
      00A19A 96 22            [ 1] 4147 	ld a,#TK_INTGR 
      00A19C A1 02 27         [ 2] 4148 	ldw x,#OUTP
      00A19F 03               [ 4] 4149 	ret 
                                   4150 
                                   4151 ;-------------------------
                                   4152 ; BASIC: PINP 
                                   4153 ;  constant for port mode
                                   4154 ;  used by PMODE 
                                   4155 ;  to set pin as input
                                   4156 ;------------------------
      0023E5                       4157 const_input:
      00A1A0 CC 91            [ 1] 4158 	ld a,#TK_INTGR 
      00A1A2 8C 90 85         [ 2] 4159 	ldw x,#INP 
      00A1A5 85               [ 4] 4160 	ret 
                                   4161 	
                                   4162 ;-----------------------
                                   4163 ; memory area constants
                                   4164 ;-----------------------
      0023EB                       4165 const_eeprom_base:
      00A1A6 90 5D            [ 1] 4166 	ld a,#TK_INTGR 
      00A1A8 27 05 58         [ 2] 4167 	ldw x,#EEPROM_BASE 
      00A1AB 90               [ 4] 4168 	ret 
                                   4169 
                                   4170 ;---------------------------
                                   4171 ; BASIC: DATA 
                                   4172 ; when the interpreter find 
                                   4173 ; a DATA line it skip it.
                                   4174 ;---------------------------
      0023F1                       4175 data:
      00A1AC 5A 26 FB 00 01   [ 1] 4176 	mov in,count 
      00A1AF 81               [ 4] 4177 	ret 
                                   4178 
                                   4179 ;---------------------------
                                   4180 ; BASIC: DATLN  *expr*
                                   4181 ; set DATA pointer at line# 
                                   4182 ; specified by *expr* 
                                   4183 ;---------------------------
      0023F7                       4184 data_line:
      00A1AF A6 84 81         [ 4] 4185 	call expression
      00A1B2 A1 84            [ 1] 4186 	cp a,#TK_INTGR
      00A1B2 CD 96            [ 1] 4187 	jreq 1$
      00A1B4 22 A1 02         [ 2] 4188 	jp syntax_error  
      00A1B7 27               [ 1] 4189 1$: clr a 
      00A1B8 03 CC 91         [ 4] 4190 	call search_lineno
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      00A1BB 8C               [ 2] 4191 	tnzw x 
      00A1BC 90 85            [ 1] 4192 	jrne 3$
      00A1BE 85 90            [ 1] 4193 2$:	ld a,#ERR_NO_LINE 
      00A1C0 5D 27 05         [ 2] 4194 	jp tb_error
      00240D                       4195 3$: ; check if valid data line 
      00A1C3 54 90            [ 1] 4196     ldw y,x 
      00A1C5 5A 26            [ 2] 4197 	ldw x,(4,x)
      00A1C7 FB 23 F1         [ 2] 4198 	cpw x,#data 
      00A1C8 26 F2            [ 1] 4199 	jrne 2$ 
      00A1C8 A6 84 81 06      [ 2] 4200 	ldw data_ptr,y
      00A1CB 90 E6 02         [ 1] 4201 	ld a,(2,y)
      00A1CB A6 84 CD         [ 1] 4202 	ld data_len,a 
      00A1CE 96 15 9F A4      [ 1] 4203 	mov data_ofs,#FIRST_DATA_ITEM 
      00A1D2 07               [ 4] 4204 	ret
                                   4205 
                                   4206 ;---------------------------------
                                   4207 ; BASIC: RESTORE 
                                   4208 ; set data_ptr to first data line
                                   4209 ; if not DATA found pointer set to
                                   4210 ; zero 
                                   4211 ;---------------------------------
      002425                       4212 restore:
      00A1D3 C7 50 C6 81      [ 1] 4213 	clr data_ptr 
      00A1D7 72 5F 00 07      [ 1] 4214 	clr data_ptr+1
      00A1D7 52 01 CD 96      [ 1] 4215 	clr data_ofs 
      00A1DB 27 A1 02 27      [ 1] 4216 	clr data_len
      00A1DF 03 CC 91         [ 2] 4217 	ldw x,txtbgn
      002438                       4218 data_search_loop: 	
      00A1E2 8C 90 85         [ 2] 4219 	cpw x,txtend
      00A1E5 85 CD            [ 1] 4220 	jruge 9$
      00A1E7 A2 23            [ 1] 4221 	ldw y,x 
      00A1E9 6B 01            [ 2] 4222 	ldw x,(4,x)
      00A1EB A6 01 0D         [ 2] 4223 	addw x,#code_addr
      00A1EE 01               [ 2] 4224 	ldw x,(x)
      00A1EF 27 0D 48         [ 2] 4225 	cpw x,#data 
      00A1F2 0A 01            [ 1] 4226 	jrne try_next_line 
      00A1F4 26 FB 6B 01      [ 2] 4227 	ldw data_ptr,y 
      00A1F8 7B 01 EA         [ 1] 4228 	ld a,(2,y)
      00A1FB 03 E7 03         [ 1] 4229 	ld data_len,a 
      00A1FE 90 A3 00 01      [ 1] 4230 	mov data_ofs,#FIRST_DATA_ITEM
      00A202 27 10 7B 01      [ 1] 4231 9$:	tnz data_len 
      00A206 43 E4            [ 1] 4232     jrne 10$
      00A208 04 E7            [ 1] 4233 	ld a,#ERR_NO_DATA 
      00A20A 04 7B 01         [ 2] 4234 	jp tb_error 
      00A20D 43               [ 4] 4235 10$:ret
      002464                       4236 try_next_line:
      00A20E E4               [ 1] 4237 	ldw x,y 
      00A20F 02 E7            [ 1] 4238 	ld a,(2,x)
      00A211 02 20 0C         [ 1] 4239 	ld acc8,a 
      00A214 72 5F 00 0C      [ 1] 4240 	clr acc16 
      00A214 7B 01 EA 02      [ 2] 4241 	addw x,acc16 
      00A218 E7 02            [ 2] 4242 	jra data_search_loop
                                   4243 
                                   4244 
                                   4245 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



                                   4246 ; BASIC: READ 
                                   4247 ; return next data item | 0 
                                   4248 ;---------------------------------
                           000001  4249 	CTX_BPTR=1 
                           000003  4250 	CTX_IN=3 
                           000004  4251 	CTX_COUNT=4 
                           000005  4252 	XSAVE=5
                           000006  4253 	VSIZE=6
      002474                       4254 read:
      002474                       4255 	_vars  VSIZE 
      00A21A 7B 01            [ 2]    1     sub sp,#VSIZE 
      002476                       4256 read01:	
      00A21C EA 04 E7         [ 1] 4257 	ld a,data_ofs
      00A21F 04 00 09         [ 1] 4258 	cp a,data_len 
      00A220 27 37            [ 1] 4259 	jreq 2$ ; end of line  
      00A220 5B 01 81         [ 4] 4260 	call save_context
      00A223 CE 00 06         [ 2] 4261 	ldw x,data_ptr 
      00A223 58 1C A2         [ 2] 4262 	ldw basicptr,x 
      00A226 33 FE 9F 88 5E   [ 1] 4263 	mov in,data_ofs 
      00A22B A6 05 42 1C 50   [ 1] 4264 	mov count,data_len  
      00A230 00 84 81         [ 4] 4265 	call expression 
      00A233 A1 84            [ 1] 4266 	cp a,#TK_INTGR 
      00A233 03 06            [ 1] 4267 	jreq 1$ 
      00A235 03 05 04         [ 2] 4268 	jp syntax_error 
      00249B                       4269 1$:
      00A238 00 02            [ 2] 4270 	ldw (XSAVE,SP),x
      00A23A 01 06 00         [ 4] 4271 	call next_token ; skip comma
      00A23D 02 02 02         [ 2] 4272 	ldw x,basicptr 
      00A240 03 03 01         [ 2] 4273 	ldw data_ptr,x 
      00A243 03 03 02 04 04   [ 1] 4274 	mov data_ofs,in 
      00A248 05 02 06         [ 4] 4275 	call rest_context
      00A24B 02 07            [ 2] 4276 	ldw x,(XSAVE,sp)
      00A24D 02 05            [ 1] 4277 	ld a,#TK_INTGR
      0024B2                       4278 	_drop VSIZE 
      00A24F 04 02            [ 2]    1     addw sp,#VSIZE 
      00A251 04               [ 4] 4279 	ret 
      0024B5                       4280 2$: ; end of line reached 
      00A252 01 CE 00 06      [ 2] 4281 	ldw y, data_ptr 
      00A253 72 5F 00 06      [ 1] 4282 	clr data_ptr
      00A253 CD 96 22 A1      [ 1] 4283 	clr data_ptr+1   
      00A257 01 27 03 CC      [ 1] 4284 	clr data_ofs 
      00A25B 91 8C 00 09      [ 1] 4285 	clr data_len 
      00A25D CD 24 64         [ 4] 4286 	call try_next_line 
      00A25D A6 80            [ 2] 4287 	jra read01
                                   4288 
                                   4289 
                                   4290 ;---------------------------------
                                   4291 ; BASIC: SPIEN clkdiv, 0|1  
                                   4292 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4293 ; if clkdiv==-1 disable SPI
                                   4294 ; 0|1 -> disable|enable  
                                   4295 ;--------------------------------- 
                           000005  4296 SPI_CS_BIT=5
      0024CE                       4297 spi_enable:
      00A25F 15 01 27         [ 4] 4298 	call arg_list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      00A262 05 A6            [ 1] 4299 	cp a,#2
      00A264 0A CC            [ 1] 4300 	jreq 1$
      00A266 91 8E 0C         [ 2] 4301 	jp syntax_error 
      00A268                       4302 1$: 
      00A268 CE 00 13 58      [ 1] 4303 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A26C 58               [ 2] 4304 	popw x  
      00A26D 58               [ 2] 4305 	tnzw x 
      00A26E 58 58            [ 1] 4306 	jreq spi_disable 
      00A270 9E               [ 2] 4307 	popw x 
      00A271 C8 00            [ 1] 4308 	ld a,#(1<<SPI_CR1_BR)
      00A273 13               [ 4] 4309 	mul x,a 
      00A274 C7               [ 1] 4310 	ld a,xl 
      00A275 00 0D 9F         [ 1] 4311 	ld SPI_CR1,a 
                                   4312 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A278 C8 00 14 C7      [ 1] 4313 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A27C 00 0E CE 00      [ 1] 4314 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4315 ; configure SPI as master mode 0.	
      00A280 15 CF 00 13      [ 1] 4316 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4317 ; ~CS line controlled by sofware 	
      00A284 90 54 90 9E      [ 1] 4318 	bset SPI_CR2,#SPI_CR2_SSM 
      00A288 C8 00 15 C7      [ 1] 4319     bset SPI_CR2,#SPI_CR2_SSI 
                                   4320 ; enable SPI
      00A28C 00 15 90 9F      [ 1] 4321 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A290 C8               [ 4] 4322 	ret 
      002501                       4323 spi_disable:
      002501                       4324 	_drop #2; throw first argument.
      00A291 00 16            [ 2]    1     addw sp,##2 
                                   4325 ; wait spi idle 
      00A293 C7 00            [ 1] 4326 1$:	ld a,#0x82 
      00A295 16 CE 00         [ 1] 4327 	and a,SPI_SR
      00A298 0D 54            [ 1] 4328 	cp a,#2 
      00A29A 54 54            [ 1] 4329 	jrne 1$
      00A29C 9E C8 00 0D      [ 1] 4330 	bres SPI_CR1,#SPI_CR1_SPE
      00A2A0 95 9F C8 00      [ 1] 4331 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A2A4 0E 97 C8 00      [ 1] 4332 	bres PE_DDR,#SPI_CS_BIT 
      00A2A8 16               [ 4] 4333 	ret 
                                   4334 
      002519                       4335 spi_clear_error:
      00A2A9 97 9E            [ 1] 4336 	ld a,#0x78 
      00A2AB C8 00 15         [ 1] 4337 	bcp a,SPI_SR 
      00A2AE 95 CF            [ 1] 4338 	jreq 1$
      00A2B0 00 15 90 85      [ 1] 4339 	clr SPI_SR 
      00A2B4 65               [ 4] 4340 1$: ret 
                                   4341 
      002525                       4342 spi_send_byte:
      00A2B5 93               [ 1] 4343 	push a 
      00A2B6 5C 25 19         [ 4] 4344 	call spi_clear_error
      00A2B7 84               [ 1] 4345 	pop a 
      00A2B7 A6 84 81 03 FB   [ 2] 4346 	btjf SPI_SR,#SPI_SR_TXE,.
      00A2BA C7 52 04         [ 1] 4347 	ld SPI_DR,a
      00A2BA 52 03 0F 02 0F   [ 2] 4348 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A2BF 03 90 AE         [ 1] 4349 	ld a,SPI_DR 
      00A2C2 A9               [ 4] 4350 	ret 
                                   4351 
      00253B                       4352 spi_rcv_byte:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      00A2C3 9A 93            [ 1] 4353 	ld a,#255
      00A2C5 F6 A4 0F 6B 01   [ 2] 4354 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A2CA 0C 03 5C         [ 1] 4355 	ld a,SPI_DR 
      00A2CD F6               [ 4] 4356 	ret
                                   4357 
                                   4358 ;------------------------------
                                   4359 ; BASIC: SPIWR byte [,byte]
                                   4360 ; write 1 or more byte
                                   4361 ;------------------------------
      002546                       4362 spi_write:
      00A2CE CD 83 41         [ 4] 4363 	call expression
      00A2D1 0C 02            [ 1] 4364 	cp a,#TK_INTGR 
      00A2D3 0A 01            [ 1] 4365 	jreq 1$
      00A2D5 26 F5 A6         [ 2] 4366 	jp syntax_error 
      002550                       4367 1$:	
      00A2D8 46               [ 1] 4368 	ld a,xl 
      00A2D9 11 02 2B         [ 4] 4369 	call spi_send_byte 
      00A2DC 09 A6 20         [ 4] 4370 	call next_token 
      00A2DF CD 83            [ 1] 4371 	cp a,#TK_COMMA 
      00A2E1 41 0C            [ 1] 4372 	jrne 2$ 
      00A2E3 02 20            [ 2] 4373 	jra spi_write 
      00A2E5 07               [ 1] 4374 2$:	tnz a 
      00A2E6 A6 0D            [ 1] 4375 	jreq 3$
      002560                       4376 	_unget_token  
      00A2E8 CD 83 41 0F 02   [ 1]    1      mov in,in.saved  
      00A2ED 72               [ 4] 4377 3$:	ret 
                                   4378 
                                   4379 
                                   4380 ;-------------------------------
                                   4381 ; BASIC: SPIRD 	
                                   4382 ; read one byte from SPI 
                                   4383 ;-------------------------------
      002566                       4384 spi_read:
      00A2EE A2 00 02         [ 4] 4385 	call spi_rcv_byte 
      00A2F1 90               [ 1] 4386 	clrw x 
      00A2F2 FE               [ 1] 4387 	ld xl,a 
      00A2F3 26 CF            [ 1] 4388 	ld a,#TK_INTGR 
      00A2F5 A6               [ 4] 4389 	ret 
                                   4390 
                                   4391 ;------------------------------
                                   4392 ; BASIC: SPISEL 0|1 
                                   4393 ; set state of ~CS line
                                   4394 ; 0|1 deselect|select  
                                   4395 ;------------------------------
      00256E                       4396 spi_select:
      00A2F6 0D CD 83         [ 4] 4397 	call next_token 
      00A2F9 41 5F            [ 1] 4398 	cp a,#TK_INTGR 
      00A2FB 7B 03            [ 1] 4399 	jreq 1$
      00A2FD 97 CD 92         [ 2] 4400 	jp syntax_error 
      00A300 C9               [ 2] 4401 1$: tnzw x  
      00A301 AE A3            [ 1] 4402 	jreq cs_high 
      00A303 0A CD 83 9E      [ 1] 4403 	bres PE_ODR,#SPI_CS_BIT
      00A307 5B               [ 4] 4404 	ret 
      002580                       4405 cs_high: 
      00A308 03 81 20 77      [ 1] 4406 	bset PE_ODR,#SPI_CS_BIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      00A30C 6F               [ 4] 4407 	ret 
                                   4408 
                                   4409 ;-------------------------------
                                   4410 ; BASIC: PAD 
                                   4411 ; Return pad buffer address.
                                   4412 ;------------------------------
      002585                       4413 pad_ref:
      00A30D 72 64 73         [ 2] 4414 	ldw x,#pad 
      00A310 20 69            [ 1] 4415 	ld a,TK_INTGR
      00A312 6E               [ 4] 4416 	ret 
                                   4417 
                                   4418 
                                   4419 ;------------------------------
                                   4420 ;      dictionary 
                                   4421 ; format:
                                   4422 ;   link:   2 bytes 
                                   4423 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   4424 ;   cmd_name: 16 byte max 
                                   4425 ;   cmd_index: 2 bytes 
                                   4426 ;------------------------------
                                   4427 	.macro _dict_entry len,name,cmd_idx 
                                   4428 	.word LINK 
                                   4429 	LINK=.
                                   4430 name:
                                   4431 	.byte len 	
                                   4432 	.ascii "name"
                                   4433 	.word cmd_idx 
                                   4434 	.endm 
                                   4435 
                           000000  4436 	LINK=0
                                   4437 ; respect alphabetic order for BASIC names from Z-A
                                   4438 ; this sort order is for a cleaner WORDS cmd output. 	
      00258B                       4439 kword_end:
      00258B                       4440 	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
      00A313 20 64                    1 	.word LINK 
                           00258D     2 	LINK=.
      00258D                          3 XOR:
      00A315 69                       4 	.byte 3+F_IFUNC 	
      00A316 63 74 69                 5 	.ascii "XOR"
      00A319 6F 6E                    6 	.word XOR_IDX 
      002593                       4441 	_dict_entry,5,WRITE,WRITE_IDX;write  
      00A31B 61 72                    1 	.word LINK 
                           002595     2 	LINK=.
      002595                          3 WRITE:
      00A31D 79                       4 	.byte 5 	
      00A31E 0A 00 49 54 45           5 	.ascii "WRITE"
      00A320 00 C0                    6 	.word WRITE_IDX 
      00259D                       4442 	_dict_entry,5,WORDS,WORDS_IDX;words 
      00A320 CD 96                    1 	.word LINK 
                           00259F     2 	LINK=.
      00259F                          3 WORDS:
      00A322 27                       4 	.byte 5 	
      00A323 A1 01 27 03 CC           5 	.ascii "WORDS"
      00A328 91 8C                    6 	.word WORDS_IDX 
      00A32A                       4443 	_dict_entry 4,WAIT,WAIT_IDX;wait 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00A32A 85 CF                    1 	.word LINK 
                           0025A9     2 	LINK=.
      0025A9                          3 WAIT:
      00A32C 00                       4 	.byte 4 	
      00A32D 11 81 49 54              5 	.ascii "WAIT"
      00A32F 00 BC                    6 	.word WAIT_IDX 
      0025B0                       4444 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      00A32F CE 00                    1 	.word LINK 
                           0025B2     2 	LINK=.
      0025B2                          3 USR:
      00A331 11                       4 	.byte 3+F_IFUNC 	
      00A332 55 53 52                 5 	.ascii "USR"
      00A332 53 A3                    6 	.word USR_IDX 
      0025B8                       4445 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      00A334 FF FF                    1 	.word LINK 
                           0025BA     2 	LINK=.
      0025BA                          3 UNTIL:
      00A336 27                       4 	.byte 5 	
      00A337 01 5F A6 84 81           5 	.ascii "UNTIL"
      00A33C 00 B8                    6 	.word UNTIL_IDX 
      0025C2                       4446 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      00A33C CD 96                    1 	.word LINK 
                           0025C4     2 	LINK=.
      0025C4                          3 UFLASH:
      00A33E 22                       4 	.byte 6+F_IFUNC 	
      00A33F A1 01 27 03 CC 91        5 	.ascii "UFLASH"
      00A345 8C 85                    6 	.word UFLASH_IDX 
      0025CD                       4447 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      00A347 20 E9                    1 	.word LINK 
                           0025CF     2 	LINK=.
      00A349                          3 UBOUND:
      00A349 CD                       4 	.byte 6+F_IFUNC 	
      00A34A 96 27 A1 01 27 03        5 	.ascii "UBOUND"
      00A350 CC 91                    6 	.word UBOUND_IDX 
      0025D8                       4448 	_dict_entry,4,TONE,TONE_IDX;tone  
      00A352 8C 85                    1 	.word LINK 
                           0025DA     2 	LINK=.
      0025DA                          3 TONE:
      00A354 4B                       4 	.byte 4 	
      00A355 00 35 CC 50              5 	.ascii "TONE"
      00A359 E0 9E                    6 	.word TONE_IDX 
      0025E1                       4449 	_dict_entry,2,TO,TO_IDX;to
      00A35B A4 3F                    1 	.word LINK 
                           0025E3     2 	LINK=.
      0025E3                          3 TO:
      00A35D 95                       4 	.byte 2 	
      00A35E A3 00                    5 	.ascii "TO"
      00A360 FF 23                    6 	.word TO_IDX 
      0025E8                       4450 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00A362 06 0C                    1 	.word LINK 
                           0025EA     2 	LINK=.
      0025EA                          3 TIMER:
      00A364 01                       4 	.byte 5 	
      00A365 98 56 20 F5 35           5 	.ascii "TIMER"
      00A36A 55 50                    6 	.word TIMER_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      0025F2                       4451 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00A36C E0 84                    1 	.word LINK 
                           0025F4     2 	LINK=.
      0025F4                          3 TIMEOUT:
      00A36E C7                       4 	.byte 7+F_IFUNC 	
      00A36F 50 E1 9F 4A 35 55 50     5 	.ascii "TIMEOUT"
      00A376 E0 C7                    6 	.word TMROUT_IDX 
      0025FE                       4452 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00A378 50 E2                    1 	.word LINK 
                           002600     2 	LINK=.
      002600                          3 TICKS:
      00A37A 35                       4 	.byte 5+F_IFUNC 	
      00A37B AA 50 E0 81 53           5 	.ascii "TICKS"
      00A37F 00 AA                    6 	.word TICKS_IDX 
      002608                       4453 	_dict_entry,4,STOP,STOP_IDX;stop 
      00A37F 35 AA                    1 	.word LINK 
                           00260A     2 	LINK=.
      00260A                          3 STOP:
      00A381 50                       4 	.byte 4 	
      00A382 E0 81 4F 50              5 	.ascii "STOP"
      00A384 00 A8                    6 	.word STOP_IDX 
      002611                       4454 	_dict_entry,4,STEP,STEP_IDX;step 
      00A384 CD 96                    1 	.word LINK 
                           002613     2 	LINK=.
      002613                          3 STEP:
      00A386 22                       4 	.byte 4 	
      00A387 A1 01 27 03              5 	.ascii "STEP"
      00A38B CC 91                    6 	.word STEP_IDX 
      00261A                       4455 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      00A38D 8C 85                    1 	.word LINK 
                           00261C     2 	LINK=.
      00A38F                          3 SPIWR:
      00A38F 5D                       4 	.byte 5 	
      00A390 27 0A A6 0F 59           5 	.ascii "SPIWR"
      00A395 25 03                    6 	.word SPIWR_IDX 
      002624                       4456 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00A397 4A 20                    1 	.word LINK 
                           002626     2 	LINK=.
      002626                          3 SPISEL:
      00A399 FA                       4 	.byte 6 	
      00A39A 5F 97 A6 84 81 4C        5 	.ascii "SPISEL"
      00A39F 00 A2                    6 	.word SPISEL_IDX 
      00262F                       4457 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      00A39F CD 96                    1 	.word LINK 
                           002631     2 	LINK=.
      002631                          3 SPIRD:
      00A3A1 22                       4 	.byte 5+F_IFUNC 	
      00A3A2 A1 01 27 03 CC           5 	.ascii "SPIRD"
      00A3A7 91 8C                    6 	.word SPIRD_IDX 
      002639                       4458 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      00A3A9 85 9F                    1 	.word LINK 
                           00263B     2 	LINK=.
      00263B                          3 SPIEN:
      00A3AB A4                       4 	.byte 5 	
      00A3AC 0F 5F 5C 4D 27           5 	.ascii "SPIEN"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00A3B1 04 58                    6 	.word SPIEN_IDX 
      002643                       4459 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      00A3B3 4A 20                    1 	.word LINK 
                           002645     2 	LINK=.
      002645                          3 SLEEP:
      00A3B5 F9                       4 	.byte 5 	
      00A3B6 A6 84 81 45 50           5 	.ascii "SLEEP"
      00A3B9 00 9C                    6 	.word SLEEP_IDX 
      00264D                       4460     _dict_entry,4,SIZE,SIZE_IDX; cmd_size 
      00A3B9 CD 96                    1 	.word LINK 
                           00264F     2 	LINK=.
      00264F                          3 SIZE:
      00A3BB 22                       4 	.byte 4 	
      00A3BC A1 01 27 03              5 	.ascii "SIZE"
      00A3C0 CC 91                    6 	.word SIZE_IDX 
      002656                       4461 	_dict_entry,4,SHOW,SHOW_IDX;show 
      00A3C2 8C 85                    1 	.word LINK 
                           002658     2 	LINK=.
      002658                          3 SHOW:
      00A3C4 53                       4 	.byte 4 	
      00A3C5 A6 84 81 57              5 	.ascii "SHOW"
      00A3C8 00 98                    6 	.word SHOW_IDX 
      00265F                       4462 	_dict_entry,4,SAVE,SAVE_IDX ;save_app 
      00A3C8 85 52                    1 	.word LINK 
                           002661     2 	LINK=.
      002661                          3 SAVE:
      00A3CA 04                       4 	.byte 4 	
      00A3CB 89 90 CE 00              5 	.ascii "SAVE"
      00A3CF 05 17                    6 	.word SAVE_IDX 
      002668                       4463 	_dict_entry 3,RUN,RUN_IDX;run
      00A3D1 03 90                    1 	.word LINK 
                           00266A     2 	LINK=.
      00266A                          3 RUN:
      00A3D3 CE                       4 	.byte 3 	
      00A3D4 00 01 17                 5 	.ascii "RUN"
      00A3D7 05 72                    6 	.word RUN_IDX 
      002670                       4464 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      00A3D9 5C 00                    1 	.word LINK 
                           002672     2 	LINK=.
      002672                          3 RSHIFT:
      00A3DB 1E                       4 	.byte 6+F_IFUNC 	
      00A3DC 81 53 48 49 46 54        5 	.ascii "RSHIFT"
      00A3DD 00 94                    6 	.word RSHIFT_IDX 
      00267B                       4465 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      00A3DD 72 5D                    1 	.word LINK 
                           00267D     2 	LINK=.
      00267D                          3 RND:
      00A3DF 00                       4 	.byte 3+F_IFUNC 	
      00A3E0 1E 26 03                 5 	.ascii "RND"
      00A3E3 CC 91                    6 	.word RND_IDX 
      002683                       4466 	_dict_entry,6,RETURN,RET_IDX;return 
      00A3E5 8C 7D                    1 	.word LINK 
                           002685     2 	LINK=.
      00A3E6                          3 RETURN:
      00A3E6 CD                       4 	.byte 6 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00A3E7 97 6F A1 84 27 03        5 	.ascii "RETURN"
      00A3ED CC 91                    6 	.word RET_IDX 
      00268E                       4467 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00A3EF 8C 85                    1 	.word LINK 
                           002690     2 	LINK=.
      00A3F0                          3 RESTORE:
      00A3F0 5D                       4 	.byte 7 	
      00A3F1 26 10 1E 03 CF 00 05     5 	.ascii "RESTORE"
      00A3F8 E6 02                    6 	.word REST_IDX 
      00269A                       4468 	_dict_entry 6,REMARK,REM_IDX;remark 
      00A3FA C7 00                    1 	.word LINK 
                           00269C     2 	LINK=.
      00269C                          3 REMARK:
      00A3FC 04                       4 	.byte 6 	
      00A3FD 1E 05 CF 00 01 81        5 	.ascii "REMARK"
      00A403 00 8C                    6 	.word REM_IDX 
      0026A5                       4469 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      00A403 85 5B                    1 	.word LINK 
                           0026A7     2 	LINK=.
      0026A7                          3 REBOOT:
      00A405 04                       4 	.byte 6 	
      00A406 72 5A 00 1E FC 54        5 	.ascii "REBOOT"
      00A40B 00 8A                    6 	.word RBT_IDX 
      0026B0                       4470 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      00A40B AE 00                    1 	.word LINK 
                           0026B2     2 	LINK=.
      0026B2                          3 READ:
      00A40D 00                       4 	.byte 4+F_IFUNC 	
      00A40E A6 84 81 44              5 	.ascii "READ"
      00A411 00 88                    6 	.word READ_IDX 
      0026B9                       4471 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      00A411 AE 00                    1 	.word LINK 
                           0026BB     2 	LINK=.
      0026BB                          3 QKEY:
      00A413 01                       4 	.byte 4+F_IFUNC 	
      00A414 A6 84 81 59              5 	.ascii "QKEY"
      00A417 00 86                    6 	.word QKEY_IDX 
      0026C2                       4472 	_dict_entry,4+F_IFUNC,PRTI,PRTI_IDX;const_porti 
      00A417 AE 00                    1 	.word LINK 
                           0026C4     2 	LINK=.
      0026C4                          3 PRTI:
      00A419 02                       4 	.byte 4+F_IFUNC 	
      00A41A A6 84 81 49              5 	.ascii "PRTI"
      00A41D 00 84                    6 	.word PRTI_IDX 
      0026CB                       4473 	_dict_entry,4+F_IFUNC,PRTH,PRTH_IDX;const_porth 
      00A41D AE 00                    1 	.word LINK 
                           0026CD     2 	LINK=.
      0026CD                          3 PRTH:
      00A41F 03                       4 	.byte 4+F_IFUNC 	
      00A420 A6 84 81 48              5 	.ascii "PRTH"
      00A423 00 82                    6 	.word PRTH_IDX 
      0026D4                       4474 	_dict_entry,4+F_IFUNC,PRTG,PRTG_IDX;const_portg 
      00A423 AE 00                    1 	.word LINK 
                           0026D6     2 	LINK=.
      0026D6                          3 PRTG:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00A425 04                       4 	.byte 4+F_IFUNC 	
      00A426 A6 84 81 47              5 	.ascii "PRTG"
      00A429 00 80                    6 	.word PRTG_IDX 
      0026DD                       4475 	_dict_entry,4+F_IFUNC,PRTF,PRTF_IDX;const_portf
      00A429 AE 00                    1 	.word LINK 
                           0026DF     2 	LINK=.
      0026DF                          3 PRTF:
      00A42B 05                       4 	.byte 4+F_IFUNC 	
      00A42C A6 84 81 46              5 	.ascii "PRTF"
      00A42F 00 7E                    6 	.word PRTF_IDX 
      0026E6                       4476 	_dict_entry,4+F_IFUNC,PRTE,PRTE_IDX;const_porte
      00A42F AE 00                    1 	.word LINK 
                           0026E8     2 	LINK=.
      0026E8                          3 PRTE:
      00A431 06                       4 	.byte 4+F_IFUNC 	
      00A432 A6 84 81 45              5 	.ascii "PRTE"
      00A435 00 7C                    6 	.word PRTE_IDX 
      0026EF                       4477 	_dict_entry,4+F_IFUNC,PRTD,PRTD_IDX;const_portd
      00A435 AE 00                    1 	.word LINK 
                           0026F1     2 	LINK=.
      0026F1                          3 PRTD:
      00A437 07                       4 	.byte 4+F_IFUNC 	
      00A438 A6 84 81 44              5 	.ascii "PRTD"
      00A43B 00 7A                    6 	.word PRTD_IDX 
      0026F8                       4478 	_dict_entry,4+F_IFUNC,PRTC,PRTC_IDX;const_portc
      00A43B AE 00                    1 	.word LINK 
                           0026FA     2 	LINK=.
      0026FA                          3 PRTC:
      00A43D 08                       4 	.byte 4+F_IFUNC 	
      00A43E A6 84 81 43              5 	.ascii "PRTC"
      00A441 00 78                    6 	.word PRTC_IDX 
      002701                       4479 	_dict_entry,4+F_IFUNC,PRTB,PRTB_IDX;const_portb
      00A441 A6 84                    1 	.word LINK 
                           002703     2 	LINK=.
      002703                          3 PRTB:
      00A443 AE                       4 	.byte 4+F_IFUNC 	
      00A444 00 00 81 42              5 	.ascii "PRTB"
      00A447 00 76                    6 	.word PRTB_IDX 
      00270A                       4480 	_dict_entry,4+F_IFUNC,PRTA,PRTA_IDX;const_porta 
      00A447 A6 84                    1 	.word LINK 
                           00270C     2 	LINK=.
      00270C                          3 PRTA:
      00A449 AE                       4 	.byte 4+F_IFUNC 	
      00A44A 00 01 81 41              5 	.ascii "PRTA"
      00A44D 00 74                    6 	.word PRTA_IDX 
      002713                       4481 	_dict_entry 5,PRINT,PRT_IDX;print 
      00A44D A6 84                    1 	.word LINK 
                           002715     2 	LINK=.
      002715                          3 PRINT:
      00A44F AE                       4 	.byte 5 	
      00A450 00 02 81 4E 54           5 	.ascii "PRINT"
      00A453 00 72                    6 	.word PRT_IDX 
      00271D                       4482 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      00A453 A6 84                    1 	.word LINK 
                           00271F     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      00271F                          3 POUT:
      00A455 AE                       4 	.byte 4+F_IFUNC 	
      00A456 00 03 81 54              5 	.ascii "POUT"
      00A459 00 70                    6 	.word POUT_IDX 
      002726                       4483 	_dict_entry,4,POKE,POKE_IDX;poke 
      00A459 A6 84                    1 	.word LINK 
                           002728     2 	LINK=.
      002728                          3 POKE:
      00A45B AE                       4 	.byte 4 	
      00A45C 00 04 81 45              5 	.ascii "POKE"
      00A45F 00 6E                    6 	.word POKE_IDX 
      00272F                       4484 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      00A45F A6 84                    1 	.word LINK 
                           002731     2 	LINK=.
      002731                          3 PMODE:
      00A461 AE                       4 	.byte 5 	
      00A462 00 01 81 44 45           5 	.ascii "PMODE"
      00A465 00 68                    6 	.word PMODE_IDX 
      002739                       4485 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      00A465 A6 84                    1 	.word LINK 
                           00273B     2 	LINK=.
      00273B                          3 PINP:
      00A467 AE                       4 	.byte 4+F_IFUNC 	
      00A468 00 00 81 50              5 	.ascii "PINP"
      00A46B 00 6C                    6 	.word PINP_IDX 
      002742                       4486 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      00A46B A6 84                    1 	.word LINK 
                           002744     2 	LINK=.
      002744                          3 PEEK:
      00A46D AE                       4 	.byte 4+F_IFUNC 	
      00A46E 40 00 81 4B              5 	.ascii "PEEK"
      00A471 00 6A                    6 	.word PEEK_IDX 
      00274B                       4487 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      00A471 55 00                    1 	.word LINK 
                           00274D     2 	LINK=.
      00274D                          3 PAUSE:
      00A473 04                       4 	.byte 5 	
      00A474 00 02 81 53 45           5 	.ascii "PAUSE"
      00A477 00 66                    6 	.word PAUSE_IDX 
      002755                       4488 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      00A477 CD 97                    1 	.word LINK 
                           002757     2 	LINK=.
      002757                          3 PAD:
      00A479 26                       4 	.byte 3+F_IFUNC 	
      00A47A A1 84 27                 5 	.ascii "PAD"
      00A47D 03 CC                    6 	.word PAD_IDX 
      00275D                       4489 	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
      00A47F 91 8C                    1 	.word LINK 
                           00275F     2 	LINK=.
      00275F                          3 OR:
      00A481 4F                       4 	.byte 2+F_IFUNC 	
      00A482 CD 86                    5 	.ascii "OR"
      00A484 86 5D                    6 	.word OR_IDX 
      002764                       4490 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      00A486 26 05                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



                           002766     2 	LINK=.
      002766                          3 ODR:
      00A488 A6                       4 	.byte 3+F_IFUNC 	
      00A489 05 CC 91                 5 	.ascii "ODR"
      00A48C 8E 60                    6 	.word ODR_IDX 
      00A48D                       4491 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      00A48D 90 93                    1 	.word LINK 
                           00276E     2 	LINK=.
      00276E                          3 NOT:
      00A48F EE                       4 	.byte 3+F_IFUNC 	
      00A490 04 A3 A4                 5 	.ascii "NOT"
      00A493 71 26                    6 	.word NOT_IDX 
      002774                       4492 	_dict_entry,4,NEXT,NEXT_IDX;next 
      00A495 F2 90                    1 	.word LINK 
                           002776     2 	LINK=.
      002776                          3 NEXT:
      00A497 CF                       4 	.byte 4 	
      00A498 00 07 90 E6              5 	.ascii "NEXT"
      00A49C 02 C7                    6 	.word NEXT_IDX 
      00277D                       4493 	_dict_entry,3,NEW,NEW_IDX;new
      00A49E 00 0A                    1 	.word LINK 
                           00277F     2 	LINK=.
      00277F                          3 NEW:
      00A4A0 35                       4 	.byte 3 	
      00A4A1 06 00 09                 5 	.ascii "NEW"
      00A4A4 81 5C                    6 	.word NEW_IDX 
      00A4A5                       4494 	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
      00A4A5 72 5F                    1 	.word LINK 
                           002787     2 	LINK=.
      002787                          3 MULDIV:
      00A4A7 00                       4 	.byte 6+F_IFUNC 	
      00A4A8 07 72 5F 00 08 72        5 	.ascii "MULDIV"
      00A4AE 5F 00                    6 	.word MULDIV_IDX 
      002790                       4495 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      00A4B0 09 72                    1 	.word LINK 
                           002792     2 	LINK=.
      002792                          3 LSHIFT:
      00A4B2 5F                       4 	.byte 6+F_IFUNC 	
      00A4B3 00 0A CE 00 1A 54        5 	.ascii "LSHIFT"
      00A4B8 00 56                    6 	.word LSHIFT_IDX 
      00279B                       4496 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      00A4B8 C3 00                    1 	.word LINK 
                           00279D     2 	LINK=.
      00279D                          3 LOG:
      00A4BA 1C                       4 	.byte 3+F_IFUNC 	
      00A4BB 24 1B 90                 5 	.ascii "LOG"
      00A4BE 93 EE                    6 	.word LOG_IDX 
      0027A3                       4497 	_dict_entry 4,LIST,LIST_IDX;list
      00A4C0 04 1C                    1 	.word LINK 
                           0027A5     2 	LINK=.
      0027A5                          3 LIST:
      00A4C2 A9                       4 	.byte 4 	
      00A4C3 A0 FE A3 A4              5 	.ascii "LIST"
      00A4C7 71 26                    6 	.word LIST_IDX 
      0027AC                       4498 	_dict_entry 3,LET,LET_IDX;let 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00A4C9 1A 90                    1 	.word LINK 
                           0027AE     2 	LINK=.
      0027AE                          3 LET:
      00A4CB CF                       4 	.byte 3 	
      00A4CC 00 07 90                 5 	.ascii "LET"
      00A4CF E6 02                    6 	.word LET_IDX 
      0027B4                       4499 	_dict_entry,3+F_IFUNC,KEY,KEY_IDX;key 
      00A4D1 C7 00                    1 	.word LINK 
                           0027B6     2 	LINK=.
      0027B6                          3 KEY:
      00A4D3 0A                       4 	.byte 3+F_IFUNC 	
      00A4D4 35 06 00                 5 	.ascii "KEY"
      00A4D7 09 72                    6 	.word KEY_IDX 
      0027BC                       4500 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      00A4D9 5D 00                    1 	.word LINK 
                           0027BE     2 	LINK=.
      0027BE                          3 IWDGREF:
      00A4DB 0A                       4 	.byte 7 	
      00A4DC 26 05 A6 0C CC 91 8E     5 	.ascii "IWDGREF"
      00A4E3 81 4C                    6 	.word IWDGREF_IDX 
      00A4E4                       4501 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      00A4E4 93 E6                    1 	.word LINK 
                           0027CA     2 	LINK=.
      0027CA                          3 IWDGEN:
      00A4E6 02                       4 	.byte 6 	
      00A4E7 C7 00 0E 72 5F 00        5 	.ascii "IWDGEN"
      00A4ED 0D 72                    6 	.word IWDGEN_IDX 
      0027D3                       4502 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      00A4EF BB 00                    1 	.word LINK 
                           0027D5     2 	LINK=.
      0027D5                          3 INVERT:
      00A4F1 0D                       4 	.byte 6+F_IFUNC 	
      00A4F2 20 C4 56 45 52 54        5 	.ascii "INVERT"
      00A4F4 00 48                    6 	.word INVERT_IDX 
      0027DE                       4503 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      00A4F4 52 06                    1 	.word LINK 
                           0027E0     2 	LINK=.
      00A4F6                          3 INPUT:
      00A4F6 C6                       4 	.byte 5 	
      00A4F7 00 09 C1 00 0A           5 	.ascii "INPUT"
      00A4FC 27 37                    6 	.word INPUT_IDX 
      0027E8                       4504 	_dict_entry,2,IF,IF_IDX;if 
      00A4FE CD 9A                    1 	.word LINK 
                           0027EA     2 	LINK=.
      0027EA                          3 IF:
      00A500 1C                       4 	.byte 2 	
      00A501 CE 00                    5 	.ascii "IF"
      00A503 07 CF                    6 	.word IF_IDX 
      0027EF                       4505 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      00A505 00 05                    1 	.word LINK 
                           0027F1     2 	LINK=.
      0027F1                          3 IDR:
      00A507 55                       4 	.byte 3+F_IFUNC 	
      00A508 00 09 00                 5 	.ascii "IDR"
      00A50B 02 55                    6 	.word IDR_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      0027F7                       4506 	_dict_entry,3,HEX,HEX_IDX;hex_base
      00A50D 00 0A                    1 	.word LINK 
                           0027F9     2 	LINK=.
      0027F9                          3 HEX:
      00A50F 00                       4 	.byte 3 	
      00A510 04 CD 97                 5 	.ascii "HEX"
      00A513 26 A1                    6 	.word HEX_IDX 
      0027FF                       4507 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      00A515 84 27                    1 	.word LINK 
                           002801     2 	LINK=.
      002801                          3 GPIO:
      00A517 03                       4 	.byte 4+F_IFUNC 	
      00A518 CC 91 8C 4F              5 	.ascii "GPIO"
      00A51B 00 3E                    6 	.word GPIO_IDX 
      002808                       4508 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      00A51B 1F 05                    1 	.word LINK 
                           00280A     2 	LINK=.
      00280A                          3 GOTO:
      00A51D CD                       4 	.byte 4 	
      00A51E 92 7B CE 00              5 	.ascii "GOTO"
      00A522 05 CF                    6 	.word GOTO_IDX 
      002811                       4509 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      00A524 00 07                    1 	.word LINK 
                           002813     2 	LINK=.
      002813                          3 GOSUB:
      00A526 55                       4 	.byte 5 	
      00A527 00 02 00 09 CD           5 	.ascii "GOSUB"
      00A52C 9A 2C                    6 	.word GOSUB_IDX 
      00281B                       4510 	_dict_entry,4+F_IFUNC,FREE,FREE_IDX;free
      00A52E 1E 05                    1 	.word LINK 
                           00281D     2 	LINK=.
      00281D                          3 FREE:
      00A530 A6                       4 	.byte 4+F_IFUNC 	
      00A531 84 5B 06 81              5 	.ascii "FREE"
      00A535 00 9A                    6 	.word FREE_IDX 
      002824                       4511 	_dict_entry,3,FOR,FOR_IDX;for 
      00A535 90 CE                    1 	.word LINK 
                           002826     2 	LINK=.
      002826                          3 FOR:
      00A537 00                       4 	.byte 3 	
      00A538 07 72 5F                 5 	.ascii "FOR"
      00A53B 00 07                    6 	.word FOR_IDX 
      00282C                       4512 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      00A53D 72 5F                    1 	.word LINK 
                           00282E     2 	LINK=.
      00282E                          3 FCPU:
      00A53F 00                       4 	.byte 4 	
      00A540 08 72 5F 00              5 	.ascii "FCPU"
      00A544 09 72                    6 	.word FCPU_IDX 
      002835                       4513 	_dict_entry,5,ERASE,ERASE_IDX; erase 
      00A546 5F 00                    1 	.word LINK 
                           002837     2 	LINK=.
      002837                          3 ERASE:
      00A548 0A                       4 	.byte 5 	
      00A549 CD A4 E4 20 A8           5 	.ascii "ERASE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



      00A54E 00 32                    6 	.word ERASE_IDX 
      00283F                       4514 	_dict_entry,3,END,END_IDX;cmd_end  
      00A54E CD 96                    1 	.word LINK 
                           002841     2 	LINK=.
      002841                          3 END:
      00A550 27                       4 	.byte 3 	
      00A551 A1 02 27                 5 	.ascii "END"
      00A554 03 CC                    6 	.word END_IDX 
      002847                       4515 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      00A556 91 8C                    1 	.word LINK 
                           002849     2 	LINK=.
      00A558                          3 EEPROM:
      00A558 72                       4 	.byte 6+F_IFUNC 	
      00A559 12 50 C7 85 5D 27        5 	.ascii "EEPROM"
      00A55F 21 85                    6 	.word EEPROM_IDX 
      002852                       4516 	_dict_entry,4,EDIT,EDIT_IDX ; edit 
      00A561 A6 08                    1 	.word LINK 
                           002854     2 	LINK=.
      002854                          3 EDIT:
      00A563 42                       4 	.byte 4 	
      00A564 9F C7 52 00              5 	.ascii "EDIT"
      00A568 72 1A                    6 	.word EDIT_IDX 
      00285B                       4517 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      00A56A 50 14                    1 	.word LINK 
                           00285D     2 	LINK=.
      00285D                          3 DWRITE:
      00A56C 72                       4 	.byte 6+F_CMD 	
      00A56D 1A 50 16 72 14 52        5 	.ascii "DWRITE"
      00A573 00 72                    6 	.word DWRITE_IDX 
      002866                       4518 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      00A575 12 52                    1 	.word LINK 
                           002868     2 	LINK=.
      002868                          3 DREAD:
      00A577 01                       4 	.byte 5+F_IFUNC 	
      00A578 72 10 52 01 72           5 	.ascii "DREAD"
      00A57D 1C 52                    6 	.word DREAD_IDX 
      002870                       4519 	_dict_entry,2,DO,DO_IDX;do_loop
      00A57F 00 81                    1 	.word LINK 
                           002872     2 	LINK=.
      00A581                          3 DO:
      00A581 5B                       4 	.byte 2 	
      00A582 02 A6                    5 	.ascii "DO"
      00A584 82 C4                    6 	.word DO_IDX 
      002877                       4520 	_dict_entry,3,DEC,DEC_IDX;dec_base
      00A586 52 03                    1 	.word LINK 
                           002879     2 	LINK=.
      002879                          3 DEC:
      00A588 A1                       4 	.byte 3 	
      00A589 02 26 F7                 5 	.ascii "DEC"
      00A58C 72 1D                    6 	.word DEC_IDX 
      00287F                       4521 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      00A58E 52 00                    1 	.word LINK 
                           002881     2 	LINK=.
      002881                          3 DDR:
      00A590 72                       4 	.byte 3+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



      00A591 13 50 C7                 5 	.ascii "DDR"
      00A594 72 1B                    6 	.word DDR_IDX 
      002887                       4522 	_dict_entry,6,DATALN,DATALN_IDX;data_line  
      00A596 50 16                    1 	.word LINK 
                           002889     2 	LINK=.
      002889                          3 DATALN:
      00A598 81                       4 	.byte 6 	
      00A599 44 41 54 41 4C 4E        5 	.ascii "DATALN"
      00A599 A6 78                    6 	.word DATALN_IDX 
      002892                       4523 	_dict_entry,4,DATA,DATA_IDX;data  
      00A59B C5 52                    1 	.word LINK 
                           002894     2 	LINK=.
      002894                          3 DATA:
      00A59D 03                       4 	.byte 4 	
      00A59E 27 04 72 5F              5 	.ascii "DATA"
      00A5A2 52 03                    6 	.word DATA_IDX 
      00289B                       4524 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      00A5A4 81 94                    1 	.word LINK 
                           00289D     2 	LINK=.
      00A5A5                          3 CRL:
      00A5A5 88                       4 	.byte 3+F_IFUNC 	
      00A5A6 CD A5 99                 5 	.ascii "CRL"
      00A5A9 84 72                    6 	.word CRL_IDX 
      0028A3                       4525 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      00A5AB 03 52                    1 	.word LINK 
                           0028A5     2 	LINK=.
      0028A5                          3 CRH:
      00A5AD 03                       4 	.byte 3+F_IFUNC 	
      00A5AE FB C7 52                 5 	.ascii "CRH"
      00A5B1 04 72                    6 	.word CRH_IDX 
      0028AB                       4526 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      00A5B3 01 52                    1 	.word LINK 
                           0028AD     2 	LINK=.
      0028AD                          3 CHAR:
      00A5B5 03                       4 	.byte 4+F_CFUNC 	
      00A5B6 FB C6 52 04              5 	.ascii "CHAR"
      00A5BA 81 18                    6 	.word CHAR_IDX 
      00A5BB                       4527 	_dict_entry,3,BYE,BYE_IDX;bye 
      00A5BB A6 FF                    1 	.word LINK 
                           0028B6     2 	LINK=.
      0028B6                          3 BYE:
      00A5BD 72                       4 	.byte 3 	
      00A5BE 01 52 03                 5 	.ascii "BYE"
      00A5C1 E3 C6                    6 	.word BYE_IDX 
      0028BC                       4528 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      00A5C3 52 04                    1 	.word LINK 
                           0028BE     2 	LINK=.
      0028BE                          3 BTOGL:
      00A5C5 81                       4 	.byte 5 	
      00A5C6 42 54 4F 47 4C           5 	.ascii "BTOGL"
      00A5C6 CD 97                    6 	.word BTOGL_IDX 
      0028C6                       4529 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      00A5C8 26 A1                    1 	.word LINK 
                           0028C8     2 	LINK=.
      0028C8                          3 BTEST:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



      00A5CA 84                       4 	.byte 5+F_IFUNC 	
      00A5CB 27 03 CC 91 8C           5 	.ascii "BTEST"
      00A5D0 00 12                    6 	.word BTEST_IDX 
      0028D0                       4530 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      00A5D0 9F CD                    1 	.word LINK 
                           0028D2     2 	LINK=.
      0028D2                          3 BSET:
      00A5D2 A5                       4 	.byte 4 	
      00A5D3 A5 CD 92 7B              5 	.ascii "BSET"
      00A5D7 A1 09                    6 	.word BSET_IDX 
      0028D9                       4531 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      00A5D9 26 02                    1 	.word LINK 
                           0028DB     2 	LINK=.
      0028DB                          3 BRES:
      00A5DB 20                       4 	.byte 4 	
      00A5DC E9 4D 27 05              5 	.ascii "BRES"
      00A5E0 55 00                    6 	.word BRES_IDX 
      0028E2                       4532 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      00A5E2 03 00                    1 	.word LINK 
                           0028E4     2 	LINK=.
      0028E4                          3 BIT:
      00A5E4 02                       4 	.byte 3+F_IFUNC 	
      00A5E5 81 49 54                 5 	.ascii "BIT"
      00A5E6 00 0C                    6 	.word BIT_IDX 
      0028EA                       4533 	_dict_entry,3,AWU,AWU_IDX;awu 
      00A5E6 CD A5                    1 	.word LINK 
                           0028EC     2 	LINK=.
      0028EC                          3 AWU:
      00A5E8 BB                       4 	.byte 3 	
      00A5E9 5F 97 A6                 5 	.ascii "AWU"
      00A5EC 84 81                    6 	.word AWU_IDX 
      00A5EE                       4534 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      00A5EE CD 92                    1 	.word LINK 
                           0028F4     2 	LINK=.
      0028F4                          3 ASC:
      00A5F0 7B                       4 	.byte 3+F_IFUNC 	
      00A5F1 A1 84 27                 5 	.ascii "ASC"
      00A5F4 03 CC                    6 	.word ASC_IDX 
      0028FA                       4535 	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
      00A5F6 91 8C                    1 	.word LINK 
                           0028FC     2 	LINK=.
      0028FC                          3 AND:
      00A5F8 5D                       4 	.byte 3+F_IFUNC 	
      00A5F9 27 05 72                 5 	.ascii "AND"
      00A5FC 1B 50                    6 	.word AND_IDX 
      002902                       4536 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      00A5FE 14 81                    1 	.word LINK 
                           002904     2 	LINK=.
      00A600                          3 ADCREAD:
      00A600 72                       4 	.byte 7+F_IFUNC 	
      00A601 1A 50 14 81 45 41 44     5 	.ascii "ADCREAD"
      00A605 00 04                    6 	.word ADCREAD_IDX 
      00290E                       4537 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      00A605 AE 16                    1 	.word LINK 
                           002910     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



      002910                          3 ADCON:
      00A607 E0                       4 	.byte 5 	
      00A608 B6 84 81 4F 4E           5 	.ascii "ADCON"
      00A60B 00 02                    6 	.word ADCON_IDX 
      002918                       4538 kword_dict::
      002918                       4539 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      00A60B 00 00                    1 	.word LINK 
                           00291A     2 	LINK=.
      00A60D                          3 ABS:
      00A60D 43                       4 	.byte 3+F_IFUNC 	
      00A60E 58 4F 52                 5 	.ascii "ABS"
      00A611 00 C2                    6 	.word ABS_IDX 
                                   4540 
                                   4541 ;comands and fonctions address table 	
      002920                       4542 code_addr::
      00A613 A6 0D 1C D9 1D 15 20  4543 	.word abs,power_adc,analog_read,bit_and,ascii,awu,bitmask ; 0..7
             D1 1F AE 20 6E 23 1F
      00A615 1A 67 1A 57 1A 88 1A  4544 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             78 20 47 1F 9C 23 D9
      00A615 05 57 52 49 54 45 00  4545 	.word const_cr1,data,data_line,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
             C0 A6 15 23 48 1D 49
             1D 79
      00A61F 18 D2 23 EB 1C 85 1E  4546 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto,gpio ; 24..31 
             41 21 4B 1E AD 1A E3
             1B EE 1B D3 1F EA
      00A61F 05 57 4F 52 44 53 00  4547 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             BE A6 1F 22 C9 22 FF
             1F D5
      00A629 18 0A 18 3D 23 04 21  4548 	.word let,list,log2,lshift,muldiv,next,new ; 40..47
             19 15 2C 1B 63 1E 00
      00A629 04 57 41 49 54 00 BC  4549 	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             A6 29 5B 21 57 1A BE
             23 E5
      00A632 1A AF 23 DF 19 36 23  4550 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             8B 23 91 23 97 23 9D
             23 A3
      00A632 43 55 53 52 00 BA A6  4551 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             32 1F DD 24 74 0E 51
             1A 2C
      00A63A 24 25 1C 0E 21 D3 21  4552 	.word restore,return, random,rshift,run,show,free ; 72..79
             32 1C 2C 17 47 17 92
      00A63A 05 55 4E 54 49 4C 00  4553 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             B8 A6 3A 1B 3C 1D B4
             20 B7
      00A644 22 A0 22 AF 1B 0C 1C  4554 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             95 18 00 20 14 23 5D
             20 2A
      00A644 46 55 46 4C 41 53 48  4555 	.word wait,words,write,bit_xor,cmd_size ; 96..99
             00 B6 A6
      00A64E 44 00                 4556 	.word 0 
                                   4557 
                                   4558 
                                   4559 
                                   4560 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
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
      00A64F                         28 	.bndry 128 ; align on FLASH block.
                                     29 ; space for user application  
      002A00                         30 app_space::
      00A64F 46 55                   31 app_sign: .word 0 ; .ascii "BC"  ; signature 
      00A651 42 4F                   32 app_size: .word 0 ; 31 
      002A04                         33 app: 
                                     34 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     35 ;;  BASIC code demo 'BLINK.BAS' 
                                     36 ;; 10 do btogl $500a,32 pause 250 until qkey bres $500a,32 end 
                                     37 ;; byte code generated by compiler.
                                     38 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     39 ;.byte 0,10,31,128,0,38,128,0,20,132,80,10,9,132,0,32,128
                                     40 ;.byte 0,100,132,0,250,128,0,182,129,0,132,128,0,46
                                     41 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   4 ABS        00291A R   |     ABS_IDX =  000000 
    ACC24   =  000007     |     ACK     =  000006     |   4 ADCON      002910 R
    ADCON_ID=  000002     |   4 ADCREAD    002904 R   |     ADCREAD_=  000004 
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
  4 AND        0028FC R   |     AND_IDX =  000006     |     AREG    =  000002 
    ARG_OFS =  000002     |     ARROW_LE=  000080     |     ARROW_RI=  000081 
  4 ASC        0028F4 R   |     ASC_IDX =  000008     |     ATTRIB  =  000002 
    AUTORUN_=  004000     |   4 AWU        0028EC R   |   4 AWUHandl   000001 R
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
    BELL    =  000007     |     BINARY  =  000001     |   4 BIT        0028E4 R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000C 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  00000B     |   4 BRES       0028DB R   |     BRES_IDX=  00000E 
    BS      =  000008     |     BSAVE   =  000001     |   4 BSET       0028D2 R
    BSET_IDX=  000010     |     BSIZE   =  000006     |   4 BTEST      0028C8 R
    BTEST_ID=  000012     |   4 BTOGL      0028BE R   |     BTOGL_ID=  000014 
    BTW     =  000001     |   4 BYE        0028B6 R   |     BYE_IDX =  000016 
    C       =  000001     |     CAN     =  000018     |   4 CANT_DO    001F10 R
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
  4 CHAR       0028AD R   |     CHAR_IDX=  000018     |     CLKOPT  =  004807 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
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
    CPU_YL  =  007F07     |     CR      =  00000D     |   4 CRH        0028A5 R
    CRH_IDX =  00001A     |   4 CRL        00289D R   |     CRL_IDX =  00001C 
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
    CX_CNT  =  000004     |     CX_IN   =  000003     |   4 DATA       002894 R
  4 DATALN     002889 R   |     DATALN_I=  000020     |     DATA_IDX=  00001E 
    DBG_A   =  000005     |     DBG_CC  =  000006     |     DBG_X   =  000003 
    DBG_Y   =  000001     |     DBL     =  000003     |     DBLDIVDN=  000006 
    DBLHI   =  000001     |     DBLLO   =  000003     |     DBL_SIZE=  000004 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   4 DDR        002881 R   |     DDR_IDX =  000022 
    DEBUG   =  000000     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
    DEBUG_PR=  000001     |   4 DEC        002879 R   |     DEC_IDX =  000024 
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
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   4 DO         002872 R
    DOLP_ADR=  000003     |     DOLP_INW=  000005     |     DO_IDX  =  000026 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]

Symbol Table

  4 DREAD      002868 R   |     DREAD_ID=  000028     |   4 DWRITE     00285D R
    DWRITE_I=  00002A     |   4 EDIT       002854 R   |     EDIT_IDX=  00002C 
  4 EEPROM     002849 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_I=  00002E     |     EEPROM_S=  000800     |     EM      =  000019 
  4 END        002841 R   |     END_IDX =  000030     |     ENQ     =  000005 
    EOF     =  0000FF     |     EOT     =  000004     |   4 ERASE      002837 R
    ERASE_ID=  000032     |     ERR_BAD_=  00000A     |     ERR_BUF_=  00000F 
    ERR_CMD_=  000007     |     ERR_DIV0=  000004     |     ERR_DUPL=  000008 
    ERR_MATH=  000003     |     ERR_MEM_=  000001     |     ERR_NONE=  000000 
    ERR_NOT_=  000009     |     ERR_NO_A=  00000B     |     ERR_NO_D=  00000C 
    ERR_NO_F=  00000E     |     ERR_NO_L=  000005     |     ERR_NO_P=  00000D 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    ETB     =  000017     |     ETX     =  000003     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FAUTORUN=  000006     |     FBREAK  =  000004 
    FCOMP   =  000005     |   4 FCPU       00282E R   |     FCPU_IDX=  000034 
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
    FLSI    =  01F400     |   4 FOR        002826 R   |     FOR_IDX =  000038 
  4 FREE       00281D R   |     FREE_IDX=  00009A     |     FRUN    =  000000 
    FS      =  00001C     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_CFUNC =  000080     |     F_CMD   =  000000 
    F_CONST =  0000C0     |     F_IFUNC =  000040     |   4 GOSUB      002813 R
    GOSUB_ID=  00003A     |   4 GOTO       00280A R   |     GOTO_IDX=  00003C 
  4 GPIO       002801 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_IDX=  00003E     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
    GS      =  00001D     |   4 HEX        0027F9 R   |     HEX_IDX =  000040 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   4 IDR        0027F1 R
    IDR_IDX =  000042     |   4 IF         0027EA R   |     IF_IDX  =  000044 
    IN      =  000005     |     INCR    =  000001     |     INP     =  000000 
  4 INPUT      0027E0 R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
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
    INT_VECT=  008058     |   4 INVERT     0027D5 R   |     INVERT_I=  000048 
    INW     =  000009     |     IPOS    =  000001     |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |   4 IWDGEN     0027CA R   |     IWDGEN_I=  00004A 
  4 IWDGREF    0027BE R   |     IWDGREF_=  00004C     |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |     KCHAR   =  000002 
  4 KEY        0027B6 R   |     KEY_END =  000083     |     KEY_IDX =  00004E 
    LAST    =  000003     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000002 
  4 LET        0027AE R   |     LET_IDX =  000050     |     LF      =  00000A 
    LIMIT   =  000001     |     LINENO  =  000005     |   4 LINK    =  00291A R
  4 LIST       0027A5 R   |     LIST_IDX=  000052     |     LL      =  000001 
    LLEN    =  000002     |     LL_HB   =  000001     |     LN_PTR  =  000005 
  4 LOG        00279D R   |     LOG_IDX =  000054     |   4 LSHIFT     002792 R
    LSHIFT_I=  000056     |     MAJOR   =  000002     |     MASK    =  000002 
    MATH_OVF=  000000     |     MAX_LINE=  007FFF     |     MINOR   =  000000 
  4 MULDIV     002787 R   |     MULDIV_I=  000058     |     MULOP   =  000003 
    N1      =  000001     |     N2      =  000003     |     NAFR    =  004804 
    NAK     =  000015     |     NCLKOPT =  004808     |     NEG     =  000001 
  4 NEW        00277F R   |     NEW_IDX =  00005C     |   4 NEXT       002776 R
    NEXT_IDX=  00005A     |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NLEN    =  000001     |     NOPT1   =  004802     |     NOPT2   =  004804 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]

Symbol Table

    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  4 NOT        00276E R   |     NOT_IDX =  00005E     |   4 NOT_SAVE   0018FF R
  4 NO_APP     001F4F R   |     NUBC    =  004802     |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   4 NonHandl   000000 R   |   4 ODR        002766 R
    ODR_IDX =  000060     |     ONOFF   =  000003     |     OP      =  000005 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   4 OR         00275F R   |     OR_IDX  =  000062 
    OUTP    =  000001     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVFH    =  000001 
    OVFL    =  000002     |     OVRWR   =  000004     |     PA      =  000000 
  4 PAD        002757 R   |     PAD_IDX =  000064     |     PAD_SIZE=  000080 
  4 PAUSE      00274D R   |     PAUSE_ID=  000066     |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  4 PEEK       002744 R   |     PEEK_IDX=  00006A     |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
    PG_ODR  =  00501E     |     PH      =  000023     |     PH_BASE =  005023 
    PH_CR1  =  005026     |     PH_CR2  =  005027     |     PH_DDR  =  005025 
    PH_IDR  =  005024     |     PH_ODR  =  005023     |     PI      =  000028 
    PINNO   =  000001     |   4 PINP       00273B R   |     PINP_IDX=  00006C 
    PINVAL  =  000002     |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   4 PMODE      002731 R   |     PMODE_ID=  000068 
  4 POKE       002728 R   |     POKE_IDX=  00006E     |     PORT    =  000003 
  4 POUT       00271F R   |     POUT_IDX=  000070     |     PREV    =  000001 
  4 PRINT      002715 R   |   4 PROG_ADD   0017D8 R   |   4 PROG_SIZ   0017EA R
  4 PRTA       00270C R   |     PRTA_IDX=  000074     |   4 PRTB       002703 R
    PRTB_IDX=  000076     |   4 PRTC       0026FA R   |     PRTC_IDX=  000078 
  4 PRTD       0026F1 R   |     PRTD_IDX=  00007A     |   4 PRTE       0026E8 R
    PRTE_IDX=  00007C     |   4 PRTF       0026DF R   |     PRTF_IDX=  00007E 
  4 PRTG       0026D6 R   |     PRTG_IDX=  000080     |   4 PRTH       0026CD R
    PRTH_IDX=  000082     |   4 PRTI       0026C4 R   |     PRTI_IDX=  000084 
    PRT_IDX =  000072     |     PSTR    =  000003     |   4 QKEY       0026BB R
    QKEY_IDX=  000086     |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |     RBT_IDX =  00008A     |   4 READ       0026B2 R
    READ_IDX=  000088     |   4 REBOOT     0026A7 R   |     REG     =  000001 
    REGA    =  000001     |     REGX    =  000003     |     REGY    =  000005 
    RELOP   =  000003     |   4 REMARK     00269C R   |     REM_IDX =  00008C 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]

Symbol Table

  4 RESTORE    002690 R   |     REST_IDX=  00008E     |     RETL1   =  000001 
  4 RETURN     002685 R   |     RET_ADDR=  000003     |     RET_IDX =  000090 
    RET_INW =  000005     |   4 RND        00267D R   |     RND_IDX =  000092 
    ROP     =  004800     |     RS      =  00001E     |   4 RSHIFT     002672 R
    RSHIFT_I=  000094     |     RST_SR  =  0050B3     |   4 RUN        00266A R
  4 RUNNING    000F34 R   |     RUN_IDX =  000096     |     RXCHAR  =  000001 
    RX_QUEUE=  000008     |   4 SAVE       002661 R   |     SAVEB   =  000002 
    SAVE_IDX=  000036     |     SDIVSR  =  000005     |     SEPARATE=  000000 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
  4 SHOW       002658 R   |     SHOW_IDX=  000098     |     SI      =  00000F 
    SIGN    =  000001     |   4 SIGNATUR   001F0E R   |   4 SIZE       00264F R
    SIZE_IDX=  0000C4     |     SKIP    =  000005     |   4 SLEEP      002645 R
    SLEEP_ID=  00009C     |     SO      =  00000E     |     SOH     =  000001 
    SPACE   =  000020     |   4 SPIEN      00263B R   |     SPIEN_ID=  0000A0 
  4 SPIRD      002631 R   |     SPIRD_ID=  00009E     |   4 SPISEL     002626 R
    SPISEL_I=  0000A2     |   4 SPIWR      00261C R   |     SPIWR_ID=  0000A4 
    SPI_CR1 =  005200     |     SPI_CR1_=  000003     |     SPI_CR1_=  000000 
    SPI_CR1_=  000001     |     SPI_CR1_=  000007     |     SPI_CR1_=  000002 
    SPI_CR1_=  000006     |     SPI_CR2 =  005201     |     SPI_CR2_=  000007 
    SPI_CR2_=  000006     |     SPI_CR2_=  000005     |     SPI_CR2_=  000004 
    SPI_CR2_=  000002     |     SPI_CR2_=  000000     |     SPI_CR2_=  000001 
    SPI_CRCP=  005205     |     SPI_CS_B=  000005     |     SPI_DR  =  005204 
    SPI_ICR =  005202     |     SPI_RXCR=  005206     |     SPI_SR  =  005203 
    SPI_SR_B=  000007     |     SPI_SR_C=  000004     |     SPI_SR_M=  000005 
    SPI_SR_O=  000006     |     SPI_SR_R=  000000     |     SPI_SR_T=  000001 
    SPI_SR_W=  000003     |     SPI_TXCR=  005207     |     SQUOT   =  000006 
    SRC     =  000003     |     STACK_EM=  0017FF     |     STACK_SI=  0000A0 
  4 STEP       002613 R   |     STEP_IDX=  0000A6     |   4 STOP       00260A R
    STOP_IDX=  0000A8     |     STR     =  000003     |   4 STR_BYTE   0017F9 R
    STX     =  000002     |     SUB     =  00001A     |     SUP     =  000084 
    SWIM_CSR=  007F80     |     SYN     =  000016     |     TAB     =  000009 
    TABW    =  000004     |     TAB_WIDT=  000004     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  4 TICKS      002600 R   |     TICKS_ID=  0000AA     |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_PSC=  000003     |     TIM4_PSC=  000000     |     TIM4_PSC=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_PSC=  000002     |     TIM4_SR =  005342     |     TIM4_SR_=  000000 
  4 TIMEOUT    0025F4 R   |   4 TIMER      0025EA R   |     TIMER_ID=  0000AC 
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |     TK_ARRAY=  000006 
    TK_CFUNC=  000082     |     TK_CHAR =  000003     |     TK_CMD  =  000080 
    TK_COLON=  00000B     |     TK_COMMA=  000009     |     TK_CONST=  000083 
    TK_DIV  =  000021     |     TK_EQUAL=  000032     |     TK_GE   =  000033 
    TK_GRP_A=  000010     |     TK_GRP_M=  000030     |     TK_GRP_M=  000000 
    TK_GRP_M=  000020     |     TK_GRP_R=  000030     |     TK_GT   =  000031 
    TK_IFUNC=  000081     |     TK_INTGR=  000084     |     TK_LE   =  000036 
    TK_LPARE=  000007     |     TK_LT   =  000034     |     TK_MINUS=  000011 
    TK_MOD  =  000022     |     TK_MULT =  000020     |     TK_NE   =  000035 
    TK_NONE =  000000     |     TK_PLUS =  000010     |     TK_QSTR =  000002 
    TK_RPARE=  000008     |     TK_SHARP=  00000A     |     TK_VAR  =  000085 
    TMROUT_I=  0000AE     |   4 TO         0025E3 R   |   4 TONE       0025DA R
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
    UART_SR_=  000007     |     UBC     =  004801     |   4 UBOUND     0025CF R
    UBOUND_I=  0000B4     |   4 UBTN_Han   000048 R   |   4 UFLASH     0025C4 R
    UFLASH_I=  0000B6     |   4 UNTIL      0025BA R   |     UNTIL_ID=  0000B8 
    US      =  00001F     |   4 USER_ABO   00005B R   |   4 USR        0025B2 R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    USR_IDX =  0000BA     |   4 Uart1RxH   00024F R   |   4 UserButt   000024 R
    VAR_ADDR=  000006     |     VSISE   =  000003     |     VSIZ    =  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]

Symbol Table

    VSIZE   =  000006     |     VT      =  00000B     |   4 WAIT       0025A9 R
    WAIT_IDX=  0000BC     |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  4 WORDS      00259F R   |     WORDS_ID=  0000BE     |   4 WRITE      002595 R
    WRITE_ID=  0000C0     |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XFIRST  =  000001     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   4 XOR        00258D R   |     XOR_IDX =  0000C2 
    XREG    =  000003     |     XSAVE   =  000005     |     YSAVE   =  000004 
  4 abs        0020BD R   |   5 acc16      00000C GR  |   5 acc24      00000B GR
  5 acc8       00000D GR  |   4 accept_c   00058A R   |   4 add_char   000C65 R
  4 add_spac   000A89 R   |   4 analog_r   001D15 R   |   4 app        002A04 R
  4 app_sign   002A00 R   |   4 app_size   002A02 R   |   4 app_spac   002A00 GR
  4 arduino_   0021B3 R   |   4 arg_list   0015A7 R   |   5 array_si   00001E R
  4 ascii      001FAE R   |   4 at_tst     0008F7 R   |   4 atoi24     001361 GR
  4 atoi_exi   0013C7 R   |   4 awu        00206E R   |   4 awu02      002078 R
  4 bad_port   00200F R   |   5 base       00000A GR  |   5 basicptr   000004 GR
  4 beep       001CA2 R   |   4 beep_1kh   001C8C GR  |   4 bin_exit   0007BD R
  4 bit_and    0020D1 R   |   4 bit_or     0020E9 R   |   4 bit_rese   001A67 R
  4 bit_set    001A57 R   |   4 bit_test   001A88 R   |   4 bit_togg   001A78 R
  4 bit_xor    002101 R   |   4 bitmask    00231F R   |   4 bkslsh_t   0008A4 R
  4 bksp       000328 R   |   4 block_er   00018F R   |   4 break_po   001DE2 R
  4 bye        002047 R   |   4 char       001F9C R   |   4 clear_ba   000F74 R
  4 clear_va   000DD4 R   |   4 clock_in   000076 R   |   4 cmd_end    001C85 R
  4 cmd_line   001193 R   |   4 cmd_name   000C85 R   |   4 cmd_size   0017AB R
  4 code_add   002920 GR  |   4 cold_sta   000E51 R   |   4 colon_ts   0008CB R
  4 comma_ts   0008D6 R   |   4 comp_msg   0010EB R   |   4 compile    0009FC GR
  4 const_cr   0023D3 R   |   4 const_cr   0023D9 R   |   4 const_dd   0023CD R
  4 const_ee   0023EB R   |   4 const_id   0023C7 R   |   4 const_in   0023E5 R
  4 const_od   0023C1 R   |   4 const_ou   0023DF R   |   4 const_po   00238B R
  4 const_po   002391 R   |   4 const_po   002397 R   |   4 const_po   00239D R
  4 const_po   0023A3 R   |   4 const_po   0023A9 R   |   4 const_po   0023AF R
  4 const_po   0023B5 R   |   4 const_po   0023BB R   |   4 convert_   000734 R
  4 convert_   0002EC R   |   4 copy_com   00092C R   |   5 count      000003 GR
  4 cp_loop    001556 R   |   4 cpy_cmd_   000A74 R   |   4 cpy_quot   000AAD R
  4 create_g   00065E R   |   4 cs_high    002580 R   |   4 cstk_pro   001761 R
  4 dash_tst   0008EC R   |   4 data       0023F1 R   |   5 data_len   000009 R
  4 data_lin   0023F7 R   |   5 data_ofs   000008 R   |   5 data_ptr   000006 R
  4 data_sea   002438 R   |   4 dbl_sign   0014B0 R   |   4 dec_base   00178D R
  4 decomp_l   000B5E R   |   4 decompil   000B17 GR  |   4 del_line   000631 R
  4 delete_l   000415 R   |   4 delete_n   000338 R   |   4 delete_u   0003DA R
  4 digital_   001D49 R   |   4 digital_   001D79 R   |   4 div32_16   0014BA R
  4 divide     001511 R   |   4 divu24_8   0012D0 R   |   4 dneg       0014A5 R
  4 do_loop    002348 R   |   4 do_progr   000182 R   |   4 edit       0018D2 R
  4 enable_i   0022C9 R   |   4 eql_tst    000981 R   |   4 equal      000C78 R
  4 erase      001E41 R   |   4 erase_ex   0001AE R   |   4 erase_fl   0001A4 R
  4 err_bad_   001056 R   |   4 err_buf_   0010CC R   |   4 err_cmd_   00101A R
  4 err_div0   000FDF R   |   4 err_dupl   001034 R   |   4 err_math   000FC6 R
  4 err_mem_   000FAB R   |   4 err_msg    000F8B R   |   4 err_no_a   001062 R
  4 err_no_d   001095 R   |   4 err_no_f   0010B9 R   |   4 err_no_l   000FEE R
  4 err_no_p   0010A5 R   |   4 err_not_   001045 R   |   4 err_run_   001004 R
  4 err_synt   000FB8 R   |   4 escaped    000749 GR  |   4 expect     001595 R
  4 expr_exi   0016EC R   |   4 expressi   0016A6 R   |   4 factor     0015F7 R
  5 farptr     000016 R   |   4 fcpu       00214B R   |   4 final_te   000583 R
  4 first_li   00187F R   |   5 flags      000020 GR  |   4 for        001AE3 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]

Symbol Table

  4 free       001792 R   |   7 free_ram   000080 R   |   4 func_arg   0015A2 R
  4 func_not   0022BC R   |   4 ge         000C7A R   |   4 get_arra   0015D2 R
  4 get_cmd_   000AF6 R   |   4 get_esca   0002F8 R   |   4 get_targ   001BAD R
  4 get_tick   0020B7 R   |   4 get_toke   00083D GR  |   4 getc       0002D1 GR
  4 gosub      001BEE R   |   4 goto       001BD3 R   |   4 gpio       001FEA R
  4 gt         000C76 R   |   4 gt_tst     00098C R   |   4 hex_base   001788 R
  4 hex_dump   000D25 R   |   4 if         001ACF R   |   5 in         000001 GR
  5 in.saved   000002 GR  |   5 in.w       000000 GR  |   4 incr_far   001E25 R
  4 input_ex   001A29 R   |   4 input_lo   0019BE R   |   4 input_va   0019BC R
  4 insert_c   000397 R   |   4 insert_l   00068A R   |   4 insert_l   0006F9 R
  4 interp_l   0011D4 R   |   4 interpre   0011AF R   |   4 invert     002339 R
  4 is_alnum   000E02 GR  |   4 is_alpha   000DE8 GR  |   4 is_digit   000DF9 GR
  4 itoa       001265 GR  |   4 itoa_loo   00128A R   |   4 jp_to_ta   001BE1 R
  4 key        001FD5 R   |   4 kw_loop    0007D9 R   |   4 kword_di   002918 GR
  4 kword_en   00258B R   |   4 le         000C7F R   |   4 leading_   00230F R
  4 let        00180A GR  |   4 let_arra   001818 R   |   4 let_var    00181B R
  4 lines_sk   001882 R   |   4 list       00183D R   |   4 list_exi   0018C4 R
  4 list_loo   0018A2 R   |   4 log2       002304 R   |   4 logical_   0022B2 R
  4 long_div   00148D R   |   4 loop_bac   001B90 R   |   5 loop_dep   00001D R
  4 loop_don   001BA5 R   |   4 lshift     002119 R   |   4 lt         000C7D R
  4 lt_tst     0009B5 R   |   4 modulo     001527 R   |   4 move       000D90 GR
  4 move_dow   000DAF R   |   4 move_era   000111 R   |   4 move_exi   000DD0 R
  4 move_lef   00036F R   |   4 move_loo   000DB4 R   |   4 move_prg   000151 R
  4 move_rig   00037D R   |   4 move_up    000DA1 R   |   4 mul_char   000C67 R
  4 muldiv     00152C R   |   4 multiply   001458 R   |   4 mulu24_8   0012F8 R
  4 nbr_tst    000870 R   |   4 ne         000C82 R   |   4 neg_acc2   001332 R
  4 new        001E00 R   |   4 next       001B63 R   |   4 next_lin   0011B7 R
  4 next_tok   0011FB GR  |   4 no_match   001568 R   |   4 other      0009DE R
  4 overwrit   0005AF R   |   2 pad        0016E0 GR  |   4 pad_ref    002585 R
  4 parse_bi   00079B R   |   4 parse_in   000751 R   |   4 parse_ke   0007D8 R
  4 parse_qu   0006FC R   |   4 pause      00205B R   |   4 pause02    002065 R
  4 peek       001ABE R   |   4 pin_mode   002157 R   |   4 plus_tst   000955 R
  4 poke       001AAF R   |   4 power_ad   001CD9 R   |   4 prcnt_ts   000976 R
  4 print      001936 R   |   4 print_ex   001990 R   |   4 print_he   0005E4 GR
  4 print_in   001249 R   |   4 printxy    0013CB R   |   4 prog_siz   001835 R
  4 program_   00012B R   |   4 program_   000151 R   |   4 prt_basi   001916 R
  4 prt_loop   00193A R   |   4 prt_tok    000CB7 R   |   4 prti24     001259 R
  5 ptr16      000017 GR  |   5 ptr8       000018 R   |   4 putc       0002C1 GR
  4 puts       00031E GR  |   4 qgetc      0002CA GR  |   4 qkey       001FDD GR
  4 qmark_ts   000902 R   |   4 qsign      001EA6 R   |   4 random     0021D3 R
  4 read       002474 R   |   4 read01     002476 R   |   4 readln     000423 GR
  4 readln_l   000430 R   |   4 readln_q   0005CC R   |   4 refresh_   0022FF R
  4 rel_exit   001744 R   |   4 relation   0016EF R   |   4 relop_st   000C6A R
  4 remark     001A2C GR  |   4 reset_co   001938 R   |   4 rest_con   0019AC R
  4 restore    002425 R   |   4 return     001C0E R   |   4 right_al   000A9B GR
  4 row_alig   001E0A R   |   4 row_eras   0000E4 R   |   4 row_eras   000111 R
  4 row_loop   000D08 R   |   4 rparnt_t   0008C0 R   |   4 rshift     002132 R
  7 rsign      00007C R   |   7 rsize      00007E R   |   4 rt_msg     0010D9 R
  4 run        001C2C R   |   4 run_app    000EF3 R   |   4 run_it     001C5E R
  5 rx1_head   00002A R   |   5 rx1_queu   000022 R   |   5 rx1_tail   00002B R
  4 save_app   001EAD R   |   4 save_con   00199C R   |   4 scan_blo   001E33 R
  4 search_d   001548 GR  |   4 search_e   001592 R   |   4 search_l   000606 GR
  4 search_l   000615 R   |   4 search_n   00154C R   |   5 seedx      000012 R
  5 seedy      000014 R   |   4 select_p   0021A3 R   |   4 send_esc   000346 R
  4 send_par   000351 R   |   4 set_time   0022A0 R   |   4 sharp_ts   0008E1 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]

Symbol Table

  4 show       001747 R   |   4 show_row   000CF6 R   |   4 single_c   000C60 R
  4 skip       00082A R   |   4 slash_ts   00096B R   |   4 sleep      002050 R
  4 software   000E0B R   |   4 spaces     00038B GR  |   4 spi_clea   002519 R
  4 spi_disa   002501 R   |   4 spi_enab   0024CE R   |   4 spi_rcv_   00253B R
  4 spi_read   002566 R   |   4 spi_sele   00256E R   |   4 spi_send   002525 R
  4 spi_writ   002546 R   |   2 stack_fu   001760 GR  |   2 stack_un   001800 R
  4 star_tst   000960 R   |   4 step       001B3C R   |   4 stop       001DB4 R
  4 store_lo   001B50 R   |   4 str_matc   001575 R   |   4 str_tst    000860 R
  4 strcmp     000D6F R   |   4 strcpy     000D80 GR  |   4 strlen     000D64 GR
  4 syntax_e   00110C GR  |   5 tab_widt   000021 GR  |   4 tb_error   00110E GR
  4 term       001654 R   |   4 term01     00165C R   |   4 term_exi   0016A3 R
  2 tib        001690 GR  |   4 tick_tst   00091A R   |   5 ticks      00000E R
  4 timeout    0022AF R   |   5 timer      000010 GR  |   4 timer2_i   00008C R
  4 timer4_i   000099 R   |   4 tk_id      0010FC R   |   4 to         001B0C R
  4 to_eepro   00017A R   |   4 to_flash   00017F R   |   4 to_hex_c   0005FB GR
  4 to_upper   001355 GR  |   4 token_ch   0009F5 R   |   4 token_ex   0009F9 R
  4 token_ms   000CEE R   |   4 tone       001C95 R   |   4 try_next   002464 R
  5 txtbgn     000019 GR  |   5 txtend     00001B GR  |   4 uart1_ge   0002D1 GR
  4 uart1_in   00027C R   |   4 uart1_pu   0002C1 GR  |   4 uart1_qg   0002CA GR
  4 uart1_se   00028C R   |   4 ubound     001800 R   |   4 udiv32_1   00147B R
  4 uflash     002014 R   |   4 umstar     00141E R   |   4 unlock_e   0000AE R
  4 unlock_f   0000C9 R   |   4 until      00235D R   |   4 user_int   000037 R
  4 usr        00202A R   |   4 var_name   000AEE GR  |   5 vars       00002C GR
  4 wait       001A32 R   |   4 warm_ini   000F56 R   |   4 warm_sta   001190 R
  4 words      00223A R   |   4 words_co   00228A R   |   4 write      001F65 R
  4 write_bl   00022A R   |   4 write_by   0001B0 R   |   4 write_ee   0001EC R
  4 write_ex   000225 R   |   4 write_fl   0001D6 R   |   4 write_ro   00016B R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 SSEG       size      0   flags    8
   2 SSEG0      size    170   flags    8
   3 HOME       size     80   flags    0
   4 CODE       size   2A04   flags    0
   5 DATA       size     60   flags    0
   6 BTXT       size      0   flags    8
   7 BTXT1      size      4   flags    8

