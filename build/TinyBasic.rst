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
                           000005    90         TK_ARRAY=5     ; array variable '@' 
                           000006    91         TK_LPAREN=6     ; left parenthesis '('
                           000007    92         TK_RPAREN=7     ; right parenthesis ')'
                           000008    93         TK_COMMA=8     ; item separator ',' 
                           000009    94         TK_SHARP=9     ; print colon width '#' 
                           00000A    95         TK_COLON=0xa      ; command separator ':' 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
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
                           000074    83     PRTI_IDX=PRTG_IDX+2
                           000076    84     QKEY_IDX=PRTI_IDX+2
                           000078    85     READ_IDX=QKEY_IDX+2
                           00007A    86     RBT_IDX=READ_IDX+2  ; REBOOT
                           00007C    87 	REM_IDX=RBT_IDX+2 ; REMARK command index 
                           00007E    88     REST_IDX=REM_IDX+2 ; RESTORE
                           000080    89     RET_IDX=REST_IDX+2  ; RETURN 
                           000082    90     RND_IDX=RET_IDX+2 ; RANDOM 
                           000084    91     RSHIFT_IDX=RND_IDX+2
                           000086    92     RUN_IDX=RSHIFT_IDX+2
                           000088    93     FREE_IDX=RUN_IDX+2
                           00008A    94     SLEEP_IDX=FREE_IDX+2
                           00008C    95     SPIRD_IDX=SLEEP_IDX+2
                           00008E    96     SPIEN_IDX=SPIRD_IDX+2
                           000090    97     SPISEL_IDX=SPIEN_IDX+2
                           000092    98     SPIWR_IDX=SPISEL_IDX+2
                           000094    99     STEP_IDX=SPIWR_IDX+2
                           000096   100     STOP_IDX=STEP_IDX+2
                           000098   101     TICKS_IDX=STOP_IDX+2
                           00009A   102     TIMER_IDX=TICKS_IDX+2
                           00009C   103     TMROUT_IDX=TIMER_IDX+2  ; TIMEOUT
                           00009E   104     TO_IDX=TMROUT_IDX+2
                           0000A0   105     TONE_IDX=TO_IDX+2
                           0000A2   106     UBOUND_IDX=TONE_IDX+2
                           0000A4   107     UFLASH_IDX=UBOUND_IDX+2
                           0000A6   108     UNTIL_IDX=UFLASH_IDX+2
                           0000A8   109     USR_IDX=UNTIL_IDX+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                           0000AA   110     WAIT_IDX=USR_IDX+2
                           0000AC   111     WORDS_IDX=WAIT_IDX+2
                           0000AE   112     WRITE_IDX=WORDS_IDX+2
                           0000B0   113     SIZE_IDX=WRITE_IDX+2 
                           0000B2   114     ON_IDX=SIZE_IDX+2 
                           0000B4   115     GET_IDX=ON_IDX+2
                           0000B6   116     CONST_IDX=GET_IDX+2
                           0000B8   117     EEFREE_IDX=CONST_IDX+2
                                    118      
                                    119     ; keep these 3 at end
                                    120     ; these have no entry in code_addr 
                           0000F8   121     NOT_IDX=248
                           0000FA   122     AND_IDX=250 
                           0000FC   123     OR_IDX=252 
                           0000FE   124     XOR_IDX=254    
                                    125 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                     34   
                                     35 
                                     36 ;;-----------------------------------
                                     37     .area SSEG (ABS)
                                     38 ;; working buffers and stack at end of RAM. 	
                                     39 ;;-----------------------------------
      001668                         40     .org RAM_SIZE-STACK_SIZE-XSTACK_SIZE*CELL_SIZE-TIB_SIZE-PAD_SIZE 
      001668                         41 tib:: .ds TIB_SIZE             ; transaction input buffer
      0016B8                         42 block_buffer::                 ; use to write FLASH block (alias for pad )
      0016B8                         43 pad:: .ds PAD_SIZE             ; working buffer
      001738                         44 xstack_full:: .ds XSTACK_SIZE*CELL_SIZE   ; expression stack 
      001774                         45 xstack_unf:: ; xstack underflow 
      001774                         46 stack_full:: .ds STACK_SIZE   ; control stack 
      001800                         47 stack_unf: ; stack underflow ; control_stack bottom 
                                     48 
                                     49 ;;--------------------------------------
                                     50     .area HOME 
                                     51 ;; interrupt vector table at 0x8000
                                     52 ;;--------------------------------------
                                     53 
      008000 82 00 81 35             54     int cold_start			; RESET vector 
      008004 82 00 80 92             55 	int SysCall ; TRAP  BASIC sys() calls 
      008008 82 00 80 80             56 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 84             57 	int AWUHandler          ;int1 AWU   auto wake up from halt
      008010 82 00 80 80             58 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 80             59 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 80             60 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 80             61 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 80             62 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 B6             63 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 80             64 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 80             65 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 80             66 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 80             67 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 80             68 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 80             69 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 80             70 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 80             71 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 80             72 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 80             73 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 88 FC             74 	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
      008054 82 00 80 80             75 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 80             76 	int NonHandledInterrupt ;int20 UART3 TX completed
      00805C 82 00 80 80             77 	int NonHandledInterrupt ;int21 UART3 RX full
      008060 82 00 80 80             78 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 93             79 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
      008068 82 00 80 80             80 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 80             81 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 80             82 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 80             83 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 80             84 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 80             85 	int NonHandledInterrupt ;int29  not used
                                     86 
                                     87 ;---------------------------------------
                                     88     .area CODE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                     89 ;---------------------------------------
                                     90 
                                     91 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     92 ; non handled interrupt 
                                     93 ; reset MCU
                                     94 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008080                         95 NonHandledInterrupt:
      000000                         96 	_swreset 
      008080 35 80 50 D1      [ 1]    1     mov WWDG_CR,#0X80
                                     97 
                                     98 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     99 ; auto wakeup from halt
                                    100 ; at iret, program continue 
                                    101 ; after hatl instruction
                                    102 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008084                        103 AWUHandler:
      008084 72 19 50 F0      [ 1]  104 	bres AWU_CSR,#AWU_CSR_AWUEN
      008088 55 00 3F 50 F1   [ 1]  105 	mov AWU_APR,0x3F
      00808D 72 5F 50 F2      [ 1]  106 	clr AWU_TBR 
      008091 80               [11]  107 	iret
                                    108 
                                    109 ;------------------------------------
                                    110 ; software interrupt handler  
                                    111 ;------------------------------------
      008092                        112 SysCall:
                                    113 
      008092 80               [11]  114 	iret 
                                    115 
                                    116 ;------------------------------
                                    117 ; TIMER 4 is used to maintain 
                                    118 ; a milliseconds 'ticks' counter
                                    119 ; and decrement 'timer' varaiable
                                    120 ; ticks range {0..2^23-1}
                                    121 ;--------------------------------
      008093                        122 Timer4UpdateHandler:
      008093 72 5F 53 42      [ 1]  123 	clr TIM4_SR 
      008097 C6 00 10         [ 1]  124 	ld a,ticks 
      00809A CE 00 11         [ 2]  125 	ldw x,ticks+1
      00809D 1C 00 01         [ 2]  126 	addw x,#1 
      0080A0 A9 00            [ 1]  127 	adc a,#0 
      0080A2 2A 02            [ 1]  128 	jrpl 0$
                                    129 ; reset to 0 when negatif 
      0080A4 4F               [ 1]  130 	clr a 
      0080A5 5F               [ 1]  131 	clrw x 
      0080A6 C7 00 10         [ 1]  132 0$:	ld ticks,a 
      0080A9 CF 00 11         [ 2]  133 	ldw ticks+1,x 
      0080AC CE 00 13         [ 2]  134 	ldw x,timer
      0080AF 27 04            [ 1]  135 	jreq 1$
      0080B1 5A               [ 2]  136 	decw x 
      0080B2 CF 00 13         [ 2]  137 	ldw timer,x 
      0080B5                        138 1$:	
      0080B5 80               [11]  139 	iret 
                                    140 
                                    141 ;------------------------------------
                                    142 ; Triggered by pressing USER UserButton 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                    143 ; on NUCLEO card.
                                    144 ; This is used to abort a progam lock 
                                    145 ; in infinite loop. 
                                    146 ;------------------------------------
      0080B6                        147 UserButtonHandler:
                                    148 ; wait button release
      0080B6 5F               [ 1]  149 	clrw x
      0080B7 5A               [ 2]  150 1$: decw x 
      0080B8 26 FD            [ 1]  151 	jrne 1$
      0080BA 72 09 50 15 F8   [ 2]  152 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    153 ; if MCU suspended by SLEEP resume program
      0080BF 72 07 00 23 05   [ 2]  154     btjf flags,#FSLEEP,2$
      0080C4 72 17 00 23      [ 1]  155 	bres flags,#FSLEEP 
      0080C8 80               [11]  156 	iret
      0080C9                        157 2$:	
      0080C9                        158 user_interrupted:
      0080C9 72 00 00 23 02   [ 2]  159     btjt flags,#FRUN,4$
      0080CE 20 0A            [ 2]  160 	jra UBTN_Handler_exit 
      0080D0                        161 4$:	; program interrupted by user 
      0080D0 72 11 00 23      [ 1]  162 	bres flags,#FRUN 
      0080D4 AE 80 E2         [ 2]  163 	ldw x,#USER_ABORT
      0080D7 CD 89 DC         [ 4]  164 	call puts 
      0080DA                        165 UBTN_Handler_exit:
      0080DA AE 17 FF         [ 2]  166     ldw x,#STACK_EMPTY 
      0080DD 94               [ 1]  167     ldw sp,x
      0080DE 9A               [ 1]  168 	rim 
      0080DF CC 97 B1         [ 2]  169 5$:	jp warm_start
                                    170 
      0080E2 0A 50 72 6F 67 72 61   171 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    172 
                                    173 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    174 ;    peripherals initialization
                                    175 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    176 
                                    177 ;----------------------------------------
                                    178 ; inialize MCU clock 
                                    179 ; input:
                                    180 ;   A 		source  HSI | 1 HSE 
                                    181 ;   XL      CLK_CKDIVR , clock divisor 
                                    182 ; output:
                                    183 ;   none 
                                    184 ;----------------------------------------
      0080FD                        185 clock_init:	
      0080FD C1 50 C3         [ 1]  186 	cp a,CLK_CMSR 
      008100 27 0C            [ 1]  187 	jreq 2$ ; no switching required 
                                    188 ; select clock source 
      008102 72 12 50 C5      [ 1]  189 	bset CLK_SWCR,#CLK_SWCR_SWEN
      008106 C7 50 C4         [ 1]  190 	ld CLK_SWR,a
      008109 C1 50 C3         [ 1]  191 1$:	cp a,CLK_CMSR
      00810C 26 FB            [ 1]  192 	jrne 1$
      00810E                        193 2$: 	
                                    194 ; HSI and cpu clock divisor 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      00810E 9F               [ 1]  195 	ld a,xl 
      00810F C7 50 C6         [ 1]  196 	ld CLK_CKDIVR,a  
      008112 81               [ 4]  197 	ret
                                    198 
                                    199 ;----------------------------------
                                    200 ; TIMER2 used as audio tone output 
                                    201 ; on port D:5. CN9-6
                                    202 ; channel 1 configured as PWM mode 1 
                                    203 ;-----------------------------------  
                                    204 
      008113                        205 timer2_init:
      008113 72 1A 50 C7      [ 1]  206 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      008117 35 60 53 05      [ 1]  207  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      00811B 35 08 53 0C      [ 1]  208 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      00811F 81               [ 4]  209 	ret 
                                    210 
                                    211 ;---------------------------------
                                    212 ; TIM4 is configured to generate an 
                                    213 ; interrupt every millisecond 
                                    214 ;----------------------------------
      008120                        215 timer4_init:
      008120 72 18 50 C7      [ 1]  216 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      008124 35 07 53 45      [ 1]  217 	mov TIM4_PSCR,#7 ; prescale 128  
      008128 35 7D 53 46      [ 1]  218 	mov TIM4_ARR,#125 ; set for 1msec.
      00812C 35 05 53 40      [ 1]  219 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008130 72 10 53 41      [ 1]  220 	bset TIM4_IER,#TIM4_IER_UIE
      008134 81               [ 4]  221 	ret
                                    222 
                                    223 ;-------------------------------------
                                    224 ;  initialization entry point 
                                    225 ;-------------------------------------
      008135                        226 cold_start:
                                    227 ;set stack 
      008135 AE 17 FF         [ 2]  228 	ldw x,#STACK_EMPTY
      008138 94               [ 1]  229 	ldw sp,x
                                    230 ; clear all ram 
      008139 7F               [ 1]  231 0$: clr (x)
      00813A 5A               [ 2]  232 	decw x 
      00813B 26 FC            [ 1]  233 	jrne 0$
                                    234 ; activate pull up on all inputs 
      00813D A6 FF            [ 1]  235 	ld a,#255 
      00813F C7 50 03         [ 1]  236 	ld PA_CR1,a 
      008142 C7 50 08         [ 1]  237 	ld PB_CR1,a 
      008145 C7 50 0D         [ 1]  238 	ld PC_CR1,a 
      008148 C7 50 12         [ 1]  239 	ld PD_CR1,a 
      00814B C7 50 17         [ 1]  240 	ld PE_CR1,a 
      00814E C7 50 1C         [ 1]  241 	ld PF_CR1,a 
      008151 C7 50 21         [ 1]  242 	ld PG_CR1,a 
      008154 C7 50 2B         [ 1]  243 	ld PI_CR1,a
                                    244 ; set LD2 pin as output 
      008157 72 1A 50 0D      [ 1]  245     bset PC_CR1,#LED2_BIT
      00815B 72 1A 50 0E      [ 1]  246     bset PC_CR2,#LED2_BIT
      00815F 72 1A 50 0C      [ 1]  247     bset PC_DDR,#LED2_BIT
      008163 72 1B 50 0A      [ 1]  248 	bres PC_ODR,#LED2_BIT 
                                    249 ; disable schmitt triggers on Arduino CN4 analog inputs
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008167 55 00 3F 54 07   [ 1]  250 	mov ADC_TDRL,0x3f
                                    251 ; disable peripherals clocks
                                    252 ;	clr CLK_PCKENR1 
                                    253 ;	clr CLK_PCKENR2
      00816C 72 5F 50 F2      [ 1]  254 	clr AWU_TBR 
      008170 72 14 50 CA      [ 1]  255 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                    256 ; select internal clock no divisor: 16 Mhz 	
      008174 A6 E1            [ 1]  257 	ld a,#CLK_SWR_HSI 
      008176 5F               [ 1]  258 	clrw x  
      008177 CD 80 FD         [ 4]  259     call clock_init 
      00817A CD 81 20         [ 4]  260 	call timer4_init
      00817D CD 81 13         [ 4]  261 	call timer2_init
                                    262 ; UART1 at 115200 BAUD
      008180 CD 89 3A         [ 4]  263 	call uart1_init
                                    264 ; activate PE_4 (user button interrupt)
      008183 72 18 50 18      [ 1]  265     bset PE_CR2,#USR_BTN_BIT 
                                    266 ; display system information
      008187 9A               [ 1]  267 	rim ; enable interrupts 
      008188 72 5C 00 18      [ 1]  268 	inc seedy+1 
      00818C 72 5C 00 16      [ 1]  269 	inc seedx+1 
      008190 CD 9D D8         [ 4]  270 	call func_eefree 
      008193 CD 9D 79         [ 4]  271 	call ubound 
      008196 CD 95 31         [ 4]  272 	call clear_basic
      008199 CD A6 8F         [ 4]  273 	call beep_1khz  
      00819C CD 94 DE         [ 4]  274 	call system_information
      00819F                        275 2$:	
                                    276 ; check for autorun application
      00819F CE 40 00         [ 2]  277 	ldw x,EEPROM_BASE 
      0081A2 C3 B2 7F         [ 2]  278 	cpw x,AR_SIGN 
      0081A5 27 03            [ 1]  279 	jreq run_app
      0081A7 CC 97 B1         [ 2]  280 	jp warm_start 
      0081AA                        281 run_app:
      0081AA 4F               [ 1]  282 	clr a 
      0081AB CE 40 02         [ 2]  283 	ldw x,EEPROM_BASE+2
      0081AE CD A5 95         [ 4]  284 	call is_program_addr 
      0081B1 27 03            [ 1]  285 	jreq 1$
      0081B3 CC 97 B1         [ 2]  286 	jp warm_start
      0081B6                        287 1$:	
                                    288 ; run application in FLASH|EEPROM 
      0081B6 90 CE 17 73      [ 2]  289 	ldw y,XSTACK_EMPTY
      0081BA CD 95 0F         [ 4]  290 	call warm_init
      0081BD CE 40 02         [ 2]  291 	ldw x,EEPROM_BASE+2 
      0081C0 CF 00 1C         [ 2]  292 	ldw txtbgn,x
      0081C3 1D 00 02         [ 2]  293 	subw x,#2 
      0081C6 FE               [ 2]  294 	ldw x,(x)
      0081C7 72 BB 00 1C      [ 2]  295 	addw x,txtbgn 
      0081CB CF 00 1E         [ 2]  296 	ldw txtend,x 
      0081CE AE 81 DC         [ 2]  297 	ldw x,#AUTO_RUN 
      0081D1 CD 89 DC         [ 4]  298 	call puts 
      0081D4 CD 9E EC         [ 4]  299 	call program_info 
      0081D7 CC A6 05         [ 2]  300 	jp run_it_02  
      0081DA 20 FE            [ 2]  301     jra .  
                                    302 
      0081DC 20 61 75 74 6F 20 72   303 AUTO_RUN: .asciz " auto run program\n"
             75 6E 20 70 72 6F 67
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal  72-Bits]



             72 61 6D 0A 00
                                    304 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
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
      00016F                         37 dup24:
      00016F                         38     _at_top 
      0081EB 61 6D            [ 1]    1     ld a,(y)
      0081ED 0A               [ 1]    2     ldw x,y 
      0081EE 00 01            [ 2]    3     ldw x,(1,x)
      0081EF                         39     _xpush 
      0081EF 90 F6 93 EE      [ 2]    1     subw y,#CELL_SIZE
      0081F3 01 72            [ 1]    2     ld (y),a 
      0081F5 A2 00 03         [ 2]    3     ldw (1,y),x 
      0081F8 90               [ 4]   40     ret 
                                     41 
                                     42 
                                     43 
                                     44 ;-------------------------------
                                     45 ; add24 
                                     46 ; add 24 bits integers 
                                     47 ;------------------------------
      00017E                         48 add24: ; ( N T -- N+T )
      00017E                         49     _xpop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      0081F9 F7 90            [ 1]    1     ld a,(y)
      0081FB EF               [ 1]    2     ldw x,y 
      0081FC 01 81            [ 2]    3     ldw x,(1,x)
      0081FE 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0081FE 90               [ 2]   50     pushw x  
      0081FF F6               [ 1]   51     push a  
      000189                         52     _at_top  
      008200 93 EE            [ 1]    1     ld a,(y)
      008202 01               [ 1]    2     ldw x,y 
      008203 72 A9            [ 2]    3     ldw x,(1,x)
      008205 00 03 89         [ 2]   53     addw x,(2,sp)
      008208 88 90            [ 1]   54     adc a, (1,sp)
      000193                         55     _store_top 
      00820A F6 93            [ 1]    1     ld (y),a 
      00820C EE 01 72         [ 2]    2     ldw (1,y),x     
      000198                         56     _drop 3 
      00820F FB 02            [ 2]    1     addw sp,#3 
      008211 19               [ 4]   57     ret 
                                     58 
                                     59 ;-------------------------------
                                     60 ; sub24 
                                     61 ; subtract 24 bits integers 
                                     62 ;------------------------------
      00019B                         63 sub24: ; ( N T -- N-T ) 
      00019B                         64     _xpop 
      008212 01 90            [ 1]    1     ld a,(y)
      008214 F7               [ 1]    2     ldw x,y 
      008215 90 EF            [ 2]    3     ldw x,(1,x)
      008217 01 5B 03 81      [ 2]    4     addw y,#CELL_SIZE 
      00821B 89               [ 2]   65     pushw x 
      00821B 90               [ 1]   66     push  a
      0001A6                         67     _at_top  
      00821C F6 93            [ 1]    1     ld a,(y)
      00821E EE               [ 1]    2     ldw x,y 
      00821F 01 72            [ 2]    3     ldw x,(1,x)
      008221 A9 00 03         [ 2]   68     subw x,(2,sp) 
      008224 89 88            [ 1]   69     sbc a, (1,sp)
      0001B0                         70     _store_top  
      008226 90 F6            [ 1]    1     ld (y),a 
      008228 93 EE 01         [ 2]    2     ldw (1,y),x     
      0001B5                         71     _drop 3 
      00822B 72 F0            [ 2]    1     addw sp,#3 
      00822D 02               [ 4]   72     ret 
                                     73 
                                     74 ;------------------------------
                                     75 ; cp24  N T -- 0x800000|0|0x010000
                                     76 ;------------------------------
      0001B8                         77 cp24:
      0001B8                         78     _xpop 
      00822E 12 01            [ 1]    1     ld a,(y)
      008230 90               [ 1]    2     ldw x,y 
      008231 F7 90            [ 2]    3     ldw x,(1,x)
      008233 EF 01 5B 03      [ 2]    4     addw y,#CELL_SIZE 
      008237 81 00 0C         [ 1]   79     ld acc24,a 
      008238 CF 00 0D         [ 2]   80     ldw acc16,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      0001C7                         81     _at_top 
      008238 90 F6            [ 1]    1     ld a,(y)
      00823A 93               [ 1]    2     ldw x,y 
      00823B EE 01            [ 2]    3     ldw x,(1,x)
      00823D 72 A9 00 03      [ 2]   82     subw x,acc16
      008241 C7 00 0D         [ 1]   83     sbc a,acc24
      008244 CF 00            [ 1]   84     jrslt 1$
      008246 0E 90            [ 1]   85     jrne 2$
      008248 F6               [ 2]   86     tnzw x 
      008249 93 EE            [ 1]   87     jrne 2$
      00824B 01               [ 1]   88     clr a 
      00824C 72 B0            [ 2]   89     jra 9$ 
      0001DD                         90 1$: ; i1 < i2 
      00824E 00 0E            [ 1]   91     ld a,#255
      008250 C2 00            [ 2]   92     jra 9$ 
      0001E1                         93 2$: ; i1 > i2 
      008252 0D 2F            [ 1]   94     ld a,#1 
      008254 08               [ 1]   95 9$: clrw x
      0001E4                         96      _store_top 
      008255 26 0A            [ 1]    1     ld (y),a 
      008257 5D 26 07         [ 2]    2     ldw (1,y),x     
      00825A 4F               [ 4]   97     ret 
                                     98 
                                     99 ;-------------------------------
                                    100 ; cp24_ax 
                                    101 ; compare acc24 with A:X 
                                    102 ;-------------------------------
      0001EA                        103 cp24_ax:
      00825B 20               [ 1]  104     push a 
      00825C 06 00 0D         [ 2]  105     cpw x,acc16 
      00825D C2 00 0C         [ 1]  106     sbc a,acc24
      00825D A6               [ 1]  107     pop a 
      00825E FF               [ 4]  108     ret 
                                    109 
                                    110 
                                    111 ;-------------------------------
                                    112 ; abs24 
                                    113 ; abolute value of top  
                                    114 ;-------------------------------
      0001F3                        115 abs24: ; ( i -- u )
      00825F 20 02            [ 1]  116     ld a,(y)
      008261 A1 80            [ 1]  117     cp a,#0x80 
      008261 A6 01            [ 1]  118     jrpl neg24 ; negative integer
      008263 5F               [ 4]  119     ret  
                                    120 
                                    121 ;----------------------------
                                    122 ;  one's compleement 
                                    123 ;----------------------------
      0001FA                        124 cpl24:  ; i -- ~i 
      008264 90 F7            [ 1]  125     cpl (y) 
      008266 90 EF 01         [ 1]  126     cpl (1,y)
      008269 81 63 02         [ 1]  127     cpl (2,y)
      00826A 81               [ 4]  128     ret 
                                    129 
                                    130 ;----------------------------    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



                                    131 ; two'2 complement of top  
                                    132 ;---------------------------
      000203                        133 neg24: ; (i -- -i )
      000203                        134     _at_top
      00826A 88 C3            [ 1]    1     ld a,(y)
      00826C 00               [ 1]    2     ldw x,y 
      00826D 0E C2            [ 2]    3     ldw x,(1,x)
      00826F 00               [ 1]  135     cpl  a  
      008270 0D               [ 2]  136     cplw x 
      008271 84 81 01         [ 2]  137     addw x,#1
      008273 A9 00            [ 1]  138     adc a,#0
      00020F                        139     _store_top  
      008273 90 F6            [ 1]    1     ld (y),a 
      008275 A1 80 2A         [ 2]    2     ldw (1,y),x     
      008278 0A               [ 4]  140 9$: ret 
                                    141 
                                    142 ;-----------------------------
                                    143 ; negate integer in A:X 
                                    144 ;----------------------------
      000215                        145 neg_ax:
      008279 81               [ 1]  146     cpl  a  
      00827A 53               [ 2]  147     cplw x 
      00827A 90 73 90         [ 2]  148     addw x,#1
      00827D 63 01            [ 1]  149     adc a,#0
      00827F 90               [ 4]  150     ret 
                                    151 
                                    152 ;------------------------------------
                                    153 ;  two's complement of acc24 
                                    154 ;-------------------------------------
      00021D                        155 neg_acc24: ; 
      008280 63 02 81 0C      [ 1]  156     cpl acc24 
      008283 72 53 00 0D      [ 1]  157     cpl acc16 
      008283 90 F6 93 EE      [ 1]  158     cpl acc8
      008287 01 43 53 1C      [ 1]  159     inc acc8 
      00828B 00 01            [ 1]  160     jrne 9$
      00828D A9 00 90 F7      [ 1]  161     inc acc16 
      008291 90 EF            [ 1]  162     jrne 9$
      008293 01 81 00 0C      [ 1]  163     inc acc24 
      008295 81               [ 4]  164 9$: ret 
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
      00023A                        180 mulu24_8:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008295 43               [ 1]  181     push a 
      008296 53 1C 00 01      [ 1]  182 	clr acc32
      00829A A9 00 81 0C      [ 1]  183     clr acc24  
                                    184 ; multiply top bits 7..0 * U8   	
      00829D 90 E6 02         [ 1]  185     ld a,(2,Y) ; top least byte  
      00829D 72               [ 1]  186     ld xl,a 
      00829E 53 00            [ 1]  187     ld a,(U8,sp)
      0082A0 0D               [ 4]  188     mul x,a 
      0082A1 72 53 00         [ 2]  189     ldw acc16,x 
                                    190 ; multiply top bits 15..8 * U8     
      0082A4 0E 72 53         [ 1]  191     ld a,(1,Y) ; top middle byte 
      0082A7 00               [ 1]  192     ld xl,a 
      0082A8 0F 72            [ 1]  193     ld a,(U8,sp) 
      0082AA 5C               [ 4]  194     mul x,a 
      0082AB 00 0F 26 0A      [ 2]  195     addw x,acc24
      0082AF 72 5C 00 0E      [ 1]  196     rlc acc32 
      0082B3 26 04 72         [ 2]  197     ldw acc24,x 
                                    198 ; multiply top bits 23..16 * 8 
      0082B6 5C 00            [ 1]  199     ld a,(Y)
      0082B8 0D               [ 1]  200     ld xl,a 
      0082B9 81 01            [ 1]  201     ld a,(U8,sp)
      0082BA 42               [ 4]  202     mul x,a 
      0082BA 88 72 5F 00      [ 2]  203     addw x,acc32
      0082BE 0C               [ 1]  204     rlwa x 
      0082BF 72               [ 1]  205     tnz a 
      0082C0 5F 00            [ 1]  206     jreq 1$
      0082C2 0D 90            [ 1]  207     ld a,#ERR_OVERFLOW
      0082C4 E6 02 97         [ 2]  208     jp tb_error 
      000272                        209 1$:
      0082C7 7B               [ 1]  210     ld a,xh  
      0082C8 01 42 CF         [ 2]  211     ldw x,acc16   
      000276                        212     _drop VSIZE 
      0082CB 00 0E            [ 2]    1     addw sp,#VSIZE 
      0082CD 90               [ 4]  213     ret
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
      000279                        224 mul24:
      000279                        225     _vars VSIZE
      0082CE E6 01            [ 2]    1     sub sp,#VSIZE 
      0082D0 97               [ 1]  226     clrw x 
      0082D1 7B 01            [ 2]  227     ldw (PROD,sp),x 
      0082D3 42 72            [ 2]  228     ldw (PROD+2,sp),x
      000280                        229     _xpop 
      0082D5 BB 00            [ 1]    1     ld a,(y)
      0082D7 0D               [ 1]    2     ldw x,y 
      0082D8 72 59            [ 2]    3     ldw x,(1,x)
      0082DA 00 0C CF 00      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      0082DE 0D               [ 1]  230     tnz a 
      0082DF 90 F6            [ 1]  231     jrpl 0$
      0082E1 97 7B            [ 1]  232     cpl (PROD_SIGN,sp)
      0082E3 01 42 72         [ 4]  233     call neg_ax 
      000291                        234 0$:    
      0082E6 BB 00            [ 1]  235     ld (N1,sp),a 
      0082E8 0C 02            [ 2]  236     ldw (N1+1,sp),x
      0082EA 4D 27            [ 1]  237     tnz (Y)
      0082EC 05 A6            [ 1]  238     jrpl 2$ 
      0082EE 10 CC            [ 1]  239     cpl (PROD_SIGN,sp) 
      0082F0 97 27 03         [ 4]  240     call neg24
      0082F2                        241 2$: 
      0082F2 9E CE            [ 1]  242     ld a,(N1+2,sp); least byte     
      0082F4 00 0E            [ 1]  243     jreq 4$
      0082F6 5B 01 81         [ 4]  244     call mulu24_8
      0082F9 4D               [ 1]  245     tnz a 
      0082F9 52 07            [ 1]  246     jrmi 8$ ; overflow  
      0082FB 5F 1F            [ 1]  247     ld (PROD,sp),a
      0082FD 01 1F            [ 2]  248     ldw (PROD+1,sp),x 
      0002AC                        249 4$:
      0082FF 03 90            [ 1]  250     ld a,(N1+1,sp); middle byte     
      008301 F6 93            [ 1]  251     jreq 5$
      008303 EE 01 72         [ 4]  252     call mulu24_8
      008306 A9               [ 1]  253     tnz a 
      008307 00 03            [ 1]  254     jrne 8$  ; overflow 
      008309 4D 2A 05         [ 2]  255     addw x,(PROD,sp)
      00830C 03 04            [ 1]  256     jrv 8$ ; overflow
      00830E CD 82            [ 2]  257     ldw (PROD,sp),x 
      0002BD                        258 5$:
      008310 95 05            [ 1]  259     ld a,(N1,sp) ; high byte 
      008311 27 10            [ 1]  260     jreq 6$
      008311 6B 05 1F         [ 4]  261     call mulu24_8
      008314 06               [ 1]  262     rrwa x 
      008315 90               [ 2]  263     tnzw x 
      008316 7D 2A            [ 1]  264     jrne 8$ ; overflow 
      008318 05               [ 1]  265     tnz a 
      008319 03 04            [ 1]  266     jrmi 8$ ; overflow 
      00831B CD 82            [ 1]  267     add a,(PROD,sp)
      00831D 83 01            [ 1]  268     ld (PROD,sp),a 
      00831E 29 13            [ 1]  269     jrv 8$ ; overflow 
      0002D1                        270 6$:
      00831E 7B 07            [ 1]  271     ld a,(PROD,sp)
      008320 27 0A            [ 2]  272     ldw x,(PROD+1,sp)
      008322 CD 82            [ 1]  273     tnz (PROD_SIGN,sp)
      008324 BA 4D            [ 1]  274     jreq 9$
      008326 2B 3C 6B         [ 4]  275     call neg_ax 
      0002DC                        276 9$:
      0002DC                        277     _store_top 
      008329 01 1F            [ 1]    1     ld (y),a 
      00832B 02 EF 01         [ 2]    2     ldw (1,y),x     
      00832C                        278     _drop VSIZE 
      00832C 7B 06            [ 2]    1     addw sp,#VSIZE 
      00832E 27               [ 4]  279     ret 
      0002E4                        280 8$: ; overflow
      00832F 0D CD            [ 1]  281     ld a,#ERR_OVERFLOW
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008331 82 BA 4D         [ 2]  282     jp tb_error 
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
      0002E9                        296 divu24_8:
      008334 26               [ 2]  297 	pushw x ; save x
      008335 2E               [ 1]  298 	push a 
                                    299 	; ld dividend UU:MM bytes in X
      008336 72 FB 01         [ 2]  300 	ldw x,acc24
      008339 29 29            [ 1]  301 	ld a,(U8,SP) ; divisor
      00833B 1F               [ 2]  302 	div x,a ; UU:MM/U8
      00833C 01               [ 1]  303 	push a  ;save remainder
      00833D CF 00 0C         [ 2]  304     ldw acc24,x ; quotient 
      00833D 7B               [ 1]  305 	pop a
      00833E 05               [ 1]  306 	ld xh,a
      00833F 27 10 CD         [ 1]  307 	ld a,acc8
      008342 82               [ 1]  308 	ld xl,a
      008343 BA 01            [ 1]  309 	ld a,(U8,sp) ; divisor
      008345 5D               [ 2]  310 	div x,a  ; R:LL/U8
      008346 26 1C            [ 1]  311 	ld (U8,sp),a ; save remainder
      008348 4D               [ 1]  312 	ld a,xl
      008349 2B 19 1B         [ 1]  313 	ld acc8,a
      00834C 01               [ 1]  314 	pop a
      00834D 6B               [ 2]  315 	popw x
      00834E 01               [ 4]  316 	ret
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
      000307                        332 div24:
      000307                        333     _vars VSIZE 
      00834F 29 13            [ 2]    1     sub sp,#VSIZE 
      008351 0F 06            [ 1]  334     clr (RSIGN,sp)
      008351 7B 01            [ 1]  335     clr (QSIGN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      00030D                        336     _xpop 
      008353 1E 02            [ 1]    1     ld a,(y)
      008355 0D               [ 1]    2     ldw x,y 
      008356 04 27            [ 2]    3     ldw x,(1,x)
      008358 03 CD 82 95      [ 2]    4     addw y,#CELL_SIZE 
      00835C 4D               [ 1]  337     tnz a 
      00835C 90 F7            [ 1]  338     jrpl 0$ 
      00835E 90 EF            [ 1]  339     cpl (QSIGN,sp)
      008360 01 5B 07         [ 4]  340     call neg_ax
      00031E                        341 0$:
      008363 81 01            [ 1]  342     ld  (DIVISOR,sp),a
      008364 1F 02            [ 2]  343     ldw (DIVISOR+1,sp),x
      008364 A6 10            [ 1]  344     or a,(DIVISOR+1,sp)
      008366 CC 97            [ 1]  345     or a,(DIVISOR+2,sp)
      008368 27 05            [ 1]  346     jrne 1$ 
      008369 A6 04            [ 1]  347     ld a,#ERR_DIV0 
      008369 89 88 CE         [ 2]  348     jp tb_error 
      00032D                        349 1$: ; dividend  
      00032D                        350     _at_top
      00836C 00 0D            [ 1]    1     ld a,(y)
      00836E 7B               [ 1]    2     ldw x,y 
      00836F 01 62            [ 2]    3     ldw x,(1,x)
      008371 88               [ 1]  351     tnz a 
      008372 CF 00            [ 1]  352     jrpl 2$
      008374 0D 84 95         [ 4]  353     call neg_ax
      008377 C6 00            [ 1]  354     cpl (QSIGN,sp)
      008379 0F 97            [ 1]  355     cpl (RSIGN,sp)
      00033C                        356 2$: 
                                    357 ;    ld acc24,a 
                                    358 ;    ldw acc16,x 
      00033C                        359     _store_top 
      00837B 7B 01            [ 1]    1     ld (y),a 
      00837D 62 6B 01         [ 2]    2     ldw (1,y),x     
      008380 9F C7            [ 1]  360     ld a,#24 
      008382 00 0F            [ 1]  361     ld (CNTR,sp),a
      008384 84 85            [ 1]  362     ld a,(DIVISOR,sp)
      008386 81 02            [ 2]  363     ldw x,(DIVISOR+1,sp)
                                    364 ; dividend >= divisor ? 
      008387 CD 01 EA         [ 4]  365     call cp24_ax ; A:X-acc24 ?
      008387 52 06            [ 2]  366     jrule 22$ 
                                    367 ; quotient=0, remainder=divisor      
      008389 0F 06 0F         [ 1]  368     ld a,acc24 
      00838C 05 90 F6         [ 2]  369     ldw x,acc16 
      00838F 93 EE 01 72      [ 1]  370     clr acc24 
      008393 A9 00 03 4D      [ 1]  371     clr acc16 
      008397 2A 05 03 05      [ 1]  372     clr acc8 
      00839B CD 82            [ 2]  373     jra 6$
      000362                        374 22$:     
      00839D 95               [ 1]  375     clr a 
      00839E 5F               [ 1]  376     clrw x 
      00839E 6B               [ 1]  377     rcf  
      000365                        378 3$: ; shift carry in acc24 bit 0 
      00839F 01 1F 02         [ 1]  379     rlc (2,y) 
      0083A2 1A 02 1A         [ 1]  380     rlc (1,y)
      0083A5 03 26            [ 1]  381     rlc (Y) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      0083A7 05               [ 2]  382     rlcw x  
      0083A8 A6               [ 1]  383     rlc a
      0083A9 04 CC 97         [ 2]  384 4$: subw x,(DIVISOR+1,sp) 
      0083AC 27 01            [ 1]  385     sbc a,(DIVISOR,sp)
      0083AD 24 05            [ 1]  386     jrnc 5$
      0083AD 90 F6 93         [ 2]  387     addw x,(DIVISOR+1,sp)
      0083B0 EE 01            [ 1]  388     adc a,(DIVISOR,sp)
      00037B                        389 5$: ; shift carry in QUOTIENT 
      0083B2 4D               [ 1]  390     ccf
      0083B3 2A 07            [ 1]  391     dec (CNTR,sp)
      0083B5 CD 82            [ 1]  392     jrne 3$ 
                                    393 ; shift quotient last bit     
      0083B7 95 03 05         [ 1]  394     rlc (2,y)
      0083BA 03 06 01         [ 1]  395     rlc (1,y) 
      0083BC 90 79            [ 1]  396     rlc (y) 
      000388                        397 6$:    
      0083BC 90 F7            [ 1]  398     ld (DIVISOR,sp),a 
      0083BE 90 EF            [ 2]  399     ldw (DIVISOR+1,sp),x 
      0083C0 01 A6            [ 1]  400     tnz (QSIGN,sp)
      0083C2 18 6B            [ 1]  401     jreq 8$
      0083C4 04 7B 01         [ 4]  402     call neg24
      000393                        403 8$: 
      0083C7 1E 02            [ 1]  404     ld a,(DIVISOR,sp)
      0083C9 CD 82            [ 2]  405     ldw x,(DIVSOR+1,sp)
      000397                        406 81$:
      0083CB 6A 23            [ 1]  407     tnz (RSIGN,sp)
      0083CD 14 C6            [ 1]  408     jreq 9$
      0083CF 00 0D CE         [ 4]  409     call neg_ax       
      00039E                        410 9$: _drop VSIZE 
      0083D2 00 0E            [ 2]    1     addw sp,#VSIZE 
      0083D4 72               [ 4]  411     ret 
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
      0003A1                        423 mod24:
      0083D5 5F 00 0D         [ 4]  424     call div24 
      0003A4                        425     _store_top  ; replace quotient by remainder 
      0083D8 72 5F            [ 1]    1     ld (y),a 
      0083DA 00 0E 72         [ 2]    2     ldw (1,y),x     
      0083DD 5F               [ 4]  426     ret 
                                    427 
                                    428 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
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
      0003AA                         48 prt_peek::
      0083DE 00               [ 2]   49 	pushw x 
      0083DF 0F 20 26 0A      [ 1]   50 	mov base,#16 
      0083E2 CD 18 54         [ 4]   51 	call prt_i16  
      0083E2 4F 5F            [ 1]   52 	ld a,#': 
      0083E4 98 08 FF         [ 4]   53 	call putc 
      0083E5 A6 20            [ 1]   54 	ld a,#SPACE 
      0083E5 90 69 02         [ 4]   55 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      0083E8 90               [ 2]   56 	popw x 
      0083E9 69               [ 1]   57 	ld a,(x)
      0083EA 01               [ 1]   58 	clrw x 
      0083EB 90               [ 1]   59 	ld xl,a 
      0083EC 79 59 49 72      [ 1]   60 	mov base,#10 
      0083F0 F0 02 12         [ 4]   61 	call prt_i16 
      0083F3 01               [ 4]   62 	ret 
                                     63 
                                     64 ;----------------------------------------
                                     65 ;   DEBUG support functions
                                     66 ;----------------------------------------
                                     67 
                                     68 ; turn LED on 
      0003C8                         69 ledon:
      0083F4 24 05 72 FB      [ 1]   70     bset PC_ODR,#LED2_BIT
      0083F8 02               [ 4]   71     ret 
                                     72 
                                     73 ; turn LED off 
      0003CD                         74 ledoff:
      0083F9 19 01 50 0A      [ 1]   75     bres PC_ODR,#LED2_BIT 
      0083FB 81               [ 4]   76     ret 
                                     77 
                                     78 ; invert LED status 
      0003D2                         79 ledtoggle:
      0083FB 8C 0A            [ 1]   80     ld a,#LED2_MASK
      0083FD 04 26 E5         [ 1]   81     xor a,PC_ODR
      008400 90 69 02         [ 1]   82     ld PC_ODR,a
      008403 90               [ 4]   83     ret 
                                     84 
      0003DB                         85 left_paren:
      008404 69 01            [ 1]   86 	ld a,#SPACE 
      008406 90 79 FF         [ 4]   87 	call putc
      008408 A6 28            [ 1]   88 	ld a,#'( 
      008408 6B 01 1F         [ 4]   89 	call putc 	
      00840B 02               [ 4]   90 	ret 
                                     91 
                                     92 ;------------------------------
                                     93 ; print 8 bit register 
                                     94 ; input:
                                     95 ;   X  point to register name 
                                     96 ;   A  register value to print 
                                     97 ; output:
                                     98 ;   none
                                     99 ;------------------------------- 
      0003E6                        100 prt_reg8:
      00840C 0D               [ 1]  101 	push a 
      00840D 05 27 03         [ 4]  102 	call puts 
      008410 CD 82            [ 1]  103 	ld a,(1,sp) 
      008412 83               [ 1]  104 	clrw x 
      008413 97               [ 1]  105 	ld xl,a 
      008413 7B 01 1E 02      [ 1]  106 	mov base,#16
      008417 CD 18 54         [ 4]  107 	call prt_i16  
      008417 0D 06 27         [ 4]  108 	call left_paren 
      00841A 03               [ 1]  109 	pop a 
      00841B CD               [ 1]  110 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      00841C 82               [ 1]  111 	ld xl,a 
      00841D 95 5B 06 81      [ 1]  112 	mov base,#10 
      008421 CD 18 54         [ 4]  113 	call prt_i16  
      008421 CD 83            [ 1]  114 	ld a,#') 
      008423 87 90 F7         [ 4]  115 	call putc
      008426 90               [ 4]  116 	ret
                                    117 
                                    118 ;--------------------------------
                                    119 ; print 16 bits register 
                                    120 ; input:
                                    121 ;   X   point register name 
                                    122 ;   Y   register value to print 
                                    123 ; output:
                                    124 ;  none
                                    125 ;--------------------------------
      000408                        126 prt_reg16: 
      008427 EF 01            [ 2]  127 	pushw y 
      008429 81 09 5C         [ 4]  128 	call puts 
      00842A 1E 01            [ 2]  129 	ldw x,(1,sp) 
      00842A 89 35 10 00      [ 1]  130 	mov base,#16 
      00842E 0B CD 98         [ 4]  131 	call prt_i16  
      008431 D4 A6 3A         [ 4]  132 	call left_paren 
      008434 CD               [ 2]  133 	popw x 
      008435 89 7F A6 20      [ 1]  134 	mov base,#10 
      008439 CD 89 7F         [ 4]  135 	call prt_i16  
      00843C 85 F6            [ 1]  136 	ld a,#') 
      00843E 5F 97 35         [ 4]  137 	call putc
      008441 0A               [ 4]  138 	ret 
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
      000427                        152 print_registers:
      008442 00               [ 1]  153 	push cc 
      000428                        154 	_vars VSIZE 
      008443 0B CD            [ 2]    1     sub sp,#VSIZE 
      008445 98 D4            [ 1]  155 	ld (R_A,sp),a 
      008447 81 02            [ 2]  156 	ldw (R_X,sp),x 
      008448 17 04            [ 2]  157 	ldw (R_Y,sp),y
      008448 72 1A 50         [ 1]  158 	ld a,acc24 
      00844B 0A 81 0D         [ 2]  159 	ldw x,acc16 
      00844D 6B 08            [ 1]  160 	ld (SAV_ACC24,sp),a 
      00844D 72 1B            [ 2]  161 	ldw (SAV_ACC16,sp),x 
      00844F 50 0A 81         [ 2]  162 	ldw x,#STATES
      008452 CD 09 5C         [ 4]  163 	call puts
                                    164 ; print PC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      008452 A6 20 C8         [ 2]  165 	ldw x, #REG_PC
      008455 50 0A            [ 2]  166 	ldw y, (R_PC,sp)
      008457 C7 50 0A 81      [ 2]  167 	subw y,#3
      00845B CD 04 08         [ 4]  168 	call prt_reg16 
                                    169 ; print x
      00845B A6 20 CD         [ 2]  170 	ldw x,#REG_X
      00845E 89 7F            [ 2]  171 	ldw y,(R_X,sp)
      008460 A6 28 CD         [ 4]  172 	call prt_reg16  
                                    173 ; print Y 
      008463 89 7F 81         [ 2]  174 	ldw x,#REG_Y
      008466 16 04            [ 2]  175 	ldw y, (R_Y,sp)
      008466 88 CD 89         [ 4]  176 	call prt_reg16  
                                    177 ; print A 
      008469 DC 7B 01         [ 2]  178 	ldw x,#REG_A
      00846C 5F 97            [ 1]  179 	ld a, (R_A,sp) 
      00846E 35 10 00         [ 4]  180 	call prt_reg8
                                    181 ; print CC 
      008471 0B CD 98         [ 2]  182 	ldw x,#REG_CC 
      008474 D4 CD            [ 1]  183 	ld a, (R_CC,sp) 
      008476 84 5B 84         [ 4]  184 	call prt_reg8 
                                    185 ; print SP 
      008479 5F 97 35         [ 2]  186 	ldw x,#REG_SP
      00847C 0A 00            [ 1]  187 	ldw y,sp 
      00847E 0B CD 98 D4      [ 2]  188 	addw y,#(VSIZE+3)
      008482 A6 29 CD         [ 4]  189 	call prt_reg16  
      008485 89 7F            [ 1]  190 	ld a,#'\n' 
      008487 81 08 FF         [ 4]  191 	call putc
      008488 7B 08            [ 1]  192 	ld a,(SAV_ACC24,sp)
      008488 90 89            [ 2]  193 	ldw x,(SAV_ACC16,sp)
      00848A CD 89 DC         [ 1]  194 	ld acc24,a 
      00848D 1E 01 35         [ 2]  195 	ldw acc16,x 
      008490 10 00            [ 1]  196 	ld a,(R_A,sp)
      008492 0B CD            [ 2]  197 	ldw x,(R_X,sp)
      008494 98 D4            [ 2]  198 	ldw y,(R_Y,sp)
      00048D                        199 	_drop VSIZE
      008496 CD 84            [ 2]    1     addw sp,#VSIZE 
      008498 5B               [ 1]  200 	pop cc   	
      008499 85               [ 4]  201 	ret
                                    202 
      00849A 35 0A 00 0B CD 98 D4   203 STATES:  .asciz "\nRegisters state at break point.\n--------------------------\n"
             A6 29 CD 89 7F 81 61
             74 65 20 61 74 20 62
             72 65 61 6B 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      0084A7 50 43 3A 00            204 REG_PC: .asciz "PC:"
      0084A7 8A 52 08 6B            205 REG_Y:   .asciz "\nY:" 
      0084AB 01 1F 02 17            206 REG_X:   .asciz "\nX:"
      0084AF 04 C6 00 0D            207 REG_A:   .asciz "\nA:" 
      0084B3 CE 00 0E 6B 08         208 REG_CC:  .asciz "\nCC:"
      0084B8 1F 06 AE 85 11         209 REG_SP:  .asciz "\nSP:"
                                    210 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                    211 ;----------------------
                                    212 ; input:
                                    213 ;	Y    *input buffer 
                                    214 ; output:
                                    215 ;   acc24  integer 
                                    216 ;----------------------
      0004E8                        217 parse_addr:
      0084BD CD 89            [ 1]  218 	ld a,#SPACE 
      0084BF DC AE 85         [ 4]  219 	call skip  	 
      0084C2 4E 16 0A 72      [ 2]  220 	addw y,in.w 
      0084C6 A2 00 03         [ 2]  221 	ldw x,#pad 
      0084C9 CD 84 88         [ 4]  222 	call strcpy
      0084CC AE 85 56         [ 2]  223 	ldw x,#pad
      0084CF 16 02 CD         [ 4]  224 	call atoi24 	
      0084D2 84               [ 4]  225 	ret 
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
      0004FE                        244 cmd_itf:
      0084D3 88               [ 1]  245 	push cc 
      0004FF                        246 	_vars VSIZE
      0084D4 AE 85            [ 2]    1     sub sp,#VSIZE 
      0084D6 52 16            [ 1]  247 	ld (R_A,sp),a
      0084D8 04 CD 84         [ 1]  248 	ld a,count 
      0084DB 88 AE            [ 1]  249 	ld (SAV_COUNT,sp),a 
      0084DD 85 5A 7B         [ 1]  250 	ld a,in 
      0084E0 01 CD            [ 1]  251 	ld (SAV_IN,sp),a  
      0084E2 84 66            [ 2]  252 	ldw (R_X,sp),x 
      0084E4 AE 85            [ 2]  253 	ldw (R_Y,sp),y
      0084E6 5E 7B 09         [ 1]  254 	ld a,acc24 
      0084E9 CD 84 66         [ 2]  255 	ldw x,acc16 
      0084EC AE 85            [ 1]  256 	ld (SAV_ACC24,sp),a 
      0084EE 63 90            [ 2]  257 	ldw (SAV_ACC16,sp),x 
      0084F0 96 72 A9 00      [ 1]  258 	clr farptr 
      0084F4 0B CD 84 88      [ 1]  259 	clr farptr+1 
      0084F8 A6 0A CD 89      [ 1]  260 	clr farptr+2  
      000527                        261 repl:
      0084FC 7F 7B            [ 1]  262 	ld a,#CR 
      0084FE 08 1E 06         [ 4]  263 	call putc 
      008501 C7 00            [ 1]  264 	ld a,#'? 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      008503 0D CF 00         [ 4]  265 	call putc
      008506 0E 7B 01 1E      [ 1]  266 	clr in.w 
      00850A 02 16 04 5B      [ 1]  267 	clr in 
      00850E 08 86 81         [ 4]  268 	call readln
      008511 0A 52 65 67      [ 2]  269 	ldw y,#tib  
      008515 69 73            [ 1]  270 	ld a,(y)
      008517 74 65            [ 1]  271 	jreq repl  
      008519 72 73 20 73      [ 1]  272 	inc in 
      00851D 74 61 74         [ 4]  273 	call to_upper 
      008520 65 20            [ 1]  274 	cp a,#'Q 
      008522 61 74            [ 1]  275 	jrne test_p
      00054F                        276 repl_exit:
                                    277 ; restore original context 
      008524 20 62            [ 1]  278 	ld a,(SAV_ACC24,sp)
      008526 72 65            [ 2]  279 	ldw x,(SAV_ACC16,sp)
      008528 61 6B 20         [ 1]  280 	ld acc24,a 
      00852B 70 6F 69         [ 2]  281 	ldw acc16,x
      00852E 6E 74            [ 1]  282 	ld a,(SAV_COUNT,sp)
      008530 2E 0A 2D         [ 1]  283 	ld count,a 
      008533 2D 2D            [ 1]  284 	ld a,(SAV_IN,sp)
      008535 2D 2D 2D         [ 1]  285 	ld in,a 
      008538 2D 2D            [ 2]  286 	ldw y,(R_Y,sp)
      00853A 2D 2D            [ 2]  287 	ldw x,(R_X,sp)
      00853C 2D 2D            [ 1]  288 	ld a,(R_A,sp)
      000569                        289 	_drop VSIZE
      00853E 2D 2D            [ 2]    1     addw sp,#VSIZE 
      008540 2D               [ 1]  290 	pop cc 
      008541 2D               [ 4]  291 	ret  
      00056D                        292 invalid:
      008542 2D 2D 2D         [ 2]  293 	ldw x,#invalid_cmd 
      008545 2D 2D 2D         [ 4]  294 	call puts 
      008548 2D 2D            [ 2]  295 	jra repl 
      000575                        296 test_p:	
      00854A 2D 2D            [ 1]  297     cp a,#'P 
      00854C 0A 00            [ 1]  298 	jreq mem_peek
      00854E 50 43            [ 1]  299     cp a,#'S 
      008550 3A 00            [ 1]  300 	jrne invalid 
      00057D                        301 print_string:
      008552 0A 59 3A         [ 4]  302 	call parse_addr 	
      008555 00 0A 58         [ 2]  303 	ldw x,acc16
      008558 3A 00 0A         [ 4]  304 	call puts
      00855B 41 3A 00         [ 2]  305 	jp repl 	
      000589                        306 mem_peek:
      00855E 0A 43 43         [ 4]  307 	call parse_addr 
      008561 3A 00 0A         [ 1]  308 	ld a, acc24 
      008564 53 50 3A         [ 1]  309 	or a,acc16 
      008567 00 00 0E         [ 1]  310 	or a,acc8 
      008568 26 02            [ 1]  311 	jrne 1$ 
      008568 A6 20            [ 2]  312 	jra peek_byte  
      00856A CD 8F 62         [ 2]  313 1$:	ldw x,acc24 
      00856D 72 B9 00         [ 2]  314 	ldw farptr,x 
      008570 01 AE 16         [ 1]  315 	ld a,acc8 
      008573 B8 CD 94         [ 1]  316 	ld farptr+2,a 
      0005A5                        317 peek_byte:
      008576 35 AE 16         [ 4]  318 	call print_farptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      008579 B8 CD            [ 1]  319 	ld a,#8 
      00857B 99 76            [ 1]  320 	ld (PSIZE,sp),a 
      00857D 81               [ 1]  321 	clrw x 
      00857E CD 06 05         [ 4]  322 1$:	call fetchc  
      00857E 8A               [ 2]  323 	pushw x 
      00857F 52 0B 6B         [ 1]  324 	ld acc8,a 
      008582 01               [ 1]  325 	clrw x 
      008583 C6 00 03         [ 2]  326 	ldw acc24,x 
      008586 6B 0A            [ 1]  327 	ld a,#16+128
      008588 C6 00 02         [ 4]  328 	call prt_acc24
      00858B 6B               [ 2]  329 	popw x 
      00858C 09 1F            [ 1]  330 	dec (PSIZE,sp)
      00858E 02 17            [ 1]  331 	jrne 1$ 
      008590 04 C6            [ 1]  332 	ld a,#8 
      008592 00 0D CE         [ 1]  333 	add a,farptr+2 
      008595 00 0E 6B         [ 1]  334 	ld farptr+2,a
      008598 08               [ 1]  335 	clr a 
      008599 1F 06 72         [ 1]  336 	adc a,farptr+1 
      00859C 5F 00 19         [ 1]  337 	ld farptr+1,a 
      00859F 72               [ 1]  338 	clr a 
      0085A0 5F 00 1A         [ 1]  339 	adc a,farptr 
      0085A3 72 5F 00         [ 1]  340 	ld farptr,a 
      0085A6 1B 05 27         [ 2]  341 	jp repl  
                                    342 
      0085A7 6E 6F 74 20 61 20 63   343 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                    344 
                                    345 ;----------------------------
                                    346 ; display farptr address
                                    347 ;----------------------------
      0005EA                        348 print_farptr:
      0085A7 A6 0D CD         [ 1]  349 	ld a ,farptr+2 
      0085AA 89 7F A6         [ 1]  350 	ld acc8,a 
      0085AD 3F CD 89         [ 2]  351 	ldw x,farptr 
      0085B0 7F 72 5F         [ 2]  352 	ldw acc24,x 
      0085B3 00               [ 1]  353 	clrw x 
      0085B4 01 72            [ 1]  354 	ld a,#16 
      0085B6 5F 00 02         [ 4]  355 	call prt_acc24
      0085B9 CD 8A            [ 1]  356 	ld a,#SPACE 
      0085BB E1 90 AE         [ 4]  357 	call putc 
      0085BE 16 68 90         [ 4]  358 	call putc 
      0085C1 F6               [ 4]  359 	ret
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
      000605                        370 fetchc: ; @C
      0085C2 27 E3 72 5C      [ 5]  371 	ldf a,([farptr],x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0085C6 00               [ 1]  372 	incw x
      0085C7 02               [ 4]  373 	ret
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
      00060B                        384 number:
      0085C8 CD 99 6A         [ 4]  385 	call get_token
      0085CB A1 51            [ 1]  386 	cp a,#TK_INTGR
      0085CD 26 26            [ 1]  387 	jreq 1$
      0085CF CC 16 A5         [ 2]  388 	jp syntax_error
      0085CF 7B               [ 4]  389 1$:	ret
                                    390 
                                    391 
                                    392 ;---------------------
                                    393 ; display n bytes row 
                                    394 ; from memory.
                                    395 ; input:
                                    396 ;   A   bytes to print 
                                    397 ;	X   start address 
                                    398 ; output:
                                    399 ;   X   address after last shown  
                                    400 ;---------------------
                           000001   401 	CNT=1 
                           000002   402 	ADR=2 
                           000003   403 	VSIZE=3 
      000616                        404 show_row:
      0085D0 08               [ 1]  405 	tnz a 
      0085D1 1E 06            [ 1]  406 	jrne 1$
      0085D3 C7               [ 4]  407 	ret 
      00061A                        408 1$:	
      0085D4 00               [ 2]  409 	pushw x  
      0085D5 0D               [ 1]  410 	push a 
      0085D6 CF 00 0E 7B      [ 1]  411 	mov tab_width,#4 
      0085DA 0A C7 00         [ 4]  412 	call prt_i16 
      0085DD 03 7B            [ 1]  413 	ld a,#SPACE  
      0085DF 09 C7 00         [ 4]  414 	call putc
      000628                        415 row_loop:
      0085E2 02 16            [ 2]  416 	ldw x,(ADR,sp)
      0085E4 04               [ 1]  417 	ld a,(x)
      0085E5 1E               [ 1]  418 	clrw x 
      0085E6 02               [ 1]  419 	ld xl,a 
      0085E7 7B 01 5B         [ 4]  420 	call prt_i16 
      0085EA 0B 86            [ 2]  421 	ldw x,(ADR,sp)
      0085EC 81               [ 1]  422 	incw x 
      0085ED 1F 02            [ 2]  423 	ldw (ADR,sp),x 
      0085ED AE 86            [ 1]  424 	dec (CNT,sp)
      0085EF 5B CD            [ 1]  425 	jrne row_loop
      000639                        426 	_drop VSIZE  		
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      0085F1 89 DC            [ 2]    1     addw sp,#VSIZE 
      0085F3 20 B2 00 23      [ 1]  427 	mov tab_width,#4
      0085F5 A6 0D            [ 1]  428 	ld a,#CR 
      0085F5 A1 50 27         [ 4]  429 	call putc 
      0085F8 10               [ 4]  430 	ret 
                                    431 
                                    432 ;--------------------------
                                    433 ; print memory content 
                                    434 ; in hexadecimal format
                                    435 ;  input:
                                    436 ;    X    start address 
                                    437 ;    Y    count 
                                    438 ;--------------------------
                           000001   439 	BCNT=1
                           000003   440 	BASE=3
                           000004   441 	TABW=4
                           000004   442 	VSIZE=4   
      000645                        443 hex_dump:
      0085F9 A1               [ 1]  444 	push a 
      000646                        445 	_vars VSIZE
      0085FA 53 26            [ 2]    1     sub sp,#VSIZE 
      0085FC F0 00 0A         [ 1]  446 	ld a,base
      0085FD 6B 03            [ 1]  447 	ld (BASE,sp),a 
      0085FD CD 85 68 CE      [ 1]  448 	mov base,#16
      008601 00 0E CD         [ 1]  449 	ld a,tab_width 
      008604 89 DC            [ 1]  450 	ld (TABW,sp),a
      008606 CC 85            [ 1]  451 	ld a,#CR 
      008608 A7 08 FF         [ 4]  452 	call putc 
      008609 17 01            [ 2]  453 1$: ldw (BCNT,sp),y
      008609 CD 85            [ 1]  454 	ld a,#16
      00860B 68 C6 00 0D      [ 2]  455 	cpw y,#16
      00860F CA 00            [ 1]  456 	jrpl 2$
      008611 0E CA            [ 1]  457 	ld a,yl
      000667                        458 2$: 	
      008613 00 0F 26         [ 4]  459 	call show_row 
      008616 02 20            [ 2]  460 	ldw y,(BCNT,sp) 
      008618 0C CE 00 0D      [ 2]  461 	subw y,#16 
      00861C CF 00 19 C6      [ 2]  462 	cpw y,#1
      008620 00 0F            [ 1]  463 	jrpl 1$
      008622 C7 00            [ 1]  464 	ld a,(BASE,sp)
      008624 1B 00 0A         [ 1]  465 	ld base,a
      008625 7B 04            [ 1]  466 	ld a,(TABW,sp)
      008625 CD 86 6A         [ 1]  467 	ld tab_width,a 
      000680                        468 	_drop VSIZE
      008628 A6 08            [ 2]    1     addw sp,#VSIZE 
      00862A 6B               [ 1]  469 	pop a 
      00862B 0B               [ 4]  470 	ret 
                                    471 
                                    472 .endif ; DEBUG 
                                    473 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
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
      000684                         45 unlock_eeprom:
      00862C 5F CD 86 85 89   [ 2]   46 	btjt FLASH_IAPSR,#FLASH_IAPSR_DUL,9$
      008631 C7 00 0F 5F      [ 1]   47 	mov FLASH_CR2,#0 
      008635 CF 00 0D A6      [ 1]   48 	mov FLASH_NCR2,#0xFF 
      008639 90 CD 98 EB      [ 1]   49 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      00863D 85 0A 0B 26      [ 1]   50     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      008641 EB A6 08 CB 00   [ 2]   51 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008646 1B               [ 4]   52 9$:	ret
                                     53 
                                     54 ;----------------------------------
                                     55 ; unlock FLASH for writing/erasing
                                     56 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                     57 ; input:
                                     58 ;  none
                                     59 ; output:
                                     60 ;  none
                                     61 ;----------------------------------
      00069F                         62 unlock_flash:
      008647 C7 00 1B 4F C9   [ 2]   63 	btjt FLASH_IAPSR,#FLASH_IAPSR_PUL,9$
      00864C 00 1A C7 00      [ 1]   64 	mov FLASH_CR2,#0 
      008650 1A 4F C9 00      [ 1]   65 	mov FLASH_NCR2,#0xFF 
      008654 19 C7 00 19      [ 1]   66 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008658 CC 85 A7 6E      [ 1]   67 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      00865C 6F 74 20 61 20   [ 2]   68 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      008661 63               [ 4]   69 9$:	ret
                                     70 
                                     71 ;----------------------------
                                     72 ; erase block code must be 
                                     73 ; executed from RAM
                                     74 ; input:
                                     75 ;-----------------------------
      0006BA                         76 row_erase:
      008662 6F               [ 1]   77 	push a 
      008663 6D 6D            [ 2]   78 	pushw y 
      008665 61 6E 64 0A      [ 1]   79 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      008669 00 DF 50 5C      [ 1]   80 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      00866A 4F               [ 1]   81 	clr a 
      00866A C6 00            [ 1]   82 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      00866C 1B C7 00 0F      [ 1]   83 	ldf ([farptr],y),a
      008670 CE 00            [ 1]   84     incw y
      008672 19 CF 00 0D      [ 1]   85 	ldf ([farptr],y),a
      008676 5F A6            [ 1]   86     incw y
      008678 10 CD 98 EB      [ 1]   87 	ldf ([farptr],y),a
      00867C A6 20            [ 1]   88     incw y
      00867E CD 89 7F CD      [ 1]   89 	ldf ([farptr],y),a
      008682 89 7F 81 5F FB   [ 2]   90 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      008685 90 85            [ 2]   91 	popw y 
      008685 92               [ 1]   92 	pop a 
      008686 AF               [ 4]   93 	ret
      0006E7                         94 row_erase_end:
                                     95 
                                     96 ; copy erase_start in RAM 
      0006E7                         97 move_erase_to_ram:
      008687 00               [ 2]   98 	pushw x 
      008688 19 5C            [ 2]   99 	pushw y 
      00868A 81 06 E7         [ 2]  100 	ldw x,#row_erase_end 
      00868B 1D 06 BA         [ 2]  101 	subw x,#row_erase
      00868B CD 8F 75         [ 2]  102 	ldw acc16,x 
      00868E A1 84 27         [ 2]  103 	ldw x,#tib 
      008691 03 CC 97 25      [ 2]  104 	ldw y,#row_erase 
      008695 81 13 C5         [ 4]  105 	call move
      008696 90 85            [ 2]  106 	popw y
      008696 4D               [ 2]  107 	popw x
      008697 26               [ 4]  108 	ret 
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
      000701                        123 program_row:
      008698 01               [ 1]  124 	push a 
      008699 81 89            [ 2]  125 	pushw y 
      00869A 4B 80            [ 1]  126 	push #BLOCK_SIZE  
                                    127 ;enable block programming 
      00869A 89 88 35 04      [ 1]  128 	bset FLASH_CR2,#FLASH_CR2_PRG 
      00869E 00 24 CD 98      [ 1]  129 	bres FLASH_NCR2,#FLASH_CR2_PRG
      0086A2 D4 A6            [ 1]  130 	clrw y 
      0086A4 20               [ 1]  131 1$:	ld a,(x)
      0086A5 CD 89 7F 18      [ 1]  132 	ldf ([farptr],y),a
      0086A8 5C               [ 1]  133 	incw x 
      0086A8 1E 02            [ 1]  134 	incw y 
      0086AA F6 5F            [ 1]  135 	dec (BCNT,sp)
      0086AC 97 CD            [ 1]  136 	jrne 1$
                                    137 ; wait EOP bit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0086AE 98 D4 1E 02 5C   [ 2]  138 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      000721                        139 	_drop 1 
      0086B3 1F 02            [ 2]    1     addw sp,#1 
      0086B5 0A 01            [ 2]  140 	popw y 
      0086B7 26               [ 1]  141 	pop a 
      0086B8 EF               [ 4]  142 	ret 
      000727                        143 program_row_end:
                                    144 
                                    145 ;-------------------------
                                    146 ; move program_row to RAM 
                                    147 ; at txtubound address 
                                    148 ;------------------------
      000727                        149 move_prg_to_ram:
      0086B9 5B               [ 2]  150 	pushw x 
      0086BA 03 35            [ 2]  151 	pushw y 
      0086BC 04 00 24         [ 2]  152 	ldw x,#program_row_end 
      0086BF A6 0D CD         [ 2]  153 	subw x,#program_row 
      0086C2 89 7F 81         [ 2]  154 	ldw acc16,x ; bytes to move 
      0086C5 AE 16 68         [ 2]  155 	ldw x,#tib ; destination address 
      0086C5 88 52 04 C6      [ 2]  156 	ldw y,#program_row ; source address 
      0086C9 00 0B 6B         [ 4]  157 	call move
      0086CC 03 35            [ 2]  158 	popw y 
      0086CE 10               [ 2]  159 	popw x  
      0086CF 00               [ 4]  160 	ret 
                                    161 
                                    162 
                                    163 ;-----------------------------
                                    164 ; write a buffer in FLASH/EEPROM 
                                    165 ; input:
                                    166 ;    farptr   destination address 
                                    167 ;    x        buffer address 
                                    168 ;-----------------------------
      000741                        169 write_buffer:
      0086D0 0B               [ 2]  170 	pushw x 
      0086D1 C6 00 24 6B      [ 1]  171 	tnz farptr 
      0086D5 04 A6            [ 1]  172 	jrne to_flash 
      0086D7 0D CD 89         [ 2]  173 	ldw x,farptr+1 
      0086DA 7F 17 01         [ 2]  174 	cpw x,#app_space  
      0086DD A6 10            [ 1]  175 	jruge to_flash 
      000750                        176 to_eeprom:
      0086DF 90 A3 00         [ 4]  177 	call unlock_eeprom
      0086E2 10 2A            [ 2]  178 	jra do_programming
      000755                        179 to_flash:
      0086E4 02 90 9F         [ 4]  180 	call unlock_flash
      0086E7                        181 do_programming:
      0086E7 CD               [ 2]  182 	popw x 
      0086E8 86 96 16         [ 4]  183 	call tib
      0086EB 01 72 A2 00      [ 1]  184 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      0086EF 10 90 A3 00      [ 1]  185 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      0086F3 01               [ 4]  186 	ret 
                                    187 
                                    188 
                                    189 ;-----------------------------------
                                    190 ; erase flash or EEPROM block
                                    191 ; a block is 128 bytes 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                                    192 ; input:
                                    193 ;   farptr  address row begin
                                    194 ; output:
                                    195 ;   none
                                    196 ;--------------------------------------
      000765                        197 block_erase:
      0086F4 2A               [ 2]  198 	pushw x 
      0086F5 E5 7B 03         [ 1]  199 	ld a,farptr 
      0086F8 C7 00            [ 1]  200 	jrne erase_flash
      0086FA 0B 7B 04         [ 2]  201 	ldw x,farptr+1
      0086FD C7 00 24         [ 2]  202 	cpw x,#app_space 
      008700 5B 04            [ 1]  203 	jruge erase_flash 
                                    204 ; erase eeprom block
      008702 84 81 84         [ 4]  205 	call unlock_eeprom 
      008704 CD 16 68         [ 4]  206 	call tib 
      008704 72 06 50 5F      [ 1]  207 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      008708 15 35            [ 2]  208 	jra erase_exit  
                                    209 ; erase flash block:
      00077F                        210 erase_flash:
      00870A 00 50 5B         [ 4]  211 	call unlock_flash 
      00870D 35 FF 50         [ 4]  212 	call tib 
      008710 5C 35 AE 50      [ 1]  213     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      000789                        214 erase_exit: 
      008714 64               [ 2]  215 	popw x 
      008715 35               [ 4]  216 	ret 
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
      00078B                        232 write_byte:
      008716 56 50            [ 2]  233 	pushw y
      00078D                        234 	_vars VSIZE
      008718 64 72            [ 2]    1     sub sp,#VSIZE 
      00871A 07 50            [ 1]  235 	ld (BTW,sp),a ; byte to write 
      00871C 5F FB            [ 1]  236 	clr (OPT,sp)  ; OPTION flag
                                    237 ; put addr[15:0] in Y, for bounds check.
      00871E 81 CE 00 19      [ 2]  238 	ldw y,farptr+1   ; Y=addr15:0
                                    239 ; check addr[23:16], if <> 0 then it is extened flash memory
      00871F 72 5D 00 18      [ 1]  240 	tnz farptr 
      00871F 72 02            [ 1]  241 	jrne write_flash
      008721 50 5F 15 35      [ 2]  242     cpw y,#app_space 	 
      008725 00 50            [ 1]  243     jruge write_flash
      008727 5B 35 FF 50      [ 2]  244 	cpw y,#EEPROM_BASE  
      00872B 5C 35            [ 1]  245     jrult write_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      00872D 56 50 62 35      [ 2]  246 	cpw y,#OPTION_END 
      008731 AE 50            [ 1]  247 	jrugt write_exit
      008733 62 72            [ 2]  248 	jra write_eeprom 
                                    249 ; write program memory
      0007B1                        250 write_flash:
      008735 03 50 5F         [ 4]  251 	call unlock_flash 
      008738 FB               [ 1]  252 1$:	sim 
      008739 81 01            [ 1]  253 	ld a,(BTW,sp)
      00873A 92 A7 00 18      [ 4]  254 	ldf ([farptr],x),a ; farptr[x]=A
      00873A 88 90 89 35 20   [ 2]  255 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      00873F 50               [ 1]  256     rim 
      008740 5B 35 DF 50      [ 1]  257     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008744 5C 4F            [ 2]  258     jra write_exit
                                    259 ; write eeprom and option
      0007C7                        260 write_eeprom:
      008746 90 5F 91         [ 4]  261 	call unlock_eeprom
                                    262 	; check for data eeprom or option eeprom
      008749 A7 00 19 90      [ 2]  263 	cpw y,#OPTION_BASE
      00874D 5C 91            [ 1]  264 	jrmi 1$
      00874F A7 00 19 90      [ 2]  265 	cpw y,#OPTION_END+1
      008753 5C 91            [ 1]  266 	jrpl 1$
      008755 A7 00            [ 1]  267 	cpl (OPT,sp)
      0007D8                        268 1$: 
      008757 19 90            [ 1]  269     tnz (OPT,sp)
      008759 5C 91            [ 1]  270     jreq 2$
                                    271 	; pour modifier une option il faut modifier ces 2 bits
      00875B A7 00 19 72      [ 1]  272     bset FLASH_CR2,#FLASH_CR2_OPT
      00875F 05 50 5F FB      [ 1]  273     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0007E4                        274 2$: 
      008763 90 85            [ 1]  275     ld a,(BTW,sp)
      008765 84 81 00 18      [ 4]  276     ldf ([farptr],x),a
      008767 0D 02            [ 1]  277     tnz (OPT,sp)
      008767 27 08            [ 1]  278     jreq 3$
      008767 89               [ 1]  279     incw x
      008768 90 89            [ 1]  280     ld a,(BTW,sp)
      00876A AE               [ 1]  281     cpl a
      00876B 87 67 1D 87      [ 4]  282     ldf ([farptr],x),a
      00876F 3A CF 00 0E AE   [ 2]  283 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008774 16 68 90 AE 87   [ 2]  284 	btjf FLASH_IAPSR,#FLASH_IAPSR_HVOFF,.
      000800                        285 write_exit:
      008779 3A               [ 1]  286 	incw x 
      00877A CD 94 45         [ 4]  287 	call incr_farptr
      00877D 90               [ 1]  288 	clrw x 
      000805                        289 	_drop VSIZE 
      00877E 85 85            [ 2]    1     addw sp,#VSIZE 
      008780 81 85            [ 2]  290 	popw y
      008781 81               [ 4]  291     ret
                                    292 
                                    293 ;--------------------------------------------
                                    294 ; write a data block to eeprom or flash 
                                    295 ; the block must be erased before 
                                    296 ; using this routine.
                                    297 ; input:
                                    298 ;   Y        source address   
                                    299 ;   X        array index  destination  farptr[x]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                    300 ;   BSIZE    block size bytes 
                                    301 ;   farptr   write address , byte* 
                                    302 ; output:
                                    303 ;	X 		after last byte written 
                                    304 ;   Y 		after last byte read 
                                    305 ;  farptr   point after block
                                    306 ;---------------------------------------------
      00080A                        307 	_argofs 3 
                           000005     1     ARG_OFS=2+3 
      00080A                        308 	_arg BSIZE 1  ; block size
                           000006     1     BSIZE=ARG_OFS+1 
                                    309 	; local var 
                           000001   310 	XSAVE=1 
                           000002   311 	VSIZE=2 
      00080A                        312 write_block::
      008781 88               [ 1]  313 	push a 
      00080B                        314 	_vars VSIZE
      008782 90 89            [ 2]    1     sub sp,#VSIZE 
      008784 4B 80            [ 2]  315 	ldw (XSAVE,sp),x 
      008786 72 10            [ 2]  316 	ldw x,(BSIZE,sp) 
      008788 50 5B            [ 1]  317 	jreq 9$
      00878A 72 11            [ 2]  318 1$:	ldw x,(XSAVE,sp)
      00878C 50 5C            [ 1]  319 	ld a,(y)
      00878E 90 5F F6         [ 4]  320 	call write_byte 
      008791 91               [ 1]  321 	incw x 
      008792 A7 00            [ 1]  322 	incw y 
      008794 19 5C            [ 2]  323 	ldw (XSAVE,sp),x
      008796 90 5C            [ 2]  324 	ldw x,(BSIZE,sp)
      008798 0A               [ 2]  325 	decw x
      008799 01 26            [ 2]  326 	ldw (BSIZE,sp),x 
      00879B F4 72            [ 1]  327 	jrne 1$
      000826                        328 9$:
      00879D 05 50            [ 2]  329 	ldw x,(XSAVE,sp)
      00879F 5F FB 5B         [ 4]  330 	call incr_farptr
      00082B                        331 	_drop VSIZE
      0087A2 01 90            [ 2]    1     addw sp,#VSIZE 
      0087A4 85               [ 1]  332 	pop a 
      0087A5 84               [ 4]  333 	ret 
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
      00082F                        350 write_nbytes:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0087A6 81 89            [ 2]  351 	pushw y
      0087A7 88               [ 1]  352 	push a 
      0087A7 90 93            [ 1]  353 	ldw y,x
      0087A7 89               [ 1]  354 	clrw x 
      000835                        355 1$:  
      0087A8 90 89            [ 1]  356 	ld a,(y)
      0087AA AE 87            [ 1]  357 	incw y
      0087AC A7 1D 87         [ 4]  358 	call write_byte 
      0087AF 81               [ 1]  359 	incw x 
      0087B0 CF 00            [ 1]  360 	dec (1,sp)  
      0087B2 0E AE            [ 1]  361 	jrne 1$ 
      0087B4 16               [ 1]  362 9$: pop a 
      0087B5 68 90            [ 2]  363 	popw y 
      0087B7 AE               [ 4]  364 	ret 
                                    365 
                                    366 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    367 ;;;  flash memory operations
                                    368 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    369 
                                    370 ;--------------------------
                                    371 ; align farptr to BLOCK_SIZE 
                                    372 ;---------------------------
      000845                        373 row_align:
      0087B8 87 81            [ 1]  374 	ld a,#0x7f 
      0087BA CD 94 45         [ 1]  375 	and a,farptr+2 
      0087BD 90 85            [ 1]  376 	jreq 1$ 
      0087BF 85 81 19         [ 2]  377 	ldw x,farptr+1 
      0087C1 1C 00 80         [ 2]  378 	addw x,#BLOCK_SIZE 
      0087C1 89 72            [ 1]  379 	jrnc 0$
      0087C3 5D 00 19 26      [ 1]  380 	inc farptr 
      0087C7 0D               [ 1]  381 0$: ld a,xl 
      0087C8 CE 00            [ 1]  382 	and a,#0x80
      0087CA 1A               [ 1]  383 	ld xl,a
      0087CB A3 B9 00         [ 2]  384 	ldw farptr+1,x  	
      0087CE 24               [ 4]  385 1$:	ret
                                    386 
                                    387 ;--------------------
                                    388 ; input:
                                    389 ;   X     increment 
                                    390 ; output:
                                    391 ;   farptr  incremented 
                                    392 ;---------------------
      000860                        393 incr_farptr:
      0087CF 05 BB 00 19      [ 2]  394 	addw x,farptr+1 
      0087D0 24 04            [ 1]  395 	jrnc 1$
      0087D0 CD 87 04 20      [ 1]  396 	inc farptr 
      0087D4 03 00 19         [ 2]  397 1$:	ldw farptr+1,x  
      0087D5 81               [ 4]  398 	ret 
                                    399 
                                    400 ;-----------------------------------
                                    401 ; scan block for non zero byte 
                                    402 ; block are 128 bytes 
                                    403 ; input:
                                    404 ;    farptr     address block  
                                    405 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                    406 ;     A     0 cleared, other not cleared  
                                    407 ;-----------------------------------
      00086E                        408 scan_block:
      0087D5 CD               [ 1]  409 	clrw x 
      0087D6 87 1F 00 18      [ 5]  410 1$: ldf a,([farptr],x) 
      0087D8 26 06            [ 1]  411 	jrne 2$
      0087D8 85               [ 1]  412 	incw x 
      0087D9 CD 16 68         [ 2]  413 	cpw x,#BLOCK_SIZE 
      0087DC 72 13            [ 1]  414 	jrult 1$ 
      0087DE 50               [ 4]  415 2$:	ret 
                                    416 
                                    417 
                                    418 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
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
      00087C                         66 Uart1RxHandler: ; console receive char 
      0087DF 5F 72 17 50 5F   [ 2]   67 	btjf UART1_SR,#UART_SR_RXNE,5$
      0087E4 81 52 31         [ 1]   68 	ld a,UART1_DR 
      0087E5 A1 03            [ 1]   69 	cp a,#CTRL_C 
      0087E5 89 C6            [ 1]   70 	jrne 2$
      0087E7 00 19 26         [ 4]   71 	call putc 
      0087EA 14 CE 00         [ 2]   72 	jp user_interrupted
      00088E                         73 2$:
      0087ED 1A A3            [ 1]   74 	cp a,#CAN ; CTRL_X 
      0087EF B9 00            [ 1]   75 	jrne 3$
      0087F1 24 0C CD         [ 2]   76 	jp cold_start 	
      0087F4 87 04            [ 1]   77 3$:	cp a,#CTRL_Z 
      0087F6 CD 16            [ 1]   78 	jrne 4$
      0087F8 68 72 17         [ 4]   79 	call clear_autorun
      0087FB 50 5F 20         [ 2]   80 	jp cold_start 
      00089F                         81 4$:
      0087FE 0A               [ 1]   82 	push a 
      0087FF A6 26            [ 1]   83 	ld a,#rx1_queue 
      0087FF CD 87 1F         [ 1]   84 	add a,rx1_tail 
      008802 CD               [ 1]   85 	clrw x 
      008803 16               [ 1]   86 	ld xl,a 
      008804 68               [ 1]   87 	pop a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      008805 72               [ 1]   88 	ld (x),a 
      008806 13 50 5F         [ 1]   89 	ld a,rx1_tail 
      008809 4C               [ 1]   90 	inc a 
      008809 85 81            [ 1]   91 	and a,#RX_QUEUE_SIZE-1
      00880B C7 00 2F         [ 1]   92 	ld rx1_tail,a 
      00880B 90               [11]   93 5$:	iret 
                                     94 
      0008B3                         95 clear_autorun:
      00880C 89 52 02         [ 2]   96 	ldw x,#EEPROM_BASE 
      00880F 6B 01 0F         [ 4]   97 	call erase_header 
      008812 02               [ 4]   98 	ret 
                                     99 
                                    100 ;---------------------------------------------
                                    101 ; initialize UART1, 115200 8N1
                                    102 ; input:
                                    103 ;	none
                                    104 ; output:
                                    105 ;   none
                                    106 ;---------------------------------------------
      0008BA                        107 uart1_init:
      008813 90 CE 00 1A      [ 1]  108     bset PA_DDR,#UART1_TX_PIN
      008817 72 5D 00 19      [ 1]  109     bset PA_CR1,#UART1_TX_PIN 
      00881B 26 14 90 A3      [ 1]  110     bset PA_CR2,#UART1_TX_PIN 
                                    111 ; enable UART1 clock
      00881F B9 00 24 0E      [ 1]  112 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      0008CA                        113 uart1_set_baud: 
      008823 90               [ 1]  114 	push a 
                                    115 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    116 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008824 A3 40            [ 1]  117 	ld a,#CLK_SWR_HSI
      008826 00 25 57         [ 1]  118 	cp a,CLK_CMSR 
      008829 90 A3            [ 1]  119 	jreq 2$ 
      0008D2                        120 1$: ; 8 Mhz 	
      00882B 48 7F 22 51      [ 1]  121 	mov UART1_BRR2,#0x05 ; must be loaded first
      00882F 20 16 52 32      [ 1]  122 	mov UART1_BRR1,#0x4
      008831 20 08            [ 2]  123 	jra 3$
      0008DC                        124 2$: ; 16 Mhz 	
      008831 CD 87 1F 9B      [ 1]  125 	mov UART1_BRR2,#0x0b ; must be loaded first
      008835 7B 01 92 A7      [ 1]  126 	mov UART1_BRR1,#0x08
      0008E4                        127 3$:
      008839 00 19 72 05      [ 1]  128     clr UART1_DR
      00883D 50 5F FB 9A      [ 1]  129 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008841 72 13 50 5F      [ 1]  130 	bset UART1_CR2,#UART_CR2_SBK
      008845 20 39 52 30 FB   [ 2]  131     btjf UART1_SR,#UART_SR_TC,.
      008847 72 5F 00 2E      [ 1]  132     clr rx1_head 
      008847 CD 87 04 90      [ 1]  133 	clr rx1_tail
      00884B A3               [ 1]  134 	pop a  
      00884C 48               [ 4]  135 	ret
                                    136 
                                    137 ;---------------------------------
                                    138 ; uart1_putc
                                    139 ; send a character via UART1
                                    140 ; input:
                                    141 ;    A  	character to send
                                    142 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      0008FF                        143 putc:: ; console output always on UART1
      0008FF                        144 uart1_putc:: 
      00884D 00 2B 08 90 A3   [ 2]  145 	btjf UART1_SR,#UART_SR_TXE,.
      008852 48 80 2A         [ 1]  146 	ld UART1_DR,a 
      008855 02               [ 4]  147 	ret 
                                    148 
                                    149 
                                    150 ;---------------------------------
                                    151 ; Query for character in rx1_queue
                                    152 ; input:
                                    153 ;   none 
                                    154 ; output:
                                    155 ;   A     0 no charcter available
                                    156 ;   Z     1 no character available
                                    157 ;---------------------------------
      000908                        158 qgetc::
      000908                        159 uart1_qgetc::
      008856 03 02 2E         [ 1]  160 	ld a,rx1_head 
      008858 C0 00 2F         [ 1]  161 	sub a,rx1_tail 
      008858 0D               [ 4]  162 	ret 
                                    163 
                                    164 ;---------------------------------
                                    165 ; wait character from UART1 
                                    166 ; input:
                                    167 ;   none
                                    168 ; output:
                                    169 ;   A 			char  
                                    170 ;--------------------------------	
      00090F                        171 getc:: ;console input
      00090F                        172 uart1_getc::
      008859 02 27 08         [ 4]  173 	call uart1_qgetc
      00885C 72 1E            [ 1]  174 	jreq uart1_getc 
      00885E 50               [ 2]  175 	pushw x 
                                    176 ;; rx1_queue must be in page 0 	
      00885F 5B 72            [ 1]  177 	ld a,#rx1_queue
      008861 1F 50 5C         [ 1]  178 	add a,rx1_head 
      008864 5F               [ 1]  179 	clrw x  
      008864 7B               [ 1]  180 	ld xl,a 
      008865 01               [ 1]  181 	ld a,(x)
      008866 92               [ 1]  182 	push a
      008867 A7 00 19         [ 1]  183 	ld a,rx1_head 
      00886A 0D               [ 1]  184 	inc a 
      00886B 02 27            [ 1]  185 	and a,#RX_QUEUE_SIZE-1
      00886D 08 5C 7B         [ 1]  186 	ld rx1_head,a 
      008870 01               [ 1]  187 	pop a  
      008871 43               [ 2]  188 	popw x
      008872 92               [ 4]  189 	ret 
                                    190 
                                    191 ;-----------------------------
                                    192 ;  constants replacing 
                                    193 ;  ANSI sequence received 
                                    194 ;  from terminal.
                                    195 ;  These are the ANSI sequences
                                    196 ;  accepted by function readln
                                    197 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                           000080   198     ARROW_LEFT=128
                           000081   199     ARROW_RIGHT=129
                           000082   200     HOME=130
                           000083   201     KEY_END=131
                           000084   202     SUP=132 
                                    203 
      008873 A7 00 19 72 05 50 5F   204 convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',KEY_END,'3',SUP,0,0
             FB 72 0D 50 5F
                                    205 
                                    206 ;--------------------------------
                                    207 ; receive ANSI ESC 
                                    208 ; sequence and convert it
                                    209 ; to a single character code 
                                    210 ; in range {128..255}
                                    211 ; This is called after receiving 
                                    212 ; ESC character. 
                                    213 ; ignored sequence return 0 
                                    214 ; output:
                                    215 ;   A    converted character 
                                    216 ;-------------------------------
      000936                        217 get_escape:
      00887F FB 09 0F         [ 4]  218     call getc 
      008880 A1 5B            [ 1]  219     cp a,#'[ ; this character is expected after ESC 
      008880 5C CD            [ 1]  220     jreq 1$
      008882 88               [ 1]  221     clr a
      008883 E0               [ 4]  222     ret
      008884 5F 5B 02         [ 4]  223 1$: call getc 
      008887 90 85 81         [ 2]  224     ldw x,#convert_table
      00888A                        225 2$:
      00888A 88               [ 1]  226     cp a,(x)
      00888B 52 02            [ 1]  227     jreq 4$
      00888D 1F 01 1E         [ 2]  228     addw x,#2
      008890 06               [ 1]  229     tnz (x)
      008891 27 13            [ 1]  230     jrne 2$
      008893 1E               [ 1]  231     clr a
      008894 01               [ 4]  232     ret 
      008895 90               [ 1]  233 4$: incw x 
      008896 F6               [ 1]  234     ld a,(x)
      008897 CD 88            [ 1]  235     cp a,#SUP
      008899 0B 5C            [ 1]  236     jrne 5$
      00889B 90               [ 1]  237     push a 
      00889C 5C 1F 01         [ 4]  238     call getc
      00889F 1E               [ 1]  239     pop a 
      00095B                        240 5$:
      0088A0 06               [ 4]  241     ret 
                                    242 
                                    243 
                                    244 ;-----------------------------
                                    245 ; send an ASCIZ string to UART1 
                                    246 ; input: 
                                    247 ;   x 		char * 
                                    248 ; output:
                                    249 ;   none 
                                    250 ;-------------------------------
      00095C                        251 puts::
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0088A1 5A               [ 1]  252     ld a,(x)
      0088A2 1F 06            [ 1]  253 	jreq 1$
      0088A4 26 ED FF         [ 4]  254 	call putc 
      0088A6 5C               [ 1]  255 	incw x 
      0088A6 1E 01            [ 2]  256 	jra puts 
      0088A8 CD               [ 4]  257 1$:	ret 
                                    258 
                                    259 
                                    260 ;---------------------------
                                    261 ; delete character at left 
                                    262 ; of cursor on terminal 
                                    263 ; input:
                                    264 ;   none 
                                    265 ; output:
                                    266 ;	none 
                                    267 ;---------------------------
      000966                        268 bksp:
      0088A9 88 E0            [ 1]  269 	ld a,#BS 
      0088AB 5B 02 84         [ 4]  270 	call putc 
      0088AE 81 20            [ 1]  271 	ld a,#SPACE 
      0088AF CD 08 FF         [ 4]  272 	call putc 
      0088AF 90 89            [ 1]  273 	ld a,#BS 
      0088B1 88 90 93         [ 4]  274 	call putc 
      0088B4 5F               [ 4]  275 	ret 
                                    276 ;---------------------------
                                    277 ; delete n character left of cursor 
                                    278 ; at terminal.
                                    279 ; input: 
                                    280 ;   A   number of characters to delete.
                                    281 ; output:
                                    282 ;    none 
                                    283 ;--------------------------	
      0088B5                        284 delete_nchar:
      0088B5 90               [ 1]  285 	push a 
      0088B6 F6 90            [ 1]  286 0$:	tnz (1,sp)
      0088B8 5C CD            [ 1]  287 	jreq 1$
      0088BA 88 0B 5C         [ 4]  288 	call bksp 
      0088BD 0A 01            [ 1]  289 	dec (1,sp)
      0088BF 26 F4            [ 2]  290 	jra 0$
      0088C1 84               [ 1]  291 1$:	pop a 
      0088C2 90               [ 4]  292 	ret
                                    293 
                                    294 ;--------------------------
                                    295 ; send ANSI escape sequence
                                    296 ; ANSI: ESC[
                                    297 ; note: ESC is ASCII 27
                                    298 ;       [   is ASCII 91  
                                    299 ;-------------------------- 
      000984                        300 send_escape:
      0088C3 85 81            [ 1]  301 	ld a,#ESC 
      0088C5 CD 08 FF         [ 4]  302 	call putc 
      0088C5 A6 7F            [ 1]  303 	ld a,#'[
      0088C7 C4 00 1B         [ 4]  304 	call putc 
      0088CA 27               [ 4]  305 	ret 
                                    306 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                    307 ;---------------------
                                    308 ;send ANSI parameter value
                                    309 ; ANSI parameter values are 
                                    310 ; sent as ASCII charater 
                                    311 ; not as binary number.
                                    312 ; this routine 
                                    313 ; convert binary number to 
                                    314 ; ASCII string and send it.
                                    315 ; expected range {0..99}
                                    316 ; input: 
                                    317 ; 	A {0..99} 
                                    318 ; output:
                                    319 ;   none 
                                    320 ;---------------------
      00098F                        321 send_parameter:
      0088CB 13               [ 2]  322 	pushw x 
      0088CC CE               [ 1]  323 	clrw x 
      0088CD 00               [ 1]  324 	ld xl,a 
      0088CE 1A 1C            [ 1]  325 	ld a,#10 
      0088D0 00               [ 2]  326 	div x,a 
      0088D1 80               [ 1]  327 	ld xh,a 
      0088D2 24               [ 1]  328 	ld a,xl
      0088D3 04               [ 1]  329     tnz a 
      0088D4 72 5C            [ 1]  330     jreq 2$
      0088D6 00 19            [ 1]  331 	cp a,#9 
      0088D8 9F A4            [ 2]  332 	jrule 1$
      0088DA 80 97            [ 1]  333 	ld a,#9
      0009A0                        334 1$:
      0088DC CF 00            [ 1]  335 	add a,#'0 
      0088DE 1A 81 FF         [ 4]  336 	call putc
      0088E0 9E               [ 1]  337 2$:	ld a,xh 
      0088E0 72 BB            [ 1]  338 	add a,#'0
      0088E2 00 1A 24         [ 4]  339 	call putc 
      0088E5 04               [ 2]  340 	popw x 
      0088E6 72               [ 4]  341 	ret 
                                    342 
                                    343 ;--------------------------
                                    344 ; move cursor left n character
                                    345 ; ANSI: ESC[PnD 
                                    346 ; 'Pn' est a numerical parameter
                                    347 ; specifying number of characters 
                                    348 ; displacement.
                                    349 ; input:
                                    350 ;   A     character count
                                    351 ; output:
                                    352 ;   none
                                    353 ;--------------------------
      0009AD                        354 move_left:
      0088E7 5C               [ 1]  355 	push a 
      0088E8 00 19 CF         [ 4]  356 	call send_escape
      0088EB 00               [ 1]  357     pop a
      0088EC 1A 81 8F         [ 4]  358 	call send_parameter 
      0088EE A6 44            [ 1]  359 	ld a,#'D 
      0088EE 5F 92 AF         [ 4]  360 	call putc 
      0088F1 00               [ 4]  361 	ret	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                    362 
                                    363 
                                    364 ;--------------------------
                                    365 ; move cursor right n character 
                                    366 ; ANSI: ESC[PnC 
                                    367 ; input:
                                    368 ;   A     character count
                                    369 ; output:
                                    370 ;   none
                                    371 ;--------------------------
      0009BB                        372 move_right:
      0088F2 19               [ 1]  373 	push a 
      0088F3 26 06 5C         [ 4]  374 	call send_escape
      0088F6 A3               [ 1]  375     pop a
      0088F7 00 80 25         [ 4]  376 	call send_parameter 
      0088FA F4 81            [ 1]  377 	ld a,#'C 
      0088FC CD 08 FF         [ 4]  378 	call putc 
      0088FC 72               [ 4]  379 	ret 
                                    380 
                                    381 
                                    382 ;--------------------------
                                    383 ; print n spaces on terminal
                                    384 ; input:
                                    385 ;  X 		number of spaces 
                                    386 ; output:
                                    387 ;	none 
                                    388 ;---------------------------
      0009C9                        389 spaces::
      0088FD 0B 52            [ 1]  390 	ld a,#SPACE 
      0088FF 30               [ 2]  391 1$:	tnzw x
      008900 31 C6            [ 1]  392 	jreq 9$
      008902 52 31 A1         [ 4]  393 	call putc 
      008905 03               [ 2]  394 	decw x
      008906 26 06            [ 2]  395 	jra 1$
      0009D4                        396 9$: 
      008908 CD               [ 4]  397 	ret 
                                    398 
                                    399 ;--------------------------
                                    400 ; insert character in text 
                                    401 ; line 
                                    402 ; input:
                                    403 ;   A       character to insert 
                                    404 ;   xl      line length
                                    405 ;   xh      insert position 
                                    406 ;   Y       line pointer 
                                    407 ; output:
                                    408 ;   tib     updated 
                                    409 ;   Y       updated  
                                    410 ;-------------------------
                           000001   411 	IPOS=1
                           000002   412 	KCHAR=2 
                           000003   413     LLEN=3 
                           000003   414 	VSIZE=3 
      0009D5                        415 insert_char: 
      0009D5                        416 	_vars VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      008909 89 7F            [ 2]    1     sub sp,#VSIZE 
      00890B CC 80            [ 1]  417     ld (KCHAR,sp),a 
      00890D C9               [ 1]  418     ld a,xh 
      00890E 6B 01            [ 1]  419 	ld (IPOS,sp),a
      00890E A1               [ 1]  420     ld a,xl 
      00890F 18 26            [ 1]  421     ld (LLEN,sp),a  
      008911 03               [ 1]  422     ldw x,y
      008912 CC               [ 1]  423     incw x 
      008913 81 35            [ 1]  424     ld a,(LLEN,sp)
      008915 A1 1A            [ 1]  425     sub a,(IPOS,sp)
      008917 26               [ 1]  426     inc a 
      008918 06 CD 89         [ 1]  427     ld acc8,a 
      00891B 33 CC 81 35      [ 1]  428     clr acc16
      00891F CD 13 C5         [ 4]  429     call move
      00891F 88 A6 27 CB      [ 2]  430     ldw y,#tib 
      008923 00 30            [ 1]  431     ld a,(IPOS,sp)
      008925 5F 97 84         [ 1]  432     ld acc8,a 
      008928 F7 C6 00 30      [ 2]  433     addw y,acc16 
      00892C 4C A4            [ 1]  434     ld a,(KCHAR,sp)
      00892E 07 C7            [ 1]  435     ld (y),a
      008930 00 30            [ 1]  436     incw y  
      008932 80 01            [ 1]  437     ld a,(IPOS,sp)
      008933 CD 09 AD         [ 4]  438     call move_left
      008933 AE 40 00         [ 2]  439     ldw x,#tib 
      008936 CD A9 89         [ 4]  440     call puts 
      008939 81 03            [ 1]  441     ld a,(LLEN,sp)
      00893A 10 01            [ 1]  442     sub a,(IPOS,sp) 
      00893A 72 1A 50         [ 4]  443     call move_left 
      000A15                        444 	_drop VSIZE 
      00893D 02 72            [ 2]    1     addw sp,#VSIZE 
      00893F 1A               [ 4]  445 	ret 
                                    446 
                                    447 
                                    448 ;--------------------------
                                    449 ; delete character under cursor
                                    450 ; input:
                                    451 ;   A       line length   
                                    452 ;   xl      delete position
                                    453 ;   Y       line pointer 
                                    454 ;-------------------------
                           000001   455 	CPOS=1
                           000002   456 	LLEN=2
                           000002   457 	VSIZE=2
      000A18                        458 delete_under:
      000A18                        459 	_vars VSIZE 
      008940 50 03            [ 2]    1     sub sp,#VSIZE 
      008942 72 1A            [ 1]  460     ld (LLEN,sp),a 
      008944 50               [ 1]  461     ld a,xl 
      008945 04 72            [ 1]  462     ld (CPOS,sp),a 
      008947 14               [ 1]  463     ldw x,y ; move destination
      008948 50 C7            [ 1]  464     incw y  ; move source 
      00894A 7B 02            [ 1]  465     ld a,(LLEN,sp)
      00894A 88 A6            [ 1]  466     sub a,(CPOS,sp)
      00894C E1               [ 1]  467     inc a ; move including zero at end.
      00894D C1 50 C3         [ 1]  468     ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      008950 27 0A 00 0D      [ 1]  469     clr acc16 
      008952 CD 13 C5         [ 4]  470 	call move 
      008952 35 05 52 33      [ 2]  471     ldw y,#tib 
      008956 35 04            [ 1]  472     ld a,(CPOS,sp)
      008958 52 32 20         [ 1]  473     ld acc8,a 
      00895B 08 B9 00 0D      [ 2]  474     addw y,acc16 
      00895C 93               [ 1]  475     ldw x,y 
      00895C 35 0B 52         [ 4]  476     call puts 
      00895F 33 35            [ 1]  477     ld a,#SPACE  
      008961 08 52 32         [ 4]  478     call putc
      008964 7B 02            [ 1]  479     ld a,(LLEN,sp)
      008964 72 5F            [ 1]  480     sub a,(CPOS,sp)
      008966 52 31 35         [ 4]  481     call move_left 
      008969 2C 52            [ 1]  482     dec (LLEN,sp)
      000A50                        483 	_drop VSIZE 
      00896B 35 72            [ 2]    1     addw sp,#VSIZE 
      00896D 10               [ 4]  484 	ret 
                                    485 
                                    486 ;-----------------------------
                                    487 ; send ANSI sequence to delete
                                    488 ; whole line. Cursor position
                                    489 ; is not updated.
                                    490 ; ANSI: ESC[2K
                                    491 ; input:
                                    492 ;   none
                                    493 ; output:
                                    494 ;   none 
                                    495 ;-----------------------------
      000A53                        496 delete_line:
      00896E 52 35 72         [ 4]  497     call send_escape
      008971 0D 52            [ 1]  498 	ld a,#'2
      008973 30 FB 72         [ 4]  499 	call putc 
      008976 5F 00            [ 1]  500 	ld a,#'K 
      008978 2F 72 5F         [ 4]  501 	call putc 
      00897B 00               [ 4]  502 	ret 
                                    503 
                                    504 
                                    505 
                                    506 ;------------------------------------
                                    507 ; read a line of text from terminal
                                    508 ;  control keys: 
                                    509 ;    BS   efface caractère à gauche 
                                    510 ;    ln+CTRL_E  edit ligne# 'ln' line # 
                                    511 ;    CTRL_R  edit previous line.
                                    512 ;    CTRL_D  delete line  
                                    513 ;    HOME  go to start of line  
                                    514 ;    KEY_END  go to end of line 
                                    515 ;    ARROW_LEFT  move cursor left 
                                    516 ;    ARROW_RIGHT  move cursor right 
                                    517 ;    CTRL_O  toggle between insert/overwrite
                                    518 ; input:
                                    519 ;	none
                                    520 ; local variable on stack:
                                    521 ;	LL  line length
                                    522 ;   RXCHAR last received character 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                    523 ; output:
                                    524 ;   text in tib  buffer
                                    525 ;   count  line length 
                                    526 ;------------------------------------
                                    527 	; local variables
                           000001   528 	LL_HB=1  ; line length high byte 
                           000001   529 	RXCHAR = 1 ; last char received
                           000002   530 	LL = 2  ; accepted line length
                           000003   531 	CPOS=3  ; cursor position 
                           000004   532 	OVRWR=4 ; overwrite flag 
                           000005   533 	YTEMP=5 ; 
                           000006   534 	VSIZE=6 
      000A61                        535 readln::
      00897C 30 84            [ 2]  536 	pushw y 
      000A63                        537 	_vars VSIZE 
      00897E 81 06            [ 2]    1     sub sp,#VSIZE 
      00897F 5F               [ 1]  538 	clrw x 
      00897F 1F 02            [ 2]  539 	ldw (LL,sp),x 
      00897F 72 0F            [ 2]  540 	ldw (CPOS,sp),x 
      008981 52 30            [ 1]  541 	cpl (OVRWR,sp) ; default to overwrite mode 
      008983 FB C7 52 31      [ 2]  542  	ldw y,#tib ; terminal input buffer
      000A70                        543 readln_loop:
      008987 81 09 0F         [ 4]  544 	call getc
      008988 6B 01            [ 1]  545 	ld (RXCHAR,sp),a
      008988 A1 1B            [ 1]  546     cp a,#ESC 
      008988 C6 00            [ 1]  547     jrne 0$
      00898A 2F C0 00         [ 4]  548     call get_escape 
      00898D 30 81            [ 1]  549     ld (RXCHAR,sp),a 
      00898F A1 0D            [ 1]  550 0$:	cp a,#CR
      00898F 26 03            [ 1]  551 	jrne 1$
      00898F CD 89 88         [ 2]  552 	jp readln_quit
      008992 27 FB            [ 1]  553 1$:	cp a,#LF 
      008994 89 A6            [ 1]  554 	jrne 2$ 
      008996 27 CB 00         [ 2]  555 	jp readln_quit
      000A8C                        556 2$:
      008999 2F 5F            [ 1]  557 	cp a,#BS
      00899B 97 F6            [ 1]  558 	jrne 3$
                                    559 ; delete left 
      00899D 88 C6            [ 1]  560     tnz (CPOS,sp)
      00899F 00 2F            [ 1]  561     jreq readln_loop 
      0089A1 4C A4            [ 1]  562     ld a,#1 
      0089A3 07 C7 00         [ 4]  563     call move_left
      0089A6 2F 84            [ 1]  564     dec (CPOS,sp)
      0089A8 85 81            [ 2]  565     decw y 
      0089AA 43 81            [ 1]  566     ld a,(CPOS,sp) 
      0089AC 44 80 48         [ 2]  567     jp 12$
      000AA2                        568 3$:
      0089AF 82 46            [ 1]  569 	cp a,#CTRL_D
      0089B1 83 33            [ 1]  570 	jrne 4$
                                    571 ;delete line 
      0089B3 84 00 00         [ 4]  572 	call delete_line 
      0089B6 7B 03            [ 1]  573     ld a,(CPOS,sp)
      0089B6 CD               [ 1]  574     inc a 
      0089B7 89 8F A1         [ 4]  575     call move_left 
      0089BA 5B 27            [ 1]  576 	ld a,#'> 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      0089BC 02 4F 81         [ 4]  577 	call putc 
      0089BF CD 89 8F AE      [ 2]  578 	ldw y,#tib
      0089C3 89 AA            [ 1]  579 	clr (y)
      0089C5 0F 02            [ 1]  580 	clr (LL,sp)
      0089C5 F1 27            [ 1]  581 	clr (CPOS,sp)
      0089C7 08 1C            [ 2]  582 	jra readln_loop
      000AC0                        583 4$:
      0089C9 00 02            [ 1]  584 	cp a,#CTRL_R 
      0089CB 7D 26            [ 1]  585 	jrne 5$
                                    586 ;repeat line 
      0089CD F7 4F            [ 1]  587 	tnz (LL,sp)
      0089CF 81 5C            [ 1]  588 	jrne readln_loop
      0089D1 F6 A1 84 26      [ 2]  589 	ldw y,#tib 
      0089D5 05               [ 1]  590 	ldw x,y
      0089D6 88 CD 89         [ 4]  591 	call strlen
      0089D9 8F               [ 1]  592 	tnz a  
      0089DA 84 9D            [ 1]  593 	jreq readln_loop
      0089DB 6B 02            [ 1]  594 	ld (LL,sp),a 
      0089DB 81 03            [ 1]  595     ld (CPOS,sp),a
      0089DC 93               [ 1]  596 	ldw x,y  
      0089DC F6 27 06         [ 4]  597 	call puts
      0089DF CD 89            [ 1]  598 	clr (LL_HB,sp)
      0089E1 7F 5C 20         [ 2]  599 	addw y,(LL_HB,sp)
      0089E4 F7 81            [ 2]  600 	jra readln_loop 
      0089E6                        601 5$:
      0089E6 A6 08            [ 1]  602 	cp a,#CTRL_E 
      0089E8 CD 89            [ 1]  603 	jrne 6$
                                    604 ;edit line number 
      0089EA 7F A6 20         [ 2]  605 	ldw x,#tib 
      0089ED CD 89            [ 2]  606 	ldw (YTEMP,sp),y  
      0089EF 7F A6            [ 2]  607 	ldw y,(VSIZE+1,sp) ; restore xstack pointer 
      0089F1 08 CD 89         [ 4]  608 	call atoi24
      0089F4 7F 81            [ 2]  609 	ldw y,(YTEMP,sp) ; restore tib pointer 
      0089F6 4F               [ 1]  610 	clr a
      0089F6 88 0D 01         [ 4]  611 	call search_lineno
      0089F9 27               [ 2]  612 	tnzw x 
      0089FA 07 CD            [ 1]  613 	jrne 51$
      0089FC 89 E6            [ 1]  614 	clr (LL,sp)
      0089FE 0A 01 20 F5      [ 2]  615 	ldw y,#tib
      008A02 84 81            [ 1]  616     clr (y) 	
      008A04 CC 0C 09         [ 2]  617 	jp readln_quit  
      000B04                        618 51$:
      008A04 A6 1B CD         [ 2]  619 	ldw basicptr,x
      008A07 89 7F            [ 1]  620 	ld a,(2,x)
      008A09 A6 5B CD         [ 1]  621 	ld count,a 
      008A0C 89 7F 81 68      [ 2]  622 	ldw y,#tib 
      008A0F CD 11 B5         [ 4]  623 	call decompile 
      008A0F 89 5F            [ 1]  624 	clr (LL_HB,sp)
      008A11 97 A6            [ 1]  625 	ld a,#CR 
      008A13 0A 62 95         [ 4]  626 	call putc 
      008A16 9F 4D            [ 1]  627 	ld a,#'>
      008A18 27 0B A1         [ 4]  628 	call putc
      008A1B 09 23 02         [ 2]  629     ldw x,#tib  
      008A1E A6 09 99         [ 4]  630 	call strlen 
      008A20 6B 02            [ 1]  631 	ld (LL,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      008A20 AB 30 CD         [ 4]  632 	call puts 
      008A23 89 7F            [ 1]  633 	ldw y,x
      008A25 9E AB            [ 1]  634     ld a,(LL,sp)
      008A27 30 CD            [ 1]  635     ld (CPOS,sp),a  
      008A29 89 7F 85         [ 2]  636 	jp readln_loop
      000B33                        637 6$:
      008A2C 81 81            [ 1]  638 	cp a,#ARROW_RIGHT
      008A2D 26 15            [ 1]  639    	jrne 7$ 
                                    640 ; right arrow
      008A2D 88 CD            [ 1]  641 	ld a,(CPOS,sp)
      008A2F 8A 04            [ 1]  642     cp a,(LL,sp)
      008A31 84 CD            [ 1]  643     jrmi 61$
      008A33 8A 0F A6         [ 2]  644     jp readln_loop 
      000B40                        645 61$:
      008A36 44 CD            [ 1]  646     ld a,#1 
      008A38 89 7F 81         [ 4]  647 	call move_right 
      008A3B 0C 03            [ 1]  648 	inc (CPOS,sp)
      008A3B 88 CD            [ 1]  649     incw y 
      008A3D 8A 04 84         [ 2]  650     jp readln_loop 
      008A40 CD 8A            [ 1]  651 7$: cp a,#ARROW_LEFT  
      008A42 0F A6            [ 1]  652 	jrne 8$
                                    653 ; left arrow 
      008A44 43 CD            [ 1]  654 	tnz (CPOS,sp)
      008A46 89 7F            [ 1]  655 	jrne 71$
      008A48 81 0A 70         [ 2]  656 	jp readln_loop
      008A49                        657 71$:
      008A49 A6 20            [ 1]  658     ld a,#1 
      008A4B 5D 27 06         [ 4]  659 	call move_left 
      008A4E CD 89            [ 1]  660 	dec (CPOS,sp)
      008A50 7F 5A            [ 2]  661     decw y 
      008A52 20 F7 70         [ 2]  662 	jp readln_loop 
      008A54 A1 82            [ 1]  663 8$: cp a,#HOME  
      008A54 81 0E            [ 1]  664 	jrne 9$
                                    665 ; HOME 
      008A55 7B 03            [ 1]  666     ld a,(CPOS,sp)
      008A55 52 03 6B         [ 4]  667     call move_left 
      008A58 02 9E            [ 1]  668 	clr (CPOS,sp)
      008A5A 6B 01 9F 6B      [ 2]  669     ldw y,#tib 
      008A5E 03 93 5C         [ 2]  670 	jp readln_loop  
      008A61 7B 03            [ 1]  671 9$: cp a,#KEY_END  
      008A63 10 01            [ 1]  672 	jrne 10$
                                    673 ; KEY_END 
      008A65 4C C7            [ 1]  674 	ld a,(CPOS,sp)
      008A67 00 0F            [ 1]  675 	cp a,(LL,sp)
      008A69 72 5F            [ 1]  676 	jrne 91$
      008A6B 00 0E CD         [ 2]  677 	jp readln_loop 
      000B82                        678 91$:
      008A6E 94 45            [ 1]  679 	ld a,(LL,sp)
      008A70 90 AE            [ 1]  680 	sub a,(CPOS,sp)
      008A72 16 68 7B         [ 4]  681 	call move_right 
      008A75 01 C7            [ 1]  682 	ld a,(LL,sp)
      008A77 00 0F            [ 1]  683 	ld (CPOS,sp),a
      008A79 72 B9 00 0E      [ 2]  684     ldw y,#tib
      008A7D 7B 02 90 F7      [ 1]  685     clr acc16 
      008A81 90 5C 7B         [ 1]  686     ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      008A84 01 CD 8A 2D      [ 2]  687     addw y,acc16  
      008A88 AE 16 68         [ 2]  688 	jp readln_loop 
      008A8B CD 89            [ 1]  689 10$: cp a,#CTRL_O
      008A8D DC 7B            [ 1]  690 	jrne 11$ 
                                    691 ; toggle between insert/overwrite
      008A8F 03 10            [ 1]  692 	cpl (OVRWR,sp)
      008A91 01 CD 8A         [ 4]  693 	call beep_1khz
      008A94 2D 5B 03         [ 2]  694 	jp readln_loop 
      008A97 81 84            [ 1]  695 11$: cp a,#SUP 
      008A98 26 11            [ 1]  696     jrne final_test 
                                    697 ; del character under cursor 
      008A98 52 02            [ 1]  698     ld a,(CPOS,sp)
      008A9A 6B 02            [ 1]  699     cp a,(LL,sp)
      008A9C 9F 6B            [ 1]  700     jrpl 13$
      000BB5                        701 12$:
      008A9E 01               [ 1]  702     ld xl,a    ; cursor position 
      008A9F 93 90            [ 1]  703     ld a,(LL,sp)  ; line length
      008AA1 5C 7B 02         [ 4]  704     call delete_under
      008AA4 10 01            [ 1]  705     dec (LLEN,sp)
      000BBD                        706 13$:
      008AA6 4C C7 00         [ 2]  707     jp readln_loop 
      000BC0                        708 final_test:
      008AA9 0F 72            [ 1]  709 	cp a,#SPACE
      008AAB 5F 00            [ 1]  710 	jrpl accept_char
      008AAD 0E CD 94         [ 2]  711 	jp readln_loop
      000BC7                        712 accept_char:
      008AB0 45 90            [ 1]  713 	ld a,#TIB_SIZE-1
      008AB2 AE 16            [ 1]  714 	cp a, (LL,sp)
      008AB4 68 7B            [ 1]  715 	jrpl 1$
      008AB6 01 C7 00         [ 2]  716 	jp readln_loop
      008AB9 0F 72            [ 1]  717 1$:	tnz (OVRWR,sp)
      008ABB B9 00            [ 1]  718 	jrne overwrite
                                    719 ; insert mode 
      008ABD 0E 93            [ 1]  720     ld a,(CPOS,sp)
      008ABF CD 89            [ 1]  721     cp a,(LL,sp)
      008AC1 DC A6            [ 1]  722     jreq overwrite
      008AC3 20 CD            [ 1]  723     ld a,(LL,sp)
      008AC5 89               [ 1]  724     ld xl,a 
      008AC6 7F 7B            [ 1]  725     ld a,(CPOS,sp)
      008AC8 02               [ 1]  726     ld xh,a
      008AC9 10 01            [ 1]  727     ld a,(RXCHAR,sp)
      008ACB CD 8A 2D         [ 4]  728     call insert_char
      008ACE 0A 02            [ 1]  729     inc (LLEN,sp)
      008AD0 5B 02            [ 1]  730     inc (CPOS,sp)	
      008AD2 81 0A 70         [ 2]  731     jp readln_loop 
      008AD3                        732 overwrite:
      008AD3 CD 8A            [ 1]  733 	ld a,(RXCHAR,sp)
      008AD5 04 A6            [ 1]  734 	ld (y),a
      008AD7 32 CD            [ 1]  735     incw y
      008AD9 89 7F A6         [ 4]  736     call putc 
      008ADC 4B CD            [ 1]  737 	ld a,(CPOS,sp)
      008ADE 89 7F            [ 1]  738 	cp a,(LL,sp)
      008AE0 81 09            [ 1]  739 	jrmi 1$
      008AE1 90 7F            [ 1]  740 	clr (y)
      008AE1 90 89            [ 1]  741 	inc (LL,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      008AE3 52 06            [ 1]  742     inc (CPOS,sp)
      008AE5 5F 1F 02         [ 2]  743 	jp readln_loop 
      000C04                        744 1$:	
      008AE8 1F 03            [ 1]  745 	inc (CPOS,sp)
      008AEA 03 04 90         [ 2]  746 	jp readln_loop 
      000C09                        747 readln_quit:
      008AED AE 16 68 68      [ 2]  748 	ldw y,#tib
      008AF0 0F 01            [ 1]  749     clr (LL_HB,sp) 
      008AF0 CD 89 8F         [ 2]  750     addw y,(LL_HB,sp)
      008AF3 6B 01            [ 1]  751     clr (y)
      008AF5 A1 1B            [ 1]  752 	ld a,(LL,sp)
      008AF7 26 05 CD         [ 1]  753 	ld count,a 
      008AFA 89 B6            [ 1]  754 	ld a,#CR
      008AFC 6B 01 A1         [ 4]  755 	call putc
      000C1E                        756 	_drop VSIZE 
      008AFF 0D 26            [ 2]    1     addw sp,#VSIZE 
      008B01 03 CC            [ 2]  757 	popw y 
      008B03 8C               [ 4]  758 	ret
                                    759 
                                    760 ;------------------------------
                                    761 ; print byte  in hexadecimal 
                                    762 ; on console
                                    763 ; input:
                                    764 ;    A		byte to print
                                    765 ;------------------------------
      000C23                        766 print_hex::
      008B04 89               [ 1]  767 	push a 
      008B05 A1               [ 1]  768 	swap a 
      008B06 0A 26 03         [ 4]  769 	call to_hex_char 
      008B09 CC 8C 89         [ 4]  770 	call putc 
      008B0C 7B 01            [ 1]  771     ld a,(1,sp) 
      008B0C A1 08 26         [ 4]  772 	call to_hex_char
      008B0F 12 0D 03         [ 4]  773 	call putc
      008B12 27 DC            [ 1]  774 	ld a,#SPACE 
      008B14 A6 01 CD         [ 4]  775 	call putc 
      008B17 8A               [ 1]  776 	pop a 
      008B18 2D               [ 4]  777 	ret 
                                    778 
                                    779 ;----------------------------------
                                    780 ; convert to hexadecimal digit 
                                    781 ; input:
                                    782 ;   A       digit to convert 
                                    783 ; output:
                                    784 ;   A       hexdecimal character 
                                    785 ;----------------------------------
      000C3A                        786 to_hex_char::
      008B19 0A 03            [ 1]  787 	and a,#15 
      008B1B 90 5A            [ 1]  788 	cp a,#9 
      008B1D 7B 03            [ 2]  789 	jrule 1$ 
      008B1F CC 8C            [ 1]  790 	add a,#7
      008B21 35 30            [ 1]  791 1$: add a,#'0 
      008B22 81               [ 4]  792 	ret 
                                    793 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
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
      000C45                         51 search_lineno::
      000C45                         52 	_vars VSIZE
      008B22 A1 04            [ 2]    1     sub sp,#VSIZE 
      008B24 26 1A            [ 1]   53 	clr (LL,sp)
      008B26 CD 8A D3 7B      [ 2]   54 	ldw y,txtbgn
      008B2A 03               [ 1]   55 	tnz a 
      008B2B 4C CD            [ 1]   56 	jreq search_ln_loop
      008B2D 8A 2D A6 3E      [ 2]   57 	ldw y,basicptr 
      000C54                         58 search_ln_loop:
      008B31 CD 89 7F 90      [ 2]   59 	cpw y,txtend 
      008B35 AE 16            [ 1]   60 	jrpl 8$
      008B37 68 90            [ 1]   61 	cpw x,(y)
      008B39 7F 0F            [ 1]   62 	jreq 9$
      008B3B 02 0F            [ 1]   63 	jrmi 8$ 
      008B3D 03 20 B0         [ 1]   64 	ld a,(2,y)
      008B40 6B 02            [ 1]   65 	ld (LB,sp),a 
      008B40 A1 12 26         [ 2]   66 	addw y,(LL,sp)
      008B43 1E 0D            [ 2]   67 	jra search_ln_loop 
      000C6A                         68 8$: 
      008B45 02               [ 1]   69 	clrw x 	
      008B46 26               [ 1]   70 	exgw x,y 
      000C6C                         71 9$: _drop VSIZE
      008B47 A8 90            [ 2]    1     addw sp,#VSIZE 
      008B49 AE               [ 1]   72 	exgw x,y   
      008B4A 16               [ 4]   73 	ret 
                                     74 
                                     75 ;-------------------------------------
                                     76 ; delete line at addr
                                     77 ; input:
                                     78 ;   X 		addr of line i.e DEST for move 
                                     79 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                           000001    80 	LLEN=1
                           000003    81 	SRC=3
                           000004    82 	VSIZE=4
      000C70                         83 del_line: 
      000C70                         84 	_vars VSIZE 
      008B4B 68 93            [ 2]    1     sub sp,#VSIZE 
      008B4D CD 94            [ 1]   85 	ld a,(2,x) ; line length
      008B4F 19 4D            [ 1]   86 	ld (LLEN+1,sp),a 
      008B51 27 9D            [ 1]   87 	clr (LLEN,sp)
      008B53 6B 02            [ 1]   88 	ldw y,x  
      008B55 6B 03 93         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      008B58 CD 89            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      008B5A DC 0F 01 72      [ 2]   91 	ldw y,txtend 
      008B5E F9 01 20         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      008B61 8E CF 00 0D      [ 2]   93 	ldw acc16,y 
      008B62 16 03            [ 2]   94 	ldw y,(SRC,sp)    ; source
      008B62 A1 05 26         [ 4]   95 	call move
      008B65 4D AE 16 68      [ 2]   96 	ldw y,txtend 
      008B69 17 05 16         [ 2]   97 	subw y,(LLEN,sp)
      008B6C 07 CD 99 76      [ 2]   98 	ldw txtend,y
      008B70 16 05 4F CD      [ 2]   99 	ldw dvar_bgn,y 
      008B74 8C C5 5D 26      [ 2]  100 	ldw dvar_end,y   
      000CA2                        101 	_drop VSIZE     
      008B78 0B 0F            [ 2]    1     addw sp,#VSIZE 
      008B7A 02               [ 4]  102 	ret 
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
      000CA5                        117 open_gap:
      008B7B 90 AE 16         [ 2]  118 	cpw x,txtend 
      008B7E 68 90            [ 1]  119 	jruge 9$
      000CAA                        120 	_vars VSIZE
      008B80 7F CC            [ 2]    1     sub sp,#VSIZE 
      008B82 8C 89            [ 2]  121 	ldw (SRC,sp),x 
      008B84 17 05            [ 2]  122 	ldw (LEN,sp),y 
      008B84 CF 00 05 E6      [ 2]  123 	ldw acc16,y 
      008B88 02 C7            [ 1]  124 	ldw y,x ; SRC
      008B8A 00 03 90 AE      [ 2]  125 	addw x,acc16  
      008B8E 16 68            [ 2]  126 	ldw (DEST,sp),x 
                                    127 ;compute size to move 	
      008B90 CD 92 35         [ 2]  128 	ldw x,txtend 
      008B93 0F 01 A6         [ 2]  129 	subw x,(SRC,sp)
      008B96 0D CD 89         [ 2]  130 	ldw acc16,x ; size to move
      008B99 7F A6            [ 2]  131 	ldw x,(DEST,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      008B9B 3E CD 89         [ 4]  132 	call move
      008B9E 7F AE 16         [ 2]  133 	ldw x,txtend
      008BA1 68 CD 94         [ 2]  134 	addw x,(LEN,sp)
      008BA4 19 6B 02         [ 2]  135 	ldw txtend,x
      008BA7 CD 89 DC         [ 2]  136 	ldw dvar_bgn,x 
      008BAA 90 93 7B         [ 2]  137 	ldw dvar_end,x 
      000CD9                        138 	_drop VSIZE 
      008BAD 02 6B            [ 2]    1     addw sp,#VSIZE 
      008BAF 03               [ 4]  139 9$:	ret 
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
      000CDC                        156 insert_line:
      000CDC                        157 	_vars VSIZE 
      008BB0 CC 8A            [ 2]    1     sub sp,#VSIZE 
      008BB2 F0 CE 00 19      [ 5]  158 	ldw x,[ptr16]
      008BB3 1F 05            [ 2]  159 	ldw (LINENO,sp),x 
      008BB3 A1 81            [ 1]  160 	clr (LLEN,sp)
      008BB5 26 15 7B         [ 2]  161 	ldw x,ptr16 
      008BB8 03 11            [ 1]  162 	ld a,(2,x)
      008BBA 02 2B            [ 1]  163 	ld (LLEN+1,sp),a 
      008BBC 03               [ 1]  164 	clr a 
      008BBD CC 8A            [ 2]  165 	ldw x,(LINENO,sp)
      008BBF F0 0C 45         [ 4]  166 	call search_lineno
      008BC0 5D               [ 2]  167 	tnzw x 
      008BC0 A6 01            [ 1]  168 	jreq 0$ 
      008BC2 CD 8A            [ 2]  169 	ldw (DEST,sp),x 
      008BC4 3B 0C 03         [ 4]  170 	call del_line 
      008BC7 90 5C            [ 2]  171 	jra 1$
      008BC9 CC 8A            [ 2]  172 0$: ldw (DEST,sp),y
      008BCB F0 A1            [ 1]  173 1$: ld a,#3 
      008BCD 80 26            [ 1]  174 	cp a,(LLEN+1,sp)
      008BCF 13 0D            [ 1]  175 	jreq 9$
                                    176 ; check for space 
      008BD1 03 26 03         [ 2]  177 	ldw x,txtend 
      008BD4 CC 8A F0         [ 2]  178 	addw x,(LLEN,sp)
      008BD7 A3 16 4A         [ 2]  179 	cpw x,#tib-10*CELL_SIZE ; keep 10 slots space for @() array.  
      008BD7 A6 01            [ 1]  180 	jrult 3$
      008BD9 CD 8A 2D 0A      [ 1]  181 	bset flags,#FLN_REJECTED
      008BDD 03 90 5A         [ 2]  182 	ldw x,#err_mem_full 
      008BE0 CC 8A F0         [ 4]  183 	call puts 
      008BE3 A1 82            [ 2]  184 	jra 9$  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      000D1C                        185 3$: ; create gap to insert line 
      008BE5 26 0E            [ 2]  186 	ldw x,(DEST,sp) 
      008BE7 7B 03            [ 2]  187 	ldw y,(LLEN,sp)
      008BE9 CD 8A 2D         [ 4]  188 	call open_gap 
                                    189 ; move new line in gap 
      008BEC 0F 03            [ 2]  190 	ldw x,(LLEN,sp)
      008BEE 90 AE 16         [ 2]  191 	ldw acc16,x 
      008BF1 68 CC 8A F0      [ 2]  192 	ldw y,#pad ;SRC 
      008BF5 A1 83            [ 2]  193 	ldw x,(DEST,sp) ; dest address 
      008BF7 26 26 7B         [ 4]  194 	call move
      008BFA 03 11            [ 2]  195 	ldw x,(DEST,sp)
      008BFC 02 26 03         [ 2]  196 	cpw x,txtend 
      008BFF CC 8A            [ 1]  197 	jrult 9$ 
      008C01 F0 07            [ 2]  198 	ldw x,(LLEN,sp)
      008C02 72 BB 00 1D      [ 2]  199 	addw x,txtend 
      008C02 7B 02 10         [ 2]  200 	ldw txtend,x 
      008C05 03 CD 8A         [ 2]  201 	ldw dvar_bgn,x 
      008C08 3B 7B 02         [ 2]  202 	ldw dvar_end,x 
      000D47                        203 9$:	
      000D47                        204 	_drop VSIZE
      008C0B 6B 03            [ 2]    1     addw sp,#VSIZE 
      008C0D 90               [ 4]  205 	ret
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
      000D4A                        221 parse_quote: 
      000D4A                        222 	_vars VSIZE 
      008C0E AE 16            [ 2]    1     sub sp,#VSIZE 
      008C10 68               [ 1]  223 	clr a
      008C11 72 5F            [ 1]  224 1$:	ld (PREV,sp),a 
      000D4F                        225 2$:	
      008C13 00 0E C7         [ 4]  226 	ld a,([in.w],y)
      008C16 00 0F            [ 1]  227 	jreq 6$
      008C18 72 B9 00 0E      [ 1]  228 	inc in 
      008C1C CC 8A            [ 1]  229 	ld (CURR,sp),a 
      008C1E F0 A1            [ 1]  230 	ld a,#'\
      008C20 0F 26            [ 1]  231 	cp a, (PREV,sp)
      008C22 08 03            [ 1]  232 	jrne 3$
      008C24 04 CD            [ 1]  233 	clr (PREV,sp)
      008C26 A6 8F            [ 1]  234 	ld a,(CURR,sp)
      008C28 CC 8A            [ 4]  235 	callr convert_escape
      008C2A F0               [ 1]  236 	ld (x),a 
      008C2B A1               [ 1]  237 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      008C2C 84 26            [ 2]  238 	jra 2$
      000D6A                        239 3$:
      008C2E 11 7B            [ 1]  240 	ld a,(CURR,sp)
      008C30 03 11            [ 1]  241 	cp a,#'\'
      008C32 02 2A            [ 1]  242 	jreq 1$
      008C34 08 22            [ 1]  243 	cp a,#'"
      008C35 27 04            [ 1]  244 	jreq 6$ 
      008C35 97               [ 1]  245 	ld (x),a 
      008C36 7B               [ 1]  246 	incw x 
      008C37 02 CD            [ 2]  247 	jra 2$
      000D78                        248 6$:
      008C39 8A               [ 1]  249 	clr (x)
      008C3A 98               [ 1]  250 	incw x 
      008C3B 0A 02            [ 1]  251 	ldw y,x 
      008C3D 5F               [ 1]  252 	clrw x 
      008C3D CC 8A            [ 1]  253 	ld a,#TK_QSTR  
      000D7F                        254 	_drop VSIZE
      008C3F F0 02            [ 2]    1     addw sp,#VSIZE 
      008C40 81               [ 4]  255 	ret 
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
      000D82                        266 convert_escape:
      008C40 A1               [ 2]  267 	pushw x 
      008C41 20 2A 03         [ 2]  268 	ldw x,#escaped 
      008C44 CC               [ 1]  269 1$:	cp a,(x)
      008C45 8A F0            [ 1]  270 	jreq 2$
      008C47 7D               [ 1]  271 	tnz (x)
      008C47 A6 4F            [ 1]  272 	jreq 3$
      008C49 11               [ 1]  273 	incw x 
      008C4A 02 2A            [ 2]  274 	jra 1$
      008C4C 03 CC 8A         [ 2]  275 2$: subw x,#escaped 
      008C4F F0               [ 1]  276 	ld a,xl 
      008C50 0D 04            [ 1]  277 	add a,#7
      008C52 26               [ 2]  278 3$:	popw x 
      008C53 18               [ 4]  279 	ret 
                                    280 
      008C54 7B 03 11 02 27 12 7B   281 escaped:: .asciz "abtnvfr"
             02
                                    282 
                                    283 ;-------------------------
                                    284 ; integer parser 
                                    285 ; input:
                                    286 ;   X 		point to output buffer  
                                    287 ;   Y 		point to tib 
                                    288 ;   A 	    first digit|'$' 
                                    289 ; output:  
                                    290 ;   X 		integer bits 15..0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                    291 ;   A 		TK_INTGR
                                    292 ;   acc24   24 bits integer 
                                    293 ;-------------------------
                           000001   294 	BASE=1
                           000002   295 	TCHAR=2 
                           000003   296 	XSAVE=3
                           000004   297 	VSIZE=4 
      000D9F                        298 parse_integer: ; { -- n }
      008C5C 97               [ 2]  299 	pushw x 	
      008C5D 7B 03            [ 1]  300 	push #0 ; TCHAR
      008C5F 95 7B            [ 1]  301 	push #10 ; BASE=10
      008C61 01 CD            [ 1]  302 	cp a,#'$
      008C63 8A 55            [ 1]  303 	jrne 2$ 
      000DA8                        304     _drop #1
      008C65 0C 02            [ 2]    1     addw sp,##1 
      008C67 0C 03            [ 1]  305 	push #16  ; BASE=16
      008C69 CC               [ 1]  306 2$:	ld (x),a 
      008C6A 8A               [ 1]  307 	incw x 
      008C6B F0 D6 00         [ 4]  308 	ld a,([in.w],y)
      008C6C 72 5C 00 01      [ 1]  309 	inc in 
      008C6C 7B 01 90         [ 4]  310 	call to_upper 
      008C6F F7 90            [ 1]  311 	ld (TCHAR,sp),a 
      008C71 5C CD 89         [ 4]  312 	call is_digit 
      008C74 7F 7B            [ 1]  313 	jrc 2$
      008C76 03 11            [ 1]  314 	ld a,#16 
      008C78 02 2B            [ 1]  315 	cp a,(BASE,sp)
      008C7A 09 90            [ 1]  316 	jrne 3$ 
      008C7C 7F 0C            [ 1]  317 	ld a,(TCHAR,sp)
      008C7E 02 0C            [ 1]  318 	cp a,#'A 
      008C80 03 CC            [ 1]  319 	jrmi 3$ 
      008C82 8A F0            [ 1]  320 	cp a,#'G 
      008C84 2B DD            [ 1]  321 	jrmi 2$ 
      008C84 0C 03 CC 8A      [ 1]  322 3$: dec in 	
      008C88 F0               [ 1]  323     clr (x)
      008C89 1E 03            [ 2]  324 	ldw x,(XSAVE,sp)
      008C89 90 AE 16 68      [ 2]  325 	ldw y,#XSTACK_EMPTY 
      008C8D 0F 01 72         [ 4]  326 	call atoi24
      008C90 F9 01            [ 2]  327 	ldw y,(XSAVE,sp)
      008C92 90 7F 7B         [ 1]  328 	ld a,acc24 
      008C95 02 C7            [ 1]  329 	ld (y),a 
      008C97 00 03            [ 1]  330 	incw y  
      008C99 A6 0D CD         [ 2]  331 	ldw x,acc16 
      008C9C 89 7F            [ 2]  332 	ldw (y),x 
      008C9E 5B 06 90 85      [ 2]  333 	addw y,#2
      008CA2 81 84            [ 1]  334 	ld a,#TK_INTGR
      008CA3                        335 	_drop VSIZE  
      008CA3 88 4E            [ 2]    1     addw sp,#VSIZE 
      008CA5 CD               [ 4]  336 	ret 	
                                    337 
                                    338 ;-------------------------
                                    339 ; binary integer parser
                                    340 ; build integer in acc24  
                                    341 ; input:
                                    342 ;   X 		point to output buffer  
                                    343 ;   Y 		point to tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
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
      000DF4                        353 parse_binary: ; { -- n }
      008CA6 8C BA            [ 1]  354 	push #0
      008CA8 CD 89            [ 1]  355 	push #0
      008CAA 7F 7B            [ 1]  356 	push #0
      000DFA                        357 2$:	
      008CAC 01 CD 8C         [ 4]  358 	ld a,([in.w],y)
      008CAF BA CD 89 7F      [ 1]  359 	inc in 
      008CB3 A6 20            [ 1]  360 	cp a,#'0 
      008CB5 CD 89            [ 1]  361 	jreq 3$
      008CB7 7F 84            [ 1]  362 	cp a,#'1 
      008CB9 81 02            [ 1]  363 	jreq 3$ 
      008CBA 20 0B            [ 2]  364 	jra bin_exit 
      008CBA A4 0F            [ 1]  365 3$: sub a,#'0 
      008CBC A1               [ 1]  366 	rrc a
      008CBD 09 23            [ 1]  367 	rlc (BINARY+2,sp) 
      008CBF 02 AB            [ 1]  368 	rlc (BINARY+1,sp)
      008CC1 07 AB            [ 1]  369 	rlc (BINARY,sp) 
      008CC3 30 81            [ 2]  370 	jra 2$  
      008CC5                        371 bin_exit:
      008CC5 52 02 0F 01      [ 1]  372 	dec in 
      008CC9 90 CE            [ 1]  373 	ldw y,x
      008CCB 00 1C            [ 1]  374 	ld a,(BINARY,sp)
      008CCD 4D 27            [ 1]  375 	ld (y),a 
      008CCF 04 90            [ 1]  376 	incw y 
      008CD1 CE 00            [ 2]  377 	ldw x,(BINARY+1,sp)
      008CD3 05 FF            [ 2]  378 	ldw (y),x 
      008CD4 72 A9 00 02      [ 2]  379 	addw y,#2  
      008CD4 90 C3            [ 1]  380 	ld a,#TK_INTGR 	
      000E2C                        381 	_drop VSIZE 
      008CD6 00 1E            [ 2]    1     addw sp,#VSIZE 
      008CD8 2A               [ 4]  382 	ret
                                    383 
                                    384 ;-------------------------------------
                                    385 ; check if A is a letter 
                                    386 ; input:
                                    387 ;   A 			character to test 
                                    388 ; output:
                                    389 ;   C flag      1 true, 0 false 
                                    390 ;-------------------------------------
      000E2F                        391 is_alpha::
      008CD9 10 90            [ 1]  392 	cp a,#'A 
      008CDB F3               [ 1]  393 	ccf 
      008CDC 27 0E            [ 1]  394 	jrnc 9$ 
      008CDE 2B 0A            [ 1]  395 	cp a,#'Z+1 
      008CE0 90 E6            [ 1]  396 	jrc 9$ 
      008CE2 02 6B            [ 1]  397 	cp a,#'a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      008CE4 02               [ 1]  398 	ccf 
      008CE5 72 F9            [ 1]  399 	jrnc 9$
      008CE7 01 20            [ 1]  400 	cp a,#'z+1
      008CE9 EA               [ 4]  401 9$: ret 	
                                    402 
                                    403 ;------------------------------------
                                    404 ; check if character in {'0'..'9'}
                                    405 ; input:
                                    406 ;    A  character to test
                                    407 ; output:
                                    408 ;    Carry  0 not digit | 1 digit
                                    409 ;------------------------------------
      008CEA                        410 is_digit::
      008CEA 5F 51            [ 1]  411 	cp a,#'0
      008CEC 5B 02            [ 1]  412 	jrc 1$
      008CEE 51 81            [ 1]  413     cp a,#'9+1
      008CF0 8C               [ 1]  414 	ccf 
      008CF0 52               [ 1]  415 1$:	ccf 
      008CF1 04               [ 4]  416     ret
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
      000E49                        427 is_alnum::
      008CF2 E6 02 6B         [ 4]  428 	call is_digit
      008CF5 02 0F            [ 1]  429 	jrc 1$ 
      008CF7 01 90 93         [ 4]  430 	call is_alpha
      008CFA 72               [ 4]  431 1$:	ret 
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
      000E52                        442 is_symbol_char: 
      008CFB F9 01            [ 1]  443 	cp a,#'_ 
      008CFD 17 03            [ 1]  444 	jrne 1$
      008CFF 90               [ 1]  445 	scf 
      008D00 CE 00            [ 2]  446 	jra 9$ 
      008D02 1E 72 F2         [ 4]  447 1$:	call is_alnum 
      008D05 03               [ 4]  448 9$: ret 
                                    449 
                                    450 ;---------------------------
                                    451 ;  when lexical unit begin 
                                    452 ;  with a letter a symbol 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
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
      000E5D                        462 parse_symbol:
      008D06 90               [ 1]  463 	incw x ; keep space for TK_ID 
      000E5E                        464 symb_loop: 
                                    465 ; symbol are converted to upper case 
      008D07 CF 00 0E         [ 4]  466 	call to_upper  
      008D0A 16               [ 1]  467 	ld (x), a 
      008D0B 03               [ 1]  468 	incw x
      008D0C CD 94 45         [ 4]  469 	ld a,([in.w],y)
      008D0F 90 CE 00 1E      [ 1]  470 	inc in 
      008D13 72 F2 01         [ 4]  471 	call is_symbol_char 
      008D16 90 CF            [ 1]  472 	jrc symb_loop 
      008D18 00               [ 1]  473 	clr (x)
      008D19 1E 90 CF 00      [ 1]  474 	dec in  
      008D1D 31               [ 4]  475 	ret 
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
      000E75                        491 parse_keyword: 
      008D1E 90               [ 2]  492 	pushw x ; preserve *symbol 
      008D1F CF 00 33         [ 4]  493 	call parse_symbol
      008D22 5B 04            [ 2]  494 	ldw x,(XFIRST,sp) 
      008D24 81 02            [ 1]  495 	ld a,(2,x)
      008D25 26 0F            [ 1]  496 	jrne 2$
                                    497 ; one letter variable name 
      008D25 C3 00            [ 1]  498 	ld a,(1,x) 
      008D27 1E 24            [ 1]  499 	sub a,#'A 
      008D29 31 52 06         [ 2]  500 	ldw x,#3 
      008D2C 1F               [ 4]  501 	mul x,a 
      008D2D 03 17 05         [ 2]  502 	addw x,#vars 
      008D30 90 CF            [ 1]  503 	ld a,#TK_VAR 
      008D32 00 0E            [ 2]  504 	jra 4$ 
      000E8E                        505 2$: ; check for keyword, otherwise syntax error.
      000E8E                        506 	_ldx_dict kword_dict ; dictionary entry point
      008D34 90 93 72         [ 2]    1     ldw x,#kword_dict+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      008D37 BB 00            [ 2]  507 	ldw y,(XFIRST,sp) ; name to search for
      008D39 0E 1F            [ 1]  508 	incw y 
      008D3B 01 CE 00         [ 4]  509 	call search_dict
      008D3E 1E               [ 1]  510 	tnz a
      008D3F 72 F0            [ 1]  511 	jrne 4$
                                    512 ; not in dictionary
                                    513 ; compile it as TK_LABEL
      008D41 03 CF            [ 2]  514 	ldw y,(XFIRST,sp)
      008D43 00 0E            [ 1]  515 	ld a,#TK_LABEL 
      008D45 1E 01            [ 1]  516 	ld (y),a 
      008D47 CD 94            [ 1]  517 	incw y
      008D49 45               [ 1]  518 	ldw x,y 
      008D4A CE 00 1E         [ 4]  519 	call strlen
      008D4D 72 FB            [ 1]  520 	cp a,#NAME_MAX_LEN 
      008D4F 05 CF            [ 2]  521 	jrule 22$ 
      008D51 00 1E            [ 1]  522 	ld a,#NAME_MAX_LEN 
      000EAD                        523 22$:	
      008D53 CF               [ 1]  524 	push a 
      000EAE                        525 24$:
      008D54 00 31            [ 1]  526     ld a,(y)
      008D56 CF 00            [ 1]  527 	jreq 3$
      008D58 33 5B            [ 1]  528 	incw y
      008D5A 06 81            [ 1]  529 	dec (1,sp) 
      008D5C 26 F6            [ 1]  530 	jrne 24$
      008D5C 52               [ 1]  531 	clr a 
      008D5D 08 72            [ 1]  532 	ld (y),a 
      008D5F CE 00            [ 1]  533 3$: incw y 
      000EBD                        534 	_drop 1 
      008D61 1A 1F            [ 2]    1     addw sp,#1 
      008D63 05 0F            [ 1]  535 	ld a,#TK_LABEL 
      008D65 07               [ 1]  536 	clrw x 
      008D66 CE 00            [ 2]  537 	jra 5$ 
      000EC4                        538 4$:	
      008D68 1A E6            [ 2]  539 	ldw y,(XFIRST,sp)
      008D6A 02 6B            [ 1]  540 	cp a,#TK_NOT 
      008D6C 08 4F            [ 1]  541 	jrmi 41$
      008D6E 1E 05            [ 1]  542 	ld (y),a 
      008D70 CD 8C            [ 1]  543 	incw y 
      008D72 C5 5D            [ 2]  544 	jra 5$ 
      000ED0                        545 41$:	
      008D74 27 07 1F         [ 2]  546 	cpw x,#let  
      008D77 01 CD            [ 1]  547 	jreq 5$  ; don't compile LET command 
      008D79 8C F0            [ 1]  548 	ld (y),a 
      008D7B 20 02            [ 1]  549 	incw y 
      008D7D 17 01            [ 2]  550 	ldw (y),x
      008D7F A6 03 11 08      [ 2]  551 	addw y,#2  
      000EDF                        552 5$:	_drop VSIZE 
      008D83 27 42            [ 2]    1     addw sp,#VSIZE 
      008D85 CE               [ 4]  553 	ret  	
                                    554 
                                    555 ;------------------------------------
                                    556 ; skip character c in text starting from 'in'
                                    557 ; input:
                                    558 ;	 y 		point to text buffer
                                    559 ;    a 		character to skip
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                    560 ; output:  
                                    561 ;	'in' ajusted to new position
                                    562 ;------------------------------------
                           000001   563 	C = 1 ; local var
      000EE2                        564 skip:
      008D86 00               [ 1]  565 	push a
      008D87 1E 72 FB         [ 4]  566 1$:	ld a,([in.w],y)
      008D8A 07 A3            [ 1]  567 	jreq 2$
      008D8C 16 4A            [ 1]  568 	cp a,(C,sp)
      008D8E 25 0C            [ 1]  569 	jrne 2$
      008D90 72 1C 00 23      [ 1]  570 	inc in
      008D94 AE 95            [ 2]  571 	jra 1$
      000EF2                        572 2$: _drop 1 
      008D96 78 CD            [ 2]    1     addw sp,#1 
      008D98 89               [ 4]  573 	ret
                                    574 	
                                    575 
                                    576 ;------------------------------------
                                    577 ; scan text for next token
                                    578 ; input: 
                                    579 ;	X 		pointer to buffer where 
                                    580 ;	        token id and value are copied 
                                    581 ; use:
                                    582 ;	Y   pointer to text in tib 
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
      000EF5                        598 get_token:: 
      000EF5                        599 	_vars VSIZE
      008D99 DC 20            [ 2]    1     sub sp,#VSIZE 
                                    600 ;	ld a,in 
                                    601 ;	sub a,count
                                    602 ;   jrmi 0$
                                    603 ;	clr a 
                                    604 ;	ret 
      000EF7                        605 0$: 
      008D9B 2B AE 16 68      [ 2]  606 	ldw y,#tib    	
      008D9C A6 20            [ 1]  607 	ld a,#SPACE
      008D9C 1E 01 16         [ 4]  608 	call skip
      008D9F 07 CD 8D 25 1E   [ 1]  609 	mov in.saved,in 
      008DA4 07 CF 00         [ 4]  610 	ld a,([in.w],y)
      008DA7 0E 90            [ 1]  611 	jrne 1$
      008DA9 AE 16            [ 1]  612 	ldw y,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      008DAB B8 1E 01         [ 2]  613 	jp token_exit ; end of line 
      008DAE CD 94 45 1E      [ 1]  614 1$:	inc in 
      008DB2 01 C3 00         [ 4]  615 	call to_upper 
      008DB5 1E 25            [ 1]  616 	ld (TCHAR,sp),a 
                                    617 ; check for quoted string
      000F18                        618 str_tst:  	
      000F18                        619 	_case '"' nbr_tst
      008DB7 0F 1E            [ 1]    1 	ld a,#'"' 
      008DB9 07 72            [ 1]    2 	cp a,(TCHAR,sp) 
      008DBB BB 00            [ 1]    3 	jrne nbr_tst
      008DBD 1E CF            [ 1]  620 	ld a,#TK_QSTR
      008DBF 00               [ 1]  621 	ld (x),a 
      008DC0 1E               [ 1]  622 	incw x 
      008DC1 CF 00 31         [ 4]  623 	call parse_quote
      008DC4 CF 00 33         [ 2]  624 	jp token_exit
      008DC7                        625 nbr_tst:
                                    626 ; check for hexadecimal number 
      008DC7 5B 08            [ 1]  627 	ld a,#'$'
      008DC9 81 01            [ 1]  628 	cp a,(TCHAR,sp) 
      008DCA 27 17            [ 1]  629 	jreq 1$
                                    630 ;check for binary number 
      008DCA 52 02            [ 1]  631 	ld a,#'&
      008DCC 4F 6B            [ 1]  632 	cp a,(TCHAR,sp)
      008DCE 01 0A            [ 1]  633 	jrne 0$
      008DCF A6 84            [ 1]  634 	ld a,#TK_INTGR
      008DCF 91               [ 1]  635 	ld (x),a 
      008DD0 D6               [ 1]  636 	incw x 
      008DD1 01 27 24         [ 4]  637 	call parse_binary ; expect binary integer 
      008DD4 72 5C 00         [ 2]  638 	jp token_exit 
                                    639 ; check for decimal number 	
      008DD7 02 6B            [ 1]  640 0$:	ld a,(TCHAR,sp)
      008DD9 02 A6 5C         [ 4]  641 	call is_digit
      008DDC 11 01            [ 1]  642 	jrnc 3$
      008DDE 26 0A            [ 1]  643 1$:	ld a,#TK_INTGR 
      008DE0 0F               [ 1]  644 	ld (x),a 
      008DE1 01               [ 1]  645 	incw x 
      008DE2 7B 02            [ 1]  646 	ld a,(TCHAR,sp)
      008DE4 AD 1C F7         [ 4]  647 	call parse_integer 
      008DE7 5C 20 E5         [ 2]  648 	jp token_exit 
      008DEA                        649 3$: 
      000F51                        650 	_case '(' bkslsh_tst 
      008DEA 7B 02            [ 1]    1 	ld a,#'(' 
      008DEC A1 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008DEE 27 DD            [ 1]    3 	jrne bkslsh_tst
      008DF0 A1 22            [ 1]  651 	ld a,#TK_LPAREN
      008DF2 27 04 F7         [ 2]  652 	jp token_char   	
      000F5C                        653 bkslsh_tst: ; character token 
      000F5C                        654 	_case '\',rparnt_tst
      008DF5 5C 20            [ 1]    1 	ld a,#'\' 
      008DF7 D7 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DF8 26 16            [ 1]    3 	jrne rparnt_tst
      008DF8 7F 5C            [ 1]  655 	ld a,#TK_CHAR 
      008DFA 90               [ 1]  656 	ld (x),a 
      008DFB 93               [ 1]  657 	incw x 
      008DFC 5F A6 02         [ 4]  658 	ld a,([in.w],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      008DFF 5B               [ 1]  659 	ld (x),a 
      008E00 02               [ 1]  660 	incw x
      008E01 81 93            [ 1]  661 	ldw y,x 	 
      008E02 72 5C 00 01      [ 1]  662 	inc in  
      008E02 89               [ 1]  663 	clrw x 
      008E03 AE               [ 1]  664 	ld xl,a 
      008E04 8E 17            [ 1]  665 	ld a,#TK_CHAR 
      008E06 F1 27 06         [ 2]  666 	jp token_exit 
      000F78                        667 rparnt_tst:		
      000F78                        668 	_case ')' colon_tst 
      008E09 7D 27            [ 1]    1 	ld a,#')' 
      008E0B 09 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008E0D 20 F7            [ 1]    3 	jrne colon_tst
      008E0F 1D 8E            [ 1]  669 	ld a,#TK_RPAREN 
      008E11 17 9F AB         [ 2]  670 	jp token_char
      000F83                        671 colon_tst:
      000F83                        672 	_case ':' comma_tst 
      008E14 07 85            [ 1]    1 	ld a,#':' 
      008E16 81 61            [ 1]    2 	cp a,(TCHAR,sp) 
      008E18 62 74            [ 1]    3 	jrne comma_tst
      008E1A 6E 76            [ 1]  673 	ld a,#TK_COLON 
      008E1C 66 72 00         [ 2]  674 	jp token_char  
      008E1F                        675 comma_tst:
      000F8E                        676 	_case COMMA sharp_tst 
      008E1F 89 4B            [ 1]    1 	ld a,#COMMA 
      008E21 00 4B            [ 1]    2 	cp a,(TCHAR,sp) 
      008E23 0A A1            [ 1]    3 	jrne sharp_tst
      008E25 24 26            [ 1]  677 	ld a,#TK_COMMA
      008E27 04 5B 01         [ 2]  678 	jp token_char
      000F99                        679 sharp_tst:
      000F99                        680 	_case SHARP dash_tst 
      008E2A 4B 10            [ 1]    1 	ld a,#SHARP 
      008E2C F7 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008E2E 91 D6            [ 1]    3 	jrne dash_tst
      008E30 01 72            [ 1]  681 	ld a,#TK_SHARP
      008E32 5C 00 02         [ 2]  682 	jp token_char  	 	 
      000FA4                        683 dash_tst: 	
      000FA4                        684 	_case '-' at_tst 
      008E35 CD 99            [ 1]    1 	ld a,#'-' 
      008E37 6A 6B            [ 1]    2 	cp a,(TCHAR,sp) 
      008E39 02 CD            [ 1]    3 	jrne at_tst
      008E3B 8E C0            [ 1]  685 	ld a,#TK_MINUS  
      008E3D 25 ED A6         [ 2]  686 	jp token_char 
      000FAF                        687 at_tst:
      000FAF                        688 	_case '@' qmark_tst 
      008E40 10 11            [ 1]    1 	ld a,#'@' 
      008E42 01 26            [ 1]    2 	cp a,(TCHAR,sp) 
      008E44 0A 7B            [ 1]    3 	jrne qmark_tst
      008E46 02 A1            [ 1]  689 	ld a,#TK_ARRAY 
      008E48 41 2B 04         [ 2]  690 	jp token_char
      000FBA                        691 qmark_tst:
      000FBA                        692 	_case '?' tick_tst 
      008E4B A1 47            [ 1]    1 	ld a,#'?' 
      008E4D 2B DD            [ 1]    2 	cp a,(TCHAR,sp) 
      008E4F 72 5A            [ 1]    3 	jrne tick_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      008E51 00 02            [ 1]  693 	ld a,#TK_CMD  
      008E53 7F               [ 1]  694 	ld (x),a 
      008E54 1E               [ 1]  695 	incw x 
      008E55 03 90            [ 1]  696 	ldw y,x 
      008E57 AE 17 73         [ 2]  697 	ldw x,#print
      008E5A CD 99            [ 2]  698 	ldw (y),x 
      008E5C 76 16 03 C6      [ 2]  699 	addw y,#2
      008E60 00 0D 90         [ 2]  700 	jp token_exit
      000FD2                        701 tick_tst: ; comment 
      000FD2                        702 	_case TICK plus_tst 
      008E63 F7 90            [ 1]    1 	ld a,#TICK 
      008E65 5C CE            [ 1]    2 	cp a,(TCHAR,sp) 
      008E67 00 0E            [ 1]    3 	jrne plus_tst
      008E69 90 FF            [ 1]  703 	ld a,#TK_CMD
      008E6B 72               [ 1]  704 	ld (x),a 
      008E6C A9               [ 1]  705 	incw x
      008E6D 00 02 A6 84      [ 2]  706 	ldw y,#remark 
      008E71 5B               [ 2]  707 	ldw (x),y 
      008E72 04 81 02         [ 2]  708 	addw x,#2  
      008E74                        709 copy_comment:
      008E74 4B 00 4B 00      [ 2]  710 	ldw y,#tib 
      008E78 4B 00 00 00      [ 2]  711 	addw y,in.w
      008E7A 90 89            [ 2]  712 	pushw y 
      008E7A 91 D6 01         [ 4]  713 	call strcpy
      008E7D 72 5C 00         [ 2]  714 	subw y,(1,sp)
      008E80 02 A1            [ 1]  715 	incw y ; strlen+1 
      008E82 30 27            [ 2]  716 	ldw (1,sp),y 
      008E84 06 A1 31         [ 2]  717 	addw x,(1,sp) 
      000FFB                        718 	_drop 2 
      008E87 27 02            [ 2]    1     addw sp,#2 
      008E89 20               [ 1]  719 	clr a 
      008E8A 0B A0            [ 1]  720 	ldw y,x 
      008E8C 30 46 09         [ 2]  721 	jp token_exit 
      001003                        722 plus_tst:
      001003                        723 	_case '+' star_tst 
      008E8F 03 09            [ 1]    1 	ld a,#'+' 
      008E91 02 09            [ 1]    2 	cp a,(TCHAR,sp) 
      008E93 01 20            [ 1]    3 	jrne star_tst
      008E95 E4 10            [ 1]  724 	ld a,#TK_PLUS  
      008E96 CC 10 A2         [ 2]  725 	jp token_char 
      00100E                        726 star_tst:
      00100E                        727 	_case '*' slash_tst 
      008E96 72 5A            [ 1]    1 	ld a,#'*' 
      008E98 00 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008E9A 90 93            [ 1]    3 	jrne slash_tst
      008E9C 7B 01            [ 1]  728 	ld a,#TK_MULT 
      008E9E 90 F7 90         [ 2]  729 	jp token_char 
      001019                        730 slash_tst: 
      001019                        731 	_case '/' prcnt_tst 
      008EA1 5C 1E            [ 1]    1 	ld a,#'/' 
      008EA3 02 90            [ 1]    2 	cp a,(TCHAR,sp) 
      008EA5 FF 72            [ 1]    3 	jrne prcnt_tst
      008EA7 A9 00            [ 1]  732 	ld a,#TK_DIV 
      008EA9 02 A6 84         [ 2]  733 	jp token_char 
      001024                        734 prcnt_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      001024                        735 	_case '%' eql_tst 
      008EAC 5B 03            [ 1]    1 	ld a,#'%' 
      008EAE 81 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008EAF 26 05            [ 1]    3 	jrne eql_tst
      008EAF A1 41            [ 1]  736 	ld a,#TK_MOD
      008EB1 8C 24 0B         [ 2]  737 	jp token_char  
                                    738 ; 1 or 2 character tokens 	
      00102F                        739 eql_tst:
      00102F                        740 	_case '=' gt_tst 		
      008EB4 A1 5B            [ 1]    1 	ld a,#'=' 
      008EB6 25 07            [ 1]    2 	cp a,(TCHAR,sp) 
      008EB8 A1 61            [ 1]    3 	jrne gt_tst
      008EBA 8C 24            [ 1]  741 	ld a,#TK_EQUAL
      008EBC 02 A1 7B         [ 2]  742 	jp token_char 
      00103A                        743 gt_tst:
      00103A                        744 	_case '>' lt_tst 
      008EBF 81 3E            [ 1]    1 	ld a,#'>' 
      008EC0 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008EC0 A1 30            [ 1]    3 	jrne lt_tst
      008EC2 25 03            [ 1]  745 	ld a,#TK_GT 
      008EC4 A1 3A            [ 1]  746 	ld (ATTRIB,sp),a 
      008EC6 8C 8C 81         [ 4]  747 	ld a,([in.w],y)
      008EC9 72 5C 00 01      [ 1]  748 	inc in 
      008EC9 CD 8E            [ 1]  749 	cp a,#'=
      008ECB C0 25            [ 1]  750 	jrne 1$
      008ECD 03 CD            [ 1]  751 	ld a,#TK_GE 
      008ECF 8E AF            [ 2]  752 	jra token_char  
      008ED1 81 3C            [ 1]  753 1$: cp a,#'<
      008ED2 26 04            [ 1]  754 	jrne 2$
      008ED2 A1 5F            [ 1]  755 	ld a,#TK_NE 
      008ED4 26 03            [ 2]  756 	jra token_char 
      008ED6 99 20 03 CD      [ 1]  757 2$: dec in
      008EDA 8E C9            [ 1]  758 	ld a,(ATTRIB,sp)
      008EDC 81 3F            [ 2]  759 	jra token_char 	 
      008EDD                        760 lt_tst:
      001063                        761 	_case '<' other
      008EDD 5C 3C            [ 1]    1 	ld a,#'<' 
      008EDE 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008EDE CD 99            [ 1]    3 	jrne other
      008EE0 6A F7            [ 1]  762 	ld a,#TK_LT 
      008EE2 5C 91            [ 1]  763 	ld (ATTRIB,sp),a 
      008EE4 D6 01 72         [ 4]  764 	ld a,([in.w],y)
      008EE7 5C 00 02 CD      [ 1]  765 	inc in 
      008EEB 8E D2            [ 1]  766 	cp a,#'=
      008EED 25 EF            [ 1]  767 	jrne 1$
      008EEF 7F 72            [ 1]  768 	ld a,#TK_LE 
      008EF1 5A 00            [ 2]  769 	jra token_char 
      008EF3 02 81            [ 1]  770 1$: cp a,#'>
      008EF5 26 04            [ 1]  771 	jrne 2$
      008EF5 89 CD            [ 1]  772 	ld a,#TK_NE 
      008EF7 8E DD            [ 2]  773 	jra token_char 
      008EF9 1E 01 E6 02      [ 1]  774 2$: dec in 
      008EFD 26 0F            [ 1]  775 	ld a,(ATTRIB,sp)
      008EFF E6 01            [ 2]  776 	jra token_char 	
      00108C                        777 other: ; not a special character 	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      008F01 A0 41            [ 1]  778 	ld a,(TCHAR,sp)
      008F03 AE 00 03         [ 4]  779 	call is_alpha 
      008F06 42 1C            [ 1]  780 	jrc 30$ 
      008F08 00 36 A6         [ 2]  781 	jp syntax_error 
      001096                        782 30$: 
      008F0B 85 20 36         [ 4]  783 	call parse_keyword
      008F0E A3 21 66         [ 2]  784 	cpw x,#remark 
      008F0E AE B7            [ 1]  785 	jrne token_exit 
      008F10 1B               [ 1]  786 	ldw x,y 
      008F11 16 01 90         [ 2]  787 	jp copy_comment 
      0010A2                        788 token_char:
      008F14 5C               [ 1]  789 	ld (x),a 
      008F15 CD               [ 1]  790 	incw x
      008F16 99 F7            [ 1]  791 	ldw y,x 
      0010A6                        792 token_exit:
      0010A6                        793 	_drop VSIZE 
      008F18 4D 26            [ 2]    1     addw sp,#VSIZE 
      008F1A 29               [ 4]  794 	ret
                                    795 
                                    796 
                                    797 ;-----------------------------------
                                    798 ; create token list fromm text line 
                                    799 ; save this list in pad buffer 
                                    800 ;  compiled line format: 
                                    801 ;    line_no  2 bytes {0...32767}
                                    802 ;    count    1 byte  
                                    803 ;    tokens   variable length 
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
      0010A9                        814 compile::
      008F1B 16 01            [ 2]  815 	pushw y 
      0010AB                        816 	_vars VSIZE 
      008F1D A6 03            [ 2]    1     sub sp,#VSIZE 
      008F1F 90 F7 90 5C 93   [ 1]  817 	mov basicptr,txtbgn
      008F24 CD 94 19 A1      [ 1]  818 	bset flags,#FCOMP 
      008F28 0F 23            [ 1]  819 	ld a,#0
      008F2A 02 A6 0F         [ 2]  820 	ldw x,#0
      008F2D CF 16 B8         [ 2]  821 	ldw pad,x ; destination buffer 
      008F2D 88 16 BA         [ 1]  822 	ld pad+2,a ; count 
      008F2E AE 16 BB         [ 2]  823 	ldw x,#pad+3
      008F2E 90 F6 27 09      [ 1]  824 	clr in 
      008F32 90 5C 0A         [ 4]  825 	call get_token
      008F35 01 26            [ 1]  826 	cp a,#TK_INTGR
      008F37 F6 4F            [ 1]  827 	jrne 2$
      008F39 90 F7 90         [ 2]  828 	cpw x,#1 
      008F3C 5C 5B            [ 1]  829 	jrpl 1$
      008F3E 01 A6            [ 1]  830 	ld a,#ERR_BAD_VALUE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      008F40 03 5F 20         [ 2]  831 	jp tb_error
      008F43 1B 16 B8         [ 2]  832 1$:	ldw pad,x ; line# 
      008F44 90 AE 16 BB      [ 2]  833 	ldw y,#pad+3 
      008F44 16 01 A1 87      [ 2]  834 2$:	cpw y,#xstack_full 
      008F48 2B 06            [ 1]  835 	jrult 3$
      008F4A 90 F7            [ 1]  836 	ld a,#ERR_BUF_FULL 
      008F4C 90 5C 20         [ 2]  837 	jp tb_error 
      0010EB                        838 3$:	
      008F4F 0F               [ 1]  839 	ldw x,y 
      008F50 CD 0E F5         [ 4]  840 	call get_token 
      008F50 A3 9D            [ 1]  841 	cp a,#TK_NONE 
      008F52 84 27            [ 1]  842 	jrne 2$ 
                                    843 ; compilation completed  
      008F54 0A 90 F7 90      [ 2]  844 	subw y,#pad ; compiled line length 
      008F58 5C 90            [ 1]  845     ld a,yl
      008F5A FF 72 A9         [ 2]  846 	ldw x,#pad 
      008F5D 00 02 5B         [ 2]  847 	ldw ptr16,x 
      008F60 02 81            [ 1]  848 	ld (2,x),a 
      008F62 FE               [ 2]  849 	ldw x,(x)  ; line# 
      008F62 88 91            [ 1]  850 	jreq 10$
      008F64 D6 01 27         [ 4]  851 	call insert_line
      008F67 0A 11 01 26      [ 1]  852 	clr  count 
      008F6B 06 72            [ 2]  853 	jra  11$ 
      00110D                        854 10$: ; line# is zero 
      008F6D 5C 00 02         [ 2]  855 	ldw x,ptr16  
      008F70 20 F1 5B         [ 2]  856 	ldw basicptr,x 
      008F73 01 81            [ 1]  857 	ld a,(2,x)
      008F75 C7 00 02         [ 1]  858 	ld count,a 
      008F75 52 02 00 01      [ 1]  859 	mov in,#3 
      008F77                        860 11$:
      00111C                        861 	_drop VSIZE 
      008F77 90 AE            [ 2]    1     addw sp,#VSIZE 
      008F79 16 68 A6 20      [ 1]  862 	bres flags,#FCOMP 
      008F7D CD 8F            [ 2]  863 	popw y 
      008F7F 62               [ 4]  864 	ret 
                                    865 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
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
      001125                         48 cpy_cmd_name:
      008F80 55               [ 2]   49 	tnzw x 
      008F81 00 02            [ 1]   50 	jreq 10$
      008F83 00               [ 1]   51 	ld a,(x)
      008F84 04               [ 1]   52 	incw x
      008F85 91 D6            [ 1]   53 	and a,#15  
      008F87 01               [ 1]   54 	push a 
      008F88 26 05            [ 1]   55     tnz (1,sp) 
      008F8A 90 93            [ 1]   56 	jreq 9$
      008F8C CC               [ 1]   57 1$:	ld a,(x)
      008F8D 91 26            [ 1]   58 	ld (y),a  
      008F8F 72               [ 1]   59 	incw x
      008F90 5C 00            [ 1]   60 	incw y 
      008F92 02 CD            [ 1]   61 	dec (1,sp)	 
      008F94 99 6A            [ 1]   62 	jrne 1$
      008F96 6B               [ 1]   63 9$: pop a 
      00113C                         64 10$: 
      008F97 01               [ 4]   65 	ret	
                                     66 
                                     67 ;--------------------------
                                     68 ; add a space after letter or 
                                     69 ; digit.
                                     70 ; input:
                                     71 ;   Y     pointer to buffer 
                                     72 ; output:
                                     73 ;   Y    moved to end 
                                     74 ;--------------------------
      008F98                         75 add_space:
      008F98 A6 22            [ 2]   76 	decw y 
      008F9A 11 01            [ 1]   77 	ld a,(y)
      008F9C 26 0A            [ 1]   78 	incw y
      008F9E A6 02            [ 1]   79 	cp a,#') 
      008FA0 F7 5C            [ 1]   80 	jreq 0$
      008FA2 CD 8D CA         [ 4]   81 	call is_alnum 
      008FA5 CC 91            [ 1]   82 	jrnc 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      00114C                         83 0$: 
      008FA7 26 20            [ 1]   84 	ld a,#SPACE 
      008FA8 90 F7            [ 1]   85 	ld (y),a 
      008FA8 A6 24            [ 1]   86 	incw y 
      008FAA 11               [ 4]   87 1$: ret 
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
      001153                         99 right_align::
      008FAB 01               [ 1]  100 	push a 
      008FAC 27 17            [ 1]  101 0$: ld a,(1,sp)
      008FAE A6 26 11         [ 1]  102 	cp a,tab_width 
      008FB1 01 26            [ 1]  103 	jrpl 1$
      008FB3 0A A6            [ 1]  104 	ld a,#SPACE 
      008FB5 84               [ 2]  105 	decw x
      008FB6 F7               [ 1]  106 	ld (x),a  
      008FB7 5C CD            [ 1]  107 	inc (1,sp)
      008FB9 8E 74            [ 2]  108 	jra 0$ 
      008FBB CC               [ 1]  109 1$: pop a 	
      008FBC 91               [ 4]  110 	ret 
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
      001165                        123 cpy_quote:
      008FBD 26 7B            [ 1]  124 	ld a,#'"
      008FBF 01 CD            [ 1]  125 	ld (y),a 
      008FC1 8E C0            [ 1]  126 	incw y 
      008FC3 24               [ 2]  127 	pushw x 
      008FC4 0C A6 84         [ 4]  128 	call skip_string 
      008FC7 F7               [ 2]  129 	popw x 
      008FC8 5C               [ 1]  130 1$:	ld a,(x)
      008FC9 7B 01            [ 1]  131 	jreq 9$
      008FCB CD               [ 1]  132 	incw x 
      008FCC 8E 1F            [ 1]  133 	cp a,#SPACE 
      008FCE CC 91            [ 1]  134 	jrult 3$
      008FD0 26 F7            [ 1]  135 	ld (y),a
      008FD1 90 5C            [ 1]  136 	incw y 
      008FD1 A6 28            [ 1]  137 	cp a,#'\ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      008FD3 11 01            [ 1]  138 	jrne 1$ 
      001180                        139 2$:
      008FD5 26 05            [ 1]  140 	ld (y),a
      008FD7 A6 06            [ 1]  141 	incw y  
      008FD9 CC 91            [ 2]  142 	jra 1$
      008FDB 22               [ 1]  143 3$: push a 
      008FDC A6 5C            [ 1]  144 	ld a,#'\
      008FDC A6 5C            [ 1]  145 	ld (y),a 
      008FDE 11 01            [ 1]  146 	incw y  
      008FE0 26               [ 1]  147 	pop a 
      008FE1 16 A6            [ 1]  148 	sub a,#7
      008FE3 04 F7 5C         [ 1]  149 	ld acc8,a 
      008FE6 91 D6 01 F7      [ 1]  150 	clr acc16
      008FEA 5C               [ 2]  151 	pushw x
      008FEB 90 93 72         [ 2]  152 	ldw x,#escaped 
      008FEE 5C 00 02 5F      [ 2]  153 	addw x,acc16 
      008FF2 97               [ 1]  154 	ld a,(x)
      008FF3 A6               [ 2]  155 	popw x
      008FF4 04 CC            [ 2]  156 	jra 2$
      008FF6 91 26            [ 1]  157 9$: ld a,#'"
      008FF8 90 F7            [ 1]  158 	ld (y),a 
      008FF8 A6 29            [ 1]  159 	incw y  
      008FFA 11               [ 1]  160 	incw x 
      008FFB 01               [ 4]  161 	ret
                                    162 
                                    163 ;--------------------------
                                    164 ; return variable name 
                                    165 ; from its address.
                                    166 ; input:
                                    167 ;   X    variable address
                                    168 ; output:
                                    169 ;   A     variable letter
                                    170 ;--------------------------
      0011AB                        171 var_name::
      008FFC 26 05 A6         [ 2]  172 		subw x,#vars 
      008FFF 07 CC            [ 1]  173 		ld a,#3
      009001 91               [ 2]  174 		div x,a 
      009002 22               [ 1]  175 		ld a,xl 
      009003 AB 41            [ 1]  176 		add a,#'A 
      009003 A6               [ 4]  177 		ret 
                                    178 
                                    179 
                                    180 
                                    181 ;-------------------------------------
                                    182 ; decompile tokens list 
                                    183 ; to original text line 
                                    184 ; input:
                                    185 ;   [basicptr]  pointer at line 
                                    186 ;   Y           output buffer
                                    187 ; output:
                                    188 ;   A           length 
                                    189 ;   Y           after string  
                                    190 ;------------------------------------
                           000001   191 	BASE_SAV=1
                           000002   192 	WIDTH_SAV=2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



                           000003   193 	STR=3
                           000004   194 	VSIZE=4 
      0011B5                        195 decompile::
      0011B5                        196 	_vars VSIZE
      009004 3A 11            [ 2]    1     sub sp,#VSIZE 
      009006 01 26 05         [ 1]  197 	ld a,base
      009009 A6 0A            [ 1]  198 	ld (BASE_SAV,sp),a  
      00900B CC 91 22         [ 1]  199 	ld a,tab_width 
      00900E 6B 02            [ 1]  200 	ld (WIDTH_SAV,sp),a 
      00900E A6 2C            [ 2]  201 	ldw (STR,sp),y   
      009010 11 01 26 05      [ 5]  202 	ldw x,[basicptr] ; line number 
      009014 A6 08 CC 91      [ 1]  203 	mov base,#10
      009018 22 05 00 23      [ 1]  204 	mov tab_width,#5
      009019 72 5F 00 0C      [ 1]  205 	clr acc24 
      009019 A6 23 11         [ 2]  206 	ldw acc16,x
      00901C 01               [ 1]  207 	clr a ; unsigned conversion 
      00901D 26 05 A6         [ 4]  208 	call itoa  
      009020 09 CC 91         [ 4]  209 	call right_align 
      009023 22               [ 1]  210 	push a 
      009024 90 93            [ 1]  211 1$:	ldw y,x ; source
      009024 A6 2D            [ 2]  212 	ldw x,(STR+1,sp) ; destination
      009026 11 01 26         [ 4]  213 	call strcpy 
      009029 05 A6            [ 1]  214 	clrw y 
      00902B 11               [ 1]  215 	pop a 
      00902C CC 91            [ 1]  216 	ld yl,a 
      00902E 22 F9 03         [ 2]  217 	addw y,(STR,sp)
      00902F A6 20            [ 1]  218 	ld a,#SPACE 
      00902F A6 40            [ 1]  219 	ld (y),a 
      009031 11 01            [ 1]  220 	incw y 
      009033 26 05 A6 05      [ 1]  221 	clr tab_width
      009037 CC 91 22         [ 2]  222 	ldw x,#3
      00903A CF 00 00         [ 2]  223 	ldw in.w,x 
      0011FD                        224 decomp_loop:
      00903A A6 3F            [ 2]  225 	pushw y
      00903C 11 01 26         [ 4]  226 	call next_token 
      00903F 12 A6            [ 2]  227 	popw y 
      009041 80               [ 1]  228 	tnz a  
      009042 F7 5C            [ 1]  229 	jrne 1$
      009044 90 93 AE         [ 2]  230 	jp 20$
      009047 A0 9E            [ 1]  231 1$:	jrmi 2$
      009049 90 FF 72         [ 2]  232 	jp 6$
      00120F                        233 2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR|TK_AND|TK_OR|TK_XOR 
      00904C A9 00            [ 1]  234 	cp a,#TK_VAR 
      00904E 02 CC            [ 1]  235 	jrne 3$
                                    236 ;; TK_VAR 
      009050 91 26 3D         [ 4]  237 	call add_space
      009052 CD 18 34         [ 4]  238 	call get_addr   
      009052 A6 27 11         [ 4]  239 	call var_name
      009055 01 26            [ 1]  240 	ld (y),a 
      009057 2B A6            [ 1]  241 	incw y  
      009059 80 F7            [ 2]  242 	jra decomp_loop
      001222                        243 3$:
      00905B 5C 90            [ 1]  244 	cp a,#TK_INTGR
      00905D AE A1            [ 1]  245 	jrne 4$
                                    246 ;; TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      00905F E6 FF 1C         [ 4]  247 	call get_int24 
      009062 00 02 0C         [ 1]  248 	ld acc24,a 
      009064 CF 00 0D         [ 2]  249 	ldw acc16,x 
      009064 90 AE 16         [ 4]  250 	call add_space
      009067 68 72            [ 2]  251 	pushw y 
      009069 B9 00            [ 1]  252 	ld a,#255 ; signed conversion 
      00906B 01 90 89         [ 4]  253 	call itoa  
      00906E CD 94            [ 2]  254 	ldw y,(1,sp) 
      009070 35               [ 1]  255 	push a 
      009071 72               [ 1]  256 	exgw x,y 
      009072 F2 01 90         [ 4]  257 	call strcpy 
      009075 5C 17            [ 1]  258 	clrw y
      009077 01               [ 1]  259 	pop a  
      009078 72 FB            [ 1]  260 	ld yl,a 
      00907A 01 5B 02         [ 2]  261 	addw y,(1,sp)
      001248                        262 	_drop 2 
      00907D 4F 90            [ 2]    1     addw sp,#2 
      00907F 93 CC            [ 2]  263 	jra decomp_loop
      00124C                        264 4$: ; dictionary keyword
      009081 91 26            [ 1]  265 	cp a,#TK_NOT 
      009083 24 39            [ 1]  266 	jruge 50$ 
      009083 A6               [ 2]  267 	ldw x,(x)
      009084 2B 11 01 26      [ 1]  268 	inc in 
      009088 05 A6 10 CC      [ 1]  269 	inc in 
      00908C 91 22 66         [ 2]  270 	cpw x,#remark 
      00908E 26 23            [ 1]  271 	jrne 5$
      00908E A6 2A 11         [ 2]  272 	ldw x,basicptr 
                                    273 ; copy comment to buffer 
      009091 01 26 05         [ 4]  274 	call add_space
      009094 A6 20            [ 1]  275 	ld a,#''
      009096 CC 91            [ 1]  276 	ld (y),a 
      009098 22 5C            [ 1]  277 	incw y 
      009099                        278 46$:
      009099 A6 2F 11 01      [ 4]  279 	ld a,([in.w],x)
      00909D 26 05 A6 21      [ 1]  280 	inc in  
      0090A1 CC 91            [ 1]  281 	ld (y),a 
      0090A3 22 5C            [ 1]  282 	incw y 
      0090A4 C6 00 01         [ 1]  283 	ld a,in 
      0090A4 A6 25 11         [ 1]  284 	cp a,count 
      0090A7 01 26            [ 1]  285 	jrmi 46$
      0090A9 05 A6 22         [ 2]  286 	jp 20$  
      0090AC CC 91 22         [ 2]  287 5$: cpw x,#let  
      0090AF 26 05            [ 1]  288 	jrne 54$
      0090AF A6 3D 11         [ 2]  289 	jp decomp_loop ; down display LET
      001289                        290 50$:
      0090B2 01               [ 1]  291 	clrw x 
      0090B3 26               [ 1]  292 	ld xl,a 
                                    293 ;	sub a,#TK_NOT  
                                    294 ;	sll a 
                                    295 ;	ld xl,a 
                                    296 ;	addw x,#NOT_IDX
      00128B                        297 54$: ; insert command name 
      0090B4 05 A6 32         [ 4]  298 	call add_space  
      0090B7 CC 91            [ 2]  299 	pushw y
      0090B9 22 13 65         [ 4]  300 	call cmd_name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      0090BA 90 85            [ 2]  301 	popw y 
      0090BA A6 3E 11         [ 4]  302 	call cpy_cmd_name
      0090BD 01 26 23         [ 2]  303 	jp decomp_loop 
      00129B                        304 6$:
                                    305 ; label?
      0090C0 A6 31            [ 1]  306 	cp a,#TK_LABEL 
      0090C2 6B 02            [ 1]  307 	jrne 64$
                                    308 ; copy label string to output buffer   	
      0090C4 91 D6            [ 1]  309 	ld a,#32 
      0090C6 01 72            [ 1]  310 	ld (y),a 
      0090C8 5C 00            [ 1]  311 	incw y 
      0012A5                        312 61$:
      0090CA 02               [ 2]  313 	pushw x 
      0090CB A1 3D 26         [ 4]  314 	call skip_string 
      0090CE 04               [ 2]  315 	popw x 
      0012AA                        316 62$:	
      0090CF A6               [ 1]  317 	ld a,(x)
      0090D0 33 20            [ 1]  318 	jreq 63$ 
      0090D2 4F               [ 1]  319 	incw x  
      0090D3 A1 3C            [ 1]  320 	ld (y),a 
      0090D5 26 04            [ 1]  321 	incw y 
      0090D7 A6 35            [ 2]  322 	jra 62$ 
      0012B4                        323 63$: 
      0090D9 20 47            [ 1]  324 	ld a,#32 
      0090DB 72 5A            [ 1]  325 	ld (y),a 
      0090DD 00 02            [ 1]  326 	incw y 
      0090DF 7B 02 20         [ 2]  327 	jp decomp_loop
      0012BD                        328 64$:
      0090E2 3F 02            [ 1]  329 	cp a,#TK_QSTR 
      0090E3 26 09            [ 1]  330 	jrne 7$
                                    331 ;; TK_QSTR
      0090E3 A6 3C 11         [ 4]  332 	call add_space
      0090E6 01 26 23         [ 4]  333 	call cpy_quote  
      0090E9 A6 34 6B         [ 2]  334 	jp decomp_loop
      0012CA                        335 7$:
      0090EC 02 91            [ 1]  336 	cp a,#TK_CHAR 
      0090EE D6 01            [ 1]  337 	jrne 8$
                                    338 ;; TK_CHAR
      0090F0 72 5C 00         [ 4]  339 	call add_space 
      0090F3 02 A1            [ 1]  340 	ld a,#'\ 
      0090F5 3D 26            [ 1]  341 	ld (y),a 
      0090F7 04 A6            [ 1]  342 	incw y
      0090F9 36               [ 1]  343 	ld a,(x)
      0090FA 20 26 A1 3E      [ 1]  344 	inc in  
      0090FE 26 04            [ 2]  345 	jra 81$
      009100 A6 35            [ 1]  346 8$: cp a,#TK_COLON 
      009102 20 1E            [ 1]  347 	jrne 9$
      009104 72 5A            [ 1]  348 	ld a,#':
      0012E4                        349 81$:
      009106 00 02            [ 1]  350 	ld (y),a 
      009108 7B 02            [ 1]  351 	incw y 
      0012E8                        352 82$:
      00910A 20 16 FD         [ 2]  353 	jp decomp_loop
      00910C                        354 9$: 
      00910C 7B 01            [ 1]  355 	cp a,#TK_SHARP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      00910E CD 8E            [ 1]  356 	jrugt 10$ 
      009110 AF 25            [ 1]  357 	sub a,#TK_ARRAY 
      009112 03               [ 1]  358 	clrw x 
      009113 CC               [ 1]  359 	ld xl,a
      009114 97 25 40         [ 2]  360 	addw x,#single_char 
      009116 F6               [ 1]  361 	ld a,(x)
      009116 CD 8E            [ 2]  362 	jra 81$ 
      0012F9                        363 10$: 
      009118 F5 A3            [ 1]  364 	cp a,#TK_MINUS 
      00911A A1 E6            [ 1]  365 	jrugt 11$
      00911C 26 08            [ 1]  366 	sub a,#TK_PLUS 
      00911E 93               [ 1]  367 	clrw x 
      00911F CC               [ 1]  368 	ld xl,a 
      009120 90 64 45         [ 2]  369 	addw x,#add_char 
      009122 F6               [ 1]  370 	ld a,(x)
      009122 F7 5C            [ 2]  371 	jra 81$
      001307                        372 11$:
      009124 90 93            [ 1]  373     cp a,#TK_MOD 
      009126 22 0A            [ 1]  374 	jrugt 12$
      009126 5B 02            [ 1]  375 	sub a,#TK_MULT
      009128 81               [ 1]  376 	clrw x 
      009129 97               [ 1]  377 	ld xl,a 
      009129 90 89 52         [ 2]  378 	addw x,#mul_char
      00912C 02               [ 1]  379 	ld a,(x)
      00912D 55 00            [ 2]  380 	jra 81$
      001315                        381 12$:
      00912F 1C 00            [ 1]  382 	sub a,#TK_GT  
      009131 05               [ 1]  383 	sll a 
      009132 72               [ 1]  384 	clrw x 
      009133 1A               [ 1]  385 	ld xl,a 
      009134 00 23 A6         [ 2]  386 	addw x,#relop_str 
      009137 00               [ 2]  387 	ldw x,(x)
      009138 AE               [ 1]  388 	ld a,(x)
      009139 00               [ 1]  389 	incw x 
      00913A 00 CF            [ 1]  390 	ld (y),a
      00913C 16 B8            [ 1]  391 	incw y 
      00913E C7               [ 1]  392 	ld a,(x)
      00913F 16 BA            [ 1]  393 	jrne 81$
      009141 AE 16 BB         [ 2]  394 	jp decomp_loop 
      00132A                        395 20$: 
      009144 72 5F            [ 1]  396 	clr (y)
      009146 00 02            [ 2]  397 	ldw x,(STR,sp)
      009148 CD 8F            [ 1]  398 	ld a,(BASE_SAV,sp)
      00914A 75 A1 84         [ 1]  399 	ld base,a 
      00914D 26 11            [ 1]  400 	ld a,(WIDTH_SAV,sp)
      00914F A3 00 01         [ 1]  401 	ld tab_width,a
      009152 2A 05 A6         [ 2]  402 	subw y,(STR,sp) 
      009155 0A CC            [ 1]  403 	ld a,yl 
      00133D                        404 	_drop VSIZE 
      009157 97 27            [ 2]    1     addw sp,#VSIZE 
      009159 CF               [ 4]  405 	ret 
                                    406 
      00915A 16 B8 90 AE 16         407 single_char: .byte '@','(',')',',','#'
      00915F BB 90                  408 add_char: .byte '+','-'
      009161 A3 17 38               409 mul_char: .byte '*','/','%'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      009164 25 05 A6 0F CC 97 27   410 relop_str: .word gt,equal,ge,lt,ne,le 
             5D 13 62 13 5F
      00916B 3E 00                  411 gt: .asciz ">"
      00916B 93 CD                  412 equal: .asciz "="
      00916D 8F 75 A1               413 ge: .asciz ">="
      009170 00 26                  414 lt: .asciz "<"
      009172 ED 72 A2               415 le: .asciz "<="
      009175 16 B8 90               416 ne:  .asciz "<>"
                                    417 
                                    418 ;----------------------------------
                                    419 ; search in kword_dict name
                                    420 ; from its execution address 
                                    421 ; input:
                                    422 ;   X       	routine_address  
                                    423 ; output:
                                    424 ;   X 			cstr*  | 0 
                                    425 ;--------------------------------
                           000001   426 	CODE_ADDR=1 
                           000003   427 	LINK=3 
                           000004   428 	VSIZE=4
      001365                        429 cmd_name:
      001365                        430 	_vars VSIZE 
      009178 9F AE            [ 2]    1     sub sp,#VSIZE 
      00917A 16 B8 CF 00      [ 1]  431 	clr acc16 
      00917E 1A E7            [ 2]  432 	ldw (CODE_ADDR,sp),x  
      009180 02 FE 27         [ 2]  433 	ldw x,#kword_dict	
      009183 09 CD            [ 2]  434 1$:	ldw (LINK,sp),x
      009185 8D 5C            [ 1]  435 	ld a,(2,x)
      009187 72 5F            [ 1]  436 	and a,#15 
      009189 00 03 20         [ 1]  437 	ld acc8,a 
      00918C 0F 00 03         [ 2]  438 	addw x,#3
      00918D 72 BB 00 0D      [ 2]  439 	addw x,acc16
      00918D CE               [ 2]  440 	ldw x,(x) ; code address   
      00918E 00 1A            [ 2]  441 	cpw x,(CODE_ADDR,sp)
      009190 CF 00            [ 1]  442 	jreq 2$
      009192 05 E6            [ 2]  443 	ldw x,(LINK,sp)
      009194 02               [ 2]  444 	ldw x,(x) 
      009195 C7 00 03         [ 2]  445 	subw x,#2  
      009198 35 03            [ 1]  446 	jrne 1$
      00919A 00               [ 1]  447 	clr a 
      00919B 02               [ 1]  448 	clrw x 
      00919C 20 05            [ 2]  449 	jra 9$
      00919C 5B 02            [ 2]  450 2$: ldw x,(LINK,sp)
      00919E 72 1B 00         [ 2]  451 	addw x,#2 	
      001396                        452 9$:	_drop VSIZE
      0091A1 23 90            [ 2]    1     addw sp,#VSIZE 
      0091A3 85               [ 4]  453 	ret
                                    454 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
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
      000000                         65 in.w::  .blkb 1 ; parser position in text line high-byte 
      000001                         66 in::    .blkb 1 ; low byte of in.w 
      000002                         67 count:: .blkb 1 ; current BASIC line length and tib text length  
      000003                         68 in.saved:: .blkb 1 ; set by get_token before parsing next token, used by unget_token
      000004                         69 basicptr::  .blkb 2  ; point to current BASIC line address.
      000006                         70 data_ptr:  .blkw 1  ; point to DATA address
      000008                         71 data_ofs:  .blkb 1  ; index to next data item 
      000009                         72 data_len:  .blkb 1  ; length of data line 
      00000A                         73 base::  .blkb 1 ; nemeric base used to print integer 
      00000B                         74 acc32:: .blkb 1 ; 32 bit accumalator upper-byte 
      00000C                         75 acc24:: .blkb 1 ; 24 bits accumulator upper-byte 
      00000D                         76 acc16:: .blkb 1 ; 16 bits accumulator, acc24 high-byte
      00000E                         77 acc8::  .blkb 1 ;  8 bits accumulator, acc24 low-byte  
      00000F                         78 ticks: .blkb 3 ; milliseconds ticks counter (see Timer4UpdateHandler)
      000012                         79 timer:: .blkw 1 ;  milliseconds count down timer 
      000014                         80 seedx: .blkw 1  ; xorshift 16 seed x  used by RND() function 
      000016                         81 seedy: .blkw 1  ; xorshift 16 seed y  used by RND() funcion
      000018                         82 farptr: .blkb 1 ; 24 bits pointer used by file system, upper-byte
      000019                         83 ptr16::  .blkb 1 ; 16 bits pointer , farptr high-byte 
      00001A                         84 ptr8:   .blkb 1 ; 8 bits pointer, farptr low-byte  
      00001B                         85 txtbgn:: .blkw 1 ; tokenized BASIC text beginning address 
      00001D                         86 txtend:: .blkw 1 ; tokenized BASIC text end address 
      00001F                         87 loop_depth: .blkb 1 ; level of nested loop. Conformity check   
      000020                         88 array_size: .blkw 1 ; array size, free RAM left after BASIC code.  
      000022                         89 flags:: .blkb 1 ; various boolean flags
      000023                         90 tab_width:: .blkb 1 ; print colon width (default 6)
      000024                         91 free_eeprom: .blkw 1 ; start address of free eeprom 
      000026                         92 rx1_queue: .ds RX_QUEUE_SIZE ; UART1 receive circular queue 
      00002E                         93 rx1_head:  .blkb 1 ; rx1_queue head pointer
      00002F                         94 rx1_tail:   .blkb 1 ; rx1_queue tail pointer  
      000030                         95 dvar_bgn:: .blkw 1 ; DIM variables start address 
      000032                         96 dvar_end:: .blkw 1 ; DIM variables end address 
      000034                         97 chain_level: .blkb 1 ; increment for each CHAIN command 
                                     98 ; 24 bits integer variables 
      000035                         99 vars:: .blkb 3*26 ; BASIC variables A-Z,
                                    100 
                                    101 	.area BTXT (ABS)
      00008C                        102 	.org 0x8C  
                                    103 ; keep 'free_ram' as last variable 
                                    104 ; basic code compiled here. 
      00008C                        105 rsign: .blkw 1 ; "TB" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00008E                        106 rsize: .blkw 1 ; code size 	 
      000090                        107 free_ram: ; from here RAM free for BASIC text 
                                    108 
                                    109 	.area CODE 
                                    110 
                                    111 
                                    112 ;-------------------------------------
                                    113 ; retrun string length
                                    114 ; input:
                                    115 ;   X         .asciz  pointer 
                                    116 ; output:
                                    117 ;   X         not affected 
                                    118 ;   A         length 
                                    119 ;-------------------------------------
      001399                        120 strlen::
      0091A4 81               [ 2]  121 	pushw x 
      0091A5 4F               [ 1]  122 	clr a
      0091A5 5D               [ 1]  123 1$:	tnz (x) 
      0091A6 27 14            [ 1]  124 	jreq 9$ 
      0091A8 F6               [ 1]  125 	inc a 
      0091A9 5C               [ 1]  126 	incw x 
      0091AA A4 0F            [ 2]  127 	jra 1$ 
      0091AC 88               [ 2]  128 9$:	popw x 
      0091AD 0D               [ 4]  129 	ret 
                                    130 
                                    131 ;------------------------------------
                                    132 ; compare 2 strings
                                    133 ; input:
                                    134 ;   X 		char* first string 
                                    135 ;   Y       char* second string 
                                    136 ; output:
                                    137 ;   A 		0 not == |1 ==  
                                    138 ;-------------------------------------
      0013A4                        139 strcmp:
      0091AE 01               [ 1]  140 	ld a,(x)
      0091AF 27 0A            [ 1]  141 	jreq 5$ 
      0091B1 F6 90            [ 1]  142 	cp a,(y) 
      0091B3 F7 5C            [ 1]  143 	jrne 4$ 
      0091B5 90               [ 1]  144 	incw x 
      0091B6 5C 0A            [ 1]  145 	incw y 
      0091B8 01 26            [ 2]  146 	jra strcmp 
      0013B0                        147 4$: ; not same  
      0091BA F6               [ 1]  148 	clr a 
      0091BB 84               [ 4]  149 	ret 
      0091BC                        150 5$: ; same 
      0091BC 81 01            [ 1]  151 	ld a,#1 
      0091BD 81               [ 4]  152 	ret 
                                    153 
                                    154 
                                    155 ;---------------------------------------
                                    156 ;  copy src to dest 
                                    157 ; input:
                                    158 ;   X 		dest 
                                    159 ;   Y 		src 
                                    160 ; output: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



                                    161 ;   X 		dest 
                                    162 ;----------------------------------
      0013B5                        163 strcpy::
      0091BD 90               [ 1]  164 	push a 
      0091BE 5A               [ 2]  165 	pushw x 
      0091BF 90 F6            [ 1]  166 1$: ld a,(y)
      0091C1 90 5C            [ 1]  167 	jreq 9$ 
      0091C3 A1               [ 1]  168 	ld (x),a 
      0091C4 29               [ 1]  169 	incw x 
      0091C5 27 05            [ 1]  170 	incw y 
      0091C7 CD 8E            [ 2]  171 	jra 1$ 
      0091C9 C9               [ 1]  172 9$:	clr (x)
      0091CA 24               [ 2]  173 	popw x 
      0091CB 06               [ 1]  174 	pop a 
      0091CC 81               [ 4]  175 	ret 
                                    176 
                                    177 ;---------------------------------------
                                    178 ; move memory block 
                                    179 ; input:
                                    180 ;   X 		destination 
                                    181 ;   Y 	    source 
                                    182 ;   acc16	bytes count 
                                    183 ; output:
                                    184 ;   none 
                                    185 ;--------------------------------------
                           000001   186 	INCR=1 ; incrament high byte 
                           000002   187 	LB=2 ; increment low byte 
                           000002   188 	VSIZE=2
      0013C5                        189 move::
      0091CC A6               [ 1]  190 	push a 
      0013C6                        191 	_vars VSIZE 
      0091CD 20 90            [ 2]    1     sub sp,#VSIZE 
      0091CF F7 90            [ 1]  192 	clr (INCR,sp)
      0091D1 5C 81            [ 1]  193 	clr (LB,sp)
      0091D3 90 89            [ 2]  194 	pushw y 
      0091D3 88 7B            [ 2]  195 	cpw x,(1,sp) ; compare DEST to SRC 
      0091D5 01 C1            [ 2]  196 	popw y 
      0091D7 00 24            [ 1]  197 	jreq move_exit ; x==y 
      0091D9 2A 08            [ 1]  198 	jrmi move_down
      0013D6                        199 move_up: ; start from top address with incr=-1
      0091DB A6 20 5A F7      [ 2]  200 	addw x,acc16
      0091DF 0C 01 20 F1      [ 2]  201 	addw y,acc16
      0091E3 84 81            [ 1]  202 	cpl (INCR,sp)
      0091E5 03 02            [ 1]  203 	cpl (LB,sp)   ; increment = -1 
      0091E5 A6 22            [ 2]  204 	jra move_loop  
      0013E4                        205 move_down: ; start from bottom address with incr=1 
      0091E7 90               [ 2]  206     decw x 
      0091E8 F7 90            [ 2]  207 	decw y
      0091EA 5C 89            [ 1]  208 	inc (LB,sp) ; incr=1 
      0013E9                        209 move_loop:	
      0091EC CD 98 A5         [ 1]  210     ld a, acc16 
      0091EF 85 F6 27         [ 1]  211 	or a, acc8
      0091F2 30 5C            [ 1]  212 	jreq move_exit 
      0091F4 A1 20 25         [ 2]  213 	addw x,(INCR,sp)
      0091F7 0E 90 F7         [ 2]  214 	addw y,(INCR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      0091FA 90 5C            [ 1]  215 	ld a,(y)
      0091FC A1               [ 1]  216 	ld (x),a 
      0091FD 5C               [ 2]  217 	pushw x 
      0091FE 26 F0 0D         [ 2]  218 	ldw x,acc16 
      009200 5A               [ 2]  219 	decw x 
      009200 90 F7 90         [ 2]  220 	ldw acc16,x 
      009203 5C               [ 2]  221 	popw x 
      009204 20 EA            [ 2]  222 	jra move_loop
      001405                        223 move_exit:
      001405                        224 	_drop VSIZE
      009206 88 A6            [ 2]    1     addw sp,#VSIZE 
      009208 5C               [ 1]  225 	pop a 
      009209 90               [ 4]  226 	ret 	
                                    227 
                                    228 ;------------------------------------
                                    229 ;  set all variables to zero 
                                    230 ; input:
                                    231 ;   none 
                                    232 ; output:
                                    233 ;	none
                                    234 ;------------------------------------
      001409                        235 clear_vars:
      00920A F7               [ 2]  236 	pushw x 
      00920B 90               [ 1]  237 	push a  
      00920C 5C 84 A0         [ 2]  238 	ldw x,#vars 
      00920F 07 C7            [ 1]  239 	ld a,#CELL_SIZE*26 
      009211 00               [ 1]  240 1$:	clr (x)
      009212 0F               [ 1]  241 	incw x 
      009213 72               [ 1]  242 	dec a 
      009214 5F 00            [ 1]  243 	jrne 1$
      009216 0E               [ 1]  244 	pop a 
      009217 89               [ 2]  245 	popw x 
      009218 AE               [ 4]  246 	ret 
                                    247 
                                    248 
                                    249 ;-----------------------
                                    250 ;  display system 
                                    251 ;  information 
                                    252 ;-----------------------
                           000002   253 	MAJOR=2
                           000000   254 	MINOR=0 
      009219 8E 17 72 BB 00 0E F6   255 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
             85 20 DD A6 22 90 F7
             90 5C 5C 81 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 32 0A 76 65
             72 73 69 6F 6E 20 00
                                    256 
      00922B                        257 system_information:
      00922B 1D 00 36         [ 2]  258 	ldw x,#software 
      00922E A6 03 62         [ 4]  259 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      009231 9F AB            [ 1]  260 	ld a,#MAJOR 
      009233 41 81 0E         [ 1]  261 	ld acc8,a 
      009235 5F               [ 1]  262 	clrw x 
      009235 52 04 C6         [ 2]  263 	ldw acc24,x
      009238 00 0B 6B 01      [ 1]  264 	clr tab_width  
      00923C C6 00 24 6B      [ 1]  265 	mov base, #10 
      009240 02 17 03         [ 4]  266 	call prt_acc24 
      009243 72 CE            [ 1]  267 	ld a,#'.
      009245 00 05 35         [ 4]  268 	call putc 
      009248 0A 00            [ 1]  269 	ld a,#MINOR 
      00924A 0B 35 05         [ 1]  270 	ld acc8,a 
      00924D 00               [ 1]  271 	clrw x 
      00924E 24 72 5F         [ 2]  272 	ldw acc24,x 
      009251 00 0D CF         [ 4]  273 	call prt_acc24
      009254 00 0E            [ 1]  274 	ld a,#CR 
      009256 4F CD 99         [ 4]  275 	call putc
                                    276 ;call test 
      009259 11               [ 4]  277 	ret
                                    278 
      00148F                        279 warm_init:
      00925A CD 91 D3 88      [ 2]  280 	ldw y,#XSTACK_EMPTY  
      00925E 90 93 1E 04      [ 1]  281 	clr flags 
      009262 CD 94 35 90      [ 1]  282 	clr loop_depth 
      009266 5F 84 90 97      [ 1]  283 	mov tab_width,#TAB_WIDTH 
      00926A 72 F9 03 A6      [ 1]  284 	mov base,#10 
      00926E 20 90 F7         [ 2]  285 	ldw x,#0 
      009271 90 5C 72         [ 2]  286 	ldw basicptr,x 
      009274 5F 00 24         [ 2]  287 	ldw in.w,x 
      009277 AE 00 03 CF      [ 1]  288 	clr count
      00927B 00               [ 4]  289 	ret 
                                    290 
                                    291 ;---------------------------
                                    292 ; reset BASIC text variables 
                                    293 ; and clear variables 
                                    294 ;---------------------------
      0014B1                        295 clear_basic:
      00927C 01               [ 2]  296 	pushw x 
      00927D 72 5F 00 02      [ 1]  297 	clr count
      00927D 90 89 CD 98      [ 1]  298 	clr in  
      009281 8C 90 85         [ 2]  299 	ldw x,#free_ram 
      009284 4D 26 03         [ 2]  300 	ldw txtbgn,x 
      009287 CC 93 AA         [ 2]  301 	ldw txtend,x 
      00928A 2B 03 CC         [ 2]  302 	ldw dvar_bgn,x 
      00928D 93 1B 32         [ 2]  303 	ldw dvar_end,x 
      00928F CD 14 09         [ 4]  304 	call clear_vars 
      00928F A1 85 26 0F      [ 1]  305 	clr chain_level
      009293 CD               [ 2]  306 	popw x
      009294 91               [ 4]  307 	ret 
                                    308 
                                    309 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    310 ;;   Tiny BASIC error messages     ;;
                                    311 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014D2                        312 err_msg:
      009295 BD CD 98 B4 CD 92 2B   313 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             90 F7 90 5C 20
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      0092A1 DB 5B 15 71 15 8B 15   314 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             9C 15 AD
      0092A2 15 B9 15 EC 15 FC 16   315 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             10 16 23
      0092A2 A1 84 26 26 CD 98      316 	.word err_overflow,err_read_only,err_not_program  
                                    317 
      0092A8 BE C7 00 0D CF 00 0E   318 err_mem_full: .asciz "Rejected, memory full\n" 
             CD 91 BD 90 89 A6 FF
             CD 99 11 16 01 88 51
             CD 94
      0092BF 35 90 5F 84 90 97 72   319 err_syntax: .asciz "syntax error\n" 
             F9 01 5B 02 20 B1 00
      0092CC 6D 61 74 68 20 6F 70   320 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      0092CC A1 87 24 39 FE 72 5C   321 err_div0: .asciz "division by 0\n" 
             00 02 72 5C 00 02 A3
             A1
      0092DB E6 26 23 CE 00 05 CD   322 err_no_line: .asciz "invalid line number.\n"
             91 BD A6 27 90 F7 90
             5C 6D 62 65 72 2E 0A
             00
      0092EA 72 75 6E 20 74 69 6D   323 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      0092EA 72 D6 00 01 72 5C 00   324 err_cmd_only: .asciz "command line only usage.\n"
             02 90 F7 90 5C C6 00
             02 C1 00 03 2B EC CC
             93 AA A3 9D 84
      009304 26 05 CC 92 7D 63 61   325 err_duplicate: .asciz "duplicate name.\n"
             74 65 20 6E 61 6D 65
             2E 0A 00
      009309 46 69 6C 65 20 6E 6F   326 err_not_file: .asciz "File not found.\n"
             74 20 66 6F 75 6E 64
             2E 0A 00
      009309 5F 97 64 20 76 61 6C   327 err_bad_value: .asciz "bad value.\n"
             75 65 2E 0A 00
      00930B 46 69 6C 65 20 69 6E   328 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             20 65 78 74 65 6E 64
             65 64 20 6D 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      00930B CD 91 BD 90 89 CD 93   329 err_no_data: .asciz "No data found.\n"
             E5 90 85 CD 91 A5 CC
             92 7D
      00931B 4E 6F 20 70 72 6F 67   330 err_no_prog: .asciz "No program in RAM!\n"
             72 61 6D 20 69 6E 20
             52 41 4D 21 0A 00
      00931B A1 03 26 1E A6 20 90   331 err_no_fspace: .asciz "File system full.\n" 
             F7 90 5C 6D 20 66 75
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



             6C 6C 2E 0A 00
      009325 42 75 66 66 65 72 20   332 err_buf_full: .asciz "Buffer full\n"
             66 75 6C 6C 0A 00
      009325 89 CD 98 A5 85 6C 6F   333 err_overflow: .asciz "overflow\n" 
             77 0A 00
      00932A 63 6F 6E 73 74 61 6E   334 err_read_only: .asciz "constant can't be modified\n"
             74 20 63 61 6E 27 74
             20 62 65 20 6D 6F 64
             69 66 69 65 64 0A 00
      00932A F6 27 07 5C 90 F7 90   335 err_not_program: .asciz "no program at this address\n"
             5C 20 F6 20 61 74 20
             74 68 69 73 20 61 64
             64 72 65 73 73 0A 00
                                    336 
                                    337 ;-------------------------------------
      009334 0A 72 75 6E 20 74 69   338 rt_msg: .asciz "\nrun time error, "
             6D 65 20 65 72 72 6F
             72 2C 20 00
      009334 A6 20 90 F7 90 5C CC   339 comp_msg: .asciz "\ncompile error, "
             92 7D 65 72 72 6F 72
             2C 20 00
      00933D 6C 61 73 74 20 74 6F   340 tk_id: .asciz "last token id: "
             6B 65 6E 20 69 64 3A
             20 00
                                    341 
      0016A5                        342 syntax_error::
      00933D A1 02            [ 1]  343 	ld a,#ERR_SYNTAX 
                                    344 
      0016A7                        345 tb_error::
      00933F 26 09 CD 91 BD   [ 2]  346 	btjt flags,#FCOMP,1$
      009344 CD               [ 1]  347 	push a 
      009345 91 E5 CC         [ 2]  348 	ldw x, #rt_msg 
      009348 92 7D 5C         [ 4]  349 	call puts 
      00934A 84               [ 1]  350 	pop a 
      00934A A1 04 26         [ 2]  351 	ldw x, #err_msg 
      00934D 10 CD 91 BD      [ 1]  352 	clr acc16 
      009351 A6               [ 1]  353 	sll a
      009352 5C 90 F7 90      [ 1]  354 	rlc acc16  
      009356 5C F6 72         [ 1]  355 	ld acc8, a 
      009359 5C 00 02 20      [ 2]  356 	addw x,acc16 
      00935D 06               [ 2]  357 	ldw x,(x)
      00935E A1 0A 26         [ 4]  358 	call puts
      009361 09 A6 3A         [ 2]  359 	ldw x,basicptr 
                           000001   360 .if DEBUG 
      009364 C6 00 02         [ 1]  361 ld a,count 
      009364 90 F7            [ 1]  362 clrw y 
      009366 90 5C            [ 1]  363 rlwa y  
      009368 CD 06 45         [ 4]  364 call hex_dump
      009368 CC 92 7D         [ 2]  365 ldw x,basicptr
                                    366 .endif 
      00936B C6 00 01         [ 1]  367 	ld a,in 
      00936B A1 09 22         [ 4]  368 	call prt_basic_line
      00936E 0A A0 05         [ 2]  369 	ldw x,#tk_id 
      009371 5F 97 1C         [ 4]  370 	call puts 
      009374 93 C0 F6         [ 1]  371 	ld a,in.saved 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      009377 20               [ 1]  372 	clrw x 
      009378 EB               [ 1]  373 	ld xl,a 
      009379 72 BB 00 04      [ 2]  374 	addw x,basicptr 
      009379 A1               [ 1]  375 	ld a,(x)
      00937A 11               [ 1]  376 	clrw x 
      00937B 22               [ 1]  377 	ld xl,a 
      00937C 0A A0 10         [ 4]  378 	call prt_i16
      00937F 5F 97            [ 2]  379 	jra 6$
      0016F8                        380 1$:	
      009381 1C               [ 1]  381 	push a 
      009382 93 C5 F6         [ 2]  382 	ldw x,#comp_msg
      009385 20 DD 5C         [ 4]  383 	call puts 
      009387 84               [ 1]  384 	pop a 
      009387 A1 22 22         [ 2]  385 	ldw x, #err_msg 
      00938A 0A A0 20 5F      [ 1]  386 	clr acc16 
      00938E 97               [ 1]  387 	sll a
      00938F 1C 93 C7 F6      [ 1]  388 	rlc acc16  
      009393 20 CF 0E         [ 1]  389 	ld acc8, a 
      009395 72 BB 00 0D      [ 2]  390 	addw x,acc16 
      009395 A0               [ 2]  391 	ldw x,(x)
      009396 31 48 5F         [ 4]  392 	call puts
      009399 97 1C 93         [ 2]  393 	ldw x,#tib
      00939C CA FE F6         [ 4]  394 	call puts 
      00939F 5C 90            [ 1]  395 	ld a,#CR 
      0093A1 F7 90 5C         [ 4]  396 	call putc
      0093A4 F6 26 BD         [ 2]  397 	ldw x,in.w
      0093A7 CC 92 7D         [ 4]  398 	call spaces
      0093AA A6 5E            [ 1]  399 	ld a,#'^
      0093AA 90 7F 1E         [ 4]  400 	call putc 
      0093AD 03 7B 01         [ 2]  401 6$: ldw x,#STACK_EMPTY 
      0093B0 C7               [ 1]  402     ldw sp,x
                                    403 
      001731                        404 warm_start:
      0093B1 00 0B 7B         [ 4]  405 	call warm_init
                                    406 ;----------------------------
                                    407 ;   BASIC interpreter
                                    408 ;----------------------------
      001734                        409 cmd_line: ; user interface 
      0093B4 02 C7            [ 1]  410 	ld a,#CR 
      0093B6 00 24 72         [ 4]  411 	call putc 
      0093B9 F2 03            [ 1]  412 	ld a,#'> 
      0093BB 90 9F 5B         [ 4]  413 	call putc
      0093BE 04 81 40         [ 4]  414 	call readln
      0093C1 28 29 2C 23      [ 1]  415 	tnz count 
      0093C5 2B 2D            [ 1]  416 	jreq cmd_line
      0093C7 2A 2F 25         [ 4]  417 	call compile
                                    418 ;;;;;;;;;;;;;;;;;;;;;;	
                                    419 ;pushw y 
                                    420 ;ldw x,txtbgn  
                                    421 ;ldw y,txtend
                                    422 ;ldw acc16,x   
                                    423 ;subw y,acc16 
                                    424 ;call hex_dump
                                    425 ;popw y 
                                    426 ;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



                                    427 
                                    428 ; if text begin with a line number
                                    429 ; the compiler set count to zero    
                                    430 ; so code is not interpreted
      0093CA 93 D6 93 D8      [ 1]  431 	tnz count 
      0093CE 93 DA            [ 1]  432 	jreq cmd_line
                                    433 	
                                    434 ; if direct command 
                                    435 ; it's ready to interpret 
                                    436 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    437 ;; This is the interpreter loop
                                    438 ;; for each BASIC code line. 
                                    439 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      001750                        440 interpreter: 
      0093D0 93 DD 93         [ 1]  441 	ld a,in 
      0093D3 E2 93 DF         [ 1]  442 	cp a,count 
      0093D6 3E 00            [ 1]  443 	jrmi interp_loop
      001758                        444 next_line:
      0093D8 3D 00 3E 3D 00   [ 2]  445 	btjf flags, #FRUN, cmd_line
      0093DD 3C 00 3C         [ 2]  446 	ldw x,basicptr
      0093E0 3D 00 3C 3E      [ 2]  447 	addw x,in.w 
      0093E4 00 00 1D         [ 2]  448 	cpw x,txtend 
      0093E5 2B 03            [ 1]  449 	jrmi 0$
      0093E5 52 04 72         [ 4]  450 	call cmd_end 
      0093E8 5F 00 0E         [ 2]  451 0$:	ldw basicptr,x ; start of next line  
      0093EB 1F 01            [ 1]  452 	ld a,(2,x)
      0093ED AE B7 19         [ 1]  453 	ld count,a 
      0093F0 1F 03 E6 02      [ 1]  454 	mov in,#3 ; skip first 3 bytes of line 
      001778                        455 interp_loop:
      0093F4 A4 0F C7         [ 4]  456 	call next_token
      0093F7 00 0F            [ 1]  457 	cp a,#TK_NONE 
      0093F9 1C 00            [ 1]  458 	jreq next_line 
      0093FB 03 72            [ 1]  459 	cp a,#TK_CMD
      0093FD BB 00            [ 1]  460 	jrne 1$
      001783                        461 	_get_code_addr
      0093FF 0E               [ 2]    1         ldw x,(x)
      009400 FE 13 01 27      [ 1]    2         inc in 
      009404 0C 1E 03 FE      [ 1]    3         inc in 
      009408 1D               [ 4]  462 	call(x)
      009409 00 02            [ 2]  463 	jra interp_loop 
      00178F                        464 1$:	 
      00940B 26 E3            [ 1]  465 	cp a,#TK_VAR
      00940D 4F 5F            [ 1]  466 	jrne 2$
      00940F 20 05 1E         [ 4]  467 	call let_var  
      009412 03 1C            [ 2]  468 	jra interp_loop 
      001798                        469 2$:	
      009414 00 02            [ 1]  470 	cp a,#TK_ARRAY 
      009416 5B 04            [ 1]  471 	jrne 3$
      009418 81 1D 12         [ 4]  472 	call let_array 
      000001 20 D7            [ 2]  473 	jra interp_loop
      000002                        474 3$:	
      000003 A1 03            [ 1]  475 	cp a,#TK_LABEL
      000004 26 05            [ 1]  476 	jrne 4$
      000005 CD 17 B1         [ 4]  477 	call let_dvar  
      000007 20 CE            [ 2]  478 	jra interp_loop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      000009                        479 4$: 
      00000A A1 0A            [ 1]  480 	cp a,#TK_COLON 
      00000B 27 CA            [ 1]  481 	jreq interp_loop
      00000C CC 16 A5         [ 2]  482 5$:	jp syntax_error 
                                    483 
                                    484 
                                    485 ;----------------------
                                    486 ; when a label is met 
                                    487 ; at interp_loop
                                    488 ; it may be a variable 
                                    489 ; assignement to DIM 
                                    490 ; variable 
                                    491 ;----------------------
                           000001   492 	VAR_NAME=1 
                           000003   493 	REC_LEN=3
                           000004   494 	VSIZE=4 
      00000D                        495 let_dvar:
      00000E                        496 	_vars VSIZE 
      00000F 52 04            [ 2]    1     sub sp,#VSIZE 
      000010 1F 01            [ 2]  497 	ldw (VAR_NAME,sp),x
      000013 0F 03            [ 1]  498 	clr (REC_LEN,sp) 
      000015 CD 18 25         [ 4]  499 	call skip_string 
      000017 CE 00 04         [ 2]  500 	ldw x,basicptr 
      000019 72 BB 00 00      [ 2]  501 	addw x,in.w 
      00001A F6               [ 1]  502 	ld a,(x)
      00001B A1 32            [ 1]  503 	cp a,#TK_EQUAL 
      00001C 26 43            [ 1]  504 	jrne 9$ 
                                    505 ; dvar assignment 
      00001E 72 5C 00 01      [ 1]  506 	inc in  
      000020 CD 1C 45         [ 4]  507 	call condition  
      000021 A1 84            [ 1]  508 	cp a,#TK_INTGR 
      000023 27 03            [ 1]  509 	jreq 1$ 
      000024 CC 16 A5         [ 2]  510 0$:	jp syntax_error 
      000025                        511 1$: 
      000027 1E 01            [ 2]  512 	ldw x,(VAR_NAME,sp) ; pointer to var name 
      00002F CD 13 99         [ 4]  513 	call strlen 
      000030 AB 05            [ 1]  514 	add a,#REC_XTRA_BYTES
      000031 6B 04            [ 1]  515 	ld (REC_LEN+1,sp),a 
      000033 CD 1D 81         [ 4]  516 	call search_name 
      000035 5D               [ 2]  517 	tnzw x 
      000036 27 EE            [ 1]  518 	jreq 0$ 
      00008C F6               [ 1]  519 	ld a,(x)
      00008C 2A 05            [ 1]  520 	jrpl 2$
      00008E A6 11            [ 1]  521 	ld a,#ERR_RD_ONLY 
      000090 CC 16 A7         [ 2]  522 	jp tb_error 
      009419                        523 2$:
      009419 89 4F 7D         [ 2]  524 	addw x,(REC_LEN,sp)
      00941C 27 04 4C         [ 2]  525 	subw x,#CELL_SIZE 
      00941F 5C 20 F9         [ 2]  526 	ldw ptr16,x
      0017F4                        527 	_xpop 
      009422 85 81            [ 1]    1     ld a,(y)
      009424 93               [ 1]    2     ldw x,y 
      009424 F6 27            [ 2]    3     ldw x,(1,x)
      009426 0B 90 F1 26      [ 2]    4     addw y,#CELL_SIZE 
      00942A 05 5C 90 5C      [ 4]  528 	ld [ptr16],a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00942E 20 F4 00 1A      [ 1]  529 	inc ptr8 
      009430 72 CF 00 19      [ 5]  530 	ldw [ptr16],x 
      001809                        531 9$: _drop VSIZE 	
      009430 4F 81            [ 2]    1     addw sp,#VSIZE 
      009432 81               [ 4]  532 	ret 
                                    533 
                                    534 
                                    535 ;--------------------------
                                    536 ; extract next token from
                                    537 ; token list 
                                    538 ; basicptr -> base address 
                                    539 ; in  -> offset in list array 
                                    540 ; output:
                                    541 ;   A 		token attribute
                                    542 ;   X 		*token_value 
                                    543 ;----------------------------------------
      00180C                        544 next_token::
                                    545 ;	clrw x 
      009432 A6 01 81         [ 1]  546 	ld a,in 
      009435 C7 00 03         [ 1]  547 	ld in.saved,a ; in case "_unget_token" needed 
                                    548 ; don't replace sub by "cp a,count" 
                                    549 ; if end of line must return with A=0   	
      009435 88 89 90         [ 1]  550 	sub a,count 
      009438 F6 27            [ 1]  551 	jreq 9$ ; end of line 
      001817                        552 0$: 
      00943A 06 F7 5C         [ 2]  553 	ldw x,basicptr 
      00943D 90 5C 20 F6      [ 2]  554 	addw x,in.w 
      009441 7F               [ 1]  555 	ld a,(x)
      009442 85               [ 1]  556 	incw x
      009443 84 81 00 01      [ 1]  557 	inc in   
      009445 81               [ 4]  558 9$: ret 
                                    559 
                                    560 ;-------------------------
                                    561 ;  skip .asciz in BASIC line 
                                    562 ;  name 
                                    563 ;  input:
                                    564 ;     x		* string 
                                    565 ;  output:
                                    566 ;     none 
                                    567 ;-------------------------
      001825                        568 skip_string:
      009445 88               [ 1]  569 	ld a,(x)
      009446 52 02            [ 1]  570 	jreq 1$
      009448 0F               [ 1]  571 	incw x 
      009449 01 0F            [ 2]  572 	jra skip_string 
      00944B 02               [ 1]  573 1$: incw x 	
      00944C 90 89 13 01      [ 2]  574 	subw x,basicptr 
      009450 90 85 27         [ 2]  575 	ldw in.w,x 
      009453 31               [ 4]  576 	ret 
                                    577 
                                    578 ;---------------------
                                    579 ; extract 16 bits  
                                    580 ; address from BASIC
                                    581 ; code 
                                    582 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



                                    583 ;    X    *address
                                    584 ; output:
                                    585 ;    X    address 
                                    586 ;-------------------- 
      001834                        587 get_addr:
      009454 2B               [ 2]  588 	ldw x,(x)
      009455 0E 5C 00 01      [ 1]  589 	inc in 
      009456 72 5C 00 01      [ 1]  590 	inc in 
      009456 72               [ 4]  591 	ret 
                                    592 
                                    593 ;--------------------
                                    594 ; extract int24_t  
                                    595 ; value from BASIC 
                                    596 ; code 
                                    597 ; input:
                                    598 ;    X   *integer 
                                    599 ; output:
                                    600 ;    A:X   int24  
                                    601 ;--------------------
      00183E                        602 get_int24:
      009457 BB               [ 1]  603 	ld a,(x)
      009458 00 0E            [ 2]  604 	ldw x,(1,x)
                                    605 ; skip 3 bytes 
      00945A 72 B9 00 0E      [ 1]  606 	inc in 
      00945E 03 01 03 02      [ 1]  607 	inc in 
      009462 20 05 00 01      [ 1]  608 	inc in 
      009464 81               [ 4]  609 	ret 
                                    610 
                                    611 ;-------------------------
                                    612 ; get character from 
                                    613 ; BASIC code 
                                    614 ; input:
                                    615 ;    X   *char 
                                    616 ; output:
                                    617 ;    A    char 
                                    618 ;-------------------------
      00184E                        619 get_char:
      009464 5A               [ 1]  620 	ld a,(x)
      009465 90 5A 0C 02      [ 1]  621 	inc in  
      009469 81               [ 4]  622     ret 
                                    623 
                                    624 ;-----------------------------------
                                    625 ; print a 16 bit integer 
                                    626 ; using variable 'base' as conversion
                                    627 ; format.
                                    628 ; input:
                                    629 ;    X       integer to print 
                                    630 ;   'base'    conversion base 
                                    631 ; output:
                                    632 ;   terminal  
                                    633 ;-----------------------------------
      001854                        634 prt_i16:
      009469 C6 00 0E CA      [ 1]  635 	clr acc24 
      00946D 00 0F 27         [ 2]  636 	ldw acc16,x 
      009470 14 72            [ 1]  637 	ld a,#16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      009472 FB 01 72         [ 1]  638 	cp a,base
      009475 F9 01            [ 1]  639 	jreq prt_acc24  
      009477 90 F6 F7 89 CE   [ 2]  640 	btjf acc16,#7,prt_acc24
      00947C 00 0E 5A CF      [ 1]  641 	cpl acc24 ; sign extend 
                                    642 	
                                    643 ;------------------------------------
                                    644 ; print integer in acc24 
                                    645 ; input:
                                    646 ;	acc24 		integer to print 
                                    647 ;	'base' 		numerical base for conversion 
                                    648 ;   'tab_width' field width 
                                    649 ;    A 			signed||unsigned conversion
                                    650 ;  output:
                                    651 ;    A          string length
                                    652 ;------------------------------------
      00186B                        653 prt_acc24:
      009480 00 0E            [ 1]  654 	ld a,#255  ; signed conversion  
      009482 85 20 E4         [ 4]  655     call itoa  ; conversion entier en  .asciz
      009485 CD 11 53         [ 4]  656 	call right_align  
      009485 5B               [ 1]  657 	push a 
      009486 02 84 81         [ 4]  658 	call puts
      009489 84               [ 1]  659 	pop a 
      009489 89               [ 4]  660     ret	
                                    661 
                                    662 ;---------------------------------------
                                    663 ;  print value at xstack top 
                                    664 ;---------------------------------------
      001879                        665 print_top: 
      001879                        666 	_xpop 
      00948A 88 AE            [ 1]    1     ld a,(y)
      00948C 00               [ 1]    2     ldw x,y 
      00948D 36 A6            [ 2]    3     ldw x,(1,x)
      00948F 4E 7F 5C 4A      [ 2]    4     addw y,#CELL_SIZE 
      009493 26 FB 84         [ 1]  667 	ld acc24,a 
      009496 85 81 0A         [ 2]  668 	ldw acc16,x 
      009499 0A 54 69         [ 4]  669 	call prt_acc24 
      00949C 6E 79            [ 1]  670 	ld a,#SPACE
      00949E 20 42 41         [ 4]  671 	call putc 
      0094A1 53               [ 4]  672 	ret 
                                    673 
                                    674 ;------------------------------------
                                    675 ; convert integer in acc24 to string
                                    676 ; input:
                                    677 ;   'base'	conversion base 
                                    678 ;	acc24	integer to convert
                                    679 ;   A       0=unsigned, else signed 
                                    680 ; output:
                                    681 ;   X  		pointer to first char of string
                                    682 ;   A       string length
                                    683 ;------------------------------------
                           000001   684 	SIGN=1  ; integer sign 
                           000002   685 	LEN=2 
                           000003   686 	PSTR=3
                           000004   687 	VSIZE=4 ;locals size
      001891                        688 itoa::
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      001891                        689 	_vars VSIZE
      0094A2 49 43            [ 2]    1     sub sp,#VSIZE 
      0094A4 20 66            [ 1]  690 	clr (LEN,sp) ; string length  
      0094A6 6F 72            [ 1]  691 	clr (SIGN,sp)    ; sign
      0094A8 20               [ 1]  692 	tnz A
      0094A9 53 54            [ 1]  693 	jreq 1$ ; unsigned conversion  
      0094AB 4D 38 0A         [ 1]  694 	ld a,base 
      0094AE 43 6F            [ 1]  695 	cp a,#10
      0094B0 70 79            [ 1]  696 	jrne 1$
                                    697 	; base 10 string display with negative sign if bit 23==1
      0094B2 72 69 67 68 74   [ 2]  698 	btjf acc24,#7,1$
      0094B7 2C 20            [ 1]  699 	cpl (SIGN,sp)
      0094B9 4A 61 63         [ 4]  700 	call neg_acc24
      0018AB                        701 1$:
                                    702 ; initialize string pointer 
      0094BC 71 75 65         [ 2]  703 	ldw x,#tib 
      0094BF 73 20 44         [ 2]  704 	addw x,#TIB_SIZE
      0094C2 65               [ 2]  705 	decw x 
      0094C3 73               [ 1]  706 	clr (x)
      0018B3                        707 itoa_loop:
      0094C4 63 68 65         [ 1]  708     ld a,base
      0094C7 6E 65 73         [ 4]  709     call divu24_8 ; acc24/A 
      0094CA 20 32            [ 1]  710     add a,#'0  ; remainder of division
      0094CC 30 31            [ 1]  711     cp a,#'9+1
      0094CE 39 2C            [ 1]  712     jrmi 2$
      0094D0 32 30            [ 1]  713     add a,#7 
      0018C1                        714 2$:	
      0094D2 32               [ 2]  715 	decw x
      0094D3 32               [ 1]  716     ld (x),a
      0094D4 0A 76            [ 1]  717 	inc (LEN,sp)
                                    718 	; if acc24==0 conversion done
      0094D6 65 72 73         [ 1]  719 	ld a,acc24
      0094D9 69 6F 6E         [ 1]  720 	or a,acc16
      0094DC 20 00 0E         [ 1]  721 	or a,acc8
      0094DE 26 E3            [ 1]  722     jrne itoa_loop
                                    723 	;conversion done, next add '$' or '-' as required
      0094DE AE 94 98         [ 1]  724 	ld a,base 
      0094E1 CD 89            [ 1]  725 	cp a,#16
      0094E3 DC A6            [ 1]  726 	jreq 8$
      0094E5 02 C7            [ 1]  727 	ld a,(SIGN,sp)
      0094E7 00 0F            [ 1]  728     jreq 10$
      0094E9 5F CF            [ 1]  729     ld a,#'-
      0094EB 00 0D            [ 2]  730 	jra 9$ 
      0018DF                        731 8$:	
      0094ED 72 5F            [ 1]  732 	ld a,#'$ 
      0094EF 00               [ 2]  733 9$: decw x
      0094F0 24               [ 1]  734     ld (x),a
      0094F1 35 0A            [ 1]  735 	inc (LEN,sp)
      0018E5                        736 10$:
      0094F3 00 0B            [ 1]  737 	ld a,(LEN,sp)
      0018E7                        738 	_drop VSIZE
      0094F5 CD 98            [ 2]    1     addw sp,#VSIZE 
      0094F7 EB               [ 4]  739 	ret
                                    740 
                                    741 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



                                    742 ; convert alpha to uppercase
                                    743 ; input:
                                    744 ;    a  character to convert
                                    745 ; output:
                                    746 ;    a  uppercase character
                                    747 ;------------------------------------
      0018EA                        748 to_upper::
      0094F8 A6 2E            [ 1]  749 	cp a,#'a
      0094FA CD 89            [ 1]  750 	jrpl 1$
      0094FC 7F               [ 4]  751 0$:	ret
      0094FD A6 00            [ 1]  752 1$: cp a,#'z	
      0094FF C7 00            [ 1]  753 	jrugt 0$
      009501 0F 5F            [ 1]  754 	sub a,#32
      009503 CF               [ 4]  755 	ret
                                    756 	
                                    757 ;------------------------------------
                                    758 ; convert pad content in integer
                                    759 ; input:
                                    760 ;    x		* .asciz to convert
                                    761 ; output:
                                    762 ;    A:X        int24_t 
                                    763 ;    acc24      int24_t
                                    764 ;------------------------------------
                                    765 	; local variables
                           000001   766 	SIGN=1 ; 1 byte, 
                           000002   767 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003   768 	TEMP=3 ; 1 byte, temporary storage
                           000004   769 	XTEMP=4 ; 2 bytes, preserve X 
                           000005   770 	VSIZE=5 ; 5 bytes reserved for local storage
      0018F6                        771 atoi24::
      0018F6                        772 	_vars VSIZE
      009504 00 0D            [ 2]    1     sub sp,#VSIZE 
      009506 CD 98            [ 2]  773 	ldw (XTEMP,sp),x 
                                    774 ; conversion made on xstack 
      009508 EB               [ 1]  775 	clr a 
      009509 A6               [ 1]  776 	clrw x 
      0018FC                        777 	_xpush 
      00950A 0D CD 89 7F      [ 2]    1     subw y,#CELL_SIZE
      00950E 81 F7            [ 1]    2     ld (y),a 
      00950F 90 EF 01         [ 2]    3     ldw (1,y),x 
      00950F 90 AE            [ 1]  778 	clr (SIGN,sp)
      009511 17 73            [ 1]  779 	ld a,#10
      009513 72 5F            [ 1]  780 	ld (BASE,sp),a ; default base decimal
      009515 00 23            [ 2]  781 	ldw x,(XTEMP,sp)
      009517 72               [ 1]  782 	ld a,(x)
      009518 5F 00            [ 1]  783 	jreq 9$  ; completed if 0
      00951A 20 35            [ 1]  784 	cp a,#'-
      00951C 04 00            [ 1]  785 	jrne 1$
      00951E 24 35            [ 1]  786 	cpl (SIGN,sp)
      009520 0A 00            [ 2]  787 	jra 2$
      009522 0B AE            [ 1]  788 1$: cp a,#'$
      009524 00 00            [ 1]  789 	jrne 3$
      009526 CF 00            [ 1]  790 	ld a,#16
      009528 05 CF            [ 1]  791 	ld (BASE,sp),a
      00952A 00               [ 1]  792 2$:	incw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      00952B 01 72            [ 2]  793 	ldw (XTEMP,sp),x 
      00952D 5F               [ 1]  794 	ld a,(x)
      001924                        795 3$:	; char to digit 
      00952E 00 03            [ 1]  796 	cp a,#'a
      009530 81 02            [ 1]  797 	jrmi 4$
      009531 A0 20            [ 1]  798 	sub a,#32
      009531 89 72            [ 1]  799 4$:	cp a,#'0
      009533 5F 00            [ 1]  800 	jrmi 9$
      009535 03 72            [ 1]  801 	sub a,#'0
      009537 5F 00            [ 1]  802 	cp a,#10
      009539 02 AE            [ 1]  803 	jrmi 5$
      00953B 00 90            [ 1]  804 	sub a,#7
      00953D CF 00            [ 1]  805 	cp a,(BASE,sp)
      00953F 1C CF            [ 1]  806 	jrpl 9$
      009541 00 1E            [ 1]  807 5$:	ld (TEMP,sp),a
      009543 CF 00            [ 1]  808 	ld a,(BASE,sp)
      009545 31 CF 00         [ 4]  809 	call mulu24_8
      001941                        810 	_xpush 
      009548 33 CD 94 89      [ 2]    1     subw y,#CELL_SIZE
      00954C 72 5F            [ 1]    2     ld (y),a 
      00954E 00 35 85         [ 2]    3     ldw (1,y),x 
      009551 81               [ 1]  811 	clrw x 
      009552 7B 03            [ 1]  812 	ld a,(TEMP,sp)
      009552 00               [ 1]  813 	rlwa x 
      00194E                        814 	_xpush 
      009553 00 95 78 95      [ 2]    1     subw y,#CELL_SIZE
      009557 8F 95            [ 1]    2     ld (y),a 
      009559 9D 95 B6         [ 2]    3     ldw (1,y),x 
      00955C 95 C5 95         [ 4]  815 	call add24 
      00955F DB 95            [ 2]  816 	ldw x,(XTEMP,sp)
      009561 F1 96            [ 2]  817 	jra 2$
      009563 0B 96            [ 1]  818 9$:	tnz (SIGN,sp)
      009565 1C 96            [ 1]  819     jreq atoi_exit
      009567 2D 96 39         [ 4]  820     call neg24
      001965                        821 atoi_exit:
      001965                        822 	_xpop 
      00956A 96 6C            [ 1]    1     ld a,(y)
      00956C 96               [ 1]    2     ldw x,y 
      00956D 7C 96            [ 2]    3     ldw x,(1,x)
      00956F 90 96 A3 96      [ 2]    4     addw y,#CELL_SIZE 
      009573 B0 96 BA         [ 1]  823 	ld acc24,a 
      009576 96 D6 52         [ 2]  824 	ldw acc16,x  
      001974                        825 	_drop VSIZE
      009579 65 6A            [ 2]    1     addw sp,#VSIZE 
      00957B 65               [ 4]  826 	ret
                                    827 
                                    828 
                                    829 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    830 ;;   TINY BASIC  operators,
                                    831 ;;   commands and functions 
                                    832 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    833 
                                    834 ;---------------------------------
                                    835 ; dictionary search 
                                    836 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



                                    837 ;	X 		dictionary entry point, name field  
                                    838 ;   y		.asciz name to search 
                                    839 ; output:
                                    840 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                    841 ;  X		routine address|TK_OP 
                                    842 ;---------------------------------
                           000001   843 	NLEN=1 ; cmd length 
                           000002   844 	XSAVE=2
                           000004   845 	YSAVE=4
                           000005   846 	VSIZE=5 
      001977                        847 search_dict::
      001977                        848 	_vars VSIZE 
      00957C 63 74            [ 2]    1     sub sp,#VSIZE 
      00957E 65 64            [ 2]  849 	ldw (YSAVE,sp),y 
      00197B                        850 search_next:
      009580 2C 20            [ 2]  851 	ldw (XSAVE,sp),x 
                                    852 ; get name length in dictionary	
      009582 6D               [ 1]  853 	ld a,(x)
      009583 65 6D            [ 1]  854 	and a,#0xf 
      009585 6F 72            [ 1]  855 	ld (NLEN,sp),a  
      009587 79 20            [ 2]  856 	ldw y,(YSAVE,sp) ; name pointer 
      009589 66               [ 1]  857 	incw x 
      001985                        858 cp_loop:
      00958A 75 6C            [ 1]  859 	ld a,(y)
      00958C 6C 0A            [ 1]  860 	jreq str_match 
      00958E 00 73            [ 1]  861 	tnz (NLEN,sp)
      009590 79 6E            [ 1]  862 	jreq no_match  
      009592 74               [ 1]  863 	cp a,(x)
      009593 61 78            [ 1]  864 	jrne no_match 
      009595 20 65            [ 1]  865 	incw y 
      009597 72               [ 1]  866 	incw x
      009598 72 6F            [ 1]  867 	dec (NLEN,sp)
      00959A 72 0A            [ 2]  868 	jra cp_loop 
      001997                        869 no_match:
      00959C 00 6D            [ 2]  870 	ldw x,(XSAVE,sp) 
      00959E 61 74 68         [ 2]  871 	subw x,#2 ; move X to link field
      0095A1 20 6F            [ 1]  872 	push #TK_NONE 
      0095A3 70               [ 2]  873 	ldw x,(x) ; next word link 
      0095A4 65               [ 1]  874 	pop a ; TK_NONE 
      0095A5 72 61            [ 1]  875 	jreq search_exit  ; not found  
                                    876 ;try next 
      0095A7 74 69            [ 2]  877 	jra search_next
      0019A4                        878 str_match:
      0095A9 6F 6E            [ 2]  879 	ldw x,(XSAVE,sp)
      0095AB 20               [ 1]  880 	ld a,(X)
      0095AC 6F 76            [ 1]  881 	ld (NLEN,sp),a ; needed to test keyword type  
      0095AE 65 72            [ 1]  882 	and a,#NLEN_MASK 
                                    883 ; move x to procedure address field 	
      0095B0 66               [ 1]  884 	inc a 
      0095B1 6C 6F 77         [ 1]  885 	ld acc8,a 
      0095B4 0A 00 64 69      [ 1]  886 	clr acc16 
      0095B8 76 69 73 69      [ 2]  887 	addw x,acc16 
      0095BC 6F               [ 2]  888 	ldw x,(x) ; routine address  
                                    889 ;determine keyword type bits 7:4 
      0095BD 6E 20            [ 1]  890 	ld a,(NLEN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      0095BF 62 79            [ 1]  891 	and a,#KW_TYPE_MASK 
      0095C1 20               [ 1]  892 	swap a 
      0095C2 30 0A            [ 1]  893 	add a,#128
      0019BF                        894 search_exit: 
      0019BF                        895 	_drop VSIZE 
      0095C4 00 69            [ 2]    1     addw sp,#VSIZE 
      0095C6 6E               [ 4]  896 	ret 
                                    897 
                                    898 ;--------------------------------
                                    899 ;  called by command that should 
                                    900 ;  be invoked only from command 
                                    901 ;  line.
                                    902 ;  Display an error if 
                                    903 ;  invoked from program.
                                    904 ;---------------------------------
      0019C2                        905 cmd_line_only:
      0095C7 76 61 6C 69 64   [ 2]  906 	btjf flags,#FRUN,0$
      0095CC 20 6C            [ 1]  907 	ld a,#ERR_CMD_ONLY
      0095CE 69 6E 65         [ 2]  908 	jp tb_error 
      0095D1 20               [ 4]  909 0$: ret 
                                    910 
                                    911 ;--------------------------------
                                    912 ; called by command/function that 
                                    913 ; should be invoked only at run time
                                    914 ; Display an error if invoked from 
                                    915 ; command line. 
                                    916 ;---------------------------------
      0019CD                        917 runtime_only:
      0095D2 6E 75 6D 62 65   [ 2]  918 	btjt flags,#FRUN,0$ 
      0095D7 72 2E            [ 1]  919 	ld a,#ERR_RUN_ONLY
      0095D9 0A 00 72         [ 2]  920 	jp tb_error 
      0095DC 75               [ 4]  921 0$:	ret 
                                    922 
                                    923 ;---------------------
                                    924 ; check if next token
                                    925 ;  is of expected type 
                                    926 ; input:
                                    927 ;   A 		 expected token attribute
                                    928 ;  ouput:
                                    929 ;   none     if fail call syntax_error 
                                    930 ;--------------------
      0019D8                        931 expect:
      0095DD 6E               [ 1]  932 	push a 
      0095DE 20 74 69         [ 4]  933 	call next_token 
      0095E1 6D 65            [ 1]  934 	cp a,(1,sp)
      0095E3 20 6F            [ 1]  935 	jreq 1$
      0095E5 6E 6C 79         [ 2]  936 	jp syntax_error
      0095E8 20               [ 1]  937 1$: pop a 
      0095E9 75               [ 4]  938 	ret 
                                    939 
                                    940 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    941 ; parse arguments list 
                                    942 ; between ()
                                    943 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019E5                        944 func_args:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      0095EA 73 61            [ 1]  945 	ld a,#TK_LPAREN 
      0095EC 67 65 2E         [ 4]  946 	call expect 
                                    947 ; expected to continue in arg_list 
                                    948 ; caller must check for TK_RPAREN 
                                    949 
                                    950 ;-------------------------------
                                    951 ; parse embedded BASIC routines 
                                    952 ; arguments list.
                                    953 ; arg_list::=  expr[','expr]*
                                    954 ; all arguments are of int24_t type
                                    955 ; and pushed on stack 
                                    956 ; input:
                                    957 ;   none
                                    958 ; output:
                                    959 ;   xstack{n}   arguments pushed on xstack
                                    960 ;   A 	number of arguments pushed on xstack  
                                    961 ;--------------------------------
      0019EA                        962 arg_list:
      0095EF 0A 00            [ 1]  963 	push #0
      0095F1 63 6F 6D         [ 4]  964 1$:	call condition 
      0095F4 6D               [ 1]  965 	tnz a 
      0095F5 61 6E            [ 1]  966 	jreq 7$  
      0095F7 64 20            [ 1]  967 	inc (1,sp)
      0095F9 6C 69 6E         [ 4]  968 	call next_token 
      0095FC 65 20            [ 1]  969 	cp a,#TK_COMMA 
      0095FE 6F 6E            [ 1]  970 	jreq 1$ 
      009600 6C 79            [ 1]  971 	cp a,#TK_RPAREN
      009602 20 75            [ 1]  972 	jreq 7$
      0019FF                        973 	_unget_token 
      009604 73 61 67 65 2E   [ 1]    1      mov in,in.saved  
      009609 0A               [ 1]  974 7$:	pop a  
      00960A 00               [ 4]  975 	ret 
                                    976 
                                    977 ;--------------------------------
                                    978 ;   BASIC commnands 
                                    979 ;--------------------------------
                                    980 
                                    981 ;--------------------------------
                                    982 ;  arithmetic and relational 
                                    983 ;  routines
                                    984 ;  operators precedence
                                    985 ;  highest to lowest
                                    986 ;  operators on same row have 
                                    987 ;  same precedence and are executed
                                    988 ;  from left to right.
                                    989 ;	'*','/','%'
                                    990 ;   '-','+'
                                    991 ;   '=','>','<','>=','<=','<>','><'
                                    992 ;   '<>' and '><' are equivalent for not equal.
                                    993 ;--------------------------------
                                    994 
                                    995 ;---------------------
                                    996 ; return array element
                                    997 ; address from @(expr)
                                    998 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



                                    999 ;   A 		TK_ARRAY
                                   1000 ; output:
                                   1001 ;	X 		element address 
                                   1002 ;----------------------
      001A06                       1003 get_array_element:
      00960B 64 75 70         [ 4] 1004 	call func_args 
      00960E 6C 69            [ 1] 1005 	cp a,#1
      009610 63 61            [ 1] 1006 	jreq 1$
      009612 74 65 20         [ 2] 1007 	jp syntax_error
      001A10                       1008 1$: _xpop 
      009615 6E 61            [ 1]    1     ld a,(y)
      009617 6D               [ 1]    2     ldw x,y 
      009618 65 2E            [ 2]    3     ldw x,(1,x)
      00961A 0A 00 46 69      [ 2]    4     addw y,#CELL_SIZE 
                                   1009     ; ignore A, index < 65536 in any case 
                                   1010 	; check for bounds 
      00961E 6C 65 20         [ 2] 1011 	cpw x,array_size 
      009621 6E 6F            [ 2] 1012 	jrule 3$
                                   1013 ; bounds {1..array_size}	
      009623 74 20            [ 1] 1014 2$: ld a,#ERR_BAD_VALUE 
      009625 66 6F 75         [ 2] 1015 	jp tb_error 
      009628 6E               [ 2] 1016 3$: tnzw  x
      009629 64 2E            [ 1] 1017 	jreq 2$ 
      00962B 0A 00            [ 1] 1018 	ld a,#CELL_SIZE  
      00962D 62               [ 4] 1019 	mul x,a 
      00962E 61 64 20         [ 2] 1020 	ldw acc16,x   
      009631 76 61 6C         [ 2] 1021 	ldw x,#tib ; array is below tib 
      009634 75 65 2E 0A      [ 2] 1022 	subw x,acc16 
      009638 00               [ 4] 1023 	ret 
                                   1024 
                                   1025 
                                   1026 ;***********************************
                                   1027 ;   expression parse,execute 
                                   1028 ;***********************************
                                   1029 ;-----------------------------------
                                   1030 ; factor ::= ['+'|'-'|e]  var | @ |
                                   1031 ;			 integer | function |
                                   1032 ;			 '('relation')' 
                                   1033 ; output:
                                   1034 ;   A       token attribute 
                                   1035 ;   xstack  value  
                                   1036 ; ---------------------------------
                           000001  1037 	NEG=1
                           000001  1038 	VSIZE=1
      001A34                       1039 factor:
      001A34                       1040 	_vars VSIZE 
      009639 46 69            [ 2]    1     sub sp,#VSIZE 
      00963B 6C 65            [ 1] 1041 	clr (NEG,sp)
      00963D 20 69 6E         [ 4] 1042 	call next_token
      009640 20               [ 1] 1043 	tnz a 
      009641 65 78            [ 1] 1044 	jrne 1$ 
      009643 74 65 6E         [ 2] 1045 	jp 22$ 
      009646 64 65            [ 1] 1046 1$:	cp a,#TK_PLUS 
      009648 64 20            [ 1] 1047 	jreq 2$
      00964A 6D 65            [ 1] 1048 	cp a,#TK_MINUS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      00964C 6D 6F            [ 1] 1049 	jrne 4$ 
      00964E 72 79            [ 1] 1050 	cpl (NEG,sp)
      001A4B                       1051 2$:	
      009650 2C 20 63         [ 4] 1052 	call next_token
      001A4E                       1053 4$:
      009653 61               [ 1] 1054 	tnz a 
      009654 6E 27            [ 1] 1055 	jrne 41$ 
      009656 74 20 62         [ 2] 1056 	jp syntax_error  
      001A54                       1057 41$:	
      009659 65 20            [ 1] 1058 	cp a,#TK_IFUNC 
      00965B 72 75            [ 1] 1059 	jrne 5$ 
      001A58                       1060 	_get_code_addr 
      00965D 6E               [ 2]    1         ldw x,(x)
      00965E 20 66 72 6F      [ 1]    2         inc in 
      009662 6D 20 74 68      [ 1]    3         inc in 
      009666 65               [ 4] 1061 	call (x); result in A:X  
      009667 72 65            [ 2] 1062 	jra 18$ 
      001A64                       1063 5$:
      009669 2E 0A            [ 1] 1064 	cp a,#TK_INTGR
      00966B 00 4E            [ 1] 1065 	jrne 6$
      00966D 6F 20 64         [ 4] 1066 	call get_int24 ; A:X
      009670 61 74            [ 2] 1067 	jra 18$
      001A6D                       1068 6$:
      009672 61 20            [ 1] 1069 	cp a,#TK_ARRAY
      009674 66 6F            [ 1] 1070 	jrne 7$
      009676 75 6E 64         [ 4] 1071 	call get_array_element
      009679 2E 0A            [ 2] 1072     jra 71$
      001A76                       1073 7$:
      00967B 00 4E            [ 1] 1074 	cp a,#TK_VAR 
      00967D 6F 20            [ 1] 1075 	jrne 8$
      00967F 70 72 6F         [ 4] 1076 	call get_addr 
      001A7D                       1077 71$: ; put value in A:X
      009682 67               [ 1] 1078 	ld a,(x)
      009683 72 61            [ 2] 1079 	ldw x,(1,x)
      009685 6D 20            [ 2] 1080 	jra 18$
      001A82                       1081 8$:
      009687 69 6E            [ 1] 1082 	cp a,#TK_LABEL 
      009689 20 52            [ 1] 1083 	jrne 9$
      00968B 41 4D            [ 2] 1084 	pushw y  
      00968D 21               [ 2] 1085 	pushw x 
      00968E 0A 00 46         [ 4] 1086 	call skip_string
      009691 69               [ 2] 1087 	popw x  
      009692 6C 65 20         [ 4] 1088 	call strlen 
      009695 73 79            [ 1] 1089 	add a,#REC_XTRA_BYTES
      009697 73 74 65         [ 4] 1090 	call search_name
      00969A 6D               [ 2] 1091 	tnzw x 
      00969B 20 66            [ 1] 1092 	jrne 82$ 
      00969D 75 6C            [ 2] 1093 	popw y 
      00969F 6C 2E            [ 2] 1094 	jra 16$
      001A9C                       1095 82$:
      0096A1 0A 00            [ 2] 1096 	popw y   
      0096A3 42 75 66         [ 4] 1097 	call get_value ; in A:X 
      0096A6 66 65            [ 2] 1098 	jra 18$
      001AA3                       1099 9$: 
      0096A8 72 20            [ 1] 1100 	cp a,#TK_CFUNC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      0096AA 66 75            [ 1] 1101 	jrne 12$
      001AA7                       1102 	_get_code_addr 
      0096AC 6C               [ 2]    1         ldw x,(x)
      0096AD 6C 0A 00 6F      [ 1]    2         inc in 
      0096B1 76 65 72 66      [ 1]    3         inc in 
      0096B5 6C               [ 4] 1103 	call(x)
      0096B6 6F               [ 1] 1104 	clrw x 
      0096B7 77               [ 1] 1105 	rlwa x  ; char>int24 in A:X 
      0096B8 0A 00            [ 2] 1106 	jra 18$ 	 
      001AB5                       1107 12$:			
      0096BA 63 6F            [ 1] 1108 	cp a,#TK_LPAREN
      0096BC 6E 73            [ 1] 1109 	jrne 16$
      0096BE 74 61 6E         [ 4] 1110 	call expression
      0096C1 74 20            [ 1] 1111 	ld a,#TK_RPAREN 
      0096C3 63 61 6E         [ 4] 1112 	call expect
      001AC1                       1113 	_xpop 
      0096C6 27 74            [ 1]    1     ld a,(y)
      0096C8 20               [ 1]    2     ldw x,y 
      0096C9 62 65            [ 2]    3     ldw x,(1,x)
      0096CB 20 6D 6F 64      [ 2]    4     addw y,#CELL_SIZE 
      0096CF 69 66            [ 2] 1114 	jra 18$	
      001ACC                       1115 16$:
      001ACC                       1116 	_unget_token 
      0096D1 69 65 64 0A 00   [ 1]    1      mov in,in.saved  
      0096D6 6E               [ 1] 1117 	clr a 
      0096D7 6F 20            [ 2] 1118 	jra 22$ 
      001AD4                       1119 18$: 
      0096D9 70 72            [ 1] 1120 	tnz (NEG,sp)
      0096DB 6F 67            [ 1] 1121 	jreq 20$
      0096DD 72 61 6D         [ 4] 1122 	call neg_ax   
      001ADB                       1123 20$:
      001ADB                       1124 	_xpush 
      0096E0 20 61 74 20      [ 2]    1     subw y,#CELL_SIZE
      0096E4 74 68            [ 1]    2     ld (y),a 
      0096E6 69 73 20         [ 2]    3     ldw (1,y),x 
      0096E9 61 64            [ 1] 1125 	ld a,#TK_INTGR
      001AE6                       1126 22$:
      001AE6                       1127 	_drop VSIZE
      0096EB 64 72            [ 2]    1     addw sp,#VSIZE 
      0096ED 65               [ 4] 1128 	ret
                                   1129 
                                   1130 
                                   1131 ;-----------------------------------
                                   1132 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   1133 ; output:
                                   1134 ;   A    	token attribute 
                                   1135 ;	xstack		value 
                                   1136 ;-----------------------------------
                           000001  1137 	MULOP=1
                           000001  1138 	VSIZE=1
      001AE9                       1139 term:
      001AE9                       1140 	_vars VSIZE
      0096EE 73 73            [ 2]    1     sub sp,#VSIZE 
                                   1141 ; first factor 	
      0096F0 0A 00 0A         [ 4] 1142 	call factor
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      0096F3 72               [ 1] 1143 	tnz a 
      0096F4 75 6E            [ 1] 1144 	jreq term_exit  
      001AF1                       1145 term01:	 ; check for  operator '*'|'/'|'%' 
      0096F6 20 74 69         [ 4] 1146 	call next_token
      0096F9 6D 65            [ 1] 1147 	ld (MULOP,sp),a
      0096FB 20 65            [ 1] 1148 	and a,#TK_GRP_MASK
      0096FD 72 72            [ 1] 1149 	cp a,#TK_GRP_MULT
      0096FF 6F 72            [ 1] 1150 	jreq 1$
      009701 2C 20            [ 1] 1151 	ld a,#TK_INTGR
      001AFE                       1152 	_unget_token 
      009703 00 0A 63 6F 6D   [ 1]    1      mov in,in.saved  
      009708 70 69            [ 2] 1153 	jra term_exit 
      001B05                       1154 1$:	; got *|/|%
                                   1155 ;second factor
      00970A 6C 65 20         [ 4] 1156 	call factor
      00970D 65               [ 1] 1157 	tnz a 
      00970E 72 72            [ 1] 1158 	jrne 2$ 
      009710 6F 72 2C         [ 2] 1159 	jp syntax_error 
      001B0E                       1160 2$: ; select operation 	
      009713 20 00            [ 1] 1161 	ld a,(MULOP,sp) 
      009715 6C 61            [ 1] 1162 	cp a,#TK_MULT 
      009717 73 74            [ 1] 1163 	jrne 3$
                                   1164 ; '*' operator
      009719 20 74 6F         [ 4] 1165 	call mul24 
      00971C 6B 65            [ 2] 1166 	jra term01
      00971E 6E 20            [ 1] 1167 3$: cp a,#TK_DIV 
      009720 69 64            [ 1] 1168 	jrne 4$ 
                                   1169 ; '/' operator	
      009722 3A 20 00         [ 4] 1170 	call div24 
      009725 20 CF            [ 2] 1171 	jra term01 
      001B22                       1172 4$: ; '%' operator
      009725 A6 02 A1         [ 4] 1173 	call mod24
      009727 20 CA            [ 2] 1174 	jra term01 
      001B27                       1175 9$: 
      009727 72 0A            [ 1] 1176 	ld a,#TK_INTGR
      001B29                       1177 term_exit:
      001B29                       1178 	_drop VSIZE 
      009729 00 23            [ 2]    1     addw sp,#VSIZE 
      00972B 4C               [ 4] 1179 	ret 
                                   1180 
                                   1181 ;-------------------------------
                                   1182 ;  expr ::= term [['+'|'-'] term]*
                                   1183 ;  result range {-32768..32767}
                                   1184 ;  output:
                                   1185 ;   A    token attribute 
                                   1186 ;   xstack	 result    
                                   1187 ;-------------------------------
                           000001  1188 	OP=1 
                           000001  1189 	VSIZE=1 
      001B2C                       1190 expression:
      001B2C                       1191 	_vars VSIZE 
      00972C 88 AE            [ 2]    1     sub sp,#VSIZE 
                                   1192 ; first term 	
      00972E 96 F2 CD         [ 4] 1193 	call term
      009731 89               [ 1] 1194 	tnz a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      009732 DC 84            [ 1] 1195 	jreq 9$
      001B34                       1196 1$:	; operator '+'|'-'
      009734 AE 95 52         [ 4] 1197 	call next_token
      009737 72 5F            [ 1] 1198 	ld (OP,sp),a 
      009739 00 0E            [ 1] 1199 	and a,#TK_GRP_MASK
      00973B 48 72            [ 1] 1200 	cp a,#TK_GRP_ADD 
      00973D 59 00            [ 1] 1201 	jreq 2$ 
      001B3F                       1202 	_unget_token 
      00973F 0E C7 00 0F 72   [ 1]    1      mov in,in.saved  
      009744 BB 00            [ 1] 1203 	ld a,#TK_INTGR
      009746 0E FE            [ 2] 1204 	jra 9$ 
      001B48                       1205 2$: ; second term 
      009748 CD 89 DC         [ 4] 1206 	call term
      00974B CE               [ 1] 1207 	tnz a 
      00974C 00 05            [ 1] 1208 	jrne 3$
      00974E C6 00 03         [ 2] 1209 	jp syntax_error
      001B51                       1210 3$:
      009751 90 5F            [ 1] 1211 	ld a,(OP,sp)
      009753 90 02            [ 1] 1212 	cp a,#TK_PLUS 
      009755 CD 86            [ 1] 1213 	jrne 4$
                                   1214 ; '+' operator	
      009757 C5 CE 00         [ 4] 1215 	call add24
      00975A 05 C6            [ 2] 1216 	jra 1$ 
      001B5C                       1217 4$:	; '-' operator 
      00975C 00 02 CD         [ 4] 1218 	call sub24
      00975F A0 7A            [ 2] 1219 	jra 1$
      001B61                       1220 9$:
      001B61                       1221 	_drop VSIZE 
      009761 AE 97            [ 2]    1     addw sp,#VSIZE 
      009763 15               [ 4] 1222 	ret 
                                   1223 
                                   1224 ;---------------------------------------------
                                   1225 ; rel ::= expr rel_op expr
                                   1226 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   1227 ;  relation return  integer , zero is false 
                                   1228 ;  output:
                                   1229 ;	 xstack		value  
                                   1230 ;---------------------------------------------
                           000001  1231 	RELOP=1
                           000001  1232 	VSIZE=1 
      001B64                       1233 relation: 
      001B64                       1234 	_vars VSIZE
      009764 CD 89            [ 2]    1     sub sp,#VSIZE 
      009766 DC C6 00         [ 4] 1235 	call expression
      009769 04               [ 1] 1236 	tnz a 
      00976A 5F 97            [ 1] 1237 	jreq 9$ 
                                   1238 ; expect rel_op or leave 
      00976C 72 BB 00         [ 4] 1239 	call next_token 
      00976F 05 F6            [ 1] 1240 	ld (RELOP,sp),a 
      009771 5F 97            [ 1] 1241 	and a,#TK_GRP_MASK
      009773 CD 98            [ 1] 1242 	cp a,#TK_GRP_RELOP 
      009775 D4 20            [ 1] 1243 	jreq 2$
      009777 35 84            [ 1] 1244 	ld a,#TK_INTGR 
      009778                       1245 	_unget_token 
      009778 88 AE 97 04 CD   [ 1]    1      mov in,in.saved  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      00977D 89 DC            [ 2] 1246 	jra 9$ 
      001B80                       1247 2$:	; expect another expression
      00977F 84 AE 95         [ 4] 1248 	call expression
      009782 52               [ 1] 1249 	tnz a 
      009783 72 5F            [ 1] 1250 	jrne 3$
      009785 00 0E 48         [ 2] 1251 	jp syntax_error 
      001B89                       1252 3$: 
      009788 72 59 00         [ 4] 1253 	call cp24 
      001B8C                       1254 	_xpop  
      00978B 0E C7            [ 1]    1     ld a,(y)
      00978D 00               [ 1]    2     ldw x,y 
      00978E 0F 72            [ 2]    3     ldw x,(1,x)
      009790 BB 00 0E FE      [ 2]    4     addw y,#CELL_SIZE 
      009794 CD               [ 1] 1255 	tnz a 
      009795 89 DC            [ 1] 1256 	jrmi 4$
      009797 AE 16            [ 1] 1257 	jrne 5$
      009799 68 CD 89 DC      [ 1] 1258 	mov acc8,#2 ; i1==i2
      00979D A6 0D            [ 2] 1259 	jra 6$ 
      001BA0                       1260 4$: ; i1<i2
      00979F CD 89 7F CE      [ 1] 1261 	mov acc8,#4 
      0097A3 00 01            [ 2] 1262 	jra 6$
      001BA6                       1263 5$: ; i1>i2
      0097A5 CD 8A 49 A6      [ 1] 1264 	mov acc8,#1  
      001BAA                       1265 6$: ; 0=false, -1=true 
      0097A9 5E               [ 1] 1266 	clrw x 
      0097AA CD 89 7F         [ 1] 1267 	ld a, acc8  
      0097AD AE 17            [ 1] 1268 	and a,(RELOP,sp)
      0097AF FF 94            [ 1] 1269 	jreq 7$
      0097B1 53               [ 2] 1270 	cplw x 
      0097B1 CD 95            [ 1] 1271 	ld a,#255 
      001BB5                       1272 7$:	_xpush 
      0097B3 0F A2 00 03      [ 2]    1     subw y,#CELL_SIZE
      0097B4 90 F7            [ 1]    2     ld (y),a 
      0097B4 A6 0D CD         [ 2]    3     ldw (1,y),x 
      0097B7 89 7F            [ 1] 1273 	ld a,#TK_INTGR
      001BC0                       1274 9$: 
      001BC0                       1275 	_drop VSIZE
      0097B9 A6 3E            [ 2]    1     addw sp,#VSIZE 
      0097BB CD               [ 4] 1276 	ret 
                                   1277 
                                   1278 ;-------------------------------------------
                                   1279 ;  AND factor:  [NOT] relation | (condition)
                                   1280 ;  output:
                                   1281 ;     A      TK_INTGR|0
                                   1282 ;-------------------------------------------
                           000001  1283 	NOT_OP=1
      001BC3                       1284 and_factor:
      0097BC 89 7F            [ 1] 1285 	push #0 
      0097BE CD 8A E1         [ 4] 1286 0$:	call next_token  
      0097C1 72               [ 1] 1287 	tnz a 
      0097C2 5D 00            [ 1] 1288 	jreq 8$ 
      0097C4 03 27            [ 1] 1289 	cp a,#TK_NOT 
      0097C6 ED CD            [ 1] 1290 	jrne 1$ 
      0097C8 91 29            [ 1] 1291 	cpl (NOT_OP,sp)
      0097CA 72 5D            [ 2] 1292 	jra 0$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      001BD3                       1293 1$:	
      0097CC 00 03            [ 1] 1294 	cp a,#TK_LPAREN 
      0097CE 27 E4            [ 1] 1295 	jrne 2$
      0097D0 CD 1C 45         [ 4] 1296 	call condition
      0097D0 C6 00            [ 1] 1297 	ld a,#TK_RPAREN 
      0097D2 02 C1 00         [ 4] 1298 	call expect
      0097D5 03 2B            [ 2] 1299 	jra 3$
      001BE1                       1300 2$: _unget_token 
      0097D7 20 00 03 00 01   [ 1]    1      mov in,in.saved  
      0097D8 CD 1B 64         [ 4] 1301 	call relation
      001BE9                       1302 3$:
      0097D8 72 01            [ 1] 1303 	tnz (NOT_OP,sp)
      0097DA 00 23            [ 1] 1304 	jreq 8$ 
      0097DC D7 CE 00         [ 4] 1305 	call cpl24
      001BF0                       1306 8$:
      001BF0                       1307 	_drop 1  
      0097DF 05 72            [ 2]    1     addw sp,#1 
      0097E1 BB               [ 4] 1308     ret 
                                   1309 
                                   1310 
                                   1311 ;--------------------------------------------
                                   1312 ;  AND operator as priority over OR||XOR 
                                   1313 ;  format: relation | (condition) [AND relation|(condition)]*
                                   1314 ;          
                                   1315 ;  output:
                                   1316 ;     A     TK_INTGR|0
                                   1317 ;    xtack   value 
                                   1318 ;--------------------------------------------
      001BF3                       1319 and_cond:
      0097E2 00 01 C3         [ 4] 1320 	call and_factor
      0097E5 00               [ 1] 1321 	tnz a 
      0097E6 1E 2B            [ 1] 1322 	jreq 9$  
      0097E8 03 CD A6         [ 4] 1323 1$: call next_token 
      0097EB 36               [ 1] 1324 	tnz a 
      0097EC CF 00            [ 1] 1325 	jreq 6$ 
      0097EE 05 E6            [ 1] 1326 	cp a,#TK_AND 
      0097F0 02 C7            [ 1] 1327 	jreq 3$
      001C03                       1328 	_unget_token 
      0097F2 00 03 35 03 00   [ 1]    1      mov in,in.saved  
      0097F7 02 38            [ 2] 1329 	jra 6$ 
      0097F8 CD 1B C3         [ 4] 1330 3$:	call and_factor  
      0097F8 CD               [ 1] 1331 	tnz a 
      0097F9 98 8C            [ 1] 1332 	jrne 4$
      0097FB A1 00 27         [ 2] 1333 	jp syntax_error 
      001C13                       1334 4$:	
      001C13                       1335 	_xpop 
      0097FE D9 A1            [ 1]    1     ld a,(y)
      009800 80               [ 1]    2     ldw x,y 
      009801 26 0C            [ 2]    3     ldw x,(1,x)
      009803 FE 72 5C 00      [ 2]    4     addw y,#CELL_SIZE 
      009807 02 72 5C         [ 1] 1336 	ld acc24,a 
      00980A 00 02 FD         [ 2] 1337 	ldw acc16,x
      001C22                       1338 	_xpop 
      00980D 20 E9            [ 1]    1     ld a,(y)
      00980F 93               [ 1]    2     ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      00980F A1 85            [ 2]    3     ldw x,(1,x)
      009811 26 05 CD 9D      [ 2]    4     addw y,#CELL_SIZE 
      009815 97 20 E0         [ 1] 1339 	and a,acc24 
      009818 02               [ 1] 1340 	rlwa x 
      009818 A1 05 26         [ 1] 1341 	and a,acc16 
      00981B 05               [ 1] 1342 	rlwa x 
      00981C CD 9D 92         [ 1] 1343 	and a,acc8 
      00981F 20               [ 1] 1344 	rlwa x
      001C37                       1345 	_xpush
      009820 D7 A2 00 03      [ 2]    1     subw y,#CELL_SIZE
      009821 90 F7            [ 1]    2     ld (y),a 
      009821 A1 03 26         [ 2]    3     ldw (1,y),x 
      009824 05 CD            [ 2] 1346 	jra 1$  
      009826 98 31            [ 1] 1347 6$: ld a,#TK_INTGR 
      009828 20               [ 4] 1348 9$:	ret 	 
                                   1349 
                                   1350 
                                   1351 ;--------------------------------------------
                                   1352 ; condition for IF and UNTIL 
                                   1353 ; operators: OR,XOR 
                                   1354 ; format:  and_cond [ OP and_cond ]* 
                                   1355 ; output:
                                   1356 ;    A        INTGR|0 
                                   1357 ;    xstack   value 
                                   1358 ;--------------------------------------------
                           000001  1359 	ATMP=1
                           000002  1360 	OP=2
                           000002  1361 	VSIZE=2 
      001C45                       1362 condition:
      001C45                       1363 	_vars VSIZE 
      009829 CE 02            [ 2]    1     sub sp,#VSIZE 
      00982A CD 1B F3         [ 4] 1364 	call and_cond
      00982A A1               [ 1] 1365 	tnz a 
      00982B 0A 27            [ 1] 1366 	jreq 9$ 
      00982D CA CC 97         [ 4] 1367 1$:	call next_token 
      009830 25 89            [ 1] 1368 	cp a,#TK_OR 
      009831 27 0B            [ 1] 1369 	jreq 2$
      009831 52 04            [ 1] 1370 	cp a,#TK_XOR
      009833 1F 01            [ 1] 1371 	jreq 2$ 
      001C58                       1372 	_unget_token 
      009835 0F 03 CD 98 A5   [ 1]    1      mov in,in.saved  
      00983A CE 00            [ 2] 1373 	jra 8$ 
      00983C 05 72            [ 1] 1374 2$:	ld (OP,sp),a ; TK_OR|TK_XOR 
      00983E BB 00 01         [ 4] 1375 	call and_cond
      009841 F6 A1            [ 1] 1376 	cp a,#TK_INTGR 
      009843 32 26            [ 1] 1377 	jreq 3$
      009845 43 72 5C         [ 2] 1378 	jp syntax_error 
      001C6B                       1379 3$:	 
      001C6B                       1380 	_xpop  ; rigth arg 
      009848 00 02            [ 1]    1     ld a,(y)
      00984A CD               [ 1]    2     ldw x,y 
      00984B 9C C5            [ 2]    3     ldw x,(1,x)
      00984D A1 84 27 03      [ 2]    4     addw y,#CELL_SIZE 
      009851 CC 97 25         [ 1] 1381 	ld acc24,a 
      009854 CF 00 0D         [ 2] 1382 	ldw acc16,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      001C7A                       1383 	_xpop  ; left arg  
      009854 1E 01            [ 1]    1     ld a,(y)
      009856 CD               [ 1]    2     ldw x,y 
      009857 94 19            [ 2]    3     ldw x,(1,x)
      009859 AB 05 6B 04      [ 2]    4     addw y,#CELL_SIZE 
      00985D CD 9E            [ 1] 1384 	ld (ATMP,sp),a 
      00985F 01 5D            [ 1] 1385 	ld a,(OP,sp)
      009861 27 EE            [ 1] 1386 	cp a,#TK_XOR 
      009863 F6 2A            [ 1] 1387 	jreq 5$ 
      001C8B                       1388 4$: ; A:X OR acc24   
      009865 05 A6            [ 1] 1389 	ld a,(ATMP,sp)
      009867 11 CC 97         [ 1] 1390 	or a,acc24 
      00986A 27               [ 1] 1391 	rlwa x 
      00986B CA 00 0D         [ 1] 1392 	or a,acc16 
      00986B 72               [ 1] 1393 	rlwa x 
      00986C FB 03 1D         [ 1] 1394 	or a,acc8 
      00986F 00               [ 1] 1395 	rlwa x 
      009870 03 CF            [ 2] 1396 	jra 6$  
      001C9B                       1397 5$: ; A:X XOR acc24 
      009872 00 1A            [ 1] 1398 	ld a,(ATMP,sp)
      009874 90 F6 93         [ 1] 1399 	xor a,acc24 
      009877 EE               [ 1] 1400 	rlwa x 
      009878 01 72 A9         [ 1] 1401 	xor a,acc16 
      00987B 00               [ 1] 1402 	rlwa x 
      00987C 03 72 C7         [ 1] 1403 	xor a,acc8 
      00987F 00               [ 1] 1404 	rlwa x 
      001CA9                       1405 6$: _xpush
      009880 1A 72 5C 00      [ 2]    1     subw y,#CELL_SIZE
      009884 1B 72            [ 1]    2     ld (y),a 
      009886 CF 00 1A         [ 2]    3     ldw (1,y),x 
      009889 5B 04            [ 2] 1406 	jra 1$ 
      00988B 81 84            [ 1] 1407 8$:	ld a,#TK_INTGR 
      00988C                       1408 9$:	_drop VSIZE 
      00988C C6 00            [ 2]    1     addw sp,#VSIZE 
      00988E 02               [ 4] 1409 	ret 
                                   1410 
                                   1411 
                                   1412 ;--------------------------------------------
                                   1413 ; BASIC: HEX 
                                   1414 ; select hexadecimal base for integer print
                                   1415 ;---------------------------------------------
      001CB9                       1416 hex_base:
      00988F C7 00 04 C0      [ 1] 1417 	mov base,#16 
      009893 00               [ 4] 1418 	ret 
                                   1419 
                                   1420 ;--------------------------------------------
                                   1421 ; BASIC: DEC 
                                   1422 ; select decimal base for integer print
                                   1423 ;---------------------------------------------
      001CBE                       1424 dec_base:
      009894 03 27 0D 0A      [ 1] 1425 	mov base,#10
      009897 81               [ 4] 1426 	ret 
                                   1427 
                                   1428 ;------------------------
                                   1429 ; BASIC: FREE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



                                   1430 ; return free size in RAM 
                                   1431 ; output:
                                   1432 ;   A:x		size 
                                   1433 ;--------------------------
      001CC3                       1434 free:
      009897 CE               [ 1] 1435 	clr a 
      009898 00 05 72         [ 2] 1436 	ldw x,#tib 
      00989B BB 00 01 F6      [ 2] 1437 	subw x,dvar_end 
      00989F 5C               [ 4] 1438 	ret 
                                   1439 
                                   1440 ;------------------------------
                                   1441 ; BASIC: SIZE 
                                   1442 ; command that print 
                                   1443 ; program start addres and size 
                                   1444 ;------------------------------
      001CCC                       1445 cmd_size:
      0098A0 72 5C 00         [ 1] 1446 	push base 
      0098A3 02 81 AB         [ 2] 1447 	ldw x,#PROG_ADDR 
      0098A5 CD 09 5C         [ 4] 1448 	call puts 
      0098A5 F6 27 03         [ 2] 1449 	ldw x,txtbgn     
      0098A8 5C 20 FA 5C      [ 1] 1450 	mov base,#16 
      0098AC 72 B0 00         [ 4] 1451 	call prt_i16
      0098AF 05 CF 00         [ 1] 1452 	pop base 
      0098B2 01 81 BD         [ 2] 1453 	ldw x,#PROG_SIZE 
      0098B4 CD 09 5C         [ 4] 1454 	call puts 
      0098B4 FE 72 5C         [ 2] 1455 	ldw x,txtend 
      0098B7 00 02 72 5C      [ 2] 1456 	subw x,txtbgn 
      0098BB 00 02 81         [ 4] 1457 	call prt_i16
      0098BE AE 1E CE         [ 2] 1458 	ldw x,#STR_BYTES 
      0098BE F6 EE 01         [ 4] 1459 	call puts  
      0098C1 72               [ 4] 1460 	ret 
                                   1461 
                                   1462 
                                   1463 ;------------------------
                                   1464 ; BASIC: UBOUND  
                                   1465 ; return array variable size 
                                   1466 ; and set 'array_size' variable 
                                   1467 ; output:
                                   1468 ;   A:X 	array_size
                                   1469 ;--------------------------
      001CF9                       1470 ubound:
      0098C2 5C 00 02         [ 4] 1471 	call free 
      0098C5 72 5C            [ 1] 1472 	ld a,#CELL_SIZE 
      0098C7 00               [ 2] 1473 	div x,a 
      0098C8 02 72 5C         [ 2] 1474 	ldw array_size,x
      0098CB 00               [ 1] 1475 	clr a 
      0098CC 02               [ 4] 1476 	ret 
                                   1477 
                                   1478 ;-----------------------------
                                   1479 ; BASIC: LET var=expr 
                                   1480 ; variable assignement 
                                   1481 ; output:
                                   1482 ;   A 		TK_NONE 
                                   1483 ;-----------------------------
      001D04                       1484 let::
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      0098CD 81 18 0C         [ 4] 1485 	call next_token 
      0098CE A1 85            [ 1] 1486 	cp a,#TK_VAR 
      0098CE F6 72            [ 1] 1487 	jreq let_var
      0098D0 5C 00            [ 1] 1488 	cp a,#TK_ARRAY 
      0098D2 02 81            [ 1] 1489 	jreq  let_array
      0098D4 CC 16 A5         [ 2] 1490 	jp syntax_error
      001D12                       1491 let_array:
      0098D4 72 5F 00         [ 4] 1492 	call get_array_element
      0098D7 0D CF            [ 2] 1493 	jra let_eval 
      001D17                       1494 let_var:
      0098D9 00 0E A6         [ 4] 1495 	call get_addr
      001D1A                       1496 let_eval:
      0098DC 10 C1 00         [ 2] 1497 	ldw ptr16,x  ; variable address 
      0098DF 0B 27 09         [ 4] 1498 	call next_token 
      0098E2 72 0F            [ 1] 1499 	cp a,#TK_EQUAL
      0098E4 00 0E            [ 1] 1500 	jreq 1$
      0098E6 04 72 53         [ 2] 1501 	jp syntax_error
      001D27                       1502 1$:	
      0098E9 00 0D 45         [ 4] 1503 	call condition   
      0098EB A1 84            [ 1] 1504 	cp a,#TK_INTGR 
      0098EB A6 FF            [ 1] 1505 	jreq 2$
      0098ED CD 99 11         [ 2] 1506 	jp syntax_error
      001D31                       1507 2$:	
      001D31                       1508 	_xpop ; value 
      0098F0 CD 91            [ 1]    1     ld a,(y)
      0098F2 D3               [ 1]    2     ldw x,y 
      0098F3 88 CD            [ 2]    3     ldw x,(1,x)
      0098F5 89 DC 84 81      [ 2]    4     addw y,#CELL_SIZE 
      0098F9                       1509 3$:
      0098F9 90 F6 93 EE      [ 4] 1510 	ld [ptr16],a
      0098FD 01 72 A9 00      [ 1] 1511 	inc ptr8  
      009901 03 C7 00 0D      [ 5] 1512 	ldw [ptr16],x 
      009905 CF               [ 4] 1513 	ret 
                                   1514 
                                   1515 
                                   1516 ;--------------------------
                                   1517 ; return constant/dvar value 
                                   1518 ; from it's record address
                                   1519 ; input:
                                   1520 ;	X	*const record 
                                   1521 ; output:
                                   1522 ;   A:X   const  value
                                   1523 ;--------------------------
      001D47                       1524 get_value: ; -- i 
      009906 00               [ 1] 1525 	ld a,(x) ; record size 
      009907 0E CD            [ 1] 1526 	and a,#NAME_MAX_LEN
      009909 98 EB            [ 1] 1527 	sub a,#CELL_SIZE ; * value 
      00990B A6               [ 1] 1528 	push a 
      00990C 20 CD            [ 1] 1529 	push #0 
      00990E 89 7F 81         [ 2] 1530 	addw x,(1,sp)
      009911 F6               [ 1] 1531 	ld a,(x)
      009911 52 04            [ 2] 1532 	ldw x,(1,x)
      001D55                       1533 	_drop 2
      009913 0F 02            [ 2]    1     addw sp,#2 
      009915 0F               [ 4] 1534 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



                                   1535 
                                   1536 
                                   1537 ;--------------------------
                                   1538 ; BASIC: EEFREE 
                                   1539 ; eeprom_free 
                                   1540 ; search end of data  
                                   1541 ; in EEPROM 
                                   1542 ; input:
                                   1543 ;    none 
                                   1544 ; output:
                                   1545 ;    A:X     address free
                                   1546 ;-------------------------
      001D58                       1547 func_eefree:
      009916 01 4D 27         [ 2] 1548 	ldw x,#EEPROM_BASE 
      009919 11 C6 00 0B      [ 1] 1549 1$:	mov acc8,#8 ; count 8 consecutive zeros
      00991D A1 0A 26         [ 2] 1550     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      009920 0A 72            [ 1] 1551 	jruge 8$ ; no free space 
      009922 0F               [ 1] 1552 2$: ld a,(x)
      009923 00 0D            [ 1] 1553 	jrne 3$
      009925 05               [ 1] 1554 	incw x 
      009926 03 01 CD 82      [ 1] 1555 	dec acc8 
      00992A 9D F6            [ 1] 1556 	jrne 2$
      00992B 1D 00 08         [ 2] 1557 	subw x,#8 
      00992B AE 16            [ 2] 1558 	jra 9$  
      00992D 68               [ 1] 1559 3$: ld a,(x)
      00992E 1C               [ 1] 1560 	incw x
      00992F 00               [ 1] 1561 	tnz a  
      009930 50 5A            [ 1] 1562 	jrne 3$
      009932 7F               [ 2] 1563 	decw x   
      009933 20 E0            [ 2] 1564 	jra 1$ 
      009933 C6               [ 1] 1565 8$: clrw x ; no free space 
      009934 00               [ 1] 1566 9$: clr a 
      009935 0B CD 83         [ 2] 1567 	ldw free_eeprom,x ; save in system variable 
      009938 69               [ 4] 1568 	ret 
                                   1569 
                           000005  1570 REC_XTRA_BYTES=5 
                                   1571 ;--------------------------
                                   1572 ; search constant/dim_var name 
                                   1573 ; format of record  
                                   1574 ;   .byte record length 
                                   1575 ;         = strlen(name)+5 
                                   1576 ;   .asciz name (variable length)
                                   1577 ;   .int24 value (3 bytes )
                                   1578 ; a constant record use 7+ bytes
                                   1579 ; constants are saved in EEPROM  
                                   1580 ; input:
                                   1581 ;    A     record_len 
                                   1582 ;    X     *name
                                   1583 ; output:
                                   1584 ;    X     address|0
                                   1585 ; use:
                                   1586 ;   A,Y, acc16 
                                   1587 ;-------------------------
                           000001  1588 	NAMEPTR=1 ; target name pointer 
                           000003  1589 	WLKPTR=3   ; walking pointer in EEPROM||RAM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



                           000005  1590 	RECLEN=5  ; record length of target
                           000007  1591 	LIMIT=7   ; search area limit 
                           000008  1592 	VSIZE=8  
      001D81                       1593 search_name:
      009939 AB 30            [ 2] 1594 	pushw y 
      001D83                       1595 	_vars VSIZE
      00993B A1 3A            [ 2]    1     sub sp,#VSIZE 
      00993D 2B 02 AB 07      [ 1] 1596 	clr acc16 
      009941 6B 05            [ 1] 1597 	ld (RECLEN,sp),a    
      009941 5A F7            [ 2] 1598 	ldw (NAMEPTR,sp),x
      009943 0C 02 C6         [ 2] 1599 	ldw x,dvar_end 
      009946 00 0D            [ 2] 1600 	ldw (LIMIT,sp),x 
      009948 CA 00 0E CA      [ 2] 1601 	ldw y,dvar_bgn
      00994C 00 0F            [ 2] 1602 1$:	ldw (WLKPTR,sp),y
      00994E 26               [ 1] 1603 	ldw x,y 
      00994F E3 C6            [ 2] 1604 	cpw x, (LIMIT,sp) 
      009951 00 0B            [ 1] 1605 	jruge 7$ ; no match found 
      009953 A1 10            [ 1] 1606 	ld a,(y)
      009955 27 08            [ 1] 1607 	and a,#NAME_MAX_LEN
      009957 7B 01            [ 1] 1608 	cp a,(RECLEN,sp)
      009959 27 0A            [ 1] 1609 	jrne 2$ 
      00995B A6 2D            [ 1] 1610 	incw y 
      00995D 20 02            [ 2] 1611 	ldw x,(NAMEPTR,sp)
      00995F CD 13 A4         [ 4] 1612 	call strcmp
      00995F A6 24            [ 1] 1613 	jrne 8$ ; match found 
      001DAE                       1614 2$: ; skip this one 	
      009961 5A F7            [ 2] 1615 	ldW Y,(WLKPTR,sp)
      009963 0C 02            [ 1] 1616 	ld a,(y)
      009965 A4 0F            [ 1] 1617 	and a,#NAME_MAX_LEN 
      009965 7B 02 5B         [ 1] 1618 	ld acc8,a 
      009968 04 81 00 0D      [ 2] 1619 	addw y,acc16 
      00996A 20 D9            [ 2] 1620 	jra 1$  
      001DBD                       1621 7$: ; no match found 
      00996A A1 61            [ 1] 1622 	clr (WLKPTR,sp)
      00996C 2A 01            [ 1] 1623 	clr (WLKPTR+1,sp)
      001DC1                       1624 8$: ; match found 
      00996E 81 A1            [ 2] 1625 	ldw x,(WLKPTR,sp) ; record address 
      001DC3                       1626 9$:	_DROP VSIZE
      009970 7A 22            [ 2]    1     addw sp,#VSIZE 
      009972 FB A0            [ 2] 1627 	popw y 
      009974 20               [ 4] 1628 	 ret 
                                   1629 
                                   1630 ;--------------------------------------------
                                   1631 ; BASIC: CONST name=value [, name=value]*
                                   1632 ; define constant(s) saved in EEPROM
                                   1633 ; share most of his code with cmd_dim 
                                   1634 ;--------------------------------------------
                           000001  1635 	VAR_NAME=1 
                           000003  1636 	REC_LEN=3
                           000005  1637 	RONLY=5
                           000005  1638 	VSIZE=5
      001DC8                       1639 cmd_const:
      009975 81 19 CD         [ 4] 1640 	call runtime_only
      009976                       1641 	_vars VSIZE 
      009976 52 05            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      009978 1F 04            [ 1] 1642 	ld a,#128 
      00997A 4F 5F            [ 1] 1643 	ld (RONLY,sp),a 
      00997C 72 A2            [ 1] 1644 	clr (REC_LEN,sp)
      00997E 00 03            [ 2] 1645 	jra cmd_dim2 ; shared code with cmd_dim  
                                   1646 
                                   1647 ;---------------------------------
                                   1648 ; BASIC: DIM var_name [var_name]* 
                                   1649 ; create named variables at end 
                                   1650 ; of BASIC program. 
                                   1651 ; These variables are initialized 
                                   1652 ; to 0. 
                                   1653 ; record format same ast CONST 
                                   1654 ; but r/w because stored in RAM 
                                   1655 ;---------------------------------
      001DD5                       1656 cmd_dim:
      009980 90 F7 90         [ 4] 1657 	call runtime_only
      001DD8                       1658 cmd_dim1:	
      001DD8                       1659 	_vars VSIZE
      009983 EF 01            [ 2]    1     sub sp,#VSIZE 
      009985 0F 01            [ 1] 1660 	clr (REC_LEN,sp )
      009987 A6 0A            [ 1] 1661 	clr (RONLY,sp)
      001DDE                       1662 cmd_dim2: 
      009989 6B 02 1E         [ 4] 1663 0$:	call next_token 
      00998C 04 F6            [ 1] 1664 	cp a,#TK_LABEL  
      00998E 27 4E            [ 1] 1665 	jreq 1$ 
      009990 A1 2D 26         [ 2] 1666 	jp syntax_error 
      009993 04 03            [ 2] 1667 1$: ldw (VAR_NAME,sp),x ; name pointer 
      009995 01 20 08         [ 4] 1668 	call strlen
      009998 A1 24            [ 1] 1669 	add a,#REC_XTRA_BYTES
      00999A 26 08            [ 1] 1670 	ld (REC_LEN+1,sp),a
      00999C A6 10 6B         [ 4] 1671 	call skip_string 
      00999F 02 5C            [ 1] 1672 	ld a,(REC_LEN+1,sp)
      0099A1 1F 04            [ 2] 1673 	ldw x,(VAR_NAME,sp) 
      0099A3 F6 1D 81         [ 4] 1674 	call search_name  
      0099A4 5D               [ 2] 1675 	tnzw x 
      0099A4 A1 61            [ 1] 1676 	jreq 2$
      0099A6 2B 02            [ 1] 1677 	ld a,#ERR_DUPLICATE
      0099A8 A0 20 A1         [ 2] 1678 	jp tb_error  
      0099AB 30 2B 30         [ 2] 1679 2$:	ldw x,dvar_end 
      0099AE A0 30            [ 1] 1680 	ld a,(REC_LEN+1,sp)
      0099B0 A1 0A            [ 1] 1681 	or a,(RONLY,sp)
      0099B2 2B               [ 1] 1682 	ld (x),a 
      0099B3 06               [ 1] 1683 	incw x 
      0099B4 A0 07            [ 2] 1684 	pushw y 
      0099B6 11 02            [ 2] 1685 	ldw y,(VAR_NAME+2,sp)
      0099B8 2A 24 6B         [ 4] 1686 	call strcpy
      0099BB 03 7B            [ 2] 1687 	popw y 
      0099BD 02               [ 2] 1688 	decw x
      0099BE CD 82 BA         [ 2] 1689 	addw x,(REC_LEN,sp)
      0099C1 72 A2 00         [ 2] 1690 	ldw dvar_end,x 
      0099C4 03 90 F7         [ 2] 1691 	subw x,#CELL_SIZE  
      0099C7 90               [ 1] 1692 	clr (x)
      0099C8 EF 01            [ 1] 1693 	clr (1,x)  
      0099CA 5F 7B            [ 1] 1694 	clr (2,x)
      0099CC 03 02 72         [ 4] 1695 4$: call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      0099CF A2 00            [ 1] 1696 	cp a,#TK_COMMA 
      0099D1 03 90            [ 1] 1697 	jreq 0$ 
      0099D3 F7 90            [ 1] 1698 	cp a,#TK_EQUAL 
      0099D5 EF 01            [ 1] 1699 	jrne 8$
                                   1700 ; initialize variable 
      0099D7 CD 81 FE         [ 4] 1701 	call condition 
      0099DA 1E 04            [ 1] 1702 	cp a,#TK_INTGR
      0099DC 20 C2            [ 1] 1703 	jreq 5$
      0099DE 0D 01 27         [ 2] 1704 	jp syntax_error
      0099E1 03 CD 82         [ 2] 1705 5$: ldw x,dvar_end 
      0099E4 83 00 03         [ 2] 1706 	subw x,#CELL_SIZE 
      0099E5 CF 00 19         [ 2] 1707 	ldw ptr16,x 
      001E42                       1708 	_xpop 
      0099E5 90 F6            [ 1]    1     ld a,(y)
      0099E7 93               [ 1]    2     ldw x,y 
      0099E8 EE 01            [ 2]    3     ldw x,(1,x)
      0099EA 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0099EE C7 00 0D CF      [ 4] 1709 	ld [ptr16],a 
      0099F2 00 0E 5B 05      [ 1] 1710 	inc ptr8 
      0099F6 81 CF 00 19      [ 5] 1711 	ldw [ptr16],x 
      0099F7 20 CB            [ 2] 1712 	jra 4$ 
      001E59                       1713 8$:	
      001E59                       1714 	_unget_token 	
      0099F7 52 05 17 04 01   [ 1]    1      mov in,in.saved  
      0099FB                       1715 	_drop VSIZE 
      0099FB 1F 02            [ 2]    1     addw sp,#VSIZE 
      0099FD F6 A4 0F         [ 4] 1716 	call ubound 
      009A00 6B               [ 4] 1717 	ret 
                                   1718 
                                   1719 
                                   1720 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1721 ; return program size 
                                   1722 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001E64                       1723 prog_size:
      009A01 01 16 04         [ 2] 1724 	ldw x,txtend 
      009A04 5C B0 00 1B      [ 2] 1725 	subw x,txtbgn 
      009A05 81               [ 4] 1726 	ret 
                                   1727 
                                   1728 ;----------------------------
                                   1729 ; print program information 
                                   1730 ;---------------------------
      001E6C                       1731 program_info: 
      009A05 90 F6 27         [ 2] 1732 	ldw x,#PROG_ADDR 
      009A08 1B 0D 01         [ 4] 1733 	call puts 
      009A0B 27 0A F1         [ 2] 1734 	ldw x,txtbgn 
      009A0E 26 07 90 5C      [ 1] 1735 	mov base,#16 
      009A12 5C 0A 01         [ 4] 1736 	call prt_i16
      009A15 20 EE 00 0A      [ 1] 1737 	mov base,#10  
      009A17 AE 1E BD         [ 2] 1738 	ldw x,#PROG_SIZE
      009A17 1E 02 1D         [ 4] 1739 	call puts 
      009A1A 00 02 4B         [ 4] 1740 	call prog_size 
      009A1D 00 FE 84         [ 4] 1741 	call prt_i16 
      009A20 27 1D 20         [ 2] 1742 	ldw x,#STR_BYTES 
      009A23 D7 09 5C         [ 4] 1743 	call puts
      009A24 CE 00 1B         [ 2] 1744 	ldw x,txtbgn
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      009A24 1E 02 F6         [ 2] 1745 	cpw x,#app 
      009A27 6B 01            [ 1] 1746 	jrult 2$
      009A29 A4 0F 4C         [ 2] 1747 	ldw x,#FLASH_MEM 
      009A2C C7 00            [ 2] 1748 	jra 3$
      009A2E 0F 72 5F         [ 2] 1749 2$: ldw x,#RAM_MEM 	 
      009A31 00 0E 72         [ 4] 1750 3$:	call puts 
      009A34 BB 00            [ 1] 1751 	ld a,#CR 
      009A36 0E FE 7B         [ 4] 1752 	call putc
      009A39 01               [ 4] 1753 	ret 
                                   1754 
      009A3A A4 F0 4E AB 80 61 6D  1755 PROG_ADDR: .asciz "program address: "
             20 61 64 64 72 65 73
             73 3A 20 00
      009A3F 2C 20 70 72 6F 67 72  1756 PROG_SIZE: .asciz ", program size: "
             61 6D 20 73 69 7A 65
             3A 20 00
      009A3F 5B 05 81 74 65 73 00  1757 STR_BYTES: .asciz " bytes" 
      009A42 20 69 6E 20 46 4C 41  1758 FLASH_MEM: .asciz " in FLASH memory" 
             53 48 20 6D 65 6D 6F
             72 79 00
      009A42 72 01 00 23 05 A6 07  1759 RAM_MEM:   .asciz " in RAM memory" 
             CC 97 27 81 6F 72 79
             00
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
      009A4D                       1773 cmd_list:
      009A4D 72 00 00         [ 4] 1774 	call cmd_line_only
      009A50 23 05 A6         [ 4] 1775 	call prog_size 
      009A53 06 CC            [ 1] 1776 	jrugt 3$
      009A55 97               [ 4] 1777 	ret 
      001EFE                       1778 3$: _vars VSIZE
      009A56 27 81            [ 2]    1     sub sp,#VSIZE 
      009A58 CE 00 1B         [ 2] 1779 	ldw x,txtbgn 
      009A58 88 CD            [ 2] 1780 	ldw (LN_PTR,sp),x 
      009A5A 98               [ 2] 1781 	ldw x,(x) 
      009A5B 8C 11            [ 2] 1782 	ldw (FIRST,sp),x ; list from first line 
      009A5D 01 27 03         [ 2] 1783 	ldw x,#MAX_LINENO ; biggest line number 
      009A60 CC 97            [ 2] 1784 	ldw (LAST,sp),x 
      009A62 25 84 81         [ 4] 1785 	call next_token 
      009A65 A1 84            [ 1] 1786 	cp a,#TK_INTGR
      009A65 A6 06            [ 1] 1787 	jreq start_from 
      001F14                       1788 is_minus: 	
      009A67 CD 9A            [ 1] 1789 	cp a,#TK_MINUS 
      009A69 58 27            [ 1] 1790 	jreq end_at_line
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      009A6A                       1791 	_unget_token 
      009A6A 4B 00 CD 9C C5   [ 1]    1      mov in,in.saved  
      009A6F 4D 27            [ 2] 1792 	jra list_loop 
      001F1F                       1793 start_from:	 
      009A71 12 0C 01         [ 4] 1794 	call get_int24
      009A74 CD 98            [ 2] 1795 	ldw (FIRST,sp),x	
      001F24                       1796 lines_skip:
      009A76 8C A1            [ 2] 1797 	pushw y 
      009A78 08               [ 1] 1798 	clr a 
      009A79 27 F1 A1         [ 4] 1799 	call search_lineno 
      009A7C 07               [ 2] 1800 	tnzw x 
      009A7D 27 05            [ 1] 1801 	jrne 1$
      009A7F 55               [ 1] 1802 	ldw x,y 
      009A80 00 04            [ 2] 1803 1$:	popw y 
      009A82 00 02            [ 2] 1804 	ldw (LN_PTR,sp),x 
      009A84 84 81 0C         [ 4] 1805 	call next_token 
      009A86 A1 11            [ 1] 1806 	cp a,#TK_MINUS 
      009A86 CD 9A            [ 1] 1807 	jreq end_at_line 
      009A88 65 A1            [ 2] 1808 	ldw x,(FIRST,sp)
      009A8A 01 27            [ 2] 1809 	ldw (LAST,sp),x 
      009A8C 03 CC            [ 2] 1810 	jra list_loop 
      001F3F                       1811 end_at_line:
                                   1812 ; expect ending line# 
      009A8E 97 25 90         [ 4] 1813     call next_token 
      009A91 F6 93            [ 1] 1814 	cp a,#TK_INTGR
      009A93 EE 01            [ 1] 1815 	jreq 1$
      001F46                       1816 	_unget_token 
      009A95 72 A9 00 03 C3   [ 1]    1      mov in,in.saved  
      009A9A 00 21            [ 2] 1817 	jra list_loop
      001F4D                       1818 1$:
      009A9C 23 05 A6         [ 4] 1819 	call get_int24 
      009A9F 0A CC            [ 2] 1820 	ldw (LAST,sp),x 
                                   1821 ; print loop
      001F52                       1822 list_loop:
      009AA1 97 27            [ 2] 1823 	ldw x,(LN_PTR,sp)
      009AA3 5D 27            [ 1] 1824 	ld a,(2,x) 
      009AA5 F8 A6 03         [ 4] 1825 	call prt_basic_line
      009AA8 42 CF            [ 2] 1826 	ldw x,(LN_PTR,sp)
      009AAA 00 0E            [ 1] 1827 	ld a,(2,x)
      009AAC AE 16 68         [ 1] 1828 	ld acc8,a 
      009AAF 72 B0 00 0E      [ 1] 1829 	clr acc16 
      009AB3 81 BB 00 0D      [ 2] 1830 	addw x,acc16
      009AB4 C3 00 1D         [ 2] 1831 	cpw x,txtend 
      009AB4 52 01            [ 1] 1832 	jrpl list_exit
      009AB6 0F 01            [ 2] 1833 	ldw (LN_PTR,sp),x
      009AB8 CD               [ 2] 1834 	ldw x,(x)
      009AB9 98 8C            [ 2] 1835 	cpw x,(LAST,sp)  
      009ABB 4D 26            [ 1] 1836 	jrsle list_loop
      001F74                       1837 list_exit:
      009ABD 03 CC 9B 66 A1   [ 1] 1838 	mov in,count 
      009AC2 10 27 06         [ 2] 1839 	ldw x,#pad 
      009AC5 A1 11 26         [ 2] 1840 	ldw basicptr,x 
      001F7F                       1841 	_drop VSIZE 
      009AC8 05 03            [ 2]    1     addw sp,#VSIZE 
      009ACA 01 1E 6C         [ 4] 1842 	call program_info
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      009ACB 72 0D 00 22 06   [ 2] 1843 	btjf flags,#FLN_REJECTED,9$
      009ACB CD 98 8C         [ 2] 1844 	ldw x,#LINES_REJECTED
      009ACE CD 09 5C         [ 4] 1845 	call puts
      001F8F                       1846 9$: 
      009ACE 4D               [ 4] 1847 	ret
      009ACF 26 03 CC 97 25 4E 47  1848 LINES_REJECTED: .asciz "WARNING: lines missing in this program.\n"
             3A 20 6C 69 6E 65 73
             20 6D 69 73 73 69 6E
             67 20 69 6E 20 74 68
             69 73 20 70 72 6F 67
             72 61 6D 2E 0A 00
                                   1849 
                                   1850 ;--------------------------
                                   1851 ; BASIC: EDIT label 
                                   1852 ;  copy program in FLASH 
                                   1853 ;  to RAM for edition 
                                   1854 ;-------------------------
      009AD4                       1855 cmd_edit:
      009AD4 A1 81 26         [ 4] 1856 	call cmd_line_only
      009AD7 0C FE            [ 1] 1857 	ld a,#TK_LABEL 
      009AD9 72 5C 00         [ 4] 1858 	call expect  
      009ADC 02               [ 2] 1859 	pushw x 
      009ADD 72 5C 00         [ 4] 1860 	call skip_string
      009AE0 02               [ 2] 1861 	popw x 
      009AE1 FD 20 70         [ 4] 1862 	call search_program 
      009AE4 26 06            [ 1] 1863     jrne 1$ 
      009AE4 A1 84 26         [ 2] 1864 	ldw x,#ERR_NO_PROGRAM
      009AE7 05 CD 98         [ 2] 1865 	jp tb_error 
      009AEA BE 20            [ 2] 1866 1$: pushw y 
      009AEC 67 93            [ 1] 1867 	ldw y,x ; source address 
      009AED 1D 00 04         [ 2] 1868 	subw x,#4
      009AED A1 05            [ 2] 1869 	ldw x,(2,x) ; program size 
      009AEF 26 05 CD         [ 2] 1870 	addw x,#4 
      009AF2 9A 86 20         [ 2] 1871 	ldw acc16,x  ; bytes to copy 
      009AF5 07 00 8C         [ 2] 1872 	ldw x,#rsign ; destination address 
      009AF6 72 A2 00 04      [ 2] 1873 	subw y,#4 
      009AF6 A1 85 26         [ 4] 1874 	call move  
      009AF9 08 CD 98         [ 2] 1875 	ldw x,#free_ram 
      009AFC B4 00 1B         [ 2] 1876 	ldw txtbgn,x 
      009AFD 72 BB 00 8E      [ 2] 1877 	addw x,rsize  
      009AFD F6 EE 01         [ 2] 1878 	ldw txtend,x
      009B00 20 52            [ 2] 1879 	popw y  
      009B02 81               [ 4] 1880 	ret 
                                   1881 
                                   1882 ;--------------------------
                                   1883 ; decompile line from token list
                                   1884 ; and print it. 
                                   1885 ; input:
                                   1886 ;   A       stop at this position 
                                   1887 ;   X 		pointer at line
                                   1888 ; output:
                                   1889 ;   none 
                                   1890 ;--------------------------	
      001FFA                       1891 prt_basic_line:
      009B02 A1 03            [ 2] 1892 	pushw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      009B04 26 1D 90         [ 1] 1893 	ld count,a 
      009B07 89 89            [ 1] 1894 	ld a,(2,x)
      009B09 CD 98 A5         [ 1] 1895 	cp a,count 
      009B0C 85 CD            [ 1] 1896 	jrpl 1$ 
      009B0E 94 19 AB         [ 1] 1897 	ld count,a 
      009B11 05 CD 9E         [ 2] 1898 1$:	ldw basicptr,x 
      009B14 01 5D 26 04      [ 2] 1899 	ldw y,#tib  
      009B18 90 85 20         [ 4] 1900 	call decompile 
      009B1B 30 09 5C         [ 4] 1901 	call puts 
      009B1C A6 0D            [ 1] 1902 	ld a,#CR 
      009B1C 90 85 CD         [ 4] 1903 	call putc 
      009B1F 9D C7            [ 2] 1904 	popw y 
      009B21 20               [ 4] 1905 	ret 
                                   1906 
                                   1907 
                                   1908 ;---------------------------------
                                   1909 ; BASIC: PRINT|? arg_list 
                                   1910 ; print values from argument list
                                   1911 ;----------------------------------
                           000001  1912 	CCOMMA=1
                           000001  1913 	VSIZE=1
      00201E                       1914 print:
      00201E                       1915 	_vars VSIZE 
      009B22 31 01            [ 2]    1     sub sp,#VSIZE 
      009B23                       1916 reset_comma:
      009B23 A1 82            [ 1] 1917 	clr (CCOMMA,sp)
      002022                       1918 prt_loop:
      009B25 26 0E FE         [ 4] 1919 	call next_token
      009B28 72 5C            [ 1] 1920 	cp a,#CMD_END 
      009B2A 00 02            [ 1] 1921 	jrult 0$
      009B2C 72 5C            [ 1] 1922 	cp a,#TK_COLON 
      009B2E 00 02            [ 1] 1923 	jreq 0$
      009B30 FD 5F            [ 1] 1924 	cp a,#TK_CMD
      009B32 02 20            [ 1] 1925 	jrne 10$
      002031                       1926 0$:
      002031                       1927 	_unget_token 
      009B34 1F 00 03 00 01   [ 1]    1      mov in,in.saved  
      009B35 20 63            [ 2] 1928 	jra 8$ 
      002038                       1929 10$:	
      009B35 A1 06            [ 1] 1930 	cp a,#TK_QSTR
      009B37 26 13            [ 1] 1931 	jreq 1$
      009B39 CD 9B            [ 1] 1932 	cp a,#TK_CHAR 
      009B3B AC A6            [ 1] 1933 	jreq 2$ 
      009B3D 07 CD            [ 1] 1934 	cp a,#TK_CFUNC 
      009B3F 9A 58            [ 1] 1935 	jreq 3$
      009B41 90 F6            [ 1] 1936 	cp a,#TK_COMMA 
      009B43 93 EE            [ 1] 1937 	jreq 4$
      009B45 01 72            [ 1] 1938 	cp a,#TK_SHARP 
      009B47 A9 00            [ 1] 1939 	jreq 5$
      009B49 03 20            [ 2] 1940 	jra 7$ 
      00204E                       1941 1$:	; print string 
      009B4B 08 09 5C         [ 4] 1942 	call puts
      009B4C 5C               [ 1] 1943 	incw x
      009B4C 55 00 04 00      [ 2] 1944 	subw x,basicptr 
      009B50 02 4F 20         [ 2] 1945 	ldw in.w,x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      009B53 12 C5            [ 2] 1946 	jra reset_comma
      009B54                       1947 2$:	; print character 
      009B54 0D 01 27         [ 4] 1948 	call get_char 
      009B57 03 CD 82         [ 4] 1949 	call putc 
      009B5A 95 BD            [ 2] 1950 	jra reset_comma 
      009B5B                       1951 3$: ; print character function value  	
      002063                       1952 	_get_code_addr 
      009B5B 72               [ 2]    1         ldw x,(x)
      009B5C A2 00 03 90      [ 1]    2         inc in 
      009B60 F7 90 EF 01      [ 1]    3         inc in 
      009B64 A6               [ 4] 1953 	call (x)
      009B65 84 08 FF         [ 4] 1954 	call putc
      009B66 20 AE            [ 2] 1955 	jra reset_comma 
      002072                       1956 4$: ; set comma state 
      009B66 5B 01            [ 1] 1957 	cpl (CCOMMA,sp)
      009B68 81 AC            [ 2] 1958 	jra prt_loop   
      009B69                       1959 5$: ; # character must be followed by an integer   
      009B69 52 01 CD         [ 4] 1960 	call next_token
      009B6C 9A B4            [ 1] 1961 	cp a,#TK_INTGR 
      009B6E 4D 27            [ 1] 1962 	jreq 6$
      009B70 38 16 A5         [ 2] 1963 	jp syntax_error 
      009B71                       1964 6$: ; set tab width
      009B71 CD 98 8C         [ 4] 1965 	call get_int24 
      009B74 6B               [ 1] 1966 	ld a,xl 
      009B75 01 A4            [ 1] 1967 	and a,#15 
      009B77 30 A1 20         [ 1] 1968 	ld tab_width,a 
      009B7A 27 09            [ 2] 1969 	jra reset_comma 
      00208B                       1970 7$:	
      00208B                       1971 	_unget_token 
      009B7C A6 84 55 00 04   [ 1]    1      mov in,in.saved  
      009B81 00 02 20         [ 4] 1972 	call condition
      009B84 24               [ 1] 1973 	tnz a 
      009B85 27 05            [ 1] 1974 	jreq 8$    
      009B85 CD 9A B4         [ 4] 1975     call print_top
      009B88 4D 26            [ 2] 1976 	jra reset_comma 
      00209B                       1977 8$:
      009B8A 03 CC            [ 1] 1978 	tnz (CCOMMA,sp)
      009B8C 97 25            [ 1] 1979 	jrne 9$
      009B8E A6 0D            [ 1] 1980 	ld a,#CR 
      009B8E 7B 01 A1         [ 4] 1981     call putc 
      0020A4                       1982 9$:	_drop VSIZE 
      009B91 20 26            [ 2]    1     addw sp,#VSIZE 
      009B93 05               [ 4] 1983 	ret 
                                   1984 
                                   1985 ;----------------------
                                   1986 ; 'save_context' and
                                   1987 ; 'rest_context' must be 
                                   1988 ; called at the same 
                                   1989 ; call stack depth 
                                   1990 ; i.e. SP must have the 
                                   1991 ; save value at  
                                   1992 ; entry point of both 
                                   1993 ; routine. 
                                   1994 ;---------------------
                           000004  1995 	CTXT_SIZE=4 ; size of saved data 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



                                   1996 ;--------------------
                                   1997 ; save current BASIC
                                   1998 ; interpreter context 
                                   1999 ; on stack 
                                   2000 ;--------------------
      0020A7                       2001 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      0020A7                       2002 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      0020A7                       2003 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      0020A7                       2004 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      0020A7                       2005 save_context:
      009B94 CD 82 F9         [ 2] 2006 	ldw x,basicptr 
      009B97 20 D8            [ 2] 2007 	ldw (BPTR,sp),x
      009B99 A1 21 26         [ 1] 2008 	ld a,in 
      009B9C 05 CD            [ 1] 2009 	ld (IN,sp),a
      009B9E 83 87 20         [ 1] 2010 	ld a,count 
      009BA1 CF 06            [ 1] 2011 	ld (CNT,sp),a  
      009BA2 81               [ 4] 2012 	ret
                                   2013 
                                   2014 ;-----------------------
                                   2015 ; restore previously saved 
                                   2016 ; BASIC interpreter context 
                                   2017 ; from stack 
                                   2018 ;-------------------------
      0020B7                       2019 rest_context:
      009BA2 CD 84            [ 2] 2020 	ldw x,(BPTR,sp)
      009BA4 21 20 CA         [ 2] 2021 	ldw basicptr,x 
      009BA7 7B 05            [ 1] 2022 	ld a,(IN,sp)
      009BA7 A6 84 01         [ 1] 2023 	ld in,a
      009BA9 7B 06            [ 1] 2024 	ld a,(CNT,sp)
      009BA9 5B 01 81         [ 1] 2025 	ld count,a  
      009BAC 81               [ 4] 2026 	ret
                                   2027 
                                   2028 
                                   2029 
                                   2030 ;------------------------------------------
                                   2031 ; BASIC: INPUT [string]var[,[string]var]
                                   2032 ; input value in variables 
                                   2033 ; [string] optionally can be used as prompt 
                                   2034 ;-----------------------------------------
                           000001  2035 	CX_BPTR=1
                           000003  2036 	CX_IN=3
                           000004  2037 	CX_CNT=4
                           000005  2038 	SKIP=5
                           000005  2039 	VSIZE=5
      0020C7                       2040 input_var:
      009BAC 52 01            [ 2] 2041 	pushw y 
      0020C9                       2042 	_vars VSIZE 
      009BAE CD 9B            [ 2]    1     sub sp,#VSIZE 
      0020CB                       2043 input_loop:
      009BB0 69 4D            [ 1] 2044 	clr (SKIP,sp)
      009BB2 27 2D 0C         [ 4] 2045 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      009BB4 A1 02            [ 1] 2046 	cp a,#TK_QSTR 
      009BB4 CD 98            [ 1] 2047 	jrne 1$ 
      009BB6 8C 6B 01         [ 4] 2048 	call puts 
      009BB9 A4               [ 1] 2049 	incw x 
      009BBA 30 A1 10 27      [ 2] 2050 	subw x,basicptr 
      009BBE 09 55 00         [ 2] 2051 	ldw in.w,x 
      009BC1 04 00            [ 1] 2052 	cpl (SKIP,sp)
      009BC3 02 A6 84         [ 4] 2053 	call next_token 
      009BC6 20 19            [ 1] 2054 1$: cp a,#TK_VAR  
      009BC8 27 03            [ 1] 2055 	jreq 2$ 
      009BC8 CD 9B 69         [ 2] 2056 	jp syntax_error
      009BCB 4D 26 03         [ 4] 2057 2$:	call get_addr
      009BCE CC 97 25         [ 2] 2058 	ldw ptr16,x 
      009BD1 0D 05            [ 1] 2059 	tnz (SKIP,sp)
      009BD1 7B 01            [ 1] 2060 	jrne 21$ 
      009BD3 A1 10 26         [ 4] 2061 	call var_name 
      009BD6 05 CD 81         [ 4] 2062 	call putc   
      0020FB                       2063 21$:
      009BD9 FE 20            [ 1] 2064 	ld a,#':
      009BDB D8 08 FF         [ 4] 2065 	call putc 
      009BDC CD 20 A7         [ 4] 2066 	call save_context 
      009BDC CD 82 1B 20      [ 1] 2067 	clr count  
      009BE0 D3 0A 61         [ 4] 2068 	call readln 
      009BE1 AE 16 68         [ 2] 2069 	ldw x,#tib 
      009BE1 5B 01 81         [ 1] 2070 	push count
      009BE4 4B 00            [ 1] 2071 	push #0 
      009BE4 52 01 CD         [ 2] 2072 	addw x,(1,sp)
      009BE7 9B               [ 1] 2073 	incw x 
      002116                       2074 	_drop 2 
      009BE8 AC 4D            [ 2]    1     addw sp,#2 
      009BEA 27 54 CD 98      [ 1] 2075 	clr in 
      009BEE 8C 6B 01         [ 4] 2076 	call get_token
      009BF1 A4 30            [ 1] 2077 	cp a,#TK_INTGR
      009BF3 A1 30            [ 1] 2078 	jreq 3$ 
      009BF5 27 09            [ 1] 2079 	cp a,#TK_MINUS
      009BF7 A6 84            [ 1] 2080 	jrne 22$
      009BF9 55 00 04         [ 4] 2081 	call get_token 
      009BFC 00 02            [ 1] 2082 	cp a,#TK_INTGR 
      009BFE 20 40            [ 1] 2083 	jreq 23$
      009C00                       2084 22$:
      009C00 CD 9B AC         [ 4] 2085 	call rest_context 
      009C03 4D 26 03         [ 2] 2086 	jp syntax_error
      002134                       2087 23$:
      009C06 CC 97 25         [ 4] 2088 	call neg_acc24	
      009C09                       2089 3$: 
      009C09 CD 82 38         [ 1] 2090 	ld a,acc24 
      009C0C 90 F6 93         [ 2] 2091 	ldw x,acc16 
      009C0F EE 01 72 A9      [ 4] 2092 	ld [ptr16],a
      009C13 00 03 4D 2B      [ 1] 2093 	inc ptr8  
      009C17 08 26 0C 35      [ 5] 2094 	ldw [ptr16],x 
      009C1B 02 00 0F         [ 4] 2095 	call rest_context
      009C1E 20 0A 0C         [ 4] 2096 	call next_token 
      009C20 A1 08            [ 1] 2097 	cp a,#TK_COMMA
      009C20 35 04            [ 1] 2098 	jrne 4$ 
      009C22 00 0F 20         [ 2] 2099 	jp input_loop
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      002156                       2100 4$:
      009C25 04 00            [ 1] 2101 	cp a,#TK_NONE 
      009C26 27 07            [ 1] 2102 	jreq input_exit  
      009C26 35 01            [ 1] 2103 	cp a,#TK_COLON 
      009C28 00 0F            [ 1] 2104     jreq input_exit 
      009C2A CC 16 A5         [ 2] 2105 	jp syntax_error 
      002161                       2106 input_exit:
      002161                       2107 	_drop VSIZE 
      009C2A 5F C6            [ 2]    1     addw sp,#VSIZE 
      009C2C 00 0F            [ 2] 2108 	popw y 
      009C2E 14               [ 4] 2109 	ret 
                                   2110 
                                   2111 
                                   2112 ;---------------------
                                   2113 ; BASIC: REM | ' 
                                   2114 ; skip comment to end of line 
                                   2115 ;---------------------- 
      002166                       2116 remark::
      009C2F 01 27 03 53 A6   [ 1] 2117 	mov in,count 
      009C34 FF               [ 4] 2118  	ret 
                                   2119 
                                   2120 
                                   2121 ;---------------------
                                   2122 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2123 ; read in loop 'addr'  
                                   2124 ; apply & 'mask' to value 
                                   2125 ; loop while result==0.  
                                   2126 ; 'xor_mask' is used to 
                                   2127 ; invert the wait logic.
                                   2128 ; i.e. loop while not 0.
                                   2129 ;---------------------
                           000001  2130 	XMASK=1 
                           000002  2131 	MASK=2
                           000003  2132 	ADDR=3
                           000004  2133 	VSIZE=4
      00216C                       2134 wait: 
      00216C                       2135 	_vars VSIZE
      009C35 72 A2            [ 2]    1     sub sp,#VSIZE 
      009C37 00 03            [ 1] 2136 	clr (XMASK,sp) 
      009C39 90 F7 90         [ 4] 2137 	call arg_list 
      009C3C EF 01            [ 1] 2138 	cp a,#2
      009C3E A6 84            [ 1] 2139 	jruge 0$
      009C40 CC 16 A5         [ 2] 2140 	jp syntax_error 
      009C40 5B 01            [ 1] 2141 0$:	cp a,#3
      009C42 81 0C            [ 1] 2142 	jrult 1$
      009C43                       2143 	_xpop  ; xor mask 
      009C43 4B 00            [ 1]    1     ld a,(y)
      009C45 CD               [ 1]    2     ldw x,y 
      009C46 98 8C            [ 2]    3     ldw x,(1,x)
      009C48 4D 27 25 A1      [ 2]    4     addw y,#CELL_SIZE 
      009C4C 87               [ 1] 2144 	ld a,xl 
      009C4D 26 04            [ 1] 2145 	ld (XMASK,sp),a 
      00218A                       2146 1$: _xpop ; mask
      009C4F 03 01            [ 1]    1     ld a,(y)
      009C51 20               [ 1]    2     ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      009C52 F2 01            [ 2]    3     ldw x,(1,x)
      009C53 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C53 A1               [ 1] 2147     ld a,xl  
      009C54 06 26            [ 1] 2148 	ld (MASK,sp),a 
      002196                       2149 	_xpop ; address 
      009C56 0A CD            [ 1]    1     ld a,(y)
      009C58 9C               [ 1]    2     ldw x,y 
      009C59 C5 A6            [ 2]    3     ldw x,(1,x)
      009C5B 07 CD 9A 58      [ 2]    4     addw y,#CELL_SIZE 
      009C5F 20               [ 1] 2150 2$:	ld a,(x)
      009C60 08 55            [ 1] 2151 	and a,(MASK,sp)
      009C62 00 04            [ 1] 2152 	xor a,(XMASK,sp)
      009C64 00 02            [ 1] 2153 	jreq 2$ 
      0021A6                       2154 	_drop VSIZE 
      009C66 CD 9B            [ 2]    1     addw sp,#VSIZE 
      009C68 E4               [ 4] 2155 	ret 
                                   2156 
                                   2157 ;---------------------
                                   2158 ; BASIC: BSET addr,mask
                                   2159 ; set bits at 'addr' corresponding 
                                   2160 ; to those of 'mask' that are at 1.
                                   2161 ; arguments:
                                   2162 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2163 ;   mask        mask|addr
                                   2164 ; output:
                                   2165 ;	none 
                                   2166 ;--------------------------
      009C69                       2167 bit_set:
      009C69 0D 01 27         [ 4] 2168 	call arg_list 
      009C6C 03 CD            [ 1] 2169 	cp a,#2	 
      009C6E 82 7A            [ 1] 2170 	jreq 1$ 
      009C70 CC 16 A5         [ 2] 2171 	jp syntax_error
      0021B3                       2172 1$: 
      0021B3                       2173 	_xpop ; mask 
      009C70 5B 01            [ 1]    1     ld a,(y)
      009C72 81               [ 1]    2     ldw x,y 
      009C73 EE 01            [ 2]    3     ldw x,(1,x)
      009C73 CD 9C 43 4D      [ 2]    4     addw y,#CELL_SIZE 
      009C77 27               [ 1] 2174 	ld a,xl
      009C78 4B               [ 1] 2175 	push a  
      0021BE                       2176 	_xpop ; addr  
      009C79 CD 98            [ 1]    1     ld a,(y)
      009C7B 8C               [ 1]    2     ldw x,y 
      009C7C 4D 27            [ 2]    3     ldw x,(1,x)
      009C7E 43 A1 88 27      [ 2]    4     addw y,#CELL_SIZE 
      009C82 07               [ 1] 2177 	pop a 
      009C83 55               [ 1] 2178 	or a,(x)
      009C84 00               [ 1] 2179 	ld (x),a
      009C85 04               [ 4] 2180 	ret 
                                   2181 
                                   2182 ;---------------------
                                   2183 ; BASIC: BRES addr,mask
                                   2184 ; reset bits at 'addr' corresponding 
                                   2185 ; to those of 'mask' that are at 1.
                                   2186 ; arguments:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



                                   2187 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2188 ;   mask	    ~mask&*addr  
                                   2189 ; output:
                                   2190 ;	none 
                                   2191 ;--------------------------
      0021CB                       2192 bit_reset:
      009C86 00 02 20         [ 4] 2193 	call arg_list 
      009C89 38 CD            [ 1] 2194 	cp a,#2  
      009C8B 9C 43            [ 1] 2195 	jreq 1$ 
      009C8D 4D 26 03         [ 2] 2196 	jp syntax_error
      0021D5                       2197 1$: 
      0021D5                       2198 	_xpop ; mask 
      009C90 CC 97            [ 1]    1     ld a,(y)
      009C92 25               [ 1]    2     ldw x,y 
      009C93 EE 01            [ 2]    3     ldw x,(1,x)
      009C93 90 F6 93 EE      [ 2]    4     addw y,#CELL_SIZE 
      009C97 01               [ 1] 2199 	ld a,xl 
      009C98 72               [ 1] 2200 	cpl a
      009C99 A9               [ 1] 2201 	push a  
      0021E1                       2202 	_xpop ; addr  
      009C9A 00 03            [ 1]    1     ld a,(y)
      009C9C C7               [ 1]    2     ldw x,y 
      009C9D 00 0D            [ 2]    3     ldw x,(1,x)
      009C9F CF 00 0E 90      [ 2]    4     addw y,#CELL_SIZE 
      009CA3 F6               [ 1] 2203 	pop a 
      009CA4 93               [ 1] 2204 	and a,(x)
      009CA5 EE               [ 1] 2205 	ld (x),a 
      009CA6 01               [ 4] 2206 	ret 
                                   2207 
                                   2208 ;---------------------
                                   2209 ; BASIC: BTOGL addr,mask
                                   2210 ; toggle bits at 'addr' corresponding 
                                   2211 ; to those of 'mask' that are at 1.
                                   2212 ; arguments:
                                   2213 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2214 ;   mask	    mask^*addr  
                                   2215 ; output:
                                   2216 ;	none 
                                   2217 ;--------------------------
      0021EE                       2218 bit_toggle:
      009CA7 72 A9 00         [ 4] 2219 	call arg_list 
      009CAA 03 C4            [ 1] 2220 	cp a,#2 
      009CAC 00 0D            [ 1] 2221 	jreq 1$ 
      009CAE 02 C4 00         [ 2] 2222 	jp syntax_error
      0021F8                       2223 1$: _xpop ; mask 
      009CB1 0E 02            [ 1]    1     ld a,(y)
      009CB3 C4               [ 1]    2     ldw x,y 
      009CB4 00 0F            [ 2]    3     ldw x,(1,x)
      009CB6 02 72 A2 00      [ 2]    4     addw y,#CELL_SIZE 
      009CBA 03               [ 1] 2224 	ld a,xl
      009CBB 90               [ 1] 2225 	push a 
      002203                       2226 	_xpop  ; addr  
      009CBC F7 90            [ 1]    1     ld a,(y)
      009CBE EF               [ 1]    2     ldw x,y 
      009CBF 01 20            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      009CC1 B7 A6 84 81      [ 2]    4     addw y,#CELL_SIZE 
      009CC5 84               [ 1] 2227 	pop a 
      009CC5 52               [ 1] 2228 	xor a,(x)
      009CC6 02               [ 1] 2229 	ld (x),a 
      009CC7 CD               [ 4] 2230 	ret 
                                   2231 
                                   2232 
                                   2233 ;---------------------
                                   2234 ; BASIC: BTEST(addr,bit)
                                   2235 ; return bit value at 'addr' 
                                   2236 ; bit is in range {0..7}.
                                   2237 ; arguments:
                                   2238 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2239 ;   bit 	    bit position {0..7}  
                                   2240 ; output:
                                   2241 ;	A:X       bit value  
                                   2242 ;--------------------------
      002210                       2243 bit_test:
      009CC8 9C 73 4D         [ 4] 2244 	call func_args 
      009CCB 27 69            [ 1] 2245 	cp a,#2
      009CCD CD 98            [ 1] 2246 	jreq 0$
      009CCF 8C A1 89         [ 2] 2247 	jp syntax_error
      00221A                       2248 0$:	
      00221A                       2249 	_xpop 
      009CD2 27 0B            [ 1]    1     ld a,(y)
      009CD4 A1               [ 1]    2     ldw x,y 
      009CD5 8A 27            [ 2]    3     ldw x,(1,x)
      009CD7 07 55 00 04      [ 2]    4     addw y,#CELL_SIZE 
      009CDB 00               [ 1] 2250 	ld a,xl 
      009CDC 02 20            [ 1] 2251 	and a,#7
      009CDE 55               [ 1] 2252 	push a   
      009CDF 6B 02            [ 1] 2253 	ld a,#1 
      009CE1 CD 9C            [ 1] 2254 1$: tnz (1,sp)
      009CE3 73 A1            [ 1] 2255 	jreq 2$
      009CE5 84               [ 1] 2256 	sll a 
      009CE6 27 03            [ 1] 2257 	dec (1,sp)
      009CE8 CC 97            [ 2] 2258 	jra 1$
      009CEA 25 01            [ 1] 2259 2$: ld (1,sp),a  
      009CEB                       2260 	_xpop ; address  
      009CEB 90 F6            [ 1]    1     ld a,(y)
      009CED 93               [ 1]    2     ldw x,y 
      009CEE EE 01            [ 2]    3     ldw x,(1,x)
      009CF0 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009CF4 C7               [ 1] 2261 	pop a 
      009CF5 00               [ 1] 2262 	and a,(x)
      009CF6 0D CF            [ 1] 2263 	jreq 3$
      009CF8 00 0E            [ 1] 2264 	ld a,#1 
      009CFA 90               [ 1] 2265 3$:	clrw x 
      009CFB F6               [ 1] 2266 	ld xl,a
      009CFC 93               [ 1] 2267 	clr a  
      009CFD EE               [ 4] 2268 	ret
                                   2269 
                                   2270 ;--------------------
                                   2271 ; BASIC: POKE addr,byte
                                   2272 ; put a byte at addr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



                                   2273 ;--------------------
      002247                       2274 poke:
      009CFE 01 72 A9         [ 4] 2275 	call arg_list 
      009D01 00 03            [ 1] 2276 	cp a,#2
      009D03 6B 01            [ 1] 2277 	jreq 1$
      009D05 7B 02 A1         [ 2] 2278 	jp syntax_error
      002251                       2279 1$:	
      002251                       2280 	_xpop ; byte   
      009D08 8A 27            [ 1]    1     ld a,(y)
      009D0A 10               [ 1]    2     ldw x,y 
      009D0B EE 01            [ 2]    3     ldw x,(1,x)
      009D0B 7B 01 CA 00      [ 2]    4     addw y,#CELL_SIZE 
      009D0F 0D               [ 1] 2281     ld a,xl 
      009D10 02               [ 1] 2282 	push a 
      00225C                       2283 	_xpop ; address 
      009D11 CA 00            [ 1]    1     ld a,(y)
      009D13 0E               [ 1]    2     ldw x,y 
      009D14 02 CA            [ 2]    3     ldw x,(1,x)
      009D16 00 0F 02 20      [ 2]    4     addw y,#CELL_SIZE 
      009D1A 0E               [ 1] 2284 	pop a 
      009D1B F7               [ 1] 2285 	ld (x),a 
      009D1B 7B               [ 4] 2286 	ret 
                                   2287 
                                   2288 ;-----------------------
                                   2289 ; BASIC: PEEK(addr)
                                   2290 ; get the byte at addr 
                                   2291 ; input:
                                   2292 ;	none 
                                   2293 ; output:
                                   2294 ;	X 		value 
                                   2295 ;-----------------------
      002268                       2296 peek:
      009D1C 01 C8 00         [ 4] 2297 	call func_args
      009D1F 0D 02            [ 1] 2298 	cp a,#1 
      009D21 C8 00            [ 1] 2299 	jreq 1$
      009D23 0E 02 C8         [ 2] 2300 	jp syntax_error
      002272                       2301 1$: _xpop ; address  
      009D26 00 0F            [ 1]    1     ld a,(y)
      009D28 02               [ 1]    2     ldw x,y 
      009D29 72 A2            [ 2]    3     ldw x,(1,x)
      009D2B 00 03 90 F7      [ 2]    4     addw y,#CELL_SIZE 
      009D2F 90 EF 01         [ 1] 2302 	ld farptr,a 
      009D32 20 99 A6         [ 2] 2303 	ldw ptr16,x 
      009D35 84 5B 02 81      [ 5] 2304 	ldf a,[farptr]
      009D39 5F               [ 1] 2305 	clrw x 
      009D39 35               [ 1] 2306 	ld xl,a 
      009D3A 10               [ 1] 2307 	clr a 
      009D3B 00               [ 4] 2308 	ret 
                                   2309 
                                   2310 ;---------------------------
                                   2311 ; BASIC IF expr : instructions
                                   2312 ; evaluate expr and if true 
                                   2313 ; execute instructions on same line. 
                                   2314 ;----------------------------
      002289                       2315 if: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      009D3C 0B 81 45         [ 4] 2316 	call condition  
      009D3E                       2317 	_xpop 
      009D3E 35 0A            [ 1]    1     ld a,(y)
      009D40 00               [ 1]    2     ldw x,y 
      009D41 0B 81            [ 2]    3     ldw x,(1,x)
      009D43 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D43 4F               [ 1] 2318 	tnz  a  
      009D44 AE 16            [ 1] 2319 	jrne 9$
      009D46 68               [ 2] 2320 	tnzw x 
      009D47 72 B0            [ 1] 2321 	jrne 9$  
                                   2322 ;skip to next line
      009D49 00 33 81 00 01   [ 1] 2323 	mov in,count
      009D4C                       2324 	_drop 2 
      009D4C 3B 00            [ 2]    1     addw sp,#2 
      009D4E 0B AE 9F         [ 2] 2325 	jp next_line
      009D51 2B               [ 4] 2326 9$:	ret 
                                   2327 
                                   2328 ;------------------------
                                   2329 ; BASIC: FOR var=expr 
                                   2330 ; set variable to expression 
                                   2331 ; leave variable address 
                                   2332 ; on stack and set
                                   2333 ; FLOOP bit in 'flags'
                                   2334 ;-----------------
                           000001  2335 	RETL1=1 ; return address  
                           000003  2336 	FSTEP=3  ; variable increment int24
                           000006  2337 	LIMIT=6 ; loop limit, int24  
                           000009  2338 	CVAR=9   ; control variable 
                           00000B  2339 	INW=11   ;  in.w saved
                           00000D  2340 	BPTR=13 ; baseptr saved
                           00000D  2341 	VSIZE=13  
      0022A6                       2342 for: ; { -- var_addr }
      009D52 CD               [ 2] 2343 	popw x ; call return address 
      0022A7                       2344 	_vars VSIZE 
      009D53 89 DC            [ 2]    1     sub sp,#VSIZE 
      009D55 CE               [ 2] 2345 	pushw x  ; RETL1 
      009D56 00 1C            [ 1] 2346 	ld a,#TK_VAR 
      009D58 35 10 00         [ 4] 2347 	call expect
      009D5B 0B CD 98         [ 4] 2348 	call get_addr
      009D5E D4 32            [ 2] 2349 	ldw (CVAR,sp),x  ; control variable 
      009D60 00 0B AE         [ 4] 2350 	call let_eval 
      009D63 9F 3D CD 89      [ 1] 2351 	bset flags,#FLOOP 
      009D67 DC CE 00         [ 4] 2352 	call next_token 
      009D6A 1E 72            [ 1] 2353 	cp a,#TK_CMD 
      009D6C B0 00            [ 1] 2354 	jreq 1$
      009D6E 1C CD 98         [ 2] 2355 	jp syntax_error
      0022C5                       2356 1$:  
      0022C5                       2357 	_get_code_addr
      009D71 D4               [ 2]    1         ldw x,(x)
      009D72 AE 9F 4E CD      [ 1]    2         inc in 
      009D76 89 DC 81 01      [ 1]    3         inc in 
      009D79 A3 22 D6         [ 2] 2358 	cpw x,#to   
      009D79 CD 9D            [ 1] 2359 	jreq to
      009D7B 43 A6 03         [ 2] 2360 	jp syntax_error 
                                   2361 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



                                   2362 ;-----------------------------------
                                   2363 ; BASIC: TO expr 
                                   2364 ; second part of FOR loop initilization
                                   2365 ; leave limit on stack and set 
                                   2366 ; FTO bit in 'flags'
                                   2367 ;-----------------------------------
      0022D6                       2368 to: ; { var_addr -- var_addr limit step }
      009D7E 62 CF 00 21 4F   [ 2] 2369 	btjt flags,#FLOOP,1$
      009D83 81 16 A5         [ 2] 2370 	jp syntax_error
      009D84 CD 1B 2C         [ 4] 2371 1$: call expression   
      009D84 CD 98            [ 1] 2372 	cp a,#TK_INTGR 
      009D86 8C A1            [ 1] 2373 	jreq 2$ 
      009D88 85 27 0C         [ 2] 2374 	jp syntax_error
      0022E8                       2375 2$: _xpop
      009D8B A1 05            [ 1]    1     ld a,(y)
      009D8D 27               [ 1]    2     ldw x,y 
      009D8E 03 CC            [ 2]    3     ldw x,(1,x)
      009D90 97 25 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D92 6B 06            [ 1] 2376 	ld (LIMIT,sp),a 
      009D92 CD 9A            [ 2] 2377 	ldw (LIMIT+1,sp),x
      009D94 86 20 03         [ 4] 2378 	call next_token
      009D97 A1 00            [ 1] 2379 	cp a,#TK_NONE  
      009D97 CD 98            [ 1] 2380 	jreq 4$ 
      009D99 B4 80            [ 1] 2381 	cp a,#TK_CMD
      009D9A 26 0E            [ 1] 2382 	jrne 3$
      002300                       2383 	_get_code_addr
      009D9A CF               [ 2]    1         ldw x,(x)
      009D9B 00 1A CD 98      [ 1]    2         inc in 
      009D9F 8C A1 32 27      [ 1]    3         inc in 
      009DA3 03 CC 97         [ 2] 2384 	cpw x,#step 
      009DA6 25 0E            [ 1] 2385 	jreq step
      009DA7                       2386 3$:	
      00230E                       2387 	_unget_token   	 
      009DA7 CD 9C C5 A1 84   [ 1]    1      mov in,in.saved  
      002313                       2388 4$:	
      009DAC 27 03            [ 1] 2389 	clr (FSTEP,sp) 
      009DAE CC 97 25         [ 2] 2390 	ldw x,#1   ; default step  
      009DB1 1F 04            [ 2] 2391 	ldw (FSTEP+1,sp),x 
      009DB1 90 F6            [ 2] 2392 	jra store_loop_addr 
                                   2393 
                                   2394 
                                   2395 ;----------------------------------
                                   2396 ; BASIC: STEP expr 
                                   2397 ; optional third par of FOR loop
                                   2398 ; initialization. 	
                                   2399 ;------------------------------------
      00231C                       2400 step: ; {var limit -- var limit step}
      009DB3 93 EE 01 72 A9   [ 2] 2401 	btjt flags,#FLOOP,1$
      009DB8 00 03 A5         [ 2] 2402 	jp syntax_error
      009DBA CD 1B 2C         [ 4] 2403 1$: call expression 
      009DBA 72 C7            [ 1] 2404 	cp a,#TK_INTGR
      009DBC 00 1A            [ 1] 2405 	jreq 2$
      009DBE 72 5C 00         [ 2] 2406 	jp syntax_error
      00232E                       2407 2$:	
      00232E                       2408 	_xpop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      009DC1 1B 72            [ 1]    1     ld a,(y)
      009DC3 CF               [ 1]    2     ldw x,y 
      009DC4 00 1A            [ 2]    3     ldw x,(1,x)
      009DC6 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009DC7 6B 03            [ 1] 2409 	ld (FSTEP,sp),a 
      009DC7 F6 A4            [ 2] 2410 	ldw (FSTEP+1,sp),x ; step
                                   2411 ; if step < 0 decrement LIMIT 
      009DC9 0F               [ 1] 2412 	tnz a
      009DCA A0 03            [ 1] 2413 	jrpl store_loop_addr 
      009DCC 88 4B            [ 1] 2414 	ld a,(LIMIT,sp)
      009DCE 00 72            [ 2] 2415 	ldw x,(LIMIT+1,sp)
      009DD0 FB 01 F6         [ 2] 2416 	subw x,#1 
      009DD3 EE 01            [ 1] 2417 	sbc a,#0 
      009DD5 5B 02            [ 1] 2418 	ld (LIMIT,sp),a 
      009DD7 81 07            [ 2] 2419 	ldw (LIMIT+1,sp),x 
                                   2420 ; leave loop back entry point on cstack 
                                   2421 ; cstack is 1 call deep from interpreter
      009DD8                       2422 store_loop_addr:
      009DD8 AE 40 00         [ 2] 2423 	ldw x,basicptr
      009DDB 35 08            [ 2] 2424 	ldw (BPTR,sp),x 
      009DDD 00 0F A3         [ 2] 2425 	ldw x,in.w 
      009DE0 47 F8            [ 2] 2426 	ldw (INW,sp),x   
      009DE2 24 17 F6 26      [ 1] 2427 	bres flags,#FLOOP 
      009DE6 0C 5C 72 5A      [ 1] 2428 	inc loop_depth  
      009DEA 00               [ 4] 2429 	ret 
                                   2430 
                                   2431 ;--------------------------------
                                   2432 ; BASIC: NEXT var 
                                   2433 ; FOR loop control 
                                   2434 ; increment variable with step 
                                   2435 ; and compare with limit 
                                   2436 ; loop if threshold not crossed.
                                   2437 ; else stack. 
                                   2438 ; and decrement 'loop_depth' 
                                   2439 ;--------------------------------
      00235E                       2440 next: ; {var limit step retl1 -- [var limit step ] }
      009DEB 0F 26 F6 1D      [ 1] 2441 	tnz loop_depth 
      009DEF 00 08            [ 1] 2442 	jrne 1$ 
      009DF1 20 09 F6         [ 2] 2443 	jp syntax_error 
      002367                       2444 1$: 
      009DF4 5C 4D            [ 1] 2445 	ld a,#TK_VAR 
      009DF6 26 FB 5A         [ 4] 2446 	call expect
      009DF9 20 E0 5F         [ 4] 2447 	call get_addr 
                                   2448 ; check for good variable after NEXT 	 
      009DFC 4F CF            [ 2] 2449 	cpw x,(CVAR,sp)
      009DFE 00 25            [ 1] 2450 	jreq 2$  
      009E00 81 16 A5         [ 2] 2451 	jp syntax_error ; not the good one 
      009E01                       2452 2$: 
      009E01 90 89 52         [ 2] 2453 	ldw ptr16,x 
                                   2454 	; increment variable 
      009E04 08               [ 1] 2455 	ld a,(x)
      009E05 72 5F            [ 2] 2456 	ldw x,(1,x)  ; get var value 
      009E07 00 0E 6B         [ 2] 2457 	addw x,(FSTEP+1,sp) ; var+step 
      009E0A 05 1F            [ 1] 2458 	adc a,(FSTEP,sp)
      009E0C 01 CE 00 33      [ 4] 2459 	ld [ptr16],a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      009E10 1F 07 90 CE      [ 1] 2460 	inc ptr8  
      009E14 00 31 17 03      [ 5] 2461 	ldw [ptr16],x 
      009E18 93 13 07         [ 1] 2462 	ld acc24,a 
      009E1B 24 20 90         [ 2] 2463 	ldw acc16,x 
      009E1E F6 A4            [ 1] 2464 	ld a,(LIMIT,sp)
      009E20 0F 11            [ 2] 2465 	ldw x,(LIMIT+1,sp)
      009E22 05 26 09 90      [ 2] 2466 	subw x,acc16 
      009E26 5C 1E 01         [ 1] 2467 	sbc a,acc24
      009E29 CD 94            [ 1] 2468 	xor a,(FSTEP,sp)
      009E2B 24 26            [ 1] 2469 	xor a,#0x80
      009E2D 13 12            [ 1] 2470 	jrmi loop_back  
      009E2E 20 25            [ 2] 2471 	jra loop_done   
                                   2472 ; check sign of STEP  
      009E2E 16 03            [ 1] 2473 	ld a,(FSTEP,sp)
      009E30 90 F6            [ 1] 2474 	jrpl 4$
                                   2475 ;negative step
      009E32 A4 0F C7         [ 1] 2476     ld a,acc8 
      009E35 00 0F            [ 1] 2477 	jrslt loop_back   
      009E37 72 B9            [ 2] 2478 	jra loop_done  
      0023B1                       2479 4$: ; positive step
      009E39 00 0E 20 D9 15   [ 2] 2480 	btjt acc8,#7,loop_done 
      009E3D                       2481 loop_back:
      009E3D 0F 03            [ 2] 2482 	ldw x,(BPTR,sp)
      009E3F 0F 04 04         [ 2] 2483 	ldw basicptr,x 
      009E41 72 01 00 22 05   [ 2] 2484 	btjf flags,#FRUN,1$ 
      009E41 1E 03            [ 1] 2485 	ld a,(2,x)
      009E43 5B 08 90         [ 1] 2486 	ld count,a
      009E46 85 81            [ 2] 2487 1$:	ldw x,(INW,sp)
      009E48 CF 00 00         [ 2] 2488 	ldw in.w,x 
      009E48 CD               [ 4] 2489 	ret 
      0023CB                       2490 loop_done:
                                   2491 	; remove loop data from stack  
      009E49 9A               [ 2] 2492 	popw x
      0023CC                       2493 	_drop VSIZE 
      009E4A 4D 52            [ 2]    1     addw sp,#VSIZE 
      009E4C 05 A6 80 6B      [ 1] 2494 	dec loop_depth 
      009E50 05               [ 2] 2495 	jp (x)
                                   2496 
                                   2497 ;----------------------------
                                   2498 ; called by goto/gosub
                                   2499 ; to get target line number 
                                   2500 ; output:
                                   2501 ;    x    line address 
                                   2502 ;---------------------------
      0023D3                       2503 get_target_line:
      009E51 0F 03 20         [ 4] 2504 	call next_token  
      009E54 09 84            [ 1] 2505 	cp a,#TK_INTGR
      009E55 27 07            [ 1] 2506 	jreq get_target_line_addr 
      009E55 CD 9A            [ 1] 2507 	cp a,#TK_LABEL 
      009E57 4D 26            [ 1] 2508 	jreq look_target_symbol 
      009E58 CC 16 A5         [ 2] 2509 	jp syntax_error
                                   2510 ; the target is a line number 
                                   2511 ; search it. 
      0023E1                       2512 get_target_line_addr:
      009E58 52 05            [ 2] 2513 	pushw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      009E5A 0F 03 0F         [ 4] 2514 	call get_int24 ; line # 
      009E5D 05               [ 1] 2515 	clr a
      009E5E 90 CE 00 04      [ 2] 2516 	ldw y,basicptr 
      009E5E CD 98            [ 2] 2517 	ldw y,(y)
      009E60 8C A1            [ 2] 2518 	pushw y 
      009E62 03 27            [ 2] 2519 	cpw x,(1,sp)
      0023F1                       2520 	_drop 2  
      009E64 03 CC            [ 2]    1     addw sp,#2 
      009E66 97 25            [ 1] 2521 	jrult 11$
      009E68 1F               [ 1] 2522 	inc a 
      0023F6                       2523 11$: ; scan program for this line# 	
      009E69 01 CD 94         [ 4] 2524 	call search_lineno  
      009E6C 19               [ 2] 2525 	tnzw x ; 0| line# address 
      009E6D AB 05            [ 1] 2526 	jrne 2$ 
      009E6F 6B 04            [ 1] 2527 	ld a,#ERR_NO_LINE 
      009E71 CD 98 A5         [ 2] 2528 	jp tb_error 
      009E74 7B 04            [ 2] 2529 2$:	popw y  
      009E76 1E               [ 4] 2530 	ret 
                                   2531 
                                   2532 ; the GOTO|GOSUB target is a symbol.
                                   2533 ; output:
                                   2534 ;    X    line address|0 
      002404                       2535 look_target_symbol:
      009E77 01 CD            [ 2] 2536 	pushw y 
      009E79 9E               [ 2] 2537 	pushw x 
      009E7A 01 5D 27         [ 4] 2538 	call skip_string 
      009E7D 05 A6 08 CC      [ 1] 2539 	clr acc16 
      009E81 97 27 CE 00      [ 2] 2540 	ldw y,txtbgn 
      009E85 33 7B 04         [ 1] 2541 1$:	ld a,(3,y) ; first TK_ID on line 
      009E88 1A 05            [ 1] 2542 	cp a,#TK_LABEL 
      009E8A F7 5C            [ 1] 2543 	jreq 3$ 
      009E8C 90 89 16         [ 1] 2544 2$:	ld a,(2,y); line length 
      009E8F 03 CD 94         [ 1] 2545 	ld acc8,a 
      009E92 35 90 85 5A      [ 2] 2546 	addw y,acc16 ;point to next line 
      009E96 72 FB 03 CF      [ 2] 2547 	cpw y,txtend 
      009E9A 00 33            [ 1] 2548 	jrult 1$
      009E9C 1D 00            [ 1] 2549 	ld a,#ERR_BAD_VALUE
      009E9E 03 7F 6F         [ 2] 2550 	jp tb_error 
      00242E                       2551 3$: ; found a TK_LABEL 
                                   2552 	; compare with GOTO|GOSUB target 
      009EA1 01 6F            [ 2] 2553 	pushw y ; line address 
      009EA3 02 CD 98 8C      [ 2] 2554 	addw y,#4 ; label string 
      009EA7 A1 08            [ 2] 2555 	ldw x,(3,sp) ; target string 
      009EA9 27 B3 A1         [ 4] 2556 	call strcmp
      009EAC 32 26            [ 1] 2557 	jrne 4$
      009EAE 2A CD            [ 2] 2558 	popw y 
      009EB0 9C C5            [ 2] 2559 	jra 2$ 
      00243F                       2560 4$: ; target found 
      009EB2 A1               [ 2] 2561 	popw x ;  address line target  
      002440                       2562 	_drop 2 ; target string 
      009EB3 84 27            [ 2]    1     addw sp,#2 
      009EB5 03 CC            [ 2] 2563 	popw y 
      009EB7 97               [ 4] 2564 	ret
                                   2565 
                                   2566 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



                                   2567 ;--------------------------------
                                   2568 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2569 ; selective goto or gosub 
                                   2570 ;--------------------------------
      002445                       2571 cmd_on:
      009EB8 25 CE 00         [ 4] 2572 	call runtime_only
      009EBB 33 1D 00         [ 4] 2573 0$:	call expression 
      009EBE 03 CF            [ 1] 2574 	cp a,#TK_INTGR
      009EC0 00 1A            [ 1] 2575 	jreq 1$
      009EC2 90 F6 93         [ 2] 2576 	jp syntax_error
      002452                       2577 1$: _xpop
      009EC5 EE 01            [ 1]    1     ld a,(y)
      009EC7 72               [ 1]    2     ldw x,y 
      009EC8 A9 00            [ 2]    3     ldw x,(1,x)
      009ECA 03 72 C7 00      [ 2]    4     addw y,#CELL_SIZE 
                                   2578 ; the selector is the element indice 
                                   2579 ; in the list of arguments. {1..#elements} 
      009ECE 1A               [ 1] 2580 	ld a,xl ; keep only bits 7..0
      009ECF 72 5C            [ 1] 2581 	jreq 9$ ; element # begin at 1. 
      009ED1 00               [ 1] 2582 	push a  ; selector  
      009ED2 1B 72 CF         [ 4] 2583 	call next_token
      009ED5 00 1A            [ 1] 2584 	cp a,#TK_CMD 
      009ED7 20 CB            [ 1] 2585 	jreq 2$ 
      009ED9 CC 16 A5         [ 2] 2586 	jp syntax_error 
      002469                       2587 2$: _get_code_addr
      009ED9 55               [ 2]    1         ldw x,(x)
      009EDA 00 04 00 02      [ 1]    2         inc in 
      009EDE 5B 05 CD 9D      [ 1]    3         inc in 
                                   2588 ;; must be a GOTO or GOSUB 
      009EE2 79 81 D0         [ 2] 2589 	cpw x,#goto 
      009EE4 27 08            [ 1] 2590 	jreq 4$
      009EE4 CE 00 1E         [ 2] 2591 	cpw x,#gosub 
      009EE7 72 B0            [ 1] 2592 	jreq 4$ 
      009EE9 00 1C 81         [ 2] 2593 	jp syntax_error 
      009EEC                       2594 4$: 
      009EEC AE               [ 1] 2595 	pop a 
      009EED 9F               [ 2] 2596 	pushw x ; save routine address 	
      009EEE 2B               [ 1] 2597 	push a  ; selector  
      002482                       2598 5$: ; skip elements in list until selector==0 
      009EEF CD 89            [ 1] 2599 	dec (1,sp)
      009EF1 DC CE            [ 1] 2600 	jreq 6$ 
                                   2601 ; can be a line# or a label 
      009EF3 00 1C 35         [ 4] 2602 	call next_token 
      009EF6 10 00            [ 1] 2603 	cp a,#TK_INTGR 
      009EF8 0B CD            [ 1] 2604 	jreq 52$
      009EFA 98 D4            [ 1] 2605 	cp a,#TK_LABEL 
      009EFC 35 0A            [ 1] 2606 	jreq 54$
      009EFE 00 0B AE         [ 2] 2607 	jp syntax_error 
      002494                       2608 52$: ; got a line number 
      009F01 9F 3D CD         [ 1] 2609 	ld a,in ; skip over int24 value 
      009F04 89 DC            [ 1] 2610 	add a,#CELL_SIZE ; integer size  
      009F06 CD 9E E4         [ 1] 2611 	ld in,a 
      009F09 CD 98            [ 2] 2612 	jra 56$
      009F0B D4 AE 9F         [ 4] 2613 54$: call skip_string ; skip over label 	
      0024A1                       2614 56$: ; if another element comma present 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      009F0E 4E CD 89         [ 4] 2615 	call next_token
      009F11 DC CE            [ 1] 2616 	cp a,#TK_COMMA 
      009F13 00 1C            [ 1] 2617 	jreq 5$ 
                                   2618 ; arg list exhausted, selector to big 
                                   2619 ; continue execution on next line 
      0024A8                       2620 	_drop 3 ; drop selector and GOTO|GOSUB address 
      009F15 A3 B9            [ 2]    1     addw sp,#3 
      009F17 04 25            [ 2] 2621 	jra 9$
      0024AC                       2622 6$: ;at selected position  
      0024AC                       2623 	_drop 1 ; discard selector
      009F19 05 AE            [ 2]    1     addw sp,#1 
                                   2624 ; here only the routine address 
                                   2625 ; of GOTO|GOSUB is on stack 
      009F1B 9F 55 20         [ 4] 2626     call get_target_line
      009F1E 03 AE 9F         [ 2] 2627 	ldw ptr16,x 	
      009F21 66 CD 89 DC A6   [ 1] 2628 	mov in,count ; move to end of line  
      009F26 0D               [ 2] 2629 	popw x ; cmd address, GOTO||GOSUB 
      009F27 CD 89 7F         [ 2] 2630 	cpw x,#goto 
      009F2A 81 70            [ 1] 2631 	jrne 7$ 
      009F2C 72 6F 67         [ 2] 2632 	ldw x,ptr16 
      009F2F 72 61            [ 2] 2633 	jra jp_to_target
      0024C4                       2634 7$: 
      009F31 6D 20            [ 2] 2635 	jra gosub_2 ; target in ptr16 
      0024C6                       2636 9$: ; expr out of range skip to end of line
                                   2637     ; this will force a fall to next line  
      009F33 61 64 64 72 65   [ 1] 2638 	mov in,count
      0024CB                       2639 	_drop 2
      009F38 73 73            [ 2]    1     addw sp,#2 
      009F3A 3A 20 00         [ 2] 2640 	jp next_line  
                                   2641 
                                   2642 
                                   2643 ;------------------------
                                   2644 ; BASIC: GOTO line# 
                                   2645 ; jump to line# 
                                   2646 ; here cstack is 2 call deep from interpreter 
                                   2647 ;------------------------
      0024D0                       2648 goto:
      009F3D 2C 20 70         [ 4] 2649 	call runtime_only
      0024D3                       2650 goto_1:
      009F40 72 6F 67         [ 4] 2651 	call get_target_line
      0024D6                       2652 jp_to_target:
      009F43 72 61 6D         [ 2] 2653 	ldw basicptr,x 
      009F46 20 73            [ 1] 2654 	ld a,(2,x)
      009F48 69 7A 65         [ 1] 2655 	ld count,a 
      009F4B 3A 20 00 20      [ 1] 2656 	mov in,#3 
      009F4F 62               [ 4] 2657 	ret 
                                   2658 
                                   2659 
                                   2660 ;--------------------
                                   2661 ; BASIC: GOSUB line#
                                   2662 ; basic subroutine call
                                   2663 ; actual line# and basicptr 
                                   2664 ; are saved on cstack
                                   2665 ; here cstack is 2 call deep from interpreter 
                                   2666 ;--------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



                           000001  2667 	RET_ADDR=1 ; subroutine return address 
                           000003  2668 	RET_BPTR=3 ; basicptr return point 
                           000005  2669 	RET_INW=5  ; in.w return point 
                           000004  2670 	VSIZE=4 
      0024E3                       2671 gosub:
      009F50 79 74 65         [ 4] 2672 	call runtime_only
      0024E6                       2673 gosub_1:
      009F53 73 00 20         [ 4] 2674 	call get_target_line 
      009F56 69 6E 20         [ 2] 2675 	ldw ptr16,x
      0024EC                       2676 gosub_2: 
      009F59 46               [ 2] 2677 	popw x 
      0024ED                       2678 	_vars VSIZE  
      009F5A 4C 41            [ 2]    1     sub sp,#VSIZE 
      009F5C 53               [ 2] 2679 	pushw x ; RET_ADDR 
                                   2680 ; save BASIC subroutine return point.   
      009F5D 48 20 6D         [ 2] 2681 	ldw x,basicptr
      009F60 65 6D            [ 2] 2682 	ldw (RET_BPTR,sp),x 
      009F62 6F 72 79         [ 2] 2683 	ldw x,in.w 
      009F65 00 20            [ 2] 2684 	ldw (RET_INW,sp),x
      009F67 69 6E 20         [ 2] 2685 	ldw x,ptr16  
      009F6A 52 41            [ 2] 2686 	jra jp_to_target
                                   2687 
                                   2688 ;------------------------
                                   2689 ; BASIC: RETURN 
                                   2690 ; exit from BASIC subroutine 
                                   2691 ;------------------------
      0024FF                       2692 return:
      009F6C 4D 20 6D         [ 4] 2693 	call runtime_only
      009F6F 65 6D            [ 2] 2694 	ldw x,(RET_BPTR,sp) 
      009F71 6F 72 79         [ 2] 2695 	ldw basicptr,x
      009F74 00 02            [ 1] 2696 	ld a,(2,x)
      009F75 C7 00 02         [ 1] 2697 	ld count,a  
      009F75 CD 9A            [ 2] 2698 	ldw x,(RET_INW,sp)
      009F77 42 CD 9E         [ 2] 2699 	ldw in.w,x 
      009F7A E4               [ 2] 2700 	popw x 
      002512                       2701 	_drop VSIZE 
      009F7B 22 01            [ 2]    1     addw sp,#VSIZE 
      009F7D 81               [ 2] 2702 	jp (x)
                                   2703 
                                   2704 ;---------------------------------
                                   2705 ; check if A:X contain the address 
                                   2706 ; of a program in FLASH 
                                   2707 ; output:
                                   2708 ;     Z    set is progam 
                                   2709 ;----------------------------------
      002515                       2710 is_program_addr:
      009F7E 52               [ 1] 2711 	tnz a 
      009F7F 06 CE            [ 1] 2712 	jrne 9$
      009F81 00 1C 1F         [ 2] 2713 	cpw x,#app_space 
      009F84 05 FE            [ 1] 2714 	jrult 8$
      009F86 1F               [ 2] 2715 	pushw x 
      009F87 01 AE 7F         [ 4] 2716 	call qsign 
      009F8A FF               [ 2] 2717 	popw x 
      009F8B 1F 03            [ 1] 2718 	jreq 9$ 
      009F8D CD               [ 1] 2719 8$:	cpl a ; clr Z bit  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      009F8E 98               [ 4] 2720 9$:	ret 
                                   2721 
                                   2722 ;----------------------------------
                                   2723 ; BASIC: RUN [label]
                                   2724 ; run BASIC program in RAM
                                   2725 ;----------------------------------- 
      002526                       2726 cmd_run: 
      009F8F 8C A1 84 27 0B   [ 2] 2727 	btjf flags,#FRUN,0$  
      009F94 4F               [ 1] 2728 	clr a 
      009F94 A1               [ 4] 2729 	ret
      00252D                       2730 0$: ; check for STOP condition 
      009F95 11 27 27 55 00   [ 2] 2731 	btjf flags,#FBREAK,1$
      002532                       2732 	_drop 2 
      009F9A 04 00            [ 2]    1     addw sp,#2 
      009F9C 02 20 33         [ 4] 2733 	call rest_context
      009F9F                       2734 	_drop CTXT_SIZE 
      009F9F CD 98            [ 2]    1     addw sp,#CTXT_SIZE 
      009FA1 BE 1F 01 22      [ 1] 2735 	bres flags,#FBREAK 
      009FA4 72 10 00 22      [ 1] 2736 	bset flags,#FRUN 
      009FA4 90 89 4F         [ 2] 2737 	jp interpreter 
      002544                       2738 1$:	; check for label option 
      009FA7 CD 8C C5         [ 4] 2739 	call next_token 
      009FAA 5D 26            [ 1] 2740 	cp a,#TK_LABEL 
      009FAC 01 93            [ 1] 2741 	jrne 3$
      009FAE 90               [ 2] 2742 	pushw x 
      009FAF 85 1F 05         [ 4] 2743 	call skip_string 
      009FB2 CD               [ 2] 2744 	popw x  
      009FB3 98 8C A1         [ 4] 2745 	call search_program
      009FB6 11 27            [ 1] 2746 	jrne 2$
      009FB8 06 1E            [ 1] 2747 	ld a,#ERR_NO_PROGRAM
      009FBA 01 1F 03         [ 2] 2748 	jp tb_error 
      009FBD 20 13 1B         [ 2] 2749 2$: ldw txtbgn,x 
      009FBF 1D 00 02         [ 2] 2750 	subw x,#2 
      009FBF CD               [ 2] 2751 	ldw x,(x)
      009FC0 98 8C A1 84      [ 2] 2752 	addw x,txtbgn 
      009FC4 27 07 55         [ 2] 2753 	ldw txtend,x 
      009FC7 00 04            [ 2] 2754 	jra run_it 	
      00256A                       2755 3$:	_unget_token 
      009FC9 00 02 20 05 01   [ 1]    1      mov in,in.saved  
      009FCD CE 00 1B         [ 2] 2756 	ldw x,txtbgn
      009FCD CD 98 BE         [ 2] 2757 	cpw x,txtend 
      009FD0 1F 03            [ 1] 2758 	jrmi run_it 
      009FD2 AE 15 FC         [ 2] 2759 	ldw x,#err_no_prog
      009FD2 1E 05 E6         [ 4] 2760 	call puts 
      009FD5 02 CD A0 7A 1E   [ 1] 2761 	mov in,count
      009FDA 05               [ 4] 2762 	ret 
      002583                       2763 run_it:	 
      002583                       2764 	_drop 2 ; drop return address 
      009FDB E6 02            [ 2]    1     addw sp,#2 
      002585                       2765 run_it_02: 
      009FDD C7 00 0F         [ 4] 2766     call ubound 
      009FE0 72 5F 00         [ 4] 2767 	call clear_vars
                                   2768 ; initialize DIM variables pointers 
      009FE3 0E 72 BB         [ 2] 2769 	ldw x,txtend 
      009FE6 00 0E C3         [ 2] 2770 	ldw dvar_bgn,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      009FE9 00 1E 2A         [ 2] 2771 	ldw dvar_end,x 	 
                                   2772 ; clear data pointer 
      009FEC 07               [ 1] 2773 	clrw x 
      009FED 1F 05 FE         [ 2] 2774 	ldw data_ptr,x 
      009FF0 13 03 2D DE      [ 1] 2775 	clr data_ofs 
      009FF4 72 5F 00 09      [ 1] 2776 	clr data_len 
                                   2777 ; initialize BASIC pointer 
      009FF4 55 00 03         [ 2] 2778 	ldw x,txtbgn 
      009FF7 00 02 AE         [ 2] 2779 	ldw basicptr,x 
      009FFA 16 B8            [ 1] 2780 	ld a,(2,x)
      009FFC CF 00 05         [ 1] 2781 	ld count,a
      009FFF 5B 06 CD 9E      [ 1] 2782 	mov in,#3	
      00A003 EC 72 0D 00      [ 1] 2783 	bset flags,#FRUN 
      00A007 23 06 AE         [ 2] 2784 	jp interpreter 
                                   2785 
                                   2786 
                                   2787 ;----------------------
                                   2788 ; BASIC: END
                                   2789 ; end running program
                                   2790 ;---------------------- 
                           000001  2791 	CHAIN_BP=1 
                           000003  2792 	CHAIN_IN=3
                           000005  2793 	CHAIN_TXTBGN=5
                           000007  2794 	CHAIN_TXTEND=7
                           000008  2795 	CHAIN_CNTX_SIZE=8  
      0025B6                       2796 cmd_end: 
      0025B6                       2797 	_drop 2 ; no need for return address 
      00A00A A0 10            [ 2]    1     addw sp,#2 
                                   2798 ; check for chained program 
      00A00C CD 89 DC 34      [ 1] 2799 	tnz chain_level
      00A00F 27 1D            [ 1] 2800 	jreq 8$
                                   2801 ; restore chain context 
      00A00F 81 57 41 52      [ 1] 2802 	dec chain_level 
      00A013 4E 49            [ 2] 2803 	ldw x,(CHAIN_BP,sp) ; chain saved basicptr 
      00A015 4E 47 3A         [ 2] 2804 	ldw basicptr,x 
      00A018 20 6C            [ 2] 2805 	ldw x,(CHAIN_IN,sp) ; chain saved in and count  
      00A01A 69 6E 65         [ 2] 2806 	ldw in,x 
      00A01D 73 20            [ 2] 2807 	ldw x,(CHAIN_TXTBGN,sp)
      00A01F 6D 69 73         [ 2] 2808 	ldw txtbgn,x 
      00A022 73 69            [ 2] 2809 	ldw x,(CHAIN_TXTEND,sp)
      00A024 6E 67 20         [ 2] 2810 	ldw txtend,x 
      0025D6                       2811 	_drop CHAIN_CNTX_SIZE ; CHAIN saved data size  
      00A027 69 6E            [ 2]    1     addw sp,#CHAIN_CNTX_SIZE 
      00A029 20 74 68         [ 2] 2812 	jp interpreter 
      0025DB                       2813 8$: ; clean stack 
      00A02C 69 73 20         [ 2] 2814 	ldw x,#STACK_EMPTY
      00A02F 70               [ 1] 2815 	ldw sp,x 
      00A030 72 6F 67         [ 2] 2816 	jp warm_start
                                   2817 
                                   2818 ;---------------------------
                                   2819 ; BASIC: GET var 
                                   2820 ; receive a key in variable 
                                   2821 ; don't wait 
                                   2822 ;---------------------------
      0025E2                       2823 cmd_get:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      00A033 72 61 6D         [ 4] 2824 	call next_token 
      00A036 2E 0A            [ 1] 2825 	cp a,#TK_VAR 
      00A038 00 03            [ 1] 2826 	jreq 0$
      00A039 CC 16 A5         [ 2] 2827 	jp syntax_error 
      00A039 CD 9A 42         [ 4] 2828 0$: call get_addr 
      00A03C A6 03 CD         [ 2] 2829 	ldw ptr16,x 
      00A03F 9A 58 89         [ 4] 2830 	call qgetc 
      00A042 CD 98            [ 1] 2831 	jreq 2$
      00A044 A5 85 CD         [ 4] 2832 	call getc  
      00A047 B2 81 26 06      [ 4] 2833 2$: clr [ptr16]
      00A04B AE 00 12 CC      [ 1] 2834 	inc ptr8 
      00A04F 97 27 90 89      [ 4] 2835 	clr [ptr16]
      00A053 90 93 1D 00      [ 1] 2836 	inc ptr8 
      00A057 04 EE 02 1C      [ 4] 2837 	ld [ptr16],a 
      00A05B 00               [ 4] 2838 	ret 
                                   2839 
                                   2840 
                                   2841 ;-----------------
                                   2842 ; 1 Khz beep 
                                   2843 ;-----------------
      00260F                       2844 beep_1khz:: 
      00A05C 04 CF            [ 2] 2845 	pushw y 
      00A05E 00 0E AE         [ 2] 2846 	ldw x,#100
      00A061 00 8C 72 A2      [ 2] 2847 	ldw y,#1000
      00A065 00 04            [ 2] 2848 	jra beep
                                   2849 
                                   2850 ;-----------------------
                                   2851 ; BASIC: TONE expr1,expr2
                                   2852 ; used TIMER2 channel 1
                                   2853 ; to produce a tone 
                                   2854 ; arguments:
                                   2855 ;    expr1   frequency 
                                   2856 ;    expr2   duration msec.
                                   2857 ;---------------------------
      00261A                       2858 tone:
      00A067 CD 94            [ 2] 2859 	pushw y 
      00A069 45 AE 00         [ 4] 2860 	call arg_list 
      00A06C 90 CF            [ 1] 2861 	cp a,#2 
      00A06E 00 1C            [ 1] 2862 	jreq 1$
      00A070 72 BB 00         [ 2] 2863 	jp syntax_error 
      002626                       2864 1$: 
      002626                       2865 	_xpop 
      00A073 8E CF            [ 1]    1     ld a,(y)
      00A075 00               [ 1]    2     ldw x,y 
      00A076 1E 90            [ 2]    3     ldw x,(1,x)
      00A078 85 81 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A07A 89               [ 2] 2866 	pushw x ; duration 
      002630                       2867 	_xpop ; frequency
      00A07A 90 89            [ 1]    1     ld a,(y)
      00A07C C7               [ 1]    2     ldw x,y 
      00A07D 00 03            [ 2]    3     ldw x,(1,x)
      00A07F E6 02 C1 00      [ 2]    4     addw y,#CELL_SIZE 
      00A083 03 2A            [ 1] 2868 	ldw y,x ; frequency 
      00A085 03               [ 2] 2869 	popw x  ; duration 
      00263C                       2870 beep:  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      00A086 C7               [ 2] 2871 	pushw x 
      00A087 00 03 CF         [ 2] 2872 	ldw x,#TIM2_CLK_FREQ
      00A08A 00               [ 2] 2873 	divw x,y ; cntr=Fclk/freq 
                                   2874 ; round to nearest integer 
      00A08B 05 90 AE 16      [ 2] 2875 	cpw y,#TIM2_CLK_FREQ/2
      00A08F 68 CD            [ 1] 2876 	jrmi 2$
      00A091 92               [ 1] 2877 	incw x 
      002648                       2878 2$:	 
      00A092 35               [ 1] 2879 	ld a,xh 
      00A093 CD 89 DC         [ 1] 2880 	ld TIM2_ARRH,a 
      00A096 A6               [ 1] 2881 	ld a,xl 
      00A097 0D CD 89         [ 1] 2882 	ld TIM2_ARRL,a 
                                   2883 ; 50% duty cycle 
      00A09A 7F               [ 1] 2884 	ccf 
      00A09B 90               [ 2] 2885 	rrcw x 
      00A09C 85               [ 1] 2886 	ld a,xh 
      00A09D 81 53 0F         [ 1] 2887 	ld TIM2_CCR1H,a 
      00A09E 9F               [ 1] 2888 	ld a,xl
      00A09E 52 01 10         [ 1] 2889 	ld TIM2_CCR1L,a
      00A0A0 72 10 53 08      [ 1] 2890 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A0A0 0F 01 53 00      [ 1] 2891 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A0A2 72 10 53 04      [ 1] 2892 	bset TIM2_EGR,#TIM2_EGR_UG
      00A0A2 CD               [ 2] 2893 	popw x 
      00A0A3 98 8C A1         [ 4] 2894 	call pause02
      00A0A6 02 25 08 A1      [ 1] 2895 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A0AA 0A 27 04 A1      [ 1] 2896 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A0AE 80 26            [ 2] 2897 	popw y 
      00A0B0 07               [ 4] 2898 	ret 
                                   2899 
                                   2900 ;-------------------------------
                                   2901 ; BASIC: ADCON 0|1 [,divisor]  
                                   2902 ; disable/enanble ADC 
                                   2903 ;-------------------------------
                           000003  2904 	ONOFF=3 
                           000001  2905 	DIVSOR=1
                           000004  2906 	VSIZE=4 
      00A0B1                       2907 power_adc:
      00A0B1 55 00 04         [ 4] 2908 	call arg_list 
      00A0B4 00 02            [ 1] 2909 	cp a,#2	
      00A0B6 20 63            [ 1] 2910 	jreq 1$
      00A0B8 A1 01            [ 1] 2911 	cp a,#1 
      00A0B8 A1 02            [ 1] 2912 	jreq 0$ 
      00A0BA 27 12 A1         [ 2] 2913 	jp syntax_error 
      00A0BD 04               [ 1] 2914 0$:	clr a 
      00A0BE 27               [ 1] 2915 	clrw x
      002685                       2916 	_xpush   ; divisor  
      00A0BF 1B A1 82 27      [ 2]    1     subw y,#CELL_SIZE
      00A0C3 1F A1            [ 1]    2     ld (y),a 
      00A0C5 08 27 2A         [ 2]    3     ldw (1,y),x 
      00268E                       2917 1$: _at_next 
      00A0C8 A1 09 27         [ 1]    1     ld a,(3,y)
      00A0CB 2A               [ 1]    2     ldw x,y 
      00A0CC 20 3D            [ 2]    3     ldw x,(4,x)
      00A0CE 5D               [ 2] 2918 	tnzw x 
      00A0CE CD 89            [ 1] 2919 	jreq 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      002697                       2920 	_xpop
      00A0D0 DC 5C            [ 1]    1     ld a,(y)
      00A0D2 72               [ 1]    2     ldw x,y 
      00A0D3 B0 00            [ 2]    3     ldw x,(1,x)
      00A0D5 05 CF 00 01      [ 2]    4     addw y,#CELL_SIZE 
      0026A0                       2921 	_xdrop  
      00A0D9 20 C5 00 03      [ 2]    1     addw y,#CELL_SIZE 
      00A0DB 9F               [ 1] 2922 	ld a,xl
      00A0DB CD 98            [ 1] 2923 	and a,#7
      00A0DD CE               [ 1] 2924 	swap a 
      00A0DE CD 89 7F         [ 1] 2925 	ld ADC_CR1,a
      00A0E1 20 BD 50 CA      [ 1] 2926 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A0E3 72 10 54 01      [ 1] 2927 	bset ADC_CR1,#ADC_CR1_ADON 
      0026B3                       2928 	_usec_dly 7 
      00A0E3 FE 72 5C         [ 2]    1     ldw x,#(16*7-2)/4
      00A0E6 00               [ 2]    2     decw x
      00A0E7 02               [ 1]    3     nop 
      00A0E8 72 5C            [ 1]    4     jrne .-4
      00A0EA 00 02            [ 2] 2929 	jra 3$
      00A0EC FD CD 89 7F      [ 1] 2930 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A0F0 20 AE 50 CA      [ 1] 2931 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A0F2                       2932 3$:	
      00A0F2 03               [ 4] 2933 	ret
                                   2934 
                                   2935 ;-----------------------------
                                   2936 ; BASIC: ADCREAD (channel)
                                   2937 ; read adc channel {0..5}
                                   2938 ; output:
                                   2939 ;   A 		TK_INTGR 
                                   2940 ;   X 		value 
                                   2941 ;-----------------------------
      0026C5                       2942 analog_read:
      00A0F3 01 20 AC         [ 4] 2943 	call func_args 
      00A0F6 A1 01            [ 1] 2944 	cp a,#1 
      00A0F6 CD 98            [ 1] 2945 	jreq 1$
      00A0F8 8C A1 84         [ 2] 2946 	jp syntax_error
      0026CF                       2947 1$: _xpop 
      00A0FB 27 03            [ 1]    1     ld a,(y)
      00A0FD CC               [ 1]    2     ldw x,y 
      00A0FE 97 25            [ 2]    3     ldw x,(1,x)
      00A100 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A100 CD 98 BE         [ 2] 2948 	cpw x,#5 
      00A103 9F A4            [ 2] 2949 	jrule 2$
      00A105 0F C7            [ 1] 2950 	ld a,#ERR_BAD_VALUE
      00A107 00 24 20         [ 2] 2951 	jp tb_error 
      00A10A 95               [ 1] 2952 2$: ld a,xl
      00A10B C7 00 0E         [ 1] 2953 	ld acc8,a 
      00A10B 55 00            [ 1] 2954 	ld a,#5
      00A10D 04 00 02         [ 1] 2955 	sub a,acc8 
      00A110 CD 9C C5         [ 1] 2956 	ld ADC_CSR,a
      00A113 4D 27 05 CD      [ 1] 2957 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A117 98 F9 20 85      [ 1] 2958 	bset ADC_CR1,#ADC_CR1_ADON
      00A11B 72 0F 54 00 FB   [ 2] 2959 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00A11B 0D 01 26         [ 2] 2960 	ldw x,ADC_DRH
      00A11E 05 A6            [ 1] 2961 	ld a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00A120 0D               [ 4] 2962 	ret 
                                   2963 
                                   2964 ;-----------------------
                                   2965 ; BASIC: DREAD(pin)
                                   2966 ; Arduino pins 
                                   2967 ; read state of a digital pin 
                                   2968 ; pin# {0..15}
                                   2969 ; output:
                                   2970 ;    A 		TK_INTGR
                                   2971 ;    X      0|1 
                                   2972 ;-------------------------
                           000001  2973 	PINNO=1
                           000001  2974 	VSIZE=1
      002701                       2975 digital_read:
      002701                       2976 	_vars VSIZE 
      00A121 CD 89            [ 2]    1     sub sp,#VSIZE 
      00A123 7F 5B 01         [ 4] 2977 	call func_args
      00A126 81 01            [ 1] 2978 	cp a,#1
      00A127 27 03            [ 1] 2979 	jreq 1$
      00A127 CE 00 05         [ 2] 2980 	jp syntax_error
      00270D                       2981 1$: _xpop 
      00A12A 1F 03            [ 1]    1     ld a,(y)
      00A12C C6               [ 1]    2     ldw x,y 
      00A12D 00 02            [ 2]    3     ldw x,(1,x)
      00A12F 6B 05 C6 00      [ 2]    4     addw y,#CELL_SIZE 
      00A133 03 6B 06         [ 2] 2982 	cpw x,#15 
      00A136 81 05            [ 2] 2983 	jrule 2$
      00A137 A6 0A            [ 1] 2984 	ld a,#ERR_BAD_VALUE
      00A137 1E 03 CF         [ 2] 2985 	jp tb_error 
      00A13A 00 05 7B         [ 4] 2986 2$:	call select_pin 
      00A13D 05 C7            [ 1] 2987 	ld (PINNO,sp),a
      00A13F 00 02            [ 1] 2988 	ld a,(GPIO_IDR,x)
      00A141 7B 06            [ 1] 2989 	tnz (PINNO,sp)
      00A143 C7 00            [ 1] 2990 	jreq 8$
      00A145 03               [ 1] 2991 3$: srl a 
      00A146 81 01            [ 1] 2992 	dec (PINNO,sp)
      00A147 26 FB            [ 1] 2993 	jrne 3$ 
      00A147 90 89            [ 1] 2994 8$: and a,#1 
      00A149 52               [ 1] 2995 	clrw x 
      00A14A 05               [ 1] 2996 	ld xl,a 
      00A14B 4F               [ 1] 2997 	clr a 
      002735                       2998 	_drop VSIZE
      00A14B 0F 05            [ 2]    1     addw sp,#VSIZE 
      00A14D CD               [ 4] 2999 	ret
                                   3000 
                                   3001 
                                   3002 ;-----------------------
                                   3003 ; BASIC: DWRITE pin,0|1
                                   3004 ; Arduino pins 
                                   3005 ; write to a digital pin 
                                   3006 ; pin# {0..15}
                                   3007 ; output:
                                   3008 ;    A 		TK_INTGR
                                   3009 ;    X      0|1 
                                   3010 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



                           000001  3011 	PINNO=1
                           000002  3012 	PINVAL=2
                           000002  3013 	VSIZE=2
      002738                       3014 digital_write:
      002738                       3015 	_vars VSIZE 
      00A14E 98 8C            [ 2]    1     sub sp,#VSIZE 
      00A150 A1 02 26         [ 4] 3016 	call arg_list  
      00A153 10 CD            [ 1] 3017 	cp a,#2 
      00A155 89 DC            [ 1] 3018 	jreq 1$
      00A157 5C 72 B0         [ 2] 3019 	jp syntax_error
      002744                       3020 1$: _xpop 
      00A15A 00 05            [ 1]    1     ld a,(y)
      00A15C CF               [ 1]    2     ldw x,y 
      00A15D 00 01            [ 2]    3     ldw x,(1,x)
      00A15F 03 05 CD 98      [ 2]    4     addw y,#CELL_SIZE 
      00A163 8C               [ 1] 3021 	ld a,xl 
      00A164 A1 85            [ 1] 3022 	ld (PINVAL,sp),a
      002750                       3023 	_xpop 
      00A166 27 03            [ 1]    1     ld a,(y)
      00A168 CC               [ 1]    2     ldw x,y 
      00A169 97 25            [ 2]    3     ldw x,(1,x)
      00A16B CD 98 B4 CF      [ 2]    4     addw y,#CELL_SIZE 
      00A16F 00 1A 0D         [ 2] 3024 	cpw x,#15 
      00A172 05 26            [ 2] 3025 	jrule 2$
      00A174 06 CD            [ 1] 3026 	ld a,#ERR_BAD_VALUE
      00A176 92 2B CD         [ 2] 3027 	jp tb_error 
      00A179 89 7F B9         [ 4] 3028 2$:	call select_pin 
      00A17B 6B 01            [ 1] 3029 	ld (PINNO,sp),a 
      00A17B A6 3A            [ 1] 3030 	ld a,#1
      00A17D CD 89            [ 1] 3031 	tnz (PINNO,sp)
      00A17F 7F CD            [ 1] 3032 	jreq 4$
      00A181 A1               [ 1] 3033 3$: sll a
      00A182 27 72            [ 1] 3034 	dec (PINNO,sp)
      00A184 5F 00            [ 1] 3035 	jrne 3$
      00A186 03 CD            [ 1] 3036 4$: tnz (PINVAL,sp)
      00A188 8A E1            [ 1] 3037 	jrne 5$
      00A18A AE               [ 1] 3038 	cpl a 
      00A18B 16 68            [ 1] 3039 	and a,(GPIO_ODR,x)
      00A18D 3B 00            [ 2] 3040 	jra 8$
      00A18F 03 4B            [ 1] 3041 5$: or a,(GPIO_ODR,x)
      00A191 00 72            [ 1] 3042 8$: ld (GPIO_ODR,x),a 
      002780                       3043 	_drop VSIZE 
      00A193 FB 01            [ 2]    1     addw sp,#VSIZE 
      00A195 5C               [ 4] 3044 	ret
                                   3045 
                                   3046 
                                   3047 ;-----------------------
                                   3048 ; BASIC: STOP
                                   3049 ; stop progam execution  
                                   3050 ; without resetting pointers 
                                   3051 ; the program is resumed
                                   3052 ; with RUN 
                                   3053 ;-------------------------
      002783                       3054 stop:
      00A196 5B 02 72 5F 00   [ 2] 3055 	btjt flags,#FRUN,2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00A19B 02               [ 4] 3056 	ret 
      002789                       3057 2$:	 
                                   3058 ; create space on cstack to save context 
      00A19C CD 8F 75         [ 2] 3059 	ldw x,#break_point 
      00A19F A1 84 27         [ 4] 3060 	call puts 
      00278F                       3061 	_drop 2 ;drop return address 
      00A1A2 14 A1            [ 2]    1     addw sp,#2 
      002791                       3062 	_vars CTXT_SIZE ; context size 
      00A1A4 11 26            [ 2]    1     sub sp,#CTXT_SIZE 
      00A1A6 07 CD 8F         [ 4] 3063 	call save_context 
      00A1A9 75 A1 84         [ 2] 3064 	ldw x,#tib 
      00A1AC 27 06 04         [ 2] 3065 	ldw basicptr,x
      00A1AE 7F               [ 1] 3066 	clr (x)
      00A1AE CD A1 37 CC      [ 1] 3067 	clr count  
      00A1B2 97               [ 1] 3068 	clrw x 
      00A1B3 25 00 00         [ 2] 3069 	ldw in.w,x
      00A1B4 72 11 00 22      [ 1] 3070 	bres flags,#FRUN 
      00A1B4 CD 82 9D 22      [ 1] 3071 	bset flags,#FBREAK
      00A1B7 CC 17 50         [ 2] 3072 	jp interpreter 
      00A1B7 C6 00 0D CE 00 0E 72  3073 break_point: .asciz "\nbreak point, RUN to resume.\n"
             C7 00 1A 72 5C 00 1B
             72 CF 00 1A CD A1 37
             CD 98 8C A1 08 26 03
             CC A1
                                   3074 
                                   3075 ;-----------------------
                                   3076 ; BASIC: NEW
                                   3077 ; from command line only 
                                   3078 ; free program memory
                                   3079 ; and clear variables 
                                   3080 ;------------------------
      0027CE                       3081 new: 
      00A1D5 4B 19 C2         [ 4] 3082 	call cmd_line_only
      00A1D6 72 5F 00 22      [ 1] 3083 0$:	clr flags 
      00A1D6 A1 00 27         [ 4] 3084 	call clear_basic 
      00A1D9 07               [ 4] 3085 	ret 
                                   3086 
                                   3087 ;-----------------------------------
                                   3088 ; erase program at specified address
                                   3089 ; keep signature and size fields. 
                                   3090 ; signature replaced by "XX"
                                   3091 ; input:
                                   3092 ;    X    address 
                                   3093 ;-----------------------------------
                           000001  3094 	ADDR=1    ; program address
                           000003  3095 	PRG_SIZE=3    ; program size 
                           000005  3096 	BLOCKS=5 ; blocks to erase 
                           000006  3097 	VSIZE=6
      0027D9                       3098 erase_program:
      00A1DA A1               [ 2] 3099 	pushw x 
      00A1DB 0A 27 03         [ 4] 3100 	call skip_string 
      00A1DE CC               [ 2] 3101 	popw x 
      00A1DF 97 25 01         [ 4] 3102 	call search_program 
      00A1E1 27 4A            [ 1] 3103 	jreq 9$
      00A1E1 5B 05 90         [ 4] 3104 	call move_erase_to_ram
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00A1E4 85 81 00 18      [ 1] 3105 	clr farptr 
      00A1E6                       3106 	_vars VSIZE 
      00A1E6 55 00            [ 2]    1     sub sp,#VSIZE 
      00A1E8 03 00 02         [ 2] 3107 1$:	subw x,#4 
      00A1EB 81 01            [ 2] 3108 	ldw (ADDR,sp),x
      00A1EC EE 02            [ 2] 3109 	ldw x,(2,x)
      00A1EC 52 04            [ 2] 3110 	ldw (PRG_SIZE,sp),x
      00A1EE 0F 01            [ 1] 3111 	ld a,#BLOCK_SIZE 
      00A1F0 CD               [ 2] 3112 	div x,a 
      00A1F1 9A               [ 1] 3113 	tnz a 
      00A1F2 6A A1            [ 1] 3114 	jreq 2$ 
      00A1F4 02               [ 1] 3115 	incw x 
      00A1F5 24 03            [ 2] 3116 2$:	ldw (BLOCKS,sp),x 
      00A1F7 CC 97            [ 2] 3117 	ldw x,(ADDR,sp)
      00A1F9 25 A1 03         [ 2] 3118 	ldw ptr16,x 
      00A1FC 25 0C 90         [ 4] 3119 3$:	call block_erase
      00A1FF F6 93 EE         [ 2] 3120 	ldw x,#BLOCK_SIZE 
      00A202 01 72 A9         [ 4] 3121 	call incr_farptr
      00A205 00 03            [ 2] 3122 	ldw x,(BLOCKS,sp)
      00A207 9F               [ 2] 3123 	decw x 
      00A208 6B 01            [ 2] 3124 	ldw (BLOCKS,sp),x 
      00A20A 90 F6            [ 1] 3125 	jrne 3$ 
                                   3126 ; write XX and size at addr 
      00A20C 93 EE            [ 2] 3127 	ldw x,(ADDR,sp)
      00A20E 01 72 A9         [ 2] 3128 	ldw ptr16,x 
      00A211 00 03            [ 1] 3129 	ld a,#'X 
      00A213 9F               [ 1] 3130 	clrw x 
      00A214 6B 02 90         [ 4] 3131 	call write_byte 
      00A217 F6 93 EE         [ 4] 3132 	call write_byte 
      00A21A 01 72            [ 1] 3133 	ld a,(PRG_SIZE,sp)
      00A21C A9 00 03         [ 4] 3134 	call write_byte 
      00A21F F6 14            [ 1] 3135 	ld a,(PRG_SIZE+1,sp)
      00A221 02 18 01         [ 4] 3136 	call write_byte 
      00282B                       3137 	_drop VSIZE 
      00A224 27 F9            [ 2]    1     addw sp,#VSIZE 
      00282D                       3138 9$:	
      00A226 5B               [ 4] 3139 	ret 
                                   3140 
                                   3141 ;-----------------------------------
                                   3142 ; BASIC: ERASE \E | \F || address
                                   3143 ; erase all block in range from 
                                   3144 ;  'app_space' to FLASH end (0x27fff)
                                   3145 ;  or all EEPROM 
                                   3146 ; that contains a non zero byte. 
                                   3147 ; if the argument is an address  
                                   3148 ; mark the program at this address 
                                   3149 ; as erased. Erase the blocks 
                                   3150 ; replace signature by 'XX' and 
                                   3151 ; keep size field.  
                                   3152 ;-----------------------------------
                           000001  3153 	LIMIT=1 
                           000003  3154 	VSIZE = 3 
      00282E                       3155 cmd_erase:
      00A227 04 81 C2         [ 4] 3156 	call cmd_line_only
      00A229 72 5F 00 18      [ 1] 3157 	clr farptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00A229 CD 9A 6A         [ 4] 3158 	call next_token
      00A22C A1 02            [ 1] 3159 	cp a,#TK_LABEL 
      00A22E 27 03            [ 1] 3160 	jreq erase_program  
      00283C                       3161 	_vars VSIZE 
      00A230 CC 97            [ 2]    1     sub sp,#VSIZE 
      00A232 25 04            [ 1] 3162 	cp a,#TK_CHAR 
      00A233 27 03            [ 1] 3163 	jreq 0$ 
      00A233 90 F6 93         [ 2] 3164 	jp syntax_error
      00A236 EE 01 72         [ 4] 3165 0$: call get_char 
      00A239 A9 00            [ 1] 3166 	and a,#0XDF 
      00A23B 03 9F            [ 1] 3167 	cp a,#'E
      00A23D 88 90            [ 1] 3168 	jrne 1$
      00A23F F6 93 EE         [ 2] 3169 	ldw x,#EEPROM_BASE 
      00A242 01 72 A9         [ 2] 3170 	ldw farptr+1,x 
      00A245 00 03 84         [ 2] 3171 	ldw x,#EEPROM_END
      00A248 FA               [ 1] 3172 	clr a 
      00A249 F7 81            [ 2] 3173 	jra 3$ 
      00A24B A1 46            [ 1] 3174 1$: cp a,#'F 
      00A24B CD 9A            [ 1] 3175 	jreq 2$
      00A24D 6A A1 02         [ 2] 3176 	ldw x,#err_bad_value
      00A250 27 03 CC         [ 2] 3177 	jp tb_error
      002864                       3178 2$:
      00A253 97 25 80         [ 2] 3179 	ldw x,#app_space  
      00A255 CF 00 19         [ 2] 3180 	ldw farptr+1,x 
      00A255 90 F6            [ 1] 3181 	ld a,#(FLASH_END>>16)&0XFF 
      00A257 93 EE 01         [ 2] 3182 	ldw x,#FLASH_END&0xffff
      00286F                       3183 3$:
      00A25A 72 A9            [ 1] 3184 	ld (LIMIT,sp),a 
      00A25C 00 03            [ 2] 3185 	ldw (LIMIT+1,sp),x 
                                   3186 ; operation done from RAM
                                   3187 ; copy code to RAM in tib   
      00A25E 9F 43 88         [ 4] 3188 	call move_erase_to_ram
      002876                       3189 4$:	 
      00A261 90 F6 93         [ 4] 3190     call scan_block 
      00A264 EE 01            [ 1] 3191 	jreq 5$  ; block already erased 
      00A266 72 A9            [ 1] 3192     ld a,#'E 
      00A268 00 03 84         [ 4] 3193     call putc 
      00A26B F4 F7 81         [ 4] 3194 	call block_erase   
                                   3195 ; this block is clean, next  
      00A26E AE 00 80         [ 2] 3196 5$:	ldw x,#BLOCK_SIZE
      00A26E CD 9A 6A         [ 4] 3197 	call incr_farptr
                                   3198 ; check limit, 24 bit substraction  	
      00A271 A1 02            [ 1] 3199 	ld a,(LIMIT,sp)
      00A273 27 03            [ 2] 3200 	ldw x,(LIMIT+1,sp)
      00A275 CC 97 25 90      [ 2] 3201 	subw x,farptr+1
      00A279 F6 93 EE         [ 1] 3202 	sbc a,farptr 
      00A27C 01 72            [ 1] 3203 	jrugt 4$ 
      00A27E A9 00 03         [ 4] 3204 9$: call clear_basic
      00A281 9F 88            [ 2] 3205 	ldw x,(LIMIT+1,sp)
      00A283 90 F6 93         [ 2] 3206 	cpw x,#EEPROM_END
      00A286 EE 01            [ 1] 3207 	jrne 10$
      00A288 72 A9 00         [ 4] 3208 	call func_eefree 
      0028A3                       3209 10$:
      0028A3                       3210 	_drop VSIZE 
      00A28B 03 84            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      00A28D F8               [ 4] 3211 	ret 
                                   3212 	
                                   3213 
                                   3214 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3215 ;  check for application signature 
                                   3216 ; input:
                                   3217 ;	x       address to check 
                                   3218 ; output:
                                   3219 ;   Z      1  signature present 
                                   3220 ;          0 not app signature  
                                   3221 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028A6                       3222 qsign: 
      00A28E F7               [ 2] 3223 	pushw x 
                                   3224 ; align to block 
      00A28F 81               [ 1] 3225 	ld a,xl 
      00A290 A4 80            [ 1] 3226 	and a,#BLOCK_SIZE 
      00A290 CD               [ 1] 3227 	ld xl,a 
      00A291 9A               [ 2] 3228 	ldw x,(x)
      00A292 65 A1 02         [ 2] 3229 	cpw x,SIGNATURE ; "TB" 
      00A295 27               [ 2] 3230 	popw x 
      00A296 03               [ 4] 3231 	ret 
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
      0028B1                       3244 fill_write_buffer:
      00A297 CC               [ 1] 3245 	push a 
      00A298 97               [ 1] 3246 	tnz a 
      00A299 25 0A            [ 1] 3247 	jreq 9$ 
      00A29A F6               [ 1] 3248 1$: ld a,(x)
      00A29A 90               [ 1] 3249 	incw x 
      00A29B F6 93            [ 1] 3250 	ld (y),a 
      00A29D EE 01            [ 1] 3251 	incw y 
      00A29F 72 A9            [ 1] 3252 	dec (1,sp) 
      00A2A1 00 03            [ 1] 3253 	jrne 1$ 
      00A2A3 9F               [ 1] 3254 9$:	pop a 
      00A2A4 A4               [ 4] 3255     ret 	
                                   3256 
                                   3257 ;--------------------------------------
                                   3258 ;  fill pad buffer with zero 
                                   3259 ;  input:
                                   3260 ;	none 
                                   3261 ;  output:
                                   3262 ;    y     buffer address  
                                   3263 ;--------------------------------------
      0028C1                       3264 clear_block_buffer:
      00A2A5 07               [ 1] 3265 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



      00A2A6 88 A6 01 0D      [ 2] 3266 	ldw y,#block_buffer 
      00A2AA 01 27            [ 2] 3267 	pushw y
      00A2AC 05 48            [ 1] 3268 	ld a,#BLOCK_SIZE   
      00A2AE 0A 01            [ 1] 3269 1$:	clr (y)
      00A2B0 20 F7            [ 1] 3270 	incw y
      00A2B2 6B               [ 1] 3271 	dec a  
      00A2B3 01 90            [ 1] 3272 	jrne 1$ 	
      00A2B5 F6 93            [ 2] 3273 9$: popw y 
      00A2B7 EE               [ 1] 3274 	pop a 			
      00A2B8 01               [ 4] 3275 	ret 
                                   3276 
                                   3277 
                                   3278 ;----------------------------------
                                   3279 ;  search  a free space space that 
                                   3280 ;  fit program size 
                                   3281 ; input:
                                   3282 ;    X    program size 
                                   3283 ; output:
                                   3284 ;    X    address | 0 
                                   3285 ;------------------------------------
                           000001  3286 	PG_SIZE=1 
                           000002  3287 	VSIZE=2 
      0028D5                       3288 search_fit:
      00A2B9 72               [ 2] 3289 	pushw x; PG_SIZE 
      00A2BA A9 00 03         [ 2] 3290 	ldw x,#app_space 
      00A2BD 84 F4 27         [ 4] 3291 1$:	call is_erased 
      00A2C0 02 A6            [ 1] 3292 	jreq 4$
      00A2C2 01               [ 1] 3293 	ld a,(x)
      00A2C3 5F 97            [ 1] 3294 	or a,(1,x)
      00A2C5 4F 81            [ 1] 3295 	jreq 9$ ; free space 
      00A2C7 CD 29 D0         [ 4] 3296 2$:	call skip_to_next
      00A2C7 CD               [ 2] 3297 	tnzw x 
      00A2C8 9A 6A            [ 1] 3298 	jrne 1$
      00A2CA A1 02            [ 2] 3299 	jra 9$
      0028EB                       3300 4$: ; erased program 
                                   3301     ; does it fit? 
      00A2CC 27 03 CC         [ 2] 3302 	ldw acc16,x 
      00A2CF 97 25            [ 2] 3303 	ldw x,(2,x) ; size erased program
                                   3304 ; top multiple of BLOCK_SIZE 
      00A2D1 1C 00 04         [ 2] 3305 	addw x,#4 
      00A2D1 90 F6 93         [ 2] 3306 	addw x,#BLOCK_SIZE-1 
      00A2D4 EE               [ 1] 3307 	ld a,xl 
      00A2D5 01 72            [ 1] 3308 	and a,#BLOCK_SIZE 
      00A2D7 A9               [ 1] 3309 	ld xl,a  
      00A2D8 00 03            [ 2] 3310 	cpw x,(1,sp) ; size program to save 
      00A2DA 9F 88            [ 1] 3311 	jruge 8$   ; fit 
      00A2DC 90 F6 93         [ 2] 3312 	ldw x,acc16 
      00A2DF EE 01            [ 2] 3313 	jra 2$ 
      00A2E1 72 A9 00         [ 2] 3314 8$: ldw x,acc16 ; fit in this one 	
      002906                       3315 9$:	_drop VSIZE 
      00A2E4 03 84            [ 2]    1     addw sp,#VSIZE 
      00A2E6 F7               [ 4] 3316 	ret  
                                   3317 
                                   3318 ;-------------------------
                                   3319 ; erase header and 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



                                   3320 ; size fields 
                                   3321 ; input: 
                                   3322 ;    X    program address 
                                   3323 ; output:
                                   3324 ;    X    unchanged 
                                   3325 ;-------------------------
                           000001  3326 	COUNT=1 
      002909                       3327 erase_header:
      00A2E7 81               [ 2] 3328 	pushw x 
      00A2E8 4B 04            [ 1] 3329 	push #4 ; COUNT 
      00A2E8 CD 9A 65 A1      [ 1] 3330 	clr farptr 
      00A2EC 01 27 03         [ 2] 3331 	ldw ptr16,x 
      00A2EF CC               [ 1] 3332 	clr a 
      00A2F0 97               [ 1] 3333 	clrw x 
      00A2F1 25 90 F6         [ 4] 3334 1$:	call write_byte 
      00A2F4 93 EE            [ 1] 3335 	dec (COUNT,sp)
      00A2F6 01 72            [ 1] 3336 	jrne 1$
      00291C                       3337 	_drop 1 
      00A2F8 A9 00            [ 2]    1     addw sp,#1 
      00A2FA 03               [ 2] 3338 	popw x 
      00A2FB C7 00 19         [ 2] 3339 	ldw ptr16,x 
      00A2FE CF               [ 4] 3340 	ret 
                                   3341 
                                   3342 ;---------------------------------------
                                   3343 ; BASIC: SAVE
                                   3344 ; write application from RAM to FLASH
                                   3345 ; at UFLASH address
                                   3346 ;--------------------------------------
                           000001  3347 	XTEMP=1
                           000003  3348 	COUNT=3  ; last count bytes written 
                           000004  3349 	CNT_LO=4 ; count low byte 
                           000005  3350 	TOWRITE=5 ; how bytes left to write  
                           000006  3351 	VSIZE=6 
      002923                       3352 cmd_save:
      00A2FF 00 1A 92         [ 4] 3353 	call cmd_line_only
      00A302 BC               [ 2] 3354 	pushw x 
      00A303 00 19            [ 2] 3355 	pushw y 
      002929                       3356 	_vars VSIZE
      00A305 5F 97            [ 2]    1     sub sp,#VSIZE 
      00A307 4F 81 64         [ 4] 3357 	call prog_size 
      00A309 26 03            [ 1] 3358 	jrne 0$ 
      00A309 CD 9C C5         [ 2] 3359 	jp 9$ ; no program to save 
      00A30C 90 F6            [ 2] 3360 0$:	ldw (TOWRITE,sp),x ; program size
      00A30E 93 EE 01 72      [ 1] 3361 	clr farptr 
      00A312 A9 00 03         [ 4] 3362 	call search_fit
      00A315 4D 26 0D         [ 2] 3363 	ldw ptr16,x 
      00A318 5D 26 0A         [ 2] 3364 	ldw x,#0xFFFF
      00A31B 55 00 03 00      [ 2] 3365 	subw x,ptr16 ; free flash 
      00A31F 02 5B 02         [ 2] 3366 	subw x,#4 ; signature and size field 
      00A322 CC 97            [ 2] 3367 	cpw x,(TOWRITE,sp)
      00A324 D8 81            [ 1] 3368 	jruge 1$
      00A326 A6 01            [ 1] 3369 	ld a,#ERR_MEM_FULL
      00A326 85 52 0D         [ 2] 3370 	jp tb_error 
      002952                       3371 1$: ; check if header bytes are zero's 
      00A329 89 A6 85         [ 2] 3372 	ldw x,ptr16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00A32C CD               [ 1] 3373 	ld a,(x)
      00A32D 9A 58            [ 1] 3374 	or a,(1,x)
      00A32F CD 98            [ 1] 3375 	or a,(2,x)
      00A331 B4 1F            [ 1] 3376 	or a,(3,x)
      00A333 09 CD            [ 1] 3377 	jreq 2$
      00A335 9D 9A 72         [ 4] 3378 	call erase_header ; preserve X and farptr 
      002961                       3379 2$: 
                                   3380 ; block programming flash
                                   3381 ; must be done from RAM
                                   3382 ; moved in tib  
      00A338 14 00 23         [ 4] 3383 	call move_prg_to_ram
                                   3384 ; initialize written bytes count  
      00A33B CD 98            [ 1] 3385 	clr (COUNT,sp)
                                   3386 ; first bock 
                                   3387 ; containt signature 2 bytes 
                                   3388 ; and size 	2 bytes 
                                   3389 ; use Y as pointer to block_buffer
      00A33D 8C A1 80         [ 4] 3390 	call clear_block_buffer ; -- y=*block_buffer	
                                   3391 ; write signature
      00A340 27 03 CC         [ 2] 3392 	ldw x,SIGNATURE ; "TB" 
      00A343 97 25            [ 2] 3393 	ldw (y),x 
      00A345 72 A9 00 02      [ 2] 3394 	addw y,#2
      00A345 FE 72            [ 2] 3395 	ldw x,(TOWRITE,sp)
      00A347 5C 00            [ 2] 3396 	ldw (y),x
      00A349 02 72 5C 00      [ 2] 3397 	addw y,#2   
      00A34D 02 A3            [ 1] 3398 	ld a,#(BLOCK_SIZE-4)
      00A34F A3 56 27         [ 2] 3399 	cpw x,#(BLOCK_SIZE-4) 
      00A352 03 CC            [ 1] 3400 	jrugt 3$
      00A354 97               [ 1] 3401 	ld a,xl 
      00A355 25 04            [ 1] 3402 3$:	ld (CNT_LO,sp),a   
      00A356 CE 00 1B         [ 2] 3403 	ldw x,txtbgn 
      00A356 72 04            [ 2] 3404 	ldw (XTEMP,sp),x 
      002989                       3405 32$: 
      00A358 00 23            [ 2] 3406 	ldw x,(XTEMP,sp)
      00A35A 03 CC            [ 1] 3407 	ld a,(CNT_LO,sp)
      00A35C 97 25 CD         [ 4] 3408 	call fill_write_buffer 
      00A35F 9B AC            [ 2] 3409 	ldw (XTEMP,sp),x 
      00A361 A1 84 27         [ 2] 3410 	ldw x,#block_buffer
      00A364 03 CC 97         [ 4] 3411 	call write_buffer
      00A367 25 90 F6         [ 2] 3412 	ldw x,#BLOCK_SIZE 
      00A36A 93 EE 01         [ 4] 3413 	call incr_farptr  
                                   3414 ; following blocks 
      00A36D 72 A9            [ 2] 3415 	ldw x,(XTEMP,sp)
      00A36F 00 03 6B         [ 2] 3416 	cpw x,txtend 
      00A372 06 1F            [ 1] 3417 	jruge 9$ 
      00A374 07 CD            [ 2] 3418 	ldw x,(TOWRITE,sp)
      00A376 98 8C A1         [ 2] 3419 	subw x,(COUNT,sp)
      00A379 00 27            [ 2] 3420 	ldw (TOWRITE,sp),x 
      00A37B 17 A1            [ 1] 3421 	ld a,#BLOCK_SIZE 
      00A37D 80 26 0E         [ 2] 3422 	cpw x,#BLOCK_SIZE 
      00A380 FE 72            [ 1] 3423 	jruge 4$ 
      00A382 5C               [ 1] 3424 	ld a,xl 
      00A383 00 02            [ 1] 3425 4$:	ld (CNT_LO,sp),a 
      00A385 72 5C 00         [ 4] 3426 	call clear_block_buffer 
      00A388 02 A3            [ 2] 3427 	jra 32$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



      0029BB                       3428 9$:	_drop VSIZE 
      00A38A A3 9C            [ 2]    1     addw sp,#VSIZE 
      00A38C 27 0E            [ 2] 3429     popw y 
      00A38E 85               [ 2] 3430 	popw x 
      00A38E 55               [ 4] 3431 	ret 
                                   3432 
      00A38F 00 04                 3433 SIGNATURE: .ascii "TB"
      00A391 00 02                 3434 ERASED: .ascii "XX" 
                                   3435 
                                   3436 ;---------------------
                                   3437 ; check if there is 
                                   3438 ; an erased program 
                                   3439 ; at this address 
                                   3440 ; input:
                                   3441 ;    X    address 
                                   3442 ; output:
                                   3443 ;    Z    Set=erased program 
                                   3444 ;--------------------
      00A393                       3445 is_erased:
      00A393 0F               [ 2] 3446 	pushw x 
                                   3447 ; align to BLOCK 
      00A394 03               [ 1] 3448 	ld a,xl 
      00A395 AE 00            [ 1] 3449 	and a,#BLOCK_SIZE 
      00A397 01               [ 1] 3450 	ld xl,a 
      00A398 1F               [ 2] 3451 	ldw x,(x)
      00A399 04 20 2F         [ 2] 3452 	cpw x,ERASED 
      00A39C 85               [ 2] 3453 	popw x 
      00A39C 72               [ 4] 3454 	ret 
                                   3455 
                                   3456 ;----------------------------
                                   3457 ;  skip to next program
                                   3458 ;  block 
                                   3459 ; input:
                                   3460 ;    X   actual program addr
                                   3461 ; output:
                                   3462 ;    X   next block 
                                   3463 ;        after program 
                                   3464 ;----------------------------
      0029D0                       3465 skip_to_next:
                                   3466 ; align to block 
      00A39D 04               [ 1] 3467 	ld a,xl 
      00A39E 00 23            [ 1] 3468 	and a,#BLOCK_SIZE 
      00A3A0 03               [ 1] 3469 	ld xl,a 
      00A3A1 CC 97 25         [ 2] 3470 	ldw acc16,x 
      00A3A4 CD 9B            [ 2] 3471 	ldw x,(2,x)
      00A3A6 AC A1 84 27      [ 2] 3472 	addw x,acc16 ; blk_addr+prg_size 
      00A3AA 03 CC 97         [ 2] 3473 	addw x,#4 ; +header fields 
                                   3474 ; align to next block 
      00A3AD 25 00 7F         [ 2] 3475 	addw x,#BLOCK_SIZE-1 
      00A3AE 9F               [ 1] 3476 	ld a,xl 
      00A3AE 90 F6            [ 1] 3477 	and a,#0x80 
      00A3B0 93               [ 1] 3478 	ld xl,a  
      00A3B1 EE               [ 4] 3479 	ret 
                                   3480 
                                   3481 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



                                   3482 ;---------------------
                                   3483 ; BASIC: DIR 
                                   3484 ; list programs saved 
                                   3485 ; in flash 
                                   3486 ;--------------------
                           000001  3487 	XTEMP=1 
      0029E8                       3488 cmd_dir:
      00A3B2 01 72 A9         [ 4] 3489 	call cmd_line_only
      00A3B5 00 03 6B         [ 2] 3490 	ldw x,#app_space 
      00A3B8 03               [ 2] 3491 	pushw x 
      0029EF                       3492 1$: 
      00A3B9 1F 04 4D         [ 4] 3493 	call qsign 
      00A3BC 2A 0D            [ 1] 3494 	jrne 4$
      00A3BE 7B 06 1E         [ 2] 3495 	addw x,#4
      00A3C1 07 1D 00 01      [ 1] 3496 	mov base,#16
      00A3C5 A2 00 6B         [ 4] 3497 	call prt_i16
      00A3C8 06 1F            [ 1] 3498 	ld a,#SPACE 
      00A3CA 07 08 FF         [ 4] 3499 	call putc 
      00A3CB 1E 01            [ 2] 3500 	ldw x,(1,sp)
      00A3CB CE 00            [ 2] 3501 	ldw x,(2,x)
      00A3CD 05 1F 0D CE      [ 1] 3502 	mov base,#10  
      00A3D1 00 01 1F         [ 4] 3503 	call prt_i16 
      00A3D4 0B 72 15         [ 2] 3504 	ldw x,#STR_BYTES
      00A3D7 00 23 72         [ 4] 3505 	call puts
      00A3DA 5C 00            [ 1] 3506 	ld a,#', 
      00A3DC 20 81 FF         [ 4] 3507 	call putc
      00A3DE 1E 01            [ 2] 3508 	ldw x,(1,sp)
      00A3DE 72 5D 00         [ 2] 3509 	addw x,#8
      00A3E1 20 26 03         [ 4] 3510 	call puts 
      00A3E4 CC 97            [ 1] 3511 	ld a,#CR 
      00A3E6 25 08 FF         [ 4] 3512 	call putc
      00A3E7 1E 01            [ 2] 3513 	ldw x,(1,sp)
      00A3E7 A6 85 CD         [ 4] 3514 3$:	call skip_to_next
      00A3EA 9A 58            [ 2] 3515 	ldw (1,sp),x 
      00A3EC CD 98            [ 2] 3516 	jra 1$
      002A2F                       3517 4$: ; check if it is an erased program 
      00A3EE B4 13 09         [ 4] 3518 	call is_erased 
      00A3F1 27 03            [ 1] 3519 	jreq 3$ 
      002A34                       3520 8$: ; done 
      002A34                       3521 	_drop 2 
      00A3F3 CC 97            [ 2]    1     addw sp,#2 
      00A3F5 25               [ 4] 3522 	ret 
                                   3523 
                                   3524 ;---------------------
                                   3525 ; BASIC: WRITE expr1,expr2|char|string[,expr|char|string]* 
                                   3526 ; write 1 or more byte to FLASH or EEPROM
                                   3527 ; starting at address  
                                   3528 ; input:
                                   3529 ;   expr1  	is address 
                                   3530 ;   expr2,...,exprn   are bytes to write
                                   3531 ; output:
                                   3532 ;   none 
                                   3533 ;---------------------
      00A3F6                       3534 write:
      00A3F6 CF 00 1A         [ 4] 3535 	call expression
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



      00A3F9 F6 EE            [ 1] 3536 	cp a,#TK_INTGR 
      00A3FB 01 72            [ 1] 3537 	jreq 0$
      00A3FD FB 04 19         [ 2] 3538 	jp syntax_error
      002A41                       3539 0$: _xpop 
      00A400 03 72            [ 1]    1     ld a,(y)
      00A402 C7               [ 1]    2     ldw x,y 
      00A403 00 1A            [ 2]    3     ldw x,(1,x)
      00A405 72 5C 00 1B      [ 2]    4     addw y,#CELL_SIZE 
      00A409 72 CF 00         [ 1] 3540 	ld farptr,a 
      00A40C 1A C7 00         [ 2] 3541 	ldw ptr16,x 
      002A50                       3542 1$:	
      00A40F 0D CF 00         [ 4] 3543 	call next_token 
      00A412 0E 7B            [ 1] 3544 	cp a,#TK_COMMA 
      00A414 06 1E            [ 1] 3545 	jreq 2$ 
      00A416 07 72            [ 2] 3546 	jra 9$ ; no more data 
      00A418 B0 00 0E         [ 4] 3547 2$:	call next_token 
      00A41B C2 00            [ 1] 3548 	cp a,#TK_CHAR 
      00A41D 0D 18            [ 1] 3549 	jreq 4$ 
      00A41F 03 A8            [ 1] 3550 	cp a,#TK_QSTR
      00A421 80 2B            [ 1] 3551 	jreq 6$
      002A64                       3552 	_unget_token 
      00A423 12 20 25 7B 03   [ 1]    1      mov in,in.saved  
      00A428 2A 07 C6         [ 4] 3553 	call expression
      00A42B 00 0F            [ 1] 3554 	cp a,#TK_INTGR
      00A42D 2F 07            [ 1] 3555 	jreq 3$
      00A42F 20 1A A5         [ 2] 3556 	jp syntax_error
      00A431                       3557 3$:	_xpop 
      00A431 72 0E            [ 1]    1     ld a,(y)
      00A433 00               [ 1]    2     ldw x,y 
      00A434 0F 15            [ 2]    3     ldw x,(1,x)
      00A436 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A436 1E               [ 1] 3558 	ld a,xl 
      00A437 0D               [ 1] 3559 	clrw x 
      00A438 CF 00 05         [ 4] 3560 	call write_byte
      00A43B 72 01            [ 2] 3561 	jra 1$ 
      002A83                       3562 4$: ; write character 
      00A43D 00               [ 1] 3563 	ld a,(x)
      00A43E 23 05 E6 02      [ 1] 3564 	inc in 
      00A442 C7               [ 1] 3565 	clrw x 
      00A443 00 03 1E         [ 4] 3566 	call write_byte 
      00A446 0B CF            [ 2] 3567 	jra 1$ 
      002A8E                       3568 6$: ; write string 
      00A448 00               [ 2] 3569 	pushw x 
      00A449 01               [ 1] 3570 	ld a,(x)
      00A44A 81 5C 00 01      [ 1] 3571 	inc in 
      00A44B 5F               [ 1] 3572 	clrw x 
      00A44B 85 5B 0D         [ 4] 3573 	call write_byte 
      00A44E 72               [ 2] 3574 	popw x 
      00A44F 5A               [ 1] 3575 	ld a,(x)
      00A450 00 20            [ 1] 3576 	jreq 1$
      00A452 FC               [ 1] 3577 	incw x 
      00A453 20 EF            [ 2] 3578 	jra 6$ 	
      002A9F                       3579 9$:
      00A453 CD               [ 4] 3580 	ret 
                                   3581 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



                                   3582 
                                   3583 ;---------------------
                                   3584 ;BASIC: CHAR(expr)
                                   3585 ; évaluate expression 
                                   3586 ; and take the 7 least 
                                   3587 ; bits as ASCII character
                                   3588 ; output: 
                                   3589 ; 	A char 
                                   3590 ;---------------------
      002AA0                       3591 func_char:
      00A454 98 8C A1         [ 4] 3592 	call func_args 
      00A457 84 27            [ 1] 3593 	cp a,#1
      00A459 07 A1            [ 1] 3594 	jreq 1$
      00A45B 03 27 26         [ 2] 3595 	jp syntax_error
      002AAA                       3596 1$:	_xpop
      00A45E CC 97            [ 1]    1     ld a,(y)
      00A460 25               [ 1]    2     ldw x,y 
      00A461 EE 01            [ 2]    3     ldw x,(1,x)
      00A461 90 89 CD 98      [ 2]    4     addw y,#CELL_SIZE 
      00A465 BE               [ 1] 3597 	ld a,xl
      00A466 4F 90            [ 1] 3598 	and a,#0x7f 
      00A468 CE               [ 4] 3599 	ret
                                   3600 
                                   3601 ;---------------------
                                   3602 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3603 ; extract first character 
                                   3604 ; of string argument 
                                   3605 ; output:
                                   3606 ;    A:X    int24 
                                   3607 ;---------------------
      002AB7                       3608 ascii:
      00A469 00 05            [ 1] 3609 	ld a,#TK_LPAREN
      00A46B 90 FE 90         [ 4] 3610 	call expect 
      00A46E 89 13 01         [ 4] 3611 	call next_token 
      00A471 5B 02            [ 1] 3612 	cp a,#TK_QSTR 
      00A473 25 01            [ 1] 3613 	jreq 1$
      00A475 4C 04            [ 1] 3614 	cp a,#TK_CHAR 
      00A476 27 12            [ 1] 3615 	jreq 2$ 
      00A476 CD 8C            [ 1] 3616 	cp a,#TK_CFUNC 
      00A478 C5 5D            [ 1] 3617 	jreq 0$
      00A47A 26 05 A6         [ 2] 3618 	jp syntax_error
      002ACE                       3619 0$: ; cfunc 
      00A47D 05               [ 4] 3620 	call (x)
      00A47E CC 97            [ 2] 3621 	jra 3$
      002AD1                       3622 1$: ; quoted string 
      00A480 27               [ 1] 3623 	ld a,(x)
      00A481 90               [ 1] 3624 	push a  
      00A482 85 81 25         [ 4] 3625 	call skip_string
      00A484 84               [ 1] 3626 	pop a  	
      00A484 90 89            [ 2] 3627 	jra 3$ 
      002AD9                       3628 2$: ; character 
      00A486 89 CD 98         [ 4] 3629 	call get_char 
      00A489 A5               [ 1] 3630 3$:	clrw x 
      00A48A 72               [ 1] 3631 	rlwa x   
      002ADE                       3632 4$:	_xpush  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



      00A48B 5F 00 0E 90      [ 2]    1     subw y,#CELL_SIZE
      00A48F CE 00            [ 1]    2     ld (y),a 
      00A491 1C 90 E6         [ 2]    3     ldw (1,y),x 
      00A494 03 A1            [ 1] 3633 	ld a,#TK_RPAREN 
      00A496 03 27 15         [ 4] 3634 	call expect
      002AEC                       3635 9$:	
      002AEC                       3636 	_xpop  
      00A499 90 E6            [ 1]    1     ld a,(y)
      00A49B 02               [ 1]    2     ldw x,y 
      00A49C C7 00            [ 2]    3     ldw x,(1,x)
      00A49E 0F 72 B9 00      [ 2]    4     addw y,#CELL_SIZE 
      00A4A2 0E               [ 4] 3637 	ret 
                                   3638 
                                   3639 ;---------------------
                                   3640 ;BASIC: KEY
                                   3641 ; wait for a character 
                                   3642 ; received from STDIN 
                                   3643 ; input:
                                   3644 ;	none 
                                   3645 ; output:
                                   3646 ;	a	 character 
                                   3647 ;---------------------
      002AF6                       3648 key:
      00A4A3 90 C3 00         [ 4] 3649 	call getc 
      00A4A6 1E               [ 4] 3650 	ret
                                   3651 
                                   3652 ;----------------------
                                   3653 ; BASIC: QKEY
                                   3654 ; Return true if there 
                                   3655 ; is a character in 
                                   3656 ; waiting in STDIN 
                                   3657 ; input:
                                   3658 ;  none 
                                   3659 ; output:
                                   3660 ;   A     0|-1
                                   3661 ;-----------------------
      002AFA                       3662 qkey:: 
      00A4A7 25               [ 1] 3663 	clrw x 
      00A4A8 E9 A6 0A         [ 1] 3664 	ld a,rx1_head
      00A4AB CC 97 27         [ 1] 3665 	sub a,rx1_tail 
      00A4AE 27 03            [ 1] 3666 	jreq 9$ 
      00A4AE 90               [ 2] 3667 	cplw x
      00A4AF 89 72            [ 1] 3668 	ld a,#255    
      002B06                       3669 9$: 
      00A4B1 A9               [ 4] 3670 	ret 
                                   3671 
                                   3672 ;-------------------------
                                   3673 ; BASIC: UFLASH 
                                   3674 ; return free flash address
                                   3675 ; scan all block starting at 
                                   3676 ; app_space and return 
                                   3677 ; address of first free block 
                                   3678 ; below extended memory.  
                                   3679 ; return 0 if no free block 
                                   3680 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



                                   3681 ;  none 
                                   3682 ; output:
                                   3683 ;	A:X		FLASH free address
                                   3684 ;---------------------------
      002B07                       3685 uflash:
      00A4B2 00 04 1E 03      [ 1] 3686 	clr farptr 
      00A4B6 CD 94 24         [ 2] 3687 	ldw x,#app_space 
      00A4B9 26               [ 2] 3688 	pushw x 
      00A4BA 04 90 85         [ 2] 3689 1$:	ldw ptr16,x 
      00A4BD 20 DA 6E         [ 4] 3690 	call scan_block 
      00A4BF 27 0F            [ 1] 3691 	jreq 8$
      00A4BF 85 5B            [ 2] 3692 	ldw x,(1,sp)
      00A4C1 02 90 85         [ 2] 3693 	addw x,#BLOCK_SIZE 
      00A4C4 81 04            [ 1] 3694 	jreq 7$ 
      00A4C5 1F 01            [ 2] 3695 	ldw (1,sp),x 
      00A4C5 CD 9A            [ 2] 3696 	jra 1$ 
      002B22                       3697 7$: ; no free block 
      00A4C7 4D CD            [ 1] 3698 	clr (1,sp) 
      00A4C9 9B AC            [ 1] 3699 	clr (2,sp)
      00A4CB A1               [ 2] 3700 8$: popw x 
      00A4CC 84               [ 1] 3701 	clr a 
      00A4CD 27               [ 4] 3702 	ret 
                                   3703 
                                   3704 
                                   3705 ;---------------------
                                   3706 ; BASIC: USR(addr,arg)
                                   3707 ; execute a function written 
                                   3708 ; in binary code.
                                   3709 ; input:
                                   3710 ;   addr	routine address 
                                   3711 ;   arg 	is an argument
                                   3712 ;           it can be ignore 
                                   3713 ;           by cally. 
                                   3714 ; output:
                                   3715 ;   xstack 	value returned by cally  
                                   3716 ;---------------------
      002B29                       3717 usr:
      00A4CE 03 CC 97         [ 4] 3718 	call func_args 
      00A4D1 25 90            [ 1] 3719 	cp a,#2
      00A4D3 F6 93            [ 1] 3720 	jreq 1$  
      00A4D5 EE 01 72         [ 2] 3721 	jp syntax_error 
      002B33                       3722 1$: 
      002B33                       3723 	_at_next ; A:X addr 
      00A4D8 A9 00 03         [ 1]    1     ld a,(3,y)
      00A4DB 9F               [ 1]    2     ldw x,y 
      00A4DC 27 68            [ 2]    3     ldw x,(4,x)
      00A4DE 88 CD 98         [ 2] 3724 	ldw ptr16,X 
      002B3C                       3725 	_xpop  ; arg 
      00A4E1 8C A1            [ 1]    1     ld a,(y)
      00A4E3 80               [ 1]    2     ldw x,y 
      00A4E4 27 03            [ 2]    3     ldw x,(1,x)
      00A4E6 CC 97 25 FE      [ 2]    4     addw y,#CELL_SIZE 
      002B45                       3726 	_store_top ; overwrite addr 
      00A4EA 72 5C            [ 1]    1     ld (y),a 
      00A4EC 00 02 72         [ 2]    2     ldw (1,y),x     
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



      00A4EF 5C 00 02 A3      [ 6] 3727     call [ptr16]
      00A4F3 A5               [ 4] 3728 	ret 
                                   3729 
                                   3730 
                                   3731 ;------------------------------
                                   3732 ; BASIC: BYE 
                                   3733 ; halt mcu in its lowest power mode 
                                   3734 ; wait for reset or external interrupt
                                   3735 ; do a cold start on wakeup.
                                   3736 ;------------------------------
      002B4F                       3737 bye:
      00A4F4 50 27 08 A3 A5   [ 2] 3738 	btjf UART1_SR,#UART_SR_TC,.
      00A4F9 63               [10] 3739 	halt
      00A4FA 27 03 CC         [ 2] 3740 	jp cold_start  
                                   3741 
                                   3742 ;----------------------------------
                                   3743 ; BASIC: SLEEP 
                                   3744 ; halt mcu until reset or external
                                   3745 ; interrupt.
                                   3746 ; Resume progam after SLEEP command
                                   3747 ;----------------------------------
      002B58                       3748 sleep:
      00A4FD 97 25 52 30 FB   [ 2] 3749 	btjf UART1_SR,#UART_SR_TC,.
      00A4FF 72 16 00 22      [ 1] 3750 	bset flags,#FSLEEP
      00A4FF 84               [10] 3751 	halt 
      00A500 89               [ 4] 3752 	ret 
                                   3753 
                                   3754 ;-------------------------------
                                   3755 ; BASIC: PAUSE expr 
                                   3756 ; suspend execution for n msec.
                                   3757 ; input:
                                   3758 ;	none
                                   3759 ; output:
                                   3760 ;	none 
                                   3761 ;------------------------------
      002B63                       3762 pause:
      00A501 88 1B 2C         [ 4] 3763 	call expression
      00A502 A1 84            [ 1] 3764 	cp a,#TK_INTGR
      00A502 0A 01            [ 1] 3765 	jreq 1$ 
      00A504 27 26 CD         [ 2] 3766 	jp syntax_error
      002B6D                       3767 1$: _xpop 
      00A507 98 8C            [ 1]    1     ld a,(y)
      00A509 A1               [ 1]    2     ldw x,y 
      00A50A 84 27            [ 2]    3     ldw x,(1,x)
      00A50C 07 A1 03 27      [ 2]    4     addw y,#CELL_SIZE 
      002B76                       3768 pause02:
      00A510 0D CC 97         [ 2] 3769 	ldw timer,x 
      00A513 25 00 12         [ 2] 3770 1$: ldw x,timer 
      00A514 5D               [ 2] 3771 	tnzw x 
      00A514 C6 00            [ 1] 3772 	jreq 2$
      00A516 02               [10] 3773 	wfi 
      00A517 AB 03            [ 1] 3774 	jrne 1$
      002B82                       3775 2$:	
      00A519 C7               [ 4] 3776 	ret 
                                   3777 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



                                   3778 ;------------------------------
                                   3779 ; BASIC: AWU expr
                                   3780 ; halt mcu for 'expr' milliseconds
                                   3781 ; use Auto wakeup peripheral
                                   3782 ; all oscillators stopped except LSI
                                   3783 ; range: 1ms - 511ms
                                   3784 ; input:
                                   3785 ;  none
                                   3786 ; output:
                                   3787 ;  none:
                                   3788 ;------------------------------
      002B83                       3789 awu:
      00A51A 00 02 20         [ 4] 3790   call expression
      00A51D 03 CD            [ 1] 3791   cp a,#TK_INTGR
      00A51F 98 A5            [ 1] 3792   jreq 1$
      00A521 CC 16 A5         [ 2] 3793   jp syntax_error
      002B8D                       3794 1$: _xpop 
      00A521 CD 98            [ 1]    1     ld a,(y)
      00A523 8C               [ 1]    2     ldw x,y 
      00A524 A1 08            [ 2]    3     ldw x,(1,x)
      00A526 27 DA 5B 03      [ 2]    4     addw y,#CELL_SIZE 
      002B96                       3795 awu02:
      00A52A 20 1A 00         [ 2] 3796   cpw x,#5120
      00A52C 2B 0C            [ 1] 3797   jrmi 1$ 
      00A52C 5B 01 CD A4      [ 1] 3798   mov AWU_TBR,#15 
      00A530 53 CF            [ 1] 3799   ld a,#30
      00A532 00               [ 2] 3800   div x,a
      00A533 1A 55            [ 1] 3801   ld a,#16
      00A535 00               [ 2] 3802   div x,a 
      00A536 03 00            [ 2] 3803   jra 4$
      002BA7                       3804 1$: 
      00A538 02 85 A3         [ 2] 3805   cpw x,#2048
      00A53B A5 50            [ 1] 3806   jrmi 2$ 
      00A53D 26 05 CE 00      [ 1] 3807   mov AWU_TBR,#14
      00A541 1A 20            [ 1] 3808   ld a,#80
      00A543 12               [ 2] 3809   div x,a 
      00A544 20 10            [ 2] 3810   jra 4$   
      002BB5                       3811 2$:
      00A544 20 26 50 F2      [ 1] 3812   mov AWU_TBR,#7
      00A546                       3813 3$:  
                                   3814 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A546 55 00 03         [ 2] 3815   cpw x,#64 
      00A549 00 02            [ 2] 3816   jrule 4$ 
      00A54B 5B 02 CC 97      [ 1] 3817   inc AWU_TBR 
      00A54F D8               [ 2] 3818   srlw x 
      00A550 20 F4            [ 2] 3819   jra 3$ 
      002BC5                       3820 4$:
      00A550 CD               [ 1] 3821   ld a, xl
      00A551 9A               [ 1] 3822   dec a 
      00A552 4D 01            [ 1] 3823   jreq 5$
      00A553 4A               [ 1] 3824   dec a 	
      002BCA                       3825 5$: 
      00A553 CD A4            [ 1] 3826   and a,#0x3e 
      00A555 53 50 F1         [ 1] 3827   ld AWU_APR,a 
      00A556 72 18 50 F0      [ 1] 3828   bset AWU_CSR,#AWU_CSR_AWUEN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



      00A556 CF               [10] 3829   halt 
                                   3830 
      00A557 00               [ 4] 3831   ret 
                                   3832 
                                   3833 ;------------------------------
                                   3834 ; BASIC: TICKS
                                   3835 ; return msec ticks counter value 
                                   3836 ; input:
                                   3837 ; 	none 
                                   3838 ; output:
                                   3839 ;	X 		TK_INTGR
                                   3840 ;-------------------------------
      002BD5                       3841 get_ticks:
      00A558 05 E6 02         [ 1] 3842 	ld a,ticks 
      00A55B C7 00 03         [ 2] 3843 	ldw x,ticks+1 
      00A55E 35               [ 4] 3844 	ret 
                                   3845 
                                   3846 ;------------------------------
                                   3847 ; BASIC: ABS(expr)
                                   3848 ; return absolute value of expr.
                                   3849 ; input:
                                   3850 ;   none
                                   3851 ; output:
                                   3852 ;   xstack    positive int24 
                                   3853 ;-------------------------------
      002BDC                       3854 abs:
      00A55F 03 00 02         [ 4] 3855 	call func_args 
      00A562 81 01            [ 1] 3856 	cp a,#1 
      00A563 27 03            [ 1] 3857 	jreq 0$ 
      00A563 CD 9A 4D         [ 2] 3858 	jp syntax_error
      00A566                       3859 0$:  
      00A566 CD A4 53         [ 4] 3860 	call abs24 
      002BE9                       3861 	_xpop 
      00A569 CF 00            [ 1]    1     ld a,(y)
      00A56B 1A               [ 1]    2     ldw x,y 
      00A56C EE 01            [ 2]    3     ldw x,(1,x)
      00A56C 85 52 04 89      [ 2]    4     addw y,#CELL_SIZE 
      00A570 CE               [ 4] 3862 	ret 
                                   3863 
                                   3864 ;------------------------------
                                   3865 ; BASIC: LSHIFT(expr1,expr2)
                                   3866 ; logical shift left expr1 by 
                                   3867 ; expr2 bits 
                                   3868 ; output:
                                   3869 ; 	A:x 	result 
                                   3870 ;------------------------------
      002BF3                       3871 lshift:
      00A571 00 05 1F         [ 4] 3872 	call func_args
      00A574 03 CE            [ 1] 3873 	cp a,#2 
      00A576 00 01            [ 1] 3874 	jreq 1$
      00A578 1F 05 CE         [ 2] 3875 	jp syntax_error
      002BFD                       3876 1$: _xpop 
      00A57B 00 1A            [ 1]    1     ld a,(y)
      00A57D 20               [ 1]    2     ldw x,y 
      00A57E D7 01            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



      00A57F 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A57F CD               [ 1] 3877 	ld a,xl 
      00A580 9A               [ 1] 3878 	push a      
      002C08                       3879 	_xpop  ; T>A:X 
      00A581 4D 1E            [ 1]    1     ld a,(y)
      00A583 03               [ 1]    2     ldw x,y 
      00A584 CF 00            [ 2]    3     ldw x,(1,x)
      00A586 05 E6 02 C7      [ 2]    4     addw y,#CELL_SIZE 
      00A58A 00 03            [ 1] 3880 	tnz (1,sp) 
      00A58C 1E 05            [ 1] 3881 	jreq 4$
      00A58E CF               [ 1] 3882 2$:	rcf 
      00A58F 00               [ 2] 3883 	rlcw x 
      00A590 01               [ 1] 3884 	rlc a 
      00A591 85 5B            [ 1] 3885 	dec (1,sp) 
      00A593 04 FC            [ 1] 3886 	jrne 2$
      00A595                       3887 4$: _drop 1 
      00A595 4D 26            [ 2]    1     addw sp,#1 
      00A597 0D               [ 4] 3888 	ret
                                   3889 
                                   3890 ;------------------------------
                                   3891 ; BASIC: RSHIFT(expr1,expr2)
                                   3892 ; logical shift right expr1 by 
                                   3893 ; expr2 bits.
                                   3894 ; output:
                                   3895 ; 	A 		TK_INTGR
                                   3896 ;   X 		result 
                                   3897 ;------------------------------
      002C1F                       3898 rshift:
      00A598 A3 B9 00         [ 4] 3899 	call func_args
      00A59B 25 07            [ 1] 3900 	cp a,#2 
      00A59D 89 CD            [ 1] 3901 	jreq 1$
      00A59F A9 26 85         [ 2] 3902 	jp syntax_error
      002C29                       3903 1$: _xpop ; T>A:X
      00A5A2 27 01            [ 1]    1     ld a,(y)
      00A5A4 43               [ 1]    2     ldw x,y 
      00A5A5 81 01            [ 2]    3     ldw x,(1,x)
      00A5A6 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A5A6 72               [ 1] 3904     ld a,xl 
      00A5A7 01               [ 1] 3905 	push a    
      002C34                       3906 	_xpop  
      00A5A8 00 23            [ 1]    1     ld a,(y)
      00A5AA 02               [ 1]    2     ldw x,y 
      00A5AB 4F 81            [ 2]    3     ldw x,(1,x)
      00A5AD 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A5AD 72 09            [ 1] 3907 	tnz (1,sp)
      00A5AF 00 23            [ 1] 3908 	jreq 4$
      00A5B1 12               [ 1] 3909 2$:	rcf 
      00A5B2 5B               [ 1] 3910 	rrc a 
      00A5B3 02               [ 2] 3911 	rrcw x 
      00A5B4 CD A1            [ 1] 3912 	dec (1,sp) 
      00A5B6 37 5B            [ 1] 3913 	jrne 2$
      002C48                       3914 4$: _drop 1 
      00A5B8 04 72            [ 2]    1     addw sp,#1 
      00A5BA 19               [ 4] 3915 	ret
                                   3916 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



                                   3917 ;--------------------------
                                   3918 ; BASIC: FCPU integer
                                   3919 ; set CPU frequency 
                                   3920 ;-------------------------- 
                                   3921 
      002C4B                       3922 fcpu:
      00A5BB 00 23            [ 1] 3923 	ld a,#TK_INTGR
      00A5BD 72 10 00         [ 4] 3924 	call expect 
      00A5C0 23 CC 97         [ 4] 3925 	call get_int24 
      00A5C3 D0               [ 1] 3926 	ld a,xl 
      00A5C4 A4 07            [ 1] 3927 	and a,#7 
      00A5C4 CD 98 8C         [ 1] 3928 	ld CLK_CKDIVR,a 
      00A5C7 A1               [ 4] 3929 	ret 
                                   3930 
                                   3931 ;------------------------------
                                   3932 ; BASIC: PMODE pin#, mode 
                                   3933 ; Arduino pin. 
                                   3934 ; define pin as input or output
                                   3935 ; pin#: {0..15}
                                   3936 ; mode: INPUT|OUTPUT  
                                   3937 ;------------------------------
                           000001  3938 	PINNO=1
                           000001  3939 	VSIZE=1
      002C5A                       3940 pin_mode:
      002C5A                       3941 	_vars VSIZE 
      00A5C8 03 26            [ 2]    1     sub sp,#VSIZE 
      00A5CA 1F 89 CD         [ 4] 3942 	call arg_list 
      00A5CD 98 A5            [ 1] 3943 	cp a,#2 
      00A5CF 85 CD            [ 1] 3944 	jreq 1$
      00A5D1 B2 81 26         [ 2] 3945 	jp syntax_error 
      002C66                       3946 1$: _xpop 
      00A5D4 05 A6            [ 1]    1     ld a,(y)
      00A5D6 12               [ 1]    2     ldw x,y 
      00A5D7 CC 97            [ 2]    3     ldw x,(1,x)
      00A5D9 27 CF 00 1C      [ 2]    4     addw y,#CELL_SIZE 
      00A5DD 1D 00 02         [ 2] 3947 	ldw ptr16,x ; mode 
      002C72                       3948 	_xpop ; Dx pin 
      00A5E0 FE 72            [ 1]    1     ld a,(y)
      00A5E2 BB               [ 1]    2     ldw x,y 
      00A5E3 00 1C            [ 2]    3     ldw x,(1,x)
      00A5E5 CF 00 1E 20      [ 2]    4     addw y,#CELL_SIZE 
      00A5E9 19 55 00         [ 4] 3949 	call select_pin 
      00A5EC 04 00            [ 1] 3950 	ld (PINNO,sp),a  
      00A5EE 02 CE            [ 1] 3951 	ld a,#1 
      00A5F0 00 1C            [ 1] 3952 	tnz (PINNO,sp)
      00A5F2 C3 00            [ 1] 3953 	jreq 4$
      00A5F4 1E               [ 1] 3954 2$:	sll a 
      00A5F5 2B 0C            [ 1] 3955 	dec (PINNO,sp)
      00A5F7 AE 96            [ 1] 3956 	jrne 2$ 
      00A5F9 7C CD            [ 1] 3957 	ld (PINNO,sp),a
      00A5FB 89 DC            [ 1] 3958 	ld a,(PINNO,sp)
      00A5FD 55 00            [ 1] 3959 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A5FF 03 00            [ 1] 3960 	ld (GPIO_CR1,x),a 
      00A601 02 81            [ 1] 3961 4$:	ld a,#OUTP
      00A603 C1 00 0E         [ 1] 3962 	cp a,acc8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



      00A603 5B 02            [ 1] 3963 	jreq 6$
                                   3964 ; input mode
                                   3965 ; disable external interrupt 
      00A605 7B 01            [ 1] 3966 	ld a,(PINNO,sp)
      00A605 CD               [ 1] 3967 	cpl a 
      00A606 9D 79            [ 1] 3968 	and a,(GPIO_CR2,x)
      00A608 CD 94            [ 1] 3969 	ld (GPIO_CR2,x),a 
                                   3970 ;clear bit in DDR for input mode 
      00A60A 89 CE            [ 1] 3971 	ld a,(PINNO,sp)
      00A60C 00               [ 1] 3972 	cpl a 
      00A60D 1E CF            [ 1] 3973 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A60F 00 31            [ 1] 3974 	ld (GPIO_DDR,x),a 
      00A611 CF 00            [ 2] 3975 	jra 9$
      002CAA                       3976 6$: ;output mode  
      00A613 33 5F            [ 1] 3977 	ld a,(PINNO,sp)
      00A615 CF 00            [ 1] 3978 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A617 07 72            [ 1] 3979 	ld (GPIO_DDR,x),a 
      00A619 5F 00            [ 1] 3980 	ld a,(PINNO,sp)
      00A61B 09 72            [ 1] 3981 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A61D 5F 00            [ 1] 3982 	ld (GPIO_CR2,x),a 
      002CB6                       3983 9$:	
      002CB6                       3984 	_drop VSIZE 
      00A61F 0A CE            [ 2]    1     addw sp,#VSIZE 
      00A621 00               [ 4] 3985 	ret
                                   3986 
                                   3987 ;------------------------
                                   3988 ; select Arduino pin 
                                   3989 ; input:
                                   3990 ;   X 	 {0..15} Arduino Dx 
                                   3991 ; output:
                                   3992 ;   A     stm8s208 pin 
                                   3993 ;   X     base address s208 GPIO port 
                                   3994 ;---------------------------
      002CB9                       3995 select_pin:
      00A622 1C               [ 2] 3996 	sllw x 
      00A623 CF 00 05         [ 2] 3997 	addw x,#arduino_to_8s208 
      00A626 E6               [ 2] 3998 	ldw x,(x)
      00A627 02               [ 1] 3999 	ld a,xl 
      00A628 C7               [ 1] 4000 	push a 
      00A629 00               [ 1] 4001 	swapw x 
      00A62A 03 35            [ 1] 4002 	ld a,#5 
      00A62C 03               [ 4] 4003 	mul x,a 
      00A62D 00 02 72         [ 2] 4004 	addw x,#GPIO_BASE 
      00A630 10               [ 1] 4005 	pop a 
      00A631 00               [ 4] 4006 	ret 
                                   4007 ; translation from Arduino D0..D15 to stm8s208rb 
      002CC9                       4008 arduino_to_8s208:
      00A632 23 CC                 4009 .byte 3,6 ; D0 
      00A634 97 D0                 4010 .byte 3,5 ; D1 
      00A636 04 00                 4011 .byte 4,0 ; D2 
      00A636 5B 02                 4012 .byte 2,1 ; D3
      00A638 72 5D                 4013 .byte 6,0 ; D4
      00A63A 00 35                 4014 .byte 2,2 ; D5
      00A63C 27 1D                 4015 .byte 2,3 ; D6
      00A63E 72 5A                 4016 .byte 3,1 ; D7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



      00A640 00 35                 4017 .byte 3,3 ; D8
      00A642 1E 01                 4018 .byte 2,4 ; D9
      00A644 CF 00                 4019 .byte 4,5 ; D10
      00A646 05 1E                 4020 .byte 2,6 ; D11
      00A648 03 CF                 4021 .byte 2,7 ; D12
      00A64A 00 02                 4022 .byte 2,5 ; D13
      00A64C 1E 05                 4023 .byte 4,2 ; D14
      00A64E CF 00                 4024 .byte 4,1 ; D15
                                   4025 
                                   4026 
                                   4027 ;------------------------------
                                   4028 ; BASIC: RND(expr)
                                   4029 ; return random number 
                                   4030 ; between 1 and expr inclusive
                                   4031 ; xorshift16 
                                   4032 ; ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   4033 ; input:
                                   4034 ; 	none 
                                   4035 ; output:
                                   4036 ;	xstack 	random positive integer 
                                   4037 ;------------------------------
      002CE9                       4038 random:
      00A650 1C 1E 07         [ 4] 4039 	call func_args 
      00A653 CF 00            [ 1] 4040 	cp a,#1
      00A655 1E 5B            [ 1] 4041 	jreq 1$
      00A657 08 CC 97         [ 2] 4042 	jp syntax_error
      002CF3                       4043 1$:  
      002CF3                       4044 	_xpop   
      00A65A D0 F6            [ 1]    1     ld a,(y)
      00A65B 93               [ 1]    2     ldw x,y 
      00A65B AE 17            [ 2]    3     ldw x,(1,x)
      00A65D FF 94 CC 97      [ 2]    4     addw y,#CELL_SIZE 
      00A661 B1               [ 2] 4045 	pushw x 
      00A662 88               [ 1] 4046 	push a  
      00A662 CD 98            [ 1] 4047 	ld a,#0x80 
      00A664 8C A1            [ 1] 4048 	bcp a,(1,sp)
      00A666 85 27            [ 1] 4049 	jreq 2$
      00A668 03 CC            [ 1] 4050 	ld a,#ERR_BAD_VALUE
      00A66A 97 25 CD         [ 2] 4051 	jp tb_error
      002D09                       4052 2$: 
                                   4053 ; acc16=(x<<5)^x 
      00A66D 98 B4 CF         [ 2] 4054 	ldw x,seedx 
      00A670 00               [ 2] 4055 	sllw x 
      00A671 1A               [ 2] 4056 	sllw x 
      00A672 CD               [ 2] 4057 	sllw x 
      00A673 89               [ 2] 4058 	sllw x 
      00A674 88               [ 2] 4059 	sllw x 
      00A675 27               [ 1] 4060 	ld a,xh 
      00A676 03 CD 89         [ 1] 4061 	xor a,seedx 
      00A679 8F 72 3F         [ 1] 4062 	ld acc16,a 
      00A67C 00               [ 1] 4063 	ld a,xl 
      00A67D 1A 72 5C         [ 1] 4064 	xor a,seedx+1 
      00A680 00 1B 72         [ 1] 4065 	ld acc8,a 
                                   4066 ; seedx=seedy 
      00A683 3F 00 1A         [ 2] 4067 	ldw x,seedy 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



      00A686 72 5C 00         [ 2] 4068 	ldw seedx,x  
                                   4069 ; seedy=seedy^(seedy>>1)
      00A689 1B 72 C7         [ 2] 4070 	ldw x,seedy 
      00A68C 00               [ 2] 4071 	srlw x 
      00A68D 1A               [ 1] 4072 	ld a,xh 
      00A68E 81 00 16         [ 1] 4073 	xor a,seedy 
      00A68F C7 00 16         [ 1] 4074 	ld seedy,a  
      00A68F 90               [ 1] 4075 	ld a,xl 
      00A690 89 AE 00         [ 1] 4076 	xor a,seedy+1 
      00A693 64 90 AE         [ 1] 4077 	ld seedy+1,a 
                                   4078 ; acc16>>3 
      00A696 03 E8 20         [ 2] 4079 	ldw x,acc16 
      00A699 22               [ 2] 4080 	srlw x 
      00A69A 54               [ 2] 4081 	srlw x 
      00A69A 90               [ 2] 4082 	srlw x 
                                   4083 ; x=acc16^x 
      00A69B 89               [ 1] 4084 	ld a,xh 
      00A69C CD 9A 6A         [ 1] 4085 	xor a,acc16 
      00A69F A1 02 27         [ 1] 4086 	ld acc16,a 
      00A6A2 03               [ 1] 4087 	ld a,xl 
      00A6A3 CC 97 25         [ 1] 4088 	xor a,acc8 
      00A6A6 C7 00 0E         [ 1] 4089 	ld acc8,a 
                                   4090 ; seedy=acc16^seedy 
      00A6A6 90 F6 93         [ 1] 4091 	xor a,seedy+1
      00A6A9 EE               [ 1] 4092 	ld xl,a 
      00A6AA 01 72 A9         [ 1] 4093 	ld a,acc16 
      00A6AD 00 03 89         [ 1] 4094 	xor a,seedy
      00A6B0 90               [ 1] 4095 	ld xh,a 
      00A6B1 F6 93 EE         [ 2] 4096 	ldw seedy,x 
                                   4097 ; return seedx_lo&0x7f:seedy modulo expr + 1 
      00A6B4 01 72 A9         [ 1] 4098 	ld a,seedx+1
      00A6B7 00 03            [ 1] 4099 	and a,#127
      002D5E                       4100 	_xpush 
      00A6B9 90 93 85 03      [ 2]    1     subw y,#CELL_SIZE
      00A6BC 90 F7            [ 1]    2     ld (y),a 
      00A6BC 89 AE F4         [ 2]    3     ldw (1,y),x 
      00A6BF 24               [ 1] 4101 	pop a 
      00A6C0 65               [ 2] 4102 	popw x 
      002D69                       4103 	_xpush 
      00A6C1 90 A3 7A 12      [ 2]    1     subw y,#CELL_SIZE
      00A6C5 2B 01            [ 1]    2     ld (y),a 
      00A6C7 5C EF 01         [ 2]    3     ldw (1,y),x 
      00A6C8 CD 03 A1         [ 4] 4104 	call mod24 
      002D75                       4105 	_xpop
      00A6C8 9E C7            [ 1]    1     ld a,(y)
      00A6CA 53               [ 1]    2     ldw x,y 
      00A6CB 0D 9F            [ 2]    3     ldw x,(1,x)
      00A6CD C7 53 0E 8C      [ 2]    4     addw y,#CELL_SIZE 
      00A6D1 56 9E C7         [ 2] 4106 	addw x,#1 
      00A6D4 53 0F            [ 1] 4107 	adc a,#0  
      00A6D6 9F               [ 4] 4108 	ret 
                                   4109 
                                   4110 ;---------------------------------
                                   4111 ; BASIC: WORDS 
                                   4112 ; affiche la listes des mots du
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



                                   4113 ; dictionnaire ainsi que le nombre
                                   4114 ; de mots.
                                   4115 ;---------------------------------
                           000001  4116 	WLEN=1 ; word length
                           000002  4117 	LLEN=2 ; character sent to console
                           000003  4118 	WCNT=3 ; count words printed 
                           000003  4119 	VSIZE=3 
      002D84                       4120 words:
      00A6D7 C7 53 10         [ 4] 4121 	call cmd_line_only
      00A6DA 72 10            [ 2] 4122 	pushw y
      002D89                       4123 	_vars VSIZE
      00A6DC 53 08            [ 2]    1     sub sp,#VSIZE 
      00A6DE 72 10            [ 1] 4124 	clr (LLEN,sp)
      00A6E0 53 00            [ 1] 4125 	clr (WCNT,sp)
      00A6E2 72 10 53 04      [ 2] 4126 	ldw y,#kword_dict+2
      00A6E6 85               [ 1] 4127 0$:	ldw x,y
      00A6E7 CD               [ 1] 4128 	ld a,(x)
      00A6E8 AB F6            [ 1] 4129 	and a,#15 
      00A6EA 72 11            [ 1] 4130 	ld (WLEN,sp),a 
      00A6EC 53 08            [ 1] 4131 	inc (WCNT,sp)
      00A6EE 72               [ 1] 4132 1$:	incw x 
      00A6EF 11               [ 1] 4133 	ld a,(x)
      00A6F0 53 00 90         [ 4] 4134 	call putc 
      00A6F3 85 81            [ 1] 4135 	inc (LLEN,sp)
      00A6F5 0A 01            [ 1] 4136 	dec (WLEN,sp)
      00A6F5 CD 9A            [ 1] 4137 	jrne 1$
      00A6F7 6A A1            [ 1] 4138 	ld a,#70
      00A6F9 02 27            [ 1] 4139 	cp a,(LLEN,sp)
      00A6FB 12 A1            [ 1] 4140 	jrmi 2$   
      00A6FD 01 27            [ 1] 4141 	ld a,#SPACE 
      00A6FF 03 CC 97         [ 4] 4142 	call putc 
      00A702 25 4F            [ 1] 4143 	inc (LLEN,sp) 
      00A704 5F 72            [ 2] 4144 	jra 3$
      00A706 A2 00            [ 1] 4145 2$: ld a,#CR 
      00A708 03 90 F7         [ 4] 4146 	call putc 
      00A70B 90 EF            [ 1] 4147 	clr (LLEN,sp)
      00A70D 01 90 E6 03      [ 2] 4148 3$:	subw y,#2 
      00A711 93 EE            [ 2] 4149 	ldw y,(y)
      00A713 04 5D            [ 1] 4150 	jrne 0$ 
      00A715 27 25            [ 1] 4151 	ld a,#CR 
      00A717 90 F6 93         [ 4] 4152 	call putc  
      00A71A EE               [ 1] 4153 	clrw x 
      00A71B 01 72            [ 1] 4154 	ld a,(WCNT,sp)
      00A71D A9               [ 1] 4155 	ld xl,a 
      00A71E 00 03 72         [ 4] 4156 	call prt_i16 
      00A721 A9 00 03         [ 2] 4157 	ldw x,#words_count_msg
      00A724 9F A4 07         [ 4] 4158 	call puts 
      002DD6                       4159 	_drop VSIZE 
      00A727 4E C7            [ 2]    1     addw sp,#VSIZE 
      00A729 54 01            [ 2] 4160 	popw y 
      00A72B 72               [ 4] 4161 	ret 
      00A72C 16 50 CA 72 10 54 01  4162 words_count_msg: .asciz " words in dictionary\n"
             AE 00 1B 5A 9D 26 FA
             20 08 72 11 54 01 72
             17
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



                                   4163 
                                   4164 
                                   4165 ;-----------------------------
                                   4166 ; BASIC: TIMER expr 
                                   4167 ; initialize count down timer 
                                   4168 ;-----------------------------
      002DF1                       4169 set_timer:
      00A742 50 CA EA         [ 4] 4170 	call arg_list
      00A744 A1 01            [ 1] 4171 	cp a,#1 
      00A744 81 03            [ 1] 4172 	jreq 1$
      00A745 CC 16 A5         [ 2] 4173 	jp syntax_error
      002DFB                       4174 1$: 
      002DFB                       4175 	_xpop  
      00A745 CD 9A            [ 1]    1     ld a,(y)
      00A747 65               [ 1]    2     ldw x,y 
      00A748 A1 01            [ 2]    3     ldw x,(1,x)
      00A74A 27 03 CC 97      [ 2]    4     addw y,#CELL_SIZE 
      00A74E 25 90 F6         [ 2] 4176 	ldw timer,x 
      00A751 93               [ 4] 4177 	ret 
                                   4178 
                                   4179 ;------------------------------
                                   4180 ; BASIC: TIMEOUT 
                                   4181 ; return state of timer 
                                   4182 ; output:
                                   4183 ;   A:X     0 not timeout 
                                   4184 ;   A:X     -1 timeout 
                                   4185 ;------------------------------
      002E08                       4186 timeout:
      00A752 EE               [ 1] 4187 	clr a 
      00A753 01 72 A9         [ 2] 4188 	ldw x,timer 
      00A756 00 03            [ 1] 4189 	jreq 1$
      00A758 A3               [ 1] 4190 	clrw x
      00A759 00               [ 4] 4191 	ret  
      00A75A 05               [ 1] 4192 1$:	cpl a
      00A75B 23               [ 2] 4193 	cplw x 
      00A75C 05               [ 4] 4194 	ret 
                                   4195  	
                                   4196 
                                   4197 
                                   4198 
                                   4199 ;-----------------------------------
                                   4200 ; BASIC: IWDGEN expr1 
                                   4201 ; enable independant watchdog timer
                                   4202 ; expr1 is delay in multiple of 62.5µsec
                                   4203 ; expr1 -> {1..16383}
                                   4204 ;-----------------------------------
      002E13                       4205 enable_iwdg:
      00A75D A6 0A CC         [ 4] 4206 	call arg_list
      00A760 97 27            [ 1] 4207 	cp a,#1 
      00A762 9F C7            [ 1] 4208 	jreq 1$
      00A764 00 0F A6         [ 2] 4209 	jp syntax_error 
      002E1D                       4210 1$: _xpop  
      00A767 05 C0            [ 1]    1     ld a,(y)
      00A769 00               [ 1]    2     ldw x,y 
      00A76A 0F C7            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



      00A76C 54 00 72 16      [ 2]    4     addw y,#CELL_SIZE 
      00A770 54 02            [ 1] 4211 	push #0
      00A772 72 10 54 01      [ 1] 4212 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A776 72               [ 1] 4213 	ld a,xh 
      00A777 0F 54            [ 1] 4214 	and a,#0x3f
      00A779 00               [ 1] 4215 	ld xh,a  
      00A77A FB CE 54         [ 2] 4216 2$:	cpw x,#255
      00A77D 04 A6            [ 2] 4217 	jrule 3$
      00A77F 84 81            [ 1] 4218 	inc (1,sp)
      00A781 98               [ 1] 4219 	rcf 
      00A781 52               [ 2] 4220 	rrcw x 
      00A782 01 CD            [ 2] 4221 	jra 2$
      00A784 9A 65 A1 01      [ 1] 4222 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A788 27               [ 1] 4223 	pop a  
      00A789 03 CC 97         [ 1] 4224 	ld IWDG_PR,a 
      00A78C 25               [ 1] 4225 	ld a,xl
      00A78D 90               [ 1] 4226 	dec a 
      00A78E F6 93 EE 01      [ 1] 4227 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A792 72 A9 00         [ 1] 4228 	ld IWDG_RLR,a 
      00A795 03 A3 00 0F      [ 1] 4229 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A799 23               [ 4] 4230 	ret 
                                   4231 
                                   4232 
                                   4233 ;-----------------------------------
                                   4234 ; BASIC: IWDGREF  
                                   4235 ; refresh independant watchdog count down 
                                   4236 ; timer before it reset MCU. 
                                   4237 ;-----------------------------------
      002E51                       4238 refresh_iwdg:
      00A79A 05 A6 0A CC      [ 1] 4239 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A79E 97               [ 4] 4240 	ret 
                                   4241 
                                   4242 
                                   4243 ;-------------------------------------
                                   4244 ; BASIC: LOG2(expr)
                                   4245 ; return logarithm base 2 of expr 
                                   4246 ; this is the position of most significant
                                   4247 ; bit set. 
                                   4248 ; input: 
                                   4249 ; output:
                                   4250 ;   A     TK_INTGR 
                                   4251 ;   xstack log2 
                                   4252 ;*********************************
      002E56                       4253 log2:
      00A79F 27 CD AD         [ 4] 4254 	call func_args 
      00A7A2 39 6B            [ 1] 4255 	cp a,#1 
      00A7A4 01 E6            [ 1] 4256 	jreq 1$
      00A7A6 01 0D 01         [ 2] 4257 	jp syntax_error 
      002E60                       4258 1$: 
      002E60                       4259 	_xpop    
      00A7A9 27 05            [ 1]    1     ld a,(y)
      00A7AB 44               [ 1]    2     ldw x,y 
      00A7AC 0A 01            [ 2]    3     ldw x,(1,x)
      00A7AE 26 FB A4 01      [ 2]    4     addw y,#CELL_SIZE 
      00A7B2 5F               [ 1] 4260 	tnz a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



      00A7B3 97 4F            [ 1] 4261 	jrne 2$ 
      00A7B5 5B               [ 2] 4262 	tnzw x 
      00A7B6 01 81            [ 1] 4263 	jrne 2$
      00A7B8 A6 0A            [ 1] 4264 	ld a,#ERR_BAD_VALUE
      00A7B8 52 02 CD         [ 2] 4265 	jp tb_error 
      00A7BB 9A 6A            [ 1] 4266 2$: push #24 
      00A7BD A1               [ 2] 4267 3$: rlcw x 
      00A7BE 02               [ 1] 4268     rlc a 
      00A7BF 27 03            [ 1] 4269 	jrc 4$
      00A7C1 CC 97            [ 1] 4270 	dec (1,sp) 
      00A7C3 25 90            [ 1] 4271 	jrne 3$
      00A7C5 F6               [ 1] 4272 4$: clrw x 
      00A7C6 93               [ 1] 4273     pop a 
      00A7C7 EE               [ 1] 4274 	dec a
      00A7C8 01               [ 1] 4275 	rlwa x  
      002E82                       4276 9$:	
      00A7C9 72               [ 4] 4277 	ret 
                                   4278 
                                   4279 ;-----------------------------------
                                   4280 ; BASIC: BIT(expr) 
                                   4281 ; expr ->{0..23}
                                   4282 ; return 2^expr 
                                   4283 ; output:
                                   4284 ;    A:X    2^expr 
                                   4285 ;-----------------------------------
      002E83                       4286 bitmask:
      00A7CA A9 00 03         [ 4] 4287     call func_args 
      00A7CD 9F 6B            [ 1] 4288 	cp a,#1
      00A7CF 02 90            [ 1] 4289 	jreq 1$
      00A7D1 F6 93 EE         [ 2] 4290 	jp syntax_error 
      002E8D                       4291 1$: _xpop 
      00A7D4 01 72            [ 1]    1     ld a,(y)
      00A7D6 A9               [ 1]    2     ldw x,y 
      00A7D7 00 03            [ 2]    3     ldw x,(1,x)
      00A7D9 A3 00 0F 23      [ 2]    4     addw y,#CELL_SIZE 
      00A7DD 05               [ 1] 4292 	ld a,xl 
      00A7DE A6 0A CC         [ 2] 4293 	ldw x,#1 
      00A7E1 97 27            [ 1] 4294 	and a,#23
      00A7E3 CD AD            [ 1] 4295 	jreq 9$
      00A7E5 39               [ 1] 4296 	push a 
      00A7E6 6B               [ 1] 4297 	clr a 
      002EA0                       4298 2$: 
      00A7E7 01               [ 2] 4299 	slaw x 
      00A7E8 A6               [ 1] 4300 	rlc a 	
      00A7E9 01 0D            [ 1] 4301 	dec (1,sp)
      00A7EB 01 27            [ 1] 4302 	jrne 2$ 
      002EA6                       4303 4$:
      002EA6                       4304     _drop 1 
      00A7ED 05 48            [ 2]    1     addw sp,#1 
      00A7EF 0A               [ 4] 4305 9$:	ret 
                                   4306 
                                   4307 ;------------------------------
                                   4308 ; BASIC: DO 
                                   4309 ; initiate a DO ... UNTIL loop 
                                   4310 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



                           000003  4311 	DOLP_ADR=3 
                           000005  4312 	DOLP_INW=5
                           000004  4313 	VSIZE=4 
      002EA9                       4314 do_loop:
      00A7F0 01               [ 2] 4315 	popw x 
      002EAA                       4316 	_vars VSIZE 
      00A7F1 26 FB            [ 2]    1     sub sp,#VSIZE 
      00A7F3 0D               [ 2] 4317 	pushw x 
      00A7F4 02 26 05         [ 2] 4318 	ldw x,basicptr 
      00A7F7 43 E4            [ 2] 4319 	ldw (DOLP_ADR,sp),x
      00A7F9 00 20 02         [ 2] 4320 	ldw x,in.w 
      00A7FC EA 00            [ 2] 4321 	ldw (DOLP_INW,sp),x
      00A7FE E7 00 5B 02      [ 1] 4322 	inc loop_depth 
      00A802 81               [ 4] 4323 	ret 
                                   4324 
                                   4325 ;--------------------------------
                                   4326 ; BASIC: UNTIL expr 
                                   4327 ; loop if exprssion is false 
                                   4328 ; else terminate loop
                                   4329 ;--------------------------------
      00A803                       4330 until: 
      00A803 72 00 00 23      [ 1] 4331 	tnz loop_depth 
      00A807 01 81            [ 1] 4332 	jrne 1$ 
      00A809 CC 16 A5         [ 2] 4333 	jp syntax_error 
      002EC5                       4334 1$: 
      00A809 AE A8 30         [ 4] 4335 	call condition  
      002EC8                       4336 	_xpop 
      00A80C CD 89            [ 1]    1     ld a,(y)
      00A80E DC               [ 1]    2     ldw x,y 
      00A80F 5B 02            [ 2]    3     ldw x,(1,x)
      00A811 52 04 CD A1      [ 2]    4     addw y,#CELL_SIZE 
      00A815 27               [ 1] 4337 	tnz a 
      00A816 AE 16            [ 1] 4338 	jrne 9$ 
      00A818 68               [ 2] 4339 	tnzw x 
      00A819 CF 00            [ 1] 4340 	jrne 9$ 
      00A81B 05 7F            [ 2] 4341 	ldw x,(DOLP_ADR,sp)
      00A81D 72 5F 00         [ 2] 4342 	ldw basicptr,x 
      00A820 03 5F            [ 1] 4343 	ld a,(2,x)
      00A822 CF 00 01         [ 1] 4344 	ld count,a 
      00A825 72 11            [ 2] 4345 	ldw x,(DOLP_INW,sp)
      00A827 00 23 72         [ 2] 4346 	ldw in.w,x 
      00A82A 18               [ 4] 4347 	ret 
      002EE7                       4348 9$:	; remove loop data from stack  
      00A82B 00               [ 2] 4349 	popw x
      002EE8                       4350 	_drop VSIZE
      00A82C 23 CC            [ 2]    1     addw sp,#VSIZE 
      00A82E 97 D0 0A 62      [ 1] 4351 	dec loop_depth 
      00A832 72               [ 2] 4352 	jp (x)
                                   4353 
                                   4354 ;--------------------------
                                   4355 ; BASIC: PORTA...PORTI  
                                   4356 ;  return constant value 
                                   4357 ;  PORT  base address 
                                   4358 ;---------------------------
      002EEF                       4359 const_porta:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



      00A833 65 61 6B         [ 2] 4360 	ldw x,#PA_BASE 
      00A836 20               [ 1] 4361 	clr a 
      00A837 70               [ 4] 4362 	ret 
      002EF4                       4363 const_portb:
      00A838 6F 69 6E         [ 2] 4364 	ldw x,#PB_BASE 
      00A83B 74               [ 1] 4365 	clr a 
      00A83C 2C               [ 4] 4366 	ret 
      002EF9                       4367 const_portc:
      00A83D 20 52 55         [ 2] 4368 	ldw x,#PC_BASE 
      00A840 4E               [ 1] 4369 	clr a 
      00A841 20               [ 4] 4370 	ret 
      002EFE                       4371 const_portd:
      00A842 74 6F 20         [ 2] 4372 	ldw x,#PD_BASE 
      00A845 72               [ 1] 4373 	clr a 
      00A846 65               [ 4] 4374 	ret 
      002F03                       4375 const_porte:
      00A847 73 75 6D         [ 2] 4376 	ldw x,#PE_BASE 
      00A84A 65               [ 1] 4377 	clr a 
      00A84B 2E               [ 4] 4378 	ret 
      002F08                       4379 const_portf:
      00A84C 0A 00 19         [ 2] 4380 	ldw x,#PF_BASE 
      00A84E 4F               [ 1] 4381 	clr a 
      00A84E CD               [ 4] 4382 	ret 
      002F0D                       4383 const_portg:
      00A84F 9A 42 72         [ 2] 4384 	ldw x,#PG_BASE 
      00A852 5F               [ 1] 4385 	clr a 
      00A853 00               [ 4] 4386 	ret 
      002F12                       4387 const_porti:
      00A854 23 CD 95         [ 2] 4388 	ldw x,#PI_BASE 
      00A857 31               [ 1] 4389 	clr a 
      00A858 81               [ 4] 4390 	ret 
                                   4391 
                                   4392 ;-------------------------------
                                   4393 ; following return constant 
                                   4394 ; related to GPIO register offset 
                                   4395 ;---------------------------------
      00A859                       4396 const_odr:
      00A859 89               [ 1] 4397 	clr a 
      00A85A CD 98 A5         [ 2] 4398 	ldw x,#GPIO_ODR
      00A85D 85               [ 4] 4399 	ret 
      002F1C                       4400 const_idr:
      00A85E CD               [ 1] 4401 	clr a 
      00A85F B2 81 27         [ 2] 4402 	ldw x,#GPIO_IDR
      00A862 4A               [ 4] 4403 	ret 
      002F21                       4404 const_ddr:
      00A863 CD               [ 1] 4405 	clr a
      00A864 87 67 72         [ 2] 4406 	ldw x,#GPIO_DDR
      00A867 5F               [ 4] 4407 	ret 
      002F26                       4408 const_cr1:
      00A868 00               [ 1] 4409 	clr a 
      00A869 19 52 06         [ 2] 4410 	ldw x,#GPIO_CR1
      00A86C 1D               [ 4] 4411 	ret 
      002F2B                       4412 const_cr2:
      00A86D 00               [ 1] 4413 	clr a
      00A86E 04 1F 01         [ 2] 4414 	ldw x,#GPIO_CR2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



      00A871 EE               [ 4] 4415 	ret 
                                   4416 ;-------------------------
                                   4417 ; BASIC: POUT 
                                   4418 ;  constant for port mode
                                   4419 ;  used by PMODE 
                                   4420 ;  to set pin as output
                                   4421 ;------------------------
      002F30                       4422 const_output:
      00A872 02               [ 1] 4423 	clr a 
      00A873 1F 03 A6         [ 2] 4424 	ldw x,#OUTP
      00A876 80               [ 4] 4425 	ret 
                                   4426 
                                   4427 ;-------------------------
                                   4428 ; BASIC: PINP 
                                   4429 ;  constant for port mode
                                   4430 ;  used by PMODE 
                                   4431 ;  to set pin as input
                                   4432 ;------------------------
      002F35                       4433 const_input:
      00A877 62               [ 1] 4434 	clr a  
      00A878 4D 27 01         [ 2] 4435 	ldw x,#INP 
      00A87B 5C               [ 4] 4436 	ret 
                                   4437 	
                                   4438 ;-----------------------
                                   4439 ; memory area constants
                                   4440 ;-----------------------
      002F3A                       4441 const_eeprom_base:
      00A87C 1F               [ 1] 4442 	clr a  
      00A87D 05 1E 01         [ 2] 4443 	ldw x,#EEPROM_BASE 
      00A880 CF               [ 4] 4444 	ret 
                                   4445 
                                   4446 ;---------------------------
                                   4447 ; BASIC: DATA 
                                   4448 ; when the interpreter find 
                                   4449 ; a DATA line it skip it.
                                   4450 ;---------------------------
      002F3F                       4451 data:
      00A881 00 1A CD 87 E5   [ 1] 4452 	mov in,count 
      00A886 AE               [ 4] 4453 	ret 
                                   4454 
                                   4455 ;------------------------------
                                   4456 ; check if it is a DATA line 
                                   4457 ; input: 
                                   4458 ;    X    line address 
                                   4459 ; output:
                                   4460 ;    Z    set if DATA line 
                                   4461 ;----------------------------
      002F45                       4462 is_data_line:
      00A887 00               [ 2] 4463 	pushw x 
      00A888 80 CD            [ 1] 4464 	ld a,(3,x)
      00A88A 88 E0            [ 1] 4465 	cp a,#TK_CMD 
      00A88C 1E 05            [ 1] 4466 	jrne 9$
      00A88E 5A 1F            [ 2] 4467 	ldw x,(4,x)
      00A890 05 26 F0         [ 2] 4468 	cpw x,#data  
      00A893 1E               [ 2] 4469 9$: popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



      00A894 01               [ 4] 4470 	ret 
                                   4471 
                                   4472 ;---------------------------------
                                   4473 ; BASIC: RESTORE [line#]
                                   4474 ; set data_ptr to first data line
                                   4475 ; if no DATA found pointer set to
                                   4476 ; zero.
                                   4477 ; if a line# is given as argument 
                                   4478 ; a data line with that number 
                                   4479 ; is searched and the data pointer 
                                   4480 ; is set to it. If there is no 
                                   4481 ; data line with that number 
                                   4482 ; the program is interrupted. 
                                   4483 ;---------------------------------
      002F53                       4484 restore:
      00A895 CF 00 1A         [ 4] 4485 	call runtime_only
      00A898 A6               [ 1] 4486 	clrw x 
      00A899 58 5F CD         [ 2] 4487 	ldw data_ptr,x 
      00A89C 88 0B CD         [ 2] 4488 	ldw data_ofs,x 
      00A89F 88 0B 7B         [ 2] 4489 	ldw x,txtbgn 
      00A8A2 03 CD 88         [ 4] 4490 	call next_token 
      00A8A5 0B 7B            [ 1] 4491 	cp a,#TK_INTGR
      00A8A7 04 CD            [ 1] 4492 	jrne 0$
      00A8A9 88 0B 5B         [ 4] 4493 	call get_int24
      00A8AC 06 89            [ 2] 4494 	pushw y 
      00A8AD 4F               [ 1] 4495 	clr a 
      00A8AD 81 0C 45         [ 4] 4496 	call search_lineno  
      00A8AE 90 85            [ 2] 4497 	popw y 
      00A8AE CD               [ 2] 4498 	tnzw x 
      00A8AF 9A 42            [ 1] 4499 	jrne set_data_pointer 
      00A8B1 72 5F            [ 2] 4500 	jra data_error 
      002F77                       4501 0$:
      002F77                       4502 	_unget_token  
      00A8B3 00 19 CD 98 8C   [ 1]    1      mov in,in.saved  
                                   4503 ; search first DATA line 	
      00A8B8 A1 03 27         [ 2] 4504 1$:	cpw x,txtend
      00A8BB 9D 52            [ 1] 4505 	jruge data_error 
      002F81                       4506 2$:	
      00A8BD 03 A1 04         [ 4] 4507 	call is_data_line 
      00A8C0 27 03            [ 1] 4508 	jrne 4$
      00A8C2 CC 97 25         [ 4] 4509 4$:	call try_next_line 
      00A8C5 CD 98            [ 1] 4510 	jrne 4$ 
      00A8C7 CE               [ 4] 4511 	ret 
                                   4512 
                                   4513 ;---------------------
                                   4514 ; set data pointer 
                                   4515 ; variables at new line 
                                   4516 ; input:
                                   4517 ;    X    line address 
                                   4518 ;----------------------
      002F8C                       4519 set_data_pointer:
      00A8C8 A4 DF A1         [ 2] 4520 	ldw data_ptr,x
      00A8CB 45 26            [ 1] 4521 	ld a,(2,x)
      00A8CD 0C AE 40         [ 1] 4522 	ld data_len,a 
      00A8D0 00 CF 00 1A      [ 1] 4523 	mov data_ofs,#FIRST_DATA_ITEM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      00A8D4 AE               [ 4] 4524 	ret 
                                   4525 
                                   4526 
                                   4527 ;--------------------
                                   4528 ; at end of data line 
                                   4529 ; check if next line 
                                   4530 ; is a data line 
                                   4531 ; input:
                                   4532 ;    X   actual line address 
                                   4533 ;  
                                   4534 ;-------------------
      002F99                       4535 try_next_line: 
      00A8D5 47 FF            [ 1] 4536 	ld a,(2,x)
      00A8D7 4F 20 15         [ 1] 4537 	ld acc8,a 
      00A8DA A1 46 27 06      [ 1] 4538 	clr acc16 
      00A8DE AE 96 2D CC      [ 2] 4539 	addw x,acc16 
      00A8E2 97 27 1D         [ 2] 4540 	cpw x,txtend 
      00A8E4 25 02            [ 1] 4541 	jrult 1$
      00A8E4 AE B9            [ 2] 4542 	jra data_error 
      002FAD                       4543 1$:	
      00A8E6 00 CF 00         [ 4] 4544 	call is_data_line 
      00A8E9 1A A6            [ 1] 4545 	jreq 2$
      00A8EB 02 AE            [ 1] 4546 	ld a,#1  
      00A8ED 7F FF            [ 2] 4547 	jra 9$
      00A8EF CD 2F 8C         [ 4] 4548 2$:	call set_data_pointer
      00A8EF 6B               [ 1] 4549 	clr a  
      00A8F0 01               [ 4] 4550 9$:	ret 
      002FBB                       4551 data_error:	
      00A8F1 1F 02            [ 1] 4552     ld a,#ERR_NO_DATA 
      00A8F3 CD 87 67         [ 2] 4553 	jp tb_error 
                                   4554 
                                   4555 
                                   4556 ;---------------------------------
                                   4557 ; BASIC: READ 
                                   4558 ; return next data item | 0 
                                   4559 ;---------------------------------
                           000001  4560 	CTX_BPTR=1 
                           000003  4561 	CTX_IN=3 
                           000004  4562 	CTX_COUNT=4 
                           000005  4563 	INT24=5
                           000007  4564 	VSIZE=7 
      00A8F6                       4565 read:
      00A8F6 CD 88 EE         [ 4] 4566 	call runtime_only
      002FC3                       4567 	_vars  VSIZE 
      00A8F9 27 08            [ 2]    1     sub sp,#VSIZE 
      00A8FB A6 45 CD         [ 4] 4568 	call save_context
      002FC8                       4569 read01:	
      00A8FE 89 7F CD         [ 1] 4570 	ld a,data_ofs
      00A901 87 E5 AE         [ 1] 4571 	cp a,data_len 
      00A904 00 80            [ 1] 4572 	jreq 2$ ; end of line  
      002FD0                       4573 0$:
      00A906 CD 88 E0         [ 2] 4574 	ldw x,data_ptr 
      00A909 7B 01 1E         [ 2] 4575 	ldw basicptr,x 
      00A90C 02 72 B0 00 1A   [ 1] 4576 	mov in,data_ofs 
      00A911 C2 00 19 22 E0   [ 1] 4577 	mov count,data_len  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



      00A916 CD 95 31         [ 4] 4578 	call expression 
      00A919 1E 02            [ 1] 4579 	cp a,#TK_INTGR 
      00A91B A3 47            [ 1] 4580 	jreq 1$ 
      00A91D FF 26 03         [ 2] 4581 	jp syntax_error 
      002FEA                       4582 1$:
      00A920 CD 9D D8         [ 4] 4583 	call next_token ; skip comma
      00A923 CE 00 04         [ 2] 4584 	ldw x,basicptr 
      00A923 5B 03 81         [ 2] 4585 	ldw data_ptr,x 
      00A926 55 00 01 00 08   [ 1] 4586 	mov data_ofs,in 
      00A926 89 9F A4         [ 4] 4587 	call rest_context
      002FFB                       4588 	_xpop 
      00A929 80 97            [ 1]    1     ld a,(y)
      00A92B FE               [ 1]    2     ldw x,y 
      00A92C C3 AA            [ 2]    3     ldw x,(1,x)
      00A92E 41 85 81 03      [ 2]    4     addw y,#CELL_SIZE 
      00A931                       4589 	_drop VSIZE 
      00A931 88 4D            [ 2]    1     addw sp,#VSIZE 
      00A933 27               [ 4] 4590 	ret 
      003007                       4591 2$: ; end of line reached 
                                   4592 	; try next line 
      00A934 0A F6 5C         [ 2] 4593 	ldw x,data_ptr  
      00A937 90 F7 90         [ 4] 4594 	call try_next_line
      00A93A 5C 0A            [ 1] 4595 	jreq 0$ 
      00A93C 01 26            [ 2] 4596 	jra data_error 
                                   4597 
                                   4598 ;---------------------------------
                                   4599 ; BASIC: SPIEN clkdiv, 0|1  
                                   4600 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4601 ; if clkdiv==-1 disable SPI
                                   4602 ; 0|1 -> disable|enable  
                                   4603 ;--------------------------------- 
                           000005  4604 SPI_CS_BIT=5
      003011                       4605 spi_enable:
      00A93E F6 84 81         [ 4] 4606 	call arg_list 
      00A941 A1 02            [ 1] 4607 	cp a,#2
      00A941 88 90            [ 1] 4608 	jreq 1$
      00A943 AE 16 B8         [ 2] 4609 	jp syntax_error 
      00301B                       4610 1$: 
      00A946 90 89 A6 80      [ 1] 4611 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A94A 90               [ 2] 4612 	popw x  
      00A94B 7F               [ 2] 4613 	tnzw x 
      00A94C 90 5C            [ 1] 4614 	jreq spi_disable 
      00A94E 4A               [ 2] 4615 	popw x 
      00A94F 26 F9            [ 1] 4616 	ld a,#(1<<SPI_CR1_BR)
      00A951 90               [ 4] 4617 	mul x,a 
      00A952 85               [ 1] 4618 	ld a,xl 
      00A953 84 81 00         [ 1] 4619 	ld SPI_CR1,a 
                                   4620 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A955 72 1A 50 14      [ 1] 4621 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A955 89 AE B9 00      [ 1] 4622 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4623 ; configure SPI as master mode 0.	
      00A959 CD AA 45 27      [ 1] 4624 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4625 ; ~CS line controlled by sofware 	
      00A95D 0D F6 EA 01      [ 1] 4626 	bset SPI_CR2,#SPI_CR2_SSM 
      00A961 27 23 CD AA      [ 1] 4627     bset SPI_CR2,#SPI_CR2_SSI 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



                                   4628 ; enable SPI
      00A965 50 5D 26 F0      [ 1] 4629 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A969 20               [ 4] 4630 	ret 
      003044                       4631 spi_disable:
      003044                       4632 	_drop #2; throw first argument.
      00A96A 1B 02            [ 2]    1     addw sp,##2 
                                   4633 ; wait spi idle 
      00A96B A6 82            [ 1] 4634 1$:	ld a,#0x82 
      00A96B CF 00 0E         [ 1] 4635 	and a,SPI_SR
      00A96E EE 02            [ 1] 4636 	cp a,#2 
      00A970 1C 00            [ 1] 4637 	jrne 1$
      00A972 04 1C 00 7F      [ 1] 4638 	bres SPI_CR1,#SPI_CR1_SPE
      00A976 9F A4 80 97      [ 1] 4639 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A97A 13 01 24 05      [ 1] 4640 	bres PE_DDR,#SPI_CS_BIT 
      00A97E CE               [ 4] 4641 	ret 
                                   4642 
      00305C                       4643 spi_clear_error:
      00A97F 00 0E            [ 1] 4644 	ld a,#0x78 
      00A981 20 E0 CE         [ 1] 4645 	bcp a,SPI_SR 
      00A984 00 0E            [ 1] 4646 	jreq 1$
      00A986 5B 02 81 03      [ 1] 4647 	clr SPI_SR 
      00A989 81               [ 4] 4648 1$: ret 
                                   4649 
      003068                       4650 spi_send_byte:
      00A989 89               [ 1] 4651 	push a 
      00A98A 4B 04 72         [ 4] 4652 	call spi_clear_error
      00A98D 5F               [ 1] 4653 	pop a 
      00A98E 00 19 CF 00 1A   [ 2] 4654 	btjf SPI_SR,#SPI_SR_TXE,.
      00A993 4F 5F CD         [ 1] 4655 	ld SPI_DR,a
      00A996 88 0B 0A 01 26   [ 2] 4656 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A99B F9 5B 01         [ 1] 4657 	ld a,SPI_DR 
      00A99E 85               [ 4] 4658 	ret 
                                   4659 
      00307E                       4660 spi_rcv_byte:
      00A99F CF 00            [ 1] 4661 	ld a,#255
      00A9A1 1A 81 52 03 E3   [ 2] 4662 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A9A3 C6 52 04         [ 1] 4663 	ld a,SPI_DR 
      00A9A3 CD               [ 4] 4664 	ret
                                   4665 
                                   4666 ;------------------------------
                                   4667 ; BASIC: SPIWR byte [,byte]
                                   4668 ; write 1 or more byte
                                   4669 ;------------------------------
      003089                       4670 spi_write:
      00A9A4 9A 42 89         [ 4] 4671 	call expression
      00A9A7 90 89            [ 1] 4672 	cp a,#TK_INTGR 
      00A9A9 52 06            [ 1] 4673 	jreq 1$
      00A9AB CD 9E E4         [ 2] 4674 	jp syntax_error 
      003093                       4675 1$:	
      00A9AE 26               [ 1] 4676 	ld a,xl 
      00A9AF 03 CC AA         [ 4] 4677 	call spi_send_byte 
      00A9B2 3B 1F 05         [ 4] 4678 	call next_token 
      00A9B5 72 5F            [ 1] 4679 	cp a,#TK_COMMA 
      00A9B7 00 19            [ 1] 4680 	jrne 2$ 
      00A9B9 CD A9            [ 2] 4681 	jra spi_write 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



      00A9BB 55               [ 1] 4682 2$:	tnz a 
      00A9BC CF 00            [ 1] 4683 	jreq 3$
      0030A3                       4684 	_unget_token  
      00A9BE 1A AE FF FF 72   [ 1]    1      mov in,in.saved  
      00A9C3 B0               [ 4] 4685 3$:	ret 
                                   4686 
                                   4687 
                                   4688 ;-------------------------------
                                   4689 ; BASIC: SPIRD 	
                                   4690 ; read one byte from SPI 
                                   4691 ;-------------------------------
      0030A9                       4692 spi_read:
      00A9C4 00 1A 1D         [ 4] 4693 	call spi_rcv_byte 
      00A9C7 00               [ 1] 4694 	clrw x 
      00A9C8 04               [ 1] 4695 	ld xl,a 
      00A9C9 13               [ 1] 4696 	clr a  
      00A9CA 05               [ 4] 4697 	ret 
                                   4698 
                                   4699 ;------------------------------
                                   4700 ; BASIC: SPISEL 0|1 
                                   4701 ; set state of ~CS line
                                   4702 ; 0|1 deselect|select  
                                   4703 ;------------------------------
      0030B0                       4704 spi_select:
      00A9CB 24 05 A6         [ 4] 4705 	call next_token 
      00A9CE 01 CC            [ 1] 4706 	cp a,#TK_INTGR 
      00A9D0 97 27            [ 1] 4707 	jreq 1$
      00A9D2 CC 16 A5         [ 2] 4708 	jp syntax_error 
      00A9D2 CE               [ 2] 4709 1$: tnzw x  
      00A9D3 00 1A            [ 1] 4710 	jreq cs_high 
      00A9D5 F6 EA 01 EA      [ 1] 4711 	bres PE_ODR,#SPI_CS_BIT
      00A9D9 02               [ 4] 4712 	ret 
      0030C2                       4713 cs_high: 
      00A9DA EA 03 27 03      [ 1] 4714 	bset PE_ODR,#SPI_CS_BIT
      00A9DE CD               [ 4] 4715 	ret 
                                   4716 
                                   4717 ;-------------------------------
                                   4718 ; BASIC: PAD 
                                   4719 ; Return pad buffer address.
                                   4720 ;------------------------------
      0030C7                       4721 pad_ref:
      00A9DF A9 89 B8         [ 2] 4722 	ldw x,#pad 
      00A9E1 4F               [ 1] 4723 	clr a
      00A9E1 CD               [ 4] 4724 	ret 
                                   4725 
                                   4726 ;****************************
                                   4727 ; expression stack 
                                   4728 ; manipulation routines
                                   4729 ;****************************
                                   4730 
                                   4731 ;-----------------------------
                                   4732 ; BASIC: PUSH expr|rel|cond 
                                   4733 ; push the result on xtack
                                   4734 ;-----------------------------
      0030CC                       4735 xpush:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



      00A9E2 87 A7 0F         [ 4] 4736 	call condition 
      00A9E5 03               [ 4] 4737 	ret 
                                   4738 
                                   4739 ;------------------------------
                                   4740 ; BASIC: POP 
                                   4741 ; pop top of xstack 
                                   4742 ;------------------------------
      0030D0                       4743 xpop:
      0030D0                       4744 	_xpop 
      00A9E6 CD A9            [ 1]    1     ld a,(y)
      00A9E8 41               [ 1]    2     ldw x,y 
      00A9E9 CE AA            [ 2]    3     ldw x,(1,x)
      00A9EB 41 90 FF 72      [ 2]    4     addw y,#CELL_SIZE 
      00A9EF A9               [ 4] 4745 	ret 
                                   4746 
                                   4747 
                                   4748 ;------------------------------
                                   4749 ; BASIC: ALLOC expr 
                                   4750 ; allocate expr element on xtack 
                                   4751 ;-------------------------------
      0030DA                       4752 xalloc: 
      00A9F0 00 02 1E         [ 4] 4753 	call expression 
      00A9F3 05 90            [ 1] 4754 	cp a,#TK_INTGR
      00A9F5 FF 72            [ 1] 4755 	jreq 1$ 
      00A9F7 A9 00 02         [ 2] 4756 	jp syntax_error
      0030E4                       4757 1$: _xpop 
      00A9FA A6 7C            [ 1]    1     ld a,(y)
      00A9FC A3               [ 1]    2     ldw x,y 
      00A9FD 00 7C            [ 2]    3     ldw x,(1,x)
      00A9FF 22 01 9F 6B      [ 2]    4     addw y,#CELL_SIZE 
      00AA03 04               [ 1] 4758 	tnz a 
      00AA04 CE 00            [ 1] 4759 	jreq 3$ 
      00AA06 1C 1F            [ 1] 4760 2$:	ld a,#ERR_BAD_VALUE
      00AA08 01 16 A7         [ 2] 4761 	jp tb_error 
      00AA09 A3 00 14         [ 2] 4762 3$: cpw x,#XSTACK_SIZE 
      00AA09 1E 01            [ 1] 4763 	jrugt 2$
      00AA0B 7B 04            [ 1] 4764 	ld a,#CELL_SIZE 
      00AA0D CD               [ 4] 4765 	mul x,a 
      00AA0E A9 31 1F         [ 2] 4766 	ldw acc16,x 
      00AA11 01 AE 16 B8      [ 2] 4767 	subw y,acc16 
      00AA15 CD 87 C1 AE      [ 2] 4768 	cpw y,#xstack_full
      00AA19 00 80            [ 1] 4769 	jrugt 9$
      00AA1B CD 88            [ 1] 4770 	ld a,#ERR_MEM_FULL
      00AA1D E0 1E 01         [ 2] 4771 	jp tb_error 
      00310F                       4772 9$:	 
      00AA20 C3               [ 4] 4773 	ret 
                                   4774 
                                   4775 
                                   4776 ;------------------------------
                                   4777 ;  BASIC DROP expr 
                                   4778 ;  expr in range {0..XSTACK_SIZE}
                                   4779 ;  discard n elements from xtack
                                   4780 ;------------------------------
      003110                       4781 xdrop:
      00AA21 00 1E 24         [ 4] 4782 	call expression 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



      00AA24 16 1E            [ 1] 4783 	cp a,#TK_INTGR
      00AA26 05 72            [ 1] 4784 	jreq 1$ 
      00AA28 F0 03 1F         [ 2] 4785 	jp syntax_error 
      00311A                       4786 1$:	_xpop 
      00AA2B 05 A6            [ 1]    1     ld a,(y)
      00AA2D 80               [ 1]    2     ldw x,y 
      00AA2E A3 00            [ 2]    3     ldw x,(1,x)
      00AA30 80 24 01 9F      [ 2]    4     addw y,#CELL_SIZE 
      00AA34 6B               [ 1] 4787 	ld a,xl 
      00AA35 04 CD            [ 1] 4788 	and a,#0x1f 
      00AA37 A9               [ 1] 4789 	clrw x 
      00AA38 41               [ 1] 4790 	ld xl,a 
      00AA39 20 CE            [ 1] 4791 	ld a,#CELL_SIZE 
      00AA3B 5B               [ 4] 4792 	mul x,a 
      00AA3C 06 90 85         [ 2] 4793 	ldw acc16,x  
      00AA3F 85 81 54 42      [ 2] 4794 	addw y,acc16 
      00AA43 58 58 17 73      [ 2] 4795 	cpw y,#XSTACK_EMPTY 
      00AA45 23 04            [ 2] 4796 	jrule 9$
      00AA45 89 9F A4 80      [ 2] 4797 	ldw y,#XSTACK_EMPTY 
      00AA49 97               [ 4] 4798 9$:	ret 
                                   4799 
                                   4800 ;-----------------------
                                   4801 ; check if value in A:X 
                                   4802 ; is inside xstack bound
                                   4803 ; output:
                                   4804 ;    X     slot address  
                                   4805 ;-----------------------
      00313D                       4806 xstack_bound:
      00AA4A FE               [ 1] 4807 	tnz a 
      00AA4B C3 AA            [ 1] 4808 	jrne 8$ 
      00AA4D 43 85 81         [ 2] 4809 1$: cpw x,#XSTACK_SIZE 
      00AA50 22 11            [ 1] 4810 	jrugt 8$
      00AA50 9F A4            [ 1] 4811 	ld a,#CELL_SIZE 
      00AA52 80               [ 4] 4812 	mul x,a
      00AA53 97 CF 00         [ 2] 4813 	ldw acc16,x 
      00AA56 0E               [ 1] 4814 	ldw x,y 
      00AA57 EE 02 72 BB      [ 2] 4815 	addw x,acc16 
      00AA5B 00 0E 1C         [ 2] 4816 	cpw x,#XSTACK_EMPTY 
      00AA5E 00 04            [ 1] 4817 	jruge 8$  
      00AA60 1C               [ 4] 4818 	ret 
      00AA61 00 7F            [ 1] 4819 8$: ld a,#ERR_BAD_VALUE
      00AA63 9F A4 80         [ 2] 4820 	jp tb_error 
                                   4821 
                                   4822 ;-------------------------
                                   4823 ; BASIC: PUT expr, cond 
                                   4824 ; expr -> slot 
                                   4825 ; cond -> valut to put 
                                   4826 ; on xstack 
                                   4827 ;-------------------------
      00315B                       4828 xput:
      00AA66 97 81 EA         [ 4] 4829 	call arg_list 
      00AA68 A1 02            [ 1] 4830 	cp a,#2 
      00AA68 CD 9A            [ 1] 4831 	jreq 1$ 
      00AA6A 42 AE B9         [ 2] 4832 0$:	jp syntax_error
      003165                       4833 1$: _xpop   ; value to put 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



      00AA6D 00 89            [ 1]    1     ld a,(y)
      00AA6F 93               [ 1]    2     ldw x,y 
      00AA6F CD A9            [ 2]    3     ldw x,(1,x)
      00AA71 26 26 3B 1C      [ 2]    4     addw y,#CELL_SIZE 
      00AA75 00               [ 2] 4834 	pushw x 
      00AA76 04               [ 1] 4835 	push a 
      003170                       4836 	_xpop    ; slot 
      00AA77 35 10            [ 1]    1     ld a,(y)
      00AA79 00               [ 1]    2     ldw x,y 
      00AA7A 0B CD            [ 2]    3     ldw x,(1,x)
      00AA7C 98 D4 A6 20      [ 2]    4     addw y,#CELL_SIZE 
      00AA80 CD 89 7F         [ 4] 4837 	call xstack_bound
      00AA83 1E 01 EE         [ 2] 4838     ldw ptr16,x 
      00AA86 02               [ 1] 4839 	pop a 
      00AA87 35               [ 2] 4840 	popw x 
      00AA88 0A 00 0B CD      [ 4] 4841 	ld [ptr16],a 
      00AA8C 98 D4 AE 9F      [ 1] 4842 	inc ptr8 
      00AA90 4E CD 89 DC      [ 5] 4843 	ldw [ptr16],x 
      00AA94 A6               [ 4] 4844 	ret 
                                   4845 
                                   4846 ;------------------------
                                   4847 ; BASIC: PICK expr 
                                   4848 ; get nième element on 
                                   4849 ; xtack. 
                                   4850 ;-----------------------
      00318E                       4851 xpick:
      00AA95 2C CD 89         [ 4] 4852 	call func_args 
      00AA98 7F 1E            [ 1] 4853 	cp a,#1 
      00AA9A 01 1C            [ 1] 4854 	jreq 1$
      00AA9C 00 08 CD         [ 2] 4855 	jp syntax_error 
      003198                       4856 1$: _xpop 
      00AA9F 89 DC            [ 1]    1     ld a,(y)
      00AAA1 A6               [ 1]    2     ldw x,y 
      00AAA2 0D CD            [ 2]    3     ldw x,(1,x)
      00AAA4 89 7F 1E 01      [ 2]    4     addw y,#CELL_SIZE 
      00AAA8 CD AA 50         [ 4] 4857 	call xstack_bound
      00AAAB 1F               [ 1] 4858     ld a,(x)
      00AAAC 01 20            [ 2] 4859 	ldw x,(1,x)				
      00AAAE C0               [ 4] 4860 	ret 
                                   4861 
                                   4862 
                                   4863 ;----------------------------
                                   4864 ; BASIC: AUTORUN \C | label  
                                   4865 ;  \C -> cancel autorun 
                                   4866 ;  addr -> register an 
                                   4867 ;    autorun program 
                                   4868 ;    this program execute at 
                                   4869 ;     reset/boot 
                                   4870 ;----------------------------
      00AAAF                       4871 cmd_auto_run:
      00AAAF CD AA 45         [ 4] 4872 	call cmd_line_only
      00AAB2 27 F4 0C         [ 4] 4873 	call next_token 
      00AAB4 A1 03            [ 1] 4874 	cp a,#TK_LABEL 
      00AAB4 5B 02            [ 1] 4875 	jreq 1$ 
      00AAB6 81 04            [ 1] 4876 	cp a,#TK_CHAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



      00AAB7 26 12            [ 1] 4877 	jrne 0$ 
      00AAB7 CD               [ 1] 4878 	ld a,(x)
      00AAB8 9B AC A1 84      [ 1] 4879 	inc in 
      00AABC 27 03            [ 1] 4880 	and a,#0xDF 
      00AABE CC 97            [ 1] 4881 	cp a,#'C 
      00AAC0 25 90            [ 1] 4882 	jrne 0$ 
      00AAC2 F6 93 EE         [ 2] 4883 	ldw x,#EEPROM_BASE 
      00AAC5 01 72 A9         [ 4] 4884 	call erase_header
      00AAC8 00               [ 4] 4885 	ret 
      00AAC9 03 C7 00         [ 2] 4886 0$:	jp syntax_error
      00AACC 19               [ 2] 4887 1$:	pushw x 
      00AACD CF 00 1A         [ 4] 4888 	call skip_string
      00AAD0 85               [ 2] 4889 	popw x 
      00AAD0 CD 98 8C         [ 4] 4890 	call search_program
      00AAD3 A1 08            [ 1] 4891 	jrne 2$ 
      00AAD5 27 02            [ 1] 4892 	ld a,#ERR_BAD_VALUE
      00AAD7 20 46 CD         [ 2] 4893 	jp tb_error 
      00AADA 98               [ 2] 4894 2$: pushw x 
      00AADB 8C A1 04 27      [ 1] 4895 	clr farptr 
      00AADF 23 A1 02         [ 2] 4896 	ldw x,#EEPROM_BASE
      00AAE2 27 2A 55         [ 2] 4897 	ldw ptr16,x 
      00AAE5 00 04 00         [ 1] 4898 	ld a,AR_SIGN 
      00AAE8 02               [ 1] 4899 	clrw x 	 
      00AAE9 CD 9B AC         [ 4] 4900 	call write_byte
      00AAEC A1 84 27         [ 1] 4901 	ld a,AR_SIGN+1
      00AAEF 03 CC 97         [ 4] 4902 	call write_byte 
      00AAF2 25 90            [ 1] 4903 	ld a,(1,sp)
      00AAF4 F6 93 EE         [ 4] 4904 	call write_byte 
      00AAF7 01 72            [ 1] 4905 	ld a,(2,sp)
      00AAF9 A9 00 03         [ 4] 4906 	call write_byte 
      0031FC                       4907 	_drop 2 
      00AAFC 9F 5F            [ 2]    1     addw sp,#2 
      00AAFE CD               [ 4] 4908 	ret 
                                   4909 
      00AAFF 88 0B                 4910 AR_SIGN: .ascii "AR" ; autorun signature 
                                   4911 
                                   4912 ;-------------------------------
                                   4913 ; search a program in flash 
                                   4914 ; memory with a label at first 
                                   4915 ; that correspond to name 
                                   4916 ; pointed by X 
                                   4917 ; input:
                                   4918 ;    x      *name 
                                   4919 ; output: 
                                   4920 ;    X     prog_addr|0
                                   4921 ;-------------------------------
                           000001  4922 	WLKPTR=1 
                           000003  4923 	PNAME=3
                           000005  4924 	LIMIT=5
                           000007  4925 	YSAVE=7
                           000006  4926 	VSIZE=6 
      003201                       4927 search_program:
      00AB01 20 CD            [ 2] 4928 	pushw y 
      00AB03                       4929 	_vars VSIZE 
      00AB03 F6 72            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



      00AB05 5C 00            [ 2] 4930 	ldw (PNAME,sp),x 
      00AB07 02 5F CD         [ 4] 4931 	call uflash 
      00AB0A 88 0B            [ 2] 4932 	ldw (LIMIT,sp),x 
      00AB0C 20 C2 80         [ 2] 4933 	ldw x,#app_space 
      00AB0E 1F 01            [ 2] 4934 1$:	ldw (WLKPTR,sp),x  
      00AB0E 89               [ 1] 4935 	clr a 
      00AB0F F6 72 5C         [ 4] 4936 	call is_program_addr
      00AB12 00 02            [ 1] 4937 	jrne 4$
      00AB14 5F CD 88         [ 2] 4938 	addw x,#7 
      00AB17 0B               [ 1] 4939 	ld a,(x)
      00AB18 85 F6            [ 1] 4940 	cp a,#TK_LABEL 
      00AB1A 27 B4            [ 1] 4941 	jrne 4$ 
      00AB1C 5C               [ 1] 4942 	incw x 
      00AB1D 20 EF            [ 2] 4943 	ldw y,(PNAME,sp)
      00AB1F CD 13 A4         [ 4] 4944 	call strcmp
      00AB1F 81 0A            [ 1] 4945 	jrne 6$
      00AB20                       4946 4$: 
      00AB20 CD 9A 65         [ 4] 4947 	call skip_to_next
      00AB23 A1 01            [ 2] 4948 	cpw x,(LIMIT,sp)
      00AB25 27 03            [ 1] 4949 	jrult 1$
      00AB27 CC               [ 1] 4950 	clrw x 
      00AB28 97 25            [ 2] 4951 	jra 8$
      003231                       4952 6$: ; found label 
      00AB2A 90 F6            [ 2] 4953 	ldw x,(WLKPTR,sp)
      00AB2C 93 EE 01         [ 2] 4954 	addw x,#4 	
      003236                       4955 8$:	
      003236                       4956 	_drop VSIZE  
      00AB2F 72 A9            [ 2]    1     addw sp,#VSIZE 
      00AB31 00 03            [ 2] 4957 	popw y 
      00AB33 9F               [ 4] 4958 	ret 
                                   4959 
                                   4960 
                                   4961 ;-------------------------------
                                   4962 ; BASIC: CHAIN label [, line#]
                                   4963 ; Execute another program like it 
                                   4964 ; is a sub-routine. When the 
                                   4965 ; called program terminate 
                                   4966 ; execution continue at caller 
                                   4967 ; after CHAIN command. 
                                   4968 ; if a line# is given, the 
                                   4969 ; chained program start execution 
                                   4970 ; at this line#.
                                   4971 ;---------------------------------
                           000003  4972 	CHAIN_LN=3 
                           000005  4973 	CHAIN_ADDR=5 
                           000007  4974 	CHAIN_BP=7
                           000009  4975 	CHAIN_IN=9
                           00000A  4976 	CHAIN_COUNT=10 
                           00000B  4977 	CHAIN_TXTBGN=11 
                           00000D  4978 	CHAIN_TXTEND=13 
                           00000C  4979 	VSIZE=12 
                           000004  4980 	DISCARD=4 
      00323B                       4981 cmd_chain:
      00AB34 A4               [ 2] 4982 	popw x 
      00323C                       4983 	_vars VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



      00AB35 7F 81            [ 2]    1     sub sp,#VSIZE 
      00AB37 89               [ 2] 4984 	pushw x
      00AB37 A6 06            [ 1] 4985 	clr (CHAIN_LN,sp) 
      00AB39 CD 9A            [ 1] 4986 	clr (CHAIN_LN+1,sp)  
      00AB3B 58 CD            [ 1] 4987 	ld a,#TK_LABEL 
      00AB3D 98 8C A1         [ 4] 4988 	call expect 
      00AB40 02               [ 2] 4989 	pushw x 
      00AB41 27 0E A1         [ 4] 4990 	call skip_string
      00AB44 04               [ 2] 4991 	popw x 
      00AB45 27 12 A1         [ 4] 4992 	call search_program 
      00AB48 82               [ 2] 4993 	tnzw x  
      00AB49 27 03            [ 1] 4994 	jrne 1$ 
      00AB4B CC 97            [ 1] 4995 0$:	ld a,#ERR_BAD_VALUE
      00AB4D 25 16 A7         [ 2] 4996 	jp tb_error 
      00AB4E 1F 05            [ 2] 4997 1$: ldw (CHAIN_ADDR,sp), x ; program addr 
      00AB4E FD 20 0B         [ 4] 4998     call next_token 
      00AB51 A1 08            [ 1] 4999 	cp a,#TK_COMMA 
      00AB51 F6 88            [ 1] 5000 	jrne 4$
      00AB53 CD 98            [ 1] 5001 	ld a,#TK_INTGR
      00AB55 A5 84 20         [ 4] 5002 	call expect 
      00AB58 03 18 3E         [ 4] 5003 	call get_int24 
      00AB59 1F 03            [ 2] 5004 	ldw (CHAIN_LN,sp),x
      00AB59 CD 98            [ 2] 5005 	jra 6$ 
      00326D                       5006 4$: _unget_token 
      00AB5B CE 5F 02 72 A2   [ 1]    1      mov in,in.saved  
      003272                       5007 6$: ; save chain context 
      00AB60 00 03 90         [ 2] 5008 	ldw x,basicptr 
      00AB63 F7 90            [ 2] 5009 	ldw (CHAIN_BP,sp),x 
      00AB65 EF 01 A6         [ 2] 5010 	ldw x,in
      00AB68 07 CD            [ 2] 5011 	ldw (CHAIN_IN,sp),x
      00AB6A 9A 58 1B         [ 2] 5012 	ldw x,txtbgn 
      00AB6C 1F 0B            [ 2] 5013 	ldw (CHAIN_TXTBGN,sp),x
      00AB6C 90 F6 93         [ 2] 5014 	ldw x,txtend 
      00AB6F EE 01            [ 2] 5015 	ldw (CHAIN_TXTEND,sp),x  
                                   5016 ; set chained program context 	
      00AB71 72 A9            [ 2] 5017 	ldw x,(CHAIN_ADDR,sp)
      00AB73 00 03 81         [ 2] 5018 	ldw basicptr,x 
      00AB76 CF 00 1B         [ 2] 5019 	ldw txtbgn,x 
      00AB76 CD 89 8F         [ 2] 5020 	subw x,#2
      00AB79 81               [ 2] 5021 	ldw x,(x)
      00AB7A 72 FB 05         [ 2] 5022 	addw x,(CHAIN_ADDR,sp)
      00AB7A 5F C6 00         [ 2] 5023 	ldw txtend,x  
      00AB7D 2F C0            [ 2] 5024 	ldw x,(CHAIN_ADDR,sp)
      00AB7F 00 30            [ 1] 5025 	ld a,(2,x)
      00AB81 27 03 53         [ 1] 5026 	ld count,a 
      00AB84 A6 FF 00 01      [ 1] 5027 	mov in,#3 
      00AB86 1E 03            [ 2] 5028 	ldw x,(CHAIN_LN,sp)
      00AB86 81               [ 2] 5029 	tnzw x 
      00AB87 27 13            [ 1] 5030 	jreq 8$ 
      00AB87 72 5F            [ 2] 5031 	pushw y
      00AB89 00               [ 1] 5032 	clr a  
      00AB8A 19 AE B9         [ 4] 5033 	call search_lineno
      00AB8D 00 89            [ 2] 5034 	popw y 
      00AB8F CF               [ 2] 5035 	tnzw x 
      00AB90 00 1A            [ 1] 5036 	jreq 0$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



      00AB92 CD 88 EE         [ 2] 5037 	ldw basicptr,x 
      00AB95 27 0F            [ 1] 5038 	ld a,(2,x)
      00AB97 1E 01 1C         [ 1] 5039 	ld count,a 
      00AB9A 00 80 27 04      [ 1] 5040 8$: inc chain_level
      00AB9E 1F               [ 2] 5041 	popw x 
      0032C0                       5042 	_drop DISCARD
      00AB9F 01 20            [ 2]    1     addw sp,#DISCARD 
      00ABA1 ED               [ 2] 5043 	jp (x)
                                   5044 
                                   5045 
                                   5046 ;------------------------------
                                   5047 ;      dictionary 
                                   5048 ; format:
                                   5049 ;   link:   2 bytes 
                                   5050 ;   name_length+flags:  1 byte, bits 0:3 lenght,4:8 kw type   
                                   5051 ;   cmd_name: 16 byte max 
                                   5052 ;   code_addr: 2 bytes 
                                   5053 ;------------------------------
                                   5054 	.macro _dict_entry len,name,code_addr 
                                   5055 	.word LINK 
                                   5056 	LINK=.
                                   5057 name:
                                   5058 	.byte len   	
                                   5059 	.ascii "name"
                                   5060 	.word code_addr  
                                   5061 	.endm 
                                   5062 
                           000000  5063 	LINK=0
                                   5064 ; respect alphabetic order for BASIC names from Z-A
                                   5065 ; this sort order is for a cleaner WORDS cmd output. 	
      00ABA2                       5066 kword_end:
      0032C3                       5067 	_dict_entry,3+F_XOR,XOR,TK_XOR ; xor operator
      00ABA2 0F 01                    1 	.word LINK 
                           0032C5     2 	LINK=.
      0032C5                          3 XOR:
      00ABA4 0F                       4 	.byte 3+F_XOR   	
      00ABA5 02 85 4F                 5 	.ascii "XOR"
      00ABA8 81 8A                    6 	.word TK_XOR  
      00ABA9                       5068 	_dict_entry,5,WRITE,write  
      00ABA9 CD 9A                    1 	.word LINK 
                           0032CD     2 	LINK=.
      0032CD                          3 WRITE:
      00ABAB 65                       4 	.byte 5   	
      00ABAC A1 02 27 03 CC           5 	.ascii "WRITE"
      00ABB1 97 25                    6 	.word write  
      00ABB3                       5069 	_dict_entry,5,WORDS,words 
      00ABB3 90 E6                    1 	.word LINK 
                           0032D7     2 	LINK=.
      0032D7                          3 WORDS:
      00ABB5 03                       4 	.byte 5   	
      00ABB6 93 EE 04 CF 00           5 	.ascii "WORDS"
      00ABBB 1A 90                    6 	.word words  
      0032DF                       5070 	_dict_entry 4,WAIT,wait 
      00ABBD F6 93                    1 	.word LINK 
                           0032E1     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



      0032E1                          3 WAIT:
      00ABBF EE                       4 	.byte 4   	
      00ABC0 01 72 A9 00              5 	.ascii "WAIT"
      00ABC4 03 90                    6 	.word wait  
      0032E8                       5071 	_dict_entry,3+F_IFUNC,USR,usr
      00ABC6 F7 90                    1 	.word LINK 
                           0032EA     2 	LINK=.
      0032EA                          3 USR:
      00ABC8 EF                       4 	.byte 3+F_IFUNC   	
      00ABC9 01 72 CD                 5 	.ascii "USR"
      00ABCC 00 1A                    6 	.word usr  
      0032F0                       5072 	_dict_entry,5,UNTIL,until 
      00ABCE 81 EA                    1 	.word LINK 
                           0032F2     2 	LINK=.
      00ABCF                          3 UNTIL:
      00ABCF 72                       4 	.byte 5   	
      00ABD0 0D 52 30 FB 8E           5 	.ascii "UNTIL"
      00ABD5 CC 81                    6 	.word until  
      0032FA                       5073 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      00ABD7 35 F2                    1 	.word LINK 
                           0032FC     2 	LINK=.
      00ABD8                          3 UFLASH:
      00ABD8 72                       4 	.byte 6+F_IFUNC   	
      00ABD9 0D 52 30 FB 72 16        5 	.ascii "UFLASH"
      00ABDF 00 23                    6 	.word uflash  
      003305                       5074 	_dict_entry,6+F_IFUNC,UBOUND,ubound
      00ABE1 8E 81                    1 	.word LINK 
                           003307     2 	LINK=.
      00ABE3                          3 UBOUND:
      00ABE3 CD                       4 	.byte 6+F_IFUNC   	
      00ABE4 9B AC A1 84 27 03        5 	.ascii "UBOUND"
      00ABEA CC 97                    6 	.word ubound  
      003310                       5075 	_dict_entry,4,TONE,tone  
      00ABEC 25 90                    1 	.word LINK 
                           003312     2 	LINK=.
      003312                          3 TONE:
      00ABEE F6                       4 	.byte 4   	
      00ABEF 93 EE 01 72              5 	.ascii "TONE"
      00ABF3 A9 00                    6 	.word tone  
      003319                       5076 	_dict_entry,2,TO,to
      00ABF5 03 12                    1 	.word LINK 
                           00331B     2 	LINK=.
      00ABF6                          3 TO:
      00ABF6 CF                       4 	.byte 2   	
      00ABF7 00 13                    5 	.ascii "TO"
      00ABF9 CE 00                    6 	.word to  
      003320                       5077 	_dict_entry,5,TIMER,set_timer
      00ABFB 13 5D                    1 	.word LINK 
                           003322     2 	LINK=.
      003322                          3 TIMER:
      00ABFD 27                       4 	.byte 5   	
      00ABFE 03 8F 26 F7 52           5 	.ascii "TIMER"
      00AC02 2D F1                    6 	.word set_timer  
      00332A                       5078 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00AC02 81 22                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



                           00332C     2 	LINK=.
      00AC03                          3 TIMEOUT:
      00AC03 CD                       4 	.byte 7+F_IFUNC   	
      00AC04 9B AC A1 84 27 03 CC     5 	.ascii "TIMEOUT"
      00AC0B 97 25                    6 	.word timeout  
      003336                       5079 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00AC0D 90 F6                    1 	.word LINK 
                           003338     2 	LINK=.
      003338                          3 TICKS:
      00AC0F 93                       4 	.byte 5+F_IFUNC   	
      00AC10 EE 01 72 A9 00           5 	.ascii "TICKS"
      00AC15 03 D5                    6 	.word get_ticks  
      00AC16                       5080 	_dict_entry,4,STOP,stop 
      00AC16 A3 14                    1 	.word LINK 
                           003342     2 	LINK=.
      003342                          3 STOP:
      00AC18 00                       4 	.byte 4   	
      00AC19 2B 0C 35 0F              5 	.ascii "STOP"
      00AC1D 50 F2                    6 	.word stop  
      003349                       5081 	_dict_entry,4,STEP,step 
      00AC1F A6 1E                    1 	.word LINK 
                           00334B     2 	LINK=.
      00334B                          3 STEP:
      00AC21 62                       4 	.byte 4   	
      00AC22 A6 10 62 20              5 	.ascii "STEP"
      00AC26 1E 1C                    6 	.word step  
      00AC27                       5082 	_dict_entry,5,SPIWR,spi_write
      00AC27 A3 08                    1 	.word LINK 
                           003354     2 	LINK=.
      003354                          3 SPIWR:
      00AC29 00                       4 	.byte 5   	
      00AC2A 2B 09 35 0E 50           5 	.ascii "SPIWR"
      00AC2F F2 A6                    6 	.word spi_write  
      00335C                       5083 	_dict_entry,6,SPISEL,spi_select
      00AC31 50 62                    1 	.word LINK 
                           00335E     2 	LINK=.
      00335E                          3 SPISEL:
      00AC33 20                       4 	.byte 6   	
      00AC34 10 50 49 53 45 4C        5 	.ascii "SPISEL"
      00AC35 30 B0                    6 	.word spi_select  
      003367                       5084 	_dict_entry,5+F_IFUNC,SPIRD,spi_read 
      00AC35 35 07                    1 	.word LINK 
                           003369     2 	LINK=.
      003369                          3 SPIRD:
      00AC37 50                       4 	.byte 5+F_IFUNC   	
      00AC38 F2 50 49 52 44           5 	.ascii "SPIRD"
      00AC39 30 A9                    6 	.word spi_read  
      003371                       5085 	_dict_entry,5,SPIEN,spi_enable 
      00AC39 A3 00                    1 	.word LINK 
                           003373     2 	LINK=.
      003373                          3 SPIEN:
      00AC3B 40                       4 	.byte 5   	
      00AC3C 23 07 72 5C 50           5 	.ascii "SPIEN"
      00AC41 F2 54                    6 	.word spi_enable  
      00337B                       5086 	_dict_entry,5,SLEEP,sleep 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



      00AC43 20 F4                    1 	.word LINK 
                           00337D     2 	LINK=.
      00AC45                          3 SLEEP:
      00AC45 9F                       4 	.byte 5   	
      00AC46 4A 27 01 4A 50           5 	.ascii "SLEEP"
      00AC4A 2B 58                    6 	.word sleep  
      003385                       5087     _dict_entry,4,SIZE,cmd_size 
      00AC4A A4 3E                    1 	.word LINK 
                           003387     2 	LINK=.
      003387                          3 SIZE:
      00AC4C C7                       4 	.byte 4   	
      00AC4D 50 F1 72 18              5 	.ascii "SIZE"
      00AC51 50 F0                    6 	.word cmd_size  
      00338E                       5088 	_dict_entry,4,SAVE,cmd_save 
      00AC53 8E 81                    1 	.word LINK 
                           003390     2 	LINK=.
      00AC55                          3 SAVE:
      00AC55 C6                       4 	.byte 4   	
      00AC56 00 10 CE 00              5 	.ascii "SAVE"
      00AC5A 11 81                    6 	.word cmd_save  
      00AC5C                       5089 	_dict_entry 3,RUN,cmd_run
      00AC5C CD 9A                    1 	.word LINK 
                           003399     2 	LINK=.
      003399                          3 RUN:
      00AC5E 65                       4 	.byte 3   	
      00AC5F A1 01 27                 5 	.ascii "RUN"
      00AC62 03 CC                    6 	.word cmd_run  
      00339F                       5090 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00AC64 97 25                    1 	.word LINK 
                           0033A1     2 	LINK=.
      00AC66                          3 RSHIFT:
      00AC66 CD                       4 	.byte 6+F_IFUNC   	
      00AC67 82 73 90 F6 93 EE        5 	.ascii "RSHIFT"
      00AC6D 01 72                    6 	.word rshift  
      0033AA                       5091 	_dict_entry,3+F_IFUNC,RND,random 
      00AC6F A9 00                    1 	.word LINK 
                           0033AC     2 	LINK=.
      0033AC                          3 RND:
      00AC71 03                       4 	.byte 3+F_IFUNC   	
      00AC72 81 4E 44                 5 	.ascii "RND"
      00AC73 2C E9                    6 	.word random  
      0033B2                       5092 	_dict_entry,6,RETURN,return 
      00AC73 CD 9A                    1 	.word LINK 
                           0033B4     2 	LINK=.
      0033B4                          3 RETURN:
      00AC75 65                       4 	.byte 6   	
      00AC76 A1 02 27 03 CC 97        5 	.ascii "RETURN"
      00AC7C 25 90                    6 	.word return  
      0033BD                       5093 	_dict_entry,7,RESTORE,restore 
      00AC7E F6 93                    1 	.word LINK 
                           0033BF     2 	LINK=.
      0033BF                          3 RESTORE:
      00AC80 EE                       4 	.byte 7   	
      00AC81 01 72 A9 00 03 9F 88     5 	.ascii "RESTORE"
      00AC88 90 F6                    6 	.word restore  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



      0033C9                       5094 	_dict_entry 3,REM,remark 
      00AC8A 93 EE                    1 	.word LINK 
                           0033CB     2 	LINK=.
      0033CB                          3 REM:
      00AC8C 01                       4 	.byte 3   	
      00AC8D 72 A9 00                 5 	.ascii "REM"
      00AC90 03 0D                    6 	.word remark  
      0033D1                       5095 	_dict_entry,6,REBOOT,cold_start
      00AC92 01 27                    1 	.word LINK 
                           0033D3     2 	LINK=.
      0033D3                          3 REBOOT:
      00AC94 07                       4 	.byte 6   	
      00AC95 98 59 49 0A 01 26        5 	.ascii "REBOOT"
      00AC9B F9 5B                    6 	.word cold_start  
      0033DC                       5096 	_dict_entry,4+F_IFUNC,READ,read  
      00AC9D 01 81                    1 	.word LINK 
                           0033DE     2 	LINK=.
      00AC9F                          3 READ:
      00AC9F CD                       4 	.byte 4+F_IFUNC   	
      00ACA0 9A 65 A1 02              5 	.ascii "READ"
      00ACA4 27 03                    6 	.word read  
      0033E5                       5097 	_dict_entry,4+F_IFUNC,QKEY,qkey
      00ACA6 CC 97                    1 	.word LINK 
                           0033E7     2 	LINK=.
      0033E7                          3 QKEY:
      00ACA8 25                       4 	.byte 4+F_IFUNC   	
      00ACA9 90 F6 93 EE              5 	.ascii "QKEY"
      00ACAD 01 72                    6 	.word qkey  
      0033EE                       5098 	_dict_entry,3,PUT,xput 
      00ACAF A9 00                    1 	.word LINK 
                           0033F0     2 	LINK=.
      0033F0                          3 PUT:
      00ACB1 03                       4 	.byte 3   	
      00ACB2 9F 88 90                 5 	.ascii "PUT"
      00ACB5 F6 93                    6 	.word xput  
      0033F6                       5099 	_dict_entry,4,PUSH,xpush   
      00ACB7 EE 01                    1 	.word LINK 
                           0033F8     2 	LINK=.
      0033F8                          3 PUSH:
      00ACB9 72                       4 	.byte 4   	
      00ACBA A9 00 03 0D              5 	.ascii "PUSH"
      00ACBE 01 27                    6 	.word xpush  
      0033FF                       5100 	_dict_entry,5+F_IFUNC,PORTI,const_porti 
      00ACC0 07 98                    1 	.word LINK 
                           003401     2 	LINK=.
      003401                          3 PORTI:
      00ACC2 46                       4 	.byte 5+F_IFUNC   	
      00ACC3 56 0A 01 26 F9           5 	.ascii "PORTI"
      00ACC8 5B 01                    6 	.word const_porti  
      003409                       5101 	_dict_entry,5+F_IFUNC,PORTG,const_portg 
      00ACCA 81 01                    1 	.word LINK 
                           00340B     2 	LINK=.
      00ACCB                          3 PORTG:
      00ACCB A6                       4 	.byte 5+F_IFUNC   	
      00ACCC 84 CD 9A 58 CD           5 	.ascii "PORTG"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal [24-Bits]



      00ACD1 98 BE                    6 	.word const_portg  
      003413                       5102 	_dict_entry,5+F_IFUNC,PORTF,const_portf
      00ACD3 9F A4                    1 	.word LINK 
                           003415     2 	LINK=.
      003415                          3 PORTF:
      00ACD5 07                       4 	.byte 5+F_IFUNC   	
      00ACD6 C7 50 C6 81 46           5 	.ascii "PORTF"
      00ACDA 2F 08                    6 	.word const_portf  
      00341D                       5103 	_dict_entry,5+F_IFUNC,PORTE,const_porte
      00ACDA 52 01                    1 	.word LINK 
                           00341F     2 	LINK=.
      00341F                          3 PORTE:
      00ACDC CD                       4 	.byte 5+F_IFUNC   	
      00ACDD 9A 6A A1 02 27           5 	.ascii "PORTE"
      00ACE2 03 CC                    6 	.word const_porte  
      003427                       5104 	_dict_entry,5+F_IFUNC,PORTD,const_portd
      00ACE4 97 25                    1 	.word LINK 
                           003429     2 	LINK=.
      003429                          3 PORTD:
      00ACE6 90                       4 	.byte 5+F_IFUNC   	
      00ACE7 F6 93 EE 01 72           5 	.ascii "PORTD"
      00ACEC A9 00                    6 	.word const_portd  
      003431                       5105 	_dict_entry,5+F_IFUNC,PORTC,const_portc
      00ACEE 03 CF                    1 	.word LINK 
                           003433     2 	LINK=.
      003433                          3 PORTC:
      00ACF0 00                       4 	.byte 5+F_IFUNC   	
      00ACF1 1A 90 F6 93 EE           5 	.ascii "PORTC"
      00ACF6 01 72                    6 	.word const_portc  
      00343B                       5106 	_dict_entry,5+F_IFUNC,PORTB,const_portb
      00ACF8 A9 00                    1 	.word LINK 
                           00343D     2 	LINK=.
      00343D                          3 PORTB:
      00ACFA 03                       4 	.byte 5+F_IFUNC   	
      00ACFB CD AD 39 6B 01           5 	.ascii "PORTB"
      00AD00 A6 01                    6 	.word const_portb  
      003445                       5107 	_dict_entry,5+F_IFUNC,PORTA,const_porta 
      00AD02 0D 01                    1 	.word LINK 
                           003447     2 	LINK=.
      003447                          3 PORTA:
      00AD04 27                       4 	.byte 5+F_IFUNC   	
      00AD05 0D 48 0A 01 26           5 	.ascii "PORTA"
      00AD0A FB 6B                    6 	.word const_porta  
      00344F                       5108 	_dict_entry 5,PRINT,print 
      00AD0C 01 7B                    1 	.word LINK 
                           003451     2 	LINK=.
      003451                          3 PRINT:
      00AD0E 01                       4 	.byte 5   	
      00AD0F EA 03 E7 03 A6           5 	.ascii "PRINT"
      00AD14 01 C1                    6 	.word print  
      003459                       5109 	_dict_entry,4+F_IFUNC,POUT,const_output
      00AD16 00 0F                    1 	.word LINK 
                           00345B     2 	LINK=.
      00345B                          3 POUT:
      00AD18 27                       4 	.byte 4+F_IFUNC   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 227.
Hexadecimal [24-Bits]



      00AD19 10 7B 01 43              5 	.ascii "POUT"
      00AD1D E4 04                    6 	.word const_output  
      003462                       5110 	_dict_entry,3+F_IFUNC,POP,xpop 
      00AD1F E7 04                    1 	.word LINK 
                           003464     2 	LINK=.
      003464                          3 POP:
      00AD21 7B                       4 	.byte 3+F_IFUNC   	
      00AD22 01 43 E4                 5 	.ascii "POP"
      00AD25 02 E7                    6 	.word xpop  
      00346A                       5111 	_dict_entry,4,POKE,poke 
      00AD27 02 20                    1 	.word LINK 
                           00346C     2 	LINK=.
      00346C                          3 POKE:
      00AD29 0C                       4 	.byte 4   	
      00AD2A 50 4F 4B 45              5 	.ascii "POKE"
      00AD2A 7B 01                    6 	.word poke  
      003473                       5112 	_dict_entry,5,PMODE,pin_mode 
      00AD2C EA 02                    1 	.word LINK 
                           003475     2 	LINK=.
      003475                          3 PMODE:
      00AD2E E7                       4 	.byte 5   	
      00AD2F 02 7B 01 EA 04           5 	.ascii "PMODE"
      00AD34 E7 04                    6 	.word pin_mode  
      00AD36                       5113 	_dict_entry,4+F_IFUNC,PINP,const_input
      00AD36 5B 01                    1 	.word LINK 
                           00347F     2 	LINK=.
      00347F                          3 PINP:
      00AD38 81                       4 	.byte 4+F_IFUNC   	
      00AD39 50 49 4E 50              5 	.ascii "PINP"
      00AD39 58 1C                    6 	.word const_input  
      003486                       5114 	_dict_entry,4+F_IFUNC,PICK,xpick 
      00AD3B AD 49                    1 	.word LINK 
                           003488     2 	LINK=.
      003488                          3 PICK:
      00AD3D FE                       4 	.byte 4+F_IFUNC   	
      00AD3E 9F 88 5E A6              5 	.ascii "PICK"
      00AD42 05 42                    6 	.word xpick  
      00348F                       5115 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00AD44 1C 50                    1 	.word LINK 
                           003491     2 	LINK=.
      003491                          3 PEEK:
      00AD46 00                       4 	.byte 4+F_IFUNC   	
      00AD47 84 81 45 4B              5 	.ascii "PEEK"
      00AD49 22 68                    6 	.word peek  
      003498                       5116 	_dict_entry,5,PAUSE,pause 
      00AD49 03 06                    1 	.word LINK 
                           00349A     2 	LINK=.
      00349A                          3 PAUSE:
      00AD4B 03                       4 	.byte 5   	
      00AD4C 05 04 00 02 01           5 	.ascii "PAUSE"
      00AD51 06 00                    6 	.word pause  
      0034A2                       5117 	_dict_entry,3+F_IFUNC,PAD,pad_ref 
      00AD53 02 02                    1 	.word LINK 
                           0034A4     2 	LINK=.
      0034A4                          3 PAD:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
Hexadecimal [24-Bits]



      00AD55 02                       4 	.byte 3+F_IFUNC   	
      00AD56 03 03 01                 5 	.ascii "PAD"
      00AD59 03 03                    6 	.word pad_ref  
      0034AA                       5118 	_dict_entry,2+F_OR,OR,TK_OR ; OR operator 
      00AD5B 02 04                    1 	.word LINK 
                           0034AC     2 	LINK=.
      0034AC                          3 OR:
      00AD5D 04                       4 	.byte 2+F_OR   	
      00AD5E 05 02                    5 	.ascii "OR"
      00AD60 06 02                    6 	.word TK_OR  
      0034B1                       5119 	_dict_entry,2,ON,cmd_on 
      00AD62 07 02                    1 	.word LINK 
                           0034B3     2 	LINK=.
      0034B3                          3 ON:
      00AD64 05                       4 	.byte 2   	
      00AD65 04 02                    5 	.ascii "ON"
      00AD67 04 01                    6 	.word cmd_on  
      00AD69                       5120 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00AD69 CD 9A                    1 	.word LINK 
                           0034BA     2 	LINK=.
      0034BA                          3 ODR:
      00AD6B 65                       4 	.byte 3+F_IFUNC   	
      00AD6C A1 01 27                 5 	.ascii "ODR"
      00AD6F 03 CC                    6 	.word const_odr  
      0034C0                       5121 	_dict_entry,3+F_NOT,NOT,TK_NOT;NOT operator
      00AD71 97 25                    1 	.word LINK 
                           0034C2     2 	LINK=.
      00AD73                          3 NOT:
      00AD73 90                       4 	.byte 3+F_NOT   	
      00AD74 F6 93 EE                 5 	.ascii "NOT"
      00AD77 01 72                    6 	.word TK_NOT  
      0034C8                       5122 	_dict_entry,4,NEXT,next 
      00AD79 A9 00                    1 	.word LINK 
                           0034CA     2 	LINK=.
      0034CA                          3 NEXT:
      00AD7B 03                       4 	.byte 4   	
      00AD7C 89 88 A6 80              5 	.ascii "NEXT"
      00AD80 15 01                    6 	.word next  
      0034D1                       5123 	_dict_entry,3,NEW,new
      00AD82 27 05                    1 	.word LINK 
                           0034D3     2 	LINK=.
      0034D3                          3 NEW:
      00AD84 A6                       4 	.byte 3   	
      00AD85 0A CC 97                 5 	.ascii "NEW"
      00AD88 27 CE                    6 	.word new  
      00AD89                       5124 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00AD89 CE 00                    1 	.word LINK 
                           0034DB     2 	LINK=.
      0034DB                          3 LSHIFT:
      00AD8B 15                       4 	.byte 6+F_IFUNC   	
      00AD8C 58 58 58 58 58 9E        5 	.ascii "LSHIFT"
      00AD92 C8 00                    6 	.word lshift  
      0034E4                       5125 	_dict_entry,4+F_IFUNC,LOG2,log2 
      00AD94 15 C7                    1 	.word LINK 
                           0034E6     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



      0034E6                          3 LOG2:
      00AD96 00                       4 	.byte 4+F_IFUNC   	
      00AD97 0E 9F C8 00              5 	.ascii "LOG2"
      00AD9B 16 C7                    6 	.word log2  
      0034ED                       5126 	_dict_entry 4,LIST,cmd_list
      00AD9D 00 0F                    1 	.word LINK 
                           0034EF     2 	LINK=.
      0034EF                          3 LIST:
      00AD9F CE                       4 	.byte 4   	
      00ADA0 00 17 CF 00              5 	.ascii "LIST"
      00ADA4 15 CE                    6 	.word cmd_list  
      0034F6                       5127 	_dict_entry 3,LET,let 
      00ADA6 00 17                    1 	.word LINK 
                           0034F8     2 	LINK=.
      0034F8                          3 LET:
      00ADA8 54                       4 	.byte 3   	
      00ADA9 9E C8 00                 5 	.ascii "LET"
      00ADAC 17 C7                    6 	.word let  
      0034FE                       5128 	_dict_entry,3+F_CFUNC,KEY,key 
      00ADAE 00 17                    1 	.word LINK 
                           003500     2 	LINK=.
      003500                          3 KEY:
      00ADB0 9F                       4 	.byte 3+F_CFUNC   	
      00ADB1 C8 00 18                 5 	.ascii "KEY"
      00ADB4 C7 00                    6 	.word key  
      003506                       5129 	_dict_entry,7,IWDGREF,refresh_iwdg
      00ADB6 18 CE                    1 	.word LINK 
                           003508     2 	LINK=.
      003508                          3 IWDGREF:
      00ADB8 00                       4 	.byte 7   	
      00ADB9 0E 54 54 54 9E C8 00     5 	.ascii "IWDGREF"
      00ADC0 0E C7                    6 	.word refresh_iwdg  
      003512                       5130 	_dict_entry,6,IWDGEN,enable_iwdg
      00ADC2 00 0E                    1 	.word LINK 
                           003514     2 	LINK=.
      003514                          3 IWDGEN:
      00ADC4 9F                       4 	.byte 6   	
      00ADC5 C8 00 0F C7 00 0F        5 	.ascii "IWDGEN"
      00ADCB C8 00                    6 	.word enable_iwdg  
      00351D                       5131 	_dict_entry,5,INPUT,input_var  
      00ADCD 18 97                    1 	.word LINK 
                           00351F     2 	LINK=.
      00351F                          3 INPUT:
      00ADCF C6                       4 	.byte 5   	
      00ADD0 00 0E C8 00 17           5 	.ascii "INPUT"
      00ADD5 95 CF                    6 	.word input_var  
      003527                       5132 	_dict_entry,2,IF,if 
      00ADD7 00 17                    1 	.word LINK 
                           003529     2 	LINK=.
      003529                          3 IF:
      00ADD9 C6                       4 	.byte 2   	
      00ADDA 00 16                    5 	.ascii "IF"
      00ADDC A4 7F                    6 	.word if  
      00352E                       5133 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00ADDE 72 A2                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
Hexadecimal [24-Bits]



                           003530     2 	LINK=.
      003530                          3 IDR:
      00ADE0 00                       4 	.byte 3+F_IFUNC   	
      00ADE1 03 90 F7                 5 	.ascii "IDR"
      00ADE4 90 EF                    6 	.word const_idr  
      003536                       5134 	_dict_entry,3,HEX,hex_base
      00ADE6 01 84                    1 	.word LINK 
                           003538     2 	LINK=.
      003538                          3 HEX:
      00ADE8 85                       4 	.byte 3   	
      00ADE9 72 A2 00                 5 	.ascii "HEX"
      00ADEC 03 90                    6 	.word hex_base  
      00353E                       5135 	_dict_entry,4,GOTO,goto 
      00ADEE F7 90                    1 	.word LINK 
                           003540     2 	LINK=.
      003540                          3 GOTO:
      00ADF0 EF                       4 	.byte 4   	
      00ADF1 01 CD 84 21              5 	.ascii "GOTO"
      00ADF5 90 F6                    6 	.word goto  
      003547                       5136 	_dict_entry,5,GOSUB,gosub 
      00ADF7 93 EE                    1 	.word LINK 
                           003549     2 	LINK=.
      003549                          3 GOSUB:
      00ADF9 01                       4 	.byte 5   	
      00ADFA 72 A9 00 03 1C           5 	.ascii "GOSUB"
      00ADFF 00 01                    6 	.word gosub  
      003551                       5137 	_dict_entry,3,GET,cmd_get 
      00AE01 A9 00                    1 	.word LINK 
                           003553     2 	LINK=.
      003553                          3 GET:
      00AE03 81                       4 	.byte 3   	
      00AE04 47 45 54                 5 	.ascii "GET"
      00AE04 CD 9A                    6 	.word cmd_get  
      003559                       5138 	_dict_entry,4+F_IFUNC,FREE,free
      00AE06 42 90                    1 	.word LINK 
                           00355B     2 	LINK=.
      00355B                          3 FREE:
      00AE08 89                       4 	.byte 4+F_IFUNC   	
      00AE09 52 03 0F 02              5 	.ascii "FREE"
      00AE0D 0F 03                    6 	.word free  
      003562                       5139 	_dict_entry,3,FOR,for 
      00AE0F 90 AE                    1 	.word LINK 
                           003564     2 	LINK=.
      003564                          3 FOR:
      00AE11 B7                       4 	.byte 3   	
      00AE12 1B 93 F6                 5 	.ascii "FOR"
      00AE15 A4 0F                    6 	.word for  
      00356A                       5140 	_dict_entry,4,FCPU,fcpu 
      00AE17 6B 01                    1 	.word LINK 
                           00356C     2 	LINK=.
      00356C                          3 FCPU:
      00AE19 0C                       4 	.byte 4   	
      00AE1A 03 5C F6 CD              5 	.ascii "FCPU"
      00AE1E 89 7F                    6 	.word fcpu  
      003573                       5141 	_dict_entry,5,ERASE,cmd_erase 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 231.
Hexadecimal [24-Bits]



      00AE20 0C 02                    1 	.word LINK 
                           003575     2 	LINK=.
      003575                          3 ERASE:
      00AE22 0A                       4 	.byte 5   	
      00AE23 01 26 F5 A6 46           5 	.ascii "ERASE"
      00AE28 11 02                    6 	.word cmd_erase  
      00357D                       5142 	_dict_entry,3,END,cmd_end  
      00AE2A 2B 09                    1 	.word LINK 
                           00357F     2 	LINK=.
      00357F                          3 END:
      00AE2C A6                       4 	.byte 3   	
      00AE2D 20 CD 89                 5 	.ascii "END"
      00AE30 7F 0C                    6 	.word cmd_end  
      003585                       5143 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00AE32 02 20                    1 	.word LINK 
                           003587     2 	LINK=.
      003587                          3 EEPROM:
      00AE34 07                       4 	.byte 6+F_IFUNC   	
      00AE35 A6 0D CD 89 7F 0F        5 	.ascii "EEPROM"
      00AE3B 02 72                    6 	.word const_eeprom_base  
      003590                       5144 	_dict_entry,6+F_IFUNC,EEFREE,func_eefree 
      00AE3D A2 00                    1 	.word LINK 
                           003592     2 	LINK=.
      003592                          3 EEFREE:
      00AE3F 02                       4 	.byte 6+F_IFUNC   	
      00AE40 90 FE 26 CF A6 0D        5 	.ascii "EEFREE"
      00AE46 CD 89                    6 	.word func_eefree  
      00359B                       5145 	_dict_entry,4,EDIT,cmd_edit 
      00AE48 7F 5F                    1 	.word LINK 
                           00359D     2 	LINK=.
      00359D                          3 EDIT:
      00AE4A 7B                       4 	.byte 4   	
      00AE4B 03 97 CD 98              5 	.ascii "EDIT"
      00AE4F D4 AE                    6 	.word cmd_edit  
      0035A4                       5146 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00AE51 AE 5B                    1 	.word LINK 
                           0035A6     2 	LINK=.
      0035A6                          3 DWRITE:
      00AE53 CD                       4 	.byte 6+F_CMD   	
      00AE54 89 DC 5B 03 90 85        5 	.ascii "DWRITE"
      00AE5A 81 20                    6 	.word digital_write  
      0035AF                       5147 	_dict_entry,4,DROP,xdrop ; drop n element from xtack 
      00AE5C 77 6F                    1 	.word LINK 
                           0035B1     2 	LINK=.
      0035B1                          3 DROP:
      00AE5E 72                       4 	.byte 4   	
      00AE5F 64 73 20 69              5 	.ascii "DROP"
      00AE63 6E 20                    6 	.word xdrop  
      0035B8                       5148 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00AE65 64 69                    1 	.word LINK 
                           0035BA     2 	LINK=.
      0035BA                          3 DREAD:
      00AE67 63                       4 	.byte 5+F_IFUNC   	
      00AE68 74 69 6F 6E 61           5 	.ascii "DREAD"
      00AE6D 72 79                    6 	.word digital_read  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
Hexadecimal [24-Bits]



      0035C2                       5149 	_dict_entry,2,DO,do_loop
      00AE6F 0A 00                    1 	.word LINK 
                           0035C4     2 	LINK=.
      00AE71                          3 DO:
      00AE71 CD                       4 	.byte 2   	
      00AE72 9A 6A                    5 	.ascii "DO"
      00AE74 A1 01                    6 	.word do_loop  
      0035C9                       5150 	_dict_entry,3,DIR,cmd_dir
      00AE76 27 03                    1 	.word LINK 
                           0035CB     2 	LINK=.
      0035CB                          3 DIR:
      00AE78 CC                       4 	.byte 3   	
      00AE79 97 25 52                 5 	.ascii "DIR"
      00AE7B 29 E8                    6 	.word cmd_dir  
      0035D1                       5151 	_dict_entry,3,DIM,cmd_dim 
      00AE7B 90 F6                    1 	.word LINK 
                           0035D3     2 	LINK=.
      0035D3                          3 DIM:
      00AE7D 93                       4 	.byte 3   	
      00AE7E EE 01 72                 5 	.ascii "DIM"
      00AE81 A9 00                    6 	.word cmd_dim  
      0035D9                       5152 	_dict_entry,3,DEC,dec_base
      00AE83 03 CF                    1 	.word LINK 
                           0035DB     2 	LINK=.
      0035DB                          3 DEC:
      00AE85 00                       4 	.byte 3   	
      00AE86 13 81 43                 5 	.ascii "DEC"
      00AE88 1C BE                    6 	.word dec_base  
      0035E1                       5153 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00AE88 4F CE                    1 	.word LINK 
                           0035E3     2 	LINK=.
      0035E3                          3 DDR:
      00AE8A 00                       4 	.byte 3+F_IFUNC   	
      00AE8B 13 27 02                 5 	.ascii "DDR"
      00AE8E 5F 81                    6 	.word const_ddr  
      0035E9                       5154 	_dict_entry,4,DATA,data  
      00AE90 43 53                    1 	.word LINK 
                           0035EB     2 	LINK=.
      0035EB                          3 DATA:
      00AE92 81                       4 	.byte 4   	
      00AE93 44 41 54 41              5 	.ascii "DATA"
      00AE93 CD 9A                    6 	.word data  
      0035F2                       5155 	_dict_entry,3+F_IFUNC,CR2,const_cr2 
      00AE95 6A A1                    1 	.word LINK 
                           0035F4     2 	LINK=.
      0035F4                          3 CR2:
      00AE97 01                       4 	.byte 3+F_IFUNC   	
      00AE98 27 03 CC                 5 	.ascii "CR2"
      00AE9B 97 25                    6 	.word const_cr2  
      0035FA                       5156 	_dict_entry,3+F_IFUNC,CR1,const_cr1 
      00AE9D 90 F6                    1 	.word LINK 
                           0035FC     2 	LINK=.
      0035FC                          3 CR1:
      00AE9F 93                       4 	.byte 3+F_IFUNC   	
      00AEA0 EE 01 72                 5 	.ascii "CR1"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 233.
Hexadecimal [24-Bits]



      00AEA3 A9 00                    6 	.word const_cr1  
      003602                       5157 	_dict_entry,5,CONST,cmd_const 
      00AEA5 03 4B                    1 	.word LINK 
                           003604     2 	LINK=.
      003604                          3 CONST:
      00AEA7 00                       4 	.byte 5   	
      00AEA8 35 CC 50 E0 9E           5 	.ascii "CONST"
      00AEAD A4 3F                    6 	.word cmd_const  
      00360C                       5158 	_dict_entry,4+F_CFUNC,CHAR,func_char
      00AEAF 95 A3                    1 	.word LINK 
                           00360E     2 	LINK=.
      00360E                          3 CHAR:
      00AEB1 00                       4 	.byte 4+F_CFUNC   	
      00AEB2 FF 23 06 0C              5 	.ascii "CHAR"
      00AEB6 01 98                    6 	.word func_char  
      003615                       5159 	_dict_entry,5,CHAIN,cmd_chain
      00AEB8 56 20                    1 	.word LINK 
                           003617     2 	LINK=.
      003617                          3 CHAIN:
      00AEBA F5                       4 	.byte 5   	
      00AEBB 35 55 50 E0 84           5 	.ascii "CHAIN"
      00AEC0 C7 50                    6 	.word cmd_chain  
      00361F                       5160 	_dict_entry,3,BYE,bye 
      00AEC2 E1 9F                    1 	.word LINK 
                           003621     2 	LINK=.
      003621                          3 BYE:
      00AEC4 4A                       4 	.byte 3   	
      00AEC5 35 55 50                 5 	.ascii "BYE"
      00AEC8 E0 C7                    6 	.word bye  
      003627                       5161 	_dict_entry,5,BTOGL,bit_toggle
      00AECA 50 E2                    1 	.word LINK 
                           003629     2 	LINK=.
      003629                          3 BTOGL:
      00AECC 35                       4 	.byte 5   	
      00AECD AA 50 E0 81 4C           5 	.ascii "BTOGL"
      00AED1 21 EE                    6 	.word bit_toggle  
      003631                       5162 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00AED1 35 AA                    1 	.word LINK 
                           003633     2 	LINK=.
      003633                          3 BTEST:
      00AED3 50                       4 	.byte 5+F_IFUNC   	
      00AED4 E0 81 45 53 54           5 	.ascii "BTEST"
      00AED6 22 10                    6 	.word bit_test  
      00363B                       5163 	_dict_entry,4,BSET,bit_set 
      00AED6 CD 9A                    1 	.word LINK 
                           00363D     2 	LINK=.
      00363D                          3 BSET:
      00AED8 65                       4 	.byte 4   	
      00AED9 A1 01 27 03              5 	.ascii "BSET"
      00AEDD CC 97                    6 	.word bit_set  
      003644                       5164 	_dict_entry,4,BRES,bit_reset
      00AEDF 25 3D                    1 	.word LINK 
                           003646     2 	LINK=.
      00AEE0                          3 BRES:
      00AEE0 90                       4 	.byte 4   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 234.
Hexadecimal [24-Bits]



      00AEE1 F6 93 EE 01              5 	.ascii "BRES"
      00AEE5 72 A9                    6 	.word bit_reset  
      00364D                       5165 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00AEE7 00 03                    1 	.word LINK 
                           00364F     2 	LINK=.
      00364F                          3 BIT:
      00AEE9 4D                       4 	.byte 3+F_IFUNC   	
      00AEEA 26 08 5D                 5 	.ascii "BIT"
      00AEED 26 05                    6 	.word bitmask  
      003655                       5166 	_dict_entry,3,AWU,awu 
      00AEEF A6 0A                    1 	.word LINK 
                           003657     2 	LINK=.
      003657                          3 AWU:
      00AEF1 CC                       4 	.byte 3   	
      00AEF2 97 27 4B                 5 	.ascii "AWU"
      00AEF5 18 59                    6 	.word awu  
      00365D                       5167 	_dict_entry,7,AUTORUN,cmd_auto_run
      00AEF7 49 25                    1 	.word LINK 
                           00365F     2 	LINK=.
      00365F                          3 AUTORUN:
      00AEF9 04                       4 	.byte 7   	
      00AEFA 0A 01 26 F8 5F 84 4A     5 	.ascii "AUTORUN"
      00AF01 02 A8                    6 	.word cmd_auto_run  
      00AF02                       5168 	_dict_entry,3+F_IFUNC,ASC,ascii
      00AF02 81 5F                    1 	.word LINK 
                           00366B     2 	LINK=.
      00AF03                          3 ASC:
      00AF03 CD                       4 	.byte 3+F_IFUNC   	
      00AF04 9A 65 A1                 5 	.ascii "ASC"
      00AF07 01 27                    6 	.word ascii  
      003671                       5169 	_dict_entry,3+F_AND,AND,TK_AND ; AND operator 
      00AF09 03 CC                    1 	.word LINK 
                           003673     2 	LINK=.
      003673                          3 AND:
      00AF0B 97                       4 	.byte 3+F_AND   	
      00AF0C 25 90 F6                 5 	.ascii "AND"
      00AF0F 93 EE                    6 	.word TK_AND  
      003679                       5170 	_dict_entry,5,ALLOC,xalloc ; allocate space on xtack 
      00AF11 01 72                    1 	.word LINK 
                           00367B     2 	LINK=.
      00367B                          3 ALLOC:
      00AF13 A9                       4 	.byte 5   	
      00AF14 00 03 9F AE 00           5 	.ascii "ALLOC"
      00AF19 01 A4                    6 	.word xalloc  
      003683                       5171 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00AF1B 17 27                    1 	.word LINK 
                           003685     2 	LINK=.
      003685                          3 ADCREAD:
      00AF1D 0A                       4 	.byte 7+F_IFUNC   	
      00AF1E 88 4F 43 52 45 41 44     5 	.ascii "ADCREAD"
      00AF20 26 C5                    6 	.word analog_read  
      00368F                       5172 	_dict_entry,5,ADCON,power_adc 
      00AF20 58 49                    1 	.word LINK 
                           003691     2 	LINK=.
      003691                          3 ADCON:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
Hexadecimal [24-Bits]



      00AF22 0A                       4 	.byte 5   	
      00AF23 01 26 FA 4F 4E           5 	.ascii "ADCON"
      00AF26 26 75                    6 	.word power_adc  
      003699                       5173 kword_dict::
      003699                       5174 	_dict_entry,3+F_IFUNC,ABS,abs
      00AF26 5B 01                    1 	.word LINK 
                           00369B     2 	LINK=.
      00369B                          3 ABS:
      00AF28 81                       4 	.byte 3+F_IFUNC   	
      00AF29 41 42 53                 5 	.ascii "ABS"
      00AF29 85 52                    6 	.word abs  
                                   5175 
                                   5176 
                                   5177 
                                   5178 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 236.
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
      0036A1                         30 test:
      0036A1                         31     _vars VSIZE 
      00AF2B 04 89            [ 2]    1     sub sp,#VSIZE 
      00AF2D CE 00 05         [ 2]   32     ldw x,#LOOP_CNT
      00AF30 1F 03            [ 2]   33     ldw (CNTR,sp),x  
      00AF32 CE 00 01         [ 2]   34     ldw x,ticks 
      00AF35 1F 05            [ 2]   35     ldw (T,sp),x
      0036AD                         36 1$: ; test add24 
      00AF37 72 5C            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00AF39 00 20 81         [ 2]   38     ldw x,#VAL1&0XFFFF
      00AF3C C7 00 0C         [ 1]   39     ld acc24,a 
      00AF3C 72 5D 00         [ 2]   40     ldw acc24+1,x  
      00AF3F 20 26            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00AF41 03 CC 97         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00AF44 25 01 7E         [ 4]   43     call add24 
      00AF45 1E 03            [ 2]   44     ldw x,(CNTR,sp)
      00AF45 CD 9C C5         [ 2]   45     subw x,#1
      00AF48 90 F6            [ 2]   46     ldw (CNTR,sp),x 
      00AF4A 93 EE            [ 1]   47     jrne 1$
      00AF4C 01 72 A9         [ 4]   48     call prt_acc24
      00AF4F 00 03            [ 1]   49     ld a,#SPACE 
      00AF51 4D 26 13         [ 4]   50     call putc 
      00AF54 5D 26 10         [ 2]   51     ldw x,ticks 
      00AF57 1E 03 CF         [ 2]   52     subw x,(T,sp)
      00AF5A 00 05 E6         [ 4]   53     call prt_i16  
      00AF5D 02 C7            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
Hexadecimal [24-Bits]



      00AF5F 00 03 1E         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00AF62 05 CF 00         [ 2]   58     ldw x,LOOP_CNT
      00AF65 01 81            [ 2]   59     ldw (CNTR,sp),x 
      00AF67 CE 00 0F         [ 2]   60     ldw x,ticks 
      00AF67 85 5B            [ 2]   61     ldw (T,sp),x 
      0036E9                         62 2$: 
      00AF69 04 72            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00AF6B 5A 00 20         [ 2]   64     ldw x,#VAL1&0XFFFF
      00AF6E FC 00 0C         [ 1]   65     ld acc24,a 
      00AF6F CF 00 0D         [ 2]   66     ldw acc24+1,x  
      00AF6F AE 50            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00AF71 00 4F 81         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00AF74 CD 02 79         [ 4]   69     call mul24 
      00AF74 AE 50            [ 2]   70     ldw x,(CNTR,sp)
      00AF76 05 4F 81         [ 2]   71     subw x,#1
      00AF79 1F 03            [ 2]   72     ldw (CNTR,sp),x 
      00AF79 AE 50            [ 1]   73     jrne 2$ 
      00AF7B 0A 4F 81         [ 4]   74    call prt_acc24 
      00AF7E A6 20            [ 1]   75    ld a,#SPACE 
      00AF7E AE 50 0F         [ 4]   76    call putc 
      00AF81 4F 81 0F         [ 2]   77     ldw x,ticks 
      00AF83 72 F0 01         [ 2]   78     subw x,(T,sp)
      00AF83 AE 50 14         [ 4]   79     call prt_i16 
      00AF86 4F 81            [ 1]   80     ld a,#CR 
      00AF88 CD 08 FF         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00AF88 AE 50 19         [ 2]   83     ldw x,LOOP_CNT
      00AF8B 4F 81            [ 2]   84     ldw (CNTR,sp),x 
      00AF8D CE 00 0F         [ 2]   85     ldw x,ticks 
      00AF8D AE 50            [ 2]   86     ldw (T,sp),x 
      003725                         87 3$: 
      00AF8F 1E 4F            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00AF91 81 FF FF         [ 2]   89     ldw x,#VAL1&0XFFFF
      00AF92 C7 00 0C         [ 1]   90     ld acc24,a 
      00AF92 AE 50 28         [ 2]   91     ldw acc24+1,x  
      00AF95 4F 81            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00AF97 AE 05 FF         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00AF97 4F AE 00         [ 4]   94     call mul24 
      00AF9A 00 81            [ 2]   95     ldw x,(CNTR,sp)
      00AF9C 1D 00 01         [ 2]   96     subw x,#1
      00AF9C 4F AE            [ 2]   97     ldw (CNTR,sp),x 
      00AF9E 00 01            [ 1]   98     jrne 3$ 
      00AFA0 81 18 6B         [ 4]   99     call prt_acc24    
      00AFA1 A6 20            [ 1]  100     ld a,#SPACE 
      00AFA1 4F AE 00         [ 4]  101     call putc 
      00AFA4 02 81 0F         [ 2]  102     ldw x,ticks 
      00AFA6 72 F0 01         [ 2]  103     subw x,(T,sp)
      00AFA6 4F AE 00         [ 4]  104     call prt_i16 
      00AFA9 03 81            [ 1]  105     ld a,#CR 
      00AFAB CD 08 FF         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00AFAB 4F AE 00         [ 2]  108     ldw x,LOOP_CNT
      00AFAE 04 81            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
Hexadecimal [24-Bits]



      00AFB0 CE 00 0F         [ 2]  110     ldw x,ticks 
      00AFB0 4F AE            [ 2]  111     ldw (T,sp),x 
      003761                        112 4$:
      00AFB2 00 01            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00AFB4 81 FF FF         [ 2]  114     ldw x,#VAL1&0XFFFF
      00AFB5 C7 00 0C         [ 1]  115     ld acc24,a 
      00AFB5 4F AE 00         [ 2]  116     ldw acc24+1,x  
      00AFB8 00 81            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00AFBA AE FF FD         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00AFBA 4F AE 40         [ 4]  119     call mul24 
      00AFBD 00 81            [ 2]  120     ldw x,(CNTR,sp)
      00AFBF 1D 00 01         [ 2]  121     subw x,#1
      00AFBF 55 00            [ 2]  122     ldw (CNTR,sp),x 
      00AFC1 03 00            [ 1]  123     jrne 4$ 
      00AFC3 02 81 6B         [ 4]  124     call prt_acc24 
      00AFC5 A6 20            [ 1]  125     ld a,#SPACE 
      00AFC5 89 E6 03         [ 4]  126     call putc 
      00AFC8 A1 80 26         [ 2]  127     ldw x,ticks 
      00AFCB 05 EE 04         [ 2]  128     subw x,(T,sp)
      00AFCE A3 AF BF         [ 4]  129     call prt_i16 
      00AFD1 85 81            [ 1]  130     ld a,#CR 
      00AFD3 CD 08 FF         [ 4]  131     call putc 
                                    132 ; test abs24 
      00AFD3 CD 9A 4D         [ 2]  133     ldw x,LOOP_CNT
      00AFD6 5F CF            [ 2]  134     ldw (CNTR,sp),x 
      00AFD8 00 07 CF         [ 2]  135     ldw x,ticks 
      00AFDB 00 09            [ 2]  136     ldw (T,sp),x 
      00379D                        137 5$: 
      00AFDD CE 00            [ 1]  138     ld a,#0xff
      00AFDF 1C CD 98         [ 2]  139     ldw x,#0xffff
      00AFE2 8C A1 84         [ 4]  140     call abs24 
      00AFE5 26 10 CD         [ 1]  141     ld acc24,a 
      00AFE8 98 BE 90         [ 2]  142     ldw acc24+1,x
      00AFEB 89 4F            [ 2]  143     ldw x,(CNTR,sp)
      00AFED CD 8C C5         [ 2]  144     subw x,#1
      00AFF0 90 85            [ 2]  145     ldw (CNTR,sp),x 
      00AFF2 5D 26            [ 1]  146     jrne 5$ 
      00AFF4 17 20 44         [ 4]  147     call prt_acc24 
      00AFF7 A6 20            [ 1]  148     ld a,#SPACE 
      00AFF7 55 00 04         [ 4]  149     call putc 
      00AFFA 00 02 C3         [ 2]  150     ldw x,ticks 
      00AFFD 00 1E 24         [ 2]  151     subw x,(T,sp)
      00B000 3A 18 54         [ 4]  152     call prt_i16 
      00B001                        153 6$:
      00B001 CD AF            [ 1]  154     ld a,#CR 
      00B003 C5 26 00         [ 4]  155     call putc 
      00B006 CD B0 19         [ 4]  156     call read_integer 
      00B009 26 FB 81 00 18   [ 1]  157     mov farptr,acc24 
      00B00C 55 00 0D 00 19   [ 1]  158     mov farptr+1,acc16 
      00B00C CF 00 07 E6 02   [ 1]  159     mov farptr+2,acc8 
      00B011 C7 00 0A         [ 4]  160     call read_integer 
      00B014 35 06 00         [ 1]  161     ld a,acc24 
      00B017 09 81 0D         [ 2]  162     ldw x,acc16 
      00B019 55 00 18 00 0C   [ 1]  163     mov acc24,farptr 
      00B019 E6 02 C7 00 0F   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]



      00B01E 72 5F 00 0E 72   [ 1]  165     mov acc8,farptr+2 
      00B023 BB 00 0E         [ 4]  166     call div24 
      00B026 C3               [ 1]  167     push a 
      00B027 00               [ 2]  168     pushw x 
      00B028 1E 25 02         [ 4]  169     call prt_acc24 
      00B02B 20 0E            [ 1]  170     ld a,#SPACE 
      00B02D CD 08 FF         [ 4]  171     call putc 
      00B02D CD               [ 2]  172     popw x
      00B02E AF C5 27         [ 2]  173     ldw acc16,x  
      00B031 04 A6 01         [ 1]  174     pop acc24 
      00B034 20 04 CD         [ 4]  175     call prt_acc24
      00B037 B0 0C            [ 2]  176     jra 6$
      00380D                        177     _drop VSIZE 
      00B039 4F 81            [ 2]    1     addw sp,#VSIZE 
      00B03B 81               [ 4]  178     ret 
                                    179 
                                    180 
      003810                        181 read_integer:
      00B03B A6 0C            [ 1]  182     ld a,#'? 
      00B03D CC 97 27         [ 4]  183     call putc  
      00B040 72 5F 00 02      [ 1]  184 	clr count  
      00B040 CD 9A 4D         [ 4]  185 	call readln 
      00B043 52 07 CD         [ 2]  186 	ldw x,#tib 
      00B046 A1 27 02         [ 1]  187 	push count
      00B048 4B 00            [ 1]  188 	push #0 
      00B048 C6 00 09         [ 2]  189 	addw x,(1,sp)
      00B04B C1               [ 1]  190 	incw x 
      003828                        191 	_drop 2 
      00B04C 00 0A            [ 2]    1     addw sp,#2 
      00B04E 27 37 00 01      [ 1]  192 	clr in 
      00B050 CD 0E F5         [ 4]  193 	call get_token
      00B050 CE 00            [ 1]  194 	cp a,#TK_INTGR
      00B052 07 CF            [ 1]  195 	jreq 3$ 
      00B054 00 05            [ 1]  196 	cp a,#TK_MINUS
      00B056 55 00 09         [ 4]  197 	call get_token 
      00B059 00 02            [ 1]  198 	cp a,#TK_INTGR 
      00B05B 55 00            [ 1]  199 	jreq 2$
      00B05D 0A 00 03         [ 2]  200 	jp syntax_error
      003841                        201 2$:
      00B060 CD 9B AC         [ 4]  202 	call neg_acc24  	
      003844                        203 3$: 
      00B063 A1               [ 4]  204     ret 
                                    205 
                                    206 .endif ; DEBUG  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 240.
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
      00B064 84 27                   31 app_sign:  .word 0 ; .ascii "BC"  ; signature 
      00B066 03 CC                   32 app_size: .word 0 
      003884                         33 app: 
                                     34 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     A32     =  000005     |   4 ABS        00369B R
    ABS_IDX =  000000     |     ACK     =  000006     |   4 ADCON      003691 R
    ADCON_ID=  000002     |   4 ADCREAD    003685 R   |     ADCREAD_=  000004 
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
  4 ALLOC      00367B R   |   4 AND        003673 R   |     AND_IDX =  0000FA 
    ARG_OFS =  000002     |     ARROW_LE=  000080     |     ARROW_RI=  000081 
  4 AR_SIGN    0031FF R   |   4 ASC        00366B R   |     ASC_IDX =  000006 
    ATMP    =  000001     |     ATTRIB  =  000002     |   4 AUTORUN    00365F R
  4 AUTO_RUN   00015C R   |   4 AWU        003657 R   |   4 AWUHandl   000004 R
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
    BELL    =  000007     |     BINARY  =  000001     |   4 BIT        00364F R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000A 
    BLOCKS  =  000005     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  00000D     |   4 BRES       003646 R
    BRES_IDX=  00000C     |     BS      =  000008     |   4 BSET       00363D R
    BSET_IDX=  00000E     |     BSIZE   =  000006     |   4 BTEST      003633 R
    BTEST_ID=  000010     |   4 BTOGL      003629 R   |     BTOGL_ID=  000012 
    BTW     =  000001     |   4 BYE        003621 R   |     BYE_IDX =  000014 
    C       =  000001     |     CAN     =  000018     |     CAN_DGR =  005426 
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
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   4 CHAIN      003617 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Symbol Table

    CHAIN_AD=  000005     |     CHAIN_BP=  000007     |     CHAIN_CN=  000008 
    CHAIN_CO=  00000A     |     CHAIN_IN=  000009     |     CHAIN_LN=  000003 
    CHAIN_TX=  00000B     |     CHAIN_TX=  00000D     |   4 CHAR       00360E R
    CHAR_IDX=  000016     |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
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
    CLK_SWR_=  0000D2     |     CMD_END =  000002     |     CNT     =  000006 
    CNTR    =  000003     |     CNT_LO  =  000004     |     CODE_ADD=  000001 
    COMMA   =  00002C     |   4 CONST      003604 R   |     CONST_ID=  0000B6 
    COUNT   =  000003     |     CPOS    =  000003     |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |     CR      =  00000D     |   4 CR1        0035FC R
    CR1_IDX =  00001A     |   4 CR2        0035F4 R   |     CR2_IDX =  000018 
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
    CX_CNT  =  000004     |     CX_IN   =  000003     |   4 DATA       0035EB R
    DATA_IDX=  00001C     |     DC1     =  000011     |     DC2     =  000012 
    DC3     =  000013     |     DC4     =  000014     |   4 DDR        0035E3 R
    DDR_IDX =  00001E     |     DEBUG   =  000001     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |   4 DEC        0035DB R   |     DEC_IDX =  000020 
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  4 DIM        0035D3 R   |   4 DIR        0035CB R   |     DISCARD =  000004 
    DIVISOR =  000001     |     DIVSOR  =  000001     |     DLE     =  000010 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   4 DO         0035C4 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 243.
Hexadecimal [24-Bits]

Symbol Table

    DOLP_ADR=  000003     |     DOLP_INW=  000005     |     DO_IDX  =  000022 
  4 DREAD      0035BA R   |     DREAD_ID=  000024     |   4 DROP       0035B1 R
  4 DWRITE     0035A6 R   |     DWRITE_I=  000026     |   4 EDIT       00359D R
    EDIT_IDX=  000028     |   4 EEFREE     003592 R   |     EEFREE_I=  0000B8 
  4 EEPROM     003587 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_I=  00002A     |     EEPROM_S=  000800     |     EM      =  000019 
  4 END        00357F R   |     END_IDX =  00002C     |     ENQ     =  000005 
    EOF     =  0000FF     |     EOT     =  000004     |   4 ERASE      003575 R
  4 ERASED     0029C3 R   |     ERASE_ID=  00002E     |     ERR_BAD_=  00000A 
    ERR_BUF_=  00000F     |     ERR_CMD_=  000007     |     ERR_DIV0=  000004 
    ERR_DUPL=  000008     |     ERR_MATH=  000003     |     ERR_MEM_=  000001 
    ERR_NONE=  000000     |     ERR_NOT_=  000009     |     ERR_NO_A=  00000B 
    ERR_NO_D=  00000C     |     ERR_NO_F=  00000E     |     ERR_NO_L=  000005 
    ERR_NO_P=  00000D     |     ERR_NO_P=  000012     |     ERR_OVER=  000010 
    ERR_RD_O=  000011     |     ERR_RUN_=  000006     |     ERR_SYNT=  000002 
    ESC     =  00001B     |     ETB     =  000017     |     ETX     =  000003 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |     FBREAK  =  000004 
    FCOMP   =  000005     |   4 FCPU       00356C R   |     FCPU_IDX=  000030 
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
    FLASH_IA=  000000     |   4 FLASH_ME   001ED5 R   |     FLASH_NC=  00505C 
    FLASH_NF=  00505E     |     FLASH_NF=  000000     |     FLASH_NF=  000001 
    FLASH_NF=  000002     |     FLASH_NF=  000003     |     FLASH_NF=  000004 
    FLASH_NF=  000005     |     FLASH_PU=  005062     |     FLASH_PU=  000056 
    FLASH_PU=  0000AE     |     FLASH_SI=  020000     |     FLASH_WS=  00480D 
    FLN_REJE=  000006     |     FLOOP   =  000002     |     FLSI    =  01F400 
  4 FOR        003564 R   |     FOR_IDX =  000034     |   4 FREE       00355B R
    FREE_IDX=  000088     |     FRUN    =  000000     |     FS      =  00001C 
    FSLEEP  =  000003     |     FSTEP   =  000003     |     FTRAP   =  000001 
    F_AND   =  000080     |     F_CFUNC =  000020     |     F_CMD   =  000000 
    F_CONST =  000030     |     F_IFUNC =  000010     |     F_NOT   =  000070 
    F_OR    =  000090     |     F_XOR   =  0000A0     |   4 GET        003553 R
    GET_IDX =  0000B4     |   4 GOSUB      003549 R   |     GOSUB_ID=  000036 
  4 GOTO       003540 R   |     GOTO_IDX=  000038     |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
    GS      =  00001D     |   4 HEX        003538 R   |     HEX_IDX =  00003A 
    HOME    =  000082     |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
    I2C_CCRH=  000080     |     I2C_CCRH=  0000C0     |     I2C_CCRH=  000080 
    I2C_CCRH=  000000     |     I2C_CCRH=  000001     |     I2C_CCRH=  000000 
    I2C_CCRL=  00521B     |     I2C_CCRL=  00001A     |     I2C_CCRL=  000002 
    I2C_CCRL=  00000D     |     I2C_CCRL=  000050     |     I2C_CCRL=  000090 
    I2C_CCRL=  0000A0     |     I2C_CR1 =  005210     |     I2C_CR1_=  000006 
    I2C_CR1_=  000007     |     I2C_CR1_=  000000     |     I2C_CR2 =  005211 
    I2C_CR2_=  000002     |     I2C_CR2_=  000003     |     I2C_CR2_=  000000 
    I2C_CR2_=  000001     |     I2C_CR2_=  000007     |     I2C_DR  =  005216 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 244.
Hexadecimal [24-Bits]

Symbol Table

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
    I2C_TRIS=  00521D     |     I2C_TRIS=  000005     |     I2C_TRIS=  000005 
    I2C_TRIS=  000005     |     I2C_TRIS=  000011     |     I2C_TRIS=  000011 
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   4 IDR        003530 R
    IDR_IDX =  00003C     |   4 IF         003529 R   |     IF_IDX  =  00003E 
    IN      =  000005     |     INCR    =  000001     |     INP     =  000000 
  4 INPUT      00351F R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
    INPUT_FL=  000000     |     INPUT_ID=  000040     |     INPUT_PU=  000001 
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
  4 IWDGEN     003514 R   |     IWDGEN_I=  000042     |   4 IWDGREF    003508 R
    IWDGREF_=  000044     |     IWDG_KEY=  000055     |     IWDG_KEY=  0000CC 
    IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |     KCHAR   =  000002     |   4 KEY        003500 R
    KEY_END =  000083     |     KEY_IDX =  000046     |     KW_TYPE_=  0000F0 
    LAST    =  000003     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000002 
  4 LET        0034F8 R   |     LET_IDX =  000048     |     LF      =  00000A 
    LIMIT   =  000005     |     LINENO  =  000005     |   4 LINES_RE   001F90 R
  4 LINK    =  00369B R   |   4 LIST       0034EF R   |     LIST_IDX=  00004A 
    LL      =  000001     |     LLEN    =  000002     |     LL_HB   =  000001 
    LN_PTR  =  000005     |   4 LOG2       0034E6 R   |     LOG_IDX =  00004C 
    LOOP_CNT=  002710     |   4 LSHIFT     0034DB R   |     LSHIFT_I=  00004E 
    MAJOR   =  000002     |     MASK    =  000002     |     MAX_LINE=  007FFF 
    MINOR   =  000000     |     MULOP   =  000001     |     N1      =  000005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 245.
Hexadecimal [24-Bits]

Symbol Table

    NAFR    =  004804     |     NAK     =  000015     |     NAMEPTR =  000001 
    NAME_MAX=  00000F     |     NCLKOPT =  004808     |     NEG     =  000001 
  4 NEW        0034D3 R   |     NEW_IDX =  000052     |   4 NEXT       0034CA R
    NEXT_IDX=  000050     |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NLEN    =  000001     |     NLEN_MAS=  00000F     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   4 NOT        0034C2 R   |     NOT_IDX =  0000F8 
    NOT_OP  =  000001     |     NUBC    =  004802     |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   4 NonHandl   000000 R   |   4 ODR        0034BA R
    ODR_IDX =  000054     |   4 ON         0034B3 R   |     ONOFF   =  000003 
    ON_IDX  =  0000B2     |     OP      =  000002     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  4 OR         0034AC R   |     OR_IDX  =  0000FC     |     OUTP    =  000001 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVRWR   =  000004     |     PA      =  000000 
  4 PAD        0034A4 R   |     PAD_IDX =  000056     |     PAD_SIZE=  000080 
  4 PAUSE      00349A R   |     PAUSE_ID=  000058     |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  4 PEEK       003491 R   |     PEEK_IDX=  00005C     |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
    PG_ODR  =  00501E     |     PG_SIZE =  000001     |     PH      =  000023 
    PH_BASE =  005023     |     PH_CR1  =  005026     |     PH_CR2  =  005027 
    PH_DDR  =  005025     |     PH_IDR  =  005024     |     PH_ODR  =  005023 
    PI      =  000028     |   4 PICK       003488 R   |     PINNO   =  000001 
  4 PINP       00347F R   |     PINP_IDX=  00005E     |     PINVAL  =  000002 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  4 PMODE      003475 R   |     PMODE_ID=  00005A     |     PNAME   =  000003 
  4 POKE       00346C R   |     POKE_IDX=  000060     |   4 POP        003464 R
  4 PORTA      003447 R   |   4 PORTB      00343D R   |   4 PORTC      003433 R
  4 PORTD      003429 R   |   4 PORTE      00341F R   |   4 PORTF      003415 R
  4 PORTG      00340B R   |   4 PORTI      003401 R   |   4 POUT       00345B R
    POUT_IDX=  000062     |     PREV    =  000001     |     PRG_SIZE=  000003 
  4 PRINT      003451 R   |     PROD    =  000001     |     PROD_SIG=  000004 
  4 PROG_ADD   001EAB R   |   4 PROG_SIZ   001EBD R   |     PRTA_IDX=  000066 
    PRTB_IDX=  000068     |     PRTC_IDX=  00006A     |     PRTD_IDX=  00006C 
    PRTE_IDX=  00006E     |     PRTF_IDX=  000070     |     PRTG_IDX=  000072 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 246.
Hexadecimal [24-Bits]

Symbol Table

    PRTI_IDX=  000074     |     PRT_IDX =  000064     |     PSIZE   =  00000B 
    PSTR    =  000003     |   4 PUSH       0033F8 R   |   4 PUT        0033F0 R
  4 QKEY       0033E7 R   |     QKEY_IDX=  000076     |     QSIGN   =  000005 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |   4 RAM_MEM    001EE6 R
    RAM_SIZE=  001800     |     RBT_IDX =  00007A     |   4 READ       0033DE R
    READ_IDX=  000078     |   4 REBOOT     0033D3 R   |     RECLEN  =  000005 
    REC_LEN =  000003     |     REC_XTRA=  000005     |   4 REG_A      0004DA R
  4 REG_CC     0004DE R   |   4 REG_PC     0004CE R   |   4 REG_SP     0004E3 R
  4 REG_X      0004D6 R   |   4 REG_Y      0004D2 R   |     RELOP   =  000001 
  4 REM        0033CB R   |     REM_IDX =  00007C     |   4 RESTORE    0033BF R
    REST_IDX=  00007E     |     RETL1   =  000001     |   4 RETURN     0033B4 R
    RET_ADDR=  000001     |     RET_BPTR=  000003     |     RET_IDX =  000080 
    RET_INW =  000005     |   4 RND        0033AC R   |     RND_IDX =  000082 
    RONLY   =  000005     |     ROP     =  004800     |     RS      =  00001E 
  4 RSHIFT     0033A1 R   |     RSHIFT_I=  000084     |     RSIGN   =  000006 
    RST_SR  =  0050B3     |   4 RUN        003399 R   |     RUN_IDX =  000086 
    RXCHAR  =  000001     |     RX_QUEUE=  000008     |     R_A     =  000001 
    R_CC    =  000009     |     R_PC    =  00000A     |     R_X     =  000002 
    R_Y     =  000004     |   4 SAVE       003390 R   |     SAVE_IDX=  000032 
    SAV_ACC1=  000006     |     SAV_ACC2=  000008     |     SAV_COUN=  00000A 
    SAV_IN  =  000009     |     SEPARATE=  000000     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |     SI      =  00000F 
    SIGN    =  000001     |   4 SIGNATUR   0029C1 R   |   4 SIZE       003387 R
    SIZE_IDX=  0000B0     |     SKIP    =  000005     |   4 SLEEP      00337D R
    SLEEP_ID=  00008A     |     SO      =  00000E     |     SOH     =  000001 
    SPACE   =  000020     |   4 SPIEN      003373 R   |     SPIEN_ID=  00008E 
  4 SPIRD      003369 R   |     SPIRD_ID=  00008C     |   4 SPISEL     00335E R
    SPISEL_I=  000090     |   4 SPIWR      003354 R   |     SPIWR_ID=  000092 
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
  4 STEP       00334B R   |     STEP_IDX=  000094     |   4 STOP       003342 R
    STOP_IDX=  000096     |     STR     =  000003     |   4 STR_BYTE   001ECE R
    STX     =  000002     |     SUB     =  00001A     |     SUP     =  000084 
    SWIM_CSR=  007F80     |     SYN     =  000016     |   4 SysCall    000012 R
    T       =  000001     |     TAB     =  000009     |     TABW    =  000004 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   4 TICKS      003338 R
    TICKS_ID=  000098     |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
    TIM1_BKR=  00526D     |     TIM1_CCE=  00525C     |     TIM1_CCE=  00525D 
    TIM1_CCM=  005258     |     TIM1_CCM=  000000     |     TIM1_CCM=  000001 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000003 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000003 
    TIM1_CCM=  005259     |     TIM1_CCM=  000000     |     TIM1_CCM=  000001 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 247.
Hexadecimal [24-Bits]

Symbol Table

    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000003 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000003 
    TIM1_CCM=  00525A     |     TIM1_CCM=  000000     |     TIM1_CCM=  000001 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000003 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000004 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 248.
Hexadecimal [24-Bits]

Symbol Table

    TIM3_CCR=  00532F     |     TIM3_CCR=  005330     |     TIM3_CNT=  005328 
    TIM3_CNT=  005329     |     TIM3_CR1=  005320     |     TIM3_CR1=  000007 
    TIM3_CR1=  000000     |     TIM3_CR1=  000003     |     TIM3_CR1=  000001 
    TIM3_CR1=  000002     |     TIM3_EGR=  005324     |     TIM3_IER=  005321 
    TIM3_PSC=  00532A     |     TIM3_SR1=  005322     |     TIM3_SR2=  005323 
    TIM4_ARR=  005346     |     TIM4_CNT=  005344     |     TIM4_CR1=  005340 
    TIM4_CR1=  000007     |     TIM4_CR1=  000000     |     TIM4_CR1=  000003 
    TIM4_CR1=  000001     |     TIM4_CR1=  000002     |     TIM4_EGR=  005343 
    TIM4_EGR=  000000     |     TIM4_IER=  005341     |     TIM4_IER=  000000 
    TIM4_PSC=  005345     |     TIM4_PSC=  000000     |     TIM4_PSC=  000007 
    TIM4_PSC=  000004     |     TIM4_PSC=  000001     |     TIM4_PSC=  000005 
    TIM4_PSC=  000002     |     TIM4_PSC=  000006     |     TIM4_PSC=  000003 
    TIM4_PSC=  000000     |     TIM4_PSC=  000001     |     TIM4_PSC=  000002 
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   4 TIMEOUT    00332C R
  4 TIMER      003322 R   |     TIMER_ID=  00009A     |     TIM_CR1_=  000007 
    TIM_CR1_=  000000     |     TIM_CR1_=  000006     |     TIM_CR1_=  000005 
    TIM_CR1_=  000004     |     TIM_CR1_=  000003     |     TIM_CR1_=  000001 
    TIM_CR1_=  000002     |     TK_AND  =  000088     |     TK_ARRAY=  000005 
    TK_CFUNC=  000082     |     TK_CHAR =  000004     |     TK_CMD  =  000080 
    TK_COLON=  00000A     |     TK_COMMA=  000008     |     TK_CONST=  000083 
    TK_DIV  =  000021     |     TK_EQUAL=  000032     |     TK_FLOAT=  000086 
    TK_GE   =  000033     |     TK_GRP_A=  000010     |     TK_GRP_M=  000030 
    TK_GRP_M=  000000     |     TK_GRP_M=  000020     |     TK_GRP_R=  000030 
    TK_GT   =  000031     |     TK_IFUNC=  000081     |     TK_INTGR=  000084 
    TK_LABEL=  000003     |     TK_LE   =  000036     |     TK_LPARE=  000006 
    TK_LT   =  000034     |     TK_MINUS=  000011     |     TK_MOD  =  000022 
    TK_MULT =  000020     |     TK_NE   =  000035     |     TK_NONE =  000000 
    TK_NOT  =  000087     |     TK_OR   =  000089     |     TK_PLUS =  000010 
    TK_QSTR =  000002     |     TK_RPARE=  000007     |     TK_SHARP=  000009 
    TK_VAR  =  000085     |     TK_XOR  =  00008A     |     TMROUT_I=  00009C 
  4 TO         00331B R   |   4 TONE       003312 R   |     TONE_IDX=  0000A0 
    TOWRITE =  000005     |     TO_IDX  =  00009E     |   4 Timer4Up   000013 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 249.
Hexadecimal [24-Bits]

Symbol Table

    UART_CR5=  000003     |     UART_CR5=  000001     |     UART_CR5=  000002 
    UART_CR5=  000004     |     UART_CR5=  000005     |     UART_CR6=  000009 
    UART_CR6=  000004     |     UART_CR6=  000007     |     UART_CR6=  000001 
    UART_CR6=  000002     |     UART_CR6=  000000     |     UART_CR6=  000005 
    UART_DR =  000001     |     UART_GTR=  000009     |     UART_PSC=  00000A 
    UART_SR =  000000     |     UART_SR_=  000001     |     UART_SR_=  000004 
    UART_SR_=  000002     |     UART_SR_=  000003     |     UART_SR_=  000000 
    UART_SR_=  000005     |     UART_SR_=  000006     |     UART_SR_=  000007 
    UBC     =  004801     |   4 UBOUND     003307 R   |     UBOUND_I=  0000A2 
  4 UBTN_Han   00005A R   |   4 UFLASH     0032FC R   |     UFLASH_I=  0000A4 
  4 UNTIL      0032F2 R   |     UNTIL_ID=  0000A6     |     US      =  00001F 
  4 USER_ABO   000062 R   |   4 USR        0032EA R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |     USR_IDX =  0000A8 
  4 Uart1RxH   00087C R   |   4 UserButt   000036 R   |     VAL1    =  02FFFF 
    VAL2    =  00002A     |     VAL3    =  000003     |     VAL4    =  0005FF 
    VAL5    =  FFFFFFFD     |     VAR_NAME=  000001     |     VSIZE   =  000008 
    VT      =  00000B     |   4 WAIT       0032E1 R   |     WAIT_IDX=  0000AA 
    WCNT    =  000003     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH_SA=  000002     |     WLEN    =  000001     |     WLKPTR  =  000001 
  4 WORDS      0032D7 R   |     WORDS_ID=  0000AC     |   4 WRITE      0032CD R
    WRITE_ID=  0000AE     |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XFIRST  =  000001     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   4 XOR        0032C5 R   |     XOR_IDX =  0000FE 
    XSAVE   =  000002     |     XSTACK_E=  001773     |     XSTACK_S=  000014 
    XTEMP   =  000001     |     YSAVE   =  000007     |     YTEMP   =  000005 
  4 abs        002BDC R   |   4 abs24      0001F3 R   |   5 acc16      00000D GR
  5 acc24      00000C GR  |   5 acc32      00000B GR  |   5 acc8       00000E GR
  4 accept_c   000BC7 R   |   4 add24      00017E R   |   4 add_char   001345 R
  4 add_spac   00113D R   |   4 analog_r   0026C5 R   |   4 and_cond   001BF3 R
  4 and_fact   001BC3 R   |   4 app        003884 R   |   4 app_sign   003880 R
  4 app_size   003882 R   |   4 app_spac   003880 GR  |   4 arduino_   002CC9 R
  4 arg_list   0019EA R   |   5 array_si   000020 R   |   4 ascii      002AB7 R
  4 at_tst     000FAF R   |   4 atoi24     0018F6 GR  |   4 atoi_exi   001965 R
  4 awu        002B83 R   |   4 awu02      002B96 R   |   5 base       00000A GR
  5 basicptr   000004 GR  |   4 beep       00263C R   |   4 beep_1kh   00260F GR
  4 bin_exit   000E16 R   |   4 bit_rese   0021CB R   |   4 bit_set    0021A9 R
  4 bit_test   002210 R   |   4 bit_togg   0021EE R   |   4 bitmask    002E83 R
  4 bkslsh_t   000F5C R   |   4 bksp       000966 R   |   2 block_bu   0016B8 GR
  4 block_er   000765 R   |   4 break_po   0027B0 R   |   4 bye        002B4F R
  5 chain_le   000034 R   |   4 clear_au   0008B3 R   |   4 clear_ba   0014B1 R
  4 clear_bl   0028C1 R   |   4 clear_va   001409 R   |   4 clock_in   00007D R
  4 cmd_auto   0031A8 R   |   4 cmd_chai   00323B R   |   4 cmd_cons   001DC8 R
  4 cmd_dim    001DD5 R   |   4 cmd_dim1   001DD8 R   |   4 cmd_dim2   001DDE R
  4 cmd_dir    0029E8 R   |   4 cmd_edit   001FB9 R   |   4 cmd_end    0025B6 R
  4 cmd_eras   00282E R   |   4 cmd_get    0025E2 R   |   4 cmd_itf    0004FE R
  4 cmd_line   001734 R   |   4 cmd_line   0019C2 R   |   4 cmd_list   001EF5 R
  4 cmd_name   001365 R   |   4 cmd_on     002445 R   |   4 cmd_run    002526 R
  4 cmd_save   002923 R   |   4 cmd_size   001CCC R   |   4 cold_sta   0000B5 R
  4 colon_ts   000F83 R   |   4 comma_ts   000F8E R   |   4 comp_msg   001684 R
  4 compile    0010A9 GR  |   4 conditio   001C45 R   |   4 const_cr   002F26 R
  4 const_cr   002F2B R   |   4 const_dd   002F21 R   |   4 const_ee   002F3A R
  4 const_id   002F1C R   |   4 const_in   002F35 R   |   4 const_od   002F17 R
  4 const_ou   002F30 R   |   4 const_po   002EEF R   |   4 const_po   002EF4 R
  4 const_po   002EF9 R   |   4 const_po   002EFE R   |   4 const_po   002F03 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 250.
Hexadecimal [24-Bits]

Symbol Table

  4 const_po   002F08 R   |   4 const_po   002F0D R   |   4 const_po   002F12 R
  4 convert_   000D82 R   |   4 convert_   00092A R   |   4 copy_com   000FE4 R
  5 count      000002 GR  |   4 cp24       0001B8 R   |   4 cp24_ax    0001EA R
  4 cp_loop    001985 R   |   4 cpl24      0001FA R   |   4 cpy_cmd_   001125 R
  4 cpy_quot   001165 R   |   4 cs_high    0030C2 R   |   4 dash_tst   000FA4 R
  4 data       002F3F R   |   4 data_err   002FBB R   |   5 data_len   000009 R
  5 data_ofs   000008 R   |   5 data_ptr   000006 R   |   4 dec_base   001CBE R
  4 decomp_l   0011FD R   |   4 decompil   0011B5 GR  |   4 del_line   000C70 R
  4 delete_l   000A53 R   |   4 delete_n   000976 R   |   4 delete_u   000A18 R
  4 digital_   002701 R   |   4 digital_   002738 R   |   4 div24      000307 R
  4 divu24_8   0002E9 R   |   4 do_loop    002EA9 R   |   4 do_progr   000758 R
  4 dup24      00016F R   |   5 dvar_bgn   000030 GR  |   5 dvar_end   000032 GR
  4 enable_i   002E13 R   |   4 end_at_l   001F3F R   |   4 eql_tst    00102F R
  4 equal      001358 R   |   4 erase_ex   000789 R   |   4 erase_fl   00077F R
  4 erase_he   002909 R   |   4 erase_pr   0027D9 R   |   4 err_bad_   0015AD R
  4 err_buf_   001623 R   |   4 err_cmd_   001571 R   |   4 err_div0   001536 R
  4 err_dupl   00158B R   |   4 err_math   00151D R   |   4 err_mem_   0014F8 R
  4 err_msg    0014D2 R   |   4 err_no_a   0015B9 R   |   4 err_no_d   0015EC R
  4 err_no_f   001610 R   |   4 err_no_l   001545 R   |   4 err_no_p   0015FC R
  4 err_not_   00159C R   |   4 err_not_   001656 R   |   4 err_over   001630 R
  4 err_read   00163A R   |   4 err_run_   00155B R   |   4 err_synt   00150F R
  4 escaped    000D97 GR  |   4 expect     0019D8 R   |   4 expressi   001B2C R
  4 factor     001A34 R   |   5 farptr     000018 R   |   4 fcpu       002C4B R
  4 fetchc     000605 R   |   4 fill_wri   0028B1 R   |   4 final_te   000BC0 R
  5 flags      000022 GR  |   4 for        0022A6 R   |   4 free       001CC3 R
  5 free_eep   000024 R   |   7 free_ram   000090 R   |   4 func_arg   0019E5 R
  4 func_cha   002AA0 R   |   4 func_eef   001D58 R   |   4 ge         00135A R
  4 get_addr   001834 R   |   4 get_arra   001A06 R   |   4 get_char   00184E R
  4 get_esca   000936 R   |   4 get_int2   00183E R   |   4 get_targ   0023D3 R
  4 get_targ   0023E1 R   |   4 get_tick   002BD5 R   |   4 get_toke   000EF5 GR
  4 get_valu   001D47 R   |   4 getc       00090F GR  |   4 gosub      0024E3 R
  4 gosub_1    0024E6 R   |   4 gosub_2    0024EC R   |   4 goto       0024D0 R
  4 goto_1     0024D3 R   |   4 gt         001356 R   |   4 gt_tst     00103A R
  4 hex_base   001CB9 R   |   4 hex_dump   000645 R   |   4 if         002289 R
  5 in         000001 GR  |   5 in.saved   000003 GR  |   5 in.w       000000 GR
  4 incr_far   000860 R   |   4 input_ex   002161 R   |   4 input_lo   0020CB R
  4 input_va   0020C7 R   |   4 insert_c   0009D5 R   |   4 insert_l   000CDC R
  4 interp_l   001778 R   |   4 interpre   001750 R   |   4 invalid    00056D R
  4 invalid_   0005DB R   |   4 is_alnum   000E49 GR  |   4 is_alpha   000E2F GR
  4 is_data_   002F45 R   |   4 is_digit   000E40 GR  |   4 is_erase   0029C5 R
  4 is_minus   001F14 R   |   4 is_progr   002515 R   |   4 is_symbo   000E52 R
  4 itoa       001891 GR  |   4 itoa_loo   0018B3 R   |   4 jp_to_ta   0024D6 R
  4 key        002AF6 R   |   4 kword_di   003699 GR  |   4 kword_en   0032C3 R
  4 le         00135F R   |   4 ledoff     0003CD R   |   4 ledon      0003C8 R
  4 ledtoggl   0003D2 R   |   4 left_par   0003DB R   |   4 let        001D04 GR
  4 let_arra   001D12 R   |   4 let_dvar   0017B1 R   |   4 let_eval   001D1A R
  4 let_var    001D17 R   |   4 lines_sk   001F24 R   |   4 list_exi   001F74 R
  4 list_loo   001F52 R   |   4 log2       002E56 R   |   4 look_tar   002404 R
  4 loop_bac   0023B6 R   |   5 loop_dep   00001F R   |   4 loop_don   0023CB R
  4 lshift     002BF3 R   |   4 lt         00135D R   |   4 lt_tst     001063 R
  4 mem_peek   000589 R   |   4 mod24      0003A1 R   |   4 move       0013C5 GR
  4 move_dow   0013E4 R   |   4 move_era   0006E7 R   |   4 move_exi   001405 R
  4 move_lef   0009AD R   |   4 move_loo   0013E9 R   |   4 move_prg   000727 R
  4 move_rig   0009BB R   |   4 move_up    0013D6 R   |   4 mul24      000279 R
  4 mul_char   001347 R   |   4 mulu24_8   00023A R   |   4 nbr_tst    000F28 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 251.
Hexadecimal [24-Bits]

Symbol Table

  4 ne         001362 R   |   4 neg24      000203 R   |   4 neg_acc2   00021D R
  4 neg_ax     000215 R   |   4 new        0027CE R   |   4 next       00235E R
  4 next_lin   001758 R   |   4 next_tok   00180C GR  |   4 no_match   001997 R
  4 number     00060B R   |   4 open_gap   000CA5 R   |   4 other      00108C R
  4 overwrit   000BEC R   |   2 pad        0016B8 GR  |   4 pad_ref    0030C7 R
  4 parse_ad   0004E8 R   |   4 parse_bi   000DF4 R   |   4 parse_in   000D9F R
  4 parse_ke   000E75 R   |   4 parse_qu   000D4A R   |   4 parse_sy   000E5D R
  4 pause      002B63 R   |   4 pause02    002B76 R   |   4 peek       002268 R
  4 peek_byt   0005A5 R   |   4 pin_mode   002C5A R   |   4 plus_tst   001003 R
  4 poke       002247 R   |   4 power_ad   002675 R   |   4 prcnt_ts   001024 R
  4 print      00201E R   |   4 print_fa   0005EA R   |   4 print_he   000C23 GR
  4 print_re   000427 R   |   4 print_st   00057D R   |   4 print_to   001879 R
  4 prog_siz   001E64 R   |   4 program_   001E6C R   |   4 program_   000701 R
  4 program_   000727 R   |   4 prt_acc2   00186B R   |   4 prt_basi   001FFA R
  4 prt_i16    001854 R   |   4 prt_loop   002022 R   |   4 prt_peek   0003AA GR
  4 prt_reg1   000408 R   |   4 prt_reg8   0003E6 R   |   5 ptr16      000019 GR
  5 ptr8       00001A R   |   4 putc       0008FF GR  |   4 puts       00095C GR
  4 qgetc      000908 GR  |   4 qkey       002AFA GR  |   4 qmark_ts   000FBA R
  4 qsign      0028A6 R   |   4 random     002CE9 R   |   4 read       002FC0 R
  4 read01     002FC8 R   |   4 read_int   003810 R   |   4 readln     000A61 GR
  4 readln_l   000A70 R   |   4 readln_q   000C09 R   |   4 refresh_   002E51 R
  4 relation   001B64 R   |   4 relop_st   00134A R   |   4 remark     002166 GR
  4 repl       000527 R   |   4 repl_exi   00054F R   |   4 reset_co   002020 R
  4 rest_con   0020B7 R   |   4 restore    002F53 R   |   4 return     0024FF R
  4 right_al   001153 GR  |   4 row_alig   000845 R   |   4 row_eras   0006BA R
  4 row_eras   0006E7 R   |   4 row_loop   000628 R   |   4 rparnt_t   000F78 R
  4 rshift     002C1F R   |   7 rsign      00008C R   |   7 rsize      00008E R
  4 rt_msg     001672 R   |   4 run_app    00012A R   |   4 run_it     002583 R
  4 run_it_0   002585 R   |   4 runtime_   0019CD R   |   5 rx1_head   00002E R
  5 rx1_queu   000026 R   |   5 rx1_tail   00002F R   |   4 save_con   0020A7 R
  4 scan_blo   00086E R   |   4 search_d   001977 GR  |   4 search_e   0019BF R
  4 search_f   0028D5 R   |   4 search_l   000C45 GR  |   4 search_l   000C54 R
  4 search_n   001D81 R   |   4 search_n   00197B R   |   4 search_p   003201 R
  5 seedx      000014 R   |   5 seedy      000016 R   |   4 select_p   002CB9 R
  4 send_esc   000984 R   |   4 send_par   00098F R   |   4 set_data   002F8C R
  4 set_time   002DF1 R   |   4 sharp_ts   000F99 R   |   4 show_row   000616 R
  4 single_c   001340 R   |   4 skip       000EE2 R   |   4 skip_str   001825 R
  4 skip_to_   0029D0 R   |   4 slash_ts   001019 R   |   4 sleep      002B58 R
  4 software   001418 R   |   4 spaces     0009C9 GR  |   4 spi_clea   00305C R
  4 spi_disa   003044 R   |   4 spi_enab   003011 R   |   4 spi_rcv_   00307E R
  4 spi_read   0030A9 R   |   4 spi_sele   0030B0 R   |   4 spi_send   003068 R
  4 spi_writ   003089 R   |   2 stack_fu   001774 GR  |   2 stack_un   001800 R
  4 star_tst   00100E R   |   4 start_fr   001F1F R   |   4 step       00231C R
  4 stop       002783 R   |   4 store_lo   00234B R   |   4 str_matc   0019A4 R
  4 str_tst    000F18 R   |   4 strcmp     0013A4 R   |   4 strcpy     0013B5 GR
  4 strlen     001399 GR  |   4 sub24      00019B R   |   4 symb_loo   000E5E R
  4 syntax_e   0016A5 GR  |   4 system_i   00145E R   |   5 tab_widt   000023 GR
  4 tb_error   0016A7 GR  |   4 term       001AE9 R   |   4 term01     001AF1 R
  4 term_exi   001B29 R   |   4 test       0036A1 R   |   4 test_p     000575 R
  2 tib        001668 GR  |   4 tick_tst   000FD2 R   |   5 ticks      00000F R
  4 timeout    002E08 R   |   5 timer      000012 GR  |   4 timer2_i   000093 R
  4 timer4_i   0000A0 R   |   4 tk_id      001695 R   |   4 to         0022D6 R
  4 to_eepro   000750 R   |   4 to_flash   000755 R   |   4 to_hex_c   000C3A GR
  4 to_upper   0018EA GR  |   4 token_ch   0010A2 R   |   4 token_ex   0010A6 R
  4 tone       00261A R   |   4 try_next   002F99 R   |   5 txtbgn     00001B GR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 252.
Hexadecimal [24-Bits]

Symbol Table

  5 txtend     00001D GR  |   4 uart1_ge   00090F GR  |   4 uart1_in   0008BA R
  4 uart1_pu   0008FF GR  |   4 uart1_qg   000908 GR  |   4 uart1_se   0008CA R
  4 ubound     001CF9 R   |   4 uflash     002B07 R   |   4 unlock_e   000684 R
  4 unlock_f   00069F R   |   4 until      002EBC R   |   4 user_int   000049 R
  4 usr        002B29 R   |   4 var_name   0011AB GR  |   5 vars       000035 GR
  4 wait       00216C R   |   4 warm_ini   00148F R   |   4 warm_sta   001731 R
  4 words      002D84 R   |   4 words_co   002DDB R   |   4 write      002A37 R
  4 write_bl   00080A GR  |   4 write_bu   000741 R   |   4 write_by   00078B R
  4 write_ee   0007C7 R   |   4 write_ex   000800 R   |   4 write_fl   0007B1 R
  4 write_nb   00082F R   |   4 xalloc     0030DA R   |   4 xdrop      003110 R
  4 xpick      00318E R   |   4 xpop       0030D0 R   |   4 xpush      0030CC R
  4 xput       00315B R   |   4 xstack_b   00313D R   |   2 xstack_f   001738 GR
  2 xstack_u   001774 GR

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 253.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 SSEG       size      0   flags    8
   2 SSEG0      size    198   flags    8
   3 HOME       size     80   flags    0
   4 CODE       size   3884   flags    0
   5 DATA       size     83   flags    0
   6 BTXT       size      0   flags    8
   7 BTXT1      size      4   flags    8

