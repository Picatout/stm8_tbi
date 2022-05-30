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
      008050 82 00 89 1E             79 	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
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
      008096 CD 85 11         [ 4]  120 	call print_registers
      008099 CD 85 BC         [ 4]  121 	call cmd_itf
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
      0080E5 CD 89 ED         [ 4]  174 	call puts 
      0080E8                        175 UBTN_Handler_exit:
      0080E8 AE 17 FF         [ 2]  176     ldw x,#STACK_EMPTY 
      0080EB 94               [ 1]  177     ldw sp,x
      0080EC 9A               [ 1]  178 	rim 
      0080ED CC 97 7A         [ 2]  179 5$:	jp warm_start
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
      00818E CD 89 4B         [ 4]  273 	call uart1_init
                                    274 ; activate PE_4 (user button interrupt)
      008191 72 18 50 18      [ 1]  275     bset PE_CR2,#USR_BTN_BIT 
                                    276 ; display system information
      008195 9A               [ 1]  277 	rim ; enable interrupts 
      008196 72 5C 00 18      [ 1]  278 	inc seedy+1 
      00819A 72 5C 00 16      [ 1]  279 	inc seedx+1 
      00819E CD 9D 9A         [ 4]  280 	call func_eefree 
      0081A1 CD 9C D1         [ 4]  281 	call ubound 
      0081A4 CD 95 4A         [ 4]  282 	call clear_basic
      0081A7 CD A5 E4         [ 4]  283 	call beep_1khz  
      0081AA CD 94 F7         [ 4]  284 	call system_information
      0081AD                        285 2$:	
                                    286 ; check for application in flash memory 
      0081AD CD A8 1F         [ 4]  287 	call qsign 
      0081B0 27 03            [ 1]  288 	jreq run_app
      0081B2 CC 97 7A         [ 2]  289 	jp warm_start 
      0081B5                        290 run_app:
                                    291 ; run application in FLASH|EEPROM 
      0081B5 90 CE 17 73      [ 2]  292 	ldw y,XSTACK_EMPTY
      0081B9 CD 95 28         [ 4]  293 	call warm_init
      0081BC AE B6 04         [ 2]  294 	ldw x,#app 
      0081BF CF 00 1C         [ 2]  295 	ldw txtbgn,x
      0081C2 72 BB B6 02      [ 2]  296 	addw x,app_size 
      0081C6 CF 00 1E         [ 2]  297 	ldw txtend,x 
      0081C9 AE 81 D7         [ 2]  298 	ldw x,#AUTO_RUN 
      0081CC CD 89 ED         [ 4]  299 	call puts 
      0081CF CD 9E C2         [ 4]  300 	call program_info 
      0081D2 CC A5 88         [ 2]  301 	jp run_it_02  
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
                                    157 ;	xstack	    uint24_t 
                                    158 ;   a	        uint8_t
                                    159 ; output:
                                    160 ;   A:X     product 
                                    161 ;   acc32   overflow, bits 31..24 
                                    162 ;-------------------------------------
                                    163 ; local variables offset  on sp
                           000001   164 	U8   = 1 
                           000001   165     VSIZE=1 
      000226                        166 mulu24_8:
      008281 43               [ 1]  167     push a 
      008282 53 1C 00 01      [ 1]  168 	clr acc32
      008286 A9 00 81 0C      [ 1]  169     clr acc24  
                                    170 ; multiply top bits 7..0 * U8   	
      008289 90 E6 02         [ 1]  171     ld a,(2,Y) ; top least byte  
      008289 72               [ 1]  172     ld xl,a 
      00828A 53 00            [ 1]  173     ld a,(U8,sp)
      00828C 0D               [ 4]  174     mul x,a 
      00828D 72 53 00         [ 2]  175     ldw acc16,x 
                                    176 ; multiply top bits 15..8 * U8     
      008290 0E 72 53         [ 1]  177     ld a,(1,Y) ; top middle byte 
      008293 00               [ 1]  178     ld xl,a 
      008294 0F 72            [ 1]  179     ld a,(U8,sp) 
      008296 5C               [ 4]  180     mul x,a 
      008297 00 0F 26 0A      [ 2]  181     addw x,acc24
      00829B 72 5C 00 0E      [ 1]  182     rlc acc32 
      00829F 26 04 72         [ 2]  183     ldw acc24,x 
                                    184 ; multiply top bits 23..16 * 8 
      0082A2 5C 00            [ 1]  185     ld a,(Y)
      0082A4 0D               [ 1]  186     ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      0082A5 81 01            [ 1]  187     ld a,(U8,sp)
      0082A6 42               [ 4]  188     mul x,a 
      0082A6 88 72 5F 00      [ 2]  189     addw x,acc32
      0082AA 0C               [ 1]  190     rlwa x 
      0082AB 72               [ 1]  191     tnz a 
      0082AC 5F 00            [ 1]  192     jreq 1$
      0082AE 0D 90            [ 1]  193     ld a,#ERR_OVERFLOW
      0082B0 E6 02 97         [ 2]  194     jp tb_error 
      00025E                        195 1$:
      0082B3 7B               [ 1]  196     ld a,xh  
      0082B4 01 42 CF         [ 2]  197     ldw x,acc16   
      000262                        198     _drop VSIZE 
      0082B7 00 0E            [ 2]    1     addw sp,#VSIZE 
      0082B9 90               [ 4]  199     ret
                                    200 
                                    201 
                                    202 ;-------------------------------
                                    203 ; mul24 i1 i2 -- i1*i2  
                                    204 ; multiply 24 bits integers 
                                    205 ;------------------------------
                           000001   206     PROD=1 
                           000004   207     PROD_SIGN=4
                           000005   208     N1=5
                           000007   209     VSIZE=7  
      000265                        210 mul24:
      000265                        211     _vars VSIZE
      0082BA E6 01            [ 2]    1     sub sp,#VSIZE 
      0082BC 97               [ 1]  212     clrw x 
      0082BD 7B 01            [ 2]  213     ldw (PROD,sp),x 
      0082BF 42 72            [ 2]  214     ldw (PROD+2,sp),x
      00026C                        215     _xpop 
      0082C1 BB 00            [ 1]    1     ld a,(y)
      0082C3 0D               [ 1]    2     ldw x,y 
      0082C4 72 59            [ 2]    3     ldw x,(1,x)
      0082C6 00 0C CF 00      [ 2]    4     addw y,#CELL_SIZE 
      0082CA 0D               [ 1]  216     tnz a 
      0082CB 90 F6            [ 1]  217     jrpl 0$
      0082CD 97 7B            [ 1]  218     cpl (PROD_SIGN,sp)
      0082CF 01 42 72         [ 4]  219     call neg_ax 
      00027D                        220 0$:    
      0082D2 BB 00            [ 1]  221     ld (N1,sp),a 
      0082D4 0C 02            [ 2]  222     ldw (N1+1,sp),x
      0082D6 4D 27            [ 1]  223     tnz (Y)
      0082D8 05 A6            [ 1]  224     jrpl 2$ 
      0082DA 10 CC            [ 1]  225     cpl (PROD_SIGN,sp) 
      0082DC 96 F0 EF         [ 4]  226     call neg24
      0082DE                        227 2$: 
      0082DE 9E CE            [ 1]  228     ld a,(N1+2,sp); least byte     
      0082E0 00 0E            [ 1]  229     jreq 4$
      0082E2 5B 01 81         [ 4]  230     call mulu24_8
      0082E5 4D               [ 1]  231     tnz a 
      0082E5 52 07            [ 1]  232     jrmi 8$ ; overflow  
      0082E7 5F 1F            [ 1]  233     ld (PROD,sp),a
      0082E9 01 1F            [ 2]  234     ldw (PROD+1,sp),x 
      000298                        235 4$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      0082EB 03 90            [ 1]  236     ld a,(N1+1,sp); middle byte     
      0082ED F6 93            [ 1]  237     jreq 5$
      0082EF EE 01 72         [ 4]  238     call mulu24_8
      0082F2 A9               [ 1]  239     tnz a 
      0082F3 00 03            [ 1]  240     jrne 8$  ; overflow 
      0082F5 4D 2A 05         [ 2]  241     addw x,(PROD,sp)
      0082F8 03 04            [ 1]  242     jrv 8$ ; overflow
      0082FA CD 82            [ 2]  243     ldw (PROD,sp),x 
      0002A9                        244 5$:
      0082FC 81 05            [ 1]  245     ld a,(N1,sp) ; high byte 
      0082FD 27 10            [ 1]  246     jreq 6$
      0082FD 6B 05 1F         [ 4]  247     call mulu24_8
      008300 06               [ 1]  248     rrwa x 
      008301 90               [ 2]  249     tnzw x 
      008302 7D 2A            [ 1]  250     jrne 8$ ; overflow 
      008304 05               [ 1]  251     tnz a 
      008305 03 04            [ 1]  252     jrmi 8$ ; overflow 
      008307 CD 82            [ 1]  253     add a,(PROD,sp)
      008309 6F 01            [ 1]  254     ld (PROD,sp),a 
      00830A 29 13            [ 1]  255     jrv 8$ ; overflow 
      0002BD                        256 6$:
      00830A 7B 07            [ 1]  257     ld a,(PROD,sp)
      00830C 27 0A            [ 2]  258     ldw x,(PROD+1,sp)
      00830E CD 82            [ 1]  259     tnz (PROD_SIGN,sp)
      008310 A6 4D            [ 1]  260     jreq 9$
      008312 2B 3C 6B         [ 4]  261     call neg_ax 
      0002C8                        262 9$:
      0002C8                        263     _store_top 
      008315 01 1F            [ 1]    1     ld (y),a 
      008317 02 EF 01         [ 2]    2     ldw (1,y),x     
      008318                        264     _drop VSIZE 
      008318 7B 06            [ 2]    1     addw sp,#VSIZE 
      00831A 27               [ 4]  265     ret 
      0002D0                        266 8$: ; overflow
      00831B 0D CD            [ 1]  267     ld a,#ERR_OVERFLOW
      00831D 82 A6 4D         [ 2]  268     jp tb_error 
                                    269 
                                    270 ;-------------------------------------
                                    271 ; divide uint24_t by uint8_t
                                    272 ; input:
                                    273 ;	acc24	dividend
                                    274 ;   A 		divisor
                                    275 ; output:
                                    276 ;   acc24	quotient
                                    277 ;   A		remainder
                                    278 ;------------------------------------- 
                                    279 ; offset  on sp of arguments and locals
                           000001   280 	U8   = 1   ; divisor on stack
                           000001   281 	VSIZE =1
      0002D5                        282 divu24_8:
      008320 26               [ 2]  283 	pushw x ; save x
      008321 2E               [ 1]  284 	push a 
                                    285 	; ld dividend UU:MM bytes in X
      008322 72 FB 01         [ 2]  286 	ldw x,acc24
      008325 29 29            [ 1]  287 	ld a,(U8,SP) ; divisor
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008327 1F               [ 2]  288 	div x,a ; UU:MM/U8
      008328 01               [ 1]  289 	push a  ;save remainder
      008329 CF 00 0C         [ 2]  290     ldw acc24,x ; quotient 
      008329 7B               [ 1]  291 	pop a
      00832A 05               [ 1]  292 	ld xh,a
      00832B 27 10 CD         [ 1]  293 	ld a,acc8
      00832E 82               [ 1]  294 	ld xl,a
      00832F A6 01            [ 1]  295 	ld a,(U8,sp) ; divisor
      008331 5D               [ 2]  296 	div x,a  ; R:LL/U8
      008332 26 1C            [ 1]  297 	ld (U8,sp),a ; save remainder
      008334 4D               [ 1]  298 	ld a,xl
      008335 2B 19 1B         [ 1]  299 	ld acc8,a
      008338 01               [ 1]  300 	pop a
      008339 6B               [ 2]  301 	popw x
      00833A 01               [ 4]  302 	ret
                                    303 
                                    304 
                                    305 ;-------------------------------
                                    306 ; div24 N/T   
                                    307 ; divide 24 bits integers
                                    308 ;  i1 i2 -- i1/i2 
                                    309 ;------------------------------
                           000001   310     DIVISOR=1
                           000004   311     CNTR=4
                           000005   312     QSIGN=5
                           000006   313     RSIGN=6 
                           000006   314     VSIZE=6 
      0002F3                        315 div24:
      0002F3                        316     _vars VSIZE 
      00833B 29 13            [ 2]    1     sub sp,#VSIZE 
      00833D 0F 06            [ 1]  317     clr (RSIGN,sp)
      00833D 7B 01            [ 1]  318     clr (QSIGN,sp)
      0002F9                        319     _xpop 
      00833F 1E 02            [ 1]    1     ld a,(y)
      008341 0D               [ 1]    2     ldw x,y 
      008342 04 27            [ 2]    3     ldw x,(1,x)
      008344 03 CD 82 81      [ 2]    4     addw y,#CELL_SIZE 
      008348 4D               [ 1]  320     tnz a 
      008348 90 F7            [ 1]  321     jrpl 0$ 
      00834A 90 EF            [ 1]  322     cpl (QSIGN,sp)
      00834C 01 5B 07         [ 4]  323     call neg_ax
      00030A                        324 0$:
      00834F 81 01            [ 1]  325     ld  (DIVISOR,sp),a
      008350 1F 02            [ 2]  326     ldw (DIVISOR+1,sp),x
      008350 A6 10            [ 1]  327     or a,(DIVISOR+1,sp)
      008352 CC 96            [ 1]  328     or a,(DIVISOR+2,sp)
      008354 F0 05            [ 1]  329     jrne 1$ 
      008355 A6 04            [ 1]  330     ld a,#ERR_DIV0 
      008355 89 88 CE         [ 2]  331     jp tb_error 
      000319                        332 1$: 
      000319                        333     _at_top
      008358 00 0D            [ 1]    1     ld a,(y)
      00835A 7B               [ 1]    2     ldw x,y 
      00835B 01 62            [ 2]    3     ldw x,(1,x)
      00835D 88               [ 1]  334     tnz a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      00835E CF 00            [ 1]  335     jrpl 2$
      008360 0D 84 95         [ 4]  336     call neg_ax
      008363 C6 00            [ 1]  337     cpl (QSIGN,sp)
      008365 0F 97            [ 1]  338     cpl (RSIGN,sp)
      000328                        339 2$: 
      008367 7B 01 62         [ 1]  340     ld acc24,a 
      00836A 6B 01 9F         [ 2]  341     ldw acc16,x 
      00836D C7 00            [ 1]  342     ld a,#24 
      00836F 0F 84            [ 1]  343     ld (CNTR,sp),a
      008371 85 81            [ 1]  344     ld a,(DIVISOR,sp)
      008373 1E 02            [ 2]  345     ldw x,(DIVISOR+1,sp)
      008373 52 06 0F         [ 4]  346     call cp24_ax ; A:X-acc24 ?
      008376 06 0F            [ 2]  347     jrule 22$ 
                                    348 ; quotient=0, remainder=divisor      
      008378 05 90 F6         [ 1]  349     ld a,acc24 
      00837B 93 EE 01         [ 2]  350     ldw x,acc16 
      00837E 72 A9 00 03      [ 1]  351     clr acc24 
      008382 4D 2A 05 03      [ 1]  352     clr acc16 
      008386 05 CD 82 81      [ 1]  353     clr acc8 
      00838A 20 2E            [ 2]  354     jra 6$
      00034F                        355 22$:     
      00838A 6B               [ 1]  356     clr a 
      00838B 01               [ 1]  357     clrw x 
      00838C 1F               [ 1]  358     rcf  
      000352                        359 3$: 
      00838D 02 1A 02 1A      [ 1]  360     rlc acc8 
      008391 03 26 05 A6      [ 1]  361     rlc acc16
      008395 04 CC 96 F0      [ 1]  362     rlc acc24 
      008399 59               [ 2]  363     rlcw x  
      008399 90               [ 1]  364     rlc a
      00839A F6 93 EE         [ 2]  365 4$: subw x,(DIVISOR+1,sp) 
      00839D 01 4D            [ 1]  366     sbc a,(DIVISOR,sp)
      00839F 2A 07            [ 1]  367     jrnc 5$
      0083A1 CD 82 81         [ 2]  368     addw x,(DIVISOR+1,sp)
      0083A4 03 05            [ 1]  369     adc a,(DIVISOR,sp)
      00036C                        370 5$: ; shift carry in QUOTIENT 
      0083A6 03               [ 1]  371     ccf
      0083A7 06 04            [ 1]  372     dec (CNTR,sp)
      0083A8 26 E1            [ 1]  373     jrne 3$ 
      0083A8 C7 00 0D CF      [ 1]  374     rlc acc8 
      0083AC 00 0E A6 18      [ 1]  375     rlc acc16 
      0083B0 6B 04 7B 01      [ 1]  376     rlc acc32 
      00037D                        377 6$:    
      0083B4 1E 02            [ 1]  378     ld (DIVISOR,sp),a 
      0083B6 CD 82            [ 2]  379     ldw (DIVISOR+1,sp),x 
      0083B8 56 23 14         [ 1]  380     ld a,acc24 
      0083BB C6 00 0D         [ 2]  381     ldw x,acc16 
      0083BE CE 00            [ 1]  382     tnz (QSIGN,sp)
      0083C0 0E 72            [ 1]  383     jreq 8$
      0083C2 5F 00 0D         [ 4]  384     call neg_ax 
      00038E                        385 8$: 
      00038E                        386     _store_top 
      0083C5 72 5F            [ 1]    1     ld (y),a 
      0083C7 00 0E 72         [ 2]    2     ldw (1,y),x     
      0083CA 5F 00            [ 1]  387     ld a,(DIVISOR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      0083CC 0F 20            [ 2]  388     ldw x,(DIVSOR+1,sp)
      000397                        389 81$:
      0083CE 2E 06            [ 1]  390     tnz (RSIGN,sp)
      0083CF 27 03            [ 1]  391     jreq 9$
      0083CF 4F 5F 98         [ 4]  392     call neg_ax       
      0083D2                        393 9$: _drop VSIZE 
      0083D2 72 59            [ 2]    1     addw sp,#VSIZE 
      0083D4 00               [ 4]  394     ret 
                                    395 
                                    396 
                                    397 ;-------------------------------
                                    398 ; mod24 A:X % acc24 
                                    399 ; remainder 24 bits integers 
                                    400 ; input:
                                    401 ;    acc24   dividend 
                                    402 ;    A:X     divisor 
                                    403 ; output:
                                    404 ;    acc24   acc24 % A:X 
                                    405 ;------------------------------
      0003A1                        406 mod24:
      0083D5 0F 72 59         [ 4]  407     call div24 
      0003A4                        408     _store_top  ; replace quotient by remainder 
      0083D8 00 0E            [ 1]    1     ld (y),a 
      0083DA 72 59 00         [ 2]    2     ldw (1,y),x     
      0083DD 0D               [ 4]  409     ret 
                                    410 
                                    411 
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
      0003AA                         32 	_argofs 0  
                           000002     1     ARG_OFS=2+0 
      0003AA                         33 	_arg R_Y 1 
                           000003     1     R_Y=ARG_OFS+1 
      0003AA                         34 	_arg R_X 3
                           000005     1     R_X=ARG_OFS+3 
      0003AA                         35 	_arg R_A 5
                           000007     1     R_A=ARG_OFS+5 
      0003AA                         36 	_arg R_CC 6
                           000008     1     R_CC=ARG_OFS+6 
      0003AA                         37 prt_regs::
      0083DE 59 49 72         [ 2]   38 	ldw x,#regs_state 
      0083E1 F0 02 12         [ 4]   39 	call puts
                                     40 ; register PC
      0083E4 01 24            [ 2]   41 	ldw y,(1,sp)
      0083E6 05 72 FB         [ 2]   42 	ldw x,#REG_EPC 
      0083E9 02 19 01         [ 4]   43 	call prt_reg16 
                                     44 ; register CC 
      0083EC 7B 08            [ 1]   45 	ld a,(R_CC,sp)
      0083EC 8C 0A 04         [ 2]   46 	ldw x,#REG_CC 
      0083EF 26 E1 72         [ 4]   47 	call prt_reg8 
                                     48 ; register A 
      0083F2 59 00            [ 1]   49 	ld a,(R_A,sp)
      0083F4 0F 72 59         [ 2]   50 	ldw x,#REG_A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0083F7 00 0E 72         [ 4]   51 	call prt_reg8 
                                     52 ; register X 
      0083FA 59 00            [ 2]   53 	ldw y,(R_X,sp)
      0083FC 0C 05 2A         [ 2]   54 	ldw x,#REG_X 
      0083FD CD 04 72         [ 4]   55 	call prt_reg16 
                                     56 ; register Y 
      0083FD 6B 01            [ 2]   57 	ldw y,(R_Y,sp)
      0083FF 1F 02 C6         [ 2]   58 	ldw x,#REG_Y 
      008402 00 0D CE         [ 4]   59 	call prt_reg16 
                                     60 ; register SP 
      008405 00 0E            [ 1]   61 	ldw y,sp
      008407 0D 05 27 03      [ 2]   62 	addw y,#6+ARG_OFS  
      00840B CD 82 81         [ 2]   63 	ldw x,#REG_SP
      00840E CD 04 72         [ 4]   64 	call prt_reg16
      00840E 90 F7            [ 1]   65 	ld a,#CR 
      008410 90 EF 01         [ 4]   66 	call putc
      008413 7B 01 1E         [ 4]   67 	call putc   
      008416 02               [ 4]   68 	ret 
                                     69 
                                     70 
      008417 0A 72 65 67 69 73 74    71 regs_state: .asciz "\nregisters state\n--------------------\n"
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
      000414                         81 prt_peek::
      008417 0D               [ 2]   82 	pushw x 
      008418 06 27 03 CD      [ 1]   83 	mov base,#16 
      00841C 82 81 5B         [ 4]   84 	call prt_i16  
      00841F 06 81            [ 1]   85 	ld a,#': 
      008421 CD 09 10         [ 4]   86 	call putc 
      008421 CD 83            [ 1]   87 	ld a,#SPACE 
      008423 73 90 F7         [ 4]   88 	call putc 
      008426 90               [ 2]   89 	popw x 
      008427 EF               [ 1]   90 	ld a,(x)
      008428 01               [ 1]   91 	clrw x 
      008429 81               [ 1]   92 	ld xl,a 
      00842A 35 0A 00 0A      [ 1]   93 	mov base,#10 
      00842A AE 84 6D         [ 4]   94 	call prt_i16 
      00842D CD               [ 4]   95 	ret 
                                     96 
                                     97 ;----------------------------------------
                                     98 ;   DEBUG support functions
                                     99 ;----------------------------------------
                                    100 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                    101 ; turn LED on 
      000432                        102 ledon:
      00842E 89 ED 16 01      [ 1]  103     bset PC_ODR,#LED2_BIT
      008432 AE               [ 4]  104     ret 
                                    105 
                                    106 ; turn LED off 
      000437                        107 ledoff:
      008433 85 A1 CD 84      [ 1]  108     bres PC_ODR,#LED2_BIT 
      008437 F2               [ 4]  109     ret 
                                    110 
                                    111 ; invert LED status 
      00043C                        112 ledtoggle:
      008438 7B 08            [ 1]  113     ld a,#LED2_MASK
      00843A AE 85 B2         [ 1]  114     xor a,PC_ODR
      00843D CD 84 D0         [ 1]  115     ld PC_ODR,a
      008440 7B               [ 4]  116     ret 
                                    117 
      000445                        118 left_paren:
      008441 07 AE            [ 1]  119 	ld a,#SPACE 
      008443 85 AE CD         [ 4]  120 	call putc
      008446 84 D0            [ 1]  121 	ld a,#'( 
      008448 16 05 AE         [ 4]  122 	call putc 	
      00844B 85               [ 4]  123 	ret 
                                    124 
                                    125 ;------------------------------
                                    126 ; print 8 bit register 
                                    127 ; input:
                                    128 ;   X  point to register name 
                                    129 ;   A  register value to print 
                                    130 ; output:
                                    131 ;   none
                                    132 ;------------------------------- 
      000450                        133 prt_reg8:
      00844C AA               [ 1]  134 	push a 
      00844D CD 84 F2         [ 4]  135 	call puts 
      008450 16 03            [ 1]  136 	ld a,(1,sp) 
      008452 AE               [ 1]  137 	clrw x 
      008453 85               [ 1]  138 	ld xl,a 
      008454 A6 CD 84 F2      [ 1]  139 	mov base,#16
      008458 90 96 72         [ 4]  140 	call prt_i16  
      00845B A9 00 08         [ 4]  141 	call left_paren 
      00845E AE               [ 1]  142 	pop a 
      00845F 85               [ 1]  143 	clrw x 
      008460 B7               [ 1]  144 	ld xl,a 
      008461 CD 84 F2 A6      [ 1]  145 	mov base,#10 
      008465 0D CD 89         [ 4]  146 	call prt_i16  
      008468 90 CD            [ 1]  147 	ld a,#') 
      00846A 89 90 81         [ 4]  148 	call putc
      00846D 0A               [ 4]  149 	ret
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
      000472                        159 prt_reg16: 
      00846E 72 65            [ 2]  160 	pushw y 
      008470 67 69 73         [ 4]  161 	call puts 
      008473 74 65            [ 2]  162 	ldw x,(1,sp) 
      008475 72 73 20 73      [ 1]  163 	mov base,#16 
      008479 74 61 74         [ 4]  164 	call prt_i16  
      00847C 65 0A 2D         [ 4]  165 	call left_paren 
      00847F 2D               [ 2]  166 	popw x 
      008480 2D 2D 2D 2D      [ 1]  167 	mov base,#10 
      008484 2D 2D 2D         [ 4]  168 	call prt_i16  
      008487 2D 2D            [ 1]  169 	ld a,#') 
      008489 2D 2D 2D         [ 4]  170 	call putc
      00848C 2D               [ 4]  171 	ret 
                                    172 
                                    173 ;------------------------------------
                                    174 ; print registers contents saved on
                                    175 ; stack by trap interrupt.
                                    176 ;------------------------------------
      000491                        177 print_registers:
      00848D 2D 2D 2D         [ 2]  178 	ldw x,#STATES
      008490 2D 2D 0A         [ 4]  179 	call puts
                                    180 ; print EPC 
      008493 00 05 21         [ 2]  181 	ldw x, #REG_EPC
      008494 CD 09 6D         [ 4]  182 	call puts 
      008494 89 35            [ 1]  183 	ld a, (11,sp)
      008496 10 00 0B         [ 1]  184 	ld acc8,a 
      008499 CD 98            [ 1]  185 	ld a, (10,sp) 
      00849B 44 A6 3A         [ 1]  186 	ld acc16,a 
      00849E CD 89            [ 1]  187 	ld a,(9,sp) 
      0084A0 90 A6 20         [ 1]  188 	ld acc24,a
      0084A3 CD               [ 1]  189 	clrw x  
      0084A4 89 90            [ 1]  190 	ld a,#16
      0084A6 85 F6 5F         [ 4]  191 	call prt_acc24  
                                    192 ; print X
      0084A9 97 35 0A         [ 2]  193 	ldw x,#REG_X
      0084AC 00 0B            [ 2]  194 	ldw y,(5,sp)
      0084AE CD 98 44         [ 4]  195 	call prt_reg16  
                                    196 ; print Y 
      0084B1 81 05 26         [ 2]  197 	ldw x,#REG_Y
      0084B2 16 07            [ 2]  198 	ldw y, (7,sp)
      0084B2 72 1A 50         [ 4]  199 	call prt_reg16  
                                    200 ; print A 
      0084B5 0A 81 2E         [ 2]  201 	ldw x,#REG_A
      0084B7 7B 04            [ 1]  202 	ld a, (4,sp) 
      0084B7 72 1B 50         [ 4]  203 	call prt_reg8
                                    204 ; print CC 
      0084BA 0A 81 32         [ 2]  205 	ldw x,#REG_CC 
      0084BC 7B 03            [ 1]  206 	ld a, (3,sp) 
      0084BC A6 20 C8         [ 4]  207 	call prt_reg8 
                                    208 ; print SP 
      0084BF 50 0A C7         [ 2]  209 	ldw x,#REG_SP
      0084C2 50 0A            [ 1]  210 	ldw y,sp 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0084C4 81 A9 00 0C      [ 2]  211 	addw y,#12
      0084C5 CD 04 72         [ 4]  212 	call prt_reg16  
      0084C5 A6 20            [ 1]  213 	ld a,#'\n' 
      0084C7 CD 89 90         [ 4]  214 	call putc
      0084CA A6               [ 4]  215 	ret
                                    216 
      0084CB 28 CD 89 90 81 73 74   217 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             65 72 73 20 73 74 61
             74 65 20 61 74 20 61
             62 6F 72 74 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      0084D0 45 50 43 3A 00         218 REG_EPC: .asciz "EPC:"
      0084D0 88 CD 89 ED            219 REG_Y:   .asciz "\nY:" 
      0084D4 7B 01 5F 97            220 REG_X:   .asciz "\nX:"
      0084D8 35 10 00 0B            221 REG_A:   .asciz "\nA:" 
      0084DC CD 98 44 CD 84         222 REG_CC:  .asciz "\nCC:"
      0084E1 C5 84 5F 97 35         223 REG_SP:  .asciz "\nSP:"
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
      00053C                        235 cmd_itf:
      0084E6 0A 00            [ 2]  236 	sub sp,#VSIZE 
      0084E8 0B CD 98 44      [ 1]  237 	clr farptr 
      0084EC A6 29 CD 89      [ 1]  238 	clr farptr+1 
      0084F0 90 81 00 1A      [ 1]  239 	clr farptr+2  
      0084F2                        240 repl:
      0084F2 90 89            [ 1]  241 	ld a,#CR 
      0084F4 CD 89 ED         [ 4]  242 	call putc 
      0084F7 1E 01            [ 1]  243 	ld a,#'? 
      0084F9 35 10 00         [ 4]  244 	call putc
      0084FC 0B CD 98 44      [ 1]  245 	clr in.w 
      008500 CD 84 C5 85      [ 1]  246 	clr in 
      008504 35 0A 00         [ 4]  247 	call readln
      008507 0B CD 98 44      [ 2]  248 	ldw y,#tib  
      00850B A6 29            [ 1]  249 	ld a,(y)
      00850D CD 89            [ 1]  250 	jreq repl  
      00850F 90 81 00 01      [ 1]  251 	inc in 
      008511 CD 18 5A         [ 4]  252 	call to_upper 
      008511 AE 85            [ 1]  253 	cp a,#'Q 
      008513 64 CD            [ 1]  254 	jrne test_p
      000572                        255 repl_exit:
      008515 89 ED AE 85      [ 1]  256 	clr tib 
      008519 A1 CD 89 ED      [ 1]  257 	clr count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      00851D 7B 0B C7 00      [ 1]  258 	clr in 
      00057E                        259 	_drop #VSIZE 	
      008521 0F 7B            [ 2]    1     addw sp,##VSIZE 
      008523 0A               [ 4]  260 	ret  
      000581                        261 invalid:
      008524 C7 00 0E         [ 2]  262 	ldw x,#invalid_cmd 
      008527 7B 09 C7         [ 4]  263 	call puts 
      00852A 00 0D            [ 2]  264 	jra repl 
      000589                        265 test_p:	
      00852C 5F A6            [ 1]  266     cp a,#'P 
      00852E 10 CD            [ 1]  267 	jreq mem_peek
      008530 98 5B            [ 1]  268     cp a,#'S 
      008532 AE 85            [ 1]  269 	jrne invalid 
      000591                        270 print_string:	
      008534 AA 16 05         [ 4]  271 	call get_token
      008537 CD 84            [ 1]  272 	cp a,#TK_INTGR 
      008539 F2 AE            [ 1]  273 	jrne invalid 
      00853B 85 A6 16         [ 4]  274 	call puts
      00853E 07 CD 84         [ 2]  275 	jp repl 	
      00059E                        276 mem_peek:
      008541 F2 AE            [ 1]  277 	ld a,#SPACE 
      008543 85 AE 7B         [ 4]  278 	call skip  	 
      008546 04 CD 84 D0      [ 2]  279 	addw y,in.w 
      00854A AE 85 B2         [ 2]  280 	ldw x,#pad 
      00854D 7B 03 CD         [ 4]  281 	call strcpy
      008550 84 D0 AE         [ 2]  282 	ldw x,#pad
      008553 85 B7 90         [ 4]  283 	call atoi24 	
      008556 96 72 A9         [ 1]  284 	ld a, acc24 
      008559 00 0C CD         [ 1]  285 	or a,acc16 
      00855C 84 F2 A6         [ 1]  286 	or a,acc8 
      00855F 0A CD            [ 1]  287 	jrne 1$ 
      008561 89 90            [ 2]  288 	jra peek_byte  
      008563 81 0A 52         [ 2]  289 1$:	ldw x,acc24 
      008566 65 67 69         [ 2]  290 	ldw farptr,x 
      008569 73 74 65         [ 1]  291 	ld a,acc8 
      00856C 72 73 20         [ 1]  292 	ld farptr+2,a 
      0005CC                        293 peek_byte:
      00856F 73 74 61         [ 4]  294 	call print_farptr 
      008572 74 65            [ 1]  295 	ld a,#8 
      008574 20 61            [ 1]  296 	ld (PSIZE,sp),a 
      008576 74               [ 1]  297 	clrw x 
      008577 20 61 62         [ 4]  298 1$:	call fetchc  
      00857A 6F               [ 2]  299 	pushw x 
      00857B 72 74 20         [ 1]  300 	ld acc8,a 
      00857E 70               [ 1]  301 	clrw x 
      00857F 6F 69 6E         [ 2]  302 	ldw acc24,x 
      008582 74 2E            [ 1]  303 	ld a,#16+128
      008584 0A 2D 2D         [ 4]  304 	call prt_acc24
      008587 2D               [ 2]  305 	popw x 
      008588 2D 2D            [ 1]  306 	dec (PSIZE,sp)
      00858A 2D 2D            [ 1]  307 	jrne 1$ 
      00858C 2D 2D            [ 1]  308 	ld a,#8 
      00858E 2D 2D 2D         [ 1]  309 	add a,farptr+2 
      008591 2D 2D 2D         [ 1]  310 	ld farptr+2,a
      008594 2D               [ 1]  311 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      008595 2D 2D 2D         [ 1]  312 	adc a,farptr+1 
      008598 2D 2D 2D         [ 1]  313 	ld farptr+1,a 
      00859B 2D               [ 1]  314 	clr a 
      00859C 2D 2D 2D         [ 1]  315 	adc a,farptr 
      00859F 0A 00 45         [ 1]  316 	ld farptr,a 
      0085A2 50 43 3A         [ 2]  317 	jp repl  
                                    318 
      0085A5 00 0A 59 3A 00 0A 58   319 invalid_cmd: .asciz "not a command\n" 
             3A 00 0A 41 3A 00 0A
             43
                                    320 
                                    321 ;----------------------------
                                    322 ; display farptr address
                                    323 ;----------------------------
      000611                        324 print_farptr:
      0085B4 43 3A 00         [ 1]  325 	ld a ,farptr+2 
      0085B7 0A 53 50         [ 1]  326 	ld acc8,a 
      0085BA 3A 00 18         [ 2]  327 	ldw x,farptr 
      0085BC CF 00 0C         [ 2]  328 	ldw acc24,x 
      0085BC 52               [ 1]  329 	clrw x 
      0085BD 01 72            [ 1]  330 	ld a,#16 
      0085BF 5F 00 19         [ 4]  331 	call prt_acc24
      0085C2 72 5F            [ 1]  332 	ld a,#SPACE 
      0085C4 00 1A 72         [ 4]  333 	call putc 
      0085C7 5F 00 1B         [ 4]  334 	call putc 
      0085CA 81               [ 4]  335 	ret
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
      00062C                        346 fetchc: ; @C
      0085CA A6 0D CD 89      [ 5]  347 	ldf a,([farptr],x)
      0085CE 90               [ 1]  348 	incw x
      0085CF A6               [ 4]  349 	ret
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
      000632                        360 number:
      0085D0 3F CD 89         [ 4]  361 	call get_token
      0085D3 90 72            [ 1]  362 	cp a,#TK_INTGR
      0085D5 5F 00            [ 1]  363 	jreq 1$
      0085D7 01 72 5F         [ 2]  364 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0085DA 00               [ 4]  365 1$:	ret
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
      00063D                        380 show_row:
      0085DB 02               [ 1]  381 	tnz a 
      0085DC CD 8A            [ 1]  382 	jrne 1$
      0085DE F2               [ 4]  383 	ret 
      000641                        384 1$:	
      0085DF 90               [ 2]  385 	pushw x  
      0085E0 AE               [ 1]  386 	push a 
      0085E1 16 68 90 F6      [ 1]  387 	mov tab_width,#4 
      0085E5 27 E3 72         [ 4]  388 	call prt_i16 
      0085E8 5C 00            [ 1]  389 	ld a,#SPACE  
      0085EA 02 CD 98         [ 4]  390 	call putc
      00064F                        391 row_loop:
      0085ED DA A1            [ 2]  392 	ldw x,(ADR,sp)
      0085EF 51               [ 1]  393 	ld a,(x)
      0085F0 26               [ 1]  394 	clrw x 
      0085F1 17               [ 1]  395 	ld xl,a 
      0085F2 CD 17 C4         [ 4]  396 	call prt_i16 
      0085F2 72 5F            [ 2]  397 	ldw x,(ADR,sp)
      0085F4 16               [ 1]  398 	incw x 
      0085F5 68 72            [ 2]  399 	ldw (ADR,sp),x 
      0085F7 5F 00            [ 1]  400 	dec (CNT,sp)
      0085F9 04 72            [ 1]  401 	jrne row_loop
      000660                        402 	_drop VSIZE  		
      0085FB 5F 00            [ 2]    1     addw sp,#VSIZE 
      0085FD 02 5B 01 81      [ 1]  403 	mov tab_width,#4
      008601 A6 0D            [ 1]  404 	ld a,#CR 
      008601 AE 86 82         [ 4]  405 	call putc 
      008604 CD               [ 4]  406 	ret 
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



      00066C                        419 hex_dump:
      008605 89               [ 1]  420 	push a 
      00066D                        421 	_vars VSIZE
      008606 ED 20            [ 2]    1     sub sp,#VSIZE 
      008608 C1 00 0A         [ 1]  422 	ld a,base
      008609 6B 03            [ 1]  423 	ld (BASE,sp),a 
      008609 A1 50 27 11      [ 1]  424 	mov base,#16
      00860D A1 53 26         [ 1]  425 	ld a,tab_width 
      008610 F0 04            [ 1]  426 	ld (TABW,sp),a
      008611 A6 0D            [ 1]  427 	ld a,#CR 
      008611 CD 8F 67         [ 4]  428 	call putc 
      008614 A1 84            [ 2]  429 1$: ldw (BCNT,sp),y
      008616 26 E9            [ 1]  430 	ld a,#16
      008618 CD 89 ED CC      [ 2]  431 	cpw y,#16
      00861C 85 CA            [ 1]  432 	jrpl 2$
      00861E 90 9F            [ 1]  433 	ld a,yl
      00068E                        434 2$: 	
      00861E A6 20 CD         [ 4]  435 	call show_row 
      008621 8F 54            [ 2]  436 	ldw y,(BCNT,sp) 
      008623 72 B9 00 01      [ 2]  437 	subw y,#16 
      008627 AE 16 B8 CD      [ 2]  438 	cpw y,#1
      00862B 94 4E            [ 1]  439 	jrpl 1$
      00862D AE 16            [ 1]  440 	ld a,(BASE,sp)
      00862F B8 CD 98         [ 1]  441 	ld base,a
      008632 E6 C6            [ 1]  442 	ld a,(TABW,sp)
      008634 00 0D CA         [ 1]  443 	ld tab_width,a 
      0006A7                        444 	_drop VSIZE
      008637 00 0E            [ 2]    1     addw sp,#VSIZE 
      008639 CA               [ 1]  445 	pop a 
      00863A 00               [ 4]  446 	ret 
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
      0006AB                         45 unlock_eeprom:
      00863B 0F 26 02 20 0C   [ 2]   46 	btjt FLASH_IAPSR,#FLASH_IAPSR_DUL,9$
      008640 CE 00 0D CF      [ 1]   47 	mov FLASH_CR2,#0 
      008644 00 19 C6 00      [ 1]   48 	mov FLASH_NCR2,#0xFF 
      008648 0F C7 00 1B      [ 1]   49 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      00864C 35 56 50 64      [ 1]   50     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00864C CD 86 91 A6 08   [ 2]   51 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008651 6B               [ 4]   52 9$:	ret
                                     53 
                                     54 ;----------------------------------
                                     55 ; unlock FLASH for writing/erasing
                                     56 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                     57 ; input:
                                     58 ;  none
                                     59 ; output:
                                     60 ;  none
                                     61 ;----------------------------------
      0006C6                         62 unlock_flash:
      008652 01 5F CD 86 AC   [ 2]   63 	btjt FLASH_IAPSR,#FLASH_IAPSR_PUL,9$
      008657 89 C7 00 0F      [ 1]   64 	mov FLASH_CR2,#0 
      00865B 5F CF 00 0D      [ 1]   65 	mov FLASH_NCR2,#0xFF 
      00865F A6 90 CD 98      [ 1]   66 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008663 5B 85 0A 01      [ 1]   67 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      008667 26 EB A6 08 CB   [ 2]   68 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      00866C 00               [ 4]   69 9$:	ret
                                     70 
                                     71 ;----------------------------
                                     72 ; erase block code must be 
                                     73 ; executed from RAM
                                     74 ; input:
                                     75 ;-----------------------------
      0006E1                         76 row_erase:
      00866D 1B               [ 1]   77 	push a 
      00866E C7 00            [ 2]   78 	pushw y 
      008670 1B 4F C9 00      [ 1]   79 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      008674 1A C7 00 1A      [ 1]   80 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      008678 4F               [ 1]   81 	clr a 
      008679 C9 00            [ 1]   82 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      00867B 19 C7 00 19      [ 1]   83 	ldf ([farptr],y),a
      00867F CC 85            [ 1]   84     incw y
      008681 CA 6E 6F 74      [ 1]   85 	ldf ([farptr],y),a
      008685 20 61            [ 1]   86     incw y
      008687 20 63 6F 6D      [ 1]   87 	ldf ([farptr],y),a
      00868B 6D 61            [ 1]   88     incw y
      00868D 6E 64 0A 00      [ 1]   89 	ldf ([farptr],y),a
      008691 72 05 50 5F FB   [ 2]   90 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      008691 C6 00            [ 2]   91 	popw y 
      008693 1B               [ 1]   92 	pop a 
      008694 C7               [ 4]   93 	ret
      00070E                         94 row_erase_end:
                                     95 
                                     96 ; copy erase_start in RAM 
      00070E                         97 move_erase_to_ram:
      008695 00               [ 2]   98 	pushw x 
      008696 0F CE            [ 2]   99 	pushw y 
      008698 00 19 CF         [ 2]  100 	ldw x,#row_erase_end 
      00869B 00 0D 5F         [ 2]  101 	subw x,#row_erase
      00869E A6 10 CD         [ 2]  102 	ldw acc16,x 
      0086A1 98 5B A6         [ 2]  103 	ldw x,#tib 
      0086A4 20 CD 89 90      [ 2]  104 	ldw y,#row_erase 
      0086A8 CD 89 90         [ 4]  105 	call move
      0086AB 81 85            [ 2]  106 	popw y
      0086AC 85               [ 2]  107 	popw x
      0086AC 92               [ 4]  108 	ret 
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
      000728                        123 program_row:
      0086AD AF               [ 1]  124 	push a 
      0086AE 00 19            [ 2]  125 	pushw y 
      0086B0 5C 81            [ 1]  126 	push #BLOCK_SIZE  
                                    127 ;enable block programming 
      0086B2 72 10 50 5B      [ 1]  128 	bset FLASH_CR2,#FLASH_CR2_PRG 
      0086B2 CD 8F 67 A1      [ 1]  129 	bres FLASH_NCR2,#FLASH_CR2_PRG
      0086B6 84 27            [ 1]  130 	clrw y 
      0086B8 03               [ 1]  131 1$:	ld a,(x)
      0086B9 CC 96 EE 81      [ 1]  132 	ldf ([farptr],y),a
      0086BD 5C               [ 1]  133 	incw x 
      0086BD 4D 26            [ 1]  134 	incw y 
      0086BF 01 81            [ 1]  135 	dec (BCNT,sp)
      0086C1 26 F4            [ 1]  136 	jrne 1$
                                    137 ; wait EOP bit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0086C1 89 88 35 04 00   [ 2]  138 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      000748                        139 	_drop 1 
      0086C6 24 CD            [ 2]    1     addw sp,#1 
      0086C8 98 44            [ 2]  140 	popw y 
      0086CA A6               [ 1]  141 	pop a 
      0086CB 20               [ 4]  142 	ret 
      00074E                        143 program_row_end:
                                    144 
                                    145 ;-------------------------
                                    146 ; move program_row to RAM 
                                    147 ; at txtubound address 
                                    148 ;------------------------
      00074E                        149 move_prg_to_ram:
      0086CC CD               [ 2]  150 	pushw x 
      0086CD 89 90            [ 2]  151 	pushw y 
      0086CF AE 07 4E         [ 2]  152 	ldw x,#program_row_end 
      0086CF 1E 02 F6         [ 2]  153 	subw x,#program_row 
      0086D2 5F 97 CD         [ 2]  154 	ldw acc16,x ; bytes to move 
      0086D5 98 44 1E         [ 2]  155 	ldw x,#tib ; destination address 
      0086D8 02 5C 1F 02      [ 2]  156 	ldw y,#program_row ; source address 
      0086DC 0A 01 26         [ 4]  157 	call move
      0086DF EF 5B            [ 2]  158 	popw y 
      0086E1 03               [ 2]  159 	popw x  
      0086E2 35               [ 4]  160 	ret 
                                    161 
                                    162 
                                    163 ;-----------------------------
                                    164 ; write a buffer in FLASH/EEPROM 
                                    165 ; input:
                                    166 ;    farptr   destination address 
                                    167 ;    x        buffer address 
                                    168 ;-----------------------------
      000768                        169 write_buffer:
      0086E3 04               [ 2]  170 	pushw x 
      0086E4 00 24 A6 0D      [ 1]  171 	tnz farptr 
      0086E8 CD 89            [ 1]  172 	jrne to_flash 
      0086EA 90 81 19         [ 2]  173 	ldw x,farptr+1 
      0086EC A3 35 80         [ 2]  174 	cpw x,#app_space  
      0086EC 88 52            [ 1]  175 	jruge to_flash 
      000777                        176 to_eeprom:
      0086EE 04 C6 00         [ 4]  177 	call unlock_eeprom
      0086F1 0B 6B            [ 2]  178 	jra do_programming
      00077C                        179 to_flash:
      0086F3 03 35 10         [ 4]  180 	call unlock_flash
      00077F                        181 do_programming:
      0086F6 00               [ 2]  182 	popw x 
      0086F7 0B C6 00         [ 4]  183 	call tib
      0086FA 24 6B 04 A6      [ 1]  184 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      0086FE 0D CD 89 90      [ 1]  185 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      008702 17               [ 4]  186 	ret 
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
      00078C                        197 block_erase:
      008703 01               [ 2]  198 	pushw x 
      008704 A6 10 90         [ 1]  199 	ld a,farptr 
      008707 A3 00            [ 1]  200 	jrne erase_flash
      008709 10 2A 02         [ 2]  201 	ldw x,farptr+1
      00870C 90 9F 80         [ 2]  202 	cpw x,#app_space 
      00870E 24 0C            [ 1]  203 	jruge erase_flash 
                                    204 ; erase eeprom block
      00870E CD 86 BD         [ 4]  205 	call unlock_eeprom 
      008711 16 01 72         [ 4]  206 	call tib 
      008714 A2 00 10 90      [ 1]  207 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      008718 A3 00            [ 2]  208 	jra erase_exit  
                                    209 ; erase flash block:
      0007A6                        210 erase_flash:
      00871A 01 2A E5         [ 4]  211 	call unlock_flash 
      00871D 7B 03 C7         [ 4]  212 	call tib 
      008720 00 0B 7B 04      [ 1]  213     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0007B0                        214 erase_exit: 
      008724 C7               [ 2]  215 	popw x 
      008725 00               [ 4]  216 	ret 
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
      0007B2                        232 write_byte:
      008726 24 5B            [ 2]  233 	pushw y
      0007B4                        234 	_vars VSIZE
      008728 04 84            [ 2]    1     sub sp,#VSIZE 
      00872A 81 01            [ 1]  235 	ld (BTW,sp),a ; byte to write 
      00872B 0F 02            [ 1]  236 	clr (OPT,sp)  ; OPTION flag
                                    237 ; put addr[15:0] in Y, for bounds check.
      00872B 72 06 50 5F      [ 2]  238 	ldw y,farptr+1   ; Y=addr15:0
                                    239 ; check addr[23:16], if <> 0 then it is extened flash memory
      00872F 15 35 00 50      [ 1]  240 	tnz farptr 
      008733 5B 35            [ 1]  241 	jrne write_flash
      008735 FF 50 5C 35      [ 2]  242     cpw y,#app_space 	 
      008739 AE 50            [ 1]  243     jruge write_flash
      00873B 64 35 56 50      [ 2]  244 	cpw y,#EEPROM_BASE  
      00873F 64 72            [ 1]  245     jrult write_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      008741 07 50 5F FB      [ 2]  246 	cpw y,#OPTION_END 
      008745 81 51            [ 1]  247 	jrugt write_exit
      008746 20 16            [ 2]  248 	jra write_eeprom 
                                    249 ; write program memory
      0007D8                        250 write_flash:
      008746 72 02 50         [ 4]  251 	call unlock_flash 
      008749 5F               [ 1]  252 1$:	sim 
      00874A 15 35            [ 1]  253 	ld a,(BTW,sp)
      00874C 00 50 5B 35      [ 4]  254 	ldf ([farptr],x),a ; farptr[x]=A
      008750 FF 50 5C 35 56   [ 2]  255 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008755 50               [ 1]  256     rim 
      008756 62 35 AE 50      [ 1]  257     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00875A 62 72            [ 2]  258     jra write_exit
                                    259 ; write eeprom and option
      0007EE                        260 write_eeprom:
      00875C 03 50 5F         [ 4]  261 	call unlock_eeprom
                                    262 	; check for data eeprom or option eeprom
      00875F FB 81 48 00      [ 2]  263 	cpw y,#OPTION_BASE
      008761 2B 08            [ 1]  264 	jrmi 1$
      008761 88 90 89 35      [ 2]  265 	cpw y,#OPTION_END+1
      008765 20 50            [ 1]  266 	jrpl 1$
      008767 5B 35            [ 1]  267 	cpl (OPT,sp)
      0007FF                        268 1$: 
      008769 DF 50            [ 1]  269     tnz (OPT,sp)
      00876B 5C 4F            [ 1]  270     jreq 2$
                                    271 	; pour modifier une option il faut modifier ces 2 bits
      00876D 90 5F 91 A7      [ 1]  272     bset FLASH_CR2,#FLASH_CR2_OPT
      008771 00 19 90 5C      [ 1]  273     bres FLASH_NCR2,#FLASH_CR2_OPT 
      00080B                        274 2$: 
      008775 91 A7            [ 1]  275     ld a,(BTW,sp)
      008777 00 19 90 5C      [ 4]  276     ldf ([farptr],x),a
      00877B 91 A7            [ 1]  277     tnz (OPT,sp)
      00877D 00 19            [ 1]  278     jreq 3$
      00877F 90               [ 1]  279     incw x
      008780 5C 91            [ 1]  280     ld a,(BTW,sp)
      008782 A7               [ 1]  281     cpl a
      008783 00 19 72 05      [ 4]  282     ldf ([farptr],x),a
      008787 50 5F FB 90 85   [ 2]  283 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      00878C 84 81 50 5F FB   [ 2]  284 	btjf FLASH_IAPSR,#FLASH_IAPSR_HVOFF,.
      00878E                        285 write_exit:
      00878E                        286 	_drop VSIZE 
      00878E 89 90            [ 2]    1     addw sp,#VSIZE 
      008790 89 AE            [ 2]  287 	popw y
      008792 87               [ 4]  288     ret
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
      00082C                        304 	_argofs 3 
                           000005     1     ARG_OFS=2+3 
      00082C                        305 	_arg BSIZE 1  ; block size
                           000006     1     BSIZE=ARG_OFS+1 
                                    306 	; local var 
                           000001   307 	XSAVE=1 
                           000002   308 	VSIZE=2 
      00082C                        309 write_block::
      008793 8E               [ 1]  310 	push a 
      00082D                        311 	_vars VSIZE
      008794 1D 87            [ 2]    1     sub sp,#VSIZE 
      008796 61 CF            [ 2]  312 	ldw (XSAVE,sp),x 
      008798 00 0E            [ 2]  313 	ldw x,(BSIZE,sp) 
      00879A AE 16            [ 1]  314 	jreq 9$
      00879C 68 90            [ 2]  315 1$:	ldw x,(XSAVE,sp)
      00879E AE 87            [ 1]  316 	ld a,(y)
      0087A0 61 CD 94         [ 4]  317 	call write_byte 
      0087A3 5E               [ 1]  318 	incw x 
      0087A4 90 85            [ 1]  319 	incw y 
      0087A6 85 81            [ 2]  320 	ldw (XSAVE,sp),x
      0087A8 1E 06            [ 2]  321 	ldw x,(BSIZE,sp)
      0087A8 88               [ 2]  322 	decw x
      0087A9 90 89            [ 2]  323 	ldw (BSIZE,sp),x 
      0087AB 4B 80            [ 1]  324 	jrne 1$
      000848                        325 9$:
      0087AD 72 10            [ 2]  326 	ldw x,(XSAVE,sp)
      0087AF 50 5B 72         [ 4]  327 	call incr_farptr
      00084D                        328 	_drop VSIZE
      0087B2 11 50            [ 2]    1     addw sp,#VSIZE 
      0087B4 5C               [ 1]  329 	pop a 
      0087B5 90               [ 4]  330 	ret 
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
      000851                        347 write_nbytes:
      0087B6 5F F6            [ 2]  348 	pushw y
      0087B8 91               [ 1]  349 	push a 
      0087B9 A7 00            [ 1]  350 	ldw y,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0087BB 19               [ 1]  351 	clrw x 
      000857                        352 1$:  
      0087BC 5C 90            [ 1]  353 	ld a,(y)
      0087BE 5C 0A            [ 1]  354 	incw y
      0087C0 01 26 F4         [ 4]  355 	call write_byte 
      0087C3 72               [ 1]  356 	incw x 
      0087C4 05 50            [ 1]  357 	dec (1,sp)  
      0087C6 5F FB            [ 1]  358 	jrne 1$ 
      0087C8 5B               [ 1]  359 9$: pop a 
      0087C9 01 90            [ 2]  360 	popw y 
      0087CB 85               [ 4]  361 	ret 
                                    362 
                                    363 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    364 ;;;  flash memory operations
                                    365 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    366 
                                    367 ;--------------------------
                                    368 ; align farptr to BLOCK_SIZE 
                                    369 ;---------------------------
      000867                        370 row_align:
      0087CC 84 81            [ 1]  371 	ld a,#0x7f 
      0087CE C4 00 1A         [ 1]  372 	and a,farptr+2 
      0087CE 27 13            [ 1]  373 	jreq 1$ 
      0087CE 89 90 89         [ 2]  374 	ldw x,farptr+1 
      0087D1 AE 87 CE         [ 2]  375 	addw x,#BLOCK_SIZE 
      0087D4 1D 87            [ 1]  376 	jrnc 0$
      0087D6 A8 CF 00 0E      [ 1]  377 	inc farptr 
      0087DA AE               [ 1]  378 0$: ld a,xl 
      0087DB 16 68            [ 1]  379 	and a,#0x80
      0087DD 90               [ 1]  380 	ld xl,a
      0087DE AE 87 A8         [ 2]  381 	ldw farptr+1,x  	
      0087E1 CD               [ 4]  382 1$:	ret
                                    383 
                                    384 ;--------------------
                                    385 ; input:
                                    386 ;   X     increment 
                                    387 ; output:
                                    388 ;   farptr  incremented 
                                    389 ;---------------------
      000882                        390 incr_farptr:
      0087E2 94 5E 90 85      [ 2]  391 	addw x,farptr+1 
      0087E6 85 81            [ 1]  392 	jrnc 1$
      0087E8 72 5C 00 18      [ 1]  393 	inc farptr 
      0087E8 89 72 5D         [ 2]  394 1$:	ldw farptr+1,x  
      0087EB 00               [ 4]  395 	ret 
                                    396 
                                    397 ;-----------------------------------
                                    398 ; scan block for non zero byte 
                                    399 ; block are 128 bytes 
                                    400 ; input:
                                    401 ;    farptr     address block  
                                    402 ; output:
                                    403 ;     A     0 cleared, other not cleared  
                                    404 ;-----------------------------------
      000890                        405 scan_block:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0087EC 19               [ 1]  406 	clrw x 
      0087ED 26 0D CE 00      [ 5]  407 1$: ldf a,([farptr],x) 
      0087F1 1A A3            [ 1]  408 	jrne 2$
      0087F3 B6               [ 1]  409 	incw x 
      0087F4 00 24 05         [ 2]  410 	cpw x,#BLOCK_SIZE 
      0087F7 25 F4            [ 1]  411 	jrult 1$ 
      0087F7 CD               [ 4]  412 2$:	ret 
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
      00089E                         66 Uart1RxHandler: ; console receive char 
      0087F8 87 2B 20 03 27   [ 2]   67 	btjf UART1_SR,#UART_SR_RXNE,5$
      0087FC C6 52 31         [ 1]   68 	ld a,UART1_DR 
      0087FC CD 87            [ 1]   69 	cp a,#CTRL_C 
      0087FE 46 06            [ 1]   70 	jrne 2$
      0087FF CD 09 10         [ 4]   71 	call putc 
      0087FF 85 CD 16         [ 2]   72 	jp user_interrupted
      0008B0                         73 2$:
      008802 68 72            [ 1]   74 	cp a,#CAN ; CTRL_X 
      008804 13 50            [ 1]   75 	jrne 3$
      008806 5F 72 17         [ 2]   76 	jp cold_start 	
      008809 50               [ 1]   77 3$:	push a 
      00880A 5F 81            [ 1]   78 	ld a,#rx1_queue 
      00880C CB 00 2F         [ 1]   79 	add a,rx1_tail 
      00880C 89               [ 1]   80 	clrw x 
      00880D C6               [ 1]   81 	ld xl,a 
      00880E 00               [ 1]   82 	pop a 
      00880F 19               [ 1]   83 	ld (x),a 
      008810 26 14 CE         [ 1]   84 	ld a,rx1_tail 
      008813 00               [ 1]   85 	inc a 
      008814 1A A3            [ 1]   86 	and a,#RX_QUEUE_SIZE-1
      008816 B6 00 24         [ 1]   87 	ld rx1_tail,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      008819 0C               [11]   88 5$:	iret 
                                     89 
                                     90 ;---------------------------------------------
                                     91 ; initialize UART1, 115200 8N1
                                     92 ; input:
                                     93 ;	none
                                     94 ; output:
                                     95 ;   none
                                     96 ;---------------------------------------------
      0008CB                         97 uart1_init:
      00881A CD 87 2B CD      [ 1]   98     bset PA_DDR,#UART1_TX_PIN
      00881E 16 68 72 17      [ 1]   99     bset PA_CR1,#UART1_TX_PIN 
      008822 50 5F 20 0A      [ 1]  100     bset PA_CR2,#UART1_TX_PIN 
                                    101 ; enable UART1 clock
      008826 72 14 50 C7      [ 1]  102 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      0008DB                        103 uart1_set_baud: 
      008826 CD               [ 1]  104 	push a 
                                    105 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    106 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008827 87 46            [ 1]  107 	ld a,#CLK_SWR_HSI
      008829 CD 16 68         [ 1]  108 	cp a,CLK_CMSR 
      00882C 72 13            [ 1]  109 	jreq 2$ 
      0008E3                        110 1$: ; 8 Mhz 	
      00882E 50 5F 52 33      [ 1]  111 	mov UART1_BRR2,#0x05 ; must be loaded first
      008830 35 04 52 32      [ 1]  112 	mov UART1_BRR1,#0x4
      008830 85 81            [ 2]  113 	jra 3$
      008832                        114 2$: ; 16 Mhz 	
      008832 90 89 52 02      [ 1]  115 	mov UART1_BRR2,#0x0b ; must be loaded first
      008836 6B 01 0F 02      [ 1]  116 	mov UART1_BRR1,#0x08
      0008F5                        117 3$:
      00883A 90 CE 00 1A      [ 1]  118     clr UART1_DR
      00883E 72 5D 00 19      [ 1]  119 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008842 26 14 90 A3      [ 1]  120 	bset UART1_CR2,#UART_CR2_SBK
      008846 B6 00 24 0E 90   [ 2]  121     btjf UART1_SR,#UART_SR_TC,.
      00884B A3 40 00 25      [ 1]  122     clr rx1_head 
      00884F 57 90 A3 48      [ 1]  123 	clr rx1_tail
      008853 7F               [ 1]  124 	pop a  
      008854 22               [ 4]  125 	ret
                                    126 
                                    127 ;---------------------------------
                                    128 ; uart1_putc
                                    129 ; send a character via UART1
                                    130 ; input:
                                    131 ;    A  	character to send
                                    132 ;---------------------------------
      000910                        133 putc:: ; console output always on UART1
      000910                        134 uart1_putc:: 
      008855 51 20 16 30 FB   [ 2]  135 	btjf UART1_SR,#UART_SR_TXE,.
      008858 C7 52 31         [ 1]  136 	ld UART1_DR,a 
      008858 CD               [ 4]  137 	ret 
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
      000919                        148 qgetc::
      000919                        149 uart1_qgetc::
      008859 87 46 9B         [ 1]  150 	ld a,rx1_head 
      00885C 7B 01 92         [ 1]  151 	sub a,rx1_tail 
      00885F A7               [ 4]  152 	ret 
                                    153 
                                    154 ;---------------------------------
                                    155 ; wait character from UART1 
                                    156 ; input:
                                    157 ;   none
                                    158 ; output:
                                    159 ;   A 			char  
                                    160 ;--------------------------------	
      000920                        161 getc:: ;console input
      000920                        162 uart1_getc::
      008860 00 19 72         [ 4]  163 	call uart1_qgetc
      008863 05 50            [ 1]  164 	jreq uart1_getc 
      008865 5F               [ 2]  165 	pushw x 
                                    166 ;; rx1_queue must be in page 0 	
      008866 FB 9A            [ 1]  167 	ld a,#rx1_queue
      008868 72 13 50         [ 1]  168 	add a,rx1_head 
      00886B 5F               [ 1]  169 	clrw x  
      00886C 20               [ 1]  170 	ld xl,a 
      00886D 39               [ 1]  171 	ld a,(x)
      00886E 88               [ 1]  172 	push a
      00886E CD 87 2B         [ 1]  173 	ld a,rx1_head 
      008871 90               [ 1]  174 	inc a 
      008872 A3 48            [ 1]  175 	and a,#RX_QUEUE_SIZE-1
      008874 00 2B 08         [ 1]  176 	ld rx1_head,a 
      008877 90               [ 1]  177 	pop a  
      008878 A3               [ 2]  178 	popw x
      008879 48               [ 4]  179 	ret 
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
      00887A 80 2A 02 03 02 82 46   194 convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',KEY_END,'3',SUP,0,0
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
      00887F                        207 get_escape:
      00887F 0D 02 27         [ 4]  208     call getc 
      008882 08 72            [ 1]  209     cp a,#'[ ; this character is expected after ESC 
      008884 1E 50            [ 1]  210     jreq 1$
      008886 5B               [ 1]  211     clr a
      008887 72               [ 4]  212     ret
      008888 1F 50 5C         [ 4]  213 1$: call getc 
      00888B AE 09 3B         [ 2]  214     ldw x,#convert_table
      000956                        215 2$:
      00888B 7B               [ 1]  216     cp a,(x)
      00888C 01 92            [ 1]  217     jreq 4$
      00888E A7 00 19         [ 2]  218     addw x,#2
      008891 0D               [ 1]  219     tnz (x)
      008892 02 27            [ 1]  220     jrne 2$
      008894 08               [ 1]  221     clr a
      008895 5C               [ 4]  222     ret 
      008896 7B               [ 1]  223 4$: incw x 
      008897 01               [ 1]  224     ld a,(x)
      008898 43 92            [ 1]  225     cp a,#SUP
      00889A A7 00            [ 1]  226     jrne 5$
      00889C 19               [ 1]  227     push a 
      00889D 72 05 50         [ 4]  228     call getc
      0088A0 5F               [ 1]  229     pop a 
      00096C                        230 5$:
      0088A1 FB               [ 4]  231     ret 
                                    232 
                                    233 
                                    234 ;-----------------------------
                                    235 ; send an ASCIZ string to UART1 
                                    236 ; input: 
                                    237 ;   x 		char * 
                                    238 ; output:
                                    239 ;   none 
                                    240 ;-------------------------------
      00096D                        241 puts::
      0088A2 72               [ 1]  242     ld a,(x)
      0088A3 0D 50            [ 1]  243 	jreq 1$
      0088A5 5F FB 10         [ 4]  244 	call putc 
      0088A7 5C               [ 1]  245 	incw x 
      0088A7 5B 02            [ 2]  246 	jra puts 
      0088A9 90               [ 4]  247 1$:	ret 
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
      000977                        258 bksp:
      0088AA 85 81            [ 1]  259 	ld a,#BS 
      0088AC CD 09 10         [ 4]  260 	call putc 
      0088AC 88 52            [ 1]  261 	ld a,#SPACE 
      0088AE 02 1F 01         [ 4]  262 	call putc 
      0088B1 1E 06            [ 1]  263 	ld a,#BS 
      0088B3 27 13 1E         [ 4]  264 	call putc 
      0088B6 01               [ 4]  265 	ret 
                                    266 ;---------------------------
                                    267 ; delete n character left of cursor 
                                    268 ; at terminal.
                                    269 ; input: 
                                    270 ;   A   number of characters to delete.
                                    271 ; output:
                                    272 ;    none 
                                    273 ;--------------------------	
      000987                        274 delete_nchar:
      0088B7 90               [ 1]  275 	push a 
      0088B8 F6 CD            [ 1]  276 0$:	tnz (1,sp)
      0088BA 88 32            [ 1]  277 	jreq 1$
      0088BC 5C 90 5C         [ 4]  278 	call bksp 
      0088BF 1F 01            [ 1]  279 	dec (1,sp)
      0088C1 1E 06            [ 2]  280 	jra 0$
      0088C3 5A               [ 1]  281 1$:	pop a 
      0088C4 1F               [ 4]  282 	ret
                                    283 
                                    284 ;--------------------------
                                    285 ; send ANSI escape sequence
                                    286 ; ANSI: ESC[
                                    287 ; note: ESC is ASCII 27
                                    288 ;       [   is ASCII 91  
                                    289 ;-------------------------- 
      000995                        290 send_escape:
      0088C5 06 26            [ 1]  291 	ld a,#ESC 
      0088C7 ED 09 10         [ 4]  292 	call putc 
      0088C8 A6 5B            [ 1]  293 	ld a,#'[
      0088C8 1E 01 CD         [ 4]  294 	call putc 
      0088CB 89               [ 4]  295 	ret 
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
      0009A0                        311 send_parameter:
      0088CC 02               [ 2]  312 	pushw x 
      0088CD 5B               [ 1]  313 	clrw x 
      0088CE 02               [ 1]  314 	ld xl,a 
      0088CF 84 81            [ 1]  315 	ld a,#10 
      0088D1 62               [ 2]  316 	div x,a 
      0088D1 90               [ 1]  317 	ld xh,a 
      0088D2 89               [ 1]  318 	ld a,xl
      0088D3 88               [ 1]  319     tnz a 
      0088D4 90 93            [ 1]  320     jreq 2$
      0088D6 5F 09            [ 1]  321 	cp a,#9 
      0088D7 23 02            [ 2]  322 	jrule 1$
      0088D7 90 F6            [ 1]  323 	ld a,#9
      0009B1                        324 1$:
      0088D9 90 5C            [ 1]  325 	add a,#'0 
      0088DB CD 88 32         [ 4]  326 	call putc
      0088DE 5C               [ 1]  327 2$:	ld a,xh 
      0088DF 0A 01            [ 1]  328 	add a,#'0
      0088E1 26 F4 84         [ 4]  329 	call putc 
      0088E4 90               [ 2]  330 	popw x 
      0088E5 85               [ 4]  331 	ret 
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
      0009BE                        344 move_left:
      0088E6 81               [ 1]  345 	push a 
      0088E7 CD 09 95         [ 4]  346 	call send_escape
      0088E7 A6               [ 1]  347     pop a
      0088E8 7F C4 00         [ 4]  348 	call send_parameter 
      0088EB 1B 27            [ 1]  349 	ld a,#'D 
      0088ED 13 CE 00         [ 4]  350 	call putc 
      0088F0 1A               [ 4]  351 	ret	
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



      0009CC                        362 move_right:
      0088F1 1C               [ 1]  363 	push a 
      0088F2 00 80 24         [ 4]  364 	call send_escape
      0088F5 04               [ 1]  365     pop a
      0088F6 72 5C 00         [ 4]  366 	call send_parameter 
      0088F9 19 9F            [ 1]  367 	ld a,#'C 
      0088FB A4 80 97         [ 4]  368 	call putc 
      0088FE CF               [ 4]  369 	ret 
                                    370 
                                    371 
                                    372 ;--------------------------
                                    373 ; print n spaces on terminal
                                    374 ; input:
                                    375 ;  X 		number of spaces 
                                    376 ; output:
                                    377 ;	none 
                                    378 ;---------------------------
      0009DA                        379 spaces::
      0088FF 00 1A            [ 1]  380 	ld a,#SPACE 
      008901 81               [ 2]  381 1$:	tnzw x
      008902 27 06            [ 1]  382 	jreq 9$
      008902 72 BB 00         [ 4]  383 	call putc 
      008905 1A               [ 2]  384 	decw x
      008906 24 04            [ 2]  385 	jra 1$
      0009E5                        386 9$: 
      008908 72               [ 4]  387 	ret 
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
      0009E6                        405 insert_char: 
      0009E6                        406 	_vars VSIZE 
      008909 5C 00            [ 2]    1     sub sp,#VSIZE 
      00890B 19 CF            [ 1]  407     ld (KCHAR,sp),a 
      00890D 00               [ 1]  408     ld a,xh 
      00890E 1A 81            [ 1]  409 	ld (IPOS,sp),a
      008910 9F               [ 1]  410     ld a,xl 
      008910 5F 92            [ 1]  411     ld (LLEN,sp),a  
      008912 AF               [ 1]  412     ldw x,y
      008913 00               [ 1]  413     incw x 
      008914 19 26            [ 1]  414     ld a,(LLEN,sp)
      008916 06 5C            [ 1]  415     sub a,(IPOS,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      008918 A3               [ 1]  416     inc a 
      008919 00 80 25         [ 1]  417     ld acc8,a 
      00891C F4 81 00 0D      [ 1]  418     clr acc16
      00891E CD 13 DE         [ 4]  419     call move
      00891E 72 0B 52 30      [ 2]  420     ldw y,#tib 
      008922 27 C6            [ 1]  421     ld a,(IPOS,sp)
      008924 52 31 A1         [ 1]  422     ld acc8,a 
      008927 03 26 06 CD      [ 2]  423     addw y,acc16 
      00892B 89 90            [ 1]  424     ld a,(KCHAR,sp)
      00892D CC 80            [ 1]  425     ld (y),a
      00892F D7 5C            [ 1]  426     incw y  
      008930 7B 01            [ 1]  427     ld a,(IPOS,sp)
      008930 A1 18 26         [ 4]  428     call move_left
      008933 03 CC 81         [ 2]  429     ldw x,#tib 
      008936 43 88 A6         [ 4]  430     call puts 
      008939 27 CB            [ 1]  431     ld a,(LLEN,sp)
      00893B 00 30            [ 1]  432     sub a,(IPOS,sp) 
      00893D 5F 97 84         [ 4]  433     call move_left 
      000A26                        434 	_drop VSIZE 
      008940 F7 C6            [ 2]    1     addw sp,#VSIZE 
      008942 00               [ 4]  435 	ret 
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
      000A29                        448 delete_under:
      000A29                        449 	_vars VSIZE 
      008943 30 4C            [ 2]    1     sub sp,#VSIZE 
      008945 A4 07            [ 1]  450     ld (LLEN,sp),a 
      008947 C7               [ 1]  451     ld a,xl 
      008948 00 30            [ 1]  452     ld (CPOS,sp),a 
      00894A 80               [ 1]  453     ldw x,y ; move destination
      00894B 90 5C            [ 1]  454     incw y  ; move source 
      00894B 72 1A            [ 1]  455     ld a,(LLEN,sp)
      00894D 50 02            [ 1]  456     sub a,(CPOS,sp)
      00894F 72               [ 1]  457     inc a ; move including zero at end.
      008950 1A 50 03         [ 1]  458     ld acc8,a 
      008953 72 1A 50 04      [ 1]  459     clr acc16 
      008957 72 14 50         [ 4]  460 	call move 
      00895A C7 AE 16 68      [ 2]  461     ldw y,#tib 
      00895B 7B 01            [ 1]  462     ld a,(CPOS,sp)
      00895B 88 A6 E1         [ 1]  463     ld acc8,a 
      00895E C1 50 C3 27      [ 2]  464     addw y,acc16 
      008962 0A               [ 1]  465     ldw x,y 
      008963 CD 09 6D         [ 4]  466     call puts 
      008963 35 05            [ 1]  467     ld a,#SPACE  
      008965 52 33 35         [ 4]  468     call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      008968 04 52            [ 1]  469     ld a,(LLEN,sp)
      00896A 32 20            [ 1]  470     sub a,(CPOS,sp)
      00896C 08 09 BE         [ 4]  471     call move_left 
      00896D 0A 02            [ 1]  472     dec (LLEN,sp)
      000A61                        473 	_drop VSIZE 
      00896D 35 0B            [ 2]    1     addw sp,#VSIZE 
      00896F 52               [ 4]  474 	ret 
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
      000A64                        486 delete_line:
      008970 33 35 08         [ 4]  487     call send_escape
      008973 52 32            [ 1]  488 	ld a,#'2
      008975 CD 09 10         [ 4]  489 	call putc 
      008975 72 5F            [ 1]  490 	ld a,#'K 
      008977 52 31 35         [ 4]  491 	call putc 
      00897A 2C               [ 4]  492 	ret 
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
      000A72                        524 readln::
      00897B 52 35            [ 2]  525 	pushw y 
      000A74                        526 	_vars VSIZE 
      00897D 72 10            [ 2]    1     sub sp,#VSIZE 
      00897F 52               [ 1]  527 	clrw x 
      008980 35 72            [ 2]  528 	ldw (LL,sp),x 
      008982 0D 52            [ 2]  529 	ldw (CPOS,sp),x 
      008984 30 FB            [ 1]  530 	cpl (OVRWR,sp) ; default to overwrite mode 
      008986 72 5F 00 2F      [ 2]  531  	ldw y,#tib ; terminal input buffer
      000A81                        532 readln_loop:
      00898A 72 5F 00         [ 4]  533 	call getc
      00898D 30 84            [ 1]  534 	ld (RXCHAR,sp),a
      00898F 81 1B            [ 1]  535     cp a,#ESC 
      008990 26 05            [ 1]  536     jrne 0$
      008990 CD 09 47         [ 4]  537     call get_escape 
      008990 72 0F            [ 1]  538     ld (RXCHAR,sp),a 
      008992 52 30            [ 1]  539 0$:	cp a,#CR
      008994 FB C7            [ 1]  540 	jrne 1$
      008996 52 31 81         [ 2]  541 	jp readln_quit
      008999 A1 0A            [ 1]  542 1$:	cp a,#LF 
      008999 26 03            [ 1]  543 	jrne 2$ 
      008999 C6 00 2F         [ 2]  544 	jp readln_quit
      000A9D                        545 2$:
      00899C C0 00            [ 1]  546 	cp a,#BS
      00899E 30 81            [ 1]  547 	jrne 3$
                                    548 ; delete left 
      0089A0 0D 03            [ 1]  549     tnz (CPOS,sp)
      0089A0 27 DC            [ 1]  550     jreq readln_loop 
      0089A0 CD 89            [ 1]  551     ld a,#1 
      0089A2 99 27 FB         [ 4]  552     call move_left
      0089A5 89 A6            [ 1]  553     dec (CPOS,sp)
      0089A7 27 CB            [ 2]  554     decw y 
      0089A9 00 2F            [ 1]  555     ld a,(CPOS,sp) 
      0089AB 5F 97 F6         [ 2]  556     jp 12$
      000AB3                        557 3$:
      0089AE 88 C6            [ 1]  558 	cp a,#CTRL_D
      0089B0 00 2F            [ 1]  559 	jrne 4$
                                    560 ;delete line 
      0089B2 4C A4 07         [ 4]  561 	call delete_line 
      0089B5 C7 00            [ 1]  562     ld a,(CPOS,sp)
      0089B7 2F               [ 1]  563     inc a 
      0089B8 84 85 81         [ 4]  564     call move_left 
      0089BB 43 81            [ 1]  565 	ld a,#'> 
      0089BD 44 80 48         [ 4]  566 	call putc 
      0089C0 82 46 83 33      [ 2]  567 	ldw y,#tib
      0089C4 84 00            [ 1]  568 	clr (y)
      0089C6 00 02            [ 1]  569 	clr (LL,sp)
      0089C7 0F 03            [ 1]  570 	clr (CPOS,sp)
      0089C7 CD 89            [ 2]  571 	jra readln_loop
      000AD1                        572 4$:
      0089C9 A0 A1            [ 1]  573 	cp a,#CTRL_R 
      0089CB 5B 27            [ 1]  574 	jrne 5$
                                    575 ;repeat line 
      0089CD 02 4F            [ 1]  576 	tnz (LL,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      0089CF 81 CD            [ 1]  577 	jrne readln_loop
      0089D1 89 A0 AE 89      [ 2]  578 	ldw y,#tib 
      0089D5 BB               [ 1]  579 	ldw x,y
      0089D6 CD 13 B2         [ 4]  580 	call strlen
      0089D6 F1               [ 1]  581 	tnz a  
      0089D7 27 08            [ 1]  582 	jreq readln_loop
      0089D9 1C 00            [ 1]  583 	ld (LL,sp),a 
      0089DB 02 7D            [ 1]  584     ld (CPOS,sp),a
      0089DD 26               [ 1]  585 	ldw x,y  
      0089DE F7 4F 81         [ 4]  586 	call puts
      0089E1 5C F6            [ 1]  587 	clr (LL_HB,sp)
      0089E3 A1 84 26         [ 2]  588 	addw y,(LL_HB,sp)
      0089E6 05 88            [ 2]  589 	jra readln_loop 
      000AF3                        590 5$:
      0089E8 CD 89            [ 1]  591 	cp a,#CTRL_E 
      0089EA A0 84            [ 1]  592 	jrne 6$
                                    593 ;edit line number 
      0089EC AE 16 68         [ 2]  594 	ldw x,#tib 
      0089EC 81 18 66         [ 4]  595 	call atoi24
      0089ED CE 00 0D         [ 2]  596 	ldw x,acc16
      0089ED F6 27 06         [ 4]  597 	call search_lineno
      0089F0 CD               [ 2]  598 	tnzw x 
      0089F1 89 90            [ 1]  599 	jrne 51$
                                    600 ;	clr (LL,sp)
                                    601 ;	ldw y,#tib
                                    602 ;   clr (y) 	
      0089F3 5C 20 F7         [ 2]  603 	jp readln_quit  
      000B09                        604 51$:
      0089F6 81 00 04         [ 2]  605 	ldw basicptr,x
      0089F7 E6 02            [ 1]  606 	ld a,(2,x)
      0089F7 A6 08 CD         [ 1]  607 	ld count,a 
      0089FA 89 90 A6 20      [ 2]  608 	ldw y,#tib 
      0089FE CD 89 90         [ 4]  609 	call decompile 
      008A01 A6 08            [ 1]  610 	clr (LL_HB,sp)
      008A03 CD 89            [ 1]  611 	ld a,#CR 
      008A05 90 81 10         [ 4]  612 	call putc 
      008A07 A6 3E            [ 1]  613 	ld a,#'>
      008A07 88 0D 01         [ 4]  614 	call putc
      008A0A 27 07 CD         [ 2]  615     ldw x,#tib  
      008A0D 89 F7 0A         [ 4]  616 	call strlen 
      008A10 01 20            [ 1]  617 	ld (LL,sp),a 
      008A12 F5 84 81         [ 4]  618 	call puts 
      008A15 90 93            [ 1]  619 	ldw y,x
      008A15 A6 1B            [ 1]  620     ld a,(LL,sp)
      008A17 CD 89            [ 1]  621     ld (CPOS,sp),a  
      008A19 90 A6 5B         [ 2]  622 	jp readln_loop
      000B38                        623 6$:
      008A1C CD 89            [ 1]  624 	cp a,#ARROW_RIGHT
      008A1E 90 81            [ 1]  625    	jrne 7$ 
                                    626 ; right arrow
      008A20 7B 03            [ 1]  627 	ld a,(CPOS,sp)
      008A20 89 5F            [ 1]  628     cp a,(LL,sp)
      008A22 97 A6            [ 1]  629     jrmi 61$
      008A24 0A 62 95         [ 2]  630     jp readln_loop 
      000B45                        631 61$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      008A27 9F 4D            [ 1]  632     ld a,#1 
      008A29 27 0B A1         [ 4]  633 	call move_right 
      008A2C 09 23            [ 1]  634 	inc (CPOS,sp)
      008A2E 02 A6            [ 1]  635     incw y 
      008A30 09 0A 81         [ 2]  636     jp readln_loop 
      008A31 A1 80            [ 1]  637 7$: cp a,#ARROW_LEFT  
      008A31 AB 30            [ 1]  638 	jrne 8$
                                    639 ; left arrow 
      008A33 CD 89            [ 1]  640 	tnz (CPOS,sp)
      008A35 90 9E            [ 1]  641 	jrne 71$
      008A37 AB 30 CD         [ 2]  642 	jp readln_loop
      000B5C                        643 71$:
      008A3A 89 90            [ 1]  644     ld a,#1 
      008A3C 85 81 BE         [ 4]  645 	call move_left 
      008A3E 0A 03            [ 1]  646 	dec (CPOS,sp)
      008A3E 88 CD            [ 2]  647     decw y 
      008A40 8A 15 84         [ 2]  648 	jp readln_loop 
      008A43 CD 8A            [ 1]  649 8$: cp a,#HOME  
      008A45 20 A6            [ 1]  650 	jrne 9$
                                    651 ; HOME 
      008A47 44 CD            [ 1]  652     ld a,(CPOS,sp)
      008A49 89 90 81         [ 4]  653     call move_left 
      008A4C 0F 03            [ 1]  654 	clr (CPOS,sp)
      008A4C 88 CD 8A 15      [ 2]  655     ldw y,#tib 
      008A50 84 CD 8A         [ 2]  656 	jp readln_loop  
      008A53 20 A6            [ 1]  657 9$: cp a,#KEY_END  
      008A55 43 CD            [ 1]  658 	jrne 10$
                                    659 ; KEY_END 
      008A57 89 90            [ 1]  660 	ld a,(CPOS,sp)
      008A59 81 02            [ 1]  661 	cp a,(LL,sp)
      008A5A 26 03            [ 1]  662 	jrne 91$
      008A5A A6 20 5D         [ 2]  663 	jp readln_loop 
      000B87                        664 91$:
      008A5D 27 06            [ 1]  665 	ld a,(LL,sp)
      008A5F CD 89            [ 1]  666 	sub a,(CPOS,sp)
      008A61 90 5A 20         [ 4]  667 	call move_right 
      008A64 F7 02            [ 1]  668 	ld a,(LL,sp)
      008A65 6B 03            [ 1]  669 	ld (CPOS,sp),a
      008A65 81 AE 16 68      [ 2]  670     ldw y,#tib
      008A66 72 5F 00 0D      [ 1]  671     clr acc16 
      008A66 52 03 6B         [ 1]  672     ld acc8,a 
      008A69 02 9E 6B 01      [ 2]  673     addw y,acc16  
      008A6D 9F 6B 03         [ 2]  674 	jp readln_loop 
      008A70 93 5C            [ 1]  675 10$: cp a,#CTRL_O
      008A72 7B 03            [ 1]  676 	jrne 11$ 
                                    677 ; toggle between insert/overwrite
      008A74 10 01            [ 1]  678 	cpl (OVRWR,sp)
      008A76 4C C7 00         [ 4]  679 	call beep_1khz
      008A79 0F 72 5F         [ 2]  680 	jp readln_loop 
      008A7C 00 0E            [ 1]  681 11$: cp a,#SUP 
      008A7E CD 94            [ 1]  682     jrne final_test 
                                    683 ; del character under cursor 
      008A80 5E 90            [ 1]  684     ld a,(CPOS,sp)
      008A82 AE 16            [ 1]  685     cp a,(LL,sp)
      008A84 68 7B            [ 1]  686     jrpl 13$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      000BBA                        687 12$:
      008A86 01               [ 1]  688     ld xl,a    ; cursor position 
      008A87 C7 00            [ 1]  689     ld a,(LL,sp)  ; line length
      008A89 0F 72 B9         [ 4]  690     call delete_under
      008A8C 00 0E            [ 1]  691     dec (LLEN,sp)
      000BC2                        692 13$:
      008A8E 7B 02 90         [ 2]  693     jp readln_loop 
      000BC5                        694 final_test:
      008A91 F7 90            [ 1]  695 	cp a,#SPACE
      008A93 5C 7B            [ 1]  696 	jrpl accept_char
      008A95 01 CD 8A         [ 2]  697 	jp readln_loop
      000BCC                        698 accept_char:
      008A98 3E AE            [ 1]  699 	ld a,#TIB_SIZE-1
      008A9A 16 68            [ 1]  700 	cp a, (LL,sp)
      008A9C CD 89            [ 1]  701 	jrpl 1$
      008A9E ED 7B 03         [ 2]  702 	jp readln_loop
      008AA1 10 01            [ 1]  703 1$:	tnz (OVRWR,sp)
      008AA3 CD 8A            [ 1]  704 	jrne overwrite
                                    705 ; insert mode 
      008AA5 3E 5B            [ 1]  706     ld a,(CPOS,sp)
      008AA7 03 81            [ 1]  707     cp a,(LL,sp)
      008AA9 27 12            [ 1]  708     jreq overwrite
      008AA9 52 02            [ 1]  709     ld a,(LL,sp)
      008AAB 6B               [ 1]  710     ld xl,a 
      008AAC 02 9F            [ 1]  711     ld a,(CPOS,sp)
      008AAE 6B               [ 1]  712     ld xh,a
      008AAF 01 93            [ 1]  713     ld a,(RXCHAR,sp)
      008AB1 90 5C 7B         [ 4]  714     call insert_char
      008AB4 02 10            [ 1]  715     inc (LLEN,sp)
      008AB6 01 4C            [ 1]  716     inc (CPOS,sp)	
      008AB8 C7 00 0F         [ 2]  717     jp readln_loop 
      000BF1                        718 overwrite:
      008ABB 72 5F            [ 1]  719 	ld a,(RXCHAR,sp)
      008ABD 00 0E            [ 1]  720 	ld (y),a
      008ABF CD 94            [ 1]  721     incw y
      008AC1 5E 90 AE         [ 4]  722     call putc 
      008AC4 16 68            [ 1]  723 	ld a,(CPOS,sp)
      008AC6 7B 01            [ 1]  724 	cp a,(LL,sp)
      008AC8 C7 00            [ 1]  725 	jrmi 1$
      008ACA 0F 72            [ 1]  726 	clr (y)
      008ACC B9 00            [ 1]  727 	inc (LL,sp)
      008ACE 0E 93            [ 1]  728     inc (CPOS,sp)
      008AD0 CD 89 ED         [ 2]  729 	jp readln_loop 
      000C09                        730 1$:	
      008AD3 A6 20            [ 1]  731 	inc (CPOS,sp)
      008AD5 CD 89 90         [ 2]  732 	jp readln_loop 
      000C0E                        733 readln_quit:
      008AD8 7B 02 10 01      [ 2]  734 	ldw y,#tib
      008ADC CD 8A            [ 1]  735     clr (LL_HB,sp) 
      008ADE 3E 0A 02         [ 2]  736     addw y,(LL_HB,sp)
      008AE1 5B 02            [ 1]  737     clr (y)
      008AE3 81 02            [ 1]  738 	ld a,(LL,sp)
      008AE4 C7 00 03         [ 1]  739 	ld count,a 
      008AE4 CD 8A            [ 1]  740 	ld a,#CR
      008AE6 15 A6 32         [ 4]  741 	call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      000C23                        742 	_drop VSIZE 
      008AE9 CD 89            [ 2]    1     addw sp,#VSIZE 
      008AEB 90 A6            [ 2]  743 	popw y 
      008AED 4B               [ 4]  744 	ret
                                    745 
                                    746 ;------------------------------
                                    747 ; print byte  in hexadecimal 
                                    748 ; on console
                                    749 ; input:
                                    750 ;    A		byte to print
                                    751 ;------------------------------
      000C28                        752 print_hex::
      008AEE CD               [ 1]  753 	push a 
      008AEF 89               [ 1]  754 	swap a 
      008AF0 90 81 3F         [ 4]  755 	call to_hex_char 
      008AF2 CD 09 10         [ 4]  756 	call putc 
      008AF2 90 89            [ 1]  757     ld a,(1,sp) 
      008AF4 52 04 5F         [ 4]  758 	call to_hex_char
      008AF7 1F 02 1F         [ 4]  759 	call putc
      008AFA 03 03            [ 1]  760 	ld a,#SPACE 
      008AFC 04 90 AE         [ 4]  761 	call putc 
      008AFF 16               [ 1]  762 	pop a 
      008B00 68               [ 4]  763 	ret 
                                    764 
                                    765 ;----------------------------------
                                    766 ; convert to hexadecimal digit 
                                    767 ; input:
                                    768 ;   A       digit to convert 
                                    769 ; output:
                                    770 ;   A       hexdecimal character 
                                    771 ;----------------------------------
      008B01                        772 to_hex_char::
      008B01 CD 89            [ 1]  773 	and a,#15 
      008B03 A0 6B            [ 1]  774 	cp a,#9 
      008B05 01 A1            [ 2]  775 	jrule 1$ 
      008B07 1B 26            [ 1]  776 	add a,#7
      008B09 05 CD            [ 1]  777 1$: add a,#'0 
      008B0B 89               [ 4]  778 	ret 
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
      000C4A                         51 search_lineno::
      000C4A                         52 	_vars VSIZE
      008B0C C7 6B            [ 2]    1     sub sp,#VSIZE 
      008B0E 01 A1            [ 1]   53 	clr (LL,sp)
      008B10 0D 26 03 CC      [ 2]   54 	ldw y,txtbgn
      008B14 8C               [ 1]   55 	tnz a 
      008B15 8E A1            [ 1]   56 	jreq search_ln_loop
      008B17 0A 26 03 CC      [ 2]   57 	ldw y,basicptr 
      000C59                         58 search_ln_loop:
      008B1B 8C 8E 00 1D      [ 2]   59 	cpw y,txtend 
      008B1D 2A 10            [ 1]   60 	jrpl 8$
      008B1D A1 08            [ 1]   61 	cpw x,(y)
      008B1F 26 12            [ 1]   62 	jreq 9$
      008B21 0D 03            [ 1]   63 	jrmi 8$ 
      008B23 27 DC A6         [ 1]   64 	ld a,(2,y)
      008B26 01 CD            [ 1]   65 	ld (LB,sp),a 
      008B28 8A 3E 0A         [ 2]   66 	addw y,(LL,sp)
      008B2B 03 90            [ 2]   67 	jra search_ln_loop 
      000C6F                         68 8$: 
      008B2D 5A               [ 1]   69 	clrw x 	
      008B2E 7B               [ 1]   70 	exgw x,y 
      000C71                         71 9$: _drop VSIZE
      008B2F 03 CC            [ 2]    1     addw sp,#VSIZE 
      008B31 8C               [ 1]   72 	exgw x,y   
      008B32 3A               [ 4]   73 	ret 
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
      008B33                         83 del_line: 
      000C75                         84 	_vars VSIZE 
      008B33 A1 04            [ 2]    1     sub sp,#VSIZE 
      008B35 26 1A            [ 1]   85 	ld a,(2,x) ; line length
      008B37 CD 8A            [ 1]   86 	ld (LLEN+1,sp),a 
      008B39 E4 7B            [ 1]   87 	clr (LLEN,sp)
      008B3B 03 4C            [ 1]   88 	ldw y,x  
      008B3D CD 8A 3E         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      008B40 A6 3E            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      008B42 CD 89 90 90      [ 2]   91 	ldw y,txtend 
      008B46 AE 16 68         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      008B49 90 7F 0F 02      [ 2]   93 	ldw acc16,y 
      008B4D 0F 03            [ 2]   94 	ldw y,(SRC,sp)    ; source
      008B4F 20 B0 DE         [ 4]   95 	call move
      008B51 90 CE 00 1D      [ 2]   96 	ldw y,txtend 
      008B51 A1 12 26         [ 2]   97 	subw y,(LLEN,sp)
      008B54 1E 0D 02 26      [ 2]   98 	ldw txtend,y  
      000C9F                         99 	_drop VSIZE     
      008B58 A8 90            [ 2]    1     addw sp,#VSIZE 
      008B5A AE               [ 4]  100 	ret 
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
      000CA2                        115 create_gap:
      000CA2                        116 	_vars VSIZE
      008B5B 16 68            [ 2]    1     sub sp,#VSIZE 
      008B5D 93 CD            [ 2]  117 	ldw (SRC,sp),x 
      008B5F 94 32            [ 2]  118 	ldw (LEN,sp),y 
      008B61 4D 27 9D 6B      [ 2]  119 	ldw acc16,y 
      008B65 02 6B            [ 1]  120 	ldw y,x ; SRC
      008B67 03 93 CD 89      [ 2]  121 	addw x,acc16  
      008B6B ED 0F            [ 2]  122 	ldw (DEST,sp),x 
                                    123 ;compute size to move 	
      008B6D 01 72 F9         [ 2]  124 	ldw x,txtend 
      008B70 01 20 8E         [ 2]  125 	subw x,(SRC,sp)
      008B73 CF 00 0D         [ 2]  126 	ldw acc16,x ; size to move
      008B73 A1 05            [ 2]  127 	ldw x,(DEST,sp) 
      008B75 26 41 AE         [ 4]  128 	call move
      008B78 16 68 CD         [ 2]  129 	ldw x,txtend
      008B7B 98 E6 CE         [ 2]  130 	addw x,(LEN,sp)
      008B7E 00 0E CD         [ 2]  131 	ldw txtend,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      000CCB                        132 9$:	_drop VSIZE 
      008B81 8C CA            [ 2]    1     addw sp,#VSIZE 
      008B83 5D               [ 4]  133 	ret 
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
      000CCE                        150 insert_line:
      000CCE                        151 	_vars VSIZE 
      008B84 26 03            [ 2]    1     sub sp,#VSIZE 
      008B86 CC 8C 8E         [ 2]  152 	ldw x,txtend  
      008B89 C3 00 1B         [ 2]  153 	cpw x,txtbgn 
      008B89 CF 00            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      008B8B 05 E6 02         [ 2]  156 	ldw x,#2 
      008B8E C7 00 04 90      [ 4]  157 	ld a,([ptr16],x)
      008B92 AE 16            [ 1]  158 	cp a,#3
      008B94 68 CD            [ 1]  159 	jreq insert_ln_exit
      008B96 92               [ 1]  160 	clrw x 
      008B97 48               [ 1]  161 	ld xl,a
      008B98 0F 01            [ 2]  162 	ldw (LLEN,sp),x 
      008B9A A6 0D CD         [ 2]  163 	ldw x,txtbgn
      008B9D 89 90            [ 2]  164 	ldw (DEST,sp),x 
      008B9F A6 3E CD         [ 2]  165 	ldw x,txtend 
      008BA2 89 90            [ 2]  166 	jra 4$
      008BA4 AE 16 68 CD      [ 5]  167 0$:	ldw x,[ptr16]
                                    168 ; line number
      008BA8 94 32            [ 2]  169 	ldw (LINENO,sp),x 
      008BAA 6B 02 CD         [ 2]  170 	ldw x,#2 
      008BAD 89 ED 90 93      [ 4]  171 	ld a,([ptr16],x)
      008BB1 7B               [ 1]  172 	ld xl,a
                                    173 ; line length
      008BB2 02 6B            [ 2]  174 	ldw (LLEN,sp),x
                                    175 ; check if that line number already exit 	
      008BB4 03 CC            [ 2]  176 	ldw x,(LINENO,sp)
      008BB6 8B               [ 1]  177 	clr a 
      008BB7 01 0C 4A         [ 4]  178 	call search_lineno 
      008BB8 5D               [ 2]  179 	tnzw x 
      008BB8 A1 81            [ 1]  180 	jrne 2$
                                    181 ; line doesn't exit
                                    182 ; it will be inserted at this point.  	
      008BBA 26 15            [ 2]  183 	ldw (DEST,sp),y 
      008BBC 7B 03            [ 2]  184 	jra 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                    185 ; line exit delete it.
                                    186 ; it will be replaced by new one 	
      008BBE 11 02            [ 2]  187 2$: ldw (DEST,sp),x 
      008BC0 2B 03 CC         [ 4]  188 	call del_line
      000D13                        189 3$: 
                                    190 ; insert new line or leave if LLEN==3
                                    191 ; LLEN==3 means empty line 
      008BC3 8B 01            [ 1]  192 	ld a,#3
      008BC5 11 08            [ 1]  193 	cp a,(LLEN+1,sp)
      008BC5 A6 01            [ 1]  194 	jreq insert_ln_exit ; empty line exit.
                                    195 ; if insertion point at txtend 
                                    196 ; move no need to create a gap 
      008BC7 CD 8A            [ 2]  197 	ldw x,(DEST,sp)
      008BC9 4C 0C 03         [ 2]  198 	cpw x,txtend 
      008BCC 90 5C            [ 1]  199 	jreq 4$ 
                                    200 ; must create a gap
                                    201 ; at insertion point  
      008BCE CC 8B            [ 2]  202 	ldw x,(DEST,sp)
      008BD0 01 A1            [ 2]  203 	ldw y,(LLEN,sp)
      008BD2 80 26 13         [ 4]  204 	call create_gap
      008BD5 0D 03            [ 2]  205 	jra 5$
      000D29                        206 4$: 
      008BD7 26 03 CC         [ 2]  207 	addw x,(LLEN,sp)
      008BDA 8B 01 1D         [ 2]  208 	ldw txtend,x 	 
                                    209 ; move new line in gap 
      008BDC 1E 07            [ 2]  210 5$:	ldw x,(LLEN,sp)
      008BDC A6 01 CD         [ 2]  211 	ldw acc16,x 
      008BDF 8A 3E 0A 03      [ 2]  212 	ldw y,#pad ;SRC 
      008BE3 90 5A            [ 2]  213 	ldw x,(DEST,sp) ; dest address 
      008BE5 CC 8B 01         [ 4]  214 	call move 
      000D3D                        215 insert_ln_exit:	
      000D3D                        216 	_drop VSIZE
      008BE8 A1 82            [ 2]    1     addw sp,#VSIZE 
      008BEA 26               [ 4]  217 	ret
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
      000D40                        233 parse_quote: 
      000D40                        234 	_vars VSIZE 
      008BEB 0E 7B            [ 2]    1     sub sp,#VSIZE 
      008BED 03               [ 1]  235 	clr a
      008BEE CD 8A            [ 1]  236 1$:	ld (PREV,sp),a 
      000D45                        237 2$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      008BF0 3E 0F 03         [ 4]  238 	ld a,([in.w],y)
      008BF3 90 AE            [ 1]  239 	jreq 6$
      008BF5 16 68 CC 8B      [ 1]  240 	inc in 
      008BF9 01 A1            [ 1]  241 	ld (CURR,sp),a 
      008BFB 83 26            [ 1]  242 	ld a,#'\
      008BFD 26 7B            [ 1]  243 	cp a, (PREV,sp)
      008BFF 03 11            [ 1]  244 	jrne 3$
      008C01 02 26            [ 1]  245 	clr (PREV,sp)
      008C03 03 CC            [ 1]  246 	ld a,(CURR,sp)
      008C05 8B 01            [ 4]  247 	callr convert_escape
      008C07 F7               [ 1]  248 	ld (x),a 
      008C07 7B               [ 1]  249 	incw x 
      008C08 02 10            [ 2]  250 	jra 2$
      000D60                        251 3$:
      008C0A 03 CD            [ 1]  252 	ld a,(CURR,sp)
      008C0C 8A 4C            [ 1]  253 	cp a,#'\'
      008C0E 7B 02            [ 1]  254 	jreq 1$
      008C10 6B 03            [ 1]  255 	cp a,#'"
      008C12 90 AE            [ 1]  256 	jreq 6$ 
      008C14 16               [ 1]  257 	ld (x),a 
      008C15 68               [ 1]  258 	incw x 
      008C16 72 5F            [ 2]  259 	jra 2$
      000D6E                        260 6$:
      008C18 00               [ 1]  261 	clr (x)
      008C19 0E               [ 1]  262 	incw x 
      008C1A C7 00            [ 1]  263 	ldw y,x 
      008C1C 0F               [ 1]  264 	clrw x 
      008C1D 72 B9            [ 1]  265 	ld a,#TK_QSTR  
      000D75                        266 	_drop VSIZE
      008C1F 00 0E            [ 2]    1     addw sp,#VSIZE 
      008C21 CC               [ 4]  267 	ret 
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
      000D78                        278 convert_escape:
      008C22 8B               [ 2]  279 	pushw x 
      008C23 01 A1 0F         [ 2]  280 	ldw x,#escaped 
      008C26 26               [ 1]  281 1$:	cp a,(x)
      008C27 08 03            [ 1]  282 	jreq 2$
      008C29 04               [ 1]  283 	tnz (x)
      008C2A CD A5            [ 1]  284 	jreq 3$
      008C2C E4               [ 1]  285 	incw x 
      008C2D CC 8B            [ 2]  286 	jra 1$
      008C2F 01 A1 84         [ 2]  287 2$: subw x,#escaped 
      008C32 26               [ 1]  288 	ld a,xl 
      008C33 11 7B            [ 1]  289 	add a,#7
      008C35 03               [ 2]  290 3$:	popw x 
      008C36 11               [ 4]  291 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                    292 
      008C37 02 2A 08 6E 76 66 72   293 escaped:: .asciz "abtnvfr"
             00
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
      008C3A                        310 parse_integer: ; { -- n }
      008C3A 97               [ 2]  311 	pushw x 	
      008C3B 7B 02            [ 1]  312 	push #0 ; TCHAR
      008C3D CD 8A            [ 1]  313 	push #10 ; BASE=10
      008C3F A9 0A            [ 1]  314 	cp a,#'$
      008C41 02 04            [ 1]  315 	jrne 2$ 
      008C42                        316     _drop #1
      008C42 CC 8B            [ 2]    1     addw sp,##1 
      008C44 01 10            [ 1]  317 	push #16  ; BASE=16
      008C45 F7               [ 1]  318 2$:	ld (x),a 
      008C45 A1               [ 1]  319 	incw x 
      008C46 20 2A 03         [ 4]  320 	ld a,([in.w],y)
      008C49 CC 8B 01 01      [ 1]  321 	inc in 
      008C4C CD 18 5A         [ 4]  322 	call to_upper 
      008C4C A6 4F            [ 1]  323 	ld (TCHAR,sp),a 
      008C4E 11 02 2A         [ 4]  324 	call is_digit 
      008C51 03 CC            [ 1]  325 	jrc 2$
      008C53 8B 01            [ 1]  326 	ld a,#16 
      008C55 0D 04            [ 1]  327 	cp a,(BASE,sp)
      008C57 26 18            [ 1]  328 	jrne 3$ 
      008C59 7B 03            [ 1]  329 	ld a,(TCHAR,sp)
      008C5B 11 02            [ 1]  330 	cp a,#'A 
      008C5D 27 12            [ 1]  331 	jrmi 3$ 
      008C5F 7B 02            [ 1]  332 	cp a,#'G 
      008C61 97 7B            [ 1]  333 	jrmi 2$ 
      008C63 03 95 7B 01      [ 1]  334 3$: dec in 	
      008C67 CD               [ 1]  335     clr (x)
      008C68 8A 66            [ 2]  336 	ldw x,(XSAVE,sp)
      008C6A 0C 02 0C         [ 4]  337 	call atoi24
      008C6D 03 CC            [ 2]  338 	ldw y,(XSAVE,sp)
      008C6F 8B 01 0C         [ 1]  339 	ld a,acc24 
      008C71 90 F7            [ 1]  340 	ld (y),a 
      008C71 7B 01            [ 1]  341 	incw y  
      008C73 90 F7 90         [ 2]  342 	ldw x,acc16 
      008C76 5C CD            [ 2]  343 	ldw (y),x 
      008C78 89 90 7B 03      [ 2]  344 	addw y,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      008C7C 11 02            [ 1]  345 	ld a,#TK_INTGR
      000DE3                        346 	_drop VSIZE  
      008C7E 2B 09            [ 2]    1     addw sp,#VSIZE 
      008C80 90               [ 4]  347 	ret 	
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
      000DE6                        364 parse_binary: ; { -- n }
      008C81 7F 0C            [ 1]  365 	push #0
      008C83 02 0C            [ 1]  366 	push #0
      008C85 03 CC            [ 1]  367 	push #0
      000DEC                        368 2$:	
      008C87 8B 01 00         [ 4]  369 	ld a,([in.w],y)
      008C89 72 5C 00 01      [ 1]  370 	inc in 
      008C89 0C 03            [ 1]  371 	cp a,#'0 
      008C8B CC 8B            [ 1]  372 	jreq 3$
      008C8D 01 31            [ 1]  373 	cp a,#'1 
      008C8E 27 02            [ 1]  374 	jreq 3$ 
      008C8E 90 AE            [ 2]  375 	jra bin_exit 
      008C90 16 68            [ 1]  376 3$: sub a,#'0 
      008C92 0F               [ 1]  377 	rrc a
      008C93 01 72            [ 1]  378 	rlc (BINARY+2,sp) 
      008C95 F9 01            [ 1]  379 	rlc (BINARY+1,sp)
      008C97 90 7F            [ 1]  380 	rlc (BINARY,sp) 
      008C99 7B 02            [ 2]  381 	jra 2$  
      000E08                        382 bin_exit:
      008C9B C7 00 04 A6      [ 1]  383 	dec in 
      008C9F 0D CD            [ 1]  384 	ldw y,x
      008CA1 89 90            [ 1]  385 	ld a,(BINARY,sp)
      008CA3 5B 04            [ 1]  386 	ld (y),a 
      008CA5 90 85            [ 1]  387 	incw y 
      008CA7 81 02            [ 2]  388 	ldw x,(BINARY+1,sp)
      008CA8 90 FF            [ 2]  389 	ldw (y),x 
      008CA8 88 4E CD 8C      [ 2]  390 	addw y,#2  
      008CAC BF CD            [ 1]  391 	ld a,#TK_INTGR 	
      000E1E                        392 	_drop VSIZE 
      008CAE 89 90            [ 2]    1     addw sp,#VSIZE 
      008CB0 7B               [ 4]  393 	ret
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
      000E21                        402 is_alpha::
      008CB1 01 CD            [ 1]  403 	cp a,#'A 
      008CB3 8C               [ 1]  404 	ccf 
      008CB4 BF CD            [ 1]  405 	jrnc 9$ 
      008CB6 89 90            [ 1]  406 	cp a,#'Z+1 
      008CB8 A6 20            [ 1]  407 	jrc 9$ 
      008CBA CD 89            [ 1]  408 	cp a,#'a 
      008CBC 90               [ 1]  409 	ccf 
      008CBD 84 81            [ 1]  410 	jrnc 9$
      008CBF A1 7B            [ 1]  411 	cp a,#'z+1
      008CBF A4               [ 4]  412 9$: ret 	
                                    413 
                                    414 ;------------------------------------
                                    415 ; check if character in {'0'..'9'}
                                    416 ; input:
                                    417 ;    A  character to test
                                    418 ; output:
                                    419 ;    Carry  0 not digit | 1 digit
                                    420 ;------------------------------------
      000E32                        421 is_digit::
      008CC0 0F A1            [ 1]  422 	cp a,#'0
      008CC2 09 23            [ 1]  423 	jrc 1$
      008CC4 02 AB            [ 1]  424     cp a,#'9+1
      008CC6 07               [ 1]  425 	ccf 
      008CC7 AB               [ 1]  426 1$:	ccf 
      008CC8 30               [ 4]  427     ret
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
      000E3B                        438 is_alnum::
      008CC9 81 0E 32         [ 4]  439 	call is_digit
      008CCA 25 03            [ 1]  440 	jrc 1$ 
      008CCA 52 02 0F         [ 4]  441 	call is_alpha
      008CCD 01               [ 4]  442 1$:	ret 
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



      000E44                        453 is_symbol_char: 
      008CCE 90 CE            [ 1]  454 	cp a,#'_ 
      008CD0 00 1C            [ 1]  455 	jrne 1$
      008CD2 4D               [ 1]  456 	scf 
      008CD3 27 04            [ 2]  457 	jra 9$ 
      008CD5 90 CE 00         [ 4]  458 1$:	call is_alnum 
      008CD8 05               [ 4]  459 9$: ret 
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
      008CD9                        473 parse_symbol:
      008CD9 90               [ 1]  474 	incw x ; keep space for TK_ID 
      000E50                        475 symb_loop: 
                                    476 ; symbol are converted to upper case 
      008CDA C3 00 1E         [ 4]  477 	call to_upper  
      008CDD 2A               [ 1]  478 	ld (x), a 
      008CDE 10               [ 1]  479 	incw x
      008CDF 90 F3 27         [ 4]  480 	ld a,([in.w],y)
      008CE2 0E 2B 0A 90      [ 1]  481 	inc in 
      008CE6 E6 02 6B         [ 4]  482 	call is_symbol_char 
      008CE9 02 72            [ 1]  483 	jrc symb_loop 
      008CEB F9               [ 1]  484 	clr (x)
      008CEC 01 20 EA 01      [ 1]  485 	dec in  
      008CEF 81               [ 4]  486 	ret 
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
      000E67                        502 parse_keyword: 
      008CEF 5F               [ 2]  503 	pushw x ; preserve *symbol 
      008CF0 51 5B 02         [ 4]  504 	call parse_symbol
      008CF3 51 81            [ 2]  505 	ldw x,(XFIRST,sp) 
      008CF5 E6 02            [ 1]  506 	ld a,(2,x)
      008CF5 52 04            [ 1]  507 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                    508 ; one letter variable name 
      008CF7 E6 02            [ 1]  509 	ld a,(1,x) 
      008CF9 6B 02            [ 1]  510 	sub a,#'A 
      008CFB 0F 01 90         [ 2]  511 	ldw x,#3 
      008CFE 93               [ 4]  512 	mul x,a 
      008CFF 72 F9 01         [ 2]  513 	addw x,#vars 
      008D02 17 03            [ 1]  514 	ld a,#TK_VAR 
      008D04 90 CE            [ 2]  515 	jra 4$ 
      000E80                        516 2$: ; check for keyword, otherwise syntax error.
      000E80                        517 	_ldx_dict kword_dict ; dictionary entry point
      008D06 00 1E 72         [ 2]    1     ldw x,#kword_dict+2
      008D09 F2 03            [ 2]  518 	ldw y,(XFIRST,sp) ; name to search for
      008D0B 90 CF            [ 1]  519 	incw y 
      008D0D 00 0E 16         [ 4]  520 	call search_dict
      008D10 03               [ 1]  521 	tnz a
      008D11 CD 94            [ 1]  522 	jrne 4$
                                    523 ; not in dictionary
                                    524 ; compile it as TK_LABEL
      008D13 5E 90            [ 2]  525 	ldw y,(XFIRST,sp)
      008D15 CE 00            [ 1]  526 	ld a,#TK_LABEL 
      008D17 1E 72            [ 1]  527 	ld (y),a 
      008D19 F2 01            [ 1]  528 	incw y
      008D1B 90               [ 1]  529 	ldw x,y 
      008D1C CF 00 1E         [ 4]  530 	call strlen
      008D1F 5B 04            [ 1]  531 	cp a,#15 
      008D21 81 02            [ 2]  532 	jrule 22$ 
      008D22 A6 0F            [ 1]  533 	ld a,#15
      000E9F                        534 22$:	
      008D22 52               [ 1]  535 	push a 
      000EA0                        536 24$:
      008D23 06 1F            [ 1]  537     ld a,(y)
      008D25 03 17            [ 1]  538 	jreq 3$
      008D27 05 90            [ 1]  539 	incw y
      008D29 CF 00            [ 1]  540 	dec (1,sp) 
      008D2B 0E 90            [ 1]  541 	jrne 24$
      008D2D 93               [ 1]  542 	clr a 
      008D2E 72 BB            [ 1]  543 	ld (y),a 
      008D30 00 0E            [ 1]  544 3$: incw y 
      000EAF                        545 	_drop 1 
      008D32 1F 01            [ 2]    1     addw sp,#1 
      008D34 CE 00            [ 1]  546 	ld a,#TK_LABEL 
      008D36 1E               [ 1]  547 	clrw x 	
      008D37 72 F0            [ 2]  548 	jra 5$ 
      000EB6                        549 4$:	
      008D39 03 CF            [ 2]  550 	ldw y,(XFIRST,sp)
      008D3B 00 0E            [ 1]  551 	cp a,#TK_NOT 
      008D3D 1E 01            [ 1]  552 	jrmi 41$
      008D3F CD 94            [ 1]  553 	ld (y),a 
      008D41 5E CE            [ 1]  554 	incw y 
      008D43 00 1E            [ 2]  555 	jra 5$ 
      000EC2                        556 41$:	
      008D45 72 FB 05         [ 2]  557 	cpw x,#LET_IDX 
      008D48 CF 00            [ 1]  558 	jreq 5$  ; don't compile LET command 
      008D4A 1E 5B            [ 1]  559 	ld (y),a 
      008D4C 06 81            [ 1]  560 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      008D4E 90 FF            [ 2]  561 	ldw (y),x
      008D4E 52 08 CE 00      [ 2]  562 	addw y,#2  
      000ED1                        563 5$:	_drop VSIZE 
      008D52 1E C3            [ 2]    1     addw sp,#VSIZE 
      008D54 00               [ 4]  564 	ret  	
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
      000ED4                        575 skip:
      008D55 1C               [ 1]  576 	push a
      008D56 26 19 AE         [ 4]  577 1$:	ld a,([in.w],y)
      008D59 00 02            [ 1]  578 	jreq 2$
      008D5B 72 D6            [ 1]  579 	cp a,(C,sp)
      008D5D 00 1A            [ 1]  580 	jrne 2$
      008D5F A1 03 27 5A      [ 1]  581 	inc in
      008D63 5F 97            [ 2]  582 	jra 1$
      000EE4                        583 2$: _drop 1 
      008D65 1F 07            [ 2]    1     addw sp,#1 
      008D67 CE               [ 4]  584 	ret
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
      000EE7                        609 get_token:: 
      000EE7                        610 	_vars VSIZE
      008D68 00 1C            [ 2]    1     sub sp,#VSIZE 
                                    611 ;	ld a,in 
                                    612 ;	sub a,count
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                    613 ;   jrmi 0$
                                    614 ;	clr a 
                                    615 ;	ret 
      000EE9                        616 0$: 
      008D6A 1F 01 CE 00      [ 2]  617 	ldw y,#tib    	
      008D6E 1E 20            [ 1]  618 	ld a,#SPACE
      008D70 38 72 CE         [ 4]  619 	call skip
      008D73 00 1A 1F 05 AE   [ 1]  620 	mov in.saved,in 
      008D78 00 02 72         [ 4]  621 	ld a,([in.w],y)
      008D7B D6 00            [ 1]  622 	jrne 1$
      008D7D 1A 97            [ 1]  623 	ldw y,x 
      008D7F 1F 07 1E         [ 2]  624 	jp token_exit ; end of line 
      008D82 05 4F CD 8C      [ 1]  625 1$:	inc in 
      008D86 CA 5D 26         [ 4]  626 	call to_upper 
      008D89 04 17            [ 1]  627 	ld (TCHAR,sp),a 
                                    628 ; check for quoted string
      000F0A                        629 str_tst:  	
      000F0A                        630 	_case '"' nbr_tst
      008D8B 01 20            [ 1]    1 	ld a,#'"' 
      008D8D 05 1F            [ 1]    2 	cp a,(TCHAR,sp) 
      008D8F 01 CD            [ 1]    3 	jrne nbr_tst
      008D91 8C F5            [ 1]  631 	ld a,#TK_QSTR
      008D93 F7               [ 1]  632 	ld (x),a 
      008D93 A6               [ 1]  633 	incw x 
      008D94 03 11 08         [ 4]  634 	call parse_quote
      008D97 27 24 1E         [ 2]  635 	jp token_exit
      000F1A                        636 nbr_tst:
                                    637 ; check for hexadecimal number 
      008D9A 01 C3            [ 1]  638 	ld a,#'$'
      008D9C 00 1E            [ 1]  639 	cp a,(TCHAR,sp) 
      008D9E 27 09            [ 1]  640 	jreq 1$
                                    641 ;check for binary number 
      008DA0 1E 01            [ 1]  642 	ld a,#'&
      008DA2 16 07            [ 1]  643 	cp a,(TCHAR,sp)
      008DA4 CD 8D            [ 1]  644 	jrne 0$
      008DA6 22 20            [ 1]  645 	ld a,#TK_INTGR
      008DA8 06               [ 1]  646 	ld (x),a 
      008DA9 5C               [ 1]  647 	incw x 
      008DA9 72 FB 07         [ 4]  648 	call parse_binary ; expect binary integer 
      008DAC CF 00 1E         [ 2]  649 	jp token_exit 
                                    650 ; check for decimal number 	
      008DAF 1E 07            [ 1]  651 0$:	ld a,(TCHAR,sp)
      008DB1 CF 00 0E         [ 4]  652 	call is_digit
      008DB4 90 AE            [ 1]  653 	jrnc 3$
      008DB6 16 B8            [ 1]  654 1$:	ld a,#TK_INTGR 
      008DB8 1E               [ 1]  655 	ld (x),a 
      008DB9 01               [ 1]  656 	incw x 
      008DBA CD 94            [ 1]  657 	ld a,(TCHAR,sp)
      008DBC 5E 0D 95         [ 4]  658 	call parse_integer 
      008DBD CC 10 98         [ 2]  659 	jp token_exit 
      000F43                        660 3$: 
      000F43                        661 	_case '(' bkslsh_tst 
      008DBD 5B 08            [ 1]    1 	ld a,#'(' 
      008DBF 81 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DC0 26 05            [ 1]    3 	jrne bkslsh_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      008DC0 52 02            [ 1]  662 	ld a,#TK_LPAREN
      008DC2 4F 6B 01         [ 2]  663 	jp token_char   	
      008DC5                        664 bkslsh_tst: ; character token 
      000F4E                        665 	_case '\',rparnt_tst
      008DC5 91 D6            [ 1]    1 	ld a,#'\' 
      008DC7 01 27            [ 1]    2 	cp a,(TCHAR,sp) 
      008DC9 24 72            [ 1]    3 	jrne rparnt_tst
      008DCB 5C 00            [ 1]  666 	ld a,#TK_CHAR 
      008DCD 02               [ 1]  667 	ld (x),a 
      008DCE 6B               [ 1]  668 	incw x 
      008DCF 02 A6 5C         [ 4]  669 	ld a,([in.w],y)
      008DD2 11               [ 1]  670 	ld (x),a 
      008DD3 01               [ 1]  671 	incw x
      008DD4 26 0A            [ 1]  672 	ldw y,x 	 
      008DD6 0F 01 7B 02      [ 1]  673 	inc in  
      008DDA AD               [ 1]  674 	clrw x 
      008DDB 1C               [ 1]  675 	ld xl,a 
      008DDC F7 5C            [ 1]  676 	ld a,#TK_CHAR 
      008DDE 20 E5 98         [ 2]  677 	jp token_exit 
      008DE0                        678 rparnt_tst:		
      000F6A                        679 	_case ')' colon_tst 
      008DE0 7B 02            [ 1]    1 	ld a,#')' 
      008DE2 A1 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008DE4 27 DD            [ 1]    3 	jrne colon_tst
      008DE6 A1 22            [ 1]  680 	ld a,#TK_RPAREN 
      008DE8 27 04 F7         [ 2]  681 	jp token_char
      000F75                        682 colon_tst:
      000F75                        683 	_case ':' comma_tst 
      008DEB 5C 20            [ 1]    1 	ld a,#':' 
      008DED D7 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DEE 26 05            [ 1]    3 	jrne comma_tst
      008DEE 7F 5C            [ 1]  684 	ld a,#TK_COLON 
      008DF0 90 93 5F         [ 2]  685 	jp token_char  
      000F80                        686 comma_tst:
      000F80                        687 	_case COMMA sharp_tst 
      008DF3 A6 02            [ 1]    1 	ld a,#COMMA 
      008DF5 5B 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008DF7 81 05            [ 1]    3 	jrne sharp_tst
      008DF8 A6 08            [ 1]  688 	ld a,#TK_COMMA
      008DF8 89 AE 8E         [ 2]  689 	jp token_char
      000F8B                        690 sharp_tst:
      000F8B                        691 	_case SHARP dash_tst 
      008DFB 0D F1            [ 1]    1 	ld a,#SHARP 
      008DFD 27 06            [ 1]    2 	cp a,(TCHAR,sp) 
      008DFF 7D 27            [ 1]    3 	jrne dash_tst
      008E01 09 5C            [ 1]  692 	ld a,#TK_SHARP
      008E03 20 F7 1D         [ 2]  693 	jp token_char  	 	 
      000F96                        694 dash_tst: 	
      000F96                        695 	_case '-' at_tst 
      008E06 8E 0D            [ 1]    1 	ld a,#'-' 
      008E08 9F AB            [ 1]    2 	cp a,(TCHAR,sp) 
      008E0A 07 85            [ 1]    3 	jrne at_tst
      008E0C 81 61            [ 1]  696 	ld a,#TK_MINUS  
      008E0E 62 74 6E         [ 2]  697 	jp token_char 
      000FA1                        698 at_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      000FA1                        699 	_case '@' qmark_tst 
      008E11 76 66            [ 1]    1 	ld a,#'@' 
      008E13 72 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008E15 26 05            [ 1]    3 	jrne qmark_tst
      008E15 89 4B            [ 1]  700 	ld a,#TK_ARRAY 
      008E17 00 4B 0A         [ 2]  701 	jp token_char
      000FAC                        702 qmark_tst:
      000FAC                        703 	_case '?' tick_tst 
      008E1A A1 24            [ 1]    1 	ld a,#'?' 
      008E1C 26 04            [ 1]    2 	cp a,(TCHAR,sp) 
      008E1E 5B 01            [ 1]    3 	jrne tick_tst
      008E20 4B 10            [ 1]  704 	ld a,#TK_CMD  
      008E22 F7               [ 1]  705 	ld (x),a 
      008E23 5C               [ 1]  706 	incw x 
      008E24 91 D6            [ 1]  707 	ldw y,x 
      008E26 01 72 5C         [ 2]  708 	ldw x,#PRT_IDX 
      008E29 00 02            [ 2]  709 	ldw (y),x 
      008E2B CD 98 DA 6B      [ 2]  710 	addw y,#2
      008E2F 02 CD 8E         [ 2]  711 	jp token_exit
      000FC4                        712 tick_tst: ; comment 
      000FC4                        713 	_case TICK plus_tst 
      008E32 B2 25            [ 1]    1 	ld a,#TICK 
      008E34 ED A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008E36 10 11            [ 1]    3 	jrne plus_tst
      008E38 01 26            [ 1]  714 	ld a,#TK_CMD
      008E3A 0A               [ 1]  715 	ld (x),a 
      008E3B 7B               [ 1]  716 	incw x
      008E3C 02 A1 41 2B      [ 2]  717 	ldw y,#REM_IDX
      008E40 04               [ 2]  718 	ldw (x),y 
      008E41 A1 47 2B         [ 2]  719 	addw x,#2  
      000FD6                        720 copy_comment:
      008E44 DD 72 5A 00      [ 2]  721 	ldw y,#tib 
      008E48 02 7F 1E 03      [ 2]  722 	addw y,in.w
      008E4C CD 98            [ 2]  723 	pushw y 
      008E4E E6 16 03         [ 4]  724 	call strcpy
      008E51 C6 00 0D         [ 2]  725 	subw y,(1,sp)
      008E54 90 F7            [ 1]  726 	incw y ; strlen+1 
      008E56 90 5C            [ 2]  727 	ldw (1,sp),y 
      008E58 CE 00 0E         [ 2]  728 	addw x,(1,sp) 
      000FED                        729 	_drop 2 
      008E5B 90 FF            [ 2]    1     addw sp,#2 
      008E5D 72               [ 1]  730 	clr a 
      008E5E A9 00            [ 1]  731 	ldw y,x 
      008E60 02 A6 84         [ 2]  732 	jp token_exit 
      000FF5                        733 plus_tst:
      000FF5                        734 	_case '+' star_tst 
      008E63 5B 04            [ 1]    1 	ld a,#'+' 
      008E65 81 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E66 26 05            [ 1]    3 	jrne star_tst
      008E66 4B 00            [ 1]  735 	ld a,#TK_PLUS  
      008E68 4B 00 4B         [ 2]  736 	jp token_char 
      001000                        737 star_tst:
      001000                        738 	_case '*' slash_tst 
      008E6B 00 2A            [ 1]    1 	ld a,#'*' 
      008E6C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      008E6C 91 D6            [ 1]    3 	jrne slash_tst
      008E6E 01 72            [ 1]  739 	ld a,#TK_MULT 
      008E70 5C 00 02         [ 2]  740 	jp token_char 
      00100B                        741 slash_tst: 
      00100B                        742 	_case '/' prcnt_tst 
      008E73 A1 30            [ 1]    1 	ld a,#'/' 
      008E75 27 06            [ 1]    2 	cp a,(TCHAR,sp) 
      008E77 A1 31            [ 1]    3 	jrne prcnt_tst
      008E79 27 02            [ 1]  743 	ld a,#TK_DIV 
      008E7B 20 0B A0         [ 2]  744 	jp token_char 
      001016                        745 prcnt_tst:
      001016                        746 	_case '%' eql_tst 
      008E7E 30 46            [ 1]    1 	ld a,#'%' 
      008E80 09 03            [ 1]    2 	cp a,(TCHAR,sp) 
      008E82 09 02            [ 1]    3 	jrne eql_tst
      008E84 09 01            [ 1]  747 	ld a,#TK_MOD
      008E86 20 E4 94         [ 2]  748 	jp token_char  
                                    749 ; 1 or 2 character tokens 	
      008E88                        750 eql_tst:
      001021                        751 	_case '=' gt_tst 		
      008E88 72 5A            [ 1]    1 	ld a,#'=' 
      008E8A 00 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008E8C 90 93            [ 1]    3 	jrne gt_tst
      008E8E 7B 01            [ 1]  752 	ld a,#TK_EQUAL
      008E90 90 F7 90         [ 2]  753 	jp token_char 
      00102C                        754 gt_tst:
      00102C                        755 	_case '>' lt_tst 
      008E93 5C 1E            [ 1]    1 	ld a,#'>' 
      008E95 02 90            [ 1]    2 	cp a,(TCHAR,sp) 
      008E97 FF 72            [ 1]    3 	jrne lt_tst
      008E99 A9 00            [ 1]  756 	ld a,#TK_GT 
      008E9B 02 A6            [ 1]  757 	ld (ATTRIB,sp),a 
      008E9D 84 5B 03         [ 4]  758 	ld a,([in.w],y)
      008EA0 81 5C 00 01      [ 1]  759 	inc in 
      008EA1 A1 3D            [ 1]  760 	cp a,#'=
      008EA1 A1 41            [ 1]  761 	jrne 1$
      008EA3 8C 24            [ 1]  762 	ld a,#TK_GE 
      008EA5 0B A1            [ 2]  763 	jra token_char  
      008EA7 5B 25            [ 1]  764 1$: cp a,#'<
      008EA9 07 A1            [ 1]  765 	jrne 2$
      008EAB 61 8C            [ 1]  766 	ld a,#TK_NE 
      008EAD 24 02            [ 2]  767 	jra token_char 
      008EAF A1 7B 81 01      [ 1]  768 2$: dec in
      008EB2 7B 02            [ 1]  769 	ld a,(ATTRIB,sp)
      008EB2 A1 30            [ 2]  770 	jra token_char 	 
      001055                        771 lt_tst:
      001055                        772 	_case '<' other
      008EB4 25 03            [ 1]    1 	ld a,#'<' 
      008EB6 A1 3A            [ 1]    2 	cp a,(TCHAR,sp) 
      008EB8 8C 8C            [ 1]    3 	jrne other
      008EBA 81 34            [ 1]  773 	ld a,#TK_LT 
      008EBB 6B 02            [ 1]  774 	ld (ATTRIB,sp),a 
      008EBB CD 8E B2         [ 4]  775 	ld a,([in.w],y)
      008EBE 25 03 CD 8E      [ 1]  776 	inc in 
      008EC2 A1 81            [ 1]  777 	cp a,#'=
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      008EC4 26 04            [ 1]  778 	jrne 1$
      008EC4 A1 5F            [ 1]  779 	ld a,#TK_LE 
      008EC6 26 03            [ 2]  780 	jra token_char 
      008EC8 99 20            [ 1]  781 1$: cp a,#'>
      008ECA 03 CD            [ 1]  782 	jrne 2$
      008ECC 8E BB            [ 1]  783 	ld a,#TK_NE 
      008ECE 81 1E            [ 2]  784 	jra token_char 
      008ECF 72 5A 00 01      [ 1]  785 2$: dec in 
      008ECF 5C 02            [ 1]  786 	ld a,(ATTRIB,sp)
      008ED0 20 16            [ 2]  787 	jra token_char 	
      00107E                        788 other: ; not a special character 	 
      008ED0 CD 98            [ 1]  789 	ld a,(TCHAR,sp)
      008ED2 DA F7 5C         [ 4]  790 	call is_alpha 
      008ED5 91 D6            [ 1]  791 	jrc 30$ 
      008ED7 01 72 5C         [ 2]  792 	jp syntax_error 
      001088                        793 30$: 
      008EDA 00 02 CD         [ 4]  794 	call parse_keyword
      008EDD 8E C4 25         [ 2]  795 	cpw x,#REM_IDX 
      008EE0 EF 7F            [ 1]  796 	jrne token_exit 
      008EE2 72               [ 1]  797 	ldw x,y 
      008EE3 5A 00 02         [ 2]  798 	jp copy_comment 
      001094                        799 token_char:
      008EE6 81               [ 1]  800 	ld (x),a 
      008EE7 5C               [ 1]  801 	incw x
      008EE7 89 CD            [ 1]  802 	ldw y,x 
      001098                        803 token_exit:
      001098                        804 	_drop VSIZE 
      008EE9 8E CF            [ 2]    1     addw sp,#VSIZE 
      008EEB 1E               [ 4]  805 	ret
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
      00109B                        825 compile::
      008EEC 01 E6            [ 2]  826 	pushw y 
      00109D                        827 	_vars VSIZE 
      008EEE 02 26            [ 2]    1     sub sp,#VSIZE 
      008EF0 0F E6 01 A0 41   [ 1]  828 	mov basicptr,txtbgn
      008EF5 AE 00 03 42      [ 1]  829 	bset flags,#FCOMP 
      008EF9 1C 00            [ 1]  830 	ld a,#0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      008EFB 31 A6 85         [ 2]  831 	ldw x,#0
      008EFE 20 36 B8         [ 2]  832 	ldw pad,x ; destination buffer 
      008F00 C7 16 BA         [ 1]  833 	ld pad+2,a ; count 
      008F00 AE B3 58         [ 2]  834 	ldw x,#pad+3
      008F03 16 01 90 5C      [ 1]  835 	clr in 
      008F07 CD 99 69         [ 4]  836 	call get_token
      008F0A 4D 26            [ 1]  837 	cp a,#TK_INTGR
      008F0C 29 16            [ 1]  838 	jrne 2$
      008F0E 01 A6 03         [ 2]  839 	cpw x,#1 
      008F11 90 F7            [ 1]  840 	jrpl 1$
      008F13 90 5C            [ 1]  841 	ld a,#ERR_BAD_VALUE
      008F15 93 CD 94         [ 2]  842 	jp tb_error
      008F18 32 A1 0F         [ 2]  843 1$:	ldw pad,x 
      008F1B 23 02 A6 0F      [ 2]  844 	ldw y,#pad+3 
      008F1F 90 A3 17 74      [ 2]  845 2$:	cpw y,#stack_full 
      008F1F 88 05            [ 1]  846 	jrult 3$
      008F20 A6 0F            [ 1]  847 	ld a,#ERR_BUF_FULL 
      008F20 90 F6 27         [ 2]  848 	jp tb_error 
      0010DD                        849 3$:	
      008F23 09               [ 1]  850 	ldw x,y 
      008F24 90 5C 0A         [ 4]  851 	call get_token 
      008F27 01 26            [ 1]  852 	cp a,#TK_NONE 
      008F29 F6 4F            [ 1]  853 	jrne 2$ 
                                    854 ; compilation completed  
      008F2B 90 F7 90 5C      [ 2]  855 	subw y,#pad
      008F2F 5B 01            [ 1]  856     ld a,yl
      008F31 A6 03 5F         [ 2]  857 	ldw x,#pad 
      008F34 20 1B 19         [ 2]  858 	ldw ptr16,x 
      008F36 E7 02            [ 1]  859 	ld (2,x),a 
      008F36 16               [ 2]  860 	ldw x,(x)
      008F37 01 A1            [ 1]  861 	jreq 10$
      008F39 87 2B 06         [ 4]  862 	call insert_line
      008F3C 90 F7 90 5C      [ 1]  863 	clr  count 
      008F40 20 0F            [ 2]  864 	jra  11$ 
      008F42                        865 10$: ; line# is zero 
      008F42 A3 00 48         [ 2]  866 	ldw x,ptr16  
      008F45 27 0A 90         [ 2]  867 	ldw basicptr,x 
      008F48 F7 90            [ 1]  868 	ld a,(2,x)
      008F4A 5C 90 FF         [ 1]  869 	ld count,a 
      008F4D 72 A9 00 02      [ 1]  870 	mov in,#3 
      00110E                        871 11$:
      00110E                        872 	_drop VSIZE 
      008F51 5B 02            [ 2]    1     addw sp,#VSIZE 
      008F53 81 1B 00 22      [ 1]  873 	bres flags,#FCOMP 
      008F54 90 85            [ 2]  874 	popw y 
      008F54 88               [ 4]  875 	ret 
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
      001117                         48 cpy_cmd_name:
      008F55 91               [ 2]   49 	tnzw x 
      008F56 D6 01            [ 1]   50 	jreq 10$
      008F58 27               [ 1]   51 	ld a,(x)
      008F59 0A               [ 1]   52 	incw x
      008F5A 11 01            [ 1]   53 	and a,#15  
      008F5C 26               [ 1]   54 	push a 
      008F5D 06 72            [ 1]   55     tnz (1,sp) 
      008F5F 5C 00            [ 1]   56 	jreq 9$
      008F61 02               [ 1]   57 1$:	ld a,(x)
      008F62 20 F1            [ 1]   58 	ld (y),a  
      008F64 5B               [ 1]   59 	incw x
      008F65 01 81            [ 1]   60 	incw y 
      008F67 0A 01            [ 1]   61 	dec (1,sp)	 
      008F67 52 02            [ 1]   62 	jrne 1$
      008F69 84               [ 1]   63 9$: pop a 
      00112E                         64 10$: 
      008F69 90               [ 4]   65 	ret	
                                     66 
                                     67 ;--------------------------
                                     68 ; add a space after letter or 
                                     69 ; digit.
                                     70 ; input:
                                     71 ;   Y     pointer to buffer 
                                     72 ; output:
                                     73 ;   Y    moved to end 
                                     74 ;--------------------------
      00112F                         75 add_space:
      008F6A AE 16            [ 2]   76 	decw y 
      008F6C 68 A6            [ 1]   77 	ld a,(y)
      008F6E 20 CD            [ 1]   78 	incw y
      008F70 8F 54            [ 1]   79 	cp a,#') 
      008F72 55 00            [ 1]   80 	jreq 0$
      008F74 02 00 03         [ 4]   81 	call is_alnum 
      008F77 91 D6            [ 1]   82 	jrnc 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      00113E                         83 0$: 
      008F79 01 26            [ 1]   84 	ld a,#SPACE 
      008F7B 05 90            [ 1]   85 	ld (y),a 
      008F7D 93 CC            [ 1]   86 	incw y 
      008F7F 91               [ 4]   87 1$: ret 
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
      001145                         99 right_align::
      008F80 18               [ 1]  100 	push a 
      008F81 72 5C            [ 1]  101 0$: ld a,(1,sp)
      008F83 00 02 CD         [ 1]  102 	cp a,tab_width 
      008F86 98 DA            [ 1]  103 	jrpl 1$
      008F88 6B 01            [ 1]  104 	ld a,#SPACE 
      008F8A 5A               [ 2]  105 	decw x
      008F8A A6               [ 1]  106 	ld (x),a  
      008F8B 22 11            [ 1]  107 	inc (1,sp)
      008F8D 01 26            [ 2]  108 	jra 0$ 
      008F8F 0A               [ 1]  109 1$: pop a 	
      008F90 A6               [ 4]  110 	ret 
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
      001157                        123 cpy_quote:
      008F91 02 F7            [ 1]  124 	ld a,#'"
      008F93 5C CD            [ 1]  125 	ld (y),a 
      008F95 8D C0            [ 1]  126 	incw y 
      008F97 CC               [ 2]  127 	pushw x 
      008F98 91 18 95         [ 4]  128 	call skip_string 
      008F9A 85               [ 2]  129 	popw x 
      008F9A A6               [ 1]  130 1$:	ld a,(x)
      008F9B 24 11            [ 1]  131 	jreq 9$
      008F9D 01               [ 1]  132 	incw x 
      008F9E 27 17            [ 1]  133 	cp a,#SPACE 
      008FA0 A6 26            [ 1]  134 	jrult 3$
      008FA2 11 01            [ 1]  135 	ld (y),a
      008FA4 26 0A            [ 1]  136 	incw y 
      008FA6 A6 84            [ 1]  137 	cp a,#'\ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      008FA8 F7 5C            [ 1]  138 	jrne 1$ 
      001172                        139 2$:
      008FAA CD 8E            [ 1]  140 	ld (y),a
      008FAC 66 CC            [ 1]  141 	incw y  
      008FAE 91 18            [ 2]  142 	jra 1$
      008FB0 7B               [ 1]  143 3$: push a 
      008FB1 01 CD            [ 1]  144 	ld a,#'\
      008FB3 8E B2            [ 1]  145 	ld (y),a 
      008FB5 24 0C            [ 1]  146 	incw y  
      008FB7 A6               [ 1]  147 	pop a 
      008FB8 84 F7            [ 1]  148 	sub a,#7
      008FBA 5C 7B 01         [ 1]  149 	ld acc8,a 
      008FBD CD 8E 15 CC      [ 1]  150 	clr acc16
      008FC1 91               [ 2]  151 	pushw x
      008FC2 18 0D 8D         [ 2]  152 	ldw x,#escaped 
      008FC3 72 BB 00 0D      [ 2]  153 	addw x,acc16 
      008FC3 A6               [ 1]  154 	ld a,(x)
      008FC4 28               [ 2]  155 	popw x
      008FC5 11 01            [ 2]  156 	jra 2$
      008FC7 26 05            [ 1]  157 9$: ld a,#'"
      008FC9 A6 06            [ 1]  158 	ld (y),a 
      008FCB CC 91            [ 1]  159 	incw y  
      008FCD 14               [ 1]  160 	incw x 
      008FCE 81               [ 4]  161 	ret
                                    162 
                                    163 ;--------------------------
                                    164 ; return variable name 
                                    165 ; from its address.
                                    166 ; input:
                                    167 ;   X    variable address
                                    168 ; output:
                                    169 ;   A     variable letter
                                    170 ;--------------------------
      00119D                        171 var_name::
      008FCE A6 5C 11         [ 2]  172 		subw x,#vars 
      008FD1 01 26            [ 1]  173 		ld a,#3
      008FD3 16               [ 2]  174 		div x,a 
      008FD4 A6               [ 1]  175 		ld a,xl 
      008FD5 04 F7            [ 1]  176 		add a,#'A 
      008FD7 5C               [ 4]  177 		ret 
                                    178 
                                    179 ;-----------------------------
                                    180 ; return cmd  idx from its 
                                    181 ; code address 
                                    182 ; input:
                                    183 ;   X      code address 
                                    184 ; output:
                                    185 ;   X      cmd_idx
                                    186 ;-----------------------------
      0011A7                        187 get_cmd_idx:
      008FD8 91 D6            [ 2]  188 	pushw y
      008FDA 01 F7 5C 90      [ 2]  189 	ldw y,#code_addr 
      008FDE 93 72 5C 00      [ 2]  190 	ldw ptr16,y 
      008FE2 02 5F            [ 1]  191 	clrw y 
      008FE4 97 A6 04         [ 5]  192 1$:	cpw x,([ptr16],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      008FE7 CC 91            [ 1]  193 	jreq 3$ 
      008FE9 18 5C            [ 1]  194 	incw y 
      008FEA 91 D6 19         [ 4]  195 	ld a,([ptr16],y)
      008FEA A6 29            [ 1]  196 	incw y
      008FEC 11 01 26         [ 4]  197 	or a,([ptr16],y)	
      008FEF 05 A6            [ 1]  198 	jrne 1$
      008FF1 07               [ 1]  199 3$: ldw x,y 
      008FF2 CC 91            [ 2]  200 	popw y 
      008FF4 14               [ 4]  201 	ret
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
      008FF5                        218 decompile::
      0011C8                        219 	_vars VSIZE
      008FF5 A6 3A            [ 2]    1     sub sp,#VSIZE 
      008FF7 11 01 26         [ 1]  220 	ld a,base
      008FFA 05 A6            [ 1]  221 	ld (BASE_SAV,sp),a  
      008FFC 0A CC 91         [ 1]  222 	ld a,tab_width 
      008FFF 14 02            [ 1]  223 	ld (WIDTH_SAV,sp),a 
      009000 17 03            [ 2]  224 	ldw (STR,sp),y   
      009000 A6 2C 11 01      [ 5]  225 	ldw x,[basicptr] ; line number 
      009004 26 05 A6 08      [ 1]  226 	mov base,#10
      009008 CC 91 14 23      [ 1]  227 	mov tab_width,#5
      00900B 72 5F 00 0C      [ 1]  228 	clr acc24 
      00900B A6 23 11         [ 2]  229 	ldw acc16,x
      00900E 01               [ 1]  230 	clr a ; unsigned conversion 
      00900F 26 05 A6         [ 4]  231 	call itoa  
      009012 09 CC 91         [ 4]  232 	call right_align 
      009015 14               [ 1]  233 	push a 
      009016 90 93            [ 1]  234 1$:	ldw y,x ; source
      009016 A6 2D            [ 2]  235 	ldw x,(STR+1,sp) ; destination
      009018 11 01 26         [ 4]  236 	call strcpy 
      00901B 05 A6            [ 1]  237 	clrw y 
      00901D 11               [ 1]  238 	pop a 
      00901E CC 91            [ 1]  239 	ld yl,a 
      009020 14 F9 03         [ 2]  240 	addw y,(STR,sp)
      009021 A6 20            [ 1]  241 	ld a,#SPACE 
      009021 A6 40            [ 1]  242 	ld (y),a 
      009023 11 01            [ 1]  243 	incw y 
      009025 26 05 A6 05      [ 1]  244 	clr tab_width
      009029 CC 91 14         [ 2]  245 	ldw x,#3
      00902C CF 00 00         [ 2]  246 	ldw in.w,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      001210                        247 decomp_loop:
      00902C A6 3F            [ 2]  248 	pushw y
      00902E 11 01 26         [ 4]  249 	call next_token 
      009031 12 A6            [ 2]  250 	popw y 
      009033 80               [ 1]  251 	tnz a  
      009034 F7 5C            [ 1]  252 	jrne 1$
      009036 90 93 AE         [ 2]  253 	jp 20$
      009039 00 64            [ 1]  254 1$:	jrmi 2$
      00903B 90 FF 72         [ 2]  255 	jp 6$
      001222                        256 2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR|TK_AND|TK_OR|TK_XOR 
      00903E A9 00            [ 1]  257 	cp a,#TK_VAR 
      009040 02 CC            [ 1]  258 	jrne 3$
                                    259 ;; TK_VAR 
      009042 91 18 2F         [ 4]  260 	call add_space
      009044 CD 17 A4         [ 4]  261 	call get_addr   
      009044 A6 27 11         [ 4]  262 	call var_name
      009047 01 26            [ 1]  263 	ld (y),a 
      009049 2B A6            [ 1]  264 	incw y  
      00904B 80 F7            [ 2]  265 	jra decomp_loop
      001235                        266 3$:
      00904D 5C 90            [ 1]  267 	cp a,#TK_INTGR
      00904F AE 00            [ 1]  268 	jrne 4$
                                    269 ;; TK_INTGR
      009051 7E FF 1C         [ 4]  270 	call get_int24 
      009054 00 02 0C         [ 1]  271 	ld acc24,a 
      009056 CF 00 0D         [ 2]  272 	ldw acc16,x 
      009056 90 AE 16         [ 4]  273 	call add_space
      009059 68 72            [ 2]  274 	pushw y 
      00905B B9 00            [ 1]  275 	ld a,#255 ; signed conversion 
      00905D 01 90 89         [ 4]  276 	call itoa  
      009060 CD 94            [ 2]  277 	ldw y,(1,sp) 
      009062 4E               [ 1]  278 	push a 
      009063 72               [ 1]  279 	exgw x,y 
      009064 F2 01 90         [ 4]  280 	call strcpy 
      009067 5C 17            [ 1]  281 	clrw y
      009069 01               [ 1]  282 	pop a  
      00906A 72 FB            [ 1]  283 	ld yl,a 
      00906C 01 5B 02         [ 2]  284 	addw y,(1,sp)
      00125B                        285 	_drop 2 
      00906F 4F 90            [ 2]    1     addw sp,#2 
      009071 93 CC            [ 2]  286 	jra decomp_loop
      00125F                        287 4$: ; dictionary keyword
      009073 91 18            [ 1]  288 	cp a,#TK_NOT 
      009075 24 39            [ 1]  289 	jruge 50$ 
      009075 A6               [ 2]  290 	ldw x,(x)
      009076 2B 11 01 26      [ 1]  291 	inc in 
      00907A 05 A6 10 CC      [ 1]  292 	inc in 
      00907E 91 14 7E         [ 2]  293 	cpw x,#REM_IDX
      009080 26 23            [ 1]  294 	jrne 5$
      009080 A6 2A 11         [ 2]  295 	ldw x,basicptr 
                                    296 ; copy comment to buffer 
      009083 01 26 05         [ 4]  297 	call add_space
      009086 A6 20            [ 1]  298 	ld a,#''
      009088 CC 91            [ 1]  299 	ld (y),a 
      00908A 14 5C            [ 1]  300 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      00908B                        301 46$:
      00908B A6 2F 11 01      [ 4]  302 	ld a,([in.w],x)
      00908F 26 05 A6 21      [ 1]  303 	inc in  
      009093 CC 91            [ 1]  304 	ld (y),a 
      009095 14 5C            [ 1]  305 	incw y 
      009096 C6 00 01         [ 1]  306 	ld a,in 
      009096 A6 25 11         [ 1]  307 	cp a,count 
      009099 01 26            [ 1]  308 	jrmi 46$
      00909B 05 A6 22         [ 2]  309 	jp 20$  
      00909E CC 91 14         [ 2]  310 5$: cpw x,#LET_IDX 
      0090A1 26 0B            [ 1]  311 	jrne 54$
      0090A1 A6 3D 11         [ 2]  312 	jp decomp_loop ; down display LET
      00129C                        313 50$:
      0090A4 01               [ 1]  314 	clrw x 
      0090A5 26 05            [ 1]  315 	sub a,#TK_NOT  
      0090A7 A6               [ 1]  316 	sll a 
      0090A8 32               [ 1]  317 	ld xl,a 
      0090A9 CC 91 14         [ 2]  318 	addw x,#NOT_IDX
      0090AC                        319 54$: ; insert command name 
      0090AC A6 3E 11         [ 4]  320 	call add_space  
      0090AF 01 26            [ 2]  321 	pushw y
      0090B1 23 A6 31         [ 4]  322 	call cmd_name
      0090B4 6B 02            [ 2]  323 	popw y 
      0090B6 91 D6 01         [ 4]  324 	call cpy_cmd_name
      0090B9 72 5C 00         [ 2]  325 	jp decomp_loop 
      0012B4                        326 6$:
                                    327 ; label?
      0090BC 02 A1            [ 1]  328 	cp a,#TK_LABEL 
      0090BE 3D 26            [ 1]  329 	jrne 64$
                                    330 ; copy label string to output buffer   	
      0090C0 04 A6            [ 1]  331 	ld a,#32 
      0090C2 33 20            [ 1]  332 	ld (y),a 
      0090C4 4F A1            [ 1]  333 	incw y 
      0012BE                        334 61$:
      0090C6 3C               [ 2]  335 	pushw x 
      0090C7 26 04 A6         [ 4]  336 	call skip_string 
      0090CA 35               [ 2]  337 	popw x 
      0012C3                        338 62$:	
      0090CB 20               [ 1]  339 	ld a,(x)
      0090CC 47 72            [ 1]  340 	jreq 63$ 
      0090CE 5A               [ 1]  341 	incw x  
      0090CF 00 02            [ 1]  342 	ld (y),a 
      0090D1 7B 02            [ 1]  343 	incw y 
      0090D3 20 3F            [ 2]  344 	jra 62$ 
      0090D5                        345 63$: 
      0090D5 A6 3C            [ 1]  346 	ld a,#32 
      0090D7 11 01            [ 1]  347 	ld (y),a 
      0090D9 26 23            [ 1]  348 	incw y 
      0090DB A6 34 6B         [ 2]  349 	jp decomp_loop
      0012D6                        350 64$:
      0090DE 02 91            [ 1]  351 	cp a,#TK_QSTR 
      0090E0 D6 01            [ 1]  352 	jrne 7$
                                    353 ;; TK_QSTR
      0090E2 72 5C 00         [ 4]  354 	call add_space
      0090E5 02 A1 3D         [ 4]  355 	call cpy_quote  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      0090E8 26 04 A6         [ 2]  356 	jp decomp_loop
      0012E3                        357 7$:
      0090EB 36 20            [ 1]  358 	cp a,#TK_CHAR 
      0090ED 26 A1            [ 1]  359 	jrne 8$
                                    360 ;; TK_CHAR
      0090EF 3E 26 04         [ 4]  361 	call add_space 
      0090F2 A6 35            [ 1]  362 	ld a,#'\ 
      0090F4 20 1E            [ 1]  363 	ld (y),a 
      0090F6 72 5A            [ 1]  364 	incw y
      0090F8 00               [ 1]  365 	ld a,(x)
      0090F9 02 7B 02 20      [ 1]  366 	inc in  
      0090FD 16 06            [ 2]  367 	jra 81$
      0090FE A1 0A            [ 1]  368 8$: cp a,#TK_COLON 
      0090FE 7B 01            [ 1]  369 	jrne 9$
      009100 CD 8E            [ 1]  370 	ld a,#':
      0012FD                        371 81$:
      009102 A1 25            [ 1]  372 	ld (y),a 
      009104 03 CC            [ 1]  373 	incw y 
      001301                        374 82$:
      009106 96 EE 10         [ 2]  375 	jp decomp_loop
      009108                        376 9$: 
      009108 CD 8E            [ 1]  377 	cp a,#TK_SHARP
      00910A E7 A3            [ 1]  378 	jrugt 10$ 
      00910C 00 7E            [ 1]  379 	sub a,#TK_ARRAY 
      00910E 26               [ 1]  380 	clrw x 
      00910F 08               [ 1]  381 	ld xl,a
      009110 93 CC 90         [ 2]  382 	addw x,#single_char 
      009113 56               [ 1]  383 	ld a,(x)
      009114 20 EB            [ 2]  384 	jra 81$ 
      001312                        385 10$: 
      009114 F7 5C            [ 1]  386 	cp a,#TK_MINUS 
      009116 90 93            [ 1]  387 	jrugt 11$
      009118 A0 10            [ 1]  388 	sub a,#TK_PLUS 
      009118 5B               [ 1]  389 	clrw x 
      009119 02               [ 1]  390 	ld xl,a 
      00911A 81 13 5E         [ 2]  391 	addw x,#add_char 
      00911B F6               [ 1]  392 	ld a,(x)
      00911B 90 89            [ 2]  393 	jra 81$
      001320                        394 11$:
      00911D 52 02            [ 1]  395     cp a,#TK_MOD 
      00911F 55 00            [ 1]  396 	jrugt 12$
      009121 1C 00            [ 1]  397 	sub a,#TK_MULT
      009123 05               [ 1]  398 	clrw x 
      009124 72               [ 1]  399 	ld xl,a 
      009125 1A 00 23         [ 2]  400 	addw x,#mul_char
      009128 A6               [ 1]  401 	ld a,(x)
      009129 00 AE            [ 2]  402 	jra 81$
      00132E                        403 12$:
      00912B 00 00            [ 1]  404 	sub a,#TK_GT  
      00912D CF               [ 1]  405 	sll a 
      00912E 16               [ 1]  406 	clrw x 
      00912F B8               [ 1]  407 	ld xl,a 
      009130 C7 16 BA         [ 2]  408 	addw x,#relop_str 
      009133 AE               [ 2]  409 	ldw x,(x)
      009134 16               [ 1]  410 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      009135 BB               [ 1]  411 	incw x 
      009136 72 5F            [ 1]  412 	ld (y),a
      009138 00 02            [ 1]  413 	incw y 
      00913A CD               [ 1]  414 	ld a,(x)
      00913B 8F 67            [ 1]  415 	jrne 81$
      00913D A1 84 26         [ 2]  416 	jp decomp_loop 
      001343                        417 20$: 
      009140 11 A3            [ 1]  418 	clr (y)
      009142 00 01            [ 2]  419 	ldw x,(STR,sp)
      009144 2A 05            [ 1]  420 	ld a,(BASE_SAV,sp)
      009146 A6 0A CC         [ 1]  421 	ld base,a 
      009149 96 F0            [ 1]  422 	ld a,(WIDTH_SAV,sp)
      00914B CF 16 B8         [ 1]  423 	ld tab_width,a
      00914E 90 AE 16         [ 2]  424 	subw y,(STR,sp) 
      009151 BB 90            [ 1]  425 	ld a,yl 
      001356                        426 	_drop VSIZE 
      009153 A3 17            [ 2]    1     addw sp,#VSIZE 
      009155 74               [ 4]  427 	ret 
                                    428 
      009156 25 05 A6 0F CC         429 single_char: .byte '@','(',')',',','#'
      00915B 96 F0                  430 add_char: .byte '+','-'
      00915D 2A 2F 25               431 mul_char: .byte '*','/','%'
      00915D 93 CD 8F 67 A1 00 26   432 relop_str: .word gt,equal,ge,lt,ne,le 
             ED 72 A2 16 B8
      009169 90 9F                  433 gt: .asciz ">"
      00916B AE 16                  434 equal: .asciz "="
      00916D B8 CF 00               435 ge: .asciz ">="
      009170 1A E7                  436 lt: .asciz "<"
      009172 02 FE 27               437 le: .asciz "<="
      009175 09 CD 8D               438 ne:  .asciz "<>"
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
      00137E                        451 cmd_name:
      00137E                        452 	_vars VSIZE 
      009178 4E 72            [ 2]    1     sub sp,#VSIZE 
      00917A 5F 00 04 20      [ 1]  453 	clr acc16 
      00917E 0F 01            [ 2]  454 	ldw (CMDX,sp),x  
      00917F AE 32 D6         [ 2]  455 	ldw x,#kword_dict	
      00917F CE 00            [ 2]  456 1$:	ldw (LINK,sp),x
      009181 1A CF            [ 1]  457 	ld a,(2,x)
      009183 00 05            [ 1]  458 	and a,#15 
      009185 E6 02 C7         [ 1]  459 	ld acc8,a 
      009188 00 04 35         [ 2]  460 	addw x,#3
      00918B 03 00 02 0D      [ 2]  461 	addw x,acc16
      00918E FE               [ 2]  462 	ldw x,(x) ; command index  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00918E 5B 02            [ 2]  463 	cpw x,(CMDX,sp)
      009190 72 1B            [ 1]  464 	jreq 2$
      009192 00 23            [ 2]  465 	ldw x,(LINK,sp)
      009194 90               [ 2]  466 	ldw x,(x) 
      009195 85 81 02         [ 2]  467 	subw x,#2  
      009197 26 E3            [ 1]  468 	jrne 1$
      009197 5D               [ 1]  469 	clr a 
      009198 27               [ 1]  470 	clrw x 
      009199 14 F6            [ 2]  471 	jra 9$
      00919B 5C A4            [ 2]  472 2$: ldw x,(LINK,sp)
      00919D 0F 88 0D         [ 2]  473 	addw x,#2 	
      0013AF                        474 9$:	_drop VSIZE
      0091A0 01 27            [ 2]    1     addw sp,#VSIZE 
      0091A2 0A               [ 4]  475 	ret
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
      0013B2                        116 strlen::
      0091A3 F6               [ 2]  117 	pushw x 
      0091A4 90               [ 1]  118 	clr a
      0091A5 F7               [ 1]  119 1$:	tnz (x) 
      0091A6 5C 90            [ 1]  120 	jreq 9$ 
      0091A8 5C               [ 1]  121 	inc a 
      0091A9 0A               [ 1]  122 	incw x 
      0091AA 01 26            [ 2]  123 	jra 1$ 
      0091AC F6               [ 2]  124 9$:	popw x 
      0091AD 84               [ 4]  125 	ret 
                                    126 
                                    127 ;------------------------------------
                                    128 ; compare 2 strings
                                    129 ; input:
                                    130 ;   X 		char* first string 
                                    131 ;   Y       char* second string 
                                    132 ; output:
                                    133 ;   A 		0 not == |1 ==  
                                    134 ;-------------------------------------
      0091AE                        135 strcmp:
      0091AE 81               [ 1]  136 	ld a,(x)
      0091AF 27 0B            [ 1]  137 	jreq 5$ 
      0091AF 90 5A            [ 1]  138 	cp a,(y) 
      0091B1 90 F6            [ 1]  139 	jrne 4$ 
      0091B3 90               [ 1]  140 	incw x 
      0091B4 5C A1            [ 1]  141 	incw y 
      0091B6 29 27            [ 2]  142 	jra strcmp 
      0013C9                        143 4$: ; not same  
      0091B8 05               [ 1]  144 	clr a 
      0091B9 CD               [ 4]  145 	ret 
      0013CB                        146 5$: ; same 
      0091BA 8E BB            [ 1]  147 	ld a,#1 
      0091BC 24               [ 4]  148 	ret 
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
      0013CE                        159 strcpy::
      0091BD 06               [ 1]  160 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      0091BE 89               [ 2]  161 	pushw x 
      0091BE A6 20            [ 1]  162 1$: ld a,(y)
      0091C0 90 F7            [ 1]  163 	jreq 9$ 
      0091C2 90               [ 1]  164 	ld (x),a 
      0091C3 5C               [ 1]  165 	incw x 
      0091C4 81 5C            [ 1]  166 	incw y 
      0091C5 20 F6            [ 2]  167 	jra 1$ 
      0091C5 88               [ 1]  168 9$:	clr (x)
      0091C6 7B               [ 2]  169 	popw x 
      0091C7 01               [ 1]  170 	pop a 
      0091C8 C1               [ 4]  171 	ret 
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
      0013DE                        185 move::
      0091C9 00               [ 1]  186 	push a 
      0013DF                        187 	_vars VSIZE 
      0091CA 24 2A            [ 2]    1     sub sp,#VSIZE 
      0091CC 08 A6            [ 1]  188 	clr (INCR,sp)
      0091CE 20 5A            [ 1]  189 	clr (LB,sp)
      0091D0 F7 0C            [ 2]  190 	pushw y 
      0091D2 01 20            [ 2]  191 	cpw x,(1,sp) ; compare DEST to SRC 
      0091D4 F1 84            [ 2]  192 	popw y 
      0091D6 81 31            [ 1]  193 	jreq move_exit ; x==y 
      0091D7 2B 0E            [ 1]  194 	jrmi move_down
      0013EF                        195 move_up: ; start from top address with incr=-1
      0091D7 A6 22 90 F7      [ 2]  196 	addw x,acc16
      0091DB 90 5C 89 CD      [ 2]  197 	addw y,acc16
      0091DF 98 15            [ 1]  198 	cpl (INCR,sp)
      0091E1 85 F6            [ 1]  199 	cpl (LB,sp)   ; increment = -1 
      0091E3 27 30            [ 2]  200 	jra move_loop  
      0013FD                        201 move_down: ; start from bottom address with incr=1 
      0091E5 5C               [ 2]  202     decw x 
      0091E6 A1 20            [ 2]  203 	decw y
      0091E8 25 0E            [ 1]  204 	inc (LB,sp) ; incr=1 
      001402                        205 move_loop:	
      0091EA 90 F7 90         [ 1]  206     ld a, acc16 
      0091ED 5C A1 5C         [ 1]  207 	or a, acc8
      0091F0 26 F0            [ 1]  208 	jreq move_exit 
      0091F2 72 FB 01         [ 2]  209 	addw x,(INCR,sp)
      0091F2 90 F7 90         [ 2]  210 	addw y,(INCR,sp) 
      0091F5 5C 20            [ 1]  211 	ld a,(y)
      0091F7 EA               [ 1]  212 	ld (x),a 
      0091F8 88               [ 2]  213 	pushw x 
      0091F9 A6 5C 90         [ 2]  214 	ldw x,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      0091FC F7               [ 2]  215 	decw x 
      0091FD 90 5C 84         [ 2]  216 	ldw acc16,x 
      009200 A0               [ 2]  217 	popw x 
      009201 07 C7            [ 2]  218 	jra move_loop
      00141E                        219 move_exit:
      00141E                        220 	_drop VSIZE
      009203 00 0F            [ 2]    1     addw sp,#VSIZE 
      009205 72               [ 1]  221 	pop a 
      009206 5F               [ 4]  222 	ret 	
                                    223 
                                    224 ;------------------------------------
                                    225 ;  set all variables to zero 
                                    226 ; input:
                                    227 ;   none 
                                    228 ; output:
                                    229 ;	none
                                    230 ;------------------------------------
      001422                        231 clear_vars:
      009207 00               [ 2]  232 	pushw x 
      009208 0E               [ 1]  233 	push a  
      009209 89 AE 8E         [ 2]  234 	ldw x,#vars 
      00920C 0D 72            [ 1]  235 	ld a,#CELL_SIZE*26 
      00920E BB               [ 1]  236 1$:	clr (x)
      00920F 00               [ 1]  237 	incw x 
      009210 0E               [ 1]  238 	dec a 
      009211 F6 85            [ 1]  239 	jrne 1$
      009213 20               [ 1]  240 	pop a 
      009214 DD               [ 2]  241 	popw x 
      009215 A6               [ 4]  242 	ret 
                                    243 
                                    244 
                                    245 ;-----------------------
                                    246 ;  display system 
                                    247 ;  information 
                                    248 ;-----------------------
                           000002   249 	MAJOR=2
                           000000   250 	MINOR=0 
      009216 22 90 F7 90 5C 5C 81   251 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 32 0A 76 65
             72 73 69 6F 6E 20 00
                                    252 
      00921D                        253 system_information:
      00921D 1D 00 31         [ 2]  254 	ldw x,#software 
      009220 A6 03 62         [ 4]  255 	call puts 
      009223 9F AB            [ 1]  256 	ld a,#MAJOR 
      009225 41 81 0E         [ 1]  257 	ld acc8,a 
      009227 5F               [ 1]  258 	clrw x 
      009227 90 89 90         [ 2]  259 	ldw acc24,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00922A AE B3 5E 90      [ 1]  260 	clr tab_width  
      00922E CF 00 1A 90      [ 1]  261 	mov base, #10 
      009232 5F 91 D3         [ 4]  262 	call prt_acc24 
      009235 1A 27            [ 1]  263 	ld a,#'.
      009237 0C 90 5C         [ 4]  264 	call putc 
      00923A 91 D6            [ 1]  265 	ld a,#MINOR 
      00923C 1A 90 5C         [ 1]  266 	ld acc8,a 
      00923F 91               [ 1]  267 	clrw x 
      009240 DA 1A 26         [ 2]  268 	ldw acc24,x 
      009243 EF 93 90         [ 4]  269 	call prt_acc24
      009246 85 81            [ 1]  270 	ld a,#CR 
      009248 CD 09 10         [ 4]  271 	call putc
                                    272 ;call test 
      009248 52               [ 4]  273 	ret
                                    274 
      0014A8                        275 warm_init:
      009249 04 C6 00 0B      [ 2]  276 	ldw y,#XSTACK_EMPTY  
      00924D 6B 01 C6 00      [ 1]  277 	clr flags 
      009251 24 6B 02 17      [ 1]  278 	clr loop_depth 
      009255 03 72 CE 00      [ 1]  279 	mov tab_width,#TAB_WIDTH 
      009259 05 35 0A 00      [ 1]  280 	mov base,#10 
      00925D 0B 35 05         [ 2]  281 	ldw x,#0 
      009260 00 24 72         [ 2]  282 	ldw basicptr,x 
      009263 5F 00 0D         [ 2]  283 	ldw in.w,x 
      009266 CF 00 0E 4F      [ 1]  284 	clr count
      00926A CD               [ 4]  285 	ret 
                                    286 
                                    287 ;---------------------------
                                    288 ; reset BASIC text variables 
                                    289 ; and clear variables 
                                    290 ;---------------------------
      0014CA                        291 clear_basic:
      00926B 98               [ 2]  292 	pushw x 
      00926C 81 CD 91 C5      [ 1]  293 	clr count
      009270 88 90 93 1E      [ 1]  294 	clr in  
      009274 04 CD 94         [ 2]  295 	ldw x,#free_ram 
      009277 4E 90 5F         [ 2]  296 	ldw txtbgn,x 
      00927A 84 90 97         [ 2]  297 	ldw txtend,x 
      00927D 72 F9 03         [ 4]  298 	call clear_vars 
      009280 A6               [ 2]  299 	popw x
      009281 20               [ 4]  300 	ret 
                                    301 
                                    302 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    303 ;;   Tiny BASIC error messages     ;;
                                    304 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014E1                        305 err_msg:
      009282 90 F7 90 5C 72 5F 00   306 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             24 AE 00 03 CF
      00928E 00 01 15 72 15 8C 15   307 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             9D 15 AE
      009290 15 BA 15 ED 15 FD 16   308 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             11 16 24
      009290 90 89                  309 	.word err_overflow 
                                    310 
      009292 CD 97 EF 90 85 4D 26   311 err_mem_full: .asciz "Memory full\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal  03-Bits]



             66 75 6C 6C 0A 00
      00929A CC 93 C3 2B 03 CC 93   312 err_syntax: .asciz "syntax error\n" 
             34 72 72 6F 72 0A 00
      0092A2 6D 61 74 68 20 6F 70   313 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      0092A2 A1 85 26 0F CD 91 AF   314 err_div0: .asciz "division by 0\n" 
             CD 98 24 CD 92 1D 90
             F7
      0092B1 90 5C 20 DB 6C 69 64   315 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      0092B5 72 75 6E 20 74 69 6D   316 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      0092B5 A1 84 26 26 CD 98 2E   317 err_cmd_only: .asciz "command line only usage.\n"
             C7 00 0D CF 00 0E CD
             91 AF 90 89 A6 FF CD
             98 81 16 01 88
      0092CF 51 CD 94 4E 90 5F 84   318 err_duplicate: .asciz "duplicate name.\n"
             90 97 72 F9 01 5B 02
             20 B1 00
      0092DF 46 69 6C 65 20 6E 6F   319 err_not_file: .asciz "File not found.\n"
             74 20 66 6F 75 6E 64
             2E 0A 00
      0092DF A1 87 24 39 FE 72 5C   320 err_bad_value: .asciz "bad value.\n"
             00 02 72 5C 00
      0092EB 02 A3 00 7E 26 23 CE   321 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             00 05 CD 91 AF A6 27
             90 F7 90 5C 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      0092FD 4E 6F 20 64 61 74 61   322 err_no_data: .asciz "No data found.\n"
             20 66 6F 75 6E 64 2E
             0A 00
      0092FD 72 D6 00 01 72 5C 00   323 err_no_prog: .asciz "No program in RAM!\n"
             02 90 F7 90 5C C6 00
             02 C1 00 04 2B EC
      009311 CC 93 C3 A3 00 48 26   324 err_no_fspace: .asciz "File system full.\n" 
             0B CC 92 90 20 66 75
             6C 6C 2E 0A 00
      00931C 42 75 66 66 65 72 20   325 err_buf_full: .asciz "Buffer full\n"
             66 75 6C 6C 0A 00
      00931C 5F A0 87 48 97 1C 00   326 err_overflow: .asciz "overflow\n" 
             F8 0A 00
                                    327 
      009324 0A 72 75 6E 20 74 69   328 rt_msg: .asciz "\nrun time error, "
             6D 65 20 65 72 72 6F
             72 2C 20 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      009324 CD 91 AF 90 89 CD 93   329 comp_msg: .asciz "\ncompile error, "
             FE 90 85 CD 91 97 CC
             92 90 00
      009334 6C 61 73 74 20 74 6F   330 tk_id: .asciz "last token id: "
             6B 65 6E 20 69 64 3A
             20 00
                                    331 
      00166E                        332 syntax_error::
      009334 A1 03            [ 1]  333 	ld a,#ERR_SYNTAX 
                                    334 
      001670                        335 tb_error::
      009336 26 1E A6 20 90   [ 2]  336 	btjt flags,#FCOMP,1$
      00933B F7               [ 1]  337 	push a 
      00933C 90 5C 3B         [ 2]  338 	ldw x, #rt_msg 
      00933E CD 09 6D         [ 4]  339 	call puts 
      00933E 89               [ 1]  340 	pop a 
      00933F CD 98 15         [ 2]  341 	ldw x, #err_msg 
      009342 85 5F 00 0D      [ 1]  342 	clr acc16 
      009343 48               [ 1]  343 	sll a
      009343 F6 27 07 5C      [ 1]  344 	rlc acc16  
      009347 90 F7 90         [ 1]  345 	ld acc8, a 
      00934A 5C 20 F6 0D      [ 2]  346 	addw x,acc16 
      00934D FE               [ 2]  347 	ldw x,(x)
      00934D A6 20 90         [ 4]  348 	call puts
      009350 F7 90 5C         [ 2]  349 	ldw x,basicptr 
                           000001   350 .if DEBUG 
      009353 CC 92 90         [ 1]  351 ld a,count 
      009356 90 5F            [ 1]  352 clrw y 
      009356 A1 02            [ 1]  353 rlwa y  
      009358 26 09 CD         [ 4]  354 call hex_dump
      00935B 91 AF CD         [ 2]  355 ldw x,basicptr
                                    356 .endif 
      00935E 91 D7 CC         [ 1]  357 	ld a,in 
      009361 92 90 B4         [ 4]  358 	call prt_basic_line
      009363 AE 16 5E         [ 2]  359 	ldw x,#tk_id 
      009363 A1 04 26         [ 4]  360 	call puts 
      009366 10 CD 91         [ 1]  361 	ld a,in.saved 
      009369 AF               [ 1]  362 	clrw x 
      00936A A6               [ 1]  363 	ld xl,a 
      00936B 5C 90 F7 90      [ 2]  364 	addw x,basicptr 
      00936F 5C               [ 1]  365 	ld a,(x)
      009370 F6               [ 1]  366 	clrw x 
      009371 72               [ 1]  367 	ld xl,a 
      009372 5C 00 02         [ 4]  368 	call prt_i16
      009375 20 06            [ 2]  369 	jra 6$
      0016C1                        370 1$:	
      009377 A1               [ 1]  371 	push a 
      009378 0A 26 09         [ 2]  372 	ldw x,#comp_msg
      00937B A6 3A 6D         [ 4]  373 	call puts 
      00937D 84               [ 1]  374 	pop a 
      00937D 90 F7 90         [ 2]  375 	ldw x, #err_msg 
      009380 5C 5F 00 0D      [ 1]  376 	clr acc16 
      009381 48               [ 1]  377 	sll a
      009381 CC 92 90 0D      [ 1]  378 	rlc acc16  
      009384 C7 00 0E         [ 1]  379 	ld acc8, a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      009384 A1 09 22 0A      [ 2]  380 	addw x,acc16 
      009388 A0               [ 2]  381 	ldw x,(x)
      009389 05 5F 97         [ 4]  382 	call puts
      00938C 1C 93 D9         [ 2]  383 	ldw x,#tib
      00938F F6 20 EB         [ 4]  384 	call puts 
      009392 A6 0D            [ 1]  385 	ld a,#CR 
      009392 A1 11 22         [ 4]  386 	call putc
      009395 0A A0 10         [ 2]  387 	ldw x,in.w
      009398 5F 97 1C         [ 4]  388 	call spaces
      00939B 93 DE            [ 1]  389 	ld a,#'^
      00939D F6 20 DD         [ 4]  390 	call putc 
      0093A0 AE 17 FF         [ 2]  391 6$: ldw x,#STACK_EMPTY 
      0093A0 A1               [ 1]  392     ldw sp,x
                                    393 
      0016FA                        394 warm_start:
      0093A1 22 22 0A         [ 4]  395 	call warm_init
                                    396 ;----------------------------
                                    397 ;   BASIC interpreter
                                    398 ;----------------------------
      0016FD                        399 cmd_line: ; user interface 
      0093A4 A0 20            [ 1]  400 	ld a,#CR 
      0093A6 5F 97 1C         [ 4]  401 	call putc 
      0093A9 93 E0            [ 1]  402 	ld a,#'> 
      0093AB F6 20 CF         [ 4]  403 	call putc
      0093AE CD 0A 72         [ 4]  404 	call readln
      0093AE A0 31 48 5F      [ 1]  405 	tnz count 
      0093B2 97 1C            [ 1]  406 	jreq cmd_line
      0093B4 93 E3 FE         [ 4]  407 	call compile
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
      0093B7 F6 5C 90 F7      [ 1]  421 	tnz count 
      0093BB 90 5C            [ 1]  422 	jreq cmd_line
                                    423 	
                                    424 ; if direct command 
                                    425 ; it's ready to interpret 
                                    426 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    427 ;; This is the interpreter loop
                                    428 ;; for each BASIC code line. 
                                    429 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      001719                        430 interpreter: 
      0093BD F6 26 BD         [ 1]  431 	ld a,in 
      0093C0 CC 92 90         [ 1]  432 	cp a,count 
      0093C3 2B 1D            [ 1]  433 	jrmi interp_loop
      001721                        434 next_line:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      0093C3 90 7F 1E 03 7B   [ 2]  435 	btjf flags, #FRUN, cmd_line
      0093C8 01 C7 00         [ 2]  436 	ldw x,basicptr
      0093CB 0B 7B 02 C7      [ 2]  437 	addw x,in.w 
      0093CF 00 24 72         [ 2]  438 	cpw x,txtend 
      0093D2 F2 03            [ 1]  439 	jrpl warm_start
      0093D4 90 9F 5B         [ 2]  440 	ldw basicptr,x ; start of next line  
      0093D7 04 81            [ 1]  441 	ld a,(2,x)
      0093D9 40 28 29         [ 1]  442 	ld count,a 
      0093DC 2C 23 2B 2D      [ 1]  443 	mov in,#3 ; skip first 3 bytes of line 
      00173E                        444 interp_loop:
      0093E0 2A 2F 25         [ 4]  445 	call next_token
      0093E3 93 EF            [ 1]  446 	cp a,#TK_NONE 
      0093E5 93 F1            [ 1]  447 	jreq next_line 
      0093E7 93 F3            [ 1]  448 	cp a,#TK_CMD
      0093E9 93 F6            [ 1]  449 	jrne 1$
      0093EB 93 FB 93         [ 4]  450 	call get_code_addr
      0093EE F8               [ 4]  451 	call (x) 
      0093EF 3E 00            [ 2]  452 	jra interp_loop 
      00174F                        453 1$:	 
      0093F1 3D 00            [ 1]  454 	cp a,#TK_VAR
      0093F3 3E 3D            [ 1]  455 	jrne 2$
      0093F5 00 3C 00         [ 4]  456 	call let_var  
      0093F8 3C 3D            [ 2]  457 	jra interp_loop 
      001758                        458 2$:	
      0093FA 00 3C            [ 1]  459 	cp a,#TK_ARRAY 
      0093FC 3E 00            [ 1]  460 	jrne 3$
      0093FE CD 1C 6A         [ 4]  461 	call let_array 
      0093FE 52 04            [ 2]  462 	jra interp_loop
      001761                        463 3$:	
      009400 72 5F            [ 1]  464 	cp a,#TK_COLON 
      009402 00 0E            [ 1]  465 	jreq interp_loop
      009404 1F 01            [ 1]  466 4$: cp a,#TK_LABEL
      009406 AE B3 56         [ 4]  467 	call skip_string 
      009409 1F 03            [ 2]  468 	jra interp_loop 
      00940B E6 02 A4         [ 2]  469 5$:	jp syntax_error 
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
      00176F                        480 next_token::
                                    481 ;	clrw x 
      00940E 0F C7 00         [ 1]  482 	ld a,in 
      009411 0F 1C 00         [ 1]  483 	ld in.saved,a ; in case "_unget_token" needed 
                                    484 ; don't replace sub by "cp a,count" 
                                    485 ; if end of line must return with A=0   	
      009414 03 72 BB         [ 1]  486 	sub a,count 
      009417 00 0E            [ 1]  487 	jreq 9$ ; end of line 
      00177A                        488 0$: 
      009419 FE 13 01         [ 2]  489 	ldw x,basicptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      00941C 27 0C 1E 03      [ 2]  490 	addw x,in.w 
      009420 FE               [ 1]  491 	ld a,(x)
      009421 1D               [ 1]  492 	incw x
      009422 00 02 26 E3      [ 1]  493 	inc in   
      009426 4F               [ 4]  494 9$: ret 
                                    495 
                                    496 ;------------------------
                                    497 ; get cmd and function 
                                    498 ; code address 
                                    499 ; input:
                                    500 ;    X   * cmd|func index 
                                    501 ;        in code_addr table 
                                    502 ;------------------------
      001788                        503 get_code_addr:
      009427 5F               [ 2]  504 	ldw x,(x)
      009428 20 05 1E         [ 2]  505 	ldw x,(code_addr,x)
      00942B 03 1C 00 02      [ 1]  506 	inc in 
      00942F 5B 04 81 01      [ 1]  507 	inc in 
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
      009432 A6 FF            [ 1]  604 	ld a,#255  ; signed conversion  
      009432 89 4F 7D         [ 4]  605     call itoa  ; conversion entier en  .asciz
      009435 27 04 4C         [ 4]  606 	call right_align  
      009438 5C               [ 1]  607 	push a 
      009439 20 F9 85         [ 4]  608 	call puts
      00943C 81               [ 1]  609 	pop a 
      00943D 81               [ 4]  610     ret	
                                    611 
                                    612 ;---------------------------------------
                                    613 ;  print value at xstack top 
                                    614 ;---------------------------------------
      0017E9                        615 print_top: 
      0017E9                        616 	_xpop 
      00943D F6 27            [ 1]    1     ld a,(y)
      00943F 0B               [ 1]    2     ldw x,y 
      009440 90 F1            [ 2]    3     ldw x,(1,x)
      009442 26 05 5C 90      [ 2]    4     addw y,#CELL_SIZE 
      009446 5C 20 F4         [ 1]  617 	ld acc24,a 
      009449 CF 00 0D         [ 2]  618 	ldw acc16,x 
      009449 4F 81 DB         [ 4]  619 	call prt_acc24 
      00944B A6 20            [ 1]  620 	ld a,#SPACE
      00944B A6 01 81         [ 4]  621 	call putc 
      00944E 81               [ 4]  622 	ret 
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
      001801                        638 itoa::
      001801                        639 	_vars VSIZE
      00944E 88 89            [ 2]    1     sub sp,#VSIZE 
      009450 90 F6            [ 1]  640 	clr (LEN,sp) ; string length  
      009452 27 06            [ 1]  641 	clr (SIGN,sp)    ; sign
      009454 F7               [ 1]  642 	tnz A
      009455 5C 90            [ 1]  643 	jreq 1$ ; unsigned conversion  
      009457 5C 20 F6         [ 1]  644 	ld a,base 
      00945A 7F 85            [ 1]  645 	cp a,#10
      00945C 84 81            [ 1]  646 	jrne 1$
                                    647 	; base 10 string display with negative sign if bit 23==1
      00945E 72 0F 00 0C 05   [ 2]  648 	btjf acc24,#7,1$
      00945E 88 52            [ 1]  649 	cpl (SIGN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      009460 02 0F 01         [ 4]  650 	call neg_acc24
      00181B                        651 1$:
                                    652 ; initialize string pointer 
      009463 0F 02 90         [ 2]  653 	ldw x,#tib 
      009466 89 13 01         [ 2]  654 	addw x,#TIB_SIZE
      009469 90               [ 2]  655 	decw x 
      00946A 85               [ 1]  656 	clr (x)
      001823                        657 itoa_loop:
      00946B 27 31 2B         [ 1]  658     ld a,base
                                    659 ;	ldw (PSTR,sp),x 
      00946E 0E 02 D5         [ 4]  660     call divu24_8 ; acc24/A 
                                    661 ;	ldw x,(PSTR,sp)
      00946F AB 30            [ 1]  662     add a,#'0  ; remainder of division
      00946F 72 BB            [ 1]  663     cp a,#'9+1
      009471 00 0E            [ 1]  664     jrmi 2$
      009473 72 B9            [ 1]  665     add a,#7 
      001831                        666 2$:	
      009475 00               [ 2]  667 	decw x
      009476 0E               [ 1]  668     ld (x),a
      009477 03 01            [ 1]  669 	inc (LEN,sp)
                                    670 	; if acc24==0 conversion done
      009479 03 02 20         [ 1]  671 	ld a,acc24
      00947C 05 00 0D         [ 1]  672 	or a,acc16
      00947D CA 00 0E         [ 1]  673 	or a,acc8
      00947D 5A 90            [ 1]  674     jrne itoa_loop
                                    675 	;conversion done, next add '$' or '-' as required
      00947F 5A 0C 02         [ 1]  676 	ld a,base 
      009482 A1 10            [ 1]  677 	cp a,#16
      009482 C6 00            [ 1]  678 	jreq 8$
      009484 0E CA            [ 1]  679 	ld a,(SIGN,sp)
      009486 00 0F            [ 1]  680     jreq 10$
      009488 27 14            [ 1]  681     ld a,#'-
      00948A 72 FB            [ 2]  682 	jra 9$ 
      00184F                        683 8$:	
      00948C 01 72            [ 1]  684 	ld a,#'$ 
      00948E F9               [ 2]  685 9$: decw x
      00948F 01               [ 1]  686     ld (x),a
      009490 90 F6            [ 1]  687 	inc (LEN,sp)
      001855                        688 10$:
      009492 F7 89            [ 1]  689 	ld a,(LEN,sp)
      001857                        690 	_drop VSIZE
      009494 CE 00            [ 2]    1     addw sp,#VSIZE 
      009496 0E               [ 4]  691 	ret
                                    692 
                                    693 ;------------------------------------
                                    694 ; convert alpha to uppercase
                                    695 ; input:
                                    696 ;    a  character to convert
                                    697 ; output:
                                    698 ;    a  uppercase character
                                    699 ;------------------------------------
      00185A                        700 to_upper::
      009497 5A CF            [ 1]  701 	cp a,#'a
      009499 00 0E            [ 1]  702 	jrpl 1$
      00949B 85               [ 4]  703 0$:	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      00949C 20 E4            [ 1]  704 1$: cp a,#'z	
      00949E 22 FB            [ 1]  705 	jrugt 0$
      00949E 5B 02            [ 1]  706 	sub a,#32
      0094A0 84               [ 4]  707 	ret
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
                           000004   720 	XTEMP=4 ; 2 bytes, preserve X 
                           000005   721 	VSIZE=5 ; 5 bytes reserved for local storage
      001866                        722 atoi24::
      001866                        723 	_vars VSIZE
      0094A1 81 05            [ 2]    1     sub sp,#VSIZE 
      0094A2 1F 04            [ 2]  724 	ldw (XTEMP,sp),x 
                                    725 ; conversion made on xstack 
      0094A2 89               [ 1]  726 	clr a 
      0094A3 88               [ 1]  727 	clrw x 
      00186C                        728 	_xpush 
      0094A4 AE 00 31 A6      [ 2]    1     subw y,#CELL_SIZE
      0094A8 4E 7F            [ 1]    2     ld (y),a 
      0094AA 5C 4A 26         [ 2]    3     ldw (1,y),x 
      0094AD FB 84            [ 1]  729 	clr (SIGN,sp)
      0094AF 85 81            [ 1]  730 	ld a,#10
      0094B1 0A 0A            [ 1]  731 	ld (BASE,sp),a ; default base decimal
      0094B3 54 69            [ 2]  732 	ldw x,(XTEMP,sp)
      0094B5 6E               [ 1]  733 	ld a,(x)
      0094B6 79 20            [ 1]  734 	jreq 9$  ; completed if 0
      0094B8 42 41            [ 1]  735 	cp a,#'-
      0094BA 53 49            [ 1]  736 	jrne 1$
      0094BC 43 20            [ 1]  737 	cpl (SIGN,sp)
      0094BE 66 6F            [ 2]  738 	jra 2$
      0094C0 72 20            [ 1]  739 1$: cp a,#'$
      0094C2 53 54            [ 1]  740 	jrne 3$
      0094C4 4D 38            [ 1]  741 	ld a,#16
      0094C6 0A 43            [ 1]  742 	ld (BASE,sp),a
      0094C8 6F               [ 1]  743 2$:	incw x
      0094C9 70 79            [ 2]  744 	ldw (XTEMP,sp),x 
      0094CB 72               [ 1]  745 	ld a,(x)
      001894                        746 3$:	; char to digit 
      0094CC 69 67            [ 1]  747 	cp a,#'a
      0094CE 68 74            [ 1]  748 	jrmi 4$
      0094D0 2C 20            [ 1]  749 	sub a,#32
      0094D2 4A 61            [ 1]  750 4$:	cp a,#'0
      0094D4 63 71            [ 1]  751 	jrmi 9$
      0094D6 75 65            [ 1]  752 	sub a,#'0
      0094D8 73 20            [ 1]  753 	cp a,#10
      0094DA 44 65            [ 1]  754 	jrmi 5$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      0094DC 73 63            [ 1]  755 	sub a,#7
      0094DE 68 65            [ 1]  756 	cp a,(BASE,sp)
      0094E0 6E 65            [ 1]  757 	jrpl 9$
      0094E2 73 20            [ 1]  758 5$:	ld (TEMP,sp),a
      0094E4 32 30            [ 1]  759 	ld a,(BASE,sp)
      0094E6 31               [ 1]  760 	clrw x 
      0094E7 39               [ 1]  761 	rlwa x 
      0018B0                        762 	_xpush 
      0094E8 2C 32 30 32      [ 2]    1     subw y,#CELL_SIZE
      0094EC 32 0A            [ 1]    2     ld (y),a 
      0094EE 76 65 72         [ 2]    3     ldw (1,y),x 
      0094F1 73 69 6F         [ 4]  763 	call mul24
      0094F4 6E               [ 1]  764 	clrw x 
      0094F5 20 00            [ 1]  765 	ld a,(TEMP,sp)
      0094F7 02               [ 1]  766 	rlwa x 
      0018C0                        767 	_xpush 
      0094F7 AE 94 B1 CD      [ 2]    1     subw y,#CELL_SIZE
      0094FB 89 ED            [ 1]    2     ld (y),a 
      0094FD A6 02 C7         [ 2]    3     ldw (1,y),x 
      009500 00 0F 5F         [ 4]  768 	call add24 
      009503 CF 00            [ 2]  769 	ldw x,(XTEMP,sp)
      009505 0D 72            [ 2]  770 	jra 2$
      009507 5F 00            [ 1]  771 9$:	tnz (SIGN,sp)
      009509 24 35            [ 1]  772     jreq atoi_exit
      00950B 0A 00 0B         [ 4]  773     call neg24
      0018D7                        774 atoi_exit:
      0018D7                        775 	_xpop 
      00950E CD 98            [ 1]    1     ld a,(y)
      009510 5B               [ 1]    2     ldw x,y 
      009511 A6 2E            [ 2]    3     ldw x,(1,x)
      009513 CD 89 90 A6      [ 2]    4     addw y,#CELL_SIZE 
      009517 00 C7 00         [ 1]  776 	ld acc24,a 
      00951A 0F 5F CF         [ 2]  777 	ldw acc16,x  
      0018E6                        778 	_drop VSIZE
      00951D 00 0D            [ 2]    1     addw sp,#VSIZE 
      00951F CD               [ 4]  779 	ret
                                    780 
                                    781 
                                    782 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    783 ;;   TINY BASIC  operators,
                                    784 ;;   commands and functions 
                                    785 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    786 
                                    787 ;---------------------------------
                                    788 ; dictionary search 
                                    789 ; input:
                                    790 ;	X 		dictionary entry point, name field  
                                    791 ;   y		.asciz name to search 
                                    792 ; output:
                                    793 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                    794 ;  X		cmd_index
                                    795 ;---------------------------------
                           000001   796 	NLEN=1 ; cmd length 
                           000002   797 	XSAVE=2
                           000004   798 	YSAVE=4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



                           000005   799 	VSIZE=5 
      0018E9                        800 search_dict::
      0018E9                        801 	_vars VSIZE 
      009520 98 5B            [ 2]    1     sub sp,#VSIZE 
      009522 A6 0D            [ 2]  802 	ldw (YSAVE,sp),y 
      0018ED                        803 search_next:
      009524 CD 89            [ 2]  804 	ldw (XSAVE,sp),x 
                                    805 ; get name length in dictionary	
      009526 90               [ 1]  806 	ld a,(x)
      009527 81 0F            [ 1]  807 	and a,#0xf 
      009528 6B 01            [ 1]  808 	ld (NLEN,sp),a  
      009528 90 AE            [ 2]  809 	ldw y,(YSAVE,sp) ; name pointer 
      00952A 17               [ 1]  810 	incw x 
      0018F7                        811 cp_loop:
      00952B 73 72            [ 1]  812 	ld a,(y)
      00952D 5F 00            [ 1]  813 	jreq str_match 
      00952F 23 72            [ 1]  814 	tnz (NLEN,sp)
      009531 5F 00            [ 1]  815 	jreq no_match  
      009533 20               [ 1]  816 	cp a,(x)
      009534 35 04            [ 1]  817 	jrne no_match 
      009536 00 24            [ 1]  818 	incw y 
      009538 35               [ 1]  819 	incw x
      009539 0A 00            [ 1]  820 	dec (NLEN,sp)
      00953B 0B AE            [ 2]  821 	jra cp_loop 
      001909                        822 no_match:
      00953D 00 00            [ 2]  823 	ldw x,(XSAVE,sp) 
      00953F CF 00 05         [ 2]  824 	subw x,#2 ; move X to link field
      009542 CF 00            [ 1]  825 	push #TK_NONE 
      009544 01               [ 2]  826 	ldw x,(x) ; next word link 
      009545 72               [ 1]  827 	pop a ; TK_NONE 
      009546 5F 00            [ 1]  828 	jreq search_exit  ; not found  
                                    829 ;try next 
      009548 04 81            [ 2]  830 	jra search_next
      00954A                        831 str_match:
      00954A 89 72            [ 2]  832 	ldw x,(XSAVE,sp)
      00954C 5F               [ 1]  833 	ld a,(X)
      00954D 00 04            [ 1]  834 	ld (NLEN,sp),a ; needed to test keyword type  
      00954F 72 5F            [ 1]  835 	and a,#NLEN_MASK 
                                    836 ; move x to procedure address field 	
      009551 00               [ 1]  837 	inc a 
      009552 02 AE 00         [ 1]  838 	ld acc8,a 
      009555 80 CF 00 1C      [ 1]  839 	clr acc16 
      009559 CF 00 1E CD      [ 2]  840 	addw x,acc16 
      00955D 94               [ 2]  841 	ldw x,(x) ; routine index  
                                    842 ;determine keyword type bits 7:4 
      00955E A2 85            [ 1]  843 	ld a,(NLEN,sp)
      009560 81 F0            [ 1]  844 	and a,#KW_TYPE_MASK 
      009561 4E               [ 1]  845 	swap a 
      009561 00 00            [ 1]  846 	add a,#128
      001931                        847 search_exit: 
      001931                        848 	_drop VSIZE 
      009563 95 83            [ 2]    1     addw sp,#VSIZE 
      009565 95               [ 4]  849 	ret 
                                    850 
                                    851 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



                                    852 ; check if next token
                                    853 ;  is of expected type 
                                    854 ; input:
                                    855 ;   A 		 expected token attribute
                                    856 ;  ouput:
                                    857 ;   none     if fail call syntax_error 
                                    858 ;--------------------
      001934                        859 expect:
      009566 90               [ 1]  860 	push a 
      009567 95 9E 95         [ 4]  861 	call next_token 
      00956A B7 95            [ 1]  862 	cp a,(1,sp)
      00956C C6 95            [ 1]  863 	jreq 1$
      00956E DC 95 F2         [ 2]  864 	jp syntax_error
      009571 96               [ 1]  865 1$: pop a 
      009572 0C               [ 4]  866 	ret 
                                    867 
                                    868 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    869 ; parse arguments list 
                                    870 ; between ()
                                    871 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001941                        872 func_args:
      009573 96 1D            [ 1]  873 	ld a,#TK_LPAREN 
      009575 96 2E 96         [ 4]  874 	call expect 
                                    875 ; expected to continue in arg_list 
                                    876 ; caller must check for TK_RPAREN 
                                    877 
                                    878 ;-------------------------------
                                    879 ; parse embedded BASIC routines 
                                    880 ; arguments list.
                                    881 ; arg_list::=  expr[','expr]*
                                    882 ; all arguments are of int24_t type
                                    883 ; and pushed on stack 
                                    884 ; input:
                                    885 ;   none
                                    886 ; output:
                                    887 ;   xstack{n}   arguments pushed on xstack
                                    888 ;   A 	number of arguments pushed on xstack  
                                    889 ;--------------------------------
      001946                        890 arg_list:
      009578 3A 96            [ 1]  891 	push #0
      00957A 6D 96 7D         [ 4]  892 1$:	call condition 
      00957D 96               [ 1]  893 	tnz a 
      00957E 91 96            [ 1]  894 	jreq 7$  
      009580 A4 96            [ 1]  895 	inc (1,sp)
      009582 B1 4D 65         [ 4]  896 	call next_token 
      009585 6D 6F            [ 1]  897 	cp a,#TK_COMMA 
      009587 72 79            [ 1]  898 	jreq 1$ 
      009589 20 66            [ 1]  899 	cp a,#TK_RPAREN
      00958B 75 6C            [ 1]  900 	jreq 7$
      00195B                        901 	_unget_token 
      00958D 6C 0A 00 73 79   [ 1]    1      mov in,in.saved  
      009592 6E               [ 1]  902 7$:	pop a  
      009593 74               [ 4]  903 	ret 
                                    904 
                                    905 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



                                    906 ;   BASIC commnands 
                                    907 ;--------------------------------
                                    908 
                                    909 ;--------------------------------
                                    910 ;  arithmetic and relational 
                                    911 ;  routines
                                    912 ;  operators precedence
                                    913 ;  highest to lowest
                                    914 ;  operators on same row have 
                                    915 ;  same precedence and are executed
                                    916 ;  from left to right.
                                    917 ;	'*','/','%'
                                    918 ;   '-','+'
                                    919 ;   '=','>','<','>=','<=','<>','><'
                                    920 ;   '<>' and '><' are equivalent for not equal.
                                    921 ;--------------------------------
                                    922 
                                    923 ;---------------------
                                    924 ; return array element
                                    925 ; address from @(expr)
                                    926 ; input:
                                    927 ;   A 		TK_ARRAY
                                    928 ; output:
                                    929 ;	X 		element address 
                                    930 ;----------------------
      001962                        931 get_array_element:
      009594 61 78 20         [ 4]  932 	call func_args 
      009597 65 72            [ 1]  933 	cp a,#1
      009599 72 6F            [ 1]  934 	jreq 1$
      00959B 72 0A 00         [ 2]  935 	jp syntax_error
      00196C                        936 1$: _xpop 
      00959E 6D 61            [ 1]    1     ld a,(y)
      0095A0 74               [ 1]    2     ldw x,y 
      0095A1 68 20            [ 2]    3     ldw x,(1,x)
      0095A3 6F 70 65 72      [ 2]    4     addw y,#CELL_SIZE 
                                    937     ; ignore A, index < 65536 in any case 
                                    938 	; check for bounds 
      0095A7 61 74 69         [ 2]  939 	cpw x,array_size 
      0095AA 6F 6E            [ 2]  940 	jrule 3$
                                    941 ; bounds {1..array_size}	
      0095AC 20 6F            [ 1]  942 2$: ld a,#ERR_BAD_VALUE 
      0095AE 76 65 72         [ 2]  943 	jp tb_error 
      0095B1 66               [ 2]  944 3$: tnzw  x
      0095B2 6C 6F            [ 1]  945 	jreq 2$ 
      0095B4 77               [ 2]  946 	pushw x 
      0095B5 0A               [ 2]  947 	sllw x 
      0095B6 00 64 69         [ 2]  948 	addw x,(1,sp) ; index*size_of(int24)
      0095B9 76 69            [ 2]  949 	ldw (1,sp),x  
      0095BB 73 69 6F         [ 2]  950 	ldw x,#tib ; array is below tib 
      0095BE 6E 20 62         [ 2]  951 	subw x,(1,sp)
      00198F                        952 	_drop 2   
      0095C1 79 20            [ 2]    1     addw sp,#2 
      0095C3 30               [ 4]  953 	ret 
                                    954 
                                    955 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



                                    956 ;***********************************
                                    957 ;   expression parse,execute 
                                    958 ;***********************************
                                    959 ;-----------------------------------
                                    960 ; factor ::= ['+'|'-'|e]  var | @ |
                                    961 ;			 integer | function |
                                    962 ;			 '('relation')' 
                                    963 ; output:
                                    964 ;   A       token attribute 
                                    965 ;   xstack  value  
                                    966 ; ---------------------------------
                           000001   967 	NEG=1
                           000001   968 	VSIZE=1
      001992                        969 factor:
      001992                        970 	_vars VSIZE 
      0095C4 0A 00            [ 2]    1     sub sp,#VSIZE 
      0095C6 69 6E            [ 1]  971 	clr (NEG,sp)
      0095C8 76 61 6C         [ 4]  972 	call next_token
      0095CB 69               [ 1]  973 	tnz a 
      0095CC 64 20            [ 1]  974 	jrne 1$ 
      0095CE 6C 69 6E         [ 2]  975 	jp 22$ 
      0095D1 65 20            [ 1]  976 1$:	cp a,#TK_PLUS 
      0095D3 6E 75            [ 1]  977 	jreq 2$
      0095D5 6D 62            [ 1]  978 	cp a,#TK_MINUS 
      0095D7 65 72            [ 1]  979 	jrne 4$ 
      0095D9 2E 0A            [ 1]  980 	cpl (NEG,sp)
      0019A9                        981 2$:	
      0095DB 00 72 75         [ 4]  982 	call next_token
      0019AC                        983 4$:
      0095DE 6E               [ 1]  984 	tnz a 
      0095DF 20 74            [ 1]  985 	jrne 41$ 
      0095E1 69 6D 65         [ 2]  986 	jp syntax_error  
      0019B2                        987 41$:	
      0095E4 20 6F            [ 1]  988 	cp a,#TK_IFUNC 
      0095E6 6E 6C            [ 1]  989 	jrne 5$ 
      0095E8 79 20 75         [ 4]  990 	call get_code_addr 
      0095EB 73               [ 4]  991 	call (x); result in A:X  
      0095EC 61 67            [ 2]  992 	jra 18$ 
      0019BC                        993 5$:
      0095EE 65 2E            [ 1]  994 	cp a,#TK_INTGR
      0095F0 0A 00            [ 1]  995 	jrne 6$
      0095F2 63 6F 6D         [ 4]  996 	call get_int24 ; A:X
      0095F5 6D 61            [ 2]  997 	jra 18$
      0019C5                        998 6$:
      0095F7 6E 64            [ 1]  999 	cp a,#TK_ARRAY
      0095F9 20 6C            [ 1] 1000 	jrne 7$
      0095FB 69 6E 65         [ 4] 1001 	call get_array_element
      0095FE 20 6F            [ 2] 1002     jra 71$
      0019CE                       1003 7$:
      009600 6E 6C            [ 1] 1004 	cp a,#TK_VAR 
      009602 79 20            [ 1] 1005 	jrne 8$
      009604 75 73 61         [ 4] 1006 	call get_addr 
      0019D5                       1007 71$: ; put value in A:X
      009607 67               [ 1] 1008 	ld a,(x)
      009608 65 2E            [ 2] 1009 	ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      00960A 0A 00            [ 2] 1010 	jra 18$
      0019DA                       1011 8$:
      00960C 64 75            [ 1] 1012 	cp a,#TK_LABEL 
      00960E 70 6C            [ 1] 1013 	jrne 9$ 
      009610 69               [ 2] 1014 	pushw x 
      009611 63 61 74         [ 4] 1015 	call skip_string
      009614 65               [ 2] 1016 	popw x 
      009615 20 6E 61         [ 4] 1017 	call search_const 
      009618 6D               [ 2] 1018 	tnzw x 
      009619 65 2E            [ 1] 1019 	jreq 16$
      00961B 0A 00 46         [ 4] 1020 	call get_const_value ; in A:X 
      00961E 69 6C            [ 2] 1021 	jra 18$
      0019EE                       1022 9$: 
      009620 65 20            [ 1] 1023 	cp a,#TK_CFUNC 
      009622 6E 6F            [ 1] 1024 	jrne 12$
      009624 74 20 66         [ 4] 1025 	call get_code_addr 
      009627 6F               [ 4] 1026 	call(x)
      009628 75               [ 1] 1027 	clrw x 
      009629 6E               [ 1] 1028 	rlwa x  ; char>int24 in A:X 
      00962A 64 2E            [ 2] 1029 	jra 18$ 	 
      0019FA                       1030 12$:			
      00962C 0A 00            [ 1] 1031 	cp a,#TK_LPAREN
      00962E 62 61            [ 1] 1032 	jrne 16$
      009630 64 20 76         [ 4] 1033 	call expression
      009633 61 6C            [ 1] 1034 	ld a,#TK_RPAREN 
      009635 75 65 2E         [ 4] 1035 	call expect
      001A06                       1036 	_xpop 
      009638 0A 00            [ 1]    1     ld a,(y)
      00963A 46               [ 1]    2     ldw x,y 
      00963B 69 6C            [ 2]    3     ldw x,(1,x)
      00963D 65 20 69 6E      [ 2]    4     addw y,#CELL_SIZE 
      009641 20 65            [ 2] 1037 	jra 18$	
      001A11                       1038 16$:
      001A11                       1039 	_unget_token 
      009643 78 74 65 6E 64   [ 1]    1      mov in,in.saved  
      009648 65               [ 1] 1040 	clr a 
      009649 64 20            [ 2] 1041 	jra 22$ 
      001A19                       1042 18$: 
      00964B 6D 65            [ 1] 1043 	tnz (NEG,sp)
      00964D 6D 6F            [ 1] 1044 	jreq 20$
      00964F 72 79 2C         [ 4] 1045 	call neg_ax   
      001A20                       1046 20$:
      001A20                       1047 	_xpush 
      009652 20 63 61 6E      [ 2]    1     subw y,#CELL_SIZE
      009656 27 74            [ 1]    2     ld (y),a 
      009658 20 62 65         [ 2]    3     ldw (1,y),x 
      00965B 20 72            [ 1] 1048 	ld a,#TK_INTGR
      001A2B                       1049 22$:
      001A2B                       1050 	_drop VSIZE
      00965D 75 6E            [ 2]    1     addw sp,#VSIZE 
      00965F 20               [ 4] 1051 	ret
                                   1052 
                                   1053 
                                   1054 ;-----------------------------------
                                   1055 ; term ::= factor [['*'|'/'|'%'] factor]* 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



                                   1056 ; output:
                                   1057 ;   A    	token attribute 
                                   1058 ;	xstack		value 
                                   1059 ;-----------------------------------
                           000001  1060 	MULOP=1
                           000001  1061 	VSIZE=1
      001A2E                       1062 term:
      001A2E                       1063 	_vars VSIZE
      009660 66 72            [ 2]    1     sub sp,#VSIZE 
                                   1064 ; first factor 	
      009662 6F 6D 20         [ 4] 1065 	call factor
      009665 74               [ 1] 1066 	tnz a 
      009666 68 65            [ 1] 1067 	jreq term_exit  
      001A36                       1068 term01:	 ; check for  operator '*'|'/'|'%' 
      009668 72 65 2E         [ 4] 1069 	call next_token
      00966B 0A 00            [ 1] 1070 	ld (MULOP,sp),a
      00966D 4E 6F            [ 1] 1071 	and a,#TK_GRP_MASK
      00966F 20 64            [ 1] 1072 	cp a,#TK_GRP_MULT
      009671 61 74            [ 1] 1073 	jreq 1$
      009673 61 20            [ 1] 1074 	ld a,#TK_INTGR
      001A43                       1075 	_unget_token 
      009675 66 6F 75 6E 64   [ 1]    1      mov in,in.saved  
      00967A 2E 0A            [ 2] 1076 	jra term_exit 
      001A4A                       1077 1$:	; got *|/|%
                                   1078 ;second factor
      00967C 00 4E 6F         [ 4] 1079 	call factor
      00967F 20               [ 1] 1080 	tnz a 
      009680 70 72            [ 1] 1081 	jrne 2$ 
      009682 6F 67 72         [ 2] 1082 	jp syntax_error 
      001A53                       1083 2$: ; select operation 	
      009685 61 6D            [ 1] 1084 	ld a,(MULOP,sp) 
      009687 20 69            [ 1] 1085 	cp a,#TK_MULT 
      009689 6E 20            [ 1] 1086 	jrne 3$
                                   1087 ; '*' operator
      00968B 52 41 4D         [ 4] 1088 	call mul24 
      00968E 21 0A            [ 2] 1089 	jra term01
      009690 00 46            [ 1] 1090 3$: cp a,#TK_DIV 
      009692 69 6C            [ 1] 1091 	jrne 4$ 
                                   1092 ; '/' operator	
      009694 65 20 73         [ 4] 1093 	call div24 
      009697 79 73            [ 2] 1094 	jra term01 
      001A67                       1095 4$: ; '%' operator
      009699 74 65 6D         [ 4] 1096 	call mod24
      00969C 20 66            [ 2] 1097 	jra term01 
      001A6C                       1098 9$: 
      00969E 75 6C            [ 1] 1099 	ld a,#TK_INTGR
      001A6E                       1100 term_exit:
      001A6E                       1101 	_drop VSIZE 
      0096A0 6C 2E            [ 2]    1     addw sp,#VSIZE 
      0096A2 0A               [ 4] 1102 	ret 
                                   1103 
                                   1104 ;-------------------------------
                                   1105 ;  expr ::= term [['+'|'-'] term]*
                                   1106 ;  result range {-32768..32767}
                                   1107 ;  output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



                                   1108 ;   A    token attribute 
                                   1109 ;   xstack	 result    
                                   1110 ;-------------------------------
                           000001  1111 	OP=1 
                           000001  1112 	VSIZE=1 
      001A71                       1113 expression:
      001A71                       1114 	_vars VSIZE 
      0096A3 00 42            [ 2]    1     sub sp,#VSIZE 
                                   1115 ; first term 	
      0096A5 75 66 66         [ 4] 1116 	call term
      0096A8 65               [ 1] 1117 	tnz a 
      0096A9 72 20            [ 1] 1118 	jreq 9$
      001A79                       1119 1$:	; operator '+'|'-'
      0096AB 66 75 6C         [ 4] 1120 	call next_token
      0096AE 6C 0A            [ 1] 1121 	ld (OP,sp),a 
      0096B0 00 6F            [ 1] 1122 	and a,#TK_GRP_MASK
      0096B2 76 65            [ 1] 1123 	cp a,#TK_GRP_ADD 
      0096B4 72 66            [ 1] 1124 	jreq 2$ 
      001A84                       1125 	_unget_token 
      0096B6 6C 6F 77 0A 00   [ 1]    1      mov in,in.saved  
      0096BB 0A 72            [ 1] 1126 	ld a,#TK_INTGR
      0096BD 75 6E            [ 2] 1127 	jra 9$ 
      001A8D                       1128 2$: ; second term 
      0096BF 20 74 69         [ 4] 1129 	call term
      0096C2 6D               [ 1] 1130 	tnz a 
      0096C3 65 20            [ 1] 1131 	jrne 3$
      0096C5 65 72 72         [ 2] 1132 	jp syntax_error
      001A96                       1133 3$:
      0096C8 6F 72            [ 1] 1134 	ld a,(OP,sp)
      0096CA 2C 20            [ 1] 1135 	cp a,#TK_PLUS 
      0096CC 00 0A            [ 1] 1136 	jrne 4$
                                   1137 ; '+' operator	
      0096CE 63 6F 6D         [ 4] 1138 	call add24
      0096D1 70 69            [ 2] 1139 	jra 1$ 
      001AA1                       1140 4$:	; '-' operator 
      0096D3 6C 65 20         [ 4] 1141 	call sub24
      0096D6 65 72            [ 2] 1142 	jra 1$
      001AA6                       1143 9$:
      001AA6                       1144 	_drop VSIZE 
      0096D8 72 6F            [ 2]    1     addw sp,#VSIZE 
      0096DA 72               [ 4] 1145 	ret 
                                   1146 
                                   1147 ;---------------------------------------------
                                   1148 ; rel ::= expr rel_op expr
                                   1149 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   1150 ;  relation return  integer , zero is false 
                                   1151 ;  output:
                                   1152 ;	 xstack		value  
                                   1153 ;---------------------------------------------
                           000001  1154 	RELOP=1
                           000001  1155 	VSIZE=1 
      001AA9                       1156 relation: 
      001AA9                       1157 	_vars VSIZE
      0096DB 2C 20            [ 2]    1     sub sp,#VSIZE 
      0096DD 00 6C 61         [ 4] 1158 	call expression
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      0096E0 73               [ 1] 1159 	tnz a 
      0096E1 74 20            [ 1] 1160 	jreq 9$ 
                                   1161 ; expect rel_op or leave 
      0096E3 74 6F 6B         [ 4] 1162 	call next_token 
      0096E6 65 6E            [ 1] 1163 	ld (RELOP,sp),a 
      0096E8 20 69            [ 1] 1164 	and a,#TK_GRP_MASK
      0096EA 64 3A            [ 1] 1165 	cp a,#TK_GRP_RELOP 
      0096EC 20 00            [ 1] 1166 	jreq 2$
      0096EE A6 84            [ 1] 1167 	ld a,#TK_INTGR 
      001ABE                       1168 	_unget_token 
      0096EE A6 02 02 00 01   [ 1]    1      mov in,in.saved  
      0096F0 20 40            [ 2] 1169 	jra 9$ 
      001AC5                       1170 2$:	; expect another expression
      0096F0 72 0A 00         [ 4] 1171 	call expression
      0096F3 23               [ 1] 1172 	tnz a 
      0096F4 4C 88            [ 1] 1173 	jrne 3$
      0096F6 AE 96 BB         [ 2] 1174 	jp syntax_error 
      001ACE                       1175 3$: 
      0096F9 CD 89 ED         [ 4] 1176 	call cp24 
      001AD1                       1177 	_xpop  
      0096FC 84 AE            [ 1]    1     ld a,(y)
      0096FE 95               [ 1]    2     ldw x,y 
      0096FF 61 72            [ 2]    3     ldw x,(1,x)
      009701 5F 00 0E 48      [ 2]    4     addw y,#CELL_SIZE 
      009705 72               [ 1] 1178 	tnz a 
      009706 59 00            [ 1] 1179 	jrmi 4$
      009708 0E C7            [ 1] 1180 	jrne 5$
      00970A 00 0F 72 BB      [ 1] 1181 	mov acc8,#2 ; i1==i2
      00970E 00 0E            [ 2] 1182 	jra 6$ 
      001AE5                       1183 4$: ; i1<i2
      009710 FE CD 89 ED      [ 1] 1184 	mov acc8,#4 
      009714 CE 00            [ 2] 1185 	jra 6$
      001AEB                       1186 5$: ; i1>i2
      009716 05 C6 00 04      [ 1] 1187 	mov acc8,#1  
      001AEF                       1188 6$: ; 0=false, -1=true 
      00971A 90               [ 1] 1189 	clrw x 
      00971B 5F 90 02         [ 1] 1190 	ld a, acc8  
      00971E CD 86            [ 1] 1191 	and a,(RELOP,sp)
      009720 EC CE            [ 1] 1192 	jreq 7$
      009722 00               [ 2] 1193 	cplw x 
      009723 05 C6            [ 1] 1194 	ld a,#255 
      001AFA                       1195 7$:	_xpush 
      009725 00 02 CD A0      [ 2]    1     subw y,#CELL_SIZE
      009729 34 AE            [ 1]    2     ld (y),a 
      00972B 96 DE CD         [ 2]    3     ldw (1,y),x 
      00972E 89 ED            [ 1] 1196 	ld a,#TK_INTGR
      001B05                       1197 9$: 
      001B05                       1198 	_drop VSIZE
      009730 C6 00            [ 2]    1     addw sp,#VSIZE 
      009732 03               [ 4] 1199 	ret 
                                   1200 
                                   1201 ;-------------------------------------------
                                   1202 ;  AND factor:  [NOT] relation | (condition)
                                   1203 ;  output:
                                   1204 ;     A      TK_INTGR|0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



                                   1205 ;-------------------------------------------
                           000001  1206 	NOT_OP=1
      001B08                       1207 and_factor:
      009733 5F 97            [ 1] 1208 	push #0 
      009735 72 BB 00         [ 4] 1209 0$:	call next_token  
      009738 05               [ 1] 1210 	tnz a 
      009739 F6 5F            [ 1] 1211 	jreq 8$ 
      00973B 97 CD            [ 1] 1212 	cp a,#TK_NOT 
      00973D 98 44            [ 1] 1213 	jrne 1$ 
      00973F 20 35            [ 1] 1214 	cpl (NOT_OP,sp)
      009741 20 F2            [ 2] 1215 	jra 0$ 
      001B18                       1216 1$:	
      009741 88 AE            [ 1] 1217 	cp a,#TK_LPAREN 
      009743 96 CD            [ 1] 1218 	jrne 2$
      009745 CD 89 ED         [ 4] 1219 	call condition
      009748 84 AE            [ 1] 1220 	ld a,#TK_RPAREN 
      00974A 95 61 72         [ 4] 1221 	call expect
      00974D 5F 00            [ 2] 1222 	jra 3$
      001B26                       1223 2$: _unget_token 
      00974F 0E 48 72 59 00   [ 1]    1      mov in,in.saved  
      009754 0E C7 00         [ 4] 1224 	call relation
      001B2E                       1225 3$:
      009757 0F 72            [ 1] 1226 	tnz (NOT_OP,sp)
      009759 BB 00            [ 1] 1227 	jreq 8$ 
      00975B 0E FE CD         [ 4] 1228 	call cpl24
      001B35                       1229 8$:
      001B35                       1230 	_drop 1  
      00975E 89 ED            [ 2]    1     addw sp,#1 
      009760 AE               [ 4] 1231     ret 
                                   1232 
                                   1233 
                                   1234 ;--------------------------------------------
                                   1235 ;  AND operator as priority over OR||XOR 
                                   1236 ;  format: relation | (condition) [AND relation|(condition)]*
                                   1237 ;          
                                   1238 ;  output:
                                   1239 ;     A     TK_INTGR|0
                                   1240 ;    xtack   value 
                                   1241 ;--------------------------------------------
      001B38                       1242 and_cond:
      009761 16 68 CD         [ 4] 1243 	call and_factor
      009764 89               [ 1] 1244 	tnz a 
      009765 ED A6            [ 1] 1245 	jreq 9$  
      009767 0D CD 89         [ 4] 1246 1$: call next_token 
      00976A 90               [ 1] 1247 	tnz a 
      00976B CE 00            [ 1] 1248 	jreq 6$ 
      00976D 01 CD            [ 1] 1249 	cp a,#TK_AND 
      00976F 8A 5A            [ 1] 1250 	jreq 3$
      001B48                       1251 	_unget_token 
      009771 A6 5E CD 89 90   [ 1]    1      mov in,in.saved  
      009776 AE 17            [ 2] 1252 	jra 6$ 
      009778 FF 94 08         [ 4] 1253 3$:	call and_factor  
      00977A 4D               [ 1] 1254 	tnz a 
      00977A CD 95            [ 1] 1255 	jrne 4$
      00977C 28 16 6E         [ 2] 1256 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      00977D                       1257 4$:	
      001B58                       1258 	_xpop 
      00977D A6 0D            [ 1]    1     ld a,(y)
      00977F CD               [ 1]    2     ldw x,y 
      009780 89 90            [ 2]    3     ldw x,(1,x)
      009782 A6 3E CD 89      [ 2]    4     addw y,#CELL_SIZE 
      009786 90 CD 8A         [ 1] 1259 	ld acc24,a 
      009789 F2 72 5D         [ 2] 1260 	ldw acc16,x
      001B67                       1261 	_xpop 
      00978C 00 04            [ 1]    1     ld a,(y)
      00978E 27               [ 1]    2     ldw x,y 
      00978F ED CD            [ 2]    3     ldw x,(1,x)
      009791 91 1B 72 5D      [ 2]    4     addw y,#CELL_SIZE 
      009795 00 04 27         [ 1] 1262 	and a,acc24 
      009798 E4               [ 1] 1263 	rlwa x 
      009799 C4 00 0D         [ 1] 1264 	and a,acc16 
      009799 C6               [ 1] 1265 	rlwa x 
      00979A 00 02 C1         [ 1] 1266 	and a,acc8 
      00979D 00               [ 1] 1267 	rlwa x
      001B7C                       1268 	_xpush
      00979E 04 2B 1D 03      [ 2]    1     subw y,#CELL_SIZE
      0097A1 90 F7            [ 1]    2     ld (y),a 
      0097A1 72 01 00         [ 2]    3     ldw (1,y),x 
      0097A4 23 D7            [ 2] 1269 	jra 1$  
      0097A6 CE 00            [ 1] 1270 6$: ld a,#TK_INTGR 
      0097A8 05               [ 4] 1271 9$:	ret 	 
                                   1272 
                                   1273 
                                   1274 ;--------------------------------------------
                                   1275 ; condition for IF and UNTIL 
                                   1276 ; operators: OR,XOR 
                                   1277 ; format:  and_cond [ OP and_cond ]* 
                                   1278 ; output:
                                   1279 ;    A        INTGR|0 
                                   1280 ;    xstack   value 
                                   1281 ;--------------------------------------------
                           000001  1282 	ATMP=1
                           000002  1283 	OP=2
                           000002  1284 	VSIZE=2 
      001B8A                       1285 condition:
      001B8A                       1286 	_vars VSIZE 
      0097A9 72 BB            [ 2]    1     sub sp,#VSIZE 
      0097AB 00 01 C3         [ 4] 1287 	call and_cond
      0097AE 00               [ 1] 1288 	tnz a 
      0097AF 1E 2A            [ 1] 1289 	jreq 9$ 
      0097B1 C8 CF 00         [ 4] 1290 1$:	call next_token 
      0097B4 05 E6            [ 1] 1291 	cp a,#TK_OR 
      0097B6 02 C7            [ 1] 1292 	jreq 2$
      0097B8 00 04            [ 1] 1293 	cp a,#TK_XOR
      0097BA 35 03            [ 1] 1294 	jreq 2$ 
      001B9D                       1295 	_unget_token 
      0097BC 00 02 02 00 01   [ 1]    1      mov in,in.saved  
      0097BE 20 55            [ 2] 1296 	jra 8$ 
      0097BE CD 97            [ 1] 1297 2$:	ld (OP,sp),a ; TK_OR|TK_XOR 
      0097C0 EF A1 00         [ 4] 1298 	call and_cond
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      0097C3 27 DC            [ 1] 1299 	cp a,#TK_INTGR 
      0097C5 A1 80            [ 1] 1300 	jreq 3$
      0097C7 26 06 CD         [ 2] 1301 	jp syntax_error 
      001BB0                       1302 3$:	 
      001BB0                       1303 	_xpop  ; rigth arg 
      0097CA 98 08            [ 1]    1     ld a,(y)
      0097CC FD               [ 1]    2     ldw x,y 
      0097CD 20 EF            [ 2]    3     ldw x,(1,x)
      0097CF 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0097CF A1 85 26         [ 1] 1304 	ld acc24,a 
      0097D2 05 CD 9C         [ 2] 1305 	ldw acc16,x 
      001BBF                       1306 	_xpop  ; left arg  
      0097D5 EF 20            [ 1]    1     ld a,(y)
      0097D7 E6               [ 1]    2     ldw x,y 
      0097D8 EE 01            [ 2]    3     ldw x,(1,x)
      0097D8 A1 05 26 05      [ 2]    4     addw y,#CELL_SIZE 
      0097DC CD 9C            [ 1] 1307 	ld (ATMP,sp),a 
      0097DE EA 20            [ 1] 1308 	ld a,(OP,sp)
      0097E0 DD 8A            [ 1] 1309 	cp a,#TK_XOR 
      0097E1 27 10            [ 1] 1310 	jreq 5$ 
      001BD0                       1311 4$: ; A:X OR acc24   
      0097E1 A1 0A            [ 1] 1312 	ld a,(ATMP,sp)
      0097E3 27 D9 A1         [ 1] 1313 	or a,acc24 
      0097E6 03               [ 1] 1314 	rlwa x 
      0097E7 CD 98 15         [ 1] 1315 	or a,acc16 
      0097EA 20               [ 1] 1316 	rlwa x 
      0097EB D2 CC 96         [ 1] 1317 	or a,acc8 
      0097EE EE               [ 1] 1318 	rlwa x 
      0097EF 20 0E            [ 2] 1319 	jra 6$  
      001BE0                       1320 5$: ; A:X XOR acc24 
      0097EF C6 00            [ 1] 1321 	ld a,(ATMP,sp)
      0097F1 02 C7 00         [ 1] 1322 	xor a,acc24 
      0097F4 03               [ 1] 1323 	rlwa x 
      0097F5 C0 00 04         [ 1] 1324 	xor a,acc16 
      0097F8 27               [ 1] 1325 	rlwa x 
      0097F9 0D 00 0E         [ 1] 1326 	xor a,acc8 
      0097FA 02               [ 1] 1327 	rlwa x 
      001BEE                       1328 6$: _xpush
      0097FA CE 00 05 72      [ 2]    1     subw y,#CELL_SIZE
      0097FE BB 00            [ 1]    2     ld (y),a 
      009800 01 F6 5C         [ 2]    3     ldw (1,y),x 
      009803 72 5C            [ 2] 1329 	jra 1$ 
      009805 00 02            [ 1] 1330 8$:	ld a,#TK_INTGR 
      001BFB                       1331 9$:	_drop VSIZE 
      009807 81 02            [ 2]    1     addw sp,#VSIZE 
      009808 81               [ 4] 1332 	ret 
                                   1333 
                                   1334 
                                   1335 ;--------------------------------------------
                                   1336 ; BASIC: HEX 
                                   1337 ; select hexadecimal base for integer print
                                   1338 ;---------------------------------------------
      001BFE                       1339 hex_base:
      009808 FE DE B3 5E      [ 1] 1340 	mov base,#16 
      00980C 72               [ 4] 1341 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



                                   1342 
                                   1343 ;--------------------------------------------
                                   1344 ; BASIC: DEC 
                                   1345 ; select decimal base for integer print
                                   1346 ;---------------------------------------------
      001C03                       1347 dec_base:
      00980D 5C 00 02 72      [ 1] 1348 	mov base,#10
      009811 5C               [ 4] 1349 	ret 
                                   1350 
                                   1351 ;------------------------
                                   1352 ; BASIC: FREE 
                                   1353 ; return free size in RAM 
                                   1354 ; output:
                                   1355 ;   A:x		size 
                                   1356 ;--------------------------
      001C08                       1357 free:
      009812 00 02            [ 2] 1358 	pushw y 
      009814 81               [ 1] 1359 	clr a 
      009815 AE 16 68         [ 2] 1360 	ldw x,#tib 
      009815 F6 27 03 5C      [ 2] 1361 	ldw y,txtend 
      009819 20 FA 5C 72      [ 2] 1362 	cpw y,#app_space
      00981D B0 00            [ 1] 1363 	jrult 1$
      00981F 05 CF 00         [ 2] 1364 	subw x,#free_ram 
      009822 01 81            [ 2] 1365 	jra 2$ 
      009824                       1366 1$:	
      009824 FE 72 5C 00      [ 2] 1367 	subw x,txtend
      009828 02 72            [ 2] 1368 2$:	popw y 
      00982A 5C               [ 4] 1369 	ret 
                                   1370 
                                   1371 ;------------------------------
                                   1372 ; BASIC: SIZE 
                                   1373 ; command that print 
                                   1374 ; program start addres and size 
                                   1375 ;------------------------------
      001C24                       1376 cmd_size:
      00982B 00 02 81         [ 1] 1377 	push base 
      00982E AE 1E 81         [ 2] 1378 	ldw x,#PROG_ADDR 
      00982E F6 EE 01         [ 4] 1379 	call puts 
      009831 72 5C 00         [ 2] 1380 	ldw x,txtbgn     
      009834 02 72 5C 00      [ 1] 1381 	mov base,#16 
      009838 02 72 5C         [ 4] 1382 	call prt_i16
      00983B 00 02 81         [ 1] 1383 	pop base 
      00983E AE 1E 93         [ 2] 1384 	ldw x,#PROG_SIZE 
      00983E F6 72 5C         [ 4] 1385 	call puts 
      009841 00 02 81         [ 2] 1386 	ldw x,txtend 
      009844 72 B0 00 1B      [ 2] 1387 	subw x,txtbgn 
      009844 72 5F 00         [ 4] 1388 	call prt_i16
      009847 0D CF 00         [ 2] 1389 	ldw x,#STR_BYTES 
      00984A 0E A6 10         [ 4] 1390 	call puts  
      00984D C1               [ 4] 1391 	ret 
                                   1392 
                                   1393 
                                   1394 ;------------------------
                                   1395 ; BASIC: UBOUND  
                                   1396 ; return array variable size 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



                                   1397 ; and set 'array_size' variable 
                                   1398 ; output:
                                   1399 ;   A:X 	array_size
                                   1400 ;--------------------------
      001C51                       1401 ubound:
      00984E 00 0B 27         [ 4] 1402 	call free 
      009851 09 72            [ 1] 1403 	ld a,#CELL_SIZE 
      009853 0F               [ 2] 1404 	div x,a 
      009854 00 0E 04         [ 2] 1405 	ldw array_size,x
      009857 72               [ 1] 1406 	clr a 
      009858 53               [ 4] 1407 	ret 
                                   1408 
                                   1409 ;-----------------------------
                                   1410 ; BASIC: LET var=expr 
                                   1411 ; variable assignement 
                                   1412 ; output:
                                   1413 ;   A 		TK_NONE 
                                   1414 ;-----------------------------
      001C5C                       1415 let::
      009859 00 0D 6F         [ 4] 1416 	call next_token 
      00985B A1 85            [ 1] 1417 	cp a,#TK_VAR 
      00985B A6 FF            [ 1] 1418 	jreq let_var
      00985D CD 98            [ 1] 1419 	cp a,#TK_ARRAY 
      00985F 81 CD            [ 1] 1420 	jreq  let_array
      009861 91 C5 88         [ 2] 1421 	jp syntax_error
      001C6A                       1422 let_array:
      009864 CD 89 ED         [ 4] 1423 	call get_array_element
      009867 84 81            [ 2] 1424 	jra let_eval 
      009869                       1425 let_var:
      009869 90 F6 93         [ 4] 1426 	call get_addr
      001C72                       1427 let_eval:
      00986C EE 01 72         [ 2] 1428 	ldw ptr16,x  ; variable address 
      00986F A9 00 03         [ 4] 1429 	call next_token 
      009872 C7 00            [ 1] 1430 	cp a,#TK_EQUAL
      009874 0D CF            [ 1] 1431 	jreq 1$
      009876 00 0E CD         [ 2] 1432 	jp syntax_error
      001C7F                       1433 1$:	
      009879 98 5B A6         [ 4] 1434 	call condition   
      00987C 20 CD            [ 1] 1435 	cp a,#TK_INTGR 
      00987E 89 90            [ 1] 1436 	jreq 2$
      009880 81 16 6E         [ 2] 1437 	jp syntax_error
      009881                       1438 2$:	
      001C89                       1439 	_xpop ; value 
      009881 52 04            [ 1]    1     ld a,(y)
      009883 0F               [ 1]    2     ldw x,y 
      009884 02 0F            [ 2]    3     ldw x,(1,x)
      009886 01 4D 27 11      [ 2]    4     addw y,#CELL_SIZE 
      001C92                       1440 3$:
      00988A C6 00 0B A1      [ 4] 1441 	ld [ptr16],a
      00988E 0A 26 0A 72      [ 1] 1442 	inc ptr8  
      009892 0F 00 0D 05      [ 5] 1443 	ldw [ptr16],x 
      009896 03               [ 4] 1444 	ret 
                                   1445 
                                   1446 
                                   1447 ;--------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



                                   1448 ; return constant value 
                                   1449 ; from it's record address
                                   1450 ; input:
                                   1451 ;	X	*const record 
                                   1452 ; output:
                                   1453 ;   A:X   const  value
                                   1454 ;--------------------------
      001C9F                       1455 get_const_value: ; -- i 
      009897 01               [ 1] 1456 	ld a,(x) ; record size 
      009898 CD 82            [ 1] 1457 	sub a,#3 ; * value 
      00989A 89               [ 1] 1458 	push a 
      00989B 4B 00            [ 1] 1459 	push #0 
      00989B AE 16 68         [ 2] 1460 	addw x,(1,sp)
      00989E 1C               [ 1] 1461 	ld a,(x)
      00989F 00 50            [ 2] 1462 	ldw x,(1,x)
      001CAB                       1463 	_drop 2
      0098A1 5A 7F            [ 2]    1     addw sp,#2 
      0098A3 81               [ 4] 1464 	ret 
                                   1465 
                                   1466 
                                   1467 ;--------------------------
                                   1468 ; list constants in EEPROM 
                                   1469 ; call when using LIST \C 
                                   1470 ;-------------------------
                           000001  1471 	COUNT=1
                           000003  1472 	YTEMP=3
                           000004  1473 	VSIZE=4 
      001CAE                       1474 list_const:
      0098A3 C6 00            [ 2] 1475 	pushw y 
      001CB0                       1476 	_vars 4 
      0098A5 0B CD            [ 2]    1     sub sp,#4 
      0098A7 83               [ 1] 1477 	clrw x 
      0098A8 55 AB            [ 2] 1478 	ldw (COUNT,sp),x  
      0098AA 30 A1 3A 2B      [ 2] 1479 	ldw Y,#EEPROM_BASE 
      0098AE 02 AB 07 24      [ 2] 1480 1$:	cpw y,free_eeprom 
      0098B1 24 35            [ 1] 1481 	jruge 9$
      0098B1 5A F7            [ 2] 1482     ldw (YTEMP,sp),y 
      0098B3 0C               [ 1] 1483 	ldw x,y
      0098B4 02               [ 1] 1484 	incw x 
      0098B5 C6 00 0D         [ 4] 1485 	call puts  
      0098B8 CA 00            [ 1] 1486 	ld a,#'= 
      0098BA 0E CA 00         [ 4] 1487 	call putc 
      0098BD 0F 26            [ 2] 1488 	ldw x,(YTEMP,sp)
      0098BF E3 C6 00         [ 4] 1489 	call get_const_value 
      0098C2 0B A1 10         [ 1] 1490 	ld acc24,a 
      0098C5 27 08 7B         [ 2] 1491 	ldw acc16,x 
      0098C8 01 27 0A         [ 4] 1492 	call prt_acc24
      0098CB A6 2D            [ 1] 1493 	ld a,#CR 
      0098CD 20 02 10         [ 4] 1494 	call putc 
      0098CF 1E 01            [ 2] 1495 	ldw x,(COUNT,sp)
      0098CF A6               [ 1] 1496 	incw x 
      0098D0 24 5A            [ 2] 1497 	ldw (COUNT,sp),x 
      0098D2 F7 0C 02 0D      [ 1] 1498 	clr acc16 
      0098D5 16 03            [ 2] 1499 	ldw y,(YTEMP,sp)
      0098D5 7B 02            [ 1] 1500 	ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      0098D7 5B 04 81         [ 1] 1501 	ld acc8,a
      0098DA 72 B9 00 0D      [ 2] 1502 	addw y,acc16 
      0098DA A1 61            [ 2] 1503 	jra 1$ 
      001CF4                       1504 9$:	
      0098DC 2A 01            [ 2] 1505 	ldw x,(COUNT,sp)
      0098DE 81 A1 7A         [ 4] 1506 	call prt_i16 
      0098E1 22 FB A0         [ 2] 1507 	ldw x,#CONST_COUNT 
      0098E4 20 81 6D         [ 4] 1508 	call puts 
      0098E6                       1509 	_drop VSIZE 
      0098E6 52 05            [ 2]    1     addw sp,#VSIZE 
      0098E8 1F 04            [ 2] 1510 	popw y 
      0098EA 4F               [ 4] 1511 	ret 
                                   1512 
      0098EB 5F 72 A2 00 03 90 F7  1513 CONST_COUNT: .asciz " constants in EEPROM\n"
             90 EF 01 0F 01 A6 0A
             6B 02 1E 04 F6 27 50
             A1
                                   1514 
                                   1515 
                                   1516 ;--------------------------
                                   1517 ; BASIC: EEFREE 
                                   1518 ; eeprom_free 
                                   1519 ; search end of data  
                                   1520 ; in EEPROM 
                                   1521 ; input:
                                   1522 ;    none 
                                   1523 ; output:
                                   1524 ;    A:X     address free
                                   1525 ;-------------------------
      001D1A                       1526 func_eefree:
      009901 2D 26 04         [ 2] 1527 	ldw x,#EEPROM_BASE 
      009904 03 01 20 08      [ 1] 1528 1$:	mov acc8,#8 ; count 8 consecutive zeros
      009908 A1 24 26         [ 2] 1529     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      00990B 08 A6            [ 1] 1530 	jruge 8$ ; no free space 
      00990D 10               [ 1] 1531 2$: ld a,(x)
      00990E 6B 02            [ 1] 1532 	jrne 3$
      009910 5C               [ 1] 1533 	incw x 
      009911 1F 04 F6 0E      [ 1] 1534 	dec acc8 
      009914 26 F6            [ 1] 1535 	jrne 2$
      009914 A1 61 2B         [ 2] 1536 	subw x,#8 
      009917 02 A0            [ 2] 1537 	jra 9$  
      009919 20               [ 1] 1538 3$: ld a,(x)
      00991A A1               [ 1] 1539 	incw x
      00991B 30               [ 1] 1540 	tnz a  
      00991C 2B 32            [ 1] 1541 	jrne 3$
      00991E A0               [ 2] 1542 	decw x   
      00991F 30 A1            [ 2] 1543 	jra 1$ 
      009921 0A               [ 1] 1544 8$: clrw x ; no free space 
      009922 2B               [ 1] 1545 9$: clr a 
      009923 06 A0 07         [ 2] 1546 	ldw free_eeprom,x ; save in system variable 
      009926 11               [ 4] 1547 	ret 
                                   1548 
                           000005  1549 CONST_REC_XTRA_BYTES=5 
                                   1550 ;--------------------------
                                   1551 ; search constant name 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



                                   1552 ; format of constant record  
                                   1553 ;   .byte record length 
                                   1554 ;         = strlen(name)+5 
                                   1555 ;   .asciz name (variable length)
                                   1556 ;   .int24 value (3 bytes )
                                   1557 ; a constant record use 7+ bytes
                                   1558 ; constants are saved in EEPROM  
                                   1559 ; input:
                                   1560 ;    X     *name
                                   1561 ; output:
                                   1562 ;    X     address|0
                                   1563 ; use:
                                   1564 ;   A,Y, acc16 
                                   1565 ;-------------------------
                           000001  1566 	NAMEPTR=1 ; target name pointer 
                           000003  1567 	EEPTR=3   ; walking pointer in EEPROM
                           000005  1568 	RECLEN=5  ; record length of target
                           000005  1569 	VSIZE=5
      001D43                       1570 search_const:
      009927 02 2A            [ 2] 1571 	pushw y 
      001D45                       1572 	_vars VSIZE
      009929 26 6B            [ 2]    1     sub sp,#VSIZE 
      00992B 03 7B 02 5F      [ 1] 1573 	clr acc16 
      00992F 02 72 A2         [ 4] 1574 	call strlen 
      009932 00 03            [ 1] 1575 	add a,#CONST_REC_XTRA_BYTES
      009934 90 F7            [ 1] 1576 	ld (RECLEN,sp),a    
      009936 90 EF            [ 2] 1577 	ldw (NAMEPTR,sp),x
      009938 01 CD 82 E5      [ 2] 1578 	ldw y,#EEPROM_BASE 
      00993C 5F 7B            [ 2] 1579 1$:	ldw x,(NAMEPTR,sp)
      00993E 03 02            [ 2] 1580 	ldw (EEPTR,sp),y
      009940 72 A2 00 03      [ 2] 1581 	cpw y, free_eeprom 
      009944 90 F7            [ 1] 1582 	jruge 7$ ; no match found 
      009946 90 EF            [ 1] 1583 	ld a,(y)
      009948 01 CD            [ 1] 1584 	cp a,(RECLEN,sp)
      00994A 81 EA            [ 1] 1585 	jrne 2$ 
      00994C 1E 04            [ 1] 1586 	incw y 
      00994E 20 C0 0D         [ 4] 1587 	call strcmp
      009951 01 27            [ 1] 1588 	jrne 8$ ; match found 
      001D6F                       1589 2$: ; skip this one 	
      009953 03 CD            [ 2] 1590 	ldW Y,(EEPTR,sp)
      009955 82 6F            [ 1] 1591 	ld a,(y)
      009957 C7 00 0E         [ 1] 1592 	ld acc8,a 
      009957 90 F6 93 EE      [ 2] 1593 	addw y,acc16 
      00995B 01 72            [ 2] 1594 	jra 1$  
      001D7C                       1595 7$: ; no match found 
      00995D A9 00            [ 1] 1596 	clr (EEPTR,sp)
      00995F 03 C7            [ 1] 1597 	clr (EEPTR+1,sp)
      001D80                       1598 8$: ; match found 
      009961 00 0D            [ 2] 1599 	ldw x,(EEPTR,sp) ; record address 
      001D82                       1600 9$:	_DROP VSIZE
      009963 CF 00            [ 2]    1     addw sp,#VSIZE 
      009965 0E 5B            [ 2] 1601 	 popw y 
      009967 05               [ 4] 1602 	 ret 
                                   1603 
                                   1604 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



                                   1605 ;--------------------------------------------
                                   1606 ; BASIC: CONST name=value [, name=value]*
                                   1607 ; define constant(s) saved in EEPROM
                                   1608 ;--------------------------------------------
                           000001  1609 	CNAME=1 
                           000003  1610 	BUFPTR=3
                           000005  1611 	RECLEN=5
                           000006  1612 	UPDATE=6
                           000007  1613 	YSAVE=7
                           000008  1614 	VSIZE=8 
      001D87                       1615 cmd_const:
      009968 81 89            [ 2] 1616 	pushw y 
      009969                       1617 	_vars VSIZE 
      009969 52 05            [ 2]    1     sub sp,#VSIZE 
      00996B 17 04            [ 1] 1618 	clr (UPDATE,sp)
      00996D CD 17 6F         [ 4] 1619 	call next_token 
      00996D 1F 02            [ 1] 1620 	cp a,#TK_CHAR 
      00996F F6 A4            [ 1] 1621 	jrne 0$
      009971 0F 6B 01         [ 4] 1622 	call get_char 
      009974 16 04            [ 1] 1623 	and a,#0xDF 
      009976 5C 55            [ 1] 1624 	cp a,#'U 
      009977 26 08            [ 1] 1625 	jrne 1$
      009977 90 F6            [ 1] 1626 	cpl (UPDATE,sp)
      009979 27 1B            [ 2] 1627 	jra const_loop 
      00997B 0D 01            [ 1] 1628 0$: cp a,#TK_LABEL 
      00997D 27 0A            [ 1] 1629 	jreq cloop_1
      00997F F1 26 07         [ 2] 1630 1$: jp syntax_error
      001DA8                       1631 const_loop: 
      009982 90 5C            [ 1] 1632 	ld a,#TK_LABEL 
      009984 5C 0A 01         [ 4] 1633 	call expect  
      001DAD                       1634 cloop_1: 
      009987 20 EE            [ 2] 1635 	ldw (CNAME,sp),x ; *const_name
      009989 CD 17 95         [ 4] 1636 	call skip_string
      009989 1E 02            [ 2] 1637 	ldw x,(CNAME,sp)
      00998B 1D 00 02         [ 4] 1638 	call strlen  
      00998E 4B 00            [ 1] 1639 	add a,#CONST_REC_XTRA_BYTES 
      009990 FE 84            [ 1] 1640 	ld (RECLEN,sp),a 
                                   1641 ; copy name in buffer  
      009992 27 1D            [ 2] 1642 	ldw y,(CNAME,sp) 
      009994 20 D7 68         [ 2] 1643 	ldw x,#tib  
      009996 7B 05            [ 1] 1644 	ld a,(RECLEN,sp)
      009996 1E               [ 1] 1645 	ld (x),a 
      009997 02               [ 1] 1646 	incw x  
      009998 F6 6B 01         [ 4] 1647 	call strcpy 
      00999B A4 0F            [ 2] 1648 	ldw (BUFPTR,sp),x 
                                   1649 ; x not updated by strcpy 
                                   1650 ; BUFPTR must be incremented 
                                   1651 ; to point after name 
      00999D 4C               [ 1] 1652 	clrw x 
      00999E C7 00            [ 1] 1653 	ld a,(RECLEN,sp)
      0099A0 0F 72            [ 1] 1654 	sub a,#CONST_REC_XTRA_BYTES-1
      0099A2 5F               [ 1] 1655 	ld xl,a  
      0099A3 00 0E 72         [ 2] 1656 	addw x,(BUFPTR,sp)
      0099A6 BB 00            [ 2] 1657 	ldw (BUFPTR,sp),x 
      0099A8 0E FE            [ 1] 1658 	ld a,#TK_EQUAL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      0099AA 7B 01 A4         [ 4] 1659 	call expect 
      0099AD F0 4E            [ 2] 1660 	ldw y,(YSAVE,sp) ; restore xstack pointer 
      0099AF AB 80 71         [ 4] 1661 	call expression 
      0099B1 A1 84            [ 1] 1662 	cp a,#TK_INTGR 
      0099B1 5B 05            [ 1] 1663 	jreq 5$ 
      0099B3 81 16 6E         [ 2] 1664 	jp syntax_error 
      0099B4                       1665 5$:	_xpop 
      0099B4 88 CD            [ 1]    1     ld a,(y)
      0099B6 97               [ 1]    2     ldw x,y 
      0099B7 EF 11            [ 2]    3     ldw x,(1,x)
      0099B9 01 27 03 CC      [ 2]    4     addw y,#CELL_SIZE 
      0099BD 96 EE            [ 2] 1666 	ldw (YSAVE,sp),y ; save xtack pointer 
      0099BF 84 81            [ 2] 1667 	ldw y,(BUFPTR,sp)
      0099C1 90 F7            [ 1] 1668 	ld (y),a 
      0099C1 A6 06 CD         [ 2] 1669 	ldw (1,y),x 
                                   1670 ; record completed in buffer 
                                   1671 ; check if constant already exist 
                                   1672 ; if exist and \U option then update  
      0099C4 99 B4 00 18      [ 1] 1673 	clr farptr 
      0099C6 1E 01            [ 2] 1674 	ldw x,(CNAME,sp)
      0099C6 4B 00 CD         [ 4] 1675 	call search_const 
      0099C9 9C               [ 2] 1676 	tnzw x 
      0099CA 0A 4D            [ 1] 1677 	jreq 6$ ; new constant  
      0099CC 27 12            [ 1] 1678 	tnz (UPDATE,sp)
      0099CE 0C 01            [ 1] 1679 	jreq 8$ 
      0099D0 CD 97            [ 2] 1680 	jra 7$	
      001E09                       1681 6$:	
      0099D2 EF A1 08         [ 2] 1682 	ldw x,free_eeprom  
      001E0C                       1683 7$:	
      0099D5 27 F1 A1         [ 2] 1684 	ldw farptr+1,x 
      0099D8 07 27 05         [ 2] 1685 	ldw x,#tib 
      0099DB 55 00            [ 1] 1686 	ld a,(RECLEN,sp)
      0099DD 03 00 02         [ 4] 1687 	call write_nbytes
      0099E0 84 81            [ 1] 1688 	tnz (UPDATE,sp)
      0099E2 26 0B            [ 1] 1689 	jrne 8$ ; not a new constant, don't update free_eeprom
                                   1690 ; update free_eeprom 
      0099E2 CD               [ 1] 1691 	clrw x 
      0099E3 99 C1            [ 1] 1692 	ld a,(RECLEN,sp)
      0099E5 A1               [ 1] 1693 	ld xl,a 
      0099E6 01 27 03 CC      [ 2] 1694 	addw x,free_eeprom 
      0099EA 96 EE 90         [ 2] 1695 	ldw free_eeprom,x
      001E26                       1696 8$: ; check for next constant 
      0099ED F6 93 EE         [ 4] 1697 	call next_token 
      0099F0 01 72            [ 1] 1698 	cp a,#TK_COMMA 
      0099F2 A9 00            [ 1] 1699 	jrne 9$ ; no other constant 
      0099F4 03 C3 00         [ 2] 1700 	jp const_loop 
      001E30                       1701 9$: 
      001E30                       1702 	_unget_token    
      0099F7 21 23 05 A6 0A   [ 1]    1      mov in,in.saved  
      001E35                       1703 10$: 
      001E35                       1704 	_drop VSIZE 
      0099FC CC 96            [ 2]    1     addw sp,#VSIZE 
      0099FE F0 5D            [ 2] 1705 	popw y ; restore xstack pointer 
      009A00 27               [ 4] 1706 	ret 
                                   1707 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



                                   1708 
                                   1709 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1710 ; return program size 
                                   1711 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001E3A                       1712 prog_size:
      009A01 F8 89 58         [ 2] 1713 	ldw x,txtend 
      009A04 72 FB 01 1F      [ 2] 1714 	subw x,txtbgn 
      009A08 01               [ 4] 1715 	ret 
                                   1716 
                                   1717 ;----------------------------
                                   1718 ; print program information 
                                   1719 ;---------------------------
      001E42                       1720 program_info: 
      009A09 AE 16 68         [ 2] 1721 	ldw x,#PROG_ADDR 
      009A0C 72 F0 01         [ 4] 1722 	call puts 
      009A0F 5B 02 81         [ 2] 1723 	ldw x,txtbgn 
      009A12 35 10 00 0A      [ 1] 1724 	mov base,#16 
      009A12 52 01 0F         [ 4] 1725 	call prt_i16
      009A15 01 CD 97 EF      [ 1] 1726 	mov base,#10  
      009A19 4D 26 03         [ 2] 1727 	ldw x,#PROG_SIZE
      009A1C CC 9A AB         [ 4] 1728 	call puts 
      009A1F A1 10 27         [ 4] 1729 	call prog_size 
      009A22 06 A1 11         [ 4] 1730 	call prt_i16 
      009A25 26 05 03         [ 2] 1731 	ldw x,#STR_BYTES 
      009A28 01 09 6D         [ 4] 1732 	call puts
      009A29 CE 00 1B         [ 2] 1733 	ldw x,txtbgn
      009A29 CD 97 EF         [ 2] 1734 	cpw x,#app 
      009A2C 25 05            [ 1] 1735 	jrult 2$
      009A2C 4D 26 03         [ 2] 1736 	ldw x,#FLASH_MEM 
      009A2F CC 96            [ 2] 1737 	jra 3$
      009A31 EE 1E BC         [ 2] 1738 2$: ldw x,#RAM_MEM 	 
      009A32 CD 09 6D         [ 4] 1739 3$:	call puts 
      009A32 A1 81            [ 1] 1740 	ld a,#CR 
      009A34 26 06 CD         [ 4] 1741 	call putc
      009A37 98               [ 4] 1742 	ret 
                                   1743 
      009A38 08 FD 20 5D 72 61 6D  1744 PROG_ADDR: .asciz "program address: "
             20 61 64 64 72 65 73
             73 3A 20 00
      009A3C 2C 20 70 72 6F 67 72  1745 PROG_SIZE: .asciz ", program size: "
             61 6D 20 73 69 7A 65
             3A 20 00
      009A3C A1 84 26 05 CD 98 2E  1746 STR_BYTES: .asciz " bytes" 
      009A43 20 54 6E 20 46 4C 41  1747 FLASH_MEM: .asciz " in FLASH memory" 
             53 48 20 6D 65 6D 6F
             72 79 00
      009A45 20 69 6E 20 52 41 4D  1748 RAM_MEM:   .asciz " in RAM memory" 
             20 6D 65 6D 6F 72 79
             00
                                   1749 
                                   1750 
                                   1751 ;----------------------------
                                   1752 ; BASIC: LIST [[start][,end]]
                                   1753 ; list program lines 
                                   1754 ; form start to end 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



                                   1755 ; if empty argument list then 
                                   1756 ; list all.
                                   1757 ;----------------------------
                           000001  1758 	FIRST=1
                           000003  1759 	LAST=3 
                           000005  1760 	LN_PTR=5
                           000006  1761 	VSIZE=6 
      001ECB                       1762 list:
      009A45 A1 05 26 05 CD   [ 2] 1763 	btjf flags,#FRUN,0$
      009A4A 99 E2            [ 1] 1764 	ld a,#ERR_CMD_ONLY
      009A4C 20 07 70         [ 2] 1765 	jp tb_error
      009A4E                       1766 0$:	 
      009A4E A1 85 26         [ 4] 1767 	call next_token 
      009A51 08 CD            [ 1] 1768 	cp a,#TK_CHAR 
      009A53 98 24            [ 1] 1769 	jrne 2$
      009A55 CD 17 BE         [ 4] 1770 	call get_char 
      009A55 F6 EE            [ 1] 1771 	and a,#0xDF 
      009A57 01 20            [ 1] 1772 	cp a,#'C 
      009A59 3F 04            [ 1] 1773 	jrne 1$
      009A5A CD 1C AE         [ 4] 1774 	call list_const
      009A5A A1               [ 4] 1775 	ret 
      009A5B 03 26 10         [ 2] 1776 1$: jp syntax_error 
      001EEC                       1777 2$:	_unget_token 
      009A5E 89 CD 98 15 85   [ 1]    1      mov in,in.saved  
      009A63 CD 9D C3         [ 4] 1778 	call prog_size 
      009A66 5D 27            [ 1] 1779 	jrugt 3$
      009A68 28               [ 4] 1780 	ret 
      001EF7                       1781 3$: _vars VSIZE
      009A69 CD 9D            [ 2]    1     sub sp,#VSIZE 
      009A6B 1F 20 2B         [ 2] 1782 	ldw x,txtbgn 
      009A6E 1F 05            [ 2] 1783 	ldw (LN_PTR,sp),x 
      009A6E A1               [ 2] 1784 	ldw x,(x) 
      009A6F 82 26            [ 2] 1785 	ldw (FIRST,sp),x ; list from first line 
      009A71 08 CD 98         [ 2] 1786 	ldw x,#MAX_LINENO ; biggest line number 
      009A74 08 FD            [ 2] 1787 	ldw (LAST,sp),x 
      009A76 5F 02 20         [ 4] 1788 	call arg_list
      009A79 1F               [ 1] 1789 	tnz a
      009A7A 27 31            [ 1] 1790 	jreq list_loop 
      009A7A A1 06            [ 1] 1791 	cp a,#2 
      009A7C 26 13            [ 1] 1792 	jreq 4$
      009A7E CD 9A            [ 1] 1793 	cp a,#1 
      009A80 F1 A6            [ 1] 1794 	jreq first_line 
      009A82 07 CD 99         [ 2] 1795 	jp syntax_error 
      009A85 B4               [ 2] 1796 4$:	popw x 
      009A86 90 F6            [ 2] 1797 	ldw (LAST+2,sp),x 
      001F1A                       1798 first_line:
      009A88 93               [ 2] 1799 	popw x
      009A89 EE 01            [ 2] 1800 	ldw (FIRST,sp),x 
      001F1D                       1801 lines_skip:
      009A8B 72 A9 00         [ 2] 1802 	ldw x,txtbgn
      009A8E 03 20            [ 2] 1803 2$:	ldw (LN_PTR,sp),x 
      009A90 08 00 1D         [ 2] 1804 	cpw x,txtend 
      009A91 2A 38            [ 1] 1805 	jrpl list_exit 
      009A91 55               [ 2] 1806 	ldw x,(x) ;line# 
      009A92 00 03            [ 2] 1807 	cpw x,(FIRST,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      009A94 00 02            [ 1] 1808 	jrpl list_loop 
      009A96 4F 20            [ 2] 1809 	ldw x,(LN_PTR,sp) 
      009A98 12 02            [ 1] 1810 	ld a,(2,x)
      009A99 C7 00 0E         [ 1] 1811 	ld acc8,a 
      009A99 0D 01 27 03      [ 1] 1812 	clr acc16 
      009A9D CD 82 81 0D      [ 2] 1813 	addw x,acc16
      009AA0 20 E3            [ 2] 1814 	jra 2$ 
                                   1815 ; print loop
      001F3D                       1816 list_loop:
      009AA0 72 A2            [ 2] 1817 	ldw x,(LN_PTR,sp)
      009AA2 00 03            [ 1] 1818 	ld a,(2,x) 
      009AA4 90 F7 90         [ 4] 1819 	call prt_basic_line
      009AA7 EF 01            [ 2] 1820 	ldw x,(LN_PTR,sp)
      009AA9 A6 84            [ 1] 1821 	ld a,(2,x)
      009AAB C7 00 0E         [ 1] 1822 	ld acc8,a 
      009AAB 5B 01 81 0D      [ 1] 1823 	clr acc16 
      009AAE 72 BB 00 0D      [ 2] 1824 	addw x,acc16
      009AAE 52 01 CD         [ 2] 1825 	cpw x,txtend 
      009AB1 9A 12            [ 1] 1826 	jrpl list_exit
      009AB3 4D 27            [ 2] 1827 	ldw (LN_PTR,sp),x
      009AB5 38               [ 2] 1828 	ldw x,(x)
      009AB6 13 03            [ 2] 1829 	cpw x,(LAST,sp)  
      009AB6 CD 97            [ 1] 1830 	jrslt list_loop
      001F5F                       1831 list_exit:
      009AB8 EF 6B 01 A4 30   [ 1] 1832 	mov in,count 
      009ABD A1 20 27         [ 2] 1833 	ldw x,#pad 
      009AC0 09 A6 84         [ 2] 1834 	ldw basicptr,x 
      001F6A                       1835 	_drop VSIZE 
      009AC3 55 00            [ 2]    1     addw sp,#VSIZE 
      009AC5 03 00 02         [ 4] 1836 	call program_info 
      009AC8 20               [ 4] 1837 	ret
                                   1838 
                                   1839 
                                   1840 ;--------------------------
                                   1841 ; BASIC: EDIT 
                                   1842 ;  copy program in FLASH 
                                   1843 ;  to RAM for edition 
                                   1844 ;-------------------------
      001F70                       1845 edit:
      009AC9 24 27 9F         [ 4] 1846 	call qsign 
      009ACA 27 07            [ 1] 1847 	jreq 1$ 
      009ACA CD 9A 12         [ 2] 1848 	ldw x,#NOT_SAVED 
      009ACD 4D 26 03         [ 4] 1849 	call puts 
      009AD0 CC               [ 4] 1850 	ret 
      001F7C                       1851 1$: 
      009AD1 96 EE 35 80      [ 2] 1852 	ldw y,#app_sign ; source address 
      009AD3 CE 35 82         [ 2] 1853     ldw x,app_size  
      009AD3 7B 01 A1         [ 2] 1854 	addw x,#4 
      009AD6 20 26 05         [ 2] 1855 	ldw acc16,x  ; bytes to copy 
      009AD9 CD 82 E5         [ 2] 1856 	ldw x,#rsign ; destination address 
      009ADC 20 D8 A1         [ 4] 1857 	call move  
      009ADF 21 26 05         [ 2] 1858 	ldw x,#free_ram 
      009AE2 CD 83 73         [ 2] 1859 	ldw txtbgn,x 
      009AE5 20 CF 00 7E      [ 2] 1860 	addw x,rsize  
      009AE7 CF 00 1D         [ 2] 1861 	ldw txtend,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      009AE7 CD               [ 4] 1862 	ret 
                                   1863 
      009AE8 84 21 20 CA 70 70 6C  1864 NOT_SAVED: .asciz "No application saved.\n"
             69 63 61 74 69 6F 6E
             20 73 61 76 65 64 2E
             0A 00
                                   1865 
                                   1866 
                                   1867 ;--------------------------
                                   1868 ; decompile line from token list
                                   1869 ; and print it. 
                                   1870 ; input:
                                   1871 ;   A       stop at this position 
                                   1872 ;   X 		pointer at line
                                   1873 ; output:
                                   1874 ;   none 
                                   1875 ;--------------------------	
      009AEC                       1876 prt_basic_line:
      009AEC A6 84            [ 2] 1877 	pushw y 
      009AEE C7 00 03         [ 1] 1878 	ld count,a 
      009AEE 5B 01            [ 1] 1879 	ld a,(2,x)
      009AF0 81 00 03         [ 1] 1880 	cp a,count 
      009AF1 2A 03            [ 1] 1881 	jrpl 1$ 
      009AF1 52 01 CD         [ 1] 1882 	ld count,a 
      009AF4 9A AE 4D         [ 2] 1883 1$:	ldw basicptr,x 
      009AF7 27 2D 16 68      [ 2] 1884 	ldw y,#tib  
      009AF9 CD 11 C8         [ 4] 1885 	call decompile 
      009AF9 CD 97 EF         [ 4] 1886 	call puts 
      009AFC 6B 01            [ 1] 1887 	ld a,#CR 
      009AFE A4 30 A1         [ 4] 1888 	call putc 
      009B01 10 27            [ 2] 1889 	popw y 
      009B03 09               [ 4] 1890 	ret 
                                   1891 
                                   1892 
                                   1893 ;---------------------------------
                                   1894 ; BASIC: PRINT|? arg_list 
                                   1895 ; print values from argument list
                                   1896 ;----------------------------------
                           000001  1897 	CCOMMA=1
                           000001  1898 	VSIZE=1
      001FD8                       1899 print:
      001FD8                       1900 	_vars VSIZE 
      009B04 55 00            [ 2]    1     sub sp,#VSIZE 
      001FDA                       1901 reset_comma:
      009B06 03 00            [ 1] 1902 	clr (CCOMMA,sp)
      001FDC                       1903 prt_loop:
      009B08 02 A6 84         [ 4] 1904 	call next_token
      009B0B 20 19            [ 1] 1905 	cp a,#CMD_END 
      009B0D 25 08            [ 1] 1906 	jrult 0$
      009B0D CD 9A            [ 1] 1907 	cp a,#TK_COLON 
      009B0F AE 4D            [ 1] 1908 	jreq 0$
      009B11 26 03            [ 1] 1909 	cp a,#TK_CMD
      009B13 CC 96            [ 1] 1910 	jrne 10$
      001FEB                       1911 0$:
      001FEB                       1912 	_unget_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      009B15 EE 00 02 00 01   [ 1]    1      mov in,in.saved  
      009B16 20 5D            [ 2] 1913 	jra 8$ 
      001FF2                       1914 10$:	
      009B16 7B 01            [ 1] 1915 	cp a,#TK_QSTR
      009B18 A1 10            [ 1] 1916 	jreq 1$
      009B1A 26 05            [ 1] 1917 	cp a,#TK_CHAR 
      009B1C CD 81            [ 1] 1918 	jreq 2$ 
      009B1E EA 20            [ 1] 1919 	cp a,#TK_CFUNC 
      009B20 D8 1F            [ 1] 1920 	jreq 3$
      009B21 A1 08            [ 1] 1921 	cp a,#TK_COMMA 
      009B21 CD 82            [ 1] 1922 	jreq 4$
      009B23 07 20            [ 1] 1923 	cp a,#TK_SHARP 
      009B25 D3 24            [ 1] 1924 	jreq 5$
      009B26 20 37            [ 2] 1925 	jra 7$ 
      002008                       1926 1$:	; print string 
      009B26 5B 01 81         [ 4] 1927 	call puts
      009B29 5C               [ 1] 1928 	incw x
      009B29 52 01 CD 9A      [ 2] 1929 	subw x,basicptr 
      009B2D F1 4D 27         [ 2] 1930 	ldw in.w,x  
      009B30 54 CD            [ 2] 1931 	jra reset_comma
      002015                       1932 2$:	; print character 
      009B32 97 EF 6B         [ 4] 1933 	call get_char 
      009B35 01 A4 30         [ 4] 1934 	call putc 
      009B38 A1 30            [ 2] 1935 	jra reset_comma 
      00201D                       1936 3$: ; print character function value  	
      009B3A 27 09 A6         [ 4] 1937 	call get_code_addr 
      009B3D 84               [ 4] 1938 	call (x)
      009B3E 55 00 03         [ 4] 1939 	call putc
      009B41 00 02            [ 2] 1940 	jra reset_comma 
      002026                       1941 4$: ; set comma state 
      009B43 20 40            [ 1] 1942 	cpl (CCOMMA,sp)
      009B45 20 B2            [ 2] 1943 	jra prt_loop   
      00202A                       1944 5$: ; # character must be followed by an integer   
      009B45 CD 9A F1         [ 4] 1945 	call next_token
      009B48 4D 26            [ 1] 1946 	cp a,#TK_INTGR 
      009B4A 03 CC            [ 1] 1947 	jreq 6$
      009B4C 96 EE 6E         [ 2] 1948 	jp syntax_error 
      009B4E                       1949 6$: ; set tab width
      009B4E CD 82 24         [ 4] 1950 	call get_int24 
      009B51 90               [ 1] 1951 	ld a,xl 
      009B52 F6 93            [ 1] 1952 	and a,#15 
      009B54 EE 01 72         [ 1] 1953 	ld tab_width,a 
      009B57 A9 00            [ 2] 1954 	jra reset_comma 
      00203F                       1955 7$:	
      00203F                       1956 	_unget_token 
      009B59 03 4D 2B 08 26   [ 1]    1      mov in,in.saved  
      009B5E 0C 35 02         [ 4] 1957 	call condition
      009B61 00               [ 1] 1958 	tnz a 
      009B62 0F 20            [ 1] 1959 	jreq 8$    
      009B64 0A 17 E9         [ 4] 1960     call print_top
      009B65 20 8B            [ 2] 1961 	jra reset_comma 
      00204F                       1962 8$:
      009B65 35 04            [ 1] 1963 	tnz (CCOMMA,sp)
      009B67 00 0F            [ 1] 1964 	jrne 9$
      009B69 20 04            [ 1] 1965 	ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      009B6B CD 09 10         [ 4] 1966     call putc 
      002058                       1967 9$:	_drop VSIZE 
      009B6B 35 01            [ 2]    1     addw sp,#VSIZE 
      009B6D 00               [ 4] 1968 	ret 
                                   1969 
                                   1970 ;----------------------
                                   1971 ; 'save_context' and
                                   1972 ; 'rest_context' must be 
                                   1973 ; called at the same 
                                   1974 ; call stack depth 
                                   1975 ; i.e. SP must have the 
                                   1976 ; save value at  
                                   1977 ; entry point of both 
                                   1978 ; routine. 
                                   1979 ;---------------------
                           000004  1980 	CTXT_SIZE=4 ; size of saved data 
                                   1981 ;--------------------
                                   1982 ; save current BASIC
                                   1983 ; interpreter context 
                                   1984 ; on stack 
                                   1985 ;--------------------
      00205B                       1986 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00205B                       1987 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      00205B                       1988 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      00205B                       1989 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      00205B                       1990 save_context:
      009B6E 0F 00 04         [ 2] 1991 	ldw x,basicptr 
      009B6F 1F 03            [ 2] 1992 	ldw (BPTR,sp),x
      009B6F 5F C6 00         [ 1] 1993 	ld a,in 
      009B72 0F 14            [ 1] 1994 	ld (IN,sp),a
      009B74 01 27 03         [ 1] 1995 	ld a,count 
      009B77 53 A6            [ 1] 1996 	ld (CNT,sp),a  
      009B79 FF               [ 4] 1997 	ret
                                   1998 
                                   1999 ;-----------------------
                                   2000 ; restore previously saved 
                                   2001 ; BASIC interpreter context 
                                   2002 ; from stack 
                                   2003 ;-------------------------
      00206B                       2004 rest_context:
      009B7A 72 A2            [ 2] 2005 	ldw x,(BPTR,sp)
      009B7C 00 03 90         [ 2] 2006 	ldw basicptr,x 
      009B7F F7 90            [ 1] 2007 	ld a,(IN,sp)
      009B81 EF 01 A6         [ 1] 2008 	ld in,a
      009B84 84 06            [ 1] 2009 	ld a,(CNT,sp)
      009B85 C7 00 03         [ 1] 2010 	ld count,a  
      009B85 5B               [ 4] 2011 	ret
                                   2012 
                                   2013 
                                   2014 
                                   2015 ;------------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



                                   2016 ; BASIC: INPUT [string]var[,[string]var]
                                   2017 ; input value in variables 
                                   2018 ; [string] optionally can be used as prompt 
                                   2019 ;-----------------------------------------
                           000001  2020 	CX_BPTR=1
                           000003  2021 	CX_IN=3
                           000004  2022 	CX_CNT=4
                           000005  2023 	SKIP=5
                           000005  2024 	VSIZE=5
      00207B                       2025 input_var:
      009B86 01 81            [ 2] 2026 	pushw y 
      009B88                       2027 	_vars VSIZE 
      009B88 4B 00            [ 2]    1     sub sp,#VSIZE 
      00207F                       2028 input_loop:
      009B8A CD 97            [ 1] 2029 	clr (SKIP,sp)
      009B8C EF 4D 27         [ 4] 2030 	call next_token 
      009B8F 25 A1            [ 1] 2031 	cp a,#TK_QSTR 
      009B91 87 26            [ 1] 2032 	jrne 1$ 
      009B93 04 03 01         [ 4] 2033 	call puts 
      009B96 20               [ 1] 2034 	incw x 
      009B97 F2 B0 00 04      [ 2] 2035 	subw x,basicptr 
      009B98 CF 00 00         [ 2] 2036 	ldw in.w,x 
      009B98 A1 06            [ 1] 2037 	cpl (SKIP,sp)
      009B9A 26 0A CD         [ 4] 2038 	call next_token 
      009B9D 9C 0A            [ 1] 2039 1$: cp a,#TK_VAR  
      009B9F A6 07            [ 1] 2040 	jreq 2$ 
      009BA1 CD 99 B4         [ 2] 2041 	jp syntax_error
      009BA4 20 08 55         [ 4] 2042 2$:	call get_addr
      009BA7 00 03 00         [ 2] 2043 	ldw ptr16,x 
      009BAA 02 CD            [ 1] 2044 	tnz (SKIP,sp)
      009BAC 9B 29            [ 1] 2045 	jrne 21$ 
      009BAE CD 11 9D         [ 4] 2046 	call var_name 
      009BAE 0D 01 27         [ 4] 2047 	call putc   
      0020AF                       2048 21$:
      009BB1 03 CD            [ 1] 2049 	ld a,#':
      009BB3 82 66 10         [ 4] 2050 	call putc 
      009BB5 CD 20 5B         [ 4] 2051 	call save_context 
      009BB5 5B 01 81 03      [ 1] 2052 	clr count  
      009BB8 CD 0A 72         [ 4] 2053 	call readln 
      009BB8 CD 9B 88         [ 2] 2054 	ldw x,#tib 
      009BBB 4D 27 4B         [ 1] 2055 	push count
      009BBE CD 97            [ 1] 2056 	push #0 
      009BC0 EF 4D 27         [ 2] 2057 	addw x,(1,sp)
      009BC3 43               [ 1] 2058 	incw x 
      0020CA                       2059 	_drop 2 
      009BC4 A1 88            [ 2]    1     addw sp,#2 
      009BC6 27 07 55 00      [ 1] 2060 	clr in 
      009BCA 03 00 02         [ 4] 2061 	call get_token
      009BCD 20 38            [ 1] 2062 	cp a,#TK_INTGR
      009BCF CD 9B            [ 1] 2063 	jreq 3$ 
      009BD1 88 4D            [ 1] 2064 	cp a,#TK_MINUS
      009BD3 26 03            [ 1] 2065 	jrne 22$
      009BD5 CC 96 EE         [ 4] 2066 	call get_token 
      009BD8 A1 84            [ 1] 2067 	cp a,#TK_INTGR 
      009BD8 90 F6            [ 1] 2068 	jreq 23$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      0020E2                       2069 22$:
      009BDA 93 EE 01         [ 4] 2070 	call rest_context 
      009BDD 72 A9 00         [ 2] 2071 	jp syntax_error
      0020E8                       2072 23$:
      009BE0 03 C7 00         [ 4] 2073 	call neg_acc24	
      0020EB                       2074 3$: 
      009BE3 0D CF 00         [ 1] 2075 	ld a,acc24 
      009BE6 0E 90 F6         [ 2] 2076 	ldw x,acc16 
      009BE9 93 EE 01 72      [ 4] 2077 	ld [ptr16],a
      009BED A9 00 03 C4      [ 1] 2078 	inc ptr8  
      009BF1 00 0D 02 C4      [ 5] 2079 	ldw [ptr16],x 
      009BF5 00 0E 02         [ 4] 2080 	call rest_context
      009BF8 C4 00 0F         [ 4] 2081 	call next_token 
      009BFB 02 72            [ 1] 2082 	cp a,#TK_COMMA
      009BFD A2 00            [ 1] 2083 	jrne 4$ 
      009BFF 03 90 F7         [ 2] 2084 	jp input_loop
      00210A                       2085 4$:
      009C02 90 EF            [ 1] 2086 	cp a,#TK_NONE 
      009C04 01 20            [ 1] 2087 	jreq input_exit  
      009C06 B7 A6            [ 1] 2088 	cp a,#TK_COLON 
      009C08 84 81            [ 1] 2089     jreq input_exit 
      009C0A CC 16 6E         [ 2] 2090 	jp syntax_error 
      002115                       2091 input_exit:
      002115                       2092 	_drop VSIZE 
      009C0A 52 02            [ 2]    1     addw sp,#VSIZE 
      009C0C CD 9B            [ 2] 2093 	popw y 
      009C0E B8               [ 4] 2094 	ret 
                                   2095 
                                   2096 
                                   2097 ;---------------------
                                   2098 ; BASIC: REM | ' 
                                   2099 ; skip comment to end of line 
                                   2100 ;---------------------- 
      00211A                       2101 remark::
      009C0F 4D 27 69 CD 97   [ 1] 2102 	mov in,count 
      009C14 EF               [ 4] 2103  	ret 
                                   2104 
                                   2105 
                                   2106 ;---------------------
                                   2107 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2108 ; read in loop 'addr'  
                                   2109 ; apply & 'mask' to value 
                                   2110 ; loop while result==0.  
                                   2111 ; 'xor_mask' is used to 
                                   2112 ; invert the wait logic.
                                   2113 ; i.e. loop while not 0.
                                   2114 ;---------------------
                           000001  2115 	XMASK=1 
                           000002  2116 	MASK=2
                           000003  2117 	ADDR=3
                           000004  2118 	VSIZE=4
      002120                       2119 wait: 
      002120                       2120 	_vars VSIZE
      009C15 A1 89            [ 2]    1     sub sp,#VSIZE 
      009C17 27 0B            [ 1] 2121 	clr (XMASK,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      009C19 A1 8A 27         [ 4] 2122 	call arg_list 
      009C1C 07 55            [ 1] 2123 	cp a,#2
      009C1E 00 03            [ 1] 2124 	jruge 0$
      009C20 00 02 20         [ 2] 2125 	jp syntax_error 
      009C23 55 6B            [ 1] 2126 0$:	cp a,#3
      009C25 02 CD            [ 1] 2127 	jrult 1$
      002132                       2128 	_xpop  ; xor mask 
      009C27 9B B8            [ 1]    1     ld a,(y)
      009C29 A1               [ 1]    2     ldw x,y 
      009C2A 84 27            [ 2]    3     ldw x,(1,x)
      009C2C 03 CC 96 EE      [ 2]    4     addw y,#CELL_SIZE 
      009C30 9F               [ 1] 2129 	ld a,xl 
      009C30 90 F6            [ 1] 2130 	ld (XMASK,sp),a 
      00213E                       2131 1$: _xpop ; mask
      009C32 93 EE            [ 1]    1     ld a,(y)
      009C34 01               [ 1]    2     ldw x,y 
      009C35 72 A9            [ 2]    3     ldw x,(1,x)
      009C37 00 03 C7 00      [ 2]    4     addw y,#CELL_SIZE 
      009C3B 0D               [ 1] 2132     ld a,xl  
      009C3C CF 00            [ 1] 2133 	ld (MASK,sp),a 
      00214A                       2134 	_xpop ; address 
      009C3E 0E 90            [ 1]    1     ld a,(y)
      009C40 F6               [ 1]    2     ldw x,y 
      009C41 93 EE            [ 2]    3     ldw x,(1,x)
      009C43 01 72 A9 00      [ 2]    4     addw y,#CELL_SIZE 
      009C47 03               [ 1] 2135 2$:	ld a,(x)
      009C48 6B 01            [ 1] 2136 	and a,(MASK,sp)
      009C4A 7B 02            [ 1] 2137 	xor a,(XMASK,sp)
      009C4C A1 8A            [ 1] 2138 	jreq 2$ 
      00215A                       2139 	_drop VSIZE 
      009C4E 27 10            [ 2]    1     addw sp,#VSIZE 
      009C50 81               [ 4] 2140 	ret 
                                   2141 
                                   2142 ;---------------------
                                   2143 ; BASIC: BSET addr,mask
                                   2144 ; set bits at 'addr' corresponding 
                                   2145 ; to those of 'mask' that are at 1.
                                   2146 ; arguments:
                                   2147 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2148 ;   mask        mask|addr
                                   2149 ; output:
                                   2150 ;	none 
                                   2151 ;--------------------------
      00215D                       2152 bit_set:
      009C50 7B 01 CA         [ 4] 2153 	call arg_list 
      009C53 00 0D            [ 1] 2154 	cp a,#2	 
      009C55 02 CA            [ 1] 2155 	jreq 1$ 
      009C57 00 0E 02         [ 2] 2156 	jp syntax_error
      002167                       2157 1$: 
      002167                       2158 	_xpop ; mask 
      009C5A CA 00            [ 1]    1     ld a,(y)
      009C5C 0F               [ 1]    2     ldw x,y 
      009C5D 02 20            [ 2]    3     ldw x,(1,x)
      009C5F 0E A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C60 9F               [ 1] 2159 	ld a,xl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      009C60 7B               [ 1] 2160 	push a  
      002172                       2161 	_xpop ; addr  
      009C61 01 C8            [ 1]    1     ld a,(y)
      009C63 00               [ 1]    2     ldw x,y 
      009C64 0D 02            [ 2]    3     ldw x,(1,x)
      009C66 C8 00 0E 02      [ 2]    4     addw y,#CELL_SIZE 
      009C6A C8               [ 1] 2162 	pop a 
      009C6B 00               [ 1] 2163 	or a,(x)
      009C6C 0F               [ 1] 2164 	ld (x),a
      009C6D 02               [ 4] 2165 	ret 
                                   2166 
                                   2167 ;---------------------
                                   2168 ; BASIC: BRES addr,mask
                                   2169 ; reset bits at 'addr' corresponding 
                                   2170 ; to those of 'mask' that are at 1.
                                   2171 ; arguments:
                                   2172 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2173 ;   mask	    ~mask&*addr  
                                   2174 ; output:
                                   2175 ;	none 
                                   2176 ;--------------------------
      00217F                       2177 bit_reset:
      009C6E 72 A2 00         [ 4] 2178 	call arg_list 
      009C71 03 90            [ 1] 2179 	cp a,#2  
      009C73 F7 90            [ 1] 2180 	jreq 1$ 
      009C75 EF 01 20         [ 2] 2181 	jp syntax_error
      002189                       2182 1$: 
      002189                       2183 	_xpop ; mask 
      009C78 99 A6            [ 1]    1     ld a,(y)
      009C7A 84               [ 1]    2     ldw x,y 
      009C7B 5B 02            [ 2]    3     ldw x,(1,x)
      009C7D 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C7E 9F               [ 1] 2184 	ld a,xl 
      009C7E 35               [ 1] 2185 	cpl a
      009C7F 10               [ 1] 2186 	push a  
      002195                       2187 	_xpop ; addr  
      009C80 00 0B            [ 1]    1     ld a,(y)
      009C82 81               [ 1]    2     ldw x,y 
      009C83 EE 01            [ 2]    3     ldw x,(1,x)
      009C83 35 0A 00 0B      [ 2]    4     addw y,#CELL_SIZE 
      009C87 81               [ 1] 2188 	pop a 
      009C88 F4               [ 1] 2189 	and a,(x)
      009C88 90               [ 1] 2190 	ld (x),a 
      009C89 89               [ 4] 2191 	ret 
                                   2192 
                                   2193 ;---------------------
                                   2194 ; BASIC: BTOGL addr,mask
                                   2195 ; toggle bits at 'addr' corresponding 
                                   2196 ; to those of 'mask' that are at 1.
                                   2197 ; arguments:
                                   2198 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2199 ;   mask	    mask^*addr  
                                   2200 ; output:
                                   2201 ;	none 
                                   2202 ;--------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      0021A2                       2203 bit_toggle:
      009C8A 4F AE 16         [ 4] 2204 	call arg_list 
      009C8D 68 90            [ 1] 2205 	cp a,#2 
      009C8F CE 00            [ 1] 2206 	jreq 1$ 
      009C91 1E 90 A3         [ 2] 2207 	jp syntax_error
      0021AC                       2208 1$: _xpop ; mask 
      009C94 B6 00            [ 1]    1     ld a,(y)
      009C96 25               [ 1]    2     ldw x,y 
      009C97 05 1D            [ 2]    3     ldw x,(1,x)
      009C99 00 80 20 04      [ 2]    4     addw y,#CELL_SIZE 
      009C9D 9F               [ 1] 2209 	ld a,xl
      009C9D 72               [ 1] 2210 	push a 
      0021B7                       2211 	_xpop  ; addr  
      009C9E B0 00            [ 1]    1     ld a,(y)
      009CA0 1E               [ 1]    2     ldw x,y 
      009CA1 90 85            [ 2]    3     ldw x,(1,x)
      009CA3 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009CA4 84               [ 1] 2212 	pop a 
      009CA4 3B               [ 1] 2213 	xor a,(x)
      009CA5 00               [ 1] 2214 	ld (x),a 
      009CA6 0B               [ 4] 2215 	ret 
                                   2216 
                                   2217 
                                   2218 ;---------------------
                                   2219 ; BASIC: BTEST(addr,bit)
                                   2220 ; return bit value at 'addr' 
                                   2221 ; bit is in range {0..7}.
                                   2222 ; arguments:
                                   2223 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2224 ;   bit 	    bit position {0..7}  
                                   2225 ; output:
                                   2226 ;	A:X       bit value  
                                   2227 ;--------------------------
      0021C4                       2228 bit_test:
      009CA7 AE 9F 01         [ 4] 2229 	call func_args 
      009CAA CD 89            [ 1] 2230 	cp a,#2
      009CAC ED CE            [ 1] 2231 	jreq 0$
      009CAE 00 1C 35         [ 2] 2232 	jp syntax_error
      0021CE                       2233 0$:	
      0021CE                       2234 	_xpop 
      009CB1 10 00            [ 1]    1     ld a,(y)
      009CB3 0B               [ 1]    2     ldw x,y 
      009CB4 CD 98            [ 2]    3     ldw x,(1,x)
      009CB6 44 32 00 0B      [ 2]    4     addw y,#CELL_SIZE 
      009CBA AE               [ 1] 2235 	ld a,xl 
      009CBB 9F 13            [ 1] 2236 	and a,#7
      009CBD CD               [ 1] 2237 	push a   
      009CBE 89 ED            [ 1] 2238 	ld a,#1 
      009CC0 CE 00            [ 1] 2239 1$: tnz (1,sp)
      009CC2 1E 72            [ 1] 2240 	jreq 2$
      009CC4 B0               [ 1] 2241 	sll a 
      009CC5 00 1C            [ 1] 2242 	dec (1,sp)
      009CC7 CD 98            [ 2] 2243 	jra 1$
      009CC9 44 AE            [ 1] 2244 2$: ld (1,sp),a  
      0021E8                       2245 	_xpop ; address  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      009CCB 9F 24            [ 1]    1     ld a,(y)
      009CCD CD               [ 1]    2     ldw x,y 
      009CCE 89 ED            [ 2]    3     ldw x,(1,x)
      009CD0 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009CD1 84               [ 1] 2246 	pop a 
      009CD1 CD               [ 1] 2247 	and a,(x)
      009CD2 9C 88            [ 1] 2248 	jreq 3$
      009CD4 A6 03            [ 1] 2249 	ld a,#1 
      009CD6 62               [ 1] 2250 3$:	clrw x 
      009CD7 CF               [ 1] 2251 	ld xl,a
      009CD8 00               [ 1] 2252 	clr a  
      009CD9 21               [ 4] 2253 	ret
                                   2254 
                                   2255 ;--------------------
                                   2256 ; BASIC: POKE addr,byte
                                   2257 ; put a byte at addr 
                                   2258 ;--------------------
      0021FB                       2259 poke:
      009CDA 4F 81 46         [ 4] 2260 	call arg_list 
      009CDC A1 02            [ 1] 2261 	cp a,#2
      009CDC CD 97            [ 1] 2262 	jreq 1$
      009CDE EF A1 85         [ 2] 2263 	jp syntax_error
      002205                       2264 1$:	
      002205                       2265 	_xpop ; byte   
      009CE1 27 0C            [ 1]    1     ld a,(y)
      009CE3 A1               [ 1]    2     ldw x,y 
      009CE4 05 27            [ 2]    3     ldw x,(1,x)
      009CE6 03 CC 96 EE      [ 2]    4     addw y,#CELL_SIZE 
      009CEA 9F               [ 1] 2266     ld a,xl 
      009CEA CD               [ 1] 2267 	push a 
      002210                       2268 	_xpop ; address 
      009CEB 99 E2            [ 1]    1     ld a,(y)
      009CED 20               [ 1]    2     ldw x,y 
      009CEE 03 01            [ 2]    3     ldw x,(1,x)
      009CEF 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009CEF CD               [ 1] 2269 	pop a 
      009CF0 98               [ 1] 2270 	ld (x),a 
      009CF1 24               [ 4] 2271 	ret 
                                   2272 
                                   2273 ;-----------------------
                                   2274 ; BASIC: PEEK(addr)
                                   2275 ; get the byte at addr 
                                   2276 ; input:
                                   2277 ;	none 
                                   2278 ; output:
                                   2279 ;	X 		value 
                                   2280 ;-----------------------
      009CF2                       2281 peek:
      009CF2 CF 00 1A         [ 4] 2282 	call func_args
      009CF5 CD 97            [ 1] 2283 	cp a,#1 
      009CF7 EF A1            [ 1] 2284 	jreq 1$
      009CF9 32 27 03         [ 2] 2285 	jp syntax_error
      002226                       2286 1$: _xpop ; address  
      009CFC CC 96            [ 1]    1     ld a,(y)
      009CFE EE               [ 1]    2     ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      009CFF EE 01            [ 2]    3     ldw x,(1,x)
      009CFF CD 9C 0A A1      [ 2]    4     addw y,#CELL_SIZE 
      009D03 84 27 03         [ 1] 2287 	ld farptr,a 
      009D06 CC 96 EE         [ 2] 2288 	ldw ptr16,x 
      009D09 92 BC 00 18      [ 5] 2289 	ldf a,[farptr]
      009D09 90               [ 1] 2290 	clrw x 
      009D0A F6               [ 1] 2291 	ld xl,a 
      009D0B 93               [ 1] 2292 	clr a 
      009D0C EE               [ 4] 2293 	ret 
                                   2294 
                                   2295 ;---------------------------
                                   2296 ; BASIC IF expr : instructions
                                   2297 ; evaluate expr and if true 
                                   2298 ; execute instructions on same line. 
                                   2299 ;----------------------------
      00223D                       2300 if: 
      009D0D 01 72 A9         [ 4] 2301 	call condition  
      002240                       2302 	_xpop 
      009D10 00 03            [ 1]    1     ld a,(y)
      009D12 93               [ 1]    2     ldw x,y 
      009D12 72 C7            [ 2]    3     ldw x,(1,x)
      009D14 00 1A 72 5C      [ 2]    4     addw y,#CELL_SIZE 
      009D18 00               [ 1] 2303 	tnz  a  
      009D19 1B 72            [ 1] 2304 	jrne 9$
      009D1B CF               [ 2] 2305 	tnzw x 
      009D1C 00 1A            [ 1] 2306 	jrne 9$  
                                   2307 ;skip to next line
      009D1E 81 00 03 00 01   [ 1] 2308 	mov in,count
      009D1F                       2309 	_drop 2 
      009D1F F6 A0            [ 2]    1     addw sp,#2 
      009D21 03 88 4B         [ 2] 2310 	jp next_line
      009D24 00               [ 4] 2311 9$:	ret 
                                   2312 
                                   2313 ;------------------------
                                   2314 ; BASIC: FOR var=expr 
                                   2315 ; set variable to expression 
                                   2316 ; leave variable address 
                                   2317 ; on stack and set
                                   2318 ; FLOOP bit in 'flags'
                                   2319 ;-----------------
                           000001  2320 	RETL1=1 ; return address  
                           000003  2321 	FSTEP=3  ; variable increment int24
                           000006  2322 	LIMIT=6 ; loop limit, int24  
                           000009  2323 	CVAR=9   ; control variable 
                           00000B  2324 	INW=11   ;  in.w saved
                           00000D  2325 	BPTR=13 ; baseptr saved
                           00000D  2326 	VSIZE=13  
      00225A                       2327 for: ; { -- var_addr }
      009D25 72               [ 2] 2328 	popw x ; call return address 
      00225B                       2329 	_vars VSIZE 
      009D26 FB 01            [ 2]    1     sub sp,#VSIZE 
      009D28 F6               [ 2] 2330 	pushw x  ; RETL1 
      009D29 EE 01            [ 1] 2331 	ld a,#TK_VAR 
      009D2B 5B 02 81         [ 4] 2332 	call expect
      009D2E CD 17 A4         [ 4] 2333 	call get_addr
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      009D2E 90 89            [ 2] 2334 	ldw (CVAR,sp),x  ; control variable 
      009D30 52 04 5F         [ 4] 2335 	call let_eval 
      009D33 1F 01 90 AE      [ 1] 2336 	bset flags,#FLOOP 
      009D37 40 00 90         [ 4] 2337 	call next_token 
      009D3A C3 00            [ 1] 2338 	cp a,#TK_CMD 
      009D3C 25 24            [ 1] 2339 	jreq 1$
      009D3E 35 17 03         [ 2] 2340 	jp syntax_error
      002279                       2341 1$:  
      009D41 93 5C CD         [ 4] 2342 	call get_code_addr
      009D44 89 ED A6         [ 2] 2343 	cpw x,#to   
      009D47 3D CD            [ 1] 2344 	jreq to
      009D49 89 90 1E         [ 2] 2345 	jp syntax_error 
                                   2346 
                                   2347 ;-----------------------------------
                                   2348 ; BASIC: TO expr 
                                   2349 ; second part of FOR loop initilization
                                   2350 ; leave limit on stack and set 
                                   2351 ; FTO bit in 'flags'
                                   2352 ;-----------------------------------
      002284                       2353 to: ; { var_addr -- var_addr limit step }
      009D4C 03 CD 9D 1F C7   [ 2] 2354 	btjt flags,#FLOOP,1$
      009D51 00 0D CF         [ 2] 2355 	jp syntax_error
      009D54 00 0E CD         [ 4] 2356 1$: call expression   
      009D57 98 5B            [ 1] 2357 	cp a,#TK_INTGR 
      009D59 A6 0D            [ 1] 2358 	jreq 2$ 
      009D5B CD 89 90         [ 2] 2359 	jp syntax_error
      002296                       2360 2$: _xpop
      009D5E 1E 01            [ 1]    1     ld a,(y)
      009D60 5C               [ 1]    2     ldw x,y 
      009D61 1F 01            [ 2]    3     ldw x,(1,x)
      009D63 72 5F 00 0E      [ 2]    4     addw y,#CELL_SIZE 
      009D67 16 03            [ 1] 2361 	ld (LIMIT,sp),a 
      009D69 90 F6            [ 2] 2362 	ldw (LIMIT+1,sp),x
      009D6B C7 00 0F         [ 4] 2363 	call next_token
      009D6E 72 B9            [ 1] 2364 	cp a,#TK_NONE  
      009D70 00 0E            [ 1] 2365 	jreq 4$ 
      009D72 20 C5            [ 1] 2366 	cp a,#TK_CMD
      009D74 26 08            [ 1] 2367 	jrne 3$
      009D74 1E 01 CD         [ 4] 2368 	call get_code_addr
      009D77 98 44 AE         [ 2] 2369 	cpw x,#step 
      009D7A 9D 84            [ 1] 2370 	jreq step
      0022B6                       2371 3$:	
      0022B6                       2372 	_unget_token   	 
      009D7C CD 89 ED 5B 04   [ 1]    1      mov in,in.saved  
      0022BB                       2373 4$:	
      009D81 90 85            [ 1] 2374 	clr (FSTEP,sp) 
      009D83 81 20 63         [ 2] 2375 	ldw x,#1   ; default step  
      009D86 6F 6E            [ 2] 2376 	ldw (FSTEP+1,sp),x 
      009D88 73 74            [ 2] 2377 	jra store_loop_addr 
                                   2378 
                                   2379 
                                   2380 ;----------------------------------
                                   2381 ; BASIC: STEP expr 
                                   2382 ; optional third par of FOR loop
                                   2383 ; initialization. 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



                                   2384 ;------------------------------------
      0022C4                       2385 step: ; {var limit -- var limit step}
      009D8A 61 6E 74 73 20   [ 2] 2386 	btjt flags,#FLOOP,1$
      009D8F 69 6E 20         [ 2] 2387 	jp syntax_error
      009D92 45 45 50         [ 4] 2388 1$: call expression 
      009D95 52 4F            [ 1] 2389 	cp a,#TK_INTGR
      009D97 4D 0A            [ 1] 2390 	jreq 2$
      009D99 00 16 6E         [ 2] 2391 	jp syntax_error
      009D9A                       2392 2$:	
      0022D6                       2393 	_xpop 
      009D9A AE 40            [ 1]    1     ld a,(y)
      009D9C 00               [ 1]    2     ldw x,y 
      009D9D 35 08            [ 2]    3     ldw x,(1,x)
      009D9F 00 0F A3 47      [ 2]    4     addw y,#CELL_SIZE 
      009DA3 F8 24            [ 1] 2394 	ld (FSTEP,sp),a 
      009DA5 17 F6            [ 2] 2395 	ldw (FSTEP+1,sp),x ; step
                                   2396 ; if step < 0 decrement LIMIT 
      009DA7 26               [ 1] 2397 	tnz a
      009DA8 0C 5C            [ 1] 2398 	jrpl store_loop_addr 
      009DAA 72 5A            [ 1] 2399 	ld a,(LIMIT,sp)
      009DAC 00 0F            [ 2] 2400 	ldw x,(LIMIT+1,sp)
      009DAE 26 F6 1D         [ 2] 2401 	subw x,#1 
      009DB1 00 08            [ 1] 2402 	sbc a,#0 
      009DB3 20 09            [ 1] 2403 	ld (LIMIT,sp),a 
      009DB5 F6 5C            [ 2] 2404 	ldw (LIMIT+1,sp),x 
                                   2405 ; leave loop back entry point on cstack 
                                   2406 ; cstack is 1 call deep from interpreter
      0022F3                       2407 store_loop_addr:
      009DB7 4D 26 FB         [ 2] 2408 	ldw x,basicptr
      009DBA 5A 20            [ 2] 2409 	ldw (BPTR,sp),x 
      009DBC E0 5F 4F         [ 2] 2410 	ldw x,in.w 
      009DBF CF 00            [ 2] 2411 	ldw (INW,sp),x   
      009DC1 25 81 00 22      [ 1] 2412 	bres flags,#FLOOP 
      009DC3 72 5C 00 1F      [ 1] 2413 	inc loop_depth  
      009DC3 90               [ 4] 2414 	ret 
                                   2415 
                                   2416 ;--------------------------------
                                   2417 ; BASIC: NEXT var 
                                   2418 ; FOR loop control 
                                   2419 ; increment variable with step 
                                   2420 ; and compare with limit 
                                   2421 ; loop if threshold not crossed.
                                   2422 ; else stack. 
                                   2423 ; and decrement 'loop_depth' 
                                   2424 ;--------------------------------
      002306                       2425 next: ; {var limit step retl1 -- [var limit step ] }
      009DC4 89 52 05 72      [ 1] 2426 	tnz loop_depth 
      009DC8 5F 00            [ 1] 2427 	jrne 1$ 
      009DCA 0E CD 94         [ 2] 2428 	jp syntax_error 
      00230F                       2429 1$: 
      009DCD 32 AB            [ 1] 2430 	ld a,#TK_VAR 
      009DCF 05 6B 05         [ 4] 2431 	call expect
      009DD2 1F 01 90         [ 4] 2432 	call get_addr 
                                   2433 ; check for good variable after NEXT 	 
      009DD5 AE 40            [ 2] 2434 	cpw x,(CVAR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      009DD7 00 1E            [ 1] 2435 	jreq 2$  
      009DD9 01 17 03         [ 2] 2436 	jp syntax_error ; not the good one 
      00231E                       2437 2$: 
      009DDC 90 C3 00         [ 2] 2438 	ldw ptr16,x 
                                   2439 	; increment variable 
      009DDF 25               [ 1] 2440 	ld a,(x)
      009DE0 24 1A            [ 2] 2441 	ldw x,(1,x)  ; get var value 
      009DE2 90 F6 11         [ 2] 2442 	addw x,(FSTEP+1,sp) ; var+step 
      009DE5 05 26            [ 1] 2443 	adc a,(FSTEP,sp)
      009DE7 07 90 5C CD      [ 4] 2444 	ld [ptr16],a
      009DEB 94 3D 26 11      [ 1] 2445 	inc ptr8  
      009DEF 72 CF 00 19      [ 5] 2446 	ldw [ptr16],x 
      009DEF 16 03 90         [ 1] 2447 	ld acc24,a 
      009DF2 F6 C7 00         [ 2] 2448 	ldw acc16,x 
      009DF5 0F 72            [ 1] 2449 	ld a,(LIMIT,sp)
      009DF7 B9 00            [ 2] 2450 	ldw x,(LIMIT+1,sp)
      009DF9 0E 20 DC 0D      [ 2] 2451 	subw x,acc16 
      009DFC C2 00 0C         [ 1] 2452 	sbc a,acc24
      009DFC 0F 03            [ 1] 2453 	xor a,(FSTEP,sp)
      009DFE 0F 04            [ 1] 2454 	xor a,#0x80
      009E00 2B 12            [ 1] 2455 	jrmi loop_back  
      009E00 1E 03            [ 2] 2456 	jra loop_done   
                                   2457 ; check sign of STEP  
      009E02 5B 05            [ 1] 2458 	ld a,(FSTEP,sp)
      009E04 90 85            [ 1] 2459 	jrpl 4$
                                   2460 ;negative step
      009E06 81 00 0E         [ 1] 2461     ld a,acc8 
      009E07 2F 07            [ 1] 2462 	jrslt loop_back   
      009E07 90 89            [ 2] 2463 	jra loop_done  
      002359                       2464 4$: ; positive step
      009E09 52 08 0F 06 CD   [ 2] 2465 	btjt acc8,#7,loop_done 
      00235E                       2466 loop_back:
      009E0E 97 EF            [ 2] 2467 	ldw x,(BPTR,sp)
      009E10 A1 04 26         [ 2] 2468 	ldw basicptr,x 
      009E13 0D CD 98 3E A4   [ 2] 2469 	btjf flags,#FRUN,1$ 
      009E18 DF A1            [ 1] 2470 	ld a,(2,x)
      009E1A 55 26 08         [ 1] 2471 	ld count,a
      009E1D 03 06            [ 2] 2472 1$:	ldw x,(INW,sp)
      009E1F 20 07 A1         [ 2] 2473 	ldw in.w,x 
      009E22 03               [ 4] 2474 	ret 
      002373                       2475 loop_done:
                                   2476 	; remove loop data from stack  
      009E23 27               [ 2] 2477 	popw x
      002374                       2478 	_drop VSIZE 
      009E24 08 CC            [ 2]    1     addw sp,#VSIZE 
      009E26 96 EE 00 1F      [ 1] 2479 	dec loop_depth 
      009E28 FC               [ 2] 2480 	jp (x)
                                   2481 
                                   2482 ;----------------------------
                                   2483 ; called by goto/gosub
                                   2484 ; to get target line number 
                                   2485 ; output:
                                   2486 ;    x    line address 
                                   2487 ;---------------------------
      00237B                       2488 get_target_line:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      009E28 A6 03 CD         [ 4] 2489 	call next_token  
      009E2B 99 B4            [ 1] 2490 	cp a,#TK_INTGR
      009E2D 27 07            [ 1] 2491 	jreq get_target_line_addr 
      009E2D 1F 01            [ 1] 2492 	cp a,#TK_LABEL 
      009E2F CD 98            [ 1] 2493 	jreq look_target_symbol 
      009E31 15 1E 01         [ 2] 2494 	jp syntax_error
                                   2495 ; the target is a line number 
                                   2496 ; search it. 
      002389                       2497 get_target_line_addr:
      009E34 CD 94            [ 2] 2498 	pushw y 
      009E36 32 AB 05         [ 4] 2499 	call get_int24 ; line # 
      009E39 6B               [ 1] 2500 	clr a
      009E3A 05 16 01 AE      [ 2] 2501 	ldw y,basicptr 
      009E3E 16 68            [ 2] 2502 	ldw y,(y)
      009E40 7B 05            [ 2] 2503 	pushw y 
      009E42 F7 5C            [ 2] 2504 	cpw x,(1,sp)
      002399                       2505 	_drop 2  
      009E44 CD 94            [ 2]    1     addw sp,#2 
      009E46 4E 1F            [ 1] 2506 	jrult 11$
      009E48 03               [ 1] 2507 	inc a 
      00239E                       2508 11$: ; scan program for this line# 	
      009E49 5F 7B 05         [ 4] 2509 	call search_lineno  
      009E4C A0               [ 2] 2510 	tnzw x ; 0| line# address 
      009E4D 04 97            [ 1] 2511 	jrne 2$ 
      009E4F 72 FB            [ 1] 2512 	ld a,#ERR_NO_LINE 
      009E51 03 1F 03         [ 2] 2513 	jp tb_error 
      009E54 A6 32            [ 2] 2514 2$:	popw y  
      009E56 CD               [ 4] 2515 	ret 
                                   2516 
                                   2517 ; the GOTO|GOSUB target is a symbol.
                                   2518 ; output:
                                   2519 ;    X    line address|0 
      0023AC                       2520 look_target_symbol:
      009E57 99 B4            [ 2] 2521 	pushw y 
      009E59 16               [ 2] 2522 	pushw x 
      009E5A 07 CD 9A F1      [ 1] 2523 	clr acc16 
      009E5E A1 84 27 03      [ 2] 2524 	ldw y,txtbgn 
      009E62 CC 96 EE         [ 1] 2525 1$:	ld a,(3,y) ; first TK_ID on line 
      009E65 90 F6            [ 1] 2526 	cp a,#TK_LABEL 
      009E67 93 EE            [ 1] 2527 	jreq 3$ 
      009E69 01 72 A9         [ 1] 2528 2$:	ld a,(2,y); line length 
      009E6C 00 03 17         [ 1] 2529 	ld acc8,a 
      009E6F 07 16 03 90      [ 2] 2530 	addw y,acc16 ;point to next line 
      009E73 F7 90 EF 01      [ 2] 2531 	cpw y,txtend 
      009E77 72 5F            [ 1] 2532 	jrult 1$
      009E79 00 19            [ 1] 2533 	ld a,#ERR_BAD_VALUE
      009E7B 1E 01 CD         [ 2] 2534 	jp tb_error 
      0023D3                       2535 3$: ; found a TK_LABEL 
                                   2536 	; compare with GOTO|GOSUB target 
      009E7E 9D C3            [ 2] 2537 	pushw y ; line address 
      009E80 5D 27 06 0D      [ 2] 2538 	addw y,#4 ; label string 
      009E84 06 27            [ 2] 2539 	ldw x,(3,sp) ; target string 
      009E86 1F 20 03         [ 4] 2540 	call strcmp
      009E89 26 04            [ 1] 2541 	jrne 4$
      009E89 CE 00            [ 2] 2542 	popw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      009E8B 25 DA            [ 2] 2543 	jra 2$ 
      009E8C                       2544 4$: ; target found 
      009E8C CF               [ 2] 2545 	popw x ;  address line target  
      0023E5                       2546 	_drop 2 ; target string 
      009E8D 00 1A            [ 2]    1     addw sp,#2 
      009E8F AE 16            [ 2] 2547 	popw y 
      009E91 68               [ 4] 2548 	ret
                                   2549 
                                   2550 
                                   2551 ;--------------------------------
                                   2552 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2553 ; selective goto or gosub 
                                   2554 ;--------------------------------
      0023EA                       2555 cmd_on:
      009E92 7B 05 CD 88 D1   [ 2] 2556 	btjt flags,#FRUN,0$ 
      009E97 0D 06            [ 1] 2557 	ld a,#ERR_RUN_ONLY
      009E99 26 0B 5F         [ 2] 2558 	jp tb_error 
      009E9C 7B 05 97         [ 4] 2559 0$:	call expression 
      009E9F 72 BB            [ 1] 2560 	cp a,#TK_INTGR
      009EA1 00 25            [ 1] 2561 	jreq 1$
      009EA3 CF 00 25         [ 2] 2562 	jp syntax_error
      009EA6                       2563 1$: _xpop
      009EA6 CD 97            [ 1]    1     ld a,(y)
      009EA8 EF               [ 1]    2     ldw x,y 
      009EA9 A1 08            [ 2]    3     ldw x,(1,x)
      009EAB 26 03 CC 9E      [ 2]    4     addw y,#CELL_SIZE 
                                   2564 ; the selector is the element indice 
                                   2565 ; in the list of arguments. {1..#elements} 
      009EAF 28               [ 1] 2566 	ld a,xl ; keep only bits 7..0
      009EB0 27 62            [ 1] 2567 	jreq 9$ ; element # begin at 1. 
      009EB0 55               [ 1] 2568 	push a  ; selector  
      009EB1 00 03 00         [ 4] 2569 	call next_token
      009EB4 02 80            [ 1] 2570 	cp a,#TK_CMD 
      009EB5 27 03            [ 1] 2571 	jreq 2$ 
      009EB5 5B 08 90         [ 2] 2572 	jp syntax_error 
      009EB8 85 81 88         [ 4] 2573 2$: call get_code_addr
                                   2574 ;; must be a GOTO or GOSUB 
      009EBA A3 24 76         [ 2] 2575 	cpw x,#goto 
      009EBA CE 00            [ 1] 2576 	jreq 4$
      009EBC 1E 72 B0         [ 2] 2577 	cpw x,#gosub 
      009EBF 00 1C            [ 1] 2578 	jreq 4$ 
      009EC1 81 16 6E         [ 2] 2579 	jp syntax_error 
      009EC2                       2580 4$: 
      009EC2 AE               [ 1] 2581 	pop a 
      009EC3 9F               [ 2] 2582 	pushw x ; save routine address 	
      009EC4 01               [ 1] 2583 	push a  ; selector  
      002428                       2584 5$: ; skip elements in list until selector==0 
      009EC5 CD 89            [ 1] 2585 	dec (1,sp)
      009EC7 ED CE            [ 1] 2586 	jreq 6$ 
                                   2587 ; can be a line# or a label 
      009EC9 00 1C 35         [ 4] 2588 	call next_token 
      009ECC 10 00            [ 1] 2589 	cp a,#TK_INTGR 
      009ECE 0B CD            [ 1] 2590 	jreq 52$
      009ED0 98 44            [ 1] 2591 	cp a,#TK_LABEL 
      009ED2 35 0A            [ 1] 2592 	jreq 54$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      009ED4 00 0B AE         [ 2] 2593 	jp syntax_error 
      00243A                       2594 52$: ; got a line number 
      009ED7 9F 13 CD         [ 1] 2595 	ld a,in ; skip over int24 value 
      009EDA 89 ED            [ 1] 2596 	add a,#CELL_SIZE ; integer size  
      009EDC CD 9E BA         [ 1] 2597 	ld in,a 
      009EDF CD 98            [ 2] 2598 	jra 56$
      009EE1 44 AE 9F         [ 4] 2599 54$: call skip_string ; skip over label 	
      002447                       2600 56$: ; if another element comma present 
      009EE4 24 CD 89         [ 4] 2601 	call next_token
      009EE7 ED CE            [ 1] 2602 	cp a,#TK_COMMA 
      009EE9 00 1C            [ 1] 2603 	jreq 5$ 
                                   2604 ; arg list exhausted, selector to big 
                                   2605 ; continue execution on next line 
      00244E                       2606 	_drop 3 ; drop selector and GOTO|GOSUB address 
      009EEB A3 B6            [ 2]    1     addw sp,#3 
      009EED 04 25            [ 2] 2607 	jra 9$
      002452                       2608 6$: ;at selected position  
      002452                       2609 	_drop 1 ; discard selector
      009EEF 05 AE            [ 2]    1     addw sp,#1 
                                   2610 ; here only the routine address 
                                   2611 ; of GOTO|GOSUB is on stack 
      009EF1 9F 2B 20         [ 4] 2612     call get_target_line
      009EF4 03 AE 9F         [ 2] 2613 	ldw ptr16,x 	
      009EF7 3C CD 89 ED A6   [ 1] 2614 	mov in,count ; move to end of line  
      009EFC 0D               [ 2] 2615 	popw x ; cmd address, GOTO||GOSUB 
      009EFD CD 89 90         [ 2] 2616 	cpw x,#goto 
      009F00 81 70            [ 1] 2617 	jrne 7$ 
      009F02 72 6F 67         [ 2] 2618 	ldw x,ptr16 
      009F05 72 61            [ 2] 2619 	jra jp_to_target
      00246A                       2620 7$: 
      009F07 6D 20            [ 2] 2621 	jra gosub_2 ; target in ptr16 
      00246C                       2622 9$: ; expr out of range skip to end of line
                                   2623     ; this will force a fall to next line  
      009F09 61 64 64 72 65   [ 1] 2624 	mov in,count
      002471                       2625 	_drop 2
      009F0E 73 73            [ 2]    1     addw sp,#2 
      009F10 3A 20 00         [ 2] 2626 	jp next_line  
                                   2627 
                                   2628 
                                   2629 ;------------------------
                                   2630 ; BASIC: GOTO line# 
                                   2631 ; jump to line# 
                                   2632 ; here cstack is 2 call deep from interpreter 
                                   2633 ;------------------------
      002476                       2634 goto:
      009F13 2C 20 70 72 6F   [ 2] 2635 	btjt flags,#FRUN,goto_1  
      009F18 67 72            [ 1] 2636 	ld a,#ERR_RUN_ONLY
      009F1A 61 6D 20         [ 2] 2637 	jp tb_error 
      002480                       2638 goto_1:
      009F1D 73 69 7A         [ 4] 2639 	call get_target_line
      002483                       2640 jp_to_target:
      009F20 65 3A 20         [ 2] 2641 	ldw basicptr,x 
      009F23 00 20            [ 1] 2642 	ld a,(2,x)
      009F25 62 79 74         [ 1] 2643 	ld count,a 
      009F28 65 73 00 20      [ 1] 2644 	mov in,#3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      009F2C 69               [ 4] 2645 	ret 
                                   2646 
                                   2647 
                                   2648 ;--------------------
                                   2649 ; BASIC: GOSUB line#
                                   2650 ; basic subroutine call
                                   2651 ; actual line# and basicptr 
                                   2652 ; are saved on cstack
                                   2653 ; here cstack is 2 call deep from interpreter 
                                   2654 ;--------------------
                           000001  2655 	TARGET=1   ; target address 
                           000003  2656 	RET_ADDR=3 ; subroutine return address 
                           000005  2657 	RET_BPTR=5 ; basicptr return point 
                           000007  2658 	RET_INW=7  ; in.w return point 
                           000004  2659 	VSIZE=4  
      002490                       2660 gosub:
      009F2D 6E 20 46 4C 41   [ 2] 2661 	btjt flags,#FRUN,gosub_1 
      009F32 53 48            [ 1] 2662 	ld a,#ERR_RUN_ONLY
      009F34 20 6D 65         [ 2] 2663 	jp tb_error 
      009F37 6D               [ 4] 2664 	ret 
      00249B                       2665 gosub_1:
      009F38 6F 72 79         [ 4] 2666 	call get_target_line 
      009F3B 00 20 69         [ 2] 2667 	ldw ptr16,x 
      0024A1                       2668 gosub_2: 
      009F3E 6E               [ 2] 2669 	popw x 
      0024A2                       2670 	_vars VSIZE  
      009F3F 20 52            [ 2]    1     sub sp,#VSIZE 
      009F41 41               [ 2] 2671 	pushw x ; RET_ADDR 
      009F42 4D 20 6D         [ 2] 2672 	ldw x,ptr16 
      009F45 65               [ 2] 2673 	pushw x ; TARGET
                                   2674 ; save BASIC subroutine return point.   
      009F46 6D 6F 72         [ 2] 2675 	ldw x,basicptr
      009F49 79 00            [ 2] 2676 	ldw (RET_BPTR,sp),x 
      009F4B CE 00 00         [ 2] 2677 	ldw x,in.w 
      009F4B 72 01            [ 2] 2678 	ldw (RET_INW,sp),x
      009F4D 00               [ 2] 2679 	popw x 
      009F4E 23 05            [ 2] 2680 	jra jp_to_target
                                   2681 
                                   2682 ;------------------------
                                   2683 ; BASIC: RETURN 
                                   2684 ; exit from BASIC subroutine 
                                   2685 ;------------------------
                           000003  2686 	RET_BPTR=3 ; basicptr return point 
                           000005  2687 	RET_INW=5  ; in.w return point 
                           000004  2688 	VSIZE=4  
      0024B6                       2689 return:
      009F50 A6 07 CC 96 F0   [ 2] 2690 	btjt flags,#FRUN,0$ 
      009F55 A6 06            [ 1] 2691 	ld a,#ERR_RUN_ONLY
      009F55 CD 97 EF         [ 2] 2692 	jp tb_error 
      0024C0                       2693 0$:	
      009F58 A1 04            [ 2] 2694 	ldw x,(RET_ADDR,sp) 
      009F5A 26 10 CD         [ 2] 2695 	ldw basicptr,x
      009F5D 98 3E            [ 1] 2696 	ld a,(2,x)
      009F5F A4 DF A1         [ 1] 2697 	ld count,a  
      009F62 43 26            [ 2] 2698 	ldw x,(RET_INW,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      009F64 04 CD 9D         [ 2] 2699 	ldw in.w,x 
      009F67 2E               [ 2] 2700 	popw x 
      0024D0                       2701 	_drop VSIZE 
      009F68 81 CC            [ 2]    1     addw sp,#VSIZE 
      009F6A 96               [ 2] 2702 	pushw x
      009F6B EE               [ 4] 2703 	ret  
                                   2704 
                                   2705 ;----------------------------------
                                   2706 ; BASIC: RUN
                                   2707 ; run BASIC program in RAM
                                   2708 ;----------------------------------- 
      0024D4                       2709 run: 
      009F6C 55 00 03 00 02   [ 2] 2710 	btjf flags,#FRUN,0$  
      009F71 CD               [ 1] 2711 	clr a 
      009F72 9E               [ 4] 2712 	ret
      0024DB                       2713 0$: 
      009F73 BA 22 01 81 52   [ 2] 2714 	btjf flags,#FBREAK,1$
      0024E0                       2715 	_drop 2 
      009F78 06 CE            [ 2]    1     addw sp,#2 
      009F7A 00 1C 1F         [ 4] 2716 	call rest_context
      0024E5                       2717 	_drop CTXT_SIZE 
      009F7D 05 FE            [ 2]    1     addw sp,#CTXT_SIZE 
      009F7F 1F 01 AE 7F      [ 1] 2718 	bres flags,#FBREAK 
      009F83 FF 1F 03 CD      [ 1] 2719 	bset flags,#FRUN 
      009F87 99 C6 4D         [ 2] 2720 	jp interpreter 
      009F8A 27 31 A1         [ 2] 2721 1$:	ldw x,txtbgn
      009F8D 02 27 07         [ 2] 2722 	cpw x,txtend 
      009F90 A1 01            [ 1] 2723 	jrmi run_it 
      009F92 27 06 CC         [ 2] 2724 	ldw x,#err_no_prog
      009F95 96 EE 85         [ 4] 2725 	call puts 
      009F98 1F 05 03 00 01   [ 1] 2726 	mov in,count
      009F9A 81               [ 4] 2727 	ret 
      002506                       2728 run_it:	 
      002506                       2729 	_drop 2 ; drop return address 
      009F9A 85 1F            [ 2]    1     addw sp,#2 
      002508                       2730 run_it_02: 
      009F9C 01 1C 51         [ 4] 2731     call ubound 
      009F9D CD 14 22         [ 4] 2732 	call clear_vars 
                                   2733 ; clear data pointer 
      009F9D CE               [ 1] 2734 	clrw x 
      009F9E 00 1C 1F         [ 2] 2735 	ldw data_ptr,x 
      009FA1 05 C3 00 1E      [ 1] 2736 	clr data_ofs 
      009FA5 2A 38 FE 13      [ 1] 2737 	clr data_len 
                                   2738 ; initialize BASIC pointer 
      009FA9 01 2A 11         [ 2] 2739 	ldw x,txtbgn 
      009FAC 1E 05 E6         [ 2] 2740 	ldw basicptr,x 
      009FAF 02 C7            [ 1] 2741 	ld a,(2,x)
      009FB1 00 0F 72         [ 1] 2742 	ld count,a
      009FB4 5F 00 0E 72      [ 1] 2743 	mov in,#3	
      009FB8 BB 00 0E 20      [ 1] 2744 	bset flags,#FRUN 
      009FBC E3 17 19         [ 2] 2745 	jp interpreter 
                                   2746 
                                   2747 
                                   2748 ;----------------------
                                   2749 ; BASIC: END
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



                                   2750 ; end running program
                                   2751 ;---------------------- 
      009FBD                       2752 cmd_end: 
                                   2753 ; clean stack 
      009FBD 1E 05 E6         [ 2] 2754 	ldw x,#STACK_EMPTY
      009FC0 02               [ 1] 2755 	ldw sp,x 
      009FC1 CD A0 34         [ 2] 2756 	jp warm_start
                                   2757 
                                   2758 ;---------------------------
                                   2759 ; BASIC: GET var 
                                   2760 ; receive a key in variable 
                                   2761 ; don't wait 
                                   2762 ;---------------------------
      002537                       2763 cmd_get:
      009FC4 1E 05 E6         [ 4] 2764 	call next_token 
      009FC7 02 C7            [ 1] 2765 	cp a,#TK_VAR 
      009FC9 00 0F            [ 1] 2766 	jreq 0$
      009FCB 72 5F 00         [ 2] 2767 	jp syntax_error 
      009FCE 0E 72 BB         [ 4] 2768 0$: call get_addr 
      009FD1 00 0E C3         [ 2] 2769 	ldw ptr16,x 
      009FD4 00 1E 2A         [ 4] 2770 	call qgetc 
      009FD7 07 1F            [ 1] 2771 	jreq 2$
      009FD9 05 FE 13         [ 4] 2772 	call getc  
      009FDC 03 2F DE 19      [ 4] 2773 2$: clr [ptr16]
      009FDF 72 5C 00 1A      [ 1] 2774 	inc ptr8 
      009FDF 55 00 04 00      [ 4] 2775 	clr [ptr16]
      009FE3 02 AE 16 B8      [ 1] 2776 	inc ptr8 
      009FE7 CF 00 05 5B      [ 4] 2777 	ld [ptr16],a 
      009FEB 06               [ 4] 2778 	ret 
                                   2779 
                                   2780 
                                   2781 ;-----------------
                                   2782 ; 1 Khz beep 
                                   2783 ;-----------------
      002564                       2784 beep_1khz:: 
      009FEC CD 9E            [ 2] 2785 	pushw y 
      009FEE C2 81 64         [ 2] 2786 	ldw x,#100
      009FF0 90 AE 03 E8      [ 2] 2787 	ldw y,#1000
      009FF0 CD A8            [ 2] 2788 	jra beep
                                   2789 
                                   2790 ;-----------------------
                                   2791 ; BASIC: TONE expr1,expr2
                                   2792 ; used TIMER2 channel 1
                                   2793 ; to produce a tone 
                                   2794 ; arguments:
                                   2795 ;    expr1   frequency 
                                   2796 ;    expr2   duration msec.
                                   2797 ;---------------------------
      00256F                       2798 tone:
      009FF2 1F 27            [ 2] 2799 	pushw y 
      009FF4 07 AE A0         [ 4] 2800 	call arg_list 
      009FF7 1D CD            [ 1] 2801 	cp a,#2 
      009FF9 89 ED            [ 1] 2802 	jreq 1$
      009FFB 81 16 6E         [ 2] 2803 	jp syntax_error 
      009FFC                       2804 1$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00257B                       2805 	_xpop 
      009FFC 90 AE            [ 1]    1     ld a,(y)
      009FFE B6               [ 1]    2     ldw x,y 
      009FFF 00 CE            [ 2]    3     ldw x,(1,x)
      00A001 B6 02 1C 00      [ 2]    4     addw y,#CELL_SIZE 
      00A005 04               [ 2] 2806 	pushw x ; duration 
      002585                       2807 	_xpop ; frequency
      00A006 CF 00            [ 1]    1     ld a,(y)
      00A008 0E               [ 1]    2     ldw x,y 
      00A009 AE 00            [ 2]    3     ldw x,(1,x)
      00A00B 7C CD 94 5E      [ 2]    4     addw y,#CELL_SIZE 
      00A00F AE 00            [ 1] 2808 	ldw y,x ; frequency 
      00A011 80               [ 2] 2809 	popw x  ; duration 
      002591                       2810 beep:  
      00A012 CF               [ 2] 2811 	pushw x 
      00A013 00 1C 72         [ 2] 2812 	ldw x,#TIM2_CLK_FREQ
      00A016 BB               [ 2] 2813 	divw x,y ; cntr=Fclk/freq 
                                   2814 ; round to nearest integer 
      00A017 00 7E CF 00      [ 2] 2815 	cpw y,#TIM2_CLK_FREQ/2
      00A01B 1E 81            [ 1] 2816 	jrmi 2$
      00A01D 4E               [ 1] 2817 	incw x 
      00259D                       2818 2$:	 
      00A01E 6F               [ 1] 2819 	ld a,xh 
      00A01F 20 61 70         [ 1] 2820 	ld TIM2_ARRH,a 
      00A022 70               [ 1] 2821 	ld a,xl 
      00A023 6C 69 63         [ 1] 2822 	ld TIM2_ARRL,a 
                                   2823 ; 50% duty cycle 
      00A026 61               [ 1] 2824 	ccf 
      00A027 74               [ 2] 2825 	rrcw x 
      00A028 69               [ 1] 2826 	ld a,xh 
      00A029 6F 6E 20         [ 1] 2827 	ld TIM2_CCR1H,a 
      00A02C 73               [ 1] 2828 	ld a,xl
      00A02D 61 76 65         [ 1] 2829 	ld TIM2_CCR1L,a
      00A030 64 2E 0A 00      [ 1] 2830 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A034 72 10 53 00      [ 1] 2831 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A034 90 89 C7 00      [ 1] 2832 	bset TIM2_EGR,#TIM2_EGR_UG
      00A038 04               [ 2] 2833 	popw x 
      00A039 E6 02 C1         [ 4] 2834 	call pause02
      00A03C 00 04 2A 03      [ 1] 2835 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A040 C7 00 04 CF      [ 1] 2836 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A044 00 05            [ 2] 2837 	popw y 
      00A046 90               [ 4] 2838 	ret 
                                   2839 
                                   2840 ;-------------------------------
                                   2841 ; BASIC: ADCON 0|1 [,divisor]  
                                   2842 ; disable/enanble ADC 
                                   2843 ;-------------------------------
                           000003  2844 	ONOFF=3 
                           000001  2845 	DIVSOR=1
                           000004  2846 	VSIZE=4 
      0025CA                       2847 power_adc:
      00A047 AE 16 68         [ 4] 2848 	call arg_list 
      00A04A CD 92            [ 1] 2849 	cp a,#2	
      00A04C 48 CD            [ 1] 2850 	jreq 1$
      00A04E 89 ED            [ 1] 2851 	cp a,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      00A050 A6 0D            [ 1] 2852 	jreq 0$ 
      00A052 CD 89 90         [ 2] 2853 	jp syntax_error 
      00A055 90               [ 1] 2854 0$:	clr a 
      00A056 85               [ 1] 2855 	clrw x
      0025DA                       2856 	_xpush   ; divisor  
      00A057 81 A2 00 03      [ 2]    1     subw y,#CELL_SIZE
      00A058 90 F7            [ 1]    2     ld (y),a 
      00A058 52 01 01         [ 2]    3     ldw (1,y),x 
      00A05A                       2857 1$: _at_next 
      00A05A 0F 01 03         [ 1]    1     ld a,(3,y)
      00A05C 93               [ 1]    2     ldw x,y 
      00A05C CD 97            [ 2]    3     ldw x,(4,x)
      00A05E EF               [ 2] 2858 	tnzw x 
      00A05F A1 02            [ 1] 2859 	jreq 2$ 
      0025EC                       2860 	_xpop
      00A061 25 08            [ 1]    1     ld a,(y)
      00A063 A1               [ 1]    2     ldw x,y 
      00A064 0A 27            [ 2]    3     ldw x,(1,x)
      00A066 04 A1 80 26      [ 2]    4     addw y,#CELL_SIZE 
      0025F5                       2861 	_xdrop  
      00A06A 07 A9 00 03      [ 2]    1     addw y,#CELL_SIZE 
      00A06B 9F               [ 1] 2862 	ld a,xl
      00A06B 55 00            [ 1] 2863 	and a,#7
      00A06D 03               [ 1] 2864 	swap a 
      00A06E 00 02 20         [ 1] 2865 	ld ADC_CR1,a
      00A071 5D 16 50 CA      [ 1] 2866 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A072 72 10 54 01      [ 1] 2867 	bset ADC_CR1,#ADC_CR1_ADON 
      002608                       2868 	_usec_dly 7 
      00A072 A1 02 27         [ 2]    1     ldw x,#(16*7-2)/4
      00A075 12               [ 2]    2     decw x
      00A076 A1               [ 1]    3     nop 
      00A077 04 27            [ 1]    4     jrne .-4
      00A079 1B A1            [ 2] 2869 	jra 3$
      00A07B 82 27 1F A1      [ 1] 2870 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A07F 08 27 24 A1      [ 1] 2871 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      002619                       2872 3$:	
      00A083 09               [ 4] 2873 	ret
                                   2874 
                                   2875 ;-----------------------------
                                   2876 ; BASIC: ADCREAD (channel)
                                   2877 ; read adc channel {0..5}
                                   2878 ; output:
                                   2879 ;   A 		TK_INTGR 
                                   2880 ;   X 		value 
                                   2881 ;-----------------------------
      00261A                       2882 analog_read:
      00A084 27 24 20         [ 4] 2883 	call func_args 
      00A087 37 01            [ 1] 2884 	cp a,#1 
      00A088 27 03            [ 1] 2885 	jreq 1$
      00A088 CD 89 ED         [ 2] 2886 	jp syntax_error
      002624                       2887 1$: _xpop 
      00A08B 5C 72            [ 1]    1     ld a,(y)
      00A08D B0               [ 1]    2     ldw x,y 
      00A08E 00 05            [ 2]    3     ldw x,(1,x)
      00A090 CF 00 01 20      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00A094 C5 00 05         [ 2] 2888 	cpw x,#5 
      00A095 23 05            [ 2] 2889 	jrule 2$
      00A095 CD 98            [ 1] 2890 	ld a,#ERR_BAD_VALUE
      00A097 3E CD 89         [ 2] 2891 	jp tb_error 
      00A09A 90               [ 1] 2892 2$: ld a,xl
      00A09B 20 BD 0E         [ 1] 2893 	ld acc8,a 
      00A09D A6 05            [ 1] 2894 	ld a,#5
      00A09D CD 98 08         [ 1] 2895 	sub a,acc8 
      00A0A0 FD CD 89         [ 1] 2896 	ld ADC_CSR,a
      00A0A3 90 20 B4 02      [ 1] 2897 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A0A6 72 10 54 01      [ 1] 2898 	bset ADC_CR1,#ADC_CR1_ADON
      00A0A6 03 01 20 B2 FB   [ 2] 2899 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00A0AA CE 54 04         [ 2] 2900 	ldw x,ADC_DRH
      00A0AA CD 97            [ 1] 2901 	ld a,#TK_INTGR
      00A0AC EF               [ 4] 2902 	ret 
                                   2903 
                                   2904 ;-----------------------
                                   2905 ; BASIC: DREAD(pin)
                                   2906 ; Arduino pins 
                                   2907 ; read state of a digital pin 
                                   2908 ; pin# {0..15}
                                   2909 ; output:
                                   2910 ;    A 		TK_INTGR
                                   2911 ;    X      0|1 
                                   2912 ;-------------------------
                           000001  2913 	PINNO=1
                           000001  2914 	VSIZE=1
      002656                       2915 digital_read:
      002656                       2916 	_vars VSIZE 
      00A0AD A1 84            [ 2]    1     sub sp,#VSIZE 
      00A0AF 27 03 CC         [ 4] 2917 	call func_args
      00A0B2 96 EE            [ 1] 2918 	cp a,#1
      00A0B4 27 03            [ 1] 2919 	jreq 1$
      00A0B4 CD 98 2E         [ 2] 2920 	jp syntax_error
      002662                       2921 1$: _xpop 
      00A0B7 9F A4            [ 1]    1     ld a,(y)
      00A0B9 0F               [ 1]    2     ldw x,y 
      00A0BA C7 00            [ 2]    3     ldw x,(1,x)
      00A0BC 24 20 9B 03      [ 2]    4     addw y,#CELL_SIZE 
      00A0BF A3 00 0F         [ 2] 2922 	cpw x,#15 
      00A0BF 55 00            [ 2] 2923 	jrule 2$
      00A0C1 03 00            [ 1] 2924 	ld a,#ERR_BAD_VALUE
      00A0C3 02 CD 9C         [ 2] 2925 	jp tb_error 
      00A0C6 0A 4D 27         [ 4] 2926 2$:	call select_pin 
      00A0C9 05 CD            [ 1] 2927 	ld (PINNO,sp),a
      00A0CB 98 69            [ 1] 2928 	ld a,(GPIO_IDR,x)
      00A0CD 20 8B            [ 1] 2929 	tnz (PINNO,sp)
      00A0CF 27 05            [ 1] 2930 	jreq 8$
      00A0CF 0D               [ 1] 2931 3$: srl a 
      00A0D0 01 26            [ 1] 2932 	dec (PINNO,sp)
      00A0D2 05 A6            [ 1] 2933 	jrne 3$ 
      00A0D4 0D CD            [ 1] 2934 8$: and a,#1 
      00A0D6 89               [ 1] 2935 	clrw x 
      00A0D7 90               [ 1] 2936 	ld xl,a 
      00A0D8 5B               [ 1] 2937 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00268A                       2938 	_drop VSIZE
      00A0D9 01 81            [ 2]    1     addw sp,#VSIZE 
      00A0DB 81               [ 4] 2939 	ret
                                   2940 
                                   2941 
                                   2942 ;-----------------------
                                   2943 ; BASIC: DWRITE pin,0|1
                                   2944 ; Arduino pins 
                                   2945 ; write to a digital pin 
                                   2946 ; pin# {0..15}
                                   2947 ; output:
                                   2948 ;    A 		TK_INTGR
                                   2949 ;    X      0|1 
                                   2950 ;-------------------------
                           000001  2951 	PINNO=1
                           000002  2952 	PINVAL=2
                           000002  2953 	VSIZE=2
      00268D                       2954 digital_write:
      00268D                       2955 	_vars VSIZE 
      00A0DB CE 00            [ 2]    1     sub sp,#VSIZE 
      00A0DD 05 1F 03         [ 4] 2956 	call arg_list  
      00A0E0 C6 00            [ 1] 2957 	cp a,#2 
      00A0E2 02 6B            [ 1] 2958 	jreq 1$
      00A0E4 05 C6 00         [ 2] 2959 	jp syntax_error
      002699                       2960 1$: _xpop 
      00A0E7 04 6B            [ 1]    1     ld a,(y)
      00A0E9 06               [ 1]    2     ldw x,y 
      00A0EA 81 01            [ 2]    3     ldw x,(1,x)
      00A0EB 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A0EB 1E               [ 1] 2961 	ld a,xl 
      00A0EC 03 CF            [ 1] 2962 	ld (PINVAL,sp),a
      0026A5                       2963 	_xpop 
      00A0EE 00 05            [ 1]    1     ld a,(y)
      00A0F0 7B               [ 1]    2     ldw x,y 
      00A0F1 05 C7            [ 2]    3     ldw x,(1,x)
      00A0F3 00 02 7B 06      [ 2]    4     addw y,#CELL_SIZE 
      00A0F7 C7 00 04         [ 2] 2964 	cpw x,#15 
      00A0FA 81 05            [ 2] 2965 	jrule 2$
      00A0FB A6 0A            [ 1] 2966 	ld a,#ERR_BAD_VALUE
      00A0FB 90 89 52         [ 2] 2967 	jp tb_error 
      00A0FE 05 2B 42         [ 4] 2968 2$:	call select_pin 
      00A0FF 6B 01            [ 1] 2969 	ld (PINNO,sp),a 
      00A0FF 0F 05            [ 1] 2970 	ld a,#1
      00A101 CD 97            [ 1] 2971 	tnz (PINNO,sp)
      00A103 EF A1            [ 1] 2972 	jreq 4$
      00A105 02               [ 1] 2973 3$: sll a
      00A106 26 10            [ 1] 2974 	dec (PINNO,sp)
      00A108 CD 89            [ 1] 2975 	jrne 3$
      00A10A ED 5C            [ 1] 2976 4$: tnz (PINVAL,sp)
      00A10C 72 B0            [ 1] 2977 	jrne 5$
      00A10E 00               [ 1] 2978 	cpl a 
      00A10F 05 CF            [ 1] 2979 	and a,(GPIO_ODR,x)
      00A111 00 01            [ 2] 2980 	jra 8$
      00A113 03 05            [ 1] 2981 5$: or a,(GPIO_ODR,x)
      00A115 CD 97            [ 1] 2982 8$: ld (GPIO_ODR,x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      0026D5                       2983 	_drop VSIZE 
      00A117 EF A1            [ 2]    1     addw sp,#VSIZE 
      00A119 85               [ 4] 2984 	ret
                                   2985 
                                   2986 
                                   2987 ;-----------------------
                                   2988 ; BASIC: STOP
                                   2989 ; stop progam execution  
                                   2990 ; without resetting pointers 
                                   2991 ; the program is resumed
                                   2992 ; with RUN 
                                   2993 ;-------------------------
      0026D8                       2994 stop:
      00A11A 27 03 CC 96 EE   [ 2] 2995 	btjt flags,#FRUN,2$
      00A11F CD               [ 1] 2996 	clr a
      00A120 98               [ 4] 2997 	ret 
      0026DF                       2998 2$:	 
                                   2999 ; create space on cstack to save context 
      00A121 24 CF 00         [ 2] 3000 	ldw x,#break_point 
      00A124 1A 0D 05         [ 4] 3001 	call puts 
      0026E5                       3002 	_drop 2 ;drop return address 
      00A127 26 06            [ 2]    1     addw sp,#2 
      0026E7                       3003 	_vars CTXT_SIZE ; context size 
      00A129 CD 92            [ 2]    1     sub sp,#CTXT_SIZE 
      00A12B 1D CD 89         [ 4] 3004 	call save_context 
      00A12E 90 16 68         [ 2] 3005 	ldw x,#tib 
      00A12F CF 00 04         [ 2] 3006 	ldw basicptr,x
      00A12F A6               [ 1] 3007 	clr (x)
      00A130 3A CD 89 90      [ 1] 3008 	clr count  
      00A134 CD               [ 1] 3009 	clrw x 
      00A135 A0 DB 72         [ 2] 3010 	ldw in.w,x
      00A138 5F 00 04 CD      [ 1] 3011 	bres flags,#FRUN 
      00A13C 8A F2 AE 16      [ 1] 3012 	bset flags,#FBREAK
      00A140 68 3B 00         [ 2] 3013 	jp interpreter 
      00A143 04 4B 00 72 FB 01 5C  3014 break_point: .asciz "\nbreak point, RUN to resume.\n"
             5B 02 72 5F 00 02 CD
             8F 67 A1 84 27 14 A1
             11 26 07 CD 8F 67 A1
             84 27
                                   3015 
                                   3016 ;-----------------------
                                   3017 ; BASIC: NEW
                                   3018 ; from command line only 
                                   3019 ; free program memory
                                   3020 ; and clear variables 
                                   3021 ;------------------------
      002724                       3022 new: 
      00A161 06 01 00 22 01   [ 2] 3023 	btjf flags,#FRUN,0$ 
      00A162 81               [ 4] 3024 	ret 
      00272A                       3025 0$:	
      00A162 CD A0 EB         [ 4] 3026 	call clear_basic 
      00A165 CC               [ 4] 3027 	ret 
                                   3028 
                                   3029 ;-----------------------------------
                                   3030 ; BASIC: ERASE \E | \F 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



                                   3031 ; erase all block in range from 
                                   3032 ;  'app_space' to FLASH end (0x20000)
                                   3033 ;  or all EEPROM 
                                   3034 ; that contains a non zero byte.  
                                   3035 ;-----------------------------------
                           000001  3036 	LIMIT=1 
                           000003  3037 	VSIZE = 3 
      00272E                       3038 erase:
      00A166 96 EE 00 18      [ 1] 3039 	clr farptr 
      00A168                       3040 	_vars VSIZE 
      00A168 CD 82            [ 2]    1     sub sp,#VSIZE 
      00A16A 89 17 6F         [ 4] 3041 	call next_token 
      00A16B A1 04            [ 1] 3042 	cp a,#TK_CHAR 
      00A16B C6 00            [ 1] 3043 	jreq 0$ 
      00A16D 0D CE 00         [ 2] 3044 	jp syntax_error
      00A170 0E 72 C7         [ 4] 3045 0$: call get_char 
      00A173 00 1A            [ 1] 3046 	and a,#0XDF 
      00A175 72 5C            [ 1] 3047 	cp a,#'E
      00A177 00 1B            [ 1] 3048 	jrne 1$
      00A179 72 CF 00         [ 2] 3049 	ldw x,#EEPROM_BASE 
      00A17C 1A CD A0         [ 2] 3050 	ldw farptr+1,x 
      00A17F EB CD 97         [ 2] 3051 	ldw x,#EEPROM_END
      00A182 EF               [ 1] 3052 	clr a 
      00A183 A1 08            [ 2] 3053 	jra 3$ 
      00A185 26 03            [ 1] 3054 1$: cp a,#'F 
      00A187 CC A0            [ 1] 3055 	jreq 2$
      00A189 FF 15 AE         [ 2] 3056 	ldw x,#err_bad_value
      00A18A CC 16 70         [ 2] 3057 	jp tb_error
      00275D                       3058 2$:
      00A18A A1 00 27         [ 2] 3059 	ldw x,#app_space  
      00A18D 07 A1 0A         [ 2] 3060 	ldw farptr+1,x 
      00A190 27 03            [ 1] 3061 	ld a,#(FLASH_END>>16)&0XFF 
      00A192 CC 96 EE         [ 2] 3062 	ldw x,#FLASH_END&0xffff
      00A195                       3063 3$:
      00A195 5B 05            [ 1] 3064 	ld (LIMIT,sp),a 
      00A197 90 85            [ 2] 3065 	ldw (LIMIT+1,sp),x 
                                   3066  ; operation done from RAM
                                   3067  ; copy code to RAM in tib   
      00A199 81 07 0E         [ 4] 3068 	call move_erase_to_ram
      00A19A                       3069 4$:	 
      00A19A 55 00 04         [ 4] 3070     call scan_block 
      00A19D 00 02            [ 1] 3071 	jreq 5$  ; block already erased 
      00A19F 81 45            [ 1] 3072     ld a,#'E 
      00A1A0 CD 09 10         [ 4] 3073     call putc 
      00A1A0 52 04 0F         [ 4] 3074 	call block_erase   
                                   3075 ; this block is clean, next  
      00A1A3 01 CD 99         [ 2] 3076 5$:	ldw x,#BLOCK_SIZE
      00A1A6 C6 A1 02         [ 4] 3077 	call incr_farptr
                                   3078 ; check limit, 24 bit substraction  	
      00A1A9 24 03            [ 1] 3079 	ld a,(LIMIT,sp)
      00A1AB CC 96            [ 2] 3080 	ldw x,(LIMIT+1,sp)
      00A1AD EE A1 03 25      [ 2] 3081 	subw x,farptr+1
      00A1B1 0C 90 F6         [ 1] 3082 	sbc a,farptr 
      00A1B4 93 EE            [ 1] 3083 	jrugt 4$ 
      00A1B6 01 72 A9         [ 4] 3084 9$: call clear_basic
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



      00A1B9 00 03            [ 2] 3085 	ldw x,(LIMIT+1,sp)
      00A1BB 9F 6B 01         [ 2] 3086 	cpw x,#EEPROM_END
      00A1BE 90 F6            [ 1] 3087 	jrne 10$
      00A1C0 93 EE 01         [ 4] 3088 	call func_eefree 
      00279C                       3089 10$:
      00279C                       3090 	_drop VSIZE 
      00A1C3 72 A9            [ 2]    1     addw sp,#VSIZE 
      00A1C5 00               [ 4] 3091 	ret 
                                   3092 	
                                   3093 
                                   3094 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3095 ;  check for application signature 
                                   3096 ; output:
                                   3097 ;   Carry    0 app present 
                                   3098 ;            1 no app installed  
                                   3099 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00279F                       3100 qsign: 
      00A1C6 03 9F 6B         [ 2] 3101 	ldw x,app_sign 
      00A1C9 02 90 F6         [ 2] 3102 	cpw x,SIGNATURE ; "BC" 
      00A1CC 93               [ 4] 3103 	ret 
                                   3104 
                                   3105 ;--------------------------------------
                                   3106 ;  fill write buffer 
                                   3107 ;  input:
                                   3108 ;    y  point to output buffer 
                                   3109 ;    x  point to source 
                                   3110 ;    a  bytes to write in buffer 
                                   3111 ;  output:
                                   3112 ;    y   += A 
                                   3113 ;    X   += A 
                                   3114 ;    A   0 
                                   3115 ;---------------------------------------
      0027A6                       3116 fill_write_buffer:
      00A1CD EE               [ 1] 3117 	push a 
      00A1CE 01               [ 1] 3118 	tnz a 
      00A1CF 72 A9            [ 1] 3119 	jreq 9$ 
      00A1D1 00               [ 1] 3120 1$: ld a,(x)
      00A1D2 03               [ 1] 3121 	incw x 
      00A1D3 F6 14            [ 1] 3122 	ld (y),a 
      00A1D5 02 18            [ 1] 3123 	incw y 
      00A1D7 01 27            [ 1] 3124 	dec (1,sp) 
      00A1D9 F9 5B            [ 1] 3125 	jrne 1$ 
      00A1DB 04               [ 1] 3126 9$:	pop a 
      00A1DC 81               [ 4] 3127     ret 	
                                   3128 
                                   3129 ;--------------------------------------
                                   3130 ;  fill pad buffer with zero 
                                   3131 ;  input:
                                   3132 ;	none 
                                   3133 ;  output:
                                   3134 ;    y     buffer address  
                                   3135 ;--------------------------------------
      00A1DD                       3136 clear_block_buffer:
      00A1DD CD               [ 1] 3137 	push a 
      00A1DE 99 C6 A1 02      [ 2] 3138 	ldw y,#block_buffer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00A1E2 27 03            [ 2] 3139 	pushw y
      00A1E4 CC 96            [ 1] 3140 	ld a,#BLOCK_SIZE   
      00A1E6 EE 7F            [ 1] 3141 1$:	clr (y)
      00A1E7 90 5C            [ 1] 3142 	incw y
      00A1E7 90               [ 1] 3143 	dec a  
      00A1E8 F6 93            [ 1] 3144 	jrne 1$ 	
      00A1EA EE 01            [ 2] 3145 9$: popw y 
      00A1EC 72               [ 1] 3146 	pop a 			
      00A1ED A9               [ 4] 3147 	ret 
                                   3148 
                                   3149 
                                   3150 ;---------------------------------------
                                   3151 ; BASIC: SAVE
                                   3152 ; write application from RAM to FLASH
                                   3153 ;--------------------------------------
                           000001  3154 	XTEMP=1
                           000003  3155 	COUNT=3  ; last count bytes written 
                           000004  3156 	CNT_LO=4 ; count low byte 
                           000005  3157 	TOWRITE=5 ; how bytes left to write  
                           000006  3158 	VSIZE=6 
      0027CA                       3159 save_app:
      00A1EE 00               [ 2] 3160 	pushw x 
      00A1EF 03 9F            [ 2] 3161 	pushw y 
      0027CD                       3162 	_vars VSIZE
      00A1F1 88 90            [ 2]    1     sub sp,#VSIZE 
      00A1F3 F6 93 EE         [ 4] 3163 	call qsign 
      00A1F6 01 72            [ 1] 3164 	jrne 1$
      00A1F8 A9 00 03         [ 2] 3165 	ldw x,#CANT_DO 
      00A1FB 84 FA F7         [ 4] 3166 	call puts 
      00A1FE 81 28 59         [ 2] 3167 	jp 9$
      00A1FF                       3168 1$: 
      00A1FF CD 99 C6         [ 2] 3169 	ldw x,txtbgn
      00A202 A1 02 27         [ 2] 3170 	cpw x,txtend 
      00A205 03 CC            [ 1] 3171 	jrult 2$ 
      00A207 96 EE A3         [ 2] 3172 	ldw x,#NO_APP
      00A209 CD 09 6D         [ 4] 3173 	call puts 
      00A209 90 F6 93         [ 2] 3174 	jp 9$
      0027EE                       3175 2$: 
                                   3176 ; block programming flash
                                   3177 ; must be done from RAM
                                   3178 ; moved in tib  
      00A20C EE 01 72         [ 4] 3179 	call move_prg_to_ram
                                   3180 ; initialize farptr 
                                   3181 ; to app_sign address 
      00A20F A9 00 03 9F      [ 1] 3182 	clr farptr 
      00A213 43 88 90         [ 2] 3183 	ldw x,#app_sign 
      00A216 F6 93 EE         [ 2] 3184 	ldw farptr+1,x
                                   3185 ; initialize local variables 
      00A219 01 72 A9         [ 4] 3186 	call prog_size
      00A21C 00 03            [ 2] 3187 	ldw (TOWRITE,sp),x
      00A21E 84 F4            [ 1] 3188 	clr (COUNT,sp)
                                   3189 ; first bock 
                                   3190 ; containt signature 2 bytes 
                                   3191 ; and size 	2 bytes 
                                   3192 ; use Y as pointer to block_buffer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00A220 F7 81 B6         [ 4] 3193 	call clear_block_buffer ; -- y=*block_buffer	
                                   3194 ; write signature
      00A222 CE 28 5F         [ 2] 3195 	ldw x,SIGNATURE ; "BC" 
      00A222 CD 99            [ 2] 3196 	ldw (y),x 
      00A224 C6 A1 02 27      [ 2] 3197 	addw y,#2
      00A228 03 CC            [ 2] 3198 	ldw x,(TOWRITE,sp)
      00A22A 96 EE            [ 2] 3199 	ldw (y),x
      00A22C 90 F6 93 EE      [ 2] 3200 	addw y,#2   
      00A230 01 72            [ 1] 3201 	ld a,#(BLOCK_SIZE-4)
      00A232 A9 00            [ 1] 3202 	ld (CNT_LO,sp),a 
      00A234 03 9F 88         [ 2] 3203 	cpw x,#(BLOCK_SIZE-4) 
      00A237 90 F6            [ 1] 3204 	jrugt 3$
      00A239 93               [ 1] 3205 	ld a,xl 
      00A23A EE 01            [ 1] 3206 3$:	ld (CNT_LO,sp),a   
      00A23C 72 A9 00         [ 2] 3207 	ldw x,txtbgn 
      00A23F 03 84            [ 2] 3208 	ldw (XTEMP,sp),x 
      002827                       3209 32$: 
      00A241 F8 F7            [ 2] 3210 	ldw x,(XTEMP,sp)
      00A243 81 04            [ 1] 3211 	ld a,(CNT_LO,sp)
      00A244 CD 27 A6         [ 4] 3212 	call fill_write_buffer 
      00A244 CD 99            [ 2] 3213 	ldw (XTEMP,sp),x 
      00A246 C1 A1 02         [ 2] 3214 	ldw x,#block_buffer
      00A249 27 03 CC         [ 4] 3215 	call write_buffer
      00A24C 96 EE 80         [ 2] 3216 	ldw x,#BLOCK_SIZE 
      00A24E CD 08 82         [ 4] 3217 	call incr_farptr  
                                   3218 ; following blocks 
      00A24E 90 F6            [ 2] 3219 	ldw x,(XTEMP,sp)
      00A250 93 EE 01         [ 2] 3220 	cpw x,txtend 
      00A253 72 A9            [ 1] 3221 	jruge 9$ 
      00A255 00 03            [ 2] 3222 	ldw x,(TOWRITE,sp)
      00A257 9F A4 07         [ 2] 3223 	subw x,(COUNT,sp)
      00A25A 88 A6            [ 2] 3224 	ldw (TOWRITE,sp),x 
      00A25C 01 0D            [ 1] 3225 	ld a,#BLOCK_SIZE 
      00A25E 01 27 05         [ 2] 3226 	cpw x,#BLOCK_SIZE 
      00A261 48 0A            [ 1] 3227 	jruge 4$ 
      00A263 01               [ 1] 3228 	ld a,xl 
      00A264 20 F7            [ 1] 3229 4$:	ld (CNT_LO,sp),a 
      00A266 6B 01 90         [ 4] 3230 	call clear_block_buffer 
      00A269 F6 93            [ 2] 3231 	jra 32$ 
      002859                       3232 9$:	_drop VSIZE 
      00A26B EE 01            [ 2]    1     addw sp,#VSIZE 
      00A26D 72 A9            [ 2] 3233     popw y 
      00A26F 00               [ 2] 3234 	popw x 
      00A270 03               [ 4] 3235 	ret 
                                   3236 
                                   3237 
      00A271 84 F4                 3238 SIGNATURE: .ascii "BC"
      00A273 27 02 A6 01 5F 97 4F  3239 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE \F before"
             81 61 73 68 20 61 70
             70 6C 69 63 61 74 69
             6F 6E 2C 20 61 6C 72
             65 61 64 79 20 6F 6E
             65 20 69 6E 20 46 4C
             41 53 48 0A 75 73 65
             20 45 52 41 53 45 20
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



             5C 46 20 62 65 66 6F
             72 65 00
      00A27B 4E 6F 20 61 70 70 6C  3240 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
             20 69 6E 20 52 41 4D
             00
                                   3241 
                                   3242 ;---------------------
                                   3243 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3244 ; write 1 or more byte to FLASH or EEPROM
                                   3245 ; starting at address  
                                   3246 ; input:
                                   3247 ;   expr1  	is address 
                                   3248 ;   expr2,...,exprn   are bytes to write
                                   3249 ; output:
                                   3250 ;   none 
                                   3251 ;---------------------
      0028B9                       3252 write:
      00A27B CD 99 C6         [ 4] 3253 	call expression
      00A27E A1 02            [ 1] 3254 	cp a,#TK_INTGR 
      00A280 27 03            [ 1] 3255 	jreq 0$
      00A282 CC 96 EE         [ 2] 3256 	jp syntax_error
      00A285                       3257 0$: _xpop 
      00A285 90 F6            [ 1]    1     ld a,(y)
      00A287 93               [ 1]    2     ldw x,y 
      00A288 EE 01            [ 2]    3     ldw x,(1,x)
      00A28A 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A28E 9F 88 90         [ 1] 3258 	ld farptr,a 
      00A291 F6 93 EE         [ 2] 3259 	ldw ptr16,x 
      0028D2                       3260 1$:	
      00A294 01 72 A9         [ 4] 3261 	call next_token 
      00A297 00 03            [ 1] 3262 	cp a,#TK_COMMA 
      00A299 84 F7            [ 1] 3263 	jreq 2$ 
      00A29B 81 20            [ 2] 3264 	jra 9$ ; no more data 
      00A29C CD 1A 71         [ 4] 3265 2$:	call expression
      00A29C CD 99            [ 1] 3266 	cp a,#TK_INTGR
      00A29E C1 A1            [ 1] 3267 	jreq 3$
      00A2A0 01 27 03         [ 2] 3268 	jp syntax_error
      0028E5                       3269 3$:	_xpop 
      00A2A3 CC 96            [ 1]    1     ld a,(y)
      00A2A5 EE               [ 1]    2     ldw x,y 
      00A2A6 90 F6            [ 2]    3     ldw x,(1,x)
      00A2A8 93 EE 01 72      [ 2]    4     addw y,#CELL_SIZE 
      00A2AC A9               [ 1] 3270 	ld a,xl 
      00A2AD 00               [ 1] 3271 	clrw x 
      00A2AE 03 C7 00         [ 4] 3272 	call write_byte
      00A2B1 19 CF 00         [ 2] 3273 	ldw x,#1 
      00A2B4 1A 92 BC         [ 4] 3274 	call incr_farptr 
      00A2B7 00 19            [ 2] 3275 	jra 1$ 
      0028FB                       3276 9$:
      00A2B9 5F               [ 4] 3277 	ret 
                                   3278 
                                   3279 
                                   3280 ;---------------------
                                   3281 ;BASIC: CHAR(expr)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



                                   3282 ; évaluate expression 
                                   3283 ; and take the 7 least 
                                   3284 ; bits as ASCII character
                                   3285 ; output: 
                                   3286 ; 	A char 
                                   3287 ;---------------------
      0028FC                       3288 char:
      00A2BA 97 4F 81         [ 4] 3289 	call func_args 
      00A2BD A1 01            [ 1] 3290 	cp a,#1
      00A2BD CD 9C            [ 1] 3291 	jreq 1$
      00A2BF 0A 90 F6         [ 2] 3292 	jp syntax_error
      002906                       3293 1$:	_xpop
      00A2C2 93 EE            [ 1]    1     ld a,(y)
      00A2C4 01               [ 1]    2     ldw x,y 
      00A2C5 72 A9            [ 2]    3     ldw x,(1,x)
      00A2C7 00 03 4D 26      [ 2]    4     addw y,#CELL_SIZE 
      00A2CB 0D               [ 1] 3294 	ld a,xl
      00A2CC 5D 26            [ 1] 3295 	and a,#0x7f 
      00A2CE 0A               [ 4] 3296 	ret
                                   3297 
                                   3298 ;---------------------
                                   3299 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3300 ; extract first character 
                                   3301 ; of string argument 
                                   3302 ; output:
                                   3303 ;    A:X    int24 
                                   3304 ;---------------------
      002913                       3305 ascii:
      00A2CF 55 00            [ 1] 3306 	ld a,#TK_LPAREN
      00A2D1 04 00 02         [ 4] 3307 	call expect 
      00A2D4 5B 02 CC         [ 4] 3308 	call next_token 
      00A2D7 97 A1            [ 1] 3309 	cp a,#TK_QSTR 
      00A2D9 81 0E            [ 1] 3310 	jreq 1$
      00A2DA A1 04            [ 1] 3311 	cp a,#TK_CHAR 
      00A2DA 85 52            [ 1] 3312 	jreq 2$ 
      00A2DC 0D 89            [ 1] 3313 	cp a,#TK_CFUNC 
      00A2DE A6 85            [ 1] 3314 	jreq 0$
      00A2E0 CD 99 B4         [ 2] 3315 	jp syntax_error
      00292A                       3316 0$: ; cfunc 
      00A2E3 CD               [ 4] 3317 	call (x)
      00A2E4 98 24            [ 2] 3318 	jra 3$
      00292D                       3319 1$: ; quoted string 
      00A2E6 1F               [ 1] 3320 	ld a,(x)
      00A2E7 09               [ 1] 3321 	push a  
      00A2E8 CD 9C F2         [ 4] 3322 	call skip_string
      00A2EB 72               [ 1] 3323 	pop a  	
      00A2EC 14 00            [ 2] 3324 	jra 3$ 
      002935                       3325 2$: ; character 
      00A2EE 23 CD 97         [ 4] 3326 	call get_char 
      00A2F1 EF               [ 1] 3327 3$:	clrw x 
      00A2F2 A1               [ 1] 3328 	rlwa x   
      00293A                       3329 4$:	_xpush  
      00A2F3 80 27 03 CC      [ 2]    1     subw y,#CELL_SIZE
      00A2F7 96 EE            [ 1]    2     ld (y),a 
      00A2F9 90 EF 01         [ 2]    3     ldw (1,y),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



      00A2F9 CD 98            [ 1] 3330 	ld a,#TK_RPAREN 
      00A2FB 08 A3 A3         [ 4] 3331 	call expect
      002948                       3332 9$:	
      002948                       3333 	_xpop  
      00A2FE 04 27            [ 1]    1     ld a,(y)
      00A300 03               [ 1]    2     ldw x,y 
      00A301 CC 96            [ 2]    3     ldw x,(1,x)
      00A303 EE A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A304 81               [ 4] 3334 	ret 
                                   3335 
                                   3336 ;---------------------
                                   3337 ;BASIC: KEY
                                   3338 ; wait for a character 
                                   3339 ; received from STDIN 
                                   3340 ; input:
                                   3341 ;	none 
                                   3342 ; output:
                                   3343 ;	a	 character 
                                   3344 ;---------------------
      002952                       3345 key:
      00A304 72 04 00         [ 4] 3346 	call getc 
      00A307 23               [ 4] 3347 	ret
                                   3348 
                                   3349 ;----------------------
                                   3350 ; BASIC: QKEY
                                   3351 ; Return true if there 
                                   3352 ; is a character in 
                                   3353 ; waiting in STDIN 
                                   3354 ; input:
                                   3355 ;  none 
                                   3356 ; output:
                                   3357 ;   A     0|-1
                                   3358 ;-----------------------
      002956                       3359 qkey:: 
      00A308 03               [ 1] 3360 	clrw x 
      00A309 CC 96 EE         [ 1] 3361 	ld a,rx1_head
      00A30C CD 9A F1         [ 1] 3362 	sub a,rx1_tail 
      00A30F A1 84            [ 1] 3363 	jreq 9$ 
      00A311 27               [ 2] 3364 	cplw x
      00A312 03 CC            [ 1] 3365 	ld a,#255    
      002962                       3366 9$: 
      00A314 96               [ 4] 3367 	ret 
                                   3368 
                                   3369 ;---------------------
                                   3370 ; BASIC: GPIO(port,reg)
                                   3371 ; return gpio register address 
                                   3372 ; expr {PORTA..PORTI}
                                   3373 ; input:
                                   3374 ;   none 
                                   3375 ; output:
                                   3376 ;   A:X 	gpio register address
                                   3377 ;----------------------------
                                   3378 ;	N=PORT
                                   3379 ;	T=REG 
      002963                       3380 gpio:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



      00A315 EE 90 F6         [ 4] 3381 	call func_args 
      00A318 93 EE            [ 1] 3382 	cp a,#2
      00A31A 01 72            [ 1] 3383 	jreq 1$
      00A31C A9 00 03         [ 2] 3384 	jp syntax_error  
      00296D                       3385 1$:	_at_next 
      00A31F 6B 06 1F         [ 1]    1     ld a,(3,y)
      00A322 07               [ 1]    2     ldw x,y 
      00A323 CD 97            [ 2]    3     ldw x,(4,x)
      00A325 EF A1 00         [ 2] 3386 	cpw x,#PA_BASE 
      00A328 27 11            [ 1] 3387 	jrmi bad_port
      00A32A A1 80 26         [ 2] 3388 	cpw x,#PI_BASE+1 
      00A32D 08 CD            [ 1] 3389 	jrpl bad_port
      00A32F 98               [ 2] 3390 	pushw x 
      00297E                       3391 	_xpop
      00A330 08 A3            [ 1]    1     ld a,(y)
      00A332 A3               [ 1]    2     ldw x,y 
      00A333 44 27            [ 2]    3     ldw x,(1,x)
      00A335 0E A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A336 72 FB 01         [ 2] 3392 	addw x,(1,sp)
      00298A                       3393 	_drop 2 
      00A336 55 00            [ 2]    1     addw sp,#2 
      00A338 03               [ 1] 3394 	clr a 
      00A339 00               [ 4] 3395 	ret
      00298E                       3396 bad_port:
      00A33A 02 0A            [ 1] 3397 	ld a,#ERR_BAD_VALUE
      00A33B CC 16 70         [ 2] 3398 	jp tb_error
                                   3399 
                                   3400 
                                   3401 ;-------------------------
                                   3402 ; BASIC: UFLASH 
                                   3403 ; return free flash address
                                   3404 ; input:
                                   3405 ;  none 
                                   3406 ; output:
                                   3407 ;	A		TK_INTGR
                                   3408 ;   xstack	free address 
                                   3409 ;---------------------------
      002993                       3410 uflash:
      00A33B 0F 03 AE         [ 4] 3411 	call qsign 
      00A33E 00 01            [ 1] 3412 	jrne 1$
      00A340 1F 04 20         [ 2] 3413 	ldw x,#app_space 
      00A343 2F BB 35 82      [ 2] 3414 	addw x,app_size 
      00A344 1C 00 04         [ 2] 3415 	addw x,#4
                                   3416 ; align on 128 bytes block 
      00A344 72 04 00         [ 2] 3417 	addw x,#BLOCK_SIZE 
      00A347 23               [ 1] 3418 	ld a,xl 
      00A348 03 CC            [ 1] 3419 	and a,#0x80 
      00A34A 96               [ 1] 3420 	ld xl,a 
      00A34B EE CD            [ 2] 3421 	jra 2$
      00A34D 9A F1 A1         [ 2] 3422 1$:	ldw x,#app_space 
      0029AE                       3423 2$:
      00A350 84               [ 1] 3424 	clr a 
      00A351 27               [ 4] 3425 	ret 
                                   3426 
                                   3427 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



                                   3428 ;---------------------
                                   3429 ; BASIC: USR(addr,arg)
                                   3430 ; execute a function written 
                                   3431 ; in binary code.
                                   3432 ; input:
                                   3433 ;   addr	routine address 
                                   3434 ;   arg 	is an argument
                                   3435 ;           it can be ignore 
                                   3436 ;           by cally. 
                                   3437 ; output:
                                   3438 ;   xstack 	value returned by cally  
                                   3439 ;---------------------
      0029B0                       3440 usr:
      00A352 03 CC 96         [ 4] 3441 	call func_args 
      00A355 EE 02            [ 1] 3442 	cp a,#2
      00A356 27 03            [ 1] 3443 	jreq 1$  
      00A356 90 F6 93         [ 2] 3444 	jp syntax_error 
      0029BA                       3445 1$: 
      0029BA                       3446 	_at_next ; A:X addr 
      00A359 EE 01 72         [ 1]    1     ld a,(3,y)
      00A35C A9               [ 1]    2     ldw x,y 
      00A35D 00 03            [ 2]    3     ldw x,(4,x)
      00A35F 6B 03 1F         [ 2] 3447 	ldw ptr16,X 
      0029C3                       3448 	_xpop  ; arg 
      00A362 04 4D            [ 1]    1     ld a,(y)
      00A364 2A               [ 1]    2     ldw x,y 
      00A365 0D 7B            [ 2]    3     ldw x,(1,x)
      00A367 06 1E 07 1D      [ 2]    4     addw y,#CELL_SIZE 
      0029CC                       3449 	_store_top ; overwrite addr 
      00A36B 00 01            [ 1]    1     ld (y),a 
      00A36D A2 00 6B         [ 2]    2     ldw (1,y),x     
      00A370 06 1F 07 19      [ 6] 3450     call [ptr16]
      00A373 81               [ 4] 3451 	ret 
                                   3452 
                                   3453 
                                   3454 ;------------------------------
                                   3455 ; BASIC: BYE 
                                   3456 ; halt mcu in its lowest power mode 
                                   3457 ; wait for reset or external interrupt
                                   3458 ; do a cold start on wakeup.
                                   3459 ;------------------------------
      0029D6                       3460 bye:
      00A373 CE 00 05 1F 0D   [ 2] 3461 	btjf UART1_SR,#UART_SR_TC,.
      00A378 CE               [10] 3462 	halt
      00A379 00 01 1F         [ 2] 3463 	jp cold_start  
                                   3464 
                                   3465 ;----------------------------------
                                   3466 ; BASIC: SLEEP 
                                   3467 ; halt mcu until reset or external
                                   3468 ; interrupt.
                                   3469 ; Resume progam after SLEEP command
                                   3470 ;----------------------------------
      0029DF                       3471 sleep:
      00A37C 0B 72 15 00 23   [ 2] 3472 	btjf UART1_SR,#UART_SR_TC,.
      00A381 72 5C 00 20      [ 1] 3473 	bset flags,#FSLEEP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



      00A385 81               [10] 3474 	halt 
      00A386 81               [ 4] 3475 	ret 
                                   3476 
                                   3477 ;-------------------------------
                                   3478 ; BASIC: PAUSE expr 
                                   3479 ; suspend execution for n msec.
                                   3480 ; input:
                                   3481 ;	none
                                   3482 ; output:
                                   3483 ;	none 
                                   3484 ;------------------------------
      0029EA                       3485 pause:
      00A386 72 5D 00         [ 4] 3486 	call expression
      00A389 20 26            [ 1] 3487 	cp a,#TK_INTGR
      00A38B 03 CC            [ 1] 3488 	jreq 1$ 
      00A38D 96 EE 6E         [ 2] 3489 	jp syntax_error
      00A38F                       3490 1$: _xpop 
      00A38F A6 85            [ 1]    1     ld a,(y)
      00A391 CD               [ 1]    2     ldw x,y 
      00A392 99 B4            [ 2]    3     ldw x,(1,x)
      00A394 CD 98 24 13      [ 2]    4     addw y,#CELL_SIZE 
      0029FD                       3491 pause02:
      00A398 09 27 03         [ 2] 3492 	ldw timer,x 
      00A39B CC 96 EE         [ 2] 3493 1$: ldw x,timer 
      00A39E 5D               [ 2] 3494 	tnzw x 
      00A39E CF 00            [ 1] 3495 	jreq 2$
      00A3A0 1A               [10] 3496 	wfi 
      00A3A1 F6 EE            [ 1] 3497 	jrne 1$
      002A09                       3498 2$:	
      00A3A3 01               [ 4] 3499 	ret 
                                   3500 
                                   3501 ;------------------------------
                                   3502 ; BASIC: AWU expr
                                   3503 ; halt mcu for 'expr' milliseconds
                                   3504 ; use Auto wakeup peripheral
                                   3505 ; all oscillators stopped except LSI
                                   3506 ; range: 1ms - 511ms
                                   3507 ; input:
                                   3508 ;  none
                                   3509 ; output:
                                   3510 ;  none:
                                   3511 ;------------------------------
      002A0A                       3512 awu:
      00A3A4 72 FB 04         [ 4] 3513   call expression
      00A3A7 19 03            [ 1] 3514   cp a,#TK_INTGR
      00A3A9 72 C7            [ 1] 3515   jreq 1$
      00A3AB 00 1A 72         [ 2] 3516   jp syntax_error
      002A14                       3517 1$: _xpop 
      00A3AE 5C 00            [ 1]    1     ld a,(y)
      00A3B0 1B               [ 1]    2     ldw x,y 
      00A3B1 72 CF            [ 2]    3     ldw x,(1,x)
      00A3B3 00 1A C7 00      [ 2]    4     addw y,#CELL_SIZE 
      002A1D                       3518 awu02:
      00A3B7 0D CF 00         [ 2] 3519   cpw x,#5120
      00A3BA 0E 7B            [ 1] 3520   jrmi 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



      00A3BC 06 1E 07 72      [ 1] 3521   mov AWU_TBR,#15 
      00A3C0 B0 00            [ 1] 3522   ld a,#30
      00A3C2 0E               [ 2] 3523   div x,a
      00A3C3 C2 00            [ 1] 3524   ld a,#16
      00A3C5 0D               [ 2] 3525   div x,a 
      00A3C6 18 03            [ 2] 3526   jra 4$
      002A2E                       3527 1$: 
      00A3C8 A8 80 2B         [ 2] 3528   cpw x,#2048
      00A3CB 12 20            [ 1] 3529   jrmi 2$ 
      00A3CD 25 7B 03 2A      [ 1] 3530   mov AWU_TBR,#14
      00A3D1 07 C6            [ 1] 3531   ld a,#80
      00A3D3 00               [ 2] 3532   div x,a 
      00A3D4 0F 2F            [ 2] 3533   jra 4$   
      002A3C                       3534 2$:
      00A3D6 07 20 1A F2      [ 1] 3535   mov AWU_TBR,#7
      00A3D9                       3536 3$:  
                                   3537 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A3D9 72 0E 00         [ 2] 3538   cpw x,#64 
      00A3DC 0F 15            [ 2] 3539   jrule 4$ 
      00A3DE 72 5C 50 F2      [ 1] 3540   inc AWU_TBR 
      00A3DE 1E               [ 2] 3541   srlw x 
      00A3DF 0D CF            [ 2] 3542   jra 3$ 
      002A4C                       3543 4$:
      00A3E1 00               [ 1] 3544   ld a, xl
      00A3E2 05               [ 1] 3545   dec a 
      00A3E3 72 01            [ 1] 3546   jreq 5$
      00A3E5 00               [ 1] 3547   dec a 	
      002A51                       3548 5$: 
      00A3E6 23 05            [ 1] 3549   and a,#0x3e 
      00A3E8 E6 02 C7         [ 1] 3550   ld AWU_APR,a 
      00A3EB 00 04 1E 0B      [ 1] 3551   bset AWU_CSR,#AWU_CSR_AWUEN
      00A3EF CF               [10] 3552   halt 
                                   3553 
      00A3F0 00               [ 4] 3554   ret 
                                   3555 
                                   3556 ;------------------------------
                                   3557 ; BASIC: TICKS
                                   3558 ; return msec ticks counter value 
                                   3559 ; input:
                                   3560 ; 	none 
                                   3561 ; output:
                                   3562 ;	X 		TK_INTGR
                                   3563 ;-------------------------------
      002A5C                       3564 get_ticks:
      00A3F1 01 81 0F         [ 1] 3565 	ld a,ticks 
      00A3F3 CE 00 10         [ 2] 3566 	ldw x,ticks+1 
      00A3F3 85               [ 4] 3567 	ret 
                                   3568 
                                   3569 ;------------------------------
                                   3570 ; BASIC: ABS(expr)
                                   3571 ; return absolute value of expr.
                                   3572 ; input:
                                   3573 ;   none
                                   3574 ; output:
                                   3575 ;   xstack    positive int24 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



                                   3576 ;-------------------------------
      002A63                       3577 abs:
      00A3F4 5B 0D 72         [ 4] 3578 	call func_args 
      00A3F7 5A 00            [ 1] 3579 	cp a,#1 
      00A3F9 20 FC            [ 1] 3580 	jreq 0$ 
      00A3FB CC 16 6E         [ 2] 3581 	jp syntax_error
      002A6D                       3582 0$:  
      00A3FB CD 97 EF         [ 4] 3583 	call abs24 
      002A70                       3584 	_xpop 
      00A3FE A1 84            [ 1]    1     ld a,(y)
      00A400 27               [ 1]    2     ldw x,y 
      00A401 07 A1            [ 2]    3     ldw x,(1,x)
      00A403 03 27 26 CC      [ 2]    4     addw y,#CELL_SIZE 
      00A407 96               [ 4] 3585 	ret 
                                   3586 
                                   3587 ;------------------------------
                                   3588 ; BASIC: LSHIFT(expr1,expr2)
                                   3589 ; logical shift left expr1 by 
                                   3590 ; expr2 bits 
                                   3591 ; output:
                                   3592 ; 	A 		TK_INTGR
                                   3593 ;   X 		result 
                                   3594 ;------------------------------
      002A7A                       3595 lshift:
      00A408 EE 19 41         [ 4] 3596 	call func_args
      00A409 A1 02            [ 1] 3597 	cp a,#2 
      00A409 90 89            [ 1] 3598 	jreq 1$
      00A40B CD 98 2E         [ 2] 3599 	jp syntax_error
      002A84                       3600 1$: _xpop 
      00A40E 4F 90            [ 1]    1     ld a,(y)
      00A410 CE               [ 1]    2     ldw x,y 
      00A411 00 05            [ 2]    3     ldw x,(1,x)
      00A413 90 FE 90 89      [ 2]    4     addw y,#CELL_SIZE 
      00A417 13 01            [ 1] 3601     ldw y,x    
      002A8F                       3602 	_at_top  ; T@ 
      00A419 5B 02            [ 1]    1     ld a,(y)
      00A41B 25               [ 1]    2     ldw x,y 
      00A41C 01 4C            [ 2]    3     ldw x,(1,x)
      00A41E 90 5D            [ 2] 3603 	tnzw y 
      00A41E CD 8C            [ 1] 3604 	jreq 4$
      00A420 CA               [ 1] 3605 2$:	rcf 
      00A421 5D               [ 2] 3606 	rlcw x 
      00A422 26               [ 1] 3607 	rlc a 
      00A423 05 A6            [ 2] 3608 	decw y 
      00A425 05 CC            [ 1] 3609 	jrne 2$
      002A9F                       3610 4$: _store_top  ; T! 
      00A427 96 F0            [ 1]    1     ld (y),a 
      00A429 90 85 81         [ 2]    2     ldw (1,y),x     
      00A42C A6 84            [ 1] 3611 	ld a,#TK_INTGR
      00A42C 90               [ 4] 3612 	ret
                                   3613 
                                   3614 ;------------------------------
                                   3615 ; BASIC: RSHIFT(expr1,expr2)
                                   3616 ; logical shift right expr1 by 
                                   3617 ; expr2 bits.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



                                   3618 ; output:
                                   3619 ; 	A 		TK_INTGR
                                   3620 ;   X 		result 
                                   3621 ;------------------------------
      002AA7                       3622 rshift:
      00A42D 89 89 72         [ 4] 3623 	call func_args
      00A430 5F 00            [ 1] 3624 	cp a,#2 
      00A432 0E 90            [ 1] 3625 	jreq 1$
      00A434 CE 00 1C         [ 2] 3626 	jp syntax_error
      002AB1                       3627 1$: _xpop 
      00A437 90 E6            [ 1]    1     ld a,(y)
      00A439 03               [ 1]    2     ldw x,y 
      00A43A A1 03            [ 2]    3     ldw x,(1,x)
      00A43C 27 15 90 E6      [ 2]    4     addw y,#CELL_SIZE 
      00A440 02 C7            [ 1] 3628     ldw y,x   
      002ABC                       3629 	_at_top  ; T@  
      00A442 00 0F            [ 1]    1     ld a,(y)
      00A444 72               [ 1]    2     ldw x,y 
      00A445 B9 00            [ 2]    3     ldw x,(1,x)
      00A447 0E 90            [ 2] 3630 	tnzw y 
      00A449 C3 00            [ 1] 3631 	jreq 4$
      00A44B 1E               [ 1] 3632 2$:	rcf 
      00A44C 25               [ 2] 3633 	rrcw x
      00A44D E9               [ 1] 3634 	rrc a  
      00A44E A6 0A            [ 2] 3635 	decw y 
      00A450 CC 96            [ 1] 3636 	jrne 2$
      002ACC                       3637 4$: _store_top  ; T! 
      00A452 F0 F7            [ 1]    1     ld (y),a 
      00A453 90 EF 01         [ 2]    2     ldw (1,y),x     
      00A453 90 89            [ 1] 3638 	ld a,#TK_INTGR
      00A455 72               [ 4] 3639 	ret
                                   3640 
                                   3641 ;--------------------------
                                   3642 ; BASIC: FCPU integer
                                   3643 ; set CPU frequency 
                                   3644 ;-------------------------- 
                                   3645 
      002AD4                       3646 fcpu:
      00A456 A9 00            [ 1] 3647 	ld a,#TK_INTGR
      00A458 04 1E 03         [ 4] 3648 	call expect 
      00A45B CD 94 3D         [ 4] 3649 	call get_int24 
      00A45E 26               [ 1] 3650 	ld a,xl 
      00A45F 04 90            [ 1] 3651 	and a,#7 
      00A461 85 20 DA         [ 1] 3652 	ld CLK_CKDIVR,a 
      00A464 81               [ 4] 3653 	ret 
                                   3654 
                                   3655 ;------------------------------
                                   3656 ; BASIC: PMODE pin#, mode 
                                   3657 ; Arduino pin. 
                                   3658 ; define pin as input or output
                                   3659 ; pin#: {0..15}
                                   3660 ; mode: INPUT|OUTPUT  
                                   3661 ;------------------------------
                           000001  3662 	PINNO=1
                           000001  3663 	VSIZE=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



      002AE3                       3664 pin_mode:
      002AE3                       3665 	_vars VSIZE 
      00A464 85 5B            [ 2]    1     sub sp,#VSIZE 
      00A466 02 90 85         [ 4] 3666 	call arg_list 
      00A469 81 02            [ 1] 3667 	cp a,#2 
      00A46A 27 03            [ 1] 3668 	jreq 1$
      00A46A 72 00 00         [ 2] 3669 	jp syntax_error 
      002AEF                       3670 1$: _xpop 
      00A46D 23 05            [ 1]    1     ld a,(y)
      00A46F A6               [ 1]    2     ldw x,y 
      00A470 06 CC            [ 2]    3     ldw x,(1,x)
      00A472 96 F0 CD 9A      [ 2]    4     addw y,#CELL_SIZE 
      00A476 F1 A1 84         [ 2] 3671 	ldw ptr16,x ; mode 
      002AFB                       3672 	_xpop ; Dx pin 
      00A479 27 03            [ 1]    1     ld a,(y)
      00A47B CC               [ 1]    2     ldw x,y 
      00A47C 96 EE            [ 2]    3     ldw x,(1,x)
      00A47E 90 F6 93 EE      [ 2]    4     addw y,#CELL_SIZE 
      00A482 01 72 A9         [ 4] 3673 	call select_pin 
      00A485 00 03            [ 1] 3674 	ld (PINNO,sp),a  
      00A487 9F 27            [ 1] 3675 	ld a,#1 
      00A489 62 88            [ 1] 3676 	tnz (PINNO,sp)
      00A48B CD 97            [ 1] 3677 	jreq 4$
      00A48D EF               [ 1] 3678 2$:	sll a 
      00A48E A1 80            [ 1] 3679 	dec (PINNO,sp)
      00A490 27 03            [ 1] 3680 	jrne 2$ 
      00A492 CC 96            [ 1] 3681 	ld (PINNO,sp),a
      00A494 EE CD            [ 1] 3682 	ld a,(PINNO,sp)
      00A496 98 08            [ 1] 3683 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A498 A3 A4            [ 1] 3684 	ld (GPIO_CR1,x),a 
      00A49A F6 27            [ 1] 3685 4$:	ld a,#OUTP
      00A49C 08 A3 A5         [ 1] 3686 	cp a,acc8 
      00A49F 10 27            [ 1] 3687 	jreq 6$
                                   3688 ; input mode
                                   3689 ; disable external interrupt 
      00A4A1 03 CC            [ 1] 3690 	ld a,(PINNO,sp)
      00A4A3 96               [ 1] 3691 	cpl a 
      00A4A4 EE 04            [ 1] 3692 	and a,(GPIO_CR2,x)
      00A4A5 E7 04            [ 1] 3693 	ld (GPIO_CR2,x),a 
                                   3694 ;clear bit in DDR for input mode 
      00A4A5 84 89            [ 1] 3695 	ld a,(PINNO,sp)
      00A4A7 88               [ 1] 3696 	cpl a 
      00A4A8 E4 02            [ 1] 3697 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A4A8 0A 01            [ 1] 3698 	ld (GPIO_DDR,x),a 
      00A4AA 27 26            [ 2] 3699 	jra 9$
      002B33                       3700 6$: ;output mode  
      00A4AC CD 97            [ 1] 3701 	ld a,(PINNO,sp)
      00A4AE EF A1            [ 1] 3702 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A4B0 84 27            [ 1] 3703 	ld (GPIO_DDR,x),a 
      00A4B2 07 A1            [ 1] 3704 	ld a,(PINNO,sp)
      00A4B4 03 27            [ 1] 3705 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A4B6 0D CC            [ 1] 3706 	ld (GPIO_CR2,x),a 
      002B3F                       3707 9$:	
      002B3F                       3708 	_drop VSIZE 
      00A4B8 96 EE            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



      00A4BA 81               [ 4] 3709 	ret
                                   3710 
                                   3711 ;------------------------
                                   3712 ; select Arduino pin 
                                   3713 ; input:
                                   3714 ;   X 	 {0..15} Arduino Dx 
                                   3715 ; output:
                                   3716 ;   A     stm8s208 pin 
                                   3717 ;   X     base address s208 GPIO port 
                                   3718 ;---------------------------
      002B42                       3719 select_pin:
      00A4BA C6               [ 2] 3720 	sllw x 
      00A4BB 00 02 AB         [ 2] 3721 	addw x,#arduino_to_8s208 
      00A4BE 03               [ 2] 3722 	ldw x,(x)
      00A4BF C7               [ 1] 3723 	ld a,xl 
      00A4C0 00               [ 1] 3724 	push a 
      00A4C1 02               [ 1] 3725 	swapw x 
      00A4C2 20 03            [ 1] 3726 	ld a,#5 
      00A4C4 CD               [ 4] 3727 	mul x,a 
      00A4C5 98 15 00         [ 2] 3728 	addw x,#GPIO_BASE 
      00A4C7 84               [ 1] 3729 	pop a 
      00A4C7 CD               [ 4] 3730 	ret 
                                   3731 ; translation from Arduino D0..D15 to stm8s208rb 
      002B52                       3732 arduino_to_8s208:
      00A4C8 97 EF                 3733 .byte 3,6 ; D0 
      00A4CA A1 08                 3734 .byte 3,5 ; D1 
      00A4CC 27 DA                 3735 .byte 4,0 ; D2 
      00A4CE 5B 03                 3736 .byte 2,1 ; D3
      00A4D0 20 1A                 3737 .byte 6,0 ; D4
      00A4D2 02 02                 3738 .byte 2,2 ; D5
      00A4D2 5B 01                 3739 .byte 2,3 ; D6
      00A4D4 CD A3                 3740 .byte 3,1 ; D7
      00A4D6 FB CF                 3741 .byte 3,3 ; D8
      00A4D8 00 1A                 3742 .byte 2,4 ; D9
      00A4DA 55 00                 3743 .byte 4,5 ; D10
      00A4DC 04 00                 3744 .byte 2,6 ; D11
      00A4DE 02 85                 3745 .byte 2,7 ; D12
      00A4E0 A3 A4                 3746 .byte 2,5 ; D13
      00A4E2 F6 26                 3747 .byte 4,2 ; D14
      00A4E4 05 CE                 3748 .byte 4,1 ; D15
                                   3749 
                                   3750 
                                   3751 ;------------------------------
                                   3752 ; BASIC: RND(expr)
                                   3753 ; return random number 
                                   3754 ; between 1 and expr inclusive
                                   3755 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   3756 ; input:
                                   3757 ; 	none 
                                   3758 ; output:
                                   3759 ;	xstack 	random positive integer 
                                   3760 ;------------------------------
      002B72                       3761 random:
      00A4E6 00 1A 20         [ 4] 3762 	call func_args 
      00A4E9 19 01            [ 1] 3763 	cp a,#1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



      00A4EA 27 03            [ 1] 3764 	jreq 1$
      00A4EA 20 35 6E         [ 2] 3765 	jp syntax_error
      00A4EC                       3766 1$:  
      002B7C                       3767 	_xpop   
      00A4EC 55 00            [ 1]    1     ld a,(y)
      00A4EE 04               [ 1]    2     ldw x,y 
      00A4EF 00 02            [ 2]    3     ldw x,(1,x)
      00A4F1 5B 02 CC 97      [ 2]    4     addw y,#CELL_SIZE 
      00A4F5 A1               [ 2] 3768 	pushw x 
      00A4F6 88               [ 1] 3769 	push a  
      00A4F6 72 00            [ 1] 3770 	ld a,#0x80 
      00A4F8 00 23            [ 1] 3771 	bcp a,(1,sp)
      00A4FA 05 A6            [ 1] 3772 	jreq 2$
      00A4FC 06 CC            [ 1] 3773 	ld a,#ERR_BAD_VALUE
      00A4FE 96 F0 70         [ 2] 3774 	jp tb_error
      00A500                       3775 2$: 
                                   3776 ; acc16=(x<<5)^x 
      00A500 CD A3 FB         [ 2] 3777 	ldw x,seedx 
      00A503 58               [ 2] 3778 	sllw x 
      00A503 CF               [ 2] 3779 	sllw x 
      00A504 00               [ 2] 3780 	sllw x 
      00A505 05               [ 2] 3781 	sllw x 
      00A506 E6               [ 2] 3782 	sllw x 
      00A507 02               [ 1] 3783 	ld a,xh 
      00A508 C7 00 04         [ 1] 3784 	xor a,seedx 
      00A50B 35 03 00         [ 1] 3785 	ld acc16,a 
      00A50E 02               [ 1] 3786 	ld a,xl 
      00A50F 81 00 15         [ 1] 3787 	xor a,seedx+1 
      00A510 C7 00 0E         [ 1] 3788 	ld acc8,a 
                                   3789 ; seedx=seedy 
      00A510 72 00 00         [ 2] 3790 	ldw x,seedy 
      00A513 23 06 A6         [ 2] 3791 	ldw seedx,x  
                                   3792 ; seedy=seedy^(seedy>>1)
      00A516 06 CC 96         [ 2] 3793 	ldw x,seedy 
      00A519 F0               [ 2] 3794 	srlw x 
      00A51A 81               [ 1] 3795 	ld a,xh 
      00A51B C8 00 16         [ 1] 3796 	xor a,seedy 
      00A51B CD A3 FB         [ 1] 3797 	ld seedy,a  
      00A51E CF               [ 1] 3798 	ld a,xl 
      00A51F 00 1A 17         [ 1] 3799 	xor a,seedy+1 
      00A521 C7 00 17         [ 1] 3800 	ld seedy+1,a 
                                   3801 ; acc16>>3 
      00A521 85 52 04         [ 2] 3802 	ldw x,acc16 
      00A524 89               [ 2] 3803 	srlw x 
      00A525 CE               [ 2] 3804 	srlw x 
      00A526 00               [ 2] 3805 	srlw x 
                                   3806 ; x=acc16^x 
      00A527 1A               [ 1] 3807 	ld a,xh 
      00A528 89 CE 00         [ 1] 3808 	xor a,acc16 
      00A52B 05 1F 05         [ 1] 3809 	ld acc16,a 
      00A52E CE               [ 1] 3810 	ld a,xl 
      00A52F 00 01 1F         [ 1] 3811 	xor a,acc8 
      00A532 07 85 20         [ 1] 3812 	ld acc8,a 
                                   3813 ; seedy=acc16^seedy 
      00A535 CD 00 17         [ 1] 3814 	xor a,seedy+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



      00A536 97               [ 1] 3815 	ld xl,a 
      00A536 72 00 00         [ 1] 3816 	ld a,acc16 
      00A539 23 05 A6         [ 1] 3817 	xor a,seedy
      00A53C 06               [ 1] 3818 	ld xh,a 
      00A53D CC 96 F0         [ 2] 3819 	ldw seedy,x 
                                   3820 ; return seedx_lo&0x7f:seedy modulo expr + 1 
      00A540 C6 00 15         [ 1] 3821 	ld a,seedx+1
      00A540 1E 03            [ 1] 3822 	and a,#127
      002BE7                       3823 	_xpush 
      00A542 CF 00 05 E6      [ 2]    1     subw y,#CELL_SIZE
      00A546 02 C7            [ 1]    2     ld (y),a 
      00A548 00 04 1E         [ 2]    3     ldw (1,y),x 
      00A54B 05               [ 1] 3824 	pop a 
      00A54C CF               [ 2] 3825 	popw x 
      002BF2                       3826 	_xpush 
      00A54D 00 01 85 5B      [ 2]    1     subw y,#CELL_SIZE
      00A551 04 89            [ 1]    2     ld (y),a 
      00A553 81 EF 01         [ 2]    3     ldw (1,y),x 
      00A554 CD 03 A1         [ 4] 3827 	call mod24 
      002BFE                       3828 	_xpop
      00A554 72 01            [ 1]    1     ld a,(y)
      00A556 00               [ 1]    2     ldw x,y 
      00A557 23 02            [ 2]    3     ldw x,(1,x)
      00A559 4F 81 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A55B 1C 00 01         [ 2] 3829 	addw x,#1 
      00A55B 72 09            [ 1] 3830 	adc a,#0  
      00A55D 00               [ 4] 3831 	ret 
                                   3832 
                                   3833 ;---------------------------------
                                   3834 ; BASIC: WORDS 
                                   3835 ; affiche la listes des mots du
                                   3836 ; dictionnaire ainsi que le nombre
                                   3837 ; de mots.
                                   3838 ;---------------------------------
                           000001  3839 	WLEN=1 ; word length
                           000002  3840 	LLEN=2 ; character sent to console
                           000003  3841 	WCNT=3 ; count words printed 
                           000003  3842 	VSIZE=3 
      002C0D                       3843 words:
      00A55E 23 12            [ 2] 3844 	pushw y
      002C0F                       3845 	_vars VSIZE
      00A560 5B 02            [ 2]    1     sub sp,#VSIZE 
      00A562 CD A0            [ 1] 3846 	clr (LLEN,sp)
      00A564 EB 5B            [ 1] 3847 	clr (WCNT,sp)
      00A566 04 72 19 00      [ 2] 3848 	ldw y,#kword_dict+2
      00A56A 23               [ 1] 3849 0$:	ldw x,y
      00A56B 72               [ 1] 3850 	ld a,(x)
      00A56C 10 00            [ 1] 3851 	and a,#15 
      00A56E 23 CC            [ 1] 3852 	ld (WLEN,sp),a 
      00A570 97 99            [ 1] 3853 	inc (WCNT,sp)
      00A572 CE               [ 1] 3854 1$:	incw x 
      00A573 00               [ 1] 3855 	ld a,(x)
      00A574 1C C3 00         [ 4] 3856 	call putc 
      00A577 1E 2B            [ 1] 3857 	inc (LLEN,sp)
      00A579 0C AE            [ 1] 3858 	dec (WLEN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



      00A57B 96 7D            [ 1] 3859 	jrne 1$
      00A57D CD 89            [ 1] 3860 	ld a,#70
      00A57F ED 55            [ 1] 3861 	cp a,(LLEN,sp)
      00A581 00 04            [ 1] 3862 	jrmi 2$   
      00A583 00 02            [ 1] 3863 	ld a,#SPACE 
      00A585 81 09 10         [ 4] 3864 	call putc 
      00A586 0C 02            [ 1] 3865 	inc (LLEN,sp) 
      00A586 5B 02            [ 2] 3866 	jra 3$
      00A588 A6 0D            [ 1] 3867 2$: ld a,#CR 
      00A588 CD 9C D1         [ 4] 3868 	call putc 
      00A58B CD 94            [ 1] 3869 	clr (LLEN,sp)
      00A58D A2 5F CF 00      [ 2] 3870 3$:	subw y,#2 
      00A591 07 72            [ 2] 3871 	ldw y,(y)
      00A593 5F 00            [ 1] 3872 	jrne 0$ 
      00A595 09 72            [ 1] 3873 	ld a,#CR 
      00A597 5F 00 0A         [ 4] 3874 	call putc  
      00A59A CE               [ 1] 3875 	clrw x 
      00A59B 00 1C            [ 1] 3876 	ld a,(WCNT,sp)
      00A59D CF               [ 1] 3877 	ld xl,a 
      00A59E 00 05 E6         [ 4] 3878 	call prt_i16 
      00A5A1 02 C7 00         [ 2] 3879 	ldw x,#words_count_msg
      00A5A4 04 35 03         [ 4] 3880 	call puts 
      002C5C                       3881 	_drop VSIZE 
      00A5A7 00 02            [ 2]    1     addw sp,#VSIZE 
      00A5A9 72 10            [ 2] 3882 	popw y 
      00A5AB 00               [ 4] 3883 	ret 
      00A5AC 23 CC 97 99 64 73 20  3884 words_count_msg: .asciz " words in dictionary\n"
             69 6E 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   3885 
                                   3886 
                                   3887 ;-----------------------------
                                   3888 ; BASIC: TIMER expr 
                                   3889 ; initialize count down timer 
                                   3890 ;-----------------------------
      00A5B0                       3891 set_timer:
      00A5B0 AE 17 FF         [ 4] 3892 	call arg_list
      00A5B3 94 CC            [ 1] 3893 	cp a,#1 
      00A5B5 97 7A            [ 1] 3894 	jreq 1$
      00A5B7 CC 16 6E         [ 2] 3895 	jp syntax_error
      002C81                       3896 1$: 
      002C81                       3897 	_xpop  
      00A5B7 CD 97            [ 1]    1     ld a,(y)
      00A5B9 EF               [ 1]    2     ldw x,y 
      00A5BA A1 85            [ 2]    3     ldw x,(1,x)
      00A5BC 27 03 CC 96      [ 2]    4     addw y,#CELL_SIZE 
      00A5C0 EE CD 98         [ 2] 3898 	ldw timer,x 
      00A5C3 24               [ 4] 3899 	ret 
                                   3900 
                                   3901 ;------------------------------
                                   3902 ; BASIC: TIMEOUT 
                                   3903 ; return state of timer 
                                   3904 ; output:
                                   3905 ;   A:X     0 not timeout 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



                                   3906 ;   A:X     -1 timeout 
                                   3907 ;------------------------------
      002C8E                       3908 timeout:
      00A5C4 CF               [ 1] 3909 	clr a 
      00A5C5 00 1A CD         [ 2] 3910 	ldw x,timer 
      00A5C8 89 99            [ 1] 3911 	jreq 1$
      00A5CA 27               [ 1] 3912 	clrw x
      00A5CB 03               [ 4] 3913 	ret  
      00A5CC CD               [ 1] 3914 1$:	cpl a
      00A5CD 89               [ 2] 3915 	cplw x 
      00A5CE A0               [ 4] 3916 	ret 
                                   3917  	
                                   3918 
                                   3919 
                                   3920 
                                   3921 ;-----------------------------------
                                   3922 ; BASIC: IWDGEN expr1 
                                   3923 ; enable independant watchdog timer
                                   3924 ; expr1 is delay in multiple of 62.5µsec
                                   3925 ; expr1 -> {1..16383}
                                   3926 ;-----------------------------------
      002C99                       3927 enable_iwdg:
      00A5CF 72 3F 00         [ 4] 3928 	call arg_list
      00A5D2 1A 72            [ 1] 3929 	cp a,#1 
      00A5D4 5C 00            [ 1] 3930 	jreq 1$
      00A5D6 1B 72 3F         [ 2] 3931 	jp syntax_error 
      002CA3                       3932 1$: _xpop  
      00A5D9 00 1A            [ 1]    1     ld a,(y)
      00A5DB 72               [ 1]    2     ldw x,y 
      00A5DC 5C 00            [ 2]    3     ldw x,(1,x)
      00A5DE 1B 72 C7 00      [ 2]    4     addw y,#CELL_SIZE 
      00A5E2 1A 81            [ 1] 3933 	push #0
      00A5E4 35 CC 50 E0      [ 1] 3934 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A5E4 90               [ 1] 3935 	ld a,xh 
      00A5E5 89 AE            [ 1] 3936 	and a,#0x3f
      00A5E7 00               [ 1] 3937 	ld xh,a  
      00A5E8 64 90 AE         [ 2] 3938 2$:	cpw x,#255
      00A5EB 03 E8            [ 2] 3939 	jrule 3$
      00A5ED 20 22            [ 1] 3940 	inc (1,sp)
      00A5EF 98               [ 1] 3941 	rcf 
      00A5EF 90               [ 2] 3942 	rrcw x 
      00A5F0 89 CD            [ 2] 3943 	jra 2$
      00A5F2 99 C6 A1 02      [ 1] 3944 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A5F6 27               [ 1] 3945 	pop a  
      00A5F7 03 CC 96         [ 1] 3946 	ld IWDG_PR,a 
      00A5FA EE               [ 1] 3947 	ld a,xl
      00A5FB 4A               [ 1] 3948 	dec a 
      00A5FB 90 F6 93 EE      [ 1] 3949 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A5FF 01 72 A9         [ 1] 3950 	ld IWDG_RLR,a 
      00A602 00 03 89 90      [ 1] 3951 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A606 F6               [ 4] 3952 	ret 
                                   3953 
                                   3954 
                                   3955 ;-----------------------------------
                                   3956 ; BASIC: IWDGREF  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



                                   3957 ; refresh independant watchdog count down 
                                   3958 ; timer before it reset MCU. 
                                   3959 ;-----------------------------------
      002CD7                       3960 refresh_iwdg:
      00A607 93 EE 01 72      [ 1] 3961 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A60B A9               [ 4] 3962 	ret 
                                   3963 
                                   3964 
                                   3965 ;-------------------------------------
                                   3966 ; BASIC: LOG2(expr)
                                   3967 ; return logarithm base 2 of expr 
                                   3968 ; this is the position of most significant
                                   3969 ; bit set. 
                                   3970 ; input: 
                                   3971 ; output:
                                   3972 ;   A     TK_INTGR 
                                   3973 ;   xstack log2 
                                   3974 ;*********************************
      002CDC                       3975 log2:
      00A60C 00 03 90         [ 4] 3976 	call func_args 
      00A60F 93 85            [ 1] 3977 	cp a,#1 
      00A611 27 03            [ 1] 3978 	jreq 1$
      00A611 89 AE F4         [ 2] 3979 	jp syntax_error 
      002CE6                       3980 1$: 
      002CE6                       3981 	_xpop    
      00A614 24 65            [ 1]    1     ld a,(y)
      00A616 90               [ 1]    2     ldw x,y 
      00A617 A3 7A            [ 2]    3     ldw x,(1,x)
      00A619 12 2B 01 5C      [ 2]    4     addw y,#CELL_SIZE 
      00A61D 4D               [ 1] 3982 	tnz a
      00A61D 9E C7            [ 1] 3983 	jrne 2$ 
      00A61F 53               [ 2] 3984 	tnzw x 
      00A620 0D 9F            [ 1] 3985 	jrne 2$
      00A622 C7 53            [ 1] 3986 	ld a,#ERR_BAD_VALUE
      00A624 0E 8C 56         [ 2] 3987 	jp tb_error 
      00A627 9E C7            [ 1] 3988 2$: push #24 
      00A629 53               [ 2] 3989 3$: rlcw x 
      00A62A 0F               [ 1] 3990     rlc a 
      00A62B 9F C7            [ 1] 3991 	jrc 4$
      00A62D 53 10            [ 1] 3992 	dec (1,sp) 
      00A62F 72 10            [ 1] 3993 	jrne 3$
      00A631 53               [ 1] 3994 4$: clrw x 
      00A632 08               [ 1] 3995     pop a 
      00A633 72               [ 1] 3996 	dec a
      00A634 10               [ 1] 3997 	rlwa x  
      002D08                       3998 9$:	
      00A635 53               [ 4] 3999 	ret 
                                   4000 
                                   4001 ;-----------------------------------
                                   4002 ; BASIC: BIT(expr) 
                                   4003 ; expr ->{0..23}
                                   4004 ; return 2^expr 
                                   4005 ; output:
                                   4006 ;    A:X    2^expr 
                                   4007 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



      002D09                       4008 bitmask:
      00A636 00 72 10         [ 4] 4009     call func_args 
      00A639 53 04            [ 1] 4010 	cp a,#1
      00A63B 85 CD            [ 1] 4011 	jreq 1$
      00A63D AA 7D 72         [ 2] 4012 	jp syntax_error 
      002D13                       4013 1$: _xpop 
      00A640 11 53            [ 1]    1     ld a,(y)
      00A642 08               [ 1]    2     ldw x,y 
      00A643 72 11            [ 2]    3     ldw x,(1,x)
      00A645 53 00 90 85      [ 2]    4     addw y,#CELL_SIZE 
      00A649 81               [ 1] 4014 	ld a,xl 
      00A64A AE 00 01         [ 2] 4015 	ldw x,#1 
      00A64A CD 99            [ 1] 4016 	and a,#23
      00A64C C6 A1            [ 1] 4017 	jreq 9$
      00A64E 02               [ 1] 4018 	push a 
      00A64F 27               [ 1] 4019 	clr a 
      002D26                       4020 2$: 
      00A650 12               [ 2] 4021 	slaw x 
      00A651 A1               [ 1] 4022 	rlc a 	
      00A652 01 27            [ 1] 4023 	dec (1,sp)
      00A654 03 CC            [ 1] 4024 	jrne 2$ 
      002D2C                       4025 4$:
      002D2C                       4026     _drop 1 
      00A656 96 EE            [ 2]    1     addw sp,#1 
      00A658 4F               [ 4] 4027 9$:	ret 
                                   4028 
                                   4029 ;------------------------------
                                   4030 ; BASIC: DO 
                                   4031 ; initiate a DO ... UNTIL loop 
                                   4032 ;------------------------------
                           000003  4033 	DOLP_ADR=3 
                           000005  4034 	DOLP_INW=5
                           000004  4035 	VSIZE=4 
      002D2F                       4036 do_loop:
      00A659 5F               [ 2] 4037 	popw x 
      002D30                       4038 	_vars VSIZE 
      00A65A 72 A2            [ 2]    1     sub sp,#VSIZE 
      00A65C 00               [ 2] 4039 	pushw x 
      00A65D 03 90 F7         [ 2] 4040 	ldw x,basicptr 
      00A660 90 EF            [ 2] 4041 	ldw (DOLP_ADR,sp),x
      00A662 01 90 E6         [ 2] 4042 	ldw x,in.w 
      00A665 03 93            [ 2] 4043 	ldw (DOLP_INW,sp),x
      00A667 EE 04 5D 27      [ 1] 4044 	inc loop_depth 
      00A66B 25               [ 4] 4045 	ret 
                                   4046 
                                   4047 ;--------------------------------
                                   4048 ; BASIC: UNTIL expr 
                                   4049 ; loop if exprssion is false 
                                   4050 ; else terminate loop
                                   4051 ;--------------------------------
      002D42                       4052 until: 
      00A66C 90 F6 93 EE      [ 1] 4053 	tnz loop_depth 
      00A670 01 72            [ 1] 4054 	jrne 1$ 
      00A672 A9 00 03         [ 2] 4055 	jp syntax_error 
      002D4B                       4056 1$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



      00A675 72 A9 00         [ 4] 4057 	call condition  
      002D4E                       4058 	_xpop 
      00A678 03 9F            [ 1]    1     ld a,(y)
      00A67A A4               [ 1]    2     ldw x,y 
      00A67B 07 4E            [ 2]    3     ldw x,(1,x)
      00A67D C7 54 01 72      [ 2]    4     addw y,#CELL_SIZE 
      00A681 16               [ 1] 4059 	tnz a 
      00A682 50 CA            [ 1] 4060 	jrne 9$ 
      00A684 72               [ 2] 4061 	tnzw x 
      00A685 10 54            [ 1] 4062 	jrne 9$ 
      00A687 01 AE            [ 2] 4063 	ldw x,(DOLP_ADR,sp)
      00A689 00 1B 5A         [ 2] 4064 	ldw basicptr,x 
      00A68C 9D 26            [ 1] 4065 	ld a,(2,x)
      00A68E FA 20 08         [ 1] 4066 	ld count,a 
      00A691 72 11            [ 2] 4067 	ldw x,(DOLP_INW,sp)
      00A693 54 01 72         [ 2] 4068 	ldw in.w,x 
      00A696 17               [ 4] 4069 	ret 
      002D6D                       4070 9$:	; remove loop data from stack  
      00A697 50               [ 2] 4071 	popw x
      002D6E                       4072 	_drop VSIZE
      00A698 CA 04            [ 2]    1     addw sp,#VSIZE 
      00A699 72 5A 00 1F      [ 1] 4073 	dec loop_depth 
      00A699 81               [ 2] 4074 	jp (x)
                                   4075 
                                   4076 ;--------------------------
                                   4077 ; BASIC: PORTA...PORTI  
                                   4078 ;  return constant value 
                                   4079 ;  PORT  base address 
                                   4080 ;---------------------------
      00A69A                       4081 const_porta:
      00A69A CD 99 C1         [ 2] 4082 	ldw x,#PA_BASE 
      00A69D A1               [ 1] 4083 	clr a 
      00A69E 01               [ 4] 4084 	ret 
      002D7A                       4085 const_portb:
      00A69F 27 03 CC         [ 2] 4086 	ldw x,#PB_BASE 
      00A6A2 96               [ 1] 4087 	clr a 
      00A6A3 EE               [ 4] 4088 	ret 
      002D7F                       4089 const_portc:
      00A6A4 90 F6 93         [ 2] 4090 	ldw x,#PC_BASE 
      00A6A7 EE               [ 1] 4091 	clr a 
      00A6A8 01               [ 4] 4092 	ret 
      002D84                       4093 const_portd:
      00A6A9 72 A9 00         [ 2] 4094 	ldw x,#PD_BASE 
      00A6AC 03               [ 1] 4095 	clr a 
      00A6AD A3               [ 4] 4096 	ret 
      002D89                       4097 const_porte:
      00A6AE 00 05 23         [ 2] 4098 	ldw x,#PE_BASE 
      00A6B1 05               [ 1] 4099 	clr a 
      00A6B2 A6               [ 4] 4100 	ret 
      002D8E                       4101 const_portf:
      00A6B3 0A CC 96         [ 2] 4102 	ldw x,#PF_BASE 
      00A6B6 F0               [ 1] 4103 	clr a 
      00A6B7 9F               [ 4] 4104 	ret 
      002D93                       4105 const_portg:
      00A6B8 C7 00 0F         [ 2] 4106 	ldw x,#PG_BASE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



      00A6BB A6               [ 1] 4107 	clr a 
      00A6BC 05               [ 4] 4108 	ret 
      002D98                       4109 const_porth:
      00A6BD C0 00 0F         [ 2] 4110 	ldw x,#PH_BASE 
      00A6C0 C7               [ 1] 4111 	clr a 
      00A6C1 54               [ 4] 4112 	ret 
      002D9D                       4113 const_porti:
      00A6C2 00 72 16         [ 2] 4114 	ldw x,#PI_BASE 
      00A6C5 54               [ 1] 4115 	clr a 
      00A6C6 02               [ 4] 4116 	ret 
                                   4117 
                                   4118 ;-------------------------------
                                   4119 ; following return constant 
                                   4120 ; related to GPIO register offset 
                                   4121 ;---------------------------------
      002DA2                       4122 const_odr:
      00A6C7 72               [ 1] 4123 	clr a 
      00A6C8 10 54 01         [ 2] 4124 	ldw x,#GPIO_ODR
      00A6CB 72               [ 4] 4125 	ret 
      002DA7                       4126 const_idr:
      00A6CC 0F               [ 1] 4127 	clr a 
      00A6CD 54 00 FB         [ 2] 4128 	ldw x,#GPIO_IDR
      00A6D0 CE               [ 4] 4129 	ret 
      002DAC                       4130 const_ddr:
      00A6D1 54               [ 1] 4131 	clr a
      00A6D2 04 A6 84         [ 2] 4132 	ldw x,#GPIO_DDR
      00A6D5 81               [ 4] 4133 	ret 
      00A6D6                       4134 const_cr1:
      00A6D6 52               [ 1] 4135 	clr a 
      00A6D7 01 CD 99         [ 2] 4136 	ldw x,#GPIO_CR1
      00A6DA C1               [ 4] 4137 	ret 
      002DB6                       4138 const_cr2:
      00A6DB A1               [ 1] 4139 	clr a
      00A6DC 01 27 03         [ 2] 4140 	ldw x,#GPIO_CR2
      00A6DF CC               [ 4] 4141 	ret 
                                   4142 ;-------------------------
                                   4143 ; BASIC: POUT 
                                   4144 ;  constant for port mode
                                   4145 ;  used by PMODE 
                                   4146 ;  to set pin as output
                                   4147 ;------------------------
      002DBB                       4148 const_output:
      00A6E0 96               [ 1] 4149 	clr a 
      00A6E1 EE 90 F6         [ 2] 4150 	ldw x,#OUTP
      00A6E4 93               [ 4] 4151 	ret 
                                   4152 
                                   4153 ;-------------------------
                                   4154 ; BASIC: PINP 
                                   4155 ;  constant for port mode
                                   4156 ;  used by PMODE 
                                   4157 ;  to set pin as input
                                   4158 ;------------------------
      002DC0                       4159 const_input:
      00A6E5 EE               [ 1] 4160 	clr a  
      00A6E6 01 72 A9         [ 2] 4161 	ldw x,#INP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



      00A6E9 00               [ 4] 4162 	ret 
                                   4163 	
                                   4164 ;-----------------------
                                   4165 ; memory area constants
                                   4166 ;-----------------------
      002DC5                       4167 const_eeprom_base:
      00A6EA 03               [ 1] 4168 	clr a  
      00A6EB A3 00 0F         [ 2] 4169 	ldw x,#EEPROM_BASE 
      00A6EE 23               [ 4] 4170 	ret 
                                   4171 
                                   4172 ;---------------------------
                                   4173 ; BASIC: DATA 
                                   4174 ; when the interpreter find 
                                   4175 ; a DATA line it skip it.
                                   4176 ;---------------------------
      002DCA                       4177 data:
      00A6EF 05 A6 0A CC 96   [ 1] 4178 	mov in,count 
      00A6F4 F0               [ 4] 4179 	ret 
                                   4180 
                                   4181 ;------------------------------
                                   4182 ; check if it is a DATA line 
                                   4183 ; input: 
                                   4184 ;    X    line address 
                                   4185 ; output:
                                   4186 ;    Z    set if DATA line 
                                   4187 ;----------------------------
      002DD0                       4188 is_data_line:
      00A6F5 CD               [ 2] 4189 	pushw x 
      00A6F6 AB C2            [ 1] 4190 	ld a,(3,x)
      00A6F8 6B 01            [ 1] 4191 	cp a,#TK_CMD 
      00A6FA E6 01            [ 1] 4192 	jrne 9$
      00A6FC 0D 01            [ 2] 4193 	ldw x,(4,x)
      00A6FE 27 05 44         [ 2] 4194 	cpw x,#DATA_IDX  
      00A701 0A               [ 2] 4195 9$: popw x 
      00A702 01               [ 4] 4196 	ret 
                                   4197 
                                   4198 ;---------------------------------
                                   4199 ; BASIC: RESTORE [line#]
                                   4200 ; set data_ptr to first data line
                                   4201 ; if no DATA found pointer set to
                                   4202 ; zero.
                                   4203 ; if a line# is given as argument 
                                   4204 ; a data line with that number 
                                   4205 ; is searched and the data pointer 
                                   4206 ; is set to it. If there is no 
                                   4207 ; data line with that number 
                                   4208 ; the program is interrupted. 
                                   4209 ;---------------------------------
      002DDE                       4210 restore:
      00A703 26               [ 1] 4211 	clrw x 
      00A704 FB A4 01         [ 2] 4212 	ldw data_ptr,x 
      00A707 5F 97 4F         [ 2] 4213 	ldw data_ofs,x 
      00A70A 5B 01 81         [ 2] 4214 	ldw x,txtbgn 
      00A70D CD 17 6F         [ 4] 4215 	call next_token 
      00A70D 52 02            [ 1] 4216 	cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



      00A70F CD 99            [ 1] 4217 	jrne 0$
      00A711 C6 A1 02         [ 4] 4218 	call get_int24
      00A714 27 03            [ 2] 4219 	pushw y 
      00A716 CC               [ 1] 4220 	clr a 
      00A717 96 EE 90         [ 4] 4221 	call search_lineno  
      00A71A F6 93            [ 2] 4222 	popw y 
      00A71C EE               [ 2] 4223 	tnzw x 
      00A71D 01 72            [ 1] 4224 	jrne set_data_pointer 
      00A71F A9 00            [ 2] 4225 	jra data_error 
      002DFF                       4226 0$:
      002DFF                       4227 	_unget_token  
      00A721 03 9F 6B 02 90   [ 1]    1      mov in,in.saved  
                                   4228 ; search first DATA line 	
      00A726 F6 93 EE         [ 2] 4229 1$:	cpw x,txtend
      00A729 01 72            [ 1] 4230 	jruge data_error 
      002E09                       4231 2$:	
      00A72B A9 00 03         [ 4] 4232 	call is_data_line 
      00A72E A3 00            [ 1] 4233 	jrne 4$
      00A730 0F 23 05         [ 4] 4234 4$:	call try_next_line 
      00A733 A6 0A            [ 1] 4235 	jrne 4$ 
      00A735 CC               [ 4] 4236 	ret 
                                   4237 
                                   4238 ;---------------------
                                   4239 ; set data pointer 
                                   4240 ; variables at new line 
                                   4241 ; input:
                                   4242 ;    X    line address 
                                   4243 ;----------------------
      002E14                       4244 set_data_pointer:
      00A736 96 F0 CD         [ 2] 4245 	ldw data_ptr,x
      00A739 AB C2            [ 1] 4246 	ld a,(2,x)
      00A73B 6B 01 A6         [ 1] 4247 	ld data_len,a 
      00A73E 01 0D 01 27      [ 1] 4248 	mov data_ofs,#FIRST_DATA_ITEM
      00A742 05               [ 4] 4249 	ret 
                                   4250 
                                   4251 
                                   4252 ;--------------------
                                   4253 ; at end of data line 
                                   4254 ; check if next line 
                                   4255 ; is a data line 
                                   4256 ; input:
                                   4257 ;    X   actual line address 
                                   4258 ;  
                                   4259 ;-------------------
      002E21                       4260 try_next_line: 
      00A743 48 0A            [ 1] 4261 	ld a,(2,x)
      00A745 01 26 FB         [ 1] 4262 	ld acc8,a 
      00A748 0D 02 26 05      [ 1] 4263 	clr acc16 
      00A74C 43 E4 00 20      [ 2] 4264 	addw x,acc16 
      00A750 02 EA 00         [ 2] 4265 	cpw x,txtend 
      00A753 E7 00            [ 1] 4266 	jrult 1$
      00A755 5B 02            [ 2] 4267 	jra data_error 
      002E35                       4268 1$:	
      00A757 81 2D D0         [ 4] 4269 	call is_data_line 
      00A758 27 04            [ 1] 4270 	jreq 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



      00A758 72 00            [ 1] 4271 	ld a,#1  
      00A75A 00 23            [ 2] 4272 	jra 9$
      00A75C 02 4F 81         [ 4] 4273 2$:	call set_data_pointer
      00A75F 4F               [ 1] 4274 	clr a  
      00A75F AE               [ 4] 4275 9$:	ret 
      002E43                       4276 data_error:	
      00A760 A7 86            [ 1] 4277     ld a,#ERR_NO_DATA 
      00A762 CD 89 ED         [ 2] 4278 	jp tb_error 
                                   4279 
                                   4280 
                                   4281 ;---------------------------------
                                   4282 ; BASIC: READ 
                                   4283 ; return next data item | 0 
                                   4284 ;---------------------------------
                           000001  4285 	CTX_BPTR=1 
                           000003  4286 	CTX_IN=3 
                           000004  4287 	CTX_COUNT=4 
                           000005  4288 	INT24=5
                           000007  4289 	VSIZE=7 
      002E48                       4290 read:
      002E48                       4291 	_vars  VSIZE 
      00A765 5B 02            [ 2]    1     sub sp,#VSIZE 
      00A767 52 04 CD         [ 4] 4292 	call save_context
      002E4D                       4293 read01:	
      00A76A A0 DB AE         [ 1] 4294 	ld a,data_ofs
      00A76D 16 68 CF         [ 1] 4295 	cp a,data_len 
      00A770 00 05            [ 1] 4296 	jreq 2$ ; end of line  
      002E55                       4297 0$:
      00A772 7F 72 5F         [ 2] 4298 	ldw x,data_ptr 
      00A775 00 04 5F         [ 2] 4299 	ldw basicptr,x 
      00A778 CF 00 01 72 11   [ 1] 4300 	mov in,data_ofs 
      00A77D 00 23 72 18 00   [ 1] 4301 	mov count,data_len  
      00A782 23 CC 97         [ 4] 4302 	call expression 
      00A785 99 0A            [ 1] 4303 	cp a,#TK_INTGR 
      00A787 62 72            [ 1] 4304 	jreq 1$ 
      00A789 65 61 6B         [ 2] 4305 	jp syntax_error 
      002E6F                       4306 1$:
      00A78C 20 70 6F         [ 4] 4307 	call next_token ; skip comma
      00A78F 69 6E 74         [ 2] 4308 	ldw x,basicptr 
      00A792 2C 20 52         [ 2] 4309 	ldw data_ptr,x 
      00A795 55 4E 20 74 6F   [ 1] 4310 	mov data_ofs,in 
      00A79A 20 72 65         [ 4] 4311 	call rest_context
      002E80                       4312 	_xpop 
      00A79D 73 75            [ 1]    1     ld a,(y)
      00A79F 6D               [ 1]    2     ldw x,y 
      00A7A0 65 2E            [ 2]    3     ldw x,(1,x)
      00A7A2 0A 00 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A7A4                       4313 	_drop VSIZE 
      00A7A4 72 01            [ 2]    1     addw sp,#VSIZE 
      00A7A6 00               [ 4] 4314 	ret 
      002E8C                       4315 2$: ; end of line reached 
                                   4316 	; try next line 
      00A7A7 23 01 81         [ 2] 4317 	ldw x,data_ptr  
      00A7AA CD 2E 21         [ 4] 4318 	call try_next_line
      00A7AA CD 95            [ 1] 4319 	jreq 0$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      00A7AC 4A 81            [ 2] 4320 	jra data_error 
                                   4321 
                                   4322 ;---------------------------------
                                   4323 ; BASIC: SPIEN clkdiv, 0|1  
                                   4324 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4325 ; if clkdiv==-1 disable SPI
                                   4326 ; 0|1 -> disable|enable  
                                   4327 ;--------------------------------- 
                           000005  4328 SPI_CS_BIT=5
      00A7AE                       4329 spi_enable:
      00A7AE 72 5F 00         [ 4] 4330 	call arg_list 
      00A7B1 19 52            [ 1] 4331 	cp a,#2
      00A7B3 03 CD            [ 1] 4332 	jreq 1$
      00A7B5 97 EF A1         [ 2] 4333 	jp syntax_error 
      002EA0                       4334 1$: 
      00A7B8 04 27 03 CC      [ 1] 4335 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A7BC 96               [ 2] 4336 	popw x  
      00A7BD EE               [ 2] 4337 	tnzw x 
      00A7BE CD 98            [ 1] 4338 	jreq spi_disable 
      00A7C0 3E               [ 2] 4339 	popw x 
      00A7C1 A4 DF            [ 1] 4340 	ld a,#(1<<SPI_CR1_BR)
      00A7C3 A1               [ 4] 4341 	mul x,a 
      00A7C4 45               [ 1] 4342 	ld a,xl 
      00A7C5 26 0C AE         [ 1] 4343 	ld SPI_CR1,a 
                                   4344 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A7C8 40 00 CF 00      [ 1] 4345 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A7CC 1A AE 47 FF      [ 1] 4346 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4347 ; configure SPI as master mode 0.	
      00A7D0 4F 20 15 A1      [ 1] 4348 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4349 ; ~CS line controlled by sofware 	
      00A7D4 46 27 06 AE      [ 1] 4350 	bset SPI_CR2,#SPI_CR2_SSM 
      00A7D8 96 2E CC 96      [ 1] 4351     bset SPI_CR2,#SPI_CR2_SSI 
                                   4352 ; enable SPI
      00A7DC F0 1C 52 00      [ 1] 4353 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A7DD 81               [ 4] 4354 	ret 
      002EC9                       4355 spi_disable:
      002EC9                       4356 	_drop #2; throw first argument.
      00A7DD AE B6            [ 2]    1     addw sp,##2 
                                   4357 ; wait spi idle 
      00A7DF 00 CF            [ 1] 4358 1$:	ld a,#0x82 
      00A7E1 00 1A A6         [ 1] 4359 	and a,SPI_SR
      00A7E4 02 AE            [ 1] 4360 	cp a,#2 
      00A7E6 7F FF            [ 1] 4361 	jrne 1$
      00A7E8 72 1D 52 00      [ 1] 4362 	bres SPI_CR1,#SPI_CR1_SPE
      00A7E8 6B 01 1F 02      [ 1] 4363 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A7EC CD 87 8E 16      [ 1] 4364 	bres PE_DDR,#SPI_CS_BIT 
      00A7EF 81               [ 4] 4365 	ret 
                                   4366 
      002EE1                       4367 spi_clear_error:
      00A7EF CD 89            [ 1] 4368 	ld a,#0x78 
      00A7F1 10 27 08         [ 1] 4369 	bcp a,SPI_SR 
      00A7F4 A6 45            [ 1] 4370 	jreq 1$
      00A7F6 CD 89 90 CD      [ 1] 4371 	clr SPI_SR 
      00A7FA 88               [ 4] 4372 1$: ret 
                                   4373 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



      002EED                       4374 spi_send_byte:
      00A7FB 0C               [ 1] 4375 	push a 
      00A7FC AE 00 80         [ 4] 4376 	call spi_clear_error
      00A7FF CD               [ 1] 4377 	pop a 
      00A800 89 02 7B 01 1E   [ 2] 4378 	btjf SPI_SR,#SPI_SR_TXE,.
      00A805 02 72 B0         [ 1] 4379 	ld SPI_DR,a
      00A808 00 1A C2 00 19   [ 2] 4380 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A80D 22 E0 CD         [ 1] 4381 	ld a,SPI_DR 
      00A810 95               [ 4] 4382 	ret 
                                   4383 
      002F03                       4384 spi_rcv_byte:
      00A811 4A 1E            [ 1] 4385 	ld a,#255
      00A813 02 A3 47 FF 26   [ 2] 4386 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A818 03 CD 9D         [ 1] 4387 	ld a,SPI_DR 
      00A81B 9A               [ 4] 4388 	ret
                                   4389 
                                   4390 ;------------------------------
                                   4391 ; BASIC: SPIWR byte [,byte]
                                   4392 ; write 1 or more byte
                                   4393 ;------------------------------
      00A81C                       4394 spi_write:
      00A81C 5B 03 81         [ 4] 4395 	call expression
      00A81F A1 84            [ 1] 4396 	cp a,#TK_INTGR 
      00A81F CE B6            [ 1] 4397 	jreq 1$
      00A821 00 C3 A8         [ 2] 4398 	jp syntax_error 
      002F18                       4399 1$:	
      00A824 DF               [ 1] 4400 	ld a,xl 
      00A825 81 2E ED         [ 4] 4401 	call spi_send_byte 
      00A826 CD 17 6F         [ 4] 4402 	call next_token 
      00A826 88 4D            [ 1] 4403 	cp a,#TK_COMMA 
      00A828 27 0A            [ 1] 4404 	jrne 2$ 
      00A82A F6 5C            [ 2] 4405 	jra spi_write 
      00A82C 90               [ 1] 4406 2$:	tnz a 
      00A82D F7 90            [ 1] 4407 	jreq 3$
      002F28                       4408 	_unget_token  
      00A82F 5C 0A 01 26 F6   [ 1]    1      mov in,in.saved  
      00A834 84               [ 4] 4409 3$:	ret 
                                   4410 
                                   4411 
                                   4412 ;-------------------------------
                                   4413 ; BASIC: SPIRD 	
                                   4414 ; read one byte from SPI 
                                   4415 ;-------------------------------
      002F2E                       4416 spi_read:
      00A835 81 2F 03         [ 4] 4417 	call spi_rcv_byte 
      00A836 5F               [ 1] 4418 	clrw x 
      00A836 88               [ 1] 4419 	ld xl,a 
      00A837 90               [ 1] 4420 	clr a  
      00A838 AE               [ 4] 4421 	ret 
                                   4422 
                                   4423 ;------------------------------
                                   4424 ; BASIC: SPISEL 0|1 
                                   4425 ; set state of ~CS line
                                   4426 ; 0|1 deselect|select  
                                   4427 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



      002F35                       4428 spi_select:
      00A839 16 B8 90         [ 4] 4429 	call next_token 
      00A83C 89 A6            [ 1] 4430 	cp a,#TK_INTGR 
      00A83E 80 90            [ 1] 4431 	jreq 1$
      00A840 7F 90 5C         [ 2] 4432 	jp syntax_error 
      00A843 4A               [ 2] 4433 1$: tnzw x  
      00A844 26 F9            [ 1] 4434 	jreq cs_high 
      00A846 90 85 84 81      [ 1] 4435 	bres PE_ODR,#SPI_CS_BIT
      00A84A 81               [ 4] 4436 	ret 
      002F47                       4437 cs_high: 
      00A84A 89 90 89 52      [ 1] 4438 	bset PE_ODR,#SPI_CS_BIT
      00A84E 06               [ 4] 4439 	ret 
                                   4440 
                                   4441 ;-------------------------------
                                   4442 ; BASIC: PAD 
                                   4443 ; Return pad buffer address.
                                   4444 ;------------------------------
      002F4C                       4445 pad_ref:
      00A84F CD A8 1F         [ 2] 4446 	ldw x,#pad 
      00A852 26               [ 1] 4447 	clr a
      00A853 09               [ 4] 4448 	ret 
                                   4449 
                                   4450 
                                   4451 ;------------------------------
                                   4452 ;      dictionary 
                                   4453 ; format:
                                   4454 ;   link:   2 bytes 
                                   4455 ;   name_length+flags:  1 byte, bits 0:3 lenght,4:8 kw type   
                                   4456 ;   cmd_name: 16 byte max 
                                   4457 ;   cmd_index: 2 bytes 
                                   4458 ;------------------------------
                                   4459 	.macro _dict_entry len,name,cmd_idx 
                                   4460 	.word LINK 
                                   4461 	LINK=.
                                   4462 name:
                                   4463 	.byte len   	
                                   4464 	.ascii "name"
                                   4465 	.word cmd_idx 
                                   4466 	.endm 
                                   4467 
                           000000  4468 	LINK=0
                                   4469 ; respect alphabetic order for BASIC names from Z-A
                                   4470 ; this sort order is for a cleaner WORDS cmd output. 	
      002F51                       4471 kword_end:
      002F51                       4472 	_dict_entry,3+F_XOR,XOR,XOR_IDX ; xor operator
      00A854 AE A8                    1 	.word LINK 
                           002F53     2 	LINK=.
      002F53                          3 XOR:
      00A856 E1                       4 	.byte 3+F_XOR   	
      00A857 CD 89 ED                 5 	.ascii "XOR"
      00A85A CC A8                    6 	.word XOR_IDX 
      002F59                       4473 	_dict_entry,5,WRITE,WRITE_IDX;write  
      00A85C D9 53                    1 	.word LINK 
                           002F5B     2 	LINK=.
      00A85D                          3 WRITE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



      00A85D CE                       4 	.byte 5   	
      00A85E 00 1C C3 00 1E           5 	.ascii "WRITE"
      00A863 25 09                    6 	.word WRITE_IDX 
      002F63                       4474 	_dict_entry,5,WORDS,WORDS_IDX;words 
      00A865 AE A9                    1 	.word LINK 
                           002F65     2 	LINK=.
      002F65                          3 WORDS:
      00A867 23                       4 	.byte 5   	
      00A868 CD 89 ED CC A8           5 	.ascii "WORDS"
      00A86D D9 AE                    6 	.word WORDS_IDX 
      00A86E                       4475 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      00A86E CD 87                    1 	.word LINK 
                           002F6F     2 	LINK=.
      002F6F                          3 WAIT:
      00A870 CE                       4 	.byte 4   	
      00A871 72 5F 00 19              5 	.ascii "WAIT"
      00A875 AE B6                    6 	.word WAIT_IDX 
      002F76                       4476 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      00A877 00 CF                    1 	.word LINK 
                           002F78     2 	LINK=.
      002F78                          3 USR:
      00A879 00                       4 	.byte 3+F_IFUNC   	
      00A87A 1A CD 9E                 5 	.ascii "USR"
      00A87D BA 1F                    6 	.word USR_IDX 
      002F7E                       4477 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      00A87F 05 0F                    1 	.word LINK 
                           002F80     2 	LINK=.
      002F80                          3 UNTIL:
      00A881 03                       4 	.byte 5   	
      00A882 CD A8 36 CE A8           5 	.ascii "UNTIL"
      00A887 DF 90                    6 	.word UNTIL_IDX 
      002F88                       4478 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      00A889 FF 72                    1 	.word LINK 
                           002F8A     2 	LINK=.
      002F8A                          3 UFLASH:
      00A88B A9                       4 	.byte 6+F_IFUNC   	
      00A88C 00 02 1E 05 90 FF        5 	.ascii "UFLASH"
      00A892 72 A9                    6 	.word UFLASH_IDX 
      002F93                       4479 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      00A894 00 02                    1 	.word LINK 
                           002F95     2 	LINK=.
      002F95                          3 UBOUND:
      00A896 A6                       4 	.byte 6+F_IFUNC   	
      00A897 7C 6B 04 A3 00 7C        5 	.ascii "UBOUND"
      00A89D 22 01                    6 	.word UBOUND_IDX 
      002F9E                       4480 	_dict_entry,4,TONE,TONE_IDX;tone  
      00A89F 9F 6B                    1 	.word LINK 
                           002FA0     2 	LINK=.
      002FA0                          3 TONE:
      00A8A1 04                       4 	.byte 4   	
      00A8A2 CE 00 1C 1F              5 	.ascii "TONE"
      00A8A6 01 A2                    6 	.word TONE_IDX 
      00A8A7                       4481 	_dict_entry,2,TO,TO_IDX;to
      00A8A7 1E 01                    1 	.word LINK 
                           002FA9     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



      002FA9                          3 TO:
      00A8A9 7B                       4 	.byte 2   	
      00A8AA 04 CD                    5 	.ascii "TO"
      00A8AC A8 26                    6 	.word TO_IDX 
      002FAE                       4482 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00A8AE 1F 01                    1 	.word LINK 
                           002FB0     2 	LINK=.
      002FB0                          3 TIMER:
      00A8B0 AE                       4 	.byte 5   	
      00A8B1 16 B8 CD 87 E8           5 	.ascii "TIMER"
      00A8B6 AE 00                    6 	.word TIMER_IDX 
      002FB8                       4483 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00A8B8 80 CD                    1 	.word LINK 
                           002FBA     2 	LINK=.
      002FBA                          3 TIMEOUT:
      00A8BA 89                       4 	.byte 7+F_IFUNC   	
      00A8BB 02 1E 01 C3 00 1E 24     5 	.ascii "TIMEOUT"
      00A8C2 16 1E                    6 	.word TMROUT_IDX 
      002FC4                       4484 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00A8C4 05 72                    1 	.word LINK 
                           002FC6     2 	LINK=.
      002FC6                          3 TICKS:
      00A8C6 F0                       4 	.byte 5+F_IFUNC   	
      00A8C7 03 1F 05 A6 80           5 	.ascii "TICKS"
      00A8CC A3 00                    6 	.word TICKS_IDX 
      002FCE                       4485 	_dict_entry,4,STOP,STOP_IDX;stop 
      00A8CE 80 24                    1 	.word LINK 
                           002FD0     2 	LINK=.
      002FD0                          3 STOP:
      00A8D0 01                       4 	.byte 4   	
      00A8D1 9F 6B 04 CD              5 	.ascii "STOP"
      00A8D5 A8 36                    6 	.word STOP_IDX 
      002FD7                       4486 	_dict_entry,4,STEP,STEP_IDX;step 
      00A8D7 20 CE                    1 	.word LINK 
                           002FD9     2 	LINK=.
      002FD9                          3 STEP:
      00A8D9 5B                       4 	.byte 4   	
      00A8DA 06 90 85 85              5 	.ascii "STEP"
      00A8DE 81 42                    6 	.word STEP_IDX 
      002FE0                       4487 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      00A8E0 43 43                    1 	.word LINK 
                           002FE2     2 	LINK=.
      002FE2                          3 SPIWR:
      00A8E2 61                       4 	.byte 5   	
      00A8E3 6E 27 74 20 66           5 	.ascii "SPIWR"
      00A8E8 6C 61                    6 	.word SPIWR_IDX 
      002FEA                       4488 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00A8EA 73 68                    1 	.word LINK 
                           002FEC     2 	LINK=.
      002FEC                          3 SPISEL:
      00A8EC 20                       4 	.byte 6   	
      00A8ED 61 70 70 6C 69 63        5 	.ascii "SPISEL"
      00A8F3 61 74                    6 	.word SPISEL_IDX 
      002FF5                       4489 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      00A8F5 69 6F                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



                           002FF7     2 	LINK=.
      002FF7                          3 SPIRD:
      00A8F7 6E                       4 	.byte 5+F_IFUNC   	
      00A8F8 2C 20 61 6C 72           5 	.ascii "SPIRD"
      00A8FD 65 61                    6 	.word SPIRD_IDX 
      002FFF                       4490 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      00A8FF 64 79                    1 	.word LINK 
                           003001     2 	LINK=.
      003001                          3 SPIEN:
      00A901 20                       4 	.byte 5   	
      00A902 6F 6E 65 20 69           5 	.ascii "SPIEN"
      00A907 6E 20                    6 	.word SPIEN_IDX 
      003009                       4491 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      00A909 46 4C                    1 	.word LINK 
                           00300B     2 	LINK=.
      00300B                          3 SLEEP:
      00A90B 41                       4 	.byte 5   	
      00A90C 53 48 0A 75 73           5 	.ascii "SLEEP"
      00A911 65 20                    6 	.word SLEEP_IDX 
      003013                       4492     _dict_entry,4,SIZE,SIZE_IDX; cmd_size 
      00A913 45 52                    1 	.word LINK 
                           003015     2 	LINK=.
      003015                          3 SIZE:
      00A915 41                       4 	.byte 4   	
      00A916 53 45 20 5C              5 	.ascii "SIZE"
      00A91A 46 20                    6 	.word SIZE_IDX 
      00301C                       4493 	_dict_entry,4,SAVE,SAVE_IDX ;save_app 
      00A91C 62 65                    1 	.word LINK 
                           00301E     2 	LINK=.
      00301E                          3 SAVE:
      00A91E 66                       4 	.byte 4   	
      00A91F 6F 72 65 00              5 	.ascii "SAVE"
      00A923 4E 6F                    6 	.word SAVE_IDX 
      003025                       4494 	_dict_entry 3,RUN,RUN_IDX;run
      00A925 20 61                    1 	.word LINK 
                           003027     2 	LINK=.
      003027                          3 RUN:
      00A927 70                       4 	.byte 3   	
      00A928 70 6C 69                 5 	.ascii "RUN"
      00A92B 63 61                    6 	.word RUN_IDX 
      00302D                       4495 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      00A92D 74 69                    1 	.word LINK 
                           00302F     2 	LINK=.
      00302F                          3 RSHIFT:
      00A92F 6F                       4 	.byte 6+F_IFUNC   	
      00A930 6E 20 69 6E 20 52        5 	.ascii "RSHIFT"
      00A936 41 4D                    6 	.word RSHIFT_IDX 
      003038                       4496 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      00A938 00 2F                    1 	.word LINK 
                           00303A     2 	LINK=.
      00A939                          3 RND:
      00A939 CD                       4 	.byte 3+F_IFUNC   	
      00A93A 9A F1 A1                 5 	.ascii "RND"
      00A93D 84 27                    6 	.word RND_IDX 
      003040                       4497 	_dict_entry,6,RETURN,RET_IDX;return 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



      00A93F 03 CC                    1 	.word LINK 
                           003042     2 	LINK=.
      003042                          3 RETURN:
      00A941 96                       4 	.byte 6   	
      00A942 EE 90 F6 93 EE 01        5 	.ascii "RETURN"
      00A948 72 A9                    6 	.word RET_IDX 
      00304B                       4498 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00A94A 00 03                    1 	.word LINK 
                           00304D     2 	LINK=.
      00304D                          3 RESTORE:
      00A94C C7                       4 	.byte 7   	
      00A94D 00 19 CF 00 1A 52 45     5 	.ascii "RESTORE"
      00A952 00 80                    6 	.word REST_IDX 
      003057                       4499 	_dict_entry 3,REM,REM_IDX;remark 
      00A952 CD 97                    1 	.word LINK 
                           003059     2 	LINK=.
      003059                          3 REM:
      00A954 EF                       4 	.byte 3   	
      00A955 A1 08 27                 5 	.ascii "REM"
      00A958 02 20                    6 	.word REM_IDX 
      00305F                       4500 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      00A95A 20 CD                    1 	.word LINK 
                           003061     2 	LINK=.
      003061                          3 REBOOT:
      00A95C 9A                       4 	.byte 6   	
      00A95D F1 A1 84 27 03 CC        5 	.ascii "REBOOT"
      00A963 96 EE                    6 	.word RBT_IDX 
      00306A                       4501 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      00A965 90 F6                    1 	.word LINK 
                           00306C     2 	LINK=.
      00306C                          3 READ:
      00A967 93                       4 	.byte 4+F_IFUNC   	
      00A968 EE 01 72 A9              5 	.ascii "READ"
      00A96C 00 03                    6 	.word READ_IDX 
      003073                       4502 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      00A96E 9F 5F                    1 	.word LINK 
                           003075     2 	LINK=.
      003075                          3 QKEY:
      00A970 CD                       4 	.byte 4+F_IFUNC   	
      00A971 88 32 AE 00              5 	.ascii "QKEY"
      00A975 01 CD                    6 	.word QKEY_IDX 
      00307C                       4503 	_dict_entry,5+F_IFUNC,PORTI,PRTI_IDX;const_porti 
      00A977 89 02                    1 	.word LINK 
                           00307E     2 	LINK=.
      00307E                          3 PORTI:
      00A979 20                       4 	.byte 5+F_IFUNC   	
      00A97A D7 4F 52 54 49           5 	.ascii "PORTI"
      00A97B 00 76                    6 	.word PRTI_IDX 
      003086                       4504 	_dict_entry,5+F_IFUNC,PORTH,PRTH_IDX;const_porth 
      00A97B 81 7E                    1 	.word LINK 
                           003088     2 	LINK=.
      00A97C                          3 PORTH:
      00A97C CD                       4 	.byte 5+F_IFUNC   	
      00A97D 99 C1 A1 01 27           5 	.ascii "PORTH"
      00A982 03 CC                    6 	.word PRTH_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



      003090                       4505 	_dict_entry,5+F_IFUNC,PORTG,PRTG_IDX;const_portg 
      00A984 96 EE                    1 	.word LINK 
                           003092     2 	LINK=.
      003092                          3 PORTG:
      00A986 90                       4 	.byte 5+F_IFUNC   	
      00A987 F6 93 EE 01 72           5 	.ascii "PORTG"
      00A98C A9 00                    6 	.word PRTG_IDX 
      00309A                       4506 	_dict_entry,5+F_IFUNC,PORTF,PRTF_IDX;const_portf
      00A98E 03 9F                    1 	.word LINK 
                           00309C     2 	LINK=.
      00309C                          3 PORTF:
      00A990 A4                       4 	.byte 5+F_IFUNC   	
      00A991 7F 81 52 54 46           5 	.ascii "PORTF"
      00A993 00 70                    6 	.word PRTF_IDX 
      0030A4                       4507 	_dict_entry,5+F_IFUNC,PORTE,PRTE_IDX;const_porte
      00A993 A6 06                    1 	.word LINK 
                           0030A6     2 	LINK=.
      0030A6                          3 PORTE:
      00A995 CD                       4 	.byte 5+F_IFUNC   	
      00A996 99 B4 CD 97 EF           5 	.ascii "PORTE"
      00A99B A1 02                    6 	.word PRTE_IDX 
      0030AE                       4508 	_dict_entry,5+F_IFUNC,PORTD,PRTD_IDX;const_portd
      00A99D 27 0E                    1 	.word LINK 
                           0030B0     2 	LINK=.
      0030B0                          3 PORTD:
      00A99F A1                       4 	.byte 5+F_IFUNC   	
      00A9A0 04 27 12 A1 82           5 	.ascii "PORTD"
      00A9A5 27 03                    6 	.word PRTD_IDX 
      0030B8                       4509 	_dict_entry,5+F_IFUNC,PORTC,PRTC_IDX;const_portc
      00A9A7 CC 96                    1 	.word LINK 
                           0030BA     2 	LINK=.
      0030BA                          3 PORTC:
      00A9A9 EE                       4 	.byte 5+F_IFUNC   	
      00A9AA 50 4F 52 54 43           5 	.ascii "PORTC"
      00A9AA FD 20                    6 	.word PRTC_IDX 
      0030C2                       4510 	_dict_entry,5+F_IFUNC,PORTB,PRTB_IDX;const_portb
      00A9AC 0B BA                    1 	.word LINK 
                           0030C4     2 	LINK=.
      00A9AD                          3 PORTB:
      00A9AD F6                       4 	.byte 5+F_IFUNC   	
      00A9AE 88 CD 98 15 84           5 	.ascii "PORTB"
      00A9B3 20 03                    6 	.word PRTB_IDX 
      00A9B5                       4511 	_dict_entry,5+F_IFUNC,PORTA,PRTA_IDX;const_porta 
      00A9B5 CD 98                    1 	.word LINK 
                           0030CE     2 	LINK=.
      0030CE                          3 PORTA:
      00A9B7 3E                       4 	.byte 5+F_IFUNC   	
      00A9B8 5F 02 72 A2 00           5 	.ascii "PORTA"
      00A9BD 03 90                    6 	.word PRTA_IDX 
      0030D6                       4512 	_dict_entry 5,PRINT,PRT_IDX;print 
      00A9BF F7 90                    1 	.word LINK 
                           0030D8     2 	LINK=.
      0030D8                          3 PRINT:
      00A9C1 EF                       4 	.byte 5   	
      00A9C2 01 A6 07 CD 99           5 	.ascii "PRINT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



      00A9C7 B4 64                    6 	.word PRT_IDX 
      00A9C8                       4513 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      00A9C8 90 F6                    1 	.word LINK 
                           0030E2     2 	LINK=.
      0030E2                          3 POUT:
      00A9CA 93                       4 	.byte 4+F_IFUNC   	
      00A9CB EE 01 72 A9              5 	.ascii "POUT"
      00A9CF 00 03                    6 	.word POUT_IDX 
      0030E9                       4514 	_dict_entry,4,POKE,POKE_IDX;poke 
      00A9D1 81 E2                    1 	.word LINK 
                           0030EB     2 	LINK=.
      00A9D2                          3 POKE:
      00A9D2 CD                       4 	.byte 4   	
      00A9D3 89 A0 81 45              5 	.ascii "POKE"
      00A9D6 00 60                    6 	.word POKE_IDX 
      0030F2                       4515 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      00A9D6 5F C6                    1 	.word LINK 
                           0030F4     2 	LINK=.
      0030F4                          3 PMODE:
      00A9D8 00                       4 	.byte 5   	
      00A9D9 2F C0 00 30 27           5 	.ascii "PMODE"
      00A9DE 03 53                    6 	.word PMODE_IDX 
      0030FC                       4516 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      00A9E0 A6 FF                    1 	.word LINK 
                           0030FE     2 	LINK=.
      00A9E2                          3 PINP:
      00A9E2 81                       4 	.byte 4+F_IFUNC   	
      00A9E3 50 49 4E 50              5 	.ascii "PINP"
      00A9E3 CD 99                    6 	.word PINP_IDX 
      003105                       4517 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      00A9E5 C1 A1                    1 	.word LINK 
                           003107     2 	LINK=.
      003107                          3 PEEK:
      00A9E7 02                       4 	.byte 4+F_IFUNC   	
      00A9E8 27 03 CC 96              5 	.ascii "PEEK"
      00A9EC EE 90                    6 	.word PEEK_IDX 
      00310E                       4518 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      00A9EE E6 03                    1 	.word LINK 
                           003110     2 	LINK=.
      003110                          3 PAUSE:
      00A9F0 93                       4 	.byte 5   	
      00A9F1 EE 04 A3 50 00           5 	.ascii "PAUSE"
      00A9F6 2B 16                    6 	.word PAUSE_IDX 
      003118                       4519 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      00A9F8 A3 50                    1 	.word LINK 
                           00311A     2 	LINK=.
      00311A                          3 PAD:
      00A9FA 29                       4 	.byte 3+F_IFUNC   	
      00A9FB 2A 11 89                 5 	.ascii "PAD"
      00A9FE 90 F6                    6 	.word PAD_IDX 
      003120                       4520 	_dict_entry,2+F_OR,OR,OR_IDX; OR operator 
      00AA00 93 EE                    1 	.word LINK 
                           003122     2 	LINK=.
      003122                          3 OR:
      00AA02 01                       4 	.byte 2+F_OR   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



      00AA03 72 A9                    5 	.ascii "OR"
      00AA05 00 03                    6 	.word OR_IDX 
      003127                       4521 	_dict_entry,2,ON,ON_IDX; cmd_on 
      00AA07 72 FB                    1 	.word LINK 
                           003129     2 	LINK=.
      003129                          3 ON:
      00AA09 01                       4 	.byte 2   	
      00AA0A 5B 02                    5 	.ascii "ON"
      00AA0C 4F 81                    6 	.word ON_IDX 
      00AA0E                       4522 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      00AA0E A6 0A                    1 	.word LINK 
                           003130     2 	LINK=.
      003130                          3 ODR:
      00AA10 CC                       4 	.byte 3+F_IFUNC   	
      00AA11 96 F0 52                 5 	.ascii "ODR"
      00AA13 00 54                    6 	.word ODR_IDX 
      003136                       4523 	_dict_entry,3+F_NOT,NOT,NOT_IDX;NOT operator
      00AA13 CD A8                    1 	.word LINK 
                           003138     2 	LINK=.
      003138                          3 NOT:
      00AA15 1F                       4 	.byte 3+F_NOT   	
      00AA16 26 13 AE                 5 	.ascii "NOT"
      00AA19 B6 00                    6 	.word NOT_IDX 
      00313E                       4524 	_dict_entry,4,NEXT,NEXT_IDX;next 
      00AA1B 72 BB                    1 	.word LINK 
                           003140     2 	LINK=.
      003140                          3 NEXT:
      00AA1D B6                       4 	.byte 4   	
      00AA1E 02 1C 00 04              5 	.ascii "NEXT"
      00AA22 1C 00                    6 	.word NEXT_IDX 
      003147                       4525 	_dict_entry,3,NEW,NEW_IDX;new
      00AA24 80 9F                    1 	.word LINK 
                           003149     2 	LINK=.
      003149                          3 NEW:
      00AA26 A4                       4 	.byte 3   	
      00AA27 80 97 20                 5 	.ascii "NEW"
      00AA2A 03 AE                    6 	.word NEW_IDX 
      00314F                       4526 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      00AA2C B6 00                    1 	.word LINK 
                           003151     2 	LINK=.
      00AA2E                          3 LSHIFT:
      00AA2E 4F                       4 	.byte 6+F_IFUNC   	
      00AA2F 81 53 48 49 46 54        5 	.ascii "LSHIFT"
      00AA30 00 4E                    6 	.word LSHIFT_IDX 
      00315A                       4527 	_dict_entry,4+F_IFUNC,LOG2,LOG_IDX;log2 
      00AA30 CD 99                    1 	.word LINK 
                           00315C     2 	LINK=.
      00315C                          3 LOG2:
      00AA32 C1                       4 	.byte 4+F_IFUNC   	
      00AA33 A1 02 27 03              5 	.ascii "LOG2"
      00AA37 CC 96                    6 	.word LOG_IDX 
      003163                       4528 	_dict_entry 4,LIST,LIST_IDX;list
      00AA39 EE 5C                    1 	.word LINK 
                           003165     2 	LINK=.
      00AA3A                          3 LIST:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



      00AA3A 90                       4 	.byte 4   	
      00AA3B E6 03 93 EE              5 	.ascii "LIST"
      00AA3F 04 CF                    6 	.word LIST_IDX 
      00316C                       4529 	_dict_entry 3,LET,LET_IDX;let 
      00AA41 00 1A                    1 	.word LINK 
                           00316E     2 	LINK=.
      00316E                          3 LET:
      00AA43 90                       4 	.byte 3   	
      00AA44 F6 93 EE                 5 	.ascii "LET"
      00AA47 01 72                    6 	.word LET_IDX 
      003174                       4530 	_dict_entry,3+F_CFUNC,KEY,KEY_IDX;key 
      00AA49 A9 00                    1 	.word LINK 
                           003176     2 	LINK=.
      003176                          3 KEY:
      00AA4B 03                       4 	.byte 3+F_CFUNC   	
      00AA4C 90 F7 90                 5 	.ascii "KEY"
      00AA4F EF 01                    6 	.word KEY_IDX 
      00317C                       4531 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      00AA51 72 CD                    1 	.word LINK 
                           00317E     2 	LINK=.
      00317E                          3 IWDGREF:
      00AA53 00                       4 	.byte 7   	
      00AA54 1A 81 44 47 52 45 46     5 	.ascii "IWDGREF"
      00AA56 00 44                    6 	.word IWDGREF_IDX 
      003188                       4532 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      00AA56 72 0D                    1 	.word LINK 
                           00318A     2 	LINK=.
      00318A                          3 IWDGEN:
      00AA58 52                       4 	.byte 6   	
      00AA59 30 FB 8E CC 81 43        5 	.ascii "IWDGEN"
      00AA5F 00 42                    6 	.word IWDGEN_IDX 
      003193                       4533 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      00AA5F 72 0D                    1 	.word LINK 
                           003195     2 	LINK=.
      003195                          3 INPUT:
      00AA61 52                       4 	.byte 5   	
      00AA62 30 FB 72 16 00           5 	.ascii "INPUT"
      00AA67 23 8E                    6 	.word INPUT_IDX 
      00319D                       4534 	_dict_entry,2,IF,IF_IDX;if 
      00AA69 81 95                    1 	.word LINK 
                           00319F     2 	LINK=.
      00AA6A                          3 IF:
      00AA6A CD                       4 	.byte 2   	
      00AA6B 9A F1                    5 	.ascii "IF"
      00AA6D A1 84                    6 	.word IF_IDX 
      0031A4                       4535 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      00AA6F 27 03                    1 	.word LINK 
                           0031A6     2 	LINK=.
      0031A6                          3 IDR:
      00AA71 CC                       4 	.byte 3+F_IFUNC   	
      00AA72 96 EE 90                 5 	.ascii "IDR"
      00AA75 F6 93                    6 	.word IDR_IDX 
      0031AC                       4536 	_dict_entry,3,HEX,HEX_IDX;hex_base
      00AA77 EE 01                    1 	.word LINK 
                           0031AE     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



      0031AE                          3 HEX:
      00AA79 72                       4 	.byte 3   	
      00AA7A A9 00 03                 5 	.ascii "HEX"
      00AA7D 00 3A                    6 	.word HEX_IDX 
      0031B4                       4537 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      00AA7D CF 00                    1 	.word LINK 
                           0031B6     2 	LINK=.
      0031B6                          3 GOTO:
      00AA7F 13                       4 	.byte 4   	
      00AA80 CE 00 13 5D              5 	.ascii "GOTO"
      00AA84 27 03                    6 	.word GOTO_IDX 
      0031BD                       4538 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      00AA86 8F 26                    1 	.word LINK 
                           0031BF     2 	LINK=.
      0031BF                          3 GOSUB:
      00AA88 F7                       4 	.byte 5   	
      00AA89 47 4F 53 55 42           5 	.ascii "GOSUB"
      00AA89 81 36                    6 	.word GOSUB_IDX 
      00AA8A                       4539 	_dict_entry,3,GET,GET_IDX; cmd_get 
      00AA8A CD 9A                    1 	.word LINK 
                           0031C9     2 	LINK=.
      0031C9                          3 GET:
      00AA8C F1                       4 	.byte 3   	
      00AA8D A1 84 27                 5 	.ascii "GET"
      00AA90 03 CC                    6 	.word GET_IDX 
      0031CF                       4540 	_dict_entry,4+F_IFUNC,FREE,FREE_IDX;free
      00AA92 96 EE                    1 	.word LINK 
                           0031D1     2 	LINK=.
      0031D1                          3 FREE:
      00AA94 90                       4 	.byte 4+F_IFUNC   	
      00AA95 F6 93 EE 01              5 	.ascii "FREE"
      00AA99 72 A9                    6 	.word FREE_IDX 
      0031D8                       4541 	_dict_entry,3,FOR,FOR_IDX;for 
      00AA9B 00 03                    1 	.word LINK 
                           0031DA     2 	LINK=.
      00AA9D                          3 FOR:
      00AA9D A3                       4 	.byte 3   	
      00AA9E 14 00 2B                 5 	.ascii "FOR"
      00AAA1 0C 35                    6 	.word FOR_IDX 
      0031E0                       4542 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      00AAA3 0F 50                    1 	.word LINK 
                           0031E2     2 	LINK=.
      0031E2                          3 FCPU:
      00AAA5 F2                       4 	.byte 4   	
      00AAA6 A6 1E 62 A6              5 	.ascii "FCPU"
      00AAAA 10 62                    6 	.word FCPU_IDX 
      0031E9                       4543 	_dict_entry,5,ERASE,ERASE_IDX; erase 
      00AAAC 20 1E                    1 	.word LINK 
                           0031EB     2 	LINK=.
      00AAAE                          3 ERASE:
      00AAAE A3                       4 	.byte 5   	
      00AAAF 08 00 2B 09 35           5 	.ascii "ERASE"
      00AAB4 0E 50                    6 	.word ERASE_IDX 
      0031F3                       4544 	_dict_entry,3,END,END_IDX;cmd_end  
      00AAB6 F2 A6                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



                           0031F5     2 	LINK=.
      0031F5                          3 END:
      00AAB8 50                       4 	.byte 3   	
      00AAB9 62 20 10                 5 	.ascii "END"
      00AABC 00 2C                    6 	.word END_IDX 
      0031FB                       4545 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      00AABC 35 07                    1 	.word LINK 
                           0031FD     2 	LINK=.
      0031FD                          3 EEPROM:
      00AABE 50                       4 	.byte 6+F_IFUNC   	
      00AABF F2 45 50 52 4F 4D        5 	.ascii "EEPROM"
      00AAC0 00 2A                    6 	.word EEPROM_IDX 
      003206                       4546 	_dict_entry,6+F_IFUNC,EEFREE,EEFREE_IDX; func_eefree 
      00AAC0 A3 00                    1 	.word LINK 
                           003208     2 	LINK=.
      003208                          3 EEFREE:
      00AAC2 40                       4 	.byte 6+F_IFUNC   	
      00AAC3 23 07 72 5C 50 F2        5 	.ascii "EEFREE"
      00AAC9 54 20                    6 	.word EEFREE_IDX 
      003211                       4547 	_dict_entry,4,EDIT,EDIT_IDX ; edit 
      00AACB F4 08                    1 	.word LINK 
                           003213     2 	LINK=.
      00AACC                          3 EDIT:
      00AACC 9F                       4 	.byte 4   	
      00AACD 4A 27 01 4A              5 	.ascii "EDIT"
      00AAD1 00 28                    6 	.word EDIT_IDX 
      00321A                       4548 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      00AAD1 A4 3E                    1 	.word LINK 
                           00321C     2 	LINK=.
      00321C                          3 DWRITE:
      00AAD3 C7                       4 	.byte 6+F_CMD   	
      00AAD4 50 F1 72 18 50 F0        5 	.ascii "DWRITE"
      00AADA 8E 81                    6 	.word DWRITE_IDX 
      00AADC                       4549 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      00AADC C6 00                    1 	.word LINK 
                           003227     2 	LINK=.
      003227                          3 DREAD:
      00AADE 10                       4 	.byte 5+F_IFUNC   	
      00AADF CE 00 11 81 44           5 	.ascii "DREAD"
      00AAE3 00 24                    6 	.word DREAD_IDX 
      00322F                       4550 	_dict_entry,2,DO,DO_IDX;do_loop
      00AAE3 CD 99                    1 	.word LINK 
                           003231     2 	LINK=.
      003231                          3 DO:
      00AAE5 C1                       4 	.byte 2   	
      00AAE6 A1 01                    5 	.ascii "DO"
      00AAE8 27 03                    6 	.word DO_IDX 
      003236                       4551 	_dict_entry,3,DEC,DEC_IDX;dec_base
      00AAEA CC 96                    1 	.word LINK 
                           003238     2 	LINK=.
      003238                          3 DEC:
      00AAEC EE                       4 	.byte 3   	
      00AAED 44 45 43                 5 	.ascii "DEC"
      00AAED CD 82                    6 	.word DEC_IDX 
      00323E                       4552 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



      00AAEF 5F 90                    1 	.word LINK 
                           003240     2 	LINK=.
      003240                          3 DDR:
      00AAF1 F6                       4 	.byte 3+F_IFUNC   	
      00AAF2 93 EE 01                 5 	.ascii "DDR"
      00AAF5 72 A9                    6 	.word DDR_IDX 
      003246                       4553 	_dict_entry,4,DATA,DATA_IDX;data  
      00AAF7 00 03                    1 	.word LINK 
                           003248     2 	LINK=.
      003248                          3 DATA:
      00AAF9 81                       4 	.byte 4   	
      00AAFA 44 41 54 41              5 	.ascii "DATA"
      00AAFA CD 99                    6 	.word DATA_IDX 
      00324F                       4554 	_dict_entry,3+F_IFUNC,CR2,CR2_IDX;const_cr2 
      00AAFC C1 A1                    1 	.word LINK 
                           003251     2 	LINK=.
      003251                          3 CR2:
      00AAFE 02                       4 	.byte 3+F_IFUNC   	
      00AAFF 27 03 CC                 5 	.ascii "CR2"
      00AB02 96 EE                    6 	.word CR2_IDX 
      003257                       4555 	_dict_entry,3+F_IFUNC,CR1,CR1_IDX;const_cr1 
      00AB04 90 F6                    1 	.word LINK 
                           003259     2 	LINK=.
      003259                          3 CR1:
      00AB06 93                       4 	.byte 3+F_IFUNC   	
      00AB07 EE 01 72                 5 	.ascii "CR1"
      00AB0A A9 00                    6 	.word CR1_IDX 
      00325F                       4556 	_dict_entry,5,CONST,CONST_IDX; cmd_const 
      00AB0C 03 90                    1 	.word LINK 
                           003261     2 	LINK=.
      003261                          3 CONST:
      00AB0E 93                       4 	.byte 5   	
      00AB0F 90 F6 93 EE 01           5 	.ascii "CONST"
      00AB14 90 5D                    6 	.word CONST_IDX 
      003269                       4557 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      00AB16 27 07                    1 	.word LINK 
                           00326B     2 	LINK=.
      00326B                          3 CHAR:
      00AB18 98                       4 	.byte 4+F_CFUNC   	
      00AB19 59 49 90 5A              5 	.ascii "CHAR"
      00AB1D 26 F9                    6 	.word CHAR_IDX 
      003272                       4558 	_dict_entry,3,BYE,BYE_IDX;bye 
      00AB1F 90 F7                    1 	.word LINK 
                           003274     2 	LINK=.
      003274                          3 BYE:
      00AB21 90                       4 	.byte 3   	
      00AB22 EF 01 A6                 5 	.ascii "BYE"
      00AB25 84 81                    6 	.word BYE_IDX 
      00AB27                       4559 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      00AB27 CD 99                    1 	.word LINK 
                           00327C     2 	LINK=.
      00327C                          3 BTOGL:
      00AB29 C1                       4 	.byte 5   	
      00AB2A A1 02 27 03 CC           5 	.ascii "BTOGL"
      00AB2F 96 EE                    6 	.word BTOGL_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



      003284                       4560 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      00AB31 90 F6                    1 	.word LINK 
                           003286     2 	LINK=.
      003286                          3 BTEST:
      00AB33 93                       4 	.byte 5+F_IFUNC   	
      00AB34 EE 01 72 A9 00           5 	.ascii "BTEST"
      00AB39 03 90                    6 	.word BTEST_IDX 
      00328E                       4561 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      00AB3B 93 90                    1 	.word LINK 
                           003290     2 	LINK=.
      003290                          3 BSET:
      00AB3D F6                       4 	.byte 4   	
      00AB3E 93 EE 01 90              5 	.ascii "BSET"
      00AB42 5D 27                    6 	.word BSET_IDX 
      003297                       4562 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      00AB44 07 98                    1 	.word LINK 
                           003299     2 	LINK=.
      003299                          3 BRES:
      00AB46 56                       4 	.byte 4   	
      00AB47 46 90 5A 26              5 	.ascii "BRES"
      00AB4B F9 90                    6 	.word BRES_IDX 
      0032A0                       4563 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      00AB4D F7 90                    1 	.word LINK 
                           0032A2     2 	LINK=.
      0032A2                          3 BIT:
      00AB4F EF                       4 	.byte 3+F_IFUNC   	
      00AB50 01 A6 84                 5 	.ascii "BIT"
      00AB53 81 0A                    6 	.word BIT_IDX 
      00AB54                       4564 	_dict_entry,3,AWU,AWU_IDX;awu 
      00AB54 A6 84                    1 	.word LINK 
                           0032AA     2 	LINK=.
      0032AA                          3 AWU:
      00AB56 CD                       4 	.byte 3   	
      00AB57 99 B4 CD                 5 	.ascii "AWU"
      00AB5A 98 2E                    6 	.word AWU_IDX 
      0032B0                       4565 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      00AB5C 9F A4                    1 	.word LINK 
                           0032B2     2 	LINK=.
      0032B2                          3 ASC:
      00AB5E 07                       4 	.byte 3+F_IFUNC   	
      00AB5F C7 50 C6                 5 	.ascii "ASC"
      00AB62 81 06                    6 	.word ASC_IDX 
      00AB63                       4566 	_dict_entry,3+F_AND,AND,AND_IDX ; AND operator 
      00AB63 52 01                    1 	.word LINK 
                           0032BA     2 	LINK=.
      0032BA                          3 AND:
      00AB65 CD                       4 	.byte 3+F_AND   	
      00AB66 99 C6 A1                 5 	.ascii "AND"
      00AB69 02 27                    6 	.word AND_IDX 
      0032C0                       4567 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      00AB6B 03 CC                    1 	.word LINK 
                           0032C2     2 	LINK=.
      0032C2                          3 ADCREAD:
      00AB6D 96                       4 	.byte 7+F_IFUNC   	
      00AB6E EE 90 F6 93 EE 01 72     5 	.ascii "ADCREAD"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal  A9-Bits]



      00AB76 00 03                    6 	.word ADCREAD_IDX 
      0032CC                       4568 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      00AB78 CF 00                    1 	.word LINK 
                           0032CE     2 	LINK=.
      0032CE                          3 ADCON:
      00AB7A 1A                       4 	.byte 5   	
      00AB7B 90 F6 93 EE 01           5 	.ascii "ADCON"
      00AB80 72 A9                    6 	.word ADCON_IDX 
      0032D6                       4569 kword_dict::
      0032D6                       4570 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      00AB82 00 03                    1 	.word LINK 
                           0032D8     2 	LINK=.
      0032D8                          3 ABS:
      00AB84 CD                       4 	.byte 3+F_IFUNC   	
      00AB85 AB C2 6B                 5 	.ascii "ABS"
      00AB88 01 A6                    6 	.word ABS_IDX 
                                   4571 
                                   4572 ;comands and fonctions address table 	
      0032DE                       4573 code_addr::
      00AB8A 01 0D 01 27 0D 48 0A  4574 	.word abs,power_adc,analog_read,ascii,awu,bitmask ; 0..7
             01 26 FB 6B 01
      00AB96 7B 01 EA 03 E7 03 A6  4575 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             01 C1 00 0F 27 10 7B
      00ABA4 01 43 E4 04 E7 04 7B  4576 	.word const_cr1,data,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
             01 43 E4 02 E7 02 20
      00ABB2 0C 70 2D C5 25 30 27  4577 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto ; 24..31 
             2E 2A D4 27 CA 22 5A
             24 90 24 76
      00ABB3 1B FE 2D A7 22 3D 20  4578 	.word hex_base,const_idr,if,input_var,enable_iwdg,refresh_iwdg,key ; 32..39 
             7B 2C 99 2C D7 29 52
      00ABB3 7B 01 EA 02 E7 02 7B  4579 	.word let,list,log2,lshift,next,new ; 40..47
             01 EA 04 E7 04
      00ABBF 2D A2 2F 4C 29 EA 2A  4580 	.word const_odr,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             E3 22 1C 2D C0
      00ABBF 5B 01 81 BB 1F D8 2D  4581 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             75 2D 7A 2D 7F 2D 84
             2D 89
      00ABC2 2D 8E 2D 93 2D 98 2D  4582 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             9D 29 56 2E 48 00 C3
             21 1A
      00ABC2 58 1C AB D2 FE 9F 88  4583 	.word restore,return, random,rshift,run,free ; 72..79
             5E A6 05 42 1C
      00ABCE 50 00 84 81 2E 96 2F  4584 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             35 2F 0E 22 C4 26 D8
             2A 5C
      00ABD2 2C 77 2C 8E 22 84 25  4585 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             6F 1C 51 29 93 2D 42
             29 B0
      00ABD2 03 06 03 05 04 00 02  4586 	.word wait,words,write,cmd_size,cmd_on,cmd_get,cmd_const ; 96..99
             01 06 00 02 02 02 03
      00ABE0 03 01 03 03           4587 	.word func_eefree,0 
                                   4588 
                                   4589 
                                   4590 
                                   4591 
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
      00339C                         30 test:
      00339C                         31     _vars VSIZE 
      00ABE4 02 04            [ 2]    1     sub sp,#VSIZE 
      00ABE6 04 05 02         [ 2]   32     ldw x,#LOOP_CNT
      00ABE9 06 02            [ 2]   33     ldw (CNTR,sp),x  
      00ABEB 07 02 05         [ 2]   34     ldw x,ticks 
      00ABEE 04 02            [ 2]   35     ldw (T,sp),x
      0033A8                         36 1$: ; test add24 
      00ABF0 04 01            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00ABF2 AE FF FF         [ 2]   38     ldw x,#VAL1&0XFFFF
      00ABF2 CD 99 C1         [ 1]   39     ld acc24,a 
      00ABF5 A1 01 27         [ 2]   40     ldw acc24+1,x  
      00ABF8 03 CC            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00ABFA 96 EE FF         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00ABFC CD 01 6A         [ 4]   43     call add24 
      00ABFC 90 F6            [ 2]   44     ldw x,(CNTR,sp)
      00ABFE 93 EE 01         [ 2]   45     subw x,#1
      00AC01 72 A9            [ 2]   46     ldw (CNTR,sp),x 
      00AC03 00 03            [ 1]   47     jrne 1$
      00AC05 89 88 A6         [ 4]   48     call prt_acc24
      00AC08 80 15            [ 1]   49     ld a,#SPACE 
      00AC0A 01 27 05         [ 4]   50     call putc 
      00AC0D A6 0A CC         [ 2]   51     ldw x,ticks 
      00AC10 96 F0 01         [ 2]   52     subw x,(T,sp)
      00AC12 CD 17 C4         [ 4]   53     call prt_i16  
      00AC12 CE 00            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
Hexadecimal [24-Bits]



      00AC14 15 58 58         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00AC17 58 58 58         [ 2]   58     ldw x,LOOP_CNT
      00AC1A 9E C8            [ 2]   59     ldw (CNTR,sp),x 
      00AC1C 00 15 C7         [ 2]   60     ldw x,ticks 
      00AC1F 00 0E            [ 2]   61     ldw (T,sp),x 
      0033E4                         62 2$: 
      00AC21 9F C8            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00AC23 00 16 C7         [ 2]   64     ldw x,#VAL1&0XFFFF
      00AC26 00 0F CE         [ 1]   65     ld acc24,a 
      00AC29 00 17 CF         [ 2]   66     ldw acc24+1,x  
      00AC2C 00 15            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00AC2E CE 00 17         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00AC31 54 9E C8         [ 4]   69     call mul24 
      00AC34 00 17            [ 2]   70     ldw x,(CNTR,sp)
      00AC36 C7 00 17         [ 2]   71     subw x,#1
      00AC39 9F C8            [ 2]   72     ldw (CNTR,sp),x 
      00AC3B 00 18            [ 1]   73     jrne 2$ 
      00AC3D C7 00 18         [ 4]   74    call prt_acc24 
      00AC40 CE 00            [ 1]   75    ld a,#SPACE 
      00AC42 0E 54 54         [ 4]   76    call putc 
      00AC45 54 9E C8         [ 2]   77     ldw x,ticks 
      00AC48 00 0E C7         [ 2]   78     subw x,(T,sp)
      00AC4B 00 0E 9F         [ 4]   79     call prt_i16 
      00AC4E C8 00            [ 1]   80     ld a,#CR 
      00AC50 0F C7 00         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00AC53 0F C8 00         [ 2]   83     ldw x,LOOP_CNT
      00AC56 18 97            [ 2]   84     ldw (CNTR,sp),x 
      00AC58 C6 00 0E         [ 2]   85     ldw x,ticks 
      00AC5B C8 00            [ 2]   86     ldw (T,sp),x 
      003420                         87 3$: 
      00AC5D 17 95            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00AC5F CF 00 17         [ 2]   89     ldw x,#VAL1&0XFFFF
      00AC62 C6 00 16         [ 1]   90     ld acc24,a 
      00AC65 A4 7F 72         [ 2]   91     ldw acc24+1,x  
      00AC68 A2 00            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00AC6A 03 90 F7         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00AC6D 90 EF 01         [ 4]   94     call mul24 
      00AC70 84 85            [ 2]   95     ldw x,(CNTR,sp)
      00AC72 72 A2 00         [ 2]   96     subw x,#1
      00AC75 03 90            [ 2]   97     ldw (CNTR,sp),x 
      00AC77 F7 90            [ 1]   98     jrne 3$ 
      00AC79 EF 01 CD         [ 4]   99     call prt_acc24    
      00AC7C 84 21            [ 1]  100     ld a,#SPACE 
      00AC7E 90 F6 93         [ 4]  101     call putc 
      00AC81 EE 01 72         [ 2]  102     ldw x,ticks 
      00AC84 A9 00 03         [ 2]  103     subw x,(T,sp)
      00AC87 1C 00 01         [ 4]  104     call prt_i16 
      00AC8A A9 00            [ 1]  105     ld a,#CR 
      00AC8C 81 09 10         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00AC8D CE 27 10         [ 2]  108     ldw x,LOOP_CNT
      00AC8D 90 89            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



      00AC8F 52 03 0F         [ 2]  110     ldw x,ticks 
      00AC92 02 0F            [ 2]  111     ldw (T,sp),x 
      00345C                        112 4$:
      00AC94 03 90            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00AC96 AE B3 58         [ 2]  114     ldw x,#VAL1&0XFFFF
      00AC99 93 F6 A4         [ 1]  115     ld acc24,a 
      00AC9C 0F 6B 01         [ 2]  116     ldw acc24+1,x  
      00AC9F 0C 03            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00ACA1 5C F6 CD         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00ACA4 89 90 0C         [ 4]  119     call mul24 
      00ACA7 02 0A            [ 2]  120     ldw x,(CNTR,sp)
      00ACA9 01 26 F5         [ 2]  121     subw x,#1
      00ACAC A6 46            [ 2]  122     ldw (CNTR,sp),x 
      00ACAE 11 02            [ 1]  123     jrne 4$ 
      00ACB0 2B 09 A6         [ 4]  124     call prt_acc24 
      00ACB3 20 CD            [ 1]  125     ld a,#SPACE 
      00ACB5 89 90 0C         [ 4]  126     call putc 
      00ACB8 02 20 07         [ 2]  127     ldw x,ticks 
      00ACBB A6 0D CD         [ 2]  128     subw x,(T,sp)
      00ACBE 89 90 0F         [ 4]  129     call prt_i16 
      00ACC1 02 72            [ 1]  130     ld a,#CR 
      00ACC3 A2 00 02         [ 4]  131     call putc 
                                    132 ; test abs24 
      00ACC6 90 FE 26         [ 2]  133     ldw x,LOOP_CNT
      00ACC9 CF A6            [ 2]  134     ldw (CNTR,sp),x 
      00ACCB 0D CD 89         [ 2]  135     ldw x,ticks 
      00ACCE 90 5F            [ 2]  136     ldw (T,sp),x 
      003498                        137 5$: 
      00ACD0 7B 03            [ 1]  138     ld a,#0xff
      00ACD2 97 CD 98         [ 2]  139     ldw x,#0xffff
      00ACD5 44 AE AC         [ 4]  140     call abs24 
      00ACD8 E1 CD 89         [ 1]  141     ld acc24,a 
      00ACDB ED 5B 03         [ 2]  142     ldw acc24+1,x
      00ACDE 90 85            [ 2]  143     ldw x,(CNTR,sp)
      00ACE0 81 20 77         [ 2]  144     subw x,#1
      00ACE3 6F 72            [ 2]  145     ldw (CNTR,sp),x 
      00ACE5 64 73            [ 1]  146     jrne 5$ 
      00ACE7 20 69 6E         [ 4]  147     call prt_acc24 
      00ACEA 20 64            [ 1]  148     ld a,#SPACE 
      00ACEC 69 63 74         [ 4]  149     call putc 
      00ACEF 69 6F 6E         [ 2]  150     ldw x,ticks 
      00ACF2 61 72 79         [ 2]  151     subw x,(T,sp)
      00ACF5 0A 00 C4         [ 4]  152     call prt_i16 
      00ACF7                        153 6$:
      00ACF7 CD 99            [ 1]  154     ld a,#CR 
      00ACF9 C6 A1 01         [ 4]  155     call putc 
      00ACFC 27 03 CC         [ 4]  156     call read_integer 
      00ACFF 96 EE 0C 00 18   [ 1]  157     mov farptr,acc24 
      00AD01 55 00 0D 00 19   [ 1]  158     mov farptr+1,acc16 
      00AD01 90 F6 93 EE 01   [ 1]  159     mov farptr+2,acc8 
      00AD06 72 A9 00         [ 4]  160     call read_integer 
      00AD09 03 CF 00         [ 1]  161     ld a,acc24 
      00AD0C 13 81 0D         [ 2]  162     ldw x,acc16 
      00AD0E 55 00 18 00 0C   [ 1]  163     mov acc24,farptr 
      00AD0E 4F CE 00 13 27   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
Hexadecimal [24-Bits]



      00AD13 02 5F 81 43 53   [ 1]  165     mov acc8,farptr+2 
      00AD18 81 02 F3         [ 4]  166     call div24 
      00AD19 88               [ 1]  167     push a 
      00AD19 CD               [ 2]  168     pushw x 
      00AD1A 99 C6 A1         [ 4]  169     call prt_acc24 
      00AD1D 01 27            [ 1]  170     ld a,#SPACE 
      00AD1F 03 CC 96         [ 4]  171     call putc 
      00AD22 EE               [ 2]  172     popw x
      00AD23 90 F6 93         [ 2]  173     ldw acc16,x  
      00AD26 EE 01 72         [ 1]  174     pop acc24 
      00AD29 A9 00 03         [ 4]  175     call prt_acc24
      00AD2C 4B 00            [ 2]  176     jra 6$
      003508                        177     _drop VSIZE 
      00AD2E 35 CC            [ 2]    1     addw sp,#VSIZE 
      00AD30 50               [ 4]  178     ret 
                                    179 
                                    180 
      00350B                        181 read_integer:
      00AD31 E0 9E            [ 1]  182     ld a,#'? 
      00AD33 A4 3F 95         [ 4]  183     call putc  
      00AD36 A3 00 FF 23      [ 1]  184 	clr count  
      00AD3A 06 0C 01         [ 4]  185 	call readln 
      00AD3D 98 56 20         [ 2]  186 	ldw x,#tib 
      00AD40 F5 35 55         [ 1]  187 	push count
      00AD43 50 E0            [ 1]  188 	push #0 
      00AD45 84 C7 50         [ 2]  189 	addw x,(1,sp)
      00AD48 E1               [ 1]  190 	incw x 
      003523                        191 	_drop 2 
      00AD49 9F 4A            [ 2]    1     addw sp,#2 
      00AD4B 35 55 50 E0      [ 1]  192 	clr in 
      00AD4F C7 50 E2         [ 4]  193 	call get_token
      00AD52 35 AA            [ 1]  194 	cp a,#TK_INTGR
      00AD54 50 E0            [ 1]  195 	jreq 3$ 
      00AD56 81 11            [ 1]  196 	cp a,#TK_MINUS
      00AD57 CD 0E E7         [ 4]  197 	call get_token 
      00AD57 35 AA            [ 1]  198 	cp a,#TK_INTGR 
      00AD59 50 E0            [ 1]  199 	jreq 2$
      00AD5B 81 16 6E         [ 2]  200 	jp syntax_error
      00AD5C                        201 2$:
      00AD5C CD 99 C1         [ 4]  202 	call neg_acc24  	
      00353F                        203 3$: 
      00AD5F A1               [ 4]  204     ret 
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
      00AD60 01 27                   31 app_sign:  .word 0 ; .ascii "BC"  ; signature 
      00AD62 03 CC                   32 app_size: .word 0 
      003584                         33 app: 
                                     34 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     A32     =  000005     |   4 ABS        0032D8 R
    ABS_IDX =  000000     |     ACK     =  000006     |   4 ADCON      0032CE R
    ADCON_ID=  000002     |   4 ADCREAD    0032C2 R   |     ADCREAD_=  000004 
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
  4 AND        0032BA R   |     AND_IDX =  0000FA     |     ARG_OFS =  000002 
    ARROW_LE=  000080     |     ARROW_RI=  000081     |   4 ASC        0032B2 R
    ASC_IDX =  000006     |     ATMP    =  000001     |     ATTRIB  =  000002 
  4 AUTO_RUN   000157 R   |   4 AWU        0032AA R   |   4 AWUHandl   000004 R
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
    BELL    =  000007     |     BINARY  =  000001     |   4 BIT        0032A2 R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000A 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  00000D     |   4 BRES       003299 R   |     BRES_IDX=  00000C 
    BS      =  000008     |   4 BSET       003290 R   |     BSET_IDX=  00000E 
    BSIZE   =  000006     |   4 BTEST      003286 R   |     BTEST_ID=  000010 
  4 BTOGL      00327C R   |     BTOGL_ID=  000012     |     BTW     =  000001 
    BUFPTR  =  000003     |   4 BYE        003274 R   |     BYE_IDX =  000014 
    C       =  000001     |     CAN     =  000018     |   4 CANT_DO    002861 R
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
  4 CHAR       00326B R   |     CHAR_IDX=  000016     |     CLKOPT  =  004807 
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
  4 CONST      003261 R   |   4 CONST_CO   001D04 R   |     CONST_ID=  0000B8 
    CONST_RE=  000005     |     COUNT   =  000003     |     CPOS    =  000003 
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |     CR      =  00000D 
  4 CR1        003259 R   |     CR1_IDX =  00001A     |   4 CR2        003251 R
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
  4 DATA       003248 R   |     DATA_IDX=  00001C     |     DBG_A   =  000008 
    DBG_CC  =  000009     |     DBG_X   =  000006     |     DBG_Y   =  000004 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   4 DDR        003240 R   |     DDR_IDX =  00001E 
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  4 DEC        003238 R   |     DEC_IDX =  000020     |     DEST    =  000001 
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |     DIVISOR =  000001 
    DIVSOR  =  000001     |     DLE     =  000010     |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   4 DO         003231 R   |     DOLP_ADR=  000003 
    DOLP_INW=  000005     |     DO_IDX  =  000022     |   4 DREAD      003227 R
    DREAD_ID=  000024     |   4 DWRITE     00321C R   |     DWRITE_I=  000026 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 234.
Hexadecimal [24-Bits]

Symbol Table

  4 EDIT       003213 R   |     EDIT_IDX=  000028     |   4 EEFREE     003208 R
    EEFREE_I=  0000BA     |   4 EEPROM     0031FD R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_I=  00002A     |     EEPROM_S=  000800 
    EEPTR   =  000003     |     EM      =  000019     |   4 END        0031F5 R
    END_IDX =  00002C     |     ENQ     =  000005     |     EOF     =  0000FF 
    EOT     =  000004     |   4 ERASE      0031EB R   |     ERASE_ID=  00002E 
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_OVER=  000010 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    ETB     =  000017     |     ETX     =  000003     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FBREAK  =  000004     |     FCOMP   =  000005 
  4 FCPU       0031E2 R   |     FCPU_IDX=  000030     |     FF      =  00000C 
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
  4 FLASH_ME   001EAB R   |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |     FLOOP   =  000002 
    FLSI    =  01F400     |   4 FOR        0031DA R   |     FOR_IDX =  000034 
  4 FREE       0031D1 R   |     FREE_IDX=  00008A     |     FRUN    =  000000 
    FS      =  00001C     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_AND   =  000080     |     F_CFUNC =  000020 
    F_CMD   =  000000     |     F_CONST =  000030     |     F_IFUNC =  000010 
    F_NOT   =  000070     |     F_OR    =  000090     |     F_XOR   =  0000A0 
  4 GET        0031C9 R   |     GET_IDX =  0000B6     |   4 GOSUB      0031BF R
    GOSUB_ID=  000036     |   4 GOTO       0031B6 R   |     GOTO_IDX=  000038 
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |     GS      =  00001D     |   4 HEX        0031AE R
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
  4 IDR        0031A6 R   |     IDR_IDX =  00003C     |   4 IF         00319F R
    IF_IDX  =  00003E     |     IN      =  000005     |     INCR    =  000001 
    INP     =  000000     |   4 INPUT      003195 R   |     INPUT_DI=  000000 
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
    ITC_SPR8=  007F77     |   4 IWDGEN     00318A R   |     IWDGEN_I=  000042 
  4 IWDGREF    00317E R   |     IWDGREF_=  000044     |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |     KCHAR   =  000002 
  4 KEY        003176 R   |     KEY_END =  000083     |     KEY_IDX =  000046 
    KW_TYPE_=  0000F0     |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000002     |   4 LET        00316E R   |     LET_IDX =  000048 
    LF      =  00000A     |     LIMIT   =  000001     |     LINENO  =  000005 
  4 LINK    =  0032D8 R   |   4 LIST       003165 R   |     LIST_IDX=  00004A 
    LL      =  000001     |     LLEN    =  000002     |     LL_HB   =  000001 
    LN_PTR  =  000005     |   4 LOG2       00315C R   |     LOG_IDX =  00004C 
    LOOP_CNT=  002710     |   4 LSHIFT     003151 R   |     LSHIFT_I=  00004E 
    MAJOR   =  000002     |     MASK    =  000002     |     MAX_LINE=  007FFF 
    MINOR   =  000000     |     MULOP   =  000001     |     N1      =  000005 
    NAFR    =  004804     |     NAK     =  000015     |     NAMEPTR =  000001 
    NCLKOPT =  004808     |     NEG     =  000001     |   4 NEW        003149 R
    NEW_IDX =  000052     |   4 NEXT       003140 R   |     NEXT_IDX=  000050 
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NLEN    =  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 236.
Hexadecimal [24-Bits]

Symbol Table

    NLEN_MAS=  00000F     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  4 NOT        003138 R   |     NOT_IDX =  0000F8     |     NOT_OP  =  000001 
  4 NOT_SAVE   001F9D R   |   4 NO_APP     0028A3 R   |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   4 NonHandl   000000 R
  4 ODR        003130 R   |     ODR_IDX =  000054     |   4 ON         003129 R
    ONOFF   =  000003     |     ON_IDX  =  0000B4     |     OP      =  000002 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   4 OR         003122 R   |     OR_IDX  =  0000FC 
    OUTP    =  000001     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVRWR   =  000004 
    PA      =  000000     |   4 PAD        00311A R   |     PAD_IDX =  000056 
    PAD_SIZE=  000080     |   4 PAUSE      003110 R   |     PAUSE_ID=  000058 
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   4 PEEK       003107 R   |     PEEK_IDX=  00005C 
    PE_BASE =  005014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_BASE =  005019     |     PF_CR1  =  00501C 
    PF_CR2  =  00501D     |     PF_DDR  =  00501B     |     PF_IDR  =  00501A 
    PF_ODR  =  005019     |     PG      =  00001E     |     PG_BASE =  00501E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |     PH      =  000023 
    PH_BASE =  005023     |     PH_CR1  =  005026     |     PH_CR2  =  005027 
    PH_DDR  =  005025     |     PH_IDR  =  005024     |     PH_ODR  =  005023 
    PI      =  000028     |     PINNO   =  000001     |   4 PINP       0030FE R
    PINP_IDX=  00005E     |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   4 PMODE      0030F4 R
    PMODE_ID=  00005A     |   4 POKE       0030EB R   |     POKE_IDX=  000060 
  4 PORTA      0030CE R   |   4 PORTB      0030C4 R   |   4 PORTC      0030BA R
  4 PORTD      0030B0 R   |   4 PORTE      0030A6 R   |   4 PORTF      00309C R
  4 PORTG      003092 R   |   4 PORTH      003088 R   |   4 PORTI      00307E R
  4 POUT       0030E2 R   |     POUT_IDX=  000062     |     PREV    =  000001 
  4 PRINT      0030D8 R   |     PROD    =  000001     |     PROD_SIG=  000004 
  4 PROG_ADD   001E81 R   |   4 PROG_SIZ   001E93 R   |     PRTA_IDX=  000066 
    PRTB_IDX=  000068     |     PRTC_IDX=  00006A     |     PRTD_IDX=  00006C 
    PRTE_IDX=  00006E     |     PRTF_IDX=  000070     |     PRTG_IDX=  000072 
    PRTH_IDX=  000074     |     PRTI_IDX=  000076     |     PRT_IDX =  000064 
    PSIZE   =  000001     |     PSTR    =  000003     |   4 QKEY       003075 R
    QKEY_IDX=  000078     |     QSIGN   =  000005     |     RAM_BASE=  000000 
    RAM_END =  0017FF     |   4 RAM_MEM    001EBC R   |     RAM_SIZE=  001800 
    RBT_IDX =  00007C     |   4 READ       00306C R   |     READ_IDX=  00007A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
Hexadecimal [24-Bits]

Symbol Table

  4 REBOOT     003061 R   |     RECLEN  =  000005     |   4 REG_A      00052E R
  4 REG_CC     000532 R   |   4 REG_EPC    000521 R   |   4 REG_SP     000537 R
  4 REG_X      00052A R   |   4 REG_Y      000526 R   |     RELOP   =  000001 
  4 REM        003059 R   |     REM_IDX =  00007E     |   4 RESTORE    00304D R
    REST_IDX=  000080     |     RETL1   =  000001     |   4 RETURN     003042 R
    RET_ADDR=  000003     |     RET_BPTR=  000003     |     RET_IDX =  000082 
    RET_INW =  000005     |   4 RND        00303A R   |     RND_IDX =  000084 
    ROP     =  004800     |     RS      =  00001E     |   4 RSHIFT     00302F R
    RSHIFT_I=  000086     |     RSIGN   =  000006     |     RST_SR  =  0050B3 
  4 RUN        003027 R   |     RUN_IDX =  000088     |     RXCHAR  =  000001 
    RX_QUEUE=  000008     |     R_A     =  000007     |     R_CC    =  000008 
    R_X     =  000005     |     R_Y     =  000003     |   4 SAVE       00301E R
    SAVE_IDX=  000032     |     SEPARATE=  000000     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |     SI      =  00000F 
    SIGN    =  000001     |   4 SIGNATUR   00285F R   |   4 SIZE       003015 R
    SIZE_IDX=  0000B2     |     SKIP    =  000005     |   4 SLEEP      00300B R
    SLEEP_ID=  00008C     |     SO      =  00000E     |     SOH     =  000001 
    SPACE   =  000020     |   4 SPIEN      003001 R   |     SPIEN_ID=  000090 
  4 SPIRD      002FF7 R   |     SPIRD_ID=  00008E     |   4 SPISEL     002FEC R
    SPISEL_I=  000092     |   4 SPIWR      002FE2 R   |     SPIWR_ID=  000094 
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
    STACK_EM=  0017FF     |     STACK_SI=  00008C     |   4 STATES     0004E4 R
  4 STEP       002FD9 R   |     STEP_IDX=  000096     |   4 STOP       002FD0 R
    STOP_IDX=  000098     |     STR     =  000003     |   4 STR_BYTE   001EA4 R
    STX     =  000002     |     SUB     =  00001A     |     SUP     =  000084 
    SWIM_CSR=  007F80     |     SYN     =  000016     |     T       =  000001 
    TAB     =  000009     |     TABW    =  000004     |     TAB_WIDT=  000004 
    TARGET  =  000001     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   4 TICKS      002FC6 R
    TICKS_ID=  00009A     |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
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
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000003 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_CR1=  000001     |     TIM4_CR1=  000002     |     TIM4_EGR=  005343 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_EGR=  000000     |     TIM4_IER=  005341     |     TIM4_IER=  000000 
    TIM4_PSC=  005345     |     TIM4_PSC=  000000     |     TIM4_PSC=  000007 
    TIM4_PSC=  000004     |     TIM4_PSC=  000001     |     TIM4_PSC=  000005 
    TIM4_PSC=  000002     |     TIM4_PSC=  000006     |     TIM4_PSC=  000003 
    TIM4_PSC=  000000     |     TIM4_PSC=  000001     |     TIM4_PSC=  000002 
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   4 TIMEOUT    002FBA R
  4 TIMER      002FB0 R   |     TIMER_ID=  00009C     |     TIM_CR1_=  000007 
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
    TK_VAR  =  000085     |     TK_XOR  =  00008A     |     TMROUT_I=  00009E 
  4 TO         002FA9 R   |   4 TONE       002FA0 R   |     TONE_IDX=  0000A2 
    TOWRITE =  000005     |     TO_IDX  =  0000A0     |   4 Timer4Up   000021 R
  4 TrapHand   000012 R   |     U8      =  000001     |     UART1   =  000000 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 240.
Hexadecimal [24-Bits]

Symbol Table

    UART_SR_=  000007     |     UBC     =  004801     |   4 UBOUND     002F95 R
    UBOUND_I=  0000A4     |   4 UBTN_Han   000068 R   |   4 UFLASH     002F8A R
    UFLASH_I=  0000A6     |   4 UNTIL      002F80 R   |     UNTIL_ID=  0000A8 
    UPDATE  =  000006     |     US      =  00001F     |   4 USER_ABO   000070 R
  4 USR        002F78 R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     USR_IDX =  0000AA     |   4 Uart1RxH   00089E R
  4 UserButt   000044 R   |     VAL1    =  02FFFF     |     VAL2    =  00002A 
    VAL3    =  000003     |     VAL4    =  0005FF     |     VAL5    =  FFFFFFFD 
    VSIZE   =  000008     |     VT      =  00000B     |   4 WAIT       002F6F R
    WAIT_IDX=  0000AC     |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  4 WORDS      002F65 R   |     WORDS_ID=  0000AE     |   4 WRITE      002F5B R
    WRITE_ID=  0000B0     |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XFIRST  =  000001     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   4 XOR        002F53 R   |     XOR_IDX =  0000FE 
    XSAVE   =  000002     |     XSTACK_E=  001773     |     XSTACK_S=  00003C 
    XTEMP   =  000001     |     YSAVE   =  000007     |     YTEMP   =  000003 
  4 abs        002A63 R   |   4 abs24      0001DF R   |   5 acc16      00000D GR
  5 acc24      00000C GR  |   5 acc32      00000B GR  |   5 acc8       00000E GR
  4 accept_c   000BCC R   |   4 add24      00016A R   |   4 add_char   00135E R
  4 add_spac   00112F R   |   4 analog_r   00261A R   |   4 and_cond   001B38 R
  4 and_fact   001B08 R   |   4 app        003584 R   |   4 app_sign   003580 R
  4 app_size   003582 R   |   4 app_spac   003580 GR  |   4 arduino_   002B52 R
  4 arg_list   001946 R   |   5 array_si   000020 R   |   4 ascii      002913 R
  4 at_tst     000FA1 R   |   4 atoi24     001866 GR  |   4 atoi_exi   0018D7 R
  4 awu        002A0A R   |   4 awu02      002A1D R   |   4 bad_port   00298E R
  5 base       00000A GR  |   5 basicptr   000004 GR  |   4 beep       002591 R
  4 beep_1kh   002564 GR  |   4 bin_exit   000E08 R   |   4 bit_rese   00217F R
  4 bit_set    00215D R   |   4 bit_test   0021C4 R   |   4 bit_togg   0021A2 R
  4 bitmask    002D09 R   |   4 bkslsh_t   000F4E R   |   4 bksp       000977 R
  2 block_bu   0016B8 GR  |   4 block_er   00078C R   |   4 break_po   002706 R
  4 bye        0029D6 R   |   4 char       0028FC R   |   4 clear_ba   0014CA R
  4 clear_bl   0027B6 R   |   4 clear_va   001422 R   |   4 clock_in   00008B R
  4 cloop_1    001DAD R   |   4 cmd_cons   001D87 R   |   4 cmd_end    002530 R
  4 cmd_get    002537 R   |   4 cmd_itf    00053C R   |   4 cmd_line   0016FD R
  4 cmd_name   00137E R   |   4 cmd_on     0023EA R   |   4 cmd_size   001C24 R
  4 code_add   0032DE GR  |   4 cold_sta   0000C3 R   |   4 colon_ts   000F75 R
  4 comma_ts   000F80 R   |   4 comp_msg   00164D R   |   4 compile    00109B GR
  4 conditio   001B8A R   |   4 const_cr   002DB1 R   |   4 const_cr   002DB6 R
  4 const_dd   002DAC R   |   4 const_ee   002DC5 R   |   4 const_id   002DA7 R
  4 const_in   002DC0 R   |   4 const_lo   001DA8 R   |   4 const_od   002DA2 R
  4 const_ou   002DBB R   |   4 const_po   002D75 R   |   4 const_po   002D7A R
  4 const_po   002D7F R   |   4 const_po   002D84 R   |   4 const_po   002D89 R
  4 const_po   002D8E R   |   4 const_po   002D93 R   |   4 const_po   002D98 R
  4 const_po   002D9D R   |   4 convert_   000D78 R   |   4 convert_   00093B R
  4 copy_com   000FD6 R   |   5 count      000003 GR  |   4 cp24       0001A4 R
  4 cp24_ax    0001D6 R   |   4 cp_loop    0018F7 R   |   4 cpl24      0001E6 R
  4 cpy_cmd_   001117 R   |   4 cpy_quot   001157 R   |   4 create_g   000CA2 R
  4 cs_high    002F47 R   |   4 dash_tst   000F96 R   |   4 data       002DCA R
  4 data_err   002E43 R   |   5 data_len   000009 R   |   5 data_ofs   000008 R
  5 data_ptr   000006 R   |   4 dec_base   001C03 R   |   4 decomp_l   001210 R
  4 decompil   0011C8 GR  |   4 del_line   000C75 R   |   4 delete_l   000A64 R
  4 delete_n   000987 R   |   4 delete_u   000A29 R   |   4 digital_   002656 R
  4 digital_   00268D R   |   4 div24      0002F3 R   |   4 divu24_8   0002D5 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
Hexadecimal [24-Bits]

Symbol Table

  4 do_loop    002D2F R   |   4 do_progr   00077F R   |   4 edit       001F70 R
  4 enable_i   002C99 R   |   4 eql_tst    001021 R   |   4 equal      001371 R
  4 erase      00272E R   |   4 erase_ex   0007B0 R   |   4 erase_fl   0007A6 R
  4 err_bad_   0015AE R   |   4 err_buf_   001624 R   |   4 err_cmd_   001572 R
  4 err_div0   001537 R   |   4 err_dupl   00158C R   |   4 err_math   00151E R
  4 err_mem_   001503 R   |   4 err_msg    0014E1 R   |   4 err_no_a   0015BA R
  4 err_no_d   0015ED R   |   4 err_no_f   001611 R   |   4 err_no_l   001546 R
  4 err_no_p   0015FD R   |   4 err_not_   00159D R   |   4 err_over   001631 R
  4 err_run_   00155C R   |   4 err_synt   001510 R   |   4 escaped    000D8D GR
  4 expect     001934 R   |   4 expressi   001A71 R   |   4 factor     001992 R
  5 farptr     000018 R   |   4 fcpu       002AD4 R   |   4 fetchc     00062C R
  4 fill_wri   0027A6 R   |   4 final_te   000BC5 R   |   4 first_li   001F1A R
  5 flags      000022 GR  |   4 for        00225A R   |   4 free       001C08 R
  5 free_eep   000024 R   |   7 free_ram   000080 R   |   4 func_arg   001941 R
  4 func_eef   001D1A R   |   4 ge         001373 R   |   4 get_addr   0017A4 R
  4 get_arra   001962 R   |   4 get_char   0017BE R   |   4 get_cmd_   0011A7 R
  4 get_code   001788 R   |   4 get_cons   001C9F R   |   4 get_esca   000947 R
  4 get_int2   0017AE R   |   4 get_targ   00237B R   |   4 get_targ   002389 R
  4 get_tick   002A5C R   |   4 get_toke   000EE7 GR  |   4 getc       000920 GR
  4 gosub      002490 R   |   4 gosub_1    00249B R   |   4 gosub_2    0024A1 R
  4 goto       002476 R   |   4 goto_1     002480 R   |   4 gpio       002963 R
  4 gt         00136F R   |   4 gt_tst     00102C R   |   4 hex_base   001BFE R
  4 hex_dump   00066C R   |   4 if         00223D R   |   5 in         000001 GR
  5 in.saved   000002 GR  |   5 in.w       000000 GR  |   4 incr_far   000882 R
  4 input_ex   002115 R   |   4 input_lo   00207F R   |   4 input_va   00207B R
  4 insert_c   0009E6 R   |   4 insert_l   000CCE R   |   4 insert_l   000D3D R
  4 interp_l   00173E R   |   4 interpre   001719 R   |   4 invalid    000581 R
  4 invalid_   000602 R   |   4 is_alnum   000E3B GR  |   4 is_alpha   000E21 GR
  4 is_data_   002DD0 R   |   4 is_digit   000E32 GR  |   4 is_symbo   000E44 R
  4 itoa       001801 GR  |   4 itoa_loo   001823 R   |   4 jp_to_ta   002483 R
  4 key        002952 R   |   4 kword_di   0032D6 GR  |   4 kword_en   002F51 R
  4 le         001378 R   |   4 ledoff     000437 R   |   4 ledon      000432 R
  4 ledtoggl   00043C R   |   4 left_par   000445 R   |   4 let        001C5C GR
  4 let_arra   001C6A R   |   4 let_eval   001C72 R   |   4 let_var    001C6F R
  4 lines_sk   001F1D R   |   4 list       001ECB R   |   4 list_con   001CAE R
  4 list_exi   001F5F R   |   4 list_loo   001F3D R   |   4 log2       002CDC R
  4 look_tar   0023AC R   |   4 loop_bac   00235E R   |   5 loop_dep   00001F R
  4 loop_don   002373 R   |   4 lshift     002A7A R   |   4 lt         001376 R
  4 lt_tst     001055 R   |   4 mem_peek   00059E R   |   4 mod24      0003A1 R
  4 move       0013DE GR  |   4 move_dow   0013FD R   |   4 move_era   00070E R
  4 move_exi   00141E R   |   4 move_lef   0009BE R   |   4 move_loo   001402 R
  4 move_prg   00074E R   |   4 move_rig   0009CC R   |   4 move_up    0013EF R
  4 mul24      000265 R   |   4 mul_char   001360 R   |   4 mulu24_8   000226 R
  4 nbr_tst    000F1A R   |   4 ne         00137B R   |   4 neg24      0001EF R
  4 neg_acc2   000209 R   |   4 neg_ax     000201 R   |   4 new        002724 R
  4 next       002306 R   |   4 next_lin   001721 R   |   4 next_tok   00176F GR
  4 no_match   001909 R   |   4 number     000632 R   |   4 other      00107E R
  4 overwrit   000BF1 R   |   2 pad        0016B8 GR  |   4 pad_ref    002F4C R
  4 parse_bi   000DE6 R   |   4 parse_in   000D95 R   |   4 parse_ke   000E67 R
  4 parse_qu   000D40 R   |   4 parse_sy   000E4F R   |   4 pause      0029EA R
  4 pause02    0029FD R   |   4 peek       00221C R   |   4 peek_byt   0005CC R
  4 pin_mode   002AE3 R   |   4 plus_tst   000FF5 R   |   4 poke       0021FB R
  4 power_ad   0025CA R   |   4 prcnt_ts   001016 R   |   4 print      001FD8 R
  4 print_fa   000611 R   |   4 print_he   000C28 GR  |   4 print_re   000491 R
  4 print_st   000591 R   |   4 print_to   0017E9 R   |   4 prog_siz   001E3A R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Symbol Table

  4 program_   001E42 R   |   4 program_   000728 R   |   4 program_   00074E R
  4 prt_acc2   0017DB R   |   4 prt_basi   001FB4 R   |   4 prt_i16    0017C4 R
  4 prt_loop   001FDC R   |   4 prt_peek   000414 GR  |   4 prt_reg1   000472 R
  4 prt_reg8   000450 R   |   4 prt_regs   0003AA GR  |   5 ptr16      000019 GR
  5 ptr8       00001A R   |   4 putc       000910 GR  |   4 puts       00096D GR
  4 qgetc      000919 GR  |   4 qkey       002956 GR  |   4 qmark_ts   000FAC R
  4 qsign      00279F R   |   4 random     002B72 R   |   4 read       002E48 R
  4 read01     002E4D R   |   4 read_int   00350B R   |   4 readln     000A72 GR
  4 readln_l   000A81 R   |   4 readln_q   000C0E R   |   4 refresh_   002CD7 R
  4 regs_sta   0003ED R   |   4 relation   001AA9 R   |   4 relop_st   001363 R
  4 remark     00211A GR  |   4 repl       00054A R   |   4 repl_exi   000572 R
  4 reset_co   001FDA R   |   4 rest_con   00206B R   |   4 restore    002DDE R
  4 return     0024B6 R   |   4 right_al   001145 GR  |   4 row_alig   000867 R
  4 row_eras   0006E1 R   |   4 row_eras   00070E R   |   4 row_loop   00064F R
  4 rparnt_t   000F6A R   |   4 rshift     002AA7 R   |   7 rsign      00007C R
  7 rsize      00007E R   |   4 rt_msg     00163B R   |   4 run        0024D4 R
  4 run_app    000135 R   |   4 run_it     002506 R   |   4 run_it_0   002508 R
  5 rx1_head   00002E R   |   5 rx1_queu   000026 R   |   5 rx1_tail   00002F R
  4 save_app   0027CA R   |   4 save_con   00205B R   |   4 scan_blo   000890 R
  4 search_c   001D43 R   |   4 search_d   0018E9 GR  |   4 search_e   001931 R
  4 search_l   000C4A GR  |   4 search_l   000C59 R   |   4 search_n   0018ED R
  5 seedx      000014 R   |   5 seedy      000016 R   |   4 select_p   002B42 R
  4 send_esc   000995 R   |   4 send_par   0009A0 R   |   4 set_data   002E14 R
  4 set_time   002C77 R   |   4 sharp_ts   000F8B R   |   4 show_row   00063D R
  4 single_c   001359 R   |   4 skip       000ED4 R   |   4 skip_str   001795 R
  4 slash_ts   00100B R   |   4 sleep      0029DF R   |   4 software   001431 R
  4 spaces     0009DA GR  |   4 spi_clea   002EE1 R   |   4 spi_disa   002EC9 R
  4 spi_enab   002E96 R   |   4 spi_rcv_   002F03 R   |   4 spi_read   002F2E R
  4 spi_sele   002F35 R   |   4 spi_send   002EED R   |   4 spi_writ   002F0E R
  2 stack_fu   001774 GR  |   2 stack_un   001800 R   |   4 star_tst   001000 R
  4 step       0022C4 R   |   4 stop       0026D8 R   |   4 store_lo   0022F3 R
  4 str_matc   001916 R   |   4 str_tst    000F0A R   |   4 strcmp     0013BD R
  4 strcpy     0013CE GR  |   4 strlen     0013B2 GR  |   4 sub24      000187 R
  4 symb_loo   000E50 R   |   4 syntax_e   00166E GR  |   4 system_i   001477 R
  5 tab_widt   000023 GR  |   4 tb_error   001670 GR  |   4 term       001A2E R
  4 term01     001A36 R   |   4 term_exi   001A6E R   |   4 test       00339C R
  4 test_p     000589 R   |   2 tib        001668 GR  |   4 tick_tst   000FC4 R
  5 ticks      00000F R   |   4 timeout    002C8E R   |   5 timer      000012 GR
  4 timer2_i   0000A1 R   |   4 timer4_i   0000AE R   |   4 tk_id      00165E R
  4 to         002284 R   |   4 to_eepro   000777 R   |   4 to_flash   00077C R
  4 to_hex_c   000C3F GR  |   4 to_upper   00185A GR  |   4 token_ch   001094 R
  4 token_ex   001098 R   |   4 tone       00256F R   |   4 try_next   002E21 R
  5 txtbgn     00001B GR  |   5 txtend     00001D GR  |   4 uart1_ge   000920 GR
  4 uart1_in   0008CB R   |   4 uart1_pu   000910 GR  |   4 uart1_qg   000919 GR
  4 uart1_se   0008DB R   |   4 ubound     001C51 R   |   4 uflash     002993 R
  4 unlock_e   0006AB R   |   4 unlock_f   0006C6 R   |   4 until      002D42 R
  4 user_int   000057 R   |   4 usr        0029B0 R   |   4 var_name   00119D GR
  5 vars       000030 GR  |   4 wait       002120 R   |   4 warm_ini   0014A8 R
  4 warm_sta   0016FA R   |   4 words      002C0D R   |   4 words_co   002C61 R
  4 write      0028B9 R   |   4 write_bl   00082C GR  |   4 write_bu   000768 R
  4 write_by   0007B2 R   |   4 write_ee   0007EE R   |   4 write_ex   000827 R
  4 write_fl   0007D8 R   |   4 write_nb   000851 R   |   2 xstack_f   001738 GR
  2 xstack_u   001774 GR

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

