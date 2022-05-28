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
                           00003C    37         XSTACK_SIZE=CELL_SIZE*20 ; 20 * int24
                           001773    38         XSTACK_EMPTY=STACK_EMPTY-STACK_SIZE 
                           000000    39 	FRUN=0 ; flags run code in variable flags
                           000001    40 	FTRAP=1 ; inside trap handler 
                           000002    41 	FLOOP=2 ; FOR loop in preparation 
                           000003    42 	FSLEEP=3 ; halt produit par la commande SLEEP 
                           000004    43 	FBREAK=4 ; break point flag 
                           000005    44 	FCOMP=5  ; compiling flags 
                                     45 
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
                                     58 ;--------------------------------------
                                     59 ;   constantes related to Arduino 
                                     60 ;   API mapping 
                                     61 ;-------------------------------------
                           000000    62         INP=0
                           000001    63         OUTP=1 
                                     64 
                                     65 ;--------------------------------------
                                     66 ;       token attribute
                                     67 ;--------------------------------------
                                     68         ; bits 4:5 identify token group 
                                     69         ; 0x0n -> miscelinous 
                                     70         ; 0x1n -> +|- operators 
                                     71         ; 0x2n -> *|/|% operators
                                     72         ; 0x3n -> relational operators 
                           000080    73         TK_CMD=128      ; BASIC command   
                           000081    74         TK_IFUNC=129    ; BASIC integer function
                           000082    75         TK_CFUNC=130    ; BASIC character function
                           000083    76         TK_CONST=131    ; BASIC constant 
                           000084    77         TK_INTGR=132    ; 16 bits integer 
                           000085    78         TK_VAR=133
                           000086    79         TK_FLOAT=134    ; float32 
                           000087    80         TK_NOT=135
                           000088    81         TK_AND=136      ;
                           000089    82         TK_OR=137       ;
                           00008A    83         TK_XOR=138      ; 
                           000000    84         TK_NONE=0       ; not a token 
                           000002    85         TK_QSTR=2       ; quoted string  
                           000003    86         TK_LABEL=3      ; used for defined, constants, variables
                           000004    87         TK_CHAR=4       ; ASCII character 
                           000005    88         TK_ARRAY=5     ; array variable '@' 
                           000006    89         TK_LPAREN=6     ; left parenthesis '('
                           000007    90         TK_RPAREN=7     ; right parenthesis ')'
                           000008    91         TK_COMMA=8     ; item separator ',' 
                           000009    92         TK_SHARP=9     ; print colon width '#' 
                           00000A    93         TK_COLON=0xa      ; command separator ':' 
                                     94         
                           000010    95         TK_PLUS=0x10    ; addition operator '+'
                           000011    96         TK_MINUS=0x11   ; subtraction operator '-'
                           000020    97         TK_MULT=0x20    ; multiplication operator '*'
                           000021    98         TK_DIV=0x21     ; division operator '/'
                           000022    99         TK_MOD=0x22     ; modulo operator '%'
                                    100 
                                    101         ; don't change these token values 
                                    102         ; values chosen to be used as a mask.
                                    103         ; bit 7   1 for dictionary words else 0 
                                    104         ; bits 6  always 0 
                                    105         ; bits 5:4 identify group 
                                    106         ; bits 3:0 token identifier inside group  
                           000031   107         TK_GT=0x31      ; relation operator '>'
                           000032   108         TK_EQUAL=0x32   ; assignment or relation operator '='
                           000033   109         TK_GE=0x33      ; relation operator '>='
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                           000034   110         TK_LT=0x34      ; relation operator '<'
                           000036   111         TK_LE=0x36      ; relation operator '<='
                           000035   112         TK_NE=0x35      ; relation operator '<>' not equal 
                                    113         ; token groups 
                           000030   114         TK_GRP_MASK=0x30 ; groups bits selector 
                           000000   115         TK_GRP_MISC=0x00 ; miscelinous group 
                           000010   116         TK_GRP_ADD=0x10  ; additive operators
                           000020   117         TK_GRP_MULT=0x20 ; multiplicative operators
                           000030   118         TK_GRP_RELOP=0x30 ;relational operators. 
                           000002   119         CMD_END=2 
                                    120 
                                    121 ;--------------------------------------
                                    122 ;   error codes 
                                    123 ;--------------------------------------
                           000000   124     ERR_NONE=0
                           000001   125     ERR_MEM_FULL=1 
                           000002   126     ERR_SYNTAX=2
                           000003   127     ERR_MATH_OVF=3
                           000004   128     ERR_DIV0=4 
                           000005   129     ERR_NO_LINE=5
                           000006   130     ERR_RUN_ONLY=6
                           000007   131     ERR_CMD_ONLY=7
                           000008   132     ERR_DUPLICATE=8
                           000009   133     ERR_NOT_FILE=9
                           00000A   134     ERR_BAD_VALUE=10
                           00000B   135     ERR_NO_ACCESS=11
                           00000C   136     ERR_NO_DATA=12 
                           00000D   137     ERR_NO_PROG=13
                           00000E   138     ERR_NO_FSPACE=14
                           00000F   139     ERR_BUF_FULL=15
                           000010   140     ERR_OVERFLOW=16 
                                    141 
                                    142 ;--------------------------------------
                                    143 ;   assembler flags 
                                    144 ;-------------------------------------
                                    145 ;    MATH_OVF=0 ; if 1 the stop on math overflow 
                                    146 
                                    147      .macro _usec_dly n 
                                    148     ldw x,#(16*n-2)/4
                                    149     decw x
                                    150     nop 
                                    151     jrne .-4
                                    152     .endm 
                                    153     
                                    154     ; load X register with 
                                    155     ; entry point of dictionary
                                    156     ; before calling 'search_dict'
                                    157     .macro _ldx_dict dict_name
                                    158     ldw x,#dict_name+2
                                    159     .endm 
                                    160 
                                    161     ; reset BASIC pointer
                                    162     ; to beginning of last token
                                    163     ; extracted except if it was end of line 
                                    164     .macro _unget_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                    165      mov in,in.saved  
                                    166     .endm
                                    167 
                                    168 
                                    169 ;---------------------------------------
                                    170 ;    xtack manipulation macros 
                                    171 ;    Y is used as xstack pointer  
                                    172 ;----------------------------------------
                                    173     ; pop in A:X from XSTACK 
                                    174     .macro _xpop 
                                    175     ld a,(y)
                                    176     ldw x,y 
                                    177     ldw x,(1,x)
                                    178     addw y,#CELL_SIZE 
                                    179     .endm 
                                    180 
                                    181     ; push A:X  to XSTACK 
                                    182     .macro _xpush 
                                    183     subw y,#CELL_SIZE
                                    184     ld (y),a 
                                    185     ldw (1,y),x 
                                    186     .endm 
                                    187 
                                    188     ; drop from XSTACK 
                                    189     .macro _xdrop 
                                    190     addw y,#CELL_SIZE 
                                    191     .endm 
                                    192 
                                    193     ; @T fetch top xstack 
                                    194     .macro _at_top
                                    195     ld a,(y)
                                    196     ldw x,y 
                                    197     ldw x,(1,x)
                                    198     .endm 
                                    199 
                                    200     ; @N  fetch next on xstack 
                                    201     .macro _at_next 
                                    202     ld a,(3,y)
                                    203     ldw x,y 
                                    204     ldw x,(4,x)
                                    205     .endm 
                                    206 
                                    207     ; !T put on top of xtack 
                                    208     .macro _store_top 
                                    209     ld (y),a 
                                    210     ldw (1,y),x     
                                    211     .endm 
                                    212 
                                    213     ; !N put next on xstack 
                                    214     .macro _store_next 
                                    215     ld (3,y),a 
                                    216     ldw (4,y),x 
                                    217     .endm 
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
                           000006    28     ASC_IDX=ADCREAD_IDX+2     ;
                           000008    29     AWU_IDX=ASC_IDX+2 
                           00000A    30     BIT_IDX=AWU_IDX+2
                           00000C    31     BRES_IDX=BIT_IDX+2
                           00000E    32     BSET_IDX=BRES_IDX+2
                           000010    33     BTEST_IDX=BSET_IDX+2
                           000012    34     BTOGL_IDX=BTEST_IDX+2
                           000014    35     BYE_IDX=BTOGL_IDX+2
                           000016    36     CHAR_IDX=BYE_IDX+2
                           000018    37     CR2_IDX=CHAR_IDX+2
                           00001A    38     CR1_IDX=CR2_IDX+2
                           00001C    39     DATA_IDX=CR1_IDX+2
                           00001E    40     DDR_IDX=DATA_IDX+2
                           000020    41     DEC_IDX=DDR_IDX+2
                           000022    42     DO_IDX=DEC_IDX+2
                           000024    43     DREAD_IDX=DO_IDX+2
                           000026    44     DWRITE_IDX=DREAD_IDX+2
                           000028    45     EDIT_IDX=DWRITE_IDX+2
                           00002A    46     EEPROM_IDX=EDIT_IDX+2
                           00002C    47     END_IDX=EEPROM_IDX+2
                           00002E    48     ERASE_IDX=END_IDX+2
                           000030    49     FCPU_IDX=ERASE_IDX+2
                           000032    50     SAVE_IDX=FCPU_IDX+2
                           000034    51     FOR_IDX=SAVE_IDX+2
                           000036    52     GOSUB_IDX=FOR_IDX+2
                           000038    53     GOTO_IDX=GOSUB_IDX+2
                           00003A    54     HEX_IDX=GOTO_IDX+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                           00003C    55     IDR_IDX=HEX_IDX+2
                           00003E    56     IF_IDX=IDR_IDX+2
                           000040    57     INPUT_IDX=IF_IDX+2
                           000042    58     IWDGEN_IDX=INPUT_IDX+2
                           000044    59     IWDGREF_IDX=IWDGEN_IDX+2
                           000046    60     KEY_IDX=IWDGREF_IDX+2
                           000048    61     LET_IDX=KEY_IDX+2
                           00004A    62     LIST_IDX=LET_IDX+2
                           00004C    63     LOG_IDX=LIST_IDX+2
                           00004E    64     LSHIFT_IDX=LOG_IDX+2
                           000050    65     NEXT_IDX=LSHIFT_IDX+2
                           000052    66     NEW_IDX=NEXT_IDX+2
                           000054    67     ODR_IDX=NEW_IDX+2
                           000056    68     PAD_IDX=ODR_IDX+2
                           000058    69     PAUSE_IDX=PAD_IDX+2
                           00005A    70     PMODE_IDX=PAUSE_IDX+2
                           00005C    71     PEEK_IDX=PMODE_IDX+2
                           00005E    72     PINP_IDX=PEEK_IDX+2
                           000060    73     POKE_IDX=PINP_IDX+2
                           000062    74     POUT_IDX=POKE_IDX+2
                           000064    75    	PRT_IDX=POUT_IDX+2 ; PRINT commande index 
                           000066    76     PRTA_IDX=PRT_IDX+2
                           000068    77     PRTB_IDX=PRTA_IDX+2
                           00006A    78     PRTC_IDX=PRTB_IDX+2
                           00006C    79     PRTD_IDX=PRTC_IDX+2
                           00006E    80     PRTE_IDX=PRTD_IDX+2
                           000070    81     PRTF_IDX=PRTE_IDX+2
                           000072    82     PRTG_IDX=PRTF_IDX+2
                           000074    83     PRTH_IDX=PRTG_IDX+2
                           000076    84     PRTI_IDX=PRTH_IDX+2
                           000078    85     QKEY_IDX=PRTI_IDX+2
                           00007A    86     READ_IDX=QKEY_IDX+2
                           00007C    87     RBT_IDX=READ_IDX+2  ; REBOOT
                           00007E    88 	REM_IDX=RBT_IDX+2 ; REMARK command index 
                           000080    89     REST_IDX=REM_IDX+2 ; RESTORE
                           000082    90     RET_IDX=REST_IDX+2  ; RETURN 
                           000084    91     RND_IDX=RET_IDX+2 ; RANDOM 
                           000086    92     RSHIFT_IDX=RND_IDX+2
                           000088    93     RUN_IDX=RSHIFT_IDX+2
                           00008A    94     FREE_IDX=RUN_IDX+2
                           00008C    95     SLEEP_IDX=FREE_IDX+2
                           00008E    96     SPIRD_IDX=SLEEP_IDX+2
                           000090    97     SPIEN_IDX=SPIRD_IDX+2
                           000092    98     SPISEL_IDX=SPIEN_IDX+2
                           000094    99     SPIWR_IDX=SPISEL_IDX+2
                           000096   100     STEP_IDX=SPIWR_IDX+2
                           000098   101     STOP_IDX=STEP_IDX+2
                           00009A   102     TICKS_IDX=STOP_IDX+2
                           00009C   103     TIMER_IDX=TICKS_IDX+2
                           00009E   104     TMROUT_IDX=TIMER_IDX+2  ; TIMEOUT
                           0000A0   105     TO_IDX=TMROUT_IDX+2
                           0000A2   106     TONE_IDX=TO_IDX+2
                           0000A4   107     UBOUND_IDX=TONE_IDX+2
                           0000A6   108     UFLASH_IDX=UBOUND_IDX+2
                           0000A8   109     UNTIL_IDX=UFLASH_IDX+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                           0000AA   110     USR_IDX=UNTIL_IDX+2
                           0000AC   111     WAIT_IDX=USR_IDX+2
                           0000AE   112     WORDS_IDX=WAIT_IDX+2
                           0000B0   113     WRITE_IDX=WORDS_IDX+2
                           0000B2   114     SIZE_IDX=WRITE_IDX+2 
                           0000B4   115     ON_IDX=SIZE_IDX+2 
                           0000B6   116     GET_IDX=ON_IDX+2
                           0000B8   117     CONST_IDX=GET_IDX+2
                           0000BA   118     EEFREE_IDX=CONST_IDX+2
                                    119      
                                    120     ; keep these 3 at end
                                    121     ; these have no entry in code_addr 
                           0000F8   122     NOT_IDX=248
                           0000FA   123     AND_IDX=250 
                           0000FC   124     OR_IDX=252 
                           0000FE   125     XOR_IDX=254    
                                    126 
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
      008000 82 00 81 43             55     int cold_start			; RESET vector 
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
      008024 82 00 80 C4             68 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
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
      008050 82 00 89 4E             79 	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
      008054 82 00 80 80             80 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 80             81 	int NonHandledInterrupt ;int20 UART3 TX completed
      00805C 82 00 80 80             82 	int NonHandledInterrupt ;int21 UART3 RX full
      008060 82 00 80 80             83 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 A1             84 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
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
      008092 72 12 00 23      [ 1]  119 	bset flags,#FTRAP 
      008096 CD 85 41         [ 4]  120 	call print_registers
      008099 CD 85 EC         [ 4]  121 	call cmd_itf
      00809C 72 13 00 23      [ 1]  122 	bres flags,#FTRAP 	
      0080A0 80               [11]  123 	iret
                                    124 .endif 
                                    125 
                                    126 ;------------------------------
                                    127 ; TIMER 4 is used to maintain 
                                    128 ; a milliseconds 'ticks' counter
                                    129 ; and decrement 'timer' varaiable
                                    130 ; ticks range {0..2^23-1}
                                    131 ;--------------------------------
      0080A1                        132 Timer4UpdateHandler:
      0080A1 72 5F 53 42      [ 1]  133 	clr TIM4_SR 
      0080A5 C6 00 10         [ 1]  134 	ld a,ticks 
      0080A8 CE 00 11         [ 2]  135 	ldw x,ticks+1
      0080AB 1C 00 01         [ 2]  136 	addw x,#1 
      0080AE A9 00            [ 1]  137 	adc a,#0 
      0080B0 2A 02            [ 1]  138 	jrpl 0$
                                    139 ; reset to 0 when negatif 
      0080B2 4F               [ 1]  140 	clr a 
      0080B3 5F               [ 1]  141 	clrw x 
      0080B4 C7 00 10         [ 1]  142 0$:	ld ticks,a 
      0080B7 CF 00 11         [ 2]  143 	ldw ticks+1,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      0080BA CE 00 13         [ 2]  144 	ldw x,timer
      0080BD 27 04            [ 1]  145 	jreq 1$
      0080BF 5A               [ 2]  146 	decw x 
      0080C0 CF 00 13         [ 2]  147 	ldw timer,x 
      0080C3                        148 1$:	
      0080C3 80               [11]  149 	iret 
                                    150 
                                    151 ;------------------------------------
                                    152 ; Triggered by pressing USER UserButton 
                                    153 ; on NUCLEO card.
                                    154 ; This is used to abort a progam lock 
                                    155 ; in infinite loop. 
                                    156 ;------------------------------------
      0080C4                        157 UserButtonHandler:
                                    158 ; wait button release
      0080C4 5F               [ 1]  159 	clrw x
      0080C5 5A               [ 2]  160 1$: decw x 
      0080C6 26 FD            [ 1]  161 	jrne 1$
      0080C8 72 09 50 15 F8   [ 2]  162 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    163 ; if MCU suspended by SLEEP resume program
      0080CD 72 07 00 23 05   [ 2]  164     btjf flags,#FSLEEP,2$
      0080D2 72 17 00 23      [ 1]  165 	bres flags,#FSLEEP 
      0080D6 80               [11]  166 	iret
      0080D7                        167 2$:	
      0080D7                        168 user_interrupted:
      0080D7 72 00 00 23 02   [ 2]  169     btjt flags,#FRUN,4$
      0080DC 20 0A            [ 2]  170 	jra UBTN_Handler_exit 
      0080DE                        171 4$:	; program interrupted by user 
      0080DE 72 11 00 23      [ 1]  172 	bres flags,#FRUN 
      0080E2 AE 80 F0         [ 2]  173 	ldw x,#USER_ABORT
      0080E5 CD 8A 1D         [ 4]  174 	call puts 
      0080E8                        175 UBTN_Handler_exit:
      0080E8 AE 17 FF         [ 2]  176     ldw x,#STACK_EMPTY 
      0080EB 94               [ 1]  177     ldw sp,x
      0080EC 9A               [ 1]  178 	rim 
      0080ED CC 97 AA         [ 2]  179 5$:	jp warm_start
                                    180 
      0080F0 0A 50 72 6F 67 72 61   181 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    182 
                                    183 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    184 ;    peripherals initialization
                                    185 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    186 
                                    187 ;----------------------------------------
                                    188 ; inialize MCU clock 
                                    189 ; input:
                                    190 ;   A 		source  HSI | 1 HSE 
                                    191 ;   XL      CLK_CKDIVR , clock divisor 
                                    192 ; output:
                                    193 ;   none 
                                    194 ;----------------------------------------
      00810B                        195 clock_init:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      00810B C1 50 C3         [ 1]  196 	cp a,CLK_CMSR 
      00810E 27 0C            [ 1]  197 	jreq 2$ ; no switching required 
                                    198 ; select clock source 
      008110 72 12 50 C5      [ 1]  199 	bset CLK_SWCR,#CLK_SWCR_SWEN
      008114 C7 50 C4         [ 1]  200 	ld CLK_SWR,a
      008117 C1 50 C3         [ 1]  201 1$:	cp a,CLK_CMSR
      00811A 26 FB            [ 1]  202 	jrne 1$
      00811C                        203 2$: 	
                                    204 ; HSI and cpu clock divisor 
      00811C 9F               [ 1]  205 	ld a,xl 
      00811D C7 50 C6         [ 1]  206 	ld CLK_CKDIVR,a  
      008120 81               [ 4]  207 	ret
                                    208 
                                    209 ;----------------------------------
                                    210 ; TIMER2 used as audio tone output 
                                    211 ; on port D:5. CN9-6
                                    212 ; channel 1 configured as PWM mode 1 
                                    213 ;-----------------------------------  
                                    214 
      008121                        215 timer2_init:
      008121 72 1A 50 C7      [ 1]  216 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      008125 35 60 53 05      [ 1]  217  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      008129 35 08 53 0C      [ 1]  218 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      00812D 81               [ 4]  219 	ret 
                                    220 
                                    221 ;---------------------------------
                                    222 ; TIM4 is configured to generate an 
                                    223 ; interrupt every millisecond 
                                    224 ;----------------------------------
      00812E                        225 timer4_init:
      00812E 72 18 50 C7      [ 1]  226 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      008132 35 07 53 45      [ 1]  227 	mov TIM4_PSCR,#7 ; prescale 128  
      008136 35 7D 53 46      [ 1]  228 	mov TIM4_ARR,#125 ; set for 1msec.
      00813A 35 05 53 40      [ 1]  229 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00813E 72 10 53 41      [ 1]  230 	bset TIM4_IER,#TIM4_IER_UIE
      008142 81               [ 4]  231 	ret
                                    232 
                                    233 ;-------------------------------------
                                    234 ;  initialization entry point 
                                    235 ;-------------------------------------
      008143                        236 cold_start:
                                    237 ;set stack 
      008143 AE 17 FF         [ 2]  238 	ldw x,#STACK_EMPTY
      008146 94               [ 1]  239 	ldw sp,x
                                    240 ; clear all ram 
      008147 7F               [ 1]  241 0$: clr (x)
      008148 5A               [ 2]  242 	decw x 
      008149 26 FC            [ 1]  243 	jrne 0$
                                    244 ; activate pull up on all inputs 
      00814B A6 FF            [ 1]  245 	ld a,#255 
      00814D C7 50 03         [ 1]  246 	ld PA_CR1,a 
      008150 C7 50 08         [ 1]  247 	ld PB_CR1,a 
      008153 C7 50 0D         [ 1]  248 	ld PC_CR1,a 
      008156 C7 50 12         [ 1]  249 	ld PD_CR1,a 
      008159 C7 50 17         [ 1]  250 	ld PE_CR1,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      00815C C7 50 1C         [ 1]  251 	ld PF_CR1,a 
      00815F C7 50 21         [ 1]  252 	ld PG_CR1,a 
      008162 C7 50 2B         [ 1]  253 	ld PI_CR1,a
                                    254 ; set LD2 pin as output 
      008165 72 1A 50 0D      [ 1]  255     bset PC_CR1,#LED2_BIT
      008169 72 1A 50 0E      [ 1]  256     bset PC_CR2,#LED2_BIT
      00816D 72 1A 50 0C      [ 1]  257     bset PC_DDR,#LED2_BIT
      008171 72 1B 50 0A      [ 1]  258 	bres PC_ODR,#LED2_BIT 
                                    259 ; disable schmitt triggers on Arduino CN4 analog inputs
      008175 55 00 3F 54 07   [ 1]  260 	mov ADC_TDRL,0x3f
                                    261 ; disable peripherals clocks
                                    262 ;	clr CLK_PCKENR1 
                                    263 ;	clr CLK_PCKENR2
      00817A 72 5F 50 F2      [ 1]  264 	clr AWU_TBR 
      00817E 72 14 50 CA      [ 1]  265 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                    266 ; select internal clock no divisor: 16 Mhz 	
      008182 A6 E1            [ 1]  267 	ld a,#CLK_SWR_HSI 
      008184 5F               [ 1]  268 	clrw x  
      008185 CD 81 0B         [ 4]  269     call clock_init 
      008188 CD 81 2E         [ 4]  270 	call timer4_init
      00818B CD 81 21         [ 4]  271 	call timer2_init
                                    272 ; UART1 at 115200 BAUD
      00818E CD 89 7B         [ 4]  273 	call uart1_init
                                    274 ; activate PE_4 (user button interrupt)
      008191 72 18 50 18      [ 1]  275     bset PE_CR2,#USR_BTN_BIT 
                                    276 ; display system information
      008195 9A               [ 1]  277 	rim ; enable interrupts 
      008196 72 5C 00 18      [ 1]  278 	inc seedy+1 
      00819A 72 5C 00 16      [ 1]  279 	inc seedx+1 
      00819E CD 9D B1         [ 4]  280 	call func_eefree 
      0081A1 CD 9C E8         [ 4]  281 	call ubound 
      0081A4 CD 95 7A         [ 4]  282 	call clear_basic
      0081A7 CD A5 FB         [ 4]  283 	call beep_1khz  
      0081AA CD 95 27         [ 4]  284 	call system_information
      0081AD                        285 2$:	
                                    286 ; check for application in flash memory 
      0081AD CD A8 36         [ 4]  287 	call qsign 
      0081B0 27 03            [ 1]  288 	jreq run_app
      0081B2 CC 97 AA         [ 2]  289 	jp warm_start 
      0081B5                        290 run_app:
                                    291 ; run application in FLASH|EEPROM 
      0081B5 90 CE 17 73      [ 2]  292 	ldw y,XSTACK_EMPTY
      0081B9 CD 95 58         [ 4]  293 	call warm_init
      0081BC AE B6 04         [ 2]  294 	ldw x,#app 
      0081BF CF 00 1C         [ 2]  295 	ldw txtbgn,x
      0081C2 72 BB B6 02      [ 2]  296 	addw x,app_size 
      0081C6 CF 00 1E         [ 2]  297 	ldw txtend,x 
      0081C9 AE 81 D7         [ 2]  298 	ldw x,#AUTO_RUN 
      0081CC CD 8A 1D         [ 4]  299 	call puts 
      0081CF CD 9E D9         [ 4]  300 	call program_info 
      0081D2 CC A5 9F         [ 2]  301 	jp run_it_02  
      0081D5 20 FE            [ 2]  302     jra .  
                                    303 
      0081D7 20 61 75 74 6F 20 72   304 AUTO_RUN: .asciz " auto run program\n"
             75 6E 20 70 72 6F 67
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal  72-Bits]



             72 61 6D 0A 00
                                    305 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
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
      00016A                         35 add24: ; ( i1 i2 -- i1 + i2 )
      00016A                         36     _xpop 
      0081E6 61 6D            [ 1]    1     ld a,(y)
      0081E8 0A               [ 1]    2     ldw x,y 
      0081E9 00 01            [ 2]    3     ldw x,(1,x)
      0081EA 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0081EA 90               [ 2]   37     pushw x  
      0081EB F6               [ 1]   38     push a  
      000175                         39     _at_top  
      0081EC 93 EE            [ 1]    1     ld a,(y)
      0081EE 01               [ 1]    2     ldw x,y 
      0081EF 72 A9            [ 2]    3     ldw x,(1,x)
      0081F1 00 03 89         [ 2]   40     addw x,(2,sp)
      0081F4 88 90            [ 1]   41     adc a, (1,sp)
      00017F                         42     _store_top 
      0081F6 F6 93            [ 1]    1     ld (y),a 
      0081F8 EE 01 72         [ 2]    2     ldw (1,y),x     
      000184                         43     _drop 3 
      0081FB FB 02            [ 2]    1     addw sp,#3 
      0081FD 19               [ 4]   44     ret 
                                     45 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                     46 ;-------------------------------
                                     47 ; sub24 A:X-acc24 
                                     48 ; subtract 24 bits integers 
                                     49 ;------------------------------
      000187                         50 sub24: ; (i1 i2 -- i1-i2 ) 
      000187                         51     _xpop 
      0081FE 01 90            [ 1]    1     ld a,(y)
      008200 F7               [ 1]    2     ldw x,y 
      008201 90 EF            [ 2]    3     ldw x,(1,x)
      008203 01 5B 03 81      [ 2]    4     addw y,#CELL_SIZE 
      008207 89               [ 2]   52     pushw x 
      008207 90               [ 1]   53     push  a
      000192                         54     _at_top  
      008208 F6 93            [ 1]    1     ld a,(y)
      00820A EE               [ 1]    2     ldw x,y 
      00820B 01 72            [ 2]    3     ldw x,(1,x)
      00820D A9 00 03         [ 2]   55     subw x,(2,sp) 
      008210 89 88            [ 1]   56     sbc a, (1,sp)
      00019C                         57     _store_top  
      008212 90 F6            [ 1]    1     ld (y),a 
      008214 93 EE 01         [ 2]    2     ldw (1,y),x     
      0001A1                         58     _drop 3 
      008217 72 F0            [ 2]    1     addw sp,#3 
      008219 02               [ 4]   59     ret 
                                     60 
                                     61 ;------------------------------
                                     62 ; cp24  i1 i2 -- 0x800000|0|0x010000
                                     63 ;------------------------------
      0001A4                         64 cp24:
      0001A4                         65     _xpop 
      00821A 12 01            [ 1]    1     ld a,(y)
      00821C 90               [ 1]    2     ldw x,y 
      00821D F7 90            [ 2]    3     ldw x,(1,x)
      00821F EF 01 5B 03      [ 2]    4     addw y,#CELL_SIZE 
      008223 81 00 0C         [ 1]   66     ld acc24,a 
      008224 CF 00 0D         [ 2]   67     ldw acc16,x
      0001B3                         68     _at_top 
      008224 90 F6            [ 1]    1     ld a,(y)
      008226 93               [ 1]    2     ldw x,y 
      008227 EE 01            [ 2]    3     ldw x,(1,x)
      008229 72 A9 00 03      [ 2]   69     subw x,acc16
      00822D C7 00 0D         [ 1]   70     sbc a,acc24
      008230 CF 00            [ 1]   71     jrslt 1$
      008232 0E 90            [ 1]   72     jrne 2$
      008234 F6               [ 2]   73     tnzw x 
      008235 93 EE            [ 1]   74     jrne 2$
      008237 01               [ 1]   75     clr a 
      008238 72 B0            [ 2]   76     jra 9$ 
      0001C9                         77 1$: ; i1 < i2 
      00823A 00 0E            [ 1]   78     ld a,#255
      00823C C2 00            [ 2]   79     jra 9$ 
      0001CD                         80 2$: ; i1 > i2 
      00823E 0D 2F            [ 1]   81     ld a,#1 
      008240 08               [ 1]   82 9$: clrw x
      0001D0                         83      _store_top 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008241 26 0A            [ 1]    1     ld (y),a 
      008243 5D 26 07         [ 2]    2     ldw (1,y),x     
      008246 4F               [ 4]   84     ret 
                                     85 
                                     86 ;-------------------------------
                                     87 ; cp24_ax 
                                     88 ; compare acc24 with A:X 
                                     89 ;-------------------------------
      0001D6                         90 cp24_ax:
      008247 20               [ 1]   91     push a 
      008248 06 00 0D         [ 2]   92     cpw x,acc16 
      008249 C2 00 0C         [ 1]   93     sbc a,acc24
      008249 A6               [ 1]   94     pop a 
      00824A FF               [ 4]   95     ret 
                                     96 
                                     97 
                                     98 ;-------------------------------
                                     99 ; abs24 
                                    100 ; abolute value of top  
                                    101 ;-------------------------------
      0001DF                        102 abs24: ; ( i -- u )
      00824B 20 02            [ 1]  103     ld a,(y)
      00824D A1 80            [ 1]  104     cp a,#0x80 
      00824D A6 01            [ 1]  105     jrpl neg24 ; negative integer
      00824F 5F               [ 4]  106     ret  
                                    107 
                                    108 ;----------------------------
                                    109 ;  one's compleement 
                                    110 ;----------------------------
      0001E6                        111 cpl24:  ; i -- ~i 
      008250 90 F7            [ 1]  112     cpl (y) 
      008252 90 EF 01         [ 1]  113     cpl (1,y)
      008255 81 63 02         [ 1]  114     cpl (2,y)
      008256 81               [ 4]  115     ret 
                                    116 
                                    117 ;----------------------------    
                                    118 ; two'2 complement of top  
                                    119 ;---------------------------
      0001EF                        120 neg24: ; (i -- -i )
      0001EF                        121     _at_top
      008256 88 C3            [ 1]    1     ld a,(y)
      008258 00               [ 1]    2     ldw x,y 
      008259 0E C2            [ 2]    3     ldw x,(1,x)
      00825B 00               [ 1]  122     cpl  a  
      00825C 0D               [ 2]  123     cplw x 
      00825D 84 81 01         [ 2]  124     addw x,#1
      00825F A9 00            [ 1]  125     adc a,#0
      0001FB                        126     _store_top  
      00825F 90 F6            [ 1]    1     ld (y),a 
      008261 A1 80 2A         [ 2]    2     ldw (1,y),x     
      008264 0A               [ 4]  127 9$: ret 
                                    128 
                                    129 ;-----------------------------
                                    130 ; negate integer in A:X 
                                    131 ;----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      000201                        132 neg_ax:
      008265 81               [ 1]  133     cpl  a  
      008266 53               [ 2]  134     cplw x 
      008266 90 73 90         [ 2]  135     addw x,#1
      008269 63 01            [ 1]  136     adc a,#0
      00826B 90               [ 4]  137     ret 
                                    138 
                                    139 ;------------------------------------
                                    140 ;  two's complement of acc24 
                                    141 ;-------------------------------------
      000209                        142 neg_acc24: ; 
      00826C 63 02 81 0C      [ 1]  143     cpl acc24 
      00826F 72 53 00 0D      [ 1]  144     cpl acc16 
      00826F 90 F6 93 EE      [ 1]  145     cpl acc8
      008273 01 43 53 1C      [ 1]  146     inc acc8 
      008277 00 01            [ 1]  147     jrne 9$
      008279 A9 00 90 F7      [ 1]  148     inc acc16 
      00827D 90 EF            [ 1]  149     jrne 9$
      00827F 01 81 00 0C      [ 1]  150     inc acc24 
      008281 81               [ 4]  151 9$: ret 
                                    152 
                                    153 
                                    154 ;--------------------------------------
                                    155 ; unsigned multiply uint24_t by uint8_t
                                    156 ; input:
                                    157 ;	acc24	uint24_t 
                                    158 ;   A		uint8_t
                                    159 ; output:
                                    160 ;   acc24   A*acc24
                                    161 ;      A    overflow, bits 31..24 
                                    162 ;-------------------------------------
                                    163 ; local variables offset  on sp
                           000001   164 	U8   = 1   ; A pushed on stack
                           000001   165 	VSIZE = 1 
      000226                        166 mulu24_8:
      008281 43               [ 2]  167 	pushw x    ; save X
                                    168 	; local variable
      008282 53               [ 1]  169 	push a     ; U8
      008283 1C 00 01 A9      [ 1]  170 	clr acc32 
                                    171 ; multiply bits 7..0 * U8   	
      008287 00               [ 1]  172 	ld xl,a 
      008288 81 00 0E         [ 1]  173 	ld a,acc8 
      008289 42               [ 4]  174 	mul x,a 
      008289 72 53 00         [ 1]  175 	ld a, acc16 
      00828C 0D 72 53         [ 2]  176 	ldw acc16,x
                                    177 ; multiply middle byte, bits 15..8 * U8  	
      00828F 00               [ 1]  178 	ld xl,a 
      008290 0E 72            [ 1]  179 	ld a,(U8,sp)
      008292 53               [ 4]  180 	mul x,a 
      008293 00 0F 72         [ 1]  181 	ld a,acc24
      008296 5C 00 0F 26      [ 1]  182 	clr acc24  
      00829A 0A 72 5C 00      [ 2]  183 	addw x,acc24
      00829E 0E 26 04         [ 2]  184 	ldw acc24,x 
                                    185 ; multiply  MSB, bits 23..16 * U8 
      0082A1 72               [ 1]  186 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      0082A2 5C 00            [ 1]  187 	ld a,(U8,sp)
      0082A4 0D               [ 4]  188 	mul x,a
      0082A5 81 BB 00 0B      [ 2]  189 	addw x,acc32  
      0082A6 CF 00 0B         [ 2]  190 	ldw acc32,x 
      0082A6 89               [ 1]  191 	ld a,xh 
      000255                        192 	_drop VSIZE  
      0082A7 88 72            [ 2]    1     addw sp,#VSIZE 
      0082A9 5F               [ 2]  193 	popw x 
      0082AA 00               [ 4]  194 	ret 
                                    195 
                                    196 
                                    197 ;-------------------------------
                                    198 ; mul24 i1 i2 -- i1*i2  
                                    199 ; multiply 24 bits integers 
                                    200 ;------------------------------
                           000001   201     PROD=1 
                           000004   202     N1=4
                           000007   203     N2=7
                           00000A   204     PROD_SIGN=10
                           00000A   205     VSIZE=10 
      000259                        206 mul24:
      000259                        207     _vars VSIZE
      0082AB 0C 97            [ 2]    1     sub sp,#VSIZE 
      0082AD C6 00            [ 1]  208     clr (PROD_SIGN,sp)
      0082AF 0F 42            [ 1]  209     clr (PROD,sp)
      0082B1 C6               [ 1]  210     clrw x 
      0082B2 00 0E            [ 2]  211     ldw (PROD+1,sp),x
      000262                        212     _xpop 
      0082B4 CF 00            [ 1]    1     ld a,(y)
      0082B6 0E               [ 1]    2     ldw x,y 
      0082B7 97 7B            [ 2]    3     ldw x,(1,x)
      0082B9 01 42 C6 00      [ 2]    4     addw y,#CELL_SIZE 
      0082BD 0D               [ 1]  213     tnz a 
      0082BE 72 5F            [ 1]  214     jrpl 0$
      0082C0 00 0D            [ 1]  215     cpl (PROD_SIGN,sp)
      0082C2 72 BB 00         [ 4]  216     call neg_ax 
      000273                        217 0$:    
      0082C5 0D CF            [ 1]  218     ld (N1,sp),a 
      0082C7 00 0D            [ 2]  219     ldw (N1+1,sp),x
      000277                        220     _at_top 
      0082C9 97 7B            [ 1]    1     ld a,(y)
      0082CB 01               [ 1]    2     ldw x,y 
      0082CC 42 72            [ 2]    3     ldw x,(1,x)
      0082CE BB               [ 1]  221     tnz a 
      0082CF 00 0C            [ 1]  222     jrpl 2$ 
      0082D1 CF 00            [ 1]  223     cpl (PROD_SIGN,sp) 
      0082D3 0C 9E 5B         [ 4]  224     call neg_ax
      0082D6 01 85            [ 1]  225     ld (N2,sp),a 
      0082D8 81 08            [ 2]  226     ldw (N2+1,sp),x   
      0082D9                        227 2$: 
      0082D9 52 0A 0F         [ 1]  228     ld acc24,a 
      0082DC 0A 0F 01         [ 2]  229     ldw acc16,x 
      0082DF 5F 1F            [ 1]  230     ld a,(N1+2,sp); least byte     
      0082E1 02 90            [ 1]  231     jreq 4$
      0082E3 F6 93 EE         [ 4]  232     call mulu24_8
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      0082E6 01               [ 1]  233     tnz a 
      0082E7 72 A9            [ 1]  234     jrne 8$ ; overflow 
      0082E9 00 03 4D         [ 2]  235     ldw x,acc16  
      0082EC 2A 05 03         [ 1]  236     ld a,acc24
      0082EF 0A CD            [ 1]  237     jrmi 8$ ; overflow  
      0082F1 82 81            [ 1]  238     ld (PROD,sp),a
      0082F3 1F 02            [ 2]  239     ldw (PROD+1,sp),x 
      0002A4                        240 4$:
      0082F3 6B 04            [ 1]  241     ld a,(N2,sp) 
      0082F5 1F 05            [ 2]  242     ldw x,(N2+1,sp)
      0082F7 90 F6 93         [ 1]  243     ld acc24,a 
      0082FA EE 01 4D         [ 2]  244     ldw acc16,x 
      0082FD 2A 09            [ 1]  245     ld a,(N1+1,sp); middle byte     
      0082FF 03 0A            [ 1]  246     jreq 5$
      008301 CD 82 81         [ 4]  247     call mulu24_8
      008304 6B               [ 1]  248     tnz a 
      008305 07 1F            [ 1]  249     jrne 8$ ; overflow 
      008307 08 00 0C         [ 1]  250     ld a,acc24 
      008308 26 3B            [ 1]  251     jrne 8$  ; overflow 
      008308 C7 00 0D         [ 2]  252     ldw x,acc16  
      00830B CF 00 0E         [ 2]  253     addw x,(PROD,sp)
      00830E 7B 06            [ 1]  254     jrv 8$ ; overflow
      008310 27 12            [ 2]  255     ldw (PROD,sp),x 
      008312 CD 82            [ 1]  256     ld a,(N2,sp)
      008314 A6 4D            [ 2]  257     ldw x,(N2+1,sp)
      008316 26 60 CE         [ 1]  258     ld acc24,a 
      008319 00 0E C6         [ 2]  259     ldw acc16,x 
      0002D1                        260 5$:
      00831C 00 0D            [ 1]  261     ld a,(N1,sp) ; high byte 
      00831E 2B 58            [ 1]  262     jreq 6$
      008320 6B 01 1F         [ 4]  263     call mulu24_8
      008323 02               [ 1]  264     tnz a 
      008324 26 1D            [ 1]  265     jrne 8$ ; overflow 
      008324 7B 07 1E         [ 2]  266     ldw x,acc24 
      008327 08 C7            [ 1]  267     jrne 8$ ; overflow 
      008329 00 0D CF         [ 1]  268     ld a,acc8 
      00832C 00 0E            [ 1]  269     jrmi 8$ ; overflow 
      00832E 7B 05            [ 1]  270     add a,(PROD,sp)
      008330 27 1F            [ 1]  271     ld (PROD,sp),a 
      008332 CD 82            [ 1]  272     jrv 8$ ; overflow 
      0002EB                        273 6$:
      008334 A6 4D            [ 1]  274     ld a,(PROD,sp)
      008336 26 40            [ 2]  275     ldw x,(PROD+1,sp)
      008338 C6 00            [ 1]  276     tnz (PROD_SIGN,sp)
      00833A 0D 26            [ 1]  277     jreq 9$
      00833C 3B CE 00         [ 4]  278     call neg_ax 
      00833F 0E 72            [ 2]  279     jra 9$ 
      0002F8                        280 8$: ; overflow
      008341 FB 01            [ 1]  281     ld a,#ERR_OVERFLOW
      008343 29 33 1F         [ 2]  282     jp tb_error 
      0002FD                        283 9$:    
      0002FD                        284     _store_top 
      008346 01 7B            [ 1]    1     ld (y),a 
      008348 07 1E 08         [ 2]    2     ldw (1,y),x     
      000302                        285     _drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      00834B C7 00            [ 2]    1     addw sp,#VSIZE 
      00834D 0D               [ 4]  286     ret 
                                    287 
                                    288 ;-------------------------------------
                                    289 ; divide uint24_t by uint8_t
                                    290 ; input:
                                    291 ;	acc24	dividend
                                    292 ;   A 		divisor
                                    293 ; output:
                                    294 ;   acc24	quotient
                                    295 ;   A		remainder
                                    296 ;------------------------------------- 
                                    297 ; offset  on sp of arguments and locals
                           000001   298 	U8   = 1   ; divisor on stack
                           000001   299 	VSIZE =1
      000305                        300 divu24_8:
      00834E CF               [ 2]  301 	pushw x ; save x
      00834F 00               [ 1]  302 	push a 
                                    303 	; ld dividend UU:MM bytes in X
      008350 0E 00 0C         [ 2]  304 	ldw x,acc24
      008351 7B 01            [ 1]  305 	ld a,(U8,SP) ; divisor
      008351 7B               [ 2]  306 	div x,a ; UU:MM/U8
      008352 04               [ 1]  307 	push a  ;save remainder
      008353 27 16 CD         [ 2]  308     ldw acc24,x ; quotient 
      008356 82               [ 1]  309 	pop a
      008357 A6               [ 1]  310 	ld xh,a
      008358 4D 26 1D         [ 1]  311 	ld a,acc8
      00835B CE               [ 1]  312 	ld xl,a
      00835C 00 0D            [ 1]  313 	ld a,(U8,sp) ; divisor
      00835E 26               [ 2]  314 	div x,a  ; R:LL/U8
      00835F 18 C6            [ 1]  315 	ld (U8,sp),a ; save remainder
      008361 00               [ 1]  316 	ld a,xl
      008362 0F 2B 13         [ 1]  317 	ld acc8,a
      008365 1B               [ 1]  318 	pop a
      008366 01               [ 2]  319 	popw x
      008367 6B               [ 4]  320 	ret
                                    321 
                                    322 
                                    323 ;-------------------------------
                                    324 ; div24 N/T   
                                    325 ; divide 24 bits integers
                                    326 ;  i1 i2 -- i1/i2 
                                    327 ;------------------------------
                           000001   328     DIVISOR=1
                           000004   329     CNTR=4
                           000005   330     QSIGN=5
                           000006   331     RSIGN=6 
                           000006   332     VSIZE=6 
      000323                        333 div24:
      000323                        334     _vars VSIZE 
      008368 01 29            [ 2]    1     sub sp,#VSIZE 
      00836A 0D 06            [ 1]  335     clr (RSIGN,sp)
      00836B 0F 05            [ 1]  336     clr (QSIGN,sp)
      000329                        337     _xpop 
      00836B 7B 01            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      00836D 1E               [ 1]    2     ldw x,y 
      00836E 02 0D            [ 2]    3     ldw x,(1,x)
      008370 0A 27 0A CD      [ 2]    4     addw y,#CELL_SIZE 
      008374 82               [ 1]  338     tnz a 
      008375 81 20            [ 1]  339     jrpl 0$ 
      008377 05 05            [ 1]  340     cpl (QSIGN,sp)
      008378 CD 02 01         [ 4]  341     call neg_ax
      00033A                        342 0$:
      008378 A6 10            [ 1]  343     ld  (DIVISOR,sp),a
      00837A CC 97            [ 2]  344     ldw (DIVISOR+1,sp),x
      00837C 20 02            [ 1]  345     or a,(DIVISOR+1,sp)
      00837D 1A 03            [ 1]  346     or a,(DIVISOR+2,sp)
      00837D 90 F7            [ 1]  347     jrne 1$ 
      00837F 90 EF            [ 1]  348     ld a,#ERR_DIV0 
      008381 01 5B 0A         [ 2]  349     jp tb_error 
      000349                        350 1$: 
      000349                        351     _at_top
      008384 81 F6            [ 1]    1     ld a,(y)
      008385 93               [ 1]    2     ldw x,y 
      008385 89 88            [ 2]    3     ldw x,(1,x)
      008387 CE               [ 1]  352     tnz a 
      008388 00 0D            [ 1]  353     jrpl 2$
      00838A 7B 01 62         [ 4]  354     call neg_ax
      00838D 88 CF            [ 1]  355     cpl (QSIGN,sp)
      00838F 00 0D            [ 1]  356     cpl (RSIGN,sp)
      000358                        357 2$: 
      008391 84 95 C6         [ 1]  358     ld acc24,a 
      008394 00 0F 97         [ 2]  359     ldw acc16,x 
      008397 7B 01            [ 1]  360     ld a,#24 
      008399 62 6B            [ 1]  361     ld (CNTR,sp),a
      00839B 01 9F            [ 1]  362     ld a,(DIVISOR,sp)
      00839D C7 00            [ 2]  363     ldw x,(DIVISOR+1,sp)
      00839F 0F 84 85         [ 4]  364     call cp24_ax ; A:X-acc24 ?
      0083A2 81 14            [ 2]  365     jrule 22$ 
                                    366 ; quotient=0, remainder=divisor      
      0083A3 C6 00 0C         [ 1]  367     ld a,acc24 
      0083A3 52 06 0F         [ 2]  368     ldw x,acc16 
      0083A6 06 0F 05 90      [ 1]  369     clr acc24 
      0083AA F6 93 EE 01      [ 1]  370     clr acc16 
      0083AE 72 A9 00 03      [ 1]  371     clr acc8 
      0083B2 4D 2A            [ 2]  372     jra 6$
      00037F                        373 22$:     
      0083B4 05               [ 1]  374     clr a 
      0083B5 03               [ 1]  375     clrw x 
      0083B6 05               [ 1]  376     rcf  
      000382                        377 3$: 
      0083B7 CD 82 81 0E      [ 1]  378     rlc acc8 
      0083BA 72 59 00 0D      [ 1]  379     rlc acc16
      0083BA 6B 01 1F 02      [ 1]  380     rlc acc24 
      0083BE 1A               [ 2]  381     rlcw x  
      0083BF 02               [ 1]  382     rlc a
      0083C0 1A 03 26         [ 2]  383 4$: subw x,(DIVISOR+1,sp) 
      0083C3 05 A6            [ 1]  384     sbc a,(DIVISOR,sp)
      0083C5 04 CC            [ 1]  385     jrnc 5$
      0083C7 97 20 02         [ 2]  386     addw x,(DIVISOR+1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      0083C9 19 01            [ 1]  387     adc a,(DIVISOR,sp)
      00039C                        388 5$: ; shift carry in QUOTIENT 
      0083C9 90               [ 1]  389     ccf
      0083CA F6 93            [ 1]  390     dec (CNTR,sp)
      0083CC EE 01            [ 1]  391     jrne 3$ 
      0083CE 4D 2A 07 CD      [ 1]  392     rlc acc8 
      0083D2 82 81 03 05      [ 1]  393     rlc acc16 
      0083D6 03 06 00 0B      [ 1]  394     rlc acc32 
      0083D8                        395 6$:    
      0083D8 C7 00            [ 1]  396     ld (DIVISOR,sp),a 
      0083DA 0D CF            [ 2]  397     ldw (DIVISOR+1,sp),x 
      0083DC 00 0E A6         [ 1]  398     ld a,acc24 
      0083DF 18 6B 04         [ 2]  399     ldw x,acc16 
      0083E2 7B 01            [ 1]  400     tnz (QSIGN,sp)
      0083E4 1E 02            [ 1]  401     jreq 8$
      0083E6 CD 82 56         [ 4]  402     call neg_ax 
      0003BE                        403 8$: 
      0003BE                        404     _store_top 
      0083E9 23 14            [ 1]    1     ld (y),a 
      0083EB C6 00 0D         [ 2]    2     ldw (1,y),x     
      0083EE CE 00            [ 1]  405     ld a,(DIVISOR,sp)
      0083F0 0E 72            [ 2]  406     ldw x,(DIVSOR+1,sp)
      0003C7                        407 81$:
      0083F2 5F 00            [ 1]  408     tnz (RSIGN,sp)
      0083F4 0D 72            [ 1]  409     jreq 9$
      0083F6 5F 00 0E         [ 4]  410     call neg_ax       
      0003CE                        411 9$: _drop VSIZE 
      0083F9 72 5F            [ 2]    1     addw sp,#VSIZE 
      0083FB 00               [ 4]  412     ret 
                                    413 
                                    414 
                                    415 ;-------------------------------
                                    416 ; mod24 A:X % acc24 
                                    417 ; remainder 24 bits integers 
                                    418 ; input:
                                    419 ;    acc24   dividend 
                                    420 ;    A:X     divisor 
                                    421 ; output:
                                    422 ;    acc24   acc24 % A:X 
                                    423 ;------------------------------
      0003D1                        424 mod24:
      0083FC 0F 20 2E         [ 4]  425     call div24 
      0083FF                        426     _store_top  ; replace quotient by remainder 
      0083FF 4F 5F            [ 1]    1     ld (y),a 
      008401 98 EF 01         [ 2]    2     ldw (1,y),x     
      008402 81               [ 4]  427     ret 
                                    428 
                                    429 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
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
      0003DA                         32 	_argofs 0  
                           000002     1     ARG_OFS=2+0 
      0003DA                         33 	_arg R_Y 1 
                           000003     1     R_Y=ARG_OFS+1 
      0003DA                         34 	_arg R_X 3
                           000005     1     R_X=ARG_OFS+3 
      0003DA                         35 	_arg R_A 5
                           000007     1     R_A=ARG_OFS+5 
      0003DA                         36 	_arg R_CC 6
                           000008     1     R_CC=ARG_OFS+6 
      0003DA                         37 prt_regs::
      008402 72 59 00         [ 2]   38 	ldw x,#regs_state 
      008405 0F 72 59         [ 4]   39 	call puts
                                     40 ; register PC
      008408 00 0E            [ 2]   41 	ldw y,(1,sp)
      00840A 72 59 00         [ 2]   42 	ldw x,#REG_EPC 
      00840D 0D 59 49         [ 4]   43 	call prt_reg16 
                                     44 ; register CC 
      008410 72 F0            [ 1]   45 	ld a,(R_CC,sp)
      008412 02 12 01         [ 2]   46 	ldw x,#REG_CC 
      008415 24 05 72         [ 4]   47 	call prt_reg8 
                                     48 ; register A 
      008418 FB 02            [ 1]   49 	ld a,(R_A,sp)
      00841A 19 01 5E         [ 2]   50 	ldw x,#REG_A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      00841C CD 04 80         [ 4]   51 	call prt_reg8 
                                     52 ; register X 
      00841C 8C 0A            [ 2]   53 	ldw y,(R_X,sp)
      00841E 04 26 E1         [ 2]   54 	ldw x,#REG_X 
      008421 72 59 00         [ 4]   55 	call prt_reg16 
                                     56 ; register Y 
      008424 0F 72            [ 2]   57 	ldw y,(R_Y,sp)
      008426 59 00 0E         [ 2]   58 	ldw x,#REG_Y 
      008429 72 59 00         [ 4]   59 	call prt_reg16 
                                     60 ; register SP 
      00842C 0C 96            [ 1]   61 	ldw y,sp
      00842D 72 A9 00 08      [ 2]   62 	addw y,#6+ARG_OFS  
      00842D 6B 01 1F         [ 2]   63 	ldw x,#REG_SP
      008430 02 C6 00         [ 4]   64 	call prt_reg16
      008433 0D CE            [ 1]   65 	ld a,#CR 
      008435 00 0E 0D         [ 4]   66 	call putc
      008438 05 27 03         [ 4]   67 	call putc   
      00843B CD               [ 4]   68 	ret 
                                     69 
                                     70 
      00843C 82 81 65 67 69 73 74    71 regs_state: .asciz "\nregisters state\n--------------------\n"
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
      00843E                         81 prt_peek::
      00843E 90               [ 2]   82 	pushw x 
      00843F F7 90 EF 01      [ 1]   83 	mov base,#16 
      008443 7B 01 1E         [ 4]   84 	call prt_i16  
      008446 02 3A            [ 1]   85 	ld a,#': 
      008447 CD 09 40         [ 4]   86 	call putc 
      008447 0D 06            [ 1]   87 	ld a,#SPACE 
      008449 27 03 CD         [ 4]   88 	call putc 
      00844C 82               [ 2]   89 	popw x 
      00844D 81               [ 1]   90 	ld a,(x)
      00844E 5B               [ 1]   91 	clrw x 
      00844F 06               [ 1]   92 	ld xl,a 
      008450 81 0A 00 0A      [ 1]   93 	mov base,#10 
      008451 CD 17 F4         [ 4]   94 	call prt_i16 
      008451 CD               [ 4]   95 	ret 
                                     96 
                                     97 ;----------------------------------------
                                     98 ;   DEBUG support functions
                                     99 ;----------------------------------------
                                    100 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                    101 ; turn LED on 
      000462                        102 ledon:
      008452 83 A3 90 F7      [ 1]  103     bset PC_ODR,#LED2_BIT
      008456 90               [ 4]  104     ret 
                                    105 
                                    106 ; turn LED off 
      000467                        107 ledoff:
      008457 EF 01 81 0A      [ 1]  108     bres PC_ODR,#LED2_BIT 
      00845A 81               [ 4]  109     ret 
                                    110 
                                    111 ; invert LED status 
      00046C                        112 ledtoggle:
      00845A AE 84            [ 1]  113     ld a,#LED2_MASK
      00845C 9D CD 8A         [ 1]  114     xor a,PC_ODR
      00845F 1D 16 01         [ 1]  115     ld PC_ODR,a
      008462 AE               [ 4]  116     ret 
                                    117 
      000475                        118 left_paren:
      008463 85 D1            [ 1]  119 	ld a,#SPACE 
      008465 CD 85 22         [ 4]  120 	call putc
      008468 7B 08            [ 1]  121 	ld a,#'( 
      00846A AE 85 E2         [ 4]  122 	call putc 	
      00846D CD               [ 4]  123 	ret 
                                    124 
                                    125 ;------------------------------
                                    126 ; print 8 bit register 
                                    127 ; input:
                                    128 ;   X  point to register name 
                                    129 ;   A  register value to print 
                                    130 ; output:
                                    131 ;   none
                                    132 ;------------------------------- 
      000480                        133 prt_reg8:
      00846E 85               [ 1]  134 	push a 
      00846F 00 7B 07         [ 4]  135 	call puts 
      008472 AE 85            [ 1]  136 	ld a,(1,sp) 
      008474 DE               [ 1]  137 	clrw x 
      008475 CD               [ 1]  138 	ld xl,a 
      008476 85 00 16 05      [ 1]  139 	mov base,#16
      00847A AE 85 DA         [ 4]  140 	call prt_i16  
      00847D CD 85 22         [ 4]  141 	call left_paren 
      008480 16               [ 1]  142 	pop a 
      008481 03               [ 1]  143 	clrw x 
      008482 AE               [ 1]  144 	ld xl,a 
      008483 85 D6 CD 85      [ 1]  145 	mov base,#10 
      008487 22 90 96         [ 4]  146 	call prt_i16  
      00848A 72 A9            [ 1]  147 	ld a,#') 
      00848C 00 08 AE         [ 4]  148 	call putc
      00848F 85               [ 4]  149 	ret
                                    150 
                                    151 ;--------------------------------
                                    152 ; print 16 bits register 
                                    153 ; input:
                                    154 ;   X   point register name 
                                    155 ;   Y   register value to print 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                    156 ; output:
                                    157 ;  none
                                    158 ;--------------------------------
      0004A2                        159 prt_reg16: 
      008490 E7 CD            [ 2]  160 	pushw y 
      008492 85 22 A6         [ 4]  161 	call puts 
      008495 0D CD            [ 2]  162 	ldw x,(1,sp) 
      008497 89 C0 CD 89      [ 1]  163 	mov base,#16 
      00849B C0 81 0A         [ 4]  164 	call prt_i16  
      00849E 72 65 67         [ 4]  165 	call left_paren 
      0084A1 69               [ 2]  166 	popw x 
      0084A2 73 74 65 72      [ 1]  167 	mov base,#10 
      0084A6 73 20 73         [ 4]  168 	call prt_i16  
      0084A9 74 61            [ 1]  169 	ld a,#') 
      0084AB 74 65 0A         [ 4]  170 	call putc
      0084AE 2D               [ 4]  171 	ret 
                                    172 
                                    173 ;------------------------------------
                                    174 ; print registers contents saved on
                                    175 ; stack by trap interrupt.
                                    176 ;------------------------------------
      0004C1                        177 print_registers:
      0084AF 2D 2D 2D         [ 2]  178 	ldw x,#STATES
      0084B2 2D 2D 2D         [ 4]  179 	call puts
                                    180 ; print EPC 
      0084B5 2D 2D 2D         [ 2]  181 	ldw x, #REG_EPC
      0084B8 2D 2D 2D         [ 4]  182 	call puts 
      0084BB 2D 2D            [ 1]  183 	ld a, (11,sp)
      0084BD 2D 2D 2D         [ 1]  184 	ld acc8,a 
      0084C0 2D 2D            [ 1]  185 	ld a, (10,sp) 
      0084C2 0A 00 0D         [ 1]  186 	ld acc16,a 
      0084C4 7B 09            [ 1]  187 	ld a,(9,sp) 
      0084C4 89 35 10         [ 1]  188 	ld acc24,a
      0084C7 00               [ 1]  189 	clrw x  
      0084C8 0B CD            [ 1]  190 	ld a,#16
      0084CA 98 74 A6         [ 4]  191 	call prt_acc24  
                                    192 ; print X
      0084CD 3A CD 89         [ 2]  193 	ldw x,#REG_X
      0084D0 C0 A6            [ 2]  194 	ldw y,(5,sp)
      0084D2 20 CD 89         [ 4]  195 	call prt_reg16  
                                    196 ; print Y 
      0084D5 C0 85 F6         [ 2]  197 	ldw x,#REG_Y
      0084D8 5F 97            [ 2]  198 	ldw y, (7,sp)
      0084DA 35 0A 00         [ 4]  199 	call prt_reg16  
                                    200 ; print A 
      0084DD 0B CD 98         [ 2]  201 	ldw x,#REG_A
      0084E0 74 81            [ 1]  202 	ld a, (4,sp) 
      0084E2 CD 04 80         [ 4]  203 	call prt_reg8
                                    204 ; print CC 
      0084E2 72 1A 50         [ 2]  205 	ldw x,#REG_CC 
      0084E5 0A 81            [ 1]  206 	ld a, (3,sp) 
      0084E7 CD 04 80         [ 4]  207 	call prt_reg8 
                                    208 ; print SP 
      0084E7 72 1B 50         [ 2]  209 	ldw x,#REG_SP
      0084EA 0A 81            [ 1]  210 	ldw y,sp 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0084EC 72 A9 00 0C      [ 2]  211 	addw y,#12
      0084EC A6 20 C8         [ 4]  212 	call prt_reg16  
      0084EF 50 0A            [ 1]  213 	ld a,#'\n' 
      0084F1 C7 50 0A         [ 4]  214 	call putc
      0084F4 81               [ 4]  215 	ret
                                    216 
      0084F5 0A 52 65 67 69 73 74   217 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             65 72 73 20 73 74 61
             74 65 20 61 74 20 61
             62 6F 72 74 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      0084F5 A6 20 CD 89 C0         218 REG_EPC: .asciz "EPC:"
      0084FA A6 28 CD 89            219 REG_Y:   .asciz "\nY:" 
      0084FE C0 81 3A 00            220 REG_X:   .asciz "\nX:"
      008500 0A 41 3A 00            221 REG_A:   .asciz "\nA:" 
      008500 88 CD 8A 1D 7B         222 REG_CC:  .asciz "\nCC:"
      008505 01 5F 97 35 10         223 REG_SP:  .asciz "\nSP:"
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
      00056C                        235 cmd_itf:
      00850A 00 0B            [ 2]  236 	sub sp,#VSIZE 
      00850C CD 98 74 CD      [ 1]  237 	clr farptr 
      008510 84 F5 84 5F      [ 1]  238 	clr farptr+1 
      008514 97 35 0A 00      [ 1]  239 	clr farptr+2  
      00057A                        240 repl:
      008518 0B CD            [ 1]  241 	ld a,#CR 
      00851A 98 74 A6         [ 4]  242 	call putc 
      00851D 29 CD            [ 1]  243 	ld a,#'? 
      00851F 89 C0 81         [ 4]  244 	call putc
      008522 72 5F 00 00      [ 1]  245 	clr in.w 
      008522 90 89 CD 8A      [ 1]  246 	clr in 
      008526 1D 1E 01         [ 4]  247 	call readln
      008529 35 10 00 0B      [ 2]  248 	ldw y,#tib  
      00852D CD 98            [ 1]  249 	ld a,(y)
      00852F 74 CD            [ 1]  250 	jreq repl  
      008531 84 F5 85 35      [ 1]  251 	inc in 
      008535 0A 00 0B         [ 4]  252 	call to_upper 
      008538 CD 98            [ 1]  253 	cp a,#'Q 
      00853A 74 A6            [ 1]  254 	jrne test_p
      0005A2                        255 repl_exit:
      00853C 29 CD 89 C0      [ 1]  256 	clr tib 
      008540 81 5F 00 03      [ 1]  257 	clr count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      008541 72 5F 00 01      [ 1]  258 	clr in 
      0005AE                        259 	_drop #VSIZE 	
      008541 AE 85            [ 2]    1     addw sp,##VSIZE 
      008543 94               [ 4]  260 	ret  
      0005B1                        261 invalid:
      008544 CD 8A 1D         [ 2]  262 	ldw x,#invalid_cmd 
      008547 AE 85 D1         [ 4]  263 	call puts 
      00854A CD 8A            [ 2]  264 	jra repl 
      0005B9                        265 test_p:	
      00854C 1D 7B            [ 1]  266     cp a,#'P 
      00854E 0B C7            [ 1]  267 	jreq mem_peek
      008550 00 0F            [ 1]  268     cp a,#'S 
      008552 7B 0A            [ 1]  269 	jrne invalid 
      0005C1                        270 print_string:	
      008554 C7 00 0E         [ 4]  271 	call get_token
      008557 7B 09            [ 1]  272 	cp a,#TK_INTGR 
      008559 C7 00            [ 1]  273 	jrne invalid 
      00855B 0D 5F A6         [ 4]  274 	call puts
      00855E 10 CD 98         [ 2]  275 	jp repl 	
      0005CE                        276 mem_peek:
      008561 8B AE            [ 1]  277 	ld a,#SPACE 
      008563 85 DA 16         [ 4]  278 	call skip  	 
      008566 05 CD 85 22      [ 2]  279 	addw y,in.w 
      00856A AE 85 D6         [ 2]  280 	ldw x,#pad 
      00856D 16 07 CD         [ 4]  281 	call strcpy
      008570 85 22 AE         [ 2]  282 	ldw x,#pad
      008573 85 DE 7B         [ 4]  283 	call atoi24 	
      008576 04 CD 85         [ 1]  284 	ld a, acc24 
      008579 00 AE 85         [ 1]  285 	or a,acc16 
      00857C E2 7B 03         [ 1]  286 	or a,acc8 
      00857F CD 85            [ 1]  287 	jrne 1$ 
      008581 00 AE            [ 2]  288 	jra peek_byte  
      008583 85 E7 90         [ 2]  289 1$:	ldw x,acc24 
      008586 96 72 A9         [ 2]  290 	ldw farptr,x 
      008589 00 0C CD         [ 1]  291 	ld a,acc8 
      00858C 85 22 A6         [ 1]  292 	ld farptr+2,a 
      0005FC                        293 peek_byte:
      00858F 0A CD 89         [ 4]  294 	call print_farptr 
      008592 C0 81            [ 1]  295 	ld a,#8 
      008594 0A 52            [ 1]  296 	ld (PSIZE,sp),a 
      008596 65               [ 1]  297 	clrw x 
      008597 67 69 73         [ 4]  298 1$:	call fetchc  
      00859A 74               [ 2]  299 	pushw x 
      00859B 65 72 73         [ 1]  300 	ld acc8,a 
      00859E 20               [ 1]  301 	clrw x 
      00859F 73 74 61         [ 2]  302 	ldw acc24,x 
      0085A2 74 65            [ 1]  303 	ld a,#16+128
      0085A4 20 61 74         [ 4]  304 	call prt_acc24
      0085A7 20               [ 2]  305 	popw x 
      0085A8 61 62            [ 1]  306 	dec (PSIZE,sp)
      0085AA 6F 72            [ 1]  307 	jrne 1$ 
      0085AC 74 20            [ 1]  308 	ld a,#8 
      0085AE 70 6F 69         [ 1]  309 	add a,farptr+2 
      0085B1 6E 74 2E         [ 1]  310 	ld farptr+2,a
      0085B4 0A               [ 1]  311 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0085B5 2D 2D 2D         [ 1]  312 	adc a,farptr+1 
      0085B8 2D 2D 2D         [ 1]  313 	ld farptr+1,a 
      0085BB 2D               [ 1]  314 	clr a 
      0085BC 2D 2D 2D         [ 1]  315 	adc a,farptr 
      0085BF 2D 2D 2D         [ 1]  316 	ld farptr,a 
      0085C2 2D 2D 2D         [ 2]  317 	jp repl  
                                    318 
      0085C5 2D 2D 2D 2D 2D 2D 2D   319 invalid_cmd: .asciz "not a command\n" 
             2D 2D 2D 0A 00 45 50
             43
                                    320 
                                    321 ;----------------------------
                                    322 ; display farptr address
                                    323 ;----------------------------
      000641                        324 print_farptr:
      0085D4 3A 00 0A         [ 1]  325 	ld a ,farptr+2 
      0085D7 59 3A 00         [ 1]  326 	ld acc8,a 
      0085DA 0A 58 3A         [ 2]  327 	ldw x,farptr 
      0085DD 00 0A 41         [ 2]  328 	ldw acc24,x 
      0085E0 3A               [ 1]  329 	clrw x 
      0085E1 00 0A            [ 1]  330 	ld a,#16 
      0085E3 43 43 3A         [ 4]  331 	call prt_acc24
      0085E6 00 0A            [ 1]  332 	ld a,#SPACE 
      0085E8 53 50 3A         [ 4]  333 	call putc 
      0085EB 00 09 40         [ 4]  334 	call putc 
      0085EC 81               [ 4]  335 	ret
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
      00065C                        346 fetchc: ; @C
      0085EC 52 01 72 5F      [ 5]  347 	ldf a,([farptr],x)
      0085F0 00               [ 1]  348 	incw x
      0085F1 19               [ 4]  349 	ret
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
      000662                        360 number:
      0085F2 72 5F 00         [ 4]  361 	call get_token
      0085F5 1A 72            [ 1]  362 	cp a,#TK_INTGR
      0085F7 5F 00            [ 1]  363 	jreq 1$
      0085F9 1B 16 9E         [ 2]  364 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0085FA 81               [ 4]  365 1$:	ret
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
      00066D                        380 show_row:
      0085FA A6               [ 1]  381 	tnz a 
      0085FB 0D CD            [ 1]  382 	jrne 1$
      0085FD 89               [ 4]  383 	ret 
      000671                        384 1$:	
      0085FE C0               [ 2]  385 	pushw x  
      0085FF A6               [ 1]  386 	push a 
      008600 3F CD 89 C0      [ 1]  387 	mov tab_width,#4 
      008604 72 5F 00         [ 4]  388 	call prt_i16 
      008607 01 72            [ 1]  389 	ld a,#SPACE  
      008609 5F 00 02         [ 4]  390 	call putc
      00067F                        391 row_loop:
      00860C CD 8B            [ 2]  392 	ldw x,(ADR,sp)
      00860E 22               [ 1]  393 	ld a,(x)
      00860F 90               [ 1]  394 	clrw x 
      008610 AE               [ 1]  395 	ld xl,a 
      008611 16 68 90         [ 4]  396 	call prt_i16 
      008614 F6 27            [ 2]  397 	ldw x,(ADR,sp)
      008616 E3               [ 1]  398 	incw x 
      008617 72 5C            [ 2]  399 	ldw (ADR,sp),x 
      008619 00 02            [ 1]  400 	dec (CNT,sp)
      00861B CD 99            [ 1]  401 	jrne row_loop
      000690                        402 	_drop VSIZE  		
      00861D 0A A1            [ 2]    1     addw sp,#VSIZE 
      00861F 51 26 17 23      [ 1]  403 	mov tab_width,#4
      008622 A6 0D            [ 1]  404 	ld a,#CR 
      008622 72 5F 16         [ 4]  405 	call putc 
      008625 68               [ 4]  406 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      00069C                        419 hex_dump:
      008626 72               [ 1]  420 	push a 
      00069D                        421 	_vars VSIZE
      008627 5F 00            [ 2]    1     sub sp,#VSIZE 
      008629 04 72 5F         [ 1]  422 	ld a,base
      00862C 00 02            [ 1]  423 	ld (BASE,sp),a 
      00862E 5B 01 81 0A      [ 1]  424 	mov base,#16
      008631 C6 00 23         [ 1]  425 	ld a,tab_width 
      008631 AE 86            [ 1]  426 	ld (TABW,sp),a
      008633 B2 CD            [ 1]  427 	ld a,#CR 
      008635 8A 1D 20         [ 4]  428 	call putc 
      008638 C1 01            [ 2]  429 1$: ldw (BCNT,sp),y
      008639 A6 10            [ 1]  430 	ld a,#16
      008639 A1 50 27 11      [ 2]  431 	cpw y,#16
      00863D A1 53            [ 1]  432 	jrpl 2$
      00863F 26 F0            [ 1]  433 	ld a,yl
      008641                        434 2$: 	
      008641 CD 8F 97         [ 4]  435 	call show_row 
      008644 A1 84            [ 2]  436 	ldw y,(BCNT,sp) 
      008646 26 E9 CD 8A      [ 2]  437 	subw y,#16 
      00864A 1D CC 85 FA      [ 2]  438 	cpw y,#1
      00864E 2A E5            [ 1]  439 	jrpl 1$
      00864E A6 20            [ 1]  440 	ld a,(BASE,sp)
      008650 CD 8F 84         [ 1]  441 	ld base,a
      008653 72 B9            [ 1]  442 	ld a,(TABW,sp)
      008655 00 01 AE         [ 1]  443 	ld tab_width,a 
      0006D7                        444 	_drop VSIZE
      008658 16 B8            [ 2]    1     addw sp,#VSIZE 
      00865A CD               [ 1]  445 	pop a 
      00865B 94               [ 4]  446 	ret 
                                    447 
                                    448 .endif ; DEBUG 
                                    449 
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
                                     20 ;;;  In application Programming of 
                                     21 ;;;  FLASH, EEPROM and OPTION memory 
                                     22 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     23 
                                     24     .module IAP 
                                     25 
                                     26 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
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
      0006DB                         45 unlock_eeprom:
      00865C 7E AE 16 B8 CD   [ 2]   46 	btjt FLASH_IAPSR,#FLASH_IAPSR_DUL,9$
      008661 99 16 C6 00      [ 1]   47 	mov FLASH_CR2,#0 
      008665 0D CA 00 0E      [ 1]   48 	mov FLASH_NCR2,#0xFF 
      008669 CA 00 0F 26      [ 1]   49 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      00866D 02 20 0C CE      [ 1]   50     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      008671 00 0D CF 00 19   [ 2]   51 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008676 C6               [ 4]   52 9$:	ret
                                     53 
                                     54 ;----------------------------------
                                     55 ; unlock FLASH for writing/erasing
                                     56 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                     57 ; input:
                                     58 ;  none
                                     59 ; output:
                                     60 ;  none
                                     61 ;----------------------------------
      0006F6                         62 unlock_flash:
      008677 00 0F C7 00 1B   [ 2]   63 	btjt FLASH_IAPSR,#FLASH_IAPSR_PUL,9$
      00867C 35 00 50 5B      [ 1]   64 	mov FLASH_CR2,#0 
      00867C CD 86 C1 A6      [ 1]   65 	mov FLASH_NCR2,#0xFF 
      008680 08 6B 01 5F      [ 1]   66 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008684 CD 86 DC 89      [ 1]   67 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      008688 C7 00 0F 5F CF   [ 2]   68 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      00868D 00               [ 4]   69 9$:	ret
                                     70 
                                     71 ;----------------------------
                                     72 ; erase block code must be 
                                     73 ; executed from RAM
                                     74 ; input:
                                     75 ;-----------------------------
      000711                         76 row_erase:
      00868E 0D               [ 1]   77 	push a 
      00868F A6 90            [ 2]   78 	pushw y 
      008691 CD 98 8B 85      [ 1]   79 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      008695 0A 01 26 EB      [ 1]   80 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      008699 A6               [ 1]   81 	clr a 
      00869A 08 CB            [ 1]   82 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      00869C 00 1B C7 00      [ 1]   83 	ldf ([farptr],y),a
      0086A0 1B 4F            [ 1]   84     incw y
      0086A2 C9 00 1A C7      [ 1]   85 	ldf ([farptr],y),a
      0086A6 00 1A            [ 1]   86     incw y
      0086A8 4F C9 00 19      [ 1]   87 	ldf ([farptr],y),a
      0086AC C7 00            [ 1]   88     incw y
      0086AE 19 CC 85 FA      [ 1]   89 	ldf ([farptr],y),a
      0086B2 6E 6F 74 20 61   [ 2]   90 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      0086B7 20 63            [ 2]   91 	popw y 
      0086B9 6F               [ 1]   92 	pop a 
      0086BA 6D               [ 4]   93 	ret
      00073E                         94 row_erase_end:
                                     95 
                                     96 ; copy erase_start in RAM 
      00073E                         97 move_erase_to_ram:
      0086BB 6D               [ 2]   98 	pushw x 
      0086BC 61 6E            [ 2]   99 	pushw y 
      0086BE 64 0A 00         [ 2]  100 	ldw x,#row_erase_end 
      0086C1 1D 07 11         [ 2]  101 	subw x,#row_erase
      0086C1 C6 00 1B         [ 2]  102 	ldw acc16,x 
      0086C4 C7 00 0F         [ 2]  103 	ldw x,#tib 
      0086C7 CE 00 19 CF      [ 2]  104 	ldw y,#row_erase 
      0086CB 00 0D 5F         [ 4]  105 	call move
      0086CE A6 10            [ 2]  106 	popw y
      0086D0 CD               [ 2]  107 	popw x
      0086D1 98               [ 4]  108 	ret 
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
      000758                        123 program_row:
      0086D2 8B               [ 1]  124 	push a 
      0086D3 A6 20            [ 2]  125 	pushw y 
      0086D5 CD 89            [ 1]  126 	push #BLOCK_SIZE  
                                    127 ;enable block programming 
      0086D7 C0 CD 89 C0      [ 1]  128 	bset FLASH_CR2,#FLASH_CR2_PRG 
      0086DB 81 11 50 5C      [ 1]  129 	bres FLASH_NCR2,#FLASH_CR2_PRG
      0086DC 90 5F            [ 1]  130 	clrw y 
      0086DC 92               [ 1]  131 1$:	ld a,(x)
      0086DD AF 00 19 5C      [ 1]  132 	ldf ([farptr],y),a
      0086E1 81               [ 1]  133 	incw x 
      0086E2 90 5C            [ 1]  134 	incw y 
      0086E2 CD 8F            [ 1]  135 	dec (BCNT,sp)
      0086E4 97 A1            [ 1]  136 	jrne 1$
                                    137 ; wait EOP bit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0086E6 84 27 03 CC 97   [ 2]  138 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      000778                        139 	_drop 1 
      0086EB 1E 81            [ 2]    1     addw sp,#1 
      0086ED 90 85            [ 2]  140 	popw y 
      0086ED 4D               [ 1]  141 	pop a 
      0086EE 26               [ 4]  142 	ret 
      00077E                        143 program_row_end:
                                    144 
                                    145 ;-------------------------
                                    146 ; move program_row to RAM 
                                    147 ; at txtubound address 
                                    148 ;------------------------
      00077E                        149 move_prg_to_ram:
      0086EF 01               [ 2]  150 	pushw x 
      0086F0 81 89            [ 2]  151 	pushw y 
      0086F1 AE 07 7E         [ 2]  152 	ldw x,#program_row_end 
      0086F1 89 88 35         [ 2]  153 	subw x,#program_row 
      0086F4 04 00 24         [ 2]  154 	ldw acc16,x ; bytes to move 
      0086F7 CD 98 74         [ 2]  155 	ldw x,#tib ; destination address 
      0086FA A6 20 CD 89      [ 2]  156 	ldw y,#program_row ; source address 
      0086FE C0 14 0E         [ 4]  157 	call move
      0086FF 90 85            [ 2]  158 	popw y 
      0086FF 1E               [ 2]  159 	popw x  
      008700 02               [ 4]  160 	ret 
                                    161 
                                    162 
                                    163 ;-----------------------------
                                    164 ; write a buffer in FLASH/EEPROM 
                                    165 ; input:
                                    166 ;    farptr   destination address 
                                    167 ;    x        buffer address 
                                    168 ;-----------------------------
      000798                        169 write_buffer:
      008701 F6               [ 2]  170 	pushw x 
      008702 5F 97 CD 98      [ 1]  171 	tnz farptr 
      008706 74 1E            [ 1]  172 	jrne to_flash 
      008708 02 5C 1F         [ 2]  173 	ldw x,farptr+1 
      00870B 02 0A 01         [ 2]  174 	cpw x,#app_space  
      00870E 26 EF            [ 1]  175 	jruge to_flash 
      0007A7                        176 to_eeprom:
      008710 5B 03 35         [ 4]  177 	call unlock_eeprom
      008713 04 00            [ 2]  178 	jra do_programming
      0007AC                        179 to_flash:
      008715 24 A6 0D         [ 4]  180 	call unlock_flash
      0007AF                        181 do_programming:
      008718 CD               [ 2]  182 	popw x 
      008719 89 C0 81         [ 4]  183 	call tib
      00871C 72 13 50 5F      [ 1]  184 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      00871C 88 52 04 C6      [ 1]  185 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      008720 00               [ 4]  186 	ret 
                                    187 
                                    188 
                                    189 ;-----------------------------------
                                    190 ; erase flash or EEPROM block
                                    191 ; a block is 128 bytes 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                    192 ; input:
                                    193 ;   farptr  address row begin
                                    194 ; output:
                                    195 ;   none
                                    196 ;--------------------------------------
      0007BC                        197 block_erase:
      008721 0B               [ 2]  198 	pushw x 
      008722 6B 03 35         [ 1]  199 	ld a,farptr 
      008725 10 00            [ 1]  200 	jrne erase_flash
      008727 0B C6 00         [ 2]  201 	ldw x,farptr+1
      00872A 24 6B 04         [ 2]  202 	cpw x,#app_space 
      00872D A6 0D            [ 1]  203 	jruge erase_flash 
                                    204 ; erase eeprom block
      00872F CD 89 C0         [ 4]  205 	call unlock_eeprom 
      008732 17 01 A6         [ 4]  206 	call tib 
      008735 10 90 A3 00      [ 1]  207 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      008739 10 2A            [ 2]  208 	jra erase_exit  
                                    209 ; erase flash block:
      0007D6                        210 erase_flash:
      00873B 02 90 9F         [ 4]  211 	call unlock_flash 
      00873E CD 16 68         [ 4]  212 	call tib 
      00873E CD 86 ED 16      [ 1]  213     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0007E0                        214 erase_exit: 
      008742 01               [ 2]  215 	popw x 
      008743 72               [ 4]  216 	ret 
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
      0007E2                        232 write_byte:
      008744 A2 00            [ 2]  233 	pushw y
      0007E4                        234 	_vars VSIZE
      008746 10 90            [ 2]    1     sub sp,#VSIZE 
      008748 A3 00            [ 1]  235 	ld (BTW,sp),a ; byte to write 
      00874A 01 2A            [ 1]  236 	clr (OPT,sp)  ; OPTION flag
                                    237 ; put addr[15:0] in Y, for bounds check.
      00874C E5 7B 03 C7      [ 2]  238 	ldw y,farptr+1   ; Y=addr15:0
                                    239 ; check addr[23:16], if <> 0 then it is extened flash memory
      008750 00 0B 7B 04      [ 1]  240 	tnz farptr 
      008754 C7 00            [ 1]  241 	jrne write_flash
      008756 24 5B 04 84      [ 2]  242     cpw y,#app_space 	 
      00875A 81 0E            [ 1]  243     jruge write_flash
      00875B 90 A3 40 00      [ 2]  244 	cpw y,#EEPROM_BASE  
      00875B 72 06            [ 1]  245     jrult write_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      00875D 50 5F 15 35      [ 2]  246 	cpw y,#OPTION_END 
      008761 00 50            [ 1]  247 	jrugt write_exit
      008763 5B 35            [ 2]  248 	jra write_eeprom 
                                    249 ; write program memory
      000808                        250 write_flash:
      008765 FF 50 5C         [ 4]  251 	call unlock_flash 
      008768 35               [ 1]  252 1$:	sim 
      008769 AE 50            [ 1]  253 	ld a,(BTW,sp)
      00876B 64 35 56 50      [ 4]  254 	ldf ([farptr],x),a ; farptr[x]=A
      00876F 64 72 07 50 5F   [ 2]  255 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008774 FB               [ 1]  256     rim 
      008775 81 13 50 5F      [ 1]  257     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008776 20 39            [ 2]  258     jra write_exit
                                    259 ; write eeprom and option
      00081E                        260 write_eeprom:
      008776 72 02 50         [ 4]  261 	call unlock_eeprom
                                    262 	; check for data eeprom or option eeprom
      008779 5F 15 35 00      [ 2]  263 	cpw y,#OPTION_BASE
      00877D 50 5B            [ 1]  264 	jrmi 1$
      00877F 35 FF 50 5C      [ 2]  265 	cpw y,#OPTION_END+1
      008783 35 56            [ 1]  266 	jrpl 1$
      008785 50 62            [ 1]  267 	cpl (OPT,sp)
      00082F                        268 1$: 
      008787 35 AE            [ 1]  269     tnz (OPT,sp)
      008789 50 62            [ 1]  270     jreq 2$
                                    271 	; pour modifier une option il faut modifier ces 2 bits
      00878B 72 03 50 5F      [ 1]  272     bset FLASH_CR2,#FLASH_CR2_OPT
      00878F FB 81 50 5C      [ 1]  273     bres FLASH_NCR2,#FLASH_CR2_OPT 
      008791                        274 2$: 
      008791 88 90            [ 1]  275     ld a,(BTW,sp)
      008793 89 35 20 50      [ 4]  276     ldf ([farptr],x),a
      008797 5B 35            [ 1]  277     tnz (OPT,sp)
      008799 DF 50            [ 1]  278     jreq 3$
      00879B 5C               [ 1]  279     incw x
      00879C 4F 90            [ 1]  280     ld a,(BTW,sp)
      00879E 5F               [ 1]  281     cpl a
      00879F 91 A7 00 19      [ 4]  282     ldf ([farptr],x),a
      0087A3 90 5C 91 A7 00   [ 2]  283 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0087A8 19 90 5C 91 A7   [ 2]  284 	btjf FLASH_IAPSR,#FLASH_IAPSR_HVOFF,.
      000857                        285 write_exit:
      000857                        286 	_drop VSIZE 
      0087AD 00 19            [ 2]    1     addw sp,#VSIZE 
      0087AF 90 5C            [ 2]  287 	popw y
      0087B1 91               [ 4]  288     ret
                                    289 
                                    290 ;--------------------------------------------
                                    291 ; write a data block to eeprom or flash 
                                    292 ; the block must be erased before 
                                    293 ; using this routine.
                                    294 ; input:
                                    295 ;   Y        source address   
                                    296 ;   X        array index  destination  farptr[x]
                                    297 ;   BSIZE    block size bytes 
                                    298 ;   farptr   write address , byte* 
                                    299 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                                    300 ;	X 		after last byte written 
                                    301 ;   Y 		after last byte read 
                                    302 ;  farptr   point after block
                                    303 ;---------------------------------------------
      00085C                        304 	_argofs 3 
                           000005     1     ARG_OFS=2+3 
      00085C                        305 	_arg BSIZE 1  ; block size
                           000006     1     BSIZE=ARG_OFS+1 
                                    306 	; local var 
                           000001   307 	XSAVE=1 
                           000002   308 	VSIZE=2 
      00085C                        309 write_block::
      0087B2 A7               [ 1]  310 	push a 
      00085D                        311 	_vars VSIZE
      0087B3 00 19            [ 2]    1     sub sp,#VSIZE 
      0087B5 72 05            [ 2]  312 	ldw (XSAVE,sp),x 
      0087B7 50 5F            [ 2]  313 	ldw x,(BSIZE,sp) 
      0087B9 FB 90            [ 1]  314 	jreq 9$
      0087BB 85 84            [ 2]  315 1$:	ldw x,(XSAVE,sp)
      0087BD 81 F6            [ 1]  316 	ld a,(y)
      0087BE CD 07 E2         [ 4]  317 	call write_byte 
      0087BE 5C               [ 1]  318 	incw x 
      0087BE 89 90            [ 1]  319 	incw y 
      0087C0 89 AE            [ 2]  320 	ldw (XSAVE,sp),x
      0087C2 87 BE            [ 2]  321 	ldw x,(BSIZE,sp)
      0087C4 1D               [ 2]  322 	decw x
      0087C5 87 91            [ 2]  323 	ldw (BSIZE,sp),x 
      0087C7 CF 00            [ 1]  324 	jrne 1$
      000878                        325 9$:
      0087C9 0E AE            [ 2]  326 	ldw x,(XSAVE,sp)
      0087CB 16 68 90         [ 4]  327 	call incr_farptr
      00087D                        328 	_drop VSIZE
      0087CE AE 87            [ 2]    1     addw sp,#VSIZE 
      0087D0 91               [ 1]  329 	pop a 
      0087D1 CD               [ 4]  330 	ret 
                                    331 
                                    332 
                                    333 ;------------------------------------
                                    334 ; write n bytes to flash | eeprom 
                                    335 ; if the number of bytes is 
                                    336 ; >=128 it is faster to 
                                    337 ; use write_block
                                    338 ; the bytes are written one by 
                                    339 ; one and auto erased if required. 
                                    340 ; input:
                                    341 ;    farptr    dest address 
                                    342 ;    X         src address 
                                    343 ;    A         count 
                                    344 ; output:
                                    345 ;    none   
                                    346 ;----------------------------------
      000881                        347 write_nbytes:
      0087D2 94 8E            [ 2]  348 	pushw y
      0087D4 90               [ 1]  349 	push a 
      0087D5 85 85            [ 1]  350 	ldw y,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0087D7 81               [ 1]  351 	clrw x 
      0087D8                        352 1$:  
      0087D8 88 90            [ 1]  353 	ld a,(y)
      0087DA 89 4B            [ 1]  354 	incw y
      0087DC 80 72 10         [ 4]  355 	call write_byte 
      0087DF 50               [ 1]  356 	incw x 
      0087E0 5B 72            [ 1]  357 	dec (1,sp)  
      0087E2 11 50            [ 1]  358 	jrne 1$ 
      0087E4 5C               [ 1]  359 9$: pop a 
      0087E5 90 5F            [ 2]  360 	popw y 
      0087E7 F6               [ 4]  361 	ret 
                                    362 
                                    363 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    364 ;;;  flash memory operations
                                    365 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    366 
                                    367 ;--------------------------
                                    368 ; align farptr to BLOCK_SIZE 
                                    369 ;---------------------------
      000897                        370 row_align:
      0087E8 91 A7            [ 1]  371 	ld a,#0x7f 
      0087EA 00 19 5C         [ 1]  372 	and a,farptr+2 
      0087ED 90 5C            [ 1]  373 	jreq 1$ 
      0087EF 0A 01 26         [ 2]  374 	ldw x,farptr+1 
      0087F2 F4 72 05         [ 2]  375 	addw x,#BLOCK_SIZE 
      0087F5 50 5F            [ 1]  376 	jrnc 0$
      0087F7 FB 5B 01 90      [ 1]  377 	inc farptr 
      0087FB 85               [ 1]  378 0$: ld a,xl 
      0087FC 84 81            [ 1]  379 	and a,#0x80
      0087FE 97               [ 1]  380 	ld xl,a
      0087FE CF 00 19         [ 2]  381 	ldw farptr+1,x  	
      0087FE 89               [ 4]  382 1$:	ret
                                    383 
                                    384 ;--------------------
                                    385 ; input:
                                    386 ;   X     increment 
                                    387 ; output:
                                    388 ;   farptr  incremented 
                                    389 ;---------------------
      0008B2                        390 incr_farptr:
      0087FF 90 89 AE 87      [ 2]  391 	addw x,farptr+1 
      008803 FE 1D            [ 1]  392 	jrnc 1$
      008805 87 D8 CF 00      [ 1]  393 	inc farptr 
      008809 0E AE 16         [ 2]  394 1$:	ldw farptr+1,x  
      00880C 68               [ 4]  395 	ret 
                                    396 
                                    397 ;-----------------------------------
                                    398 ; scan block for non zero byte 
                                    399 ; block are 128 bytes 
                                    400 ; input:
                                    401 ;    farptr     address block  
                                    402 ; output:
                                    403 ;     A     0 cleared, other not cleared  
                                    404 ;-----------------------------------
      0008C0                        405 scan_block:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      00880D 90               [ 1]  406 	clrw x 
      00880E AE 87 D8 CD      [ 5]  407 1$: ldf a,([farptr],x) 
      008812 94 8E            [ 1]  408 	jrne 2$
      008814 90               [ 1]  409 	incw x 
      008815 85 85 81         [ 2]  410 	cpw x,#BLOCK_SIZE 
      008818 25 F4            [ 1]  411 	jrult 1$ 
      008818 89               [ 4]  412 2$:	ret 
                                    413 
                                    414 
                                    415 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
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
      0008CE                         66 Uart1RxHandler: ; console receive char 
      008819 72 5D 00 19 26   [ 2]   67 	btjf UART1_SR,#UART_SR_RXNE,5$
      00881E 0D CE 00         [ 1]   68 	ld a,UART1_DR 
      008821 1A A3            [ 1]   69 	cp a,#CTRL_C 
      008823 B6 00            [ 1]   70 	jrne 2$
      008825 24 05 40         [ 4]   71 	call putc 
      008827 CC 00 57         [ 2]   72 	jp user_interrupted
      0008E0                         73 2$:
      008827 CD 87            [ 1]   74 	cp a,#CAN ; CTRL_X 
      008829 5B 20            [ 1]   75 	jrne 3$
      00882B 03 00 C3         [ 2]   76 	jp cold_start 	
      00882C 88               [ 1]   77 3$:	push a 
      00882C CD 87            [ 1]   78 	ld a,#rx1_queue 
      00882E 76 00 2F         [ 1]   79 	add a,rx1_tail 
      00882F 5F               [ 1]   80 	clrw x 
      00882F 85               [ 1]   81 	ld xl,a 
      008830 CD               [ 1]   82 	pop a 
      008831 16               [ 1]   83 	ld (x),a 
      008832 68 72 13         [ 1]   84 	ld a,rx1_tail 
      008835 50               [ 1]   85 	inc a 
      008836 5F 72            [ 1]   86 	and a,#RX_QUEUE_SIZE-1
      008838 17 50 5F         [ 1]   87 	ld rx1_tail,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      00883B 81               [11]   88 5$:	iret 
                                     89 
                                     90 ;---------------------------------------------
                                     91 ; initialize UART1, 115200 8N1
                                     92 ; input:
                                     93 ;	none
                                     94 ; output:
                                     95 ;   none
                                     96 ;---------------------------------------------
      00883C                         97 uart1_init:
      00883C 89 C6 00 19      [ 1]   98     bset PA_DDR,#UART1_TX_PIN
      008840 26 14 CE 00      [ 1]   99     bset PA_CR1,#UART1_TX_PIN 
      008844 1A A3 B6 00      [ 1]  100     bset PA_CR2,#UART1_TX_PIN 
                                    101 ; enable UART1 clock
      008848 24 0C CD 87      [ 1]  102 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      00090B                        103 uart1_set_baud: 
      00884C 5B               [ 1]  104 	push a 
                                    105 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    106 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      00884D CD 16            [ 1]  107 	ld a,#CLK_SWR_HSI
      00884F 68 72 17         [ 1]  108 	cp a,CLK_CMSR 
      008852 50 5F            [ 1]  109 	jreq 2$ 
      000913                        110 1$: ; 8 Mhz 	
      008854 20 0A 52 33      [ 1]  111 	mov UART1_BRR2,#0x05 ; must be loaded first
      008856 35 04 52 32      [ 1]  112 	mov UART1_BRR1,#0x4
      008856 CD 87            [ 2]  113 	jra 3$
      00091D                        114 2$: ; 16 Mhz 	
      008858 76 CD 16 68      [ 1]  115 	mov UART1_BRR2,#0x0b ; must be loaded first
      00885C 72 13 50 5F      [ 1]  116 	mov UART1_BRR1,#0x08
      008860                        117 3$:
      008860 85 81 52 31      [ 1]  118     clr UART1_DR
      008862 35 2C 52 35      [ 1]  119 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008862 90 89 52 02      [ 1]  120 	bset UART1_CR2,#UART_CR2_SBK
      008866 6B 01 0F 02 90   [ 2]  121     btjf UART1_SR,#UART_SR_TC,.
      00886B CE 00 1A 72      [ 1]  122     clr rx1_head 
      00886F 5D 00 19 26      [ 1]  123 	clr rx1_tail
      008873 14               [ 1]  124 	pop a  
      008874 90               [ 4]  125 	ret
                                    126 
                                    127 ;---------------------------------
                                    128 ; uart1_putc
                                    129 ; send a character via UART1
                                    130 ; input:
                                    131 ;    A  	character to send
                                    132 ;---------------------------------
      000940                        133 putc:: ; console output always on UART1
      000940                        134 uart1_putc:: 
      008875 A3 B6 00 24 0E   [ 2]  135 	btjf UART1_SR,#UART_SR_TXE,.
      00887A 90 A3 40         [ 1]  136 	ld UART1_DR,a 
      00887D 00               [ 4]  137 	ret 
                                    138 
                                    139 
                                    140 ;---------------------------------
                                    141 ; Query for character in rx1_queue
                                    142 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                    143 ;   none 
                                    144 ; output:
                                    145 ;   A     0 no charcter available
                                    146 ;   Z     1 no character available
                                    147 ;---------------------------------
      000949                        148 qgetc::
      000949                        149 uart1_qgetc::
      00887E 25 57 90         [ 1]  150 	ld a,rx1_head 
      008881 A3 48 7F         [ 1]  151 	sub a,rx1_tail 
      008884 22               [ 4]  152 	ret 
                                    153 
                                    154 ;---------------------------------
                                    155 ; wait character from UART1 
                                    156 ; input:
                                    157 ;   none
                                    158 ; output:
                                    159 ;   A 			char  
                                    160 ;--------------------------------	
      000950                        161 getc:: ;console input
      000950                        162 uart1_getc::
      008885 51 20 16         [ 4]  163 	call uart1_qgetc
      008888 27 FB            [ 1]  164 	jreq uart1_getc 
      008888 CD               [ 2]  165 	pushw x 
                                    166 ;; rx1_queue must be in page 0 	
      008889 87 76            [ 1]  167 	ld a,#rx1_queue
      00888B 9B 7B 01         [ 1]  168 	add a,rx1_head 
      00888E 92               [ 1]  169 	clrw x  
      00888F A7               [ 1]  170 	ld xl,a 
      008890 00               [ 1]  171 	ld a,(x)
      008891 19               [ 1]  172 	push a
      008892 72 05 50         [ 1]  173 	ld a,rx1_head 
      008895 5F               [ 1]  174 	inc a 
      008896 FB 9A            [ 1]  175 	and a,#RX_QUEUE_SIZE-1
      008898 72 13 50         [ 1]  176 	ld rx1_head,a 
      00889B 5F               [ 1]  177 	pop a  
      00889C 20               [ 2]  178 	popw x
      00889D 39               [ 4]  179 	ret 
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
      00889E 43 81 44 80 48 82 46   194 convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',KEY_END,'3',SUP,0,0
             83 33 84 00 00
                                    195 
                                    196 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
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
      000977                        207 get_escape:
      00889E CD 87 5B         [ 4]  208     call getc 
      0088A1 90 A3            [ 1]  209     cp a,#'[ ; this character is expected after ESC 
      0088A3 48 00            [ 1]  210     jreq 1$
      0088A5 2B               [ 1]  211     clr a
      0088A6 08               [ 4]  212     ret
      0088A7 90 A3 48         [ 4]  213 1$: call getc 
      0088AA 80 2A 02         [ 2]  214     ldw x,#convert_table
      000986                        215 2$:
      0088AD 03               [ 1]  216     cp a,(x)
      0088AE 02 08            [ 1]  217     jreq 4$
      0088AF 1C 00 02         [ 2]  218     addw x,#2
      0088AF 0D               [ 1]  219     tnz (x)
      0088B0 02 27            [ 1]  220     jrne 2$
      0088B2 08               [ 1]  221     clr a
      0088B3 72               [ 4]  222     ret 
      0088B4 1E               [ 1]  223 4$: incw x 
      0088B5 50               [ 1]  224     ld a,(x)
      0088B6 5B 72            [ 1]  225     cp a,#SUP
      0088B8 1F 50            [ 1]  226     jrne 5$
      0088BA 5C               [ 1]  227     push a 
      0088BB CD 09 50         [ 4]  228     call getc
      0088BB 7B               [ 1]  229     pop a 
      00099C                        230 5$:
      0088BC 01               [ 4]  231     ret 
                                    232 
                                    233 
                                    234 ;-----------------------------
                                    235 ; send an ASCIZ string to UART1 
                                    236 ; input: 
                                    237 ;   x 		char * 
                                    238 ; output:
                                    239 ;   none 
                                    240 ;-------------------------------
      00099D                        241 puts::
      0088BD 92               [ 1]  242     ld a,(x)
      0088BE A7 00            [ 1]  243 	jreq 1$
      0088C0 19 0D 02         [ 4]  244 	call putc 
      0088C3 27               [ 1]  245 	incw x 
      0088C4 08 5C            [ 2]  246 	jra puts 
      0088C6 7B               [ 4]  247 1$:	ret 
                                    248 
                                    249 
                                    250 ;---------------------------
                                    251 ; delete character at left 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                    252 ; of cursor on terminal 
                                    253 ; input:
                                    254 ;   none 
                                    255 ; output:
                                    256 ;	none 
                                    257 ;---------------------------
      0009A7                        258 bksp:
      0088C7 01 43            [ 1]  259 	ld a,#BS 
      0088C9 92 A7 00         [ 4]  260 	call putc 
      0088CC 19 72            [ 1]  261 	ld a,#SPACE 
      0088CE 05 50 5F         [ 4]  262 	call putc 
      0088D1 FB 72            [ 1]  263 	ld a,#BS 
      0088D3 0D 50 5F         [ 4]  264 	call putc 
      0088D6 FB               [ 4]  265 	ret 
                                    266 ;---------------------------
                                    267 ; delete n character left of cursor 
                                    268 ; at terminal.
                                    269 ; input: 
                                    270 ;   A   number of characters to delete.
                                    271 ; output:
                                    272 ;    none 
                                    273 ;--------------------------	
      0088D7                        274 delete_nchar:
      0088D7 5B               [ 1]  275 	push a 
      0088D8 02 90            [ 1]  276 0$:	tnz (1,sp)
      0088DA 85 81            [ 1]  277 	jreq 1$
      0088DC CD 09 A7         [ 4]  278 	call bksp 
      0088DC 88 52            [ 1]  279 	dec (1,sp)
      0088DE 02 1F            [ 2]  280 	jra 0$
      0088E0 01               [ 1]  281 1$:	pop a 
      0088E1 1E               [ 4]  282 	ret
                                    283 
                                    284 ;--------------------------
                                    285 ; send ANSI escape sequence
                                    286 ; ANSI: ESC[
                                    287 ; note: ESC is ASCII 27
                                    288 ;       [   is ASCII 91  
                                    289 ;-------------------------- 
      0009C5                        290 send_escape:
      0088E2 06 27            [ 1]  291 	ld a,#ESC 
      0088E4 13 1E 01         [ 4]  292 	call putc 
      0088E7 90 F6            [ 1]  293 	ld a,#'[
      0088E9 CD 88 62         [ 4]  294 	call putc 
      0088EC 5C               [ 4]  295 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                    307 ; 	A {0..99} 
                                    308 ; output:
                                    309 ;   none 
                                    310 ;---------------------
      0009D0                        311 send_parameter:
      0088ED 90               [ 2]  312 	pushw x 
      0088EE 5C               [ 1]  313 	clrw x 
      0088EF 1F               [ 1]  314 	ld xl,a 
      0088F0 01 1E            [ 1]  315 	ld a,#10 
      0088F2 06               [ 2]  316 	div x,a 
      0088F3 5A               [ 1]  317 	ld xh,a 
      0088F4 1F               [ 1]  318 	ld a,xl
      0088F5 06               [ 1]  319     tnz a 
      0088F6 26 ED            [ 1]  320     jreq 2$
      0088F8 A1 09            [ 1]  321 	cp a,#9 
      0088F8 1E 01            [ 2]  322 	jrule 1$
      0088FA CD 89            [ 1]  323 	ld a,#9
      0009E1                        324 1$:
      0088FC 32 5B            [ 1]  325 	add a,#'0 
      0088FE 02 84 81         [ 4]  326 	call putc
      008901 9E               [ 1]  327 2$:	ld a,xh 
      008901 90 89            [ 1]  328 	add a,#'0
      008903 88 90 93         [ 4]  329 	call putc 
      008906 5F               [ 2]  330 	popw x 
      008907 81               [ 4]  331 	ret 
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
      0009EE                        344 move_left:
      008907 90               [ 1]  345 	push a 
      008908 F6 90 5C         [ 4]  346 	call send_escape
      00890B CD               [ 1]  347     pop a
      00890C 88 62 5C         [ 4]  348 	call send_parameter 
      00890F 0A 01            [ 1]  349 	ld a,#'D 
      008911 26 F4 84         [ 4]  350 	call putc 
      008914 90               [ 4]  351 	ret	
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      0009FC                        362 move_right:
      008915 85               [ 1]  363 	push a 
      008916 81 09 C5         [ 4]  364 	call send_escape
      008917 84               [ 1]  365     pop a
      008917 A6 7F C4         [ 4]  366 	call send_parameter 
      00891A 00 1B            [ 1]  367 	ld a,#'C 
      00891C 27 13 CE         [ 4]  368 	call putc 
      00891F 00               [ 4]  369 	ret 
                                    370 
                                    371 
                                    372 ;--------------------------
                                    373 ; print n spaces on terminal
                                    374 ; input:
                                    375 ;  X 		number of spaces 
                                    376 ; output:
                                    377 ;	none 
                                    378 ;---------------------------
      000A0A                        379 spaces::
      008920 1A 1C            [ 1]  380 	ld a,#SPACE 
      008922 00               [ 2]  381 1$:	tnzw x
      008923 80 24            [ 1]  382 	jreq 9$
      008925 04 72 5C         [ 4]  383 	call putc 
      008928 00               [ 2]  384 	decw x
      008929 19 9F            [ 2]  385 	jra 1$
      000A15                        386 9$: 
      00892B A4               [ 4]  387 	ret 
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
                                    398 ;   tib     updated 
                                    399 ;   Y       updated  
                                    400 ;-------------------------
                           000001   401 	IPOS=1
                           000002   402 	KCHAR=2 
                           000003   403     LLEN=3 
                           000003   404 	VSIZE=3 
      000A16                        405 insert_char: 
      000A16                        406 	_vars VSIZE 
      00892C 80 97            [ 2]    1     sub sp,#VSIZE 
      00892E CF 00            [ 1]  407     ld (KCHAR,sp),a 
      008930 1A               [ 1]  408     ld a,xh 
      008931 81 01            [ 1]  409 	ld (IPOS,sp),a
      008932 9F               [ 1]  410     ld a,xl 
      008932 72 BB            [ 1]  411     ld (LLEN,sp),a  
      008934 00               [ 1]  412     ldw x,y
      008935 1A               [ 1]  413     incw x 
      008936 24 04            [ 1]  414     ld a,(LLEN,sp)
      008938 72 5C            [ 1]  415     sub a,(IPOS,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      00893A 00               [ 1]  416     inc a 
      00893B 19 CF 00         [ 1]  417     ld acc8,a 
      00893E 1A 81 00 0D      [ 1]  418     clr acc16
      008940 CD 14 0E         [ 4]  419     call move
      008940 5F 92 AF 00      [ 2]  420     ldw y,#tib 
      008944 19 26            [ 1]  421     ld a,(IPOS,sp)
      008946 06 5C A3         [ 1]  422     ld acc8,a 
      008949 00 80 25 F4      [ 2]  423     addw y,acc16 
      00894D 81 02            [ 1]  424     ld a,(KCHAR,sp)
      00894E 90 F7            [ 1]  425     ld (y),a
      00894E 72 0B            [ 1]  426     incw y  
      008950 52 30            [ 1]  427     ld a,(IPOS,sp)
      008952 27 C6 52         [ 4]  428     call move_left
      008955 31 A1 03         [ 2]  429     ldw x,#tib 
      008958 26 06 CD         [ 4]  430     call puts 
      00895B 89 C0            [ 1]  431     ld a,(LLEN,sp)
      00895D CC 80            [ 1]  432     sub a,(IPOS,sp) 
      00895F D7 09 EE         [ 4]  433     call move_left 
      008960                        434 	_drop VSIZE 
      008960 A1 18            [ 2]    1     addw sp,#VSIZE 
      008962 26               [ 4]  435 	ret 
                                    436 
                                    437 
                                    438 ;--------------------------
                                    439 ; delete character under cursor
                                    440 ; input:
                                    441 ;   A       line length   
                                    442 ;   xl      delete position
                                    443 ;   Y       line pointer 
                                    444 ;-------------------------
                           000001   445 	CPOS=1
                           000002   446 	LLEN=2
                           000002   447 	VSIZE=2
      000A59                        448 delete_under:
      000A59                        449 	_vars VSIZE 
      008963 03 CC            [ 2]    1     sub sp,#VSIZE 
      008965 81 43            [ 1]  450     ld (LLEN,sp),a 
      008967 88               [ 1]  451     ld a,xl 
      008968 A6 27            [ 1]  452     ld (CPOS,sp),a 
      00896A CB               [ 1]  453     ldw x,y ; move destination
      00896B 00 30            [ 1]  454     incw y  ; move source 
      00896D 5F 97            [ 1]  455     ld a,(LLEN,sp)
      00896F 84 F7            [ 1]  456     sub a,(CPOS,sp)
      008971 C6               [ 1]  457     inc a ; move including zero at end.
      008972 00 30 4C         [ 1]  458     ld acc8,a 
      008975 A4 07 C7 00      [ 1]  459     clr acc16 
      008979 30 80 0E         [ 4]  460 	call move 
      00897B 90 AE 16 68      [ 2]  461     ldw y,#tib 
      00897B 72 1A            [ 1]  462     ld a,(CPOS,sp)
      00897D 50 02 72         [ 1]  463     ld acc8,a 
      008980 1A 50 03 72      [ 2]  464     addw y,acc16 
      008984 1A               [ 1]  465     ldw x,y 
      008985 50 04 72         [ 4]  466     call puts 
      008988 14 50            [ 1]  467     ld a,#SPACE  
      00898A C7 09 40         [ 4]  468     call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      00898B 7B 02            [ 1]  469     ld a,(LLEN,sp)
      00898B 88 A6            [ 1]  470     sub a,(CPOS,sp)
      00898D E1 C1 50         [ 4]  471     call move_left 
      008990 C3 27            [ 1]  472     dec (LLEN,sp)
      000A91                        473 	_drop VSIZE 
      008992 0A 02            [ 2]    1     addw sp,#VSIZE 
      008993 81               [ 4]  474 	ret 
                                    475 
                                    476 ;-----------------------------
                                    477 ; send ANSI sequence to delete
                                    478 ; whole line. Cursor position
                                    479 ; is not updated.
                                    480 ; ANSI: ESC[2K
                                    481 ; input:
                                    482 ;   none
                                    483 ; output:
                                    484 ;   none 
                                    485 ;-----------------------------
      000A94                        486 delete_line:
      008993 35 05 52         [ 4]  487     call send_escape
      008996 33 35            [ 1]  488 	ld a,#'2
      008998 04 52 32         [ 4]  489 	call putc 
      00899B 20 08            [ 1]  490 	ld a,#'K 
      00899D CD 09 40         [ 4]  491 	call putc 
      00899D 35               [ 4]  492 	ret 
                                    493 
                                    494 
                                    495 
                                    496 ;------------------------------------
                                    497 ; read a line of text from terminal
                                    498 ;  control keys: 
                                    499 ;    BS   efface caractère à gauche 
                                    500 ;    ln+CTRL_E  edit ligne# 'ln' line # 
                                    501 ;    CTRL_R  edit previous line.
                                    502 ;    CTRL_D  delete line  
                                    503 ;    HOME  go to start of line  
                                    504 ;    KEY_END  go to end of line 
                                    505 ;    ARROW_LEFT  move cursor left 
                                    506 ;    ARROW_RIGHT  move cursor right 
                                    507 ;    CTRL_O  toggle between insert/overwrite
                                    508 ; input:
                                    509 ;	none
                                    510 ; local variable on stack:
                                    511 ;	LL  line length
                                    512 ;   RXCHAR last received character 
                                    513 ; output:
                                    514 ;   text in tib  buffer
                                    515 ;   count  line length 
                                    516 ;------------------------------------
                                    517 	; local variables
                           000001   518 	LL_HB=1  ; line length high byte 
                           000001   519 	RXCHAR = 1 ; last char received
                           000002   520 	LL = 2  ; accepted line length
                           000003   521 	CPOS=3  ; cursor position 
                           000004   522 	OVRWR=4 ; overwrite flag 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                           000004   523 	VSIZE=4 
      000AA2                        524 readln::
      00899E 0B 52            [ 2]  525 	pushw y 
      000AA4                        526 	_vars VSIZE 
      0089A0 33 35            [ 2]    1     sub sp,#VSIZE 
      0089A2 08               [ 1]  527 	clrw x 
      0089A3 52 32            [ 2]  528 	ldw (LL,sp),x 
      0089A5 1F 03            [ 2]  529 	ldw (CPOS,sp),x 
      0089A5 72 5F            [ 1]  530 	cpl (OVRWR,sp) ; default to overwrite mode 
      0089A7 52 31 35 2C      [ 2]  531  	ldw y,#tib ; terminal input buffer
      000AB1                        532 readln_loop:
      0089AB 52 35 72         [ 4]  533 	call getc
      0089AE 10 52            [ 1]  534 	ld (RXCHAR,sp),a
      0089B0 35 72            [ 1]  535     cp a,#ESC 
      0089B2 0D 52            [ 1]  536     jrne 0$
      0089B4 30 FB 72         [ 4]  537     call get_escape 
      0089B7 5F 00            [ 1]  538     ld (RXCHAR,sp),a 
      0089B9 2F 72            [ 1]  539 0$:	cp a,#CR
      0089BB 5F 00            [ 1]  540 	jrne 1$
      0089BD 30 84 81         [ 2]  541 	jp readln_quit
      0089C0 A1 0A            [ 1]  542 1$:	cp a,#LF 
      0089C0 26 03            [ 1]  543 	jrne 2$ 
      0089C0 72 0F 52         [ 2]  544 	jp readln_quit
      000ACD                        545 2$:
      0089C3 30 FB            [ 1]  546 	cp a,#BS
      0089C5 C7 52            [ 1]  547 	jrne 3$
                                    548 ; delete left 
      0089C7 31 81            [ 1]  549     tnz (CPOS,sp)
      0089C9 27 DC            [ 1]  550     jreq readln_loop 
      0089C9 A6 01            [ 1]  551     ld a,#1 
      0089C9 C6 00 2F         [ 4]  552     call move_left
      0089CC C0 00            [ 1]  553     dec (CPOS,sp)
      0089CE 30 81            [ 2]  554     decw y 
      0089D0 7B 03            [ 1]  555     ld a,(CPOS,sp) 
      0089D0 CC 0B EA         [ 2]  556     jp 12$
      000AE3                        557 3$:
      0089D0 CD 89            [ 1]  558 	cp a,#CTRL_D
      0089D2 C9 27            [ 1]  559 	jrne 4$
                                    560 ;delete line 
      0089D4 FB 89 A6         [ 4]  561 	call delete_line 
      0089D7 27 CB            [ 1]  562     ld a,(CPOS,sp)
      0089D9 00               [ 1]  563     inc a 
      0089DA 2F 5F 97         [ 4]  564     call move_left 
      0089DD F6 88            [ 1]  565 	ld a,#'> 
      0089DF C6 00 2F         [ 4]  566 	call putc 
      0089E2 4C A4 07 C7      [ 2]  567 	ldw y,#tib
      0089E6 00 2F            [ 1]  568 	clr (y)
      0089E8 84 85            [ 1]  569 	clr (LL,sp)
      0089EA 81 43            [ 1]  570 	clr (CPOS,sp)
      0089EC 81 44            [ 2]  571 	jra readln_loop
      000B01                        572 4$:
      0089EE 80 48            [ 1]  573 	cp a,#CTRL_R 
      0089F0 82 46            [ 1]  574 	jrne 5$
                                    575 ;repeat line 
      0089F2 83 33            [ 1]  576 	tnz (LL,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      0089F4 84 00            [ 1]  577 	jrne readln_loop
      0089F6 00 AE 16 68      [ 2]  578 	ldw y,#tib 
      0089F7 93               [ 1]  579 	ldw x,y
      0089F7 CD 89 D0         [ 4]  580 	call strlen
      0089FA A1               [ 1]  581 	tnz a  
      0089FB 5B 27            [ 1]  582 	jreq readln_loop
      0089FD 02 4F            [ 1]  583 	ld (LL,sp),a 
      0089FF 81 CD            [ 1]  584     ld (CPOS,sp),a
      008A01 89               [ 1]  585 	ldw x,y  
      008A02 D0 AE 89         [ 4]  586 	call puts
      008A05 EB 01            [ 1]  587 	clr (LL_HB,sp)
      008A06 72 F9 01         [ 2]  588 	addw y,(LL_HB,sp)
      008A06 F1 27            [ 2]  589 	jra readln_loop 
      000B23                        590 5$:
      008A08 08 1C            [ 1]  591 	cp a,#CTRL_E 
      008A0A 00 02            [ 1]  592 	jrne 6$
                                    593 ;edit line number 
      008A0C 7D 26 F7         [ 2]  594 	ldw x,#tib 
      008A0F 4F 81 5C         [ 4]  595 	call atoi24
      008A12 F6 A1 84         [ 2]  596 	ldw x,acc16
      008A15 26 05 88         [ 4]  597 	call search_lineno
      008A18 CD               [ 2]  598 	tnzw x 
      008A19 89 D0            [ 1]  599 	jrne 51$
                                    600 ;	clr (LL,sp)
                                    601 ;	ldw y,#tib
                                    602 ;   clr (y) 	
      008A1B 84 0C 3E         [ 2]  603 	jp readln_quit  
      008A1C                        604 51$:
      008A1C 81 00 04         [ 2]  605 	ldw basicptr,x
      008A1D E6 02            [ 1]  606 	ld a,(2,x)
      008A1D F6 27 06         [ 1]  607 	ld count,a 
      008A20 CD 89 C0 5C      [ 2]  608 	ldw y,#tib 
      008A24 20 F7 81         [ 4]  609 	call decompile 
      008A27 0F 01            [ 1]  610 	clr (LL_HB,sp)
      008A27 A6 08            [ 1]  611 	ld a,#CR 
      008A29 CD 89 C0         [ 4]  612 	call putc 
      008A2C A6 20            [ 1]  613 	ld a,#'>
      008A2E CD 89 C0         [ 4]  614 	call putc
      008A31 A6 08 CD         [ 2]  615     ldw x,#tib  
      008A34 89 C0 81         [ 4]  616 	call strlen 
      008A37 6B 02            [ 1]  617 	ld (LL,sp),a 
      008A37 88 0D 01         [ 4]  618 	call puts 
      008A3A 27 07            [ 1]  619 	ldw y,x
      008A3C CD 8A            [ 1]  620     ld a,(LL,sp)
      008A3E 27 0A            [ 1]  621     ld (CPOS,sp),a  
      008A40 01 20 F5         [ 2]  622 	jp readln_loop
      000B68                        623 6$:
      008A43 84 81            [ 1]  624 	cp a,#ARROW_RIGHT
      008A45 26 15            [ 1]  625    	jrne 7$ 
                                    626 ; right arrow
      008A45 A6 1B            [ 1]  627 	ld a,(CPOS,sp)
      008A47 CD 89            [ 1]  628     cp a,(LL,sp)
      008A49 C0 A6            [ 1]  629     jrmi 61$
      008A4B 5B CD 89         [ 2]  630     jp readln_loop 
      000B75                        631 61$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      008A4E C0 81            [ 1]  632     ld a,#1 
      008A50 CD 09 FC         [ 4]  633 	call move_right 
      008A50 89 5F            [ 1]  634 	inc (CPOS,sp)
      008A52 97 A6            [ 1]  635     incw y 
      008A54 0A 62 95         [ 2]  636     jp readln_loop 
      008A57 9F 4D            [ 1]  637 7$: cp a,#ARROW_LEFT  
      008A59 27 0B            [ 1]  638 	jrne 8$
                                    639 ; left arrow 
      008A5B A1 09            [ 1]  640 	tnz (CPOS,sp)
      008A5D 23 02            [ 1]  641 	jrne 71$
      008A5F A6 09 B1         [ 2]  642 	jp readln_loop
      008A61                        643 71$:
      008A61 AB 30            [ 1]  644     ld a,#1 
      008A63 CD 89 C0         [ 4]  645 	call move_left 
      008A66 9E AB            [ 1]  646 	dec (CPOS,sp)
      008A68 30 CD            [ 2]  647     decw y 
      008A6A 89 C0 85         [ 2]  648 	jp readln_loop 
      008A6D 81 82            [ 1]  649 8$: cp a,#HOME  
      008A6E 26 0E            [ 1]  650 	jrne 9$
                                    651 ; HOME 
      008A6E 88 CD            [ 1]  652     ld a,(CPOS,sp)
      008A70 8A 45 84         [ 4]  653     call move_left 
      008A73 CD 8A            [ 1]  654 	clr (CPOS,sp)
      008A75 50 A6 44 CD      [ 2]  655     ldw y,#tib 
      008A79 89 C0 81         [ 2]  656 	jp readln_loop  
      008A7C A1 83            [ 1]  657 9$: cp a,#KEY_END  
      008A7C 88 CD            [ 1]  658 	jrne 10$
                                    659 ; KEY_END 
      008A7E 8A 45            [ 1]  660 	ld a,(CPOS,sp)
      008A80 84 CD            [ 1]  661 	cp a,(LL,sp)
      008A82 8A 50            [ 1]  662 	jrne 91$
      008A84 A6 43 CD         [ 2]  663 	jp readln_loop 
      000BB7                        664 91$:
      008A87 89 C0            [ 1]  665 	ld a,(LL,sp)
      008A89 81 03            [ 1]  666 	sub a,(CPOS,sp)
      008A8A CD 09 FC         [ 4]  667 	call move_right 
      008A8A A6 20            [ 1]  668 	ld a,(LL,sp)
      008A8C 5D 27            [ 1]  669 	ld (CPOS,sp),a
      008A8E 06 CD 89 C0      [ 2]  670     ldw y,#tib
      008A92 5A 20 F7 0D      [ 1]  671     clr acc16 
      008A95 C7 00 0E         [ 1]  672     ld acc8,a 
      008A95 81 B9 00 0D      [ 2]  673     addw y,acc16  
      008A96 CC 0A B1         [ 2]  674 	jp readln_loop 
      008A96 52 03            [ 1]  675 10$: cp a,#CTRL_O
      008A98 6B 02            [ 1]  676 	jrne 11$ 
                                    677 ; toggle between insert/overwrite
      008A9A 9E 6B            [ 1]  678 	cpl (OVRWR,sp)
      008A9C 01 9F 6B         [ 4]  679 	call beep_1khz
      008A9F 03 93 5C         [ 2]  680 	jp readln_loop 
      008AA2 7B 03            [ 1]  681 11$: cp a,#SUP 
      008AA4 10 01            [ 1]  682     jrne final_test 
                                    683 ; del character under cursor 
      008AA6 4C C7            [ 1]  684     ld a,(CPOS,sp)
      008AA8 00 0F            [ 1]  685     cp a,(LL,sp)
      008AAA 72 5F            [ 1]  686     jrpl 13$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      000BEA                        687 12$:
      008AAC 00               [ 1]  688     ld xl,a    ; cursor position 
      008AAD 0E CD            [ 1]  689     ld a,(LL,sp)  ; line length
      008AAF 94 8E 90         [ 4]  690     call delete_under
      008AB2 AE 16            [ 1]  691     dec (LLEN,sp)
      000BF2                        692 13$:
      008AB4 68 7B 01         [ 2]  693     jp readln_loop 
      000BF5                        694 final_test:
      008AB7 C7 00            [ 1]  695 	cp a,#SPACE
      008AB9 0F 72            [ 1]  696 	jrpl accept_char
      008ABB B9 00 0E         [ 2]  697 	jp readln_loop
      000BFC                        698 accept_char:
      008ABE 7B 02            [ 1]  699 	ld a,#TIB_SIZE-1
      008AC0 90 F7            [ 1]  700 	cp a, (LL,sp)
      008AC2 90 5C            [ 1]  701 	jrpl 1$
      008AC4 7B 01 CD         [ 2]  702 	jp readln_loop
      008AC7 8A 6E            [ 1]  703 1$:	tnz (OVRWR,sp)
      008AC9 AE 16            [ 1]  704 	jrne overwrite
                                    705 ; insert mode 
      008ACB 68 CD            [ 1]  706     ld a,(CPOS,sp)
      008ACD 8A 1D            [ 1]  707     cp a,(LL,sp)
      008ACF 7B 03            [ 1]  708     jreq overwrite
      008AD1 10 01            [ 1]  709     ld a,(LL,sp)
      008AD3 CD               [ 1]  710     ld xl,a 
      008AD4 8A 6E            [ 1]  711     ld a,(CPOS,sp)
      008AD6 5B               [ 1]  712     ld xh,a
      008AD7 03 81            [ 1]  713     ld a,(RXCHAR,sp)
      008AD9 CD 0A 16         [ 4]  714     call insert_char
      008AD9 52 02            [ 1]  715     inc (LLEN,sp)
      008ADB 6B 02            [ 1]  716     inc (CPOS,sp)	
      008ADD 9F 6B 01         [ 2]  717     jp readln_loop 
      000C21                        718 overwrite:
      008AE0 93 90            [ 1]  719 	ld a,(RXCHAR,sp)
      008AE2 5C 7B            [ 1]  720 	ld (y),a
      008AE4 02 10            [ 1]  721     incw y
      008AE6 01 4C C7         [ 4]  722     call putc 
      008AE9 00 0F            [ 1]  723 	ld a,(CPOS,sp)
      008AEB 72 5F            [ 1]  724 	cp a,(LL,sp)
      008AED 00 0E            [ 1]  725 	jrmi 1$
      008AEF CD 94            [ 1]  726 	clr (y)
      008AF1 8E 90            [ 1]  727 	inc (LL,sp)
      008AF3 AE 16            [ 1]  728     inc (CPOS,sp)
      008AF5 68 7B 01         [ 2]  729 	jp readln_loop 
      000C39                        730 1$:	
      008AF8 C7 00            [ 1]  731 	inc (CPOS,sp)
      008AFA 0F 72 B9         [ 2]  732 	jp readln_loop 
      000C3E                        733 readln_quit:
      008AFD 00 0E 93 CD      [ 2]  734 	ldw y,#tib
      008B01 8A 1D            [ 1]  735     clr (LL_HB,sp) 
      008B03 A6 20 CD         [ 2]  736     addw y,(LL_HB,sp)
      008B06 89 C0            [ 1]  737     clr (y)
      008B08 7B 02            [ 1]  738 	ld a,(LL,sp)
      008B0A 10 01 CD         [ 1]  739 	ld count,a 
      008B0D 8A 6E            [ 1]  740 	ld a,#CR
      008B0F 0A 02 5B         [ 4]  741 	call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      000C53                        742 	_drop VSIZE 
      008B12 02 81            [ 2]    1     addw sp,#VSIZE 
      008B14 90 85            [ 2]  743 	popw y 
      008B14 CD               [ 4]  744 	ret
                                    745 
                                    746 ;------------------------------
                                    747 ; print byte  in hexadecimal 
                                    748 ; on console
                                    749 ; input:
                                    750 ;    A		byte to print
                                    751 ;------------------------------
      000C58                        752 print_hex::
      008B15 8A               [ 1]  753 	push a 
      008B16 45               [ 1]  754 	swap a 
      008B17 A6 32 CD         [ 4]  755 	call to_hex_char 
      008B1A 89 C0 A6         [ 4]  756 	call putc 
      008B1D 4B CD            [ 1]  757     ld a,(1,sp) 
      008B1F 89 C0 81         [ 4]  758 	call to_hex_char
      008B22 CD 09 40         [ 4]  759 	call putc
      008B22 90 89            [ 1]  760 	ld a,#SPACE 
      008B24 52 04 5F         [ 4]  761 	call putc 
      008B27 1F               [ 1]  762 	pop a 
      008B28 02               [ 4]  763 	ret 
                                    764 
                                    765 ;----------------------------------
                                    766 ; convert to hexadecimal digit 
                                    767 ; input:
                                    768 ;   A       digit to convert 
                                    769 ; output:
                                    770 ;   A       hexdecimal character 
                                    771 ;----------------------------------
      000C6F                        772 to_hex_char::
      008B29 1F 03            [ 1]  773 	and a,#15 
      008B2B 03 04            [ 1]  774 	cp a,#9 
      008B2D 90 AE            [ 2]  775 	jrule 1$ 
      008B2F 16 68            [ 1]  776 	add a,#7
      008B31 AB 30            [ 1]  777 1$: add a,#'0 
      008B31 CD               [ 4]  778 	ret 
                                    779 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
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
      000C7A                         51 search_lineno::
      000C7A                         52 	_vars VSIZE
      008B32 89 D0            [ 2]    1     sub sp,#VSIZE 
      008B34 6B 01            [ 1]   53 	clr (LL,sp)
      008B36 A1 1B 26 05      [ 2]   54 	ldw y,txtbgn
      008B3A CD               [ 1]   55 	tnz a 
      008B3B 89 F7            [ 1]   56 	jreq search_ln_loop
      008B3D 6B 01 A1 0D      [ 2]   57 	ldw y,basicptr 
      000C89                         58 search_ln_loop:
      008B41 26 03 CC 8C      [ 2]   59 	cpw y,txtend 
      008B45 BE A1            [ 1]   60 	jrpl 8$
      008B47 0A 26            [ 1]   61 	cpw x,(y)
      008B49 03 CC            [ 1]   62 	jreq 9$
      008B4B 8C BE            [ 1]   63 	jrmi 8$ 
      008B4D 90 E6 02         [ 1]   64 	ld a,(2,y)
      008B4D A1 08            [ 1]   65 	ld (LB,sp),a 
      008B4F 26 12 0D         [ 2]   66 	addw y,(LL,sp)
      008B52 03 27            [ 2]   67 	jra search_ln_loop 
      000C9F                         68 8$: 
      008B54 DC               [ 1]   69 	clrw x 	
      008B55 A6               [ 1]   70 	exgw x,y 
      000CA1                         71 9$: _drop VSIZE
      008B56 01 CD            [ 2]    1     addw sp,#VSIZE 
      008B58 8A               [ 1]   72 	exgw x,y   
      008B59 6E               [ 4]   73 	ret 
                                     74 
                                     75 ;-------------------------------------
                                     76 ; delete line at addr
                                     77 ; input:
                                     78 ;   X 		addr of line i.e DEST for move 
                                     79 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                           000001    80 	LLEN=1
                           000003    81 	SRC=3
                           000004    82 	VSIZE=4
      000CA5                         83 del_line: 
      000CA5                         84 	_vars VSIZE 
      008B5A 0A 03            [ 2]    1     sub sp,#VSIZE 
      008B5C 90 5A            [ 1]   85 	ld a,(2,x) ; line length
      008B5E 7B 03            [ 1]   86 	ld (LLEN+1,sp),a 
      008B60 CC 8C            [ 1]   87 	clr (LLEN,sp)
      008B62 6A 93            [ 1]   88 	ldw y,x  
      008B63 72 F9 01         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      008B63 A1 04            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      008B65 26 1A CD 8B      [ 2]   91 	ldw y,txtend 
      008B69 14 7B 03         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      008B6C 4C CD 8A 6E      [ 2]   93 	ldw acc16,y 
      008B70 A6 3E            [ 2]   94 	ldw y,(SRC,sp)    ; source
      008B72 CD 89 C0         [ 4]   95 	call move
      008B75 90 AE 16 68      [ 2]   96 	ldw y,txtend 
      008B79 90 7F 0F         [ 2]   97 	subw y,(LLEN,sp)
      008B7C 02 0F 03 20      [ 2]   98 	ldw txtend,y  
      000CCF                         99 	_drop VSIZE     
      008B80 B0 04            [ 2]    1     addw sp,#VSIZE 
      008B81 81               [ 4]  100 	ret 
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
      000CD2                        115 create_gap:
      000CD2                        116 	_vars VSIZE
      008B81 A1 12            [ 2]    1     sub sp,#VSIZE 
      008B83 26 1E            [ 2]  117 	ldw (SRC,sp),x 
      008B85 0D 02            [ 2]  118 	ldw (LEN,sp),y 
      008B87 26 A8 90 AE      [ 2]  119 	ldw acc16,y 
      008B8B 16 68            [ 1]  120 	ldw y,x ; SRC
      008B8D 93 CD 94 62      [ 2]  121 	addw x,acc16  
      008B91 4D 27            [ 2]  122 	ldw (DEST,sp),x 
                                    123 ;compute size to move 	
      008B93 9D 6B 02         [ 2]  124 	ldw x,txtend 
      008B96 6B 03 93         [ 2]  125 	subw x,(SRC,sp)
      008B99 CD 8A 1D         [ 2]  126 	ldw acc16,x ; size to move
      008B9C 0F 01            [ 2]  127 	ldw x,(DEST,sp) 
      008B9E 72 F9 01         [ 4]  128 	call move
      008BA1 20 8E 1D         [ 2]  129 	ldw x,txtend
      008BA3 72 FB 05         [ 2]  130 	addw x,(LEN,sp)
      008BA3 A1 05 26         [ 2]  131 	ldw txtend,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      000CFB                        132 9$:	_drop VSIZE 
      008BA6 41 AE            [ 2]    1     addw sp,#VSIZE 
      008BA8 16               [ 4]  133 	ret 
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
      000CFE                        150 insert_line:
      000CFE                        151 	_vars VSIZE 
      008BA9 68 CD            [ 2]    1     sub sp,#VSIZE 
      008BAB 99 16 CE         [ 2]  152 	ldw x,txtend  
      008BAE 00 0E CD         [ 2]  153 	cpw x,txtbgn 
      008BB1 8C FA            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      008BB3 5D 26 03         [ 2]  156 	ldw x,#2 
      008BB6 CC 8C BE 19      [ 4]  157 	ld a,([ptr16],x)
      008BB9 A1 03            [ 1]  158 	cp a,#3
      008BB9 CF 00            [ 1]  159 	jreq insert_ln_exit
      008BBB 05               [ 1]  160 	clrw x 
      008BBC E6               [ 1]  161 	ld xl,a
      008BBD 02 C7            [ 2]  162 	ldw (LLEN,sp),x 
      008BBF 00 04 90         [ 2]  163 	ldw x,txtbgn
      008BC2 AE 16            [ 2]  164 	ldw (DEST,sp),x 
      008BC4 68 CD 92         [ 2]  165 	ldw x,txtend 
      008BC7 78 0F            [ 2]  166 	jra 4$
      008BC9 01 A6 0D CD      [ 5]  167 0$:	ldw x,[ptr16]
                                    168 ; line number
      008BCD 89 C0            [ 2]  169 	ldw (LINENO,sp),x 
      008BCF A6 3E CD         [ 2]  170 	ldw x,#2 
      008BD2 89 C0 AE 16      [ 4]  171 	ld a,([ptr16],x)
      008BD6 68               [ 1]  172 	ld xl,a
                                    173 ; line length
      008BD7 CD 94            [ 2]  174 	ldw (LLEN,sp),x
                                    175 ; check if that line number already exit 	
      008BD9 62 6B            [ 2]  176 	ldw x,(LINENO,sp)
      008BDB 02               [ 1]  177 	clr a 
      008BDC CD 8A 1D         [ 4]  178 	call search_lineno 
      008BDF 90               [ 2]  179 	tnzw x 
      008BE0 93 7B            [ 1]  180 	jrne 2$
                                    181 ; line doesn't exit
                                    182 ; it will be inserted at this point.  	
      008BE2 02 6B            [ 2]  183 	ldw (DEST,sp),y 
      008BE4 03 CC            [ 2]  184 	jra 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                    185 ; line exit delete it.
                                    186 ; it will be replaced by new one 	
      008BE6 8B 31            [ 2]  187 2$: ldw (DEST,sp),x 
      008BE8 CD 0C A5         [ 4]  188 	call del_line
      000D43                        189 3$: 
                                    190 ; insert new line or leave if LLEN==3
                                    191 ; LLEN==3 means empty line 
      008BE8 A1 81            [ 1]  192 	ld a,#3
      008BEA 26 15            [ 1]  193 	cp a,(LLEN+1,sp)
      008BEC 7B 03            [ 1]  194 	jreq insert_ln_exit ; empty line exit.
                                    195 ; if insertion point at txtend 
                                    196 ; move no need to create a gap 
      008BEE 11 02            [ 2]  197 	ldw x,(DEST,sp)
      008BF0 2B 03 CC         [ 2]  198 	cpw x,txtend 
      008BF3 8B 31            [ 1]  199 	jreq 4$ 
                                    200 ; must create a gap
                                    201 ; at insertion point  
      008BF5 1E 01            [ 2]  202 	ldw x,(DEST,sp)
      008BF5 A6 01            [ 2]  203 	ldw y,(LLEN,sp)
      008BF7 CD 8A 7C         [ 4]  204 	call create_gap
      008BFA 0C 03            [ 2]  205 	jra 5$
      000D59                        206 4$: 
      008BFC 90 5C CC         [ 2]  207 	addw x,(LLEN,sp)
      008BFF 8B 31 A1         [ 2]  208 	ldw txtend,x 	 
                                    209 ; move new line in gap 
      008C02 80 26            [ 2]  210 5$:	ldw x,(LLEN,sp)
      008C04 13 0D 03         [ 2]  211 	ldw acc16,x 
      008C07 26 03 CC 8B      [ 2]  212 	ldw y,#pad ;SRC 
      008C0B 31 01            [ 2]  213 	ldw x,(DEST,sp) ; dest address 
      008C0C CD 14 0E         [ 4]  214 	call move 
      000D6D                        215 insert_ln_exit:	
      000D6D                        216 	_drop VSIZE
      008C0C A6 01            [ 2]    1     addw sp,#VSIZE 
      008C0E CD               [ 4]  217 	ret
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
      000D70                        233 parse_quote: 
      000D70                        234 	_vars VSIZE 
      008C0F 8A 6E            [ 2]    1     sub sp,#VSIZE 
      008C11 0A               [ 1]  235 	clr a
      008C12 03 90            [ 1]  236 1$:	ld (PREV,sp),a 
      000D75                        237 2$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      008C14 5A CC 8B         [ 4]  238 	ld a,([in.w],y)
      008C17 31 A1            [ 1]  239 	jreq 6$
      008C19 82 26 0E 7B      [ 1]  240 	inc in 
      008C1D 03 CD            [ 1]  241 	ld (CURR,sp),a 
      008C1F 8A 6E            [ 1]  242 	ld a,#'\
      008C21 0F 03            [ 1]  243 	cp a, (PREV,sp)
      008C23 90 AE            [ 1]  244 	jrne 3$
      008C25 16 68            [ 1]  245 	clr (PREV,sp)
      008C27 CC 8B            [ 1]  246 	ld a,(CURR,sp)
      008C29 31 A1            [ 4]  247 	callr convert_escape
      008C2B 83               [ 1]  248 	ld (x),a 
      008C2C 26               [ 1]  249 	incw x 
      008C2D 26 7B            [ 2]  250 	jra 2$
      000D90                        251 3$:
      008C2F 03 11            [ 1]  252 	ld a,(CURR,sp)
      008C31 02 26            [ 1]  253 	cp a,#'\'
      008C33 03 CC            [ 1]  254 	jreq 1$
      008C35 8B 31            [ 1]  255 	cp a,#'"
      008C37 27 04            [ 1]  256 	jreq 6$ 
      008C37 7B               [ 1]  257 	ld (x),a 
      008C38 02               [ 1]  258 	incw x 
      008C39 10 03            [ 2]  259 	jra 2$
      000D9E                        260 6$:
      008C3B CD               [ 1]  261 	clr (x)
      008C3C 8A               [ 1]  262 	incw x 
      008C3D 7C 7B            [ 1]  263 	ldw y,x 
      008C3F 02               [ 1]  264 	clrw x 
      008C40 6B 03            [ 1]  265 	ld a,#TK_QSTR  
      000DA5                        266 	_drop VSIZE
      008C42 90 AE            [ 2]    1     addw sp,#VSIZE 
      008C44 16               [ 4]  267 	ret 
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
      000DA8                        278 convert_escape:
      008C45 68               [ 2]  279 	pushw x 
      008C46 72 5F 00         [ 2]  280 	ldw x,#escaped 
      008C49 0E               [ 1]  281 1$:	cp a,(x)
      008C4A C7 00            [ 1]  282 	jreq 2$
      008C4C 0F               [ 1]  283 	tnz (x)
      008C4D 72 B9            [ 1]  284 	jreq 3$
      008C4F 00               [ 1]  285 	incw x 
      008C50 0E CC            [ 2]  286 	jra 1$
      008C52 8B 31 A1         [ 2]  287 2$: subw x,#escaped 
      008C55 0F               [ 1]  288 	ld a,xl 
      008C56 26 08            [ 1]  289 	add a,#7
      008C58 03               [ 2]  290 3$:	popw x 
      008C59 04               [ 4]  291 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                    292 
      008C5A CD A5 FB CC 8B 31 A1   293 escaped:: .asciz "abtnvfr"
             84
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
      000DC5                        310 parse_integer: ; { -- n }
      008C62 26               [ 2]  311 	pushw x 	
      008C63 11 7B            [ 1]  312 	push #0 ; TCHAR
      008C65 03 11            [ 1]  313 	push #10 ; BASE=10
      008C67 02 2A            [ 1]  314 	cp a,#'$
      008C69 08 04            [ 1]  315 	jrne 2$ 
      008C6A                        316     _drop #1
      008C6A 97 7B            [ 2]    1     addw sp,##1 
      008C6C 02 CD            [ 1]  317 	push #16  ; BASE=16
      008C6E 8A               [ 1]  318 2$:	ld (x),a 
      008C6F D9               [ 1]  319 	incw x 
      008C70 0A 02 00         [ 4]  320 	ld a,([in.w],y)
      008C72 72 5C 00 01      [ 1]  321 	inc in 
      008C72 CC 8B 31         [ 4]  322 	call to_upper 
      008C75 6B 02            [ 1]  323 	ld (TCHAR,sp),a 
      008C75 A1 20 2A         [ 4]  324 	call is_digit 
      008C78 03 CC            [ 1]  325 	jrc 2$
      008C7A 8B 31            [ 1]  326 	ld a,#16 
      008C7C 11 01            [ 1]  327 	cp a,(BASE,sp)
      008C7C A6 4F            [ 1]  328 	jrne 3$ 
      008C7E 11 02            [ 1]  329 	ld a,(TCHAR,sp)
      008C80 2A 03            [ 1]  330 	cp a,#'A 
      008C82 CC 8B            [ 1]  331 	jrmi 3$ 
      008C84 31 0D            [ 1]  332 	cp a,#'G 
      008C86 04 26            [ 1]  333 	jrmi 2$ 
      008C88 18 7B 03 11      [ 1]  334 3$: dec in 	
      008C8C 02               [ 1]  335     clr (x)
      008C8D 27 12            [ 2]  336 	ldw x,(XSAVE,sp)
      008C8F 7B 02 97         [ 4]  337 	call atoi24
      008C92 7B 03            [ 1]  338 	ldw y,x
      008C94 95 7B 01         [ 1]  339 	ld a,acc24 
      008C97 CD 8A            [ 1]  340 	ld (y),a 
      008C99 96 0C            [ 1]  341 	incw y  
      008C9B 02 0C 03         [ 2]  342 	ldw x,acc16 
      008C9E CC 8B            [ 2]  343 	ldw (y),x 
      008CA0 31 A9 00 02      [ 2]  344 	addw y,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      008CA1 A6 84            [ 1]  345 	ld a,#TK_INTGR
      000E13                        346 	_drop VSIZE  
      008CA1 7B 01            [ 2]    1     addw sp,#VSIZE 
      008CA3 90               [ 4]  347 	ret 	
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
      000E16                        364 parse_binary: ; { -- n }
      008CA4 F7 90            [ 1]  365 	push #0
      008CA6 5C CD            [ 1]  366 	push #0
      008CA8 89 C0            [ 1]  367 	push #0
      000E1C                        368 2$:	
      008CAA 7B 03 11         [ 4]  369 	ld a,([in.w],y)
      008CAD 02 2B 09 90      [ 1]  370 	inc in 
      008CB1 7F 0C            [ 1]  371 	cp a,#'0 
      008CB3 02 0C            [ 1]  372 	jreq 3$
      008CB5 03 CC            [ 1]  373 	cp a,#'1 
      008CB7 8B 31            [ 1]  374 	jreq 3$ 
      008CB9 20 0B            [ 2]  375 	jra bin_exit 
      008CB9 0C 03            [ 1]  376 3$: sub a,#'0 
      008CBB CC               [ 1]  377 	rrc a
      008CBC 8B 31            [ 1]  378 	rlc (BINARY+2,sp) 
      008CBE 09 02            [ 1]  379 	rlc (BINARY+1,sp)
      008CBE 90 AE            [ 1]  380 	rlc (BINARY,sp) 
      008CC0 16 68            [ 2]  381 	jra 2$  
      000E38                        382 bin_exit:
      008CC2 0F 01 72 F9      [ 1]  383 	dec in 
      008CC6 01 90            [ 1]  384 	ldw y,x
      008CC8 7F 7B            [ 1]  385 	ld a,(BINARY,sp)
      008CCA 02 C7            [ 1]  386 	ld (y),a 
      008CCC 00 04            [ 1]  387 	incw y 
      008CCE A6 0D            [ 2]  388 	ldw x,(BINARY+1,sp)
      008CD0 CD 89            [ 2]  389 	ldw (y),x 
      008CD2 C0 5B 04 90      [ 2]  390 	addw y,#2  
      008CD6 85 81            [ 1]  391 	ld a,#TK_INTGR 	
      008CD8                        392 	_drop VSIZE 
      008CD8 88 4E            [ 2]    1     addw sp,#VSIZE 
      008CDA CD               [ 4]  393 	ret
                                    394 
                                    395 ;-------------------------------------
                                    396 ; check if A is a letter 
                                    397 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                    398 ;   A 			character to test 
                                    399 ; output:
                                    400 ;   C flag      1 true, 0 false 
                                    401 ;-------------------------------------
      000E51                        402 is_alpha::
      008CDB 8C EF            [ 1]  403 	cp a,#'A 
      008CDD CD               [ 1]  404 	ccf 
      008CDE 89 C0            [ 1]  405 	jrnc 9$ 
      008CE0 7B 01            [ 1]  406 	cp a,#'Z+1 
      008CE2 CD 8C            [ 1]  407 	jrc 9$ 
      008CE4 EF CD            [ 1]  408 	cp a,#'a 
      008CE6 89               [ 1]  409 	ccf 
      008CE7 C0 A6            [ 1]  410 	jrnc 9$
      008CE9 20 CD            [ 1]  411 	cp a,#'z+1
      008CEB 89               [ 4]  412 9$: ret 	
                                    413 
                                    414 ;------------------------------------
                                    415 ; check if character in {'0'..'9'}
                                    416 ; input:
                                    417 ;    A  character to test
                                    418 ; output:
                                    419 ;    Carry  0 not digit | 1 digit
                                    420 ;------------------------------------
      000E62                        421 is_digit::
      008CEC C0 84            [ 1]  422 	cp a,#'0
      008CEE 81 03            [ 1]  423 	jrc 1$
      008CEF A1 3A            [ 1]  424     cp a,#'9+1
      008CEF A4               [ 1]  425 	ccf 
      008CF0 0F               [ 1]  426 1$:	ccf 
      008CF1 A1               [ 4]  427     ret
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
      000E6B                        438 is_alnum::
      008CF2 09 23 02         [ 4]  439 	call is_digit
      008CF5 AB 07            [ 1]  440 	jrc 1$ 
      008CF7 AB 30 81         [ 4]  441 	call is_alpha
      008CFA 81               [ 4]  442 1$:	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      000E74                        453 is_symbol_char: 
      008CFA 52 02            [ 1]  454 	cp a,#'_ 
      008CFC 0F 01            [ 1]  455 	jrne 1$
      008CFE 90               [ 1]  456 	scf 
      008CFF CE 00            [ 2]  457 	jra 9$ 
      008D01 1C 4D 27         [ 4]  458 1$:	call is_alnum 
      008D04 04               [ 4]  459 9$: ret 
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
      000E7F                        473 parse_symbol:
      008D05 90               [ 1]  474 	incw x ; keep space for TK_ID 
      000E80                        475 symb_loop: 
                                    476 ; symbol are converted to upper case 
      008D06 CE 00 05         [ 4]  477 	call to_upper  
      008D09 F7               [ 1]  478 	ld (x), a 
      008D09 90               [ 1]  479 	incw x
      008D0A C3 00 1E         [ 4]  480 	ld a,([in.w],y)
      008D0D 2A 10 90 F3      [ 1]  481 	inc in 
      008D11 27 0E 2B         [ 4]  482 	call is_symbol_char 
      008D14 0A 90            [ 1]  483 	jrc symb_loop 
      008D16 E6               [ 1]  484 	clr (x)
      008D17 02 6B 02 72      [ 1]  485 	dec in  
      008D1B F9               [ 4]  486 	ret 
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
                                    497 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC|TK_AND|TK_OR|TK_XOR   
                                    498 ;   pad 	keyword|var_name  
                                    499 ;--------------------------  
                           000001   500 	XFIRST=1
                           000002   501 	VSIZE=2
      000E97                        502 parse_keyword: 
      008D1C 01               [ 2]  503 	pushw x ; preserve *symbol 
      008D1D 20 EA 7F         [ 4]  504 	call parse_symbol
      008D1F 1E 01            [ 2]  505 	ldw x,(XFIRST,sp) 
      008D1F 5F 51            [ 1]  506 	ld a,(2,x)
      008D21 5B 02            [ 1]  507 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                    508 ; one letter variable name 
      008D23 51 81            [ 1]  509 	ld a,(1,x) 
      008D25 A0 41            [ 1]  510 	sub a,#'A 
      008D25 52 04 E6         [ 2]  511 	ldw x,#3 
      008D28 02               [ 4]  512 	mul x,a 
      008D29 6B 02 0F         [ 2]  513 	addw x,#vars 
      008D2C 01 90            [ 1]  514 	ld a,#TK_VAR 
      008D2E 93 72            [ 2]  515 	jra 4$ 
      000EB0                        516 2$: ; check for keyword, otherwise syntax error.
      000EB0                        517 	_ldx_dict kword_dict ; dictionary entry point
      008D30 F9 01 17         [ 2]    1     ldw x,#kword_dict+2
      008D33 03 90            [ 2]  518 	ldw y,(XFIRST,sp) ; name to search for
      008D35 CE 00            [ 1]  519 	incw y 
      008D37 1E 72 F2         [ 4]  520 	call search_dict
      008D3A 03               [ 1]  521 	tnz a
      008D3B 90 CF            [ 1]  522 	jrne 4$
                                    523 ; not in dictionary
                                    524 ; compile it as TK_LABEL
      008D3D 00 0E            [ 2]  525 	ldw y,(XFIRST,sp)
      008D3F 16 03            [ 1]  526 	ld a,#TK_LABEL 
      008D41 CD 94            [ 1]  527 	ld (y),a 
      008D43 8E 90            [ 1]  528 	incw y
      008D45 CE               [ 1]  529 	ldw x,y 
      008D46 00 1E 72         [ 4]  530 	call strlen
      008D49 F2 01            [ 1]  531 	cp a,#15 
      008D4B 90 CF            [ 2]  532 	jrule 22$ 
      008D4D 00 1E            [ 1]  533 	ld a,#15
      000ECF                        534 22$:	
      008D4F 5B               [ 1]  535 	push a 
      000ED0                        536 24$:
      008D50 04 81            [ 1]  537     ld a,(y)
      008D52 27 09            [ 1]  538 	jreq 3$
      008D52 52 06            [ 1]  539 	incw y
      008D54 1F 03            [ 1]  540 	dec (1,sp) 
      008D56 17 05            [ 1]  541 	jrne 24$
      008D58 90               [ 1]  542 	clr a 
      008D59 CF 00            [ 1]  543 	ld (y),a 
      008D5B 0E 90            [ 1]  544 3$: incw y 
      000EDF                        545 	_drop 1 
      008D5D 93 72            [ 2]    1     addw sp,#1 
      008D5F BB 00            [ 1]  546 	ld a,#TK_LABEL 
      008D61 0E               [ 1]  547 	clrw x 	
      008D62 1F 01            [ 2]  548 	jra 5$ 
      000EE6                        549 4$:	
      008D64 CE 00            [ 2]  550 	ldw y,(XFIRST,sp)
      008D66 1E 72            [ 1]  551 	cp a,#TK_NOT 
      008D68 F0 03            [ 1]  552 	jrmi 41$
      008D6A CF 00            [ 1]  553 	ld (y),a 
      008D6C 0E 1E            [ 1]  554 	incw y 
      008D6E 01 CD            [ 2]  555 	jra 5$ 
      000EF2                        556 41$:	
      008D70 94 8E CE         [ 2]  557 	cpw x,#LET_IDX 
      008D73 00 1E            [ 1]  558 	jreq 5$  ; don't compile LET command 
      008D75 72 FB            [ 1]  559 	ld (y),a 
      008D77 05 CF            [ 1]  560 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      008D79 00 1E            [ 2]  561 	ldw (y),x
      008D7B 5B 06 81 02      [ 2]  562 	addw y,#2  
      008D7E                        563 5$:	_drop VSIZE 
      008D7E 52 08            [ 2]    1     addw sp,#VSIZE 
      008D80 CE               [ 4]  564 	ret  	
                                    565 
                                    566 ;------------------------------------
                                    567 ; skip character c in text starting from 'in'
                                    568 ; input:
                                    569 ;	 y 		point to text buffer
                                    570 ;    a 		character to skip
                                    571 ; output:  
                                    572 ;	'in' ajusted to new position
                                    573 ;------------------------------------
                           000001   574 	C = 1 ; local var
      000F04                        575 skip:
      008D81 00               [ 1]  576 	push a
      008D82 1E C3 00         [ 4]  577 1$:	ld a,([in.w],y)
      008D85 1C 26            [ 1]  578 	jreq 2$
      008D87 19 AE            [ 1]  579 	cp a,(C,sp)
      008D89 00 02            [ 1]  580 	jrne 2$
      008D8B 72 D6 00 1A      [ 1]  581 	inc in
      008D8F A1 03            [ 2]  582 	jra 1$
      000F14                        583 2$: _drop 1 
      008D91 27 5A            [ 2]    1     addw sp,#1 
      008D93 5F               [ 4]  584 	ret
                                    585 	
                                    586 
                                    587 ;------------------------------------
                                    588 ; scan text for next token
                                    589 ; input: 
                                    590 ;	X 		pointer to buffer where 
                                    591 ;	        token id and value are copied 
                                    592 ; use:
                                    593 ;	Y   pointer to text in tib 
                                    594 ; output:
                                    595 ;   A       token attribute 
                                    596 ;   X 		token value
                                    597 ;   Y       updated position in output buffer   
                                    598 ;------------------------------------
                                    599 	; use to check special character 
                                    600 	.macro _case c t  
                                    601 	ld a,#c 
                                    602 	cp a,(TCHAR,sp) 
                                    603 	jrne t
                                    604 	.endm 
                                    605 
                           000001   606 	TCHAR=1
                           000002   607 	ATTRIB=2
                           000002   608 	VSIZE=2
      000F17                        609 get_token:: 
      000F17                        610 	_vars VSIZE
      008D94 97 1F            [ 2]    1     sub sp,#VSIZE 
                                    611 ;	ld a,in 
                                    612 ;	sub a,count
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                    613 ;   jrmi 0$
                                    614 ;	clr a 
                                    615 ;	ret 
      000F19                        616 0$: 
      008D96 07 CE 00 1C      [ 2]  617 	ldw y,#tib    	
      008D9A 1F 01            [ 1]  618 	ld a,#SPACE
      008D9C CE 00 1E         [ 4]  619 	call skip
      008D9F 20 38 72 CE 00   [ 1]  620 	mov in.saved,in 
      008DA4 1A 1F 05         [ 4]  621 	ld a,([in.w],y)
      008DA7 AE 00            [ 1]  622 	jrne 1$
      008DA9 02 72            [ 1]  623 	ldw y,x 
      008DAB D6 00 1A         [ 2]  624 	jp token_exit ; end of line 
      008DAE 97 1F 07 1E      [ 1]  625 1$:	inc in 
      008DB2 05 4F CD         [ 4]  626 	call to_upper 
      008DB5 8C FA            [ 1]  627 	ld (TCHAR,sp),a 
                                    628 ; check for quoted string
      000F3A                        629 str_tst:  	
      000F3A                        630 	_case '"' nbr_tst
      008DB7 5D 26            [ 1]    1 	ld a,#'"' 
      008DB9 04 17            [ 1]    2 	cp a,(TCHAR,sp) 
      008DBB 01 20            [ 1]    3 	jrne nbr_tst
      008DBD 05 1F            [ 1]  631 	ld a,#TK_QSTR
      008DBF 01               [ 1]  632 	ld (x),a 
      008DC0 CD               [ 1]  633 	incw x 
      008DC1 8D 25 70         [ 4]  634 	call parse_quote
      008DC3 CC 10 C8         [ 2]  635 	jp token_exit
      000F4A                        636 nbr_tst:
                                    637 ; check for hexadecimal number 
      008DC3 A6 03            [ 1]  638 	ld a,#'$'
      008DC5 11 08            [ 1]  639 	cp a,(TCHAR,sp) 
      008DC7 27 24            [ 1]  640 	jreq 1$
                                    641 ;check for binary number 
      008DC9 1E 01            [ 1]  642 	ld a,#'&
      008DCB C3 00            [ 1]  643 	cp a,(TCHAR,sp)
      008DCD 1E 27            [ 1]  644 	jrne 0$
      008DCF 09 1E            [ 1]  645 	ld a,#TK_INTGR
      008DD1 01               [ 1]  646 	ld (x),a 
      008DD2 16               [ 1]  647 	incw x 
      008DD3 07 CD 8D         [ 4]  648 	call parse_binary ; expect binary integer 
      008DD6 52 20 06         [ 2]  649 	jp token_exit 
                                    650 ; check for decimal number 	
      008DD9 7B 01            [ 1]  651 0$:	ld a,(TCHAR,sp)
      008DD9 72 FB 07         [ 4]  652 	call is_digit
      008DDC CF 00            [ 1]  653 	jrnc 3$
      008DDE 1E 1E            [ 1]  654 1$:	ld a,#TK_INTGR 
      008DE0 07               [ 1]  655 	ld (x),a 
      008DE1 CF               [ 1]  656 	incw x 
      008DE2 00 0E            [ 1]  657 	ld a,(TCHAR,sp)
      008DE4 90 AE 16         [ 4]  658 	call parse_integer 
      008DE7 B8 1E 01         [ 2]  659 	jp token_exit 
      000F73                        660 3$: 
      000F73                        661 	_case '(' bkslsh_tst 
      008DEA CD 94            [ 1]    1 	ld a,#'(' 
      008DEC 8E 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DED 26 05            [ 1]    3 	jrne bkslsh_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      008DED 5B 08            [ 1]  662 	ld a,#TK_LPAREN
      008DEF 81 10 C4         [ 2]  663 	jp token_char   	
      008DF0                        664 bkslsh_tst: ; character token 
      000F7E                        665 	_case '\',rparnt_tst
      008DF0 52 02            [ 1]    1 	ld a,#'\' 
      008DF2 4F 6B            [ 1]    2 	cp a,(TCHAR,sp) 
      008DF4 01 16            [ 1]    3 	jrne rparnt_tst
      008DF5 A6 04            [ 1]  666 	ld a,#TK_CHAR 
      008DF5 91               [ 1]  667 	ld (x),a 
      008DF6 D6               [ 1]  668 	incw x 
      008DF7 01 27 24         [ 4]  669 	ld a,([in.w],y)
      008DFA 72               [ 1]  670 	ld (x),a 
      008DFB 5C               [ 1]  671 	incw x
      008DFC 00 02            [ 1]  672 	ldw y,x 	 
      008DFE 6B 02 A6 5C      [ 1]  673 	inc in  
      008E02 11               [ 1]  674 	clrw x 
      008E03 01               [ 1]  675 	ld xl,a 
      008E04 26 0A            [ 1]  676 	ld a,#TK_CHAR 
      008E06 0F 01 7B         [ 2]  677 	jp token_exit 
      000F9A                        678 rparnt_tst:		
      000F9A                        679 	_case ')' colon_tst 
      008E09 02 AD            [ 1]    1 	ld a,#')' 
      008E0B 1C F7            [ 1]    2 	cp a,(TCHAR,sp) 
      008E0D 5C 20            [ 1]    3 	jrne colon_tst
      008E0F E5 07            [ 1]  680 	ld a,#TK_RPAREN 
      008E10 CC 10 C4         [ 2]  681 	jp token_char
      000FA5                        682 colon_tst:
      000FA5                        683 	_case ':' comma_tst 
      008E10 7B 02            [ 1]    1 	ld a,#':' 
      008E12 A1 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008E14 27 DD            [ 1]    3 	jrne comma_tst
      008E16 A1 22            [ 1]  684 	ld a,#TK_COLON 
      008E18 27 04 F7         [ 2]  685 	jp token_char  
      000FB0                        686 comma_tst:
      000FB0                        687 	_case COMMA sharp_tst 
      008E1B 5C 20            [ 1]    1 	ld a,#COMMA 
      008E1D D7 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E1E 26 05            [ 1]    3 	jrne sharp_tst
      008E1E 7F 5C            [ 1]  688 	ld a,#TK_COMMA
      008E20 90 93 5F         [ 2]  689 	jp token_char
      000FBB                        690 sharp_tst:
      000FBB                        691 	_case SHARP dash_tst 
      008E23 A6 02            [ 1]    1 	ld a,#SHARP 
      008E25 5B 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008E27 81 05            [ 1]    3 	jrne dash_tst
      008E28 A6 09            [ 1]  692 	ld a,#TK_SHARP
      008E28 89 AE 8E         [ 2]  693 	jp token_char  	 	 
      000FC6                        694 dash_tst: 	
      000FC6                        695 	_case '-' at_tst 
      008E2B 3D F1            [ 1]    1 	ld a,#'-' 
      008E2D 27 06            [ 1]    2 	cp a,(TCHAR,sp) 
      008E2F 7D 27            [ 1]    3 	jrne at_tst
      008E31 09 5C            [ 1]  696 	ld a,#TK_MINUS  
      008E33 20 F7 1D         [ 2]  697 	jp token_char 
      000FD1                        698 at_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      000FD1                        699 	_case '@' qmark_tst 
      008E36 8E 3D            [ 1]    1 	ld a,#'@' 
      008E38 9F AB            [ 1]    2 	cp a,(TCHAR,sp) 
      008E3A 07 85            [ 1]    3 	jrne qmark_tst
      008E3C 81 61            [ 1]  700 	ld a,#TK_ARRAY 
      008E3E 62 74 6E         [ 2]  701 	jp token_char
      000FDC                        702 qmark_tst:
      000FDC                        703 	_case '?' tick_tst 
      008E41 76 66            [ 1]    1 	ld a,#'?' 
      008E43 72 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008E45 26 12            [ 1]    3 	jrne tick_tst
      008E45 89 4B            [ 1]  704 	ld a,#TK_CMD  
      008E47 00               [ 1]  705 	ld (x),a 
      008E48 4B               [ 1]  706 	incw x 
      008E49 0A A1            [ 1]  707 	ldw y,x 
      008E4B 24 26 04         [ 2]  708 	ldw x,#PRT_IDX 
      008E4E 5B 01            [ 2]  709 	ldw (y),x 
      008E50 4B 10 F7 5C      [ 2]  710 	addw y,#2
      008E54 91 D6 01         [ 2]  711 	jp token_exit
      000FF4                        712 tick_tst: ; comment 
      000FF4                        713 	_case TICK plus_tst 
      008E57 72 5C            [ 1]    1 	ld a,#TICK 
      008E59 00 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008E5B CD 99            [ 1]    3 	jrne plus_tst
      008E5D 0A 6B            [ 1]  714 	ld a,#TK_CMD
      008E5F 02               [ 1]  715 	ld (x),a 
      008E60 CD               [ 1]  716 	incw x
      008E61 8E E2 25 ED      [ 2]  717 	ldw y,#REM_IDX
      008E65 A6               [ 2]  718 	ldw (x),y 
      008E66 10 11 01         [ 2]  719 	addw x,#2  
      001006                        720 copy_comment:
      008E69 26 0A 7B 02      [ 2]  721 	ldw y,#tib 
      008E6D A1 41 2B 04      [ 2]  722 	addw y,in.w
      008E71 A1 47            [ 2]  723 	pushw y 
      008E73 2B DD 72         [ 4]  724 	call strcpy
      008E76 5A 00 02         [ 2]  725 	subw y,(1,sp)
      008E79 7F 1E            [ 1]  726 	incw y ; strlen+1 
      008E7B 03 CD            [ 2]  727 	ldw (1,sp),y 
      008E7D 99 16 90         [ 2]  728 	addw x,(1,sp) 
      00101D                        729 	_drop 2 
      008E80 93 C6            [ 2]    1     addw sp,#2 
      008E82 00               [ 1]  730 	clr a 
      008E83 0D 90            [ 1]  731 	ldw y,x 
      008E85 F7 90 5C         [ 2]  732 	jp token_exit 
      001025                        733 plus_tst:
      001025                        734 	_case '+' star_tst 
      008E88 CE 00            [ 1]    1 	ld a,#'+' 
      008E8A 0E 90            [ 1]    2 	cp a,(TCHAR,sp) 
      008E8C FF 72            [ 1]    3 	jrne star_tst
      008E8E A9 00            [ 1]  735 	ld a,#TK_PLUS  
      008E90 02 A6 84         [ 2]  736 	jp token_char 
      001030                        737 star_tst:
      001030                        738 	_case '*' slash_tst 
      008E93 5B 04            [ 1]    1 	ld a,#'*' 
      008E95 81 01            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      008E96 26 05            [ 1]    3 	jrne slash_tst
      008E96 4B 00            [ 1]  739 	ld a,#TK_MULT 
      008E98 4B 00 4B         [ 2]  740 	jp token_char 
      00103B                        741 slash_tst: 
      00103B                        742 	_case '/' prcnt_tst 
      008E9B 00 2F            [ 1]    1 	ld a,#'/' 
      008E9C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E9C 91 D6            [ 1]    3 	jrne prcnt_tst
      008E9E 01 72            [ 1]  743 	ld a,#TK_DIV 
      008EA0 5C 00 02         [ 2]  744 	jp token_char 
      001046                        745 prcnt_tst:
      001046                        746 	_case '%' eql_tst 
      008EA3 A1 30            [ 1]    1 	ld a,#'%' 
      008EA5 27 06            [ 1]    2 	cp a,(TCHAR,sp) 
      008EA7 A1 31            [ 1]    3 	jrne eql_tst
      008EA9 27 02            [ 1]  747 	ld a,#TK_MOD
      008EAB 20 0B A0         [ 2]  748 	jp token_char  
                                    749 ; 1 or 2 character tokens 	
      001051                        750 eql_tst:
      001051                        751 	_case '=' gt_tst 		
      008EAE 30 46            [ 1]    1 	ld a,#'=' 
      008EB0 09 03            [ 1]    2 	cp a,(TCHAR,sp) 
      008EB2 09 02            [ 1]    3 	jrne gt_tst
      008EB4 09 01            [ 1]  752 	ld a,#TK_EQUAL
      008EB6 20 E4 C4         [ 2]  753 	jp token_char 
      008EB8                        754 gt_tst:
      00105C                        755 	_case '>' lt_tst 
      008EB8 72 5A            [ 1]    1 	ld a,#'>' 
      008EBA 00 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008EBC 90 93            [ 1]    3 	jrne lt_tst
      008EBE 7B 01            [ 1]  756 	ld a,#TK_GT 
      008EC0 90 F7            [ 1]  757 	ld (ATTRIB,sp),a 
      008EC2 90 5C 1E         [ 4]  758 	ld a,([in.w],y)
      008EC5 02 90 FF 72      [ 1]  759 	inc in 
      008EC9 A9 00            [ 1]  760 	cp a,#'=
      008ECB 02 A6            [ 1]  761 	jrne 1$
      008ECD 84 5B            [ 1]  762 	ld a,#TK_GE 
      008ECF 03 81            [ 2]  763 	jra token_char  
      008ED1 A1 3C            [ 1]  764 1$: cp a,#'<
      008ED1 A1 41            [ 1]  765 	jrne 2$
      008ED3 8C 24            [ 1]  766 	ld a,#TK_NE 
      008ED5 0B A1            [ 2]  767 	jra token_char 
      008ED7 5B 25 07 A1      [ 1]  768 2$: dec in
      008EDB 61 8C            [ 1]  769 	ld a,(ATTRIB,sp)
      008EDD 24 02            [ 2]  770 	jra token_char 	 
      001085                        771 lt_tst:
      001085                        772 	_case '<' other
      008EDF A1 7B            [ 1]    1 	ld a,#'<' 
      008EE1 81 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008EE2 26 23            [ 1]    3 	jrne other
      008EE2 A1 30            [ 1]  773 	ld a,#TK_LT 
      008EE4 25 03            [ 1]  774 	ld (ATTRIB,sp),a 
      008EE6 A1 3A 8C         [ 4]  775 	ld a,([in.w],y)
      008EE9 8C 81 00 01      [ 1]  776 	inc in 
      008EEB A1 3D            [ 1]  777 	cp a,#'=
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      008EEB CD 8E            [ 1]  778 	jrne 1$
      008EED E2 25            [ 1]  779 	ld a,#TK_LE 
      008EEF 03 CD            [ 2]  780 	jra token_char 
      008EF1 8E D1            [ 1]  781 1$: cp a,#'>
      008EF3 81 04            [ 1]  782 	jrne 2$
      008EF4 A6 35            [ 1]  783 	ld a,#TK_NE 
      008EF4 A1 5F            [ 2]  784 	jra token_char 
      008EF6 26 03 99 20      [ 1]  785 2$: dec in 
      008EFA 03 CD            [ 1]  786 	ld a,(ATTRIB,sp)
      008EFC 8E EB            [ 2]  787 	jra token_char 	
      0010AE                        788 other: ; not a special character 	 
      008EFE 81 01            [ 1]  789 	ld a,(TCHAR,sp)
      008EFF CD 0E 51         [ 4]  790 	call is_alpha 
      008EFF 5C 03            [ 1]  791 	jrc 30$ 
      008F00 CC 16 9E         [ 2]  792 	jp syntax_error 
      0010B8                        793 30$: 
      008F00 CD 99 0A         [ 4]  794 	call parse_keyword
      008F03 F7 5C 91         [ 2]  795 	cpw x,#REM_IDX 
      008F06 D6 01            [ 1]  796 	jrne token_exit 
      008F08 72               [ 1]  797 	ldw x,y 
      008F09 5C 00 02         [ 2]  798 	jp copy_comment 
      0010C4                        799 token_char:
      008F0C CD               [ 1]  800 	ld (x),a 
      008F0D 8E               [ 1]  801 	incw x
      008F0E F4 25            [ 1]  802 	ldw y,x 
      0010C8                        803 token_exit:
      0010C8                        804 	_drop VSIZE 
      008F10 EF 7F            [ 2]    1     addw sp,#VSIZE 
      008F12 72               [ 4]  805 	ret
                                    806 
                                    807 
                                    808 ;-----------------------------------
                                    809 ; create token list fromm text line 
                                    810 ; save this list in pad buffer 
                                    811 ;  compiled line format: 
                                    812 ;    line_no  2 bytes {0...32767}
                                    813 ;    count    1 byte  
                                    814 ;    tokens   variable length 
                                    815 ;   
                                    816 ; input:
                                    817 ;   none
                                    818 ; modified variables:
                                    819 ;   basicptr     token list buffer address 
                                    820 ;   in.w  		 3|count, i.e. index in buffer
                                    821 ;   count        length of line | 0  
                                    822 ;-----------------------------------
                           000001   823 	XSAVE=1
                           000002   824 	VSIZE=2
      0010CB                        825 compile::
      008F13 5A 00            [ 2]  826 	pushw y 
      0010CD                        827 	_vars VSIZE 
      008F15 02 81            [ 2]    1     sub sp,#VSIZE 
      008F17 55 00 1B 00 04   [ 1]  828 	mov basicptr,txtbgn
      008F17 89 CD 8E FF      [ 1]  829 	bset flags,#FCOMP 
      008F1B 1E 01            [ 1]  830 	ld a,#0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      008F1D E6 02 26         [ 2]  831 	ldw x,#0
      008F20 0F E6 01         [ 2]  832 	ldw pad,x ; destination buffer 
      008F23 A0 41 AE         [ 1]  833 	ld pad+2,a ; count 
      008F26 00 03 42         [ 2]  834 	ldw x,#pad+3
      008F29 1C 00 31 A6      [ 1]  835 	clr in 
      008F2D 85 20 36         [ 4]  836 	call get_token
      008F30 A1 84            [ 1]  837 	cp a,#TK_INTGR
      008F30 AE B3            [ 1]  838 	jrne 2$
      008F32 6F 16 01         [ 2]  839 	cpw x,#1 
      008F35 90 5C            [ 1]  840 	jrpl 1$
      008F37 CD 99            [ 1]  841 	ld a,#ERR_BAD_VALUE
      008F39 80 4D 26         [ 2]  842 	jp tb_error
      008F3C 29 16 01         [ 2]  843 1$:	ldw pad,x 
      008F3F A6 03 90 F7      [ 2]  844 	ldw y,#pad+3 
      008F43 90 5C 93 CD      [ 2]  845 2$:	cpw y,#stack_full 
      008F47 94 62            [ 1]  846 	jrult 3$
      008F49 A1 0F            [ 1]  847 	ld a,#ERR_BUF_FULL 
      008F4B 23 02 A6         [ 2]  848 	jp tb_error 
      00110D                        849 3$:	
      008F4E 0F               [ 1]  850 	ldw x,y 
      008F4F CD 0F 17         [ 4]  851 	call get_token 
      008F4F 88 00            [ 1]  852 	cp a,#TK_NONE 
      008F50 26 ED            [ 1]  853 	jrne 2$ 
                                    854 ; compilation completed  
      008F50 90 F6 27 09      [ 2]  855 	subw y,#pad
      008F54 90 5C            [ 1]  856     ld a,yl
      008F56 0A 01 26         [ 2]  857 	ldw x,#pad 
      008F59 F6 4F 90         [ 2]  858 	ldw ptr16,x 
      008F5C F7 90            [ 1]  859 	ld (2,x),a 
      008F5E 5C               [ 2]  860 	ldw x,(x)
      008F5F 5B 01            [ 1]  861 	jreq 10$
      008F61 A6 03 5F         [ 4]  862 	call insert_line
      008F64 20 1B 00 03      [ 1]  863 	clr  count 
      008F66 20 0F            [ 2]  864 	jra  11$ 
      00112F                        865 10$: ; line# is zero 
      008F66 16 01 A1         [ 2]  866 	ldw x,ptr16  
      008F69 87 2B 06         [ 2]  867 	ldw basicptr,x 
      008F6C 90 F7            [ 1]  868 	ld a,(2,x)
      008F6E 90 5C 20         [ 1]  869 	ld count,a 
      008F71 0F 03 00 01      [ 1]  870 	mov in,#3 
      008F72                        871 11$:
      00113E                        872 	_drop VSIZE 
      008F72 A3 00            [ 2]    1     addw sp,#VSIZE 
      008F74 48 27 0A 90      [ 1]  873 	bres flags,#FCOMP 
      008F78 F7 90            [ 2]  874 	popw y 
      008F7A 5C               [ 4]  875 	ret 
                                    876 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
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
      001147                         48 cpy_cmd_name:
      008F7B 90               [ 2]   49 	tnzw x 
      008F7C FF 72            [ 1]   50 	jreq 10$
      008F7E A9               [ 1]   51 	ld a,(x)
      008F7F 00               [ 1]   52 	incw x
      008F80 02 5B            [ 1]   53 	and a,#15  
      008F82 02               [ 1]   54 	push a 
      008F83 81 01            [ 1]   55     tnz (1,sp) 
      008F84 27 0A            [ 1]   56 	jreq 9$
      008F84 88               [ 1]   57 1$:	ld a,(x)
      008F85 91 D6            [ 1]   58 	ld (y),a  
      008F87 01               [ 1]   59 	incw x
      008F88 27 0A            [ 1]   60 	incw y 
      008F8A 11 01            [ 1]   61 	dec (1,sp)	 
      008F8C 26 06            [ 1]   62 	jrne 1$
      008F8E 72               [ 1]   63 9$: pop a 
      00115E                         64 10$: 
      008F8F 5C               [ 4]   65 	ret	
                                     66 
                                     67 ;--------------------------
                                     68 ; add a space after letter or 
                                     69 ; digit.
                                     70 ; input:
                                     71 ;   Y     pointer to buffer 
                                     72 ; output:
                                     73 ;   Y    moved to end 
                                     74 ;--------------------------
      00115F                         75 add_space:
      008F90 00 02            [ 2]   76 	decw y 
      008F92 20 F1            [ 1]   77 	ld a,(y)
      008F94 5B 01            [ 1]   78 	incw y
      008F96 81 29            [ 1]   79 	cp a,#') 
      008F97 27 05            [ 1]   80 	jreq 0$
      008F97 52 02 6B         [ 4]   81 	call is_alnum 
      008F99 24 06            [ 1]   82 	jrnc 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      00116E                         83 0$: 
      008F99 90 AE            [ 1]   84 	ld a,#SPACE 
      008F9B 16 68            [ 1]   85 	ld (y),a 
      008F9D A6 20            [ 1]   86 	incw y 
      008F9F CD               [ 4]   87 1$: ret 
                                     88 
                                     89 ;--------------------------
                                     90 ;  align text in buffer 
                                     91 ;  to tab_width padding 
                                     92 ;  left with  SPACE 
                                     93 ; input:
                                     94 ;   X      str*
                                     95 ;   A      str_length 
                                     96 ; output:
                                     97 ;   X      ajusted
                                     98 ;--------------------------
      001175                         99 right_align::
      008FA0 8F               [ 1]  100 	push a 
      008FA1 84 55            [ 1]  101 0$: ld a,(1,sp)
      008FA3 00 02 00         [ 1]  102 	cp a,tab_width 
      008FA6 03 91            [ 1]  103 	jrpl 1$
      008FA8 D6 01            [ 1]  104 	ld a,#SPACE 
      008FAA 26               [ 2]  105 	decw x
      008FAB 05               [ 1]  106 	ld (x),a  
      008FAC 90 93            [ 1]  107 	inc (1,sp)
      008FAE CC 91            [ 2]  108 	jra 0$ 
      008FB0 48               [ 1]  109 1$: pop a 	
      008FB1 72               [ 4]  110 	ret 
                                    111 
                                    112 ;--------------------------
                                    113 ; print TK_QSTR
                                    114 ; converting control character
                                    115 ; to backslash sequence
                                    116 ; input:
                                    117 ;   X        char *
                                    118 ;   Y        dest. buffer 
                                    119 ; output:
                                    120 ;   X        moved forward 
                                    121 ;   Y        moved forward 
                                    122 ;-----------------------------
      001187                        123 cpy_quote:
      008FB2 5C 00            [ 1]  124 	ld a,#'"
      008FB4 02 CD            [ 1]  125 	ld (y),a 
      008FB6 99 0A            [ 1]  126 	incw y 
      008FB8 6B               [ 2]  127 	pushw x 
      008FB9 01 17 C5         [ 4]  128 	call skip_string 
      008FBA 85               [ 2]  129 	popw x 
      008FBA A6               [ 1]  130 1$:	ld a,(x)
      008FBB 22 11            [ 1]  131 	jreq 9$
      008FBD 01               [ 1]  132 	incw x 
      008FBE 26 0A            [ 1]  133 	cp a,#SPACE 
      008FC0 A6 02            [ 1]  134 	jrult 3$
      008FC2 F7 5C            [ 1]  135 	ld (y),a
      008FC4 CD 8D            [ 1]  136 	incw y 
      008FC6 F0 CC            [ 1]  137 	cp a,#'\ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      008FC8 91 48            [ 1]  138 	jrne 1$ 
      008FCA                        139 2$:
      008FCA A6 24            [ 1]  140 	ld (y),a
      008FCC 11 01            [ 1]  141 	incw y  
      008FCE 27 17            [ 2]  142 	jra 1$
      008FD0 A6               [ 1]  143 3$: push a 
      008FD1 26 11            [ 1]  144 	ld a,#'\
      008FD3 01 26            [ 1]  145 	ld (y),a 
      008FD5 0A A6            [ 1]  146 	incw y  
      008FD7 84               [ 1]  147 	pop a 
      008FD8 F7 5C            [ 1]  148 	sub a,#7
      008FDA CD 8E 96         [ 1]  149 	ld acc8,a 
      008FDD CC 91 48 7B      [ 1]  150 	clr acc16
      008FE1 01               [ 2]  151 	pushw x
      008FE2 CD 8E E2         [ 2]  152 	ldw x,#escaped 
      008FE5 24 0C A6 84      [ 2]  153 	addw x,acc16 
      008FE9 F7               [ 1]  154 	ld a,(x)
      008FEA 5C               [ 2]  155 	popw x
      008FEB 7B 01            [ 2]  156 	jra 2$
      008FED CD 8E            [ 1]  157 9$: ld a,#'"
      008FEF 45 CC            [ 1]  158 	ld (y),a 
      008FF1 91 48            [ 1]  159 	incw y  
      008FF3 5C               [ 1]  160 	incw x 
      008FF3 A6               [ 4]  161 	ret
                                    162 
                                    163 ;--------------------------
                                    164 ; return variable name 
                                    165 ; from its address.
                                    166 ; input:
                                    167 ;   X    variable address
                                    168 ; output:
                                    169 ;   A     variable letter
                                    170 ;--------------------------
      0011CD                        171 var_name::
      008FF4 28 11 01         [ 2]  172 		subw x,#vars 
      008FF7 26 05            [ 1]  173 		ld a,#3
      008FF9 A6               [ 2]  174 		div x,a 
      008FFA 06               [ 1]  175 		ld a,xl 
      008FFB CC 91            [ 1]  176 		add a,#'A 
      008FFD 44               [ 4]  177 		ret 
                                    178 
                                    179 ;-----------------------------
                                    180 ; return cmd  idx from its 
                                    181 ; code address 
                                    182 ; input:
                                    183 ;   X      code address 
                                    184 ; output:
                                    185 ;   X      cmd_idx
                                    186 ;-----------------------------
      008FFE                        187 get_cmd_idx:
      008FFE A6 5C            [ 2]  188 	pushw y
      009000 11 01 26 16      [ 2]  189 	ldw y,#code_addr 
      009004 A6 04 F7 5C      [ 2]  190 	ldw ptr16,y 
      009008 91 D6            [ 1]  191 	clrw y 
      00900A 01 F7 5C         [ 5]  192 1$:	cpw x,([ptr16],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      00900D 90 93            [ 1]  193 	jreq 3$ 
      00900F 72 5C            [ 1]  194 	incw y 
      009011 00 02 5F         [ 4]  195 	ld a,([ptr16],y)
      009014 97 A6            [ 1]  196 	incw y
      009016 04 CC 91         [ 4]  197 	or a,([ptr16],y)	
      009019 48 EF            [ 1]  198 	jrne 1$
      00901A 93               [ 1]  199 3$: ldw x,y 
      00901A A6 29            [ 2]  200 	popw y 
      00901C 11               [ 4]  201 	ret
                                    202 
                                    203 
                                    204 ;-------------------------------------
                                    205 ; decompile tokens list 
                                    206 ; to original text line 
                                    207 ; input:
                                    208 ;   [basicptr]  pointer at line 
                                    209 ;   Y           output buffer
                                    210 ; output:
                                    211 ;   A           length 
                                    212 ;   Y           after string  
                                    213 ;------------------------------------
                           000001   214 	BASE_SAV=1
                           000002   215 	WIDTH_SAV=2
                           000003   216 	STR=3
                           000004   217 	VSIZE=4 
      0011F8                        218 decompile::
      0011F8                        219 	_vars VSIZE
      00901D 01 26            [ 2]    1     sub sp,#VSIZE 
      00901F 05 A6 07         [ 1]  220 	ld a,base
      009022 CC 91            [ 1]  221 	ld (BASE_SAV,sp),a  
      009024 44 00 23         [ 1]  222 	ld a,tab_width 
      009025 6B 02            [ 1]  223 	ld (WIDTH_SAV,sp),a 
      009025 A6 3A            [ 2]  224 	ldw (STR,sp),y   
      009027 11 01 26 05      [ 5]  225 	ldw x,[basicptr] ; line number 
      00902B A6 0A CC 91      [ 1]  226 	mov base,#10
      00902F 44 05 00 23      [ 1]  227 	mov tab_width,#5
      009030 72 5F 00 0C      [ 1]  228 	clr acc24 
      009030 A6 2C 11         [ 2]  229 	ldw acc16,x
      009033 01               [ 1]  230 	clr a ; unsigned conversion 
      009034 26 05 A6         [ 4]  231 	call itoa  
      009037 08 CC 91         [ 4]  232 	call right_align 
      00903A 44               [ 1]  233 	push a 
      00903B 90 93            [ 1]  234 1$:	ldw y,x ; source
      00903B A6 23            [ 2]  235 	ldw x,(STR+1,sp) ; destination
      00903D 11 01 26         [ 4]  236 	call strcpy 
      009040 05 A6            [ 1]  237 	clrw y 
      009042 09               [ 1]  238 	pop a 
      009043 CC 91            [ 1]  239 	ld yl,a 
      009045 44 F9 03         [ 2]  240 	addw y,(STR,sp)
      009046 A6 20            [ 1]  241 	ld a,#SPACE 
      009046 A6 2D            [ 1]  242 	ld (y),a 
      009048 11 01            [ 1]  243 	incw y 
      00904A 26 05 A6 11      [ 1]  244 	clr tab_width
      00904E CC 91 44         [ 2]  245 	ldw x,#3
      009051 CF 00 00         [ 2]  246 	ldw in.w,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      001240                        247 decomp_loop:
      009051 A6 40            [ 2]  248 	pushw y
      009053 11 01 26         [ 4]  249 	call next_token 
      009056 05 A6            [ 2]  250 	popw y 
      009058 05               [ 1]  251 	tnz a  
      009059 CC 91            [ 1]  252 	jrne 1$
      00905B 44 13 73         [ 2]  253 	jp 20$
      00905C 2B 03            [ 1]  254 1$:	jrmi 2$
      00905C A6 3F 11         [ 2]  255 	jp 6$
      001252                        256 2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR|TK_AND|TK_OR|TK_XOR 
      00905F 01 26            [ 1]  257 	cp a,#TK_VAR 
      009061 12 A6            [ 1]  258 	jrne 3$
                                    259 ;; TK_VAR 
      009063 80 F7 5C         [ 4]  260 	call add_space
      009066 90 93 AE         [ 4]  261 	call get_addr   
      009069 00 64 90         [ 4]  262 	call var_name
      00906C FF 72            [ 1]  263 	ld (y),a 
      00906E A9 00            [ 1]  264 	incw y  
      009070 02 CC            [ 2]  265 	jra decomp_loop
      001265                        266 3$:
      009072 91 48            [ 1]  267 	cp a,#TK_INTGR
      009074 26 26            [ 1]  268 	jrne 4$
                                    269 ;; TK_INTGR
      009074 A6 27 11         [ 4]  270 	call get_int24 
      009077 01 26 2B         [ 1]  271 	ld acc24,a 
      00907A A6 80 F7         [ 2]  272 	ldw acc16,x 
      00907D 5C 90 AE         [ 4]  273 	call add_space
      009080 00 7E            [ 2]  274 	pushw y 
      009082 FF 1C            [ 1]  275 	ld a,#255 ; signed conversion 
      009084 00 02 31         [ 4]  276 	call itoa  
      009086 16 01            [ 2]  277 	ldw y,(1,sp) 
      009086 90               [ 1]  278 	push a 
      009087 AE               [ 1]  279 	exgw x,y 
      009088 16 68 72         [ 4]  280 	call strcpy 
      00908B B9 00            [ 1]  281 	clrw y
      00908D 01               [ 1]  282 	pop a  
      00908E 90 89            [ 1]  283 	ld yl,a 
      009090 CD 94 7E         [ 2]  284 	addw y,(1,sp)
      00128B                        285 	_drop 2 
      009093 72 F2            [ 2]    1     addw sp,#2 
      009095 01 90            [ 2]  286 	jra decomp_loop
      00128F                        287 4$: ; dictionary keyword
      009097 5C 17            [ 1]  288 	cp a,#TK_NOT 
      009099 01 72            [ 1]  289 	jruge 50$ 
      00909B FB               [ 2]  290 	ldw x,(x)
      00909C 01 5B 02 4F      [ 1]  291 	inc in 
      0090A0 90 93 CC 91      [ 1]  292 	inc in 
      0090A4 48 00 7E         [ 2]  293 	cpw x,#REM_IDX
      0090A5 26 23            [ 1]  294 	jrne 5$
      0090A5 A6 2B 11         [ 2]  295 	ldw x,basicptr 
                                    296 ; copy comment to buffer 
      0090A8 01 26 05         [ 4]  297 	call add_space
      0090AB A6 10            [ 1]  298 	ld a,#''
      0090AD CC 91            [ 1]  299 	ld (y),a 
      0090AF 44 5C            [ 1]  300 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      0090B0                        301 46$:
      0090B0 A6 2A 11 01      [ 4]  302 	ld a,([in.w],x)
      0090B4 26 05 A6 20      [ 1]  303 	inc in  
      0090B8 CC 91            [ 1]  304 	ld (y),a 
      0090BA 44 5C            [ 1]  305 	incw y 
      0090BB C6 00 01         [ 1]  306 	ld a,in 
      0090BB A6 2F 11         [ 1]  307 	cp a,count 
      0090BE 01 26            [ 1]  308 	jrmi 46$
      0090C0 05 A6 21         [ 2]  309 	jp 20$  
      0090C3 CC 91 44         [ 2]  310 5$: cpw x,#LET_IDX 
      0090C6 26 0B            [ 1]  311 	jrne 54$
      0090C6 A6 25 11         [ 2]  312 	jp decomp_loop ; down display LET
      0012CC                        313 50$:
      0090C9 01               [ 1]  314 	clrw x 
      0090CA 26 05            [ 1]  315 	sub a,#TK_NOT  
      0090CC A6               [ 1]  316 	sll a 
      0090CD 22               [ 1]  317 	ld xl,a 
      0090CE CC 91 44         [ 2]  318 	addw x,#NOT_IDX
      0090D1                        319 54$: ; insert command name 
      0090D1 A6 3D 11         [ 4]  320 	call add_space  
      0090D4 01 26            [ 2]  321 	pushw y
      0090D6 05 A6 32         [ 4]  322 	call cmd_name
      0090D9 CC 91            [ 2]  323 	popw y 
      0090DB 44 11 47         [ 4]  324 	call cpy_cmd_name
      0090DC CC 12 40         [ 2]  325 	jp decomp_loop 
      0012E4                        326 6$:
                                    327 ; label?
      0090DC A6 3E            [ 1]  328 	cp a,#TK_LABEL 
      0090DE 11 01            [ 1]  329 	jrne 64$
                                    330 ; copy label string to output buffer   	
      0090E0 26 23            [ 1]  331 	ld a,#32 
      0090E2 A6 31            [ 1]  332 	ld (y),a 
      0090E4 6B 02            [ 1]  333 	incw y 
      0012EE                        334 61$:
      0090E6 91               [ 2]  335 	pushw x 
      0090E7 D6 01 72         [ 4]  336 	call skip_string 
      0090EA 5C               [ 2]  337 	popw x 
      0012F3                        338 62$:	
      0090EB 00               [ 1]  339 	ld a,(x)
      0090EC 02 A1            [ 1]  340 	jreq 63$ 
      0090EE 3D               [ 1]  341 	incw x  
      0090EF 26 04            [ 1]  342 	ld (y),a 
      0090F1 A6 33            [ 1]  343 	incw y 
      0090F3 20 4F            [ 2]  344 	jra 62$ 
      0012FD                        345 63$: 
      0090F5 A1 3C            [ 1]  346 	ld a,#32 
      0090F7 26 04            [ 1]  347 	ld (y),a 
      0090F9 A6 35            [ 1]  348 	incw y 
      0090FB 20 47 72         [ 2]  349 	jp decomp_loop
      001306                        350 64$:
      0090FE 5A 00            [ 1]  351 	cp a,#TK_QSTR 
      009100 02 7B            [ 1]  352 	jrne 7$
                                    353 ;; TK_QSTR
      009102 02 20 3F         [ 4]  354 	call add_space
      009105 CD 11 87         [ 4]  355 	call cpy_quote  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      009105 A6 3C 11         [ 2]  356 	jp decomp_loop
      001313                        357 7$:
      009108 01 26            [ 1]  358 	cp a,#TK_CHAR 
      00910A 23 A6            [ 1]  359 	jrne 8$
                                    360 ;; TK_CHAR
      00910C 34 6B 02         [ 4]  361 	call add_space 
      00910F 91 D6            [ 1]  362 	ld a,#'\ 
      009111 01 72            [ 1]  363 	ld (y),a 
      009113 5C 00            [ 1]  364 	incw y
      009115 02               [ 1]  365 	ld a,(x)
      009116 A1 3D 26 04      [ 1]  366 	inc in  
      00911A A6 36            [ 2]  367 	jra 81$
      00911C 20 26            [ 1]  368 8$: cp a,#TK_COLON 
      00911E A1 3E            [ 1]  369 	jrne 9$
      009120 26 04            [ 1]  370 	ld a,#':
      00132D                        371 81$:
      009122 A6 35            [ 1]  372 	ld (y),a 
      009124 20 1E            [ 1]  373 	incw y 
      001331                        374 82$:
      009126 72 5A 00         [ 2]  375 	jp decomp_loop
      001334                        376 9$: 
      009129 02 7B            [ 1]  377 	cp a,#TK_SHARP
      00912B 02 20            [ 1]  378 	jrugt 10$ 
      00912D 16 05            [ 1]  379 	sub a,#TK_ARRAY 
      00912E 5F               [ 1]  380 	clrw x 
      00912E 7B               [ 1]  381 	ld xl,a
      00912F 01 CD 8E         [ 2]  382 	addw x,#single_char 
      009132 D1               [ 1]  383 	ld a,(x)
      009133 25 03            [ 2]  384 	jra 81$ 
      001342                        385 10$: 
      009135 CC 97            [ 1]  386 	cp a,#TK_MINUS 
      009137 1E 0A            [ 1]  387 	jrugt 11$
      009138 A0 10            [ 1]  388 	sub a,#TK_PLUS 
      009138 CD               [ 1]  389 	clrw x 
      009139 8F               [ 1]  390 	ld xl,a 
      00913A 17 A3 00         [ 2]  391 	addw x,#add_char 
      00913D 7E               [ 1]  392 	ld a,(x)
      00913E 26 08            [ 2]  393 	jra 81$
      001350                        394 11$:
      009140 93 CC            [ 1]  395     cp a,#TK_MOD 
      009142 90 86            [ 1]  396 	jrugt 12$
      009144 A0 20            [ 1]  397 	sub a,#TK_MULT
      009144 F7               [ 1]  398 	clrw x 
      009145 5C               [ 1]  399 	ld xl,a 
      009146 90 93 90         [ 2]  400 	addw x,#mul_char
      009148 F6               [ 1]  401 	ld a,(x)
      009148 5B 02            [ 2]  402 	jra 81$
      00135E                        403 12$:
      00914A 81 31            [ 1]  404 	sub a,#TK_GT  
      00914B 48               [ 1]  405 	sll a 
      00914B 90               [ 1]  406 	clrw x 
      00914C 89               [ 1]  407 	ld xl,a 
      00914D 52 02 55         [ 2]  408 	addw x,#relop_str 
      009150 00               [ 2]  409 	ldw x,(x)
      009151 1C               [ 1]  410 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      009152 00               [ 1]  411 	incw x 
      009153 05 72            [ 1]  412 	ld (y),a
      009155 1A 00            [ 1]  413 	incw y 
      009157 23               [ 1]  414 	ld a,(x)
      009158 A6 00            [ 1]  415 	jrne 81$
      00915A AE 00 00         [ 2]  416 	jp decomp_loop 
      001373                        417 20$: 
      00915D CF 16            [ 1]  418 	clr (y)
      00915F B8 C7            [ 2]  419 	ldw x,(STR,sp)
      009161 16 BA            [ 1]  420 	ld a,(BASE_SAV,sp)
      009163 AE 16 BB         [ 1]  421 	ld base,a 
      009166 72 5F            [ 1]  422 	ld a,(WIDTH_SAV,sp)
      009168 00 02 CD         [ 1]  423 	ld tab_width,a
      00916B 8F 97 A1         [ 2]  424 	subw y,(STR,sp) 
      00916E 84 26            [ 1]  425 	ld a,yl 
      001386                        426 	_drop VSIZE 
      009170 11 A3            [ 2]    1     addw sp,#VSIZE 
      009172 00               [ 4]  427 	ret 
                                    428 
      009173 01 2A 05 A6 0A         429 single_char: .byte '@','(',')',',','#'
      009178 CC 97                  430 add_char: .byte '+','-'
      00917A 20 CF 16               431 mul_char: .byte '*','/','%'
      00917D B8 90 AE 16 BB 90 A3   432 relop_str: .word gt,equal,ge,lt,ne,le 
             17 74 25 05 A6
      009189 0F CC                  433 gt: .asciz ">"
      00918B 97 20                  434 equal: .asciz "="
      00918D 3E 3D 00               435 ge: .asciz ">="
      00918D 93 CD                  436 lt: .asciz "<"
      00918F 8F 97 A1               437 le: .asciz "<="
      009192 00 26 ED               438 ne:  .asciz "<>"
                                    439 
                                    440 ;----------------------------------
                                    441 ; search in kword_dict name
                                    442 ; from its execution address 
                                    443 ; input:
                                    444 ;   X       	cmd_index 
                                    445 ; output:
                                    446 ;   X 			cstr*  | 0 
                                    447 ;--------------------------------
                           000001   448 	CMDX=1 
                           000003   449 	LINK=3 
                           000004   450 	VSIZE=4
      0013AE                        451 cmd_name:
      0013AE                        452 	_vars VSIZE 
      009195 72 A2            [ 2]    1     sub sp,#VSIZE 
      009197 16 B8 90 9F      [ 1]  453 	clr acc16 
      00919B AE 16            [ 2]  454 	ldw (CMDX,sp),x  
      00919D B8 CF 00         [ 2]  455 	ldw x,#kword_dict	
      0091A0 1A E7            [ 2]  456 1$:	ldw (LINK,sp),x
      0091A2 02 FE            [ 1]  457 	ld a,(2,x)
      0091A4 27 09            [ 1]  458 	and a,#15 
      0091A6 CD 8D 7E         [ 1]  459 	ld acc8,a 
      0091A9 72 5F 00         [ 2]  460 	addw x,#3
      0091AC 04 20 0F 0D      [ 2]  461 	addw x,acc16
      0091AF FE               [ 2]  462 	ldw x,(x) ; command index  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      0091AF CE 00            [ 2]  463 	cpw x,(CMDX,sp)
      0091B1 1A CF            [ 1]  464 	jreq 2$
      0091B3 00 05            [ 2]  465 	ldw x,(LINK,sp)
      0091B5 E6               [ 2]  466 	ldw x,(x) 
      0091B6 02 C7 00         [ 2]  467 	subw x,#2  
      0091B9 04 35            [ 1]  468 	jrne 1$
      0091BB 03               [ 1]  469 	clr a 
      0091BC 00               [ 1]  470 	clrw x 
      0091BD 02 05            [ 2]  471 	jra 9$
      0091BE 1E 03            [ 2]  472 2$: ldw x,(LINK,sp)
      0091BE 5B 02 72         [ 2]  473 	addw x,#2 	
      0013DF                        474 9$:	_drop VSIZE
      0091C1 1B 00            [ 2]    1     addw sp,#VSIZE 
      0091C3 23               [ 4]  475 	ret
                                    476 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
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
      000000                         64 in.w::  .blkb 1 ; parser position in text line high-byte 
      000001                         65 in::    .blkb 1 ; low byte of in.w 
      000002                         66 in.saved:: .blkb 1 ; set by get_token before parsing next token, used by unget_token
      000003                         67 count:: .blkb 1 ; current BASIC line length and tib text length  
      000004                         68 basicptr::  .blkb 2  ; point to current BASIC line address.
      000006                         69 data_ptr:  .blkw 1  ; point to DATA address
      000008                         70 data_ofs:  .blkb 1  ; index to next data item 
      000009                         71 data_len:  .blkb 1  ; length of data line 
      00000A                         72 base::  .blkb 1 ; nemeric base used to print integer 
      00000B                         73 acc32:: .blkb 1 ; 32 bit accumalator upper-byte 
      00000C                         74 acc24:: .blkb 1 ; 24 bits accumulator upper-byte 
      00000D                         75 acc16:: .blkb 1 ; 16 bits accumulator, acc24 high-byte
      00000E                         76 acc8::  .blkb 1 ;  8 bits accumulator, acc24 low-byte  
      00000F                         77 ticks: .blkb 3 ; milliseconds ticks counter (see Timer4UpdateHandler)
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
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
      0013E2                        116 strlen::
      0091C4 90               [ 2]  117 	pushw x 
      0091C5 85               [ 1]  118 	clr a
      0091C6 81               [ 1]  119 1$:	tnz (x) 
      0091C7 27 04            [ 1]  120 	jreq 9$ 
      0091C7 5D               [ 1]  121 	inc a 
      0091C8 27               [ 1]  122 	incw x 
      0091C9 14 F6            [ 2]  123 	jra 1$ 
      0091CB 5C               [ 2]  124 9$:	popw x 
      0091CC A4               [ 4]  125 	ret 
                                    126 
                                    127 ;------------------------------------
                                    128 ; compare 2 strings
                                    129 ; input:
                                    130 ;   X 		char* first string 
                                    131 ;   Y       char* second string 
                                    132 ; output:
                                    133 ;   A 		0 not == |1 ==  
                                    134 ;-------------------------------------
      0013ED                        135 strcmp:
      0091CD 0F               [ 1]  136 	ld a,(x)
      0091CE 88 0D            [ 1]  137 	jreq 5$ 
      0091D0 01 27            [ 1]  138 	cp a,(y) 
      0091D2 0A F6            [ 1]  139 	jrne 4$ 
      0091D4 90               [ 1]  140 	incw x 
      0091D5 F7 5C            [ 1]  141 	incw y 
      0091D7 90 5C            [ 2]  142 	jra strcmp 
      0013F9                        143 4$: ; not same  
      0091D9 0A               [ 1]  144 	clr a 
      0091DA 01               [ 4]  145 	ret 
      0013FB                        146 5$: ; same 
      0091DB 26 F6            [ 1]  147 	ld a,#1 
      0091DD 84               [ 4]  148 	ret 
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
      0091DE                        159 strcpy::
      0091DE 81               [ 1]  160 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      0091DF 89               [ 2]  161 	pushw x 
      0091DF 90 5A            [ 1]  162 1$: ld a,(y)
      0091E1 90 F6            [ 1]  163 	jreq 9$ 
      0091E3 90               [ 1]  164 	ld (x),a 
      0091E4 5C               [ 1]  165 	incw x 
      0091E5 A1 29            [ 1]  166 	incw y 
      0091E7 27 05            [ 2]  167 	jra 1$ 
      0091E9 CD               [ 1]  168 9$:	clr (x)
      0091EA 8E               [ 2]  169 	popw x 
      0091EB EB               [ 1]  170 	pop a 
      0091EC 24               [ 4]  171 	ret 
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
                           000001   182 	INCR=1 ; incrament high byte 
                           000002   183 	LB=2 ; increment low byte 
                           000002   184 	VSIZE=2
      00140E                        185 move::
      0091ED 06               [ 1]  186 	push a 
      0091EE                        187 	_vars VSIZE 
      0091EE A6 20            [ 2]    1     sub sp,#VSIZE 
      0091F0 90 F7            [ 1]  188 	clr (INCR,sp)
      0091F2 90 5C            [ 1]  189 	clr (LB,sp)
      0091F4 81 89            [ 2]  190 	pushw y 
      0091F5 13 01            [ 2]  191 	cpw x,(1,sp) ; compare DEST to SRC 
      0091F5 88 7B            [ 2]  192 	popw y 
      0091F7 01 C1            [ 1]  193 	jreq move_exit ; x==y 
      0091F9 00 24            [ 1]  194 	jrmi move_down
      00141F                        195 move_up: ; start from top address with incr=-1
      0091FB 2A 08 A6 20      [ 2]  196 	addw x,acc16
      0091FF 5A F7 0C 01      [ 2]  197 	addw y,acc16
      009203 20 F1            [ 1]  198 	cpl (INCR,sp)
      009205 84 81            [ 1]  199 	cpl (LB,sp)   ; increment = -1 
      009207 20 05            [ 2]  200 	jra move_loop  
      00142D                        201 move_down: ; start from bottom address with incr=1 
      009207 A6               [ 2]  202     decw x 
      009208 22 90            [ 2]  203 	decw y
      00920A F7 90            [ 1]  204 	inc (LB,sp) ; incr=1 
      001432                        205 move_loop:	
      00920C 5C 89 CD         [ 1]  206     ld a, acc16 
      00920F 98 45 85         [ 1]  207 	or a, acc8
      009212 F6 27            [ 1]  208 	jreq move_exit 
      009214 30 5C A1         [ 2]  209 	addw x,(INCR,sp)
      009217 20 25 0E         [ 2]  210 	addw y,(INCR,sp) 
      00921A 90 F7            [ 1]  211 	ld a,(y)
      00921C 90               [ 1]  212 	ld (x),a 
      00921D 5C               [ 2]  213 	pushw x 
      00921E A1 5C 26         [ 2]  214 	ldw x,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      009221 F0               [ 2]  215 	decw x 
      009222 CF 00 0D         [ 2]  216 	ldw acc16,x 
      009222 90               [ 2]  217 	popw x 
      009223 F7 90            [ 2]  218 	jra move_loop
      00144E                        219 move_exit:
      00144E                        220 	_drop VSIZE
      009225 5C 20            [ 2]    1     addw sp,#VSIZE 
      009227 EA               [ 1]  221 	pop a 
      009228 88               [ 4]  222 	ret 	
                                    223 
                                    224 ;------------------------------------
                                    225 ;  set all variables to zero 
                                    226 ; input:
                                    227 ;   none 
                                    228 ; output:
                                    229 ;	none
                                    230 ;------------------------------------
      001452                        231 clear_vars:
      009229 A6               [ 2]  232 	pushw x 
      00922A 5C               [ 1]  233 	push a  
      00922B 90 F7 90         [ 2]  234 	ldw x,#vars 
      00922E 5C 84            [ 1]  235 	ld a,#CELL_SIZE*26 
      009230 A0               [ 1]  236 1$:	clr (x)
      009231 07               [ 1]  237 	incw x 
      009232 C7               [ 1]  238 	dec a 
      009233 00 0F            [ 1]  239 	jrne 1$
      009235 72               [ 1]  240 	pop a 
      009236 5F               [ 2]  241 	popw x 
      009237 00               [ 4]  242 	ret 
                                    243 
                                    244 
                                    245 ;-----------------------
                                    246 ;  display system 
                                    247 ;  information 
                                    248 ;-----------------------
                           000002   249 	MAJOR=2
                           000000   250 	MINOR=0 
      009238 0E 89 AE 8E 3D 72 BB   251 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
             00 0E F6 85 20 DD A6
             22 90 F7 90 5C 5C 81
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 32 0A 76 65
             72 73 69 6F 6E 20 00
                                    252 
      00924D                        253 system_information:
      00924D 1D 00 31         [ 2]  254 	ldw x,#software 
      009250 A6 03 62         [ 4]  255 	call puts 
      009253 9F AB            [ 1]  256 	ld a,#MAJOR 
      009255 41 81 0E         [ 1]  257 	ld acc8,a 
      009257 5F               [ 1]  258 	clrw x 
      009257 90 89 90         [ 2]  259 	ldw acc24,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00925A AE B3 75 90      [ 1]  260 	clr tab_width  
      00925E CF 00 1A 90      [ 1]  261 	mov base, #10 
      009262 5F 91 D3         [ 4]  262 	call prt_acc24 
      009265 1A 27            [ 1]  263 	ld a,#'.
      009267 0C 90 5C         [ 4]  264 	call putc 
      00926A 91 D6            [ 1]  265 	ld a,#MINOR 
      00926C 1A 90 5C         [ 1]  266 	ld acc8,a 
      00926F 91               [ 1]  267 	clrw x 
      009270 DA 1A 26         [ 2]  268 	ldw acc24,x 
      009273 EF 93 90         [ 4]  269 	call prt_acc24
      009276 85 81            [ 1]  270 	ld a,#CR 
      009278 CD 09 40         [ 4]  271 	call putc
                                    272 ;call test 
      009278 52               [ 4]  273 	ret
                                    274 
      0014D8                        275 warm_init:
      009279 04 C6 00 0B      [ 2]  276 	ldw y,#XSTACK_EMPTY  
      00927D 6B 01 C6 00      [ 1]  277 	clr flags 
      009281 24 6B 02 17      [ 1]  278 	clr loop_depth 
      009285 03 72 CE 00      [ 1]  279 	mov tab_width,#TAB_WIDTH 
      009289 05 35 0A 00      [ 1]  280 	mov base,#10 
      00928D 0B 35 05         [ 2]  281 	ldw x,#0 
      009290 00 24 72         [ 2]  282 	ldw basicptr,x 
      009293 5F 00 0D         [ 2]  283 	ldw in.w,x 
      009296 CF 00 0E 4F      [ 1]  284 	clr count
      00929A CD               [ 4]  285 	ret 
                                    286 
                                    287 ;---------------------------
                                    288 ; reset BASIC text variables 
                                    289 ; and clear variables 
                                    290 ;---------------------------
      0014FA                        291 clear_basic:
      00929B 98               [ 2]  292 	pushw x 
      00929C B1 CD 91 F5      [ 1]  293 	clr count
      0092A0 88 90 93 1E      [ 1]  294 	clr in  
      0092A4 04 CD 94         [ 2]  295 	ldw x,#free_ram 
      0092A7 7E 90 5F         [ 2]  296 	ldw txtbgn,x 
      0092AA 84 90 97         [ 2]  297 	ldw txtend,x 
      0092AD 72 F9 03         [ 4]  298 	call clear_vars 
      0092B0 A6               [ 2]  299 	popw x
      0092B1 20               [ 4]  300 	ret 
                                    301 
                                    302 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    303 ;;   Tiny BASIC error messages     ;;
                                    304 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001511                        305 err_msg:
      0092B2 90 F7 90 5C 72 5F 00   306 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             24 AE 00 03 CF
      0092BE 00 01 15 A2 15 BC 15   307 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             CD 15 DE
      0092C0 15 EA 16 1D 16 2D 16   308 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             41 16 54
      0092C0 90 89                  309 	.word err_overflow 
                                    310 
      0092C2 CD 98 1F 90 85 4D 26   311 err_mem_full: .asciz "Memory full\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal  03-Bits]



             66 75 6C 6C 0A 00
      0092CA CC 93 F3 2B 03 CC 93   312 err_syntax: .asciz "syntax error\n" 
             64 72 72 6F 72 0A 00
      0092D2 6D 61 74 68 20 6F 70   313 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      0092D2 A1 85 26 0F CD 91 DF   314 err_div0: .asciz "division by 0\n" 
             CD 98 54 CD 92 4D 90
             F7
      0092E1 90 5C 20 DB 6C 69 64   315 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      0092E5 72 75 6E 20 74 69 6D   316 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      0092E5 A1 84 26 26 CD 98 5E   317 err_cmd_only: .asciz "command line only usage.\n"
             C7 00 0D CF 00 0E CD
             91 DF 90 89 A6 FF CD
             98 B1 16 01 88
      0092FF 51 CD 94 7E 90 5F 84   318 err_duplicate: .asciz "duplicate name.\n"
             90 97 72 F9 01 5B 02
             20 B1 00
      00930F 46 69 6C 65 20 6E 6F   319 err_not_file: .asciz "File not found.\n"
             74 20 66 6F 75 6E 64
             2E 0A 00
      00930F A1 87 24 39 FE 72 5C   320 err_bad_value: .asciz "bad value.\n"
             00 02 72 5C 00
      00931B 02 A3 00 7E 26 23 CE   321 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             00 05 CD 91 DF A6 27
             90 F7 90 5C 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      00932D 4E 6F 20 64 61 74 61   322 err_no_data: .asciz "No data found.\n"
             20 66 6F 75 6E 64 2E
             0A 00
      00932D 72 D6 00 01 72 5C 00   323 err_no_prog: .asciz "No program in RAM!\n"
             02 90 F7 90 5C C6 00
             02 C1 00 04 2B EC
      009341 CC 93 F3 A3 00 48 26   324 err_no_fspace: .asciz "File system full.\n" 
             0B CC 92 C0 20 66 75
             6C 6C 2E 0A 00
      00934C 42 75 66 66 65 72 20   325 err_buf_full: .asciz "Buffer full\n"
             66 75 6C 6C 0A 00
      00934C 5F A0 87 48 97 1C 00   326 err_overflow: .asciz "overflow\n" 
             F8 0A 00
                                    327 
      009354 0A 72 75 6E 20 74 69   328 rt_msg: .asciz "\nrun time error, "
             6D 65 20 65 72 72 6F
             72 2C 20 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      009354 CD 91 DF 90 89 CD 94   329 comp_msg: .asciz "\ncompile error, "
             2E 90 85 CD 91 C7 CC
             92 C0 00
      009364 6C 61 73 74 20 74 6F   330 tk_id: .asciz "last token id: "
             6B 65 6E 20 69 64 3A
             20 00
                                    331 
      00169E                        332 syntax_error::
      009364 A1 03            [ 1]  333 	ld a,#ERR_SYNTAX 
                                    334 
      0016A0                        335 tb_error::
      009366 26 1E A6 20 90   [ 2]  336 	btjt flags,#FCOMP,1$
      00936B F7               [ 1]  337 	push a 
      00936C 90 5C 6B         [ 2]  338 	ldw x, #rt_msg 
      00936E CD 09 9D         [ 4]  339 	call puts 
      00936E 89               [ 1]  340 	pop a 
      00936F CD 98 45         [ 2]  341 	ldw x, #err_msg 
      009372 85 5F 00 0D      [ 1]  342 	clr acc16 
      009373 48               [ 1]  343 	sll a
      009373 F6 27 07 5C      [ 1]  344 	rlc acc16  
      009377 90 F7 90         [ 1]  345 	ld acc8, a 
      00937A 5C 20 F6 0D      [ 2]  346 	addw x,acc16 
      00937D FE               [ 2]  347 	ldw x,(x)
      00937D A6 20 90         [ 4]  348 	call puts
      009380 F7 90 5C         [ 2]  349 	ldw x,basicptr 
                           000001   350 .if DEBUG 
      009383 CC 92 C0         [ 1]  351 ld a,count 
      009386 90 5F            [ 1]  352 clrw y 
      009386 A1 02            [ 1]  353 rlwa y  
      009388 26 09 CD         [ 4]  354 call hex_dump
      00938B 91 DF CD         [ 2]  355 ldw x,basicptr
                                    356 .endif 
      00938E 92 07 CC         [ 1]  357 	ld a,in 
      009391 92 C0 CB         [ 4]  358 	call prt_basic_line
      009393 AE 16 8E         [ 2]  359 	ldw x,#tk_id 
      009393 A1 04 26         [ 4]  360 	call puts 
      009396 10 CD 91         [ 1]  361 	ld a,in.saved 
      009399 DF               [ 1]  362 	clrw x 
      00939A A6               [ 1]  363 	ld xl,a 
      00939B 5C 90 F7 90      [ 2]  364 	addw x,basicptr 
      00939F 5C               [ 1]  365 	ld a,(x)
      0093A0 F6               [ 1]  366 	clrw x 
      0093A1 72               [ 1]  367 	ld xl,a 
      0093A2 5C 00 02         [ 4]  368 	call prt_i16
      0093A5 20 06            [ 2]  369 	jra 6$
      0016F1                        370 1$:	
      0093A7 A1               [ 1]  371 	push a 
      0093A8 0A 26 09         [ 2]  372 	ldw x,#comp_msg
      0093AB A6 3A 9D         [ 4]  373 	call puts 
      0093AD 84               [ 1]  374 	pop a 
      0093AD 90 F7 90         [ 2]  375 	ldw x, #err_msg 
      0093B0 5C 5F 00 0D      [ 1]  376 	clr acc16 
      0093B1 48               [ 1]  377 	sll a
      0093B1 CC 92 C0 0D      [ 1]  378 	rlc acc16  
      0093B4 C7 00 0E         [ 1]  379 	ld acc8, a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      0093B4 A1 09 22 0A      [ 2]  380 	addw x,acc16 
      0093B8 A0               [ 2]  381 	ldw x,(x)
      0093B9 05 5F 97         [ 4]  382 	call puts
      0093BC 1C 94 09         [ 2]  383 	ldw x,#tib
      0093BF F6 20 EB         [ 4]  384 	call puts 
      0093C2 A6 0D            [ 1]  385 	ld a,#CR 
      0093C2 A1 11 22         [ 4]  386 	call putc
      0093C5 0A A0 10         [ 2]  387 	ldw x,in.w
      0093C8 5F 97 1C         [ 4]  388 	call spaces
      0093CB 94 0E            [ 1]  389 	ld a,#'^
      0093CD F6 20 DD         [ 4]  390 	call putc 
      0093D0 AE 17 FF         [ 2]  391 6$: ldw x,#STACK_EMPTY 
      0093D0 A1               [ 1]  392     ldw sp,x
                                    393 
      00172A                        394 warm_start:
      0093D1 22 22 0A         [ 4]  395 	call warm_init
                                    396 ;----------------------------
                                    397 ;   BASIC interpreter
                                    398 ;----------------------------
      00172D                        399 cmd_line: ; user interface 
      0093D4 A0 20            [ 1]  400 	ld a,#CR 
      0093D6 5F 97 1C         [ 4]  401 	call putc 
      0093D9 94 10            [ 1]  402 	ld a,#'> 
      0093DB F6 20 CF         [ 4]  403 	call putc
      0093DE CD 0A A2         [ 4]  404 	call readln
      0093DE A0 31 48 5F      [ 1]  405 	tnz count 
      0093E2 97 1C            [ 1]  406 	jreq cmd_line
      0093E4 94 13 FE         [ 4]  407 	call compile
                                    408 ;;;;;;;;;;;;;;;;;;;;;;	
                                    409 ;pushw y 
                                    410 ;ldw x,txtbgn  
                                    411 ;ldw y,txtend
                                    412 ;ldw acc16,x   
                                    413 ;subw y,acc16 
                                    414 ;call hex_dump
                                    415 ;popw y 
                                    416 ;;;;;;;;;;;;;;;;;;;;;;
                                    417 
                                    418 ; if text begin with a line number
                                    419 ; the compiler set count to zero    
                                    420 ; so code is not interpreted
      0093E7 F6 5C 90 F7      [ 1]  421 	tnz count 
      0093EB 90 5C            [ 1]  422 	jreq cmd_line
                                    423 	
                                    424 ; if direct command 
                                    425 ; it's ready to interpret 
                                    426 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    427 ;; This is the interpreter loop
                                    428 ;; for each BASIC code line. 
                                    429 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      001749                        430 interpreter: 
      0093ED F6 26 BD         [ 1]  431 	ld a,in 
      0093F0 CC 92 C0         [ 1]  432 	cp a,count 
      0093F3 2B 1D            [ 1]  433 	jrmi interp_loop
      001751                        434 next_line:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      0093F3 90 7F 1E 03 7B   [ 2]  435 	btjf flags, #FRUN, cmd_line
      0093F8 01 C7 00         [ 2]  436 	ldw x,basicptr
      0093FB 0B 7B 02 C7      [ 2]  437 	addw x,in.w 
      0093FF 00 24 72         [ 2]  438 	cpw x,txtend 
      009402 F2 03            [ 1]  439 	jrpl warm_start
      009404 90 9F 5B         [ 2]  440 	ldw basicptr,x ; start of next line  
      009407 04 81            [ 1]  441 	ld a,(2,x)
      009409 40 28 29         [ 1]  442 	ld count,a 
      00940C 2C 23 2B 2D      [ 1]  443 	mov in,#3 ; skip first 3 bytes of line 
      00176E                        444 interp_loop:
      009410 2A 2F 25         [ 4]  445 	call next_token
      009413 94 1F            [ 1]  446 	cp a,#TK_NONE 
      009415 94 21            [ 1]  447 	jreq next_line 
      009417 94 23            [ 1]  448 	cp a,#TK_CMD
      009419 94 26            [ 1]  449 	jrne 1$
      00941B 94 2B 94         [ 4]  450 	call get_code_addr
      00941E 28               [ 4]  451 	call (x) 
      00941F 3E 00            [ 2]  452 	jra interp_loop 
      00177F                        453 1$:	 
      009421 3D 00            [ 1]  454 	cp a,#TK_VAR
      009423 3E 3D            [ 1]  455 	jrne 2$
      009425 00 3C 00         [ 4]  456 	call let_var  
      009428 3C 3D            [ 2]  457 	jra interp_loop 
      001788                        458 2$:	
      00942A 00 3C            [ 1]  459 	cp a,#TK_ARRAY 
      00942C 3E 00            [ 1]  460 	jrne 3$
      00942E CD 1C 81         [ 4]  461 	call let_array 
      00942E 52 04            [ 2]  462 	jra interp_loop
      001791                        463 3$:	
      009430 72 5F            [ 1]  464 	cp a,#TK_COLON 
      009432 00 0E            [ 1]  465 	jreq interp_loop
      009434 1F 01            [ 1]  466 4$: cp a,#TK_LABEL
      009436 AE B3 6D         [ 4]  467 	call skip_string 
      009439 1F 03            [ 2]  468 	jra interp_loop 
      00943B E6 02 A4         [ 2]  469 5$:	jp syntax_error 
                                    470 
                                    471 ;--------------------------
                                    472 ; extract next token from
                                    473 ; token list 
                                    474 ; basicptr -> base address 
                                    475 ; in  -> offset in list array 
                                    476 ; output:
                                    477 ;   A 		token attribute
                                    478 ;   X 		*token_value 
                                    479 ;----------------------------------------
      00179F                        480 next_token::
                                    481 ;	clrw x 
      00943E 0F C7 00         [ 1]  482 	ld a,in 
      009441 0F 1C 00         [ 1]  483 	ld in.saved,a ; in case "_unget_token" needed 
                                    484 ; don't replace sub by "cp a,count" 
                                    485 ; if end of line must return with A=0   	
      009444 03 72 BB         [ 1]  486 	sub a,count 
      009447 00 0E            [ 1]  487 	jreq 9$ ; end of line 
      0017AA                        488 0$: 
      009449 FE 13 01         [ 2]  489 	ldw x,basicptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      00944C 27 0C 1E 03      [ 2]  490 	addw x,in.w 
      009450 FE               [ 1]  491 	ld a,(x)
      009451 1D               [ 1]  492 	incw x
      009452 00 02 26 E3      [ 1]  493 	inc in   
      009456 4F               [ 4]  494 9$: ret 
                                    495 
                                    496 ;------------------------
                                    497 ; get cmd and function 
                                    498 ; code address 
                                    499 ; input:
                                    500 ;    X   * cmd|func index 
                                    501 ;        in code_addr table 
                                    502 ;------------------------
      0017B8                        503 get_code_addr:
      009457 5F               [ 2]  504 	ldw x,(x)
      009458 20 05 1E         [ 2]  505 	ldw x,(code_addr,x)
      00945B 03 1C 00 02      [ 1]  506 	inc in 
      00945F 5B 04 81 01      [ 1]  507 	inc in 
      000001 81               [ 4]  508 	ret
                                    509 
                                    510 ;-------------------------
                                    511 ;  skip .asciz in BASIC line 
                                    512 ;  name 
                                    513 ;  input:
                                    514 ;     x		* string 
                                    515 ;  output:
                                    516 ;     none 
                                    517 ;-------------------------
      000002                        518 skip_string:
      000003 F6               [ 1]  519 	ld a,(x)
      000004 27 03            [ 1]  520 	jreq 1$
      000005 5C               [ 1]  521 	incw x 
      000007 20 FA            [ 2]  522 	jra skip_string 
      000009 5C               [ 1]  523 1$: incw x 	
      00000A 72 B0 00 04      [ 2]  524 	subw x,basicptr 
      00000B CF 00 00         [ 2]  525 	ldw in.w,x 
      00000C 81               [ 4]  526 	ret 
                                    527 
                                    528 ;---------------------
                                    529 ; extract 16 bits  
                                    530 ; address from BASIC
                                    531 ; code 
                                    532 ; input:
                                    533 ;    X    *address
                                    534 ; output:
                                    535 ;    X    address 
                                    536 ;-------------------- 
      00000D                        537 get_addr:
      00000E FE               [ 2]  538 	ldw x,(x)
      00000F 72 5C 00 01      [ 1]  539 	inc in 
      000010 72 5C 00 01      [ 1]  540 	inc in 
      000013 81               [ 4]  541 	ret 
                                    542 
                                    543 ;--------------------
                                    544 ; extract int24_t  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



                                    545 ; value from BASIC 
                                    546 ; code 
                                    547 ; input:
                                    548 ;    X   *integer 
                                    549 ; output:
                                    550 ;    A:X   int24  
                                    551 ;--------------------
      000015                        552 get_int24:
      000017 F6               [ 1]  553 	ld a,(x)
      000019 EE 01            [ 2]  554 	ldw x,(1,x)
                                    555 ; skip 3 bytes 
      00001A 72 5C 00 01      [ 1]  556 	inc in 
      00001B 72 5C 00 01      [ 1]  557 	inc in 
      00001C 72 5C 00 01      [ 1]  558 	inc in 
      00001E 81               [ 4]  559 	ret 
                                    560 
                                    561 ;-------------------------
                                    562 ; get character from 
                                    563 ; BASIC code 
                                    564 ; input:
                                    565 ;    X   *char 
                                    566 ; output:
                                    567 ;    A    char 
                                    568 ;-------------------------
      000020                        569 get_char:
      000021 F6               [ 1]  570 	ld a,(x)
      000023 72 5C 00 01      [ 1]  571 	inc in  
      000024 81               [ 4]  572     ret 
                                    573 
                                    574 ;-----------------------------------
                                    575 ; print a 16 bit integer 
                                    576 ; using variable 'base' as conversion
                                    577 ; format.
                                    578 ; input:
                                    579 ;    X       integer to print 
                                    580 ;   'base'    conversion base 
                                    581 ; output:
                                    582 ;   terminal  
                                    583 ;-----------------------------------
      000025                        584 prt_i16:
      000027 72 5F 00 0C      [ 1]  585 	clr acc24 
      00002F CF 00 0D         [ 2]  586 	ldw acc16,x 
      000030 A6 10            [ 1]  587 	ld a,#16
      000031 C1 00 0A         [ 1]  588 	cp a,base
      00007C 27 09            [ 1]  589 	jreq prt_acc24  
      00007C 72 0F 00 0D 04   [ 2]  590 	btjf acc16,#7,prt_acc24
      00007E 72 53 00 0C      [ 1]  591 	cpl acc24 ; sign extend 
                                    592 	
                                    593 ;------------------------------------
                                    594 ; print integer in acc24 
                                    595 ; input:
                                    596 ;	acc24 		integer to print 
                                    597 ;	'base' 		numerical base for conversion 
                                    598 ;   'tab_width' field width 
                                    599 ;    A 			signed||unsigned conversion
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



                                    600 ;  output:
                                    601 ;    A          string length
                                    602 ;------------------------------------
      000080                        603 prt_acc24:
      009462 A6 FF            [ 1]  604 	ld a,#255  ; signed conversion  
      009462 89 4F 7D         [ 4]  605     call itoa  ; conversion entier en  .asciz
      009465 27 04 4C         [ 4]  606 	call right_align  
      009468 5C               [ 1]  607 	push a 
      009469 20 F9 85         [ 4]  608 	call puts
      00946C 81               [ 1]  609 	pop a 
      00946D 81               [ 4]  610     ret	
                                    611 
                                    612 ;---------------------------------------
                                    613 ;  print value at xstack top 
                                    614 ;---------------------------------------
      001819                        615 print_top: 
      001819                        616 	_xpop 
      00946D F6 27            [ 1]    1     ld a,(y)
      00946F 0B               [ 1]    2     ldw x,y 
      009470 90 F1            [ 2]    3     ldw x,(1,x)
      009472 26 05 5C 90      [ 2]    4     addw y,#CELL_SIZE 
      009476 5C 20 F4         [ 1]  617 	ld acc24,a 
      009479 CF 00 0D         [ 2]  618 	ldw acc16,x 
      009479 4F 81 0B         [ 4]  619 	call prt_acc24 
      00947B A6 20            [ 1]  620 	ld a,#SPACE
      00947B A6 01 81         [ 4]  621 	call putc 
      00947E 81               [ 4]  622 	ret 
                                    623 
                                    624 ;------------------------------------
                                    625 ; convert integer in acc24 to string
                                    626 ; input:
                                    627 ;   'base'	conversion base 
                                    628 ;	acc24	integer to convert
                                    629 ;   A       0=unsigned, else signed 
                                    630 ; output:
                                    631 ;   X  		pointer to first char of string
                                    632 ;   A       string length
                                    633 ;------------------------------------
                           000001   634 	SIGN=1  ; integer sign 
                           000002   635 	LEN=2 
                           000003   636 	PSTR=3
                           000004   637 	VSIZE=4 ;locals size
      001831                        638 itoa::
      001831                        639 	_vars VSIZE
      00947E 88 89            [ 2]    1     sub sp,#VSIZE 
      009480 90 F6            [ 1]  640 	clr (LEN,sp) ; string length  
      009482 27 06            [ 1]  641 	clr (SIGN,sp)    ; sign
      009484 F7               [ 1]  642 	tnz A
      009485 5C 90            [ 1]  643 	jreq 1$ ; unsigned conversion  
      009487 5C 20 F6         [ 1]  644 	ld a,base 
      00948A 7F 85            [ 1]  645 	cp a,#10
      00948C 84 81            [ 1]  646 	jrne 1$
                                    647 	; base 10 string display with negative sign if bit 23==1
      00948E 72 0F 00 0C 05   [ 2]  648 	btjf acc24,#7,1$
      00948E 88 52            [ 1]  649 	cpl (SIGN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      009490 02 0F 01         [ 4]  650 	call neg_acc24
      00184B                        651 1$:
                                    652 ; initialize string pointer 
      009493 0F 02 90         [ 2]  653 	ldw x,#tib 
      009496 89 13 01         [ 2]  654 	addw x,#TIB_SIZE
      009499 90               [ 2]  655 	decw x 
      00949A 85               [ 1]  656 	clr (x)
      001853                        657 itoa_loop:
      00949B 27 31 2B         [ 1]  658     ld a,base
                                    659 ;	ldw (PSTR,sp),x 
      00949E 0E 03 05         [ 4]  660     call divu24_8 ; acc24/A 
                                    661 ;	ldw x,(PSTR,sp)
      00949F AB 30            [ 1]  662     add a,#'0  ; remainder of division
      00949F 72 BB            [ 1]  663     cp a,#'9+1
      0094A1 00 0E            [ 1]  664     jrmi 2$
      0094A3 72 B9            [ 1]  665     add a,#7 
      001861                        666 2$:	
      0094A5 00               [ 2]  667 	decw x
      0094A6 0E               [ 1]  668     ld (x),a
      0094A7 03 01            [ 1]  669 	inc (LEN,sp)
                                    670 	; if acc24==0 conversion done
      0094A9 03 02 20         [ 1]  671 	ld a,acc24
      0094AC 05 00 0D         [ 1]  672 	or a,acc16
      0094AD CA 00 0E         [ 1]  673 	or a,acc8
      0094AD 5A 90            [ 1]  674     jrne itoa_loop
                                    675 	;conversion done, next add '$' or '-' as required
      0094AF 5A 0C 02         [ 1]  676 	ld a,base 
      0094B2 A1 10            [ 1]  677 	cp a,#16
      0094B2 C6 00            [ 1]  678 	jreq 8$
      0094B4 0E CA            [ 1]  679 	ld a,(SIGN,sp)
      0094B6 00 0F            [ 1]  680     jreq 10$
      0094B8 27 14            [ 1]  681     ld a,#'-
      0094BA 72 FB            [ 2]  682 	jra 9$ 
      00187F                        683 8$:	
      0094BC 01 72            [ 1]  684 	ld a,#'$ 
      0094BE F9               [ 2]  685 9$: decw x
      0094BF 01               [ 1]  686     ld (x),a
      0094C0 90 F6            [ 1]  687 	inc (LEN,sp)
      001885                        688 10$:
      0094C2 F7 89            [ 1]  689 	ld a,(LEN,sp)
      001887                        690 	_drop VSIZE
      0094C4 CE 00            [ 2]    1     addw sp,#VSIZE 
      0094C6 0E               [ 4]  691 	ret
                                    692 
                                    693 ;------------------------------------
                                    694 ; convert alpha to uppercase
                                    695 ; input:
                                    696 ;    a  character to convert
                                    697 ; output:
                                    698 ;    a  uppercase character
                                    699 ;------------------------------------
      00188A                        700 to_upper::
      0094C7 5A CF            [ 1]  701 	cp a,#'a
      0094C9 00 0E            [ 1]  702 	jrpl 1$
      0094CB 85               [ 4]  703 0$:	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      0094CC 20 E4            [ 1]  704 1$: cp a,#'z	
      0094CE 22 FB            [ 1]  705 	jrugt 0$
      0094CE 5B 02            [ 1]  706 	sub a,#32
      0094D0 84               [ 4]  707 	ret
                                    708 	
                                    709 ;------------------------------------
                                    710 ; convert pad content in integer
                                    711 ; input:
                                    712 ;    x		* .asciz to convert
                                    713 ; output:
                                    714 ;    acc24      int24_t
                                    715 ;------------------------------------
                                    716 	; local variables
                           000001   717 	SIGN=1 ; 1 byte, 
                           000002   718 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003   719 	TEMP=3 ; 1 byte, temporary storage
                           000003   720 	VSIZE=3 ; 3 bytes reserved for local storage
      001896                        721 atoi24::
      0094D1 81               [ 2]  722 	pushw x 
      0094D2                        723 	_vars VSIZE
      0094D2 89 88            [ 2]    1     sub sp,#VSIZE 
                                    724 	; acc24=0 
      0094D4 AE 00 31 A6      [ 1]  725 	clr acc24    
      0094D8 4E 7F 5C 4A      [ 1]  726 	clr acc16
      0094DC 26 FB 84 85      [ 1]  727 	clr acc8 
      0094E0 81 0A            [ 1]  728 	clr (SIGN,sp)
      0094E2 0A 54            [ 1]  729 	ld a,#10
      0094E4 69 6E            [ 1]  730 	ld (BASE,sp),a ; default base decimal
      0094E6 79               [ 1]  731 	ld a,(x)
      0094E7 20 42            [ 1]  732 	jreq 9$  ; completed if 0
      0094E9 41 53            [ 1]  733 	cp a,#'-
      0094EB 49 43            [ 1]  734 	jrne 1$
      0094ED 20 66            [ 1]  735 	cpl (SIGN,sp)
      0094EF 6F 72            [ 2]  736 	jra 2$
      0094F1 20 53            [ 1]  737 1$: cp a,#'$
      0094F3 54 4D            [ 1]  738 	jrne 3$
      0094F5 38 0A            [ 1]  739 	ld a,#16
      0094F7 43 6F            [ 1]  740 	ld (BASE,sp),a
      0094F9 70               [ 1]  741 2$:	incw x
      0094FA 79               [ 1]  742 	ld a,(x)
      0018C0                        743 3$:	
      0094FB 72 69            [ 1]  744 	cp a,#'a
      0094FD 67 68            [ 1]  745 	jrmi 4$
      0094FF 74 2C            [ 1]  746 	sub a,#32
      009501 20 4A            [ 1]  747 4$:	cp a,#'0
      009503 61 63            [ 1]  748 	jrmi 9$
      009505 71 75            [ 1]  749 	sub a,#'0
      009507 65 73            [ 1]  750 	cp a,#10
      009509 20 44            [ 1]  751 	jrmi 5$
      00950B 65 73            [ 1]  752 	sub a,#7
      00950D 63 68            [ 1]  753 	cp a,(BASE,sp)
      00950F 65 6E            [ 1]  754 	jrpl 9$
      009511 65 73            [ 1]  755 5$:	ld (TEMP,sp),a
      009513 20 32            [ 1]  756 	ld a,(BASE,sp)
      009515 30 31 39         [ 4]  757 	call mulu24_8
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      009518 2C 32            [ 1]  758 	ld a,(TEMP,sp)
      00951A 30 32 32         [ 1]  759 	add a,acc24+2
      00951D 0A 76 65         [ 1]  760 	ld acc24+2,a
      009520 72               [ 1]  761 	clr a
      009521 73 69 6F         [ 1]  762 	adc a,acc24+1
      009524 6E 20 00         [ 1]  763 	ld acc24+1,a
      009527 4F               [ 1]  764 	clr a
      009527 AE 94 E1         [ 1]  765 	adc a,acc24
      00952A CD 8A 1D         [ 1]  766 	ld acc24,a
      00952D A6 02            [ 2]  767 	jra 2$
      00952F C7 00            [ 1]  768 9$:	tnz (SIGN,sp)
      009531 0F 5F            [ 1]  769     jreq atoi_exit
      009533 CF 00 0D         [ 4]  770     call neg_acc24
      0018FC                        771 atoi_exit: 
      0018FC                        772 	_drop VSIZE
      009536 72 5F            [ 2]    1     addw sp,#VSIZE 
      009538 00               [ 2]  773 	popw x ; restore x
      009539 24               [ 4]  774 	ret
                                    775 
                                    776 
                                    777 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    778 ;;   TINY BASIC  operators,
                                    779 ;;   commands and functions 
                                    780 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    781 
                                    782 ;---------------------------------
                                    783 ; dictionary search 
                                    784 ; input:
                                    785 ;	X 		dictionary entry point, name field  
                                    786 ;   y		.asciz name to search 
                                    787 ; output:
                                    788 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                    789 ;  X		cmd_index
                                    790 ;---------------------------------
                           000001   791 	NLEN=1 ; cmd length 
                           000002   792 	XSAVE=2
                           000004   793 	YSAVE=4
                           000005   794 	VSIZE=5 
      001900                        795 search_dict::
      001900                        796 	_vars VSIZE 
      00953A 35 0A            [ 2]    1     sub sp,#VSIZE 
      00953C 00 0B            [ 2]  797 	ldw (YSAVE,sp),y 
      001904                        798 search_next:
      00953E CD 98            [ 2]  799 	ldw (XSAVE,sp),x 
                                    800 ; get name length in dictionary	
      009540 8B               [ 1]  801 	ld a,(x)
      009541 A6 2E            [ 1]  802 	and a,#0xf 
      009543 CD 89            [ 1]  803 	ld (NLEN,sp),a  
      009545 C0 A6            [ 2]  804 	ldw y,(YSAVE,sp) ; name pointer 
      009547 00               [ 1]  805 	incw x 
      00190E                        806 cp_loop:
      009548 C7 00            [ 1]  807 	ld a,(y)
      00954A 0F 5F            [ 1]  808 	jreq str_match 
      00954C CF 00            [ 1]  809 	tnz (NLEN,sp)
      00954E 0D CD            [ 1]  810 	jreq no_match  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      009550 98               [ 1]  811 	cp a,(x)
      009551 8B A6            [ 1]  812 	jrne no_match 
      009553 0D CD            [ 1]  813 	incw y 
      009555 89               [ 1]  814 	incw x
      009556 C0 81            [ 1]  815 	dec (NLEN,sp)
      009558 20 EE            [ 2]  816 	jra cp_loop 
      001920                        817 no_match:
      009558 90 AE            [ 2]  818 	ldw x,(XSAVE,sp) 
      00955A 17 73 72         [ 2]  819 	subw x,#2 ; move X to link field
      00955D 5F 00            [ 1]  820 	push #TK_NONE 
      00955F 23               [ 2]  821 	ldw x,(x) ; next word link 
      009560 72               [ 1]  822 	pop a ; TK_NONE 
      009561 5F 00            [ 1]  823 	jreq search_exit  ; not found  
                                    824 ;try next 
      009563 20 35            [ 2]  825 	jra search_next
      00192D                        826 str_match:
      009565 04 00            [ 2]  827 	ldw x,(XSAVE,sp)
      009567 24               [ 1]  828 	ld a,(X)
      009568 35 0A            [ 1]  829 	ld (NLEN,sp),a ; needed to test keyword type  
      00956A 00 0B            [ 1]  830 	and a,#NLEN_MASK 
                                    831 ; move x to procedure address field 	
      00956C AE               [ 1]  832 	inc a 
      00956D 00 00 CF         [ 1]  833 	ld acc8,a 
      009570 00 05 CF 00      [ 1]  834 	clr acc16 
      009574 01 72 5F 00      [ 2]  835 	addw x,acc16 
      009578 04               [ 2]  836 	ldw x,(x) ; routine index  
                                    837 ;determine keyword type bits 7:4 
      009579 81 01            [ 1]  838 	ld a,(NLEN,sp)
      00957A A4 F0            [ 1]  839 	and a,#KW_TYPE_MASK 
      00957A 89               [ 1]  840 	swap a 
      00957B 72 5F            [ 1]  841 	add a,#128
      001948                        842 search_exit: 
      001948                        843 	_drop VSIZE 
      00957D 00 04            [ 2]    1     addw sp,#VSIZE 
      00957F 72               [ 4]  844 	ret 
                                    845 
                                    846 ;---------------------
                                    847 ; check if next token
                                    848 ;  is of expected type 
                                    849 ; input:
                                    850 ;   A 		 expected token attribute
                                    851 ;  ouput:
                                    852 ;   none     if fail call syntax_error 
                                    853 ;--------------------
      00194B                        854 expect:
      009580 5F               [ 1]  855 	push a 
      009581 00 02 AE         [ 4]  856 	call next_token 
      009584 00 80            [ 1]  857 	cp a,(1,sp)
      009586 CF 00            [ 1]  858 	jreq 1$
      009588 1C CF 00         [ 2]  859 	jp syntax_error
      00958B 1E               [ 1]  860 1$: pop a 
      00958C CD               [ 4]  861 	ret 
                                    862 
                                    863 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    864 ; parse arguments list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



                                    865 ; between ()
                                    866 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001958                        867 func_args:
      00958D 94 D2            [ 1]  868 	ld a,#TK_LPAREN 
      00958F 85 81 4B         [ 4]  869 	call expect 
                                    870 ; expected to continue in arg_list 
                                    871 ; caller must check for TK_RPAREN 
                                    872 
                                    873 ;-------------------------------
                                    874 ; parse embedded BASIC routines 
                                    875 ; arguments list.
                                    876 ; arg_list::=  expr[','expr]*
                                    877 ; all arguments are of int24_t type
                                    878 ; and pushed on stack 
                                    879 ; input:
                                    880 ;   none
                                    881 ; output:
                                    882 ;   xstack{n}   arguments pushed on xstack
                                    883 ;   A 	number of arguments pushed on xstack  
                                    884 ;--------------------------------
      009591                        885 arg_list:
      009591 00 00            [ 1]  886 	push #0
      009593 95 B3 95         [ 4]  887 1$:	call condition 
      009596 C0               [ 1]  888 	tnz a 
      009597 95 CE            [ 1]  889 	jreq 7$  
      009599 95 E7            [ 1]  890 	inc (1,sp)
      00959B 95 F6 96         [ 4]  891 	call next_token 
      00959E 0C 96            [ 1]  892 	cp a,#TK_COMMA 
      0095A0 22 96            [ 1]  893 	jreq 1$ 
      0095A2 3C 96            [ 1]  894 	cp a,#TK_RPAREN
      0095A4 4D 96            [ 1]  895 	jreq 7$
      001972                        896 	_unget_token 
      0095A6 5E 96 6A 96 9D   [ 1]    1      mov in,in.saved  
      0095AB 96               [ 1]  897 7$:	pop a  
      0095AC AD               [ 4]  898 	ret 
                                    899 
                                    900 ;--------------------------------
                                    901 ;   BASIC commnands 
                                    902 ;--------------------------------
                                    903 
                                    904 ;--------------------------------
                                    905 ;  arithmetic and relational 
                                    906 ;  routines
                                    907 ;  operators precedence
                                    908 ;  highest to lowest
                                    909 ;  operators on same row have 
                                    910 ;  same precedence and are executed
                                    911 ;  from left to right.
                                    912 ;	'*','/','%'
                                    913 ;   '-','+'
                                    914 ;   '=','>','<','>=','<=','<>','><'
                                    915 ;   '<>' and '><' are equivalent for not equal.
                                    916 ;--------------------------------
                                    917 
                                    918 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



                                    919 ; return array element
                                    920 ; address from @(expr)
                                    921 ; input:
                                    922 ;   A 		TK_ARRAY
                                    923 ; output:
                                    924 ;	X 		element address 
                                    925 ;----------------------
      001979                        926 get_array_element:
      0095AD 96 C1 96         [ 4]  927 	call func_args 
      0095B0 D4 96            [ 1]  928 	cp a,#1
      0095B2 E1 4D            [ 1]  929 	jreq 1$
      0095B4 65 6D 6F         [ 2]  930 	jp syntax_error
      001983                        931 1$: _xpop 
      0095B7 72 79            [ 1]    1     ld a,(y)
      0095B9 20               [ 1]    2     ldw x,y 
      0095BA 66 75            [ 2]    3     ldw x,(1,x)
      0095BC 6C 6C 0A 00      [ 2]    4     addw y,#CELL_SIZE 
                                    932     ; ignore A, index < 65536 in any case 
                                    933 	; check for bounds 
      0095C0 73 79 6E         [ 2]  934 	cpw x,array_size 
      0095C3 74 61            [ 2]  935 	jrule 3$
                                    936 ; bounds {1..array_size}	
      0095C5 78 20            [ 1]  937 2$: ld a,#ERR_BAD_VALUE 
      0095C7 65 72 72         [ 2]  938 	jp tb_error 
      0095CA 6F               [ 2]  939 3$: tnzw  x
      0095CB 72 0A            [ 1]  940 	jreq 2$ 
      0095CD 00               [ 2]  941 	pushw x 
      0095CE 6D               [ 2]  942 	sllw x 
      0095CF 61 74 68         [ 2]  943 	addw x,(1,sp) ; index*size_of(int24)
      0095D2 20 6F            [ 2]  944 	ldw (1,sp),x  
      0095D4 70 65 72         [ 2]  945 	ldw x,#tib ; array is below tib 
      0095D7 61 74 69         [ 2]  946 	subw x,(1,sp)
      0019A6                        947 	_drop 2   
      0095DA 6F 6E            [ 2]    1     addw sp,#2 
      0095DC 20               [ 4]  948 	ret 
                                    949 
                                    950 
                                    951 ;***********************************
                                    952 ;   expression parse,execute 
                                    953 ;***********************************
                                    954 ;-----------------------------------
                                    955 ; factor ::= ['+'|'-'|e]  var | @ |
                                    956 ;			 integer | function |
                                    957 ;			 '('relation')' 
                                    958 ; output:
                                    959 ;   A       token attribute 
                                    960 ;   xstack  value  
                                    961 ; ---------------------------------
                           000001   962 	NEG=1
                           000001   963 	VSIZE=1
      0019A9                        964 factor:
      0019A9                        965 	_vars VSIZE 
      0095DD 6F 76            [ 2]    1     sub sp,#VSIZE 
      0095DF 65 72            [ 1]  966 	clr (NEG,sp)
      0095E1 66 6C 6F         [ 4]  967 	call next_token
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      0095E4 77               [ 1]  968 	tnz a 
      0095E5 0A 00            [ 1]  969 	jrne 1$ 
      0095E7 64 69 76         [ 2]  970 	jp 22$ 
      0095EA 69 73            [ 1]  971 1$:	cp a,#TK_PLUS 
      0095EC 69 6F            [ 1]  972 	jreq 2$
      0095EE 6E 20            [ 1]  973 	cp a,#TK_MINUS 
      0095F0 62 79            [ 1]  974 	jrne 4$ 
      0095F2 20 30            [ 1]  975 	cpl (NEG,sp)
      0019C0                        976 2$:	
      0095F4 0A 00 69         [ 4]  977 	call next_token
      0019C3                        978 4$:
      0095F7 6E               [ 1]  979 	tnz a 
      0095F8 76 61            [ 1]  980 	jrne 41$ 
      0095FA 6C 69 64         [ 2]  981 	jp syntax_error  
      0019C9                        982 41$:	
      0095FD 20 6C            [ 1]  983 	cp a,#TK_IFUNC 
      0095FF 69 6E            [ 1]  984 	jrne 5$ 
      009601 65 20 6E         [ 4]  985 	call get_code_addr 
      009604 75               [ 4]  986 	call (x); result in A:X  
      009605 6D 62            [ 2]  987 	jra 18$ 
      0019D3                        988 5$:
      009607 65 72            [ 1]  989 	cp a,#TK_INTGR
      009609 2E 0A            [ 1]  990 	jrne 6$
      00960B 00 72 75         [ 4]  991 	call get_int24 ; A:X
      00960E 6E 20            [ 2]  992 	jra 18$
      0019DC                        993 6$:
      009610 74 69            [ 1]  994 	cp a,#TK_ARRAY
      009612 6D 65            [ 1]  995 	jrne 7$
      009614 20 6F 6E         [ 4]  996 	call get_array_element
      009617 6C 79            [ 2]  997     jra 71$
      0019E5                        998 7$:
      009619 20 75            [ 1]  999 	cp a,#TK_VAR 
      00961B 73 61            [ 1] 1000 	jrne 8$
      00961D 67 65 2E         [ 4] 1001 	call get_addr 
      0019EC                       1002 71$: ; put value in A:X
      009620 0A               [ 1] 1003 	ld a,(x)
      009621 00 63            [ 2] 1004 	ldw x,(1,x)
      009623 6F 6D            [ 2] 1005 	jra 18$
      0019F1                       1006 8$:
      009625 6D 61            [ 1] 1007 	cp a,#TK_LABEL 
      009627 6E 64            [ 1] 1008 	jrne 9$ 
      009629 20               [ 2] 1009 	pushw x 
      00962A 6C 69 6E         [ 4] 1010 	call skip_string
      00962D 65               [ 2] 1011 	popw x 
      00962E 20 6F 6E         [ 4] 1012 	call search_const 
      009631 6C               [ 2] 1013 	tnzw x 
      009632 79 20            [ 1] 1014 	jreq 16$
      009634 75 73 61         [ 4] 1015 	call get_const_value ; in A:X 
      009637 67 65            [ 2] 1016 	jra 18$
      001A05                       1017 9$: 
      009639 2E 0A            [ 1] 1018 	cp a,#TK_CFUNC 
      00963B 00 64            [ 1] 1019 	jrne 12$
      00963D 75 70 6C         [ 4] 1020 	call get_code_addr 
      009640 69               [ 4] 1021 	call(x)
      009641 63               [ 1] 1022 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      009642 61               [ 1] 1023 	rlwa x  ; char>int24 in A:X 
      009643 74 65            [ 2] 1024 	jra 18$ 	 
      001A11                       1025 12$:			
      009645 20 6E            [ 1] 1026 	cp a,#TK_LPAREN
      009647 61 6D            [ 1] 1027 	jrne 16$
      009649 65 2E 0A         [ 4] 1028 	call expression
      00964C 00 46            [ 1] 1029 	ld a,#TK_RPAREN 
      00964E 69 6C 65         [ 4] 1030 	call expect
      001A1D                       1031 	_xpop 
      009651 20 6E            [ 1]    1     ld a,(y)
      009653 6F               [ 1]    2     ldw x,y 
      009654 74 20            [ 2]    3     ldw x,(1,x)
      009656 66 6F 75 6E      [ 2]    4     addw y,#CELL_SIZE 
      00965A 64 2E            [ 2] 1032 	jra 18$	
      001A28                       1033 16$:
      001A28                       1034 	_unget_token 
      00965C 0A 00 62 61 64   [ 1]    1      mov in,in.saved  
      009661 20               [ 1] 1035 	clr a 
      009662 76 61            [ 2] 1036 	jra 22$ 
      001A30                       1037 18$: 
      009664 6C 75            [ 1] 1038 	tnz (NEG,sp)
      009666 65 2E            [ 1] 1039 	jreq 20$
      009668 0A 00 46         [ 4] 1040 	call neg_ax   
      001A37                       1041 20$:
      001A37                       1042 	_xpush 
      00966B 69 6C 65 20      [ 2]    1     subw y,#CELL_SIZE
      00966F 69 6E            [ 1]    2     ld (y),a 
      009671 20 65 78         [ 2]    3     ldw (1,y),x 
      009674 74 65            [ 1] 1043 	ld a,#TK_INTGR
      001A42                       1044 22$:
      001A42                       1045 	_drop VSIZE
      009676 6E 64            [ 2]    1     addw sp,#VSIZE 
      009678 65               [ 4] 1046 	ret
                                   1047 
                                   1048 
                                   1049 ;-----------------------------------
                                   1050 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   1051 ; output:
                                   1052 ;   A    	token attribute 
                                   1053 ;	xstack		value 
                                   1054 ;-----------------------------------
                           000001  1055 	MULOP=1
                           000001  1056 	VSIZE=1
      001A45                       1057 term:
      001A45                       1058 	_vars VSIZE
      009679 64 20            [ 2]    1     sub sp,#VSIZE 
                                   1059 ; first factor 	
      00967B 6D 65 6D         [ 4] 1060 	call factor
      00967E 6F               [ 1] 1061 	tnz a 
      00967F 72 79            [ 1] 1062 	jreq term_exit  
      001A4D                       1063 term01:	 ; check for  operator '*'|'/'|'%' 
      009681 2C 20 63         [ 4] 1064 	call next_token
      009684 61 6E            [ 1] 1065 	ld (MULOP,sp),a
      009686 27 74            [ 1] 1066 	and a,#TK_GRP_MASK
      009688 20 62            [ 1] 1067 	cp a,#TK_GRP_MULT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      00968A 65 20            [ 1] 1068 	jreq 1$
      00968C 72 75            [ 1] 1069 	ld a,#TK_INTGR
      001A5A                       1070 	_unget_token 
      00968E 6E 20 66 72 6F   [ 1]    1      mov in,in.saved  
      009693 6D 20            [ 2] 1071 	jra term_exit 
      001A61                       1072 1$:	; got *|/|%
                                   1073 ;second factor
      009695 74 68 65         [ 4] 1074 	call factor
      009698 72               [ 1] 1075 	tnz a 
      009699 65 2E            [ 1] 1076 	jrne 2$ 
      00969B 0A 00 4E         [ 2] 1077 	jp syntax_error 
      001A6A                       1078 2$: ; select operation 	
      00969E 6F 20            [ 1] 1079 	ld a,(MULOP,sp) 
      0096A0 64 61            [ 1] 1080 	cp a,#TK_MULT 
      0096A2 74 61            [ 1] 1081 	jrne 3$
                                   1082 ; '*' operator
      0096A4 20 66 6F         [ 4] 1083 	call mul24 
      0096A7 75 6E            [ 2] 1084 	jra term01
      0096A9 64 2E            [ 1] 1085 3$: cp a,#TK_DIV 
      0096AB 0A 00            [ 1] 1086 	jrne 4$ 
                                   1087 ; '/' operator	
      0096AD 4E 6F 20         [ 4] 1088 	call div24 
      0096B0 70 72            [ 2] 1089 	jra term01 
      001A7E                       1090 4$: ; '%' operator
      0096B2 6F 67 72         [ 4] 1091 	call mod24
      0096B5 61 6D            [ 2] 1092 	jra term01 
      001A83                       1093 9$: 
      0096B7 20 69            [ 1] 1094 	ld a,#TK_INTGR
      001A85                       1095 term_exit:
      001A85                       1096 	_drop VSIZE 
      0096B9 6E 20            [ 2]    1     addw sp,#VSIZE 
      0096BB 52               [ 4] 1097 	ret 
                                   1098 
                                   1099 ;-------------------------------
                                   1100 ;  expr ::= term [['+'|'-'] term]*
                                   1101 ;  result range {-32768..32767}
                                   1102 ;  output:
                                   1103 ;   A    token attribute 
                                   1104 ;   xstack	 result    
                                   1105 ;-------------------------------
                           000001  1106 	OP=1 
                           000001  1107 	VSIZE=1 
      001A88                       1108 expression:
      001A88                       1109 	_vars VSIZE 
      0096BC 41 4D            [ 2]    1     sub sp,#VSIZE 
                                   1110 ; first term 	
      0096BE 21 0A 00         [ 4] 1111 	call term
      0096C1 46               [ 1] 1112 	tnz a 
      0096C2 69 6C            [ 1] 1113 	jreq 9$
      001A90                       1114 1$:	; operator '+'|'-'
      0096C4 65 20 73         [ 4] 1115 	call next_token
      0096C7 79 73            [ 1] 1116 	ld (OP,sp),a 
      0096C9 74 65            [ 1] 1117 	and a,#TK_GRP_MASK
      0096CB 6D 20            [ 1] 1118 	cp a,#TK_GRP_ADD 
      0096CD 66 75            [ 1] 1119 	jreq 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      001A9B                       1120 	_unget_token 
      0096CF 6C 6C 2E 0A 00   [ 1]    1      mov in,in.saved  
      0096D4 42 75            [ 1] 1121 	ld a,#TK_INTGR
      0096D6 66 66            [ 2] 1122 	jra 9$ 
      001AA4                       1123 2$: ; second term 
      0096D8 65 72 20         [ 4] 1124 	call term
      0096DB 66               [ 1] 1125 	tnz a 
      0096DC 75 6C            [ 1] 1126 	jrne 3$
      0096DE 6C 0A 00         [ 2] 1127 	jp syntax_error
      001AAD                       1128 3$:
      0096E1 6F 76            [ 1] 1129 	ld a,(OP,sp)
      0096E3 65 72            [ 1] 1130 	cp a,#TK_PLUS 
      0096E5 66 6C            [ 1] 1131 	jrne 4$
                                   1132 ; '+' operator	
      0096E7 6F 77 0A         [ 4] 1133 	call add24
      0096EA 00 0A            [ 2] 1134 	jra 1$ 
      001AB8                       1135 4$:	; '-' operator 
      0096EC 72 75 6E         [ 4] 1136 	call sub24
      0096EF 20 74            [ 2] 1137 	jra 1$
      001ABD                       1138 9$:
      001ABD                       1139 	_drop VSIZE 
      0096F1 69 6D            [ 2]    1     addw sp,#VSIZE 
      0096F3 65               [ 4] 1140 	ret 
                                   1141 
                                   1142 ;---------------------------------------------
                                   1143 ; rel ::= expr rel_op expr
                                   1144 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   1145 ;  relation return  integer , zero is false 
                                   1146 ;  output:
                                   1147 ;	 xstack		value  
                                   1148 ;---------------------------------------------
                           000001  1149 	RELOP=1
                           000001  1150 	VSIZE=1 
      001AC0                       1151 relation: 
      001AC0                       1152 	_vars VSIZE
      0096F4 20 65            [ 2]    1     sub sp,#VSIZE 
      0096F6 72 72 6F         [ 4] 1153 	call expression
      0096F9 72               [ 1] 1154 	tnz a 
      0096FA 2C 20            [ 1] 1155 	jreq 9$ 
                                   1156 ; expect rel_op or leave 
      0096FC 00 0A 63         [ 4] 1157 	call next_token 
      0096FF 6F 6D            [ 1] 1158 	ld (RELOP,sp),a 
      009701 70 69            [ 1] 1159 	and a,#TK_GRP_MASK
      009703 6C 65            [ 1] 1160 	cp a,#TK_GRP_RELOP 
      009705 20 65            [ 1] 1161 	jreq 2$
      009707 72 72            [ 1] 1162 	ld a,#TK_INTGR 
      001AD5                       1163 	_unget_token 
      009709 6F 72 2C 20 00   [ 1]    1      mov in,in.saved  
      00970E 6C 61            [ 2] 1164 	jra 9$ 
      001ADC                       1165 2$:	; expect another expression
      009710 73 74 20         [ 4] 1166 	call expression
      009713 74               [ 1] 1167 	tnz a 
      009714 6F 6B            [ 1] 1168 	jrne 3$
      009716 65 6E 20         [ 2] 1169 	jp syntax_error 
      001AE5                       1170 3$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      009719 69 64 3A         [ 4] 1171 	call cp24 
      001AE8                       1172 	_xpop  
      00971C 20 00            [ 1]    1     ld a,(y)
      00971E 93               [ 1]    2     ldw x,y 
      00971E A6 02            [ 2]    3     ldw x,(1,x)
      009720 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009720 72               [ 1] 1173 	tnz a 
      009721 0A 00            [ 1] 1174 	jrmi 4$
      009723 23 4C            [ 1] 1175 	jrne 5$
      009725 88 AE 96 EB      [ 1] 1176 	mov acc8,#2 ; i1==i2
      009729 CD 8A            [ 2] 1177 	jra 6$ 
      001AFC                       1178 4$: ; i1<i2
      00972B 1D 84 AE 95      [ 1] 1179 	mov acc8,#4 
      00972F 91 72            [ 2] 1180 	jra 6$
      001B02                       1181 5$: ; i1>i2
      009731 5F 00 0E 48      [ 1] 1182 	mov acc8,#1  
      001B06                       1183 6$: ; 0=false, -1=true 
      009735 72               [ 1] 1184 	clrw x 
      009736 59 00 0E         [ 1] 1185 	ld a, acc8  
      009739 C7 00            [ 1] 1186 	and a,(RELOP,sp)
      00973B 0F 72            [ 1] 1187 	jreq 7$
      00973D BB               [ 2] 1188 	cplw x 
      00973E 00 0E            [ 1] 1189 	ld a,#255 
      001B11                       1190 7$:	_xpush 
      009740 FE CD 8A 1D      [ 2]    1     subw y,#CELL_SIZE
      009744 CE 00            [ 1]    2     ld (y),a 
      009746 05 C6 00         [ 2]    3     ldw (1,y),x 
      009749 04 90            [ 1] 1191 	ld a,#TK_INTGR
      001B1C                       1192 9$: 
      001B1C                       1193 	_drop VSIZE
      00974B 5F 90            [ 2]    1     addw sp,#VSIZE 
      00974D 02               [ 4] 1194 	ret 
                                   1195 
                                   1196 ;-------------------------------------------
                                   1197 ;  AND factor:  [NOT] relation | (condition)
                                   1198 ;  output:
                                   1199 ;     A      TK_INTGR|0
                                   1200 ;-------------------------------------------
                           000001  1201 	NOT_OP=1
      001B1F                       1202 and_factor:
      00974E CD 87            [ 1] 1203 	push #0 
      009750 1C CE 00         [ 4] 1204 0$:	call next_token  
      009753 05               [ 1] 1205 	tnz a 
      009754 C6 00            [ 1] 1206 	jreq 8$ 
      009756 02 CD            [ 1] 1207 	cp a,#TK_NOT 
      009758 A0 4B            [ 1] 1208 	jrne 1$ 
      00975A AE 97            [ 1] 1209 	cpl (NOT_OP,sp)
      00975C 0E CD            [ 2] 1210 	jra 0$ 
      001B2F                       1211 1$:	
      00975E 8A 1D            [ 1] 1212 	cp a,#TK_LPAREN 
      009760 C6 00            [ 1] 1213 	jrne 2$
      009762 03 5F 97         [ 4] 1214 	call condition
      009765 72 BB            [ 1] 1215 	ld a,#TK_RPAREN 
      009767 00 05 F6         [ 4] 1216 	call expect
      00976A 5F 97            [ 2] 1217 	jra 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      001B3D                       1218 2$: _unget_token 
      00976C CD 98 74 20 35   [ 1]    1      mov in,in.saved  
      009771 CD 1A C0         [ 4] 1219 	call relation
      001B45                       1220 3$:
      009771 88 AE            [ 1] 1221 	tnz (NOT_OP,sp)
      009773 96 FD            [ 1] 1222 	jreq 8$ 
      009775 CD 8A 1D         [ 4] 1223 	call cpl24
      001B4C                       1224 8$:
      001B4C                       1225 	_drop 1  
      009778 84 AE            [ 2]    1     addw sp,#1 
      00977A 95               [ 4] 1226     ret 
                                   1227 
                                   1228 
                                   1229 ;--------------------------------------------
                                   1230 ;  AND operator as priority over OR||XOR 
                                   1231 ;  format: relation | (condition) [AND relation|(condition)]*
                                   1232 ;          
                                   1233 ;  output:
                                   1234 ;     A     TK_INTGR|0
                                   1235 ;    xtack   value 
                                   1236 ;--------------------------------------------
      001B4F                       1237 and_cond:
      00977B 91 72 5F         [ 4] 1238 	call and_factor
      00977E 00               [ 1] 1239 	tnz a 
      00977F 0E 48            [ 1] 1240 	jreq 9$  
      009781 72 59 00         [ 4] 1241 1$: call next_token 
      009784 0E               [ 1] 1242 	tnz a 
      009785 C7 00            [ 1] 1243 	jreq 6$ 
      009787 0F 72            [ 1] 1244 	cp a,#TK_AND 
      009789 BB 00            [ 1] 1245 	jreq 3$
      001B5F                       1246 	_unget_token 
      00978B 0E FE CD 8A 1D   [ 1]    1      mov in,in.saved  
      009790 AE 16            [ 2] 1247 	jra 6$ 
      009792 68 CD 8A         [ 4] 1248 3$:	call and_factor  
      009795 1D               [ 1] 1249 	tnz a 
      009796 A6 0D            [ 1] 1250 	jrne 4$
      009798 CD 89 C0         [ 2] 1251 	jp syntax_error 
      001B6F                       1252 4$:	
      001B6F                       1253 	_xpop 
      00979B CE 00            [ 1]    1     ld a,(y)
      00979D 01               [ 1]    2     ldw x,y 
      00979E CD 8A            [ 2]    3     ldw x,(1,x)
      0097A0 8A A6 5E CD      [ 2]    4     addw y,#CELL_SIZE 
      0097A4 89 C0 AE         [ 1] 1254 	ld acc24,a 
      0097A7 17 FF 94         [ 2] 1255 	ldw acc16,x
      0097AA                       1256 	_xpop 
      0097AA CD 95            [ 1]    1     ld a,(y)
      0097AC 58               [ 1]    2     ldw x,y 
      0097AD EE 01            [ 2]    3     ldw x,(1,x)
      0097AD A6 0D CD 89      [ 2]    4     addw y,#CELL_SIZE 
      0097B1 C0 A6 3E         [ 1] 1257 	and a,acc24 
      0097B4 CD               [ 1] 1258 	rlwa x 
      0097B5 89 C0 CD         [ 1] 1259 	and a,acc16 
      0097B8 8B               [ 1] 1260 	rlwa x 
      0097B9 22 72 5D         [ 1] 1261 	and a,acc8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      0097BC 00               [ 1] 1262 	rlwa x
      001B93                       1263 	_xpush
      0097BD 04 27 ED CD      [ 2]    1     subw y,#CELL_SIZE
      0097C1 91 4B            [ 1]    2     ld (y),a 
      0097C3 72 5D 00         [ 2]    3     ldw (1,y),x 
      0097C6 04 27            [ 2] 1264 	jra 1$  
      0097C8 E4 84            [ 1] 1265 6$: ld a,#TK_INTGR 
      0097C9 81               [ 4] 1266 9$:	ret 	 
                                   1267 
                                   1268 
                                   1269 ;--------------------------------------------
                                   1270 ; condition for IF and UNTIL 
                                   1271 ; operators: OR,XOR 
                                   1272 ; format:  and_cond [ OP and_cond ]* 
                                   1273 ; output:
                                   1274 ;    A        INTGR|0 
                                   1275 ;    xstack   value 
                                   1276 ;--------------------------------------------
                           000001  1277 	ATMP=1
                           000002  1278 	OP=2
                           000002  1279 	VSIZE=2 
      001BA1                       1280 condition:
      001BA1                       1281 	_vars VSIZE 
      0097C9 C6 00            [ 2]    1     sub sp,#VSIZE 
      0097CB 02 C1 00         [ 4] 1282 	call and_cond
      0097CE 04               [ 1] 1283 	tnz a 
      0097CF 2B 1D            [ 1] 1284 	jreq 9$ 
      0097D1 CD 17 9F         [ 4] 1285 1$:	call next_token 
      0097D1 72 01            [ 1] 1286 	cp a,#TK_OR 
      0097D3 00 23            [ 1] 1287 	jreq 2$
      0097D5 D7 CE            [ 1] 1288 	cp a,#TK_XOR
      0097D7 00 05            [ 1] 1289 	jreq 2$ 
      001BB4                       1290 	_unget_token 
      0097D9 72 BB 00 01 C3   [ 1]    1      mov in,in.saved  
      0097DE 00 1E            [ 2] 1291 	jra 8$ 
      0097E0 2A C8            [ 1] 1292 2$:	ld (OP,sp),a ; TK_OR|TK_XOR 
      0097E2 CF 00 05         [ 4] 1293 	call and_cond
      0097E5 E6 02            [ 1] 1294 	cp a,#TK_INTGR 
      0097E7 C7 00            [ 1] 1295 	jreq 3$
      0097E9 04 35 03         [ 2] 1296 	jp syntax_error 
      001BC7                       1297 3$:	 
      001BC7                       1298 	_xpop  ; rigth arg 
      0097EC 00 02            [ 1]    1     ld a,(y)
      0097EE 93               [ 1]    2     ldw x,y 
      0097EE CD 98            [ 2]    3     ldw x,(1,x)
      0097F0 1F A1 00 27      [ 2]    4     addw y,#CELL_SIZE 
      0097F4 DC A1 80         [ 1] 1299 	ld acc24,a 
      0097F7 26 06 CD         [ 2] 1300 	ldw acc16,x 
      001BD6                       1301 	_xpop  ; left arg  
      0097FA 98 38            [ 1]    1     ld a,(y)
      0097FC FD               [ 1]    2     ldw x,y 
      0097FD 20 EF            [ 2]    3     ldw x,(1,x)
      0097FF 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0097FF A1 85            [ 1] 1302 	ld (ATMP,sp),a 
      009801 26 05            [ 1] 1303 	ld a,(OP,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      009803 CD 9D            [ 1] 1304 	cp a,#TK_XOR 
      009805 06 20            [ 1] 1305 	jreq 5$ 
      001BE7                       1306 4$: ; A:X OR acc24   
      009807 E6 01            [ 1] 1307 	ld a,(ATMP,sp)
      009808 CA 00 0C         [ 1] 1308 	or a,acc24 
      009808 A1               [ 1] 1309 	rlwa x 
      009809 05 26 05         [ 1] 1310 	or a,acc16 
      00980C CD               [ 1] 1311 	rlwa x 
      00980D 9D 01 20         [ 1] 1312 	or a,acc8 
      009810 DD               [ 1] 1313 	rlwa x 
      009811 20 0E            [ 2] 1314 	jra 6$  
      001BF7                       1315 5$: ; A:X XOR acc24 
      009811 A1 0A            [ 1] 1316 	ld a,(ATMP,sp)
      009813 27 D9 A1         [ 1] 1317 	xor a,acc24 
      009816 03               [ 1] 1318 	rlwa x 
      009817 CD 98 45         [ 1] 1319 	xor a,acc16 
      00981A 20               [ 1] 1320 	rlwa x 
      00981B D2 CC 97         [ 1] 1321 	xor a,acc8 
      00981E 1E               [ 1] 1322 	rlwa x 
      00981F                       1323 6$: _xpush
      00981F C6 00 02 C7      [ 2]    1     subw y,#CELL_SIZE
      009823 00 03            [ 1]    2     ld (y),a 
      009825 C0 00 04         [ 2]    3     ldw (1,y),x 
      009828 27 0D            [ 2] 1324 	jra 1$ 
      00982A A6 84            [ 1] 1325 8$:	ld a,#TK_INTGR 
      001C12                       1326 9$:	_drop VSIZE 
      00982A CE 00            [ 2]    1     addw sp,#VSIZE 
      00982C 05               [ 4] 1327 	ret 
                                   1328 
                                   1329 
                                   1330 ;--------------------------------------------
                                   1331 ; BASIC: HEX 
                                   1332 ; select hexadecimal base for integer print
                                   1333 ;---------------------------------------------
      001C15                       1334 hex_base:
      00982D 72 BB 00 01      [ 1] 1335 	mov base,#16 
      009831 F6               [ 4] 1336 	ret 
                                   1337 
                                   1338 ;--------------------------------------------
                                   1339 ; BASIC: DEC 
                                   1340 ; select decimal base for integer print
                                   1341 ;---------------------------------------------
      001C1A                       1342 dec_base:
      009832 5C 72 5C 00      [ 1] 1343 	mov base,#10
      009836 02               [ 4] 1344 	ret 
                                   1345 
                                   1346 ;------------------------
                                   1347 ; BASIC: FREE 
                                   1348 ; return free size in RAM 
                                   1349 ; output:
                                   1350 ;   A:x		size 
                                   1351 ;--------------------------
      001C1F                       1352 free:
      009837 81 89            [ 2] 1353 	pushw y 
      009838 4F               [ 1] 1354 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      009838 FE DE B3         [ 2] 1355 	ldw x,#tib 
      00983B 75 72 5C 00      [ 2] 1356 	ldw y,txtend 
      00983F 02 72 5C 00      [ 2] 1357 	cpw y,#app_space
      009843 02 81            [ 1] 1358 	jrult 1$
      009845 1D 00 80         [ 2] 1359 	subw x,#free_ram 
      009845 F6 27            [ 2] 1360 	jra 2$ 
      001C34                       1361 1$:	
      009847 03 5C 20 FA      [ 2] 1362 	subw x,txtend
      00984B 5C 72            [ 2] 1363 2$:	popw y 
      00984D B0               [ 4] 1364 	ret 
                                   1365 
                                   1366 ;------------------------------
                                   1367 ; BASIC: SIZE 
                                   1368 ; command that print 
                                   1369 ; program start addres and size 
                                   1370 ;------------------------------
      001C3B                       1371 cmd_size:
      00984E 00 05 CF         [ 1] 1372 	push base 
      009851 00 01 81         [ 2] 1373 	ldw x,#PROG_ADDR 
      009854 CD 09 9D         [ 4] 1374 	call puts 
      009854 FE 72 5C         [ 2] 1375 	ldw x,txtbgn     
      009857 00 02 72 5C      [ 1] 1376 	mov base,#16 
      00985B 00 02 81         [ 4] 1377 	call prt_i16
      00985E 32 00 0A         [ 1] 1378 	pop base 
      00985E F6 EE 01         [ 2] 1379 	ldw x,#PROG_SIZE 
      009861 72 5C 00         [ 4] 1380 	call puts 
      009864 02 72 5C         [ 2] 1381 	ldw x,txtend 
      009867 00 02 72 5C      [ 2] 1382 	subw x,txtbgn 
      00986B 00 02 81         [ 4] 1383 	call prt_i16
      00986E AE 1E BB         [ 2] 1384 	ldw x,#STR_BYTES 
      00986E F6 72 5C         [ 4] 1385 	call puts  
      009871 00               [ 4] 1386 	ret 
                                   1387 
                                   1388 
                                   1389 ;------------------------
                                   1390 ; BASIC: UBOUND  
                                   1391 ; return array variable size 
                                   1392 ; and set 'array_size' variable 
                                   1393 ; output:
                                   1394 ;   A:X 	array_size
                                   1395 ;--------------------------
      001C68                       1396 ubound:
      009872 02 81 1F         [ 4] 1397 	call free 
      009874 A6 03            [ 1] 1398 	ld a,#CELL_SIZE 
      009874 72               [ 2] 1399 	div x,a 
      009875 5F 00 0D         [ 2] 1400 	ldw array_size,x
      009878 CF               [ 1] 1401 	clr a 
      009879 00               [ 4] 1402 	ret 
                                   1403 
                                   1404 ;-----------------------------
                                   1405 ; BASIC: LET var=expr 
                                   1406 ; variable assignement 
                                   1407 ; output:
                                   1408 ;   A 		TK_NONE 
                                   1409 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      001C73                       1410 let::
      00987A 0E A6 10         [ 4] 1411 	call next_token 
      00987D C1 00            [ 1] 1412 	cp a,#TK_VAR 
      00987F 0B 27            [ 1] 1413 	jreq let_var
      009881 09 72            [ 1] 1414 	cp a,#TK_ARRAY 
      009883 0F 00            [ 1] 1415 	jreq  let_array
      009885 0E 04 72         [ 2] 1416 	jp syntax_error
      001C81                       1417 let_array:
      009888 53 00 0D         [ 4] 1418 	call get_array_element
      00988B 20 03            [ 2] 1419 	jra let_eval 
      001C86                       1420 let_var:
      00988B A6 FF CD         [ 4] 1421 	call get_addr
      001C89                       1422 let_eval:
      00988E 98 B1 CD         [ 2] 1423 	ldw ptr16,x  ; variable address 
      009891 91 F5 88         [ 4] 1424 	call next_token 
      009894 CD 8A            [ 1] 1425 	cp a,#TK_EQUAL
      009896 1D 84            [ 1] 1426 	jreq 1$
      009898 81 16 9E         [ 2] 1427 	jp syntax_error
      009899                       1428 1$:	
      009899 90 F6 93         [ 4] 1429 	call condition   
      00989C EE 01            [ 1] 1430 	cp a,#TK_INTGR 
      00989E 72 A9            [ 1] 1431 	jreq 2$
      0098A0 00 03 C7         [ 2] 1432 	jp syntax_error
      001CA0                       1433 2$:	
      001CA0                       1434 	_xpop ; value 
      0098A3 00 0D            [ 1]    1     ld a,(y)
      0098A5 CF               [ 1]    2     ldw x,y 
      0098A6 00 0E            [ 2]    3     ldw x,(1,x)
      0098A8 CD 98 8B A6      [ 2]    4     addw y,#CELL_SIZE 
      001CA9                       1435 3$:
      0098AC 20 CD 89 C0      [ 4] 1436 	ld [ptr16],a
      0098B0 81 5C 00 1A      [ 1] 1437 	inc ptr8  
      0098B1 72 CF 00 19      [ 5] 1438 	ldw [ptr16],x 
      0098B1 52               [ 4] 1439 	ret 
                                   1440 
                                   1441 
                                   1442 ;--------------------------
                                   1443 ; return constant value 
                                   1444 ; from it's record address
                                   1445 ; input:
                                   1446 ;	X	*const record 
                                   1447 ; output:
                                   1448 ;   A:X   const  value
                                   1449 ;--------------------------
      001CB6                       1450 get_const_value: ; -- i 
      0098B2 04               [ 1] 1451 	ld a,(x) ; record size 
      0098B3 0F 02            [ 1] 1452 	sub a,#3 ; * value 
      0098B5 0F               [ 1] 1453 	push a 
      0098B6 01 4D            [ 1] 1454 	push #0 
      0098B8 27 11 C6         [ 2] 1455 	addw x,(1,sp)
      0098BB 00               [ 1] 1456 	ld a,(x)
      0098BC 0B A1            [ 2] 1457 	ldw x,(1,x)
      001CC2                       1458 	_drop 2
      0098BE 0A 26            [ 2]    1     addw sp,#2 
      0098C0 0A               [ 4] 1459 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



                                   1460 
                                   1461 
                                   1462 ;--------------------------
                                   1463 ; list constants in EEPROM 
                                   1464 ; call when using LIST \C 
                                   1465 ;-------------------------
                           000001  1466 	COUNT=1
                           000003  1467 	YTEMP=3
                           000004  1468 	VSIZE=4 
      001CC5                       1469 list_const:
      0098C1 72 0F            [ 2] 1470 	pushw y 
      001CC7                       1471 	_vars 4 
      0098C3 00 0D            [ 2]    1     sub sp,#4 
      0098C5 05               [ 1] 1472 	clrw x 
      0098C6 03 01            [ 2] 1473 	ldw (COUNT,sp),x  
      0098C8 CD 82 89 00      [ 2] 1474 	ldw Y,#EEPROM_BASE 
      0098CB 90 C3 00 24      [ 2] 1475 1$:	cpw y,free_eeprom 
      0098CB AE 16            [ 1] 1476 	jruge 9$
      0098CD 68 1C            [ 2] 1477     ldw (YTEMP,sp),y 
      0098CF 00               [ 1] 1478 	ldw x,y
      0098D0 50               [ 1] 1479 	incw x 
      0098D1 5A 7F 9D         [ 4] 1480 	call puts  
      0098D3 A6 3D            [ 1] 1481 	ld a,#'= 
      0098D3 C6 00 0B         [ 4] 1482 	call putc 
      0098D6 CD 83            [ 2] 1483 	ldw x,(YTEMP,sp)
      0098D8 85 AB 30         [ 4] 1484 	call get_const_value 
      0098DB A1 3A 2B         [ 1] 1485 	ld acc24,a 
      0098DE 02 AB 07         [ 2] 1486 	ldw acc16,x 
      0098E1 CD 18 0B         [ 4] 1487 	call prt_acc24
      0098E1 5A F7            [ 1] 1488 	ld a,#CR 
      0098E3 0C 02 C6         [ 4] 1489 	call putc 
      0098E6 00 0D            [ 2] 1490 	ldw x,(COUNT,sp)
      0098E8 CA               [ 1] 1491 	incw x 
      0098E9 00 0E            [ 2] 1492 	ldw (COUNT,sp),x 
      0098EB CA 00 0F 26      [ 1] 1493 	clr acc16 
      0098EF E3 C6            [ 2] 1494 	ldw y,(YTEMP,sp)
      0098F1 00 0B            [ 1] 1495 	ld a,(y)
      0098F3 A1 10 27         [ 1] 1496 	ld acc8,a
      0098F6 08 7B 01 27      [ 2] 1497 	addw y,acc16 
      0098FA 0A A6            [ 2] 1498 	jra 1$ 
      001D0B                       1499 9$:	
      0098FC 2D 20            [ 2] 1500 	ldw x,(COUNT,sp)
      0098FE 02 17 F4         [ 4] 1501 	call prt_i16 
      0098FF AE 1D 1B         [ 2] 1502 	ldw x,#CONST_COUNT 
      0098FF A6 24 5A         [ 4] 1503 	call puts 
      001D16                       1504 	_drop VSIZE 
      009902 F7 0C            [ 2]    1     addw sp,#VSIZE 
      009904 02 85            [ 2] 1505 	popw y 
      009905 81               [ 4] 1506 	ret 
                                   1507 
      009905 7B 02 5B 04 81 74 61  1508 CONST_COUNT: .asciz " constants in EEPROM\n"
             6E 74 73 20 69 6E 20
             45 45 50 52 4F 4D 0A
             00
                                   1509 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



                                   1510 
                                   1511 ;--------------------------
                                   1512 ; BASIC: EEFREE 
                                   1513 ; eeprom_free 
                                   1514 ; search end of data  
                                   1515 ; in EEPROM 
                                   1516 ; input:
                                   1517 ;    none 
                                   1518 ; output:
                                   1519 ;    A:X     address free
                                   1520 ;-------------------------
      00990A                       1521 func_eefree:
      00990A A1 61 2A         [ 2] 1522 	ldw x,#EEPROM_BASE 
      00990D 01 81 A1 7A      [ 1] 1523 1$:	mov acc8,#8 ; count 8 consecutive zeros
      009911 22 FB A0         [ 2] 1524     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      009914 20 81            [ 1] 1525 	jruge 8$ ; no free space 
      009916 F6               [ 1] 1526 2$: ld a,(x)
      009916 89 52            [ 1] 1527 	jrne 3$
      009918 03               [ 1] 1528 	incw x 
      009919 72 5F 00 0D      [ 1] 1529 	dec acc8 
      00991D 72 5F            [ 1] 1530 	jrne 2$
      00991F 00 0E 72         [ 2] 1531 	subw x,#8 
      009922 5F 00            [ 2] 1532 	jra 9$  
      009924 0F               [ 1] 1533 3$: ld a,(x)
      009925 0F               [ 1] 1534 	incw x
      009926 01               [ 1] 1535 	tnz a  
      009927 A6 0A            [ 1] 1536 	jrne 3$
      009929 6B               [ 2] 1537 	decw x   
      00992A 02 F6            [ 2] 1538 	jra 1$ 
      00992C 27               [ 1] 1539 8$: clrw x ; no free space 
      00992D 47               [ 1] 1540 9$: clr a 
      00992E A1 2D 26         [ 2] 1541 	ldw free_eeprom,x ; save in system variable 
      009931 04               [ 4] 1542 	ret 
                                   1543 
                           000005  1544 CONST_REC_XTRA_BYTES=5 
                                   1545 ;--------------------------
                                   1546 ; search constant name 
                                   1547 ; format of constant record  
                                   1548 ;   .byte record length 
                                   1549 ;         = strlen(name)+5 
                                   1550 ;   .asciz name (variable length)
                                   1551 ;   .int24 value (3 bytes )
                                   1552 ; a constant record use 7+ bytes
                                   1553 ; constants are saved in EEPROM  
                                   1554 ; input:
                                   1555 ;    X     *name
                                   1556 ; output:
                                   1557 ;    X     address|0
                                   1558 ; use:
                                   1559 ;   A,Y, acc16 
                                   1560 ;-------------------------
                           000001  1561 	NAMEPTR=1 ; target name pointer 
                           000003  1562 	EEPTR=3   ; walking pointer in EEPROM
                           000005  1563 	RECLEN=5  ; record length of target
                           000005  1564 	VSIZE=5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      001D5A                       1565 search_const:
      009932 03 01            [ 2] 1566 	pushw y 
      001D5C                       1567 	_vars VSIZE
      009934 20 08            [ 2]    1     sub sp,#VSIZE 
      009936 A1 24 26 06      [ 1] 1568 	clr acc16 
      00993A A6 10 6B         [ 4] 1569 	call strlen 
      00993D 02 5C            [ 1] 1570 	add a,#CONST_REC_XTRA_BYTES
      00993F F6 05            [ 1] 1571 	ld (RECLEN,sp),a    
      009940 1F 01            [ 2] 1572 	ldw (NAMEPTR,sp),x
      009940 A1 61 2B 02      [ 2] 1573 	ldw y,#EEPROM_BASE 
      009944 A0 20            [ 2] 1574 1$:	ldw x,(NAMEPTR,sp)
      009946 A1 30            [ 2] 1575 	ldw (EEPTR,sp),y
      009948 2B 2B A0 30      [ 2] 1576 	cpw y, free_eeprom 
      00994C A1 0A            [ 1] 1577 	jruge 7$ ; no match found 
      00994E 2B 06            [ 1] 1578 	ld a,(y)
      009950 A0 07            [ 1] 1579 	cp a,(RECLEN,sp)
      009952 11 02            [ 1] 1580 	jrne 2$ 
      009954 2A 1F            [ 1] 1581 	incw y 
      009956 6B 03 7B         [ 4] 1582 	call strcmp
      009959 02 CD            [ 1] 1583 	jrne 8$ ; match found 
      001D86                       1584 2$: ; skip this one 	
      00995B 82 A6            [ 2] 1585 	ldW Y,(EEPTR,sp)
      00995D 7B 03            [ 1] 1586 	ld a,(y)
      00995F CB 00 0F         [ 1] 1587 	ld acc8,a 
      009962 C7 00 0F 4F      [ 2] 1588 	addw y,acc16 
      009966 C9 00            [ 2] 1589 	jra 1$  
      001D93                       1590 7$: ; no match found 
      009968 0E C7            [ 1] 1591 	clr (EEPTR,sp)
      00996A 00 0E            [ 1] 1592 	clr (EEPTR+1,sp)
      001D97                       1593 8$: ; match found 
      00996C 4F C9            [ 2] 1594 	ldw x,(EEPTR,sp) ; record address 
      001D99                       1595 9$:	_DROP VSIZE
      00996E 00 0D            [ 2]    1     addw sp,#VSIZE 
      009970 C7 00            [ 2] 1596 	 popw y 
      009972 0D               [ 4] 1597 	 ret 
                                   1598 
                                   1599 
                                   1600 ;--------------------------------------------
                                   1601 ; BASIC: CONST name=value [, name=value]*
                                   1602 ; define constant(s) saved in EEPROM
                                   1603 ;--------------------------------------------
                           000001  1604 	CNAME=1 
                           000003  1605 	BUFPTR=3
                           000005  1606 	RECLEN=5
                           000006  1607 	UPDATE=6
                           000007  1608 	YSAVE=7
                           000008  1609 	VSIZE=8 
      001D9E                       1610 cmd_const:
      009973 20 C9            [ 2] 1611 	pushw y 
      001DA0                       1612 	_vars VSIZE 
      009975 0D 01            [ 2]    1     sub sp,#VSIZE 
      009977 27 03            [ 1] 1613 	clr (UPDATE,sp)
      009979 CD 82 89         [ 4] 1614 	call next_token 
      00997C A1 04            [ 1] 1615 	cp a,#TK_CHAR 
      00997C 5B 03            [ 1] 1616 	jrne 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      00997E 85 81 EE         [ 4] 1617 	call get_char 
      009980 A4 DF            [ 1] 1618 	and a,#0xDF 
      009980 52 05            [ 1] 1619 	cp a,#'U 
      009982 17 04            [ 1] 1620 	jrne 1$
      009984 03 06            [ 1] 1621 	cpl (UPDATE,sp)
      009984 1F 02            [ 2] 1622 	jra const_loop 
      009986 F6 A4            [ 1] 1623 0$: cp a,#TK_LABEL 
      009988 0F 6B            [ 1] 1624 	jreq cloop_1
      00998A 01 16 04         [ 2] 1625 1$: jp syntax_error
      001DBF                       1626 const_loop: 
      00998D 5C 03            [ 1] 1627 	ld a,#TK_LABEL 
      00998E CD 19 4B         [ 4] 1628 	call expect  
      001DC4                       1629 cloop_1: 
      00998E 90 F6            [ 2] 1630 	ldw (CNAME,sp),x ; *const_name
      009990 27 1B 0D         [ 4] 1631 	call skip_string
      009993 01 27            [ 2] 1632 	ldw x,(CNAME,sp)
      009995 0A F1 26         [ 4] 1633 	call strlen  
      009998 07 90            [ 1] 1634 	add a,#CONST_REC_XTRA_BYTES 
      00999A 5C 5C            [ 1] 1635 	ld (RECLEN,sp),a 
                                   1636 ; copy name in buffer  
      00999C 0A 01            [ 2] 1637 	ldw y,(CNAME,sp) 
      00999E 20 EE 68         [ 2] 1638 	ldw x,#tib  
      0099A0 7B 05            [ 1] 1639 	ld a,(RECLEN,sp)
      0099A0 1E               [ 1] 1640 	ld (x),a 
      0099A1 02               [ 1] 1641 	incw x  
      0099A2 1D 00 02         [ 4] 1642 	call strcpy 
      0099A5 4B 00            [ 2] 1643 	ldw (BUFPTR,sp),x 
                                   1644 ; x not updated by strcpy 
                                   1645 ; BUFPTR must be incremented 
                                   1646 ; to point after name 
      0099A7 FE               [ 1] 1647 	clrw x 
      0099A8 84 27            [ 1] 1648 	ld a,(RECLEN,sp)
      0099AA 1D 20            [ 1] 1649 	sub a,#CONST_REC_XTRA_BYTES-1
      0099AC D7               [ 1] 1650 	ld xl,a  
      0099AD 72 FB 03         [ 2] 1651 	addw x,(BUFPTR,sp)
      0099AD 1E 02            [ 2] 1652 	ldw (BUFPTR,sp),x 
      0099AF F6 6B            [ 1] 1653 	ld a,#TK_EQUAL 
      0099B1 01 A4 0F         [ 4] 1654 	call expect 
      0099B4 4C C7            [ 2] 1655 	ldw y,(YSAVE,sp) ; restore xstack pointer 
      0099B6 00 0F 72         [ 4] 1656 	call expression 
      0099B9 5F 00            [ 1] 1657 	cp a,#TK_INTGR 
      0099BB 0E 72            [ 1] 1658 	jreq 5$ 
      0099BD BB 00 0E         [ 2] 1659 	jp syntax_error 
      001DFC                       1660 5$:	_xpop 
      0099C0 FE 7B            [ 1]    1     ld a,(y)
      0099C2 01               [ 1]    2     ldw x,y 
      0099C3 A4 F0            [ 2]    3     ldw x,(1,x)
      0099C5 4E AB 80 03      [ 2]    4     addw y,#CELL_SIZE 
      0099C8 17 07            [ 2] 1661 	ldw (YSAVE,sp),y ; save xtack pointer 
      0099C8 5B 05            [ 2] 1662 	ldw y,(BUFPTR,sp)
      0099CA 81 F7            [ 1] 1663 	ld (y),a 
      0099CB 90 EF 01         [ 2] 1664 	ldw (1,y),x 
                                   1665 ; record completed in buffer 
                                   1666 ; check if constant already exist 
                                   1667 ; if exist and \U option then update  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      0099CB 88 CD 98 1F      [ 1] 1668 	clr farptr 
      0099CF 11 01            [ 2] 1669 	ldw x,(CNAME,sp)
      0099D1 27 03 CC         [ 4] 1670 	call search_const 
      0099D4 97               [ 2] 1671 	tnzw x 
      0099D5 1E 84            [ 1] 1672 	jreq 6$ ; new constant  
      0099D7 81 06            [ 1] 1673 	tnz (UPDATE,sp)
      0099D8 27 1F            [ 1] 1674 	jreq 8$ 
      0099D8 A6 06            [ 2] 1675 	jra 7$	
      001E20                       1676 6$:	
      0099DA CD 99 CB         [ 2] 1677 	ldw x,free_eeprom  
      0099DD                       1678 7$:	
      0099DD 4B 00 CD         [ 2] 1679 	ldw farptr+1,x 
      0099E0 9C 21 4D         [ 2] 1680 	ldw x,#tib 
      0099E3 27 12            [ 1] 1681 	ld a,(RECLEN,sp)
      0099E5 0C 01 CD         [ 4] 1682 	call write_nbytes
      0099E8 98 1F            [ 1] 1683 	tnz (UPDATE,sp)
      0099EA A1 08            [ 1] 1684 	jrne 8$ ; not a new constant, don't update free_eeprom
                                   1685 ; update free_eeprom 
      0099EC 27               [ 1] 1686 	clrw x 
      0099ED F1 A1            [ 1] 1687 	ld a,(RECLEN,sp)
      0099EF 07               [ 1] 1688 	ld xl,a 
      0099F0 27 05 55 00      [ 2] 1689 	addw x,free_eeprom 
      0099F4 03 00 02         [ 2] 1690 	ldw free_eeprom,x
      001E3D                       1691 8$: ; check for next constant 
      0099F7 84 81 9F         [ 4] 1692 	call next_token 
      0099F9 A1 08            [ 1] 1693 	cp a,#TK_COMMA 
      0099F9 CD 99            [ 1] 1694 	jrne 9$ ; no other constant 
      0099FB D8 A1 01         [ 2] 1695 	jp const_loop 
      001E47                       1696 9$: 
      001E47                       1697 	_unget_token    
      0099FE 27 03 CC 97 1E   [ 1]    1      mov in,in.saved  
      001E4C                       1698 10$: 
      001E4C                       1699 	_drop VSIZE 
      009A03 90 F6            [ 2]    1     addw sp,#VSIZE 
      009A05 93 EE            [ 2] 1700 	popw y ; restore xstack pointer 
      009A07 01               [ 4] 1701 	ret 
                                   1702 
                                   1703 
                                   1704 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1705 ; return program size 
                                   1706 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001E51                       1707 prog_size:
      009A08 72 A9 00         [ 2] 1708 	ldw x,txtend 
      009A0B 03 C3 00 21      [ 2] 1709 	subw x,txtbgn 
      009A0F 23               [ 4] 1710 	ret 
                                   1711 
                                   1712 ;----------------------------
                                   1713 ; print program information 
                                   1714 ;---------------------------
      001E59                       1715 program_info: 
      009A10 05 A6 0A         [ 2] 1716 	ldw x,#PROG_ADDR 
      009A13 CC 97 20         [ 4] 1717 	call puts 
      009A16 5D 27 F8         [ 2] 1718 	ldw x,txtbgn 
      009A19 89 58 72 FB      [ 1] 1719 	mov base,#16 
      009A1D 01 1F 01         [ 4] 1720 	call prt_i16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      009A20 AE 16 68 72      [ 1] 1721 	mov base,#10  
      009A24 F0 01 5B         [ 2] 1722 	ldw x,#PROG_SIZE
      009A27 02 81 9D         [ 4] 1723 	call puts 
      009A29 CD 1E 51         [ 4] 1724 	call prog_size 
      009A29 52 01 0F         [ 4] 1725 	call prt_i16 
      009A2C 01 CD 98         [ 2] 1726 	ldw x,#STR_BYTES 
      009A2F 1F 4D 26         [ 4] 1727 	call puts
      009A32 03 CC 9A         [ 2] 1728 	ldw x,txtbgn
      009A35 C2 A1 10         [ 2] 1729 	cpw x,#app 
      009A38 27 06            [ 1] 1730 	jrult 2$
      009A3A A1 11 26         [ 2] 1731 	ldw x,#FLASH_MEM 
      009A3D 05 03            [ 2] 1732 	jra 3$
      009A3F 01 1E D3         [ 2] 1733 2$: ldw x,#RAM_MEM 	 
      009A40 CD 09 9D         [ 4] 1734 3$:	call puts 
      009A40 CD 98            [ 1] 1735 	ld a,#CR 
      009A42 1F 09 40         [ 4] 1736 	call putc
      009A43 81               [ 4] 1737 	ret 
                                   1738 
      009A43 4D 26 03 CC 97 1E 6D  1739 PROG_ADDR: .asciz "program address: "
             20 61 64 64 72 65 73
             73 3A 20 00
      009A49 2C 20 70 72 6F 67 72  1740 PROG_SIZE: .asciz ", program size: "
             61 6D 20 73 69 7A 65
             3A 20 00
      009A49 A1 81 26 06 CD 98 38  1741 STR_BYTES: .asciz " bytes" 
      009A50 FD 20 5D 20 46 4C 41  1742 FLASH_MEM: .asciz " in FLASH memory" 
             53 48 20 6D 65 6D 6F
             72 79 00
      009A53 20 69 6E 20 52 41 4D  1743 RAM_MEM:   .asciz " in RAM memory" 
             20 6D 65 6D 6F 72 79
             00
                                   1744 
                                   1745 
                                   1746 ;----------------------------
                                   1747 ; BASIC: LIST [[start][,end]]
                                   1748 ; list program lines 
                                   1749 ; form start to end 
                                   1750 ; if empty argument list then 
                                   1751 ; list all.
                                   1752 ;----------------------------
                           000001  1753 	FIRST=1
                           000003  1754 	LAST=3 
                           000005  1755 	LN_PTR=5
                           000006  1756 	VSIZE=6 
      001EE2                       1757 list:
      009A53 A1 84 26 05 CD   [ 2] 1758 	btjf flags,#FRUN,0$
      009A58 98 5E            [ 1] 1759 	ld a,#ERR_CMD_ONLY
      009A5A 20 54 A0         [ 2] 1760 	jp tb_error
      009A5C                       1761 0$:	 
      009A5C A1 05 26         [ 4] 1762 	call next_token 
      009A5F 05 CD            [ 1] 1763 	cp a,#TK_CHAR 
      009A61 99 F9            [ 1] 1764 	jrne 2$
      009A63 20 07 EE         [ 4] 1765 	call get_char 
      009A65 A4 DF            [ 1] 1766 	and a,#0xDF 
      009A65 A1 85            [ 1] 1767 	cp a,#'C 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      009A67 26 08            [ 1] 1768 	jrne 1$
      009A69 CD 98 54         [ 4] 1769 	call list_const
      009A6C 81               [ 4] 1770 	ret 
      009A6C F6 EE 01         [ 2] 1771 1$: jp syntax_error 
      001F03                       1772 2$:	_unget_token 
      009A6F 20 3F 02 00 01   [ 1]    1      mov in,in.saved  
      009A71 CD 1E 51         [ 4] 1773 	call prog_size 
      009A71 A1 03            [ 1] 1774 	jrugt 3$
      009A73 26               [ 4] 1775 	ret 
      001F0E                       1776 3$: _vars VSIZE
      009A74 10 89            [ 2]    1     sub sp,#VSIZE 
      009A76 CD 98 45         [ 2] 1777 	ldw x,txtbgn 
      009A79 85 CD            [ 2] 1778 	ldw (LN_PTR,sp),x 
      009A7B 9D               [ 2] 1779 	ldw x,(x) 
      009A7C DA 5D            [ 2] 1780 	ldw (FIRST,sp),x ; list from first line 
      009A7E 27 28 CD         [ 2] 1781 	ldw x,#MAX_LINENO ; biggest line number 
      009A81 9D 36            [ 2] 1782 	ldw (LAST,sp),x 
      009A83 20 2B 5D         [ 4] 1783 	call arg_list
      009A85 4D               [ 1] 1784 	tnz a
      009A85 A1 82            [ 1] 1785 	jreq list_loop 
      009A87 26 08            [ 1] 1786 	cp a,#2 
      009A89 CD 98            [ 1] 1787 	jreq 4$
      009A8B 38 FD            [ 1] 1788 	cp a,#1 
      009A8D 5F 02            [ 1] 1789 	jreq first_line 
      009A8F 20 1F 9E         [ 2] 1790 	jp syntax_error 
      009A91 85               [ 2] 1791 4$:	popw x 
      009A91 A1 06            [ 2] 1792 	ldw (LAST+2,sp),x 
      001F31                       1793 first_line:
      009A93 26               [ 2] 1794 	popw x
      009A94 13 CD            [ 2] 1795 	ldw (FIRST,sp),x 
      001F34                       1796 lines_skip:
      009A96 9B 08 A6         [ 2] 1797 	ldw x,txtbgn
      009A99 07 CD            [ 2] 1798 2$:	ldw (LN_PTR,sp),x 
      009A9B 99 CB 90         [ 2] 1799 	cpw x,txtend 
      009A9E F6 93            [ 1] 1800 	jrpl list_exit 
      009AA0 EE               [ 2] 1801 	ldw x,(x) ;line# 
      009AA1 01 72            [ 2] 1802 	cpw x,(FIRST,sp)
      009AA3 A9 00            [ 1] 1803 	jrpl list_loop 
      009AA5 03 20            [ 2] 1804 	ldw x,(LN_PTR,sp) 
      009AA7 08 02            [ 1] 1805 	ld a,(2,x)
      009AA8 C7 00 0E         [ 1] 1806 	ld acc8,a 
      009AA8 55 00 03 00      [ 1] 1807 	clr acc16 
      009AAC 02 4F 20 12      [ 2] 1808 	addw x,acc16
      009AB0 20 E3            [ 2] 1809 	jra 2$ 
                                   1810 ; print loop
      001F54                       1811 list_loop:
      009AB0 0D 01            [ 2] 1812 	ldw x,(LN_PTR,sp)
      009AB2 27 03            [ 1] 1813 	ld a,(2,x) 
      009AB4 CD 82 81         [ 4] 1814 	call prt_basic_line
      009AB7 1E 05            [ 2] 1815 	ldw x,(LN_PTR,sp)
      009AB7 72 A2            [ 1] 1816 	ld a,(2,x)
      009AB9 00 03 90         [ 1] 1817 	ld acc8,a 
      009ABC F7 90 EF 01      [ 1] 1818 	clr acc16 
      009AC0 A6 84 00 0D      [ 2] 1819 	addw x,acc16
      009AC2 C3 00 1D         [ 2] 1820 	cpw x,txtend 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      009AC2 5B 01            [ 1] 1821 	jrpl list_exit
      009AC4 81 05            [ 2] 1822 	ldw (LN_PTR,sp),x
      009AC5 FE               [ 2] 1823 	ldw x,(x)
      009AC5 52 01            [ 2] 1824 	cpw x,(LAST,sp)  
      009AC7 CD 9A            [ 1] 1825 	jrslt list_loop
      001F76                       1826 list_exit:
      009AC9 29 4D 27 38 01   [ 1] 1827 	mov in,count 
      009ACD AE 16 B8         [ 2] 1828 	ldw x,#pad 
      009ACD CD 98 1F         [ 2] 1829 	ldw basicptr,x 
      001F81                       1830 	_drop VSIZE 
      009AD0 6B 01            [ 2]    1     addw sp,#VSIZE 
      009AD2 A4 30 A1         [ 4] 1831 	call program_info 
      009AD5 20               [ 4] 1832 	ret
                                   1833 
                                   1834 
                                   1835 ;--------------------------
                                   1836 ; BASIC: EDIT 
                                   1837 ;  copy program in FLASH 
                                   1838 ;  to RAM for edition 
                                   1839 ;-------------------------
      001F87                       1840 edit:
      009AD6 27 09 A6         [ 4] 1841 	call qsign 
      009AD9 84 55            [ 1] 1842 	jreq 1$ 
      009ADB 00 03 00         [ 2] 1843 	ldw x,#NOT_SAVED 
      009ADE 02 20 24         [ 4] 1844 	call puts 
      009AE1 81               [ 4] 1845 	ret 
      001F93                       1846 1$: 
      009AE1 CD 9A 29 4D      [ 2] 1847 	ldw y,#app_sign ; source address 
      009AE5 26 03 CC         [ 2] 1848     ldw x,app_size  
      009AE8 97 1E 04         [ 2] 1849 	addw x,#4 
      009AEA CF 00 0D         [ 2] 1850 	ldw acc16,x  ; bytes to copy 
      009AEA 7B 01 A1         [ 2] 1851 	ldw x,#rsign ; destination address 
      009AED 20 26 05         [ 4] 1852 	call move  
      009AF0 CD 82 D9         [ 2] 1853 	ldw x,#free_ram 
      009AF3 20 D8 A1         [ 2] 1854 	ldw txtbgn,x 
      009AF6 21 26 05 CD      [ 2] 1855 	addw x,rsize  
      009AFA 83 A3 20         [ 2] 1856 	ldw txtend,x 
      009AFD CF               [ 4] 1857 	ret 
                                   1858 
      009AFE 4E 6F 20 61 70 70 6C  1859 NOT_SAVED: .asciz "No application saved.\n"
             69 63 61 74 69 6F 6E
             20 73 61 76 65 64 2E
             0A 00
                                   1860 
                                   1861 
                                   1862 ;--------------------------
                                   1863 ; decompile line from token list
                                   1864 ; and print it. 
                                   1865 ; input:
                                   1866 ;   A       stop at this position 
                                   1867 ;   X 		pointer at line
                                   1868 ; output:
                                   1869 ;   none 
                                   1870 ;--------------------------	
      001FCB                       1871 prt_basic_line:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      009AFE CD 84            [ 2] 1872 	pushw y 
      009B00 51 20 CA         [ 1] 1873 	ld count,a 
      009B03 E6 02            [ 1] 1874 	ld a,(2,x)
      009B03 A6 84 03         [ 1] 1875 	cp a,count 
      009B05 2A 03            [ 1] 1876 	jrpl 1$ 
      009B05 5B 01 81         [ 1] 1877 	ld count,a 
      009B08 CF 00 04         [ 2] 1878 1$:	ldw basicptr,x 
      009B08 52 01 CD 9A      [ 2] 1879 	ldw y,#tib  
      009B0C C5 4D 27         [ 4] 1880 	call decompile 
      009B0F 2D 09 9D         [ 4] 1881 	call puts 
      009B10 A6 0D            [ 1] 1882 	ld a,#CR 
      009B10 CD 98 1F         [ 4] 1883 	call putc 
      009B13 6B 01            [ 2] 1884 	popw y 
      009B15 A4               [ 4] 1885 	ret 
                                   1886 
                                   1887 
                                   1888 ;---------------------------------
                                   1889 ; BASIC: PRINT|? arg_list 
                                   1890 ; print values from argument list
                                   1891 ;----------------------------------
                           000001  1892 	CCOMMA=1
                           000001  1893 	VSIZE=1
      001FEF                       1894 print:
      001FEF                       1895 	_vars VSIZE 
      009B16 30 A1            [ 2]    1     sub sp,#VSIZE 
      001FF1                       1896 reset_comma:
      009B18 10 27            [ 1] 1897 	clr (CCOMMA,sp)
      001FF3                       1898 prt_loop:
      009B1A 09 55 00         [ 4] 1899 	call next_token
      009B1D 03 00            [ 1] 1900 	cp a,#CMD_END 
      009B1F 02 A6            [ 1] 1901 	jrult 0$
      009B21 84 20            [ 1] 1902 	cp a,#TK_COLON 
      009B23 19 04            [ 1] 1903 	jreq 0$
      009B24 A1 80            [ 1] 1904 	cp a,#TK_CMD
      009B24 CD 9A            [ 1] 1905 	jrne 10$
      002002                       1906 0$:
      002002                       1907 	_unget_token 
      009B26 C5 4D 26 03 CC   [ 1]    1      mov in,in.saved  
      009B2B 97 1E            [ 2] 1908 	jra 8$ 
      009B2D                       1909 10$:	
      009B2D 7B 01            [ 1] 1910 	cp a,#TK_QSTR
      009B2F A1 10            [ 1] 1911 	jreq 1$
      009B31 26 05            [ 1] 1912 	cp a,#TK_CHAR 
      009B33 CD 81            [ 1] 1913 	jreq 2$ 
      009B35 EA 20            [ 1] 1914 	cp a,#TK_CFUNC 
      009B37 D8 1F            [ 1] 1915 	jreq 3$
      009B38 A1 08            [ 1] 1916 	cp a,#TK_COMMA 
      009B38 CD 82            [ 1] 1917 	jreq 4$
      009B3A 07 20            [ 1] 1918 	cp a,#TK_SHARP 
      009B3C D3 24            [ 1] 1919 	jreq 5$
      009B3D 20 37            [ 2] 1920 	jra 7$ 
      00201F                       1921 1$:	; print string 
      009B3D 5B 01 81         [ 4] 1922 	call puts
      009B40 5C               [ 1] 1923 	incw x
      009B40 52 01 CD 9B      [ 2] 1924 	subw x,basicptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      009B44 08 4D 27         [ 2] 1925 	ldw in.w,x  
      009B47 54 CD            [ 2] 1926 	jra reset_comma
      00202C                       1927 2$:	; print character 
      009B49 98 1F 6B         [ 4] 1928 	call get_char 
      009B4C 01 A4 30         [ 4] 1929 	call putc 
      009B4F A1 30            [ 2] 1930 	jra reset_comma 
      002034                       1931 3$: ; print character function value  	
      009B51 27 09 A6         [ 4] 1932 	call get_code_addr 
      009B54 84               [ 4] 1933 	call (x)
      009B55 55 00 03         [ 4] 1934 	call putc
      009B58 00 02            [ 2] 1935 	jra reset_comma 
      00203D                       1936 4$: ; set comma state 
      009B5A 20 40            [ 1] 1937 	cpl (CCOMMA,sp)
      009B5C 20 B2            [ 2] 1938 	jra prt_loop   
      002041                       1939 5$: ; # character must be followed by an integer   
      009B5C CD 9B 08         [ 4] 1940 	call next_token
      009B5F 4D 26            [ 1] 1941 	cp a,#TK_INTGR 
      009B61 03 CC            [ 1] 1942 	jreq 6$
      009B63 97 1E 9E         [ 2] 1943 	jp syntax_error 
      009B65                       1944 6$: ; set tab width
      009B65 CD 82 24         [ 4] 1945 	call get_int24 
      009B68 90               [ 1] 1946 	ld a,xl 
      009B69 F6 93            [ 1] 1947 	and a,#15 
      009B6B EE 01 72         [ 1] 1948 	ld tab_width,a 
      009B6E A9 00            [ 2] 1949 	jra reset_comma 
      002056                       1950 7$:	
      002056                       1951 	_unget_token 
      009B70 03 4D 2B 08 26   [ 1]    1      mov in,in.saved  
      009B75 0C 35 02         [ 4] 1952 	call condition
      009B78 00               [ 1] 1953 	tnz a 
      009B79 0F 20            [ 1] 1954 	jreq 8$    
      009B7B 0A 18 19         [ 4] 1955     call print_top
      009B7C 20 8B            [ 2] 1956 	jra reset_comma 
      002066                       1957 8$:
      009B7C 35 04            [ 1] 1958 	tnz (CCOMMA,sp)
      009B7E 00 0F            [ 1] 1959 	jrne 9$
      009B80 20 04            [ 1] 1960 	ld a,#CR 
      009B82 CD 09 40         [ 4] 1961     call putc 
      00206F                       1962 9$:	_drop VSIZE 
      009B82 35 01            [ 2]    1     addw sp,#VSIZE 
      009B84 00               [ 4] 1963 	ret 
                                   1964 
                                   1965 ;----------------------
                                   1966 ; 'save_context' and
                                   1967 ; 'rest_context' must be 
                                   1968 ; called at the same 
                                   1969 ; call stack depth 
                                   1970 ; i.e. SP must have the 
                                   1971 ; save value at  
                                   1972 ; entry point of both 
                                   1973 ; routine. 
                                   1974 ;---------------------
                           000004  1975 	CTXT_SIZE=4 ; size of saved data 
                                   1976 ;--------------------
                                   1977 ; save current BASIC
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



                                   1978 ; interpreter context 
                                   1979 ; on stack 
                                   1980 ;--------------------
      002072                       1981 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      002072                       1982 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      002072                       1983 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      002072                       1984 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      002072                       1985 save_context:
      009B85 0F 00 04         [ 2] 1986 	ldw x,basicptr 
      009B86 1F 03            [ 2] 1987 	ldw (BPTR,sp),x
      009B86 5F C6 00         [ 1] 1988 	ld a,in 
      009B89 0F 14            [ 1] 1989 	ld (IN,sp),a
      009B8B 01 27 03         [ 1] 1990 	ld a,count 
      009B8E 53 A6            [ 1] 1991 	ld (CNT,sp),a  
      009B90 FF               [ 4] 1992 	ret
                                   1993 
                                   1994 ;-----------------------
                                   1995 ; restore previously saved 
                                   1996 ; BASIC interpreter context 
                                   1997 ; from stack 
                                   1998 ;-------------------------
      002082                       1999 rest_context:
      009B91 72 A2            [ 2] 2000 	ldw x,(BPTR,sp)
      009B93 00 03 90         [ 2] 2001 	ldw basicptr,x 
      009B96 F7 90            [ 1] 2002 	ld a,(IN,sp)
      009B98 EF 01 A6         [ 1] 2003 	ld in,a
      009B9B 84 06            [ 1] 2004 	ld a,(CNT,sp)
      009B9C C7 00 03         [ 1] 2005 	ld count,a  
      009B9C 5B               [ 4] 2006 	ret
                                   2007 
                                   2008 
                                   2009 
                                   2010 ;------------------------------------------
                                   2011 ; BASIC: INPUT [string]var[,[string]var]
                                   2012 ; input value in variables 
                                   2013 ; [string] optionally can be used as prompt 
                                   2014 ;-----------------------------------------
                           000001  2015 	CX_BPTR=1
                           000003  2016 	CX_IN=3
                           000004  2017 	CX_CNT=4
                           000005  2018 	SKIP=5
                           000005  2019 	VSIZE=5
      002092                       2020 input_var:
      009B9D 01 81            [ 2] 2021 	pushw y 
      009B9F                       2022 	_vars VSIZE 
      009B9F 4B 00            [ 2]    1     sub sp,#VSIZE 
      002096                       2023 input_loop:
      009BA1 CD 98            [ 1] 2024 	clr (SKIP,sp)
      009BA3 1F 4D 27         [ 4] 2025 	call next_token 
      009BA6 25 A1            [ 1] 2026 	cp a,#TK_QSTR 
      009BA8 87 26            [ 1] 2027 	jrne 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      009BAA 04 03 01         [ 4] 2028 	call puts 
      009BAD 20               [ 1] 2029 	incw x 
      009BAE F2 B0 00 04      [ 2] 2030 	subw x,basicptr 
      009BAF CF 00 00         [ 2] 2031 	ldw in.w,x 
      009BAF A1 06            [ 1] 2032 	cpl (SKIP,sp)
      009BB1 26 0A CD         [ 4] 2033 	call next_token 
      009BB4 9C 21            [ 1] 2034 1$: cp a,#TK_VAR  
      009BB6 A6 07            [ 1] 2035 	jreq 2$ 
      009BB8 CD 99 CB         [ 2] 2036 	jp syntax_error
      009BBB 20 08 55         [ 4] 2037 2$:	call get_addr
      009BBE 00 03 00         [ 2] 2038 	ldw ptr16,x 
      009BC1 02 CD            [ 1] 2039 	tnz (SKIP,sp)
      009BC3 9B 40            [ 1] 2040 	jrne 21$ 
      009BC5 CD 11 CD         [ 4] 2041 	call var_name 
      009BC5 0D 01 27         [ 4] 2042 	call putc   
      0020C6                       2043 21$:
      009BC8 03 CD            [ 1] 2044 	ld a,#':
      009BCA 82 66 40         [ 4] 2045 	call putc 
      009BCC CD 20 72         [ 4] 2046 	call save_context 
      009BCC 5B 01 81 03      [ 1] 2047 	clr count  
      009BCF CD 0A A2         [ 4] 2048 	call readln 
      009BCF CD 9B 9F         [ 2] 2049 	ldw x,#tib 
      009BD2 4D 27 4B         [ 1] 2050 	push count
      009BD5 CD 98            [ 1] 2051 	push #0 
      009BD7 1F 4D 27         [ 2] 2052 	addw x,(1,sp)
      009BDA 43               [ 1] 2053 	incw x 
      0020E1                       2054 	_drop 2 
      009BDB A1 88            [ 2]    1     addw sp,#2 
      009BDD 27 07 55 00      [ 1] 2055 	clr in 
      009BE1 03 00 02         [ 4] 2056 	call get_token
      009BE4 20 38            [ 1] 2057 	cp a,#TK_INTGR
      009BE6 CD 9B            [ 1] 2058 	jreq 3$ 
      009BE8 9F 4D            [ 1] 2059 	cp a,#TK_MINUS
      009BEA 26 03            [ 1] 2060 	jrne 22$
      009BEC CC 97 1E         [ 4] 2061 	call get_token 
      009BEF A1 84            [ 1] 2062 	cp a,#TK_INTGR 
      009BEF 90 F6            [ 1] 2063 	jreq 23$
      0020F9                       2064 22$:
      009BF1 93 EE 01         [ 4] 2065 	call rest_context 
      009BF4 72 A9 00         [ 2] 2066 	jp syntax_error
      0020FF                       2067 23$:
      009BF7 03 C7 00         [ 4] 2068 	call neg_acc24	
      002102                       2069 3$: 
      009BFA 0D CF 00         [ 1] 2070 	ld a,acc24 
      009BFD 0E 90 F6         [ 2] 2071 	ldw x,acc16 
      009C00 93 EE 01 72      [ 4] 2072 	ld [ptr16],a
      009C04 A9 00 03 C4      [ 1] 2073 	inc ptr8  
      009C08 00 0D 02 C4      [ 5] 2074 	ldw [ptr16],x 
      009C0C 00 0E 02         [ 4] 2075 	call rest_context
      009C0F C4 00 0F         [ 4] 2076 	call next_token 
      009C12 02 72            [ 1] 2077 	cp a,#TK_COMMA
      009C14 A2 00            [ 1] 2078 	jrne 4$ 
      009C16 03 90 F7         [ 2] 2079 	jp input_loop
      002121                       2080 4$:
      009C19 90 EF            [ 1] 2081 	cp a,#TK_NONE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      009C1B 01 20            [ 1] 2082 	jreq input_exit  
      009C1D B7 A6            [ 1] 2083 	cp a,#TK_COLON 
      009C1F 84 81            [ 1] 2084     jreq input_exit 
      009C21 CC 16 9E         [ 2] 2085 	jp syntax_error 
      00212C                       2086 input_exit:
      00212C                       2087 	_drop VSIZE 
      009C21 52 02            [ 2]    1     addw sp,#VSIZE 
      009C23 CD 9B            [ 2] 2088 	popw y 
      009C25 CF               [ 4] 2089 	ret 
                                   2090 
                                   2091 
                                   2092 ;---------------------
                                   2093 ; BASIC: REM | ' 
                                   2094 ; skip comment to end of line 
                                   2095 ;---------------------- 
      002131                       2096 remark::
      009C26 4D 27 69 CD 98   [ 1] 2097 	mov in,count 
      009C2B 1F               [ 4] 2098  	ret 
                                   2099 
                                   2100 
                                   2101 ;---------------------
                                   2102 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2103 ; read in loop 'addr'  
                                   2104 ; apply & 'mask' to value 
                                   2105 ; loop while result==0.  
                                   2106 ; 'xor_mask' is used to 
                                   2107 ; invert the wait logic.
                                   2108 ; i.e. loop while not 0.
                                   2109 ;---------------------
                           000001  2110 	XMASK=1 
                           000002  2111 	MASK=2
                           000003  2112 	ADDR=3
                           000004  2113 	VSIZE=4
      002137                       2114 wait: 
      002137                       2115 	_vars VSIZE
      009C2C A1 89            [ 2]    1     sub sp,#VSIZE 
      009C2E 27 0B            [ 1] 2116 	clr (XMASK,sp) 
      009C30 A1 8A 27         [ 4] 2117 	call arg_list 
      009C33 07 55            [ 1] 2118 	cp a,#2
      009C35 00 03            [ 1] 2119 	jruge 0$
      009C37 00 02 20         [ 2] 2120 	jp syntax_error 
      009C3A 55 6B            [ 1] 2121 0$:	cp a,#3
      009C3C 02 CD            [ 1] 2122 	jrult 1$
      002149                       2123 	_xpop  ; xor mask 
      009C3E 9B CF            [ 1]    1     ld a,(y)
      009C40 A1               [ 1]    2     ldw x,y 
      009C41 84 27            [ 2]    3     ldw x,(1,x)
      009C43 03 CC 97 1E      [ 2]    4     addw y,#CELL_SIZE 
      009C47 9F               [ 1] 2124 	ld a,xl 
      009C47 90 F6            [ 1] 2125 	ld (XMASK,sp),a 
      002155                       2126 1$: _xpop ; mask
      009C49 93 EE            [ 1]    1     ld a,(y)
      009C4B 01               [ 1]    2     ldw x,y 
      009C4C 72 A9            [ 2]    3     ldw x,(1,x)
      009C4E 00 03 C7 00      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      009C52 0D               [ 1] 2127     ld a,xl  
      009C53 CF 00            [ 1] 2128 	ld (MASK,sp),a 
      002161                       2129 	_xpop ; address 
      009C55 0E 90            [ 1]    1     ld a,(y)
      009C57 F6               [ 1]    2     ldw x,y 
      009C58 93 EE            [ 2]    3     ldw x,(1,x)
      009C5A 01 72 A9 00      [ 2]    4     addw y,#CELL_SIZE 
      009C5E 03               [ 1] 2130 2$:	ld a,(x)
      009C5F 6B 01            [ 1] 2131 	and a,(MASK,sp)
      009C61 7B 02            [ 1] 2132 	xor a,(XMASK,sp)
      009C63 A1 8A            [ 1] 2133 	jreq 2$ 
      002171                       2134 	_drop VSIZE 
      009C65 27 10            [ 2]    1     addw sp,#VSIZE 
      009C67 81               [ 4] 2135 	ret 
                                   2136 
                                   2137 ;---------------------
                                   2138 ; BASIC: BSET addr,mask
                                   2139 ; set bits at 'addr' corresponding 
                                   2140 ; to those of 'mask' that are at 1.
                                   2141 ; arguments:
                                   2142 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2143 ;   mask        mask|addr
                                   2144 ; output:
                                   2145 ;	none 
                                   2146 ;--------------------------
      002174                       2147 bit_set:
      009C67 7B 01 CA         [ 4] 2148 	call arg_list 
      009C6A 00 0D            [ 1] 2149 	cp a,#2	 
      009C6C 02 CA            [ 1] 2150 	jreq 1$ 
      009C6E 00 0E 02         [ 2] 2151 	jp syntax_error
      00217E                       2152 1$: 
      00217E                       2153 	_xpop ; mask 
      009C71 CA 00            [ 1]    1     ld a,(y)
      009C73 0F               [ 1]    2     ldw x,y 
      009C74 02 20            [ 2]    3     ldw x,(1,x)
      009C76 0E A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C77 9F               [ 1] 2154 	ld a,xl
      009C77 7B               [ 1] 2155 	push a  
      002189                       2156 	_xpop ; addr  
      009C78 01 C8            [ 1]    1     ld a,(y)
      009C7A 00               [ 1]    2     ldw x,y 
      009C7B 0D 02            [ 2]    3     ldw x,(1,x)
      009C7D C8 00 0E 02      [ 2]    4     addw y,#CELL_SIZE 
      009C81 C8               [ 1] 2157 	pop a 
      009C82 00               [ 1] 2158 	or a,(x)
      009C83 0F               [ 1] 2159 	ld (x),a
      009C84 02               [ 4] 2160 	ret 
                                   2161 
                                   2162 ;---------------------
                                   2163 ; BASIC: BRES addr,mask
                                   2164 ; reset bits at 'addr' corresponding 
                                   2165 ; to those of 'mask' that are at 1.
                                   2166 ; arguments:
                                   2167 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2168 ;   mask	    ~mask&*addr  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



                                   2169 ; output:
                                   2170 ;	none 
                                   2171 ;--------------------------
      002196                       2172 bit_reset:
      009C85 72 A2 00         [ 4] 2173 	call arg_list 
      009C88 03 90            [ 1] 2174 	cp a,#2  
      009C8A F7 90            [ 1] 2175 	jreq 1$ 
      009C8C EF 01 20         [ 2] 2176 	jp syntax_error
      0021A0                       2177 1$: 
      0021A0                       2178 	_xpop ; mask 
      009C8F 99 A6            [ 1]    1     ld a,(y)
      009C91 84               [ 1]    2     ldw x,y 
      009C92 5B 02            [ 2]    3     ldw x,(1,x)
      009C94 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C95 9F               [ 1] 2179 	ld a,xl 
      009C95 35               [ 1] 2180 	cpl a
      009C96 10               [ 1] 2181 	push a  
      0021AC                       2182 	_xpop ; addr  
      009C97 00 0B            [ 1]    1     ld a,(y)
      009C99 81               [ 1]    2     ldw x,y 
      009C9A EE 01            [ 2]    3     ldw x,(1,x)
      009C9A 35 0A 00 0B      [ 2]    4     addw y,#CELL_SIZE 
      009C9E 81               [ 1] 2183 	pop a 
      009C9F F4               [ 1] 2184 	and a,(x)
      009C9F 90               [ 1] 2185 	ld (x),a 
      009CA0 89               [ 4] 2186 	ret 
                                   2187 
                                   2188 ;---------------------
                                   2189 ; BASIC: BTOGL addr,mask
                                   2190 ; toggle bits at 'addr' corresponding 
                                   2191 ; to those of 'mask' that are at 1.
                                   2192 ; arguments:
                                   2193 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2194 ;   mask	    mask^*addr  
                                   2195 ; output:
                                   2196 ;	none 
                                   2197 ;--------------------------
      0021B9                       2198 bit_toggle:
      009CA1 4F AE 16         [ 4] 2199 	call arg_list 
      009CA4 68 90            [ 1] 2200 	cp a,#2 
      009CA6 CE 00            [ 1] 2201 	jreq 1$ 
      009CA8 1E 90 A3         [ 2] 2202 	jp syntax_error
      0021C3                       2203 1$: _xpop ; mask 
      009CAB B6 00            [ 1]    1     ld a,(y)
      009CAD 25               [ 1]    2     ldw x,y 
      009CAE 05 1D            [ 2]    3     ldw x,(1,x)
      009CB0 00 80 20 04      [ 2]    4     addw y,#CELL_SIZE 
      009CB4 9F               [ 1] 2204 	ld a,xl
      009CB4 72               [ 1] 2205 	push a 
      0021CE                       2206 	_xpop  ; addr  
      009CB5 B0 00            [ 1]    1     ld a,(y)
      009CB7 1E               [ 1]    2     ldw x,y 
      009CB8 90 85            [ 2]    3     ldw x,(1,x)
      009CBA 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009CBB 84               [ 1] 2207 	pop a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      009CBB 3B               [ 1] 2208 	xor a,(x)
      009CBC 00               [ 1] 2209 	ld (x),a 
      009CBD 0B               [ 4] 2210 	ret 
                                   2211 
                                   2212 
                                   2213 ;---------------------
                                   2214 ; BASIC: BTEST(addr,bit)
                                   2215 ; return bit value at 'addr' 
                                   2216 ; bit is in range {0..7}.
                                   2217 ; arguments:
                                   2218 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2219 ;   bit 	    bit position {0..7}  
                                   2220 ; output:
                                   2221 ;	A:X       bit value  
                                   2222 ;--------------------------
      0021DB                       2223 bit_test:
      009CBE AE 9F 18         [ 4] 2224 	call func_args 
      009CC1 CD 8A            [ 1] 2225 	cp a,#2
      009CC3 1D CE            [ 1] 2226 	jreq 0$
      009CC5 00 1C 35         [ 2] 2227 	jp syntax_error
      0021E5                       2228 0$:	
      0021E5                       2229 	_xpop 
      009CC8 10 00            [ 1]    1     ld a,(y)
      009CCA 0B               [ 1]    2     ldw x,y 
      009CCB CD 98            [ 2]    3     ldw x,(1,x)
      009CCD 74 32 00 0B      [ 2]    4     addw y,#CELL_SIZE 
      009CD1 AE               [ 1] 2230 	ld a,xl 
      009CD2 9F 2A            [ 1] 2231 	and a,#7
      009CD4 CD               [ 1] 2232 	push a   
      009CD5 8A 1D            [ 1] 2233 	ld a,#1 
      009CD7 CE 00            [ 1] 2234 1$: tnz (1,sp)
      009CD9 1E 72            [ 1] 2235 	jreq 2$
      009CDB B0               [ 1] 2236 	sll a 
      009CDC 00 1C            [ 1] 2237 	dec (1,sp)
      009CDE CD 98            [ 2] 2238 	jra 1$
      009CE0 74 AE            [ 1] 2239 2$: ld (1,sp),a  
      0021FF                       2240 	_xpop ; address  
      009CE2 9F 3B            [ 1]    1     ld a,(y)
      009CE4 CD               [ 1]    2     ldw x,y 
      009CE5 8A 1D            [ 2]    3     ldw x,(1,x)
      009CE7 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009CE8 84               [ 1] 2241 	pop a 
      009CE8 CD               [ 1] 2242 	and a,(x)
      009CE9 9C 9F            [ 1] 2243 	jreq 3$
      009CEB A6 03            [ 1] 2244 	ld a,#1 
      009CED 62               [ 1] 2245 3$:	clrw x 
      009CEE CF               [ 1] 2246 	ld xl,a
      009CEF 00               [ 1] 2247 	clr a  
      009CF0 21               [ 4] 2248 	ret
                                   2249 
                                   2250 ;--------------------
                                   2251 ; BASIC: POKE addr,byte
                                   2252 ; put a byte at addr 
                                   2253 ;--------------------
      002212                       2254 poke:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      009CF1 4F 81 5D         [ 4] 2255 	call arg_list 
      009CF3 A1 02            [ 1] 2256 	cp a,#2
      009CF3 CD 98            [ 1] 2257 	jreq 1$
      009CF5 1F A1 85         [ 2] 2258 	jp syntax_error
      00221C                       2259 1$:	
      00221C                       2260 	_xpop ; byte   
      009CF8 27 0C            [ 1]    1     ld a,(y)
      009CFA A1               [ 1]    2     ldw x,y 
      009CFB 05 27            [ 2]    3     ldw x,(1,x)
      009CFD 03 CC 97 1E      [ 2]    4     addw y,#CELL_SIZE 
      009D01 9F               [ 1] 2261     ld a,xl 
      009D01 CD               [ 1] 2262 	push a 
      002227                       2263 	_xpop ; address 
      009D02 99 F9            [ 1]    1     ld a,(y)
      009D04 20               [ 1]    2     ldw x,y 
      009D05 03 01            [ 2]    3     ldw x,(1,x)
      009D06 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D06 CD               [ 1] 2264 	pop a 
      009D07 98               [ 1] 2265 	ld (x),a 
      009D08 54               [ 4] 2266 	ret 
                                   2267 
                                   2268 ;-----------------------
                                   2269 ; BASIC: PEEK(addr)
                                   2270 ; get the byte at addr 
                                   2271 ; input:
                                   2272 ;	none 
                                   2273 ; output:
                                   2274 ;	X 		value 
                                   2275 ;-----------------------
      009D09                       2276 peek:
      009D09 CF 00 1A         [ 4] 2277 	call func_args
      009D0C CD 98            [ 1] 2278 	cp a,#1 
      009D0E 1F A1            [ 1] 2279 	jreq 1$
      009D10 32 27 03         [ 2] 2280 	jp syntax_error
      00223D                       2281 1$: _xpop ; address  
      009D13 CC 97            [ 1]    1     ld a,(y)
      009D15 1E               [ 1]    2     ldw x,y 
      009D16 EE 01            [ 2]    3     ldw x,(1,x)
      009D16 CD 9C 21 A1      [ 2]    4     addw y,#CELL_SIZE 
      009D1A 84 27 03         [ 1] 2282 	ld farptr,a 
      009D1D CC 97 1E         [ 2] 2283 	ldw ptr16,x 
      009D20 92 BC 00 18      [ 5] 2284 	ldf a,[farptr]
      009D20 90               [ 1] 2285 	clrw x 
      009D21 F6               [ 1] 2286 	ld xl,a 
      009D22 93               [ 1] 2287 	clr a 
      009D23 EE               [ 4] 2288 	ret 
                                   2289 
                                   2290 ;---------------------------
                                   2291 ; BASIC IF expr : instructions
                                   2292 ; evaluate expr and if true 
                                   2293 ; execute instructions on same line. 
                                   2294 ;----------------------------
      002254                       2295 if: 
      009D24 01 72 A9         [ 4] 2296 	call condition  
      002257                       2297 	_xpop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      009D27 00 03            [ 1]    1     ld a,(y)
      009D29 93               [ 1]    2     ldw x,y 
      009D29 72 C7            [ 2]    3     ldw x,(1,x)
      009D2B 00 1A 72 5C      [ 2]    4     addw y,#CELL_SIZE 
      009D2F 00               [ 1] 2298 	tnz  a  
      009D30 1B 72            [ 1] 2299 	jrne 9$
      009D32 CF               [ 2] 2300 	tnzw x 
      009D33 00 1A            [ 1] 2301 	jrne 9$  
                                   2302 ;skip to next line
      009D35 81 00 03 00 01   [ 1] 2303 	mov in,count
      009D36                       2304 	_drop 2 
      009D36 F6 A0            [ 2]    1     addw sp,#2 
      009D38 03 88 4B         [ 2] 2305 	jp next_line
      009D3B 00               [ 4] 2306 9$:	ret 
                                   2307 
                                   2308 ;------------------------
                                   2309 ; BASIC: FOR var=expr 
                                   2310 ; set variable to expression 
                                   2311 ; leave variable address 
                                   2312 ; on stack and set
                                   2313 ; FLOOP bit in 'flags'
                                   2314 ;-----------------
                           000001  2315 	RETL1=1 ; return address  
                           000003  2316 	FSTEP=3  ; variable increment int24
                           000006  2317 	LIMIT=6 ; loop limit, int24  
                           000009  2318 	CVAR=9   ; control variable 
                           00000B  2319 	INW=11   ;  in.w saved
                           00000D  2320 	BPTR=13 ; baseptr saved
                           00000D  2321 	VSIZE=13  
      002271                       2322 for: ; { -- var_addr }
      009D3C 72               [ 2] 2323 	popw x ; call return address 
      002272                       2324 	_vars VSIZE 
      009D3D FB 01            [ 2]    1     sub sp,#VSIZE 
      009D3F F6               [ 2] 2325 	pushw x  ; RETL1 
      009D40 EE 01            [ 1] 2326 	ld a,#TK_VAR 
      009D42 5B 02 81         [ 4] 2327 	call expect
      009D45 CD 17 D4         [ 4] 2328 	call get_addr
      009D45 90 89            [ 2] 2329 	ldw (CVAR,sp),x  ; control variable 
      009D47 52 04 5F         [ 4] 2330 	call let_eval 
      009D4A 1F 01 90 AE      [ 1] 2331 	bset flags,#FLOOP 
      009D4E 40 00 90         [ 4] 2332 	call next_token 
      009D51 C3 00            [ 1] 2333 	cp a,#TK_CMD 
      009D53 25 24            [ 1] 2334 	jreq 1$
      009D55 35 17 03         [ 2] 2335 	jp syntax_error
      002290                       2336 1$:  
      009D58 93 5C CD         [ 4] 2337 	call get_code_addr
      009D5B 8A 1D A6         [ 2] 2338 	cpw x,#to   
      009D5E 3D CD            [ 1] 2339 	jreq to
      009D60 89 C0 1E         [ 2] 2340 	jp syntax_error 
                                   2341 
                                   2342 ;-----------------------------------
                                   2343 ; BASIC: TO expr 
                                   2344 ; second part of FOR loop initilization
                                   2345 ; leave limit on stack and set 
                                   2346 ; FTO bit in 'flags'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



                                   2347 ;-----------------------------------
      00229B                       2348 to: ; { var_addr -- var_addr limit step }
      009D63 03 CD 9D 36 C7   [ 2] 2349 	btjt flags,#FLOOP,1$
      009D68 00 0D CF         [ 2] 2350 	jp syntax_error
      009D6B 00 0E CD         [ 4] 2351 1$: call expression   
      009D6E 98 8B            [ 1] 2352 	cp a,#TK_INTGR 
      009D70 A6 0D            [ 1] 2353 	jreq 2$ 
      009D72 CD 89 C0         [ 2] 2354 	jp syntax_error
      0022AD                       2355 2$: _xpop
      009D75 1E 01            [ 1]    1     ld a,(y)
      009D77 5C               [ 1]    2     ldw x,y 
      009D78 1F 01            [ 2]    3     ldw x,(1,x)
      009D7A 72 5F 00 0E      [ 2]    4     addw y,#CELL_SIZE 
      009D7E 16 03            [ 1] 2356 	ld (LIMIT,sp),a 
      009D80 90 F6            [ 2] 2357 	ldw (LIMIT+1,sp),x
      009D82 C7 00 0F         [ 4] 2358 	call next_token
      009D85 72 B9            [ 1] 2359 	cp a,#TK_NONE  
      009D87 00 0E            [ 1] 2360 	jreq 4$ 
      009D89 20 C5            [ 1] 2361 	cp a,#TK_CMD
      009D8B 26 08            [ 1] 2362 	jrne 3$
      009D8B 1E 01 CD         [ 4] 2363 	call get_code_addr
      009D8E 98 74 AE         [ 2] 2364 	cpw x,#step 
      009D91 9D 9B            [ 1] 2365 	jreq step
      0022CD                       2366 3$:	
      0022CD                       2367 	_unget_token   	 
      009D93 CD 8A 1D 5B 04   [ 1]    1      mov in,in.saved  
      0022D2                       2368 4$:	
      009D98 90 85            [ 1] 2369 	clr (FSTEP,sp) 
      009D9A 81 20 63         [ 2] 2370 	ldw x,#1   ; default step  
      009D9D 6F 6E            [ 2] 2371 	ldw (FSTEP+1,sp),x 
      009D9F 73 74            [ 2] 2372 	jra store_loop_addr 
                                   2373 
                                   2374 
                                   2375 ;----------------------------------
                                   2376 ; BASIC: STEP expr 
                                   2377 ; optional third par of FOR loop
                                   2378 ; initialization. 	
                                   2379 ;------------------------------------
      0022DB                       2380 step: ; {var limit -- var limit step}
      009DA1 61 6E 74 73 20   [ 2] 2381 	btjt flags,#FLOOP,1$
      009DA6 69 6E 20         [ 2] 2382 	jp syntax_error
      009DA9 45 45 50         [ 4] 2383 1$: call expression 
      009DAC 52 4F            [ 1] 2384 	cp a,#TK_INTGR
      009DAE 4D 0A            [ 1] 2385 	jreq 2$
      009DB0 00 16 9E         [ 2] 2386 	jp syntax_error
      009DB1                       2387 2$:	
      0022ED                       2388 	_xpop 
      009DB1 AE 40            [ 1]    1     ld a,(y)
      009DB3 00               [ 1]    2     ldw x,y 
      009DB4 35 08            [ 2]    3     ldw x,(1,x)
      009DB6 00 0F A3 47      [ 2]    4     addw y,#CELL_SIZE 
      009DBA F8 24            [ 1] 2389 	ld (FSTEP,sp),a 
      009DBC 17 F6            [ 2] 2390 	ldw (FSTEP+1,sp),x ; step
                                   2391 ; if step < 0 decrement LIMIT 
      009DBE 26               [ 1] 2392 	tnz a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      009DBF 0C 5C            [ 1] 2393 	jrpl store_loop_addr 
      009DC1 72 5A            [ 1] 2394 	ld a,(LIMIT,sp)
      009DC3 00 0F            [ 2] 2395 	ldw x,(LIMIT+1,sp)
      009DC5 26 F6 1D         [ 2] 2396 	subw x,#1 
      009DC8 00 08            [ 1] 2397 	sbc a,#0 
      009DCA 20 09            [ 1] 2398 	ld (LIMIT,sp),a 
      009DCC F6 5C            [ 2] 2399 	ldw (LIMIT+1,sp),x 
                                   2400 ; leave loop back entry point on cstack 
                                   2401 ; cstack is 1 call deep from interpreter
      00230A                       2402 store_loop_addr:
      009DCE 4D 26 FB         [ 2] 2403 	ldw x,basicptr
      009DD1 5A 20            [ 2] 2404 	ldw (BPTR,sp),x 
      009DD3 E0 5F 4F         [ 2] 2405 	ldw x,in.w 
      009DD6 CF 00            [ 2] 2406 	ldw (INW,sp),x   
      009DD8 25 81 00 22      [ 1] 2407 	bres flags,#FLOOP 
      009DDA 72 5C 00 1F      [ 1] 2408 	inc loop_depth  
      009DDA 90               [ 4] 2409 	ret 
                                   2410 
                                   2411 ;--------------------------------
                                   2412 ; BASIC: NEXT var 
                                   2413 ; FOR loop control 
                                   2414 ; increment variable with step 
                                   2415 ; and compare with limit 
                                   2416 ; loop if threshold not crossed.
                                   2417 ; else stack. 
                                   2418 ; and decrement 'loop_depth' 
                                   2419 ;--------------------------------
      00231D                       2420 next: ; {var limit step retl1 -- [var limit step ] }
      009DDB 89 52 05 72      [ 1] 2421 	tnz loop_depth 
      009DDF 5F 00            [ 1] 2422 	jrne 1$ 
      009DE1 0E CD 94         [ 2] 2423 	jp syntax_error 
      002326                       2424 1$: 
      009DE4 62 AB            [ 1] 2425 	ld a,#TK_VAR 
      009DE6 05 6B 05         [ 4] 2426 	call expect
      009DE9 1F 01 90         [ 4] 2427 	call get_addr 
                                   2428 ; check for good variable after NEXT 	 
      009DEC AE 40            [ 2] 2429 	cpw x,(CVAR,sp)
      009DEE 00 1E            [ 1] 2430 	jreq 2$  
      009DF0 01 17 03         [ 2] 2431 	jp syntax_error ; not the good one 
      002335                       2432 2$: 
      009DF3 90 C3 00         [ 2] 2433 	ldw ptr16,x 
                                   2434 	; increment variable 
      009DF6 25               [ 1] 2435 	ld a,(x)
      009DF7 24 1A            [ 2] 2436 	ldw x,(1,x)  ; get var value 
      009DF9 90 F6 11         [ 2] 2437 	addw x,(FSTEP+1,sp) ; var+step 
      009DFC 05 26            [ 1] 2438 	adc a,(FSTEP,sp)
      009DFE 07 90 5C CD      [ 4] 2439 	ld [ptr16],a
      009E02 94 6D 26 11      [ 1] 2440 	inc ptr8  
      009E06 72 CF 00 19      [ 5] 2441 	ldw [ptr16],x 
      009E06 16 03 90         [ 1] 2442 	ld acc24,a 
      009E09 F6 C7 00         [ 2] 2443 	ldw acc16,x 
      009E0C 0F 72            [ 1] 2444 	ld a,(LIMIT,sp)
      009E0E B9 00            [ 2] 2445 	ldw x,(LIMIT+1,sp)
      009E10 0E 20 DC 0D      [ 2] 2446 	subw x,acc16 
      009E13 C2 00 0C         [ 1] 2447 	sbc a,acc24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      009E13 0F 03            [ 1] 2448 	xor a,(FSTEP,sp)
      009E15 0F 04            [ 1] 2449 	xor a,#0x80
      009E17 2B 12            [ 1] 2450 	jrmi loop_back  
      009E17 1E 03            [ 2] 2451 	jra loop_done   
                                   2452 ; check sign of STEP  
      009E19 5B 05            [ 1] 2453 	ld a,(FSTEP,sp)
      009E1B 90 85            [ 1] 2454 	jrpl 4$
                                   2455 ;negative step
      009E1D 81 00 0E         [ 1] 2456     ld a,acc8 
      009E1E 2F 07            [ 1] 2457 	jrslt loop_back   
      009E1E 90 89            [ 2] 2458 	jra loop_done  
      002370                       2459 4$: ; positive step
      009E20 52 08 0F 06 CD   [ 2] 2460 	btjt acc8,#7,loop_done 
      002375                       2461 loop_back:
      009E25 98 1F            [ 2] 2462 	ldw x,(BPTR,sp)
      009E27 A1 04 26         [ 2] 2463 	ldw basicptr,x 
      009E2A 0D CD 98 6E A4   [ 2] 2464 	btjf flags,#FRUN,1$ 
      009E2F DF A1            [ 1] 2465 	ld a,(2,x)
      009E31 55 26 08         [ 1] 2466 	ld count,a
      009E34 03 06            [ 2] 2467 1$:	ldw x,(INW,sp)
      009E36 20 07 A1         [ 2] 2468 	ldw in.w,x 
      009E39 03               [ 4] 2469 	ret 
      00238A                       2470 loop_done:
                                   2471 	; remove loop data from stack  
      009E3A 27               [ 2] 2472 	popw x
      00238B                       2473 	_drop VSIZE 
      009E3B 08 CC            [ 2]    1     addw sp,#VSIZE 
      009E3D 97 1E 00 1F      [ 1] 2474 	dec loop_depth 
      009E3F FC               [ 2] 2475 	jp (x)
                                   2476 
                                   2477 ;----------------------------
                                   2478 ; called by goto/gosub
                                   2479 ; to get target line number 
                                   2480 ; output:
                                   2481 ;    x    line address 
                                   2482 ;---------------------------
      002392                       2483 get_target_line:
      009E3F A6 03 CD         [ 4] 2484 	call next_token  
      009E42 99 CB            [ 1] 2485 	cp a,#TK_INTGR
      009E44 27 07            [ 1] 2486 	jreq get_target_line_addr 
      009E44 1F 01            [ 1] 2487 	cp a,#TK_LABEL 
      009E46 CD 98            [ 1] 2488 	jreq look_target_symbol 
      009E48 45 1E 01         [ 2] 2489 	jp syntax_error
                                   2490 ; the target is a line number 
                                   2491 ; search it. 
      0023A0                       2492 get_target_line_addr:
      009E4B CD 94            [ 2] 2493 	pushw y 
      009E4D 62 AB 05         [ 4] 2494 	call get_int24 ; line # 
      009E50 6B               [ 1] 2495 	clr a
      009E51 05 16 01 AE      [ 2] 2496 	ldw y,basicptr 
      009E55 16 68            [ 2] 2497 	ldw y,(y)
      009E57 7B 05            [ 2] 2498 	pushw y 
      009E59 F7 5C            [ 2] 2499 	cpw x,(1,sp)
      0023B0                       2500 	_drop 2  
      009E5B CD 94            [ 2]    1     addw sp,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      009E5D 7E 1F            [ 1] 2501 	jrult 11$
      009E5F 03               [ 1] 2502 	inc a 
      0023B5                       2503 11$: ; scan program for this line# 	
      009E60 5F 7B 05         [ 4] 2504 	call search_lineno  
      009E63 A0               [ 2] 2505 	tnzw x ; 0| line# address 
      009E64 04 97            [ 1] 2506 	jrne 2$ 
      009E66 72 FB            [ 1] 2507 	ld a,#ERR_NO_LINE 
      009E68 03 1F 03         [ 2] 2508 	jp tb_error 
      009E6B A6 32            [ 2] 2509 2$:	popw y  
      009E6D CD               [ 4] 2510 	ret 
                                   2511 
                                   2512 ; the GOTO|GOSUB target is a symbol.
                                   2513 ; output:
                                   2514 ;    X    line address|0 
      0023C3                       2515 look_target_symbol:
      009E6E 99 CB            [ 2] 2516 	pushw y 
      009E70 16               [ 2] 2517 	pushw x 
      009E71 07 CD 9B 08      [ 1] 2518 	clr acc16 
      009E75 A1 84 27 03      [ 2] 2519 	ldw y,txtbgn 
      009E79 CC 97 1E         [ 1] 2520 1$:	ld a,(3,y) ; first TK_ID on line 
      009E7C 90 F6            [ 1] 2521 	cp a,#TK_LABEL 
      009E7E 93 EE            [ 1] 2522 	jreq 3$ 
      009E80 01 72 A9         [ 1] 2523 2$:	ld a,(2,y); line length 
      009E83 00 03 17         [ 1] 2524 	ld acc8,a 
      009E86 07 16 03 90      [ 2] 2525 	addw y,acc16 ;point to next line 
      009E8A F7 90 EF 01      [ 2] 2526 	cpw y,txtend 
      009E8E 72 5F            [ 1] 2527 	jrult 1$
      009E90 00 19            [ 1] 2528 	ld a,#ERR_BAD_VALUE
      009E92 1E 01 CD         [ 2] 2529 	jp tb_error 
      0023EA                       2530 3$: ; found a TK_LABEL 
                                   2531 	; compare with GOTO|GOSUB target 
      009E95 9D DA            [ 2] 2532 	pushw y ; line address 
      009E97 5D 27 06 0D      [ 2] 2533 	addw y,#4 ; label string 
      009E9B 06 27            [ 2] 2534 	ldw x,(3,sp) ; target string 
      009E9D 1F 20 03         [ 4] 2535 	call strcmp
      009EA0 26 04            [ 1] 2536 	jrne 4$
      009EA0 CE 00            [ 2] 2537 	popw y 
      009EA2 25 DA            [ 2] 2538 	jra 2$ 
      009EA3                       2539 4$: ; target found 
      009EA3 CF               [ 2] 2540 	popw x ;  address line target  
      0023FC                       2541 	_drop 2 ; target string 
      009EA4 00 1A            [ 2]    1     addw sp,#2 
      009EA6 AE 16            [ 2] 2542 	popw y 
      009EA8 68               [ 4] 2543 	ret
                                   2544 
                                   2545 
                                   2546 ;--------------------------------
                                   2547 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2548 ; selective goto or gosub 
                                   2549 ;--------------------------------
      002401                       2550 cmd_on:
      009EA9 7B 05 CD 89 01   [ 2] 2551 	btjt flags,#FRUN,0$ 
      009EAE 0D 06            [ 1] 2552 	ld a,#ERR_RUN_ONLY
      009EB0 26 0B 5F         [ 2] 2553 	jp tb_error 
      009EB3 7B 05 97         [ 4] 2554 0$:	call expression 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      009EB6 72 BB            [ 1] 2555 	cp a,#TK_INTGR
      009EB8 00 25            [ 1] 2556 	jreq 1$
      009EBA CF 00 25         [ 2] 2557 	jp syntax_error
      009EBD                       2558 1$: _xpop
      009EBD CD 98            [ 1]    1     ld a,(y)
      009EBF 1F               [ 1]    2     ldw x,y 
      009EC0 A1 08            [ 2]    3     ldw x,(1,x)
      009EC2 26 03 CC 9E      [ 2]    4     addw y,#CELL_SIZE 
                                   2559 ; the selector is the element indice 
                                   2560 ; in the list of arguments. {1..#elements} 
      009EC6 3F               [ 1] 2561 	ld a,xl ; keep only bits 7..0
      009EC7 27 62            [ 1] 2562 	jreq 9$ ; element # begin at 1. 
      009EC7 55               [ 1] 2563 	push a  ; selector  
      009EC8 00 03 00         [ 4] 2564 	call next_token
      009ECB 02 80            [ 1] 2565 	cp a,#TK_CMD 
      009ECC 27 03            [ 1] 2566 	jreq 2$ 
      009ECC 5B 08 90         [ 2] 2567 	jp syntax_error 
      009ECF 85 81 B8         [ 4] 2568 2$: call get_code_addr
                                   2569 ;; must be a GOTO or GOSUB 
      009ED1 A3 24 8D         [ 2] 2570 	cpw x,#goto 
      009ED1 CE 00            [ 1] 2571 	jreq 4$
      009ED3 1E 72 B0         [ 2] 2572 	cpw x,#gosub 
      009ED6 00 1C            [ 1] 2573 	jreq 4$ 
      009ED8 81 16 9E         [ 2] 2574 	jp syntax_error 
      009ED9                       2575 4$: 
      009ED9 AE               [ 1] 2576 	pop a 
      009EDA 9F               [ 2] 2577 	pushw x ; save routine address 	
      009EDB 18               [ 1] 2578 	push a  ; selector  
      00243F                       2579 5$: ; skip elements in list until selector==0 
      009EDC CD 8A            [ 1] 2580 	dec (1,sp)
      009EDE 1D CE            [ 1] 2581 	jreq 6$ 
                                   2582 ; can be a line# or a label 
      009EE0 00 1C 35         [ 4] 2583 	call next_token 
      009EE3 10 00            [ 1] 2584 	cp a,#TK_INTGR 
      009EE5 0B CD            [ 1] 2585 	jreq 52$
      009EE7 98 74            [ 1] 2586 	cp a,#TK_LABEL 
      009EE9 35 0A            [ 1] 2587 	jreq 54$
      009EEB 00 0B AE         [ 2] 2588 	jp syntax_error 
      002451                       2589 52$: ; got a line number 
      009EEE 9F 2A CD         [ 1] 2590 	ld a,in ; skip over int24 value 
      009EF1 8A 1D            [ 1] 2591 	add a,#CELL_SIZE ; integer size  
      009EF3 CD 9E D1         [ 1] 2592 	ld in,a 
      009EF6 CD 98            [ 2] 2593 	jra 56$
      009EF8 74 AE 9F         [ 4] 2594 54$: call skip_string ; skip over label 	
      00245E                       2595 56$: ; if another element comma present 
      009EFB 3B CD 8A         [ 4] 2596 	call next_token
      009EFE 1D CE            [ 1] 2597 	cp a,#TK_COMMA 
      009F00 00 1C            [ 1] 2598 	jreq 5$ 
                                   2599 ; arg list exhausted, selector to big 
                                   2600 ; continue execution on next line 
      002465                       2601 	_drop 3 ; drop selector and GOTO|GOSUB address 
      009F02 A3 B6            [ 2]    1     addw sp,#3 
      009F04 04 25            [ 2] 2602 	jra 9$
      002469                       2603 6$: ;at selected position  
      002469                       2604 	_drop 1 ; discard selector
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      009F06 05 AE            [ 2]    1     addw sp,#1 
                                   2605 ; here only the routine address 
                                   2606 ; of GOTO|GOSUB is on stack 
      009F08 9F 42 20         [ 4] 2607     call get_target_line
      009F0B 03 AE 9F         [ 2] 2608 	ldw ptr16,x 	
      009F0E 53 CD 8A 1D A6   [ 1] 2609 	mov in,count ; move to end of line  
      009F13 0D               [ 2] 2610 	popw x ; cmd address, GOTO||GOSUB 
      009F14 CD 89 C0         [ 2] 2611 	cpw x,#goto 
      009F17 81 70            [ 1] 2612 	jrne 7$ 
      009F19 72 6F 67         [ 2] 2613 	ldw x,ptr16 
      009F1C 72 61            [ 2] 2614 	jra jp_to_target
      002481                       2615 7$: 
      009F1E 6D 20            [ 2] 2616 	jra gosub_2 ; target in ptr16 
      002483                       2617 9$: ; expr out of range skip to end of line
                                   2618     ; this will force a fall to next line  
      009F20 61 64 64 72 65   [ 1] 2619 	mov in,count
      002488                       2620 	_drop 2
      009F25 73 73            [ 2]    1     addw sp,#2 
      009F27 3A 20 00         [ 2] 2621 	jp next_line  
                                   2622 
                                   2623 
                                   2624 ;------------------------
                                   2625 ; BASIC: GOTO line# 
                                   2626 ; jump to line# 
                                   2627 ; here cstack is 2 call deep from interpreter 
                                   2628 ;------------------------
      00248D                       2629 goto:
      009F2A 2C 20 70 72 6F   [ 2] 2630 	btjt flags,#FRUN,goto_1  
      009F2F 67 72            [ 1] 2631 	ld a,#ERR_RUN_ONLY
      009F31 61 6D 20         [ 2] 2632 	jp tb_error 
      002497                       2633 goto_1:
      009F34 73 69 7A         [ 4] 2634 	call get_target_line
      00249A                       2635 jp_to_target:
      009F37 65 3A 20         [ 2] 2636 	ldw basicptr,x 
      009F3A 00 20            [ 1] 2637 	ld a,(2,x)
      009F3C 62 79 74         [ 1] 2638 	ld count,a 
      009F3F 65 73 00 20      [ 1] 2639 	mov in,#3 
      009F43 69               [ 4] 2640 	ret 
                                   2641 
                                   2642 
                                   2643 ;--------------------
                                   2644 ; BASIC: GOSUB line#
                                   2645 ; basic subroutine call
                                   2646 ; actual line# and basicptr 
                                   2647 ; are saved on cstack
                                   2648 ; here cstack is 2 call deep from interpreter 
                                   2649 ;--------------------
                           000001  2650 	TARGET=1   ; target address 
                           000003  2651 	RET_ADDR=3 ; subroutine return address 
                           000005  2652 	RET_BPTR=5 ; basicptr return point 
                           000007  2653 	RET_INW=7  ; in.w return point 
                           000004  2654 	VSIZE=4  
      0024A7                       2655 gosub:
      009F44 6E 20 46 4C 41   [ 2] 2656 	btjt flags,#FRUN,gosub_1 
      009F49 53 48            [ 1] 2657 	ld a,#ERR_RUN_ONLY
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      009F4B 20 6D 65         [ 2] 2658 	jp tb_error 
      009F4E 6D               [ 4] 2659 	ret 
      0024B2                       2660 gosub_1:
      009F4F 6F 72 79         [ 4] 2661 	call get_target_line 
      009F52 00 20 69         [ 2] 2662 	ldw ptr16,x 
      0024B8                       2663 gosub_2: 
      009F55 6E               [ 2] 2664 	popw x 
      0024B9                       2665 	_vars VSIZE  
      009F56 20 52            [ 2]    1     sub sp,#VSIZE 
      009F58 41               [ 2] 2666 	pushw x ; RET_ADDR 
      009F59 4D 20 6D         [ 2] 2667 	ldw x,ptr16 
      009F5C 65               [ 2] 2668 	pushw x ; TARGET
                                   2669 ; save BASIC subroutine return point.   
      009F5D 6D 6F 72         [ 2] 2670 	ldw x,basicptr
      009F60 79 00            [ 2] 2671 	ldw (RET_BPTR,sp),x 
      009F62 CE 00 00         [ 2] 2672 	ldw x,in.w 
      009F62 72 01            [ 2] 2673 	ldw (RET_INW,sp),x
      009F64 00               [ 2] 2674 	popw x 
      009F65 23 05            [ 2] 2675 	jra jp_to_target
                                   2676 
                                   2677 ;------------------------
                                   2678 ; BASIC: RETURN 
                                   2679 ; exit from BASIC subroutine 
                                   2680 ;------------------------
                           000003  2681 	RET_BPTR=3 ; basicptr return point 
                           000005  2682 	RET_INW=5  ; in.w return point 
                           000004  2683 	VSIZE=4  
      0024CD                       2684 return:
      009F67 A6 07 CC 97 20   [ 2] 2685 	btjt flags,#FRUN,0$ 
      009F6C A6 06            [ 1] 2686 	ld a,#ERR_RUN_ONLY
      009F6C CD 98 1F         [ 2] 2687 	jp tb_error 
      0024D7                       2688 0$:	
      009F6F A1 04            [ 2] 2689 	ldw x,(RET_ADDR,sp) 
      009F71 26 10 CD         [ 2] 2690 	ldw basicptr,x
      009F74 98 6E            [ 1] 2691 	ld a,(2,x)
      009F76 A4 DF A1         [ 1] 2692 	ld count,a  
      009F79 43 26            [ 2] 2693 	ldw x,(RET_INW,sp)
      009F7B 04 CD 9D         [ 2] 2694 	ldw in.w,x 
      009F7E 45               [ 2] 2695 	popw x 
      0024E7                       2696 	_drop VSIZE 
      009F7F 81 CC            [ 2]    1     addw sp,#VSIZE 
      009F81 97               [ 2] 2697 	pushw x
      009F82 1E               [ 4] 2698 	ret  
                                   2699 
                                   2700 ;----------------------------------
                                   2701 ; BASIC: RUN
                                   2702 ; run BASIC program in RAM
                                   2703 ;----------------------------------- 
      0024EB                       2704 run: 
      009F83 55 00 03 00 02   [ 2] 2705 	btjf flags,#FRUN,0$  
      009F88 CD               [ 1] 2706 	clr a 
      009F89 9E               [ 4] 2707 	ret
      0024F2                       2708 0$: 
      009F8A D1 22 01 81 52   [ 2] 2709 	btjf flags,#FBREAK,1$
      0024F7                       2710 	_drop 2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      009F8F 06 CE            [ 2]    1     addw sp,#2 
      009F91 00 1C 1F         [ 4] 2711 	call rest_context
      0024FC                       2712 	_drop CTXT_SIZE 
      009F94 05 FE            [ 2]    1     addw sp,#CTXT_SIZE 
      009F96 1F 01 AE 7F      [ 1] 2713 	bres flags,#FBREAK 
      009F9A FF 1F 03 CD      [ 1] 2714 	bset flags,#FRUN 
      009F9E 99 DD 4D         [ 2] 2715 	jp interpreter 
      009FA1 27 31 A1         [ 2] 2716 1$:	ldw x,txtbgn
      009FA4 02 27 07         [ 2] 2717 	cpw x,txtend 
      009FA7 A1 01            [ 1] 2718 	jrmi run_it 
      009FA9 27 06 CC         [ 2] 2719 	ldw x,#err_no_prog
      009FAC 97 1E 85         [ 4] 2720 	call puts 
      009FAF 1F 05 03 00 01   [ 1] 2721 	mov in,count
      009FB1 81               [ 4] 2722 	ret 
      00251D                       2723 run_it:	 
      00251D                       2724 	_drop 2 ; drop return address 
      009FB1 85 1F            [ 2]    1     addw sp,#2 
      00251F                       2725 run_it_02: 
      009FB3 01 1C 68         [ 4] 2726     call ubound 
      009FB4 CD 14 52         [ 4] 2727 	call clear_vars 
                                   2728 ; clear data pointer 
      009FB4 CE               [ 1] 2729 	clrw x 
      009FB5 00 1C 1F         [ 2] 2730 	ldw data_ptr,x 
      009FB8 05 C3 00 1E      [ 1] 2731 	clr data_ofs 
      009FBC 2A 38 FE 13      [ 1] 2732 	clr data_len 
                                   2733 ; initialize BASIC pointer 
      009FC0 01 2A 11         [ 2] 2734 	ldw x,txtbgn 
      009FC3 1E 05 E6         [ 2] 2735 	ldw basicptr,x 
      009FC6 02 C7            [ 1] 2736 	ld a,(2,x)
      009FC8 00 0F 72         [ 1] 2737 	ld count,a
      009FCB 5F 00 0E 72      [ 1] 2738 	mov in,#3	
      009FCF BB 00 0E 20      [ 1] 2739 	bset flags,#FRUN 
      009FD3 E3 17 49         [ 2] 2740 	jp interpreter 
                                   2741 
                                   2742 
                                   2743 ;----------------------
                                   2744 ; BASIC: END
                                   2745 ; end running program
                                   2746 ;---------------------- 
      009FD4                       2747 cmd_end: 
                                   2748 ; clean stack 
      009FD4 1E 05 E6         [ 2] 2749 	ldw x,#STACK_EMPTY
      009FD7 02               [ 1] 2750 	ldw sp,x 
      009FD8 CD A0 4B         [ 2] 2751 	jp warm_start
                                   2752 
                                   2753 ;---------------------------
                                   2754 ; BASIC: GET var 
                                   2755 ; receive a key in variable 
                                   2756 ; don't wait 
                                   2757 ;---------------------------
      00254E                       2758 cmd_get:
      009FDB 1E 05 E6         [ 4] 2759 	call next_token 
      009FDE 02 C7            [ 1] 2760 	cp a,#TK_VAR 
      009FE0 00 0F            [ 1] 2761 	jreq 0$
      009FE2 72 5F 00         [ 2] 2762 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      009FE5 0E 72 BB         [ 4] 2763 0$: call get_addr 
      009FE8 00 0E C3         [ 2] 2764 	ldw ptr16,x 
      009FEB 00 1E 2A         [ 4] 2765 	call qgetc 
      009FEE 07 1F            [ 1] 2766 	jreq 2$
      009FF0 05 FE 13         [ 4] 2767 	call getc  
      009FF3 03 2F DE 19      [ 4] 2768 2$: clr [ptr16]
      009FF6 72 5C 00 1A      [ 1] 2769 	inc ptr8 
      009FF6 55 00 04 00      [ 4] 2770 	clr [ptr16]
      009FFA 02 AE 16 B8      [ 1] 2771 	inc ptr8 
      009FFE CF 00 05 5B      [ 4] 2772 	ld [ptr16],a 
      00A002 06               [ 4] 2773 	ret 
                                   2774 
                                   2775 
                                   2776 ;-----------------
                                   2777 ; 1 Khz beep 
                                   2778 ;-----------------
      00257B                       2779 beep_1khz:: 
      00A003 CD 9E            [ 2] 2780 	pushw y 
      00A005 D9 81 64         [ 2] 2781 	ldw x,#100
      00A007 90 AE 03 E8      [ 2] 2782 	ldw y,#1000
      00A007 CD A8            [ 2] 2783 	jra beep
                                   2784 
                                   2785 ;-----------------------
                                   2786 ; BASIC: TONE expr1,expr2
                                   2787 ; used TIMER2 channel 1
                                   2788 ; to produce a tone 
                                   2789 ; arguments:
                                   2790 ;    expr1   frequency 
                                   2791 ;    expr2   duration msec.
                                   2792 ;---------------------------
      002586                       2793 tone:
      00A009 36 27            [ 2] 2794 	pushw y 
      00A00B 07 AE A0         [ 4] 2795 	call arg_list 
      00A00E 34 CD            [ 1] 2796 	cp a,#2 
      00A010 8A 1D            [ 1] 2797 	jreq 1$
      00A012 81 16 9E         [ 2] 2798 	jp syntax_error 
      00A013                       2799 1$: 
      002592                       2800 	_xpop 
      00A013 90 AE            [ 1]    1     ld a,(y)
      00A015 B6               [ 1]    2     ldw x,y 
      00A016 00 CE            [ 2]    3     ldw x,(1,x)
      00A018 B6 02 1C 00      [ 2]    4     addw y,#CELL_SIZE 
      00A01C 04               [ 2] 2801 	pushw x ; duration 
      00259C                       2802 	_xpop ; frequency
      00A01D CF 00            [ 1]    1     ld a,(y)
      00A01F 0E               [ 1]    2     ldw x,y 
      00A020 AE 00            [ 2]    3     ldw x,(1,x)
      00A022 7C CD 94 8E      [ 2]    4     addw y,#CELL_SIZE 
      00A026 AE 00            [ 1] 2803 	ldw y,x ; frequency 
      00A028 80               [ 2] 2804 	popw x  ; duration 
      0025A8                       2805 beep:  
      00A029 CF               [ 2] 2806 	pushw x 
      00A02A 00 1C 72         [ 2] 2807 	ldw x,#TIM2_CLK_FREQ
      00A02D BB               [ 2] 2808 	divw x,y ; cntr=Fclk/freq 
                                   2809 ; round to nearest integer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00A02E 00 7E CF 00      [ 2] 2810 	cpw y,#TIM2_CLK_FREQ/2
      00A032 1E 81            [ 1] 2811 	jrmi 2$
      00A034 4E               [ 1] 2812 	incw x 
      0025B4                       2813 2$:	 
      00A035 6F               [ 1] 2814 	ld a,xh 
      00A036 20 61 70         [ 1] 2815 	ld TIM2_ARRH,a 
      00A039 70               [ 1] 2816 	ld a,xl 
      00A03A 6C 69 63         [ 1] 2817 	ld TIM2_ARRL,a 
                                   2818 ; 50% duty cycle 
      00A03D 61               [ 1] 2819 	ccf 
      00A03E 74               [ 2] 2820 	rrcw x 
      00A03F 69               [ 1] 2821 	ld a,xh 
      00A040 6F 6E 20         [ 1] 2822 	ld TIM2_CCR1H,a 
      00A043 73               [ 1] 2823 	ld a,xl
      00A044 61 76 65         [ 1] 2824 	ld TIM2_CCR1L,a
      00A047 64 2E 0A 00      [ 1] 2825 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A04B 72 10 53 00      [ 1] 2826 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A04B 90 89 C7 00      [ 1] 2827 	bset TIM2_EGR,#TIM2_EGR_UG
      00A04F 04               [ 2] 2828 	popw x 
      00A050 E6 02 C1         [ 4] 2829 	call pause02
      00A053 00 04 2A 03      [ 1] 2830 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A057 C7 00 04 CF      [ 1] 2831 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A05B 00 05            [ 2] 2832 	popw y 
      00A05D 90               [ 4] 2833 	ret 
                                   2834 
                                   2835 ;-------------------------------
                                   2836 ; BASIC: ADCON 0|1 [,divisor]  
                                   2837 ; disable/enanble ADC 
                                   2838 ;-------------------------------
                           000003  2839 	ONOFF=3 
                           000001  2840 	DIVSOR=1
                           000004  2841 	VSIZE=4 
      0025E1                       2842 power_adc:
      00A05E AE 16 68         [ 4] 2843 	call arg_list 
      00A061 CD 92            [ 1] 2844 	cp a,#2	
      00A063 78 CD            [ 1] 2845 	jreq 1$
      00A065 8A 1D            [ 1] 2846 	cp a,#1 
      00A067 A6 0D            [ 1] 2847 	jreq 0$ 
      00A069 CD 89 C0         [ 2] 2848 	jp syntax_error 
      00A06C 90               [ 1] 2849 0$:	clr a 
      00A06D 85               [ 1] 2850 	clrw x
      0025F1                       2851 	_xpush   ; divisor  
      00A06E 81 A2 00 03      [ 2]    1     subw y,#CELL_SIZE
      00A06F 90 F7            [ 1]    2     ld (y),a 
      00A06F 52 01 01         [ 2]    3     ldw (1,y),x 
      00A071                       2852 1$: _at_next 
      00A071 0F 01 03         [ 1]    1     ld a,(3,y)
      00A073 93               [ 1]    2     ldw x,y 
      00A073 CD 98            [ 2]    3     ldw x,(4,x)
      00A075 1F               [ 2] 2853 	tnzw x 
      00A076 A1 02            [ 1] 2854 	jreq 2$ 
      002603                       2855 	_xpop
      00A078 25 08            [ 1]    1     ld a,(y)
      00A07A A1               [ 1]    2     ldw x,y 
      00A07B 0A 27            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      00A07D 04 A1 80 26      [ 2]    4     addw y,#CELL_SIZE 
      00260C                       2856 	_xdrop  
      00A081 07 A9 00 03      [ 2]    1     addw y,#CELL_SIZE 
      00A082 9F               [ 1] 2857 	ld a,xl
      00A082 55 00            [ 1] 2858 	and a,#7
      00A084 03               [ 1] 2859 	swap a 
      00A085 00 02 20         [ 1] 2860 	ld ADC_CR1,a
      00A088 5D 16 50 CA      [ 1] 2861 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A089 72 10 54 01      [ 1] 2862 	bset ADC_CR1,#ADC_CR1_ADON 
      00261F                       2863 	_usec_dly 7 
      00A089 A1 02 27         [ 2]    1     ldw x,#(16*7-2)/4
      00A08C 12               [ 2]    2     decw x
      00A08D A1               [ 1]    3     nop 
      00A08E 04 27            [ 1]    4     jrne .-4
      00A090 1B A1            [ 2] 2864 	jra 3$
      00A092 82 27 1F A1      [ 1] 2865 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A096 08 27 24 A1      [ 1] 2866 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      002630                       2867 3$:	
      00A09A 09               [ 4] 2868 	ret
                                   2869 
                                   2870 ;-----------------------------
                                   2871 ; BASIC: ADCREAD (channel)
                                   2872 ; read adc channel {0..5}
                                   2873 ; output:
                                   2874 ;   A 		TK_INTGR 
                                   2875 ;   X 		value 
                                   2876 ;-----------------------------
      002631                       2877 analog_read:
      00A09B 27 24 20         [ 4] 2878 	call func_args 
      00A09E 37 01            [ 1] 2879 	cp a,#1 
      00A09F 27 03            [ 1] 2880 	jreq 1$
      00A09F CD 8A 1D         [ 2] 2881 	jp syntax_error
      00263B                       2882 1$: _xpop 
      00A0A2 5C 72            [ 1]    1     ld a,(y)
      00A0A4 B0               [ 1]    2     ldw x,y 
      00A0A5 00 05            [ 2]    3     ldw x,(1,x)
      00A0A7 CF 00 01 20      [ 2]    4     addw y,#CELL_SIZE 
      00A0AB C5 00 05         [ 2] 2883 	cpw x,#5 
      00A0AC 23 05            [ 2] 2884 	jrule 2$
      00A0AC CD 98            [ 1] 2885 	ld a,#ERR_BAD_VALUE
      00A0AE 6E CD 89         [ 2] 2886 	jp tb_error 
      00A0B1 C0               [ 1] 2887 2$: ld a,xl
      00A0B2 20 BD 0E         [ 1] 2888 	ld acc8,a 
      00A0B4 A6 05            [ 1] 2889 	ld a,#5
      00A0B4 CD 98 38         [ 1] 2890 	sub a,acc8 
      00A0B7 FD CD 89         [ 1] 2891 	ld ADC_CSR,a
      00A0BA C0 20 B4 02      [ 1] 2892 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A0BD 72 10 54 01      [ 1] 2893 	bset ADC_CR1,#ADC_CR1_ADON
      00A0BD 03 01 20 B2 FB   [ 2] 2894 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00A0C1 CE 54 04         [ 2] 2895 	ldw x,ADC_DRH
      00A0C1 CD 98            [ 1] 2896 	ld a,#TK_INTGR
      00A0C3 1F               [ 4] 2897 	ret 
                                   2898 
                                   2899 ;-----------------------
                                   2900 ; BASIC: DREAD(pin)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



                                   2901 ; Arduino pins 
                                   2902 ; read state of a digital pin 
                                   2903 ; pin# {0..15}
                                   2904 ; output:
                                   2905 ;    A 		TK_INTGR
                                   2906 ;    X      0|1 
                                   2907 ;-------------------------
                           000001  2908 	PINNO=1
                           000001  2909 	VSIZE=1
      00266D                       2910 digital_read:
      00266D                       2911 	_vars VSIZE 
      00A0C4 A1 84            [ 2]    1     sub sp,#VSIZE 
      00A0C6 27 03 CC         [ 4] 2912 	call func_args
      00A0C9 97 1E            [ 1] 2913 	cp a,#1
      00A0CB 27 03            [ 1] 2914 	jreq 1$
      00A0CB CD 98 5E         [ 2] 2915 	jp syntax_error
      002679                       2916 1$: _xpop 
      00A0CE 9F A4            [ 1]    1     ld a,(y)
      00A0D0 0F               [ 1]    2     ldw x,y 
      00A0D1 C7 00            [ 2]    3     ldw x,(1,x)
      00A0D3 24 20 9B 03      [ 2]    4     addw y,#CELL_SIZE 
      00A0D6 A3 00 0F         [ 2] 2917 	cpw x,#15 
      00A0D6 55 00            [ 2] 2918 	jrule 2$
      00A0D8 03 00            [ 1] 2919 	ld a,#ERR_BAD_VALUE
      00A0DA 02 CD 9C         [ 2] 2920 	jp tb_error 
      00A0DD 21 4D 27         [ 4] 2921 2$:	call select_pin 
      00A0E0 05 CD            [ 1] 2922 	ld (PINNO,sp),a
      00A0E2 98 99            [ 1] 2923 	ld a,(GPIO_IDR,x)
      00A0E4 20 8B            [ 1] 2924 	tnz (PINNO,sp)
      00A0E6 27 05            [ 1] 2925 	jreq 8$
      00A0E6 0D               [ 1] 2926 3$: srl a 
      00A0E7 01 26            [ 1] 2927 	dec (PINNO,sp)
      00A0E9 05 A6            [ 1] 2928 	jrne 3$ 
      00A0EB 0D CD            [ 1] 2929 8$: and a,#1 
      00A0ED 89               [ 1] 2930 	clrw x 
      00A0EE C0               [ 1] 2931 	ld xl,a 
      00A0EF 5B               [ 1] 2932 	clr a 
      0026A1                       2933 	_drop VSIZE
      00A0F0 01 81            [ 2]    1     addw sp,#VSIZE 
      00A0F2 81               [ 4] 2934 	ret
                                   2935 
                                   2936 
                                   2937 ;-----------------------
                                   2938 ; BASIC: DWRITE pin,0|1
                                   2939 ; Arduino pins 
                                   2940 ; write to a digital pin 
                                   2941 ; pin# {0..15}
                                   2942 ; output:
                                   2943 ;    A 		TK_INTGR
                                   2944 ;    X      0|1 
                                   2945 ;-------------------------
                           000001  2946 	PINNO=1
                           000002  2947 	PINVAL=2
                           000002  2948 	VSIZE=2
      0026A4                       2949 digital_write:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      0026A4                       2950 	_vars VSIZE 
      00A0F2 CE 00            [ 2]    1     sub sp,#VSIZE 
      00A0F4 05 1F 03         [ 4] 2951 	call arg_list  
      00A0F7 C6 00            [ 1] 2952 	cp a,#2 
      00A0F9 02 6B            [ 1] 2953 	jreq 1$
      00A0FB 05 C6 00         [ 2] 2954 	jp syntax_error
      0026B0                       2955 1$: _xpop 
      00A0FE 04 6B            [ 1]    1     ld a,(y)
      00A100 06               [ 1]    2     ldw x,y 
      00A101 81 01            [ 2]    3     ldw x,(1,x)
      00A102 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A102 1E               [ 1] 2956 	ld a,xl 
      00A103 03 CF            [ 1] 2957 	ld (PINVAL,sp),a
      0026BC                       2958 	_xpop 
      00A105 00 05            [ 1]    1     ld a,(y)
      00A107 7B               [ 1]    2     ldw x,y 
      00A108 05 C7            [ 2]    3     ldw x,(1,x)
      00A10A 00 02 7B 06      [ 2]    4     addw y,#CELL_SIZE 
      00A10E C7 00 04         [ 2] 2959 	cpw x,#15 
      00A111 81 05            [ 2] 2960 	jrule 2$
      00A112 A6 0A            [ 1] 2961 	ld a,#ERR_BAD_VALUE
      00A112 90 89 52         [ 2] 2962 	jp tb_error 
      00A115 05 2B 59         [ 4] 2963 2$:	call select_pin 
      00A116 6B 01            [ 1] 2964 	ld (PINNO,sp),a 
      00A116 0F 05            [ 1] 2965 	ld a,#1
      00A118 CD 98            [ 1] 2966 	tnz (PINNO,sp)
      00A11A 1F A1            [ 1] 2967 	jreq 4$
      00A11C 02               [ 1] 2968 3$: sll a
      00A11D 26 10            [ 1] 2969 	dec (PINNO,sp)
      00A11F CD 8A            [ 1] 2970 	jrne 3$
      00A121 1D 5C            [ 1] 2971 4$: tnz (PINVAL,sp)
      00A123 72 B0            [ 1] 2972 	jrne 5$
      00A125 00               [ 1] 2973 	cpl a 
      00A126 05 CF            [ 1] 2974 	and a,(GPIO_ODR,x)
      00A128 00 01            [ 2] 2975 	jra 8$
      00A12A 03 05            [ 1] 2976 5$: or a,(GPIO_ODR,x)
      00A12C CD 98            [ 1] 2977 8$: ld (GPIO_ODR,x),a 
      0026EC                       2978 	_drop VSIZE 
      00A12E 1F A1            [ 2]    1     addw sp,#VSIZE 
      00A130 85               [ 4] 2979 	ret
                                   2980 
                                   2981 
                                   2982 ;-----------------------
                                   2983 ; BASIC: STOP
                                   2984 ; stop progam execution  
                                   2985 ; without resetting pointers 
                                   2986 ; the program is resumed
                                   2987 ; with RUN 
                                   2988 ;-------------------------
      0026EF                       2989 stop:
      00A131 27 03 CC 97 1E   [ 2] 2990 	btjt flags,#FRUN,2$
      00A136 CD               [ 1] 2991 	clr a
      00A137 98               [ 4] 2992 	ret 
      0026F6                       2993 2$:	 
                                   2994 ; create space on cstack to save context 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00A138 54 CF 00         [ 2] 2995 	ldw x,#break_point 
      00A13B 1A 0D 05         [ 4] 2996 	call puts 
      0026FC                       2997 	_drop 2 ;drop return address 
      00A13E 26 06            [ 2]    1     addw sp,#2 
      0026FE                       2998 	_vars CTXT_SIZE ; context size 
      00A140 CD 92            [ 2]    1     sub sp,#CTXT_SIZE 
      00A142 4D CD 89         [ 4] 2999 	call save_context 
      00A145 C0 16 68         [ 2] 3000 	ldw x,#tib 
      00A146 CF 00 04         [ 2] 3001 	ldw basicptr,x
      00A146 A6               [ 1] 3002 	clr (x)
      00A147 3A CD 89 C0      [ 1] 3003 	clr count  
      00A14B CD               [ 1] 3004 	clrw x 
      00A14C A0 F2 72         [ 2] 3005 	ldw in.w,x
      00A14F 5F 00 04 CD      [ 1] 3006 	bres flags,#FRUN 
      00A153 8B 22 AE 16      [ 1] 3007 	bset flags,#FBREAK
      00A157 68 3B 00         [ 2] 3008 	jp interpreter 
      00A15A 04 4B 00 72 FB 01 5C  3009 break_point: .asciz "\nbreak point, RUN to resume.\n"
             5B 02 72 5F 00 02 CD
             8F 97 A1 84 27 14 A1
             11 26 07 CD 8F 97 A1
             84 27
                                   3010 
                                   3011 ;-----------------------
                                   3012 ; BASIC: NEW
                                   3013 ; from command line only 
                                   3014 ; free program memory
                                   3015 ; and clear variables 
                                   3016 ;------------------------
      00273B                       3017 new: 
      00A178 06 01 00 22 01   [ 2] 3018 	btjf flags,#FRUN,0$ 
      00A179 81               [ 4] 3019 	ret 
      002741                       3020 0$:	
      00A179 CD A1 02         [ 4] 3021 	call clear_basic 
      00A17C CC               [ 4] 3022 	ret 
                                   3023 
                                   3024 ;-----------------------------------
                                   3025 ; BASIC: ERASE \E | \F 
                                   3026 ; erase all block in range from 
                                   3027 ;  'app_space' to FLASH end (0x20000)
                                   3028 ;  or all EEPROM 
                                   3029 ; that contains a non zero byte.  
                                   3030 ;-----------------------------------
                           000001  3031 	LIMIT=1 
                           000003  3032 	VSIZE = 3 
      002745                       3033 erase:
      00A17D 97 1E 00 18      [ 1] 3034 	clr farptr 
      00A17F                       3035 	_vars VSIZE 
      00A17F CD 82            [ 2]    1     sub sp,#VSIZE 
      00A181 89 17 9F         [ 4] 3036 	call next_token 
      00A182 A1 04            [ 1] 3037 	cp a,#TK_CHAR 
      00A182 C6 00            [ 1] 3038 	jreq 0$ 
      00A184 0D CE 00         [ 2] 3039 	jp syntax_error
      00A187 0E 72 C7         [ 4] 3040 0$: call get_char 
      00A18A 00 1A            [ 1] 3041 	and a,#0XDF 
      00A18C 72 5C            [ 1] 3042 	cp a,#'E
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      00A18E 00 1B            [ 1] 3043 	jrne 1$
      00A190 72 CF 00         [ 2] 3044 	ldw x,#EEPROM_BASE 
      00A193 1A CD A1         [ 2] 3045 	ldw farptr+1,x 
      00A196 02 CD 98         [ 2] 3046 	ldw x,#EEPROM_END
      00A199 1F               [ 1] 3047 	clr a 
      00A19A A1 08            [ 2] 3048 	jra 3$ 
      00A19C 26 03            [ 1] 3049 1$: cp a,#'F 
      00A19E CC A1            [ 1] 3050 	jreq 2$
      00A1A0 16 15 DE         [ 2] 3051 	ldw x,#err_bad_value
      00A1A1 CC 16 A0         [ 2] 3052 	jp tb_error
      002774                       3053 2$:
      00A1A1 A1 00 27         [ 2] 3054 	ldw x,#app_space  
      00A1A4 07 A1 0A         [ 2] 3055 	ldw farptr+1,x 
      00A1A7 27 03            [ 1] 3056 	ld a,#(FLASH_END>>16)&0XFF 
      00A1A9 CC 97 1E         [ 2] 3057 	ldw x,#FLASH_END&0xffff
      00A1AC                       3058 3$:
      00A1AC 5B 05            [ 1] 3059 	ld (LIMIT,sp),a 
      00A1AE 90 85            [ 2] 3060 	ldw (LIMIT+1,sp),x 
                                   3061  ; operation done from RAM
                                   3062  ; copy code to RAM in tib   
      00A1B0 81 07 3E         [ 4] 3063 	call move_erase_to_ram
      00A1B1                       3064 4$:	 
      00A1B1 55 00 04         [ 4] 3065     call scan_block 
      00A1B4 00 02            [ 1] 3066 	jreq 5$  ; block already erased 
      00A1B6 81 45            [ 1] 3067     ld a,#'E 
      00A1B7 CD 09 40         [ 4] 3068     call putc 
      00A1B7 52 04 0F         [ 4] 3069 	call block_erase   
                                   3070 ; this block is clean, next  
      00A1BA 01 CD 99         [ 2] 3071 5$:	ldw x,#BLOCK_SIZE
      00A1BD DD A1 02         [ 4] 3072 	call incr_farptr
                                   3073 ; check limit, 24 bit substraction  	
      00A1C0 24 03            [ 1] 3074 	ld a,(LIMIT,sp)
      00A1C2 CC 97            [ 2] 3075 	ldw x,(LIMIT+1,sp)
      00A1C4 1E A1 03 25      [ 2] 3076 	subw x,farptr+1
      00A1C8 0C 90 F6         [ 1] 3077 	sbc a,farptr 
      00A1CB 93 EE            [ 1] 3078 	jrugt 4$ 
      00A1CD 01 72 A9         [ 4] 3079 9$: call clear_basic
      00A1D0 00 03            [ 2] 3080 	ldw x,(LIMIT+1,sp)
      00A1D2 9F 6B 01         [ 2] 3081 	cpw x,#EEPROM_END
      00A1D5 90 F6            [ 1] 3082 	jrne 10$
      00A1D7 93 EE 01         [ 4] 3083 	call func_eefree 
      0027B3                       3084 10$:
      0027B3                       3085 	_drop VSIZE 
      00A1DA 72 A9            [ 2]    1     addw sp,#VSIZE 
      00A1DC 00               [ 4] 3086 	ret 
                                   3087 	
                                   3088 
                                   3089 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3090 ;  check for application signature 
                                   3091 ; output:
                                   3092 ;   Carry    0 app present 
                                   3093 ;            1 no app installed  
                                   3094 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027B6                       3095 qsign: 
      00A1DD 03 9F 6B         [ 2] 3096 	ldw x,app_sign 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



      00A1E0 02 90 F6         [ 2] 3097 	cpw x,SIGNATURE ; "BC" 
      00A1E3 93               [ 4] 3098 	ret 
                                   3099 
                                   3100 ;--------------------------------------
                                   3101 ;  fill write buffer 
                                   3102 ;  input:
                                   3103 ;    y  point to output buffer 
                                   3104 ;    x  point to source 
                                   3105 ;    a  bytes to write in buffer 
                                   3106 ;  output:
                                   3107 ;    y   += A 
                                   3108 ;    X   += A 
                                   3109 ;    A   0 
                                   3110 ;---------------------------------------
      0027BD                       3111 fill_write_buffer:
      00A1E4 EE               [ 1] 3112 	push a 
      00A1E5 01               [ 1] 3113 	tnz a 
      00A1E6 72 A9            [ 1] 3114 	jreq 9$ 
      00A1E8 00               [ 1] 3115 1$: ld a,(x)
      00A1E9 03               [ 1] 3116 	incw x 
      00A1EA F6 14            [ 1] 3117 	ld (y),a 
      00A1EC 02 18            [ 1] 3118 	incw y 
      00A1EE 01 27            [ 1] 3119 	dec (1,sp) 
      00A1F0 F9 5B            [ 1] 3120 	jrne 1$ 
      00A1F2 04               [ 1] 3121 9$:	pop a 
      00A1F3 81               [ 4] 3122     ret 	
                                   3123 
                                   3124 ;--------------------------------------
                                   3125 ;  fill pad buffer with zero 
                                   3126 ;  input:
                                   3127 ;	none 
                                   3128 ;  output:
                                   3129 ;    y     buffer address  
                                   3130 ;--------------------------------------
      00A1F4                       3131 clear_block_buffer:
      00A1F4 CD               [ 1] 3132 	push a 
      00A1F5 99 DD A1 02      [ 2] 3133 	ldw y,#block_buffer 
      00A1F9 27 03            [ 2] 3134 	pushw y
      00A1FB CC 97            [ 1] 3135 	ld a,#BLOCK_SIZE   
      00A1FD 1E 7F            [ 1] 3136 1$:	clr (y)
      00A1FE 90 5C            [ 1] 3137 	incw y
      00A1FE 90               [ 1] 3138 	dec a  
      00A1FF F6 93            [ 1] 3139 	jrne 1$ 	
      00A201 EE 01            [ 2] 3140 9$: popw y 
      00A203 72               [ 1] 3141 	pop a 			
      00A204 A9               [ 4] 3142 	ret 
                                   3143 
                                   3144 
                                   3145 ;---------------------------------------
                                   3146 ; BASIC: SAVE
                                   3147 ; write application from RAM to FLASH
                                   3148 ;--------------------------------------
                           000001  3149 	XTEMP=1
                           000003  3150 	COUNT=3  ; last count bytes written 
                           000004  3151 	CNT_LO=4 ; count low byte 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



                           000005  3152 	TOWRITE=5 ; how bytes left to write  
                           000006  3153 	VSIZE=6 
      0027E1                       3154 save_app:
      00A205 00               [ 2] 3155 	pushw x 
      00A206 03 9F            [ 2] 3156 	pushw y 
      0027E4                       3157 	_vars VSIZE
      00A208 88 90            [ 2]    1     sub sp,#VSIZE 
      00A20A F6 93 EE         [ 4] 3158 	call qsign 
      00A20D 01 72            [ 1] 3159 	jrne 1$
      00A20F A9 00 03         [ 2] 3160 	ldw x,#CANT_DO 
      00A212 84 FA F7         [ 4] 3161 	call puts 
      00A215 81 28 70         [ 2] 3162 	jp 9$
      00A216                       3163 1$: 
      00A216 CD 99 DD         [ 2] 3164 	ldw x,txtbgn
      00A219 A1 02 27         [ 2] 3165 	cpw x,txtend 
      00A21C 03 CC            [ 1] 3166 	jrult 2$ 
      00A21E 97 1E BA         [ 2] 3167 	ldw x,#NO_APP
      00A220 CD 09 9D         [ 4] 3168 	call puts 
      00A220 90 F6 93         [ 2] 3169 	jp 9$
      002805                       3170 2$: 
                                   3171 ; block programming flash
                                   3172 ; must be done from RAM
                                   3173 ; moved in tib  
      00A223 EE 01 72         [ 4] 3174 	call move_prg_to_ram
                                   3175 ; initialize farptr 
                                   3176 ; to app_sign address 
      00A226 A9 00 03 9F      [ 1] 3177 	clr farptr 
      00A22A 43 88 90         [ 2] 3178 	ldw x,#app_sign 
      00A22D F6 93 EE         [ 2] 3179 	ldw farptr+1,x
                                   3180 ; initialize local variables 
      00A230 01 72 A9         [ 4] 3181 	call prog_size
      00A233 00 03            [ 2] 3182 	ldw (TOWRITE,sp),x
      00A235 84 F4            [ 1] 3183 	clr (COUNT,sp)
                                   3184 ; first bock 
                                   3185 ; containt signature 2 bytes 
                                   3186 ; and size 	2 bytes 
                                   3187 ; use Y as pointer to block_buffer
      00A237 F7 81 CD         [ 4] 3188 	call clear_block_buffer ; -- y=*block_buffer	
                                   3189 ; write signature
      00A239 CE 28 76         [ 2] 3190 	ldw x,SIGNATURE ; "BC" 
      00A239 CD 99            [ 2] 3191 	ldw (y),x 
      00A23B DD A1 02 27      [ 2] 3192 	addw y,#2
      00A23F 03 CC            [ 2] 3193 	ldw x,(TOWRITE,sp)
      00A241 97 1E            [ 2] 3194 	ldw (y),x
      00A243 90 F6 93 EE      [ 2] 3195 	addw y,#2   
      00A247 01 72            [ 1] 3196 	ld a,#(BLOCK_SIZE-4)
      00A249 A9 00            [ 1] 3197 	ld (CNT_LO,sp),a 
      00A24B 03 9F 88         [ 2] 3198 	cpw x,#(BLOCK_SIZE-4) 
      00A24E 90 F6            [ 1] 3199 	jrugt 3$
      00A250 93               [ 1] 3200 	ld a,xl 
      00A251 EE 01            [ 1] 3201 3$:	ld (CNT_LO,sp),a   
      00A253 72 A9 00         [ 2] 3202 	ldw x,txtbgn 
      00A256 03 84            [ 2] 3203 	ldw (XTEMP,sp),x 
      00283E                       3204 32$: 
      00A258 F8 F7            [ 2] 3205 	ldw x,(XTEMP,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00A25A 81 04            [ 1] 3206 	ld a,(CNT_LO,sp)
      00A25B CD 27 BD         [ 4] 3207 	call fill_write_buffer 
      00A25B CD 99            [ 2] 3208 	ldw (XTEMP,sp),x 
      00A25D D8 A1 02         [ 2] 3209 	ldw x,#block_buffer
      00A260 27 03 CC         [ 4] 3210 	call write_buffer
      00A263 97 1E 80         [ 2] 3211 	ldw x,#BLOCK_SIZE 
      00A265 CD 08 B2         [ 4] 3212 	call incr_farptr  
                                   3213 ; following blocks 
      00A265 90 F6            [ 2] 3214 	ldw x,(XTEMP,sp)
      00A267 93 EE 01         [ 2] 3215 	cpw x,txtend 
      00A26A 72 A9            [ 1] 3216 	jruge 9$ 
      00A26C 00 03            [ 2] 3217 	ldw x,(TOWRITE,sp)
      00A26E 9F A4 07         [ 2] 3218 	subw x,(COUNT,sp)
      00A271 88 A6            [ 2] 3219 	ldw (TOWRITE,sp),x 
      00A273 01 0D            [ 1] 3220 	ld a,#BLOCK_SIZE 
      00A275 01 27 05         [ 2] 3221 	cpw x,#BLOCK_SIZE 
      00A278 48 0A            [ 1] 3222 	jruge 4$ 
      00A27A 01               [ 1] 3223 	ld a,xl 
      00A27B 20 F7            [ 1] 3224 4$:	ld (CNT_LO,sp),a 
      00A27D 6B 01 90         [ 4] 3225 	call clear_block_buffer 
      00A280 F6 93            [ 2] 3226 	jra 32$ 
      002870                       3227 9$:	_drop VSIZE 
      00A282 EE 01            [ 2]    1     addw sp,#VSIZE 
      00A284 72 A9            [ 2] 3228     popw y 
      00A286 00               [ 2] 3229 	popw x 
      00A287 03               [ 4] 3230 	ret 
                                   3231 
                                   3232 
      00A288 84 F4                 3233 SIGNATURE: .ascii "BC"
      00A28A 27 02 A6 01 5F 97 4F  3234 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE \F before"
             81 61 73 68 20 61 70
             70 6C 69 63 61 74 69
             6F 6E 2C 20 61 6C 72
             65 61 64 79 20 6F 6E
             65 20 69 6E 20 46 4C
             41 53 48 0A 75 73 65
             20 45 52 41 53 45 20
             5C 46 20 62 65 66 6F
             72 65 00
      00A292 4E 6F 20 61 70 70 6C  3235 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
             20 69 6E 20 52 41 4D
             00
                                   3236 
                                   3237 ;---------------------
                                   3238 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3239 ; write 1 or more byte to FLASH or EEPROM
                                   3240 ; starting at address  
                                   3241 ; input:
                                   3242 ;   expr1  	is address 
                                   3243 ;   expr2,...,exprn   are bytes to write
                                   3244 ; output:
                                   3245 ;   none 
                                   3246 ;---------------------
      0028D0                       3247 write:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



      00A292 CD 99 DD         [ 4] 3248 	call expression
      00A295 A1 02            [ 1] 3249 	cp a,#TK_INTGR 
      00A297 27 03            [ 1] 3250 	jreq 0$
      00A299 CC 97 1E         [ 2] 3251 	jp syntax_error
      00A29C                       3252 0$: _xpop 
      00A29C 90 F6            [ 1]    1     ld a,(y)
      00A29E 93               [ 1]    2     ldw x,y 
      00A29F EE 01            [ 2]    3     ldw x,(1,x)
      00A2A1 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A2A5 9F 88 90         [ 1] 3253 	ld farptr,a 
      00A2A8 F6 93 EE         [ 2] 3254 	ldw ptr16,x 
      0028E9                       3255 1$:	
      00A2AB 01 72 A9         [ 4] 3256 	call next_token 
      00A2AE 00 03            [ 1] 3257 	cp a,#TK_COMMA 
      00A2B0 84 F7            [ 1] 3258 	jreq 2$ 
      00A2B2 81 20            [ 2] 3259 	jra 9$ ; no more data 
      00A2B3 CD 1A 88         [ 4] 3260 2$:	call expression
      00A2B3 CD 99            [ 1] 3261 	cp a,#TK_INTGR
      00A2B5 D8 A1            [ 1] 3262 	jreq 3$
      00A2B7 01 27 03         [ 2] 3263 	jp syntax_error
      0028FC                       3264 3$:	_xpop 
      00A2BA CC 97            [ 1]    1     ld a,(y)
      00A2BC 1E               [ 1]    2     ldw x,y 
      00A2BD 90 F6            [ 2]    3     ldw x,(1,x)
      00A2BF 93 EE 01 72      [ 2]    4     addw y,#CELL_SIZE 
      00A2C3 A9               [ 1] 3265 	ld a,xl 
      00A2C4 00               [ 1] 3266 	clrw x 
      00A2C5 03 C7 00         [ 4] 3267 	call write_byte
      00A2C8 19 CF 00         [ 2] 3268 	ldw x,#1 
      00A2CB 1A 92 BC         [ 4] 3269 	call incr_farptr 
      00A2CE 00 19            [ 2] 3270 	jra 1$ 
      002912                       3271 9$:
      00A2D0 5F               [ 4] 3272 	ret 
                                   3273 
                                   3274 
                                   3275 ;---------------------
                                   3276 ;BASIC: CHAR(expr)
                                   3277 ; évaluate expression 
                                   3278 ; and take the 7 least 
                                   3279 ; bits as ASCII character
                                   3280 ; output: 
                                   3281 ; 	A char 
                                   3282 ;---------------------
      002913                       3283 char:
      00A2D1 97 4F 81         [ 4] 3284 	call func_args 
      00A2D4 A1 01            [ 1] 3285 	cp a,#1
      00A2D4 CD 9C            [ 1] 3286 	jreq 1$
      00A2D6 21 90 F6         [ 2] 3287 	jp syntax_error
      00291D                       3288 1$:	_xpop
      00A2D9 93 EE            [ 1]    1     ld a,(y)
      00A2DB 01               [ 1]    2     ldw x,y 
      00A2DC 72 A9            [ 2]    3     ldw x,(1,x)
      00A2DE 00 03 4D 26      [ 2]    4     addw y,#CELL_SIZE 
      00A2E2 0D               [ 1] 3289 	ld a,xl
      00A2E3 5D 26            [ 1] 3290 	and a,#0x7f 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



      00A2E5 0A               [ 4] 3291 	ret
                                   3292 
                                   3293 ;---------------------
                                   3294 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3295 ; extract first character 
                                   3296 ; of string argument 
                                   3297 ; output:
                                   3298 ;    A:X    int24 
                                   3299 ;---------------------
      00292A                       3300 ascii:
      00A2E6 55 00            [ 1] 3301 	ld a,#TK_LPAREN
      00A2E8 04 00 02         [ 4] 3302 	call expect 
      00A2EB 5B 02 CC         [ 4] 3303 	call next_token 
      00A2EE 97 D1            [ 1] 3304 	cp a,#TK_QSTR 
      00A2F0 81 0E            [ 1] 3305 	jreq 1$
      00A2F1 A1 04            [ 1] 3306 	cp a,#TK_CHAR 
      00A2F1 85 52            [ 1] 3307 	jreq 2$ 
      00A2F3 0D 89            [ 1] 3308 	cp a,#TK_CFUNC 
      00A2F5 A6 85            [ 1] 3309 	jreq 0$
      00A2F7 CD 99 CB         [ 2] 3310 	jp syntax_error
      002941                       3311 0$: ; cfunc 
      00A2FA CD               [ 4] 3312 	call (x)
      00A2FB 98 54            [ 2] 3313 	jra 3$
      002944                       3314 1$: ; quoted string 
      00A2FD 1F               [ 1] 3315 	ld a,(x)
      00A2FE 09               [ 1] 3316 	push a  
      00A2FF CD 9D 09         [ 4] 3317 	call skip_string
      00A302 72               [ 1] 3318 	pop a  	
      00A303 14 00            [ 2] 3319 	jra 3$ 
      00294C                       3320 2$: ; character 
      00A305 23 CD 98         [ 4] 3321 	call get_char 
      00A308 1F               [ 1] 3322 3$:	clrw x 
      00A309 A1               [ 1] 3323 	rlwa x   
      002951                       3324 4$:	_xpush  
      00A30A 80 27 03 CC      [ 2]    1     subw y,#CELL_SIZE
      00A30E 97 1E            [ 1]    2     ld (y),a 
      00A310 90 EF 01         [ 2]    3     ldw (1,y),x 
      00A310 CD 98            [ 1] 3325 	ld a,#TK_RPAREN 
      00A312 38 A3 A3         [ 4] 3326 	call expect
      00295F                       3327 9$:	
      00295F                       3328 	_xpop  
      00A315 1B 27            [ 1]    1     ld a,(y)
      00A317 03               [ 1]    2     ldw x,y 
      00A318 CC 97            [ 2]    3     ldw x,(1,x)
      00A31A 1E A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A31B 81               [ 4] 3329 	ret 
                                   3330 
                                   3331 ;---------------------
                                   3332 ;BASIC: KEY
                                   3333 ; wait for a character 
                                   3334 ; received from STDIN 
                                   3335 ; input:
                                   3336 ;	none 
                                   3337 ; output:
                                   3338 ;	a	 character 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



                                   3339 ;---------------------
      002969                       3340 key:
      00A31B 72 04 00         [ 4] 3341 	call getc 
      00A31E 23               [ 4] 3342 	ret
                                   3343 
                                   3344 ;----------------------
                                   3345 ; BASIC: QKEY
                                   3346 ; Return true if there 
                                   3347 ; is a character in 
                                   3348 ; waiting in STDIN 
                                   3349 ; input:
                                   3350 ;  none 
                                   3351 ; output:
                                   3352 ;   A     0|-1
                                   3353 ;-----------------------
      00296D                       3354 qkey:: 
      00A31F 03               [ 1] 3355 	clrw x 
      00A320 CC 97 1E         [ 1] 3356 	ld a,rx1_head
      00A323 CD 9B 08         [ 1] 3357 	sub a,rx1_tail 
      00A326 A1 84            [ 1] 3358 	jreq 9$ 
      00A328 27               [ 2] 3359 	cplw x
      00A329 03 CC            [ 1] 3360 	ld a,#255    
      002979                       3361 9$: 
      00A32B 97               [ 4] 3362 	ret 
                                   3363 
                                   3364 ;---------------------
                                   3365 ; BASIC: GPIO(port,reg)
                                   3366 ; return gpio register address 
                                   3367 ; expr {PORTA..PORTI}
                                   3368 ; input:
                                   3369 ;   none 
                                   3370 ; output:
                                   3371 ;   A:X 	gpio register address
                                   3372 ;----------------------------
                                   3373 ;	N=PORT
                                   3374 ;	T=REG 
      00297A                       3375 gpio:
      00A32C 1E 90 F6         [ 4] 3376 	call func_args 
      00A32F 93 EE            [ 1] 3377 	cp a,#2
      00A331 01 72            [ 1] 3378 	jreq 1$
      00A333 A9 00 03         [ 2] 3379 	jp syntax_error  
      002984                       3380 1$:	_at_next 
      00A336 6B 06 1F         [ 1]    1     ld a,(3,y)
      00A339 07               [ 1]    2     ldw x,y 
      00A33A CD 98            [ 2]    3     ldw x,(4,x)
      00A33C 1F A1 00         [ 2] 3381 	cpw x,#PA_BASE 
      00A33F 27 11            [ 1] 3382 	jrmi bad_port
      00A341 A1 80 26         [ 2] 3383 	cpw x,#PI_BASE+1 
      00A344 08 CD            [ 1] 3384 	jrpl bad_port
      00A346 98               [ 2] 3385 	pushw x 
      002995                       3386 	_xpop
      00A347 38 A3            [ 1]    1     ld a,(y)
      00A349 A3               [ 1]    2     ldw x,y 
      00A34A 5B 27            [ 2]    3     ldw x,(1,x)
      00A34C 0E A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



      00A34D 72 FB 01         [ 2] 3387 	addw x,(1,sp)
      0029A1                       3388 	_drop 2 
      00A34D 55 00            [ 2]    1     addw sp,#2 
      00A34F 03               [ 1] 3389 	clr a 
      00A350 00               [ 4] 3390 	ret
      0029A5                       3391 bad_port:
      00A351 02 0A            [ 1] 3392 	ld a,#ERR_BAD_VALUE
      00A352 CC 16 A0         [ 2] 3393 	jp tb_error
                                   3394 
                                   3395 
                                   3396 ;-------------------------
                                   3397 ; BASIC: UFLASH 
                                   3398 ; return free flash address
                                   3399 ; input:
                                   3400 ;  none 
                                   3401 ; output:
                                   3402 ;	A		TK_INTGR
                                   3403 ;   xstack	free address 
                                   3404 ;---------------------------
      0029AA                       3405 uflash:
      00A352 0F 03 AE         [ 4] 3406 	call qsign 
      00A355 00 01            [ 1] 3407 	jrne 1$
      00A357 1F 04 20         [ 2] 3408 	ldw x,#app_space 
      00A35A 2F BB 35 82      [ 2] 3409 	addw x,app_size 
      00A35B 1C 00 04         [ 2] 3410 	addw x,#4
                                   3411 ; align on 128 bytes block 
      00A35B 72 04 00         [ 2] 3412 	addw x,#BLOCK_SIZE 
      00A35E 23               [ 1] 3413 	ld a,xl 
      00A35F 03 CC            [ 1] 3414 	and a,#0x80 
      00A361 97               [ 1] 3415 	ld xl,a 
      00A362 1E CD            [ 2] 3416 	jra 2$
      00A364 9B 08 A1         [ 2] 3417 1$:	ldw x,#app_space 
      0029C5                       3418 2$:
      00A367 84               [ 1] 3419 	clr a 
      00A368 27               [ 4] 3420 	ret 
                                   3421 
                                   3422 
                                   3423 ;---------------------
                                   3424 ; BASIC: USR(addr,arg)
                                   3425 ; execute a function written 
                                   3426 ; in binary code.
                                   3427 ; input:
                                   3428 ;   addr	routine address 
                                   3429 ;   arg 	is an argument
                                   3430 ;           it can be ignore 
                                   3431 ;           by cally. 
                                   3432 ; output:
                                   3433 ;   xstack 	value returned by cally  
                                   3434 ;---------------------
      0029C7                       3435 usr:
      00A369 03 CC 97         [ 4] 3436 	call func_args 
      00A36C 1E 02            [ 1] 3437 	cp a,#2
      00A36D 27 03            [ 1] 3438 	jreq 1$  
      00A36D 90 F6 93         [ 2] 3439 	jp syntax_error 
      0029D1                       3440 1$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



      0029D1                       3441 	_at_next ; A:X addr 
      00A370 EE 01 72         [ 1]    1     ld a,(3,y)
      00A373 A9               [ 1]    2     ldw x,y 
      00A374 00 03            [ 2]    3     ldw x,(4,x)
      00A376 6B 03 1F         [ 2] 3442 	ldw ptr16,X 
      0029DA                       3443 	_xpop  ; arg 
      00A379 04 4D            [ 1]    1     ld a,(y)
      00A37B 2A               [ 1]    2     ldw x,y 
      00A37C 0D 7B            [ 2]    3     ldw x,(1,x)
      00A37E 06 1E 07 1D      [ 2]    4     addw y,#CELL_SIZE 
      0029E3                       3444 	_store_top ; overwrite addr 
      00A382 00 01            [ 1]    1     ld (y),a 
      00A384 A2 00 6B         [ 2]    2     ldw (1,y),x     
      00A387 06 1F 07 19      [ 6] 3445     call [ptr16]
      00A38A 81               [ 4] 3446 	ret 
                                   3447 
                                   3448 
                                   3449 ;------------------------------
                                   3450 ; BASIC: BYE 
                                   3451 ; halt mcu in its lowest power mode 
                                   3452 ; wait for reset or external interrupt
                                   3453 ; do a cold start on wakeup.
                                   3454 ;------------------------------
      0029ED                       3455 bye:
      00A38A CE 00 05 1F 0D   [ 2] 3456 	btjf UART1_SR,#UART_SR_TC,.
      00A38F CE               [10] 3457 	halt
      00A390 00 01 1F         [ 2] 3458 	jp cold_start  
                                   3459 
                                   3460 ;----------------------------------
                                   3461 ; BASIC: SLEEP 
                                   3462 ; halt mcu until reset or external
                                   3463 ; interrupt.
                                   3464 ; Resume progam after SLEEP command
                                   3465 ;----------------------------------
      0029F6                       3466 sleep:
      00A393 0B 72 15 00 23   [ 2] 3467 	btjf UART1_SR,#UART_SR_TC,.
      00A398 72 5C 00 20      [ 1] 3468 	bset flags,#FSLEEP
      00A39C 81               [10] 3469 	halt 
      00A39D 81               [ 4] 3470 	ret 
                                   3471 
                                   3472 ;-------------------------------
                                   3473 ; BASIC: PAUSE expr 
                                   3474 ; suspend execution for n msec.
                                   3475 ; input:
                                   3476 ;	none
                                   3477 ; output:
                                   3478 ;	none 
                                   3479 ;------------------------------
      002A01                       3480 pause:
      00A39D 72 5D 00         [ 4] 3481 	call expression
      00A3A0 20 26            [ 1] 3482 	cp a,#TK_INTGR
      00A3A2 03 CC            [ 1] 3483 	jreq 1$ 
      00A3A4 97 1E 9E         [ 2] 3484 	jp syntax_error
      00A3A6                       3485 1$: _xpop 
      00A3A6 A6 85            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



      00A3A8 CD               [ 1]    2     ldw x,y 
      00A3A9 99 CB            [ 2]    3     ldw x,(1,x)
      00A3AB CD 98 54 13      [ 2]    4     addw y,#CELL_SIZE 
      002A14                       3486 pause02:
      00A3AF 09 27 03         [ 2] 3487 	ldw timer,x 
      00A3B2 CC 97 1E         [ 2] 3488 1$: ldw x,timer 
      00A3B5 5D               [ 2] 3489 	tnzw x 
      00A3B5 CF 00            [ 1] 3490 	jreq 2$
      00A3B7 1A               [10] 3491 	wfi 
      00A3B8 F6 EE            [ 1] 3492 	jrne 1$
      002A20                       3493 2$:	
      00A3BA 01               [ 4] 3494 	ret 
                                   3495 
                                   3496 ;------------------------------
                                   3497 ; BASIC: AWU expr
                                   3498 ; halt mcu for 'expr' milliseconds
                                   3499 ; use Auto wakeup peripheral
                                   3500 ; all oscillators stopped except LSI
                                   3501 ; range: 1ms - 511ms
                                   3502 ; input:
                                   3503 ;  none
                                   3504 ; output:
                                   3505 ;  none:
                                   3506 ;------------------------------
      002A21                       3507 awu:
      00A3BB 72 FB 04         [ 4] 3508   call expression
      00A3BE 19 03            [ 1] 3509   cp a,#TK_INTGR
      00A3C0 72 C7            [ 1] 3510   jreq 1$
      00A3C2 00 1A 72         [ 2] 3511   jp syntax_error
      002A2B                       3512 1$: _xpop 
      00A3C5 5C 00            [ 1]    1     ld a,(y)
      00A3C7 1B               [ 1]    2     ldw x,y 
      00A3C8 72 CF            [ 2]    3     ldw x,(1,x)
      00A3CA 00 1A C7 00      [ 2]    4     addw y,#CELL_SIZE 
      002A34                       3513 awu02:
      00A3CE 0D CF 00         [ 2] 3514   cpw x,#5120
      00A3D1 0E 7B            [ 1] 3515   jrmi 1$ 
      00A3D3 06 1E 07 72      [ 1] 3516   mov AWU_TBR,#15 
      00A3D7 B0 00            [ 1] 3517   ld a,#30
      00A3D9 0E               [ 2] 3518   div x,a
      00A3DA C2 00            [ 1] 3519   ld a,#16
      00A3DC 0D               [ 2] 3520   div x,a 
      00A3DD 18 03            [ 2] 3521   jra 4$
      002A45                       3522 1$: 
      00A3DF A8 80 2B         [ 2] 3523   cpw x,#2048
      00A3E2 12 20            [ 1] 3524   jrmi 2$ 
      00A3E4 25 7B 03 2A      [ 1] 3525   mov AWU_TBR,#14
      00A3E8 07 C6            [ 1] 3526   ld a,#80
      00A3EA 00               [ 2] 3527   div x,a 
      00A3EB 0F 2F            [ 2] 3528   jra 4$   
      002A53                       3529 2$:
      00A3ED 07 20 1A F2      [ 1] 3530   mov AWU_TBR,#7
      00A3F0                       3531 3$:  
                                   3532 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A3F0 72 0E 00         [ 2] 3533   cpw x,#64 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



      00A3F3 0F 15            [ 2] 3534   jrule 4$ 
      00A3F5 72 5C 50 F2      [ 1] 3535   inc AWU_TBR 
      00A3F5 1E               [ 2] 3536   srlw x 
      00A3F6 0D CF            [ 2] 3537   jra 3$ 
      002A63                       3538 4$:
      00A3F8 00               [ 1] 3539   ld a, xl
      00A3F9 05               [ 1] 3540   dec a 
      00A3FA 72 01            [ 1] 3541   jreq 5$
      00A3FC 00               [ 1] 3542   dec a 	
      002A68                       3543 5$: 
      00A3FD 23 05            [ 1] 3544   and a,#0x3e 
      00A3FF E6 02 C7         [ 1] 3545   ld AWU_APR,a 
      00A402 00 04 1E 0B      [ 1] 3546   bset AWU_CSR,#AWU_CSR_AWUEN
      00A406 CF               [10] 3547   halt 
                                   3548 
      00A407 00               [ 4] 3549   ret 
                                   3550 
                                   3551 ;------------------------------
                                   3552 ; BASIC: TICKS
                                   3553 ; return msec ticks counter value 
                                   3554 ; input:
                                   3555 ; 	none 
                                   3556 ; output:
                                   3557 ;	X 		TK_INTGR
                                   3558 ;-------------------------------
      002A73                       3559 get_ticks:
      00A408 01 81 0F         [ 1] 3560 	ld a,ticks 
      00A40A CE 00 10         [ 2] 3561 	ldw x,ticks+1 
      00A40A 85               [ 4] 3562 	ret 
                                   3563 
                                   3564 ;------------------------------
                                   3565 ; BASIC: ABS(expr)
                                   3566 ; return absolute value of expr.
                                   3567 ; input:
                                   3568 ;   none
                                   3569 ; output:
                                   3570 ;   xstack    positive int24 
                                   3571 ;-------------------------------
      002A7A                       3572 abs:
      00A40B 5B 0D 72         [ 4] 3573 	call func_args 
      00A40E 5A 00            [ 1] 3574 	cp a,#1 
      00A410 20 FC            [ 1] 3575 	jreq 0$ 
      00A412 CC 16 9E         [ 2] 3576 	jp syntax_error
      002A84                       3577 0$:  
      00A412 CD 98 1F         [ 4] 3578 	call abs24 
      002A87                       3579 	_xpop 
      00A415 A1 84            [ 1]    1     ld a,(y)
      00A417 27               [ 1]    2     ldw x,y 
      00A418 07 A1            [ 2]    3     ldw x,(1,x)
      00A41A 03 27 26 CC      [ 2]    4     addw y,#CELL_SIZE 
      00A41E 97               [ 4] 3580 	ret 
                                   3581 
                                   3582 ;------------------------------
                                   3583 ; BASIC: LSHIFT(expr1,expr2)
                                   3584 ; logical shift left expr1 by 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



                                   3585 ; expr2 bits 
                                   3586 ; output:
                                   3587 ; 	A 		TK_INTGR
                                   3588 ;   X 		result 
                                   3589 ;------------------------------
      002A91                       3590 lshift:
      00A41F 1E 19 58         [ 4] 3591 	call func_args
      00A420 A1 02            [ 1] 3592 	cp a,#2 
      00A420 90 89            [ 1] 3593 	jreq 1$
      00A422 CD 98 5E         [ 2] 3594 	jp syntax_error
      002A9B                       3595 1$: _xpop 
      00A425 4F 90            [ 1]    1     ld a,(y)
      00A427 CE               [ 1]    2     ldw x,y 
      00A428 00 05            [ 2]    3     ldw x,(1,x)
      00A42A 90 FE 90 89      [ 2]    4     addw y,#CELL_SIZE 
      00A42E 13 01            [ 1] 3596     ldw y,x    
      002AA6                       3597 	_at_top  ; T@ 
      00A430 5B 02            [ 1]    1     ld a,(y)
      00A432 25               [ 1]    2     ldw x,y 
      00A433 01 4C            [ 2]    3     ldw x,(1,x)
      00A435 90 5D            [ 2] 3598 	tnzw y 
      00A435 CD 8C            [ 1] 3599 	jreq 4$
      00A437 FA               [ 1] 3600 2$:	rcf 
      00A438 5D               [ 2] 3601 	rlcw x 
      00A439 26               [ 1] 3602 	rlc a 
      00A43A 05 A6            [ 2] 3603 	decw y 
      00A43C 05 CC            [ 1] 3604 	jrne 2$
      002AB6                       3605 4$: _store_top  ; T! 
      00A43E 97 20            [ 1]    1     ld (y),a 
      00A440 90 85 81         [ 2]    2     ldw (1,y),x     
      00A443 A6 84            [ 1] 3606 	ld a,#TK_INTGR
      00A443 90               [ 4] 3607 	ret
                                   3608 
                                   3609 ;------------------------------
                                   3610 ; BASIC: RSHIFT(expr1,expr2)
                                   3611 ; logical shift right expr1 by 
                                   3612 ; expr2 bits.
                                   3613 ; output:
                                   3614 ; 	A 		TK_INTGR
                                   3615 ;   X 		result 
                                   3616 ;------------------------------
      002ABE                       3617 rshift:
      00A444 89 89 72         [ 4] 3618 	call func_args
      00A447 5F 00            [ 1] 3619 	cp a,#2 
      00A449 0E 90            [ 1] 3620 	jreq 1$
      00A44B CE 00 1C         [ 2] 3621 	jp syntax_error
      002AC8                       3622 1$: _xpop 
      00A44E 90 E6            [ 1]    1     ld a,(y)
      00A450 03               [ 1]    2     ldw x,y 
      00A451 A1 03            [ 2]    3     ldw x,(1,x)
      00A453 27 15 90 E6      [ 2]    4     addw y,#CELL_SIZE 
      00A457 02 C7            [ 1] 3623     ldw y,x   
      002AD3                       3624 	_at_top  ; T@  
      00A459 00 0F            [ 1]    1     ld a,(y)
      00A45B 72               [ 1]    2     ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



      00A45C B9 00            [ 2]    3     ldw x,(1,x)
      00A45E 0E 90            [ 2] 3625 	tnzw y 
      00A460 C3 00            [ 1] 3626 	jreq 4$
      00A462 1E               [ 1] 3627 2$:	rcf 
      00A463 25               [ 2] 3628 	rrcw x
      00A464 E9               [ 1] 3629 	rrc a  
      00A465 A6 0A            [ 2] 3630 	decw y 
      00A467 CC 97            [ 1] 3631 	jrne 2$
      002AE3                       3632 4$: _store_top  ; T! 
      00A469 20 F7            [ 1]    1     ld (y),a 
      00A46A 90 EF 01         [ 2]    2     ldw (1,y),x     
      00A46A 90 89            [ 1] 3633 	ld a,#TK_INTGR
      00A46C 72               [ 4] 3634 	ret
                                   3635 
                                   3636 ;--------------------------
                                   3637 ; BASIC: FCPU integer
                                   3638 ; set CPU frequency 
                                   3639 ;-------------------------- 
                                   3640 
      002AEB                       3641 fcpu:
      00A46D A9 00            [ 1] 3642 	ld a,#TK_INTGR
      00A46F 04 1E 03         [ 4] 3643 	call expect 
      00A472 CD 94 6D         [ 4] 3644 	call get_int24 
      00A475 26               [ 1] 3645 	ld a,xl 
      00A476 04 90            [ 1] 3646 	and a,#7 
      00A478 85 20 DA         [ 1] 3647 	ld CLK_CKDIVR,a 
      00A47B 81               [ 4] 3648 	ret 
                                   3649 
                                   3650 ;------------------------------
                                   3651 ; BASIC: PMODE pin#, mode 
                                   3652 ; Arduino pin. 
                                   3653 ; define pin as input or output
                                   3654 ; pin#: {0..15}
                                   3655 ; mode: INPUT|OUTPUT  
                                   3656 ;------------------------------
                           000001  3657 	PINNO=1
                           000001  3658 	VSIZE=1
      002AFA                       3659 pin_mode:
      002AFA                       3660 	_vars VSIZE 
      00A47B 85 5B            [ 2]    1     sub sp,#VSIZE 
      00A47D 02 90 85         [ 4] 3661 	call arg_list 
      00A480 81 02            [ 1] 3662 	cp a,#2 
      00A481 27 03            [ 1] 3663 	jreq 1$
      00A481 72 00 00         [ 2] 3664 	jp syntax_error 
      002B06                       3665 1$: _xpop 
      00A484 23 05            [ 1]    1     ld a,(y)
      00A486 A6               [ 1]    2     ldw x,y 
      00A487 06 CC            [ 2]    3     ldw x,(1,x)
      00A489 97 20 CD 9B      [ 2]    4     addw y,#CELL_SIZE 
      00A48D 08 A1 84         [ 2] 3666 	ldw ptr16,x ; mode 
      002B12                       3667 	_xpop ; Dx pin 
      00A490 27 03            [ 1]    1     ld a,(y)
      00A492 CC               [ 1]    2     ldw x,y 
      00A493 97 1E            [ 2]    3     ldw x,(1,x)
      00A495 90 F6 93 EE      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



      00A499 01 72 A9         [ 4] 3668 	call select_pin 
      00A49C 00 03            [ 1] 3669 	ld (PINNO,sp),a  
      00A49E 9F 27            [ 1] 3670 	ld a,#1 
      00A4A0 62 88            [ 1] 3671 	tnz (PINNO,sp)
      00A4A2 CD 98            [ 1] 3672 	jreq 4$
      00A4A4 1F               [ 1] 3673 2$:	sll a 
      00A4A5 A1 80            [ 1] 3674 	dec (PINNO,sp)
      00A4A7 27 03            [ 1] 3675 	jrne 2$ 
      00A4A9 CC 97            [ 1] 3676 	ld (PINNO,sp),a
      00A4AB 1E CD            [ 1] 3677 	ld a,(PINNO,sp)
      00A4AD 98 38            [ 1] 3678 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A4AF A3 A5            [ 1] 3679 	ld (GPIO_CR1,x),a 
      00A4B1 0D 27            [ 1] 3680 4$:	ld a,#OUTP
      00A4B3 08 A3 A5         [ 1] 3681 	cp a,acc8 
      00A4B6 27 27            [ 1] 3682 	jreq 6$
                                   3683 ; input mode
                                   3684 ; disable external interrupt 
      00A4B8 03 CC            [ 1] 3685 	ld a,(PINNO,sp)
      00A4BA 97               [ 1] 3686 	cpl a 
      00A4BB 1E 04            [ 1] 3687 	and a,(GPIO_CR2,x)
      00A4BC E7 04            [ 1] 3688 	ld (GPIO_CR2,x),a 
                                   3689 ;clear bit in DDR for input mode 
      00A4BC 84 89            [ 1] 3690 	ld a,(PINNO,sp)
      00A4BE 88               [ 1] 3691 	cpl a 
      00A4BF E4 02            [ 1] 3692 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A4BF 0A 01            [ 1] 3693 	ld (GPIO_DDR,x),a 
      00A4C1 27 26            [ 2] 3694 	jra 9$
      002B4A                       3695 6$: ;output mode  
      00A4C3 CD 98            [ 1] 3696 	ld a,(PINNO,sp)
      00A4C5 1F A1            [ 1] 3697 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A4C7 84 27            [ 1] 3698 	ld (GPIO_DDR,x),a 
      00A4C9 07 A1            [ 1] 3699 	ld a,(PINNO,sp)
      00A4CB 03 27            [ 1] 3700 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A4CD 0D CC            [ 1] 3701 	ld (GPIO_CR2,x),a 
      002B56                       3702 9$:	
      002B56                       3703 	_drop VSIZE 
      00A4CF 97 1E            [ 2]    1     addw sp,#VSIZE 
      00A4D1 81               [ 4] 3704 	ret
                                   3705 
                                   3706 ;------------------------
                                   3707 ; select Arduino pin 
                                   3708 ; input:
                                   3709 ;   X 	 {0..15} Arduino Dx 
                                   3710 ; output:
                                   3711 ;   A     stm8s208 pin 
                                   3712 ;   X     base address s208 GPIO port 
                                   3713 ;---------------------------
      002B59                       3714 select_pin:
      00A4D1 C6               [ 2] 3715 	sllw x 
      00A4D2 00 02 AB         [ 2] 3716 	addw x,#arduino_to_8s208 
      00A4D5 03               [ 2] 3717 	ldw x,(x)
      00A4D6 C7               [ 1] 3718 	ld a,xl 
      00A4D7 00               [ 1] 3719 	push a 
      00A4D8 02               [ 1] 3720 	swapw x 
      00A4D9 20 03            [ 1] 3721 	ld a,#5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



      00A4DB CD               [ 4] 3722 	mul x,a 
      00A4DC 98 45 00         [ 2] 3723 	addw x,#GPIO_BASE 
      00A4DE 84               [ 1] 3724 	pop a 
      00A4DE CD               [ 4] 3725 	ret 
                                   3726 ; translation from Arduino D0..D15 to stm8s208rb 
      002B69                       3727 arduino_to_8s208:
      00A4DF 98 1F                 3728 .byte 3,6 ; D0 
      00A4E1 A1 08                 3729 .byte 3,5 ; D1 
      00A4E3 27 DA                 3730 .byte 4,0 ; D2 
      00A4E5 5B 03                 3731 .byte 2,1 ; D3
      00A4E7 20 1A                 3732 .byte 6,0 ; D4
      00A4E9 02 02                 3733 .byte 2,2 ; D5
      00A4E9 5B 01                 3734 .byte 2,3 ; D6
      00A4EB CD A4                 3735 .byte 3,1 ; D7
      00A4ED 12 CF                 3736 .byte 3,3 ; D8
      00A4EF 00 1A                 3737 .byte 2,4 ; D9
      00A4F1 55 00                 3738 .byte 4,5 ; D10
      00A4F3 04 00                 3739 .byte 2,6 ; D11
      00A4F5 02 85                 3740 .byte 2,7 ; D12
      00A4F7 A3 A5                 3741 .byte 2,5 ; D13
      00A4F9 0D 26                 3742 .byte 4,2 ; D14
      00A4FB 05 CE                 3743 .byte 4,1 ; D15
                                   3744 
                                   3745 
                                   3746 ;------------------------------
                                   3747 ; BASIC: RND(expr)
                                   3748 ; return random number 
                                   3749 ; between 1 and expr inclusive
                                   3750 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   3751 ; input:
                                   3752 ; 	none 
                                   3753 ; output:
                                   3754 ;	xstack 	random positive integer 
                                   3755 ;------------------------------
      002B89                       3756 random:
      00A4FD 00 1A 20         [ 4] 3757 	call func_args 
      00A500 19 01            [ 1] 3758 	cp a,#1
      00A501 27 03            [ 1] 3759 	jreq 1$
      00A501 20 35 9E         [ 2] 3760 	jp syntax_error
      00A503                       3761 1$:  
      002B93                       3762 	_xpop   
      00A503 55 00            [ 1]    1     ld a,(y)
      00A505 04               [ 1]    2     ldw x,y 
      00A506 00 02            [ 2]    3     ldw x,(1,x)
      00A508 5B 02 CC 97      [ 2]    4     addw y,#CELL_SIZE 
      00A50C D1               [ 2] 3763 	pushw x 
      00A50D 88               [ 1] 3764 	push a  
      00A50D 72 00            [ 1] 3765 	ld a,#0x80 
      00A50F 00 23            [ 1] 3766 	bcp a,(1,sp)
      00A511 05 A6            [ 1] 3767 	jreq 2$
      00A513 06 CC            [ 1] 3768 	ld a,#ERR_BAD_VALUE
      00A515 97 20 A0         [ 2] 3769 	jp tb_error
      00A517                       3770 2$: 
                                   3771 ; acc16=(x<<5)^x 
      00A517 CD A4 12         [ 2] 3772 	ldw x,seedx 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



      00A51A 58               [ 2] 3773 	sllw x 
      00A51A CF               [ 2] 3774 	sllw x 
      00A51B 00               [ 2] 3775 	sllw x 
      00A51C 05               [ 2] 3776 	sllw x 
      00A51D E6               [ 2] 3777 	sllw x 
      00A51E 02               [ 1] 3778 	ld a,xh 
      00A51F C7 00 04         [ 1] 3779 	xor a,seedx 
      00A522 35 03 00         [ 1] 3780 	ld acc16,a 
      00A525 02               [ 1] 3781 	ld a,xl 
      00A526 81 00 15         [ 1] 3782 	xor a,seedx+1 
      00A527 C7 00 0E         [ 1] 3783 	ld acc8,a 
                                   3784 ; seedx=seedy 
      00A527 72 00 00         [ 2] 3785 	ldw x,seedy 
      00A52A 23 06 A6         [ 2] 3786 	ldw seedx,x  
                                   3787 ; seedy=seedy^(seedy>>1)
      00A52D 06 CC 97         [ 2] 3788 	ldw x,seedy 
      00A530 20               [ 2] 3789 	srlw x 
      00A531 81               [ 1] 3790 	ld a,xh 
      00A532 C8 00 16         [ 1] 3791 	xor a,seedy 
      00A532 CD A4 12         [ 1] 3792 	ld seedy,a  
      00A535 CF               [ 1] 3793 	ld a,xl 
      00A536 00 1A 17         [ 1] 3794 	xor a,seedy+1 
      00A538 C7 00 17         [ 1] 3795 	ld seedy+1,a 
                                   3796 ; acc16>>3 
      00A538 85 52 04         [ 2] 3797 	ldw x,acc16 
      00A53B 89               [ 2] 3798 	srlw x 
      00A53C CE               [ 2] 3799 	srlw x 
      00A53D 00               [ 2] 3800 	srlw x 
                                   3801 ; x=acc16^x 
      00A53E 1A               [ 1] 3802 	ld a,xh 
      00A53F 89 CE 00         [ 1] 3803 	xor a,acc16 
      00A542 05 1F 05         [ 1] 3804 	ld acc16,a 
      00A545 CE               [ 1] 3805 	ld a,xl 
      00A546 00 01 1F         [ 1] 3806 	xor a,acc8 
      00A549 07 85 20         [ 1] 3807 	ld acc8,a 
                                   3808 ; seedy=acc16^seedy 
      00A54C CD 00 17         [ 1] 3809 	xor a,seedy+1
      00A54D 97               [ 1] 3810 	ld xl,a 
      00A54D 72 00 00         [ 1] 3811 	ld a,acc16 
      00A550 23 05 A6         [ 1] 3812 	xor a,seedy
      00A553 06               [ 1] 3813 	ld xh,a 
      00A554 CC 97 20         [ 2] 3814 	ldw seedy,x 
                                   3815 ; return seedx_lo&0x7f:seedy modulo expr + 1 
      00A557 C6 00 15         [ 1] 3816 	ld a,seedx+1
      00A557 1E 03            [ 1] 3817 	and a,#127
      002BFE                       3818 	_xpush 
      00A559 CF 00 05 E6      [ 2]    1     subw y,#CELL_SIZE
      00A55D 02 C7            [ 1]    2     ld (y),a 
      00A55F 00 04 1E         [ 2]    3     ldw (1,y),x 
      00A562 05               [ 1] 3819 	pop a 
      00A563 CF               [ 2] 3820 	popw x 
      002C09                       3821 	_xpush 
      00A564 00 01 85 5B      [ 2]    1     subw y,#CELL_SIZE
      00A568 04 89            [ 1]    2     ld (y),a 
      00A56A 81 EF 01         [ 2]    3     ldw (1,y),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



      00A56B CD 03 D1         [ 4] 3822 	call mod24 
      002C15                       3823 	_xpop
      00A56B 72 01            [ 1]    1     ld a,(y)
      00A56D 00               [ 1]    2     ldw x,y 
      00A56E 23 02            [ 2]    3     ldw x,(1,x)
      00A570 4F 81 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A572 1C 00 01         [ 2] 3824 	addw x,#1 
      00A572 72 09            [ 1] 3825 	adc a,#0  
      00A574 00               [ 4] 3826 	ret 
                                   3827 
                                   3828 ;---------------------------------
                                   3829 ; BASIC: WORDS 
                                   3830 ; affiche la listes des mots du
                                   3831 ; dictionnaire ainsi que le nombre
                                   3832 ; de mots.
                                   3833 ;---------------------------------
                           000001  3834 	WLEN=1 ; word length
                           000002  3835 	LLEN=2 ; character sent to console
                           000003  3836 	WCNT=3 ; count words printed 
                           000003  3837 	VSIZE=3 
      002C24                       3838 words:
      00A575 23 12            [ 2] 3839 	pushw y
      002C26                       3840 	_vars VSIZE
      00A577 5B 02            [ 2]    1     sub sp,#VSIZE 
      00A579 CD A1            [ 1] 3841 	clr (LLEN,sp)
      00A57B 02 5B            [ 1] 3842 	clr (WCNT,sp)
      00A57D 04 72 19 00      [ 2] 3843 	ldw y,#kword_dict+2
      00A581 23               [ 1] 3844 0$:	ldw x,y
      00A582 72               [ 1] 3845 	ld a,(x)
      00A583 10 00            [ 1] 3846 	and a,#15 
      00A585 23 CC            [ 1] 3847 	ld (WLEN,sp),a 
      00A587 97 C9            [ 1] 3848 	inc (WCNT,sp)
      00A589 CE               [ 1] 3849 1$:	incw x 
      00A58A 00               [ 1] 3850 	ld a,(x)
      00A58B 1C C3 00         [ 4] 3851 	call putc 
      00A58E 1E 2B            [ 1] 3852 	inc (LLEN,sp)
      00A590 0C AE            [ 1] 3853 	dec (WLEN,sp)
      00A592 96 AD            [ 1] 3854 	jrne 1$
      00A594 CD 8A            [ 1] 3855 	ld a,#70
      00A596 1D 55            [ 1] 3856 	cp a,(LLEN,sp)
      00A598 00 04            [ 1] 3857 	jrmi 2$   
      00A59A 00 02            [ 1] 3858 	ld a,#SPACE 
      00A59C 81 09 40         [ 4] 3859 	call putc 
      00A59D 0C 02            [ 1] 3860 	inc (LLEN,sp) 
      00A59D 5B 02            [ 2] 3861 	jra 3$
      00A59F A6 0D            [ 1] 3862 2$: ld a,#CR 
      00A59F CD 9C E8         [ 4] 3863 	call putc 
      00A5A2 CD 94            [ 1] 3864 	clr (LLEN,sp)
      00A5A4 D2 5F CF 00      [ 2] 3865 3$:	subw y,#2 
      00A5A8 07 72            [ 2] 3866 	ldw y,(y)
      00A5AA 5F 00            [ 1] 3867 	jrne 0$ 
      00A5AC 09 72            [ 1] 3868 	ld a,#CR 
      00A5AE 5F 00 0A         [ 4] 3869 	call putc  
      00A5B1 CE               [ 1] 3870 	clrw x 
      00A5B2 00 1C            [ 1] 3871 	ld a,(WCNT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



      00A5B4 CF               [ 1] 3872 	ld xl,a 
      00A5B5 00 05 E6         [ 4] 3873 	call prt_i16 
      00A5B8 02 C7 00         [ 2] 3874 	ldw x,#words_count_msg
      00A5BB 04 35 03         [ 4] 3875 	call puts 
      002C73                       3876 	_drop VSIZE 
      00A5BE 00 02            [ 2]    1     addw sp,#VSIZE 
      00A5C0 72 10            [ 2] 3877 	popw y 
      00A5C2 00               [ 4] 3878 	ret 
      00A5C3 23 CC 97 C9 64 73 20  3879 words_count_msg: .asciz " words in dictionary\n"
             69 6E 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   3880 
                                   3881 
                                   3882 ;-----------------------------
                                   3883 ; BASIC: TIMER expr 
                                   3884 ; initialize count down timer 
                                   3885 ;-----------------------------
      00A5C7                       3886 set_timer:
      00A5C7 AE 17 FF         [ 4] 3887 	call arg_list
      00A5CA 94 CC            [ 1] 3888 	cp a,#1 
      00A5CC 97 AA            [ 1] 3889 	jreq 1$
      00A5CE CC 16 9E         [ 2] 3890 	jp syntax_error
      002C98                       3891 1$: 
      002C98                       3892 	_xpop  
      00A5CE CD 98            [ 1]    1     ld a,(y)
      00A5D0 1F               [ 1]    2     ldw x,y 
      00A5D1 A1 85            [ 2]    3     ldw x,(1,x)
      00A5D3 27 03 CC 97      [ 2]    4     addw y,#CELL_SIZE 
      00A5D7 1E CD 98         [ 2] 3893 	ldw timer,x 
      00A5DA 54               [ 4] 3894 	ret 
                                   3895 
                                   3896 ;------------------------------
                                   3897 ; BASIC: TIMEOUT 
                                   3898 ; return state of timer 
                                   3899 ; output:
                                   3900 ;   A:X     0 not timeout 
                                   3901 ;   A:X     -1 timeout 
                                   3902 ;------------------------------
      002CA5                       3903 timeout:
      00A5DB CF               [ 1] 3904 	clr a 
      00A5DC 00 1A CD         [ 2] 3905 	ldw x,timer 
      00A5DF 89 C9            [ 1] 3906 	jreq 1$
      00A5E1 27               [ 1] 3907 	clrw x
      00A5E2 03               [ 4] 3908 	ret  
      00A5E3 CD               [ 1] 3909 1$:	cpl a
      00A5E4 89               [ 2] 3910 	cplw x 
      00A5E5 D0               [ 4] 3911 	ret 
                                   3912  	
                                   3913 
                                   3914 
                                   3915 
                                   3916 ;-----------------------------------
                                   3917 ; BASIC: IWDGEN expr1 
                                   3918 ; enable independant watchdog timer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



                                   3919 ; expr1 is delay in multiple of 62.5µsec
                                   3920 ; expr1 -> {1..16383}
                                   3921 ;-----------------------------------
      002CB0                       3922 enable_iwdg:
      00A5E6 72 3F 00         [ 4] 3923 	call arg_list
      00A5E9 1A 72            [ 1] 3924 	cp a,#1 
      00A5EB 5C 00            [ 1] 3925 	jreq 1$
      00A5ED 1B 72 3F         [ 2] 3926 	jp syntax_error 
      002CBA                       3927 1$: _xpop  
      00A5F0 00 1A            [ 1]    1     ld a,(y)
      00A5F2 72               [ 1]    2     ldw x,y 
      00A5F3 5C 00            [ 2]    3     ldw x,(1,x)
      00A5F5 1B 72 C7 00      [ 2]    4     addw y,#CELL_SIZE 
      00A5F9 1A 81            [ 1] 3928 	push #0
      00A5FB 35 CC 50 E0      [ 1] 3929 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A5FB 90               [ 1] 3930 	ld a,xh 
      00A5FC 89 AE            [ 1] 3931 	and a,#0x3f
      00A5FE 00               [ 1] 3932 	ld xh,a  
      00A5FF 64 90 AE         [ 2] 3933 2$:	cpw x,#255
      00A602 03 E8            [ 2] 3934 	jrule 3$
      00A604 20 22            [ 1] 3935 	inc (1,sp)
      00A606 98               [ 1] 3936 	rcf 
      00A606 90               [ 2] 3937 	rrcw x 
      00A607 89 CD            [ 2] 3938 	jra 2$
      00A609 99 DD A1 02      [ 1] 3939 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A60D 27               [ 1] 3940 	pop a  
      00A60E 03 CC 97         [ 1] 3941 	ld IWDG_PR,a 
      00A611 1E               [ 1] 3942 	ld a,xl
      00A612 4A               [ 1] 3943 	dec a 
      00A612 90 F6 93 EE      [ 1] 3944 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A616 01 72 A9         [ 1] 3945 	ld IWDG_RLR,a 
      00A619 00 03 89 90      [ 1] 3946 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A61D F6               [ 4] 3947 	ret 
                                   3948 
                                   3949 
                                   3950 ;-----------------------------------
                                   3951 ; BASIC: IWDGREF  
                                   3952 ; refresh independant watchdog count down 
                                   3953 ; timer before it reset MCU. 
                                   3954 ;-----------------------------------
      002CEE                       3955 refresh_iwdg:
      00A61E 93 EE 01 72      [ 1] 3956 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A622 A9               [ 4] 3957 	ret 
                                   3958 
                                   3959 
                                   3960 ;-------------------------------------
                                   3961 ; BASIC: LOG2(expr)
                                   3962 ; return logarithm base 2 of expr 
                                   3963 ; this is the position of most significant
                                   3964 ; bit set. 
                                   3965 ; input: 
                                   3966 ; output:
                                   3967 ;   A     TK_INTGR 
                                   3968 ;   xstack log2 
                                   3969 ;*********************************
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



      002CF3                       3970 log2:
      00A623 00 03 90         [ 4] 3971 	call func_args 
      00A626 93 85            [ 1] 3972 	cp a,#1 
      00A628 27 03            [ 1] 3973 	jreq 1$
      00A628 89 AE F4         [ 2] 3974 	jp syntax_error 
      002CFD                       3975 1$: 
      002CFD                       3976 	_xpop    
      00A62B 24 65            [ 1]    1     ld a,(y)
      00A62D 90               [ 1]    2     ldw x,y 
      00A62E A3 7A            [ 2]    3     ldw x,(1,x)
      00A630 12 2B 01 5C      [ 2]    4     addw y,#CELL_SIZE 
      00A634 4D               [ 1] 3977 	tnz a
      00A634 9E C7            [ 1] 3978 	jrne 2$ 
      00A636 53               [ 2] 3979 	tnzw x 
      00A637 0D 9F            [ 1] 3980 	jrne 2$
      00A639 C7 53            [ 1] 3981 	ld a,#ERR_BAD_VALUE
      00A63B 0E 8C 56         [ 2] 3982 	jp tb_error 
      00A63E 9E C7            [ 1] 3983 2$: push #24 
      00A640 53               [ 2] 3984 3$: rlcw x 
      00A641 0F               [ 1] 3985     rlc a 
      00A642 9F C7            [ 1] 3986 	jrc 4$
      00A644 53 10            [ 1] 3987 	dec (1,sp) 
      00A646 72 10            [ 1] 3988 	jrne 3$
      00A648 53               [ 1] 3989 4$: clrw x 
      00A649 08               [ 1] 3990     pop a 
      00A64A 72               [ 1] 3991 	dec a
      00A64B 10               [ 1] 3992 	rlwa x  
      002D1F                       3993 9$:	
      00A64C 53               [ 4] 3994 	ret 
                                   3995 
                                   3996 ;-----------------------------------
                                   3997 ; BASIC: BIT(expr) 
                                   3998 ; expr ->{0..23}
                                   3999 ; return 2^expr 
                                   4000 ; output:
                                   4001 ;    A:X    2^expr 
                                   4002 ;-----------------------------------
      002D20                       4003 bitmask:
      00A64D 00 72 10         [ 4] 4004     call func_args 
      00A650 53 04            [ 1] 4005 	cp a,#1
      00A652 85 CD            [ 1] 4006 	jreq 1$
      00A654 AA 94 72         [ 2] 4007 	jp syntax_error 
      002D2A                       4008 1$: _xpop 
      00A657 11 53            [ 1]    1     ld a,(y)
      00A659 08               [ 1]    2     ldw x,y 
      00A65A 72 11            [ 2]    3     ldw x,(1,x)
      00A65C 53 00 90 85      [ 2]    4     addw y,#CELL_SIZE 
      00A660 81               [ 1] 4009 	ld a,xl 
      00A661 AE 00 01         [ 2] 4010 	ldw x,#1 
      00A661 CD 99            [ 1] 4011 	and a,#23
      00A663 DD A1            [ 1] 4012 	jreq 9$
      00A665 02               [ 1] 4013 	push a 
      00A666 27               [ 1] 4014 	clr a 
      002D3D                       4015 2$: 
      00A667 12               [ 2] 4016 	slaw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



      00A668 A1               [ 1] 4017 	rlc a 	
      00A669 01 27            [ 1] 4018 	dec (1,sp)
      00A66B 03 CC            [ 1] 4019 	jrne 2$ 
      002D43                       4020 4$:
      002D43                       4021     _drop 1 
      00A66D 97 1E            [ 2]    1     addw sp,#1 
      00A66F 4F               [ 4] 4022 9$:	ret 
                                   4023 
                                   4024 ;------------------------------
                                   4025 ; BASIC: DO 
                                   4026 ; initiate a DO ... UNTIL loop 
                                   4027 ;------------------------------
                           000003  4028 	DOLP_ADR=3 
                           000005  4029 	DOLP_INW=5
                           000004  4030 	VSIZE=4 
      002D46                       4031 do_loop:
      00A670 5F               [ 2] 4032 	popw x 
      002D47                       4033 	_vars VSIZE 
      00A671 72 A2            [ 2]    1     sub sp,#VSIZE 
      00A673 00               [ 2] 4034 	pushw x 
      00A674 03 90 F7         [ 2] 4035 	ldw x,basicptr 
      00A677 90 EF            [ 2] 4036 	ldw (DOLP_ADR,sp),x
      00A679 01 90 E6         [ 2] 4037 	ldw x,in.w 
      00A67C 03 93            [ 2] 4038 	ldw (DOLP_INW,sp),x
      00A67E EE 04 5D 27      [ 1] 4039 	inc loop_depth 
      00A682 25               [ 4] 4040 	ret 
                                   4041 
                                   4042 ;--------------------------------
                                   4043 ; BASIC: UNTIL expr 
                                   4044 ; loop if exprssion is false 
                                   4045 ; else terminate loop
                                   4046 ;--------------------------------
      002D59                       4047 until: 
      00A683 90 F6 93 EE      [ 1] 4048 	tnz loop_depth 
      00A687 01 72            [ 1] 4049 	jrne 1$ 
      00A689 A9 00 03         [ 2] 4050 	jp syntax_error 
      002D62                       4051 1$: 
      00A68C 72 A9 00         [ 4] 4052 	call condition  
      002D65                       4053 	_xpop 
      00A68F 03 9F            [ 1]    1     ld a,(y)
      00A691 A4               [ 1]    2     ldw x,y 
      00A692 07 4E            [ 2]    3     ldw x,(1,x)
      00A694 C7 54 01 72      [ 2]    4     addw y,#CELL_SIZE 
      00A698 16               [ 1] 4054 	tnz a 
      00A699 50 CA            [ 1] 4055 	jrne 9$ 
      00A69B 72               [ 2] 4056 	tnzw x 
      00A69C 10 54            [ 1] 4057 	jrne 9$ 
      00A69E 01 AE            [ 2] 4058 	ldw x,(DOLP_ADR,sp)
      00A6A0 00 1B 5A         [ 2] 4059 	ldw basicptr,x 
      00A6A3 9D 26            [ 1] 4060 	ld a,(2,x)
      00A6A5 FA 20 08         [ 1] 4061 	ld count,a 
      00A6A8 72 11            [ 2] 4062 	ldw x,(DOLP_INW,sp)
      00A6AA 54 01 72         [ 2] 4063 	ldw in.w,x 
      00A6AD 17               [ 4] 4064 	ret 
      002D84                       4065 9$:	; remove loop data from stack  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



      00A6AE 50               [ 2] 4066 	popw x
      002D85                       4067 	_drop VSIZE
      00A6AF CA 04            [ 2]    1     addw sp,#VSIZE 
      00A6B0 72 5A 00 1F      [ 1] 4068 	dec loop_depth 
      00A6B0 81               [ 2] 4069 	jp (x)
                                   4070 
                                   4071 ;--------------------------
                                   4072 ; BASIC: PORTA...PORTI  
                                   4073 ;  return constant value 
                                   4074 ;  PORT  base address 
                                   4075 ;---------------------------
      00A6B1                       4076 const_porta:
      00A6B1 CD 99 D8         [ 2] 4077 	ldw x,#PA_BASE 
      00A6B4 A1               [ 1] 4078 	clr a 
      00A6B5 01               [ 4] 4079 	ret 
      002D91                       4080 const_portb:
      00A6B6 27 03 CC         [ 2] 4081 	ldw x,#PB_BASE 
      00A6B9 97               [ 1] 4082 	clr a 
      00A6BA 1E               [ 4] 4083 	ret 
      002D96                       4084 const_portc:
      00A6BB 90 F6 93         [ 2] 4085 	ldw x,#PC_BASE 
      00A6BE EE               [ 1] 4086 	clr a 
      00A6BF 01               [ 4] 4087 	ret 
      002D9B                       4088 const_portd:
      00A6C0 72 A9 00         [ 2] 4089 	ldw x,#PD_BASE 
      00A6C3 03               [ 1] 4090 	clr a 
      00A6C4 A3               [ 4] 4091 	ret 
      002DA0                       4092 const_porte:
      00A6C5 00 05 23         [ 2] 4093 	ldw x,#PE_BASE 
      00A6C8 05               [ 1] 4094 	clr a 
      00A6C9 A6               [ 4] 4095 	ret 
      002DA5                       4096 const_portf:
      00A6CA 0A CC 97         [ 2] 4097 	ldw x,#PF_BASE 
      00A6CD 20               [ 1] 4098 	clr a 
      00A6CE 9F               [ 4] 4099 	ret 
      002DAA                       4100 const_portg:
      00A6CF C7 00 0F         [ 2] 4101 	ldw x,#PG_BASE 
      00A6D2 A6               [ 1] 4102 	clr a 
      00A6D3 05               [ 4] 4103 	ret 
      002DAF                       4104 const_porth:
      00A6D4 C0 00 0F         [ 2] 4105 	ldw x,#PH_BASE 
      00A6D7 C7               [ 1] 4106 	clr a 
      00A6D8 54               [ 4] 4107 	ret 
      002DB4                       4108 const_porti:
      00A6D9 00 72 16         [ 2] 4109 	ldw x,#PI_BASE 
      00A6DC 54               [ 1] 4110 	clr a 
      00A6DD 02               [ 4] 4111 	ret 
                                   4112 
                                   4113 ;-------------------------------
                                   4114 ; following return constant 
                                   4115 ; related to GPIO register offset 
                                   4116 ;---------------------------------
      002DB9                       4117 const_odr:
      00A6DE 72               [ 1] 4118 	clr a 
      00A6DF 10 54 01         [ 2] 4119 	ldw x,#GPIO_ODR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



      00A6E2 72               [ 4] 4120 	ret 
      002DBE                       4121 const_idr:
      00A6E3 0F               [ 1] 4122 	clr a 
      00A6E4 54 00 FB         [ 2] 4123 	ldw x,#GPIO_IDR
      00A6E7 CE               [ 4] 4124 	ret 
      002DC3                       4125 const_ddr:
      00A6E8 54               [ 1] 4126 	clr a
      00A6E9 04 A6 84         [ 2] 4127 	ldw x,#GPIO_DDR
      00A6EC 81               [ 4] 4128 	ret 
      00A6ED                       4129 const_cr1:
      00A6ED 52               [ 1] 4130 	clr a 
      00A6EE 01 CD 99         [ 2] 4131 	ldw x,#GPIO_CR1
      00A6F1 D8               [ 4] 4132 	ret 
      002DCD                       4133 const_cr2:
      00A6F2 A1               [ 1] 4134 	clr a
      00A6F3 01 27 03         [ 2] 4135 	ldw x,#GPIO_CR2
      00A6F6 CC               [ 4] 4136 	ret 
                                   4137 ;-------------------------
                                   4138 ; BASIC: POUT 
                                   4139 ;  constant for port mode
                                   4140 ;  used by PMODE 
                                   4141 ;  to set pin as output
                                   4142 ;------------------------
      002DD2                       4143 const_output:
      00A6F7 97               [ 1] 4144 	clr a 
      00A6F8 1E 90 F6         [ 2] 4145 	ldw x,#OUTP
      00A6FB 93               [ 4] 4146 	ret 
                                   4147 
                                   4148 ;-------------------------
                                   4149 ; BASIC: PINP 
                                   4150 ;  constant for port mode
                                   4151 ;  used by PMODE 
                                   4152 ;  to set pin as input
                                   4153 ;------------------------
      002DD7                       4154 const_input:
      00A6FC EE               [ 1] 4155 	clr a  
      00A6FD 01 72 A9         [ 2] 4156 	ldw x,#INP 
      00A700 00               [ 4] 4157 	ret 
                                   4158 	
                                   4159 ;-----------------------
                                   4160 ; memory area constants
                                   4161 ;-----------------------
      002DDC                       4162 const_eeprom_base:
      00A701 03               [ 1] 4163 	clr a  
      00A702 A3 00 0F         [ 2] 4164 	ldw x,#EEPROM_BASE 
      00A705 23               [ 4] 4165 	ret 
                                   4166 
                                   4167 ;---------------------------
                                   4168 ; BASIC: DATA 
                                   4169 ; when the interpreter find 
                                   4170 ; a DATA line it skip it.
                                   4171 ;---------------------------
      002DE1                       4172 data:
      00A706 05 A6 0A CC 97   [ 1] 4173 	mov in,count 
      00A70B 20               [ 4] 4174 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



                                   4175 
                                   4176 ;------------------------------
                                   4177 ; check if it is a DATA line 
                                   4178 ; input: 
                                   4179 ;    X    line address 
                                   4180 ; output:
                                   4181 ;    Z    set if DATA line 
                                   4182 ;----------------------------
      002DE7                       4183 is_data_line:
      00A70C CD               [ 2] 4184 	pushw x 
      00A70D AB D9            [ 1] 4185 	ld a,(3,x)
      00A70F 6B 01            [ 1] 4186 	cp a,#TK_CMD 
      00A711 E6 01            [ 1] 4187 	jrne 9$
      00A713 0D 01            [ 2] 4188 	ldw x,(4,x)
      00A715 27 05 44         [ 2] 4189 	cpw x,#DATA_IDX  
      00A718 0A               [ 2] 4190 9$: popw x 
      00A719 01               [ 4] 4191 	ret 
                                   4192 
                                   4193 ;---------------------------------
                                   4194 ; BASIC: RESTORE [line#]
                                   4195 ; set data_ptr to first data line
                                   4196 ; if no DATA found pointer set to
                                   4197 ; zero.
                                   4198 ; if a line# is given as argument 
                                   4199 ; a data line with that number 
                                   4200 ; is searched and the data pointer 
                                   4201 ; is set to it. If there is no 
                                   4202 ; data line with that number 
                                   4203 ; the program is interrupted. 
                                   4204 ;---------------------------------
      002DF5                       4205 restore:
      00A71A 26               [ 1] 4206 	clrw x 
      00A71B FB A4 01         [ 2] 4207 	ldw data_ptr,x 
      00A71E 5F 97 4F         [ 2] 4208 	ldw data_ofs,x 
      00A721 5B 01 81         [ 2] 4209 	ldw x,txtbgn 
      00A724 CD 17 9F         [ 4] 4210 	call next_token 
      00A724 52 02            [ 1] 4211 	cp a,#TK_INTGR
      00A726 CD 99            [ 1] 4212 	jrne 0$
      00A728 DD A1 02         [ 4] 4213 	call get_int24
      00A72B 27 03            [ 2] 4214 	pushw y 
      00A72D CC               [ 1] 4215 	clr a 
      00A72E 97 1E 90         [ 4] 4216 	call search_lineno  
      00A731 F6 93            [ 2] 4217 	popw y 
      00A733 EE               [ 2] 4218 	tnzw x 
      00A734 01 72            [ 1] 4219 	jrne set_data_pointer 
      00A736 A9 00            [ 2] 4220 	jra data_error 
      002E16                       4221 0$:
      002E16                       4222 	_unget_token  
      00A738 03 9F 6B 02 90   [ 1]    1      mov in,in.saved  
                                   4223 ; search first DATA line 	
      00A73D F6 93 EE         [ 2] 4224 1$:	cpw x,txtend
      00A740 01 72            [ 1] 4225 	jruge data_error 
      002E20                       4226 2$:	
      00A742 A9 00 03         [ 4] 4227 	call is_data_line 
      00A745 A3 00            [ 1] 4228 	jrne 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



      00A747 0F 23 05         [ 4] 4229 4$:	call try_next_line 
      00A74A A6 0A            [ 1] 4230 	jrne 4$ 
      00A74C CC               [ 4] 4231 	ret 
                                   4232 
                                   4233 ;---------------------
                                   4234 ; set data pointer 
                                   4235 ; variables at new line 
                                   4236 ; input:
                                   4237 ;    X    line address 
                                   4238 ;----------------------
      002E2B                       4239 set_data_pointer:
      00A74D 97 20 CD         [ 2] 4240 	ldw data_ptr,x
      00A750 AB D9            [ 1] 4241 	ld a,(2,x)
      00A752 6B 01 A6         [ 1] 4242 	ld data_len,a 
      00A755 01 0D 01 27      [ 1] 4243 	mov data_ofs,#FIRST_DATA_ITEM
      00A759 05               [ 4] 4244 	ret 
                                   4245 
                                   4246 
                                   4247 ;--------------------
                                   4248 ; at end of data line 
                                   4249 ; check if next line 
                                   4250 ; is a data line 
                                   4251 ; input:
                                   4252 ;    X   actual line address 
                                   4253 ;  
                                   4254 ;-------------------
      002E38                       4255 try_next_line: 
      00A75A 48 0A            [ 1] 4256 	ld a,(2,x)
      00A75C 01 26 FB         [ 1] 4257 	ld acc8,a 
      00A75F 0D 02 26 05      [ 1] 4258 	clr acc16 
      00A763 43 E4 00 20      [ 2] 4259 	addw x,acc16 
      00A767 02 EA 00         [ 2] 4260 	cpw x,txtend 
      00A76A E7 00            [ 1] 4261 	jrult 1$
      00A76C 5B 02            [ 2] 4262 	jra data_error 
      002E4C                       4263 1$:	
      00A76E 81 2D E7         [ 4] 4264 	call is_data_line 
      00A76F 27 04            [ 1] 4265 	jreq 2$
      00A76F 72 00            [ 1] 4266 	ld a,#1  
      00A771 00 23            [ 2] 4267 	jra 9$
      00A773 02 4F 81         [ 4] 4268 2$:	call set_data_pointer
      00A776 4F               [ 1] 4269 	clr a  
      00A776 AE               [ 4] 4270 9$:	ret 
      002E5A                       4271 data_error:	
      00A777 A7 9D            [ 1] 4272     ld a,#ERR_NO_DATA 
      00A779 CD 8A 1D         [ 2] 4273 	jp tb_error 
                                   4274 
                                   4275 
                                   4276 ;---------------------------------
                                   4277 ; BASIC: READ 
                                   4278 ; return next data item | 0 
                                   4279 ;---------------------------------
                           000001  4280 	CTX_BPTR=1 
                           000003  4281 	CTX_IN=3 
                           000004  4282 	CTX_COUNT=4 
                           000005  4283 	INT24=5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



                           000007  4284 	VSIZE=7 
      002E5F                       4285 read:
      002E5F                       4286 	_vars  VSIZE 
      00A77C 5B 02            [ 2]    1     sub sp,#VSIZE 
      00A77E 52 04 CD         [ 4] 4287 	call save_context
      002E64                       4288 read01:	
      00A781 A0 F2 AE         [ 1] 4289 	ld a,data_ofs
      00A784 16 68 CF         [ 1] 4290 	cp a,data_len 
      00A787 00 05            [ 1] 4291 	jreq 2$ ; end of line  
      002E6C                       4292 0$:
      00A789 7F 72 5F         [ 2] 4293 	ldw x,data_ptr 
      00A78C 00 04 5F         [ 2] 4294 	ldw basicptr,x 
      00A78F CF 00 01 72 11   [ 1] 4295 	mov in,data_ofs 
      00A794 00 23 72 18 00   [ 1] 4296 	mov count,data_len  
      00A799 23 CC 97         [ 4] 4297 	call expression 
      00A79C C9 0A            [ 1] 4298 	cp a,#TK_INTGR 
      00A79E 62 72            [ 1] 4299 	jreq 1$ 
      00A7A0 65 61 6B         [ 2] 4300 	jp syntax_error 
      002E86                       4301 1$:
      00A7A3 20 70 6F         [ 4] 4302 	call next_token ; skip comma
      00A7A6 69 6E 74         [ 2] 4303 	ldw x,basicptr 
      00A7A9 2C 20 52         [ 2] 4304 	ldw data_ptr,x 
      00A7AC 55 4E 20 74 6F   [ 1] 4305 	mov data_ofs,in 
      00A7B1 20 72 65         [ 4] 4306 	call rest_context
      002E97                       4307 	_xpop 
      00A7B4 73 75            [ 1]    1     ld a,(y)
      00A7B6 6D               [ 1]    2     ldw x,y 
      00A7B7 65 2E            [ 2]    3     ldw x,(1,x)
      00A7B9 0A 00 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A7BB                       4308 	_drop VSIZE 
      00A7BB 72 01            [ 2]    1     addw sp,#VSIZE 
      00A7BD 00               [ 4] 4309 	ret 
      002EA3                       4310 2$: ; end of line reached 
                                   4311 	; try next line 
      00A7BE 23 01 81         [ 2] 4312 	ldw x,data_ptr  
      00A7C1 CD 2E 38         [ 4] 4313 	call try_next_line
      00A7C1 CD 95            [ 1] 4314 	jreq 0$ 
      00A7C3 7A 81            [ 2] 4315 	jra data_error 
                                   4316 
                                   4317 ;---------------------------------
                                   4318 ; BASIC: SPIEN clkdiv, 0|1  
                                   4319 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4320 ; if clkdiv==-1 disable SPI
                                   4321 ; 0|1 -> disable|enable  
                                   4322 ;--------------------------------- 
                           000005  4323 SPI_CS_BIT=5
      00A7C5                       4324 spi_enable:
      00A7C5 72 5F 00         [ 4] 4325 	call arg_list 
      00A7C8 19 52            [ 1] 4326 	cp a,#2
      00A7CA 03 CD            [ 1] 4327 	jreq 1$
      00A7CC 98 1F A1         [ 2] 4328 	jp syntax_error 
      002EB7                       4329 1$: 
      00A7CF 04 27 03 CC      [ 1] 4330 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A7D3 97               [ 2] 4331 	popw x  
      00A7D4 1E               [ 2] 4332 	tnzw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      00A7D5 CD 98            [ 1] 4333 	jreq spi_disable 
      00A7D7 6E               [ 2] 4334 	popw x 
      00A7D8 A4 DF            [ 1] 4335 	ld a,#(1<<SPI_CR1_BR)
      00A7DA A1               [ 4] 4336 	mul x,a 
      00A7DB 45               [ 1] 4337 	ld a,xl 
      00A7DC 26 0C AE         [ 1] 4338 	ld SPI_CR1,a 
                                   4339 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A7DF 40 00 CF 00      [ 1] 4340 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A7E3 1A AE 47 FF      [ 1] 4341 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4342 ; configure SPI as master mode 0.	
      00A7E7 4F 20 15 A1      [ 1] 4343 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4344 ; ~CS line controlled by sofware 	
      00A7EB 46 27 06 AE      [ 1] 4345 	bset SPI_CR2,#SPI_CR2_SSM 
      00A7EF 96 5E CC 97      [ 1] 4346     bset SPI_CR2,#SPI_CR2_SSI 
                                   4347 ; enable SPI
      00A7F3 20 1C 52 00      [ 1] 4348 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A7F4 81               [ 4] 4349 	ret 
      002EE0                       4350 spi_disable:
      002EE0                       4351 	_drop #2; throw first argument.
      00A7F4 AE B6            [ 2]    1     addw sp,##2 
                                   4352 ; wait spi idle 
      00A7F6 00 CF            [ 1] 4353 1$:	ld a,#0x82 
      00A7F8 00 1A A6         [ 1] 4354 	and a,SPI_SR
      00A7FB 02 AE            [ 1] 4355 	cp a,#2 
      00A7FD 7F FF            [ 1] 4356 	jrne 1$
      00A7FF 72 1D 52 00      [ 1] 4357 	bres SPI_CR1,#SPI_CR1_SPE
      00A7FF 6B 01 1F 02      [ 1] 4358 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A803 CD 87 BE 16      [ 1] 4359 	bres PE_DDR,#SPI_CS_BIT 
      00A806 81               [ 4] 4360 	ret 
                                   4361 
      002EF8                       4362 spi_clear_error:
      00A806 CD 89            [ 1] 4363 	ld a,#0x78 
      00A808 40 27 08         [ 1] 4364 	bcp a,SPI_SR 
      00A80B A6 45            [ 1] 4365 	jreq 1$
      00A80D CD 89 C0 CD      [ 1] 4366 	clr SPI_SR 
      00A811 88               [ 4] 4367 1$: ret 
                                   4368 
      002F04                       4369 spi_send_byte:
      00A812 3C               [ 1] 4370 	push a 
      00A813 AE 00 80         [ 4] 4371 	call spi_clear_error
      00A816 CD               [ 1] 4372 	pop a 
      00A817 89 32 7B 01 1E   [ 2] 4373 	btjf SPI_SR,#SPI_SR_TXE,.
      00A81C 02 72 B0         [ 1] 4374 	ld SPI_DR,a
      00A81F 00 1A C2 00 19   [ 2] 4375 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A824 22 E0 CD         [ 1] 4376 	ld a,SPI_DR 
      00A827 95               [ 4] 4377 	ret 
                                   4378 
      002F1A                       4379 spi_rcv_byte:
      00A828 7A 1E            [ 1] 4380 	ld a,#255
      00A82A 02 A3 47 FF 26   [ 2] 4381 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A82F 03 CD 9D         [ 1] 4382 	ld a,SPI_DR 
      00A832 B1               [ 4] 4383 	ret
                                   4384 
                                   4385 ;------------------------------
                                   4386 ; BASIC: SPIWR byte [,byte]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



                                   4387 ; write 1 or more byte
                                   4388 ;------------------------------
      00A833                       4389 spi_write:
      00A833 5B 03 81         [ 4] 4390 	call expression
      00A836 A1 84            [ 1] 4391 	cp a,#TK_INTGR 
      00A836 CE B6            [ 1] 4392 	jreq 1$
      00A838 00 C3 A8         [ 2] 4393 	jp syntax_error 
      002F2F                       4394 1$:	
      00A83B F6               [ 1] 4395 	ld a,xl 
      00A83C 81 2F 04         [ 4] 4396 	call spi_send_byte 
      00A83D CD 17 9F         [ 4] 4397 	call next_token 
      00A83D 88 4D            [ 1] 4398 	cp a,#TK_COMMA 
      00A83F 27 0A            [ 1] 4399 	jrne 2$ 
      00A841 F6 5C            [ 2] 4400 	jra spi_write 
      00A843 90               [ 1] 4401 2$:	tnz a 
      00A844 F7 90            [ 1] 4402 	jreq 3$
      002F3F                       4403 	_unget_token  
      00A846 5C 0A 01 26 F6   [ 1]    1      mov in,in.saved  
      00A84B 84               [ 4] 4404 3$:	ret 
                                   4405 
                                   4406 
                                   4407 ;-------------------------------
                                   4408 ; BASIC: SPIRD 	
                                   4409 ; read one byte from SPI 
                                   4410 ;-------------------------------
      002F45                       4411 spi_read:
      00A84C 81 2F 1A         [ 4] 4412 	call spi_rcv_byte 
      00A84D 5F               [ 1] 4413 	clrw x 
      00A84D 88               [ 1] 4414 	ld xl,a 
      00A84E 90               [ 1] 4415 	clr a  
      00A84F AE               [ 4] 4416 	ret 
                                   4417 
                                   4418 ;------------------------------
                                   4419 ; BASIC: SPISEL 0|1 
                                   4420 ; set state of ~CS line
                                   4421 ; 0|1 deselect|select  
                                   4422 ;------------------------------
      002F4C                       4423 spi_select:
      00A850 16 B8 90         [ 4] 4424 	call next_token 
      00A853 89 A6            [ 1] 4425 	cp a,#TK_INTGR 
      00A855 80 90            [ 1] 4426 	jreq 1$
      00A857 7F 90 5C         [ 2] 4427 	jp syntax_error 
      00A85A 4A               [ 2] 4428 1$: tnzw x  
      00A85B 26 F9            [ 1] 4429 	jreq cs_high 
      00A85D 90 85 84 81      [ 1] 4430 	bres PE_ODR,#SPI_CS_BIT
      00A861 81               [ 4] 4431 	ret 
      002F5E                       4432 cs_high: 
      00A861 89 90 89 52      [ 1] 4433 	bset PE_ODR,#SPI_CS_BIT
      00A865 06               [ 4] 4434 	ret 
                                   4435 
                                   4436 ;-------------------------------
                                   4437 ; BASIC: PAD 
                                   4438 ; Return pad buffer address.
                                   4439 ;------------------------------
      002F63                       4440 pad_ref:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



      00A866 CD A8 36         [ 2] 4441 	ldw x,#pad 
      00A869 26               [ 1] 4442 	clr a
      00A86A 09               [ 4] 4443 	ret 
                                   4444 
                                   4445 
                                   4446 ;------------------------------
                                   4447 ;      dictionary 
                                   4448 ; format:
                                   4449 ;   link:   2 bytes 
                                   4450 ;   name_length+flags:  1 byte, bits 0:3 lenght,4:8 kw type   
                                   4451 ;   cmd_name: 16 byte max 
                                   4452 ;   cmd_index: 2 bytes 
                                   4453 ;------------------------------
                                   4454 	.macro _dict_entry len,name,cmd_idx 
                                   4455 	.word LINK 
                                   4456 	LINK=.
                                   4457 name:
                                   4458 	.byte len   	
                                   4459 	.ascii "name"
                                   4460 	.word cmd_idx 
                                   4461 	.endm 
                                   4462 
                           000000  4463 	LINK=0
                                   4464 ; respect alphabetic order for BASIC names from Z-A
                                   4465 ; this sort order is for a cleaner WORDS cmd output. 	
      002F68                       4466 kword_end:
      002F68                       4467 	_dict_entry,3+F_XOR,XOR,XOR_IDX ; xor operator
      00A86B AE A8                    1 	.word LINK 
                           002F6A     2 	LINK=.
      002F6A                          3 XOR:
      00A86D F8                       4 	.byte 3+F_XOR   	
      00A86E CD 8A 1D                 5 	.ascii "XOR"
      00A871 CC A8                    6 	.word XOR_IDX 
      002F70                       4468 	_dict_entry,5,WRITE,WRITE_IDX;write  
      00A873 F0 6A                    1 	.word LINK 
                           002F72     2 	LINK=.
      00A874                          3 WRITE:
      00A874 CE                       4 	.byte 5   	
      00A875 00 1C C3 00 1E           5 	.ascii "WRITE"
      00A87A 25 09                    6 	.word WRITE_IDX 
      002F7A                       4469 	_dict_entry,5,WORDS,WORDS_IDX;words 
      00A87C AE A9                    1 	.word LINK 
                           002F7C     2 	LINK=.
      002F7C                          3 WORDS:
      00A87E 3A                       4 	.byte 5   	
      00A87F CD 8A 1D CC A8           5 	.ascii "WORDS"
      00A884 F0 AE                    6 	.word WORDS_IDX 
      00A885                       4470 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      00A885 CD 87                    1 	.word LINK 
                           002F86     2 	LINK=.
      002F86                          3 WAIT:
      00A887 FE                       4 	.byte 4   	
      00A888 72 5F 00 19              5 	.ascii "WAIT"
      00A88C AE B6                    6 	.word WAIT_IDX 
      002F8D                       4471 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



      00A88E 00 CF                    1 	.word LINK 
                           002F8F     2 	LINK=.
      002F8F                          3 USR:
      00A890 00                       4 	.byte 3+F_IFUNC   	
      00A891 1A CD 9E                 5 	.ascii "USR"
      00A894 D1 1F                    6 	.word USR_IDX 
      002F95                       4472 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      00A896 05 0F                    1 	.word LINK 
                           002F97     2 	LINK=.
      002F97                          3 UNTIL:
      00A898 03                       4 	.byte 5   	
      00A899 CD A8 4D CE A8           5 	.ascii "UNTIL"
      00A89E F6 90                    6 	.word UNTIL_IDX 
      002F9F                       4473 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      00A8A0 FF 72                    1 	.word LINK 
                           002FA1     2 	LINK=.
      002FA1                          3 UFLASH:
      00A8A2 A9                       4 	.byte 6+F_IFUNC   	
      00A8A3 00 02 1E 05 90 FF        5 	.ascii "UFLASH"
      00A8A9 72 A9                    6 	.word UFLASH_IDX 
      002FAA                       4474 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      00A8AB 00 02                    1 	.word LINK 
                           002FAC     2 	LINK=.
      002FAC                          3 UBOUND:
      00A8AD A6                       4 	.byte 6+F_IFUNC   	
      00A8AE 7C 6B 04 A3 00 7C        5 	.ascii "UBOUND"
      00A8B4 22 01                    6 	.word UBOUND_IDX 
      002FB5                       4475 	_dict_entry,4,TONE,TONE_IDX;tone  
      00A8B6 9F 6B                    1 	.word LINK 
                           002FB7     2 	LINK=.
      002FB7                          3 TONE:
      00A8B8 04                       4 	.byte 4   	
      00A8B9 CE 00 1C 1F              5 	.ascii "TONE"
      00A8BD 01 A2                    6 	.word TONE_IDX 
      00A8BE                       4476 	_dict_entry,2,TO,TO_IDX;to
      00A8BE 1E 01                    1 	.word LINK 
                           002FC0     2 	LINK=.
      002FC0                          3 TO:
      00A8C0 7B                       4 	.byte 2   	
      00A8C1 04 CD                    5 	.ascii "TO"
      00A8C3 A8 3D                    6 	.word TO_IDX 
      002FC5                       4477 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00A8C5 1F 01                    1 	.word LINK 
                           002FC7     2 	LINK=.
      002FC7                          3 TIMER:
      00A8C7 AE                       4 	.byte 5   	
      00A8C8 16 B8 CD 88 18           5 	.ascii "TIMER"
      00A8CD AE 00                    6 	.word TIMER_IDX 
      002FCF                       4478 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00A8CF 80 CD                    1 	.word LINK 
                           002FD1     2 	LINK=.
      002FD1                          3 TIMEOUT:
      00A8D1 89                       4 	.byte 7+F_IFUNC   	
      00A8D2 32 1E 01 C3 00 1E 24     5 	.ascii "TIMEOUT"
      00A8D9 16 1E                    6 	.word TMROUT_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



      002FDB                       4479 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00A8DB 05 72                    1 	.word LINK 
                           002FDD     2 	LINK=.
      002FDD                          3 TICKS:
      00A8DD F0                       4 	.byte 5+F_IFUNC   	
      00A8DE 03 1F 05 A6 80           5 	.ascii "TICKS"
      00A8E3 A3 00                    6 	.word TICKS_IDX 
      002FE5                       4480 	_dict_entry,4,STOP,STOP_IDX;stop 
      00A8E5 80 24                    1 	.word LINK 
                           002FE7     2 	LINK=.
      002FE7                          3 STOP:
      00A8E7 01                       4 	.byte 4   	
      00A8E8 9F 6B 04 CD              5 	.ascii "STOP"
      00A8EC A8 4D                    6 	.word STOP_IDX 
      002FEE                       4481 	_dict_entry,4,STEP,STEP_IDX;step 
      00A8EE 20 CE                    1 	.word LINK 
                           002FF0     2 	LINK=.
      002FF0                          3 STEP:
      00A8F0 5B                       4 	.byte 4   	
      00A8F1 06 90 85 85              5 	.ascii "STEP"
      00A8F5 81 42                    6 	.word STEP_IDX 
      002FF7                       4482 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      00A8F7 43 43                    1 	.word LINK 
                           002FF9     2 	LINK=.
      002FF9                          3 SPIWR:
      00A8F9 61                       4 	.byte 5   	
      00A8FA 6E 27 74 20 66           5 	.ascii "SPIWR"
      00A8FF 6C 61                    6 	.word SPIWR_IDX 
      003001                       4483 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00A901 73 68                    1 	.word LINK 
                           003003     2 	LINK=.
      003003                          3 SPISEL:
      00A903 20                       4 	.byte 6   	
      00A904 61 70 70 6C 69 63        5 	.ascii "SPISEL"
      00A90A 61 74                    6 	.word SPISEL_IDX 
      00300C                       4484 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      00A90C 69 6F                    1 	.word LINK 
                           00300E     2 	LINK=.
      00300E                          3 SPIRD:
      00A90E 6E                       4 	.byte 5+F_IFUNC   	
      00A90F 2C 20 61 6C 72           5 	.ascii "SPIRD"
      00A914 65 61                    6 	.word SPIRD_IDX 
      003016                       4485 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      00A916 64 79                    1 	.word LINK 
                           003018     2 	LINK=.
      003018                          3 SPIEN:
      00A918 20                       4 	.byte 5   	
      00A919 6F 6E 65 20 69           5 	.ascii "SPIEN"
      00A91E 6E 20                    6 	.word SPIEN_IDX 
      003020                       4486 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      00A920 46 4C                    1 	.word LINK 
                           003022     2 	LINK=.
      003022                          3 SLEEP:
      00A922 41                       4 	.byte 5   	
      00A923 53 48 0A 75 73           5 	.ascii "SLEEP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



      00A928 65 20                    6 	.word SLEEP_IDX 
      00302A                       4487     _dict_entry,4,SIZE,SIZE_IDX; cmd_size 
      00A92A 45 52                    1 	.word LINK 
                           00302C     2 	LINK=.
      00302C                          3 SIZE:
      00A92C 41                       4 	.byte 4   	
      00A92D 53 45 20 5C              5 	.ascii "SIZE"
      00A931 46 20                    6 	.word SIZE_IDX 
      003033                       4488 	_dict_entry,4,SAVE,SAVE_IDX ;save_app 
      00A933 62 65                    1 	.word LINK 
                           003035     2 	LINK=.
      003035                          3 SAVE:
      00A935 66                       4 	.byte 4   	
      00A936 6F 72 65 00              5 	.ascii "SAVE"
      00A93A 4E 6F                    6 	.word SAVE_IDX 
      00303C                       4489 	_dict_entry 3,RUN,RUN_IDX;run
      00A93C 20 61                    1 	.word LINK 
                           00303E     2 	LINK=.
      00303E                          3 RUN:
      00A93E 70                       4 	.byte 3   	
      00A93F 70 6C 69                 5 	.ascii "RUN"
      00A942 63 61                    6 	.word RUN_IDX 
      003044                       4490 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      00A944 74 69                    1 	.word LINK 
                           003046     2 	LINK=.
      003046                          3 RSHIFT:
      00A946 6F                       4 	.byte 6+F_IFUNC   	
      00A947 6E 20 69 6E 20 52        5 	.ascii "RSHIFT"
      00A94D 41 4D                    6 	.word RSHIFT_IDX 
      00304F                       4491 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      00A94F 00 46                    1 	.word LINK 
                           003051     2 	LINK=.
      00A950                          3 RND:
      00A950 CD                       4 	.byte 3+F_IFUNC   	
      00A951 9B 08 A1                 5 	.ascii "RND"
      00A954 84 27                    6 	.word RND_IDX 
      003057                       4492 	_dict_entry,6,RETURN,RET_IDX;return 
      00A956 03 CC                    1 	.word LINK 
                           003059     2 	LINK=.
      003059                          3 RETURN:
      00A958 97                       4 	.byte 6   	
      00A959 1E 90 F6 93 EE 01        5 	.ascii "RETURN"
      00A95F 72 A9                    6 	.word RET_IDX 
      003062                       4493 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00A961 00 03                    1 	.word LINK 
                           003064     2 	LINK=.
      003064                          3 RESTORE:
      00A963 C7                       4 	.byte 7   	
      00A964 00 19 CF 00 1A 52 45     5 	.ascii "RESTORE"
      00A969 00 80                    6 	.word REST_IDX 
      00306E                       4494 	_dict_entry 3,REM,REM_IDX;remark 
      00A969 CD 98                    1 	.word LINK 
                           003070     2 	LINK=.
      003070                          3 REM:
      00A96B 1F                       4 	.byte 3   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



      00A96C A1 08 27                 5 	.ascii "REM"
      00A96F 02 20                    6 	.word REM_IDX 
      003076                       4495 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      00A971 20 CD                    1 	.word LINK 
                           003078     2 	LINK=.
      003078                          3 REBOOT:
      00A973 9B                       4 	.byte 6   	
      00A974 08 A1 84 27 03 CC        5 	.ascii "REBOOT"
      00A97A 97 1E                    6 	.word RBT_IDX 
      003081                       4496 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      00A97C 90 F6                    1 	.word LINK 
                           003083     2 	LINK=.
      003083                          3 READ:
      00A97E 93                       4 	.byte 4+F_IFUNC   	
      00A97F EE 01 72 A9              5 	.ascii "READ"
      00A983 00 03                    6 	.word READ_IDX 
      00308A                       4497 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      00A985 9F 5F                    1 	.word LINK 
                           00308C     2 	LINK=.
      00308C                          3 QKEY:
      00A987 CD                       4 	.byte 4+F_IFUNC   	
      00A988 88 62 AE 00              5 	.ascii "QKEY"
      00A98C 01 CD                    6 	.word QKEY_IDX 
      003093                       4498 	_dict_entry,5+F_IFUNC,PORTI,PRTI_IDX;const_porti 
      00A98E 89 32                    1 	.word LINK 
                           003095     2 	LINK=.
      003095                          3 PORTI:
      00A990 20                       4 	.byte 5+F_IFUNC   	
      00A991 D7 4F 52 54 49           5 	.ascii "PORTI"
      00A992 00 76                    6 	.word PRTI_IDX 
      00309D                       4499 	_dict_entry,5+F_IFUNC,PORTH,PRTH_IDX;const_porth 
      00A992 81 95                    1 	.word LINK 
                           00309F     2 	LINK=.
      00A993                          3 PORTH:
      00A993 CD                       4 	.byte 5+F_IFUNC   	
      00A994 99 D8 A1 01 27           5 	.ascii "PORTH"
      00A999 03 CC                    6 	.word PRTH_IDX 
      0030A7                       4500 	_dict_entry,5+F_IFUNC,PORTG,PRTG_IDX;const_portg 
      00A99B 97 1E                    1 	.word LINK 
                           0030A9     2 	LINK=.
      0030A9                          3 PORTG:
      00A99D 90                       4 	.byte 5+F_IFUNC   	
      00A99E F6 93 EE 01 72           5 	.ascii "PORTG"
      00A9A3 A9 00                    6 	.word PRTG_IDX 
      0030B1                       4501 	_dict_entry,5+F_IFUNC,PORTF,PRTF_IDX;const_portf
      00A9A5 03 9F                    1 	.word LINK 
                           0030B3     2 	LINK=.
      0030B3                          3 PORTF:
      00A9A7 A4                       4 	.byte 5+F_IFUNC   	
      00A9A8 7F 81 52 54 46           5 	.ascii "PORTF"
      00A9AA 00 70                    6 	.word PRTF_IDX 
      0030BB                       4502 	_dict_entry,5+F_IFUNC,PORTE,PRTE_IDX;const_porte
      00A9AA A6 06                    1 	.word LINK 
                           0030BD     2 	LINK=.
      0030BD                          3 PORTE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



      00A9AC CD                       4 	.byte 5+F_IFUNC   	
      00A9AD 99 CB CD 98 1F           5 	.ascii "PORTE"
      00A9B2 A1 02                    6 	.word PRTE_IDX 
      0030C5                       4503 	_dict_entry,5+F_IFUNC,PORTD,PRTD_IDX;const_portd
      00A9B4 27 0E                    1 	.word LINK 
                           0030C7     2 	LINK=.
      0030C7                          3 PORTD:
      00A9B6 A1                       4 	.byte 5+F_IFUNC   	
      00A9B7 04 27 12 A1 82           5 	.ascii "PORTD"
      00A9BC 27 03                    6 	.word PRTD_IDX 
      0030CF                       4504 	_dict_entry,5+F_IFUNC,PORTC,PRTC_IDX;const_portc
      00A9BE CC 97                    1 	.word LINK 
                           0030D1     2 	LINK=.
      0030D1                          3 PORTC:
      00A9C0 1E                       4 	.byte 5+F_IFUNC   	
      00A9C1 50 4F 52 54 43           5 	.ascii "PORTC"
      00A9C1 FD 20                    6 	.word PRTC_IDX 
      0030D9                       4505 	_dict_entry,5+F_IFUNC,PORTB,PRTB_IDX;const_portb
      00A9C3 0B D1                    1 	.word LINK 
                           0030DB     2 	LINK=.
      00A9C4                          3 PORTB:
      00A9C4 F6                       4 	.byte 5+F_IFUNC   	
      00A9C5 88 CD 98 45 84           5 	.ascii "PORTB"
      00A9CA 20 03                    6 	.word PRTB_IDX 
      00A9CC                       4506 	_dict_entry,5+F_IFUNC,PORTA,PRTA_IDX;const_porta 
      00A9CC CD 98                    1 	.word LINK 
                           0030E5     2 	LINK=.
      0030E5                          3 PORTA:
      00A9CE 6E                       4 	.byte 5+F_IFUNC   	
      00A9CF 5F 02 72 A2 00           5 	.ascii "PORTA"
      00A9D4 03 90                    6 	.word PRTA_IDX 
      0030ED                       4507 	_dict_entry 5,PRINT,PRT_IDX;print 
      00A9D6 F7 90                    1 	.word LINK 
                           0030EF     2 	LINK=.
      0030EF                          3 PRINT:
      00A9D8 EF                       4 	.byte 5   	
      00A9D9 01 A6 07 CD 99           5 	.ascii "PRINT"
      00A9DE CB 64                    6 	.word PRT_IDX 
      00A9DF                       4508 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      00A9DF 90 F6                    1 	.word LINK 
                           0030F9     2 	LINK=.
      0030F9                          3 POUT:
      00A9E1 93                       4 	.byte 4+F_IFUNC   	
      00A9E2 EE 01 72 A9              5 	.ascii "POUT"
      00A9E6 00 03                    6 	.word POUT_IDX 
      003100                       4509 	_dict_entry,4,POKE,POKE_IDX;poke 
      00A9E8 81 F9                    1 	.word LINK 
                           003102     2 	LINK=.
      00A9E9                          3 POKE:
      00A9E9 CD                       4 	.byte 4   	
      00A9EA 89 D0 81 45              5 	.ascii "POKE"
      00A9ED 00 60                    6 	.word POKE_IDX 
      003109                       4510 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      00A9ED 5F C6                    1 	.word LINK 
                           00310B     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



      00310B                          3 PMODE:
      00A9EF 00                       4 	.byte 5   	
      00A9F0 2F C0 00 30 27           5 	.ascii "PMODE"
      00A9F5 03 53                    6 	.word PMODE_IDX 
      003113                       4511 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      00A9F7 A6 FF                    1 	.word LINK 
                           003115     2 	LINK=.
      00A9F9                          3 PINP:
      00A9F9 81                       4 	.byte 4+F_IFUNC   	
      00A9FA 50 49 4E 50              5 	.ascii "PINP"
      00A9FA CD 99                    6 	.word PINP_IDX 
      00311C                       4512 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      00A9FC D8 A1                    1 	.word LINK 
                           00311E     2 	LINK=.
      00311E                          3 PEEK:
      00A9FE 02                       4 	.byte 4+F_IFUNC   	
      00A9FF 27 03 CC 97              5 	.ascii "PEEK"
      00AA03 1E 90                    6 	.word PEEK_IDX 
      003125                       4513 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      00AA05 E6 03                    1 	.word LINK 
                           003127     2 	LINK=.
      003127                          3 PAUSE:
      00AA07 93                       4 	.byte 5   	
      00AA08 EE 04 A3 50 00           5 	.ascii "PAUSE"
      00AA0D 2B 16                    6 	.word PAUSE_IDX 
      00312F                       4514 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      00AA0F A3 50                    1 	.word LINK 
                           003131     2 	LINK=.
      003131                          3 PAD:
      00AA11 29                       4 	.byte 3+F_IFUNC   	
      00AA12 2A 11 89                 5 	.ascii "PAD"
      00AA15 90 F6                    6 	.word PAD_IDX 
      003137                       4515 	_dict_entry,2+F_OR,OR,OR_IDX; OR operator 
      00AA17 93 EE                    1 	.word LINK 
                           003139     2 	LINK=.
      003139                          3 OR:
      00AA19 01                       4 	.byte 2+F_OR   	
      00AA1A 72 A9                    5 	.ascii "OR"
      00AA1C 00 03                    6 	.word OR_IDX 
      00313E                       4516 	_dict_entry,2,ON,ON_IDX; cmd_on 
      00AA1E 72 FB                    1 	.word LINK 
                           003140     2 	LINK=.
      003140                          3 ON:
      00AA20 01                       4 	.byte 2   	
      00AA21 5B 02                    5 	.ascii "ON"
      00AA23 4F 81                    6 	.word ON_IDX 
      00AA25                       4517 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      00AA25 A6 0A                    1 	.word LINK 
                           003147     2 	LINK=.
      003147                          3 ODR:
      00AA27 CC                       4 	.byte 3+F_IFUNC   	
      00AA28 97 20 52                 5 	.ascii "ODR"
      00AA2A 00 54                    6 	.word ODR_IDX 
      00314D                       4518 	_dict_entry,3+F_NOT,NOT,NOT_IDX;NOT operator
      00AA2A CD A8                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



                           00314F     2 	LINK=.
      00314F                          3 NOT:
      00AA2C 36                       4 	.byte 3+F_NOT   	
      00AA2D 26 13 AE                 5 	.ascii "NOT"
      00AA30 B6 00                    6 	.word NOT_IDX 
      003155                       4519 	_dict_entry,4,NEXT,NEXT_IDX;next 
      00AA32 72 BB                    1 	.word LINK 
                           003157     2 	LINK=.
      003157                          3 NEXT:
      00AA34 B6                       4 	.byte 4   	
      00AA35 02 1C 00 04              5 	.ascii "NEXT"
      00AA39 1C 00                    6 	.word NEXT_IDX 
      00315E                       4520 	_dict_entry,3,NEW,NEW_IDX;new
      00AA3B 80 9F                    1 	.word LINK 
                           003160     2 	LINK=.
      003160                          3 NEW:
      00AA3D A4                       4 	.byte 3   	
      00AA3E 80 97 20                 5 	.ascii "NEW"
      00AA41 03 AE                    6 	.word NEW_IDX 
      003166                       4521 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      00AA43 B6 00                    1 	.word LINK 
                           003168     2 	LINK=.
      00AA45                          3 LSHIFT:
      00AA45 4F                       4 	.byte 6+F_IFUNC   	
      00AA46 81 53 48 49 46 54        5 	.ascii "LSHIFT"
      00AA47 00 4E                    6 	.word LSHIFT_IDX 
      003171                       4522 	_dict_entry,4+F_IFUNC,LOG2,LOG_IDX;log2 
      00AA47 CD 99                    1 	.word LINK 
                           003173     2 	LINK=.
      003173                          3 LOG2:
      00AA49 D8                       4 	.byte 4+F_IFUNC   	
      00AA4A A1 02 27 03              5 	.ascii "LOG2"
      00AA4E CC 97                    6 	.word LOG_IDX 
      00317A                       4523 	_dict_entry 4,LIST,LIST_IDX;list
      00AA50 1E 73                    1 	.word LINK 
                           00317C     2 	LINK=.
      00AA51                          3 LIST:
      00AA51 90                       4 	.byte 4   	
      00AA52 E6 03 93 EE              5 	.ascii "LIST"
      00AA56 04 CF                    6 	.word LIST_IDX 
      003183                       4524 	_dict_entry 3,LET,LET_IDX;let 
      00AA58 00 1A                    1 	.word LINK 
                           003185     2 	LINK=.
      003185                          3 LET:
      00AA5A 90                       4 	.byte 3   	
      00AA5B F6 93 EE                 5 	.ascii "LET"
      00AA5E 01 72                    6 	.word LET_IDX 
      00318B                       4525 	_dict_entry,3+F_CFUNC,KEY,KEY_IDX;key 
      00AA60 A9 00                    1 	.word LINK 
                           00318D     2 	LINK=.
      00318D                          3 KEY:
      00AA62 03                       4 	.byte 3+F_CFUNC   	
      00AA63 90 F7 90                 5 	.ascii "KEY"
      00AA66 EF 01                    6 	.word KEY_IDX 
      003193                       4526 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



      00AA68 72 CD                    1 	.word LINK 
                           003195     2 	LINK=.
      003195                          3 IWDGREF:
      00AA6A 00                       4 	.byte 7   	
      00AA6B 1A 81 44 47 52 45 46     5 	.ascii "IWDGREF"
      00AA6D 00 44                    6 	.word IWDGREF_IDX 
      00319F                       4527 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      00AA6D 72 0D                    1 	.word LINK 
                           0031A1     2 	LINK=.
      0031A1                          3 IWDGEN:
      00AA6F 52                       4 	.byte 6   	
      00AA70 30 FB 8E CC 81 43        5 	.ascii "IWDGEN"
      00AA76 00 42                    6 	.word IWDGEN_IDX 
      0031AA                       4528 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      00AA76 72 0D                    1 	.word LINK 
                           0031AC     2 	LINK=.
      0031AC                          3 INPUT:
      00AA78 52                       4 	.byte 5   	
      00AA79 30 FB 72 16 00           5 	.ascii "INPUT"
      00AA7E 23 8E                    6 	.word INPUT_IDX 
      0031B4                       4529 	_dict_entry,2,IF,IF_IDX;if 
      00AA80 81 AC                    1 	.word LINK 
                           0031B6     2 	LINK=.
      00AA81                          3 IF:
      00AA81 CD                       4 	.byte 2   	
      00AA82 9B 08                    5 	.ascii "IF"
      00AA84 A1 84                    6 	.word IF_IDX 
      0031BB                       4530 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      00AA86 27 03                    1 	.word LINK 
                           0031BD     2 	LINK=.
      0031BD                          3 IDR:
      00AA88 CC                       4 	.byte 3+F_IFUNC   	
      00AA89 97 1E 90                 5 	.ascii "IDR"
      00AA8C F6 93                    6 	.word IDR_IDX 
      0031C3                       4531 	_dict_entry,3,HEX,HEX_IDX;hex_base
      00AA8E EE 01                    1 	.word LINK 
                           0031C5     2 	LINK=.
      0031C5                          3 HEX:
      00AA90 72                       4 	.byte 3   	
      00AA91 A9 00 03                 5 	.ascii "HEX"
      00AA94 00 3A                    6 	.word HEX_IDX 
      0031CB                       4532 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      00AA94 CF 00                    1 	.word LINK 
                           0031CD     2 	LINK=.
      0031CD                          3 GOTO:
      00AA96 13                       4 	.byte 4   	
      00AA97 CE 00 13 5D              5 	.ascii "GOTO"
      00AA9B 27 03                    6 	.word GOTO_IDX 
      0031D4                       4533 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      00AA9D 8F 26                    1 	.word LINK 
                           0031D6     2 	LINK=.
      0031D6                          3 GOSUB:
      00AA9F F7                       4 	.byte 5   	
      00AAA0 47 4F 53 55 42           5 	.ascii "GOSUB"
      00AAA0 81 36                    6 	.word GOSUB_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



      00AAA1                       4534 	_dict_entry,3,GET,GET_IDX; cmd_get 
      00AAA1 CD 9B                    1 	.word LINK 
                           0031E0     2 	LINK=.
      0031E0                          3 GET:
      00AAA3 08                       4 	.byte 3   	
      00AAA4 A1 84 27                 5 	.ascii "GET"
      00AAA7 03 CC                    6 	.word GET_IDX 
      0031E6                       4535 	_dict_entry,4+F_IFUNC,FREE,FREE_IDX;free
      00AAA9 97 1E                    1 	.word LINK 
                           0031E8     2 	LINK=.
      0031E8                          3 FREE:
      00AAAB 90                       4 	.byte 4+F_IFUNC   	
      00AAAC F6 93 EE 01              5 	.ascii "FREE"
      00AAB0 72 A9                    6 	.word FREE_IDX 
      0031EF                       4536 	_dict_entry,3,FOR,FOR_IDX;for 
      00AAB2 00 03                    1 	.word LINK 
                           0031F1     2 	LINK=.
      00AAB4                          3 FOR:
      00AAB4 A3                       4 	.byte 3   	
      00AAB5 14 00 2B                 5 	.ascii "FOR"
      00AAB8 0C 35                    6 	.word FOR_IDX 
      0031F7                       4537 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      00AABA 0F 50                    1 	.word LINK 
                           0031F9     2 	LINK=.
      0031F9                          3 FCPU:
      00AABC F2                       4 	.byte 4   	
      00AABD A6 1E 62 A6              5 	.ascii "FCPU"
      00AAC1 10 62                    6 	.word FCPU_IDX 
      003200                       4538 	_dict_entry,5,ERASE,ERASE_IDX; erase 
      00AAC3 20 1E                    1 	.word LINK 
                           003202     2 	LINK=.
      00AAC5                          3 ERASE:
      00AAC5 A3                       4 	.byte 5   	
      00AAC6 08 00 2B 09 35           5 	.ascii "ERASE"
      00AACB 0E 50                    6 	.word ERASE_IDX 
      00320A                       4539 	_dict_entry,3,END,END_IDX;cmd_end  
      00AACD F2 A6                    1 	.word LINK 
                           00320C     2 	LINK=.
      00320C                          3 END:
      00AACF 50                       4 	.byte 3   	
      00AAD0 62 20 10                 5 	.ascii "END"
      00AAD3 00 2C                    6 	.word END_IDX 
      003212                       4540 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      00AAD3 35 07                    1 	.word LINK 
                           003214     2 	LINK=.
      003214                          3 EEPROM:
      00AAD5 50                       4 	.byte 6+F_IFUNC   	
      00AAD6 F2 45 50 52 4F 4D        5 	.ascii "EEPROM"
      00AAD7 00 2A                    6 	.word EEPROM_IDX 
      00321D                       4541 	_dict_entry,6+F_IFUNC,EEFREE,EEFREE_IDX; func_eefree 
      00AAD7 A3 00                    1 	.word LINK 
                           00321F     2 	LINK=.
      00321F                          3 EEFREE:
      00AAD9 40                       4 	.byte 6+F_IFUNC   	
      00AADA 23 07 72 5C 50 F2        5 	.ascii "EEFREE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



      00AAE0 54 20                    6 	.word EEFREE_IDX 
      003228                       4542 	_dict_entry,4,EDIT,EDIT_IDX ; edit 
      00AAE2 F4 1F                    1 	.word LINK 
                           00322A     2 	LINK=.
      00AAE3                          3 EDIT:
      00AAE3 9F                       4 	.byte 4   	
      00AAE4 4A 27 01 4A              5 	.ascii "EDIT"
      00AAE8 00 28                    6 	.word EDIT_IDX 
      003231                       4543 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      00AAE8 A4 3E                    1 	.word LINK 
                           003233     2 	LINK=.
      003233                          3 DWRITE:
      00AAEA C7                       4 	.byte 6+F_CMD   	
      00AAEB 50 F1 72 18 50 F0        5 	.ascii "DWRITE"
      00AAF1 8E 81                    6 	.word DWRITE_IDX 
      00AAF3                       4544 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      00AAF3 C6 00                    1 	.word LINK 
                           00323E     2 	LINK=.
      00323E                          3 DREAD:
      00AAF5 10                       4 	.byte 5+F_IFUNC   	
      00AAF6 CE 00 11 81 44           5 	.ascii "DREAD"
      00AAFA 00 24                    6 	.word DREAD_IDX 
      003246                       4545 	_dict_entry,2,DO,DO_IDX;do_loop
      00AAFA CD 99                    1 	.word LINK 
                           003248     2 	LINK=.
      003248                          3 DO:
      00AAFC D8                       4 	.byte 2   	
      00AAFD A1 01                    5 	.ascii "DO"
      00AAFF 27 03                    6 	.word DO_IDX 
      00324D                       4546 	_dict_entry,3,DEC,DEC_IDX;dec_base
      00AB01 CC 97                    1 	.word LINK 
                           00324F     2 	LINK=.
      00324F                          3 DEC:
      00AB03 1E                       4 	.byte 3   	
      00AB04 44 45 43                 5 	.ascii "DEC"
      00AB04 CD 82                    6 	.word DEC_IDX 
      003255                       4547 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      00AB06 5F 90                    1 	.word LINK 
                           003257     2 	LINK=.
      003257                          3 DDR:
      00AB08 F6                       4 	.byte 3+F_IFUNC   	
      00AB09 93 EE 01                 5 	.ascii "DDR"
      00AB0C 72 A9                    6 	.word DDR_IDX 
      00325D                       4548 	_dict_entry,4,DATA,DATA_IDX;data  
      00AB0E 00 03                    1 	.word LINK 
                           00325F     2 	LINK=.
      00325F                          3 DATA:
      00AB10 81                       4 	.byte 4   	
      00AB11 44 41 54 41              5 	.ascii "DATA"
      00AB11 CD 99                    6 	.word DATA_IDX 
      003266                       4549 	_dict_entry,3+F_IFUNC,CR2,CR2_IDX;const_cr2 
      00AB13 D8 A1                    1 	.word LINK 
                           003268     2 	LINK=.
      003268                          3 CR2:
      00AB15 02                       4 	.byte 3+F_IFUNC   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



      00AB16 27 03 CC                 5 	.ascii "CR2"
      00AB19 97 1E                    6 	.word CR2_IDX 
      00326E                       4550 	_dict_entry,3+F_IFUNC,CR1,CR1_IDX;const_cr1 
      00AB1B 90 F6                    1 	.word LINK 
                           003270     2 	LINK=.
      003270                          3 CR1:
      00AB1D 93                       4 	.byte 3+F_IFUNC   	
      00AB1E EE 01 72                 5 	.ascii "CR1"
      00AB21 A9 00                    6 	.word CR1_IDX 
      003276                       4551 	_dict_entry,5,CONST,CONST_IDX; cmd_const 
      00AB23 03 90                    1 	.word LINK 
                           003278     2 	LINK=.
      003278                          3 CONST:
      00AB25 93                       4 	.byte 5   	
      00AB26 90 F6 93 EE 01           5 	.ascii "CONST"
      00AB2B 90 5D                    6 	.word CONST_IDX 
      003280                       4552 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      00AB2D 27 07                    1 	.word LINK 
                           003282     2 	LINK=.
      003282                          3 CHAR:
      00AB2F 98                       4 	.byte 4+F_CFUNC   	
      00AB30 59 49 90 5A              5 	.ascii "CHAR"
      00AB34 26 F9                    6 	.word CHAR_IDX 
      003289                       4553 	_dict_entry,3,BYE,BYE_IDX;bye 
      00AB36 90 F7                    1 	.word LINK 
                           00328B     2 	LINK=.
      00328B                          3 BYE:
      00AB38 90                       4 	.byte 3   	
      00AB39 EF 01 A6                 5 	.ascii "BYE"
      00AB3C 84 81                    6 	.word BYE_IDX 
      00AB3E                       4554 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      00AB3E CD 99                    1 	.word LINK 
                           003293     2 	LINK=.
      003293                          3 BTOGL:
      00AB40 D8                       4 	.byte 5   	
      00AB41 A1 02 27 03 CC           5 	.ascii "BTOGL"
      00AB46 97 1E                    6 	.word BTOGL_IDX 
      00329B                       4555 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      00AB48 90 F6                    1 	.word LINK 
                           00329D     2 	LINK=.
      00329D                          3 BTEST:
      00AB4A 93                       4 	.byte 5+F_IFUNC   	
      00AB4B EE 01 72 A9 00           5 	.ascii "BTEST"
      00AB50 03 90                    6 	.word BTEST_IDX 
      0032A5                       4556 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      00AB52 93 90                    1 	.word LINK 
                           0032A7     2 	LINK=.
      0032A7                          3 BSET:
      00AB54 F6                       4 	.byte 4   	
      00AB55 93 EE 01 90              5 	.ascii "BSET"
      00AB59 5D 27                    6 	.word BSET_IDX 
      0032AE                       4557 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      00AB5B 07 98                    1 	.word LINK 
                           0032B0     2 	LINK=.
      0032B0                          3 BRES:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



      00AB5D 56                       4 	.byte 4   	
      00AB5E 46 90 5A 26              5 	.ascii "BRES"
      00AB62 F9 90                    6 	.word BRES_IDX 
      0032B7                       4558 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      00AB64 F7 90                    1 	.word LINK 
                           0032B9     2 	LINK=.
      0032B9                          3 BIT:
      00AB66 EF                       4 	.byte 3+F_IFUNC   	
      00AB67 01 A6 84                 5 	.ascii "BIT"
      00AB6A 81 0A                    6 	.word BIT_IDX 
      00AB6B                       4559 	_dict_entry,3,AWU,AWU_IDX;awu 
      00AB6B A6 84                    1 	.word LINK 
                           0032C1     2 	LINK=.
      0032C1                          3 AWU:
      00AB6D CD                       4 	.byte 3   	
      00AB6E 99 CB CD                 5 	.ascii "AWU"
      00AB71 98 5E                    6 	.word AWU_IDX 
      0032C7                       4560 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      00AB73 9F A4                    1 	.word LINK 
                           0032C9     2 	LINK=.
      0032C9                          3 ASC:
      00AB75 07                       4 	.byte 3+F_IFUNC   	
      00AB76 C7 50 C6                 5 	.ascii "ASC"
      00AB79 81 06                    6 	.word ASC_IDX 
      00AB7A                       4561 	_dict_entry,3+F_AND,AND,AND_IDX ; AND operator 
      00AB7A 52 01                    1 	.word LINK 
                           0032D1     2 	LINK=.
      0032D1                          3 AND:
      00AB7C CD                       4 	.byte 3+F_AND   	
      00AB7D 99 DD A1                 5 	.ascii "AND"
      00AB80 02 27                    6 	.word AND_IDX 
      0032D7                       4562 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      00AB82 03 CC                    1 	.word LINK 
                           0032D9     2 	LINK=.
      0032D9                          3 ADCREAD:
      00AB84 97                       4 	.byte 7+F_IFUNC   	
      00AB85 1E 90 F6 93 EE 01 72     5 	.ascii "ADCREAD"
      00AB8C A9 00                    6 	.word ADCREAD_IDX 
      0032E3                       4563 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      00AB8E 03 CF                    1 	.word LINK 
                           0032E5     2 	LINK=.
      0032E5                          3 ADCON:
      00AB90 00                       4 	.byte 5   	
      00AB91 1A 90 F6 93 EE           5 	.ascii "ADCON"
      00AB96 01 72                    6 	.word ADCON_IDX 
      0032ED                       4564 kword_dict::
      0032ED                       4565 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      00AB98 A9 00                    1 	.word LINK 
                           0032EF     2 	LINK=.
      0032EF                          3 ABS:
      00AB9A 03                       4 	.byte 3+F_IFUNC   	
      00AB9B CD AB D9                 5 	.ascii "ABS"
      00AB9E 6B 01                    6 	.word ABS_IDX 
                                   4566 
                                   4567 ;comands and fonctions address table 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal [24-Bits]



      0032F5                       4568 code_addr::
      00ABA0 A6 01 0D 01 27 0D 48  4569 	.word abs,power_adc,analog_read,ascii,awu,bitmask ; 0..7
             0A 01 26 FB 6B
      00ABAC 01 7B 01 EA 03 E7 03  4570 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             A6 01 C1 00 0F 27 10
      00ABBA 7B 01 43 E4 04 E7 04  4571 	.word const_cr1,data,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
             7B 01 43 E4 02 E7 02
      00ABC8 20 0C 2D DC 25 47 27  4572 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto ; 24..31 
             45 2A EB 27 E1 22 71
             24 A7 24 8D
      00ABCA 1C 15 2D BE 22 54 20  4573 	.word hex_base,const_idr,if,input_var,enable_iwdg,refresh_iwdg,key ; 32..39 
             92 2C B0 2C EE 29 69
      00ABCA 7B 01 EA 02 E7 02 7B  4574 	.word let,list,log2,lshift,next,new ; 40..47
             01 EA 04 E7 04
      00ABD6 2D B9 2F 63 2A 01 2A  4575 	.word const_odr,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             FA 22 33 2D D7
      00ABD6 5B 01 81 D2 1F EF 2D  4576 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             8C 2D 91 2D 96 2D 9B
             2D A0
      00ABD9 2D A5 2D AA 2D AF 2D  4577 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             B4 29 6D 2E 5F 00 C3
             21 31
      00ABD9 58 1C AB E9 FE 9F 88  4578 	.word restore,return, random,rshift,run,free ; 72..79
             5E A6 05 42 1C
      00ABE5 50 00 84 81 2E AD 2F  4579 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             4C 2F 25 22 DB 26 EF
             2A 73
      00ABE9 2C 8E 2C A5 22 9B 25  4580 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             86 1C 68 29 AA 2D 59
             29 C7
      00ABE9 03 06 03 05 04 00 02  4581 	.word wait,words,write,cmd_size,cmd_on,cmd_get,cmd_const ; 96..99
             01 06 00 02 02 02 03
      00ABF7 03 01 03 03           4582 	.word func_eefree,0 
                                   4583 
                                   4584 
                                   4585 
                                   4586 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 227.
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
      0033B3                         30 test:
      0033B3                         31     _vars VSIZE 
      00ABFB 02 04            [ 2]    1     sub sp,#VSIZE 
      00ABFD 04 05 02         [ 2]   32     ldw x,#LOOP_CNT
      00AC00 06 02            [ 2]   33     ldw (CNTR,sp),x  
      00AC02 07 02 05         [ 2]   34     ldw x,ticks 
      00AC05 04 02            [ 2]   35     ldw (T,sp),x
      0033BF                         36 1$: ; test add24 
      00AC07 04 01            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00AC09 AE FF FF         [ 2]   38     ldw x,#VAL1&0XFFFF
      00AC09 CD 99 D8         [ 1]   39     ld acc24,a 
      00AC0C A1 01 27         [ 2]   40     ldw acc24+1,x  
      00AC0F 03 CC            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00AC11 97 1E FF         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00AC13 CD 01 6A         [ 4]   43     call add24 
      00AC13 90 F6            [ 2]   44     ldw x,(CNTR,sp)
      00AC15 93 EE 01         [ 2]   45     subw x,#1
      00AC18 72 A9            [ 2]   46     ldw (CNTR,sp),x 
      00AC1A 00 03            [ 1]   47     jrne 1$
      00AC1C 89 88 A6         [ 4]   48     call prt_acc24
      00AC1F 80 15            [ 1]   49     ld a,#SPACE 
      00AC21 01 27 05         [ 4]   50     call putc 
      00AC24 A6 0A CC         [ 2]   51     ldw x,ticks 
      00AC27 97 20 01         [ 2]   52     subw x,(T,sp)
      00AC29 CD 17 F4         [ 4]   53     call prt_i16  
      00AC29 CE 00            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
Hexadecimal [24-Bits]



      00AC2B 15 58 58         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00AC2E 58 58 58         [ 2]   58     ldw x,LOOP_CNT
      00AC31 9E C8            [ 2]   59     ldw (CNTR,sp),x 
      00AC33 00 15 C7         [ 2]   60     ldw x,ticks 
      00AC36 00 0E            [ 2]   61     ldw (T,sp),x 
      0033FB                         62 2$: 
      00AC38 9F C8            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00AC3A 00 16 C7         [ 2]   64     ldw x,#VAL1&0XFFFF
      00AC3D 00 0F CE         [ 1]   65     ld acc24,a 
      00AC40 00 17 CF         [ 2]   66     ldw acc24+1,x  
      00AC43 00 15            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00AC45 CE 00 17         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00AC48 54 9E C8         [ 4]   69     call mul24 
      00AC4B 00 17            [ 2]   70     ldw x,(CNTR,sp)
      00AC4D C7 00 17         [ 2]   71     subw x,#1
      00AC50 9F C8            [ 2]   72     ldw (CNTR,sp),x 
      00AC52 00 18            [ 1]   73     jrne 2$ 
      00AC54 C7 00 18         [ 4]   74    call prt_acc24 
      00AC57 CE 00            [ 1]   75    ld a,#SPACE 
      00AC59 0E 54 54         [ 4]   76    call putc 
      00AC5C 54 9E C8         [ 2]   77     ldw x,ticks 
      00AC5F 00 0E C7         [ 2]   78     subw x,(T,sp)
      00AC62 00 0E 9F         [ 4]   79     call prt_i16 
      00AC65 C8 00            [ 1]   80     ld a,#CR 
      00AC67 0F C7 00         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00AC6A 0F C8 00         [ 2]   83     ldw x,LOOP_CNT
      00AC6D 18 97            [ 2]   84     ldw (CNTR,sp),x 
      00AC6F C6 00 0E         [ 2]   85     ldw x,ticks 
      00AC72 C8 00            [ 2]   86     ldw (T,sp),x 
      003437                         87 3$: 
      00AC74 17 95            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00AC76 CF 00 17         [ 2]   89     ldw x,#VAL1&0XFFFF
      00AC79 C6 00 16         [ 1]   90     ld acc24,a 
      00AC7C A4 7F 72         [ 2]   91     ldw acc24+1,x  
      00AC7F A2 00            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00AC81 03 90 F7         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00AC84 90 EF 01         [ 4]   94     call mul24 
      00AC87 84 85            [ 2]   95     ldw x,(CNTR,sp)
      00AC89 72 A2 00         [ 2]   96     subw x,#1
      00AC8C 03 90            [ 2]   97     ldw (CNTR,sp),x 
      00AC8E F7 90            [ 1]   98     jrne 3$ 
      00AC90 EF 01 CD         [ 4]   99     call prt_acc24    
      00AC93 84 51            [ 1]  100     ld a,#SPACE 
      00AC95 90 F6 93         [ 4]  101     call putc 
      00AC98 EE 01 72         [ 2]  102     ldw x,ticks 
      00AC9B A9 00 03         [ 2]  103     subw x,(T,sp)
      00AC9E 1C 00 01         [ 4]  104     call prt_i16 
      00ACA1 A9 00            [ 1]  105     ld a,#CR 
      00ACA3 81 09 40         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00ACA4 CE 27 10         [ 2]  108     ldw x,LOOP_CNT
      00ACA4 90 89            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



      00ACA6 52 03 0F         [ 2]  110     ldw x,ticks 
      00ACA9 02 0F            [ 2]  111     ldw (T,sp),x 
      003473                        112 4$:
      00ACAB 03 90            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00ACAD AE B3 6F         [ 2]  114     ldw x,#VAL1&0XFFFF
      00ACB0 93 F6 A4         [ 1]  115     ld acc24,a 
      00ACB3 0F 6B 01         [ 2]  116     ldw acc24+1,x  
      00ACB6 0C 03            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00ACB8 5C F6 CD         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00ACBB 89 C0 0C         [ 4]  119     call mul24 
      00ACBE 02 0A            [ 2]  120     ldw x,(CNTR,sp)
      00ACC0 01 26 F5         [ 2]  121     subw x,#1
      00ACC3 A6 46            [ 2]  122     ldw (CNTR,sp),x 
      00ACC5 11 02            [ 1]  123     jrne 4$ 
      00ACC7 2B 09 A6         [ 4]  124     call prt_acc24 
      00ACCA 20 CD            [ 1]  125     ld a,#SPACE 
      00ACCC 89 C0 0C         [ 4]  126     call putc 
      00ACCF 02 20 07         [ 2]  127     ldw x,ticks 
      00ACD2 A6 0D CD         [ 2]  128     subw x,(T,sp)
      00ACD5 89 C0 0F         [ 4]  129     call prt_i16 
      00ACD8 02 72            [ 1]  130     ld a,#CR 
      00ACDA A2 00 02         [ 4]  131     call putc 
                                    132 ; test abs24 
      00ACDD 90 FE 26         [ 2]  133     ldw x,LOOP_CNT
      00ACE0 CF A6            [ 2]  134     ldw (CNTR,sp),x 
      00ACE2 0D CD 89         [ 2]  135     ldw x,ticks 
      00ACE5 C0 5F            [ 2]  136     ldw (T,sp),x 
      0034AF                        137 5$: 
      00ACE7 7B 03            [ 1]  138     ld a,#0xff
      00ACE9 97 CD 98         [ 2]  139     ldw x,#0xffff
      00ACEC 74 AE AC         [ 4]  140     call abs24 
      00ACEF F8 CD 8A         [ 1]  141     ld acc24,a 
      00ACF2 1D 5B 03         [ 2]  142     ldw acc24+1,x
      00ACF5 90 85            [ 2]  143     ldw x,(CNTR,sp)
      00ACF7 81 20 77         [ 2]  144     subw x,#1
      00ACFA 6F 72            [ 2]  145     ldw (CNTR,sp),x 
      00ACFC 64 73            [ 1]  146     jrne 5$ 
      00ACFE 20 69 6E         [ 4]  147     call prt_acc24 
      00AD01 20 64            [ 1]  148     ld a,#SPACE 
      00AD03 69 63 74         [ 4]  149     call putc 
      00AD06 69 6F 6E         [ 2]  150     ldw x,ticks 
      00AD09 61 72 79         [ 2]  151     subw x,(T,sp)
      00AD0C 0A 00 F4         [ 4]  152     call prt_i16 
      00AD0E                        153 6$:
      00AD0E CD 99            [ 1]  154     ld a,#CR 
      00AD10 DD A1 01         [ 4]  155     call putc 
      00AD13 27 03 CC         [ 4]  156     call read_integer 
      00AD16 97 1E 0C 00 18   [ 1]  157     mov farptr,acc24 
      00AD18 55 00 0D 00 19   [ 1]  158     mov farptr+1,acc16 
      00AD18 90 F6 93 EE 01   [ 1]  159     mov farptr+2,acc8 
      00AD1D 72 A9 00         [ 4]  160     call read_integer 
      00AD20 03 CF 00         [ 1]  161     ld a,acc24 
      00AD23 13 81 0D         [ 2]  162     ldw x,acc16 
      00AD25 55 00 18 00 0C   [ 1]  163     mov acc24,farptr 
      00AD25 4F CE 00 13 27   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
Hexadecimal [24-Bits]



      00AD2A 02 5F 81 43 53   [ 1]  165     mov acc8,farptr+2 
      00AD2F 81 03 23         [ 4]  166     call div24 
      00AD30 88               [ 1]  167     push a 
      00AD30 CD               [ 2]  168     pushw x 
      00AD31 99 DD A1         [ 4]  169     call prt_acc24 
      00AD34 01 27            [ 1]  170     ld a,#SPACE 
      00AD36 03 CC 97         [ 4]  171     call putc 
      00AD39 1E               [ 2]  172     popw x
      00AD3A 90 F6 93         [ 2]  173     ldw acc16,x  
      00AD3D EE 01 72         [ 1]  174     pop acc24 
      00AD40 A9 00 03         [ 4]  175     call prt_acc24
      00AD43 4B 00            [ 2]  176     jra 6$
      00351F                        177     _drop VSIZE 
      00AD45 35 CC            [ 2]    1     addw sp,#VSIZE 
      00AD47 50               [ 4]  178     ret 
                                    179 
                                    180 
      003522                        181 read_integer:
      00AD48 E0 9E            [ 1]  182     ld a,#'? 
      00AD4A A4 3F 95         [ 4]  183     call putc  
      00AD4D A3 00 FF 23      [ 1]  184 	clr count  
      00AD51 06 0C 01         [ 4]  185 	call readln 
      00AD54 98 56 20         [ 2]  186 	ldw x,#tib 
      00AD57 F5 35 55         [ 1]  187 	push count
      00AD5A 50 E0            [ 1]  188 	push #0 
      00AD5C 84 C7 50         [ 2]  189 	addw x,(1,sp)
      00AD5F E1               [ 1]  190 	incw x 
      00353A                        191 	_drop 2 
      00AD60 9F 4A            [ 2]    1     addw sp,#2 
      00AD62 35 55 50 E0      [ 1]  192 	clr in 
      00AD66 C7 50 E2         [ 4]  193 	call get_token
      00AD69 35 AA            [ 1]  194 	cp a,#TK_INTGR
      00AD6B 50 E0            [ 1]  195 	jreq 3$ 
      00AD6D 81 11            [ 1]  196 	cp a,#TK_MINUS
      00AD6E CD 0F 17         [ 4]  197 	call get_token 
      00AD6E 35 AA            [ 1]  198 	cp a,#TK_INTGR 
      00AD70 50 E0            [ 1]  199 	jreq 2$
      00AD72 81 16 9E         [ 2]  200 	jp syntax_error
      00AD73                        201 2$:
      00AD73 CD 99 D8         [ 4]  202 	call neg_acc24  	
      003556                        203 3$: 
      00AD76 A1               [ 4]  204     ret 
                                    205 
                                    206 .endif ; DEBUG  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 231.
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
      00AD77 01 27                   31 app_sign:  .word 0 ; .ascii "BC"  ; signature 
      00AD79 03 CC                   32 app_size: .word 0 
      003584                         33 app: 
                                     34 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     A32     =  000005     |   4 ABS        0032EF R
    ABS_IDX =  000000     |     ACK     =  000006     |   4 ADCON      0032E5 R
    ADCON_ID=  000002     |   4 ADCREAD    0032D9 R   |     ADCREAD_=  000004 
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
  4 AND        0032D1 R   |     AND_IDX =  0000FA     |     ARG_OFS =  000002 
    ARROW_LE=  000080     |     ARROW_RI=  000081     |   4 ASC        0032C9 R
    ASC_IDX =  000006     |     ATMP    =  000001     |     ATTRIB  =  000002 
  4 AUTO_RUN   000157 R   |   4 AWU        0032C1 R   |   4 AWUHandl   000004 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_CSR_=  000004 
    AWU_IDX =  000008     |     AWU_TBR =  0050F2     |     B0_MASK =  000001 
    B115200 =  000006     |     B19200  =  000003     |     B1_MASK =  000002 
    B230400 =  000007     |     B2400   =  000000     |     B2_MASK =  000004 
    B38400  =  000004     |     B3_MASK =  000008     |     B460800 =  000008 
    B4800   =  000001     |     B4_MASK =  000010     |     B57600  =  000005 
    B5_MASK =  000020     |     B6_MASK =  000040     |     B7_MASK =  000080 
    B921600 =  000009     |     B9600   =  000002     |     BASE    =  000002 
    BASE_SAV=  000001     |     BCNT    =  000001     |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
    BELL    =  000007     |     BINARY  =  000001     |   4 BIT        0032B9 R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000A 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  00000D     |   4 BRES       0032B0 R   |     BRES_IDX=  00000C 
    BS      =  000008     |   4 BSET       0032A7 R   |     BSET_IDX=  00000E 
    BSIZE   =  000006     |   4 BTEST      00329D R   |     BTEST_ID=  000010 
  4 BTOGL      003293 R   |     BTOGL_ID=  000012     |     BTW     =  000001 
    BUFPTR  =  000003     |   4 BYE        00328B R   |     BYE_IDX =  000014 
    C       =  000001     |     CAN     =  000018     |   4 CANT_DO    002878 R
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
    CC_V    =  000007     |     CC_Z    =  000001     |     CELL_SIZ=  000003 
    CFG_GCR =  007F60     |     CFG_GCR_=  000001     |     CFG_GCR_=  000000 
  4 CHAR       003282 R   |     CHAR_IDX=  000016     |     CLKOPT  =  004807 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 233.
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
    CMD_END =  000002     |     CNAME   =  000001     |     CNT     =  000006 
    CNTR    =  000003     |     CNT_LO  =  000004     |     COMMA   =  00002C 
  4 CONST      003278 R   |   4 CONST_CO   001D1B R   |     CONST_ID=  0000B8 
    CONST_RE=  000005     |     COUNT   =  000003     |     CPOS    =  000003 
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |     CR      =  00000D 
  4 CR1        003270 R   |     CR1_IDX =  00001A     |   4 CR2        003268 R
    CR2_IDX =  000018     |     CTRL_A  =  000001     |     CTRL_B  =  000002 
    CTRL_C  =  000003     |     CTRL_D  =  000004     |     CTRL_E  =  000005 
    CTRL_F  =  000006     |     CTRL_G  =  000007     |     CTRL_H  =  000008 
    CTRL_I  =  000009     |     CTRL_J  =  00000A     |     CTRL_K  =  00000B 
    CTRL_L  =  00000C     |     CTRL_M  =  00000D     |     CTRL_N  =  00000E 
    CTRL_O  =  00000F     |     CTRL_P  =  000010     |     CTRL_Q  =  000011 
    CTRL_R  =  000012     |     CTRL_S  =  000013     |     CTRL_T  =  000014 
    CTRL_U  =  000015     |     CTRL_V  =  000016     |     CTRL_W  =  000017 
    CTRL_X  =  000018     |     CTRL_Y  =  000019     |     CTRL_Z  =  00001A 
    CTXT_SIZ=  000004     |     CTX_BPTR=  000001     |     CTX_COUN=  000004 
    CTX_IN  =  000003     |     CURR    =  000002     |     CVAR    =  000009 
    CX_BPTR =  000001     |     CX_CNT  =  000004     |     CX_IN   =  000003 
  4 DATA       00325F R   |     DATA_IDX=  00001C     |     DBG_A   =  000008 
    DBG_CC  =  000009     |     DBG_X   =  000006     |     DBG_Y   =  000004 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   4 DDR        003257 R   |     DDR_IDX =  00001E 
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  4 DEC        00324F R   |     DEC_IDX =  000020     |     DEST    =  000001 
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |     DIVISOR =  000001 
    DIVSOR  =  000001     |     DLE     =  000010     |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   4 DO         003248 R   |     DOLP_ADR=  000003 
    DOLP_INW=  000005     |     DO_IDX  =  000022     |   4 DREAD      00323E R
    DREAD_ID=  000024     |   4 DWRITE     003233 R   |     DWRITE_I=  000026 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 234.
Hexadecimal [24-Bits]

Symbol Table

  4 EDIT       00322A R   |     EDIT_IDX=  000028     |   4 EEFREE     00321F R
    EEFREE_I=  0000BA     |   4 EEPROM     003214 R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_I=  00002A     |     EEPROM_S=  000800 
    EEPTR   =  000003     |     EM      =  000019     |   4 END        00320C R
    END_IDX =  00002C     |     ENQ     =  000005     |     EOF     =  0000FF 
    EOT     =  000004     |   4 ERASE      003202 R   |     ERASE_ID=  00002E 
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_OVER=  000010 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    ETB     =  000017     |     ETX     =  000003     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FBREAK  =  000004     |     FCOMP   =  000005 
  4 FCPU       0031F9 R   |     FCPU_IDX=  000030     |     FF      =  00000C 
    FHSE    =  7A1200     |     FHSI    =  F42400     |     FIRST   =  000001 
    FIRST_DA=  000006     |     FLASH_BA=  008000     |     FLASH_CR=  00505A 
    FLASH_CR=  000002     |     FLASH_CR=  000000     |     FLASH_CR=  000003 
    FLASH_CR=  000001     |     FLASH_CR=  00505B     |     FLASH_CR=  000005 
    FLASH_CR=  000004     |     FLASH_CR=  000007     |     FLASH_CR=  000000 
    FLASH_CR=  000006     |     FLASH_DU=  005064     |     FLASH_DU=  0000AE 
    FLASH_DU=  000056     |     FLASH_EN=  027FFF     |     FLASH_FP=  00505D 
    FLASH_FP=  000000     |     FLASH_FP=  000001     |     FLASH_FP=  000002 
    FLASH_FP=  000003     |     FLASH_FP=  000004     |     FLASH_FP=  000005 
    FLASH_IA=  00505F     |     FLASH_IA=  000003     |     FLASH_IA=  000002 
    FLASH_IA=  000006     |     FLASH_IA=  000001     |     FLASH_IA=  000000 
  4 FLASH_ME   001EC2 R   |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |     FLOOP   =  000002 
    FLSI    =  01F400     |   4 FOR        0031F1 R   |     FOR_IDX =  000034 
  4 FREE       0031E8 R   |     FREE_IDX=  00008A     |     FRUN    =  000000 
    FS      =  00001C     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_AND   =  000080     |     F_CFUNC =  000020 
    F_CMD   =  000000     |     F_CONST =  000030     |     F_IFUNC =  000010 
    F_NOT   =  000070     |     F_OR    =  000090     |     F_XOR   =  0000A0 
  4 GET        0031E0 R   |     GET_IDX =  0000B6     |   4 GOSUB      0031D6 R
    GOSUB_ID=  000036     |   4 GOTO       0031CD R   |     GOTO_IDX=  000038 
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |     GS      =  00001D     |   4 HEX        0031C5 R
    HEX_IDX =  00003A     |     HOME    =  000082     |     HSECNT  =  004809 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
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
  4 IDR        0031BD R   |     IDR_IDX =  00003C     |   4 IF         0031B6 R
    IF_IDX  =  00003E     |     IN      =  000005     |     INCR    =  000001 
    INP     =  000000     |   4 INPUT      0031AC R   |     INPUT_DI=  000000 
    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_ID=  000040 
    INPUT_PU=  000001     |     INT24   =  000005     |     INT_ADC2=  000016 
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
    INW     =  00000B     |     IPOS    =  000001     |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |   4 IWDGEN     0031A1 R   |     IWDGEN_I=  000042 
  4 IWDGREF    003195 R   |     IWDGREF_=  000044     |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |     KCHAR   =  000002 
  4 KEY        00318D R   |     KEY_END =  000083     |     KEY_IDX =  000046 
    KW_TYPE_=  0000F0     |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000002     |   4 LET        003185 R   |     LET_IDX =  000048 
    LF      =  00000A     |     LIMIT   =  000001     |     LINENO  =  000005 
  4 LINK    =  0032EF R   |   4 LIST       00317C R   |     LIST_IDX=  00004A 
    LL      =  000001     |     LLEN    =  000002     |     LL_HB   =  000001 
    LN_PTR  =  000005     |   4 LOG2       003173 R   |     LOG_IDX =  00004C 
    LOOP_CNT=  002710     |   4 LSHIFT     003168 R   |     LSHIFT_I=  00004E 
    MAJOR   =  000002     |     MASK    =  000002     |     MAX_LINE=  007FFF 
    MINOR   =  000000     |     MULOP   =  000001     |     N1      =  000004 
    N2      =  000007     |     NAFR    =  004804     |     NAK     =  000015 
    NAMEPTR =  000001     |     NCLKOPT =  004808     |     NEG     =  000001 
  4 NEW        003160 R   |     NEW_IDX =  000052     |   4 NEXT       003157 R
    NEXT_IDX=  000050     |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 236.
Hexadecimal [24-Bits]

Symbol Table

    NLEN    =  000001     |     NLEN_MAS=  00000F     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   4 NOT        00314F R   |     NOT_IDX =  0000F8 
    NOT_OP  =  000001     |   4 NOT_SAVE   001FB4 R   |   4 NO_APP     0028BA R
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  4 NonHandl   000000 R   |   4 ODR        003147 R   |     ODR_IDX =  000054 
  4 ON         003140 R   |     ONOFF   =  000003     |     ON_IDX  =  0000B4 
    OP      =  000002     |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   4 OR         003139 R
    OR_IDX  =  0000FC     |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVRWR   =  000004     |     PA      =  000000     |   4 PAD        003131 R
    PAD_IDX =  000056     |     PAD_SIZE=  000080     |   4 PAUSE      003127 R
    PAUSE_ID=  000058     |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |     PD_BASE =  00500F     |     PD_CR1  =  005012 
    PD_CR2  =  005013     |     PD_DDR  =  005011     |     PD_IDR  =  005010 
    PD_ODR  =  00500F     |     PE      =  000014     |   4 PEEK       00311E R
    PEEK_IDX=  00005C     |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |     PINNO   =  000001 
  4 PINP       003115 R   |     PINP_IDX=  00005E     |     PINVAL  =  000002 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  4 PMODE      00310B R   |     PMODE_ID=  00005A     |   4 POKE       003102 R
    POKE_IDX=  000060     |   4 PORTA      0030E5 R   |   4 PORTB      0030DB R
  4 PORTC      0030D1 R   |   4 PORTD      0030C7 R   |   4 PORTE      0030BD R
  4 PORTF      0030B3 R   |   4 PORTG      0030A9 R   |   4 PORTH      00309F R
  4 PORTI      003095 R   |   4 POUT       0030F9 R   |     POUT_IDX=  000062 
    PREV    =  000001     |   4 PRINT      0030EF R   |     PROD    =  000001 
    PROD_SIG=  00000A     |   4 PROG_ADD   001E98 R   |   4 PROG_SIZ   001EAA R
    PRTA_IDX=  000066     |     PRTB_IDX=  000068     |     PRTC_IDX=  00006A 
    PRTD_IDX=  00006C     |     PRTE_IDX=  00006E     |     PRTF_IDX=  000070 
    PRTG_IDX=  000072     |     PRTH_IDX=  000074     |     PRTI_IDX=  000076 
    PRT_IDX =  000064     |     PSIZE   =  000001     |     PSTR    =  000003 
  4 QKEY       00308C R   |     QKEY_IDX=  000078     |     QSIGN   =  000005 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |   4 RAM_MEM    001ED3 R
    RAM_SIZE=  001800     |     RBT_IDX =  00007C     |   4 READ       003083 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
Hexadecimal [24-Bits]

Symbol Table

    READ_IDX=  00007A     |   4 REBOOT     003078 R   |     RECLEN  =  000005 
  4 REG_A      00055E R   |   4 REG_CC     000562 R   |   4 REG_EPC    000551 R
  4 REG_SP     000567 R   |   4 REG_X      00055A R   |   4 REG_Y      000556 R
    RELOP   =  000001     |   4 REM        003070 R   |     REM_IDX =  00007E 
  4 RESTORE    003064 R   |     REST_IDX=  000080     |     RETL1   =  000001 
  4 RETURN     003059 R   |     RET_ADDR=  000003     |     RET_BPTR=  000003 
    RET_IDX =  000082     |     RET_INW =  000005     |   4 RND        003051 R
    RND_IDX =  000084     |     ROP     =  004800     |     RS      =  00001E 
  4 RSHIFT     003046 R   |     RSHIFT_I=  000086     |     RSIGN   =  000006 
    RST_SR  =  0050B3     |   4 RUN        00303E R   |     RUN_IDX =  000088 
    RXCHAR  =  000001     |     RX_QUEUE=  000008     |     R_A     =  000007 
    R_CC    =  000008     |     R_X     =  000005     |     R_Y     =  000003 
  4 SAVE       003035 R   |     SAVE_IDX=  000032     |     SEPARATE=  000000 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
    SI      =  00000F     |     SIGN    =  000001     |   4 SIGNATUR   002876 R
  4 SIZE       00302C R   |     SIZE_IDX=  0000B2     |     SKIP    =  000005 
  4 SLEEP      003022 R   |     SLEEP_ID=  00008C     |     SO      =  00000E 
    SOH     =  000001     |     SPACE   =  000020     |   4 SPIEN      003018 R
    SPIEN_ID=  000090     |   4 SPIRD      00300E R   |     SPIRD_ID=  00008E 
  4 SPISEL     003003 R   |     SPISEL_I=  000092     |   4 SPIWR      002FF9 R
    SPIWR_ID=  000094     |     SPI_CR1 =  005200     |     SPI_CR1_=  000003 
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
  4 STATES     000514 R   |   4 STEP       002FF0 R   |     STEP_IDX=  000096 
  4 STOP       002FE7 R   |     STOP_IDX=  000098     |     STR     =  000003 
  4 STR_BYTE   001EBB R   |     STX     =  000002     |     SUB     =  00001A 
    SUP     =  000084     |     SWIM_CSR=  007F80     |     SYN     =  000016 
    T       =  000001     |     TAB     =  000009     |     TABW    =  000004 
    TAB_WIDT=  000004     |     TARGET  =  000001     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  4 TICKS      002FDD R   |     TICKS_ID=  00009A     |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_EGR=  005343     |     TIM4_EGR=  000000     |     TIM4_IER=  005341 
    TIM4_IER=  000000     |     TIM4_PSC=  005345     |     TIM4_PSC=  000000 
    TIM4_PSC=  000007     |     TIM4_PSC=  000004     |     TIM4_PSC=  000001 
    TIM4_PSC=  000005     |     TIM4_PSC=  000002     |     TIM4_PSC=  000006 
    TIM4_PSC=  000003     |     TIM4_PSC=  000000     |     TIM4_PSC=  000001 
    TIM4_PSC=  000002     |     TIM4_SR =  005342     |     TIM4_SR_=  000000 
  4 TIMEOUT    002FD1 R   |   4 TIMER      002FC7 R   |     TIMER_ID=  00009C 
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |     TK_AND  =  000088 
    TK_ARRAY=  000005     |     TK_CFUNC=  000082     |     TK_CHAR =  000004 
    TK_CMD  =  000080     |     TK_COLON=  00000A     |     TK_COMMA=  000008 
    TK_CONST=  000083     |     TK_DIV  =  000021     |     TK_EQUAL=  000032 
    TK_FLOAT=  000086     |     TK_GE   =  000033     |     TK_GRP_A=  000010 
    TK_GRP_M=  000030     |     TK_GRP_M=  000000     |     TK_GRP_M=  000020 
    TK_GRP_R=  000030     |     TK_GT   =  000031     |     TK_IFUNC=  000081 
    TK_INTGR=  000084     |     TK_LABEL=  000003     |     TK_LE   =  000036 
    TK_LPARE=  000006     |     TK_LT   =  000034     |     TK_MINUS=  000011 
    TK_MOD  =  000022     |     TK_MULT =  000020     |     TK_NE   =  000035 
    TK_NONE =  000000     |     TK_NOT  =  000087     |     TK_OR   =  000089 
    TK_PLUS =  000010     |     TK_QSTR =  000002     |     TK_RPARE=  000007 
    TK_SHARP=  000009     |     TK_VAR  =  000085     |     TK_XOR  =  00008A 
    TMROUT_I=  00009E     |   4 TO         002FC0 R   |   4 TONE       002FB7 R
    TONE_IDX=  0000A2     |     TOWRITE =  000005     |     TO_IDX  =  0000A0 
  4 Timer4Up   000021 R   |   4 TrapHand   000012 R   |     U8      =  000001 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 240.
Hexadecimal [24-Bits]

Symbol Table

    UART_SR_=  000006     |     UART_SR_=  000007     |     UBC     =  004801 
  4 UBOUND     002FAC R   |     UBOUND_I=  0000A4     |   4 UBTN_Han   000068 R
  4 UFLASH     002FA1 R   |     UFLASH_I=  0000A6     |   4 UNTIL      002F97 R
    UNTIL_ID=  0000A8     |     UPDATE  =  000006     |     US      =  00001F 
  4 USER_ABO   000070 R   |   4 USR        002F8F R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |     USR_IDX =  0000AA 
  4 Uart1RxH   0008CE R   |   4 UserButt   000044 R   |     VAL1    =  02FFFF 
    VAL2    =  00002A     |     VAL3    =  000003     |     VAL4    =  0005FF 
    VAL5    =  FFFFFFFD     |     VSIZE   =  000008     |     VT      =  00000B 
  4 WAIT       002F86 R   |     WAIT_IDX=  0000AC     |     WCNT    =  000003 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |     WIDTH_SA=  000002 
    WLEN    =  000001     |   4 WORDS      002F7C R   |     WORDS_ID=  0000AE 
  4 WRITE      002F72 R   |     WRITE_ID=  0000B0     |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XFIRST  =  000001     |     XMASK   =  000001 
    XOFF    =  000013     |     XON     =  000011     |   4 XOR        002F6A R
    XOR_IDX =  0000FE     |     XSAVE   =  000002     |     XSTACK_E=  001773 
    XSTACK_S=  00003C     |     XTEMP   =  000001     |     YSAVE   =  000007 
    YTEMP   =  000003     |   4 abs        002A7A R   |   4 abs24      0001DF R
  5 acc16      00000D GR  |   5 acc24      00000C GR  |   5 acc32      00000B GR
  5 acc8       00000E GR  |   4 accept_c   000BFC R   |   4 add24      00016A R
  4 add_char   00138E R   |   4 add_spac   00115F R   |   4 analog_r   002631 R
  4 and_cond   001B4F R   |   4 and_fact   001B1F R   |   4 app        003584 R
  4 app_sign   003580 R   |   4 app_size   003582 R   |   4 app_spac   003580 GR
  4 arduino_   002B69 R   |   4 arg_list   00195D R   |   5 array_si   000020 R
  4 ascii      00292A R   |   4 at_tst     000FD1 R   |   4 atoi24     001896 GR
  4 atoi_exi   0018FC R   |   4 awu        002A21 R   |   4 awu02      002A34 R
  4 bad_port   0029A5 R   |   5 base       00000A GR  |   5 basicptr   000004 GR
  4 beep       0025A8 R   |   4 beep_1kh   00257B GR  |   4 bin_exit   000E38 R
  4 bit_rese   002196 R   |   4 bit_set    002174 R   |   4 bit_test   0021DB R
  4 bit_togg   0021B9 R   |   4 bitmask    002D20 R   |   4 bkslsh_t   000F7E R
  4 bksp       0009A7 R   |   2 block_bu   0016B8 GR  |   4 block_er   0007BC R
  4 break_po   00271D R   |   4 bye        0029ED R   |   4 char       002913 R
  4 clear_ba   0014FA R   |   4 clear_bl   0027CD R   |   4 clear_va   001452 R
  4 clock_in   00008B R   |   4 cloop_1    001DC4 R   |   4 cmd_cons   001D9E R
  4 cmd_end    002547 R   |   4 cmd_get    00254E R   |   4 cmd_itf    00056C R
  4 cmd_line   00172D R   |   4 cmd_name   0013AE R   |   4 cmd_on     002401 R
  4 cmd_size   001C3B R   |   4 code_add   0032F5 GR  |   4 cold_sta   0000C3 R
  4 colon_ts   000FA5 R   |   4 comma_ts   000FB0 R   |   4 comp_msg   00167D R
  4 compile    0010CB GR  |   4 conditio   001BA1 R   |   4 const_cr   002DC8 R
  4 const_cr   002DCD R   |   4 const_dd   002DC3 R   |   4 const_ee   002DDC R
  4 const_id   002DBE R   |   4 const_in   002DD7 R   |   4 const_lo   001DBF R
  4 const_od   002DB9 R   |   4 const_ou   002DD2 R   |   4 const_po   002D8C R
  4 const_po   002D91 R   |   4 const_po   002D96 R   |   4 const_po   002D9B R
  4 const_po   002DA0 R   |   4 const_po   002DA5 R   |   4 const_po   002DAA R
  4 const_po   002DAF R   |   4 const_po   002DB4 R   |   4 convert_   000DA8 R
  4 convert_   00096B R   |   4 copy_com   001006 R   |   5 count      000003 GR
  4 cp24       0001A4 R   |   4 cp24_ax    0001D6 R   |   4 cp_loop    00190E R
  4 cpl24      0001E6 R   |   4 cpy_cmd_   001147 R   |   4 cpy_quot   001187 R
  4 create_g   000CD2 R   |   4 cs_high    002F5E R   |   4 dash_tst   000FC6 R
  4 data       002DE1 R   |   4 data_err   002E5A R   |   5 data_len   000009 R
  5 data_ofs   000008 R   |   5 data_ptr   000006 R   |   4 dec_base   001C1A R
  4 decomp_l   001240 R   |   4 decompil   0011F8 GR  |   4 del_line   000CA5 R
  4 delete_l   000A94 R   |   4 delete_n   0009B7 R   |   4 delete_u   000A59 R
  4 digital_   00266D R   |   4 digital_   0026A4 R   |   4 div24      000323 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
Hexadecimal [24-Bits]

Symbol Table

  4 divu24_8   000305 R   |   4 do_loop    002D46 R   |   4 do_progr   0007AF R
  4 edit       001F87 R   |   4 enable_i   002CB0 R   |   4 eql_tst    001051 R
  4 equal      0013A1 R   |   4 erase      002745 R   |   4 erase_ex   0007E0 R
  4 erase_fl   0007D6 R   |   4 err_bad_   0015DE R   |   4 err_buf_   001654 R
  4 err_cmd_   0015A2 R   |   4 err_div0   001567 R   |   4 err_dupl   0015BC R
  4 err_math   00154E R   |   4 err_mem_   001533 R   |   4 err_msg    001511 R
  4 err_no_a   0015EA R   |   4 err_no_d   00161D R   |   4 err_no_f   001641 R
  4 err_no_l   001576 R   |   4 err_no_p   00162D R   |   4 err_not_   0015CD R
  4 err_over   001661 R   |   4 err_run_   00158C R   |   4 err_synt   001540 R
  4 escaped    000DBD GR  |   4 expect     00194B R   |   4 expressi   001A88 R
  4 factor     0019A9 R   |   5 farptr     000018 R   |   4 fcpu       002AEB R
  4 fetchc     00065C R   |   4 fill_wri   0027BD R   |   4 final_te   000BF5 R
  4 first_li   001F31 R   |   5 flags      000022 GR  |   4 for        002271 R
  4 free       001C1F R   |   5 free_eep   000024 R   |   7 free_ram   000080 R
  4 func_arg   001958 R   |   4 func_eef   001D31 R   |   4 ge         0013A3 R
  4 get_addr   0017D4 R   |   4 get_arra   001979 R   |   4 get_char   0017EE R
  4 get_cmd_   0011D7 R   |   4 get_code   0017B8 R   |   4 get_cons   001CB6 R
  4 get_esca   000977 R   |   4 get_int2   0017DE R   |   4 get_targ   002392 R
  4 get_targ   0023A0 R   |   4 get_tick   002A73 R   |   4 get_toke   000F17 GR
  4 getc       000950 GR  |   4 gosub      0024A7 R   |   4 gosub_1    0024B2 R
  4 gosub_2    0024B8 R   |   4 goto       00248D R   |   4 goto_1     002497 R
  4 gpio       00297A R   |   4 gt         00139F R   |   4 gt_tst     00105C R
  4 hex_base   001C15 R   |   4 hex_dump   00069C R   |   4 if         002254 R
  5 in         000001 GR  |   5 in.saved   000002 GR  |   5 in.w       000000 GR
  4 incr_far   0008B2 R   |   4 input_ex   00212C R   |   4 input_lo   002096 R
  4 input_va   002092 R   |   4 insert_c   000A16 R   |   4 insert_l   000CFE R
  4 insert_l   000D6D R   |   4 interp_l   00176E R   |   4 interpre   001749 R
  4 invalid    0005B1 R   |   4 invalid_   000632 R   |   4 is_alnum   000E6B GR
  4 is_alpha   000E51 GR  |   4 is_data_   002DE7 R   |   4 is_digit   000E62 GR
  4 is_symbo   000E74 R   |   4 itoa       001831 GR  |   4 itoa_loo   001853 R
  4 jp_to_ta   00249A R   |   4 key        002969 R   |   4 kword_di   0032ED GR
  4 kword_en   002F68 R   |   4 le         0013A8 R   |   4 ledoff     000467 R
  4 ledon      000462 R   |   4 ledtoggl   00046C R   |   4 left_par   000475 R
  4 let        001C73 GR  |   4 let_arra   001C81 R   |   4 let_eval   001C89 R
  4 let_var    001C86 R   |   4 lines_sk   001F34 R   |   4 list       001EE2 R
  4 list_con   001CC5 R   |   4 list_exi   001F76 R   |   4 list_loo   001F54 R
  4 log2       002CF3 R   |   4 look_tar   0023C3 R   |   4 loop_bac   002375 R
  5 loop_dep   00001F R   |   4 loop_don   00238A R   |   4 lshift     002A91 R
  4 lt         0013A6 R   |   4 lt_tst     001085 R   |   4 mem_peek   0005CE R
  4 mod24      0003D1 R   |   4 move       00140E GR  |   4 move_dow   00142D R
  4 move_era   00073E R   |   4 move_exi   00144E R   |   4 move_lef   0009EE R
  4 move_loo   001432 R   |   4 move_prg   00077E R   |   4 move_rig   0009FC R
  4 move_up    00141F R   |   4 mul24      000259 R   |   4 mul_char   001390 R
  4 mulu24_8   000226 R   |   4 nbr_tst    000F4A R   |   4 ne         0013AB R
  4 neg24      0001EF R   |   4 neg_acc2   000209 R   |   4 neg_ax     000201 R
  4 new        00273B R   |   4 next       00231D R   |   4 next_lin   001751 R
  4 next_tok   00179F GR  |   4 no_match   001920 R   |   4 number     000662 R
  4 other      0010AE R   |   4 overwrit   000C21 R   |   2 pad        0016B8 GR
  4 pad_ref    002F63 R   |   4 parse_bi   000E16 R   |   4 parse_in   000DC5 R
  4 parse_ke   000E97 R   |   4 parse_qu   000D70 R   |   4 parse_sy   000E7F R
  4 pause      002A01 R   |   4 pause02    002A14 R   |   4 peek       002233 R
  4 peek_byt   0005FC R   |   4 pin_mode   002AFA R   |   4 plus_tst   001025 R
  4 poke       002212 R   |   4 power_ad   0025E1 R   |   4 prcnt_ts   001046 R
  4 print      001FEF R   |   4 print_fa   000641 R   |   4 print_he   000C58 GR
  4 print_re   0004C1 R   |   4 print_st   0005C1 R   |   4 print_to   001819 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Symbol Table

  4 prog_siz   001E51 R   |   4 program_   001E59 R   |   4 program_   000758 R
  4 program_   00077E R   |   4 prt_acc2   00180B R   |   4 prt_basi   001FCB R
  4 prt_i16    0017F4 R   |   4 prt_loop   001FF3 R   |   4 prt_peek   000444 GR
  4 prt_reg1   0004A2 R   |   4 prt_reg8   000480 R   |   4 prt_regs   0003DA GR
  5 ptr16      000019 GR  |   5 ptr8       00001A R   |   4 putc       000940 GR
  4 puts       00099D GR  |   4 qgetc      000949 GR  |   4 qkey       00296D GR
  4 qmark_ts   000FDC R   |   4 qsign      0027B6 R   |   4 random     002B89 R
  4 read       002E5F R   |   4 read01     002E64 R   |   4 read_int   003522 R
  4 readln     000AA2 GR  |   4 readln_l   000AB1 R   |   4 readln_q   000C3E R
  4 refresh_   002CEE R   |   4 regs_sta   00041D R   |   4 relation   001AC0 R
  4 relop_st   001393 R   |   4 remark     002131 GR  |   4 repl       00057A R
  4 repl_exi   0005A2 R   |   4 reset_co   001FF1 R   |   4 rest_con   002082 R
  4 restore    002DF5 R   |   4 return     0024CD R   |   4 right_al   001175 GR
  4 row_alig   000897 R   |   4 row_eras   000711 R   |   4 row_eras   00073E R
  4 row_loop   00067F R   |   4 rparnt_t   000F9A R   |   4 rshift     002ABE R
  7 rsign      00007C R   |   7 rsize      00007E R   |   4 rt_msg     00166B R
  4 run        0024EB R   |   4 run_app    000135 R   |   4 run_it     00251D R
  4 run_it_0   00251F R   |   5 rx1_head   00002E R   |   5 rx1_queu   000026 R
  5 rx1_tail   00002F R   |   4 save_app   0027E1 R   |   4 save_con   002072 R
  4 scan_blo   0008C0 R   |   4 search_c   001D5A R   |   4 search_d   001900 GR
  4 search_e   001948 R   |   4 search_l   000C7A GR  |   4 search_l   000C89 R
  4 search_n   001904 R   |   5 seedx      000014 R   |   5 seedy      000016 R
  4 select_p   002B59 R   |   4 send_esc   0009C5 R   |   4 send_par   0009D0 R
  4 set_data   002E2B R   |   4 set_time   002C8E R   |   4 sharp_ts   000FBB R
  4 show_row   00066D R   |   4 single_c   001389 R   |   4 skip       000F04 R
  4 skip_str   0017C5 R   |   4 slash_ts   00103B R   |   4 sleep      0029F6 R
  4 software   001461 R   |   4 spaces     000A0A GR  |   4 spi_clea   002EF8 R
  4 spi_disa   002EE0 R   |   4 spi_enab   002EAD R   |   4 spi_rcv_   002F1A R
  4 spi_read   002F45 R   |   4 spi_sele   002F4C R   |   4 spi_send   002F04 R
  4 spi_writ   002F25 R   |   2 stack_fu   001774 GR  |   2 stack_un   001800 R
  4 star_tst   001030 R   |   4 step       0022DB R   |   4 stop       0026EF R
  4 store_lo   00230A R   |   4 str_matc   00192D R   |   4 str_tst    000F3A R
  4 strcmp     0013ED R   |   4 strcpy     0013FE GR  |   4 strlen     0013E2 GR
  4 sub24      000187 R   |   4 symb_loo   000E80 R   |   4 syntax_e   00169E GR
  4 system_i   0014A7 R   |   5 tab_widt   000023 GR  |   4 tb_error   0016A0 GR
  4 term       001A45 R   |   4 term01     001A4D R   |   4 term_exi   001A85 R
  4 test       0033B3 R   |   4 test_p     0005B9 R   |   2 tib        001668 GR
  4 tick_tst   000FF4 R   |   5 ticks      00000F R   |   4 timeout    002CA5 R
  5 timer      000012 GR  |   4 timer2_i   0000A1 R   |   4 timer4_i   0000AE R
  4 tk_id      00168E R   |   4 to         00229B R   |   4 to_eepro   0007A7 R
  4 to_flash   0007AC R   |   4 to_hex_c   000C6F GR  |   4 to_upper   00188A GR
  4 token_ch   0010C4 R   |   4 token_ex   0010C8 R   |   4 tone       002586 R
  4 try_next   002E38 R   |   5 txtbgn     00001B GR  |   5 txtend     00001D GR
  4 uart1_ge   000950 GR  |   4 uart1_in   0008FB R   |   4 uart1_pu   000940 GR
  4 uart1_qg   000949 GR  |   4 uart1_se   00090B R   |   4 ubound     001C68 R
  4 uflash     0029AA R   |   4 unlock_e   0006DB R   |   4 unlock_f   0006F6 R
  4 until      002D59 R   |   4 user_int   000057 R   |   4 usr        0029C7 R
  4 var_name   0011CD GR  |   5 vars       000030 GR  |   4 wait       002137 R
  4 warm_ini   0014D8 R   |   4 warm_sta   00172A R   |   4 words      002C24 R
  4 words_co   002C78 R   |   4 write      0028D0 R   |   4 write_bl   00085C GR
  4 write_bu   000798 R   |   4 write_by   0007E2 R   |   4 write_ee   00081E R
  4 write_ex   000857 R   |   4 write_fl   000808 R   |   4 write_nb   000881 R
  2 xstack_f   001738 GR  |   2 xstack_u   001774 GR

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 243.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 SSEG       size      0   flags    8
   2 SSEG0      size    198   flags    8
   3 HOME       size     80   flags    0
   4 CODE       size   3584   flags    0
   5 DATA       size     7E   flags    0
   6 BTXT       size      0   flags    8
   7 BTXT1      size      4   flags    8

