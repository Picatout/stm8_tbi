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
                           000080    48         PAD_SIZE=BLOCK_SIZE 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
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
      0016E0                         43 block_buffer::                 ; use to write FLASH block (alias for pad )
      0016E0                         44 pad:: .ds PAD_SIZE             ; working buffer
      001760                         45 stack_full:: .ds STACK_SIZE   ; control stack 
      001800                         46 stack_unf: ; stack underflow ; control_stack bottom 
                                     47 
                                     48 ;;--------------------------------------
                                     49     .area HOME 
                                     50 ;; interrupt vector table at 0x8000
                                     51 ;;--------------------------------------
      008000 82 00 8F 51             52     int cold_start			; RESET vector 
                           000000    53 .if DEBUG
                                     54 	int TrapHandler 		;TRAP  software interrupt
                           000001    55 .else
      008004 82 00 80 80             56 	int NonHandledInterrupt ;TRAP  software interrupt
                                     57 .endif
      008008 82 00 80 80             58 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 81             59 	int AWUHandler          ;int1 AWU   auto wake up from halt
      008010 82 00 80 80             60 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 80             61 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 80             62 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 80             63 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 80             64 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 A4             65 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 80             66 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 80             67 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 80             68 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 80             69 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 80             70 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 80             71 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 80             72 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 80             73 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 80             74 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 80             75 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 82 FF             76 	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
      008054 82 00 80 80             77 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 80             78 	int NonHandledInterrupt ;int20 UART3 TX completed
      00805C 82 00 80 80             79 	int NonHandledInterrupt ;int21 UART3 RX full
      008060 82 00 80 80             80 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 8F             81 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
      008068 82 00 80 80             82 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 80             83 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 80             84 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 80             85 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 80             86 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 80             87 	int NonHandledInterrupt ;int29  not used
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                     88 
                                     89 ;---------------------------------------
                                     90     .area CODE
                                     91 ;---------------------------------------
                           000000    92 .if DEBUG
                                     93 .asciz "STM8_TBI" ; I like to put module name here.
                                     94 .endif 
                                     95 
                                     96 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     97 ; non handled interrupt 
                                     98 ; reset MCU
                                     99 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008080                        100 NonHandledInterrupt:
      008080 71                     101     .byte 0x71  ; invalid opcode reinitialize MCU
                                    102 
                                    103 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    104 ; auto wakeup from halt
                                    105 ; at iret, program continue 
                                    106 ; after hatl instruction
                                    107 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008081                        108 AWUHandler:
      008081 72 19 50 F0      [ 1]  109 	bres AWU_CSR,#AWU_CSR_AWUEN
      008085 55 00 3F 50 F1   [ 1]  110 	mov AWU_APR,0x3F
      00808A 72 5F 50 F2      [ 1]  111 	clr AWU_TBR 
      00808E 80               [11]  112 	iret
                                    113 
                                    114 ;------------------------------------
                                    115 ; software interrupt handler  
                                    116 ;------------------------------------
                           000000   117 .if DEBUG 
                                    118 TrapHandler:
                                    119 	bset flags,#FTRAP 
                                    120 	call print_registers
                                    121 	call cmd_itf
                                    122 	bres flags,#FTRAP 	
                                    123 	iret
                                    124 .endif 
                                    125 
                                    126 ;------------------------------
                                    127 ; TIMER 4 is used to maintain 
                                    128 ; a milliseconds 'ticks' counter
                                    129 ; and decrement 'timer' varaiable
                                    130 ;--------------------------------
      00808F                        131 Timer4UpdateHandler:
      00808F 72 5F 53 42      [ 1]  132 	clr TIM4_SR 
      008093 CE 00 10         [ 2]  133 	ldw x,ticks
      008096 5C               [ 1]  134 	incw x
      008097 CF 00 10         [ 2]  135 	ldw ticks,x 
      00809A CE 00 12         [ 2]  136 	ldw x,timer
                                    137 ;	tnzw x 
      00809D 27 04            [ 1]  138 	jreq 1$
      00809F 5A               [ 2]  139 	decw x 
      0080A0 CF 00 12         [ 2]  140 	ldw timer,x 
      0080A3                        141 1$:	
      0080A3 80               [11]  142 	iret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                    143 
                                    144 ;------------------------------------
                                    145 ; Triggered by pressing USER UserButton 
                                    146 ; on NUCLEO card.
                                    147 ; This is used to abort a progam lock 
                                    148 ; in infinite loop. 
                                    149 ;------------------------------------
      0080A4                        150 UserButtonHandler:
                                    151 ; wait button release
      0080A4 5F               [ 1]  152 	clrw x
      0080A5 5A               [ 2]  153 1$: decw x 
      0080A6 26 FD            [ 1]  154 	jrne 1$
      0080A8 72 09 50 15 F8   [ 2]  155 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    156 ; if MCU suspended by SLEEP resume program
      0080AD 72 07 00 22 05   [ 2]  157     btjf flags,#FSLEEP,2$
      0080B2 72 17 00 22      [ 1]  158 	bres flags,#FSLEEP 
      0080B6 80               [11]  159 	iret
      0080B7                        160 2$:	
      0080B7                        161 user_interrupted:
      0080B7 72 00 00 22 02   [ 2]  162     btjt flags,#FRUN,4$
      0080BC 20 0A            [ 2]  163 	jra UBTN_Handler_exit 
      0080BE                        164 4$:	; program interrupted by user 
      0080BE 72 11 00 22      [ 1]  165 	bres flags,#FRUN 
      0080C2 AE 80 DB         [ 2]  166 	ldw x,#USER_ABORT
      0080C5 CD 83 CE         [ 4]  167 	call puts 
      0080C8                        168 UBTN_Handler_exit:
      0080C8 AE 17 FF         [ 2]  169     ldw x,#STACK_EMPTY 
      0080CB 94               [ 1]  170     ldw sp,x
      0080CC 9A               [ 1]  171 	rim 
      0080CD CE 00 1B         [ 2]  172 	ldw x,txtbgn 
      0080D0 A3 AC 80         [ 2]  173 	cpw x,#app_space 
      0080D3 22 03            [ 1]  174 	jrugt 5$
      0080D5 CD 90 3F         [ 4]  175 	call clear_basic 
      0080D8 CC 92 5B         [ 2]  176 5$:	jp warm_start
                                    177 
      0080DB 0A 50 72 6F 67 72 61   178 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    179 
                                    180 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    181 ;    peripherals initialization
                                    182 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    183 
                                    184 ;----------------------------------------
                                    185 ; inialize MCU clock 
                                    186 ; input:
                                    187 ;   A 		source  HSI | 1 HSE 
                                    188 ;   XL      CLK_CKDIVR , clock divisor 
                                    189 ; output:
                                    190 ;   none 
                                    191 ;----------------------------------------
      0080F6                        192 clock_init:	
      0080F6 C1 50 C3         [ 1]  193 	cp a,CLK_CMSR 
      0080F9 27 0C            [ 1]  194 	jreq 2$ ; no switching required 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                    195 ; select clock source 
      0080FB 72 12 50 C5      [ 1]  196 	bset CLK_SWCR,#CLK_SWCR_SWEN
      0080FF C7 50 C4         [ 1]  197 	ld CLK_SWR,a
      008102 C1 50 C3         [ 1]  198 1$:	cp a,CLK_CMSR
      008105 26 FB            [ 1]  199 	jrne 1$
      008107                        200 2$: 	
                                    201 ; HSI and cpu clock divisor 
      008107 9F               [ 1]  202 	ld a,xl 
      008108 C7 50 C6         [ 1]  203 	ld CLK_CKDIVR,a  
      00810B 81               [ 4]  204 	ret
                                    205 
                                    206 ;----------------------------------
                                    207 ; TIMER2 used as audio tone output 
                                    208 ; on port D:5.
                                    209 ; channel 1 configured as PWM mode 1 
                                    210 ;-----------------------------------  
                                    211 
      00810C                        212 timer2_init:
      00810C 72 1A 50 C7      [ 1]  213 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      008110 35 60 53 05      [ 1]  214  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      008114 35 08 53 0C      [ 1]  215 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      008118 81               [ 4]  216 	ret 
                                    217 
                                    218 ;---------------------------------
                                    219 ; TIM4 is configured to generate an 
                                    220 ; interrupt every millisecond 
                                    221 ;----------------------------------
      008119                        222 timer4_init:
      008119 72 18 50 C7      [ 1]  223 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      00811D 35 07 53 45      [ 1]  224 	mov TIM4_PSCR,#7 ; prescale 128  
      008121 35 7D 53 46      [ 1]  225 	mov TIM4_ARR,#125 ; set for 1msec.
      008125 35 05 53 40      [ 1]  226 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008129 72 10 53 41      [ 1]  227 	bset TIM4_IER,#TIM4_IER_UIE
      00812D 81               [ 4]  228 	ret
                                    229 
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
      0081B8 90 5F            [ 1]  130 	clrw y 
      0081BA F6               [ 1]  131 1$:	ld a,(x)
      0081BB 91 A7 00 18      [ 1]  132 	ldf ([farptr],y),a
      0081BF 5C               [ 1]  133 	incw x 
      0081C0 90 5C            [ 1]  134 	incw y 
      0081C2 0A 01            [ 1]  135 	dec (BCNT,sp)
      0081C4 26 F4            [ 1]  136 	jrne 1$
                                    137 ; wait EOP bit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      0081C6 72 05 50 5F FB   [ 2]  138 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      00014B                        139 	_drop 1 
      0081CB 5B 01            [ 2]    1     addw sp,#1 
      0081CD 90 85            [ 2]  140 	popw y 
      0081CF 84               [ 1]  141 	pop a 
      0081D0 81               [ 4]  142 	ret 
      0081D1                        143 program_row_end:
                                    144 
                                    145 ;-------------------------
                                    146 ; move program_row to RAM 
                                    147 ; at txtubound address 
                                    148 ;------------------------
      0081D1                        149 move_prg_to_ram:
      0081D1 89               [ 2]  150 	pushw x 
      0081D2 90 89            [ 2]  151 	pushw y 
      0081D4 AE 81 D1         [ 2]  152 	ldw x,#program_row_end 
      0081D7 1D 81 AB         [ 2]  153 	subw x,#program_row 
      0081DA CF 00 0E         [ 2]  154 	ldw acc16,x ; bytes to move 
      0081DD AE 16 90         [ 2]  155 	ldw x,#tib ; destination address 
      0081E0 90 AE 81 AB      [ 2]  156 	ldw y,#program_row ; source address 
      0081E4 CD 8E B8         [ 4]  157 	call move
      0081E7 90 85            [ 2]  158 	popw y 
      0081E9 85               [ 2]  159 	popw x  
      0081EA 81               [ 4]  160 	ret 
                                    161 
                                    162 
                                    163 ;-----------------------------
                                    164 ; write a buffer in FLASH/EEPROM 
                                    165 ; input:
                                    166 ;    farptr   destination address 
                                    167 ;    x        buffer address 
                                    168 ;-----------------------------
      0081EB                        169 write_buffer:
      0081EB 89               [ 2]  170 	pushw x 
      0081EC 72 5D 00 18      [ 1]  171 	tnz farptr 
      0081F0 26 0D            [ 1]  172 	jrne to_flash 
      0081F2 CE 00 19         [ 2]  173 	ldw x,farptr+1 
      0081F5 A3 AC 80         [ 2]  174 	cpw x,#app_space  
      0081F8 24 05            [ 1]  175 	jruge to_flash 
      0081FA                        176 to_eeprom:
      0081FA CD 81 2E         [ 4]  177 	call unlock_eeprom
      0081FD 20 03            [ 2]  178 	jra do_programming
      0081FF                        179 to_flash:
      0081FF CD 81 49         [ 4]  180 	call unlock_flash
      008202                        181 do_programming:
      008202 85               [ 2]  182 	popw x 
      008203 CD 16 90         [ 4]  183 	call tib
      008206 72 13 50 5F      [ 1]  184 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      00820A 72 17 50 5F      [ 1]  185 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      00820E 81               [ 4]  186 	ret 
                                    187 
                                    188 
                                    189 ;-----------------------------------
                                    190 ; erase flash or EEPROM block
                                    191 ; a block is 128 bytes 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                    192 ; input:
                                    193 ;   farptr  address row begin
                                    194 ; output:
                                    195 ;   none
                                    196 ;--------------------------------------
      00820F                        197 block_erase:
      00820F 89               [ 2]  198 	pushw x 
      008210 CE 00 19         [ 2]  199 	ldw x,farptr+1
      008213 A3 AC 80         [ 2]  200 	cpw x,#app_space 
      008216 24 0C            [ 1]  201 	jruge erase_flash 
                                    202 ; erase eeprom block
      008218 CD 81 2E         [ 4]  203 	call unlock_eeprom 
      00821B CD 16 90         [ 4]  204 	call tib 
      00821E 72 17 50 5F      [ 1]  205 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      008222 20 0A            [ 2]  206 	jra erase_exit  
                                    207 ; erase flash block:
      008224                        208 erase_flash:
      008224 CD 81 49         [ 4]  209 	call unlock_flash 
      008227 CD 16 90         [ 4]  210 	call tib 
      00822A 72 13 50 5F      [ 1]  211     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00822E                        212 erase_exit: 
      00822E 85               [ 2]  213 	popw x 
      00822F 81               [ 4]  214 	ret 
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
      008230                        230 write_byte:
      008230 90 89            [ 2]  231 	pushw y
      0001B2                        232 	_vars VSIZE
      008232 52 02            [ 2]    1     sub sp,#VSIZE 
      008234 6B 01            [ 1]  233 	ld (BTW,sp),a ; byte to write 
      008236 0F 02            [ 1]  234 	clr (OPT,sp)  ; OPTION flag
                                    235 ; put addr[15:0] in Y, for bounds check.
      008238 90 CE 00 19      [ 2]  236 	ldw y,farptr+1   ; Y=addr15:0
                                    237 ; check addr[23:16], if <> 0 then it is extened flash memory
      00823C 72 5D 00 18      [ 1]  238 	tnz farptr 
      008240 26 14            [ 1]  239 	jrne write_flash
      008242 90 A3 AC 80      [ 2]  240     cpw y,#app_space 	 
      008246 24 0E            [ 1]  241     jruge write_flash
      008248 90 A3 40 00      [ 2]  242 	cpw y,#EEPROM_BASE  
      00824C 25 57            [ 1]  243     jrult write_exit
      00824E 90 A3 48 7F      [ 2]  244 	cpw y,#OPTION_END 
      008252 22 51            [ 1]  245 	jrugt write_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008254 20 16            [ 2]  246 	jra write_eeprom 
                                    247 ; write program memory
      008256                        248 write_flash:
      008256 CD 81 49         [ 4]  249 	call unlock_flash 
      008259 9B               [ 1]  250 1$:	sim 
      00825A 7B 01            [ 1]  251 	ld a,(BTW,sp)
      00825C 92 A7 00 18      [ 4]  252 	ldf ([farptr],x),a ; farptr[x]=A
      008260 72 05 50 5F FB   [ 2]  253 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008265 9A               [ 1]  254     rim 
      008266 72 13 50 5F      [ 1]  255     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00826A 20 39            [ 2]  256     jra write_exit
                                    257 ; write eeprom and option
      00826C                        258 write_eeprom:
      00826C CD 81 2E         [ 4]  259 	call unlock_eeprom
                                    260 	; check for data eeprom or option eeprom
      00826F 90 A3 48 00      [ 2]  261 	cpw y,#OPTION_BASE
      008273 2B 08            [ 1]  262 	jrmi 1$
      008275 90 A3 48 80      [ 2]  263 	cpw y,#OPTION_END+1
      008279 2A 02            [ 1]  264 	jrpl 1$
      00827B 03 02            [ 1]  265 	cpl (OPT,sp)
      00827D                        266 1$: 
      00827D 0D 02            [ 1]  267     tnz (OPT,sp)
      00827F 27 08            [ 1]  268     jreq 2$
                                    269 	; pour modifier une option il faut modifier ces 2 bits
      008281 72 1E 50 5B      [ 1]  270     bset FLASH_CR2,#FLASH_CR2_OPT
      008285 72 1F 50 5C      [ 1]  271     bres FLASH_NCR2,#FLASH_CR2_OPT 
      008289                        272 2$: 
      008289 7B 01            [ 1]  273     ld a,(BTW,sp)
      00828B 92 A7 00 18      [ 4]  274     ldf ([farptr],x),a
      00828F 0D 02            [ 1]  275     tnz (OPT,sp)
      008291 27 08            [ 1]  276     jreq 3$
      008293 5C               [ 1]  277     incw x
      008294 7B 01            [ 1]  278     ld a,(BTW,sp)
      008296 43               [ 1]  279     cpl a
      008297 92 A7 00 18      [ 4]  280     ldf ([farptr],x),a
      00829B 72 05 50 5F FB   [ 2]  281 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0082A0 72 0D 50 5F FB   [ 2]  282 	btjf FLASH_IAPSR,#FLASH_IAPSR_HVOFF,.
      0082A5                        283 write_exit:
      000225                        284 	_drop VSIZE 
      0082A5 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082A7 90 85            [ 2]  285 	popw y
      0082A9 81               [ 4]  286     ret
                                    287 
                                    288 ;--------------------------------------------
                                    289 ; write a data block to eeprom or flash 
                                    290 ; input:
                                    291 ;   Y        source address   
                                    292 ;   X        array index  destination  farptr[x]
                                    293 ;   BSIZE    block size bytes 
                                    294 ;   farptr   write address , byte* 
                                    295 ; output:
                                    296 ;	X 		after last byte written 
                                    297 ;   Y 		after last byte read 
                                    298 ;  farptr   point after block
                                    299 ;---------------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      0082AA                        300 	_argofs 3 
                           000005     1     ARG_OFS=2+3 
      00022A                        301 	_arg BSIZE 1  ; block size
                           000006     1     BSIZE=ARG_OFS+1 
                                    302 	; local var 
                           000001   303 	XSAVE=1 
                           000002   304 	VSIZE=2 
      00022A                        305 write_block::
      0082AA 88               [ 1]  306 	push a 
      00022B                        307 	_vars VSIZE
      0082AB 52 02            [ 2]    1     sub sp,#VSIZE 
      0082AD 1F 01            [ 2]  308 	ldw (XSAVE,sp),x 
      0082AF 1E 06            [ 2]  309 	ldw x,(BSIZE,sp) 
      0082B1 27 13            [ 1]  310 	jreq 9$
      0082B3 1E 01            [ 2]  311 1$:	ldw x,(XSAVE,sp)
      0082B5 90 F6            [ 1]  312 	ld a,(y)
      0082B7 CD 82 30         [ 4]  313 	call write_byte 
      0082BA 5C               [ 1]  314 	incw x 
      0082BB 90 5C            [ 1]  315 	incw y 
      0082BD 1F 01            [ 2]  316 	ldw (XSAVE,sp),x
      0082BF 1E 06            [ 2]  317 	ldw x,(BSIZE,sp)
      0082C1 5A               [ 2]  318 	decw x
      0082C2 1F 06            [ 2]  319 	ldw (BSIZE,sp),x 
      0082C4 26 ED            [ 1]  320 	jrne 1$
      0082C6                        321 9$:
      0082C6 1E 01            [ 2]  322 	ldw x,(XSAVE,sp)
      0082C8 CD A0 54         [ 4]  323 	call incr_farptr
      00024B                        324 	_drop VSIZE
      0082CB 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082CD 84               [ 1]  325 	pop a 
      0082CE 81               [ 4]  326 	ret 
                                    327 
                                    328 
                                    329 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    330 ;;  scan_free_eeprom
                                    331 ;;  return free address in eeprom 
                                    332 ;;  input:
                                    333 ;;     none
                                    334 ;;  output:
                                    335 ;;     X    address free 
                                    336 ;;          if full return 0
                                    337 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0082CF                        338 scan_free_eeprom::
      0082CF 88               [ 1]  339     push a
      000250                        340     _vars 2  
      0082D0 52 02            [ 2]    1     sub sp,#2 
      0082D2 AE 40 00         [ 2]  341     ldw x,#EEPROM_BASE  
      0082D5                        342 1$: ; expect a string here 
      0082D5 F6               [ 1]  343     ld a,(x)
      0082D6 27 10            [ 1]  344     jreq 8$ ; free address 
      0082D8 1F 01            [ 2]  345     ldw (1,sp),x 
      0082DA 5F               [ 1]  346     clrw x 
      0082DB 97               [ 1]  347     ld xl,a 
      0082DC 72 FB 01         [ 2]  348     addw x,(1,sp) ; skip name 
      0082DF 1C 00 05         [ 2]  349     addw x,#5 ; skip terminal 0 and value
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      0082E2 A3 47 FF         [ 2]  350     cpw x,#EEPROM_END 
      0082E5 25 EE            [ 1]  351     jrult 1$
      0082E7 5F               [ 1]  352     clrw x  
      000268                        353 8$: _drop 2  
      0082E8 5B 02            [ 2]    1     addw sp,#2 
      0082EA 84               [ 1]  354     pop a 
      0082EB 81               [ 4]  355     ret 
                                    356 
                                    357 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    358 ;;  eefree 
                                    359 ;;  return free bytes in eeprom 
                                    360 ;;  input:
                                    361 ;;     none 
                                    362 ;;  output:
                                    363 ;;     X     size 
                                    364 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0082EC                        365 eefree:
      0082EC CD 82 CF         [ 4]  366     call scan_free_eeprom 
      0082EF CF 00 2E         [ 2]  367     ldw free_eeprom,x 
      0082F2 5D               [ 2]  368     tnzw x 
      0082F3 27 09            [ 1]  369     jreq 9$ 
      0082F5 89               [ 2]  370     pushw x 
      0082F6 AE 48 00         [ 2]  371     ldw x,#EEPROM_BASE+EEPROM_SIZE 
      0082F9 72 F0 01         [ 2]  372     subw x,(1,sp)
      00027C                        373     _drop 2  
      0082FC 5B 02            [ 2]    1     addw sp,#2 
      0082FE 81               [ 4]  374 9$: ret 
                                    375 
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
      008315 CC 8F 51         [ 2]   76 	jp cold_start 	
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
      00855C CD 94 33         [ 4]  592 	call atoi24
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
      008616 CD 9E BB         [ 4]  677 	call beep_1khz
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
      008817 CD 94 27         [ 4]  322 	call to_upper 
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
      008838 CD 94 33         [ 4]  337 	call atoi24
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
      0088B7 CD 94 27         [ 4]  474 	call to_upper  
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
      0088EC AE AB 96         [ 2]    1     ldw x,#kword_dict+2
      0088EF 16 01            [ 2]  518 	ldw y,(XFIRST,sp) ; name to search for
      0088F1 90 5C            [ 1]  519 	incw y 
      0088F3 CD 96 1A         [ 4]  520 	call search_dict
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
      008912 A3 00 4E         [ 2]  540 	cpw x,#LET_IDX 
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
      008955 CD 94 27         [ 4]  609 	call to_upper 
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
      008A08 AE 00 70         [ 2]  691 	ldw x,#PRT_IDX 
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
      008A1E 90 AE 00 8A      [ 2]  700 	ldw y,#REM_IDX
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
      008A47 AE 00 8A         [ 2]  716 	ldw x,#REM_IDX 
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



      008ADF CC 91 D7         [ 2]  778 	jp syntax_error 
      008AE2                        779 30$: 
      008AE2 CD 88 CE         [ 4]  780 	call parse_keyword
      008AE5 A3 9B 5C         [ 2]  781 	cpw x,#remark 
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
      008B21 CC 91 D9         [ 2]  827 	jp tb_error
      008B24 CF 16 E0         [ 2]  828 1$:	ldw pad,x 
      008B27 90 AE 16 E3      [ 2]  829 	ldw y,#pad+3 
      008B2B 90 A3 17 60      [ 2]  830 2$:	cpw y,#stack_full 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      008B2F 25 05            [ 1]  831 	jrult 3$
      008B31 A6 0F            [ 1]  832 	ld a,#ERR_BUF_FULL 
      008B33 CC 91 D9         [ 2]  833 	jp tb_error 
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
      008BF2 90 AE AB 9C      [ 2]  179 	ldw y,#code_addr 
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
      008C32 CD 93 37         [ 4]  220 	call itoa  
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
      008C5A CD 92 CF         [ 4]  238 	call next_token 
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
      008C8A CD 93 37         [ 4]  262 	call itoa  
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
      008CA3 A3 00 8A         [ 2]  275 	cpw x,#REM_IDX
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
      008CCB A3 00 4E         [ 2]  292 5$: cpw x,#LET_IDX 
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
      008DB5 AE AB 94         [ 2]  428 	ldw x,#kword_dict	
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
      008DF8 CD 93 1B         [ 4]  108 	call print_int 
      008DFB A6 20            [ 1]  109 	ld a,#SPACE
      008DFD CD 83 71         [ 4]  110 	call putc 
      008E00 1E 03            [ 2]  111 	ldw x,(XREG,sp)
      008E02 CD 93 1B         [ 4]  112 	call print_int 
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
      008E28 CD 93 1B         [ 4]  144 	call print_int 
      008E2B A6 20            [ 1]  145 	ld a,#SPACE  
      008E2D CD 83 71         [ 4]  146 	call putc
      008E30                        147 row_loop:
      008E30 1E 02            [ 2]  148 	ldw x,(ADR,sp)
      008E32 F6               [ 1]  149 	ld a,(x)
      008E33 5F               [ 1]  150 	clrw x 
      008E34 97               [ 1]  151 	ld xl,a 
      008E35 CD 93 1B         [ 4]  152 	call print_int 
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
      008EFD 88               [ 1]  329 	push a  
      008EFE AE 00 30         [ 2]  330 	ldw x,#vars 
      008F01 A6 34            [ 1]  331 	ld a,#2*26 
      008F03 7F               [ 1]  332 1$:	clr (x)
      008F04 5C               [ 1]  333 	incw x 
      008F05 4A               [ 1]  334 	dec a 
      008F06 26 FB            [ 1]  335 	jrne 1$
      008F08 84               [ 1]  336 	pop a 
      008F09 85               [ 2]  337 	popw x 
      008F0A 81               [ 4]  338 	ret 
                                    339 
                                    340 ;-------------------------------------
                                    341 ;  program initialization entry point 
                                    342 ;-------------------------------------
                           000002   343 	MAJOR=2
                           000000   344 	MINOR=0 
      008F0B 0A 0A 54 69 6E 79 20   345 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
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
      000ED1                        346 cold_start:
                                    347 ;set stack 
      008F3D 20 32 30         [ 2]  348 	ldw x,#STACK_EMPTY
      008F40 31               [ 1]  349 	ldw sp,x   
                                    350 ; clear all ram 
      008F41 39               [ 1]  351 0$: clr (x)
      008F42 2C               [ 2]  352 	decw x 
      008F43 32 30            [ 1]  353 	jrne 0$
                                    354 ; activate pull up on all inputs 
      008F45 32 32            [ 1]  355 	ld a,#255 
      008F47 0A 76 65         [ 1]  356 	ld PA_CR1,a 
      008F4A 72 73 69         [ 1]  357 	ld PB_CR1,a 
      008F4D 6F 6E 20         [ 1]  358 	ld PC_CR1,a 
      008F50 00 50 12         [ 1]  359 	ld PD_CR1,a 
      008F51 C7 50 17         [ 1]  360 	ld PE_CR1,a 
      008F51 AE 17 FF         [ 1]  361 	ld PF_CR1,a 
      008F54 94 7F 5A         [ 1]  362 	ld PG_CR1,a 
      008F57 26 FC A6         [ 1]  363 	ld PI_CR1,a
                                    364 ; set LD2 pin as output 
      008F5A FF C7 50 03      [ 1]  365     bset PC_CR1,#LED2_BIT
      008F5E C7 50 08 C7      [ 1]  366     bset PC_CR2,#LED2_BIT
      008F62 50 0D C7 50      [ 1]  367     bset PC_DDR,#LED2_BIT
      008F66 12 C7 50 17      [ 1]  368 	bres PC_ODR,#LED2_BIT 
                                    369 ; disable schmitt triggers on Arduino CN4 analog inputs
      008F6A C7 50 1C C7 50   [ 1]  370 	mov ADC_TDRL,0x3f
                                    371 ; disable peripherals clocks
                                    372 ;	clr CLK_PCKENR1 
                                    373 ;	clr CLK_PCKENR2
      008F6F 21 C7 50 2B      [ 1]  374 	clr AWU_TBR 
      008F73 72 1A 50 0D      [ 1]  375 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                    376 ; select internal clock no divisor: 16 Mhz 	
      008F77 72 1A            [ 1]  377 	ld a,#CLK_SWR_HSI 
      008F79 50               [ 1]  378 	clrw x  
      008F7A 0E 72 1A         [ 4]  379     call clock_init 
      008F7D 50 0C 72         [ 4]  380 	call timer4_init
      008F80 1B 50 0A         [ 4]  381 	call timer2_init
                                    382 ; UART1 at 115200 BAUD
      008F83 55 00 3F         [ 4]  383 	call uart1_init
                                    384 ; activate PE_4 (user button interrupt)
      008F86 54 07 72 5F      [ 1]  385     bset PE_CR2,#USR_BTN_BIT 
                                    386 ; display system information
      008F8A 50 F2 72         [ 2]  387 	ldw x,#software 
      008F8D 14 50 CA         [ 4]  388 	call puts 
      008F90 A6 E1            [ 1]  389 	ld a,#MAJOR 
      008F92 5F CD 80         [ 1]  390 	ld acc8,a 
      008F95 F6               [ 1]  391 	clrw x 
      008F96 CD 81 19         [ 2]  392 	ldw acc24,x
      008F99 CD 81 0C CD      [ 1]  393 	clr tab_width  
      008F9D 83 2C 72 18      [ 1]  394 	mov base, #10 
      008FA1 50 18 AE         [ 4]  395 	call prti24 
      008FA4 8F 0B            [ 1]  396 	ld a,#'.
      008FA6 CD 83 CE         [ 4]  397 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      008FA9 A6 02            [ 1]  398 	ld a,#MINOR 
      008FAB C7 00 0F         [ 1]  399 	ld acc8,a 
      008FAE 5F               [ 1]  400 	clrw x 
      008FAF CF 00 0D         [ 2]  401 	ldw acc24,x 
      008FB2 72 5F 00         [ 4]  402 	call prti24
      008FB5 23 35            [ 1]  403 	ld a,#CR 
      008FB7 0A 00 0B         [ 4]  404 	call putc
      008FBA CD               [ 1]  405 	rim 
      008FBB 93 2B A6 2E      [ 1]  406 	inc seedy+1 
      008FBF CD 83 71 A6      [ 1]  407 	inc seedx+1 
      008FC3 00 C7 00         [ 4]  408 	call clear_basic
      008FC6 0F 5F CF         [ 4]  409 	call ubound 
      008FC9 00 0D CD         [ 4]  410 	call beep_1khz  
      000F65                        411 2$:	
      008FCC 93 2B A6         [ 4]  412 	call warm_init
                                    413 ; check for application in flash memory 
      008FCF 0D CD 83         [ 2]  414 	ldw x,app_sign 
      008FD2 71 9A 72         [ 2]  415 	cpw x,SIGNATURE 
      008FD5 5C 00            [ 1]  416 	jreq run_app
      008FD7 17 72 5C         [ 2]  417 	jp cmd_line
      000F73                        418 run_app:
                                    419 ; run application in FLASH|EEPROM 
      008FDA 00 15 CD         [ 2]  420 	ldw x,#app 
      008FDD 90 3F CD         [ 2]  421 	ldw txtbgn,x
      008FE0 98 AA CD 9E      [ 2]  422 	addw x,app_size 
      008FE4 BB 00 1C         [ 2]  423 	ldw txtend,x 
      008FE5 AE 0F 8E         [ 2]  424 	ldw x,#AUTO_RUN 
      008FE5 CD 90 21         [ 4]  425 	call puts 
      008FE8 CE AC 80         [ 4]  426 	call program_info 
      008FEB C3 A1 95         [ 2]  427 	jp run_it_02  
      008FEE 27 03            [ 2]  428     jra .  
                                    429 
      008FF0 CC 92 5E 74 6F 20 72   430 AUTO_RUN: .asciz " auto run program\n"
             75 6E 20 70 72 6F 67
             72 61 6D 0A 00
                                    431 
                                    432 
      008FF3                        433 warm_init:
      008FF3 AE AC 84 CF      [ 1]  434 	clr flags 
      008FF7 00 1B 72 BB      [ 1]  435 	clr loop_depth 
      008FFB AC 82 CF 00      [ 1]  436 	mov tab_width,#TAB_WIDTH 
      008FFF 1D AE 90 0E      [ 1]  437 	mov base,#10 
      009003 CD 83 CE         [ 2]  438 	ldw x,#0 
      009006 CD 98 E7         [ 2]  439 	ldw basicptr,x 
      009009 CC 9E 6A         [ 2]  440 	ldw in.w,x 
      00900C 20 FE 20 61      [ 1]  441 	clr count
      009010 75               [ 4]  442 	ret 
                                    443 
                                    444 
                                    445 ;---------------------------
                                    446 ; reset BASIC text variables 
                                    447 ; and clear variables 
                                    448 ;---------------------------
      000FBF                        449 clear_basic:
      009011 74               [ 2]  450 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009012 6F 20 72 75      [ 1]  451 	clr count
      009016 6E 20 70 72      [ 1]  452 	clr in  
      00901A 6F 67 72         [ 2]  453 	ldw x,#free_ram 
      00901D 61 6D 0A         [ 2]  454 	ldw txtbgn,x 
      009020 00 00 1C         [ 2]  455 	ldw txtend,x 
      009021 CD 0E 7C         [ 4]  456 	call clear_vars 
      009021 72               [ 2]  457 	popw x
      009022 5F               [ 4]  458 	ret 
                                    459 
                                    460 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    461 ;;   Tiny BASIC error messages     ;;
                                    462 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FD6                        463 err_msg:
      009023 00 22 72 5F 00 1F 35   464 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             04 00 23 35 0A
      00902F 00 0B AE 00 00 CF 00   465 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             05 CF 00
      009039 01 72 5F 00 04 81 11   466 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             04 11 17
                                    467 
      00903F 4D 65 6D 6F 72 79 20   468 err_mem_full: .asciz "Memory full\n" 
             66 75 6C 6C 0A 00
      00903F 89 72 5F 00 04 72 5F   469 err_syntax: .asciz "syntax error\n" 
             00 02 AE 00 80 CF 00
      00904D 1B CF 00 1D CD 8E FC   470 err_math_ovf: .asciz "math operation overflow\n"
             85 81 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      009056 64 69 76 69 73 69 6F   471 err_div0: .asciz "division by 0\n" 
             6E 20 62 79 20 30 0A
             00
      009056 00 00 90 76 90 83 90   472 err_no_line: .asciz "invalid line number.\n"
             91 90 AA 90 B9 90 CF
             90 E5 90 FF 91 10 91
             21
      00906C 91 2D 91 60 91 70 91   473 err_run_only: .asciz "run time only usage.\n" 
             84 91 97 4D 65 6D 6F
             72 79 20 66 75 6C 6C
             0A
      009082 00 73 79 6E 74 61 78   474 err_cmd_only: .asciz "command line only usage.\n"
             20 65 72 72 6F 72 0A
             00 6D 61 74 68 20 6F
             70 65 72 61 74
      00909C 69 6F 6E 20 6F 76 65   475 err_duplicate: .asciz "duplicate name.\n"
             72 66 6C 6F 77 0A 00
             64 69 76
      0090AD 69 73 69 6F 6E 20 62   476 err_not_file: .asciz "File not found.\n"
             79 20 30 0A 00 69 6E
             76 61 6C
      0090BE 69 64 20 6C 69 6E 65   477 err_bad_value: .asciz "bad value.\n"
             20 6E 75 6D 62
      0090CA 65 72 2E 0A 00 72 75   478 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             6E 20 74 69 6D 65 20
             6F 6E 6C 79 20 75 73
             61 67 65 2E 0A 00 63
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal  6F-Bits]



             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      0090E7 6D 6D 61 6E 64 20 6C   479 err_no_data: .asciz "No data found.\n"
             69 6E 65 20 6F 6E 6C
             79 20
      0090F7 75 73 61 67 65 2E 0A   480 err_no_prog: .asciz "No program in RAM!\n"
             00 64 75 70 6C 69 63
             61 74 65 20 6E 61
      00910B 6D 65 2E 0A 00 46 69   481 err_no_fspace: .asciz "File system full.\n" 
             6C 65 20 6E 6F 74 20
             66 6F 75 6E 64
      00911E 2E 0A 00 62 61 64 20   482 err_buf_full: .asciz "Buffer full\n"
             76 61 6C 75 65 2E
                                    483 
      00912B 0A 00 46 69 6C 65 20   484 rt_msg: .asciz "\nrun time error, "
             69 6E 20 65 78 74 65
             6E 64 65 64
      00913D 20 6D 65 6D 6F 72 79   485 comp_msg: .asciz "\ncompile error, "
             2C 20 63 61 6E 27 74
             20 62 65
      00914E 20 72 75 6E 20 66 72   486 tk_id: .asciz "last token id: "
             6F 6D 20 74 68 65 72
             65 2E
                                    487 
      001157                        488 syntax_error::
      00915E 0A 00            [ 1]  489 	ld a,#ERR_SYNTAX 
                                    490 
      001159                        491 tb_error::
      009160 4E 6F 20 64 61   [ 2]  492 	btjt flags,#FCOMP,1$
      009165 74               [ 1]  493 	push a 
      009166 61 20 66         [ 2]  494 	ldw x, #rt_msg 
      009169 6F 75 6E         [ 4]  495 	call puts 
      00916C 64               [ 1]  496 	pop a 
      00916D 2E 0A 00         [ 2]  497 	ldw x, #err_msg 
      009170 4E 6F 20 70      [ 1]  498 	clr acc16 
      009174 72               [ 1]  499 	sll a
      009175 6F 67 72 61      [ 1]  500 	rlc acc16  
      009179 6D 20 69         [ 1]  501 	ld acc8, a 
      00917C 6E 20 52 41      [ 2]  502 	addw x,acc16 
      009180 4D               [ 2]  503 	ldw x,(x)
      009181 21 0A 00         [ 4]  504 	call puts
      009184 46 69 6C         [ 2]  505 	ldw x,basicptr
      009187 65 20 73         [ 1]  506 	ld a,in 
      00918A 79 73 74         [ 4]  507 	call prt_basic_line
      00918D 65 6D 20         [ 2]  508 	ldw x,#tk_id 
      009190 66 75 6C         [ 4]  509 	call puts 
      009193 6C 2E 0A         [ 1]  510 	ld a,in.saved 
      009196 00               [ 1]  511 	clrw x 
      009197 42               [ 1]  512 	ld xl,a 
      009198 75 66 66 65      [ 2]  513 	addw x,basicptr 
      00919C 72               [ 1]  514 	ld a,(x)
      00919D 20               [ 1]  515 	clrw x 
      00919E 66               [ 1]  516 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      00919F 75 6C 6C         [ 4]  517 	call print_int
      0091A2 0A 00 0A 72 75   [ 2]  518 	btjf flags,#FAUTORUN ,6$
      0091A7 6E 20            [ 2]  519 	jra 6$
      0011A2                        520 1$:	
      0091A9 74               [ 1]  521 	push a 
      0091AA 69 6D 65         [ 2]  522 	ldw x,#comp_msg
      0091AD 20 65 72         [ 4]  523 	call puts 
      0091B0 72               [ 1]  524 	pop a 
      0091B1 6F 72 2C         [ 2]  525 	ldw x, #err_msg 
      0091B4 20 00 0A 63      [ 1]  526 	clr acc16 
      0091B8 6F               [ 1]  527 	sll a
      0091B9 6D 70 69 6C      [ 1]  528 	rlc acc16  
      0091BD 65 20 65         [ 1]  529 	ld acc8, a 
      0091C0 72 72 6F 72      [ 2]  530 	addw x,acc16 
      0091C4 2C               [ 2]  531 	ldw x,(x)
      0091C5 20 00 6C         [ 4]  532 	call puts
      0091C8 61 73 74         [ 2]  533 	ldw x,#tib
      0091CB 20 74 6F         [ 4]  534 	call puts 
      0091CE 6B 65            [ 1]  535 	ld a,#CR 
      0091D0 6E 20 69         [ 4]  536 	call putc
      0091D3 64 3A 20         [ 2]  537 	ldw x,in.w
      0091D6 00 03 BB         [ 4]  538 	call spaces
      0091D7 A6 5E            [ 1]  539 	ld a,#'^
      0091D7 A6 02 F1         [ 4]  540 	call putc 
      0091D9 AE 17 FF         [ 2]  541 6$: ldw x,#STACK_EMPTY 
      0091D9 72               [ 1]  542     ldw sp,x
      0011DB                        543 warm_start:
      0091DA 0A 00 22         [ 4]  544 	call warm_init
                                    545 ;----------------------------
                                    546 ;   BASIC interpreter
                                    547 ;----------------------------
      0011DE                        548 cmd_line: ; user interface 
      0091DD 44 88            [ 1]  549 	ld a,#CR 
      0091DF AE 91 A4         [ 4]  550 	call putc 
      0091E2 CD 83            [ 1]  551 	ld a,#'> 
      0091E4 CE 84 AE         [ 4]  552 	call putc
      0091E7 90 56 72         [ 4]  553 	call readln
      0091EA 5F 00 0E 48      [ 1]  554 	tnz count 
      0091EE 72 59            [ 1]  555 	jreq cmd_line
      0091F0 00 0E C7         [ 4]  556 	call compile
                                    557 ;;; test 
                                    558 ; ldw x,txtbgn 
                                    559 ; ldw y,#16 
                                    560 ; call hex_dump
                                    561 ;;; end test
                                    562 
                                    563 ; if text begin with a line number
                                    564 ; the compiler set count to zero    
                                    565 ; so code is not interpreted
      0091F3 00 0F 72 BB      [ 1]  566 	tnz count 
      0091F7 00 0E            [ 1]  567 	jreq cmd_line
                                    568 
                                    569 ; if direct command 
                                    570 ; it's ready to interpret 
                                    571 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



                                    572 ;; This is the interpreter loop
                                    573 ;; for each BASIC code line. 
                                    574 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      0011FA                        575 interpreter: 
      0091F9 FE CD 83         [ 1]  576 	ld a,in 
      0091FC CE CE 00         [ 1]  577 	cp a,count 
      0091FF 05 C6            [ 1]  578 	jrmi interp_loop
      001202                        579 next_line:
      009201 00 02 CD 9A 3C   [ 2]  580 	btjf flags, #FRUN, cmd_line
      009206 AE 91 C7         [ 2]  581 	ldw x,basicptr
      009209 CD 83 CE C6      [ 2]  582 	addw x,in.w 
      00920D 00 03 5F         [ 2]  583 	cpw x,txtend 
      009210 97 72            [ 1]  584 	jrpl warm_start
      009212 BB 00 05         [ 2]  585 	ldw basicptr,x ; start of next line  
      009215 F6 5F            [ 1]  586 	ld a,(2,x)
      009217 97 CD 93         [ 1]  587 	ld count,a 
      00921A 1B 72 0D 00      [ 1]  588 	mov in,#3 ; skip first 3 bytes of line 
      00121F                        589 interp_loop: 
      00921E 22 37 20         [ 4]  590 	call next_token
      009221 35 00            [ 1]  591 	cp a,#TK_NONE 
      009222 27 DC            [ 1]  592 	jreq next_line 
      009222 88 AE            [ 1]  593 	cp a,#TK_CMD
      009224 91 B6            [ 1]  594 	jrne 1$
      009226 CD               [ 4]  595 	call (x) 
      009227 83 CE            [ 2]  596 	jra interp_loop 
      00122D                        597 1$:	 
      009229 84 AE            [ 1]  598 	cp a,#TK_VAR
      00922B 90 56            [ 1]  599 	jrne 2$
      00922D 72 5F 00         [ 4]  600 	call let_var  
      009230 0E 48            [ 2]  601 	jra interp_loop 
      001236                        602 2$:	
      009232 72 59            [ 1]  603 	cp a,#TK_ARRAY 
      009234 00 0E            [ 1]  604 	jrne 3$
      009236 C7 00 0F         [ 4]  605 	call let_array 
      009239 72 BB            [ 2]  606 	jra interp_loop
      00123F                        607 3$:	
      00923B 00 0E            [ 1]  608 	cp a,#TK_COLON 
      00923D FE CD            [ 1]  609 	jreq interp_loop
      00923F 83 CE            [ 1]  610 4$: cp a,#TK_LABEL 
      009241 AE 16            [ 1]  611 	jrne 5$
      009243 90 CD 83         [ 4]  612 	call skip_label
      009246 CE A6            [ 2]  613 	jra interp_loop 
      009248 0D CD 83         [ 2]  614 5$:	jp syntax_error 
                                    615 
                                    616 		
                                    617 ;--------------------------
                                    618 ; extract next token from
                                    619 ; token list 
                                    620 ; basicptr -> base address 
                                    621 ; in  -> offset in list array 
                                    622 ; output:
                                    623 ;   A 		token attribute
                                    624 ;   X 		token value if there is one
                                    625 ;----------------------------------------
      00124F                        626 next_token::
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      00924B 71               [ 1]  627 	clrw x 
      00924C CE 00 01         [ 1]  628 	ld a,in 
      00924F CD 84 3B         [ 1]  629 	ld in.saved,a ; in case "_unget_token" needed 
                                    630 ; don't replace sub by "cp a,count" 
                                    631 ; if end of line must return with A=0   	
      009252 A6 5E CD         [ 1]  632 	sub a,count 
      009255 83 71            [ 1]  633 	jreq 9$ ; end of line 
      00125B                        634 0$: 
      009257 AE 17 FF 94      [ 2]  635 	ldw y,basicptr 
      00925B 72 B9 00 00      [ 2]  636 	addw y,in.w 
      00925B CD 90            [ 1]  637 	ld a,(y)
      00925D 21 5C            [ 1]  638 	incw y   
      00925E 4D               [ 1]  639 	tnz a 
      00925E A6 0D            [ 1]  640 	jrmi 4$
      009260 CD 83            [ 1]  641 	cp a,#TK_ARRAY
      009262 71 A6            [ 1]  642 	jrpl 7$  ; no attribute for these
      00126E                        643 1$: ; 
      009264 3E CD            [ 1]  644 	cp a,#TK_CHAR
      009266 83 71            [ 1]  645 	jrne 2$
      009268 CD               [ 1]  646 	exg a,xl
      009269 84 D3            [ 1]  647 	ld a,(y)
      00926B 72               [ 1]  648 	exg a,xl  
      00926C 5D 00            [ 2]  649 	jra 6$ 
      00926E 04 27            [ 1]  650 2$:	cp a,#TK_QSTR 
      009270 ED CD            [ 1]  651 	jrne 7$
      009272 8A               [ 1]  652 	ldw x,y 
                                    653 ; move pointer after string 
      009273 F6 72            [ 1]  654 3$:	tnz (y)
      009275 5D 00            [ 1]  655 	jreq 6$
      009277 04 27            [ 1]  656 	incw y 
      009279 E4 F8            [ 2]  657 	jra 3$
      00927A                        658 4$: 
      00927A C6               [ 1]  659 	ldw x,y 
      00927B 00               [ 2]  660 	ldw x,(x)
      00927C 02 C1            [ 1]  661 	cp a,#TK_INTGR
      00927E 00 04            [ 1]  662 	jrpl 5$
      009280 2B 1D 1C         [ 2]  663 	ldw x,(code_addr,x) 
      009282 90 5C            [ 1]  664 5$:	incw y 
      009282 72 01            [ 1]  665 6$:	incw y 
      009284 00 22 D7 CE      [ 2]  666 7$:	subw y,basicptr 
      009288 00 05 72 BB      [ 2]  667 	ldw in.w,y 
      00129A                        668 9$: 
      00928C 00               [ 4]  669 	ret	
                                    670 
                                    671 ;-----------------------------------
                                    672 ; print a 16 bit integer 
                                    673 ; using variable 'base' as conversion
                                    674 ; format.
                                    675 ; input:
                                    676 ;   X       integer to print 
                                    677 ;   'base'    conversion base 
                                    678 ; output:
                                    679 ;   none 
                                    680 ;-----------------------------------
      00129B                        681 print_int:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      00928D 01 C3 00 1D      [ 1]  682 	clr acc24 
      009291 2A C8 CF         [ 2]  683 	ldw acc16,x 
      009294 00 05 E6 02 C7   [ 2]  684 	btjf acc16,#7,prti24
      009299 00 04 35 03      [ 1]  685 	cpl acc24 
                                    686 	
                                    687 ;------------------------------------
                                    688 ; print integer in acc24 
                                    689 ; input:
                                    690 ;	acc24 		integer to print 
                                    691 ;	'base' 		numerical base for conversion 
                                    692 ;   'tab_width' field width 
                                    693 ;  output:
                                    694 ;    A          string length
                                    695 ;------------------------------------
      0012AB                        696 prti24:
      00929D 00 02 B7         [ 4]  697     call itoa  ; conversion entier en  .asciz
      00929F CD 0B 15         [ 4]  698 	call right_align  
      00929F CD               [ 1]  699 	push a 
      0092A0 92 CF A1         [ 4]  700 	call puts
      0092A3 00               [ 1]  701 	pop a 
      0092A4 27               [ 4]  702     ret	
                                    703 
                                    704 ;------------------------------------
                                    705 ; convert integer in acc24 to string
                                    706 ; input:
                                    707 ;   'base'	conversion base 
                                    708 ;	acc24	integer to convert
                                    709 ; output:
                                    710 ;   X  		pointer to first char of string
                                    711 ;   A       string length
                                    712 ;------------------------------------
                           000001   713 	SIGN=1  ; integer sign 
                           000002   714 	LEN=2 
                           000003   715 	PSTR=3
                           000004   716 	VSIZE=4 ;locals size
      0012B7                        717 itoa::
      0012B7                        718 	_vars VSIZE
      0092A5 DC A1            [ 2]    1     sub sp,#VSIZE 
      0092A7 80 26            [ 1]  719 	clr (LEN,sp) ; string length  
      0092A9 03 FD            [ 1]  720 	clr (SIGN,sp)    ; sign
      0092AB 20 F2 0A         [ 1]  721 	ld a,base 
      0092AD A1 0A            [ 1]  722 	cp a,#10
      0092AD A1 85            [ 1]  723 	jrne 1$
                                    724 	; base 10 string display with negative sign if bit 23==1
      0092AF 26 05 CD 98 C5   [ 2]  725 	btjf acc24,#7,1$
      0092B4 20 E9            [ 1]  726 	cpl (SIGN,sp)
      0092B6 CD 13 84         [ 4]  727 	call neg_acc24
      0012CE                        728 1$:
                                    729 ; initialize string pointer 
      0092B6 A1 06 26         [ 2]  730 	ldw x,#tib 
      0092B9 05 CD 98         [ 2]  731 	addw x,#TIB_SIZE
      0092BC C2               [ 2]  732 	decw x 
      0092BD 20               [ 1]  733 	clr (x)
      0092BE E0               [ 2]  734 	decw x 
      0092BF A6 20            [ 1]  735 	ld a,#32
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      0092BF A1               [ 1]  736 	ld (x),a
      0092C0 0B 27            [ 1]  737 	inc (LEN,sp)
      0012DC                        738 itoa_loop:
      0092C2 DC A1 01         [ 1]  739     ld a,base
      0092C5 26 05            [ 2]  740 	ldw (PSTR,sp),x 
      0092C7 CD 9D 46         [ 4]  741     call divu24_8 ; acc24/A 
      0092CA 20 D3            [ 2]  742 	ldw x,(PSTR,sp)
      0092CC CC 91            [ 1]  743     add a,#'0  ; remainder of division
      0092CE D7 3A            [ 1]  744     cp a,#'9+1
      0092CF 2B 02            [ 1]  745     jrmi 2$
      0092CF 5F C6            [ 1]  746     add a,#7 
      0012EE                        747 2$:	
      0092D1 00               [ 2]  748 	decw x
      0092D2 02               [ 1]  749     ld (x),a
      0092D3 C7 00            [ 1]  750 	inc (LEN,sp)
                                    751 	; if acc24==0 conversion done
      0092D5 03 C0 00         [ 1]  752 	ld a,acc24
      0092D8 04 27 3F         [ 1]  753 	or a,acc16
      0092DB CA 00 0E         [ 1]  754 	or a,acc8
      0092DB 90 CE            [ 1]  755     jrne itoa_loop
                                    756 	;conversion done, next add '$' or '-' as required
      0092DD 00 05 72         [ 1]  757 	ld a,base 
      0092E0 B9 00            [ 1]  758 	cp a,#16
      0092E2 01 90            [ 1]  759 	jreq 8$
      0092E4 F6 90            [ 1]  760 	ld a,(SIGN,sp)
      0092E6 5C 4D            [ 1]  761     jreq 10$
      0092E8 2B 1B            [ 1]  762     ld a,#'-
      0092EA A1 06            [ 2]  763 	jra 9$ 
                                    764 ; don't print more than 4 digits
                                    765 ; in hexadecimal to avoid '-' sign 
                                    766 ; extend display 	
      0092EC 2A 24            [ 1]  767 8$: ld a,(LEN,sp) 
      0092EE A1 06            [ 1]  768 	cp a,#6 
      0092EE A1 03            [ 1]  769 	jrmi 81$
      0092F0 26               [ 1]  770 	incw x
      0092F1 06 41            [ 1]  771 	dec (LEN,sp)
      0092F3 90 F6            [ 2]  772 	jra 8$
      001317                        773 81$:	
      0092F5 41 20            [ 1]  774 	ld a,#'$ 
      0092F7 18               [ 2]  775 9$: decw x
      0092F8 A1               [ 1]  776     ld (x),a
      0092F9 02 26            [ 1]  777 	inc (LEN,sp)
      00131D                        778 10$:
      0092FB 16 93            [ 1]  779 	ld a,(LEN,sp)
      00131F                        780 	_drop VSIZE
      0092FD 90 7D            [ 2]    1     addw sp,#VSIZE 
      0092FF 27               [ 4]  781 	ret
                                    782 
                                    783 ;-------------------------------------
                                    784 ; divide uint24_t by uint8_t
                                    785 ; used to convert uint24_t to string
                                    786 ; input:
                                    787 ;	acc24	dividend
                                    788 ;   A 		divisor
                                    789 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



                                    790 ;   acc24	quotient
                                    791 ;   A		remainder
                                    792 ;------------------------------------- 
                                    793 ; offset  on sp of arguments and locals
                           000001   794 	U8   = 1   ; divisor on stack
                           000001   795 	VSIZE =1
      001322                        796 divu24_8:
      009300 0F               [ 2]  797 	pushw x ; save x
      009301 90               [ 1]  798 	push a 
                                    799 	; ld dividend UU:MM bytes in X
      009302 5C 20 F8         [ 1]  800 	ld a, acc24
      009305 95               [ 1]  801 	ld xh,a
      009305 93 FE A1         [ 1]  802 	ld a,acc24+1
      009308 84               [ 1]  803 	ld xl,a
      009309 2A 03            [ 1]  804 	ld a,(U8,SP) ; divisor
      00930B DE               [ 2]  805 	div x,a ; UU:MM/U8
      00930C AB               [ 1]  806 	push a  ;save remainder
      00930D 9C               [ 1]  807 	ld a,xh
      00930E 90 5C 90         [ 1]  808 	ld acc24,a
      009311 5C               [ 1]  809 	ld a,xl
      009312 72 B2 00         [ 1]  810 	ld acc24+1,a
      009315 05               [ 1]  811 	pop a
      009316 90               [ 1]  812 	ld xh,a
      009317 CF 00 01         [ 1]  813 	ld a,acc24+2
      00931A 97               [ 1]  814 	ld xl,a
      00931A 81 01            [ 1]  815 	ld a,(U8,sp) ; divisor
      00931B 62               [ 2]  816 	div x,a  ; R:LL/U8
      00931B 72 5F            [ 1]  817 	ld (U8,sp),a ; save remainder
      00931D 00               [ 1]  818 	ld a,xl
      00931E 0D CF 00         [ 1]  819 	ld acc24+2,a
      009321 0E               [ 1]  820 	pop a
      009322 72               [ 2]  821 	popw x
      009323 0F               [ 4]  822 	ret
                                    823 
                                    824 ;--------------------------------------
                                    825 ; unsigned multiply uint24_t by uint8_t
                                    826 ; use to convert numerical string to uint24_t
                                    827 ; input:
                                    828 ;	acc24	uint24_t 
                                    829 ;   A		uint8_t
                                    830 ; output:
                                    831 ;   acc24   A*acc24
                                    832 ;-------------------------------------
                                    833 ; local variables offset  on sp
                           000003   834 	U8   = 3   ; A pushed on stack
                           000002   835 	OVFL = 2  ; multiplicaton overflow low byte
                           000001   836 	OVFH = 1  ; multiplication overflow high byte
                           000003   837 	VSIZE = 3
      00134A                        838 mulu24_8:
      009324 00               [ 2]  839 	pushw x    ; save X
                                    840 	; local variables
      009325 0E               [ 1]  841 	push a     ; U8
      009326 04               [ 1]  842 	clrw x     ; initialize overflow to 0
      009327 72               [ 2]  843 	pushw x    ; multiplication overflow
                                    844 ; multiply low byte.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009328 53 00 0D         [ 1]  845 	ld a,acc24+2
      00932B 97               [ 1]  846 	ld xl,a
      00932B CD 93            [ 1]  847 	ld a,(U8,sp)
      00932D 37               [ 4]  848 	mul x,a
      00932E CD               [ 1]  849 	ld a,xl
      00932F 8B 95 88         [ 1]  850 	ld acc24+2,a
      009332 CD               [ 1]  851 	ld a, xh
      009333 83 CE            [ 1]  852 	ld (OVFL,sp),a
                                    853 ; multipy middle byte
      009335 84 81 0D         [ 1]  854 	ld a,acc24+1
      009337 97               [ 1]  855 	ld xl,a
      009337 52 04            [ 1]  856 	ld a, (U8,sp)
      009339 0F               [ 4]  857 	mul x,a
                                    858 ; add overflow to this partial product
      00933A 02 0F 01         [ 2]  859 	addw x,(OVFH,sp)
      00933D C6               [ 1]  860 	ld a,xl
      00933E 00 0B A1         [ 1]  861 	ld acc24+1,a
      009341 0A               [ 1]  862 	clr a
      009342 26 0A            [ 1]  863 	adc a,#0
      009344 72 0F            [ 1]  864 	ld (OVFH,sp),a
      009346 00               [ 1]  865 	ld a,xh
      009347 0D 05            [ 1]  866 	ld (OVFL,sp),a
                                    867 ; multiply most signficant byte	
      009349 03 01 CD         [ 1]  868 	ld a, acc24
      00934C 94               [ 1]  869 	ld xl, a
      00934D 04 03            [ 1]  870 	ld a, (U8,sp)
      00934E 42               [ 4]  871 	mul x,a
      00934E AE 16 90         [ 2]  872 	addw x, (OVFH,sp)
      009351 1C               [ 1]  873 	ld a, xl
      009352 00 50 5A         [ 1]  874 	ld acc24,a
      009355 7F 5A            [ 2]  875     addw sp,#VSIZE
      009357 A6               [ 2]  876 	popw x
      009358 20               [ 4]  877 	ret
                                    878 
                                    879 ;------------------------------------
                                    880 ;  two's complement acc24
                                    881 ;  input:
                                    882 ;		acc24 variable
                                    883 ;  output:
                                    884 ;		acc24 variable
                                    885 ;-------------------------------------
      001384                        886 neg_acc24:
      009359 F7 0C 02 0E      [ 1]  887 	cpl acc24+2
      00935C 72 53 00 0D      [ 1]  888 	cpl acc24+1
      00935C C6 00 0B 1F      [ 1]  889 	cpl acc24
      009360 03 CD            [ 1]  890 	ld a,#1
      009362 93 A2 1E         [ 1]  891 	add a,acc24+2
      009365 03 AB 30         [ 1]  892 	ld acc24+2,a
      009368 A1               [ 1]  893 	clr a
      009369 3A 2B 02         [ 1]  894 	adc a,acc24+1
      00936C AB 07 0D         [ 1]  895 	ld acc24+1,a 
      00936E 4F               [ 1]  896 	clr a 
      00936E 5A F7 0C         [ 1]  897 	adc a,acc24 
      009371 02 C6 00         [ 1]  898 	ld acc24,a 
      009374 0D               [ 4]  899 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



                                    900 
                                    901 
                                    902 
                                    903 
                                    904 ;------------------------------------
                                    905 ; convert alpha to uppercase
                                    906 ; input:
                                    907 ;    a  character to convert
                                    908 ; output:
                                    909 ;    a  uppercase character
                                    910 ;------------------------------------
      0013A7                        911 to_upper::
      009375 CA 00            [ 1]  912 	cp a,#'a
      009377 0E CA            [ 1]  913 	jrpl 1$
      009379 00               [ 4]  914 0$:	ret
      00937A 0F 26            [ 1]  915 1$: cp a,#'z	
      00937C DF C6            [ 1]  916 	jrugt 0$
      00937E 00 0B            [ 1]  917 	sub a,#32
      009380 A1               [ 4]  918 	ret
                                    919 	
                                    920 ;------------------------------------
                                    921 ; convert pad content in integer
                                    922 ; input:
                                    923 ;    x		.asciz to convert
                                    924 ; output:
                                    925 ;    acc24      int24_t
                                    926 ;------------------------------------
                                    927 	; local variables
                           000001   928 	SIGN=1 ; 1 byte, 
                           000002   929 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003   930 	TEMP=3 ; 1 byte, temporary storage
                           000003   931 	VSIZE=3 ; 3 bytes reserved for local storage
      0013B3                        932 atoi24::
      009381 10               [ 2]  933 	pushw x 
      0013B4                        934 	_vars VSIZE
      009382 27 08            [ 2]    1     sub sp,#VSIZE 
                                    935 	; acc24=0 
      009384 7B 01 27 15      [ 1]  936 	clr acc24    
      009388 A6 2D 20 0D      [ 1]  937 	clr acc16
      00938C 7B 02 A1 06      [ 1]  938 	clr acc8 
      009390 2B 05            [ 1]  939 	clr (SIGN,sp)
      009392 5C 0A            [ 1]  940 	ld a,#10
      009394 02 20            [ 1]  941 	ld (BASE,sp),a ; default base decimal
      009396 F5               [ 1]  942 	ld a,(x)
      009397 27 47            [ 1]  943 	jreq 9$  ; completed if 0
      009397 A6 24            [ 1]  944 	cp a,#'-
      009399 5A F7            [ 1]  945 	jrne 1$
      00939B 0C 02            [ 1]  946 	cpl (SIGN,sp)
      00939D 20 08            [ 2]  947 	jra 2$
      00939D 7B 02            [ 1]  948 1$: cp a,#'$
      00939F 5B 04            [ 1]  949 	jrne 3$
      0093A1 81 10            [ 1]  950 	ld a,#16
      0093A2 6B 02            [ 1]  951 	ld (BASE,sp),a
      0093A2 89               [ 1]  952 2$:	incw x
      0093A3 88               [ 1]  953 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      0013DD                        954 3$:	
      0093A4 C6 00            [ 1]  955 	cp a,#'a
      0093A6 0D 95            [ 1]  956 	jrmi 4$
      0093A8 C6 00            [ 1]  957 	sub a,#32
      0093AA 0E 97            [ 1]  958 4$:	cp a,#'0
      0093AC 7B 01            [ 1]  959 	jrmi 9$
      0093AE 62 88            [ 1]  960 	sub a,#'0
      0093B0 9E C7            [ 1]  961 	cp a,#10
      0093B2 00 0D            [ 1]  962 	jrmi 5$
      0093B4 9F C7            [ 1]  963 	sub a,#7
      0093B6 00 0E            [ 1]  964 	cp a,(BASE,sp)
      0093B8 84 95            [ 1]  965 	jrpl 9$
      0093BA C6 00            [ 1]  966 5$:	ld (TEMP,sp),a
      0093BC 0F 97            [ 1]  967 	ld a,(BASE,sp)
      0093BE 7B 01 62         [ 4]  968 	call mulu24_8
      0093C1 6B 01            [ 1]  969 	ld a,(TEMP,sp)
      0093C3 9F C7 00         [ 1]  970 	add a,acc24+2
      0093C6 0F 84 85         [ 1]  971 	ld acc24+2,a
      0093C9 81               [ 1]  972 	clr a
      0093CA C9 00 0D         [ 1]  973 	adc a,acc24+1
      0093CA 89 88 5F         [ 1]  974 	ld acc24+1,a
      0093CD 89               [ 1]  975 	clr a
      0093CE C6 00 0F         [ 1]  976 	adc a,acc24
      0093D1 97 7B 03         [ 1]  977 	ld acc24,a
      0093D4 42 9F            [ 2]  978 	jra 2$
      0093D6 C7 00            [ 1]  979 9$:	tnz (SIGN,sp)
      0093D8 0F 9E            [ 1]  980     jreq atoi_exit
      0093DA 6B 02 C6         [ 4]  981     call neg_acc24
      001419                        982 atoi_exit: 
      001419                        983 	_drop VSIZE
      0093DD 00 0E            [ 2]    1     addw sp,#VSIZE 
      0093DF 97               [ 2]  984 	popw x ; restore x
      0093E0 7B               [ 4]  985 	ret
                                    986 
                                    987 
                                    988 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    989 ;;   TINY BASIC  operators,
                                    990 ;;   commands and functions 
                                    991 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    992 
                                    993 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    994 ;;  Arithmetic operators
                                    995 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    996 
                                    997 ;debug support
                           000001   998 DEBUG_PRT=1
                           000001   999 .if DEBUG_PRT 
                           000001  1000 	REGA=1
                           000002  1001 	SAVEB=2
                           000003  1002 	REGX=3
                           000005  1003 	REGY=5
                           000007  1004 	ACC24=7
                           000009  1005 	VSIZE=9 
      00141D                       1006 printxy:
      00141D                       1007 	_vars VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      0093E1 03 42            [ 2]    1     sub sp,#VSIZE 
      0093E3 72 FB            [ 1] 1008 	ld (REGA,sp),a 
      0093E5 01 9F C7         [ 1] 1009 	ld a,base 
      0093E8 00 0E            [ 1] 1010 	ld (SAVEB,sp),a
      0093EA 4F A9            [ 2] 1011 	ldw (REGX,sp),x
      0093EC 00 6B            [ 2] 1012 	ldw (REGY,sp),y
      0093EE 01 9E 6B         [ 2] 1013 	ldw x,acc24 
      0093F1 02 C6 00         [ 1] 1014 	ld a,acc8 
      0093F4 0D 97            [ 2] 1015 	ldw (ACC24,sp),x 
      0093F6 7B 03            [ 1] 1016 	ld (ACC24+2,sp),a 
      0093F8 42 72 FB 01      [ 1] 1017 	mov base,#16 
      0093FC 9F               [ 1] 1018 	clrw x 
      0093FD C7 00            [ 1] 1019 	ld a,(REGA,sp)
      0093FF 0D               [ 1] 1020 	ld xl,a 
      009400 5B 03 85         [ 4] 1021 	call print_int
      009403 81 20            [ 1] 1022 	ld a,#SPACE 
      009404 CD 02 F1         [ 4] 1023 	call putc  
      009404 72 53            [ 2] 1024 	ldw x,(REGX,sp)
      009406 00 0F 72         [ 4] 1025 	call print_int 
      009409 53 00            [ 1] 1026 	ld a,#SPACE 
      00940B 0E 72 53         [ 4] 1027 	call putc  
      00940E 00 0D            [ 2] 1028 	ldw x,(REGY,sp)
      009410 A6 01 CB         [ 4] 1029 	call print_int 
      009413 00 0F            [ 1] 1030 	ld a,#CR 
      009415 C7 00 0F         [ 4] 1031 	call putc 
      009418 4F C9            [ 1] 1032 	ld a,(ACC24+2,sp)
      00941A 00 0E            [ 2] 1033 	ldw x,(ACC24,sp)
      00941C C7 00 0E         [ 2] 1034 	ldw acc24,x 
      00941F 4F C9 00         [ 1] 1035 	ld acc8,a
      009422 0D C7            [ 1] 1036 	ld a,(SAVEB,sp)
      009424 00 0D 81         [ 1] 1037 	ld base,a 
      009427 7B 01            [ 1] 1038 	ld a,(REGA,sp)
      009427 A1 61            [ 2] 1039 	ldw x,(REGX,sp)
      009429 2A 01            [ 2] 1040 	ldw y,(REGY,sp)
      00146D                       1041 	_drop VSIZE 
      00942B 81 A1            [ 2]    1     addw sp,#VSIZE 
      00942D 7A               [ 4] 1042 	ret 
                                   1043 .endif 
                                   1044 
                                   1045 
                                   1046 ;--------------------------------------
                                   1047 ;  multiply 2 uint16_t return uint32_t
                                   1048 ;  input:
                                   1049 ;     x       uint16_t 
                                   1050 ;     y       uint16_t 
                                   1051 ;  output:
                                   1052 ;     x       product bits 15..0
                                   1053 ;     y       product bits 31..16 
                                   1054 ;---------------------------------------
                           000001  1055 		U1=1  ; uint16_t 
                           000003  1056 		DBL=3 ; uint32_t
                           000006  1057 		VSIZE=6
      001470                       1058 umstar:
      001470                       1059 	_vars VSIZE 
      00942E 22 FB            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      009430 A0 20            [ 2] 1060 	ldw (U1,sp),x 
                                   1061 ;initialize bits 31..16 of 
                                   1062 ;product to zero 
      009432 81 03            [ 1] 1063 	clr (DBL,sp)
      009433 0F 04            [ 1] 1064 	clr (DBL+1,sp)
                                   1065 ; produc U1L*U2L 
      009433 89 52            [ 1] 1066 	ld a,yl 
      009435 03               [ 4] 1067 	mul x,a 
      009436 72 5F            [ 2] 1068 	ldw (DBL+2,sp),x
                                   1069 ; product U1H*U2L 
      009438 00 0D            [ 1] 1070 	ld a,(U1,sp) ; xh 
      00943A 72               [ 1] 1071 	ldw x,y
      00943B 5F               [ 4] 1072 	mul x,a 
      00943C 00               [ 1] 1073 	clr a 
      00943D 0E 72 5F         [ 2] 1074 	addw x,(DBL+1,sp) 
      009440 00               [ 1] 1075 	clr a 
      009441 0F 0F            [ 1] 1076 	adc a,(DBL,sp) 
      009443 01 A6            [ 1] 1077 	ld (DBL,sp),a ; bits 23..17 
      009445 0A 6B            [ 2] 1078 	ldw (DBL+1,sp),x ; bits 15..0 
                                   1079 ; product U1L*U2H
      009447 02 F6            [ 1] 1080 	swapw y 
      009449 27               [ 1] 1081 	ldw x,y
      00944A 47 A1            [ 1] 1082 	ld a,(U1+1,sp)
      00944C 2D               [ 4] 1083 	mul x,a
      00944D 26 04 03         [ 2] 1084 	addw x,(DBL+1,sp)
      009450 01               [ 1] 1085 	clr a 
      009451 20 08            [ 1] 1086 	adc a,(DBL,sp)
      009453 A1 24            [ 1] 1087 	ld (DBL,sp),a 
      009455 26 06            [ 2] 1088 	ldw (DBL+1,sp),x 
                                   1089 ; product U1H*U2H 	
      009457 A6 10            [ 1] 1090 	ld a,(U1,sp)
      009459 6B               [ 1] 1091 	ldw x,y  
      00945A 02               [ 4] 1092 	mul x,a 
      00945B 5C F6 03         [ 2] 1093 	addw x,(DBL,sp)
      00945D 90 93            [ 1] 1094 	ldw y,x 
      00945D A1 61            [ 2] 1095 	ldw x,(DBL+2,sp)
      0014A7                       1096 	_drop VSIZE 
      00945F 2B 02            [ 2]    1     addw sp,#VSIZE 
      009461 A0               [ 4] 1097 	ret
                                   1098 
                                   1099 
                                   1100 ;-------------------------------------
                                   1101 ; multiply 2 integers
                                   1102 ; input:
                                   1103 ;  	x       n1 
                                   1104 ;   y 		n2 
                                   1105 ; output:
                                   1106 ;	X        N1*N2 bits 15..0
                                   1107 ;   Y        N1*N2 bits 31..16 
                                   1108 ;-------------------------------------
                           000001  1109 	SIGN=1
                           000001  1110 	VSIZE=1
      0014AA                       1111 multiply:
      0014AA                       1112 	_vars VSIZE 
      009462 20 A1            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      009464 30 2B            [ 1] 1113 	clr (SIGN,sp)
      009466 2B               [ 1] 1114 	ld a,xh 
      009467 A0 30            [ 1] 1115 	and a,#0x80
      009469 A1 0A            [ 1] 1116 	jrpl 1$
      00946B 2B 06            [ 1] 1117 	cpl (SIGN,sp)
      00946D A0               [ 2] 1118 	negw x 
      0014B6                       1119 1$:	
      00946E 07 11            [ 1] 1120 	ld a,yh
      009470 02 2A            [ 1] 1121 	and a,#0x80  
      009472 1F 6B            [ 1] 1122 	jrpl 2$ 
      009474 03 7B            [ 1] 1123 	cpl (SIGN,sp)
      009476 02 CD            [ 2] 1124 	negw y 
      0014C0                       1125 2$:	
      009478 93 CA 7B         [ 4] 1126 	call umstar
      00947B 03 CB            [ 1] 1127 	ld a,(SIGN,sp)
      00947D 00 0F            [ 1] 1128 	jreq 3$
      00947F C7 00 0F         [ 4] 1129 	call dneg 
      0014CA                       1130 3$:	
      0014CA                       1131 	_drop VSIZE 
      009482 4F C9            [ 2]    1     addw sp,#VSIZE 
      009484 00               [ 4] 1132 	ret
                                   1133 
                                   1134 ;--------------------------------------
                                   1135 ; divide uint32_t/uint16_t
                                   1136 ; return:  quotient and remainder 
                                   1137 ; quotient expected to be uint16_t 
                                   1138 ; input:
                                   1139 ;   DBLDIVDND    on stack 
                                   1140 ;   X            divisor 
                                   1141 ; output:
                                   1142 ;   X            quotient 
                                   1143 ;   Y            remainder 
                                   1144 ;---------------------------------------
                           000003  1145 	VSIZE=3
      0014CD                       1146 	_argofs VSIZE 
                           000005     1     ARG_OFS=2+VSIZE 
      0014CD                       1147 	_arg DBLDIVDND 1
                           000006     1     DBLDIVDND=ARG_OFS+1 
                                   1148 	; local variables 
                           000001  1149 	DIVISOR=1 
                           000003  1150 	CNTR=3 
      0014CD                       1151 udiv32_16:
      0014CD                       1152 	_vars VSIZE 
      009485 0E C7            [ 2]    1     sub sp,#VSIZE 
      009487 00 0E            [ 2] 1153 	ldw (DIVISOR,sp),x	; save divisor 
      009489 4F C9            [ 2] 1154 	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
      00948B 00 0D            [ 2] 1155 	ldw y,(DBLDIVDND,sp) ; bits 31..16
      00948D C7 00            [ 2] 1156 	tnzw y
      00948F 0D 20            [ 1] 1157 	jrne long_division 
      009491 C9 0D            [ 2] 1158 	ldw y,(DIVISOR,sp)
      009493 01               [ 2] 1159 	divw x,y
      0014DC                       1160 	_drop VSIZE 
      009494 27 03            [ 2]    1     addw sp,#VSIZE 
      009496 CD               [ 4] 1161 	ret
      0014DF                       1162 long_division:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      009497 94               [ 1] 1163 	exgw x,y ; hi in x, lo in y 
      009498 04 11            [ 1] 1164 	ld a,#17 
      009499 6B 03            [ 1] 1165 	ld (CNTR,sp),a
      0014E4                       1166 1$:
      009499 5B 03            [ 2] 1167 	cpw x,(DIVISOR,sp)
      00949B 85 81            [ 1] 1168 	jrmi 2$
      00949D 72 F0 01         [ 2] 1169 	subw x,(DIVISOR,sp)
      00949D 52               [ 1] 1170 2$:	ccf 
      00949E 09 6B            [ 2] 1171 	rlcw y 
      0094A0 01               [ 2] 1172 	rlcw x 
      0094A1 C6 00            [ 1] 1173 	dec (CNTR,sp)
      0094A3 0B 6B            [ 1] 1174 	jrne 1$
      0094A5 02               [ 1] 1175 	exgw x,y 
      0014F4                       1176 	_drop VSIZE 
      0094A6 1F 03            [ 2]    1     addw sp,#VSIZE 
      0094A8 17               [ 4] 1177 	ret
                                   1178 
                                   1179 ;-----------------------------
                                   1180 ; negate double int.
                                   1181 ; input:
                                   1182 ;   x     bits 15..0
                                   1183 ;   y     bits 31..16
                                   1184 ; output: 
                                   1185 ;   x     bits 15..0
                                   1186 ;   y     bits 31..16
                                   1187 ;-----------------------------
      0014F7                       1188 dneg:
      0094A9 05               [ 2] 1189 	cplw x 
      0094AA CE 00            [ 2] 1190 	cplw y 
      0094AC 0D C6 00         [ 2] 1191 	addw x,#1 
      0094AF 0F 1F            [ 1] 1192 	jrnc 1$
      0094B1 07 6B            [ 1] 1193 	incw y 
      0094B3 09               [ 4] 1194 1$: ret 
                                   1195 
                                   1196 
                                   1197 ;--------------------------------
                                   1198 ; sign extend single to double
                                   1199 ; input:
                                   1200 ;   x    int16_t
                                   1201 ; output:
                                   1202 ;   x    int32_t bits 15..0
                                   1203 ;   y    int32_t bits 31..16
                                   1204 ;--------------------------------
      001502                       1205 dbl_sign_extend:
      0094B4 35 10            [ 1] 1206 	clrw y
      0094B6 00               [ 1] 1207 	ld a,xh 
      0094B7 0B 5F            [ 1] 1208 	and a,#0x80 
      0094B9 7B 01            [ 1] 1209 	jreq 1$
      0094BB 97 CD            [ 2] 1210 	cplw y
      0094BD 93               [ 4] 1211 1$: ret 	
                                   1212 
                                   1213 
                                   1214 ;----------------------------------
                                   1215 ;  euclidian divide dbl/n1 
                                   1216 ;  ref: https://en.wikipedia.org/wiki/Euclidean_division
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



                                   1217 ; input:
                                   1218 ;    dbl    int32_t on stack 
                                   1219 ;    x 		n1   int16_t  disivor  
                                   1220 ; output:
                                   1221 ;    X      dbl/x  int16_t 
                                   1222 ;    Y      remainder int16_t 
                                   1223 ;----------------------------------
                           000008  1224 	VSIZE=8
      00150C                       1225 	_argofs VSIZE 
                           00000A     1     ARG_OFS=2+VSIZE 
      00150C                       1226 	_arg DIVDNDHI 1 
                           00000B     1     DIVDNDHI=ARG_OFS+1 
      00150C                       1227 	_arg DIVDNDLO 3
                           00000D     1     DIVDNDLO=ARG_OFS+3 
                                   1228 	; local variables
                           000001  1229 	DBLHI=1
                           000003  1230 	DBLLO=3 
                           000005  1231 	SDIVSR=5 ; sign divisor
                           000006  1232 	SQUOT=6 ; sign dividend 
                           000007  1233 	DIVISR=7 ; divisor 
      00150C                       1234 div32_16:
      00150C                       1235 	_vars VSIZE 
      0094BE 1B A6            [ 2]    1     sub sp,#VSIZE 
      0094C0 20 CD            [ 1] 1236 	clr (SDIVSR,sp)
      0094C2 83 71            [ 1] 1237 	clr (SQUOT,sp)
                                   1238 ; copy arguments 
      0094C4 1E 03            [ 2] 1239 	ldw y,(DIVDNDHI,sp)
      0094C6 CD 93            [ 2] 1240 	ldw (DBLHI,sp),y
      0094C8 1B A6            [ 2] 1241 	ldw y,(DIVDNDLO,sp)
      0094CA 20 CD            [ 2] 1242 	ldw (DBLLO,sp),y 
                                   1243 ; check for 0 divisor
      0094CC 83               [ 2] 1244 	tnzw x 
      0094CD 71 1E            [ 1] 1245     jrne 0$
      0094CF 05 CD            [ 1] 1246 	ld a,#ERR_DIV0 
      0094D1 93 1B A6         [ 2] 1247 	jp tb_error 
                                   1248 ; check divisor sign 	
      0094D4 0D               [ 1] 1249 0$:	ld a,xh 
      0094D5 CD 83            [ 1] 1250 	and a,#0x80 
      0094D7 71 7B            [ 1] 1251 	jreq 1$
      0094D9 09 1E            [ 1] 1252 	cpl (SDIVSR,sp)
      0094DB 07 CF            [ 1] 1253 	cpl (SQUOT,sp)
      0094DD 00               [ 2] 1254 	negw x
      0094DE 0D C7            [ 2] 1255 1$:	ldw (DIVISR,sp),x
                                   1256 ; check dividend sign 	 
      0094E0 00 0F            [ 1] 1257  	ld a,(DBLHI,sp) 
      0094E2 7B 02            [ 1] 1258 	and a,#0x80 
      0094E4 C7 00            [ 1] 1259 	jreq 2$ 
      0094E6 0B 7B            [ 1] 1260 	cpl (SQUOT,sp)
      0094E8 01 1E            [ 2] 1261 	ldw x,(DBLLO,sp)
      0094EA 03 16            [ 2] 1262 	ldw y,(DBLHI,sp)
      0094EC 05 5B 09         [ 4] 1263 	call dneg 
      0094EF 81 03            [ 2] 1264 	ldw (DBLLO,sp),x 
      0094F0 17 01            [ 2] 1265 	ldw (DBLHI,sp),y 
      0094F0 52 06            [ 2] 1266 2$:	ldw x,(DIVISR,sp)
      0094F2 1F 01 0F         [ 4] 1267 	call udiv32_16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      0094F5 03 0F            [ 2] 1268 	tnzw y 
      0094F7 04 90            [ 1] 1269 	jreq 3$ 
                                   1270 ; x=quotient 
                                   1271 ; y=remainder 
                                   1272 ; if SDIVSR XOR SQUOT increment quotient and remainder.
      0094F9 9F 42            [ 1] 1273 	ld a,(SQUOT,sp)
      0094FB 1F 05            [ 1] 1274 	xor a,(SDIVSR,sp)
      0094FD 7B 01            [ 1] 1275 	jreq 3$
      0094FF 93               [ 1] 1276 	incw x 
      009500 42 4F 72 FB      [ 2] 1277 	ldw acc16,y 
      009504 04 4F            [ 2] 1278 	ldw y,(DIVISR,sp)
      009506 19 03 6B 03      [ 2] 1279 	subw y,acc16
                                   1280 ; sign quotient
      00950A 1F 04            [ 1] 1281 3$:	ld a,(SQUOT,sp)
      00950C 90 5E            [ 1] 1282 	jreq 4$
      00950E 93               [ 2] 1283 	negw x 
      001560                       1284 4$:	
      001560                       1285 	_drop VSIZE 
      00950F 7B 02            [ 2]    1     addw sp,#VSIZE 
      009511 42               [ 4] 1286 	ret 
                                   1287 
                                   1288 
                                   1289 
                                   1290 ;----------------------------------
                                   1291 ; division x/y 
                                   1292 ; input:
                                   1293 ;    X       dividend
                                   1294 ;    Y       divisor 
                                   1295 ; output:
                                   1296 ;    X       quotient
                                   1297 ;    Y       remainder 
                                   1298 ;-----------------------------------
                           000004  1299 	VSIZE=4 
                                   1300 	; local variables 
                           000001  1301 	DBLHI=1
                           000003  1302 	DBLLO=3
      001563                       1303 divide: 
      001563                       1304 	_vars VSIZE 
      009512 72 FB            [ 2]    1     sub sp,#VSIZE 
      009514 04 4F 19 03      [ 2] 1305 	ldw acc16,y
      009518 6B 03 1F         [ 4] 1306 	call dbl_sign_extend
      00951B 04 7B            [ 2] 1307 	ldw (DBLLO,sp),x 
      00951D 01 93            [ 2] 1308 	ldw (DBLHI,sp),y 
      00951F 42 72 FB         [ 2] 1309 	ldw x,acc16 
      009522 03 90 93         [ 4] 1310 	call div32_16 
      001576                       1311 	_drop VSIZE 
      009525 1E 05            [ 2]    1     addw sp,#VSIZE 
      009527 5B               [ 4] 1312 	ret
                                   1313 
                                   1314 
                                   1315 ;----------------------------------
                                   1316 ;  remainder resulting from euclidian 
                                   1317 ;  division of x/y 
                                   1318 ; input:
                                   1319 ;   x   	dividend int16_t 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



                                   1320 ;   y 		divisor int16_t
                                   1321 ; output:
                                   1322 ;   X       n1%n2 
                                   1323 ;----------------------------------
      001579                       1324 modulo:
      009528 06 81 63         [ 4] 1325 	call divide
      00952A 93               [ 1] 1326 	ldw x,y 
      00952A 52               [ 4] 1327 	ret 
                                   1328 
                                   1329 ;----------------------------------
                                   1330 ; BASIC: MULDIV(expr1,expr2,expr3)
                                   1331 ; return expr1*expr2/expr3 
                                   1332 ; product result is int32_t and 
                                   1333 ; divisiont is int32_t/int16_t
                                   1334 ;----------------------------------
                           000004  1335 	DBL_SIZE=4 
      00157E                       1336 muldiv:
      00952B 01 0F 01         [ 4] 1337 	call func_args 
      00952E 9E A4            [ 1] 1338 	cp a,#3 
      009530 80 2A            [ 1] 1339 	jreq 1$
      009532 03 03 01         [ 2] 1340 	jp syntax_error
      001588                       1341 1$: 
      009535 50 05            [ 2] 1342 	ldw x,(5,sp) ; expr1
      009536 16 03            [ 2] 1343 	ldw y,(3,sp) ; expr2
      009536 90 9E A4         [ 4] 1344 	call multiply 
      009539 80 2A            [ 2] 1345 	ldw (5,sp),x  ;int32_t 15..0
      00953B 04 03            [ 2] 1346 	ldw (3,sp),y  ;int32_t 31..16
      00953D 01               [ 2] 1347 	popw x        ; expr3 
      00953E 90 50 0C         [ 4] 1348 	call div32_16 ; int32_t/expr3 
      009540                       1349 	_drop DBL_SIZE
      009540 CD 94            [ 2]    1     addw sp,#DBL_SIZE 
      009542 F0               [ 4] 1350 	ret 
                                   1351 
                                   1352 
                                   1353 ;---------------------------------
                                   1354 ; dictionary search 
                                   1355 ; input:
                                   1356 ;	X 		dictionary entry point, name field  
                                   1357 ;   y		.asciz name to search 
                                   1358 ; output:
                                   1359 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   1360 ;  X		cmd_index
                                   1361 ;---------------------------------
                           000001  1362 	NLEN=1 ; cmd length 
                           000002  1363 	XSAVE=2
                           000004  1364 	YSAVE=4
                           000005  1365 	VSIZE=5 
      00159A                       1366 search_dict::
      00159A                       1367 	_vars VSIZE 
      009543 7B 01            [ 2]    1     sub sp,#VSIZE 
                                   1368 
      009545 27 03            [ 2] 1369 	ldw (YSAVE,sp),y 
      00159E                       1370 search_next:
      009547 CD 95            [ 2] 1371 	ldw (XSAVE,sp),x 
                                   1372 ; get name length in dictionary	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      009549 77               [ 1] 1373 	ld a,(x)
      00954A A4 0F            [ 1] 1374 	and a,#0xf 
      00954A 5B 01            [ 1] 1375 	ld (NLEN,sp),a  
      00954C 81 04            [ 2] 1376 	ldw y,(YSAVE,sp) ; name pointer 
      00954D 5C               [ 1] 1377 	incw x 
      0015A8                       1378 cp_loop:
      00954D 52 03            [ 1] 1379 	ld a,(y)
      00954F 1F 01            [ 1] 1380 	jreq str_match 
      009551 1E 08            [ 1] 1381 	tnz (NLEN,sp)
      009553 16 06            [ 1] 1382 	jreq no_match  
      009555 90               [ 1] 1383 	cp a,(x)
      009556 5D 26            [ 1] 1384 	jrne no_match 
      009558 06 16            [ 1] 1385 	incw y 
      00955A 01               [ 1] 1386 	incw x
      00955B 65 5B            [ 1] 1387 	dec (NLEN,sp)
      00955D 03 81            [ 2] 1388 	jra cp_loop 
      00955F                       1389 no_match:
      00955F 51 A6            [ 2] 1390 	ldw x,(XSAVE,sp) 
      009561 11 6B 03         [ 2] 1391 	subw x,#2 ; move X to link field
      009564 4B 00            [ 1] 1392 	push #TK_NONE 
      009564 13               [ 2] 1393 	ldw x,(x) ; next word link 
      009565 01               [ 1] 1394 	pop a ; TK_NONE 
      009566 2B 03            [ 1] 1395 	jreq search_exit  ; not found  
                                   1396 ;try next 
      009568 72 F0            [ 2] 1397 	jra search_next
      0015C7                       1398 str_match:
      00956A 01 8C            [ 2] 1399 	ldw x,(XSAVE,sp)
      00956C 90               [ 1] 1400 	ld a,(X)
      00956D 59 59            [ 1] 1401 	ld (NLEN,sp),a ; needed to test keyword type  
      00956F 0A 03            [ 1] 1402 	and a,#0xf 
                                   1403 ; move x to procedure address field 	
      009571 26               [ 1] 1404 	inc a 
      009572 F1 51 5B         [ 1] 1405 	ld acc8,a 
      009575 03 81 00 0D      [ 1] 1406 	clr acc16 
      009577 72 BB 00 0D      [ 2] 1407 	addw x,acc16 
      009577 53               [ 2] 1408 	ldw x,(x) ; routine index  
                                   1409 ;determine keyword type bits 7:6 
      009578 90 53            [ 1] 1410 	ld a,(NLEN,sp)
      00957A 1C               [ 1] 1411 	swap a 
      00957B 00 01            [ 1] 1412 	and a,#0xc
      00957D 24               [ 1] 1413 	srl a
      00957E 02               [ 1] 1414 	srl a 
      00957F 90 5C            [ 1] 1415 	add a,#128
      0015E4                       1416 search_exit: 
      0015E4                       1417 	_drop VSIZE 	 
      009581 81 05            [ 2]    1     addw sp,#VSIZE 
      009582 81               [ 4] 1418 	ret 
                                   1419 
                                   1420 ;---------------------
                                   1421 ; check if next token
                                   1422 ;  is of expected type 
                                   1423 ; input:
                                   1424 ;   A 		 expected token attribute
                                   1425 ;  ouput:
                                   1426 ;   none     if fail call syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



                                   1427 ;--------------------
      0015E7                       1428 expect:
      009582 90               [ 1] 1429 	push a 
      009583 5F 9E A4         [ 4] 1430 	call next_token 
      009586 80 27            [ 1] 1431 	cp a,(1,sp)
      009588 02 90            [ 1] 1432 	jreq 1$
      00958A 53 81 57         [ 2] 1433 	jp syntax_error
      00958C 84               [ 1] 1434 1$: pop a 
      00958C 52               [ 4] 1435 	ret 
                                   1436 
                                   1437 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1438 ; parse arguments list 
                                   1439 ; between ()
                                   1440 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015F4                       1441 func_args:
      00958D 08 0F            [ 1] 1442 	ld a,#TK_LPAREN 
      00958F 05 0F 06         [ 4] 1443 	call expect 
                                   1444 ; expected to continue in arg_list 
                                   1445 ; caller must check for TK_RPAREN 
                                   1446 
                                   1447 ;-------------------------------
                                   1448 ; parse embedded BASIC routines 
                                   1449 ; arguments list.
                                   1450 ; arg_list::=  rel[','rel]*
                                   1451 ; all arguments are of integer type
                                   1452 ; and pushed on stack 
                                   1453 ; input:
                                   1454 ;   none
                                   1455 ; output:
                                   1456 ;   stack{n}   arguments pushed on stack
                                   1457 ;   A 	number of arguments pushed on stack  
                                   1458 ;--------------------------------
      0015F9                       1459 arg_list:
      009592 16 0B            [ 1] 1460 	push #0  
      009594 17 01 16         [ 4] 1461 1$: call relation
      009597 0D 17            [ 1] 1462 	cp a,#TK_NONE 
      009599 03 5D            [ 1] 1463 	jreq 5$
      00959B 26 05            [ 1] 1464 	cp a,#TK_INTGR
      00959D A6 04            [ 1] 1465 	jrne 4$
      001606                       1466 3$: 
                                   1467 ; swap return address with argument
      00959F CC               [ 1] 1468 	pop a ; arg_count
      0095A0 91 D9            [ 2] 1469 	popw y ; return address 
      0095A2 9E               [ 2] 1470 	pushw x ; new argument 
      0095A3 A4 80            [ 2] 1471 	pushw y 
      0095A5 27               [ 1] 1472     inc a
      0095A6 05               [ 1] 1473 	push a 
      0095A7 03 05 03         [ 4] 1474 	call next_token 
      0095AA 06 50            [ 1] 1475 	cp a,#TK_COMMA 
      0095AC 1F 07            [ 1] 1476 	jreq 1$ 
      0095AE 7B 01            [ 1] 1477 	cp a,#TK_NONE 
      0095B0 A4 80            [ 1] 1478 	jreq 5$ 
      0095B2 27 0D            [ 1] 1479 4$:	cp a,#TK_RPAREN 
      0095B4 03 06            [ 1] 1480 	jreq 5$
      00161D                       1481 	_unget_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      0095B6 1E 03 16 01 CD   [ 1]    1      mov in,in.saved  
      0095BB 95               [ 1] 1482 5$:	pop a  
      0095BC 77               [ 4] 1483 	ret 
                                   1484 
                                   1485 ;--------------------------------
                                   1486 ;   BASIC commnands 
                                   1487 ;--------------------------------
                                   1488 
                                   1489 ;--------------------------------
                                   1490 ;  arithmetic and relational 
                                   1491 ;  routines
                                   1492 ;  operators precedence
                                   1493 ;  highest to lowest
                                   1494 ;  operators on same row have 
                                   1495 ;  same precedence and are executed
                                   1496 ;  from left to right.
                                   1497 ;	'*','/','%'
                                   1498 ;   '-','+'
                                   1499 ;   '=','>','<','>=','<=','<>','><'
                                   1500 ;   '<>' and '><' are equivalent for not equal.
                                   1501 ;--------------------------------
                                   1502 
                                   1503 ;---------------------
                                   1504 ; return array element
                                   1505 ; address from @(expr)
                                   1506 ; input:
                                   1507 ;   A 		TK_ARRAY
                                   1508 ; output:
                                   1509 ;   A 		TK_INTGR
                                   1510 ;	X 		element address 
                                   1511 ;----------------------
      001624                       1512 get_array_element:
      0095BD 1F 03 17         [ 4] 1513 	call func_args 
      0095C0 01 1E            [ 1] 1514 	cp a,#1
      0095C2 07 CD            [ 1] 1515 	jreq 1$
      0095C4 95 4D 90         [ 2] 1516 	jp syntax_error
      0095C7 5D               [ 2] 1517 1$: popw x 
                                   1518 	; check for bounds 
      0095C8 27 11 7B         [ 2] 1519 	cpw x,array_size 
      0095CB 06 18            [ 2] 1520 	jrule 3$
                                   1521 ; bounds {1..array_size}	
      0095CD 05 27            [ 1] 1522 2$: ld a,#ERR_BAD_VALUE 
      0095CF 0B 5C 90         [ 2] 1523 	jp tb_error 
      0095D2 CF               [ 2] 1524 3$: tnzw  x
      0095D3 00 0E            [ 1] 1525 	jreq 2$ 
      0095D5 16               [ 2] 1526 	sllw x 
      0095D6 07               [ 2] 1527 	pushw x 
      0095D7 72 B2 00         [ 2] 1528 	ldw x,#tib
      0095DA 0E 7B 06         [ 2] 1529 	subw x,(1,sp)
      001644                       1530 	_drop 2   
      0095DD 27 01            [ 2]    1     addw sp,#2 
      0095DF 50 84            [ 1] 1531 	ld a,#TK_INTGR
      0095E0 81               [ 4] 1532 	ret 
                                   1533 
                                   1534 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



                                   1535 ;***********************************
                                   1536 ;   expression parse,execute 
                                   1537 ;***********************************
                                   1538 ;-----------------------------------
                                   1539 ; factor ::= ['+'|'-'|e]  var | @ |
                                   1540 ;			 integer | function |
                                   1541 ;			 '('relation')' 
                                   1542 ; output:
                                   1543 ;   A    token attribute 
                                   1544 ;   X 	 integer
                                   1545 ; ---------------------------------
                           000001  1546 	NEG=1
                           000001  1547 	VSIZE=1
      001649                       1548 factor:
      001649                       1549 	_vars VSIZE 
      0095E0 5B 08            [ 2]    1     sub sp,#VSIZE 
      0095E2 81 12 4F         [ 4] 1550 	call next_token
      0095E3 A1 02            [ 1] 1551 	cp a,#CMD_END  
      0095E3 52 04            [ 1] 1552 	jrult 16$
      0095E5 90 CF            [ 1] 1553 1$:	ld (NEG,sp),a 
      0095E7 00 0E            [ 1] 1554 	and a,#TK_GRP_MASK
      0095E9 CD 95            [ 1] 1555 	cp a,#TK_GRP_ADD 
      0095EB 82 1F            [ 1] 1556 	jreq 2$
      0095ED 03 17            [ 1] 1557 	ld a,(NEG,sp)
      0095EF 01 CE            [ 2] 1558 	jra 4$  
      00165E                       1559 2$:	
      0095F1 00 0E CD         [ 4] 1560 	call next_token 
      001661                       1561 4$:	
      0095F4 95 8C            [ 1] 1562 	cp a,#TK_IFUNC 
      0095F6 5B 04            [ 1] 1563 	jrne 5$ 
      0095F8 81               [ 4] 1564 	call (x) 
      0095F9 20 32            [ 2] 1565 	jra 18$ 
      001668                       1566 5$:
      0095F9 CD 95            [ 1] 1567 	cp a,#TK_INTGR
      0095FB E3 93            [ 1] 1568 	jrne 6$
      0095FD 81 2C            [ 2] 1569 	jra 18$
      0095FE                       1570 6$:
      0095FE CD 96            [ 1] 1571 	cp a,#TK_ARRAY
      009600 74 A1            [ 1] 1572 	jrne 10$
      009602 03 27 03         [ 4] 1573 	call get_array_element
      009605 CC               [ 2] 1574 	ldw x,(x)
      009606 91 D7            [ 2] 1575 	jra 18$ 
      009608                       1576 10$:
      009608 1E 05            [ 1] 1577 	cp a,#TK_VAR 
      00960A 16 03            [ 1] 1578 	jrne 12$
      00960C CD               [ 2] 1579 	ldw x,(x)
      00960D 95 2A            [ 2] 1580 	jra 18$
      00167F                       1581 12$:			
      00960F 1F 05            [ 1] 1582 	cp a,#TK_LPAREN
      009611 17 03            [ 1] 1583 	jrne 16$
      009613 85 CD 95         [ 4] 1584 	call relation
      009616 8C               [ 2] 1585 	pushw x 
      009617 5B 04            [ 1] 1586 	ld a,#TK_RPAREN 
      009619 81 15 E7         [ 4] 1587 	call expect
      00961A 85               [ 2] 1588 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00961A 52 05            [ 2] 1589 	jra 18$	
      00168F                       1590 16$:
      00961C 17               [ 1] 1591 	tnz a 
      00961D 04 11            [ 1] 1592 	jreq 20$ 
      00961E                       1593 	_unget_token
      00961E 1F 02 F6 A4 0F   [ 1]    1      mov in,in.saved  
      009623 6B               [ 1] 1594 	clr a 
      009624 01 16            [ 2] 1595 	jra 20$ 
      00169A                       1596 18$: 
      009626 04 5C            [ 1] 1597 	ld a,#TK_MINUS 
      009628 11 01            [ 1] 1598 	cp a,(NEG,sp)
      009628 90 F6            [ 1] 1599 	jrne 19$
      00962A 27               [ 2] 1600 	negw x
      0016A1                       1601 19$:
      00962B 1B 0D            [ 1] 1602 	ld a,#TK_INTGR
      0016A3                       1603 20$:
      0016A3                       1604 	_drop VSIZE
      00962D 01 27            [ 2]    1     addw sp,#VSIZE 
      00962F 0A               [ 4] 1605 	ret
                                   1606 
                                   1607 ;-----------------------------------
                                   1608 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   1609 ; output:
                                   1610 ;   A    	token attribute 
                                   1611 ;	X		integer
                                   1612 ;-----------------------------------
                           000001  1613 	N1=1   ; int16_t
                           000003  1614 	MULOP=3
                           000003  1615 	VSIZE=3
      0016A6                       1616 term:
      0016A6                       1617 	_vars VSIZE
      009630 F1 26            [ 2]    1     sub sp,#VSIZE 
      009632 07 90 5C         [ 4] 1618 	call factor
      009635 5C               [ 1] 1619 	tnz a 
      009636 0A 01            [ 1] 1620 	jreq term_exit 
      0016AE                       1621 term01:	 ; check for  operator 
      009638 20 EE            [ 2] 1622 	ldw (N1,sp),x  ; save first factor 
      00963A CD 12 4F         [ 4] 1623 	call next_token
      00963A 1E 02            [ 1] 1624 	ld (MULOP,sp),a
      00963C 1D 00            [ 1] 1625 	cp a,#CMD_END
      00963E 02 4B            [ 1] 1626 	jrult 8$
      009640 00 FE            [ 1] 1627 	and a,#TK_GRP_MASK
      009642 84 27            [ 1] 1628 	cp a,#TK_GRP_MULT
      009644 1F 20            [ 1] 1629 	jreq 1$
      009646 D7 27            [ 2] 1630 	jra 8$
      009647                       1631 1$:	; got *|/|%
      009647 1E 02 F6         [ 4] 1632 	call factor
      00964A 6B 01            [ 1] 1633 	cp a,#TK_INTGR
      00964C A4 0F            [ 1] 1634 	jreq 2$
      00964E 4C C7 00         [ 2] 1635 	jp syntax_error
      009651 0F 72            [ 1] 1636 2$:	ldw y,x 
      009653 5F 00            [ 2] 1637 	ldw x,(N1,sp)
      009655 0E 72            [ 1] 1638 	ld a,(MULOP,sp) 
      009657 BB 00            [ 1] 1639 	cp a,#TK_MULT 
      009659 0E FE            [ 1] 1640 	jrne 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00965B 7B 01 4E         [ 4] 1641 	call multiply 
      00965E A4 0C            [ 2] 1642 	jra term01
      009660 44 44            [ 1] 1643 3$: cp a,#TK_DIV 
      009662 AB 80            [ 1] 1644 	jrne 4$ 
      009664 CD 15 63         [ 4] 1645 	call divide 
      009664 5B 05            [ 2] 1646 	jra term01 
      009666 81 15 79         [ 4] 1647 4$: call modulo
      009667 20 C6            [ 2] 1648 	jra term01 
      009667 88 CD            [ 1] 1649 8$: ld a,(MULOP,sp)
      009669 92 CF            [ 1] 1650 	jreq 9$ 
      0016EC                       1651 	_unget_token
      00966B 11 01 27 03 CC   [ 1]    1      mov in,in.saved  
      009670 91 D7            [ 2] 1652 9$: ldw x,(N1,sp)
      009672 84 81            [ 1] 1653 	ld a,#TK_INTGR 	
      009674                       1654 term_exit:
      0016F5                       1655 	_drop VSIZE 
      009674 A6 07            [ 2]    1     addw sp,#VSIZE 
      009676 CD               [ 4] 1656 	ret 
                                   1657 
                                   1658 ;-------------------------------
                                   1659 ;  expr ::= term [['+'|'-'] term]*
                                   1660 ;  result range {-32768..32767}
                                   1661 ;  output:
                                   1662 ;   A    token attribute 
                                   1663 ;   X	 integer   
                                   1664 ;-------------------------------
                           000001  1665 	N1=1
                           000003  1666 	N2=3 
                           000005  1667 	OP=5 
                           000005  1668 	VSIZE=5 
      0016F8                       1669 expression:
      0016F8                       1670 	_vars VSIZE 
      009677 96 67            [ 2]    1     sub sp,#VSIZE 
      009679 CD 16 A6         [ 4] 1671 	call term
      009679 4B               [ 1] 1672 	tnz a 
      00967A 00 CD            [ 1] 1673 	jreq expr_exit 
      00967C 97 C1            [ 2] 1674 1$:	ldw (N1,sp),x 
      00967E A1 00 27         [ 4] 1675 	call next_token
      009681 20 A1            [ 1] 1676 	ld (OP,sp),a 
      009683 84 26            [ 1] 1677 	cp a,#CMD_END 
      009685 13 26            [ 1] 1678 	jrult 8$ 
      009686 A4 30            [ 1] 1679 	and a,#TK_GRP_MASK
      009686 84 90            [ 1] 1680 	cp a,#TK_GRP_ADD 
      009688 85 89            [ 1] 1681 	jreq 2$ 
      00968A 90 89            [ 2] 1682 	jra 8$
      001713                       1683 2$: 
      00968C 4C 88 CD         [ 4] 1684 	call term
      00968F 92 CF            [ 1] 1685 	cp a,#TK_INTGR
      009691 A1 09            [ 1] 1686 	jreq 3$
      009693 27 E6 A1         [ 2] 1687 	jp syntax_error
      009696 00 27            [ 2] 1688 3$:	ldw (N2,sp),x 
      009698 09 A1            [ 2] 1689 	ldw x,(N1,sp)
      00969A 08 27            [ 1] 1690 	ld a,(OP,sp)
      00969C 05 55            [ 1] 1691 	cp a,#TK_PLUS 
      00969E 00 03            [ 1] 1692 	jrne 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      0096A0 00 02 84         [ 2] 1693 	addw x,(N2,sp)
      0096A3 81 D4            [ 2] 1694 	jra 1$ 
      0096A4 72 F0 03         [ 2] 1695 4$:	subw x,(N2,sp)
      0096A4 CD 96            [ 2] 1696 	jra 1$
      0096A6 74 A1            [ 1] 1697 8$: ld a,(OP,sp)
      0096A8 01 27            [ 1] 1698 	jreq 9$ 
      001735                       1699 	_unget_token	
      0096AA 03 CC 91 D7 85   [ 1]    1      mov in,in.saved  
      0096AF C3 00            [ 2] 1700 9$: ldw x,(N1,sp)
      0096B1 20 23            [ 1] 1701 	ld a,#TK_INTGR	
      00173E                       1702 expr_exit:
      00173E                       1703 	_drop VSIZE 
      0096B3 05 A6            [ 2]    1     addw sp,#VSIZE 
      0096B5 0A               [ 4] 1704 	ret 
                                   1705 
                                   1706 ;---------------------------------------------
                                   1707 ; rel ::= expr rel_op expr
                                   1708 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   1709 ;  relation return  integer , zero is false 
                                   1710 ;  output:
                                   1711 ;    A 		token attribute  
                                   1712 ;	 X		integer 
                                   1713 ;---------------------------------------------
                           000001  1714 	N1=1
                           000003  1715 	RELOP=3
                           000003  1716 	VSIZE=3 
      001741                       1717 relation: 
      001741                       1718 	_vars VSIZE
      0096B6 CC 91            [ 2]    1     sub sp,#VSIZE 
      0096B8 D9 5D 27         [ 4] 1719 	call expression
      0096BB F8               [ 1] 1720 	tnz a 
      0096BC 58 89            [ 1] 1721 	jreq rel_exit
      0096BE AE 16            [ 2] 1722 	ldw (N1,sp),x 
                                   1723 ; expect rel_op or leave 
      0096C0 90 72 F0         [ 4] 1724 	call next_token 
      0096C3 01 5B            [ 1] 1725 	ld (RELOP,sp),a 
      0096C5 02 A6            [ 1] 1726 	and a,#TK_GRP_MASK
      0096C7 84 81            [ 1] 1727 	cp a,#TK_GRP_RELOP 
      0096C9 26 33            [ 1] 1728 	jrne 8$
      001756                       1729 2$:	; expect another expression
      0096C9 52 01 CD         [ 4] 1730 	call expression
      0096CC 92 CF            [ 1] 1731 	cp a,#TK_INTGR
      0096CE A1 02            [ 1] 1732 	jreq 3$
      0096D0 25 3D 6B         [ 2] 1733 	jp syntax_error 
      0096D3 01 A4 30         [ 2] 1734 3$:	ldw acc16,x 
      0096D6 A1 10            [ 2] 1735 	ldw x,(N1,sp) 
      0096D8 27 04 7B 01      [ 2] 1736 	subw x,acc16
      0096DC 20 03            [ 1] 1737 	jrne 4$
      0096DE 35 02 00 0E      [ 1] 1738 	mov acc8,#2 ; n1==n2
      0096DE CD 92            [ 2] 1739 	jra 6$ 
      001771                       1740 4$: 
      0096E0 CF 06            [ 1] 1741 	jrsgt 5$  
      0096E1 35 04 00 0E      [ 1] 1742 	mov acc8,#4 ; n1<2 
      0096E1 A1 81            [ 2] 1743 	jra 6$
      001779                       1744 5$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      0096E3 26 03 FD 20      [ 1] 1745 	mov acc8,#1 ; n1>n2 
      00177D                       1746 6$:
      0096E7 32               [ 1] 1747 	clrw x 
      0096E8 C6 00 0E         [ 1] 1748 	ld a, acc8  
      0096E8 A1 84            [ 1] 1749 	and a,(RELOP,sp)
      0096EA 26               [ 1] 1750 	tnz a 
      0096EB 02 20            [ 1] 1751 	jreq 10$
      0096ED 2C               [ 1] 1752 	incw x 
      0096EE 20 0B            [ 2] 1753 	jra 10$  	
      0096EE A1 06            [ 1] 1754 8$: ld a,(RELOP,sp)
      0096F0 26 06            [ 1] 1755 	jreq 9$
      00178D                       1756 	_unget_token
      0096F2 CD 96 A4 FE 20   [ 1]    1      mov in,in.saved  
      001792                       1757 9$: 
      0096F7 22 01            [ 2] 1758 	ldw x,(N1,sp)
      0096F8                       1759 10$:
      0096F8 A1 85            [ 1] 1760 	ld a,#TK_INTGR
      001796                       1761 rel_exit:
      001796                       1762 	_drop VSIZE
      0096FA 26 03            [ 2]    1     addw sp,#VSIZE 
      0096FC FE               [ 4] 1763 	ret 
                                   1764 
                                   1765 ;--------------------------------
                                   1766 ; BASIC: SHOW 
                                   1767 ; print stack content in hexadecimal bytes 
                                   1768 ; 16 bytes per row 
                                   1769 ;--------------------------------
      001799                       1770 show:
      0096FD 20 1B B3         [ 2] 1771 	ldw x,#cstk_prompt
      0096FF CD 03 4E         [ 4] 1772 	call puts 
      0096FF A1               [ 1] 1773 	ldw x,sp 
      009700 07 26 0C         [ 2] 1774 	addw x,#3 ; ignore return address
      009703 CD 97 C1 89      [ 2] 1775 	ldw y,#RAM_SIZE  
      009707 A6 08 CD         [ 2] 1776 	ldw acc16,x 
      00970A 96 67 85 20      [ 2] 1777 	subw y,acc16
      00970E 0B 0D CD         [ 4] 1778 	call hex_dump
      00970F 4F               [ 1] 1779 	clr a 
      00970F 4D               [ 4] 1780 	ret
                                   1781 
      009710 27 11 55 00 03 00 02  1782 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             4F 20 09 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   1783 
                                   1784 
                                   1785 ;--------------------------------------------
                                   1786 ; BASIC: HEX 
                                   1787 ; select hexadecimal base for integer print
                                   1788 ;---------------------------------------------
      00971A                       1789 hex_base:
      00971A A6 11 11 01      [ 1] 1790 	mov base,#16 
      00971E 26               [ 4] 1791 	ret 
                                   1792 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



                                   1793 ;--------------------------------------------
                                   1794 ; BASIC: DEC 
                                   1795 ; select decimal base for integer print
                                   1796 ;---------------------------------------------
      0017DF                       1797 dec_base:
      00971F 01 50 00 0A      [ 1] 1798 	mov base,#10
      009721 81               [ 4] 1799 	ret 
                                   1800 
                                   1801 ;------------------------
                                   1802 ; BASIC: FREE 
                                   1803 ; return free size in RAM 
                                   1804 ; output:
                                   1805 ;   A 		TK_INTGR
                                   1806 ;   X 	    size integer
                                   1807 ;--------------------------
      0017E4                       1808 free:
      009721 A6 84 90         [ 2] 1809 	ldw x,#tib 
      009723 90 CE 00 1A      [ 2] 1810 	ldw y,txtbgn 
      009723 5B 01 81 00      [ 2] 1811 	cpw y,#app_space
      009726 25 05            [ 1] 1812 	jrult 1$
      009726 52 03 CD         [ 2] 1813 	subw x,#free_ram 
      009729 96 C9            [ 2] 1814 	jra 2$ 
      0017F6                       1815 1$:	
      00972B 4D 27 47 1C      [ 2] 1816 	subw x,txtend 
      00972E A6 84            [ 1] 1817 2$:	ld a,#TK_INTGR
      00972E 1F               [ 4] 1818 	ret 
                                   1819 
                                   1820 ;------------------------------
                                   1821 ; BASIC: SIZE 
                                   1822 ; command that print 
                                   1823 ; program start addres and size 
                                   1824 ;------------------------------
      0017FD                       1825 cmd_size:
      00972F 01 CD 92         [ 1] 1826 	push base 
      009732 CF 6B 03         [ 2] 1827 	ldw x,#PROG_ADDR 
      009735 A1 02 25         [ 4] 1828 	call puts 
      009738 2F A4 30         [ 2] 1829 	ldw x,txtbgn     
      00973B A1 20 27 02      [ 1] 1830 	mov base,#16 
      00973F 20 27 9B         [ 4] 1831 	call print_int
      009741 32 00 0A         [ 1] 1832 	pop base 
      009741 CD 96 C9         [ 2] 1833 	ldw x,#PROG_SIZE 
      009744 A1 84 27         [ 4] 1834 	call puts 
      009747 03 CC 91         [ 2] 1835 	ldw x,txtend 
      00974A D7 90 93 1E      [ 2] 1836 	subw x,txtbgn 
      00974E 01 7B 03         [ 4] 1837 	call print_int
      009751 A1 20 26         [ 2] 1838 	ldw x,#STR_BYTES 
      009754 05 CD 95         [ 4] 1839 	call puts  
      009757 2A               [ 4] 1840 	ret 
                                   1841 
                                   1842 
                                   1843 ;------------------------
                                   1844 ; BASIC: UBOUND  
                                   1845 ; return array variable size 
                                   1846 ; output:
                                   1847 ;   A 		TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



                                   1848 ;   X 	    array size 
                                   1849 ;--------------------------
      00182A                       1850 ubound:
      009758 20 D4 A1         [ 4] 1851 	call free 
      00975B 21               [ 2] 1852 	srlw x 
      00975C 26 05 CD         [ 2] 1853 	ldw array_size,x
      00975F 95 E3            [ 1] 1854 	ld a,#TK_INTGR
      009761 20               [ 4] 1855 	ret 
                                   1856 
                                   1857 ;-----------------------------
                                   1858 ; BASIC: LET var=expr 
                                   1859 ; variable assignement 
                                   1860 ; output:
                                   1861 ;   A 		TK_NONE 
                                   1862 ;-----------------------------
      001834                       1863 let::
      009762 CB CD 95         [ 4] 1864 	call next_token 
      009765 F9 20            [ 1] 1865 	cp a,#TK_VAR 
      009767 C6 7B            [ 1] 1866 	jreq let_var
      009769 03 27            [ 1] 1867 	cp a,#TK_ARRAY 
      00976B 05 55            [ 1] 1868 	jreq  let_array
      00976D 00 03 00         [ 2] 1869 	jp syntax_error
      001842                       1870 let_array:
      009770 02 1E 01         [ 4] 1871 	call get_array_element
      001845                       1872 let_var:
      009773 A6               [ 2] 1873 	pushw x  
      009774 84 12 4F         [ 4] 1874 	call next_token 
      009775 A1 32            [ 1] 1875 	cp a,#TK_EQUAL
      009775 5B 03            [ 1] 1876 	jreq 1$
      009777 81 11 57         [ 2] 1877 	jp syntax_error
      009778                       1878 1$:	
      009778 52 05 CD         [ 4] 1879 	call relation   
      00977B 97 26            [ 1] 1880 	cp a,#TK_INTGR 
      00977D 4D 27            [ 1] 1881 	jreq 2$
      00977F 3E 1F 01         [ 2] 1882 	jp syntax_error
      00185A                       1883 2$:	
      009782 CD 92            [ 1] 1884 	ldw y,x 
      009784 CF               [ 2] 1885 	popw x   
      009785 6B               [ 2] 1886 	ldw (x),y   
      009786 05               [ 4] 1887 	ret 
                                   1888 
                                   1889 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1890 ; return program size 
                                   1891 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      00185F                       1892 prog_size:
      009787 A1 02 25         [ 2] 1893 	ldw x,txtend 
      00978A 26 A4 30 A1      [ 2] 1894 	subw x,txtbgn 
      00978E 10               [ 4] 1895 	ret 
                                   1896 
                                   1897 ;----------------------------
                                   1898 ; print program information 
                                   1899 ;---------------------------
      001867                       1900 program_info: 
      00978F 27 02 20         [ 2] 1901 	ldw x,#PROG_ADDR 
      009792 1E 03 4E         [ 4] 1902 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      009793 CE 00 1A         [ 2] 1903 	ldw x,txtbgn 
      009793 CD 97 26 A1      [ 1] 1904 	mov base,#16 
      009797 84 27 03         [ 4] 1905 	call print_int
      00979A CC 91 D7 1F      [ 1] 1906 	mov base,#10  
      00979E 03 1E 01         [ 2] 1907 	ldw x,#PROG_SIZE
      0097A1 7B 05 A1         [ 4] 1908 	call puts 
      0097A4 10 26 05         [ 4] 1909 	call prog_size 
      0097A7 72 FB 03         [ 4] 1910 	call print_int 
      0097AA 20 D4 72         [ 2] 1911 	ldw x,#STR_BYTES 
      0097AD F0 03 20         [ 4] 1912 	call puts
      0097B0 CF 7B 05         [ 2] 1913 	ldw x,txtbgn
      0097B3 27 05 55         [ 2] 1914 	cpw x,#app 
      0097B6 00 03            [ 1] 1915 	jrult 2$
      0097B8 00 02 1E         [ 2] 1916 	ldw x,#FLASH_MEM 
      0097BB 01 A6            [ 2] 1917 	jra 3$
      0097BD 84 18 E0         [ 2] 1918 2$: ldw x,#RAM_MEM 	 
      0097BE CD 03 4E         [ 4] 1919 3$:	call puts 
      0097BE 5B 05            [ 1] 1920 	ld a,#CR 
      0097C0 81 02 F1         [ 4] 1921 	call putc
      0097C1 81               [ 4] 1922 	ret 
                                   1923 
      0097C1 52 03 CD 97 78 4D 27  1924 PROG_ADDR: .asciz "program address: "
             4D 1F 01 CD 92 CF 6B
             03 A4 30 A1
      0097D3 30 26 33 72 6F 67 72  1925 PROG_SIZE: .asciz ", program size: "
             61 6D 20 73 69 7A 65
             3A 20 00
      0097D6 62 79 74 65 73 00     1926 STR_BYTES: .asciz "bytes" 
      0097D6 CD 97 78 A1 84 27 03  1927 FLASH_MEM: .asciz " in FLASH memory" 
             CC 91 D7 CF 00 0E 1E
             01 72 B0
      0097E7 00 0E 26 06 35 02 00  1928 RAM_MEM:   .asciz " in RAM memory" 
             0F 20 0C 6D 6F 72 79
             00
                                   1929 
                                   1930 
                                   1931 ;----------------------------
                                   1932 ; BASIC: LIST [[start][,end]]
                                   1933 ; list program lines 
                                   1934 ; form start to end 
                                   1935 ; if empty argument list then 
                                   1936 ; list all.
                                   1937 ;----------------------------
                           000001  1938 	FIRST=1
                           000003  1939 	LAST=3 
                           000005  1940 	LN_PTR=5
                           000006  1941 	VSIZE=6 
      0097F1                       1942 list:
      0097F1 2C 06 35 04 00   [ 2] 1943 	btjf flags,#FRUN,0$
      0097F6 0F 20            [ 1] 1944 	ld a,#ERR_CMD_ONLY
      0097F8 04 11 59         [ 2] 1945 	jp tb_error
      0097F9                       1946 0$:	 
      0097F9 35 01 00         [ 4] 1947 	call prog_size 
      0097FC 0F 01            [ 1] 1948 	jrugt 1$
      0097FD 81               [ 4] 1949 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      0018FF                       1950 1$: _vars VSIZE
      0097FD 5F C6            [ 2]    1     sub sp,#VSIZE 
      0097FF 00 0F 14         [ 2] 1951 	ldw x,txtbgn 
      009802 03 4D            [ 2] 1952 	ldw (LN_PTR,sp),x 
      009804 27               [ 2] 1953 	ldw x,(x) 
      009805 0E 5C            [ 2] 1954 	ldw (FIRST,sp),x ; list from first line 
      009807 20 0B 7B         [ 2] 1955 	ldw x,#MAX_LINENO ; biggest line number 
      00980A 03 27            [ 2] 1956 	ldw (LAST,sp),x 
      00980C 05 55 00         [ 4] 1957 	call arg_list
      00980F 03               [ 1] 1958 	tnz a
      009810 00 02            [ 1] 1959 	jreq list_loop 
      009812 A1 02            [ 1] 1960 	cp a,#2 
      009812 1E 01            [ 1] 1961 	jreq 4$
      009814 A1 01            [ 1] 1962 	cp a,#1 
      009814 A6 84            [ 1] 1963 	jreq first_line 
      009816 CC 11 57         [ 2] 1964 	jp syntax_error 
      009816 5B               [ 2] 1965 4$:	popw x 
      009817 03 81            [ 2] 1966 	ldw (LAST+2,sp),x 
      009819                       1967 first_line:
      009819 AE               [ 2] 1968 	popw x
      00981A 98 33            [ 2] 1969 	ldw (FIRST,sp),x 
      001925                       1970 lines_skip:
      00981C CD 83 CE         [ 2] 1971 	ldw x,txtbgn
      00981F 96 1C            [ 2] 1972 2$:	ldw (LN_PTR,sp),x 
      009821 00 03 90         [ 2] 1973 	cpw x,txtend 
      009824 AE 18            [ 1] 1974 	jrpl list_exit 
      009826 00               [ 2] 1975 	ldw x,(x) ;line# 
      009827 CF 00            [ 2] 1976 	cpw x,(FIRST,sp)
      009829 0E 72            [ 1] 1977 	jrpl list_loop 
      00982B B2 00            [ 2] 1978 	ldw x,(LN_PTR,sp) 
      00982D 0E CD            [ 1] 1979 	ld a,(2,x)
      00982F 8E 4D 4F         [ 1] 1980 	ld acc8,a 
      009832 81 0A 63 6F      [ 1] 1981 	clr acc16 
      009836 6E 74 65 6E      [ 2] 1982 	addw x,acc16
      00983A 74 20            [ 2] 1983 	jra 2$ 
                                   1984 ; print loop
      001945                       1985 list_loop:
      00983C 6F 66            [ 2] 1986 	ldw x,(LN_PTR,sp)
      00983E 20 73            [ 1] 1987 	ld a,(2,x) 
      009840 74 61 63         [ 4] 1988 	call prt_basic_line
      009843 6B 20            [ 2] 1989 	ldw x,(LN_PTR,sp)
      009845 66 72            [ 1] 1990 	ld a,(2,x)
      009847 6F 6D 20         [ 1] 1991 	ld acc8,a 
      00984A 74 6F 70 20      [ 1] 1992 	clr acc16 
      00984E 74 6F 20 62      [ 2] 1993 	addw x,acc16
      009852 6F 74 74         [ 2] 1994 	cpw x,txtend 
      009855 6F 6D            [ 1] 1995 	jrpl list_exit
      009857 3A 0A            [ 2] 1996 	ldw (LN_PTR,sp),x
      009859 00               [ 2] 1997 	ldw x,(x)
      00985A 13 03            [ 2] 1998 	cpw x,(LAST,sp)  
      00985A 35 10            [ 1] 1999 	jrslt list_loop
      001967                       2000 list_exit:
      00985C 00 0B 81 00 01   [ 1] 2001 	mov in,count 
      00985F AE 16 E0         [ 2] 2002 	ldw x,#pad 
      00985F 35 0A 00         [ 2] 2003 	ldw basicptr,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      001972                       2004 	_drop VSIZE 
      009862 0B 81            [ 2]    1     addw sp,#VSIZE 
      009864 CD 18 67         [ 4] 2005 	call program_info 
      009864 AE               [ 4] 2006 	ret
                                   2007 
                                   2008 
                                   2009 ;--------------------------
                                   2010 ; BASIC: EDIT \E | \F
                                   2011 ;  copy program in FLASH 
                                   2012 ;  to RAM for edition 
                                   2013 ;-------------------------
      001978                       2014 edit:
      009865 16 90 90         [ 4] 2015 	call qsign 
      009868 CE 00            [ 1] 2016 	jreq 1$ 
      00986A 1B 90 A3         [ 2] 2017 	ldw x,#NOT_SAVED 
      00986D AC 80 25         [ 4] 2018 	call puts 
      009870 05               [ 4] 2019 	ret 
      001984                       2020 1$: 
      009871 1D 00 80 20      [ 2] 2021 	ldw y,#app_sign ; source address 
      009875 04 2C 02         [ 2] 2022     ldw x,app_size  
      009876 1C 00 04         [ 2] 2023 	addw x,#4 
      009876 72 B0 00         [ 2] 2024 	ldw acc16,x  ; bytes to copy 
      009879 1D A6 84         [ 2] 2025 	ldw x,#rsign ; destination address 
      00987C 81 0E 38         [ 4] 2026 	call move  
      00987D AE 00 80         [ 2] 2027 	ldw x,#free_ram 
      00987D 3B 00 0B         [ 2] 2028 	ldw txtbgn,x 
      009880 AE 99 26 CD      [ 2] 2029 	addw x,rsize  
      009884 83 CE CE         [ 2] 2030 	ldw txtend,x 
      009887 00               [ 4] 2031 	ret 
                                   2032 
      009888 1B 35 10 00 0B CD 93  2033 NOT_SAVED: .asciz "No application saved.\n"
             1B 32 00 0B AE 99 38
             CD 83 CE CE 00 1D 72
             B0 00
                                   2034 
                                   2035 ;--------------------------
                                   2036 ; decompile line from token list
                                   2037 ; and print it. 
                                   2038 ; input:
                                   2039 ;   A       stop at this position 
                                   2040 ;   X 		pointer at line
                                   2041 ; output:
                                   2042 ;   none 
                                   2043 ;--------------------------	
      0019BC                       2044 prt_basic_line:
      00989F 1B CD 93         [ 1] 2045 	ld count,a 
      0098A2 1B AE            [ 1] 2046 	ld a,(2,x)
      0098A4 99 49 CD         [ 1] 2047 	cp a,count 
      0098A7 83 CE            [ 1] 2048 	jrpl 1$ 
      0098A9 81 00 03         [ 1] 2049 	ld count,a 
      0098AA CF 00 04         [ 2] 2050 1$:	ldw basicptr,x 
      0098AA CD 98 64 54      [ 2] 2051 	ldw y,#tib  
      0098AE CF 00 20         [ 4] 2052 	call decompile 
      0098B1 A6 84 81         [ 4] 2053 	call puts 
      0098B4 A6 0D            [ 1] 2054 	ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      0098B4 CD 92 CF         [ 4] 2055 	call putc 
      0098B7 A1               [ 4] 2056 	ret 
                                   2057 
                                   2058 
                                   2059 
                                   2060 ;---------------------------------
                                   2061 ; BASIC: PRINT|? arg_list 
                                   2062 ; print values from argument list
                                   2063 ;----------------------------------
                           000001  2064 	CCOMMA=1
                           000001  2065 	VSIZE=1
      0019DC                       2066 print:
      0019DC                       2067 	_vars VSIZE 
      0098B8 85 27            [ 2]    1     sub sp,#VSIZE 
      0019DE                       2068 reset_comma:
      0098BA 0A A1            [ 1] 2069 	clr (CCOMMA,sp)
      0019E0                       2070 prt_loop:
      0098BC 06 27 03         [ 4] 2071 	call next_token
      0098BF CC 91            [ 1] 2072 	cp a,#CMD_END 
      0098C1 D7 4F            [ 1] 2073 	jrult print_exit ; colon or end of line 
      0098C2 A1 02            [ 1] 2074 	cp a,#TK_QSTR
      0098C2 CD 96            [ 1] 2075 	jreq 1$
      0098C4 A4 03            [ 1] 2076 	cp a,#TK_CHAR 
      0098C5 27 13            [ 1] 2077 	jreq 2$ 
      0098C5 89 CD            [ 1] 2078 	cp a,#TK_CFUNC 
      0098C7 92 CF            [ 1] 2079 	jreq 3$
      0098C9 A1 32            [ 1] 2080 	cp a,#TK_COMMA 
      0098CB 27 03            [ 1] 2081 	jreq 4$
      0098CD CC 91            [ 1] 2082 	cp a,#TK_SHARP 
      0098CF D7 18            [ 1] 2083 	jreq 5$
      0098D0 20 28            [ 2] 2084 	jra 7$ 
      0019FD                       2085 1$:	; print string 
      0098D0 CD 97 C1         [ 4] 2086 	call puts
      0098D3 A1 84            [ 2] 2087 	jra reset_comma
      001A02                       2088 2$:	; print character 
      0098D5 27               [ 1] 2089 	ld a,xl 
      0098D6 03 CC 91         [ 4] 2090 	call putc 
      0098D9 D7 D6            [ 2] 2091 	jra reset_comma 
      0098DA                       2092 3$: ; print character function value  	
      0098DA 90               [ 4] 2093 	call (x)
      0098DB 93               [ 1] 2094 	ld a,xl 
      0098DC 85 FF 81         [ 4] 2095 	call putc
      0098DF 20 CF            [ 2] 2096 	jra reset_comma 
      001A0F                       2097 4$: ; set comma state 
      0098DF CE 00            [ 1] 2098 	cpl (CCOMMA,sp)
      0098E1 1D 72            [ 2] 2099 	jra prt_loop   
      001A13                       2100 5$: ; # character must be followed by an integer   
      0098E3 B0 00 1B         [ 4] 2101 	call next_token
      0098E6 81 84            [ 1] 2102 	cp a,#TK_INTGR 
      0098E7 27 03            [ 1] 2103 	jreq 6$
      0098E7 AE 99 26         [ 2] 2104 	jp syntax_error 
      001A1D                       2105 6$: ; set tab width
      0098EA CD               [ 1] 2106 	ld a,xl 
      0098EB 83 CE            [ 1] 2107 	and a,#15 
      0098ED CE 00 1B         [ 1] 2108 	ld tab_width,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      0098F0 35 10            [ 2] 2109 	jra reset_comma 
      001A25                       2110 7$:	
      001A25                       2111 	_unget_token 
      0098F2 00 0B CD 93 1B   [ 1]    1      mov in,in.saved  
      0098F7 35 0A 00         [ 4] 2112 	call relation 
      0098FA 0B AE            [ 1] 2113 	cp a,#TK_INTGR 
      0098FC 99 38            [ 1] 2114 	jrne print_exit 
      0098FE CD 83 CE         [ 4] 2115     call print_int 
      009901 CD 98            [ 2] 2116 	jra reset_comma 
      001A36                       2117 print_exit:
      009903 DF CD            [ 1] 2118 	tnz (CCOMMA,sp)
      009905 93 1B            [ 1] 2119 	jrne 9$
      009907 AE 99            [ 1] 2120 	ld a,#CR 
      009909 49 CD 83         [ 4] 2121     call putc 
      001A3F                       2122 9$:	_drop VSIZE 
      00990C CE CE            [ 2]    1     addw sp,#VSIZE 
      00990E 00               [ 4] 2123 	ret 
                                   2124 
                                   2125 ;----------------------
                                   2126 ; 'save_context' and
                                   2127 ; 'rest_context' must be 
                                   2128 ; called at the same 
                                   2129 ; call stack depth 
                                   2130 ; i.e. SP must have the 
                                   2131 ; save value at  
                                   2132 ; entry point of both 
                                   2133 ; routine. 
                                   2134 ;---------------------
                           000004  2135 	CTXT_SIZE=4 ; size of saved data 
                                   2136 ;--------------------
                                   2137 ; save current BASIC
                                   2138 ; interpreter context 
                                   2139 ; on stack 
                                   2140 ;--------------------
      001A42                       2141 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001A42                       2142 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001A42                       2143 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      001A42                       2144 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      001A42                       2145 save_context:
      00990F 1B A3 AC         [ 2] 2146 	ldw x,basicptr 
      009912 84 25            [ 2] 2147 	ldw (BPTR,sp),x
      009914 05 AE 99         [ 1] 2148 	ld a,in 
      009917 4F 20            [ 1] 2149 	ld (IN,sp),a
      009919 03 AE 99         [ 1] 2150 	ld a,count 
      00991C 60 CD            [ 1] 2151 	ld (CNT,sp),a  
      00991E 83               [ 4] 2152 	ret
                                   2153 
                                   2154 ;-----------------------
                                   2155 ; restore previously saved 
                                   2156 ; BASIC interpreter context 
                                   2157 ; from stack 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



                                   2158 ;-------------------------
      001A52                       2159 rest_context:
      00991F CE A6            [ 2] 2160 	ldw x,(BPTR,sp)
      009921 0D CD 83         [ 2] 2161 	ldw basicptr,x 
      009924 71 81            [ 1] 2162 	ld a,(IN,sp)
      009926 70 72 6F         [ 1] 2163 	ld in,a
      009929 67 72            [ 1] 2164 	ld a,(CNT,sp)
      00992B 61 6D 20         [ 1] 2165 	ld count,a  
      00992E 61               [ 4] 2166 	ret
                                   2167 
                                   2168 
                                   2169 
                                   2170 ;------------------------------------------
                                   2171 ; BASIC: INPUT [string]var[,[string]var]
                                   2172 ; input value in variables 
                                   2173 ; [string] optionally can be used as prompt 
                                   2174 ;-----------------------------------------
                           000001  2175 	CX_BPTR=1
                           000003  2176 	CX_IN=3
                           000004  2177 	CX_CNT=4
                           000005  2178 	SKIP=5
                           000006  2179 	VAR_ADDR=6
                           000007  2180 	VSIZE=7
      001A62                       2181 input_var:
      001A62                       2182 	_vars VSIZE 
      00992F 64 64            [ 2]    1     sub sp,#VSIZE 
      001A64                       2183 input_loop:
      009931 72 65            [ 1] 2184 	clr (SKIP,sp)
      009933 73 73 3A         [ 4] 2185 	call next_token 
      009936 20 00            [ 1] 2186 	cp a,#TK_QSTR 
      009938 2C 20            [ 1] 2187 	jrne 1$ 
      00993A 70 72 6F         [ 4] 2188 	call puts 
      00993D 67 72            [ 1] 2189 	cpl (SKIP,sp)
      00993F 61 6D 20         [ 4] 2190 	call next_token 
      009942 73 69            [ 1] 2191 1$: cp a,#TK_VAR  
      009944 7A 65            [ 1] 2192 	jreq 2$ 
      009946 3A 20 00         [ 2] 2193 	jp syntax_error
      009949 62 79            [ 2] 2194 2$:	ldw (VAR_ADDR,sp),x 
      00994B 74 65            [ 1] 2195 	tnz (SKIP,sp)
      00994D 73 00            [ 1] 2196 	jrne 21$ 
      00994F 20 69 6E         [ 4] 2197 	call var_name 
      009952 20 46 4C         [ 4] 2198 	call putc   
      001A88                       2199 21$:
      009955 41 53            [ 1] 2200 	ld a,#':
      009957 48 20 6D         [ 4] 2201 	call putc 
      00995A 65 6D 6F         [ 4] 2202 	call save_context 
      00995D 72 79 00 20      [ 1] 2203 	clr count  
      009961 69 6E 20         [ 4] 2204 	call readln 
      009964 52 41 4D         [ 2] 2205 	ldw x,#tib 
      009967 20 6D 65         [ 1] 2206 	push count
      00996A 6D 6F            [ 1] 2207 	push #0 
      00996C 72 79 00         [ 2] 2208 	addw x,(1,sp)
      00996F 5C               [ 1] 2209 	incw x 
      001AA3                       2210 	_drop 2 
      00996F 72 01            [ 2]    1     addw sp,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      009971 00 22 05 A6      [ 1] 2211 	clr in 
      009975 07 CC 91         [ 4] 2212 	call get_token
      009978 D9 84            [ 1] 2213 	cp a,#TK_INTGR
      009979 27 10            [ 1] 2214 	jreq 3$ 
      009979 CD 98            [ 1] 2215 	cp a,#TK_MINUS
      00997B DF 22 01         [ 4] 2216 	call get_token 
      00997E 81 52            [ 1] 2217 	cp a,#TK_INTGR 
      009980 06 CE            [ 1] 2218 	jreq 22$
      009982 00 1B 1F         [ 4] 2219 	call rest_context 
      009985 05 FE 1F         [ 2] 2220 	jp syntax_error
      001ABF                       2221 22$:
      009988 01               [ 2] 2222 	negw x 	
      009989 AE 7F            [ 2] 2223 3$: ldw y,(VAR_ADDR,sp) 
      00998B FF 1F            [ 2] 2224 	ldw (y),x 
      00998D 03 CD 96         [ 4] 2225 	call rest_context
      009990 79 4D 27         [ 4] 2226 	call next_token 
      009993 31 A1            [ 1] 2227 	cp a,#TK_COMMA 
      009995 02 27            [ 1] 2228 	jreq input_loop
      009997 07 A1            [ 1] 2229 	cp a,#TK_NONE 
      009999 01 27            [ 1] 2230 	jreq input_exit  
      00999B 06 CC            [ 1] 2231 	cp a,#TK_COLON 
      00999D 91 D7            [ 1] 2232     jreq input_exit 
      00999F 85 1F 05         [ 2] 2233 	jp syntax_error 
      0099A2                       2234 input_exit:
      001AD9                       2235 	_drop VSIZE 
      0099A2 85 1F            [ 2]    1     addw sp,#VSIZE 
      0099A4 01               [ 4] 2236 	ret 
                                   2237 
                                   2238 
                                   2239 ;---------------------
                                   2240 ; BASIC: REMARK | ' 
                                   2241 ; skip comment to end of line 
                                   2242 ;---------------------- 
      0099A5                       2243 remark::
      0099A5 CE 00 1B 1F 05   [ 1] 2244 	mov in,count 
      0099AA C3               [ 4] 2245  	ret 
                                   2246 
                                   2247 
                                   2248 ;---------------------
                                   2249 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2250 ; read in loop 'addr'  
                                   2251 ; apply & 'mask' to value 
                                   2252 ; loop while result==0.  
                                   2253 ; 'xor_mask' is used to 
                                   2254 ; invert the wait logic.
                                   2255 ; i.e. loop while not 0.
                                   2256 ;---------------------
                           000001  2257 	XMASK=1 
                           000002  2258 	MASK=2
                           000003  2259 	ADDR=3
                           000004  2260 	VSIZE=4
      001AE2                       2261 wait: 
      001AE2                       2262 	_vars VSIZE
      0099AB 00 1D            [ 2]    1     sub sp,#VSIZE 
      0099AD 2A 38            [ 1] 2263 	clr (XMASK,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      0099AF FE 13 01         [ 4] 2264 	call arg_list 
      0099B2 2A 11            [ 1] 2265 	cp a,#2
      0099B4 1E 05            [ 1] 2266 	jruge 0$
      0099B6 E6 02 C7         [ 2] 2267 	jp syntax_error 
      0099B9 00 0F            [ 1] 2268 0$:	cp a,#3
      0099BB 72 5F            [ 1] 2269 	jrult 1$
      0099BD 00               [ 2] 2270 	popw x 
      0099BE 0E               [ 1] 2271 	ld a,xl
      0099BF 72 BB            [ 1] 2272 	ld (XMASK,sp),a 
      0099C1 00               [ 2] 2273 1$: popw x ; mask 
      0099C2 0E               [ 1] 2274 	ld a,xl 
      0099C3 20 E3            [ 1] 2275 	ld (MASK,sp),a 
      0099C5 85               [ 2] 2276 	popw x ; address 
      0099C5 1E               [ 1] 2277 2$:	ld a,(x)
      0099C6 05 E6            [ 1] 2278 	and a,(MASK,sp)
      0099C8 02 CD            [ 1] 2279 	xor a,(XMASK,sp)
      0099CA 9A 3C            [ 1] 2280 	jreq 2$ 
      001B04                       2281 	_drop VSIZE 
      0099CC 1E 05            [ 2]    1     addw sp,#VSIZE 
      0099CE E6               [ 4] 2282 	ret 
                                   2283 
                                   2284 ;---------------------
                                   2285 ; BASIC: BSET addr,mask
                                   2286 ; set bits at 'addr' corresponding 
                                   2287 ; to those of 'mask' that are at 1.
                                   2288 ; arguments:
                                   2289 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2290 ;   mask        mask|addr
                                   2291 ; output:
                                   2292 ;	none 
                                   2293 ;--------------------------
      001B07                       2294 bit_set:
      0099CF 02 C7 00         [ 4] 2295 	call arg_list 
      0099D2 0F 72            [ 1] 2296 	cp a,#2	 
      0099D4 5F 00            [ 1] 2297 	jreq 1$ 
      0099D6 0E 72 BB         [ 2] 2298 	jp syntax_error
      001B11                       2299 1$: 
      0099D9 00               [ 2] 2300 	popw x ; mask 
      0099DA 0E               [ 1] 2301 	ld a,xl 
      0099DB C3               [ 2] 2302 	popw x ; addr  
      0099DC 00               [ 1] 2303 	or a,(x)
      0099DD 1D               [ 1] 2304 	ld (x),a
      0099DE 2A               [ 4] 2305 	ret 
                                   2306 
                                   2307 ;---------------------
                                   2308 ; BASIC: BRES addr,mask
                                   2309 ; reset bits at 'addr' corresponding 
                                   2310 ; to those of 'mask' that are at 1.
                                   2311 ; arguments:
                                   2312 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2313 ;   mask	    ~mask&*addr  
                                   2314 ; output:
                                   2315 ;	none 
                                   2316 ;--------------------------
      001B17                       2317 bit_reset:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      0099DF 07 1F 05         [ 4] 2318 	call arg_list 
      0099E2 FE 13            [ 1] 2319 	cp a,#2  
      0099E4 03 2F            [ 1] 2320 	jreq 1$ 
      0099E6 DE 11 57         [ 2] 2321 	jp syntax_error
      0099E7                       2322 1$: 
      0099E7 55               [ 2] 2323 	popw x ; mask 
      0099E8 00               [ 1] 2324 	ld a,xl 
      0099E9 04               [ 1] 2325 	cpl a 
      0099EA 00               [ 2] 2326 	popw x ; addr  
      0099EB 02               [ 1] 2327 	and a,(x)
      0099EC AE               [ 1] 2328 	ld (x),a 
      0099ED 16               [ 4] 2329 	ret 
                                   2330 
                                   2331 ;---------------------
                                   2332 ; BASIC: BTOGL addr,mask
                                   2333 ; toggle bits at 'addr' corresponding 
                                   2334 ; to those of 'mask' that are at 1.
                                   2335 ; arguments:
                                   2336 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2337 ;   mask	    mask^*addr  
                                   2338 ; output:
                                   2339 ;	none 
                                   2340 ;--------------------------
      001B28                       2341 bit_toggle:
      0099EE E0 CF 00         [ 4] 2342 	call arg_list 
      0099F1 05 5B            [ 1] 2343 	cp a,#2 
      0099F3 06 CD            [ 1] 2344 	jreq 1$ 
      0099F5 98 E7 81         [ 2] 2345 	jp syntax_error
      0099F8 85               [ 2] 2346 1$: popw x ; mask 
      0099F8 CD               [ 1] 2347 	ld a,xl 
      0099F9 A0               [ 2] 2348 	popw x ; addr  
      0099FA D5               [ 1] 2349 	xor a,(x)
      0099FB 27               [ 1] 2350 	ld (x),a 
      0099FC 07               [ 4] 2351 	ret 
                                   2352 
                                   2353 
                                   2354 ;---------------------
                                   2355 ; BASIC: BTEST(addr,bit)
                                   2356 ; return bit value at 'addr' 
                                   2357 ; bit is in range {0..7}.
                                   2358 ; arguments:
                                   2359 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2360 ;   bit 	    bit position {0..7}  
                                   2361 ; output:
                                   2362 ;	none 
                                   2363 ;--------------------------
      001B38                       2364 bit_test:
      0099FD AE 9A 25         [ 4] 2365 	call func_args 
      009A00 CD 83            [ 1] 2366 	cp a,#2
      009A02 CE 81            [ 1] 2367 	jreq 0$
      009A04 CC 11 57         [ 2] 2368 	jp syntax_error
      001B42                       2369 0$:	
      009A04 90               [ 2] 2370 	popw x 
      009A05 AE               [ 1] 2371 	ld a,xl 
      009A06 AC 80            [ 1] 2372 	and a,#7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      009A08 CE               [ 1] 2373 	push a   
      009A09 AC 82            [ 1] 2374 	ld a,#1 
      009A0B 1C 00            [ 1] 2375 1$: tnz (1,sp)
      009A0D 04 CF            [ 1] 2376 	jreq 2$
      009A0F 00               [ 1] 2377 	sll a 
      009A10 0E AE            [ 1] 2378 	dec (1,sp)
      009A12 00 7C            [ 2] 2379 	jra 1$
      001B52                       2380 2$: _drop 1 
      009A14 CD 8E            [ 2]    1     addw sp,#1 
      009A16 B8               [ 2] 2381 	popw x 
      009A17 AE               [ 1] 2382 	and a,(x)
      009A18 00 80            [ 1] 2383 	jreq 3$
      009A1A CF 00            [ 1] 2384 	ld a,#1 
      009A1C 1B               [ 1] 2385 3$:	clrw x 
      009A1D 72               [ 1] 2386 	ld xl,a 
      009A1E BB 00            [ 1] 2387 	ld a,#TK_INTGR
      009A20 7E               [ 4] 2388 	ret
                                   2389 
                                   2390 
                                   2391 ;--------------------
                                   2392 ; BASIC: POKE addr,byte
                                   2393 ; put a byte at addr 
                                   2394 ;--------------------
      001B5F                       2395 poke:
      009A21 CF 00 1D         [ 4] 2396 	call arg_list 
      009A24 81 4E            [ 1] 2397 	cp a,#2
      009A26 6F 20            [ 1] 2398 	jreq 1$
      009A28 61 70 70         [ 2] 2399 	jp syntax_error
      001B69                       2400 1$:	
      009A2B 6C               [ 2] 2401 	popw x  
      009A2C 69               [ 1] 2402     ld a,xl 
      009A2D 63               [ 2] 2403 	popw x 
      009A2E 61               [ 1] 2404 	ld (x),a 
      009A2F 74               [ 4] 2405 	ret 
                                   2406 
                                   2407 ;-----------------------
                                   2408 ; BASIC: PEEK(addr)
                                   2409 ; get the byte at addr 
                                   2410 ; input:
                                   2411 ;	none 
                                   2412 ; output:
                                   2413 ;	X 		value 
                                   2414 ;-----------------------
      001B6E                       2415 peek:
      009A30 69 6F 6E         [ 4] 2416 	call func_args
      009A33 20 73            [ 1] 2417 	cp a,#1 
      009A35 61 76            [ 1] 2418 	jreq 1$
      009A37 65 64 2E         [ 2] 2419 	jp syntax_error
      009A3A 0A               [ 2] 2420 1$: popw x 
      009A3B 00               [ 1] 2421 	ld a,(x)
      009A3C 5F               [ 1] 2422 	clrw x 
      009A3C C7               [ 1] 2423 	ld xl,a 
      009A3D 00 04            [ 1] 2424 	ld a,#TK_INTGR
      009A3F E6               [ 4] 2425 	ret 
                                   2426 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



                                   2427 ;---------------------------
                                   2428 ; BASIC IF expr : instructions
                                   2429 ; evaluate expr and if true 
                                   2430 ; execute instructions on same line. 
                                   2431 ;----------------------------
      001B7F                       2432 if: 
      009A40 02 C1 00         [ 4] 2433 	call relation 
      009A43 04 2A            [ 1] 2434 	cp a,#TK_INTGR
      009A45 03 C7            [ 1] 2435 	jreq 1$ 
      009A47 00 04 CF         [ 2] 2436 	jp syntax_error
      009A4A 00               [ 1] 2437 1$:	clr a 
      009A4B 05               [ 2] 2438 	tnzw x 
      009A4C 90 AE            [ 1] 2439 	jrne 9$  
                                   2440 ;skip to next line
      009A4E 16 90 CD 8C 11   [ 1] 2441 	mov in,count
      009A53 CD               [ 4] 2442 9$:	ret 
                                   2443 
                                   2444 ;------------------------
                                   2445 ; BASIC: FOR var=expr 
                                   2446 ; set variable to expression 
                                   2447 ; leave variable address 
                                   2448 ; on stack and set
                                   2449 ; FLOOP bit in 'flags'
                                   2450 ;-----------------
                           000001  2451 	RETL1=1 ; return address  
                           000003  2452 	FSTEP=3  ; variable increment
                           000005  2453 	LIMIT=5 ; loop limit 
                           000007  2454 	CVAR=7   ; control variable 
                           000009  2455 	INW=9   ;  in.w saved
                           00000B  2456 	BPTR=11 ; baseptr saved
                           00000A  2457 	VSIZE=10  
      001B93                       2458 for: ; { -- var_addr }
      009A54 83               [ 2] 2459 	popw x ; call return address 
      001B94                       2460 	_vars VSIZE 
      009A55 CE A6            [ 2]    1     sub sp,#VSIZE 
      009A57 0D               [ 2] 2461 	pushw x  ; RETL1 
      009A58 CD 83            [ 1] 2462 	ld a,#TK_VAR 
      009A5A 71 81 E7         [ 4] 2463 	call expect
      009A5C 1F 07            [ 2] 2464 	ldw (CVAR,sp),x  ; control variable 
      009A5C 52 01 45         [ 4] 2465 	call let_var 
      009A5E 72 14 00 21      [ 1] 2466 	bset flags,#FLOOP 
                                   2467 ; open space on stack for loop data 
      009A5E 0F               [ 1] 2468 	clrw x 
      009A5F 01 0B            [ 2] 2469 	ldw (BPTR,sp),x 
      009A60 1F 09            [ 2] 2470 	ldw (INW,sp),x 
      009A60 CD 92 CF         [ 4] 2471 	call next_token 
      009A63 A1 02            [ 1] 2472 	cp a,#TK_CMD 
      009A65 25 4F            [ 1] 2473 	jreq 1$
      009A67 A1 02 27         [ 2] 2474 	jp syntax_error
      001BB4                       2475 1$:  
      009A6A 12 A1 03         [ 2] 2476 	cpw x,#to 
      009A6D 27 13            [ 1] 2477 	jreq to
      009A6F A1 82 27         [ 2] 2478 	jp syntax_error 
                                   2479 
                                   2480 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



                                   2481 ; BASIC: TO expr 
                                   2482 ; second part of FOR loop initilization
                                   2483 ; leave limit on stack and set 
                                   2484 ; FTO bit in 'flags'
                                   2485 ;-----------------------------------
      001BBC                       2486 to: ; { var_addr -- var_addr limit step }
      009A72 15 A1 09 27 18   [ 2] 2487 	btjt flags,#FLOOP,1$
      009A77 A1 0A 27         [ 2] 2488 	jp syntax_error
      009A7A 18 20 28         [ 4] 2489 1$: call relation  
      009A7D A1 84            [ 1] 2490 	cp a,#TK_INTGR 
      009A7D CD 83            [ 1] 2491 	jreq 2$ 
      009A7F CE 20 DC         [ 2] 2492 	jp syntax_error
      009A82 1F 05            [ 2] 2493 2$: ldw (LIMIT,sp),x
                                   2494 ;	ldw x,in.w 
      009A82 9F CD 83         [ 4] 2495 	call next_token
      009A85 71 20            [ 1] 2496 	cp a,#TK_NONE  
      009A87 D6 0E            [ 1] 2497 	jreq 4$ 
      009A88 A1 80            [ 1] 2498 	cp a,#TK_CMD
      009A88 FD 9F            [ 1] 2499 	jrne 3$
      009A8A CD 83 71         [ 2] 2500 	cpw x,#step 
      009A8D 20 CF            [ 1] 2501 	jreq step
      009A8F                       2502 3$:	
      001BE0                       2503 	_unget_token   	 
      009A8F 03 01 20 CD 01   [ 1]    1      mov in,in.saved  
      009A93                       2504 4$:	
      009A93 CD 92 CF         [ 2] 2505 	ldw x,#1   ; default step  
      009A96 A1 84            [ 2] 2506 	ldw (FSTEP,sp),x 
      009A98 27 03            [ 2] 2507 	jra store_loop_addr 
                                   2508 
                                   2509 
                                   2510 ;----------------------------------
                                   2511 ; BASIC: STEP expr 
                                   2512 ; optional third par of FOR loop
                                   2513 ; initialization. 	
                                   2514 ;------------------------------------
      001BEC                       2515 step: ; {var limit -- var limit step}
      009A9A CC 91 D7 21 03   [ 2] 2516 	btjt flags,#FLOOP,1$
      009A9D CC 11 57         [ 2] 2517 	jp syntax_error
      009A9D 9F A4 0F         [ 4] 2518 1$: call relation
      009AA0 C7 00            [ 1] 2519 	cp a,#TK_INTGR
      009AA2 23 20            [ 1] 2520 	jreq 2$
      009AA4 B9 11 57         [ 2] 2521 	jp syntax_error
      009AA5 1F 03            [ 2] 2522 2$:	ldw (FSTEP,sp),x ; step
                                   2523 ; leave loop back entry point on cstack 
                                   2524 ; cstack is 1 call deep from interpreter
      001C00                       2525 store_loop_addr:
      009AA5 55 00 03         [ 2] 2526 	ldw x,basicptr  
      009AA8 00 02            [ 2] 2527 	ldw (BPTR,sp),x 
      009AAA CD 97 C1         [ 2] 2528 	ldw x,in.w 
      009AAD A1 84            [ 2] 2529 	ldw (INW,sp),x   
      009AAF 26 05 CD 93      [ 1] 2530 	bres flags,#FLOOP 
      009AB3 1B 20 A8 1E      [ 1] 2531 	inc loop_depth  
      009AB6 81               [ 4] 2532 	ret 
                                   2533 
                                   2534 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



                                   2535 ; BASIC: NEXT var 
                                   2536 ; FOR loop control 
                                   2537 ; increment variable with step 
                                   2538 ; and compare with limit 
                                   2539 ; loop if threshold not crossed.
                                   2540 ; else stack. 
                                   2541 ; and decrement 'loop_depth' 
                                   2542 ;--------------------------------
      001C13                       2543 next: ; {var limit step retl1 -- [var limit step ] }
      009AB6 0D 01 26 05      [ 1] 2544 	tnz loop_depth 
      009ABA A6 0D            [ 1] 2545 	jrne 1$ 
      009ABC CD 83 71         [ 2] 2546 	jp syntax_error 
      001C1C                       2547 1$: 
      009ABF 5B 01            [ 1] 2548 	ld a,#TK_VAR 
      009AC1 81 15 E7         [ 4] 2549 	call expect
                                   2550 ; check for good variable after NEXT 	 
      009AC2 13 07            [ 2] 2551 	cpw x,(CVAR,sp)
      009AC2 CE 00            [ 1] 2552 	jreq 2$  
      009AC4 05 1F 03         [ 2] 2553 	jp syntax_error ; not the good one 
      001C28                       2554 2$: ; increment variable 
      009AC7 C6               [ 2] 2555 	ldw x,(x)  ; get var value 
      009AC8 00 02 6B         [ 2] 2556 	addw x,(FSTEP,sp) ; var+step 
      009ACB 05 C6            [ 2] 2557 	ldw y,(CVAR,sp)
      009ACD 00 04            [ 2] 2558 	ldw (y),x ; save var new value 
                                   2559 ; check sign of STEP  
      009ACF 6B 06            [ 1] 2560 	ld a,#0x80
      009AD1 81 03            [ 1] 2561 	bcp a,(FSTEP,sp)
      009AD2 2A 06            [ 1] 2562 	jrpl 4$
                                   2563 ;negative step 
      009AD2 1E 03            [ 2] 2564 	cpw x,(LIMIT,sp)
      009AD4 CF 00            [ 1] 2565 	jrslt loop_done
      009AD6 05 7B            [ 2] 2566 	jra loop_back 
      001C3C                       2567 4$: ; positive step
      009AD8 05 C7            [ 2] 2568 	cpw x,(LIMIT,sp)
      009ADA 00 02            [ 1] 2569 	jrsgt loop_done
      001C40                       2570 loop_back:
      009ADC 7B 06            [ 2] 2571 	ldw x,(BPTR,sp)
      009ADE C7 00 04         [ 2] 2572 	ldw basicptr,x 
      009AE1 81 01 00 21 05   [ 2] 2573 	btjf flags,#FRUN,1$ 
      009AE2 E6 02            [ 1] 2574 	ld a,(2,x)
      009AE2 52 07 03         [ 1] 2575 	ld count,a
      009AE4 1E 09            [ 2] 2576 1$:	ldw x,(INW,sp)
      009AE4 0F 05 CD         [ 2] 2577 	ldw in.w,x 
      009AE7 92               [ 4] 2578 	ret 
      001C55                       2579 loop_done:
                                   2580 	; remove loop data from stack  
      009AE8 CF               [ 2] 2581 	popw x
      001C56                       2582 	_drop VSIZE 
      009AE9 A1 02            [ 2]    1     addw sp,#VSIZE 
      009AEB 26 08 CD 83      [ 1] 2583 	dec loop_depth 
                                   2584 ;	pushw x 
                                   2585 ;	ret 
      009AEF CE               [ 2] 2586 	jp (x)
                                   2587 
                                   2588 ;----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



                                   2589 ; called by goto/gosub
                                   2590 ; to get target line number 
                                   2591 ;---------------------------
      001C5D                       2592 get_target_line:
      009AF0 03 05 CD         [ 4] 2593 	call next_token  
      009AF3 92 CF            [ 1] 2594 	cp a,#TK_INTGR
      009AF5 A1 85            [ 1] 2595 	jreq get_target_line_2 
      009AF7 27 03            [ 1] 2596 	cp a,#TK_LABEL 
      009AF9 CC 91            [ 1] 2597 	jreq look_target_symbol 
      009AFB D7 1F 06         [ 2] 2598 	jp syntax_error
      001C6B                       2599 get_target_line_2:
      009AFE 0D               [ 1] 2600 	clr a
      009AFF 05 26 06 CD      [ 2] 2601 	ldw y,basicptr 
      009B03 8B E8            [ 2] 2602 	ldw y,(y)
      009B05 CD 83            [ 2] 2603 	pushw y 
      009B07 71 01            [ 2] 2604 	cpw x,(1,sp)
      009B08 5B 02            [ 2] 2605 	addw sp,#2 
      009B08 A6 3A            [ 1] 2606 	jrult 11$
      009B0A CD               [ 1] 2607 	inc a 
      001C7B                       2608 11$:	
      009B0B 83 71 CD         [ 4] 2609 	call search_lineno  
      009B0E 9A               [ 2] 2610 	tnzw x 
      009B0F C2 72            [ 1] 2611 	jrne 2$ 
      009B11 5F 00            [ 1] 2612 	ld a,#ERR_NO_LINE 
      009B13 04 CD 84         [ 2] 2613 	jp tb_error 
      009B16 D3               [ 4] 2614 2$:	ret 
                                   2615 
                                   2616 ; the GOTO|GOSUB target is a symbol.
      001C87                       2617 look_target_symbol:
      009B17 AE 16 90 3B      [ 1] 2618 	clr acc16 
      009B1B 00 04 4B 00      [ 2] 2619 	ldw y,txtbgn 
      009B1F 72 FB 01         [ 1] 2620 1$:	ld a,(3,y) ; first TK_ID on line 
      009B22 5C 5B            [ 1] 2621 	cp a,#TK_LABEL 
      009B24 02 72            [ 1] 2622 	jreq 3$ 
      009B26 5F 00 02         [ 1] 2623 2$:	ld a,(2,y); line length 
      009B29 CD 89 37         [ 1] 2624 	ld acc8,a 
      009B2C A1 84 27 10      [ 2] 2625 	addw y,acc16 ;point to next line 
      009B30 A1 11 CD 89      [ 2] 2626 	cpw y,txtend 
      009B34 37 A1            [ 1] 2627 	jrult 1$
      009B36 84 27            [ 1] 2628 	ld a,#ERR_BAD_VALUE
      009B38 06 CD 9A         [ 2] 2629 	jp tb_error 
      001CAB                       2630 3$: ; found a TK_LABEL 
                                   2631 	; compare with GOTO|GOSUB target 
      009B3B D2 CC            [ 2] 2632 	pushw y 
      009B3D 91 D7 00 04      [ 2] 2633 	addw y,#4 ; label string 
      009B3F CE 00 04         [ 2] 2634 	ldw x,basicptr 
      009B3F 50 16 06 90      [ 2] 2635 	addw x,in.w 
      009B43 FF CD 9A         [ 4] 2636 	call strcmp
      009B46 D2 CD            [ 1] 2637 	jrne 4$
      009B48 92 CF            [ 2] 2638 	popw y 
      009B4A A1 09            [ 2] 2639 	jra 2$ 
      001CC1                       2640 4$: ; target found 
      009B4C 27 96 A1         [ 4] 2641 	call skip_label 
      009B4F 00               [ 2] 2642 	popw x 
      009B50 27               [ 4] 2643 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



                                   2644 
                                   2645 ;--------------------------------
                                   2646 ;  skip label string in BASIC 
                                   2647 ;  text.
                                   2648 ;-------------------------------
      001CC6                       2649 skip_label:
      009B51 07 A1 0B         [ 2] 2650 	ldw x,basicptr 
      009B54 27 03 CC 91      [ 4] 2651 1$:	ld a,([in.w],x)
      009B58 D7 5C 00 01      [ 1] 2652 	inc in 
      009B59 4D               [ 1] 2653 	tnz a 
      009B59 5B 07            [ 1] 2654 	jrne 1$
      009B5B 81               [ 4] 2655 	ret 
                                   2656 
                                   2657 
                                   2658 ;--------------------------------
                                   2659 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2660 ; selective goto or gosub 
                                   2661 ;--------------------------------
                           000003  2662 	RET_ADDR=3
                           000005  2663 	RET_INW=5
                           000004  2664 	VSIZE=4  
      009B5C                       2665 cmd_on:
      009B5C 55 00 04 00 02   [ 2] 2666 	btjt flags,#FRUN,0$ 
      009B61 81 06            [ 1] 2667 	ld a,#ERR_RUN_ONLY
      009B62 CC 11 59         [ 2] 2668 	jp tb_error 
      009B62 52 04 0F         [ 4] 2669 0$:	call expression 
      009B65 01 CD            [ 1] 2670 	cp a,#TK_INTGR
      009B67 96 79            [ 1] 2671 	jreq 1$
      009B69 A1 02 24         [ 2] 2672 	jp syntax_error
      009B6C 03 CC 91         [ 2] 2673 1$: cpw x,#1 
      009B6F D7 A1            [ 1] 2674 	jrslt 9$
      009B71 03 25 04         [ 2] 2675 	cpw x,#16 ; no more than 16 arguments 
      009B74 85 9F            [ 1] 2676 	jrugt 9$
      009B76 6B               [ 1] 2677 	ld a,xl 
      009B77 01               [ 1] 2678 	push a  ; selector  
      009B78 85 9F 6B         [ 4] 2679 	call next_token ; should be GOTO|GOSUB 
      009B7B 02 85            [ 1] 2680 	cp a,#TK_CMD 
      009B7D F6 14            [ 1] 2681 	jreq 2$ 
      009B7F 02 18 01         [ 2] 2682 	jp syntax_error 
      009B82 27 F9 5B         [ 2] 2683 2$: cpw x,#goto 
      009B85 04 81            [ 1] 2684 	jreq 4$
      009B87 A3 1D 78         [ 2] 2685 	cpw x,#gosub 
      009B87 CD 96            [ 1] 2686 	jreq 4$ 
      009B89 79 A1 02         [ 2] 2687 	jp syntax_error 
      009B8C 27               [ 1] 2688 4$: pop a 
      009B8D 03               [ 2] 2689 	pushw x ; save routine address 	
      009B8E CC               [ 1] 2690 	push a  ; -- code_addr selector  
      009B8F 91 D7 4F         [ 4] 2691 5$: call next_token 
      009B91 A1 84            [ 1] 2692 	cp a,#TK_INTGR 
      009B91 85 9F            [ 1] 2693 	jreq 52$
      009B93 85 FA F7         [ 2] 2694 	jp syntax_error 
      001D19                       2695 52$: ; got a line number 
      009B96 81 01            [ 1] 2696 	dec (1,sp) ; decrement selector 
      009B97 27 0B            [ 1] 2697 	jreq 58$ ; this is the selected one 
      009B97 CD 96 79         [ 4] 2698 	call next_token ; try for the next one 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      009B9A A1 02            [ 1] 2699 	cp a,#TK_COMMA 
      009B9C 27 03            [ 1] 2700 	jreq 5$ 
                                   2701 ; arg list exhausted, selector to big 
                                   2702 ; continue execution on next line 
      001D24                       2703 	_drop 3 ; drop selector and GOTO|GOSUB address 
      009B9E CC 91            [ 2]    1     addw sp,#3 
      009BA0 D7 2F            [ 2] 2704 	jra 9$
      009BA1                       2705 58$: ;found line# in list 
      001D28                       2706 	_drop 1 ; discard selector 
      009BA1 85 9F            [ 2]    1     addw sp,#1 
      009BA3 43 85 F4 F7 81   [ 1] 2707 	mov in,count ; skip to end of this line. 
                                   2708 ; here only the routine address of GOTO|GOSUB is on stack 
                                   2709 ;   X contain target line number 
      009BA8 CD 1C 6B         [ 4] 2710 8$:	call get_target_line_2
      009BA8 CD 96            [ 2] 2711 	popw y ; routine address GOTO|GOSUB  
      009BAA 79 A1 02 27      [ 2] 2712 	cpw y,#goto 
      009BAE 03 CC            [ 1] 2713 	jreq jp_to_target 
      009BB0 91 D7            [ 2] 2714 	popw y 
      001D3C                       2715 	_vars VSIZE 
      009BB2 85 9F            [ 2]    1     sub sp,#VSIZE 
      009BB4 85 F8            [ 2] 2716 	pushw y 
      009BB6 F7 81 00 04      [ 2] 2717 	ldw y,basicptr 
      009BB8 55 00 03 00 01   [ 1] 2718 	mov in,count 
      009BB8 CD 96 74 A1      [ 2] 2719 	addw y,in.w 
      009BBC 02 27            [ 2] 2720 	ldw (RET_ADDR,sp),y 
      009BBE 03 CC 91 D7      [ 2] 2721 	ldw y,#3 
      009BC2 17 05            [ 2] 2722 	ldw (RET_INW,sp),y
      009BC2 85 9F            [ 2] 2723 	jra jp_to_target
      001D57                       2724 9$: ; expr out of range skip to next line 
      009BC4 A4 07 88 A6 01   [ 1] 2725 	mov in,count
      009BC9 0D               [ 1] 2726 	clr a  
      009BCA 01               [ 4] 2727 	ret 
                                   2728 
                                   2729 ;------------------------
                                   2730 ; BASIC: GOTO line# 
                                   2731 ; jump to line# 
                                   2732 ; here cstack is 2 call deep from interpreter 
                                   2733 ;------------------------
      001D5E                       2734 goto:
      009BCB 27 05 48 0A 01   [ 2] 2735 	btjt flags,#FRUN,0$ 
      009BD0 20 F7            [ 1] 2736 	ld a,#ERR_RUN_ONLY
      009BD2 5B 01 85         [ 2] 2737 	jp tb_error 
      009BD5 F4 27 02         [ 4] 2738 0$:	call get_target_line
      001D6B                       2739 jp_to_target:
      009BD8 A6 01 5F         [ 2] 2740 	ldw basicptr,x 
      009BDB 97 A6            [ 1] 2741 	ld a,(2,x)
      009BDD 84 81 03         [ 1] 2742 	ld count,a 
      009BDF 35 03 00 01      [ 1] 2743 	mov in,#3 
      009BDF CD               [ 4] 2744 	ret 
                                   2745 
                                   2746 
                                   2747 ;--------------------
                                   2748 ; BASIC: GOSUB line#
                                   2749 ; basic subroutine call
                                   2750 ; actual line# and basicptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



                                   2751 ; are saved on cstack
                                   2752 ; here cstack is 2 call deep from interpreter 
                                   2753 ;--------------------
                           000003  2754 	RET_ADDR=3
                           000005  2755 	RET_INW=5
                           000004  2756 	VSIZE=4  
      001D78                       2757 gosub:
      009BE0 96 79 A1 02 27   [ 2] 2758 	btjt flags,#FRUN,0$ 
      009BE5 03 CC            [ 1] 2759 	ld a,#ERR_RUN_ONLY
      009BE7 91 D7 59         [ 2] 2760 	jp tb_error 
      009BE9 81               [ 4] 2761 	ret 
      009BE9 85               [ 2] 2762 0$:	popw x 
      001D84                       2763 	_vars VSIZE  
      009BEA 9F 85            [ 2]    1     sub sp,#VSIZE 
      009BEC F7               [ 2] 2764 	pushw x 
      009BED 81 00 04         [ 2] 2765 	ldw x,basicptr
      009BEE 1F 03            [ 2] 2766 	ldw (RET_ADDR,sp),x 
      009BEE CD 96 74         [ 4] 2767 	call get_target_line  
      009BF1 A1               [ 2] 2768 	pushw x 
      009BF2 01 27 03         [ 2] 2769 	ldw x,in.w 
      009BF5 CC 91            [ 2] 2770 	ldw (RET_INW+2,sp),x
      009BF7 D7               [ 2] 2771 	popw x 
      009BF8 85 F6            [ 2] 2772 	jra jp_to_target
                                   2773 
                                   2774 ;------------------------
                                   2775 ; BASIC: RETURN 
                                   2776 ; exit from a subroutine 
                                   2777 ; 
                                   2778 ;------------------------
      001D98                       2779 return:
      009BFA 5F 97 A6 84 81   [ 2] 2780 	btjt flags,#FRUN,0$ 
      009BFF A6 06            [ 1] 2781 	ld a,#ERR_RUN_ONLY
      009BFF CD 97 C1         [ 2] 2782 	jp tb_error 
      001DA2                       2783 0$:	
      009C02 A1 84            [ 2] 2784 	ldw x,(RET_ADDR,sp) 
      009C04 27 03 CC         [ 2] 2785 	ldw basicptr,x
      009C07 91 D7            [ 1] 2786 	ld a,(2,x)
      009C09 4F 5D 26         [ 1] 2787 	ld count,a  
      009C0C 05 55            [ 2] 2788 	ldw x,(RET_INW,sp)
      009C0E 00 04 00         [ 2] 2789 	ldw in.w,x 
      009C11 02               [ 2] 2790 	popw x 
      001DB2                       2791 	_drop VSIZE 
      009C12 81 04            [ 2]    1     addw sp,#VSIZE 
      009C13 89               [ 2] 2792 	pushw x
      009C13 85               [ 4] 2793 	ret  
                                   2794 
                                   2795 
                                   2796 ;----------------------------------
                                   2797 ; BASIC: RUN
                                   2798 ; run BASIC program in RAM
                                   2799 ;----------------------------------- 
      001DB6                       2800 run: 
      009C14 52 0A 89 A6 85   [ 2] 2801 	btjf flags,#FRUN,0$  
      009C19 CD               [ 1] 2802 	clr a 
      009C1A 96               [ 4] 2803 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      001DBD                       2804 0$: 
      009C1B 67 1F 07 CD 98   [ 2] 2805 	btjf flags,#FBREAK,1$
      001DC2                       2806 	_drop 2 
      009C20 C5 72            [ 2]    1     addw sp,#2 
      009C22 14 00 22         [ 4] 2807 	call rest_context
      001DC7                       2808 	_drop CTXT_SIZE 
      009C25 5F 1F            [ 2]    1     addw sp,#CTXT_SIZE 
      009C27 0B 1F 09 CD      [ 1] 2809 	bres flags,#FBREAK 
      009C2B 92 CF A1 80      [ 1] 2810 	bset flags,#FRUN 
      009C2F 27 03 CC         [ 2] 2811 	jp interpreter 
      009C32 91 D7 1A         [ 2] 2812 1$:	ldw x,txtbgn
      009C34 C3 00 1C         [ 2] 2813 	cpw x,txtend 
      009C34 A3 9C            [ 1] 2814 	jrmi run_it 
      009C36 3C 27 03         [ 2] 2815 	ldw x,#err_no_prog
      009C39 CC 91 D7         [ 4] 2816 	call puts 
      009C3C 55 00 03 00 01   [ 1] 2817 	mov in,count
      009C3C 72               [ 4] 2818 	ret 
      001DE8                       2819 run_it:	 
      001DE8                       2820 	_drop 2 ; drop return address 
      009C3D 04 00            [ 2]    1     addw sp,#2 
      001DEA                       2821 run_it_02: 
      009C3F 22 03 CC         [ 4] 2822     call ubound 
      009C42 91 D7 CD         [ 4] 2823 	call clear_vars 
                                   2824 ; clear data pointer 
      009C45 97               [ 1] 2825 	clrw x 
      009C46 C1 A1 84         [ 2] 2826 	ldw data_ptr,x 
      009C49 27 03 CC 91      [ 1] 2827 	clr data_ofs 
      009C4D D7 1F 05 CD      [ 1] 2828 	clr data_len 
                                   2829 ; initialize BASIC pointer 
      009C51 92 CF A1         [ 2] 2830 	ldw x,txtbgn 
      009C54 00 27 0E         [ 2] 2831 	ldw basicptr,x 
      009C57 A1 80            [ 1] 2832 	ld a,(2,x)
      009C59 26 05 A3         [ 1] 2833 	ld count,a
      009C5C 9C 6C 27 0C      [ 1] 2834 	mov in,#3	
      009C60 72 10 00 21      [ 1] 2835 	bset flags,#FRUN 
      009C60 55 00 03         [ 2] 2836 	jp interpreter 
                                   2837 
                                   2838 
                                   2839 ;----------------------
                                   2840 ; BASIC: END
                                   2841 ; end running program
                                   2842 ;---------------------- 
      001E12                       2843 cmd_end: 
                                   2844 ; clean stack 
      009C63 00 02 FF         [ 2] 2845 	ldw x,#STACK_EMPTY
      009C65 94               [ 1] 2846 	ldw sp,x 
      009C65 AE 00 01         [ 2] 2847 	jp warm_start
                                   2848 
                                   2849 ;---------------------------
                                   2850 ; BASIC: GET var 
                                   2851 ; receive a key in variable 
                                   2852 ; don't wait 
                                   2853 ;---------------------------
      001E19                       2854 cmd_get:
      009C68 1F 03 20         [ 4] 2855 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      009C6B 14 85            [ 1] 2856 	cp a,#TK_VAR 
      009C6C 27 03            [ 1] 2857 	jreq 0$
      009C6C 72 04 00         [ 2] 2858 	jp syntax_error 
      009C6F 22 03 CC         [ 2] 2859 0$: ldw ptr16,x 
      009C72 91 D7 CD         [ 4] 2860 	call qgetc 
      009C75 97 C1            [ 1] 2861 	jreq 2$
      009C77 A1 84 27         [ 4] 2862 	call getc  
      009C7A 03 CC 91 D7      [ 4] 2863 2$: clr [ptr16]
      009C7E 1F 03 00 19      [ 1] 2864 	inc ptr8 
      009C80 72 C7 00 18      [ 4] 2865 	ld [ptr16],a 
      009C80 CE               [ 4] 2866 	ret 
                                   2867 
                                   2868 
                                   2869 ;-----------------
                                   2870 ; 1 Khz beep 
                                   2871 ;-----------------
      001E3B                       2872 beep_1khz:: 
      009C81 00 05 1F         [ 2] 2873 	ldw x,#100
      009C84 0B CE 00 01      [ 2] 2874 	ldw y,#1000
      009C88 1F 09            [ 2] 2875 	jra beep
                                   2876 
                                   2877 ;-----------------------
                                   2878 ; BASIC: TONE expr1,expr2
                                   2879 ; used TIMER2 channel 1
                                   2880 ; to produce a tone 
                                   2881 ; arguments:
                                   2882 ;    expr1   frequency 
                                   2883 ;    expr2   duration msec.
                                   2884 ;---------------------------
      001E44                       2885 tone:
      009C8A 72 15 00         [ 4] 2886 	call arg_list 
      009C8D 22 72            [ 1] 2887 	cp a,#2 
      009C8F 5C 00            [ 1] 2888 	jreq 1$
      009C91 1F 81 57         [ 2] 2889 	jp syntax_error 
      009C93                       2890 1$: 
      009C93 72               [ 2] 2891 	popw x ; duration
      009C94 5D 00            [ 2] 2892 	popw y ; frequency 
      001E51                       2893 beep:  
      009C96 1F               [ 2] 2894 	pushw x 
      009C97 26 03 CC         [ 2] 2895 	ldw x,#TIM2_CLK_FREQ
      009C9A 91               [ 2] 2896 	divw x,y 
                                   2897 ; round to nearest integer 
      009C9B D7 A3 7A 12      [ 2] 2898 	cpw y,#TIM2_CLK_FREQ/2
      009C9C 2B 01            [ 1] 2899 	jrmi 2$
      009C9C A6               [ 1] 2900 	incw x 
      001E5D                       2901 2$:	 
      009C9D 85               [ 1] 2902 	ld a,xh 
      009C9E CD 96 67         [ 1] 2903 	ld TIM2_ARRH,a 
      009CA1 13               [ 1] 2904 	ld a,xl 
      009CA2 07 27 03         [ 1] 2905 	ld TIM2_ARRL,a 
                                   2906 ; 50% duty cycle 
      009CA5 CC               [ 1] 2907 	ccf 
      009CA6 91               [ 2] 2908 	rrcw x 
      009CA7 D7               [ 1] 2909 	ld a,xh 
      009CA8 C7 53 0F         [ 1] 2910 	ld TIM2_CCR1H,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      009CA8 FE               [ 1] 2911 	ld a,xl
      009CA9 72 FB 03         [ 1] 2912 	ld TIM2_CCR1L,a
      009CAC 16 07 90 FF      [ 1] 2913 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      009CB0 A6 80 15 03      [ 1] 2914 	bset TIM2_CR1,#TIM2_CR1_CEN
      009CB4 2A 06 13 05      [ 1] 2915 	bset TIM2_EGR,#TIM2_EGR_UG
      009CB8 2F               [ 2] 2916 	popw x 
      009CB9 1B 20 04         [ 4] 2917 	call pause02
      009CBC 72 11 53 08      [ 1] 2918 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      009CBC 13 05 2C 15      [ 1] 2919 	bres TIM2_CR1,#TIM2_CR1_CEN 
      009CC0 81               [ 4] 2920 	ret 
                                   2921 
                                   2922 ;-------------------------------
                                   2923 ; BASIC: ADCON 0|1 [,divisor]  
                                   2924 ; disable/enanble ADC 
                                   2925 ;-------------------------------
                           000003  2926 	ONOFF=3 
                           000001  2927 	DIVSOR=1
                           000004  2928 	VSIZE=4 
      001E88                       2929 power_adc:
      009CC0 1E 0B CF         [ 4] 2930 	call arg_list 
      009CC3 00 05            [ 1] 2931 	cp a,#2	
      009CC5 72 01            [ 1] 2932 	jreq 1$
      009CC7 00 22            [ 1] 2933 	cp a,#1 
      009CC9 05 E6            [ 1] 2934 	jreq 0$ 
      009CCB 02 C7 00         [ 2] 2935 	jp syntax_error 
      009CCE 04 1E 09         [ 2] 2936 0$: ldw x,#0
      009CD1 CF               [ 2] 2937 	pushw x  ; divisor 
      009CD2 00 01            [ 2] 2938 1$: ldw x,(ONOFF,sp)
      009CD4 81               [ 2] 2939 	tnzw x 
      009CD5 27 1A            [ 1] 2940 	jreq 2$ 
      009CD5 85 5B            [ 2] 2941 	ldw x,(DIVSOR,sp) ; divisor 
      009CD7 0A               [ 1] 2942 	ld a,xl
      009CD8 72 5A            [ 1] 2943 	and a,#7
      009CDA 00               [ 1] 2944 	swap a 
      009CDB 1F FC 01         [ 1] 2945 	ld ADC_CR1,a
      009CDD 72 16 50 CA      [ 1] 2946 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      009CDD CD 92 CF A1      [ 1] 2947 	bset ADC_CR1,#ADC_CR1_ADON 
      001EB0                       2948 	_usec_dly 7 
      009CE1 84 27 07         [ 2]    1     ldw x,#(16*7-2)/4
      009CE4 A1               [ 2]    2     decw x
      009CE5 01               [ 1]    3     nop 
      009CE6 27 1F            [ 1]    4     jrne .-4
      009CE8 CC 91            [ 2] 2949 	jra 3$
      009CEA D7 11 54 01      [ 1] 2950 2$: bres ADC_CR1,#ADC_CR1_ADON
      009CEB 72 17 50 CA      [ 1] 2951 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      001EC1                       2952 3$:	_drop VSIZE 
      009CEB 4F 90            [ 2]    1     addw sp,#VSIZE 
      009CED CE               [ 4] 2953 	ret
                                   2954 
                                   2955 ;-----------------------------
                                   2956 ; BASIC: ADCREAD (channel)
                                   2957 ; read adc channel {0..5}
                                   2958 ; output:
                                   2959 ;   A 		TK_INTGR 
                                   2960 ;   X 		value 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



                                   2961 ;-----------------------------
      001EC4                       2962 analog_read:
      009CEE 00 05 90         [ 4] 2963 	call func_args 
      009CF1 FE 90            [ 1] 2964 	cp a,#1 
      009CF3 89 13            [ 1] 2965 	jreq 1$
      009CF5 01 5B 02         [ 2] 2966 	jp syntax_error
      009CF8 25               [ 2] 2967 1$: popw x 
      009CF9 01 4C 05         [ 2] 2968 	cpw x,#5 
      009CFB 23 05            [ 2] 2969 	jrule 2$
      009CFB CD 86            [ 1] 2970 	ld a,#ERR_BAD_VALUE
      009CFD B6 5D 26         [ 2] 2971 	jp tb_error 
      009D00 05               [ 1] 2972 2$: ld a,xl
      009D01 A6 05 CC         [ 1] 2973 	ld acc8,a 
      009D04 91 D9            [ 1] 2974 	ld a,#5
      009D06 81 00 0E         [ 1] 2975 	sub a,acc8 
      009D07 C7 54 00         [ 1] 2976 	ld ADC_CSR,a
      009D07 72 5F 00 0E      [ 1] 2977 	bset ADC_CR2,#ADC_CR2_ALIGN
      009D0B 90 CE 00 1B      [ 1] 2978 	bset ADC_CR1,#ADC_CR1_ADON
      009D0F 90 E6 03 A1 01   [ 2] 2979 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009D14 27 15 90         [ 2] 2980 	ldw x,ADC_DRH
      009D17 E6 02            [ 1] 2981 	ld a,#TK_INTGR
      009D19 C7               [ 4] 2982 	ret 
                                   2983 
                                   2984 ;-----------------------
                                   2985 ; BASIC: DREAD(pin)
                                   2986 ; Arduino pins 
                                   2987 ; read state of a digital pin 
                                   2988 ; pin# {0..15}
                                   2989 ; output:
                                   2990 ;    A 		TK_INTGR
                                   2991 ;    X      0|1 
                                   2992 ;-------------------------
                           000001  2993 	PINNO=1
                           000001  2994 	VSIZE=1
      001EF8                       2995 digital_read:
      001EF8                       2996 	_vars VSIZE 
      009D1A 00 0F            [ 2]    1     sub sp,#VSIZE 
      009D1C 72 B9 00         [ 4] 2997 	call func_args
      009D1F 0E 90            [ 1] 2998 	cp a,#1
      009D21 C3 00            [ 1] 2999 	jreq 1$
      009D23 1D 25 E9         [ 2] 3000 	jp syntax_error
      009D26 A6               [ 2] 3001 1$: popw x 
      009D27 0A CC 91         [ 2] 3002 	cpw x,#15 
      009D2A D9 05            [ 2] 3003 	jrule 2$
      009D2B A6 0A            [ 1] 3004 	ld a,#ERR_BAD_VALUE
      009D2B 90 89 72         [ 2] 3005 	jp tb_error 
      009D2E A9 00 04         [ 4] 3006 2$:	call select_pin 
      009D31 CE 00            [ 1] 3007 	ld (PINNO,sp),a
      009D33 05 72            [ 1] 3008 	ld a,(GPIO_IDR,x)
      009D35 BB 00            [ 1] 3009 	tnz (PINNO,sp)
      009D37 01 CD            [ 1] 3010 	jreq 8$
      009D39 8E               [ 1] 3011 3$: srl a 
      009D3A 97 26            [ 1] 3012 	dec (PINNO,sp)
      009D3C 04 90            [ 1] 3013 	jrne 3$ 
      009D3E 85 20            [ 1] 3014 8$: and a,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      009D40 D5               [ 1] 3015 	clrw x 
      009D41 97               [ 1] 3016 	ld xl,a 
      009D41 CD 9D            [ 1] 3017 	ld a,#TK_INTGR
      001F25                       3018 	_drop VSIZE
      009D43 46 85            [ 2]    1     addw sp,#VSIZE 
      009D45 81               [ 4] 3019 	ret
                                   3020 
                                   3021 
                                   3022 ;-----------------------
                                   3023 ; BASIC: DWRITE pin,0|1
                                   3024 ; Arduino pins 
                                   3025 ; write to a digital pin 
                                   3026 ; pin# {0..15}
                                   3027 ; output:
                                   3028 ;    A 		TK_INTGR
                                   3029 ;    X      0|1 
                                   3030 ;-------------------------
                           000001  3031 	PINNO=1
                           000002  3032 	PINVAL=2
                           000002  3033 	VSIZE=2
      009D46                       3034 digital_write:
      001F28                       3035 	_vars VSIZE 
      009D46 CE 00            [ 2]    1     sub sp,#VSIZE 
      009D48 05 72 D6         [ 4] 3036 	call arg_list  
      009D4B 00 01            [ 1] 3037 	cp a,#2 
      009D4D 72 5C            [ 1] 3038 	jreq 1$
      009D4F 00 02 4D         [ 2] 3039 	jp syntax_error
      009D52 26               [ 2] 3040 1$: popw x 
      009D53 F5               [ 1] 3041 	ld a,xl 
      009D54 81 02            [ 1] 3042 	ld (PINVAL,sp),a
      009D55 85               [ 2] 3043 	popw x 
      009D55 72 00 00         [ 2] 3044 	cpw x,#15 
      009D58 22 05            [ 2] 3045 	jrule 2$
      009D5A A6 06            [ 1] 3046 	ld a,#ERR_BAD_VALUE
      009D5C CC 91 D9         [ 2] 3047 	jp tb_error 
      009D5F CD 97 78         [ 4] 3048 2$:	call select_pin 
      009D62 A1 84            [ 1] 3049 	ld (PINNO,sp),a 
      009D64 27 03            [ 1] 3050 	ld a,#1
      009D66 CC 91            [ 1] 3051 	tnz (PINNO,sp)
      009D68 D7 A3            [ 1] 3052 	jreq 4$
      009D6A 00               [ 1] 3053 3$: sll a
      009D6B 01 2F            [ 1] 3054 	dec (PINNO,sp)
      009D6D 69 A3            [ 1] 3055 	jrne 3$
      009D6F 00 10            [ 1] 3056 4$: tnz (PINVAL,sp)
      009D71 22 64            [ 1] 3057 	jrne 5$
      009D73 9F               [ 1] 3058 	cpl a 
      009D74 88 CD            [ 1] 3059 	and a,(GPIO_ODR,x)
      009D76 92 CF            [ 2] 3060 	jra 8$
      009D78 A1 80            [ 1] 3061 5$: or a,(GPIO_ODR,x)
      009D7A 27 03            [ 1] 3062 8$: ld (GPIO_ODR,x),a 
      001F60                       3063 	_drop VSIZE 
      009D7C CC 91            [ 2]    1     addw sp,#VSIZE 
      009D7E D7               [ 4] 3064 	ret
                                   3065 
                                   3066 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



                                   3067 ;-----------------------
                                   3068 ; BASIC: STOP
                                   3069 ; stop progam execution  
                                   3070 ; without resetting pointers 
                                   3071 ; the program is resumed
                                   3072 ; with RUN 
                                   3073 ;-------------------------
      001F63                       3074 stop:
      009D7F A3 9D DE 27 08   [ 2] 3075 	btjt flags,#FRUN,2$
      009D84 A3               [ 1] 3076 	clr a
      009D85 9D               [ 4] 3077 	ret 
      001F6A                       3078 2$:	 
                                   3079 ; create space on cstack to save context 
      009D86 F8 27 03         [ 2] 3080 	ldw x,#break_point 
      009D89 CC 91 D7         [ 4] 3081 	call puts 
      001F70                       3082 	_drop 2 ;drop return address 
      009D8C 84 89            [ 2]    1     addw sp,#2 
      001F72                       3083 	_vars CTXT_SIZE ; context size 
      009D8E 88 CD            [ 2]    1     sub sp,#CTXT_SIZE 
      009D90 92 CF A1         [ 4] 3084 	call save_context 
      009D93 84 27 03         [ 2] 3085 	ldw x,#tib 
      009D96 CC 91 D7         [ 2] 3086 	ldw basicptr,x
      009D99 7F               [ 1] 3087 	clr (x)
      009D99 0A 01 27 0B      [ 1] 3088 	clr count  
      009D9D CD               [ 1] 3089 	clrw x 
      009D9E 92 CF A1         [ 2] 3090 	ldw in.w,x
      009DA1 09 27 EB 5B      [ 1] 3091 	bres flags,#FRUN 
      009DA5 03 20 2F 21      [ 1] 3092 	bset flags,#FBREAK
      009DA8 CC 11 FA         [ 2] 3093 	jp interpreter 
      009DA8 5B 01 55 00 04 00 02  3094 break_point: .asciz "\nbreak point, RUN to resume.\n"
             CD 9C EB 90 85 90 A3
             9D DE 27 31 90 85 52
             04 90 89 90 CE 00 05
             55 00
                                   3095 
                                   3096 ;-----------------------
                                   3097 ; BASIC: NEW
                                   3098 ; from command line only 
                                   3099 ; free program memory
                                   3100 ; and clear variables 
                                   3101 ;------------------------
      001FAF                       3102 new: 
      009DC6 04 00 02 72 B9   [ 2] 3103 	btjf flags,#FRUN,0$ 
      009DCB 00               [ 4] 3104 	ret 
      001FB5                       3105 0$:	
      009DCC 01 17 03         [ 4] 3106 	call clear_basic 
      009DCF 90               [ 4] 3107 	ret 
                                   3108 
                                   3109 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3110 ;;;  flash memory operations
                                   3111 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3112 
                                   3113 ;--------------------------
                                   3114 ; align farptr to BLOCK_SIZE 
                                   3115 ;---------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      001FB9                       3116 row_align:
      009DD0 AE 00            [ 1] 3117 	ld a,#0x7f 
      009DD2 03 17 05         [ 1] 3118 	and a,farptr+2 
      009DD5 20 14            [ 1] 3119 	jreq 1$ 
      009DD7 CE 00 18         [ 2] 3120 	ldw x,farptr+1 
      009DD7 55 00 04         [ 2] 3121 	addw x,#BLOCK_SIZE 
      009DDA 00 02            [ 1] 3122 	jrnc 0$
      009DDC 4F 81 00 17      [ 1] 3123 	inc farptr 
      009DDE 9F               [ 1] 3124 0$: ld a,xl 
      009DDE 72 00            [ 1] 3125 	and a,#0x80
      009DE0 00               [ 1] 3126 	ld xl,a
      009DE1 22 05 A6         [ 2] 3127 	ldw farptr+1,x  	
      009DE4 06               [ 4] 3128 1$:	ret
                                   3129 
                                   3130 ;--------------------
                                   3131 ; input:
                                   3132 ;   X     increment 
                                   3133 ; output:
                                   3134 ;   farptr  incremented 
                                   3135 ;---------------------
      001FD4                       3136 incr_farptr:
      009DE5 CC 91 D9 CD      [ 2] 3137 	addw x,farptr+1 
      009DE9 9C DD            [ 1] 3138 	jrnc 1$
      009DEB 72 5C 00 17      [ 1] 3139 	inc farptr 
      009DEB CF 00 05         [ 2] 3140 1$:	ldw farptr+1,x  
      009DEE E6               [ 4] 3141 	ret 
                                   3142 
                                   3143 ;-----------------------------------
                                   3144 ; scan block for non zero byte 
                                   3145 ; block are 128 bytes 
                                   3146 ; input:
                                   3147 ;    farptr     address block  
                                   3148 ; output:
                                   3149 ;     A     0 cleared, other not cleared  
                                   3150 ;-----------------------------------
      001FE2                       3151 scan_block:
      009DEF 02               [ 1] 3152 	clrw x 
      009DF0 C7 00 04 35      [ 5] 3153 1$: ldf a,([farptr],x) 
      009DF4 03 00            [ 1] 3154 	jrne 2$
      009DF6 02               [ 1] 3155 	incw x 
      009DF7 81 00 80         [ 2] 3156 	cpw x,#BLOCK_SIZE 
      009DF8 25 F4            [ 1] 3157 	jrult 1$ 
      009DF8 72               [ 4] 3158 2$:	ret 
                                   3159 
                                   3160 
                                   3161 
                                   3162 ;-----------------------------------
                                   3163 ; BASIC: ERASE \E | \F 
                                   3164 ; erase all block in range from 
                                   3165 ;  'app_space' to FLASH end (0x20000)
                                   3166 ;  or all EEPROM 
                                   3167 ; that contains a non zero byte.  
                                   3168 ;-----------------------------------
                           000001  3169 	LIMIT=1 
                           000003  3170 	VSIZE = 3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      001FF0                       3171 erase:
      009DF9 00 00 22 06      [ 1] 3172 	clr farptr 
      001FF4                       3173 	_vars VSIZE 
      009DFD A6 06            [ 2]    1     sub sp,#VSIZE 
      009DFF CC 91 D9         [ 4] 3174 	call next_token 
      009E02 81 85            [ 1] 3175 	cp a,#TK_CHAR 
      009E04 52 04            [ 1] 3176 	jreq 0$ 
      009E06 89 CE 00         [ 2] 3177 	jp syntax_error
      009E09 05               [ 1] 3178 0$: ld a,xl 
      009E0A 1F 03            [ 1] 3179 	and a,#0XDF 
      009E0C CD 9C            [ 1] 3180 	cp a,#'E
      009E0E DD 89            [ 1] 3181 	jrne 1$
      009E10 CE 00 01         [ 2] 3182 	ldw x,#EEPROM_BASE 
      009E13 1F 07 85         [ 2] 3183 	ldw farptr+1,x 
      009E16 20 D3 FF         [ 2] 3184 	ldw x,#EEPROM_END
      009E18 4F               [ 1] 3185 	clr a 
      009E18 72 00            [ 2] 3186 	jra 3$ 
      009E1A 00 22            [ 1] 3187 1$: cp a,#'F 
      009E1C 05 A6            [ 1] 3188 	jreq 2$
      009E1E 06 CC 91         [ 2] 3189 	ldw x,#err_bad_value
      009E21 D9 11 59         [ 2] 3190 	jp tb_error
      009E22                       3191 2$:
      009E22 1E 03 CF         [ 2] 3192 	ldw x,#app_sign 
      009E25 00 05 E6         [ 2] 3193 	ldw farptr+1,x 
      009E28 02 C7            [ 1] 3194 	ld a,#(FLASH_END>>16)&0XFF 
      009E2A 00 04 1E         [ 2] 3195 	ldw x,#FLASH_END&0xffff
      002028                       3196 3$:
      009E2D 05 CF            [ 1] 3197 	ld (LIMIT,sp),a 
      009E2F 00 01            [ 2] 3198 	ldw (LIMIT+1,sp),x 
                                   3199  ; operation done from RAM
                                   3200  ; copy code to RAM in tib   
      009E31 85 5B 04         [ 4] 3201 	call move_erase_to_ram
      00202F                       3202 4$:	 
      009E34 89 81 E2         [ 4] 3203     call scan_block 
      009E36 27 08            [ 1] 3204 	jreq 5$  ; block already erased 
      009E36 72 01            [ 1] 3205     ld a,#'E 
      009E38 00 22 02         [ 4] 3206     call putc 
      009E3B 4F 81 8F         [ 4] 3207 	call block_erase   
                                   3208 ; this block is clean, next  
      009E3D AE 00 80         [ 2] 3209 5$:	ldw x,#BLOCK_SIZE
      009E3D 72 09 00         [ 4] 3210 	call incr_farptr
                                   3211 ; check limit, 24 bit substraction  	
      009E40 22 12            [ 1] 3212 	ld a,(LIMIT,sp)
      009E42 5B 02            [ 2] 3213 	ldw x,(LIMIT+1,sp)
      009E44 CD 9A D2 5B      [ 2] 3214 	subw x,farptr+1
      009E48 04 72 19         [ 1] 3215 	sbc a,farptr 
      009E4B 00 22            [ 1] 3216 	jrugt 4$ 
      009E4D 72 10 00         [ 4] 3217 9$: call clear_basic
      002052                       3218 	_drop VSIZE 
      009E50 22 CC            [ 2]    1     addw sp,#VSIZE 
      009E52 92               [ 4] 3219 	ret 
                                   3220 	
                                   3221 
                                   3222 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3223 ;  check for application signature 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



                                   3224 ; output:
                                   3225 ;   Carry    0 app present 
                                   3226 ;            1 no app installed  
                                   3227 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002055                       3228 qsign: 
      009E53 7A CE 00         [ 2] 3229 	ldw x,app_sign 
      009E56 1B C3 00         [ 2] 3230 	cpw x,SIGNATURE ; "BC" 
      009E59 1D               [ 4] 3231 	ret 
                                   3232 
                                   3233 ;--------------------------------------
                                   3234 ;  fill write buffer 
                                   3235 ;  input:
                                   3236 ;    y  point to output buffer 
                                   3237 ;    x  point to source 
                                   3238 ;    a  bytes to write in buffer 
                                   3239 ;  output:
                                   3240 ;    y   += A 
                                   3241 ;    X   += A 
                                   3242 ;    A   0 
                                   3243 ;---------------------------------------
      00205C                       3244 fill_write_buffer:
      009E5A 2B               [ 1] 3245 	push a 
      009E5B 0C               [ 1] 3246 	tnz a 
      009E5C AE 91            [ 1] 3247 	jreq 9$ 
      009E5E 70               [ 1] 3248 1$: ld a,(x)
      009E5F CD               [ 1] 3249 	incw x 
      009E60 83 CE            [ 1] 3250 	ld (y),a 
      009E62 55 00            [ 1] 3251 	incw y 
      009E64 04 00            [ 1] 3252 	dec (1,sp) 
      009E66 02 81            [ 1] 3253 	jrne 1$ 
      009E68 84               [ 1] 3254 9$:	pop a 
      009E68 5B               [ 4] 3255     ret 	
                                   3256 
                                   3257 ;--------------------------------------
                                   3258 ;  fill pad buffer with zero 
                                   3259 ;  input:
                                   3260 ;	none 
                                   3261 ;  output:
                                   3262 ;    y     buffer address  
                                   3263 ;--------------------------------------
      00206C                       3264 clear_block_buffer:
      009E69 02               [ 1] 3265 	push a 
      009E6A 90 AE 16 E0      [ 2] 3266 	ldw y,#block_buffer 
      009E6A CD 98            [ 2] 3267 	pushw y
      009E6C AA CD            [ 1] 3268 	ld a,#BLOCK_SIZE   
      009E6E 8E FC            [ 1] 3269 1$:	clr (y)
      009E70 5F CF            [ 1] 3270 	incw y
      009E72 00               [ 1] 3271 	dec a  
      009E73 07 72            [ 1] 3272 	jrne 1$ 	
      009E75 5F 00            [ 2] 3273 9$: popw y 
      009E77 09               [ 1] 3274 	pop a 			
      009E78 72               [ 4] 3275 	ret 
                                   3276 
                                   3277 
                                   3278 ;---------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



                                   3279 ; BASIC: SAVE
                                   3280 ; write application from RAM to FLASH
                                   3281 ;--------------------------------------
                           000001  3282 	XTEMP=1
                           000003  3283 	COUNT=3  ; last count bytes written 
                           000004  3284 	CNT_LO=4 ; count low byte 
                           000005  3285 	TOWRITE=5 ; how bytes left to write  
                           000006  3286 	VSIZE=6 
      002080                       3287 save_app:
      009E79 5F               [ 2] 3288 	pushw x 
      009E7A 00 0A            [ 2] 3289 	pushw y 
      002083                       3290 	_vars VSIZE
      009E7C CE 00            [ 2]    1     sub sp,#VSIZE 
      009E7E 1B CF 00         [ 4] 3291 	call qsign 
      009E81 05 E6            [ 1] 3292 	jrne 1$
      009E83 02 C7 00         [ 2] 3293 	ldw x,#CANT_DO 
      009E86 04 35 03         [ 4] 3294 	call puts 
      009E89 00 02 72         [ 2] 3295 	jp 9$
      002093                       3296 1$: 
      009E8C 10 00 22         [ 2] 3297 	ldw x,txtbgn
      009E8F CC 92 7A         [ 2] 3298 	cpw x,txtend 
      009E92 25 09            [ 1] 3299 	jrult 2$ 
      009E92 AE 17 FF         [ 2] 3300 	ldw x,#NO_APP
      009E95 94 CC 92         [ 4] 3301 	call puts 
      009E98 5B 21 0F         [ 2] 3302 	jp 9$
      009E99                       3303 2$: 
                                   3304 ; block programming flash
                                   3305 ; must be done from RAM
                                   3306 ; moved in tib  
      009E99 CD 92 CF         [ 4] 3307 	call move_prg_to_ram
                                   3308 ; initialize farptr 
                                   3309 ; to app_sign address 
      009E9C A1 85 27 03      [ 1] 3310 	clr farptr 
      009EA0 CC 91 D7         [ 2] 3311 	ldw x,#app_sign 
      009EA3 CF 00 19         [ 2] 3312 	ldw farptr+1,x
                                   3313 ; initialize local variables 
      009EA6 CD 83 7A         [ 4] 3314 	call prog_size
      009EA9 27 03            [ 2] 3315 	ldw (TOWRITE,sp),x
      009EAB CD 83            [ 1] 3316 	clr (COUNT,sp)
                                   3317 ; first bock 
                                   3318 ; containt signature 2 bytes 
                                   3319 ; and size 	2 bytes 
                                   3320 ; use Y as pointer to block_buffer
      009EAD 81 72 3F         [ 4] 3321 	call clear_block_buffer ; -- y=*block_buffer	
                                   3322 ; write signature
      009EB0 00 19 72         [ 2] 3323 	ldw x,SIGNATURE ; "BC" 
      009EB3 5C 00            [ 2] 3324 	ldw (y),x 
      009EB5 1A 72 C7 00      [ 2] 3325 	addw y,#2
      009EB9 19 81            [ 2] 3326 	ldw x,(TOWRITE,sp)
      009EBB 90 FF            [ 2] 3327 	ldw (y),x
      009EBB AE 00 64 90      [ 2] 3328 	addw y,#2   
      009EBF AE 03            [ 1] 3329 	ld a,#(BLOCK_SIZE-4)
      009EC1 E8 20            [ 1] 3330 	ld (CNT_LO,sp),a 
      009EC3 0D 00 7C         [ 2] 3331 	cpw x,#(BLOCK_SIZE-4) 
      009EC4 22 01            [ 1] 3332 	jrugt 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      009EC4 CD               [ 1] 3333 	ld a,xl 
      009EC5 96 79            [ 1] 3334 3$:	ld (CNT_LO,sp),a   
      009EC7 A1 02 27         [ 2] 3335 	ldw x,txtbgn 
      009ECA 03 CC            [ 2] 3336 	ldw (XTEMP,sp),x 
      0020DD                       3337 32$: 
      009ECC 91 D7            [ 2] 3338 	ldw x,(XTEMP,sp)
      009ECE 7B 04            [ 1] 3339 	ld a,(CNT_LO,sp)
      009ECE 85 90 85         [ 4] 3340 	call fill_write_buffer 
      009ED1 1F 01            [ 2] 3341 	ldw (XTEMP,sp),x 
      009ED1 89 AE F4         [ 2] 3342 	ldw x,#block_buffer
      009ED4 24 65 90         [ 4] 3343 	call write_buffer
      009ED7 A3 7A 12         [ 2] 3344 	ldw x,#BLOCK_SIZE 
      009EDA 2B 01 5C         [ 4] 3345 	call incr_farptr  
                                   3346 ; following blocks 
      009EDD 1E 01            [ 2] 3347 	ldw x,(XTEMP,sp)
      009EDD 9E C7 53         [ 2] 3348 	cpw x,txtend 
      009EE0 0D 9F            [ 1] 3349 	jruge 9$ 
      009EE2 C7 53            [ 2] 3350 	ldw x,(TOWRITE,sp)
      009EE4 0E 8C 56         [ 2] 3351 	subw x,(COUNT,sp)
      009EE7 9E C7            [ 2] 3352 	ldw (TOWRITE,sp),x 
      009EE9 53 0F            [ 1] 3353 	ld a,#BLOCK_SIZE 
      009EEB 9F C7 53         [ 2] 3354 	cpw x,#BLOCK_SIZE 
      009EEE 10 72            [ 1] 3355 	jruge 4$ 
      009EF0 10               [ 1] 3356 	ld a,xl 
      009EF1 53 08            [ 1] 3357 4$:	ld (CNT_LO,sp),a 
      009EF3 72 10 53         [ 4] 3358 	call clear_block_buffer 
      009EF6 00 72            [ 2] 3359 	jra 32$ 
      00210F                       3360 9$:	_drop VSIZE 
      009EF8 10 53            [ 2]    1     addw sp,#VSIZE 
      009EFA 04 85            [ 2] 3361     popw y 
      009EFC CD               [ 2] 3362 	popw x 
      009EFD A2               [ 4] 3363 	ret 
                                   3364 
                                   3365 
      009EFE EF 72                 3366 SIGNATURE: .ascii "BC"
      009F00 11 53 08 72 11 53 00  3367 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE \F before"
             81 61 73 68 20 61 70
             70 6C 69 63 61 74 69
             6F 6E 2C 20 61 6C 72
             65 61 64 79 20 6F 6E
             65 20 69 6E 20 46 4C
             41 53 48 0A 75 73 65
             20 45 52 41 53 45 20
             5C 46 20 62 65 66 6F
             72 65 00
      009F08 4E 6F 20 61 70 70 6C  3368 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
             20 69 6E 20 52 41 4D
             00
                                   3369 
                                   3370 ;---------------------
                                   3371 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3372 ; write 1 or more byte to FLASH or EEPROM
                                   3373 ; starting at address  
                                   3374 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



                                   3375 ;   expr1  	is address 
                                   3376 ;   expr2,...,exprn   are bytes to write
                                   3377 ; output:
                                   3378 ;   none 
                                   3379 ;---------------------
                           000001  3380 	ADDR=1
                           000002  3381 	VSIZ=2 
      00216F                       3382 write:
      00216F                       3383 	_vars VSIZE 
      009F08 CD 96            [ 2]    1     sub sp,#VSIZE 
      009F0A 79 A1 02 27      [ 1] 3384 	clr farptr ; expect 16 bits address 
      009F0E 0B A1 01         [ 4] 3385 	call expression
      009F11 27 03            [ 1] 3386 	cp a,#TK_INTGR 
      009F13 CC 91            [ 1] 3387 	jreq 0$
      009F15 D7 AE 00         [ 2] 3388 	jp syntax_error
      009F18 00 89            [ 2] 3389 0$: ldw (ADDR,sp),x 
      009F1A 1E 03 5D         [ 4] 3390 	call next_token 
      009F1D 27 1A            [ 1] 3391 	cp a,#TK_COMMA 
      009F1F 1E 01            [ 1] 3392 	jreq 1$ 
      009F21 9F A4            [ 2] 3393 	jra 9$ 
      009F23 07 4E C7         [ 4] 3394 1$:	call expression
      009F26 54 01            [ 1] 3395 	cp a,#TK_INTGR
      009F28 72 16            [ 1] 3396 	jreq 2$
      009F2A 50 CA 72         [ 2] 3397 	jp syntax_error
      009F2D 10               [ 1] 3398 2$:	ld a,xl 
      009F2E 54 01            [ 2] 3399 	ldw x,(ADDR,sp) 
      009F30 AE 00 1B         [ 2] 3400 	ldw farptr+1,x 
      009F33 5A               [ 1] 3401 	clrw x 
      009F34 9D 26 FA         [ 4] 3402 	call write_byte
      009F37 20 08            [ 2] 3403 	ldw x,(ADDR,sp)
      009F39 72               [ 1] 3404 	incw x 
      009F3A 11 54            [ 2] 3405 	jra 0$ 
      0021A3                       3406 9$:
      0021A3                       3407 	_drop VSIZE
      009F3C 01 72            [ 2]    1     addw sp,#VSIZE 
      009F3E 17               [ 4] 3408 	ret 
                                   3409 
                                   3410 
                                   3411 ;---------------------
                                   3412 ;BASIC: CHAR(expr)
                                   3413 ; évaluate expression 
                                   3414 ; and take the 7 least 
                                   3415 ; bits as ASCII character
                                   3416 ; return a TK_CHAR 
                                   3417 ;---------------------
      0021A6                       3418 char:
      009F3F 50 CA 5B         [ 4] 3419 	call func_args 
      009F42 04 81            [ 1] 3420 	cp a,#1
      009F44 27 03            [ 1] 3421 	jreq 1$
      009F44 CD 96 74         [ 2] 3422 	jp syntax_error
      009F47 A1               [ 2] 3423 1$:	popw x 
      009F48 01               [ 1] 3424 	ld a,xl 
      009F49 27 03            [ 1] 3425 	and a,#0x7f 
      009F4B CC               [ 1] 3426 	ld xl,a
      009F4C 91 D7            [ 1] 3427 	ld a,#TK_CHAR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      009F4E 85               [ 4] 3428 	ret
                                   3429 
                                   3430 ;---------------------
                                   3431 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3432 ; extract first character 
                                   3433 ; of string argument 
                                   3434 ; return it as TK_INTGR 
                                   3435 ;---------------------
      0021B8                       3436 ascii:
      009F4F A3 00            [ 1] 3437 	ld a,#TK_LPAREN
      009F51 05 23 05         [ 4] 3438 	call expect 
      009F54 A6 0A CC         [ 4] 3439 	call next_token 
      009F57 91 D9            [ 1] 3440 	cp a,#TK_QSTR 
      009F59 9F C7            [ 1] 3441 	jreq 1$
      009F5B 00 0F            [ 1] 3442 	cp a,#TK_CHAR 
      009F5D A6 05            [ 1] 3443 	jreq 2$ 
      009F5F C0 00            [ 1] 3444 	cp a,#TK_CFUNC 
      009F61 0F C7            [ 1] 3445 	jreq 0$
      009F63 54 00 72         [ 2] 3446 	jp syntax_error
      009F66 16               [ 4] 3447 0$: call (x)
      009F67 54 02            [ 2] 3448 	jra 2$
      0021D2                       3449 1$: 
      009F69 72               [ 1] 3450 	ld a,(x) 
      009F6A 10               [ 1] 3451 	clrw x
      009F6B 54               [ 1] 3452 	ld xl,a 
      0021D5                       3453 2$: 
      009F6C 01               [ 2] 3454 	pushw x 
      009F6D 72 0F            [ 1] 3455 	ld a,#TK_RPAREN 
      009F6F 54 00 FB         [ 4] 3456 	call expect
      009F72 CE               [ 2] 3457 	popw x 
      009F73 54 04            [ 1] 3458 	ld a,#TK_INTGR 
      009F75 A6               [ 4] 3459 	ret 
                                   3460 
                                   3461 ;---------------------
                                   3462 ;BASIC: KEY
                                   3463 ; wait for a character 
                                   3464 ; received from STDIN 
                                   3465 ; input:
                                   3466 ;	none 
                                   3467 ; output:
                                   3468 ;	X 		ASCII character 
                                   3469 ;---------------------
      0021DF                       3470 key:
      009F76 84 81 01         [ 4] 3471 	call getc 
      009F78 5F               [ 1] 3472 	clrw x 
      009F78 52               [ 1] 3473 	ld xl,a 
      009F79 01 CD            [ 1] 3474 	ld a,#TK_INTGR
      009F7B 96               [ 4] 3475 	ret
                                   3476 
                                   3477 ;----------------------
                                   3478 ; BASIC: QKEY
                                   3479 ; Return true if there 
                                   3480 ; is a character in 
                                   3481 ; waiting in STDIN 
                                   3482 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



                                   3483 ;  none 
                                   3484 ; output:
                                   3485 ;   X 		0|-1 
                                   3486 ;-----------------------
      0021E7                       3487 qkey:: 
      009F7C 74               [ 1] 3488 	clrw x 
      009F7D A1 01 27         [ 1] 3489 	ld a,rx1_head
      009F80 03 CC 91         [ 1] 3490 	cp a,rx1_tail 
      009F83 D7 85            [ 1] 3491 	jreq 9$ 
      009F85 A3               [ 2] 3492 	cplw x 
      009F86 00 0F            [ 1] 3493 9$: ld a,#TK_INTGR
      009F88 23               [ 4] 3494 	ret 
                                   3495 
                                   3496 ;---------------------
                                   3497 ; BASIC: GPIO(expr,reg)
                                   3498 ; return gpio address 
                                   3499 ; expr {0..8}
                                   3500 ; input:
                                   3501 ;   none 
                                   3502 ; output:
                                   3503 ;   X 		gpio register address
                                   3504 ;----------------------------
                           000003  3505 	PORT=3
                           000001  3506 	REG=1 
                           000004  3507 	VSIZE=4 
      0021F4                       3508 gpio:
      009F89 05 A6 0A         [ 4] 3509 	call func_args 
      009F8C CC 91            [ 1] 3510 	cp a,#2
      009F8E D9 CD            [ 1] 3511 	jreq 1$
      009F90 A4 2D 6B         [ 2] 3512 	jp syntax_error  
      0021FE                       3513 1$:	
      009F93 01 E6            [ 2] 3514 	ldw x,(PORT,sp)
      009F95 01 0D            [ 1] 3515 	jrmi bad_port
      009F97 01 27 05         [ 2] 3516 	cpw x,#9
      009F9A 44 0A            [ 1] 3517 	jrpl bad_port
      009F9C 01 26            [ 1] 3518 	ld a,#5
      009F9E FB               [ 4] 3519 	mul x,a
      009F9F A4 01 5F         [ 2] 3520 	addw x,#GPIO_BASE 
      009FA2 97 A6            [ 2] 3521 	ldw (PORT,sp),x  
      009FA4 84 5B            [ 2] 3522 	ldw x,(REG,sp) 
      009FA6 01 81 03         [ 2] 3523 	addw x,(PORT,sp)
      009FA8 A6 84            [ 1] 3524 	ld a,#TK_INTGR
      002216                       3525 	_drop VSIZE 
      009FA8 52 02            [ 2]    1     addw sp,#VSIZE 
      009FAA CD               [ 4] 3526 	ret
      002219                       3527 bad_port:
      009FAB 96 79            [ 1] 3528 	ld a,#ERR_BAD_VALUE
      009FAD A1 02 27         [ 2] 3529 	jp tb_error
                                   3530 
                                   3531 
                                   3532 ;-------------------------
                                   3533 ; BASIC: UFLASH 
                                   3534 ; return free flash address
                                   3535 ; input:
                                   3536 ;  none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



                                   3537 ; output:
                                   3538 ;	A		TK_INTGR
                                   3539 ;   X 		free address 
                                   3540 ;---------------------------
      00221E                       3541 uflash:
      009FB0 03 CC 91         [ 2] 3542 	ldw x,app_sign
      009FB3 D7 85 9F         [ 2] 3543 	cpw x,#4243 ; signature "BC" 
      009FB6 6B 02            [ 1] 3544 	jreq 1$
      009FB8 85 A3 00         [ 2] 3545 	ldw x,app_size 
      009FBB 0F 23 05         [ 2] 3546 	addw x,#app
      009FBE A6 0A            [ 2] 3547 	jra 2$
      009FC0 CC 91 D9         [ 2] 3548 1$:	ldw x,#app_space 
      009FC3 CD A4            [ 1] 3549 2$:	ld a,#TK_INTGR 
      009FC5 2D               [ 4] 3550 	ret 
                                   3551 
                                   3552 
                                   3553 ;---------------------
                                   3554 ; BASIC: USR(addr[,arg])
                                   3555 ; execute a function written 
                                   3556 ; in binary code.
                                   3557 ; binary fonction should 
                                   3558 ; return token attribute in A 
                                   3559 ; and value in X. 
                                   3560 ; input:
                                   3561 ;   addr	routine address 
                                   3562 ;   arg 	is an optional argument 
                                   3563 ; output:
                                   3564 ;   A 		token attribute 
                                   3565 ;   X       returned value 
                                   3566 ;---------------------
      002234                       3567 usr:
      009FC6 6B 01            [ 2] 3568 	pushw y 	
      009FC8 A6 01 0D         [ 4] 3569 	call func_args 
      009FCB 01 27            [ 1] 3570 	cp a,#1 
      009FCD 05 48            [ 1] 3571 	jreq 2$
      009FCF 0A 01            [ 1] 3572 	cp a,#2
      009FD1 26 FB            [ 1] 3573 	jreq 2$  
      009FD3 0D 02 26         [ 2] 3574 	jp syntax_error 
      009FD6 05 43            [ 2] 3575 2$: popw y  ; arg|addr 
      009FD8 E4 00            [ 1] 3576 	cp a,#1
      009FDA 20 02            [ 1] 3577 	jreq 3$
      009FDC EA               [ 2] 3578 	popw x ; addr
      009FDD 00               [ 1] 3579 	exgw x,y 
      009FDE E7 00            [ 4] 3580 3$: call (y)
      009FE0 5B 02            [ 2] 3581 	popw y 
      009FE2 81               [ 4] 3582 	ret 
                                   3583 
                                   3584 ;------------------------------
                                   3585 ; BASIC: BYE 
                                   3586 ; halt mcu in its lowest power mode 
                                   3587 ; wait for reset or external interrupt
                                   3588 ; do a cold start on wakeup.
                                   3589 ;------------------------------
      009FE3                       3590 bye:
      009FE3 72 00 00 22 02   [ 2] 3591 	btjf UART1_SR,#UART_SR_TC,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      009FE8 4F               [10] 3592 	halt
      009FE9 81 0E D1         [ 2] 3593 	jp cold_start  
                                   3594 
                                   3595 ;----------------------------------
                                   3596 ; BASIC: SLEEP 
                                   3597 ; halt mcu until reset or external
                                   3598 ; interrupt.
                                   3599 ; Resume progam after SLEEP command
                                   3600 ;----------------------------------
      009FEA                       3601 sleep:
      009FEA AE A0 11 CD 83   [ 2] 3602 	btjf UART1_SR,#UART_SR_TC,.
      009FEF CE 5B 02 52      [ 1] 3603 	bset flags,#FSLEEP
      009FF3 04               [10] 3604 	halt 
      009FF4 CD               [ 4] 3605 	ret 
                                   3606 
                                   3607 ;-------------------------------
                                   3608 ; BASIC: PAUSE expr 
                                   3609 ; suspend execution for n msec.
                                   3610 ; input:
                                   3611 ;	none
                                   3612 ; output:
                                   3613 ;	none 
                                   3614 ;------------------------------
      002265                       3615 pause:
      009FF5 9A C2 AE         [ 4] 3616 	call expression
      009FF8 16 90            [ 1] 3617 	cp a,#TK_INTGR
      009FFA CF 00            [ 1] 3618 	jreq pause02 
      009FFC 05 7F 72         [ 2] 3619 	jp syntax_error
      00226F                       3620 pause02: 
      009FFF 5F               [ 2] 3621 1$: tnzw x 
      00A000 00 04            [ 1] 3622 	jreq 2$
      00A002 5F               [10] 3623 	wfi 
      00A003 CF               [ 2] 3624 	decw x 
      00A004 00 01            [ 1] 3625 	jrne 1$
      00A006 72               [ 1] 3626 2$:	clr a 
      00A007 11               [ 4] 3627 	ret 
                                   3628 
                                   3629 ;------------------------------
                                   3630 ; BASIC: AWU expr
                                   3631 ; halt mcu for 'expr' milliseconds
                                   3632 ; use Auto wakeup peripheral
                                   3633 ; all oscillators stopped except LSI
                                   3634 ; range: 1ms - 511ms
                                   3635 ; input:
                                   3636 ;  none
                                   3637 ; output:
                                   3638 ;  none:
                                   3639 ;------------------------------
      002278                       3640 awu:
      00A008 00 22 72         [ 4] 3641   call expression
      00A00B 18 00            [ 1] 3642   cp a,#TK_INTGR
      00A00D 22 CC            [ 1] 3643   jreq awu02
      00A00F 92 7A 0A         [ 2] 3644   jp syntax_error
      002282                       3645 awu02:
      00A012 62 72 65         [ 2] 3646   cpw x,#5120
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      00A015 61 6B            [ 1] 3647   jrmi 1$ 
      00A017 20 70 6F 69      [ 1] 3648   mov AWU_TBR,#15 
      00A01B 6E 74            [ 1] 3649   ld a,#30
      00A01D 2C               [ 2] 3650   div x,a
      00A01E 20 52            [ 1] 3651   ld a,#16
      00A020 55               [ 2] 3652   div x,a 
      00A021 4E 20            [ 2] 3653   jra 4$
      002293                       3654 1$: 
      00A023 74 6F 20         [ 2] 3655   cpw x,#2048
      00A026 72 65            [ 1] 3656   jrmi 2$ 
      00A028 73 75 6D 65      [ 1] 3657   mov AWU_TBR,#14
      00A02C 2E 0A            [ 1] 3658   ld a,#80
      00A02E 00               [ 2] 3659   div x,a 
      00A02F 20 10            [ 2] 3660   jra 4$   
      0022A1                       3661 2$:
      00A02F 72 01 00 22      [ 1] 3662   mov AWU_TBR,#7
      0022A5                       3663 3$:  
                                   3664 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A033 01 81 40         [ 2] 3665   cpw x,#64 
      00A035 23 07            [ 2] 3666   jrule 4$ 
      00A035 CD 90 3F 81      [ 1] 3667   inc AWU_TBR 
      00A039 54               [ 2] 3668   srlw x 
      00A039 A6 7F            [ 2] 3669   jra 3$ 
      0022B1                       3670 4$:
      00A03B C4               [ 1] 3671   ld a, xl
      00A03C 00               [ 1] 3672   dec a 
      00A03D 1A 27            [ 1] 3673   jreq 5$
      00A03F 13               [ 1] 3674   dec a 	
      0022B6                       3675 5$: 
      00A040 CE 00            [ 1] 3676   and a,#0x3e 
      00A042 19 1C 00         [ 1] 3677   ld AWU_APR,a 
      00A045 80 24 04 72      [ 1] 3678   bset AWU_CSR,#AWU_CSR_AWUEN
      00A049 5C               [10] 3679   halt 
                                   3680 
      00A04A 00               [ 4] 3681   ret 
                                   3682 
                                   3683 ;------------------------------
                                   3684 ; BASIC: TICKS
                                   3685 ; return msec ticks counter value 
                                   3686 ; input:
                                   3687 ; 	none 
                                   3688 ; output:
                                   3689 ;	X 		TK_INTGR
                                   3690 ;-------------------------------
      0022C1                       3691 get_ticks:
      00A04B 18 9F A4         [ 2] 3692 	ldw x,ticks 
      00A04E 80 97            [ 1] 3693 	ld a,#TK_INTGR
      00A050 CF               [ 4] 3694 	ret 
                                   3695 
                                   3696 
                                   3697 
                                   3698 ;------------------------------
                                   3699 ; BASIC: ABS(expr)
                                   3700 ; return absolute value of expr.
                                   3701 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



                                   3702 ;   none
                                   3703 ; output:
                                   3704 ;   X     	positive integer
                                   3705 ;-------------------------------
      0022C7                       3706 abs:
      00A051 00 19 81         [ 4] 3707 	call func_args 
      00A054 A1 01            [ 1] 3708 	cp a,#1 
      00A054 72 BB            [ 1] 3709 	jreq 0$ 
      00A056 00 19 24         [ 2] 3710 	jp syntax_error
      0022D1                       3711 0$:  
      00A059 04               [ 2] 3712     popw x   
      00A05A 72               [ 1] 3713 	ld a,xh 
      00A05B 5C 00            [ 1] 3714 	bcp a,#0x80 
      00A05D 18 CF            [ 1] 3715 	jreq 2$ 
      00A05F 00               [ 2] 3716 	negw x 
      00A060 19 81            [ 1] 3717 2$: ld a,#TK_INTGR 
      00A062 81               [ 4] 3718 	ret 
                                   3719 
                                   3720 ;------------------------------
                                   3721 ; BASIC: AND(expr1,expr2)
                                   3722 ; Apply bit AND relation between
                                   3723 ; the 2 arguments, i.e expr1 & expr2 
                                   3724 ; output:
                                   3725 ; 	A 		TK_INTGR
                                   3726 ;   X 		result 
                                   3727 ;------------------------------
      0022DB                       3728 bit_and:
      00A062 5F 92 AF         [ 4] 3729 	call func_args 
      00A065 00 18            [ 1] 3730 	cp a,#2
      00A067 26 06            [ 1] 3731 	jreq 1$
      00A069 5C A3 00         [ 2] 3732 	jp syntax_error 
      00A06C 80               [ 2] 3733 1$:	popw x 
      00A06D 25               [ 1] 3734 	ld a,xh 
      00A06E F4 81            [ 1] 3735 	and a,(1,sp)
      00A070 95               [ 1] 3736 	ld xh,a 
      00A070 72               [ 1] 3737 	ld a,xl
      00A071 5F 00            [ 1] 3738 	and a,(2,sp)
      00A073 18               [ 1] 3739 	ld xl,a 
      0022EE                       3740 	_drop 2 
      00A074 52 03            [ 2]    1     addw sp,#2 
      00A076 CD 92            [ 1] 3741 	ld a,#TK_INTGR
      00A078 CF               [ 4] 3742 	ret
                                   3743 
                                   3744 ;------------------------------
                                   3745 ; BASIC: OR(expr1,expr2)
                                   3746 ; Apply bit OR relation between
                                   3747 ; the 2 arguments, i.e expr1 | expr2 
                                   3748 ; output:
                                   3749 ; 	A 		TK_INTGR
                                   3750 ;   X 		result 
                                   3751 ;------------------------------
      0022F3                       3752 bit_or:
      00A079 A1 03 27         [ 4] 3753 	call func_args 
      00A07C 03 CC            [ 1] 3754 	cp a,#2
      00A07E 91 D7            [ 1] 3755 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      00A080 9F A4 DF         [ 2] 3756 	jp syntax_error 
      0022FD                       3757 1$: 
      00A083 A1               [ 2] 3758 	popw x 
      00A084 45               [ 1] 3759 	ld a,xh 
      00A085 26 0C            [ 1] 3760 	or a,(1,sp)
      00A087 AE               [ 1] 3761 	ld xh,a 
      00A088 40               [ 1] 3762 	ld a,xl 
      00A089 00 CF            [ 1] 3763 	or a,(2,sp)
      00A08B 00               [ 1] 3764 	ld xl,a 
      002306                       3765 	_drop 2 
      00A08C 19 AE            [ 2]    1     addw sp,#2 
      00A08E 47 FF            [ 1] 3766 	ld a,#TK_INTGR 
      00A090 4F               [ 4] 3767 	ret
                                   3768 
                                   3769 ;------------------------------
                                   3770 ; BASIC: XOR(expr1,expr2)
                                   3771 ; Apply bit XOR relation between
                                   3772 ; the 2 arguments, i.e expr1 ^ expr2 
                                   3773 ; output:
                                   3774 ; 	A 		TK_INTGR
                                   3775 ;   X 		result 
                                   3776 ;------------------------------
      00230B                       3777 bit_xor:
      00A091 20 15 A1         [ 4] 3778 	call func_args 
      00A094 46 27            [ 1] 3779 	cp a,#2
      00A096 06 AE            [ 1] 3780 	jreq 1$
      00A098 91 21 CC         [ 2] 3781 	jp syntax_error 
      002315                       3782 1$: 
      00A09B 91               [ 2] 3783 	popw x 
      00A09C D9               [ 1] 3784 	ld a,xh 
      00A09D 18 01            [ 1] 3785 	xor a,(1,sp)
      00A09D AE               [ 1] 3786 	ld xh,a 
      00A09E AC               [ 1] 3787 	ld a,xl 
      00A09F 80 CF            [ 1] 3788 	xor a,(2,sp)
      00A0A1 00               [ 1] 3789 	ld xl,a 
      00231E                       3790 	_drop 2 
      00A0A2 19 A6            [ 2]    1     addw sp,#2 
      00A0A4 02 AE            [ 1] 3791 	ld a,#TK_INTGR 
      00A0A6 7F               [ 4] 3792 	ret 
                                   3793 
                                   3794 ;------------------------------
                                   3795 ; BASIC: LSHIFT(expr1,expr2)
                                   3796 ; logical shift left expr1 by 
                                   3797 ; expr2 bits 
                                   3798 ; output:
                                   3799 ; 	A 		TK_INTGR
                                   3800 ;   X 		result 
                                   3801 ;------------------------------
      002323                       3802 lshift:
      00A0A7 FF 15 F4         [ 4] 3803 	call func_args
      00A0A8 A1 02            [ 1] 3804 	cp a,#2 
      00A0A8 6B 01            [ 1] 3805 	jreq 1$
      00A0AA 1F 02 CD         [ 2] 3806 	jp syntax_error
      00A0AD 81 91            [ 2] 3807 1$: popw y   
      00A0AF 85               [ 2] 3808 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      00A0AF CD A0            [ 2] 3809 	tnzw y 
      00A0B1 62 27            [ 1] 3810 	jreq 4$
      00A0B3 08               [ 2] 3811 2$:	sllw x 
      00A0B4 A6 45            [ 2] 3812 	decw y 
      00A0B6 CD 83            [ 1] 3813 	jrne 2$
      002339                       3814 4$:  
      00A0B8 71 CD            [ 1] 3815 	ld a,#TK_INTGR
      00A0BA 82               [ 4] 3816 	ret
                                   3817 
                                   3818 ;------------------------------
                                   3819 ; BASIC: RSHIFT(expr1,expr2)
                                   3820 ; logical shift right expr1 by 
                                   3821 ; expr2 bits.
                                   3822 ; output:
                                   3823 ; 	A 		TK_INTGR
                                   3824 ;   X 		result 
                                   3825 ;------------------------------
      00233C                       3826 rshift:
      00A0BB 0F AE 00         [ 4] 3827 	call func_args
      00A0BE 80 CD            [ 1] 3828 	cp a,#2 
      00A0C0 A0 54            [ 1] 3829 	jreq 1$
      00A0C2 7B 01 1E         [ 2] 3830 	jp syntax_error
      00A0C5 02 72            [ 2] 3831 1$: popw y  
      00A0C7 B0               [ 2] 3832 	popw x
      00A0C8 00 19            [ 2] 3833 	tnzw y 
      00A0CA C2 00            [ 1] 3834 	jreq 4$
      00A0CC 18               [ 2] 3835 2$:	srlw x 
      00A0CD 22 E0            [ 2] 3836 	decw y 
      00A0CF CD 90            [ 1] 3837 	jrne 2$
      002352                       3838 4$:  
      00A0D1 3F 5B            [ 1] 3839 	ld a,#TK_INTGR
      00A0D3 03               [ 4] 3840 	ret
                                   3841 
                                   3842 ;--------------------------
                                   3843 ; BASIC: FCPU integer
                                   3844 ; set CPU frequency 
                                   3845 ;-------------------------- 
                                   3846 
      002355                       3847 fcpu:
      00A0D4 81 84            [ 1] 3848 	ld a,#TK_INTGR
      00A0D5 CD 15 E7         [ 4] 3849 	call expect 
      00A0D5 CE               [ 1] 3850 	ld a,xl 
      00A0D6 AC 80            [ 1] 3851 	and a,#7 
      00A0D8 C3 A1 95         [ 1] 3852 	ld CLK_CKDIVR,a 
      00A0DB 81               [ 4] 3853 	ret 
                                   3854 
                                   3855 ;------------------------------
                                   3856 ; BASIC: PMODE pin#, mode 
                                   3857 ; Arduino pin. 
                                   3858 ; define pin as input or output
                                   3859 ; pin#: {0..15}
                                   3860 ; mode: INPUT|OUTPUT  
                                   3861 ;------------------------------
                           000001  3862 	PINNO=1
                           000001  3863 	VSIZE=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      00A0DC                       3864 pin_mode:
      002361                       3865 	_vars VSIZE 
      00A0DC 88 4D            [ 2]    1     sub sp,#VSIZE 
      00A0DE 27 0A F6         [ 4] 3866 	call arg_list 
      00A0E1 5C 90            [ 1] 3867 	cp a,#2 
      00A0E3 F7 90            [ 1] 3868 	jreq 1$
      00A0E5 5C 0A 01         [ 2] 3869 	jp syntax_error 
      00A0E8 26 F6            [ 2] 3870 1$: popw y ; mode 
      00A0EA 84               [ 2] 3871 	popw x ; Dx pin 
      00A0EB 81 23 AD         [ 4] 3872 	call select_pin 
      00A0EC 6B 01            [ 1] 3873 	ld (PINNO,sp),a  
      00A0EC 88 90            [ 1] 3874 	ld a,#1 
      00A0EE AE 16            [ 1] 3875 	tnz (PINNO,sp)
      00A0F0 E0 90            [ 1] 3876 	jreq 4$
      00A0F2 89               [ 1] 3877 2$:	sll a 
      00A0F3 A6 80            [ 1] 3878 	dec (PINNO,sp)
      00A0F5 90 7F            [ 1] 3879 	jrne 2$ 
      00A0F7 90 5C            [ 1] 3880 	ld (PINNO,sp),a
      00A0F9 4A 26            [ 1] 3881 	ld a,(PINNO,sp)
      00A0FB F9 90            [ 1] 3882 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A0FD 85 84            [ 1] 3883 	ld (GPIO_CR1,x),a 
      00A0FF 81 A3 00 01      [ 2] 3884 4$:	cpw y,#OUTP 
      00A100 27 10            [ 1] 3885 	jreq 6$
                                   3886 ; input mode
                                   3887 ; disable external interrupt 
      00A100 89 90            [ 1] 3888 	ld a,(PINNO,sp)
      00A102 89               [ 1] 3889 	cpl a 
      00A103 52 06            [ 1] 3890 	and a,(GPIO_CR2,x)
      00A105 CD A0            [ 1] 3891 	ld (GPIO_CR2,x),a 
                                   3892 ;clear bit in DDR for input mode 
      00A107 D5 26            [ 1] 3893 	ld a,(PINNO,sp)
      00A109 09               [ 1] 3894 	cpl a 
      00A10A AE A1            [ 1] 3895 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A10C 97 CD            [ 1] 3896 	ld (GPIO_DDR,x),a 
      00A10E 83 CE            [ 2] 3897 	jra 9$
      00239E                       3898 6$: ;output mode  
      00A110 CC A1            [ 1] 3899 	ld a,(PINNO,sp)
      00A112 8F 02            [ 1] 3900 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A113 E7 02            [ 1] 3901 	ld (GPIO_DDR,x),a 
      00A113 CE 00            [ 1] 3902 	ld a,(PINNO,sp)
      00A115 1B C3            [ 1] 3903 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A117 00 1D            [ 1] 3904 	ld (GPIO_CR2,x),a 
      0023AA                       3905 9$:	
      0023AA                       3906 	_drop VSIZE 
      00A119 25 09            [ 2]    1     addw sp,#VSIZE 
      00A11B AE               [ 4] 3907 	ret
                                   3908 
                                   3909 ;------------------------
                                   3910 ; select Arduino pin 
                                   3911 ; input:
                                   3912 ;   X 	 {0..15} Arduino Dx 
                                   3913 ; output:
                                   3914 ;   A     stm8s208 pin 
                                   3915 ;   X     base address s208 GPIO port 
                                   3916 ;---------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      0023AD                       3917 select_pin:
      00A11C A1               [ 2] 3918 	sllw x 
      00A11D D9 CD 83         [ 2] 3919 	addw x,#arduino_to_8s208 
      00A120 CE               [ 2] 3920 	ldw x,(x)
      00A121 CC               [ 1] 3921 	ld a,xl 
      00A122 A1               [ 1] 3922 	push a 
      00A123 8F               [ 1] 3923 	swapw x 
      00A124 A6 05            [ 1] 3924 	ld a,#5 
      00A124 CD               [ 4] 3925 	mul x,a 
      00A125 81 D1 72         [ 2] 3926 	addw x,#GPIO_BASE 
      00A128 5F               [ 1] 3927 	pop a 
      00A129 00               [ 4] 3928 	ret 
                                   3929 ; translation from Arduino D0..D15 to stm8s208rb 
      0023BD                       3930 arduino_to_8s208:
      00A12A 18 AE                 3931 .byte 3,6 ; D0 
      00A12C AC 80                 3932 .byte 3,5 ; D1 
      00A12E CF 00                 3933 .byte 4,0 ; D2 
      00A130 19 CD                 3934 .byte 2,1 ; D3
      00A132 98 DF                 3935 .byte 6,0 ; D4
      00A134 1F 05                 3936 .byte 2,2 ; D5
      00A136 0F 03                 3937 .byte 2,3 ; D6
      00A138 CD A0                 3938 .byte 3,1 ; D7
      00A13A EC CE                 3939 .byte 3,3 ; D8
      00A13C A1 95                 3940 .byte 2,4 ; D9
      00A13E 90 FF                 3941 .byte 4,5 ; D10
      00A140 72 A9                 3942 .byte 2,6 ; D11
      00A142 00 02                 3943 .byte 2,7 ; D12
      00A144 1E 05                 3944 .byte 2,5 ; D13
      00A146 90 FF                 3945 .byte 4,2 ; D14
      00A148 72 A9                 3946 .byte 4,1 ; D15
                                   3947 
                                   3948 
                                   3949 ;------------------------------
                                   3950 ; BASIC: RND(expr)
                                   3951 ; return random number 
                                   3952 ; between 1 and expr inclusive
                                   3953 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   3954 ; input:
                                   3955 ; 	none 
                                   3956 ; output:
                                   3957 ;	X 		random positive integer 
                                   3958 ;------------------------------
      0023DD                       3959 random:
      00A14A 00 02 A6         [ 4] 3960 	call func_args 
      00A14D 7C 6B            [ 1] 3961 	cp a,#1
      00A14F 04 A3            [ 1] 3962 	jreq 1$
      00A151 00 7C 22         [ 2] 3963 	jp syntax_error
      0023E7                       3964 1$:  
      00A154 01 9F            [ 1] 3965 	ld a,#0x80 
      00A156 6B 04            [ 1] 3966 	bcp a,(1,sp)
      00A158 CE 00            [ 1] 3967 	jreq 2$
      00A15A 1B 1F            [ 1] 3968 	ld a,#ERR_BAD_VALUE
      00A15C 01 11 59         [ 2] 3969 	jp tb_error
      00A15D                       3970 2$: 
                                   3971 ; acc16=(x<<5)^x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      00A15D 1E 01 7B         [ 2] 3972 	ldw x,seedx 
      00A160 04               [ 2] 3973 	sllw x 
      00A161 CD               [ 2] 3974 	sllw x 
      00A162 A0               [ 2] 3975 	sllw x 
      00A163 DC               [ 2] 3976 	sllw x 
      00A164 1F               [ 2] 3977 	sllw x 
      00A165 01               [ 1] 3978 	ld a,xh 
      00A166 AE 16 E0         [ 1] 3979 	xor a,seedx 
      00A169 CD 81 EB         [ 1] 3980 	ld acc16,a 
      00A16C AE               [ 1] 3981 	ld a,xl 
      00A16D 00 80 CD         [ 1] 3982 	xor a,seedx+1 
      00A170 A0 54 1E         [ 1] 3983 	ld acc8,a 
                                   3984 ; seedx=seedy 
      00A173 01 C3 00         [ 2] 3985 	ldw x,seedy 
      00A176 1D 24 16         [ 2] 3986 	ldw seedx,x  
                                   3987 ; seedy=seedy^(seedy>>1)
      00A179 1E 05            [ 2] 3988 	srlw y 
      00A17B 72 F0            [ 1] 3989 	ld a,yh 
      00A17D 03 1F 05         [ 1] 3990 	xor a,seedy 
      00A180 A6 80 A3         [ 1] 3991 	ld seedy,a  
      00A183 00 80            [ 1] 3992 	ld a,yl 
      00A185 24 01 9F         [ 1] 3993 	xor a,seedy+1 
      00A188 6B 04 CD         [ 1] 3994 	ld seedy+1,a 
                                   3995 ; acc16>>3 
      00A18B A0 EC 20         [ 2] 3996 	ldw x,acc16 
      00A18E CE               [ 2] 3997 	srlw x 
      00A18F 5B               [ 2] 3998 	srlw x 
      00A190 06               [ 2] 3999 	srlw x 
                                   4000 ; x=acc16^x 
      00A191 90               [ 1] 4001 	ld a,xh 
      00A192 85 85 81         [ 1] 4002 	xor a,acc16 
      00A195 42               [ 1] 4003 	ld xh,a 
      00A196 43               [ 1] 4004 	ld a,xl 
      00A197 43 61 6E         [ 1] 4005 	xor a,acc8 
      00A19A 27               [ 1] 4006 	ld xl,a 
                                   4007 ; seedy=x^seedy 
      00A19B 74 20 66         [ 1] 4008 	xor a,seedy+1
      00A19E 6C               [ 1] 4009 	ld xl,a 
      00A19F 61               [ 1] 4010 	ld a,xh 
      00A1A0 73 68 20         [ 1] 4011 	xor a,seedy
      00A1A3 61               [ 1] 4012 	ld xh,a 
      00A1A4 70 70 6C         [ 2] 4013 	ldw seedy,x 
                                   4014 ; return seedy modulo expr + 1 
      00A1A7 69 63            [ 2] 4015 	popw y 
      00A1A9 61               [ 2] 4016 	divw x,y 
      00A1AA 74               [ 1] 4017 	ldw x,y 
      00A1AB 69               [ 1] 4018 	incw x 
      002441                       4019 10$:
      00A1AC 6F 6E            [ 1] 4020 	ld a,#TK_INTGR
      00A1AE 2C               [ 4] 4021 	ret 
                                   4022 
                                   4023 ;---------------------------------
                                   4024 ; BASIC: WORDS 
                                   4025 ; affiche la listes des mots du
                                   4026 ; dictionnaire ainsi que le nombre
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



                                   4027 ; de mots.
                                   4028 ;---------------------------------
                           000001  4029 	WLEN=1 ; word length
                           000002  4030 	LLEN=2 ; character sent to console
                           000003  4031 	WCNT=3 ; count words printed 
                           000003  4032 	VSIZE=3 
      002444                       4033 words:
      002444                       4034 	_vars VSIZE
      00A1AF 20 61            [ 2]    1     sub sp,#VSIZE 
      00A1B1 6C 72            [ 1] 4035 	clr (LLEN,sp)
      00A1B3 65 61            [ 1] 4036 	clr (WCNT,sp)
      00A1B5 64 79 20 6F      [ 2] 4037 	ldw y,#kword_dict+2
      00A1B9 6E               [ 1] 4038 0$:	ldw x,y
      00A1BA 65               [ 1] 4039 	ld a,(x)
      00A1BB 20 69            [ 1] 4040 	and a,#15 
      00A1BD 6E 20            [ 1] 4041 	ld (WLEN,sp),a 
      00A1BF 46 4C            [ 1] 4042 	inc (WCNT,sp)
      00A1C1 41               [ 1] 4043 1$:	incw x 
      00A1C2 53               [ 1] 4044 	ld a,(x)
      00A1C3 48 0A 75         [ 4] 4045 	call putc 
      00A1C6 73 65            [ 1] 4046 	inc (LLEN,sp)
      00A1C8 20 45            [ 1] 4047 	dec (WLEN,sp)
      00A1CA 52 41            [ 1] 4048 	jrne 1$
      00A1CC 53 45            [ 1] 4049 	ld a,#70
      00A1CE 20 5C            [ 1] 4050 	cp a,(LLEN,sp)
      00A1D0 46 20            [ 1] 4051 	jrmi 2$   
      00A1D2 62 65            [ 1] 4052 	ld a,#SPACE 
      00A1D4 66 6F 72         [ 4] 4053 	call putc 
      00A1D7 65 00            [ 1] 4054 	inc (LLEN,sp) 
      00A1D9 4E 6F            [ 2] 4055 	jra 3$
      00A1DB 20 61            [ 1] 4056 2$: ld a,#CR 
      00A1DD 70 70 6C         [ 4] 4057 	call putc 
      00A1E0 69 63            [ 1] 4058 	clr (LLEN,sp)
      00A1E2 61 74 69 6F      [ 2] 4059 3$:	subw y,#2 
      00A1E6 6E 20            [ 2] 4060 	ldw y,(y)
      00A1E8 69 6E            [ 1] 4061 	jrne 0$ 
      00A1EA 20 52            [ 1] 4062 	ld a,#CR 
      00A1EC 41 4D 00         [ 4] 4063 	call putc  
      00A1EF 5F               [ 1] 4064 	clrw x 
      00A1EF 52 06            [ 1] 4065 	ld a,(WCNT,sp)
      00A1F1 72               [ 1] 4066 	ld xl,a 
      00A1F2 5F 00 18         [ 4] 4067 	call print_int 
      00A1F5 CD 97 78         [ 2] 4068 	ldw x,#words_count_msg
      00A1F8 A1 84 27         [ 4] 4069 	call puts 
      002491                       4070 	_drop VSIZE 
      00A1FB 03 CC            [ 2]    1     addw sp,#VSIZE 
      00A1FD 91               [ 4] 4071 	ret 
      00A1FE D7 1F 01 CD 92 CF A1  4072 words_count_msg: .asciz " words in dictionary\n"
             09 27 02 20 19 CD 97
             78 A1 84 27 03 CC 91
             D7
                                   4073 
                                   4074 
                                   4075 ;-----------------------------
                                   4076 ; BASIC: TIMER expr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



                                   4077 ; initialize count down timer 
                                   4078 ;-----------------------------
      0024AA                       4079 set_timer:
      00A214 9F 1E 01         [ 4] 4080 	call arg_list
      00A217 CF 00            [ 1] 4081 	cp a,#1 
      00A219 19 5F            [ 1] 4082 	jreq 1$
      00A21B CD 82 30         [ 2] 4083 	jp syntax_error
      0024B4                       4084 1$: 
      00A21E 1E               [ 2] 4085 	popw x 
      00A21F 01 5C 20         [ 2] 4086 	ldw timer,x 
      00A222 DC               [ 4] 4087 	ret 
                                   4088 
                                   4089 ;------------------------------
                                   4090 ; BASIC: TIMEOUT 
                                   4091 ; return state of timer 
                                   4092 ;------------------------------
      00A223                       4093 timeout:
      00A223 5B 06 81         [ 2] 4094 	ldw x,timer 
      00A226                       4095 logical_complement:
      00A226 CD               [ 2] 4096 	cplw x 
      00A227 96 74 A1         [ 2] 4097 	cpw x,#-1
      00A22A 01 27            [ 1] 4098 	jreq 2$
      00A22C 03               [ 1] 4099 	clrw x 
      00A22D CC 91            [ 1] 4100 2$:	ld a,#TK_INTGR
      00A22F D7               [ 4] 4101 	ret 
                                   4102 
                                   4103 ;--------------------------------
                                   4104 ; BASIC NOT(expr) 
                                   4105 ; return logical complement of expr
                                   4106 ;--------------------------------
      0024C6                       4107 func_not:
      00A230 85 9F A4         [ 4] 4108 	call func_args  
      00A233 7F 97            [ 1] 4109 	cp a,#1
      00A235 A6 03            [ 1] 4110 	jreq 1$
      00A237 81 11 57         [ 2] 4111 	jp syntax_error
      00A238 85               [ 2] 4112 1$:	popw x 
      00A238 A6 07            [ 2] 4113 	jra logical_complement
                                   4114 
                                   4115 
                                   4116 
                                   4117 ;-----------------------------------
                                   4118 ; BASIC: IWDGEN expr1 
                                   4119 ; enable independant watchdog timer
                                   4120 ; expr1 is delay in multiple of 62.5µsec
                                   4121 ; expr1 -> {1..16383}
                                   4122 ;-----------------------------------
      0024D3                       4123 enable_iwdg:
      00A23A CD 96 67         [ 4] 4124 	call arg_list
      00A23D CD 92            [ 1] 4125 	cp a,#1 
      00A23F CF A1            [ 1] 4126 	jreq 1$
      00A241 02 27 0E         [ 2] 4127 	jp syntax_error 
      00A244 A1               [ 2] 4128 1$: popw x 
      00A245 03 27            [ 1] 4129 	push #0
      00A247 0D A1 82 27      [ 1] 4130 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A24B 03               [ 1] 4131 	ld a,xh 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      00A24C CC 91            [ 1] 4132 	and a,#0x3f
      00A24E D7               [ 1] 4133 	ld xh,a  
      00A24F FD 20 03         [ 2] 4134 2$:	cpw x,#255
      00A252 23 06            [ 2] 4135 	jrule 3$
      00A252 F6 5F            [ 1] 4136 	inc (1,sp)
      00A254 97               [ 1] 4137 	rcf 
      00A255 56               [ 2] 4138 	rrcw x 
      00A255 89 A6            [ 2] 4139 	jra 2$
      00A257 08 CD 96 67      [ 1] 4140 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A25B 85               [ 1] 4141 	pop a  
      00A25C A6 84 81         [ 1] 4142 	ld IWDG_PR,a 
      00A25F 9F               [ 1] 4143 	ld a,xl
      00A25F CD               [ 1] 4144 	dec a 
      00A260 83 81 5F 97      [ 1] 4145 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A264 A6 84 81         [ 1] 4146 	ld IWDG_RLR,a 
      00A267 35 AA 50 E0      [ 1] 4147 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A267 5F               [ 4] 4148 	ret 
                                   4149 
                                   4150 
                                   4151 ;-----------------------------------
                                   4152 ; BASIC: IWDGREF  
                                   4153 ; refresh independant watchdog count down 
                                   4154 ; timer before it reset MCU. 
                                   4155 ;-----------------------------------
      002509                       4156 refresh_iwdg:
      00A268 C6 00 2C C1      [ 1] 4157 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A26C 00               [ 4] 4158 	ret 
                                   4159 
                                   4160 
                                   4161 ;-------------------------------------
                                   4162 ; BASIC: LOG(expr)
                                   4163 ; return logarithm base 2 of expr 
                                   4164 ; this is the position of most significant
                                   4165 ; bit set. 
                                   4166 ; input: 
                                   4167 ; output:
                                   4168 ;   X     log2 
                                   4169 ;   A     TK_INTGR 
                                   4170 ;*********************************
      00250E                       4171 log2:
      00A26D 2D 27 01         [ 4] 4172 	call func_args 
      00A270 53 A6            [ 1] 4173 	cp a,#1 
      00A272 84 81            [ 1] 4174 	jreq 1$
      00A274 CC 11 57         [ 2] 4175 	jp syntax_error 
      00A274 CD               [ 2] 4176 1$: popw x 
      002519                       4177 leading_one:
      00A275 96               [ 2] 4178 	tnzw x 
      00A276 74 A1            [ 1] 4179 	jreq 4$
      00A278 02 27            [ 1] 4180 	ld a,#15 
      00A27A 03               [ 2] 4181 2$: rlcw x 
      00A27B CC 91            [ 1] 4182     jrc 3$
      00A27D D7               [ 1] 4183 	dec a 
      00A27E 20 FA            [ 2] 4184 	jra 2$
      00A27E 1E               [ 1] 4185 3$: clrw x 
      00A27F 03               [ 1] 4186     ld xl,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      00A280 2B 17            [ 1] 4187 4$:	ld a,#TK_INTGR
      00A282 A3               [ 4] 4188 	ret 
                                   4189 
                                   4190 ;-----------------------------------
                                   4191 ; BASIC: BIT(expr) 
                                   4192 ; expr ->{0..15}
                                   4193 ; return 2^expr 
                                   4194 ; output:
                                   4195 ;    x    2^expr 
                                   4196 ;-----------------------------------
      002529                       4197 bitmask:
      00A283 00 09 2A         [ 4] 4198     call func_args 
      00A286 12 A6            [ 1] 4199 	cp a,#1
      00A288 05 42            [ 1] 4200 	jreq 1$
      00A28A 1C 50 00         [ 2] 4201 	jp syntax_error 
      00A28D 1F               [ 2] 4202 1$: popw x 
      00A28E 03               [ 1] 4203 	ld a,xl 
      00A28F 1E 01            [ 1] 4204 	and a,#15
      00A291 72               [ 1] 4205 	clrw x 
      00A292 FB               [ 1] 4206 	incw x 
      00A293 03               [ 1] 4207 2$: tnz a 
      00A294 A6 84            [ 1] 4208 	jreq 3$
      00A296 5B               [ 2] 4209 	slaw x 
      00A297 04               [ 1] 4210 	dec a 
      00A298 81 F9            [ 2] 4211 	jra 2$ 
      00A299 A6 84            [ 1] 4212 3$: ld a,#TK_INTGR
      00A299 A6               [ 4] 4213 	ret 
                                   4214 
                                   4215 ;------------------------------
                                   4216 ; BASIC: INVERT(expr)
                                   4217 ; 1's complement 
                                   4218 ;--------------------------------
      002543                       4219 invert:
      00A29A 0A CC 91         [ 4] 4220 	call func_args
      00A29D D9 01            [ 1] 4221 	cp a,#1 
      00A29E 27 03            [ 1] 4222 	jreq 1$
      00A29E CE AC 80         [ 2] 4223 	jp syntax_error
      00A2A1 A3               [ 2] 4224 1$: popw x  
      00A2A2 10               [ 2] 4225 	cplw x 
      00A2A3 93 27            [ 1] 4226 	ld a,#TK_INTGR 
      00A2A5 08               [ 4] 4227 	ret 
                                   4228 
                                   4229 ;------------------------------
                                   4230 ; BASIC: DO 
                                   4231 ; initiate a DO ... UNTIL loop 
                                   4232 ;------------------------------
                           000003  4233 	DOLP_ADR=3 
                           000005  4234 	DOLP_INW=5
                           000004  4235 	VSIZE=4 
      002552                       4236 do_loop:
      00A2A6 CE               [ 2] 4237 	popw x 
      002553                       4238 	_vars VSIZE 
      00A2A7 AC 82            [ 2]    1     sub sp,#VSIZE 
      00A2A9 1C               [ 2] 4239 	pushw x 
      00A2AA AC 84 20 03      [ 2] 4240 	ldw y,basicptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      00A2AE AE AC            [ 2] 4241 	ldw (DOLP_ADR,sp),y
      00A2B0 80 A6 84 81      [ 2] 4242 	ldw y,in.w 
      00A2B4 17 05            [ 2] 4243 	ldw (DOLP_INW,sp),y
      00A2B4 90 89 CD 96      [ 1] 4244 	inc loop_depth 
      00A2B8 74               [ 4] 4245 	ret 
                                   4246 
                                   4247 ;--------------------------------
                                   4248 ; BASIC: UNTIL expr 
                                   4249 ; loop if exprssion is false 
                                   4250 ; else terminate loop
                                   4251 ;--------------------------------
      002567                       4252 until: 
      00A2B9 A1 01 27 07      [ 1] 4253 	tnz loop_depth 
      00A2BD A1 02            [ 1] 4254 	jrne 1$ 
      00A2BF 27 03 CC         [ 2] 4255 	jp syntax_error 
      002570                       4256 1$: 
      00A2C2 91 D7 90         [ 4] 4257 	call relation 
      00A2C5 85 A1            [ 1] 4258 	cp a,#TK_INTGR
      00A2C7 01 27            [ 1] 4259 	jreq 2$
      00A2C9 02 85 51         [ 2] 4260 	jp syntax_error
      00257A                       4261 2$: 
      00A2CC 90               [ 2] 4262 	tnzw x 
      00A2CD FD 90            [ 1] 4263 	jrne 9$
      00A2CF 85 81            [ 2] 4264 	ldw x,(DOLP_ADR,sp)
      00A2D1 CF 00 04         [ 2] 4265 	ldw basicptr,x 
      00A2D1 72 0D            [ 1] 4266 	ld a,(2,x)
      00A2D3 52 30 FB         [ 1] 4267 	ld count,a 
      00A2D6 8E CC            [ 2] 4268 	ldw x,(DOLP_INW,sp)
      00A2D8 8F 51 00         [ 2] 4269 	ldw in.w,x 
      00A2DA 81               [ 4] 4270 	ret 
      00258D                       4271 9$:	; remove loop data from stack  
      00A2DA 72               [ 2] 4272 	popw x
      00258E                       4273 	_drop VSIZE
      00A2DB 0D 52            [ 2]    1     addw sp,#VSIZE 
      00A2DD 30 FB 72 16      [ 1] 4274 	dec loop_depth 
      00A2E1 00               [ 2] 4275 	jp (x)
                                   4276 
                                   4277 ;--------------------------
                                   4278 ; BASIC: PRTA...PRTI  
                                   4279 ;  return constant value 
                                   4280 ;  PORT  offset in GPIO
                                   4281 ;  array
                                   4282 ;---------------------------
      002595                       4283 const_porta:
      00A2E2 22 8E 81         [ 2] 4284 	ldw x,#0
      00A2E5 A6 84            [ 1] 4285 	ld a,#TK_INTGR 
      00A2E5 CD               [ 4] 4286 	ret 
      00259B                       4287 const_portb:
      00A2E6 97 78 A1         [ 2] 4288 	ldw x,#1
      00A2E9 84 27            [ 1] 4289 	ld a,#TK_INTGR 
      00A2EB 03               [ 4] 4290 	ret 
      0025A1                       4291 const_portc:
      00A2EC CC 91 D7         [ 2] 4292 	ldw x,#2
      00A2EF A6 84            [ 1] 4293 	ld a,#TK_INTGR 
      00A2EF 5D               [ 4] 4294 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      0025A7                       4295 const_portd:
      00A2F0 27 04 8F         [ 2] 4296 	ldw x,#3
      00A2F3 5A 26            [ 1] 4297 	ld a,#TK_INTGR 
      00A2F5 F9               [ 4] 4298 	ret 
      0025AD                       4299 const_porte:
      00A2F6 4F 81 04         [ 2] 4300 	ldw x,#4
      00A2F8 A6 84            [ 1] 4301 	ld a,#TK_INTGR 
      00A2F8 CD               [ 4] 4302 	ret 
      0025B3                       4303 const_portf:
      00A2F9 97 78 A1         [ 2] 4304 	ldw x,#5
      00A2FC 84 27            [ 1] 4305 	ld a,#TK_INTGR 
      00A2FE 03               [ 4] 4306 	ret 
      0025B9                       4307 const_portg:
      00A2FF CC 91 D7         [ 2] 4308 	ldw x,#6
      00A302 A6 84            [ 1] 4309 	ld a,#TK_INTGR 
      00A302 A3               [ 4] 4310 	ret 
      0025BF                       4311 const_porth:
      00A303 14 00 2B         [ 2] 4312 	ldw x,#7
      00A306 0C 35            [ 1] 4313 	ld a,#TK_INTGR 
      00A308 0F               [ 4] 4314 	ret 
      0025C5                       4315 const_porti:
      00A309 50 F2 A6         [ 2] 4316 	ldw x,#8
      00A30C 1E 62            [ 1] 4317 	ld a,#TK_INTGR 
      00A30E A6               [ 4] 4318 	ret 
                                   4319 
                                   4320 ;-------------------------------
                                   4321 ; following return constant 
                                   4322 ; related to GPIO register offset 
                                   4323 ;---------------------------------
      0025CB                       4324 const_odr:
      00A30F 10 62            [ 1] 4325 	ld a,#TK_INTGR 
      00A311 20 1E 00         [ 2] 4326 	ldw x,#GPIO_ODR
      00A313 81               [ 4] 4327 	ret 
      0025D1                       4328 const_idr:
      00A313 A3 08            [ 1] 4329 	ld a,#TK_INTGR 
      00A315 00 2B 09         [ 2] 4330 	ldw x,#GPIO_IDR
      00A318 35               [ 4] 4331 	ret 
      0025D7                       4332 const_ddr:
      00A319 0E 50            [ 1] 4333 	ld a,#TK_INTGR 
      00A31B F2 A6 50         [ 2] 4334 	ldw x,#GPIO_DDR
      00A31E 62               [ 4] 4335 	ret 
      0025DD                       4336 const_cr1:
      00A31F 20 10            [ 1] 4337 	ld a,#TK_INTGR 
      00A321 AE 00 03         [ 2] 4338 	ldw x,#GPIO_CR1
      00A321 35               [ 4] 4339 	ret 
      0025E3                       4340 const_cr2:
      00A322 07 50            [ 1] 4341 	ld a,#TK_INTGR 
      00A324 F2 00 04         [ 2] 4342 	ldw x,#GPIO_CR2
      00A325 81               [ 4] 4343 	ret 
                                   4344 ;-------------------------
                                   4345 ; BASIC: POUT 
                                   4346 ;  constant for port mode
                                   4347 ;  used by PMODE 
                                   4348 ;  to set pin as output
                                   4349 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      0025E9                       4350 const_output:
      00A325 A3 00            [ 1] 4351 	ld a,#TK_INTGR 
      00A327 40 23 07         [ 2] 4352 	ldw x,#OUTP
      00A32A 72               [ 4] 4353 	ret 
                                   4354 
                                   4355 ;-------------------------
                                   4356 ; BASIC: PINP 
                                   4357 ;  constant for port mode
                                   4358 ;  used by PMODE 
                                   4359 ;  to set pin as input
                                   4360 ;------------------------
      0025EF                       4361 const_input:
      00A32B 5C 50            [ 1] 4362 	ld a,#TK_INTGR 
      00A32D F2 54 20         [ 2] 4363 	ldw x,#INP 
      00A330 F4               [ 4] 4364 	ret 
                                   4365 	
                                   4366 ;-----------------------
                                   4367 ; memory area constants
                                   4368 ;-----------------------
      00A331                       4369 const_eeprom_base:
      00A331 9F 4A            [ 1] 4370 	ld a,#TK_INTGR 
      00A333 27 01 4A         [ 2] 4371 	ldw x,#EEPROM_BASE 
      00A336 81               [ 4] 4372 	ret 
                                   4373 
                                   4374 ;---------------------------
                                   4375 ; BASIC: DATA 
                                   4376 ; when the interpreter find 
                                   4377 ; a DATA line it skip it.
                                   4378 ;---------------------------
      0025FB                       4379 data:
      00A336 A4 3E C7 50 F1   [ 1] 4380 	mov in,count 
      00A33B 72               [ 4] 4381 	ret 
                                   4382 
                                   4383 ;------------------------------
                                   4384 ; check if it is a DATA line 
                                   4385 ; input: 
                                   4386 ;    X    line address 
                                   4387 ; output:
                                   4388 ;    Z    set if DATA line 
                                   4389 ;----------------------------
      002601                       4390 is_data_line:
      00A33C 18 50            [ 2] 4391 	ldw x,(4,x)
      00A33E F0 8E 81         [ 2] 4392 	ldw x,(code_addr,x)
      00A341 A3 25 FB         [ 2] 4393 	cpw x,#data 
      00A341 CE               [ 4] 4394 	ret 
                                   4395 
                                   4396 ;---------------------------
                                   4397 ; set DATA pointer at line# 
                                   4398 ; specified by X 
                                   4399 ;---------------------------
      00260A                       4400 data_line:
      00A342 00               [ 1] 4401     clr a 
      00A343 10 A6 84         [ 4] 4402 	call search_lineno
      00A346 81               [ 2] 4403 	tnzw x 
      00A347 26 05            [ 1] 4404 	jrne 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00A347 CD 96            [ 1] 4405 2$:	ld a,#ERR_NO_LINE 
      00A349 74 A1 01         [ 2] 4406 	jp tb_error
      002616                       4407 3$: ; check if valid data line 
      00A34C 27 03            [ 1] 4408     ldw y,x 
      00A34E CC 91 D7         [ 4] 4409 	call is_data_line 
      00A351 26 F4            [ 1] 4410 	jrne 2$ 
      00261D                       4411 set_data_ptr: 	
      00A351 85 9E A5 80      [ 2] 4412 	ldw data_ptr,y
      00A355 27 01 50         [ 1] 4413 	ld a,(2,y)
      00A358 A6 84 81         [ 1] 4414 	ld data_len,a 
      00A35B 35 06 00 08      [ 1] 4415 	mov data_ofs,#FIRST_DATA_ITEM 
      00A35B CD               [ 4] 4416 	ret
                                   4417 
                                   4418 ;---------------------------------
                                   4419 ; BASIC: RESTORE [line#]
                                   4420 ; set data_ptr to first data line
                                   4421 ; if no DATA found pointer set to
                                   4422 ; zero.
                                   4423 ; if a line# is given as argument 
                                   4424 ; a data line with that number 
                                   4425 ; is searched and the data pointer 
                                   4426 ; is set to it. If there is no 
                                   4427 ; data line with that number 
                                   4428 ; the program is interrupted. 
                                   4429 ;---------------------------------
      00262C                       4430 restore:
      00A35C 96 74 A1 02      [ 1] 4431 	clr data_ptr 
      00A360 27 03 CC 91      [ 1] 4432 	clr data_ptr+1
      00A364 D7 85 9E 14      [ 1] 4433 	clr data_ofs 
      00A368 01 95 9F 14      [ 1] 4434 	clr data_len
      00A36C 02 97 5B         [ 4] 4435 	call next_token 
      00A36F 02 A6            [ 1] 4436 	cp a,#TK_INTGR
      00A371 84 81            [ 1] 4437 	jreq data_line
      00A373                       4438 	_unget_token 
      00A373 CD 96 74 A1 02   [ 1]    1      mov in,in.saved  
      00A378 27 03 CC         [ 2] 4439 	ldw x,txtbgn
                                   4440 ; search first DATA line 
      00264B                       4441 data_search_loop: 	
      00A37B 91 D7 1C         [ 2] 4442 	cpw x,txtend
      00A37D 24 17            [ 1] 4443 	jruge restore_error 
      00A37D 85 9E            [ 1] 4444 	ldw y,x 
      00A37F 1A 01 95         [ 4] 4445 	call is_data_line 
      00A382 9F 1A            [ 1] 4446 	jreq set_data_ptr
      002657                       4447 try_next_line: 
      00A384 02               [ 1] 4448 	ldw x,y 
      00A385 97 5B            [ 1] 4449 	ld a,(2,x)
      00A387 02 A6 84         [ 1] 4450 	ld acc8,a 
      00A38A 81 5F 00 0D      [ 1] 4451 	clr acc16 
      00A38B 72 BB 00 0D      [ 2] 4452 	addw x,acc16 
      00A38B CD 96            [ 2] 4453 	jra data_search_loop
      002667                       4454 restore_error:	
      00A38D 74 A1            [ 1] 4455     ld a,#ERR_NO_DATA 
      00A38F 02 27 03         [ 2] 4456 	jp tb_error 
                                   4457 
                                   4458 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



                                   4459 ;---------------------------------
                                   4460 ; BASIC: READ 
                                   4461 ; return next data item | 0 
                                   4462 ;---------------------------------
                           000001  4463 	CTX_BPTR=1 
                           000003  4464 	CTX_IN=3 
                           000004  4465 	CTX_COUNT=4 
                           000005  4466 	XSAVE=5
                           000006  4467 	VSIZE=6
      00266C                       4468 read:
      00266C                       4469 	_vars  VSIZE 
      00A392 CC 91            [ 2]    1     sub sp,#VSIZE 
      00266E                       4470 read01:	
      00A394 D7 00 08         [ 1] 4471 	ld a,data_ofs
      00A395 C1 00 09         [ 1] 4472 	cp a,data_len 
      00A395 85 9E            [ 1] 4473 	jreq 2$ ; end of line  
      00A397 18 01 95         [ 4] 4474 	call save_context
      00A39A 9F 18 02         [ 2] 4475 	ldw x,data_ptr 
      00A39D 97 5B 02         [ 2] 4476 	ldw basicptr,x 
      00A3A0 A6 84 81 00 01   [ 1] 4477 	mov in,data_ofs 
      00A3A3 55 00 09 00 03   [ 1] 4478 	mov count,data_len  
      00A3A3 CD 96 74         [ 4] 4479 	call expression 
      00A3A6 A1 02            [ 1] 4480 	cp a,#TK_INTGR 
      00A3A8 27 03            [ 1] 4481 	jreq 1$ 
      00A3AA CC 91 D7         [ 2] 4482 	jp syntax_error 
      002693                       4483 1$:
      00A3AD 90 85            [ 2] 4484 	ldw (XSAVE,SP),x
      00A3AF 85 90 5D         [ 4] 4485 	call next_token ; skip comma
      00A3B2 27 05 58         [ 2] 4486 	ldw x,basicptr 
      00A3B5 90 5A 26         [ 2] 4487 	ldw data_ptr,x 
      00A3B8 FB 00 01 00 08   [ 1] 4488 	mov data_ofs,in 
      00A3B9 CD 1A 52         [ 4] 4489 	call rest_context
      00A3B9 A6 84            [ 2] 4490 	ldw x,(XSAVE,sp)
      00A3BB 81 84            [ 1] 4491 	ld a,#TK_INTGR
      00A3BC                       4492 	_drop VSIZE 
      00A3BC CD 96            [ 2]    1     addw sp,#VSIZE 
      00A3BE 74               [ 4] 4493 	ret 
      0026AD                       4494 2$: ; end of line reached 
      00A3BF A1 02 27 03      [ 2] 4495 	ldw y, data_ptr 
      00A3C3 CC 91 D7 90      [ 1] 4496 	clr data_ptr
      00A3C7 85 85 90 5D      [ 1] 4497 	clr data_ptr+1   
      00A3CB 27 05 54 90      [ 1] 4498 	clr data_ofs 
      00A3CF 5A 26 FB 09      [ 1] 4499 	clr data_len 
      00A3D2 CD 26 57         [ 4] 4500 	call try_next_line 
      00A3D2 A6 84            [ 2] 4501 	jra read01
                                   4502 
                                   4503 
                                   4504 ;---------------------------------
                                   4505 ; BASIC: SPIEN clkdiv, 0|1  
                                   4506 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4507 ; if clkdiv==-1 disable SPI
                                   4508 ; 0|1 -> disable|enable  
                                   4509 ;--------------------------------- 
                           000005  4510 SPI_CS_BIT=5
      0026C6                       4511 spi_enable:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00A3D4 81 15 F9         [ 4] 4512 	call arg_list 
      00A3D5 A1 02            [ 1] 4513 	cp a,#2
      00A3D5 A6 84            [ 1] 4514 	jreq 1$
      00A3D7 CD 96 67         [ 2] 4515 	jp syntax_error 
      0026D0                       4516 1$: 
      00A3DA 9F A4 07 C7      [ 1] 4517 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A3DE 50               [ 2] 4518 	popw x  
      00A3DF C6               [ 2] 4519 	tnzw x 
      00A3E0 81 21            [ 1] 4520 	jreq spi_disable 
      00A3E1 85               [ 2] 4521 	popw x 
      00A3E1 52 01            [ 1] 4522 	ld a,#(1<<SPI_CR1_BR)
      00A3E3 CD               [ 4] 4523 	mul x,a 
      00A3E4 96               [ 1] 4524 	ld a,xl 
      00A3E5 79 A1 02         [ 1] 4525 	ld SPI_CR1,a 
                                   4526 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A3E8 27 03 CC 91      [ 1] 4527 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A3EC D7 90 85 85      [ 1] 4528 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4529 ; configure SPI as master mode 0.	
      00A3F0 CD A4 2D 6B      [ 1] 4530 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4531 ; ~CS line controlled by sofware 	
      00A3F4 01 A6 01 0D      [ 1] 4532 	bset SPI_CR2,#SPI_CR2_SSM 
      00A3F8 01 27 0D 48      [ 1] 4533     bset SPI_CR2,#SPI_CR2_SSI 
                                   4534 ; enable SPI
      00A3FC 0A 01 26 FB      [ 1] 4535 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A400 6B               [ 4] 4536 	ret 
      0026F9                       4537 spi_disable:
      0026F9                       4538 	_drop #2; throw first argument.
      00A401 01 7B            [ 2]    1     addw sp,##2 
                                   4539 ; wait spi idle 
      00A403 01 EA            [ 1] 4540 1$:	ld a,#0x82 
      00A405 03 E7 03         [ 1] 4541 	and a,SPI_SR
      00A408 90 A3            [ 1] 4542 	cp a,#2 
      00A40A 00 01            [ 1] 4543 	jrne 1$
      00A40C 27 10 7B 01      [ 1] 4544 	bres SPI_CR1,#SPI_CR1_SPE
      00A410 43 E4 04 E7      [ 1] 4545 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A414 04 7B 01 43      [ 1] 4546 	bres PE_DDR,#SPI_CS_BIT 
      00A418 E4               [ 4] 4547 	ret 
                                   4548 
      002711                       4549 spi_clear_error:
      00A419 02 E7            [ 1] 4550 	ld a,#0x78 
      00A41B 02 20 0C         [ 1] 4551 	bcp a,SPI_SR 
      00A41E 27 04            [ 1] 4552 	jreq 1$
      00A41E 7B 01 EA 02      [ 1] 4553 	clr SPI_SR 
      00A422 E7               [ 4] 4554 1$: ret 
                                   4555 
      00271D                       4556 spi_send_byte:
      00A423 02               [ 1] 4557 	push a 
      00A424 7B 01 EA         [ 4] 4558 	call spi_clear_error
      00A427 04               [ 1] 4559 	pop a 
      00A428 E7 04 52 03 FB   [ 2] 4560 	btjf SPI_SR,#SPI_SR_TXE,.
      00A42A C7 52 04         [ 1] 4561 	ld SPI_DR,a
      00A42A 5B 01 81 03 FB   [ 2] 4562 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A42D C6 52 04         [ 1] 4563 	ld a,SPI_DR 
      00A42D 58               [ 4] 4564 	ret 
                                   4565 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      002733                       4566 spi_rcv_byte:
      00A42E 1C A4            [ 1] 4567 	ld a,#255
      00A430 3D FE 9F 88 5E   [ 2] 4568 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A435 A6 05 42         [ 1] 4569 	ld a,SPI_DR 
      00A438 1C               [ 4] 4570 	ret
                                   4571 
                                   4572 ;------------------------------
                                   4573 ; BASIC: SPIWR byte [,byte]
                                   4574 ; write 1 or more byte
                                   4575 ;------------------------------
      00273E                       4576 spi_write:
      00A439 50 00 84         [ 4] 4577 	call expression
      00A43C 81 84            [ 1] 4578 	cp a,#TK_INTGR 
      00A43D 27 03            [ 1] 4579 	jreq 1$
      00A43D 03 06 03         [ 2] 4580 	jp syntax_error 
      002748                       4581 1$:	
      00A440 05               [ 1] 4582 	ld a,xl 
      00A441 04 00 02         [ 4] 4583 	call spi_send_byte 
      00A444 01 06 00         [ 4] 4584 	call next_token 
      00A447 02 02            [ 1] 4585 	cp a,#TK_COMMA 
      00A449 02 03            [ 1] 4586 	jrne 2$ 
      00A44B 03 01            [ 2] 4587 	jra spi_write 
      00A44D 03               [ 1] 4588 2$:	tnz a 
      00A44E 03 02            [ 1] 4589 	jreq 3$
      002758                       4590 	_unget_token  
      00A450 04 04 05 02 06   [ 1]    1      mov in,in.saved  
      00A455 02               [ 4] 4591 3$:	ret 
                                   4592 
                                   4593 
                                   4594 ;-------------------------------
                                   4595 ; BASIC: SPIRD 	
                                   4596 ; read one byte from SPI 
                                   4597 ;-------------------------------
      00275E                       4598 spi_read:
      00A456 07 02 05         [ 4] 4599 	call spi_rcv_byte 
      00A459 04               [ 1] 4600 	clrw x 
      00A45A 02               [ 1] 4601 	ld xl,a 
      00A45B 04 01            [ 1] 4602 	ld a,#TK_INTGR 
      00A45D 81               [ 4] 4603 	ret 
                                   4604 
                                   4605 ;------------------------------
                                   4606 ; BASIC: SPISEL 0|1 
                                   4607 ; set state of ~CS line
                                   4608 ; 0|1 deselect|select  
                                   4609 ;------------------------------
      002766                       4610 spi_select:
      00A45D CD 96 74         [ 4] 4611 	call next_token 
      00A460 A1 01            [ 1] 4612 	cp a,#TK_INTGR 
      00A462 27 03            [ 1] 4613 	jreq 1$
      00A464 CC 91 D7         [ 2] 4614 	jp syntax_error 
      00A467 5D               [ 2] 4615 1$: tnzw x  
      00A467 A6 80            [ 1] 4616 	jreq cs_high 
      00A469 15 01 27 05      [ 1] 4617 	bres PE_ODR,#SPI_CS_BIT
      00A46D A6               [ 4] 4618 	ret 
      002778                       4619 cs_high: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



      00A46E 0A CC 91 D9      [ 1] 4620 	bset PE_ODR,#SPI_CS_BIT
      00A472 81               [ 4] 4621 	ret 
                                   4622 
                                   4623 ;-------------------------------
                                   4624 ; BASIC: PAD 
                                   4625 ; Return pad buffer address.
                                   4626 ;------------------------------
      00277D                       4627 pad_ref:
      00A472 CE 00 14         [ 2] 4628 	ldw x,#pad 
      00A475 58 58            [ 1] 4629 	ld a,TK_INTGR
      00A477 58               [ 4] 4630 	ret 
                                   4631 
                                   4632 
                                   4633 ;------------------------------
                                   4634 ;      dictionary 
                                   4635 ; format:
                                   4636 ;   link:   2 bytes 
                                   4637 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   4638 ;   cmd_name: 16 byte max 
                                   4639 ;   cmd_index: 2 bytes 
                                   4640 ;------------------------------
                                   4641 	.macro _dict_entry len,name,cmd_idx 
                                   4642 	.word LINK 
                                   4643 	LINK=.
                                   4644 name:
                                   4645 	.byte len 	
                                   4646 	.ascii "name"
                                   4647 	.word cmd_idx 
                                   4648 	.endm 
                                   4649 
                           000000  4650 	LINK=0
                                   4651 ; respect alphabetic order for BASIC names from Z-A
                                   4652 ; this sort order is for a cleaner WORDS cmd output. 	
      002783                       4653 kword_end:
      002783                       4654 	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
      00A478 58 58                    1 	.word LINK 
                           002785     2 	LINK=.
      002785                          3 XOR:
      00A47A 9E                       4 	.byte 3+F_IFUNC 	
      00A47B C8 00 14                 5 	.ascii "XOR"
      00A47E C7 00                    6 	.word XOR_IDX 
      00278B                       4655 	_dict_entry,5,WRITE,WRITE_IDX;write  
      00A480 0E 9F                    1 	.word LINK 
                           00278D     2 	LINK=.
      00278D                          3 WRITE:
      00A482 C8                       4 	.byte 5 	
      00A483 00 15 C7 00 0F           5 	.ascii "WRITE"
      00A488 CE 00                    6 	.word WRITE_IDX 
      002795                       4656 	_dict_entry,5,WORDS,WORDS_IDX;words 
      00A48A 16 CF                    1 	.word LINK 
                           002797     2 	LINK=.
      002797                          3 WORDS:
      00A48C 00                       4 	.byte 5 	
      00A48D 14 90 54 90 9E           5 	.ascii "WORDS"
      00A492 C8 00                    6 	.word WORDS_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00279F                       4657 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      00A494 16 C7                    1 	.word LINK 
                           0027A1     2 	LINK=.
      0027A1                          3 WAIT:
      00A496 00                       4 	.byte 4 	
      00A497 16 90 9F C8              5 	.ascii "WAIT"
      00A49B 00 17                    6 	.word WAIT_IDX 
      0027A8                       4658 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      00A49D C7 00                    1 	.word LINK 
                           0027AA     2 	LINK=.
      0027AA                          3 USR:
      00A49F 17                       4 	.byte 3+F_IFUNC 	
      00A4A0 CE 00 0E                 5 	.ascii "USR"
      00A4A3 54 54                    6 	.word USR_IDX 
      0027B0                       4659 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      00A4A5 54 9E                    1 	.word LINK 
                           0027B2     2 	LINK=.
      0027B2                          3 UNTIL:
      00A4A7 C8                       4 	.byte 5 	
      00A4A8 00 0E 95 9F C8           5 	.ascii "UNTIL"
      00A4AD 00 0F                    6 	.word UNTIL_IDX 
      0027BA                       4660 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      00A4AF 97 C8                    1 	.word LINK 
                           0027BC     2 	LINK=.
      0027BC                          3 UFLASH:
      00A4B1 00                       4 	.byte 6+F_IFUNC 	
      00A4B2 17 97 9E C8 00 16        5 	.ascii "UFLASH"
      00A4B8 95 CF                    6 	.word UFLASH_IDX 
      0027C5                       4661 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      00A4BA 00 16                    1 	.word LINK 
                           0027C7     2 	LINK=.
      0027C7                          3 UBOUND:
      00A4BC 90                       4 	.byte 6+F_IFUNC 	
      00A4BD 85 65 93 5C 4E 44        5 	.ascii "UBOUND"
      00A4C1 00 B2                    6 	.word UBOUND_IDX 
      0027D0                       4662 	_dict_entry,4,TONE,TONE_IDX;tone  
      00A4C1 A6 84                    1 	.word LINK 
                           0027D2     2 	LINK=.
      0027D2                          3 TONE:
      00A4C3 81                       4 	.byte 4 	
      00A4C4 54 4F 4E 45              5 	.ascii "TONE"
      00A4C4 52 03                    6 	.word TONE_IDX 
      0027D9                       4663 	_dict_entry,2,TO,TO_IDX;to
      00A4C6 0F 02                    1 	.word LINK 
                           0027DB     2 	LINK=.
      0027DB                          3 TO:
      00A4C8 0F                       4 	.byte 2 	
      00A4C9 03 90                    5 	.ascii "TO"
      00A4CB AE AB                    6 	.word TO_IDX 
      0027E0                       4664 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00A4CD 96 93                    1 	.word LINK 
                           0027E2     2 	LINK=.
      0027E2                          3 TIMER:
      00A4CF F6                       4 	.byte 5 	
      00A4D0 A4 0F 6B 01 0C           5 	.ascii "TIMER"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00A4D5 03 5C                    6 	.word TIMER_IDX 
      0027EA                       4665 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00A4D7 F6 CD                    1 	.word LINK 
                           0027EC     2 	LINK=.
      0027EC                          3 TIMEOUT:
      00A4D9 83                       4 	.byte 7+F_IFUNC 	
      00A4DA 71 0C 02 0A 01 26 F5     5 	.ascii "TIMEOUT"
      00A4E1 A6 46                    6 	.word TMROUT_IDX 
      0027F6                       4666 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00A4E3 11 02                    1 	.word LINK 
                           0027F8     2 	LINK=.
      0027F8                          3 TICKS:
      00A4E5 2B                       4 	.byte 5+F_IFUNC 	
      00A4E6 09 A6 20 CD 83           5 	.ascii "TICKS"
      00A4EB 71 0C                    6 	.word TICKS_IDX 
      002800                       4667 	_dict_entry,4,STOP,STOP_IDX;stop 
      00A4ED 02 20                    1 	.word LINK 
                           002802     2 	LINK=.
      002802                          3 STOP:
      00A4EF 07                       4 	.byte 4 	
      00A4F0 A6 0D CD 83              5 	.ascii "STOP"
      00A4F4 71 0F                    6 	.word STOP_IDX 
      002809                       4668 	_dict_entry,4,STEP,STEP_IDX;step 
      00A4F6 02 72                    1 	.word LINK 
                           00280B     2 	LINK=.
      00280B                          3 STEP:
      00A4F8 A2                       4 	.byte 4 	
      00A4F9 00 02 90 FE              5 	.ascii "STEP"
      00A4FD 26 CF                    6 	.word STEP_IDX 
      002812                       4669 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      00A4FF A6 0D                    1 	.word LINK 
                           002814     2 	LINK=.
      002814                          3 SPIWR:
      00A501 CD                       4 	.byte 5 	
      00A502 83 71 5F 7B 03           5 	.ascii "SPIWR"
      00A507 97 CD                    6 	.word SPIWR_IDX 
      00281C                       4670 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00A509 93 1B                    1 	.word LINK 
                           00281E     2 	LINK=.
      00281E                          3 SPISEL:
      00A50B AE                       4 	.byte 6 	
      00A50C A5 14 CD 83 CE 5B        5 	.ascii "SPISEL"
      00A512 03 81                    6 	.word SPISEL_IDX 
      002827                       4671 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      00A514 20 77                    1 	.word LINK 
                           002829     2 	LINK=.
      002829                          3 SPIRD:
      00A516 6F                       4 	.byte 5+F_IFUNC 	
      00A517 72 64 73 20 69           5 	.ascii "SPIRD"
      00A51C 6E 20                    6 	.word SPIRD_IDX 
      002831                       4672 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      00A51E 64 69                    1 	.word LINK 
                           002833     2 	LINK=.
      002833                          3 SPIEN:
      00A520 63                       4 	.byte 5 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



      00A521 74 69 6F 6E 61           5 	.ascii "SPIEN"
      00A526 72 79                    6 	.word SPIEN_IDX 
      00283B                       4673 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      00A528 0A 00                    1 	.word LINK 
                           00283D     2 	LINK=.
      00A52A                          3 SLEEP:
      00A52A CD                       4 	.byte 5 	
      00A52B 96 79 A1 01 27           5 	.ascii "SLEEP"
      00A530 03 CC                    6 	.word SLEEP_IDX 
      002845                       4674     _dict_entry,4,SIZE,SIZE_IDX; cmd_size 
      00A532 91 D7                    1 	.word LINK 
                           002847     2 	LINK=.
      00A534                          3 SIZE:
      00A534 85                       4 	.byte 4 	
      00A535 CF 00 12 81              5 	.ascii "SIZE"
      00A539 00 C2                    6 	.word SIZE_IDX 
      00284E                       4675 	_dict_entry,4,SHOW,SHOW_IDX;show 
      00A539 CE 00                    1 	.word LINK 
                           002850     2 	LINK=.
      002850                          3 SHOW:
      00A53B 12                       4 	.byte 4 	
      00A53C 53 48 4F 57              5 	.ascii "SHOW"
      00A53C 53 A3                    6 	.word SHOW_IDX 
      002857                       4676 	_dict_entry,4,SAVE,SAVE_IDX ;save_app 
      00A53E FF FF                    1 	.word LINK 
                           002859     2 	LINK=.
      002859                          3 SAVE:
      00A540 27                       4 	.byte 4 	
      00A541 01 5F A6 84              5 	.ascii "SAVE"
      00A545 81 34                    6 	.word SAVE_IDX 
      00A546                       4677 	_dict_entry 3,RUN,RUN_IDX;run
      00A546 CD 96                    1 	.word LINK 
                           002862     2 	LINK=.
      002862                          3 RUN:
      00A548 74                       4 	.byte 3 	
      00A549 A1 01 27                 5 	.ascii "RUN"
      00A54C 03 CC                    6 	.word RUN_IDX 
      002868                       4678 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      00A54E 91 D7                    1 	.word LINK 
                           00286A     2 	LINK=.
      00286A                          3 RSHIFT:
      00A550 85                       4 	.byte 6+F_IFUNC 	
      00A551 20 E9 48 49 46 54        5 	.ascii "RSHIFT"
      00A553 00 92                    6 	.word RSHIFT_IDX 
      002873                       4679 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      00A553 CD 96                    1 	.word LINK 
                           002875     2 	LINK=.
      002875                          3 RND:
      00A555 79                       4 	.byte 3+F_IFUNC 	
      00A556 A1 01 27                 5 	.ascii "RND"
      00A559 03 CC                    6 	.word RND_IDX 
      00287B                       4680 	_dict_entry,6,RETURN,RET_IDX;return 
      00A55B 91 D7                    1 	.word LINK 
                           00287D     2 	LINK=.
      00287D                          3 RETURN:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



      00A55D 85                       4 	.byte 6 	
      00A55E 4B 00 35 CC 50 E0        5 	.ascii "RETURN"
      00A564 9E A4                    6 	.word RET_IDX 
      002886                       4681 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00A566 3F 95                    1 	.word LINK 
                           002888     2 	LINK=.
      002888                          3 RESTORE:
      00A568 A3                       4 	.byte 7 	
      00A569 00 FF 23 06 0C 01 98     5 	.ascii "RESTORE"
      00A570 56 20                    6 	.word REST_IDX 
      002892                       4682 	_dict_entry 6,REMARK,REM_IDX;remark 
      00A572 F5 35                    1 	.word LINK 
                           002894     2 	LINK=.
      002894                          3 REMARK:
      00A574 55                       4 	.byte 6 	
      00A575 50 E0 84 C7 50 E1        5 	.ascii "REMARK"
      00A57B 9F 4A                    6 	.word REM_IDX 
      00289D                       4683 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      00A57D 35 55                    1 	.word LINK 
                           00289F     2 	LINK=.
      00289F                          3 REBOOT:
      00A57F 50                       4 	.byte 6 	
      00A580 E0 C7 50 E2 35 AA        5 	.ascii "REBOOT"
      00A586 50 E0                    6 	.word RBT_IDX 
      0028A8                       4684 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      00A588 81 9F                    1 	.word LINK 
                           0028AA     2 	LINK=.
      00A589                          3 READ:
      00A589 35                       4 	.byte 4+F_IFUNC 	
      00A58A AA 50 E0 81              5 	.ascii "READ"
      00A58E 00 86                    6 	.word READ_IDX 
      0028B1                       4685 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      00A58E CD 96                    1 	.word LINK 
                           0028B3     2 	LINK=.
      0028B3                          3 QKEY:
      00A590 74                       4 	.byte 4+F_IFUNC 	
      00A591 A1 01 27 03              5 	.ascii "QKEY"
      00A595 CC 91                    6 	.word QKEY_IDX 
      0028BA                       4686 	_dict_entry,4+F_IFUNC,PRTI,PRTI_IDX;const_porti 
      00A597 D7 85                    1 	.word LINK 
                           0028BC     2 	LINK=.
      00A599                          3 PRTI:
      00A599 5D                       4 	.byte 4+F_IFUNC 	
      00A59A 27 0A A6 0F              5 	.ascii "PRTI"
      00A59E 59 25                    6 	.word PRTI_IDX 
      0028C3                       4687 	_dict_entry,4+F_IFUNC,PRTH,PRTH_IDX;const_porth 
      00A5A0 03 4A                    1 	.word LINK 
                           0028C5     2 	LINK=.
      0028C5                          3 PRTH:
      00A5A2 20                       4 	.byte 4+F_IFUNC 	
      00A5A3 FA 5F 97 A6              5 	.ascii "PRTH"
      00A5A7 84 81                    6 	.word PRTH_IDX 
      00A5A9                       4688 	_dict_entry,4+F_IFUNC,PRTG,PRTG_IDX;const_portg 
      00A5A9 CD 96                    1 	.word LINK 
                           0028CE     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



      0028CE                          3 PRTG:
      00A5AB 74                       4 	.byte 4+F_IFUNC 	
      00A5AC A1 01 27 03              5 	.ascii "PRTG"
      00A5B0 CC 91                    6 	.word PRTG_IDX 
      0028D5                       4689 	_dict_entry,4+F_IFUNC,PRTF,PRTF_IDX;const_portf
      00A5B2 D7 85                    1 	.word LINK 
                           0028D7     2 	LINK=.
      0028D7                          3 PRTF:
      00A5B4 9F                       4 	.byte 4+F_IFUNC 	
      00A5B5 A4 0F 5F 5C              5 	.ascii "PRTF"
      00A5B9 4D 27                    6 	.word PRTF_IDX 
      0028DE                       4690 	_dict_entry,4+F_IFUNC,PRTE,PRTE_IDX;const_porte
      00A5BB 04 58                    1 	.word LINK 
                           0028E0     2 	LINK=.
      0028E0                          3 PRTE:
      00A5BD 4A                       4 	.byte 4+F_IFUNC 	
      00A5BE 20 F9 A6 84              5 	.ascii "PRTE"
      00A5C2 81 7A                    6 	.word PRTE_IDX 
      00A5C3                       4691 	_dict_entry,4+F_IFUNC,PRTD,PRTD_IDX;const_portd
      00A5C3 CD 96                    1 	.word LINK 
                           0028E9     2 	LINK=.
      0028E9                          3 PRTD:
      00A5C5 74                       4 	.byte 4+F_IFUNC 	
      00A5C6 A1 01 27 03              5 	.ascii "PRTD"
      00A5CA CC 91                    6 	.word PRTD_IDX 
      0028F0                       4692 	_dict_entry,4+F_IFUNC,PRTC,PRTC_IDX;const_portc
      00A5CC D7 85                    1 	.word LINK 
                           0028F2     2 	LINK=.
      0028F2                          3 PRTC:
      00A5CE 53                       4 	.byte 4+F_IFUNC 	
      00A5CF A6 84 81 43              5 	.ascii "PRTC"
      00A5D2 00 76                    6 	.word PRTC_IDX 
      0028F9                       4693 	_dict_entry,4+F_IFUNC,PRTB,PRTB_IDX;const_portb
      00A5D2 85 52                    1 	.word LINK 
                           0028FB     2 	LINK=.
      0028FB                          3 PRTB:
      00A5D4 04                       4 	.byte 4+F_IFUNC 	
      00A5D5 89 90 CE 00              5 	.ascii "PRTB"
      00A5D9 05 17                    6 	.word PRTB_IDX 
      002902                       4694 	_dict_entry,4+F_IFUNC,PRTA,PRTA_IDX;const_porta 
      00A5DB 03 90                    1 	.word LINK 
                           002904     2 	LINK=.
      002904                          3 PRTA:
      00A5DD CE                       4 	.byte 4+F_IFUNC 	
      00A5DE 00 01 17 05              5 	.ascii "PRTA"
      00A5E2 72 5C                    6 	.word PRTA_IDX 
      00290B                       4695 	_dict_entry 5,PRINT,PRT_IDX;print 
      00A5E4 00 1F                    1 	.word LINK 
                           00290D     2 	LINK=.
      00290D                          3 PRINT:
      00A5E6 81                       4 	.byte 5 	
      00A5E7 50 52 49 4E 54           5 	.ascii "PRINT"
      00A5E7 72 5D                    6 	.word PRT_IDX 
      002915                       4696 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      00A5E9 00 1F                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



                           002917     2 	LINK=.
      002917                          3 POUT:
      00A5EB 26                       4 	.byte 4+F_IFUNC 	
      00A5EC 03 CC 91 D7              5 	.ascii "POUT"
      00A5F0 00 6E                    6 	.word POUT_IDX 
      00291E                       4697 	_dict_entry,4,POKE,POKE_IDX;poke 
      00A5F0 CD 97                    1 	.word LINK 
                           002920     2 	LINK=.
      002920                          3 POKE:
      00A5F2 C1                       4 	.byte 4 	
      00A5F3 A1 84 27 03              5 	.ascii "POKE"
      00A5F7 CC 91                    6 	.word POKE_IDX 
      002927                       4698 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      00A5F9 D7 20                    1 	.word LINK 
                           002929     2 	LINK=.
      00A5FA                          3 PMODE:
      00A5FA 5D                       4 	.byte 5 	
      00A5FB 26 10 1E 03 CF           5 	.ascii "PMODE"
      00A600 00 05                    6 	.word PMODE_IDX 
      002931                       4699 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      00A602 E6 02                    1 	.word LINK 
                           002933     2 	LINK=.
      002933                          3 PINP:
      00A604 C7                       4 	.byte 4+F_IFUNC 	
      00A605 00 04 1E 05              5 	.ascii "PINP"
      00A609 CF 00                    6 	.word PINP_IDX 
      00293A                       4700 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      00A60B 01 81                    1 	.word LINK 
                           00293C     2 	LINK=.
      00A60D                          3 PEEK:
      00A60D 85                       4 	.byte 4+F_IFUNC 	
      00A60E 5B 04 72 5A              5 	.ascii "PEEK"
      00A612 00 1F                    6 	.word PEEK_IDX 
      002943                       4701 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      00A614 FC 3C                    1 	.word LINK 
                           002945     2 	LINK=.
      00A615                          3 PAUSE:
      00A615 AE                       4 	.byte 5 	
      00A616 00 00 A6 84 81           5 	.ascii "PAUSE"
      00A61B 00 64                    6 	.word PAUSE_IDX 
      00294D                       4702 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      00A61B AE 00                    1 	.word LINK 
                           00294F     2 	LINK=.
      00294F                          3 PAD:
      00A61D 01                       4 	.byte 3+F_IFUNC 	
      00A61E A6 84 81                 5 	.ascii "PAD"
      00A621 00 62                    6 	.word PAD_IDX 
      002955                       4703 	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
      00A621 AE 00                    1 	.word LINK 
                           002957     2 	LINK=.
      002957                          3 OR:
      00A623 02                       4 	.byte 2+F_IFUNC 	
      00A624 A6 84                    5 	.ascii "OR"
      00A626 81 60                    6 	.word OR_IDX 
      00A627                       4704 	_dict_entry,2,ON,ON_IDX; cmd_on 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



      00A627 AE 00                    1 	.word LINK 
                           00295E     2 	LINK=.
      00295E                          3 ON:
      00A629 03                       4 	.byte 2 	
      00A62A A6 84                    5 	.ascii "ON"
      00A62C 81 C4                    6 	.word ON_IDX 
      00A62D                       4705 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      00A62D AE 00                    1 	.word LINK 
                           002965     2 	LINK=.
      002965                          3 ODR:
      00A62F 04                       4 	.byte 3+F_IFUNC 	
      00A630 A6 84 81                 5 	.ascii "ODR"
      00A633 00 5E                    6 	.word ODR_IDX 
      00296B                       4706 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      00A633 AE 00                    1 	.word LINK 
                           00296D     2 	LINK=.
      00296D                          3 NOT:
      00A635 05                       4 	.byte 3+F_IFUNC 	
      00A636 A6 84 81                 5 	.ascii "NOT"
      00A639 00 5C                    6 	.word NOT_IDX 
      002973                       4707 	_dict_entry,4,NEXT,NEXT_IDX;next 
      00A639 AE 00                    1 	.word LINK 
                           002975     2 	LINK=.
      002975                          3 NEXT:
      00A63B 06                       4 	.byte 4 	
      00A63C A6 84 81 54              5 	.ascii "NEXT"
      00A63F 00 58                    6 	.word NEXT_IDX 
      00297C                       4708 	_dict_entry,3,NEW,NEW_IDX;new
      00A63F AE 00                    1 	.word LINK 
                           00297E     2 	LINK=.
      00297E                          3 NEW:
      00A641 07                       4 	.byte 3 	
      00A642 A6 84 81                 5 	.ascii "NEW"
      00A645 00 5A                    6 	.word NEW_IDX 
      002984                       4709 	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
      00A645 AE 00                    1 	.word LINK 
                           002986     2 	LINK=.
      002986                          3 MULDIV:
      00A647 08                       4 	.byte 6+F_IFUNC 	
      00A648 A6 84 81 44 49 56        5 	.ascii "MULDIV"
      00A64B 00 56                    6 	.word MULDIV_IDX 
      00298F                       4710 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      00A64B A6 84                    1 	.word LINK 
                           002991     2 	LINK=.
      002991                          3 LSHIFT:
      00A64D AE                       4 	.byte 6+F_IFUNC 	
      00A64E 00 00 81 49 46 54        5 	.ascii "LSHIFT"
      00A651 00 54                    6 	.word LSHIFT_IDX 
      00299A                       4711 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      00A651 A6 84                    1 	.word LINK 
                           00299C     2 	LINK=.
      00299C                          3 LOG:
      00A653 AE                       4 	.byte 3+F_IFUNC 	
      00A654 00 01 81                 5 	.ascii "LOG"
      00A657 00 52                    6 	.word LOG_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



      0029A2                       4712 	_dict_entry 4,LIST,LIST_IDX;list
      00A657 A6 84                    1 	.word LINK 
                           0029A4     2 	LINK=.
      0029A4                          3 LIST:
      00A659 AE                       4 	.byte 4 	
      00A65A 00 02 81 54              5 	.ascii "LIST"
      00A65D 00 50                    6 	.word LIST_IDX 
      0029AB                       4713 	_dict_entry 3,LET,LET_IDX;let 
      00A65D A6 84                    1 	.word LINK 
                           0029AD     2 	LINK=.
      0029AD                          3 LET:
      00A65F AE                       4 	.byte 3 	
      00A660 00 03 81                 5 	.ascii "LET"
      00A663 00 4E                    6 	.word LET_IDX 
      0029B3                       4714 	_dict_entry,3+F_IFUNC,KEY,KEY_IDX;key 
      00A663 A6 84                    1 	.word LINK 
                           0029B5     2 	LINK=.
      0029B5                          3 KEY:
      00A665 AE                       4 	.byte 3+F_IFUNC 	
      00A666 00 04 81                 5 	.ascii "KEY"
      00A669 00 4C                    6 	.word KEY_IDX 
      0029BB                       4715 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      00A669 A6 84                    1 	.word LINK 
                           0029BD     2 	LINK=.
      0029BD                          3 IWDGREF:
      00A66B AE                       4 	.byte 7 	
      00A66C 00 01 81 47 52 45 46     5 	.ascii "IWDGREF"
      00A66F 00 4A                    6 	.word IWDGREF_IDX 
      0029C7                       4716 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      00A66F A6 84                    1 	.word LINK 
                           0029C9     2 	LINK=.
      0029C9                          3 IWDGEN:
      00A671 AE                       4 	.byte 6 	
      00A672 00 00 81 47 45 4E        5 	.ascii "IWDGEN"
      00A675 00 48                    6 	.word IWDGEN_IDX 
      0029D2                       4717 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      00A675 A6 84                    1 	.word LINK 
                           0029D4     2 	LINK=.
      0029D4                          3 INVERT:
      00A677 AE                       4 	.byte 6+F_IFUNC 	
      00A678 40 00 81 45 52 54        5 	.ascii "INVERT"
      00A67B 00 46                    6 	.word INVERT_IDX 
      0029DD                       4718 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      00A67B 55 00                    1 	.word LINK 
                           0029DF     2 	LINK=.
      0029DF                          3 INPUT:
      00A67D 04                       4 	.byte 5 	
      00A67E 00 02 81 55 54           5 	.ascii "INPUT"
      00A681 00 44                    6 	.word INPUT_IDX 
      0029E7                       4719 	_dict_entry,2,IF,IF_IDX;if 
      00A681 EE 04                    1 	.word LINK 
                           0029E9     2 	LINK=.
      0029E9                          3 IF:
      00A683 DE                       4 	.byte 2 	
      00A684 AB 9C                    5 	.ascii "IF"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



      00A686 A3 A6                    6 	.word IF_IDX 
      0029EE                       4720 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      00A688 7B 81                    1 	.word LINK 
                           0029F0     2 	LINK=.
      00A68A                          3 IDR:
      00A68A 4F                       4 	.byte 3+F_IFUNC 	
      00A68B CD 86 B6                 5 	.ascii "IDR"
      00A68E 5D 26                    6 	.word IDR_IDX 
      0029F6                       4721 	_dict_entry,3,HEX,HEX_IDX;hex_base
      00A690 05 A6                    1 	.word LINK 
                           0029F8     2 	LINK=.
      0029F8                          3 HEX:
      00A692 05                       4 	.byte 3 	
      00A693 CC 91 D9                 5 	.ascii "HEX"
      00A696 00 3E                    6 	.word HEX_IDX 
      0029FE                       4722 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      00A696 90 93                    1 	.word LINK 
                           002A00     2 	LINK=.
      002A00                          3 GPIO:
      00A698 CD                       4 	.byte 4+F_IFUNC 	
      00A699 A6 81 26 F4              5 	.ascii "GPIO"
      00A69D 00 3C                    6 	.word GPIO_IDX 
      002A07                       4723 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      00A69D 90 CF                    1 	.word LINK 
                           002A09     2 	LINK=.
      002A09                          3 GOTO:
      00A69F 00                       4 	.byte 4 	
      00A6A0 07 90 E6 02              5 	.ascii "GOTO"
      00A6A4 C7 00                    6 	.word GOTO_IDX 
      002A10                       4724 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      00A6A6 0A 35                    1 	.word LINK 
                           002A12     2 	LINK=.
      002A12                          3 GOSUB:
      00A6A8 06                       4 	.byte 5 	
      00A6A9 00 09 81 55 42           5 	.ascii "GOSUB"
      00A6AC 00 38                    6 	.word GOSUB_IDX 
      002A1A                       4725 	_dict_entry,3,GET,GET_IDX; cmd_get 
      00A6AC 72 5F                    1 	.word LINK 
                           002A1C     2 	LINK=.
      002A1C                          3 GET:
      00A6AE 00                       4 	.byte 3 	
      00A6AF 07 72 5F                 5 	.ascii "GET"
      00A6B2 00 08                    6 	.word GET_IDX 
      002A22                       4726 	_dict_entry,4+F_IFUNC,FREE,FREE_IDX;free
      00A6B4 72 5F                    1 	.word LINK 
                           002A24     2 	LINK=.
      002A24                          3 FREE:
      00A6B6 00                       4 	.byte 4+F_IFUNC 	
      00A6B7 09 72 5F 00              5 	.ascii "FREE"
      00A6BB 0A CD                    6 	.word FREE_IDX 
      002A2B                       4727 	_dict_entry,3,FOR,FOR_IDX;for 
      00A6BD 92 CF                    1 	.word LINK 
                           002A2D     2 	LINK=.
      002A2D                          3 FOR:
      00A6BF A1                       4 	.byte 3 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



      00A6C0 84 27 C7                 5 	.ascii "FOR"
      00A6C3 55 00                    6 	.word FOR_IDX 
      002A33                       4728 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      00A6C5 03 00                    1 	.word LINK 
                           002A35     2 	LINK=.
      002A35                          3 FCPU:
      00A6C7 02                       4 	.byte 4 	
      00A6C8 CE 00 1B 55              5 	.ascii "FCPU"
      00A6CB 00 32                    6 	.word FCPU_IDX 
      002A3C                       4729 	_dict_entry,5,ERASE,ERASE_IDX; erase 
      00A6CB C3 00                    1 	.word LINK 
                           002A3E     2 	LINK=.
      002A3E                          3 ERASE:
      00A6CD 1D                       4 	.byte 5 	
      00A6CE 24 17 90 93 CD           5 	.ascii "ERASE"
      00A6D3 A6 81                    6 	.word ERASE_IDX 
      002A46                       4730 	_dict_entry,3,END,END_IDX;cmd_end  
      00A6D5 27 C6                    1 	.word LINK 
                           002A48     2 	LINK=.
      00A6D7                          3 END:
      00A6D7 93                       4 	.byte 3 	
      00A6D8 E6 02 C7                 5 	.ascii "END"
      00A6DB 00 0F                    6 	.word END_IDX 
      002A4E                       4731 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      00A6DD 72 5F                    1 	.word LINK 
                           002A50     2 	LINK=.
      002A50                          3 EEPROM:
      00A6DF 00                       4 	.byte 6+F_IFUNC 	
      00A6E0 0E 72 BB 00 0E 20        5 	.ascii "EEPROM"
      00A6E6 E4 2C                    6 	.word EEPROM_IDX 
      00A6E7                       4732 	_dict_entry,4,EDIT,EDIT_IDX ; edit 
      00A6E7 A6 0C                    1 	.word LINK 
                           002A5B     2 	LINK=.
      002A5B                          3 EDIT:
      00A6E9 CC                       4 	.byte 4 	
      00A6EA 91 D9 49 54              5 	.ascii "EDIT"
      00A6EC 00 2A                    6 	.word EDIT_IDX 
      002A62                       4733 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      00A6EC 52 06                    1 	.word LINK 
                           002A64     2 	LINK=.
      00A6EE                          3 DWRITE:
      00A6EE C6                       4 	.byte 6+F_CMD 	
      00A6EF 00 09 C1 00 0A 27        5 	.ascii "DWRITE"
      00A6F5 37 CD                    6 	.word DWRITE_IDX 
      002A6D                       4734 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      00A6F7 9A C2                    1 	.word LINK 
                           002A6F     2 	LINK=.
      002A6F                          3 DREAD:
      00A6F9 CE                       4 	.byte 5+F_IFUNC 	
      00A6FA 00 07 CF 00 05           5 	.ascii "DREAD"
      00A6FF 55 00                    6 	.word DREAD_IDX 
      002A77                       4735 	_dict_entry,2,DO,DO_IDX;do_loop
      00A701 09 00                    1 	.word LINK 
                           002A79     2 	LINK=.
      002A79                          3 DO:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



      00A703 02                       4 	.byte 2 	
      00A704 55 00                    5 	.ascii "DO"
      00A706 0A 00                    6 	.word DO_IDX 
      002A7E                       4736 	_dict_entry,3,DEC,DEC_IDX;dec_base
      00A708 04 CD                    1 	.word LINK 
                           002A80     2 	LINK=.
      002A80                          3 DEC:
      00A70A 97                       4 	.byte 3 	
      00A70B 78 A1 84                 5 	.ascii "DEC"
      00A70E 27 03                    6 	.word DEC_IDX 
      002A86                       4737 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      00A710 CC 91                    1 	.word LINK 
                           002A88     2 	LINK=.
      002A88                          3 DDR:
      00A712 D7                       4 	.byte 3+F_IFUNC 	
      00A713 44 44 52                 5 	.ascii "DDR"
      00A713 1F 05                    6 	.word DDR_IDX 
      002A8E                       4738 	_dict_entry,4,DATA,DATA_IDX;data  
      00A715 CD 92                    1 	.word LINK 
                           002A90     2 	LINK=.
      002A90                          3 DATA:
      00A717 CF                       4 	.byte 4 	
      00A718 CE 00 05 CF              5 	.ascii "DATA"
      00A71C 00 07                    6 	.word DATA_IDX 
      002A97                       4739 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      00A71E 55 00                    1 	.word LINK 
                           002A99     2 	LINK=.
      002A99                          3 CRL:
      00A720 02                       4 	.byte 3+F_IFUNC 	
      00A721 00 09 CD                 5 	.ascii "CRL"
      00A724 9A D2                    6 	.word CRL_IDX 
      002A9F                       4740 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      00A726 1E 05                    1 	.word LINK 
                           002AA1     2 	LINK=.
      002AA1                          3 CRH:
      00A728 A6                       4 	.byte 3+F_IFUNC 	
      00A729 84 5B 06                 5 	.ascii "CRH"
      00A72C 81 1A                    6 	.word CRH_IDX 
      00A72D                       4741 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      00A72D 90 CE                    1 	.word LINK 
                           002AA9     2 	LINK=.
      002AA9                          3 CHAR:
      00A72F 00                       4 	.byte 4+F_CFUNC 	
      00A730 07 72 5F 00              5 	.ascii "CHAR"
      00A734 07 72                    6 	.word CHAR_IDX 
      002AB0                       4742 	_dict_entry,3,BYE,BYE_IDX;bye 
      00A736 5F 00                    1 	.word LINK 
                           002AB2     2 	LINK=.
      002AB2                          3 BYE:
      00A738 08                       4 	.byte 3 	
      00A739 72 5F 00                 5 	.ascii "BYE"
      00A73C 09 72                    6 	.word BYE_IDX 
      002AB8                       4743 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      00A73E 5F 00                    1 	.word LINK 
                           002ABA     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



      002ABA                          3 BTOGL:
      00A740 0A                       4 	.byte 5 	
      00A741 CD A6 D7 20 A8           5 	.ascii "BTOGL"
      00A746 00 14                    6 	.word BTOGL_IDX 
      002AC2                       4744 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      00A746 CD 96                    1 	.word LINK 
                           002AC4     2 	LINK=.
      002AC4                          3 BTEST:
      00A748 79                       4 	.byte 5+F_IFUNC 	
      00A749 A1 02 27 03 CC           5 	.ascii "BTEST"
      00A74E 91 D7                    6 	.word BTEST_IDX 
      00A750                       4745 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      00A750 72 12                    1 	.word LINK 
                           002ACE     2 	LINK=.
      002ACE                          3 BSET:
      00A752 50                       4 	.byte 4 	
      00A753 C7 85 5D 27              5 	.ascii "BSET"
      00A757 21 85                    6 	.word BSET_IDX 
      002AD5                       4746 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      00A759 A6 08                    1 	.word LINK 
                           002AD7     2 	LINK=.
      002AD7                          3 BRES:
      00A75B 42                       4 	.byte 4 	
      00A75C 9F C7 52 00              5 	.ascii "BRES"
      00A760 72 1A                    6 	.word BRES_IDX 
      002ADE                       4747 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      00A762 50 14                    1 	.word LINK 
                           002AE0     2 	LINK=.
      002AE0                          3 BIT:
      00A764 72                       4 	.byte 3+F_IFUNC 	
      00A765 1A 50 16                 5 	.ascii "BIT"
      00A768 72 14                    6 	.word BIT_IDX 
      002AE6                       4748 	_dict_entry,3,AWU,AWU_IDX;awu 
      00A76A 52 00                    1 	.word LINK 
                           002AE8     2 	LINK=.
      002AE8                          3 AWU:
      00A76C 72                       4 	.byte 3 	
      00A76D 12 52 01                 5 	.ascii "AWU"
      00A770 72 10                    6 	.word AWU_IDX 
      002AEE                       4749 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      00A772 52 01                    1 	.word LINK 
                           002AF0     2 	LINK=.
      002AF0                          3 ASC:
      00A774 72                       4 	.byte 3+F_IFUNC 	
      00A775 1C 52 00                 5 	.ascii "ASC"
      00A778 81 08                    6 	.word ASC_IDX 
      00A779                       4750 	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
      00A779 5B 02                    1 	.word LINK 
                           002AF8     2 	LINK=.
      002AF8                          3 AND:
      00A77B A6                       4 	.byte 3+F_IFUNC 	
      00A77C 82 C4 52                 5 	.ascii "AND"
      00A77F 03 A1                    6 	.word AND_IDX 
      002AFE                       4751 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      00A781 02 26                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



                           002B00     2 	LINK=.
      002B00                          3 ADCREAD:
      00A783 F7                       4 	.byte 7+F_IFUNC 	
      00A784 72 1D 52 00 72 13 50     5 	.ascii "ADCREAD"
      00A78B C7 72                    6 	.word ADCREAD_IDX 
      002B0A                       4752 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      00A78D 1B 50                    1 	.word LINK 
                           002B0C     2 	LINK=.
      002B0C                          3 ADCON:
      00A78F 16                       4 	.byte 5 	
      00A790 81 44 43 4F 4E           5 	.ascii "ADCON"
      00A791 00 02                    6 	.word ADCON_IDX 
      002B14                       4753 kword_dict::
      002B14                       4754 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      00A791 A6 78                    1 	.word LINK 
                           002B16     2 	LINK=.
      002B16                          3 ABS:
      00A793 C5                       4 	.byte 3+F_IFUNC 	
      00A794 52 03 27                 5 	.ascii "ABS"
      00A797 04 72                    6 	.word ABS_IDX 
                                   4755 
                                   4756 ;comands and fonctions address table 	
      002B1C                       4757 code_addr::
      00A799 5F 52 03 81 1E C4 22  4758 	.word abs,power_adc,analog_read,bit_and,ascii,awu,bitmask ; 0..7
             DB 21 B8 22 78 25 29
      00A79D 1B 17 1B 07 1B 38 1B  4759 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             28 22 51 21 A6 25 E3
      00A79D 88 CD A7 91 84 72 03  4760 	.word const_cr1,data,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
             52 03 FB C7 52 04 72
      00A7AB 01 52 03 FB C6 52 04  4761 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto,gpio ; 24..31 
             81 23 55 20 80 1B 93
             1D 78 1D 5E 21 F4
      00A7B3 17 DA 25 D1 1B 7F 1A  4762 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             62 25 43 24 D3 25 09
             21 DF
      00A7B3 A6 FF 72 01 52 03 E3  4763 	.word let,list,log2,lshift,muldiv,next,new ; 40..47
             C6 52 04 81 13 1F AF
      00A7BE 24 C6 25 CB 22 F3 27  4764 	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             7D 22 65 23 61 1B 6E
             25 EF
      00A7BE CD 97 78 A1 84 27 03  4765 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             CC 91 D7 25 A1 25 A7
             25 AD
      00A7C8 25 B3 25 B9 25 BF 25  4766 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             C5 21 E7 26 6C 0E D1
             1A DC
      00A7C8 9F CD A7 9D CD 92 CF  4767 	.word restore,return, random,rshift,run,show,free ; 72..79
             A1 09 26 02 20 E9 4D
      00A7D6 27 05 55 00 03 00 02  4768 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             81 27 3E 1B EC 1F 63
             22 C1
      00A7DE 24 AA 24 B9 1B BC 1E  4769 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             44 18 2A 22 1E 25 67
             22 34
      00A7DE CD A7 B3 5F 97 A6 84  4770 	.word wait,words,write,bit_xor,cmd_size,cmd_on,cmd_get ; 96..99
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal  81-Bits]



             0B 17 FD 1C D5 1E 19
      00A7E6 00 00                 4771 	.word 0 
                                   4772 
                                   4773 
                                   4774 
                                   4775 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
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
      00A7E6 CD 92                   31 app_sign: .word 0 ; .ascii "BC"  ; signature 
      00A7E8 CF A1                   32 app_size: .word 0 ; 31 
      002C04                         33 app: 
                                     34 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     35 ;;  BASIC code demo 'BLINK.BAS' 
                                     36 ;; 10 do btogl $500a,32 pause 250 until qkey bres $500a,32 end 
                                     37 ;; byte code generated by compiler.
                                     38 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     39 ;.byte 0,10,31,128,0,38,128,0,20,132,80,10,9,132,0,32,128
                                     40 ;.byte 0,100,132,0,250,128,0,182,129,0,132,128,0,46
                                     41 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   4 ABS        002B16 R   |     ABS_IDX =  000000 
    ACC24   =  000007     |     ACK     =  000006     |   4 ADCON      002B0C R
    ADCON_ID=  000002     |   4 ADCREAD    002B00 R   |     ADCREAD_=  000004 
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
  4 AND        002AF8 R   |     AND_IDX =  000006     |     AREG    =  000002 
    ARG_OFS =  000002     |     ARROW_LE=  000080     |     ARROW_RI=  000081 
  4 ASC        002AF0 R   |     ASC_IDX =  000008     |     ATTRIB  =  000002 
    AUTORUN_=  004000     |   4 AUTO_RUN   000F8E R   |   4 AWU        002AE8 R
  4 AWUHandl   000001 R   |     AWU_APR =  0050F1     |     AWU_CSR =  0050F0 
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
  4 BIT        002AE0 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
    BIT_IDX =  00000C     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  00000B     |   4 BRES       002AD7 R
    BRES_IDX=  00000E     |     BS      =  000008     |     BSAVE   =  000001 
  4 BSET       002ACE R   |     BSET_IDX=  000010     |     BSIZE   =  000006 
  4 BTEST      002AC4 R   |     BTEST_ID=  000012     |   4 BTOGL      002ABA R
    BTOGL_ID=  000014     |     BTW     =  000001     |   4 BYE        002AB2 R
    BYE_IDX =  000016     |     C       =  000001     |     CAN     =  000018 
  4 CANT_DO    002117 R   |     CAN_DGR =  005426     |     CAN_FPSR=  005427 
    CAN_IER =  005425     |     CAN_MCR =  005420     |     CAN_MSR =  005421 
    CAN_P0  =  005428     |     CAN_P1  =  005429     |     CAN_P2  =  00542A 
    CAN_P3  =  00542B     |     CAN_P4  =  00542C     |     CAN_P5  =  00542D 
    CAN_P6  =  00542E     |     CAN_P7  =  00542F     |     CAN_P8  =  005430 
    CAN_P9  =  005431     |     CAN_PA  =  005432     |     CAN_PB  =  005433 
    CAN_PC  =  005434     |     CAN_PD  =  005435     |     CAN_PE  =  005436 
    CAN_PF  =  005437     |     CAN_RFR =  005424     |     CAN_TPR =  005423 
    CAN_TSR =  005422     |     CCOMMA  =  000001     |     CC_C    =  000000 
    CC_H    =  000004     |     CC_I0   =  000003     |     CC_I1   =  000005 
    CC_N    =  000002     |     CC_V    =  000007     |     CC_Z    =  000001 
    CELL_SIZ=  000002     |     CFG_GCR =  007F60     |     CFG_GCR_=  000001 
    CFG_GCR_=  000000     |   4 CHAR       002AA9 R   |     CHAR_IDX=  000018 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]

Symbol Table

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
    CLK_SWR_=  0000B4     |     CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2 
    CMDX    =  000001     |     CMD_END =  000002     |     CNT     =  000006 
    CNTR    =  000003     |     CNT_LO  =  000004     |     COMMA   =  00002C 
    COUNT   =  000003     |     CPOS    =  000003     |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |     CR      =  00000D     |   4 CRH        002AA1 R
    CRH_IDX =  00001A     |   4 CRL        002A99 R   |     CRL_IDX =  00001C 
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
    CX_CNT  =  000004     |     CX_IN   =  000003     |   4 DATA       002A90 R
    DATA_IDX=  00001E     |     DBG_A   =  000005     |     DBG_CC  =  000006 
    DBG_X   =  000003     |     DBG_Y   =  000001     |     DBL     =  000003 
    DBLDIVDN=  000006     |     DBLHI   =  000001     |     DBLLO   =  000003 
    DBL_SIZE=  000004     |     DC1     =  000011     |     DC2     =  000012 
    DC3     =  000013     |     DC4     =  000014     |   4 DDR        002A88 R
    DDR_IDX =  000020     |     DEBUG   =  000000     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |     DEBUG_PR=  000001     |   4 DEC        002A80 R
    DEC_IDX =  000022     |     DEST    =  000001     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |     DIVDNDHI=  00000B     |     DIVDNDLO=  00000D 
    DIVISOR =  000001     |     DIVISR  =  000007     |     DIVSOR  =  000001 
    DLE     =  000010     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  4 DO         002A79 R   |     DOLP_ADR=  000003     |     DOLP_INW=  000005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]

Symbol Table

    DO_IDX  =  000024     |   4 DREAD      002A6F R   |     DREAD_ID=  000026 
  4 DWRITE     002A64 R   |     DWRITE_I=  000028     |   4 EDIT       002A5B R
    EDIT_IDX=  00002A     |   4 EEPROM     002A50 R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_I=  00002C     |     EEPROM_S=  000800 
    EM      =  000019     |   4 END        002A48 R   |     END_IDX =  00002E 
    ENQ     =  000005     |     EOF     =  0000FF     |     EOT     =  000004 
  4 ERASE      002A3E R   |     ERASE_ID=  000030     |     ERR_BAD_=  00000A 
    ERR_BUF_=  00000F     |     ERR_CMD_=  000007     |     ERR_DIV0=  000004 
    ERR_DUPL=  000008     |     ERR_MATH=  000003     |     ERR_MEM_=  000001 
    ERR_NONE=  000000     |     ERR_NOT_=  000009     |     ERR_NO_A=  00000B 
    ERR_NO_D=  00000C     |     ERR_NO_F=  00000E     |     ERR_NO_L=  000005 
    ERR_NO_P=  00000D     |     ERR_RUN_=  000006     |     ERR_SYNT=  000002 
    ESC     =  00001B     |     ETB     =  000017     |     ETX     =  000003 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |     FAUTORUN=  000006 
    FBREAK  =  000004     |     FCOMP   =  000005     |   4 FCPU       002A35 R
    FCPU_IDX=  000032     |     FF      =  00000C     |     FHSE    =  7A1200 
    FHSI    =  F42400     |     FIRST   =  000001     |     FIRST_DA=  000006 
    FLASH_BA=  008000     |     FLASH_CR=  00505A     |     FLASH_CR=  000002 
    FLASH_CR=  000000     |     FLASH_CR=  000003     |     FLASH_CR=  000001 
    FLASH_CR=  00505B     |     FLASH_CR=  000005     |     FLASH_CR=  000004 
    FLASH_CR=  000007     |     FLASH_CR=  000000     |     FLASH_CR=  000006 
    FLASH_DU=  005064     |     FLASH_DU=  0000AE     |     FLASH_DU=  000056 
    FLASH_EN=  027FFF     |     FLASH_FP=  00505D     |     FLASH_FP=  000000 
    FLASH_FP=  000001     |     FLASH_FP=  000002     |     FLASH_FP=  000003 
    FLASH_FP=  000004     |     FLASH_FP=  000005     |     FLASH_IA=  00505F 
    FLASH_IA=  000003     |     FLASH_IA=  000002     |     FLASH_IA=  000006 
    FLASH_IA=  000001     |     FLASH_IA=  000000     |   4 FLASH_ME   0018CF R
    FLASH_NC=  00505C     |     FLASH_NF=  00505E     |     FLASH_NF=  000000 
    FLASH_NF=  000001     |     FLASH_NF=  000002     |     FLASH_NF=  000003 
    FLASH_NF=  000004     |     FLASH_NF=  000005     |     FLASH_PU=  005062 
    FLASH_PU=  000056     |     FLASH_PU=  0000AE     |     FLASH_SI=  020000 
    FLASH_WS=  00480D     |     FLOOP   =  000002     |     FLSI    =  01F400 
  4 FOR        002A2D R   |     FOR_IDX =  000036     |   4 FREE       002A24 R
    FREE_IDX=  000098     |     FRUN    =  000000     |     FS      =  00001C 
    FSLEEP  =  000003     |     FSTEP   =  000003     |     FTRAP   =  000001 
    F_CFUNC =  000080     |     F_CMD   =  000000     |     F_CONST =  0000C0 
    F_IFUNC =  000040     |   4 GET        002A1C R   |     GET_IDX =  0000C6 
  4 GOSUB      002A12 R   |     GOSUB_ID=  000038     |   4 GOTO       002A09 R
    GOTO_IDX=  00003A     |   4 GPIO       002A00 R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_IDX=  00003C     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |     GS      =  00001D     |   4 HEX        0029F8 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
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
  4 IDR        0029F0 R   |     IDR_IDX =  000040     |   4 IF         0029E9 R
    IF_IDX  =  000042     |     IN      =  000005     |     INCR    =  000001 
    INP     =  000000     |   4 INPUT      0029DF R   |     INPUT_DI=  000000 
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
    INT_VECT=  00805C     |     INT_VECT=  008058     |   4 INVERT     0029D4 R
    INVERT_I=  000046     |     INW     =  000009     |     IPOS    =  000001 
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |   4 IWDGEN     0029C9 R
    IWDGEN_I=  000048     |   4 IWDGREF    0029BD R   |     IWDGREF_=  00004A 
    IWDG_KEY=  000055     |     IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
    KCHAR   =  000002     |   4 KEY        0029B5 R   |     KEY_END =  000083 
    KEY_IDX =  00004C     |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000002     |   4 LET        0029AD R   |     LET_IDX =  00004E 
    LF      =  00000A     |     LIMIT   =  000001     |     LINENO  =  000005 
  4 LINK    =  002B16 R   |   4 LIST       0029A4 R   |     LIST_IDX=  000050 
    LL      =  000001     |     LLEN    =  000002     |     LL_HB   =  000001 
    LN_PTR  =  000005     |   4 LOG        00299C R   |     LOG_IDX =  000052 
  4 LSHIFT     002991 R   |     LSHIFT_I=  000054     |     MAJOR   =  000002 
    MASK    =  000002     |     MATH_OVF=  000000     |     MAX_LINE=  007FFF 
    MINOR   =  000000     |   4 MULDIV     002986 R   |     MULDIV_I=  000056 
    MULOP   =  000003     |     N1      =  000001     |     N2      =  000003 
    NAFR    =  004804     |     NAK     =  000015     |     NCLKOPT =  004808 
    NEG     =  000001     |   4 NEW        00297E R   |     NEW_IDX =  00005A 
  4 NEXT       002975 R   |     NEXT_IDX=  000058     |     NFLASH_W=  00480E 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]

Symbol Table

    NHSECNT =  00480A     |     NLEN    =  000001     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   4 NOT        00296D R   |     NOT_IDX =  00005C 
  4 NOT_SAVE   0019A5 R   |   4 NO_APP     002159 R   |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   4 NonHandl   000000 R
  4 ODR        002965 R   |     ODR_IDX =  00005E     |   4 ON         00295E R
    ONOFF   =  000003     |     ON_IDX  =  0000C4     |     OP      =  000005 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   4 OR         002957 R   |     OR_IDX  =  000060 
    OUTP    =  000001     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVFH    =  000001 
    OVFL    =  000002     |     OVRWR   =  000004     |     PA      =  000000 
  4 PAD        00294F R   |     PAD_IDX =  000062     |     PAD_SIZE=  000080 
  4 PAUSE      002945 R   |     PAUSE_ID=  000064     |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  4 PEEK       00293C R   |     PEEK_IDX=  000068     |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
    PG_ODR  =  00501E     |     PH      =  000023     |     PH_BASE =  005023 
    PH_CR1  =  005026     |     PH_CR2  =  005027     |     PH_DDR  =  005025 
    PH_IDR  =  005024     |     PH_ODR  =  005023     |     PI      =  000028 
    PINNO   =  000001     |   4 PINP       002933 R   |     PINP_IDX=  00006A 
    PINVAL  =  000002     |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   4 PMODE      002929 R   |     PMODE_ID=  000066 
  4 POKE       002920 R   |     POKE_IDX=  00006C     |     PORT    =  000003 
  4 POUT       002917 R   |     POUT_IDX=  00006E     |     PREV    =  000001 
  4 PRINT      00290D R   |   4 PROG_ADD   0018A6 R   |   4 PROG_SIZ   0018B8 R
  4 PRTA       002904 R   |     PRTA_IDX=  000072     |   4 PRTB       0028FB R
    PRTB_IDX=  000074     |   4 PRTC       0028F2 R   |     PRTC_IDX=  000076 
  4 PRTD       0028E9 R   |     PRTD_IDX=  000078     |   4 PRTE       0028E0 R
    PRTE_IDX=  00007A     |   4 PRTF       0028D7 R   |     PRTF_IDX=  00007C 
  4 PRTG       0028CE R   |     PRTG_IDX=  00007E     |   4 PRTH       0028C5 R
    PRTH_IDX=  000080     |   4 PRTI       0028BC R   |     PRTI_IDX=  000082 
    PRT_IDX =  000070     |     PSTR    =  000003     |   4 QKEY       0028B3 R
    QKEY_IDX=  000084     |     RAM_BASE=  000000     |     RAM_END =  0017FF 
  4 RAM_MEM    0018E0 R   |     RAM_SIZE=  001800     |     RBT_IDX =  000088 
  4 READ       0028AA R   |     READ_IDX=  000086     |   4 REBOOT     00289F R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]

Symbol Table

    REG     =  000001     |     REGA    =  000001     |     REGX    =  000003 
    REGY    =  000005     |     RELOP   =  000003     |   4 REMARK     002894 R
    REM_IDX =  00008A     |   4 RESTORE    002888 R   |     REST_IDX=  00008C 
    RETL1   =  000001     |   4 RETURN     00287D R   |     RET_ADDR=  000003 
    RET_IDX =  00008E     |     RET_INW =  000005     |   4 RND        002875 R
    RND_IDX =  000090     |     ROP     =  004800     |     RS      =  00001E 
  4 RSHIFT     00286A R   |     RSHIFT_I=  000092     |     RST_SR  =  0050B3 
  4 RUN        002862 R   |     RUN_IDX =  000094     |     RXCHAR  =  000001 
    RX_QUEUE=  000008     |   4 SAVE       002859 R   |     SAVEB   =  000002 
    SAVE_IDX=  000034     |     SDIVSR  =  000005     |     SEPARATE=  000000 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
  4 SHOW       002850 R   |     SHOW_IDX=  000096     |     SI      =  00000F 
    SIGN    =  000001     |   4 SIGNATUR   002115 R   |   4 SIZE       002847 R
    SIZE_IDX=  0000C2     |     SKIP    =  000005     |   4 SLEEP      00283D R
    SLEEP_ID=  00009A     |     SO      =  00000E     |     SOH     =  000001 
    SPACE   =  000020     |   4 SPIEN      002833 R   |     SPIEN_ID=  00009E 
  4 SPIRD      002829 R   |     SPIRD_ID=  00009C     |   4 SPISEL     00281E R
    SPISEL_I=  0000A0     |   4 SPIWR      002814 R   |     SPIWR_ID=  0000A2 
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
  4 STEP       00280B R   |     STEP_IDX=  0000A4     |   4 STOP       002802 R
    STOP_IDX=  0000A6     |     STR     =  000003     |   4 STR_BYTE   0018C9 R
    STX     =  000002     |     SUB     =  00001A     |     SUP     =  000084 
    SWIM_CSR=  007F80     |     SYN     =  000016     |     TAB     =  000009 
    TABW    =  000004     |     TAB_WIDT=  000004     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  4 TICKS      0027F8 R   |     TICKS_ID=  0000A8     |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_EGR=  005343     |     TIM4_EGR=  000000     |     TIM4_IER=  005341 
    TIM4_IER=  000000     |     TIM4_PSC=  005345     |     TIM4_PSC=  000000 
    TIM4_PSC=  000007     |     TIM4_PSC=  000004     |     TIM4_PSC=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_PSC=  000005     |     TIM4_PSC=  000002     |     TIM4_PSC=  000006 
    TIM4_PSC=  000003     |     TIM4_PSC=  000000     |     TIM4_PSC=  000001 
    TIM4_PSC=  000002     |     TIM4_SR =  005342     |     TIM4_SR_=  000000 
  4 TIMEOUT    0027EC R   |   4 TIMER      0027E2 R   |     TIMER_ID=  0000AA 
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
    TK_TARGE=  000004     |     TK_VAR  =  000085     |     TMROUT_I=  0000AC 
  4 TO         0027DB R   |   4 TONE       0027D2 R   |     TONE_IDX=  0000B0 
    TOWRITE =  000005     |     TO_IDX  =  0000AE     |   4 Timer4Up   00000F R
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
    UART_SR_=  000007     |     UBC     =  004801     |   4 UBOUND     0027C7 R
    UBOUND_I=  0000B2     |   4 UBTN_Han   000048 R   |   4 UFLASH     0027BC R
    UFLASH_I=  0000B4     |   4 UNTIL      0027B2 R   |     UNTIL_ID=  0000B6 
    US      =  00001F     |   4 USER_ABO   00005B R   |   4 USR        0027AA R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]

Symbol Table

    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    USR_IDX =  0000B8     |   4 Uart1RxH   00027F R   |   4 UserButt   000024 R
    VAR_ADDR=  000006     |     VSISE   =  000003     |     VSIZ    =  000002 
    VSIZE   =  000006     |     VT      =  00000B     |   4 WAIT       0027A1 R
    WAIT_IDX=  0000BA     |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  4 WORDS      002797 R   |     WORDS_ID=  0000BC     |   4 WRITE      00278D R
    WRITE_ID=  0000BE     |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XFIRST  =  000001     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   4 XOR        002785 R   |     XOR_IDX =  0000C0 
    XREG    =  000003     |     XSAVE   =  000005     |     XTEMP   =  000001 
    YSAVE   =  000004     |   4 abs        0022C7 R   |   5 acc16      00000D GR
  5 acc24      00000C GR  |   5 acc32      00000B R   |   5 acc8       00000E GR
  4 accept_c   0005BA R   |   4 add_char   000D0D R   |   4 add_spac   000B03 R
  4 analog_r   001EC4 R   |   4 app        002C04 R   |   4 app_sign   002C00 R
  4 app_size   002C02 R   |   4 app_spac   002C00 GR  |   4 arduino_   0023BD R
  4 arg_list   0015F9 R   |   5 array_si   00001F R   |   4 ascii      0021B8 R
  4 at_tst     000971 R   |   4 atoi24     0013B3 GR  |   4 atoi_exi   001419 R
  4 awu        002278 R   |   4 awu02      002282 R   |   4 bad_port   002219 R
  5 base       00000A GR  |   5 basicptr   000004 GR  |   4 beep       001E51 R
  4 beep_1kh   001E3B GR  |   4 bin_exit   0007ED R   |   4 bit_and    0022DB R
  4 bit_or     0022F3 R   |   4 bit_rese   001B17 R   |   4 bit_set    001B07 R
  4 bit_test   001B38 R   |   4 bit_togg   001B28 R   |   4 bit_xor    00230B R
  4 bitmask    002529 R   |   4 bkslsh_t   00091E R   |   4 bksp       000358 R
  2 block_bu   0016E0 GR  |   4 block_er   00018F R   |   4 break_po   001F91 R
  4 bye        002251 R   |   4 char       0021A6 R   |   4 clear_ba   000FBF R
  4 clear_bl   00206C R   |   4 clear_va   000E7C R   |   4 clock_in   000076 R
  4 cmd_end    001E12 R   |   4 cmd_get    001E19 R   |   4 cmd_line   0011DE R
  4 cmd_name   000D2D R   |   4 cmd_on     001CD5 R   |   4 cmd_size   0017FD R
  4 code_add   002B1C GR  |   4 cold_sta   000ED1 R   |   4 colon_ts   000945 R
  4 comma_ts   000950 R   |   4 comp_msg   001136 R   |   4 compile    000A76 GR
  4 const_cr   0025DD R   |   4 const_cr   0025E3 R   |   4 const_dd   0025D7 R
  4 const_ee   0025F5 R   |   4 const_id   0025D1 R   |   4 const_in   0025EF R
  4 const_od   0025CB R   |   4 const_ou   0025E9 R   |   4 const_po   002595 R
  4 const_po   00259B R   |   4 const_po   0025A1 R   |   4 const_po   0025A7 R
  4 const_po   0025AD R   |   4 const_po   0025B3 R   |   4 const_po   0025B9 R
  4 const_po   0025BF R   |   4 const_po   0025C5 R   |   4 convert_   000764 R
  4 convert_   00031C R   |   4 copy_com   0009A6 R   |   5 count      000003 GR
  4 cp_loop    0015A8 R   |   4 cpy_cmd_   000AEE R   |   4 cpy_quot   000B27 R
  4 create_g   00068E R   |   4 cs_high    002778 R   |   4 cstk_pro   0017B3 R
  4 dash_tst   000966 R   |   4 data       0025FB R   |   5 data_len   000009 R
  4 data_lin   00260A R   |   5 data_ofs   000008 R   |   5 data_ptr   000006 R
  4 data_sea   00264B R   |   4 dbl_sign   001502 R   |   4 dec_base   0017DF R
  4 decomp_l   000BD8 R   |   4 decompil   000B91 GR  |   4 del_line   000661 R
  4 delete_l   000445 R   |   4 delete_n   000368 R   |   4 delete_u   00040A R
  4 digital_   001EF8 R   |   4 digital_   001F28 R   |   4 div32_16   00150C R
  4 divide     001563 R   |   4 divu24_8   001322 R   |   4 dneg       0014F7 R
  4 do_loop    002552 R   |   4 do_progr   000182 R   |   4 edit       001978 R
  4 eefree     00026C R   |   4 enable_i   0024D3 R   |   4 eql_tst    0009FB R
  4 equal      000D20 R   |   4 erase      001FF0 R   |   4 erase_ex   0001AE R
  4 erase_fl   0001A4 R   |   4 err_bad_   0010A1 R   |   4 err_buf_   001117 R
  4 err_cmd_   001065 R   |   4 err_div0   00102A R   |   4 err_dupl   00107F R
  4 err_math   001011 R   |   4 err_mem_   000FF6 R   |   4 err_msg    000FD6 R
  4 err_no_a   0010AD R   |   4 err_no_d   0010E0 R   |   4 err_no_f   001104 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]

Symbol Table

  4 err_no_l   001039 R   |   4 err_no_p   0010F0 R   |   4 err_not_   001090 R
  4 err_run_   00104F R   |   4 err_synt   001003 R   |   4 escaped    000779 GR
  4 expect     0015E7 R   |   4 expr_exi   00173E R   |   4 expressi   0016F8 R
  4 factor     001649 R   |   5 farptr     000017 R   |   4 fcpu       002355 R
  4 fill_wri   00205C R   |   4 final_te   0005B3 R   |   4 first_li   001922 R
  5 flags      000021 GR  |   4 for        001B93 R   |   4 free       0017E4 R
  5 free_eep   00002D R   |   7 free_ram   000080 R   |   4 func_arg   0015F4 R
  4 func_not   0024C6 R   |   4 ge         000D22 R   |   4 get_arra   001624 R
  4 get_cmd_   000B70 R   |   4 get_esca   000328 R   |   4 get_targ   001C5D R
  4 get_targ   001C6B R   |   4 get_tick   0022C1 R   |   4 get_toke   0008B7 GR
  4 getc       000301 GR  |   4 gosub      001D78 R   |   4 goto       001D5E R
  4 gpio       0021F4 R   |   4 gt         000D1E R   |   4 gt_tst     000A06 R
  4 hex_base   0017DA R   |   4 hex_dump   000DCD R   |   4 if         001B7F R
  5 in         000001 GR  |   5 in.saved   000002 GR  |   5 in.w       000000 GR
  4 incr_far   001FD4 R   |   4 input_ex   001AD9 R   |   4 input_lo   001A64 R
  4 input_va   001A62 R   |   4 insert_c   0003C7 R   |   4 insert_l   0006BA R
  4 insert_l   000729 R   |   4 interp_l   00121F R   |   4 interpre   0011FA R
  4 invert     002543 R   |   4 is_alnum   000822 GR  |   4 is_alpha   000808 GR
  4 is_data_   002601 R   |   4 is_digit   000819 GR  |   4 is_symbo   00082B R
  4 itoa       0012B7 GR  |   4 itoa_loo   0012DC R   |   4 jp_to_ta   001D6B R
  4 key        0021DF R   |   4 kword_di   002B14 GR  |   4 kword_en   002783 R
  4 le         000D27 R   |   4 leading_   002519 R   |   4 let        001834 GR
  4 let_arra   001842 R   |   4 let_var    001845 R   |   4 lines_sk   001925 R
  4 list       0018EF R   |   4 list_exi   001967 R   |   4 list_loo   001945 R
  4 log2       00250E R   |   4 logical_   0024BC R   |   4 long_div   0014DF R
  4 look_tar   001C87 R   |   4 loop_bac   001C40 R   |   5 loop_dep   00001E R
  4 loop_don   001C55 R   |   4 lshift     002323 R   |   4 lt         000D25 R
  4 lt_tst     000A2F R   |   4 modulo     001579 R   |   4 move       000E38 GR
  4 move_dow   000E57 R   |   4 move_era   000111 R   |   4 move_exi   000E78 R
  4 move_lef   00039F R   |   4 move_loo   000E5C R   |   4 move_prg   000151 R
  4 move_rig   0003AD R   |   4 move_up    000E49 R   |   4 mul_char   000D0F R
  4 muldiv     00157E R   |   4 multiply   0014AA R   |   4 mulu24_8   00134A R
  4 nbr_tst    0008EA R   |   4 ne         000D2A R   |   4 neg_acc2   001384 R
  4 new        001FAF R   |   4 next       001C13 R   |   4 next_lin   001202 R
  4 next_tok   00124F GR  |   4 no_match   0015BA R   |   4 other      000A58 R
  4 overwrit   0005DF R   |   2 pad        0016E0 GR  |   4 pad_ref    00277D R
  4 parse_bi   0007CB R   |   4 parse_in   000781 R   |   4 parse_ke   00084E R
  4 parse_qu   00072C R   |   4 parse_sy   000836 R   |   4 pause      002265 R
  4 pause02    00226F R   |   4 peek       001B6E R   |   4 pin_mode   002361 R
  4 plus_tst   0009CF R   |   4 poke       001B5F R   |   4 power_ad   001E88 R
  4 prcnt_ts   0009F0 R   |   4 print      0019DC R   |   4 print_ex   001A36 R
  4 print_he   000614 GR  |   4 print_in   00129B R   |   4 printxy    00141D R
  4 prog_siz   00185F R   |   4 program_   001867 R   |   4 program_   00012B R
  4 program_   000151 R   |   4 prt_basi   0019BC R   |   4 prt_loop   0019E0 R
  4 prt_tok    000D5F R   |   4 prti24     0012AB R   |   5 ptr16      000018 GR
  5 ptr8       000019 R   |   4 putc       0002F1 GR  |   4 puts       00034E GR
  4 qgetc      0002FA GR  |   4 qkey       0021E7 GR  |   4 qmark_ts   00097C R
  4 qsign      002055 R   |   4 random     0023DD R   |   4 read       00266C R
  4 read01     00266E R   |   4 readln     000453 GR  |   4 readln_l   000460 R
  4 readln_q   0005FC R   |   4 refresh_   002509 R   |   4 rel_exit   001796 R
  4 relation   001741 R   |   4 relop_st   000D12 R   |   4 remark     001ADC GR
  4 reset_co   0019DE R   |   4 rest_con   001A52 R   |   4 restore    00262C R
  4 restore_   002667 R   |   4 return     001D98 R   |   4 right_al   000B15 GR
  4 row_alig   001FB9 R   |   4 row_eras   0000E4 R   |   4 row_eras   000111 R
  4 row_loop   000DB0 R   |   4 rparnt_t   00093A R   |   4 rshift     00233C R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]

Symbol Table

  7 rsign      00007C R   |   7 rsize      00007E R   |   4 rt_msg     001124 R
  4 run        001DB6 R   |   4 run_app    000F73 R   |   4 run_it     001DE8 R
  4 run_it_0   001DEA R   |   5 rx1_head   00002B R   |   5 rx1_queu   000023 R
  5 rx1_tail   00002C R   |   4 save_app   002080 R   |   4 save_con   001A42 R
  4 scan_blo   001FE2 R   |   4 scan_fre   00024F GR  |   4 search_d   00159A GR
  4 search_e   0015E4 R   |   4 search_l   000636 GR  |   4 search_l   000645 R
  4 search_n   00159E R   |   5 seedx      000013 R   |   5 seedy      000015 R
  4 select_p   0023AD R   |   4 send_esc   000376 R   |   4 send_par   000381 R
  4 set_data   00261D R   |   4 set_time   0024AA R   |   4 sharp_ts   00095B R
  4 show       001799 R   |   4 show_row   000D9E R   |   4 single_c   000D08 R
  4 skip       0008A4 R   |   4 skip_lab   001CC6 R   |   4 slash_ts   0009E5 R
  4 sleep      00225A R   |   4 software   000E8B R   |   4 spaces     0003BB GR
  4 spi_clea   002711 R   |   4 spi_disa   0026F9 R   |   4 spi_enab   0026C6 R
  4 spi_rcv_   002733 R   |   4 spi_read   00275E R   |   4 spi_sele   002766 R
  4 spi_send   00271D R   |   4 spi_writ   00273E R   |   2 stack_fu   001760 GR
  2 stack_un   001800 R   |   4 star_tst   0009DA R   |   4 step       001BEC R
  4 stop       001F63 R   |   4 store_lo   001C00 R   |   4 str_matc   0015C7 R
  4 str_tst    0008DA R   |   4 strcmp     000E17 R   |   4 strcpy     000E28 GR
  4 strlen     000E0C GR  |   4 symb_loo   000837 R   |   4 syntax_e   001157 GR
  5 tab_widt   000022 GR  |   4 tb_error   001159 GR  |   4 term       0016A6 R
  4 term01     0016AE R   |   4 term_exi   0016F5 R   |   2 tib        001690 GR
  4 tick_tst   000994 R   |   5 ticks      00000F R   |   4 timeout    0024B9 R
  5 timer      000011 GR  |   4 timer2_i   00008C R   |   4 timer4_i   000099 R
  4 tk_id      001147 R   |   4 to         001BBC R   |   4 to_eepro   00017A R
  4 to_flash   00017F R   |   4 to_hex_c   00062B GR  |   4 to_upper   0013A7 GR
  4 token_ch   000A6F R   |   4 token_ex   000A73 R   |   4 token_ms   000D96 R
  4 tone       001E44 R   |   4 try_next   002657 R   |   5 txtbgn     00001A GR
  5 txtend     00001C GR  |   4 uart1_ge   000301 GR  |   4 uart1_in   0002AC R
  4 uart1_pu   0002F1 GR  |   4 uart1_qg   0002FA GR  |   4 uart1_se   0002BC R
  4 ubound     00182A R   |   4 udiv32_1   0014CD R   |   4 uflash     00221E R
  4 umstar     001470 R   |   4 unlock_e   0000AE R   |   4 unlock_f   0000C9 R
  4 until      002567 R   |   4 user_int   000037 R   |   4 usr        002234 R
  4 var_name   000B68 GR  |   5 vars       00002F GR  |   4 wait       001AE2 R
  4 warm_ini   000FA1 R   |   4 warm_sta   0011DB R   |   4 words      002444 R
  4 words_co   002494 R   |   4 write      00216F R   |   4 write_bl   00022A GR
  4 write_bu   00016B R   |   4 write_by   0001B0 R   |   4 write_ee   0001EC R
  4 write_ex   000225 R   |   4 write_fl   0001D6 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
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

