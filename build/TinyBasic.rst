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
                           000056    68     ODR_IDX=NEW_IDX+2
                           000058    69     PAD_IDX=ODR_IDX+2
                           00005A    70     PAUSE_IDX=PAD_IDX+2
                           00005C    71     PMODE_IDX=PAUSE_IDX+2
                           00005E    72     PEEK_IDX=PMODE_IDX+2
                           000060    73     PINP_IDX=PEEK_IDX+2
                           000062    74     POKE_IDX=PINP_IDX+2
                           000064    75     POUT_IDX=POKE_IDX+2
                           000066    76    	PRT_IDX=POUT_IDX+2 ; PRINT commande index 
                           000068    77     PRTA_IDX=PRT_IDX+2
                           00006A    78     PRTB_IDX=PRTA_IDX+2
                           00006C    79     PRTC_IDX=PRTB_IDX+2
                           00006E    80     PRTD_IDX=PRTC_IDX+2
                           000070    81     PRTE_IDX=PRTD_IDX+2
                           000072    82     PRTF_IDX=PRTE_IDX+2
                           000074    83     PRTG_IDX=PRTF_IDX+2
                           000076    84     PRTH_IDX=PRTG_IDX+2
                           000078    85     PRTI_IDX=PRTH_IDX+2
                           00007A    86     QKEY_IDX=PRTI_IDX+2
                           00007C    87     READ_IDX=QKEY_IDX+2
                           00007E    88     RBT_IDX=READ_IDX+2  ; REBOOT
                           000080    89 	REM_IDX=RBT_IDX+2 ; REMARK command index 
                           000082    90     REST_IDX=REM_IDX+2 ; RESTORE
                           000084    91     RET_IDX=REST_IDX+2  ; RETURN 
                           000086    92     RND_IDX=RET_IDX+2 ; RANDOM 
                           000088    93     RSHIFT_IDX=RND_IDX+2
                           00008A    94     RUN_IDX=RSHIFT_IDX+2
                           00008C    95     FREE_IDX=RUN_IDX+2
                           00008E    96     SLEEP_IDX=FREE_IDX+2
                           000090    97     SPIRD_IDX=SLEEP_IDX+2
                           000092    98     SPIEN_IDX=SPIRD_IDX+2
                           000094    99     SPISEL_IDX=SPIEN_IDX+2
                           000096   100     SPIWR_IDX=SPISEL_IDX+2
                           000098   101     STEP_IDX=SPIWR_IDX+2
                           00009A   102     STOP_IDX=STEP_IDX+2
                           00009C   103     TICKS_IDX=STOP_IDX+2
                           00009E   104     TIMER_IDX=TICKS_IDX+2
                           0000A0   105     TMROUT_IDX=TIMER_IDX+2  ; TIMEOUT
                           0000A2   106     TO_IDX=TMROUT_IDX+2
                           0000A4   107     TONE_IDX=TO_IDX+2
                           0000A6   108     UBOUND_IDX=TONE_IDX+2
                           0000A8   109     UFLASH_IDX=UBOUND_IDX+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                           0000AA   110     UNTIL_IDX=UFLASH_IDX+2
                           0000AC   111     USR_IDX=UNTIL_IDX+2
                           0000AE   112     WAIT_IDX=USR_IDX+2
                           0000B0   113     WORDS_IDX=WAIT_IDX+2
                           0000B2   114     WRITE_IDX=WORDS_IDX+2
                           0000B4   115     SIZE_IDX=WRITE_IDX+2 
                           0000B6   116     ON_IDX=SIZE_IDX+2 
                           0000B8   117     GET_IDX=ON_IDX+2
                           0000BA   118     CONST_IDX=GET_IDX+2
                           0000BC   119     EEFREE_IDX=CONST_IDX+2
                                    120      
                                    121     ; keep these 3 at end
                                    122     ; these have no entry in code_addr 
                           0000F8   123     NOT_IDX=248
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
      0080ED CC 97 B5         [ 2]  179 5$:	jp warm_start
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
      00819E CD 9D BC         [ 4]  280 	call func_eefree 
      0081A1 CD 9C F3         [ 4]  281 	call ubound 
      0081A4 CD 95 85         [ 4]  282 	call clear_basic
      0081A7 CD A6 03         [ 4]  283 	call beep_1khz  
      0081AA CD 95 32         [ 4]  284 	call system_information
      0081AD                        285 2$:	
                                    286 ; check for application in flash memory 
      0081AD CD A8 3E         [ 4]  287 	call qsign 
      0081B0 27 03            [ 1]  288 	jreq run_app
      0081B2 CC 97 B5         [ 2]  289 	jp warm_start 
      0081B5                        290 run_app:
                                    291 ; run application in FLASH|EEPROM 
      0081B5 90 CE 17 73      [ 2]  292 	ldw y,XSTACK_EMPTY
      0081B9 CD 95 63         [ 4]  293 	call warm_init
      0081BC AE B6 84         [ 2]  294 	ldw x,#app 
      0081BF CF 00 1C         [ 2]  295 	ldw txtbgn,x
      0081C2 72 BB B6 82      [ 2]  296 	addw x,app_size 
      0081C6 CF 00 1E         [ 2]  297 	ldw txtend,x 
      0081C9 AE 81 D7         [ 2]  298 	ldw x,#AUTO_RUN 
      0081CC CD 8A 1D         [ 4]  299 	call puts 
      0081CF CD 9E E4         [ 4]  300 	call program_info 
      0081D2 CC A5 A7         [ 2]  301 	jp run_it_02  
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
      00837C 2B 02            [ 1]  345     or a,(DIVISOR+1,sp)
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
      0083C7 97 2B 02         [ 2]  386     addw x,(DIVISOR+1,sp)
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
      008451 CD 17 FF         [ 4]   94 	call prt_i16 
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
      0084CA 98 7F A6         [ 4]  191 	call prt_acc24  
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
      0084E0 7F 81            [ 1]  202 	ld a, (4,sp) 
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
      00850C CD 98 7F CD      [ 1]  237 	clr farptr 
      008510 84 F5 84 5F      [ 1]  238 	clr farptr+1 
      008514 97 35 0A 00      [ 1]  239 	clr farptr+2  
      00057A                        240 repl:
      008518 0B CD            [ 1]  241 	ld a,#CR 
      00851A 98 7F A6         [ 4]  242 	call putc 
      00851D 29 CD            [ 1]  243 	ld a,#'? 
      00851F 89 C0 81         [ 4]  244 	call putc
      008522 72 5F 00 00      [ 1]  245 	clr in.w 
      008522 90 89 CD 8A      [ 1]  246 	clr in 
      008526 1D 1E 01         [ 4]  247 	call readln
      008529 35 10 00 0B      [ 2]  248 	ldw y,#tib  
      00852D CD 98            [ 1]  249 	ld a,(y)
      00852F 7F CD            [ 1]  250 	jreq repl  
      008531 84 F5 85 35      [ 1]  251 	inc in 
      008535 0A 00 0B         [ 4]  252 	call to_upper 
      008538 CD 98            [ 1]  253 	cp a,#'Q 
      00853A 7F A6            [ 1]  254 	jrne test_p
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
      008561 96 AE            [ 1]  277 	ld a,#SPACE 
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
      0085F9 1B 16 A9         [ 2]  364 	jp syntax_error
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
      00861D 15 A1            [ 2]    1     addw sp,#VSIZE 
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
      00865C 89 AE 16 B8 CD   [ 2]   46 	btjt FLASH_IAPSR,#FLASH_IAPSR_DUL,9$
      008661 99 21 C6 00      [ 1]   47 	mov FLASH_CR2,#0 
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
      008691 CD 98 96 85      [ 1]   79 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
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
      0086D2 96               [ 1]  124 	push a 
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
      0086EB 29 81            [ 2]    1     addw sp,#1 
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
      0086F7 CD 98 7F         [ 2]  155 	ldw x,#tib ; destination address 
      0086FA A6 20 CD 89      [ 2]  156 	ldw y,#program_row ; source address 
      0086FE C0 14 19         [ 4]  157 	call move
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
      008706 7F 1E            [ 1]  172 	jrne to_flash 
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
      0087D2 94 99            [ 2]  348 	pushw y
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
      008812 94 99            [ 1]  408 	jrne 2$
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
      008823 B6 80            [ 1]   70 	jrne 2$
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
      008844 1A A3 B6 80      [ 1]  100     bset PA_CR2,#UART1_TX_PIN 
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
      008875 A3 B6 80 24 0E   [ 2]  135 	btjf UART1_SR,#UART_SR_TXE,.
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
      008940 CD 14 19         [ 4]  419     call move
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
      008979 30 80 19         [ 4]  460 	call move 
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
      008AAF 94 99 90         [ 4]  690     call delete_under
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
      008AF1 99 90            [ 1]  727 	inc (LL,sp)
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
      008B8D 93 CD 94 6D      [ 2]  121 	addw x,acc16  
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
      008BAB 99 21 CE         [ 2]  152 	ldw x,txtend  
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
      008BC7 83 0F            [ 2]  166 	jra 4$
      008BC9 01 A6 0D CD      [ 5]  167 0$:	ldw x,[ptr16]
                                    168 ; line number
      008BCD 89 C0            [ 2]  169 	ldw (LINENO,sp),x 
      008BCF A6 3E CD         [ 2]  170 	ldw x,#2 
      008BD2 89 C0 AE 16      [ 4]  171 	ld a,([ptr16],x)
      008BD6 68               [ 1]  172 	ld xl,a
                                    173 ; line length
      008BD7 CD 94            [ 2]  174 	ldw (LLEN,sp),x
                                    175 ; check if that line number already exit 	
      008BD9 6D 6B            [ 2]  176 	ldw x,(LINENO,sp)
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
      008C0C CD 14 19         [ 4]  214 	call move 
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
      008C5A CD A6 03 CC 8B 31 A1   293 escaped:: .asciz "abtnvfr"
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
      008D43 99 90            [ 1]  528 	incw y
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
      008D70 94 99 CE         [ 2]  557 	cpw x,#LET_IDX 
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
      008DC3 CC 10 D3         [ 2]  635 	jp token_exit
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
      008DEC 99 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DED 26 05            [ 1]    3 	jrne bkslsh_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      008DED 5B 08            [ 1]  662 	ld a,#TK_LPAREN
      008DEF 81 10 CF         [ 2]  663 	jp token_char   	
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
      008E10 CC 10 CF         [ 2]  681 	jp token_char
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
      008E5D 15 6B            [ 1]  714 	ld a,#TK_CMD
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
      008E76 5A 00 02         [ 2]  725     subw y,(1,sp)
      008E79 7F 1E            [ 1]  726 	ld a,yl 
      008E7B 03 CD 99         [ 1]  727 	add a,in
      008E7E 21 90 93         [ 1]  728 	ld in,a 
      008E81 C6 00            [ 2]  729 	ldw (1,sp),x
      008E83 0D 90 F7         [ 2]  730 	addw y,(1,sp)
      008E86 90 5C            [ 1]  731 	incw y 
      001025                        732 	_drop 2 
      008E88 CE 00            [ 2]    1     addw sp,#2 
      008E8A 0E 90 FF         [ 2]  733 	ldw x,#REM_IDX 
      008E8D 72 A9            [ 1]  734 	ld a,#TK_CMD 
      008E8F 00 02 A6         [ 2]  735 	jp token_exit 
      00102F                        736 plus_tst:
      00102F                        737 	_case '+' star_tst 
      008E92 84 5B            [ 1]    1 	ld a,#'+' 
      008E94 04 81            [ 1]    2 	cp a,(TCHAR,sp) 
      008E96 26 05            [ 1]    3 	jrne star_tst
      008E96 4B 00            [ 1]  738 	ld a,#TK_PLUS  
      008E98 4B 00 4B         [ 2]  739 	jp token_char 
      00103A                        740 star_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      00103A                        741 	_case '*' slash_tst 
      008E9B 00 2A            [ 1]    1 	ld a,#'*' 
      008E9C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E9C 91 D6            [ 1]    3 	jrne slash_tst
      008E9E 01 72            [ 1]  742 	ld a,#TK_MULT 
      008EA0 5C 00 02         [ 2]  743 	jp token_char 
      001045                        744 slash_tst: 
      001045                        745 	_case '/' prcnt_tst 
      008EA3 A1 30            [ 1]    1 	ld a,#'/' 
      008EA5 27 06            [ 1]    2 	cp a,(TCHAR,sp) 
      008EA7 A1 31            [ 1]    3 	jrne prcnt_tst
      008EA9 27 02            [ 1]  746 	ld a,#TK_DIV 
      008EAB 20 0B A0         [ 2]  747 	jp token_char 
      001050                        748 prcnt_tst:
      001050                        749 	_case '%' eql_tst 
      008EAE 30 46            [ 1]    1 	ld a,#'%' 
      008EB0 09 03            [ 1]    2 	cp a,(TCHAR,sp) 
      008EB2 09 02            [ 1]    3 	jrne eql_tst
      008EB4 09 01            [ 1]  750 	ld a,#TK_MOD
      008EB6 20 E4 CF         [ 2]  751 	jp token_char  
                                    752 ; 1 or 2 character tokens 	
      008EB8                        753 eql_tst:
      00105B                        754 	_case '=' gt_tst 		
      008EB8 72 5A            [ 1]    1 	ld a,#'=' 
      008EBA 00 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008EBC 90 93            [ 1]    3 	jrne gt_tst
      008EBE 7B 01            [ 1]  755 	ld a,#TK_EQUAL
      008EC0 90 F7 90         [ 2]  756 	jp token_char 
      001066                        757 gt_tst:
      001066                        758 	_case '>' lt_tst 
      008EC3 5C 1E            [ 1]    1 	ld a,#'>' 
      008EC5 02 90            [ 1]    2 	cp a,(TCHAR,sp) 
      008EC7 FF 72            [ 1]    3 	jrne lt_tst
      008EC9 A9 00            [ 1]  759 	ld a,#TK_GT 
      008ECB 02 A6            [ 1]  760 	ld (ATTRIB,sp),a 
      008ECD 84 5B 03         [ 4]  761 	ld a,([in.w],y)
      008ED0 81 5C 00 01      [ 1]  762 	inc in 
      008ED1 A1 3D            [ 1]  763 	cp a,#'=
      008ED1 A1 41            [ 1]  764 	jrne 1$
      008ED3 8C 24            [ 1]  765 	ld a,#TK_GE 
      008ED5 0B A1            [ 2]  766 	jra token_char  
      008ED7 5B 25            [ 1]  767 1$: cp a,#'<
      008ED9 07 A1            [ 1]  768 	jrne 2$
      008EDB 61 8C            [ 1]  769 	ld a,#TK_NE 
      008EDD 24 02            [ 2]  770 	jra token_char 
      008EDF A1 7B 81 01      [ 1]  771 2$: dec in
      008EE2 7B 02            [ 1]  772 	ld a,(ATTRIB,sp)
      008EE2 A1 30            [ 2]  773 	jra token_char 	 
      00108F                        774 lt_tst:
      00108F                        775 	_case '<' other
      008EE4 25 03            [ 1]    1 	ld a,#'<' 
      008EE6 A1 3A            [ 1]    2 	cp a,(TCHAR,sp) 
      008EE8 8C 8C            [ 1]    3 	jrne other
      008EEA 81 34            [ 1]  776 	ld a,#TK_LT 
      008EEB 6B 02            [ 1]  777 	ld (ATTRIB,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      008EEB CD 8E E2         [ 4]  778 	ld a,([in.w],y)
      008EEE 25 03 CD 8E      [ 1]  779 	inc in 
      008EF2 D1 81            [ 1]  780 	cp a,#'=
      008EF4 26 04            [ 1]  781 	jrne 1$
      008EF4 A1 5F            [ 1]  782 	ld a,#TK_LE 
      008EF6 26 03            [ 2]  783 	jra token_char 
      008EF8 99 20            [ 1]  784 1$: cp a,#'>
      008EFA 03 CD            [ 1]  785 	jrne 2$
      008EFC 8E EB            [ 1]  786 	ld a,#TK_NE 
      008EFE 81 1F            [ 2]  787 	jra token_char 
      008EFF 72 5A 00 01      [ 1]  788 2$: dec in 
      008EFF 5C 02            [ 1]  789 	ld a,(ATTRIB,sp)
      008F00 20 17            [ 2]  790 	jra token_char 	
      0010B8                        791 other: ; not a special character 	 
      008F00 CD 99            [ 1]  792 	ld a,(TCHAR,sp)
      008F02 15 F7 5C         [ 4]  793 	call is_alpha 
      008F05 91 D6            [ 1]  794 	jrc 30$ 
      008F07 01 72 5C         [ 2]  795 	jp syntax_error 
      0010C2                        796 30$: 
      008F0A 00 02 CD         [ 4]  797 	call parse_keyword
      008F0D 8E F4 25         [ 2]  798 	cpw x,#remark 
      008F10 EF 7F            [ 1]  799 	jrne token_exit 
      008F12 72 5A            [ 1]  800 	ldw y,x 
      008F14 00 02 81         [ 2]  801 	jp copy_comment 
      008F17                        802 token_char:
      008F17 89               [ 1]  803 	ld (x),a 
      008F18 CD               [ 1]  804 	incw x
      008F19 8E FF            [ 1]  805 	ldw y,x 
      0010D3                        806 token_exit:
      0010D3                        807 	_drop VSIZE 
      008F1B 1E 01            [ 2]    1     addw sp,#VSIZE 
      008F1D E6               [ 4]  808 	ret
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
      0010D6                        828 compile::
      008F1E 02 26            [ 2]  829 	pushw y 
      0010D8                        830 	_vars VSIZE 
      008F20 0F E6            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      008F22 01 A0 41 AE 00   [ 1]  831 	mov basicptr,txtbgn
      008F27 03 42 1C 00      [ 1]  832 	bset flags,#FCOMP 
      008F2B 31 A6            [ 1]  833 	ld a,#0
      008F2D 85 20 36         [ 2]  834 	ldw x,#0
      008F30 CF 16 B8         [ 2]  835 	ldw pad,x ; destination buffer 
      008F30 AE B3 A4         [ 1]  836 	ld pad+2,a ; count 
      008F33 16 01 90         [ 2]  837 	ldw x,#pad+3
      008F36 5C CD 99 8B      [ 1]  838 	clr in 
      008F3A 4D 26 29         [ 4]  839 	call get_token
      008F3D 16 01            [ 1]  840 	cp a,#TK_INTGR
      008F3F A6 03            [ 1]  841 	jrne 2$
      008F41 90 F7 90         [ 2]  842 	cpw x,#1 
      008F44 5C 93            [ 1]  843 	jrpl 1$
      008F46 CD 94            [ 1]  844 	ld a,#ERR_BAD_VALUE
      008F48 6D A1 0F         [ 2]  845 	jp tb_error
      008F4B 23 02 A6         [ 2]  846 1$:	ldw pad,x 
      008F4E 0F AE 16 BB      [ 2]  847 	ldw y,#pad+3 
      008F4F 90 A3 17 74      [ 2]  848 2$:	cpw y,#stack_full 
      008F4F 88 05            [ 1]  849 	jrult 3$
      008F50 A6 0F            [ 1]  850 	ld a,#ERR_BUF_FULL 
      008F50 90 F6 27         [ 2]  851 	jp tb_error 
      001118                        852 3$:	
      008F53 09               [ 1]  853 	ldw x,y 
      008F54 90 5C 0A         [ 4]  854 	call get_token 
      008F57 01 26            [ 1]  855 	cp a,#TK_NONE 
      008F59 F6 4F            [ 1]  856 	jrne 2$ 
                                    857 ; compilation completed  
      008F5B 90 F7 90 5C      [ 2]  858 	subw y,#pad
      008F5F 5B 01            [ 1]  859     ld a,yl
      008F61 A6 03 5F         [ 2]  860 	ldw x,#pad 
      008F64 20 1B 19         [ 2]  861 	ldw ptr16,x 
      008F66 E7 02            [ 1]  862 	ld (2,x),a 
      008F66 16               [ 2]  863 	ldw x,(x)
      008F67 01 A1            [ 1]  864 	jreq 10$
      008F69 87 2B 06         [ 4]  865 	call insert_line
      008F6C 90 F7 90 5C      [ 1]  866 	clr  count 
      008F70 20 0F            [ 2]  867 	jra  11$ 
      008F72                        868 10$: ; line# is zero 
      008F72 A3 00 4A         [ 2]  869 	ldw x,ptr16  
      008F75 27 0A 90         [ 2]  870 	ldw basicptr,x 
      008F78 F7 90            [ 1]  871 	ld a,(2,x)
      008F7A 5C 90 FF         [ 1]  872 	ld count,a 
      008F7D 72 A9 00 02      [ 1]  873 	mov in,#3 
      001149                        874 11$:
      001149                        875 	_drop VSIZE 
      008F81 5B 02            [ 2]    1     addw sp,#VSIZE 
      008F83 81 1B 00 22      [ 1]  876 	bres flags,#FCOMP 
      008F84 90 85            [ 2]  877 	popw y 
      008F84 88               [ 4]  878 	ret 
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
      001152                         48 cpy_cmd_name:
      008F85 91               [ 2]   49 	tnzw x 
      008F86 D6 01            [ 1]   50 	jreq 10$
      008F88 27               [ 1]   51 	ld a,(x)
      008F89 0A               [ 1]   52 	incw x
      008F8A 11 01            [ 1]   53 	and a,#15  
      008F8C 26               [ 1]   54 	push a 
      008F8D 06 72            [ 1]   55     tnz (1,sp) 
      008F8F 5C 00            [ 1]   56 	jreq 9$
      008F91 02               [ 1]   57 1$:	ld a,(x)
      008F92 20 F1            [ 1]   58 	ld (y),a  
      008F94 5B               [ 1]   59 	incw x
      008F95 01 81            [ 1]   60 	incw y 
      008F97 0A 01            [ 1]   61 	dec (1,sp)	 
      008F97 52 02            [ 1]   62 	jrne 1$
      008F99 84               [ 1]   63 9$: pop a 
      001169                         64 10$: 
      008F99 90               [ 4]   65 	ret	
                                     66 
                                     67 ;--------------------------
                                     68 ; add a space after letter or 
                                     69 ; digit.
                                     70 ; input:
                                     71 ;   Y     pointer to buffer 
                                     72 ; output:
                                     73 ;   Y    moved to end 
                                     74 ;--------------------------
      00116A                         75 add_space:
      008F9A AE 16            [ 2]   76 	decw y 
      008F9C 68 A6            [ 1]   77 	ld a,(y)
      008F9E 20 CD            [ 1]   78 	incw y
      008FA0 8F 84            [ 1]   79 	cp a,#') 
      008FA2 55 00            [ 1]   80 	jreq 0$
      008FA4 02 00 03         [ 4]   81 	call is_alnum 
      008FA7 91 D6            [ 1]   82 	jrnc 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      001179                         83 0$: 
      008FA9 01 26            [ 1]   84 	ld a,#SPACE 
      008FAB 05 90            [ 1]   85 	ld (y),a 
      008FAD 93 CC            [ 1]   86 	incw y 
      008FAF 91               [ 4]   87 1$: ret 
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
      001180                         99 right_align::
      008FB0 53               [ 1]  100 	push a 
      008FB1 72 5C            [ 1]  101 0$: ld a,(1,sp)
      008FB3 00 02 CD         [ 1]  102 	cp a,tab_width 
      008FB6 99 15            [ 1]  103 	jrpl 1$
      008FB8 6B 01            [ 1]  104 	ld a,#SPACE 
      008FBA 5A               [ 2]  105 	decw x
      008FBA A6               [ 1]  106 	ld (x),a  
      008FBB 22 11            [ 1]  107 	inc (1,sp)
      008FBD 01 26            [ 2]  108 	jra 0$ 
      008FBF 0A               [ 1]  109 1$: pop a 	
      008FC0 A6               [ 4]  110 	ret 
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
      001192                        123 cpy_quote:
      008FC1 02 F7            [ 1]  124 	ld a,#'"
      008FC3 5C CD            [ 1]  125 	ld (y),a 
      008FC5 8D F0            [ 1]  126 	incw y 
      008FC7 CC               [ 2]  127 	pushw x 
      008FC8 91 53 D0         [ 4]  128 	call skip_string 
      008FCA 85               [ 2]  129 	popw x 
      008FCA A6               [ 1]  130 1$:	ld a,(x)
      008FCB 24 11            [ 1]  131 	jreq 9$
      008FCD 01               [ 1]  132 	incw x 
      008FCE 27 17            [ 1]  133 	cp a,#SPACE 
      008FD0 A6 26            [ 1]  134 	jrult 3$
      008FD2 11 01            [ 1]  135 	ld (y),a
      008FD4 26 0A            [ 1]  136 	incw y 
      008FD6 A6 84            [ 1]  137 	cp a,#'\ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      008FD8 F7 5C            [ 1]  138 	jrne 1$ 
      0011AD                        139 2$:
      008FDA CD 8E            [ 1]  140 	ld (y),a
      008FDC 96 CC            [ 1]  141 	incw y  
      008FDE 91 53            [ 2]  142 	jra 1$
      008FE0 7B               [ 1]  143 3$: push a 
      008FE1 01 CD            [ 1]  144 	ld a,#'\
      008FE3 8E E2            [ 1]  145 	ld (y),a 
      008FE5 24 0C            [ 1]  146 	incw y  
      008FE7 A6               [ 1]  147 	pop a 
      008FE8 84 F7            [ 1]  148 	sub a,#7
      008FEA 5C 7B 01         [ 1]  149 	ld acc8,a 
      008FED CD 8E 45 CC      [ 1]  150 	clr acc16
      008FF1 91               [ 2]  151 	pushw x
      008FF2 53 0D BD         [ 2]  152 	ldw x,#escaped 
      008FF3 72 BB 00 0D      [ 2]  153 	addw x,acc16 
      008FF3 A6               [ 1]  154 	ld a,(x)
      008FF4 28               [ 2]  155 	popw x
      008FF5 11 01            [ 2]  156 	jra 2$
      008FF7 26 05            [ 1]  157 9$: ld a,#'"
      008FF9 A6 06            [ 1]  158 	ld (y),a 
      008FFB CC 91            [ 1]  159 	incw y  
      008FFD 4F               [ 1]  160 	incw x 
      008FFE 81               [ 4]  161 	ret
                                    162 
                                    163 ;--------------------------
                                    164 ; return variable name 
                                    165 ; from its address.
                                    166 ; input:
                                    167 ;   X    variable address
                                    168 ; output:
                                    169 ;   A     variable letter
                                    170 ;--------------------------
      0011D8                        171 var_name::
      008FFE A6 5C 11         [ 2]  172 		subw x,#vars 
      009001 01 26            [ 1]  173 		ld a,#3
      009003 16               [ 2]  174 		div x,a 
      009004 A6               [ 1]  175 		ld a,xl 
      009005 04 F7            [ 1]  176 		add a,#'A 
      009007 5C               [ 4]  177 		ret 
                                    178 
                                    179 ;-----------------------------
                                    180 ; return cmd  idx from its 
                                    181 ; code address 
                                    182 ; input:
                                    183 ;   X      code address 
                                    184 ; output:
                                    185 ;   X      cmd_idx
                                    186 ;-----------------------------
      0011E2                        187 get_cmd_idx:
      009008 91 D6            [ 2]  188 	pushw y
      00900A 01 F7 5C 90      [ 2]  189 	ldw y,#code_addr 
      00900E 93 72 5C 00      [ 2]  190 	ldw ptr16,y 
      009012 02 5F            [ 1]  191 	clrw y 
      009014 97 A6 04         [ 5]  192 1$:	cpw x,([ptr16],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009017 CC 91            [ 1]  193 	jreq 3$ 
      009019 53 5C            [ 1]  194 	incw y 
      00901A 91 D6 19         [ 4]  195 	ld a,([ptr16],y)
      00901A A6 29            [ 1]  196 	incw y
      00901C 11 01 26         [ 4]  197 	or a,([ptr16],y)	
      00901F 05 A6            [ 1]  198 	jrne 1$
      009021 07               [ 1]  199 3$: ldw x,y 
      009022 CC 91            [ 2]  200 	popw y 
      009024 4F               [ 4]  201 	ret
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
      009025                        218 decompile::
      001203                        219 	_vars VSIZE
      009025 A6 3A            [ 2]    1     sub sp,#VSIZE 
      009027 11 01 26         [ 1]  220 	ld a,base
      00902A 05 A6            [ 1]  221 	ld (BASE_SAV,sp),a  
      00902C 0A CC 91         [ 1]  222 	ld a,tab_width 
      00902F 4F 02            [ 1]  223 	ld (WIDTH_SAV,sp),a 
      009030 17 03            [ 2]  224 	ldw (STR,sp),y   
      009030 A6 2C 11 01      [ 5]  225 	ldw x,[basicptr] ; line number 
      009034 26 05 A6 08      [ 1]  226 	mov base,#10
      009038 CC 91 4F 23      [ 1]  227 	mov tab_width,#5
      00903B 72 5F 00 0C      [ 1]  228 	clr acc24 
      00903B A6 23 11         [ 2]  229 	ldw acc16,x
      00903E 01               [ 1]  230 	clr a ; unsigned conversion 
      00903F 26 05 A6         [ 4]  231 	call itoa  
      009042 09 CC 91         [ 4]  232 	call right_align 
      009045 4F               [ 1]  233 	push a 
      009046 90 93            [ 1]  234 1$:	ldw y,x ; source
      009046 A6 2D            [ 2]  235 	ldw x,(STR+1,sp) ; destination
      009048 11 01 26         [ 4]  236 	call strcpy 
      00904B 05 A6            [ 1]  237 	clrw y 
      00904D 11               [ 1]  238 	pop a 
      00904E CC 91            [ 1]  239 	ld yl,a 
      009050 4F F9 03         [ 2]  240 	addw y,(STR,sp)
      009051 A6 20            [ 1]  241 	ld a,#SPACE 
      009051 A6 40            [ 1]  242 	ld (y),a 
      009053 11 01            [ 1]  243 	incw y 
      009055 26 05 A6 05      [ 1]  244 	clr tab_width
      009059 CC 91 4F         [ 2]  245 	ldw x,#3
      00905C CF 00 00         [ 2]  246 	ldw in.w,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      00124B                        247 decomp_loop:
      00905C A6 3F            [ 2]  248 	pushw y
      00905E 11 01 26         [ 4]  249 	call next_token 
      009061 12 A6            [ 2]  250 	popw y 
      009063 80               [ 1]  251 	tnz a  
      009064 F7 5C            [ 1]  252 	jrne 1$
      009066 90 93 AE         [ 2]  253 	jp 20$
      009069 00 66            [ 1]  254 1$:	jrmi 2$
      00906B 90 FF 72         [ 2]  255 	jp 6$
      00125D                        256 2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR|TK_AND|TK_OR|TK_XOR 
      00906E A9 00            [ 1]  257 	cp a,#TK_VAR 
      009070 02 CC            [ 1]  258 	jrne 3$
                                    259 ;; TK_VAR 
      009072 91 53 6A         [ 4]  260 	call add_space
      009074 CD 17 DF         [ 4]  261 	call get_addr   
      009074 A6 27 11         [ 4]  262 	call var_name
      009077 01 26            [ 1]  263 	ld (y),a 
      009079 35 A6            [ 1]  264 	incw y  
      00907B 80 F7            [ 2]  265 	jra decomp_loop
      001270                        266 3$:
      00907D 5C 90            [ 1]  267 	cp a,#TK_INTGR
      00907F AE 00            [ 1]  268 	jrne 4$
                                    269 ;; TK_INTGR
      009081 80 FF 1C         [ 4]  270 	call get_int24 
      009084 00 02 0C         [ 1]  271 	ld acc24,a 
      009086 CF 00 0D         [ 2]  272 	ldw acc16,x 
      009086 90 AE 16         [ 4]  273 	call add_space
      009089 68 72            [ 2]  274 	pushw y 
      00908B B9 00            [ 1]  275 	ld a,#255 ; signed conversion 
      00908D 01 90 89         [ 4]  276 	call itoa  
      009090 CD 94            [ 2]  277 	ldw y,(1,sp) 
      009092 89               [ 1]  278 	push a 
      009093 72               [ 1]  279 	exgw x,y 
      009094 F2 01 90         [ 4]  280 	call strcpy 
      009097 9F CB            [ 1]  281 	clrw y
      009099 00               [ 1]  282 	pop a  
      00909A 02 C7            [ 1]  283 	ld yl,a 
      00909C 00 02 1F         [ 2]  284 	addw y,(1,sp)
      001296                        285 	_drop 2 
      00909F 01 72            [ 2]    1     addw sp,#2 
      0090A1 F9 01            [ 2]  286 	jra decomp_loop
      00129A                        287 4$: ; dictionary keyword
      0090A3 90 5C            [ 1]  288 	cp a,#TK_NOT 
      0090A5 5B 02            [ 1]  289 	jruge 50$ 
      0090A7 AE               [ 2]  290 	ldw x,(x)
      0090A8 00 80 A6 80      [ 1]  291 	inc in 
      0090AC CC 91 53 01      [ 1]  292 	inc in 
      0090AF A3 00 80         [ 2]  293 	cpw x,#REM_IDX
      0090AF A6 2B            [ 1]  294 	jrne 5$
      0090B1 11 01 26         [ 2]  295 	ldw x,basicptr 
                                    296 ; copy comment to buffer 
      0090B4 05 A6 10         [ 4]  297 	call add_space
      0090B7 CC 91            [ 1]  298 	ld a,#''
      0090B9 4F F7            [ 1]  299 	ld (y),a 
      0090BA 90 5C            [ 1]  300 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      0012B8                        301 46$:
      0090BA A6 2A 11 01      [ 4]  302 	ld a,([in.w],x)
      0090BE 26 05 A6 20      [ 1]  303 	inc in  
      0090C2 CC 91            [ 1]  304 	ld (y),a 
      0090C4 4F 5C            [ 1]  305 	incw y 
      0090C5 C6 00 01         [ 1]  306 	ld a,in 
      0090C5 A6 2F 11         [ 1]  307 	cp a,count 
      0090C8 01 26            [ 1]  308 	jrmi 46$
      0090CA 05 A6 21         [ 2]  309 	jp 20$  
      0090CD CC 91 4F         [ 2]  310 5$: cpw x,#LET_IDX 
      0090D0 26 0B            [ 1]  311 	jrne 54$
      0090D0 A6 25 11         [ 2]  312 	jp decomp_loop ; down display LET
      0012D7                        313 50$:
      0090D3 01               [ 1]  314 	clrw x 
      0090D4 26 05            [ 1]  315 	sub a,#TK_NOT  
      0090D6 A6               [ 1]  316 	sll a 
      0090D7 22               [ 1]  317 	ld xl,a 
      0090D8 CC 91 4F         [ 2]  318 	addw x,#NOT_IDX
      0090DB                        319 54$: ; insert command name 
      0090DB A6 3D 11         [ 4]  320 	call add_space  
      0090DE 01 26            [ 2]  321 	pushw y
      0090E0 05 A6 32         [ 4]  322 	call cmd_name
      0090E3 CC 91            [ 2]  323 	popw y 
      0090E5 4F 11 52         [ 4]  324 	call cpy_cmd_name
      0090E6 CC 12 4B         [ 2]  325 	jp decomp_loop 
      0012EF                        326 6$:
                                    327 ; label?
      0090E6 A6 3E            [ 1]  328 	cp a,#TK_LABEL 
      0090E8 11 01            [ 1]  329 	jrne 64$
                                    330 ; copy label string to output buffer   	
      0090EA 26 23            [ 1]  331 	ld a,#32 
      0090EC A6 31            [ 1]  332 	ld (y),a 
      0090EE 6B 02            [ 1]  333 	incw y 
      0012F9                        334 61$:
      0090F0 91               [ 2]  335 	pushw x 
      0090F1 D6 01 72         [ 4]  336 	call skip_string 
      0090F4 5C               [ 2]  337 	popw x 
      0012FE                        338 62$:	
      0090F5 00               [ 1]  339 	ld a,(x)
      0090F6 02 A1            [ 1]  340 	jreq 63$ 
      0090F8 3D               [ 1]  341 	incw x  
      0090F9 26 04            [ 1]  342 	ld (y),a 
      0090FB A6 33            [ 1]  343 	incw y 
      0090FD 20 50            [ 2]  344 	jra 62$ 
      001308                        345 63$: 
      0090FF A1 3C            [ 1]  346 	ld a,#32 
      009101 26 04            [ 1]  347 	ld (y),a 
      009103 A6 35            [ 1]  348 	incw y 
      009105 20 48 72         [ 2]  349 	jp decomp_loop
      001311                        350 64$:
      009108 5A 00            [ 1]  351 	cp a,#TK_QSTR 
      00910A 02 7B            [ 1]  352 	jrne 7$
                                    353 ;; TK_QSTR
      00910C 02 20 40         [ 4]  354 	call add_space
      00910F CD 11 92         [ 4]  355 	call cpy_quote  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      00910F A6 3C 11         [ 2]  356 	jp decomp_loop
      00131E                        357 7$:
      009112 01 26            [ 1]  358 	cp a,#TK_CHAR 
      009114 23 A6            [ 1]  359 	jrne 8$
                                    360 ;; TK_CHAR
      009116 34 6B 02         [ 4]  361 	call add_space 
      009119 91 D6            [ 1]  362 	ld a,#'\ 
      00911B 01 72            [ 1]  363 	ld (y),a 
      00911D 5C 00            [ 1]  364 	incw y
      00911F 02               [ 1]  365 	ld a,(x)
      009120 A1 3D 26 04      [ 1]  366 	inc in  
      009124 A6 36            [ 2]  367 	jra 81$
      009126 20 27            [ 1]  368 8$: cp a,#TK_COLON 
      009128 A1 3E            [ 1]  369 	jrne 9$
      00912A 26 04            [ 1]  370 	ld a,#':
      001338                        371 81$:
      00912C A6 35            [ 1]  372 	ld (y),a 
      00912E 20 1F            [ 1]  373 	incw y 
      00133C                        374 82$:
      009130 72 5A 00         [ 2]  375 	jp decomp_loop
      00133F                        376 9$: 
      009133 02 7B            [ 1]  377 	cp a,#TK_SHARP
      009135 02 20            [ 1]  378 	jrugt 10$ 
      009137 17 05            [ 1]  379 	sub a,#TK_ARRAY 
      009138 5F               [ 1]  380 	clrw x 
      009138 7B               [ 1]  381 	ld xl,a
      009139 01 CD 8E         [ 2]  382 	addw x,#single_char 
      00913C D1               [ 1]  383 	ld a,(x)
      00913D 25 03            [ 2]  384 	jra 81$ 
      00134D                        385 10$: 
      00913F CC 97            [ 1]  386 	cp a,#TK_MINUS 
      009141 29 0A            [ 1]  387 	jrugt 11$
      009142 A0 10            [ 1]  388 	sub a,#TK_PLUS 
      009142 CD               [ 1]  389 	clrw x 
      009143 8F               [ 1]  390 	ld xl,a 
      009144 17 A3 A1         [ 2]  391 	addw x,#add_char 
      009147 BC               [ 1]  392 	ld a,(x)
      009148 26 09            [ 2]  393 	jra 81$
      00135B                        394 11$:
      00914A 90 93            [ 1]  395     cp a,#TK_MOD 
      00914C CC 90            [ 1]  396 	jrugt 12$
      00914E 86 20            [ 1]  397 	sub a,#TK_MULT
      00914F 5F               [ 1]  398 	clrw x 
      00914F F7               [ 1]  399 	ld xl,a 
      009150 5C 90 93         [ 2]  400 	addw x,#mul_char
      009153 F6               [ 1]  401 	ld a,(x)
      009153 5B 02            [ 2]  402 	jra 81$
      001369                        403 12$:
      009155 81 31            [ 1]  404 	sub a,#TK_GT  
      009156 48               [ 1]  405 	sll a 
      009156 90               [ 1]  406 	clrw x 
      009157 89               [ 1]  407 	ld xl,a 
      009158 52 02 55         [ 2]  408 	addw x,#relop_str 
      00915B 00               [ 2]  409 	ldw x,(x)
      00915C 1C               [ 1]  410 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      00915D 00               [ 1]  411 	incw x 
      00915E 05 72            [ 1]  412 	ld (y),a
      009160 1A 00            [ 1]  413 	incw y 
      009162 23               [ 1]  414 	ld a,(x)
      009163 A6 00            [ 1]  415 	jrne 81$
      009165 AE 00 00         [ 2]  416 	jp decomp_loop 
      00137E                        417 20$: 
      009168 CF 16            [ 1]  418 	clr (y)
      00916A B8 C7            [ 2]  419 	ldw x,(STR,sp)
      00916C 16 BA            [ 1]  420 	ld a,(BASE_SAV,sp)
      00916E AE 16 BB         [ 1]  421 	ld base,a 
      009171 72 5F            [ 1]  422 	ld a,(WIDTH_SAV,sp)
      009173 00 02 CD         [ 1]  423 	ld tab_width,a
      009176 8F 97 A1         [ 2]  424 	subw y,(STR,sp) 
      009179 84 26            [ 1]  425 	ld a,yl 
      001391                        426 	_drop VSIZE 
      00917B 11 A3            [ 2]    1     addw sp,#VSIZE 
      00917D 00               [ 4]  427 	ret 
                                    428 
      00917E 01 2A 05 A6 0A         429 single_char: .byte '@','(',')',',','#'
      009183 CC 97                  430 add_char: .byte '+','-'
      009185 2B CF 16               431 mul_char: .byte '*','/','%'
      009188 B8 90 AE 16 BB 90 A3   432 relop_str: .word gt,equal,ge,lt,ne,le 
             17 74 25 05 A6
      009194 0F CC                  433 gt: .asciz ">"
      009196 97 2B                  434 equal: .asciz "="
      009198 3E 3D 00               435 ge: .asciz ">="
      009198 93 CD                  436 lt: .asciz "<"
      00919A 8F 97 A1               437 le: .asciz "<="
      00919D 00 26 ED               438 ne:  .asciz "<>"
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
      0013B9                        451 cmd_name:
      0013B9                        452 	_vars VSIZE 
      0091A0 72 A2            [ 2]    1     sub sp,#VSIZE 
      0091A2 16 B8 90 9F      [ 1]  453 	clr acc16 
      0091A6 AE 16            [ 2]  454 	ldw (CMDX,sp),x  
      0091A8 B8 CF 00         [ 2]  455 	ldw x,#kword_dict	
      0091AB 1A E7            [ 2]  456 1$:	ldw (LINK,sp),x
      0091AD 02 FE            [ 1]  457 	ld a,(2,x)
      0091AF 27 09            [ 1]  458 	and a,#15 
      0091B1 CD 8D 7E         [ 1]  459 	ld acc8,a 
      0091B4 72 5F 00         [ 2]  460 	addw x,#3
      0091B7 04 20 0F 0D      [ 2]  461 	addw x,acc16
      0091BA FE               [ 2]  462 	ldw x,(x) ; command index  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      0091BA CE 00            [ 2]  463 	cpw x,(CMDX,sp)
      0091BC 1A CF            [ 1]  464 	jreq 2$
      0091BE 00 05            [ 2]  465 	ldw x,(LINK,sp)
      0091C0 E6               [ 2]  466 	ldw x,(x) 
      0091C1 02 C7 00         [ 2]  467 	subw x,#2  
      0091C4 04 35            [ 1]  468 	jrne 1$
      0091C6 03               [ 1]  469 	clr a 
      0091C7 00               [ 1]  470 	clrw x 
      0091C8 02 05            [ 2]  471 	jra 9$
      0091C9 1E 03            [ 2]  472 2$: ldw x,(LINK,sp)
      0091C9 5B 02 72         [ 2]  473 	addw x,#2 	
      0013EA                        474 9$:	_drop VSIZE
      0091CC 1B 00            [ 2]    1     addw sp,#VSIZE 
      0091CE 23               [ 4]  475 	ret
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
      0013ED                        116 strlen::
      0091CF 90               [ 2]  117 	pushw x 
      0091D0 85               [ 1]  118 	clr a
      0091D1 81               [ 1]  119 1$:	tnz (x) 
      0091D2 27 04            [ 1]  120 	jreq 9$ 
      0091D2 5D               [ 1]  121 	inc a 
      0091D3 27               [ 1]  122 	incw x 
      0091D4 14 F6            [ 2]  123 	jra 1$ 
      0091D6 5C               [ 2]  124 9$:	popw x 
      0091D7 A4               [ 4]  125 	ret 
                                    126 
                                    127 ;------------------------------------
                                    128 ; compare 2 strings
                                    129 ; input:
                                    130 ;   X 		char* first string 
                                    131 ;   Y       char* second string 
                                    132 ; output:
                                    133 ;   A 		0 not == |1 ==  
                                    134 ;-------------------------------------
      0013F8                        135 strcmp:
      0091D8 0F               [ 1]  136 	ld a,(x)
      0091D9 88 0D            [ 1]  137 	jreq 5$ 
      0091DB 01 27            [ 1]  138 	cp a,(y) 
      0091DD 0A F6            [ 1]  139 	jrne 4$ 
      0091DF 90               [ 1]  140 	incw x 
      0091E0 F7 5C            [ 1]  141 	incw y 
      0091E2 90 5C            [ 2]  142 	jra strcmp 
      001404                        143 4$: ; not same  
      0091E4 0A               [ 1]  144 	clr a 
      0091E5 01               [ 4]  145 	ret 
      001406                        146 5$: ; same 
      0091E6 26 F6            [ 1]  147 	ld a,#1 
      0091E8 84               [ 4]  148 	ret 
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
      0091E9                        159 strcpy::
      0091E9 81               [ 1]  160 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      0091EA 89               [ 2]  161 	pushw x 
      0091EA 90 5A            [ 1]  162 1$: ld a,(y)
      0091EC 90 F6            [ 1]  163 	jreq 9$ 
      0091EE 90               [ 1]  164 	ld (x),a 
      0091EF 5C               [ 1]  165 	incw x 
      0091F0 A1 29            [ 1]  166 	incw y 
      0091F2 27 05            [ 2]  167 	jra 1$ 
      0091F4 CD               [ 1]  168 9$:	clr (x)
      0091F5 8E               [ 2]  169 	popw x 
      0091F6 EB               [ 1]  170 	pop a 
      0091F7 24               [ 4]  171 	ret 
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
      001419                        185 move::
      0091F8 06               [ 1]  186 	push a 
      0091F9                        187 	_vars VSIZE 
      0091F9 A6 20            [ 2]    1     sub sp,#VSIZE 
      0091FB 90 F7            [ 1]  188 	clr (INCR,sp)
      0091FD 90 5C            [ 1]  189 	clr (LB,sp)
      0091FF 81 89            [ 2]  190 	pushw y 
      009200 13 01            [ 2]  191 	cpw x,(1,sp) ; compare DEST to SRC 
      009200 88 7B            [ 2]  192 	popw y 
      009202 01 C1            [ 1]  193 	jreq move_exit ; x==y 
      009204 00 24            [ 1]  194 	jrmi move_down
      00142A                        195 move_up: ; start from top address with incr=-1
      009206 2A 08 A6 20      [ 2]  196 	addw x,acc16
      00920A 5A F7 0C 01      [ 2]  197 	addw y,acc16
      00920E 20 F1            [ 1]  198 	cpl (INCR,sp)
      009210 84 81            [ 1]  199 	cpl (LB,sp)   ; increment = -1 
      009212 20 05            [ 2]  200 	jra move_loop  
      001438                        201 move_down: ; start from bottom address with incr=1 
      009212 A6               [ 2]  202     decw x 
      009213 22 90            [ 2]  203 	decw y
      009215 F7 90            [ 1]  204 	inc (LB,sp) ; incr=1 
      00143D                        205 move_loop:	
      009217 5C 89 CD         [ 1]  206     ld a, acc16 
      00921A 98 50 85         [ 1]  207 	or a, acc8
      00921D F6 27            [ 1]  208 	jreq move_exit 
      00921F 30 5C A1         [ 2]  209 	addw x,(INCR,sp)
      009222 20 25 0E         [ 2]  210 	addw y,(INCR,sp) 
      009225 90 F7            [ 1]  211 	ld a,(y)
      009227 90               [ 1]  212 	ld (x),a 
      009228 5C               [ 2]  213 	pushw x 
      009229 A1 5C 26         [ 2]  214 	ldw x,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00922C F0               [ 2]  215 	decw x 
      00922D CF 00 0D         [ 2]  216 	ldw acc16,x 
      00922D 90               [ 2]  217 	popw x 
      00922E F7 90            [ 2]  218 	jra move_loop
      001459                        219 move_exit:
      001459                        220 	_drop VSIZE
      009230 5C 20            [ 2]    1     addw sp,#VSIZE 
      009232 EA               [ 1]  221 	pop a 
      009233 88               [ 4]  222 	ret 	
                                    223 
                                    224 ;------------------------------------
                                    225 ;  set all variables to zero 
                                    226 ; input:
                                    227 ;   none 
                                    228 ; output:
                                    229 ;	none
                                    230 ;------------------------------------
      00145D                        231 clear_vars:
      009234 A6               [ 2]  232 	pushw x 
      009235 5C               [ 1]  233 	push a  
      009236 90 F7 90         [ 2]  234 	ldw x,#vars 
      009239 5C 84            [ 1]  235 	ld a,#CELL_SIZE*26 
      00923B A0               [ 1]  236 1$:	clr (x)
      00923C 07               [ 1]  237 	incw x 
      00923D C7               [ 1]  238 	dec a 
      00923E 00 0F            [ 1]  239 	jrne 1$
      009240 72               [ 1]  240 	pop a 
      009241 5F               [ 2]  241 	popw x 
      009242 00               [ 4]  242 	ret 
                                    243 
                                    244 
                                    245 ;-----------------------
                                    246 ;  display system 
                                    247 ;  information 
                                    248 ;-----------------------
                           000002   249 	MAJOR=2
                           000000   250 	MINOR=0 
      009243 0E 89 AE 8E 3D 72 BB   251 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
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
      009258                        253 system_information:
      009258 1D 00 31         [ 2]  254 	ldw x,#software 
      00925B A6 03 62         [ 4]  255 	call puts 
      00925E 9F AB            [ 1]  256 	ld a,#MAJOR 
      009260 41 81 0E         [ 1]  257 	ld acc8,a 
      009262 5F               [ 1]  258 	clrw x 
      009262 90 89 90         [ 2]  259 	ldw acc24,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      009265 AE B3 AA 90      [ 1]  260 	clr tab_width  
      009269 CF 00 1A 90      [ 1]  261 	mov base, #10 
      00926D 5F 91 D3         [ 4]  262 	call prt_acc24 
      009270 1A 27            [ 1]  263 	ld a,#'.
      009272 0C 90 5C         [ 4]  264 	call putc 
      009275 91 D6            [ 1]  265 	ld a,#MINOR 
      009277 1A 90 5C         [ 1]  266 	ld acc8,a 
      00927A 91               [ 1]  267 	clrw x 
      00927B DA 1A 26         [ 2]  268 	ldw acc24,x 
      00927E EF 93 90         [ 4]  269 	call prt_acc24
      009281 85 81            [ 1]  270 	ld a,#CR 
      009283 CD 09 40         [ 4]  271 	call putc
                                    272 ;call test 
      009283 52               [ 4]  273 	ret
                                    274 
      0014E3                        275 warm_init:
      009284 04 C6 00 0B      [ 2]  276 	ldw y,#XSTACK_EMPTY  
      009288 6B 01 C6 00      [ 1]  277 	clr flags 
      00928C 24 6B 02 17      [ 1]  278 	clr loop_depth 
      009290 03 72 CE 00      [ 1]  279 	mov tab_width,#TAB_WIDTH 
      009294 05 35 0A 00      [ 1]  280 	mov base,#10 
      009298 0B 35 05         [ 2]  281 	ldw x,#0 
      00929B 00 24 72         [ 2]  282 	ldw basicptr,x 
      00929E 5F 00 0D         [ 2]  283 	ldw in.w,x 
      0092A1 CF 00 0E 4F      [ 1]  284 	clr count
      0092A5 CD               [ 4]  285 	ret 
                                    286 
                                    287 ;---------------------------
                                    288 ; reset BASIC text variables 
                                    289 ; and clear variables 
                                    290 ;---------------------------
      001505                        291 clear_basic:
      0092A6 98               [ 2]  292 	pushw x 
      0092A7 BC CD 92 00      [ 1]  293 	clr count
      0092AB 88 90 93 1E      [ 1]  294 	clr in  
      0092AF 04 CD 94         [ 2]  295 	ldw x,#free_ram 
      0092B2 89 90 5F         [ 2]  296 	ldw txtbgn,x 
      0092B5 84 90 97         [ 2]  297 	ldw txtend,x 
      0092B8 72 F9 03         [ 4]  298 	call clear_vars 
      0092BB A6               [ 2]  299 	popw x
      0092BC 20               [ 4]  300 	ret 
                                    301 
                                    302 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    303 ;;   Tiny BASIC error messages     ;;
                                    304 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00151C                        305 err_msg:
      0092BD 90 F7 90 5C 72 5F 00   306 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             24 AE 00 03 CF
      0092C9 00 01 15 AD 15 C7 15   307 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             D8 15 E9
      0092CB 15 F5 16 28 16 38 16   308 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             4C 16 5F
      0092CB 90 89                  309 	.word err_overflow 
                                    310 
      0092CD CD 98 2A 90 85 4D 26   311 err_mem_full: .asciz "Memory full\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal  03-Bits]



             66 75 6C 6C 0A 00
      0092D5 CC 93 FE 2B 03 CC 93   312 err_syntax: .asciz "syntax error\n" 
             6F 72 72 6F 72 0A 00
      0092DD 6D 61 74 68 20 6F 70   313 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      0092DD A1 85 26 0F CD 91 EA   314 err_div0: .asciz "division by 0\n" 
             CD 98 5F CD 92 58 90
             F7
      0092EC 90 5C 20 DB 6C 69 64   315 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      0092F0 72 75 6E 20 74 69 6D   316 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      0092F0 A1 84 26 26 CD 98 69   317 err_cmd_only: .asciz "command line only usage.\n"
             C7 00 0D CF 00 0E CD
             91 EA 90 89 A6 FF CD
             98 BC 16 01 88
      00930A 51 CD 94 89 90 5F 84   318 err_duplicate: .asciz "duplicate name.\n"
             90 97 72 F9 01 5B 02
             20 B1 00
      00931A 46 69 6C 65 20 6E 6F   319 err_not_file: .asciz "File not found.\n"
             74 20 66 6F 75 6E 64
             2E 0A 00
      00931A A1 87 24 39 FE 72 5C   320 err_bad_value: .asciz "bad value.\n"
             00 02 72 5C 00
      009326 02 A3 00 80 26 23 CE   321 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             00 05 CD 91 EA A6 27
             90 F7 90 5C 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      009338 4E 6F 20 64 61 74 61   322 err_no_data: .asciz "No data found.\n"
             20 66 6F 75 6E 64 2E
             0A 00
      009338 72 D6 00 01 72 5C 00   323 err_no_prog: .asciz "No program in RAM!\n"
             02 90 F7 90 5C C6 00
             02 C1 00 04 2B EC
      00934C CC 93 FE A3 00 4A 26   324 err_no_fspace: .asciz "File system full.\n" 
             0B CC 92 CB 20 66 75
             6C 6C 2E 0A 00
      009357 42 75 66 66 65 72 20   325 err_buf_full: .asciz "Buffer full\n"
             66 75 6C 6C 0A 00
      009357 5F A0 87 48 97 1C 00   326 err_overflow: .asciz "overflow\n" 
             F8 0A 00
                                    327 
      00935F 0A 72 75 6E 20 74 69   328 rt_msg: .asciz "\nrun time error, "
             6D 65 20 65 72 72 6F
             72 2C 20 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00935F CD 91 EA 90 89 CD 94   329 comp_msg: .asciz "\ncompile error, "
             39 90 85 CD 91 D2 CC
             92 CB 00
      00936F 6C 61 73 74 20 74 6F   330 tk_id: .asciz "last token id: "
             6B 65 6E 20 69 64 3A
             20 00
                                    331 
      0016A9                        332 syntax_error::
      00936F A1 03            [ 1]  333 	ld a,#ERR_SYNTAX 
                                    334 
      0016AB                        335 tb_error::
      009371 26 1E A6 20 90   [ 2]  336 	btjt flags,#FCOMP,1$
      009376 F7               [ 1]  337 	push a 
      009377 90 5C 76         [ 2]  338 	ldw x, #rt_msg 
      009379 CD 09 9D         [ 4]  339 	call puts 
      009379 89               [ 1]  340 	pop a 
      00937A CD 98 50         [ 2]  341 	ldw x, #err_msg 
      00937D 85 5F 00 0D      [ 1]  342 	clr acc16 
      00937E 48               [ 1]  343 	sll a
      00937E F6 27 07 5C      [ 1]  344 	rlc acc16  
      009382 90 F7 90         [ 1]  345 	ld acc8, a 
      009385 5C 20 F6 0D      [ 2]  346 	addw x,acc16 
      009388 FE               [ 2]  347 	ldw x,(x)
      009388 A6 20 90         [ 4]  348 	call puts
      00938B F7 90 5C         [ 2]  349 	ldw x,basicptr 
                           000001   350 .if DEBUG 
      00938E CC 92 CB         [ 1]  351 ld a,count 
      009391 90 5F            [ 1]  352 clrw y 
      009391 A1 02            [ 1]  353 rlwa y  
      009393 26 09 CD         [ 4]  354 call hex_dump
      009396 91 EA CD         [ 2]  355 ldw x,basicptr
                                    356 .endif 
      009399 92 12 CC         [ 1]  357 	ld a,in 
      00939C 92 CB D6         [ 4]  358 	call prt_basic_line
      00939E AE 16 99         [ 2]  359 	ldw x,#tk_id 
      00939E A1 04 26         [ 4]  360 	call puts 
      0093A1 10 CD 91         [ 1]  361 	ld a,in.saved 
      0093A4 EA               [ 1]  362 	clrw x 
      0093A5 A6               [ 1]  363 	ld xl,a 
      0093A6 5C 90 F7 90      [ 2]  364 	addw x,basicptr 
      0093AA 5C               [ 1]  365 	ld a,(x)
      0093AB F6               [ 1]  366 	clrw x 
      0093AC 72               [ 1]  367 	ld xl,a 
      0093AD 5C 00 02         [ 4]  368 	call prt_i16
      0093B0 20 06            [ 2]  369 	jra 6$
      0016FC                        370 1$:	
      0093B2 A1               [ 1]  371 	push a 
      0093B3 0A 26 09         [ 2]  372 	ldw x,#comp_msg
      0093B6 A6 3A 9D         [ 4]  373 	call puts 
      0093B8 84               [ 1]  374 	pop a 
      0093B8 90 F7 90         [ 2]  375 	ldw x, #err_msg 
      0093BB 5C 5F 00 0D      [ 1]  376 	clr acc16 
      0093BC 48               [ 1]  377 	sll a
      0093BC CC 92 CB 0D      [ 1]  378 	rlc acc16  
      0093BF C7 00 0E         [ 1]  379 	ld acc8, a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      0093BF A1 09 22 0A      [ 2]  380 	addw x,acc16 
      0093C3 A0               [ 2]  381 	ldw x,(x)
      0093C4 05 5F 97         [ 4]  382 	call puts
      0093C7 1C 94 14         [ 2]  383 	ldw x,#tib
      0093CA F6 20 EB         [ 4]  384 	call puts 
      0093CD A6 0D            [ 1]  385 	ld a,#CR 
      0093CD A1 11 22         [ 4]  386 	call putc
      0093D0 0A A0 10         [ 2]  387 	ldw x,in.w
      0093D3 5F 97 1C         [ 4]  388 	call spaces
      0093D6 94 19            [ 1]  389 	ld a,#'^
      0093D8 F6 20 DD         [ 4]  390 	call putc 
      0093DB AE 17 FF         [ 2]  391 6$: ldw x,#STACK_EMPTY 
      0093DB A1               [ 1]  392     ldw sp,x
                                    393 
      001735                        394 warm_start:
      0093DC 22 22 0A         [ 4]  395 	call warm_init
                                    396 ;----------------------------
                                    397 ;   BASIC interpreter
                                    398 ;----------------------------
      001738                        399 cmd_line: ; user interface 
      0093DF A0 20            [ 1]  400 	ld a,#CR 
      0093E1 5F 97 1C         [ 4]  401 	call putc 
      0093E4 94 1B            [ 1]  402 	ld a,#'> 
      0093E6 F6 20 CF         [ 4]  403 	call putc
      0093E9 CD 0A A2         [ 4]  404 	call readln
      0093E9 A0 31 48 5F      [ 1]  405 	tnz count 
      0093ED 97 1C            [ 1]  406 	jreq cmd_line
      0093EF 94 1E FE         [ 4]  407 	call compile
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
      0093F2 F6 5C 90 F7      [ 1]  421 	tnz count 
      0093F6 90 5C            [ 1]  422 	jreq cmd_line
                                    423 	
                                    424 ; if direct command 
                                    425 ; it's ready to interpret 
                                    426 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    427 ;; This is the interpreter loop
                                    428 ;; for each BASIC code line. 
                                    429 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      001754                        430 interpreter: 
      0093F8 F6 26 BD         [ 1]  431 	ld a,in 
      0093FB CC 92 CB         [ 1]  432 	cp a,count 
      0093FE 2B 1D            [ 1]  433 	jrmi interp_loop
      00175C                        434 next_line:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      0093FE 90 7F 1E 03 7B   [ 2]  435 	btjf flags, #FRUN, cmd_line
      009403 01 C7 00         [ 2]  436 	ldw x,basicptr
      009406 0B 7B 02 C7      [ 2]  437 	addw x,in.w 
      00940A 00 24 72         [ 2]  438 	cpw x,txtend 
      00940D F2 03            [ 1]  439 	jrpl warm_start
      00940F 90 9F 5B         [ 2]  440 	ldw basicptr,x ; start of next line  
      009412 04 81            [ 1]  441 	ld a,(2,x)
      009414 40 28 29         [ 1]  442 	ld count,a 
      009417 2C 23 2B 2D      [ 1]  443 	mov in,#3 ; skip first 3 bytes of line 
      001779                        444 interp_loop:
      00941B 2A 2F 25         [ 4]  445 	call next_token
      00941E 94 2A            [ 1]  446 	cp a,#TK_NONE 
      009420 94 2C            [ 1]  447 	jreq next_line 
      009422 94 2E            [ 1]  448 	cp a,#TK_CMD
      009424 94 31            [ 1]  449 	jrne 1$
      009426 94 36 94         [ 4]  450 	call get_code_addr
      009429 33               [ 4]  451 	call (x) 
      00942A 3E 00            [ 2]  452 	jra interp_loop 
      00178A                        453 1$:	 
      00942C 3D 00            [ 1]  454 	cp a,#TK_VAR
      00942E 3E 3D            [ 1]  455 	jrne 2$
      009430 00 3C 00         [ 4]  456 	call let_var  
      009433 3C 3D            [ 2]  457 	jra interp_loop 
      001793                        458 2$:	
      009435 00 3C            [ 1]  459 	cp a,#TK_ARRAY 
      009437 3E 00            [ 1]  460 	jrne 3$
      009439 CD 1C 8C         [ 4]  461 	call let_array 
      009439 52 04            [ 2]  462 	jra interp_loop
      00179C                        463 3$:	
      00943B 72 5F            [ 1]  464 	cp a,#TK_COLON 
      00943D 00 0E            [ 1]  465 	jreq interp_loop
      00943F 1F 01            [ 1]  466 4$: cp a,#TK_LABEL
      009441 AE B3 A2         [ 4]  467 	call skip_string 
      009444 1F 03            [ 2]  468 	jra interp_loop 
      009446 E6 02 A4         [ 2]  469 5$:	jp syntax_error 
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
      0017AA                        480 next_token::
                                    481 ;	clrw x 
      009449 0F C7 00         [ 1]  482 	ld a,in 
      00944C 0F 1C 00         [ 1]  483 	ld in.saved,a ; in case "_unget_token" needed 
                                    484 ; don't replace sub by "cp a,count" 
                                    485 ; if end of line must return with A=0   	
      00944F 03 72 BB         [ 1]  486 	sub a,count 
      009452 00 0E            [ 1]  487 	jreq 9$ ; end of line 
      0017B5                        488 0$: 
      009454 FE 13 01         [ 2]  489 	ldw x,basicptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      009457 27 0C 1E 03      [ 2]  490 	addw x,in.w 
      00945B FE               [ 1]  491 	ld a,(x)
      00945C 1D               [ 1]  492 	incw x
      00945D 00 02 26 E3      [ 1]  493 	inc in   
      009461 4F               [ 4]  494 9$: ret 
                                    495 
                                    496 ;------------------------
                                    497 ; get cmd and function 
                                    498 ; code address 
                                    499 ; input:
                                    500 ;    X   * cmd|func index 
                                    501 ;        in code_addr table 
                                    502 ;------------------------
      0017C3                        503 get_code_addr:
      009462 5F               [ 2]  504 	ldw x,(x)
      009463 20 05 1E         [ 2]  505 	ldw x,(code_addr,x)
      009466 03 1C 00 02      [ 1]  506 	inc in 
      00946A 5B 04 81 01      [ 1]  507 	inc in 
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
      00946D A6 FF            [ 1]  604 	ld a,#255  ; signed conversion  
      00946D 89 4F 7D         [ 4]  605     call itoa  ; conversion entier en  .asciz
      009470 27 04 4C         [ 4]  606 	call right_align  
      009473 5C               [ 1]  607 	push a 
      009474 20 F9 85         [ 4]  608 	call puts
      009477 81               [ 1]  609 	pop a 
      009478 81               [ 4]  610     ret	
                                    611 
                                    612 ;---------------------------------------
                                    613 ;  print value at xstack top 
                                    614 ;---------------------------------------
      001824                        615 print_top: 
      001824                        616 	_xpop 
      009478 F6 27            [ 1]    1     ld a,(y)
      00947A 0B               [ 1]    2     ldw x,y 
      00947B 90 F1            [ 2]    3     ldw x,(1,x)
      00947D 26 05 5C 90      [ 2]    4     addw y,#CELL_SIZE 
      009481 5C 20 F4         [ 1]  617 	ld acc24,a 
      009484 CF 00 0D         [ 2]  618 	ldw acc16,x 
      009484 4F 81 16         [ 4]  619 	call prt_acc24 
      009486 A6 20            [ 1]  620 	ld a,#SPACE
      009486 A6 01 81         [ 4]  621 	call putc 
      009489 81               [ 4]  622 	ret 
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
      00183C                        638 itoa::
      00183C                        639 	_vars VSIZE
      009489 88 89            [ 2]    1     sub sp,#VSIZE 
      00948B 90 F6            [ 1]  640 	clr (LEN,sp) ; string length  
      00948D 27 06            [ 1]  641 	clr (SIGN,sp)    ; sign
      00948F F7               [ 1]  642 	tnz A
      009490 5C 90            [ 1]  643 	jreq 1$ ; unsigned conversion  
      009492 5C 20 F6         [ 1]  644 	ld a,base 
      009495 7F 85            [ 1]  645 	cp a,#10
      009497 84 81            [ 1]  646 	jrne 1$
                                    647 	; base 10 string display with negative sign if bit 23==1
      009499 72 0F 00 0C 05   [ 2]  648 	btjf acc24,#7,1$
      009499 88 52            [ 1]  649 	cpl (SIGN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      00949B 02 0F 01         [ 4]  650 	call neg_acc24
      001856                        651 1$:
                                    652 ; initialize string pointer 
      00949E 0F 02 90         [ 2]  653 	ldw x,#tib 
      0094A1 89 13 01         [ 2]  654 	addw x,#TIB_SIZE
      0094A4 90               [ 2]  655 	decw x 
      0094A5 85               [ 1]  656 	clr (x)
      00185E                        657 itoa_loop:
      0094A6 27 31 2B         [ 1]  658     ld a,base
                                    659 ;	ldw (PSTR,sp),x 
      0094A9 0E 03 05         [ 4]  660     call divu24_8 ; acc24/A 
                                    661 ;	ldw x,(PSTR,sp)
      0094AA AB 30            [ 1]  662     add a,#'0  ; remainder of division
      0094AA 72 BB            [ 1]  663     cp a,#'9+1
      0094AC 00 0E            [ 1]  664     jrmi 2$
      0094AE 72 B9            [ 1]  665     add a,#7 
      00186C                        666 2$:	
      0094B0 00               [ 2]  667 	decw x
      0094B1 0E               [ 1]  668     ld (x),a
      0094B2 03 01            [ 1]  669 	inc (LEN,sp)
                                    670 	; if acc24==0 conversion done
      0094B4 03 02 20         [ 1]  671 	ld a,acc24
      0094B7 05 00 0D         [ 1]  672 	or a,acc16
      0094B8 CA 00 0E         [ 1]  673 	or a,acc8
      0094B8 5A 90            [ 1]  674     jrne itoa_loop
                                    675 	;conversion done, next add '$' or '-' as required
      0094BA 5A 0C 02         [ 1]  676 	ld a,base 
      0094BD A1 10            [ 1]  677 	cp a,#16
      0094BD C6 00            [ 1]  678 	jreq 8$
      0094BF 0E CA            [ 1]  679 	ld a,(SIGN,sp)
      0094C1 00 0F            [ 1]  680     jreq 10$
      0094C3 27 14            [ 1]  681     ld a,#'-
      0094C5 72 FB            [ 2]  682 	jra 9$ 
      00188A                        683 8$:	
      0094C7 01 72            [ 1]  684 	ld a,#'$ 
      0094C9 F9               [ 2]  685 9$: decw x
      0094CA 01               [ 1]  686     ld (x),a
      0094CB 90 F6            [ 1]  687 	inc (LEN,sp)
      001890                        688 10$:
      0094CD F7 89            [ 1]  689 	ld a,(LEN,sp)
      001892                        690 	_drop VSIZE
      0094CF CE 00            [ 2]    1     addw sp,#VSIZE 
      0094D1 0E               [ 4]  691 	ret
                                    692 
                                    693 ;------------------------------------
                                    694 ; convert alpha to uppercase
                                    695 ; input:
                                    696 ;    a  character to convert
                                    697 ; output:
                                    698 ;    a  uppercase character
                                    699 ;------------------------------------
      001895                        700 to_upper::
      0094D2 5A CF            [ 1]  701 	cp a,#'a
      0094D4 00 0E            [ 1]  702 	jrpl 1$
      0094D6 85               [ 4]  703 0$:	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      0094D7 20 E4            [ 1]  704 1$: cp a,#'z	
      0094D9 22 FB            [ 1]  705 	jrugt 0$
      0094D9 5B 02            [ 1]  706 	sub a,#32
      0094DB 84               [ 4]  707 	ret
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
      0018A1                        721 atoi24::
      0094DC 81               [ 2]  722 	pushw x 
      0094DD                        723 	_vars VSIZE
      0094DD 89 88            [ 2]    1     sub sp,#VSIZE 
                                    724 	; acc24=0 
      0094DF AE 00 31 A6      [ 1]  725 	clr acc24    
      0094E3 4E 7F 5C 4A      [ 1]  726 	clr acc16
      0094E7 26 FB 84 85      [ 1]  727 	clr acc8 
      0094EB 81 0A            [ 1]  728 	clr (SIGN,sp)
      0094ED 0A 54            [ 1]  729 	ld a,#10
      0094EF 69 6E            [ 1]  730 	ld (BASE,sp),a ; default base decimal
      0094F1 79               [ 1]  731 	ld a,(x)
      0094F2 20 42            [ 1]  732 	jreq 9$  ; completed if 0
      0094F4 41 53            [ 1]  733 	cp a,#'-
      0094F6 49 43            [ 1]  734 	jrne 1$
      0094F8 20 66            [ 1]  735 	cpl (SIGN,sp)
      0094FA 6F 72            [ 2]  736 	jra 2$
      0094FC 20 53            [ 1]  737 1$: cp a,#'$
      0094FE 54 4D            [ 1]  738 	jrne 3$
      009500 38 0A            [ 1]  739 	ld a,#16
      009502 43 6F            [ 1]  740 	ld (BASE,sp),a
      009504 70               [ 1]  741 2$:	incw x
      009505 79               [ 1]  742 	ld a,(x)
      0018CB                        743 3$:	
      009506 72 69            [ 1]  744 	cp a,#'a
      009508 67 68            [ 1]  745 	jrmi 4$
      00950A 74 2C            [ 1]  746 	sub a,#32
      00950C 20 4A            [ 1]  747 4$:	cp a,#'0
      00950E 61 63            [ 1]  748 	jrmi 9$
      009510 71 75            [ 1]  749 	sub a,#'0
      009512 65 73            [ 1]  750 	cp a,#10
      009514 20 44            [ 1]  751 	jrmi 5$
      009516 65 73            [ 1]  752 	sub a,#7
      009518 63 68            [ 1]  753 	cp a,(BASE,sp)
      00951A 65 6E            [ 1]  754 	jrpl 9$
      00951C 65 73            [ 1]  755 5$:	ld (TEMP,sp),a
      00951E 20 32            [ 1]  756 	ld a,(BASE,sp)
      009520 30 31 39         [ 4]  757 	call mulu24_8
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      009523 2C 32            [ 1]  758 	ld a,(TEMP,sp)
      009525 30 32 32         [ 1]  759 	add a,acc24+2
      009528 0A 76 65         [ 1]  760 	ld acc24+2,a
      00952B 72               [ 1]  761 	clr a
      00952C 73 69 6F         [ 1]  762 	adc a,acc24+1
      00952F 6E 20 00         [ 1]  763 	ld acc24+1,a
      009532 4F               [ 1]  764 	clr a
      009532 AE 94 EC         [ 1]  765 	adc a,acc24
      009535 CD 8A 1D         [ 1]  766 	ld acc24,a
      009538 A6 02            [ 2]  767 	jra 2$
      00953A C7 00            [ 1]  768 9$:	tnz (SIGN,sp)
      00953C 0F 5F            [ 1]  769     jreq atoi_exit
      00953E CF 00 0D         [ 4]  770     call neg_acc24
      001907                        771 atoi_exit: 
      001907                        772 	_drop VSIZE
      009541 72 5F            [ 2]    1     addw sp,#VSIZE 
      009543 00               [ 2]  773 	popw x ; restore x
      009544 24               [ 4]  774 	ret
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
      00190B                        795 search_dict::
      00190B                        796 	_vars VSIZE 
      009545 35 0A            [ 2]    1     sub sp,#VSIZE 
      009547 00 0B            [ 2]  797 	ldw (YSAVE,sp),y 
      00190F                        798 search_next:
      009549 CD 98            [ 2]  799 	ldw (XSAVE,sp),x 
                                    800 ; get name length in dictionary	
      00954B 96               [ 1]  801 	ld a,(x)
      00954C A6 2E            [ 1]  802 	and a,#0xf 
      00954E CD 89            [ 1]  803 	ld (NLEN,sp),a  
      009550 C0 A6            [ 2]  804 	ldw y,(YSAVE,sp) ; name pointer 
      009552 00               [ 1]  805 	incw x 
      001919                        806 cp_loop:
      009553 C7 00            [ 1]  807 	ld a,(y)
      009555 0F 5F            [ 1]  808 	jreq str_match 
      009557 CF 00            [ 1]  809 	tnz (NLEN,sp)
      009559 0D CD            [ 1]  810 	jreq no_match  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      00955B 98               [ 1]  811 	cp a,(x)
      00955C 96 A6            [ 1]  812 	jrne no_match 
      00955E 0D CD            [ 1]  813 	incw y 
      009560 89               [ 1]  814 	incw x
      009561 C0 81            [ 1]  815 	dec (NLEN,sp)
      009563 20 EE            [ 2]  816 	jra cp_loop 
      00192B                        817 no_match:
      009563 90 AE            [ 2]  818 	ldw x,(XSAVE,sp) 
      009565 17 73 72         [ 2]  819 	subw x,#2 ; move X to link field
      009568 5F 00            [ 1]  820 	push #TK_NONE 
      00956A 23               [ 2]  821 	ldw x,(x) ; next word link 
      00956B 72               [ 1]  822 	pop a ; TK_NONE 
      00956C 5F 00            [ 1]  823 	jreq search_exit  ; not found  
                                    824 ;try next 
      00956E 20 35            [ 2]  825 	jra search_next
      001938                        826 str_match:
      009570 04 00            [ 2]  827 	ldw x,(XSAVE,sp)
      009572 24               [ 1]  828 	ld a,(X)
      009573 35 0A            [ 1]  829 	ld (NLEN,sp),a ; needed to test keyword type  
      009575 00 0B            [ 1]  830 	and a,#NLEN_MASK 
                                    831 ; move x to procedure address field 	
      009577 AE               [ 1]  832 	inc a 
      009578 00 00 CF         [ 1]  833 	ld acc8,a 
      00957B 00 05 CF 00      [ 1]  834 	clr acc16 
      00957F 01 72 5F 00      [ 2]  835 	addw x,acc16 
      009583 04               [ 2]  836 	ldw x,(x) ; routine index  
                                    837 ;determine keyword type bits 7:4 
      009584 81 01            [ 1]  838 	ld a,(NLEN,sp)
      009585 A4 F0            [ 1]  839 	and a,#KW_TYPE_MASK 
      009585 89               [ 1]  840 	swap a 
      009586 72 5F            [ 1]  841 	add a,#128
      001953                        842 search_exit: 
      001953                        843 	_drop VSIZE 
      009588 00 04            [ 2]    1     addw sp,#VSIZE 
      00958A 72               [ 4]  844 	ret 
                                    845 
                                    846 ;---------------------
                                    847 ; check if next token
                                    848 ;  is of expected type 
                                    849 ; input:
                                    850 ;   A 		 expected token attribute
                                    851 ;  ouput:
                                    852 ;   none     if fail call syntax_error 
                                    853 ;--------------------
      001956                        854 expect:
      00958B 5F               [ 1]  855 	push a 
      00958C 00 02 AE         [ 4]  856 	call next_token 
      00958F 00 80            [ 1]  857 	cp a,(1,sp)
      009591 CF 00            [ 1]  858 	jreq 1$
      009593 1C CF 00         [ 2]  859 	jp syntax_error
      009596 1E               [ 1]  860 1$: pop a 
      009597 CD               [ 4]  861 	ret 
                                    862 
                                    863 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    864 ; parse arguments list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



                                    865 ; between ()
                                    866 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001963                        867 func_args:
      009598 94 DD            [ 1]  868 	ld a,#TK_LPAREN 
      00959A 85 81 56         [ 4]  869 	call expect 
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
      00959C                        885 arg_list:
      00959C 00 00            [ 1]  886 	push #0
      00959E 95 BE 95         [ 4]  887 1$:	call condition 
      0095A1 CB               [ 1]  888 	tnz a 
      0095A2 95 D9            [ 1]  889 	jreq 7$  
      0095A4 95 F2            [ 1]  890 	inc (1,sp)
      0095A6 96 01 96         [ 4]  891 	call next_token 
      0095A9 17 96            [ 1]  892 	cp a,#TK_COMMA 
      0095AB 2D 96            [ 1]  893 	jreq 1$ 
      0095AD 47 96            [ 1]  894 	cp a,#TK_RPAREN
      0095AF 58 96            [ 1]  895 	jreq 7$
      00197D                        896 	_unget_token 
      0095B1 69 96 75 96 A8   [ 1]    1      mov in,in.saved  
      0095B6 96               [ 1]  897 7$:	pop a  
      0095B7 B8               [ 4]  898 	ret 
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
      001984                        926 get_array_element:
      0095B8 96 CC 96         [ 4]  927 	call func_args 
      0095BB DF 96            [ 1]  928 	cp a,#1
      0095BD EC 4D            [ 1]  929 	jreq 1$
      0095BF 65 6D 6F         [ 2]  930 	jp syntax_error
      00198E                        931 1$: _xpop 
      0095C2 72 79            [ 1]    1     ld a,(y)
      0095C4 20               [ 1]    2     ldw x,y 
      0095C5 66 75            [ 2]    3     ldw x,(1,x)
      0095C7 6C 6C 0A 00      [ 2]    4     addw y,#CELL_SIZE 
                                    932     ; ignore A, index < 65536 in any case 
                                    933 	; check for bounds 
      0095CB 73 79 6E         [ 2]  934 	cpw x,array_size 
      0095CE 74 61            [ 2]  935 	jrule 3$
                                    936 ; bounds {1..array_size}	
      0095D0 78 20            [ 1]  937 2$: ld a,#ERR_BAD_VALUE 
      0095D2 65 72 72         [ 2]  938 	jp tb_error 
      0095D5 6F               [ 2]  939 3$: tnzw  x
      0095D6 72 0A            [ 1]  940 	jreq 2$ 
      0095D8 00               [ 2]  941 	pushw x 
      0095D9 6D               [ 2]  942 	sllw x 
      0095DA 61 74 68         [ 2]  943 	addw x,(1,sp) ; index*size_of(int24)
      0095DD 20 6F            [ 2]  944 	ldw (1,sp),x  
      0095DF 70 65 72         [ 2]  945 	ldw x,#tib ; array is below tib 
      0095E2 61 74 69         [ 2]  946 	subw x,(1,sp)
      0019B1                        947 	_drop 2   
      0095E5 6F 6E            [ 2]    1     addw sp,#2 
      0095E7 20               [ 4]  948 	ret 
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
      0019B4                        964 factor:
      0019B4                        965 	_vars VSIZE 
      0095E8 6F 76            [ 2]    1     sub sp,#VSIZE 
      0095EA 65 72            [ 1]  966 	clr (NEG,sp)
      0095EC 66 6C 6F         [ 4]  967 	call next_token
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      0095EF 77               [ 1]  968 	tnz a 
      0095F0 0A 00            [ 1]  969 	jrne 1$ 
      0095F2 64 69 76         [ 2]  970 	jp 22$ 
      0095F5 69 73            [ 1]  971 1$:	cp a,#TK_PLUS 
      0095F7 69 6F            [ 1]  972 	jreq 2$
      0095F9 6E 20            [ 1]  973 	cp a,#TK_MINUS 
      0095FB 62 79            [ 1]  974 	jrne 4$ 
      0095FD 20 30            [ 1]  975 	cpl (NEG,sp)
      0019CB                        976 2$:	
      0095FF 0A 00 69         [ 4]  977 	call next_token
      0019CE                        978 4$:
      009602 6E               [ 1]  979 	tnz a 
      009603 76 61            [ 1]  980 	jrne 41$ 
      009605 6C 69 64         [ 2]  981 	jp syntax_error  
      0019D4                        982 41$:	
      009608 20 6C            [ 1]  983 	cp a,#TK_IFUNC 
      00960A 69 6E            [ 1]  984 	jrne 5$ 
      00960C 65 20 6E         [ 4]  985 	call get_code_addr 
      00960F 75               [ 4]  986 	call (x); result in A:X  
      009610 6D 62            [ 2]  987 	jra 18$ 
      0019DE                        988 5$:
      009612 65 72            [ 1]  989 	cp a,#TK_INTGR
      009614 2E 0A            [ 1]  990 	jrne 6$
      009616 00 72 75         [ 4]  991 	call get_int24 ; A:X
      009619 6E 20            [ 2]  992 	jra 18$
      0019E7                        993 6$:
      00961B 74 69            [ 1]  994 	cp a,#TK_ARRAY
      00961D 6D 65            [ 1]  995 	jrne 7$
      00961F 20 6F 6E         [ 4]  996 	call get_array_element
      009622 6C 79            [ 2]  997     jra 71$
      0019F0                        998 7$:
      009624 20 75            [ 1]  999 	cp a,#TK_VAR 
      009626 73 61            [ 1] 1000 	jrne 8$
      009628 67 65 2E         [ 4] 1001 	call get_addr 
      0019F7                       1002 71$: ; put value in A:X
      00962B 0A               [ 1] 1003 	ld a,(x)
      00962C 00 63            [ 2] 1004 	ldw x,(1,x)
      00962E 6F 6D            [ 2] 1005 	jra 18$
      0019FC                       1006 8$:
      009630 6D 61            [ 1] 1007 	cp a,#TK_LABEL 
      009632 6E 64            [ 1] 1008 	jrne 9$ 
      009634 20               [ 2] 1009 	pushw x 
      009635 6C 69 6E         [ 4] 1010 	call skip_string
      009638 65               [ 2] 1011 	popw x 
      009639 20 6F 6E         [ 4] 1012 	call search_const 
      00963C 6C               [ 2] 1013 	tnzw x 
      00963D 79 20            [ 1] 1014 	jreq 16$
      00963F 75 73 61         [ 4] 1015 	call get_const_value ; in A:X 
      009642 67 65            [ 2] 1016 	jra 18$
      001A10                       1017 9$: 
      009644 2E 0A            [ 1] 1018 	cp a,#TK_CFUNC 
      009646 00 64            [ 1] 1019 	jrne 12$
      009648 75 70 6C         [ 4] 1020 	call get_code_addr 
      00964B 69               [ 4] 1021 	call(x)
      00964C 63               [ 1] 1022 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      00964D 61               [ 1] 1023 	rlwa x  ; char>int24 in A:X 
      00964E 74 65            [ 2] 1024 	jra 18$ 	 
      001A1C                       1025 12$:			
      009650 20 6E            [ 1] 1026 	cp a,#TK_LPAREN
      009652 61 6D            [ 1] 1027 	jrne 16$
      009654 65 2E 0A         [ 4] 1028 	call expression
      009657 00 46            [ 1] 1029 	ld a,#TK_RPAREN 
      009659 69 6C 65         [ 4] 1030 	call expect
      001A28                       1031 	_xpop 
      00965C 20 6E            [ 1]    1     ld a,(y)
      00965E 6F               [ 1]    2     ldw x,y 
      00965F 74 20            [ 2]    3     ldw x,(1,x)
      009661 66 6F 75 6E      [ 2]    4     addw y,#CELL_SIZE 
      009665 64 2E            [ 2] 1032 	jra 18$	
      001A33                       1033 16$:
      001A33                       1034 	_unget_token 
      009667 0A 00 62 61 64   [ 1]    1      mov in,in.saved  
      00966C 20               [ 1] 1035 	clr a 
      00966D 76 61            [ 2] 1036 	jra 22$ 
      001A3B                       1037 18$: 
      00966F 6C 75            [ 1] 1038 	tnz (NEG,sp)
      009671 65 2E            [ 1] 1039 	jreq 20$
      009673 0A 00 46         [ 4] 1040 	call neg_ax   
      001A42                       1041 20$:
      001A42                       1042 	_xpush 
      009676 69 6C 65 20      [ 2]    1     subw y,#CELL_SIZE
      00967A 69 6E            [ 1]    2     ld (y),a 
      00967C 20 65 78         [ 2]    3     ldw (1,y),x 
      00967F 74 65            [ 1] 1043 	ld a,#TK_INTGR
      001A4D                       1044 22$:
      001A4D                       1045 	_drop VSIZE
      009681 6E 64            [ 2]    1     addw sp,#VSIZE 
      009683 65               [ 4] 1046 	ret
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
      001A50                       1057 term:
      001A50                       1058 	_vars VSIZE
      009684 64 20            [ 2]    1     sub sp,#VSIZE 
                                   1059 ; first factor 	
      009686 6D 65 6D         [ 4] 1060 	call factor
      009689 6F               [ 1] 1061 	tnz a 
      00968A 72 79            [ 1] 1062 	jreq term_exit  
      001A58                       1063 term01:	 ; check for  operator '*'|'/'|'%' 
      00968C 2C 20 63         [ 4] 1064 	call next_token
      00968F 61 6E            [ 1] 1065 	ld (MULOP,sp),a
      009691 27 74            [ 1] 1066 	and a,#TK_GRP_MASK
      009693 20 62            [ 1] 1067 	cp a,#TK_GRP_MULT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      009695 65 20            [ 1] 1068 	jreq 1$
      009697 72 75            [ 1] 1069 	ld a,#TK_INTGR
      001A65                       1070 	_unget_token 
      009699 6E 20 66 72 6F   [ 1]    1      mov in,in.saved  
      00969E 6D 20            [ 2] 1071 	jra term_exit 
      001A6C                       1072 1$:	; got *|/|%
                                   1073 ;second factor
      0096A0 74 68 65         [ 4] 1074 	call factor
      0096A3 72               [ 1] 1075 	tnz a 
      0096A4 65 2E            [ 1] 1076 	jrne 2$ 
      0096A6 0A 00 4E         [ 2] 1077 	jp syntax_error 
      001A75                       1078 2$: ; select operation 	
      0096A9 6F 20            [ 1] 1079 	ld a,(MULOP,sp) 
      0096AB 64 61            [ 1] 1080 	cp a,#TK_MULT 
      0096AD 74 61            [ 1] 1081 	jrne 3$
                                   1082 ; '*' operator
      0096AF 20 66 6F         [ 4] 1083 	call mul24 
      0096B2 75 6E            [ 2] 1084 	jra term01
      0096B4 64 2E            [ 1] 1085 3$: cp a,#TK_DIV 
      0096B6 0A 00            [ 1] 1086 	jrne 4$ 
                                   1087 ; '/' operator	
      0096B8 4E 6F 20         [ 4] 1088 	call div24 
      0096BB 70 72            [ 2] 1089 	jra term01 
      001A89                       1090 4$: ; '%' operator
      0096BD 6F 67 72         [ 4] 1091 	call mod24
      0096C0 61 6D            [ 2] 1092 	jra term01 
      001A8E                       1093 9$: 
      0096C2 20 69            [ 1] 1094 	ld a,#TK_INTGR
      001A90                       1095 term_exit:
      001A90                       1096 	_drop VSIZE 
      0096C4 6E 20            [ 2]    1     addw sp,#VSIZE 
      0096C6 52               [ 4] 1097 	ret 
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
      001A93                       1108 expression:
      001A93                       1109 	_vars VSIZE 
      0096C7 41 4D            [ 2]    1     sub sp,#VSIZE 
                                   1110 ; first term 	
      0096C9 21 0A 00         [ 4] 1111 	call term
      0096CC 46               [ 1] 1112 	tnz a 
      0096CD 69 6C            [ 1] 1113 	jreq 9$
      001A9B                       1114 1$:	; operator '+'|'-'
      0096CF 65 20 73         [ 4] 1115 	call next_token
      0096D2 79 73            [ 1] 1116 	ld (OP,sp),a 
      0096D4 74 65            [ 1] 1117 	and a,#TK_GRP_MASK
      0096D6 6D 20            [ 1] 1118 	cp a,#TK_GRP_ADD 
      0096D8 66 75            [ 1] 1119 	jreq 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      001AA6                       1120 	_unget_token 
      0096DA 6C 6C 2E 0A 00   [ 1]    1      mov in,in.saved  
      0096DF 42 75            [ 1] 1121 	ld a,#TK_INTGR
      0096E1 66 66            [ 2] 1122 	jra 9$ 
      001AAF                       1123 2$: ; second term 
      0096E3 65 72 20         [ 4] 1124 	call term
      0096E6 66               [ 1] 1125 	tnz a 
      0096E7 75 6C            [ 1] 1126 	jrne 3$
      0096E9 6C 0A 00         [ 2] 1127 	jp syntax_error
      001AB8                       1128 3$:
      0096EC 6F 76            [ 1] 1129 	ld a,(OP,sp)
      0096EE 65 72            [ 1] 1130 	cp a,#TK_PLUS 
      0096F0 66 6C            [ 1] 1131 	jrne 4$
                                   1132 ; '+' operator	
      0096F2 6F 77 0A         [ 4] 1133 	call add24
      0096F5 00 0A            [ 2] 1134 	jra 1$ 
      001AC3                       1135 4$:	; '-' operator 
      0096F7 72 75 6E         [ 4] 1136 	call sub24
      0096FA 20 74            [ 2] 1137 	jra 1$
      001AC8                       1138 9$:
      001AC8                       1139 	_drop VSIZE 
      0096FC 69 6D            [ 2]    1     addw sp,#VSIZE 
      0096FE 65               [ 4] 1140 	ret 
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
      001ACB                       1151 relation: 
      001ACB                       1152 	_vars VSIZE
      0096FF 20 65            [ 2]    1     sub sp,#VSIZE 
      009701 72 72 6F         [ 4] 1153 	call expression
      009704 72               [ 1] 1154 	tnz a 
      009705 2C 20            [ 1] 1155 	jreq 9$ 
                                   1156 ; expect rel_op or leave 
      009707 00 0A 63         [ 4] 1157 	call next_token 
      00970A 6F 6D            [ 1] 1158 	ld (RELOP,sp),a 
      00970C 70 69            [ 1] 1159 	and a,#TK_GRP_MASK
      00970E 6C 65            [ 1] 1160 	cp a,#TK_GRP_RELOP 
      009710 20 65            [ 1] 1161 	jreq 2$
      009712 72 72            [ 1] 1162 	ld a,#TK_INTGR 
      001AE0                       1163 	_unget_token 
      009714 6F 72 2C 20 00   [ 1]    1      mov in,in.saved  
      009719 6C 61            [ 2] 1164 	jra 9$ 
      001AE7                       1165 2$:	; expect another expression
      00971B 73 74 20         [ 4] 1166 	call expression
      00971E 74               [ 1] 1167 	tnz a 
      00971F 6F 6B            [ 1] 1168 	jrne 3$
      009721 65 6E 20         [ 2] 1169 	jp syntax_error 
      001AF0                       1170 3$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      009724 69 64 3A         [ 4] 1171 	call cp24 
      001AF3                       1172 	_xpop  
      009727 20 00            [ 1]    1     ld a,(y)
      009729 93               [ 1]    2     ldw x,y 
      009729 A6 02            [ 2]    3     ldw x,(1,x)
      00972B 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00972B 72               [ 1] 1173 	tnz a 
      00972C 0A 00            [ 1] 1174 	jrmi 4$
      00972E 23 4C            [ 1] 1175 	jrne 5$
      009730 88 AE 96 F6      [ 1] 1176 	mov acc8,#2 ; i1==i2
      009734 CD 8A            [ 2] 1177 	jra 6$ 
      001B07                       1178 4$: ; i1<i2
      009736 1D 84 AE 95      [ 1] 1179 	mov acc8,#4 
      00973A 9C 72            [ 2] 1180 	jra 6$
      001B0D                       1181 5$: ; i1>i2
      00973C 5F 00 0E 48      [ 1] 1182 	mov acc8,#1  
      001B11                       1183 6$: ; 0=false, -1=true 
      009740 72               [ 1] 1184 	clrw x 
      009741 59 00 0E         [ 1] 1185 	ld a, acc8  
      009744 C7 00            [ 1] 1186 	and a,(RELOP,sp)
      009746 0F 72            [ 1] 1187 	jreq 7$
      009748 BB               [ 2] 1188 	cplw x 
      009749 00 0E            [ 1] 1189 	ld a,#255 
      001B1C                       1190 7$:	_xpush 
      00974B FE CD 8A 1D      [ 2]    1     subw y,#CELL_SIZE
      00974F CE 00            [ 1]    2     ld (y),a 
      009751 05 C6 00         [ 2]    3     ldw (1,y),x 
      009754 04 90            [ 1] 1191 	ld a,#TK_INTGR
      001B27                       1192 9$: 
      001B27                       1193 	_drop VSIZE
      009756 5F 90            [ 2]    1     addw sp,#VSIZE 
      009758 02               [ 4] 1194 	ret 
                                   1195 
                                   1196 ;-------------------------------------------
                                   1197 ;  AND factor:  [NOT] relation | (condition)
                                   1198 ;  output:
                                   1199 ;     A      TK_INTGR|0
                                   1200 ;-------------------------------------------
                           000001  1201 	NOT_OP=1
      001B2A                       1202 and_factor:
      009759 CD 87            [ 1] 1203 	push #0 
      00975B 1C CE 00         [ 4] 1204 0$:	call next_token  
      00975E 05               [ 1] 1205 	tnz a 
      00975F C6 00            [ 1] 1206 	jreq 8$ 
      009761 02 CD            [ 1] 1207 	cp a,#TK_NOT 
      009763 A0 56            [ 1] 1208 	jrne 1$ 
      009765 AE 97            [ 1] 1209 	cpl (NOT_OP,sp)
      009767 19 CD            [ 2] 1210 	jra 0$ 
      001B3A                       1211 1$:	
      009769 8A 1D            [ 1] 1212 	cp a,#TK_LPAREN 
      00976B C6 00            [ 1] 1213 	jrne 2$
      00976D 03 5F 97         [ 4] 1214 	call condition
      009770 72 BB            [ 1] 1215 	ld a,#TK_RPAREN 
      009772 00 05 F6         [ 4] 1216 	call expect
      009775 5F 97            [ 2] 1217 	jra 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      001B48                       1218 2$: _unget_token 
      009777 CD 98 7F 20 35   [ 1]    1      mov in,in.saved  
      00977C CD 1A CB         [ 4] 1219 	call relation
      001B50                       1220 3$:
      00977C 88 AE            [ 1] 1221 	tnz (NOT_OP,sp)
      00977E 97 08            [ 1] 1222 	jreq 8$ 
      009780 CD 8A 1D         [ 4] 1223 	call cpl24
      001B57                       1224 8$:
      001B57                       1225 	_drop 1  
      009783 84 AE            [ 2]    1     addw sp,#1 
      009785 95               [ 4] 1226     ret 
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
      001B5A                       1237 and_cond:
      009786 9C 72 5F         [ 4] 1238 	call and_factor
      009789 00               [ 1] 1239 	tnz a 
      00978A 0E 48            [ 1] 1240 	jreq 9$  
      00978C 72 59 00         [ 4] 1241 1$: call next_token 
      00978F 0E               [ 1] 1242 	tnz a 
      009790 C7 00            [ 1] 1243 	jreq 6$ 
      009792 0F 72            [ 1] 1244 	cp a,#TK_AND 
      009794 BB 00            [ 1] 1245 	jreq 3$
      001B6A                       1246 	_unget_token 
      009796 0E FE CD 8A 1D   [ 1]    1      mov in,in.saved  
      00979B AE 16            [ 2] 1247 	jra 6$ 
      00979D 68 CD 8A         [ 4] 1248 3$:	call and_factor  
      0097A0 1D               [ 1] 1249 	tnz a 
      0097A1 A6 0D            [ 1] 1250 	jrne 4$
      0097A3 CD 89 C0         [ 2] 1251 	jp syntax_error 
      001B7A                       1252 4$:	
      001B7A                       1253 	_xpop 
      0097A6 CE 00            [ 1]    1     ld a,(y)
      0097A8 01               [ 1]    2     ldw x,y 
      0097A9 CD 8A            [ 2]    3     ldw x,(1,x)
      0097AB 8A A6 5E CD      [ 2]    4     addw y,#CELL_SIZE 
      0097AF 89 C0 AE         [ 1] 1254 	ld acc24,a 
      0097B2 17 FF 94         [ 2] 1255 	ldw acc16,x
      0097B5                       1256 	_xpop 
      0097B5 CD 95            [ 1]    1     ld a,(y)
      0097B7 63               [ 1]    2     ldw x,y 
      0097B8 EE 01            [ 2]    3     ldw x,(1,x)
      0097B8 A6 0D CD 89      [ 2]    4     addw y,#CELL_SIZE 
      0097BC C0 A6 3E         [ 1] 1257 	and a,acc24 
      0097BF CD               [ 1] 1258 	rlwa x 
      0097C0 89 C0 CD         [ 1] 1259 	and a,acc16 
      0097C3 8B               [ 1] 1260 	rlwa x 
      0097C4 22 72 5D         [ 1] 1261 	and a,acc8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      0097C7 00               [ 1] 1262 	rlwa x
      001B9E                       1263 	_xpush
      0097C8 04 27 ED CD      [ 2]    1     subw y,#CELL_SIZE
      0097CC 91 56            [ 1]    2     ld (y),a 
      0097CE 72 5D 00         [ 2]    3     ldw (1,y),x 
      0097D1 04 27            [ 2] 1264 	jra 1$  
      0097D3 E4 84            [ 1] 1265 6$: ld a,#TK_INTGR 
      0097D4 81               [ 4] 1266 9$:	ret 	 
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
      001BAC                       1280 condition:
      001BAC                       1281 	_vars VSIZE 
      0097D4 C6 00            [ 2]    1     sub sp,#VSIZE 
      0097D6 02 C1 00         [ 4] 1282 	call and_cond
      0097D9 04               [ 1] 1283 	tnz a 
      0097DA 2B 1D            [ 1] 1284 	jreq 9$ 
      0097DC CD 17 AA         [ 4] 1285 1$:	call next_token 
      0097DC 72 01            [ 1] 1286 	cp a,#TK_OR 
      0097DE 00 23            [ 1] 1287 	jreq 2$
      0097E0 D7 CE            [ 1] 1288 	cp a,#TK_XOR
      0097E2 00 05            [ 1] 1289 	jreq 2$ 
      001BBF                       1290 	_unget_token 
      0097E4 72 BB 00 01 C3   [ 1]    1      mov in,in.saved  
      0097E9 00 1E            [ 2] 1291 	jra 8$ 
      0097EB 2A C8            [ 1] 1292 2$:	ld (OP,sp),a ; TK_OR|TK_XOR 
      0097ED CF 00 05         [ 4] 1293 	call and_cond
      0097F0 E6 02            [ 1] 1294 	cp a,#TK_INTGR 
      0097F2 C7 00            [ 1] 1295 	jreq 3$
      0097F4 04 35 03         [ 2] 1296 	jp syntax_error 
      001BD2                       1297 3$:	 
      001BD2                       1298 	_xpop  ; rigth arg 
      0097F7 00 02            [ 1]    1     ld a,(y)
      0097F9 93               [ 1]    2     ldw x,y 
      0097F9 CD 98            [ 2]    3     ldw x,(1,x)
      0097FB 2A A1 00 27      [ 2]    4     addw y,#CELL_SIZE 
      0097FF DC A1 80         [ 1] 1299 	ld acc24,a 
      009802 26 06 CD         [ 2] 1300 	ldw acc16,x 
      001BE1                       1301 	_xpop  ; left arg  
      009805 98 43            [ 1]    1     ld a,(y)
      009807 FD               [ 1]    2     ldw x,y 
      009808 20 EF            [ 2]    3     ldw x,(1,x)
      00980A 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00980A A1 85            [ 1] 1302 	ld (ATMP,sp),a 
      00980C 26 05            [ 1] 1303 	ld a,(OP,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      00980E CD 9D            [ 1] 1304 	cp a,#TK_XOR 
      009810 11 20            [ 1] 1305 	jreq 5$ 
      001BF2                       1306 4$: ; A:X OR acc24   
      009812 E6 01            [ 1] 1307 	ld a,(ATMP,sp)
      009813 CA 00 0C         [ 1] 1308 	or a,acc24 
      009813 A1               [ 1] 1309 	rlwa x 
      009814 05 26 05         [ 1] 1310 	or a,acc16 
      009817 CD               [ 1] 1311 	rlwa x 
      009818 9D 0C 20         [ 1] 1312 	or a,acc8 
      00981B DD               [ 1] 1313 	rlwa x 
      00981C 20 0E            [ 2] 1314 	jra 6$  
      001C02                       1315 5$: ; A:X XOR acc24 
      00981C A1 0A            [ 1] 1316 	ld a,(ATMP,sp)
      00981E 27 D9 A1         [ 1] 1317 	xor a,acc24 
      009821 03               [ 1] 1318 	rlwa x 
      009822 CD 98 50         [ 1] 1319 	xor a,acc16 
      009825 20               [ 1] 1320 	rlwa x 
      009826 D2 CC 97         [ 1] 1321 	xor a,acc8 
      009829 29               [ 1] 1322 	rlwa x 
      00982A                       1323 6$: _xpush
      00982A C6 00 02 C7      [ 2]    1     subw y,#CELL_SIZE
      00982E 00 03            [ 1]    2     ld (y),a 
      009830 C0 00 04         [ 2]    3     ldw (1,y),x 
      009833 27 0D            [ 2] 1324 	jra 1$ 
      009835 A6 84            [ 1] 1325 8$:	ld a,#TK_INTGR 
      001C1D                       1326 9$:	_drop VSIZE 
      009835 CE 00            [ 2]    1     addw sp,#VSIZE 
      009837 05               [ 4] 1327 	ret 
                                   1328 
                                   1329 
                                   1330 ;--------------------------------------------
                                   1331 ; BASIC: HEX 
                                   1332 ; select hexadecimal base for integer print
                                   1333 ;---------------------------------------------
      001C20                       1334 hex_base:
      009838 72 BB 00 01      [ 1] 1335 	mov base,#16 
      00983C F6               [ 4] 1336 	ret 
                                   1337 
                                   1338 ;--------------------------------------------
                                   1339 ; BASIC: DEC 
                                   1340 ; select decimal base for integer print
                                   1341 ;---------------------------------------------
      001C25                       1342 dec_base:
      00983D 5C 72 5C 00      [ 1] 1343 	mov base,#10
      009841 02               [ 4] 1344 	ret 
                                   1345 
                                   1346 ;------------------------
                                   1347 ; BASIC: FREE 
                                   1348 ; return free size in RAM 
                                   1349 ; output:
                                   1350 ;   A:x		size 
                                   1351 ;--------------------------
      001C2A                       1352 free:
      009842 81 89            [ 2] 1353 	pushw y 
      009843 4F               [ 1] 1354 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      009843 FE DE B3         [ 2] 1355 	ldw x,#tib 
      009846 AA 72 5C 00      [ 2] 1356 	ldw y,txtbgn 
      00984A 02 72 5C 00      [ 2] 1357 	cpw y,#app_space
      00984E 02 81            [ 1] 1358 	jrult 1$
      009850 1D 00 80         [ 2] 1359 	subw x,#free_ram 
      009850 F6 27            [ 2] 1360 	jra 2$ 
      001C3F                       1361 1$:	
      009852 03 5C 20 FA      [ 2] 1362 	subw x,txtend
      009856 5C 72            [ 2] 1363 2$:	popw y 
      009858 B0               [ 4] 1364 	ret 
                                   1365 
                                   1366 ;------------------------------
                                   1367 ; BASIC: SIZE 
                                   1368 ; command that print 
                                   1369 ; program start addres and size 
                                   1370 ;------------------------------
      001C46                       1371 cmd_size:
      009859 00 05 CF         [ 1] 1372 	push base 
      00985C 00 01 81         [ 2] 1373 	ldw x,#PROG_ADDR 
      00985F CD 09 9D         [ 4] 1374 	call puts 
      00985F FE 72 5C         [ 2] 1375 	ldw x,txtbgn     
      009862 00 02 72 5C      [ 1] 1376 	mov base,#16 
      009866 00 02 81         [ 4] 1377 	call prt_i16
      009869 32 00 0A         [ 1] 1378 	pop base 
      009869 F6 EE 01         [ 2] 1379 	ldw x,#PROG_SIZE 
      00986C 72 5C 00         [ 4] 1380 	call puts 
      00986F 02 72 5C         [ 2] 1381 	ldw x,txtend 
      009872 00 02 72 5C      [ 2] 1382 	subw x,txtbgn 
      009876 00 02 81         [ 4] 1383 	call prt_i16
      009879 AE 1E C6         [ 2] 1384 	ldw x,#STR_BYTES 
      009879 F6 72 5C         [ 4] 1385 	call puts  
      00987C 00               [ 4] 1386 	ret 
                                   1387 
                                   1388 
                                   1389 ;------------------------
                                   1390 ; BASIC: UBOUND  
                                   1391 ; return array variable size 
                                   1392 ; and set 'array_size' variable 
                                   1393 ; output:
                                   1394 ;   A:X 	array_size
                                   1395 ;--------------------------
      001C73                       1396 ubound:
      00987D 02 81 2A         [ 4] 1397 	call free 
      00987F A6 03            [ 1] 1398 	ld a,#CELL_SIZE 
      00987F 72               [ 4] 1399 	mul x,a 
      009880 5F 00 0D         [ 2] 1400 	ldw array_size,x
      009883 CF               [ 1] 1401 	clr a 
      009884 00               [ 4] 1402 	ret 
                                   1403 
                                   1404 ;-----------------------------
                                   1405 ; BASIC: LET var=expr 
                                   1406 ; variable assignement 
                                   1407 ; output:
                                   1408 ;   A 		TK_NONE 
                                   1409 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      001C7E                       1410 let::
      009885 0E A6 10         [ 4] 1411 	call next_token 
      009888 C1 00            [ 1] 1412 	cp a,#TK_VAR 
      00988A 0B 27            [ 1] 1413 	jreq let_var
      00988C 09 72            [ 1] 1414 	cp a,#TK_ARRAY 
      00988E 0F 00            [ 1] 1415 	jreq  let_array
      009890 0E 04 72         [ 2] 1416 	jp syntax_error
      001C8C                       1417 let_array:
      009893 53 00 0D         [ 4] 1418 	call get_array_element
      009896 20 03            [ 2] 1419 	jra let_eval 
      001C91                       1420 let_var:
      009896 A6 FF CD         [ 4] 1421 	call get_addr
      001C94                       1422 let_eval:
      009899 98 BC CD         [ 2] 1423 	ldw ptr16,x  ; variable address 
      00989C 92 00 88         [ 4] 1424 	call next_token 
      00989F CD 8A            [ 1] 1425 	cp a,#TK_EQUAL
      0098A1 1D 84            [ 1] 1426 	jreq 1$
      0098A3 81 16 A9         [ 2] 1427 	jp syntax_error
      0098A4                       1428 1$:	
      0098A4 90 F6 93         [ 4] 1429 	call condition   
      0098A7 EE 01            [ 1] 1430 	cp a,#TK_INTGR 
      0098A9 72 A9            [ 1] 1431 	jreq 2$
      0098AB 00 03 C7         [ 2] 1432 	jp syntax_error
      001CAB                       1433 2$:	
      001CAB                       1434 	_xpop ; value 
      0098AE 00 0D            [ 1]    1     ld a,(y)
      0098B0 CF               [ 1]    2     ldw x,y 
      0098B1 00 0E            [ 2]    3     ldw x,(1,x)
      0098B3 CD 98 96 A6      [ 2]    4     addw y,#CELL_SIZE 
      001CB4                       1435 3$:
      0098B7 20 CD 89 C0      [ 4] 1436 	ld [ptr16],a
      0098BB 81 5C 00 1A      [ 1] 1437 	inc ptr8  
      0098BC 72 CF 00 19      [ 5] 1438 	ldw [ptr16],x 
      0098BC 52               [ 4] 1439 	ret 
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
      001CC1                       1450 get_const_value: ; -- i 
      0098BD 04               [ 1] 1451 	ld a,(x) ; record size 
      0098BE 0F 02            [ 1] 1452 	sub a,#3 ; * value 
      0098C0 0F               [ 1] 1453 	push a 
      0098C1 01 4D            [ 1] 1454 	push #0 
      0098C3 27 11 C6         [ 2] 1455 	addw x,(1,sp)
      0098C6 00               [ 1] 1456 	ld a,(x)
      0098C7 0B A1            [ 2] 1457 	ldw x,(1,x)
      001CCD                       1458 	_drop 2
      0098C9 0A 26            [ 2]    1     addw sp,#2 
      0098CB 0A               [ 4] 1459 	ret 
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
      001CD0                       1469 list_const:
      0098CC 72 0F            [ 2] 1470 	pushw y 
      001CD2                       1471 	_vars 4 
      0098CE 00 0D            [ 2]    1     sub sp,#4 
      0098D0 05               [ 1] 1472 	clrw x 
      0098D1 03 01            [ 2] 1473 	ldw (COUNT,sp),x  
      0098D3 CD 82 89 00      [ 2] 1474 	ldw Y,#EEPROM_BASE 
      0098D6 90 C3 00 24      [ 2] 1475 1$:	cpw y,free_eeprom 
      0098D6 AE 16            [ 1] 1476 	jruge 9$
      0098D8 68 1C            [ 2] 1477     ldw (YTEMP,sp),y 
      0098DA 00               [ 1] 1478 	ldw x,y
      0098DB 50               [ 1] 1479 	incw x 
      0098DC 5A 7F 9D         [ 4] 1480 	call puts  
      0098DE A6 3D            [ 1] 1481 	ld a,#'= 
      0098DE C6 00 0B         [ 4] 1482 	call putc 
      0098E1 CD 83            [ 2] 1483 	ldw x,(YTEMP,sp)
      0098E3 85 AB 30         [ 4] 1484 	call get_const_value 
      0098E6 A1 3A 2B         [ 1] 1485 	ld acc24,a 
      0098E9 02 AB 07         [ 2] 1486 	ldw acc16,x 
      0098EC CD 18 16         [ 4] 1487 	call prt_acc24
      0098EC 5A F7            [ 1] 1488 	ld a,#CR 
      0098EE 0C 02 C6         [ 4] 1489 	call putc 
      0098F1 00 0D            [ 2] 1490 	ldw x,(COUNT,sp)
      0098F3 CA               [ 1] 1491 	incw x 
      0098F4 00 0E            [ 2] 1492 	ldw (COUNT,sp),x 
      0098F6 CA 00 0F 26      [ 1] 1493 	clr acc16 
      0098FA E3 C6            [ 2] 1494 	ldw y,(YTEMP,sp)
      0098FC 00 0B            [ 1] 1495 	ld a,(y)
      0098FE A1 10 27         [ 1] 1496 	ld acc8,a
      009901 08 7B 01 27      [ 2] 1497 	addw y,acc16 
      009905 0A A6            [ 2] 1498 	jra 1$ 
      001D16                       1499 9$:	
      009907 2D 20            [ 2] 1500 	ldw x,(COUNT,sp)
      009909 02 17 FF         [ 4] 1501 	call prt_i16 
      00990A AE 1D 26         [ 2] 1502 	ldw x,#CONST_COUNT 
      00990A A6 24 5A         [ 4] 1503 	call puts 
      001D21                       1504 	_drop VSIZE 
      00990D F7 0C            [ 2]    1     addw sp,#VSIZE 
      00990F 02 85            [ 2] 1505 	popw y 
      009910 81               [ 4] 1506 	ret 
                                   1507 
      009910 7B 02 5B 04 81 74 61  1508 CONST_COUNT: .asciz " constants in EEPROM\n"
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
      009915                       1521 func_eefree:
      009915 A1 61 2A         [ 2] 1522 	ldw x,#EEPROM_BASE 
      009918 01 81 A1 7A      [ 1] 1523 1$:	mov acc8,#8 ; count 8 consecutive zeros
      00991C 22 FB A0         [ 2] 1524     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      00991F 20 81            [ 1] 1525 	jruge 8$ ; no free space 
      009921 F6               [ 1] 1526 2$: ld a,(x)
      009921 89 52            [ 1] 1527 	jrne 3$
      009923 03               [ 1] 1528 	incw x 
      009924 72 5F 00 0D      [ 1] 1529 	dec acc8 
      009928 72 5F            [ 1] 1530 	jrne 2$
      00992A 00 0E 72         [ 2] 1531 	subw x,#8 
      00992D 5F 00            [ 2] 1532 	jra 9$  
      00992F 0F               [ 1] 1533 3$: ld a,(x)
      009930 0F               [ 1] 1534 	incw x
      009931 01               [ 1] 1535 	tnz a  
      009932 A6 0A            [ 1] 1536 	jrne 3$
      009934 6B               [ 2] 1537 	decw x   
      009935 02 F6            [ 2] 1538 	jra 1$ 
      009937 27               [ 1] 1539 8$: clrw x ; no free space 
      009938 47               [ 1] 1540 9$: clr a 
      009939 A1 2D 26         [ 2] 1541 	ldw free_eeprom,x ; save in system variable 
      00993C 04               [ 4] 1542 	ret 
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



      001D65                       1565 search_const:
      00993D 03 01            [ 2] 1566 	pushw y 
      001D67                       1567 	_vars VSIZE
      00993F 20 08            [ 2]    1     sub sp,#VSIZE 
      009941 A1 24 26 06      [ 1] 1568 	clr acc16 
      009945 A6 10 6B         [ 4] 1569 	call strlen 
      009948 02 5C            [ 1] 1570 	add a,#CONST_REC_XTRA_BYTES
      00994A F6 05            [ 1] 1571 	ld (RECLEN,sp),a    
      00994B 1F 01            [ 2] 1572 	ldw (NAMEPTR,sp),x
      00994B A1 61 2B 02      [ 2] 1573 	ldw y,#EEPROM_BASE 
      00994F A0 20            [ 2] 1574 1$:	ldw x,(NAMEPTR,sp)
      009951 A1 30            [ 2] 1575 	ldw (EEPTR,sp),y
      009953 2B 2B A0 30      [ 2] 1576 	cpw y, free_eeprom 
      009957 A1 0A            [ 1] 1577 	jruge 7$ ; no match found 
      009959 2B 06            [ 1] 1578 	ld a,(y)
      00995B A0 07            [ 1] 1579 	cp a,(RECLEN,sp)
      00995D 11 02            [ 1] 1580 	jrne 2$ 
      00995F 2A 1F            [ 1] 1581 	incw y 
      009961 6B 03 7B         [ 4] 1582 	call strcmp
      009964 02 CD            [ 1] 1583 	jrne 8$ ; match found 
      001D91                       1584 2$: ; skip this one 	
      009966 82 A6            [ 2] 1585 	ldW Y,(EEPTR,sp)
      009968 7B 03            [ 1] 1586 	ld a,(y)
      00996A CB 00 0F         [ 1] 1587 	ld acc8,a 
      00996D C7 00 0F 4F      [ 2] 1588 	addw y,acc16 
      009971 C9 00            [ 2] 1589 	jra 1$  
      001D9E                       1590 7$: ; no match found 
      009973 0E C7            [ 1] 1591 	clr (EEPTR,sp)
      009975 00 0E            [ 1] 1592 	clr (EEPTR+1,sp)
      001DA2                       1593 8$: ; match found 
      009977 4F C9            [ 2] 1594 	ldw x,(EEPTR,sp) ; record address 
      001DA4                       1595 9$:	_DROP VSIZE
      009979 00 0D            [ 2]    1     addw sp,#VSIZE 
      00997B C7 00            [ 2] 1596 	 popw y 
      00997D 0D               [ 4] 1597 	 ret 
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
      001DA9                       1610 cmd_const:
      00997E 20 C9            [ 2] 1611 	pushw y 
      001DAB                       1612 	_vars VSIZE 
      009980 0D 01            [ 2]    1     sub sp,#VSIZE 
      009982 27 03            [ 1] 1613 	clr (UPDATE,sp)
      009984 CD 82 89         [ 4] 1614 	call next_token 
      009987 A1 04            [ 1] 1615 	cp a,#TK_CHAR 
      009987 5B 03            [ 1] 1616 	jrne 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      009989 85 81 F9         [ 4] 1617 	call get_char 
      00998B A4 DF            [ 1] 1618 	and a,#0xDF 
      00998B 52 05            [ 1] 1619 	cp a,#'U 
      00998D 17 04            [ 1] 1620 	jrne 1$
      00998F 03 06            [ 1] 1621 	cpl (UPDATE,sp)
      00998F 1F 02            [ 2] 1622 	jra const_loop 
      009991 F6 A4            [ 1] 1623 0$: cp a,#TK_LABEL 
      009993 0F 6B            [ 1] 1624 	jreq cloop_1
      009995 01 16 04         [ 2] 1625 1$: jp syntax_error
      001DCA                       1626 const_loop: 
      009998 5C 03            [ 1] 1627 	ld a,#TK_LABEL 
      009999 CD 19 56         [ 4] 1628 	call expect  
      001DCF                       1629 cloop_1: 
      009999 90 F6            [ 2] 1630 	ldw (CNAME,sp),x ; *const_name
      00999B 27 1B 0D         [ 4] 1631 	call skip_string
      00999E 01 27            [ 2] 1632 	ldw x,(CNAME,sp)
      0099A0 0A F1 26         [ 4] 1633 	call strlen  
      0099A3 07 90            [ 1] 1634 	add a,#CONST_REC_XTRA_BYTES 
      0099A5 5C 5C            [ 1] 1635 	ld (RECLEN,sp),a 
                                   1636 ; copy name in buffer  
      0099A7 0A 01            [ 2] 1637 	ldw y,(CNAME,sp) 
      0099A9 20 EE 68         [ 2] 1638 	ldw x,#tib  
      0099AB 7B 05            [ 1] 1639 	ld a,(RECLEN,sp)
      0099AB 1E               [ 1] 1640 	ld (x),a 
      0099AC 02               [ 1] 1641 	incw x  
      0099AD 1D 00 02         [ 4] 1642 	call strcpy 
      0099B0 4B 00            [ 2] 1643 	ldw (BUFPTR,sp),x 
                                   1644 ; x not updated by strcpy 
                                   1645 ; BUFPTR must be incremented 
                                   1646 ; to point after name 
      0099B2 FE               [ 1] 1647 	clrw x 
      0099B3 84 27            [ 1] 1648 	ld a,(RECLEN,sp)
      0099B5 1D 20            [ 1] 1649 	sub a,#CONST_REC_XTRA_BYTES-1
      0099B7 D7               [ 1] 1650 	ld xl,a  
      0099B8 72 FB 03         [ 2] 1651 	addw x,(BUFPTR,sp)
      0099B8 1E 02            [ 2] 1652 	ldw (BUFPTR,sp),x 
      0099BA F6 6B            [ 1] 1653 	ld a,#TK_EQUAL 
      0099BC 01 A4 0F         [ 4] 1654 	call expect 
      0099BF 4C C7            [ 2] 1655 	ldw y,(YSAVE,sp) ; restore xstack pointer 
      0099C1 00 0F 72         [ 4] 1656 	call expression 
      0099C4 5F 00            [ 1] 1657 	cp a,#TK_INTGR 
      0099C6 0E 72            [ 1] 1658 	jreq 5$ 
      0099C8 BB 00 0E         [ 2] 1659 	jp syntax_error 
      001E07                       1660 5$:	_xpop 
      0099CB FE 7B            [ 1]    1     ld a,(y)
      0099CD 01               [ 1]    2     ldw x,y 
      0099CE A4 F0            [ 2]    3     ldw x,(1,x)
      0099D0 4E AB 80 03      [ 2]    4     addw y,#CELL_SIZE 
      0099D3 17 07            [ 2] 1661 	ldw (YSAVE,sp),y ; save xtack pointer 
      0099D3 5B 05            [ 2] 1662 	ldw y,(BUFPTR,sp)
      0099D5 81 F7            [ 1] 1663 	ld (y),a 
      0099D6 90 EF 01         [ 2] 1664 	ldw (1,y),x 
                                   1665 ; record completed in buffer 
                                   1666 ; check if constant already exist 
                                   1667 ; if exist and \U option then update  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      0099D6 88 CD 98 2A      [ 1] 1668 	clr farptr 
      0099DA 11 01            [ 2] 1669 	ldw x,(CNAME,sp)
      0099DC 27 03 CC         [ 4] 1670 	call search_const 
      0099DF 97               [ 2] 1671 	tnzw x 
      0099E0 29 84            [ 1] 1672 	jreq 6$ ; new constant  
      0099E2 81 06            [ 1] 1673 	tnz (UPDATE,sp)
      0099E3 27 1F            [ 1] 1674 	jreq 8$ 
      0099E3 A6 06            [ 2] 1675 	jra 7$	
      001E2B                       1676 6$:	
      0099E5 CD 99 D6         [ 2] 1677 	ldw x,free_eeprom  
      0099E8                       1678 7$:	
      0099E8 4B 00 CD         [ 2] 1679 	ldw farptr+1,x 
      0099EB 9C 2C 4D         [ 2] 1680 	ldw x,#tib 
      0099EE 27 12            [ 1] 1681 	ld a,(RECLEN,sp)
      0099F0 0C 01 CD         [ 4] 1682 	call write_nbytes
      0099F3 98 2A            [ 1] 1683 	tnz (UPDATE,sp)
      0099F5 A1 08            [ 1] 1684 	jrne 8$ ; not a new constant, don't update free_eeprom
                                   1685 ; update free_eeprom 
      0099F7 27               [ 1] 1686 	clrw x 
      0099F8 F1 A1            [ 1] 1687 	ld a,(RECLEN,sp)
      0099FA 07               [ 1] 1688 	ld xl,a 
      0099FB 27 05 55 00      [ 2] 1689 	addw x,free_eeprom 
      0099FF 03 00 02         [ 2] 1690 	ldw free_eeprom,x
      001E48                       1691 8$: ; check for next constant 
      009A02 84 81 AA         [ 4] 1692 	call next_token 
      009A04 A1 08            [ 1] 1693 	cp a,#TK_COMMA 
      009A04 CD 99            [ 1] 1694 	jrne 9$ ; no other constant 
      009A06 E3 A1 01         [ 2] 1695 	jp const_loop 
      001E52                       1696 9$: 
      001E52                       1697 	_unget_token    
      009A09 27 03 CC 97 29   [ 1]    1      mov in,in.saved  
      001E57                       1698 10$: 
      001E57                       1699 	_drop VSIZE 
      009A0E 90 F6            [ 2]    1     addw sp,#VSIZE 
      009A10 93 EE            [ 2] 1700 	popw y ; restore xstack pointer 
      009A12 01               [ 4] 1701 	ret 
                                   1702 
                                   1703 
                                   1704 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1705 ; return program size 
                                   1706 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001E5C                       1707 prog_size:
      009A13 72 A9 00         [ 2] 1708 	ldw x,txtend 
      009A16 03 C3 00 21      [ 2] 1709 	subw x,txtbgn 
      009A1A 23               [ 4] 1710 	ret 
                                   1711 
                                   1712 ;----------------------------
                                   1713 ; print program information 
                                   1714 ;---------------------------
      001E64                       1715 program_info: 
      009A1B 05 A6 0A         [ 2] 1716 	ldw x,#PROG_ADDR 
      009A1E CC 97 2B         [ 4] 1717 	call puts 
      009A21 5D 27 F8         [ 2] 1718 	ldw x,txtbgn 
      009A24 89 58 72 FB      [ 1] 1719 	mov base,#16 
      009A28 01 1F 01         [ 4] 1720 	call prt_i16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      009A2B AE 16 68 72      [ 1] 1721 	mov base,#10  
      009A2F F0 01 5B         [ 2] 1722 	ldw x,#PROG_SIZE
      009A32 02 81 9D         [ 4] 1723 	call puts 
      009A34 CD 1E 5C         [ 4] 1724 	call prog_size 
      009A34 52 01 0F         [ 4] 1725 	call prt_i16 
      009A37 01 CD 98         [ 2] 1726 	ldw x,#STR_BYTES 
      009A3A 2A 4D 26         [ 4] 1727 	call puts
      009A3D 03 CC 9A         [ 2] 1728 	ldw x,txtbgn
      009A40 CD A1 10         [ 2] 1729 	cpw x,#app 
      009A43 27 06            [ 1] 1730 	jrult 2$
      009A45 A1 11 26         [ 2] 1731 	ldw x,#FLASH_MEM 
      009A48 05 03            [ 2] 1732 	jra 3$
      009A4A 01 1E DE         [ 2] 1733 2$: ldw x,#RAM_MEM 	 
      009A4B CD 09 9D         [ 4] 1734 3$:	call puts 
      009A4B CD 98            [ 1] 1735 	ld a,#CR 
      009A4D 2A 09 40         [ 4] 1736 	call putc
      009A4E 81               [ 4] 1737 	ret 
                                   1738 
      009A4E 4D 26 03 CC 97 29 6D  1739 PROG_ADDR: .asciz "program address: "
             20 61 64 64 72 65 73
             73 3A 20 00
      009A54 2C 20 70 72 6F 67 72  1740 PROG_SIZE: .asciz ", program size: "
             61 6D 20 73 69 7A 65
             3A 20 00
      009A54 A1 81 26 06 CD 98 43  1741 STR_BYTES: .asciz " bytes" 
      009A5B FD 20 5D 20 46 4C 41  1742 FLASH_MEM: .asciz " in FLASH memory" 
             53 48 20 6D 65 6D 6F
             72 79 00
      009A5E 20 69 6E 20 52 41 4D  1743 RAM_MEM:   .asciz " in RAM memory" 
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
      001EED                       1757 list:
      009A5E A1 84 26 05 CD   [ 2] 1758 	btjf flags,#FRUN,0$
      009A63 98 69            [ 1] 1759 	ld a,#ERR_CMD_ONLY
      009A65 20 54 AB         [ 2] 1760 	jp tb_error
      009A67                       1761 0$:	 
      009A67 A1 05 26         [ 4] 1762 	call next_token 
      009A6A 05 CD            [ 1] 1763 	cp a,#TK_CHAR 
      009A6C 9A 04            [ 1] 1764 	jrne 2$
      009A6E 20 07 F9         [ 4] 1765 	call get_char 
      009A70 A4 DF            [ 1] 1766 	and a,#0xDF 
      009A70 A1 85            [ 1] 1767 	cp a,#'C 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      009A72 26 08            [ 1] 1768 	jrne 1$
      009A74 CD 98 5F         [ 4] 1769 	call list_const
      009A77 81               [ 4] 1770 	ret 
      009A77 F6 EE 01         [ 2] 1771 1$: jp syntax_error 
      001F0E                       1772 2$:	_unget_token 
      009A7A 20 3F 02 00 01   [ 1]    1      mov in,in.saved  
      009A7C CD 1E 5C         [ 4] 1773 	call prog_size 
      009A7C A1 03            [ 1] 1774 	jrugt 3$
      009A7E 26               [ 4] 1775 	ret 
      001F19                       1776 3$: _vars VSIZE
      009A7F 10 89            [ 2]    1     sub sp,#VSIZE 
      009A81 CD 98 50         [ 2] 1777 	ldw x,txtbgn 
      009A84 85 CD            [ 2] 1778 	ldw (LN_PTR,sp),x 
      009A86 9D               [ 2] 1779 	ldw x,(x) 
      009A87 E5 5D            [ 2] 1780 	ldw (FIRST,sp),x ; list from first line 
      009A89 27 28 CD         [ 2] 1781 	ldw x,#MAX_LINENO ; biggest line number 
      009A8C 9D 41            [ 2] 1782 	ldw (LAST,sp),x 
      009A8E 20 2B 68         [ 4] 1783 	call arg_list
      009A90 4D               [ 1] 1784 	tnz a
      009A90 A1 82            [ 1] 1785 	jreq list_loop 
      009A92 26 08            [ 1] 1786 	cp a,#2 
      009A94 CD 98            [ 1] 1787 	jreq 4$
      009A96 43 FD            [ 1] 1788 	cp a,#1 
      009A98 5F 02            [ 1] 1789 	jreq first_line 
      009A9A 20 1F A9         [ 2] 1790 	jp syntax_error 
      009A9C 85               [ 2] 1791 4$:	popw x 
      009A9C A1 06            [ 2] 1792 	ldw (LAST+2,sp),x 
      001F3C                       1793 first_line:
      009A9E 26               [ 2] 1794 	popw x
      009A9F 13 CD            [ 2] 1795 	ldw (FIRST,sp),x 
      001F3F                       1796 lines_skip:
      009AA1 9B 13 A6         [ 2] 1797 	ldw x,txtbgn
      009AA4 07 CD            [ 2] 1798 2$:	ldw (LN_PTR,sp),x 
      009AA6 99 D6 90         [ 2] 1799 	cpw x,txtend 
      009AA9 F6 93            [ 1] 1800 	jrpl list_exit 
      009AAB EE               [ 2] 1801 	ldw x,(x) ;line# 
      009AAC 01 72            [ 2] 1802 	cpw x,(FIRST,sp)
      009AAE A9 00            [ 1] 1803 	jrpl list_loop 
      009AB0 03 20            [ 2] 1804 	ldw x,(LN_PTR,sp) 
      009AB2 08 02            [ 1] 1805 	ld a,(2,x)
      009AB3 C7 00 0E         [ 1] 1806 	ld acc8,a 
      009AB3 55 00 03 00      [ 1] 1807 	clr acc16 
      009AB7 02 4F 20 12      [ 2] 1808 	addw x,acc16
      009ABB 20 E3            [ 2] 1809 	jra 2$ 
                                   1810 ; print loop
      001F5F                       1811 list_loop:
      009ABB 0D 01            [ 2] 1812 	ldw x,(LN_PTR,sp)
      009ABD 27 03            [ 1] 1813 	ld a,(2,x) 
      009ABF CD 82 81         [ 4] 1814 	call prt_basic_line
      009AC2 1E 05            [ 2] 1815 	ldw x,(LN_PTR,sp)
      009AC2 72 A2            [ 1] 1816 	ld a,(2,x)
      009AC4 00 03 90         [ 1] 1817 	ld acc8,a 
      009AC7 F7 90 EF 01      [ 1] 1818 	clr acc16 
      009ACB A6 84 00 0D      [ 2] 1819 	addw x,acc16
      009ACD C3 00 1D         [ 2] 1820 	cpw x,txtend 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      009ACD 5B 01            [ 1] 1821 	jrpl list_exit
      009ACF 81 05            [ 2] 1822 	ldw (LN_PTR,sp),x
      009AD0 FE               [ 2] 1823 	ldw x,(x)
      009AD0 52 01            [ 2] 1824 	cpw x,(LAST,sp)  
      009AD2 CD 9A            [ 1] 1825 	jrslt list_loop
      001F81                       1826 list_exit:
      009AD4 34 4D 27 38 01   [ 1] 1827 	mov in,count 
      009AD8 AE 16 B8         [ 2] 1828 	ldw x,#pad 
      009AD8 CD 98 2A         [ 2] 1829 	ldw basicptr,x 
      001F8C                       1830 	_drop VSIZE 
      009ADB 6B 01            [ 2]    1     addw sp,#VSIZE 
      009ADD A4 30 A1         [ 4] 1831 	call program_info 
      009AE0 20               [ 4] 1832 	ret
                                   1833 
                                   1834 
                                   1835 ;--------------------------
                                   1836 ; BASIC: EDIT 
                                   1837 ;  copy program in FLASH 
                                   1838 ;  to RAM for edition 
                                   1839 ;-------------------------
      001F92                       1840 edit:
      009AE1 27 09 A6         [ 4] 1841 	call qsign 
      009AE4 84 55            [ 1] 1842 	jreq 1$ 
      009AE6 00 03 00         [ 2] 1843 	ldw x,#NOT_SAVED 
      009AE9 02 20 24         [ 4] 1844 	call puts 
      009AEC 81               [ 4] 1845 	ret 
      001F9E                       1846 1$: 
      009AEC CD 9A 34 4D      [ 2] 1847 	ldw y,#app_sign ; source address 
      009AF0 26 03 CC         [ 2] 1848     ldw x,app_size  
      009AF3 97 29 04         [ 2] 1849 	addw x,#4 
      009AF5 CF 00 0D         [ 2] 1850 	ldw acc16,x  ; bytes to copy 
      009AF5 7B 01 A1         [ 2] 1851 	ldw x,#rsign ; destination address 
      009AF8 20 26 05         [ 4] 1852 	call move  
      009AFB CD 82 D9         [ 2] 1853 	ldw x,#free_ram 
      009AFE 20 D8 A1         [ 2] 1854 	ldw txtbgn,x 
      009B01 21 26 05 CD      [ 2] 1855 	addw x,rsize  
      009B05 83 A3 20         [ 2] 1856 	ldw txtend,x 
      009B08 CF               [ 4] 1857 	ret 
                                   1858 
      009B09 4E 6F 20 61 70 70 6C  1859 NOT_SAVED: .asciz "No application saved.\n"
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
      001FD6                       1871 prt_basic_line:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      009B09 CD 84            [ 2] 1872 	pushw y 
      009B0B 51 20 CA         [ 1] 1873 	ld count,a 
      009B0E E6 02            [ 1] 1874 	ld a,(2,x)
      009B0E A6 84 03         [ 1] 1875 	cp a,count 
      009B10 2A 03            [ 1] 1876 	jrpl 1$ 
      009B10 5B 01 81         [ 1] 1877 	ld count,a 
      009B13 CF 00 04         [ 2] 1878 1$:	ldw basicptr,x 
      009B13 52 01 CD 9A      [ 2] 1879 	ldw y,#tib  
      009B17 D0 4D 27         [ 4] 1880 	call decompile 
      009B1A 2D 09 9D         [ 4] 1881 	call puts 
      009B1B A6 0D            [ 1] 1882 	ld a,#CR 
      009B1B CD 98 2A         [ 4] 1883 	call putc 
      009B1E 6B 01            [ 2] 1884 	popw y 
      009B20 A4               [ 4] 1885 	ret 
                                   1886 
                                   1887 
                                   1888 ;---------------------------------
                                   1889 ; BASIC: PRINT|? arg_list 
                                   1890 ; print values from argument list
                                   1891 ;----------------------------------
                           000001  1892 	CCOMMA=1
                           000001  1893 	VSIZE=1
      001FFA                       1894 print:
      001FFA                       1895 	_vars VSIZE 
      009B21 30 A1            [ 2]    1     sub sp,#VSIZE 
      001FFC                       1896 reset_comma:
      009B23 10 27            [ 1] 1897 	clr (CCOMMA,sp)
      001FFE                       1898 prt_loop:
      009B25 09 55 00         [ 4] 1899 	call next_token
      009B28 03 00            [ 1] 1900 	cp a,#CMD_END 
      009B2A 02 A6            [ 1] 1901 	jrult 0$
      009B2C 84 20            [ 1] 1902 	cp a,#TK_COLON 
      009B2E 19 04            [ 1] 1903 	jreq 0$
      009B2F A1 80            [ 1] 1904 	cp a,#TK_CMD
      009B2F CD 9A            [ 1] 1905 	jrne 10$
      00200D                       1906 0$:
      00200D                       1907 	_unget_token 
      009B31 D0 4D 26 03 CC   [ 1]    1      mov in,in.saved  
      009B36 97 29            [ 2] 1908 	jra 8$ 
      009B38                       1909 10$:	
      009B38 7B 01            [ 1] 1910 	cp a,#TK_QSTR
      009B3A A1 10            [ 1] 1911 	jreq 1$
      009B3C 26 05            [ 1] 1912 	cp a,#TK_CHAR 
      009B3E CD 81            [ 1] 1913 	jreq 2$ 
      009B40 EA 20            [ 1] 1914 	cp a,#TK_CFUNC 
      009B42 D8 1F            [ 1] 1915 	jreq 3$
      009B43 A1 08            [ 1] 1916 	cp a,#TK_COMMA 
      009B43 CD 82            [ 1] 1917 	jreq 4$
      009B45 07 20            [ 1] 1918 	cp a,#TK_SHARP 
      009B47 D3 24            [ 1] 1919 	jreq 5$
      009B48 20 37            [ 2] 1920 	jra 7$ 
      00202A                       1921 1$:	; print string 
      009B48 5B 01 81         [ 4] 1922 	call puts
      009B4B 5C               [ 1] 1923 	incw x
      009B4B 52 01 CD 9B      [ 2] 1924 	subw x,basicptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      009B4F 13 4D 27         [ 2] 1925 	ldw in.w,x  
      009B52 54 CD            [ 2] 1926 	jra reset_comma
      002037                       1927 2$:	; print character 
      009B54 98 2A 6B         [ 4] 1928 	call get_char 
      009B57 01 A4 30         [ 4] 1929 	call putc 
      009B5A A1 30            [ 2] 1930 	jra reset_comma 
      00203F                       1931 3$: ; print character function value  	
      009B5C 27 09 A6         [ 4] 1932 	call get_code_addr 
      009B5F 84               [ 4] 1933 	call (x)
      009B60 55 00 03         [ 4] 1934 	call putc
      009B63 00 02            [ 2] 1935 	jra reset_comma 
      002048                       1936 4$: ; set comma state 
      009B65 20 40            [ 1] 1937 	cpl (CCOMMA,sp)
      009B67 20 B2            [ 2] 1938 	jra prt_loop   
      00204C                       1939 5$: ; # character must be followed by an integer   
      009B67 CD 9B 13         [ 4] 1940 	call next_token
      009B6A 4D 26            [ 1] 1941 	cp a,#TK_INTGR 
      009B6C 03 CC            [ 1] 1942 	jreq 6$
      009B6E 97 29 A9         [ 2] 1943 	jp syntax_error 
      009B70                       1944 6$: ; set tab width
      009B70 CD 82 24         [ 4] 1945 	call get_int24 
      009B73 90               [ 1] 1946 	ld a,xl 
      009B74 F6 93            [ 1] 1947 	and a,#15 
      009B76 EE 01 72         [ 1] 1948 	ld tab_width,a 
      009B79 A9 00            [ 2] 1949 	jra reset_comma 
      002061                       1950 7$:	
      002061                       1951 	_unget_token 
      009B7B 03 4D 2B 08 26   [ 1]    1      mov in,in.saved  
      009B80 0C 35 02         [ 4] 1952 	call condition
      009B83 00               [ 1] 1953 	tnz a 
      009B84 0F 20            [ 1] 1954 	jreq 8$    
      009B86 0A 18 24         [ 4] 1955     call print_top
      009B87 20 8B            [ 2] 1956 	jra reset_comma 
      002071                       1957 8$:
      009B87 35 04            [ 1] 1958 	tnz (CCOMMA,sp)
      009B89 00 0F            [ 1] 1959 	jrne 9$
      009B8B 20 04            [ 1] 1960 	ld a,#CR 
      009B8D CD 09 40         [ 4] 1961     call putc 
      00207A                       1962 9$:	_drop VSIZE 
      009B8D 35 01            [ 2]    1     addw sp,#VSIZE 
      009B8F 00               [ 4] 1963 	ret 
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
      00207D                       1981 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00207D                       1982 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      00207D                       1983 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      00207D                       1984 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      00207D                       1985 save_context:
      009B90 0F 00 04         [ 2] 1986 	ldw x,basicptr 
      009B91 1F 03            [ 2] 1987 	ldw (BPTR,sp),x
      009B91 5F C6 00         [ 1] 1988 	ld a,in 
      009B94 0F 14            [ 1] 1989 	ld (IN,sp),a
      009B96 01 27 03         [ 1] 1990 	ld a,count 
      009B99 53 A6            [ 1] 1991 	ld (CNT,sp),a  
      009B9B FF               [ 4] 1992 	ret
                                   1993 
                                   1994 ;-----------------------
                                   1995 ; restore previously saved 
                                   1996 ; BASIC interpreter context 
                                   1997 ; from stack 
                                   1998 ;-------------------------
      00208D                       1999 rest_context:
      009B9C 72 A2            [ 2] 2000 	ldw x,(BPTR,sp)
      009B9E 00 03 90         [ 2] 2001 	ldw basicptr,x 
      009BA1 F7 90            [ 1] 2002 	ld a,(IN,sp)
      009BA3 EF 01 A6         [ 1] 2003 	ld in,a
      009BA6 84 06            [ 1] 2004 	ld a,(CNT,sp)
      009BA7 C7 00 03         [ 1] 2005 	ld count,a  
      009BA7 5B               [ 4] 2006 	ret
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
      00209D                       2020 input_var:
      009BA8 01 81            [ 2] 2021 	pushw y 
      009BAA                       2022 	_vars VSIZE 
      009BAA 4B 00            [ 2]    1     sub sp,#VSIZE 
      0020A1                       2023 input_loop:
      009BAC CD 98            [ 1] 2024 	clr (SKIP,sp)
      009BAE 2A 4D 27         [ 4] 2025 	call next_token 
      009BB1 25 A1            [ 1] 2026 	cp a,#TK_QSTR 
      009BB3 87 26            [ 1] 2027 	jrne 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      009BB5 04 03 01         [ 4] 2028 	call puts 
      009BB8 20               [ 1] 2029 	incw x 
      009BB9 F2 B0 00 04      [ 2] 2030 	subw x,basicptr 
      009BBA CF 00 00         [ 2] 2031 	ldw in.w,x 
      009BBA A1 06            [ 1] 2032 	cpl (SKIP,sp)
      009BBC 26 0A CD         [ 4] 2033 	call next_token 
      009BBF 9C 2C            [ 1] 2034 1$: cp a,#TK_VAR  
      009BC1 A6 07            [ 1] 2035 	jreq 2$ 
      009BC3 CD 99 D6         [ 2] 2036 	jp syntax_error
      009BC6 20 08 55         [ 4] 2037 2$:	call get_addr
      009BC9 00 03 00         [ 2] 2038 	ldw ptr16,x 
      009BCC 02 CD            [ 1] 2039 	tnz (SKIP,sp)
      009BCE 9B 4B            [ 1] 2040 	jrne 21$ 
      009BD0 CD 11 D8         [ 4] 2041 	call var_name 
      009BD0 0D 01 27         [ 4] 2042 	call putc   
      0020D1                       2043 21$:
      009BD3 03 CD            [ 1] 2044 	ld a,#':
      009BD5 82 66 40         [ 4] 2045 	call putc 
      009BD7 CD 20 7D         [ 4] 2046 	call save_context 
      009BD7 5B 01 81 03      [ 1] 2047 	clr count  
      009BDA CD 0A A2         [ 4] 2048 	call readln 
      009BDA CD 9B AA         [ 2] 2049 	ldw x,#tib 
      009BDD 4D 27 4B         [ 1] 2050 	push count
      009BE0 CD 98            [ 1] 2051 	push #0 
      009BE2 2A 4D 27         [ 2] 2052 	addw x,(1,sp)
      009BE5 43               [ 1] 2053 	incw x 
      0020EC                       2054 	_drop 2 
      009BE6 A1 88            [ 2]    1     addw sp,#2 
      009BE8 27 07 55 00      [ 1] 2055 	clr in 
      009BEC 03 00 02         [ 4] 2056 	call get_token
      009BEF 20 38            [ 1] 2057 	cp a,#TK_INTGR
      009BF1 CD 9B            [ 1] 2058 	jreq 3$ 
      009BF3 AA 4D            [ 1] 2059 	cp a,#TK_MINUS
      009BF5 26 03            [ 1] 2060 	jrne 22$
      009BF7 CC 97 29         [ 4] 2061 	call get_token 
      009BFA A1 84            [ 1] 2062 	cp a,#TK_INTGR 
      009BFA 90 F6            [ 1] 2063 	jreq 23$
      002104                       2064 22$:
      009BFC 93 EE 01         [ 4] 2065 	call rest_context 
      009BFF 72 A9 00         [ 2] 2066 	jp syntax_error
      00210A                       2067 23$:
      009C02 03 C7 00         [ 4] 2068 	call neg_acc24	
      00210D                       2069 3$: 
      009C05 0D CF 00         [ 1] 2070 	ld a,acc24 
      009C08 0E 90 F6         [ 2] 2071 	ldw x,acc16 
      009C0B 93 EE 01 72      [ 4] 2072 	ld [ptr16],a
      009C0F A9 00 03 C4      [ 1] 2073 	inc ptr8  
      009C13 00 0D 02 C4      [ 5] 2074 	ldw [ptr16],x 
      009C17 00 0E 02         [ 4] 2075 	call rest_context
      009C1A C4 00 0F         [ 4] 2076 	call next_token 
      009C1D 02 72            [ 1] 2077 	cp a,#TK_COMMA
      009C1F A2 00            [ 1] 2078 	jrne 4$ 
      009C21 03 90 F7         [ 2] 2079 	jp input_loop
      00212C                       2080 4$:
      009C24 90 EF            [ 1] 2081 	cp a,#TK_NONE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      009C26 01 20            [ 1] 2082 	jreq input_exit  
      009C28 B7 A6            [ 1] 2083 	cp a,#TK_COLON 
      009C2A 84 81            [ 1] 2084     jreq input_exit 
      009C2C CC 16 A9         [ 2] 2085 	jp syntax_error 
      002137                       2086 input_exit:
      002137                       2087 	_drop VSIZE 
      009C2C 52 02            [ 2]    1     addw sp,#VSIZE 
      009C2E CD 9B            [ 2] 2088 	popw y 
      009C30 DA               [ 4] 2089 	ret 
                                   2090 
                                   2091 
                                   2092 ;---------------------
                                   2093 ; BASIC: REM | ' 
                                   2094 ; skip comment to end of line 
                                   2095 ;---------------------- 
      00213C                       2096 remark::
      009C31 4D 27 69 CD 98   [ 1] 2097 	mov in,count 
      009C36 2A               [ 4] 2098  	ret 
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
      002142                       2114 wait: 
      002142                       2115 	_vars VSIZE
      009C37 A1 89            [ 2]    1     sub sp,#VSIZE 
      009C39 27 0B            [ 1] 2116 	clr (XMASK,sp) 
      009C3B A1 8A 27         [ 4] 2117 	call arg_list 
      009C3E 07 55            [ 1] 2118 	cp a,#2
      009C40 00 03            [ 1] 2119 	jruge 0$
      009C42 00 02 20         [ 2] 2120 	jp syntax_error 
      009C45 55 6B            [ 1] 2121 0$:	cp a,#3
      009C47 02 CD            [ 1] 2122 	jrult 1$
      002154                       2123 	_xpop  ; xor mask 
      009C49 9B DA            [ 1]    1     ld a,(y)
      009C4B A1               [ 1]    2     ldw x,y 
      009C4C 84 27            [ 2]    3     ldw x,(1,x)
      009C4E 03 CC 97 29      [ 2]    4     addw y,#CELL_SIZE 
      009C52 9F               [ 1] 2124 	ld a,xl 
      009C52 90 F6            [ 1] 2125 	ld (XMASK,sp),a 
      002160                       2126 1$: _xpop ; mask
      009C54 93 EE            [ 1]    1     ld a,(y)
      009C56 01               [ 1]    2     ldw x,y 
      009C57 72 A9            [ 2]    3     ldw x,(1,x)
      009C59 00 03 C7 00      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      009C5D 0D               [ 1] 2127     ld a,xl  
      009C5E CF 00            [ 1] 2128 	ld (MASK,sp),a 
      00216C                       2129 	_xpop ; address 
      009C60 0E 90            [ 1]    1     ld a,(y)
      009C62 F6               [ 1]    2     ldw x,y 
      009C63 93 EE            [ 2]    3     ldw x,(1,x)
      009C65 01 72 A9 00      [ 2]    4     addw y,#CELL_SIZE 
      009C69 03               [ 1] 2130 2$:	ld a,(x)
      009C6A 6B 01            [ 1] 2131 	and a,(MASK,sp)
      009C6C 7B 02            [ 1] 2132 	xor a,(XMASK,sp)
      009C6E A1 8A            [ 1] 2133 	jreq 2$ 
      00217C                       2134 	_drop VSIZE 
      009C70 27 10            [ 2]    1     addw sp,#VSIZE 
      009C72 81               [ 4] 2135 	ret 
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
      00217F                       2147 bit_set:
      009C72 7B 01 CA         [ 4] 2148 	call arg_list 
      009C75 00 0D            [ 1] 2149 	cp a,#2	 
      009C77 02 CA            [ 1] 2150 	jreq 1$ 
      009C79 00 0E 02         [ 2] 2151 	jp syntax_error
      002189                       2152 1$: 
      002189                       2153 	_xpop ; mask 
      009C7C CA 00            [ 1]    1     ld a,(y)
      009C7E 0F               [ 1]    2     ldw x,y 
      009C7F 02 20            [ 2]    3     ldw x,(1,x)
      009C81 0E A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C82 9F               [ 1] 2154 	ld a,xl
      009C82 7B               [ 1] 2155 	push a  
      002194                       2156 	_xpop ; addr  
      009C83 01 C8            [ 1]    1     ld a,(y)
      009C85 00               [ 1]    2     ldw x,y 
      009C86 0D 02            [ 2]    3     ldw x,(1,x)
      009C88 C8 00 0E 02      [ 2]    4     addw y,#CELL_SIZE 
      009C8C C8               [ 1] 2157 	pop a 
      009C8D 00               [ 1] 2158 	or a,(x)
      009C8E 0F               [ 1] 2159 	ld (x),a
      009C8F 02               [ 4] 2160 	ret 
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
      0021A1                       2172 bit_reset:
      009C90 72 A2 00         [ 4] 2173 	call arg_list 
      009C93 03 90            [ 1] 2174 	cp a,#2  
      009C95 F7 90            [ 1] 2175 	jreq 1$ 
      009C97 EF 01 20         [ 2] 2176 	jp syntax_error
      0021AB                       2177 1$: 
      0021AB                       2178 	_xpop ; mask 
      009C9A 99 A6            [ 1]    1     ld a,(y)
      009C9C 84               [ 1]    2     ldw x,y 
      009C9D 5B 02            [ 2]    3     ldw x,(1,x)
      009C9F 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009CA0 9F               [ 1] 2179 	ld a,xl 
      009CA0 35               [ 1] 2180 	cpl a
      009CA1 10               [ 1] 2181 	push a  
      0021B7                       2182 	_xpop ; addr  
      009CA2 00 0B            [ 1]    1     ld a,(y)
      009CA4 81               [ 1]    2     ldw x,y 
      009CA5 EE 01            [ 2]    3     ldw x,(1,x)
      009CA5 35 0A 00 0B      [ 2]    4     addw y,#CELL_SIZE 
      009CA9 81               [ 1] 2183 	pop a 
      009CAA F4               [ 1] 2184 	and a,(x)
      009CAA 90               [ 1] 2185 	ld (x),a 
      009CAB 89               [ 4] 2186 	ret 
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
      0021C4                       2198 bit_toggle:
      009CAC 4F AE 16         [ 4] 2199 	call arg_list 
      009CAF 68 90            [ 1] 2200 	cp a,#2 
      009CB1 CE 00            [ 1] 2201 	jreq 1$ 
      009CB3 1C 90 A3         [ 2] 2202 	jp syntax_error
      0021CE                       2203 1$: _xpop ; mask 
      009CB6 B6 80            [ 1]    1     ld a,(y)
      009CB8 25               [ 1]    2     ldw x,y 
      009CB9 05 1D            [ 2]    3     ldw x,(1,x)
      009CBB 00 80 20 04      [ 2]    4     addw y,#CELL_SIZE 
      009CBF 9F               [ 1] 2204 	ld a,xl
      009CBF 72               [ 1] 2205 	push a 
      0021D9                       2206 	_xpop  ; addr  
      009CC0 B0 00            [ 1]    1     ld a,(y)
      009CC2 1E               [ 1]    2     ldw x,y 
      009CC3 90 85            [ 2]    3     ldw x,(1,x)
      009CC5 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009CC6 84               [ 1] 2207 	pop a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      009CC6 3B               [ 1] 2208 	xor a,(x)
      009CC7 00               [ 1] 2209 	ld (x),a 
      009CC8 0B               [ 4] 2210 	ret 
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
      0021E6                       2223 bit_test:
      009CC9 AE 9F 23         [ 4] 2224 	call func_args 
      009CCC CD 8A            [ 1] 2225 	cp a,#2
      009CCE 1D CE            [ 1] 2226 	jreq 0$
      009CD0 00 1C 35         [ 2] 2227 	jp syntax_error
      0021F0                       2228 0$:	
      0021F0                       2229 	_xpop 
      009CD3 10 00            [ 1]    1     ld a,(y)
      009CD5 0B               [ 1]    2     ldw x,y 
      009CD6 CD 98            [ 2]    3     ldw x,(1,x)
      009CD8 7F 32 00 0B      [ 2]    4     addw y,#CELL_SIZE 
      009CDC AE               [ 1] 2230 	ld a,xl 
      009CDD 9F 35            [ 1] 2231 	and a,#7
      009CDF CD               [ 1] 2232 	push a   
      009CE0 8A 1D            [ 1] 2233 	ld a,#1 
      009CE2 CE 00            [ 1] 2234 1$: tnz (1,sp)
      009CE4 1E 72            [ 1] 2235 	jreq 2$
      009CE6 B0               [ 1] 2236 	sll a 
      009CE7 00 1C            [ 1] 2237 	dec (1,sp)
      009CE9 CD 98            [ 2] 2238 	jra 1$
      009CEB 7F AE            [ 1] 2239 2$: ld (1,sp),a  
      00220A                       2240 	_xpop ; address  
      009CED 9F 46            [ 1]    1     ld a,(y)
      009CEF CD               [ 1]    2     ldw x,y 
      009CF0 8A 1D            [ 2]    3     ldw x,(1,x)
      009CF2 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009CF3 84               [ 1] 2241 	pop a 
      009CF3 CD               [ 1] 2242 	and a,(x)
      009CF4 9C AA            [ 1] 2243 	jreq 3$
      009CF6 A6 03            [ 1] 2244 	ld a,#1 
      009CF8 42               [ 1] 2245 3$:	clrw x 
      009CF9 CF               [ 1] 2246 	ld xl,a
      009CFA 00               [ 1] 2247 	clr a  
      009CFB 21               [ 4] 2248 	ret
                                   2249 
                                   2250 ;--------------------
                                   2251 ; BASIC: POKE addr,byte
                                   2252 ; put a byte at addr 
                                   2253 ;--------------------
      00221D                       2254 poke:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      009CFC 4F 81 68         [ 4] 2255 	call arg_list 
      009CFE A1 02            [ 1] 2256 	cp a,#2
      009CFE CD 98            [ 1] 2257 	jreq 1$
      009D00 2A A1 85         [ 2] 2258 	jp syntax_error
      002227                       2259 1$:	
      002227                       2260 	_xpop ; byte   
      009D03 27 0C            [ 1]    1     ld a,(y)
      009D05 A1               [ 1]    2     ldw x,y 
      009D06 05 27            [ 2]    3     ldw x,(1,x)
      009D08 03 CC 97 29      [ 2]    4     addw y,#CELL_SIZE 
      009D0C 9F               [ 1] 2261     ld a,xl 
      009D0C CD               [ 1] 2262 	push a 
      002232                       2263 	_xpop ; address 
      009D0D 9A 04            [ 1]    1     ld a,(y)
      009D0F 20               [ 1]    2     ldw x,y 
      009D10 03 01            [ 2]    3     ldw x,(1,x)
      009D11 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D11 CD               [ 1] 2264 	pop a 
      009D12 98               [ 1] 2265 	ld (x),a 
      009D13 5F               [ 4] 2266 	ret 
                                   2267 
                                   2268 ;-----------------------
                                   2269 ; BASIC: PEEK(addr)
                                   2270 ; get the byte at addr 
                                   2271 ; input:
                                   2272 ;	none 
                                   2273 ; output:
                                   2274 ;	X 		value 
                                   2275 ;-----------------------
      009D14                       2276 peek:
      009D14 CF 00 1A         [ 4] 2277 	call func_args
      009D17 CD 98            [ 1] 2278 	cp a,#1 
      009D19 2A A1            [ 1] 2279 	jreq 1$
      009D1B 32 27 03         [ 2] 2280 	jp syntax_error
      002248                       2281 1$: _xpop ; address  
      009D1E CC 97            [ 1]    1     ld a,(y)
      009D20 29               [ 1]    2     ldw x,y 
      009D21 EE 01            [ 2]    3     ldw x,(1,x)
      009D21 CD 9C 2C A1      [ 2]    4     addw y,#CELL_SIZE 
      009D25 84 27 03         [ 1] 2282 	ld farptr,a 
      009D28 CC 97 29         [ 2] 2283 	ldw ptr16,x 
      009D2B 92 BC 00 18      [ 5] 2284 	ldf a,[farptr]
      009D2B 90               [ 1] 2285 	clrw x 
      009D2C F6               [ 1] 2286 	ld xl,a 
      009D2D 93               [ 1] 2287 	clr a 
      009D2E EE               [ 4] 2288 	ret 
                                   2289 
                                   2290 ;---------------------------
                                   2291 ; BASIC IF expr : instructions
                                   2292 ; evaluate expr and if true 
                                   2293 ; execute instructions on same line. 
                                   2294 ;----------------------------
      00225F                       2295 if: 
      009D2F 01 72 A9         [ 4] 2296 	call condition  
      002262                       2297 	_xpop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      009D32 00 03            [ 1]    1     ld a,(y)
      009D34 93               [ 1]    2     ldw x,y 
      009D34 72 C7            [ 2]    3     ldw x,(1,x)
      009D36 00 1A 72 5C      [ 2]    4     addw y,#CELL_SIZE 
      009D3A 00               [ 1] 2298 	tnz  a  
      009D3B 1B 72            [ 1] 2299 	jrne 9$ 
                                   2300 ;skip to next line
      009D3D CF 00 1A 81 01   [ 1] 2301 	mov in,count
      009D41                       2302 	_drop 2 
      009D41 F6 A0            [ 2]    1     addw sp,#2 
      009D43 03 88 4B         [ 2] 2303 	jp next_line
      009D46 00               [ 4] 2304 9$:	ret 
                                   2305 
                                   2306 ;------------------------
                                   2307 ; BASIC: FOR var=expr 
                                   2308 ; set variable to expression 
                                   2309 ; leave variable address 
                                   2310 ; on stack and set
                                   2311 ; FLOOP bit in 'flags'
                                   2312 ;-----------------
                           000001  2313 	RETL1=1 ; return address  
                           000003  2314 	FSTEP=3  ; variable increment int24
                           000006  2315 	LIMIT=6 ; loop limit, int24  
                           000009  2316 	CVAR=9   ; control variable 
                           00000B  2317 	INW=11   ;  in.w saved
                           00000D  2318 	BPTR=13 ; baseptr saved
                           00000D  2319 	VSIZE=13  
      002279                       2320 for: ; { -- var_addr }
      009D47 72               [ 2] 2321 	popw x ; call return address 
      00227A                       2322 	_vars VSIZE 
      009D48 FB 01            [ 2]    1     sub sp,#VSIZE 
      009D4A F6               [ 2] 2323 	pushw x  ; RETL1 
      009D4B EE 01            [ 1] 2324 	ld a,#TK_VAR 
      009D4D 5B 02 81         [ 4] 2325 	call expect
      009D50 CD 17 DF         [ 4] 2326 	call get_addr
      009D50 90 89            [ 2] 2327 	ldw (CVAR,sp),x  ; control variable 
      009D52 52 04 5F         [ 4] 2328 	call let_eval 
      009D55 1F 01 90 AE      [ 1] 2329 	bset flags,#FLOOP 
      009D59 40 00 90         [ 4] 2330 	call next_token 
      009D5C C3 00            [ 1] 2331 	cp a,#TK_CMD 
      009D5E 25 24            [ 1] 2332 	jreq 1$
      009D60 35 17 03         [ 2] 2333 	jp syntax_error
      002298                       2334 1$:  
      009D63 93 5C CD         [ 4] 2335 	call get_code_addr
      009D66 8A 1D A6         [ 2] 2336 	cpw x,#to   
      009D69 3D CD            [ 1] 2337 	jreq to
      009D6B 89 C0 1E         [ 2] 2338 	jp syntax_error 
                                   2339 
                                   2340 ;-----------------------------------
                                   2341 ; BASIC: TO expr 
                                   2342 ; second part of FOR loop initilization
                                   2343 ; leave limit on stack and set 
                                   2344 ; FTO bit in 'flags'
                                   2345 ;-----------------------------------
      0022A3                       2346 to: ; { var_addr -- var_addr limit step }
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      009D6E 03 CD 9D 41 C7   [ 2] 2347 	btjt flags,#FLOOP,1$
      009D73 00 0D CF         [ 2] 2348 	jp syntax_error
      009D76 00 0E CD         [ 4] 2349 1$: call expression   
      009D79 98 96            [ 1] 2350 	cp a,#TK_INTGR 
      009D7B A6 0D            [ 1] 2351 	jreq 2$ 
      009D7D CD 89 C0         [ 2] 2352 	jp syntax_error
      0022B5                       2353 2$: _xpop
      009D80 1E 01            [ 1]    1     ld a,(y)
      009D82 5C               [ 1]    2     ldw x,y 
      009D83 1F 01            [ 2]    3     ldw x,(1,x)
      009D85 72 5F 00 0E      [ 2]    4     addw y,#CELL_SIZE 
      009D89 16 03            [ 1] 2354 	ld (LIMIT,sp),a 
      009D8B 90 F6            [ 2] 2355 	ldw (LIMIT+1,sp),x
      009D8D C7 00 0F         [ 4] 2356 	call next_token
      009D90 72 B9            [ 1] 2357 	cp a,#TK_NONE  
      009D92 00 0E            [ 1] 2358 	jreq 4$ 
      009D94 20 C5            [ 1] 2359 	cp a,#TK_CMD
      009D96 26 08            [ 1] 2360 	jrne 3$
      009D96 1E 01 CD         [ 4] 2361 	call get_code_addr
      009D99 98 7F AE         [ 2] 2362 	cpw x,#step 
      009D9C 9D A6            [ 1] 2363 	jreq step
      0022D5                       2364 3$:	
      0022D5                       2365 	_unget_token   	 
      009D9E CD 8A 1D 5B 04   [ 1]    1      mov in,in.saved  
      0022DA                       2366 4$:	
      009DA3 90 85            [ 1] 2367 	clr (FSTEP,sp) 
      009DA5 81 20 63         [ 2] 2368 	ldw x,#1   ; default step  
      009DA8 6F 6E            [ 2] 2369 	ldw (FSTEP+1,sp),x 
      009DAA 73 74            [ 2] 2370 	jra store_loop_addr 
                                   2371 
                                   2372 
                                   2373 ;----------------------------------
                                   2374 ; BASIC: STEP expr 
                                   2375 ; optional third par of FOR loop
                                   2376 ; initialization. 	
                                   2377 ;------------------------------------
      0022E3                       2378 step: ; {var limit -- var limit step}
      009DAC 61 6E 74 73 20   [ 2] 2379 	btjt flags,#FLOOP,1$
      009DB1 69 6E 20         [ 2] 2380 	jp syntax_error
      009DB4 45 45 50         [ 4] 2381 1$: call expression 
      009DB7 52 4F            [ 1] 2382 	cp a,#TK_INTGR
      009DB9 4D 0A            [ 1] 2383 	jreq 2$
      009DBB 00 16 A9         [ 2] 2384 	jp syntax_error
      009DBC                       2385 2$:	
      0022F5                       2386 	_xpop 
      009DBC AE 40            [ 1]    1     ld a,(y)
      009DBE 00               [ 1]    2     ldw x,y 
      009DBF 35 08            [ 2]    3     ldw x,(1,x)
      009DC1 00 0F A3 47      [ 2]    4     addw y,#CELL_SIZE 
      009DC5 F8 24            [ 1] 2387 	ld (FSTEP,sp),a 
      009DC7 17 F6            [ 2] 2388 	ldw (FSTEP+1,sp),x ; step
                                   2389 ; if step < 0 decrement LIMIT 
      009DC9 26               [ 1] 2390 	tnz a
      009DCA 0C 5C            [ 1] 2391 	jrpl store_loop_addr 
      009DCC 72 5A            [ 1] 2392 	ld a,(LIMIT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      009DCE 00 0F            [ 2] 2393 	ldw x,(LIMIT+1,sp)
      009DD0 26 F6 1D         [ 2] 2394 	subw x,#1 
      009DD3 00 08            [ 1] 2395 	sbc a,#0 
      009DD5 20 09            [ 1] 2396 	ld (LIMIT,sp),a 
      009DD7 F6 5C            [ 2] 2397 	ldw (LIMIT+1,sp),x 
                                   2398 ; leave loop back entry point on cstack 
                                   2399 ; cstack is 1 call deep from interpreter
      002312                       2400 store_loop_addr:
      009DD9 4D 26 FB         [ 2] 2401 	ldw x,basicptr
      009DDC 5A 20            [ 2] 2402 	ldw (BPTR,sp),x 
      009DDE E0 5F 4F         [ 2] 2403 	ldw x,in.w 
      009DE1 CF 00            [ 2] 2404 	ldw (INW,sp),x   
      009DE3 25 81 00 22      [ 1] 2405 	bres flags,#FLOOP 
      009DE5 72 5C 00 1F      [ 1] 2406 	inc loop_depth  
      009DE5 90               [ 4] 2407 	ret 
                                   2408 
                                   2409 ;--------------------------------
                                   2410 ; BASIC: NEXT var 
                                   2411 ; FOR loop control 
                                   2412 ; increment variable with step 
                                   2413 ; and compare with limit 
                                   2414 ; loop if threshold not crossed.
                                   2415 ; else stack. 
                                   2416 ; and decrement 'loop_depth' 
                                   2417 ;--------------------------------
      002325                       2418 next: ; {var limit step retl1 -- [var limit step ] }
      009DE6 89 52 05 72      [ 1] 2419 	tnz loop_depth 
      009DEA 5F 00            [ 1] 2420 	jrne 1$ 
      009DEC 0E CD 94         [ 2] 2421 	jp syntax_error 
      00232E                       2422 1$: 
      009DEF 6D AB            [ 1] 2423 	ld a,#TK_VAR 
      009DF1 05 6B 05         [ 4] 2424 	call expect
      009DF4 1F 01 90         [ 4] 2425 	call get_addr 
                                   2426 ; check for good variable after NEXT 	 
      009DF7 AE 40            [ 2] 2427 	cpw x,(CVAR,sp)
      009DF9 00 1E            [ 1] 2428 	jreq 2$  
      009DFB 01 17 03         [ 2] 2429 	jp syntax_error ; not the good one 
      00233D                       2430 2$: 
      009DFE 90 C3 00         [ 2] 2431 	ldw ptr16,x 
                                   2432 	; increment variable 
      009E01 25               [ 1] 2433 	ld a,(x)
      009E02 24 1A            [ 2] 2434 	ldw x,(1,x)  ; get var value 
      009E04 90 F6 11         [ 2] 2435 	addw x,(FSTEP+1,sp) ; var+step 
      009E07 05 26            [ 1] 2436 	adc a,(FSTEP,sp)
      009E09 07 90 5C CD      [ 4] 2437 	ld [ptr16],a
      009E0D 94 78 26 11      [ 1] 2438 	inc ptr8  
      009E11 72 CF 00 19      [ 5] 2439 	ldw [ptr16],x 
      009E11 16 03 90         [ 1] 2440 	ld acc24,a 
      009E14 F6 C7 00         [ 2] 2441 	ldw acc16,x 
      009E17 0F 72            [ 1] 2442 	ld a,(LIMIT,sp)
      009E19 B9 00            [ 2] 2443 	ldw x,(LIMIT+1,sp)
      009E1B 0E 20 DC 0D      [ 2] 2444 	subw x,acc16 
      009E1E C2 00 0C         [ 1] 2445 	sbc a,acc24
      009E1E 0F 03            [ 1] 2446 	xor a,(FSTEP,sp)
      009E20 0F 04            [ 1] 2447 	xor a,#0x80
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      009E22 2B 12            [ 1] 2448 	jrmi loop_back  
      009E22 1E 03            [ 2] 2449 	jra loop_done   
                                   2450 ; check sign of STEP  
      009E24 5B 05            [ 1] 2451 	ld a,(FSTEP,sp)
      009E26 90 85            [ 1] 2452 	jrpl 4$
                                   2453 ;negative step
      009E28 81 00 0E         [ 1] 2454     ld a,acc8 
      009E29 2F 07            [ 1] 2455 	jrslt loop_back   
      009E29 90 89            [ 2] 2456 	jra loop_done  
      002378                       2457 4$: ; positive step
      009E2B 52 08 0F 06 CD   [ 2] 2458 	btjt acc8,#7,loop_done 
      00237D                       2459 loop_back:
      009E30 98 2A            [ 2] 2460 	ldw x,(BPTR,sp)
      009E32 A1 04 26         [ 2] 2461 	ldw basicptr,x 
      009E35 0D CD 98 79 A4   [ 2] 2462 	btjf flags,#FRUN,1$ 
      009E3A DF A1            [ 1] 2463 	ld a,(2,x)
      009E3C 55 26 08         [ 1] 2464 	ld count,a
      009E3F 03 06            [ 2] 2465 1$:	ldw x,(INW,sp)
      009E41 20 07 A1         [ 2] 2466 	ldw in.w,x 
      009E44 03               [ 4] 2467 	ret 
      002392                       2468 loop_done:
                                   2469 	; remove loop data from stack  
      009E45 27               [ 2] 2470 	popw x
      002393                       2471 	_drop VSIZE 
      009E46 08 CC            [ 2]    1     addw sp,#VSIZE 
      009E48 97 29 00 1F      [ 1] 2472 	dec loop_depth 
      009E4A FC               [ 2] 2473 	jp (x)
                                   2474 
                                   2475 ;----------------------------
                                   2476 ; called by goto/gosub
                                   2477 ; to get target line number 
                                   2478 ; output:
                                   2479 ;    x    line address 
                                   2480 ;---------------------------
      00239A                       2481 get_target_line:
      009E4A A6 03 CD         [ 4] 2482 	call next_token  
      009E4D 99 D6            [ 1] 2483 	cp a,#TK_INTGR
      009E4F 27 07            [ 1] 2484 	jreq get_target_line_addr 
      009E4F 1F 01            [ 1] 2485 	cp a,#TK_LABEL 
      009E51 CD 98            [ 1] 2486 	jreq look_target_symbol 
      009E53 50 1E 01         [ 2] 2487 	jp syntax_error
                                   2488 ; the target is a line number 
                                   2489 ; search it. 
      0023A8                       2490 get_target_line_addr:
      009E56 CD 94            [ 2] 2491 	pushw y 
      009E58 6D AB 05         [ 4] 2492 	call get_int24 ; line # 
      009E5B 6B               [ 1] 2493 	clr a
      009E5C 05 16 01 AE      [ 2] 2494 	ldw y,basicptr 
      009E60 16 68            [ 2] 2495 	ldw y,(y)
      009E62 7B 05            [ 2] 2496 	pushw y 
      009E64 F7 5C            [ 2] 2497 	cpw x,(1,sp)
      0023B8                       2498 	_drop 2  
      009E66 CD 94            [ 2]    1     addw sp,#2 
      009E68 89 1F            [ 1] 2499 	jrult 11$
      009E6A 03               [ 1] 2500 	inc a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      0023BD                       2501 11$: ; scan program for this line# 	
      009E6B 5F 7B 05         [ 4] 2502 	call search_lineno  
      009E6E A0               [ 2] 2503 	tnzw x ; 0| line# address 
      009E6F 04 97            [ 1] 2504 	jrne 2$ 
      009E71 72 FB            [ 1] 2505 	ld a,#ERR_NO_LINE 
      009E73 03 1F 03         [ 2] 2506 	jp tb_error 
      009E76 A6 32            [ 2] 2507 2$:	popw y  
      009E78 CD               [ 4] 2508 	ret 
                                   2509 
                                   2510 ; the GOTO|GOSUB target is a symbol.
                                   2511 ; output:
                                   2512 ;    X    line address|0 
      0023CB                       2513 look_target_symbol:
      009E79 99 D6            [ 2] 2514 	pushw y 
      009E7B 16               [ 2] 2515 	pushw x 
      009E7C 07 CD 9B 13      [ 1] 2516 	clr acc16 
      009E80 A1 84 27 03      [ 2] 2517 	ldw y,txtbgn 
      009E84 CC 97 29         [ 1] 2518 1$:	ld a,(3,y) ; first TK_ID on line 
      009E87 90 F6            [ 1] 2519 	cp a,#TK_LABEL 
      009E89 93 EE            [ 1] 2520 	jreq 3$ 
      009E8B 01 72 A9         [ 1] 2521 2$:	ld a,(2,y); line length 
      009E8E 00 03 17         [ 1] 2522 	ld acc8,a 
      009E91 07 16 03 90      [ 2] 2523 	addw y,acc16 ;point to next line 
      009E95 F7 90 EF 01      [ 2] 2524 	cpw y,txtend 
      009E99 72 5F            [ 1] 2525 	jrult 1$
      009E9B 00 19            [ 1] 2526 	ld a,#ERR_BAD_VALUE
      009E9D 1E 01 CD         [ 2] 2527 	jp tb_error 
      0023F2                       2528 3$: ; found a TK_LABEL 
                                   2529 	; compare with GOTO|GOSUB target 
      009EA0 9D E5            [ 2] 2530 	pushw y ; line address 
      009EA2 5D 27 06 0D      [ 2] 2531 	addw y,#4 ; label string 
      009EA6 06 27            [ 2] 2532 	ldw x,(3,sp) ; target string 
      009EA8 1F 20 03         [ 4] 2533 	call strcmp
      009EAB 26 04            [ 1] 2534 	jrne 4$
      009EAB CE 00            [ 2] 2535 	popw y 
      009EAD 25 DA            [ 2] 2536 	jra 2$ 
      009EAE                       2537 4$: ; target found 
      009EAE CF               [ 2] 2538 	popw x ;  address line target  
      002404                       2539 	_drop 2 ; target string 
      009EAF 00 1A            [ 2]    1     addw sp,#2 
      009EB1 AE 16            [ 2] 2540 	popw y 
      009EB3 68               [ 4] 2541 	ret
                                   2542 
                                   2543 
                                   2544 ;--------------------------------
                                   2545 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2546 ; selective goto or gosub 
                                   2547 ;--------------------------------
      002409                       2548 cmd_on:
      009EB4 7B 05 CD 89 01   [ 2] 2549 	btjt flags,#FRUN,0$ 
      009EB9 0D 06            [ 1] 2550 	ld a,#ERR_RUN_ONLY
      009EBB 26 0B 5F         [ 2] 2551 	jp tb_error 
      009EBE 7B 05 97         [ 4] 2552 0$:	call expression 
      009EC1 72 BB            [ 1] 2553 	cp a,#TK_INTGR
      009EC3 00 25            [ 1] 2554 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      009EC5 CF 00 25         [ 2] 2555 	jp syntax_error
      009EC8                       2556 1$: _xpop
      009EC8 CD 98            [ 1]    1     ld a,(y)
      009ECA 2A               [ 1]    2     ldw x,y 
      009ECB A1 08            [ 2]    3     ldw x,(1,x)
      009ECD 26 03 CC 9E      [ 2]    4     addw y,#CELL_SIZE 
                                   2557 ; the selector is the element indice 
                                   2558 ; in the list of arguments. {1..#elements} 
      009ED1 4A               [ 1] 2559 	ld a,xl ; keep only bits 7..0
      009ED2 27 62            [ 1] 2560 	jreq 9$ ; element # begin at 1. 
      009ED2 55               [ 1] 2561 	push a  ; selector  
      009ED3 00 03 00         [ 4] 2562 	call next_token
      009ED6 02 80            [ 1] 2563 	cp a,#TK_CMD 
      009ED7 27 03            [ 1] 2564 	jreq 2$ 
      009ED7 5B 08 90         [ 2] 2565 	jp syntax_error 
      009EDA 85 81 C3         [ 4] 2566 2$: call get_code_addr
                                   2567 ;; must be a GOTO or GOSUB 
      009EDC A3 24 95         [ 2] 2568 	cpw x,#goto 
      009EDC CE 00            [ 1] 2569 	jreq 4$
      009EDE 1E 72 B0         [ 2] 2570 	cpw x,#gosub 
      009EE1 00 1C            [ 1] 2571 	jreq 4$ 
      009EE3 81 16 A9         [ 2] 2572 	jp syntax_error 
      009EE4                       2573 4$: 
      009EE4 AE               [ 1] 2574 	pop a 
      009EE5 9F               [ 2] 2575 	pushw x ; save routine address 	
      009EE6 23               [ 1] 2576 	push a  ; selector  
      002447                       2577 5$: ; skip elements in list until selector==0 
      009EE7 CD 8A            [ 1] 2578 	dec (1,sp)
      009EE9 1D CE            [ 1] 2579 	jreq 6$ 
                                   2580 ; can be a line# or a label 
      009EEB 00 1C 35         [ 4] 2581 	call next_token 
      009EEE 10 00            [ 1] 2582 	cp a,#TK_INTGR 
      009EF0 0B CD            [ 1] 2583 	jreq 52$
      009EF2 98 7F            [ 1] 2584 	cp a,#TK_LABEL 
      009EF4 35 0A            [ 1] 2585 	jreq 54$
      009EF6 00 0B AE         [ 2] 2586 	jp syntax_error 
      002459                       2587 52$: ; got a line number 
      009EF9 9F 35 CD         [ 1] 2588 	ld a,in ; skip over int24 value 
      009EFC 8A 1D            [ 1] 2589 	add a,#CELL_SIZE ; integer size  
      009EFE CD 9E DC         [ 1] 2590 	ld in,a 
      009F01 CD 98            [ 2] 2591 	jra 56$
      009F03 7F AE 9F         [ 4] 2592 54$: call skip_string ; skip over label 	
      002466                       2593 56$: ; if another element comma present 
      009F06 46 CD 8A         [ 4] 2594 	call next_token
      009F09 1D CE            [ 1] 2595 	cp a,#TK_COMMA 
      009F0B 00 1C            [ 1] 2596 	jreq 5$ 
                                   2597 ; arg list exhausted, selector to big 
                                   2598 ; continue execution on next line 
      00246D                       2599 	_drop 3 ; drop selector and GOTO|GOSUB address 
      009F0D A3 B6            [ 2]    1     addw sp,#3 
      009F0F 84 25            [ 2] 2600 	jra 9$
      002471                       2601 6$: ;at selected position  
      002471                       2602 	_drop 1 ; discard selector
      009F11 05 AE            [ 2]    1     addw sp,#1 
                                   2603 ; here only the routine address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



                                   2604 ; of GOTO|GOSUB is on stack 
      009F13 9F 4D 20         [ 4] 2605     call get_target_line
      009F16 03 AE 9F         [ 2] 2606 	ldw ptr16,x 	
      009F19 5E CD 8A 1D A6   [ 1] 2607 	mov in,count ; move to end of line  
      009F1E 0D               [ 2] 2608 	popw x ; cmd address, GOTO||GOSUB 
      009F1F CD 89 C0         [ 2] 2609 	cpw x,#goto 
      009F22 81 70            [ 1] 2610 	jrne 7$ 
      009F24 72 6F 67         [ 2] 2611 	ldw x,ptr16 
      009F27 72 61            [ 2] 2612 	jra jp_to_target
      002489                       2613 7$: 
      009F29 6D 20            [ 2] 2614 	jra gosub_2 ; target in ptr16 
      00248B                       2615 9$: ; expr out of range skip to end of line
                                   2616     ; this will force a fall to next line  
      009F2B 61 64 64 72 65   [ 1] 2617 	mov in,count
      002490                       2618 	_drop 2
      009F30 73 73            [ 2]    1     addw sp,#2 
      009F32 3A 20 00         [ 2] 2619 	jp next_line  
                                   2620 
                                   2621 
                                   2622 ;------------------------
                                   2623 ; BASIC: GOTO line# 
                                   2624 ; jump to line# 
                                   2625 ; here cstack is 2 call deep from interpreter 
                                   2626 ;------------------------
      002495                       2627 goto:
      009F35 2C 20 70 72 6F   [ 2] 2628 	btjt flags,#FRUN,goto_1  
      009F3A 67 72            [ 1] 2629 	ld a,#ERR_RUN_ONLY
      009F3C 61 6D 20         [ 2] 2630 	jp tb_error 
      00249F                       2631 goto_1:
      009F3F 73 69 7A         [ 4] 2632 	call get_target_line
      0024A2                       2633 jp_to_target:
      009F42 65 3A 20         [ 2] 2634 	ldw basicptr,x 
      009F45 00 20            [ 1] 2635 	ld a,(2,x)
      009F47 62 79 74         [ 1] 2636 	ld count,a 
      009F4A 65 73 00 20      [ 1] 2637 	mov in,#3 
      009F4E 69               [ 4] 2638 	ret 
                                   2639 
                                   2640 
                                   2641 ;--------------------
                                   2642 ; BASIC: GOSUB line#
                                   2643 ; basic subroutine call
                                   2644 ; actual line# and basicptr 
                                   2645 ; are saved on cstack
                                   2646 ; here cstack is 2 call deep from interpreter 
                                   2647 ;--------------------
                           000001  2648 	TARGET=1   ; target address 
                           000003  2649 	RET_ADDR=3 ; subroutine return address 
                           000005  2650 	RET_BPTR=5 ; basicptr return point 
                           000007  2651 	RET_INW=7  ; in.w return point 
                           000004  2652 	VSIZE=4  
      0024AF                       2653 gosub:
      009F4F 6E 20 46 4C 41   [ 2] 2654 	btjt flags,#FRUN,gosub_1 
      009F54 53 48            [ 1] 2655 	ld a,#ERR_RUN_ONLY
      009F56 20 6D 65         [ 2] 2656 	jp tb_error 
      009F59 6D               [ 4] 2657 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      0024BA                       2658 gosub_1:
      009F5A 6F 72 79         [ 4] 2659 	call get_target_line 
      009F5D 00 20 69         [ 2] 2660 	ldw ptr16,x 
      0024C0                       2661 gosub_2: 
      009F60 6E               [ 2] 2662 	popw x 
      0024C1                       2663 	_vars VSIZE  
      009F61 20 52            [ 2]    1     sub sp,#VSIZE 
      009F63 41               [ 2] 2664 	pushw x ; RET_ADDR 
      009F64 4D 20 6D         [ 2] 2665 	ldw x,ptr16 
      009F67 65               [ 2] 2666 	pushw x ; TARGET
                                   2667 ; save BASIC subroutine return point.   
      009F68 6D 6F 72         [ 2] 2668 	ldw x,basicptr
      009F6B 79 00            [ 2] 2669 	ldw (RET_BPTR,sp),x 
      009F6D CE 00 00         [ 2] 2670 	ldw x,in.w 
      009F6D 72 01            [ 2] 2671 	ldw (RET_INW,sp),x
      009F6F 00               [ 2] 2672 	popw x 
      009F70 23 05            [ 2] 2673 	jra jp_to_target
                                   2674 
                                   2675 ;------------------------
                                   2676 ; BASIC: RETURN 
                                   2677 ; exit from BASIC subroutine 
                                   2678 ;------------------------
                           000003  2679 	RET_BPTR=3 ; basicptr return point 
                           000005  2680 	RET_INW=5  ; in.w return point 
                           000004  2681 	VSIZE=4  
      0024D5                       2682 return:
      009F72 A6 07 CC 97 2B   [ 2] 2683 	btjt flags,#FRUN,0$ 
      009F77 A6 06            [ 1] 2684 	ld a,#ERR_RUN_ONLY
      009F77 CD 98 2A         [ 2] 2685 	jp tb_error 
      0024DF                       2686 0$:	
      009F7A A1 04            [ 2] 2687 	ldw x,(RET_ADDR,sp) 
      009F7C 26 10 CD         [ 2] 2688 	ldw basicptr,x
      009F7F 98 79            [ 1] 2689 	ld a,(2,x)
      009F81 A4 DF A1         [ 1] 2690 	ld count,a  
      009F84 43 26            [ 2] 2691 	ldw x,(RET_INW,sp)
      009F86 04 CD 9D         [ 2] 2692 	ldw in.w,x 
      009F89 50               [ 2] 2693 	popw x 
      0024EF                       2694 	_drop VSIZE 
      009F8A 81 CC            [ 2]    1     addw sp,#VSIZE 
      009F8C 97               [ 2] 2695 	pushw x
      009F8D 29               [ 4] 2696 	ret  
                                   2697 
                                   2698 ;----------------------------------
                                   2699 ; BASIC: RUN
                                   2700 ; run BASIC program in RAM
                                   2701 ;----------------------------------- 
      0024F3                       2702 run: 
      009F8E 55 00 03 00 02   [ 2] 2703 	btjf flags,#FRUN,0$  
      009F93 CD               [ 1] 2704 	clr a 
      009F94 9E               [ 4] 2705 	ret
      0024FA                       2706 0$: 
      009F95 DC 22 01 81 52   [ 2] 2707 	btjf flags,#FBREAK,1$
      0024FF                       2708 	_drop 2 
      009F9A 06 CE            [ 2]    1     addw sp,#2 
      009F9C 00 1C 1F         [ 4] 2709 	call rest_context
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      002504                       2710 	_drop CTXT_SIZE 
      009F9F 05 FE            [ 2]    1     addw sp,#CTXT_SIZE 
      009FA1 1F 01 AE 7F      [ 1] 2711 	bres flags,#FBREAK 
      009FA5 FF 1F 03 CD      [ 1] 2712 	bset flags,#FRUN 
      009FA9 99 E8 4D         [ 2] 2713 	jp interpreter 
      009FAC 27 31 A1         [ 2] 2714 1$:	ldw x,txtbgn
      009FAF 02 27 07         [ 2] 2715 	cpw x,txtend 
      009FB2 A1 01            [ 1] 2716 	jrmi run_it 
      009FB4 27 06 CC         [ 2] 2717 	ldw x,#err_no_prog
      009FB7 97 29 85         [ 4] 2718 	call puts 
      009FBA 1F 05 03 00 01   [ 1] 2719 	mov in,count
      009FBC 81               [ 4] 2720 	ret 
      002525                       2721 run_it:	 
      002525                       2722 	_drop 2 ; drop return address 
      009FBC 85 1F            [ 2]    1     addw sp,#2 
      002527                       2723 run_it_02: 
      009FBE 01 1C 73         [ 4] 2724     call ubound 
      009FBF CD 14 5D         [ 4] 2725 	call clear_vars 
                                   2726 ; clear data pointer 
      009FBF CE               [ 1] 2727 	clrw x 
      009FC0 00 1C 1F         [ 2] 2728 	ldw data_ptr,x 
      009FC3 05 C3 00 1E      [ 1] 2729 	clr data_ofs 
      009FC7 2A 38 FE 13      [ 1] 2730 	clr data_len 
                                   2731 ; initialize BASIC pointer 
      009FCB 01 2A 11         [ 2] 2732 	ldw x,txtbgn 
      009FCE 1E 05 E6         [ 2] 2733 	ldw basicptr,x 
      009FD1 02 C7            [ 1] 2734 	ld a,(2,x)
      009FD3 00 0F 72         [ 1] 2735 	ld count,a
      009FD6 5F 00 0E 72      [ 1] 2736 	mov in,#3	
      009FDA BB 00 0E 20      [ 1] 2737 	bset flags,#FRUN 
      009FDE E3 17 54         [ 2] 2738 	jp interpreter 
                                   2739 
                                   2740 
                                   2741 ;----------------------
                                   2742 ; BASIC: END
                                   2743 ; end running program
                                   2744 ;---------------------- 
      009FDF                       2745 cmd_end: 
                                   2746 ; clean stack 
      009FDF 1E 05 E6         [ 2] 2747 	ldw x,#STACK_EMPTY
      009FE2 02               [ 1] 2748 	ldw sp,x 
      009FE3 CD A0 56         [ 2] 2749 	jp warm_start
                                   2750 
                                   2751 ;---------------------------
                                   2752 ; BASIC: GET var 
                                   2753 ; receive a key in variable 
                                   2754 ; don't wait 
                                   2755 ;---------------------------
      002556                       2756 cmd_get:
      009FE6 1E 05 E6         [ 4] 2757 	call next_token 
      009FE9 02 C7            [ 1] 2758 	cp a,#TK_VAR 
      009FEB 00 0F            [ 1] 2759 	jreq 0$
      009FED 72 5F 00         [ 2] 2760 	jp syntax_error 
      009FF0 0E 72 BB         [ 4] 2761 0$: call get_addr 
      009FF3 00 0E C3         [ 2] 2762 	ldw ptr16,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      009FF6 00 1E 2A         [ 4] 2763 	call qgetc 
      009FF9 07 1F            [ 1] 2764 	jreq 2$
      009FFB 05 FE 13         [ 4] 2765 	call getc  
      009FFE 03 2F DE 19      [ 4] 2766 2$: clr [ptr16]
      00A001 72 5C 00 1A      [ 1] 2767 	inc ptr8 
      00A001 55 00 04 00      [ 4] 2768 	clr [ptr16]
      00A005 02 AE 16 B8      [ 1] 2769 	inc ptr8 
      00A009 CF 00 05 5B      [ 4] 2770 	ld [ptr16],a 
      00A00D 06               [ 4] 2771 	ret 
                                   2772 
                                   2773 
                                   2774 ;-----------------
                                   2775 ; 1 Khz beep 
                                   2776 ;-----------------
      002583                       2777 beep_1khz:: 
      00A00E CD 9E            [ 2] 2778 	pushw y 
      00A010 E4 81 64         [ 2] 2779 	ldw x,#100
      00A012 90 AE 03 E8      [ 2] 2780 	ldw y,#1000
      00A012 CD A8            [ 2] 2781 	jra beep
                                   2782 
                                   2783 ;-----------------------
                                   2784 ; BASIC: TONE expr1,expr2
                                   2785 ; used TIMER2 channel 1
                                   2786 ; to produce a tone 
                                   2787 ; arguments:
                                   2788 ;    expr1   frequency 
                                   2789 ;    expr2   duration msec.
                                   2790 ;---------------------------
      00258E                       2791 tone:
      00A014 3E 27            [ 2] 2792 	pushw y 
      00A016 07 AE A0         [ 4] 2793 	call arg_list 
      00A019 3F CD            [ 1] 2794 	cp a,#2 
      00A01B 8A 1D            [ 1] 2795 	jreq 1$
      00A01D 81 16 A9         [ 2] 2796 	jp syntax_error 
      00A01E                       2797 1$: 
      00259A                       2798 	_xpop 
      00A01E 90 AE            [ 1]    1     ld a,(y)
      00A020 B6               [ 1]    2     ldw x,y 
      00A021 80 CE            [ 2]    3     ldw x,(1,x)
      00A023 B6 82 1C 00      [ 2]    4     addw y,#CELL_SIZE 
      00A027 04               [ 2] 2799 	pushw x ; duration 
      0025A4                       2800 	_xpop ; frequency
      00A028 CF 00            [ 1]    1     ld a,(y)
      00A02A 0E               [ 1]    2     ldw x,y 
      00A02B AE 00            [ 2]    3     ldw x,(1,x)
      00A02D 7C CD 94 99      [ 2]    4     addw y,#CELL_SIZE 
      00A031 AE 00            [ 1] 2801 	ldw y,x ; frequency 
      00A033 80               [ 2] 2802 	popw x  ; duration 
      0025B0                       2803 beep:  
      00A034 CF               [ 2] 2804 	pushw x 
      00A035 00 1C 72         [ 2] 2805 	ldw x,#TIM2_CLK_FREQ
      00A038 BB               [ 2] 2806 	divw x,y ; cntr=Fclk/freq 
                                   2807 ; round to nearest integer 
      00A039 00 7E CF 00      [ 2] 2808 	cpw y,#TIM2_CLK_FREQ/2
      00A03D 1E 81            [ 1] 2809 	jrmi 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00A03F 4E               [ 1] 2810 	incw x 
      0025BC                       2811 2$:	 
      00A040 6F               [ 1] 2812 	ld a,xh 
      00A041 20 61 70         [ 1] 2813 	ld TIM2_ARRH,a 
      00A044 70               [ 1] 2814 	ld a,xl 
      00A045 6C 69 63         [ 1] 2815 	ld TIM2_ARRL,a 
                                   2816 ; 50% duty cycle 
      00A048 61               [ 1] 2817 	ccf 
      00A049 74               [ 2] 2818 	rrcw x 
      00A04A 69               [ 1] 2819 	ld a,xh 
      00A04B 6F 6E 20         [ 1] 2820 	ld TIM2_CCR1H,a 
      00A04E 73               [ 1] 2821 	ld a,xl
      00A04F 61 76 65         [ 1] 2822 	ld TIM2_CCR1L,a
      00A052 64 2E 0A 00      [ 1] 2823 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A056 72 10 53 00      [ 1] 2824 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A056 90 89 C7 00      [ 1] 2825 	bset TIM2_EGR,#TIM2_EGR_UG
      00A05A 04               [ 2] 2826 	popw x 
      00A05B E6 02 C1         [ 4] 2827 	call pause02
      00A05E 00 04 2A 03      [ 1] 2828 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A062 C7 00 04 CF      [ 1] 2829 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A066 00 05            [ 2] 2830 	popw y 
      00A068 90               [ 4] 2831 	ret 
                                   2832 
                                   2833 ;-------------------------------
                                   2834 ; BASIC: ADCON 0|1 [,divisor]  
                                   2835 ; disable/enanble ADC 
                                   2836 ;-------------------------------
                           000003  2837 	ONOFF=3 
                           000001  2838 	DIVSOR=1
                           000004  2839 	VSIZE=4 
      0025E9                       2840 power_adc:
      00A069 AE 16 68         [ 4] 2841 	call arg_list 
      00A06C CD 92            [ 1] 2842 	cp a,#2	
      00A06E 83 CD            [ 1] 2843 	jreq 1$
      00A070 8A 1D            [ 1] 2844 	cp a,#1 
      00A072 A6 0D            [ 1] 2845 	jreq 0$ 
      00A074 CD 89 C0         [ 2] 2846 	jp syntax_error 
      00A077 90               [ 1] 2847 0$:	clr a 
      00A078 85               [ 1] 2848 	clrw x
      0025F9                       2849 	_xpush   ; divisor  
      00A079 81 A2 00 03      [ 2]    1     subw y,#CELL_SIZE
      00A07A 90 F7            [ 1]    2     ld (y),a 
      00A07A 52 01 01         [ 2]    3     ldw (1,y),x 
      00A07C                       2850 1$: _at_next 
      00A07C 0F 01 03         [ 1]    1     ld a,(3,y)
      00A07E 93               [ 1]    2     ldw x,y 
      00A07E CD 98            [ 2]    3     ldw x,(4,x)
      00A080 2A               [ 2] 2851 	tnzw x 
      00A081 A1 02            [ 1] 2852 	jreq 2$ 
      00260B                       2853 	_xpop
      00A083 25 08            [ 1]    1     ld a,(y)
      00A085 A1               [ 1]    2     ldw x,y 
      00A086 0A 27            [ 2]    3     ldw x,(1,x)
      00A088 04 A1 80 26      [ 2]    4     addw y,#CELL_SIZE 
      002614                       2854 	_xdrop  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      00A08C 07 A9 00 03      [ 2]    1     addw y,#CELL_SIZE 
      00A08D 9F               [ 1] 2855 	ld a,xl
      00A08D 55 00            [ 1] 2856 	and a,#7
      00A08F 03               [ 1] 2857 	swap a 
      00A090 00 02 20         [ 1] 2858 	ld ADC_CR1,a
      00A093 5D 16 50 CA      [ 1] 2859 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A094 72 10 54 01      [ 1] 2860 	bset ADC_CR1,#ADC_CR1_ADON 
      002627                       2861 	_usec_dly 7 
      00A094 A1 02 27         [ 2]    1     ldw x,#(16*7-2)/4
      00A097 12               [ 2]    2     decw x
      00A098 A1               [ 1]    3     nop 
      00A099 04 27            [ 1]    4     jrne .-4
      00A09B 1B A1            [ 2] 2862 	jra 3$
      00A09D 82 27 1F A1      [ 1] 2863 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A0A1 08 27 24 A1      [ 1] 2864 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      002638                       2865 3$:	
      00A0A5 09               [ 4] 2866 	ret
                                   2867 
                                   2868 ;-----------------------------
                                   2869 ; BASIC: ADCREAD (channel)
                                   2870 ; read adc channel {0..5}
                                   2871 ; output:
                                   2872 ;   A 		TK_INTGR 
                                   2873 ;   X 		value 
                                   2874 ;-----------------------------
      002639                       2875 analog_read:
      00A0A6 27 24 20         [ 4] 2876 	call func_args 
      00A0A9 37 01            [ 1] 2877 	cp a,#1 
      00A0AA 27 03            [ 1] 2878 	jreq 1$
      00A0AA CD 8A 1D         [ 2] 2879 	jp syntax_error
      002643                       2880 1$: _xpop 
      00A0AD 5C 72            [ 1]    1     ld a,(y)
      00A0AF B0               [ 1]    2     ldw x,y 
      00A0B0 00 05            [ 2]    3     ldw x,(1,x)
      00A0B2 CF 00 01 20      [ 2]    4     addw y,#CELL_SIZE 
      00A0B6 C5 00 05         [ 2] 2881 	cpw x,#5 
      00A0B7 23 05            [ 2] 2882 	jrule 2$
      00A0B7 CD 98            [ 1] 2883 	ld a,#ERR_BAD_VALUE
      00A0B9 79 CD 89         [ 2] 2884 	jp tb_error 
      00A0BC C0               [ 1] 2885 2$: ld a,xl
      00A0BD 20 BD 0E         [ 1] 2886 	ld acc8,a 
      00A0BF A6 05            [ 1] 2887 	ld a,#5
      00A0BF CD 98 43         [ 1] 2888 	sub a,acc8 
      00A0C2 FD CD 89         [ 1] 2889 	ld ADC_CSR,a
      00A0C5 C0 20 B4 02      [ 1] 2890 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A0C8 72 10 54 01      [ 1] 2891 	bset ADC_CR1,#ADC_CR1_ADON
      00A0C8 03 01 20 B2 FB   [ 2] 2892 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00A0CC CE 54 04         [ 2] 2893 	ldw x,ADC_DRH
      00A0CC CD 98            [ 1] 2894 	ld a,#TK_INTGR
      00A0CE 2A               [ 4] 2895 	ret 
                                   2896 
                                   2897 ;-----------------------
                                   2898 ; BASIC: DREAD(pin)
                                   2899 ; Arduino pins 
                                   2900 ; read state of a digital pin 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



                                   2901 ; pin# {0..15}
                                   2902 ; output:
                                   2903 ;    A 		TK_INTGR
                                   2904 ;    X      0|1 
                                   2905 ;-------------------------
                           000001  2906 	PINNO=1
                           000001  2907 	VSIZE=1
      002675                       2908 digital_read:
      002675                       2909 	_vars VSIZE 
      00A0CF A1 84            [ 2]    1     sub sp,#VSIZE 
      00A0D1 27 03 CC         [ 4] 2910 	call func_args
      00A0D4 97 29            [ 1] 2911 	cp a,#1
      00A0D6 27 03            [ 1] 2912 	jreq 1$
      00A0D6 CD 98 69         [ 2] 2913 	jp syntax_error
      002681                       2914 1$: _xpop 
      00A0D9 9F A4            [ 1]    1     ld a,(y)
      00A0DB 0F               [ 1]    2     ldw x,y 
      00A0DC C7 00            [ 2]    3     ldw x,(1,x)
      00A0DE 24 20 9B 03      [ 2]    4     addw y,#CELL_SIZE 
      00A0E1 A3 00 0F         [ 2] 2915 	cpw x,#15 
      00A0E1 55 00            [ 2] 2916 	jrule 2$
      00A0E3 03 00            [ 1] 2917 	ld a,#ERR_BAD_VALUE
      00A0E5 02 CD 9C         [ 2] 2918 	jp tb_error 
      00A0E8 2C 4D 27         [ 4] 2919 2$:	call select_pin 
      00A0EB 05 CD            [ 1] 2920 	ld (PINNO,sp),a
      00A0ED 98 A4            [ 1] 2921 	ld a,(GPIO_IDR,x)
      00A0EF 20 8B            [ 1] 2922 	tnz (PINNO,sp)
      00A0F1 27 05            [ 1] 2923 	jreq 8$
      00A0F1 0D               [ 1] 2924 3$: srl a 
      00A0F2 01 26            [ 1] 2925 	dec (PINNO,sp)
      00A0F4 05 A6            [ 1] 2926 	jrne 3$ 
      00A0F6 0D CD            [ 1] 2927 8$: and a,#1 
      00A0F8 89               [ 1] 2928 	clrw x 
      00A0F9 C0               [ 1] 2929 	ld xl,a 
      00A0FA 5B               [ 1] 2930 	clr a 
      0026A9                       2931 	_drop VSIZE
      00A0FB 01 81            [ 2]    1     addw sp,#VSIZE 
      00A0FD 81               [ 4] 2932 	ret
                                   2933 
                                   2934 
                                   2935 ;-----------------------
                                   2936 ; BASIC: DWRITE pin,0|1
                                   2937 ; Arduino pins 
                                   2938 ; write to a digital pin 
                                   2939 ; pin# {0..15}
                                   2940 ; output:
                                   2941 ;    A 		TK_INTGR
                                   2942 ;    X      0|1 
                                   2943 ;-------------------------
                           000001  2944 	PINNO=1
                           000002  2945 	PINVAL=2
                           000002  2946 	VSIZE=2
      0026AC                       2947 digital_write:
      0026AC                       2948 	_vars VSIZE 
      00A0FD CE 00            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00A0FF 05 1F 03         [ 4] 2949 	call arg_list  
      00A102 C6 00            [ 1] 2950 	cp a,#2 
      00A104 02 6B            [ 1] 2951 	jreq 1$
      00A106 05 C6 00         [ 2] 2952 	jp syntax_error
      0026B8                       2953 1$: _xpop 
      00A109 04 6B            [ 1]    1     ld a,(y)
      00A10B 06               [ 1]    2     ldw x,y 
      00A10C 81 01            [ 2]    3     ldw x,(1,x)
      00A10D 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A10D 1E               [ 1] 2954 	ld a,xl 
      00A10E 03 CF            [ 1] 2955 	ld (PINVAL,sp),a
      0026C4                       2956 	_xpop 
      00A110 00 05            [ 1]    1     ld a,(y)
      00A112 7B               [ 1]    2     ldw x,y 
      00A113 05 C7            [ 2]    3     ldw x,(1,x)
      00A115 00 02 7B 06      [ 2]    4     addw y,#CELL_SIZE 
      00A119 C7 00 04         [ 2] 2957 	cpw x,#15 
      00A11C 81 05            [ 2] 2958 	jrule 2$
      00A11D A6 0A            [ 1] 2959 	ld a,#ERR_BAD_VALUE
      00A11D 90 89 52         [ 2] 2960 	jp tb_error 
      00A120 05 2B 72         [ 4] 2961 2$:	call select_pin 
      00A121 6B 01            [ 1] 2962 	ld (PINNO,sp),a 
      00A121 0F 05            [ 1] 2963 	ld a,#1
      00A123 CD 98            [ 1] 2964 	tnz (PINNO,sp)
      00A125 2A A1            [ 1] 2965 	jreq 4$
      00A127 02               [ 1] 2966 3$: sll a
      00A128 26 10            [ 1] 2967 	dec (PINNO,sp)
      00A12A CD 8A            [ 1] 2968 	jrne 3$
      00A12C 1D 5C            [ 1] 2969 4$: tnz (PINVAL,sp)
      00A12E 72 B0            [ 1] 2970 	jrne 5$
      00A130 00               [ 1] 2971 	cpl a 
      00A131 05 CF            [ 1] 2972 	and a,(GPIO_ODR,x)
      00A133 00 01            [ 2] 2973 	jra 8$
      00A135 03 05            [ 1] 2974 5$: or a,(GPIO_ODR,x)
      00A137 CD 98            [ 1] 2975 8$: ld (GPIO_ODR,x),a 
      0026F4                       2976 	_drop VSIZE 
      00A139 2A A1            [ 2]    1     addw sp,#VSIZE 
      00A13B 85               [ 4] 2977 	ret
                                   2978 
                                   2979 
                                   2980 ;-----------------------
                                   2981 ; BASIC: STOP
                                   2982 ; stop progam execution  
                                   2983 ; without resetting pointers 
                                   2984 ; the program is resumed
                                   2985 ; with RUN 
                                   2986 ;-------------------------
      0026F7                       2987 stop:
      00A13C 27 03 CC 97 29   [ 2] 2988 	btjt flags,#FRUN,2$
      00A141 CD               [ 1] 2989 	clr a
      00A142 98               [ 4] 2990 	ret 
      0026FE                       2991 2$:	 
                                   2992 ; create space on cstack to save context 
      00A143 5F CF 00         [ 2] 2993 	ldw x,#break_point 
      00A146 1A 0D 05         [ 4] 2994 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      002704                       2995 	_drop 2 ;drop return address 
      00A149 26 06            [ 2]    1     addw sp,#2 
      002706                       2996 	_vars CTXT_SIZE ; context size 
      00A14B CD 92            [ 2]    1     sub sp,#CTXT_SIZE 
      00A14D 58 CD 89         [ 4] 2997 	call save_context 
      00A150 C0 16 68         [ 2] 2998 	ldw x,#tib 
      00A151 CF 00 04         [ 2] 2999 	ldw basicptr,x
      00A151 A6               [ 1] 3000 	clr (x)
      00A152 3A CD 89 C0      [ 1] 3001 	clr count  
      00A156 CD               [ 1] 3002 	clrw x 
      00A157 A0 FD 72         [ 2] 3003 	ldw in.w,x
      00A15A 5F 00 04 CD      [ 1] 3004 	bres flags,#FRUN 
      00A15E 8B 22 AE 16      [ 1] 3005 	bset flags,#FBREAK
      00A162 68 3B 00         [ 2] 3006 	jp interpreter 
      00A165 04 4B 00 72 FB 01 5C  3007 break_point: .asciz "\nbreak point, RUN to resume.\n"
             5B 02 72 5F 00 02 CD
             8F 97 A1 84 27 14 A1
             11 26 07 CD 8F 97 A1
             84 27
                                   3008 
                                   3009 ;-----------------------
                                   3010 ; BASIC: NEW
                                   3011 ; from command line only 
                                   3012 ; free program memory
                                   3013 ; and clear variables 
                                   3014 ;------------------------
      002743                       3015 new: 
      00A183 06 01 00 22 01   [ 2] 3016 	btjf flags,#FRUN,0$ 
      00A184 81               [ 4] 3017 	ret 
      002749                       3018 0$:	
      00A184 CD A1 0D         [ 4] 3019 	call clear_basic 
      00A187 CC               [ 4] 3020 	ret 
                                   3021 
                                   3022 ;-----------------------------------
                                   3023 ; BASIC: ERASE \E | \F 
                                   3024 ; erase all block in range from 
                                   3025 ;  'app_space' to FLASH end (0x20000)
                                   3026 ;  or all EEPROM 
                                   3027 ; that contains a non zero byte.  
                                   3028 ;-----------------------------------
                           000001  3029 	LIMIT=1 
                           000003  3030 	VSIZE = 3 
      00274D                       3031 erase:
      00A188 97 29 00 18      [ 1] 3032 	clr farptr 
      00A18A                       3033 	_vars VSIZE 
      00A18A CD 82            [ 2]    1     sub sp,#VSIZE 
      00A18C 89 17 AA         [ 4] 3034 	call next_token 
      00A18D A1 04            [ 1] 3035 	cp a,#TK_CHAR 
      00A18D C6 00            [ 1] 3036 	jreq 0$ 
      00A18F 0D CE 00         [ 2] 3037 	jp syntax_error
      00A192 0E 72 C7         [ 4] 3038 0$: call get_char 
      00A195 00 1A            [ 1] 3039 	and a,#0XDF 
      00A197 72 5C            [ 1] 3040 	cp a,#'E
      00A199 00 1B            [ 1] 3041 	jrne 1$
      00A19B 72 CF 00         [ 2] 3042 	ldw x,#EEPROM_BASE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      00A19E 1A CD A1         [ 2] 3043 	ldw farptr+1,x 
      00A1A1 0D CD 98         [ 2] 3044 	ldw x,#EEPROM_END
      00A1A4 2A               [ 1] 3045 	clr a 
      00A1A5 A1 08            [ 2] 3046 	jra 3$ 
      00A1A7 26 03            [ 1] 3047 1$: cp a,#'F 
      00A1A9 CC A1            [ 1] 3048 	jreq 2$
      00A1AB 21 15 E9         [ 2] 3049 	ldw x,#err_bad_value
      00A1AC CC 16 AB         [ 2] 3050 	jp tb_error
      00277C                       3051 2$:
      00A1AC A1 00 27         [ 2] 3052 	ldw x,#app_space  
      00A1AF 07 A1 0A         [ 2] 3053 	ldw farptr+1,x 
      00A1B2 27 03            [ 1] 3054 	ld a,#(FLASH_END>>16)&0XFF 
      00A1B4 CC 97 29         [ 2] 3055 	ldw x,#FLASH_END&0xffff
      00A1B7                       3056 3$:
      00A1B7 5B 05            [ 1] 3057 	ld (LIMIT,sp),a 
      00A1B9 90 85            [ 2] 3058 	ldw (LIMIT+1,sp),x 
                                   3059  ; operation done from RAM
                                   3060  ; copy code to RAM in tib   
      00A1BB 81 07 3E         [ 4] 3061 	call move_erase_to_ram
      00A1BC                       3062 4$:	 
      00A1BC 55 00 04         [ 4] 3063     call scan_block 
      00A1BF 00 02            [ 1] 3064 	jreq 5$  ; block already erased 
      00A1C1 81 45            [ 1] 3065     ld a,#'E 
      00A1C2 CD 09 40         [ 4] 3066     call putc 
      00A1C2 52 04 0F         [ 4] 3067 	call block_erase   
                                   3068 ; this block is clean, next  
      00A1C5 01 CD 99         [ 2] 3069 5$:	ldw x,#BLOCK_SIZE
      00A1C8 E8 A1 02         [ 4] 3070 	call incr_farptr
                                   3071 ; check limit, 24 bit substraction  	
      00A1CB 24 03            [ 1] 3072 	ld a,(LIMIT,sp)
      00A1CD CC 97            [ 2] 3073 	ldw x,(LIMIT+1,sp)
      00A1CF 29 A1 03 25      [ 2] 3074 	subw x,farptr+1
      00A1D3 0C 90 F6         [ 1] 3075 	sbc a,farptr 
      00A1D6 93 EE            [ 1] 3076 	jrugt 4$ 
      00A1D8 01 72 A9         [ 4] 3077 9$: call clear_basic
      00A1DB 00 03            [ 2] 3078 	ldw x,(LIMIT+1,sp)
      00A1DD 9F 6B 01         [ 2] 3079 	cpw x,#EEPROM_END
      00A1E0 90 F6            [ 1] 3080 	jrne 10$
      00A1E2 93 EE 01         [ 4] 3081 	call func_eefree 
      0027BB                       3082 10$:
      0027BB                       3083 	_drop VSIZE 
      00A1E5 72 A9            [ 2]    1     addw sp,#VSIZE 
      00A1E7 00               [ 4] 3084 	ret 
                                   3085 	
                                   3086 
                                   3087 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3088 ;  check for application signature 
                                   3089 ; output:
                                   3090 ;   Carry    0 app present 
                                   3091 ;            1 no app installed  
                                   3092 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027BE                       3093 qsign: 
      00A1E8 03 9F 6B         [ 2] 3094 	ldw x,app_sign 
      00A1EB 02 90 F6         [ 2] 3095 	cpw x,SIGNATURE ; "BC" 
      00A1EE 93               [ 4] 3096 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



                                   3097 
                                   3098 ;--------------------------------------
                                   3099 ;  fill write buffer 
                                   3100 ;  input:
                                   3101 ;    y  point to output buffer 
                                   3102 ;    x  point to source 
                                   3103 ;    a  bytes to write in buffer 
                                   3104 ;  output:
                                   3105 ;    y   += A 
                                   3106 ;    X   += A 
                                   3107 ;    A   0 
                                   3108 ;---------------------------------------
      0027C5                       3109 fill_write_buffer:
      00A1EF EE               [ 1] 3110 	push a 
      00A1F0 01               [ 1] 3111 	tnz a 
      00A1F1 72 A9            [ 1] 3112 	jreq 9$ 
      00A1F3 00               [ 1] 3113 1$: ld a,(x)
      00A1F4 03               [ 1] 3114 	incw x 
      00A1F5 F6 14            [ 1] 3115 	ld (y),a 
      00A1F7 02 18            [ 1] 3116 	incw y 
      00A1F9 01 27            [ 1] 3117 	dec (1,sp) 
      00A1FB F9 5B            [ 1] 3118 	jrne 1$ 
      00A1FD 04               [ 1] 3119 9$:	pop a 
      00A1FE 81               [ 4] 3120     ret 	
                                   3121 
                                   3122 ;--------------------------------------
                                   3123 ;  fill pad buffer with zero 
                                   3124 ;  input:
                                   3125 ;	none 
                                   3126 ;  output:
                                   3127 ;    y     buffer address  
                                   3128 ;--------------------------------------
      00A1FF                       3129 clear_block_buffer:
      00A1FF CD               [ 1] 3130 	push a 
      00A200 99 E8 A1 02      [ 2] 3131 	ldw y,#block_buffer 
      00A204 27 03            [ 2] 3132 	pushw y
      00A206 CC 97            [ 1] 3133 	ld a,#BLOCK_SIZE   
      00A208 29 7F            [ 1] 3134 1$:	clr (y)
      00A209 90 5C            [ 1] 3135 	incw y
      00A209 90               [ 1] 3136 	dec a  
      00A20A F6 93            [ 1] 3137 	jrne 1$ 	
      00A20C EE 01            [ 2] 3138 9$: popw y 
      00A20E 72               [ 1] 3139 	pop a 			
      00A20F A9               [ 4] 3140 	ret 
                                   3141 
                                   3142 
                                   3143 ;---------------------------------------
                                   3144 ; BASIC: SAVE
                                   3145 ; write application from RAM to FLASH
                                   3146 ;--------------------------------------
                           000001  3147 	XTEMP=1
                           000003  3148 	COUNT=3  ; last count bytes written 
                           000004  3149 	CNT_LO=4 ; count low byte 
                           000005  3150 	TOWRITE=5 ; how bytes left to write  
                           000006  3151 	VSIZE=6 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      0027E9                       3152 save_app:
      00A210 00               [ 2] 3153 	pushw x 
      00A211 03 9F            [ 2] 3154 	pushw y 
      0027EC                       3155 	_vars VSIZE
      00A213 88 90            [ 2]    1     sub sp,#VSIZE 
      00A215 F6 93 EE         [ 4] 3156 	call qsign 
      00A218 01 72            [ 1] 3157 	jrne 1$
      00A21A A9 00 03         [ 2] 3158 	ldw x,#CANT_DO 
      00A21D 84 FA F7         [ 4] 3159 	call puts 
      00A220 81 28 78         [ 2] 3160 	jp 9$
      00A221                       3161 1$: 
      00A221 CD 99 E8         [ 2] 3162 	ldw x,txtbgn
      00A224 A1 02 27         [ 2] 3163 	cpw x,txtend 
      00A227 03 CC            [ 1] 3164 	jrult 2$ 
      00A229 97 29 C2         [ 2] 3165 	ldw x,#NO_APP
      00A22B CD 09 9D         [ 4] 3166 	call puts 
      00A22B 90 F6 93         [ 2] 3167 	jp 9$
      00280D                       3168 2$: 
                                   3169 ; block programming flash
                                   3170 ; must be done from RAM
                                   3171 ; moved in tib  
      00A22E EE 01 72         [ 4] 3172 	call move_prg_to_ram
                                   3173 ; initialize farptr 
                                   3174 ; to app_sign address 
      00A231 A9 00 03 9F      [ 1] 3175 	clr farptr 
      00A235 43 88 90         [ 2] 3176 	ldw x,#app_sign 
      00A238 F6 93 EE         [ 2] 3177 	ldw farptr+1,x
                                   3178 ; initialize local variables 
      00A23B 01 72 A9         [ 4] 3179 	call prog_size
      00A23E 00 03            [ 2] 3180 	ldw (TOWRITE,sp),x
      00A240 84 F4            [ 1] 3181 	clr (COUNT,sp)
                                   3182 ; first bock 
                                   3183 ; containt signature 2 bytes 
                                   3184 ; and size 	2 bytes 
                                   3185 ; use Y as pointer to block_buffer
      00A242 F7 81 D5         [ 4] 3186 	call clear_block_buffer ; -- y=*block_buffer	
                                   3187 ; write signature
      00A244 CE 28 7E         [ 2] 3188 	ldw x,SIGNATURE ; "BC" 
      00A244 CD 99            [ 2] 3189 	ldw (y),x 
      00A246 E8 A1 02 27      [ 2] 3190 	addw y,#2
      00A24A 03 CC            [ 2] 3191 	ldw x,(TOWRITE,sp)
      00A24C 97 29            [ 2] 3192 	ldw (y),x
      00A24E 90 F6 93 EE      [ 2] 3193 	addw y,#2   
      00A252 01 72            [ 1] 3194 	ld a,#(BLOCK_SIZE-4)
      00A254 A9 00            [ 1] 3195 	ld (CNT_LO,sp),a 
      00A256 03 9F 88         [ 2] 3196 	cpw x,#(BLOCK_SIZE-4) 
      00A259 90 F6            [ 1] 3197 	jrugt 3$
      00A25B 93               [ 1] 3198 	ld a,xl 
      00A25C EE 01            [ 1] 3199 3$:	ld (CNT_LO,sp),a   
      00A25E 72 A9 00         [ 2] 3200 	ldw x,txtbgn 
      00A261 03 84            [ 2] 3201 	ldw (XTEMP,sp),x 
      002846                       3202 32$: 
      00A263 F8 F7            [ 2] 3203 	ldw x,(XTEMP,sp)
      00A265 81 04            [ 1] 3204 	ld a,(CNT_LO,sp)
      00A266 CD 27 C5         [ 4] 3205 	call fill_write_buffer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00A266 CD 99            [ 2] 3206 	ldw (XTEMP,sp),x 
      00A268 E3 A1 02         [ 2] 3207 	ldw x,#block_buffer
      00A26B 27 03 CC         [ 4] 3208 	call write_buffer
      00A26E 97 29 80         [ 2] 3209 	ldw x,#BLOCK_SIZE 
      00A270 CD 08 B2         [ 4] 3210 	call incr_farptr  
                                   3211 ; following blocks 
      00A270 90 F6            [ 2] 3212 	ldw x,(XTEMP,sp)
      00A272 93 EE 01         [ 2] 3213 	cpw x,txtend 
      00A275 72 A9            [ 1] 3214 	jruge 9$ 
      00A277 00 03            [ 2] 3215 	ldw x,(TOWRITE,sp)
      00A279 9F A4 07         [ 2] 3216 	subw x,(COUNT,sp)
      00A27C 88 A6            [ 2] 3217 	ldw (TOWRITE,sp),x 
      00A27E 01 0D            [ 1] 3218 	ld a,#BLOCK_SIZE 
      00A280 01 27 05         [ 2] 3219 	cpw x,#BLOCK_SIZE 
      00A283 48 0A            [ 1] 3220 	jruge 4$ 
      00A285 01               [ 1] 3221 	ld a,xl 
      00A286 20 F7            [ 1] 3222 4$:	ld (CNT_LO,sp),a 
      00A288 6B 01 90         [ 4] 3223 	call clear_block_buffer 
      00A28B F6 93            [ 2] 3224 	jra 32$ 
      002878                       3225 9$:	_drop VSIZE 
      00A28D EE 01            [ 2]    1     addw sp,#VSIZE 
      00A28F 72 A9            [ 2] 3226     popw y 
      00A291 00               [ 2] 3227 	popw x 
      00A292 03               [ 4] 3228 	ret 
                                   3229 
                                   3230 
      00A293 84 F4                 3231 SIGNATURE: .ascii "BC"
      00A295 27 02 A6 01 5F 97 4F  3232 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE \F before"
             81 61 73 68 20 61 70
             70 6C 69 63 61 74 69
             6F 6E 2C 20 61 6C 72
             65 61 64 79 20 6F 6E
             65 20 69 6E 20 46 4C
             41 53 48 0A 75 73 65
             20 45 52 41 53 45 20
             5C 46 20 62 65 66 6F
             72 65 00
      00A29D 4E 6F 20 61 70 70 6C  3233 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
             20 69 6E 20 52 41 4D
             00
                                   3234 
                                   3235 ;---------------------
                                   3236 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3237 ; write 1 or more byte to FLASH or EEPROM
                                   3238 ; starting at address  
                                   3239 ; input:
                                   3240 ;   expr1  	is address 
                                   3241 ;   expr2,...,exprn   are bytes to write
                                   3242 ; output:
                                   3243 ;   none 
                                   3244 ;---------------------
      0028D8                       3245 write:
      00A29D CD 99 E8         [ 4] 3246 	call expression
      00A2A0 A1 02            [ 1] 3247 	cp a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



      00A2A2 27 03            [ 1] 3248 	jreq 0$
      00A2A4 CC 97 29         [ 2] 3249 	jp syntax_error
      00A2A7                       3250 0$: _xpop 
      00A2A7 90 F6            [ 1]    1     ld a,(y)
      00A2A9 93               [ 1]    2     ldw x,y 
      00A2AA EE 01            [ 2]    3     ldw x,(1,x)
      00A2AC 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A2B0 9F 88 90         [ 1] 3251 	ld farptr,a 
      00A2B3 F6 93 EE         [ 2] 3252 	ldw ptr16,x 
      0028F1                       3253 1$:	
      00A2B6 01 72 A9         [ 4] 3254 	call next_token 
      00A2B9 00 03            [ 1] 3255 	cp a,#TK_COMMA 
      00A2BB 84 F7            [ 1] 3256 	jreq 2$ 
      00A2BD 81 20            [ 2] 3257 	jra 9$ ; no more data 
      00A2BE CD 1A 93         [ 4] 3258 2$:	call expression
      00A2BE CD 99            [ 1] 3259 	cp a,#TK_INTGR
      00A2C0 E3 A1            [ 1] 3260 	jreq 3$
      00A2C2 01 27 03         [ 2] 3261 	jp syntax_error
      002904                       3262 3$:	_xpop 
      00A2C5 CC 97            [ 1]    1     ld a,(y)
      00A2C7 29               [ 1]    2     ldw x,y 
      00A2C8 90 F6            [ 2]    3     ldw x,(1,x)
      00A2CA 93 EE 01 72      [ 2]    4     addw y,#CELL_SIZE 
      00A2CE A9               [ 1] 3263 	ld a,xl 
      00A2CF 00               [ 1] 3264 	clrw x 
      00A2D0 03 C7 00         [ 4] 3265 	call write_byte
      00A2D3 19 CF 00         [ 2] 3266 	ldw x,#1 
      00A2D6 1A 92 BC         [ 4] 3267 	call incr_farptr 
      00A2D9 00 19            [ 2] 3268 	jra 1$ 
      00291A                       3269 9$:
      00A2DB 5F               [ 4] 3270 	ret 
                                   3271 
                                   3272 
                                   3273 ;---------------------
                                   3274 ;BASIC: CHAR(expr)
                                   3275 ; évaluate expression 
                                   3276 ; and take the 7 least 
                                   3277 ; bits as ASCII character
                                   3278 ; output: 
                                   3279 ; 	A char 
                                   3280 ;---------------------
      00291B                       3281 char:
      00A2DC 97 4F 81         [ 4] 3282 	call func_args 
      00A2DF A1 01            [ 1] 3283 	cp a,#1
      00A2DF CD 9C            [ 1] 3284 	jreq 1$
      00A2E1 2C 90 F6         [ 2] 3285 	jp syntax_error
      002925                       3286 1$:	_xpop
      00A2E4 93 EE            [ 1]    1     ld a,(y)
      00A2E6 01               [ 1]    2     ldw x,y 
      00A2E7 72 A9            [ 2]    3     ldw x,(1,x)
      00A2E9 00 03 4D 26      [ 2]    4     addw y,#CELL_SIZE 
      00A2ED 0A               [ 1] 3287 	ld a,xl
      00A2EE 55 00            [ 1] 3288 	and a,#0x7f 
      00A2F0 04               [ 4] 3289 	ret
                                   3290 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



                                   3291 ;---------------------
                                   3292 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3293 ; extract first character 
                                   3294 ; of string argument 
                                   3295 ; output:
                                   3296 ;    A:X    int24 
                                   3297 ;---------------------
      002932                       3298 ascii:
      00A2F1 00 02            [ 1] 3299 	ld a,#TK_LPAREN
      00A2F3 5B 02 CC         [ 4] 3300 	call expect 
      00A2F6 97 DC 81         [ 4] 3301 	call next_token 
      00A2F9 A1 02            [ 1] 3302 	cp a,#TK_QSTR 
      00A2F9 85 52            [ 1] 3303 	jreq 1$
      00A2FB 0D 89            [ 1] 3304 	cp a,#TK_CHAR 
      00A2FD A6 85            [ 1] 3305 	jreq 2$ 
      00A2FF CD 99            [ 1] 3306 	cp a,#TK_CFUNC 
      00A301 D6 CD            [ 1] 3307 	jreq 0$
      00A303 98 5F 1F         [ 2] 3308 	jp syntax_error
      002949                       3309 0$: ; cfunc 
      00A306 09               [ 4] 3310 	call (x)
      00A307 CD 9D            [ 2] 3311 	jra 3$
      00294C                       3312 1$: ; quoted string 
      00A309 14               [ 1] 3313 	ld a,(x)
      00A30A 72               [ 1] 3314 	push a  
      00A30B 14 00 23         [ 4] 3315 	call skip_string
      00A30E CD               [ 1] 3316 	pop a  	
      00A30F 98 2A            [ 2] 3317 	jra 3$ 
      002954                       3318 2$: ; character 
      00A311 A1 80 27         [ 4] 3319 	call get_char 
      00A314 03               [ 1] 3320 3$:	clrw x 
      00A315 CC               [ 1] 3321 	rlwa x   
      002959                       3322 4$:	_xpush  
      00A316 97 29 00 03      [ 2]    1     subw y,#CELL_SIZE
      00A318 90 F7            [ 1]    2     ld (y),a 
      00A318 CD 98 43         [ 2]    3     ldw (1,y),x 
      00A31B A3 A3            [ 1] 3323 	ld a,#TK_RPAREN 
      00A31D 23 27 03         [ 4] 3324 	call expect
      002967                       3325 9$:	
      002967                       3326 	_xpop  
      00A320 CC 97            [ 1]    1     ld a,(y)
      00A322 29               [ 1]    2     ldw x,y 
      00A323 EE 01            [ 2]    3     ldw x,(1,x)
      00A323 72 04 00 23      [ 2]    4     addw y,#CELL_SIZE 
      00A327 03               [ 4] 3327 	ret 
                                   3328 
                                   3329 ;---------------------
                                   3330 ;BASIC: KEY
                                   3331 ; wait for a character 
                                   3332 ; received from STDIN 
                                   3333 ; input:
                                   3334 ;	none 
                                   3335 ; output:
                                   3336 ;	a	 character 
                                   3337 ;---------------------
      002971                       3338 key:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



      00A328 CC 97 29         [ 4] 3339 	call getc 
      00A32B CD               [ 4] 3340 	ret
                                   3341 
                                   3342 ;----------------------
                                   3343 ; BASIC: QKEY
                                   3344 ; Return true if there 
                                   3345 ; is a character in 
                                   3346 ; waiting in STDIN 
                                   3347 ; input:
                                   3348 ;  none 
                                   3349 ; output:
                                   3350 ;   A     0|-1
                                   3351 ;-----------------------
      002975                       3352 qkey:: 
      00A32C 9B               [ 1] 3353 	clrw x 
      00A32D 13 A1 84         [ 1] 3354 	ld a,rx1_head
      00A330 27 03 CC         [ 1] 3355 	sub a,rx1_tail 
      00A333 97 29            [ 1] 3356 	jreq 9$ 
      00A335 90               [ 2] 3357 	cplw x
      00A336 F6 93            [ 1] 3358 	ld a,#255    
      002981                       3359 9$: 
      00A338 EE               [ 4] 3360 	ret 
                                   3361 
                                   3362 ;---------------------
                                   3363 ; BASIC: GPIO(port,reg)
                                   3364 ; return gpio register address 
                                   3365 ; expr {PORTA..PORTI}
                                   3366 ; input:
                                   3367 ;   none 
                                   3368 ; output:
                                   3369 ;   A:X 	gpio register address
                                   3370 ;----------------------------
                                   3371 ;	N=PORT
                                   3372 ;	T=REG 
      002982                       3373 gpio:
      00A339 01 72 A9         [ 4] 3374 	call func_args 
      00A33C 00 03            [ 1] 3375 	cp a,#2
      00A33E 6B 06            [ 1] 3376 	jreq 1$
      00A340 1F 07 CD         [ 2] 3377 	jp syntax_error  
      00298C                       3378 1$:	_at_next 
      00A343 98 2A A1         [ 1]    1     ld a,(3,y)
      00A346 00               [ 1]    2     ldw x,y 
      00A347 27 11            [ 2]    3     ldw x,(4,x)
      00A349 A1 80 26         [ 2] 3379 	cpw x,#PA_BASE 
      00A34C 08 CD            [ 1] 3380 	jrmi bad_port
      00A34E 98 43 A3         [ 2] 3381 	cpw x,#PI_BASE+1 
      00A351 A3 63            [ 1] 3382 	jrpl bad_port
      00A353 27               [ 2] 3383 	pushw x 
      00299D                       3384 	_xpop
      00A354 0E F6            [ 1]    1     ld a,(y)
      00A355 93               [ 1]    2     ldw x,y 
      00A355 55 00            [ 2]    3     ldw x,(1,x)
      00A357 03 00 02 03      [ 2]    4     addw y,#CELL_SIZE 
      00A35A 72 FB 01         [ 2] 3385 	addw x,(1,sp)
      0029A9                       3386 	_drop 2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



      00A35A 0F 03            [ 2]    1     addw sp,#2 
      00A35C AE               [ 1] 3387 	clr a 
      00A35D 00               [ 4] 3388 	ret
      0029AD                       3389 bad_port:
      00A35E 01 1F            [ 1] 3390 	ld a,#ERR_BAD_VALUE
      00A360 04 20 2F         [ 2] 3391 	jp tb_error
                                   3392 
                                   3393 
                                   3394 ;-------------------------
                                   3395 ; BASIC: UFLASH 
                                   3396 ; return free flash address
                                   3397 ; input:
                                   3398 ;  none 
                                   3399 ; output:
                                   3400 ;	A		TK_INTGR
                                   3401 ;   xstack	free address 
                                   3402 ;---------------------------
      00A363                       3403 uflash:
      00A363 72 04 00         [ 2] 3404 	ldw x,app_sign
      00A366 23 03 CC         [ 2] 3405 	cpw x,#4243 ; signature "BC" 
      00A369 97 29            [ 1] 3406 	jreq 1$
      00A36B CD 9B 13         [ 2] 3407 	ldw x,app_size 
      00A36E A1 84 27         [ 2] 3408 	addw x,#app
      00A371 03 CC            [ 2] 3409 	jra 2$
      00A373 97 29 00         [ 2] 3410 1$:	ldw x,#app_space 
      00A375 4F               [ 1] 3411 2$:	clr a 
      00A375 90               [ 4] 3412 	ret 
                                   3413 
                                   3414 
                                   3415 ;---------------------
                                   3416 ; BASIC: USR(addr[,arg])
                                   3417 ; execute a function written 
                                   3418 ; in binary code.
                                   3419 ; binary fonction should 
                                   3420 ; return token attribute in A 
                                   3421 ; and value in YL:X. 
                                   3422 ; input:
                                   3423 ;   addr	routine address 
                                   3424 ;   arg 	is an optional argument 
                                   3425 ; output:
                                   3426 ;   A 		token attribute 
                                   3427 ;   xstack  returned value 
                                   3428 ;---------------------
      0029C7                       3429 usr:
      00A376 F6               [ 2] 3430 	pushw x 
      00A377 93 EE            [ 2] 3431 	pushw y 	
      00A379 01 72 A9         [ 4] 3432 	call func_args 
      00A37C 00 03            [ 1] 3433 	cp a,#1 
      00A37E 6B 03            [ 1] 3434 	jreq 1$
      00A380 1F 04            [ 1] 3435 	cp a,#2
      00A382 4D 2A            [ 1] 3436 	jreq 1$  
      00A384 0D 7B 06         [ 2] 3437 	jp syntax_error 
      00A387 1E               [ 1] 3438 1$: push a 
      0029D9                       3439 	_xpop 
      00A388 07 1D            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



      00A38A 00               [ 1]    2     ldw x,y 
      00A38B 01 A2            [ 2]    3     ldw x,(1,x)
      00A38D 00 6B 06 1F      [ 2]    4     addw y,#CELL_SIZE 
      00A391 07 93            [ 1] 3440 	ldw y,x  ; arg|addr 
      00A392 84               [ 1] 3441     pop a 
      00A392 CE 00            [ 1] 3442 	cp a,#1 
      00A394 05 1F            [ 1] 3443 	jreq 3$
      0029E9                       3444 	_xpop  ; x=code addr  
      00A396 0D CE            [ 1]    1     ld a,(y)
      00A398 00               [ 1]    2     ldw x,y 
      00A399 01 1F            [ 2]    3     ldw x,(1,x)
      00A39B 0B 72 15 00      [ 2]    4     addw y,#CELL_SIZE 
      00A39F 23               [ 1] 3445 	exgw x,y ; y=code addr, x=arg 
      00A3A0 72 5C            [ 4] 3446 3$: call (y)
      00A3A2 00               [ 1] 3447 	push a 
      00A3A3 20 81            [ 1] 3448 	ld a,yl  
      00A3A5                       3449 	_xpush 
      00A3A5 72 5D 00 20      [ 2]    1     subw y,#CELL_SIZE
      00A3A9 26 03            [ 1]    2     ld (y),a 
      00A3AB CC 97 29         [ 2]    3     ldw (1,y),x 
      00A3AE 84               [ 1] 3450 	pop a 
      00A3AE A6 85            [ 2] 3451 	popw y 
      00A3B0 CD               [ 2] 3452 	popw x 
      00A3B1 99               [ 4] 3453 	ret 
                                   3454 
                                   3455 
                                   3456 ;------------------------------
                                   3457 ; BASIC: BYE 
                                   3458 ; halt mcu in its lowest power mode 
                                   3459 ; wait for reset or external interrupt
                                   3460 ; do a cold start on wakeup.
                                   3461 ;------------------------------
      002A06                       3462 bye:
      00A3B2 D6 CD 98 5F 13   [ 2] 3463 	btjf UART1_SR,#UART_SR_TC,.
      00A3B7 09               [10] 3464 	halt
      00A3B8 27 03 CC         [ 2] 3465 	jp cold_start  
                                   3466 
                                   3467 ;----------------------------------
                                   3468 ; BASIC: SLEEP 
                                   3469 ; halt mcu until reset or external
                                   3470 ; interrupt.
                                   3471 ; Resume progam after SLEEP command
                                   3472 ;----------------------------------
      002A0F                       3473 sleep:
      00A3BB 97 29 52 30 FB   [ 2] 3474 	btjf UART1_SR,#UART_SR_TC,.
      00A3BD 72 16 00 22      [ 1] 3475 	bset flags,#FSLEEP
      00A3BD CF               [10] 3476 	halt 
      00A3BE 00               [ 4] 3477 	ret 
                                   3478 
                                   3479 ;-------------------------------
                                   3480 ; BASIC: PAUSE expr 
                                   3481 ; suspend execution for n msec.
                                   3482 ; input:
                                   3483 ;	none
                                   3484 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



                                   3485 ;	none 
                                   3486 ;------------------------------
      002A1A                       3487 pause:
      00A3BF 1A F6 EE         [ 4] 3488 	call expression
      00A3C2 01 72            [ 1] 3489 	cp a,#TK_INTGR
      00A3C4 FB 04            [ 1] 3490 	jreq 1$ 
      00A3C6 19 03 72         [ 2] 3491 	jp syntax_error
      002A24                       3492 1$: _xpop 
      00A3C9 C7 00            [ 1]    1     ld a,(y)
      00A3CB 1A               [ 1]    2     ldw x,y 
      00A3CC 72 5C            [ 2]    3     ldw x,(1,x)
      00A3CE 00 1B 72 CF      [ 2]    4     addw y,#CELL_SIZE 
      002A2D                       3493 pause02:
      00A3D2 00 1A C7         [ 2] 3494 	ldw timer,x 
      00A3D5 00 0D CF         [ 2] 3495 1$: ldw x,timer 
      00A3D8 00               [ 2] 3496 	tnzw x 
      00A3D9 0E 7B            [ 1] 3497 	jreq 2$
      00A3DB 06               [10] 3498 	wfi 
      00A3DC 1E 07            [ 1] 3499 	jrne 1$
      002A39                       3500 2$:	
      00A3DE 72               [ 4] 3501 	ret 
                                   3502 
                                   3503 ;------------------------------
                                   3504 ; BASIC: AWU expr
                                   3505 ; halt mcu for 'expr' milliseconds
                                   3506 ; use Auto wakeup peripheral
                                   3507 ; all oscillators stopped except LSI
                                   3508 ; range: 1ms - 511ms
                                   3509 ; input:
                                   3510 ;  none
                                   3511 ; output:
                                   3512 ;  none:
                                   3513 ;------------------------------
      002A3A                       3514 awu:
      00A3DF B0 00 0E         [ 4] 3515   call expression
      00A3E2 C2 00            [ 1] 3516   cp a,#TK_INTGR
      00A3E4 0D 18            [ 1] 3517   jreq 1$
      00A3E6 03 A8 80         [ 2] 3518   jp syntax_error
      002A44                       3519 1$: _xpop 
      00A3E9 2B 12            [ 1]    1     ld a,(y)
      00A3EB 20               [ 1]    2     ldw x,y 
      00A3EC 25 7B            [ 2]    3     ldw x,(1,x)
      00A3EE 03 2A 07 C6      [ 2]    4     addw y,#CELL_SIZE 
      002A4D                       3520 awu02:
      00A3F2 00 0F 2F         [ 2] 3521   cpw x,#5120
      00A3F5 07 20            [ 1] 3522   jrmi 1$ 
      00A3F7 1A 0F 50 F2      [ 1] 3523   mov AWU_TBR,#15 
      00A3F8 A6 1E            [ 1] 3524   ld a,#30
      00A3F8 72               [ 2] 3525   div x,a
      00A3F9 0E 00            [ 1] 3526   ld a,#16
      00A3FB 0F               [ 2] 3527   div x,a 
      00A3FC 15 1E            [ 2] 3528   jra 4$
      00A3FD                       3529 1$: 
      00A3FD 1E 0D CF         [ 2] 3530   cpw x,#2048
      00A400 00 05            [ 1] 3531   jrmi 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



      00A402 72 01 00 23      [ 1] 3532   mov AWU_TBR,#14
      00A406 05 E6            [ 1] 3533   ld a,#80
      00A408 02               [ 2] 3534   div x,a 
      00A409 C7 00            [ 2] 3535   jra 4$   
      002A6C                       3536 2$:
      00A40B 04 1E 0B CF      [ 1] 3537   mov AWU_TBR,#7
      002A70                       3538 3$:  
                                   3539 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A40F 00 01 81         [ 2] 3540   cpw x,#64 
      00A412 23 07            [ 2] 3541   jrule 4$ 
      00A412 85 5B 0D 72      [ 1] 3542   inc AWU_TBR 
      00A416 5A               [ 2] 3543   srlw x 
      00A417 00 20            [ 2] 3544   jra 3$ 
      002A7C                       3545 4$:
      00A419 FC               [ 1] 3546   ld a, xl
      00A41A 4A               [ 1] 3547   dec a 
      00A41A CD 98            [ 1] 3548   jreq 5$
      00A41C 2A               [ 1] 3549   dec a 	
      002A81                       3550 5$: 
      00A41D A1 84            [ 1] 3551   and a,#0x3e 
      00A41F 27 07 A1         [ 1] 3552   ld AWU_APR,a 
      00A422 03 27 26 CC      [ 1] 3553   bset AWU_CSR,#AWU_CSR_AWUEN
      00A426 97               [10] 3554   halt 
                                   3555 
      00A427 29               [ 4] 3556   ret 
                                   3557 
                                   3558 ;------------------------------
                                   3559 ; BASIC: TICKS
                                   3560 ; return msec ticks counter value 
                                   3561 ; input:
                                   3562 ; 	none 
                                   3563 ; output:
                                   3564 ;	X 		TK_INTGR
                                   3565 ;-------------------------------
      00A428                       3566 get_ticks:
      00A428 90 89 CD         [ 1] 3567 	ld a,ticks 
      00A42B 98 69 4F         [ 2] 3568 	ldw x,ticks+1 
      00A42E 90               [ 4] 3569 	ret 
                                   3570 
                                   3571 ;------------------------------
                                   3572 ; BASIC: ABS(expr)
                                   3573 ; return absolute value of expr.
                                   3574 ; input:
                                   3575 ;   none
                                   3576 ; output:
                                   3577 ;   xstack    positive int24 
                                   3578 ;-------------------------------
      002A93                       3579 abs:
      00A42F CE 00 05         [ 4] 3580 	call func_args 
      00A432 90 FE            [ 1] 3581 	cp a,#1 
      00A434 90 89            [ 1] 3582 	jreq 0$ 
      00A436 13 01 5B         [ 2] 3583 	jp syntax_error
      002A9D                       3584 0$:  
      00A439 02 25 01         [ 4] 3585 	call abs24 
      002AA0                       3586 	_xpop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



      00A43C 4C F6            [ 1]    1     ld a,(y)
      00A43D 93               [ 1]    2     ldw x,y 
      00A43D CD 8C            [ 2]    3     ldw x,(1,x)
      00A43F FA 5D 26 05      [ 2]    4     addw y,#CELL_SIZE 
      00A443 A6               [ 4] 3587 	ret 
                                   3588 
                                   3589 ;------------------------------
                                   3590 ; BASIC: LSHIFT(expr1,expr2)
                                   3591 ; logical shift left expr1 by 
                                   3592 ; expr2 bits 
                                   3593 ; output:
                                   3594 ; 	A 		TK_INTGR
                                   3595 ;   X 		result 
                                   3596 ;------------------------------
      002AAA                       3597 lshift:
      00A444 05 CC 97         [ 4] 3598 	call func_args
      00A447 2B 90            [ 1] 3599 	cp a,#2 
      00A449 85 81            [ 1] 3600 	jreq 1$
      00A44B CC 16 A9         [ 2] 3601 	jp syntax_error
      002AB4                       3602 1$: _xpop 
      00A44B 90 89            [ 1]    1     ld a,(y)
      00A44D 89               [ 1]    2     ldw x,y 
      00A44E 72 5F            [ 2]    3     ldw x,(1,x)
      00A450 00 0E 90 CE      [ 2]    4     addw y,#CELL_SIZE 
      00A454 00 1C            [ 1] 3603     ldw y,x    
      002ABF                       3604 	_at_top  ; T@ 
      00A456 90 E6            [ 1]    1     ld a,(y)
      00A458 03               [ 1]    2     ldw x,y 
      00A459 A1 03            [ 2]    3     ldw x,(1,x)
      00A45B 27 15            [ 2] 3605 	tnzw y 
      00A45D 90 E6            [ 1] 3606 	jreq 4$
      00A45F 02               [ 1] 3607 2$:	rcf 
      00A460 C7               [ 2] 3608 	rlcw x 
      00A461 00               [ 1] 3609 	rlc a 
      00A462 0F 72            [ 2] 3610 	decw y 
      00A464 B9 00            [ 1] 3611 	jrne 2$
      002ACF                       3612 4$: _store_top  ; T! 
      00A466 0E 90            [ 1]    1     ld (y),a 
      00A468 C3 00 1E         [ 2]    2     ldw (1,y),x     
      00A46B 25 E9            [ 1] 3613 	ld a,#TK_INTGR
      00A46D A6               [ 4] 3614 	ret
                                   3615 
                                   3616 ;------------------------------
                                   3617 ; BASIC: RSHIFT(expr1,expr2)
                                   3618 ; logical shift right expr1 by 
                                   3619 ; expr2 bits.
                                   3620 ; output:
                                   3621 ; 	A 		TK_INTGR
                                   3622 ;   X 		result 
                                   3623 ;------------------------------
      002AD7                       3624 rshift:
      00A46E 0A CC 97         [ 4] 3625 	call func_args
      00A471 2B 02            [ 1] 3626 	cp a,#2 
      00A472 27 03            [ 1] 3627 	jreq 1$
      00A472 90 89 72         [ 2] 3628 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



      002AE1                       3629 1$: _xpop 
      00A475 A9 00            [ 1]    1     ld a,(y)
      00A477 04               [ 1]    2     ldw x,y 
      00A478 1E 03            [ 2]    3     ldw x,(1,x)
      00A47A CD 94 78 26      [ 2]    4     addw y,#CELL_SIZE 
      00A47E 04 90            [ 1] 3630     ldw y,x   
      002AEC                       3631 	_at_top  ; T@  
      00A480 85 20            [ 1]    1     ld a,(y)
      00A482 DA               [ 1]    2     ldw x,y 
      00A483 EE 01            [ 2]    3     ldw x,(1,x)
      00A483 85 5B            [ 2] 3632 	tnzw y 
      00A485 02 90            [ 1] 3633 	jreq 4$
      00A487 85               [ 1] 3634 2$:	rcf 
      00A488 81               [ 2] 3635 	rrcw x
      00A489 46               [ 1] 3636 	rrc a  
      00A489 72 00            [ 2] 3637 	decw y 
      00A48B 00 23            [ 1] 3638 	jrne 2$
      002AFC                       3639 4$: _store_top  ; T! 
      00A48D 05 A6            [ 1]    1     ld (y),a 
      00A48F 06 CC 97         [ 2]    2     ldw (1,y),x     
      00A492 2B CD            [ 1] 3640 	ld a,#TK_INTGR
      00A494 9B               [ 4] 3641 	ret
                                   3642 
                                   3643 ;--------------------------
                                   3644 ; BASIC: FCPU integer
                                   3645 ; set CPU frequency 
                                   3646 ;-------------------------- 
                                   3647 
      002B04                       3648 fcpu:
      00A495 13 A1            [ 1] 3649 	ld a,#TK_INTGR
      00A497 84 27 03         [ 4] 3650 	call expect 
      00A49A CC 97 29         [ 4] 3651 	call get_int24 
      00A49D 90               [ 1] 3652 	ld a,xl 
      00A49E F6 93            [ 1] 3653 	and a,#7 
      00A4A0 EE 01 72         [ 1] 3654 	ld CLK_CKDIVR,a 
      00A4A3 A9               [ 4] 3655 	ret 
                                   3656 
                                   3657 ;------------------------------
                                   3658 ; BASIC: PMODE pin#, mode 
                                   3659 ; Arduino pin. 
                                   3660 ; define pin as input or output
                                   3661 ; pin#: {0..15}
                                   3662 ; mode: INPUT|OUTPUT  
                                   3663 ;------------------------------
                           000001  3664 	PINNO=1
                           000001  3665 	VSIZE=1
      002B13                       3666 pin_mode:
      002B13                       3667 	_vars VSIZE 
      00A4A4 00 03            [ 2]    1     sub sp,#VSIZE 
      00A4A6 9F 27 62         [ 4] 3668 	call arg_list 
      00A4A9 88 CD            [ 1] 3669 	cp a,#2 
      00A4AB 98 2A            [ 1] 3670 	jreq 1$
      00A4AD A1 80 27         [ 2] 3671 	jp syntax_error 
      002B1F                       3672 1$: _xpop 
      00A4B0 03 CC            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



      00A4B2 97               [ 1]    2     ldw x,y 
      00A4B3 29 CD            [ 2]    3     ldw x,(1,x)
      00A4B5 98 43 A3 A5      [ 2]    4     addw y,#CELL_SIZE 
      00A4B9 15 27 08         [ 2] 3673 	ldw ptr16,x ; mode 
      002B2B                       3674 	_xpop ; Dx pin 
      00A4BC A3 A5            [ 1]    1     ld a,(y)
      00A4BE 2F               [ 1]    2     ldw x,y 
      00A4BF 27 03            [ 2]    3     ldw x,(1,x)
      00A4C1 CC 97 29 03      [ 2]    4     addw y,#CELL_SIZE 
      00A4C4 CD 2B 72         [ 4] 3675 	call select_pin 
      00A4C4 84 89            [ 1] 3676 	ld (PINNO,sp),a  
      00A4C6 88 01            [ 1] 3677 	ld a,#1 
      00A4C7 0D 01            [ 1] 3678 	tnz (PINNO,sp)
      00A4C7 0A 01            [ 1] 3679 	jreq 4$
      00A4C9 27               [ 1] 3680 2$:	sll a 
      00A4CA 26 CD            [ 1] 3681 	dec (PINNO,sp)
      00A4CC 98 2A            [ 1] 3682 	jrne 2$ 
      00A4CE A1 84            [ 1] 3683 	ld (PINNO,sp),a
      00A4D0 27 07            [ 1] 3684 	ld a,(PINNO,sp)
      00A4D2 A1 03            [ 1] 3685 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A4D4 27 0D            [ 1] 3686 	ld (GPIO_CR1,x),a 
      00A4D6 CC 97            [ 1] 3687 4$:	ld a,#OUTP
      00A4D8 29 00 0E         [ 1] 3688 	cp a,acc8 
      00A4D9 27 10            [ 1] 3689 	jreq 6$
                                   3690 ; input mode
                                   3691 ; disable external interrupt 
      00A4D9 C6 00            [ 1] 3692 	ld a,(PINNO,sp)
      00A4DB 02               [ 1] 3693 	cpl a 
      00A4DC AB 03            [ 1] 3694 	and a,(GPIO_CR2,x)
      00A4DE C7 00            [ 1] 3695 	ld (GPIO_CR2,x),a 
                                   3696 ;clear bit in DDR for input mode 
      00A4E0 02 20            [ 1] 3697 	ld a,(PINNO,sp)
      00A4E2 03               [ 1] 3698 	cpl a 
      00A4E3 CD 98            [ 1] 3699 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A4E5 50 02            [ 1] 3700 	ld (GPIO_DDR,x),a 
      00A4E6 20 0C            [ 2] 3701 	jra 9$
      002B63                       3702 6$: ;output mode  
      00A4E6 CD 98            [ 1] 3703 	ld a,(PINNO,sp)
      00A4E8 2A A1            [ 1] 3704 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A4EA 08 27            [ 1] 3705 	ld (GPIO_DDR,x),a 
      00A4EC DA 5B            [ 1] 3706 	ld a,(PINNO,sp)
      00A4EE 03 20            [ 1] 3707 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A4F0 1A 04            [ 1] 3708 	ld (GPIO_CR2,x),a 
      00A4F1                       3709 9$:	
      002B6F                       3710 	_drop VSIZE 
      00A4F1 5B 01            [ 2]    1     addw sp,#VSIZE 
      00A4F3 CD               [ 4] 3711 	ret
                                   3712 
                                   3713 ;------------------------
                                   3714 ; select Arduino pin 
                                   3715 ; input:
                                   3716 ;   X 	 {0..15} Arduino Dx 
                                   3717 ; output:
                                   3718 ;   A     stm8s208 pin 
                                   3719 ;   X     base address s208 GPIO port 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



                                   3720 ;---------------------------
      002B72                       3721 select_pin:
      00A4F4 A4               [ 2] 3722 	sllw x 
      00A4F5 1A CF 00         [ 2] 3723 	addw x,#arduino_to_8s208 
      00A4F8 1A               [ 2] 3724 	ldw x,(x)
      00A4F9 55               [ 1] 3725 	ld a,xl 
      00A4FA 00               [ 1] 3726 	push a 
      00A4FB 04               [ 1] 3727 	swapw x 
      00A4FC 00 02            [ 1] 3728 	ld a,#5 
      00A4FE 85               [ 4] 3729 	mul x,a 
      00A4FF A3 A5 15         [ 2] 3730 	addw x,#GPIO_BASE 
      00A502 26               [ 1] 3731 	pop a 
      00A503 05               [ 4] 3732 	ret 
                                   3733 ; translation from Arduino D0..D15 to stm8s208rb 
      002B82                       3734 arduino_to_8s208:
      00A504 CE 00                 3735 .byte 3,6 ; D0 
      00A506 1A 20                 3736 .byte 3,5 ; D1 
      00A508 19 00                 3737 .byte 4,0 ; D2 
      00A509 02 01                 3738 .byte 2,1 ; D3
      00A509 20 35                 3739 .byte 6,0 ; D4
      00A50B 02 02                 3740 .byte 2,2 ; D5
      00A50B 55 00                 3741 .byte 2,3 ; D6
      00A50D 04 00                 3742 .byte 3,1 ; D7
      00A50F 02 5B                 3743 .byte 3,3 ; D8
      00A511 02 CC                 3744 .byte 2,4 ; D9
      00A513 97 DC                 3745 .byte 4,5 ; D10
      00A515 02 06                 3746 .byte 2,6 ; D11
      00A515 72 00                 3747 .byte 2,7 ; D12
      00A517 00 23                 3748 .byte 2,5 ; D13
      00A519 05 A6                 3749 .byte 4,2 ; D14
      00A51B 06 CC                 3750 .byte 4,1 ; D15
                                   3751 
                                   3752 
                                   3753 ;------------------------------
                                   3754 ; BASIC: RND(expr)
                                   3755 ; return random number 
                                   3756 ; between 1 and expr inclusive
                                   3757 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   3758 ; input:
                                   3759 ; 	none 
                                   3760 ; output:
                                   3761 ;	xstack 	random positive integer 
                                   3762 ;------------------------------
      002BA2                       3763 random:
      00A51D 97 2B 63         [ 4] 3764 	call func_args 
      00A51F A1 01            [ 1] 3765 	cp a,#1
      00A51F CD A4            [ 1] 3766 	jreq 1$
      00A521 1A 16 A9         [ 2] 3767 	jp syntax_error
      00A522                       3768 1$:  
      002BAC                       3769 	_xpop   
      00A522 CF 00            [ 1]    1     ld a,(y)
      00A524 05               [ 1]    2     ldw x,y 
      00A525 E6 02            [ 2]    3     ldw x,(1,x)
      00A527 C7 00 04 35      [ 2]    4     addw y,#CELL_SIZE 
      00A52B 03               [ 2] 3770 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



      00A52C 00               [ 1] 3771 	push a  
      00A52D 02 81            [ 1] 3772 	ld a,#0x80 
      00A52F 15 01            [ 1] 3773 	bcp a,(1,sp)
      00A52F 72 00            [ 1] 3774 	jreq 2$
      00A531 00 23            [ 1] 3775 	ld a,#ERR_BAD_VALUE
      00A533 06 A6 06         [ 2] 3776 	jp tb_error
      002BC2                       3777 2$: 
                                   3778 ; acc16=(x<<5)^x 
      00A536 CC 97 2B         [ 2] 3779 	ldw x,seedx 
      00A539 81               [ 2] 3780 	sllw x 
      00A53A 58               [ 2] 3781 	sllw x 
      00A53A CD               [ 2] 3782 	sllw x 
      00A53B A4               [ 2] 3783 	sllw x 
      00A53C 1A               [ 2] 3784 	sllw x 
      00A53D CF               [ 1] 3785 	ld a,xh 
      00A53E 00 1A 14         [ 1] 3786 	xor a,seedx 
      00A540 C7 00 0D         [ 1] 3787 	ld acc16,a 
      00A540 85               [ 1] 3788 	ld a,xl 
      00A541 52 04 89         [ 1] 3789 	xor a,seedx+1 
      00A544 CE 00 1A         [ 1] 3790 	ld acc8,a 
                                   3791 ; seedx=seedy 
      00A547 89 CE 00         [ 2] 3792 	ldw x,seedy 
      00A54A 05 1F 05         [ 2] 3793 	ldw seedx,x  
                                   3794 ; seedy=seedy^(seedy>>1)
      00A54D CE 00 01         [ 2] 3795 	ldw x,seedy 
      00A550 1F               [ 2] 3796 	srlw x 
      00A551 07               [ 1] 3797 	ld a,xh 
      00A552 85 20 CD         [ 1] 3798 	xor a,seedy 
      00A555 C7 00 16         [ 1] 3799 	ld seedy,a  
      00A555 72               [ 1] 3800 	ld a,xl 
      00A556 00 00 23         [ 1] 3801 	xor a,seedy+1 
      00A559 05 A6 06         [ 1] 3802 	ld seedy+1,a 
                                   3803 ; acc16>>3 
      00A55C CC 97 2B         [ 2] 3804 	ldw x,acc16 
      00A55F 54               [ 2] 3805 	srlw x 
      00A55F 1E               [ 2] 3806 	srlw x 
      00A560 03               [ 2] 3807 	srlw x 
                                   3808 ; x=acc16^x 
      00A561 CF               [ 1] 3809 	ld a,xh 
      00A562 00 05 E6         [ 1] 3810 	xor a,acc16 
      00A565 02 C7 00         [ 1] 3811 	ld acc16,a 
      00A568 04               [ 1] 3812 	ld a,xl 
      00A569 1E 05 CF         [ 1] 3813 	xor a,acc8 
      00A56C 00 01 85         [ 1] 3814 	ld acc8,a 
                                   3815 ; seedy=acc16^seedy 
      00A56F 5B 04 89         [ 1] 3816 	xor a,seedy+1
      00A572 81               [ 1] 3817 	ld xl,a 
      00A573 C6 00 0D         [ 1] 3818 	ld a,acc16 
      00A573 72 01 00         [ 1] 3819 	xor a,seedy
      00A576 23               [ 1] 3820 	ld xh,a 
      00A577 02 4F 81         [ 2] 3821 	ldw seedy,x 
                                   3822 ; return seedx_lo&0x7f:seedy modulo expr + 1 
      00A57A C6 00 15         [ 1] 3823 	ld a,seedx+1
      00A57A 72 09            [ 1] 3824 	and a,#127
      002C17                       3825 	_xpush 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



      00A57C 00 23 12 5B      [ 2]    1     subw y,#CELL_SIZE
      00A580 02 CD            [ 1]    2     ld (y),a 
      00A582 A1 0D 5B         [ 2]    3     ldw (1,y),x 
      00A585 04               [ 1] 3826 	pop a 
      00A586 72               [ 2] 3827 	popw x 
      002C22                       3828 	_xpush 
      00A587 19 00 23 72      [ 2]    1     subw y,#CELL_SIZE
      00A58B 10 00            [ 1]    2     ld (y),a 
      00A58D 23 CC 97         [ 2]    3     ldw (1,y),x 
      00A590 D4 CE 00         [ 4] 3829 	call mod24 
      002C2E                       3830 	_xpop
      00A593 1C C3            [ 1]    1     ld a,(y)
      00A595 00               [ 1]    2     ldw x,y 
      00A596 1E 2B            [ 2]    3     ldw x,(1,x)
      00A598 0C AE 96 B8      [ 2]    4     addw y,#CELL_SIZE 
      00A59C CD 8A 1D         [ 2] 3831 	addw x,#1 
      00A59F 55 00            [ 1] 3832 	adc a,#0  
      00A5A1 04               [ 4] 3833 	ret 
                                   3834 
                                   3835 ;---------------------------------
                                   3836 ; BASIC: WORDS 
                                   3837 ; affiche la listes des mots du
                                   3838 ; dictionnaire ainsi que le nombre
                                   3839 ; de mots.
                                   3840 ;---------------------------------
                           000001  3841 	WLEN=1 ; word length
                           000002  3842 	LLEN=2 ; character sent to console
                           000003  3843 	WCNT=3 ; count words printed 
                           000003  3844 	VSIZE=3 
      002C3D                       3845 words:
      00A5A2 00 02            [ 2] 3846 	pushw y
      002C3F                       3847 	_vars VSIZE
      00A5A4 81 03            [ 2]    1     sub sp,#VSIZE 
      00A5A5 0F 02            [ 1] 3848 	clr (LLEN,sp)
      00A5A5 5B 02            [ 1] 3849 	clr (WCNT,sp)
      00A5A7 90 AE 33 24      [ 2] 3850 	ldw y,#kword_dict+2
      00A5A7 CD               [ 1] 3851 0$:	ldw x,y
      00A5A8 9C               [ 1] 3852 	ld a,(x)
      00A5A9 F3 CD            [ 1] 3853 	and a,#15 
      00A5AB 94 DD            [ 1] 3854 	ld (WLEN,sp),a 
      00A5AD 5F CF            [ 1] 3855 	inc (WCNT,sp)
      00A5AF 00               [ 1] 3856 1$:	incw x 
      00A5B0 07               [ 1] 3857 	ld a,(x)
      00A5B1 72 5F 00         [ 4] 3858 	call putc 
      00A5B4 09 72            [ 1] 3859 	inc (LLEN,sp)
      00A5B6 5F 00            [ 1] 3860 	dec (WLEN,sp)
      00A5B8 0A CE            [ 1] 3861 	jrne 1$
      00A5BA 00 1C            [ 1] 3862 	ld a,#70
      00A5BC CF 00            [ 1] 3863 	cp a,(LLEN,sp)
      00A5BE 05 E6            [ 1] 3864 	jrmi 2$   
      00A5C0 02 C7            [ 1] 3865 	ld a,#SPACE 
      00A5C2 00 04 35         [ 4] 3866 	call putc 
      00A5C5 03 00            [ 1] 3867 	inc (LLEN,sp) 
      00A5C7 02 72            [ 2] 3868 	jra 3$
      00A5C9 10 00            [ 1] 3869 2$: ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



      00A5CB 23 CC 97         [ 4] 3870 	call putc 
      00A5CE D4 02            [ 1] 3871 	clr (LLEN,sp)
      00A5CF 72 A2 00 02      [ 2] 3872 3$:	subw y,#2 
      00A5CF AE 17            [ 2] 3873 	ldw y,(y)
      00A5D1 FF 94            [ 1] 3874 	jrne 0$ 
      00A5D3 CC 97            [ 1] 3875 	ld a,#CR 
      00A5D5 B5 09 40         [ 4] 3876 	call putc  
      00A5D6 5F               [ 1] 3877 	clrw x 
      00A5D6 CD 98            [ 1] 3878 	ld a,(WCNT,sp)
      00A5D8 2A               [ 1] 3879 	ld xl,a 
      00A5D9 A1 85 27         [ 4] 3880 	call prt_i16 
      00A5DC 03 CC 97         [ 2] 3881 	ldw x,#words_count_msg
      00A5DF 29 CD 98         [ 4] 3882 	call puts 
      002C8C                       3883 	_drop VSIZE 
      00A5E2 5F CF            [ 2]    1     addw sp,#VSIZE 
      00A5E4 00 1A            [ 2] 3884 	popw y 
      00A5E6 CD               [ 4] 3885 	ret 
      00A5E7 89 C9 27 03 CD 89 D0  3886 words_count_msg: .asciz " words in dictionary\n"
             72 3F 00 1A 72 5C 00
             1B 72 3F 00 1A 72 5C
             00
                                   3887 
                                   3888 
                                   3889 ;-----------------------------
                                   3890 ; BASIC: TIMER expr 
                                   3891 ; initialize count down timer 
                                   3892 ;-----------------------------
      002CA7                       3893 set_timer:
      00A5FD 1B 72 C7         [ 4] 3894 	call arg_list
      00A600 00 1A            [ 1] 3895 	cp a,#1 
      00A602 81 03            [ 1] 3896 	jreq 1$
      00A603 CC 16 A9         [ 2] 3897 	jp syntax_error
      002CB1                       3898 1$: 
      002CB1                       3899 	_xpop  
      00A603 90 89            [ 1]    1     ld a,(y)
      00A605 AE               [ 1]    2     ldw x,y 
      00A606 00 64            [ 2]    3     ldw x,(1,x)
      00A608 90 AE 03 E8      [ 2]    4     addw y,#CELL_SIZE 
      00A60C 20 22 12         [ 2] 3900 	ldw timer,x 
      00A60E 81               [ 4] 3901 	ret 
                                   3902 
                                   3903 ;------------------------------
                                   3904 ; BASIC: TIMEOUT 
                                   3905 ; return state of timer 
                                   3906 ; output:
                                   3907 ;   A:X     0 not timeout 
                                   3908 ;   A:X     -1 timeout 
                                   3909 ;------------------------------
      002CBE                       3910 timeout:
      00A60E 90               [ 1] 3911 	clr a 
      00A60F 89 CD 99         [ 2] 3912 	ldw x,timer 
      00A612 E8 A1            [ 1] 3913 	jreq 1$
      00A614 02               [ 1] 3914 	clrw x 
      00A615 27               [ 1] 3915 1$:	cpl a
      00A616 03               [ 2] 3916 	cplw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



      00A617 CC               [ 4] 3917 	ret 
                                   3918  	
                                   3919 
                                   3920 
                                   3921 
                                   3922 ;-----------------------------------
                                   3923 ; BASIC: IWDGEN expr1 
                                   3924 ; enable independant watchdog timer
                                   3925 ; expr1 is delay in multiple of 62.5µsec
                                   3926 ; expr1 -> {1..16383}
                                   3927 ;-----------------------------------
      002CC8                       3928 enable_iwdg:
      00A618 97 29 68         [ 4] 3929 	call arg_list
      00A61A A1 01            [ 1] 3930 	cp a,#1 
      00A61A 90 F6            [ 1] 3931 	jreq 1$
      00A61C 93 EE 01         [ 2] 3932 	jp syntax_error 
      002CD2                       3933 1$: _xpop  
      00A61F 72 A9            [ 1]    1     ld a,(y)
      00A621 00               [ 1]    2     ldw x,y 
      00A622 03 89            [ 2]    3     ldw x,(1,x)
      00A624 90 F6 93 EE      [ 2]    4     addw y,#CELL_SIZE 
      00A628 01 72            [ 1] 3934 	push #0
      00A62A A9 00 03 90      [ 1] 3935 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A62E 93               [ 1] 3936 	ld a,xh 
      00A62F 85 3F            [ 1] 3937 	and a,#0x3f
      00A630 95               [ 1] 3938 	ld xh,a  
      00A630 89 AE F4         [ 2] 3939 2$:	cpw x,#255
      00A633 24 65            [ 2] 3940 	jrule 3$
      00A635 90 A3            [ 1] 3941 	inc (1,sp)
      00A637 7A               [ 1] 3942 	rcf 
      00A638 12               [ 2] 3943 	rrcw x 
      00A639 2B 01            [ 2] 3944 	jra 2$
      00A63B 5C 55 50 E0      [ 1] 3945 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A63C 84               [ 1] 3946 	pop a  
      00A63C 9E C7 53         [ 1] 3947 	ld IWDG_PR,a 
      00A63F 0D               [ 1] 3948 	ld a,xl
      00A640 9F               [ 1] 3949 	dec a 
      00A641 C7 53 0E 8C      [ 1] 3950 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A645 56 9E C7         [ 1] 3951 	ld IWDG_RLR,a 
      00A648 53 0F 9F C7      [ 1] 3952 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A64C 53               [ 4] 3953 	ret 
                                   3954 
                                   3955 
                                   3956 ;-----------------------------------
                                   3957 ; BASIC: IWDGREF  
                                   3958 ; refresh independant watchdog count down 
                                   3959 ; timer before it reset MCU. 
                                   3960 ;-----------------------------------
      002D06                       3961 refresh_iwdg:
      00A64D 10 72 10 53      [ 1] 3962 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A651 08               [ 4] 3963 	ret 
                                   3964 
                                   3965 
                                   3966 ;-------------------------------------
                                   3967 ; BASIC: LOG(expr)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



                                   3968 ; return logarithm base 2 of expr 
                                   3969 ; this is the position of most significant
                                   3970 ; bit set. 
                                   3971 ; input: 
                                   3972 ; output:
                                   3973 ;   A     TK_INTGR 
                                   3974 ;   xstack log2 
                                   3975 ;*********************************
      002D0B                       3976 log2:
      00A652 72 10 53         [ 4] 3977 	call func_args 
      00A655 00 72            [ 1] 3978 	cp a,#1 
      00A657 10 53            [ 1] 3979 	jreq 1$
      00A659 04 85 CD         [ 2] 3980 	jp syntax_error 
      002D15                       3981 1$: 
      002D15                       3982 	_xpop    
      00A65C AA AD            [ 1]    1     ld a,(y)
      00A65E 72               [ 1]    2     ldw x,y 
      00A65F 11 53            [ 2]    3     ldw x,(1,x)
      00A661 08 72 11 53      [ 2]    4     addw y,#CELL_SIZE 
      00A665 00               [ 1] 3983 	tnz a
      00A666 90 85            [ 1] 3984 	jrne 2$ 
      00A668 81               [ 2] 3985 	tnzw x 
      00A669 26 05            [ 1] 3986 	jrne 2$
      00A669 CD 99            [ 1] 3987 	ld a,#ERR_BAD_VALUE
      00A66B E8 A1 02         [ 2] 3988 	jp tb_error 
      00A66E 27 12            [ 1] 3989 2$: push #24 
      00A670 A1               [ 2] 3990 3$: rlcw x 
      00A671 01               [ 1] 3991     rlc a 
      00A672 27 03            [ 1] 3992 	jrc 4$
      00A674 CC 97            [ 1] 3993 	dec (1,sp) 
      00A676 29 4F            [ 1] 3994 	jrne 3$
      00A678 5F               [ 1] 3995 4$: clrw x 
      00A679 72               [ 1] 3996     pop a 
      00A67A A2               [ 1] 3997 	dec a
      00A67B 00               [ 1] 3998 	rlwa x  
      002D37                       3999 9$:	
      00A67C 03               [ 4] 4000 	ret 
                                   4001 
                                   4002 ;-----------------------------------
                                   4003 ; BASIC: BIT(expr) 
                                   4004 ; expr ->{0..23}
                                   4005 ; return 2^expr 
                                   4006 ; output:
                                   4007 ;    A:X    2^expr 
                                   4008 ;-----------------------------------
      002D38                       4009 bitmask:
      00A67D 90 F7 90         [ 4] 4010     call func_args 
      00A680 EF 01            [ 1] 4011 	cp a,#1
      00A682 90 E6            [ 1] 4012 	jreq 1$
      00A684 03 93 EE         [ 2] 4013 	jp syntax_error 
      002D42                       4014 1$: _xpop 
      00A687 04 5D            [ 1]    1     ld a,(y)
      00A689 27               [ 1]    2     ldw x,y 
      00A68A 25 90            [ 2]    3     ldw x,(1,x)
      00A68C F6 93 EE 01      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



      00A690 72               [ 1] 4015 	ld a,xl 
      00A691 A9 00 03         [ 2] 4016 	ldw x,#1 
      00A694 72 A9            [ 1] 4017 	and a,#23
      00A696 00 03            [ 1] 4018 	jreq 9$
      00A698 9F               [ 1] 4019 	push a 
      00A699 A4               [ 1] 4020 	clr a 
      002D55                       4021 2$: 
      00A69A 07               [ 2] 4022 	slaw x 
      00A69B 4E               [ 1] 4023 	rlc a 	
      00A69C C7 54            [ 1] 4024 	dec (1,sp)
      00A69E 01 72            [ 1] 4025 	jrne 2$ 
      002D5B                       4026 4$:
      002D5B                       4027     _drop 1 
      00A6A0 16 50            [ 2]    1     addw sp,#1 
      00A6A2 CA               [ 4] 4028 9$:	ret 
                                   4029 
                                   4030 ;------------------------------
                                   4031 ; BASIC: INVERT(expr)
                                   4032 ; 1's complement 
                                   4033 ;--------------------------------
      002D5E                       4034 invert:
      00A6A3 72 10 54         [ 4] 4035 	call func_args
      00A6A6 01 AE            [ 1] 4036 	cp a,#1 
      00A6A8 00 1B            [ 1] 4037 	jreq 1$
      00A6AA 5A 9D 26         [ 2] 4038 	jp syntax_error
      002D68                       4039 1$: _xpop 
      00A6AD FA 20            [ 1]    1     ld a,(y)
      00A6AF 08               [ 1]    2     ldw x,y 
      00A6B0 72 11            [ 2]    3     ldw x,(1,x)
      00A6B2 54 01 72 17      [ 2]    4     addw y,#CELL_SIZE 
      00A6B6 50               [ 1] 4040 	cpl a 
      00A6B7 CA               [ 2] 4041 	cplw x 
      00A6B8 81               [ 4] 4042 	ret 
                                   4043 
                                   4044 ;------------------------------
                                   4045 ; BASIC: DO 
                                   4046 ; initiate a DO ... UNTIL loop 
                                   4047 ;------------------------------
                           000003  4048 	DOLP_ADR=3 
                           000005  4049 	DOLP_INW=5
                           000004  4050 	VSIZE=4 
      002D74                       4051 do_loop:
      00A6B8 81               [ 2] 4052 	popw x 
      00A6B9                       4053 	_vars VSIZE 
      00A6B9 CD 99            [ 2]    1     sub sp,#VSIZE 
      00A6BB E3               [ 2] 4054 	pushw x 
      00A6BC A1 01 27         [ 2] 4055 	ldw x,basicptr 
      00A6BF 03 CC            [ 2] 4056 	ldw (DOLP_ADR,sp),x
      00A6C1 97 29 90         [ 2] 4057 	ldw x,in.w 
      00A6C4 F6 93            [ 2] 4058 	ldw (DOLP_INW,sp),x
      00A6C6 EE 01 72 A9      [ 1] 4059 	inc loop_depth 
      00A6CA 00               [ 4] 4060 	ret 
                                   4061 
                                   4062 ;--------------------------------
                                   4063 ; BASIC: UNTIL expr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



                                   4064 ; loop if exprssion is false 
                                   4065 ; else terminate loop
                                   4066 ;--------------------------------
      002D87                       4067 until: 
      00A6CB 03 A3 00 05      [ 1] 4068 	tnz loop_depth 
      00A6CF 23 05            [ 1] 4069 	jrne 1$ 
      00A6D1 A6 0A CC         [ 2] 4070 	jp syntax_error 
      002D90                       4071 1$: 
      00A6D4 97 2B 9F         [ 4] 4072 	call condition  
      002D93                       4073 	_xpop 
      00A6D7 C7 00            [ 1]    1     ld a,(y)
      00A6D9 0F               [ 1]    2     ldw x,y 
      00A6DA A6 05            [ 2]    3     ldw x,(1,x)
      00A6DC C0 00 0F C7      [ 2]    4     addw y,#CELL_SIZE 
      00A6E0 54               [ 1] 4074 	tnz a 
      00A6E1 00 72            [ 1] 4075 	jrne 9$ 
      00A6E3 16 54            [ 2] 4076 	ldw x,(DOLP_ADR,sp)
      00A6E5 02 72 10         [ 2] 4077 	ldw basicptr,x 
      00A6E8 54 01            [ 1] 4078 	ld a,(2,x)
      00A6EA 72 0F 54         [ 1] 4079 	ld count,a 
      00A6ED 00 FB            [ 2] 4080 	ldw x,(DOLP_INW,sp)
      00A6EF CE 54 04         [ 2] 4081 	ldw in.w,x 
      00A6F2 A6               [ 4] 4082 	ret 
      002DAF                       4083 9$:	; remove loop data from stack  
      00A6F3 84               [ 2] 4084 	popw x
      002DB0                       4085 	_drop VSIZE
      00A6F4 81 04            [ 2]    1     addw sp,#VSIZE 
      00A6F5 72 5A 00 1F      [ 1] 4086 	dec loop_depth 
      00A6F5 52               [ 2] 4087 	jp (x)
                                   4088 
                                   4089 ;--------------------------
                                   4090 ; BASIC: PORTA...PORTI  
                                   4091 ;  return constant value 
                                   4092 ;  PORT  base address 
                                   4093 ;---------------------------
      002DB7                       4094 const_porta:
      00A6F6 01 CD 99         [ 2] 4095 	ldw x,#PA_BASE 
      00A6F9 E3               [ 1] 4096 	clr a 
      00A6FA A1               [ 4] 4097 	ret 
      002DBC                       4098 const_portb:
      00A6FB 01 27 03         [ 2] 4099 	ldw x,#PB_BASE 
      00A6FE CC               [ 1] 4100 	clr a 
      00A6FF 97               [ 4] 4101 	ret 
      002DC1                       4102 const_portc:
      00A700 29 90 F6         [ 2] 4103 	ldw x,#PC_BASE 
      00A703 93               [ 1] 4104 	clr a 
      00A704 EE               [ 4] 4105 	ret 
      002DC6                       4106 const_portd:
      00A705 01 72 A9         [ 2] 4107 	ldw x,#PD_BASE 
      00A708 00               [ 1] 4108 	clr a 
      00A709 03               [ 4] 4109 	ret 
      002DCB                       4110 const_porte:
      00A70A A3 00 0F         [ 2] 4111 	ldw x,#PE_BASE 
      00A70D 23               [ 1] 4112 	clr a 
      00A70E 05               [ 4] 4113 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



      002DD0                       4114 const_portf:
      00A70F A6 0A CC         [ 2] 4115 	ldw x,#PF_BASE 
      00A712 97               [ 1] 4116 	clr a 
      00A713 2B               [ 4] 4117 	ret 
      002DD5                       4118 const_portg:
      00A714 CD AB F2         [ 2] 4119 	ldw x,#PG_BASE 
      00A717 6B               [ 1] 4120 	clr a 
      00A718 01               [ 4] 4121 	ret 
      002DDA                       4122 const_porth:
      00A719 E6 01 0D         [ 2] 4123 	ldw x,#PH_BASE 
      00A71C 01               [ 1] 4124 	clr a 
      00A71D 27               [ 4] 4125 	ret 
      002DDF                       4126 const_porti:
      00A71E 05 44 0A         [ 2] 4127 	ldw x,#PI_BASE 
      00A721 01               [ 1] 4128 	clr a 
      00A722 26               [ 4] 4129 	ret 
                                   4130 
                                   4131 ;-------------------------------
                                   4132 ; following return constant 
                                   4133 ; related to GPIO register offset 
                                   4134 ;---------------------------------
      002DE4                       4135 const_odr:
      00A723 FB               [ 1] 4136 	clr a 
      00A724 A4 01 5F         [ 2] 4137 	ldw x,#GPIO_ODR
      00A727 97               [ 4] 4138 	ret 
      002DE9                       4139 const_idr:
      00A728 4F               [ 1] 4140 	clr a 
      00A729 5B 01 81         [ 2] 4141 	ldw x,#GPIO_IDR
      00A72C 81               [ 4] 4142 	ret 
      002DEE                       4143 const_ddr:
      00A72C 52               [ 1] 4144 	clr a
      00A72D 02 CD 99         [ 2] 4145 	ldw x,#GPIO_DDR
      00A730 E8               [ 4] 4146 	ret 
      002DF3                       4147 const_cr1:
      00A731 A1               [ 1] 4148 	clr a 
      00A732 02 27 03         [ 2] 4149 	ldw x,#GPIO_CR1
      00A735 CC               [ 4] 4150 	ret 
      002DF8                       4151 const_cr2:
      00A736 97               [ 1] 4152 	clr a
      00A737 29 90 F6         [ 2] 4153 	ldw x,#GPIO_CR2
      00A73A 93               [ 4] 4154 	ret 
                                   4155 ;-------------------------
                                   4156 ; BASIC: POUT 
                                   4157 ;  constant for port mode
                                   4158 ;  used by PMODE 
                                   4159 ;  to set pin as output
                                   4160 ;------------------------
      002DFD                       4161 const_output:
      00A73B EE               [ 1] 4162 	clr a 
      00A73C 01 72 A9         [ 2] 4163 	ldw x,#OUTP
      00A73F 00               [ 4] 4164 	ret 
                                   4165 
                                   4166 ;-------------------------
                                   4167 ; BASIC: PINP 
                                   4168 ;  constant for port mode
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



                                   4169 ;  used by PMODE 
                                   4170 ;  to set pin as input
                                   4171 ;------------------------
      002E02                       4172 const_input:
      00A740 03               [ 1] 4173 	clr a  
      00A741 9F 6B 02         [ 2] 4174 	ldw x,#INP 
      00A744 90               [ 4] 4175 	ret 
                                   4176 	
                                   4177 ;-----------------------
                                   4178 ; memory area constants
                                   4179 ;-----------------------
      002E07                       4180 const_eeprom_base:
      00A745 F6               [ 1] 4181 	clr a  
      00A746 93 EE 01         [ 2] 4182 	ldw x,#EEPROM_BASE 
      00A749 72               [ 4] 4183 	ret 
                                   4184 
                                   4185 ;---------------------------
                                   4186 ; BASIC: DATA 
                                   4187 ; when the interpreter find 
                                   4188 ; a DATA line it skip it.
                                   4189 ;---------------------------
      002E0C                       4190 data:
      00A74A A9 00 03 A3 00   [ 1] 4191 	mov in,count 
      00A74F 0F               [ 4] 4192 	ret 
                                   4193 
                                   4194 ;------------------------------
                                   4195 ; check if it is a DATA line 
                                   4196 ; input: 
                                   4197 ;    X    line address 
                                   4198 ; output:
                                   4199 ;    Z    set if DATA line 
                                   4200 ;----------------------------
      002E12                       4201 is_data_line:
      00A750 23               [ 2] 4202 	pushw x 
      00A751 05 A6            [ 1] 4203 	ld a,(3,x)
      00A753 0A CC            [ 1] 4204 	cp a,#TK_CMD 
      00A755 97 2B            [ 1] 4205 	jrne 9$
      00A757 CD AB            [ 2] 4206 	ldw x,(4,x)
      00A759 F2 6B 01         [ 2] 4207 	cpw x,#DATA_IDX  
      00A75C A6               [ 2] 4208 9$: popw x 
      00A75D 01               [ 4] 4209 	ret 
                                   4210 
                                   4211 ;---------------------------------
                                   4212 ; BASIC: RESTORE [line#]
                                   4213 ; set data_ptr to first data line
                                   4214 ; if no DATA found pointer set to
                                   4215 ; zero.
                                   4216 ; if a line# is given as argument 
                                   4217 ; a data line with that number 
                                   4218 ; is searched and the data pointer 
                                   4219 ; is set to it. If there is no 
                                   4220 ; data line with that number 
                                   4221 ; the program is interrupted. 
                                   4222 ;---------------------------------
      002E20                       4223 restore:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



      00A75E 0D               [ 1] 4224 	clrw x 
      00A75F 01 27 05         [ 2] 4225 	ldw data_ptr,x 
      00A762 48 0A 01         [ 2] 4226 	ldw data_ofs,x 
      00A765 26 FB 0D         [ 2] 4227 	ldw x,txtbgn 
      00A768 02 26 05         [ 4] 4228 	call next_token 
      00A76B 43 E4            [ 1] 4229 	cp a,#TK_INTGR
      00A76D 00 20            [ 1] 4230 	jrne 0$
      00A76F 02 EA 00         [ 4] 4231 	call get_int24
      00A772 E7 00            [ 2] 4232 	pushw y 
      00A774 5B               [ 1] 4233 	clr a 
      00A775 02 81 7A         [ 4] 4234 	call search_lineno  
      00A777 90 85            [ 2] 4235 	popw y 
      00A777 72               [ 2] 4236 	tnzw x 
      00A778 00 00            [ 1] 4237 	jrne set_data_pointer 
      00A77A 23 02            [ 2] 4238 	jra data_error 
      002E41                       4239 0$:
      002E41                       4240 	_unget_token  
      00A77C 4F 81 02 00 01   [ 1]    1      mov in,in.saved  
                                   4241 ; search first DATA line 	
      00A77E C3 00 1D         [ 2] 4242 1$:	cpw x,txtend
      00A77E AE A7            [ 1] 4243 	jruge data_error 
      002E4B                       4244 2$:	
      00A780 A5 CD 8A         [ 4] 4245 	call is_data_line 
      00A783 1D 5B            [ 1] 4246 	jrne 4$
      00A785 02 52 04         [ 4] 4247 4$:	call try_next_line 
      00A788 CD A0            [ 1] 4248 	jrne 4$ 
      00A78A FD               [ 4] 4249 	ret 
                                   4250 
                                   4251 ;---------------------
                                   4252 ; set data pointer 
                                   4253 ; variables at new line 
                                   4254 ; input:
                                   4255 ;    X    line address 
                                   4256 ;----------------------
      002E56                       4257 set_data_pointer:
      00A78B AE 16 68         [ 2] 4258 	ldw data_ptr,x
      00A78E CF 00            [ 1] 4259 	ld a,(2,x)
      00A790 05 7F 72         [ 1] 4260 	ld data_len,a 
      00A793 5F 00 04 5F      [ 1] 4261 	mov data_ofs,#FIRST_DATA_ITEM
      00A797 CF               [ 4] 4262 	ret 
                                   4263 
                                   4264 
                                   4265 ;--------------------
                                   4266 ; at end of data line 
                                   4267 ; check if next line 
                                   4268 ; is a data line 
                                   4269 ; input:
                                   4270 ;    X   actual line address 
                                   4271 ;  
                                   4272 ;-------------------
      002E63                       4273 try_next_line: 
      00A798 00 01            [ 1] 4274 	ld a,(2,x)
      00A79A 72 11 00         [ 1] 4275 	ld acc8,a 
      00A79D 23 72 18 00      [ 1] 4276 	clr acc16 
      00A7A1 23 CC 97 D4      [ 2] 4277 	addw x,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



      00A7A5 0A 62 72         [ 2] 4278 	cpw x,txtend 
      00A7A8 65 61            [ 1] 4279 	jrult 1$
      00A7AA 6B 20            [ 2] 4280 	jra data_error 
      002E77                       4281 1$:	
      00A7AC 70 6F 69         [ 4] 4282 	call is_data_line 
      00A7AF 6E 74            [ 1] 4283 	jreq 2$
      00A7B1 2C 20            [ 1] 4284 	ld a,#1  
      00A7B3 52 55            [ 2] 4285 	jra 9$
      00A7B5 4E 20 74         [ 4] 4286 2$:	call set_data_pointer
      00A7B8 6F               [ 1] 4287 	clr a  
      00A7B9 20               [ 4] 4288 9$:	ret 
      002E85                       4289 data_error:	
      00A7BA 72 65            [ 1] 4290     ld a,#ERR_NO_DATA 
      00A7BC 73 75 6D         [ 2] 4291 	jp tb_error 
                                   4292 
                                   4293 
                                   4294 ;---------------------------------
                                   4295 ; BASIC: READ 
                                   4296 ; return next data item | 0 
                                   4297 ;---------------------------------
                           000001  4298 	CTX_BPTR=1 
                           000003  4299 	CTX_IN=3 
                           000004  4300 	CTX_COUNT=4 
                           000005  4301 	INT24=5
                           000007  4302 	VSIZE=7 
      002E8A                       4303 read:
      002E8A                       4304 	_vars  VSIZE 
      00A7BF 65 2E            [ 2]    1     sub sp,#VSIZE 
      00A7C1 0A 00 7D         [ 4] 4305 	call save_context
      00A7C3                       4306 read01:	
      00A7C3 72 01 00         [ 1] 4307 	ld a,data_ofs
      00A7C6 23 01 81         [ 1] 4308 	cp a,data_len 
      00A7C9 27 37            [ 1] 4309 	jreq 2$ ; end of line  
      002E97                       4310 0$:
      00A7C9 CD 95 85         [ 2] 4311 	ldw x,data_ptr 
      00A7CC 81 00 04         [ 2] 4312 	ldw basicptr,x 
      00A7CD 55 00 08 00 01   [ 1] 4313 	mov in,data_ofs 
      00A7CD 72 5F 00 19 52   [ 1] 4314 	mov count,data_len  
      00A7D2 03 CD 98         [ 4] 4315 	call expression 
      00A7D5 2A A1            [ 1] 4316 	cp a,#TK_INTGR 
      00A7D7 04 27            [ 1] 4317 	jreq 1$ 
      00A7D9 03 CC 97         [ 2] 4318 	jp syntax_error 
      002EB1                       4319 1$:
      00A7DC 29 CD 98         [ 4] 4320 	call next_token ; skip comma
      00A7DF 79 A4 DF         [ 2] 4321 	ldw x,basicptr 
      00A7E2 A1 45 26         [ 2] 4322 	ldw data_ptr,x 
      00A7E5 0C AE 40 00 CF   [ 1] 4323 	mov data_ofs,in 
      00A7EA 00 1A AE         [ 4] 4324 	call rest_context
      002EC2                       4325 	_xpop 
      00A7ED 47 FF            [ 1]    1     ld a,(y)
      00A7EF 4F               [ 1]    2     ldw x,y 
      00A7F0 20 15            [ 2]    3     ldw x,(1,x)
      00A7F2 A1 46 27 06      [ 2]    4     addw y,#CELL_SIZE 
      002ECB                       4326 	_drop VSIZE 
      00A7F6 AE 96            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      00A7F8 69               [ 4] 4327 	ret 
      002ECE                       4328 2$: ; end of line reached 
                                   4329 	; try next line 
      00A7F9 CC 97 2B         [ 2] 4330 	ldw x,data_ptr  
      00A7FC CD 2E 63         [ 4] 4331 	call try_next_line
      00A7FC AE B6            [ 1] 4332 	jreq 0$ 
      00A7FE 80 CF            [ 2] 4333 	jra data_error 
                                   4334 
                                   4335 ;---------------------------------
                                   4336 ; BASIC: SPIEN clkdiv, 0|1  
                                   4337 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4338 ; if clkdiv==-1 disable SPI
                                   4339 ; 0|1 -> disable|enable  
                                   4340 ;--------------------------------- 
                           000005  4341 SPI_CS_BIT=5
      002ED8                       4342 spi_enable:
      00A800 00 1A A6         [ 4] 4343 	call arg_list 
      00A803 02 AE            [ 1] 4344 	cp a,#2
      00A805 7F FF            [ 1] 4345 	jreq 1$
      00A807 CC 16 A9         [ 2] 4346 	jp syntax_error 
      002EE2                       4347 1$: 
      00A807 6B 01 1F 02      [ 1] 4348 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A80B CD               [ 2] 4349 	popw x  
      00A80C 87               [ 2] 4350 	tnzw x 
      00A80D BE 21            [ 1] 4351 	jreq spi_disable 
      00A80E 85               [ 2] 4352 	popw x 
      00A80E CD 89            [ 1] 4353 	ld a,#(1<<SPI_CR1_BR)
      00A810 40               [ 4] 4354 	mul x,a 
      00A811 27               [ 1] 4355 	ld a,xl 
      00A812 08 A6 45         [ 1] 4356 	ld SPI_CR1,a 
                                   4357 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A815 CD 89 C0 CD      [ 1] 4358 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A819 88 3C AE 00      [ 1] 4359 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4360 ; configure SPI as master mode 0.	
      00A81D 80 CD 89 32      [ 1] 4361 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4362 ; ~CS line controlled by sofware 	
      00A821 7B 01 1E 02      [ 1] 4363 	bset SPI_CR2,#SPI_CR2_SSM 
      00A825 72 B0 00 1A      [ 1] 4364     bset SPI_CR2,#SPI_CR2_SSI 
                                   4365 ; enable SPI
      00A829 C2 00 19 22      [ 1] 4366 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A82D E0               [ 4] 4367 	ret 
      002F0B                       4368 spi_disable:
      002F0B                       4369 	_drop #2; throw first argument.
      00A82E CD 95            [ 2]    1     addw sp,##2 
                                   4370 ; wait spi idle 
      00A830 85 1E            [ 1] 4371 1$:	ld a,#0x82 
      00A832 02 A3 47         [ 1] 4372 	and a,SPI_SR
      00A835 FF 26            [ 1] 4373 	cp a,#2 
      00A837 03 CD            [ 1] 4374 	jrne 1$
      00A839 9D BC 52 00      [ 1] 4375 	bres SPI_CR1,#SPI_CR1_SPE
      00A83B 72 13 50 C7      [ 1] 4376 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A83B 5B 03 81 16      [ 1] 4377 	bres PE_DDR,#SPI_CS_BIT 
      00A83E 81               [ 4] 4378 	ret 
                                   4379 
      002F23                       4380 spi_clear_error:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



      00A83E CE B6            [ 1] 4381 	ld a,#0x78 
      00A840 80 C3 A8         [ 1] 4382 	bcp a,SPI_SR 
      00A843 FE 81            [ 1] 4383 	jreq 1$
      00A845 72 5F 52 03      [ 1] 4384 	clr SPI_SR 
      00A845 88               [ 4] 4385 1$: ret 
                                   4386 
      002F2F                       4387 spi_send_byte:
      00A846 4D               [ 1] 4388 	push a 
      00A847 27 0A F6         [ 4] 4389 	call spi_clear_error
      00A84A 5C               [ 1] 4390 	pop a 
      00A84B 90 F7 90 5C 0A   [ 2] 4391 	btjf SPI_SR,#SPI_SR_TXE,.
      00A850 01 26 F6         [ 1] 4392 	ld SPI_DR,a
      00A853 84 81 52 03 FB   [ 2] 4393 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A855 C6 52 04         [ 1] 4394 	ld a,SPI_DR 
      00A855 88               [ 4] 4395 	ret 
                                   4396 
      002F45                       4397 spi_rcv_byte:
      00A856 90 AE            [ 1] 4398 	ld a,#255
      00A858 16 B8 90 89 A6   [ 2] 4399 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A85D 80 90 7F         [ 1] 4400 	ld a,SPI_DR 
      00A860 90               [ 4] 4401 	ret
                                   4402 
                                   4403 ;------------------------------
                                   4404 ; BASIC: SPIWR byte [,byte]
                                   4405 ; write 1 or more byte
                                   4406 ;------------------------------
      002F50                       4407 spi_write:
      00A861 5C 4A 26         [ 4] 4408 	call expression
      00A864 F9 90            [ 1] 4409 	cp a,#TK_INTGR 
      00A866 85 84            [ 1] 4410 	jreq 1$
      00A868 81 16 A9         [ 2] 4411 	jp syntax_error 
      00A869                       4412 1$:	
      00A869 89               [ 1] 4413 	ld a,xl 
      00A86A 90 89 52         [ 4] 4414 	call spi_send_byte 
      00A86D 06 CD A8         [ 4] 4415 	call next_token 
      00A870 3E 26            [ 1] 4416 	cp a,#TK_COMMA 
      00A872 09 AE            [ 1] 4417 	jrne 2$ 
      00A874 A9 00            [ 2] 4418 	jra spi_write 
      00A876 CD               [ 1] 4419 2$:	tnz a 
      00A877 8A 1D            [ 1] 4420 	jreq 3$
      002F6A                       4421 	_unget_token  
      00A879 CC A8 F8 00 01   [ 1]    1      mov in,in.saved  
      00A87C 81               [ 4] 4422 3$:	ret 
                                   4423 
                                   4424 
                                   4425 ;-------------------------------
                                   4426 ; BASIC: SPIRD 	
                                   4427 ; read one byte from SPI 
                                   4428 ;-------------------------------
      002F70                       4429 spi_read:
      00A87C CE 00 1C         [ 4] 4430 	call spi_rcv_byte 
      00A87F C3               [ 1] 4431 	clrw x 
      00A880 00               [ 1] 4432 	ld xl,a 
      00A881 1E               [ 1] 4433 	clr a  
      00A882 25               [ 4] 4434 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



                                   4435 
                                   4436 ;------------------------------
                                   4437 ; BASIC: SPISEL 0|1 
                                   4438 ; set state of ~CS line
                                   4439 ; 0|1 deselect|select  
                                   4440 ;------------------------------
      002F77                       4441 spi_select:
      00A883 09 AE A9         [ 4] 4442 	call next_token 
      00A886 42 CD            [ 1] 4443 	cp a,#TK_INTGR 
      00A888 8A 1D            [ 1] 4444 	jreq 1$
      00A88A CC A8 F8         [ 2] 4445 	jp syntax_error 
      00A88D 5D               [ 2] 4446 1$: tnzw x  
      00A88D CD 87            [ 1] 4447 	jreq cs_high 
      00A88F FE 72 5F 00      [ 1] 4448 	bres PE_ODR,#SPI_CS_BIT
      00A893 19               [ 4] 4449 	ret 
      002F89                       4450 cs_high: 
      00A894 AE B6 80 CF      [ 1] 4451 	bset PE_ODR,#SPI_CS_BIT
      00A898 00               [ 4] 4452 	ret 
                                   4453 
                                   4454 ;-------------------------------
                                   4455 ; BASIC: PAD 
                                   4456 ; Return pad buffer address.
                                   4457 ;------------------------------
      002F8E                       4458 pad_ref:
      00A899 1A CD 9E         [ 2] 4459 	ldw x,#pad 
      00A89C DC               [ 1] 4460 	clr a
      00A89D 1F               [ 4] 4461 	ret 
                                   4462 
                                   4463 
                                   4464 ;------------------------------
                                   4465 ;      dictionary 
                                   4466 ; format:
                                   4467 ;   link:   2 bytes 
                                   4468 ;   name_length+flags:  1 byte, bits 0:3 lenght,4:8 kw type   
                                   4469 ;   cmd_name: 16 byte max 
                                   4470 ;   cmd_index: 2 bytes 
                                   4471 ;------------------------------
                                   4472 	.macro _dict_entry len,name,cmd_idx 
                                   4473 	.word LINK 
                                   4474 	LINK=.
                                   4475 name:
                                   4476 	.byte len   	
                                   4477 	.ascii "name"
                                   4478 	.word cmd_idx 
                                   4479 	.endm 
                                   4480 
                           000000  4481 	LINK=0
                                   4482 ; respect alphabetic order for BASIC names from Z-A
                                   4483 ; this sort order is for a cleaner WORDS cmd output. 	
      002F93                       4484 kword_end:
      002F93                       4485 	_dict_entry,3+F_XOR,XOR,XOR_IDX ; xor operator
      00A89E 05 0F                    1 	.word LINK 
                           002F95     2 	LINK=.
      002F95                          3 XOR:
      00A8A0 03                       4 	.byte 3+F_XOR   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



      00A8A1 CD A8 55                 5 	.ascii "XOR"
      00A8A4 CE A8                    6 	.word XOR_IDX 
      002F9B                       4486 	_dict_entry,5,WRITE,WRITE_IDX;write  
      00A8A6 FE 90                    1 	.word LINK 
                           002F9D     2 	LINK=.
      002F9D                          3 WRITE:
      00A8A8 FF                       4 	.byte 5   	
      00A8A9 72 A9 00 02 1E           5 	.ascii "WRITE"
      00A8AE 05 90                    6 	.word WRITE_IDX 
      002FA5                       4487 	_dict_entry,5,WORDS,WORDS_IDX;words 
      00A8B0 FF 72                    1 	.word LINK 
                           002FA7     2 	LINK=.
      002FA7                          3 WORDS:
      00A8B2 A9                       4 	.byte 5   	
      00A8B3 00 02 A6 7C 6B           5 	.ascii "WORDS"
      00A8B8 04 A3                    6 	.word WORDS_IDX 
      002FAF                       4488 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      00A8BA 00 7C                    1 	.word LINK 
                           002FB1     2 	LINK=.
      002FB1                          3 WAIT:
      00A8BC 22                       4 	.byte 4   	
      00A8BD 01 9F 6B 04              5 	.ascii "WAIT"
      00A8C1 CE 00                    6 	.word WAIT_IDX 
      002FB8                       4489 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      00A8C3 1C 1F                    1 	.word LINK 
                           002FBA     2 	LINK=.
      002FBA                          3 USR:
      00A8C5 01                       4 	.byte 3+F_IFUNC   	
      00A8C6 55 53 52                 5 	.ascii "USR"
      00A8C6 1E 01                    6 	.word USR_IDX 
      002FC0                       4490 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      00A8C8 7B 04                    1 	.word LINK 
                           002FC2     2 	LINK=.
      002FC2                          3 UNTIL:
      00A8CA CD                       4 	.byte 5   	
      00A8CB A8 45 1F 01 AE           5 	.ascii "UNTIL"
      00A8D0 16 B8                    6 	.word UNTIL_IDX 
      002FCA                       4491 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      00A8D2 CD 88                    1 	.word LINK 
                           002FCC     2 	LINK=.
      002FCC                          3 UFLASH:
      00A8D4 18                       4 	.byte 6+F_IFUNC   	
      00A8D5 AE 00 80 CD 89 32        5 	.ascii "UFLASH"
      00A8DB 1E 01                    6 	.word UFLASH_IDX 
      002FD5                       4492 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      00A8DD C3 00                    1 	.word LINK 
                           002FD7     2 	LINK=.
      002FD7                          3 UBOUND:
      00A8DF 1E                       4 	.byte 6+F_IFUNC   	
      00A8E0 24 16 1E 05 72 F0        5 	.ascii "UBOUND"
      00A8E6 03 1F                    6 	.word UBOUND_IDX 
      002FE0                       4493 	_dict_entry,4,TONE,TONE_IDX;tone  
      00A8E8 05 A6                    1 	.word LINK 
                           002FE2     2 	LINK=.
      002FE2                          3 TONE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



      00A8EA 80                       4 	.byte 4   	
      00A8EB A3 00 80 24              5 	.ascii "TONE"
      00A8EF 01 9F                    6 	.word TONE_IDX 
      002FE9                       4494 	_dict_entry,2,TO,TO_IDX;to
      00A8F1 6B 04                    1 	.word LINK 
                           002FEB     2 	LINK=.
      002FEB                          3 TO:
      00A8F3 CD                       4 	.byte 2   	
      00A8F4 A8 55                    5 	.ascii "TO"
      00A8F6 20 CE                    6 	.word TO_IDX 
      002FF0                       4495 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00A8F8 5B 06                    1 	.word LINK 
                           002FF2     2 	LINK=.
      002FF2                          3 TIMER:
      00A8FA 90                       4 	.byte 5   	
      00A8FB 85 85 81 42 43           5 	.ascii "TIMER"
      00A900 43 61                    6 	.word TIMER_IDX 
      002FFA                       4496 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00A902 6E 27                    1 	.word LINK 
                           002FFC     2 	LINK=.
      002FFC                          3 TIMEOUT:
      00A904 74                       4 	.byte 7+F_IFUNC   	
      00A905 20 66 6C 61 73 68 20     5 	.ascii "TIMEOUT"
      00A90C 61 70                    6 	.word TMROUT_IDX 
      003006                       4497 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00A90E 70 6C                    1 	.word LINK 
                           003008     2 	LINK=.
      003008                          3 TICKS:
      00A910 69                       4 	.byte 5+F_IFUNC   	
      00A911 63 61 74 69 6F           5 	.ascii "TICKS"
      00A916 6E 2C                    6 	.word TICKS_IDX 
      003010                       4498 	_dict_entry,4,STOP,STOP_IDX;stop 
      00A918 20 61                    1 	.word LINK 
                           003012     2 	LINK=.
      003012                          3 STOP:
      00A91A 6C                       4 	.byte 4   	
      00A91B 72 65 61 64              5 	.ascii "STOP"
      00A91F 79 20                    6 	.word STOP_IDX 
      003019                       4499 	_dict_entry,4,STEP,STEP_IDX;step 
      00A921 6F 6E                    1 	.word LINK 
                           00301B     2 	LINK=.
      00301B                          3 STEP:
      00A923 65                       4 	.byte 4   	
      00A924 20 69 6E 20              5 	.ascii "STEP"
      00A928 46 4C                    6 	.word STEP_IDX 
      003022                       4500 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      00A92A 41 53                    1 	.word LINK 
                           003024     2 	LINK=.
      003024                          3 SPIWR:
      00A92C 48                       4 	.byte 5   	
      00A92D 0A 75 73 65 20           5 	.ascii "SPIWR"
      00A932 45 52                    6 	.word SPIWR_IDX 
      00302C                       4501 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00A934 41 53                    1 	.word LINK 
                           00302E     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



      00302E                          3 SPISEL:
      00A936 45                       4 	.byte 6   	
      00A937 20 5C 46 20 62 65        5 	.ascii "SPISEL"
      00A93D 66 6F                    6 	.word SPISEL_IDX 
      003037                       4502 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      00A93F 72 65                    1 	.word LINK 
                           003039     2 	LINK=.
      003039                          3 SPIRD:
      00A941 00                       4 	.byte 5+F_IFUNC   	
      00A942 4E 6F 20 61 70           5 	.ascii "SPIRD"
      00A947 70 6C                    6 	.word SPIRD_IDX 
      003041                       4503 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      00A949 69 63                    1 	.word LINK 
                           003043     2 	LINK=.
      003043                          3 SPIEN:
      00A94B 61                       4 	.byte 5   	
      00A94C 74 69 6F 6E 20           5 	.ascii "SPIEN"
      00A951 69 6E                    6 	.word SPIEN_IDX 
      00304B                       4504 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      00A953 20 52                    1 	.word LINK 
                           00304D     2 	LINK=.
      00304D                          3 SLEEP:
      00A955 41                       4 	.byte 5   	
      00A956 4D 00 45 45 50           5 	.ascii "SLEEP"
      00A958 00 8E                    6 	.word SLEEP_IDX 
      003055                       4505     _dict_entry,4,SIZE,SIZE_IDX; cmd_size 
      00A958 CD 9B                    1 	.word LINK 
                           003057     2 	LINK=.
      003057                          3 SIZE:
      00A95A 13                       4 	.byte 4   	
      00A95B A1 84 27 03              5 	.ascii "SIZE"
      00A95F CC 97                    6 	.word SIZE_IDX 
      00305E                       4506 	_dict_entry,4,SAVE,SAVE_IDX ;save_app 
      00A961 29 90                    1 	.word LINK 
                           003060     2 	LINK=.
      003060                          3 SAVE:
      00A963 F6                       4 	.byte 4   	
      00A964 93 EE 01 72              5 	.ascii "SAVE"
      00A968 A9 00                    6 	.word SAVE_IDX 
      003067                       4507 	_dict_entry 3,RUN,RUN_IDX;run
      00A96A 03 C7                    1 	.word LINK 
                           003069     2 	LINK=.
      003069                          3 RUN:
      00A96C 00                       4 	.byte 3   	
      00A96D 19 CF 00                 5 	.ascii "RUN"
      00A970 1A 8A                    6 	.word RUN_IDX 
      00A971                       4508 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      00A971 CD 98                    1 	.word LINK 
                           003071     2 	LINK=.
      003071                          3 RSHIFT:
      00A973 2A                       4 	.byte 6+F_IFUNC   	
      00A974 A1 08 27 02 20 20        5 	.ascii "RSHIFT"
      00A97A CD 9B                    6 	.word RSHIFT_IDX 
      00307A                       4509 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      00A97C 13 A1                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



                           00307C     2 	LINK=.
      00307C                          3 RND:
      00A97E 84                       4 	.byte 3+F_IFUNC   	
      00A97F 27 03 CC                 5 	.ascii "RND"
      00A982 97 29                    6 	.word RND_IDX 
      003082                       4510 	_dict_entry,6,RETURN,RET_IDX;return 
      00A984 90 F6                    1 	.word LINK 
                           003084     2 	LINK=.
      003084                          3 RETURN:
      00A986 93                       4 	.byte 6   	
      00A987 EE 01 72 A9 00 03        5 	.ascii "RETURN"
      00A98D 9F 5F                    6 	.word RET_IDX 
      00308D                       4511 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00A98F CD 88                    1 	.word LINK 
                           00308F     2 	LINK=.
      00308F                          3 RESTORE:
      00A991 62                       4 	.byte 7   	
      00A992 AE 00 01 CD 89 32 20     5 	.ascii "RESTORE"
      00A999 D7 82                    6 	.word REST_IDX 
      00A99A                       4512 	_dict_entry 3,REM,REM_IDX;remark 
      00A99A 81 8F                    1 	.word LINK 
                           00309B     2 	LINK=.
      00A99B                          3 REM:
      00A99B CD                       4 	.byte 3   	
      00A99C 99 E3 A1                 5 	.ascii "REM"
      00A99F 01 27                    6 	.word REM_IDX 
      0030A1                       4513 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      00A9A1 03 CC                    1 	.word LINK 
                           0030A3     2 	LINK=.
      0030A3                          3 REBOOT:
      00A9A3 97                       4 	.byte 6   	
      00A9A4 29 90 F6 93 EE 01        5 	.ascii "REBOOT"
      00A9AA 72 A9                    6 	.word RBT_IDX 
      0030AC                       4514 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      00A9AC 00 03                    1 	.word LINK 
                           0030AE     2 	LINK=.
      0030AE                          3 READ:
      00A9AE 9F                       4 	.byte 4+F_IFUNC   	
      00A9AF A4 7F 81 44              5 	.ascii "READ"
      00A9B2 00 7C                    6 	.word READ_IDX 
      0030B5                       4515 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      00A9B2 A6 06                    1 	.word LINK 
                           0030B7     2 	LINK=.
      0030B7                          3 QKEY:
      00A9B4 CD                       4 	.byte 4+F_IFUNC   	
      00A9B5 99 D6 CD 98              5 	.ascii "QKEY"
      00A9B9 2A A1                    6 	.word QKEY_IDX 
      0030BE                       4516 	_dict_entry,5+F_IFUNC,PORTI,PRTI_IDX;const_porti 
      00A9BB 02 27                    1 	.word LINK 
                           0030C0     2 	LINK=.
      0030C0                          3 PORTI:
      00A9BD 0E                       4 	.byte 5+F_IFUNC   	
      00A9BE A1 04 27 12 A1           5 	.ascii "PORTI"
      00A9C3 82 27                    6 	.word PRTI_IDX 
      0030C8                       4517 	_dict_entry,5+F_IFUNC,PORTH,PRTH_IDX;const_porth 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



      00A9C5 03 CC                    1 	.word LINK 
                           0030CA     2 	LINK=.
      0030CA                          3 PORTH:
      00A9C7 97                       4 	.byte 5+F_IFUNC   	
      00A9C8 29 4F 52 54 48           5 	.ascii "PORTH"
      00A9C9 00 76                    6 	.word PRTH_IDX 
      0030D2                       4518 	_dict_entry,5+F_IFUNC,PORTG,PRTG_IDX;const_portg 
      00A9C9 FD 20                    1 	.word LINK 
                           0030D4     2 	LINK=.
      0030D4                          3 PORTG:
      00A9CB 0B                       4 	.byte 5+F_IFUNC   	
      00A9CC 50 4F 52 54 47           5 	.ascii "PORTG"
      00A9CC F6 88                    6 	.word PRTG_IDX 
      0030DC                       4519 	_dict_entry,5+F_IFUNC,PORTF,PRTF_IDX;const_portf
      00A9CE CD 98                    1 	.word LINK 
                           0030DE     2 	LINK=.
      0030DE                          3 PORTF:
      00A9D0 50                       4 	.byte 5+F_IFUNC   	
      00A9D1 84 20 03 54 46           5 	.ascii "PORTF"
      00A9D4 00 72                    6 	.word PRTF_IDX 
      0030E6                       4520 	_dict_entry,5+F_IFUNC,PORTE,PRTE_IDX;const_porte
      00A9D4 CD 98                    1 	.word LINK 
                           0030E8     2 	LINK=.
      0030E8                          3 PORTE:
      00A9D6 79                       4 	.byte 5+F_IFUNC   	
      00A9D7 5F 02 72 A2 00           5 	.ascii "PORTE"
      00A9DC 03 90                    6 	.word PRTE_IDX 
      0030F0                       4521 	_dict_entry,5+F_IFUNC,PORTD,PRTD_IDX;const_portd
      00A9DE F7 90                    1 	.word LINK 
                           0030F2     2 	LINK=.
      0030F2                          3 PORTD:
      00A9E0 EF                       4 	.byte 5+F_IFUNC   	
      00A9E1 01 A6 07 CD 99           5 	.ascii "PORTD"
      00A9E6 D6 6E                    6 	.word PRTD_IDX 
      00A9E7                       4522 	_dict_entry,5+F_IFUNC,PORTC,PRTC_IDX;const_portc
      00A9E7 90 F6                    1 	.word LINK 
                           0030FC     2 	LINK=.
      0030FC                          3 PORTC:
      00A9E9 93                       4 	.byte 5+F_IFUNC   	
      00A9EA EE 01 72 A9 00           5 	.ascii "PORTC"
      00A9EF 03 81                    6 	.word PRTC_IDX 
      00A9F1                       4523 	_dict_entry,5+F_IFUNC,PORTB,PRTB_IDX;const_portb
      00A9F1 CD 89                    1 	.word LINK 
                           003106     2 	LINK=.
      003106                          3 PORTB:
      00A9F3 D0                       4 	.byte 5+F_IFUNC   	
      00A9F4 81 4F 52 54 42           5 	.ascii "PORTB"
      00A9F5 00 6A                    6 	.word PRTB_IDX 
      00310E                       4524 	_dict_entry,5+F_IFUNC,PORTA,PRTA_IDX;const_porta 
      00A9F5 5F C6                    1 	.word LINK 
                           003110     2 	LINK=.
      003110                          3 PORTA:
      00A9F7 00                       4 	.byte 5+F_IFUNC   	
      00A9F8 2F C0 00 30 27           5 	.ascii "PORTA"
      00A9FD 03 53                    6 	.word PRTA_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



      003118                       4525 	_dict_entry 5,PRINT,PRT_IDX;print 
      00A9FF A6 FF                    1 	.word LINK 
                           00311A     2 	LINK=.
      00AA01                          3 PRINT:
      00AA01 81                       4 	.byte 5   	
      00AA02 50 52 49 4E 54           5 	.ascii "PRINT"
      00AA02 CD 99                    6 	.word PRT_IDX 
      003122                       4526 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      00AA04 E3 A1                    1 	.word LINK 
                           003124     2 	LINK=.
      003124                          3 POUT:
      00AA06 02                       4 	.byte 4+F_IFUNC   	
      00AA07 27 03 CC 97              5 	.ascii "POUT"
      00AA0B 29 90                    6 	.word POUT_IDX 
      00312B                       4527 	_dict_entry,4,POKE,POKE_IDX;poke 
      00AA0D E6 03                    1 	.word LINK 
                           00312D     2 	LINK=.
      00312D                          3 POKE:
      00AA0F 93                       4 	.byte 4   	
      00AA10 EE 04 A3 50              5 	.ascii "POKE"
      00AA14 00 2B                    6 	.word POKE_IDX 
      003134                       4528 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      00AA16 16 A3                    1 	.word LINK 
                           003136     2 	LINK=.
      003136                          3 PMODE:
      00AA18 50                       4 	.byte 5   	
      00AA19 29 2A 11 89 90           5 	.ascii "PMODE"
      00AA1E F6 93                    6 	.word PMODE_IDX 
      00313E                       4529 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      00AA20 EE 01                    1 	.word LINK 
                           003140     2 	LINK=.
      003140                          3 PINP:
      00AA22 72                       4 	.byte 4+F_IFUNC   	
      00AA23 A9 00 03 72              5 	.ascii "PINP"
      00AA27 FB 01                    6 	.word PINP_IDX 
      003147                       4530 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      00AA29 5B 02                    1 	.word LINK 
                           003149     2 	LINK=.
      003149                          3 PEEK:
      00AA2B 4F                       4 	.byte 4+F_IFUNC   	
      00AA2C 81 45 45 4B              5 	.ascii "PEEK"
      00AA2D 00 5E                    6 	.word PEEK_IDX 
      003150                       4531 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      00AA2D A6 0A                    1 	.word LINK 
                           003152     2 	LINK=.
      003152                          3 PAUSE:
      00AA2F CC                       4 	.byte 5   	
      00AA30 97 2B 55 53 45           5 	.ascii "PAUSE"
      00AA32 00 5A                    6 	.word PAUSE_IDX 
      00315A                       4532 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      00AA32 CE B6                    1 	.word LINK 
                           00315C     2 	LINK=.
      00315C                          3 PAD:
      00AA34 80                       4 	.byte 3+F_IFUNC   	
      00AA35 A3 10 93                 5 	.ascii "PAD"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



      00AA38 27 08                    6 	.word PAD_IDX 
      003162                       4533 	_dict_entry,2+F_OR,OR,OR_IDX; OR operator 
      00AA3A CE B6                    1 	.word LINK 
                           003164     2 	LINK=.
      003164                          3 OR:
      00AA3C 82                       4 	.byte 2+F_OR   	
      00AA3D 1C B6                    5 	.ascii "OR"
      00AA3F 84 20                    6 	.word OR_IDX 
      003169                       4534 	_dict_entry,2,ON,ON_IDX; cmd_on 
      00AA41 03 AE                    1 	.word LINK 
                           00316B     2 	LINK=.
      00316B                          3 ON:
      00AA43 B6                       4 	.byte 2   	
      00AA44 80 4F                    5 	.ascii "ON"
      00AA46 81 B6                    6 	.word ON_IDX 
      00AA47                       4535 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      00AA47 89 90                    1 	.word LINK 
                           003172     2 	LINK=.
      003172                          3 ODR:
      00AA49 89                       4 	.byte 3+F_IFUNC   	
      00AA4A CD 99 E3                 5 	.ascii "ODR"
      00AA4D A1 01                    6 	.word ODR_IDX 
      003178                       4536 	_dict_entry,3+F_NOT,NOT,NOT_IDX;NOT operator
      00AA4F 27 07                    1 	.word LINK 
                           00317A     2 	LINK=.
      00317A                          3 NOT:
      00AA51 A1                       4 	.byte 3+F_NOT   	
      00AA52 02 27 03                 5 	.ascii "NOT"
      00AA55 CC 97                    6 	.word NOT_IDX 
      003180                       4537 	_dict_entry,4,NEXT,NEXT_IDX;next 
      00AA57 29 88                    1 	.word LINK 
                           003182     2 	LINK=.
      003182                          3 NEXT:
      00AA59 90                       4 	.byte 4   	
      00AA5A F6 93 EE 01              5 	.ascii "NEXT"
      00AA5E 72 A9                    6 	.word NEXT_IDX 
      003189                       4538 	_dict_entry,3,NEW,NEW_IDX;new
      00AA60 00 03                    1 	.word LINK 
                           00318B     2 	LINK=.
      00318B                          3 NEW:
      00AA62 90                       4 	.byte 3   	
      00AA63 93 84 A1                 5 	.ascii "NEW"
      00AA66 01 27                    6 	.word NEW_IDX 
      003191                       4539 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      00AA68 0A 90                    1 	.word LINK 
                           003193     2 	LINK=.
      003193                          3 LSHIFT:
      00AA6A F6                       4 	.byte 6+F_IFUNC   	
      00AA6B 93 EE 01 72 A9 00        5 	.ascii "LSHIFT"
      00AA71 03 51                    6 	.word LSHIFT_IDX 
      00319C                       4540 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      00AA73 90 FD                    1 	.word LINK 
                           00319E     2 	LINK=.
      00319E                          3 LOG:
      00AA75 88                       4 	.byte 3+F_IFUNC   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



      00AA76 90 9F 72                 5 	.ascii "LOG"
      00AA79 A2 00                    6 	.word LOG_IDX 
      0031A4                       4541 	_dict_entry 4,LIST,LIST_IDX;list
      00AA7B 03 90                    1 	.word LINK 
                           0031A6     2 	LINK=.
      0031A6                          3 LIST:
      00AA7D F7                       4 	.byte 4   	
      00AA7E 90 EF 01 84              5 	.ascii "LIST"
      00AA82 90 85                    6 	.word LIST_IDX 
      0031AD                       4542 	_dict_entry 3,LET,LET_IDX;let 
      00AA84 85 81                    1 	.word LINK 
                           0031AF     2 	LINK=.
      00AA86                          3 LET:
      00AA86 72                       4 	.byte 3   	
      00AA87 0D 52 30                 5 	.ascii "LET"
      00AA8A FB 8E                    6 	.word LET_IDX 
      0031B5                       4543 	_dict_entry,3+F_CFUNC,KEY,KEY_IDX;key 
      00AA8C CC 81                    1 	.word LINK 
                           0031B7     2 	LINK=.
      0031B7                          3 KEY:
      00AA8E 43                       4 	.byte 3+F_CFUNC   	
      00AA8F 4B 45 59                 5 	.ascii "KEY"
      00AA8F 72 0D                    6 	.word KEY_IDX 
      0031BD                       4544 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      00AA91 52 30                    1 	.word LINK 
                           0031BF     2 	LINK=.
      0031BF                          3 IWDGREF:
      00AA93 FB                       4 	.byte 7   	
      00AA94 72 16 00 23 8E 81 46     5 	.ascii "IWDGREF"
      00AA9A 00 46                    6 	.word IWDGREF_IDX 
      0031C9                       4545 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      00AA9A CD 9B                    1 	.word LINK 
                           0031CB     2 	LINK=.
      0031CB                          3 IWDGEN:
      00AA9C 13                       4 	.byte 6   	
      00AA9D A1 84 27 03 CC 97        5 	.ascii "IWDGEN"
      00AAA3 29 90                    6 	.word IWDGEN_IDX 
      0031D4                       4546 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      00AAA5 F6 93                    1 	.word LINK 
                           0031D6     2 	LINK=.
      0031D6                          3 INVERT:
      00AAA7 EE                       4 	.byte 6+F_IFUNC   	
      00AAA8 01 72 A9 00 03 54        5 	.ascii "INVERT"
      00AAAD 00 42                    6 	.word INVERT_IDX 
      0031DF                       4547 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      00AAAD CF 00                    1 	.word LINK 
                           0031E1     2 	LINK=.
      0031E1                          3 INPUT:
      00AAAF 13                       4 	.byte 5   	
      00AAB0 CE 00 13 5D 27           5 	.ascii "INPUT"
      00AAB5 03 8F                    6 	.word INPUT_IDX 
      0031E9                       4548 	_dict_entry,2,IF,IF_IDX;if 
      00AAB7 26 F7                    1 	.word LINK 
                           0031EB     2 	LINK=.
      00AAB9                          3 IF:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



      00AAB9 81                       4 	.byte 2   	
      00AABA 49 46                    5 	.ascii "IF"
      00AABA CD 9B                    6 	.word IF_IDX 
      0031F0                       4549 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      00AABC 13 A1                    1 	.word LINK 
                           0031F2     2 	LINK=.
      0031F2                          3 IDR:
      00AABE 84                       4 	.byte 3+F_IFUNC   	
      00AABF 27 03 CC                 5 	.ascii "IDR"
      00AAC2 97 29                    6 	.word IDR_IDX 
      0031F8                       4550 	_dict_entry,3,HEX,HEX_IDX;hex_base
      00AAC4 90 F6                    1 	.word LINK 
                           0031FA     2 	LINK=.
      0031FA                          3 HEX:
      00AAC6 93                       4 	.byte 3   	
      00AAC7 EE 01 72                 5 	.ascii "HEX"
      00AACA A9 00                    6 	.word HEX_IDX 
      003200                       4551 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      00AACC 03 FA                    1 	.word LINK 
                           003202     2 	LINK=.
      00AACD                          3 GOTO:
      00AACD A3                       4 	.byte 4   	
      00AACE 14 00 2B 0C              5 	.ascii "GOTO"
      00AAD2 35 0F                    6 	.word GOTO_IDX 
      003209                       4552 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      00AAD4 50 F2                    1 	.word LINK 
                           00320B     2 	LINK=.
      00320B                          3 GOSUB:
      00AAD6 A6                       4 	.byte 5   	
      00AAD7 1E 62 A6 10 62           5 	.ascii "GOSUB"
      00AADC 20 1E                    6 	.word GOSUB_IDX 
      00AADE                       4553 	_dict_entry,3,GET,GET_IDX; cmd_get 
      00AADE A3 08                    1 	.word LINK 
                           003215     2 	LINK=.
      003215                          3 GET:
      00AAE0 00                       4 	.byte 3   	
      00AAE1 2B 09 35                 5 	.ascii "GET"
      00AAE4 0E 50                    6 	.word GET_IDX 
      00321B                       4554 	_dict_entry,4+F_IFUNC,FREE,FREE_IDX;free
      00AAE6 F2 A6                    1 	.word LINK 
                           00321D     2 	LINK=.
      00321D                          3 FREE:
      00AAE8 50                       4 	.byte 4+F_IFUNC   	
      00AAE9 62 20 10 45              5 	.ascii "FREE"
      00AAEC 00 8C                    6 	.word FREE_IDX 
      003224                       4555 	_dict_entry,3,FOR,FOR_IDX;for 
      00AAEC 35 07                    1 	.word LINK 
                           003226     2 	LINK=.
      003226                          3 FOR:
      00AAEE 50                       4 	.byte 3   	
      00AAEF F2 4F 52                 5 	.ascii "FOR"
      00AAF0 00 34                    6 	.word FOR_IDX 
      00322C                       4556 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      00AAF0 A3 00                    1 	.word LINK 
                           00322E     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



      00322E                          3 FCPU:
      00AAF2 40                       4 	.byte 4   	
      00AAF3 23 07 72 5C              5 	.ascii "FCPU"
      00AAF7 50 F2                    6 	.word FCPU_IDX 
      003235                       4557 	_dict_entry,5,ERASE,ERASE_IDX; erase 
      00AAF9 54 20                    1 	.word LINK 
                           003237     2 	LINK=.
      003237                          3 ERASE:
      00AAFB F4                       4 	.byte 5   	
      00AAFC 45 52 41 53 45           5 	.ascii "ERASE"
      00AAFC 9F 4A                    6 	.word ERASE_IDX 
      00323F                       4558 	_dict_entry,3,END,END_IDX;cmd_end  
      00AAFE 27 01                    1 	.word LINK 
                           003241     2 	LINK=.
      003241                          3 END:
      00AB00 4A                       4 	.byte 3   	
      00AB01 45 4E 44                 5 	.ascii "END"
      00AB01 A4 3E                    6 	.word END_IDX 
      003247                       4559 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      00AB03 C7 50                    1 	.word LINK 
                           003249     2 	LINK=.
      003249                          3 EEPROM:
      00AB05 F1                       4 	.byte 6+F_IFUNC   	
      00AB06 72 18 50 F0 8E 81        5 	.ascii "EEPROM"
      00AB0C 00 2A                    6 	.word EEPROM_IDX 
      003252                       4560 	_dict_entry,6+F_IFUNC,EEFREE,EEFREE_IDX; func_eefree 
      00AB0C C6 00                    1 	.word LINK 
                           003254     2 	LINK=.
      003254                          3 EEFREE:
      00AB0E 10                       4 	.byte 6+F_IFUNC   	
      00AB0F CE 00 11 81 45 45        5 	.ascii "EEFREE"
      00AB13 00 BC                    6 	.word EEFREE_IDX 
      00325D                       4561 	_dict_entry,4,EDIT,EDIT_IDX ; edit 
      00AB13 CD 99                    1 	.word LINK 
                           00325F     2 	LINK=.
      00325F                          3 EDIT:
      00AB15 E3                       4 	.byte 4   	
      00AB16 A1 01 27 03              5 	.ascii "EDIT"
      00AB1A CC 97                    6 	.word EDIT_IDX 
      003266                       4562 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      00AB1C 29 5F                    1 	.word LINK 
                           003268     2 	LINK=.
      00AB1D                          3 DWRITE:
      00AB1D CD                       4 	.byte 6+F_CMD   	
      00AB1E 82 5F 90 F6 93 EE        5 	.ascii "DWRITE"
      00AB24 01 72                    6 	.word DWRITE_IDX 
      003271                       4563 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      00AB26 A9 00                    1 	.word LINK 
                           003273     2 	LINK=.
      003273                          3 DREAD:
      00AB28 03                       4 	.byte 5+F_IFUNC   	
      00AB29 81 52 45 41 44           5 	.ascii "DREAD"
      00AB2A 00 24                    6 	.word DREAD_IDX 
      00327B                       4564 	_dict_entry,2,DO,DO_IDX;do_loop
      00AB2A CD 99                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



                           00327D     2 	LINK=.
      00327D                          3 DO:
      00AB2C E3                       4 	.byte 2   	
      00AB2D A1 02                    5 	.ascii "DO"
      00AB2F 27 03                    6 	.word DO_IDX 
      003282                       4565 	_dict_entry,3,DEC,DEC_IDX;dec_base
      00AB31 CC 97                    1 	.word LINK 
                           003284     2 	LINK=.
      003284                          3 DEC:
      00AB33 29                       4 	.byte 3   	
      00AB34 90 F6 93                 5 	.ascii "DEC"
      00AB37 EE 01                    6 	.word DEC_IDX 
      00328A                       4566 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      00AB39 72 A9                    1 	.word LINK 
                           00328C     2 	LINK=.
      00328C                          3 DDR:
      00AB3B 00                       4 	.byte 3+F_IFUNC   	
      00AB3C 03 90 93                 5 	.ascii "DDR"
      00AB3F 90 F6                    6 	.word DDR_IDX 
      003292                       4567 	_dict_entry,4,DATA,DATA_IDX;data  
      00AB41 93 EE                    1 	.word LINK 
                           003294     2 	LINK=.
      003294                          3 DATA:
      00AB43 01                       4 	.byte 4   	
      00AB44 90 5D 27 07              5 	.ascii "DATA"
      00AB48 98 59                    6 	.word DATA_IDX 
      00329B                       4568 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      00AB4A 49 90                    1 	.word LINK 
                           00329D     2 	LINK=.
      00329D                          3 CRL:
      00AB4C 5A                       4 	.byte 3+F_IFUNC   	
      00AB4D 26 F9 90                 5 	.ascii "CRL"
      00AB50 F7 90                    6 	.word CRL_IDX 
      0032A3                       4569 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      00AB52 EF 01                    1 	.word LINK 
                           0032A5     2 	LINK=.
      0032A5                          3 CRH:
      00AB54 A6                       4 	.byte 3+F_IFUNC   	
      00AB55 84 81 48                 5 	.ascii "CRH"
      00AB57 00 18                    6 	.word CRH_IDX 
      0032AB                       4570 	_dict_entry,5,CONST,CONST_IDX; cmd_const 
      00AB57 CD 99                    1 	.word LINK 
                           0032AD     2 	LINK=.
      0032AD                          3 CONST:
      00AB59 E3                       4 	.byte 5   	
      00AB5A A1 02 27 03 CC           5 	.ascii "CONST"
      00AB5F 97 29                    6 	.word CONST_IDX 
      0032B5                       4571 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      00AB61 90 F6                    1 	.word LINK 
                           0032B7     2 	LINK=.
      0032B7                          3 CHAR:
      00AB63 93                       4 	.byte 4+F_CFUNC   	
      00AB64 EE 01 72 A9              5 	.ascii "CHAR"
      00AB68 00 03                    6 	.word CHAR_IDX 
      0032BE                       4572 	_dict_entry,3,BYE,BYE_IDX;bye 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



      00AB6A 90 93                    1 	.word LINK 
                           0032C0     2 	LINK=.
      0032C0                          3 BYE:
      00AB6C 90                       4 	.byte 3   	
      00AB6D F6 93 EE                 5 	.ascii "BYE"
      00AB70 01 90                    6 	.word BYE_IDX 
      0032C6                       4573 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      00AB72 5D 27                    1 	.word LINK 
                           0032C8     2 	LINK=.
      0032C8                          3 BTOGL:
      00AB74 07                       4 	.byte 5   	
      00AB75 98 56 46 90 5A           5 	.ascii "BTOGL"
      00AB7A 26 F9                    6 	.word BTOGL_IDX 
      0032D0                       4574 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      00AB7C 90 F7                    1 	.word LINK 
                           0032D2     2 	LINK=.
      0032D2                          3 BTEST:
      00AB7E 90                       4 	.byte 5+F_IFUNC   	
      00AB7F EF 01 A6 84 81           5 	.ascii "BTEST"
      00AB84 00 10                    6 	.word BTEST_IDX 
      0032DA                       4575 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      00AB84 A6 84                    1 	.word LINK 
                           0032DC     2 	LINK=.
      0032DC                          3 BSET:
      00AB86 CD                       4 	.byte 4   	
      00AB87 99 D6 CD 98              5 	.ascii "BSET"
      00AB8B 69 9F                    6 	.word BSET_IDX 
      0032E3                       4576 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      00AB8D A4 07                    1 	.word LINK 
                           0032E5     2 	LINK=.
      0032E5                          3 BRES:
      00AB8F C7                       4 	.byte 4   	
      00AB90 50 C6 81 53              5 	.ascii "BRES"
      00AB93 00 0C                    6 	.word BRES_IDX 
      0032EC                       4577 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      00AB93 52 01                    1 	.word LINK 
                           0032EE     2 	LINK=.
      0032EE                          3 BIT:
      00AB95 CD                       4 	.byte 3+F_IFUNC   	
      00AB96 99 E8 A1                 5 	.ascii "BIT"
      00AB99 02 27                    6 	.word BIT_IDX 
      0032F4                       4578 	_dict_entry,3,AWU,AWU_IDX;awu 
      00AB9B 03 CC                    1 	.word LINK 
                           0032F6     2 	LINK=.
      0032F6                          3 AWU:
      00AB9D 97                       4 	.byte 3   	
      00AB9E 29 90 F6                 5 	.ascii "AWU"
      00ABA1 93 EE                    6 	.word AWU_IDX 
      0032FC                       4579 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      00ABA3 01 72                    1 	.word LINK 
                           0032FE     2 	LINK=.
      0032FE                          3 ASC:
      00ABA5 A9                       4 	.byte 3+F_IFUNC   	
      00ABA6 00 03 CF                 5 	.ascii "ASC"
      00ABA9 00 1A                    6 	.word ASC_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal [24-Bits]



      003304                       4580 	_dict_entry,3+F_AND,AND,AND_IDX ; AND operator 
      00ABAB 90 F6                    1 	.word LINK 
                           003306     2 	LINK=.
      003306                          3 AND:
      00ABAD 93                       4 	.byte 3+F_AND   	
      00ABAE EE 01 72                 5 	.ascii "AND"
      00ABB1 A9 00                    6 	.word AND_IDX 
      00330C                       4581 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      00ABB3 03 CD                    1 	.word LINK 
                           00330E     2 	LINK=.
      00330E                          3 ADCREAD:
      00ABB5 AB                       4 	.byte 7+F_IFUNC   	
      00ABB6 F2 6B 01 A6 01 0D 01     5 	.ascii "ADCREAD"
      00ABBD 27 0D                    6 	.word ADCREAD_IDX 
      003318                       4582 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      00ABBF 48 0A                    1 	.word LINK 
                           00331A     2 	LINK=.
      00331A                          3 ADCON:
      00ABC1 01                       4 	.byte 5   	
      00ABC2 26 FB 6B 01 7B           5 	.ascii "ADCON"
      00ABC7 01 EA                    6 	.word ADCON_IDX 
      003322                       4583 kword_dict::
      003322                       4584 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      00ABC9 03 E7                    1 	.word LINK 
                           003324     2 	LINK=.
      003324                          3 ABS:
      00ABCB 03                       4 	.byte 3+F_IFUNC   	
      00ABCC A6 01 C1                 5 	.ascii "ABS"
      00ABCF 00 0F                    6 	.word ABS_IDX 
                                   4585 
                                   4586 ;comands and fonctions address table 	
      00332A                       4587 code_addr::
      00ABD1 27 10 7B 01 43 E4 04  4588 	.word abs,power_adc,analog_read,ascii,awu,bitmask ; 0..7
             E7 04 7B 01 43
      00ABDD E4 02 E7 02 20 0C 21  4589 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             C4 2A 06 29 1B 2D F8
      00ABE3 2D F3 2E 0C 2D EE 1C  4590 	.word const_cr1,data,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
             25 2D 74 26 75 26 AC
      00ABE3 7B 01 EA 02 E7 02 7B  4591 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto ; 24..31 
             01 EA 04 E7 04 22 79
             24 AF 24 95
      00ABEF 1C 20 2D E9 22 5F 20  4592 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             9D 2D 5E 2C C8 2D 06
             29 71
      00ABEF 5B 01 81 ED 2D 0B 2A  4593 	.word let,list,log2,lshift,next,new ; 40..47
             AA 23 25 27 43
      00ABF2 2D E4 2F 8E 2A 1A 2B  4594 	.word const_odr,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             13 22 3E 2E 02
      00ABF2 58 1C AC 02 FE 9F 88  4595 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             5E A6 05 42 1C 50 00
             84 81
      00AC02 2D D0 2D D5 2D DA 2D  4596 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             DF 29 75 2E 8A 00 C3
             21 3C
      00AC02 03 06 03 05 04 00 02  4597 	.word restore,return, random,rshift,run,free ; 72..79
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 227.
Hexadecimal  01-Bits]



             D7 24 F3 1C 2A
      00AC0A 06 00 02 02 02 03 03  4598 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             01 03 03 02 04 04 05
             02 06
      00AC1A 02 07 02 05 04 02 04  4599 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             01 1C 73 29 B2 2D 87
             29 C7
      00AC22 21 42 2C 3D 28 D8 1C  4600 	.word wait,words,write,cmd_size,cmd_on,cmd_get,cmd_const ; 96..99
             46 24 09 25 56 1D A9
      00AC22 CD 99 E3 A1           4601 	.word func_eefree,0 
                                   4602 
                                   4603 
                                   4604 
                                   4605 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
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
      0033EA                         30 test:
      0033EA                         31     _vars VSIZE 
      00AC26 01 27            [ 2]    1     sub sp,#VSIZE 
      00AC28 03 CC 97         [ 2]   32     ldw x,#LOOP_CNT
      00AC2B 29 03            [ 2]   33     ldw (CNTR,sp),x  
      00AC2C CE 00 0F         [ 2]   34     ldw x,ticks 
      00AC2C 90 F6            [ 2]   35     ldw (T,sp),x
      0033F6                         36 1$: ; test add24 
      00AC2E 93 EE            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00AC30 01 72 A9         [ 2]   38     ldw x,#VAL1&0XFFFF
      00AC33 00 03 89         [ 1]   39     ld acc24,a 
      00AC36 88 A6 80         [ 2]   40     ldw acc24+1,x  
      00AC39 15 01            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00AC3B 27 05 A6         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00AC3E 0A CC 97         [ 4]   43     call add24 
      00AC41 2B 03            [ 2]   44     ldw x,(CNTR,sp)
      00AC42 1D 00 01         [ 2]   45     subw x,#1
      00AC42 CE 00            [ 2]   46     ldw (CNTR,sp),x 
      00AC44 15 58            [ 1]   47     jrne 1$
      00AC46 58 58 58         [ 4]   48     call prt_acc24
      00AC49 58 9E            [ 1]   49     ld a,#SPACE 
      00AC4B C8 00 15         [ 4]   50     call putc 
      00AC4E C7 00 0E         [ 2]   51     ldw x,ticks 
      00AC51 9F C8 00         [ 2]   52     subw x,(T,sp)
      00AC54 16 C7 00         [ 4]   53     call prt_i16  
      00AC57 0F CE            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



      00AC59 00 17 CF         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00AC5C 00 15 CE         [ 2]   58     ldw x,LOOP_CNT
      00AC5F 00 17            [ 2]   59     ldw (CNTR,sp),x 
      00AC61 54 9E C8         [ 2]   60     ldw x,ticks 
      00AC64 00 17            [ 2]   61     ldw (T,sp),x 
      003432                         62 2$: 
      00AC66 C7 00            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00AC68 17 9F C8         [ 2]   64     ldw x,#VAL1&0XFFFF
      00AC6B 00 18 C7         [ 1]   65     ld acc24,a 
      00AC6E 00 18 CE         [ 2]   66     ldw acc24+1,x  
      00AC71 00 0E            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00AC73 54 54 54         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00AC76 9E C8 00         [ 4]   69     call mul24 
      00AC79 0E C7            [ 2]   70     ldw x,(CNTR,sp)
      00AC7B 00 0E 9F         [ 2]   71     subw x,#1
      00AC7E C8 00            [ 2]   72     ldw (CNTR,sp),x 
      00AC80 0F C7            [ 1]   73     jrne 2$ 
      00AC82 00 0F C8         [ 4]   74    call prt_acc24 
      00AC85 00 18            [ 1]   75    ld a,#SPACE 
      00AC87 97 C6 00         [ 4]   76    call putc 
      00AC8A 0E C8 00         [ 2]   77     ldw x,ticks 
      00AC8D 17 95 CF         [ 2]   78     subw x,(T,sp)
      00AC90 00 17 C6         [ 4]   79     call prt_i16 
      00AC93 00 16            [ 1]   80     ld a,#CR 
      00AC95 A4 7F 72         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00AC98 A2 00 03         [ 2]   83     ldw x,LOOP_CNT
      00AC9B 90 F7            [ 2]   84     ldw (CNTR,sp),x 
      00AC9D 90 EF 01         [ 2]   85     ldw x,ticks 
      00ACA0 84 85            [ 2]   86     ldw (T,sp),x 
      00346E                         87 3$: 
      00ACA2 72 A2            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00ACA4 00 03 90         [ 2]   89     ldw x,#VAL1&0XFFFF
      00ACA7 F7 90 EF         [ 1]   90     ld acc24,a 
      00ACAA 01 CD 84         [ 2]   91     ldw acc24+1,x  
      00ACAD 51 90            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00ACAF F6 93 EE         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00ACB2 01 72 A9         [ 4]   94     call mul24 
      00ACB5 00 03            [ 2]   95     ldw x,(CNTR,sp)
      00ACB7 1C 00 01         [ 2]   96     subw x,#1
      00ACBA A9 00            [ 2]   97     ldw (CNTR,sp),x 
      00ACBC 81 E4            [ 1]   98     jrne 3$ 
      00ACBD CD 18 16         [ 4]   99     call prt_acc24    
      00ACBD 90 89            [ 1]  100     ld a,#SPACE 
      00ACBF 52 03 0F         [ 4]  101     call putc 
      00ACC2 02 0F 03         [ 2]  102     ldw x,ticks 
      00ACC5 90 AE B3         [ 2]  103     subw x,(T,sp)
      00ACC8 A4 93 F6         [ 4]  104     call prt_i16 
      00ACCB A4 0F            [ 1]  105     ld a,#CR 
      00ACCD 6B 01 0C         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00ACD0 03 5C F6         [ 2]  108     ldw x,LOOP_CNT
      00ACD3 CD 89            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
Hexadecimal [24-Bits]



      00ACD5 C0 0C 02         [ 2]  110     ldw x,ticks 
      00ACD8 0A 01            [ 2]  111     ldw (T,sp),x 
      0034AA                        112 4$:
      00ACDA 26 F5            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00ACDC A6 46 11         [ 2]  114     ldw x,#VAL1&0XFFFF
      00ACDF 02 2B 09         [ 1]  115     ld acc24,a 
      00ACE2 A6 20 CD         [ 2]  116     ldw acc24+1,x  
      00ACE5 89 C0            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00ACE7 0C 02 20         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00ACEA 07 A6 0D         [ 4]  119     call mul24 
      00ACED CD 89            [ 2]  120     ldw x,(CNTR,sp)
      00ACEF C0 0F 02         [ 2]  121     subw x,#1
      00ACF2 72 A2            [ 2]  122     ldw (CNTR,sp),x 
      00ACF4 00 02            [ 1]  123     jrne 4$ 
      00ACF6 90 FE 26         [ 4]  124     call prt_acc24 
      00ACF9 CF A6            [ 1]  125     ld a,#SPACE 
      00ACFB 0D CD 89         [ 4]  126     call putc 
      00ACFE C0 5F 7B         [ 2]  127     ldw x,ticks 
      00AD01 03 97 CD         [ 2]  128     subw x,(T,sp)
      00AD04 98 7F AE         [ 4]  129     call prt_i16 
      00AD07 AD 11            [ 1]  130     ld a,#CR 
      00AD09 CD 8A 1D         [ 4]  131     call putc 
                                    132 ; test abs24 
      00AD0C 5B 03 90         [ 2]  133     ldw x,LOOP_CNT
      00AD0F 85 81            [ 2]  134     ldw (CNTR,sp),x 
      00AD11 20 77 6F         [ 2]  135     ldw x,ticks 
      00AD14 72 64            [ 2]  136     ldw (T,sp),x 
      0034E6                        137 5$: 
      00AD16 73 20            [ 1]  138     ld a,#0xff
      00AD18 69 6E 20         [ 2]  139     ldw x,#0xffff
      00AD1B 64 69 63         [ 4]  140     call abs24 
      00AD1E 74 69 6F         [ 1]  141     ld acc24,a 
      00AD21 6E 61 72         [ 2]  142     ldw acc24+1,x
      00AD24 79 0A            [ 2]  143     ldw x,(CNTR,sp)
      00AD26 00 00 01         [ 2]  144     subw x,#1
      00AD27 1F 03            [ 2]  145     ldw (CNTR,sp),x 
      00AD27 CD 99            [ 1]  146     jrne 5$ 
      00AD29 E8 A1 01         [ 4]  147     call prt_acc24 
      00AD2C 27 03            [ 1]  148     ld a,#SPACE 
      00AD2E CC 97 29         [ 4]  149     call putc 
      00AD31 CE 00 0F         [ 2]  150     ldw x,ticks 
      00AD31 90 F6 93         [ 2]  151     subw x,(T,sp)
      00AD34 EE 01 72         [ 4]  152     call prt_i16 
      00350E                        153 6$:
      00AD37 A9 00            [ 1]  154     ld a,#CR 
      00AD39 03 CF 00         [ 4]  155     call putc 
      00AD3C 13 81 59         [ 4]  156     call read_integer 
      00AD3E 55 00 0C 00 18   [ 1]  157     mov farptr,acc24 
      00AD3E 4F CE 00 13 27   [ 1]  158     mov farptr+1,acc16 
      00AD43 01 5F 43 53 81   [ 1]  159     mov farptr+2,acc8 
      00AD48 CD 35 59         [ 4]  160     call read_integer 
      00AD48 CD 99 E8         [ 1]  161     ld a,acc24 
      00AD4B A1 01 27         [ 2]  162     ldw x,acc16 
      00AD4E 03 CC 97 29 90   [ 1]  163     mov acc24,farptr 
      00AD53 F6 93 EE 01 72   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 231.
Hexadecimal [24-Bits]



      00AD58 A9 00 03 4B 00   [ 1]  165     mov acc8,farptr+2 
      00AD5D 35 CC 50         [ 4]  166     call div24 
      00AD60 E0               [ 1]  167     push a 
      00AD61 9E               [ 2]  168     pushw x 
      00AD62 A4 3F 95         [ 4]  169     call prt_acc24 
      00AD65 A3 00            [ 1]  170     ld a,#SPACE 
      00AD67 FF 23 06         [ 4]  171     call putc 
      00AD6A 0C               [ 2]  172     popw x
      00AD6B 01 98 56         [ 2]  173     ldw acc16,x  
      00AD6E 20 F5 35         [ 1]  174     pop acc24 
      00AD71 55 50 E0         [ 4]  175     call prt_acc24
      00AD74 84 C7            [ 2]  176     jra 6$
      003556                        177     _drop VSIZE 
      00AD76 50 E1            [ 2]    1     addw sp,#VSIZE 
      00AD78 9F               [ 4]  178     ret 
                                    179 
                                    180 
      003559                        181 read_integer:
      00AD79 4A 35            [ 1]  182     ld a,#'? 
      00AD7B 55 50 E0         [ 4]  183     call putc  
      00AD7E C7 50 E2 35      [ 1]  184 	clr count  
      00AD82 AA 50 E0         [ 4]  185 	call readln 
      00AD85 81 16 68         [ 2]  186 	ldw x,#tib 
      00AD86 3B 00 03         [ 1]  187 	push count
      00AD86 35 AA            [ 1]  188 	push #0 
      00AD88 50 E0 81         [ 2]  189 	addw x,(1,sp)
      00AD8B 5C               [ 1]  190 	incw x 
      003571                        191 	_drop 2 
      00AD8B CD 99            [ 2]    1     addw sp,#2 
      00AD8D E3 A1 01 27      [ 1]  192 	clr in 
      00AD91 03 CC 97         [ 4]  193 	call get_token
      00AD94 29 84            [ 1]  194 	cp a,#TK_INTGR
      00AD95 27 0F            [ 1]  195 	jreq 3$ 
      00AD95 90 F6            [ 1]  196 	cp a,#TK_MINUS
      00AD97 93 EE 01         [ 4]  197 	call get_token 
      00AD9A 72 A9            [ 1]  198 	cp a,#TK_INTGR 
      00AD9C 00 03            [ 1]  199 	jreq 2$
      00AD9E 4D 26 08         [ 2]  200 	jp syntax_error
      00358A                        201 2$:
      00ADA1 5D 26 05         [ 4]  202 	call neg_acc24  	
      00358D                        203 3$: 
      00ADA4 A6               [ 4]  204     ret 
                                    205 
                                    206 .endif ; DEBUG  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
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
      00ADA5 0A CC                   31 app_sign:  .word 0 ; .ascii "BC"  ; signature 
      00ADA7 97 2B                   32 app_size: .word 0 
      003604                         33 app: 
                                     34 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 233.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     A32     =  000005     |   4 ABS        003324 R
    ABS_IDX =  000000     |     ACK     =  000006     |   4 ADCON      00331A R
    ADCON_ID=  000002     |   4 ADCREAD    00330E R   |     ADCREAD_=  000004 
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
  4 AND        003306 R   |     AND_IDX =  0000FA     |     ARG_OFS =  000002 
    ARROW_LE=  000080     |     ARROW_RI=  000081     |   4 ASC        0032FE R
    ASC_IDX =  000006     |     ATMP    =  000001     |     ATTRIB  =  000002 
  4 AUTO_RUN   000157 R   |   4 AWU        0032F6 R   |   4 AWUHandl   000004 R
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
    BELL    =  000007     |     BINARY  =  000001     |   4 BIT        0032EE R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000A 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  00000D     |   4 BRES       0032E5 R   |     BRES_IDX=  00000C 
    BS      =  000008     |   4 BSET       0032DC R   |     BSET_IDX=  00000E 
    BSIZE   =  000006     |   4 BTEST      0032D2 R   |     BTEST_ID=  000010 
  4 BTOGL      0032C8 R   |     BTOGL_ID=  000012     |     BTW     =  000001 
    BUFPTR  =  000003     |   4 BYE        0032C0 R   |     BYE_IDX =  000014 
    C       =  000001     |     CAN     =  000018     |   4 CANT_DO    002880 R
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
  4 CHAR       0032B7 R   |     CHAR_IDX=  000016     |     CLKOPT  =  004807 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 234.
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
  4 CONST      0032AD R   |   4 CONST_CO   001D26 R   |     CONST_ID=  0000BA 
    CONST_RE=  000005     |     COUNT   =  000003     |     CPOS    =  000003 
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |     CR      =  00000D 
  4 CRH        0032A5 R   |     CRH_IDX =  000018     |   4 CRL        00329D R
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
  4 DATA       003294 R   |     DATA_IDX=  00001C     |     DBG_A   =  000008 
    DBG_CC  =  000009     |     DBG_X   =  000006     |     DBG_Y   =  000004 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   4 DDR        00328C R   |     DDR_IDX =  00001E 
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  4 DEC        003284 R   |     DEC_IDX =  000020     |     DEST    =  000001 
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |     DIVISOR =  000001 
    DIVSOR  =  000001     |     DLE     =  000010     |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   4 DO         00327D R   |     DOLP_ADR=  000003 
    DOLP_INW=  000005     |     DO_IDX  =  000022     |   4 DREAD      003273 R
    DREAD_ID=  000024     |   4 DWRITE     003268 R   |     DWRITE_I=  000026 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
Hexadecimal [24-Bits]

Symbol Table

  4 EDIT       00325F R   |     EDIT_IDX=  000028     |   4 EEFREE     003254 R
    EEFREE_I=  0000BC     |   4 EEPROM     003249 R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_I=  00002A     |     EEPROM_S=  000800 
    EEPTR   =  000003     |     EM      =  000019     |   4 END        003241 R
    END_IDX =  00002C     |     ENQ     =  000005     |     EOF     =  0000FF 
    EOT     =  000004     |   4 ERASE      003237 R   |     ERASE_ID=  00002E 
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_OVER=  000010 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    ETB     =  000017     |     ETX     =  000003     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FBREAK  =  000004     |     FCOMP   =  000005 
  4 FCPU       00322E R   |     FCPU_IDX=  000030     |     FF      =  00000C 
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
  4 FLASH_ME   001ECD R   |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |     FLOOP   =  000002 
    FLSI    =  01F400     |   4 FOR        003226 R   |     FOR_IDX =  000034 
  4 FREE       00321D R   |     FREE_IDX=  00008C     |     FRUN    =  000000 
    FS      =  00001C     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_AND   =  000080     |     F_CFUNC =  000020 
    F_CMD   =  000000     |     F_CONST =  000030     |     F_IFUNC =  000010 
    F_NOT   =  000070     |     F_OR    =  000090     |     F_XOR   =  0000A0 
  4 GET        003215 R   |     GET_IDX =  0000B8     |   4 GOSUB      00320B R
    GOSUB_ID=  000036     |   4 GOTO       003202 R   |     GOTO_IDX=  000038 
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |     GS      =  00001D     |   4 HEX        0031FA R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 236.
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
  4 IDR        0031F2 R   |     IDR_IDX =  00003C     |   4 IF         0031EB R
    IF_IDX  =  00003E     |     IN      =  000005     |     INCR    =  000001 
    INP     =  000000     |   4 INPUT      0031E1 R   |     INPUT_DI=  000000 
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
  4 INVERT     0031D6 R   |     INVERT_I=  000042     |     INW     =  00000B 
    IPOS    =  000001     |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
  4 IWDGEN     0031CB R   |     IWDGEN_I=  000044     |   4 IWDGREF    0031BF R
    IWDGREF_=  000046     |     IWDG_KEY=  000055     |     IWDG_KEY=  0000CC 
    IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |     KCHAR   =  000002     |   4 KEY        0031B7 R
    KEY_END =  000083     |     KEY_IDX =  000048     |     KW_TYPE_=  0000F0 
    LAST    =  000003     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000002 
  4 LET        0031AF R   |     LET_IDX =  00004A     |     LF      =  00000A 
    LIMIT   =  000001     |     LINENO  =  000005     |   4 LINK    =  003324 R
  4 LIST       0031A6 R   |     LIST_IDX=  00004C     |     LL      =  000001 
    LLEN    =  000002     |     LL_HB   =  000001     |     LN_PTR  =  000005 
  4 LOG        00319E R   |     LOG_IDX =  00004E     |     LOOP_CNT=  002710 
  4 LSHIFT     003193 R   |     LSHIFT_I=  000050     |     MAJOR   =  000002 
    MASK    =  000002     |     MAX_LINE=  007FFF     |     MINOR   =  000000 
    MULOP   =  000001     |     N1      =  000004     |     N2      =  000007 
    NAFR    =  004804     |     NAK     =  000015     |     NAMEPTR =  000001 
    NCLKOPT =  004808     |     NEG     =  000001     |   4 NEW        00318B R
    NEW_IDX =  000054     |   4 NEXT       003182 R   |     NEXT_IDX=  000052 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
Hexadecimal [24-Bits]

Symbol Table

    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NLEN    =  000001 
    NLEN_MAS=  00000F     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  4 NOT        00317A R   |     NOT_IDX =  0000F8     |     NOT_OP  =  000001 
  4 NOT_SAVE   001FBF R   |   4 NO_APP     0028C2 R   |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   4 NonHandl   000000 R
  4 ODR        003172 R   |     ODR_IDX =  000056     |   4 ON         00316B R
    ONOFF   =  000003     |     ON_IDX  =  0000B6     |     OP      =  000002 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   4 OR         003164 R   |     OR_IDX  =  0000FC 
    OUTP    =  000001     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVRWR   =  000004 
    PA      =  000000     |   4 PAD        00315C R   |     PAD_IDX =  000058 
    PAD_SIZE=  000080     |   4 PAUSE      003152 R   |     PAUSE_ID=  00005A 
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   4 PEEK       003149 R   |     PEEK_IDX=  00005E 
    PE_BASE =  005014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_BASE =  005019     |     PF_CR1  =  00501C 
    PF_CR2  =  00501D     |     PF_DDR  =  00501B     |     PF_IDR  =  00501A 
    PF_ODR  =  005019     |     PG      =  00001E     |     PG_BASE =  00501E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |     PH      =  000023 
    PH_BASE =  005023     |     PH_CR1  =  005026     |     PH_CR2  =  005027 
    PH_DDR  =  005025     |     PH_IDR  =  005024     |     PH_ODR  =  005023 
    PI      =  000028     |     PINNO   =  000001     |   4 PINP       003140 R
    PINP_IDX=  000060     |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   4 PMODE      003136 R
    PMODE_ID=  00005C     |   4 POKE       00312D R   |     POKE_IDX=  000062 
  4 PORTA      003110 R   |   4 PORTB      003106 R   |   4 PORTC      0030FC R
  4 PORTD      0030F2 R   |   4 PORTE      0030E8 R   |   4 PORTF      0030DE R
  4 PORTG      0030D4 R   |   4 PORTH      0030CA R   |   4 PORTI      0030C0 R
  4 POUT       003124 R   |     POUT_IDX=  000064     |     PREV    =  000001 
  4 PRINT      00311A R   |     PROD    =  000001     |     PROD_SIG=  00000A 
  4 PROG_ADD   001EA3 R   |   4 PROG_SIZ   001EB5 R   |     PRTA_IDX=  000068 
    PRTB_IDX=  00006A     |     PRTC_IDX=  00006C     |     PRTD_IDX=  00006E 
    PRTE_IDX=  000070     |     PRTF_IDX=  000072     |     PRTG_IDX=  000074 
    PRTH_IDX=  000076     |     PRTI_IDX=  000078     |     PRT_IDX =  000066 
    PSIZE   =  000001     |     PSTR    =  000003     |   4 QKEY       0030B7 R
    QKEY_IDX=  00007A     |     QSIGN   =  000005     |     RAM_BASE=  000000 
    RAM_END =  0017FF     |   4 RAM_MEM    001EDE R   |     RAM_SIZE=  001800 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
Hexadecimal [24-Bits]

Symbol Table

    RBT_IDX =  00007E     |   4 READ       0030AE R   |     READ_IDX=  00007C 
  4 REBOOT     0030A3 R   |     RECLEN  =  000005     |   4 REG_A      00055E R
  4 REG_CC     000562 R   |   4 REG_EPC    000551 R   |   4 REG_SP     000567 R
  4 REG_X      00055A R   |   4 REG_Y      000556 R   |     RELOP   =  000001 
  4 REM        00309B R   |     REM_IDX =  000080     |   4 RESTORE    00308F R
    REST_IDX=  000082     |     RETL1   =  000001     |   4 RETURN     003084 R
    RET_ADDR=  000003     |     RET_BPTR=  000003     |     RET_IDX =  000084 
    RET_INW =  000005     |   4 RND        00307C R   |     RND_IDX =  000086 
    ROP     =  004800     |     RS      =  00001E     |   4 RSHIFT     003071 R
    RSHIFT_I=  000088     |     RSIGN   =  000006     |     RST_SR  =  0050B3 
  4 RUN        003069 R   |     RUN_IDX =  00008A     |     RXCHAR  =  000001 
    RX_QUEUE=  000008     |     R_A     =  000007     |     R_CC    =  000008 
    R_X     =  000005     |     R_Y     =  000003     |   4 SAVE       003060 R
    SAVE_IDX=  000032     |     SEPARATE=  000000     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |     SI      =  00000F 
    SIGN    =  000001     |   4 SIGNATUR   00287E R   |   4 SIZE       003057 R
    SIZE_IDX=  0000B4     |     SKIP    =  000005     |   4 SLEEP      00304D R
    SLEEP_ID=  00008E     |     SO      =  00000E     |     SOH     =  000001 
    SPACE   =  000020     |   4 SPIEN      003043 R   |     SPIEN_ID=  000092 
  4 SPIRD      003039 R   |     SPIRD_ID=  000090     |   4 SPISEL     00302E R
    SPISEL_I=  000094     |   4 SPIWR      003024 R   |     SPIWR_ID=  000096 
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
    STACK_EM=  0017FF     |     STACK_SI=  00008C     |   4 STATES     000514 R
  4 STEP       00301B R   |     STEP_IDX=  000098     |   4 STOP       003012 R
    STOP_IDX=  00009A     |     STR     =  000003     |   4 STR_BYTE   001EC6 R
    STX     =  000002     |     SUB     =  00001A     |     SUP     =  000084 
    SWIM_CSR=  007F80     |     SYN     =  000016     |     T       =  000001 
    TAB     =  000009     |     TABW    =  000004     |     TAB_WIDT=  000004 
    TARGET  =  000001     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   4 TICKS      003008 R
    TICKS_ID=  00009C     |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 240.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_CR1=  000001     |     TIM4_CR1=  000002     |     TIM4_EGR=  005343 
    TIM4_EGR=  000000     |     TIM4_IER=  005341     |     TIM4_IER=  000000 
    TIM4_PSC=  005345     |     TIM4_PSC=  000000     |     TIM4_PSC=  000007 
    TIM4_PSC=  000004     |     TIM4_PSC=  000001     |     TIM4_PSC=  000005 
    TIM4_PSC=  000002     |     TIM4_PSC=  000006     |     TIM4_PSC=  000003 
    TIM4_PSC=  000000     |     TIM4_PSC=  000001     |     TIM4_PSC=  000002 
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   4 TIMEOUT    002FFC R
  4 TIMER      002FF2 R   |     TIMER_ID=  00009E     |     TIM_CR1_=  000007 
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
    TK_VAR  =  000085     |     TK_XOR  =  00008A     |     TMROUT_I=  0000A0 
  4 TO         002FEB R   |   4 TONE       002FE2 R   |     TONE_IDX=  0000A4 
    TOWRITE =  000005     |     TO_IDX  =  0000A2     |   4 Timer4Up   000021 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
Hexadecimal [24-Bits]

Symbol Table

    UART_SR_=  000000     |     UART_SR_=  000005     |     UART_SR_=  000006 
    UART_SR_=  000007     |     UBC     =  004801     |   4 UBOUND     002FD7 R
    UBOUND_I=  0000A6     |   4 UBTN_Han   000068 R   |   4 UFLASH     002FCC R
    UFLASH_I=  0000A8     |   4 UNTIL      002FC2 R   |     UNTIL_ID=  0000AA 
    UPDATE  =  000006     |     US      =  00001F     |   4 USER_ABO   000070 R
  4 USR        002FBA R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     USR_IDX =  0000AC     |   4 Uart1RxH   0008CE R
  4 UserButt   000044 R   |     VAL1    =  02FFFF     |     VAL2    =  00002A 
    VAL3    =  000003     |     VAL4    =  0005FF     |     VAL5    =  FFFFFFFD 
    VSIZE   =  000008     |     VT      =  00000B     |   4 WAIT       002FB1 R
    WAIT_IDX=  0000AE     |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  4 WORDS      002FA7 R   |     WORDS_ID=  0000B0     |   4 WRITE      002F9D R
    WRITE_ID=  0000B2     |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XFIRST  =  000001     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   4 XOR        002F95 R   |     XOR_IDX =  0000FE 
    XSAVE   =  000002     |     XSTACK_E=  001773     |     XSTACK_S=  00003C 
    XTEMP   =  000001     |     YSAVE   =  000007     |     YTEMP   =  000003 
  4 abs        002A93 R   |   4 abs24      0001DF R   |   5 acc16      00000D GR
  5 acc24      00000C GR  |   5 acc32      00000B GR  |   5 acc8       00000E GR
  4 accept_c   000BFC R   |   4 add24      00016A R   |   4 add_char   001399 R
  4 add_spac   00116A R   |   4 analog_r   002639 R   |   4 and_cond   001B5A R
  4 and_fact   001B2A R   |   4 app        003604 R   |   4 app_sign   003600 R
  4 app_size   003602 R   |   4 app_spac   003600 GR  |   4 arduino_   002B82 R
  4 arg_list   001968 R   |   5 array_si   000020 R   |   4 ascii      002932 R
  4 at_tst     000FD1 R   |   4 atoi24     0018A1 GR  |   4 atoi_exi   001907 R
  4 awu        002A3A R   |   4 awu02      002A4D R   |   4 bad_port   0029AD R
  5 base       00000A GR  |   5 basicptr   000004 GR  |   4 beep       0025B0 R
  4 beep_1kh   002583 GR  |   4 bin_exit   000E38 R   |   4 bit_rese   0021A1 R
  4 bit_set    00217F R   |   4 bit_test   0021E6 R   |   4 bit_togg   0021C4 R
  4 bitmask    002D38 R   |   4 bkslsh_t   000F7E R   |   4 bksp       0009A7 R
  2 block_bu   0016B8 GR  |   4 block_er   0007BC R   |   4 break_po   002725 R
  4 bye        002A06 R   |   4 char       00291B R   |   4 clear_ba   001505 R
  4 clear_bl   0027D5 R   |   4 clear_va   00145D R   |   4 clock_in   00008B R
  4 cloop_1    001DCF R   |   4 cmd_cons   001DA9 R   |   4 cmd_end    00254F R
  4 cmd_get    002556 R   |   4 cmd_itf    00056C R   |   4 cmd_line   001738 R
  4 cmd_name   0013B9 R   |   4 cmd_on     002409 R   |   4 cmd_size   001C46 R
  4 code_add   00332A GR  |   4 cold_sta   0000C3 R   |   4 colon_ts   000FA5 R
  4 comma_ts   000FB0 R   |   4 comp_msg   001688 R   |   4 compile    0010D6 GR
  4 conditio   001BAC R   |   4 const_cr   002DF3 R   |   4 const_cr   002DF8 R
  4 const_dd   002DEE R   |   4 const_ee   002E07 R   |   4 const_id   002DE9 R
  4 const_in   002E02 R   |   4 const_lo   001DCA R   |   4 const_od   002DE4 R
  4 const_ou   002DFD R   |   4 const_po   002DB7 R   |   4 const_po   002DBC R
  4 const_po   002DC1 R   |   4 const_po   002DC6 R   |   4 const_po   002DCB R
  4 const_po   002DD0 R   |   4 const_po   002DD5 R   |   4 const_po   002DDA R
  4 const_po   002DDF R   |   4 convert_   000DA8 R   |   4 convert_   00096B R
  4 copy_com   001006 R   |   5 count      000003 GR  |   4 cp24       0001A4 R
  4 cp24_ax    0001D6 R   |   4 cp_loop    001919 R   |   4 cpl24      0001E6 R
  4 cpy_cmd_   001152 R   |   4 cpy_quot   001192 R   |   4 create_g   000CD2 R
  4 cs_high    002F89 R   |   4 dash_tst   000FC6 R   |   4 data       002E0C R
  4 data_err   002E85 R   |   5 data_len   000009 R   |   5 data_ofs   000008 R
  5 data_ptr   000006 R   |   4 dec_base   001C25 R   |   4 decomp_l   00124B R
  4 decompil   001203 GR  |   4 del_line   000CA5 R   |   4 delete_l   000A94 R
  4 delete_n   0009B7 R   |   4 delete_u   000A59 R   |   4 digital_   002675 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Symbol Table

  4 digital_   0026AC R   |   4 div24      000323 R   |   4 divu24_8   000305 R
  4 do_loop    002D74 R   |   4 do_progr   0007AF R   |   4 edit       001F92 R
  4 enable_i   002CC8 R   |   4 eql_tst    00105B R   |   4 equal      0013AC R
  4 erase      00274D R   |   4 erase_ex   0007E0 R   |   4 erase_fl   0007D6 R
  4 err_bad_   0015E9 R   |   4 err_buf_   00165F R   |   4 err_cmd_   0015AD R
  4 err_div0   001572 R   |   4 err_dupl   0015C7 R   |   4 err_math   001559 R
  4 err_mem_   00153E R   |   4 err_msg    00151C R   |   4 err_no_a   0015F5 R
  4 err_no_d   001628 R   |   4 err_no_f   00164C R   |   4 err_no_l   001581 R
  4 err_no_p   001638 R   |   4 err_not_   0015D8 R   |   4 err_over   00166C R
  4 err_run_   001597 R   |   4 err_synt   00154B R   |   4 escaped    000DBD GR
  4 expect     001956 R   |   4 expressi   001A93 R   |   4 factor     0019B4 R
  5 farptr     000018 R   |   4 fcpu       002B04 R   |   4 fetchc     00065C R
  4 fill_wri   0027C5 R   |   4 final_te   000BF5 R   |   4 first_li   001F3C R
  5 flags      000022 GR  |   4 for        002279 R   |   4 free       001C2A R
  5 free_eep   000024 R   |   7 free_ram   000080 R   |   4 func_arg   001963 R
  4 func_eef   001D3C R   |   4 ge         0013AE R   |   4 get_addr   0017DF R
  4 get_arra   001984 R   |   4 get_char   0017F9 R   |   4 get_cmd_   0011E2 R
  4 get_code   0017C3 R   |   4 get_cons   001CC1 R   |   4 get_esca   000977 R
  4 get_int2   0017E9 R   |   4 get_targ   00239A R   |   4 get_targ   0023A8 R
  4 get_tick   002A8C R   |   4 get_toke   000F17 GR  |   4 getc       000950 GR
  4 gosub      0024AF R   |   4 gosub_1    0024BA R   |   4 gosub_2    0024C0 R
  4 goto       002495 R   |   4 goto_1     00249F R   |   4 gpio       002982 R
  4 gt         0013AA R   |   4 gt_tst     001066 R   |   4 hex_base   001C20 R
  4 hex_dump   00069C R   |   4 if         00225F R   |   5 in         000001 GR
  5 in.saved   000002 GR  |   5 in.w       000000 GR  |   4 incr_far   0008B2 R
  4 input_ex   002137 R   |   4 input_lo   0020A1 R   |   4 input_va   00209D R
  4 insert_c   000A16 R   |   4 insert_l   000CFE R   |   4 insert_l   000D6D R
  4 interp_l   001779 R   |   4 interpre   001754 R   |   4 invalid    0005B1 R
  4 invalid_   000632 R   |   4 invert     002D5E R   |   4 is_alnum   000E6B GR
  4 is_alpha   000E51 GR  |   4 is_data_   002E12 R   |   4 is_digit   000E62 GR
  4 is_symbo   000E74 R   |   4 itoa       00183C GR  |   4 itoa_loo   00185E R
  4 jp_to_ta   0024A2 R   |   4 key        002971 R   |   4 kword_di   003322 GR
  4 kword_en   002F93 R   |   4 le         0013B3 R   |   4 ledoff     000467 R
  4 ledon      000462 R   |   4 ledtoggl   00046C R   |   4 left_par   000475 R
  4 let        001C7E GR  |   4 let_arra   001C8C R   |   4 let_eval   001C94 R
  4 let_var    001C91 R   |   4 lines_sk   001F3F R   |   4 list       001EED R
  4 list_con   001CD0 R   |   4 list_exi   001F81 R   |   4 list_loo   001F5F R
  4 log2       002D0B R   |   4 look_tar   0023CB R   |   4 loop_bac   00237D R
  5 loop_dep   00001F R   |   4 loop_don   002392 R   |   4 lshift     002AAA R
  4 lt         0013B1 R   |   4 lt_tst     00108F R   |   4 mem_peek   0005CE R
  4 mod24      0003D1 R   |   4 move       001419 GR  |   4 move_dow   001438 R
  4 move_era   00073E R   |   4 move_exi   001459 R   |   4 move_lef   0009EE R
  4 move_loo   00143D R   |   4 move_prg   00077E R   |   4 move_rig   0009FC R
  4 move_up    00142A R   |   4 mul24      000259 R   |   4 mul_char   00139B R
  4 mulu24_8   000226 R   |   4 nbr_tst    000F4A R   |   4 ne         0013B6 R
  4 neg24      0001EF R   |   4 neg_acc2   000209 R   |   4 neg_ax     000201 R
  4 new        002743 R   |   4 next       002325 R   |   4 next_lin   00175C R
  4 next_tok   0017AA GR  |   4 no_match   00192B R   |   4 number     000662 R
  4 other      0010B8 R   |   4 overwrit   000C21 R   |   2 pad        0016B8 GR
  4 pad_ref    002F8E R   |   4 parse_bi   000E16 R   |   4 parse_in   000DC5 R
  4 parse_ke   000E97 R   |   4 parse_qu   000D70 R   |   4 parse_sy   000E7F R
  4 pause      002A1A R   |   4 pause02    002A2D R   |   4 peek       00223E R
  4 peek_byt   0005FC R   |   4 pin_mode   002B13 R   |   4 plus_tst   00102F R
  4 poke       00221D R   |   4 power_ad   0025E9 R   |   4 prcnt_ts   001050 R
  4 print      001FFA R   |   4 print_fa   000641 R   |   4 print_he   000C58 GR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 243.
Hexadecimal [24-Bits]

Symbol Table

  4 print_re   0004C1 R   |   4 print_st   0005C1 R   |   4 print_to   001824 R
  4 prog_siz   001E5C R   |   4 program_   001E64 R   |   4 program_   000758 R
  4 program_   00077E R   |   4 prt_acc2   001816 R   |   4 prt_basi   001FD6 R
  4 prt_i16    0017FF R   |   4 prt_loop   001FFE R   |   4 prt_peek   000444 GR
  4 prt_reg1   0004A2 R   |   4 prt_reg8   000480 R   |   4 prt_regs   0003DA GR
  5 ptr16      000019 GR  |   5 ptr8       00001A R   |   4 putc       000940 GR
  4 puts       00099D GR  |   4 qgetc      000949 GR  |   4 qkey       002975 GR
  4 qmark_ts   000FDC R   |   4 qsign      0027BE R   |   4 random     002BA2 R
  4 read       002E8A R   |   4 read01     002E8F R   |   4 read_int   003559 R
  4 readln     000AA2 GR  |   4 readln_l   000AB1 R   |   4 readln_q   000C3E R
  4 refresh_   002D06 R   |   4 regs_sta   00041D R   |   4 relation   001ACB R
  4 relop_st   00139E R   |   4 remark     00213C GR  |   4 repl       00057A R
  4 repl_exi   0005A2 R   |   4 reset_co   001FFC R   |   4 rest_con   00208D R
  4 restore    002E20 R   |   4 return     0024D5 R   |   4 right_al   001180 GR
  4 row_alig   000897 R   |   4 row_eras   000711 R   |   4 row_eras   00073E R
  4 row_loop   00067F R   |   4 rparnt_t   000F9A R   |   4 rshift     002AD7 R
  7 rsign      00007C R   |   7 rsize      00007E R   |   4 rt_msg     001676 R
  4 run        0024F3 R   |   4 run_app    000135 R   |   4 run_it     002525 R
  4 run_it_0   002527 R   |   5 rx1_head   00002E R   |   5 rx1_queu   000026 R
  5 rx1_tail   00002F R   |   4 save_app   0027E9 R   |   4 save_con   00207D R
  4 scan_blo   0008C0 R   |   4 search_c   001D65 R   |   4 search_d   00190B GR
  4 search_e   001953 R   |   4 search_l   000C7A GR  |   4 search_l   000C89 R
  4 search_n   00190F R   |   5 seedx      000014 R   |   5 seedy      000016 R
  4 select_p   002B72 R   |   4 send_esc   0009C5 R   |   4 send_par   0009D0 R
  4 set_data   002E56 R   |   4 set_time   002CA7 R   |   4 sharp_ts   000FBB R
  4 show_row   00066D R   |   4 single_c   001394 R   |   4 skip       000F04 R
  4 skip_str   0017D0 R   |   4 slash_ts   001045 R   |   4 sleep      002A0F R
  4 software   00146C R   |   4 spaces     000A0A GR  |   4 spi_clea   002F23 R
  4 spi_disa   002F0B R   |   4 spi_enab   002ED8 R   |   4 spi_rcv_   002F45 R
  4 spi_read   002F70 R   |   4 spi_sele   002F77 R   |   4 spi_send   002F2F R
  4 spi_writ   002F50 R   |   2 stack_fu   001774 GR  |   2 stack_un   001800 R
  4 star_tst   00103A R   |   4 step       0022E3 R   |   4 stop       0026F7 R
  4 store_lo   002312 R   |   4 str_matc   001938 R   |   4 str_tst    000F3A R
  4 strcmp     0013F8 R   |   4 strcpy     001409 GR  |   4 strlen     0013ED GR
  4 sub24      000187 R   |   4 symb_loo   000E80 R   |   4 syntax_e   0016A9 GR
  4 system_i   0014B2 R   |   5 tab_widt   000023 GR  |   4 tb_error   0016AB GR
  4 term       001A50 R   |   4 term01     001A58 R   |   4 term_exi   001A90 R
  4 test       0033EA R   |   4 test_p     0005B9 R   |   2 tib        001668 GR
  4 tick_tst   000FF4 R   |   5 ticks      00000F R   |   4 timeout    002CBE R
  5 timer      000012 GR  |   4 timer2_i   0000A1 R   |   4 timer4_i   0000AE R
  4 tk_id      001699 R   |   4 to         0022A3 R   |   4 to_eepro   0007A7 R
  4 to_flash   0007AC R   |   4 to_hex_c   000C6F GR  |   4 to_upper   001895 GR
  4 token_ch   0010CF R   |   4 token_ex   0010D3 R   |   4 tone       00258E R
  4 try_next   002E63 R   |   5 txtbgn     00001B GR  |   5 txtend     00001D GR
  4 uart1_ge   000950 GR  |   4 uart1_in   0008FB R   |   4 uart1_pu   000940 GR
  4 uart1_qg   000949 GR  |   4 uart1_se   00090B R   |   4 ubound     001C73 R
  4 uflash     0029B2 R   |   4 unlock_e   0006DB R   |   4 unlock_f   0006F6 R
  4 until      002D87 R   |   4 user_int   000057 R   |   4 usr        0029C7 R
  4 var_name   0011D8 GR  |   5 vars       000030 GR  |   4 wait       002142 R
  4 warm_ini   0014E3 R   |   4 warm_sta   001735 R   |   4 words      002C3D R
  4 words_co   002C91 R   |   4 write      0028D8 R   |   4 write_bl   00085C GR
  4 write_bu   000798 R   |   4 write_by   0007E2 R   |   4 write_ee   00081E R
  4 write_ex   000857 R   |   4 write_fl   000808 R   |   4 write_nb   000881 R
  2 xstack_f   001738 GR  |   2 xstack_u   001774 GR

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 244.
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

