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
                           000070    26         F_AND=(7<<4)   ; TK_AND
                           000080    27         F_OR=(8<<4)    ; TK_OR
                           000090    28         F_XOR=(9<<4)   ; TK_XOR   
                           00000F    29         NLEN_MASK=0xf  ; mask to extract name len 
                           0000F0    30         KW_TYPE_MASK=0xf0 ; mask to extract keyword type 
                                     31 
                                     32 
                           00008C    33 	STACK_SIZE=140
                           0017FF    34 	STACK_EMPTY=RAM_SIZE-1  
                           000003    35         CELL_SIZE=3
                           00003C    36         XSTACK_SIZE=CELL_SIZE*20 ; 20 * int24
                           001773    37         XSTACK_EMPTY=STACK_EMPTY-STACK_SIZE 
                           000000    38 	FRUN=0 ; flags run code in variable flags
                           000001    39 	FTRAP=1 ; inside trap handler 
                           000002    40 	FLOOP=2 ; FOR loop in preparation 
                           000003    41 	FSLEEP=3 ; halt produit par la commande SLEEP 
                           000004    42 	FBREAK=4 ; break point flag 
                           000005    43 	FCOMP=5  ; compiling flags 
                                     44 
                                     45 
                           000006    46         FIRST_DATA_ITEM=6 ; first DATA item offset on line.
                                     47 
                           007FFF    48 	MAX_LINENO=0x7fff; BASIC maximum line number 
                                     49 
                           000008    50 	RX_QUEUE_SIZE=8 
                                     51 
                           00F424    52         TIM2_CLK_FREQ=62500
                                     53 
                           000050    54 	TIB_SIZE=80
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                           000080    55         PAD_SIZE=BLOCK_SIZE 
                                     56 
                                     57 ;--------------------------------------
                                     58 ;   constantes related to Arduino 
                                     59 ;   API mapping 
                                     60 ;-------------------------------------
                           000000    61         INP=0
                           000001    62         OUTP=1 
                                     63 
                                     64 ;--------------------------------------
                                     65 ;       token attribute
                                     66 ;--------------------------------------
                                     67         ; bits 4:5 identify token group 
                                     68         ; 0x0n -> miscelinous 
                                     69         ; 0x1n -> +|- operators 
                                     70         ; 0x2n -> *|/|% operators
                                     71         ; 0x3n -> relational operators 
                           000080    72         TK_CMD=128      ; BASIC command   
                           000081    73         TK_IFUNC=129    ; BASIC integer function
                           000082    74         TK_CFUNC=130    ; BASIC character function
                           000083    75         TK_CONST=131    ; BASIC constant 
                           000084    76         TK_INTGR=132    ; 16 bits integer 
                           000085    77         TK_VAR=133
                           000086    78         TK_FLOAT=134    ; float32 
                           000087    79         TK_AND=135      ;
                           000088    80         TK_OR=136       ;
                           000089    81         TK_XOR=137      ; 
                           000000    82         TK_NONE=0       ; not a token 
                           000002    83         TK_QSTR=2       ; quoted string  
                           000003    84         TK_LABEL=3      ; used for defined, constants, variables
                           000004    85         TK_CHAR=4       ; ASCII character 
                           000005    86         TK_ARRAY=5     ; array variable '@' 
                           000006    87         TK_LPAREN=6     ; left parenthesis '('
                           000007    88         TK_RPAREN=7     ; right parenthesis ')'
                           000008    89         TK_COMMA=8     ; item separator ',' 
                           000009    90         TK_SHARP=9     ; print colon width '#' 
                           00000A    91         TK_COLON=0xa      ; command separator ':' 
                                     92         
                           000010    93         TK_PLUS=0x10    ; addition operator '+'
                           000011    94         TK_MINUS=0x11   ; subtraction operator '-'
                           000020    95         TK_MULT=0x20    ; multiplication operator '*'
                           000021    96         TK_DIV=0x21     ; division operator '/'
                           000022    97         TK_MOD=0x22     ; modulo operator '%'
                                     98 
                                     99         ; don't change these token values 
                                    100         ; values chosen to be used as a mask.
                                    101         ; bit 7   1 for dictionary words else 0 
                                    102         ; bits 6  always 0 
                                    103         ; bits 5:4 identify group 
                                    104         ; bits 3:0 token identifier inside group  
                           000031   105         TK_GT=0x31      ; relation operator '>'
                           000032   106         TK_EQUAL=0x32   ; assignment or relation operator '='
                           000033   107         TK_GE=0x33      ; relation operator '>='
                           000034   108         TK_LT=0x34      ; relation operator '<'
                           000036   109         TK_LE=0x36      ; relation operator '<='
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                           000035   110         TK_NE=0x35      ; relation operator '<>' not equal 
                                    111         ; token groups 
                           000030   112         TK_GRP_MASK=0x30 ; groups bits selector 
                           000000   113         TK_GRP_MISC=0x00 ; miscelinous group 
                           000010   114         TK_GRP_ADD=0x10  ; additive operators
                           000020   115         TK_GRP_MULT=0x20 ; multiplicative operators
                           000030   116         TK_GRP_RELOP=0x30 ;relational operators. 
                           000002   117         CMD_END=2 
                                    118 
                                    119 ;--------------------------------------
                                    120 ;   error codes 
                                    121 ;--------------------------------------
                           000000   122     ERR_NONE=0
                           000001   123     ERR_MEM_FULL=1 
                           000002   124     ERR_SYNTAX=2
                           000003   125     ERR_MATH_OVF=3
                           000004   126     ERR_DIV0=4 
                           000005   127     ERR_NO_LINE=5
                           000006   128     ERR_RUN_ONLY=6
                           000007   129     ERR_CMD_ONLY=7
                           000008   130     ERR_DUPLICATE=8
                           000009   131     ERR_NOT_FILE=9
                           00000A   132     ERR_BAD_VALUE=10
                           00000B   133     ERR_NO_ACCESS=11
                           00000C   134     ERR_NO_DATA=12 
                           00000D   135     ERR_NO_PROG=13
                           00000E   136     ERR_NO_FSPACE=14
                           00000F   137     ERR_BUF_FULL=15
                           000010   138     ERR_OVERFLOW=16 
                                    139 
                                    140 ;--------------------------------------
                                    141 ;   assembler flags 
                                    142 ;-------------------------------------
                                    143 ;    MATH_OVF=0 ; if 1 the stop on math overflow 
                                    144 
                                    145      .macro _usec_dly n 
                                    146     ldw x,#(16*n-2)/4
                                    147     decw x
                                    148     nop 
                                    149     jrne .-4
                                    150     .endm 
                                    151     
                                    152     ; load X register with 
                                    153     ; entry point of dictionary
                                    154     ; before calling 'search_dict'
                                    155     .macro _ldx_dict dict_name
                                    156     ldw x,#dict_name+2
                                    157     .endm 
                                    158 
                                    159     ; reset BASIC pointer
                                    160     ; to beginning of last token
                                    161     ; extracted except if it was end of line 
                                    162     .macro _unget_token 
                                    163      mov in,in.saved  
                                    164     .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                    165 
                                    166 
                                    167 ;---------------------------------------
                                    168 ;    xtack manipulation macros 
                                    169 ;    Y is used as xstack pointer  
                                    170 ;----------------------------------------
                                    171     ; pop in A:X from XSTACK 
                                    172     .macro _xpop 
                                    173     ld a,(y)
                                    174     ldw x,y 
                                    175     ldw x,(1,x)
                                    176     addw y,#CELL_SIZE 
                                    177     .endm 
                                    178 
                                    179     ; push A:X  to XSTACK 
                                    180     .macro _xpush 
                                    181     subw y,#CELL_SIZE
                                    182     ld (y),a 
                                    183     ldw (1,y),x 
                                    184     .endm 
                                    185 
                                    186     ; drop from XSTACK 
                                    187     .macro _xdrop 
                                    188     addw y,#CELL_SIZE 
                                    189     .endm 
                                    190 
                                    191     ; @T fetch top xstack 
                                    192     .macro _at_top
                                    193     ld a,(y)
                                    194     ldw x,y 
                                    195     ldw x,(1,x)
                                    196     .endm 
                                    197 
                                    198     ; @N  fetch next on xstack 
                                    199     .macro _at_next 
                                    200     ld a,(3,y)
                                    201     ldw x,y 
                                    202     ldw x,(4,x)
                                    203     .endm 
                                    204 
                                    205     ; !T put on top of xtack 
                                    206     .macro _store_top 
                                    207     ld (y),a 
                                    208     ldw (1,y),x     
                                    209     .endm 
                                    210 
                                    211     ; !N put next on xstack 
                                    212     .macro _store_next 
                                    213     ld (3,y),a 
                                    214     ldw (4,y),x 
                                    215     .endm 
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
                           000018    37     CRH_IDX=CHAR_IDX+2
                           00001A    38     CRL_IDX=CRH_IDX+2
                           00001C    39     DATA_IDX=CRL_IDX+2
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
                           000042    58     INVERT_IDX=INPUT_IDX+2
                           000044    59     IWDGEN_IDX=INVERT_IDX+2
                           000046    60     IWDGREF_IDX=IWDGEN_IDX+2
                           000048    61     KEY_IDX=IWDGREF_IDX+2
                           00004A    62     LET_IDX=KEY_IDX+2
                           00004C    63     LIST_IDX=LET_IDX+2
                           00004E    64     LOG_IDX=LIST_IDX+2
                           000050    65     LSHIFT_IDX=LOG_IDX+2
                           000052    66     NEXT_IDX=LSHIFT_IDX+2
                           000054    67     NEW_IDX=NEXT_IDX+2
                           000056    68     NOT_IDX=NEW_IDX+2
                           000058    69     ODR_IDX=NOT_IDX+2
                           00005A    70     PAD_IDX=ODR_IDX+2
                           00005C    71     PAUSE_IDX=PAD_IDX+2
                           00005E    72     PMODE_IDX=PAUSE_IDX+2
                           000060    73     PEEK_IDX=PMODE_IDX+2
                           000062    74     PINP_IDX=PEEK_IDX+2
                           000064    75     POKE_IDX=PINP_IDX+2
                           000066    76     POUT_IDX=POKE_IDX+2
                           000068    77    	PRT_IDX=POUT_IDX+2 ; PRINT commande index 
                           00006A    78     PRTA_IDX=PRT_IDX+2
                           00006C    79     PRTB_IDX=PRTA_IDX+2
                           00006E    80     PRTC_IDX=PRTB_IDX+2
                           000070    81     PRTD_IDX=PRTC_IDX+2
                           000072    82     PRTE_IDX=PRTD_IDX+2
                           000074    83     PRTF_IDX=PRTE_IDX+2
                           000076    84     PRTG_IDX=PRTF_IDX+2
                           000078    85     PRTH_IDX=PRTG_IDX+2
                           00007A    86     PRTI_IDX=PRTH_IDX+2
                           00007C    87     QKEY_IDX=PRTI_IDX+2
                           00007E    88     READ_IDX=QKEY_IDX+2
                           000080    89     RBT_IDX=READ_IDX+2  ; REBOOT
                           000082    90 	REM_IDX=RBT_IDX+2 ; REMARK command index 
                           000084    91     REST_IDX=REM_IDX+2 ; RESTORE
                           000086    92     RET_IDX=REST_IDX+2  ; RETURN 
                           000088    93     RND_IDX=RET_IDX+2 ; RANDOM 
                           00008A    94     RSHIFT_IDX=RND_IDX+2
                           00008C    95     RUN_IDX=RSHIFT_IDX+2
                           00008E    96     FREE_IDX=RUN_IDX+2
                           000090    97     SLEEP_IDX=FREE_IDX+2
                           000092    98     SPIRD_IDX=SLEEP_IDX+2
                           000094    99     SPIEN_IDX=SPIRD_IDX+2
                           000096   100     SPISEL_IDX=SPIEN_IDX+2
                           000098   101     SPIWR_IDX=SPISEL_IDX+2
                           00009A   102     STEP_IDX=SPIWR_IDX+2
                           00009C   103     STOP_IDX=STEP_IDX+2
                           00009E   104     TICKS_IDX=STOP_IDX+2
                           0000A0   105     TIMER_IDX=TICKS_IDX+2
                           0000A2   106     TMROUT_IDX=TIMER_IDX+2  ; TIMEOUT
                           0000A4   107     TO_IDX=TMROUT_IDX+2
                           0000A6   108     TONE_IDX=TO_IDX+2
                           0000A8   109     UBOUND_IDX=TONE_IDX+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                           0000AA   110     UFLASH_IDX=UBOUND_IDX+2
                           0000AC   111     UNTIL_IDX=UFLASH_IDX+2
                           0000AE   112     USR_IDX=UNTIL_IDX+2
                           0000B0   113     WAIT_IDX=USR_IDX+2
                           0000B2   114     WORDS_IDX=WAIT_IDX+2
                           0000B4   115     WRITE_IDX=WORDS_IDX+2
                           0000B6   116     SIZE_IDX=WRITE_IDX+2 
                           0000B8   117     ON_IDX=SIZE_IDX+2 
                           0000BA   118     GET_IDX=ON_IDX+2
                           0000BC   119     CONST_IDX=GET_IDX+2
                           0000BE   120     EEFREE_IDX=CONST_IDX+2
                                    121      
                                    122     ; keep these 3 at end
                                    123     ; these have no entry in code_addr 
                           0000FA   124     AND_IDX=250 
                           0000FC   125     OR_IDX=252 
                           0000FE   126     XOR_IDX=254    
                                    127 
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
      008050 82 00 89 52             79 	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
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
      008096 CD 85 45         [ 4]  120 	call print_registers
      008099 CD 85 F0         [ 4]  121 	call cmd_itf
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
      0080E5 CD 8A 21         [ 4]  174 	call puts 
      0080E8                        175 UBTN_Handler_exit:
      0080E8 AE 17 FF         [ 2]  176     ldw x,#STACK_EMPTY 
      0080EB 94               [ 1]  177     ldw sp,x
      0080EC 9A               [ 1]  178 	rim 
      0080ED CC 97 B9         [ 2]  179 5$:	jp warm_start
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
      00818E CD 89 7F         [ 4]  273 	call uart1_init
                                    274 ; activate PE_4 (user button interrupt)
      008191 72 18 50 18      [ 1]  275     bset PE_CR2,#USR_BTN_BIT 
                                    276 ; display system information
      008195 9A               [ 1]  277 	rim ; enable interrupts 
      008196 72 5C 00 18      [ 1]  278 	inc seedy+1 
      00819A 72 5C 00 16      [ 1]  279 	inc seedx+1 
      00819E CD 9D AC         [ 4]  280 	call func_eefree 
      0081A1 CD 9C E3         [ 4]  281 	call ubound 
      0081A4 CD 95 89         [ 4]  282 	call clear_basic
      0081A7 CD A5 F3         [ 4]  283 	call beep_1khz  
      0081AA CD 95 36         [ 4]  284 	call system_information
      0081AD                        285 2$:	
                                    286 ; check for application in flash memory 
      0081AD CD A8 2E         [ 4]  287 	call qsign 
      0081B0 27 03            [ 1]  288 	jreq run_app
      0081B2 CC 97 B9         [ 2]  289 	jp warm_start 
      0081B5                        290 run_app:
                                    291 ; run application in FLASH|EEPROM 
      0081B5 90 CE 17 73      [ 2]  292 	ldw y,XSTACK_EMPTY
      0081B9 CD 95 67         [ 4]  293 	call warm_init
      0081BC AE B6 84         [ 2]  294 	ldw x,#app 
      0081BF CF 00 1C         [ 2]  295 	ldw txtbgn,x
      0081C2 72 BB B6 82      [ 2]  296 	addw x,app_size 
      0081C6 CF 00 1E         [ 2]  297 	ldw txtend,x 
      0081C9 AE 81 D7         [ 2]  298 	ldw x,#AUTO_RUN 
      0081CC CD 8A 21         [ 4]  299 	call puts 
      0081CF CD 9E D4         [ 4]  300 	call program_info 
      0081D2 CC A5 97         [ 2]  301 	jp run_it_02  
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
      0001E6                        112     _at_top 
      008250 90 F7            [ 1]    1     ld a,(y)
      008252 90               [ 1]    2     ldw x,y 
      008253 EF 01            [ 2]    3     ldw x,(1,x)
      008255 81               [ 1]  113     cpl a 
      008256 53               [ 2]  114     cplw x 
      0001ED                        115     _store_top 
      008256 88 C3            [ 1]    1     ld (y),a 
      008258 00 0E C2         [ 2]    2     ldw (1,y),x     
      00825B 00               [ 4]  116     ret 
                                    117 
                                    118 ;----------------------------    
                                    119 ; two'2 complement of top  
                                    120 ;---------------------------
      0001F3                        121 neg24: ; (i -- -i )
      0001F3                        122     _at_top
      00825C 0D 84            [ 1]    1     ld a,(y)
      00825E 81               [ 1]    2     ldw x,y 
      00825F EE 01            [ 2]    3     ldw x,(1,x)
      00825F 90               [ 1]  123     cpl  a  
      008260 F6               [ 2]  124     cplw x 
      008261 A1 80 2A         [ 2]  125     addw x,#1
      008264 0E 81            [ 1]  126     adc a,#0
      008266                        127     _store_top  
      008266 90 F6            [ 1]    1     ld (y),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008268 93 EE 01         [ 2]    2     ldw (1,y),x     
      00826B 43               [ 4]  128 9$: ret 
                                    129 
                                    130 ;-----------------------------
                                    131 ; negate integer in A:X 
                                    132 ;----------------------------
      000205                        133 neg_ax:
      00826C 53               [ 1]  134     cpl  a  
      00826D 90               [ 2]  135     cplw x 
      00826E F7 90 EF         [ 2]  136     addw x,#1
      008271 01 81            [ 1]  137     adc a,#0
      008273 81               [ 4]  138     ret 
                                    139 
                                    140 ;------------------------------------
                                    141 ;  two's complement of acc24 
                                    142 ;-------------------------------------
      00020D                        143 neg_acc24: ; 
      008273 90 F6 93 EE      [ 1]  144     cpl acc24 
      008277 01 43 53 1C      [ 1]  145     cpl acc16 
      00827B 00 01 A9 00      [ 1]  146     cpl acc8
      00827F 90 F7 90 EF      [ 1]  147     inc acc8 
      008283 01 81            [ 1]  148     jrne 9$
      008285 72 5C 00 0D      [ 1]  149     inc acc16 
      008285 43 53            [ 1]  150     jrne 9$
      008287 1C 00 01 A9      [ 1]  151     inc acc24 
      00828B 00               [ 4]  152 9$: ret 
                                    153 
                                    154 
                                    155 ;--------------------------------------
                                    156 ; unsigned multiply uint24_t by uint8_t
                                    157 ; input:
                                    158 ;	acc24	uint24_t 
                                    159 ;   A		uint8_t
                                    160 ; output:
                                    161 ;   acc24   A*acc24
                                    162 ;      A    overflow, bits 31..24 
                                    163 ;-------------------------------------
                                    164 ; local variables offset  on sp
                           000001   165 	U8   = 1   ; A pushed on stack
                           000001   166 	VSIZE = 1 
      00022A                        167 mulu24_8:
      00828C 81               [ 2]  168 	pushw x    ; save X
                                    169 	; local variable
      00828D 88               [ 1]  170 	push a     ; U8
      00828D 72 53 00 0D      [ 1]  171 	clr acc32 
                                    172 ; multiply bits 7..0 * U8   	
      008291 72               [ 1]  173 	ld xl,a 
      008292 53 00 0E         [ 1]  174 	ld a,acc8 
      008295 72               [ 4]  175 	mul x,a 
      008296 53 00 0F         [ 1]  176 	ld a, acc16 
      008299 72 5C 00         [ 2]  177 	ldw acc16,x
                                    178 ; multiply middle byte, bits 15..8 * U8  	
      00829C 0F               [ 1]  179 	ld xl,a 
      00829D 26 0A            [ 1]  180 	ld a,(U8,sp)
      00829F 72               [ 4]  181 	mul x,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      0082A0 5C 00 0E         [ 1]  182 	ld a,acc24
      0082A3 26 04 72 5C      [ 1]  183 	clr acc24  
      0082A7 00 0D 81 0C      [ 2]  184 	addw x,acc24
      0082AA CF 00 0C         [ 2]  185 	ldw acc24,x 
                                    186 ; multiply  MSB, bits 23..16 * U8 
      0082AA 89               [ 1]  187 	ld xl,a 
      0082AB 88 72            [ 1]  188 	ld a,(U8,sp)
      0082AD 5F               [ 4]  189 	mul x,a
      0082AE 00 0C 97 C6      [ 2]  190 	addw x,acc32  
      0082B2 00 0F 42         [ 2]  191 	ldw acc32,x 
      0082B5 C6               [ 1]  192 	ld a,xh 
      000259                        193 	_drop VSIZE  
      0082B6 00 0E            [ 2]    1     addw sp,#VSIZE 
      0082B8 CF               [ 2]  194 	popw x 
      0082B9 00               [ 4]  195 	ret 
                                    196 
                                    197 
                                    198 ;-------------------------------
                                    199 ; mul24 i1 i2 -- i1*i2  
                                    200 ; multiply 24 bits integers 
                                    201 ;------------------------------
                           000001   202     PROD=1 
                           000004   203     N1=4
                           000007   204     N2=7
                           00000A   205     PROD_SIGN=10
                           00000A   206     VSIZE=10 
      00025D                        207 mul24:
      00025D                        208     _vars VSIZE
      0082BA 0E 97            [ 2]    1     sub sp,#VSIZE 
      0082BC 7B 01            [ 1]  209     clr (PROD_SIGN,sp)
      0082BE 42 C6            [ 1]  210     clr (PROD,sp)
      0082C0 00               [ 1]  211     clrw x 
      0082C1 0D 72            [ 2]  212     ldw (PROD+1,sp),x
      000266                        213     _xpop 
      0082C3 5F 00            [ 1]    1     ld a,(y)
      0082C5 0D               [ 1]    2     ldw x,y 
      0082C6 72 BB            [ 2]    3     ldw x,(1,x)
      0082C8 00 0D CF 00      [ 2]    4     addw y,#CELL_SIZE 
      0082CC 0D               [ 1]  214     tnz a 
      0082CD 97 7B            [ 1]  215     jrpl 0$
      0082CF 01 42            [ 1]  216     cpl (PROD_SIGN,sp)
      0082D1 72 BB 00         [ 4]  217     call neg_ax 
      000277                        218 0$:    
      0082D4 0C CF            [ 1]  219     ld (N1,sp),a 
      0082D6 00 0C            [ 2]  220     ldw (N1+1,sp),x
      00027B                        221     _at_top 
      0082D8 9E 5B            [ 1]    1     ld a,(y)
      0082DA 01               [ 1]    2     ldw x,y 
      0082DB 85 81            [ 2]    3     ldw x,(1,x)
      0082DD 4D               [ 1]  222     tnz a 
      0082DD 52 0A            [ 1]  223     jrpl 2$ 
      0082DF 0F 0A            [ 1]  224     cpl (PROD_SIGN,sp) 
      0082E1 0F 01 5F         [ 4]  225     call neg_ax
      0082E4 1F 02            [ 1]  226     ld (N2,sp),a 
      0082E6 90 F6            [ 2]  227     ldw (N2+1,sp),x   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      00028C                        228 2$: 
      0082E8 93 EE 01         [ 1]  229     ld acc24,a 
      0082EB 72 A9 00         [ 2]  230     ldw acc16,x 
      0082EE 03 4D            [ 1]  231     ld a,(N1+2,sp); least byte     
      0082F0 2A 05            [ 1]  232     jreq 4$
      0082F2 03 0A CD         [ 4]  233     call mulu24_8
      0082F5 82               [ 1]  234     tnz a 
      0082F6 85 60            [ 1]  235     jrne 8$ ; overflow 
      0082F7 CE 00 0D         [ 2]  236     ldw x,acc16  
      0082F7 6B 04 1F         [ 1]  237     ld a,acc24
      0082FA 05 90            [ 1]  238     jrmi 8$ ; overflow  
      0082FC F6 93            [ 1]  239     ld (PROD,sp),a
      0082FE EE 01            [ 2]  240     ldw (PROD+1,sp),x 
      0002A8                        241 4$:
      008300 4D 2A            [ 1]  242     ld a,(N2,sp) 
      008302 09 03            [ 2]  243     ldw x,(N2+1,sp)
      008304 0A CD 82         [ 1]  244     ld acc24,a 
      008307 85 6B 07         [ 2]  245     ldw acc16,x 
      00830A 1F 08            [ 1]  246     ld a,(N1+1,sp); middle byte     
      00830C 27 1F            [ 1]  247     jreq 5$
      00830C C7 00 0D         [ 4]  248     call mulu24_8
      00830F CF               [ 1]  249     tnz a 
      008310 00 0E            [ 1]  250     jrne 8$ ; overflow 
      008312 7B 06 27         [ 1]  251     ld a,acc24 
      008315 12 CD            [ 1]  252     jrne 8$  ; overflow 
      008317 82 AA 4D         [ 2]  253     ldw x,acc16  
      00831A 26 60 CE         [ 2]  254     addw x,(PROD,sp)
      00831D 00 0E            [ 1]  255     jrv 8$ ; overflow
      00831F C6 00            [ 2]  256     ldw (PROD,sp),x 
      008321 0D 2B            [ 1]  257     ld a,(N2,sp)
      008323 58 6B            [ 2]  258     ldw x,(N2+1,sp)
      008325 01 1F 02         [ 1]  259     ld acc24,a 
      008328 CF 00 0D         [ 2]  260     ldw acc16,x 
      0002D5                        261 5$:
      008328 7B 07            [ 1]  262     ld a,(N1,sp) ; high byte 
      00832A 1E 08            [ 1]  263     jreq 6$
      00832C C7 00 0D         [ 4]  264     call mulu24_8
      00832F CF               [ 1]  265     tnz a 
      008330 00 0E            [ 1]  266     jrne 8$ ; overflow 
      008332 7B 05 27         [ 2]  267     ldw x,acc24 
      008335 1F CD            [ 1]  268     jrne 8$ ; overflow 
      008337 82 AA 4D         [ 1]  269     ld a,acc8 
      00833A 26 40            [ 1]  270     jrmi 8$ ; overflow 
      00833C C6 00            [ 1]  271     add a,(PROD,sp)
      00833E 0D 26            [ 1]  272     ld (PROD,sp),a 
      008340 3B CE            [ 1]  273     jrv 8$ ; overflow 
      0002EF                        274 6$:
      008342 00 0E            [ 1]  275     ld a,(PROD,sp)
      008344 72 FB            [ 2]  276     ldw x,(PROD+1,sp)
      008346 01 29            [ 1]  277     tnz (PROD_SIGN,sp)
      008348 33 1F            [ 1]  278     jreq 9$
      00834A 01 7B 07         [ 4]  279     call neg_ax 
      00834D 1E 08            [ 2]  280     jra 9$ 
      0002FC                        281 8$: ; overflow
      00834F C7 00            [ 1]  282     ld a,#ERR_OVERFLOW
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008351 0D CF 00         [ 2]  283     jp tb_error 
      000301                        284 9$:    
      000301                        285     _store_top 
      008354 0E F7            [ 1]    1     ld (y),a 
      008355 90 EF 01         [ 2]    2     ldw (1,y),x     
      000306                        286     _drop VSIZE 
      008355 7B 04            [ 2]    1     addw sp,#VSIZE 
      008357 27               [ 4]  287     ret 
                                    288 
                                    289 ;-------------------------------------
                                    290 ; divide uint24_t by uint8_t
                                    291 ; input:
                                    292 ;	acc24	dividend
                                    293 ;   A 		divisor
                                    294 ; output:
                                    295 ;   acc24	quotient
                                    296 ;   A		remainder
                                    297 ;------------------------------------- 
                                    298 ; offset  on sp of arguments and locals
                           000001   299 	U8   = 1   ; divisor on stack
                           000001   300 	VSIZE =1
      000309                        301 divu24_8:
      008358 16               [ 2]  302 	pushw x ; save x
      008359 CD               [ 1]  303 	push a 
                                    304 	; ld dividend UU:MM bytes in X
      00835A 82 AA 4D         [ 2]  305 	ldw x,acc24
      00835D 26 1D            [ 1]  306 	ld a,(U8,SP) ; divisor
      00835F CE               [ 2]  307 	div x,a ; UU:MM/U8
      008360 00               [ 1]  308 	push a  ;save remainder
      008361 0D 26 18         [ 2]  309     ldw acc24,x ; quotient 
      008364 C6               [ 1]  310 	pop a
      008365 00               [ 1]  311 	ld xh,a
      008366 0F 2B 13         [ 1]  312 	ld a,acc8
      008369 1B               [ 1]  313 	ld xl,a
      00836A 01 6B            [ 1]  314 	ld a,(U8,sp) ; divisor
      00836C 01               [ 2]  315 	div x,a  ; R:LL/U8
      00836D 29 0D            [ 1]  316 	ld (U8,sp),a ; save remainder
      00836F 9F               [ 1]  317 	ld a,xl
      00836F 7B 01 1E         [ 1]  318 	ld acc8,a
      008372 02               [ 1]  319 	pop a
      008373 0D               [ 2]  320 	popw x
      008374 0A               [ 4]  321 	ret
                                    322 
                                    323 
                                    324 ;-------------------------------
                                    325 ; div24 N/T   
                                    326 ; divide 24 bits integers
                                    327 ;  i1 i2 -- i1/i2 
                                    328 ;------------------------------
                           000001   329     DIVISOR=1
                           000004   330     CNTR=4
                           000005   331     QSIGN=5
                           000006   332     RSIGN=6 
                           000006   333     VSIZE=6 
      000327                        334 div24:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      000327                        335     _vars VSIZE 
      008375 27 0A            [ 2]    1     sub sp,#VSIZE 
      008377 CD 82            [ 1]  336     clr (RSIGN,sp)
      008379 85 20            [ 1]  337     clr (QSIGN,sp)
      00032D                        338     _xpop 
      00837B 05 F6            [ 1]    1     ld a,(y)
      00837C 93               [ 1]    2     ldw x,y 
      00837C A6 10            [ 2]    3     ldw x,(1,x)
      00837E CC 97 2F 03      [ 2]    4     addw y,#CELL_SIZE 
      008381 4D               [ 1]  339     tnz a 
      008381 90 F7            [ 1]  340     jrpl 0$ 
      008383 90 EF            [ 1]  341     cpl (QSIGN,sp)
      008385 01 5B 0A         [ 4]  342     call neg_ax
      00033E                        343 0$:
      008388 81 01            [ 1]  344     ld  (DIVISOR,sp),a
      008389 1F 02            [ 2]  345     ldw (DIVISOR+1,sp),x
      008389 89 88            [ 1]  346     or a,(DIVISOR+1,sp)
      00838B CE 00            [ 1]  347     or a,(DIVISOR+2,sp)
      00838D 0D 7B            [ 1]  348     jrne 1$ 
      00838F 01 62            [ 1]  349     ld a,#ERR_DIV0 
      008391 88 CF 00         [ 2]  350     jp tb_error 
      00034D                        351 1$: 
      00034D                        352     _at_top
      008394 0D 84            [ 1]    1     ld a,(y)
      008396 95               [ 1]    2     ldw x,y 
      008397 C6 00            [ 2]    3     ldw x,(1,x)
      008399 0F               [ 1]  353     tnz a 
      00839A 97 7B            [ 1]  354     jrpl 2$
      00839C 01 62 6B         [ 4]  355     call neg_ax
      00839F 01 9F            [ 1]  356     cpl (QSIGN,sp)
      0083A1 C7 00            [ 1]  357     cpl (RSIGN,sp)
      00035C                        358 2$: 
      0083A3 0F 84 85         [ 1]  359     ld acc24,a 
      0083A6 81 00 0D         [ 2]  360     ldw acc16,x 
      0083A7 A6 18            [ 1]  361     ld a,#24 
      0083A7 52 06            [ 1]  362     ld (CNTR,sp),a
      0083A9 0F 06            [ 1]  363     ld a,(DIVISOR,sp)
      0083AB 0F 05            [ 2]  364     ldw x,(DIVISOR+1,sp)
      0083AD 90 F6 93         [ 4]  365     call cp24_ax ; A:X-acc24 ?
      0083B0 EE 01            [ 2]  366     jrule 22$ 
                                    367 ; quotient=0, remainder=divisor      
      0083B2 72 A9 00         [ 1]  368     ld a,acc24 
      0083B5 03 4D 2A         [ 2]  369     ldw x,acc16 
      0083B8 05 03 05 CD      [ 1]  370     clr acc24 
      0083BC 82 85 00 0D      [ 1]  371     clr acc16 
      0083BE 72 5F 00 0E      [ 1]  372     clr acc8 
      0083BE 6B 01            [ 2]  373     jra 6$
      000383                        374 22$:     
      0083C0 1F               [ 1]  375     clr a 
      0083C1 02               [ 1]  376     clrw x 
      0083C2 1A               [ 1]  377     rcf  
      000386                        378 3$: 
      0083C3 02 1A 03 26      [ 1]  379     rlc acc8 
      0083C7 05 A6 04 CC      [ 1]  380     rlc acc16
      0083CB 97 2F 00 0C      [ 1]  381     rlc acc24 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      0083CD 59               [ 2]  382     rlcw x  
      0083CD 90               [ 1]  383     rlc a
      0083CE F6 93 EE         [ 2]  384 4$: subw x,(DIVISOR+1,sp) 
      0083D1 01 4D            [ 1]  385     sbc a,(DIVISOR,sp)
      0083D3 2A 07            [ 1]  386     jrnc 5$
      0083D5 CD 82 85         [ 2]  387     addw x,(DIVISOR+1,sp)
      0083D8 03 05            [ 1]  388     adc a,(DIVISOR,sp)
      0003A0                        389 5$: ; shift carry in QUOTIENT 
      0083DA 03               [ 1]  390     ccf
      0083DB 06 04            [ 1]  391     dec (CNTR,sp)
      0083DC 26 E1            [ 1]  392     jrne 3$ 
      0083DC C7 00 0D CF      [ 1]  393     rlc acc8 
      0083E0 00 0E A6 18      [ 1]  394     rlc acc16 
      0083E4 6B 04 7B 01      [ 1]  395     rlc acc32 
      0003B1                        396 6$:    
      0083E8 1E 02            [ 1]  397     ld (DIVISOR,sp),a 
      0083EA CD 82            [ 2]  398     ldw (DIVISOR+1,sp),x 
      0083EC 56 23 14         [ 1]  399     ld a,acc24 
      0083EF C6 00 0D         [ 2]  400     ldw x,acc16 
      0083F2 CE 00            [ 1]  401     tnz (QSIGN,sp)
      0083F4 0E 72            [ 1]  402     jreq 8$
      0083F6 5F 00 0D         [ 4]  403     call neg_ax 
      0003C2                        404 8$: 
      0003C2                        405     _store_top 
      0083F9 72 5F            [ 1]    1     ld (y),a 
      0083FB 00 0E 72         [ 2]    2     ldw (1,y),x     
      0083FE 5F 00            [ 1]  406     ld a,(DIVISOR,sp)
      008400 0F 20            [ 2]  407     ldw x,(DIVSOR+1,sp)
      0003CB                        408 81$:
      008402 2E 06            [ 1]  409     tnz (RSIGN,sp)
      008403 27 03            [ 1]  410     jreq 9$
      008403 4F 5F 98         [ 4]  411     call neg_ax       
      008406                        412 9$: _drop VSIZE 
      008406 72 59            [ 2]    1     addw sp,#VSIZE 
      008408 00               [ 4]  413     ret 
                                    414 
                                    415 
                                    416 ;-------------------------------
                                    417 ; mod24 A:X % acc24 
                                    418 ; remainder 24 bits integers 
                                    419 ; input:
                                    420 ;    acc24   dividend 
                                    421 ;    A:X     divisor 
                                    422 ; output:
                                    423 ;    acc24   acc24 % A:X 
                                    424 ;------------------------------
      0003D5                        425 mod24:
      008409 0F 72 59         [ 4]  426     call div24 
      0003D8                        427     _store_top  ; replace quotient by remainder 
      00840C 00 0E            [ 1]    1     ld (y),a 
      00840E 72 59 00         [ 2]    2     ldw (1,y),x     
      008411 0D               [ 4]  428     ret 
                                    429 
                                    430 
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
      0003DE                         32 	_argofs 0  
                           000002     1     ARG_OFS=2+0 
      0003DE                         33 	_arg R_Y 1 
                           000003     1     R_Y=ARG_OFS+1 
      0003DE                         34 	_arg R_X 3
                           000005     1     R_X=ARG_OFS+3 
      0003DE                         35 	_arg R_A 5
                           000007     1     R_A=ARG_OFS+5 
      0003DE                         36 	_arg R_CC 6
                           000008     1     R_CC=ARG_OFS+6 
      0003DE                         37 prt_regs::
      008412 59 49 72         [ 2]   38 	ldw x,#regs_state 
      008415 F0 02 12         [ 4]   39 	call puts
                                     40 ; register PC
      008418 01 24            [ 2]   41 	ldw y,(1,sp)
      00841A 05 72 FB         [ 2]   42 	ldw x,#REG_EPC 
      00841D 02 19 01         [ 4]   43 	call prt_reg16 
                                     44 ; register CC 
      008420 7B 08            [ 1]   45 	ld a,(R_CC,sp)
      008420 8C 0A 04         [ 2]   46 	ldw x,#REG_CC 
      008423 26 E1 72         [ 4]   47 	call prt_reg8 
                                     48 ; register A 
      008426 59 00            [ 1]   49 	ld a,(R_A,sp)
      008428 0F 72 59         [ 2]   50 	ldw x,#REG_A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      00842B 00 0E 72         [ 4]   51 	call prt_reg8 
                                     52 ; register X 
      00842E 59 00            [ 2]   53 	ldw y,(R_X,sp)
      008430 0C 05 5E         [ 2]   54 	ldw x,#REG_X 
      008431 CD 04 A6         [ 4]   55 	call prt_reg16 
                                     56 ; register Y 
      008431 6B 01            [ 2]   57 	ldw y,(R_Y,sp)
      008433 1F 02 C6         [ 2]   58 	ldw x,#REG_Y 
      008436 00 0D CE         [ 4]   59 	call prt_reg16 
                                     60 ; register SP 
      008439 00 0E            [ 1]   61 	ldw y,sp
      00843B 0D 05 27 03      [ 2]   62 	addw y,#6+ARG_OFS  
      00843F CD 82 85         [ 2]   63 	ldw x,#REG_SP
      008442 CD 04 A6         [ 4]   64 	call prt_reg16
      008442 90 F7            [ 1]   65 	ld a,#CR 
      008444 90 EF 01         [ 4]   66 	call putc
      008447 7B 01 1E         [ 4]   67 	call putc   
      00844A 02               [ 4]   68 	ret 
                                     69 
                                     70 
      00844B 0A 72 65 67 69 73 74    71 regs_state: .asciz "\nregisters state\n--------------------\n"
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
      000448                         81 prt_peek::
      00844B 0D               [ 2]   82 	pushw x 
      00844C 06 27 03 CD      [ 1]   83 	mov base,#16 
      008450 82 85 5B         [ 4]   84 	call prt_i16  
      008453 06 81            [ 1]   85 	ld a,#': 
      008455 CD 09 44         [ 4]   86 	call putc 
      008455 CD 83            [ 1]   87 	ld a,#SPACE 
      008457 A7 90 F7         [ 4]   88 	call putc 
      00845A 90               [ 2]   89 	popw x 
      00845B EF               [ 1]   90 	ld a,(x)
      00845C 01               [ 1]   91 	clrw x 
      00845D 81               [ 1]   92 	ld xl,a 
      00845E 35 0A 00 0A      [ 1]   93 	mov base,#10 
      00845E AE 84 A1         [ 4]   94 	call prt_i16 
      008461 CD               [ 4]   95 	ret 
                                     96 
                                     97 ;----------------------------------------
                                     98 ;   DEBUG support functions
                                     99 ;----------------------------------------
                                    100 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                    101 ; turn LED on 
      000466                        102 ledon:
      008462 8A 21 16 01      [ 1]  103     bset PC_ODR,#LED2_BIT
      008466 AE               [ 4]  104     ret 
                                    105 
                                    106 ; turn LED off 
      00046B                        107 ledoff:
      008467 85 D5 CD 85      [ 1]  108     bres PC_ODR,#LED2_BIT 
      00846B 26               [ 4]  109     ret 
                                    110 
                                    111 ; invert LED status 
      000470                        112 ledtoggle:
      00846C 7B 08            [ 1]  113     ld a,#LED2_MASK
      00846E AE 85 E6         [ 1]  114     xor a,PC_ODR
      008471 CD 85 04         [ 1]  115     ld PC_ODR,a
      008474 7B               [ 4]  116     ret 
                                    117 
      000479                        118 left_paren:
      008475 07 AE            [ 1]  119 	ld a,#SPACE 
      008477 85 E2 CD         [ 4]  120 	call putc
      00847A 85 04            [ 1]  121 	ld a,#'( 
      00847C 16 05 AE         [ 4]  122 	call putc 	
      00847F 85               [ 4]  123 	ret 
                                    124 
                                    125 ;------------------------------
                                    126 ; print 8 bit register 
                                    127 ; input:
                                    128 ;   X  point to register name 
                                    129 ;   A  register value to print 
                                    130 ; output:
                                    131 ;   none
                                    132 ;------------------------------- 
      000484                        133 prt_reg8:
      008480 DE               [ 1]  134 	push a 
      008481 CD 85 26         [ 4]  135 	call puts 
      008484 16 03            [ 1]  136 	ld a,(1,sp) 
      008486 AE               [ 1]  137 	clrw x 
      008487 85               [ 1]  138 	ld xl,a 
      008488 DA CD 85 26      [ 1]  139 	mov base,#16
      00848C 90 96 72         [ 4]  140 	call prt_i16  
      00848F A9 00 08         [ 4]  141 	call left_paren 
      008492 AE               [ 1]  142 	pop a 
      008493 85               [ 1]  143 	clrw x 
      008494 EB               [ 1]  144 	ld xl,a 
      008495 CD 85 26 A6      [ 1]  145 	mov base,#10 
      008499 0D CD 89         [ 4]  146 	call prt_i16  
      00849C C4 CD            [ 1]  147 	ld a,#') 
      00849E 89 C4 81         [ 4]  148 	call putc
      0084A1 0A               [ 4]  149 	ret
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
      0004A6                        159 prt_reg16: 
      0084A2 72 65            [ 2]  160 	pushw y 
      0084A4 67 69 73         [ 4]  161 	call puts 
      0084A7 74 65            [ 2]  162 	ldw x,(1,sp) 
      0084A9 72 73 20 73      [ 1]  163 	mov base,#16 
      0084AD 74 61 74         [ 4]  164 	call prt_i16  
      0084B0 65 0A 2D         [ 4]  165 	call left_paren 
      0084B3 2D               [ 2]  166 	popw x 
      0084B4 2D 2D 2D 2D      [ 1]  167 	mov base,#10 
      0084B8 2D 2D 2D         [ 4]  168 	call prt_i16  
      0084BB 2D 2D            [ 1]  169 	ld a,#') 
      0084BD 2D 2D 2D         [ 4]  170 	call putc
      0084C0 2D               [ 4]  171 	ret 
                                    172 
                                    173 ;------------------------------------
                                    174 ; print registers contents saved on
                                    175 ; stack by trap interrupt.
                                    176 ;------------------------------------
      0004C5                        177 print_registers:
      0084C1 2D 2D 2D         [ 2]  178 	ldw x,#STATES
      0084C4 2D 2D 0A         [ 4]  179 	call puts
                                    180 ; print EPC 
      0084C7 00 05 55         [ 2]  181 	ldw x, #REG_EPC
      0084C8 CD 09 A1         [ 4]  182 	call puts 
      0084C8 89 35            [ 1]  183 	ld a, (11,sp)
      0084CA 10 00 0B         [ 1]  184 	ld acc8,a 
      0084CD CD 98            [ 1]  185 	ld a, (10,sp) 
      0084CF 83 A6 3A         [ 1]  186 	ld acc16,a 
      0084D2 CD 89            [ 1]  187 	ld a,(9,sp) 
      0084D4 C4 A6 20         [ 1]  188 	ld acc24,a
      0084D7 CD               [ 1]  189 	clrw x  
      0084D8 89 C4            [ 1]  190 	ld a,#16
      0084DA 85 F6 5F         [ 4]  191 	call prt_acc24  
                                    192 ; print X
      0084DD 97 35 0A         [ 2]  193 	ldw x,#REG_X
      0084E0 00 0B            [ 2]  194 	ldw y,(5,sp)
      0084E2 CD 98 83         [ 4]  195 	call prt_reg16  
                                    196 ; print Y 
      0084E5 81 05 5A         [ 2]  197 	ldw x,#REG_Y
      0084E6 16 07            [ 2]  198 	ldw y, (7,sp)
      0084E6 72 1A 50         [ 4]  199 	call prt_reg16  
                                    200 ; print A 
      0084E9 0A 81 62         [ 2]  201 	ldw x,#REG_A
      0084EB 7B 04            [ 1]  202 	ld a, (4,sp) 
      0084EB 72 1B 50         [ 4]  203 	call prt_reg8
                                    204 ; print CC 
      0084EE 0A 81 66         [ 2]  205 	ldw x,#REG_CC 
      0084F0 7B 03            [ 1]  206 	ld a, (3,sp) 
      0084F0 A6 20 C8         [ 4]  207 	call prt_reg8 
                                    208 ; print SP 
      0084F3 50 0A C7         [ 2]  209 	ldw x,#REG_SP
      0084F6 50 0A            [ 1]  210 	ldw y,sp 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0084F8 81 A9 00 0C      [ 2]  211 	addw y,#12
      0084F9 CD 04 A6         [ 4]  212 	call prt_reg16  
      0084F9 A6 20            [ 1]  213 	ld a,#'\n' 
      0084FB CD 89 C4         [ 4]  214 	call putc
      0084FE A6               [ 4]  215 	ret
                                    216 
      0084FF 28 CD 89 C4 81 73 74   217 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             65 72 73 20 73 74 61
             74 65 20 61 74 20 61
             62 6F 72 74 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      008504 45 50 43 3A 00         218 REG_EPC: .asciz "EPC:"
      008504 88 CD 8A 21            219 REG_Y:   .asciz "\nY:" 
      008508 7B 01 5F 97            220 REG_X:   .asciz "\nX:"
      00850C 35 10 00 0B            221 REG_A:   .asciz "\nA:" 
      008510 CD 98 83 CD 84         222 REG_CC:  .asciz "\nCC:"
      008515 F9 84 5F 97 35         223 REG_SP:  .asciz "\nSP:"
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
      000570                        235 cmd_itf:
      00851A 0A 00            [ 2]  236 	sub sp,#VSIZE 
      00851C 0B CD 98 83      [ 1]  237 	clr farptr 
      008520 A6 29 CD 89      [ 1]  238 	clr farptr+1 
      008524 C4 81 00 1A      [ 1]  239 	clr farptr+2  
      008526                        240 repl:
      008526 90 89            [ 1]  241 	ld a,#CR 
      008528 CD 8A 21         [ 4]  242 	call putc 
      00852B 1E 01            [ 1]  243 	ld a,#'? 
      00852D 35 10 00         [ 4]  244 	call putc
      008530 0B CD 98 83      [ 1]  245 	clr in.w 
      008534 CD 84 F9 85      [ 1]  246 	clr in 
      008538 35 0A 00         [ 4]  247 	call readln
      00853B 0B CD 98 83      [ 2]  248 	ldw y,#tib  
      00853F A6 29            [ 1]  249 	ld a,(y)
      008541 CD 89            [ 1]  250 	jreq repl  
      008543 C4 81 00 01      [ 1]  251 	inc in 
      008545 CD 18 99         [ 4]  252 	call to_upper 
      008545 AE 85            [ 1]  253 	cp a,#'Q 
      008547 98 CD            [ 1]  254 	jrne test_p
      0005A6                        255 repl_exit:
      008549 8A 21 AE 85      [ 1]  256 	clr tib 
      00854D D5 CD 8A 21      [ 1]  257 	clr count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      008551 7B 0B C7 00      [ 1]  258 	clr in 
      0005B2                        259 	_drop #VSIZE 	
      008555 0F 7B            [ 2]    1     addw sp,##VSIZE 
      008557 0A               [ 4]  260 	ret  
      0005B5                        261 invalid:
      008558 C7 00 0E         [ 2]  262 	ldw x,#invalid_cmd 
      00855B 7B 09 C7         [ 4]  263 	call puts 
      00855E 00 0D            [ 2]  264 	jra repl 
      0005BD                        265 test_p:	
      008560 5F A6            [ 1]  266     cp a,#'P 
      008562 10 CD            [ 1]  267 	jreq mem_peek
      008564 98 9A            [ 1]  268     cp a,#'S 
      008566 AE 85            [ 1]  269 	jrne invalid 
      0005C5                        270 print_string:	
      008568 DE 16 05         [ 4]  271 	call get_token
      00856B CD 85            [ 1]  272 	cp a,#TK_INTGR 
      00856D 26 AE            [ 1]  273 	jrne invalid 
      00856F 85 DA 16         [ 4]  274 	call puts
      008572 07 CD 85         [ 2]  275 	jp repl 	
      0005D2                        276 mem_peek:
      008575 26 AE            [ 1]  277 	ld a,#SPACE 
      008577 85 E2 7B         [ 4]  278 	call skip  	 
      00857A 04 CD 85 04      [ 2]  279 	addw y,in.w 
      00857E AE 85 E6         [ 2]  280 	ldw x,#pad 
      008581 7B 03 CD         [ 4]  281 	call strcpy
      008584 85 04 AE         [ 2]  282 	ldw x,#pad
      008587 85 EB 90         [ 4]  283 	call atoi24 	
      00858A 96 72 A9         [ 1]  284 	ld a, acc24 
      00858D 00 0C CD         [ 1]  285 	or a,acc16 
      008590 85 26 A6         [ 1]  286 	or a,acc8 
      008593 0A CD            [ 1]  287 	jrne 1$ 
      008595 89 C4            [ 2]  288 	jra peek_byte  
      008597 81 0A 52         [ 2]  289 1$:	ldw x,acc24 
      00859A 65 67 69         [ 2]  290 	ldw farptr,x 
      00859D 73 74 65         [ 1]  291 	ld a,acc8 
      0085A0 72 73 20         [ 1]  292 	ld farptr+2,a 
      000600                        293 peek_byte:
      0085A3 73 74 61         [ 4]  294 	call print_farptr 
      0085A6 74 65            [ 1]  295 	ld a,#8 
      0085A8 20 61            [ 1]  296 	ld (PSIZE,sp),a 
      0085AA 74               [ 1]  297 	clrw x 
      0085AB 20 61 62         [ 4]  298 1$:	call fetchc  
      0085AE 6F               [ 2]  299 	pushw x 
      0085AF 72 74 20         [ 1]  300 	ld acc8,a 
      0085B2 70               [ 1]  301 	clrw x 
      0085B3 6F 69 6E         [ 2]  302 	ldw acc24,x 
      0085B6 74 2E            [ 1]  303 	ld a,#16+128
      0085B8 0A 2D 2D         [ 4]  304 	call prt_acc24
      0085BB 2D               [ 2]  305 	popw x 
      0085BC 2D 2D            [ 1]  306 	dec (PSIZE,sp)
      0085BE 2D 2D            [ 1]  307 	jrne 1$ 
      0085C0 2D 2D            [ 1]  308 	ld a,#8 
      0085C2 2D 2D 2D         [ 1]  309 	add a,farptr+2 
      0085C5 2D 2D 2D         [ 1]  310 	ld farptr+2,a
      0085C8 2D               [ 1]  311 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0085C9 2D 2D 2D         [ 1]  312 	adc a,farptr+1 
      0085CC 2D 2D 2D         [ 1]  313 	ld farptr+1,a 
      0085CF 2D               [ 1]  314 	clr a 
      0085D0 2D 2D 2D         [ 1]  315 	adc a,farptr 
      0085D3 0A 00 45         [ 1]  316 	ld farptr,a 
      0085D6 50 43 3A         [ 2]  317 	jp repl  
                                    318 
      0085D9 00 0A 59 3A 00 0A 58   319 invalid_cmd: .asciz "not a command\n" 
             3A 00 0A 41 3A 00 0A
             43
                                    320 
                                    321 ;----------------------------
                                    322 ; display farptr address
                                    323 ;----------------------------
      000645                        324 print_farptr:
      0085E8 43 3A 00         [ 1]  325 	ld a ,farptr+2 
      0085EB 0A 53 50         [ 1]  326 	ld acc8,a 
      0085EE 3A 00 18         [ 2]  327 	ldw x,farptr 
      0085F0 CF 00 0C         [ 2]  328 	ldw acc24,x 
      0085F0 52               [ 1]  329 	clrw x 
      0085F1 01 72            [ 1]  330 	ld a,#16 
      0085F3 5F 00 19         [ 4]  331 	call prt_acc24
      0085F6 72 5F            [ 1]  332 	ld a,#SPACE 
      0085F8 00 1A 72         [ 4]  333 	call putc 
      0085FB 5F 00 1B         [ 4]  334 	call putc 
      0085FE 81               [ 4]  335 	ret
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
      000660                        346 fetchc: ; @C
      0085FE A6 0D CD 89      [ 5]  347 	ldf a,([farptr],x)
      008602 C4               [ 1]  348 	incw x
      008603 A6               [ 4]  349 	ret
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
      000666                        360 number:
      008604 3F CD 89         [ 4]  361 	call get_token
      008607 C4 72            [ 1]  362 	cp a,#TK_INTGR
      008609 5F 00            [ 1]  363 	jreq 1$
      00860B 01 72 5F         [ 2]  364 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      00860E 00               [ 4]  365 1$:	ret
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
      000671                        380 show_row:
      00860F 02               [ 1]  381 	tnz a 
      008610 CD 8B            [ 1]  382 	jrne 1$
      008612 26               [ 4]  383 	ret 
      000675                        384 1$:	
      008613 90               [ 2]  385 	pushw x  
      008614 AE               [ 1]  386 	push a 
      008615 16 68 90 F6      [ 1]  387 	mov tab_width,#4 
      008619 27 E3 72         [ 4]  388 	call prt_i16 
      00861C 5C 00            [ 1]  389 	ld a,#SPACE  
      00861E 02 CD 99         [ 4]  390 	call putc
      000683                        391 row_loop:
      008621 19 A1            [ 2]  392 	ldw x,(ADR,sp)
      008623 51               [ 1]  393 	ld a,(x)
      008624 26               [ 1]  394 	clrw x 
      008625 17               [ 1]  395 	ld xl,a 
      008626 CD 18 03         [ 4]  396 	call prt_i16 
      008626 72 5F            [ 2]  397 	ldw x,(ADR,sp)
      008628 16               [ 1]  398 	incw x 
      008629 68 72            [ 2]  399 	ldw (ADR,sp),x 
      00862B 5F 00            [ 1]  400 	dec (CNT,sp)
      00862D 04 72            [ 1]  401 	jrne row_loop
      000694                        402 	_drop VSIZE  		
      00862F 5F 00            [ 2]    1     addw sp,#VSIZE 
      008631 02 5B 01 81      [ 1]  403 	mov tab_width,#4
      008635 A6 0D            [ 1]  404 	ld a,#CR 
      008635 AE 86 B6         [ 4]  405 	call putc 
      008638 CD               [ 4]  406 	ret 
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



      0006A0                        419 hex_dump:
      008639 8A               [ 1]  420 	push a 
      0006A1                        421 	_vars VSIZE
      00863A 21 20            [ 2]    1     sub sp,#VSIZE 
      00863C C1 00 0A         [ 1]  422 	ld a,base
      00863D 6B 03            [ 1]  423 	ld (BASE,sp),a 
      00863D A1 50 27 11      [ 1]  424 	mov base,#16
      008641 A1 53 26         [ 1]  425 	ld a,tab_width 
      008644 F0 04            [ 1]  426 	ld (TABW,sp),a
      008645 A6 0D            [ 1]  427 	ld a,#CR 
      008645 CD 8F 9B         [ 4]  428 	call putc 
      008648 A1 84            [ 2]  429 1$: ldw (BCNT,sp),y
      00864A 26 E9            [ 1]  430 	ld a,#16
      00864C CD 8A 21 CC      [ 2]  431 	cpw y,#16
      008650 85 FE            [ 1]  432 	jrpl 2$
      008652 90 9F            [ 1]  433 	ld a,yl
      0006C2                        434 2$: 	
      008652 A6 20 CD         [ 4]  435 	call show_row 
      008655 8F 88            [ 2]  436 	ldw y,(BCNT,sp) 
      008657 72 B9 00 01      [ 2]  437 	subw y,#16 
      00865B AE 16 B8 CD      [ 2]  438 	cpw y,#1
      00865F 94 8D            [ 1]  439 	jrpl 1$
      008661 AE 16            [ 1]  440 	ld a,(BASE,sp)
      008663 B8 CD 99         [ 1]  441 	ld base,a
      008666 25 C6            [ 1]  442 	ld a,(TABW,sp)
      008668 00 0D CA         [ 1]  443 	ld tab_width,a 
      0006DB                        444 	_drop VSIZE
      00866B 00 0E            [ 2]    1     addw sp,#VSIZE 
      00866D CA               [ 1]  445 	pop a 
      00866E 00               [ 4]  446 	ret 
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
      0006DF                         45 unlock_eeprom:
      00866F 0F 26 02 20 0C   [ 2]   46 	btjt FLASH_IAPSR,#FLASH_IAPSR_DUL,9$
      008674 CE 00 0D CF      [ 1]   47 	mov FLASH_CR2,#0 
      008678 00 19 C6 00      [ 1]   48 	mov FLASH_NCR2,#0xFF 
      00867C 0F C7 00 1B      [ 1]   49 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008680 35 56 50 64      [ 1]   50     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      008680 CD 86 C5 A6 08   [ 2]   51 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008685 6B               [ 4]   52 9$:	ret
                                     53 
                                     54 ;----------------------------------
                                     55 ; unlock FLASH for writing/erasing
                                     56 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                     57 ; input:
                                     58 ;  none
                                     59 ; output:
                                     60 ;  none
                                     61 ;----------------------------------
      0006FA                         62 unlock_flash:
      008686 01 5F CD 86 E0   [ 2]   63 	btjt FLASH_IAPSR,#FLASH_IAPSR_PUL,9$
      00868B 89 C7 00 0F      [ 1]   64 	mov FLASH_CR2,#0 
      00868F 5F CF 00 0D      [ 1]   65 	mov FLASH_NCR2,#0xFF 
      008693 A6 90 CD 98      [ 1]   66 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008697 9A 85 0A 01      [ 1]   67 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      00869B 26 EB A6 08 CB   [ 2]   68 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      0086A0 00               [ 4]   69 9$:	ret
                                     70 
                                     71 ;----------------------------
                                     72 ; erase block code must be 
                                     73 ; executed from RAM
                                     74 ; input:
                                     75 ;-----------------------------
      000715                         76 row_erase:
      0086A1 1B               [ 1]   77 	push a 
      0086A2 C7 00            [ 2]   78 	pushw y 
      0086A4 1B 4F C9 00      [ 1]   79 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      0086A8 1A C7 00 1A      [ 1]   80 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      0086AC 4F               [ 1]   81 	clr a 
      0086AD C9 00            [ 1]   82 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0086AF 19 C7 00 19      [ 1]   83 	ldf ([farptr],y),a
      0086B3 CC 85            [ 1]   84     incw y
      0086B5 FE 6E 6F 74      [ 1]   85 	ldf ([farptr],y),a
      0086B9 20 61            [ 1]   86     incw y
      0086BB 20 63 6F 6D      [ 1]   87 	ldf ([farptr],y),a
      0086BF 6D 61            [ 1]   88     incw y
      0086C1 6E 64 0A 00      [ 1]   89 	ldf ([farptr],y),a
      0086C5 72 05 50 5F FB   [ 2]   90 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      0086C5 C6 00            [ 2]   91 	popw y 
      0086C7 1B               [ 1]   92 	pop a 
      0086C8 C7               [ 4]   93 	ret
      000742                         94 row_erase_end:
                                     95 
                                     96 ; copy erase_start in RAM 
      000742                         97 move_erase_to_ram:
      0086C9 00               [ 2]   98 	pushw x 
      0086CA 0F CE            [ 2]   99 	pushw y 
      0086CC 00 19 CF         [ 2]  100 	ldw x,#row_erase_end 
      0086CF 00 0D 5F         [ 2]  101 	subw x,#row_erase
      0086D2 A6 10 CD         [ 2]  102 	ldw acc16,x 
      0086D5 98 9A A6         [ 2]  103 	ldw x,#tib 
      0086D8 20 CD 89 C4      [ 2]  104 	ldw y,#row_erase 
      0086DC CD 89 C4         [ 4]  105 	call move
      0086DF 81 85            [ 2]  106 	popw y
      0086E0 85               [ 2]  107 	popw x
      0086E0 92               [ 4]  108 	ret 
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
      00075C                        123 program_row:
      0086E1 AF               [ 1]  124 	push a 
      0086E2 00 19            [ 2]  125 	pushw y 
      0086E4 5C 81            [ 1]  126 	push #BLOCK_SIZE  
                                    127 ;enable block programming 
      0086E6 72 10 50 5B      [ 1]  128 	bset FLASH_CR2,#FLASH_CR2_PRG 
      0086E6 CD 8F 9B A1      [ 1]  129 	bres FLASH_NCR2,#FLASH_CR2_PRG
      0086EA 84 27            [ 1]  130 	clrw y 
      0086EC 03               [ 1]  131 1$:	ld a,(x)
      0086ED CC 97 2D 81      [ 1]  132 	ldf ([farptr],y),a
      0086F1 5C               [ 1]  133 	incw x 
      0086F1 4D 26            [ 1]  134 	incw y 
      0086F3 01 81            [ 1]  135 	dec (BCNT,sp)
      0086F5 26 F4            [ 1]  136 	jrne 1$
                                    137 ; wait EOP bit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0086F5 89 88 35 04 00   [ 2]  138 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      00077C                        139 	_drop 1 
      0086FA 24 CD            [ 2]    1     addw sp,#1 
      0086FC 98 83            [ 2]  140 	popw y 
      0086FE A6               [ 1]  141 	pop a 
      0086FF 20               [ 4]  142 	ret 
      000782                        143 program_row_end:
                                    144 
                                    145 ;-------------------------
                                    146 ; move program_row to RAM 
                                    147 ; at txtubound address 
                                    148 ;------------------------
      000782                        149 move_prg_to_ram:
      008700 CD               [ 2]  150 	pushw x 
      008701 89 C4            [ 2]  151 	pushw y 
      008703 AE 07 82         [ 2]  152 	ldw x,#program_row_end 
      008703 1E 02 F6         [ 2]  153 	subw x,#program_row 
      008706 5F 97 CD         [ 2]  154 	ldw acc16,x ; bytes to move 
      008709 98 83 1E         [ 2]  155 	ldw x,#tib ; destination address 
      00870C 02 5C 1F 02      [ 2]  156 	ldw y,#program_row ; source address 
      008710 0A 01 26         [ 4]  157 	call move
      008713 EF 5B            [ 2]  158 	popw y 
      008715 03               [ 2]  159 	popw x  
      008716 35               [ 4]  160 	ret 
                                    161 
                                    162 
                                    163 ;-----------------------------
                                    164 ; write a buffer in FLASH/EEPROM 
                                    165 ; input:
                                    166 ;    farptr   destination address 
                                    167 ;    x        buffer address 
                                    168 ;-----------------------------
      00079C                        169 write_buffer:
      008717 04               [ 2]  170 	pushw x 
      008718 00 24 A6 0D      [ 1]  171 	tnz farptr 
      00871C CD 89            [ 1]  172 	jrne to_flash 
      00871E C4 81 19         [ 2]  173 	ldw x,farptr+1 
      008720 A3 36 00         [ 2]  174 	cpw x,#app_space  
      008720 88 52            [ 1]  175 	jruge to_flash 
      0007AB                        176 to_eeprom:
      008722 04 C6 00         [ 4]  177 	call unlock_eeprom
      008725 0B 6B            [ 2]  178 	jra do_programming
      0007B0                        179 to_flash:
      008727 03 35 10         [ 4]  180 	call unlock_flash
      0007B3                        181 do_programming:
      00872A 00               [ 2]  182 	popw x 
      00872B 0B C6 00         [ 4]  183 	call tib
      00872E 24 6B 04 A6      [ 1]  184 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      008732 0D CD 89 C4      [ 1]  185 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      008736 17               [ 4]  186 	ret 
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
      0007C0                        197 block_erase:
      008737 01               [ 2]  198 	pushw x 
      008738 A6 10 90         [ 1]  199 	ld a,farptr 
      00873B A3 00            [ 1]  200 	jrne erase_flash
      00873D 10 2A 02         [ 2]  201 	ldw x,farptr+1
      008740 90 9F 00         [ 2]  202 	cpw x,#app_space 
      008742 24 0C            [ 1]  203 	jruge erase_flash 
                                    204 ; erase eeprom block
      008742 CD 86 F1         [ 4]  205 	call unlock_eeprom 
      008745 16 01 72         [ 4]  206 	call tib 
      008748 A2 00 10 90      [ 1]  207 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      00874C A3 00            [ 2]  208 	jra erase_exit  
                                    209 ; erase flash block:
      0007DA                        210 erase_flash:
      00874E 01 2A E5         [ 4]  211 	call unlock_flash 
      008751 7B 03 C7         [ 4]  212 	call tib 
      008754 00 0B 7B 04      [ 1]  213     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0007E4                        214 erase_exit: 
      008758 C7               [ 2]  215 	popw x 
      008759 00               [ 4]  216 	ret 
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
      0007E6                        232 write_byte:
      00875A 24 5B            [ 2]  233 	pushw y
      0007E8                        234 	_vars VSIZE
      00875C 04 84            [ 2]    1     sub sp,#VSIZE 
      00875E 81 01            [ 1]  235 	ld (BTW,sp),a ; byte to write 
      00875F 0F 02            [ 1]  236 	clr (OPT,sp)  ; OPTION flag
                                    237 ; put addr[15:0] in Y, for bounds check.
      00875F 72 06 50 5F      [ 2]  238 	ldw y,farptr+1   ; Y=addr15:0
                                    239 ; check addr[23:16], if <> 0 then it is extened flash memory
      008763 15 35 00 50      [ 1]  240 	tnz farptr 
      008767 5B 35            [ 1]  241 	jrne write_flash
      008769 FF 50 5C 35      [ 2]  242     cpw y,#app_space 	 
      00876D AE 50            [ 1]  243     jruge write_flash
      00876F 64 35 56 50      [ 2]  244 	cpw y,#EEPROM_BASE  
      008773 64 72            [ 1]  245     jrult write_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      008775 07 50 5F FB      [ 2]  246 	cpw y,#OPTION_END 
      008779 81 51            [ 1]  247 	jrugt write_exit
      00877A 20 16            [ 2]  248 	jra write_eeprom 
                                    249 ; write program memory
      00080C                        250 write_flash:
      00877A 72 02 50         [ 4]  251 	call unlock_flash 
      00877D 5F               [ 1]  252 1$:	sim 
      00877E 15 35            [ 1]  253 	ld a,(BTW,sp)
      008780 00 50 5B 35      [ 4]  254 	ldf ([farptr],x),a ; farptr[x]=A
      008784 FF 50 5C 35 56   [ 2]  255 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008789 50               [ 1]  256     rim 
      00878A 62 35 AE 50      [ 1]  257     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00878E 62 72            [ 2]  258     jra write_exit
                                    259 ; write eeprom and option
      000822                        260 write_eeprom:
      008790 03 50 5F         [ 4]  261 	call unlock_eeprom
                                    262 	; check for data eeprom or option eeprom
      008793 FB 81 48 00      [ 2]  263 	cpw y,#OPTION_BASE
      008795 2B 08            [ 1]  264 	jrmi 1$
      008795 88 90 89 35      [ 2]  265 	cpw y,#OPTION_END+1
      008799 20 50            [ 1]  266 	jrpl 1$
      00879B 5B 35            [ 1]  267 	cpl (OPT,sp)
      000833                        268 1$: 
      00879D DF 50            [ 1]  269     tnz (OPT,sp)
      00879F 5C 4F            [ 1]  270     jreq 2$
                                    271 	; pour modifier une option il faut modifier ces 2 bits
      0087A1 90 5F 91 A7      [ 1]  272     bset FLASH_CR2,#FLASH_CR2_OPT
      0087A5 00 19 90 5C      [ 1]  273     bres FLASH_NCR2,#FLASH_CR2_OPT 
      00083F                        274 2$: 
      0087A9 91 A7            [ 1]  275     ld a,(BTW,sp)
      0087AB 00 19 90 5C      [ 4]  276     ldf ([farptr],x),a
      0087AF 91 A7            [ 1]  277     tnz (OPT,sp)
      0087B1 00 19            [ 1]  278     jreq 3$
      0087B3 90               [ 1]  279     incw x
      0087B4 5C 91            [ 1]  280     ld a,(BTW,sp)
      0087B6 A7               [ 1]  281     cpl a
      0087B7 00 19 72 05      [ 4]  282     ldf ([farptr],x),a
      0087BB 50 5F FB 90 85   [ 2]  283 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0087C0 84 81 50 5F FB   [ 2]  284 	btjf FLASH_IAPSR,#FLASH_IAPSR_HVOFF,.
      0087C2                        285 write_exit:
      0087C2                        286 	_drop VSIZE 
      0087C2 89 90            [ 2]    1     addw sp,#VSIZE 
      0087C4 89 AE            [ 2]  287 	popw y
      0087C6 87               [ 4]  288     ret
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
      000860                        304 	_argofs 3 
                           000005     1     ARG_OFS=2+3 
      000860                        305 	_arg BSIZE 1  ; block size
                           000006     1     BSIZE=ARG_OFS+1 
                                    306 	; local var 
                           000001   307 	XSAVE=1 
                           000002   308 	VSIZE=2 
      000860                        309 write_block::
      0087C7 C2               [ 1]  310 	push a 
      000861                        311 	_vars VSIZE
      0087C8 1D 87            [ 2]    1     sub sp,#VSIZE 
      0087CA 95 CF            [ 2]  312 	ldw (XSAVE,sp),x 
      0087CC 00 0E            [ 2]  313 	ldw x,(BSIZE,sp) 
      0087CE AE 16            [ 1]  314 	jreq 9$
      0087D0 68 90            [ 2]  315 1$:	ldw x,(XSAVE,sp)
      0087D2 AE 87            [ 1]  316 	ld a,(y)
      0087D4 95 CD 94         [ 4]  317 	call write_byte 
      0087D7 9D               [ 1]  318 	incw x 
      0087D8 90 85            [ 1]  319 	incw y 
      0087DA 85 81            [ 2]  320 	ldw (XSAVE,sp),x
      0087DC 1E 06            [ 2]  321 	ldw x,(BSIZE,sp)
      0087DC 88               [ 2]  322 	decw x
      0087DD 90 89            [ 2]  323 	ldw (BSIZE,sp),x 
      0087DF 4B 80            [ 1]  324 	jrne 1$
      00087C                        325 9$:
      0087E1 72 10            [ 2]  326 	ldw x,(XSAVE,sp)
      0087E3 50 5B 72         [ 4]  327 	call incr_farptr
      000881                        328 	_drop VSIZE
      0087E6 11 50            [ 2]    1     addw sp,#VSIZE 
      0087E8 5C               [ 1]  329 	pop a 
      0087E9 90               [ 4]  330 	ret 
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
      000885                        347 write_nbytes:
      0087EA 5F F6            [ 2]  348 	pushw y
      0087EC 91               [ 1]  349 	push a 
      0087ED A7 00            [ 1]  350 	ldw y,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0087EF 19               [ 1]  351 	clrw x 
      00088B                        352 1$:  
      0087F0 5C 90            [ 1]  353 	ld a,(y)
      0087F2 5C 0A            [ 1]  354 	incw y
      0087F4 01 26 F4         [ 4]  355 	call write_byte 
      0087F7 72               [ 1]  356 	incw x 
      0087F8 05 50            [ 1]  357 	dec (1,sp)  
      0087FA 5F FB            [ 1]  358 	jrne 1$ 
      0087FC 5B               [ 1]  359 9$: pop a 
      0087FD 01 90            [ 2]  360 	popw y 
      0087FF 85               [ 4]  361 	ret 
                                    362 
                                    363 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    364 ;;;  flash memory operations
                                    365 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    366 
                                    367 ;--------------------------
                                    368 ; align farptr to BLOCK_SIZE 
                                    369 ;---------------------------
      00089B                        370 row_align:
      008800 84 81            [ 1]  371 	ld a,#0x7f 
      008802 C4 00 1A         [ 1]  372 	and a,farptr+2 
      008802 27 13            [ 1]  373 	jreq 1$ 
      008802 89 90 89         [ 2]  374 	ldw x,farptr+1 
      008805 AE 88 02         [ 2]  375 	addw x,#BLOCK_SIZE 
      008808 1D 87            [ 1]  376 	jrnc 0$
      00880A DC CF 00 0E      [ 1]  377 	inc farptr 
      00880E AE               [ 1]  378 0$: ld a,xl 
      00880F 16 68            [ 1]  379 	and a,#0x80
      008811 90               [ 1]  380 	ld xl,a
      008812 AE 87 DC         [ 2]  381 	ldw farptr+1,x  	
      008815 CD               [ 4]  382 1$:	ret
                                    383 
                                    384 ;--------------------
                                    385 ; input:
                                    386 ;   X     increment 
                                    387 ; output:
                                    388 ;   farptr  incremented 
                                    389 ;---------------------
      0008B6                        390 incr_farptr:
      008816 94 9D 90 85      [ 2]  391 	addw x,farptr+1 
      00881A 85 81            [ 1]  392 	jrnc 1$
      00881C 72 5C 00 18      [ 1]  393 	inc farptr 
      00881C 89 72 5D         [ 2]  394 1$:	ldw farptr+1,x  
      00881F 00               [ 4]  395 	ret 
                                    396 
                                    397 ;-----------------------------------
                                    398 ; scan block for non zero byte 
                                    399 ; block are 128 bytes 
                                    400 ; input:
                                    401 ;    farptr     address block  
                                    402 ; output:
                                    403 ;     A     0 cleared, other not cleared  
                                    404 ;-----------------------------------
      0008C4                        405 scan_block:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      008820 19               [ 1]  406 	clrw x 
      008821 26 0D CE 00      [ 5]  407 1$: ldf a,([farptr],x) 
      008825 1A A3            [ 1]  408 	jrne 2$
      008827 B6               [ 1]  409 	incw x 
      008828 80 24 05         [ 2]  410 	cpw x,#BLOCK_SIZE 
      00882B 25 F4            [ 1]  411 	jrult 1$ 
      00882B CD               [ 4]  412 2$:	ret 
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
      0008D2                         66 Uart1RxHandler: ; console receive char 
      00882C 87 5F 20 03 27   [ 2]   67 	btjf UART1_SR,#UART_SR_RXNE,5$
      008830 C6 52 31         [ 1]   68 	ld a,UART1_DR 
      008830 CD 87            [ 1]   69 	cp a,#CTRL_C 
      008832 7A 06            [ 1]   70 	jrne 2$
      008833 CD 09 44         [ 4]   71 	call putc 
      008833 85 CD 16         [ 2]   72 	jp user_interrupted
      0008E4                         73 2$:
      008836 68 72            [ 1]   74 	cp a,#CAN ; CTRL_X 
      008838 13 50            [ 1]   75 	jrne 3$
      00883A 5F 72 17         [ 2]   76 	jp cold_start 	
      00883D 50               [ 1]   77 3$:	push a 
      00883E 5F 81            [ 1]   78 	ld a,#rx1_queue 
      008840 CB 00 2F         [ 1]   79 	add a,rx1_tail 
      008840 89               [ 1]   80 	clrw x 
      008841 C6               [ 1]   81 	ld xl,a 
      008842 00               [ 1]   82 	pop a 
      008843 19               [ 1]   83 	ld (x),a 
      008844 26 14 CE         [ 1]   84 	ld a,rx1_tail 
      008847 00               [ 1]   85 	inc a 
      008848 1A A3            [ 1]   86 	and a,#RX_QUEUE_SIZE-1
      00884A B6 80 24         [ 1]   87 	ld rx1_tail,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      00884D 0C               [11]   88 5$:	iret 
                                     89 
                                     90 ;---------------------------------------------
                                     91 ; initialize UART1, 115200 8N1
                                     92 ; input:
                                     93 ;	none
                                     94 ; output:
                                     95 ;   none
                                     96 ;---------------------------------------------
      0008FF                         97 uart1_init:
      00884E CD 87 5F CD      [ 1]   98     bset PA_DDR,#UART1_TX_PIN
      008852 16 68 72 17      [ 1]   99     bset PA_CR1,#UART1_TX_PIN 
      008856 50 5F 20 0A      [ 1]  100     bset PA_CR2,#UART1_TX_PIN 
                                    101 ; enable UART1 clock
      00885A 72 14 50 C7      [ 1]  102 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      00090F                        103 uart1_set_baud: 
      00885A CD               [ 1]  104 	push a 
                                    105 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    106 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      00885B 87 7A            [ 1]  107 	ld a,#CLK_SWR_HSI
      00885D CD 16 68         [ 1]  108 	cp a,CLK_CMSR 
      008860 72 13            [ 1]  109 	jreq 2$ 
      000917                        110 1$: ; 8 Mhz 	
      008862 50 5F 52 33      [ 1]  111 	mov UART1_BRR2,#0x05 ; must be loaded first
      008864 35 04 52 32      [ 1]  112 	mov UART1_BRR1,#0x4
      008864 85 81            [ 2]  113 	jra 3$
      008866                        114 2$: ; 16 Mhz 	
      008866 90 89 52 02      [ 1]  115 	mov UART1_BRR2,#0x0b ; must be loaded first
      00886A 6B 01 0F 02      [ 1]  116 	mov UART1_BRR1,#0x08
      000929                        117 3$:
      00886E 90 CE 00 1A      [ 1]  118     clr UART1_DR
      008872 72 5D 00 19      [ 1]  119 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008876 26 14 90 A3      [ 1]  120 	bset UART1_CR2,#UART_CR2_SBK
      00887A B6 80 24 0E 90   [ 2]  121     btjf UART1_SR,#UART_SR_TC,.
      00887F A3 40 00 25      [ 1]  122     clr rx1_head 
      008883 57 90 A3 48      [ 1]  123 	clr rx1_tail
      008887 7F               [ 1]  124 	pop a  
      008888 22               [ 4]  125 	ret
                                    126 
                                    127 ;---------------------------------
                                    128 ; uart1_putc
                                    129 ; send a character via UART1
                                    130 ; input:
                                    131 ;    A  	character to send
                                    132 ;---------------------------------
      000944                        133 putc:: ; console output always on UART1
      000944                        134 uart1_putc:: 
      008889 51 20 16 30 FB   [ 2]  135 	btjf UART1_SR,#UART_SR_TXE,.
      00888C C7 52 31         [ 1]  136 	ld UART1_DR,a 
      00888C CD               [ 4]  137 	ret 
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
      00094D                        148 qgetc::
      00094D                        149 uart1_qgetc::
      00888D 87 7A 9B         [ 1]  150 	ld a,rx1_head 
      008890 7B 01 92         [ 1]  151 	sub a,rx1_tail 
      008893 A7               [ 4]  152 	ret 
                                    153 
                                    154 ;---------------------------------
                                    155 ; wait character from UART1 
                                    156 ; input:
                                    157 ;   none
                                    158 ; output:
                                    159 ;   A 			char  
                                    160 ;--------------------------------	
      000954                        161 getc:: ;console input
      000954                        162 uart1_getc::
      008894 00 19 72         [ 4]  163 	call uart1_qgetc
      008897 05 50            [ 1]  164 	jreq uart1_getc 
      008899 5F               [ 2]  165 	pushw x 
                                    166 ;; rx1_queue must be in page 0 	
      00889A FB 9A            [ 1]  167 	ld a,#rx1_queue
      00889C 72 13 50         [ 1]  168 	add a,rx1_head 
      00889F 5F               [ 1]  169 	clrw x  
      0088A0 20               [ 1]  170 	ld xl,a 
      0088A1 39               [ 1]  171 	ld a,(x)
      0088A2 88               [ 1]  172 	push a
      0088A2 CD 87 5F         [ 1]  173 	ld a,rx1_head 
      0088A5 90               [ 1]  174 	inc a 
      0088A6 A3 48            [ 1]  175 	and a,#RX_QUEUE_SIZE-1
      0088A8 00 2B 08         [ 1]  176 	ld rx1_head,a 
      0088AB 90               [ 1]  177 	pop a  
      0088AC A3               [ 2]  178 	popw x
      0088AD 48               [ 4]  179 	ret 
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
      0088AE 80 2A 02 03 02 82 46   194 convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',KEY_END,'3',SUP,0,0
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
      0088B3                        207 get_escape:
      0088B3 0D 02 27         [ 4]  208     call getc 
      0088B6 08 72            [ 1]  209     cp a,#'[ ; this character is expected after ESC 
      0088B8 1E 50            [ 1]  210     jreq 1$
      0088BA 5B               [ 1]  211     clr a
      0088BB 72               [ 4]  212     ret
      0088BC 1F 50 5C         [ 4]  213 1$: call getc 
      0088BF AE 09 6F         [ 2]  214     ldw x,#convert_table
      00098A                        215 2$:
      0088BF 7B               [ 1]  216     cp a,(x)
      0088C0 01 92            [ 1]  217     jreq 4$
      0088C2 A7 00 19         [ 2]  218     addw x,#2
      0088C5 0D               [ 1]  219     tnz (x)
      0088C6 02 27            [ 1]  220     jrne 2$
      0088C8 08               [ 1]  221     clr a
      0088C9 5C               [ 4]  222     ret 
      0088CA 7B               [ 1]  223 4$: incw x 
      0088CB 01               [ 1]  224     ld a,(x)
      0088CC 43 92            [ 1]  225     cp a,#SUP
      0088CE A7 00            [ 1]  226     jrne 5$
      0088D0 19               [ 1]  227     push a 
      0088D1 72 05 50         [ 4]  228     call getc
      0088D4 5F               [ 1]  229     pop a 
      0009A0                        230 5$:
      0088D5 FB               [ 4]  231     ret 
                                    232 
                                    233 
                                    234 ;-----------------------------
                                    235 ; send an ASCIZ string to UART1 
                                    236 ; input: 
                                    237 ;   x 		char * 
                                    238 ; output:
                                    239 ;   none 
                                    240 ;-------------------------------
      0009A1                        241 puts::
      0088D6 72               [ 1]  242     ld a,(x)
      0088D7 0D 50            [ 1]  243 	jreq 1$
      0088D9 5F FB 44         [ 4]  244 	call putc 
      0088DB 5C               [ 1]  245 	incw x 
      0088DB 5B 02            [ 2]  246 	jra puts 
      0088DD 90               [ 4]  247 1$:	ret 
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
      0009AB                        258 bksp:
      0088DE 85 81            [ 1]  259 	ld a,#BS 
      0088E0 CD 09 44         [ 4]  260 	call putc 
      0088E0 88 52            [ 1]  261 	ld a,#SPACE 
      0088E2 02 1F 01         [ 4]  262 	call putc 
      0088E5 1E 06            [ 1]  263 	ld a,#BS 
      0088E7 27 13 1E         [ 4]  264 	call putc 
      0088EA 01               [ 4]  265 	ret 
                                    266 ;---------------------------
                                    267 ; delete n character left of cursor 
                                    268 ; at terminal.
                                    269 ; input: 
                                    270 ;   A   number of characters to delete.
                                    271 ; output:
                                    272 ;    none 
                                    273 ;--------------------------	
      0009BB                        274 delete_nchar:
      0088EB 90               [ 1]  275 	push a 
      0088EC F6 CD            [ 1]  276 0$:	tnz (1,sp)
      0088EE 88 66            [ 1]  277 	jreq 1$
      0088F0 5C 90 5C         [ 4]  278 	call bksp 
      0088F3 1F 01            [ 1]  279 	dec (1,sp)
      0088F5 1E 06            [ 2]  280 	jra 0$
      0088F7 5A               [ 1]  281 1$:	pop a 
      0088F8 1F               [ 4]  282 	ret
                                    283 
                                    284 ;--------------------------
                                    285 ; send ANSI escape sequence
                                    286 ; ANSI: ESC[
                                    287 ; note: ESC is ASCII 27
                                    288 ;       [   is ASCII 91  
                                    289 ;-------------------------- 
      0009C9                        290 send_escape:
      0088F9 06 26            [ 1]  291 	ld a,#ESC 
      0088FB ED 09 44         [ 4]  292 	call putc 
      0088FC A6 5B            [ 1]  293 	ld a,#'[
      0088FC 1E 01 CD         [ 4]  294 	call putc 
      0088FF 89               [ 4]  295 	ret 
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
      0009D4                        311 send_parameter:
      008900 36               [ 2]  312 	pushw x 
      008901 5B               [ 1]  313 	clrw x 
      008902 02               [ 1]  314 	ld xl,a 
      008903 84 81            [ 1]  315 	ld a,#10 
      008905 62               [ 2]  316 	div x,a 
      008905 90               [ 1]  317 	ld xh,a 
      008906 89               [ 1]  318 	ld a,xl
      008907 88               [ 1]  319     tnz a 
      008908 90 93            [ 1]  320     jreq 2$
      00890A 5F 09            [ 1]  321 	cp a,#9 
      00890B 23 02            [ 2]  322 	jrule 1$
      00890B 90 F6            [ 1]  323 	ld a,#9
      0009E5                        324 1$:
      00890D 90 5C            [ 1]  325 	add a,#'0 
      00890F CD 88 66         [ 4]  326 	call putc
      008912 5C               [ 1]  327 2$:	ld a,xh 
      008913 0A 01            [ 1]  328 	add a,#'0
      008915 26 F4 84         [ 4]  329 	call putc 
      008918 90               [ 2]  330 	popw x 
      008919 85               [ 4]  331 	ret 
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
      0009F2                        344 move_left:
      00891A 81               [ 1]  345 	push a 
      00891B CD 09 C9         [ 4]  346 	call send_escape
      00891B A6               [ 1]  347     pop a
      00891C 7F C4 00         [ 4]  348 	call send_parameter 
      00891F 1B 27            [ 1]  349 	ld a,#'D 
      008921 13 CE 00         [ 4]  350 	call putc 
      008924 1A               [ 4]  351 	ret	
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



      000A00                        362 move_right:
      008925 1C               [ 1]  363 	push a 
      008926 00 80 24         [ 4]  364 	call send_escape
      008929 04               [ 1]  365     pop a
      00892A 72 5C 00         [ 4]  366 	call send_parameter 
      00892D 19 9F            [ 1]  367 	ld a,#'C 
      00892F A4 80 97         [ 4]  368 	call putc 
      008932 CF               [ 4]  369 	ret 
                                    370 
                                    371 
                                    372 ;--------------------------
                                    373 ; print n spaces on terminal
                                    374 ; input:
                                    375 ;  X 		number of spaces 
                                    376 ; output:
                                    377 ;	none 
                                    378 ;---------------------------
      000A0E                        379 spaces::
      008933 00 1A            [ 1]  380 	ld a,#SPACE 
      008935 81               [ 2]  381 1$:	tnzw x
      008936 27 06            [ 1]  382 	jreq 9$
      008936 72 BB 00         [ 4]  383 	call putc 
      008939 1A               [ 2]  384 	decw x
      00893A 24 04            [ 2]  385 	jra 1$
      000A19                        386 9$: 
      00893C 72               [ 4]  387 	ret 
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
      000A1A                        405 insert_char: 
      000A1A                        406 	_vars VSIZE 
      00893D 5C 00            [ 2]    1     sub sp,#VSIZE 
      00893F 19 CF            [ 1]  407     ld (KCHAR,sp),a 
      008941 00               [ 1]  408     ld a,xh 
      008942 1A 81            [ 1]  409 	ld (IPOS,sp),a
      008944 9F               [ 1]  410     ld a,xl 
      008944 5F 92            [ 1]  411     ld (LLEN,sp),a  
      008946 AF               [ 1]  412     ldw x,y
      008947 00               [ 1]  413     incw x 
      008948 19 26            [ 1]  414     ld a,(LLEN,sp)
      00894A 06 5C            [ 1]  415     sub a,(IPOS,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      00894C A3               [ 1]  416     inc a 
      00894D 00 80 25         [ 1]  417     ld acc8,a 
      008950 F4 81 00 0D      [ 1]  418     clr acc16
      008952 CD 14 1D         [ 4]  419     call move
      008952 72 0B 52 30      [ 2]  420     ldw y,#tib 
      008956 27 C6            [ 1]  421     ld a,(IPOS,sp)
      008958 52 31 A1         [ 1]  422     ld acc8,a 
      00895B 03 26 06 CD      [ 2]  423     addw y,acc16 
      00895F 89 C4            [ 1]  424     ld a,(KCHAR,sp)
      008961 CC 80            [ 1]  425     ld (y),a
      008963 D7 5C            [ 1]  426     incw y  
      008964 7B 01            [ 1]  427     ld a,(IPOS,sp)
      008964 A1 18 26         [ 4]  428     call move_left
      008967 03 CC 81         [ 2]  429     ldw x,#tib 
      00896A 43 88 A6         [ 4]  430     call puts 
      00896D 27 CB            [ 1]  431     ld a,(LLEN,sp)
      00896F 00 30            [ 1]  432     sub a,(IPOS,sp) 
      008971 5F 97 84         [ 4]  433     call move_left 
      000A5A                        434 	_drop VSIZE 
      008974 F7 C6            [ 2]    1     addw sp,#VSIZE 
      008976 00               [ 4]  435 	ret 
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
      000A5D                        448 delete_under:
      000A5D                        449 	_vars VSIZE 
      008977 30 4C            [ 2]    1     sub sp,#VSIZE 
      008979 A4 07            [ 1]  450     ld (LLEN,sp),a 
      00897B C7               [ 1]  451     ld a,xl 
      00897C 00 30            [ 1]  452     ld (CPOS,sp),a 
      00897E 80               [ 1]  453     ldw x,y ; move destination
      00897F 90 5C            [ 1]  454     incw y  ; move source 
      00897F 72 1A            [ 1]  455     ld a,(LLEN,sp)
      008981 50 02            [ 1]  456     sub a,(CPOS,sp)
      008983 72               [ 1]  457     inc a ; move including zero at end.
      008984 1A 50 03         [ 1]  458     ld acc8,a 
      008987 72 1A 50 04      [ 1]  459     clr acc16 
      00898B 72 14 50         [ 4]  460 	call move 
      00898E C7 AE 16 68      [ 2]  461     ldw y,#tib 
      00898F 7B 01            [ 1]  462     ld a,(CPOS,sp)
      00898F 88 A6 E1         [ 1]  463     ld acc8,a 
      008992 C1 50 C3 27      [ 2]  464     addw y,acc16 
      008996 0A               [ 1]  465     ldw x,y 
      008997 CD 09 A1         [ 4]  466     call puts 
      008997 35 05            [ 1]  467     ld a,#SPACE  
      008999 52 33 35         [ 4]  468     call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      00899C 04 52            [ 1]  469     ld a,(LLEN,sp)
      00899E 32 20            [ 1]  470     sub a,(CPOS,sp)
      0089A0 08 09 F2         [ 4]  471     call move_left 
      0089A1 0A 02            [ 1]  472     dec (LLEN,sp)
      000A95                        473 	_drop VSIZE 
      0089A1 35 0B            [ 2]    1     addw sp,#VSIZE 
      0089A3 52               [ 4]  474 	ret 
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
      000A98                        486 delete_line:
      0089A4 33 35 08         [ 4]  487     call send_escape
      0089A7 52 32            [ 1]  488 	ld a,#'2
      0089A9 CD 09 44         [ 4]  489 	call putc 
      0089A9 72 5F            [ 1]  490 	ld a,#'K 
      0089AB 52 31 35         [ 4]  491 	call putc 
      0089AE 2C               [ 4]  492 	ret 
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
      000AA6                        524 readln::
      0089AF 52 35            [ 2]  525 	pushw y 
      000AA8                        526 	_vars VSIZE 
      0089B1 72 10            [ 2]    1     sub sp,#VSIZE 
      0089B3 52               [ 1]  527 	clrw x 
      0089B4 35 72            [ 2]  528 	ldw (LL,sp),x 
      0089B6 0D 52            [ 2]  529 	ldw (CPOS,sp),x 
      0089B8 30 FB            [ 1]  530 	cpl (OVRWR,sp) ; default to overwrite mode 
      0089BA 72 5F 00 2F      [ 2]  531  	ldw y,#tib ; terminal input buffer
      000AB5                        532 readln_loop:
      0089BE 72 5F 00         [ 4]  533 	call getc
      0089C1 30 84            [ 1]  534 	ld (RXCHAR,sp),a
      0089C3 81 1B            [ 1]  535     cp a,#ESC 
      0089C4 26 05            [ 1]  536     jrne 0$
      0089C4 CD 09 7B         [ 4]  537     call get_escape 
      0089C4 72 0F            [ 1]  538     ld (RXCHAR,sp),a 
      0089C6 52 30            [ 1]  539 0$:	cp a,#CR
      0089C8 FB C7            [ 1]  540 	jrne 1$
      0089CA 52 31 81         [ 2]  541 	jp readln_quit
      0089CD A1 0A            [ 1]  542 1$:	cp a,#LF 
      0089CD 26 03            [ 1]  543 	jrne 2$ 
      0089CD C6 00 2F         [ 2]  544 	jp readln_quit
      000AD1                        545 2$:
      0089D0 C0 00            [ 1]  546 	cp a,#BS
      0089D2 30 81            [ 1]  547 	jrne 3$
                                    548 ; delete left 
      0089D4 0D 03            [ 1]  549     tnz (CPOS,sp)
      0089D4 27 DC            [ 1]  550     jreq readln_loop 
      0089D4 CD 89            [ 1]  551     ld a,#1 
      0089D6 CD 27 FB         [ 4]  552     call move_left
      0089D9 89 A6            [ 1]  553     dec (CPOS,sp)
      0089DB 27 CB            [ 2]  554     decw y 
      0089DD 00 2F            [ 1]  555     ld a,(CPOS,sp) 
      0089DF 5F 97 F6         [ 2]  556     jp 12$
      000AE7                        557 3$:
      0089E2 88 C6            [ 1]  558 	cp a,#CTRL_D
      0089E4 00 2F            [ 1]  559 	jrne 4$
                                    560 ;delete line 
      0089E6 4C A4 07         [ 4]  561 	call delete_line 
      0089E9 C7 00            [ 1]  562     ld a,(CPOS,sp)
      0089EB 2F               [ 1]  563     inc a 
      0089EC 84 85 81         [ 4]  564     call move_left 
      0089EF 43 81            [ 1]  565 	ld a,#'> 
      0089F1 44 80 48         [ 4]  566 	call putc 
      0089F4 82 46 83 33      [ 2]  567 	ldw y,#tib
      0089F8 84 00            [ 1]  568 	clr (y)
      0089FA 00 02            [ 1]  569 	clr (LL,sp)
      0089FB 0F 03            [ 1]  570 	clr (CPOS,sp)
      0089FB CD 89            [ 2]  571 	jra readln_loop
      000B05                        572 4$:
      0089FD D4 A1            [ 1]  573 	cp a,#CTRL_R 
      0089FF 5B 27            [ 1]  574 	jrne 5$
                                    575 ;repeat line 
      008A01 02 4F            [ 1]  576 	tnz (LL,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      008A03 81 CD            [ 1]  577 	jrne readln_loop
      008A05 89 D4 AE 89      [ 2]  578 	ldw y,#tib 
      008A09 EF               [ 1]  579 	ldw x,y
      008A0A CD 13 F1         [ 4]  580 	call strlen
      008A0A F1               [ 1]  581 	tnz a  
      008A0B 27 08            [ 1]  582 	jreq readln_loop
      008A0D 1C 00            [ 1]  583 	ld (LL,sp),a 
      008A0F 02 7D            [ 1]  584     ld (CPOS,sp),a
      008A11 26               [ 1]  585 	ldw x,y  
      008A12 F7 4F 81         [ 4]  586 	call puts
      008A15 5C F6            [ 1]  587 	clr (LL_HB,sp)
      008A17 A1 84 26         [ 2]  588 	addw y,(LL_HB,sp)
      008A1A 05 88            [ 2]  589 	jra readln_loop 
      000B27                        590 5$:
      008A1C CD 89            [ 1]  591 	cp a,#CTRL_E 
      008A1E D4 84            [ 1]  592 	jrne 6$
                                    593 ;edit line number 
      008A20 AE 16 68         [ 2]  594 	ldw x,#tib 
      008A20 81 18 A5         [ 4]  595 	call atoi24
      008A21 CE 00 0D         [ 2]  596 	ldw x,acc16
      008A21 F6 27 06         [ 4]  597 	call search_lineno
      008A24 CD               [ 2]  598 	tnzw x 
      008A25 89 C4            [ 1]  599 	jrne 51$
                                    600 ;	clr (LL,sp)
                                    601 ;	ldw y,#tib
                                    602 ;   clr (y) 	
      008A27 5C 20 F7         [ 2]  603 	jp readln_quit  
      000B3D                        604 51$:
      008A2A 81 00 04         [ 2]  605 	ldw basicptr,x
      008A2B E6 02            [ 1]  606 	ld a,(2,x)
      008A2B A6 08 CD         [ 1]  607 	ld count,a 
      008A2E 89 C4 A6 20      [ 2]  608 	ldw y,#tib 
      008A32 CD 89 C4         [ 4]  609 	call decompile 
      008A35 A6 08            [ 1]  610 	clr (LL_HB,sp)
      008A37 CD 89            [ 1]  611 	ld a,#CR 
      008A39 C4 81 44         [ 4]  612 	call putc 
      008A3B A6 3E            [ 1]  613 	ld a,#'>
      008A3B 88 0D 01         [ 4]  614 	call putc
      008A3E 27 07 CD         [ 2]  615     ldw x,#tib  
      008A41 8A 2B 0A         [ 4]  616 	call strlen 
      008A44 01 20            [ 1]  617 	ld (LL,sp),a 
      008A46 F5 84 81         [ 4]  618 	call puts 
      008A49 90 93            [ 1]  619 	ldw y,x
      008A49 A6 1B            [ 1]  620     ld a,(LL,sp)
      008A4B CD 89            [ 1]  621     ld (CPOS,sp),a  
      008A4D C4 A6 5B         [ 2]  622 	jp readln_loop
      000B6C                        623 6$:
      008A50 CD 89            [ 1]  624 	cp a,#ARROW_RIGHT
      008A52 C4 81            [ 1]  625    	jrne 7$ 
                                    626 ; right arrow
      008A54 7B 03            [ 1]  627 	ld a,(CPOS,sp)
      008A54 89 5F            [ 1]  628     cp a,(LL,sp)
      008A56 97 A6            [ 1]  629     jrmi 61$
      008A58 0A 62 95         [ 2]  630     jp readln_loop 
      000B79                        631 61$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      008A5B 9F 4D            [ 1]  632     ld a,#1 
      008A5D 27 0B A1         [ 4]  633 	call move_right 
      008A60 09 23            [ 1]  634 	inc (CPOS,sp)
      008A62 02 A6            [ 1]  635     incw y 
      008A64 09 0A B5         [ 2]  636     jp readln_loop 
      008A65 A1 80            [ 1]  637 7$: cp a,#ARROW_LEFT  
      008A65 AB 30            [ 1]  638 	jrne 8$
                                    639 ; left arrow 
      008A67 CD 89            [ 1]  640 	tnz (CPOS,sp)
      008A69 C4 9E            [ 1]  641 	jrne 71$
      008A6B AB 30 CD         [ 2]  642 	jp readln_loop
      000B90                        643 71$:
      008A6E 89 C4            [ 1]  644     ld a,#1 
      008A70 85 81 F2         [ 4]  645 	call move_left 
      008A72 0A 03            [ 1]  646 	dec (CPOS,sp)
      008A72 88 CD            [ 2]  647     decw y 
      008A74 8A 49 84         [ 2]  648 	jp readln_loop 
      008A77 CD 8A            [ 1]  649 8$: cp a,#HOME  
      008A79 54 A6            [ 1]  650 	jrne 9$
                                    651 ; HOME 
      008A7B 44 CD            [ 1]  652     ld a,(CPOS,sp)
      008A7D 89 C4 81         [ 4]  653     call move_left 
      008A80 0F 03            [ 1]  654 	clr (CPOS,sp)
      008A80 88 CD 8A 49      [ 2]  655     ldw y,#tib 
      008A84 84 CD 8A         [ 2]  656 	jp readln_loop  
      008A87 54 A6            [ 1]  657 9$: cp a,#KEY_END  
      008A89 43 CD            [ 1]  658 	jrne 10$
                                    659 ; KEY_END 
      008A8B 89 C4            [ 1]  660 	ld a,(CPOS,sp)
      008A8D 81 02            [ 1]  661 	cp a,(LL,sp)
      008A8E 26 03            [ 1]  662 	jrne 91$
      008A8E A6 20 5D         [ 2]  663 	jp readln_loop 
      000BBB                        664 91$:
      008A91 27 06            [ 1]  665 	ld a,(LL,sp)
      008A93 CD 89            [ 1]  666 	sub a,(CPOS,sp)
      008A95 C4 5A 20         [ 4]  667 	call move_right 
      008A98 F7 02            [ 1]  668 	ld a,(LL,sp)
      008A99 6B 03            [ 1]  669 	ld (CPOS,sp),a
      008A99 81 AE 16 68      [ 2]  670     ldw y,#tib
      008A9A 72 5F 00 0D      [ 1]  671     clr acc16 
      008A9A 52 03 6B         [ 1]  672     ld acc8,a 
      008A9D 02 9E 6B 01      [ 2]  673     addw y,acc16  
      008AA1 9F 6B 03         [ 2]  674 	jp readln_loop 
      008AA4 93 5C            [ 1]  675 10$: cp a,#CTRL_O
      008AA6 7B 03            [ 1]  676 	jrne 11$ 
                                    677 ; toggle between insert/overwrite
      008AA8 10 01            [ 1]  678 	cpl (OVRWR,sp)
      008AAA 4C C7 00         [ 4]  679 	call beep_1khz
      008AAD 0F 72 5F         [ 2]  680 	jp readln_loop 
      008AB0 00 0E            [ 1]  681 11$: cp a,#SUP 
      008AB2 CD 94            [ 1]  682     jrne final_test 
                                    683 ; del character under cursor 
      008AB4 9D 90            [ 1]  684     ld a,(CPOS,sp)
      008AB6 AE 16            [ 1]  685     cp a,(LL,sp)
      008AB8 68 7B            [ 1]  686     jrpl 13$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      000BEE                        687 12$:
      008ABA 01               [ 1]  688     ld xl,a    ; cursor position 
      008ABB C7 00            [ 1]  689     ld a,(LL,sp)  ; line length
      008ABD 0F 72 B9         [ 4]  690     call delete_under
      008AC0 00 0E            [ 1]  691     dec (LLEN,sp)
      000BF6                        692 13$:
      008AC2 7B 02 90         [ 2]  693     jp readln_loop 
      000BF9                        694 final_test:
      008AC5 F7 90            [ 1]  695 	cp a,#SPACE
      008AC7 5C 7B            [ 1]  696 	jrpl accept_char
      008AC9 01 CD 8A         [ 2]  697 	jp readln_loop
      000C00                        698 accept_char:
      008ACC 72 AE            [ 1]  699 	ld a,#TIB_SIZE-1
      008ACE 16 68            [ 1]  700 	cp a, (LL,sp)
      008AD0 CD 8A            [ 1]  701 	jrpl 1$
      008AD2 21 7B 03         [ 2]  702 	jp readln_loop
      008AD5 10 01            [ 1]  703 1$:	tnz (OVRWR,sp)
      008AD7 CD 8A            [ 1]  704 	jrne overwrite
                                    705 ; insert mode 
      008AD9 72 5B            [ 1]  706     ld a,(CPOS,sp)
      008ADB 03 81            [ 1]  707     cp a,(LL,sp)
      008ADD 27 12            [ 1]  708     jreq overwrite
      008ADD 52 02            [ 1]  709     ld a,(LL,sp)
      008ADF 6B               [ 1]  710     ld xl,a 
      008AE0 02 9F            [ 1]  711     ld a,(CPOS,sp)
      008AE2 6B               [ 1]  712     ld xh,a
      008AE3 01 93            [ 1]  713     ld a,(RXCHAR,sp)
      008AE5 90 5C 7B         [ 4]  714     call insert_char
      008AE8 02 10            [ 1]  715     inc (LLEN,sp)
      008AEA 01 4C            [ 1]  716     inc (CPOS,sp)	
      008AEC C7 00 0F         [ 2]  717     jp readln_loop 
      000C25                        718 overwrite:
      008AEF 72 5F            [ 1]  719 	ld a,(RXCHAR,sp)
      008AF1 00 0E            [ 1]  720 	ld (y),a
      008AF3 CD 94            [ 1]  721     incw y
      008AF5 9D 90 AE         [ 4]  722     call putc 
      008AF8 16 68            [ 1]  723 	ld a,(CPOS,sp)
      008AFA 7B 01            [ 1]  724 	cp a,(LL,sp)
      008AFC C7 00            [ 1]  725 	jrmi 1$
      008AFE 0F 72            [ 1]  726 	clr (y)
      008B00 B9 00            [ 1]  727 	inc (LL,sp)
      008B02 0E 93            [ 1]  728     inc (CPOS,sp)
      008B04 CD 8A 21         [ 2]  729 	jp readln_loop 
      000C3D                        730 1$:	
      008B07 A6 20            [ 1]  731 	inc (CPOS,sp)
      008B09 CD 89 C4         [ 2]  732 	jp readln_loop 
      000C42                        733 readln_quit:
      008B0C 7B 02 10 01      [ 2]  734 	ldw y,#tib
      008B10 CD 8A            [ 1]  735     clr (LL_HB,sp) 
      008B12 72 0A 02         [ 2]  736     addw y,(LL_HB,sp)
      008B15 5B 02            [ 1]  737     clr (y)
      008B17 81 02            [ 1]  738 	ld a,(LL,sp)
      008B18 C7 00 03         [ 1]  739 	ld count,a 
      008B18 CD 8A            [ 1]  740 	ld a,#CR
      008B1A 49 A6 32         [ 4]  741 	call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      000C57                        742 	_drop VSIZE 
      008B1D CD 89            [ 2]    1     addw sp,#VSIZE 
      008B1F C4 A6            [ 2]  743 	popw y 
      008B21 4B               [ 4]  744 	ret
                                    745 
                                    746 ;------------------------------
                                    747 ; print byte  in hexadecimal 
                                    748 ; on console
                                    749 ; input:
                                    750 ;    A		byte to print
                                    751 ;------------------------------
      000C5C                        752 print_hex::
      008B22 CD               [ 1]  753 	push a 
      008B23 89               [ 1]  754 	swap a 
      008B24 C4 81 73         [ 4]  755 	call to_hex_char 
      008B26 CD 09 44         [ 4]  756 	call putc 
      008B26 90 89            [ 1]  757     ld a,(1,sp) 
      008B28 52 04 5F         [ 4]  758 	call to_hex_char
      008B2B 1F 02 1F         [ 4]  759 	call putc
      008B2E 03 03            [ 1]  760 	ld a,#SPACE 
      008B30 04 90 AE         [ 4]  761 	call putc 
      008B33 16               [ 1]  762 	pop a 
      008B34 68               [ 4]  763 	ret 
                                    764 
                                    765 ;----------------------------------
                                    766 ; convert to hexadecimal digit 
                                    767 ; input:
                                    768 ;   A       digit to convert 
                                    769 ; output:
                                    770 ;   A       hexdecimal character 
                                    771 ;----------------------------------
      008B35                        772 to_hex_char::
      008B35 CD 89            [ 1]  773 	and a,#15 
      008B37 D4 6B            [ 1]  774 	cp a,#9 
      008B39 01 A1            [ 2]  775 	jrule 1$ 
      008B3B 1B 26            [ 1]  776 	add a,#7
      008B3D 05 CD            [ 1]  777 1$: add a,#'0 
      008B3F 89               [ 4]  778 	ret 
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
      000C7E                         51 search_lineno::
      000C7E                         52 	_vars VSIZE
      008B40 FB 6B            [ 2]    1     sub sp,#VSIZE 
      008B42 01 A1            [ 1]   53 	clr (LL,sp)
      008B44 0D 26 03 CC      [ 2]   54 	ldw y,txtbgn
      008B48 8C               [ 1]   55 	tnz a 
      008B49 C2 A1            [ 1]   56 	jreq search_ln_loop
      008B4B 0A 26 03 CC      [ 2]   57 	ldw y,basicptr 
      000C8D                         58 search_ln_loop:
      008B4F 8C C2 00 1D      [ 2]   59 	cpw y,txtend 
      008B51 2A 10            [ 1]   60 	jrpl 8$
      008B51 A1 08            [ 1]   61 	cpw x,(y)
      008B53 26 12            [ 1]   62 	jreq 9$
      008B55 0D 03            [ 1]   63 	jrmi 8$ 
      008B57 27 DC A6         [ 1]   64 	ld a,(2,y)
      008B5A 01 CD            [ 1]   65 	ld (LB,sp),a 
      008B5C 8A 72 0A         [ 2]   66 	addw y,(LL,sp)
      008B5F 03 90            [ 2]   67 	jra search_ln_loop 
      000CA3                         68 8$: 
      008B61 5A               [ 1]   69 	clrw x 	
      008B62 7B               [ 1]   70 	exgw x,y 
      000CA5                         71 9$: _drop VSIZE
      008B63 03 CC            [ 2]    1     addw sp,#VSIZE 
      008B65 8C               [ 1]   72 	exgw x,y   
      008B66 6E               [ 4]   73 	ret 
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
      008B67                         83 del_line: 
      000CA9                         84 	_vars VSIZE 
      008B67 A1 04            [ 2]    1     sub sp,#VSIZE 
      008B69 26 1A            [ 1]   85 	ld a,(2,x) ; line length
      008B6B CD 8B            [ 1]   86 	ld (LLEN+1,sp),a 
      008B6D 18 7B            [ 1]   87 	clr (LLEN,sp)
      008B6F 03 4C            [ 1]   88 	ldw y,x  
      008B71 CD 8A 72         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      008B74 A6 3E            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      008B76 CD 89 C4 90      [ 2]   91 	ldw y,txtend 
      008B7A AE 16 68         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      008B7D 90 7F 0F 02      [ 2]   93 	ldw acc16,y 
      008B81 0F 03            [ 2]   94 	ldw y,(SRC,sp)    ; source
      008B83 20 B0 1D         [ 4]   95 	call move
      008B85 90 CE 00 1D      [ 2]   96 	ldw y,txtend 
      008B85 A1 12 26         [ 2]   97 	subw y,(LLEN,sp)
      008B88 1E 0D 02 26      [ 2]   98 	ldw txtend,y  
      000CD3                         99 	_drop VSIZE     
      008B8C A8 90            [ 2]    1     addw sp,#VSIZE 
      008B8E AE               [ 4]  100 	ret 
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
      000CD6                        115 create_gap:
      000CD6                        116 	_vars VSIZE
      008B8F 16 68            [ 2]    1     sub sp,#VSIZE 
      008B91 93 CD            [ 2]  117 	ldw (SRC,sp),x 
      008B93 94 71            [ 2]  118 	ldw (LEN,sp),y 
      008B95 4D 27 9D 6B      [ 2]  119 	ldw acc16,y 
      008B99 02 6B            [ 1]  120 	ldw y,x ; SRC
      008B9B 03 93 CD 8A      [ 2]  121 	addw x,acc16  
      008B9F 21 0F            [ 2]  122 	ldw (DEST,sp),x 
                                    123 ;compute size to move 	
      008BA1 01 72 F9         [ 2]  124 	ldw x,txtend 
      008BA4 01 20 8E         [ 2]  125 	subw x,(SRC,sp)
      008BA7 CF 00 0D         [ 2]  126 	ldw acc16,x ; size to move
      008BA7 A1 05            [ 2]  127 	ldw x,(DEST,sp) 
      008BA9 26 41 AE         [ 4]  128 	call move
      008BAC 16 68 CD         [ 2]  129 	ldw x,txtend
      008BAF 99 25 CE         [ 2]  130 	addw x,(LEN,sp)
      008BB2 00 0E CD         [ 2]  131 	ldw txtend,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      000CFF                        132 9$:	_drop VSIZE 
      008BB5 8C FE            [ 2]    1     addw sp,#VSIZE 
      008BB7 5D               [ 4]  133 	ret 
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
      000D02                        150 insert_line:
      000D02                        151 	_vars VSIZE 
      008BB8 26 03            [ 2]    1     sub sp,#VSIZE 
      008BBA CC 8C C2         [ 2]  152 	ldw x,txtend  
      008BBD C3 00 1B         [ 2]  153 	cpw x,txtbgn 
      008BBD CF 00            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      008BBF 05 E6 02         [ 2]  156 	ldw x,#2 
      008BC2 C7 00 04 90      [ 4]  157 	ld a,([ptr16],x)
      008BC6 AE 16            [ 1]  158 	cp a,#3
      008BC8 68 CD            [ 1]  159 	jreq insert_ln_exit
      008BCA 92               [ 1]  160 	clrw x 
      008BCB 87               [ 1]  161 	ld xl,a
      008BCC 0F 01            [ 2]  162 	ldw (LLEN,sp),x 
      008BCE A6 0D CD         [ 2]  163 	ldw x,txtbgn
      008BD1 89 C4            [ 2]  164 	ldw (DEST,sp),x 
      008BD3 A6 3E CD         [ 2]  165 	ldw x,txtend 
      008BD6 89 C4            [ 2]  166 	jra 4$
      008BD8 AE 16 68 CD      [ 5]  167 0$:	ldw x,[ptr16]
                                    168 ; line number
      008BDC 94 71            [ 2]  169 	ldw (LINENO,sp),x 
      008BDE 6B 02 CD         [ 2]  170 	ldw x,#2 
      008BE1 8A 21 90 93      [ 4]  171 	ld a,([ptr16],x)
      008BE5 7B               [ 1]  172 	ld xl,a
                                    173 ; line length
      008BE6 02 6B            [ 2]  174 	ldw (LLEN,sp),x
                                    175 ; check if that line number already exit 	
      008BE8 03 CC            [ 2]  176 	ldw x,(LINENO,sp)
      008BEA 8B               [ 1]  177 	clr a 
      008BEB 35 0C 7E         [ 4]  178 	call search_lineno 
      008BEC 5D               [ 2]  179 	tnzw x 
      008BEC A1 81            [ 1]  180 	jrne 2$
                                    181 ; line doesn't exit
                                    182 ; it will be inserted at this point.  	
      008BEE 26 15            [ 2]  183 	ldw (DEST,sp),y 
      008BF0 7B 03            [ 2]  184 	jra 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                    185 ; line exit delete it.
                                    186 ; it will be replaced by new one 	
      008BF2 11 02            [ 2]  187 2$: ldw (DEST,sp),x 
      008BF4 2B 03 CC         [ 4]  188 	call del_line
      000D47                        189 3$: 
                                    190 ; insert new line or leave if LLEN==3
                                    191 ; LLEN==3 means empty line 
      008BF7 8B 35            [ 1]  192 	ld a,#3
      008BF9 11 08            [ 1]  193 	cp a,(LLEN+1,sp)
      008BF9 A6 01            [ 1]  194 	jreq insert_ln_exit ; empty line exit.
                                    195 ; if insertion point at txtend 
                                    196 ; move no need to create a gap 
      008BFB CD 8A            [ 2]  197 	ldw x,(DEST,sp)
      008BFD 80 0C 03         [ 2]  198 	cpw x,txtend 
      008C00 90 5C            [ 1]  199 	jreq 4$ 
                                    200 ; must create a gap
                                    201 ; at insertion point  
      008C02 CC 8B            [ 2]  202 	ldw x,(DEST,sp)
      008C04 35 A1            [ 2]  203 	ldw y,(LLEN,sp)
      008C06 80 26 13         [ 4]  204 	call create_gap
      008C09 0D 03            [ 2]  205 	jra 5$
      000D5D                        206 4$: 
      008C0B 26 03 CC         [ 2]  207 	addw x,(LLEN,sp)
      008C0E 8B 35 1D         [ 2]  208 	ldw txtend,x 	 
                                    209 ; move new line in gap 
      008C10 1E 07            [ 2]  210 5$:	ldw x,(LLEN,sp)
      008C10 A6 01 CD         [ 2]  211 	ldw acc16,x 
      008C13 8A 72 0A 03      [ 2]  212 	ldw y,#pad ;SRC 
      008C17 90 5A            [ 2]  213 	ldw x,(DEST,sp) ; dest address 
      008C19 CC 8B 35         [ 4]  214 	call move 
      000D71                        215 insert_ln_exit:	
      000D71                        216 	_drop VSIZE
      008C1C A1 82            [ 2]    1     addw sp,#VSIZE 
      008C1E 26               [ 4]  217 	ret
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
      000D74                        233 parse_quote: 
      000D74                        234 	_vars VSIZE 
      008C1F 0E 7B            [ 2]    1     sub sp,#VSIZE 
      008C21 03               [ 1]  235 	clr a
      008C22 CD 8A            [ 1]  236 1$:	ld (PREV,sp),a 
      000D79                        237 2$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      008C24 72 0F 03         [ 4]  238 	ld a,([in.w],y)
      008C27 90 AE            [ 1]  239 	jreq 6$
      008C29 16 68 CC 8B      [ 1]  240 	inc in 
      008C2D 35 A1            [ 1]  241 	ld (CURR,sp),a 
      008C2F 83 26            [ 1]  242 	ld a,#'\
      008C31 26 7B            [ 1]  243 	cp a, (PREV,sp)
      008C33 03 11            [ 1]  244 	jrne 3$
      008C35 02 26            [ 1]  245 	clr (PREV,sp)
      008C37 03 CC            [ 1]  246 	ld a,(CURR,sp)
      008C39 8B 35            [ 4]  247 	callr convert_escape
      008C3B F7               [ 1]  248 	ld (x),a 
      008C3B 7B               [ 1]  249 	incw x 
      008C3C 02 10            [ 2]  250 	jra 2$
      000D94                        251 3$:
      008C3E 03 CD            [ 1]  252 	ld a,(CURR,sp)
      008C40 8A 80            [ 1]  253 	cp a,#'\'
      008C42 7B 02            [ 1]  254 	jreq 1$
      008C44 6B 03            [ 1]  255 	cp a,#'"
      008C46 90 AE            [ 1]  256 	jreq 6$ 
      008C48 16               [ 1]  257 	ld (x),a 
      008C49 68               [ 1]  258 	incw x 
      008C4A 72 5F            [ 2]  259 	jra 2$
      000DA2                        260 6$:
      008C4C 00               [ 1]  261 	clr (x)
      008C4D 0E               [ 1]  262 	incw x 
      008C4E C7 00            [ 1]  263 	ldw y,x 
      008C50 0F               [ 1]  264 	clrw x 
      008C51 72 B9            [ 1]  265 	ld a,#TK_QSTR  
      000DA9                        266 	_drop VSIZE
      008C53 00 0E            [ 2]    1     addw sp,#VSIZE 
      008C55 CC               [ 4]  267 	ret 
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
      000DAC                        278 convert_escape:
      008C56 8B               [ 2]  279 	pushw x 
      008C57 35 A1 0F         [ 2]  280 	ldw x,#escaped 
      008C5A 26               [ 1]  281 1$:	cp a,(x)
      008C5B 08 03            [ 1]  282 	jreq 2$
      008C5D 04               [ 1]  283 	tnz (x)
      008C5E CD A5            [ 1]  284 	jreq 3$
      008C60 F3               [ 1]  285 	incw x 
      008C61 CC 8B            [ 2]  286 	jra 1$
      008C63 35 A1 84         [ 2]  287 2$: subw x,#escaped 
      008C66 26               [ 1]  288 	ld a,xl 
      008C67 11 7B            [ 1]  289 	add a,#7
      008C69 03               [ 2]  290 3$:	popw x 
      008C6A 11               [ 4]  291 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                    292 
      008C6B 02 2A 08 6E 76 66 72   293 escaped:: .asciz "abtnvfr"
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
      008C6E                        310 parse_integer: ; { -- n }
      008C6E 97               [ 2]  311 	pushw x 	
      008C6F 7B 02            [ 1]  312 	push #0 ; TCHAR
      008C71 CD 8A            [ 1]  313 	push #10 ; BASE=10
      008C73 DD 0A            [ 1]  314 	cp a,#'$
      008C75 02 04            [ 1]  315 	jrne 2$ 
      008C76                        316     _drop #1
      008C76 CC 8B            [ 2]    1     addw sp,##1 
      008C78 35 10            [ 1]  317 	push #16  ; BASE=16
      008C79 F7               [ 1]  318 2$:	ld (x),a 
      008C79 A1               [ 1]  319 	incw x 
      008C7A 20 2A 03         [ 4]  320 	ld a,([in.w],y)
      008C7D CC 8B 35 01      [ 1]  321 	inc in 
      008C80 CD 18 99         [ 4]  322 	call to_upper 
      008C80 A6 4F            [ 1]  323 	ld (TCHAR,sp),a 
      008C82 11 02 2A         [ 4]  324 	call is_digit 
      008C85 03 CC            [ 1]  325 	jrc 2$
      008C87 8B 35            [ 1]  326 	ld a,#16 
      008C89 0D 04            [ 1]  327 	cp a,(BASE,sp)
      008C8B 26 18            [ 1]  328 	jrne 3$ 
      008C8D 7B 03            [ 1]  329 	ld a,(TCHAR,sp)
      008C8F 11 02            [ 1]  330 	cp a,#'A 
      008C91 27 12            [ 1]  331 	jrmi 3$ 
      008C93 7B 02            [ 1]  332 	cp a,#'G 
      008C95 97 7B            [ 1]  333 	jrmi 2$ 
      008C97 03 95 7B 01      [ 1]  334 3$: dec in 	
      008C9B CD               [ 1]  335     clr (x)
      008C9C 8A 9A            [ 2]  336 	ldw x,(XSAVE,sp)
      008C9E 0C 02 0C         [ 4]  337 	call atoi24
      008CA1 03 CC            [ 1]  338 	ldw y,x
      008CA3 8B 35 0C         [ 1]  339 	ld a,acc24 
      008CA5 90 F7            [ 1]  340 	ld (y),a 
      008CA5 7B 01            [ 1]  341 	incw y  
      008CA7 90 F7 90         [ 2]  342 	ldw x,acc16 
      008CAA 5C CD            [ 2]  343 	ldw (y),x 
      008CAC 89 C4 7B 03      [ 2]  344 	addw y,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      008CB0 11 02            [ 1]  345 	ld a,#TK_INTGR
      000E17                        346 	_drop VSIZE  
      008CB2 2B 09            [ 2]    1     addw sp,#VSIZE 
      008CB4 90               [ 4]  347 	ret 	
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
      000E1A                        364 parse_binary: ; { -- n }
      008CB5 7F 0C            [ 1]  365 	push #0
      008CB7 02 0C            [ 1]  366 	push #0
      008CB9 03 CC            [ 1]  367 	push #0
      000E20                        368 2$:	
      008CBB 8B 35 00         [ 4]  369 	ld a,([in.w],y)
      008CBD 72 5C 00 01      [ 1]  370 	inc in 
      008CBD 0C 03            [ 1]  371 	cp a,#'0 
      008CBF CC 8B            [ 1]  372 	jreq 3$
      008CC1 35 31            [ 1]  373 	cp a,#'1 
      008CC2 27 02            [ 1]  374 	jreq 3$ 
      008CC2 90 AE            [ 2]  375 	jra bin_exit 
      008CC4 16 68            [ 1]  376 3$: sub a,#'0 
      008CC6 0F               [ 1]  377 	rrc a
      008CC7 01 72            [ 1]  378 	rlc (BINARY+2,sp) 
      008CC9 F9 01            [ 1]  379 	rlc (BINARY+1,sp)
      008CCB 90 7F            [ 1]  380 	rlc (BINARY,sp) 
      008CCD 7B 02            [ 2]  381 	jra 2$  
      000E3C                        382 bin_exit:
      008CCF C7 00 04 A6      [ 1]  383 	dec in 
      008CD3 0D CD            [ 1]  384 	ldw y,x
      008CD5 89 C4            [ 1]  385 	ld a,(BINARY,sp)
      008CD7 5B 04            [ 1]  386 	ld (y),a 
      008CD9 90 85            [ 1]  387 	incw y 
      008CDB 81 02            [ 2]  388 	ldw x,(BINARY+1,sp)
      008CDC 90 FF            [ 2]  389 	ldw (y),x 
      008CDC 88 4E CD 8C      [ 2]  390 	addw y,#2  
      008CE0 F3 CD            [ 1]  391 	ld a,#TK_INTGR 	
      000E52                        392 	_drop VSIZE 
      008CE2 89 C4            [ 2]    1     addw sp,#VSIZE 
      008CE4 7B               [ 4]  393 	ret
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
      000E55                        402 is_alpha::
      008CE5 01 CD            [ 1]  403 	cp a,#'A 
      008CE7 8C               [ 1]  404 	ccf 
      008CE8 F3 CD            [ 1]  405 	jrnc 9$ 
      008CEA 89 C4            [ 1]  406 	cp a,#'Z+1 
      008CEC A6 20            [ 1]  407 	jrc 9$ 
      008CEE CD 89            [ 1]  408 	cp a,#'a 
      008CF0 C4               [ 1]  409 	ccf 
      008CF1 84 81            [ 1]  410 	jrnc 9$
      008CF3 A1 7B            [ 1]  411 	cp a,#'z+1
      008CF3 A4               [ 4]  412 9$: ret 	
                                    413 
                                    414 ;------------------------------------
                                    415 ; check if character in {'0'..'9'}
                                    416 ; input:
                                    417 ;    A  character to test
                                    418 ; output:
                                    419 ;    Carry  0 not digit | 1 digit
                                    420 ;------------------------------------
      000E66                        421 is_digit::
      008CF4 0F A1            [ 1]  422 	cp a,#'0
      008CF6 09 23            [ 1]  423 	jrc 1$
      008CF8 02 AB            [ 1]  424     cp a,#'9+1
      008CFA 07               [ 1]  425 	ccf 
      008CFB AB               [ 1]  426 1$:	ccf 
      008CFC 30               [ 4]  427     ret
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
      000E6F                        438 is_alnum::
      008CFD 81 0E 66         [ 4]  439 	call is_digit
      008CFE 25 03            [ 1]  440 	jrc 1$ 
      008CFE 52 02 0F         [ 4]  441 	call is_alpha
      008D01 01               [ 4]  442 1$:	ret 
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



      000E78                        453 is_symbol_char: 
      008D02 90 CE            [ 1]  454 	cp a,#'_ 
      008D04 00 1C            [ 1]  455 	jrne 1$
      008D06 4D               [ 1]  456 	scf 
      008D07 27 04            [ 2]  457 	jra 9$ 
      008D09 90 CE 00         [ 4]  458 1$:	call is_alnum 
      008D0C 05               [ 4]  459 9$: ret 
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
      008D0D                        473 parse_symbol:
      008D0D 90               [ 1]  474 	incw x ; keep space for TK_ID 
      000E84                        475 symb_loop: 
                                    476 ; symbol are converted to upper case 
      008D0E C3 00 1E         [ 4]  477 	call to_upper  
      008D11 2A               [ 1]  478 	ld (x), a 
      008D12 10               [ 1]  479 	incw x
      008D13 90 F3 27         [ 4]  480 	ld a,([in.w],y)
      008D16 0E 2B 0A 90      [ 1]  481 	inc in 
      008D1A E6 02 6B         [ 4]  482 	call is_symbol_char 
      008D1D 02 72            [ 1]  483 	jrc symb_loop 
      008D1F F9               [ 1]  484 	clr (x)
      008D20 01 20 EA 01      [ 1]  485 	dec in  
      008D23 81               [ 4]  486 	ret 
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
      000E9B                        502 parse_keyword: 
      008D23 5F               [ 2]  503 	pushw x ; preserve *symbol 
      008D24 51 5B 02         [ 4]  504 	call parse_symbol
      008D27 51 81            [ 2]  505 	ldw x,(XFIRST,sp) 
      008D29 E6 02            [ 1]  506 	ld a,(2,x)
      008D29 52 04            [ 1]  507 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                    508 ; one letter variable name 
      008D2B E6 02            [ 1]  509 	ld a,(1,x) 
      008D2D 6B 02            [ 1]  510 	sub a,#'A 
      008D2F 0F 01 90         [ 2]  511 	ldw x,#3 
      008D32 93               [ 4]  512 	mul x,a 
      008D33 72 F9 01         [ 2]  513 	addw x,#vars 
      008D36 17 03            [ 1]  514 	ld a,#TK_VAR 
      008D38 90 CE            [ 2]  515 	jra 4$ 
      000EB4                        516 2$: ; check for keyword, otherwise syntax error.
      000EB4                        517 	_ldx_dict kword_dict ; dictionary entry point
      008D3A 00 1E 72         [ 2]    1     ldw x,#kword_dict+2
      008D3D F2 03            [ 2]  518 	ldw y,(XFIRST,sp) ; name to search for
      008D3F 90 CF            [ 1]  519 	incw y 
      008D41 00 0E 16         [ 4]  520 	call search_dict
      008D44 03               [ 1]  521 	tnz a
      008D45 CD 94            [ 1]  522 	jrne 4$
                                    523 ; not in dictionary
                                    524 ; compile it as TK_LABEL
      008D47 9D 90            [ 2]  525 	ldw y,(XFIRST,sp)
      008D49 CE 00            [ 1]  526 	ld a,#TK_LABEL 
      008D4B 1E 72            [ 1]  527 	ld (y),a 
      008D4D F2 01            [ 1]  528 	incw y
      008D4F 90               [ 1]  529 	ldw x,y 
      008D50 CF 00 1E         [ 4]  530 	call strlen
      008D53 5B 04            [ 1]  531 	cp a,#15 
      008D55 81 02            [ 2]  532 	jrule 22$ 
      008D56 A6 0F            [ 1]  533 	ld a,#15
      000ED3                        534 22$:	
      008D56 52               [ 1]  535 	push a 
      000ED4                        536 24$:
      008D57 06 1F            [ 1]  537     ld a,(y)
      008D59 03 17            [ 1]  538 	jreq 3$
      008D5B 05 90            [ 1]  539 	incw y
      008D5D CF 00            [ 1]  540 	dec (1,sp) 
      008D5F 0E 90            [ 1]  541 	jrne 24$
      008D61 93               [ 1]  542 	clr a 
      008D62 72 BB            [ 1]  543 	ld (y),a 
      008D64 00 0E            [ 1]  544 3$: incw y 
      000EE3                        545 	_drop 1 
      008D66 1F 01            [ 2]    1     addw sp,#1 
      008D68 CE 00            [ 1]  546 	ld a,#TK_LABEL 
      008D6A 1E               [ 1]  547 	clrw x 	
      008D6B 72 F0            [ 2]  548 	jra 5$ 
      000EEA                        549 4$:	
      008D6D 03 CF            [ 2]  550 	ldw y,(XFIRST,sp)
      008D6F 00 0E            [ 1]  551 	cp a,#TK_AND
      008D71 1E 01            [ 1]  552 	jrmi 41$
      008D73 CD 94            [ 1]  553 	ld (y),a 
      008D75 9D CE            [ 1]  554 	incw y 
      008D77 00 1E            [ 2]  555 	jra 5$ 
      000EF6                        556 41$:	
      008D79 72 FB 05         [ 2]  557 	cpw x,#LET_IDX 
      008D7C CF 00            [ 1]  558 	jreq 5$  ; don't compile LET command 
      008D7E 1E 5B            [ 1]  559 	ld (y),a 
      008D80 06 81            [ 1]  560 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      008D82 90 FF            [ 2]  561 	ldw (y),x
      008D82 52 08 CE 00      [ 2]  562 	addw y,#2  
      000F05                        563 5$:	_drop VSIZE 
      008D86 1E C3            [ 2]    1     addw sp,#VSIZE 
      008D88 00               [ 4]  564 	ret  	
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
      000F08                        575 skip:
      008D89 1C               [ 1]  576 	push a
      008D8A 26 19 AE         [ 4]  577 1$:	ld a,([in.w],y)
      008D8D 00 02            [ 1]  578 	jreq 2$
      008D8F 72 D6            [ 1]  579 	cp a,(C,sp)
      008D91 00 1A            [ 1]  580 	jrne 2$
      008D93 A1 03 27 5A      [ 1]  581 	inc in
      008D97 5F 97            [ 2]  582 	jra 1$
      000F18                        583 2$: _drop 1 
      008D99 1F 07            [ 2]    1     addw sp,#1 
      008D9B CE               [ 4]  584 	ret
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
      000F1B                        609 get_token:: 
      000F1B                        610 	_vars VSIZE
      008D9C 00 1C            [ 2]    1     sub sp,#VSIZE 
                                    611 ;	ld a,in 
                                    612 ;	sub a,count
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                    613 ;   jrmi 0$
                                    614 ;	clr a 
                                    615 ;	ret 
      000F1D                        616 0$: 
      008D9E 1F 01 CE 00      [ 2]  617 	ldw y,#tib    	
      008DA2 1E 20            [ 1]  618 	ld a,#SPACE
      008DA4 38 72 CE         [ 4]  619 	call skip
      008DA7 00 1A 1F 05 AE   [ 1]  620 	mov in.saved,in 
      008DAC 00 02 72         [ 4]  621 	ld a,([in.w],y)
      008DAF D6 00            [ 1]  622 	jrne 1$
      008DB1 1A 97            [ 1]  623 	ldw y,x 
      008DB3 1F 07 1E         [ 2]  624 	jp token_exit ; end of line 
      008DB6 05 4F CD 8C      [ 1]  625 1$:	inc in 
      008DBA FE 5D 26         [ 4]  626 	call to_upper 
      008DBD 04 17            [ 1]  627 	ld (TCHAR,sp),a 
                                    628 ; check for quoted string
      000F3E                        629 str_tst:  	
      000F3E                        630 	_case '"' nbr_tst
      008DBF 01 20            [ 1]    1 	ld a,#'"' 
      008DC1 05 1F            [ 1]    2 	cp a,(TCHAR,sp) 
      008DC3 01 CD            [ 1]    3 	jrne nbr_tst
      008DC5 8D 29            [ 1]  631 	ld a,#TK_QSTR
      008DC7 F7               [ 1]  632 	ld (x),a 
      008DC7 A6               [ 1]  633 	incw x 
      008DC8 03 11 08         [ 4]  634 	call parse_quote
      008DCB 27 24 1E         [ 2]  635 	jp token_exit
      000F4E                        636 nbr_tst:
                                    637 ; check for hexadecimal number 
      008DCE 01 C3            [ 1]  638 	ld a,#'$'
      008DD0 00 1E            [ 1]  639 	cp a,(TCHAR,sp) 
      008DD2 27 09            [ 1]  640 	jreq 1$
                                    641 ;check for binary number 
      008DD4 1E 01            [ 1]  642 	ld a,#'&
      008DD6 16 07            [ 1]  643 	cp a,(TCHAR,sp)
      008DD8 CD 8D            [ 1]  644 	jrne 0$
      008DDA 56 20            [ 1]  645 	ld a,#TK_INTGR
      008DDC 06               [ 1]  646 	ld (x),a 
      008DDD 5C               [ 1]  647 	incw x 
      008DDD 72 FB 07         [ 4]  648 	call parse_binary ; expect binary integer 
      008DE0 CF 00 1E         [ 2]  649 	jp token_exit 
                                    650 ; check for decimal number 	
      008DE3 1E 07            [ 1]  651 0$:	ld a,(TCHAR,sp)
      008DE5 CF 00 0E         [ 4]  652 	call is_digit
      008DE8 90 AE            [ 1]  653 	jrnc 3$
      008DEA 16 B8            [ 1]  654 1$:	ld a,#TK_INTGR 
      008DEC 1E               [ 1]  655 	ld (x),a 
      008DED 01               [ 1]  656 	incw x 
      008DEE CD 94            [ 1]  657 	ld a,(TCHAR,sp)
      008DF0 9D 0D C9         [ 4]  658 	call parse_integer 
      008DF1 CC 10 D7         [ 2]  659 	jp token_exit 
      000F77                        660 3$: 
      000F77                        661 	_case '(' bkslsh_tst 
      008DF1 5B 08            [ 1]    1 	ld a,#'(' 
      008DF3 81 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DF4 26 05            [ 1]    3 	jrne bkslsh_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      008DF4 52 02            [ 1]  662 	ld a,#TK_LPAREN
      008DF6 4F 6B 01         [ 2]  663 	jp token_char   	
      008DF9                        664 bkslsh_tst: ; character token 
      000F82                        665 	_case '\',rparnt_tst
      008DF9 91 D6            [ 1]    1 	ld a,#'\' 
      008DFB 01 27            [ 1]    2 	cp a,(TCHAR,sp) 
      008DFD 24 72            [ 1]    3 	jrne rparnt_tst
      008DFF 5C 00            [ 1]  666 	ld a,#TK_CHAR 
      008E01 02               [ 1]  667 	ld (x),a 
      008E02 6B               [ 1]  668 	incw x 
      008E03 02 A6 5C         [ 4]  669 	ld a,([in.w],y)
      008E06 11               [ 1]  670 	ld (x),a 
      008E07 01               [ 1]  671 	incw x
      008E08 26 0A            [ 1]  672 	ldw y,x 	 
      008E0A 0F 01 7B 02      [ 1]  673 	inc in  
      008E0E AD               [ 1]  674 	clrw x 
      008E0F 1C               [ 1]  675 	ld xl,a 
      008E10 F7 5C            [ 1]  676 	ld a,#TK_CHAR 
      008E12 20 E5 D7         [ 2]  677 	jp token_exit 
      008E14                        678 rparnt_tst:		
      000F9E                        679 	_case ')' colon_tst 
      008E14 7B 02            [ 1]    1 	ld a,#')' 
      008E16 A1 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008E18 27 DD            [ 1]    3 	jrne colon_tst
      008E1A A1 22            [ 1]  680 	ld a,#TK_RPAREN 
      008E1C 27 04 F7         [ 2]  681 	jp token_char
      000FA9                        682 colon_tst:
      000FA9                        683 	_case ':' comma_tst 
      008E1F 5C 20            [ 1]    1 	ld a,#':' 
      008E21 D7 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E22 26 05            [ 1]    3 	jrne comma_tst
      008E22 7F 5C            [ 1]  684 	ld a,#TK_COLON 
      008E24 90 93 5F         [ 2]  685 	jp token_char  
      000FB4                        686 comma_tst:
      000FB4                        687 	_case COMMA sharp_tst 
      008E27 A6 02            [ 1]    1 	ld a,#COMMA 
      008E29 5B 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008E2B 81 05            [ 1]    3 	jrne sharp_tst
      008E2C A6 08            [ 1]  688 	ld a,#TK_COMMA
      008E2C 89 AE 8E         [ 2]  689 	jp token_char
      000FBF                        690 sharp_tst:
      000FBF                        691 	_case SHARP dash_tst 
      008E2F 41 F1            [ 1]    1 	ld a,#SHARP 
      008E31 27 06            [ 1]    2 	cp a,(TCHAR,sp) 
      008E33 7D 27            [ 1]    3 	jrne dash_tst
      008E35 09 5C            [ 1]  692 	ld a,#TK_SHARP
      008E37 20 F7 1D         [ 2]  693 	jp token_char  	 	 
      000FCA                        694 dash_tst: 	
      000FCA                        695 	_case '-' at_tst 
      008E3A 8E 41            [ 1]    1 	ld a,#'-' 
      008E3C 9F AB            [ 1]    2 	cp a,(TCHAR,sp) 
      008E3E 07 85            [ 1]    3 	jrne at_tst
      008E40 81 61            [ 1]  696 	ld a,#TK_MINUS  
      008E42 62 74 6E         [ 2]  697 	jp token_char 
      000FD5                        698 at_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      000FD5                        699 	_case '@' qmark_tst 
      008E45 76 66            [ 1]    1 	ld a,#'@' 
      008E47 72 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008E49 26 05            [ 1]    3 	jrne qmark_tst
      008E49 89 4B            [ 1]  700 	ld a,#TK_ARRAY 
      008E4B 00 4B 0A         [ 2]  701 	jp token_char
      000FE0                        702 qmark_tst:
      000FE0                        703 	_case '?' tick_tst 
      008E4E A1 24            [ 1]    1 	ld a,#'?' 
      008E50 26 04            [ 1]    2 	cp a,(TCHAR,sp) 
      008E52 5B 01            [ 1]    3 	jrne tick_tst
      008E54 4B 10            [ 1]  704 	ld a,#TK_CMD  
      008E56 F7               [ 1]  705 	ld (x),a 
      008E57 5C               [ 1]  706 	incw x 
      008E58 91 D6            [ 1]  707 	ldw y,x 
      008E5A 01 72 5C         [ 2]  708 	ldw x,#PRT_IDX 
      008E5D 00 02            [ 2]  709 	ldw (y),x 
      008E5F CD 99 19 6B      [ 2]  710 	addw y,#2
      008E63 02 CD 8E         [ 2]  711 	jp token_exit
      000FF8                        712 tick_tst: ; comment 
      000FF8                        713 	_case TICK plus_tst 
      008E66 E6 25            [ 1]    1 	ld a,#TICK 
      008E68 ED A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008E6A 10 11            [ 1]    3 	jrne plus_tst
      008E6C 01 26            [ 1]  714 	ld a,#TK_CMD
      008E6E 0A               [ 1]  715 	ld (x),a 
      008E6F 7B               [ 1]  716 	incw x
      008E70 02 A1 41 2B      [ 2]  717 	ldw y,#REM_IDX
      008E74 04               [ 2]  718 	ldw (x),y 
      008E75 A1 47 2B         [ 2]  719 	addw x,#2  
      00100A                        720 copy_comment:
      008E78 DD 72 5A 00      [ 2]  721 	ldw y,#tib 
      008E7C 02 7F 1E 03      [ 2]  722 	addw y,in.w
      008E80 CD 99            [ 2]  723 	pushw y
      008E82 25 90 93         [ 4]  724 	call strcpy
      008E85 C6 00 0D         [ 2]  725     subw y,(1,sp)
      008E88 90 F7            [ 1]  726 	ld a,yl 
      008E8A 90 5C CE         [ 1]  727 	add a,in
      008E8D 00 0E 90         [ 1]  728 	ld in,a 
      008E90 FF 72            [ 2]  729 	ldw (1,sp),x
      008E92 A9 00 02         [ 2]  730 	addw y,(1,sp)
      008E95 A6 84            [ 1]  731 	incw y 
      001029                        732 	_drop 2 
      008E97 5B 04            [ 2]    1     addw sp,#2 
      008E99 81 00 82         [ 2]  733 	ldw x,#REM_IDX 
      008E9A A6 80            [ 1]  734 	ld a,#TK_CMD 
      008E9A 4B 00 4B         [ 2]  735 	jp token_exit 
      001033                        736 plus_tst:
      001033                        737 	_case '+' star_tst 
      008E9D 00 4B            [ 1]    1 	ld a,#'+' 
      008E9F 00 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008EA0 26 05            [ 1]    3 	jrne star_tst
      008EA0 91 D6            [ 1]  738 	ld a,#TK_PLUS  
      008EA2 01 72 5C         [ 2]  739 	jp token_char 
      00103E                        740 star_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      00103E                        741 	_case '*' slash_tst 
      008EA5 00 02            [ 1]    1 	ld a,#'*' 
      008EA7 A1 30            [ 1]    2 	cp a,(TCHAR,sp) 
      008EA9 27 06            [ 1]    3 	jrne slash_tst
      008EAB A1 31            [ 1]  742 	ld a,#TK_MULT 
      008EAD 27 02 20         [ 2]  743 	jp token_char 
      001049                        744 slash_tst: 
      001049                        745 	_case '/' prcnt_tst 
      008EB0 0B A0            [ 1]    1 	ld a,#'/' 
      008EB2 30 46            [ 1]    2 	cp a,(TCHAR,sp) 
      008EB4 09 03            [ 1]    3 	jrne prcnt_tst
      008EB6 09 02            [ 1]  746 	ld a,#TK_DIV 
      008EB8 09 01 20         [ 2]  747 	jp token_char 
      001054                        748 prcnt_tst:
      001054                        749 	_case '%' eql_tst 
      008EBB E4 25            [ 1]    1 	ld a,#'%' 
      008EBC 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008EBC 72 5A            [ 1]    3 	jrne eql_tst
      008EBE 00 02            [ 1]  750 	ld a,#TK_MOD
      008EC0 90 93 7B         [ 2]  751 	jp token_char  
                                    752 ; 1 or 2 character tokens 	
      00105F                        753 eql_tst:
      00105F                        754 	_case '=' gt_tst 		
      008EC3 01 90            [ 1]    1 	ld a,#'=' 
      008EC5 F7 90            [ 1]    2 	cp a,(TCHAR,sp) 
      008EC7 5C 1E            [ 1]    3 	jrne gt_tst
      008EC9 02 90            [ 1]  755 	ld a,#TK_EQUAL
      008ECB FF 72 A9         [ 2]  756 	jp token_char 
      00106A                        757 gt_tst:
      00106A                        758 	_case '>' lt_tst 
      008ECE 00 02            [ 1]    1 	ld a,#'>' 
      008ED0 A6 84            [ 1]    2 	cp a,(TCHAR,sp) 
      008ED2 5B 03            [ 1]    3 	jrne lt_tst
      008ED4 81 31            [ 1]  759 	ld a,#TK_GT 
      008ED5 6B 02            [ 1]  760 	ld (ATTRIB,sp),a 
      008ED5 A1 41 8C         [ 4]  761 	ld a,([in.w],y)
      008ED8 24 0B A1 5B      [ 1]  762 	inc in 
      008EDC 25 07            [ 1]  763 	cp a,#'=
      008EDE A1 61            [ 1]  764 	jrne 1$
      008EE0 8C 24            [ 1]  765 	ld a,#TK_GE 
      008EE2 02 A1            [ 2]  766 	jra token_char  
      008EE4 7B 81            [ 1]  767 1$: cp a,#'<
      008EE6 26 04            [ 1]  768 	jrne 2$
      008EE6 A1 30            [ 1]  769 	ld a,#TK_NE 
      008EE8 25 03            [ 2]  770 	jra token_char 
      008EEA A1 3A 8C 8C      [ 1]  771 2$: dec in
      008EEE 81 02            [ 1]  772 	ld a,(ATTRIB,sp)
      008EEF 20 40            [ 2]  773 	jra token_char 	 
      001093                        774 lt_tst:
      001093                        775 	_case '<' other
      008EEF CD 8E            [ 1]    1 	ld a,#'<' 
      008EF1 E6 25            [ 1]    2 	cp a,(TCHAR,sp) 
      008EF3 03 CD            [ 1]    3 	jrne other
      008EF5 8E D5            [ 1]  776 	ld a,#TK_LT 
      008EF7 81 02            [ 1]  777 	ld (ATTRIB,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      008EF8 91 D6 00         [ 4]  778 	ld a,([in.w],y)
      008EF8 A1 5F 26 03      [ 1]  779 	inc in 
      008EFC 99 20            [ 1]  780 	cp a,#'=
      008EFE 03 CD            [ 1]  781 	jrne 1$
      008F00 8E EF            [ 1]  782 	ld a,#TK_LE 
      008F02 81 27            [ 2]  783 	jra token_char 
      008F03 A1 3E            [ 1]  784 1$: cp a,#'>
      008F03 5C 04            [ 1]  785 	jrne 2$
      008F04 A6 35            [ 1]  786 	ld a,#TK_NE 
      008F04 CD 99            [ 2]  787 	jra token_char 
      008F06 19 F7 5C 91      [ 1]  788 2$: dec in 
      008F0A D6 01            [ 1]  789 	ld a,(ATTRIB,sp)
      008F0C 72 5C            [ 2]  790 	jra token_char 	
      0010BC                        791 other: ; not a special character 	 
      008F0E 00 02            [ 1]  792 	ld a,(TCHAR,sp)
      008F10 CD 8E F8         [ 4]  793 	call is_alpha 
      008F13 25 EF            [ 1]  794 	jrc 30$ 
      008F15 7F 72 5A         [ 2]  795 	jp syntax_error 
      0010C6                        796 30$: 
      008F18 00 02 81         [ 4]  797 	call parse_keyword
      008F1B A3 21 2C         [ 2]  798 	cpw x,#remark 
      008F1B 89 CD            [ 1]  799 	jrne token_exit 
      008F1D 8F 03            [ 1]  800 	ldw y,x 
      008F1F 1E 01 E6         [ 2]  801 	jp copy_comment 
      0010D3                        802 token_char:
      008F22 02               [ 1]  803 	ld (x),a 
      008F23 26               [ 1]  804 	incw x
      008F24 0F E6            [ 1]  805 	ldw y,x 
      0010D7                        806 token_exit:
      0010D7                        807 	_drop VSIZE 
      008F26 01 A0            [ 2]    1     addw sp,#VSIZE 
      008F28 41               [ 4]  808 	ret
                                    809 
                                    810 
                                    811 ;-----------------------------------
                                    812 ; create token list fromm text line 
                                    813 ; save this list in pad buffer 
                                    814 ;  compiled line format: 
                                    815 ;    line_no  2 bytes {0...32767}
                                    816 ;    count    1 byte  
                                    817 ;    tokens   variable length 
                                    818 ;   
                                    819 ; input:
                                    820 ;   none
                                    821 ; modified variables:
                                    822 ;   basicptr     token list buffer address 
                                    823 ;   in.w  		 3|count, i.e. index in buffer
                                    824 ;   count        length of line | 0  
                                    825 ;-----------------------------------
                           000001   826 	XSAVE=1
                           000002   827 	VSIZE=2
      0010DA                        828 compile::
      008F29 AE 00            [ 2]  829 	pushw y 
      0010DC                        830 	_vars VSIZE 
      008F2B 03 42            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      008F2D 1C 00 31 A6 85   [ 1]  831 	mov basicptr,txtbgn
      008F32 20 36 00 22      [ 1]  832 	bset flags,#FCOMP 
      008F34 A6 00            [ 1]  833 	ld a,#0
      008F34 AE B3 B6         [ 2]  834 	ldw x,#0
      008F37 16 01 90         [ 2]  835 	ldw pad,x ; destination buffer 
      008F3A 5C CD 99         [ 1]  836 	ld pad+2,a ; count 
      008F3D 8F 4D 26         [ 2]  837 	ldw x,#pad+3
      008F40 29 16 01 A6      [ 1]  838 	clr in 
      008F44 03 90 F7         [ 4]  839 	call get_token
      008F47 90 5C            [ 1]  840 	cp a,#TK_INTGR
      008F49 93 CD            [ 1]  841 	jrne 2$
      008F4B 94 71 A1         [ 2]  842 	cpw x,#1 
      008F4E 0F 23            [ 1]  843 	jrpl 1$
      008F50 02 A6            [ 1]  844 	ld a,#ERR_BAD_VALUE
      008F52 0F 16 AF         [ 2]  845 	jp tb_error
      008F53 CF 16 B8         [ 2]  846 1$:	ldw pad,x 
      008F53 88 AE 16 BB      [ 2]  847 	ldw y,#pad+3 
      008F54 90 A3 17 74      [ 2]  848 2$:	cpw y,#stack_full 
      008F54 90 F6            [ 1]  849 	jrult 3$
      008F56 27 09            [ 1]  850 	ld a,#ERR_BUF_FULL 
      008F58 90 5C 0A         [ 2]  851 	jp tb_error 
      00111C                        852 3$:	
      008F5B 01               [ 1]  853 	ldw x,y 
      008F5C 26 F6 4F         [ 4]  854 	call get_token 
      008F5F 90 F7            [ 1]  855 	cp a,#TK_NONE 
      008F61 90 5C            [ 1]  856 	jrne 2$ 
                                    857 ; compilation completed  
      008F63 5B 01 A6 03      [ 2]  858 	subw y,#pad
      008F67 5F 20            [ 1]  859     ld a,yl
      008F69 1B 16 B8         [ 2]  860 	ldw x,#pad 
      008F6A CF 00 19         [ 2]  861 	ldw ptr16,x 
      008F6A 16 01            [ 1]  862 	ld (2,x),a 
      008F6C A1               [ 2]  863 	ldw x,(x)
      008F6D 87 2B            [ 1]  864 	jreq 10$
      008F6F 06 90 F7         [ 4]  865 	call insert_line
      008F72 90 5C 20 0F      [ 1]  866 	clr  count 
      008F76 20 0F            [ 2]  867 	jra  11$ 
      00113E                        868 10$: ; line# is zero 
      008F76 A3 00 4A         [ 2]  869 	ldw x,ptr16  
      008F79 27 0A 90         [ 2]  870 	ldw basicptr,x 
      008F7C F7 90            [ 1]  871 	ld a,(2,x)
      008F7E 5C 90 FF         [ 1]  872 	ld count,a 
      008F81 72 A9 00 02      [ 1]  873 	mov in,#3 
      00114D                        874 11$:
      00114D                        875 	_drop VSIZE 
      008F85 5B 02            [ 2]    1     addw sp,#VSIZE 
      008F87 81 1B 00 22      [ 1]  876 	bres flags,#FCOMP 
      008F88 90 85            [ 2]  877 	popw y 
      008F88 88               [ 4]  878 	ret 
                                    879 
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
      001156                         48 cpy_cmd_name:
      008F89 91               [ 2]   49 	tnzw x 
      008F8A D6 01            [ 1]   50 	jreq 10$
      008F8C 27               [ 1]   51 	ld a,(x)
      008F8D 0A               [ 1]   52 	incw x
      008F8E 11 01            [ 1]   53 	and a,#15  
      008F90 26               [ 1]   54 	push a 
      008F91 06 72            [ 1]   55     tnz (1,sp) 
      008F93 5C 00            [ 1]   56 	jreq 9$
      008F95 02               [ 1]   57 1$:	ld a,(x)
      008F96 20 F1            [ 1]   58 	ld (y),a  
      008F98 5B               [ 1]   59 	incw x
      008F99 01 81            [ 1]   60 	incw y 
      008F9B 0A 01            [ 1]   61 	dec (1,sp)	 
      008F9B 52 02            [ 1]   62 	jrne 1$
      008F9D 84               [ 1]   63 9$: pop a 
      00116D                         64 10$: 
      008F9D 90               [ 4]   65 	ret	
                                     66 
                                     67 ;--------------------------
                                     68 ; add a space after letter or 
                                     69 ; digit.
                                     70 ; input:
                                     71 ;   Y     pointer to buffer 
                                     72 ; output:
                                     73 ;   Y    moved to end 
                                     74 ;--------------------------
      00116E                         75 add_space:
      008F9E AE 16            [ 2]   76 	decw y 
      008FA0 68 A6            [ 1]   77 	ld a,(y)
      008FA2 20 CD            [ 1]   78 	incw y
      008FA4 8F 88            [ 1]   79 	cp a,#') 
      008FA6 55 00            [ 1]   80 	jreq 0$
      008FA8 02 00 03         [ 4]   81 	call is_alnum 
      008FAB 91 D6            [ 1]   82 	jrnc 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      00117D                         83 0$: 
      008FAD 01 26            [ 1]   84 	ld a,#SPACE 
      008FAF 05 90            [ 1]   85 	ld (y),a 
      008FB1 93 CC            [ 1]   86 	incw y 
      008FB3 91               [ 4]   87 1$: ret 
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
      001184                         99 right_align::
      008FB4 57               [ 1]  100 	push a 
      008FB5 72 5C            [ 1]  101 0$: ld a,(1,sp)
      008FB7 00 02 CD         [ 1]  102 	cp a,tab_width 
      008FBA 99 19            [ 1]  103 	jrpl 1$
      008FBC 6B 01            [ 1]  104 	ld a,#SPACE 
      008FBE 5A               [ 2]  105 	decw x
      008FBE A6               [ 1]  106 	ld (x),a  
      008FBF 22 11            [ 1]  107 	inc (1,sp)
      008FC1 01 26            [ 2]  108 	jra 0$ 
      008FC3 0A               [ 1]  109 1$: pop a 	
      008FC4 A6               [ 4]  110 	ret 
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
      001196                        123 cpy_quote:
      008FC5 02 F7            [ 1]  124 	ld a,#'"
      008FC7 5C CD            [ 1]  125 	ld (y),a 
      008FC9 8D F4            [ 1]  126 	incw y 
      008FCB CC               [ 2]  127 	pushw x 
      008FCC 91 57 D4         [ 4]  128 	call skip_string 
      008FCE 85               [ 2]  129 	popw x 
      008FCE A6               [ 1]  130 1$:	ld a,(x)
      008FCF 24 11            [ 1]  131 	jreq 9$
      008FD1 01               [ 1]  132 	incw x 
      008FD2 27 17            [ 1]  133 	cp a,#SPACE 
      008FD4 A6 26            [ 1]  134 	jrult 3$
      008FD6 11 01            [ 1]  135 	ld (y),a
      008FD8 26 0A            [ 1]  136 	incw y 
      008FDA A6 84            [ 1]  137 	cp a,#'\ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      008FDC F7 5C            [ 1]  138 	jrne 1$ 
      0011B1                        139 2$:
      008FDE CD 8E            [ 1]  140 	ld (y),a
      008FE0 9A CC            [ 1]  141 	incw y  
      008FE2 91 57            [ 2]  142 	jra 1$
      008FE4 7B               [ 1]  143 3$: push a 
      008FE5 01 CD            [ 1]  144 	ld a,#'\
      008FE7 8E E6            [ 1]  145 	ld (y),a 
      008FE9 24 0C            [ 1]  146 	incw y  
      008FEB A6               [ 1]  147 	pop a 
      008FEC 84 F7            [ 1]  148 	sub a,#7
      008FEE 5C 7B 01         [ 1]  149 	ld acc8,a 
      008FF1 CD 8E 49 CC      [ 1]  150 	clr acc16
      008FF5 91               [ 2]  151 	pushw x
      008FF6 57 0D C1         [ 2]  152 	ldw x,#escaped 
      008FF7 72 BB 00 0D      [ 2]  153 	addw x,acc16 
      008FF7 A6               [ 1]  154 	ld a,(x)
      008FF8 28               [ 2]  155 	popw x
      008FF9 11 01            [ 2]  156 	jra 2$
      008FFB 26 05            [ 1]  157 9$: ld a,#'"
      008FFD A6 06            [ 1]  158 	ld (y),a 
      008FFF CC 91            [ 1]  159 	incw y  
      009001 53               [ 1]  160 	incw x 
      009002 81               [ 4]  161 	ret
                                    162 
                                    163 ;--------------------------
                                    164 ; return variable name 
                                    165 ; from its address.
                                    166 ; input:
                                    167 ;   X    variable address
                                    168 ; output:
                                    169 ;   A     variable letter
                                    170 ;--------------------------
      0011DC                        171 var_name::
      009002 A6 5C 11         [ 2]  172 		subw x,#vars 
      009005 01 26            [ 1]  173 		ld a,#3
      009007 16               [ 2]  174 		div x,a 
      009008 A6               [ 1]  175 		ld a,xl 
      009009 04 F7            [ 1]  176 		add a,#'A 
      00900B 5C               [ 4]  177 		ret 
                                    178 
                                    179 ;-----------------------------
                                    180 ; return cmd  idx from its 
                                    181 ; code address 
                                    182 ; input:
                                    183 ;   X      code address 
                                    184 ; output:
                                    185 ;   X      cmd_idx
                                    186 ;-----------------------------
      0011E6                        187 get_cmd_idx:
      00900C 91 D6            [ 2]  188 	pushw y
      00900E 01 F7 5C 90      [ 2]  189 	ldw y,#code_addr 
      009012 93 72 5C 00      [ 2]  190 	ldw ptr16,y 
      009016 02 5F            [ 1]  191 	clrw y 
      009018 97 A6 04         [ 5]  192 1$:	cpw x,([ptr16],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      00901B CC 91            [ 1]  193 	jreq 3$ 
      00901D 57 5C            [ 1]  194 	incw y 
      00901E 91 D6 19         [ 4]  195 	ld a,([ptr16],y)
      00901E A6 29            [ 1]  196 	incw y
      009020 11 01 26         [ 4]  197 	or a,([ptr16],y)	
      009023 05 A6            [ 1]  198 	jrne 1$
      009025 07               [ 1]  199 3$: ldw x,y 
      009026 CC 91            [ 2]  200 	popw y 
      009028 53               [ 4]  201 	ret
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
      009029                        218 decompile::
      001207                        219 	_vars VSIZE
      009029 A6 3A            [ 2]    1     sub sp,#VSIZE 
      00902B 11 01 26         [ 1]  220 	ld a,base
      00902E 05 A6            [ 1]  221 	ld (BASE_SAV,sp),a  
      009030 0A CC 91         [ 1]  222 	ld a,tab_width 
      009033 53 02            [ 1]  223 	ld (WIDTH_SAV,sp),a 
      009034 17 03            [ 2]  224 	ldw (STR,sp),y   
      009034 A6 2C 11 01      [ 5]  225 	ldw x,[basicptr] ; line number 
      009038 26 05 A6 08      [ 1]  226 	mov base,#10
      00903C CC 91 53 23      [ 1]  227 	mov tab_width,#5
      00903F 72 5F 00 0C      [ 1]  228 	clr acc24 
      00903F A6 23 11         [ 2]  229 	ldw acc16,x
      009042 01               [ 1]  230 	clr a ; unsigned conversion 
      009043 26 05 A6         [ 4]  231 	call itoa  
      009046 09 CC 91         [ 4]  232 	call right_align 
      009049 53               [ 1]  233 	push a 
      00904A 90 93            [ 1]  234 1$:	ldw y,x ; source
      00904A A6 2D            [ 2]  235 	ldw x,(STR+1,sp) ; destination
      00904C 11 01 26         [ 4]  236 	call strcpy 
      00904F 05 A6            [ 1]  237 	clrw y 
      009051 11               [ 1]  238 	pop a 
      009052 CC 91            [ 1]  239 	ld yl,a 
      009054 53 F9 03         [ 2]  240 	addw y,(STR,sp)
      009055 A6 20            [ 1]  241 	ld a,#SPACE 
      009055 A6 40            [ 1]  242 	ld (y),a 
      009057 11 01            [ 1]  243 	incw y 
      009059 26 05 A6 05      [ 1]  244 	clr tab_width
      00905D CC 91 53         [ 2]  245 	ldw x,#3
      009060 CF 00 00         [ 2]  246 	ldw in.w,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      00124F                        247 decomp_loop:
      009060 A6 3F            [ 2]  248 	pushw y
      009062 11 01 26         [ 4]  249 	call next_token 
      009065 12 A6            [ 2]  250 	popw y 
      009067 80               [ 1]  251 	tnz a  
      009068 F7 5C            [ 1]  252 	jrne 1$
      00906A 90 93 AE         [ 2]  253 	jp 20$
      00906D 00 68            [ 1]  254 1$:	jrmi 2$
      00906F 90 FF 72         [ 2]  255 	jp 6$
      001261                        256 2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR|TK_AND|TK_OR|TK_XOR 
      009072 A9 00            [ 1]  257 	cp a,#TK_VAR 
      009074 02 CC            [ 1]  258 	jrne 3$
                                    259 ;; TK_VAR 
      009076 91 57 6E         [ 4]  260 	call add_space
      009078 CD 17 E3         [ 4]  261 	call get_addr   
      009078 A6 27 11         [ 4]  262 	call var_name
      00907B 01 26            [ 1]  263 	ld (y),a 
      00907D 35 A6            [ 1]  264 	incw y  
      00907F 80 F7            [ 2]  265 	jra decomp_loop
      001274                        266 3$:
      009081 5C 90            [ 1]  267 	cp a,#TK_INTGR
      009083 AE 00            [ 1]  268 	jrne 4$
                                    269 ;; TK_INTGR
      009085 82 FF 1C         [ 4]  270 	call get_int24 
      009088 00 02 0C         [ 1]  271 	ld acc24,a 
      00908A CF 00 0D         [ 2]  272 	ldw acc16,x 
      00908A 90 AE 16         [ 4]  273 	call add_space
      00908D 68 72            [ 2]  274 	pushw y 
      00908F B9 00            [ 1]  275 	ld a,#255 ; signed conversion 
      009091 01 90 89         [ 4]  276 	call itoa  
      009094 CD 94            [ 2]  277 	ldw y,(1,sp) 
      009096 8D               [ 1]  278 	push a 
      009097 72               [ 1]  279 	exgw x,y 
      009098 F2 01 90         [ 4]  280 	call strcpy 
      00909B 9F CB            [ 1]  281 	clrw y
      00909D 00               [ 1]  282 	pop a  
      00909E 02 C7            [ 1]  283 	ld yl,a 
      0090A0 00 02 1F         [ 2]  284 	addw y,(1,sp)
      00129A                        285 	_drop 2 
      0090A3 01 72            [ 2]    1     addw sp,#2 
      0090A5 F9 01            [ 2]  286 	jra decomp_loop
      00129E                        287 4$: ; dictionary keyword
      0090A7 90 5C            [ 1]  288 	cp a,#TK_AND 
      0090A9 5B 02            [ 1]  289 	jruge 50$ 
      0090AB AE               [ 2]  290 	ldw x,(x)
      0090AC 00 82 A6 80      [ 1]  291 	inc in 
      0090B0 CC 91 57 01      [ 1]  292 	inc in 
      0090B3 A3 00 82         [ 2]  293 	cpw x,#REM_IDX
      0090B3 A6 2B            [ 1]  294 	jrne 5$
      0090B5 11 01 26         [ 2]  295 	ldw x,basicptr 
                                    296 ; copy comment to buffer 
      0090B8 05 A6 10         [ 4]  297 	call add_space
      0090BB CC 91            [ 1]  298 	ld a,#''
      0090BD 53 F7            [ 1]  299 	ld (y),a 
      0090BE 90 5C            [ 1]  300 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      0012BC                        301 46$:
      0090BE A6 2A 11 01      [ 4]  302 	ld a,([in.w],x)
      0090C2 26 05 A6 20      [ 1]  303 	inc in  
      0090C6 CC 91            [ 1]  304 	ld (y),a 
      0090C8 53 5C            [ 1]  305 	incw y 
      0090C9 C6 00 01         [ 1]  306 	ld a,in 
      0090C9 A6 2F 11         [ 1]  307 	cp a,count 
      0090CC 01 26            [ 1]  308 	jrmi 46$
      0090CE 05 A6 21         [ 2]  309 	jp 20$  
      0090D1 CC 91 53         [ 2]  310 5$: cpw x,#LET_IDX 
      0090D4 26 0B            [ 1]  311 	jrne 54$
      0090D4 A6 25 11         [ 2]  312 	jp decomp_loop ; down display LET 	
      0012DB                        313 50$:
      0090D7 01               [ 1]  314 	clrw x 
      0090D8 26 05            [ 1]  315 	sub a,#TK_AND 
      0090DA A6               [ 1]  316 	sll a 
      0090DB 22               [ 1]  317 	ld xl,a 
      0090DC CC 91 53         [ 2]  318 	addw x,#AND_IDX
      0090DF                        319 54$: ; insert command name 
      0090DF A6 3D 11         [ 4]  320 	call add_space  
      0090E2 01 26            [ 2]  321 	pushw y
      0090E4 05 A6 32         [ 4]  322 	call cmd_name
      0090E7 CC 91            [ 2]  323 	popw y 
      0090E9 53 11 56         [ 4]  324 	call cpy_cmd_name
      0090EA CC 12 4F         [ 2]  325 	jp decomp_loop 
      0012F3                        326 6$:
                                    327 ; label?
      0090EA A6 3E            [ 1]  328 	cp a,#TK_LABEL 
      0090EC 11 01            [ 1]  329 	jrne 64$
                                    330 ; copy label string to output buffer   	
      0090EE 26 23            [ 1]  331 	ld a,#32 
      0090F0 A6 31            [ 1]  332 	ld (y),a 
      0090F2 6B 02            [ 1]  333 	incw y 
      0012FD                        334 61$:
      0090F4 91               [ 2]  335 	pushw x 
      0090F5 D6 01 72         [ 4]  336 	call skip_string 
      0090F8 5C               [ 2]  337 	popw x 
      001302                        338 62$:	
      0090F9 00               [ 1]  339 	ld a,(x)
      0090FA 02 A1            [ 1]  340 	jreq 63$ 
      0090FC 3D               [ 1]  341 	incw x  
      0090FD 26 04            [ 1]  342 	ld (y),a 
      0090FF A6 33            [ 1]  343 	incw y 
      009101 20 50            [ 2]  344 	jra 62$ 
      00130C                        345 63$: 
      009103 A1 3C            [ 1]  346 	ld a,#32 
      009105 26 04            [ 1]  347 	ld (y),a 
      009107 A6 35            [ 1]  348 	incw y 
      009109 20 48 72         [ 2]  349 	jp decomp_loop
      001315                        350 64$:
      00910C 5A 00            [ 1]  351 	cp a,#TK_QSTR 
      00910E 02 7B            [ 1]  352 	jrne 7$
                                    353 ;; TK_QSTR
      009110 02 20 40         [ 4]  354 	call add_space
      009113 CD 11 96         [ 4]  355 	call cpy_quote  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      009113 A6 3C 11         [ 2]  356 	jp decomp_loop
      001322                        357 7$:
      009116 01 26            [ 1]  358 	cp a,#TK_CHAR 
      009118 23 A6            [ 1]  359 	jrne 8$
                                    360 ;; TK_CHAR
      00911A 34 6B 02         [ 4]  361 	call add_space 
      00911D 91 D6            [ 1]  362 	ld a,#'\ 
      00911F 01 72            [ 1]  363 	ld (y),a 
      009121 5C 00            [ 1]  364 	incw y
      009123 02               [ 1]  365 	ld a,(x)
      009124 A1 3D 26 04      [ 1]  366 	inc in  
      009128 A6 36            [ 2]  367 	jra 81$
      00912A 20 27            [ 1]  368 8$: cp a,#TK_COLON 
      00912C A1 3E            [ 1]  369 	jrne 9$
      00912E 26 04            [ 1]  370 	ld a,#':
      00133C                        371 81$:
      009130 A6 35            [ 1]  372 	ld (y),a 
      009132 20 1F            [ 1]  373 	incw y 
      001340                        374 82$:
      009134 72 5A 00         [ 2]  375 	jp decomp_loop
      001343                        376 9$: 
      009137 02 7B            [ 1]  377 	cp a,#TK_SHARP
      009139 02 20            [ 1]  378 	jrugt 10$ 
      00913B 17 05            [ 1]  379 	sub a,#TK_ARRAY 
      00913C 5F               [ 1]  380 	clrw x 
      00913C 7B               [ 1]  381 	ld xl,a
      00913D 01 CD 8E         [ 2]  382 	addw x,#single_char 
      009140 D5               [ 1]  383 	ld a,(x)
      009141 25 03            [ 2]  384 	jra 81$ 
      001351                        385 10$: 
      009143 CC 97            [ 1]  386 	cp a,#TK_MINUS 
      009145 2D 0A            [ 1]  387 	jrugt 11$
      009146 A0 10            [ 1]  388 	sub a,#TK_PLUS 
      009146 CD               [ 1]  389 	clrw x 
      009147 8F               [ 1]  390 	ld xl,a 
      009148 1B A3 A1         [ 2]  391 	addw x,#add_char 
      00914B AC               [ 1]  392 	ld a,(x)
      00914C 26 09            [ 2]  393 	jra 81$
      00135F                        394 11$:
      00914E 90 93            [ 1]  395     cp a,#TK_MOD 
      009150 CC 90            [ 1]  396 	jrugt 12$
      009152 8A 20            [ 1]  397 	sub a,#TK_MULT
      009153 5F               [ 1]  398 	clrw x 
      009153 F7               [ 1]  399 	ld xl,a 
      009154 5C 90 93         [ 2]  400 	addw x,#mul_char
      009157 F6               [ 1]  401 	ld a,(x)
      009157 5B 02            [ 2]  402 	jra 81$
      00136D                        403 12$:
      009159 81 31            [ 1]  404 	sub a,#TK_GT  
      00915A 48               [ 1]  405 	sll a 
      00915A 90               [ 1]  406 	clrw x 
      00915B 89               [ 1]  407 	ld xl,a 
      00915C 52 02 55         [ 2]  408 	addw x,#relop_str 
      00915F 00               [ 2]  409 	ldw x,(x)
      009160 1C               [ 1]  410 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      009161 00               [ 1]  411 	incw x 
      009162 05 72            [ 1]  412 	ld (y),a
      009164 1A 00            [ 1]  413 	incw y 
      009166 23               [ 1]  414 	ld a,(x)
      009167 A6 00            [ 1]  415 	jrne 81$
      009169 AE 00 00         [ 2]  416 	jp decomp_loop 
      001382                        417 20$: 
      00916C CF 16            [ 1]  418 	clr (y)
      00916E B8 C7            [ 2]  419 	ldw x,(STR,sp)
      009170 16 BA            [ 1]  420 	ld a,(BASE_SAV,sp)
      009172 AE 16 BB         [ 1]  421 	ld base,a 
      009175 72 5F            [ 1]  422 	ld a,(WIDTH_SAV,sp)
      009177 00 02 CD         [ 1]  423 	ld tab_width,a
      00917A 8F 9B A1         [ 2]  424 	subw y,(STR,sp) 
      00917D 84 26            [ 1]  425 	ld a,yl 
      001395                        426 	_drop VSIZE 
      00917F 11 A3            [ 2]    1     addw sp,#VSIZE 
      009181 00               [ 4]  427 	ret 
                                    428 
      009182 01 2A 05 A6 0A         429 single_char: .byte '@','(',')',',','#'
      009187 CC 97                  430 add_char: .byte '+','-'
      009189 2F CF 16               431 mul_char: .byte '*','/','%'
      00918C B8 90 AE 16 BB 90 A3   432 relop_str: .word gt,equal,ge,lt,ne,le 
             17 74 25 05 A6
      009198 0F CC                  433 gt: .asciz ">"
      00919A 97 2F                  434 equal: .asciz "="
      00919C 3E 3D 00               435 ge: .asciz ">="
      00919C 93 CD                  436 lt: .asciz "<"
      00919E 8F 9B A1               437 le: .asciz "<="
      0091A1 00 26 ED               438 ne:  .asciz "<>"
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
      0013BD                        451 cmd_name:
      0013BD                        452 	_vars VSIZE 
      0091A4 72 A2            [ 2]    1     sub sp,#VSIZE 
      0091A6 16 B8 90 9F      [ 1]  453 	clr acc16 
      0091AA AE 16            [ 2]  454 	ldw (CMDX,sp),x  
      0091AC B8 CF 00         [ 2]  455 	ldw x,#kword_dict	
      0091AF 1A E7            [ 2]  456 1$:	ldw (LINK,sp),x
      0091B1 02 FE            [ 1]  457 	ld a,(2,x)
      0091B3 27 09            [ 1]  458 	and a,#15 
      0091B5 CD 8D 82         [ 1]  459 	ld acc8,a 
      0091B8 72 5F 00         [ 2]  460 	addw x,#3
      0091BB 04 20 0F 0D      [ 2]  461 	addw x,acc16
      0091BE FE               [ 2]  462 	ldw x,(x) ; command index  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      0091BE CE 00            [ 2]  463 	cpw x,(CMDX,sp)
      0091C0 1A CF            [ 1]  464 	jreq 2$
      0091C2 00 05            [ 2]  465 	ldw x,(LINK,sp)
      0091C4 E6               [ 2]  466 	ldw x,(x) 
      0091C5 02 C7 00         [ 2]  467 	subw x,#2  
      0091C8 04 35            [ 1]  468 	jrne 1$
      0091CA 03               [ 1]  469 	clr a 
      0091CB 00               [ 1]  470 	clrw x 
      0091CC 02 05            [ 2]  471 	jra 9$
      0091CD 1E 03            [ 2]  472 2$: ldw x,(LINK,sp)
      0091CD 5B 02 72         [ 2]  473 	addw x,#2 	
      0013EE                        474 9$:	_drop VSIZE
      0091D0 1B 00            [ 2]    1     addw sp,#VSIZE 
      0091D2 23               [ 4]  475 	ret
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
      0013F1                        116 strlen::
      0091D3 90               [ 2]  117 	pushw x 
      0091D4 85               [ 1]  118 	clr a
      0091D5 81               [ 1]  119 1$:	tnz (x) 
      0091D6 27 04            [ 1]  120 	jreq 9$ 
      0091D6 5D               [ 1]  121 	inc a 
      0091D7 27               [ 1]  122 	incw x 
      0091D8 14 F6            [ 2]  123 	jra 1$ 
      0091DA 5C               [ 2]  124 9$:	popw x 
      0091DB A4               [ 4]  125 	ret 
                                    126 
                                    127 ;------------------------------------
                                    128 ; compare 2 strings
                                    129 ; input:
                                    130 ;   X 		char* first string 
                                    131 ;   Y       char* second string 
                                    132 ; output:
                                    133 ;   A 		0 not == |1 ==  
                                    134 ;-------------------------------------
      0013FC                        135 strcmp:
      0091DC 0F               [ 1]  136 	ld a,(x)
      0091DD 88 0D            [ 1]  137 	jreq 5$ 
      0091DF 01 27            [ 1]  138 	cp a,(y) 
      0091E1 0A F6            [ 1]  139 	jrne 4$ 
      0091E3 90               [ 1]  140 	incw x 
      0091E4 F7 5C            [ 1]  141 	incw y 
      0091E6 90 5C            [ 2]  142 	jra strcmp 
      001408                        143 4$: ; not same  
      0091E8 0A               [ 1]  144 	clr a 
      0091E9 01               [ 4]  145 	ret 
      00140A                        146 5$: ; same 
      0091EA 26 F6            [ 1]  147 	ld a,#1 
      0091EC 84               [ 4]  148 	ret 
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
      0091ED                        159 strcpy::
      0091ED 81               [ 1]  160 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      0091EE 89               [ 2]  161 	pushw x 
      0091EE 90 5A            [ 1]  162 1$: ld a,(y)
      0091F0 90 F6            [ 1]  163 	jreq 9$ 
      0091F2 90               [ 1]  164 	ld (x),a 
      0091F3 5C               [ 1]  165 	incw x 
      0091F4 A1 29            [ 1]  166 	incw y 
      0091F6 27 05            [ 2]  167 	jra 1$ 
      0091F8 CD               [ 1]  168 9$:	clr (x)
      0091F9 8E               [ 2]  169 	popw x 
      0091FA EF               [ 1]  170 	pop a 
      0091FB 24               [ 4]  171 	ret 
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
      00141D                        185 move::
      0091FC 06               [ 1]  186 	push a 
      0091FD                        187 	_vars VSIZE 
      0091FD A6 20            [ 2]    1     sub sp,#VSIZE 
      0091FF 90 F7            [ 1]  188 	clr (INCR,sp)
      009201 90 5C            [ 1]  189 	clr (LB,sp)
      009203 81 89            [ 2]  190 	pushw y 
      009204 13 01            [ 2]  191 	cpw x,(1,sp) ; compare DEST to SRC 
      009204 88 7B            [ 2]  192 	popw y 
      009206 01 C1            [ 1]  193 	jreq move_exit ; x==y 
      009208 00 24            [ 1]  194 	jrmi move_down
      00142E                        195 move_up: ; start from top address with incr=-1
      00920A 2A 08 A6 20      [ 2]  196 	addw x,acc16
      00920E 5A F7 0C 01      [ 2]  197 	addw y,acc16
      009212 20 F1            [ 1]  198 	cpl (INCR,sp)
      009214 84 81            [ 1]  199 	cpl (LB,sp)   ; increment = -1 
      009216 20 05            [ 2]  200 	jra move_loop  
      00143C                        201 move_down: ; start from bottom address with incr=1 
      009216 A6               [ 2]  202     decw x 
      009217 22 90            [ 2]  203 	decw y
      009219 F7 90            [ 1]  204 	inc (LB,sp) ; incr=1 
      001441                        205 move_loop:	
      00921B 5C 89 CD         [ 1]  206     ld a, acc16 
      00921E 98 54 85         [ 1]  207 	or a, acc8
      009221 F6 27            [ 1]  208 	jreq move_exit 
      009223 30 5C A1         [ 2]  209 	addw x,(INCR,sp)
      009226 20 25 0E         [ 2]  210 	addw y,(INCR,sp) 
      009229 90 F7            [ 1]  211 	ld a,(y)
      00922B 90               [ 1]  212 	ld (x),a 
      00922C 5C               [ 2]  213 	pushw x 
      00922D A1 5C 26         [ 2]  214 	ldw x,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      009230 F0               [ 2]  215 	decw x 
      009231 CF 00 0D         [ 2]  216 	ldw acc16,x 
      009231 90               [ 2]  217 	popw x 
      009232 F7 90            [ 2]  218 	jra move_loop
      00145D                        219 move_exit:
      00145D                        220 	_drop VSIZE
      009234 5C 20            [ 2]    1     addw sp,#VSIZE 
      009236 EA               [ 1]  221 	pop a 
      009237 88               [ 4]  222 	ret 	
                                    223 
                                    224 ;------------------------------------
                                    225 ;  set all variables to zero 
                                    226 ; input:
                                    227 ;   none 
                                    228 ; output:
                                    229 ;	none
                                    230 ;------------------------------------
      001461                        231 clear_vars:
      009238 A6               [ 2]  232 	pushw x 
      009239 5C               [ 1]  233 	push a  
      00923A 90 F7 90         [ 2]  234 	ldw x,#vars 
      00923D 5C 84            [ 1]  235 	ld a,#CELL_SIZE*26 
      00923F A0               [ 1]  236 1$:	clr (x)
      009240 07               [ 1]  237 	incw x 
      009241 C7               [ 1]  238 	dec a 
      009242 00 0F            [ 1]  239 	jrne 1$
      009244 72               [ 1]  240 	pop a 
      009245 5F               [ 2]  241 	popw x 
      009246 00               [ 4]  242 	ret 
                                    243 
                                    244 
                                    245 ;-----------------------
                                    246 ;  display system 
                                    247 ;  information 
                                    248 ;-----------------------
                           000002   249 	MAJOR=2
                           000000   250 	MINOR=0 
      009247 0E 89 AE 8E 41 72 BB   251 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
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
      00925C                        253 system_information:
      00925C 1D 00 31         [ 2]  254 	ldw x,#software 
      00925F A6 03 62         [ 4]  255 	call puts 
      009262 9F AB            [ 1]  256 	ld a,#MAJOR 
      009264 41 81 0E         [ 1]  257 	ld acc8,a 
      009266 5F               [ 1]  258 	clrw x 
      009266 90 89 90         [ 2]  259 	ldw acc24,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      009269 AE B3 BC 90      [ 1]  260 	clr tab_width  
      00926D CF 00 1A 90      [ 1]  261 	mov base, #10 
      009271 5F 91 D3         [ 4]  262 	call prt_acc24 
      009274 1A 27            [ 1]  263 	ld a,#'.
      009276 0C 90 5C         [ 4]  264 	call putc 
      009279 91 D6            [ 1]  265 	ld a,#MINOR 
      00927B 1A 90 5C         [ 1]  266 	ld acc8,a 
      00927E 91               [ 1]  267 	clrw x 
      00927F DA 1A 26         [ 2]  268 	ldw acc24,x 
      009282 EF 93 90         [ 4]  269 	call prt_acc24
      009285 85 81            [ 1]  270 	ld a,#CR 
      009287 CD 09 44         [ 4]  271 	call putc
                                    272 ;call test 
      009287 52               [ 4]  273 	ret
                                    274 
      0014E7                        275 warm_init:
      009288 04 C6 00 0B      [ 2]  276 	ldw y,#XSTACK_EMPTY  
      00928C 6B 01 C6 00      [ 1]  277 	clr flags 
      009290 24 6B 02 17      [ 1]  278 	clr loop_depth 
      009294 03 72 CE 00      [ 1]  279 	mov tab_width,#TAB_WIDTH 
      009298 05 35 0A 00      [ 1]  280 	mov base,#10 
      00929C 0B 35 05         [ 2]  281 	ldw x,#0 
      00929F 00 24 72         [ 2]  282 	ldw basicptr,x 
      0092A2 5F 00 0D         [ 2]  283 	ldw in.w,x 
      0092A5 CF 00 0E 4F      [ 1]  284 	clr count
      0092A9 CD               [ 4]  285 	ret 
                                    286 
                                    287 ;---------------------------
                                    288 ; reset BASIC text variables 
                                    289 ; and clear variables 
                                    290 ;---------------------------
      001509                        291 clear_basic:
      0092AA 98               [ 2]  292 	pushw x 
      0092AB C0 CD 92 04      [ 1]  293 	clr count
      0092AF 88 90 93 1E      [ 1]  294 	clr in  
      0092B3 04 CD 94         [ 2]  295 	ldw x,#free_ram 
      0092B6 8D 90 5F         [ 2]  296 	ldw txtbgn,x 
      0092B9 84 90 97         [ 2]  297 	ldw txtend,x 
      0092BC 72 F9 03         [ 4]  298 	call clear_vars 
      0092BF A6               [ 2]  299 	popw x
      0092C0 20               [ 4]  300 	ret 
                                    301 
                                    302 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    303 ;;   Tiny BASIC error messages     ;;
                                    304 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001520                        305 err_msg:
      0092C1 90 F7 90 5C 72 5F 00   306 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             24 AE 00 03 CF
      0092CD 00 01 15 B1 15 CB 15   307 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             DC 15 ED
      0092CF 15 F9 16 2C 16 3C 16   308 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             50 16 63
      0092CF 90 89                  309 	.word err_overflow 
                                    310 
      0092D1 CD 98 2E 90 85 4D 26   311 err_mem_full: .asciz "Memory full\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal  03-Bits]



             66 75 6C 6C 0A 00
      0092D9 CC 94 02 2B 03 CC 93   312 err_syntax: .asciz "syntax error\n" 
             73 72 72 6F 72 0A 00
      0092E1 6D 61 74 68 20 6F 70   313 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      0092E1 A1 85 26 0F CD 91 EE   314 err_div0: .asciz "division by 0\n" 
             CD 98 63 CD 92 5C 90
             F7
      0092F0 90 5C 20 DB 6C 69 64   315 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      0092F4 72 75 6E 20 74 69 6D   316 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      0092F4 A1 84 26 26 CD 98 6D   317 err_cmd_only: .asciz "command line only usage.\n"
             C7 00 0D CF 00 0E CD
             91 EE 90 89 A6 FF CD
             98 C0 16 01 88
      00930E 51 CD 94 8D 90 5F 84   318 err_duplicate: .asciz "duplicate name.\n"
             90 97 72 F9 01 5B 02
             20 B1 00
      00931E 46 69 6C 65 20 6E 6F   319 err_not_file: .asciz "File not found.\n"
             74 20 66 6F 75 6E 64
             2E 0A 00
      00931E A1 87 24 39 FE 72 5C   320 err_bad_value: .asciz "bad value.\n"
             00 02 72 5C 00
      00932A 02 A3 00 82 26 23 CE   321 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             00 05 CD 91 EE A6 27
             90 F7 90 5C 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      00933C 4E 6F 20 64 61 74 61   322 err_no_data: .asciz "No data found.\n"
             20 66 6F 75 6E 64 2E
             0A 00
      00933C 72 D6 00 01 72 5C 00   323 err_no_prog: .asciz "No program in RAM!\n"
             02 90 F7 90 5C C6 00
             02 C1 00 04 2B EC
      009350 CC 94 02 A3 00 4A 26   324 err_no_fspace: .asciz "File system full.\n" 
             0B CC 92 CF 20 66 75
             6C 6C 2E 0A 00
      00935B 42 75 66 66 65 72 20   325 err_buf_full: .asciz "Buffer full\n"
             66 75 6C 6C 0A 00
      00935B 5F A0 87 48 97 1C 00   326 err_overflow: .asciz "overflow\n" 
             FA 0A 00
                                    327 
      009363 0A 72 75 6E 20 74 69   328 rt_msg: .asciz "\nrun time error, "
             6D 65 20 65 72 72 6F
             72 2C 20 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      009363 CD 91 EE 90 89 CD 94   329 comp_msg: .asciz "\ncompile error, "
             3D 90 85 CD 91 D6 CC
             92 CF 00
      009373 6C 61 73 74 20 74 6F   330 tk_id: .asciz "last token id: "
             6B 65 6E 20 69 64 3A
             20 00
                                    331 
      0016AD                        332 syntax_error::
      009373 A1 03            [ 1]  333 	ld a,#ERR_SYNTAX 
                                    334 
      0016AF                        335 tb_error::
      009375 26 1E A6 20 90   [ 2]  336 	btjt flags,#FCOMP,1$
      00937A F7               [ 1]  337 	push a 
      00937B 90 5C 7A         [ 2]  338 	ldw x, #rt_msg 
      00937D CD 09 A1         [ 4]  339 	call puts 
      00937D 89               [ 1]  340 	pop a 
      00937E CD 98 54         [ 2]  341 	ldw x, #err_msg 
      009381 85 5F 00 0D      [ 1]  342 	clr acc16 
      009382 48               [ 1]  343 	sll a
      009382 F6 27 07 5C      [ 1]  344 	rlc acc16  
      009386 90 F7 90         [ 1]  345 	ld acc8, a 
      009389 5C 20 F6 0D      [ 2]  346 	addw x,acc16 
      00938C FE               [ 2]  347 	ldw x,(x)
      00938C A6 20 90         [ 4]  348 	call puts
      00938F F7 90 5C         [ 2]  349 	ldw x,basicptr 
                           000001   350 .if DEBUG 
      009392 CC 92 CF         [ 1]  351 ld a,count 
      009395 90 5F            [ 1]  352 clrw y 
      009395 A1 02            [ 1]  353 rlwa y  
      009397 26 09 CD         [ 4]  354 call hex_dump
      00939A 91 EE CD         [ 2]  355 ldw x,basicptr
                                    356 .endif 
      00939D 92 16 CC         [ 1]  357 	ld a,in 
      0093A0 92 CF C6         [ 4]  358 	call prt_basic_line
      0093A2 AE 16 9D         [ 2]  359 	ldw x,#tk_id 
      0093A2 A1 04 26         [ 4]  360 	call puts 
      0093A5 10 CD 91         [ 1]  361 	ld a,in.saved 
      0093A8 EE               [ 1]  362 	clrw x 
      0093A9 A6               [ 1]  363 	ld xl,a 
      0093AA 5C 90 F7 90      [ 2]  364 	addw x,basicptr 
      0093AE 5C               [ 1]  365 	ld a,(x)
      0093AF F6               [ 1]  366 	clrw x 
      0093B0 72               [ 1]  367 	ld xl,a 
      0093B1 5C 00 02         [ 4]  368 	call prt_i16
      0093B4 20 06            [ 2]  369 	jra 6$
      001700                        370 1$:	
      0093B6 A1               [ 1]  371 	push a 
      0093B7 0A 26 09         [ 2]  372 	ldw x,#comp_msg
      0093BA A6 3A A1         [ 4]  373 	call puts 
      0093BC 84               [ 1]  374 	pop a 
      0093BC 90 F7 90         [ 2]  375 	ldw x, #err_msg 
      0093BF 5C 5F 00 0D      [ 1]  376 	clr acc16 
      0093C0 48               [ 1]  377 	sll a
      0093C0 CC 92 CF 0D      [ 1]  378 	rlc acc16  
      0093C3 C7 00 0E         [ 1]  379 	ld acc8, a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      0093C3 A1 09 22 0A      [ 2]  380 	addw x,acc16 
      0093C7 A0               [ 2]  381 	ldw x,(x)
      0093C8 05 5F 97         [ 4]  382 	call puts
      0093CB 1C 94 18         [ 2]  383 	ldw x,#tib
      0093CE F6 20 EB         [ 4]  384 	call puts 
      0093D1 A6 0D            [ 1]  385 	ld a,#CR 
      0093D1 A1 11 22         [ 4]  386 	call putc
      0093D4 0A A0 10         [ 2]  387 	ldw x,in.w
      0093D7 5F 97 1C         [ 4]  388 	call spaces
      0093DA 94 1D            [ 1]  389 	ld a,#'^
      0093DC F6 20 DD         [ 4]  390 	call putc 
      0093DF AE 17 FF         [ 2]  391 6$: ldw x,#STACK_EMPTY 
      0093DF A1               [ 1]  392     ldw sp,x
                                    393 
      001739                        394 warm_start:
      0093E0 22 22 0A         [ 4]  395 	call warm_init
                                    396 ;----------------------------
                                    397 ;   BASIC interpreter
                                    398 ;----------------------------
      00173C                        399 cmd_line: ; user interface 
      0093E3 A0 20            [ 1]  400 	ld a,#CR 
      0093E5 5F 97 1C         [ 4]  401 	call putc 
      0093E8 94 1F            [ 1]  402 	ld a,#'> 
      0093EA F6 20 CF         [ 4]  403 	call putc
      0093ED CD 0A A6         [ 4]  404 	call readln
      0093ED A0 31 48 5F      [ 1]  405 	tnz count 
      0093F1 97 1C            [ 1]  406 	jreq cmd_line
      0093F3 94 22 FE         [ 4]  407 	call compile
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
      0093F6 F6 5C 90 F7      [ 1]  421 	tnz count 
      0093FA 90 5C            [ 1]  422 	jreq cmd_line
                                    423 	
                                    424 ; if direct command 
                                    425 ; it's ready to interpret 
                                    426 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    427 ;; This is the interpreter loop
                                    428 ;; for each BASIC code line. 
                                    429 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      001758                        430 interpreter: 
      0093FC F6 26 BD         [ 1]  431 	ld a,in 
      0093FF CC 92 CF         [ 1]  432 	cp a,count 
      009402 2B 1D            [ 1]  433 	jrmi interp_loop
      001760                        434 next_line:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      009402 90 7F 1E 03 7B   [ 2]  435 	btjf flags, #FRUN, cmd_line
      009407 01 C7 00         [ 2]  436 	ldw x,basicptr
      00940A 0B 7B 02 C7      [ 2]  437 	addw x,in.w 
      00940E 00 24 72         [ 2]  438 	cpw x,txtend 
      009411 F2 03            [ 1]  439 	jrpl warm_start
      009413 90 9F 5B         [ 2]  440 	ldw basicptr,x ; start of next line  
      009416 04 81            [ 1]  441 	ld a,(2,x)
      009418 40 28 29         [ 1]  442 	ld count,a 
      00941B 2C 23 2B 2D      [ 1]  443 	mov in,#3 ; skip first 3 bytes of line 
      00177D                        444 interp_loop:
      00941F 2A 2F 25         [ 4]  445 	call next_token
      009422 94 2E            [ 1]  446 	cp a,#TK_NONE 
      009424 94 30            [ 1]  447 	jreq next_line 
      009426 94 32            [ 1]  448 	cp a,#TK_CMD
      009428 94 35            [ 1]  449 	jrne 1$
      00942A 94 3A 94         [ 4]  450 	call get_code_addr
      00942D 37               [ 4]  451 	call (x) 
      00942E 3E 00            [ 2]  452 	jra interp_loop 
      00178E                        453 1$:	 
      009430 3D 00            [ 1]  454 	cp a,#TK_VAR
      009432 3E 3D            [ 1]  455 	jrne 2$
      009434 00 3C 00         [ 4]  456 	call let_var  
      009437 3C 3D            [ 2]  457 	jra interp_loop 
      001797                        458 2$:	
      009439 00 3C            [ 1]  459 	cp a,#TK_ARRAY 
      00943B 3E 00            [ 1]  460 	jrne 3$
      00943D CD 1C 7C         [ 4]  461 	call let_array 
      00943D 52 04            [ 2]  462 	jra interp_loop
      0017A0                        463 3$:	
      00943F 72 5F            [ 1]  464 	cp a,#TK_COLON 
      009441 00 0E            [ 1]  465 	jreq interp_loop
      009443 1F 01            [ 1]  466 4$: cp a,#TK_LABEL
      009445 AE B3 B4         [ 4]  467 	call skip_string 
      009448 1F 03            [ 2]  468 	jra interp_loop 
      00944A E6 02 A4         [ 2]  469 5$:	jp syntax_error 
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
      0017AE                        480 next_token::
                                    481 ;	clrw x 
      00944D 0F C7 00         [ 1]  482 	ld a,in 
      009450 0F 1C 00         [ 1]  483 	ld in.saved,a ; in case "_unget_token" needed 
                                    484 ; don't replace sub by "cp a,count" 
                                    485 ; if end of line must return with A=0   	
      009453 03 72 BB         [ 1]  486 	sub a,count 
      009456 00 0E            [ 1]  487 	jreq 9$ ; end of line 
      0017B9                        488 0$: 
      009458 FE 13 01         [ 2]  489 	ldw x,basicptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      00945B 27 0C 1E 03      [ 2]  490 	addw x,in.w 
      00945F FE               [ 1]  491 	ld a,(x)
      009460 1D               [ 1]  492 	incw x
      009461 00 02 26 E3      [ 1]  493 	inc in   
      009465 4F               [ 4]  494 9$: ret 
                                    495 
                                    496 ;------------------------
                                    497 ; get cmd and function 
                                    498 ; code address 
                                    499 ; input:
                                    500 ;    X   * cmd|func index 
                                    501 ;        in code_addr table 
                                    502 ;------------------------
      0017C7                        503 get_code_addr:
      009466 5F               [ 2]  504 	ldw x,(x)
      009467 20 05 1E         [ 2]  505 	ldw x,(code_addr,x)
      00946A 03 1C 00 02      [ 1]  506 	inc in 
      00946E 5B 04 81 01      [ 1]  507 	inc in 
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
      009471 A6 FF            [ 1]  604 	ld a,#255  ; signed conversion  
      009471 89 4F 7D         [ 4]  605     call itoa  ; conversion entier en  .asciz
      009474 27 04 4C         [ 4]  606 	call right_align  
      009477 5C               [ 1]  607 	push a 
      009478 20 F9 85         [ 4]  608 	call puts
      00947B 81               [ 1]  609 	pop a 
      00947C 81               [ 4]  610     ret	
                                    611 
                                    612 ;---------------------------------------
                                    613 ;  print value at xstack top 
                                    614 ;---------------------------------------
      001828                        615 print_top: 
      001828                        616 	_xpop 
      00947C F6 27            [ 1]    1     ld a,(y)
      00947E 0B               [ 1]    2     ldw x,y 
      00947F 90 F1            [ 2]    3     ldw x,(1,x)
      009481 26 05 5C 90      [ 2]    4     addw y,#CELL_SIZE 
      009485 5C 20 F4         [ 1]  617 	ld acc24,a 
      009488 CF 00 0D         [ 2]  618 	ldw acc16,x 
      009488 4F 81 1A         [ 4]  619 	call prt_acc24 
      00948A A6 20            [ 1]  620 	ld a,#SPACE
      00948A A6 01 81         [ 4]  621 	call putc 
      00948D 81               [ 4]  622 	ret 
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
      001840                        638 itoa::
      001840                        639 	_vars VSIZE
      00948D 88 89            [ 2]    1     sub sp,#VSIZE 
      00948F 90 F6            [ 1]  640 	clr (LEN,sp) ; string length  
      009491 27 06            [ 1]  641 	clr (SIGN,sp)    ; sign
      009493 F7               [ 1]  642 	tnz A
      009494 5C 90            [ 1]  643 	jreq 1$ ; unsigned conversion  
      009496 5C 20 F6         [ 1]  644 	ld a,base 
      009499 7F 85            [ 1]  645 	cp a,#10
      00949B 84 81            [ 1]  646 	jrne 1$
                                    647 	; base 10 string display with negative sign if bit 23==1
      00949D 72 0F 00 0C 05   [ 2]  648 	btjf acc24,#7,1$
      00949D 88 52            [ 1]  649 	cpl (SIGN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      00949F 02 0F 01         [ 4]  650 	call neg_acc24
      00185A                        651 1$:
                                    652 ; initialize string pointer 
      0094A2 0F 02 90         [ 2]  653 	ldw x,#tib 
      0094A5 89 13 01         [ 2]  654 	addw x,#TIB_SIZE
      0094A8 90               [ 2]  655 	decw x 
      0094A9 85               [ 1]  656 	clr (x)
      001862                        657 itoa_loop:
      0094AA 27 31 2B         [ 1]  658     ld a,base
                                    659 ;	ldw (PSTR,sp),x 
      0094AD 0E 03 09         [ 4]  660     call divu24_8 ; acc24/A 
                                    661 ;	ldw x,(PSTR,sp)
      0094AE AB 30            [ 1]  662     add a,#'0  ; remainder of division
      0094AE 72 BB            [ 1]  663     cp a,#'9+1
      0094B0 00 0E            [ 1]  664     jrmi 2$
      0094B2 72 B9            [ 1]  665     add a,#7 
      001870                        666 2$:	
      0094B4 00               [ 2]  667 	decw x
      0094B5 0E               [ 1]  668     ld (x),a
      0094B6 03 01            [ 1]  669 	inc (LEN,sp)
                                    670 	; if acc24==0 conversion done
      0094B8 03 02 20         [ 1]  671 	ld a,acc24
      0094BB 05 00 0D         [ 1]  672 	or a,acc16
      0094BC CA 00 0E         [ 1]  673 	or a,acc8
      0094BC 5A 90            [ 1]  674     jrne itoa_loop
                                    675 	;conversion done, next add '$' or '-' as required
      0094BE 5A 0C 02         [ 1]  676 	ld a,base 
      0094C1 A1 10            [ 1]  677 	cp a,#16
      0094C1 C6 00            [ 1]  678 	jreq 8$
      0094C3 0E CA            [ 1]  679 	ld a,(SIGN,sp)
      0094C5 00 0F            [ 1]  680     jreq 10$
      0094C7 27 14            [ 1]  681     ld a,#'-
      0094C9 72 FB            [ 2]  682 	jra 9$ 
      00188E                        683 8$:	
      0094CB 01 72            [ 1]  684 	ld a,#'$ 
      0094CD F9               [ 2]  685 9$: decw x
      0094CE 01               [ 1]  686     ld (x),a
      0094CF 90 F6            [ 1]  687 	inc (LEN,sp)
      001894                        688 10$:
      0094D1 F7 89            [ 1]  689 	ld a,(LEN,sp)
      001896                        690 	_drop VSIZE
      0094D3 CE 00            [ 2]    1     addw sp,#VSIZE 
      0094D5 0E               [ 4]  691 	ret
                                    692 
                                    693 ;------------------------------------
                                    694 ; convert alpha to uppercase
                                    695 ; input:
                                    696 ;    a  character to convert
                                    697 ; output:
                                    698 ;    a  uppercase character
                                    699 ;------------------------------------
      001899                        700 to_upper::
      0094D6 5A CF            [ 1]  701 	cp a,#'a
      0094D8 00 0E            [ 1]  702 	jrpl 1$
      0094DA 85               [ 4]  703 0$:	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      0094DB 20 E4            [ 1]  704 1$: cp a,#'z	
      0094DD 22 FB            [ 1]  705 	jrugt 0$
      0094DD 5B 02            [ 1]  706 	sub a,#32
      0094DF 84               [ 4]  707 	ret
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
      0018A5                        721 atoi24::
      0094E0 81               [ 2]  722 	pushw x 
      0094E1                        723 	_vars VSIZE
      0094E1 89 88            [ 2]    1     sub sp,#VSIZE 
                                    724 	; acc24=0 
      0094E3 AE 00 31 A6      [ 1]  725 	clr acc24    
      0094E7 4E 7F 5C 4A      [ 1]  726 	clr acc16
      0094EB 26 FB 84 85      [ 1]  727 	clr acc8 
      0094EF 81 0A            [ 1]  728 	clr (SIGN,sp)
      0094F1 0A 54            [ 1]  729 	ld a,#10
      0094F3 69 6E            [ 1]  730 	ld (BASE,sp),a ; default base decimal
      0094F5 79               [ 1]  731 	ld a,(x)
      0094F6 20 42            [ 1]  732 	jreq 9$  ; completed if 0
      0094F8 41 53            [ 1]  733 	cp a,#'-
      0094FA 49 43            [ 1]  734 	jrne 1$
      0094FC 20 66            [ 1]  735 	cpl (SIGN,sp)
      0094FE 6F 72            [ 2]  736 	jra 2$
      009500 20 53            [ 1]  737 1$: cp a,#'$
      009502 54 4D            [ 1]  738 	jrne 3$
      009504 38 0A            [ 1]  739 	ld a,#16
      009506 43 6F            [ 1]  740 	ld (BASE,sp),a
      009508 70               [ 1]  741 2$:	incw x
      009509 79               [ 1]  742 	ld a,(x)
      0018CF                        743 3$:	
      00950A 72 69            [ 1]  744 	cp a,#'a
      00950C 67 68            [ 1]  745 	jrmi 4$
      00950E 74 2C            [ 1]  746 	sub a,#32
      009510 20 4A            [ 1]  747 4$:	cp a,#'0
      009512 61 63            [ 1]  748 	jrmi 9$
      009514 71 75            [ 1]  749 	sub a,#'0
      009516 65 73            [ 1]  750 	cp a,#10
      009518 20 44            [ 1]  751 	jrmi 5$
      00951A 65 73            [ 1]  752 	sub a,#7
      00951C 63 68            [ 1]  753 	cp a,(BASE,sp)
      00951E 65 6E            [ 1]  754 	jrpl 9$
      009520 65 73            [ 1]  755 5$:	ld (TEMP,sp),a
      009522 20 32            [ 1]  756 	ld a,(BASE,sp)
      009524 30 31 39         [ 4]  757 	call mulu24_8
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      009527 2C 32            [ 1]  758 	ld a,(TEMP,sp)
      009529 30 32 32         [ 1]  759 	add a,acc24+2
      00952C 0A 76 65         [ 1]  760 	ld acc24+2,a
      00952F 72               [ 1]  761 	clr a
      009530 73 69 6F         [ 1]  762 	adc a,acc24+1
      009533 6E 20 00         [ 1]  763 	ld acc24+1,a
      009536 4F               [ 1]  764 	clr a
      009536 AE 94 F0         [ 1]  765 	adc a,acc24
      009539 CD 8A 21         [ 1]  766 	ld acc24,a
      00953C A6 02            [ 2]  767 	jra 2$
      00953E C7 00            [ 1]  768 9$:	tnz (SIGN,sp)
      009540 0F 5F            [ 1]  769     jreq atoi_exit
      009542 CF 00 0D         [ 4]  770     call neg_acc24
      00190B                        771 atoi_exit: 
      00190B                        772 	_drop VSIZE
      009545 72 5F            [ 2]    1     addw sp,#VSIZE 
      009547 00               [ 2]  773 	popw x ; restore x
      009548 24               [ 4]  774 	ret
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
      00190F                        795 search_dict::
      00190F                        796 	_vars VSIZE 
      009549 35 0A            [ 2]    1     sub sp,#VSIZE 
      00954B 00 0B            [ 2]  797 	ldw (YSAVE,sp),y 
      001913                        798 search_next:
      00954D CD 98            [ 2]  799 	ldw (XSAVE,sp),x 
                                    800 ; get name length in dictionary	
      00954F 9A               [ 1]  801 	ld a,(x)
      009550 A6 2E            [ 1]  802 	and a,#0xf 
      009552 CD 89            [ 1]  803 	ld (NLEN,sp),a  
      009554 C4 A6            [ 2]  804 	ldw y,(YSAVE,sp) ; name pointer 
      009556 00               [ 1]  805 	incw x 
      00191D                        806 cp_loop:
      009557 C7 00            [ 1]  807 	ld a,(y)
      009559 0F 5F            [ 1]  808 	jreq str_match 
      00955B CF 00            [ 1]  809 	tnz (NLEN,sp)
      00955D 0D CD            [ 1]  810 	jreq no_match  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      00955F 98               [ 1]  811 	cp a,(x)
      009560 9A A6            [ 1]  812 	jrne no_match 
      009562 0D CD            [ 1]  813 	incw y 
      009564 89               [ 1]  814 	incw x
      009565 C4 81            [ 1]  815 	dec (NLEN,sp)
      009567 20 EE            [ 2]  816 	jra cp_loop 
      00192F                        817 no_match:
      009567 90 AE            [ 2]  818 	ldw x,(XSAVE,sp) 
      009569 17 73 72         [ 2]  819 	subw x,#2 ; move X to link field
      00956C 5F 00            [ 1]  820 	push #TK_NONE 
      00956E 23               [ 2]  821 	ldw x,(x) ; next word link 
      00956F 72               [ 1]  822 	pop a ; TK_NONE 
      009570 5F 00            [ 1]  823 	jreq search_exit  ; not found  
                                    824 ;try next 
      009572 20 35            [ 2]  825 	jra search_next
      00193C                        826 str_match:
      009574 04 00            [ 2]  827 	ldw x,(XSAVE,sp)
      009576 24               [ 1]  828 	ld a,(X)
      009577 35 0A            [ 1]  829 	ld (NLEN,sp),a ; needed to test keyword type  
      009579 00 0B            [ 1]  830 	and a,#NLEN_MASK 
                                    831 ; move x to procedure address field 	
      00957B AE               [ 1]  832 	inc a 
      00957C 00 00 CF         [ 1]  833 	ld acc8,a 
      00957F 00 05 CF 00      [ 1]  834 	clr acc16 
      009583 01 72 5F 00      [ 2]  835 	addw x,acc16 
      009587 04               [ 2]  836 	ldw x,(x) ; routine index  
                                    837 ;determine keyword type bits 7:4 
      009588 81 01            [ 1]  838 	ld a,(NLEN,sp)
      009589 A4 F0            [ 1]  839 	and a,#KW_TYPE_MASK 
      009589 89               [ 1]  840 	swap a 
      00958A 72 5F            [ 1]  841 	add a,#128
      001957                        842 search_exit: 
      001957                        843 	_drop VSIZE 
      00958C 00 04            [ 2]    1     addw sp,#VSIZE 
      00958E 72               [ 4]  844 	ret 
                                    845 
                                    846 ;---------------------
                                    847 ; check if next token
                                    848 ;  is of expected type 
                                    849 ; input:
                                    850 ;   A 		 expected token attribute
                                    851 ;  ouput:
                                    852 ;   none     if fail call syntax_error 
                                    853 ;--------------------
      00195A                        854 expect:
      00958F 5F               [ 1]  855 	push a 
      009590 00 02 AE         [ 4]  856 	call next_token 
      009593 00 80            [ 1]  857 	cp a,(1,sp)
      009595 CF 00            [ 1]  858 	jreq 1$
      009597 1C CF 00         [ 2]  859 	jp syntax_error
      00959A 1E               [ 1]  860 1$: pop a 
      00959B CD               [ 4]  861 	ret 
                                    862 
                                    863 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    864 ; parse arguments list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



                                    865 ; between ()
                                    866 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001967                        867 func_args:
      00959C 94 E1            [ 1]  868 	ld a,#TK_LPAREN 
      00959E 85 81 5A         [ 4]  869 	call expect 
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
      0095A0                        885 arg_list:
      0095A0 00 00            [ 1]  886 	push #0
      0095A2 95 C2 95         [ 4]  887 1$:	call condition 
      0095A5 CF               [ 1]  888 	tnz a 
      0095A6 95 DD            [ 1]  889 	jreq 7$  
      0095A8 95 F6            [ 1]  890 	inc (1,sp)
      0095AA 96 05 96         [ 4]  891 	call next_token 
      0095AD 1B 96            [ 1]  892 	cp a,#TK_COMMA 
      0095AF 31 96            [ 1]  893 	jreq 1$ 
      0095B1 4B 96            [ 1]  894 	cp a,#TK_RPAREN
      0095B3 5C 96            [ 1]  895 	jreq 7$
      001981                        896 	_unget_token 
      0095B5 6D 96 79 96 AC   [ 1]    1      mov in,in.saved  
      0095BA 96               [ 1]  897 7$:	pop a  
      0095BB BC               [ 4]  898 	ret 
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
      001988                        926 get_array_element:
      0095BC 96 D0 96         [ 4]  927 	call func_args 
      0095BF E3 96            [ 1]  928 	cp a,#1
      0095C1 F0 4D            [ 1]  929 	jreq 1$
      0095C3 65 6D 6F         [ 2]  930 	jp syntax_error
      001992                        931 1$: _xpop 
      0095C6 72 79            [ 1]    1     ld a,(y)
      0095C8 20               [ 1]    2     ldw x,y 
      0095C9 66 75            [ 2]    3     ldw x,(1,x)
      0095CB 6C 6C 0A 00      [ 2]    4     addw y,#CELL_SIZE 
                                    932     ; ignore A, index < 65536 in any case 
                                    933 	; check for bounds 
      0095CF 73 79 6E         [ 2]  934 	cpw x,array_size 
      0095D2 74 61            [ 2]  935 	jrule 3$
                                    936 ; bounds {1..array_size}	
      0095D4 78 20            [ 1]  937 2$: ld a,#ERR_BAD_VALUE 
      0095D6 65 72 72         [ 2]  938 	jp tb_error 
      0095D9 6F               [ 2]  939 3$: tnzw  x
      0095DA 72 0A            [ 1]  940 	jreq 2$ 
      0095DC 00               [ 2]  941 	pushw x 
      0095DD 6D               [ 2]  942 	sllw x 
      0095DE 61 74 68         [ 2]  943 	addw x,(1,sp) ; index*size_of(int24)
      0095E1 20 6F            [ 2]  944 	ldw (1,sp),x  
      0095E3 70 65 72         [ 2]  945 	ldw x,#tib ; array is below tib 
      0095E6 61 74 69         [ 2]  946 	subw x,(1,sp)
      0019B5                        947 	_drop 2   
      0095E9 6F 6E            [ 2]    1     addw sp,#2 
      0095EB 20               [ 4]  948 	ret 
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
      0019B8                        964 factor:
      0019B8                        965 	_vars VSIZE 
      0095EC 6F 76            [ 2]    1     sub sp,#VSIZE 
      0095EE 65 72            [ 1]  966 	clr (NEG,sp)
      0095F0 66 6C 6F         [ 4]  967 	call next_token
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      0095F3 77               [ 1]  968 	tnz a 
      0095F4 0A 00            [ 1]  969 	jrne 1$ 
      0095F6 64 69 76         [ 2]  970 	jp 22$ 
      0095F9 69 73            [ 1]  971 1$:	cp a,#TK_PLUS 
      0095FB 69 6F            [ 1]  972 	jreq 2$
      0095FD 6E 20            [ 1]  973 	cp a,#TK_MINUS 
      0095FF 62 79            [ 1]  974 	jrne 4$ 
      009601 20 30            [ 1]  975 	cpl (NEG,sp)
      0019CF                        976 2$:	
      009603 0A 00 69         [ 4]  977 	call next_token
      0019D2                        978 4$:
      009606 6E               [ 1]  979 	tnz a 
      009607 76 61            [ 1]  980 	jrne 41$ 
      009609 6C 69 64         [ 2]  981 	jp syntax_error  
      0019D8                        982 41$:	
      00960C 20 6C            [ 1]  983 	cp a,#TK_IFUNC 
      00960E 69 6E            [ 1]  984 	jrne 5$ 
      009610 65 20 6E         [ 4]  985 	call get_code_addr 
      009613 75               [ 4]  986 	call (x); result in A:X  
      009614 6D 62            [ 2]  987 	jra 18$ 
      0019E2                        988 5$:
      009616 65 72            [ 1]  989 	cp a,#TK_INTGR
      009618 2E 0A            [ 1]  990 	jrne 6$
      00961A 00 72 75         [ 4]  991 	call get_int24 ; A:X
      00961D 6E 20            [ 2]  992 	jra 18$
      0019EB                        993 6$:
      00961F 74 69            [ 1]  994 	cp a,#TK_ARRAY
      009621 6D 65            [ 1]  995 	jrne 7$
      009623 20 6F 6E         [ 4]  996 	call get_array_element
      009626 6C 79            [ 2]  997     jra 71$
      0019F4                        998 7$:
      009628 20 75            [ 1]  999 	cp a,#TK_VAR 
      00962A 73 61            [ 1] 1000 	jrne 8$
      00962C 67 65 2E         [ 4] 1001 	call get_addr 
      0019FB                       1002 71$: ; put value in A:X
      00962F 0A               [ 1] 1003 	ld a,(x)
      009630 00 63            [ 2] 1004 	ldw x,(1,x)
      009632 6F 6D            [ 2] 1005 	jra 18$
      001A00                       1006 8$:
      009634 6D 61            [ 1] 1007 	cp a,#TK_LABEL 
      009636 6E 64            [ 1] 1008 	jrne 9$ 
      009638 20               [ 2] 1009 	pushw x 
      009639 6C 69 6E         [ 4] 1010 	call skip_string
      00963C 65               [ 2] 1011 	popw x 
      00963D 20 6F 6E         [ 4] 1012 	call search_const 
      009640 6C               [ 2] 1013 	tnzw x 
      009641 79 20            [ 1] 1014 	jreq 16$
      009643 75 73 61         [ 4] 1015 	call get_const_value ; in A:X 
      009646 67 65            [ 2] 1016 	jra 18$
      001A14                       1017 9$: 
      009648 2E 0A            [ 1] 1018 	cp a,#TK_CFUNC 
      00964A 00 64            [ 1] 1019 	jrne 12$
      00964C 75 70 6C         [ 4] 1020 	call get_code_addr 
      00964F 69               [ 4] 1021 	call(x)
      009650 63               [ 1] 1022 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      009651 61               [ 1] 1023 	rlwa x  ; char>int24 in A:X 
      009652 74 65            [ 2] 1024 	jra 18$ 	 
      001A20                       1025 12$:			
      009654 20 6E            [ 1] 1026 	cp a,#TK_LPAREN
      009656 61 6D            [ 1] 1027 	jrne 16$
      009658 65 2E 0A         [ 4] 1028 	call expression
      00965B 00 46            [ 1] 1029 	ld a,#TK_RPAREN 
      00965D 69 6C 65         [ 4] 1030 	call expect
      001A2C                       1031 	_xpop 
      009660 20 6E            [ 1]    1     ld a,(y)
      009662 6F               [ 1]    2     ldw x,y 
      009663 74 20            [ 2]    3     ldw x,(1,x)
      009665 66 6F 75 6E      [ 2]    4     addw y,#CELL_SIZE 
      009669 64 2E            [ 2] 1032 	jra 18$	
      001A37                       1033 16$:
      001A37                       1034 	_unget_token 
      00966B 0A 00 62 61 64   [ 1]    1      mov in,in.saved  
      009670 20               [ 1] 1035 	clr a 
      009671 76 61            [ 2] 1036 	jra 22$ 
      001A3F                       1037 18$: 
      009673 6C 75            [ 1] 1038 	tnz (NEG,sp)
      009675 65 2E            [ 1] 1039 	jreq 20$
      009677 0A 00 46         [ 4] 1040 	call neg_ax   
      001A46                       1041 20$:
      001A46                       1042 	_xpush 
      00967A 69 6C 65 20      [ 2]    1     subw y,#CELL_SIZE
      00967E 69 6E            [ 1]    2     ld (y),a 
      009680 20 65 78         [ 2]    3     ldw (1,y),x 
      009683 74 65            [ 1] 1043 	ld a,#TK_INTGR
      001A51                       1044 22$:
      001A51                       1045 	_drop VSIZE
      009685 6E 64            [ 2]    1     addw sp,#VSIZE 
      009687 65               [ 4] 1046 	ret
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
      001A54                       1057 term:
      001A54                       1058 	_vars VSIZE
      009688 64 20            [ 2]    1     sub sp,#VSIZE 
                                   1059 ; first factor 	
      00968A 6D 65 6D         [ 4] 1060 	call factor
      00968D 6F               [ 1] 1061 	tnz a 
      00968E 72 79            [ 1] 1062 	jreq term_exit  
      001A5C                       1063 term01:	 ; check for  operator '*'|'/'|'%' 
      009690 2C 20 63         [ 4] 1064 	call next_token
      009693 61 6E            [ 1] 1065 	ld (MULOP,sp),a
      009695 27 74            [ 1] 1066 	and a,#TK_GRP_MASK
      009697 20 62            [ 1] 1067 	cp a,#TK_GRP_MULT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      009699 65 20            [ 1] 1068 	jreq 1$
      00969B 72 75            [ 1] 1069 	ld a,#TK_INTGR
      001A69                       1070 	_unget_token 
      00969D 6E 20 66 72 6F   [ 1]    1      mov in,in.saved  
      0096A2 6D 20            [ 2] 1071 	jra term_exit 
      001A70                       1072 1$:	; got *|/|%
                                   1073 ;second factor
      0096A4 74 68 65         [ 4] 1074 	call factor
      0096A7 72               [ 1] 1075 	tnz a 
      0096A8 65 2E            [ 1] 1076 	jrne 2$ 
      0096AA 0A 00 4E         [ 2] 1077 	jp syntax_error 
      001A79                       1078 2$: ; select operation 	
      0096AD 6F 20            [ 1] 1079 	ld a,(MULOP,sp) 
      0096AF 64 61            [ 1] 1080 	cp a,#TK_MULT 
      0096B1 74 61            [ 1] 1081 	jrne 3$
                                   1082 ; '*' operator
      0096B3 20 66 6F         [ 4] 1083 	call mul24 
      0096B6 75 6E            [ 2] 1084 	jra term01
      0096B8 64 2E            [ 1] 1085 3$: cp a,#TK_DIV 
      0096BA 0A 00            [ 1] 1086 	jrne 4$ 
                                   1087 ; '/' operator	
      0096BC 4E 6F 20         [ 4] 1088 	call div24 
      0096BF 70 72            [ 2] 1089 	jra term01 
      001A8D                       1090 4$: ; '%' operator
      0096C1 6F 67 72         [ 4] 1091 	call mod24
      0096C4 61 6D            [ 2] 1092 	jra term01 
      001A92                       1093 9$: 
      0096C6 20 69            [ 1] 1094 	ld a,#TK_INTGR
      001A94                       1095 term_exit:
      001A94                       1096 	_drop VSIZE 
      0096C8 6E 20            [ 2]    1     addw sp,#VSIZE 
      0096CA 52               [ 4] 1097 	ret 
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
      001A97                       1108 expression:
      001A97                       1109 	_vars VSIZE 
      0096CB 41 4D            [ 2]    1     sub sp,#VSIZE 
                                   1110 ; first term 	
      0096CD 21 0A 00         [ 4] 1111 	call term
      0096D0 46               [ 1] 1112 	tnz a 
      0096D1 69 6C            [ 1] 1113 	jreq 9$
      001A9F                       1114 1$:	; operator '+'|'-'
      0096D3 65 20 73         [ 4] 1115 	call next_token
      0096D6 79 73            [ 1] 1116 	ld (OP,sp),a 
      0096D8 74 65            [ 1] 1117 	and a,#TK_GRP_MASK
      0096DA 6D 20            [ 1] 1118 	cp a,#TK_GRP_ADD 
      0096DC 66 75            [ 1] 1119 	jreq 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      001AAA                       1120 	_unget_token 
      0096DE 6C 6C 2E 0A 00   [ 1]    1      mov in,in.saved  
      0096E3 42 75            [ 1] 1121 	ld a,#TK_INTGR
      0096E5 66 66            [ 2] 1122 	jra 9$ 
      001AB3                       1123 2$: ; second term 
      0096E7 65 72 20         [ 4] 1124 	call term
      0096EA 66               [ 1] 1125 	tnz a 
      0096EB 75 6C            [ 1] 1126 	jrne 3$
      0096ED 6C 0A 00         [ 2] 1127 	jp syntax_error
      001ABC                       1128 3$:
      0096F0 6F 76            [ 1] 1129 	ld a,(OP,sp)
      0096F2 65 72            [ 1] 1130 	cp a,#TK_PLUS 
      0096F4 66 6C            [ 1] 1131 	jrne 4$
                                   1132 ; '+' operator	
      0096F6 6F 77 0A         [ 4] 1133 	call add24
      0096F9 00 0A            [ 2] 1134 	jra 1$ 
      001AC7                       1135 4$:	; '-' operator 
      0096FB 72 75 6E         [ 4] 1136 	call sub24
      0096FE 20 74            [ 2] 1137 	jra 1$
      001ACC                       1138 9$:
      001ACC                       1139 	_drop VSIZE 
      009700 69 6D            [ 2]    1     addw sp,#VSIZE 
      009702 65               [ 4] 1140 	ret 
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
      001ACF                       1151 relation: 
      001ACF                       1152 	_vars VSIZE
      009703 20 65            [ 2]    1     sub sp,#VSIZE 
      009705 72 72 6F         [ 4] 1153 	call expression
      009708 72               [ 1] 1154 	tnz a 
      009709 2C 20            [ 1] 1155 	jreq 9$ 
                                   1156 ; expect rel_op or leave 
      00970B 00 0A 63         [ 4] 1157 	call next_token 
      00970E 6F 6D            [ 1] 1158 	ld (RELOP,sp),a 
      009710 70 69            [ 1] 1159 	and a,#TK_GRP_MASK
      009712 6C 65            [ 1] 1160 	cp a,#TK_GRP_RELOP 
      009714 20 65            [ 1] 1161 	jreq 2$
      009716 72 72            [ 1] 1162 	ld a,#TK_INTGR 
      001AE4                       1163 	_unget_token 
      009718 6F 72 2C 20 00   [ 1]    1      mov in,in.saved  
      00971D 6C 61            [ 2] 1164 	jra 9$ 
      001AEB                       1165 2$:	; expect another expression
      00971F 73 74 20         [ 4] 1166 	call expression
      009722 74               [ 1] 1167 	tnz a 
      009723 6F 6B            [ 1] 1168 	jrne 3$
      009725 65 6E 20         [ 2] 1169 	jp syntax_error 
      001AF4                       1170 3$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      009728 69 64 3A         [ 4] 1171 	call cp24 
      001AF7                       1172 	_xpop  
      00972B 20 00            [ 1]    1     ld a,(y)
      00972D 93               [ 1]    2     ldw x,y 
      00972D A6 02            [ 2]    3     ldw x,(1,x)
      00972F 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00972F 72               [ 1] 1173 	tnz a 
      009730 0A 00            [ 1] 1174 	jrmi 4$
      009732 23 4C            [ 1] 1175 	jrne 5$
      009734 88 AE 96 FA      [ 1] 1176 	mov acc8,#2 ; i1==i2
      009738 CD 8A            [ 2] 1177 	jra 6$ 
      001B0B                       1178 4$: ; i1<i2
      00973A 21 84 AE 95      [ 1] 1179 	mov acc8,#4 
      00973E A0 72            [ 2] 1180 	jra 6$
      001B11                       1181 5$: ; i1>i2
      009740 5F 00 0E 48      [ 1] 1182 	mov acc8,#1  
      001B15                       1183 6$: ; 0=false, -1=true 
      009744 72               [ 1] 1184 	clrw x 
      009745 59 00 0E         [ 1] 1185 	ld a, acc8  
      009748 C7 00            [ 1] 1186 	and a,(RELOP,sp)
      00974A 0F 72            [ 1] 1187 	jreq 7$
      00974C BB               [ 2] 1188 	cplw x 
      00974D 00 0E            [ 1] 1189 	ld a,#255 
      001B20                       1190 7$:	_xpush 
      00974F FE CD 8A 21      [ 2]    1     subw y,#CELL_SIZE
      009753 CE 00            [ 1]    2     ld (y),a 
      009755 05 C6 00         [ 2]    3     ldw (1,y),x 
      009758 04 90            [ 1] 1191 	ld a,#TK_INTGR
      001B2B                       1192 9$: 
      001B2B                       1193 	_drop VSIZE
      00975A 5F 90            [ 2]    1     addw sp,#VSIZE 
      00975C 02               [ 4] 1194 	ret 
                                   1195 
                                   1196 ;-------------------------------------------
                                   1197 ;  AND factor:   relation | (condition)
                                   1198 ;  output:
                                   1199 ;     A      TK_INTGR|0
                                   1200 ;-------------------------------------------
      001B2E                       1201 and_factor:
      00975D CD 87 20         [ 4] 1202 	call next_token  
      009760 CE               [ 1] 1203 	tnz a 
      009761 00 05            [ 1] 1204 	jreq 8$ 
      009763 C6 00            [ 1] 1205 	cp a,#TK_LPAREN 
      009765 02 CD            [ 1] 1206 	jrne 1$
      009767 A0 46 AE         [ 4] 1207 	call condition
      00976A 97 1D            [ 1] 1208 	ld a,#TK_RPAREN 
      00976C CD 8A 21         [ 4] 1209 	call expect
      00976F C6               [ 4] 1210 	ret
      001B41                       1211 1$: _unget_token 
      009770 00 03 5F 97 72   [ 1]    1      mov in,in.saved  
      009775 BB 00 05         [ 4] 1212 	call relation 
      009778 F6               [ 4] 1213 8$: ret 
                                   1214 
                                   1215 
                                   1216 ;--------------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



                                   1217 ;  AND operator as priority over OR||XOR 
                                   1218 ;  format: relation | (condition) [AND relation|(condition)]*
                                   1219 ;          
                                   1220 ;  output:
                                   1221 ;     A     TK_INTGR|0
                                   1222 ;    xtack   value 
                                   1223 ;--------------------------------------------
      001B4A                       1224 and_cond:
      009779 5F 97 CD         [ 4] 1225 	call and_factor
      00977C 98               [ 1] 1226 	tnz a 
      00977D 83 20            [ 1] 1227 	jreq 9$  
      00977F 35 17 AE         [ 4] 1228 1$: call next_token 
      009780 4D               [ 1] 1229 	tnz a 
      009780 88 AE            [ 1] 1230 	jreq 6$ 
      009782 97 0C            [ 1] 1231 	cp a,#TK_AND 
      009784 CD 8A            [ 1] 1232 	jreq 3$
      001B5A                       1233 	_unget_token 
      009786 21 84 AE 95 A0   [ 1]    1      mov in,in.saved  
      00978B 72 5F            [ 2] 1234 	jra 6$ 
      00978D 00 0E 48         [ 4] 1235 3$:	call and_factor  
      009790 72               [ 1] 1236 	tnz a 
      009791 59 00            [ 1] 1237 	jrne 4$
      009793 0E C7 00         [ 2] 1238 	jp syntax_error 
      001B6A                       1239 4$:	
      001B6A                       1240 	_xpop 
      009796 0F 72            [ 1]    1     ld a,(y)
      009798 BB               [ 1]    2     ldw x,y 
      009799 00 0E            [ 2]    3     ldw x,(1,x)
      00979B FE CD 8A 21      [ 2]    4     addw y,#CELL_SIZE 
      00979F AE 16 68         [ 1] 1241 	ld acc24,a 
      0097A2 CD 8A 21         [ 2] 1242 	ldw acc16,x
      001B79                       1243 	_xpop 
      0097A5 A6 0D            [ 1]    1     ld a,(y)
      0097A7 CD               [ 1]    2     ldw x,y 
      0097A8 89 C4            [ 2]    3     ldw x,(1,x)
      0097AA CE 00 01 CD      [ 2]    4     addw y,#CELL_SIZE 
      0097AE 8A 8E A6         [ 1] 1244 	and a,acc24 
      0097B1 5E               [ 1] 1245 	rlwa x 
      0097B2 CD 89 C4         [ 1] 1246 	and a,acc16 
      0097B5 AE               [ 1] 1247 	rlwa x 
      0097B6 17 FF 94         [ 1] 1248 	and a,acc8 
      0097B9 02               [ 1] 1249 	rlwa x
      001B8E                       1250 	_xpush
      0097B9 CD 95 67 03      [ 2]    1     subw y,#CELL_SIZE
      0097BC 90 F7            [ 1]    2     ld (y),a 
      0097BC A6 0D CD         [ 2]    3     ldw (1,y),x 
      0097BF 89 C4            [ 2] 1251 	jra 1$  
      0097C1 A6 3E            [ 1] 1252 6$: ld a,#TK_INTGR 
      0097C3 CD               [ 4] 1253 9$:	ret 	 
                                   1254 
                                   1255 
                                   1256 ;--------------------------------------------
                                   1257 ; condition for IF and UNTIL 
                                   1258 ; operators: OR,XOR 
                                   1259 ; format:  and_cond [ OP and_cond ]* 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



                                   1260 ; output:
                                   1261 ;    A        INTGR|0 
                                   1262 ;    xstack   value 
                                   1263 ;--------------------------------------------
                           000001  1264 	ATMP=1
                           000002  1265 	OP=2
                           000002  1266 	VSIZE=2 
      001B9C                       1267 condition:
      001B9C                       1268 	_vars VSIZE 
      0097C4 89 C4            [ 2]    1     sub sp,#VSIZE 
      0097C6 CD 8B 26         [ 4] 1269 	call and_cond
      0097C9 72               [ 1] 1270 	tnz a 
      0097CA 5D 00            [ 1] 1271 	jreq 9$ 
      0097CC 04 27 ED         [ 4] 1272 1$:	call next_token 
      0097CF CD 91            [ 1] 1273 	cp a,#TK_OR 
      0097D1 5A 72            [ 1] 1274 	jreq 2$
      0097D3 5D 00            [ 1] 1275 	cp a,#TK_XOR
      0097D5 04 27            [ 1] 1276 	jreq 2$ 
      001BAF                       1277 	_unget_token 
      0097D7 E4 00 02 00 01   [ 1]    1      mov in,in.saved  
      0097D8 20 55            [ 2] 1278 	jra 8$ 
      0097D8 C6 00            [ 1] 1279 2$:	ld (OP,sp),a ; TK_OR|TK_XOR 
      0097DA 02 C1 00         [ 4] 1280 	call and_cond
      0097DD 04 2B            [ 1] 1281 	cp a,#TK_INTGR 
      0097DF 1D 03            [ 1] 1282 	jreq 3$
      0097E0 CC 16 AD         [ 2] 1283 	jp syntax_error 
      001BC2                       1284 3$:	 
      001BC2                       1285 	_xpop  ; rigth arg 
      0097E0 72 01            [ 1]    1     ld a,(y)
      0097E2 00               [ 1]    2     ldw x,y 
      0097E3 23 D7            [ 2]    3     ldw x,(1,x)
      0097E5 CE 00 05 72      [ 2]    4     addw y,#CELL_SIZE 
      0097E9 BB 00 01         [ 1] 1286 	ld acc24,a 
      0097EC C3 00 1E         [ 2] 1287 	ldw acc16,x 
      001BD1                       1288 	_xpop  ; left arg  
      0097EF 2A C8            [ 1]    1     ld a,(y)
      0097F1 CF               [ 1]    2     ldw x,y 
      0097F2 00 05            [ 2]    3     ldw x,(1,x)
      0097F4 E6 02 C7 00      [ 2]    4     addw y,#CELL_SIZE 
      0097F8 04 35            [ 1] 1289 	ld (ATMP,sp),a 
      0097FA 03 00            [ 1] 1290 	ld a,(OP,sp)
      0097FC 02 89            [ 1] 1291 	cp a,#TK_XOR 
      0097FD 27 10            [ 1] 1292 	jreq 5$ 
      001BE2                       1293 4$: ; A:X OR acc24   
      0097FD CD 98            [ 1] 1294 	ld a,(ATMP,sp)
      0097FF 2E A1 00         [ 1] 1295 	or a,acc24 
      009802 27               [ 1] 1296 	rlwa x 
      009803 DC A1 80         [ 1] 1297 	or a,acc16 
      009806 26               [ 1] 1298 	rlwa x 
      009807 06 CD 98         [ 1] 1299 	or a,acc8 
      00980A 47               [ 1] 1300 	rlwa x 
      00980B FD 20            [ 2] 1301 	jra 6$  
      001BF2                       1302 5$: ; A:X XOR acc24 
      00980D EF 01            [ 1] 1303 	ld a,(ATMP,sp)
      00980E C8 00 0C         [ 1] 1304 	xor a,acc24 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      00980E A1               [ 1] 1305 	rlwa x 
      00980F 85 26 05         [ 1] 1306 	xor a,acc16 
      009812 CD               [ 1] 1307 	rlwa x 
      009813 9D 01 20         [ 1] 1308 	xor a,acc8 
      009816 E6               [ 1] 1309 	rlwa x 
      009817                       1310 6$: _xpush
      009817 A1 05 26 05      [ 2]    1     subw y,#CELL_SIZE
      00981B CD 9C            [ 1]    2     ld (y),a 
      00981D FC 20 DD         [ 2]    3     ldw (1,y),x 
      009820 20 99            [ 2] 1311 	jra 1$ 
      009820 A1 0A            [ 1] 1312 8$:	ld a,#TK_INTGR 
      001C0D                       1313 9$:	_drop VSIZE 
      009822 27 D9            [ 2]    1     addw sp,#VSIZE 
      009824 A1               [ 4] 1314 	ret 
                                   1315 
                                   1316 
                                   1317 ;--------------------------------------------
                                   1318 ; BASIC: HEX 
                                   1319 ; select hexadecimal base for integer print
                                   1320 ;---------------------------------------------
      001C10                       1321 hex_base:
      009825 03 CD 98 54      [ 1] 1322 	mov base,#16 
      009829 20               [ 4] 1323 	ret 
                                   1324 
                                   1325 ;--------------------------------------------
                                   1326 ; BASIC: DEC 
                                   1327 ; select decimal base for integer print
                                   1328 ;---------------------------------------------
      001C15                       1329 dec_base:
      00982A D2 CC 97 2D      [ 1] 1330 	mov base,#10
      00982E 81               [ 4] 1331 	ret 
                                   1332 
                                   1333 ;------------------------
                                   1334 ; BASIC: FREE 
                                   1335 ; return free size in RAM 
                                   1336 ; output:
                                   1337 ;   A:x		size 
                                   1338 ;--------------------------
      001C1A                       1339 free:
      00982E C6 00            [ 2] 1340 	pushw y 
      009830 02               [ 1] 1341 	clr a 
      009831 C7 00 03         [ 2] 1342 	ldw x,#tib 
      009834 C0 00 04 27      [ 2] 1343 	ldw y,txtbgn 
      009838 0D A3 36 00      [ 2] 1344 	cpw y,#app_space
      009839 25 05            [ 1] 1345 	jrult 1$
      009839 CE 00 05         [ 2] 1346 	subw x,#free_ram 
      00983C 72 BB            [ 2] 1347 	jra 2$ 
      001C2F                       1348 1$:	
      00983E 00 01 F6 5C      [ 2] 1349 	subw x,txtend
      009842 72 5C            [ 2] 1350 2$:	popw y 
      009844 00               [ 4] 1351 	ret 
                                   1352 
                                   1353 ;------------------------------
                                   1354 ; BASIC: SIZE 
                                   1355 ; command that print 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



                                   1356 ; program start addres and size 
                                   1357 ;------------------------------
      001C36                       1358 cmd_size:
      009845 02 81 0A         [ 1] 1359 	push base 
      009847 AE 1E 93         [ 2] 1360 	ldw x,#PROG_ADDR 
      009847 FE DE B3         [ 4] 1361 	call puts 
      00984A BC 72 5C         [ 2] 1362 	ldw x,txtbgn     
      00984D 00 02 72 5C      [ 1] 1363 	mov base,#16 
      009851 00 02 81         [ 4] 1364 	call prt_i16
      009854 32 00 0A         [ 1] 1365 	pop base 
      009854 F6 27 03         [ 2] 1366 	ldw x,#PROG_SIZE 
      009857 5C 20 FA         [ 4] 1367 	call puts 
      00985A 5C 72 B0         [ 2] 1368 	ldw x,txtend 
      00985D 00 05 CF 00      [ 2] 1369 	subw x,txtbgn 
      009861 01 81 03         [ 4] 1370 	call prt_i16
      009863 AE 1E B6         [ 2] 1371 	ldw x,#STR_BYTES 
      009863 FE 72 5C         [ 4] 1372 	call puts  
      009866 00               [ 4] 1373 	ret 
                                   1374 
                                   1375 
                                   1376 ;------------------------
                                   1377 ; BASIC: UBOUND  
                                   1378 ; return array variable size 
                                   1379 ; and set 'array_size' variable 
                                   1380 ; output:
                                   1381 ;   A:X 	array_size
                                   1382 ;--------------------------
      001C63                       1383 ubound:
      009867 02 72 5C         [ 4] 1384 	call free 
      00986A 00 02            [ 1] 1385 	ld a,#CELL_SIZE 
      00986C 81               [ 4] 1386 	mul x,a 
      00986D CF 00 20         [ 2] 1387 	ldw array_size,x
      00986D F6               [ 1] 1388 	clr a 
      00986E EE               [ 4] 1389 	ret 
                                   1390 
                                   1391 ;-----------------------------
                                   1392 ; BASIC: LET var=expr 
                                   1393 ; variable assignement 
                                   1394 ; output:
                                   1395 ;   A 		TK_NONE 
                                   1396 ;-----------------------------
      001C6E                       1397 let::
      00986F 01 72 5C         [ 4] 1398 	call next_token 
      009872 00 02            [ 1] 1399 	cp a,#TK_VAR 
      009874 72 5C            [ 1] 1400 	jreq let_var
      009876 00 02            [ 1] 1401 	cp a,#TK_ARRAY 
      009878 72 5C            [ 1] 1402 	jreq  let_array
      00987A 00 02 81         [ 2] 1403 	jp syntax_error
      00987D                       1404 let_array:
      00987D F6 72 5C         [ 4] 1405 	call get_array_element
      009880 00 02            [ 2] 1406 	jra let_eval 
      001C81                       1407 let_var:
      009882 81 17 E3         [ 4] 1408 	call get_addr
      009883                       1409 let_eval:
      009883 72 5F 00         [ 2] 1410 	ldw ptr16,x  ; variable address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      009886 0D CF 00         [ 4] 1411 	call next_token 
      009889 0E A6            [ 1] 1412 	cp a,#TK_EQUAL
      00988B 10 C1            [ 1] 1413 	jreq 1$
      00988D 00 0B 27         [ 2] 1414 	jp syntax_error
      001C91                       1415 1$:	
      009890 09 72 0F         [ 4] 1416 	call condition   
      009893 00 0E            [ 1] 1417 	cp a,#TK_INTGR 
      009895 04 72            [ 1] 1418 	jreq 2$
      009897 53 00 0D         [ 2] 1419 	jp syntax_error
      00989A                       1420 2$:	
      001C9B                       1421 	_xpop ; value 
      00989A A6 FF            [ 1]    1     ld a,(y)
      00989C CD               [ 1]    2     ldw x,y 
      00989D 98 C0            [ 2]    3     ldw x,(1,x)
      00989F CD 92 04 88      [ 2]    4     addw y,#CELL_SIZE 
      001CA4                       1422 3$:
      0098A3 CD 8A 21 84      [ 4] 1423 	ld [ptr16],a
      0098A7 81 5C 00 1A      [ 1] 1424 	inc ptr8  
      0098A8 72 CF 00 19      [ 5] 1425 	ldw [ptr16],x 
      0098A8 90               [ 4] 1426 	ret 
                                   1427 
                                   1428 
                                   1429 ;--------------------------
                                   1430 ; return constant value 
                                   1431 ; from it's record address
                                   1432 ; input:
                                   1433 ;	X	*const record 
                                   1434 ; output:
                                   1435 ;   A:X   const  value
                                   1436 ;--------------------------
      001CB1                       1437 get_const_value: ; -- i 
      0098A9 F6               [ 1] 1438 	ld a,(x) ; record size 
      0098AA 93 EE            [ 1] 1439 	sub a,#3 ; * value 
      0098AC 01               [ 1] 1440 	push a 
      0098AD 72 A9            [ 1] 1441 	push #0 
      0098AF 00 03 C7         [ 2] 1442 	addw x,(1,sp)
      0098B2 00               [ 1] 1443 	ld a,(x)
      0098B3 0D CF            [ 2] 1444 	ldw x,(1,x)
      001CBD                       1445 	_drop 2
      0098B5 00 0E            [ 2]    1     addw sp,#2 
      0098B7 CD               [ 4] 1446 	ret 
                                   1447 
                                   1448 
                                   1449 ;--------------------------
                                   1450 ; list constants in EEPROM 
                                   1451 ; call when using LIST \C 
                                   1452 ;-------------------------
                           000001  1453 	COUNT=1
                           000003  1454 	YTEMP=3
                           000004  1455 	VSIZE=4 
      001CC0                       1456 list_const:
      0098B8 98 9A            [ 2] 1457 	pushw y 
      001CC2                       1458 	_vars 4 
      0098BA A6 20            [ 2]    1     sub sp,#4 
      0098BC CD               [ 1] 1459 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      0098BD 89 C4            [ 2] 1460 	ldw (COUNT,sp),x  
      0098BF 81 AE 40 00      [ 2] 1461 	ldw Y,#EEPROM_BASE 
      0098C0 90 C3 00 24      [ 2] 1462 1$:	cpw y,free_eeprom 
      0098C0 52 04            [ 1] 1463 	jruge 9$
      0098C2 0F 02            [ 2] 1464     ldw (YTEMP,sp),y 
      0098C4 0F               [ 1] 1465 	ldw x,y
      0098C5 01               [ 1] 1466 	incw x 
      0098C6 4D 27 11         [ 4] 1467 	call puts  
      0098C9 C6 00            [ 1] 1468 	ld a,#'= 
      0098CB 0B A1 0A         [ 4] 1469 	call putc 
      0098CE 26 0A            [ 2] 1470 	ldw x,(YTEMP,sp)
      0098D0 72 0F 00         [ 4] 1471 	call get_const_value 
      0098D3 0D 05 03         [ 1] 1472 	ld acc24,a 
      0098D6 01 CD 82         [ 2] 1473 	ldw acc16,x 
      0098D9 8D 18 1A         [ 4] 1474 	call prt_acc24
      0098DA A6 0D            [ 1] 1475 	ld a,#CR 
      0098DA AE 16 68         [ 4] 1476 	call putc 
      0098DD 1C 00            [ 2] 1477 	ldw x,(COUNT,sp)
      0098DF 50               [ 1] 1478 	incw x 
      0098E0 5A 7F            [ 2] 1479 	ldw (COUNT,sp),x 
      0098E2 72 5F 00 0D      [ 1] 1480 	clr acc16 
      0098E2 C6 00            [ 2] 1481 	ldw y,(YTEMP,sp)
      0098E4 0B CD            [ 1] 1482 	ld a,(y)
      0098E6 83 89 AB         [ 1] 1483 	ld acc8,a
      0098E9 30 A1 3A 2B      [ 2] 1484 	addw y,acc16 
      0098ED 02 AB            [ 2] 1485 	jra 1$ 
      001D06                       1486 9$:	
      0098EF 07 01            [ 2] 1487 	ldw x,(COUNT,sp)
      0098F0 CD 18 03         [ 4] 1488 	call prt_i16 
      0098F0 5A F7 0C         [ 2] 1489 	ldw x,#CONST_COUNT 
      0098F3 02 C6 00         [ 4] 1490 	call puts 
      001D11                       1491 	_drop VSIZE 
      0098F6 0D CA            [ 2]    1     addw sp,#VSIZE 
      0098F8 00 0E            [ 2] 1492 	popw y 
      0098FA CA               [ 4] 1493 	ret 
                                   1494 
      0098FB 00 0F 26 E3 C6 00 0B  1495 CONST_COUNT: .asciz " constants in EEPROM\n"
             A1 10 27 08 7B 01 27
             0A A6 2D 20 02 4D 0A
             00
                                   1496 
                                   1497 
                                   1498 ;--------------------------
                                   1499 ; BASIC: EEFREE 
                                   1500 ; eeprom_free 
                                   1501 ; search end of data  
                                   1502 ; in EEPROM 
                                   1503 ; input:
                                   1504 ;    none 
                                   1505 ; output:
                                   1506 ;    A:X     address free
                                   1507 ;-------------------------
      00990E                       1508 func_eefree:
      00990E A6 24 5A         [ 2] 1509 	ldw x,#EEPROM_BASE 
      009911 F7 0C 02 0E      [ 1] 1510 1$:	mov acc8,#8 ; count 8 consecutive zeros
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      009914 A3 47 F8         [ 2] 1511     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      009914 7B 02            [ 1] 1512 	jruge 8$ ; no free space 
      009916 5B               [ 1] 1513 2$: ld a,(x)
      009917 04 81            [ 1] 1514 	jrne 3$
      009919 5C               [ 1] 1515 	incw x 
      009919 A1 61 2A 01      [ 1] 1516 	dec acc8 
      00991D 81 A1            [ 1] 1517 	jrne 2$
      00991F 7A 22 FB         [ 2] 1518 	subw x,#8 
      009922 A0 20            [ 2] 1519 	jra 9$  
      009924 81               [ 1] 1520 3$: ld a,(x)
      009925 5C               [ 1] 1521 	incw x
      009925 89               [ 1] 1522 	tnz a  
      009926 52 03            [ 1] 1523 	jrne 3$
      009928 72               [ 2] 1524 	decw x   
      009929 5F 00            [ 2] 1525 	jra 1$ 
      00992B 0D               [ 1] 1526 8$: clrw x ; no free space 
      00992C 72               [ 1] 1527 9$: clr a 
      00992D 5F 00 0E         [ 2] 1528 	ldw free_eeprom,x ; save in system variable 
      009930 72               [ 4] 1529 	ret 
                                   1530 
                           000005  1531 CONST_REC_XTRA_BYTES=5 
                                   1532 ;--------------------------
                                   1533 ; search constant name 
                                   1534 ; format of constant record  
                                   1535 ;   .byte record length 
                                   1536 ;         = strlen(name)+5 
                                   1537 ;   .asciz name (variable length)
                                   1538 ;   .int24 value (3 bytes )
                                   1539 ; a constant record use 7+ bytes
                                   1540 ; constants are saved in EEPROM  
                                   1541 ; input:
                                   1542 ;    X     *name
                                   1543 ; output:
                                   1544 ;    X     address|0
                                   1545 ; use:
                                   1546 ;   A,Y, acc16 
                                   1547 ;-------------------------
                           000001  1548 	NAMEPTR=1 ; target name pointer 
                           000003  1549 	EEPTR=3   ; walking pointer in EEPROM
                           000005  1550 	RECLEN=5  ; record length of target
                           000005  1551 	VSIZE=5
      001D55                       1552 search_const:
      009931 5F 00            [ 2] 1553 	pushw y 
      001D57                       1554 	_vars VSIZE
      009933 0F 0F            [ 2]    1     sub sp,#VSIZE 
      009935 01 A6 0A 6B      [ 1] 1555 	clr acc16 
      009939 02 F6 27         [ 4] 1556 	call strlen 
      00993C 47 A1            [ 1] 1557 	add a,#CONST_REC_XTRA_BYTES
      00993E 2D 26            [ 1] 1558 	ld (RECLEN,sp),a    
      009940 04 03            [ 2] 1559 	ldw (NAMEPTR,sp),x
      009942 01 20 08 A1      [ 2] 1560 	ldw y,#EEPROM_BASE 
      009946 24 26            [ 2] 1561 1$:	ldw x,(NAMEPTR,sp)
      009948 06 A6            [ 2] 1562 	ldw (EEPTR,sp),y
      00994A 10 6B 02 5C      [ 2] 1563 	cpw y, free_eeprom 
      00994E F6 1A            [ 1] 1564 	jruge 7$ ; no match found 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      00994F 90 F6            [ 1] 1565 	ld a,(y)
      00994F A1 61            [ 1] 1566 	cp a,(RECLEN,sp)
      009951 2B 02            [ 1] 1567 	jrne 2$ 
      009953 A0 20            [ 1] 1568 	incw y 
      009955 A1 30 2B         [ 4] 1569 	call strcmp
      009958 2B A0            [ 1] 1570 	jrne 8$ ; match found 
      001D81                       1571 2$: ; skip this one 	
      00995A 30 A1            [ 2] 1572 	ldW Y,(EEPTR,sp)
      00995C 0A 2B            [ 1] 1573 	ld a,(y)
      00995E 06 A0 07         [ 1] 1574 	ld acc8,a 
      009961 11 02 2A 1F      [ 2] 1575 	addw y,acc16 
      009965 6B 03            [ 2] 1576 	jra 1$  
      001D8E                       1577 7$: ; no match found 
      009967 7B 02            [ 1] 1578 	clr (EEPTR,sp)
      009969 CD 82            [ 1] 1579 	clr (EEPTR+1,sp)
      001D92                       1580 8$: ; match found 
      00996B AA 7B            [ 2] 1581 	ldw x,(EEPTR,sp) ; record address 
      001D94                       1582 9$:	_DROP VSIZE
      00996D 03 CB            [ 2]    1     addw sp,#VSIZE 
      00996F 00 0F            [ 2] 1583 	 popw y 
      009971 C7               [ 4] 1584 	 ret 
                                   1585 
                                   1586 
                                   1587 ;--------------------------------------------
                                   1588 ; BASIC: CONST name=value [, name=value]*
                                   1589 ; define constant(s) saved in EEPROM
                                   1590 ;--------------------------------------------
                           000001  1591 	CNAME=1 
                           000003  1592 	BUFPTR=3
                           000005  1593 	RECLEN=5
                           000006  1594 	UPDATE=6
                           000007  1595 	YSAVE=7
                           000008  1596 	VSIZE=8 
      001D99                       1597 cmd_const:
      009972 00 0F            [ 2] 1598 	pushw y 
      001D9B                       1599 	_vars VSIZE 
      009974 4F C9            [ 2]    1     sub sp,#VSIZE 
      009976 00 0E            [ 1] 1600 	clr (UPDATE,sp)
      009978 C7 00 0E         [ 4] 1601 	call next_token 
      00997B 4F C9            [ 1] 1602 	cp a,#TK_CHAR 
      00997D 00 0D            [ 1] 1603 	jrne 0$
      00997F C7 00 0D         [ 4] 1604 	call get_char 
      009982 20 C9            [ 1] 1605 	and a,#0xDF 
      009984 0D 01            [ 1] 1606 	cp a,#'U 
      009986 27 03            [ 1] 1607 	jrne 1$
      009988 CD 82            [ 1] 1608 	cpl (UPDATE,sp)
      00998A 8D 07            [ 2] 1609 	jra const_loop 
      00998B A1 03            [ 1] 1610 0$: cp a,#TK_LABEL 
      00998B 5B 03            [ 1] 1611 	jreq cloop_1
      00998D 85 81 AD         [ 2] 1612 1$: jp syntax_error
      00998F                       1613 const_loop: 
      00998F 52 05            [ 1] 1614 	ld a,#TK_LABEL 
      009991 17 04 5A         [ 4] 1615 	call expect  
      009993                       1616 cloop_1: 
      009993 1F 02            [ 2] 1617 	ldw (CNAME,sp),x ; *const_name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      009995 F6 A4 0F         [ 4] 1618 	call skip_string
      009998 6B 01            [ 2] 1619 	ldw x,(CNAME,sp)
      00999A 16 04 5C         [ 4] 1620 	call strlen  
      00999D AB 05            [ 1] 1621 	add a,#CONST_REC_XTRA_BYTES 
      00999D 90 F6            [ 1] 1622 	ld (RECLEN,sp),a 
                                   1623 ; copy name in buffer  
      00999F 27 1B            [ 2] 1624 	ldw y,(CNAME,sp) 
      0099A1 0D 01 27         [ 2] 1625 	ldw x,#tib  
      0099A4 0A F1            [ 1] 1626 	ld a,(RECLEN,sp)
      0099A6 26               [ 1] 1627 	ld (x),a 
      0099A7 07               [ 1] 1628 	incw x  
      0099A8 90 5C 5C         [ 4] 1629 	call strcpy 
      0099AB 0A 01            [ 2] 1630 	ldw (BUFPTR,sp),x 
                                   1631 ; x not updated by strcpy 
                                   1632 ; BUFPTR must be incremented 
                                   1633 ; to point after name 
      0099AD 20               [ 1] 1634 	clrw x 
      0099AE EE 05            [ 1] 1635 	ld a,(RECLEN,sp)
      0099AF A0 04            [ 1] 1636 	sub a,#CONST_REC_XTRA_BYTES-1
      0099AF 1E               [ 1] 1637 	ld xl,a  
      0099B0 02 1D 00         [ 2] 1638 	addw x,(BUFPTR,sp)
      0099B3 02 4B            [ 2] 1639 	ldw (BUFPTR,sp),x 
      0099B5 00 FE            [ 1] 1640 	ld a,#TK_EQUAL 
      0099B7 84 27 1D         [ 4] 1641 	call expect 
      0099BA 20 D7            [ 2] 1642 	ldw y,(YSAVE,sp) ; restore xstack pointer 
      0099BC CD 1A 97         [ 4] 1643 	call expression 
      0099BC 1E 02            [ 1] 1644 	cp a,#TK_INTGR 
      0099BE F6 6B            [ 1] 1645 	jreq 5$ 
      0099C0 01 A4 0F         [ 2] 1646 	jp syntax_error 
      001DF7                       1647 5$:	_xpop 
      0099C3 4C C7            [ 1]    1     ld a,(y)
      0099C5 00               [ 1]    2     ldw x,y 
      0099C6 0F 72            [ 2]    3     ldw x,(1,x)
      0099C8 5F 00 0E 72      [ 2]    4     addw y,#CELL_SIZE 
      0099CC BB 00            [ 2] 1648 	ldw (YSAVE,sp),y ; save xtack pointer 
      0099CE 0E FE            [ 2] 1649 	ldw y,(BUFPTR,sp)
      0099D0 7B 01            [ 1] 1650 	ld (y),a 
      0099D2 A4 F0 4E         [ 2] 1651 	ldw (1,y),x 
                                   1652 ; record completed in buffer 
                                   1653 ; check if constant already exist 
                                   1654 ; if exist and \U option then update  
      0099D5 AB 80 00 18      [ 1] 1655 	clr farptr 
      0099D7 1E 01            [ 2] 1656 	ldw x,(CNAME,sp)
      0099D7 5B 05 81         [ 4] 1657 	call search_const 
      0099DA 5D               [ 2] 1658 	tnzw x 
      0099DA 88 CD            [ 1] 1659 	jreq 6$ ; new constant  
      0099DC 98 2E            [ 1] 1660 	tnz (UPDATE,sp)
      0099DE 11 01            [ 1] 1661 	jreq 8$ 
      0099E0 27 03            [ 2] 1662 	jra 7$	
      001E1B                       1663 6$:	
      0099E2 CC 97 2D         [ 2] 1664 	ldw x,free_eeprom  
      001E1E                       1665 7$:	
      0099E5 84 81 19         [ 2] 1666 	ldw farptr+1,x 
      0099E7 AE 16 68         [ 2] 1667 	ldw x,#tib 
      0099E7 A6 06            [ 1] 1668 	ld a,(RECLEN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      0099E9 CD 99 DA         [ 4] 1669 	call write_nbytes
      0099EC 0D 06            [ 1] 1670 	tnz (UPDATE,sp)
      0099EC 4B 00            [ 1] 1671 	jrne 8$ ; not a new constant, don't update free_eeprom
                                   1672 ; update free_eeprom 
      0099EE CD               [ 1] 1673 	clrw x 
      0099EF 9C 1C            [ 1] 1674 	ld a,(RECLEN,sp)
      0099F1 4D               [ 1] 1675 	ld xl,a 
      0099F2 27 12 0C 01      [ 2] 1676 	addw x,free_eeprom 
      0099F6 CD 98 2E         [ 2] 1677 	ldw free_eeprom,x
      001E38                       1678 8$: ; check for next constant 
      0099F9 A1 08 27         [ 4] 1679 	call next_token 
      0099FC F1 A1            [ 1] 1680 	cp a,#TK_COMMA 
      0099FE 07 27            [ 1] 1681 	jrne 9$ ; no other constant 
      009A00 05 55 00         [ 2] 1682 	jp const_loop 
      001E42                       1683 9$: 
      001E42                       1684 	_unget_token    
      009A03 03 00 02 84 81   [ 1]    1      mov in,in.saved  
      009A08                       1685 10$: 
      001E47                       1686 	_drop VSIZE 
      009A08 CD 99            [ 2]    1     addw sp,#VSIZE 
      009A0A E7 A1            [ 2] 1687 	popw y ; restore xstack pointer 
      009A0C 01               [ 4] 1688 	ret 
                                   1689 
                                   1690 
                                   1691 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1692 ; return program size 
                                   1693 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001E4C                       1694 prog_size:
      009A0D 27 03 CC         [ 2] 1695 	ldw x,txtend 
      009A10 97 2D 90 F6      [ 2] 1696 	subw x,txtbgn 
      009A14 93               [ 4] 1697 	ret 
                                   1698 
                                   1699 ;----------------------------
                                   1700 ; print program information 
                                   1701 ;---------------------------
      001E54                       1702 program_info: 
      009A15 EE 01 72         [ 2] 1703 	ldw x,#PROG_ADDR 
      009A18 A9 00 03         [ 4] 1704 	call puts 
      009A1B C3 00 21         [ 2] 1705 	ldw x,txtbgn 
      009A1E 23 05 A6 0A      [ 1] 1706 	mov base,#16 
      009A22 CC 97 2F         [ 4] 1707 	call prt_i16
      009A25 5D 27 F8 89      [ 1] 1708 	mov base,#10  
      009A29 58 72 FB         [ 2] 1709 	ldw x,#PROG_SIZE
      009A2C 01 1F 01         [ 4] 1710 	call puts 
      009A2F AE 16 68         [ 4] 1711 	call prog_size 
      009A32 72 F0 01         [ 4] 1712 	call prt_i16 
      009A35 5B 02 81         [ 2] 1713 	ldw x,#STR_BYTES 
      009A38 CD 09 A1         [ 4] 1714 	call puts
      009A38 52 01 0F         [ 2] 1715 	ldw x,txtbgn
      009A3B 01 CD 98         [ 2] 1716 	cpw x,#app 
      009A3E 2E 4D            [ 1] 1717 	jrult 2$
      009A40 26 03 CC         [ 2] 1718 	ldw x,#FLASH_MEM 
      009A43 9A D1            [ 2] 1719 	jra 3$
      009A45 A1 10 27         [ 2] 1720 2$: ldw x,#RAM_MEM 	 
      009A48 06 A1 11         [ 4] 1721 3$:	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      009A4B 26 05            [ 1] 1722 	ld a,#CR 
      009A4D 03 01 44         [ 4] 1723 	call putc
      009A4F 81               [ 4] 1724 	ret 
                                   1725 
      009A4F CD 98 2E 67 72 61 6D  1726 PROG_ADDR: .asciz "program address: "
             20 61 64 64 72 65 73
             73 3A 20 00
      009A52 2C 20 70 72 6F 67 72  1727 PROG_SIZE: .asciz ", program size: "
             61 6D 20 73 69 7A 65
             3A 20 00
      009A52 4D 26 03 CC 97 2D 00  1728 STR_BYTES: .asciz " bytes" 
      009A58 20 69 6E 20 46 4C 41  1729 FLASH_MEM: .asciz " in FLASH memory" 
             53 48 20 6D 65 6D 6F
             72 79 00
      009A58 A1 81 26 06 CD 98 47  1730 RAM_MEM:   .asciz " in RAM memory" 
             FD 20 5D 6D 6F 72 79
             00
                                   1731 
                                   1732 
                                   1733 ;----------------------------
                                   1734 ; BASIC: LIST [[start][,end]]
                                   1735 ; list program lines 
                                   1736 ; form start to end 
                                   1737 ; if empty argument list then 
                                   1738 ; list all.
                                   1739 ;----------------------------
                           000001  1740 	FIRST=1
                           000003  1741 	LAST=3 
                           000005  1742 	LN_PTR=5
                           000006  1743 	VSIZE=6 
      009A62                       1744 list:
      009A62 A1 84 26 05 CD   [ 2] 1745 	btjf flags,#FRUN,0$
      009A67 98 6D            [ 1] 1746 	ld a,#ERR_CMD_ONLY
      009A69 20 54 AF         [ 2] 1747 	jp tb_error
      009A6B                       1748 0$:	 
      009A6B A1 05 26         [ 4] 1749 	call next_token 
      009A6E 05 CD            [ 1] 1750 	cp a,#TK_CHAR 
      009A70 9A 08            [ 1] 1751 	jrne 2$
      009A72 20 07 FD         [ 4] 1752 	call get_char 
      009A74 A4 DF            [ 1] 1753 	and a,#0xDF 
      009A74 A1 85            [ 1] 1754 	cp a,#'C 
      009A76 26 08            [ 1] 1755 	jrne 1$
      009A78 CD 98 63         [ 4] 1756 	call list_const
      009A7B 81               [ 4] 1757 	ret 
      009A7B F6 EE 01         [ 2] 1758 1$: jp syntax_error 
      001EFE                       1759 2$:	_unget_token 
      009A7E 20 3F 02 00 01   [ 1]    1      mov in,in.saved  
      009A80 CD 1E 4C         [ 4] 1760 	call prog_size 
      009A80 A1 03            [ 1] 1761 	jrugt 3$
      009A82 26               [ 4] 1762 	ret 
      001F09                       1763 3$: _vars VSIZE
      009A83 10 89            [ 2]    1     sub sp,#VSIZE 
      009A85 CD 98 54         [ 2] 1764 	ldw x,txtbgn 
      009A88 85 CD            [ 2] 1765 	ldw (LN_PTR,sp),x 
      009A8A 9D               [ 2] 1766 	ldw x,(x) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      009A8B D5 5D            [ 2] 1767 	ldw (FIRST,sp),x ; list from first line 
      009A8D 27 28 CD         [ 2] 1768 	ldw x,#MAX_LINENO ; biggest line number 
      009A90 9D 31            [ 2] 1769 	ldw (LAST,sp),x 
      009A92 20 2B 6C         [ 4] 1770 	call arg_list
      009A94 4D               [ 1] 1771 	tnz a
      009A94 A1 82            [ 1] 1772 	jreq list_loop 
      009A96 26 08            [ 1] 1773 	cp a,#2 
      009A98 CD 98            [ 1] 1774 	jreq 4$
      009A9A 47 FD            [ 1] 1775 	cp a,#1 
      009A9C 5F 02            [ 1] 1776 	jreq first_line 
      009A9E 20 1F AD         [ 2] 1777 	jp syntax_error 
      009AA0 85               [ 2] 1778 4$:	popw x 
      009AA0 A1 06            [ 2] 1779 	ldw (LAST+2,sp),x 
      001F2C                       1780 first_line:
      009AA2 26               [ 2] 1781 	popw x
      009AA3 13 CD            [ 2] 1782 	ldw (FIRST,sp),x 
      001F2F                       1783 lines_skip:
      009AA5 9B 17 A6         [ 2] 1784 	ldw x,txtbgn
      009AA8 07 CD            [ 2] 1785 2$:	ldw (LN_PTR,sp),x 
      009AAA 99 DA 90         [ 2] 1786 	cpw x,txtend 
      009AAD F6 93            [ 1] 1787 	jrpl list_exit 
      009AAF EE               [ 2] 1788 	ldw x,(x) ;line# 
      009AB0 01 72            [ 2] 1789 	cpw x,(FIRST,sp)
      009AB2 A9 00            [ 1] 1790 	jrpl list_loop 
      009AB4 03 20            [ 2] 1791 	ldw x,(LN_PTR,sp) 
      009AB6 08 02            [ 1] 1792 	ld a,(2,x)
      009AB7 C7 00 0E         [ 1] 1793 	ld acc8,a 
      009AB7 55 00 03 00      [ 1] 1794 	clr acc16 
      009ABB 02 4F 20 12      [ 2] 1795 	addw x,acc16
      009ABF 20 E3            [ 2] 1796 	jra 2$ 
                                   1797 ; print loop
      001F4F                       1798 list_loop:
      009ABF 0D 01            [ 2] 1799 	ldw x,(LN_PTR,sp)
      009AC1 27 03            [ 1] 1800 	ld a,(2,x) 
      009AC3 CD 82 85         [ 4] 1801 	call prt_basic_line
      009AC6 1E 05            [ 2] 1802 	ldw x,(LN_PTR,sp)
      009AC6 72 A2            [ 1] 1803 	ld a,(2,x)
      009AC8 00 03 90         [ 1] 1804 	ld acc8,a 
      009ACB F7 90 EF 01      [ 1] 1805 	clr acc16 
      009ACF A6 84 00 0D      [ 2] 1806 	addw x,acc16
      009AD1 C3 00 1D         [ 2] 1807 	cpw x,txtend 
      009AD1 5B 01            [ 1] 1808 	jrpl list_exit
      009AD3 81 05            [ 2] 1809 	ldw (LN_PTR,sp),x
      009AD4 FE               [ 2] 1810 	ldw x,(x)
      009AD4 52 01            [ 2] 1811 	cpw x,(LAST,sp)  
      009AD6 CD 9A            [ 1] 1812 	jrslt list_loop
      001F71                       1813 list_exit:
      009AD8 38 4D 27 38 01   [ 1] 1814 	mov in,count 
      009ADC AE 16 B8         [ 2] 1815 	ldw x,#pad 
      009ADC CD 98 2E         [ 2] 1816 	ldw basicptr,x 
      001F7C                       1817 	_drop VSIZE 
      009ADF 6B 01            [ 2]    1     addw sp,#VSIZE 
      009AE1 A4 30 A1         [ 4] 1818 	call program_info 
      009AE4 20               [ 4] 1819 	ret
                                   1820 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



                                   1821 
                                   1822 ;--------------------------
                                   1823 ; BASIC: EDIT 
                                   1824 ;  copy program in FLASH 
                                   1825 ;  to RAM for edition 
                                   1826 ;-------------------------
      001F82                       1827 edit:
      009AE5 27 09 A6         [ 4] 1828 	call qsign 
      009AE8 84 55            [ 1] 1829 	jreq 1$ 
      009AEA 00 03 00         [ 2] 1830 	ldw x,#NOT_SAVED 
      009AED 02 20 24         [ 4] 1831 	call puts 
      009AF0 81               [ 4] 1832 	ret 
      001F8E                       1833 1$: 
      009AF0 CD 9A 38 4D      [ 2] 1834 	ldw y,#app_sign ; source address 
      009AF4 26 03 CC         [ 2] 1835     ldw x,app_size  
      009AF7 97 2D 04         [ 2] 1836 	addw x,#4 
      009AF9 CF 00 0D         [ 2] 1837 	ldw acc16,x  ; bytes to copy 
      009AF9 7B 01 A1         [ 2] 1838 	ldw x,#rsign ; destination address 
      009AFC 20 26 05         [ 4] 1839 	call move  
      009AFF CD 82 DD         [ 2] 1840 	ldw x,#free_ram 
      009B02 20 D8 A1         [ 2] 1841 	ldw txtbgn,x 
      009B05 21 26 05 CD      [ 2] 1842 	addw x,rsize  
      009B09 83 A7 20         [ 2] 1843 	ldw txtend,x 
      009B0C CF               [ 4] 1844 	ret 
                                   1845 
      009B0D 4E 6F 20 61 70 70 6C  1846 NOT_SAVED: .asciz "No application saved.\n"
             69 63 61 74 69 6F 6E
             20 73 61 76 65 64 2E
             0A 00
                                   1847 
                                   1848 
                                   1849 ;--------------------------
                                   1850 ; decompile line from token list
                                   1851 ; and print it. 
                                   1852 ; input:
                                   1853 ;   A       stop at this position 
                                   1854 ;   X 		pointer at line
                                   1855 ; output:
                                   1856 ;   none 
                                   1857 ;--------------------------	
      001FC6                       1858 prt_basic_line:
      009B0D CD 84            [ 2] 1859 	pushw y 
      009B0F 55 20 CA         [ 1] 1860 	ld count,a 
      009B12 E6 02            [ 1] 1861 	ld a,(2,x)
      009B12 A6 84 03         [ 1] 1862 	cp a,count 
      009B14 2A 03            [ 1] 1863 	jrpl 1$ 
      009B14 5B 01 81         [ 1] 1864 	ld count,a 
      009B17 CF 00 04         [ 2] 1865 1$:	ldw basicptr,x 
      009B17 52 01 CD 9A      [ 2] 1866 	ldw y,#tib  
      009B1B D4 4D 27         [ 4] 1867 	call decompile 
      009B1E 2D 09 A1         [ 4] 1868 	call puts 
      009B1F A6 0D            [ 1] 1869 	ld a,#CR 
      009B1F CD 98 2E         [ 4] 1870 	call putc 
      009B22 6B 01            [ 2] 1871 	popw y 
      009B24 A4               [ 4] 1872 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



                                   1873 
                                   1874 
                                   1875 ;---------------------------------
                                   1876 ; BASIC: PRINT|? arg_list 
                                   1877 ; print values from argument list
                                   1878 ;----------------------------------
                           000001  1879 	CCOMMA=1
                           000001  1880 	VSIZE=1
      001FEA                       1881 print:
      001FEA                       1882 	_vars VSIZE 
      009B25 30 A1            [ 2]    1     sub sp,#VSIZE 
      001FEC                       1883 reset_comma:
      009B27 10 27            [ 1] 1884 	clr (CCOMMA,sp)
      001FEE                       1885 prt_loop:
      009B29 09 55 00         [ 4] 1886 	call next_token
      009B2C 03 00            [ 1] 1887 	cp a,#CMD_END 
      009B2E 02 A6            [ 1] 1888 	jrult 0$
      009B30 84 20            [ 1] 1889 	cp a,#TK_COLON 
      009B32 19 04            [ 1] 1890 	jreq 0$
      009B33 A1 80            [ 1] 1891 	cp a,#TK_CMD
      009B33 CD 9A            [ 1] 1892 	jrne 10$
      001FFD                       1893 0$:
      001FFD                       1894 	_unget_token 
      009B35 D4 4D 26 03 CC   [ 1]    1      mov in,in.saved  
      009B3A 97 2D            [ 2] 1895 	jra 8$ 
      009B3C                       1896 10$:	
      009B3C 7B 01            [ 1] 1897 	cp a,#TK_QSTR
      009B3E A1 10            [ 1] 1898 	jreq 1$
      009B40 26 05            [ 1] 1899 	cp a,#TK_CHAR 
      009B42 CD 81            [ 1] 1900 	jreq 2$ 
      009B44 EA 20            [ 1] 1901 	cp a,#TK_CFUNC 
      009B46 D8 1F            [ 1] 1902 	jreq 3$
      009B47 A1 08            [ 1] 1903 	cp a,#TK_COMMA 
      009B47 CD 82            [ 1] 1904 	jreq 4$
      009B49 07 20            [ 1] 1905 	cp a,#TK_SHARP 
      009B4B D3 24            [ 1] 1906 	jreq 5$
      009B4C 20 37            [ 2] 1907 	jra 7$ 
      00201A                       1908 1$:	; print string 
      009B4C 5B 01 81         [ 4] 1909 	call puts
      009B4F 5C               [ 1] 1910 	incw x
      009B4F 52 01 CD 9B      [ 2] 1911 	subw x,basicptr 
      009B53 17 4D 27         [ 2] 1912 	ldw in.w,x  
      009B56 54 CD            [ 2] 1913 	jra reset_comma
      002027                       1914 2$:	; print character 
      009B58 98 2E 6B         [ 4] 1915 	call get_char 
      009B5B 01 A4 30         [ 4] 1916 	call putc 
      009B5E A1 30            [ 2] 1917 	jra reset_comma 
      00202F                       1918 3$: ; print character function value  	
      009B60 27 09 A6         [ 4] 1919 	call get_code_addr 
      009B63 84               [ 4] 1920 	call (x)
      009B64 55 00 03         [ 4] 1921 	call putc
      009B67 00 02            [ 2] 1922 	jra reset_comma 
      002038                       1923 4$: ; set comma state 
      009B69 20 40            [ 1] 1924 	cpl (CCOMMA,sp)
      009B6B 20 B2            [ 2] 1925 	jra prt_loop   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      00203C                       1926 5$: ; # character must be followed by an integer   
      009B6B CD 9B 17         [ 4] 1927 	call next_token
      009B6E 4D 26            [ 1] 1928 	cp a,#TK_INTGR 
      009B70 03 CC            [ 1] 1929 	jreq 6$
      009B72 97 2D AD         [ 2] 1930 	jp syntax_error 
      009B74                       1931 6$: ; set tab width
      009B74 CD 82 24         [ 4] 1932 	call get_int24 
      009B77 90               [ 1] 1933 	ld a,xl 
      009B78 F6 93            [ 1] 1934 	and a,#15 
      009B7A EE 01 72         [ 1] 1935 	ld tab_width,a 
      009B7D A9 00            [ 2] 1936 	jra reset_comma 
      002051                       1937 7$:	
      002051                       1938 	_unget_token 
      009B7F 03 4D 2B 08 26   [ 1]    1      mov in,in.saved  
      009B84 0C 35 02         [ 4] 1939 	call condition
      009B87 00               [ 1] 1940 	tnz a 
      009B88 0F 20            [ 1] 1941 	jreq 8$    
      009B8A 0A 18 28         [ 4] 1942     call print_top
      009B8B 20 8B            [ 2] 1943 	jra reset_comma 
      002061                       1944 8$:
      009B8B 35 04            [ 1] 1945 	tnz (CCOMMA,sp)
      009B8D 00 0F            [ 1] 1946 	jrne 9$
      009B8F 20 04            [ 1] 1947 	ld a,#CR 
      009B91 CD 09 44         [ 4] 1948     call putc 
      00206A                       1949 9$:	_drop VSIZE 
      009B91 35 01            [ 2]    1     addw sp,#VSIZE 
      009B93 00               [ 4] 1950 	ret 
                                   1951 
                                   1952 ;----------------------
                                   1953 ; 'save_context' and
                                   1954 ; 'rest_context' must be 
                                   1955 ; called at the same 
                                   1956 ; call stack depth 
                                   1957 ; i.e. SP must have the 
                                   1958 ; save value at  
                                   1959 ; entry point of both 
                                   1960 ; routine. 
                                   1961 ;---------------------
                           000004  1962 	CTXT_SIZE=4 ; size of saved data 
                                   1963 ;--------------------
                                   1964 ; save current BASIC
                                   1965 ; interpreter context 
                                   1966 ; on stack 
                                   1967 ;--------------------
      00206D                       1968 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00206D                       1969 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      00206D                       1970 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      00206D                       1971 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      00206D                       1972 save_context:
      009B94 0F 00 04         [ 2] 1973 	ldw x,basicptr 
      009B95 1F 03            [ 2] 1974 	ldw (BPTR,sp),x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      009B95 5F C6 00         [ 1] 1975 	ld a,in 
      009B98 0F 14            [ 1] 1976 	ld (IN,sp),a
      009B9A 01 27 03         [ 1] 1977 	ld a,count 
      009B9D 53 A6            [ 1] 1978 	ld (CNT,sp),a  
      009B9F FF               [ 4] 1979 	ret
                                   1980 
                                   1981 ;-----------------------
                                   1982 ; restore previously saved 
                                   1983 ; BASIC interpreter context 
                                   1984 ; from stack 
                                   1985 ;-------------------------
      00207D                       1986 rest_context:
      009BA0 72 A2            [ 2] 1987 	ldw x,(BPTR,sp)
      009BA2 00 03 90         [ 2] 1988 	ldw basicptr,x 
      009BA5 F7 90            [ 1] 1989 	ld a,(IN,sp)
      009BA7 EF 01 A6         [ 1] 1990 	ld in,a
      009BAA 84 06            [ 1] 1991 	ld a,(CNT,sp)
      009BAB C7 00 03         [ 1] 1992 	ld count,a  
      009BAB 5B               [ 4] 1993 	ret
                                   1994 
                                   1995 
                                   1996 
                                   1997 ;------------------------------------------
                                   1998 ; BASIC: INPUT [string]var[,[string]var]
                                   1999 ; input value in variables 
                                   2000 ; [string] optionally can be used as prompt 
                                   2001 ;-----------------------------------------
                           000001  2002 	CX_BPTR=1
                           000003  2003 	CX_IN=3
                           000004  2004 	CX_CNT=4
                           000005  2005 	SKIP=5
                           000005  2006 	VSIZE=5
      00208D                       2007 input_var:
      009BAC 01 81            [ 2] 2008 	pushw y 
      009BAE                       2009 	_vars VSIZE 
      009BAE CD 98            [ 2]    1     sub sp,#VSIZE 
      002091                       2010 input_loop:
      009BB0 2E 4D            [ 1] 2011 	clr (SKIP,sp)
      009BB2 27 15 A1         [ 4] 2012 	call next_token 
      009BB5 06 26            [ 1] 2013 	cp a,#TK_QSTR 
      009BB7 09 CD            [ 1] 2014 	jrne 1$ 
      009BB9 9C 1C A6         [ 4] 2015 	call puts 
      009BBC 07               [ 1] 2016 	incw x 
      009BBD CD 99 DA 81      [ 2] 2017 	subw x,basicptr 
      009BC1 55 00 03         [ 2] 2018 	ldw in.w,x 
      009BC4 00 02            [ 1] 2019 	cpl (SKIP,sp)
      009BC6 CD 9B 4F         [ 4] 2020 	call next_token 
      009BC9 81 85            [ 1] 2021 1$: cp a,#TK_VAR  
      009BCA 27 03            [ 1] 2022 	jreq 2$ 
      009BCA CD 9B AE         [ 2] 2023 	jp syntax_error
      009BCD 4D 27 4B         [ 4] 2024 2$:	call get_addr
      009BD0 CD 98 2E         [ 2] 2025 	ldw ptr16,x 
      009BD3 4D 27            [ 1] 2026 	tnz (SKIP,sp)
      009BD5 43 A1            [ 1] 2027 	jrne 21$ 
      009BD7 87 27 07         [ 4] 2028 	call var_name 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      009BDA 55 00 03         [ 4] 2029 	call putc   
      0020C1                       2030 21$:
      009BDD 00 02            [ 1] 2031 	ld a,#':
      009BDF 20 38 CD         [ 4] 2032 	call putc 
      009BE2 9B AE 4D         [ 4] 2033 	call save_context 
      009BE5 26 03 CC 97      [ 1] 2034 	clr count  
      009BE9 2D 0A A6         [ 4] 2035 	call readln 
      009BEA AE 16 68         [ 2] 2036 	ldw x,#tib 
      009BEA 90 F6 93         [ 1] 2037 	push count
      009BED EE 01            [ 1] 2038 	push #0 
      009BEF 72 A9 00         [ 2] 2039 	addw x,(1,sp)
      009BF2 03               [ 1] 2040 	incw x 
      0020DC                       2041 	_drop 2 
      009BF3 C7 00            [ 2]    1     addw sp,#2 
      009BF5 0D CF 00 0E      [ 1] 2042 	clr in 
      009BF9 90 F6 93         [ 4] 2043 	call get_token
      009BFC EE 01            [ 1] 2044 	cp a,#TK_INTGR
      009BFE 72 A9            [ 1] 2045 	jreq 3$ 
      009C00 00 03            [ 1] 2046 	cp a,#TK_MINUS
      009C02 C4 00            [ 1] 2047 	jrne 22$
      009C04 0D 02 C4         [ 4] 2048 	call get_token 
      009C07 00 0E            [ 1] 2049 	cp a,#TK_INTGR 
      009C09 02 C4            [ 1] 2050 	jreq 23$
      0020F4                       2051 22$:
      009C0B 00 0F 02         [ 4] 2052 	call rest_context 
      009C0E 72 A2 00         [ 2] 2053 	jp syntax_error
      0020FA                       2054 23$:
      009C11 03 90 F7         [ 4] 2055 	call neg_acc24	
      0020FD                       2056 3$: 
      009C14 90 EF 01         [ 1] 2057 	ld a,acc24 
      009C17 20 B7 A6         [ 2] 2058 	ldw x,acc16 
      009C1A 84 81 00 19      [ 4] 2059 	ld [ptr16],a
      009C1C 72 5C 00 1A      [ 1] 2060 	inc ptr8  
      009C1C 52 02 CD 9B      [ 5] 2061 	ldw [ptr16],x 
      009C20 CA 4D 27         [ 4] 2062 	call rest_context
      009C23 69 CD 98         [ 4] 2063 	call next_token 
      009C26 2E A1            [ 1] 2064 	cp a,#TK_COMMA
      009C28 88 27            [ 1] 2065 	jrne 4$ 
      009C2A 0B A1 89         [ 2] 2066 	jp input_loop
      00211C                       2067 4$:
      009C2D 27 07            [ 1] 2068 	cp a,#TK_NONE 
      009C2F 55 00            [ 1] 2069 	jreq input_exit  
      009C31 03 00            [ 1] 2070 	cp a,#TK_COLON 
      009C33 02 20            [ 1] 2071     jreq input_exit 
      009C35 55 6B 02         [ 2] 2072 	jp syntax_error 
      002127                       2073 input_exit:
      002127                       2074 	_drop VSIZE 
      009C38 CD 9B            [ 2]    1     addw sp,#VSIZE 
      009C3A CA A1            [ 2] 2075 	popw y 
      009C3C 84               [ 4] 2076 	ret 
                                   2077 
                                   2078 
                                   2079 ;---------------------
                                   2080 ; BASIC: REM | ' 
                                   2081 ; skip comment to end of line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



                                   2082 ;---------------------- 
      00212C                       2083 remark::
      009C3D 27 03 CC 97 2D   [ 1] 2084 	mov in,count 
      009C42 81               [ 4] 2085  	ret 
                                   2086 
                                   2087 
                                   2088 ;---------------------
                                   2089 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2090 ; read in loop 'addr'  
                                   2091 ; apply & 'mask' to value 
                                   2092 ; loop while result==0.  
                                   2093 ; 'xor_mask' is used to 
                                   2094 ; invert the wait logic.
                                   2095 ; i.e. loop while not 0.
                                   2096 ;---------------------
                           000001  2097 	XMASK=1 
                           000002  2098 	MASK=2
                           000003  2099 	ADDR=3
                           000004  2100 	VSIZE=4
      002132                       2101 wait: 
      002132                       2102 	_vars VSIZE
      009C42 90 F6            [ 2]    1     sub sp,#VSIZE 
      009C44 93 EE            [ 1] 2103 	clr (XMASK,sp) 
      009C46 01 72 A9         [ 4] 2104 	call arg_list 
      009C49 00 03            [ 1] 2105 	cp a,#2
      009C4B C7 00            [ 1] 2106 	jruge 0$
      009C4D 0D CF 00         [ 2] 2107 	jp syntax_error 
      009C50 0E 90            [ 1] 2108 0$:	cp a,#3
      009C52 F6 93            [ 1] 2109 	jrult 1$
      002144                       2110 	_xpop  ; xor mask 
      009C54 EE 01            [ 1]    1     ld a,(y)
      009C56 72               [ 1]    2     ldw x,y 
      009C57 A9 00            [ 2]    3     ldw x,(1,x)
      009C59 03 6B 01 7B      [ 2]    4     addw y,#CELL_SIZE 
      009C5D 02               [ 1] 2111 	ld a,xl 
      009C5E A1 89            [ 1] 2112 	ld (XMASK,sp),a 
      002150                       2113 1$: _xpop ; mask
      009C60 27 10            [ 1]    1     ld a,(y)
      009C62 93               [ 1]    2     ldw x,y 
      009C62 7B 01            [ 2]    3     ldw x,(1,x)
      009C64 CA 00 0D 02      [ 2]    4     addw y,#CELL_SIZE 
      009C68 CA               [ 1] 2114     ld a,xl  
      009C69 00 0E            [ 1] 2115 	ld (MASK,sp),a 
      00215C                       2116 	_xpop ; address 
      009C6B 02 CA            [ 1]    1     ld a,(y)
      009C6D 00               [ 1]    2     ldw x,y 
      009C6E 0F 02            [ 2]    3     ldw x,(1,x)
      009C70 20 0E 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C72 F6               [ 1] 2117 2$:	ld a,(x)
      009C72 7B 01            [ 1] 2118 	and a,(MASK,sp)
      009C74 C8 00            [ 1] 2119 	xor a,(XMASK,sp)
      009C76 0D 02            [ 1] 2120 	jreq 2$ 
      00216C                       2121 	_drop VSIZE 
      009C78 C8 00            [ 2]    1     addw sp,#VSIZE 
      009C7A 0E               [ 4] 2122 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



                                   2123 
                                   2124 ;---------------------
                                   2125 ; BASIC: BSET addr,mask
                                   2126 ; set bits at 'addr' corresponding 
                                   2127 ; to those of 'mask' that are at 1.
                                   2128 ; arguments:
                                   2129 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2130 ;   mask        mask|addr
                                   2131 ; output:
                                   2132 ;	none 
                                   2133 ;--------------------------
      00216F                       2134 bit_set:
      009C7B 02 C8 00         [ 4] 2135 	call arg_list 
      009C7E 0F 02            [ 1] 2136 	cp a,#2	 
      009C80 72 A2            [ 1] 2137 	jreq 1$ 
      009C82 00 03 90         [ 2] 2138 	jp syntax_error
      002179                       2139 1$: 
      002179                       2140 	_xpop ; mask 
      009C85 F7 90            [ 1]    1     ld a,(y)
      009C87 EF               [ 1]    2     ldw x,y 
      009C88 01 20            [ 2]    3     ldw x,(1,x)
      009C8A 99 A6 84 5B      [ 2]    4     addw y,#CELL_SIZE 
      009C8E 02               [ 1] 2141 	ld a,xl
      009C8F 81               [ 1] 2142 	push a  
      009C90                       2143 	_xpop ; addr  
      009C90 35 10            [ 1]    1     ld a,(y)
      009C92 00               [ 1]    2     ldw x,y 
      009C93 0B 81            [ 2]    3     ldw x,(1,x)
      009C95 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C95 35               [ 1] 2144 	pop a 
      009C96 0A               [ 1] 2145 	or a,(x)
      009C97 00               [ 1] 2146 	ld (x),a
      009C98 0B               [ 4] 2147 	ret 
                                   2148 
                                   2149 ;---------------------
                                   2150 ; BASIC: BRES addr,mask
                                   2151 ; reset bits at 'addr' corresponding 
                                   2152 ; to those of 'mask' that are at 1.
                                   2153 ; arguments:
                                   2154 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2155 ;   mask	    ~mask&*addr  
                                   2156 ; output:
                                   2157 ;	none 
                                   2158 ;--------------------------
      002191                       2159 bit_reset:
      009C99 81 19 6C         [ 4] 2160 	call arg_list 
      009C9A A1 02            [ 1] 2161 	cp a,#2  
      009C9A 90 89            [ 1] 2162 	jreq 1$ 
      009C9C 4F AE 16         [ 2] 2163 	jp syntax_error
      00219B                       2164 1$: 
      00219B                       2165 	_xpop ; mask 
      009C9F 68 90            [ 1]    1     ld a,(y)
      009CA1 CE               [ 1]    2     ldw x,y 
      009CA2 00 1C            [ 2]    3     ldw x,(1,x)
      009CA4 90 A3 B6 80      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      009CA8 25               [ 1] 2166 	ld a,xl 
      009CA9 05               [ 1] 2167 	cpl a
      009CAA 1D               [ 1] 2168 	push a  
      0021A7                       2169 	_xpop ; addr  
      009CAB 00 80            [ 1]    1     ld a,(y)
      009CAD 20               [ 1]    2     ldw x,y 
      009CAE 04 01            [ 2]    3     ldw x,(1,x)
      009CAF 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009CAF 72               [ 1] 2170 	pop a 
      009CB0 B0               [ 1] 2171 	and a,(x)
      009CB1 00               [ 1] 2172 	ld (x),a 
      009CB2 1E               [ 4] 2173 	ret 
                                   2174 
                                   2175 ;---------------------
                                   2176 ; BASIC: BTOGL addr,mask
                                   2177 ; toggle bits at 'addr' corresponding 
                                   2178 ; to those of 'mask' that are at 1.
                                   2179 ; arguments:
                                   2180 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2181 ;   mask	    mask^*addr  
                                   2182 ; output:
                                   2183 ;	none 
                                   2184 ;--------------------------
      0021B4                       2185 bit_toggle:
      009CB3 90 85 81         [ 4] 2186 	call arg_list 
      009CB6 A1 02            [ 1] 2187 	cp a,#2 
      009CB6 3B 00            [ 1] 2188 	jreq 1$ 
      009CB8 0B AE 9F         [ 2] 2189 	jp syntax_error
      0021BE                       2190 1$: _xpop ; mask 
      009CBB 13 CD            [ 1]    1     ld a,(y)
      009CBD 8A               [ 1]    2     ldw x,y 
      009CBE 21 CE            [ 2]    3     ldw x,(1,x)
      009CC0 00 1C 35 10      [ 2]    4     addw y,#CELL_SIZE 
      009CC4 00               [ 1] 2191 	ld a,xl
      009CC5 0B               [ 1] 2192 	push a 
      0021C9                       2193 	_xpop  ; addr  
      009CC6 CD 98            [ 1]    1     ld a,(y)
      009CC8 83               [ 1]    2     ldw x,y 
      009CC9 32 00            [ 2]    3     ldw x,(1,x)
      009CCB 0B AE 9F 25      [ 2]    4     addw y,#CELL_SIZE 
      009CCF CD               [ 1] 2194 	pop a 
      009CD0 8A               [ 1] 2195 	xor a,(x)
      009CD1 21               [ 1] 2196 	ld (x),a 
      009CD2 CE               [ 4] 2197 	ret 
                                   2198 
                                   2199 
                                   2200 ;---------------------
                                   2201 ; BASIC: BTEST(addr,bit)
                                   2202 ; return bit value at 'addr' 
                                   2203 ; bit is in range {0..7}.
                                   2204 ; arguments:
                                   2205 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2206 ;   bit 	    bit position {0..7}  
                                   2207 ; output:
                                   2208 ;	A:X       bit value  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



                                   2209 ;--------------------------
      0021D6                       2210 bit_test:
      009CD3 00 1E 72         [ 4] 2211 	call func_args 
      009CD6 B0 00            [ 1] 2212 	cp a,#2
      009CD8 1C CD            [ 1] 2213 	jreq 0$
      009CDA 98 83 AE         [ 2] 2214 	jp syntax_error
      0021E0                       2215 0$:	
      0021E0                       2216 	_xpop 
      009CDD 9F 36            [ 1]    1     ld a,(y)
      009CDF CD               [ 1]    2     ldw x,y 
      009CE0 8A 21            [ 2]    3     ldw x,(1,x)
      009CE2 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009CE3 9F               [ 1] 2217 	ld a,xl 
      009CE3 CD 9C            [ 1] 2218 	and a,#7
      009CE5 9A               [ 1] 2219 	push a   
      009CE6 A6 03            [ 1] 2220 	ld a,#1 
      009CE8 42 CF            [ 1] 2221 1$: tnz (1,sp)
      009CEA 00 21            [ 1] 2222 	jreq 2$
      009CEC 4F               [ 1] 2223 	sll a 
      009CED 81 01            [ 1] 2224 	dec (1,sp)
      009CEE 20 F7            [ 2] 2225 	jra 1$
      009CEE CD 98            [ 1] 2226 2$: ld (1,sp),a  
      0021FA                       2227 	_xpop ; address  
      009CF0 2E A1            [ 1]    1     ld a,(y)
      009CF2 85               [ 1]    2     ldw x,y 
      009CF3 27 0C            [ 2]    3     ldw x,(1,x)
      009CF5 A1 05 27 03      [ 2]    4     addw y,#CELL_SIZE 
      009CF9 CC               [ 1] 2228 	pop a 
      009CFA 97               [ 1] 2229 	and a,(x)
      009CFB 2D 02            [ 1] 2230 	jreq 3$
      009CFC A6 01            [ 1] 2231 	ld a,#1 
      009CFC CD               [ 1] 2232 3$:	clrw x 
      009CFD 9A               [ 1] 2233 	ld xl,a
      009CFE 08               [ 1] 2234 	clr a  
      009CFF 20               [ 4] 2235 	ret
                                   2236 
                                   2237 ;--------------------
                                   2238 ; BASIC: POKE addr,byte
                                   2239 ; put a byte at addr 
                                   2240 ;--------------------
      00220D                       2241 poke:
      009D00 03 19 6C         [ 4] 2242 	call arg_list 
      009D01 A1 02            [ 1] 2243 	cp a,#2
      009D01 CD 98            [ 1] 2244 	jreq 1$
      009D03 63 16 AD         [ 2] 2245 	jp syntax_error
      009D04                       2246 1$:	
      002217                       2247 	_xpop ; byte   
      009D04 CF 00            [ 1]    1     ld a,(y)
      009D06 1A               [ 1]    2     ldw x,y 
      009D07 CD 98            [ 2]    3     ldw x,(1,x)
      009D09 2E A1 32 27      [ 2]    4     addw y,#CELL_SIZE 
      009D0D 03               [ 1] 2248     ld a,xl 
      009D0E CC               [ 1] 2249 	push a 
      002222                       2250 	_xpop ; address 
      009D0F 97 2D            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      009D11 93               [ 1]    2     ldw x,y 
      009D11 CD 9C            [ 2]    3     ldw x,(1,x)
      009D13 1C A1 84 27      [ 2]    4     addw y,#CELL_SIZE 
      009D17 03               [ 1] 2251 	pop a 
      009D18 CC               [ 1] 2252 	ld (x),a 
      009D19 97               [ 4] 2253 	ret 
                                   2254 
                                   2255 ;-----------------------
                                   2256 ; BASIC: PEEK(addr)
                                   2257 ; get the byte at addr 
                                   2258 ; input:
                                   2259 ;	none 
                                   2260 ; output:
                                   2261 ;	X 		value 
                                   2262 ;-----------------------
      00222E                       2263 peek:
      009D1A 2D 19 67         [ 4] 2264 	call func_args
      009D1B A1 01            [ 1] 2265 	cp a,#1 
      009D1B 90 F6            [ 1] 2266 	jreq 1$
      009D1D 93 EE 01         [ 2] 2267 	jp syntax_error
      002238                       2268 1$: _xpop ; address  
      009D20 72 A9            [ 1]    1     ld a,(y)
      009D22 00               [ 1]    2     ldw x,y 
      009D23 03 01            [ 2]    3     ldw x,(1,x)
      009D24 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D24 72 C7 00         [ 1] 2269 	ld farptr,a 
      009D27 1A 72 5C         [ 2] 2270 	ldw ptr16,x 
      009D2A 00 1B 72 CF      [ 5] 2271 	ldf a,[farptr]
      009D2E 00               [ 1] 2272 	clrw x 
      009D2F 1A               [ 1] 2273 	ld xl,a 
      009D30 81               [ 1] 2274 	clr a 
      009D31 81               [ 4] 2275 	ret 
                                   2276 
                                   2277 ;---------------------------
                                   2278 ; BASIC IF expr : instructions
                                   2279 ; evaluate expr and if true 
                                   2280 ; execute instructions on same line. 
                                   2281 ;----------------------------
      00224F                       2282 if: 
      009D31 F6 A0 03         [ 4] 2283 	call condition  
      002252                       2284 	_xpop 
      009D34 88 4B            [ 1]    1     ld a,(y)
      009D36 00               [ 1]    2     ldw x,y 
      009D37 72 FB            [ 2]    3     ldw x,(1,x)
      009D39 01 F6 EE 01      [ 2]    4     addw y,#CELL_SIZE 
      009D3D 5B               [ 1] 2285 	tnz  a  
      009D3E 02 81            [ 1] 2286 	jrne 9$ 
                                   2287 ;skip to next line
      009D40 55 00 03 00 01   [ 1] 2288 	mov in,count
      002263                       2289 	_drop 2 
      009D40 90 89            [ 2]    1     addw sp,#2 
      009D42 52 04 5F         [ 2] 2290 	jp next_line
      009D45 1F               [ 4] 2291 9$:	ret 
                                   2292 
                                   2293 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



                                   2294 ; BASIC: FOR var=expr 
                                   2295 ; set variable to expression 
                                   2296 ; leave variable address 
                                   2297 ; on stack and set
                                   2298 ; FLOOP bit in 'flags'
                                   2299 ;-----------------
                           000001  2300 	RETL1=1 ; return address  
                           000003  2301 	FSTEP=3  ; variable increment int24
                           000006  2302 	LIMIT=6 ; loop limit, int24  
                           000009  2303 	CVAR=9   ; control variable 
                           00000B  2304 	INW=11   ;  in.w saved
                           00000D  2305 	BPTR=13 ; baseptr saved
                           00000D  2306 	VSIZE=13  
      002269                       2307 for: ; { -- var_addr }
      009D46 01               [ 2] 2308 	popw x ; call return address 
      00226A                       2309 	_vars VSIZE 
      009D47 90 AE            [ 2]    1     sub sp,#VSIZE 
      009D49 40               [ 2] 2310 	pushw x  ; RETL1 
      009D4A 00 90            [ 1] 2311 	ld a,#TK_VAR 
      009D4C C3 00 25         [ 4] 2312 	call expect
      009D4F 24 35 17         [ 4] 2313 	call get_addr
      009D52 03 93            [ 2] 2314 	ldw (CVAR,sp),x  ; control variable 
      009D54 5C CD 8A         [ 4] 2315 	call let_eval 
      009D57 21 A6 3D CD      [ 1] 2316 	bset flags,#FLOOP 
      009D5B 89 C4 1E         [ 4] 2317 	call next_token 
      009D5E 03 CD            [ 1] 2318 	cp a,#TK_CMD 
      009D60 9D 31            [ 1] 2319 	jreq 1$
      009D62 C7 00 0D         [ 2] 2320 	jp syntax_error
      002288                       2321 1$:  
      009D65 CF 00 0E         [ 4] 2322 	call get_code_addr
      009D68 CD 98 9A         [ 2] 2323 	cpw x,#to   
      009D6B A6 0D            [ 1] 2324 	jreq to
      009D6D CD 89 C4         [ 2] 2325 	jp syntax_error 
                                   2326 
                                   2327 ;-----------------------------------
                                   2328 ; BASIC: TO expr 
                                   2329 ; second part of FOR loop initilization
                                   2330 ; leave limit on stack and set 
                                   2331 ; FTO bit in 'flags'
                                   2332 ;-----------------------------------
      002293                       2333 to: ; { var_addr -- var_addr limit step }
      009D70 1E 01 5C 1F 01   [ 2] 2334 	btjt flags,#FLOOP,1$
      009D75 72 5F 00         [ 2] 2335 	jp syntax_error
      009D78 0E 16 03         [ 4] 2336 1$: call expression   
      009D7B 90 F6            [ 1] 2337 	cp a,#TK_INTGR 
      009D7D C7 00            [ 1] 2338 	jreq 2$ 
      009D7F 0F 72 B9         [ 2] 2339 	jp syntax_error
      0022A5                       2340 2$: _xpop
      009D82 00 0E            [ 1]    1     ld a,(y)
      009D84 20               [ 1]    2     ldw x,y 
      009D85 C5 01            [ 2]    3     ldw x,(1,x)
      009D86 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D86 1E 01            [ 1] 2341 	ld (LIMIT,sp),a 
      009D88 CD 98            [ 2] 2342 	ldw (LIMIT+1,sp),x
      009D8A 83 AE 9D         [ 4] 2343 	call next_token
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      009D8D 96 CD            [ 1] 2344 	cp a,#TK_NONE  
      009D8F 8A 21            [ 1] 2345 	jreq 4$ 
      009D91 5B 04            [ 1] 2346 	cp a,#TK_CMD
      009D93 90 85            [ 1] 2347 	jrne 3$
      009D95 81 20 63         [ 4] 2348 	call get_code_addr
      009D98 6F 6E 73         [ 2] 2349 	cpw x,#step 
      009D9B 74 61            [ 1] 2350 	jreq step
      0022C5                       2351 3$:	
      0022C5                       2352 	_unget_token   	 
      009D9D 6E 74 73 20 69   [ 1]    1      mov in,in.saved  
      0022CA                       2353 4$:	
      009DA2 6E 20            [ 1] 2354 	clr (FSTEP,sp) 
      009DA4 45 45 50         [ 2] 2355 	ldw x,#1   ; default step  
      009DA7 52 4F            [ 2] 2356 	ldw (FSTEP+1,sp),x 
      009DA9 4D 0A            [ 2] 2357 	jra store_loop_addr 
                                   2358 
                                   2359 
                                   2360 ;----------------------------------
                                   2361 ; BASIC: STEP expr 
                                   2362 ; optional third par of FOR loop
                                   2363 ; initialization. 	
                                   2364 ;------------------------------------
      0022D3                       2365 step: ; {var limit -- var limit step}
      009DAB 00 04 00 22 03   [ 2] 2366 	btjt flags,#FLOOP,1$
      009DAC CC 16 AD         [ 2] 2367 	jp syntax_error
      009DAC AE 40 00         [ 4] 2368 1$: call expression 
      009DAF 35 08            [ 1] 2369 	cp a,#TK_INTGR
      009DB1 00 0F            [ 1] 2370 	jreq 2$
      009DB3 A3 47 F8         [ 2] 2371 	jp syntax_error
      0022E5                       2372 2$:	
      0022E5                       2373 	_xpop 
      009DB6 24 17            [ 1]    1     ld a,(y)
      009DB8 F6               [ 1]    2     ldw x,y 
      009DB9 26 0C            [ 2]    3     ldw x,(1,x)
      009DBB 5C 72 5A 00      [ 2]    4     addw y,#CELL_SIZE 
      009DBF 0F 26            [ 1] 2374 	ld (FSTEP,sp),a 
      009DC1 F6 1D            [ 2] 2375 	ldw (FSTEP+1,sp),x ; step
                                   2376 ; if step < 0 decrement LIMIT 
      009DC3 00               [ 1] 2377 	tnz a
      009DC4 08 20            [ 1] 2378 	jrpl store_loop_addr 
      009DC6 09 F6            [ 1] 2379 	ld a,(LIMIT,sp)
      009DC8 5C 4D            [ 2] 2380 	ldw x,(LIMIT+1,sp)
      009DCA 26 FB 5A         [ 2] 2381 	subw x,#1 
      009DCD 20 E0            [ 1] 2382 	sbc a,#0 
      009DCF 5F 4F            [ 1] 2383 	ld (LIMIT,sp),a 
      009DD1 CF 00            [ 2] 2384 	ldw (LIMIT+1,sp),x 
                                   2385 ; leave loop back entry point on cstack 
                                   2386 ; cstack is 1 call deep from interpreter
      002302                       2387 store_loop_addr:
      009DD3 25 81 04         [ 2] 2388 	ldw x,basicptr
      009DD5 1F 0D            [ 2] 2389 	ldw (BPTR,sp),x 
      009DD5 90 89 52         [ 2] 2390 	ldw x,in.w 
      009DD8 05 72            [ 2] 2391 	ldw (INW,sp),x   
      009DDA 5F 00 0E CD      [ 1] 2392 	bres flags,#FLOOP 
      009DDE 94 71 AB 05      [ 1] 2393 	inc loop_depth  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      009DE2 6B               [ 4] 2394 	ret 
                                   2395 
                                   2396 ;--------------------------------
                                   2397 ; BASIC: NEXT var 
                                   2398 ; FOR loop control 
                                   2399 ; increment variable with step 
                                   2400 ; and compare with limit 
                                   2401 ; loop if threshold not crossed.
                                   2402 ; else stack. 
                                   2403 ; and decrement 'loop_depth' 
                                   2404 ;--------------------------------
      002315                       2405 next: ; {var limit step retl1 -- [var limit step ] }
      009DE3 05 1F 01 90      [ 1] 2406 	tnz loop_depth 
      009DE7 AE 40            [ 1] 2407 	jrne 1$ 
      009DE9 00 1E 01         [ 2] 2408 	jp syntax_error 
      00231E                       2409 1$: 
      009DEC 17 03            [ 1] 2410 	ld a,#TK_VAR 
      009DEE 90 C3 00         [ 4] 2411 	call expect
      009DF1 25 24 1A         [ 4] 2412 	call get_addr 
                                   2413 ; check for good variable after NEXT 	 
      009DF4 90 F6            [ 2] 2414 	cpw x,(CVAR,sp)
      009DF6 11 05            [ 1] 2415 	jreq 2$  
      009DF8 26 07 90         [ 2] 2416 	jp syntax_error ; not the good one 
      00232D                       2417 2$: 
      009DFB 5C CD 94         [ 2] 2418 	ldw ptr16,x 
                                   2419 	; increment variable 
      009DFE 7C               [ 1] 2420 	ld a,(x)
      009DFF 26 11            [ 2] 2421 	ldw x,(1,x)  ; get var value 
      009E01 72 FB 04         [ 2] 2422 	addw x,(FSTEP+1,sp) ; var+step 
      009E01 16 03            [ 1] 2423 	adc a,(FSTEP,sp)
      009E03 90 F6 C7 00      [ 4] 2424 	ld [ptr16],a
      009E07 0F 72 B9 00      [ 1] 2425 	inc ptr8  
      009E0B 0E 20 DC 19      [ 5] 2426 	ldw [ptr16],x 
      009E0E C7 00 0C         [ 1] 2427 	ld acc24,a 
      009E0E 0F 03 0F         [ 2] 2428 	ldw acc16,x 
      009E11 04 06            [ 1] 2429 	ld a,(LIMIT,sp)
      009E12 1E 07            [ 2] 2430 	ldw x,(LIMIT+1,sp)
      009E12 1E 03 5B 05      [ 2] 2431 	subw x,acc16 
      009E16 90 85 81         [ 1] 2432 	sbc a,acc24
      009E19 18 03            [ 1] 2433 	xor a,(FSTEP,sp)
      009E19 90 89            [ 1] 2434 	xor a,#0x80
      009E1B 52 08            [ 1] 2435 	jrmi loop_back  
      009E1D 0F 06            [ 2] 2436 	jra loop_done   
                                   2437 ; check sign of STEP  
      009E1F CD 98            [ 1] 2438 	ld a,(FSTEP,sp)
      009E21 2E A1            [ 1] 2439 	jrpl 4$
                                   2440 ;negative step
      009E23 04 26 0D         [ 1] 2441     ld a,acc8 
      009E26 CD 98            [ 1] 2442 	jrslt loop_back   
      009E28 7D A4            [ 2] 2443 	jra loop_done  
      002368                       2444 4$: ; positive step
      009E2A DF A1 55 26 08   [ 2] 2445 	btjt acc8,#7,loop_done 
      00236D                       2446 loop_back:
      009E2F 03 06            [ 2] 2447 	ldw x,(BPTR,sp)
      009E31 20 07 A1         [ 2] 2448 	ldw basicptr,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      009E34 03 27 08 CC 97   [ 2] 2449 	btjf flags,#FRUN,1$ 
      009E39 2D 02            [ 1] 2450 	ld a,(2,x)
      009E3A C7 00 03         [ 1] 2451 	ld count,a
      009E3A A6 03            [ 2] 2452 1$:	ldw x,(INW,sp)
      009E3C CD 99 DA         [ 2] 2453 	ldw in.w,x 
      009E3F 81               [ 4] 2454 	ret 
      002382                       2455 loop_done:
                                   2456 	; remove loop data from stack  
      009E3F 1F               [ 2] 2457 	popw x
      002383                       2458 	_drop VSIZE 
      009E40 01 CD            [ 2]    1     addw sp,#VSIZE 
      009E42 98 54 1E 01      [ 1] 2459 	dec loop_depth 
      009E46 CD               [ 2] 2460 	jp (x)
                                   2461 
                                   2462 ;----------------------------
                                   2463 ; called by goto/gosub
                                   2464 ; to get target line number 
                                   2465 ; output:
                                   2466 ;    x    line address 
                                   2467 ;---------------------------
      00238A                       2468 get_target_line:
      009E47 94 71 AB         [ 4] 2469 	call next_token  
      009E4A 05 6B            [ 1] 2470 	cp a,#TK_INTGR
      009E4C 05 16            [ 1] 2471 	jreq get_target_line_addr 
      009E4E 01 AE            [ 1] 2472 	cp a,#TK_LABEL 
      009E50 16 68            [ 1] 2473 	jreq look_target_symbol 
      009E52 7B 05 F7         [ 2] 2474 	jp syntax_error
                                   2475 ; the target is a line number 
                                   2476 ; search it. 
      002398                       2477 get_target_line_addr:
      009E55 5C CD            [ 2] 2478 	pushw y 
      009E57 94 8D 1F         [ 4] 2479 	call get_int24 ; line # 
      009E5A 03               [ 1] 2480 	clr a
      009E5B 5F 7B 05 A0      [ 2] 2481 	ldw y,basicptr 
      009E5F 04 97            [ 2] 2482 	ldw y,(y)
      009E61 72 FB            [ 2] 2483 	pushw y 
      009E63 03 1F            [ 2] 2484 	cpw x,(1,sp)
      0023A8                       2485 	_drop 2  
      009E65 03 A6            [ 2]    1     addw sp,#2 
      009E67 32 CD            [ 1] 2486 	jrult 11$
      009E69 99               [ 1] 2487 	inc a 
      0023AD                       2488 11$: ; scan program for this line# 	
      009E6A DA 16 07         [ 4] 2489 	call search_lineno  
      009E6D CD               [ 2] 2490 	tnzw x ; 0| line# address 
      009E6E 9B 17            [ 1] 2491 	jrne 2$ 
      009E70 A1 84            [ 1] 2492 	ld a,#ERR_NO_LINE 
      009E72 27 03 CC         [ 2] 2493 	jp tb_error 
      009E75 97 2D            [ 2] 2494 2$:	popw y  
      009E77 90               [ 4] 2495 	ret 
                                   2496 
                                   2497 ; the GOTO|GOSUB target is a symbol.
      0023BB                       2498 look_target_symbol:
      009E78 F6 93            [ 2] 2499 	pushw y 
      009E7A EE               [ 2] 2500 	pushw x 
      009E7B 01 72 A9 00      [ 1] 2501 	clr acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      009E7F 03 17 07 16      [ 2] 2502 	ldw y,txtbgn 
      009E83 03 90 F7         [ 1] 2503 1$:	ld a,(3,y) ; first TK_ID on line 
      009E86 90 EF            [ 1] 2504 	cp a,#TK_LABEL 
      009E88 01 72            [ 1] 2505 	jreq 3$ 
      009E8A 5F 00 19         [ 1] 2506 2$:	ld a,(2,y); line length 
      009E8D 1E 01 CD         [ 1] 2507 	ld acc8,a 
      009E90 9D D5 5D 27      [ 2] 2508 	addw y,acc16 ;point to next line 
      009E94 06 0D 06 27      [ 2] 2509 	cpw y,txtend 
      009E98 1F 20            [ 1] 2510 	jrult 1$
      009E9A 03 0A            [ 1] 2511 	ld a,#ERR_BAD_VALUE
      009E9B CC 16 AF         [ 2] 2512 	jp tb_error 
      0023E2                       2513 3$: ; found a TK_LABEL 
                                   2514 	; compare with GOTO|GOSUB target 
      009E9B CE 00            [ 2] 2515 	pushw y ; line address 
      009E9D 25 A9 00 04      [ 2] 2516 	addw y,#4 ; label string 
      009E9E 1E 03            [ 2] 2517 	ldw x,(3,sp) ; target string 
      009E9E CF 00 1A         [ 4] 2518 	call strcmp
      009EA1 AE 16            [ 1] 2519 	jrne 4$
      009EA3 68 7B            [ 2] 2520 	popw y 
      009EA5 05 CD            [ 2] 2521 	jra 2$ 
      0023F3                       2522 4$: ; target found 
      009EA7 89               [ 2] 2523 	popw x ;  address line target  
      0023F4                       2524 	_drop 2 ; target string 
      009EA8 05 0D            [ 2]    1     addw sp,#2 
      009EAA 06 26            [ 2] 2525 	popw y 
      009EAC 0B               [ 4] 2526 	ret
                                   2527 
                                   2528 
                                   2529 ;--------------------------------
                                   2530 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2531 ; selective goto or gosub 
                                   2532 ;--------------------------------
      0023F9                       2533 cmd_on:
      009EAD 5F 7B 05 97 72   [ 2] 2534 	btjt flags,#FRUN,0$ 
      009EB2 BB 00            [ 1] 2535 	ld a,#ERR_RUN_ONLY
      009EB4 25 CF 00         [ 2] 2536 	jp tb_error 
      009EB7 25 1A 97         [ 4] 2537 0$:	call expression 
      009EB8 A1 84            [ 1] 2538 	cp a,#TK_INTGR
      009EB8 CD 98            [ 1] 2539 	jreq 1$
      009EBA 2E A1 08         [ 2] 2540 	jp syntax_error
      00240D                       2541 1$: _xpop
      009EBD 26 03            [ 1]    1     ld a,(y)
      009EBF CC               [ 1]    2     ldw x,y 
      009EC0 9E 3A            [ 2]    3     ldw x,(1,x)
      009EC2 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
                                   2542 ; the selector is the element indice 
                                   2543 ; in the list of arguments. {1..#elements} 
      009EC2 55               [ 1] 2544 	ld a,xl ; keep only bits 7..0
      009EC3 00 03            [ 1] 2545 	jreq 9$ ; element # begin at 1. 
      009EC5 00               [ 1] 2546 	push a  ; selector  
      009EC6 02 17 AE         [ 4] 2547 	call next_token
      009EC7 A1 80            [ 1] 2548 	cp a,#TK_CMD 
      009EC7 5B 08            [ 1] 2549 	jreq 2$ 
      009EC9 90 85 81         [ 2] 2550 	jp syntax_error 
      009ECC CD 17 C7         [ 4] 2551 2$: call get_code_addr
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



                                   2552 ;; must be a GOTO or GOSUB 
      009ECC CE 00 1E         [ 2] 2553 	cpw x,#goto 
      009ECF 72 B0            [ 1] 2554 	jreq 4$
      009ED1 00 1C 81         [ 2] 2555 	cpw x,#gosub 
      009ED4 27 03            [ 1] 2556 	jreq 4$ 
      009ED4 AE 9F 13         [ 2] 2557 	jp syntax_error 
      002434                       2558 4$: 
      009ED7 CD               [ 1] 2559 	pop a 
      009ED8 8A               [ 2] 2560 	pushw x ; save routine address 	
      009ED9 21               [ 1] 2561 	push a  ; selector  
      002437                       2562 5$: ; skip elements in list until selector==0 
      009EDA CE 00            [ 1] 2563 	dec (1,sp)
      009EDC 1C 35            [ 1] 2564 	jreq 6$ 
                                   2565 ; can be a line# or a label 
      009EDE 10 00 0B         [ 4] 2566 	call next_token 
      009EE1 CD 98            [ 1] 2567 	cp a,#TK_INTGR 
      009EE3 83 35            [ 1] 2568 	jreq 52$
      009EE5 0A 00            [ 1] 2569 	cp a,#TK_LABEL 
      009EE7 0B AE            [ 1] 2570 	jreq 54$
      009EE9 9F 25 CD         [ 2] 2571 	jp syntax_error 
      002449                       2572 52$: ; got a line number 
      009EEC 8A 21 CD         [ 1] 2573 	ld a,in ; skip over int24 value 
      009EEF 9E CC            [ 1] 2574 	add a,#CELL_SIZE ; integer size  
      009EF1 CD 98 83         [ 1] 2575 	ld in,a 
      009EF4 AE 9F            [ 2] 2576 	jra 56$
      009EF6 36 CD 8A         [ 4] 2577 54$: call skip_string ; skip over label 	
      002456                       2578 56$: ; if another element comma present 
      009EF9 21 CE 00         [ 4] 2579 	call next_token
      009EFC 1C A3            [ 1] 2580 	cp a,#TK_COMMA 
      009EFE B6 84            [ 1] 2581 	jreq 5$ 
                                   2582 ; arg list exhausted, selector to big 
                                   2583 ; continue execution on next line 
      00245D                       2584 	_drop 3 ; drop selector and GOTO|GOSUB address 
      009F00 25 05            [ 2]    1     addw sp,#3 
      009F02 AE 9F            [ 2] 2585 	jra 9$
      002461                       2586 6$: ;at selected position  
      002461                       2587 	_drop 1 ; discard selector
      009F04 3D 20            [ 2]    1     addw sp,#1 
                                   2588 ; here only the routine address 
                                   2589 ; of GOTO|GOSUB is on stack 
      009F06 03 AE 9F         [ 4] 2590     call get_target_line
      009F09 4E CD 8A         [ 2] 2591 	ldw ptr16,x 	
      009F0C 21 A6 0D CD 89   [ 1] 2592 	mov in,count ; move to end of line  
      009F11 C4               [ 2] 2593 	popw x ; cmd address, GOTO||GOSUB 
      009F12 81 70 72         [ 2] 2594 	cpw x,#goto 
      009F15 6F 67            [ 1] 2595 	jrne 7$ 
      009F17 72 61 6D         [ 2] 2596 	ldw x,ptr16 
      009F1A 20 61            [ 2] 2597 	jra jp_to_target
      002479                       2598 7$: 
      009F1C 64 64            [ 2] 2599 	jra gosub_2 ; target in ptr16 
      00247B                       2600 9$: ; expr out of range skip to end of line
                                   2601     ; this will force a fall to next line  
      009F1E 72 65 73 73 3A   [ 1] 2602 	mov in,count
      002480                       2603 	_drop 2
      009F23 20 00            [ 2]    1     addw sp,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      009F25 2C 20 70         [ 2] 2604 	jp next_line  
                                   2605 
                                   2606 
                                   2607 ;------------------------
                                   2608 ; BASIC: GOTO line# 
                                   2609 ; jump to line# 
                                   2610 ; here cstack is 2 call deep from interpreter 
                                   2611 ;------------------------
      002485                       2612 goto:
      009F28 72 6F 67 72 61   [ 2] 2613 	btjt flags,#FRUN,goto_1  
      009F2D 6D 20            [ 1] 2614 	ld a,#ERR_RUN_ONLY
      009F2F 73 69 7A         [ 2] 2615 	jp tb_error 
      00248F                       2616 goto_1:
      009F32 65 3A 20         [ 4] 2617 	call get_target_line
      002492                       2618 jp_to_target:
      009F35 00 20 62         [ 2] 2619 	ldw basicptr,x 
      009F38 79 74            [ 1] 2620 	ld a,(2,x)
      009F3A 65 73 00         [ 1] 2621 	ld count,a 
      009F3D 20 69 6E 20      [ 1] 2622 	mov in,#3 
      009F41 46               [ 4] 2623 	ret 
                                   2624 
                                   2625 
                                   2626 ;--------------------
                                   2627 ; BASIC: GOSUB line#
                                   2628 ; basic subroutine call
                                   2629 ; actual line# and basicptr 
                                   2630 ; are saved on cstack
                                   2631 ; here cstack is 2 call deep from interpreter 
                                   2632 ;--------------------
                           000001  2633 	TARGET=1   ; target address 
                           000003  2634 	RET_ADDR=3 ; subroutine return address 
                           000005  2635 	RET_BPTR=5 ; basicptr return point 
                           000007  2636 	RET_INW=7  ; in.w return point 
                           000004  2637 	VSIZE=4  
      00249F                       2638 gosub:
      009F42 4C 41 53 48 20   [ 2] 2639 	btjt flags,#FRUN,gosub_1 
      009F47 6D 65            [ 1] 2640 	ld a,#ERR_RUN_ONLY
      009F49 6D 6F 72         [ 2] 2641 	jp tb_error 
      009F4C 79               [ 4] 2642 	ret 
      0024AA                       2643 gosub_1:
      009F4D 00 20 69         [ 4] 2644 	call get_target_line 
      009F50 6E 20 52         [ 2] 2645 	ldw ptr16,x 
      0024B0                       2646 gosub_2: 
      009F53 41               [ 2] 2647 	popw x 
      0024B1                       2648 	_vars VSIZE  
      009F54 4D 20            [ 2]    1     sub sp,#VSIZE 
      009F56 6D               [ 2] 2649 	pushw x ; RET_ADDR 
      009F57 65 6D 6F         [ 2] 2650 	ldw x,ptr16 
      009F5A 72               [ 2] 2651 	pushw x ; TARGET
                                   2652 ; save BASIC subroutine return point.   
      009F5B 79 00 04         [ 2] 2653 	ldw x,basicptr
      009F5D 1F 05            [ 2] 2654 	ldw (RET_BPTR,sp),x 
      009F5D 72 01 00         [ 2] 2655 	ldw x,in.w 
      009F60 23 05            [ 2] 2656 	ldw (RET_INW,sp),x
      009F62 A6               [ 2] 2657 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      009F63 07 CC            [ 2] 2658 	jra jp_to_target
                                   2659 
                                   2660 ;------------------------
                                   2661 ; BASIC: RETURN 
                                   2662 ; exit from BASIC subroutine 
                                   2663 ;------------------------
                           000003  2664 	RET_BPTR=3 ; basicptr return point 
                           000005  2665 	RET_INW=5  ; in.w return point 
                           000004  2666 	VSIZE=4  
      0024C5                       2667 return:
      009F65 97 2F 00 22 05   [ 2] 2668 	btjt flags,#FRUN,0$ 
      009F67 A6 06            [ 1] 2669 	ld a,#ERR_RUN_ONLY
      009F67 CD 98 2E         [ 2] 2670 	jp tb_error 
      0024CF                       2671 0$:	
      009F6A A1 04            [ 2] 2672 	ldw x,(RET_ADDR,sp) 
      009F6C 26 10 CD         [ 2] 2673 	ldw basicptr,x
      009F6F 98 7D            [ 1] 2674 	ld a,(2,x)
      009F71 A4 DF A1         [ 1] 2675 	ld count,a  
      009F74 43 26            [ 2] 2676 	ldw x,(RET_INW,sp)
      009F76 04 CD 9D         [ 2] 2677 	ldw in.w,x 
      009F79 40               [ 2] 2678 	popw x 
      0024DF                       2679 	_drop VSIZE 
      009F7A 81 CC            [ 2]    1     addw sp,#VSIZE 
      009F7C 97               [ 2] 2680 	pushw x
      009F7D 2D               [ 4] 2681 	ret  
                                   2682 
                                   2683 ;----------------------------------
                                   2684 ; BASIC: RUN
                                   2685 ; run BASIC program in RAM
                                   2686 ;----------------------------------- 
      0024E3                       2687 run: 
      009F7E 55 00 03 00 02   [ 2] 2688 	btjf flags,#FRUN,0$  
      009F83 CD               [ 1] 2689 	clr a 
      009F84 9E               [ 4] 2690 	ret
      0024EA                       2691 0$: 
      009F85 CC 22 01 81 52   [ 2] 2692 	btjf flags,#FBREAK,1$
      0024EF                       2693 	_drop 2 
      009F8A 06 CE            [ 2]    1     addw sp,#2 
      009F8C 00 1C 1F         [ 4] 2694 	call rest_context
      0024F4                       2695 	_drop CTXT_SIZE 
      009F8F 05 FE            [ 2]    1     addw sp,#CTXT_SIZE 
      009F91 1F 01 AE 7F      [ 1] 2696 	bres flags,#FBREAK 
      009F95 FF 1F 03 CD      [ 1] 2697 	bset flags,#FRUN 
      009F99 99 EC 4D         [ 2] 2698 	jp interpreter 
      009F9C 27 31 A1         [ 2] 2699 1$:	ldw x,txtbgn
      009F9F 02 27 07         [ 2] 2700 	cpw x,txtend 
      009FA2 A1 01            [ 1] 2701 	jrmi run_it 
      009FA4 27 06 CC         [ 2] 2702 	ldw x,#err_no_prog
      009FA7 97 2D 85         [ 4] 2703 	call puts 
      009FAA 1F 05 03 00 01   [ 1] 2704 	mov in,count
      009FAC 81               [ 4] 2705 	ret 
      002515                       2706 run_it:	 
      002515                       2707 	_drop 2 ; drop return address 
      009FAC 85 1F            [ 2]    1     addw sp,#2 
      002517                       2708 run_it_02: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      009FAE 01 1C 63         [ 4] 2709     call ubound 
      009FAF CD 14 61         [ 4] 2710 	call clear_vars 
                                   2711 ; clear data pointer 
      009FAF CE               [ 1] 2712 	clrw x 
      009FB0 00 1C 1F         [ 2] 2713 	ldw data_ptr,x 
      009FB3 05 C3 00 1E      [ 1] 2714 	clr data_ofs 
      009FB7 2A 38 FE 13      [ 1] 2715 	clr data_len 
                                   2716 ; initialize BASIC pointer 
      009FBB 01 2A 11         [ 2] 2717 	ldw x,txtbgn 
      009FBE 1E 05 E6         [ 2] 2718 	ldw basicptr,x 
      009FC1 02 C7            [ 1] 2719 	ld a,(2,x)
      009FC3 00 0F 72         [ 1] 2720 	ld count,a
      009FC6 5F 00 0E 72      [ 1] 2721 	mov in,#3	
      009FCA BB 00 0E 20      [ 1] 2722 	bset flags,#FRUN 
      009FCE E3 17 58         [ 2] 2723 	jp interpreter 
                                   2724 
                                   2725 
                                   2726 ;----------------------
                                   2727 ; BASIC: END
                                   2728 ; end running program
                                   2729 ;---------------------- 
      009FCF                       2730 cmd_end: 
                                   2731 ; clean stack 
      009FCF 1E 05 E6         [ 2] 2732 	ldw x,#STACK_EMPTY
      009FD2 02               [ 1] 2733 	ldw sp,x 
      009FD3 CD A0 46         [ 2] 2734 	jp warm_start
                                   2735 
                                   2736 ;---------------------------
                                   2737 ; BASIC: GET var 
                                   2738 ; receive a key in variable 
                                   2739 ; don't wait 
                                   2740 ;---------------------------
      002546                       2741 cmd_get:
      009FD6 1E 05 E6         [ 4] 2742 	call next_token 
      009FD9 02 C7            [ 1] 2743 	cp a,#TK_VAR 
      009FDB 00 0F            [ 1] 2744 	jreq 0$
      009FDD 72 5F 00         [ 2] 2745 	jp syntax_error 
      009FE0 0E 72 BB         [ 4] 2746 0$: call get_addr 
      009FE3 00 0E C3         [ 2] 2747 	ldw ptr16,x 
      009FE6 00 1E 2A         [ 4] 2748 	call qgetc 
      009FE9 07 1F            [ 1] 2749 	jreq 2$
      009FEB 05 FE 13         [ 4] 2750 	call getc  
      009FEE 03 2F DE 19      [ 4] 2751 2$: clr [ptr16]
      009FF1 72 5C 00 1A      [ 1] 2752 	inc ptr8 
      009FF1 55 00 04 00      [ 4] 2753 	clr [ptr16]
      009FF5 02 AE 16 B8      [ 1] 2754 	inc ptr8 
      009FF9 CF 00 05 5B      [ 4] 2755 	ld [ptr16],a 
      009FFD 06               [ 4] 2756 	ret 
                                   2757 
                                   2758 
                                   2759 ;-----------------
                                   2760 ; 1 Khz beep 
                                   2761 ;-----------------
      002573                       2762 beep_1khz:: 
      009FFE CD 9E            [ 2] 2763 	pushw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      00A000 D4 81 64         [ 2] 2764 	ldw x,#100
      00A002 90 AE 03 E8      [ 2] 2765 	ldw y,#1000
      00A002 CD A8            [ 2] 2766 	jra beep
                                   2767 
                                   2768 ;-----------------------
                                   2769 ; BASIC: TONE expr1,expr2
                                   2770 ; used TIMER2 channel 1
                                   2771 ; to produce a tone 
                                   2772 ; arguments:
                                   2773 ;    expr1   frequency 
                                   2774 ;    expr2   duration msec.
                                   2775 ;---------------------------
      00257E                       2776 tone:
      00A004 2E 27            [ 2] 2777 	pushw y 
      00A006 07 AE A0         [ 4] 2778 	call arg_list 
      00A009 2F CD            [ 1] 2779 	cp a,#2 
      00A00B 8A 21            [ 1] 2780 	jreq 1$
      00A00D 81 16 AD         [ 2] 2781 	jp syntax_error 
      00A00E                       2782 1$: 
      00258A                       2783 	_xpop 
      00A00E 90 AE            [ 1]    1     ld a,(y)
      00A010 B6               [ 1]    2     ldw x,y 
      00A011 80 CE            [ 2]    3     ldw x,(1,x)
      00A013 B6 82 1C 00      [ 2]    4     addw y,#CELL_SIZE 
      00A017 04               [ 2] 2784 	pushw x ; duration 
      002594                       2785 	_xpop ; frequency
      00A018 CF 00            [ 1]    1     ld a,(y)
      00A01A 0E               [ 1]    2     ldw x,y 
      00A01B AE 00            [ 2]    3     ldw x,(1,x)
      00A01D 7C CD 94 9D      [ 2]    4     addw y,#CELL_SIZE 
      00A021 AE 00            [ 1] 2786 	ldw y,x ; frequency 
      00A023 80               [ 2] 2787 	popw x  ; duration 
      0025A0                       2788 beep:  
      00A024 CF               [ 2] 2789 	pushw x 
      00A025 00 1C 72         [ 2] 2790 	ldw x,#TIM2_CLK_FREQ
      00A028 BB               [ 2] 2791 	divw x,y ; cntr=Fclk/freq 
                                   2792 ; round to nearest integer 
      00A029 00 7E CF 00      [ 2] 2793 	cpw y,#TIM2_CLK_FREQ/2
      00A02D 1E 81            [ 1] 2794 	jrmi 2$
      00A02F 4E               [ 1] 2795 	incw x 
      0025AC                       2796 2$:	 
      00A030 6F               [ 1] 2797 	ld a,xh 
      00A031 20 61 70         [ 1] 2798 	ld TIM2_ARRH,a 
      00A034 70               [ 1] 2799 	ld a,xl 
      00A035 6C 69 63         [ 1] 2800 	ld TIM2_ARRL,a 
                                   2801 ; 50% duty cycle 
      00A038 61               [ 1] 2802 	ccf 
      00A039 74               [ 2] 2803 	rrcw x 
      00A03A 69               [ 1] 2804 	ld a,xh 
      00A03B 6F 6E 20         [ 1] 2805 	ld TIM2_CCR1H,a 
      00A03E 73               [ 1] 2806 	ld a,xl
      00A03F 61 76 65         [ 1] 2807 	ld TIM2_CCR1L,a
      00A042 64 2E 0A 00      [ 1] 2808 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A046 72 10 53 00      [ 1] 2809 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A046 90 89 C7 00      [ 1] 2810 	bset TIM2_EGR,#TIM2_EGR_UG
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00A04A 04               [ 2] 2811 	popw x 
      00A04B E6 02 C1         [ 4] 2812 	call pause02
      00A04E 00 04 2A 03      [ 1] 2813 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A052 C7 00 04 CF      [ 1] 2814 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A056 00 05            [ 2] 2815 	popw y 
      00A058 90               [ 4] 2816 	ret 
                                   2817 
                                   2818 ;-------------------------------
                                   2819 ; BASIC: ADCON 0|1 [,divisor]  
                                   2820 ; disable/enanble ADC 
                                   2821 ;-------------------------------
                           000003  2822 	ONOFF=3 
                           000001  2823 	DIVSOR=1
                           000004  2824 	VSIZE=4 
      0025D9                       2825 power_adc:
      00A059 AE 16 68         [ 4] 2826 	call arg_list 
      00A05C CD 92            [ 1] 2827 	cp a,#2	
      00A05E 87 CD            [ 1] 2828 	jreq 1$
      00A060 8A 21            [ 1] 2829 	cp a,#1 
      00A062 A6 0D            [ 1] 2830 	jreq 0$ 
      00A064 CD 89 C4         [ 2] 2831 	jp syntax_error 
      00A067 90               [ 1] 2832 0$:	clr a 
      00A068 85               [ 1] 2833 	clrw x
      0025E9                       2834 	_xpush   ; divisor  
      00A069 81 A2 00 03      [ 2]    1     subw y,#CELL_SIZE
      00A06A 90 F7            [ 1]    2     ld (y),a 
      00A06A 52 01 01         [ 2]    3     ldw (1,y),x 
      00A06C                       2835 1$: _at_next 
      00A06C 0F 01 03         [ 1]    1     ld a,(3,y)
      00A06E 93               [ 1]    2     ldw x,y 
      00A06E CD 98            [ 2]    3     ldw x,(4,x)
      00A070 2E               [ 2] 2836 	tnzw x 
      00A071 A1 02            [ 1] 2837 	jreq 2$ 
      0025FB                       2838 	_xpop
      00A073 25 08            [ 1]    1     ld a,(y)
      00A075 A1               [ 1]    2     ldw x,y 
      00A076 0A 27            [ 2]    3     ldw x,(1,x)
      00A078 04 A1 80 26      [ 2]    4     addw y,#CELL_SIZE 
      002604                       2839 	_xdrop  
      00A07C 07 A9 00 03      [ 2]    1     addw y,#CELL_SIZE 
      00A07D 9F               [ 1] 2840 	ld a,xl
      00A07D 55 00            [ 1] 2841 	and a,#7
      00A07F 03               [ 1] 2842 	swap a 
      00A080 00 02 20         [ 1] 2843 	ld ADC_CR1,a
      00A083 5D 16 50 CA      [ 1] 2844 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A084 72 10 54 01      [ 1] 2845 	bset ADC_CR1,#ADC_CR1_ADON 
      002617                       2846 	_usec_dly 7 
      00A084 A1 02 27         [ 2]    1     ldw x,#(16*7-2)/4
      00A087 12               [ 2]    2     decw x
      00A088 A1               [ 1]    3     nop 
      00A089 04 27            [ 1]    4     jrne .-4
      00A08B 1B A1            [ 2] 2847 	jra 3$
      00A08D 82 27 1F A1      [ 1] 2848 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A091 08 27 24 A1      [ 1] 2849 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      002628                       2850 3$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      00A095 09               [ 4] 2851 	ret
                                   2852 
                                   2853 ;-----------------------------
                                   2854 ; BASIC: ADCREAD (channel)
                                   2855 ; read adc channel {0..5}
                                   2856 ; output:
                                   2857 ;   A 		TK_INTGR 
                                   2858 ;   X 		value 
                                   2859 ;-----------------------------
      002629                       2860 analog_read:
      00A096 27 24 20         [ 4] 2861 	call func_args 
      00A099 37 01            [ 1] 2862 	cp a,#1 
      00A09A 27 03            [ 1] 2863 	jreq 1$
      00A09A CD 8A 21         [ 2] 2864 	jp syntax_error
      002633                       2865 1$: _xpop 
      00A09D 5C 72            [ 1]    1     ld a,(y)
      00A09F B0               [ 1]    2     ldw x,y 
      00A0A0 00 05            [ 2]    3     ldw x,(1,x)
      00A0A2 CF 00 01 20      [ 2]    4     addw y,#CELL_SIZE 
      00A0A6 C5 00 05         [ 2] 2866 	cpw x,#5 
      00A0A7 23 05            [ 2] 2867 	jrule 2$
      00A0A7 CD 98            [ 1] 2868 	ld a,#ERR_BAD_VALUE
      00A0A9 7D CD 89         [ 2] 2869 	jp tb_error 
      00A0AC C4               [ 1] 2870 2$: ld a,xl
      00A0AD 20 BD 0E         [ 1] 2871 	ld acc8,a 
      00A0AF A6 05            [ 1] 2872 	ld a,#5
      00A0AF CD 98 47         [ 1] 2873 	sub a,acc8 
      00A0B2 FD CD 89         [ 1] 2874 	ld ADC_CSR,a
      00A0B5 C4 20 B4 02      [ 1] 2875 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A0B8 72 10 54 01      [ 1] 2876 	bset ADC_CR1,#ADC_CR1_ADON
      00A0B8 03 01 20 B2 FB   [ 2] 2877 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00A0BC CE 54 04         [ 2] 2878 	ldw x,ADC_DRH
      00A0BC CD 98            [ 1] 2879 	ld a,#TK_INTGR
      00A0BE 2E               [ 4] 2880 	ret 
                                   2881 
                                   2882 ;-----------------------
                                   2883 ; BASIC: DREAD(pin)
                                   2884 ; Arduino pins 
                                   2885 ; read state of a digital pin 
                                   2886 ; pin# {0..15}
                                   2887 ; output:
                                   2888 ;    A 		TK_INTGR
                                   2889 ;    X      0|1 
                                   2890 ;-------------------------
                           000001  2891 	PINNO=1
                           000001  2892 	VSIZE=1
      002665                       2893 digital_read:
      002665                       2894 	_vars VSIZE 
      00A0BF A1 84            [ 2]    1     sub sp,#VSIZE 
      00A0C1 27 03 CC         [ 4] 2895 	call func_args
      00A0C4 97 2D            [ 1] 2896 	cp a,#1
      00A0C6 27 03            [ 1] 2897 	jreq 1$
      00A0C6 CD 98 6D         [ 2] 2898 	jp syntax_error
      002671                       2899 1$: _xpop 
      00A0C9 9F A4            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00A0CB 0F               [ 1]    2     ldw x,y 
      00A0CC C7 00            [ 2]    3     ldw x,(1,x)
      00A0CE 24 20 9B 03      [ 2]    4     addw y,#CELL_SIZE 
      00A0D1 A3 00 0F         [ 2] 2900 	cpw x,#15 
      00A0D1 55 00            [ 2] 2901 	jrule 2$
      00A0D3 03 00            [ 1] 2902 	ld a,#ERR_BAD_VALUE
      00A0D5 02 CD 9C         [ 2] 2903 	jp tb_error 
      00A0D8 1C 4D 27         [ 4] 2904 2$:	call select_pin 
      00A0DB 05 CD            [ 1] 2905 	ld (PINNO,sp),a
      00A0DD 98 A8            [ 1] 2906 	ld a,(GPIO_IDR,x)
      00A0DF 20 8B            [ 1] 2907 	tnz (PINNO,sp)
      00A0E1 27 05            [ 1] 2908 	jreq 8$
      00A0E1 0D               [ 1] 2909 3$: srl a 
      00A0E2 01 26            [ 1] 2910 	dec (PINNO,sp)
      00A0E4 05 A6            [ 1] 2911 	jrne 3$ 
      00A0E6 0D CD            [ 1] 2912 8$: and a,#1 
      00A0E8 89               [ 1] 2913 	clrw x 
      00A0E9 C4               [ 1] 2914 	ld xl,a 
      00A0EA 5B               [ 1] 2915 	clr a 
      002699                       2916 	_drop VSIZE
      00A0EB 01 81            [ 2]    1     addw sp,#VSIZE 
      00A0ED 81               [ 4] 2917 	ret
                                   2918 
                                   2919 
                                   2920 ;-----------------------
                                   2921 ; BASIC: DWRITE pin,0|1
                                   2922 ; Arduino pins 
                                   2923 ; write to a digital pin 
                                   2924 ; pin# {0..15}
                                   2925 ; output:
                                   2926 ;    A 		TK_INTGR
                                   2927 ;    X      0|1 
                                   2928 ;-------------------------
                           000001  2929 	PINNO=1
                           000002  2930 	PINVAL=2
                           000002  2931 	VSIZE=2
      00269C                       2932 digital_write:
      00269C                       2933 	_vars VSIZE 
      00A0ED CE 00            [ 2]    1     sub sp,#VSIZE 
      00A0EF 05 1F 03         [ 4] 2934 	call arg_list  
      00A0F2 C6 00            [ 1] 2935 	cp a,#2 
      00A0F4 02 6B            [ 1] 2936 	jreq 1$
      00A0F6 05 C6 00         [ 2] 2937 	jp syntax_error
      0026A8                       2938 1$: _xpop 
      00A0F9 04 6B            [ 1]    1     ld a,(y)
      00A0FB 06               [ 1]    2     ldw x,y 
      00A0FC 81 01            [ 2]    3     ldw x,(1,x)
      00A0FD 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A0FD 1E               [ 1] 2939 	ld a,xl 
      00A0FE 03 CF            [ 1] 2940 	ld (PINVAL,sp),a
      0026B4                       2941 	_xpop 
      00A100 00 05            [ 1]    1     ld a,(y)
      00A102 7B               [ 1]    2     ldw x,y 
      00A103 05 C7            [ 2]    3     ldw x,(1,x)
      00A105 00 02 7B 06      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00A109 C7 00 04         [ 2] 2942 	cpw x,#15 
      00A10C 81 05            [ 2] 2943 	jrule 2$
      00A10D A6 0A            [ 1] 2944 	ld a,#ERR_BAD_VALUE
      00A10D 90 89 52         [ 2] 2945 	jp tb_error 
      00A110 05 2B 60         [ 4] 2946 2$:	call select_pin 
      00A111 6B 01            [ 1] 2947 	ld (PINNO,sp),a 
      00A111 0F 05            [ 1] 2948 	ld a,#1
      00A113 CD 98            [ 1] 2949 	tnz (PINNO,sp)
      00A115 2E A1            [ 1] 2950 	jreq 4$
      00A117 02               [ 1] 2951 3$: sll a
      00A118 26 10            [ 1] 2952 	dec (PINNO,sp)
      00A11A CD 8A            [ 1] 2953 	jrne 3$
      00A11C 21 5C            [ 1] 2954 4$: tnz (PINVAL,sp)
      00A11E 72 B0            [ 1] 2955 	jrne 5$
      00A120 00               [ 1] 2956 	cpl a 
      00A121 05 CF            [ 1] 2957 	and a,(GPIO_ODR,x)
      00A123 00 01            [ 2] 2958 	jra 8$
      00A125 03 05            [ 1] 2959 5$: or a,(GPIO_ODR,x)
      00A127 CD 98            [ 1] 2960 8$: ld (GPIO_ODR,x),a 
      0026E4                       2961 	_drop VSIZE 
      00A129 2E A1            [ 2]    1     addw sp,#VSIZE 
      00A12B 85               [ 4] 2962 	ret
                                   2963 
                                   2964 
                                   2965 ;-----------------------
                                   2966 ; BASIC: STOP
                                   2967 ; stop progam execution  
                                   2968 ; without resetting pointers 
                                   2969 ; the program is resumed
                                   2970 ; with RUN 
                                   2971 ;-------------------------
      0026E7                       2972 stop:
      00A12C 27 03 CC 97 2D   [ 2] 2973 	btjt flags,#FRUN,2$
      00A131 CD               [ 1] 2974 	clr a
      00A132 98               [ 4] 2975 	ret 
      0026EE                       2976 2$:	 
                                   2977 ; create space on cstack to save context 
      00A133 63 CF 00         [ 2] 2978 	ldw x,#break_point 
      00A136 1A 0D 05         [ 4] 2979 	call puts 
      0026F4                       2980 	_drop 2 ;drop return address 
      00A139 26 06            [ 2]    1     addw sp,#2 
      0026F6                       2981 	_vars CTXT_SIZE ; context size 
      00A13B CD 92            [ 2]    1     sub sp,#CTXT_SIZE 
      00A13D 5C CD 89         [ 4] 2982 	call save_context 
      00A140 C4 16 68         [ 2] 2983 	ldw x,#tib 
      00A141 CF 00 04         [ 2] 2984 	ldw basicptr,x
      00A141 A6               [ 1] 2985 	clr (x)
      00A142 3A CD 89 C4      [ 1] 2986 	clr count  
      00A146 CD               [ 1] 2987 	clrw x 
      00A147 A0 ED 72         [ 2] 2988 	ldw in.w,x
      00A14A 5F 00 04 CD      [ 1] 2989 	bres flags,#FRUN 
      00A14E 8B 26 AE 16      [ 1] 2990 	bset flags,#FBREAK
      00A152 68 3B 00         [ 2] 2991 	jp interpreter 
      00A155 04 4B 00 72 FB 01 5C  2992 break_point: .asciz "\nbreak point, RUN to resume.\n"
             5B 02 72 5F 00 02 CD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal  8F-Bits]



             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   2993 
                                   2994 ;-----------------------
                                   2995 ; BASIC: NEW
                                   2996 ; from command line only 
                                   2997 ; free program memory
                                   2998 ; and clear variables 
                                   2999 ;------------------------
      002733                       3000 new: 
      00A164 9B A1 84 27 14   [ 2] 3001 	btjf flags,#FRUN,0$ 
      00A169 A1               [ 4] 3002 	ret 
      002739                       3003 0$:	
      00A16A 11 26 07         [ 4] 3004 	call clear_basic 
      00A16D CD               [ 4] 3005 	ret 
                                   3006 
                                   3007 ;-----------------------------------
                                   3008 ; BASIC: ERASE \E | \F 
                                   3009 ; erase all block in range from 
                                   3010 ;  'app_space' to FLASH end (0x20000)
                                   3011 ;  or all EEPROM 
                                   3012 ; that contains a non zero byte.  
                                   3013 ;-----------------------------------
                           000001  3014 	LIMIT=1 
                           000003  3015 	VSIZE = 3 
      00273D                       3016 erase:
      00A16E 8F 9B A1 84      [ 1] 3017 	clr farptr 
      002741                       3018 	_vars VSIZE 
      00A172 27 06            [ 2]    1     sub sp,#VSIZE 
      00A174 CD 17 AE         [ 4] 3019 	call next_token 
      00A174 CD A0            [ 1] 3020 	cp a,#TK_CHAR 
      00A176 FD CC            [ 1] 3021 	jreq 0$ 
      00A178 97 2D AD         [ 2] 3022 	jp syntax_error
      00A17A CD 17 FD         [ 4] 3023 0$: call get_char 
      00A17A CD 82            [ 1] 3024 	and a,#0XDF 
      00A17C 8D 45            [ 1] 3025 	cp a,#'E
      00A17D 26 0C            [ 1] 3026 	jrne 1$
      00A17D C6 00 0D         [ 2] 3027 	ldw x,#EEPROM_BASE 
      00A180 CE 00 0E         [ 2] 3028 	ldw farptr+1,x 
      00A183 72 C7 00         [ 2] 3029 	ldw x,#EEPROM_END
      00A186 1A               [ 1] 3030 	clr a 
      00A187 72 5C            [ 2] 3031 	jra 3$ 
      00A189 00 1B            [ 1] 3032 1$: cp a,#'F 
      00A18B 72 CF            [ 1] 3033 	jreq 2$
      00A18D 00 1A CD         [ 2] 3034 	ldw x,#err_bad_value
      00A190 A0 FD CD         [ 2] 3035 	jp tb_error
      00276C                       3036 2$:
      00A193 98 2E A1         [ 2] 3037 	ldw x,#app_space  
      00A196 08 26 03         [ 2] 3038 	ldw farptr+1,x 
      00A199 CC A1            [ 1] 3039 	ld a,#(FLASH_END>>16)&0XFF 
      00A19B 11 7F FF         [ 2] 3040 	ldw x,#FLASH_END&0xffff
      00A19C                       3041 3$:
      00A19C A1 00            [ 1] 3042 	ld (LIMIT,sp),a 
      00A19E 27 07            [ 2] 3043 	ldw (LIMIT+1,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



                                   3044  ; operation done from RAM
                                   3045  ; copy code to RAM in tib   
      00A1A0 A1 0A 27         [ 4] 3046 	call move_erase_to_ram
      00277E                       3047 4$:	 
      00A1A3 03 CC 97         [ 4] 3048     call scan_block 
      00A1A6 2D 08            [ 1] 3049 	jreq 5$  ; block already erased 
      00A1A7 A6 45            [ 1] 3050     ld a,#'E 
      00A1A7 5B 05 90         [ 4] 3051     call putc 
      00A1AA 85 81 C0         [ 4] 3052 	call block_erase   
                                   3053 ; this block is clean, next  
      00A1AC AE 00 80         [ 2] 3054 5$:	ldw x,#BLOCK_SIZE
      00A1AC 55 00 04         [ 4] 3055 	call incr_farptr
                                   3056 ; check limit, 24 bit substraction  	
      00A1AF 00 02            [ 1] 3057 	ld a,(LIMIT,sp)
      00A1B1 81 02            [ 2] 3058 	ldw x,(LIMIT+1,sp)
      00A1B2 72 B0 00 19      [ 2] 3059 	subw x,farptr+1
      00A1B2 52 04 0F         [ 1] 3060 	sbc a,farptr 
      00A1B5 01 CD            [ 1] 3061 	jrugt 4$ 
      00A1B7 99 EC A1         [ 4] 3062 9$: call clear_basic
      00A1BA 02 24            [ 2] 3063 	ldw x,(LIMIT+1,sp)
      00A1BC 03 CC 97         [ 2] 3064 	cpw x,#EEPROM_END
      00A1BF 2D A1            [ 1] 3065 	jrne 10$
      00A1C1 03 25 0C         [ 4] 3066 	call func_eefree 
      0027AB                       3067 10$:
      0027AB                       3068 	_drop VSIZE 
      00A1C4 90 F6            [ 2]    1     addw sp,#VSIZE 
      00A1C6 93               [ 4] 3069 	ret 
                                   3070 	
                                   3071 
                                   3072 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3073 ;  check for application signature 
                                   3074 ; output:
                                   3075 ;   Carry    0 app present 
                                   3076 ;            1 no app installed  
                                   3077 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027AE                       3078 qsign: 
      00A1C7 EE 01 72         [ 2] 3079 	ldw x,app_sign 
      00A1CA A9 00 03         [ 2] 3080 	cpw x,SIGNATURE ; "BC" 
      00A1CD 9F               [ 4] 3081 	ret 
                                   3082 
                                   3083 ;--------------------------------------
                                   3084 ;  fill write buffer 
                                   3085 ;  input:
                                   3086 ;    y  point to output buffer 
                                   3087 ;    x  point to source 
                                   3088 ;    a  bytes to write in buffer 
                                   3089 ;  output:
                                   3090 ;    y   += A 
                                   3091 ;    X   += A 
                                   3092 ;    A   0 
                                   3093 ;---------------------------------------
      0027B5                       3094 fill_write_buffer:
      00A1CE 6B               [ 1] 3095 	push a 
      00A1CF 01               [ 1] 3096 	tnz a 
      00A1D0 90 F6            [ 1] 3097 	jreq 9$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



      00A1D2 93               [ 1] 3098 1$: ld a,(x)
      00A1D3 EE               [ 1] 3099 	incw x 
      00A1D4 01 72            [ 1] 3100 	ld (y),a 
      00A1D6 A9 00            [ 1] 3101 	incw y 
      00A1D8 03 9F            [ 1] 3102 	dec (1,sp) 
      00A1DA 6B 02            [ 1] 3103 	jrne 1$ 
      00A1DC 90               [ 1] 3104 9$:	pop a 
      00A1DD F6               [ 4] 3105     ret 	
                                   3106 
                                   3107 ;--------------------------------------
                                   3108 ;  fill pad buffer with zero 
                                   3109 ;  input:
                                   3110 ;	none 
                                   3111 ;  output:
                                   3112 ;    y     buffer address  
                                   3113 ;--------------------------------------
      0027C5                       3114 clear_block_buffer:
      00A1DE 93               [ 1] 3115 	push a 
      00A1DF EE 01 72 A9      [ 2] 3116 	ldw y,#block_buffer 
      00A1E3 00 03            [ 2] 3117 	pushw y
      00A1E5 F6 14            [ 1] 3118 	ld a,#BLOCK_SIZE   
      00A1E7 02 18            [ 1] 3119 1$:	clr (y)
      00A1E9 01 27            [ 1] 3120 	incw y
      00A1EB F9               [ 1] 3121 	dec a  
      00A1EC 5B 04            [ 1] 3122 	jrne 1$ 	
      00A1EE 81 85            [ 2] 3123 9$: popw y 
      00A1EF 84               [ 1] 3124 	pop a 			
      00A1EF CD               [ 4] 3125 	ret 
                                   3126 
                                   3127 
                                   3128 ;---------------------------------------
                                   3129 ; BASIC: SAVE
                                   3130 ; write application from RAM to FLASH
                                   3131 ;--------------------------------------
                           000001  3132 	XTEMP=1
                           000003  3133 	COUNT=3  ; last count bytes written 
                           000004  3134 	CNT_LO=4 ; count low byte 
                           000005  3135 	TOWRITE=5 ; how bytes left to write  
                           000006  3136 	VSIZE=6 
      0027D9                       3137 save_app:
      00A1F0 99               [ 2] 3138 	pushw x 
      00A1F1 EC A1            [ 2] 3139 	pushw y 
      0027DC                       3140 	_vars VSIZE
      00A1F3 02 27            [ 2]    1     sub sp,#VSIZE 
      00A1F5 03 CC 97         [ 4] 3141 	call qsign 
      00A1F8 2D 09            [ 1] 3142 	jrne 1$
      00A1F9 AE 28 70         [ 2] 3143 	ldw x,#CANT_DO 
      00A1F9 90 F6 93         [ 4] 3144 	call puts 
      00A1FC EE 01 72         [ 2] 3145 	jp 9$
      0027EC                       3146 1$: 
      00A1FF A9 00 03         [ 2] 3147 	ldw x,txtbgn
      00A202 9F 88 90         [ 2] 3148 	cpw x,txtend 
      00A205 F6 93            [ 1] 3149 	jrult 2$ 
      00A207 EE 01 72         [ 2] 3150 	ldw x,#NO_APP
      00A20A A9 00 03         [ 4] 3151 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00A20D 84 FA F7         [ 2] 3152 	jp 9$
      0027FD                       3153 2$: 
                                   3154 ; block programming flash
                                   3155 ; must be done from RAM
                                   3156 ; moved in tib  
      00A210 81 07 82         [ 4] 3157 	call move_prg_to_ram
                                   3158 ; initialize farptr 
                                   3159 ; to app_sign address 
      00A211 72 5F 00 18      [ 1] 3160 	clr farptr 
      00A211 CD 99 EC         [ 2] 3161 	ldw x,#app_sign 
      00A214 A1 02 27         [ 2] 3162 	ldw farptr+1,x
                                   3163 ; initialize local variables 
      00A217 03 CC 97         [ 4] 3164 	call prog_size
      00A21A 2D 05            [ 2] 3165 	ldw (TOWRITE,sp),x
      00A21B 0F 03            [ 1] 3166 	clr (COUNT,sp)
                                   3167 ; first bock 
                                   3168 ; containt signature 2 bytes 
                                   3169 ; and size 	2 bytes 
                                   3170 ; use Y as pointer to block_buffer
      00A21B 90 F6 93         [ 4] 3171 	call clear_block_buffer ; -- y=*block_buffer	
                                   3172 ; write signature
      00A21E EE 01 72         [ 2] 3173 	ldw x,SIGNATURE ; "BC" 
      00A221 A9 00            [ 2] 3174 	ldw (y),x 
      00A223 03 9F 43 88      [ 2] 3175 	addw y,#2
      00A227 90 F6            [ 2] 3176 	ldw x,(TOWRITE,sp)
      00A229 93 EE            [ 2] 3177 	ldw (y),x
      00A22B 01 72 A9 00      [ 2] 3178 	addw y,#2   
      00A22F 03 84            [ 1] 3179 	ld a,#(BLOCK_SIZE-4)
      00A231 F4 F7            [ 1] 3180 	ld (CNT_LO,sp),a 
      00A233 81 00 7C         [ 2] 3181 	cpw x,#(BLOCK_SIZE-4) 
      00A234 22 01            [ 1] 3182 	jrugt 3$
      00A234 CD               [ 1] 3183 	ld a,xl 
      00A235 99 EC            [ 1] 3184 3$:	ld (CNT_LO,sp),a   
      00A237 A1 02 27         [ 2] 3185 	ldw x,txtbgn 
      00A23A 03 CC            [ 2] 3186 	ldw (XTEMP,sp),x 
      002836                       3187 32$: 
      00A23C 97 2D            [ 2] 3188 	ldw x,(XTEMP,sp)
      00A23E 90 F6            [ 1] 3189 	ld a,(CNT_LO,sp)
      00A240 93 EE 01         [ 4] 3190 	call fill_write_buffer 
      00A243 72 A9            [ 2] 3191 	ldw (XTEMP,sp),x 
      00A245 00 03 9F         [ 2] 3192 	ldw x,#block_buffer
      00A248 88 90 F6         [ 4] 3193 	call write_buffer
      00A24B 93 EE 01         [ 2] 3194 	ldw x,#BLOCK_SIZE 
      00A24E 72 A9 00         [ 4] 3195 	call incr_farptr  
                                   3196 ; following blocks 
      00A251 03 84            [ 2] 3197 	ldw x,(XTEMP,sp)
      00A253 F8 F7 81         [ 2] 3198 	cpw x,txtend 
      00A256 24 16            [ 1] 3199 	jruge 9$ 
      00A256 CD 99            [ 2] 3200 	ldw x,(TOWRITE,sp)
      00A258 E7 A1 02         [ 2] 3201 	subw x,(COUNT,sp)
      00A25B 27 03            [ 2] 3202 	ldw (TOWRITE,sp),x 
      00A25D CC 97            [ 1] 3203 	ld a,#BLOCK_SIZE 
      00A25F 2D 00 80         [ 2] 3204 	cpw x,#BLOCK_SIZE 
      00A260 24 01            [ 1] 3205 	jruge 4$ 
      00A260 90               [ 1] 3206 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00A261 F6 93            [ 1] 3207 4$:	ld (CNT_LO,sp),a 
      00A263 EE 01 72         [ 4] 3208 	call clear_block_buffer 
      00A266 A9 00            [ 2] 3209 	jra 32$ 
      002868                       3210 9$:	_drop VSIZE 
      00A268 03 9F            [ 2]    1     addw sp,#VSIZE 
      00A26A A4 07            [ 2] 3211     popw y 
      00A26C 88               [ 2] 3212 	popw x 
      00A26D A6               [ 4] 3213 	ret 
                                   3214 
                                   3215 
      00A26E 01 0D                 3216 SIGNATURE: .ascii "BC"
      00A270 01 27 05 48 0A 01 20  3217 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE \F before"
             F7 6B 01 90 F6 93 EE
             01 72 A9 00 03 84 F4
             27 02 A6 01 5F 97 4F
             81 61 64 79 20 6F 6E
             65 20 69 6E 20 46 4C
             41 53 48 0A 75 73 65
             20 45 52 41 53 45 20
             5C 46 20 62 65 66 6F
             72 65 00
      00A28D 4E 6F 20 61 70 70 6C  3218 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
             20 69 6E 20 52 41 4D
             00
                                   3219 
                                   3220 ;---------------------
                                   3221 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3222 ; write 1 or more byte to FLASH or EEPROM
                                   3223 ; starting at address  
                                   3224 ; input:
                                   3225 ;   expr1  	is address 
                                   3226 ;   expr2,...,exprn   are bytes to write
                                   3227 ; output:
                                   3228 ;   none 
                                   3229 ;---------------------
      0028C8                       3230 write:
      00A28D CD 99 EC         [ 4] 3231 	call expression
      00A290 A1 02            [ 1] 3232 	cp a,#TK_INTGR 
      00A292 27 03            [ 1] 3233 	jreq 0$
      00A294 CC 97 2D         [ 2] 3234 	jp syntax_error
      00A297                       3235 0$: _xpop 
      00A297 90 F6            [ 1]    1     ld a,(y)
      00A299 93               [ 1]    2     ldw x,y 
      00A29A EE 01            [ 2]    3     ldw x,(1,x)
      00A29C 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A2A0 9F 88 90         [ 1] 3236 	ld farptr,a 
      00A2A3 F6 93 EE         [ 2] 3237 	ldw ptr16,x 
      0028E1                       3238 1$:	
      00A2A6 01 72 A9         [ 4] 3239 	call next_token 
      00A2A9 00 03            [ 1] 3240 	cp a,#TK_COMMA 
      00A2AB 84 F7            [ 1] 3241 	jreq 2$ 
      00A2AD 81 20            [ 2] 3242 	jra 9$ ; no more data 
      00A2AE CD 1A 97         [ 4] 3243 2$:	call expression
      00A2AE CD 99            [ 1] 3244 	cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



      00A2B0 E7 A1            [ 1] 3245 	jreq 3$
      00A2B2 01 27 03         [ 2] 3246 	jp syntax_error
      0028F4                       3247 3$:	_xpop 
      00A2B5 CC 97            [ 1]    1     ld a,(y)
      00A2B7 2D               [ 1]    2     ldw x,y 
      00A2B8 90 F6            [ 2]    3     ldw x,(1,x)
      00A2BA 93 EE 01 72      [ 2]    4     addw y,#CELL_SIZE 
      00A2BE A9               [ 1] 3248 	ld a,xl 
      00A2BF 00               [ 1] 3249 	clrw x 
      00A2C0 03 C7 00         [ 4] 3250 	call write_byte
      00A2C3 19 CF 00         [ 2] 3251 	ldw x,#1 
      00A2C6 1A 92 BC         [ 4] 3252 	call incr_farptr 
      00A2C9 00 19            [ 2] 3253 	jra 1$ 
      00290A                       3254 9$:
      00A2CB 5F               [ 4] 3255 	ret 
                                   3256 
                                   3257 
                                   3258 ;---------------------
                                   3259 ;BASIC: CHAR(expr)
                                   3260 ; évaluate expression 
                                   3261 ; and take the 7 least 
                                   3262 ; bits as ASCII character
                                   3263 ; output: 
                                   3264 ; 	A char 
                                   3265 ;---------------------
      00290B                       3266 char:
      00A2CC 97 4F 81         [ 4] 3267 	call func_args 
      00A2CF A1 01            [ 1] 3268 	cp a,#1
      00A2CF CD 9C            [ 1] 3269 	jreq 1$
      00A2D1 1C 90 F6         [ 2] 3270 	jp syntax_error
      002915                       3271 1$:	_xpop
      00A2D4 93 EE            [ 1]    1     ld a,(y)
      00A2D6 01               [ 1]    2     ldw x,y 
      00A2D7 72 A9            [ 2]    3     ldw x,(1,x)
      00A2D9 00 03 4D 26      [ 2]    4     addw y,#CELL_SIZE 
      00A2DD 0A               [ 1] 3272 	ld a,xl
      00A2DE 55 00            [ 1] 3273 	and a,#0x7f 
      00A2E0 04               [ 4] 3274 	ret
                                   3275 
                                   3276 ;---------------------
                                   3277 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3278 ; extract first character 
                                   3279 ; of string argument 
                                   3280 ; output:
                                   3281 ;    A:X    int24 
                                   3282 ;---------------------
      002922                       3283 ascii:
      00A2E1 00 02            [ 1] 3284 	ld a,#TK_LPAREN
      00A2E3 5B 02 CC         [ 4] 3285 	call expect 
      00A2E6 97 E0 81         [ 4] 3286 	call next_token 
      00A2E9 A1 02            [ 1] 3287 	cp a,#TK_QSTR 
      00A2E9 85 52            [ 1] 3288 	jreq 1$
      00A2EB 0D 89            [ 1] 3289 	cp a,#TK_CHAR 
      00A2ED A6 85            [ 1] 3290 	jreq 2$ 
      00A2EF CD 99            [ 1] 3291 	cp a,#TK_CFUNC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



      00A2F1 DA CD            [ 1] 3292 	jreq 0$
      00A2F3 98 63 1F         [ 2] 3293 	jp syntax_error
      002939                       3294 0$: ; cfunc 
      00A2F6 09               [ 4] 3295 	call (x)
      00A2F7 CD 9D            [ 2] 3296 	jra 3$
      00293C                       3297 1$: ; quoted string 
      00A2F9 04               [ 1] 3298 	ld a,(x)
      00A2FA 72               [ 1] 3299 	push a  
      00A2FB 14 00 23         [ 4] 3300 	call skip_string
      00A2FE CD               [ 1] 3301 	pop a  	
      00A2FF 98 2E            [ 2] 3302 	jra 3$ 
      002944                       3303 2$: ; character 
      00A301 A1 80 27         [ 4] 3304 	call get_char 
      00A304 03               [ 1] 3305 3$:	clrw x 
      00A305 CC               [ 1] 3306 	rlwa x   
      002949                       3307 4$:	_xpush  
      00A306 97 2D 00 03      [ 2]    1     subw y,#CELL_SIZE
      00A308 90 F7            [ 1]    2     ld (y),a 
      00A308 CD 98 47         [ 2]    3     ldw (1,y),x 
      00A30B A3 A3            [ 1] 3308 	ld a,#TK_RPAREN 
      00A30D 13 27 03         [ 4] 3309 	call expect
      002957                       3310 9$:	
      002957                       3311 	_xpop  
      00A310 CC 97            [ 1]    1     ld a,(y)
      00A312 2D               [ 1]    2     ldw x,y 
      00A313 EE 01            [ 2]    3     ldw x,(1,x)
      00A313 72 04 00 23      [ 2]    4     addw y,#CELL_SIZE 
      00A317 03               [ 4] 3312 	ret 
                                   3313 
                                   3314 ;---------------------
                                   3315 ;BASIC: KEY
                                   3316 ; wait for a character 
                                   3317 ; received from STDIN 
                                   3318 ; input:
                                   3319 ;	none 
                                   3320 ; output:
                                   3321 ;	a	 character 
                                   3322 ;---------------------
      002961                       3323 key:
      00A318 CC 97 2D         [ 4] 3324 	call getc 
      00A31B CD               [ 4] 3325 	ret
                                   3326 
                                   3327 ;----------------------
                                   3328 ; BASIC: QKEY
                                   3329 ; Return true if there 
                                   3330 ; is a character in 
                                   3331 ; waiting in STDIN 
                                   3332 ; input:
                                   3333 ;  none 
                                   3334 ; output:
                                   3335 ;   A     0|-1
                                   3336 ;-----------------------
      002965                       3337 qkey:: 
      00A31C 9B               [ 1] 3338 	clrw x 
      00A31D 17 A1 84         [ 1] 3339 	ld a,rx1_head
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



      00A320 27 03 CC         [ 1] 3340 	sub a,rx1_tail 
      00A323 97 2D            [ 1] 3341 	jreq 9$ 
      00A325 90               [ 2] 3342 	cplw x
      00A326 F6 93            [ 1] 3343 	ld a,#255    
      002971                       3344 9$: 
      00A328 EE               [ 4] 3345 	ret 
                                   3346 
                                   3347 ;---------------------
                                   3348 ; BASIC: GPIO(port,reg)
                                   3349 ; return gpio register address 
                                   3350 ; expr {PORTA..PORTI}
                                   3351 ; input:
                                   3352 ;   none 
                                   3353 ; output:
                                   3354 ;   A:X 	gpio register address
                                   3355 ;----------------------------
                                   3356 ;	N=PORT
                                   3357 ;	T=REG 
      002972                       3358 gpio:
      00A329 01 72 A9         [ 4] 3359 	call func_args 
      00A32C 00 03            [ 1] 3360 	cp a,#2
      00A32E 6B 06            [ 1] 3361 	jreq 1$
      00A330 1F 07 CD         [ 2] 3362 	jp syntax_error  
      00297C                       3363 1$:	_at_next 
      00A333 98 2E A1         [ 1]    1     ld a,(3,y)
      00A336 00               [ 1]    2     ldw x,y 
      00A337 27 11            [ 2]    3     ldw x,(4,x)
      00A339 A1 80 26         [ 2] 3364 	cpw x,#PA_BASE 
      00A33C 08 CD            [ 1] 3365 	jrmi bad_port
      00A33E 98 47 A3         [ 2] 3366 	cpw x,#PI_BASE+1 
      00A341 A3 53            [ 1] 3367 	jrpl bad_port
      00A343 27               [ 2] 3368 	pushw x 
      00298D                       3369 	_xpop
      00A344 0E F6            [ 1]    1     ld a,(y)
      00A345 93               [ 1]    2     ldw x,y 
      00A345 55 00            [ 2]    3     ldw x,(1,x)
      00A347 03 00 02 03      [ 2]    4     addw y,#CELL_SIZE 
      00A34A 72 FB 01         [ 2] 3370 	addw x,(1,sp)
      002999                       3371 	_drop 2 
      00A34A 0F 03            [ 2]    1     addw sp,#2 
      00A34C AE               [ 1] 3372 	clr a 
      00A34D 00               [ 4] 3373 	ret
      00299D                       3374 bad_port:
      00A34E 01 1F            [ 1] 3375 	ld a,#ERR_BAD_VALUE
      00A350 04 20 2F         [ 2] 3376 	jp tb_error
                                   3377 
                                   3378 
                                   3379 ;-------------------------
                                   3380 ; BASIC: UFLASH 
                                   3381 ; return free flash address
                                   3382 ; input:
                                   3383 ;  none 
                                   3384 ; output:
                                   3385 ;	A		TK_INTGR
                                   3386 ;   xstack	free address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



                                   3387 ;---------------------------
      00A353                       3388 uflash:
      00A353 72 04 00         [ 2] 3389 	ldw x,app_sign
      00A356 23 03 CC         [ 2] 3390 	cpw x,#4243 ; signature "BC" 
      00A359 97 2D            [ 1] 3391 	jreq 1$
      00A35B CD 9B 17         [ 2] 3392 	ldw x,app_size 
      00A35E A1 84 27         [ 2] 3393 	addw x,#app
      00A361 03 CC            [ 2] 3394 	jra 2$
      00A363 97 2D 00         [ 2] 3395 1$:	ldw x,#app_space 
      00A365 4F               [ 1] 3396 2$:	clr a 
      00A365 90               [ 4] 3397 	ret 
                                   3398 
                                   3399 
                                   3400 ;---------------------
                                   3401 ; BASIC: USR(addr[,arg])
                                   3402 ; execute a function written 
                                   3403 ; in binary code.
                                   3404 ; binary fonction should 
                                   3405 ; return token attribute in A 
                                   3406 ; and value in YL:X. 
                                   3407 ; input:
                                   3408 ;   addr	routine address 
                                   3409 ;   arg 	is an optional argument 
                                   3410 ; output:
                                   3411 ;   A 		token attribute 
                                   3412 ;   xstack  returned value 
                                   3413 ;---------------------
      0029B7                       3414 usr:
      00A366 F6               [ 2] 3415 	pushw x 
      00A367 93 EE            [ 2] 3416 	pushw y 	
      00A369 01 72 A9         [ 4] 3417 	call func_args 
      00A36C 00 03            [ 1] 3418 	cp a,#1 
      00A36E 6B 03            [ 1] 3419 	jreq 1$
      00A370 1F 04            [ 1] 3420 	cp a,#2
      00A372 4D 2A            [ 1] 3421 	jreq 1$  
      00A374 0D 7B 06         [ 2] 3422 	jp syntax_error 
      00A377 1E               [ 1] 3423 1$: push a 
      0029C9                       3424 	_xpop 
      00A378 07 1D            [ 1]    1     ld a,(y)
      00A37A 00               [ 1]    2     ldw x,y 
      00A37B 01 A2            [ 2]    3     ldw x,(1,x)
      00A37D 00 6B 06 1F      [ 2]    4     addw y,#CELL_SIZE 
      00A381 07 93            [ 1] 3425 	ldw y,x  ; arg|addr 
      00A382 84               [ 1] 3426     pop a 
      00A382 CE 00            [ 1] 3427 	cp a,#1 
      00A384 05 1F            [ 1] 3428 	jreq 3$
      0029D9                       3429 	_xpop  ; x=code addr  
      00A386 0D CE            [ 1]    1     ld a,(y)
      00A388 00               [ 1]    2     ldw x,y 
      00A389 01 1F            [ 2]    3     ldw x,(1,x)
      00A38B 0B 72 15 00      [ 2]    4     addw y,#CELL_SIZE 
      00A38F 23               [ 1] 3430 	exgw x,y ; y=code addr, x=arg 
      00A390 72 5C            [ 4] 3431 3$: call (y)
      00A392 00               [ 1] 3432 	push a 
      00A393 20 81            [ 1] 3433 	ld a,yl  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



      00A395                       3434 	_xpush 
      00A395 72 5D 00 20      [ 2]    1     subw y,#CELL_SIZE
      00A399 26 03            [ 1]    2     ld (y),a 
      00A39B CC 97 2D         [ 2]    3     ldw (1,y),x 
      00A39E 84               [ 1] 3435 	pop a 
      00A39E A6 85            [ 2] 3436 	popw y 
      00A3A0 CD               [ 2] 3437 	popw x 
      00A3A1 99               [ 4] 3438 	ret 
                                   3439 
                                   3440 
                                   3441 ;------------------------------
                                   3442 ; BASIC: BYE 
                                   3443 ; halt mcu in its lowest power mode 
                                   3444 ; wait for reset or external interrupt
                                   3445 ; do a cold start on wakeup.
                                   3446 ;------------------------------
      0029F6                       3447 bye:
      00A3A2 DA CD 98 63 13   [ 2] 3448 	btjf UART1_SR,#UART_SR_TC,.
      00A3A7 09               [10] 3449 	halt
      00A3A8 27 03 CC         [ 2] 3450 	jp cold_start  
                                   3451 
                                   3452 ;----------------------------------
                                   3453 ; BASIC: SLEEP 
                                   3454 ; halt mcu until reset or external
                                   3455 ; interrupt.
                                   3456 ; Resume progam after SLEEP command
                                   3457 ;----------------------------------
      0029FF                       3458 sleep:
      00A3AB 97 2D 52 30 FB   [ 2] 3459 	btjf UART1_SR,#UART_SR_TC,.
      00A3AD 72 16 00 22      [ 1] 3460 	bset flags,#FSLEEP
      00A3AD CF               [10] 3461 	halt 
      00A3AE 00               [ 4] 3462 	ret 
                                   3463 
                                   3464 ;-------------------------------
                                   3465 ; BASIC: PAUSE expr 
                                   3466 ; suspend execution for n msec.
                                   3467 ; input:
                                   3468 ;	none
                                   3469 ; output:
                                   3470 ;	none 
                                   3471 ;------------------------------
      002A0A                       3472 pause:
      00A3AF 1A F6 EE         [ 4] 3473 	call expression
      00A3B2 01 72            [ 1] 3474 	cp a,#TK_INTGR
      00A3B4 FB 04            [ 1] 3475 	jreq 1$ 
      00A3B6 19 03 72         [ 2] 3476 	jp syntax_error
      002A14                       3477 1$: _xpop 
      00A3B9 C7 00            [ 1]    1     ld a,(y)
      00A3BB 1A               [ 1]    2     ldw x,y 
      00A3BC 72 5C            [ 2]    3     ldw x,(1,x)
      00A3BE 00 1B 72 CF      [ 2]    4     addw y,#CELL_SIZE 
      002A1D                       3478 pause02:
      00A3C2 00 1A C7         [ 2] 3479 	ldw timer,x 
      00A3C5 00 0D CF         [ 2] 3480 1$: ldw x,timer 
      00A3C8 00               [ 2] 3481 	tnzw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



      00A3C9 0E 7B            [ 1] 3482 	jreq 2$
      00A3CB 06               [10] 3483 	wfi 
      00A3CC 1E 07            [ 1] 3484 	jrne 1$
      002A29                       3485 2$:	
      00A3CE 72               [ 4] 3486 	ret 
                                   3487 
                                   3488 ;------------------------------
                                   3489 ; BASIC: AWU expr
                                   3490 ; halt mcu for 'expr' milliseconds
                                   3491 ; use Auto wakeup peripheral
                                   3492 ; all oscillators stopped except LSI
                                   3493 ; range: 1ms - 511ms
                                   3494 ; input:
                                   3495 ;  none
                                   3496 ; output:
                                   3497 ;  none:
                                   3498 ;------------------------------
      002A2A                       3499 awu:
      00A3CF B0 00 0E         [ 4] 3500   call expression
      00A3D2 C2 00            [ 1] 3501   cp a,#TK_INTGR
      00A3D4 0D 18            [ 1] 3502   jreq 1$
      00A3D6 03 A8 80         [ 2] 3503   jp syntax_error
      002A34                       3504 1$: _xpop 
      00A3D9 2B 12            [ 1]    1     ld a,(y)
      00A3DB 20               [ 1]    2     ldw x,y 
      00A3DC 25 7B            [ 2]    3     ldw x,(1,x)
      00A3DE 03 2A 07 C6      [ 2]    4     addw y,#CELL_SIZE 
      002A3D                       3505 awu02:
      00A3E2 00 0F 2F         [ 2] 3506   cpw x,#5120
      00A3E5 07 20            [ 1] 3507   jrmi 1$ 
      00A3E7 1A 0F 50 F2      [ 1] 3508   mov AWU_TBR,#15 
      00A3E8 A6 1E            [ 1] 3509   ld a,#30
      00A3E8 72               [ 2] 3510   div x,a
      00A3E9 0E 00            [ 1] 3511   ld a,#16
      00A3EB 0F               [ 2] 3512   div x,a 
      00A3EC 15 1E            [ 2] 3513   jra 4$
      00A3ED                       3514 1$: 
      00A3ED 1E 0D CF         [ 2] 3515   cpw x,#2048
      00A3F0 00 05            [ 1] 3516   jrmi 2$ 
      00A3F2 72 01 00 23      [ 1] 3517   mov AWU_TBR,#14
      00A3F6 05 E6            [ 1] 3518   ld a,#80
      00A3F8 02               [ 2] 3519   div x,a 
      00A3F9 C7 00            [ 2] 3520   jra 4$   
      002A5C                       3521 2$:
      00A3FB 04 1E 0B CF      [ 1] 3522   mov AWU_TBR,#7
      002A60                       3523 3$:  
                                   3524 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A3FF 00 01 81         [ 2] 3525   cpw x,#64 
      00A402 23 07            [ 2] 3526   jrule 4$ 
      00A402 85 5B 0D 72      [ 1] 3527   inc AWU_TBR 
      00A406 5A               [ 2] 3528   srlw x 
      00A407 00 20            [ 2] 3529   jra 3$ 
      002A6C                       3530 4$:
      00A409 FC               [ 1] 3531   ld a, xl
      00A40A 4A               [ 1] 3532   dec a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



      00A40A CD 98            [ 1] 3533   jreq 5$
      00A40C 2E               [ 1] 3534   dec a 	
      002A71                       3535 5$: 
      00A40D A1 84            [ 1] 3536   and a,#0x3e 
      00A40F 27 07 A1         [ 1] 3537   ld AWU_APR,a 
      00A412 03 27 26 CC      [ 1] 3538   bset AWU_CSR,#AWU_CSR_AWUEN
      00A416 97               [10] 3539   halt 
                                   3540 
      00A417 2D               [ 4] 3541   ret 
                                   3542 
                                   3543 ;------------------------------
                                   3544 ; BASIC: TICKS
                                   3545 ; return msec ticks counter value 
                                   3546 ; input:
                                   3547 ; 	none 
                                   3548 ; output:
                                   3549 ;	X 		TK_INTGR
                                   3550 ;-------------------------------
      00A418                       3551 get_ticks:
      00A418 90 89 CD         [ 1] 3552 	ld a,ticks 
      00A41B 98 6D 4F         [ 2] 3553 	ldw x,ticks+1 
      00A41E 90               [ 4] 3554 	ret 
                                   3555 
                                   3556 ;------------------------------
                                   3557 ; BASIC: ABS(expr)
                                   3558 ; return absolute value of expr.
                                   3559 ; input:
                                   3560 ;   none
                                   3561 ; output:
                                   3562 ;   xstack    positive int24 
                                   3563 ;-------------------------------
      002A83                       3564 abs:
      00A41F CE 00 05         [ 4] 3565 	call func_args 
      00A422 90 FE            [ 1] 3566 	cp a,#1 
      00A424 90 89            [ 1] 3567 	jreq 0$ 
      00A426 13 01 5B         [ 2] 3568 	jp syntax_error
      002A8D                       3569 0$:  
      00A429 02 25 01         [ 4] 3570 	call abs24 
      002A90                       3571 	_xpop 
      00A42C 4C F6            [ 1]    1     ld a,(y)
      00A42D 93               [ 1]    2     ldw x,y 
      00A42D CD 8C            [ 2]    3     ldw x,(1,x)
      00A42F FE 5D 26 05      [ 2]    4     addw y,#CELL_SIZE 
      00A433 A6               [ 4] 3572 	ret 
                                   3573 
                                   3574 ;------------------------------
                                   3575 ; BASIC: LSHIFT(expr1,expr2)
                                   3576 ; logical shift left expr1 by 
                                   3577 ; expr2 bits 
                                   3578 ; output:
                                   3579 ; 	A 		TK_INTGR
                                   3580 ;   X 		result 
                                   3581 ;------------------------------
      002A9A                       3582 lshift:
      00A434 05 CC 97         [ 4] 3583 	call func_args
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



      00A437 2F 90            [ 1] 3584 	cp a,#2 
      00A439 85 81            [ 1] 3585 	jreq 1$
      00A43B CC 16 AD         [ 2] 3586 	jp syntax_error
      002AA4                       3587 1$: _xpop 
      00A43B 90 89            [ 1]    1     ld a,(y)
      00A43D 89               [ 1]    2     ldw x,y 
      00A43E 72 5F            [ 2]    3     ldw x,(1,x)
      00A440 00 0E 90 CE      [ 2]    4     addw y,#CELL_SIZE 
      00A444 00 1C            [ 1] 3588     ldw y,x    
      002AAF                       3589 	_at_top  ; T@ 
      00A446 90 E6            [ 1]    1     ld a,(y)
      00A448 03               [ 1]    2     ldw x,y 
      00A449 A1 03            [ 2]    3     ldw x,(1,x)
      00A44B 27 15            [ 2] 3590 	tnzw y 
      00A44D 90 E6            [ 1] 3591 	jreq 4$
      00A44F 02               [ 1] 3592 2$:	rcf 
      00A450 C7               [ 2] 3593 	rlcw x 
      00A451 00               [ 1] 3594 	rlc a 
      00A452 0F 72            [ 2] 3595 	decw y 
      00A454 B9 00            [ 1] 3596 	jrne 2$
      002ABF                       3597 4$: _store_top  ; T! 
      00A456 0E 90            [ 1]    1     ld (y),a 
      00A458 C3 00 1E         [ 2]    2     ldw (1,y),x     
      00A45B 25 E9            [ 1] 3598 	ld a,#TK_INTGR
      00A45D A6               [ 4] 3599 	ret
                                   3600 
                                   3601 ;------------------------------
                                   3602 ; BASIC: RSHIFT(expr1,expr2)
                                   3603 ; logical shift right expr1 by 
                                   3604 ; expr2 bits.
                                   3605 ; output:
                                   3606 ; 	A 		TK_INTGR
                                   3607 ;   X 		result 
                                   3608 ;------------------------------
      002AC7                       3609 rshift:
      00A45E 0A CC 97         [ 4] 3610 	call func_args
      00A461 2F 02            [ 1] 3611 	cp a,#2 
      00A462 27 03            [ 1] 3612 	jreq 1$
      00A462 90 89 72         [ 2] 3613 	jp syntax_error
      002AD1                       3614 1$: _xpop 
      00A465 A9 00            [ 1]    1     ld a,(y)
      00A467 04               [ 1]    2     ldw x,y 
      00A468 1E 03            [ 2]    3     ldw x,(1,x)
      00A46A CD 94 7C 26      [ 2]    4     addw y,#CELL_SIZE 
      00A46E 04 90            [ 1] 3615     ldw y,x   
      002ADC                       3616 	_at_top  ; T@  
      00A470 85 20            [ 1]    1     ld a,(y)
      00A472 DA               [ 1]    2     ldw x,y 
      00A473 EE 01            [ 2]    3     ldw x,(1,x)
      00A473 85 5B            [ 2] 3617 	tnzw y 
      00A475 02 90            [ 1] 3618 	jreq 4$
      00A477 85               [ 1] 3619 2$:	rcf 
      00A478 81               [ 2] 3620 	rrcw x
      00A479 46               [ 1] 3621 	rrc a  
      00A479 72 00            [ 2] 3622 	decw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



      00A47B 00 23            [ 1] 3623 	jrne 2$
      002AEC                       3624 4$: _store_top  ; T! 
      00A47D 05 A6            [ 1]    1     ld (y),a 
      00A47F 06 CC 97         [ 2]    2     ldw (1,y),x     
      00A482 2F CD            [ 1] 3625 	ld a,#TK_INTGR
      00A484 9B               [ 4] 3626 	ret
                                   3627 
                                   3628 ;--------------------------
                                   3629 ; BASIC: FCPU integer
                                   3630 ; set CPU frequency 
                                   3631 ;-------------------------- 
                                   3632 
      002AF4                       3633 fcpu:
      00A485 17 A1            [ 1] 3634 	ld a,#TK_INTGR
      00A487 84 27 03         [ 4] 3635 	call expect 
      00A48A CC 97 2D         [ 4] 3636 	call get_int24 
      00A48D 90               [ 1] 3637 	ld a,xl 
      00A48E F6 93            [ 1] 3638 	and a,#7 
      00A490 EE 01 72         [ 1] 3639 	ld CLK_CKDIVR,a 
      00A493 A9               [ 4] 3640 	ret 
                                   3641 
                                   3642 ;------------------------------
                                   3643 ; BASIC: PMODE pin#, mode 
                                   3644 ; Arduino pin. 
                                   3645 ; define pin as input or output
                                   3646 ; pin#: {0..15}
                                   3647 ; mode: INPUT|OUTPUT  
                                   3648 ;------------------------------
                           000001  3649 	PINNO=1
                           000001  3650 	VSIZE=1
      002B03                       3651 pin_mode:
      002B03                       3652 	_vars VSIZE 
      00A494 00 03            [ 2]    1     sub sp,#VSIZE 
      00A496 9F 27 62         [ 4] 3653 	call arg_list 
      00A499 88 CD            [ 1] 3654 	cp a,#2 
      00A49B 98 2E            [ 1] 3655 	jreq 1$
      00A49D A1 80 27         [ 2] 3656 	jp syntax_error 
      002B0F                       3657 1$: _xpop 
      00A4A0 03 CC            [ 1]    1     ld a,(y)
      00A4A2 97               [ 1]    2     ldw x,y 
      00A4A3 2D CD            [ 2]    3     ldw x,(1,x)
      00A4A5 98 47 A3 A5      [ 2]    4     addw y,#CELL_SIZE 
      00A4A9 05 27            [ 1] 3658 	ldw y,x ; mode 
      002B1A                       3659 	_xpop ; Dx pin 
      00A4AB 08 A3            [ 1]    1     ld a,(y)
      00A4AD A5               [ 1]    2     ldw x,y 
      00A4AE 1F 27            [ 2]    3     ldw x,(1,x)
      00A4B0 03 CC 97 2D      [ 2]    4     addw y,#CELL_SIZE 
      00A4B4 CD 2B 60         [ 4] 3660 	call select_pin 
      00A4B4 84 89            [ 1] 3661 	ld (PINNO,sp),a  
      00A4B6 88 01            [ 1] 3662 	ld a,#1 
      00A4B7 0D 01            [ 1] 3663 	tnz (PINNO,sp)
      00A4B7 0A 01            [ 1] 3664 	jreq 4$
      00A4B9 27               [ 1] 3665 2$:	sll a 
      00A4BA 26 CD            [ 1] 3666 	dec (PINNO,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



      00A4BC 98 2E            [ 1] 3667 	jrne 2$ 
      00A4BE A1 84            [ 1] 3668 	ld (PINNO,sp),a
      00A4C0 27 07            [ 1] 3669 	ld a,(PINNO,sp)
      00A4C2 A1 03            [ 1] 3670 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A4C4 27 0D            [ 1] 3671 	ld (GPIO_CR1,x),a 
      00A4C6 CC 97 2D 01      [ 2] 3672 4$:	cpw y,#OUTP 
      00A4C9 27 10            [ 1] 3673 	jreq 6$
                                   3674 ; input mode
                                   3675 ; disable external interrupt 
      00A4C9 C6 00            [ 1] 3676 	ld a,(PINNO,sp)
      00A4CB 02               [ 1] 3677 	cpl a 
      00A4CC AB 03            [ 1] 3678 	and a,(GPIO_CR2,x)
      00A4CE C7 00            [ 1] 3679 	ld (GPIO_CR2,x),a 
                                   3680 ;clear bit in DDR for input mode 
      00A4D0 02 20            [ 1] 3681 	ld a,(PINNO,sp)
      00A4D2 03               [ 1] 3682 	cpl a 
      00A4D3 CD 98            [ 1] 3683 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A4D5 54 02            [ 1] 3684 	ld (GPIO_DDR,x),a 
      00A4D6 20 0C            [ 2] 3685 	jra 9$
      002B51                       3686 6$: ;output mode  
      00A4D6 CD 98            [ 1] 3687 	ld a,(PINNO,sp)
      00A4D8 2E A1            [ 1] 3688 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A4DA 08 27            [ 1] 3689 	ld (GPIO_DDR,x),a 
      00A4DC DA 5B            [ 1] 3690 	ld a,(PINNO,sp)
      00A4DE 03 20            [ 1] 3691 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A4E0 1A 04            [ 1] 3692 	ld (GPIO_CR2,x),a 
      00A4E1                       3693 9$:	
      002B5D                       3694 	_drop VSIZE 
      00A4E1 5B 01            [ 2]    1     addw sp,#VSIZE 
      00A4E3 CD               [ 4] 3695 	ret
                                   3696 
                                   3697 ;------------------------
                                   3698 ; select Arduino pin 
                                   3699 ; input:
                                   3700 ;   X 	 {0..15} Arduino Dx 
                                   3701 ; output:
                                   3702 ;   A     stm8s208 pin 
                                   3703 ;   X     base address s208 GPIO port 
                                   3704 ;---------------------------
      002B60                       3705 select_pin:
      00A4E4 A4               [ 2] 3706 	sllw x 
      00A4E5 0A CF 00         [ 2] 3707 	addw x,#arduino_to_8s208 
      00A4E8 1A               [ 2] 3708 	ldw x,(x)
      00A4E9 55               [ 1] 3709 	ld a,xl 
      00A4EA 00               [ 1] 3710 	push a 
      00A4EB 04               [ 1] 3711 	swapw x 
      00A4EC 00 02            [ 1] 3712 	ld a,#5 
      00A4EE 85               [ 4] 3713 	mul x,a 
      00A4EF A3 A5 05         [ 2] 3714 	addw x,#GPIO_BASE 
      00A4F2 26               [ 1] 3715 	pop a 
      00A4F3 05               [ 4] 3716 	ret 
                                   3717 ; translation from Arduino D0..D15 to stm8s208rb 
      002B70                       3718 arduino_to_8s208:
      00A4F4 CE 00                 3719 .byte 3,6 ; D0 
      00A4F6 1A 20                 3720 .byte 3,5 ; D1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



      00A4F8 19 00                 3721 .byte 4,0 ; D2 
      00A4F9 02 01                 3722 .byte 2,1 ; D3
      00A4F9 20 35                 3723 .byte 6,0 ; D4
      00A4FB 02 02                 3724 .byte 2,2 ; D5
      00A4FB 55 00                 3725 .byte 2,3 ; D6
      00A4FD 04 00                 3726 .byte 3,1 ; D7
      00A4FF 02 5B                 3727 .byte 3,3 ; D8
      00A501 02 CC                 3728 .byte 2,4 ; D9
      00A503 97 E0                 3729 .byte 4,5 ; D10
      00A505 02 06                 3730 .byte 2,6 ; D11
      00A505 72 00                 3731 .byte 2,7 ; D12
      00A507 00 23                 3732 .byte 2,5 ; D13
      00A509 05 A6                 3733 .byte 4,2 ; D14
      00A50B 06 CC                 3734 .byte 4,1 ; D15
                                   3735 
                                   3736 
                                   3737 ;------------------------------
                                   3738 ; BASIC: RND(expr)
                                   3739 ; return random number 
                                   3740 ; between 1 and expr inclusive
                                   3741 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   3742 ; input:
                                   3743 ; 	none 
                                   3744 ; output:
                                   3745 ;	xstack 	random positive integer 
                                   3746 ;------------------------------
      002B90                       3747 random:
      00A50D 97 2F 67         [ 4] 3748 	call func_args 
      00A50F A1 01            [ 1] 3749 	cp a,#1
      00A50F CD A4            [ 1] 3750 	jreq 1$
      00A511 0A 16 AD         [ 2] 3751 	jp syntax_error
      00A512                       3752 1$:  
      002B9A                       3753 	_xpop   
      00A512 CF 00            [ 1]    1     ld a,(y)
      00A514 05               [ 1]    2     ldw x,y 
      00A515 E6 02            [ 2]    3     ldw x,(1,x)
      00A517 C7 00 04 35      [ 2]    4     addw y,#CELL_SIZE 
      00A51B 03               [ 2] 3754 	pushw x 
      00A51C 00               [ 1] 3755 	push a  
      00A51D 02 81            [ 1] 3756 	ld a,#0x80 
      00A51F 15 01            [ 1] 3757 	bcp a,(1,sp)
      00A51F 72 00            [ 1] 3758 	jreq 2$
      00A521 00 23            [ 1] 3759 	ld a,#ERR_BAD_VALUE
      00A523 06 A6 06         [ 2] 3760 	jp tb_error
      002BB0                       3761 2$: 
                                   3762 ; acc16=(x<<5)^x 
      00A526 CC 97 2F         [ 2] 3763 	ldw x,seedx 
      00A529 81               [ 2] 3764 	sllw x 
      00A52A 58               [ 2] 3765 	sllw x 
      00A52A CD               [ 2] 3766 	sllw x 
      00A52B A4               [ 2] 3767 	sllw x 
      00A52C 0A               [ 2] 3768 	sllw x 
      00A52D CF               [ 1] 3769 	ld a,xh 
      00A52E 00 1A 14         [ 1] 3770 	xor a,seedx 
      00A530 C7 00 0D         [ 1] 3771 	ld acc16,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



      00A530 85               [ 1] 3772 	ld a,xl 
      00A531 52 04 89         [ 1] 3773 	xor a,seedx+1 
      00A534 CE 00 1A         [ 1] 3774 	ld acc8,a 
                                   3775 ; seedx=seedy 
      00A537 89 CE 00         [ 2] 3776 	ldw x,seedy 
      00A53A 05 1F 05         [ 2] 3777 	ldw seedx,x  
                                   3778 ; seedy=seedy^(seedy>>1)
      00A53D CE 00 01         [ 2] 3779 	ldw x,seedy 
      00A540 1F               [ 2] 3780 	srlw x 
      00A541 07               [ 1] 3781 	ld a,xh 
      00A542 85 20 CD         [ 1] 3782 	xor a,seedy 
      00A545 C7 00 16         [ 1] 3783 	ld seedy,a  
      00A545 72               [ 1] 3784 	ld a,xl 
      00A546 00 00 23         [ 1] 3785 	xor a,seedy+1 
      00A549 05 A6 06         [ 1] 3786 	ld seedy+1,a 
                                   3787 ; acc16>>3 
      00A54C CC 97 2F         [ 2] 3788 	ldw x,acc16 
      00A54F 54               [ 2] 3789 	srlw x 
      00A54F 1E               [ 2] 3790 	srlw x 
      00A550 03               [ 2] 3791 	srlw x 
                                   3792 ; x=acc16^x 
      00A551 CF               [ 1] 3793 	ld a,xh 
      00A552 00 05 E6         [ 1] 3794 	xor a,acc16 
      00A555 02 C7 00         [ 1] 3795 	ld acc16,a 
      00A558 04               [ 1] 3796 	ld a,xl 
      00A559 1E 05 CF         [ 1] 3797 	xor a,acc8 
      00A55C 00 01 85         [ 1] 3798 	ld acc8,a 
                                   3799 ; seedy=acc16^seedy 
      00A55F 5B 04 89         [ 1] 3800 	xor a,seedy+1
      00A562 81               [ 1] 3801 	ld xl,a 
      00A563 C6 00 0D         [ 1] 3802 	ld a,acc16 
      00A563 72 01 00         [ 1] 3803 	xor a,seedy
      00A566 23               [ 1] 3804 	ld xh,a 
      00A567 02 4F 81         [ 2] 3805 	ldw seedy,x 
                                   3806 ; return seedx_lo&0x7f:seedy modulo expr + 1 
      00A56A C6 00 15         [ 1] 3807 	ld a,seedx+1
      00A56A 72 09            [ 1] 3808 	and a,#127
      002C05                       3809 	_xpush 
      00A56C 00 23 12 5B      [ 2]    1     subw y,#CELL_SIZE
      00A570 02 CD            [ 1]    2     ld (y),a 
      00A572 A0 FD 5B         [ 2]    3     ldw (1,y),x 
      00A575 04               [ 1] 3810 	pop a 
      00A576 72               [ 2] 3811 	popw x 
      002C10                       3812 	_xpush 
      00A577 19 00 23 72      [ 2]    1     subw y,#CELL_SIZE
      00A57B 10 00            [ 1]    2     ld (y),a 
      00A57D 23 CC 97         [ 2]    3     ldw (1,y),x 
      00A580 D8 CE 00         [ 4] 3813 	call mod24 
      002C1C                       3814 	_xpop
      00A583 1C C3            [ 1]    1     ld a,(y)
      00A585 00               [ 1]    2     ldw x,y 
      00A586 1E 2B            [ 2]    3     ldw x,(1,x)
      00A588 0C AE 96 BC      [ 2]    4     addw y,#CELL_SIZE 
      00A58C CD 8A 21         [ 2] 3815 	addw x,#1 
      00A58F 55 00            [ 1] 3816 	adc a,#0  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



      00A591 04               [ 4] 3817 	ret 
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
      002C2B                       3829 words:
      002C2B                       3830 	_vars VSIZE
      00A592 00 02            [ 2]    1     sub sp,#VSIZE 
      00A594 81 02            [ 1] 3831 	clr (LLEN,sp)
      00A595 0F 03            [ 1] 3832 	clr (WCNT,sp)
      00A595 5B 02 33 36      [ 2] 3833 	ldw y,#kword_dict+2
      00A597 93               [ 1] 3834 0$:	ldw x,y
      00A597 CD               [ 1] 3835 	ld a,(x)
      00A598 9C E3            [ 1] 3836 	and a,#15 
      00A59A CD 94            [ 1] 3837 	ld (WLEN,sp),a 
      00A59C E1 5F            [ 1] 3838 	inc (WCNT,sp)
      00A59E CF               [ 1] 3839 1$:	incw x 
      00A59F 00               [ 1] 3840 	ld a,(x)
      00A5A0 07 72 5F         [ 4] 3841 	call putc 
      00A5A3 00 09            [ 1] 3842 	inc (LLEN,sp)
      00A5A5 72 5F            [ 1] 3843 	dec (WLEN,sp)
      00A5A7 00 0A            [ 1] 3844 	jrne 1$
      00A5A9 CE 00            [ 1] 3845 	ld a,#70
      00A5AB 1C CF            [ 1] 3846 	cp a,(LLEN,sp)
      00A5AD 00 05            [ 1] 3847 	jrmi 2$   
      00A5AF E6 02            [ 1] 3848 	ld a,#SPACE 
      00A5B1 C7 00 04         [ 4] 3849 	call putc 
      00A5B4 35 03            [ 1] 3850 	inc (LLEN,sp) 
      00A5B6 00 02            [ 2] 3851 	jra 3$
      00A5B8 72 10            [ 1] 3852 2$: ld a,#CR 
      00A5BA 00 23 CC         [ 4] 3853 	call putc 
      00A5BD 97 D8            [ 1] 3854 	clr (LLEN,sp)
      00A5BF 72 A2 00 02      [ 2] 3855 3$:	subw y,#2 
      00A5BF AE 17            [ 2] 3856 	ldw y,(y)
      00A5C1 FF 94            [ 1] 3857 	jrne 0$ 
      00A5C3 CC 97            [ 1] 3858 	ld a,#CR 
      00A5C5 B9 09 44         [ 4] 3859 	call putc  
      00A5C6 5F               [ 1] 3860 	clrw x 
      00A5C6 CD 98            [ 1] 3861 	ld a,(WCNT,sp)
      00A5C8 2E               [ 1] 3862 	ld xl,a 
      00A5C9 A1 85 27         [ 4] 3863 	call prt_i16 
      00A5CC 03 CC 97         [ 2] 3864 	ldw x,#words_count_msg
      00A5CF 2D CD 98         [ 4] 3865 	call puts 
      002C78                       3866 	_drop VSIZE 
      00A5D2 63 CF            [ 2]    1     addw sp,#VSIZE 
      00A5D4 00               [ 4] 3867 	ret 
      00A5D5 1A CD 89 CD 27 03 CD  3868 words_count_msg: .asciz " words in dictionary\n"
             89 D4 72 3F 00 1A 72
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal  5C-Bits]



             69 6F 6E 61 72 79 0A
             00
                                   3869 
                                   3870 
                                   3871 ;-----------------------------
                                   3872 ; BASIC: TIMER expr 
                                   3873 ; initialize count down timer 
                                   3874 ;-----------------------------
      002C91                       3875 set_timer:
      00A5E4 00 1B 72         [ 4] 3876 	call arg_list
      00A5E7 3F 00            [ 1] 3877 	cp a,#1 
      00A5E9 1A 72            [ 1] 3878 	jreq 1$
      00A5EB 5C 00 1B         [ 2] 3879 	jp syntax_error
      002C9B                       3880 1$: 
      002C9B                       3881 	_xpop  
      00A5EE 72 C7            [ 1]    1     ld a,(y)
      00A5F0 00               [ 1]    2     ldw x,y 
      00A5F1 1A 81            [ 2]    3     ldw x,(1,x)
      00A5F3 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A5F3 90 89 AE         [ 2] 3882 	ldw timer,x 
      00A5F6 00               [ 4] 3883 	ret 
                                   3884 
                                   3885 ;------------------------------
                                   3886 ; BASIC: TIMEOUT 
                                   3887 ; return state of timer 
                                   3888 ; output:
                                   3889 ;   A:X     0 not timeout 
                                   3890 ;   A:X     -1 timeout 
                                   3891 ;------------------------------
      002CA8                       3892 timeout:
      00A5F7 64 90 AE         [ 2] 3893 	ldw x,timer 
      00A5FA 03               [ 1] 3894 	clr a 
      00A5FB E8 20            [ 2] 3895 	jra logical_not 
                                   3896 
                                   3897 ;--------------------------------
                                   3898 ; BASIC NOT(expr) 
                                   3899 ; return logical complement of expr
                                   3900 ;--------------------------------
      002CAE                       3901 func_not:
      00A5FD 22 19 67         [ 4] 3902 	call func_args  
      00A5FE A1 01            [ 1] 3903 	cp a,#1
      00A5FE 90 89            [ 1] 3904 	jreq 1$
      00A600 CD 99 EC         [ 2] 3905 	jp syntax_error
      002CB8                       3906 1$: _xpop 
      00A603 A1 02            [ 1]    1     ld a,(y)
      00A605 27               [ 1]    2     ldw x,y 
      00A606 03 CC            [ 2]    3     ldw x,(1,x)
      00A608 97 2D 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A60A                       3907 logical_not: 
      00A60A 90               [ 1] 3908 	tnz a 
      00A60B F6 93            [ 1] 3909 	jrne 2$
      00A60D EE               [ 2] 3910 	tnzw x 
      00A60E 01 72            [ 1] 3911 	jrne 2$  
      00A610 A9               [ 1] 3912 	cpl a 
      00A611 00               [ 2] 3913 	cplw x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



      00A612 03               [ 4] 3914 	ret 
      00A613 89               [ 1] 3915 2$: clr a 
      00A614 90               [ 1] 3916 	clrw x 
      00A615 F6               [ 4] 3917 	ret 
                                   3918 
                                   3919 
                                   3920 ;-----------------------------------
                                   3921 ; BASIC: IWDGEN expr1 
                                   3922 ; enable independant watchdog timer
                                   3923 ; expr1 is delay in multiple of 62.5µsec
                                   3924 ; expr1 -> {1..16383}
                                   3925 ;-----------------------------------
      002CCD                       3926 enable_iwdg:
      00A616 93 EE 01         [ 4] 3927 	call arg_list
      00A619 72 A9            [ 1] 3928 	cp a,#1 
      00A61B 00 03            [ 1] 3929 	jreq 1$
      00A61D 90 93 85         [ 2] 3930 	jp syntax_error 
      00A620                       3931 1$: _xpop  
      00A620 89 AE            [ 1]    1     ld a,(y)
      00A622 F4               [ 1]    2     ldw x,y 
      00A623 24 65            [ 2]    3     ldw x,(1,x)
      00A625 90 A3 7A 12      [ 2]    4     addw y,#CELL_SIZE 
      00A629 2B 01            [ 1] 3932 	push #0
      00A62B 5C CC 50 E0      [ 1] 3933 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A62C 9E               [ 1] 3934 	ld a,xh 
      00A62C 9E C7            [ 1] 3935 	and a,#0x3f
      00A62E 53               [ 1] 3936 	ld xh,a  
      00A62F 0D 9F C7         [ 2] 3937 2$:	cpw x,#255
      00A632 53 0E            [ 2] 3938 	jrule 3$
      00A634 8C 56            [ 1] 3939 	inc (1,sp)
      00A636 9E               [ 1] 3940 	rcf 
      00A637 C7               [ 2] 3941 	rrcw x 
      00A638 53 0F            [ 2] 3942 	jra 2$
      00A63A 9F C7 53 10      [ 1] 3943 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A63E 72               [ 1] 3944 	pop a  
      00A63F 10 53 08         [ 1] 3945 	ld IWDG_PR,a 
      00A642 72               [ 1] 3946 	ld a,xl
      00A643 10               [ 1] 3947 	dec a 
      00A644 53 00 72 10      [ 1] 3948 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A648 53 04 85         [ 1] 3949 	ld IWDG_RLR,a 
      00A64B CD AA 9D 72      [ 1] 3950 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A64F 11               [ 4] 3951 	ret 
                                   3952 
                                   3953 
                                   3954 ;-----------------------------------
                                   3955 ; BASIC: IWDGREF  
                                   3956 ; refresh independant watchdog count down 
                                   3957 ; timer before it reset MCU. 
                                   3958 ;-----------------------------------
      002D0B                       3959 refresh_iwdg:
      00A650 53 08 72 11      [ 1] 3960 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A654 53               [ 4] 3961 	ret 
                                   3962 
                                   3963 
                                   3964 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



                                   3965 ; BASIC: LOG(expr)
                                   3966 ; return logarithm base 2 of expr 
                                   3967 ; this is the position of most significant
                                   3968 ; bit set. 
                                   3969 ; input: 
                                   3970 ; output:
                                   3971 ;   A     TK_INTGR 
                                   3972 ;   xstack log2 
                                   3973 ;*********************************
      002D10                       3974 log2:
      00A655 00 90 85         [ 4] 3975 	call func_args 
      00A658 81 01            [ 1] 3976 	cp a,#1 
      00A659 27 03            [ 1] 3977 	jreq 1$
      00A659 CD 99 EC         [ 2] 3978 	jp syntax_error 
      002D1A                       3979 1$: 
      002D1A                       3980 	_xpop    
      00A65C A1 02            [ 1]    1     ld a,(y)
      00A65E 27               [ 1]    2     ldw x,y 
      00A65F 12 A1            [ 2]    3     ldw x,(1,x)
      00A661 01 27 03 CC      [ 2]    4     addw y,#CELL_SIZE 
      00A665 97               [ 1] 3981 	tnz a
      00A666 2D 4F            [ 1] 3982 	jrne 2$ 
      00A668 5F               [ 2] 3983 	tnzw x 
      00A669 72 A2            [ 1] 3984 	jrne 2$
      00A66B 00 03            [ 1] 3985 	ld a,#ERR_BAD_VALUE
      00A66D 90 F7 90         [ 2] 3986 	jp tb_error 
      00A670 EF 01            [ 1] 3987 2$: push #24 
      00A672 90               [ 2] 3988 3$: rlcw x 
      00A673 E6               [ 1] 3989     rlc a 
      00A674 03 93            [ 1] 3990 	jrc 4$
      00A676 EE 04            [ 1] 3991 	dec (1,sp) 
      00A678 5D 27            [ 1] 3992 	jrne 3$
      00A67A 25               [ 1] 3993 4$: clrw x 
      00A67B 90               [ 1] 3994     pop a 
      00A67C F6               [ 1] 3995 	dec a
      00A67D 93               [ 1] 3996 	rlwa x  
      002D3C                       3997 9$:	
      00A67E EE               [ 4] 3998 	ret 
                                   3999 
                                   4000 ;-----------------------------------
                                   4001 ; BASIC: BIT(expr) 
                                   4002 ; expr ->{0..23}
                                   4003 ; return 2^expr 
                                   4004 ; output:
                                   4005 ;    A:X    2^expr 
                                   4006 ;-----------------------------------
      002D3D                       4007 bitmask:
      00A67F 01 72 A9         [ 4] 4008     call func_args 
      00A682 00 03            [ 1] 4009 	cp a,#1
      00A684 72 A9            [ 1] 4010 	jreq 1$
      00A686 00 03 9F         [ 2] 4011 	jp syntax_error 
      002D47                       4012 1$: _xpop 
      00A689 A4 07            [ 1]    1     ld a,(y)
      00A68B 4E               [ 1]    2     ldw x,y 
      00A68C C7 54            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



      00A68E 01 72 16 50      [ 2]    4     addw y,#CELL_SIZE 
      00A692 CA               [ 1] 4013 	ld a,xl 
      00A693 72 10 54         [ 2] 4014 	ldw x,#1 
      00A696 01 AE            [ 1] 4015 	and a,#23
      00A698 00 1B            [ 1] 4016 	jreq 9$
      00A69A 5A               [ 1] 4017 	push a 
      00A69B 9D               [ 1] 4018 	clr a 
      002D5A                       4019 2$: 
      00A69C 26               [ 2] 4020 	slaw x 
      00A69D FA               [ 1] 4021 	rlc a 	
      00A69E 20 08            [ 1] 4022 	dec (1,sp)
      00A6A0 72 11            [ 1] 4023 	jrne 2$ 
      002D60                       4024 4$:
      002D60                       4025     _drop 1 
      00A6A2 54 01            [ 2]    1     addw sp,#1 
      00A6A4 72               [ 4] 4026 9$:	ret 
                                   4027 
                                   4028 ;------------------------------
                                   4029 ; BASIC: INVERT(expr)
                                   4030 ; 1's complement 
                                   4031 ;--------------------------------
      002D63                       4032 invert:
      00A6A5 17 50 CA         [ 4] 4033 	call func_args
      00A6A8 A1 01            [ 1] 4034 	cp a,#1 
      00A6A8 81 03            [ 1] 4035 	jreq 1$
      00A6A9 CC 16 AD         [ 2] 4036 	jp syntax_error
      002D6D                       4037 1$: _xpop 
      00A6A9 CD 99            [ 1]    1     ld a,(y)
      00A6AB E7               [ 1]    2     ldw x,y 
      00A6AC A1 01            [ 2]    3     ldw x,(1,x)
      00A6AE 27 03 CC 97      [ 2]    4     addw y,#CELL_SIZE 
      00A6B2 2D               [ 1] 4038 	cpl a 
      00A6B3 90               [ 2] 4039 	cplw x 
      00A6B4 F6               [ 4] 4040 	ret 
                                   4041 
                                   4042 ;------------------------------
                                   4043 ; BASIC: DO 
                                   4044 ; initiate a DO ... UNTIL loop 
                                   4045 ;------------------------------
                           000003  4046 	DOLP_ADR=3 
                           000005  4047 	DOLP_INW=5
                           000004  4048 	VSIZE=4 
      002D79                       4049 do_loop:
      00A6B5 93               [ 2] 4050 	popw x 
      002D7A                       4051 	_vars VSIZE 
      00A6B6 EE 01            [ 2]    1     sub sp,#VSIZE 
      00A6B8 72               [ 2] 4052 	pushw x 
      00A6B9 A9 00 03         [ 2] 4053 	ldw x,basicptr 
      00A6BC A3 00            [ 2] 4054 	ldw (DOLP_ADR,sp),x
      00A6BE 05 23 05         [ 2] 4055 	ldw x,in.w 
      00A6C1 A6 0A            [ 2] 4056 	ldw (DOLP_INW,sp),x
      00A6C3 CC 97 2F 9F      [ 1] 4057 	inc loop_depth 
      00A6C7 C7               [ 4] 4058 	ret 
                                   4059 
                                   4060 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



                                   4061 ; BASIC: UNTIL expr 
                                   4062 ; loop if exprssion is false 
                                   4063 ; else terminate loop
                                   4064 ;--------------------------------
      002D8C                       4065 until: 
      00A6C8 00 0F A6 05      [ 1] 4066 	tnz loop_depth 
      00A6CC C0 00            [ 1] 4067 	jrne 1$ 
      00A6CE 0F C7 54         [ 2] 4068 	jp syntax_error 
      002D95                       4069 1$: 
      00A6D1 00 72 16         [ 4] 4070 	call condition  
      002D98                       4071 	_xpop 
      00A6D4 54 02            [ 1]    1     ld a,(y)
      00A6D6 72               [ 1]    2     ldw x,y 
      00A6D7 10 54            [ 2]    3     ldw x,(1,x)
      00A6D9 01 72 0F 54      [ 2]    4     addw y,#CELL_SIZE 
      00A6DD 00               [ 1] 4072 	tnz a 
      00A6DE FB CE            [ 1] 4073 	jrne 9$ 
      00A6E0 54 04            [ 2] 4074 	ldw x,(DOLP_ADR,sp)
      00A6E2 A6 84 81         [ 2] 4075 	ldw basicptr,x 
      00A6E5 E6 02            [ 1] 4076 	ld a,(2,x)
      00A6E5 52 01 CD         [ 1] 4077 	ld count,a 
      00A6E8 99 E7            [ 2] 4078 	ldw x,(DOLP_INW,sp)
      00A6EA A1 01 27         [ 2] 4079 	ldw in.w,x 
      00A6ED 03               [ 4] 4080 	ret 
      002DB4                       4081 9$:	; remove loop data from stack  
      00A6EE CC               [ 2] 4082 	popw x
      002DB5                       4083 	_drop VSIZE
      00A6EF 97 2D            [ 2]    1     addw sp,#VSIZE 
      00A6F1 90 F6 93 EE      [ 1] 4084 	dec loop_depth 
      00A6F5 01               [ 2] 4085 	jp (x)
                                   4086 
                                   4087 ;--------------------------
                                   4088 ; BASIC: PORTA...PORTI  
                                   4089 ;  return constant value 
                                   4090 ;  PORT  base address 
                                   4091 ;---------------------------
      002DBC                       4092 const_porta:
      00A6F6 72 A9 00         [ 2] 4093 	ldw x,#PA_BASE 
      00A6F9 03               [ 1] 4094 	clr a 
      00A6FA A3               [ 4] 4095 	ret 
      002DC1                       4096 const_portb:
      00A6FB 00 0F 23         [ 2] 4097 	ldw x,#PB_BASE 
      00A6FE 05               [ 1] 4098 	clr a 
      00A6FF A6               [ 4] 4099 	ret 
      002DC6                       4100 const_portc:
      00A700 0A CC 97         [ 2] 4101 	ldw x,#PC_BASE 
      00A703 2F               [ 1] 4102 	clr a 
      00A704 CD               [ 4] 4103 	ret 
      002DCB                       4104 const_portd:
      00A705 AB E0 6B         [ 2] 4105 	ldw x,#PD_BASE 
      00A708 01               [ 1] 4106 	clr a 
      00A709 E6               [ 4] 4107 	ret 
      002DD0                       4108 const_porte:
      00A70A 01 0D 01         [ 2] 4109 	ldw x,#PE_BASE 
      00A70D 27               [ 1] 4110 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



      00A70E 05               [ 4] 4111 	ret 
      002DD5                       4112 const_portf:
      00A70F 44 0A 01         [ 2] 4113 	ldw x,#PF_BASE 
      00A712 26               [ 1] 4114 	clr a 
      00A713 FB               [ 4] 4115 	ret 
      002DDA                       4116 const_portg:
      00A714 A4 01 5F         [ 2] 4117 	ldw x,#PG_BASE 
      00A717 97               [ 1] 4118 	clr a 
      00A718 4F               [ 4] 4119 	ret 
      002DDF                       4120 const_porth:
      00A719 5B 01 81         [ 2] 4121 	ldw x,#PH_BASE 
      00A71C 4F               [ 1] 4122 	clr a 
      00A71C 52               [ 4] 4123 	ret 
      002DE4                       4124 const_porti:
      00A71D 02 CD 99         [ 2] 4125 	ldw x,#PI_BASE 
      00A720 EC               [ 1] 4126 	clr a 
      00A721 A1               [ 4] 4127 	ret 
                                   4128 
                                   4129 ;-------------------------------
                                   4130 ; following return constant 
                                   4131 ; related to GPIO register offset 
                                   4132 ;---------------------------------
      002DE9                       4133 const_odr:
      00A722 02               [ 1] 4134 	clr a 
      00A723 27 03 CC         [ 2] 4135 	ldw x,#GPIO_ODR
      00A726 97               [ 4] 4136 	ret 
      002DEE                       4137 const_idr:
      00A727 2D               [ 1] 4138 	clr a 
      00A728 90 F6 93         [ 2] 4139 	ldw x,#GPIO_IDR
      00A72B EE               [ 4] 4140 	ret 
      002DF3                       4141 const_ddr:
      00A72C 01               [ 1] 4142 	clr a
      00A72D 72 A9 00         [ 2] 4143 	ldw x,#GPIO_DDR
      00A730 03               [ 4] 4144 	ret 
      002DF8                       4145 const_cr1:
      00A731 9F               [ 1] 4146 	clr a 
      00A732 6B 02 90         [ 2] 4147 	ldw x,#GPIO_CR1
      00A735 F6               [ 4] 4148 	ret 
      002DFD                       4149 const_cr2:
      00A736 93               [ 1] 4150 	clr a
      00A737 EE 01 72         [ 2] 4151 	ldw x,#GPIO_CR2
      00A73A A9               [ 4] 4152 	ret 
                                   4153 ;-------------------------
                                   4154 ; BASIC: POUT 
                                   4155 ;  constant for port mode
                                   4156 ;  used by PMODE 
                                   4157 ;  to set pin as output
                                   4158 ;------------------------
      002E02                       4159 const_output:
      00A73B 00               [ 1] 4160 	clr a 
      00A73C 03 A3 00         [ 2] 4161 	ldw x,#OUTP
      00A73F 0F               [ 4] 4162 	ret 
                                   4163 
                                   4164 ;-------------------------
                                   4165 ; BASIC: PINP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



                                   4166 ;  constant for port mode
                                   4167 ;  used by PMODE 
                                   4168 ;  to set pin as input
                                   4169 ;------------------------
      002E07                       4170 const_input:
      00A740 23               [ 1] 4171 	clr a  
      00A741 05 A6 0A         [ 2] 4172 	ldw x,#INP 
      00A744 CC               [ 4] 4173 	ret 
                                   4174 	
                                   4175 ;-----------------------
                                   4176 ; memory area constants
                                   4177 ;-----------------------
      002E0C                       4178 const_eeprom_base:
      00A745 97               [ 1] 4179 	clr a  
      00A746 2F CD AB         [ 2] 4180 	ldw x,#EEPROM_BASE 
      00A749 E0               [ 4] 4181 	ret 
                                   4182 
                                   4183 ;---------------------------
                                   4184 ; BASIC: DATA 
                                   4185 ; when the interpreter find 
                                   4186 ; a DATA line it skip it.
                                   4187 ;---------------------------
      002E11                       4188 data:
      00A74A 6B 01 A6 01 0D   [ 1] 4189 	mov in,count 
      00A74F 01               [ 4] 4190 	ret 
                                   4191 
                                   4192 ;------------------------------
                                   4193 ; check if it is a DATA line 
                                   4194 ; input: 
                                   4195 ;    X    line address 
                                   4196 ; output:
                                   4197 ;    Z    set if DATA line 
                                   4198 ;----------------------------
      002E17                       4199 is_data_line:
      00A750 27 05            [ 2] 4200 	ldw x,(4,x)
      00A752 48 0A 01         [ 2] 4201 	ldw x,(code_addr,x)
      00A755 26 FB 0D         [ 2] 4202 	cpw x,#data 
      00A758 02               [ 4] 4203 	ret 
                                   4204 
                                   4205 ;---------------------------
                                   4206 ; set DATA pointer at line# 
                                   4207 ; specified by X 
                                   4208 ;---------------------------
      002E20                       4209 data_line:
      00A759 26 05            [ 2] 4210 	pushw y 
      00A75B 43               [ 1] 4211 	clr a 
      00A75C E4 00 20         [ 4] 4212 	call search_lineno
      00A75F 02               [ 2] 4213 	tnzw x 
      00A760 EA 00            [ 1] 4214 	jrne 3$
      00A762 E7 00            [ 1] 4215 2$:	ld a,#ERR_NO_LINE 
      00A764 5B 02 81         [ 2] 4216 	jp tb_error
      00A767                       4217 3$: ; check if valid data line 
      00A767 72 00            [ 1] 4218     ldw y,x 
      00A769 00 23 02         [ 4] 4219 	call is_data_line 
      00A76C 4F 81            [ 1] 4220 	jrne 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



      00A76E                       4221 set_data_ptr: 	
      00A76E AE A7 95 CD      [ 2] 4222 	ldw data_ptr,y
      00A772 8A 21 5B         [ 1] 4223 	ld a,(2,y)
      00A775 02 52 04         [ 1] 4224 	ld data_len,a 
      00A778 CD A0 ED AE      [ 1] 4225 	mov data_ofs,#FIRST_DATA_ITEM 
      00A77C 16 68            [ 2] 4226 	popw y 
      00A77E CF               [ 4] 4227 	ret
                                   4228 
                                   4229 ;---------------------------------
                                   4230 ; BASIC: RESTORE [line#]
                                   4231 ; set data_ptr to first data line
                                   4232 ; if no DATA found pointer set to
                                   4233 ; zero.
                                   4234 ; if a line# is given as argument 
                                   4235 ; a data line with that number 
                                   4236 ; is searched and the data pointer 
                                   4237 ; is set to it. If there is no 
                                   4238 ; data line with that number 
                                   4239 ; the program is interrupted. 
                                   4240 ;---------------------------------
      002E46                       4241 restore:
      00A77F 00 05 7F 72      [ 1] 4242 	clr data_ptr 
      00A783 5F 00 04 5F      [ 1] 4243 	clr data_ptr+1
      00A787 CF 00 01 72      [ 1] 4244 	clr data_ofs 
      00A78B 11 00 23 72      [ 1] 4245 	clr data_len
      00A78F 18 00 23         [ 4] 4246 	call next_token 
      00A792 CC 97            [ 1] 4247 	cp a,#TK_INTGR
      00A794 D8 0A            [ 1] 4248 	jrne 0$
      00A796 62 72 65         [ 4] 4249 	call get_int24 
      00A799 61 6B            [ 2] 4250 	jra data_line 
      002E62                       4251 0$:	
      002E62                       4252 	_unget_token  
      00A79B 20 70 6F 69 6E   [ 1]    1      mov in,in.saved  
      00A7A0 74 2C 20         [ 2] 4253 	ldw x,txtbgn
      00A7A3 52 55            [ 2] 4254 	pushw y 
                                   4255 ; search first DATA line 
      002E6C                       4256 data_search_loop: 	
      00A7A5 4E 20 74         [ 2] 4257 	cpw x,txtend
      00A7A8 6F 20            [ 1] 4258 	jruge restore_error 
      00A7AA 72 65            [ 1] 4259 	ldw y,x 
      00A7AC 73 75 6D         [ 4] 4260 	call is_data_line 
      00A7AF 65 2E            [ 1] 4261 	jreq set_data_ptr
      002E78                       4262 try_next_line: 
      00A7B1 0A               [ 1] 4263 	ldw x,y 
      00A7B2 00 02            [ 1] 4264 	ld a,(2,x)
      00A7B3 C7 00 0E         [ 1] 4265 	ld acc8,a 
      00A7B3 72 01 00 23      [ 1] 4266 	clr acc16 
      00A7B7 01 81 00 0D      [ 2] 4267 	addw x,acc16 
      00A7B9 20 E4            [ 2] 4268 	jra data_search_loop
      002E88                       4269 restore_error:	
      00A7B9 CD 95            [ 1] 4270     ld a,#ERR_NO_DATA 
      00A7BB 89 81 AF         [ 2] 4271 	jp tb_error 
                                   4272 
                                   4273 
                                   4274 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



                                   4275 ; BASIC: READ 
                                   4276 ; return next data item | 0 
                                   4277 ;---------------------------------
                           000001  4278 	CTX_BPTR=1 
                           000003  4279 	CTX_IN=3 
                           000004  4280 	CTX_COUNT=4 
                           000005  4281 	INT24=5
                           000007  4282 	VSIZE=7 
      00A7BD                       4283 read:
      002E8D                       4284 	_vars  VSIZE 
      00A7BD 72 5F            [ 2]    1     sub sp,#VSIZE 
      002E8F                       4285 read01:	
      00A7BF 00 19 52         [ 1] 4286 	ld a,data_ofs
      00A7C2 03 CD 98         [ 1] 4287 	cp a,data_len 
      00A7C5 2E A1            [ 1] 4288 	jreq 2$ ; end of line  
      00A7C7 04 27 03         [ 4] 4289 	call save_context
      00A7CA CC 97 2D         [ 2] 4290 	ldw x,data_ptr 
      00A7CD CD 98 7D         [ 2] 4291 	ldw basicptr,x 
      00A7D0 A4 DF A1 45 26   [ 1] 4292 	mov in,data_ofs 
      00A7D5 0C AE 40 00 CF   [ 1] 4293 	mov count,data_len  
      00A7DA 00 1A AE         [ 4] 4294 	call expression 
      00A7DD 47 FF            [ 1] 4295 	cp a,#TK_INTGR 
      00A7DF 4F 20            [ 1] 4296 	jreq 1$ 
      00A7E1 15 A1 46         [ 2] 4297 	jp syntax_error 
      002EB4                       4298 1$:
      00A7E4 27 06 AE         [ 4] 4299 	call next_token ; skip comma
      00A7E7 96 6D CC         [ 2] 4300 	ldw x,basicptr 
      00A7EA 97 2F 06         [ 2] 4301 	ldw data_ptr,x 
      00A7EC 55 00 01 00 08   [ 1] 4302 	mov data_ofs,in 
      00A7EC AE B6 80         [ 4] 4303 	call rest_context
      002EC5                       4304 	_xpop 
      00A7EF CF 00            [ 1]    1     ld a,(y)
      00A7F1 1A               [ 1]    2     ldw x,y 
      00A7F2 A6 02            [ 2]    3     ldw x,(1,x)
      00A7F4 AE 7F FF 03      [ 2]    4     addw y,#CELL_SIZE 
      00A7F7                       4305 	_drop VSIZE 
      00A7F7 6B 01            [ 2]    1     addw sp,#VSIZE 
      00A7F9 1F               [ 4] 4306 	ret 
      002ED1                       4307 2$: ; end of line reached 
      00A7FA 02 CD 87 C2      [ 2] 4308 	ldw y, data_ptr 
      00A7FE 72 5F 00 06      [ 1] 4309 	clr data_ptr
      00A7FE CD 89 44 27      [ 1] 4310 	clr data_ptr+1   
      00A802 08 A6 45 CD      [ 1] 4311 	clr data_ofs 
      00A806 89 C4 CD 88      [ 1] 4312 	clr data_len 
      00A80A 40 AE 00         [ 4] 4313 	call try_next_line 
      00A80D 80 CD            [ 2] 4314 	jra read01
                                   4315 
                                   4316 
                                   4317 ;---------------------------------
                                   4318 ; BASIC: SPIEN clkdiv, 0|1  
                                   4319 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4320 ; if clkdiv==-1 disable SPI
                                   4321 ; 0|1 -> disable|enable  
                                   4322 ;--------------------------------- 
                           000005  4323 SPI_CS_BIT=5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      002EEA                       4324 spi_enable:
      00A80F 89 36 7B         [ 4] 4325 	call arg_list 
      00A812 01 1E            [ 1] 4326 	cp a,#2
      00A814 02 72            [ 1] 4327 	jreq 1$
      00A816 B0 00 1A         [ 2] 4328 	jp syntax_error 
      002EF4                       4329 1$: 
      00A819 C2 00 19 22      [ 1] 4330 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A81D E0               [ 2] 4331 	popw x  
      00A81E CD               [ 2] 4332 	tnzw x 
      00A81F 95 89            [ 1] 4333 	jreq spi_disable 
      00A821 1E               [ 2] 4334 	popw x 
      00A822 02 A3            [ 1] 4335 	ld a,#(1<<SPI_CR1_BR)
      00A824 47               [ 4] 4336 	mul x,a 
      00A825 FF               [ 1] 4337 	ld a,xl 
      00A826 26 03 CD         [ 1] 4338 	ld SPI_CR1,a 
                                   4339 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A829 9D AC 50 14      [ 1] 4340 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A82B 72 1A 50 16      [ 1] 4341 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4342 ; configure SPI as master mode 0.	
      00A82B 5B 03 81 00      [ 1] 4343 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4344 ; ~CS line controlled by sofware 	
      00A82E 72 12 52 01      [ 1] 4345 	bset SPI_CR2,#SPI_CR2_SSM 
      00A82E CE B6 80 C3      [ 1] 4346     bset SPI_CR2,#SPI_CR2_SSI 
                                   4347 ; enable SPI
      00A832 A8 EE 81 00      [ 1] 4348 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A835 81               [ 4] 4349 	ret 
      002F1D                       4350 spi_disable:
      002F1D                       4351 	_drop #2; throw first argument.
      00A835 88 4D            [ 2]    1     addw sp,##2 
                                   4352 ; wait spi idle 
      00A837 27 0A            [ 1] 4353 1$:	ld a,#0x82 
      00A839 F6 5C 90         [ 1] 4354 	and a,SPI_SR
      00A83C F7 90            [ 1] 4355 	cp a,#2 
      00A83E 5C 0A            [ 1] 4356 	jrne 1$
      00A840 01 26 F6 84      [ 1] 4357 	bres SPI_CR1,#SPI_CR1_SPE
      00A844 81 13 50 C7      [ 1] 4358 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A845 72 1B 50 16      [ 1] 4359 	bres PE_DDR,#SPI_CS_BIT 
      00A845 88               [ 4] 4360 	ret 
                                   4361 
      002F35                       4362 spi_clear_error:
      00A846 90 AE            [ 1] 4363 	ld a,#0x78 
      00A848 16 B8 90         [ 1] 4364 	bcp a,SPI_SR 
      00A84B 89 A6            [ 1] 4365 	jreq 1$
      00A84D 80 90 7F 90      [ 1] 4366 	clr SPI_SR 
      00A851 5C               [ 4] 4367 1$: ret 
                                   4368 
      002F41                       4369 spi_send_byte:
      00A852 4A               [ 1] 4370 	push a 
      00A853 26 F9 90         [ 4] 4371 	call spi_clear_error
      00A856 85               [ 1] 4372 	pop a 
      00A857 84 81 52 03 FB   [ 2] 4373 	btjf SPI_SR,#SPI_SR_TXE,.
      00A859 C7 52 04         [ 1] 4374 	ld SPI_DR,a
      00A859 89 90 89 52 06   [ 2] 4375 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A85E CD A8 2E         [ 1] 4376 	ld a,SPI_DR 
      00A861 26               [ 4] 4377 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



                                   4378 
      002F57                       4379 spi_rcv_byte:
      00A862 09 AE            [ 1] 4380 	ld a,#255
      00A864 A8 F0 CD 8A 21   [ 2] 4381 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A869 CC A8 E8         [ 1] 4382 	ld a,SPI_DR 
      00A86C 81               [ 4] 4383 	ret
                                   4384 
                                   4385 ;------------------------------
                                   4386 ; BASIC: SPIWR byte [,byte]
                                   4387 ; write 1 or more byte
                                   4388 ;------------------------------
      002F62                       4389 spi_write:
      00A86C CE 00 1C         [ 4] 4390 	call expression
      00A86F C3 00            [ 1] 4391 	cp a,#TK_INTGR 
      00A871 1E 25            [ 1] 4392 	jreq 1$
      00A873 09 AE A9         [ 2] 4393 	jp syntax_error 
      002F6C                       4394 1$:	
      00A876 32               [ 1] 4395 	ld a,xl 
      00A877 CD 8A 21         [ 4] 4396 	call spi_send_byte 
      00A87A CC A8 E8         [ 4] 4397 	call next_token 
      00A87D A1 08            [ 1] 4398 	cp a,#TK_COMMA 
      00A87D CD 88            [ 1] 4399 	jrne 2$ 
      00A87F 02 72            [ 2] 4400 	jra spi_write 
      00A881 5F               [ 1] 4401 2$:	tnz a 
      00A882 00 19            [ 1] 4402 	jreq 3$
      002F7C                       4403 	_unget_token  
      00A884 AE B6 80 CF 00   [ 1]    1      mov in,in.saved  
      00A889 1A               [ 4] 4404 3$:	ret 
                                   4405 
                                   4406 
                                   4407 ;-------------------------------
                                   4408 ; BASIC: SPIRD 	
                                   4409 ; read one byte from SPI 
                                   4410 ;-------------------------------
      002F82                       4411 spi_read:
      00A88A CD 9E CC         [ 4] 4412 	call spi_rcv_byte 
      00A88D 1F               [ 1] 4413 	clrw x 
      00A88E 05               [ 1] 4414 	ld xl,a 
      00A88F 0F               [ 1] 4415 	clr a  
      00A890 03               [ 4] 4416 	ret 
                                   4417 
                                   4418 ;------------------------------
                                   4419 ; BASIC: SPISEL 0|1 
                                   4420 ; set state of ~CS line
                                   4421 ; 0|1 deselect|select  
                                   4422 ;------------------------------
      002F89                       4423 spi_select:
      00A891 CD A8 45         [ 4] 4424 	call next_token 
      00A894 CE A8            [ 1] 4425 	cp a,#TK_INTGR 
      00A896 EE 90            [ 1] 4426 	jreq 1$
      00A898 FF 72 A9         [ 2] 4427 	jp syntax_error 
      00A89B 00               [ 2] 4428 1$: tnzw x  
      00A89C 02 1E            [ 1] 4429 	jreq cs_high 
      00A89E 05 90 FF 72      [ 1] 4430 	bres PE_ODR,#SPI_CS_BIT
      00A8A2 A9               [ 4] 4431 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



      002F9B                       4432 cs_high: 
      00A8A3 00 02 A6 7C      [ 1] 4433 	bset PE_ODR,#SPI_CS_BIT
      00A8A7 6B               [ 4] 4434 	ret 
                                   4435 
                                   4436 ;-------------------------------
                                   4437 ; BASIC: PAD 
                                   4438 ; Return pad buffer address.
                                   4439 ;------------------------------
      002FA0                       4440 pad_ref:
      00A8A8 04 A3 00         [ 2] 4441 	ldw x,#pad 
      00A8AB 7C               [ 1] 4442 	clr a
      00A8AC 22               [ 4] 4443 	ret 
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
      002FA5                       4466 kword_end:
      002FA5                       4467 	_dict_entry,3+F_XOR,XOR,XOR_IDX ; xor operator
      00A8AD 01 9F                    1 	.word LINK 
                           002FA7     2 	LINK=.
      002FA7                          3 XOR:
      00A8AF 6B                       4 	.byte 3+F_XOR   	
      00A8B0 04 CE 00                 5 	.ascii "XOR"
      00A8B3 1C 1F                    6 	.word XOR_IDX 
      002FAD                       4468 	_dict_entry,5,WRITE,WRITE_IDX;write  
      00A8B5 01 A7                    1 	.word LINK 
                           002FAF     2 	LINK=.
      00A8B6                          3 WRITE:
      00A8B6 1E                       4 	.byte 5   	
      00A8B7 01 7B 04 CD A8           5 	.ascii "WRITE"
      00A8BC 35 1F                    6 	.word WRITE_IDX 
      002FB7                       4469 	_dict_entry,5,WORDS,WORDS_IDX;words 
      00A8BE 01 AE                    1 	.word LINK 
                           002FB9     2 	LINK=.
      002FB9                          3 WORDS:
      00A8C0 16                       4 	.byte 5   	
      00A8C1 B8 CD 88 1C AE           5 	.ascii "WORDS"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



      00A8C6 00 80                    6 	.word WORDS_IDX 
      002FC1                       4470 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      00A8C8 CD 89                    1 	.word LINK 
                           002FC3     2 	LINK=.
      002FC3                          3 WAIT:
      00A8CA 36                       4 	.byte 4   	
      00A8CB 1E 01 C3 00              5 	.ascii "WAIT"
      00A8CF 1E 24                    6 	.word WAIT_IDX 
      002FCA                       4471 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      00A8D1 16 1E                    1 	.word LINK 
                           002FCC     2 	LINK=.
      002FCC                          3 USR:
      00A8D3 05                       4 	.byte 3+F_IFUNC   	
      00A8D4 72 F0 03                 5 	.ascii "USR"
      00A8D7 1F 05                    6 	.word USR_IDX 
      002FD2                       4472 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      00A8D9 A6 80                    1 	.word LINK 
                           002FD4     2 	LINK=.
      002FD4                          3 UNTIL:
      00A8DB A3                       4 	.byte 5   	
      00A8DC 00 80 24 01 9F           5 	.ascii "UNTIL"
      00A8E1 6B 04                    6 	.word UNTIL_IDX 
      002FDC                       4473 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      00A8E3 CD A8                    1 	.word LINK 
                           002FDE     2 	LINK=.
      002FDE                          3 UFLASH:
      00A8E5 45                       4 	.byte 6+F_IFUNC   	
      00A8E6 20 CE 5B 06 90 85        5 	.ascii "UFLASH"
      00A8EC 85 81                    6 	.word UFLASH_IDX 
      002FE7                       4474 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      00A8EE 42 43                    1 	.word LINK 
                           002FE9     2 	LINK=.
      002FE9                          3 UBOUND:
      00A8F0 43                       4 	.byte 6+F_IFUNC   	
      00A8F1 61 6E 27 74 20 66        5 	.ascii "UBOUND"
      00A8F7 6C 61                    6 	.word UBOUND_IDX 
      002FF2                       4475 	_dict_entry,4,TONE,TONE_IDX;tone  
      00A8F9 73 68                    1 	.word LINK 
                           002FF4     2 	LINK=.
      002FF4                          3 TONE:
      00A8FB 20                       4 	.byte 4   	
      00A8FC 61 70 70 6C              5 	.ascii "TONE"
      00A900 69 63                    6 	.word TONE_IDX 
      002FFB                       4476 	_dict_entry,2,TO,TO_IDX;to
      00A902 61 74                    1 	.word LINK 
                           002FFD     2 	LINK=.
      002FFD                          3 TO:
      00A904 69                       4 	.byte 2   	
      00A905 6F 6E                    5 	.ascii "TO"
      00A907 2C 20                    6 	.word TO_IDX 
      003002                       4477 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00A909 61 6C                    1 	.word LINK 
                           003004     2 	LINK=.
      003004                          3 TIMER:
      00A90B 72                       4 	.byte 5   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



      00A90C 65 61 64 79 20           5 	.ascii "TIMER"
      00A911 6F 6E                    6 	.word TIMER_IDX 
      00300C                       4478 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00A913 65 20                    1 	.word LINK 
                           00300E     2 	LINK=.
      00300E                          3 TIMEOUT:
      00A915 69                       4 	.byte 7+F_IFUNC   	
      00A916 6E 20 46 4C 41 53 48     5 	.ascii "TIMEOUT"
      00A91D 0A 75                    6 	.word TMROUT_IDX 
      003018                       4479 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00A91F 73 65                    1 	.word LINK 
                           00301A     2 	LINK=.
      00301A                          3 TICKS:
      00A921 20                       4 	.byte 5+F_IFUNC   	
      00A922 45 52 41 53 45           5 	.ascii "TICKS"
      00A927 20 5C                    6 	.word TICKS_IDX 
      003022                       4480 	_dict_entry,4,STOP,STOP_IDX;stop 
      00A929 46 20                    1 	.word LINK 
                           003024     2 	LINK=.
      003024                          3 STOP:
      00A92B 62                       4 	.byte 4   	
      00A92C 65 66 6F 72              5 	.ascii "STOP"
      00A930 65 00                    6 	.word STOP_IDX 
      00302B                       4481 	_dict_entry,4,STEP,STEP_IDX;step 
      00A932 4E 6F                    1 	.word LINK 
                           00302D     2 	LINK=.
      00302D                          3 STEP:
      00A934 20                       4 	.byte 4   	
      00A935 61 70 70 6C              5 	.ascii "STEP"
      00A939 69 63                    6 	.word STEP_IDX 
      003034                       4482 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      00A93B 61 74                    1 	.word LINK 
                           003036     2 	LINK=.
      003036                          3 SPIWR:
      00A93D 69                       4 	.byte 5   	
      00A93E 6F 6E 20 69 6E           5 	.ascii "SPIWR"
      00A943 20 52                    6 	.word SPIWR_IDX 
      00303E                       4483 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00A945 41 4D                    1 	.word LINK 
                           003040     2 	LINK=.
      003040                          3 SPISEL:
      00A947 00                       4 	.byte 6   	
      00A948 53 50 49 53 45 4C        5 	.ascii "SPISEL"
      00A948 CD 9B                    6 	.word SPISEL_IDX 
      003049                       4484 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      00A94A 17 A1                    1 	.word LINK 
                           00304B     2 	LINK=.
      00304B                          3 SPIRD:
      00A94C 84                       4 	.byte 5+F_IFUNC   	
      00A94D 27 03 CC 97 2D           5 	.ascii "SPIRD"
      00A952 90 F6                    6 	.word SPIRD_IDX 
      003053                       4485 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      00A954 93 EE                    1 	.word LINK 
                           003055     2 	LINK=.
      003055                          3 SPIEN:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



      00A956 01                       4 	.byte 5   	
      00A957 72 A9 00 03 C7           5 	.ascii "SPIEN"
      00A95C 00 19                    6 	.word SPIEN_IDX 
      00305D                       4486 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      00A95E CF 00                    1 	.word LINK 
                           00305F     2 	LINK=.
      00305F                          3 SLEEP:
      00A960 1A                       4 	.byte 5   	
      00A961 53 4C 45 45 50           5 	.ascii "SLEEP"
      00A961 CD 98                    6 	.word SLEEP_IDX 
      003067                       4487     _dict_entry,4,SIZE,SIZE_IDX; cmd_size 
      00A963 2E A1                    1 	.word LINK 
                           003069     2 	LINK=.
      003069                          3 SIZE:
      00A965 08                       4 	.byte 4   	
      00A966 27 02 20 20              5 	.ascii "SIZE"
      00A96A CD 9B                    6 	.word SIZE_IDX 
      003070                       4488 	_dict_entry,4,SAVE,SAVE_IDX ;save_app 
      00A96C 17 A1                    1 	.word LINK 
                           003072     2 	LINK=.
      003072                          3 SAVE:
      00A96E 84                       4 	.byte 4   	
      00A96F 27 03 CC 97              5 	.ascii "SAVE"
      00A973 2D 90                    6 	.word SAVE_IDX 
      003079                       4489 	_dict_entry 3,RUN,RUN_IDX;run
      00A975 F6 93                    1 	.word LINK 
                           00307B     2 	LINK=.
      00307B                          3 RUN:
      00A977 EE                       4 	.byte 3   	
      00A978 01 72 A9                 5 	.ascii "RUN"
      00A97B 00 03                    6 	.word RUN_IDX 
      003081                       4490 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      00A97D 9F 5F                    1 	.word LINK 
                           003083     2 	LINK=.
      003083                          3 RSHIFT:
      00A97F CD                       4 	.byte 6+F_IFUNC   	
      00A980 88 66 AE 00 01 CD        5 	.ascii "RSHIFT"
      00A986 89 36                    6 	.word RSHIFT_IDX 
      00308C                       4491 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      00A988 20 D7                    1 	.word LINK 
                           00308E     2 	LINK=.
      00A98A                          3 RND:
      00A98A 81                       4 	.byte 3+F_IFUNC   	
      00A98B 52 4E 44                 5 	.ascii "RND"
      00A98B CD 99                    6 	.word RND_IDX 
      003094                       4492 	_dict_entry,6,RETURN,RET_IDX;return 
      00A98D E7 A1                    1 	.word LINK 
                           003096     2 	LINK=.
      003096                          3 RETURN:
      00A98F 01                       4 	.byte 6   	
      00A990 27 03 CC 97 2D 90        5 	.ascii "RETURN"
      00A996 F6 93                    6 	.word RET_IDX 
      00309F                       4493 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00A998 EE 01                    1 	.word LINK 
                           0030A1     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



      0030A1                          3 RESTORE:
      00A99A 72                       4 	.byte 7   	
      00A99B A9 00 03 9F A4 7F 81     5 	.ascii "RESTORE"
      00A9A2 00 84                    6 	.word REST_IDX 
      0030AB                       4494 	_dict_entry 3,REM,REM_IDX;remark 
      00A9A2 A6 06                    1 	.word LINK 
                           0030AD     2 	LINK=.
      0030AD                          3 REM:
      00A9A4 CD                       4 	.byte 3   	
      00A9A5 99 DA CD                 5 	.ascii "REM"
      00A9A8 98 2E                    6 	.word REM_IDX 
      0030B3                       4495 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      00A9AA A1 02                    1 	.word LINK 
                           0030B5     2 	LINK=.
      0030B5                          3 REBOOT:
      00A9AC 27                       4 	.byte 6   	
      00A9AD 0E A1 04 27 12 A1        5 	.ascii "REBOOT"
      00A9B3 82 27                    6 	.word RBT_IDX 
      0030BE                       4496 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      00A9B5 03 CC                    1 	.word LINK 
                           0030C0     2 	LINK=.
      0030C0                          3 READ:
      00A9B7 97                       4 	.byte 4+F_IFUNC   	
      00A9B8 2D 45 41 44              5 	.ascii "READ"
      00A9B9 00 7E                    6 	.word READ_IDX 
      0030C7                       4497 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      00A9B9 FD 20                    1 	.word LINK 
                           0030C9     2 	LINK=.
      0030C9                          3 QKEY:
      00A9BB 0B                       4 	.byte 4+F_IFUNC   	
      00A9BC 51 4B 45 59              5 	.ascii "QKEY"
      00A9BC F6 88                    6 	.word QKEY_IDX 
      0030D0                       4498 	_dict_entry,5+F_IFUNC,PORTI,PRTI_IDX;const_porti 
      00A9BE CD 98                    1 	.word LINK 
                           0030D2     2 	LINK=.
      0030D2                          3 PORTI:
      00A9C0 54                       4 	.byte 5+F_IFUNC   	
      00A9C1 84 20 03 54 49           5 	.ascii "PORTI"
      00A9C4 00 7A                    6 	.word PRTI_IDX 
      0030DA                       4499 	_dict_entry,5+F_IFUNC,PORTH,PRTH_IDX;const_porth 
      00A9C4 CD 98                    1 	.word LINK 
                           0030DC     2 	LINK=.
      0030DC                          3 PORTH:
      00A9C6 7D                       4 	.byte 5+F_IFUNC   	
      00A9C7 5F 02 72 A2 00           5 	.ascii "PORTH"
      00A9CC 03 90                    6 	.word PRTH_IDX 
      0030E4                       4500 	_dict_entry,5+F_IFUNC,PORTG,PRTG_IDX;const_portg 
      00A9CE F7 90                    1 	.word LINK 
                           0030E6     2 	LINK=.
      0030E6                          3 PORTG:
      00A9D0 EF                       4 	.byte 5+F_IFUNC   	
      00A9D1 01 A6 07 CD 99           5 	.ascii "PORTG"
      00A9D6 DA 76                    6 	.word PRTG_IDX 
      00A9D7                       4501 	_dict_entry,5+F_IFUNC,PORTF,PRTF_IDX;const_portf
      00A9D7 90 F6                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



                           0030F0     2 	LINK=.
      0030F0                          3 PORTF:
      00A9D9 93                       4 	.byte 5+F_IFUNC   	
      00A9DA EE 01 72 A9 00           5 	.ascii "PORTF"
      00A9DF 03 81                    6 	.word PRTF_IDX 
      00A9E1                       4502 	_dict_entry,5+F_IFUNC,PORTE,PRTE_IDX;const_porte
      00A9E1 CD 89                    1 	.word LINK 
                           0030FA     2 	LINK=.
      0030FA                          3 PORTE:
      00A9E3 D4                       4 	.byte 5+F_IFUNC   	
      00A9E4 81 4F 52 54 45           5 	.ascii "PORTE"
      00A9E5 00 72                    6 	.word PRTE_IDX 
      003102                       4503 	_dict_entry,5+F_IFUNC,PORTD,PRTD_IDX;const_portd
      00A9E5 5F C6                    1 	.word LINK 
                           003104     2 	LINK=.
      003104                          3 PORTD:
      00A9E7 00                       4 	.byte 5+F_IFUNC   	
      00A9E8 2F C0 00 30 27           5 	.ascii "PORTD"
      00A9ED 03 53                    6 	.word PRTD_IDX 
      00310C                       4504 	_dict_entry,5+F_IFUNC,PORTC,PRTC_IDX;const_portc
      00A9EF A6 FF                    1 	.word LINK 
                           00310E     2 	LINK=.
      00A9F1                          3 PORTC:
      00A9F1 81                       4 	.byte 5+F_IFUNC   	
      00A9F2 50 4F 52 54 43           5 	.ascii "PORTC"
      00A9F2 CD 99                    6 	.word PRTC_IDX 
      003116                       4505 	_dict_entry,5+F_IFUNC,PORTB,PRTB_IDX;const_portb
      00A9F4 E7 A1                    1 	.word LINK 
                           003118     2 	LINK=.
      003118                          3 PORTB:
      00A9F6 02                       4 	.byte 5+F_IFUNC   	
      00A9F7 27 03 CC 97 2D           5 	.ascii "PORTB"
      00A9FC 90 E6                    6 	.word PRTB_IDX 
      003120                       4506 	_dict_entry,5+F_IFUNC,PORTA,PRTA_IDX;const_porta 
      00A9FE 03 93                    1 	.word LINK 
                           003122     2 	LINK=.
      003122                          3 PORTA:
      00AA00 EE                       4 	.byte 5+F_IFUNC   	
      00AA01 04 A3 50 00 2B           5 	.ascii "PORTA"
      00AA06 16 A3                    6 	.word PRTA_IDX 
      00312A                       4507 	_dict_entry 5,PRINT,PRT_IDX;print 
      00AA08 50 29                    1 	.word LINK 
                           00312C     2 	LINK=.
      00312C                          3 PRINT:
      00AA0A 2A                       4 	.byte 5   	
      00AA0B 11 89 90 F6 93           5 	.ascii "PRINT"
      00AA10 EE 01                    6 	.word PRT_IDX 
      003134                       4508 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      00AA12 72 A9                    1 	.word LINK 
                           003136     2 	LINK=.
      003136                          3 POUT:
      00AA14 00                       4 	.byte 4+F_IFUNC   	
      00AA15 03 72 FB 01              5 	.ascii "POUT"
      00AA19 5B 02                    6 	.word POUT_IDX 
      00313D                       4509 	_dict_entry,4,POKE,POKE_IDX;poke 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



      00AA1B 4F 81                    1 	.word LINK 
                           00313F     2 	LINK=.
      00AA1D                          3 POKE:
      00AA1D A6                       4 	.byte 4   	
      00AA1E 0A CC 97 2F              5 	.ascii "POKE"
      00AA22 00 64                    6 	.word POKE_IDX 
      003146                       4510 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      00AA22 CE B6                    1 	.word LINK 
                           003148     2 	LINK=.
      003148                          3 PMODE:
      00AA24 80                       4 	.byte 5   	
      00AA25 A3 10 93 27 08           5 	.ascii "PMODE"
      00AA2A CE B6                    6 	.word PMODE_IDX 
      003150                       4511 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      00AA2C 82 1C                    1 	.word LINK 
                           003152     2 	LINK=.
      003152                          3 PINP:
      00AA2E B6                       4 	.byte 4+F_IFUNC   	
      00AA2F 84 20 03 AE              5 	.ascii "PINP"
      00AA33 B6 80                    6 	.word PINP_IDX 
      003159                       4512 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      00AA35 4F 81                    1 	.word LINK 
                           00315B     2 	LINK=.
      00AA37                          3 PEEK:
      00AA37 89                       4 	.byte 4+F_IFUNC   	
      00AA38 90 89 CD 99              5 	.ascii "PEEK"
      00AA3C E7 A1                    6 	.word PEEK_IDX 
      003162                       4513 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      00AA3E 01 27                    1 	.word LINK 
                           003164     2 	LINK=.
      003164                          3 PAUSE:
      00AA40 07                       4 	.byte 5   	
      00AA41 A1 02 27 03 CC           5 	.ascii "PAUSE"
      00AA46 97 2D                    6 	.word PAUSE_IDX 
      00316C                       4514 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      00AA48 88 90                    1 	.word LINK 
                           00316E     2 	LINK=.
      00316E                          3 PAD:
      00AA4A F6                       4 	.byte 3+F_IFUNC   	
      00AA4B 93 EE 01                 5 	.ascii "PAD"
      00AA4E 72 A9                    6 	.word PAD_IDX 
      003174                       4515 	_dict_entry,2+F_OR,OR,OR_IDX; OR operator 
      00AA50 00 03                    1 	.word LINK 
                           003176     2 	LINK=.
      003176                          3 OR:
      00AA52 90                       4 	.byte 2+F_OR   	
      00AA53 93 84                    5 	.ascii "OR"
      00AA55 A1 01                    6 	.word OR_IDX 
      00317B                       4516 	_dict_entry,2,ON,ON_IDX; cmd_on 
      00AA57 27 0A                    1 	.word LINK 
                           00317D     2 	LINK=.
      00317D                          3 ON:
      00AA59 90                       4 	.byte 2   	
      00AA5A F6 93                    5 	.ascii "ON"
      00AA5C EE 01                    6 	.word ON_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



      003182                       4517 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      00AA5E 72 A9                    1 	.word LINK 
                           003184     2 	LINK=.
      003184                          3 ODR:
      00AA60 00                       4 	.byte 3+F_IFUNC   	
      00AA61 03 51 90                 5 	.ascii "ODR"
      00AA64 FD 88                    6 	.word ODR_IDX 
      00318A                       4518 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      00AA66 90 9F                    1 	.word LINK 
                           00318C     2 	LINK=.
      00318C                          3 NOT:
      00AA68 72                       4 	.byte 3+F_IFUNC   	
      00AA69 A2 00 03                 5 	.ascii "NOT"
      00AA6C 90 F7                    6 	.word NOT_IDX 
      003192                       4519 	_dict_entry,4,NEXT,NEXT_IDX;next 
      00AA6E 90 EF                    1 	.word LINK 
                           003194     2 	LINK=.
      003194                          3 NEXT:
      00AA70 01                       4 	.byte 4   	
      00AA71 84 90 85 85              5 	.ascii "NEXT"
      00AA75 81 52                    6 	.word NEXT_IDX 
      00AA76                       4520 	_dict_entry,3,NEW,NEW_IDX;new
      00AA76 72 0D                    1 	.word LINK 
                           00319D     2 	LINK=.
      00319D                          3 NEW:
      00AA78 52                       4 	.byte 3   	
      00AA79 30 FB 8E                 5 	.ascii "NEW"
      00AA7C CC 81                    6 	.word NEW_IDX 
      0031A3                       4521 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      00AA7E 43 9D                    1 	.word LINK 
                           0031A5     2 	LINK=.
      00AA7F                          3 LSHIFT:
      00AA7F 72                       4 	.byte 6+F_IFUNC   	
      00AA80 0D 52 30 FB 72 16        5 	.ascii "LSHIFT"
      00AA86 00 23                    6 	.word LSHIFT_IDX 
      0031AE                       4522 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      00AA88 8E 81                    1 	.word LINK 
                           0031B0     2 	LINK=.
      00AA8A                          3 LOG:
      00AA8A CD                       4 	.byte 3+F_IFUNC   	
      00AA8B 9B 17 A1                 5 	.ascii "LOG"
      00AA8E 84 27                    6 	.word LOG_IDX 
      0031B6                       4523 	_dict_entry 4,LIST,LIST_IDX;list
      00AA90 03 CC                    1 	.word LINK 
                           0031B8     2 	LINK=.
      0031B8                          3 LIST:
      00AA92 97                       4 	.byte 4   	
      00AA93 2D 90 F6 93              5 	.ascii "LIST"
      00AA97 EE 01                    6 	.word LIST_IDX 
      0031BF                       4524 	_dict_entry 3,LET,LET_IDX;let 
      00AA99 72 A9                    1 	.word LINK 
                           0031C1     2 	LINK=.
      0031C1                          3 LET:
      00AA9B 00                       4 	.byte 3   	
      00AA9C 03 45 54                 5 	.ascii "LET"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



      00AA9D 00 4A                    6 	.word LET_IDX 
      0031C7                       4525 	_dict_entry,3+F_CFUNC,KEY,KEY_IDX;key 
      00AA9D CF 00                    1 	.word LINK 
                           0031C9     2 	LINK=.
      0031C9                          3 KEY:
      00AA9F 13                       4 	.byte 3+F_CFUNC   	
      00AAA0 CE 00 13                 5 	.ascii "KEY"
      00AAA3 5D 27                    6 	.word KEY_IDX 
      0031CF                       4526 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      00AAA5 03 8F                    1 	.word LINK 
                           0031D1     2 	LINK=.
      0031D1                          3 IWDGREF:
      00AAA7 26                       4 	.byte 7   	
      00AAA8 F7 57 44 47 52 45 46     5 	.ascii "IWDGREF"
      00AAA9 00 46                    6 	.word IWDGREF_IDX 
      0031DB                       4527 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      00AAA9 81 D1                    1 	.word LINK 
                           0031DD     2 	LINK=.
      00AAAA                          3 IWDGEN:
      00AAAA CD                       4 	.byte 6   	
      00AAAB 9B 17 A1 84 27 03        5 	.ascii "IWDGEN"
      00AAB1 CC 97                    6 	.word IWDGEN_IDX 
      0031E6                       4528 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      00AAB3 2D 90                    1 	.word LINK 
                           0031E8     2 	LINK=.
      0031E8                          3 INVERT:
      00AAB5 F6                       4 	.byte 6+F_IFUNC   	
      00AAB6 93 EE 01 72 A9 00        5 	.ascii "INVERT"
      00AABC 03 42                    6 	.word INVERT_IDX 
      00AABD                       4529 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      00AABD A3 14                    1 	.word LINK 
                           0031F3     2 	LINK=.
      0031F3                          3 INPUT:
      00AABF 00                       4 	.byte 5   	
      00AAC0 2B 0C 35 0F 50           5 	.ascii "INPUT"
      00AAC5 F2 A6                    6 	.word INPUT_IDX 
      0031FB                       4530 	_dict_entry,2,IF,IF_IDX;if 
      00AAC7 1E 62                    1 	.word LINK 
                           0031FD     2 	LINK=.
      0031FD                          3 IF:
      00AAC9 A6                       4 	.byte 2   	
      00AACA 10 62                    5 	.ascii "IF"
      00AACC 20 1E                    6 	.word IF_IDX 
      00AACE                       4531 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      00AACE A3 08                    1 	.word LINK 
                           003204     2 	LINK=.
      003204                          3 IDR:
      00AAD0 00                       4 	.byte 3+F_IFUNC   	
      00AAD1 2B 09 35                 5 	.ascii "IDR"
      00AAD4 0E 50                    6 	.word IDR_IDX 
      00320A                       4532 	_dict_entry,3,HEX,HEX_IDX;hex_base
      00AAD6 F2 A6                    1 	.word LINK 
                           00320C     2 	LINK=.
      00320C                          3 HEX:
      00AAD8 50                       4 	.byte 3   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



      00AAD9 62 20 10                 5 	.ascii "HEX"
      00AADC 00 3A                    6 	.word HEX_IDX 
      003212                       4533 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      00AADC 35 07                    1 	.word LINK 
                           003214     2 	LINK=.
      003214                          3 GOTO:
      00AADE 50                       4 	.byte 4   	
      00AADF F2 4F 54 4F              5 	.ascii "GOTO"
      00AAE0 00 38                    6 	.word GOTO_IDX 
      00321B                       4534 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      00AAE0 A3 00                    1 	.word LINK 
                           00321D     2 	LINK=.
      00321D                          3 GOSUB:
      00AAE2 40                       4 	.byte 5   	
      00AAE3 23 07 72 5C 50           5 	.ascii "GOSUB"
      00AAE8 F2 54                    6 	.word GOSUB_IDX 
      003225                       4535 	_dict_entry,3,GET,GET_IDX; cmd_get 
      00AAEA 20 F4                    1 	.word LINK 
                           003227     2 	LINK=.
      00AAEC                          3 GET:
      00AAEC 9F                       4 	.byte 3   	
      00AAED 4A 27 01                 5 	.ascii "GET"
      00AAF0 4A BA                    6 	.word GET_IDX 
      00AAF1                       4536 	_dict_entry,4+F_IFUNC,FREE,FREE_IDX;free
      00AAF1 A4 3E                    1 	.word LINK 
                           00322F     2 	LINK=.
      00322F                          3 FREE:
      00AAF3 C7                       4 	.byte 4+F_IFUNC   	
      00AAF4 50 F1 72 18              5 	.ascii "FREE"
      00AAF8 50 F0                    6 	.word FREE_IDX 
      003236                       4537 	_dict_entry,3,FOR,FOR_IDX;for 
      00AAFA 8E 81                    1 	.word LINK 
                           003238     2 	LINK=.
      00AAFC                          3 FOR:
      00AAFC C6                       4 	.byte 3   	
      00AAFD 00 10 CE                 5 	.ascii "FOR"
      00AB00 00 11                    6 	.word FOR_IDX 
      00323E                       4538 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      00AB02 81 38                    1 	.word LINK 
                           003240     2 	LINK=.
      00AB03                          3 FCPU:
      00AB03 CD                       4 	.byte 4   	
      00AB04 99 E7 A1 01              5 	.ascii "FCPU"
      00AB08 27 03                    6 	.word FCPU_IDX 
      003247                       4539 	_dict_entry,5,ERASE,ERASE_IDX; erase 
      00AB0A CC 97                    1 	.word LINK 
                           003249     2 	LINK=.
      003249                          3 ERASE:
      00AB0C 2D                       4 	.byte 5   	
      00AB0D 45 52 41 53 45           5 	.ascii "ERASE"
      00AB0D CD 82                    6 	.word ERASE_IDX 
      003251                       4540 	_dict_entry,3,END,END_IDX;cmd_end  
      00AB0F 5F 90                    1 	.word LINK 
                           003253     2 	LINK=.
      003253                          3 END:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



      00AB11 F6                       4 	.byte 3   	
      00AB12 93 EE 01                 5 	.ascii "END"
      00AB15 72 A9                    6 	.word END_IDX 
      003259                       4541 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      00AB17 00 03                    1 	.word LINK 
                           00325B     2 	LINK=.
      00325B                          3 EEPROM:
      00AB19 81                       4 	.byte 6+F_IFUNC   	
      00AB1A 45 45 50 52 4F 4D        5 	.ascii "EEPROM"
      00AB1A CD 99                    6 	.word EEPROM_IDX 
      003264                       4542 	_dict_entry,6+F_IFUNC,EEFREE,EEFREE_IDX; func_eefree 
      00AB1C E7 A1                    1 	.word LINK 
                           003266     2 	LINK=.
      003266                          3 EEFREE:
      00AB1E 02                       4 	.byte 6+F_IFUNC   	
      00AB1F 27 03 CC 97 2D 90        5 	.ascii "EEFREE"
      00AB25 F6 93                    6 	.word EEFREE_IDX 
      00326F                       4543 	_dict_entry,4,EDIT,EDIT_IDX ; edit 
      00AB27 EE 01                    1 	.word LINK 
                           003271     2 	LINK=.
      003271                          3 EDIT:
      00AB29 72                       4 	.byte 4   	
      00AB2A A9 00 03 90              5 	.ascii "EDIT"
      00AB2E 93 90                    6 	.word EDIT_IDX 
      003278                       4544 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      00AB30 F6 93                    1 	.word LINK 
                           00327A     2 	LINK=.
      00327A                          3 DWRITE:
      00AB32 EE                       4 	.byte 6+F_CMD   	
      00AB33 01 90 5D 27 07 98        5 	.ascii "DWRITE"
      00AB39 59 49                    6 	.word DWRITE_IDX 
      003283                       4545 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      00AB3B 90 5A                    1 	.word LINK 
                           003285     2 	LINK=.
      003285                          3 DREAD:
      00AB3D 26                       4 	.byte 5+F_IFUNC   	
      00AB3E F9 90 F7 90 EF           5 	.ascii "DREAD"
      00AB43 01 A6                    6 	.word DREAD_IDX 
      00328D                       4546 	_dict_entry,2,DO,DO_IDX;do_loop
      00AB45 84 81                    1 	.word LINK 
                           00328F     2 	LINK=.
      00AB47                          3 DO:
      00AB47 CD                       4 	.byte 2   	
      00AB48 99 E7                    5 	.ascii "DO"
      00AB4A A1 02                    6 	.word DO_IDX 
      003294                       4547 	_dict_entry,3,DEC,DEC_IDX;dec_base
      00AB4C 27 03                    1 	.word LINK 
                           003296     2 	LINK=.
      003296                          3 DEC:
      00AB4E CC                       4 	.byte 3   	
      00AB4F 97 2D 90                 5 	.ascii "DEC"
      00AB52 F6 93                    6 	.word DEC_IDX 
      00329C                       4548 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      00AB54 EE 01                    1 	.word LINK 
                           00329E     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



      00329E                          3 DDR:
      00AB56 72                       4 	.byte 3+F_IFUNC   	
      00AB57 A9 00 03                 5 	.ascii "DDR"
      00AB5A 90 93                    6 	.word DDR_IDX 
      0032A4                       4549 	_dict_entry,4,DATA,DATA_IDX;data  
      00AB5C 90 F6                    1 	.word LINK 
                           0032A6     2 	LINK=.
      0032A6                          3 DATA:
      00AB5E 93                       4 	.byte 4   	
      00AB5F EE 01 90 5D              5 	.ascii "DATA"
      00AB63 27 07                    6 	.word DATA_IDX 
      0032AD                       4550 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      00AB65 98 56                    1 	.word LINK 
                           0032AF     2 	LINK=.
      0032AF                          3 CRL:
      00AB67 46                       4 	.byte 3+F_IFUNC   	
      00AB68 90 5A 26                 5 	.ascii "CRL"
      00AB6B F9 90                    6 	.word CRL_IDX 
      0032B5                       4551 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      00AB6D F7 90                    1 	.word LINK 
                           0032B7     2 	LINK=.
      0032B7                          3 CRH:
      00AB6F EF                       4 	.byte 3+F_IFUNC   	
      00AB70 01 A6 84                 5 	.ascii "CRH"
      00AB73 81 18                    6 	.word CRH_IDX 
      00AB74                       4552 	_dict_entry,5,CONST,CONST_IDX; cmd_const 
      00AB74 A6 84                    1 	.word LINK 
                           0032BF     2 	LINK=.
      0032BF                          3 CONST:
      00AB76 CD                       4 	.byte 5   	
      00AB77 99 DA CD 98 6D           5 	.ascii "CONST"
      00AB7C 9F A4                    6 	.word CONST_IDX 
      0032C7                       4553 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      00AB7E 07 C7                    1 	.word LINK 
                           0032C9     2 	LINK=.
      0032C9                          3 CHAR:
      00AB80 50                       4 	.byte 4+F_CFUNC   	
      00AB81 C6 81 41 52              5 	.ascii "CHAR"
      00AB83 00 16                    6 	.word CHAR_IDX 
      0032D0                       4554 	_dict_entry,3,BYE,BYE_IDX;bye 
      00AB83 52 01                    1 	.word LINK 
                           0032D2     2 	LINK=.
      0032D2                          3 BYE:
      00AB85 CD                       4 	.byte 3   	
      00AB86 99 EC A1                 5 	.ascii "BYE"
      00AB89 02 27                    6 	.word BYE_IDX 
      0032D8                       4555 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      00AB8B 03 CC                    1 	.word LINK 
                           0032DA     2 	LINK=.
      0032DA                          3 BTOGL:
      00AB8D 97                       4 	.byte 5   	
      00AB8E 2D 90 F6 93 EE           5 	.ascii "BTOGL"
      00AB93 01 72                    6 	.word BTOGL_IDX 
      0032E2                       4556 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      00AB95 A9 00                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



                           0032E4     2 	LINK=.
      0032E4                          3 BTEST:
      00AB97 03                       4 	.byte 5+F_IFUNC   	
      00AB98 90 93 90 F6 93           5 	.ascii "BTEST"
      00AB9D EE 01                    6 	.word BTEST_IDX 
      0032EC                       4557 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      00AB9F 72 A9                    1 	.word LINK 
                           0032EE     2 	LINK=.
      0032EE                          3 BSET:
      00ABA1 00                       4 	.byte 4   	
      00ABA2 03 CD AB E0              5 	.ascii "BSET"
      00ABA6 6B 01                    6 	.word BSET_IDX 
      0032F5                       4558 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      00ABA8 A6 01                    1 	.word LINK 
                           0032F7     2 	LINK=.
      0032F7                          3 BRES:
      00ABAA 0D                       4 	.byte 4   	
      00ABAB 01 27 0D 48              5 	.ascii "BRES"
      00ABAF 0A 01                    6 	.word BRES_IDX 
      0032FE                       4559 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      00ABB1 26 FB                    1 	.word LINK 
                           003300     2 	LINK=.
      003300                          3 BIT:
      00ABB3 6B                       4 	.byte 3+F_IFUNC   	
      00ABB4 01 7B 01                 5 	.ascii "BIT"
      00ABB7 EA 03                    6 	.word BIT_IDX 
      003306                       4560 	_dict_entry,3,AWU,AWU_IDX;awu 
      00ABB9 E7 03                    1 	.word LINK 
                           003308     2 	LINK=.
      003308                          3 AWU:
      00ABBB 90                       4 	.byte 3   	
      00ABBC A3 00 01                 5 	.ascii "AWU"
      00ABBF 27 10                    6 	.word AWU_IDX 
      00330E                       4561 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      00ABC1 7B 01                    1 	.word LINK 
                           003310     2 	LINK=.
      003310                          3 ASC:
      00ABC3 43                       4 	.byte 3+F_IFUNC   	
      00ABC4 E4 04 E7                 5 	.ascii "ASC"
      00ABC7 04 7B                    6 	.word ASC_IDX 
      003316                       4562 	_dict_entry,3+F_AND,AND,AND_IDX ; AND operator 
      00ABC9 01 43                    1 	.word LINK 
                           003318     2 	LINK=.
      003318                          3 AND:
      00ABCB E4                       4 	.byte 3+F_AND   	
      00ABCC 02 E7 02                 5 	.ascii "AND"
      00ABCF 20 0C                    6 	.word AND_IDX 
      00ABD1                       4563 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      00ABD1 7B 01                    1 	.word LINK 
                           003320     2 	LINK=.
      003320                          3 ADCREAD:
      00ABD3 EA                       4 	.byte 7+F_IFUNC   	
      00ABD4 02 E7 02 7B 01 EA 04     5 	.ascii "ADCREAD"
      00ABDB E7 04                    6 	.word ADCREAD_IDX 
      00ABDD                       4564 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal [24-Bits]



      00ABDD 5B 01                    1 	.word LINK 
                           00332C     2 	LINK=.
      00332C                          3 ADCON:
      00ABDF 81                       4 	.byte 5   	
      00ABE0 41 44 43 4F 4E           5 	.ascii "ADCON"
      00ABE0 58 1C                    6 	.word ADCON_IDX 
      003334                       4565 kword_dict::
      003334                       4566 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      00ABE2 AB F0                    1 	.word LINK 
                           003336     2 	LINK=.
      003336                          3 ABS:
      00ABE4 FE                       4 	.byte 3+F_IFUNC   	
      00ABE5 9F 88 5E                 5 	.ascii "ABS"
      00ABE8 A6 05                    6 	.word ABS_IDX 
                                   4567 
                                   4568 ;comands and fonctions address table 	
      00333C                       4569 code_addr::
      00ABEA 42 1C 50 00 84 81 29  4570 	.word abs,power_adc,analog_read,ascii,awu,bitmask ; 0..7
             22 2A 2A 2D 3D
      00ABF0 21 91 21 6F 21 D6 21  4571 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             B4 29 F6 29 0B 2D FD
      00ABF0 03 06 03 05 04 00 02  4572 	.word const_cr1,data,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
             01 06 00 02 02 02 03
      00ABFE 03 01 03 03 02 04 04  4573 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto ; 24..31 
             05 02 06 02 07 02 05
             04 02 04 01
      00AC10 1C 10 2D EE 22 4F 20  4574 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             8D 2D 63 2C CD 2D 0B
             29 61
      00AC10 CD 99 E7 A1 01 27 03  4575 	.word let,list,log2,lshift,next,new ; 40..47
             CC 97 2D 27 33
      00AC1A 2C AE 2D E9 2F A0 2A  4576 	.word func_not,const_odr,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             0A 2B 03 22 2E 2E 07
      00AC1A 90 F6 93 EE 01 72 A9  4577 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             00 03 89 88 A6 80 15
             01 27
      00AC2A 05 A6 0A CC 97 2F 2D  4578 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             E4 29 65 2E 8D 00 C3
             21 2C
      00AC30 2E 46 24 C5 2B 90 2A  4579 	.word restore,return, random,rshift,run,free ; 72..79
             C7 24 E3 1C 1A
      00AC30 CE 00 15 58 58 58 58  4580 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             58 9E C8 00 15 C7 00
             0E 9F
      00AC40 C8 00 16 C7 00 0F CE  4581 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             00 17 CF 00 15 CE 00
             17 54
      00AC50 9E C8 00 17 C7 00 17  4582 	.word wait,words,write,cmd_size,cmd_on,cmd_get,cmd_const ; 96..99
             9F C8 00 18 C7 00 18
      00AC5E CE 00 0E 54           4583 	.word func_eefree,0 
                                   4584 
                                   4585 
                                   4586 
                                   4587 
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
      0033FE                         30 test:
      0033FE                         31     _vars VSIZE 
      00AC62 54 54            [ 2]    1     sub sp,#VSIZE 
      00AC64 9E C8 00         [ 2]   32     ldw x,#LOOP_CNT
      00AC67 0E C7            [ 2]   33     ldw (CNTR,sp),x  
      00AC69 00 0E 9F         [ 2]   34     ldw x,ticks 
      00AC6C C8 00            [ 2]   35     ldw (T,sp),x
      00340A                         36 1$: ; test add24 
      00AC6E 0F C7            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00AC70 00 0F C8         [ 2]   38     ldw x,#VAL1&0XFFFF
      00AC73 00 18 97         [ 1]   39     ld acc24,a 
      00AC76 C6 00 0E         [ 2]   40     ldw acc24+1,x  
      00AC79 C8 00            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00AC7B 17 95 CF         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00AC7E 00 17 C6         [ 4]   43     call add24 
      00AC81 00 16            [ 2]   44     ldw x,(CNTR,sp)
      00AC83 A4 7F 72         [ 2]   45     subw x,#1
      00AC86 A2 00            [ 2]   46     ldw (CNTR,sp),x 
      00AC88 03 90            [ 1]   47     jrne 1$
      00AC8A F7 90 EF         [ 4]   48     call prt_acc24
      00AC8D 01 84            [ 1]   49     ld a,#SPACE 
      00AC8F 85 72 A2         [ 4]   50     call putc 
      00AC92 00 03 90         [ 2]   51     ldw x,ticks 
      00AC95 F7 90 EF         [ 2]   52     subw x,(T,sp)
      00AC98 01 CD 84         [ 4]   53     call prt_i16  
      00AC9B 55 90            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
Hexadecimal [24-Bits]



      00AC9D F6 93 EE         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00ACA0 01 72 A9         [ 2]   58     ldw x,LOOP_CNT
      00ACA3 00 03            [ 2]   59     ldw (CNTR,sp),x 
      00ACA5 1C 00 01         [ 2]   60     ldw x,ticks 
      00ACA8 A9 00            [ 2]   61     ldw (T,sp),x 
      003446                         62 2$: 
      00ACAA 81 02            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00ACAB AE FF FF         [ 2]   64     ldw x,#VAL1&0XFFFF
      00ACAB 52 03 0F         [ 1]   65     ld acc24,a 
      00ACAE 02 0F 03         [ 2]   66     ldw acc24+1,x  
      00ACB1 90 AE            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00ACB3 B3 B6 93         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00ACB6 F6 A4 0F         [ 4]   69     call mul24 
      00ACB9 6B 01            [ 2]   70     ldw x,(CNTR,sp)
      00ACBB 0C 03 5C         [ 2]   71     subw x,#1
      00ACBE F6 CD            [ 2]   72     ldw (CNTR,sp),x 
      00ACC0 89 C4            [ 1]   73     jrne 2$ 
      00ACC2 0C 02 0A         [ 4]   74    call prt_acc24 
      00ACC5 01 26            [ 1]   75    ld a,#SPACE 
      00ACC7 F5 A6 46         [ 4]   76    call putc 
      00ACCA 11 02 2B         [ 2]   77     ldw x,ticks 
      00ACCD 09 A6 20         [ 2]   78     subw x,(T,sp)
      00ACD0 CD 89 C4         [ 4]   79     call prt_i16 
      00ACD3 0C 02            [ 1]   80     ld a,#CR 
      00ACD5 20 07 A6         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00ACD8 0D CD 89         [ 2]   83     ldw x,LOOP_CNT
      00ACDB C4 0F            [ 2]   84     ldw (CNTR,sp),x 
      00ACDD 02 72 A2         [ 2]   85     ldw x,ticks 
      00ACE0 00 02            [ 2]   86     ldw (T,sp),x 
      003482                         87 3$: 
      00ACE2 90 FE            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00ACE4 26 CF A6         [ 2]   89     ldw x,#VAL1&0XFFFF
      00ACE7 0D CD 89         [ 1]   90     ld acc24,a 
      00ACEA C4 5F 7B         [ 2]   91     ldw acc24+1,x  
      00ACED 03 97            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00ACEF CD 98 83         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00ACF2 AE AC FB         [ 4]   94     call mul24 
      00ACF5 CD 8A            [ 2]   95     ldw x,(CNTR,sp)
      00ACF7 21 5B 03         [ 2]   96     subw x,#1
      00ACFA 81 20            [ 2]   97     ldw (CNTR,sp),x 
      00ACFC 77 6F            [ 1]   98     jrne 3$ 
      00ACFE 72 64 73         [ 4]   99     call prt_acc24    
      00AD01 20 69            [ 1]  100     ld a,#SPACE 
      00AD03 6E 20 64         [ 4]  101     call putc 
      00AD06 69 63 74         [ 2]  102     ldw x,ticks 
      00AD09 69 6F 6E         [ 2]  103     subw x,(T,sp)
      00AD0C 61 72 79         [ 4]  104     call prt_i16 
      00AD0F 0A 00            [ 1]  105     ld a,#CR 
      00AD11 CD 09 44         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00AD11 CD 99 EC         [ 2]  108     ldw x,LOOP_CNT
      00AD14 A1 01            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



      00AD16 27 03 CC         [ 2]  110     ldw x,ticks 
      00AD19 97 2D            [ 2]  111     ldw (T,sp),x 
      00AD1B                        112 4$:
      00AD1B 90 F6            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00AD1D 93 EE 01         [ 2]  114     ldw x,#VAL1&0XFFFF
      00AD20 72 A9 00         [ 1]  115     ld acc24,a 
      00AD23 03 CF 00         [ 2]  116     ldw acc24+1,x  
      00AD26 13 81            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00AD28 AE FF FD         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00AD28 CE 00 13         [ 4]  119     call mul24 
      00AD2B 4F 20            [ 2]  120     ldw x,(CNTR,sp)
      00AD2D 13 00 01         [ 2]  121     subw x,#1
      00AD2E 1F 03            [ 2]  122     ldw (CNTR,sp),x 
      00AD2E CD 99            [ 1]  123     jrne 4$ 
      00AD30 E7 A1 01         [ 4]  124     call prt_acc24 
      00AD33 27 03            [ 1]  125     ld a,#SPACE 
      00AD35 CC 97 2D         [ 4]  126     call putc 
      00AD38 90 F6 93         [ 2]  127     ldw x,ticks 
      00AD3B EE 01 72         [ 2]  128     subw x,(T,sp)
      00AD3E A9 00 03         [ 4]  129     call prt_i16 
      00AD41 A6 0D            [ 1]  130     ld a,#CR 
      00AD41 4D 26 06         [ 4]  131     call putc 
                                    132 ; test abs24 
      00AD44 5D 26 03         [ 2]  133     ldw x,LOOP_CNT
      00AD47 43 53            [ 2]  134     ldw (CNTR,sp),x 
      00AD49 81 4F 5F         [ 2]  135     ldw x,ticks 
      00AD4C 81 01            [ 2]  136     ldw (T,sp),x 
      00AD4D                        137 5$: 
      00AD4D CD 99            [ 1]  138     ld a,#0xff
      00AD4F EC A1 01         [ 2]  139     ldw x,#0xffff
      00AD52 27 03 CC         [ 4]  140     call abs24 
      00AD55 97 2D 90         [ 1]  141     ld acc24,a 
      00AD58 F6 93 EE         [ 2]  142     ldw acc24+1,x
      00AD5B 01 72            [ 2]  143     ldw x,(CNTR,sp)
      00AD5D A9 00 03         [ 2]  144     subw x,#1
      00AD60 4B 00            [ 2]  145     ldw (CNTR,sp),x 
      00AD62 35 CC            [ 1]  146     jrne 5$ 
      00AD64 50 E0 9E         [ 4]  147     call prt_acc24 
      00AD67 A4 3F            [ 1]  148     ld a,#SPACE 
      00AD69 95 A3 00         [ 4]  149     call putc 
      00AD6C FF 23 06         [ 2]  150     ldw x,ticks 
      00AD6F 0C 01 98         [ 2]  151     subw x,(T,sp)
      00AD72 56 20 F5         [ 4]  152     call prt_i16 
      003522                        153 6$:
      00AD75 35 55            [ 1]  154     ld a,#CR 
      00AD77 50 E0 84         [ 4]  155     call putc 
      00AD7A C7 50 E1         [ 4]  156     call read_integer 
      00AD7D 9F 4A 35 55 50   [ 1]  157     mov farptr,acc24 
      00AD82 E0 C7 50 E2 35   [ 1]  158     mov farptr+1,acc16 
      00AD87 AA 50 E0 81 1A   [ 1]  159     mov farptr+2,acc8 
      00AD8B CD 35 6D         [ 4]  160     call read_integer 
      00AD8B 35 AA 50         [ 1]  161     ld a,acc24 
      00AD8E E0 81 0D         [ 2]  162     ldw x,acc16 
      00AD90 55 00 18 00 0C   [ 1]  163     mov acc24,farptr 
      00AD90 CD 99 E7 A1 01   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
Hexadecimal [24-Bits]



      00AD95 27 03 CC 97 2D   [ 1]  165     mov acc8,farptr+2 
      00AD9A CD 03 27         [ 4]  166     call div24 
      00AD9A 90               [ 1]  167     push a 
      00AD9B F6               [ 2]  168     pushw x 
      00AD9C 93 EE 01         [ 4]  169     call prt_acc24 
      00AD9F 72 A9            [ 1]  170     ld a,#SPACE 
      00ADA1 00 03 4D         [ 4]  171     call putc 
      00ADA4 26               [ 2]  172     popw x
      00ADA5 08 5D 26         [ 2]  173     ldw acc16,x  
      00ADA8 05 A6 0A         [ 1]  174     pop acc24 
      00ADAB CC 97 2F         [ 4]  175     call prt_acc24
      00ADAE 4B 18            [ 2]  176     jra 6$
      00356A                        177     _drop VSIZE 
      00ADB0 59 49            [ 2]    1     addw sp,#VSIZE 
      00ADB2 25               [ 4]  178     ret 
                                    179 
                                    180 
      00356D                        181 read_integer:
      00ADB3 04 0A            [ 1]  182     ld a,#'? 
      00ADB5 01 26 F8         [ 4]  183     call putc  
      00ADB8 5F 84 4A 02      [ 1]  184 	clr count  
      00ADBC CD 0A A6         [ 4]  185 	call readln 
      00ADBC 81 16 68         [ 2]  186 	ldw x,#tib 
      00ADBD 3B 00 03         [ 1]  187 	push count
      00ADBD CD 99            [ 1]  188 	push #0 
      00ADBF E7 A1 01         [ 2]  189 	addw x,(1,sp)
      00ADC2 27               [ 1]  190 	incw x 
      003585                        191 	_drop 2 
      00ADC3 03 CC            [ 2]    1     addw sp,#2 
      00ADC5 97 2D 90 F6      [ 1]  192 	clr in 
      00ADC9 93 EE 01         [ 4]  193 	call get_token
      00ADCC 72 A9            [ 1]  194 	cp a,#TK_INTGR
      00ADCE 00 03            [ 1]  195 	jreq 3$ 
      00ADD0 9F AE            [ 1]  196 	cp a,#TK_MINUS
      00ADD2 00 01 A4         [ 4]  197 	call get_token 
      00ADD5 17 27            [ 1]  198 	cp a,#TK_INTGR 
      00ADD7 0A 88            [ 1]  199 	jreq 2$
      00ADD9 4F 16 AD         [ 2]  200 	jp syntax_error
      00ADDA                        201 2$:
      00ADDA 58 49 0A         [ 4]  202 	call neg_acc24  	
      0035A1                        203 3$: 
      00ADDD 01               [ 4]  204     ret 
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
      003600                         28 	.bndry 128 ; align on FLASH block.
                                     29 ; space for user application  
      003600                         30 app_space::
      00ADDE 26 FA                   31 app_sign:  .word 0 ; .ascii "BC"  ; signature 
      00ADE0 00 00                   32 app_size: .word 0 
      003604                         33 app: 
                                     34 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     A32     =  000005     |   4 ABS        003336 R
    ABS_IDX =  000000     |     ACK     =  000006     |   4 ADCON      00332C R
    ADCON_ID=  000002     |   4 ADCREAD    003320 R   |     ADCREAD_=  000004 
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
  4 AND        003318 R   |     AND_IDX =  0000FA     |     ARG_OFS =  000002 
    ARROW_LE=  000080     |     ARROW_RI=  000081     |   4 ASC        003310 R
    ASC_IDX =  000006     |     ATMP    =  000001     |     ATTRIB  =  000002 
  4 AUTO_RUN   000157 R   |   4 AWU        003308 R   |   4 AWUHandl   000004 R
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
    BELL    =  000007     |     BINARY  =  000001     |   4 BIT        003300 R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000A 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  00000D     |   4 BRES       0032F7 R   |     BRES_IDX=  00000C 
    BS      =  000008     |   4 BSET       0032EE R   |     BSET_IDX=  00000E 
    BSIZE   =  000006     |   4 BTEST      0032E4 R   |     BTEST_ID=  000010 
  4 BTOGL      0032DA R   |     BTOGL_ID=  000012     |     BTW     =  000001 
    BUFPTR  =  000003     |   4 BYE        0032D2 R   |     BYE_IDX =  000014 
    C       =  000001     |     CAN     =  000018     |   4 CANT_DO    002870 R
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
  4 CHAR       0032C9 R   |     CHAR_IDX=  000016     |     CLKOPT  =  004807 
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
  4 CONST      0032BF R   |   4 CONST_CO   001D16 R   |     CONST_ID=  0000BC 
    CONST_RE=  000005     |     COUNT   =  000003     |     CPOS    =  000003 
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |     CR      =  00000D 
  4 CRH        0032B7 R   |     CRH_IDX =  000018     |   4 CRL        0032AF R
    CRL_IDX =  00001A     |     CTRL_A  =  000001     |     CTRL_B  =  000002 
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
  4 DATA       0032A6 R   |     DATA_IDX=  00001C     |     DBG_A   =  000008 
    DBG_CC  =  000009     |     DBG_X   =  000006     |     DBG_Y   =  000004 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   4 DDR        00329E R   |     DDR_IDX =  00001E 
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  4 DEC        003296 R   |     DEC_IDX =  000020     |     DEST    =  000001 
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |     DIVISOR =  000001 
    DIVSOR  =  000001     |     DLE     =  000010     |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   4 DO         00328F R   |     DOLP_ADR=  000003 
    DOLP_INW=  000005     |     DO_IDX  =  000022     |   4 DREAD      003285 R
    DREAD_ID=  000024     |   4 DWRITE     00327A R   |     DWRITE_I=  000026 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 234.
Hexadecimal [24-Bits]

Symbol Table

  4 EDIT       003271 R   |     EDIT_IDX=  000028     |   4 EEFREE     003266 R
    EEFREE_I=  0000BE     |   4 EEPROM     00325B R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_I=  00002A     |     EEPROM_S=  000800 
    EEPTR   =  000003     |     EM      =  000019     |   4 END        003253 R
    END_IDX =  00002C     |     ENQ     =  000005     |     EOF     =  0000FF 
    EOT     =  000004     |   4 ERASE      003249 R   |     ERASE_ID=  00002E 
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_OVER=  000010 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    ETB     =  000017     |     ETX     =  000003     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FBREAK  =  000004     |     FCOMP   =  000005 
  4 FCPU       003240 R   |     FCPU_IDX=  000030     |     FF      =  00000C 
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
  4 FLASH_ME   001EBD R   |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |     FLOOP   =  000002 
    FLSI    =  01F400     |   4 FOR        003238 R   |     FOR_IDX =  000034 
  4 FREE       00322F R   |     FREE_IDX=  00008E     |     FRUN    =  000000 
    FS      =  00001C     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_AND   =  000070     |     F_CFUNC =  000020 
    F_CMD   =  000000     |     F_CONST =  000030     |     F_IFUNC =  000010 
    F_OR    =  000080     |     F_XOR   =  000090     |   4 GET        003227 R
    GET_IDX =  0000BA     |   4 GOSUB      00321D R   |     GOSUB_ID=  000036 
  4 GOTO       003214 R   |     GOTO_IDX=  000038     |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
    GS      =  00001D     |   4 HEX        00320C R   |     HEX_IDX =  00003A 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
Hexadecimal [24-Bits]

Symbol Table

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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   4 IDR        003204 R
    IDR_IDX =  00003C     |   4 IF         0031FD R   |     IF_IDX  =  00003E 
    IN      =  000005     |     INCR    =  000001     |     INP     =  000000 
  4 INPUT      0031F3 R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
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
    INT_VECT=  00805C     |     INT_VECT=  008058     |   4 INVERT     0031E8 R
    INVERT_I=  000042     |     INW     =  00000B     |     IPOS    =  000001 
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |   4 IWDGEN     0031DD R
    IWDGEN_I=  000044     |   4 IWDGREF    0031D1 R   |     IWDGREF_=  000046 
    IWDG_KEY=  000055     |     IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
    KCHAR   =  000002     |   4 KEY        0031C9 R   |     KEY_END =  000083 
    KEY_IDX =  000048     |     KW_TYPE_=  0000F0     |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000002     |   4 LET        0031C1 R
    LET_IDX =  00004A     |     LF      =  00000A     |     LIMIT   =  000001 
    LINENO  =  000005     |   4 LINK    =  003336 R   |   4 LIST       0031B8 R
    LIST_IDX=  00004C     |     LL      =  000001     |     LLEN    =  000002 
    LL_HB   =  000001     |     LN_PTR  =  000005     |   4 LOG        0031B0 R
    LOG_IDX =  00004E     |     LOOP_CNT=  002710     |   4 LSHIFT     0031A5 R
    LSHIFT_I=  000050     |     MAJOR   =  000002     |     MASK    =  000002 
    MAX_LINE=  007FFF     |     MINOR   =  000000     |     MULOP   =  000001 
    N1      =  000004     |     N2      =  000007     |     NAFR    =  004804 
    NAK     =  000015     |     NAMEPTR =  000001     |     NCLKOPT =  004808 
    NEG     =  000001     |   4 NEW        00319D R   |     NEW_IDX =  000054 
  4 NEXT       003194 R   |     NEXT_IDX=  000052     |     NFLASH_W=  00480E 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 236.
Hexadecimal [24-Bits]

Symbol Table

    NHSECNT =  00480A     |     NLEN    =  000001     |     NLEN_MAS=  00000F 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   4 NOT        00318C R
    NOT_IDX =  000056     |   4 NOT_SAVE   001FAF R   |   4 NO_APP     0028B2 R
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  4 NonHandl   000000 R   |   4 ODR        003184 R   |     ODR_IDX =  000058 
  4 ON         00317D R   |     ONOFF   =  000003     |     ON_IDX  =  0000B8 
    OP      =  000002     |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   4 OR         003176 R
    OR_IDX  =  0000FC     |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVRWR   =  000004     |     PA      =  000000     |   4 PAD        00316E R
    PAD_IDX =  00005A     |     PAD_SIZE=  000080     |   4 PAUSE      003164 R
    PAUSE_ID=  00005C     |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |     PD_BASE =  00500F     |     PD_CR1  =  005012 
    PD_CR2  =  005013     |     PD_DDR  =  005011     |     PD_IDR  =  005010 
    PD_ODR  =  00500F     |     PE      =  000014     |   4 PEEK       00315B R
    PEEK_IDX=  000060     |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |     PINNO   =  000001 
  4 PINP       003152 R   |     PINP_IDX=  000062     |     PINVAL  =  000002 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  4 PMODE      003148 R   |     PMODE_ID=  00005E     |   4 POKE       00313F R
    POKE_IDX=  000064     |   4 PORTA      003122 R   |   4 PORTB      003118 R
  4 PORTC      00310E R   |   4 PORTD      003104 R   |   4 PORTE      0030FA R
  4 PORTF      0030F0 R   |   4 PORTG      0030E6 R   |   4 PORTH      0030DC R
  4 PORTI      0030D2 R   |   4 POUT       003136 R   |     POUT_IDX=  000066 
    PREV    =  000001     |   4 PRINT      00312C R   |     PROD    =  000001 
    PROD_SIG=  00000A     |   4 PROG_ADD   001E93 R   |   4 PROG_SIZ   001EA5 R
    PRTA_IDX=  00006A     |     PRTB_IDX=  00006C     |     PRTC_IDX=  00006E 
    PRTD_IDX=  000070     |     PRTE_IDX=  000072     |     PRTF_IDX=  000074 
    PRTG_IDX=  000076     |     PRTH_IDX=  000078     |     PRTI_IDX=  00007A 
    PRT_IDX =  000068     |     PSIZE   =  000001     |     PSTR    =  000003 
  4 QKEY       0030C9 R   |     QKEY_IDX=  00007C     |     QSIGN   =  000005 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |   4 RAM_MEM    001ECE R
    RAM_SIZE=  001800     |     RBT_IDX =  000080     |   4 READ       0030C0 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
Hexadecimal [24-Bits]

Symbol Table

    READ_IDX=  00007E     |   4 REBOOT     0030B5 R   |     RECLEN  =  000005 
  4 REG_A      000562 R   |   4 REG_CC     000566 R   |   4 REG_EPC    000555 R
  4 REG_SP     00056B R   |   4 REG_X      00055E R   |   4 REG_Y      00055A R
    RELOP   =  000001     |   4 REM        0030AD R   |     REM_IDX =  000082 
  4 RESTORE    0030A1 R   |     REST_IDX=  000084     |     RETL1   =  000001 
  4 RETURN     003096 R   |     RET_ADDR=  000003     |     RET_BPTR=  000003 
    RET_IDX =  000086     |     RET_INW =  000005     |   4 RND        00308E R
    RND_IDX =  000088     |     ROP     =  004800     |     RS      =  00001E 
  4 RSHIFT     003083 R   |     RSHIFT_I=  00008A     |     RSIGN   =  000006 
    RST_SR  =  0050B3     |   4 RUN        00307B R   |     RUN_IDX =  00008C 
    RXCHAR  =  000001     |     RX_QUEUE=  000008     |     R_A     =  000007 
    R_CC    =  000008     |     R_X     =  000005     |     R_Y     =  000003 
  4 SAVE       003072 R   |     SAVE_IDX=  000032     |     SEPARATE=  000000 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
    SI      =  00000F     |     SIGN    =  000001     |   4 SIGNATUR   00286E R
  4 SIZE       003069 R   |     SIZE_IDX=  0000B6     |     SKIP    =  000005 
  4 SLEEP      00305F R   |     SLEEP_ID=  000090     |     SO      =  00000E 
    SOH     =  000001     |     SPACE   =  000020     |   4 SPIEN      003055 R
    SPIEN_ID=  000094     |   4 SPIRD      00304B R   |     SPIRD_ID=  000092 
  4 SPISEL     003040 R   |     SPISEL_I=  000096     |   4 SPIWR      003036 R
    SPIWR_ID=  000098     |     SPI_CR1 =  005200     |     SPI_CR1_=  000003 
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
  4 STATES     000518 R   |   4 STEP       00302D R   |     STEP_IDX=  00009A 
  4 STOP       003024 R   |     STOP_IDX=  00009C     |     STR     =  000003 
  4 STR_BYTE   001EB6 R   |     STX     =  000002     |     SUB     =  00001A 
    SUP     =  000084     |     SWIM_CSR=  007F80     |     SYN     =  000016 
    T       =  000001     |     TAB     =  000009     |     TABW    =  000004 
    TAB_WIDT=  000004     |     TARGET  =  000001     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  4 TICKS      00301A R   |     TICKS_ID=  00009E     |     TIM1_ARR=  005262 
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
  4 TIMEOUT    00300E R   |   4 TIMER      003004 R   |     TIMER_ID=  0000A0 
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |     TK_AND  =  000087 
    TK_ARRAY=  000005     |     TK_CFUNC=  000082     |     TK_CHAR =  000004 
    TK_CMD  =  000080     |     TK_COLON=  00000A     |     TK_COMMA=  000008 
    TK_CONST=  000083     |     TK_DIV  =  000021     |     TK_EQUAL=  000032 
    TK_FLOAT=  000086     |     TK_GE   =  000033     |     TK_GRP_A=  000010 
    TK_GRP_M=  000030     |     TK_GRP_M=  000000     |     TK_GRP_M=  000020 
    TK_GRP_R=  000030     |     TK_GT   =  000031     |     TK_IFUNC=  000081 
    TK_INTGR=  000084     |     TK_LABEL=  000003     |     TK_LE   =  000036 
    TK_LPARE=  000006     |     TK_LT   =  000034     |     TK_MINUS=  000011 
    TK_MOD  =  000022     |     TK_MULT =  000020     |     TK_NE   =  000035 
    TK_NONE =  000000     |     TK_OR   =  000088     |     TK_PLUS =  000010 
    TK_QSTR =  000002     |     TK_RPARE=  000007     |     TK_SHARP=  000009 
    TK_VAR  =  000085     |     TK_XOR  =  000089     |     TMROUT_I=  0000A2 
  4 TO         002FFD R   |   4 TONE       002FF4 R   |     TONE_IDX=  0000A6 
    TOWRITE =  000005     |     TO_IDX  =  0000A4     |   4 Timer4Up   000021 R
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

    UART_SR_=  000007     |     UBC     =  004801     |   4 UBOUND     002FE9 R
    UBOUND_I=  0000A8     |   4 UBTN_Han   000068 R   |   4 UFLASH     002FDE R
    UFLASH_I=  0000AA     |   4 UNTIL      002FD4 R   |     UNTIL_ID=  0000AC 
    UPDATE  =  000006     |     US      =  00001F     |   4 USER_ABO   000070 R
  4 USR        002FCC R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     USR_IDX =  0000AE     |   4 Uart1RxH   0008D2 R
  4 UserButt   000044 R   |     VAL1    =  02FFFF     |     VAL2    =  00002A 
    VAL3    =  000003     |     VAL4    =  0005FF     |     VAL5    =  FFFFFFFD 
    VSIZE   =  000008     |     VT      =  00000B     |   4 WAIT       002FC3 R
    WAIT_IDX=  0000B0     |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  4 WORDS      002FB9 R   |     WORDS_ID=  0000B2     |   4 WRITE      002FAF R
    WRITE_ID=  0000B4     |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XFIRST  =  000001     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   4 XOR        002FA7 R   |     XOR_IDX =  0000FE 
    XSAVE   =  000002     |     XSTACK_E=  001773     |     XSTACK_S=  00003C 
    XTEMP   =  000001     |     YSAVE   =  000007     |     YTEMP   =  000003 
  4 abs        002A83 R   |   4 abs24      0001DF R   |   5 acc16      00000D GR
  5 acc24      00000C GR  |   5 acc32      00000B GR  |   5 acc8       00000E GR
  4 accept_c   000C00 R   |   4 add24      00016A R   |   4 add_char   00139D R
  4 add_spac   00116E R   |   4 analog_r   002629 R   |   4 and_cond   001B4A R
  4 and_fact   001B2E R   |   4 app        003604 R   |   4 app_sign   003600 R
  4 app_size   003602 R   |   4 app_spac   003600 GR  |   4 arduino_   002B70 R
  4 arg_list   00196C R   |   5 array_si   000020 R   |   4 ascii      002922 R
  4 at_tst     000FD5 R   |   4 atoi24     0018A5 GR  |   4 atoi_exi   00190B R
  4 awu        002A2A R   |   4 awu02      002A3D R   |   4 bad_port   00299D R
  5 base       00000A GR  |   5 basicptr   000004 GR  |   4 beep       0025A0 R
  4 beep_1kh   002573 GR  |   4 bin_exit   000E3C R   |   4 bit_rese   002191 R
  4 bit_set    00216F R   |   4 bit_test   0021D6 R   |   4 bit_togg   0021B4 R
  4 bitmask    002D3D R   |   4 bkslsh_t   000F82 R   |   4 bksp       0009AB R
  2 block_bu   0016B8 GR  |   4 block_er   0007C0 R   |   4 break_po   002715 R
  4 bye        0029F6 R   |   4 char       00290B R   |   4 clear_ba   001509 R
  4 clear_bl   0027C5 R   |   4 clear_va   001461 R   |   4 clock_in   00008B R
  4 cloop_1    001DBF R   |   4 cmd_cons   001D99 R   |   4 cmd_end    00253F R
  4 cmd_get    002546 R   |   4 cmd_itf    000570 R   |   4 cmd_line   00173C R
  4 cmd_name   0013BD R   |   4 cmd_on     0023F9 R   |   4 cmd_size   001C36 R
  4 code_add   00333C GR  |   4 cold_sta   0000C3 R   |   4 colon_ts   000FA9 R
  4 comma_ts   000FB4 R   |   4 comp_msg   00168C R   |   4 compile    0010DA GR
  4 conditio   001B9C R   |   4 const_cr   002DF8 R   |   4 const_cr   002DFD R
  4 const_dd   002DF3 R   |   4 const_ee   002E0C R   |   4 const_id   002DEE R
  4 const_in   002E07 R   |   4 const_lo   001DBA R   |   4 const_od   002DE9 R
  4 const_ou   002E02 R   |   4 const_po   002DBC R   |   4 const_po   002DC1 R
  4 const_po   002DC6 R   |   4 const_po   002DCB R   |   4 const_po   002DD0 R
  4 const_po   002DD5 R   |   4 const_po   002DDA R   |   4 const_po   002DDF R
  4 const_po   002DE4 R   |   4 convert_   000DAC R   |   4 convert_   00096F R
  4 copy_com   00100A R   |   5 count      000003 GR  |   4 cp24       0001A4 R
  4 cp24_ax    0001D6 R   |   4 cp_loop    00191D R   |   4 cpl24      0001E6 R
  4 cpy_cmd_   001156 R   |   4 cpy_quot   001196 R   |   4 create_g   000CD6 R
  4 cs_high    002F9B R   |   4 dash_tst   000FCA R   |   4 data       002E11 R
  5 data_len   000009 R   |   4 data_lin   002E20 R   |   5 data_ofs   000008 R
  5 data_ptr   000006 R   |   4 data_sea   002E6C R   |   4 dec_base   001C15 R
  4 decomp_l   00124F R   |   4 decompil   001207 GR  |   4 del_line   000CA9 R
  4 delete_l   000A98 R   |   4 delete_n   0009BB R   |   4 delete_u   000A5D R
  4 digital_   002665 R   |   4 digital_   00269C R   |   4 div24      000327 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
Hexadecimal [24-Bits]

Symbol Table

  4 divu24_8   000309 R   |   4 do_loop    002D79 R   |   4 do_progr   0007B3 R
  4 edit       001F82 R   |   4 enable_i   002CCD R   |   4 eql_tst    00105F R
  4 equal      0013B0 R   |   4 erase      00273D R   |   4 erase_ex   0007E4 R
  4 erase_fl   0007DA R   |   4 err_bad_   0015ED R   |   4 err_buf_   001663 R
  4 err_cmd_   0015B1 R   |   4 err_div0   001576 R   |   4 err_dupl   0015CB R
  4 err_math   00155D R   |   4 err_mem_   001542 R   |   4 err_msg    001520 R
  4 err_no_a   0015F9 R   |   4 err_no_d   00162C R   |   4 err_no_f   001650 R
  4 err_no_l   001585 R   |   4 err_no_p   00163C R   |   4 err_not_   0015DC R
  4 err_over   001670 R   |   4 err_run_   00159B R   |   4 err_synt   00154F R
  4 escaped    000DC1 GR  |   4 expect     00195A R   |   4 expressi   001A97 R
  4 factor     0019B8 R   |   5 farptr     000018 R   |   4 fcpu       002AF4 R
  4 fetchc     000660 R   |   4 fill_wri   0027B5 R   |   4 final_te   000BF9 R
  4 first_li   001F2C R   |   5 flags      000022 GR  |   4 for        002269 R
  4 free       001C1A R   |   5 free_eep   000024 R   |   7 free_ram   000080 R
  4 func_arg   001967 R   |   4 func_eef   001D2C R   |   4 func_not   002CAE R
  4 ge         0013B2 R   |   4 get_addr   0017E3 R   |   4 get_arra   001988 R
  4 get_char   0017FD R   |   4 get_cmd_   0011E6 R   |   4 get_code   0017C7 R
  4 get_cons   001CB1 R   |   4 get_esca   00097B R   |   4 get_int2   0017ED R
  4 get_targ   00238A R   |   4 get_targ   002398 R   |   4 get_tick   002A7C R
  4 get_toke   000F1B GR  |   4 getc       000954 GR  |   4 gosub      00249F R
  4 gosub_1    0024AA R   |   4 gosub_2    0024B0 R   |   4 goto       002485 R
  4 goto_1     00248F R   |   4 gpio       002972 R   |   4 gt         0013AE R
  4 gt_tst     00106A R   |   4 hex_base   001C10 R   |   4 hex_dump   0006A0 R
  4 if         00224F R   |   5 in         000001 GR  |   5 in.saved   000002 GR
  5 in.w       000000 GR  |   4 incr_far   0008B6 R   |   4 input_ex   002127 R
  4 input_lo   002091 R   |   4 input_va   00208D R   |   4 insert_c   000A1A R
  4 insert_l   000D02 R   |   4 insert_l   000D71 R   |   4 interp_l   00177D R
  4 interpre   001758 R   |   4 invalid    0005B5 R   |   4 invalid_   000636 R
  4 invert     002D63 R   |   4 is_alnum   000E6F GR  |   4 is_alpha   000E55 GR
  4 is_data_   002E17 R   |   4 is_digit   000E66 GR  |   4 is_symbo   000E78 R
  4 itoa       001840 GR  |   4 itoa_loo   001862 R   |   4 jp_to_ta   002492 R
  4 key        002961 R   |   4 kword_di   003334 GR  |   4 kword_en   002FA5 R
  4 le         0013B7 R   |   4 ledoff     00046B R   |   4 ledon      000466 R
  4 ledtoggl   000470 R   |   4 left_par   000479 R   |   4 let        001C6E GR
  4 let_arra   001C7C R   |   4 let_eval   001C84 R   |   4 let_var    001C81 R
  4 lines_sk   001F2F R   |   4 list       001EDD R   |   4 list_con   001CC0 R
  4 list_exi   001F71 R   |   4 list_loo   001F4F R   |   4 log2       002D10 R
  4 logical_   002CC1 R   |   4 look_tar   0023BB R   |   4 loop_bac   00236D R
  5 loop_dep   00001F R   |   4 loop_don   002382 R   |   4 lshift     002A9A R
  4 lt         0013B5 R   |   4 lt_tst     001093 R   |   4 mem_peek   0005D2 R
  4 mod24      0003D5 R   |   4 move       00141D GR  |   4 move_dow   00143C R
  4 move_era   000742 R   |   4 move_exi   00145D R   |   4 move_lef   0009F2 R
  4 move_loo   001441 R   |   4 move_prg   000782 R   |   4 move_rig   000A00 R
  4 move_up    00142E R   |   4 mul24      00025D R   |   4 mul_char   00139F R
  4 mulu24_8   00022A R   |   4 nbr_tst    000F4E R   |   4 ne         0013BA R
  4 neg24      0001F3 R   |   4 neg_acc2   00020D R   |   4 neg_ax     000205 R
  4 new        002733 R   |   4 next       002315 R   |   4 next_lin   001760 R
  4 next_tok   0017AE GR  |   4 no_match   00192F R   |   4 number     000666 R
  4 other      0010BC R   |   4 overwrit   000C25 R   |   2 pad        0016B8 GR
  4 pad_ref    002FA0 R   |   4 parse_bi   000E1A R   |   4 parse_in   000DC9 R
  4 parse_ke   000E9B R   |   4 parse_qu   000D74 R   |   4 parse_sy   000E83 R
  4 pause      002A0A R   |   4 pause02    002A1D R   |   4 peek       00222E R
  4 peek_byt   000600 R   |   4 pin_mode   002B03 R   |   4 plus_tst   001033 R
  4 poke       00220D R   |   4 power_ad   0025D9 R   |   4 prcnt_ts   001054 R
  4 print      001FEA R   |   4 print_fa   000645 R   |   4 print_he   000C5C GR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Symbol Table

  4 print_re   0004C5 R   |   4 print_st   0005C5 R   |   4 print_to   001828 R
  4 prog_siz   001E4C R   |   4 program_   001E54 R   |   4 program_   00075C R
  4 program_   000782 R   |   4 prt_acc2   00181A R   |   4 prt_basi   001FC6 R
  4 prt_i16    001803 R   |   4 prt_loop   001FEE R   |   4 prt_peek   000448 GR
  4 prt_reg1   0004A6 R   |   4 prt_reg8   000484 R   |   4 prt_regs   0003DE GR
  5 ptr16      000019 GR  |   5 ptr8       00001A R   |   4 putc       000944 GR
  4 puts       0009A1 GR  |   4 qgetc      00094D GR  |   4 qkey       002965 GR
  4 qmark_ts   000FE0 R   |   4 qsign      0027AE R   |   4 random     002B90 R
  4 read       002E8D R   |   4 read01     002E8F R   |   4 read_int   00356D R
  4 readln     000AA6 GR  |   4 readln_l   000AB5 R   |   4 readln_q   000C42 R
  4 refresh_   002D0B R   |   4 regs_sta   000421 R   |   4 relation   001ACF R
  4 relop_st   0013A2 R   |   4 remark     00212C GR  |   4 repl       00057E R
  4 repl_exi   0005A6 R   |   4 reset_co   001FEC R   |   4 rest_con   00207D R
  4 restore    002E46 R   |   4 restore_   002E88 R   |   4 return     0024C5 R
  4 right_al   001184 GR  |   4 row_alig   00089B R   |   4 row_eras   000715 R
  4 row_eras   000742 R   |   4 row_loop   000683 R   |   4 rparnt_t   000F9E R
  4 rshift     002AC7 R   |   7 rsign      00007C R   |   7 rsize      00007E R
  4 rt_msg     00167A R   |   4 run        0024E3 R   |   4 run_app    000135 R
  4 run_it     002515 R   |   4 run_it_0   002517 R   |   5 rx1_head   00002E R
  5 rx1_queu   000026 R   |   5 rx1_tail   00002F R   |   4 save_app   0027D9 R
  4 save_con   00206D R   |   4 scan_blo   0008C4 R   |   4 search_c   001D55 R
  4 search_d   00190F GR  |   4 search_e   001957 R   |   4 search_l   000C7E GR
  4 search_l   000C8D R   |   4 search_n   001913 R   |   5 seedx      000014 R
  5 seedy      000016 R   |   4 select_p   002B60 R   |   4 send_esc   0009C9 R
  4 send_par   0009D4 R   |   4 set_data   002E35 R   |   4 set_time   002C91 R
  4 sharp_ts   000FBF R   |   4 show_row   000671 R   |   4 single_c   001398 R
  4 skip       000F08 R   |   4 skip_str   0017D4 R   |   4 slash_ts   001049 R
  4 sleep      0029FF R   |   4 software   001470 R   |   4 spaces     000A0E GR
  4 spi_clea   002F35 R   |   4 spi_disa   002F1D R   |   4 spi_enab   002EEA R
  4 spi_rcv_   002F57 R   |   4 spi_read   002F82 R   |   4 spi_sele   002F89 R
  4 spi_send   002F41 R   |   4 spi_writ   002F62 R   |   2 stack_fu   001774 GR
  2 stack_un   001800 R   |   4 star_tst   00103E R   |   4 step       0022D3 R
  4 stop       0026E7 R   |   4 store_lo   002302 R   |   4 str_matc   00193C R
  4 str_tst    000F3E R   |   4 strcmp     0013FC R   |   4 strcpy     00140D GR
  4 strlen     0013F1 GR  |   4 sub24      000187 R   |   4 symb_loo   000E84 R
  4 syntax_e   0016AD GR  |   4 system_i   0014B6 R   |   5 tab_widt   000023 GR
  4 tb_error   0016AF GR  |   4 term       001A54 R   |   4 term01     001A5C R
  4 term_exi   001A94 R   |   4 test       0033FE R   |   4 test_p     0005BD R
  2 tib        001668 GR  |   4 tick_tst   000FF8 R   |   5 ticks      00000F R
  4 timeout    002CA8 R   |   5 timer      000012 GR  |   4 timer2_i   0000A1 R
  4 timer4_i   0000AE R   |   4 tk_id      00169D R   |   4 to         002293 R
  4 to_eepro   0007AB R   |   4 to_flash   0007B0 R   |   4 to_hex_c   000C73 GR
  4 to_upper   001899 GR  |   4 token_ch   0010D3 R   |   4 token_ex   0010D7 R
  4 tone       00257E R   |   4 try_next   002E78 R   |   5 txtbgn     00001B GR
  5 txtend     00001D GR  |   4 uart1_ge   000954 GR  |   4 uart1_in   0008FF R
  4 uart1_pu   000944 GR  |   4 uart1_qg   00094D GR  |   4 uart1_se   00090F R
  4 ubound     001C63 R   |   4 uflash     0029A2 R   |   4 unlock_e   0006DF R
  4 unlock_f   0006FA R   |   4 until      002D8C R   |   4 user_int   000057 R
  4 usr        0029B7 R   |   4 var_name   0011DC GR  |   5 vars       000030 GR
  4 wait       002132 R   |   4 warm_ini   0014E7 R   |   4 warm_sta   001739 R
  4 words      002C2B R   |   4 words_co   002C7B R   |   4 write      0028C8 R
  4 write_bl   000860 GR  |   4 write_bu   00079C R   |   4 write_by   0007E6 R
  4 write_ee   000822 R   |   4 write_ex   00085B R   |   4 write_fl   00080C R
  4 write_nb   000885 R   |   2 xstack_f   001738 GR  |   2 xstack_u   001774 GR

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 243.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 SSEG       size      0   flags    8
   2 SSEG0      size    198   flags    8
   3 HOME       size     80   flags    0
   4 CODE       size   3604   flags    0
   5 DATA       size     7E   flags    0
   6 BTXT       size      0   flags    8
   7 BTXT1      size      4   flags    8

